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
      ?auto_792463 - BLOCK
    )
    :vars
    (
      ?auto_792464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792463 ?auto_792464 ) ( CLEAR ?auto_792463 ) ( HAND-EMPTY ) ( not ( = ?auto_792463 ?auto_792464 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_792463 ?auto_792464 )
      ( !PUTDOWN ?auto_792463 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_792470 - BLOCK
      ?auto_792471 - BLOCK
    )
    :vars
    (
      ?auto_792472 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_792470 ) ( ON ?auto_792471 ?auto_792472 ) ( CLEAR ?auto_792471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_792470 ) ( not ( = ?auto_792470 ?auto_792471 ) ) ( not ( = ?auto_792470 ?auto_792472 ) ) ( not ( = ?auto_792471 ?auto_792472 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_792471 ?auto_792472 )
      ( !STACK ?auto_792471 ?auto_792470 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_792480 - BLOCK
      ?auto_792481 - BLOCK
    )
    :vars
    (
      ?auto_792482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792481 ?auto_792482 ) ( not ( = ?auto_792480 ?auto_792481 ) ) ( not ( = ?auto_792480 ?auto_792482 ) ) ( not ( = ?auto_792481 ?auto_792482 ) ) ( ON ?auto_792480 ?auto_792481 ) ( CLEAR ?auto_792480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_792480 )
      ( MAKE-2PILE ?auto_792480 ?auto_792481 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_792491 - BLOCK
      ?auto_792492 - BLOCK
      ?auto_792493 - BLOCK
    )
    :vars
    (
      ?auto_792494 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_792492 ) ( ON ?auto_792493 ?auto_792494 ) ( CLEAR ?auto_792493 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_792491 ) ( ON ?auto_792492 ?auto_792491 ) ( not ( = ?auto_792491 ?auto_792492 ) ) ( not ( = ?auto_792491 ?auto_792493 ) ) ( not ( = ?auto_792491 ?auto_792494 ) ) ( not ( = ?auto_792492 ?auto_792493 ) ) ( not ( = ?auto_792492 ?auto_792494 ) ) ( not ( = ?auto_792493 ?auto_792494 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_792493 ?auto_792494 )
      ( !STACK ?auto_792493 ?auto_792492 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_792505 - BLOCK
      ?auto_792506 - BLOCK
      ?auto_792507 - BLOCK
    )
    :vars
    (
      ?auto_792508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792507 ?auto_792508 ) ( ON-TABLE ?auto_792505 ) ( not ( = ?auto_792505 ?auto_792506 ) ) ( not ( = ?auto_792505 ?auto_792507 ) ) ( not ( = ?auto_792505 ?auto_792508 ) ) ( not ( = ?auto_792506 ?auto_792507 ) ) ( not ( = ?auto_792506 ?auto_792508 ) ) ( not ( = ?auto_792507 ?auto_792508 ) ) ( CLEAR ?auto_792505 ) ( ON ?auto_792506 ?auto_792507 ) ( CLEAR ?auto_792506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_792505 ?auto_792506 )
      ( MAKE-3PILE ?auto_792505 ?auto_792506 ?auto_792507 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_792519 - BLOCK
      ?auto_792520 - BLOCK
      ?auto_792521 - BLOCK
    )
    :vars
    (
      ?auto_792522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792521 ?auto_792522 ) ( not ( = ?auto_792519 ?auto_792520 ) ) ( not ( = ?auto_792519 ?auto_792521 ) ) ( not ( = ?auto_792519 ?auto_792522 ) ) ( not ( = ?auto_792520 ?auto_792521 ) ) ( not ( = ?auto_792520 ?auto_792522 ) ) ( not ( = ?auto_792521 ?auto_792522 ) ) ( ON ?auto_792520 ?auto_792521 ) ( ON ?auto_792519 ?auto_792520 ) ( CLEAR ?auto_792519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_792519 )
      ( MAKE-3PILE ?auto_792519 ?auto_792520 ?auto_792521 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_792534 - BLOCK
      ?auto_792535 - BLOCK
      ?auto_792536 - BLOCK
      ?auto_792537 - BLOCK
    )
    :vars
    (
      ?auto_792538 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_792536 ) ( ON ?auto_792537 ?auto_792538 ) ( CLEAR ?auto_792537 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_792534 ) ( ON ?auto_792535 ?auto_792534 ) ( ON ?auto_792536 ?auto_792535 ) ( not ( = ?auto_792534 ?auto_792535 ) ) ( not ( = ?auto_792534 ?auto_792536 ) ) ( not ( = ?auto_792534 ?auto_792537 ) ) ( not ( = ?auto_792534 ?auto_792538 ) ) ( not ( = ?auto_792535 ?auto_792536 ) ) ( not ( = ?auto_792535 ?auto_792537 ) ) ( not ( = ?auto_792535 ?auto_792538 ) ) ( not ( = ?auto_792536 ?auto_792537 ) ) ( not ( = ?auto_792536 ?auto_792538 ) ) ( not ( = ?auto_792537 ?auto_792538 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_792537 ?auto_792538 )
      ( !STACK ?auto_792537 ?auto_792536 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_792552 - BLOCK
      ?auto_792553 - BLOCK
      ?auto_792554 - BLOCK
      ?auto_792555 - BLOCK
    )
    :vars
    (
      ?auto_792556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792555 ?auto_792556 ) ( ON-TABLE ?auto_792552 ) ( ON ?auto_792553 ?auto_792552 ) ( not ( = ?auto_792552 ?auto_792553 ) ) ( not ( = ?auto_792552 ?auto_792554 ) ) ( not ( = ?auto_792552 ?auto_792555 ) ) ( not ( = ?auto_792552 ?auto_792556 ) ) ( not ( = ?auto_792553 ?auto_792554 ) ) ( not ( = ?auto_792553 ?auto_792555 ) ) ( not ( = ?auto_792553 ?auto_792556 ) ) ( not ( = ?auto_792554 ?auto_792555 ) ) ( not ( = ?auto_792554 ?auto_792556 ) ) ( not ( = ?auto_792555 ?auto_792556 ) ) ( CLEAR ?auto_792553 ) ( ON ?auto_792554 ?auto_792555 ) ( CLEAR ?auto_792554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_792552 ?auto_792553 ?auto_792554 )
      ( MAKE-4PILE ?auto_792552 ?auto_792553 ?auto_792554 ?auto_792555 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_792570 - BLOCK
      ?auto_792571 - BLOCK
      ?auto_792572 - BLOCK
      ?auto_792573 - BLOCK
    )
    :vars
    (
      ?auto_792574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792573 ?auto_792574 ) ( ON-TABLE ?auto_792570 ) ( not ( = ?auto_792570 ?auto_792571 ) ) ( not ( = ?auto_792570 ?auto_792572 ) ) ( not ( = ?auto_792570 ?auto_792573 ) ) ( not ( = ?auto_792570 ?auto_792574 ) ) ( not ( = ?auto_792571 ?auto_792572 ) ) ( not ( = ?auto_792571 ?auto_792573 ) ) ( not ( = ?auto_792571 ?auto_792574 ) ) ( not ( = ?auto_792572 ?auto_792573 ) ) ( not ( = ?auto_792572 ?auto_792574 ) ) ( not ( = ?auto_792573 ?auto_792574 ) ) ( ON ?auto_792572 ?auto_792573 ) ( CLEAR ?auto_792570 ) ( ON ?auto_792571 ?auto_792572 ) ( CLEAR ?auto_792571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_792570 ?auto_792571 )
      ( MAKE-4PILE ?auto_792570 ?auto_792571 ?auto_792572 ?auto_792573 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_792588 - BLOCK
      ?auto_792589 - BLOCK
      ?auto_792590 - BLOCK
      ?auto_792591 - BLOCK
    )
    :vars
    (
      ?auto_792592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792591 ?auto_792592 ) ( not ( = ?auto_792588 ?auto_792589 ) ) ( not ( = ?auto_792588 ?auto_792590 ) ) ( not ( = ?auto_792588 ?auto_792591 ) ) ( not ( = ?auto_792588 ?auto_792592 ) ) ( not ( = ?auto_792589 ?auto_792590 ) ) ( not ( = ?auto_792589 ?auto_792591 ) ) ( not ( = ?auto_792589 ?auto_792592 ) ) ( not ( = ?auto_792590 ?auto_792591 ) ) ( not ( = ?auto_792590 ?auto_792592 ) ) ( not ( = ?auto_792591 ?auto_792592 ) ) ( ON ?auto_792590 ?auto_792591 ) ( ON ?auto_792589 ?auto_792590 ) ( ON ?auto_792588 ?auto_792589 ) ( CLEAR ?auto_792588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_792588 )
      ( MAKE-4PILE ?auto_792588 ?auto_792589 ?auto_792590 ?auto_792591 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_792607 - BLOCK
      ?auto_792608 - BLOCK
      ?auto_792609 - BLOCK
      ?auto_792610 - BLOCK
      ?auto_792611 - BLOCK
    )
    :vars
    (
      ?auto_792612 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_792610 ) ( ON ?auto_792611 ?auto_792612 ) ( CLEAR ?auto_792611 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_792607 ) ( ON ?auto_792608 ?auto_792607 ) ( ON ?auto_792609 ?auto_792608 ) ( ON ?auto_792610 ?auto_792609 ) ( not ( = ?auto_792607 ?auto_792608 ) ) ( not ( = ?auto_792607 ?auto_792609 ) ) ( not ( = ?auto_792607 ?auto_792610 ) ) ( not ( = ?auto_792607 ?auto_792611 ) ) ( not ( = ?auto_792607 ?auto_792612 ) ) ( not ( = ?auto_792608 ?auto_792609 ) ) ( not ( = ?auto_792608 ?auto_792610 ) ) ( not ( = ?auto_792608 ?auto_792611 ) ) ( not ( = ?auto_792608 ?auto_792612 ) ) ( not ( = ?auto_792609 ?auto_792610 ) ) ( not ( = ?auto_792609 ?auto_792611 ) ) ( not ( = ?auto_792609 ?auto_792612 ) ) ( not ( = ?auto_792610 ?auto_792611 ) ) ( not ( = ?auto_792610 ?auto_792612 ) ) ( not ( = ?auto_792611 ?auto_792612 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_792611 ?auto_792612 )
      ( !STACK ?auto_792611 ?auto_792610 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_792629 - BLOCK
      ?auto_792630 - BLOCK
      ?auto_792631 - BLOCK
      ?auto_792632 - BLOCK
      ?auto_792633 - BLOCK
    )
    :vars
    (
      ?auto_792634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792633 ?auto_792634 ) ( ON-TABLE ?auto_792629 ) ( ON ?auto_792630 ?auto_792629 ) ( ON ?auto_792631 ?auto_792630 ) ( not ( = ?auto_792629 ?auto_792630 ) ) ( not ( = ?auto_792629 ?auto_792631 ) ) ( not ( = ?auto_792629 ?auto_792632 ) ) ( not ( = ?auto_792629 ?auto_792633 ) ) ( not ( = ?auto_792629 ?auto_792634 ) ) ( not ( = ?auto_792630 ?auto_792631 ) ) ( not ( = ?auto_792630 ?auto_792632 ) ) ( not ( = ?auto_792630 ?auto_792633 ) ) ( not ( = ?auto_792630 ?auto_792634 ) ) ( not ( = ?auto_792631 ?auto_792632 ) ) ( not ( = ?auto_792631 ?auto_792633 ) ) ( not ( = ?auto_792631 ?auto_792634 ) ) ( not ( = ?auto_792632 ?auto_792633 ) ) ( not ( = ?auto_792632 ?auto_792634 ) ) ( not ( = ?auto_792633 ?auto_792634 ) ) ( CLEAR ?auto_792631 ) ( ON ?auto_792632 ?auto_792633 ) ( CLEAR ?auto_792632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_792629 ?auto_792630 ?auto_792631 ?auto_792632 )
      ( MAKE-5PILE ?auto_792629 ?auto_792630 ?auto_792631 ?auto_792632 ?auto_792633 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_792651 - BLOCK
      ?auto_792652 - BLOCK
      ?auto_792653 - BLOCK
      ?auto_792654 - BLOCK
      ?auto_792655 - BLOCK
    )
    :vars
    (
      ?auto_792656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792655 ?auto_792656 ) ( ON-TABLE ?auto_792651 ) ( ON ?auto_792652 ?auto_792651 ) ( not ( = ?auto_792651 ?auto_792652 ) ) ( not ( = ?auto_792651 ?auto_792653 ) ) ( not ( = ?auto_792651 ?auto_792654 ) ) ( not ( = ?auto_792651 ?auto_792655 ) ) ( not ( = ?auto_792651 ?auto_792656 ) ) ( not ( = ?auto_792652 ?auto_792653 ) ) ( not ( = ?auto_792652 ?auto_792654 ) ) ( not ( = ?auto_792652 ?auto_792655 ) ) ( not ( = ?auto_792652 ?auto_792656 ) ) ( not ( = ?auto_792653 ?auto_792654 ) ) ( not ( = ?auto_792653 ?auto_792655 ) ) ( not ( = ?auto_792653 ?auto_792656 ) ) ( not ( = ?auto_792654 ?auto_792655 ) ) ( not ( = ?auto_792654 ?auto_792656 ) ) ( not ( = ?auto_792655 ?auto_792656 ) ) ( ON ?auto_792654 ?auto_792655 ) ( CLEAR ?auto_792652 ) ( ON ?auto_792653 ?auto_792654 ) ( CLEAR ?auto_792653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_792651 ?auto_792652 ?auto_792653 )
      ( MAKE-5PILE ?auto_792651 ?auto_792652 ?auto_792653 ?auto_792654 ?auto_792655 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_792673 - BLOCK
      ?auto_792674 - BLOCK
      ?auto_792675 - BLOCK
      ?auto_792676 - BLOCK
      ?auto_792677 - BLOCK
    )
    :vars
    (
      ?auto_792678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792677 ?auto_792678 ) ( ON-TABLE ?auto_792673 ) ( not ( = ?auto_792673 ?auto_792674 ) ) ( not ( = ?auto_792673 ?auto_792675 ) ) ( not ( = ?auto_792673 ?auto_792676 ) ) ( not ( = ?auto_792673 ?auto_792677 ) ) ( not ( = ?auto_792673 ?auto_792678 ) ) ( not ( = ?auto_792674 ?auto_792675 ) ) ( not ( = ?auto_792674 ?auto_792676 ) ) ( not ( = ?auto_792674 ?auto_792677 ) ) ( not ( = ?auto_792674 ?auto_792678 ) ) ( not ( = ?auto_792675 ?auto_792676 ) ) ( not ( = ?auto_792675 ?auto_792677 ) ) ( not ( = ?auto_792675 ?auto_792678 ) ) ( not ( = ?auto_792676 ?auto_792677 ) ) ( not ( = ?auto_792676 ?auto_792678 ) ) ( not ( = ?auto_792677 ?auto_792678 ) ) ( ON ?auto_792676 ?auto_792677 ) ( ON ?auto_792675 ?auto_792676 ) ( CLEAR ?auto_792673 ) ( ON ?auto_792674 ?auto_792675 ) ( CLEAR ?auto_792674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_792673 ?auto_792674 )
      ( MAKE-5PILE ?auto_792673 ?auto_792674 ?auto_792675 ?auto_792676 ?auto_792677 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_792695 - BLOCK
      ?auto_792696 - BLOCK
      ?auto_792697 - BLOCK
      ?auto_792698 - BLOCK
      ?auto_792699 - BLOCK
    )
    :vars
    (
      ?auto_792700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792699 ?auto_792700 ) ( not ( = ?auto_792695 ?auto_792696 ) ) ( not ( = ?auto_792695 ?auto_792697 ) ) ( not ( = ?auto_792695 ?auto_792698 ) ) ( not ( = ?auto_792695 ?auto_792699 ) ) ( not ( = ?auto_792695 ?auto_792700 ) ) ( not ( = ?auto_792696 ?auto_792697 ) ) ( not ( = ?auto_792696 ?auto_792698 ) ) ( not ( = ?auto_792696 ?auto_792699 ) ) ( not ( = ?auto_792696 ?auto_792700 ) ) ( not ( = ?auto_792697 ?auto_792698 ) ) ( not ( = ?auto_792697 ?auto_792699 ) ) ( not ( = ?auto_792697 ?auto_792700 ) ) ( not ( = ?auto_792698 ?auto_792699 ) ) ( not ( = ?auto_792698 ?auto_792700 ) ) ( not ( = ?auto_792699 ?auto_792700 ) ) ( ON ?auto_792698 ?auto_792699 ) ( ON ?auto_792697 ?auto_792698 ) ( ON ?auto_792696 ?auto_792697 ) ( ON ?auto_792695 ?auto_792696 ) ( CLEAR ?auto_792695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_792695 )
      ( MAKE-5PILE ?auto_792695 ?auto_792696 ?auto_792697 ?auto_792698 ?auto_792699 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_792718 - BLOCK
      ?auto_792719 - BLOCK
      ?auto_792720 - BLOCK
      ?auto_792721 - BLOCK
      ?auto_792722 - BLOCK
      ?auto_792723 - BLOCK
    )
    :vars
    (
      ?auto_792724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_792722 ) ( ON ?auto_792723 ?auto_792724 ) ( CLEAR ?auto_792723 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_792718 ) ( ON ?auto_792719 ?auto_792718 ) ( ON ?auto_792720 ?auto_792719 ) ( ON ?auto_792721 ?auto_792720 ) ( ON ?auto_792722 ?auto_792721 ) ( not ( = ?auto_792718 ?auto_792719 ) ) ( not ( = ?auto_792718 ?auto_792720 ) ) ( not ( = ?auto_792718 ?auto_792721 ) ) ( not ( = ?auto_792718 ?auto_792722 ) ) ( not ( = ?auto_792718 ?auto_792723 ) ) ( not ( = ?auto_792718 ?auto_792724 ) ) ( not ( = ?auto_792719 ?auto_792720 ) ) ( not ( = ?auto_792719 ?auto_792721 ) ) ( not ( = ?auto_792719 ?auto_792722 ) ) ( not ( = ?auto_792719 ?auto_792723 ) ) ( not ( = ?auto_792719 ?auto_792724 ) ) ( not ( = ?auto_792720 ?auto_792721 ) ) ( not ( = ?auto_792720 ?auto_792722 ) ) ( not ( = ?auto_792720 ?auto_792723 ) ) ( not ( = ?auto_792720 ?auto_792724 ) ) ( not ( = ?auto_792721 ?auto_792722 ) ) ( not ( = ?auto_792721 ?auto_792723 ) ) ( not ( = ?auto_792721 ?auto_792724 ) ) ( not ( = ?auto_792722 ?auto_792723 ) ) ( not ( = ?auto_792722 ?auto_792724 ) ) ( not ( = ?auto_792723 ?auto_792724 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_792723 ?auto_792724 )
      ( !STACK ?auto_792723 ?auto_792722 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_792744 - BLOCK
      ?auto_792745 - BLOCK
      ?auto_792746 - BLOCK
      ?auto_792747 - BLOCK
      ?auto_792748 - BLOCK
      ?auto_792749 - BLOCK
    )
    :vars
    (
      ?auto_792750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792749 ?auto_792750 ) ( ON-TABLE ?auto_792744 ) ( ON ?auto_792745 ?auto_792744 ) ( ON ?auto_792746 ?auto_792745 ) ( ON ?auto_792747 ?auto_792746 ) ( not ( = ?auto_792744 ?auto_792745 ) ) ( not ( = ?auto_792744 ?auto_792746 ) ) ( not ( = ?auto_792744 ?auto_792747 ) ) ( not ( = ?auto_792744 ?auto_792748 ) ) ( not ( = ?auto_792744 ?auto_792749 ) ) ( not ( = ?auto_792744 ?auto_792750 ) ) ( not ( = ?auto_792745 ?auto_792746 ) ) ( not ( = ?auto_792745 ?auto_792747 ) ) ( not ( = ?auto_792745 ?auto_792748 ) ) ( not ( = ?auto_792745 ?auto_792749 ) ) ( not ( = ?auto_792745 ?auto_792750 ) ) ( not ( = ?auto_792746 ?auto_792747 ) ) ( not ( = ?auto_792746 ?auto_792748 ) ) ( not ( = ?auto_792746 ?auto_792749 ) ) ( not ( = ?auto_792746 ?auto_792750 ) ) ( not ( = ?auto_792747 ?auto_792748 ) ) ( not ( = ?auto_792747 ?auto_792749 ) ) ( not ( = ?auto_792747 ?auto_792750 ) ) ( not ( = ?auto_792748 ?auto_792749 ) ) ( not ( = ?auto_792748 ?auto_792750 ) ) ( not ( = ?auto_792749 ?auto_792750 ) ) ( CLEAR ?auto_792747 ) ( ON ?auto_792748 ?auto_792749 ) ( CLEAR ?auto_792748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_792744 ?auto_792745 ?auto_792746 ?auto_792747 ?auto_792748 )
      ( MAKE-6PILE ?auto_792744 ?auto_792745 ?auto_792746 ?auto_792747 ?auto_792748 ?auto_792749 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_792770 - BLOCK
      ?auto_792771 - BLOCK
      ?auto_792772 - BLOCK
      ?auto_792773 - BLOCK
      ?auto_792774 - BLOCK
      ?auto_792775 - BLOCK
    )
    :vars
    (
      ?auto_792776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792775 ?auto_792776 ) ( ON-TABLE ?auto_792770 ) ( ON ?auto_792771 ?auto_792770 ) ( ON ?auto_792772 ?auto_792771 ) ( not ( = ?auto_792770 ?auto_792771 ) ) ( not ( = ?auto_792770 ?auto_792772 ) ) ( not ( = ?auto_792770 ?auto_792773 ) ) ( not ( = ?auto_792770 ?auto_792774 ) ) ( not ( = ?auto_792770 ?auto_792775 ) ) ( not ( = ?auto_792770 ?auto_792776 ) ) ( not ( = ?auto_792771 ?auto_792772 ) ) ( not ( = ?auto_792771 ?auto_792773 ) ) ( not ( = ?auto_792771 ?auto_792774 ) ) ( not ( = ?auto_792771 ?auto_792775 ) ) ( not ( = ?auto_792771 ?auto_792776 ) ) ( not ( = ?auto_792772 ?auto_792773 ) ) ( not ( = ?auto_792772 ?auto_792774 ) ) ( not ( = ?auto_792772 ?auto_792775 ) ) ( not ( = ?auto_792772 ?auto_792776 ) ) ( not ( = ?auto_792773 ?auto_792774 ) ) ( not ( = ?auto_792773 ?auto_792775 ) ) ( not ( = ?auto_792773 ?auto_792776 ) ) ( not ( = ?auto_792774 ?auto_792775 ) ) ( not ( = ?auto_792774 ?auto_792776 ) ) ( not ( = ?auto_792775 ?auto_792776 ) ) ( ON ?auto_792774 ?auto_792775 ) ( CLEAR ?auto_792772 ) ( ON ?auto_792773 ?auto_792774 ) ( CLEAR ?auto_792773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_792770 ?auto_792771 ?auto_792772 ?auto_792773 )
      ( MAKE-6PILE ?auto_792770 ?auto_792771 ?auto_792772 ?auto_792773 ?auto_792774 ?auto_792775 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_792796 - BLOCK
      ?auto_792797 - BLOCK
      ?auto_792798 - BLOCK
      ?auto_792799 - BLOCK
      ?auto_792800 - BLOCK
      ?auto_792801 - BLOCK
    )
    :vars
    (
      ?auto_792802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792801 ?auto_792802 ) ( ON-TABLE ?auto_792796 ) ( ON ?auto_792797 ?auto_792796 ) ( not ( = ?auto_792796 ?auto_792797 ) ) ( not ( = ?auto_792796 ?auto_792798 ) ) ( not ( = ?auto_792796 ?auto_792799 ) ) ( not ( = ?auto_792796 ?auto_792800 ) ) ( not ( = ?auto_792796 ?auto_792801 ) ) ( not ( = ?auto_792796 ?auto_792802 ) ) ( not ( = ?auto_792797 ?auto_792798 ) ) ( not ( = ?auto_792797 ?auto_792799 ) ) ( not ( = ?auto_792797 ?auto_792800 ) ) ( not ( = ?auto_792797 ?auto_792801 ) ) ( not ( = ?auto_792797 ?auto_792802 ) ) ( not ( = ?auto_792798 ?auto_792799 ) ) ( not ( = ?auto_792798 ?auto_792800 ) ) ( not ( = ?auto_792798 ?auto_792801 ) ) ( not ( = ?auto_792798 ?auto_792802 ) ) ( not ( = ?auto_792799 ?auto_792800 ) ) ( not ( = ?auto_792799 ?auto_792801 ) ) ( not ( = ?auto_792799 ?auto_792802 ) ) ( not ( = ?auto_792800 ?auto_792801 ) ) ( not ( = ?auto_792800 ?auto_792802 ) ) ( not ( = ?auto_792801 ?auto_792802 ) ) ( ON ?auto_792800 ?auto_792801 ) ( ON ?auto_792799 ?auto_792800 ) ( CLEAR ?auto_792797 ) ( ON ?auto_792798 ?auto_792799 ) ( CLEAR ?auto_792798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_792796 ?auto_792797 ?auto_792798 )
      ( MAKE-6PILE ?auto_792796 ?auto_792797 ?auto_792798 ?auto_792799 ?auto_792800 ?auto_792801 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_792822 - BLOCK
      ?auto_792823 - BLOCK
      ?auto_792824 - BLOCK
      ?auto_792825 - BLOCK
      ?auto_792826 - BLOCK
      ?auto_792827 - BLOCK
    )
    :vars
    (
      ?auto_792828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792827 ?auto_792828 ) ( ON-TABLE ?auto_792822 ) ( not ( = ?auto_792822 ?auto_792823 ) ) ( not ( = ?auto_792822 ?auto_792824 ) ) ( not ( = ?auto_792822 ?auto_792825 ) ) ( not ( = ?auto_792822 ?auto_792826 ) ) ( not ( = ?auto_792822 ?auto_792827 ) ) ( not ( = ?auto_792822 ?auto_792828 ) ) ( not ( = ?auto_792823 ?auto_792824 ) ) ( not ( = ?auto_792823 ?auto_792825 ) ) ( not ( = ?auto_792823 ?auto_792826 ) ) ( not ( = ?auto_792823 ?auto_792827 ) ) ( not ( = ?auto_792823 ?auto_792828 ) ) ( not ( = ?auto_792824 ?auto_792825 ) ) ( not ( = ?auto_792824 ?auto_792826 ) ) ( not ( = ?auto_792824 ?auto_792827 ) ) ( not ( = ?auto_792824 ?auto_792828 ) ) ( not ( = ?auto_792825 ?auto_792826 ) ) ( not ( = ?auto_792825 ?auto_792827 ) ) ( not ( = ?auto_792825 ?auto_792828 ) ) ( not ( = ?auto_792826 ?auto_792827 ) ) ( not ( = ?auto_792826 ?auto_792828 ) ) ( not ( = ?auto_792827 ?auto_792828 ) ) ( ON ?auto_792826 ?auto_792827 ) ( ON ?auto_792825 ?auto_792826 ) ( ON ?auto_792824 ?auto_792825 ) ( CLEAR ?auto_792822 ) ( ON ?auto_792823 ?auto_792824 ) ( CLEAR ?auto_792823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_792822 ?auto_792823 )
      ( MAKE-6PILE ?auto_792822 ?auto_792823 ?auto_792824 ?auto_792825 ?auto_792826 ?auto_792827 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_792848 - BLOCK
      ?auto_792849 - BLOCK
      ?auto_792850 - BLOCK
      ?auto_792851 - BLOCK
      ?auto_792852 - BLOCK
      ?auto_792853 - BLOCK
    )
    :vars
    (
      ?auto_792854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792853 ?auto_792854 ) ( not ( = ?auto_792848 ?auto_792849 ) ) ( not ( = ?auto_792848 ?auto_792850 ) ) ( not ( = ?auto_792848 ?auto_792851 ) ) ( not ( = ?auto_792848 ?auto_792852 ) ) ( not ( = ?auto_792848 ?auto_792853 ) ) ( not ( = ?auto_792848 ?auto_792854 ) ) ( not ( = ?auto_792849 ?auto_792850 ) ) ( not ( = ?auto_792849 ?auto_792851 ) ) ( not ( = ?auto_792849 ?auto_792852 ) ) ( not ( = ?auto_792849 ?auto_792853 ) ) ( not ( = ?auto_792849 ?auto_792854 ) ) ( not ( = ?auto_792850 ?auto_792851 ) ) ( not ( = ?auto_792850 ?auto_792852 ) ) ( not ( = ?auto_792850 ?auto_792853 ) ) ( not ( = ?auto_792850 ?auto_792854 ) ) ( not ( = ?auto_792851 ?auto_792852 ) ) ( not ( = ?auto_792851 ?auto_792853 ) ) ( not ( = ?auto_792851 ?auto_792854 ) ) ( not ( = ?auto_792852 ?auto_792853 ) ) ( not ( = ?auto_792852 ?auto_792854 ) ) ( not ( = ?auto_792853 ?auto_792854 ) ) ( ON ?auto_792852 ?auto_792853 ) ( ON ?auto_792851 ?auto_792852 ) ( ON ?auto_792850 ?auto_792851 ) ( ON ?auto_792849 ?auto_792850 ) ( ON ?auto_792848 ?auto_792849 ) ( CLEAR ?auto_792848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_792848 )
      ( MAKE-6PILE ?auto_792848 ?auto_792849 ?auto_792850 ?auto_792851 ?auto_792852 ?auto_792853 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_792875 - BLOCK
      ?auto_792876 - BLOCK
      ?auto_792877 - BLOCK
      ?auto_792878 - BLOCK
      ?auto_792879 - BLOCK
      ?auto_792880 - BLOCK
      ?auto_792881 - BLOCK
    )
    :vars
    (
      ?auto_792882 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_792880 ) ( ON ?auto_792881 ?auto_792882 ) ( CLEAR ?auto_792881 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_792875 ) ( ON ?auto_792876 ?auto_792875 ) ( ON ?auto_792877 ?auto_792876 ) ( ON ?auto_792878 ?auto_792877 ) ( ON ?auto_792879 ?auto_792878 ) ( ON ?auto_792880 ?auto_792879 ) ( not ( = ?auto_792875 ?auto_792876 ) ) ( not ( = ?auto_792875 ?auto_792877 ) ) ( not ( = ?auto_792875 ?auto_792878 ) ) ( not ( = ?auto_792875 ?auto_792879 ) ) ( not ( = ?auto_792875 ?auto_792880 ) ) ( not ( = ?auto_792875 ?auto_792881 ) ) ( not ( = ?auto_792875 ?auto_792882 ) ) ( not ( = ?auto_792876 ?auto_792877 ) ) ( not ( = ?auto_792876 ?auto_792878 ) ) ( not ( = ?auto_792876 ?auto_792879 ) ) ( not ( = ?auto_792876 ?auto_792880 ) ) ( not ( = ?auto_792876 ?auto_792881 ) ) ( not ( = ?auto_792876 ?auto_792882 ) ) ( not ( = ?auto_792877 ?auto_792878 ) ) ( not ( = ?auto_792877 ?auto_792879 ) ) ( not ( = ?auto_792877 ?auto_792880 ) ) ( not ( = ?auto_792877 ?auto_792881 ) ) ( not ( = ?auto_792877 ?auto_792882 ) ) ( not ( = ?auto_792878 ?auto_792879 ) ) ( not ( = ?auto_792878 ?auto_792880 ) ) ( not ( = ?auto_792878 ?auto_792881 ) ) ( not ( = ?auto_792878 ?auto_792882 ) ) ( not ( = ?auto_792879 ?auto_792880 ) ) ( not ( = ?auto_792879 ?auto_792881 ) ) ( not ( = ?auto_792879 ?auto_792882 ) ) ( not ( = ?auto_792880 ?auto_792881 ) ) ( not ( = ?auto_792880 ?auto_792882 ) ) ( not ( = ?auto_792881 ?auto_792882 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_792881 ?auto_792882 )
      ( !STACK ?auto_792881 ?auto_792880 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_792905 - BLOCK
      ?auto_792906 - BLOCK
      ?auto_792907 - BLOCK
      ?auto_792908 - BLOCK
      ?auto_792909 - BLOCK
      ?auto_792910 - BLOCK
      ?auto_792911 - BLOCK
    )
    :vars
    (
      ?auto_792912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792911 ?auto_792912 ) ( ON-TABLE ?auto_792905 ) ( ON ?auto_792906 ?auto_792905 ) ( ON ?auto_792907 ?auto_792906 ) ( ON ?auto_792908 ?auto_792907 ) ( ON ?auto_792909 ?auto_792908 ) ( not ( = ?auto_792905 ?auto_792906 ) ) ( not ( = ?auto_792905 ?auto_792907 ) ) ( not ( = ?auto_792905 ?auto_792908 ) ) ( not ( = ?auto_792905 ?auto_792909 ) ) ( not ( = ?auto_792905 ?auto_792910 ) ) ( not ( = ?auto_792905 ?auto_792911 ) ) ( not ( = ?auto_792905 ?auto_792912 ) ) ( not ( = ?auto_792906 ?auto_792907 ) ) ( not ( = ?auto_792906 ?auto_792908 ) ) ( not ( = ?auto_792906 ?auto_792909 ) ) ( not ( = ?auto_792906 ?auto_792910 ) ) ( not ( = ?auto_792906 ?auto_792911 ) ) ( not ( = ?auto_792906 ?auto_792912 ) ) ( not ( = ?auto_792907 ?auto_792908 ) ) ( not ( = ?auto_792907 ?auto_792909 ) ) ( not ( = ?auto_792907 ?auto_792910 ) ) ( not ( = ?auto_792907 ?auto_792911 ) ) ( not ( = ?auto_792907 ?auto_792912 ) ) ( not ( = ?auto_792908 ?auto_792909 ) ) ( not ( = ?auto_792908 ?auto_792910 ) ) ( not ( = ?auto_792908 ?auto_792911 ) ) ( not ( = ?auto_792908 ?auto_792912 ) ) ( not ( = ?auto_792909 ?auto_792910 ) ) ( not ( = ?auto_792909 ?auto_792911 ) ) ( not ( = ?auto_792909 ?auto_792912 ) ) ( not ( = ?auto_792910 ?auto_792911 ) ) ( not ( = ?auto_792910 ?auto_792912 ) ) ( not ( = ?auto_792911 ?auto_792912 ) ) ( CLEAR ?auto_792909 ) ( ON ?auto_792910 ?auto_792911 ) ( CLEAR ?auto_792910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_792905 ?auto_792906 ?auto_792907 ?auto_792908 ?auto_792909 ?auto_792910 )
      ( MAKE-7PILE ?auto_792905 ?auto_792906 ?auto_792907 ?auto_792908 ?auto_792909 ?auto_792910 ?auto_792911 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_792935 - BLOCK
      ?auto_792936 - BLOCK
      ?auto_792937 - BLOCK
      ?auto_792938 - BLOCK
      ?auto_792939 - BLOCK
      ?auto_792940 - BLOCK
      ?auto_792941 - BLOCK
    )
    :vars
    (
      ?auto_792942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792941 ?auto_792942 ) ( ON-TABLE ?auto_792935 ) ( ON ?auto_792936 ?auto_792935 ) ( ON ?auto_792937 ?auto_792936 ) ( ON ?auto_792938 ?auto_792937 ) ( not ( = ?auto_792935 ?auto_792936 ) ) ( not ( = ?auto_792935 ?auto_792937 ) ) ( not ( = ?auto_792935 ?auto_792938 ) ) ( not ( = ?auto_792935 ?auto_792939 ) ) ( not ( = ?auto_792935 ?auto_792940 ) ) ( not ( = ?auto_792935 ?auto_792941 ) ) ( not ( = ?auto_792935 ?auto_792942 ) ) ( not ( = ?auto_792936 ?auto_792937 ) ) ( not ( = ?auto_792936 ?auto_792938 ) ) ( not ( = ?auto_792936 ?auto_792939 ) ) ( not ( = ?auto_792936 ?auto_792940 ) ) ( not ( = ?auto_792936 ?auto_792941 ) ) ( not ( = ?auto_792936 ?auto_792942 ) ) ( not ( = ?auto_792937 ?auto_792938 ) ) ( not ( = ?auto_792937 ?auto_792939 ) ) ( not ( = ?auto_792937 ?auto_792940 ) ) ( not ( = ?auto_792937 ?auto_792941 ) ) ( not ( = ?auto_792937 ?auto_792942 ) ) ( not ( = ?auto_792938 ?auto_792939 ) ) ( not ( = ?auto_792938 ?auto_792940 ) ) ( not ( = ?auto_792938 ?auto_792941 ) ) ( not ( = ?auto_792938 ?auto_792942 ) ) ( not ( = ?auto_792939 ?auto_792940 ) ) ( not ( = ?auto_792939 ?auto_792941 ) ) ( not ( = ?auto_792939 ?auto_792942 ) ) ( not ( = ?auto_792940 ?auto_792941 ) ) ( not ( = ?auto_792940 ?auto_792942 ) ) ( not ( = ?auto_792941 ?auto_792942 ) ) ( ON ?auto_792940 ?auto_792941 ) ( CLEAR ?auto_792938 ) ( ON ?auto_792939 ?auto_792940 ) ( CLEAR ?auto_792939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_792935 ?auto_792936 ?auto_792937 ?auto_792938 ?auto_792939 )
      ( MAKE-7PILE ?auto_792935 ?auto_792936 ?auto_792937 ?auto_792938 ?auto_792939 ?auto_792940 ?auto_792941 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_792965 - BLOCK
      ?auto_792966 - BLOCK
      ?auto_792967 - BLOCK
      ?auto_792968 - BLOCK
      ?auto_792969 - BLOCK
      ?auto_792970 - BLOCK
      ?auto_792971 - BLOCK
    )
    :vars
    (
      ?auto_792972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792971 ?auto_792972 ) ( ON-TABLE ?auto_792965 ) ( ON ?auto_792966 ?auto_792965 ) ( ON ?auto_792967 ?auto_792966 ) ( not ( = ?auto_792965 ?auto_792966 ) ) ( not ( = ?auto_792965 ?auto_792967 ) ) ( not ( = ?auto_792965 ?auto_792968 ) ) ( not ( = ?auto_792965 ?auto_792969 ) ) ( not ( = ?auto_792965 ?auto_792970 ) ) ( not ( = ?auto_792965 ?auto_792971 ) ) ( not ( = ?auto_792965 ?auto_792972 ) ) ( not ( = ?auto_792966 ?auto_792967 ) ) ( not ( = ?auto_792966 ?auto_792968 ) ) ( not ( = ?auto_792966 ?auto_792969 ) ) ( not ( = ?auto_792966 ?auto_792970 ) ) ( not ( = ?auto_792966 ?auto_792971 ) ) ( not ( = ?auto_792966 ?auto_792972 ) ) ( not ( = ?auto_792967 ?auto_792968 ) ) ( not ( = ?auto_792967 ?auto_792969 ) ) ( not ( = ?auto_792967 ?auto_792970 ) ) ( not ( = ?auto_792967 ?auto_792971 ) ) ( not ( = ?auto_792967 ?auto_792972 ) ) ( not ( = ?auto_792968 ?auto_792969 ) ) ( not ( = ?auto_792968 ?auto_792970 ) ) ( not ( = ?auto_792968 ?auto_792971 ) ) ( not ( = ?auto_792968 ?auto_792972 ) ) ( not ( = ?auto_792969 ?auto_792970 ) ) ( not ( = ?auto_792969 ?auto_792971 ) ) ( not ( = ?auto_792969 ?auto_792972 ) ) ( not ( = ?auto_792970 ?auto_792971 ) ) ( not ( = ?auto_792970 ?auto_792972 ) ) ( not ( = ?auto_792971 ?auto_792972 ) ) ( ON ?auto_792970 ?auto_792971 ) ( ON ?auto_792969 ?auto_792970 ) ( CLEAR ?auto_792967 ) ( ON ?auto_792968 ?auto_792969 ) ( CLEAR ?auto_792968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_792965 ?auto_792966 ?auto_792967 ?auto_792968 )
      ( MAKE-7PILE ?auto_792965 ?auto_792966 ?auto_792967 ?auto_792968 ?auto_792969 ?auto_792970 ?auto_792971 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_792995 - BLOCK
      ?auto_792996 - BLOCK
      ?auto_792997 - BLOCK
      ?auto_792998 - BLOCK
      ?auto_792999 - BLOCK
      ?auto_793000 - BLOCK
      ?auto_793001 - BLOCK
    )
    :vars
    (
      ?auto_793002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793001 ?auto_793002 ) ( ON-TABLE ?auto_792995 ) ( ON ?auto_792996 ?auto_792995 ) ( not ( = ?auto_792995 ?auto_792996 ) ) ( not ( = ?auto_792995 ?auto_792997 ) ) ( not ( = ?auto_792995 ?auto_792998 ) ) ( not ( = ?auto_792995 ?auto_792999 ) ) ( not ( = ?auto_792995 ?auto_793000 ) ) ( not ( = ?auto_792995 ?auto_793001 ) ) ( not ( = ?auto_792995 ?auto_793002 ) ) ( not ( = ?auto_792996 ?auto_792997 ) ) ( not ( = ?auto_792996 ?auto_792998 ) ) ( not ( = ?auto_792996 ?auto_792999 ) ) ( not ( = ?auto_792996 ?auto_793000 ) ) ( not ( = ?auto_792996 ?auto_793001 ) ) ( not ( = ?auto_792996 ?auto_793002 ) ) ( not ( = ?auto_792997 ?auto_792998 ) ) ( not ( = ?auto_792997 ?auto_792999 ) ) ( not ( = ?auto_792997 ?auto_793000 ) ) ( not ( = ?auto_792997 ?auto_793001 ) ) ( not ( = ?auto_792997 ?auto_793002 ) ) ( not ( = ?auto_792998 ?auto_792999 ) ) ( not ( = ?auto_792998 ?auto_793000 ) ) ( not ( = ?auto_792998 ?auto_793001 ) ) ( not ( = ?auto_792998 ?auto_793002 ) ) ( not ( = ?auto_792999 ?auto_793000 ) ) ( not ( = ?auto_792999 ?auto_793001 ) ) ( not ( = ?auto_792999 ?auto_793002 ) ) ( not ( = ?auto_793000 ?auto_793001 ) ) ( not ( = ?auto_793000 ?auto_793002 ) ) ( not ( = ?auto_793001 ?auto_793002 ) ) ( ON ?auto_793000 ?auto_793001 ) ( ON ?auto_792999 ?auto_793000 ) ( ON ?auto_792998 ?auto_792999 ) ( CLEAR ?auto_792996 ) ( ON ?auto_792997 ?auto_792998 ) ( CLEAR ?auto_792997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_792995 ?auto_792996 ?auto_792997 )
      ( MAKE-7PILE ?auto_792995 ?auto_792996 ?auto_792997 ?auto_792998 ?auto_792999 ?auto_793000 ?auto_793001 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_793025 - BLOCK
      ?auto_793026 - BLOCK
      ?auto_793027 - BLOCK
      ?auto_793028 - BLOCK
      ?auto_793029 - BLOCK
      ?auto_793030 - BLOCK
      ?auto_793031 - BLOCK
    )
    :vars
    (
      ?auto_793032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793031 ?auto_793032 ) ( ON-TABLE ?auto_793025 ) ( not ( = ?auto_793025 ?auto_793026 ) ) ( not ( = ?auto_793025 ?auto_793027 ) ) ( not ( = ?auto_793025 ?auto_793028 ) ) ( not ( = ?auto_793025 ?auto_793029 ) ) ( not ( = ?auto_793025 ?auto_793030 ) ) ( not ( = ?auto_793025 ?auto_793031 ) ) ( not ( = ?auto_793025 ?auto_793032 ) ) ( not ( = ?auto_793026 ?auto_793027 ) ) ( not ( = ?auto_793026 ?auto_793028 ) ) ( not ( = ?auto_793026 ?auto_793029 ) ) ( not ( = ?auto_793026 ?auto_793030 ) ) ( not ( = ?auto_793026 ?auto_793031 ) ) ( not ( = ?auto_793026 ?auto_793032 ) ) ( not ( = ?auto_793027 ?auto_793028 ) ) ( not ( = ?auto_793027 ?auto_793029 ) ) ( not ( = ?auto_793027 ?auto_793030 ) ) ( not ( = ?auto_793027 ?auto_793031 ) ) ( not ( = ?auto_793027 ?auto_793032 ) ) ( not ( = ?auto_793028 ?auto_793029 ) ) ( not ( = ?auto_793028 ?auto_793030 ) ) ( not ( = ?auto_793028 ?auto_793031 ) ) ( not ( = ?auto_793028 ?auto_793032 ) ) ( not ( = ?auto_793029 ?auto_793030 ) ) ( not ( = ?auto_793029 ?auto_793031 ) ) ( not ( = ?auto_793029 ?auto_793032 ) ) ( not ( = ?auto_793030 ?auto_793031 ) ) ( not ( = ?auto_793030 ?auto_793032 ) ) ( not ( = ?auto_793031 ?auto_793032 ) ) ( ON ?auto_793030 ?auto_793031 ) ( ON ?auto_793029 ?auto_793030 ) ( ON ?auto_793028 ?auto_793029 ) ( ON ?auto_793027 ?auto_793028 ) ( CLEAR ?auto_793025 ) ( ON ?auto_793026 ?auto_793027 ) ( CLEAR ?auto_793026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_793025 ?auto_793026 )
      ( MAKE-7PILE ?auto_793025 ?auto_793026 ?auto_793027 ?auto_793028 ?auto_793029 ?auto_793030 ?auto_793031 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_793055 - BLOCK
      ?auto_793056 - BLOCK
      ?auto_793057 - BLOCK
      ?auto_793058 - BLOCK
      ?auto_793059 - BLOCK
      ?auto_793060 - BLOCK
      ?auto_793061 - BLOCK
    )
    :vars
    (
      ?auto_793062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793061 ?auto_793062 ) ( not ( = ?auto_793055 ?auto_793056 ) ) ( not ( = ?auto_793055 ?auto_793057 ) ) ( not ( = ?auto_793055 ?auto_793058 ) ) ( not ( = ?auto_793055 ?auto_793059 ) ) ( not ( = ?auto_793055 ?auto_793060 ) ) ( not ( = ?auto_793055 ?auto_793061 ) ) ( not ( = ?auto_793055 ?auto_793062 ) ) ( not ( = ?auto_793056 ?auto_793057 ) ) ( not ( = ?auto_793056 ?auto_793058 ) ) ( not ( = ?auto_793056 ?auto_793059 ) ) ( not ( = ?auto_793056 ?auto_793060 ) ) ( not ( = ?auto_793056 ?auto_793061 ) ) ( not ( = ?auto_793056 ?auto_793062 ) ) ( not ( = ?auto_793057 ?auto_793058 ) ) ( not ( = ?auto_793057 ?auto_793059 ) ) ( not ( = ?auto_793057 ?auto_793060 ) ) ( not ( = ?auto_793057 ?auto_793061 ) ) ( not ( = ?auto_793057 ?auto_793062 ) ) ( not ( = ?auto_793058 ?auto_793059 ) ) ( not ( = ?auto_793058 ?auto_793060 ) ) ( not ( = ?auto_793058 ?auto_793061 ) ) ( not ( = ?auto_793058 ?auto_793062 ) ) ( not ( = ?auto_793059 ?auto_793060 ) ) ( not ( = ?auto_793059 ?auto_793061 ) ) ( not ( = ?auto_793059 ?auto_793062 ) ) ( not ( = ?auto_793060 ?auto_793061 ) ) ( not ( = ?auto_793060 ?auto_793062 ) ) ( not ( = ?auto_793061 ?auto_793062 ) ) ( ON ?auto_793060 ?auto_793061 ) ( ON ?auto_793059 ?auto_793060 ) ( ON ?auto_793058 ?auto_793059 ) ( ON ?auto_793057 ?auto_793058 ) ( ON ?auto_793056 ?auto_793057 ) ( ON ?auto_793055 ?auto_793056 ) ( CLEAR ?auto_793055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_793055 )
      ( MAKE-7PILE ?auto_793055 ?auto_793056 ?auto_793057 ?auto_793058 ?auto_793059 ?auto_793060 ?auto_793061 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_793086 - BLOCK
      ?auto_793087 - BLOCK
      ?auto_793088 - BLOCK
      ?auto_793089 - BLOCK
      ?auto_793090 - BLOCK
      ?auto_793091 - BLOCK
      ?auto_793092 - BLOCK
      ?auto_793093 - BLOCK
    )
    :vars
    (
      ?auto_793094 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_793092 ) ( ON ?auto_793093 ?auto_793094 ) ( CLEAR ?auto_793093 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_793086 ) ( ON ?auto_793087 ?auto_793086 ) ( ON ?auto_793088 ?auto_793087 ) ( ON ?auto_793089 ?auto_793088 ) ( ON ?auto_793090 ?auto_793089 ) ( ON ?auto_793091 ?auto_793090 ) ( ON ?auto_793092 ?auto_793091 ) ( not ( = ?auto_793086 ?auto_793087 ) ) ( not ( = ?auto_793086 ?auto_793088 ) ) ( not ( = ?auto_793086 ?auto_793089 ) ) ( not ( = ?auto_793086 ?auto_793090 ) ) ( not ( = ?auto_793086 ?auto_793091 ) ) ( not ( = ?auto_793086 ?auto_793092 ) ) ( not ( = ?auto_793086 ?auto_793093 ) ) ( not ( = ?auto_793086 ?auto_793094 ) ) ( not ( = ?auto_793087 ?auto_793088 ) ) ( not ( = ?auto_793087 ?auto_793089 ) ) ( not ( = ?auto_793087 ?auto_793090 ) ) ( not ( = ?auto_793087 ?auto_793091 ) ) ( not ( = ?auto_793087 ?auto_793092 ) ) ( not ( = ?auto_793087 ?auto_793093 ) ) ( not ( = ?auto_793087 ?auto_793094 ) ) ( not ( = ?auto_793088 ?auto_793089 ) ) ( not ( = ?auto_793088 ?auto_793090 ) ) ( not ( = ?auto_793088 ?auto_793091 ) ) ( not ( = ?auto_793088 ?auto_793092 ) ) ( not ( = ?auto_793088 ?auto_793093 ) ) ( not ( = ?auto_793088 ?auto_793094 ) ) ( not ( = ?auto_793089 ?auto_793090 ) ) ( not ( = ?auto_793089 ?auto_793091 ) ) ( not ( = ?auto_793089 ?auto_793092 ) ) ( not ( = ?auto_793089 ?auto_793093 ) ) ( not ( = ?auto_793089 ?auto_793094 ) ) ( not ( = ?auto_793090 ?auto_793091 ) ) ( not ( = ?auto_793090 ?auto_793092 ) ) ( not ( = ?auto_793090 ?auto_793093 ) ) ( not ( = ?auto_793090 ?auto_793094 ) ) ( not ( = ?auto_793091 ?auto_793092 ) ) ( not ( = ?auto_793091 ?auto_793093 ) ) ( not ( = ?auto_793091 ?auto_793094 ) ) ( not ( = ?auto_793092 ?auto_793093 ) ) ( not ( = ?auto_793092 ?auto_793094 ) ) ( not ( = ?auto_793093 ?auto_793094 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_793093 ?auto_793094 )
      ( !STACK ?auto_793093 ?auto_793092 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_793120 - BLOCK
      ?auto_793121 - BLOCK
      ?auto_793122 - BLOCK
      ?auto_793123 - BLOCK
      ?auto_793124 - BLOCK
      ?auto_793125 - BLOCK
      ?auto_793126 - BLOCK
      ?auto_793127 - BLOCK
    )
    :vars
    (
      ?auto_793128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793127 ?auto_793128 ) ( ON-TABLE ?auto_793120 ) ( ON ?auto_793121 ?auto_793120 ) ( ON ?auto_793122 ?auto_793121 ) ( ON ?auto_793123 ?auto_793122 ) ( ON ?auto_793124 ?auto_793123 ) ( ON ?auto_793125 ?auto_793124 ) ( not ( = ?auto_793120 ?auto_793121 ) ) ( not ( = ?auto_793120 ?auto_793122 ) ) ( not ( = ?auto_793120 ?auto_793123 ) ) ( not ( = ?auto_793120 ?auto_793124 ) ) ( not ( = ?auto_793120 ?auto_793125 ) ) ( not ( = ?auto_793120 ?auto_793126 ) ) ( not ( = ?auto_793120 ?auto_793127 ) ) ( not ( = ?auto_793120 ?auto_793128 ) ) ( not ( = ?auto_793121 ?auto_793122 ) ) ( not ( = ?auto_793121 ?auto_793123 ) ) ( not ( = ?auto_793121 ?auto_793124 ) ) ( not ( = ?auto_793121 ?auto_793125 ) ) ( not ( = ?auto_793121 ?auto_793126 ) ) ( not ( = ?auto_793121 ?auto_793127 ) ) ( not ( = ?auto_793121 ?auto_793128 ) ) ( not ( = ?auto_793122 ?auto_793123 ) ) ( not ( = ?auto_793122 ?auto_793124 ) ) ( not ( = ?auto_793122 ?auto_793125 ) ) ( not ( = ?auto_793122 ?auto_793126 ) ) ( not ( = ?auto_793122 ?auto_793127 ) ) ( not ( = ?auto_793122 ?auto_793128 ) ) ( not ( = ?auto_793123 ?auto_793124 ) ) ( not ( = ?auto_793123 ?auto_793125 ) ) ( not ( = ?auto_793123 ?auto_793126 ) ) ( not ( = ?auto_793123 ?auto_793127 ) ) ( not ( = ?auto_793123 ?auto_793128 ) ) ( not ( = ?auto_793124 ?auto_793125 ) ) ( not ( = ?auto_793124 ?auto_793126 ) ) ( not ( = ?auto_793124 ?auto_793127 ) ) ( not ( = ?auto_793124 ?auto_793128 ) ) ( not ( = ?auto_793125 ?auto_793126 ) ) ( not ( = ?auto_793125 ?auto_793127 ) ) ( not ( = ?auto_793125 ?auto_793128 ) ) ( not ( = ?auto_793126 ?auto_793127 ) ) ( not ( = ?auto_793126 ?auto_793128 ) ) ( not ( = ?auto_793127 ?auto_793128 ) ) ( CLEAR ?auto_793125 ) ( ON ?auto_793126 ?auto_793127 ) ( CLEAR ?auto_793126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_793120 ?auto_793121 ?auto_793122 ?auto_793123 ?auto_793124 ?auto_793125 ?auto_793126 )
      ( MAKE-8PILE ?auto_793120 ?auto_793121 ?auto_793122 ?auto_793123 ?auto_793124 ?auto_793125 ?auto_793126 ?auto_793127 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_793154 - BLOCK
      ?auto_793155 - BLOCK
      ?auto_793156 - BLOCK
      ?auto_793157 - BLOCK
      ?auto_793158 - BLOCK
      ?auto_793159 - BLOCK
      ?auto_793160 - BLOCK
      ?auto_793161 - BLOCK
    )
    :vars
    (
      ?auto_793162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793161 ?auto_793162 ) ( ON-TABLE ?auto_793154 ) ( ON ?auto_793155 ?auto_793154 ) ( ON ?auto_793156 ?auto_793155 ) ( ON ?auto_793157 ?auto_793156 ) ( ON ?auto_793158 ?auto_793157 ) ( not ( = ?auto_793154 ?auto_793155 ) ) ( not ( = ?auto_793154 ?auto_793156 ) ) ( not ( = ?auto_793154 ?auto_793157 ) ) ( not ( = ?auto_793154 ?auto_793158 ) ) ( not ( = ?auto_793154 ?auto_793159 ) ) ( not ( = ?auto_793154 ?auto_793160 ) ) ( not ( = ?auto_793154 ?auto_793161 ) ) ( not ( = ?auto_793154 ?auto_793162 ) ) ( not ( = ?auto_793155 ?auto_793156 ) ) ( not ( = ?auto_793155 ?auto_793157 ) ) ( not ( = ?auto_793155 ?auto_793158 ) ) ( not ( = ?auto_793155 ?auto_793159 ) ) ( not ( = ?auto_793155 ?auto_793160 ) ) ( not ( = ?auto_793155 ?auto_793161 ) ) ( not ( = ?auto_793155 ?auto_793162 ) ) ( not ( = ?auto_793156 ?auto_793157 ) ) ( not ( = ?auto_793156 ?auto_793158 ) ) ( not ( = ?auto_793156 ?auto_793159 ) ) ( not ( = ?auto_793156 ?auto_793160 ) ) ( not ( = ?auto_793156 ?auto_793161 ) ) ( not ( = ?auto_793156 ?auto_793162 ) ) ( not ( = ?auto_793157 ?auto_793158 ) ) ( not ( = ?auto_793157 ?auto_793159 ) ) ( not ( = ?auto_793157 ?auto_793160 ) ) ( not ( = ?auto_793157 ?auto_793161 ) ) ( not ( = ?auto_793157 ?auto_793162 ) ) ( not ( = ?auto_793158 ?auto_793159 ) ) ( not ( = ?auto_793158 ?auto_793160 ) ) ( not ( = ?auto_793158 ?auto_793161 ) ) ( not ( = ?auto_793158 ?auto_793162 ) ) ( not ( = ?auto_793159 ?auto_793160 ) ) ( not ( = ?auto_793159 ?auto_793161 ) ) ( not ( = ?auto_793159 ?auto_793162 ) ) ( not ( = ?auto_793160 ?auto_793161 ) ) ( not ( = ?auto_793160 ?auto_793162 ) ) ( not ( = ?auto_793161 ?auto_793162 ) ) ( ON ?auto_793160 ?auto_793161 ) ( CLEAR ?auto_793158 ) ( ON ?auto_793159 ?auto_793160 ) ( CLEAR ?auto_793159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_793154 ?auto_793155 ?auto_793156 ?auto_793157 ?auto_793158 ?auto_793159 )
      ( MAKE-8PILE ?auto_793154 ?auto_793155 ?auto_793156 ?auto_793157 ?auto_793158 ?auto_793159 ?auto_793160 ?auto_793161 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_793188 - BLOCK
      ?auto_793189 - BLOCK
      ?auto_793190 - BLOCK
      ?auto_793191 - BLOCK
      ?auto_793192 - BLOCK
      ?auto_793193 - BLOCK
      ?auto_793194 - BLOCK
      ?auto_793195 - BLOCK
    )
    :vars
    (
      ?auto_793196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793195 ?auto_793196 ) ( ON-TABLE ?auto_793188 ) ( ON ?auto_793189 ?auto_793188 ) ( ON ?auto_793190 ?auto_793189 ) ( ON ?auto_793191 ?auto_793190 ) ( not ( = ?auto_793188 ?auto_793189 ) ) ( not ( = ?auto_793188 ?auto_793190 ) ) ( not ( = ?auto_793188 ?auto_793191 ) ) ( not ( = ?auto_793188 ?auto_793192 ) ) ( not ( = ?auto_793188 ?auto_793193 ) ) ( not ( = ?auto_793188 ?auto_793194 ) ) ( not ( = ?auto_793188 ?auto_793195 ) ) ( not ( = ?auto_793188 ?auto_793196 ) ) ( not ( = ?auto_793189 ?auto_793190 ) ) ( not ( = ?auto_793189 ?auto_793191 ) ) ( not ( = ?auto_793189 ?auto_793192 ) ) ( not ( = ?auto_793189 ?auto_793193 ) ) ( not ( = ?auto_793189 ?auto_793194 ) ) ( not ( = ?auto_793189 ?auto_793195 ) ) ( not ( = ?auto_793189 ?auto_793196 ) ) ( not ( = ?auto_793190 ?auto_793191 ) ) ( not ( = ?auto_793190 ?auto_793192 ) ) ( not ( = ?auto_793190 ?auto_793193 ) ) ( not ( = ?auto_793190 ?auto_793194 ) ) ( not ( = ?auto_793190 ?auto_793195 ) ) ( not ( = ?auto_793190 ?auto_793196 ) ) ( not ( = ?auto_793191 ?auto_793192 ) ) ( not ( = ?auto_793191 ?auto_793193 ) ) ( not ( = ?auto_793191 ?auto_793194 ) ) ( not ( = ?auto_793191 ?auto_793195 ) ) ( not ( = ?auto_793191 ?auto_793196 ) ) ( not ( = ?auto_793192 ?auto_793193 ) ) ( not ( = ?auto_793192 ?auto_793194 ) ) ( not ( = ?auto_793192 ?auto_793195 ) ) ( not ( = ?auto_793192 ?auto_793196 ) ) ( not ( = ?auto_793193 ?auto_793194 ) ) ( not ( = ?auto_793193 ?auto_793195 ) ) ( not ( = ?auto_793193 ?auto_793196 ) ) ( not ( = ?auto_793194 ?auto_793195 ) ) ( not ( = ?auto_793194 ?auto_793196 ) ) ( not ( = ?auto_793195 ?auto_793196 ) ) ( ON ?auto_793194 ?auto_793195 ) ( ON ?auto_793193 ?auto_793194 ) ( CLEAR ?auto_793191 ) ( ON ?auto_793192 ?auto_793193 ) ( CLEAR ?auto_793192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_793188 ?auto_793189 ?auto_793190 ?auto_793191 ?auto_793192 )
      ( MAKE-8PILE ?auto_793188 ?auto_793189 ?auto_793190 ?auto_793191 ?auto_793192 ?auto_793193 ?auto_793194 ?auto_793195 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_793222 - BLOCK
      ?auto_793223 - BLOCK
      ?auto_793224 - BLOCK
      ?auto_793225 - BLOCK
      ?auto_793226 - BLOCK
      ?auto_793227 - BLOCK
      ?auto_793228 - BLOCK
      ?auto_793229 - BLOCK
    )
    :vars
    (
      ?auto_793230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793229 ?auto_793230 ) ( ON-TABLE ?auto_793222 ) ( ON ?auto_793223 ?auto_793222 ) ( ON ?auto_793224 ?auto_793223 ) ( not ( = ?auto_793222 ?auto_793223 ) ) ( not ( = ?auto_793222 ?auto_793224 ) ) ( not ( = ?auto_793222 ?auto_793225 ) ) ( not ( = ?auto_793222 ?auto_793226 ) ) ( not ( = ?auto_793222 ?auto_793227 ) ) ( not ( = ?auto_793222 ?auto_793228 ) ) ( not ( = ?auto_793222 ?auto_793229 ) ) ( not ( = ?auto_793222 ?auto_793230 ) ) ( not ( = ?auto_793223 ?auto_793224 ) ) ( not ( = ?auto_793223 ?auto_793225 ) ) ( not ( = ?auto_793223 ?auto_793226 ) ) ( not ( = ?auto_793223 ?auto_793227 ) ) ( not ( = ?auto_793223 ?auto_793228 ) ) ( not ( = ?auto_793223 ?auto_793229 ) ) ( not ( = ?auto_793223 ?auto_793230 ) ) ( not ( = ?auto_793224 ?auto_793225 ) ) ( not ( = ?auto_793224 ?auto_793226 ) ) ( not ( = ?auto_793224 ?auto_793227 ) ) ( not ( = ?auto_793224 ?auto_793228 ) ) ( not ( = ?auto_793224 ?auto_793229 ) ) ( not ( = ?auto_793224 ?auto_793230 ) ) ( not ( = ?auto_793225 ?auto_793226 ) ) ( not ( = ?auto_793225 ?auto_793227 ) ) ( not ( = ?auto_793225 ?auto_793228 ) ) ( not ( = ?auto_793225 ?auto_793229 ) ) ( not ( = ?auto_793225 ?auto_793230 ) ) ( not ( = ?auto_793226 ?auto_793227 ) ) ( not ( = ?auto_793226 ?auto_793228 ) ) ( not ( = ?auto_793226 ?auto_793229 ) ) ( not ( = ?auto_793226 ?auto_793230 ) ) ( not ( = ?auto_793227 ?auto_793228 ) ) ( not ( = ?auto_793227 ?auto_793229 ) ) ( not ( = ?auto_793227 ?auto_793230 ) ) ( not ( = ?auto_793228 ?auto_793229 ) ) ( not ( = ?auto_793228 ?auto_793230 ) ) ( not ( = ?auto_793229 ?auto_793230 ) ) ( ON ?auto_793228 ?auto_793229 ) ( ON ?auto_793227 ?auto_793228 ) ( ON ?auto_793226 ?auto_793227 ) ( CLEAR ?auto_793224 ) ( ON ?auto_793225 ?auto_793226 ) ( CLEAR ?auto_793225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_793222 ?auto_793223 ?auto_793224 ?auto_793225 )
      ( MAKE-8PILE ?auto_793222 ?auto_793223 ?auto_793224 ?auto_793225 ?auto_793226 ?auto_793227 ?auto_793228 ?auto_793229 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_793256 - BLOCK
      ?auto_793257 - BLOCK
      ?auto_793258 - BLOCK
      ?auto_793259 - BLOCK
      ?auto_793260 - BLOCK
      ?auto_793261 - BLOCK
      ?auto_793262 - BLOCK
      ?auto_793263 - BLOCK
    )
    :vars
    (
      ?auto_793264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793263 ?auto_793264 ) ( ON-TABLE ?auto_793256 ) ( ON ?auto_793257 ?auto_793256 ) ( not ( = ?auto_793256 ?auto_793257 ) ) ( not ( = ?auto_793256 ?auto_793258 ) ) ( not ( = ?auto_793256 ?auto_793259 ) ) ( not ( = ?auto_793256 ?auto_793260 ) ) ( not ( = ?auto_793256 ?auto_793261 ) ) ( not ( = ?auto_793256 ?auto_793262 ) ) ( not ( = ?auto_793256 ?auto_793263 ) ) ( not ( = ?auto_793256 ?auto_793264 ) ) ( not ( = ?auto_793257 ?auto_793258 ) ) ( not ( = ?auto_793257 ?auto_793259 ) ) ( not ( = ?auto_793257 ?auto_793260 ) ) ( not ( = ?auto_793257 ?auto_793261 ) ) ( not ( = ?auto_793257 ?auto_793262 ) ) ( not ( = ?auto_793257 ?auto_793263 ) ) ( not ( = ?auto_793257 ?auto_793264 ) ) ( not ( = ?auto_793258 ?auto_793259 ) ) ( not ( = ?auto_793258 ?auto_793260 ) ) ( not ( = ?auto_793258 ?auto_793261 ) ) ( not ( = ?auto_793258 ?auto_793262 ) ) ( not ( = ?auto_793258 ?auto_793263 ) ) ( not ( = ?auto_793258 ?auto_793264 ) ) ( not ( = ?auto_793259 ?auto_793260 ) ) ( not ( = ?auto_793259 ?auto_793261 ) ) ( not ( = ?auto_793259 ?auto_793262 ) ) ( not ( = ?auto_793259 ?auto_793263 ) ) ( not ( = ?auto_793259 ?auto_793264 ) ) ( not ( = ?auto_793260 ?auto_793261 ) ) ( not ( = ?auto_793260 ?auto_793262 ) ) ( not ( = ?auto_793260 ?auto_793263 ) ) ( not ( = ?auto_793260 ?auto_793264 ) ) ( not ( = ?auto_793261 ?auto_793262 ) ) ( not ( = ?auto_793261 ?auto_793263 ) ) ( not ( = ?auto_793261 ?auto_793264 ) ) ( not ( = ?auto_793262 ?auto_793263 ) ) ( not ( = ?auto_793262 ?auto_793264 ) ) ( not ( = ?auto_793263 ?auto_793264 ) ) ( ON ?auto_793262 ?auto_793263 ) ( ON ?auto_793261 ?auto_793262 ) ( ON ?auto_793260 ?auto_793261 ) ( ON ?auto_793259 ?auto_793260 ) ( CLEAR ?auto_793257 ) ( ON ?auto_793258 ?auto_793259 ) ( CLEAR ?auto_793258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_793256 ?auto_793257 ?auto_793258 )
      ( MAKE-8PILE ?auto_793256 ?auto_793257 ?auto_793258 ?auto_793259 ?auto_793260 ?auto_793261 ?auto_793262 ?auto_793263 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_793290 - BLOCK
      ?auto_793291 - BLOCK
      ?auto_793292 - BLOCK
      ?auto_793293 - BLOCK
      ?auto_793294 - BLOCK
      ?auto_793295 - BLOCK
      ?auto_793296 - BLOCK
      ?auto_793297 - BLOCK
    )
    :vars
    (
      ?auto_793298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793297 ?auto_793298 ) ( ON-TABLE ?auto_793290 ) ( not ( = ?auto_793290 ?auto_793291 ) ) ( not ( = ?auto_793290 ?auto_793292 ) ) ( not ( = ?auto_793290 ?auto_793293 ) ) ( not ( = ?auto_793290 ?auto_793294 ) ) ( not ( = ?auto_793290 ?auto_793295 ) ) ( not ( = ?auto_793290 ?auto_793296 ) ) ( not ( = ?auto_793290 ?auto_793297 ) ) ( not ( = ?auto_793290 ?auto_793298 ) ) ( not ( = ?auto_793291 ?auto_793292 ) ) ( not ( = ?auto_793291 ?auto_793293 ) ) ( not ( = ?auto_793291 ?auto_793294 ) ) ( not ( = ?auto_793291 ?auto_793295 ) ) ( not ( = ?auto_793291 ?auto_793296 ) ) ( not ( = ?auto_793291 ?auto_793297 ) ) ( not ( = ?auto_793291 ?auto_793298 ) ) ( not ( = ?auto_793292 ?auto_793293 ) ) ( not ( = ?auto_793292 ?auto_793294 ) ) ( not ( = ?auto_793292 ?auto_793295 ) ) ( not ( = ?auto_793292 ?auto_793296 ) ) ( not ( = ?auto_793292 ?auto_793297 ) ) ( not ( = ?auto_793292 ?auto_793298 ) ) ( not ( = ?auto_793293 ?auto_793294 ) ) ( not ( = ?auto_793293 ?auto_793295 ) ) ( not ( = ?auto_793293 ?auto_793296 ) ) ( not ( = ?auto_793293 ?auto_793297 ) ) ( not ( = ?auto_793293 ?auto_793298 ) ) ( not ( = ?auto_793294 ?auto_793295 ) ) ( not ( = ?auto_793294 ?auto_793296 ) ) ( not ( = ?auto_793294 ?auto_793297 ) ) ( not ( = ?auto_793294 ?auto_793298 ) ) ( not ( = ?auto_793295 ?auto_793296 ) ) ( not ( = ?auto_793295 ?auto_793297 ) ) ( not ( = ?auto_793295 ?auto_793298 ) ) ( not ( = ?auto_793296 ?auto_793297 ) ) ( not ( = ?auto_793296 ?auto_793298 ) ) ( not ( = ?auto_793297 ?auto_793298 ) ) ( ON ?auto_793296 ?auto_793297 ) ( ON ?auto_793295 ?auto_793296 ) ( ON ?auto_793294 ?auto_793295 ) ( ON ?auto_793293 ?auto_793294 ) ( ON ?auto_793292 ?auto_793293 ) ( CLEAR ?auto_793290 ) ( ON ?auto_793291 ?auto_793292 ) ( CLEAR ?auto_793291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_793290 ?auto_793291 )
      ( MAKE-8PILE ?auto_793290 ?auto_793291 ?auto_793292 ?auto_793293 ?auto_793294 ?auto_793295 ?auto_793296 ?auto_793297 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_793324 - BLOCK
      ?auto_793325 - BLOCK
      ?auto_793326 - BLOCK
      ?auto_793327 - BLOCK
      ?auto_793328 - BLOCK
      ?auto_793329 - BLOCK
      ?auto_793330 - BLOCK
      ?auto_793331 - BLOCK
    )
    :vars
    (
      ?auto_793332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793331 ?auto_793332 ) ( not ( = ?auto_793324 ?auto_793325 ) ) ( not ( = ?auto_793324 ?auto_793326 ) ) ( not ( = ?auto_793324 ?auto_793327 ) ) ( not ( = ?auto_793324 ?auto_793328 ) ) ( not ( = ?auto_793324 ?auto_793329 ) ) ( not ( = ?auto_793324 ?auto_793330 ) ) ( not ( = ?auto_793324 ?auto_793331 ) ) ( not ( = ?auto_793324 ?auto_793332 ) ) ( not ( = ?auto_793325 ?auto_793326 ) ) ( not ( = ?auto_793325 ?auto_793327 ) ) ( not ( = ?auto_793325 ?auto_793328 ) ) ( not ( = ?auto_793325 ?auto_793329 ) ) ( not ( = ?auto_793325 ?auto_793330 ) ) ( not ( = ?auto_793325 ?auto_793331 ) ) ( not ( = ?auto_793325 ?auto_793332 ) ) ( not ( = ?auto_793326 ?auto_793327 ) ) ( not ( = ?auto_793326 ?auto_793328 ) ) ( not ( = ?auto_793326 ?auto_793329 ) ) ( not ( = ?auto_793326 ?auto_793330 ) ) ( not ( = ?auto_793326 ?auto_793331 ) ) ( not ( = ?auto_793326 ?auto_793332 ) ) ( not ( = ?auto_793327 ?auto_793328 ) ) ( not ( = ?auto_793327 ?auto_793329 ) ) ( not ( = ?auto_793327 ?auto_793330 ) ) ( not ( = ?auto_793327 ?auto_793331 ) ) ( not ( = ?auto_793327 ?auto_793332 ) ) ( not ( = ?auto_793328 ?auto_793329 ) ) ( not ( = ?auto_793328 ?auto_793330 ) ) ( not ( = ?auto_793328 ?auto_793331 ) ) ( not ( = ?auto_793328 ?auto_793332 ) ) ( not ( = ?auto_793329 ?auto_793330 ) ) ( not ( = ?auto_793329 ?auto_793331 ) ) ( not ( = ?auto_793329 ?auto_793332 ) ) ( not ( = ?auto_793330 ?auto_793331 ) ) ( not ( = ?auto_793330 ?auto_793332 ) ) ( not ( = ?auto_793331 ?auto_793332 ) ) ( ON ?auto_793330 ?auto_793331 ) ( ON ?auto_793329 ?auto_793330 ) ( ON ?auto_793328 ?auto_793329 ) ( ON ?auto_793327 ?auto_793328 ) ( ON ?auto_793326 ?auto_793327 ) ( ON ?auto_793325 ?auto_793326 ) ( ON ?auto_793324 ?auto_793325 ) ( CLEAR ?auto_793324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_793324 )
      ( MAKE-8PILE ?auto_793324 ?auto_793325 ?auto_793326 ?auto_793327 ?auto_793328 ?auto_793329 ?auto_793330 ?auto_793331 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_793359 - BLOCK
      ?auto_793360 - BLOCK
      ?auto_793361 - BLOCK
      ?auto_793362 - BLOCK
      ?auto_793363 - BLOCK
      ?auto_793364 - BLOCK
      ?auto_793365 - BLOCK
      ?auto_793366 - BLOCK
      ?auto_793367 - BLOCK
    )
    :vars
    (
      ?auto_793368 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_793366 ) ( ON ?auto_793367 ?auto_793368 ) ( CLEAR ?auto_793367 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_793359 ) ( ON ?auto_793360 ?auto_793359 ) ( ON ?auto_793361 ?auto_793360 ) ( ON ?auto_793362 ?auto_793361 ) ( ON ?auto_793363 ?auto_793362 ) ( ON ?auto_793364 ?auto_793363 ) ( ON ?auto_793365 ?auto_793364 ) ( ON ?auto_793366 ?auto_793365 ) ( not ( = ?auto_793359 ?auto_793360 ) ) ( not ( = ?auto_793359 ?auto_793361 ) ) ( not ( = ?auto_793359 ?auto_793362 ) ) ( not ( = ?auto_793359 ?auto_793363 ) ) ( not ( = ?auto_793359 ?auto_793364 ) ) ( not ( = ?auto_793359 ?auto_793365 ) ) ( not ( = ?auto_793359 ?auto_793366 ) ) ( not ( = ?auto_793359 ?auto_793367 ) ) ( not ( = ?auto_793359 ?auto_793368 ) ) ( not ( = ?auto_793360 ?auto_793361 ) ) ( not ( = ?auto_793360 ?auto_793362 ) ) ( not ( = ?auto_793360 ?auto_793363 ) ) ( not ( = ?auto_793360 ?auto_793364 ) ) ( not ( = ?auto_793360 ?auto_793365 ) ) ( not ( = ?auto_793360 ?auto_793366 ) ) ( not ( = ?auto_793360 ?auto_793367 ) ) ( not ( = ?auto_793360 ?auto_793368 ) ) ( not ( = ?auto_793361 ?auto_793362 ) ) ( not ( = ?auto_793361 ?auto_793363 ) ) ( not ( = ?auto_793361 ?auto_793364 ) ) ( not ( = ?auto_793361 ?auto_793365 ) ) ( not ( = ?auto_793361 ?auto_793366 ) ) ( not ( = ?auto_793361 ?auto_793367 ) ) ( not ( = ?auto_793361 ?auto_793368 ) ) ( not ( = ?auto_793362 ?auto_793363 ) ) ( not ( = ?auto_793362 ?auto_793364 ) ) ( not ( = ?auto_793362 ?auto_793365 ) ) ( not ( = ?auto_793362 ?auto_793366 ) ) ( not ( = ?auto_793362 ?auto_793367 ) ) ( not ( = ?auto_793362 ?auto_793368 ) ) ( not ( = ?auto_793363 ?auto_793364 ) ) ( not ( = ?auto_793363 ?auto_793365 ) ) ( not ( = ?auto_793363 ?auto_793366 ) ) ( not ( = ?auto_793363 ?auto_793367 ) ) ( not ( = ?auto_793363 ?auto_793368 ) ) ( not ( = ?auto_793364 ?auto_793365 ) ) ( not ( = ?auto_793364 ?auto_793366 ) ) ( not ( = ?auto_793364 ?auto_793367 ) ) ( not ( = ?auto_793364 ?auto_793368 ) ) ( not ( = ?auto_793365 ?auto_793366 ) ) ( not ( = ?auto_793365 ?auto_793367 ) ) ( not ( = ?auto_793365 ?auto_793368 ) ) ( not ( = ?auto_793366 ?auto_793367 ) ) ( not ( = ?auto_793366 ?auto_793368 ) ) ( not ( = ?auto_793367 ?auto_793368 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_793367 ?auto_793368 )
      ( !STACK ?auto_793367 ?auto_793366 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_793397 - BLOCK
      ?auto_793398 - BLOCK
      ?auto_793399 - BLOCK
      ?auto_793400 - BLOCK
      ?auto_793401 - BLOCK
      ?auto_793402 - BLOCK
      ?auto_793403 - BLOCK
      ?auto_793404 - BLOCK
      ?auto_793405 - BLOCK
    )
    :vars
    (
      ?auto_793406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793405 ?auto_793406 ) ( ON-TABLE ?auto_793397 ) ( ON ?auto_793398 ?auto_793397 ) ( ON ?auto_793399 ?auto_793398 ) ( ON ?auto_793400 ?auto_793399 ) ( ON ?auto_793401 ?auto_793400 ) ( ON ?auto_793402 ?auto_793401 ) ( ON ?auto_793403 ?auto_793402 ) ( not ( = ?auto_793397 ?auto_793398 ) ) ( not ( = ?auto_793397 ?auto_793399 ) ) ( not ( = ?auto_793397 ?auto_793400 ) ) ( not ( = ?auto_793397 ?auto_793401 ) ) ( not ( = ?auto_793397 ?auto_793402 ) ) ( not ( = ?auto_793397 ?auto_793403 ) ) ( not ( = ?auto_793397 ?auto_793404 ) ) ( not ( = ?auto_793397 ?auto_793405 ) ) ( not ( = ?auto_793397 ?auto_793406 ) ) ( not ( = ?auto_793398 ?auto_793399 ) ) ( not ( = ?auto_793398 ?auto_793400 ) ) ( not ( = ?auto_793398 ?auto_793401 ) ) ( not ( = ?auto_793398 ?auto_793402 ) ) ( not ( = ?auto_793398 ?auto_793403 ) ) ( not ( = ?auto_793398 ?auto_793404 ) ) ( not ( = ?auto_793398 ?auto_793405 ) ) ( not ( = ?auto_793398 ?auto_793406 ) ) ( not ( = ?auto_793399 ?auto_793400 ) ) ( not ( = ?auto_793399 ?auto_793401 ) ) ( not ( = ?auto_793399 ?auto_793402 ) ) ( not ( = ?auto_793399 ?auto_793403 ) ) ( not ( = ?auto_793399 ?auto_793404 ) ) ( not ( = ?auto_793399 ?auto_793405 ) ) ( not ( = ?auto_793399 ?auto_793406 ) ) ( not ( = ?auto_793400 ?auto_793401 ) ) ( not ( = ?auto_793400 ?auto_793402 ) ) ( not ( = ?auto_793400 ?auto_793403 ) ) ( not ( = ?auto_793400 ?auto_793404 ) ) ( not ( = ?auto_793400 ?auto_793405 ) ) ( not ( = ?auto_793400 ?auto_793406 ) ) ( not ( = ?auto_793401 ?auto_793402 ) ) ( not ( = ?auto_793401 ?auto_793403 ) ) ( not ( = ?auto_793401 ?auto_793404 ) ) ( not ( = ?auto_793401 ?auto_793405 ) ) ( not ( = ?auto_793401 ?auto_793406 ) ) ( not ( = ?auto_793402 ?auto_793403 ) ) ( not ( = ?auto_793402 ?auto_793404 ) ) ( not ( = ?auto_793402 ?auto_793405 ) ) ( not ( = ?auto_793402 ?auto_793406 ) ) ( not ( = ?auto_793403 ?auto_793404 ) ) ( not ( = ?auto_793403 ?auto_793405 ) ) ( not ( = ?auto_793403 ?auto_793406 ) ) ( not ( = ?auto_793404 ?auto_793405 ) ) ( not ( = ?auto_793404 ?auto_793406 ) ) ( not ( = ?auto_793405 ?auto_793406 ) ) ( CLEAR ?auto_793403 ) ( ON ?auto_793404 ?auto_793405 ) ( CLEAR ?auto_793404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_793397 ?auto_793398 ?auto_793399 ?auto_793400 ?auto_793401 ?auto_793402 ?auto_793403 ?auto_793404 )
      ( MAKE-9PILE ?auto_793397 ?auto_793398 ?auto_793399 ?auto_793400 ?auto_793401 ?auto_793402 ?auto_793403 ?auto_793404 ?auto_793405 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_793435 - BLOCK
      ?auto_793436 - BLOCK
      ?auto_793437 - BLOCK
      ?auto_793438 - BLOCK
      ?auto_793439 - BLOCK
      ?auto_793440 - BLOCK
      ?auto_793441 - BLOCK
      ?auto_793442 - BLOCK
      ?auto_793443 - BLOCK
    )
    :vars
    (
      ?auto_793444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793443 ?auto_793444 ) ( ON-TABLE ?auto_793435 ) ( ON ?auto_793436 ?auto_793435 ) ( ON ?auto_793437 ?auto_793436 ) ( ON ?auto_793438 ?auto_793437 ) ( ON ?auto_793439 ?auto_793438 ) ( ON ?auto_793440 ?auto_793439 ) ( not ( = ?auto_793435 ?auto_793436 ) ) ( not ( = ?auto_793435 ?auto_793437 ) ) ( not ( = ?auto_793435 ?auto_793438 ) ) ( not ( = ?auto_793435 ?auto_793439 ) ) ( not ( = ?auto_793435 ?auto_793440 ) ) ( not ( = ?auto_793435 ?auto_793441 ) ) ( not ( = ?auto_793435 ?auto_793442 ) ) ( not ( = ?auto_793435 ?auto_793443 ) ) ( not ( = ?auto_793435 ?auto_793444 ) ) ( not ( = ?auto_793436 ?auto_793437 ) ) ( not ( = ?auto_793436 ?auto_793438 ) ) ( not ( = ?auto_793436 ?auto_793439 ) ) ( not ( = ?auto_793436 ?auto_793440 ) ) ( not ( = ?auto_793436 ?auto_793441 ) ) ( not ( = ?auto_793436 ?auto_793442 ) ) ( not ( = ?auto_793436 ?auto_793443 ) ) ( not ( = ?auto_793436 ?auto_793444 ) ) ( not ( = ?auto_793437 ?auto_793438 ) ) ( not ( = ?auto_793437 ?auto_793439 ) ) ( not ( = ?auto_793437 ?auto_793440 ) ) ( not ( = ?auto_793437 ?auto_793441 ) ) ( not ( = ?auto_793437 ?auto_793442 ) ) ( not ( = ?auto_793437 ?auto_793443 ) ) ( not ( = ?auto_793437 ?auto_793444 ) ) ( not ( = ?auto_793438 ?auto_793439 ) ) ( not ( = ?auto_793438 ?auto_793440 ) ) ( not ( = ?auto_793438 ?auto_793441 ) ) ( not ( = ?auto_793438 ?auto_793442 ) ) ( not ( = ?auto_793438 ?auto_793443 ) ) ( not ( = ?auto_793438 ?auto_793444 ) ) ( not ( = ?auto_793439 ?auto_793440 ) ) ( not ( = ?auto_793439 ?auto_793441 ) ) ( not ( = ?auto_793439 ?auto_793442 ) ) ( not ( = ?auto_793439 ?auto_793443 ) ) ( not ( = ?auto_793439 ?auto_793444 ) ) ( not ( = ?auto_793440 ?auto_793441 ) ) ( not ( = ?auto_793440 ?auto_793442 ) ) ( not ( = ?auto_793440 ?auto_793443 ) ) ( not ( = ?auto_793440 ?auto_793444 ) ) ( not ( = ?auto_793441 ?auto_793442 ) ) ( not ( = ?auto_793441 ?auto_793443 ) ) ( not ( = ?auto_793441 ?auto_793444 ) ) ( not ( = ?auto_793442 ?auto_793443 ) ) ( not ( = ?auto_793442 ?auto_793444 ) ) ( not ( = ?auto_793443 ?auto_793444 ) ) ( ON ?auto_793442 ?auto_793443 ) ( CLEAR ?auto_793440 ) ( ON ?auto_793441 ?auto_793442 ) ( CLEAR ?auto_793441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_793435 ?auto_793436 ?auto_793437 ?auto_793438 ?auto_793439 ?auto_793440 ?auto_793441 )
      ( MAKE-9PILE ?auto_793435 ?auto_793436 ?auto_793437 ?auto_793438 ?auto_793439 ?auto_793440 ?auto_793441 ?auto_793442 ?auto_793443 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_793473 - BLOCK
      ?auto_793474 - BLOCK
      ?auto_793475 - BLOCK
      ?auto_793476 - BLOCK
      ?auto_793477 - BLOCK
      ?auto_793478 - BLOCK
      ?auto_793479 - BLOCK
      ?auto_793480 - BLOCK
      ?auto_793481 - BLOCK
    )
    :vars
    (
      ?auto_793482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793481 ?auto_793482 ) ( ON-TABLE ?auto_793473 ) ( ON ?auto_793474 ?auto_793473 ) ( ON ?auto_793475 ?auto_793474 ) ( ON ?auto_793476 ?auto_793475 ) ( ON ?auto_793477 ?auto_793476 ) ( not ( = ?auto_793473 ?auto_793474 ) ) ( not ( = ?auto_793473 ?auto_793475 ) ) ( not ( = ?auto_793473 ?auto_793476 ) ) ( not ( = ?auto_793473 ?auto_793477 ) ) ( not ( = ?auto_793473 ?auto_793478 ) ) ( not ( = ?auto_793473 ?auto_793479 ) ) ( not ( = ?auto_793473 ?auto_793480 ) ) ( not ( = ?auto_793473 ?auto_793481 ) ) ( not ( = ?auto_793473 ?auto_793482 ) ) ( not ( = ?auto_793474 ?auto_793475 ) ) ( not ( = ?auto_793474 ?auto_793476 ) ) ( not ( = ?auto_793474 ?auto_793477 ) ) ( not ( = ?auto_793474 ?auto_793478 ) ) ( not ( = ?auto_793474 ?auto_793479 ) ) ( not ( = ?auto_793474 ?auto_793480 ) ) ( not ( = ?auto_793474 ?auto_793481 ) ) ( not ( = ?auto_793474 ?auto_793482 ) ) ( not ( = ?auto_793475 ?auto_793476 ) ) ( not ( = ?auto_793475 ?auto_793477 ) ) ( not ( = ?auto_793475 ?auto_793478 ) ) ( not ( = ?auto_793475 ?auto_793479 ) ) ( not ( = ?auto_793475 ?auto_793480 ) ) ( not ( = ?auto_793475 ?auto_793481 ) ) ( not ( = ?auto_793475 ?auto_793482 ) ) ( not ( = ?auto_793476 ?auto_793477 ) ) ( not ( = ?auto_793476 ?auto_793478 ) ) ( not ( = ?auto_793476 ?auto_793479 ) ) ( not ( = ?auto_793476 ?auto_793480 ) ) ( not ( = ?auto_793476 ?auto_793481 ) ) ( not ( = ?auto_793476 ?auto_793482 ) ) ( not ( = ?auto_793477 ?auto_793478 ) ) ( not ( = ?auto_793477 ?auto_793479 ) ) ( not ( = ?auto_793477 ?auto_793480 ) ) ( not ( = ?auto_793477 ?auto_793481 ) ) ( not ( = ?auto_793477 ?auto_793482 ) ) ( not ( = ?auto_793478 ?auto_793479 ) ) ( not ( = ?auto_793478 ?auto_793480 ) ) ( not ( = ?auto_793478 ?auto_793481 ) ) ( not ( = ?auto_793478 ?auto_793482 ) ) ( not ( = ?auto_793479 ?auto_793480 ) ) ( not ( = ?auto_793479 ?auto_793481 ) ) ( not ( = ?auto_793479 ?auto_793482 ) ) ( not ( = ?auto_793480 ?auto_793481 ) ) ( not ( = ?auto_793480 ?auto_793482 ) ) ( not ( = ?auto_793481 ?auto_793482 ) ) ( ON ?auto_793480 ?auto_793481 ) ( ON ?auto_793479 ?auto_793480 ) ( CLEAR ?auto_793477 ) ( ON ?auto_793478 ?auto_793479 ) ( CLEAR ?auto_793478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_793473 ?auto_793474 ?auto_793475 ?auto_793476 ?auto_793477 ?auto_793478 )
      ( MAKE-9PILE ?auto_793473 ?auto_793474 ?auto_793475 ?auto_793476 ?auto_793477 ?auto_793478 ?auto_793479 ?auto_793480 ?auto_793481 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_793511 - BLOCK
      ?auto_793512 - BLOCK
      ?auto_793513 - BLOCK
      ?auto_793514 - BLOCK
      ?auto_793515 - BLOCK
      ?auto_793516 - BLOCK
      ?auto_793517 - BLOCK
      ?auto_793518 - BLOCK
      ?auto_793519 - BLOCK
    )
    :vars
    (
      ?auto_793520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793519 ?auto_793520 ) ( ON-TABLE ?auto_793511 ) ( ON ?auto_793512 ?auto_793511 ) ( ON ?auto_793513 ?auto_793512 ) ( ON ?auto_793514 ?auto_793513 ) ( not ( = ?auto_793511 ?auto_793512 ) ) ( not ( = ?auto_793511 ?auto_793513 ) ) ( not ( = ?auto_793511 ?auto_793514 ) ) ( not ( = ?auto_793511 ?auto_793515 ) ) ( not ( = ?auto_793511 ?auto_793516 ) ) ( not ( = ?auto_793511 ?auto_793517 ) ) ( not ( = ?auto_793511 ?auto_793518 ) ) ( not ( = ?auto_793511 ?auto_793519 ) ) ( not ( = ?auto_793511 ?auto_793520 ) ) ( not ( = ?auto_793512 ?auto_793513 ) ) ( not ( = ?auto_793512 ?auto_793514 ) ) ( not ( = ?auto_793512 ?auto_793515 ) ) ( not ( = ?auto_793512 ?auto_793516 ) ) ( not ( = ?auto_793512 ?auto_793517 ) ) ( not ( = ?auto_793512 ?auto_793518 ) ) ( not ( = ?auto_793512 ?auto_793519 ) ) ( not ( = ?auto_793512 ?auto_793520 ) ) ( not ( = ?auto_793513 ?auto_793514 ) ) ( not ( = ?auto_793513 ?auto_793515 ) ) ( not ( = ?auto_793513 ?auto_793516 ) ) ( not ( = ?auto_793513 ?auto_793517 ) ) ( not ( = ?auto_793513 ?auto_793518 ) ) ( not ( = ?auto_793513 ?auto_793519 ) ) ( not ( = ?auto_793513 ?auto_793520 ) ) ( not ( = ?auto_793514 ?auto_793515 ) ) ( not ( = ?auto_793514 ?auto_793516 ) ) ( not ( = ?auto_793514 ?auto_793517 ) ) ( not ( = ?auto_793514 ?auto_793518 ) ) ( not ( = ?auto_793514 ?auto_793519 ) ) ( not ( = ?auto_793514 ?auto_793520 ) ) ( not ( = ?auto_793515 ?auto_793516 ) ) ( not ( = ?auto_793515 ?auto_793517 ) ) ( not ( = ?auto_793515 ?auto_793518 ) ) ( not ( = ?auto_793515 ?auto_793519 ) ) ( not ( = ?auto_793515 ?auto_793520 ) ) ( not ( = ?auto_793516 ?auto_793517 ) ) ( not ( = ?auto_793516 ?auto_793518 ) ) ( not ( = ?auto_793516 ?auto_793519 ) ) ( not ( = ?auto_793516 ?auto_793520 ) ) ( not ( = ?auto_793517 ?auto_793518 ) ) ( not ( = ?auto_793517 ?auto_793519 ) ) ( not ( = ?auto_793517 ?auto_793520 ) ) ( not ( = ?auto_793518 ?auto_793519 ) ) ( not ( = ?auto_793518 ?auto_793520 ) ) ( not ( = ?auto_793519 ?auto_793520 ) ) ( ON ?auto_793518 ?auto_793519 ) ( ON ?auto_793517 ?auto_793518 ) ( ON ?auto_793516 ?auto_793517 ) ( CLEAR ?auto_793514 ) ( ON ?auto_793515 ?auto_793516 ) ( CLEAR ?auto_793515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_793511 ?auto_793512 ?auto_793513 ?auto_793514 ?auto_793515 )
      ( MAKE-9PILE ?auto_793511 ?auto_793512 ?auto_793513 ?auto_793514 ?auto_793515 ?auto_793516 ?auto_793517 ?auto_793518 ?auto_793519 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_793549 - BLOCK
      ?auto_793550 - BLOCK
      ?auto_793551 - BLOCK
      ?auto_793552 - BLOCK
      ?auto_793553 - BLOCK
      ?auto_793554 - BLOCK
      ?auto_793555 - BLOCK
      ?auto_793556 - BLOCK
      ?auto_793557 - BLOCK
    )
    :vars
    (
      ?auto_793558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793557 ?auto_793558 ) ( ON-TABLE ?auto_793549 ) ( ON ?auto_793550 ?auto_793549 ) ( ON ?auto_793551 ?auto_793550 ) ( not ( = ?auto_793549 ?auto_793550 ) ) ( not ( = ?auto_793549 ?auto_793551 ) ) ( not ( = ?auto_793549 ?auto_793552 ) ) ( not ( = ?auto_793549 ?auto_793553 ) ) ( not ( = ?auto_793549 ?auto_793554 ) ) ( not ( = ?auto_793549 ?auto_793555 ) ) ( not ( = ?auto_793549 ?auto_793556 ) ) ( not ( = ?auto_793549 ?auto_793557 ) ) ( not ( = ?auto_793549 ?auto_793558 ) ) ( not ( = ?auto_793550 ?auto_793551 ) ) ( not ( = ?auto_793550 ?auto_793552 ) ) ( not ( = ?auto_793550 ?auto_793553 ) ) ( not ( = ?auto_793550 ?auto_793554 ) ) ( not ( = ?auto_793550 ?auto_793555 ) ) ( not ( = ?auto_793550 ?auto_793556 ) ) ( not ( = ?auto_793550 ?auto_793557 ) ) ( not ( = ?auto_793550 ?auto_793558 ) ) ( not ( = ?auto_793551 ?auto_793552 ) ) ( not ( = ?auto_793551 ?auto_793553 ) ) ( not ( = ?auto_793551 ?auto_793554 ) ) ( not ( = ?auto_793551 ?auto_793555 ) ) ( not ( = ?auto_793551 ?auto_793556 ) ) ( not ( = ?auto_793551 ?auto_793557 ) ) ( not ( = ?auto_793551 ?auto_793558 ) ) ( not ( = ?auto_793552 ?auto_793553 ) ) ( not ( = ?auto_793552 ?auto_793554 ) ) ( not ( = ?auto_793552 ?auto_793555 ) ) ( not ( = ?auto_793552 ?auto_793556 ) ) ( not ( = ?auto_793552 ?auto_793557 ) ) ( not ( = ?auto_793552 ?auto_793558 ) ) ( not ( = ?auto_793553 ?auto_793554 ) ) ( not ( = ?auto_793553 ?auto_793555 ) ) ( not ( = ?auto_793553 ?auto_793556 ) ) ( not ( = ?auto_793553 ?auto_793557 ) ) ( not ( = ?auto_793553 ?auto_793558 ) ) ( not ( = ?auto_793554 ?auto_793555 ) ) ( not ( = ?auto_793554 ?auto_793556 ) ) ( not ( = ?auto_793554 ?auto_793557 ) ) ( not ( = ?auto_793554 ?auto_793558 ) ) ( not ( = ?auto_793555 ?auto_793556 ) ) ( not ( = ?auto_793555 ?auto_793557 ) ) ( not ( = ?auto_793555 ?auto_793558 ) ) ( not ( = ?auto_793556 ?auto_793557 ) ) ( not ( = ?auto_793556 ?auto_793558 ) ) ( not ( = ?auto_793557 ?auto_793558 ) ) ( ON ?auto_793556 ?auto_793557 ) ( ON ?auto_793555 ?auto_793556 ) ( ON ?auto_793554 ?auto_793555 ) ( ON ?auto_793553 ?auto_793554 ) ( CLEAR ?auto_793551 ) ( ON ?auto_793552 ?auto_793553 ) ( CLEAR ?auto_793552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_793549 ?auto_793550 ?auto_793551 ?auto_793552 )
      ( MAKE-9PILE ?auto_793549 ?auto_793550 ?auto_793551 ?auto_793552 ?auto_793553 ?auto_793554 ?auto_793555 ?auto_793556 ?auto_793557 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_793587 - BLOCK
      ?auto_793588 - BLOCK
      ?auto_793589 - BLOCK
      ?auto_793590 - BLOCK
      ?auto_793591 - BLOCK
      ?auto_793592 - BLOCK
      ?auto_793593 - BLOCK
      ?auto_793594 - BLOCK
      ?auto_793595 - BLOCK
    )
    :vars
    (
      ?auto_793596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793595 ?auto_793596 ) ( ON-TABLE ?auto_793587 ) ( ON ?auto_793588 ?auto_793587 ) ( not ( = ?auto_793587 ?auto_793588 ) ) ( not ( = ?auto_793587 ?auto_793589 ) ) ( not ( = ?auto_793587 ?auto_793590 ) ) ( not ( = ?auto_793587 ?auto_793591 ) ) ( not ( = ?auto_793587 ?auto_793592 ) ) ( not ( = ?auto_793587 ?auto_793593 ) ) ( not ( = ?auto_793587 ?auto_793594 ) ) ( not ( = ?auto_793587 ?auto_793595 ) ) ( not ( = ?auto_793587 ?auto_793596 ) ) ( not ( = ?auto_793588 ?auto_793589 ) ) ( not ( = ?auto_793588 ?auto_793590 ) ) ( not ( = ?auto_793588 ?auto_793591 ) ) ( not ( = ?auto_793588 ?auto_793592 ) ) ( not ( = ?auto_793588 ?auto_793593 ) ) ( not ( = ?auto_793588 ?auto_793594 ) ) ( not ( = ?auto_793588 ?auto_793595 ) ) ( not ( = ?auto_793588 ?auto_793596 ) ) ( not ( = ?auto_793589 ?auto_793590 ) ) ( not ( = ?auto_793589 ?auto_793591 ) ) ( not ( = ?auto_793589 ?auto_793592 ) ) ( not ( = ?auto_793589 ?auto_793593 ) ) ( not ( = ?auto_793589 ?auto_793594 ) ) ( not ( = ?auto_793589 ?auto_793595 ) ) ( not ( = ?auto_793589 ?auto_793596 ) ) ( not ( = ?auto_793590 ?auto_793591 ) ) ( not ( = ?auto_793590 ?auto_793592 ) ) ( not ( = ?auto_793590 ?auto_793593 ) ) ( not ( = ?auto_793590 ?auto_793594 ) ) ( not ( = ?auto_793590 ?auto_793595 ) ) ( not ( = ?auto_793590 ?auto_793596 ) ) ( not ( = ?auto_793591 ?auto_793592 ) ) ( not ( = ?auto_793591 ?auto_793593 ) ) ( not ( = ?auto_793591 ?auto_793594 ) ) ( not ( = ?auto_793591 ?auto_793595 ) ) ( not ( = ?auto_793591 ?auto_793596 ) ) ( not ( = ?auto_793592 ?auto_793593 ) ) ( not ( = ?auto_793592 ?auto_793594 ) ) ( not ( = ?auto_793592 ?auto_793595 ) ) ( not ( = ?auto_793592 ?auto_793596 ) ) ( not ( = ?auto_793593 ?auto_793594 ) ) ( not ( = ?auto_793593 ?auto_793595 ) ) ( not ( = ?auto_793593 ?auto_793596 ) ) ( not ( = ?auto_793594 ?auto_793595 ) ) ( not ( = ?auto_793594 ?auto_793596 ) ) ( not ( = ?auto_793595 ?auto_793596 ) ) ( ON ?auto_793594 ?auto_793595 ) ( ON ?auto_793593 ?auto_793594 ) ( ON ?auto_793592 ?auto_793593 ) ( ON ?auto_793591 ?auto_793592 ) ( ON ?auto_793590 ?auto_793591 ) ( CLEAR ?auto_793588 ) ( ON ?auto_793589 ?auto_793590 ) ( CLEAR ?auto_793589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_793587 ?auto_793588 ?auto_793589 )
      ( MAKE-9PILE ?auto_793587 ?auto_793588 ?auto_793589 ?auto_793590 ?auto_793591 ?auto_793592 ?auto_793593 ?auto_793594 ?auto_793595 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_793625 - BLOCK
      ?auto_793626 - BLOCK
      ?auto_793627 - BLOCK
      ?auto_793628 - BLOCK
      ?auto_793629 - BLOCK
      ?auto_793630 - BLOCK
      ?auto_793631 - BLOCK
      ?auto_793632 - BLOCK
      ?auto_793633 - BLOCK
    )
    :vars
    (
      ?auto_793634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793633 ?auto_793634 ) ( ON-TABLE ?auto_793625 ) ( not ( = ?auto_793625 ?auto_793626 ) ) ( not ( = ?auto_793625 ?auto_793627 ) ) ( not ( = ?auto_793625 ?auto_793628 ) ) ( not ( = ?auto_793625 ?auto_793629 ) ) ( not ( = ?auto_793625 ?auto_793630 ) ) ( not ( = ?auto_793625 ?auto_793631 ) ) ( not ( = ?auto_793625 ?auto_793632 ) ) ( not ( = ?auto_793625 ?auto_793633 ) ) ( not ( = ?auto_793625 ?auto_793634 ) ) ( not ( = ?auto_793626 ?auto_793627 ) ) ( not ( = ?auto_793626 ?auto_793628 ) ) ( not ( = ?auto_793626 ?auto_793629 ) ) ( not ( = ?auto_793626 ?auto_793630 ) ) ( not ( = ?auto_793626 ?auto_793631 ) ) ( not ( = ?auto_793626 ?auto_793632 ) ) ( not ( = ?auto_793626 ?auto_793633 ) ) ( not ( = ?auto_793626 ?auto_793634 ) ) ( not ( = ?auto_793627 ?auto_793628 ) ) ( not ( = ?auto_793627 ?auto_793629 ) ) ( not ( = ?auto_793627 ?auto_793630 ) ) ( not ( = ?auto_793627 ?auto_793631 ) ) ( not ( = ?auto_793627 ?auto_793632 ) ) ( not ( = ?auto_793627 ?auto_793633 ) ) ( not ( = ?auto_793627 ?auto_793634 ) ) ( not ( = ?auto_793628 ?auto_793629 ) ) ( not ( = ?auto_793628 ?auto_793630 ) ) ( not ( = ?auto_793628 ?auto_793631 ) ) ( not ( = ?auto_793628 ?auto_793632 ) ) ( not ( = ?auto_793628 ?auto_793633 ) ) ( not ( = ?auto_793628 ?auto_793634 ) ) ( not ( = ?auto_793629 ?auto_793630 ) ) ( not ( = ?auto_793629 ?auto_793631 ) ) ( not ( = ?auto_793629 ?auto_793632 ) ) ( not ( = ?auto_793629 ?auto_793633 ) ) ( not ( = ?auto_793629 ?auto_793634 ) ) ( not ( = ?auto_793630 ?auto_793631 ) ) ( not ( = ?auto_793630 ?auto_793632 ) ) ( not ( = ?auto_793630 ?auto_793633 ) ) ( not ( = ?auto_793630 ?auto_793634 ) ) ( not ( = ?auto_793631 ?auto_793632 ) ) ( not ( = ?auto_793631 ?auto_793633 ) ) ( not ( = ?auto_793631 ?auto_793634 ) ) ( not ( = ?auto_793632 ?auto_793633 ) ) ( not ( = ?auto_793632 ?auto_793634 ) ) ( not ( = ?auto_793633 ?auto_793634 ) ) ( ON ?auto_793632 ?auto_793633 ) ( ON ?auto_793631 ?auto_793632 ) ( ON ?auto_793630 ?auto_793631 ) ( ON ?auto_793629 ?auto_793630 ) ( ON ?auto_793628 ?auto_793629 ) ( ON ?auto_793627 ?auto_793628 ) ( CLEAR ?auto_793625 ) ( ON ?auto_793626 ?auto_793627 ) ( CLEAR ?auto_793626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_793625 ?auto_793626 )
      ( MAKE-9PILE ?auto_793625 ?auto_793626 ?auto_793627 ?auto_793628 ?auto_793629 ?auto_793630 ?auto_793631 ?auto_793632 ?auto_793633 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_793663 - BLOCK
      ?auto_793664 - BLOCK
      ?auto_793665 - BLOCK
      ?auto_793666 - BLOCK
      ?auto_793667 - BLOCK
      ?auto_793668 - BLOCK
      ?auto_793669 - BLOCK
      ?auto_793670 - BLOCK
      ?auto_793671 - BLOCK
    )
    :vars
    (
      ?auto_793672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793671 ?auto_793672 ) ( not ( = ?auto_793663 ?auto_793664 ) ) ( not ( = ?auto_793663 ?auto_793665 ) ) ( not ( = ?auto_793663 ?auto_793666 ) ) ( not ( = ?auto_793663 ?auto_793667 ) ) ( not ( = ?auto_793663 ?auto_793668 ) ) ( not ( = ?auto_793663 ?auto_793669 ) ) ( not ( = ?auto_793663 ?auto_793670 ) ) ( not ( = ?auto_793663 ?auto_793671 ) ) ( not ( = ?auto_793663 ?auto_793672 ) ) ( not ( = ?auto_793664 ?auto_793665 ) ) ( not ( = ?auto_793664 ?auto_793666 ) ) ( not ( = ?auto_793664 ?auto_793667 ) ) ( not ( = ?auto_793664 ?auto_793668 ) ) ( not ( = ?auto_793664 ?auto_793669 ) ) ( not ( = ?auto_793664 ?auto_793670 ) ) ( not ( = ?auto_793664 ?auto_793671 ) ) ( not ( = ?auto_793664 ?auto_793672 ) ) ( not ( = ?auto_793665 ?auto_793666 ) ) ( not ( = ?auto_793665 ?auto_793667 ) ) ( not ( = ?auto_793665 ?auto_793668 ) ) ( not ( = ?auto_793665 ?auto_793669 ) ) ( not ( = ?auto_793665 ?auto_793670 ) ) ( not ( = ?auto_793665 ?auto_793671 ) ) ( not ( = ?auto_793665 ?auto_793672 ) ) ( not ( = ?auto_793666 ?auto_793667 ) ) ( not ( = ?auto_793666 ?auto_793668 ) ) ( not ( = ?auto_793666 ?auto_793669 ) ) ( not ( = ?auto_793666 ?auto_793670 ) ) ( not ( = ?auto_793666 ?auto_793671 ) ) ( not ( = ?auto_793666 ?auto_793672 ) ) ( not ( = ?auto_793667 ?auto_793668 ) ) ( not ( = ?auto_793667 ?auto_793669 ) ) ( not ( = ?auto_793667 ?auto_793670 ) ) ( not ( = ?auto_793667 ?auto_793671 ) ) ( not ( = ?auto_793667 ?auto_793672 ) ) ( not ( = ?auto_793668 ?auto_793669 ) ) ( not ( = ?auto_793668 ?auto_793670 ) ) ( not ( = ?auto_793668 ?auto_793671 ) ) ( not ( = ?auto_793668 ?auto_793672 ) ) ( not ( = ?auto_793669 ?auto_793670 ) ) ( not ( = ?auto_793669 ?auto_793671 ) ) ( not ( = ?auto_793669 ?auto_793672 ) ) ( not ( = ?auto_793670 ?auto_793671 ) ) ( not ( = ?auto_793670 ?auto_793672 ) ) ( not ( = ?auto_793671 ?auto_793672 ) ) ( ON ?auto_793670 ?auto_793671 ) ( ON ?auto_793669 ?auto_793670 ) ( ON ?auto_793668 ?auto_793669 ) ( ON ?auto_793667 ?auto_793668 ) ( ON ?auto_793666 ?auto_793667 ) ( ON ?auto_793665 ?auto_793666 ) ( ON ?auto_793664 ?auto_793665 ) ( ON ?auto_793663 ?auto_793664 ) ( CLEAR ?auto_793663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_793663 )
      ( MAKE-9PILE ?auto_793663 ?auto_793664 ?auto_793665 ?auto_793666 ?auto_793667 ?auto_793668 ?auto_793669 ?auto_793670 ?auto_793671 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_793702 - BLOCK
      ?auto_793703 - BLOCK
      ?auto_793704 - BLOCK
      ?auto_793705 - BLOCK
      ?auto_793706 - BLOCK
      ?auto_793707 - BLOCK
      ?auto_793708 - BLOCK
      ?auto_793709 - BLOCK
      ?auto_793710 - BLOCK
      ?auto_793711 - BLOCK
    )
    :vars
    (
      ?auto_793712 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_793710 ) ( ON ?auto_793711 ?auto_793712 ) ( CLEAR ?auto_793711 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_793702 ) ( ON ?auto_793703 ?auto_793702 ) ( ON ?auto_793704 ?auto_793703 ) ( ON ?auto_793705 ?auto_793704 ) ( ON ?auto_793706 ?auto_793705 ) ( ON ?auto_793707 ?auto_793706 ) ( ON ?auto_793708 ?auto_793707 ) ( ON ?auto_793709 ?auto_793708 ) ( ON ?auto_793710 ?auto_793709 ) ( not ( = ?auto_793702 ?auto_793703 ) ) ( not ( = ?auto_793702 ?auto_793704 ) ) ( not ( = ?auto_793702 ?auto_793705 ) ) ( not ( = ?auto_793702 ?auto_793706 ) ) ( not ( = ?auto_793702 ?auto_793707 ) ) ( not ( = ?auto_793702 ?auto_793708 ) ) ( not ( = ?auto_793702 ?auto_793709 ) ) ( not ( = ?auto_793702 ?auto_793710 ) ) ( not ( = ?auto_793702 ?auto_793711 ) ) ( not ( = ?auto_793702 ?auto_793712 ) ) ( not ( = ?auto_793703 ?auto_793704 ) ) ( not ( = ?auto_793703 ?auto_793705 ) ) ( not ( = ?auto_793703 ?auto_793706 ) ) ( not ( = ?auto_793703 ?auto_793707 ) ) ( not ( = ?auto_793703 ?auto_793708 ) ) ( not ( = ?auto_793703 ?auto_793709 ) ) ( not ( = ?auto_793703 ?auto_793710 ) ) ( not ( = ?auto_793703 ?auto_793711 ) ) ( not ( = ?auto_793703 ?auto_793712 ) ) ( not ( = ?auto_793704 ?auto_793705 ) ) ( not ( = ?auto_793704 ?auto_793706 ) ) ( not ( = ?auto_793704 ?auto_793707 ) ) ( not ( = ?auto_793704 ?auto_793708 ) ) ( not ( = ?auto_793704 ?auto_793709 ) ) ( not ( = ?auto_793704 ?auto_793710 ) ) ( not ( = ?auto_793704 ?auto_793711 ) ) ( not ( = ?auto_793704 ?auto_793712 ) ) ( not ( = ?auto_793705 ?auto_793706 ) ) ( not ( = ?auto_793705 ?auto_793707 ) ) ( not ( = ?auto_793705 ?auto_793708 ) ) ( not ( = ?auto_793705 ?auto_793709 ) ) ( not ( = ?auto_793705 ?auto_793710 ) ) ( not ( = ?auto_793705 ?auto_793711 ) ) ( not ( = ?auto_793705 ?auto_793712 ) ) ( not ( = ?auto_793706 ?auto_793707 ) ) ( not ( = ?auto_793706 ?auto_793708 ) ) ( not ( = ?auto_793706 ?auto_793709 ) ) ( not ( = ?auto_793706 ?auto_793710 ) ) ( not ( = ?auto_793706 ?auto_793711 ) ) ( not ( = ?auto_793706 ?auto_793712 ) ) ( not ( = ?auto_793707 ?auto_793708 ) ) ( not ( = ?auto_793707 ?auto_793709 ) ) ( not ( = ?auto_793707 ?auto_793710 ) ) ( not ( = ?auto_793707 ?auto_793711 ) ) ( not ( = ?auto_793707 ?auto_793712 ) ) ( not ( = ?auto_793708 ?auto_793709 ) ) ( not ( = ?auto_793708 ?auto_793710 ) ) ( not ( = ?auto_793708 ?auto_793711 ) ) ( not ( = ?auto_793708 ?auto_793712 ) ) ( not ( = ?auto_793709 ?auto_793710 ) ) ( not ( = ?auto_793709 ?auto_793711 ) ) ( not ( = ?auto_793709 ?auto_793712 ) ) ( not ( = ?auto_793710 ?auto_793711 ) ) ( not ( = ?auto_793710 ?auto_793712 ) ) ( not ( = ?auto_793711 ?auto_793712 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_793711 ?auto_793712 )
      ( !STACK ?auto_793711 ?auto_793710 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_793744 - BLOCK
      ?auto_793745 - BLOCK
      ?auto_793746 - BLOCK
      ?auto_793747 - BLOCK
      ?auto_793748 - BLOCK
      ?auto_793749 - BLOCK
      ?auto_793750 - BLOCK
      ?auto_793751 - BLOCK
      ?auto_793752 - BLOCK
      ?auto_793753 - BLOCK
    )
    :vars
    (
      ?auto_793754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793753 ?auto_793754 ) ( ON-TABLE ?auto_793744 ) ( ON ?auto_793745 ?auto_793744 ) ( ON ?auto_793746 ?auto_793745 ) ( ON ?auto_793747 ?auto_793746 ) ( ON ?auto_793748 ?auto_793747 ) ( ON ?auto_793749 ?auto_793748 ) ( ON ?auto_793750 ?auto_793749 ) ( ON ?auto_793751 ?auto_793750 ) ( not ( = ?auto_793744 ?auto_793745 ) ) ( not ( = ?auto_793744 ?auto_793746 ) ) ( not ( = ?auto_793744 ?auto_793747 ) ) ( not ( = ?auto_793744 ?auto_793748 ) ) ( not ( = ?auto_793744 ?auto_793749 ) ) ( not ( = ?auto_793744 ?auto_793750 ) ) ( not ( = ?auto_793744 ?auto_793751 ) ) ( not ( = ?auto_793744 ?auto_793752 ) ) ( not ( = ?auto_793744 ?auto_793753 ) ) ( not ( = ?auto_793744 ?auto_793754 ) ) ( not ( = ?auto_793745 ?auto_793746 ) ) ( not ( = ?auto_793745 ?auto_793747 ) ) ( not ( = ?auto_793745 ?auto_793748 ) ) ( not ( = ?auto_793745 ?auto_793749 ) ) ( not ( = ?auto_793745 ?auto_793750 ) ) ( not ( = ?auto_793745 ?auto_793751 ) ) ( not ( = ?auto_793745 ?auto_793752 ) ) ( not ( = ?auto_793745 ?auto_793753 ) ) ( not ( = ?auto_793745 ?auto_793754 ) ) ( not ( = ?auto_793746 ?auto_793747 ) ) ( not ( = ?auto_793746 ?auto_793748 ) ) ( not ( = ?auto_793746 ?auto_793749 ) ) ( not ( = ?auto_793746 ?auto_793750 ) ) ( not ( = ?auto_793746 ?auto_793751 ) ) ( not ( = ?auto_793746 ?auto_793752 ) ) ( not ( = ?auto_793746 ?auto_793753 ) ) ( not ( = ?auto_793746 ?auto_793754 ) ) ( not ( = ?auto_793747 ?auto_793748 ) ) ( not ( = ?auto_793747 ?auto_793749 ) ) ( not ( = ?auto_793747 ?auto_793750 ) ) ( not ( = ?auto_793747 ?auto_793751 ) ) ( not ( = ?auto_793747 ?auto_793752 ) ) ( not ( = ?auto_793747 ?auto_793753 ) ) ( not ( = ?auto_793747 ?auto_793754 ) ) ( not ( = ?auto_793748 ?auto_793749 ) ) ( not ( = ?auto_793748 ?auto_793750 ) ) ( not ( = ?auto_793748 ?auto_793751 ) ) ( not ( = ?auto_793748 ?auto_793752 ) ) ( not ( = ?auto_793748 ?auto_793753 ) ) ( not ( = ?auto_793748 ?auto_793754 ) ) ( not ( = ?auto_793749 ?auto_793750 ) ) ( not ( = ?auto_793749 ?auto_793751 ) ) ( not ( = ?auto_793749 ?auto_793752 ) ) ( not ( = ?auto_793749 ?auto_793753 ) ) ( not ( = ?auto_793749 ?auto_793754 ) ) ( not ( = ?auto_793750 ?auto_793751 ) ) ( not ( = ?auto_793750 ?auto_793752 ) ) ( not ( = ?auto_793750 ?auto_793753 ) ) ( not ( = ?auto_793750 ?auto_793754 ) ) ( not ( = ?auto_793751 ?auto_793752 ) ) ( not ( = ?auto_793751 ?auto_793753 ) ) ( not ( = ?auto_793751 ?auto_793754 ) ) ( not ( = ?auto_793752 ?auto_793753 ) ) ( not ( = ?auto_793752 ?auto_793754 ) ) ( not ( = ?auto_793753 ?auto_793754 ) ) ( CLEAR ?auto_793751 ) ( ON ?auto_793752 ?auto_793753 ) ( CLEAR ?auto_793752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_793744 ?auto_793745 ?auto_793746 ?auto_793747 ?auto_793748 ?auto_793749 ?auto_793750 ?auto_793751 ?auto_793752 )
      ( MAKE-10PILE ?auto_793744 ?auto_793745 ?auto_793746 ?auto_793747 ?auto_793748 ?auto_793749 ?auto_793750 ?auto_793751 ?auto_793752 ?auto_793753 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_793786 - BLOCK
      ?auto_793787 - BLOCK
      ?auto_793788 - BLOCK
      ?auto_793789 - BLOCK
      ?auto_793790 - BLOCK
      ?auto_793791 - BLOCK
      ?auto_793792 - BLOCK
      ?auto_793793 - BLOCK
      ?auto_793794 - BLOCK
      ?auto_793795 - BLOCK
    )
    :vars
    (
      ?auto_793796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793795 ?auto_793796 ) ( ON-TABLE ?auto_793786 ) ( ON ?auto_793787 ?auto_793786 ) ( ON ?auto_793788 ?auto_793787 ) ( ON ?auto_793789 ?auto_793788 ) ( ON ?auto_793790 ?auto_793789 ) ( ON ?auto_793791 ?auto_793790 ) ( ON ?auto_793792 ?auto_793791 ) ( not ( = ?auto_793786 ?auto_793787 ) ) ( not ( = ?auto_793786 ?auto_793788 ) ) ( not ( = ?auto_793786 ?auto_793789 ) ) ( not ( = ?auto_793786 ?auto_793790 ) ) ( not ( = ?auto_793786 ?auto_793791 ) ) ( not ( = ?auto_793786 ?auto_793792 ) ) ( not ( = ?auto_793786 ?auto_793793 ) ) ( not ( = ?auto_793786 ?auto_793794 ) ) ( not ( = ?auto_793786 ?auto_793795 ) ) ( not ( = ?auto_793786 ?auto_793796 ) ) ( not ( = ?auto_793787 ?auto_793788 ) ) ( not ( = ?auto_793787 ?auto_793789 ) ) ( not ( = ?auto_793787 ?auto_793790 ) ) ( not ( = ?auto_793787 ?auto_793791 ) ) ( not ( = ?auto_793787 ?auto_793792 ) ) ( not ( = ?auto_793787 ?auto_793793 ) ) ( not ( = ?auto_793787 ?auto_793794 ) ) ( not ( = ?auto_793787 ?auto_793795 ) ) ( not ( = ?auto_793787 ?auto_793796 ) ) ( not ( = ?auto_793788 ?auto_793789 ) ) ( not ( = ?auto_793788 ?auto_793790 ) ) ( not ( = ?auto_793788 ?auto_793791 ) ) ( not ( = ?auto_793788 ?auto_793792 ) ) ( not ( = ?auto_793788 ?auto_793793 ) ) ( not ( = ?auto_793788 ?auto_793794 ) ) ( not ( = ?auto_793788 ?auto_793795 ) ) ( not ( = ?auto_793788 ?auto_793796 ) ) ( not ( = ?auto_793789 ?auto_793790 ) ) ( not ( = ?auto_793789 ?auto_793791 ) ) ( not ( = ?auto_793789 ?auto_793792 ) ) ( not ( = ?auto_793789 ?auto_793793 ) ) ( not ( = ?auto_793789 ?auto_793794 ) ) ( not ( = ?auto_793789 ?auto_793795 ) ) ( not ( = ?auto_793789 ?auto_793796 ) ) ( not ( = ?auto_793790 ?auto_793791 ) ) ( not ( = ?auto_793790 ?auto_793792 ) ) ( not ( = ?auto_793790 ?auto_793793 ) ) ( not ( = ?auto_793790 ?auto_793794 ) ) ( not ( = ?auto_793790 ?auto_793795 ) ) ( not ( = ?auto_793790 ?auto_793796 ) ) ( not ( = ?auto_793791 ?auto_793792 ) ) ( not ( = ?auto_793791 ?auto_793793 ) ) ( not ( = ?auto_793791 ?auto_793794 ) ) ( not ( = ?auto_793791 ?auto_793795 ) ) ( not ( = ?auto_793791 ?auto_793796 ) ) ( not ( = ?auto_793792 ?auto_793793 ) ) ( not ( = ?auto_793792 ?auto_793794 ) ) ( not ( = ?auto_793792 ?auto_793795 ) ) ( not ( = ?auto_793792 ?auto_793796 ) ) ( not ( = ?auto_793793 ?auto_793794 ) ) ( not ( = ?auto_793793 ?auto_793795 ) ) ( not ( = ?auto_793793 ?auto_793796 ) ) ( not ( = ?auto_793794 ?auto_793795 ) ) ( not ( = ?auto_793794 ?auto_793796 ) ) ( not ( = ?auto_793795 ?auto_793796 ) ) ( ON ?auto_793794 ?auto_793795 ) ( CLEAR ?auto_793792 ) ( ON ?auto_793793 ?auto_793794 ) ( CLEAR ?auto_793793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_793786 ?auto_793787 ?auto_793788 ?auto_793789 ?auto_793790 ?auto_793791 ?auto_793792 ?auto_793793 )
      ( MAKE-10PILE ?auto_793786 ?auto_793787 ?auto_793788 ?auto_793789 ?auto_793790 ?auto_793791 ?auto_793792 ?auto_793793 ?auto_793794 ?auto_793795 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_793828 - BLOCK
      ?auto_793829 - BLOCK
      ?auto_793830 - BLOCK
      ?auto_793831 - BLOCK
      ?auto_793832 - BLOCK
      ?auto_793833 - BLOCK
      ?auto_793834 - BLOCK
      ?auto_793835 - BLOCK
      ?auto_793836 - BLOCK
      ?auto_793837 - BLOCK
    )
    :vars
    (
      ?auto_793838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793837 ?auto_793838 ) ( ON-TABLE ?auto_793828 ) ( ON ?auto_793829 ?auto_793828 ) ( ON ?auto_793830 ?auto_793829 ) ( ON ?auto_793831 ?auto_793830 ) ( ON ?auto_793832 ?auto_793831 ) ( ON ?auto_793833 ?auto_793832 ) ( not ( = ?auto_793828 ?auto_793829 ) ) ( not ( = ?auto_793828 ?auto_793830 ) ) ( not ( = ?auto_793828 ?auto_793831 ) ) ( not ( = ?auto_793828 ?auto_793832 ) ) ( not ( = ?auto_793828 ?auto_793833 ) ) ( not ( = ?auto_793828 ?auto_793834 ) ) ( not ( = ?auto_793828 ?auto_793835 ) ) ( not ( = ?auto_793828 ?auto_793836 ) ) ( not ( = ?auto_793828 ?auto_793837 ) ) ( not ( = ?auto_793828 ?auto_793838 ) ) ( not ( = ?auto_793829 ?auto_793830 ) ) ( not ( = ?auto_793829 ?auto_793831 ) ) ( not ( = ?auto_793829 ?auto_793832 ) ) ( not ( = ?auto_793829 ?auto_793833 ) ) ( not ( = ?auto_793829 ?auto_793834 ) ) ( not ( = ?auto_793829 ?auto_793835 ) ) ( not ( = ?auto_793829 ?auto_793836 ) ) ( not ( = ?auto_793829 ?auto_793837 ) ) ( not ( = ?auto_793829 ?auto_793838 ) ) ( not ( = ?auto_793830 ?auto_793831 ) ) ( not ( = ?auto_793830 ?auto_793832 ) ) ( not ( = ?auto_793830 ?auto_793833 ) ) ( not ( = ?auto_793830 ?auto_793834 ) ) ( not ( = ?auto_793830 ?auto_793835 ) ) ( not ( = ?auto_793830 ?auto_793836 ) ) ( not ( = ?auto_793830 ?auto_793837 ) ) ( not ( = ?auto_793830 ?auto_793838 ) ) ( not ( = ?auto_793831 ?auto_793832 ) ) ( not ( = ?auto_793831 ?auto_793833 ) ) ( not ( = ?auto_793831 ?auto_793834 ) ) ( not ( = ?auto_793831 ?auto_793835 ) ) ( not ( = ?auto_793831 ?auto_793836 ) ) ( not ( = ?auto_793831 ?auto_793837 ) ) ( not ( = ?auto_793831 ?auto_793838 ) ) ( not ( = ?auto_793832 ?auto_793833 ) ) ( not ( = ?auto_793832 ?auto_793834 ) ) ( not ( = ?auto_793832 ?auto_793835 ) ) ( not ( = ?auto_793832 ?auto_793836 ) ) ( not ( = ?auto_793832 ?auto_793837 ) ) ( not ( = ?auto_793832 ?auto_793838 ) ) ( not ( = ?auto_793833 ?auto_793834 ) ) ( not ( = ?auto_793833 ?auto_793835 ) ) ( not ( = ?auto_793833 ?auto_793836 ) ) ( not ( = ?auto_793833 ?auto_793837 ) ) ( not ( = ?auto_793833 ?auto_793838 ) ) ( not ( = ?auto_793834 ?auto_793835 ) ) ( not ( = ?auto_793834 ?auto_793836 ) ) ( not ( = ?auto_793834 ?auto_793837 ) ) ( not ( = ?auto_793834 ?auto_793838 ) ) ( not ( = ?auto_793835 ?auto_793836 ) ) ( not ( = ?auto_793835 ?auto_793837 ) ) ( not ( = ?auto_793835 ?auto_793838 ) ) ( not ( = ?auto_793836 ?auto_793837 ) ) ( not ( = ?auto_793836 ?auto_793838 ) ) ( not ( = ?auto_793837 ?auto_793838 ) ) ( ON ?auto_793836 ?auto_793837 ) ( ON ?auto_793835 ?auto_793836 ) ( CLEAR ?auto_793833 ) ( ON ?auto_793834 ?auto_793835 ) ( CLEAR ?auto_793834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_793828 ?auto_793829 ?auto_793830 ?auto_793831 ?auto_793832 ?auto_793833 ?auto_793834 )
      ( MAKE-10PILE ?auto_793828 ?auto_793829 ?auto_793830 ?auto_793831 ?auto_793832 ?auto_793833 ?auto_793834 ?auto_793835 ?auto_793836 ?auto_793837 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_793870 - BLOCK
      ?auto_793871 - BLOCK
      ?auto_793872 - BLOCK
      ?auto_793873 - BLOCK
      ?auto_793874 - BLOCK
      ?auto_793875 - BLOCK
      ?auto_793876 - BLOCK
      ?auto_793877 - BLOCK
      ?auto_793878 - BLOCK
      ?auto_793879 - BLOCK
    )
    :vars
    (
      ?auto_793880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793879 ?auto_793880 ) ( ON-TABLE ?auto_793870 ) ( ON ?auto_793871 ?auto_793870 ) ( ON ?auto_793872 ?auto_793871 ) ( ON ?auto_793873 ?auto_793872 ) ( ON ?auto_793874 ?auto_793873 ) ( not ( = ?auto_793870 ?auto_793871 ) ) ( not ( = ?auto_793870 ?auto_793872 ) ) ( not ( = ?auto_793870 ?auto_793873 ) ) ( not ( = ?auto_793870 ?auto_793874 ) ) ( not ( = ?auto_793870 ?auto_793875 ) ) ( not ( = ?auto_793870 ?auto_793876 ) ) ( not ( = ?auto_793870 ?auto_793877 ) ) ( not ( = ?auto_793870 ?auto_793878 ) ) ( not ( = ?auto_793870 ?auto_793879 ) ) ( not ( = ?auto_793870 ?auto_793880 ) ) ( not ( = ?auto_793871 ?auto_793872 ) ) ( not ( = ?auto_793871 ?auto_793873 ) ) ( not ( = ?auto_793871 ?auto_793874 ) ) ( not ( = ?auto_793871 ?auto_793875 ) ) ( not ( = ?auto_793871 ?auto_793876 ) ) ( not ( = ?auto_793871 ?auto_793877 ) ) ( not ( = ?auto_793871 ?auto_793878 ) ) ( not ( = ?auto_793871 ?auto_793879 ) ) ( not ( = ?auto_793871 ?auto_793880 ) ) ( not ( = ?auto_793872 ?auto_793873 ) ) ( not ( = ?auto_793872 ?auto_793874 ) ) ( not ( = ?auto_793872 ?auto_793875 ) ) ( not ( = ?auto_793872 ?auto_793876 ) ) ( not ( = ?auto_793872 ?auto_793877 ) ) ( not ( = ?auto_793872 ?auto_793878 ) ) ( not ( = ?auto_793872 ?auto_793879 ) ) ( not ( = ?auto_793872 ?auto_793880 ) ) ( not ( = ?auto_793873 ?auto_793874 ) ) ( not ( = ?auto_793873 ?auto_793875 ) ) ( not ( = ?auto_793873 ?auto_793876 ) ) ( not ( = ?auto_793873 ?auto_793877 ) ) ( not ( = ?auto_793873 ?auto_793878 ) ) ( not ( = ?auto_793873 ?auto_793879 ) ) ( not ( = ?auto_793873 ?auto_793880 ) ) ( not ( = ?auto_793874 ?auto_793875 ) ) ( not ( = ?auto_793874 ?auto_793876 ) ) ( not ( = ?auto_793874 ?auto_793877 ) ) ( not ( = ?auto_793874 ?auto_793878 ) ) ( not ( = ?auto_793874 ?auto_793879 ) ) ( not ( = ?auto_793874 ?auto_793880 ) ) ( not ( = ?auto_793875 ?auto_793876 ) ) ( not ( = ?auto_793875 ?auto_793877 ) ) ( not ( = ?auto_793875 ?auto_793878 ) ) ( not ( = ?auto_793875 ?auto_793879 ) ) ( not ( = ?auto_793875 ?auto_793880 ) ) ( not ( = ?auto_793876 ?auto_793877 ) ) ( not ( = ?auto_793876 ?auto_793878 ) ) ( not ( = ?auto_793876 ?auto_793879 ) ) ( not ( = ?auto_793876 ?auto_793880 ) ) ( not ( = ?auto_793877 ?auto_793878 ) ) ( not ( = ?auto_793877 ?auto_793879 ) ) ( not ( = ?auto_793877 ?auto_793880 ) ) ( not ( = ?auto_793878 ?auto_793879 ) ) ( not ( = ?auto_793878 ?auto_793880 ) ) ( not ( = ?auto_793879 ?auto_793880 ) ) ( ON ?auto_793878 ?auto_793879 ) ( ON ?auto_793877 ?auto_793878 ) ( ON ?auto_793876 ?auto_793877 ) ( CLEAR ?auto_793874 ) ( ON ?auto_793875 ?auto_793876 ) ( CLEAR ?auto_793875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_793870 ?auto_793871 ?auto_793872 ?auto_793873 ?auto_793874 ?auto_793875 )
      ( MAKE-10PILE ?auto_793870 ?auto_793871 ?auto_793872 ?auto_793873 ?auto_793874 ?auto_793875 ?auto_793876 ?auto_793877 ?auto_793878 ?auto_793879 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_793912 - BLOCK
      ?auto_793913 - BLOCK
      ?auto_793914 - BLOCK
      ?auto_793915 - BLOCK
      ?auto_793916 - BLOCK
      ?auto_793917 - BLOCK
      ?auto_793918 - BLOCK
      ?auto_793919 - BLOCK
      ?auto_793920 - BLOCK
      ?auto_793921 - BLOCK
    )
    :vars
    (
      ?auto_793922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793921 ?auto_793922 ) ( ON-TABLE ?auto_793912 ) ( ON ?auto_793913 ?auto_793912 ) ( ON ?auto_793914 ?auto_793913 ) ( ON ?auto_793915 ?auto_793914 ) ( not ( = ?auto_793912 ?auto_793913 ) ) ( not ( = ?auto_793912 ?auto_793914 ) ) ( not ( = ?auto_793912 ?auto_793915 ) ) ( not ( = ?auto_793912 ?auto_793916 ) ) ( not ( = ?auto_793912 ?auto_793917 ) ) ( not ( = ?auto_793912 ?auto_793918 ) ) ( not ( = ?auto_793912 ?auto_793919 ) ) ( not ( = ?auto_793912 ?auto_793920 ) ) ( not ( = ?auto_793912 ?auto_793921 ) ) ( not ( = ?auto_793912 ?auto_793922 ) ) ( not ( = ?auto_793913 ?auto_793914 ) ) ( not ( = ?auto_793913 ?auto_793915 ) ) ( not ( = ?auto_793913 ?auto_793916 ) ) ( not ( = ?auto_793913 ?auto_793917 ) ) ( not ( = ?auto_793913 ?auto_793918 ) ) ( not ( = ?auto_793913 ?auto_793919 ) ) ( not ( = ?auto_793913 ?auto_793920 ) ) ( not ( = ?auto_793913 ?auto_793921 ) ) ( not ( = ?auto_793913 ?auto_793922 ) ) ( not ( = ?auto_793914 ?auto_793915 ) ) ( not ( = ?auto_793914 ?auto_793916 ) ) ( not ( = ?auto_793914 ?auto_793917 ) ) ( not ( = ?auto_793914 ?auto_793918 ) ) ( not ( = ?auto_793914 ?auto_793919 ) ) ( not ( = ?auto_793914 ?auto_793920 ) ) ( not ( = ?auto_793914 ?auto_793921 ) ) ( not ( = ?auto_793914 ?auto_793922 ) ) ( not ( = ?auto_793915 ?auto_793916 ) ) ( not ( = ?auto_793915 ?auto_793917 ) ) ( not ( = ?auto_793915 ?auto_793918 ) ) ( not ( = ?auto_793915 ?auto_793919 ) ) ( not ( = ?auto_793915 ?auto_793920 ) ) ( not ( = ?auto_793915 ?auto_793921 ) ) ( not ( = ?auto_793915 ?auto_793922 ) ) ( not ( = ?auto_793916 ?auto_793917 ) ) ( not ( = ?auto_793916 ?auto_793918 ) ) ( not ( = ?auto_793916 ?auto_793919 ) ) ( not ( = ?auto_793916 ?auto_793920 ) ) ( not ( = ?auto_793916 ?auto_793921 ) ) ( not ( = ?auto_793916 ?auto_793922 ) ) ( not ( = ?auto_793917 ?auto_793918 ) ) ( not ( = ?auto_793917 ?auto_793919 ) ) ( not ( = ?auto_793917 ?auto_793920 ) ) ( not ( = ?auto_793917 ?auto_793921 ) ) ( not ( = ?auto_793917 ?auto_793922 ) ) ( not ( = ?auto_793918 ?auto_793919 ) ) ( not ( = ?auto_793918 ?auto_793920 ) ) ( not ( = ?auto_793918 ?auto_793921 ) ) ( not ( = ?auto_793918 ?auto_793922 ) ) ( not ( = ?auto_793919 ?auto_793920 ) ) ( not ( = ?auto_793919 ?auto_793921 ) ) ( not ( = ?auto_793919 ?auto_793922 ) ) ( not ( = ?auto_793920 ?auto_793921 ) ) ( not ( = ?auto_793920 ?auto_793922 ) ) ( not ( = ?auto_793921 ?auto_793922 ) ) ( ON ?auto_793920 ?auto_793921 ) ( ON ?auto_793919 ?auto_793920 ) ( ON ?auto_793918 ?auto_793919 ) ( ON ?auto_793917 ?auto_793918 ) ( CLEAR ?auto_793915 ) ( ON ?auto_793916 ?auto_793917 ) ( CLEAR ?auto_793916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_793912 ?auto_793913 ?auto_793914 ?auto_793915 ?auto_793916 )
      ( MAKE-10PILE ?auto_793912 ?auto_793913 ?auto_793914 ?auto_793915 ?auto_793916 ?auto_793917 ?auto_793918 ?auto_793919 ?auto_793920 ?auto_793921 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_793954 - BLOCK
      ?auto_793955 - BLOCK
      ?auto_793956 - BLOCK
      ?auto_793957 - BLOCK
      ?auto_793958 - BLOCK
      ?auto_793959 - BLOCK
      ?auto_793960 - BLOCK
      ?auto_793961 - BLOCK
      ?auto_793962 - BLOCK
      ?auto_793963 - BLOCK
    )
    :vars
    (
      ?auto_793964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_793963 ?auto_793964 ) ( ON-TABLE ?auto_793954 ) ( ON ?auto_793955 ?auto_793954 ) ( ON ?auto_793956 ?auto_793955 ) ( not ( = ?auto_793954 ?auto_793955 ) ) ( not ( = ?auto_793954 ?auto_793956 ) ) ( not ( = ?auto_793954 ?auto_793957 ) ) ( not ( = ?auto_793954 ?auto_793958 ) ) ( not ( = ?auto_793954 ?auto_793959 ) ) ( not ( = ?auto_793954 ?auto_793960 ) ) ( not ( = ?auto_793954 ?auto_793961 ) ) ( not ( = ?auto_793954 ?auto_793962 ) ) ( not ( = ?auto_793954 ?auto_793963 ) ) ( not ( = ?auto_793954 ?auto_793964 ) ) ( not ( = ?auto_793955 ?auto_793956 ) ) ( not ( = ?auto_793955 ?auto_793957 ) ) ( not ( = ?auto_793955 ?auto_793958 ) ) ( not ( = ?auto_793955 ?auto_793959 ) ) ( not ( = ?auto_793955 ?auto_793960 ) ) ( not ( = ?auto_793955 ?auto_793961 ) ) ( not ( = ?auto_793955 ?auto_793962 ) ) ( not ( = ?auto_793955 ?auto_793963 ) ) ( not ( = ?auto_793955 ?auto_793964 ) ) ( not ( = ?auto_793956 ?auto_793957 ) ) ( not ( = ?auto_793956 ?auto_793958 ) ) ( not ( = ?auto_793956 ?auto_793959 ) ) ( not ( = ?auto_793956 ?auto_793960 ) ) ( not ( = ?auto_793956 ?auto_793961 ) ) ( not ( = ?auto_793956 ?auto_793962 ) ) ( not ( = ?auto_793956 ?auto_793963 ) ) ( not ( = ?auto_793956 ?auto_793964 ) ) ( not ( = ?auto_793957 ?auto_793958 ) ) ( not ( = ?auto_793957 ?auto_793959 ) ) ( not ( = ?auto_793957 ?auto_793960 ) ) ( not ( = ?auto_793957 ?auto_793961 ) ) ( not ( = ?auto_793957 ?auto_793962 ) ) ( not ( = ?auto_793957 ?auto_793963 ) ) ( not ( = ?auto_793957 ?auto_793964 ) ) ( not ( = ?auto_793958 ?auto_793959 ) ) ( not ( = ?auto_793958 ?auto_793960 ) ) ( not ( = ?auto_793958 ?auto_793961 ) ) ( not ( = ?auto_793958 ?auto_793962 ) ) ( not ( = ?auto_793958 ?auto_793963 ) ) ( not ( = ?auto_793958 ?auto_793964 ) ) ( not ( = ?auto_793959 ?auto_793960 ) ) ( not ( = ?auto_793959 ?auto_793961 ) ) ( not ( = ?auto_793959 ?auto_793962 ) ) ( not ( = ?auto_793959 ?auto_793963 ) ) ( not ( = ?auto_793959 ?auto_793964 ) ) ( not ( = ?auto_793960 ?auto_793961 ) ) ( not ( = ?auto_793960 ?auto_793962 ) ) ( not ( = ?auto_793960 ?auto_793963 ) ) ( not ( = ?auto_793960 ?auto_793964 ) ) ( not ( = ?auto_793961 ?auto_793962 ) ) ( not ( = ?auto_793961 ?auto_793963 ) ) ( not ( = ?auto_793961 ?auto_793964 ) ) ( not ( = ?auto_793962 ?auto_793963 ) ) ( not ( = ?auto_793962 ?auto_793964 ) ) ( not ( = ?auto_793963 ?auto_793964 ) ) ( ON ?auto_793962 ?auto_793963 ) ( ON ?auto_793961 ?auto_793962 ) ( ON ?auto_793960 ?auto_793961 ) ( ON ?auto_793959 ?auto_793960 ) ( ON ?auto_793958 ?auto_793959 ) ( CLEAR ?auto_793956 ) ( ON ?auto_793957 ?auto_793958 ) ( CLEAR ?auto_793957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_793954 ?auto_793955 ?auto_793956 ?auto_793957 )
      ( MAKE-10PILE ?auto_793954 ?auto_793955 ?auto_793956 ?auto_793957 ?auto_793958 ?auto_793959 ?auto_793960 ?auto_793961 ?auto_793962 ?auto_793963 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_793996 - BLOCK
      ?auto_793997 - BLOCK
      ?auto_793998 - BLOCK
      ?auto_793999 - BLOCK
      ?auto_794000 - BLOCK
      ?auto_794001 - BLOCK
      ?auto_794002 - BLOCK
      ?auto_794003 - BLOCK
      ?auto_794004 - BLOCK
      ?auto_794005 - BLOCK
    )
    :vars
    (
      ?auto_794006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794005 ?auto_794006 ) ( ON-TABLE ?auto_793996 ) ( ON ?auto_793997 ?auto_793996 ) ( not ( = ?auto_793996 ?auto_793997 ) ) ( not ( = ?auto_793996 ?auto_793998 ) ) ( not ( = ?auto_793996 ?auto_793999 ) ) ( not ( = ?auto_793996 ?auto_794000 ) ) ( not ( = ?auto_793996 ?auto_794001 ) ) ( not ( = ?auto_793996 ?auto_794002 ) ) ( not ( = ?auto_793996 ?auto_794003 ) ) ( not ( = ?auto_793996 ?auto_794004 ) ) ( not ( = ?auto_793996 ?auto_794005 ) ) ( not ( = ?auto_793996 ?auto_794006 ) ) ( not ( = ?auto_793997 ?auto_793998 ) ) ( not ( = ?auto_793997 ?auto_793999 ) ) ( not ( = ?auto_793997 ?auto_794000 ) ) ( not ( = ?auto_793997 ?auto_794001 ) ) ( not ( = ?auto_793997 ?auto_794002 ) ) ( not ( = ?auto_793997 ?auto_794003 ) ) ( not ( = ?auto_793997 ?auto_794004 ) ) ( not ( = ?auto_793997 ?auto_794005 ) ) ( not ( = ?auto_793997 ?auto_794006 ) ) ( not ( = ?auto_793998 ?auto_793999 ) ) ( not ( = ?auto_793998 ?auto_794000 ) ) ( not ( = ?auto_793998 ?auto_794001 ) ) ( not ( = ?auto_793998 ?auto_794002 ) ) ( not ( = ?auto_793998 ?auto_794003 ) ) ( not ( = ?auto_793998 ?auto_794004 ) ) ( not ( = ?auto_793998 ?auto_794005 ) ) ( not ( = ?auto_793998 ?auto_794006 ) ) ( not ( = ?auto_793999 ?auto_794000 ) ) ( not ( = ?auto_793999 ?auto_794001 ) ) ( not ( = ?auto_793999 ?auto_794002 ) ) ( not ( = ?auto_793999 ?auto_794003 ) ) ( not ( = ?auto_793999 ?auto_794004 ) ) ( not ( = ?auto_793999 ?auto_794005 ) ) ( not ( = ?auto_793999 ?auto_794006 ) ) ( not ( = ?auto_794000 ?auto_794001 ) ) ( not ( = ?auto_794000 ?auto_794002 ) ) ( not ( = ?auto_794000 ?auto_794003 ) ) ( not ( = ?auto_794000 ?auto_794004 ) ) ( not ( = ?auto_794000 ?auto_794005 ) ) ( not ( = ?auto_794000 ?auto_794006 ) ) ( not ( = ?auto_794001 ?auto_794002 ) ) ( not ( = ?auto_794001 ?auto_794003 ) ) ( not ( = ?auto_794001 ?auto_794004 ) ) ( not ( = ?auto_794001 ?auto_794005 ) ) ( not ( = ?auto_794001 ?auto_794006 ) ) ( not ( = ?auto_794002 ?auto_794003 ) ) ( not ( = ?auto_794002 ?auto_794004 ) ) ( not ( = ?auto_794002 ?auto_794005 ) ) ( not ( = ?auto_794002 ?auto_794006 ) ) ( not ( = ?auto_794003 ?auto_794004 ) ) ( not ( = ?auto_794003 ?auto_794005 ) ) ( not ( = ?auto_794003 ?auto_794006 ) ) ( not ( = ?auto_794004 ?auto_794005 ) ) ( not ( = ?auto_794004 ?auto_794006 ) ) ( not ( = ?auto_794005 ?auto_794006 ) ) ( ON ?auto_794004 ?auto_794005 ) ( ON ?auto_794003 ?auto_794004 ) ( ON ?auto_794002 ?auto_794003 ) ( ON ?auto_794001 ?auto_794002 ) ( ON ?auto_794000 ?auto_794001 ) ( ON ?auto_793999 ?auto_794000 ) ( CLEAR ?auto_793997 ) ( ON ?auto_793998 ?auto_793999 ) ( CLEAR ?auto_793998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_793996 ?auto_793997 ?auto_793998 )
      ( MAKE-10PILE ?auto_793996 ?auto_793997 ?auto_793998 ?auto_793999 ?auto_794000 ?auto_794001 ?auto_794002 ?auto_794003 ?auto_794004 ?auto_794005 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_794038 - BLOCK
      ?auto_794039 - BLOCK
      ?auto_794040 - BLOCK
      ?auto_794041 - BLOCK
      ?auto_794042 - BLOCK
      ?auto_794043 - BLOCK
      ?auto_794044 - BLOCK
      ?auto_794045 - BLOCK
      ?auto_794046 - BLOCK
      ?auto_794047 - BLOCK
    )
    :vars
    (
      ?auto_794048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794047 ?auto_794048 ) ( ON-TABLE ?auto_794038 ) ( not ( = ?auto_794038 ?auto_794039 ) ) ( not ( = ?auto_794038 ?auto_794040 ) ) ( not ( = ?auto_794038 ?auto_794041 ) ) ( not ( = ?auto_794038 ?auto_794042 ) ) ( not ( = ?auto_794038 ?auto_794043 ) ) ( not ( = ?auto_794038 ?auto_794044 ) ) ( not ( = ?auto_794038 ?auto_794045 ) ) ( not ( = ?auto_794038 ?auto_794046 ) ) ( not ( = ?auto_794038 ?auto_794047 ) ) ( not ( = ?auto_794038 ?auto_794048 ) ) ( not ( = ?auto_794039 ?auto_794040 ) ) ( not ( = ?auto_794039 ?auto_794041 ) ) ( not ( = ?auto_794039 ?auto_794042 ) ) ( not ( = ?auto_794039 ?auto_794043 ) ) ( not ( = ?auto_794039 ?auto_794044 ) ) ( not ( = ?auto_794039 ?auto_794045 ) ) ( not ( = ?auto_794039 ?auto_794046 ) ) ( not ( = ?auto_794039 ?auto_794047 ) ) ( not ( = ?auto_794039 ?auto_794048 ) ) ( not ( = ?auto_794040 ?auto_794041 ) ) ( not ( = ?auto_794040 ?auto_794042 ) ) ( not ( = ?auto_794040 ?auto_794043 ) ) ( not ( = ?auto_794040 ?auto_794044 ) ) ( not ( = ?auto_794040 ?auto_794045 ) ) ( not ( = ?auto_794040 ?auto_794046 ) ) ( not ( = ?auto_794040 ?auto_794047 ) ) ( not ( = ?auto_794040 ?auto_794048 ) ) ( not ( = ?auto_794041 ?auto_794042 ) ) ( not ( = ?auto_794041 ?auto_794043 ) ) ( not ( = ?auto_794041 ?auto_794044 ) ) ( not ( = ?auto_794041 ?auto_794045 ) ) ( not ( = ?auto_794041 ?auto_794046 ) ) ( not ( = ?auto_794041 ?auto_794047 ) ) ( not ( = ?auto_794041 ?auto_794048 ) ) ( not ( = ?auto_794042 ?auto_794043 ) ) ( not ( = ?auto_794042 ?auto_794044 ) ) ( not ( = ?auto_794042 ?auto_794045 ) ) ( not ( = ?auto_794042 ?auto_794046 ) ) ( not ( = ?auto_794042 ?auto_794047 ) ) ( not ( = ?auto_794042 ?auto_794048 ) ) ( not ( = ?auto_794043 ?auto_794044 ) ) ( not ( = ?auto_794043 ?auto_794045 ) ) ( not ( = ?auto_794043 ?auto_794046 ) ) ( not ( = ?auto_794043 ?auto_794047 ) ) ( not ( = ?auto_794043 ?auto_794048 ) ) ( not ( = ?auto_794044 ?auto_794045 ) ) ( not ( = ?auto_794044 ?auto_794046 ) ) ( not ( = ?auto_794044 ?auto_794047 ) ) ( not ( = ?auto_794044 ?auto_794048 ) ) ( not ( = ?auto_794045 ?auto_794046 ) ) ( not ( = ?auto_794045 ?auto_794047 ) ) ( not ( = ?auto_794045 ?auto_794048 ) ) ( not ( = ?auto_794046 ?auto_794047 ) ) ( not ( = ?auto_794046 ?auto_794048 ) ) ( not ( = ?auto_794047 ?auto_794048 ) ) ( ON ?auto_794046 ?auto_794047 ) ( ON ?auto_794045 ?auto_794046 ) ( ON ?auto_794044 ?auto_794045 ) ( ON ?auto_794043 ?auto_794044 ) ( ON ?auto_794042 ?auto_794043 ) ( ON ?auto_794041 ?auto_794042 ) ( ON ?auto_794040 ?auto_794041 ) ( CLEAR ?auto_794038 ) ( ON ?auto_794039 ?auto_794040 ) ( CLEAR ?auto_794039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_794038 ?auto_794039 )
      ( MAKE-10PILE ?auto_794038 ?auto_794039 ?auto_794040 ?auto_794041 ?auto_794042 ?auto_794043 ?auto_794044 ?auto_794045 ?auto_794046 ?auto_794047 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_794080 - BLOCK
      ?auto_794081 - BLOCK
      ?auto_794082 - BLOCK
      ?auto_794083 - BLOCK
      ?auto_794084 - BLOCK
      ?auto_794085 - BLOCK
      ?auto_794086 - BLOCK
      ?auto_794087 - BLOCK
      ?auto_794088 - BLOCK
      ?auto_794089 - BLOCK
    )
    :vars
    (
      ?auto_794090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794089 ?auto_794090 ) ( not ( = ?auto_794080 ?auto_794081 ) ) ( not ( = ?auto_794080 ?auto_794082 ) ) ( not ( = ?auto_794080 ?auto_794083 ) ) ( not ( = ?auto_794080 ?auto_794084 ) ) ( not ( = ?auto_794080 ?auto_794085 ) ) ( not ( = ?auto_794080 ?auto_794086 ) ) ( not ( = ?auto_794080 ?auto_794087 ) ) ( not ( = ?auto_794080 ?auto_794088 ) ) ( not ( = ?auto_794080 ?auto_794089 ) ) ( not ( = ?auto_794080 ?auto_794090 ) ) ( not ( = ?auto_794081 ?auto_794082 ) ) ( not ( = ?auto_794081 ?auto_794083 ) ) ( not ( = ?auto_794081 ?auto_794084 ) ) ( not ( = ?auto_794081 ?auto_794085 ) ) ( not ( = ?auto_794081 ?auto_794086 ) ) ( not ( = ?auto_794081 ?auto_794087 ) ) ( not ( = ?auto_794081 ?auto_794088 ) ) ( not ( = ?auto_794081 ?auto_794089 ) ) ( not ( = ?auto_794081 ?auto_794090 ) ) ( not ( = ?auto_794082 ?auto_794083 ) ) ( not ( = ?auto_794082 ?auto_794084 ) ) ( not ( = ?auto_794082 ?auto_794085 ) ) ( not ( = ?auto_794082 ?auto_794086 ) ) ( not ( = ?auto_794082 ?auto_794087 ) ) ( not ( = ?auto_794082 ?auto_794088 ) ) ( not ( = ?auto_794082 ?auto_794089 ) ) ( not ( = ?auto_794082 ?auto_794090 ) ) ( not ( = ?auto_794083 ?auto_794084 ) ) ( not ( = ?auto_794083 ?auto_794085 ) ) ( not ( = ?auto_794083 ?auto_794086 ) ) ( not ( = ?auto_794083 ?auto_794087 ) ) ( not ( = ?auto_794083 ?auto_794088 ) ) ( not ( = ?auto_794083 ?auto_794089 ) ) ( not ( = ?auto_794083 ?auto_794090 ) ) ( not ( = ?auto_794084 ?auto_794085 ) ) ( not ( = ?auto_794084 ?auto_794086 ) ) ( not ( = ?auto_794084 ?auto_794087 ) ) ( not ( = ?auto_794084 ?auto_794088 ) ) ( not ( = ?auto_794084 ?auto_794089 ) ) ( not ( = ?auto_794084 ?auto_794090 ) ) ( not ( = ?auto_794085 ?auto_794086 ) ) ( not ( = ?auto_794085 ?auto_794087 ) ) ( not ( = ?auto_794085 ?auto_794088 ) ) ( not ( = ?auto_794085 ?auto_794089 ) ) ( not ( = ?auto_794085 ?auto_794090 ) ) ( not ( = ?auto_794086 ?auto_794087 ) ) ( not ( = ?auto_794086 ?auto_794088 ) ) ( not ( = ?auto_794086 ?auto_794089 ) ) ( not ( = ?auto_794086 ?auto_794090 ) ) ( not ( = ?auto_794087 ?auto_794088 ) ) ( not ( = ?auto_794087 ?auto_794089 ) ) ( not ( = ?auto_794087 ?auto_794090 ) ) ( not ( = ?auto_794088 ?auto_794089 ) ) ( not ( = ?auto_794088 ?auto_794090 ) ) ( not ( = ?auto_794089 ?auto_794090 ) ) ( ON ?auto_794088 ?auto_794089 ) ( ON ?auto_794087 ?auto_794088 ) ( ON ?auto_794086 ?auto_794087 ) ( ON ?auto_794085 ?auto_794086 ) ( ON ?auto_794084 ?auto_794085 ) ( ON ?auto_794083 ?auto_794084 ) ( ON ?auto_794082 ?auto_794083 ) ( ON ?auto_794081 ?auto_794082 ) ( ON ?auto_794080 ?auto_794081 ) ( CLEAR ?auto_794080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_794080 )
      ( MAKE-10PILE ?auto_794080 ?auto_794081 ?auto_794082 ?auto_794083 ?auto_794084 ?auto_794085 ?auto_794086 ?auto_794087 ?auto_794088 ?auto_794089 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_794123 - BLOCK
      ?auto_794124 - BLOCK
      ?auto_794125 - BLOCK
      ?auto_794126 - BLOCK
      ?auto_794127 - BLOCK
      ?auto_794128 - BLOCK
      ?auto_794129 - BLOCK
      ?auto_794130 - BLOCK
      ?auto_794131 - BLOCK
      ?auto_794132 - BLOCK
      ?auto_794133 - BLOCK
    )
    :vars
    (
      ?auto_794134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_794132 ) ( ON ?auto_794133 ?auto_794134 ) ( CLEAR ?auto_794133 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_794123 ) ( ON ?auto_794124 ?auto_794123 ) ( ON ?auto_794125 ?auto_794124 ) ( ON ?auto_794126 ?auto_794125 ) ( ON ?auto_794127 ?auto_794126 ) ( ON ?auto_794128 ?auto_794127 ) ( ON ?auto_794129 ?auto_794128 ) ( ON ?auto_794130 ?auto_794129 ) ( ON ?auto_794131 ?auto_794130 ) ( ON ?auto_794132 ?auto_794131 ) ( not ( = ?auto_794123 ?auto_794124 ) ) ( not ( = ?auto_794123 ?auto_794125 ) ) ( not ( = ?auto_794123 ?auto_794126 ) ) ( not ( = ?auto_794123 ?auto_794127 ) ) ( not ( = ?auto_794123 ?auto_794128 ) ) ( not ( = ?auto_794123 ?auto_794129 ) ) ( not ( = ?auto_794123 ?auto_794130 ) ) ( not ( = ?auto_794123 ?auto_794131 ) ) ( not ( = ?auto_794123 ?auto_794132 ) ) ( not ( = ?auto_794123 ?auto_794133 ) ) ( not ( = ?auto_794123 ?auto_794134 ) ) ( not ( = ?auto_794124 ?auto_794125 ) ) ( not ( = ?auto_794124 ?auto_794126 ) ) ( not ( = ?auto_794124 ?auto_794127 ) ) ( not ( = ?auto_794124 ?auto_794128 ) ) ( not ( = ?auto_794124 ?auto_794129 ) ) ( not ( = ?auto_794124 ?auto_794130 ) ) ( not ( = ?auto_794124 ?auto_794131 ) ) ( not ( = ?auto_794124 ?auto_794132 ) ) ( not ( = ?auto_794124 ?auto_794133 ) ) ( not ( = ?auto_794124 ?auto_794134 ) ) ( not ( = ?auto_794125 ?auto_794126 ) ) ( not ( = ?auto_794125 ?auto_794127 ) ) ( not ( = ?auto_794125 ?auto_794128 ) ) ( not ( = ?auto_794125 ?auto_794129 ) ) ( not ( = ?auto_794125 ?auto_794130 ) ) ( not ( = ?auto_794125 ?auto_794131 ) ) ( not ( = ?auto_794125 ?auto_794132 ) ) ( not ( = ?auto_794125 ?auto_794133 ) ) ( not ( = ?auto_794125 ?auto_794134 ) ) ( not ( = ?auto_794126 ?auto_794127 ) ) ( not ( = ?auto_794126 ?auto_794128 ) ) ( not ( = ?auto_794126 ?auto_794129 ) ) ( not ( = ?auto_794126 ?auto_794130 ) ) ( not ( = ?auto_794126 ?auto_794131 ) ) ( not ( = ?auto_794126 ?auto_794132 ) ) ( not ( = ?auto_794126 ?auto_794133 ) ) ( not ( = ?auto_794126 ?auto_794134 ) ) ( not ( = ?auto_794127 ?auto_794128 ) ) ( not ( = ?auto_794127 ?auto_794129 ) ) ( not ( = ?auto_794127 ?auto_794130 ) ) ( not ( = ?auto_794127 ?auto_794131 ) ) ( not ( = ?auto_794127 ?auto_794132 ) ) ( not ( = ?auto_794127 ?auto_794133 ) ) ( not ( = ?auto_794127 ?auto_794134 ) ) ( not ( = ?auto_794128 ?auto_794129 ) ) ( not ( = ?auto_794128 ?auto_794130 ) ) ( not ( = ?auto_794128 ?auto_794131 ) ) ( not ( = ?auto_794128 ?auto_794132 ) ) ( not ( = ?auto_794128 ?auto_794133 ) ) ( not ( = ?auto_794128 ?auto_794134 ) ) ( not ( = ?auto_794129 ?auto_794130 ) ) ( not ( = ?auto_794129 ?auto_794131 ) ) ( not ( = ?auto_794129 ?auto_794132 ) ) ( not ( = ?auto_794129 ?auto_794133 ) ) ( not ( = ?auto_794129 ?auto_794134 ) ) ( not ( = ?auto_794130 ?auto_794131 ) ) ( not ( = ?auto_794130 ?auto_794132 ) ) ( not ( = ?auto_794130 ?auto_794133 ) ) ( not ( = ?auto_794130 ?auto_794134 ) ) ( not ( = ?auto_794131 ?auto_794132 ) ) ( not ( = ?auto_794131 ?auto_794133 ) ) ( not ( = ?auto_794131 ?auto_794134 ) ) ( not ( = ?auto_794132 ?auto_794133 ) ) ( not ( = ?auto_794132 ?auto_794134 ) ) ( not ( = ?auto_794133 ?auto_794134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_794133 ?auto_794134 )
      ( !STACK ?auto_794133 ?auto_794132 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_794169 - BLOCK
      ?auto_794170 - BLOCK
      ?auto_794171 - BLOCK
      ?auto_794172 - BLOCK
      ?auto_794173 - BLOCK
      ?auto_794174 - BLOCK
      ?auto_794175 - BLOCK
      ?auto_794176 - BLOCK
      ?auto_794177 - BLOCK
      ?auto_794178 - BLOCK
      ?auto_794179 - BLOCK
    )
    :vars
    (
      ?auto_794180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794179 ?auto_794180 ) ( ON-TABLE ?auto_794169 ) ( ON ?auto_794170 ?auto_794169 ) ( ON ?auto_794171 ?auto_794170 ) ( ON ?auto_794172 ?auto_794171 ) ( ON ?auto_794173 ?auto_794172 ) ( ON ?auto_794174 ?auto_794173 ) ( ON ?auto_794175 ?auto_794174 ) ( ON ?auto_794176 ?auto_794175 ) ( ON ?auto_794177 ?auto_794176 ) ( not ( = ?auto_794169 ?auto_794170 ) ) ( not ( = ?auto_794169 ?auto_794171 ) ) ( not ( = ?auto_794169 ?auto_794172 ) ) ( not ( = ?auto_794169 ?auto_794173 ) ) ( not ( = ?auto_794169 ?auto_794174 ) ) ( not ( = ?auto_794169 ?auto_794175 ) ) ( not ( = ?auto_794169 ?auto_794176 ) ) ( not ( = ?auto_794169 ?auto_794177 ) ) ( not ( = ?auto_794169 ?auto_794178 ) ) ( not ( = ?auto_794169 ?auto_794179 ) ) ( not ( = ?auto_794169 ?auto_794180 ) ) ( not ( = ?auto_794170 ?auto_794171 ) ) ( not ( = ?auto_794170 ?auto_794172 ) ) ( not ( = ?auto_794170 ?auto_794173 ) ) ( not ( = ?auto_794170 ?auto_794174 ) ) ( not ( = ?auto_794170 ?auto_794175 ) ) ( not ( = ?auto_794170 ?auto_794176 ) ) ( not ( = ?auto_794170 ?auto_794177 ) ) ( not ( = ?auto_794170 ?auto_794178 ) ) ( not ( = ?auto_794170 ?auto_794179 ) ) ( not ( = ?auto_794170 ?auto_794180 ) ) ( not ( = ?auto_794171 ?auto_794172 ) ) ( not ( = ?auto_794171 ?auto_794173 ) ) ( not ( = ?auto_794171 ?auto_794174 ) ) ( not ( = ?auto_794171 ?auto_794175 ) ) ( not ( = ?auto_794171 ?auto_794176 ) ) ( not ( = ?auto_794171 ?auto_794177 ) ) ( not ( = ?auto_794171 ?auto_794178 ) ) ( not ( = ?auto_794171 ?auto_794179 ) ) ( not ( = ?auto_794171 ?auto_794180 ) ) ( not ( = ?auto_794172 ?auto_794173 ) ) ( not ( = ?auto_794172 ?auto_794174 ) ) ( not ( = ?auto_794172 ?auto_794175 ) ) ( not ( = ?auto_794172 ?auto_794176 ) ) ( not ( = ?auto_794172 ?auto_794177 ) ) ( not ( = ?auto_794172 ?auto_794178 ) ) ( not ( = ?auto_794172 ?auto_794179 ) ) ( not ( = ?auto_794172 ?auto_794180 ) ) ( not ( = ?auto_794173 ?auto_794174 ) ) ( not ( = ?auto_794173 ?auto_794175 ) ) ( not ( = ?auto_794173 ?auto_794176 ) ) ( not ( = ?auto_794173 ?auto_794177 ) ) ( not ( = ?auto_794173 ?auto_794178 ) ) ( not ( = ?auto_794173 ?auto_794179 ) ) ( not ( = ?auto_794173 ?auto_794180 ) ) ( not ( = ?auto_794174 ?auto_794175 ) ) ( not ( = ?auto_794174 ?auto_794176 ) ) ( not ( = ?auto_794174 ?auto_794177 ) ) ( not ( = ?auto_794174 ?auto_794178 ) ) ( not ( = ?auto_794174 ?auto_794179 ) ) ( not ( = ?auto_794174 ?auto_794180 ) ) ( not ( = ?auto_794175 ?auto_794176 ) ) ( not ( = ?auto_794175 ?auto_794177 ) ) ( not ( = ?auto_794175 ?auto_794178 ) ) ( not ( = ?auto_794175 ?auto_794179 ) ) ( not ( = ?auto_794175 ?auto_794180 ) ) ( not ( = ?auto_794176 ?auto_794177 ) ) ( not ( = ?auto_794176 ?auto_794178 ) ) ( not ( = ?auto_794176 ?auto_794179 ) ) ( not ( = ?auto_794176 ?auto_794180 ) ) ( not ( = ?auto_794177 ?auto_794178 ) ) ( not ( = ?auto_794177 ?auto_794179 ) ) ( not ( = ?auto_794177 ?auto_794180 ) ) ( not ( = ?auto_794178 ?auto_794179 ) ) ( not ( = ?auto_794178 ?auto_794180 ) ) ( not ( = ?auto_794179 ?auto_794180 ) ) ( CLEAR ?auto_794177 ) ( ON ?auto_794178 ?auto_794179 ) ( CLEAR ?auto_794178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_794169 ?auto_794170 ?auto_794171 ?auto_794172 ?auto_794173 ?auto_794174 ?auto_794175 ?auto_794176 ?auto_794177 ?auto_794178 )
      ( MAKE-11PILE ?auto_794169 ?auto_794170 ?auto_794171 ?auto_794172 ?auto_794173 ?auto_794174 ?auto_794175 ?auto_794176 ?auto_794177 ?auto_794178 ?auto_794179 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_794215 - BLOCK
      ?auto_794216 - BLOCK
      ?auto_794217 - BLOCK
      ?auto_794218 - BLOCK
      ?auto_794219 - BLOCK
      ?auto_794220 - BLOCK
      ?auto_794221 - BLOCK
      ?auto_794222 - BLOCK
      ?auto_794223 - BLOCK
      ?auto_794224 - BLOCK
      ?auto_794225 - BLOCK
    )
    :vars
    (
      ?auto_794226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794225 ?auto_794226 ) ( ON-TABLE ?auto_794215 ) ( ON ?auto_794216 ?auto_794215 ) ( ON ?auto_794217 ?auto_794216 ) ( ON ?auto_794218 ?auto_794217 ) ( ON ?auto_794219 ?auto_794218 ) ( ON ?auto_794220 ?auto_794219 ) ( ON ?auto_794221 ?auto_794220 ) ( ON ?auto_794222 ?auto_794221 ) ( not ( = ?auto_794215 ?auto_794216 ) ) ( not ( = ?auto_794215 ?auto_794217 ) ) ( not ( = ?auto_794215 ?auto_794218 ) ) ( not ( = ?auto_794215 ?auto_794219 ) ) ( not ( = ?auto_794215 ?auto_794220 ) ) ( not ( = ?auto_794215 ?auto_794221 ) ) ( not ( = ?auto_794215 ?auto_794222 ) ) ( not ( = ?auto_794215 ?auto_794223 ) ) ( not ( = ?auto_794215 ?auto_794224 ) ) ( not ( = ?auto_794215 ?auto_794225 ) ) ( not ( = ?auto_794215 ?auto_794226 ) ) ( not ( = ?auto_794216 ?auto_794217 ) ) ( not ( = ?auto_794216 ?auto_794218 ) ) ( not ( = ?auto_794216 ?auto_794219 ) ) ( not ( = ?auto_794216 ?auto_794220 ) ) ( not ( = ?auto_794216 ?auto_794221 ) ) ( not ( = ?auto_794216 ?auto_794222 ) ) ( not ( = ?auto_794216 ?auto_794223 ) ) ( not ( = ?auto_794216 ?auto_794224 ) ) ( not ( = ?auto_794216 ?auto_794225 ) ) ( not ( = ?auto_794216 ?auto_794226 ) ) ( not ( = ?auto_794217 ?auto_794218 ) ) ( not ( = ?auto_794217 ?auto_794219 ) ) ( not ( = ?auto_794217 ?auto_794220 ) ) ( not ( = ?auto_794217 ?auto_794221 ) ) ( not ( = ?auto_794217 ?auto_794222 ) ) ( not ( = ?auto_794217 ?auto_794223 ) ) ( not ( = ?auto_794217 ?auto_794224 ) ) ( not ( = ?auto_794217 ?auto_794225 ) ) ( not ( = ?auto_794217 ?auto_794226 ) ) ( not ( = ?auto_794218 ?auto_794219 ) ) ( not ( = ?auto_794218 ?auto_794220 ) ) ( not ( = ?auto_794218 ?auto_794221 ) ) ( not ( = ?auto_794218 ?auto_794222 ) ) ( not ( = ?auto_794218 ?auto_794223 ) ) ( not ( = ?auto_794218 ?auto_794224 ) ) ( not ( = ?auto_794218 ?auto_794225 ) ) ( not ( = ?auto_794218 ?auto_794226 ) ) ( not ( = ?auto_794219 ?auto_794220 ) ) ( not ( = ?auto_794219 ?auto_794221 ) ) ( not ( = ?auto_794219 ?auto_794222 ) ) ( not ( = ?auto_794219 ?auto_794223 ) ) ( not ( = ?auto_794219 ?auto_794224 ) ) ( not ( = ?auto_794219 ?auto_794225 ) ) ( not ( = ?auto_794219 ?auto_794226 ) ) ( not ( = ?auto_794220 ?auto_794221 ) ) ( not ( = ?auto_794220 ?auto_794222 ) ) ( not ( = ?auto_794220 ?auto_794223 ) ) ( not ( = ?auto_794220 ?auto_794224 ) ) ( not ( = ?auto_794220 ?auto_794225 ) ) ( not ( = ?auto_794220 ?auto_794226 ) ) ( not ( = ?auto_794221 ?auto_794222 ) ) ( not ( = ?auto_794221 ?auto_794223 ) ) ( not ( = ?auto_794221 ?auto_794224 ) ) ( not ( = ?auto_794221 ?auto_794225 ) ) ( not ( = ?auto_794221 ?auto_794226 ) ) ( not ( = ?auto_794222 ?auto_794223 ) ) ( not ( = ?auto_794222 ?auto_794224 ) ) ( not ( = ?auto_794222 ?auto_794225 ) ) ( not ( = ?auto_794222 ?auto_794226 ) ) ( not ( = ?auto_794223 ?auto_794224 ) ) ( not ( = ?auto_794223 ?auto_794225 ) ) ( not ( = ?auto_794223 ?auto_794226 ) ) ( not ( = ?auto_794224 ?auto_794225 ) ) ( not ( = ?auto_794224 ?auto_794226 ) ) ( not ( = ?auto_794225 ?auto_794226 ) ) ( ON ?auto_794224 ?auto_794225 ) ( CLEAR ?auto_794222 ) ( ON ?auto_794223 ?auto_794224 ) ( CLEAR ?auto_794223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_794215 ?auto_794216 ?auto_794217 ?auto_794218 ?auto_794219 ?auto_794220 ?auto_794221 ?auto_794222 ?auto_794223 )
      ( MAKE-11PILE ?auto_794215 ?auto_794216 ?auto_794217 ?auto_794218 ?auto_794219 ?auto_794220 ?auto_794221 ?auto_794222 ?auto_794223 ?auto_794224 ?auto_794225 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_794261 - BLOCK
      ?auto_794262 - BLOCK
      ?auto_794263 - BLOCK
      ?auto_794264 - BLOCK
      ?auto_794265 - BLOCK
      ?auto_794266 - BLOCK
      ?auto_794267 - BLOCK
      ?auto_794268 - BLOCK
      ?auto_794269 - BLOCK
      ?auto_794270 - BLOCK
      ?auto_794271 - BLOCK
    )
    :vars
    (
      ?auto_794272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794271 ?auto_794272 ) ( ON-TABLE ?auto_794261 ) ( ON ?auto_794262 ?auto_794261 ) ( ON ?auto_794263 ?auto_794262 ) ( ON ?auto_794264 ?auto_794263 ) ( ON ?auto_794265 ?auto_794264 ) ( ON ?auto_794266 ?auto_794265 ) ( ON ?auto_794267 ?auto_794266 ) ( not ( = ?auto_794261 ?auto_794262 ) ) ( not ( = ?auto_794261 ?auto_794263 ) ) ( not ( = ?auto_794261 ?auto_794264 ) ) ( not ( = ?auto_794261 ?auto_794265 ) ) ( not ( = ?auto_794261 ?auto_794266 ) ) ( not ( = ?auto_794261 ?auto_794267 ) ) ( not ( = ?auto_794261 ?auto_794268 ) ) ( not ( = ?auto_794261 ?auto_794269 ) ) ( not ( = ?auto_794261 ?auto_794270 ) ) ( not ( = ?auto_794261 ?auto_794271 ) ) ( not ( = ?auto_794261 ?auto_794272 ) ) ( not ( = ?auto_794262 ?auto_794263 ) ) ( not ( = ?auto_794262 ?auto_794264 ) ) ( not ( = ?auto_794262 ?auto_794265 ) ) ( not ( = ?auto_794262 ?auto_794266 ) ) ( not ( = ?auto_794262 ?auto_794267 ) ) ( not ( = ?auto_794262 ?auto_794268 ) ) ( not ( = ?auto_794262 ?auto_794269 ) ) ( not ( = ?auto_794262 ?auto_794270 ) ) ( not ( = ?auto_794262 ?auto_794271 ) ) ( not ( = ?auto_794262 ?auto_794272 ) ) ( not ( = ?auto_794263 ?auto_794264 ) ) ( not ( = ?auto_794263 ?auto_794265 ) ) ( not ( = ?auto_794263 ?auto_794266 ) ) ( not ( = ?auto_794263 ?auto_794267 ) ) ( not ( = ?auto_794263 ?auto_794268 ) ) ( not ( = ?auto_794263 ?auto_794269 ) ) ( not ( = ?auto_794263 ?auto_794270 ) ) ( not ( = ?auto_794263 ?auto_794271 ) ) ( not ( = ?auto_794263 ?auto_794272 ) ) ( not ( = ?auto_794264 ?auto_794265 ) ) ( not ( = ?auto_794264 ?auto_794266 ) ) ( not ( = ?auto_794264 ?auto_794267 ) ) ( not ( = ?auto_794264 ?auto_794268 ) ) ( not ( = ?auto_794264 ?auto_794269 ) ) ( not ( = ?auto_794264 ?auto_794270 ) ) ( not ( = ?auto_794264 ?auto_794271 ) ) ( not ( = ?auto_794264 ?auto_794272 ) ) ( not ( = ?auto_794265 ?auto_794266 ) ) ( not ( = ?auto_794265 ?auto_794267 ) ) ( not ( = ?auto_794265 ?auto_794268 ) ) ( not ( = ?auto_794265 ?auto_794269 ) ) ( not ( = ?auto_794265 ?auto_794270 ) ) ( not ( = ?auto_794265 ?auto_794271 ) ) ( not ( = ?auto_794265 ?auto_794272 ) ) ( not ( = ?auto_794266 ?auto_794267 ) ) ( not ( = ?auto_794266 ?auto_794268 ) ) ( not ( = ?auto_794266 ?auto_794269 ) ) ( not ( = ?auto_794266 ?auto_794270 ) ) ( not ( = ?auto_794266 ?auto_794271 ) ) ( not ( = ?auto_794266 ?auto_794272 ) ) ( not ( = ?auto_794267 ?auto_794268 ) ) ( not ( = ?auto_794267 ?auto_794269 ) ) ( not ( = ?auto_794267 ?auto_794270 ) ) ( not ( = ?auto_794267 ?auto_794271 ) ) ( not ( = ?auto_794267 ?auto_794272 ) ) ( not ( = ?auto_794268 ?auto_794269 ) ) ( not ( = ?auto_794268 ?auto_794270 ) ) ( not ( = ?auto_794268 ?auto_794271 ) ) ( not ( = ?auto_794268 ?auto_794272 ) ) ( not ( = ?auto_794269 ?auto_794270 ) ) ( not ( = ?auto_794269 ?auto_794271 ) ) ( not ( = ?auto_794269 ?auto_794272 ) ) ( not ( = ?auto_794270 ?auto_794271 ) ) ( not ( = ?auto_794270 ?auto_794272 ) ) ( not ( = ?auto_794271 ?auto_794272 ) ) ( ON ?auto_794270 ?auto_794271 ) ( ON ?auto_794269 ?auto_794270 ) ( CLEAR ?auto_794267 ) ( ON ?auto_794268 ?auto_794269 ) ( CLEAR ?auto_794268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_794261 ?auto_794262 ?auto_794263 ?auto_794264 ?auto_794265 ?auto_794266 ?auto_794267 ?auto_794268 )
      ( MAKE-11PILE ?auto_794261 ?auto_794262 ?auto_794263 ?auto_794264 ?auto_794265 ?auto_794266 ?auto_794267 ?auto_794268 ?auto_794269 ?auto_794270 ?auto_794271 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_794307 - BLOCK
      ?auto_794308 - BLOCK
      ?auto_794309 - BLOCK
      ?auto_794310 - BLOCK
      ?auto_794311 - BLOCK
      ?auto_794312 - BLOCK
      ?auto_794313 - BLOCK
      ?auto_794314 - BLOCK
      ?auto_794315 - BLOCK
      ?auto_794316 - BLOCK
      ?auto_794317 - BLOCK
    )
    :vars
    (
      ?auto_794318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794317 ?auto_794318 ) ( ON-TABLE ?auto_794307 ) ( ON ?auto_794308 ?auto_794307 ) ( ON ?auto_794309 ?auto_794308 ) ( ON ?auto_794310 ?auto_794309 ) ( ON ?auto_794311 ?auto_794310 ) ( ON ?auto_794312 ?auto_794311 ) ( not ( = ?auto_794307 ?auto_794308 ) ) ( not ( = ?auto_794307 ?auto_794309 ) ) ( not ( = ?auto_794307 ?auto_794310 ) ) ( not ( = ?auto_794307 ?auto_794311 ) ) ( not ( = ?auto_794307 ?auto_794312 ) ) ( not ( = ?auto_794307 ?auto_794313 ) ) ( not ( = ?auto_794307 ?auto_794314 ) ) ( not ( = ?auto_794307 ?auto_794315 ) ) ( not ( = ?auto_794307 ?auto_794316 ) ) ( not ( = ?auto_794307 ?auto_794317 ) ) ( not ( = ?auto_794307 ?auto_794318 ) ) ( not ( = ?auto_794308 ?auto_794309 ) ) ( not ( = ?auto_794308 ?auto_794310 ) ) ( not ( = ?auto_794308 ?auto_794311 ) ) ( not ( = ?auto_794308 ?auto_794312 ) ) ( not ( = ?auto_794308 ?auto_794313 ) ) ( not ( = ?auto_794308 ?auto_794314 ) ) ( not ( = ?auto_794308 ?auto_794315 ) ) ( not ( = ?auto_794308 ?auto_794316 ) ) ( not ( = ?auto_794308 ?auto_794317 ) ) ( not ( = ?auto_794308 ?auto_794318 ) ) ( not ( = ?auto_794309 ?auto_794310 ) ) ( not ( = ?auto_794309 ?auto_794311 ) ) ( not ( = ?auto_794309 ?auto_794312 ) ) ( not ( = ?auto_794309 ?auto_794313 ) ) ( not ( = ?auto_794309 ?auto_794314 ) ) ( not ( = ?auto_794309 ?auto_794315 ) ) ( not ( = ?auto_794309 ?auto_794316 ) ) ( not ( = ?auto_794309 ?auto_794317 ) ) ( not ( = ?auto_794309 ?auto_794318 ) ) ( not ( = ?auto_794310 ?auto_794311 ) ) ( not ( = ?auto_794310 ?auto_794312 ) ) ( not ( = ?auto_794310 ?auto_794313 ) ) ( not ( = ?auto_794310 ?auto_794314 ) ) ( not ( = ?auto_794310 ?auto_794315 ) ) ( not ( = ?auto_794310 ?auto_794316 ) ) ( not ( = ?auto_794310 ?auto_794317 ) ) ( not ( = ?auto_794310 ?auto_794318 ) ) ( not ( = ?auto_794311 ?auto_794312 ) ) ( not ( = ?auto_794311 ?auto_794313 ) ) ( not ( = ?auto_794311 ?auto_794314 ) ) ( not ( = ?auto_794311 ?auto_794315 ) ) ( not ( = ?auto_794311 ?auto_794316 ) ) ( not ( = ?auto_794311 ?auto_794317 ) ) ( not ( = ?auto_794311 ?auto_794318 ) ) ( not ( = ?auto_794312 ?auto_794313 ) ) ( not ( = ?auto_794312 ?auto_794314 ) ) ( not ( = ?auto_794312 ?auto_794315 ) ) ( not ( = ?auto_794312 ?auto_794316 ) ) ( not ( = ?auto_794312 ?auto_794317 ) ) ( not ( = ?auto_794312 ?auto_794318 ) ) ( not ( = ?auto_794313 ?auto_794314 ) ) ( not ( = ?auto_794313 ?auto_794315 ) ) ( not ( = ?auto_794313 ?auto_794316 ) ) ( not ( = ?auto_794313 ?auto_794317 ) ) ( not ( = ?auto_794313 ?auto_794318 ) ) ( not ( = ?auto_794314 ?auto_794315 ) ) ( not ( = ?auto_794314 ?auto_794316 ) ) ( not ( = ?auto_794314 ?auto_794317 ) ) ( not ( = ?auto_794314 ?auto_794318 ) ) ( not ( = ?auto_794315 ?auto_794316 ) ) ( not ( = ?auto_794315 ?auto_794317 ) ) ( not ( = ?auto_794315 ?auto_794318 ) ) ( not ( = ?auto_794316 ?auto_794317 ) ) ( not ( = ?auto_794316 ?auto_794318 ) ) ( not ( = ?auto_794317 ?auto_794318 ) ) ( ON ?auto_794316 ?auto_794317 ) ( ON ?auto_794315 ?auto_794316 ) ( ON ?auto_794314 ?auto_794315 ) ( CLEAR ?auto_794312 ) ( ON ?auto_794313 ?auto_794314 ) ( CLEAR ?auto_794313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_794307 ?auto_794308 ?auto_794309 ?auto_794310 ?auto_794311 ?auto_794312 ?auto_794313 )
      ( MAKE-11PILE ?auto_794307 ?auto_794308 ?auto_794309 ?auto_794310 ?auto_794311 ?auto_794312 ?auto_794313 ?auto_794314 ?auto_794315 ?auto_794316 ?auto_794317 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_794353 - BLOCK
      ?auto_794354 - BLOCK
      ?auto_794355 - BLOCK
      ?auto_794356 - BLOCK
      ?auto_794357 - BLOCK
      ?auto_794358 - BLOCK
      ?auto_794359 - BLOCK
      ?auto_794360 - BLOCK
      ?auto_794361 - BLOCK
      ?auto_794362 - BLOCK
      ?auto_794363 - BLOCK
    )
    :vars
    (
      ?auto_794364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794363 ?auto_794364 ) ( ON-TABLE ?auto_794353 ) ( ON ?auto_794354 ?auto_794353 ) ( ON ?auto_794355 ?auto_794354 ) ( ON ?auto_794356 ?auto_794355 ) ( ON ?auto_794357 ?auto_794356 ) ( not ( = ?auto_794353 ?auto_794354 ) ) ( not ( = ?auto_794353 ?auto_794355 ) ) ( not ( = ?auto_794353 ?auto_794356 ) ) ( not ( = ?auto_794353 ?auto_794357 ) ) ( not ( = ?auto_794353 ?auto_794358 ) ) ( not ( = ?auto_794353 ?auto_794359 ) ) ( not ( = ?auto_794353 ?auto_794360 ) ) ( not ( = ?auto_794353 ?auto_794361 ) ) ( not ( = ?auto_794353 ?auto_794362 ) ) ( not ( = ?auto_794353 ?auto_794363 ) ) ( not ( = ?auto_794353 ?auto_794364 ) ) ( not ( = ?auto_794354 ?auto_794355 ) ) ( not ( = ?auto_794354 ?auto_794356 ) ) ( not ( = ?auto_794354 ?auto_794357 ) ) ( not ( = ?auto_794354 ?auto_794358 ) ) ( not ( = ?auto_794354 ?auto_794359 ) ) ( not ( = ?auto_794354 ?auto_794360 ) ) ( not ( = ?auto_794354 ?auto_794361 ) ) ( not ( = ?auto_794354 ?auto_794362 ) ) ( not ( = ?auto_794354 ?auto_794363 ) ) ( not ( = ?auto_794354 ?auto_794364 ) ) ( not ( = ?auto_794355 ?auto_794356 ) ) ( not ( = ?auto_794355 ?auto_794357 ) ) ( not ( = ?auto_794355 ?auto_794358 ) ) ( not ( = ?auto_794355 ?auto_794359 ) ) ( not ( = ?auto_794355 ?auto_794360 ) ) ( not ( = ?auto_794355 ?auto_794361 ) ) ( not ( = ?auto_794355 ?auto_794362 ) ) ( not ( = ?auto_794355 ?auto_794363 ) ) ( not ( = ?auto_794355 ?auto_794364 ) ) ( not ( = ?auto_794356 ?auto_794357 ) ) ( not ( = ?auto_794356 ?auto_794358 ) ) ( not ( = ?auto_794356 ?auto_794359 ) ) ( not ( = ?auto_794356 ?auto_794360 ) ) ( not ( = ?auto_794356 ?auto_794361 ) ) ( not ( = ?auto_794356 ?auto_794362 ) ) ( not ( = ?auto_794356 ?auto_794363 ) ) ( not ( = ?auto_794356 ?auto_794364 ) ) ( not ( = ?auto_794357 ?auto_794358 ) ) ( not ( = ?auto_794357 ?auto_794359 ) ) ( not ( = ?auto_794357 ?auto_794360 ) ) ( not ( = ?auto_794357 ?auto_794361 ) ) ( not ( = ?auto_794357 ?auto_794362 ) ) ( not ( = ?auto_794357 ?auto_794363 ) ) ( not ( = ?auto_794357 ?auto_794364 ) ) ( not ( = ?auto_794358 ?auto_794359 ) ) ( not ( = ?auto_794358 ?auto_794360 ) ) ( not ( = ?auto_794358 ?auto_794361 ) ) ( not ( = ?auto_794358 ?auto_794362 ) ) ( not ( = ?auto_794358 ?auto_794363 ) ) ( not ( = ?auto_794358 ?auto_794364 ) ) ( not ( = ?auto_794359 ?auto_794360 ) ) ( not ( = ?auto_794359 ?auto_794361 ) ) ( not ( = ?auto_794359 ?auto_794362 ) ) ( not ( = ?auto_794359 ?auto_794363 ) ) ( not ( = ?auto_794359 ?auto_794364 ) ) ( not ( = ?auto_794360 ?auto_794361 ) ) ( not ( = ?auto_794360 ?auto_794362 ) ) ( not ( = ?auto_794360 ?auto_794363 ) ) ( not ( = ?auto_794360 ?auto_794364 ) ) ( not ( = ?auto_794361 ?auto_794362 ) ) ( not ( = ?auto_794361 ?auto_794363 ) ) ( not ( = ?auto_794361 ?auto_794364 ) ) ( not ( = ?auto_794362 ?auto_794363 ) ) ( not ( = ?auto_794362 ?auto_794364 ) ) ( not ( = ?auto_794363 ?auto_794364 ) ) ( ON ?auto_794362 ?auto_794363 ) ( ON ?auto_794361 ?auto_794362 ) ( ON ?auto_794360 ?auto_794361 ) ( ON ?auto_794359 ?auto_794360 ) ( CLEAR ?auto_794357 ) ( ON ?auto_794358 ?auto_794359 ) ( CLEAR ?auto_794358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_794353 ?auto_794354 ?auto_794355 ?auto_794356 ?auto_794357 ?auto_794358 )
      ( MAKE-11PILE ?auto_794353 ?auto_794354 ?auto_794355 ?auto_794356 ?auto_794357 ?auto_794358 ?auto_794359 ?auto_794360 ?auto_794361 ?auto_794362 ?auto_794363 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_794399 - BLOCK
      ?auto_794400 - BLOCK
      ?auto_794401 - BLOCK
      ?auto_794402 - BLOCK
      ?auto_794403 - BLOCK
      ?auto_794404 - BLOCK
      ?auto_794405 - BLOCK
      ?auto_794406 - BLOCK
      ?auto_794407 - BLOCK
      ?auto_794408 - BLOCK
      ?auto_794409 - BLOCK
    )
    :vars
    (
      ?auto_794410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794409 ?auto_794410 ) ( ON-TABLE ?auto_794399 ) ( ON ?auto_794400 ?auto_794399 ) ( ON ?auto_794401 ?auto_794400 ) ( ON ?auto_794402 ?auto_794401 ) ( not ( = ?auto_794399 ?auto_794400 ) ) ( not ( = ?auto_794399 ?auto_794401 ) ) ( not ( = ?auto_794399 ?auto_794402 ) ) ( not ( = ?auto_794399 ?auto_794403 ) ) ( not ( = ?auto_794399 ?auto_794404 ) ) ( not ( = ?auto_794399 ?auto_794405 ) ) ( not ( = ?auto_794399 ?auto_794406 ) ) ( not ( = ?auto_794399 ?auto_794407 ) ) ( not ( = ?auto_794399 ?auto_794408 ) ) ( not ( = ?auto_794399 ?auto_794409 ) ) ( not ( = ?auto_794399 ?auto_794410 ) ) ( not ( = ?auto_794400 ?auto_794401 ) ) ( not ( = ?auto_794400 ?auto_794402 ) ) ( not ( = ?auto_794400 ?auto_794403 ) ) ( not ( = ?auto_794400 ?auto_794404 ) ) ( not ( = ?auto_794400 ?auto_794405 ) ) ( not ( = ?auto_794400 ?auto_794406 ) ) ( not ( = ?auto_794400 ?auto_794407 ) ) ( not ( = ?auto_794400 ?auto_794408 ) ) ( not ( = ?auto_794400 ?auto_794409 ) ) ( not ( = ?auto_794400 ?auto_794410 ) ) ( not ( = ?auto_794401 ?auto_794402 ) ) ( not ( = ?auto_794401 ?auto_794403 ) ) ( not ( = ?auto_794401 ?auto_794404 ) ) ( not ( = ?auto_794401 ?auto_794405 ) ) ( not ( = ?auto_794401 ?auto_794406 ) ) ( not ( = ?auto_794401 ?auto_794407 ) ) ( not ( = ?auto_794401 ?auto_794408 ) ) ( not ( = ?auto_794401 ?auto_794409 ) ) ( not ( = ?auto_794401 ?auto_794410 ) ) ( not ( = ?auto_794402 ?auto_794403 ) ) ( not ( = ?auto_794402 ?auto_794404 ) ) ( not ( = ?auto_794402 ?auto_794405 ) ) ( not ( = ?auto_794402 ?auto_794406 ) ) ( not ( = ?auto_794402 ?auto_794407 ) ) ( not ( = ?auto_794402 ?auto_794408 ) ) ( not ( = ?auto_794402 ?auto_794409 ) ) ( not ( = ?auto_794402 ?auto_794410 ) ) ( not ( = ?auto_794403 ?auto_794404 ) ) ( not ( = ?auto_794403 ?auto_794405 ) ) ( not ( = ?auto_794403 ?auto_794406 ) ) ( not ( = ?auto_794403 ?auto_794407 ) ) ( not ( = ?auto_794403 ?auto_794408 ) ) ( not ( = ?auto_794403 ?auto_794409 ) ) ( not ( = ?auto_794403 ?auto_794410 ) ) ( not ( = ?auto_794404 ?auto_794405 ) ) ( not ( = ?auto_794404 ?auto_794406 ) ) ( not ( = ?auto_794404 ?auto_794407 ) ) ( not ( = ?auto_794404 ?auto_794408 ) ) ( not ( = ?auto_794404 ?auto_794409 ) ) ( not ( = ?auto_794404 ?auto_794410 ) ) ( not ( = ?auto_794405 ?auto_794406 ) ) ( not ( = ?auto_794405 ?auto_794407 ) ) ( not ( = ?auto_794405 ?auto_794408 ) ) ( not ( = ?auto_794405 ?auto_794409 ) ) ( not ( = ?auto_794405 ?auto_794410 ) ) ( not ( = ?auto_794406 ?auto_794407 ) ) ( not ( = ?auto_794406 ?auto_794408 ) ) ( not ( = ?auto_794406 ?auto_794409 ) ) ( not ( = ?auto_794406 ?auto_794410 ) ) ( not ( = ?auto_794407 ?auto_794408 ) ) ( not ( = ?auto_794407 ?auto_794409 ) ) ( not ( = ?auto_794407 ?auto_794410 ) ) ( not ( = ?auto_794408 ?auto_794409 ) ) ( not ( = ?auto_794408 ?auto_794410 ) ) ( not ( = ?auto_794409 ?auto_794410 ) ) ( ON ?auto_794408 ?auto_794409 ) ( ON ?auto_794407 ?auto_794408 ) ( ON ?auto_794406 ?auto_794407 ) ( ON ?auto_794405 ?auto_794406 ) ( ON ?auto_794404 ?auto_794405 ) ( CLEAR ?auto_794402 ) ( ON ?auto_794403 ?auto_794404 ) ( CLEAR ?auto_794403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_794399 ?auto_794400 ?auto_794401 ?auto_794402 ?auto_794403 )
      ( MAKE-11PILE ?auto_794399 ?auto_794400 ?auto_794401 ?auto_794402 ?auto_794403 ?auto_794404 ?auto_794405 ?auto_794406 ?auto_794407 ?auto_794408 ?auto_794409 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_794445 - BLOCK
      ?auto_794446 - BLOCK
      ?auto_794447 - BLOCK
      ?auto_794448 - BLOCK
      ?auto_794449 - BLOCK
      ?auto_794450 - BLOCK
      ?auto_794451 - BLOCK
      ?auto_794452 - BLOCK
      ?auto_794453 - BLOCK
      ?auto_794454 - BLOCK
      ?auto_794455 - BLOCK
    )
    :vars
    (
      ?auto_794456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794455 ?auto_794456 ) ( ON-TABLE ?auto_794445 ) ( ON ?auto_794446 ?auto_794445 ) ( ON ?auto_794447 ?auto_794446 ) ( not ( = ?auto_794445 ?auto_794446 ) ) ( not ( = ?auto_794445 ?auto_794447 ) ) ( not ( = ?auto_794445 ?auto_794448 ) ) ( not ( = ?auto_794445 ?auto_794449 ) ) ( not ( = ?auto_794445 ?auto_794450 ) ) ( not ( = ?auto_794445 ?auto_794451 ) ) ( not ( = ?auto_794445 ?auto_794452 ) ) ( not ( = ?auto_794445 ?auto_794453 ) ) ( not ( = ?auto_794445 ?auto_794454 ) ) ( not ( = ?auto_794445 ?auto_794455 ) ) ( not ( = ?auto_794445 ?auto_794456 ) ) ( not ( = ?auto_794446 ?auto_794447 ) ) ( not ( = ?auto_794446 ?auto_794448 ) ) ( not ( = ?auto_794446 ?auto_794449 ) ) ( not ( = ?auto_794446 ?auto_794450 ) ) ( not ( = ?auto_794446 ?auto_794451 ) ) ( not ( = ?auto_794446 ?auto_794452 ) ) ( not ( = ?auto_794446 ?auto_794453 ) ) ( not ( = ?auto_794446 ?auto_794454 ) ) ( not ( = ?auto_794446 ?auto_794455 ) ) ( not ( = ?auto_794446 ?auto_794456 ) ) ( not ( = ?auto_794447 ?auto_794448 ) ) ( not ( = ?auto_794447 ?auto_794449 ) ) ( not ( = ?auto_794447 ?auto_794450 ) ) ( not ( = ?auto_794447 ?auto_794451 ) ) ( not ( = ?auto_794447 ?auto_794452 ) ) ( not ( = ?auto_794447 ?auto_794453 ) ) ( not ( = ?auto_794447 ?auto_794454 ) ) ( not ( = ?auto_794447 ?auto_794455 ) ) ( not ( = ?auto_794447 ?auto_794456 ) ) ( not ( = ?auto_794448 ?auto_794449 ) ) ( not ( = ?auto_794448 ?auto_794450 ) ) ( not ( = ?auto_794448 ?auto_794451 ) ) ( not ( = ?auto_794448 ?auto_794452 ) ) ( not ( = ?auto_794448 ?auto_794453 ) ) ( not ( = ?auto_794448 ?auto_794454 ) ) ( not ( = ?auto_794448 ?auto_794455 ) ) ( not ( = ?auto_794448 ?auto_794456 ) ) ( not ( = ?auto_794449 ?auto_794450 ) ) ( not ( = ?auto_794449 ?auto_794451 ) ) ( not ( = ?auto_794449 ?auto_794452 ) ) ( not ( = ?auto_794449 ?auto_794453 ) ) ( not ( = ?auto_794449 ?auto_794454 ) ) ( not ( = ?auto_794449 ?auto_794455 ) ) ( not ( = ?auto_794449 ?auto_794456 ) ) ( not ( = ?auto_794450 ?auto_794451 ) ) ( not ( = ?auto_794450 ?auto_794452 ) ) ( not ( = ?auto_794450 ?auto_794453 ) ) ( not ( = ?auto_794450 ?auto_794454 ) ) ( not ( = ?auto_794450 ?auto_794455 ) ) ( not ( = ?auto_794450 ?auto_794456 ) ) ( not ( = ?auto_794451 ?auto_794452 ) ) ( not ( = ?auto_794451 ?auto_794453 ) ) ( not ( = ?auto_794451 ?auto_794454 ) ) ( not ( = ?auto_794451 ?auto_794455 ) ) ( not ( = ?auto_794451 ?auto_794456 ) ) ( not ( = ?auto_794452 ?auto_794453 ) ) ( not ( = ?auto_794452 ?auto_794454 ) ) ( not ( = ?auto_794452 ?auto_794455 ) ) ( not ( = ?auto_794452 ?auto_794456 ) ) ( not ( = ?auto_794453 ?auto_794454 ) ) ( not ( = ?auto_794453 ?auto_794455 ) ) ( not ( = ?auto_794453 ?auto_794456 ) ) ( not ( = ?auto_794454 ?auto_794455 ) ) ( not ( = ?auto_794454 ?auto_794456 ) ) ( not ( = ?auto_794455 ?auto_794456 ) ) ( ON ?auto_794454 ?auto_794455 ) ( ON ?auto_794453 ?auto_794454 ) ( ON ?auto_794452 ?auto_794453 ) ( ON ?auto_794451 ?auto_794452 ) ( ON ?auto_794450 ?auto_794451 ) ( ON ?auto_794449 ?auto_794450 ) ( CLEAR ?auto_794447 ) ( ON ?auto_794448 ?auto_794449 ) ( CLEAR ?auto_794448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_794445 ?auto_794446 ?auto_794447 ?auto_794448 )
      ( MAKE-11PILE ?auto_794445 ?auto_794446 ?auto_794447 ?auto_794448 ?auto_794449 ?auto_794450 ?auto_794451 ?auto_794452 ?auto_794453 ?auto_794454 ?auto_794455 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_794491 - BLOCK
      ?auto_794492 - BLOCK
      ?auto_794493 - BLOCK
      ?auto_794494 - BLOCK
      ?auto_794495 - BLOCK
      ?auto_794496 - BLOCK
      ?auto_794497 - BLOCK
      ?auto_794498 - BLOCK
      ?auto_794499 - BLOCK
      ?auto_794500 - BLOCK
      ?auto_794501 - BLOCK
    )
    :vars
    (
      ?auto_794502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794501 ?auto_794502 ) ( ON-TABLE ?auto_794491 ) ( ON ?auto_794492 ?auto_794491 ) ( not ( = ?auto_794491 ?auto_794492 ) ) ( not ( = ?auto_794491 ?auto_794493 ) ) ( not ( = ?auto_794491 ?auto_794494 ) ) ( not ( = ?auto_794491 ?auto_794495 ) ) ( not ( = ?auto_794491 ?auto_794496 ) ) ( not ( = ?auto_794491 ?auto_794497 ) ) ( not ( = ?auto_794491 ?auto_794498 ) ) ( not ( = ?auto_794491 ?auto_794499 ) ) ( not ( = ?auto_794491 ?auto_794500 ) ) ( not ( = ?auto_794491 ?auto_794501 ) ) ( not ( = ?auto_794491 ?auto_794502 ) ) ( not ( = ?auto_794492 ?auto_794493 ) ) ( not ( = ?auto_794492 ?auto_794494 ) ) ( not ( = ?auto_794492 ?auto_794495 ) ) ( not ( = ?auto_794492 ?auto_794496 ) ) ( not ( = ?auto_794492 ?auto_794497 ) ) ( not ( = ?auto_794492 ?auto_794498 ) ) ( not ( = ?auto_794492 ?auto_794499 ) ) ( not ( = ?auto_794492 ?auto_794500 ) ) ( not ( = ?auto_794492 ?auto_794501 ) ) ( not ( = ?auto_794492 ?auto_794502 ) ) ( not ( = ?auto_794493 ?auto_794494 ) ) ( not ( = ?auto_794493 ?auto_794495 ) ) ( not ( = ?auto_794493 ?auto_794496 ) ) ( not ( = ?auto_794493 ?auto_794497 ) ) ( not ( = ?auto_794493 ?auto_794498 ) ) ( not ( = ?auto_794493 ?auto_794499 ) ) ( not ( = ?auto_794493 ?auto_794500 ) ) ( not ( = ?auto_794493 ?auto_794501 ) ) ( not ( = ?auto_794493 ?auto_794502 ) ) ( not ( = ?auto_794494 ?auto_794495 ) ) ( not ( = ?auto_794494 ?auto_794496 ) ) ( not ( = ?auto_794494 ?auto_794497 ) ) ( not ( = ?auto_794494 ?auto_794498 ) ) ( not ( = ?auto_794494 ?auto_794499 ) ) ( not ( = ?auto_794494 ?auto_794500 ) ) ( not ( = ?auto_794494 ?auto_794501 ) ) ( not ( = ?auto_794494 ?auto_794502 ) ) ( not ( = ?auto_794495 ?auto_794496 ) ) ( not ( = ?auto_794495 ?auto_794497 ) ) ( not ( = ?auto_794495 ?auto_794498 ) ) ( not ( = ?auto_794495 ?auto_794499 ) ) ( not ( = ?auto_794495 ?auto_794500 ) ) ( not ( = ?auto_794495 ?auto_794501 ) ) ( not ( = ?auto_794495 ?auto_794502 ) ) ( not ( = ?auto_794496 ?auto_794497 ) ) ( not ( = ?auto_794496 ?auto_794498 ) ) ( not ( = ?auto_794496 ?auto_794499 ) ) ( not ( = ?auto_794496 ?auto_794500 ) ) ( not ( = ?auto_794496 ?auto_794501 ) ) ( not ( = ?auto_794496 ?auto_794502 ) ) ( not ( = ?auto_794497 ?auto_794498 ) ) ( not ( = ?auto_794497 ?auto_794499 ) ) ( not ( = ?auto_794497 ?auto_794500 ) ) ( not ( = ?auto_794497 ?auto_794501 ) ) ( not ( = ?auto_794497 ?auto_794502 ) ) ( not ( = ?auto_794498 ?auto_794499 ) ) ( not ( = ?auto_794498 ?auto_794500 ) ) ( not ( = ?auto_794498 ?auto_794501 ) ) ( not ( = ?auto_794498 ?auto_794502 ) ) ( not ( = ?auto_794499 ?auto_794500 ) ) ( not ( = ?auto_794499 ?auto_794501 ) ) ( not ( = ?auto_794499 ?auto_794502 ) ) ( not ( = ?auto_794500 ?auto_794501 ) ) ( not ( = ?auto_794500 ?auto_794502 ) ) ( not ( = ?auto_794501 ?auto_794502 ) ) ( ON ?auto_794500 ?auto_794501 ) ( ON ?auto_794499 ?auto_794500 ) ( ON ?auto_794498 ?auto_794499 ) ( ON ?auto_794497 ?auto_794498 ) ( ON ?auto_794496 ?auto_794497 ) ( ON ?auto_794495 ?auto_794496 ) ( ON ?auto_794494 ?auto_794495 ) ( CLEAR ?auto_794492 ) ( ON ?auto_794493 ?auto_794494 ) ( CLEAR ?auto_794493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_794491 ?auto_794492 ?auto_794493 )
      ( MAKE-11PILE ?auto_794491 ?auto_794492 ?auto_794493 ?auto_794494 ?auto_794495 ?auto_794496 ?auto_794497 ?auto_794498 ?auto_794499 ?auto_794500 ?auto_794501 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_794537 - BLOCK
      ?auto_794538 - BLOCK
      ?auto_794539 - BLOCK
      ?auto_794540 - BLOCK
      ?auto_794541 - BLOCK
      ?auto_794542 - BLOCK
      ?auto_794543 - BLOCK
      ?auto_794544 - BLOCK
      ?auto_794545 - BLOCK
      ?auto_794546 - BLOCK
      ?auto_794547 - BLOCK
    )
    :vars
    (
      ?auto_794548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794547 ?auto_794548 ) ( ON-TABLE ?auto_794537 ) ( not ( = ?auto_794537 ?auto_794538 ) ) ( not ( = ?auto_794537 ?auto_794539 ) ) ( not ( = ?auto_794537 ?auto_794540 ) ) ( not ( = ?auto_794537 ?auto_794541 ) ) ( not ( = ?auto_794537 ?auto_794542 ) ) ( not ( = ?auto_794537 ?auto_794543 ) ) ( not ( = ?auto_794537 ?auto_794544 ) ) ( not ( = ?auto_794537 ?auto_794545 ) ) ( not ( = ?auto_794537 ?auto_794546 ) ) ( not ( = ?auto_794537 ?auto_794547 ) ) ( not ( = ?auto_794537 ?auto_794548 ) ) ( not ( = ?auto_794538 ?auto_794539 ) ) ( not ( = ?auto_794538 ?auto_794540 ) ) ( not ( = ?auto_794538 ?auto_794541 ) ) ( not ( = ?auto_794538 ?auto_794542 ) ) ( not ( = ?auto_794538 ?auto_794543 ) ) ( not ( = ?auto_794538 ?auto_794544 ) ) ( not ( = ?auto_794538 ?auto_794545 ) ) ( not ( = ?auto_794538 ?auto_794546 ) ) ( not ( = ?auto_794538 ?auto_794547 ) ) ( not ( = ?auto_794538 ?auto_794548 ) ) ( not ( = ?auto_794539 ?auto_794540 ) ) ( not ( = ?auto_794539 ?auto_794541 ) ) ( not ( = ?auto_794539 ?auto_794542 ) ) ( not ( = ?auto_794539 ?auto_794543 ) ) ( not ( = ?auto_794539 ?auto_794544 ) ) ( not ( = ?auto_794539 ?auto_794545 ) ) ( not ( = ?auto_794539 ?auto_794546 ) ) ( not ( = ?auto_794539 ?auto_794547 ) ) ( not ( = ?auto_794539 ?auto_794548 ) ) ( not ( = ?auto_794540 ?auto_794541 ) ) ( not ( = ?auto_794540 ?auto_794542 ) ) ( not ( = ?auto_794540 ?auto_794543 ) ) ( not ( = ?auto_794540 ?auto_794544 ) ) ( not ( = ?auto_794540 ?auto_794545 ) ) ( not ( = ?auto_794540 ?auto_794546 ) ) ( not ( = ?auto_794540 ?auto_794547 ) ) ( not ( = ?auto_794540 ?auto_794548 ) ) ( not ( = ?auto_794541 ?auto_794542 ) ) ( not ( = ?auto_794541 ?auto_794543 ) ) ( not ( = ?auto_794541 ?auto_794544 ) ) ( not ( = ?auto_794541 ?auto_794545 ) ) ( not ( = ?auto_794541 ?auto_794546 ) ) ( not ( = ?auto_794541 ?auto_794547 ) ) ( not ( = ?auto_794541 ?auto_794548 ) ) ( not ( = ?auto_794542 ?auto_794543 ) ) ( not ( = ?auto_794542 ?auto_794544 ) ) ( not ( = ?auto_794542 ?auto_794545 ) ) ( not ( = ?auto_794542 ?auto_794546 ) ) ( not ( = ?auto_794542 ?auto_794547 ) ) ( not ( = ?auto_794542 ?auto_794548 ) ) ( not ( = ?auto_794543 ?auto_794544 ) ) ( not ( = ?auto_794543 ?auto_794545 ) ) ( not ( = ?auto_794543 ?auto_794546 ) ) ( not ( = ?auto_794543 ?auto_794547 ) ) ( not ( = ?auto_794543 ?auto_794548 ) ) ( not ( = ?auto_794544 ?auto_794545 ) ) ( not ( = ?auto_794544 ?auto_794546 ) ) ( not ( = ?auto_794544 ?auto_794547 ) ) ( not ( = ?auto_794544 ?auto_794548 ) ) ( not ( = ?auto_794545 ?auto_794546 ) ) ( not ( = ?auto_794545 ?auto_794547 ) ) ( not ( = ?auto_794545 ?auto_794548 ) ) ( not ( = ?auto_794546 ?auto_794547 ) ) ( not ( = ?auto_794546 ?auto_794548 ) ) ( not ( = ?auto_794547 ?auto_794548 ) ) ( ON ?auto_794546 ?auto_794547 ) ( ON ?auto_794545 ?auto_794546 ) ( ON ?auto_794544 ?auto_794545 ) ( ON ?auto_794543 ?auto_794544 ) ( ON ?auto_794542 ?auto_794543 ) ( ON ?auto_794541 ?auto_794542 ) ( ON ?auto_794540 ?auto_794541 ) ( ON ?auto_794539 ?auto_794540 ) ( CLEAR ?auto_794537 ) ( ON ?auto_794538 ?auto_794539 ) ( CLEAR ?auto_794538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_794537 ?auto_794538 )
      ( MAKE-11PILE ?auto_794537 ?auto_794538 ?auto_794539 ?auto_794540 ?auto_794541 ?auto_794542 ?auto_794543 ?auto_794544 ?auto_794545 ?auto_794546 ?auto_794547 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_794583 - BLOCK
      ?auto_794584 - BLOCK
      ?auto_794585 - BLOCK
      ?auto_794586 - BLOCK
      ?auto_794587 - BLOCK
      ?auto_794588 - BLOCK
      ?auto_794589 - BLOCK
      ?auto_794590 - BLOCK
      ?auto_794591 - BLOCK
      ?auto_794592 - BLOCK
      ?auto_794593 - BLOCK
    )
    :vars
    (
      ?auto_794594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794593 ?auto_794594 ) ( not ( = ?auto_794583 ?auto_794584 ) ) ( not ( = ?auto_794583 ?auto_794585 ) ) ( not ( = ?auto_794583 ?auto_794586 ) ) ( not ( = ?auto_794583 ?auto_794587 ) ) ( not ( = ?auto_794583 ?auto_794588 ) ) ( not ( = ?auto_794583 ?auto_794589 ) ) ( not ( = ?auto_794583 ?auto_794590 ) ) ( not ( = ?auto_794583 ?auto_794591 ) ) ( not ( = ?auto_794583 ?auto_794592 ) ) ( not ( = ?auto_794583 ?auto_794593 ) ) ( not ( = ?auto_794583 ?auto_794594 ) ) ( not ( = ?auto_794584 ?auto_794585 ) ) ( not ( = ?auto_794584 ?auto_794586 ) ) ( not ( = ?auto_794584 ?auto_794587 ) ) ( not ( = ?auto_794584 ?auto_794588 ) ) ( not ( = ?auto_794584 ?auto_794589 ) ) ( not ( = ?auto_794584 ?auto_794590 ) ) ( not ( = ?auto_794584 ?auto_794591 ) ) ( not ( = ?auto_794584 ?auto_794592 ) ) ( not ( = ?auto_794584 ?auto_794593 ) ) ( not ( = ?auto_794584 ?auto_794594 ) ) ( not ( = ?auto_794585 ?auto_794586 ) ) ( not ( = ?auto_794585 ?auto_794587 ) ) ( not ( = ?auto_794585 ?auto_794588 ) ) ( not ( = ?auto_794585 ?auto_794589 ) ) ( not ( = ?auto_794585 ?auto_794590 ) ) ( not ( = ?auto_794585 ?auto_794591 ) ) ( not ( = ?auto_794585 ?auto_794592 ) ) ( not ( = ?auto_794585 ?auto_794593 ) ) ( not ( = ?auto_794585 ?auto_794594 ) ) ( not ( = ?auto_794586 ?auto_794587 ) ) ( not ( = ?auto_794586 ?auto_794588 ) ) ( not ( = ?auto_794586 ?auto_794589 ) ) ( not ( = ?auto_794586 ?auto_794590 ) ) ( not ( = ?auto_794586 ?auto_794591 ) ) ( not ( = ?auto_794586 ?auto_794592 ) ) ( not ( = ?auto_794586 ?auto_794593 ) ) ( not ( = ?auto_794586 ?auto_794594 ) ) ( not ( = ?auto_794587 ?auto_794588 ) ) ( not ( = ?auto_794587 ?auto_794589 ) ) ( not ( = ?auto_794587 ?auto_794590 ) ) ( not ( = ?auto_794587 ?auto_794591 ) ) ( not ( = ?auto_794587 ?auto_794592 ) ) ( not ( = ?auto_794587 ?auto_794593 ) ) ( not ( = ?auto_794587 ?auto_794594 ) ) ( not ( = ?auto_794588 ?auto_794589 ) ) ( not ( = ?auto_794588 ?auto_794590 ) ) ( not ( = ?auto_794588 ?auto_794591 ) ) ( not ( = ?auto_794588 ?auto_794592 ) ) ( not ( = ?auto_794588 ?auto_794593 ) ) ( not ( = ?auto_794588 ?auto_794594 ) ) ( not ( = ?auto_794589 ?auto_794590 ) ) ( not ( = ?auto_794589 ?auto_794591 ) ) ( not ( = ?auto_794589 ?auto_794592 ) ) ( not ( = ?auto_794589 ?auto_794593 ) ) ( not ( = ?auto_794589 ?auto_794594 ) ) ( not ( = ?auto_794590 ?auto_794591 ) ) ( not ( = ?auto_794590 ?auto_794592 ) ) ( not ( = ?auto_794590 ?auto_794593 ) ) ( not ( = ?auto_794590 ?auto_794594 ) ) ( not ( = ?auto_794591 ?auto_794592 ) ) ( not ( = ?auto_794591 ?auto_794593 ) ) ( not ( = ?auto_794591 ?auto_794594 ) ) ( not ( = ?auto_794592 ?auto_794593 ) ) ( not ( = ?auto_794592 ?auto_794594 ) ) ( not ( = ?auto_794593 ?auto_794594 ) ) ( ON ?auto_794592 ?auto_794593 ) ( ON ?auto_794591 ?auto_794592 ) ( ON ?auto_794590 ?auto_794591 ) ( ON ?auto_794589 ?auto_794590 ) ( ON ?auto_794588 ?auto_794589 ) ( ON ?auto_794587 ?auto_794588 ) ( ON ?auto_794586 ?auto_794587 ) ( ON ?auto_794585 ?auto_794586 ) ( ON ?auto_794584 ?auto_794585 ) ( ON ?auto_794583 ?auto_794584 ) ( CLEAR ?auto_794583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_794583 )
      ( MAKE-11PILE ?auto_794583 ?auto_794584 ?auto_794585 ?auto_794586 ?auto_794587 ?auto_794588 ?auto_794589 ?auto_794590 ?auto_794591 ?auto_794592 ?auto_794593 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_794630 - BLOCK
      ?auto_794631 - BLOCK
      ?auto_794632 - BLOCK
      ?auto_794633 - BLOCK
      ?auto_794634 - BLOCK
      ?auto_794635 - BLOCK
      ?auto_794636 - BLOCK
      ?auto_794637 - BLOCK
      ?auto_794638 - BLOCK
      ?auto_794639 - BLOCK
      ?auto_794640 - BLOCK
      ?auto_794641 - BLOCK
    )
    :vars
    (
      ?auto_794642 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_794640 ) ( ON ?auto_794641 ?auto_794642 ) ( CLEAR ?auto_794641 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_794630 ) ( ON ?auto_794631 ?auto_794630 ) ( ON ?auto_794632 ?auto_794631 ) ( ON ?auto_794633 ?auto_794632 ) ( ON ?auto_794634 ?auto_794633 ) ( ON ?auto_794635 ?auto_794634 ) ( ON ?auto_794636 ?auto_794635 ) ( ON ?auto_794637 ?auto_794636 ) ( ON ?auto_794638 ?auto_794637 ) ( ON ?auto_794639 ?auto_794638 ) ( ON ?auto_794640 ?auto_794639 ) ( not ( = ?auto_794630 ?auto_794631 ) ) ( not ( = ?auto_794630 ?auto_794632 ) ) ( not ( = ?auto_794630 ?auto_794633 ) ) ( not ( = ?auto_794630 ?auto_794634 ) ) ( not ( = ?auto_794630 ?auto_794635 ) ) ( not ( = ?auto_794630 ?auto_794636 ) ) ( not ( = ?auto_794630 ?auto_794637 ) ) ( not ( = ?auto_794630 ?auto_794638 ) ) ( not ( = ?auto_794630 ?auto_794639 ) ) ( not ( = ?auto_794630 ?auto_794640 ) ) ( not ( = ?auto_794630 ?auto_794641 ) ) ( not ( = ?auto_794630 ?auto_794642 ) ) ( not ( = ?auto_794631 ?auto_794632 ) ) ( not ( = ?auto_794631 ?auto_794633 ) ) ( not ( = ?auto_794631 ?auto_794634 ) ) ( not ( = ?auto_794631 ?auto_794635 ) ) ( not ( = ?auto_794631 ?auto_794636 ) ) ( not ( = ?auto_794631 ?auto_794637 ) ) ( not ( = ?auto_794631 ?auto_794638 ) ) ( not ( = ?auto_794631 ?auto_794639 ) ) ( not ( = ?auto_794631 ?auto_794640 ) ) ( not ( = ?auto_794631 ?auto_794641 ) ) ( not ( = ?auto_794631 ?auto_794642 ) ) ( not ( = ?auto_794632 ?auto_794633 ) ) ( not ( = ?auto_794632 ?auto_794634 ) ) ( not ( = ?auto_794632 ?auto_794635 ) ) ( not ( = ?auto_794632 ?auto_794636 ) ) ( not ( = ?auto_794632 ?auto_794637 ) ) ( not ( = ?auto_794632 ?auto_794638 ) ) ( not ( = ?auto_794632 ?auto_794639 ) ) ( not ( = ?auto_794632 ?auto_794640 ) ) ( not ( = ?auto_794632 ?auto_794641 ) ) ( not ( = ?auto_794632 ?auto_794642 ) ) ( not ( = ?auto_794633 ?auto_794634 ) ) ( not ( = ?auto_794633 ?auto_794635 ) ) ( not ( = ?auto_794633 ?auto_794636 ) ) ( not ( = ?auto_794633 ?auto_794637 ) ) ( not ( = ?auto_794633 ?auto_794638 ) ) ( not ( = ?auto_794633 ?auto_794639 ) ) ( not ( = ?auto_794633 ?auto_794640 ) ) ( not ( = ?auto_794633 ?auto_794641 ) ) ( not ( = ?auto_794633 ?auto_794642 ) ) ( not ( = ?auto_794634 ?auto_794635 ) ) ( not ( = ?auto_794634 ?auto_794636 ) ) ( not ( = ?auto_794634 ?auto_794637 ) ) ( not ( = ?auto_794634 ?auto_794638 ) ) ( not ( = ?auto_794634 ?auto_794639 ) ) ( not ( = ?auto_794634 ?auto_794640 ) ) ( not ( = ?auto_794634 ?auto_794641 ) ) ( not ( = ?auto_794634 ?auto_794642 ) ) ( not ( = ?auto_794635 ?auto_794636 ) ) ( not ( = ?auto_794635 ?auto_794637 ) ) ( not ( = ?auto_794635 ?auto_794638 ) ) ( not ( = ?auto_794635 ?auto_794639 ) ) ( not ( = ?auto_794635 ?auto_794640 ) ) ( not ( = ?auto_794635 ?auto_794641 ) ) ( not ( = ?auto_794635 ?auto_794642 ) ) ( not ( = ?auto_794636 ?auto_794637 ) ) ( not ( = ?auto_794636 ?auto_794638 ) ) ( not ( = ?auto_794636 ?auto_794639 ) ) ( not ( = ?auto_794636 ?auto_794640 ) ) ( not ( = ?auto_794636 ?auto_794641 ) ) ( not ( = ?auto_794636 ?auto_794642 ) ) ( not ( = ?auto_794637 ?auto_794638 ) ) ( not ( = ?auto_794637 ?auto_794639 ) ) ( not ( = ?auto_794637 ?auto_794640 ) ) ( not ( = ?auto_794637 ?auto_794641 ) ) ( not ( = ?auto_794637 ?auto_794642 ) ) ( not ( = ?auto_794638 ?auto_794639 ) ) ( not ( = ?auto_794638 ?auto_794640 ) ) ( not ( = ?auto_794638 ?auto_794641 ) ) ( not ( = ?auto_794638 ?auto_794642 ) ) ( not ( = ?auto_794639 ?auto_794640 ) ) ( not ( = ?auto_794639 ?auto_794641 ) ) ( not ( = ?auto_794639 ?auto_794642 ) ) ( not ( = ?auto_794640 ?auto_794641 ) ) ( not ( = ?auto_794640 ?auto_794642 ) ) ( not ( = ?auto_794641 ?auto_794642 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_794641 ?auto_794642 )
      ( !STACK ?auto_794641 ?auto_794640 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_794680 - BLOCK
      ?auto_794681 - BLOCK
      ?auto_794682 - BLOCK
      ?auto_794683 - BLOCK
      ?auto_794684 - BLOCK
      ?auto_794685 - BLOCK
      ?auto_794686 - BLOCK
      ?auto_794687 - BLOCK
      ?auto_794688 - BLOCK
      ?auto_794689 - BLOCK
      ?auto_794690 - BLOCK
      ?auto_794691 - BLOCK
    )
    :vars
    (
      ?auto_794692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794691 ?auto_794692 ) ( ON-TABLE ?auto_794680 ) ( ON ?auto_794681 ?auto_794680 ) ( ON ?auto_794682 ?auto_794681 ) ( ON ?auto_794683 ?auto_794682 ) ( ON ?auto_794684 ?auto_794683 ) ( ON ?auto_794685 ?auto_794684 ) ( ON ?auto_794686 ?auto_794685 ) ( ON ?auto_794687 ?auto_794686 ) ( ON ?auto_794688 ?auto_794687 ) ( ON ?auto_794689 ?auto_794688 ) ( not ( = ?auto_794680 ?auto_794681 ) ) ( not ( = ?auto_794680 ?auto_794682 ) ) ( not ( = ?auto_794680 ?auto_794683 ) ) ( not ( = ?auto_794680 ?auto_794684 ) ) ( not ( = ?auto_794680 ?auto_794685 ) ) ( not ( = ?auto_794680 ?auto_794686 ) ) ( not ( = ?auto_794680 ?auto_794687 ) ) ( not ( = ?auto_794680 ?auto_794688 ) ) ( not ( = ?auto_794680 ?auto_794689 ) ) ( not ( = ?auto_794680 ?auto_794690 ) ) ( not ( = ?auto_794680 ?auto_794691 ) ) ( not ( = ?auto_794680 ?auto_794692 ) ) ( not ( = ?auto_794681 ?auto_794682 ) ) ( not ( = ?auto_794681 ?auto_794683 ) ) ( not ( = ?auto_794681 ?auto_794684 ) ) ( not ( = ?auto_794681 ?auto_794685 ) ) ( not ( = ?auto_794681 ?auto_794686 ) ) ( not ( = ?auto_794681 ?auto_794687 ) ) ( not ( = ?auto_794681 ?auto_794688 ) ) ( not ( = ?auto_794681 ?auto_794689 ) ) ( not ( = ?auto_794681 ?auto_794690 ) ) ( not ( = ?auto_794681 ?auto_794691 ) ) ( not ( = ?auto_794681 ?auto_794692 ) ) ( not ( = ?auto_794682 ?auto_794683 ) ) ( not ( = ?auto_794682 ?auto_794684 ) ) ( not ( = ?auto_794682 ?auto_794685 ) ) ( not ( = ?auto_794682 ?auto_794686 ) ) ( not ( = ?auto_794682 ?auto_794687 ) ) ( not ( = ?auto_794682 ?auto_794688 ) ) ( not ( = ?auto_794682 ?auto_794689 ) ) ( not ( = ?auto_794682 ?auto_794690 ) ) ( not ( = ?auto_794682 ?auto_794691 ) ) ( not ( = ?auto_794682 ?auto_794692 ) ) ( not ( = ?auto_794683 ?auto_794684 ) ) ( not ( = ?auto_794683 ?auto_794685 ) ) ( not ( = ?auto_794683 ?auto_794686 ) ) ( not ( = ?auto_794683 ?auto_794687 ) ) ( not ( = ?auto_794683 ?auto_794688 ) ) ( not ( = ?auto_794683 ?auto_794689 ) ) ( not ( = ?auto_794683 ?auto_794690 ) ) ( not ( = ?auto_794683 ?auto_794691 ) ) ( not ( = ?auto_794683 ?auto_794692 ) ) ( not ( = ?auto_794684 ?auto_794685 ) ) ( not ( = ?auto_794684 ?auto_794686 ) ) ( not ( = ?auto_794684 ?auto_794687 ) ) ( not ( = ?auto_794684 ?auto_794688 ) ) ( not ( = ?auto_794684 ?auto_794689 ) ) ( not ( = ?auto_794684 ?auto_794690 ) ) ( not ( = ?auto_794684 ?auto_794691 ) ) ( not ( = ?auto_794684 ?auto_794692 ) ) ( not ( = ?auto_794685 ?auto_794686 ) ) ( not ( = ?auto_794685 ?auto_794687 ) ) ( not ( = ?auto_794685 ?auto_794688 ) ) ( not ( = ?auto_794685 ?auto_794689 ) ) ( not ( = ?auto_794685 ?auto_794690 ) ) ( not ( = ?auto_794685 ?auto_794691 ) ) ( not ( = ?auto_794685 ?auto_794692 ) ) ( not ( = ?auto_794686 ?auto_794687 ) ) ( not ( = ?auto_794686 ?auto_794688 ) ) ( not ( = ?auto_794686 ?auto_794689 ) ) ( not ( = ?auto_794686 ?auto_794690 ) ) ( not ( = ?auto_794686 ?auto_794691 ) ) ( not ( = ?auto_794686 ?auto_794692 ) ) ( not ( = ?auto_794687 ?auto_794688 ) ) ( not ( = ?auto_794687 ?auto_794689 ) ) ( not ( = ?auto_794687 ?auto_794690 ) ) ( not ( = ?auto_794687 ?auto_794691 ) ) ( not ( = ?auto_794687 ?auto_794692 ) ) ( not ( = ?auto_794688 ?auto_794689 ) ) ( not ( = ?auto_794688 ?auto_794690 ) ) ( not ( = ?auto_794688 ?auto_794691 ) ) ( not ( = ?auto_794688 ?auto_794692 ) ) ( not ( = ?auto_794689 ?auto_794690 ) ) ( not ( = ?auto_794689 ?auto_794691 ) ) ( not ( = ?auto_794689 ?auto_794692 ) ) ( not ( = ?auto_794690 ?auto_794691 ) ) ( not ( = ?auto_794690 ?auto_794692 ) ) ( not ( = ?auto_794691 ?auto_794692 ) ) ( CLEAR ?auto_794689 ) ( ON ?auto_794690 ?auto_794691 ) ( CLEAR ?auto_794690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_794680 ?auto_794681 ?auto_794682 ?auto_794683 ?auto_794684 ?auto_794685 ?auto_794686 ?auto_794687 ?auto_794688 ?auto_794689 ?auto_794690 )
      ( MAKE-12PILE ?auto_794680 ?auto_794681 ?auto_794682 ?auto_794683 ?auto_794684 ?auto_794685 ?auto_794686 ?auto_794687 ?auto_794688 ?auto_794689 ?auto_794690 ?auto_794691 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_794730 - BLOCK
      ?auto_794731 - BLOCK
      ?auto_794732 - BLOCK
      ?auto_794733 - BLOCK
      ?auto_794734 - BLOCK
      ?auto_794735 - BLOCK
      ?auto_794736 - BLOCK
      ?auto_794737 - BLOCK
      ?auto_794738 - BLOCK
      ?auto_794739 - BLOCK
      ?auto_794740 - BLOCK
      ?auto_794741 - BLOCK
    )
    :vars
    (
      ?auto_794742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794741 ?auto_794742 ) ( ON-TABLE ?auto_794730 ) ( ON ?auto_794731 ?auto_794730 ) ( ON ?auto_794732 ?auto_794731 ) ( ON ?auto_794733 ?auto_794732 ) ( ON ?auto_794734 ?auto_794733 ) ( ON ?auto_794735 ?auto_794734 ) ( ON ?auto_794736 ?auto_794735 ) ( ON ?auto_794737 ?auto_794736 ) ( ON ?auto_794738 ?auto_794737 ) ( not ( = ?auto_794730 ?auto_794731 ) ) ( not ( = ?auto_794730 ?auto_794732 ) ) ( not ( = ?auto_794730 ?auto_794733 ) ) ( not ( = ?auto_794730 ?auto_794734 ) ) ( not ( = ?auto_794730 ?auto_794735 ) ) ( not ( = ?auto_794730 ?auto_794736 ) ) ( not ( = ?auto_794730 ?auto_794737 ) ) ( not ( = ?auto_794730 ?auto_794738 ) ) ( not ( = ?auto_794730 ?auto_794739 ) ) ( not ( = ?auto_794730 ?auto_794740 ) ) ( not ( = ?auto_794730 ?auto_794741 ) ) ( not ( = ?auto_794730 ?auto_794742 ) ) ( not ( = ?auto_794731 ?auto_794732 ) ) ( not ( = ?auto_794731 ?auto_794733 ) ) ( not ( = ?auto_794731 ?auto_794734 ) ) ( not ( = ?auto_794731 ?auto_794735 ) ) ( not ( = ?auto_794731 ?auto_794736 ) ) ( not ( = ?auto_794731 ?auto_794737 ) ) ( not ( = ?auto_794731 ?auto_794738 ) ) ( not ( = ?auto_794731 ?auto_794739 ) ) ( not ( = ?auto_794731 ?auto_794740 ) ) ( not ( = ?auto_794731 ?auto_794741 ) ) ( not ( = ?auto_794731 ?auto_794742 ) ) ( not ( = ?auto_794732 ?auto_794733 ) ) ( not ( = ?auto_794732 ?auto_794734 ) ) ( not ( = ?auto_794732 ?auto_794735 ) ) ( not ( = ?auto_794732 ?auto_794736 ) ) ( not ( = ?auto_794732 ?auto_794737 ) ) ( not ( = ?auto_794732 ?auto_794738 ) ) ( not ( = ?auto_794732 ?auto_794739 ) ) ( not ( = ?auto_794732 ?auto_794740 ) ) ( not ( = ?auto_794732 ?auto_794741 ) ) ( not ( = ?auto_794732 ?auto_794742 ) ) ( not ( = ?auto_794733 ?auto_794734 ) ) ( not ( = ?auto_794733 ?auto_794735 ) ) ( not ( = ?auto_794733 ?auto_794736 ) ) ( not ( = ?auto_794733 ?auto_794737 ) ) ( not ( = ?auto_794733 ?auto_794738 ) ) ( not ( = ?auto_794733 ?auto_794739 ) ) ( not ( = ?auto_794733 ?auto_794740 ) ) ( not ( = ?auto_794733 ?auto_794741 ) ) ( not ( = ?auto_794733 ?auto_794742 ) ) ( not ( = ?auto_794734 ?auto_794735 ) ) ( not ( = ?auto_794734 ?auto_794736 ) ) ( not ( = ?auto_794734 ?auto_794737 ) ) ( not ( = ?auto_794734 ?auto_794738 ) ) ( not ( = ?auto_794734 ?auto_794739 ) ) ( not ( = ?auto_794734 ?auto_794740 ) ) ( not ( = ?auto_794734 ?auto_794741 ) ) ( not ( = ?auto_794734 ?auto_794742 ) ) ( not ( = ?auto_794735 ?auto_794736 ) ) ( not ( = ?auto_794735 ?auto_794737 ) ) ( not ( = ?auto_794735 ?auto_794738 ) ) ( not ( = ?auto_794735 ?auto_794739 ) ) ( not ( = ?auto_794735 ?auto_794740 ) ) ( not ( = ?auto_794735 ?auto_794741 ) ) ( not ( = ?auto_794735 ?auto_794742 ) ) ( not ( = ?auto_794736 ?auto_794737 ) ) ( not ( = ?auto_794736 ?auto_794738 ) ) ( not ( = ?auto_794736 ?auto_794739 ) ) ( not ( = ?auto_794736 ?auto_794740 ) ) ( not ( = ?auto_794736 ?auto_794741 ) ) ( not ( = ?auto_794736 ?auto_794742 ) ) ( not ( = ?auto_794737 ?auto_794738 ) ) ( not ( = ?auto_794737 ?auto_794739 ) ) ( not ( = ?auto_794737 ?auto_794740 ) ) ( not ( = ?auto_794737 ?auto_794741 ) ) ( not ( = ?auto_794737 ?auto_794742 ) ) ( not ( = ?auto_794738 ?auto_794739 ) ) ( not ( = ?auto_794738 ?auto_794740 ) ) ( not ( = ?auto_794738 ?auto_794741 ) ) ( not ( = ?auto_794738 ?auto_794742 ) ) ( not ( = ?auto_794739 ?auto_794740 ) ) ( not ( = ?auto_794739 ?auto_794741 ) ) ( not ( = ?auto_794739 ?auto_794742 ) ) ( not ( = ?auto_794740 ?auto_794741 ) ) ( not ( = ?auto_794740 ?auto_794742 ) ) ( not ( = ?auto_794741 ?auto_794742 ) ) ( ON ?auto_794740 ?auto_794741 ) ( CLEAR ?auto_794738 ) ( ON ?auto_794739 ?auto_794740 ) ( CLEAR ?auto_794739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_794730 ?auto_794731 ?auto_794732 ?auto_794733 ?auto_794734 ?auto_794735 ?auto_794736 ?auto_794737 ?auto_794738 ?auto_794739 )
      ( MAKE-12PILE ?auto_794730 ?auto_794731 ?auto_794732 ?auto_794733 ?auto_794734 ?auto_794735 ?auto_794736 ?auto_794737 ?auto_794738 ?auto_794739 ?auto_794740 ?auto_794741 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_794780 - BLOCK
      ?auto_794781 - BLOCK
      ?auto_794782 - BLOCK
      ?auto_794783 - BLOCK
      ?auto_794784 - BLOCK
      ?auto_794785 - BLOCK
      ?auto_794786 - BLOCK
      ?auto_794787 - BLOCK
      ?auto_794788 - BLOCK
      ?auto_794789 - BLOCK
      ?auto_794790 - BLOCK
      ?auto_794791 - BLOCK
    )
    :vars
    (
      ?auto_794792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794791 ?auto_794792 ) ( ON-TABLE ?auto_794780 ) ( ON ?auto_794781 ?auto_794780 ) ( ON ?auto_794782 ?auto_794781 ) ( ON ?auto_794783 ?auto_794782 ) ( ON ?auto_794784 ?auto_794783 ) ( ON ?auto_794785 ?auto_794784 ) ( ON ?auto_794786 ?auto_794785 ) ( ON ?auto_794787 ?auto_794786 ) ( not ( = ?auto_794780 ?auto_794781 ) ) ( not ( = ?auto_794780 ?auto_794782 ) ) ( not ( = ?auto_794780 ?auto_794783 ) ) ( not ( = ?auto_794780 ?auto_794784 ) ) ( not ( = ?auto_794780 ?auto_794785 ) ) ( not ( = ?auto_794780 ?auto_794786 ) ) ( not ( = ?auto_794780 ?auto_794787 ) ) ( not ( = ?auto_794780 ?auto_794788 ) ) ( not ( = ?auto_794780 ?auto_794789 ) ) ( not ( = ?auto_794780 ?auto_794790 ) ) ( not ( = ?auto_794780 ?auto_794791 ) ) ( not ( = ?auto_794780 ?auto_794792 ) ) ( not ( = ?auto_794781 ?auto_794782 ) ) ( not ( = ?auto_794781 ?auto_794783 ) ) ( not ( = ?auto_794781 ?auto_794784 ) ) ( not ( = ?auto_794781 ?auto_794785 ) ) ( not ( = ?auto_794781 ?auto_794786 ) ) ( not ( = ?auto_794781 ?auto_794787 ) ) ( not ( = ?auto_794781 ?auto_794788 ) ) ( not ( = ?auto_794781 ?auto_794789 ) ) ( not ( = ?auto_794781 ?auto_794790 ) ) ( not ( = ?auto_794781 ?auto_794791 ) ) ( not ( = ?auto_794781 ?auto_794792 ) ) ( not ( = ?auto_794782 ?auto_794783 ) ) ( not ( = ?auto_794782 ?auto_794784 ) ) ( not ( = ?auto_794782 ?auto_794785 ) ) ( not ( = ?auto_794782 ?auto_794786 ) ) ( not ( = ?auto_794782 ?auto_794787 ) ) ( not ( = ?auto_794782 ?auto_794788 ) ) ( not ( = ?auto_794782 ?auto_794789 ) ) ( not ( = ?auto_794782 ?auto_794790 ) ) ( not ( = ?auto_794782 ?auto_794791 ) ) ( not ( = ?auto_794782 ?auto_794792 ) ) ( not ( = ?auto_794783 ?auto_794784 ) ) ( not ( = ?auto_794783 ?auto_794785 ) ) ( not ( = ?auto_794783 ?auto_794786 ) ) ( not ( = ?auto_794783 ?auto_794787 ) ) ( not ( = ?auto_794783 ?auto_794788 ) ) ( not ( = ?auto_794783 ?auto_794789 ) ) ( not ( = ?auto_794783 ?auto_794790 ) ) ( not ( = ?auto_794783 ?auto_794791 ) ) ( not ( = ?auto_794783 ?auto_794792 ) ) ( not ( = ?auto_794784 ?auto_794785 ) ) ( not ( = ?auto_794784 ?auto_794786 ) ) ( not ( = ?auto_794784 ?auto_794787 ) ) ( not ( = ?auto_794784 ?auto_794788 ) ) ( not ( = ?auto_794784 ?auto_794789 ) ) ( not ( = ?auto_794784 ?auto_794790 ) ) ( not ( = ?auto_794784 ?auto_794791 ) ) ( not ( = ?auto_794784 ?auto_794792 ) ) ( not ( = ?auto_794785 ?auto_794786 ) ) ( not ( = ?auto_794785 ?auto_794787 ) ) ( not ( = ?auto_794785 ?auto_794788 ) ) ( not ( = ?auto_794785 ?auto_794789 ) ) ( not ( = ?auto_794785 ?auto_794790 ) ) ( not ( = ?auto_794785 ?auto_794791 ) ) ( not ( = ?auto_794785 ?auto_794792 ) ) ( not ( = ?auto_794786 ?auto_794787 ) ) ( not ( = ?auto_794786 ?auto_794788 ) ) ( not ( = ?auto_794786 ?auto_794789 ) ) ( not ( = ?auto_794786 ?auto_794790 ) ) ( not ( = ?auto_794786 ?auto_794791 ) ) ( not ( = ?auto_794786 ?auto_794792 ) ) ( not ( = ?auto_794787 ?auto_794788 ) ) ( not ( = ?auto_794787 ?auto_794789 ) ) ( not ( = ?auto_794787 ?auto_794790 ) ) ( not ( = ?auto_794787 ?auto_794791 ) ) ( not ( = ?auto_794787 ?auto_794792 ) ) ( not ( = ?auto_794788 ?auto_794789 ) ) ( not ( = ?auto_794788 ?auto_794790 ) ) ( not ( = ?auto_794788 ?auto_794791 ) ) ( not ( = ?auto_794788 ?auto_794792 ) ) ( not ( = ?auto_794789 ?auto_794790 ) ) ( not ( = ?auto_794789 ?auto_794791 ) ) ( not ( = ?auto_794789 ?auto_794792 ) ) ( not ( = ?auto_794790 ?auto_794791 ) ) ( not ( = ?auto_794790 ?auto_794792 ) ) ( not ( = ?auto_794791 ?auto_794792 ) ) ( ON ?auto_794790 ?auto_794791 ) ( ON ?auto_794789 ?auto_794790 ) ( CLEAR ?auto_794787 ) ( ON ?auto_794788 ?auto_794789 ) ( CLEAR ?auto_794788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_794780 ?auto_794781 ?auto_794782 ?auto_794783 ?auto_794784 ?auto_794785 ?auto_794786 ?auto_794787 ?auto_794788 )
      ( MAKE-12PILE ?auto_794780 ?auto_794781 ?auto_794782 ?auto_794783 ?auto_794784 ?auto_794785 ?auto_794786 ?auto_794787 ?auto_794788 ?auto_794789 ?auto_794790 ?auto_794791 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_794830 - BLOCK
      ?auto_794831 - BLOCK
      ?auto_794832 - BLOCK
      ?auto_794833 - BLOCK
      ?auto_794834 - BLOCK
      ?auto_794835 - BLOCK
      ?auto_794836 - BLOCK
      ?auto_794837 - BLOCK
      ?auto_794838 - BLOCK
      ?auto_794839 - BLOCK
      ?auto_794840 - BLOCK
      ?auto_794841 - BLOCK
    )
    :vars
    (
      ?auto_794842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794841 ?auto_794842 ) ( ON-TABLE ?auto_794830 ) ( ON ?auto_794831 ?auto_794830 ) ( ON ?auto_794832 ?auto_794831 ) ( ON ?auto_794833 ?auto_794832 ) ( ON ?auto_794834 ?auto_794833 ) ( ON ?auto_794835 ?auto_794834 ) ( ON ?auto_794836 ?auto_794835 ) ( not ( = ?auto_794830 ?auto_794831 ) ) ( not ( = ?auto_794830 ?auto_794832 ) ) ( not ( = ?auto_794830 ?auto_794833 ) ) ( not ( = ?auto_794830 ?auto_794834 ) ) ( not ( = ?auto_794830 ?auto_794835 ) ) ( not ( = ?auto_794830 ?auto_794836 ) ) ( not ( = ?auto_794830 ?auto_794837 ) ) ( not ( = ?auto_794830 ?auto_794838 ) ) ( not ( = ?auto_794830 ?auto_794839 ) ) ( not ( = ?auto_794830 ?auto_794840 ) ) ( not ( = ?auto_794830 ?auto_794841 ) ) ( not ( = ?auto_794830 ?auto_794842 ) ) ( not ( = ?auto_794831 ?auto_794832 ) ) ( not ( = ?auto_794831 ?auto_794833 ) ) ( not ( = ?auto_794831 ?auto_794834 ) ) ( not ( = ?auto_794831 ?auto_794835 ) ) ( not ( = ?auto_794831 ?auto_794836 ) ) ( not ( = ?auto_794831 ?auto_794837 ) ) ( not ( = ?auto_794831 ?auto_794838 ) ) ( not ( = ?auto_794831 ?auto_794839 ) ) ( not ( = ?auto_794831 ?auto_794840 ) ) ( not ( = ?auto_794831 ?auto_794841 ) ) ( not ( = ?auto_794831 ?auto_794842 ) ) ( not ( = ?auto_794832 ?auto_794833 ) ) ( not ( = ?auto_794832 ?auto_794834 ) ) ( not ( = ?auto_794832 ?auto_794835 ) ) ( not ( = ?auto_794832 ?auto_794836 ) ) ( not ( = ?auto_794832 ?auto_794837 ) ) ( not ( = ?auto_794832 ?auto_794838 ) ) ( not ( = ?auto_794832 ?auto_794839 ) ) ( not ( = ?auto_794832 ?auto_794840 ) ) ( not ( = ?auto_794832 ?auto_794841 ) ) ( not ( = ?auto_794832 ?auto_794842 ) ) ( not ( = ?auto_794833 ?auto_794834 ) ) ( not ( = ?auto_794833 ?auto_794835 ) ) ( not ( = ?auto_794833 ?auto_794836 ) ) ( not ( = ?auto_794833 ?auto_794837 ) ) ( not ( = ?auto_794833 ?auto_794838 ) ) ( not ( = ?auto_794833 ?auto_794839 ) ) ( not ( = ?auto_794833 ?auto_794840 ) ) ( not ( = ?auto_794833 ?auto_794841 ) ) ( not ( = ?auto_794833 ?auto_794842 ) ) ( not ( = ?auto_794834 ?auto_794835 ) ) ( not ( = ?auto_794834 ?auto_794836 ) ) ( not ( = ?auto_794834 ?auto_794837 ) ) ( not ( = ?auto_794834 ?auto_794838 ) ) ( not ( = ?auto_794834 ?auto_794839 ) ) ( not ( = ?auto_794834 ?auto_794840 ) ) ( not ( = ?auto_794834 ?auto_794841 ) ) ( not ( = ?auto_794834 ?auto_794842 ) ) ( not ( = ?auto_794835 ?auto_794836 ) ) ( not ( = ?auto_794835 ?auto_794837 ) ) ( not ( = ?auto_794835 ?auto_794838 ) ) ( not ( = ?auto_794835 ?auto_794839 ) ) ( not ( = ?auto_794835 ?auto_794840 ) ) ( not ( = ?auto_794835 ?auto_794841 ) ) ( not ( = ?auto_794835 ?auto_794842 ) ) ( not ( = ?auto_794836 ?auto_794837 ) ) ( not ( = ?auto_794836 ?auto_794838 ) ) ( not ( = ?auto_794836 ?auto_794839 ) ) ( not ( = ?auto_794836 ?auto_794840 ) ) ( not ( = ?auto_794836 ?auto_794841 ) ) ( not ( = ?auto_794836 ?auto_794842 ) ) ( not ( = ?auto_794837 ?auto_794838 ) ) ( not ( = ?auto_794837 ?auto_794839 ) ) ( not ( = ?auto_794837 ?auto_794840 ) ) ( not ( = ?auto_794837 ?auto_794841 ) ) ( not ( = ?auto_794837 ?auto_794842 ) ) ( not ( = ?auto_794838 ?auto_794839 ) ) ( not ( = ?auto_794838 ?auto_794840 ) ) ( not ( = ?auto_794838 ?auto_794841 ) ) ( not ( = ?auto_794838 ?auto_794842 ) ) ( not ( = ?auto_794839 ?auto_794840 ) ) ( not ( = ?auto_794839 ?auto_794841 ) ) ( not ( = ?auto_794839 ?auto_794842 ) ) ( not ( = ?auto_794840 ?auto_794841 ) ) ( not ( = ?auto_794840 ?auto_794842 ) ) ( not ( = ?auto_794841 ?auto_794842 ) ) ( ON ?auto_794840 ?auto_794841 ) ( ON ?auto_794839 ?auto_794840 ) ( ON ?auto_794838 ?auto_794839 ) ( CLEAR ?auto_794836 ) ( ON ?auto_794837 ?auto_794838 ) ( CLEAR ?auto_794837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_794830 ?auto_794831 ?auto_794832 ?auto_794833 ?auto_794834 ?auto_794835 ?auto_794836 ?auto_794837 )
      ( MAKE-12PILE ?auto_794830 ?auto_794831 ?auto_794832 ?auto_794833 ?auto_794834 ?auto_794835 ?auto_794836 ?auto_794837 ?auto_794838 ?auto_794839 ?auto_794840 ?auto_794841 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_794880 - BLOCK
      ?auto_794881 - BLOCK
      ?auto_794882 - BLOCK
      ?auto_794883 - BLOCK
      ?auto_794884 - BLOCK
      ?auto_794885 - BLOCK
      ?auto_794886 - BLOCK
      ?auto_794887 - BLOCK
      ?auto_794888 - BLOCK
      ?auto_794889 - BLOCK
      ?auto_794890 - BLOCK
      ?auto_794891 - BLOCK
    )
    :vars
    (
      ?auto_794892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794891 ?auto_794892 ) ( ON-TABLE ?auto_794880 ) ( ON ?auto_794881 ?auto_794880 ) ( ON ?auto_794882 ?auto_794881 ) ( ON ?auto_794883 ?auto_794882 ) ( ON ?auto_794884 ?auto_794883 ) ( ON ?auto_794885 ?auto_794884 ) ( not ( = ?auto_794880 ?auto_794881 ) ) ( not ( = ?auto_794880 ?auto_794882 ) ) ( not ( = ?auto_794880 ?auto_794883 ) ) ( not ( = ?auto_794880 ?auto_794884 ) ) ( not ( = ?auto_794880 ?auto_794885 ) ) ( not ( = ?auto_794880 ?auto_794886 ) ) ( not ( = ?auto_794880 ?auto_794887 ) ) ( not ( = ?auto_794880 ?auto_794888 ) ) ( not ( = ?auto_794880 ?auto_794889 ) ) ( not ( = ?auto_794880 ?auto_794890 ) ) ( not ( = ?auto_794880 ?auto_794891 ) ) ( not ( = ?auto_794880 ?auto_794892 ) ) ( not ( = ?auto_794881 ?auto_794882 ) ) ( not ( = ?auto_794881 ?auto_794883 ) ) ( not ( = ?auto_794881 ?auto_794884 ) ) ( not ( = ?auto_794881 ?auto_794885 ) ) ( not ( = ?auto_794881 ?auto_794886 ) ) ( not ( = ?auto_794881 ?auto_794887 ) ) ( not ( = ?auto_794881 ?auto_794888 ) ) ( not ( = ?auto_794881 ?auto_794889 ) ) ( not ( = ?auto_794881 ?auto_794890 ) ) ( not ( = ?auto_794881 ?auto_794891 ) ) ( not ( = ?auto_794881 ?auto_794892 ) ) ( not ( = ?auto_794882 ?auto_794883 ) ) ( not ( = ?auto_794882 ?auto_794884 ) ) ( not ( = ?auto_794882 ?auto_794885 ) ) ( not ( = ?auto_794882 ?auto_794886 ) ) ( not ( = ?auto_794882 ?auto_794887 ) ) ( not ( = ?auto_794882 ?auto_794888 ) ) ( not ( = ?auto_794882 ?auto_794889 ) ) ( not ( = ?auto_794882 ?auto_794890 ) ) ( not ( = ?auto_794882 ?auto_794891 ) ) ( not ( = ?auto_794882 ?auto_794892 ) ) ( not ( = ?auto_794883 ?auto_794884 ) ) ( not ( = ?auto_794883 ?auto_794885 ) ) ( not ( = ?auto_794883 ?auto_794886 ) ) ( not ( = ?auto_794883 ?auto_794887 ) ) ( not ( = ?auto_794883 ?auto_794888 ) ) ( not ( = ?auto_794883 ?auto_794889 ) ) ( not ( = ?auto_794883 ?auto_794890 ) ) ( not ( = ?auto_794883 ?auto_794891 ) ) ( not ( = ?auto_794883 ?auto_794892 ) ) ( not ( = ?auto_794884 ?auto_794885 ) ) ( not ( = ?auto_794884 ?auto_794886 ) ) ( not ( = ?auto_794884 ?auto_794887 ) ) ( not ( = ?auto_794884 ?auto_794888 ) ) ( not ( = ?auto_794884 ?auto_794889 ) ) ( not ( = ?auto_794884 ?auto_794890 ) ) ( not ( = ?auto_794884 ?auto_794891 ) ) ( not ( = ?auto_794884 ?auto_794892 ) ) ( not ( = ?auto_794885 ?auto_794886 ) ) ( not ( = ?auto_794885 ?auto_794887 ) ) ( not ( = ?auto_794885 ?auto_794888 ) ) ( not ( = ?auto_794885 ?auto_794889 ) ) ( not ( = ?auto_794885 ?auto_794890 ) ) ( not ( = ?auto_794885 ?auto_794891 ) ) ( not ( = ?auto_794885 ?auto_794892 ) ) ( not ( = ?auto_794886 ?auto_794887 ) ) ( not ( = ?auto_794886 ?auto_794888 ) ) ( not ( = ?auto_794886 ?auto_794889 ) ) ( not ( = ?auto_794886 ?auto_794890 ) ) ( not ( = ?auto_794886 ?auto_794891 ) ) ( not ( = ?auto_794886 ?auto_794892 ) ) ( not ( = ?auto_794887 ?auto_794888 ) ) ( not ( = ?auto_794887 ?auto_794889 ) ) ( not ( = ?auto_794887 ?auto_794890 ) ) ( not ( = ?auto_794887 ?auto_794891 ) ) ( not ( = ?auto_794887 ?auto_794892 ) ) ( not ( = ?auto_794888 ?auto_794889 ) ) ( not ( = ?auto_794888 ?auto_794890 ) ) ( not ( = ?auto_794888 ?auto_794891 ) ) ( not ( = ?auto_794888 ?auto_794892 ) ) ( not ( = ?auto_794889 ?auto_794890 ) ) ( not ( = ?auto_794889 ?auto_794891 ) ) ( not ( = ?auto_794889 ?auto_794892 ) ) ( not ( = ?auto_794890 ?auto_794891 ) ) ( not ( = ?auto_794890 ?auto_794892 ) ) ( not ( = ?auto_794891 ?auto_794892 ) ) ( ON ?auto_794890 ?auto_794891 ) ( ON ?auto_794889 ?auto_794890 ) ( ON ?auto_794888 ?auto_794889 ) ( ON ?auto_794887 ?auto_794888 ) ( CLEAR ?auto_794885 ) ( ON ?auto_794886 ?auto_794887 ) ( CLEAR ?auto_794886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_794880 ?auto_794881 ?auto_794882 ?auto_794883 ?auto_794884 ?auto_794885 ?auto_794886 )
      ( MAKE-12PILE ?auto_794880 ?auto_794881 ?auto_794882 ?auto_794883 ?auto_794884 ?auto_794885 ?auto_794886 ?auto_794887 ?auto_794888 ?auto_794889 ?auto_794890 ?auto_794891 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_794930 - BLOCK
      ?auto_794931 - BLOCK
      ?auto_794932 - BLOCK
      ?auto_794933 - BLOCK
      ?auto_794934 - BLOCK
      ?auto_794935 - BLOCK
      ?auto_794936 - BLOCK
      ?auto_794937 - BLOCK
      ?auto_794938 - BLOCK
      ?auto_794939 - BLOCK
      ?auto_794940 - BLOCK
      ?auto_794941 - BLOCK
    )
    :vars
    (
      ?auto_794942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794941 ?auto_794942 ) ( ON-TABLE ?auto_794930 ) ( ON ?auto_794931 ?auto_794930 ) ( ON ?auto_794932 ?auto_794931 ) ( ON ?auto_794933 ?auto_794932 ) ( ON ?auto_794934 ?auto_794933 ) ( not ( = ?auto_794930 ?auto_794931 ) ) ( not ( = ?auto_794930 ?auto_794932 ) ) ( not ( = ?auto_794930 ?auto_794933 ) ) ( not ( = ?auto_794930 ?auto_794934 ) ) ( not ( = ?auto_794930 ?auto_794935 ) ) ( not ( = ?auto_794930 ?auto_794936 ) ) ( not ( = ?auto_794930 ?auto_794937 ) ) ( not ( = ?auto_794930 ?auto_794938 ) ) ( not ( = ?auto_794930 ?auto_794939 ) ) ( not ( = ?auto_794930 ?auto_794940 ) ) ( not ( = ?auto_794930 ?auto_794941 ) ) ( not ( = ?auto_794930 ?auto_794942 ) ) ( not ( = ?auto_794931 ?auto_794932 ) ) ( not ( = ?auto_794931 ?auto_794933 ) ) ( not ( = ?auto_794931 ?auto_794934 ) ) ( not ( = ?auto_794931 ?auto_794935 ) ) ( not ( = ?auto_794931 ?auto_794936 ) ) ( not ( = ?auto_794931 ?auto_794937 ) ) ( not ( = ?auto_794931 ?auto_794938 ) ) ( not ( = ?auto_794931 ?auto_794939 ) ) ( not ( = ?auto_794931 ?auto_794940 ) ) ( not ( = ?auto_794931 ?auto_794941 ) ) ( not ( = ?auto_794931 ?auto_794942 ) ) ( not ( = ?auto_794932 ?auto_794933 ) ) ( not ( = ?auto_794932 ?auto_794934 ) ) ( not ( = ?auto_794932 ?auto_794935 ) ) ( not ( = ?auto_794932 ?auto_794936 ) ) ( not ( = ?auto_794932 ?auto_794937 ) ) ( not ( = ?auto_794932 ?auto_794938 ) ) ( not ( = ?auto_794932 ?auto_794939 ) ) ( not ( = ?auto_794932 ?auto_794940 ) ) ( not ( = ?auto_794932 ?auto_794941 ) ) ( not ( = ?auto_794932 ?auto_794942 ) ) ( not ( = ?auto_794933 ?auto_794934 ) ) ( not ( = ?auto_794933 ?auto_794935 ) ) ( not ( = ?auto_794933 ?auto_794936 ) ) ( not ( = ?auto_794933 ?auto_794937 ) ) ( not ( = ?auto_794933 ?auto_794938 ) ) ( not ( = ?auto_794933 ?auto_794939 ) ) ( not ( = ?auto_794933 ?auto_794940 ) ) ( not ( = ?auto_794933 ?auto_794941 ) ) ( not ( = ?auto_794933 ?auto_794942 ) ) ( not ( = ?auto_794934 ?auto_794935 ) ) ( not ( = ?auto_794934 ?auto_794936 ) ) ( not ( = ?auto_794934 ?auto_794937 ) ) ( not ( = ?auto_794934 ?auto_794938 ) ) ( not ( = ?auto_794934 ?auto_794939 ) ) ( not ( = ?auto_794934 ?auto_794940 ) ) ( not ( = ?auto_794934 ?auto_794941 ) ) ( not ( = ?auto_794934 ?auto_794942 ) ) ( not ( = ?auto_794935 ?auto_794936 ) ) ( not ( = ?auto_794935 ?auto_794937 ) ) ( not ( = ?auto_794935 ?auto_794938 ) ) ( not ( = ?auto_794935 ?auto_794939 ) ) ( not ( = ?auto_794935 ?auto_794940 ) ) ( not ( = ?auto_794935 ?auto_794941 ) ) ( not ( = ?auto_794935 ?auto_794942 ) ) ( not ( = ?auto_794936 ?auto_794937 ) ) ( not ( = ?auto_794936 ?auto_794938 ) ) ( not ( = ?auto_794936 ?auto_794939 ) ) ( not ( = ?auto_794936 ?auto_794940 ) ) ( not ( = ?auto_794936 ?auto_794941 ) ) ( not ( = ?auto_794936 ?auto_794942 ) ) ( not ( = ?auto_794937 ?auto_794938 ) ) ( not ( = ?auto_794937 ?auto_794939 ) ) ( not ( = ?auto_794937 ?auto_794940 ) ) ( not ( = ?auto_794937 ?auto_794941 ) ) ( not ( = ?auto_794937 ?auto_794942 ) ) ( not ( = ?auto_794938 ?auto_794939 ) ) ( not ( = ?auto_794938 ?auto_794940 ) ) ( not ( = ?auto_794938 ?auto_794941 ) ) ( not ( = ?auto_794938 ?auto_794942 ) ) ( not ( = ?auto_794939 ?auto_794940 ) ) ( not ( = ?auto_794939 ?auto_794941 ) ) ( not ( = ?auto_794939 ?auto_794942 ) ) ( not ( = ?auto_794940 ?auto_794941 ) ) ( not ( = ?auto_794940 ?auto_794942 ) ) ( not ( = ?auto_794941 ?auto_794942 ) ) ( ON ?auto_794940 ?auto_794941 ) ( ON ?auto_794939 ?auto_794940 ) ( ON ?auto_794938 ?auto_794939 ) ( ON ?auto_794937 ?auto_794938 ) ( ON ?auto_794936 ?auto_794937 ) ( CLEAR ?auto_794934 ) ( ON ?auto_794935 ?auto_794936 ) ( CLEAR ?auto_794935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_794930 ?auto_794931 ?auto_794932 ?auto_794933 ?auto_794934 ?auto_794935 )
      ( MAKE-12PILE ?auto_794930 ?auto_794931 ?auto_794932 ?auto_794933 ?auto_794934 ?auto_794935 ?auto_794936 ?auto_794937 ?auto_794938 ?auto_794939 ?auto_794940 ?auto_794941 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_794980 - BLOCK
      ?auto_794981 - BLOCK
      ?auto_794982 - BLOCK
      ?auto_794983 - BLOCK
      ?auto_794984 - BLOCK
      ?auto_794985 - BLOCK
      ?auto_794986 - BLOCK
      ?auto_794987 - BLOCK
      ?auto_794988 - BLOCK
      ?auto_794989 - BLOCK
      ?auto_794990 - BLOCK
      ?auto_794991 - BLOCK
    )
    :vars
    (
      ?auto_794992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_794991 ?auto_794992 ) ( ON-TABLE ?auto_794980 ) ( ON ?auto_794981 ?auto_794980 ) ( ON ?auto_794982 ?auto_794981 ) ( ON ?auto_794983 ?auto_794982 ) ( not ( = ?auto_794980 ?auto_794981 ) ) ( not ( = ?auto_794980 ?auto_794982 ) ) ( not ( = ?auto_794980 ?auto_794983 ) ) ( not ( = ?auto_794980 ?auto_794984 ) ) ( not ( = ?auto_794980 ?auto_794985 ) ) ( not ( = ?auto_794980 ?auto_794986 ) ) ( not ( = ?auto_794980 ?auto_794987 ) ) ( not ( = ?auto_794980 ?auto_794988 ) ) ( not ( = ?auto_794980 ?auto_794989 ) ) ( not ( = ?auto_794980 ?auto_794990 ) ) ( not ( = ?auto_794980 ?auto_794991 ) ) ( not ( = ?auto_794980 ?auto_794992 ) ) ( not ( = ?auto_794981 ?auto_794982 ) ) ( not ( = ?auto_794981 ?auto_794983 ) ) ( not ( = ?auto_794981 ?auto_794984 ) ) ( not ( = ?auto_794981 ?auto_794985 ) ) ( not ( = ?auto_794981 ?auto_794986 ) ) ( not ( = ?auto_794981 ?auto_794987 ) ) ( not ( = ?auto_794981 ?auto_794988 ) ) ( not ( = ?auto_794981 ?auto_794989 ) ) ( not ( = ?auto_794981 ?auto_794990 ) ) ( not ( = ?auto_794981 ?auto_794991 ) ) ( not ( = ?auto_794981 ?auto_794992 ) ) ( not ( = ?auto_794982 ?auto_794983 ) ) ( not ( = ?auto_794982 ?auto_794984 ) ) ( not ( = ?auto_794982 ?auto_794985 ) ) ( not ( = ?auto_794982 ?auto_794986 ) ) ( not ( = ?auto_794982 ?auto_794987 ) ) ( not ( = ?auto_794982 ?auto_794988 ) ) ( not ( = ?auto_794982 ?auto_794989 ) ) ( not ( = ?auto_794982 ?auto_794990 ) ) ( not ( = ?auto_794982 ?auto_794991 ) ) ( not ( = ?auto_794982 ?auto_794992 ) ) ( not ( = ?auto_794983 ?auto_794984 ) ) ( not ( = ?auto_794983 ?auto_794985 ) ) ( not ( = ?auto_794983 ?auto_794986 ) ) ( not ( = ?auto_794983 ?auto_794987 ) ) ( not ( = ?auto_794983 ?auto_794988 ) ) ( not ( = ?auto_794983 ?auto_794989 ) ) ( not ( = ?auto_794983 ?auto_794990 ) ) ( not ( = ?auto_794983 ?auto_794991 ) ) ( not ( = ?auto_794983 ?auto_794992 ) ) ( not ( = ?auto_794984 ?auto_794985 ) ) ( not ( = ?auto_794984 ?auto_794986 ) ) ( not ( = ?auto_794984 ?auto_794987 ) ) ( not ( = ?auto_794984 ?auto_794988 ) ) ( not ( = ?auto_794984 ?auto_794989 ) ) ( not ( = ?auto_794984 ?auto_794990 ) ) ( not ( = ?auto_794984 ?auto_794991 ) ) ( not ( = ?auto_794984 ?auto_794992 ) ) ( not ( = ?auto_794985 ?auto_794986 ) ) ( not ( = ?auto_794985 ?auto_794987 ) ) ( not ( = ?auto_794985 ?auto_794988 ) ) ( not ( = ?auto_794985 ?auto_794989 ) ) ( not ( = ?auto_794985 ?auto_794990 ) ) ( not ( = ?auto_794985 ?auto_794991 ) ) ( not ( = ?auto_794985 ?auto_794992 ) ) ( not ( = ?auto_794986 ?auto_794987 ) ) ( not ( = ?auto_794986 ?auto_794988 ) ) ( not ( = ?auto_794986 ?auto_794989 ) ) ( not ( = ?auto_794986 ?auto_794990 ) ) ( not ( = ?auto_794986 ?auto_794991 ) ) ( not ( = ?auto_794986 ?auto_794992 ) ) ( not ( = ?auto_794987 ?auto_794988 ) ) ( not ( = ?auto_794987 ?auto_794989 ) ) ( not ( = ?auto_794987 ?auto_794990 ) ) ( not ( = ?auto_794987 ?auto_794991 ) ) ( not ( = ?auto_794987 ?auto_794992 ) ) ( not ( = ?auto_794988 ?auto_794989 ) ) ( not ( = ?auto_794988 ?auto_794990 ) ) ( not ( = ?auto_794988 ?auto_794991 ) ) ( not ( = ?auto_794988 ?auto_794992 ) ) ( not ( = ?auto_794989 ?auto_794990 ) ) ( not ( = ?auto_794989 ?auto_794991 ) ) ( not ( = ?auto_794989 ?auto_794992 ) ) ( not ( = ?auto_794990 ?auto_794991 ) ) ( not ( = ?auto_794990 ?auto_794992 ) ) ( not ( = ?auto_794991 ?auto_794992 ) ) ( ON ?auto_794990 ?auto_794991 ) ( ON ?auto_794989 ?auto_794990 ) ( ON ?auto_794988 ?auto_794989 ) ( ON ?auto_794987 ?auto_794988 ) ( ON ?auto_794986 ?auto_794987 ) ( ON ?auto_794985 ?auto_794986 ) ( CLEAR ?auto_794983 ) ( ON ?auto_794984 ?auto_794985 ) ( CLEAR ?auto_794984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_794980 ?auto_794981 ?auto_794982 ?auto_794983 ?auto_794984 )
      ( MAKE-12PILE ?auto_794980 ?auto_794981 ?auto_794982 ?auto_794983 ?auto_794984 ?auto_794985 ?auto_794986 ?auto_794987 ?auto_794988 ?auto_794989 ?auto_794990 ?auto_794991 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_795030 - BLOCK
      ?auto_795031 - BLOCK
      ?auto_795032 - BLOCK
      ?auto_795033 - BLOCK
      ?auto_795034 - BLOCK
      ?auto_795035 - BLOCK
      ?auto_795036 - BLOCK
      ?auto_795037 - BLOCK
      ?auto_795038 - BLOCK
      ?auto_795039 - BLOCK
      ?auto_795040 - BLOCK
      ?auto_795041 - BLOCK
    )
    :vars
    (
      ?auto_795042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_795041 ?auto_795042 ) ( ON-TABLE ?auto_795030 ) ( ON ?auto_795031 ?auto_795030 ) ( ON ?auto_795032 ?auto_795031 ) ( not ( = ?auto_795030 ?auto_795031 ) ) ( not ( = ?auto_795030 ?auto_795032 ) ) ( not ( = ?auto_795030 ?auto_795033 ) ) ( not ( = ?auto_795030 ?auto_795034 ) ) ( not ( = ?auto_795030 ?auto_795035 ) ) ( not ( = ?auto_795030 ?auto_795036 ) ) ( not ( = ?auto_795030 ?auto_795037 ) ) ( not ( = ?auto_795030 ?auto_795038 ) ) ( not ( = ?auto_795030 ?auto_795039 ) ) ( not ( = ?auto_795030 ?auto_795040 ) ) ( not ( = ?auto_795030 ?auto_795041 ) ) ( not ( = ?auto_795030 ?auto_795042 ) ) ( not ( = ?auto_795031 ?auto_795032 ) ) ( not ( = ?auto_795031 ?auto_795033 ) ) ( not ( = ?auto_795031 ?auto_795034 ) ) ( not ( = ?auto_795031 ?auto_795035 ) ) ( not ( = ?auto_795031 ?auto_795036 ) ) ( not ( = ?auto_795031 ?auto_795037 ) ) ( not ( = ?auto_795031 ?auto_795038 ) ) ( not ( = ?auto_795031 ?auto_795039 ) ) ( not ( = ?auto_795031 ?auto_795040 ) ) ( not ( = ?auto_795031 ?auto_795041 ) ) ( not ( = ?auto_795031 ?auto_795042 ) ) ( not ( = ?auto_795032 ?auto_795033 ) ) ( not ( = ?auto_795032 ?auto_795034 ) ) ( not ( = ?auto_795032 ?auto_795035 ) ) ( not ( = ?auto_795032 ?auto_795036 ) ) ( not ( = ?auto_795032 ?auto_795037 ) ) ( not ( = ?auto_795032 ?auto_795038 ) ) ( not ( = ?auto_795032 ?auto_795039 ) ) ( not ( = ?auto_795032 ?auto_795040 ) ) ( not ( = ?auto_795032 ?auto_795041 ) ) ( not ( = ?auto_795032 ?auto_795042 ) ) ( not ( = ?auto_795033 ?auto_795034 ) ) ( not ( = ?auto_795033 ?auto_795035 ) ) ( not ( = ?auto_795033 ?auto_795036 ) ) ( not ( = ?auto_795033 ?auto_795037 ) ) ( not ( = ?auto_795033 ?auto_795038 ) ) ( not ( = ?auto_795033 ?auto_795039 ) ) ( not ( = ?auto_795033 ?auto_795040 ) ) ( not ( = ?auto_795033 ?auto_795041 ) ) ( not ( = ?auto_795033 ?auto_795042 ) ) ( not ( = ?auto_795034 ?auto_795035 ) ) ( not ( = ?auto_795034 ?auto_795036 ) ) ( not ( = ?auto_795034 ?auto_795037 ) ) ( not ( = ?auto_795034 ?auto_795038 ) ) ( not ( = ?auto_795034 ?auto_795039 ) ) ( not ( = ?auto_795034 ?auto_795040 ) ) ( not ( = ?auto_795034 ?auto_795041 ) ) ( not ( = ?auto_795034 ?auto_795042 ) ) ( not ( = ?auto_795035 ?auto_795036 ) ) ( not ( = ?auto_795035 ?auto_795037 ) ) ( not ( = ?auto_795035 ?auto_795038 ) ) ( not ( = ?auto_795035 ?auto_795039 ) ) ( not ( = ?auto_795035 ?auto_795040 ) ) ( not ( = ?auto_795035 ?auto_795041 ) ) ( not ( = ?auto_795035 ?auto_795042 ) ) ( not ( = ?auto_795036 ?auto_795037 ) ) ( not ( = ?auto_795036 ?auto_795038 ) ) ( not ( = ?auto_795036 ?auto_795039 ) ) ( not ( = ?auto_795036 ?auto_795040 ) ) ( not ( = ?auto_795036 ?auto_795041 ) ) ( not ( = ?auto_795036 ?auto_795042 ) ) ( not ( = ?auto_795037 ?auto_795038 ) ) ( not ( = ?auto_795037 ?auto_795039 ) ) ( not ( = ?auto_795037 ?auto_795040 ) ) ( not ( = ?auto_795037 ?auto_795041 ) ) ( not ( = ?auto_795037 ?auto_795042 ) ) ( not ( = ?auto_795038 ?auto_795039 ) ) ( not ( = ?auto_795038 ?auto_795040 ) ) ( not ( = ?auto_795038 ?auto_795041 ) ) ( not ( = ?auto_795038 ?auto_795042 ) ) ( not ( = ?auto_795039 ?auto_795040 ) ) ( not ( = ?auto_795039 ?auto_795041 ) ) ( not ( = ?auto_795039 ?auto_795042 ) ) ( not ( = ?auto_795040 ?auto_795041 ) ) ( not ( = ?auto_795040 ?auto_795042 ) ) ( not ( = ?auto_795041 ?auto_795042 ) ) ( ON ?auto_795040 ?auto_795041 ) ( ON ?auto_795039 ?auto_795040 ) ( ON ?auto_795038 ?auto_795039 ) ( ON ?auto_795037 ?auto_795038 ) ( ON ?auto_795036 ?auto_795037 ) ( ON ?auto_795035 ?auto_795036 ) ( ON ?auto_795034 ?auto_795035 ) ( CLEAR ?auto_795032 ) ( ON ?auto_795033 ?auto_795034 ) ( CLEAR ?auto_795033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_795030 ?auto_795031 ?auto_795032 ?auto_795033 )
      ( MAKE-12PILE ?auto_795030 ?auto_795031 ?auto_795032 ?auto_795033 ?auto_795034 ?auto_795035 ?auto_795036 ?auto_795037 ?auto_795038 ?auto_795039 ?auto_795040 ?auto_795041 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_795080 - BLOCK
      ?auto_795081 - BLOCK
      ?auto_795082 - BLOCK
      ?auto_795083 - BLOCK
      ?auto_795084 - BLOCK
      ?auto_795085 - BLOCK
      ?auto_795086 - BLOCK
      ?auto_795087 - BLOCK
      ?auto_795088 - BLOCK
      ?auto_795089 - BLOCK
      ?auto_795090 - BLOCK
      ?auto_795091 - BLOCK
    )
    :vars
    (
      ?auto_795092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_795091 ?auto_795092 ) ( ON-TABLE ?auto_795080 ) ( ON ?auto_795081 ?auto_795080 ) ( not ( = ?auto_795080 ?auto_795081 ) ) ( not ( = ?auto_795080 ?auto_795082 ) ) ( not ( = ?auto_795080 ?auto_795083 ) ) ( not ( = ?auto_795080 ?auto_795084 ) ) ( not ( = ?auto_795080 ?auto_795085 ) ) ( not ( = ?auto_795080 ?auto_795086 ) ) ( not ( = ?auto_795080 ?auto_795087 ) ) ( not ( = ?auto_795080 ?auto_795088 ) ) ( not ( = ?auto_795080 ?auto_795089 ) ) ( not ( = ?auto_795080 ?auto_795090 ) ) ( not ( = ?auto_795080 ?auto_795091 ) ) ( not ( = ?auto_795080 ?auto_795092 ) ) ( not ( = ?auto_795081 ?auto_795082 ) ) ( not ( = ?auto_795081 ?auto_795083 ) ) ( not ( = ?auto_795081 ?auto_795084 ) ) ( not ( = ?auto_795081 ?auto_795085 ) ) ( not ( = ?auto_795081 ?auto_795086 ) ) ( not ( = ?auto_795081 ?auto_795087 ) ) ( not ( = ?auto_795081 ?auto_795088 ) ) ( not ( = ?auto_795081 ?auto_795089 ) ) ( not ( = ?auto_795081 ?auto_795090 ) ) ( not ( = ?auto_795081 ?auto_795091 ) ) ( not ( = ?auto_795081 ?auto_795092 ) ) ( not ( = ?auto_795082 ?auto_795083 ) ) ( not ( = ?auto_795082 ?auto_795084 ) ) ( not ( = ?auto_795082 ?auto_795085 ) ) ( not ( = ?auto_795082 ?auto_795086 ) ) ( not ( = ?auto_795082 ?auto_795087 ) ) ( not ( = ?auto_795082 ?auto_795088 ) ) ( not ( = ?auto_795082 ?auto_795089 ) ) ( not ( = ?auto_795082 ?auto_795090 ) ) ( not ( = ?auto_795082 ?auto_795091 ) ) ( not ( = ?auto_795082 ?auto_795092 ) ) ( not ( = ?auto_795083 ?auto_795084 ) ) ( not ( = ?auto_795083 ?auto_795085 ) ) ( not ( = ?auto_795083 ?auto_795086 ) ) ( not ( = ?auto_795083 ?auto_795087 ) ) ( not ( = ?auto_795083 ?auto_795088 ) ) ( not ( = ?auto_795083 ?auto_795089 ) ) ( not ( = ?auto_795083 ?auto_795090 ) ) ( not ( = ?auto_795083 ?auto_795091 ) ) ( not ( = ?auto_795083 ?auto_795092 ) ) ( not ( = ?auto_795084 ?auto_795085 ) ) ( not ( = ?auto_795084 ?auto_795086 ) ) ( not ( = ?auto_795084 ?auto_795087 ) ) ( not ( = ?auto_795084 ?auto_795088 ) ) ( not ( = ?auto_795084 ?auto_795089 ) ) ( not ( = ?auto_795084 ?auto_795090 ) ) ( not ( = ?auto_795084 ?auto_795091 ) ) ( not ( = ?auto_795084 ?auto_795092 ) ) ( not ( = ?auto_795085 ?auto_795086 ) ) ( not ( = ?auto_795085 ?auto_795087 ) ) ( not ( = ?auto_795085 ?auto_795088 ) ) ( not ( = ?auto_795085 ?auto_795089 ) ) ( not ( = ?auto_795085 ?auto_795090 ) ) ( not ( = ?auto_795085 ?auto_795091 ) ) ( not ( = ?auto_795085 ?auto_795092 ) ) ( not ( = ?auto_795086 ?auto_795087 ) ) ( not ( = ?auto_795086 ?auto_795088 ) ) ( not ( = ?auto_795086 ?auto_795089 ) ) ( not ( = ?auto_795086 ?auto_795090 ) ) ( not ( = ?auto_795086 ?auto_795091 ) ) ( not ( = ?auto_795086 ?auto_795092 ) ) ( not ( = ?auto_795087 ?auto_795088 ) ) ( not ( = ?auto_795087 ?auto_795089 ) ) ( not ( = ?auto_795087 ?auto_795090 ) ) ( not ( = ?auto_795087 ?auto_795091 ) ) ( not ( = ?auto_795087 ?auto_795092 ) ) ( not ( = ?auto_795088 ?auto_795089 ) ) ( not ( = ?auto_795088 ?auto_795090 ) ) ( not ( = ?auto_795088 ?auto_795091 ) ) ( not ( = ?auto_795088 ?auto_795092 ) ) ( not ( = ?auto_795089 ?auto_795090 ) ) ( not ( = ?auto_795089 ?auto_795091 ) ) ( not ( = ?auto_795089 ?auto_795092 ) ) ( not ( = ?auto_795090 ?auto_795091 ) ) ( not ( = ?auto_795090 ?auto_795092 ) ) ( not ( = ?auto_795091 ?auto_795092 ) ) ( ON ?auto_795090 ?auto_795091 ) ( ON ?auto_795089 ?auto_795090 ) ( ON ?auto_795088 ?auto_795089 ) ( ON ?auto_795087 ?auto_795088 ) ( ON ?auto_795086 ?auto_795087 ) ( ON ?auto_795085 ?auto_795086 ) ( ON ?auto_795084 ?auto_795085 ) ( ON ?auto_795083 ?auto_795084 ) ( CLEAR ?auto_795081 ) ( ON ?auto_795082 ?auto_795083 ) ( CLEAR ?auto_795082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_795080 ?auto_795081 ?auto_795082 )
      ( MAKE-12PILE ?auto_795080 ?auto_795081 ?auto_795082 ?auto_795083 ?auto_795084 ?auto_795085 ?auto_795086 ?auto_795087 ?auto_795088 ?auto_795089 ?auto_795090 ?auto_795091 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_795130 - BLOCK
      ?auto_795131 - BLOCK
      ?auto_795132 - BLOCK
      ?auto_795133 - BLOCK
      ?auto_795134 - BLOCK
      ?auto_795135 - BLOCK
      ?auto_795136 - BLOCK
      ?auto_795137 - BLOCK
      ?auto_795138 - BLOCK
      ?auto_795139 - BLOCK
      ?auto_795140 - BLOCK
      ?auto_795141 - BLOCK
    )
    :vars
    (
      ?auto_795142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_795141 ?auto_795142 ) ( ON-TABLE ?auto_795130 ) ( not ( = ?auto_795130 ?auto_795131 ) ) ( not ( = ?auto_795130 ?auto_795132 ) ) ( not ( = ?auto_795130 ?auto_795133 ) ) ( not ( = ?auto_795130 ?auto_795134 ) ) ( not ( = ?auto_795130 ?auto_795135 ) ) ( not ( = ?auto_795130 ?auto_795136 ) ) ( not ( = ?auto_795130 ?auto_795137 ) ) ( not ( = ?auto_795130 ?auto_795138 ) ) ( not ( = ?auto_795130 ?auto_795139 ) ) ( not ( = ?auto_795130 ?auto_795140 ) ) ( not ( = ?auto_795130 ?auto_795141 ) ) ( not ( = ?auto_795130 ?auto_795142 ) ) ( not ( = ?auto_795131 ?auto_795132 ) ) ( not ( = ?auto_795131 ?auto_795133 ) ) ( not ( = ?auto_795131 ?auto_795134 ) ) ( not ( = ?auto_795131 ?auto_795135 ) ) ( not ( = ?auto_795131 ?auto_795136 ) ) ( not ( = ?auto_795131 ?auto_795137 ) ) ( not ( = ?auto_795131 ?auto_795138 ) ) ( not ( = ?auto_795131 ?auto_795139 ) ) ( not ( = ?auto_795131 ?auto_795140 ) ) ( not ( = ?auto_795131 ?auto_795141 ) ) ( not ( = ?auto_795131 ?auto_795142 ) ) ( not ( = ?auto_795132 ?auto_795133 ) ) ( not ( = ?auto_795132 ?auto_795134 ) ) ( not ( = ?auto_795132 ?auto_795135 ) ) ( not ( = ?auto_795132 ?auto_795136 ) ) ( not ( = ?auto_795132 ?auto_795137 ) ) ( not ( = ?auto_795132 ?auto_795138 ) ) ( not ( = ?auto_795132 ?auto_795139 ) ) ( not ( = ?auto_795132 ?auto_795140 ) ) ( not ( = ?auto_795132 ?auto_795141 ) ) ( not ( = ?auto_795132 ?auto_795142 ) ) ( not ( = ?auto_795133 ?auto_795134 ) ) ( not ( = ?auto_795133 ?auto_795135 ) ) ( not ( = ?auto_795133 ?auto_795136 ) ) ( not ( = ?auto_795133 ?auto_795137 ) ) ( not ( = ?auto_795133 ?auto_795138 ) ) ( not ( = ?auto_795133 ?auto_795139 ) ) ( not ( = ?auto_795133 ?auto_795140 ) ) ( not ( = ?auto_795133 ?auto_795141 ) ) ( not ( = ?auto_795133 ?auto_795142 ) ) ( not ( = ?auto_795134 ?auto_795135 ) ) ( not ( = ?auto_795134 ?auto_795136 ) ) ( not ( = ?auto_795134 ?auto_795137 ) ) ( not ( = ?auto_795134 ?auto_795138 ) ) ( not ( = ?auto_795134 ?auto_795139 ) ) ( not ( = ?auto_795134 ?auto_795140 ) ) ( not ( = ?auto_795134 ?auto_795141 ) ) ( not ( = ?auto_795134 ?auto_795142 ) ) ( not ( = ?auto_795135 ?auto_795136 ) ) ( not ( = ?auto_795135 ?auto_795137 ) ) ( not ( = ?auto_795135 ?auto_795138 ) ) ( not ( = ?auto_795135 ?auto_795139 ) ) ( not ( = ?auto_795135 ?auto_795140 ) ) ( not ( = ?auto_795135 ?auto_795141 ) ) ( not ( = ?auto_795135 ?auto_795142 ) ) ( not ( = ?auto_795136 ?auto_795137 ) ) ( not ( = ?auto_795136 ?auto_795138 ) ) ( not ( = ?auto_795136 ?auto_795139 ) ) ( not ( = ?auto_795136 ?auto_795140 ) ) ( not ( = ?auto_795136 ?auto_795141 ) ) ( not ( = ?auto_795136 ?auto_795142 ) ) ( not ( = ?auto_795137 ?auto_795138 ) ) ( not ( = ?auto_795137 ?auto_795139 ) ) ( not ( = ?auto_795137 ?auto_795140 ) ) ( not ( = ?auto_795137 ?auto_795141 ) ) ( not ( = ?auto_795137 ?auto_795142 ) ) ( not ( = ?auto_795138 ?auto_795139 ) ) ( not ( = ?auto_795138 ?auto_795140 ) ) ( not ( = ?auto_795138 ?auto_795141 ) ) ( not ( = ?auto_795138 ?auto_795142 ) ) ( not ( = ?auto_795139 ?auto_795140 ) ) ( not ( = ?auto_795139 ?auto_795141 ) ) ( not ( = ?auto_795139 ?auto_795142 ) ) ( not ( = ?auto_795140 ?auto_795141 ) ) ( not ( = ?auto_795140 ?auto_795142 ) ) ( not ( = ?auto_795141 ?auto_795142 ) ) ( ON ?auto_795140 ?auto_795141 ) ( ON ?auto_795139 ?auto_795140 ) ( ON ?auto_795138 ?auto_795139 ) ( ON ?auto_795137 ?auto_795138 ) ( ON ?auto_795136 ?auto_795137 ) ( ON ?auto_795135 ?auto_795136 ) ( ON ?auto_795134 ?auto_795135 ) ( ON ?auto_795133 ?auto_795134 ) ( ON ?auto_795132 ?auto_795133 ) ( CLEAR ?auto_795130 ) ( ON ?auto_795131 ?auto_795132 ) ( CLEAR ?auto_795131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_795130 ?auto_795131 )
      ( MAKE-12PILE ?auto_795130 ?auto_795131 ?auto_795132 ?auto_795133 ?auto_795134 ?auto_795135 ?auto_795136 ?auto_795137 ?auto_795138 ?auto_795139 ?auto_795140 ?auto_795141 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_795180 - BLOCK
      ?auto_795181 - BLOCK
      ?auto_795182 - BLOCK
      ?auto_795183 - BLOCK
      ?auto_795184 - BLOCK
      ?auto_795185 - BLOCK
      ?auto_795186 - BLOCK
      ?auto_795187 - BLOCK
      ?auto_795188 - BLOCK
      ?auto_795189 - BLOCK
      ?auto_795190 - BLOCK
      ?auto_795191 - BLOCK
    )
    :vars
    (
      ?auto_795192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_795191 ?auto_795192 ) ( not ( = ?auto_795180 ?auto_795181 ) ) ( not ( = ?auto_795180 ?auto_795182 ) ) ( not ( = ?auto_795180 ?auto_795183 ) ) ( not ( = ?auto_795180 ?auto_795184 ) ) ( not ( = ?auto_795180 ?auto_795185 ) ) ( not ( = ?auto_795180 ?auto_795186 ) ) ( not ( = ?auto_795180 ?auto_795187 ) ) ( not ( = ?auto_795180 ?auto_795188 ) ) ( not ( = ?auto_795180 ?auto_795189 ) ) ( not ( = ?auto_795180 ?auto_795190 ) ) ( not ( = ?auto_795180 ?auto_795191 ) ) ( not ( = ?auto_795180 ?auto_795192 ) ) ( not ( = ?auto_795181 ?auto_795182 ) ) ( not ( = ?auto_795181 ?auto_795183 ) ) ( not ( = ?auto_795181 ?auto_795184 ) ) ( not ( = ?auto_795181 ?auto_795185 ) ) ( not ( = ?auto_795181 ?auto_795186 ) ) ( not ( = ?auto_795181 ?auto_795187 ) ) ( not ( = ?auto_795181 ?auto_795188 ) ) ( not ( = ?auto_795181 ?auto_795189 ) ) ( not ( = ?auto_795181 ?auto_795190 ) ) ( not ( = ?auto_795181 ?auto_795191 ) ) ( not ( = ?auto_795181 ?auto_795192 ) ) ( not ( = ?auto_795182 ?auto_795183 ) ) ( not ( = ?auto_795182 ?auto_795184 ) ) ( not ( = ?auto_795182 ?auto_795185 ) ) ( not ( = ?auto_795182 ?auto_795186 ) ) ( not ( = ?auto_795182 ?auto_795187 ) ) ( not ( = ?auto_795182 ?auto_795188 ) ) ( not ( = ?auto_795182 ?auto_795189 ) ) ( not ( = ?auto_795182 ?auto_795190 ) ) ( not ( = ?auto_795182 ?auto_795191 ) ) ( not ( = ?auto_795182 ?auto_795192 ) ) ( not ( = ?auto_795183 ?auto_795184 ) ) ( not ( = ?auto_795183 ?auto_795185 ) ) ( not ( = ?auto_795183 ?auto_795186 ) ) ( not ( = ?auto_795183 ?auto_795187 ) ) ( not ( = ?auto_795183 ?auto_795188 ) ) ( not ( = ?auto_795183 ?auto_795189 ) ) ( not ( = ?auto_795183 ?auto_795190 ) ) ( not ( = ?auto_795183 ?auto_795191 ) ) ( not ( = ?auto_795183 ?auto_795192 ) ) ( not ( = ?auto_795184 ?auto_795185 ) ) ( not ( = ?auto_795184 ?auto_795186 ) ) ( not ( = ?auto_795184 ?auto_795187 ) ) ( not ( = ?auto_795184 ?auto_795188 ) ) ( not ( = ?auto_795184 ?auto_795189 ) ) ( not ( = ?auto_795184 ?auto_795190 ) ) ( not ( = ?auto_795184 ?auto_795191 ) ) ( not ( = ?auto_795184 ?auto_795192 ) ) ( not ( = ?auto_795185 ?auto_795186 ) ) ( not ( = ?auto_795185 ?auto_795187 ) ) ( not ( = ?auto_795185 ?auto_795188 ) ) ( not ( = ?auto_795185 ?auto_795189 ) ) ( not ( = ?auto_795185 ?auto_795190 ) ) ( not ( = ?auto_795185 ?auto_795191 ) ) ( not ( = ?auto_795185 ?auto_795192 ) ) ( not ( = ?auto_795186 ?auto_795187 ) ) ( not ( = ?auto_795186 ?auto_795188 ) ) ( not ( = ?auto_795186 ?auto_795189 ) ) ( not ( = ?auto_795186 ?auto_795190 ) ) ( not ( = ?auto_795186 ?auto_795191 ) ) ( not ( = ?auto_795186 ?auto_795192 ) ) ( not ( = ?auto_795187 ?auto_795188 ) ) ( not ( = ?auto_795187 ?auto_795189 ) ) ( not ( = ?auto_795187 ?auto_795190 ) ) ( not ( = ?auto_795187 ?auto_795191 ) ) ( not ( = ?auto_795187 ?auto_795192 ) ) ( not ( = ?auto_795188 ?auto_795189 ) ) ( not ( = ?auto_795188 ?auto_795190 ) ) ( not ( = ?auto_795188 ?auto_795191 ) ) ( not ( = ?auto_795188 ?auto_795192 ) ) ( not ( = ?auto_795189 ?auto_795190 ) ) ( not ( = ?auto_795189 ?auto_795191 ) ) ( not ( = ?auto_795189 ?auto_795192 ) ) ( not ( = ?auto_795190 ?auto_795191 ) ) ( not ( = ?auto_795190 ?auto_795192 ) ) ( not ( = ?auto_795191 ?auto_795192 ) ) ( ON ?auto_795190 ?auto_795191 ) ( ON ?auto_795189 ?auto_795190 ) ( ON ?auto_795188 ?auto_795189 ) ( ON ?auto_795187 ?auto_795188 ) ( ON ?auto_795186 ?auto_795187 ) ( ON ?auto_795185 ?auto_795186 ) ( ON ?auto_795184 ?auto_795185 ) ( ON ?auto_795183 ?auto_795184 ) ( ON ?auto_795182 ?auto_795183 ) ( ON ?auto_795181 ?auto_795182 ) ( ON ?auto_795180 ?auto_795181 ) ( CLEAR ?auto_795180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_795180 )
      ( MAKE-12PILE ?auto_795180 ?auto_795181 ?auto_795182 ?auto_795183 ?auto_795184 ?auto_795185 ?auto_795186 ?auto_795187 ?auto_795188 ?auto_795189 ?auto_795190 ?auto_795191 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_795231 - BLOCK
      ?auto_795232 - BLOCK
      ?auto_795233 - BLOCK
      ?auto_795234 - BLOCK
      ?auto_795235 - BLOCK
      ?auto_795236 - BLOCK
      ?auto_795237 - BLOCK
      ?auto_795238 - BLOCK
      ?auto_795239 - BLOCK
      ?auto_795240 - BLOCK
      ?auto_795241 - BLOCK
      ?auto_795242 - BLOCK
      ?auto_795243 - BLOCK
    )
    :vars
    (
      ?auto_795244 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_795242 ) ( ON ?auto_795243 ?auto_795244 ) ( CLEAR ?auto_795243 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_795231 ) ( ON ?auto_795232 ?auto_795231 ) ( ON ?auto_795233 ?auto_795232 ) ( ON ?auto_795234 ?auto_795233 ) ( ON ?auto_795235 ?auto_795234 ) ( ON ?auto_795236 ?auto_795235 ) ( ON ?auto_795237 ?auto_795236 ) ( ON ?auto_795238 ?auto_795237 ) ( ON ?auto_795239 ?auto_795238 ) ( ON ?auto_795240 ?auto_795239 ) ( ON ?auto_795241 ?auto_795240 ) ( ON ?auto_795242 ?auto_795241 ) ( not ( = ?auto_795231 ?auto_795232 ) ) ( not ( = ?auto_795231 ?auto_795233 ) ) ( not ( = ?auto_795231 ?auto_795234 ) ) ( not ( = ?auto_795231 ?auto_795235 ) ) ( not ( = ?auto_795231 ?auto_795236 ) ) ( not ( = ?auto_795231 ?auto_795237 ) ) ( not ( = ?auto_795231 ?auto_795238 ) ) ( not ( = ?auto_795231 ?auto_795239 ) ) ( not ( = ?auto_795231 ?auto_795240 ) ) ( not ( = ?auto_795231 ?auto_795241 ) ) ( not ( = ?auto_795231 ?auto_795242 ) ) ( not ( = ?auto_795231 ?auto_795243 ) ) ( not ( = ?auto_795231 ?auto_795244 ) ) ( not ( = ?auto_795232 ?auto_795233 ) ) ( not ( = ?auto_795232 ?auto_795234 ) ) ( not ( = ?auto_795232 ?auto_795235 ) ) ( not ( = ?auto_795232 ?auto_795236 ) ) ( not ( = ?auto_795232 ?auto_795237 ) ) ( not ( = ?auto_795232 ?auto_795238 ) ) ( not ( = ?auto_795232 ?auto_795239 ) ) ( not ( = ?auto_795232 ?auto_795240 ) ) ( not ( = ?auto_795232 ?auto_795241 ) ) ( not ( = ?auto_795232 ?auto_795242 ) ) ( not ( = ?auto_795232 ?auto_795243 ) ) ( not ( = ?auto_795232 ?auto_795244 ) ) ( not ( = ?auto_795233 ?auto_795234 ) ) ( not ( = ?auto_795233 ?auto_795235 ) ) ( not ( = ?auto_795233 ?auto_795236 ) ) ( not ( = ?auto_795233 ?auto_795237 ) ) ( not ( = ?auto_795233 ?auto_795238 ) ) ( not ( = ?auto_795233 ?auto_795239 ) ) ( not ( = ?auto_795233 ?auto_795240 ) ) ( not ( = ?auto_795233 ?auto_795241 ) ) ( not ( = ?auto_795233 ?auto_795242 ) ) ( not ( = ?auto_795233 ?auto_795243 ) ) ( not ( = ?auto_795233 ?auto_795244 ) ) ( not ( = ?auto_795234 ?auto_795235 ) ) ( not ( = ?auto_795234 ?auto_795236 ) ) ( not ( = ?auto_795234 ?auto_795237 ) ) ( not ( = ?auto_795234 ?auto_795238 ) ) ( not ( = ?auto_795234 ?auto_795239 ) ) ( not ( = ?auto_795234 ?auto_795240 ) ) ( not ( = ?auto_795234 ?auto_795241 ) ) ( not ( = ?auto_795234 ?auto_795242 ) ) ( not ( = ?auto_795234 ?auto_795243 ) ) ( not ( = ?auto_795234 ?auto_795244 ) ) ( not ( = ?auto_795235 ?auto_795236 ) ) ( not ( = ?auto_795235 ?auto_795237 ) ) ( not ( = ?auto_795235 ?auto_795238 ) ) ( not ( = ?auto_795235 ?auto_795239 ) ) ( not ( = ?auto_795235 ?auto_795240 ) ) ( not ( = ?auto_795235 ?auto_795241 ) ) ( not ( = ?auto_795235 ?auto_795242 ) ) ( not ( = ?auto_795235 ?auto_795243 ) ) ( not ( = ?auto_795235 ?auto_795244 ) ) ( not ( = ?auto_795236 ?auto_795237 ) ) ( not ( = ?auto_795236 ?auto_795238 ) ) ( not ( = ?auto_795236 ?auto_795239 ) ) ( not ( = ?auto_795236 ?auto_795240 ) ) ( not ( = ?auto_795236 ?auto_795241 ) ) ( not ( = ?auto_795236 ?auto_795242 ) ) ( not ( = ?auto_795236 ?auto_795243 ) ) ( not ( = ?auto_795236 ?auto_795244 ) ) ( not ( = ?auto_795237 ?auto_795238 ) ) ( not ( = ?auto_795237 ?auto_795239 ) ) ( not ( = ?auto_795237 ?auto_795240 ) ) ( not ( = ?auto_795237 ?auto_795241 ) ) ( not ( = ?auto_795237 ?auto_795242 ) ) ( not ( = ?auto_795237 ?auto_795243 ) ) ( not ( = ?auto_795237 ?auto_795244 ) ) ( not ( = ?auto_795238 ?auto_795239 ) ) ( not ( = ?auto_795238 ?auto_795240 ) ) ( not ( = ?auto_795238 ?auto_795241 ) ) ( not ( = ?auto_795238 ?auto_795242 ) ) ( not ( = ?auto_795238 ?auto_795243 ) ) ( not ( = ?auto_795238 ?auto_795244 ) ) ( not ( = ?auto_795239 ?auto_795240 ) ) ( not ( = ?auto_795239 ?auto_795241 ) ) ( not ( = ?auto_795239 ?auto_795242 ) ) ( not ( = ?auto_795239 ?auto_795243 ) ) ( not ( = ?auto_795239 ?auto_795244 ) ) ( not ( = ?auto_795240 ?auto_795241 ) ) ( not ( = ?auto_795240 ?auto_795242 ) ) ( not ( = ?auto_795240 ?auto_795243 ) ) ( not ( = ?auto_795240 ?auto_795244 ) ) ( not ( = ?auto_795241 ?auto_795242 ) ) ( not ( = ?auto_795241 ?auto_795243 ) ) ( not ( = ?auto_795241 ?auto_795244 ) ) ( not ( = ?auto_795242 ?auto_795243 ) ) ( not ( = ?auto_795242 ?auto_795244 ) ) ( not ( = ?auto_795243 ?auto_795244 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_795243 ?auto_795244 )
      ( !STACK ?auto_795243 ?auto_795242 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_795285 - BLOCK
      ?auto_795286 - BLOCK
      ?auto_795287 - BLOCK
      ?auto_795288 - BLOCK
      ?auto_795289 - BLOCK
      ?auto_795290 - BLOCK
      ?auto_795291 - BLOCK
      ?auto_795292 - BLOCK
      ?auto_795293 - BLOCK
      ?auto_795294 - BLOCK
      ?auto_795295 - BLOCK
      ?auto_795296 - BLOCK
      ?auto_795297 - BLOCK
    )
    :vars
    (
      ?auto_795298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_795297 ?auto_795298 ) ( ON-TABLE ?auto_795285 ) ( ON ?auto_795286 ?auto_795285 ) ( ON ?auto_795287 ?auto_795286 ) ( ON ?auto_795288 ?auto_795287 ) ( ON ?auto_795289 ?auto_795288 ) ( ON ?auto_795290 ?auto_795289 ) ( ON ?auto_795291 ?auto_795290 ) ( ON ?auto_795292 ?auto_795291 ) ( ON ?auto_795293 ?auto_795292 ) ( ON ?auto_795294 ?auto_795293 ) ( ON ?auto_795295 ?auto_795294 ) ( not ( = ?auto_795285 ?auto_795286 ) ) ( not ( = ?auto_795285 ?auto_795287 ) ) ( not ( = ?auto_795285 ?auto_795288 ) ) ( not ( = ?auto_795285 ?auto_795289 ) ) ( not ( = ?auto_795285 ?auto_795290 ) ) ( not ( = ?auto_795285 ?auto_795291 ) ) ( not ( = ?auto_795285 ?auto_795292 ) ) ( not ( = ?auto_795285 ?auto_795293 ) ) ( not ( = ?auto_795285 ?auto_795294 ) ) ( not ( = ?auto_795285 ?auto_795295 ) ) ( not ( = ?auto_795285 ?auto_795296 ) ) ( not ( = ?auto_795285 ?auto_795297 ) ) ( not ( = ?auto_795285 ?auto_795298 ) ) ( not ( = ?auto_795286 ?auto_795287 ) ) ( not ( = ?auto_795286 ?auto_795288 ) ) ( not ( = ?auto_795286 ?auto_795289 ) ) ( not ( = ?auto_795286 ?auto_795290 ) ) ( not ( = ?auto_795286 ?auto_795291 ) ) ( not ( = ?auto_795286 ?auto_795292 ) ) ( not ( = ?auto_795286 ?auto_795293 ) ) ( not ( = ?auto_795286 ?auto_795294 ) ) ( not ( = ?auto_795286 ?auto_795295 ) ) ( not ( = ?auto_795286 ?auto_795296 ) ) ( not ( = ?auto_795286 ?auto_795297 ) ) ( not ( = ?auto_795286 ?auto_795298 ) ) ( not ( = ?auto_795287 ?auto_795288 ) ) ( not ( = ?auto_795287 ?auto_795289 ) ) ( not ( = ?auto_795287 ?auto_795290 ) ) ( not ( = ?auto_795287 ?auto_795291 ) ) ( not ( = ?auto_795287 ?auto_795292 ) ) ( not ( = ?auto_795287 ?auto_795293 ) ) ( not ( = ?auto_795287 ?auto_795294 ) ) ( not ( = ?auto_795287 ?auto_795295 ) ) ( not ( = ?auto_795287 ?auto_795296 ) ) ( not ( = ?auto_795287 ?auto_795297 ) ) ( not ( = ?auto_795287 ?auto_795298 ) ) ( not ( = ?auto_795288 ?auto_795289 ) ) ( not ( = ?auto_795288 ?auto_795290 ) ) ( not ( = ?auto_795288 ?auto_795291 ) ) ( not ( = ?auto_795288 ?auto_795292 ) ) ( not ( = ?auto_795288 ?auto_795293 ) ) ( not ( = ?auto_795288 ?auto_795294 ) ) ( not ( = ?auto_795288 ?auto_795295 ) ) ( not ( = ?auto_795288 ?auto_795296 ) ) ( not ( = ?auto_795288 ?auto_795297 ) ) ( not ( = ?auto_795288 ?auto_795298 ) ) ( not ( = ?auto_795289 ?auto_795290 ) ) ( not ( = ?auto_795289 ?auto_795291 ) ) ( not ( = ?auto_795289 ?auto_795292 ) ) ( not ( = ?auto_795289 ?auto_795293 ) ) ( not ( = ?auto_795289 ?auto_795294 ) ) ( not ( = ?auto_795289 ?auto_795295 ) ) ( not ( = ?auto_795289 ?auto_795296 ) ) ( not ( = ?auto_795289 ?auto_795297 ) ) ( not ( = ?auto_795289 ?auto_795298 ) ) ( not ( = ?auto_795290 ?auto_795291 ) ) ( not ( = ?auto_795290 ?auto_795292 ) ) ( not ( = ?auto_795290 ?auto_795293 ) ) ( not ( = ?auto_795290 ?auto_795294 ) ) ( not ( = ?auto_795290 ?auto_795295 ) ) ( not ( = ?auto_795290 ?auto_795296 ) ) ( not ( = ?auto_795290 ?auto_795297 ) ) ( not ( = ?auto_795290 ?auto_795298 ) ) ( not ( = ?auto_795291 ?auto_795292 ) ) ( not ( = ?auto_795291 ?auto_795293 ) ) ( not ( = ?auto_795291 ?auto_795294 ) ) ( not ( = ?auto_795291 ?auto_795295 ) ) ( not ( = ?auto_795291 ?auto_795296 ) ) ( not ( = ?auto_795291 ?auto_795297 ) ) ( not ( = ?auto_795291 ?auto_795298 ) ) ( not ( = ?auto_795292 ?auto_795293 ) ) ( not ( = ?auto_795292 ?auto_795294 ) ) ( not ( = ?auto_795292 ?auto_795295 ) ) ( not ( = ?auto_795292 ?auto_795296 ) ) ( not ( = ?auto_795292 ?auto_795297 ) ) ( not ( = ?auto_795292 ?auto_795298 ) ) ( not ( = ?auto_795293 ?auto_795294 ) ) ( not ( = ?auto_795293 ?auto_795295 ) ) ( not ( = ?auto_795293 ?auto_795296 ) ) ( not ( = ?auto_795293 ?auto_795297 ) ) ( not ( = ?auto_795293 ?auto_795298 ) ) ( not ( = ?auto_795294 ?auto_795295 ) ) ( not ( = ?auto_795294 ?auto_795296 ) ) ( not ( = ?auto_795294 ?auto_795297 ) ) ( not ( = ?auto_795294 ?auto_795298 ) ) ( not ( = ?auto_795295 ?auto_795296 ) ) ( not ( = ?auto_795295 ?auto_795297 ) ) ( not ( = ?auto_795295 ?auto_795298 ) ) ( not ( = ?auto_795296 ?auto_795297 ) ) ( not ( = ?auto_795296 ?auto_795298 ) ) ( not ( = ?auto_795297 ?auto_795298 ) ) ( CLEAR ?auto_795295 ) ( ON ?auto_795296 ?auto_795297 ) ( CLEAR ?auto_795296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_795285 ?auto_795286 ?auto_795287 ?auto_795288 ?auto_795289 ?auto_795290 ?auto_795291 ?auto_795292 ?auto_795293 ?auto_795294 ?auto_795295 ?auto_795296 )
      ( MAKE-13PILE ?auto_795285 ?auto_795286 ?auto_795287 ?auto_795288 ?auto_795289 ?auto_795290 ?auto_795291 ?auto_795292 ?auto_795293 ?auto_795294 ?auto_795295 ?auto_795296 ?auto_795297 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_795339 - BLOCK
      ?auto_795340 - BLOCK
      ?auto_795341 - BLOCK
      ?auto_795342 - BLOCK
      ?auto_795343 - BLOCK
      ?auto_795344 - BLOCK
      ?auto_795345 - BLOCK
      ?auto_795346 - BLOCK
      ?auto_795347 - BLOCK
      ?auto_795348 - BLOCK
      ?auto_795349 - BLOCK
      ?auto_795350 - BLOCK
      ?auto_795351 - BLOCK
    )
    :vars
    (
      ?auto_795352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_795351 ?auto_795352 ) ( ON-TABLE ?auto_795339 ) ( ON ?auto_795340 ?auto_795339 ) ( ON ?auto_795341 ?auto_795340 ) ( ON ?auto_795342 ?auto_795341 ) ( ON ?auto_795343 ?auto_795342 ) ( ON ?auto_795344 ?auto_795343 ) ( ON ?auto_795345 ?auto_795344 ) ( ON ?auto_795346 ?auto_795345 ) ( ON ?auto_795347 ?auto_795346 ) ( ON ?auto_795348 ?auto_795347 ) ( not ( = ?auto_795339 ?auto_795340 ) ) ( not ( = ?auto_795339 ?auto_795341 ) ) ( not ( = ?auto_795339 ?auto_795342 ) ) ( not ( = ?auto_795339 ?auto_795343 ) ) ( not ( = ?auto_795339 ?auto_795344 ) ) ( not ( = ?auto_795339 ?auto_795345 ) ) ( not ( = ?auto_795339 ?auto_795346 ) ) ( not ( = ?auto_795339 ?auto_795347 ) ) ( not ( = ?auto_795339 ?auto_795348 ) ) ( not ( = ?auto_795339 ?auto_795349 ) ) ( not ( = ?auto_795339 ?auto_795350 ) ) ( not ( = ?auto_795339 ?auto_795351 ) ) ( not ( = ?auto_795339 ?auto_795352 ) ) ( not ( = ?auto_795340 ?auto_795341 ) ) ( not ( = ?auto_795340 ?auto_795342 ) ) ( not ( = ?auto_795340 ?auto_795343 ) ) ( not ( = ?auto_795340 ?auto_795344 ) ) ( not ( = ?auto_795340 ?auto_795345 ) ) ( not ( = ?auto_795340 ?auto_795346 ) ) ( not ( = ?auto_795340 ?auto_795347 ) ) ( not ( = ?auto_795340 ?auto_795348 ) ) ( not ( = ?auto_795340 ?auto_795349 ) ) ( not ( = ?auto_795340 ?auto_795350 ) ) ( not ( = ?auto_795340 ?auto_795351 ) ) ( not ( = ?auto_795340 ?auto_795352 ) ) ( not ( = ?auto_795341 ?auto_795342 ) ) ( not ( = ?auto_795341 ?auto_795343 ) ) ( not ( = ?auto_795341 ?auto_795344 ) ) ( not ( = ?auto_795341 ?auto_795345 ) ) ( not ( = ?auto_795341 ?auto_795346 ) ) ( not ( = ?auto_795341 ?auto_795347 ) ) ( not ( = ?auto_795341 ?auto_795348 ) ) ( not ( = ?auto_795341 ?auto_795349 ) ) ( not ( = ?auto_795341 ?auto_795350 ) ) ( not ( = ?auto_795341 ?auto_795351 ) ) ( not ( = ?auto_795341 ?auto_795352 ) ) ( not ( = ?auto_795342 ?auto_795343 ) ) ( not ( = ?auto_795342 ?auto_795344 ) ) ( not ( = ?auto_795342 ?auto_795345 ) ) ( not ( = ?auto_795342 ?auto_795346 ) ) ( not ( = ?auto_795342 ?auto_795347 ) ) ( not ( = ?auto_795342 ?auto_795348 ) ) ( not ( = ?auto_795342 ?auto_795349 ) ) ( not ( = ?auto_795342 ?auto_795350 ) ) ( not ( = ?auto_795342 ?auto_795351 ) ) ( not ( = ?auto_795342 ?auto_795352 ) ) ( not ( = ?auto_795343 ?auto_795344 ) ) ( not ( = ?auto_795343 ?auto_795345 ) ) ( not ( = ?auto_795343 ?auto_795346 ) ) ( not ( = ?auto_795343 ?auto_795347 ) ) ( not ( = ?auto_795343 ?auto_795348 ) ) ( not ( = ?auto_795343 ?auto_795349 ) ) ( not ( = ?auto_795343 ?auto_795350 ) ) ( not ( = ?auto_795343 ?auto_795351 ) ) ( not ( = ?auto_795343 ?auto_795352 ) ) ( not ( = ?auto_795344 ?auto_795345 ) ) ( not ( = ?auto_795344 ?auto_795346 ) ) ( not ( = ?auto_795344 ?auto_795347 ) ) ( not ( = ?auto_795344 ?auto_795348 ) ) ( not ( = ?auto_795344 ?auto_795349 ) ) ( not ( = ?auto_795344 ?auto_795350 ) ) ( not ( = ?auto_795344 ?auto_795351 ) ) ( not ( = ?auto_795344 ?auto_795352 ) ) ( not ( = ?auto_795345 ?auto_795346 ) ) ( not ( = ?auto_795345 ?auto_795347 ) ) ( not ( = ?auto_795345 ?auto_795348 ) ) ( not ( = ?auto_795345 ?auto_795349 ) ) ( not ( = ?auto_795345 ?auto_795350 ) ) ( not ( = ?auto_795345 ?auto_795351 ) ) ( not ( = ?auto_795345 ?auto_795352 ) ) ( not ( = ?auto_795346 ?auto_795347 ) ) ( not ( = ?auto_795346 ?auto_795348 ) ) ( not ( = ?auto_795346 ?auto_795349 ) ) ( not ( = ?auto_795346 ?auto_795350 ) ) ( not ( = ?auto_795346 ?auto_795351 ) ) ( not ( = ?auto_795346 ?auto_795352 ) ) ( not ( = ?auto_795347 ?auto_795348 ) ) ( not ( = ?auto_795347 ?auto_795349 ) ) ( not ( = ?auto_795347 ?auto_795350 ) ) ( not ( = ?auto_795347 ?auto_795351 ) ) ( not ( = ?auto_795347 ?auto_795352 ) ) ( not ( = ?auto_795348 ?auto_795349 ) ) ( not ( = ?auto_795348 ?auto_795350 ) ) ( not ( = ?auto_795348 ?auto_795351 ) ) ( not ( = ?auto_795348 ?auto_795352 ) ) ( not ( = ?auto_795349 ?auto_795350 ) ) ( not ( = ?auto_795349 ?auto_795351 ) ) ( not ( = ?auto_795349 ?auto_795352 ) ) ( not ( = ?auto_795350 ?auto_795351 ) ) ( not ( = ?auto_795350 ?auto_795352 ) ) ( not ( = ?auto_795351 ?auto_795352 ) ) ( ON ?auto_795350 ?auto_795351 ) ( CLEAR ?auto_795348 ) ( ON ?auto_795349 ?auto_795350 ) ( CLEAR ?auto_795349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_795339 ?auto_795340 ?auto_795341 ?auto_795342 ?auto_795343 ?auto_795344 ?auto_795345 ?auto_795346 ?auto_795347 ?auto_795348 ?auto_795349 )
      ( MAKE-13PILE ?auto_795339 ?auto_795340 ?auto_795341 ?auto_795342 ?auto_795343 ?auto_795344 ?auto_795345 ?auto_795346 ?auto_795347 ?auto_795348 ?auto_795349 ?auto_795350 ?auto_795351 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_795393 - BLOCK
      ?auto_795394 - BLOCK
      ?auto_795395 - BLOCK
      ?auto_795396 - BLOCK
      ?auto_795397 - BLOCK
      ?auto_795398 - BLOCK
      ?auto_795399 - BLOCK
      ?auto_795400 - BLOCK
      ?auto_795401 - BLOCK
      ?auto_795402 - BLOCK
      ?auto_795403 - BLOCK
      ?auto_795404 - BLOCK
      ?auto_795405 - BLOCK
    )
    :vars
    (
      ?auto_795406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_795405 ?auto_795406 ) ( ON-TABLE ?auto_795393 ) ( ON ?auto_795394 ?auto_795393 ) ( ON ?auto_795395 ?auto_795394 ) ( ON ?auto_795396 ?auto_795395 ) ( ON ?auto_795397 ?auto_795396 ) ( ON ?auto_795398 ?auto_795397 ) ( ON ?auto_795399 ?auto_795398 ) ( ON ?auto_795400 ?auto_795399 ) ( ON ?auto_795401 ?auto_795400 ) ( not ( = ?auto_795393 ?auto_795394 ) ) ( not ( = ?auto_795393 ?auto_795395 ) ) ( not ( = ?auto_795393 ?auto_795396 ) ) ( not ( = ?auto_795393 ?auto_795397 ) ) ( not ( = ?auto_795393 ?auto_795398 ) ) ( not ( = ?auto_795393 ?auto_795399 ) ) ( not ( = ?auto_795393 ?auto_795400 ) ) ( not ( = ?auto_795393 ?auto_795401 ) ) ( not ( = ?auto_795393 ?auto_795402 ) ) ( not ( = ?auto_795393 ?auto_795403 ) ) ( not ( = ?auto_795393 ?auto_795404 ) ) ( not ( = ?auto_795393 ?auto_795405 ) ) ( not ( = ?auto_795393 ?auto_795406 ) ) ( not ( = ?auto_795394 ?auto_795395 ) ) ( not ( = ?auto_795394 ?auto_795396 ) ) ( not ( = ?auto_795394 ?auto_795397 ) ) ( not ( = ?auto_795394 ?auto_795398 ) ) ( not ( = ?auto_795394 ?auto_795399 ) ) ( not ( = ?auto_795394 ?auto_795400 ) ) ( not ( = ?auto_795394 ?auto_795401 ) ) ( not ( = ?auto_795394 ?auto_795402 ) ) ( not ( = ?auto_795394 ?auto_795403 ) ) ( not ( = ?auto_795394 ?auto_795404 ) ) ( not ( = ?auto_795394 ?auto_795405 ) ) ( not ( = ?auto_795394 ?auto_795406 ) ) ( not ( = ?auto_795395 ?auto_795396 ) ) ( not ( = ?auto_795395 ?auto_795397 ) ) ( not ( = ?auto_795395 ?auto_795398 ) ) ( not ( = ?auto_795395 ?auto_795399 ) ) ( not ( = ?auto_795395 ?auto_795400 ) ) ( not ( = ?auto_795395 ?auto_795401 ) ) ( not ( = ?auto_795395 ?auto_795402 ) ) ( not ( = ?auto_795395 ?auto_795403 ) ) ( not ( = ?auto_795395 ?auto_795404 ) ) ( not ( = ?auto_795395 ?auto_795405 ) ) ( not ( = ?auto_795395 ?auto_795406 ) ) ( not ( = ?auto_795396 ?auto_795397 ) ) ( not ( = ?auto_795396 ?auto_795398 ) ) ( not ( = ?auto_795396 ?auto_795399 ) ) ( not ( = ?auto_795396 ?auto_795400 ) ) ( not ( = ?auto_795396 ?auto_795401 ) ) ( not ( = ?auto_795396 ?auto_795402 ) ) ( not ( = ?auto_795396 ?auto_795403 ) ) ( not ( = ?auto_795396 ?auto_795404 ) ) ( not ( = ?auto_795396 ?auto_795405 ) ) ( not ( = ?auto_795396 ?auto_795406 ) ) ( not ( = ?auto_795397 ?auto_795398 ) ) ( not ( = ?auto_795397 ?auto_795399 ) ) ( not ( = ?auto_795397 ?auto_795400 ) ) ( not ( = ?auto_795397 ?auto_795401 ) ) ( not ( = ?auto_795397 ?auto_795402 ) ) ( not ( = ?auto_795397 ?auto_795403 ) ) ( not ( = ?auto_795397 ?auto_795404 ) ) ( not ( = ?auto_795397 ?auto_795405 ) ) ( not ( = ?auto_795397 ?auto_795406 ) ) ( not ( = ?auto_795398 ?auto_795399 ) ) ( not ( = ?auto_795398 ?auto_795400 ) ) ( not ( = ?auto_795398 ?auto_795401 ) ) ( not ( = ?auto_795398 ?auto_795402 ) ) ( not ( = ?auto_795398 ?auto_795403 ) ) ( not ( = ?auto_795398 ?auto_795404 ) ) ( not ( = ?auto_795398 ?auto_795405 ) ) ( not ( = ?auto_795398 ?auto_795406 ) ) ( not ( = ?auto_795399 ?auto_795400 ) ) ( not ( = ?auto_795399 ?auto_795401 ) ) ( not ( = ?auto_795399 ?auto_795402 ) ) ( not ( = ?auto_795399 ?auto_795403 ) ) ( not ( = ?auto_795399 ?auto_795404 ) ) ( not ( = ?auto_795399 ?auto_795405 ) ) ( not ( = ?auto_795399 ?auto_795406 ) ) ( not ( = ?auto_795400 ?auto_795401 ) ) ( not ( = ?auto_795400 ?auto_795402 ) ) ( not ( = ?auto_795400 ?auto_795403 ) ) ( not ( = ?auto_795400 ?auto_795404 ) ) ( not ( = ?auto_795400 ?auto_795405 ) ) ( not ( = ?auto_795400 ?auto_795406 ) ) ( not ( = ?auto_795401 ?auto_795402 ) ) ( not ( = ?auto_795401 ?auto_795403 ) ) ( not ( = ?auto_795401 ?auto_795404 ) ) ( not ( = ?auto_795401 ?auto_795405 ) ) ( not ( = ?auto_795401 ?auto_795406 ) ) ( not ( = ?auto_795402 ?auto_795403 ) ) ( not ( = ?auto_795402 ?auto_795404 ) ) ( not ( = ?auto_795402 ?auto_795405 ) ) ( not ( = ?auto_795402 ?auto_795406 ) ) ( not ( = ?auto_795403 ?auto_795404 ) ) ( not ( = ?auto_795403 ?auto_795405 ) ) ( not ( = ?auto_795403 ?auto_795406 ) ) ( not ( = ?auto_795404 ?auto_795405 ) ) ( not ( = ?auto_795404 ?auto_795406 ) ) ( not ( = ?auto_795405 ?auto_795406 ) ) ( ON ?auto_795404 ?auto_795405 ) ( ON ?auto_795403 ?auto_795404 ) ( CLEAR ?auto_795401 ) ( ON ?auto_795402 ?auto_795403 ) ( CLEAR ?auto_795402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_795393 ?auto_795394 ?auto_795395 ?auto_795396 ?auto_795397 ?auto_795398 ?auto_795399 ?auto_795400 ?auto_795401 ?auto_795402 )
      ( MAKE-13PILE ?auto_795393 ?auto_795394 ?auto_795395 ?auto_795396 ?auto_795397 ?auto_795398 ?auto_795399 ?auto_795400 ?auto_795401 ?auto_795402 ?auto_795403 ?auto_795404 ?auto_795405 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_795447 - BLOCK
      ?auto_795448 - BLOCK
      ?auto_795449 - BLOCK
      ?auto_795450 - BLOCK
      ?auto_795451 - BLOCK
      ?auto_795452 - BLOCK
      ?auto_795453 - BLOCK
      ?auto_795454 - BLOCK
      ?auto_795455 - BLOCK
      ?auto_795456 - BLOCK
      ?auto_795457 - BLOCK
      ?auto_795458 - BLOCK
      ?auto_795459 - BLOCK
    )
    :vars
    (
      ?auto_795460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_795459 ?auto_795460 ) ( ON-TABLE ?auto_795447 ) ( ON ?auto_795448 ?auto_795447 ) ( ON ?auto_795449 ?auto_795448 ) ( ON ?auto_795450 ?auto_795449 ) ( ON ?auto_795451 ?auto_795450 ) ( ON ?auto_795452 ?auto_795451 ) ( ON ?auto_795453 ?auto_795452 ) ( ON ?auto_795454 ?auto_795453 ) ( not ( = ?auto_795447 ?auto_795448 ) ) ( not ( = ?auto_795447 ?auto_795449 ) ) ( not ( = ?auto_795447 ?auto_795450 ) ) ( not ( = ?auto_795447 ?auto_795451 ) ) ( not ( = ?auto_795447 ?auto_795452 ) ) ( not ( = ?auto_795447 ?auto_795453 ) ) ( not ( = ?auto_795447 ?auto_795454 ) ) ( not ( = ?auto_795447 ?auto_795455 ) ) ( not ( = ?auto_795447 ?auto_795456 ) ) ( not ( = ?auto_795447 ?auto_795457 ) ) ( not ( = ?auto_795447 ?auto_795458 ) ) ( not ( = ?auto_795447 ?auto_795459 ) ) ( not ( = ?auto_795447 ?auto_795460 ) ) ( not ( = ?auto_795448 ?auto_795449 ) ) ( not ( = ?auto_795448 ?auto_795450 ) ) ( not ( = ?auto_795448 ?auto_795451 ) ) ( not ( = ?auto_795448 ?auto_795452 ) ) ( not ( = ?auto_795448 ?auto_795453 ) ) ( not ( = ?auto_795448 ?auto_795454 ) ) ( not ( = ?auto_795448 ?auto_795455 ) ) ( not ( = ?auto_795448 ?auto_795456 ) ) ( not ( = ?auto_795448 ?auto_795457 ) ) ( not ( = ?auto_795448 ?auto_795458 ) ) ( not ( = ?auto_795448 ?auto_795459 ) ) ( not ( = ?auto_795448 ?auto_795460 ) ) ( not ( = ?auto_795449 ?auto_795450 ) ) ( not ( = ?auto_795449 ?auto_795451 ) ) ( not ( = ?auto_795449 ?auto_795452 ) ) ( not ( = ?auto_795449 ?auto_795453 ) ) ( not ( = ?auto_795449 ?auto_795454 ) ) ( not ( = ?auto_795449 ?auto_795455 ) ) ( not ( = ?auto_795449 ?auto_795456 ) ) ( not ( = ?auto_795449 ?auto_795457 ) ) ( not ( = ?auto_795449 ?auto_795458 ) ) ( not ( = ?auto_795449 ?auto_795459 ) ) ( not ( = ?auto_795449 ?auto_795460 ) ) ( not ( = ?auto_795450 ?auto_795451 ) ) ( not ( = ?auto_795450 ?auto_795452 ) ) ( not ( = ?auto_795450 ?auto_795453 ) ) ( not ( = ?auto_795450 ?auto_795454 ) ) ( not ( = ?auto_795450 ?auto_795455 ) ) ( not ( = ?auto_795450 ?auto_795456 ) ) ( not ( = ?auto_795450 ?auto_795457 ) ) ( not ( = ?auto_795450 ?auto_795458 ) ) ( not ( = ?auto_795450 ?auto_795459 ) ) ( not ( = ?auto_795450 ?auto_795460 ) ) ( not ( = ?auto_795451 ?auto_795452 ) ) ( not ( = ?auto_795451 ?auto_795453 ) ) ( not ( = ?auto_795451 ?auto_795454 ) ) ( not ( = ?auto_795451 ?auto_795455 ) ) ( not ( = ?auto_795451 ?auto_795456 ) ) ( not ( = ?auto_795451 ?auto_795457 ) ) ( not ( = ?auto_795451 ?auto_795458 ) ) ( not ( = ?auto_795451 ?auto_795459 ) ) ( not ( = ?auto_795451 ?auto_795460 ) ) ( not ( = ?auto_795452 ?auto_795453 ) ) ( not ( = ?auto_795452 ?auto_795454 ) ) ( not ( = ?auto_795452 ?auto_795455 ) ) ( not ( = ?auto_795452 ?auto_795456 ) ) ( not ( = ?auto_795452 ?auto_795457 ) ) ( not ( = ?auto_795452 ?auto_795458 ) ) ( not ( = ?auto_795452 ?auto_795459 ) ) ( not ( = ?auto_795452 ?auto_795460 ) ) ( not ( = ?auto_795453 ?auto_795454 ) ) ( not ( = ?auto_795453 ?auto_795455 ) ) ( not ( = ?auto_795453 ?auto_795456 ) ) ( not ( = ?auto_795453 ?auto_795457 ) ) ( not ( = ?auto_795453 ?auto_795458 ) ) ( not ( = ?auto_795453 ?auto_795459 ) ) ( not ( = ?auto_795453 ?auto_795460 ) ) ( not ( = ?auto_795454 ?auto_795455 ) ) ( not ( = ?auto_795454 ?auto_795456 ) ) ( not ( = ?auto_795454 ?auto_795457 ) ) ( not ( = ?auto_795454 ?auto_795458 ) ) ( not ( = ?auto_795454 ?auto_795459 ) ) ( not ( = ?auto_795454 ?auto_795460 ) ) ( not ( = ?auto_795455 ?auto_795456 ) ) ( not ( = ?auto_795455 ?auto_795457 ) ) ( not ( = ?auto_795455 ?auto_795458 ) ) ( not ( = ?auto_795455 ?auto_795459 ) ) ( not ( = ?auto_795455 ?auto_795460 ) ) ( not ( = ?auto_795456 ?auto_795457 ) ) ( not ( = ?auto_795456 ?auto_795458 ) ) ( not ( = ?auto_795456 ?auto_795459 ) ) ( not ( = ?auto_795456 ?auto_795460 ) ) ( not ( = ?auto_795457 ?auto_795458 ) ) ( not ( = ?auto_795457 ?auto_795459 ) ) ( not ( = ?auto_795457 ?auto_795460 ) ) ( not ( = ?auto_795458 ?auto_795459 ) ) ( not ( = ?auto_795458 ?auto_795460 ) ) ( not ( = ?auto_795459 ?auto_795460 ) ) ( ON ?auto_795458 ?auto_795459 ) ( ON ?auto_795457 ?auto_795458 ) ( ON ?auto_795456 ?auto_795457 ) ( CLEAR ?auto_795454 ) ( ON ?auto_795455 ?auto_795456 ) ( CLEAR ?auto_795455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_795447 ?auto_795448 ?auto_795449 ?auto_795450 ?auto_795451 ?auto_795452 ?auto_795453 ?auto_795454 ?auto_795455 )
      ( MAKE-13PILE ?auto_795447 ?auto_795448 ?auto_795449 ?auto_795450 ?auto_795451 ?auto_795452 ?auto_795453 ?auto_795454 ?auto_795455 ?auto_795456 ?auto_795457 ?auto_795458 ?auto_795459 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_795501 - BLOCK
      ?auto_795502 - BLOCK
      ?auto_795503 - BLOCK
      ?auto_795504 - BLOCK
      ?auto_795505 - BLOCK
      ?auto_795506 - BLOCK
      ?auto_795507 - BLOCK
      ?auto_795508 - BLOCK
      ?auto_795509 - BLOCK
      ?auto_795510 - BLOCK
      ?auto_795511 - BLOCK
      ?auto_795512 - BLOCK
      ?auto_795513 - BLOCK
    )
    :vars
    (
      ?auto_795514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_795513 ?auto_795514 ) ( ON-TABLE ?auto_795501 ) ( ON ?auto_795502 ?auto_795501 ) ( ON ?auto_795503 ?auto_795502 ) ( ON ?auto_795504 ?auto_795503 ) ( ON ?auto_795505 ?auto_795504 ) ( ON ?auto_795506 ?auto_795505 ) ( ON ?auto_795507 ?auto_795506 ) ( not ( = ?auto_795501 ?auto_795502 ) ) ( not ( = ?auto_795501 ?auto_795503 ) ) ( not ( = ?auto_795501 ?auto_795504 ) ) ( not ( = ?auto_795501 ?auto_795505 ) ) ( not ( = ?auto_795501 ?auto_795506 ) ) ( not ( = ?auto_795501 ?auto_795507 ) ) ( not ( = ?auto_795501 ?auto_795508 ) ) ( not ( = ?auto_795501 ?auto_795509 ) ) ( not ( = ?auto_795501 ?auto_795510 ) ) ( not ( = ?auto_795501 ?auto_795511 ) ) ( not ( = ?auto_795501 ?auto_795512 ) ) ( not ( = ?auto_795501 ?auto_795513 ) ) ( not ( = ?auto_795501 ?auto_795514 ) ) ( not ( = ?auto_795502 ?auto_795503 ) ) ( not ( = ?auto_795502 ?auto_795504 ) ) ( not ( = ?auto_795502 ?auto_795505 ) ) ( not ( = ?auto_795502 ?auto_795506 ) ) ( not ( = ?auto_795502 ?auto_795507 ) ) ( not ( = ?auto_795502 ?auto_795508 ) ) ( not ( = ?auto_795502 ?auto_795509 ) ) ( not ( = ?auto_795502 ?auto_795510 ) ) ( not ( = ?auto_795502 ?auto_795511 ) ) ( not ( = ?auto_795502 ?auto_795512 ) ) ( not ( = ?auto_795502 ?auto_795513 ) ) ( not ( = ?auto_795502 ?auto_795514 ) ) ( not ( = ?auto_795503 ?auto_795504 ) ) ( not ( = ?auto_795503 ?auto_795505 ) ) ( not ( = ?auto_795503 ?auto_795506 ) ) ( not ( = ?auto_795503 ?auto_795507 ) ) ( not ( = ?auto_795503 ?auto_795508 ) ) ( not ( = ?auto_795503 ?auto_795509 ) ) ( not ( = ?auto_795503 ?auto_795510 ) ) ( not ( = ?auto_795503 ?auto_795511 ) ) ( not ( = ?auto_795503 ?auto_795512 ) ) ( not ( = ?auto_795503 ?auto_795513 ) ) ( not ( = ?auto_795503 ?auto_795514 ) ) ( not ( = ?auto_795504 ?auto_795505 ) ) ( not ( = ?auto_795504 ?auto_795506 ) ) ( not ( = ?auto_795504 ?auto_795507 ) ) ( not ( = ?auto_795504 ?auto_795508 ) ) ( not ( = ?auto_795504 ?auto_795509 ) ) ( not ( = ?auto_795504 ?auto_795510 ) ) ( not ( = ?auto_795504 ?auto_795511 ) ) ( not ( = ?auto_795504 ?auto_795512 ) ) ( not ( = ?auto_795504 ?auto_795513 ) ) ( not ( = ?auto_795504 ?auto_795514 ) ) ( not ( = ?auto_795505 ?auto_795506 ) ) ( not ( = ?auto_795505 ?auto_795507 ) ) ( not ( = ?auto_795505 ?auto_795508 ) ) ( not ( = ?auto_795505 ?auto_795509 ) ) ( not ( = ?auto_795505 ?auto_795510 ) ) ( not ( = ?auto_795505 ?auto_795511 ) ) ( not ( = ?auto_795505 ?auto_795512 ) ) ( not ( = ?auto_795505 ?auto_795513 ) ) ( not ( = ?auto_795505 ?auto_795514 ) ) ( not ( = ?auto_795506 ?auto_795507 ) ) ( not ( = ?auto_795506 ?auto_795508 ) ) ( not ( = ?auto_795506 ?auto_795509 ) ) ( not ( = ?auto_795506 ?auto_795510 ) ) ( not ( = ?auto_795506 ?auto_795511 ) ) ( not ( = ?auto_795506 ?auto_795512 ) ) ( not ( = ?auto_795506 ?auto_795513 ) ) ( not ( = ?auto_795506 ?auto_795514 ) ) ( not ( = ?auto_795507 ?auto_795508 ) ) ( not ( = ?auto_795507 ?auto_795509 ) ) ( not ( = ?auto_795507 ?auto_795510 ) ) ( not ( = ?auto_795507 ?auto_795511 ) ) ( not ( = ?auto_795507 ?auto_795512 ) ) ( not ( = ?auto_795507 ?auto_795513 ) ) ( not ( = ?auto_795507 ?auto_795514 ) ) ( not ( = ?auto_795508 ?auto_795509 ) ) ( not ( = ?auto_795508 ?auto_795510 ) ) ( not ( = ?auto_795508 ?auto_795511 ) ) ( not ( = ?auto_795508 ?auto_795512 ) ) ( not ( = ?auto_795508 ?auto_795513 ) ) ( not ( = ?auto_795508 ?auto_795514 ) ) ( not ( = ?auto_795509 ?auto_795510 ) ) ( not ( = ?auto_795509 ?auto_795511 ) ) ( not ( = ?auto_795509 ?auto_795512 ) ) ( not ( = ?auto_795509 ?auto_795513 ) ) ( not ( = ?auto_795509 ?auto_795514 ) ) ( not ( = ?auto_795510 ?auto_795511 ) ) ( not ( = ?auto_795510 ?auto_795512 ) ) ( not ( = ?auto_795510 ?auto_795513 ) ) ( not ( = ?auto_795510 ?auto_795514 ) ) ( not ( = ?auto_795511 ?auto_795512 ) ) ( not ( = ?auto_795511 ?auto_795513 ) ) ( not ( = ?auto_795511 ?auto_795514 ) ) ( not ( = ?auto_795512 ?auto_795513 ) ) ( not ( = ?auto_795512 ?auto_795514 ) ) ( not ( = ?auto_795513 ?auto_795514 ) ) ( ON ?auto_795512 ?auto_795513 ) ( ON ?auto_795511 ?auto_795512 ) ( ON ?auto_795510 ?auto_795511 ) ( ON ?auto_795509 ?auto_795510 ) ( CLEAR ?auto_795507 ) ( ON ?auto_795508 ?auto_795509 ) ( CLEAR ?auto_795508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_795501 ?auto_795502 ?auto_795503 ?auto_795504 ?auto_795505 ?auto_795506 ?auto_795507 ?auto_795508 )
      ( MAKE-13PILE ?auto_795501 ?auto_795502 ?auto_795503 ?auto_795504 ?auto_795505 ?auto_795506 ?auto_795507 ?auto_795508 ?auto_795509 ?auto_795510 ?auto_795511 ?auto_795512 ?auto_795513 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_795555 - BLOCK
      ?auto_795556 - BLOCK
      ?auto_795557 - BLOCK
      ?auto_795558 - BLOCK
      ?auto_795559 - BLOCK
      ?auto_795560 - BLOCK
      ?auto_795561 - BLOCK
      ?auto_795562 - BLOCK
      ?auto_795563 - BLOCK
      ?auto_795564 - BLOCK
      ?auto_795565 - BLOCK
      ?auto_795566 - BLOCK
      ?auto_795567 - BLOCK
    )
    :vars
    (
      ?auto_795568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_795567 ?auto_795568 ) ( ON-TABLE ?auto_795555 ) ( ON ?auto_795556 ?auto_795555 ) ( ON ?auto_795557 ?auto_795556 ) ( ON ?auto_795558 ?auto_795557 ) ( ON ?auto_795559 ?auto_795558 ) ( ON ?auto_795560 ?auto_795559 ) ( not ( = ?auto_795555 ?auto_795556 ) ) ( not ( = ?auto_795555 ?auto_795557 ) ) ( not ( = ?auto_795555 ?auto_795558 ) ) ( not ( = ?auto_795555 ?auto_795559 ) ) ( not ( = ?auto_795555 ?auto_795560 ) ) ( not ( = ?auto_795555 ?auto_795561 ) ) ( not ( = ?auto_795555 ?auto_795562 ) ) ( not ( = ?auto_795555 ?auto_795563 ) ) ( not ( = ?auto_795555 ?auto_795564 ) ) ( not ( = ?auto_795555 ?auto_795565 ) ) ( not ( = ?auto_795555 ?auto_795566 ) ) ( not ( = ?auto_795555 ?auto_795567 ) ) ( not ( = ?auto_795555 ?auto_795568 ) ) ( not ( = ?auto_795556 ?auto_795557 ) ) ( not ( = ?auto_795556 ?auto_795558 ) ) ( not ( = ?auto_795556 ?auto_795559 ) ) ( not ( = ?auto_795556 ?auto_795560 ) ) ( not ( = ?auto_795556 ?auto_795561 ) ) ( not ( = ?auto_795556 ?auto_795562 ) ) ( not ( = ?auto_795556 ?auto_795563 ) ) ( not ( = ?auto_795556 ?auto_795564 ) ) ( not ( = ?auto_795556 ?auto_795565 ) ) ( not ( = ?auto_795556 ?auto_795566 ) ) ( not ( = ?auto_795556 ?auto_795567 ) ) ( not ( = ?auto_795556 ?auto_795568 ) ) ( not ( = ?auto_795557 ?auto_795558 ) ) ( not ( = ?auto_795557 ?auto_795559 ) ) ( not ( = ?auto_795557 ?auto_795560 ) ) ( not ( = ?auto_795557 ?auto_795561 ) ) ( not ( = ?auto_795557 ?auto_795562 ) ) ( not ( = ?auto_795557 ?auto_795563 ) ) ( not ( = ?auto_795557 ?auto_795564 ) ) ( not ( = ?auto_795557 ?auto_795565 ) ) ( not ( = ?auto_795557 ?auto_795566 ) ) ( not ( = ?auto_795557 ?auto_795567 ) ) ( not ( = ?auto_795557 ?auto_795568 ) ) ( not ( = ?auto_795558 ?auto_795559 ) ) ( not ( = ?auto_795558 ?auto_795560 ) ) ( not ( = ?auto_795558 ?auto_795561 ) ) ( not ( = ?auto_795558 ?auto_795562 ) ) ( not ( = ?auto_795558 ?auto_795563 ) ) ( not ( = ?auto_795558 ?auto_795564 ) ) ( not ( = ?auto_795558 ?auto_795565 ) ) ( not ( = ?auto_795558 ?auto_795566 ) ) ( not ( = ?auto_795558 ?auto_795567 ) ) ( not ( = ?auto_795558 ?auto_795568 ) ) ( not ( = ?auto_795559 ?auto_795560 ) ) ( not ( = ?auto_795559 ?auto_795561 ) ) ( not ( = ?auto_795559 ?auto_795562 ) ) ( not ( = ?auto_795559 ?auto_795563 ) ) ( not ( = ?auto_795559 ?auto_795564 ) ) ( not ( = ?auto_795559 ?auto_795565 ) ) ( not ( = ?auto_795559 ?auto_795566 ) ) ( not ( = ?auto_795559 ?auto_795567 ) ) ( not ( = ?auto_795559 ?auto_795568 ) ) ( not ( = ?auto_795560 ?auto_795561 ) ) ( not ( = ?auto_795560 ?auto_795562 ) ) ( not ( = ?auto_795560 ?auto_795563 ) ) ( not ( = ?auto_795560 ?auto_795564 ) ) ( not ( = ?auto_795560 ?auto_795565 ) ) ( not ( = ?auto_795560 ?auto_795566 ) ) ( not ( = ?auto_795560 ?auto_795567 ) ) ( not ( = ?auto_795560 ?auto_795568 ) ) ( not ( = ?auto_795561 ?auto_795562 ) ) ( not ( = ?auto_795561 ?auto_795563 ) ) ( not ( = ?auto_795561 ?auto_795564 ) ) ( not ( = ?auto_795561 ?auto_795565 ) ) ( not ( = ?auto_795561 ?auto_795566 ) ) ( not ( = ?auto_795561 ?auto_795567 ) ) ( not ( = ?auto_795561 ?auto_795568 ) ) ( not ( = ?auto_795562 ?auto_795563 ) ) ( not ( = ?auto_795562 ?auto_795564 ) ) ( not ( = ?auto_795562 ?auto_795565 ) ) ( not ( = ?auto_795562 ?auto_795566 ) ) ( not ( = ?auto_795562 ?auto_795567 ) ) ( not ( = ?auto_795562 ?auto_795568 ) ) ( not ( = ?auto_795563 ?auto_795564 ) ) ( not ( = ?auto_795563 ?auto_795565 ) ) ( not ( = ?auto_795563 ?auto_795566 ) ) ( not ( = ?auto_795563 ?auto_795567 ) ) ( not ( = ?auto_795563 ?auto_795568 ) ) ( not ( = ?auto_795564 ?auto_795565 ) ) ( not ( = ?auto_795564 ?auto_795566 ) ) ( not ( = ?auto_795564 ?auto_795567 ) ) ( not ( = ?auto_795564 ?auto_795568 ) ) ( not ( = ?auto_795565 ?auto_795566 ) ) ( not ( = ?auto_795565 ?auto_795567 ) ) ( not ( = ?auto_795565 ?auto_795568 ) ) ( not ( = ?auto_795566 ?auto_795567 ) ) ( not ( = ?auto_795566 ?auto_795568 ) ) ( not ( = ?auto_795567 ?auto_795568 ) ) ( ON ?auto_795566 ?auto_795567 ) ( ON ?auto_795565 ?auto_795566 ) ( ON ?auto_795564 ?auto_795565 ) ( ON ?auto_795563 ?auto_795564 ) ( ON ?auto_795562 ?auto_795563 ) ( CLEAR ?auto_795560 ) ( ON ?auto_795561 ?auto_795562 ) ( CLEAR ?auto_795561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_795555 ?auto_795556 ?auto_795557 ?auto_795558 ?auto_795559 ?auto_795560 ?auto_795561 )
      ( MAKE-13PILE ?auto_795555 ?auto_795556 ?auto_795557 ?auto_795558 ?auto_795559 ?auto_795560 ?auto_795561 ?auto_795562 ?auto_795563 ?auto_795564 ?auto_795565 ?auto_795566 ?auto_795567 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_795609 - BLOCK
      ?auto_795610 - BLOCK
      ?auto_795611 - BLOCK
      ?auto_795612 - BLOCK
      ?auto_795613 - BLOCK
      ?auto_795614 - BLOCK
      ?auto_795615 - BLOCK
      ?auto_795616 - BLOCK
      ?auto_795617 - BLOCK
      ?auto_795618 - BLOCK
      ?auto_795619 - BLOCK
      ?auto_795620 - BLOCK
      ?auto_795621 - BLOCK
    )
    :vars
    (
      ?auto_795622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_795621 ?auto_795622 ) ( ON-TABLE ?auto_795609 ) ( ON ?auto_795610 ?auto_795609 ) ( ON ?auto_795611 ?auto_795610 ) ( ON ?auto_795612 ?auto_795611 ) ( ON ?auto_795613 ?auto_795612 ) ( not ( = ?auto_795609 ?auto_795610 ) ) ( not ( = ?auto_795609 ?auto_795611 ) ) ( not ( = ?auto_795609 ?auto_795612 ) ) ( not ( = ?auto_795609 ?auto_795613 ) ) ( not ( = ?auto_795609 ?auto_795614 ) ) ( not ( = ?auto_795609 ?auto_795615 ) ) ( not ( = ?auto_795609 ?auto_795616 ) ) ( not ( = ?auto_795609 ?auto_795617 ) ) ( not ( = ?auto_795609 ?auto_795618 ) ) ( not ( = ?auto_795609 ?auto_795619 ) ) ( not ( = ?auto_795609 ?auto_795620 ) ) ( not ( = ?auto_795609 ?auto_795621 ) ) ( not ( = ?auto_795609 ?auto_795622 ) ) ( not ( = ?auto_795610 ?auto_795611 ) ) ( not ( = ?auto_795610 ?auto_795612 ) ) ( not ( = ?auto_795610 ?auto_795613 ) ) ( not ( = ?auto_795610 ?auto_795614 ) ) ( not ( = ?auto_795610 ?auto_795615 ) ) ( not ( = ?auto_795610 ?auto_795616 ) ) ( not ( = ?auto_795610 ?auto_795617 ) ) ( not ( = ?auto_795610 ?auto_795618 ) ) ( not ( = ?auto_795610 ?auto_795619 ) ) ( not ( = ?auto_795610 ?auto_795620 ) ) ( not ( = ?auto_795610 ?auto_795621 ) ) ( not ( = ?auto_795610 ?auto_795622 ) ) ( not ( = ?auto_795611 ?auto_795612 ) ) ( not ( = ?auto_795611 ?auto_795613 ) ) ( not ( = ?auto_795611 ?auto_795614 ) ) ( not ( = ?auto_795611 ?auto_795615 ) ) ( not ( = ?auto_795611 ?auto_795616 ) ) ( not ( = ?auto_795611 ?auto_795617 ) ) ( not ( = ?auto_795611 ?auto_795618 ) ) ( not ( = ?auto_795611 ?auto_795619 ) ) ( not ( = ?auto_795611 ?auto_795620 ) ) ( not ( = ?auto_795611 ?auto_795621 ) ) ( not ( = ?auto_795611 ?auto_795622 ) ) ( not ( = ?auto_795612 ?auto_795613 ) ) ( not ( = ?auto_795612 ?auto_795614 ) ) ( not ( = ?auto_795612 ?auto_795615 ) ) ( not ( = ?auto_795612 ?auto_795616 ) ) ( not ( = ?auto_795612 ?auto_795617 ) ) ( not ( = ?auto_795612 ?auto_795618 ) ) ( not ( = ?auto_795612 ?auto_795619 ) ) ( not ( = ?auto_795612 ?auto_795620 ) ) ( not ( = ?auto_795612 ?auto_795621 ) ) ( not ( = ?auto_795612 ?auto_795622 ) ) ( not ( = ?auto_795613 ?auto_795614 ) ) ( not ( = ?auto_795613 ?auto_795615 ) ) ( not ( = ?auto_795613 ?auto_795616 ) ) ( not ( = ?auto_795613 ?auto_795617 ) ) ( not ( = ?auto_795613 ?auto_795618 ) ) ( not ( = ?auto_795613 ?auto_795619 ) ) ( not ( = ?auto_795613 ?auto_795620 ) ) ( not ( = ?auto_795613 ?auto_795621 ) ) ( not ( = ?auto_795613 ?auto_795622 ) ) ( not ( = ?auto_795614 ?auto_795615 ) ) ( not ( = ?auto_795614 ?auto_795616 ) ) ( not ( = ?auto_795614 ?auto_795617 ) ) ( not ( = ?auto_795614 ?auto_795618 ) ) ( not ( = ?auto_795614 ?auto_795619 ) ) ( not ( = ?auto_795614 ?auto_795620 ) ) ( not ( = ?auto_795614 ?auto_795621 ) ) ( not ( = ?auto_795614 ?auto_795622 ) ) ( not ( = ?auto_795615 ?auto_795616 ) ) ( not ( = ?auto_795615 ?auto_795617 ) ) ( not ( = ?auto_795615 ?auto_795618 ) ) ( not ( = ?auto_795615 ?auto_795619 ) ) ( not ( = ?auto_795615 ?auto_795620 ) ) ( not ( = ?auto_795615 ?auto_795621 ) ) ( not ( = ?auto_795615 ?auto_795622 ) ) ( not ( = ?auto_795616 ?auto_795617 ) ) ( not ( = ?auto_795616 ?auto_795618 ) ) ( not ( = ?auto_795616 ?auto_795619 ) ) ( not ( = ?auto_795616 ?auto_795620 ) ) ( not ( = ?auto_795616 ?auto_795621 ) ) ( not ( = ?auto_795616 ?auto_795622 ) ) ( not ( = ?auto_795617 ?auto_795618 ) ) ( not ( = ?auto_795617 ?auto_795619 ) ) ( not ( = ?auto_795617 ?auto_795620 ) ) ( not ( = ?auto_795617 ?auto_795621 ) ) ( not ( = ?auto_795617 ?auto_795622 ) ) ( not ( = ?auto_795618 ?auto_795619 ) ) ( not ( = ?auto_795618 ?auto_795620 ) ) ( not ( = ?auto_795618 ?auto_795621 ) ) ( not ( = ?auto_795618 ?auto_795622 ) ) ( not ( = ?auto_795619 ?auto_795620 ) ) ( not ( = ?auto_795619 ?auto_795621 ) ) ( not ( = ?auto_795619 ?auto_795622 ) ) ( not ( = ?auto_795620 ?auto_795621 ) ) ( not ( = ?auto_795620 ?auto_795622 ) ) ( not ( = ?auto_795621 ?auto_795622 ) ) ( ON ?auto_795620 ?auto_795621 ) ( ON ?auto_795619 ?auto_795620 ) ( ON ?auto_795618 ?auto_795619 ) ( ON ?auto_795617 ?auto_795618 ) ( ON ?auto_795616 ?auto_795617 ) ( ON ?auto_795615 ?auto_795616 ) ( CLEAR ?auto_795613 ) ( ON ?auto_795614 ?auto_795615 ) ( CLEAR ?auto_795614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_795609 ?auto_795610 ?auto_795611 ?auto_795612 ?auto_795613 ?auto_795614 )
      ( MAKE-13PILE ?auto_795609 ?auto_795610 ?auto_795611 ?auto_795612 ?auto_795613 ?auto_795614 ?auto_795615 ?auto_795616 ?auto_795617 ?auto_795618 ?auto_795619 ?auto_795620 ?auto_795621 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_795663 - BLOCK
      ?auto_795664 - BLOCK
      ?auto_795665 - BLOCK
      ?auto_795666 - BLOCK
      ?auto_795667 - BLOCK
      ?auto_795668 - BLOCK
      ?auto_795669 - BLOCK
      ?auto_795670 - BLOCK
      ?auto_795671 - BLOCK
      ?auto_795672 - BLOCK
      ?auto_795673 - BLOCK
      ?auto_795674 - BLOCK
      ?auto_795675 - BLOCK
    )
    :vars
    (
      ?auto_795676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_795675 ?auto_795676 ) ( ON-TABLE ?auto_795663 ) ( ON ?auto_795664 ?auto_795663 ) ( ON ?auto_795665 ?auto_795664 ) ( ON ?auto_795666 ?auto_795665 ) ( not ( = ?auto_795663 ?auto_795664 ) ) ( not ( = ?auto_795663 ?auto_795665 ) ) ( not ( = ?auto_795663 ?auto_795666 ) ) ( not ( = ?auto_795663 ?auto_795667 ) ) ( not ( = ?auto_795663 ?auto_795668 ) ) ( not ( = ?auto_795663 ?auto_795669 ) ) ( not ( = ?auto_795663 ?auto_795670 ) ) ( not ( = ?auto_795663 ?auto_795671 ) ) ( not ( = ?auto_795663 ?auto_795672 ) ) ( not ( = ?auto_795663 ?auto_795673 ) ) ( not ( = ?auto_795663 ?auto_795674 ) ) ( not ( = ?auto_795663 ?auto_795675 ) ) ( not ( = ?auto_795663 ?auto_795676 ) ) ( not ( = ?auto_795664 ?auto_795665 ) ) ( not ( = ?auto_795664 ?auto_795666 ) ) ( not ( = ?auto_795664 ?auto_795667 ) ) ( not ( = ?auto_795664 ?auto_795668 ) ) ( not ( = ?auto_795664 ?auto_795669 ) ) ( not ( = ?auto_795664 ?auto_795670 ) ) ( not ( = ?auto_795664 ?auto_795671 ) ) ( not ( = ?auto_795664 ?auto_795672 ) ) ( not ( = ?auto_795664 ?auto_795673 ) ) ( not ( = ?auto_795664 ?auto_795674 ) ) ( not ( = ?auto_795664 ?auto_795675 ) ) ( not ( = ?auto_795664 ?auto_795676 ) ) ( not ( = ?auto_795665 ?auto_795666 ) ) ( not ( = ?auto_795665 ?auto_795667 ) ) ( not ( = ?auto_795665 ?auto_795668 ) ) ( not ( = ?auto_795665 ?auto_795669 ) ) ( not ( = ?auto_795665 ?auto_795670 ) ) ( not ( = ?auto_795665 ?auto_795671 ) ) ( not ( = ?auto_795665 ?auto_795672 ) ) ( not ( = ?auto_795665 ?auto_795673 ) ) ( not ( = ?auto_795665 ?auto_795674 ) ) ( not ( = ?auto_795665 ?auto_795675 ) ) ( not ( = ?auto_795665 ?auto_795676 ) ) ( not ( = ?auto_795666 ?auto_795667 ) ) ( not ( = ?auto_795666 ?auto_795668 ) ) ( not ( = ?auto_795666 ?auto_795669 ) ) ( not ( = ?auto_795666 ?auto_795670 ) ) ( not ( = ?auto_795666 ?auto_795671 ) ) ( not ( = ?auto_795666 ?auto_795672 ) ) ( not ( = ?auto_795666 ?auto_795673 ) ) ( not ( = ?auto_795666 ?auto_795674 ) ) ( not ( = ?auto_795666 ?auto_795675 ) ) ( not ( = ?auto_795666 ?auto_795676 ) ) ( not ( = ?auto_795667 ?auto_795668 ) ) ( not ( = ?auto_795667 ?auto_795669 ) ) ( not ( = ?auto_795667 ?auto_795670 ) ) ( not ( = ?auto_795667 ?auto_795671 ) ) ( not ( = ?auto_795667 ?auto_795672 ) ) ( not ( = ?auto_795667 ?auto_795673 ) ) ( not ( = ?auto_795667 ?auto_795674 ) ) ( not ( = ?auto_795667 ?auto_795675 ) ) ( not ( = ?auto_795667 ?auto_795676 ) ) ( not ( = ?auto_795668 ?auto_795669 ) ) ( not ( = ?auto_795668 ?auto_795670 ) ) ( not ( = ?auto_795668 ?auto_795671 ) ) ( not ( = ?auto_795668 ?auto_795672 ) ) ( not ( = ?auto_795668 ?auto_795673 ) ) ( not ( = ?auto_795668 ?auto_795674 ) ) ( not ( = ?auto_795668 ?auto_795675 ) ) ( not ( = ?auto_795668 ?auto_795676 ) ) ( not ( = ?auto_795669 ?auto_795670 ) ) ( not ( = ?auto_795669 ?auto_795671 ) ) ( not ( = ?auto_795669 ?auto_795672 ) ) ( not ( = ?auto_795669 ?auto_795673 ) ) ( not ( = ?auto_795669 ?auto_795674 ) ) ( not ( = ?auto_795669 ?auto_795675 ) ) ( not ( = ?auto_795669 ?auto_795676 ) ) ( not ( = ?auto_795670 ?auto_795671 ) ) ( not ( = ?auto_795670 ?auto_795672 ) ) ( not ( = ?auto_795670 ?auto_795673 ) ) ( not ( = ?auto_795670 ?auto_795674 ) ) ( not ( = ?auto_795670 ?auto_795675 ) ) ( not ( = ?auto_795670 ?auto_795676 ) ) ( not ( = ?auto_795671 ?auto_795672 ) ) ( not ( = ?auto_795671 ?auto_795673 ) ) ( not ( = ?auto_795671 ?auto_795674 ) ) ( not ( = ?auto_795671 ?auto_795675 ) ) ( not ( = ?auto_795671 ?auto_795676 ) ) ( not ( = ?auto_795672 ?auto_795673 ) ) ( not ( = ?auto_795672 ?auto_795674 ) ) ( not ( = ?auto_795672 ?auto_795675 ) ) ( not ( = ?auto_795672 ?auto_795676 ) ) ( not ( = ?auto_795673 ?auto_795674 ) ) ( not ( = ?auto_795673 ?auto_795675 ) ) ( not ( = ?auto_795673 ?auto_795676 ) ) ( not ( = ?auto_795674 ?auto_795675 ) ) ( not ( = ?auto_795674 ?auto_795676 ) ) ( not ( = ?auto_795675 ?auto_795676 ) ) ( ON ?auto_795674 ?auto_795675 ) ( ON ?auto_795673 ?auto_795674 ) ( ON ?auto_795672 ?auto_795673 ) ( ON ?auto_795671 ?auto_795672 ) ( ON ?auto_795670 ?auto_795671 ) ( ON ?auto_795669 ?auto_795670 ) ( ON ?auto_795668 ?auto_795669 ) ( CLEAR ?auto_795666 ) ( ON ?auto_795667 ?auto_795668 ) ( CLEAR ?auto_795667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_795663 ?auto_795664 ?auto_795665 ?auto_795666 ?auto_795667 )
      ( MAKE-13PILE ?auto_795663 ?auto_795664 ?auto_795665 ?auto_795666 ?auto_795667 ?auto_795668 ?auto_795669 ?auto_795670 ?auto_795671 ?auto_795672 ?auto_795673 ?auto_795674 ?auto_795675 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_795717 - BLOCK
      ?auto_795718 - BLOCK
      ?auto_795719 - BLOCK
      ?auto_795720 - BLOCK
      ?auto_795721 - BLOCK
      ?auto_795722 - BLOCK
      ?auto_795723 - BLOCK
      ?auto_795724 - BLOCK
      ?auto_795725 - BLOCK
      ?auto_795726 - BLOCK
      ?auto_795727 - BLOCK
      ?auto_795728 - BLOCK
      ?auto_795729 - BLOCK
    )
    :vars
    (
      ?auto_795730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_795729 ?auto_795730 ) ( ON-TABLE ?auto_795717 ) ( ON ?auto_795718 ?auto_795717 ) ( ON ?auto_795719 ?auto_795718 ) ( not ( = ?auto_795717 ?auto_795718 ) ) ( not ( = ?auto_795717 ?auto_795719 ) ) ( not ( = ?auto_795717 ?auto_795720 ) ) ( not ( = ?auto_795717 ?auto_795721 ) ) ( not ( = ?auto_795717 ?auto_795722 ) ) ( not ( = ?auto_795717 ?auto_795723 ) ) ( not ( = ?auto_795717 ?auto_795724 ) ) ( not ( = ?auto_795717 ?auto_795725 ) ) ( not ( = ?auto_795717 ?auto_795726 ) ) ( not ( = ?auto_795717 ?auto_795727 ) ) ( not ( = ?auto_795717 ?auto_795728 ) ) ( not ( = ?auto_795717 ?auto_795729 ) ) ( not ( = ?auto_795717 ?auto_795730 ) ) ( not ( = ?auto_795718 ?auto_795719 ) ) ( not ( = ?auto_795718 ?auto_795720 ) ) ( not ( = ?auto_795718 ?auto_795721 ) ) ( not ( = ?auto_795718 ?auto_795722 ) ) ( not ( = ?auto_795718 ?auto_795723 ) ) ( not ( = ?auto_795718 ?auto_795724 ) ) ( not ( = ?auto_795718 ?auto_795725 ) ) ( not ( = ?auto_795718 ?auto_795726 ) ) ( not ( = ?auto_795718 ?auto_795727 ) ) ( not ( = ?auto_795718 ?auto_795728 ) ) ( not ( = ?auto_795718 ?auto_795729 ) ) ( not ( = ?auto_795718 ?auto_795730 ) ) ( not ( = ?auto_795719 ?auto_795720 ) ) ( not ( = ?auto_795719 ?auto_795721 ) ) ( not ( = ?auto_795719 ?auto_795722 ) ) ( not ( = ?auto_795719 ?auto_795723 ) ) ( not ( = ?auto_795719 ?auto_795724 ) ) ( not ( = ?auto_795719 ?auto_795725 ) ) ( not ( = ?auto_795719 ?auto_795726 ) ) ( not ( = ?auto_795719 ?auto_795727 ) ) ( not ( = ?auto_795719 ?auto_795728 ) ) ( not ( = ?auto_795719 ?auto_795729 ) ) ( not ( = ?auto_795719 ?auto_795730 ) ) ( not ( = ?auto_795720 ?auto_795721 ) ) ( not ( = ?auto_795720 ?auto_795722 ) ) ( not ( = ?auto_795720 ?auto_795723 ) ) ( not ( = ?auto_795720 ?auto_795724 ) ) ( not ( = ?auto_795720 ?auto_795725 ) ) ( not ( = ?auto_795720 ?auto_795726 ) ) ( not ( = ?auto_795720 ?auto_795727 ) ) ( not ( = ?auto_795720 ?auto_795728 ) ) ( not ( = ?auto_795720 ?auto_795729 ) ) ( not ( = ?auto_795720 ?auto_795730 ) ) ( not ( = ?auto_795721 ?auto_795722 ) ) ( not ( = ?auto_795721 ?auto_795723 ) ) ( not ( = ?auto_795721 ?auto_795724 ) ) ( not ( = ?auto_795721 ?auto_795725 ) ) ( not ( = ?auto_795721 ?auto_795726 ) ) ( not ( = ?auto_795721 ?auto_795727 ) ) ( not ( = ?auto_795721 ?auto_795728 ) ) ( not ( = ?auto_795721 ?auto_795729 ) ) ( not ( = ?auto_795721 ?auto_795730 ) ) ( not ( = ?auto_795722 ?auto_795723 ) ) ( not ( = ?auto_795722 ?auto_795724 ) ) ( not ( = ?auto_795722 ?auto_795725 ) ) ( not ( = ?auto_795722 ?auto_795726 ) ) ( not ( = ?auto_795722 ?auto_795727 ) ) ( not ( = ?auto_795722 ?auto_795728 ) ) ( not ( = ?auto_795722 ?auto_795729 ) ) ( not ( = ?auto_795722 ?auto_795730 ) ) ( not ( = ?auto_795723 ?auto_795724 ) ) ( not ( = ?auto_795723 ?auto_795725 ) ) ( not ( = ?auto_795723 ?auto_795726 ) ) ( not ( = ?auto_795723 ?auto_795727 ) ) ( not ( = ?auto_795723 ?auto_795728 ) ) ( not ( = ?auto_795723 ?auto_795729 ) ) ( not ( = ?auto_795723 ?auto_795730 ) ) ( not ( = ?auto_795724 ?auto_795725 ) ) ( not ( = ?auto_795724 ?auto_795726 ) ) ( not ( = ?auto_795724 ?auto_795727 ) ) ( not ( = ?auto_795724 ?auto_795728 ) ) ( not ( = ?auto_795724 ?auto_795729 ) ) ( not ( = ?auto_795724 ?auto_795730 ) ) ( not ( = ?auto_795725 ?auto_795726 ) ) ( not ( = ?auto_795725 ?auto_795727 ) ) ( not ( = ?auto_795725 ?auto_795728 ) ) ( not ( = ?auto_795725 ?auto_795729 ) ) ( not ( = ?auto_795725 ?auto_795730 ) ) ( not ( = ?auto_795726 ?auto_795727 ) ) ( not ( = ?auto_795726 ?auto_795728 ) ) ( not ( = ?auto_795726 ?auto_795729 ) ) ( not ( = ?auto_795726 ?auto_795730 ) ) ( not ( = ?auto_795727 ?auto_795728 ) ) ( not ( = ?auto_795727 ?auto_795729 ) ) ( not ( = ?auto_795727 ?auto_795730 ) ) ( not ( = ?auto_795728 ?auto_795729 ) ) ( not ( = ?auto_795728 ?auto_795730 ) ) ( not ( = ?auto_795729 ?auto_795730 ) ) ( ON ?auto_795728 ?auto_795729 ) ( ON ?auto_795727 ?auto_795728 ) ( ON ?auto_795726 ?auto_795727 ) ( ON ?auto_795725 ?auto_795726 ) ( ON ?auto_795724 ?auto_795725 ) ( ON ?auto_795723 ?auto_795724 ) ( ON ?auto_795722 ?auto_795723 ) ( ON ?auto_795721 ?auto_795722 ) ( CLEAR ?auto_795719 ) ( ON ?auto_795720 ?auto_795721 ) ( CLEAR ?auto_795720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_795717 ?auto_795718 ?auto_795719 ?auto_795720 )
      ( MAKE-13PILE ?auto_795717 ?auto_795718 ?auto_795719 ?auto_795720 ?auto_795721 ?auto_795722 ?auto_795723 ?auto_795724 ?auto_795725 ?auto_795726 ?auto_795727 ?auto_795728 ?auto_795729 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_795771 - BLOCK
      ?auto_795772 - BLOCK
      ?auto_795773 - BLOCK
      ?auto_795774 - BLOCK
      ?auto_795775 - BLOCK
      ?auto_795776 - BLOCK
      ?auto_795777 - BLOCK
      ?auto_795778 - BLOCK
      ?auto_795779 - BLOCK
      ?auto_795780 - BLOCK
      ?auto_795781 - BLOCK
      ?auto_795782 - BLOCK
      ?auto_795783 - BLOCK
    )
    :vars
    (
      ?auto_795784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_795783 ?auto_795784 ) ( ON-TABLE ?auto_795771 ) ( ON ?auto_795772 ?auto_795771 ) ( not ( = ?auto_795771 ?auto_795772 ) ) ( not ( = ?auto_795771 ?auto_795773 ) ) ( not ( = ?auto_795771 ?auto_795774 ) ) ( not ( = ?auto_795771 ?auto_795775 ) ) ( not ( = ?auto_795771 ?auto_795776 ) ) ( not ( = ?auto_795771 ?auto_795777 ) ) ( not ( = ?auto_795771 ?auto_795778 ) ) ( not ( = ?auto_795771 ?auto_795779 ) ) ( not ( = ?auto_795771 ?auto_795780 ) ) ( not ( = ?auto_795771 ?auto_795781 ) ) ( not ( = ?auto_795771 ?auto_795782 ) ) ( not ( = ?auto_795771 ?auto_795783 ) ) ( not ( = ?auto_795771 ?auto_795784 ) ) ( not ( = ?auto_795772 ?auto_795773 ) ) ( not ( = ?auto_795772 ?auto_795774 ) ) ( not ( = ?auto_795772 ?auto_795775 ) ) ( not ( = ?auto_795772 ?auto_795776 ) ) ( not ( = ?auto_795772 ?auto_795777 ) ) ( not ( = ?auto_795772 ?auto_795778 ) ) ( not ( = ?auto_795772 ?auto_795779 ) ) ( not ( = ?auto_795772 ?auto_795780 ) ) ( not ( = ?auto_795772 ?auto_795781 ) ) ( not ( = ?auto_795772 ?auto_795782 ) ) ( not ( = ?auto_795772 ?auto_795783 ) ) ( not ( = ?auto_795772 ?auto_795784 ) ) ( not ( = ?auto_795773 ?auto_795774 ) ) ( not ( = ?auto_795773 ?auto_795775 ) ) ( not ( = ?auto_795773 ?auto_795776 ) ) ( not ( = ?auto_795773 ?auto_795777 ) ) ( not ( = ?auto_795773 ?auto_795778 ) ) ( not ( = ?auto_795773 ?auto_795779 ) ) ( not ( = ?auto_795773 ?auto_795780 ) ) ( not ( = ?auto_795773 ?auto_795781 ) ) ( not ( = ?auto_795773 ?auto_795782 ) ) ( not ( = ?auto_795773 ?auto_795783 ) ) ( not ( = ?auto_795773 ?auto_795784 ) ) ( not ( = ?auto_795774 ?auto_795775 ) ) ( not ( = ?auto_795774 ?auto_795776 ) ) ( not ( = ?auto_795774 ?auto_795777 ) ) ( not ( = ?auto_795774 ?auto_795778 ) ) ( not ( = ?auto_795774 ?auto_795779 ) ) ( not ( = ?auto_795774 ?auto_795780 ) ) ( not ( = ?auto_795774 ?auto_795781 ) ) ( not ( = ?auto_795774 ?auto_795782 ) ) ( not ( = ?auto_795774 ?auto_795783 ) ) ( not ( = ?auto_795774 ?auto_795784 ) ) ( not ( = ?auto_795775 ?auto_795776 ) ) ( not ( = ?auto_795775 ?auto_795777 ) ) ( not ( = ?auto_795775 ?auto_795778 ) ) ( not ( = ?auto_795775 ?auto_795779 ) ) ( not ( = ?auto_795775 ?auto_795780 ) ) ( not ( = ?auto_795775 ?auto_795781 ) ) ( not ( = ?auto_795775 ?auto_795782 ) ) ( not ( = ?auto_795775 ?auto_795783 ) ) ( not ( = ?auto_795775 ?auto_795784 ) ) ( not ( = ?auto_795776 ?auto_795777 ) ) ( not ( = ?auto_795776 ?auto_795778 ) ) ( not ( = ?auto_795776 ?auto_795779 ) ) ( not ( = ?auto_795776 ?auto_795780 ) ) ( not ( = ?auto_795776 ?auto_795781 ) ) ( not ( = ?auto_795776 ?auto_795782 ) ) ( not ( = ?auto_795776 ?auto_795783 ) ) ( not ( = ?auto_795776 ?auto_795784 ) ) ( not ( = ?auto_795777 ?auto_795778 ) ) ( not ( = ?auto_795777 ?auto_795779 ) ) ( not ( = ?auto_795777 ?auto_795780 ) ) ( not ( = ?auto_795777 ?auto_795781 ) ) ( not ( = ?auto_795777 ?auto_795782 ) ) ( not ( = ?auto_795777 ?auto_795783 ) ) ( not ( = ?auto_795777 ?auto_795784 ) ) ( not ( = ?auto_795778 ?auto_795779 ) ) ( not ( = ?auto_795778 ?auto_795780 ) ) ( not ( = ?auto_795778 ?auto_795781 ) ) ( not ( = ?auto_795778 ?auto_795782 ) ) ( not ( = ?auto_795778 ?auto_795783 ) ) ( not ( = ?auto_795778 ?auto_795784 ) ) ( not ( = ?auto_795779 ?auto_795780 ) ) ( not ( = ?auto_795779 ?auto_795781 ) ) ( not ( = ?auto_795779 ?auto_795782 ) ) ( not ( = ?auto_795779 ?auto_795783 ) ) ( not ( = ?auto_795779 ?auto_795784 ) ) ( not ( = ?auto_795780 ?auto_795781 ) ) ( not ( = ?auto_795780 ?auto_795782 ) ) ( not ( = ?auto_795780 ?auto_795783 ) ) ( not ( = ?auto_795780 ?auto_795784 ) ) ( not ( = ?auto_795781 ?auto_795782 ) ) ( not ( = ?auto_795781 ?auto_795783 ) ) ( not ( = ?auto_795781 ?auto_795784 ) ) ( not ( = ?auto_795782 ?auto_795783 ) ) ( not ( = ?auto_795782 ?auto_795784 ) ) ( not ( = ?auto_795783 ?auto_795784 ) ) ( ON ?auto_795782 ?auto_795783 ) ( ON ?auto_795781 ?auto_795782 ) ( ON ?auto_795780 ?auto_795781 ) ( ON ?auto_795779 ?auto_795780 ) ( ON ?auto_795778 ?auto_795779 ) ( ON ?auto_795777 ?auto_795778 ) ( ON ?auto_795776 ?auto_795777 ) ( ON ?auto_795775 ?auto_795776 ) ( ON ?auto_795774 ?auto_795775 ) ( CLEAR ?auto_795772 ) ( ON ?auto_795773 ?auto_795774 ) ( CLEAR ?auto_795773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_795771 ?auto_795772 ?auto_795773 )
      ( MAKE-13PILE ?auto_795771 ?auto_795772 ?auto_795773 ?auto_795774 ?auto_795775 ?auto_795776 ?auto_795777 ?auto_795778 ?auto_795779 ?auto_795780 ?auto_795781 ?auto_795782 ?auto_795783 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_795825 - BLOCK
      ?auto_795826 - BLOCK
      ?auto_795827 - BLOCK
      ?auto_795828 - BLOCK
      ?auto_795829 - BLOCK
      ?auto_795830 - BLOCK
      ?auto_795831 - BLOCK
      ?auto_795832 - BLOCK
      ?auto_795833 - BLOCK
      ?auto_795834 - BLOCK
      ?auto_795835 - BLOCK
      ?auto_795836 - BLOCK
      ?auto_795837 - BLOCK
    )
    :vars
    (
      ?auto_795838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_795837 ?auto_795838 ) ( ON-TABLE ?auto_795825 ) ( not ( = ?auto_795825 ?auto_795826 ) ) ( not ( = ?auto_795825 ?auto_795827 ) ) ( not ( = ?auto_795825 ?auto_795828 ) ) ( not ( = ?auto_795825 ?auto_795829 ) ) ( not ( = ?auto_795825 ?auto_795830 ) ) ( not ( = ?auto_795825 ?auto_795831 ) ) ( not ( = ?auto_795825 ?auto_795832 ) ) ( not ( = ?auto_795825 ?auto_795833 ) ) ( not ( = ?auto_795825 ?auto_795834 ) ) ( not ( = ?auto_795825 ?auto_795835 ) ) ( not ( = ?auto_795825 ?auto_795836 ) ) ( not ( = ?auto_795825 ?auto_795837 ) ) ( not ( = ?auto_795825 ?auto_795838 ) ) ( not ( = ?auto_795826 ?auto_795827 ) ) ( not ( = ?auto_795826 ?auto_795828 ) ) ( not ( = ?auto_795826 ?auto_795829 ) ) ( not ( = ?auto_795826 ?auto_795830 ) ) ( not ( = ?auto_795826 ?auto_795831 ) ) ( not ( = ?auto_795826 ?auto_795832 ) ) ( not ( = ?auto_795826 ?auto_795833 ) ) ( not ( = ?auto_795826 ?auto_795834 ) ) ( not ( = ?auto_795826 ?auto_795835 ) ) ( not ( = ?auto_795826 ?auto_795836 ) ) ( not ( = ?auto_795826 ?auto_795837 ) ) ( not ( = ?auto_795826 ?auto_795838 ) ) ( not ( = ?auto_795827 ?auto_795828 ) ) ( not ( = ?auto_795827 ?auto_795829 ) ) ( not ( = ?auto_795827 ?auto_795830 ) ) ( not ( = ?auto_795827 ?auto_795831 ) ) ( not ( = ?auto_795827 ?auto_795832 ) ) ( not ( = ?auto_795827 ?auto_795833 ) ) ( not ( = ?auto_795827 ?auto_795834 ) ) ( not ( = ?auto_795827 ?auto_795835 ) ) ( not ( = ?auto_795827 ?auto_795836 ) ) ( not ( = ?auto_795827 ?auto_795837 ) ) ( not ( = ?auto_795827 ?auto_795838 ) ) ( not ( = ?auto_795828 ?auto_795829 ) ) ( not ( = ?auto_795828 ?auto_795830 ) ) ( not ( = ?auto_795828 ?auto_795831 ) ) ( not ( = ?auto_795828 ?auto_795832 ) ) ( not ( = ?auto_795828 ?auto_795833 ) ) ( not ( = ?auto_795828 ?auto_795834 ) ) ( not ( = ?auto_795828 ?auto_795835 ) ) ( not ( = ?auto_795828 ?auto_795836 ) ) ( not ( = ?auto_795828 ?auto_795837 ) ) ( not ( = ?auto_795828 ?auto_795838 ) ) ( not ( = ?auto_795829 ?auto_795830 ) ) ( not ( = ?auto_795829 ?auto_795831 ) ) ( not ( = ?auto_795829 ?auto_795832 ) ) ( not ( = ?auto_795829 ?auto_795833 ) ) ( not ( = ?auto_795829 ?auto_795834 ) ) ( not ( = ?auto_795829 ?auto_795835 ) ) ( not ( = ?auto_795829 ?auto_795836 ) ) ( not ( = ?auto_795829 ?auto_795837 ) ) ( not ( = ?auto_795829 ?auto_795838 ) ) ( not ( = ?auto_795830 ?auto_795831 ) ) ( not ( = ?auto_795830 ?auto_795832 ) ) ( not ( = ?auto_795830 ?auto_795833 ) ) ( not ( = ?auto_795830 ?auto_795834 ) ) ( not ( = ?auto_795830 ?auto_795835 ) ) ( not ( = ?auto_795830 ?auto_795836 ) ) ( not ( = ?auto_795830 ?auto_795837 ) ) ( not ( = ?auto_795830 ?auto_795838 ) ) ( not ( = ?auto_795831 ?auto_795832 ) ) ( not ( = ?auto_795831 ?auto_795833 ) ) ( not ( = ?auto_795831 ?auto_795834 ) ) ( not ( = ?auto_795831 ?auto_795835 ) ) ( not ( = ?auto_795831 ?auto_795836 ) ) ( not ( = ?auto_795831 ?auto_795837 ) ) ( not ( = ?auto_795831 ?auto_795838 ) ) ( not ( = ?auto_795832 ?auto_795833 ) ) ( not ( = ?auto_795832 ?auto_795834 ) ) ( not ( = ?auto_795832 ?auto_795835 ) ) ( not ( = ?auto_795832 ?auto_795836 ) ) ( not ( = ?auto_795832 ?auto_795837 ) ) ( not ( = ?auto_795832 ?auto_795838 ) ) ( not ( = ?auto_795833 ?auto_795834 ) ) ( not ( = ?auto_795833 ?auto_795835 ) ) ( not ( = ?auto_795833 ?auto_795836 ) ) ( not ( = ?auto_795833 ?auto_795837 ) ) ( not ( = ?auto_795833 ?auto_795838 ) ) ( not ( = ?auto_795834 ?auto_795835 ) ) ( not ( = ?auto_795834 ?auto_795836 ) ) ( not ( = ?auto_795834 ?auto_795837 ) ) ( not ( = ?auto_795834 ?auto_795838 ) ) ( not ( = ?auto_795835 ?auto_795836 ) ) ( not ( = ?auto_795835 ?auto_795837 ) ) ( not ( = ?auto_795835 ?auto_795838 ) ) ( not ( = ?auto_795836 ?auto_795837 ) ) ( not ( = ?auto_795836 ?auto_795838 ) ) ( not ( = ?auto_795837 ?auto_795838 ) ) ( ON ?auto_795836 ?auto_795837 ) ( ON ?auto_795835 ?auto_795836 ) ( ON ?auto_795834 ?auto_795835 ) ( ON ?auto_795833 ?auto_795834 ) ( ON ?auto_795832 ?auto_795833 ) ( ON ?auto_795831 ?auto_795832 ) ( ON ?auto_795830 ?auto_795831 ) ( ON ?auto_795829 ?auto_795830 ) ( ON ?auto_795828 ?auto_795829 ) ( ON ?auto_795827 ?auto_795828 ) ( CLEAR ?auto_795825 ) ( ON ?auto_795826 ?auto_795827 ) ( CLEAR ?auto_795826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_795825 ?auto_795826 )
      ( MAKE-13PILE ?auto_795825 ?auto_795826 ?auto_795827 ?auto_795828 ?auto_795829 ?auto_795830 ?auto_795831 ?auto_795832 ?auto_795833 ?auto_795834 ?auto_795835 ?auto_795836 ?auto_795837 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_795879 - BLOCK
      ?auto_795880 - BLOCK
      ?auto_795881 - BLOCK
      ?auto_795882 - BLOCK
      ?auto_795883 - BLOCK
      ?auto_795884 - BLOCK
      ?auto_795885 - BLOCK
      ?auto_795886 - BLOCK
      ?auto_795887 - BLOCK
      ?auto_795888 - BLOCK
      ?auto_795889 - BLOCK
      ?auto_795890 - BLOCK
      ?auto_795891 - BLOCK
    )
    :vars
    (
      ?auto_795892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_795891 ?auto_795892 ) ( not ( = ?auto_795879 ?auto_795880 ) ) ( not ( = ?auto_795879 ?auto_795881 ) ) ( not ( = ?auto_795879 ?auto_795882 ) ) ( not ( = ?auto_795879 ?auto_795883 ) ) ( not ( = ?auto_795879 ?auto_795884 ) ) ( not ( = ?auto_795879 ?auto_795885 ) ) ( not ( = ?auto_795879 ?auto_795886 ) ) ( not ( = ?auto_795879 ?auto_795887 ) ) ( not ( = ?auto_795879 ?auto_795888 ) ) ( not ( = ?auto_795879 ?auto_795889 ) ) ( not ( = ?auto_795879 ?auto_795890 ) ) ( not ( = ?auto_795879 ?auto_795891 ) ) ( not ( = ?auto_795879 ?auto_795892 ) ) ( not ( = ?auto_795880 ?auto_795881 ) ) ( not ( = ?auto_795880 ?auto_795882 ) ) ( not ( = ?auto_795880 ?auto_795883 ) ) ( not ( = ?auto_795880 ?auto_795884 ) ) ( not ( = ?auto_795880 ?auto_795885 ) ) ( not ( = ?auto_795880 ?auto_795886 ) ) ( not ( = ?auto_795880 ?auto_795887 ) ) ( not ( = ?auto_795880 ?auto_795888 ) ) ( not ( = ?auto_795880 ?auto_795889 ) ) ( not ( = ?auto_795880 ?auto_795890 ) ) ( not ( = ?auto_795880 ?auto_795891 ) ) ( not ( = ?auto_795880 ?auto_795892 ) ) ( not ( = ?auto_795881 ?auto_795882 ) ) ( not ( = ?auto_795881 ?auto_795883 ) ) ( not ( = ?auto_795881 ?auto_795884 ) ) ( not ( = ?auto_795881 ?auto_795885 ) ) ( not ( = ?auto_795881 ?auto_795886 ) ) ( not ( = ?auto_795881 ?auto_795887 ) ) ( not ( = ?auto_795881 ?auto_795888 ) ) ( not ( = ?auto_795881 ?auto_795889 ) ) ( not ( = ?auto_795881 ?auto_795890 ) ) ( not ( = ?auto_795881 ?auto_795891 ) ) ( not ( = ?auto_795881 ?auto_795892 ) ) ( not ( = ?auto_795882 ?auto_795883 ) ) ( not ( = ?auto_795882 ?auto_795884 ) ) ( not ( = ?auto_795882 ?auto_795885 ) ) ( not ( = ?auto_795882 ?auto_795886 ) ) ( not ( = ?auto_795882 ?auto_795887 ) ) ( not ( = ?auto_795882 ?auto_795888 ) ) ( not ( = ?auto_795882 ?auto_795889 ) ) ( not ( = ?auto_795882 ?auto_795890 ) ) ( not ( = ?auto_795882 ?auto_795891 ) ) ( not ( = ?auto_795882 ?auto_795892 ) ) ( not ( = ?auto_795883 ?auto_795884 ) ) ( not ( = ?auto_795883 ?auto_795885 ) ) ( not ( = ?auto_795883 ?auto_795886 ) ) ( not ( = ?auto_795883 ?auto_795887 ) ) ( not ( = ?auto_795883 ?auto_795888 ) ) ( not ( = ?auto_795883 ?auto_795889 ) ) ( not ( = ?auto_795883 ?auto_795890 ) ) ( not ( = ?auto_795883 ?auto_795891 ) ) ( not ( = ?auto_795883 ?auto_795892 ) ) ( not ( = ?auto_795884 ?auto_795885 ) ) ( not ( = ?auto_795884 ?auto_795886 ) ) ( not ( = ?auto_795884 ?auto_795887 ) ) ( not ( = ?auto_795884 ?auto_795888 ) ) ( not ( = ?auto_795884 ?auto_795889 ) ) ( not ( = ?auto_795884 ?auto_795890 ) ) ( not ( = ?auto_795884 ?auto_795891 ) ) ( not ( = ?auto_795884 ?auto_795892 ) ) ( not ( = ?auto_795885 ?auto_795886 ) ) ( not ( = ?auto_795885 ?auto_795887 ) ) ( not ( = ?auto_795885 ?auto_795888 ) ) ( not ( = ?auto_795885 ?auto_795889 ) ) ( not ( = ?auto_795885 ?auto_795890 ) ) ( not ( = ?auto_795885 ?auto_795891 ) ) ( not ( = ?auto_795885 ?auto_795892 ) ) ( not ( = ?auto_795886 ?auto_795887 ) ) ( not ( = ?auto_795886 ?auto_795888 ) ) ( not ( = ?auto_795886 ?auto_795889 ) ) ( not ( = ?auto_795886 ?auto_795890 ) ) ( not ( = ?auto_795886 ?auto_795891 ) ) ( not ( = ?auto_795886 ?auto_795892 ) ) ( not ( = ?auto_795887 ?auto_795888 ) ) ( not ( = ?auto_795887 ?auto_795889 ) ) ( not ( = ?auto_795887 ?auto_795890 ) ) ( not ( = ?auto_795887 ?auto_795891 ) ) ( not ( = ?auto_795887 ?auto_795892 ) ) ( not ( = ?auto_795888 ?auto_795889 ) ) ( not ( = ?auto_795888 ?auto_795890 ) ) ( not ( = ?auto_795888 ?auto_795891 ) ) ( not ( = ?auto_795888 ?auto_795892 ) ) ( not ( = ?auto_795889 ?auto_795890 ) ) ( not ( = ?auto_795889 ?auto_795891 ) ) ( not ( = ?auto_795889 ?auto_795892 ) ) ( not ( = ?auto_795890 ?auto_795891 ) ) ( not ( = ?auto_795890 ?auto_795892 ) ) ( not ( = ?auto_795891 ?auto_795892 ) ) ( ON ?auto_795890 ?auto_795891 ) ( ON ?auto_795889 ?auto_795890 ) ( ON ?auto_795888 ?auto_795889 ) ( ON ?auto_795887 ?auto_795888 ) ( ON ?auto_795886 ?auto_795887 ) ( ON ?auto_795885 ?auto_795886 ) ( ON ?auto_795884 ?auto_795885 ) ( ON ?auto_795883 ?auto_795884 ) ( ON ?auto_795882 ?auto_795883 ) ( ON ?auto_795881 ?auto_795882 ) ( ON ?auto_795880 ?auto_795881 ) ( ON ?auto_795879 ?auto_795880 ) ( CLEAR ?auto_795879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_795879 )
      ( MAKE-13PILE ?auto_795879 ?auto_795880 ?auto_795881 ?auto_795882 ?auto_795883 ?auto_795884 ?auto_795885 ?auto_795886 ?auto_795887 ?auto_795888 ?auto_795889 ?auto_795890 ?auto_795891 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_795934 - BLOCK
      ?auto_795935 - BLOCK
      ?auto_795936 - BLOCK
      ?auto_795937 - BLOCK
      ?auto_795938 - BLOCK
      ?auto_795939 - BLOCK
      ?auto_795940 - BLOCK
      ?auto_795941 - BLOCK
      ?auto_795942 - BLOCK
      ?auto_795943 - BLOCK
      ?auto_795944 - BLOCK
      ?auto_795945 - BLOCK
      ?auto_795946 - BLOCK
      ?auto_795947 - BLOCK
    )
    :vars
    (
      ?auto_795948 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_795946 ) ( ON ?auto_795947 ?auto_795948 ) ( CLEAR ?auto_795947 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_795934 ) ( ON ?auto_795935 ?auto_795934 ) ( ON ?auto_795936 ?auto_795935 ) ( ON ?auto_795937 ?auto_795936 ) ( ON ?auto_795938 ?auto_795937 ) ( ON ?auto_795939 ?auto_795938 ) ( ON ?auto_795940 ?auto_795939 ) ( ON ?auto_795941 ?auto_795940 ) ( ON ?auto_795942 ?auto_795941 ) ( ON ?auto_795943 ?auto_795942 ) ( ON ?auto_795944 ?auto_795943 ) ( ON ?auto_795945 ?auto_795944 ) ( ON ?auto_795946 ?auto_795945 ) ( not ( = ?auto_795934 ?auto_795935 ) ) ( not ( = ?auto_795934 ?auto_795936 ) ) ( not ( = ?auto_795934 ?auto_795937 ) ) ( not ( = ?auto_795934 ?auto_795938 ) ) ( not ( = ?auto_795934 ?auto_795939 ) ) ( not ( = ?auto_795934 ?auto_795940 ) ) ( not ( = ?auto_795934 ?auto_795941 ) ) ( not ( = ?auto_795934 ?auto_795942 ) ) ( not ( = ?auto_795934 ?auto_795943 ) ) ( not ( = ?auto_795934 ?auto_795944 ) ) ( not ( = ?auto_795934 ?auto_795945 ) ) ( not ( = ?auto_795934 ?auto_795946 ) ) ( not ( = ?auto_795934 ?auto_795947 ) ) ( not ( = ?auto_795934 ?auto_795948 ) ) ( not ( = ?auto_795935 ?auto_795936 ) ) ( not ( = ?auto_795935 ?auto_795937 ) ) ( not ( = ?auto_795935 ?auto_795938 ) ) ( not ( = ?auto_795935 ?auto_795939 ) ) ( not ( = ?auto_795935 ?auto_795940 ) ) ( not ( = ?auto_795935 ?auto_795941 ) ) ( not ( = ?auto_795935 ?auto_795942 ) ) ( not ( = ?auto_795935 ?auto_795943 ) ) ( not ( = ?auto_795935 ?auto_795944 ) ) ( not ( = ?auto_795935 ?auto_795945 ) ) ( not ( = ?auto_795935 ?auto_795946 ) ) ( not ( = ?auto_795935 ?auto_795947 ) ) ( not ( = ?auto_795935 ?auto_795948 ) ) ( not ( = ?auto_795936 ?auto_795937 ) ) ( not ( = ?auto_795936 ?auto_795938 ) ) ( not ( = ?auto_795936 ?auto_795939 ) ) ( not ( = ?auto_795936 ?auto_795940 ) ) ( not ( = ?auto_795936 ?auto_795941 ) ) ( not ( = ?auto_795936 ?auto_795942 ) ) ( not ( = ?auto_795936 ?auto_795943 ) ) ( not ( = ?auto_795936 ?auto_795944 ) ) ( not ( = ?auto_795936 ?auto_795945 ) ) ( not ( = ?auto_795936 ?auto_795946 ) ) ( not ( = ?auto_795936 ?auto_795947 ) ) ( not ( = ?auto_795936 ?auto_795948 ) ) ( not ( = ?auto_795937 ?auto_795938 ) ) ( not ( = ?auto_795937 ?auto_795939 ) ) ( not ( = ?auto_795937 ?auto_795940 ) ) ( not ( = ?auto_795937 ?auto_795941 ) ) ( not ( = ?auto_795937 ?auto_795942 ) ) ( not ( = ?auto_795937 ?auto_795943 ) ) ( not ( = ?auto_795937 ?auto_795944 ) ) ( not ( = ?auto_795937 ?auto_795945 ) ) ( not ( = ?auto_795937 ?auto_795946 ) ) ( not ( = ?auto_795937 ?auto_795947 ) ) ( not ( = ?auto_795937 ?auto_795948 ) ) ( not ( = ?auto_795938 ?auto_795939 ) ) ( not ( = ?auto_795938 ?auto_795940 ) ) ( not ( = ?auto_795938 ?auto_795941 ) ) ( not ( = ?auto_795938 ?auto_795942 ) ) ( not ( = ?auto_795938 ?auto_795943 ) ) ( not ( = ?auto_795938 ?auto_795944 ) ) ( not ( = ?auto_795938 ?auto_795945 ) ) ( not ( = ?auto_795938 ?auto_795946 ) ) ( not ( = ?auto_795938 ?auto_795947 ) ) ( not ( = ?auto_795938 ?auto_795948 ) ) ( not ( = ?auto_795939 ?auto_795940 ) ) ( not ( = ?auto_795939 ?auto_795941 ) ) ( not ( = ?auto_795939 ?auto_795942 ) ) ( not ( = ?auto_795939 ?auto_795943 ) ) ( not ( = ?auto_795939 ?auto_795944 ) ) ( not ( = ?auto_795939 ?auto_795945 ) ) ( not ( = ?auto_795939 ?auto_795946 ) ) ( not ( = ?auto_795939 ?auto_795947 ) ) ( not ( = ?auto_795939 ?auto_795948 ) ) ( not ( = ?auto_795940 ?auto_795941 ) ) ( not ( = ?auto_795940 ?auto_795942 ) ) ( not ( = ?auto_795940 ?auto_795943 ) ) ( not ( = ?auto_795940 ?auto_795944 ) ) ( not ( = ?auto_795940 ?auto_795945 ) ) ( not ( = ?auto_795940 ?auto_795946 ) ) ( not ( = ?auto_795940 ?auto_795947 ) ) ( not ( = ?auto_795940 ?auto_795948 ) ) ( not ( = ?auto_795941 ?auto_795942 ) ) ( not ( = ?auto_795941 ?auto_795943 ) ) ( not ( = ?auto_795941 ?auto_795944 ) ) ( not ( = ?auto_795941 ?auto_795945 ) ) ( not ( = ?auto_795941 ?auto_795946 ) ) ( not ( = ?auto_795941 ?auto_795947 ) ) ( not ( = ?auto_795941 ?auto_795948 ) ) ( not ( = ?auto_795942 ?auto_795943 ) ) ( not ( = ?auto_795942 ?auto_795944 ) ) ( not ( = ?auto_795942 ?auto_795945 ) ) ( not ( = ?auto_795942 ?auto_795946 ) ) ( not ( = ?auto_795942 ?auto_795947 ) ) ( not ( = ?auto_795942 ?auto_795948 ) ) ( not ( = ?auto_795943 ?auto_795944 ) ) ( not ( = ?auto_795943 ?auto_795945 ) ) ( not ( = ?auto_795943 ?auto_795946 ) ) ( not ( = ?auto_795943 ?auto_795947 ) ) ( not ( = ?auto_795943 ?auto_795948 ) ) ( not ( = ?auto_795944 ?auto_795945 ) ) ( not ( = ?auto_795944 ?auto_795946 ) ) ( not ( = ?auto_795944 ?auto_795947 ) ) ( not ( = ?auto_795944 ?auto_795948 ) ) ( not ( = ?auto_795945 ?auto_795946 ) ) ( not ( = ?auto_795945 ?auto_795947 ) ) ( not ( = ?auto_795945 ?auto_795948 ) ) ( not ( = ?auto_795946 ?auto_795947 ) ) ( not ( = ?auto_795946 ?auto_795948 ) ) ( not ( = ?auto_795947 ?auto_795948 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_795947 ?auto_795948 )
      ( !STACK ?auto_795947 ?auto_795946 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_795992 - BLOCK
      ?auto_795993 - BLOCK
      ?auto_795994 - BLOCK
      ?auto_795995 - BLOCK
      ?auto_795996 - BLOCK
      ?auto_795997 - BLOCK
      ?auto_795998 - BLOCK
      ?auto_795999 - BLOCK
      ?auto_796000 - BLOCK
      ?auto_796001 - BLOCK
      ?auto_796002 - BLOCK
      ?auto_796003 - BLOCK
      ?auto_796004 - BLOCK
      ?auto_796005 - BLOCK
    )
    :vars
    (
      ?auto_796006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_796005 ?auto_796006 ) ( ON-TABLE ?auto_795992 ) ( ON ?auto_795993 ?auto_795992 ) ( ON ?auto_795994 ?auto_795993 ) ( ON ?auto_795995 ?auto_795994 ) ( ON ?auto_795996 ?auto_795995 ) ( ON ?auto_795997 ?auto_795996 ) ( ON ?auto_795998 ?auto_795997 ) ( ON ?auto_795999 ?auto_795998 ) ( ON ?auto_796000 ?auto_795999 ) ( ON ?auto_796001 ?auto_796000 ) ( ON ?auto_796002 ?auto_796001 ) ( ON ?auto_796003 ?auto_796002 ) ( not ( = ?auto_795992 ?auto_795993 ) ) ( not ( = ?auto_795992 ?auto_795994 ) ) ( not ( = ?auto_795992 ?auto_795995 ) ) ( not ( = ?auto_795992 ?auto_795996 ) ) ( not ( = ?auto_795992 ?auto_795997 ) ) ( not ( = ?auto_795992 ?auto_795998 ) ) ( not ( = ?auto_795992 ?auto_795999 ) ) ( not ( = ?auto_795992 ?auto_796000 ) ) ( not ( = ?auto_795992 ?auto_796001 ) ) ( not ( = ?auto_795992 ?auto_796002 ) ) ( not ( = ?auto_795992 ?auto_796003 ) ) ( not ( = ?auto_795992 ?auto_796004 ) ) ( not ( = ?auto_795992 ?auto_796005 ) ) ( not ( = ?auto_795992 ?auto_796006 ) ) ( not ( = ?auto_795993 ?auto_795994 ) ) ( not ( = ?auto_795993 ?auto_795995 ) ) ( not ( = ?auto_795993 ?auto_795996 ) ) ( not ( = ?auto_795993 ?auto_795997 ) ) ( not ( = ?auto_795993 ?auto_795998 ) ) ( not ( = ?auto_795993 ?auto_795999 ) ) ( not ( = ?auto_795993 ?auto_796000 ) ) ( not ( = ?auto_795993 ?auto_796001 ) ) ( not ( = ?auto_795993 ?auto_796002 ) ) ( not ( = ?auto_795993 ?auto_796003 ) ) ( not ( = ?auto_795993 ?auto_796004 ) ) ( not ( = ?auto_795993 ?auto_796005 ) ) ( not ( = ?auto_795993 ?auto_796006 ) ) ( not ( = ?auto_795994 ?auto_795995 ) ) ( not ( = ?auto_795994 ?auto_795996 ) ) ( not ( = ?auto_795994 ?auto_795997 ) ) ( not ( = ?auto_795994 ?auto_795998 ) ) ( not ( = ?auto_795994 ?auto_795999 ) ) ( not ( = ?auto_795994 ?auto_796000 ) ) ( not ( = ?auto_795994 ?auto_796001 ) ) ( not ( = ?auto_795994 ?auto_796002 ) ) ( not ( = ?auto_795994 ?auto_796003 ) ) ( not ( = ?auto_795994 ?auto_796004 ) ) ( not ( = ?auto_795994 ?auto_796005 ) ) ( not ( = ?auto_795994 ?auto_796006 ) ) ( not ( = ?auto_795995 ?auto_795996 ) ) ( not ( = ?auto_795995 ?auto_795997 ) ) ( not ( = ?auto_795995 ?auto_795998 ) ) ( not ( = ?auto_795995 ?auto_795999 ) ) ( not ( = ?auto_795995 ?auto_796000 ) ) ( not ( = ?auto_795995 ?auto_796001 ) ) ( not ( = ?auto_795995 ?auto_796002 ) ) ( not ( = ?auto_795995 ?auto_796003 ) ) ( not ( = ?auto_795995 ?auto_796004 ) ) ( not ( = ?auto_795995 ?auto_796005 ) ) ( not ( = ?auto_795995 ?auto_796006 ) ) ( not ( = ?auto_795996 ?auto_795997 ) ) ( not ( = ?auto_795996 ?auto_795998 ) ) ( not ( = ?auto_795996 ?auto_795999 ) ) ( not ( = ?auto_795996 ?auto_796000 ) ) ( not ( = ?auto_795996 ?auto_796001 ) ) ( not ( = ?auto_795996 ?auto_796002 ) ) ( not ( = ?auto_795996 ?auto_796003 ) ) ( not ( = ?auto_795996 ?auto_796004 ) ) ( not ( = ?auto_795996 ?auto_796005 ) ) ( not ( = ?auto_795996 ?auto_796006 ) ) ( not ( = ?auto_795997 ?auto_795998 ) ) ( not ( = ?auto_795997 ?auto_795999 ) ) ( not ( = ?auto_795997 ?auto_796000 ) ) ( not ( = ?auto_795997 ?auto_796001 ) ) ( not ( = ?auto_795997 ?auto_796002 ) ) ( not ( = ?auto_795997 ?auto_796003 ) ) ( not ( = ?auto_795997 ?auto_796004 ) ) ( not ( = ?auto_795997 ?auto_796005 ) ) ( not ( = ?auto_795997 ?auto_796006 ) ) ( not ( = ?auto_795998 ?auto_795999 ) ) ( not ( = ?auto_795998 ?auto_796000 ) ) ( not ( = ?auto_795998 ?auto_796001 ) ) ( not ( = ?auto_795998 ?auto_796002 ) ) ( not ( = ?auto_795998 ?auto_796003 ) ) ( not ( = ?auto_795998 ?auto_796004 ) ) ( not ( = ?auto_795998 ?auto_796005 ) ) ( not ( = ?auto_795998 ?auto_796006 ) ) ( not ( = ?auto_795999 ?auto_796000 ) ) ( not ( = ?auto_795999 ?auto_796001 ) ) ( not ( = ?auto_795999 ?auto_796002 ) ) ( not ( = ?auto_795999 ?auto_796003 ) ) ( not ( = ?auto_795999 ?auto_796004 ) ) ( not ( = ?auto_795999 ?auto_796005 ) ) ( not ( = ?auto_795999 ?auto_796006 ) ) ( not ( = ?auto_796000 ?auto_796001 ) ) ( not ( = ?auto_796000 ?auto_796002 ) ) ( not ( = ?auto_796000 ?auto_796003 ) ) ( not ( = ?auto_796000 ?auto_796004 ) ) ( not ( = ?auto_796000 ?auto_796005 ) ) ( not ( = ?auto_796000 ?auto_796006 ) ) ( not ( = ?auto_796001 ?auto_796002 ) ) ( not ( = ?auto_796001 ?auto_796003 ) ) ( not ( = ?auto_796001 ?auto_796004 ) ) ( not ( = ?auto_796001 ?auto_796005 ) ) ( not ( = ?auto_796001 ?auto_796006 ) ) ( not ( = ?auto_796002 ?auto_796003 ) ) ( not ( = ?auto_796002 ?auto_796004 ) ) ( not ( = ?auto_796002 ?auto_796005 ) ) ( not ( = ?auto_796002 ?auto_796006 ) ) ( not ( = ?auto_796003 ?auto_796004 ) ) ( not ( = ?auto_796003 ?auto_796005 ) ) ( not ( = ?auto_796003 ?auto_796006 ) ) ( not ( = ?auto_796004 ?auto_796005 ) ) ( not ( = ?auto_796004 ?auto_796006 ) ) ( not ( = ?auto_796005 ?auto_796006 ) ) ( CLEAR ?auto_796003 ) ( ON ?auto_796004 ?auto_796005 ) ( CLEAR ?auto_796004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_795992 ?auto_795993 ?auto_795994 ?auto_795995 ?auto_795996 ?auto_795997 ?auto_795998 ?auto_795999 ?auto_796000 ?auto_796001 ?auto_796002 ?auto_796003 ?auto_796004 )
      ( MAKE-14PILE ?auto_795992 ?auto_795993 ?auto_795994 ?auto_795995 ?auto_795996 ?auto_795997 ?auto_795998 ?auto_795999 ?auto_796000 ?auto_796001 ?auto_796002 ?auto_796003 ?auto_796004 ?auto_796005 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_796050 - BLOCK
      ?auto_796051 - BLOCK
      ?auto_796052 - BLOCK
      ?auto_796053 - BLOCK
      ?auto_796054 - BLOCK
      ?auto_796055 - BLOCK
      ?auto_796056 - BLOCK
      ?auto_796057 - BLOCK
      ?auto_796058 - BLOCK
      ?auto_796059 - BLOCK
      ?auto_796060 - BLOCK
      ?auto_796061 - BLOCK
      ?auto_796062 - BLOCK
      ?auto_796063 - BLOCK
    )
    :vars
    (
      ?auto_796064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_796063 ?auto_796064 ) ( ON-TABLE ?auto_796050 ) ( ON ?auto_796051 ?auto_796050 ) ( ON ?auto_796052 ?auto_796051 ) ( ON ?auto_796053 ?auto_796052 ) ( ON ?auto_796054 ?auto_796053 ) ( ON ?auto_796055 ?auto_796054 ) ( ON ?auto_796056 ?auto_796055 ) ( ON ?auto_796057 ?auto_796056 ) ( ON ?auto_796058 ?auto_796057 ) ( ON ?auto_796059 ?auto_796058 ) ( ON ?auto_796060 ?auto_796059 ) ( not ( = ?auto_796050 ?auto_796051 ) ) ( not ( = ?auto_796050 ?auto_796052 ) ) ( not ( = ?auto_796050 ?auto_796053 ) ) ( not ( = ?auto_796050 ?auto_796054 ) ) ( not ( = ?auto_796050 ?auto_796055 ) ) ( not ( = ?auto_796050 ?auto_796056 ) ) ( not ( = ?auto_796050 ?auto_796057 ) ) ( not ( = ?auto_796050 ?auto_796058 ) ) ( not ( = ?auto_796050 ?auto_796059 ) ) ( not ( = ?auto_796050 ?auto_796060 ) ) ( not ( = ?auto_796050 ?auto_796061 ) ) ( not ( = ?auto_796050 ?auto_796062 ) ) ( not ( = ?auto_796050 ?auto_796063 ) ) ( not ( = ?auto_796050 ?auto_796064 ) ) ( not ( = ?auto_796051 ?auto_796052 ) ) ( not ( = ?auto_796051 ?auto_796053 ) ) ( not ( = ?auto_796051 ?auto_796054 ) ) ( not ( = ?auto_796051 ?auto_796055 ) ) ( not ( = ?auto_796051 ?auto_796056 ) ) ( not ( = ?auto_796051 ?auto_796057 ) ) ( not ( = ?auto_796051 ?auto_796058 ) ) ( not ( = ?auto_796051 ?auto_796059 ) ) ( not ( = ?auto_796051 ?auto_796060 ) ) ( not ( = ?auto_796051 ?auto_796061 ) ) ( not ( = ?auto_796051 ?auto_796062 ) ) ( not ( = ?auto_796051 ?auto_796063 ) ) ( not ( = ?auto_796051 ?auto_796064 ) ) ( not ( = ?auto_796052 ?auto_796053 ) ) ( not ( = ?auto_796052 ?auto_796054 ) ) ( not ( = ?auto_796052 ?auto_796055 ) ) ( not ( = ?auto_796052 ?auto_796056 ) ) ( not ( = ?auto_796052 ?auto_796057 ) ) ( not ( = ?auto_796052 ?auto_796058 ) ) ( not ( = ?auto_796052 ?auto_796059 ) ) ( not ( = ?auto_796052 ?auto_796060 ) ) ( not ( = ?auto_796052 ?auto_796061 ) ) ( not ( = ?auto_796052 ?auto_796062 ) ) ( not ( = ?auto_796052 ?auto_796063 ) ) ( not ( = ?auto_796052 ?auto_796064 ) ) ( not ( = ?auto_796053 ?auto_796054 ) ) ( not ( = ?auto_796053 ?auto_796055 ) ) ( not ( = ?auto_796053 ?auto_796056 ) ) ( not ( = ?auto_796053 ?auto_796057 ) ) ( not ( = ?auto_796053 ?auto_796058 ) ) ( not ( = ?auto_796053 ?auto_796059 ) ) ( not ( = ?auto_796053 ?auto_796060 ) ) ( not ( = ?auto_796053 ?auto_796061 ) ) ( not ( = ?auto_796053 ?auto_796062 ) ) ( not ( = ?auto_796053 ?auto_796063 ) ) ( not ( = ?auto_796053 ?auto_796064 ) ) ( not ( = ?auto_796054 ?auto_796055 ) ) ( not ( = ?auto_796054 ?auto_796056 ) ) ( not ( = ?auto_796054 ?auto_796057 ) ) ( not ( = ?auto_796054 ?auto_796058 ) ) ( not ( = ?auto_796054 ?auto_796059 ) ) ( not ( = ?auto_796054 ?auto_796060 ) ) ( not ( = ?auto_796054 ?auto_796061 ) ) ( not ( = ?auto_796054 ?auto_796062 ) ) ( not ( = ?auto_796054 ?auto_796063 ) ) ( not ( = ?auto_796054 ?auto_796064 ) ) ( not ( = ?auto_796055 ?auto_796056 ) ) ( not ( = ?auto_796055 ?auto_796057 ) ) ( not ( = ?auto_796055 ?auto_796058 ) ) ( not ( = ?auto_796055 ?auto_796059 ) ) ( not ( = ?auto_796055 ?auto_796060 ) ) ( not ( = ?auto_796055 ?auto_796061 ) ) ( not ( = ?auto_796055 ?auto_796062 ) ) ( not ( = ?auto_796055 ?auto_796063 ) ) ( not ( = ?auto_796055 ?auto_796064 ) ) ( not ( = ?auto_796056 ?auto_796057 ) ) ( not ( = ?auto_796056 ?auto_796058 ) ) ( not ( = ?auto_796056 ?auto_796059 ) ) ( not ( = ?auto_796056 ?auto_796060 ) ) ( not ( = ?auto_796056 ?auto_796061 ) ) ( not ( = ?auto_796056 ?auto_796062 ) ) ( not ( = ?auto_796056 ?auto_796063 ) ) ( not ( = ?auto_796056 ?auto_796064 ) ) ( not ( = ?auto_796057 ?auto_796058 ) ) ( not ( = ?auto_796057 ?auto_796059 ) ) ( not ( = ?auto_796057 ?auto_796060 ) ) ( not ( = ?auto_796057 ?auto_796061 ) ) ( not ( = ?auto_796057 ?auto_796062 ) ) ( not ( = ?auto_796057 ?auto_796063 ) ) ( not ( = ?auto_796057 ?auto_796064 ) ) ( not ( = ?auto_796058 ?auto_796059 ) ) ( not ( = ?auto_796058 ?auto_796060 ) ) ( not ( = ?auto_796058 ?auto_796061 ) ) ( not ( = ?auto_796058 ?auto_796062 ) ) ( not ( = ?auto_796058 ?auto_796063 ) ) ( not ( = ?auto_796058 ?auto_796064 ) ) ( not ( = ?auto_796059 ?auto_796060 ) ) ( not ( = ?auto_796059 ?auto_796061 ) ) ( not ( = ?auto_796059 ?auto_796062 ) ) ( not ( = ?auto_796059 ?auto_796063 ) ) ( not ( = ?auto_796059 ?auto_796064 ) ) ( not ( = ?auto_796060 ?auto_796061 ) ) ( not ( = ?auto_796060 ?auto_796062 ) ) ( not ( = ?auto_796060 ?auto_796063 ) ) ( not ( = ?auto_796060 ?auto_796064 ) ) ( not ( = ?auto_796061 ?auto_796062 ) ) ( not ( = ?auto_796061 ?auto_796063 ) ) ( not ( = ?auto_796061 ?auto_796064 ) ) ( not ( = ?auto_796062 ?auto_796063 ) ) ( not ( = ?auto_796062 ?auto_796064 ) ) ( not ( = ?auto_796063 ?auto_796064 ) ) ( ON ?auto_796062 ?auto_796063 ) ( CLEAR ?auto_796060 ) ( ON ?auto_796061 ?auto_796062 ) ( CLEAR ?auto_796061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_796050 ?auto_796051 ?auto_796052 ?auto_796053 ?auto_796054 ?auto_796055 ?auto_796056 ?auto_796057 ?auto_796058 ?auto_796059 ?auto_796060 ?auto_796061 )
      ( MAKE-14PILE ?auto_796050 ?auto_796051 ?auto_796052 ?auto_796053 ?auto_796054 ?auto_796055 ?auto_796056 ?auto_796057 ?auto_796058 ?auto_796059 ?auto_796060 ?auto_796061 ?auto_796062 ?auto_796063 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_796108 - BLOCK
      ?auto_796109 - BLOCK
      ?auto_796110 - BLOCK
      ?auto_796111 - BLOCK
      ?auto_796112 - BLOCK
      ?auto_796113 - BLOCK
      ?auto_796114 - BLOCK
      ?auto_796115 - BLOCK
      ?auto_796116 - BLOCK
      ?auto_796117 - BLOCK
      ?auto_796118 - BLOCK
      ?auto_796119 - BLOCK
      ?auto_796120 - BLOCK
      ?auto_796121 - BLOCK
    )
    :vars
    (
      ?auto_796122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_796121 ?auto_796122 ) ( ON-TABLE ?auto_796108 ) ( ON ?auto_796109 ?auto_796108 ) ( ON ?auto_796110 ?auto_796109 ) ( ON ?auto_796111 ?auto_796110 ) ( ON ?auto_796112 ?auto_796111 ) ( ON ?auto_796113 ?auto_796112 ) ( ON ?auto_796114 ?auto_796113 ) ( ON ?auto_796115 ?auto_796114 ) ( ON ?auto_796116 ?auto_796115 ) ( ON ?auto_796117 ?auto_796116 ) ( not ( = ?auto_796108 ?auto_796109 ) ) ( not ( = ?auto_796108 ?auto_796110 ) ) ( not ( = ?auto_796108 ?auto_796111 ) ) ( not ( = ?auto_796108 ?auto_796112 ) ) ( not ( = ?auto_796108 ?auto_796113 ) ) ( not ( = ?auto_796108 ?auto_796114 ) ) ( not ( = ?auto_796108 ?auto_796115 ) ) ( not ( = ?auto_796108 ?auto_796116 ) ) ( not ( = ?auto_796108 ?auto_796117 ) ) ( not ( = ?auto_796108 ?auto_796118 ) ) ( not ( = ?auto_796108 ?auto_796119 ) ) ( not ( = ?auto_796108 ?auto_796120 ) ) ( not ( = ?auto_796108 ?auto_796121 ) ) ( not ( = ?auto_796108 ?auto_796122 ) ) ( not ( = ?auto_796109 ?auto_796110 ) ) ( not ( = ?auto_796109 ?auto_796111 ) ) ( not ( = ?auto_796109 ?auto_796112 ) ) ( not ( = ?auto_796109 ?auto_796113 ) ) ( not ( = ?auto_796109 ?auto_796114 ) ) ( not ( = ?auto_796109 ?auto_796115 ) ) ( not ( = ?auto_796109 ?auto_796116 ) ) ( not ( = ?auto_796109 ?auto_796117 ) ) ( not ( = ?auto_796109 ?auto_796118 ) ) ( not ( = ?auto_796109 ?auto_796119 ) ) ( not ( = ?auto_796109 ?auto_796120 ) ) ( not ( = ?auto_796109 ?auto_796121 ) ) ( not ( = ?auto_796109 ?auto_796122 ) ) ( not ( = ?auto_796110 ?auto_796111 ) ) ( not ( = ?auto_796110 ?auto_796112 ) ) ( not ( = ?auto_796110 ?auto_796113 ) ) ( not ( = ?auto_796110 ?auto_796114 ) ) ( not ( = ?auto_796110 ?auto_796115 ) ) ( not ( = ?auto_796110 ?auto_796116 ) ) ( not ( = ?auto_796110 ?auto_796117 ) ) ( not ( = ?auto_796110 ?auto_796118 ) ) ( not ( = ?auto_796110 ?auto_796119 ) ) ( not ( = ?auto_796110 ?auto_796120 ) ) ( not ( = ?auto_796110 ?auto_796121 ) ) ( not ( = ?auto_796110 ?auto_796122 ) ) ( not ( = ?auto_796111 ?auto_796112 ) ) ( not ( = ?auto_796111 ?auto_796113 ) ) ( not ( = ?auto_796111 ?auto_796114 ) ) ( not ( = ?auto_796111 ?auto_796115 ) ) ( not ( = ?auto_796111 ?auto_796116 ) ) ( not ( = ?auto_796111 ?auto_796117 ) ) ( not ( = ?auto_796111 ?auto_796118 ) ) ( not ( = ?auto_796111 ?auto_796119 ) ) ( not ( = ?auto_796111 ?auto_796120 ) ) ( not ( = ?auto_796111 ?auto_796121 ) ) ( not ( = ?auto_796111 ?auto_796122 ) ) ( not ( = ?auto_796112 ?auto_796113 ) ) ( not ( = ?auto_796112 ?auto_796114 ) ) ( not ( = ?auto_796112 ?auto_796115 ) ) ( not ( = ?auto_796112 ?auto_796116 ) ) ( not ( = ?auto_796112 ?auto_796117 ) ) ( not ( = ?auto_796112 ?auto_796118 ) ) ( not ( = ?auto_796112 ?auto_796119 ) ) ( not ( = ?auto_796112 ?auto_796120 ) ) ( not ( = ?auto_796112 ?auto_796121 ) ) ( not ( = ?auto_796112 ?auto_796122 ) ) ( not ( = ?auto_796113 ?auto_796114 ) ) ( not ( = ?auto_796113 ?auto_796115 ) ) ( not ( = ?auto_796113 ?auto_796116 ) ) ( not ( = ?auto_796113 ?auto_796117 ) ) ( not ( = ?auto_796113 ?auto_796118 ) ) ( not ( = ?auto_796113 ?auto_796119 ) ) ( not ( = ?auto_796113 ?auto_796120 ) ) ( not ( = ?auto_796113 ?auto_796121 ) ) ( not ( = ?auto_796113 ?auto_796122 ) ) ( not ( = ?auto_796114 ?auto_796115 ) ) ( not ( = ?auto_796114 ?auto_796116 ) ) ( not ( = ?auto_796114 ?auto_796117 ) ) ( not ( = ?auto_796114 ?auto_796118 ) ) ( not ( = ?auto_796114 ?auto_796119 ) ) ( not ( = ?auto_796114 ?auto_796120 ) ) ( not ( = ?auto_796114 ?auto_796121 ) ) ( not ( = ?auto_796114 ?auto_796122 ) ) ( not ( = ?auto_796115 ?auto_796116 ) ) ( not ( = ?auto_796115 ?auto_796117 ) ) ( not ( = ?auto_796115 ?auto_796118 ) ) ( not ( = ?auto_796115 ?auto_796119 ) ) ( not ( = ?auto_796115 ?auto_796120 ) ) ( not ( = ?auto_796115 ?auto_796121 ) ) ( not ( = ?auto_796115 ?auto_796122 ) ) ( not ( = ?auto_796116 ?auto_796117 ) ) ( not ( = ?auto_796116 ?auto_796118 ) ) ( not ( = ?auto_796116 ?auto_796119 ) ) ( not ( = ?auto_796116 ?auto_796120 ) ) ( not ( = ?auto_796116 ?auto_796121 ) ) ( not ( = ?auto_796116 ?auto_796122 ) ) ( not ( = ?auto_796117 ?auto_796118 ) ) ( not ( = ?auto_796117 ?auto_796119 ) ) ( not ( = ?auto_796117 ?auto_796120 ) ) ( not ( = ?auto_796117 ?auto_796121 ) ) ( not ( = ?auto_796117 ?auto_796122 ) ) ( not ( = ?auto_796118 ?auto_796119 ) ) ( not ( = ?auto_796118 ?auto_796120 ) ) ( not ( = ?auto_796118 ?auto_796121 ) ) ( not ( = ?auto_796118 ?auto_796122 ) ) ( not ( = ?auto_796119 ?auto_796120 ) ) ( not ( = ?auto_796119 ?auto_796121 ) ) ( not ( = ?auto_796119 ?auto_796122 ) ) ( not ( = ?auto_796120 ?auto_796121 ) ) ( not ( = ?auto_796120 ?auto_796122 ) ) ( not ( = ?auto_796121 ?auto_796122 ) ) ( ON ?auto_796120 ?auto_796121 ) ( ON ?auto_796119 ?auto_796120 ) ( CLEAR ?auto_796117 ) ( ON ?auto_796118 ?auto_796119 ) ( CLEAR ?auto_796118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_796108 ?auto_796109 ?auto_796110 ?auto_796111 ?auto_796112 ?auto_796113 ?auto_796114 ?auto_796115 ?auto_796116 ?auto_796117 ?auto_796118 )
      ( MAKE-14PILE ?auto_796108 ?auto_796109 ?auto_796110 ?auto_796111 ?auto_796112 ?auto_796113 ?auto_796114 ?auto_796115 ?auto_796116 ?auto_796117 ?auto_796118 ?auto_796119 ?auto_796120 ?auto_796121 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_796166 - BLOCK
      ?auto_796167 - BLOCK
      ?auto_796168 - BLOCK
      ?auto_796169 - BLOCK
      ?auto_796170 - BLOCK
      ?auto_796171 - BLOCK
      ?auto_796172 - BLOCK
      ?auto_796173 - BLOCK
      ?auto_796174 - BLOCK
      ?auto_796175 - BLOCK
      ?auto_796176 - BLOCK
      ?auto_796177 - BLOCK
      ?auto_796178 - BLOCK
      ?auto_796179 - BLOCK
    )
    :vars
    (
      ?auto_796180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_796179 ?auto_796180 ) ( ON-TABLE ?auto_796166 ) ( ON ?auto_796167 ?auto_796166 ) ( ON ?auto_796168 ?auto_796167 ) ( ON ?auto_796169 ?auto_796168 ) ( ON ?auto_796170 ?auto_796169 ) ( ON ?auto_796171 ?auto_796170 ) ( ON ?auto_796172 ?auto_796171 ) ( ON ?auto_796173 ?auto_796172 ) ( ON ?auto_796174 ?auto_796173 ) ( not ( = ?auto_796166 ?auto_796167 ) ) ( not ( = ?auto_796166 ?auto_796168 ) ) ( not ( = ?auto_796166 ?auto_796169 ) ) ( not ( = ?auto_796166 ?auto_796170 ) ) ( not ( = ?auto_796166 ?auto_796171 ) ) ( not ( = ?auto_796166 ?auto_796172 ) ) ( not ( = ?auto_796166 ?auto_796173 ) ) ( not ( = ?auto_796166 ?auto_796174 ) ) ( not ( = ?auto_796166 ?auto_796175 ) ) ( not ( = ?auto_796166 ?auto_796176 ) ) ( not ( = ?auto_796166 ?auto_796177 ) ) ( not ( = ?auto_796166 ?auto_796178 ) ) ( not ( = ?auto_796166 ?auto_796179 ) ) ( not ( = ?auto_796166 ?auto_796180 ) ) ( not ( = ?auto_796167 ?auto_796168 ) ) ( not ( = ?auto_796167 ?auto_796169 ) ) ( not ( = ?auto_796167 ?auto_796170 ) ) ( not ( = ?auto_796167 ?auto_796171 ) ) ( not ( = ?auto_796167 ?auto_796172 ) ) ( not ( = ?auto_796167 ?auto_796173 ) ) ( not ( = ?auto_796167 ?auto_796174 ) ) ( not ( = ?auto_796167 ?auto_796175 ) ) ( not ( = ?auto_796167 ?auto_796176 ) ) ( not ( = ?auto_796167 ?auto_796177 ) ) ( not ( = ?auto_796167 ?auto_796178 ) ) ( not ( = ?auto_796167 ?auto_796179 ) ) ( not ( = ?auto_796167 ?auto_796180 ) ) ( not ( = ?auto_796168 ?auto_796169 ) ) ( not ( = ?auto_796168 ?auto_796170 ) ) ( not ( = ?auto_796168 ?auto_796171 ) ) ( not ( = ?auto_796168 ?auto_796172 ) ) ( not ( = ?auto_796168 ?auto_796173 ) ) ( not ( = ?auto_796168 ?auto_796174 ) ) ( not ( = ?auto_796168 ?auto_796175 ) ) ( not ( = ?auto_796168 ?auto_796176 ) ) ( not ( = ?auto_796168 ?auto_796177 ) ) ( not ( = ?auto_796168 ?auto_796178 ) ) ( not ( = ?auto_796168 ?auto_796179 ) ) ( not ( = ?auto_796168 ?auto_796180 ) ) ( not ( = ?auto_796169 ?auto_796170 ) ) ( not ( = ?auto_796169 ?auto_796171 ) ) ( not ( = ?auto_796169 ?auto_796172 ) ) ( not ( = ?auto_796169 ?auto_796173 ) ) ( not ( = ?auto_796169 ?auto_796174 ) ) ( not ( = ?auto_796169 ?auto_796175 ) ) ( not ( = ?auto_796169 ?auto_796176 ) ) ( not ( = ?auto_796169 ?auto_796177 ) ) ( not ( = ?auto_796169 ?auto_796178 ) ) ( not ( = ?auto_796169 ?auto_796179 ) ) ( not ( = ?auto_796169 ?auto_796180 ) ) ( not ( = ?auto_796170 ?auto_796171 ) ) ( not ( = ?auto_796170 ?auto_796172 ) ) ( not ( = ?auto_796170 ?auto_796173 ) ) ( not ( = ?auto_796170 ?auto_796174 ) ) ( not ( = ?auto_796170 ?auto_796175 ) ) ( not ( = ?auto_796170 ?auto_796176 ) ) ( not ( = ?auto_796170 ?auto_796177 ) ) ( not ( = ?auto_796170 ?auto_796178 ) ) ( not ( = ?auto_796170 ?auto_796179 ) ) ( not ( = ?auto_796170 ?auto_796180 ) ) ( not ( = ?auto_796171 ?auto_796172 ) ) ( not ( = ?auto_796171 ?auto_796173 ) ) ( not ( = ?auto_796171 ?auto_796174 ) ) ( not ( = ?auto_796171 ?auto_796175 ) ) ( not ( = ?auto_796171 ?auto_796176 ) ) ( not ( = ?auto_796171 ?auto_796177 ) ) ( not ( = ?auto_796171 ?auto_796178 ) ) ( not ( = ?auto_796171 ?auto_796179 ) ) ( not ( = ?auto_796171 ?auto_796180 ) ) ( not ( = ?auto_796172 ?auto_796173 ) ) ( not ( = ?auto_796172 ?auto_796174 ) ) ( not ( = ?auto_796172 ?auto_796175 ) ) ( not ( = ?auto_796172 ?auto_796176 ) ) ( not ( = ?auto_796172 ?auto_796177 ) ) ( not ( = ?auto_796172 ?auto_796178 ) ) ( not ( = ?auto_796172 ?auto_796179 ) ) ( not ( = ?auto_796172 ?auto_796180 ) ) ( not ( = ?auto_796173 ?auto_796174 ) ) ( not ( = ?auto_796173 ?auto_796175 ) ) ( not ( = ?auto_796173 ?auto_796176 ) ) ( not ( = ?auto_796173 ?auto_796177 ) ) ( not ( = ?auto_796173 ?auto_796178 ) ) ( not ( = ?auto_796173 ?auto_796179 ) ) ( not ( = ?auto_796173 ?auto_796180 ) ) ( not ( = ?auto_796174 ?auto_796175 ) ) ( not ( = ?auto_796174 ?auto_796176 ) ) ( not ( = ?auto_796174 ?auto_796177 ) ) ( not ( = ?auto_796174 ?auto_796178 ) ) ( not ( = ?auto_796174 ?auto_796179 ) ) ( not ( = ?auto_796174 ?auto_796180 ) ) ( not ( = ?auto_796175 ?auto_796176 ) ) ( not ( = ?auto_796175 ?auto_796177 ) ) ( not ( = ?auto_796175 ?auto_796178 ) ) ( not ( = ?auto_796175 ?auto_796179 ) ) ( not ( = ?auto_796175 ?auto_796180 ) ) ( not ( = ?auto_796176 ?auto_796177 ) ) ( not ( = ?auto_796176 ?auto_796178 ) ) ( not ( = ?auto_796176 ?auto_796179 ) ) ( not ( = ?auto_796176 ?auto_796180 ) ) ( not ( = ?auto_796177 ?auto_796178 ) ) ( not ( = ?auto_796177 ?auto_796179 ) ) ( not ( = ?auto_796177 ?auto_796180 ) ) ( not ( = ?auto_796178 ?auto_796179 ) ) ( not ( = ?auto_796178 ?auto_796180 ) ) ( not ( = ?auto_796179 ?auto_796180 ) ) ( ON ?auto_796178 ?auto_796179 ) ( ON ?auto_796177 ?auto_796178 ) ( ON ?auto_796176 ?auto_796177 ) ( CLEAR ?auto_796174 ) ( ON ?auto_796175 ?auto_796176 ) ( CLEAR ?auto_796175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_796166 ?auto_796167 ?auto_796168 ?auto_796169 ?auto_796170 ?auto_796171 ?auto_796172 ?auto_796173 ?auto_796174 ?auto_796175 )
      ( MAKE-14PILE ?auto_796166 ?auto_796167 ?auto_796168 ?auto_796169 ?auto_796170 ?auto_796171 ?auto_796172 ?auto_796173 ?auto_796174 ?auto_796175 ?auto_796176 ?auto_796177 ?auto_796178 ?auto_796179 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_796224 - BLOCK
      ?auto_796225 - BLOCK
      ?auto_796226 - BLOCK
      ?auto_796227 - BLOCK
      ?auto_796228 - BLOCK
      ?auto_796229 - BLOCK
      ?auto_796230 - BLOCK
      ?auto_796231 - BLOCK
      ?auto_796232 - BLOCK
      ?auto_796233 - BLOCK
      ?auto_796234 - BLOCK
      ?auto_796235 - BLOCK
      ?auto_796236 - BLOCK
      ?auto_796237 - BLOCK
    )
    :vars
    (
      ?auto_796238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_796237 ?auto_796238 ) ( ON-TABLE ?auto_796224 ) ( ON ?auto_796225 ?auto_796224 ) ( ON ?auto_796226 ?auto_796225 ) ( ON ?auto_796227 ?auto_796226 ) ( ON ?auto_796228 ?auto_796227 ) ( ON ?auto_796229 ?auto_796228 ) ( ON ?auto_796230 ?auto_796229 ) ( ON ?auto_796231 ?auto_796230 ) ( not ( = ?auto_796224 ?auto_796225 ) ) ( not ( = ?auto_796224 ?auto_796226 ) ) ( not ( = ?auto_796224 ?auto_796227 ) ) ( not ( = ?auto_796224 ?auto_796228 ) ) ( not ( = ?auto_796224 ?auto_796229 ) ) ( not ( = ?auto_796224 ?auto_796230 ) ) ( not ( = ?auto_796224 ?auto_796231 ) ) ( not ( = ?auto_796224 ?auto_796232 ) ) ( not ( = ?auto_796224 ?auto_796233 ) ) ( not ( = ?auto_796224 ?auto_796234 ) ) ( not ( = ?auto_796224 ?auto_796235 ) ) ( not ( = ?auto_796224 ?auto_796236 ) ) ( not ( = ?auto_796224 ?auto_796237 ) ) ( not ( = ?auto_796224 ?auto_796238 ) ) ( not ( = ?auto_796225 ?auto_796226 ) ) ( not ( = ?auto_796225 ?auto_796227 ) ) ( not ( = ?auto_796225 ?auto_796228 ) ) ( not ( = ?auto_796225 ?auto_796229 ) ) ( not ( = ?auto_796225 ?auto_796230 ) ) ( not ( = ?auto_796225 ?auto_796231 ) ) ( not ( = ?auto_796225 ?auto_796232 ) ) ( not ( = ?auto_796225 ?auto_796233 ) ) ( not ( = ?auto_796225 ?auto_796234 ) ) ( not ( = ?auto_796225 ?auto_796235 ) ) ( not ( = ?auto_796225 ?auto_796236 ) ) ( not ( = ?auto_796225 ?auto_796237 ) ) ( not ( = ?auto_796225 ?auto_796238 ) ) ( not ( = ?auto_796226 ?auto_796227 ) ) ( not ( = ?auto_796226 ?auto_796228 ) ) ( not ( = ?auto_796226 ?auto_796229 ) ) ( not ( = ?auto_796226 ?auto_796230 ) ) ( not ( = ?auto_796226 ?auto_796231 ) ) ( not ( = ?auto_796226 ?auto_796232 ) ) ( not ( = ?auto_796226 ?auto_796233 ) ) ( not ( = ?auto_796226 ?auto_796234 ) ) ( not ( = ?auto_796226 ?auto_796235 ) ) ( not ( = ?auto_796226 ?auto_796236 ) ) ( not ( = ?auto_796226 ?auto_796237 ) ) ( not ( = ?auto_796226 ?auto_796238 ) ) ( not ( = ?auto_796227 ?auto_796228 ) ) ( not ( = ?auto_796227 ?auto_796229 ) ) ( not ( = ?auto_796227 ?auto_796230 ) ) ( not ( = ?auto_796227 ?auto_796231 ) ) ( not ( = ?auto_796227 ?auto_796232 ) ) ( not ( = ?auto_796227 ?auto_796233 ) ) ( not ( = ?auto_796227 ?auto_796234 ) ) ( not ( = ?auto_796227 ?auto_796235 ) ) ( not ( = ?auto_796227 ?auto_796236 ) ) ( not ( = ?auto_796227 ?auto_796237 ) ) ( not ( = ?auto_796227 ?auto_796238 ) ) ( not ( = ?auto_796228 ?auto_796229 ) ) ( not ( = ?auto_796228 ?auto_796230 ) ) ( not ( = ?auto_796228 ?auto_796231 ) ) ( not ( = ?auto_796228 ?auto_796232 ) ) ( not ( = ?auto_796228 ?auto_796233 ) ) ( not ( = ?auto_796228 ?auto_796234 ) ) ( not ( = ?auto_796228 ?auto_796235 ) ) ( not ( = ?auto_796228 ?auto_796236 ) ) ( not ( = ?auto_796228 ?auto_796237 ) ) ( not ( = ?auto_796228 ?auto_796238 ) ) ( not ( = ?auto_796229 ?auto_796230 ) ) ( not ( = ?auto_796229 ?auto_796231 ) ) ( not ( = ?auto_796229 ?auto_796232 ) ) ( not ( = ?auto_796229 ?auto_796233 ) ) ( not ( = ?auto_796229 ?auto_796234 ) ) ( not ( = ?auto_796229 ?auto_796235 ) ) ( not ( = ?auto_796229 ?auto_796236 ) ) ( not ( = ?auto_796229 ?auto_796237 ) ) ( not ( = ?auto_796229 ?auto_796238 ) ) ( not ( = ?auto_796230 ?auto_796231 ) ) ( not ( = ?auto_796230 ?auto_796232 ) ) ( not ( = ?auto_796230 ?auto_796233 ) ) ( not ( = ?auto_796230 ?auto_796234 ) ) ( not ( = ?auto_796230 ?auto_796235 ) ) ( not ( = ?auto_796230 ?auto_796236 ) ) ( not ( = ?auto_796230 ?auto_796237 ) ) ( not ( = ?auto_796230 ?auto_796238 ) ) ( not ( = ?auto_796231 ?auto_796232 ) ) ( not ( = ?auto_796231 ?auto_796233 ) ) ( not ( = ?auto_796231 ?auto_796234 ) ) ( not ( = ?auto_796231 ?auto_796235 ) ) ( not ( = ?auto_796231 ?auto_796236 ) ) ( not ( = ?auto_796231 ?auto_796237 ) ) ( not ( = ?auto_796231 ?auto_796238 ) ) ( not ( = ?auto_796232 ?auto_796233 ) ) ( not ( = ?auto_796232 ?auto_796234 ) ) ( not ( = ?auto_796232 ?auto_796235 ) ) ( not ( = ?auto_796232 ?auto_796236 ) ) ( not ( = ?auto_796232 ?auto_796237 ) ) ( not ( = ?auto_796232 ?auto_796238 ) ) ( not ( = ?auto_796233 ?auto_796234 ) ) ( not ( = ?auto_796233 ?auto_796235 ) ) ( not ( = ?auto_796233 ?auto_796236 ) ) ( not ( = ?auto_796233 ?auto_796237 ) ) ( not ( = ?auto_796233 ?auto_796238 ) ) ( not ( = ?auto_796234 ?auto_796235 ) ) ( not ( = ?auto_796234 ?auto_796236 ) ) ( not ( = ?auto_796234 ?auto_796237 ) ) ( not ( = ?auto_796234 ?auto_796238 ) ) ( not ( = ?auto_796235 ?auto_796236 ) ) ( not ( = ?auto_796235 ?auto_796237 ) ) ( not ( = ?auto_796235 ?auto_796238 ) ) ( not ( = ?auto_796236 ?auto_796237 ) ) ( not ( = ?auto_796236 ?auto_796238 ) ) ( not ( = ?auto_796237 ?auto_796238 ) ) ( ON ?auto_796236 ?auto_796237 ) ( ON ?auto_796235 ?auto_796236 ) ( ON ?auto_796234 ?auto_796235 ) ( ON ?auto_796233 ?auto_796234 ) ( CLEAR ?auto_796231 ) ( ON ?auto_796232 ?auto_796233 ) ( CLEAR ?auto_796232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_796224 ?auto_796225 ?auto_796226 ?auto_796227 ?auto_796228 ?auto_796229 ?auto_796230 ?auto_796231 ?auto_796232 )
      ( MAKE-14PILE ?auto_796224 ?auto_796225 ?auto_796226 ?auto_796227 ?auto_796228 ?auto_796229 ?auto_796230 ?auto_796231 ?auto_796232 ?auto_796233 ?auto_796234 ?auto_796235 ?auto_796236 ?auto_796237 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_796282 - BLOCK
      ?auto_796283 - BLOCK
      ?auto_796284 - BLOCK
      ?auto_796285 - BLOCK
      ?auto_796286 - BLOCK
      ?auto_796287 - BLOCK
      ?auto_796288 - BLOCK
      ?auto_796289 - BLOCK
      ?auto_796290 - BLOCK
      ?auto_796291 - BLOCK
      ?auto_796292 - BLOCK
      ?auto_796293 - BLOCK
      ?auto_796294 - BLOCK
      ?auto_796295 - BLOCK
    )
    :vars
    (
      ?auto_796296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_796295 ?auto_796296 ) ( ON-TABLE ?auto_796282 ) ( ON ?auto_796283 ?auto_796282 ) ( ON ?auto_796284 ?auto_796283 ) ( ON ?auto_796285 ?auto_796284 ) ( ON ?auto_796286 ?auto_796285 ) ( ON ?auto_796287 ?auto_796286 ) ( ON ?auto_796288 ?auto_796287 ) ( not ( = ?auto_796282 ?auto_796283 ) ) ( not ( = ?auto_796282 ?auto_796284 ) ) ( not ( = ?auto_796282 ?auto_796285 ) ) ( not ( = ?auto_796282 ?auto_796286 ) ) ( not ( = ?auto_796282 ?auto_796287 ) ) ( not ( = ?auto_796282 ?auto_796288 ) ) ( not ( = ?auto_796282 ?auto_796289 ) ) ( not ( = ?auto_796282 ?auto_796290 ) ) ( not ( = ?auto_796282 ?auto_796291 ) ) ( not ( = ?auto_796282 ?auto_796292 ) ) ( not ( = ?auto_796282 ?auto_796293 ) ) ( not ( = ?auto_796282 ?auto_796294 ) ) ( not ( = ?auto_796282 ?auto_796295 ) ) ( not ( = ?auto_796282 ?auto_796296 ) ) ( not ( = ?auto_796283 ?auto_796284 ) ) ( not ( = ?auto_796283 ?auto_796285 ) ) ( not ( = ?auto_796283 ?auto_796286 ) ) ( not ( = ?auto_796283 ?auto_796287 ) ) ( not ( = ?auto_796283 ?auto_796288 ) ) ( not ( = ?auto_796283 ?auto_796289 ) ) ( not ( = ?auto_796283 ?auto_796290 ) ) ( not ( = ?auto_796283 ?auto_796291 ) ) ( not ( = ?auto_796283 ?auto_796292 ) ) ( not ( = ?auto_796283 ?auto_796293 ) ) ( not ( = ?auto_796283 ?auto_796294 ) ) ( not ( = ?auto_796283 ?auto_796295 ) ) ( not ( = ?auto_796283 ?auto_796296 ) ) ( not ( = ?auto_796284 ?auto_796285 ) ) ( not ( = ?auto_796284 ?auto_796286 ) ) ( not ( = ?auto_796284 ?auto_796287 ) ) ( not ( = ?auto_796284 ?auto_796288 ) ) ( not ( = ?auto_796284 ?auto_796289 ) ) ( not ( = ?auto_796284 ?auto_796290 ) ) ( not ( = ?auto_796284 ?auto_796291 ) ) ( not ( = ?auto_796284 ?auto_796292 ) ) ( not ( = ?auto_796284 ?auto_796293 ) ) ( not ( = ?auto_796284 ?auto_796294 ) ) ( not ( = ?auto_796284 ?auto_796295 ) ) ( not ( = ?auto_796284 ?auto_796296 ) ) ( not ( = ?auto_796285 ?auto_796286 ) ) ( not ( = ?auto_796285 ?auto_796287 ) ) ( not ( = ?auto_796285 ?auto_796288 ) ) ( not ( = ?auto_796285 ?auto_796289 ) ) ( not ( = ?auto_796285 ?auto_796290 ) ) ( not ( = ?auto_796285 ?auto_796291 ) ) ( not ( = ?auto_796285 ?auto_796292 ) ) ( not ( = ?auto_796285 ?auto_796293 ) ) ( not ( = ?auto_796285 ?auto_796294 ) ) ( not ( = ?auto_796285 ?auto_796295 ) ) ( not ( = ?auto_796285 ?auto_796296 ) ) ( not ( = ?auto_796286 ?auto_796287 ) ) ( not ( = ?auto_796286 ?auto_796288 ) ) ( not ( = ?auto_796286 ?auto_796289 ) ) ( not ( = ?auto_796286 ?auto_796290 ) ) ( not ( = ?auto_796286 ?auto_796291 ) ) ( not ( = ?auto_796286 ?auto_796292 ) ) ( not ( = ?auto_796286 ?auto_796293 ) ) ( not ( = ?auto_796286 ?auto_796294 ) ) ( not ( = ?auto_796286 ?auto_796295 ) ) ( not ( = ?auto_796286 ?auto_796296 ) ) ( not ( = ?auto_796287 ?auto_796288 ) ) ( not ( = ?auto_796287 ?auto_796289 ) ) ( not ( = ?auto_796287 ?auto_796290 ) ) ( not ( = ?auto_796287 ?auto_796291 ) ) ( not ( = ?auto_796287 ?auto_796292 ) ) ( not ( = ?auto_796287 ?auto_796293 ) ) ( not ( = ?auto_796287 ?auto_796294 ) ) ( not ( = ?auto_796287 ?auto_796295 ) ) ( not ( = ?auto_796287 ?auto_796296 ) ) ( not ( = ?auto_796288 ?auto_796289 ) ) ( not ( = ?auto_796288 ?auto_796290 ) ) ( not ( = ?auto_796288 ?auto_796291 ) ) ( not ( = ?auto_796288 ?auto_796292 ) ) ( not ( = ?auto_796288 ?auto_796293 ) ) ( not ( = ?auto_796288 ?auto_796294 ) ) ( not ( = ?auto_796288 ?auto_796295 ) ) ( not ( = ?auto_796288 ?auto_796296 ) ) ( not ( = ?auto_796289 ?auto_796290 ) ) ( not ( = ?auto_796289 ?auto_796291 ) ) ( not ( = ?auto_796289 ?auto_796292 ) ) ( not ( = ?auto_796289 ?auto_796293 ) ) ( not ( = ?auto_796289 ?auto_796294 ) ) ( not ( = ?auto_796289 ?auto_796295 ) ) ( not ( = ?auto_796289 ?auto_796296 ) ) ( not ( = ?auto_796290 ?auto_796291 ) ) ( not ( = ?auto_796290 ?auto_796292 ) ) ( not ( = ?auto_796290 ?auto_796293 ) ) ( not ( = ?auto_796290 ?auto_796294 ) ) ( not ( = ?auto_796290 ?auto_796295 ) ) ( not ( = ?auto_796290 ?auto_796296 ) ) ( not ( = ?auto_796291 ?auto_796292 ) ) ( not ( = ?auto_796291 ?auto_796293 ) ) ( not ( = ?auto_796291 ?auto_796294 ) ) ( not ( = ?auto_796291 ?auto_796295 ) ) ( not ( = ?auto_796291 ?auto_796296 ) ) ( not ( = ?auto_796292 ?auto_796293 ) ) ( not ( = ?auto_796292 ?auto_796294 ) ) ( not ( = ?auto_796292 ?auto_796295 ) ) ( not ( = ?auto_796292 ?auto_796296 ) ) ( not ( = ?auto_796293 ?auto_796294 ) ) ( not ( = ?auto_796293 ?auto_796295 ) ) ( not ( = ?auto_796293 ?auto_796296 ) ) ( not ( = ?auto_796294 ?auto_796295 ) ) ( not ( = ?auto_796294 ?auto_796296 ) ) ( not ( = ?auto_796295 ?auto_796296 ) ) ( ON ?auto_796294 ?auto_796295 ) ( ON ?auto_796293 ?auto_796294 ) ( ON ?auto_796292 ?auto_796293 ) ( ON ?auto_796291 ?auto_796292 ) ( ON ?auto_796290 ?auto_796291 ) ( CLEAR ?auto_796288 ) ( ON ?auto_796289 ?auto_796290 ) ( CLEAR ?auto_796289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_796282 ?auto_796283 ?auto_796284 ?auto_796285 ?auto_796286 ?auto_796287 ?auto_796288 ?auto_796289 )
      ( MAKE-14PILE ?auto_796282 ?auto_796283 ?auto_796284 ?auto_796285 ?auto_796286 ?auto_796287 ?auto_796288 ?auto_796289 ?auto_796290 ?auto_796291 ?auto_796292 ?auto_796293 ?auto_796294 ?auto_796295 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_796340 - BLOCK
      ?auto_796341 - BLOCK
      ?auto_796342 - BLOCK
      ?auto_796343 - BLOCK
      ?auto_796344 - BLOCK
      ?auto_796345 - BLOCK
      ?auto_796346 - BLOCK
      ?auto_796347 - BLOCK
      ?auto_796348 - BLOCK
      ?auto_796349 - BLOCK
      ?auto_796350 - BLOCK
      ?auto_796351 - BLOCK
      ?auto_796352 - BLOCK
      ?auto_796353 - BLOCK
    )
    :vars
    (
      ?auto_796354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_796353 ?auto_796354 ) ( ON-TABLE ?auto_796340 ) ( ON ?auto_796341 ?auto_796340 ) ( ON ?auto_796342 ?auto_796341 ) ( ON ?auto_796343 ?auto_796342 ) ( ON ?auto_796344 ?auto_796343 ) ( ON ?auto_796345 ?auto_796344 ) ( not ( = ?auto_796340 ?auto_796341 ) ) ( not ( = ?auto_796340 ?auto_796342 ) ) ( not ( = ?auto_796340 ?auto_796343 ) ) ( not ( = ?auto_796340 ?auto_796344 ) ) ( not ( = ?auto_796340 ?auto_796345 ) ) ( not ( = ?auto_796340 ?auto_796346 ) ) ( not ( = ?auto_796340 ?auto_796347 ) ) ( not ( = ?auto_796340 ?auto_796348 ) ) ( not ( = ?auto_796340 ?auto_796349 ) ) ( not ( = ?auto_796340 ?auto_796350 ) ) ( not ( = ?auto_796340 ?auto_796351 ) ) ( not ( = ?auto_796340 ?auto_796352 ) ) ( not ( = ?auto_796340 ?auto_796353 ) ) ( not ( = ?auto_796340 ?auto_796354 ) ) ( not ( = ?auto_796341 ?auto_796342 ) ) ( not ( = ?auto_796341 ?auto_796343 ) ) ( not ( = ?auto_796341 ?auto_796344 ) ) ( not ( = ?auto_796341 ?auto_796345 ) ) ( not ( = ?auto_796341 ?auto_796346 ) ) ( not ( = ?auto_796341 ?auto_796347 ) ) ( not ( = ?auto_796341 ?auto_796348 ) ) ( not ( = ?auto_796341 ?auto_796349 ) ) ( not ( = ?auto_796341 ?auto_796350 ) ) ( not ( = ?auto_796341 ?auto_796351 ) ) ( not ( = ?auto_796341 ?auto_796352 ) ) ( not ( = ?auto_796341 ?auto_796353 ) ) ( not ( = ?auto_796341 ?auto_796354 ) ) ( not ( = ?auto_796342 ?auto_796343 ) ) ( not ( = ?auto_796342 ?auto_796344 ) ) ( not ( = ?auto_796342 ?auto_796345 ) ) ( not ( = ?auto_796342 ?auto_796346 ) ) ( not ( = ?auto_796342 ?auto_796347 ) ) ( not ( = ?auto_796342 ?auto_796348 ) ) ( not ( = ?auto_796342 ?auto_796349 ) ) ( not ( = ?auto_796342 ?auto_796350 ) ) ( not ( = ?auto_796342 ?auto_796351 ) ) ( not ( = ?auto_796342 ?auto_796352 ) ) ( not ( = ?auto_796342 ?auto_796353 ) ) ( not ( = ?auto_796342 ?auto_796354 ) ) ( not ( = ?auto_796343 ?auto_796344 ) ) ( not ( = ?auto_796343 ?auto_796345 ) ) ( not ( = ?auto_796343 ?auto_796346 ) ) ( not ( = ?auto_796343 ?auto_796347 ) ) ( not ( = ?auto_796343 ?auto_796348 ) ) ( not ( = ?auto_796343 ?auto_796349 ) ) ( not ( = ?auto_796343 ?auto_796350 ) ) ( not ( = ?auto_796343 ?auto_796351 ) ) ( not ( = ?auto_796343 ?auto_796352 ) ) ( not ( = ?auto_796343 ?auto_796353 ) ) ( not ( = ?auto_796343 ?auto_796354 ) ) ( not ( = ?auto_796344 ?auto_796345 ) ) ( not ( = ?auto_796344 ?auto_796346 ) ) ( not ( = ?auto_796344 ?auto_796347 ) ) ( not ( = ?auto_796344 ?auto_796348 ) ) ( not ( = ?auto_796344 ?auto_796349 ) ) ( not ( = ?auto_796344 ?auto_796350 ) ) ( not ( = ?auto_796344 ?auto_796351 ) ) ( not ( = ?auto_796344 ?auto_796352 ) ) ( not ( = ?auto_796344 ?auto_796353 ) ) ( not ( = ?auto_796344 ?auto_796354 ) ) ( not ( = ?auto_796345 ?auto_796346 ) ) ( not ( = ?auto_796345 ?auto_796347 ) ) ( not ( = ?auto_796345 ?auto_796348 ) ) ( not ( = ?auto_796345 ?auto_796349 ) ) ( not ( = ?auto_796345 ?auto_796350 ) ) ( not ( = ?auto_796345 ?auto_796351 ) ) ( not ( = ?auto_796345 ?auto_796352 ) ) ( not ( = ?auto_796345 ?auto_796353 ) ) ( not ( = ?auto_796345 ?auto_796354 ) ) ( not ( = ?auto_796346 ?auto_796347 ) ) ( not ( = ?auto_796346 ?auto_796348 ) ) ( not ( = ?auto_796346 ?auto_796349 ) ) ( not ( = ?auto_796346 ?auto_796350 ) ) ( not ( = ?auto_796346 ?auto_796351 ) ) ( not ( = ?auto_796346 ?auto_796352 ) ) ( not ( = ?auto_796346 ?auto_796353 ) ) ( not ( = ?auto_796346 ?auto_796354 ) ) ( not ( = ?auto_796347 ?auto_796348 ) ) ( not ( = ?auto_796347 ?auto_796349 ) ) ( not ( = ?auto_796347 ?auto_796350 ) ) ( not ( = ?auto_796347 ?auto_796351 ) ) ( not ( = ?auto_796347 ?auto_796352 ) ) ( not ( = ?auto_796347 ?auto_796353 ) ) ( not ( = ?auto_796347 ?auto_796354 ) ) ( not ( = ?auto_796348 ?auto_796349 ) ) ( not ( = ?auto_796348 ?auto_796350 ) ) ( not ( = ?auto_796348 ?auto_796351 ) ) ( not ( = ?auto_796348 ?auto_796352 ) ) ( not ( = ?auto_796348 ?auto_796353 ) ) ( not ( = ?auto_796348 ?auto_796354 ) ) ( not ( = ?auto_796349 ?auto_796350 ) ) ( not ( = ?auto_796349 ?auto_796351 ) ) ( not ( = ?auto_796349 ?auto_796352 ) ) ( not ( = ?auto_796349 ?auto_796353 ) ) ( not ( = ?auto_796349 ?auto_796354 ) ) ( not ( = ?auto_796350 ?auto_796351 ) ) ( not ( = ?auto_796350 ?auto_796352 ) ) ( not ( = ?auto_796350 ?auto_796353 ) ) ( not ( = ?auto_796350 ?auto_796354 ) ) ( not ( = ?auto_796351 ?auto_796352 ) ) ( not ( = ?auto_796351 ?auto_796353 ) ) ( not ( = ?auto_796351 ?auto_796354 ) ) ( not ( = ?auto_796352 ?auto_796353 ) ) ( not ( = ?auto_796352 ?auto_796354 ) ) ( not ( = ?auto_796353 ?auto_796354 ) ) ( ON ?auto_796352 ?auto_796353 ) ( ON ?auto_796351 ?auto_796352 ) ( ON ?auto_796350 ?auto_796351 ) ( ON ?auto_796349 ?auto_796350 ) ( ON ?auto_796348 ?auto_796349 ) ( ON ?auto_796347 ?auto_796348 ) ( CLEAR ?auto_796345 ) ( ON ?auto_796346 ?auto_796347 ) ( CLEAR ?auto_796346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_796340 ?auto_796341 ?auto_796342 ?auto_796343 ?auto_796344 ?auto_796345 ?auto_796346 )
      ( MAKE-14PILE ?auto_796340 ?auto_796341 ?auto_796342 ?auto_796343 ?auto_796344 ?auto_796345 ?auto_796346 ?auto_796347 ?auto_796348 ?auto_796349 ?auto_796350 ?auto_796351 ?auto_796352 ?auto_796353 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_796398 - BLOCK
      ?auto_796399 - BLOCK
      ?auto_796400 - BLOCK
      ?auto_796401 - BLOCK
      ?auto_796402 - BLOCK
      ?auto_796403 - BLOCK
      ?auto_796404 - BLOCK
      ?auto_796405 - BLOCK
      ?auto_796406 - BLOCK
      ?auto_796407 - BLOCK
      ?auto_796408 - BLOCK
      ?auto_796409 - BLOCK
      ?auto_796410 - BLOCK
      ?auto_796411 - BLOCK
    )
    :vars
    (
      ?auto_796412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_796411 ?auto_796412 ) ( ON-TABLE ?auto_796398 ) ( ON ?auto_796399 ?auto_796398 ) ( ON ?auto_796400 ?auto_796399 ) ( ON ?auto_796401 ?auto_796400 ) ( ON ?auto_796402 ?auto_796401 ) ( not ( = ?auto_796398 ?auto_796399 ) ) ( not ( = ?auto_796398 ?auto_796400 ) ) ( not ( = ?auto_796398 ?auto_796401 ) ) ( not ( = ?auto_796398 ?auto_796402 ) ) ( not ( = ?auto_796398 ?auto_796403 ) ) ( not ( = ?auto_796398 ?auto_796404 ) ) ( not ( = ?auto_796398 ?auto_796405 ) ) ( not ( = ?auto_796398 ?auto_796406 ) ) ( not ( = ?auto_796398 ?auto_796407 ) ) ( not ( = ?auto_796398 ?auto_796408 ) ) ( not ( = ?auto_796398 ?auto_796409 ) ) ( not ( = ?auto_796398 ?auto_796410 ) ) ( not ( = ?auto_796398 ?auto_796411 ) ) ( not ( = ?auto_796398 ?auto_796412 ) ) ( not ( = ?auto_796399 ?auto_796400 ) ) ( not ( = ?auto_796399 ?auto_796401 ) ) ( not ( = ?auto_796399 ?auto_796402 ) ) ( not ( = ?auto_796399 ?auto_796403 ) ) ( not ( = ?auto_796399 ?auto_796404 ) ) ( not ( = ?auto_796399 ?auto_796405 ) ) ( not ( = ?auto_796399 ?auto_796406 ) ) ( not ( = ?auto_796399 ?auto_796407 ) ) ( not ( = ?auto_796399 ?auto_796408 ) ) ( not ( = ?auto_796399 ?auto_796409 ) ) ( not ( = ?auto_796399 ?auto_796410 ) ) ( not ( = ?auto_796399 ?auto_796411 ) ) ( not ( = ?auto_796399 ?auto_796412 ) ) ( not ( = ?auto_796400 ?auto_796401 ) ) ( not ( = ?auto_796400 ?auto_796402 ) ) ( not ( = ?auto_796400 ?auto_796403 ) ) ( not ( = ?auto_796400 ?auto_796404 ) ) ( not ( = ?auto_796400 ?auto_796405 ) ) ( not ( = ?auto_796400 ?auto_796406 ) ) ( not ( = ?auto_796400 ?auto_796407 ) ) ( not ( = ?auto_796400 ?auto_796408 ) ) ( not ( = ?auto_796400 ?auto_796409 ) ) ( not ( = ?auto_796400 ?auto_796410 ) ) ( not ( = ?auto_796400 ?auto_796411 ) ) ( not ( = ?auto_796400 ?auto_796412 ) ) ( not ( = ?auto_796401 ?auto_796402 ) ) ( not ( = ?auto_796401 ?auto_796403 ) ) ( not ( = ?auto_796401 ?auto_796404 ) ) ( not ( = ?auto_796401 ?auto_796405 ) ) ( not ( = ?auto_796401 ?auto_796406 ) ) ( not ( = ?auto_796401 ?auto_796407 ) ) ( not ( = ?auto_796401 ?auto_796408 ) ) ( not ( = ?auto_796401 ?auto_796409 ) ) ( not ( = ?auto_796401 ?auto_796410 ) ) ( not ( = ?auto_796401 ?auto_796411 ) ) ( not ( = ?auto_796401 ?auto_796412 ) ) ( not ( = ?auto_796402 ?auto_796403 ) ) ( not ( = ?auto_796402 ?auto_796404 ) ) ( not ( = ?auto_796402 ?auto_796405 ) ) ( not ( = ?auto_796402 ?auto_796406 ) ) ( not ( = ?auto_796402 ?auto_796407 ) ) ( not ( = ?auto_796402 ?auto_796408 ) ) ( not ( = ?auto_796402 ?auto_796409 ) ) ( not ( = ?auto_796402 ?auto_796410 ) ) ( not ( = ?auto_796402 ?auto_796411 ) ) ( not ( = ?auto_796402 ?auto_796412 ) ) ( not ( = ?auto_796403 ?auto_796404 ) ) ( not ( = ?auto_796403 ?auto_796405 ) ) ( not ( = ?auto_796403 ?auto_796406 ) ) ( not ( = ?auto_796403 ?auto_796407 ) ) ( not ( = ?auto_796403 ?auto_796408 ) ) ( not ( = ?auto_796403 ?auto_796409 ) ) ( not ( = ?auto_796403 ?auto_796410 ) ) ( not ( = ?auto_796403 ?auto_796411 ) ) ( not ( = ?auto_796403 ?auto_796412 ) ) ( not ( = ?auto_796404 ?auto_796405 ) ) ( not ( = ?auto_796404 ?auto_796406 ) ) ( not ( = ?auto_796404 ?auto_796407 ) ) ( not ( = ?auto_796404 ?auto_796408 ) ) ( not ( = ?auto_796404 ?auto_796409 ) ) ( not ( = ?auto_796404 ?auto_796410 ) ) ( not ( = ?auto_796404 ?auto_796411 ) ) ( not ( = ?auto_796404 ?auto_796412 ) ) ( not ( = ?auto_796405 ?auto_796406 ) ) ( not ( = ?auto_796405 ?auto_796407 ) ) ( not ( = ?auto_796405 ?auto_796408 ) ) ( not ( = ?auto_796405 ?auto_796409 ) ) ( not ( = ?auto_796405 ?auto_796410 ) ) ( not ( = ?auto_796405 ?auto_796411 ) ) ( not ( = ?auto_796405 ?auto_796412 ) ) ( not ( = ?auto_796406 ?auto_796407 ) ) ( not ( = ?auto_796406 ?auto_796408 ) ) ( not ( = ?auto_796406 ?auto_796409 ) ) ( not ( = ?auto_796406 ?auto_796410 ) ) ( not ( = ?auto_796406 ?auto_796411 ) ) ( not ( = ?auto_796406 ?auto_796412 ) ) ( not ( = ?auto_796407 ?auto_796408 ) ) ( not ( = ?auto_796407 ?auto_796409 ) ) ( not ( = ?auto_796407 ?auto_796410 ) ) ( not ( = ?auto_796407 ?auto_796411 ) ) ( not ( = ?auto_796407 ?auto_796412 ) ) ( not ( = ?auto_796408 ?auto_796409 ) ) ( not ( = ?auto_796408 ?auto_796410 ) ) ( not ( = ?auto_796408 ?auto_796411 ) ) ( not ( = ?auto_796408 ?auto_796412 ) ) ( not ( = ?auto_796409 ?auto_796410 ) ) ( not ( = ?auto_796409 ?auto_796411 ) ) ( not ( = ?auto_796409 ?auto_796412 ) ) ( not ( = ?auto_796410 ?auto_796411 ) ) ( not ( = ?auto_796410 ?auto_796412 ) ) ( not ( = ?auto_796411 ?auto_796412 ) ) ( ON ?auto_796410 ?auto_796411 ) ( ON ?auto_796409 ?auto_796410 ) ( ON ?auto_796408 ?auto_796409 ) ( ON ?auto_796407 ?auto_796408 ) ( ON ?auto_796406 ?auto_796407 ) ( ON ?auto_796405 ?auto_796406 ) ( ON ?auto_796404 ?auto_796405 ) ( CLEAR ?auto_796402 ) ( ON ?auto_796403 ?auto_796404 ) ( CLEAR ?auto_796403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_796398 ?auto_796399 ?auto_796400 ?auto_796401 ?auto_796402 ?auto_796403 )
      ( MAKE-14PILE ?auto_796398 ?auto_796399 ?auto_796400 ?auto_796401 ?auto_796402 ?auto_796403 ?auto_796404 ?auto_796405 ?auto_796406 ?auto_796407 ?auto_796408 ?auto_796409 ?auto_796410 ?auto_796411 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_796456 - BLOCK
      ?auto_796457 - BLOCK
      ?auto_796458 - BLOCK
      ?auto_796459 - BLOCK
      ?auto_796460 - BLOCK
      ?auto_796461 - BLOCK
      ?auto_796462 - BLOCK
      ?auto_796463 - BLOCK
      ?auto_796464 - BLOCK
      ?auto_796465 - BLOCK
      ?auto_796466 - BLOCK
      ?auto_796467 - BLOCK
      ?auto_796468 - BLOCK
      ?auto_796469 - BLOCK
    )
    :vars
    (
      ?auto_796470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_796469 ?auto_796470 ) ( ON-TABLE ?auto_796456 ) ( ON ?auto_796457 ?auto_796456 ) ( ON ?auto_796458 ?auto_796457 ) ( ON ?auto_796459 ?auto_796458 ) ( not ( = ?auto_796456 ?auto_796457 ) ) ( not ( = ?auto_796456 ?auto_796458 ) ) ( not ( = ?auto_796456 ?auto_796459 ) ) ( not ( = ?auto_796456 ?auto_796460 ) ) ( not ( = ?auto_796456 ?auto_796461 ) ) ( not ( = ?auto_796456 ?auto_796462 ) ) ( not ( = ?auto_796456 ?auto_796463 ) ) ( not ( = ?auto_796456 ?auto_796464 ) ) ( not ( = ?auto_796456 ?auto_796465 ) ) ( not ( = ?auto_796456 ?auto_796466 ) ) ( not ( = ?auto_796456 ?auto_796467 ) ) ( not ( = ?auto_796456 ?auto_796468 ) ) ( not ( = ?auto_796456 ?auto_796469 ) ) ( not ( = ?auto_796456 ?auto_796470 ) ) ( not ( = ?auto_796457 ?auto_796458 ) ) ( not ( = ?auto_796457 ?auto_796459 ) ) ( not ( = ?auto_796457 ?auto_796460 ) ) ( not ( = ?auto_796457 ?auto_796461 ) ) ( not ( = ?auto_796457 ?auto_796462 ) ) ( not ( = ?auto_796457 ?auto_796463 ) ) ( not ( = ?auto_796457 ?auto_796464 ) ) ( not ( = ?auto_796457 ?auto_796465 ) ) ( not ( = ?auto_796457 ?auto_796466 ) ) ( not ( = ?auto_796457 ?auto_796467 ) ) ( not ( = ?auto_796457 ?auto_796468 ) ) ( not ( = ?auto_796457 ?auto_796469 ) ) ( not ( = ?auto_796457 ?auto_796470 ) ) ( not ( = ?auto_796458 ?auto_796459 ) ) ( not ( = ?auto_796458 ?auto_796460 ) ) ( not ( = ?auto_796458 ?auto_796461 ) ) ( not ( = ?auto_796458 ?auto_796462 ) ) ( not ( = ?auto_796458 ?auto_796463 ) ) ( not ( = ?auto_796458 ?auto_796464 ) ) ( not ( = ?auto_796458 ?auto_796465 ) ) ( not ( = ?auto_796458 ?auto_796466 ) ) ( not ( = ?auto_796458 ?auto_796467 ) ) ( not ( = ?auto_796458 ?auto_796468 ) ) ( not ( = ?auto_796458 ?auto_796469 ) ) ( not ( = ?auto_796458 ?auto_796470 ) ) ( not ( = ?auto_796459 ?auto_796460 ) ) ( not ( = ?auto_796459 ?auto_796461 ) ) ( not ( = ?auto_796459 ?auto_796462 ) ) ( not ( = ?auto_796459 ?auto_796463 ) ) ( not ( = ?auto_796459 ?auto_796464 ) ) ( not ( = ?auto_796459 ?auto_796465 ) ) ( not ( = ?auto_796459 ?auto_796466 ) ) ( not ( = ?auto_796459 ?auto_796467 ) ) ( not ( = ?auto_796459 ?auto_796468 ) ) ( not ( = ?auto_796459 ?auto_796469 ) ) ( not ( = ?auto_796459 ?auto_796470 ) ) ( not ( = ?auto_796460 ?auto_796461 ) ) ( not ( = ?auto_796460 ?auto_796462 ) ) ( not ( = ?auto_796460 ?auto_796463 ) ) ( not ( = ?auto_796460 ?auto_796464 ) ) ( not ( = ?auto_796460 ?auto_796465 ) ) ( not ( = ?auto_796460 ?auto_796466 ) ) ( not ( = ?auto_796460 ?auto_796467 ) ) ( not ( = ?auto_796460 ?auto_796468 ) ) ( not ( = ?auto_796460 ?auto_796469 ) ) ( not ( = ?auto_796460 ?auto_796470 ) ) ( not ( = ?auto_796461 ?auto_796462 ) ) ( not ( = ?auto_796461 ?auto_796463 ) ) ( not ( = ?auto_796461 ?auto_796464 ) ) ( not ( = ?auto_796461 ?auto_796465 ) ) ( not ( = ?auto_796461 ?auto_796466 ) ) ( not ( = ?auto_796461 ?auto_796467 ) ) ( not ( = ?auto_796461 ?auto_796468 ) ) ( not ( = ?auto_796461 ?auto_796469 ) ) ( not ( = ?auto_796461 ?auto_796470 ) ) ( not ( = ?auto_796462 ?auto_796463 ) ) ( not ( = ?auto_796462 ?auto_796464 ) ) ( not ( = ?auto_796462 ?auto_796465 ) ) ( not ( = ?auto_796462 ?auto_796466 ) ) ( not ( = ?auto_796462 ?auto_796467 ) ) ( not ( = ?auto_796462 ?auto_796468 ) ) ( not ( = ?auto_796462 ?auto_796469 ) ) ( not ( = ?auto_796462 ?auto_796470 ) ) ( not ( = ?auto_796463 ?auto_796464 ) ) ( not ( = ?auto_796463 ?auto_796465 ) ) ( not ( = ?auto_796463 ?auto_796466 ) ) ( not ( = ?auto_796463 ?auto_796467 ) ) ( not ( = ?auto_796463 ?auto_796468 ) ) ( not ( = ?auto_796463 ?auto_796469 ) ) ( not ( = ?auto_796463 ?auto_796470 ) ) ( not ( = ?auto_796464 ?auto_796465 ) ) ( not ( = ?auto_796464 ?auto_796466 ) ) ( not ( = ?auto_796464 ?auto_796467 ) ) ( not ( = ?auto_796464 ?auto_796468 ) ) ( not ( = ?auto_796464 ?auto_796469 ) ) ( not ( = ?auto_796464 ?auto_796470 ) ) ( not ( = ?auto_796465 ?auto_796466 ) ) ( not ( = ?auto_796465 ?auto_796467 ) ) ( not ( = ?auto_796465 ?auto_796468 ) ) ( not ( = ?auto_796465 ?auto_796469 ) ) ( not ( = ?auto_796465 ?auto_796470 ) ) ( not ( = ?auto_796466 ?auto_796467 ) ) ( not ( = ?auto_796466 ?auto_796468 ) ) ( not ( = ?auto_796466 ?auto_796469 ) ) ( not ( = ?auto_796466 ?auto_796470 ) ) ( not ( = ?auto_796467 ?auto_796468 ) ) ( not ( = ?auto_796467 ?auto_796469 ) ) ( not ( = ?auto_796467 ?auto_796470 ) ) ( not ( = ?auto_796468 ?auto_796469 ) ) ( not ( = ?auto_796468 ?auto_796470 ) ) ( not ( = ?auto_796469 ?auto_796470 ) ) ( ON ?auto_796468 ?auto_796469 ) ( ON ?auto_796467 ?auto_796468 ) ( ON ?auto_796466 ?auto_796467 ) ( ON ?auto_796465 ?auto_796466 ) ( ON ?auto_796464 ?auto_796465 ) ( ON ?auto_796463 ?auto_796464 ) ( ON ?auto_796462 ?auto_796463 ) ( ON ?auto_796461 ?auto_796462 ) ( CLEAR ?auto_796459 ) ( ON ?auto_796460 ?auto_796461 ) ( CLEAR ?auto_796460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_796456 ?auto_796457 ?auto_796458 ?auto_796459 ?auto_796460 )
      ( MAKE-14PILE ?auto_796456 ?auto_796457 ?auto_796458 ?auto_796459 ?auto_796460 ?auto_796461 ?auto_796462 ?auto_796463 ?auto_796464 ?auto_796465 ?auto_796466 ?auto_796467 ?auto_796468 ?auto_796469 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_796514 - BLOCK
      ?auto_796515 - BLOCK
      ?auto_796516 - BLOCK
      ?auto_796517 - BLOCK
      ?auto_796518 - BLOCK
      ?auto_796519 - BLOCK
      ?auto_796520 - BLOCK
      ?auto_796521 - BLOCK
      ?auto_796522 - BLOCK
      ?auto_796523 - BLOCK
      ?auto_796524 - BLOCK
      ?auto_796525 - BLOCK
      ?auto_796526 - BLOCK
      ?auto_796527 - BLOCK
    )
    :vars
    (
      ?auto_796528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_796527 ?auto_796528 ) ( ON-TABLE ?auto_796514 ) ( ON ?auto_796515 ?auto_796514 ) ( ON ?auto_796516 ?auto_796515 ) ( not ( = ?auto_796514 ?auto_796515 ) ) ( not ( = ?auto_796514 ?auto_796516 ) ) ( not ( = ?auto_796514 ?auto_796517 ) ) ( not ( = ?auto_796514 ?auto_796518 ) ) ( not ( = ?auto_796514 ?auto_796519 ) ) ( not ( = ?auto_796514 ?auto_796520 ) ) ( not ( = ?auto_796514 ?auto_796521 ) ) ( not ( = ?auto_796514 ?auto_796522 ) ) ( not ( = ?auto_796514 ?auto_796523 ) ) ( not ( = ?auto_796514 ?auto_796524 ) ) ( not ( = ?auto_796514 ?auto_796525 ) ) ( not ( = ?auto_796514 ?auto_796526 ) ) ( not ( = ?auto_796514 ?auto_796527 ) ) ( not ( = ?auto_796514 ?auto_796528 ) ) ( not ( = ?auto_796515 ?auto_796516 ) ) ( not ( = ?auto_796515 ?auto_796517 ) ) ( not ( = ?auto_796515 ?auto_796518 ) ) ( not ( = ?auto_796515 ?auto_796519 ) ) ( not ( = ?auto_796515 ?auto_796520 ) ) ( not ( = ?auto_796515 ?auto_796521 ) ) ( not ( = ?auto_796515 ?auto_796522 ) ) ( not ( = ?auto_796515 ?auto_796523 ) ) ( not ( = ?auto_796515 ?auto_796524 ) ) ( not ( = ?auto_796515 ?auto_796525 ) ) ( not ( = ?auto_796515 ?auto_796526 ) ) ( not ( = ?auto_796515 ?auto_796527 ) ) ( not ( = ?auto_796515 ?auto_796528 ) ) ( not ( = ?auto_796516 ?auto_796517 ) ) ( not ( = ?auto_796516 ?auto_796518 ) ) ( not ( = ?auto_796516 ?auto_796519 ) ) ( not ( = ?auto_796516 ?auto_796520 ) ) ( not ( = ?auto_796516 ?auto_796521 ) ) ( not ( = ?auto_796516 ?auto_796522 ) ) ( not ( = ?auto_796516 ?auto_796523 ) ) ( not ( = ?auto_796516 ?auto_796524 ) ) ( not ( = ?auto_796516 ?auto_796525 ) ) ( not ( = ?auto_796516 ?auto_796526 ) ) ( not ( = ?auto_796516 ?auto_796527 ) ) ( not ( = ?auto_796516 ?auto_796528 ) ) ( not ( = ?auto_796517 ?auto_796518 ) ) ( not ( = ?auto_796517 ?auto_796519 ) ) ( not ( = ?auto_796517 ?auto_796520 ) ) ( not ( = ?auto_796517 ?auto_796521 ) ) ( not ( = ?auto_796517 ?auto_796522 ) ) ( not ( = ?auto_796517 ?auto_796523 ) ) ( not ( = ?auto_796517 ?auto_796524 ) ) ( not ( = ?auto_796517 ?auto_796525 ) ) ( not ( = ?auto_796517 ?auto_796526 ) ) ( not ( = ?auto_796517 ?auto_796527 ) ) ( not ( = ?auto_796517 ?auto_796528 ) ) ( not ( = ?auto_796518 ?auto_796519 ) ) ( not ( = ?auto_796518 ?auto_796520 ) ) ( not ( = ?auto_796518 ?auto_796521 ) ) ( not ( = ?auto_796518 ?auto_796522 ) ) ( not ( = ?auto_796518 ?auto_796523 ) ) ( not ( = ?auto_796518 ?auto_796524 ) ) ( not ( = ?auto_796518 ?auto_796525 ) ) ( not ( = ?auto_796518 ?auto_796526 ) ) ( not ( = ?auto_796518 ?auto_796527 ) ) ( not ( = ?auto_796518 ?auto_796528 ) ) ( not ( = ?auto_796519 ?auto_796520 ) ) ( not ( = ?auto_796519 ?auto_796521 ) ) ( not ( = ?auto_796519 ?auto_796522 ) ) ( not ( = ?auto_796519 ?auto_796523 ) ) ( not ( = ?auto_796519 ?auto_796524 ) ) ( not ( = ?auto_796519 ?auto_796525 ) ) ( not ( = ?auto_796519 ?auto_796526 ) ) ( not ( = ?auto_796519 ?auto_796527 ) ) ( not ( = ?auto_796519 ?auto_796528 ) ) ( not ( = ?auto_796520 ?auto_796521 ) ) ( not ( = ?auto_796520 ?auto_796522 ) ) ( not ( = ?auto_796520 ?auto_796523 ) ) ( not ( = ?auto_796520 ?auto_796524 ) ) ( not ( = ?auto_796520 ?auto_796525 ) ) ( not ( = ?auto_796520 ?auto_796526 ) ) ( not ( = ?auto_796520 ?auto_796527 ) ) ( not ( = ?auto_796520 ?auto_796528 ) ) ( not ( = ?auto_796521 ?auto_796522 ) ) ( not ( = ?auto_796521 ?auto_796523 ) ) ( not ( = ?auto_796521 ?auto_796524 ) ) ( not ( = ?auto_796521 ?auto_796525 ) ) ( not ( = ?auto_796521 ?auto_796526 ) ) ( not ( = ?auto_796521 ?auto_796527 ) ) ( not ( = ?auto_796521 ?auto_796528 ) ) ( not ( = ?auto_796522 ?auto_796523 ) ) ( not ( = ?auto_796522 ?auto_796524 ) ) ( not ( = ?auto_796522 ?auto_796525 ) ) ( not ( = ?auto_796522 ?auto_796526 ) ) ( not ( = ?auto_796522 ?auto_796527 ) ) ( not ( = ?auto_796522 ?auto_796528 ) ) ( not ( = ?auto_796523 ?auto_796524 ) ) ( not ( = ?auto_796523 ?auto_796525 ) ) ( not ( = ?auto_796523 ?auto_796526 ) ) ( not ( = ?auto_796523 ?auto_796527 ) ) ( not ( = ?auto_796523 ?auto_796528 ) ) ( not ( = ?auto_796524 ?auto_796525 ) ) ( not ( = ?auto_796524 ?auto_796526 ) ) ( not ( = ?auto_796524 ?auto_796527 ) ) ( not ( = ?auto_796524 ?auto_796528 ) ) ( not ( = ?auto_796525 ?auto_796526 ) ) ( not ( = ?auto_796525 ?auto_796527 ) ) ( not ( = ?auto_796525 ?auto_796528 ) ) ( not ( = ?auto_796526 ?auto_796527 ) ) ( not ( = ?auto_796526 ?auto_796528 ) ) ( not ( = ?auto_796527 ?auto_796528 ) ) ( ON ?auto_796526 ?auto_796527 ) ( ON ?auto_796525 ?auto_796526 ) ( ON ?auto_796524 ?auto_796525 ) ( ON ?auto_796523 ?auto_796524 ) ( ON ?auto_796522 ?auto_796523 ) ( ON ?auto_796521 ?auto_796522 ) ( ON ?auto_796520 ?auto_796521 ) ( ON ?auto_796519 ?auto_796520 ) ( ON ?auto_796518 ?auto_796519 ) ( CLEAR ?auto_796516 ) ( ON ?auto_796517 ?auto_796518 ) ( CLEAR ?auto_796517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_796514 ?auto_796515 ?auto_796516 ?auto_796517 )
      ( MAKE-14PILE ?auto_796514 ?auto_796515 ?auto_796516 ?auto_796517 ?auto_796518 ?auto_796519 ?auto_796520 ?auto_796521 ?auto_796522 ?auto_796523 ?auto_796524 ?auto_796525 ?auto_796526 ?auto_796527 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_796572 - BLOCK
      ?auto_796573 - BLOCK
      ?auto_796574 - BLOCK
      ?auto_796575 - BLOCK
      ?auto_796576 - BLOCK
      ?auto_796577 - BLOCK
      ?auto_796578 - BLOCK
      ?auto_796579 - BLOCK
      ?auto_796580 - BLOCK
      ?auto_796581 - BLOCK
      ?auto_796582 - BLOCK
      ?auto_796583 - BLOCK
      ?auto_796584 - BLOCK
      ?auto_796585 - BLOCK
    )
    :vars
    (
      ?auto_796586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_796585 ?auto_796586 ) ( ON-TABLE ?auto_796572 ) ( ON ?auto_796573 ?auto_796572 ) ( not ( = ?auto_796572 ?auto_796573 ) ) ( not ( = ?auto_796572 ?auto_796574 ) ) ( not ( = ?auto_796572 ?auto_796575 ) ) ( not ( = ?auto_796572 ?auto_796576 ) ) ( not ( = ?auto_796572 ?auto_796577 ) ) ( not ( = ?auto_796572 ?auto_796578 ) ) ( not ( = ?auto_796572 ?auto_796579 ) ) ( not ( = ?auto_796572 ?auto_796580 ) ) ( not ( = ?auto_796572 ?auto_796581 ) ) ( not ( = ?auto_796572 ?auto_796582 ) ) ( not ( = ?auto_796572 ?auto_796583 ) ) ( not ( = ?auto_796572 ?auto_796584 ) ) ( not ( = ?auto_796572 ?auto_796585 ) ) ( not ( = ?auto_796572 ?auto_796586 ) ) ( not ( = ?auto_796573 ?auto_796574 ) ) ( not ( = ?auto_796573 ?auto_796575 ) ) ( not ( = ?auto_796573 ?auto_796576 ) ) ( not ( = ?auto_796573 ?auto_796577 ) ) ( not ( = ?auto_796573 ?auto_796578 ) ) ( not ( = ?auto_796573 ?auto_796579 ) ) ( not ( = ?auto_796573 ?auto_796580 ) ) ( not ( = ?auto_796573 ?auto_796581 ) ) ( not ( = ?auto_796573 ?auto_796582 ) ) ( not ( = ?auto_796573 ?auto_796583 ) ) ( not ( = ?auto_796573 ?auto_796584 ) ) ( not ( = ?auto_796573 ?auto_796585 ) ) ( not ( = ?auto_796573 ?auto_796586 ) ) ( not ( = ?auto_796574 ?auto_796575 ) ) ( not ( = ?auto_796574 ?auto_796576 ) ) ( not ( = ?auto_796574 ?auto_796577 ) ) ( not ( = ?auto_796574 ?auto_796578 ) ) ( not ( = ?auto_796574 ?auto_796579 ) ) ( not ( = ?auto_796574 ?auto_796580 ) ) ( not ( = ?auto_796574 ?auto_796581 ) ) ( not ( = ?auto_796574 ?auto_796582 ) ) ( not ( = ?auto_796574 ?auto_796583 ) ) ( not ( = ?auto_796574 ?auto_796584 ) ) ( not ( = ?auto_796574 ?auto_796585 ) ) ( not ( = ?auto_796574 ?auto_796586 ) ) ( not ( = ?auto_796575 ?auto_796576 ) ) ( not ( = ?auto_796575 ?auto_796577 ) ) ( not ( = ?auto_796575 ?auto_796578 ) ) ( not ( = ?auto_796575 ?auto_796579 ) ) ( not ( = ?auto_796575 ?auto_796580 ) ) ( not ( = ?auto_796575 ?auto_796581 ) ) ( not ( = ?auto_796575 ?auto_796582 ) ) ( not ( = ?auto_796575 ?auto_796583 ) ) ( not ( = ?auto_796575 ?auto_796584 ) ) ( not ( = ?auto_796575 ?auto_796585 ) ) ( not ( = ?auto_796575 ?auto_796586 ) ) ( not ( = ?auto_796576 ?auto_796577 ) ) ( not ( = ?auto_796576 ?auto_796578 ) ) ( not ( = ?auto_796576 ?auto_796579 ) ) ( not ( = ?auto_796576 ?auto_796580 ) ) ( not ( = ?auto_796576 ?auto_796581 ) ) ( not ( = ?auto_796576 ?auto_796582 ) ) ( not ( = ?auto_796576 ?auto_796583 ) ) ( not ( = ?auto_796576 ?auto_796584 ) ) ( not ( = ?auto_796576 ?auto_796585 ) ) ( not ( = ?auto_796576 ?auto_796586 ) ) ( not ( = ?auto_796577 ?auto_796578 ) ) ( not ( = ?auto_796577 ?auto_796579 ) ) ( not ( = ?auto_796577 ?auto_796580 ) ) ( not ( = ?auto_796577 ?auto_796581 ) ) ( not ( = ?auto_796577 ?auto_796582 ) ) ( not ( = ?auto_796577 ?auto_796583 ) ) ( not ( = ?auto_796577 ?auto_796584 ) ) ( not ( = ?auto_796577 ?auto_796585 ) ) ( not ( = ?auto_796577 ?auto_796586 ) ) ( not ( = ?auto_796578 ?auto_796579 ) ) ( not ( = ?auto_796578 ?auto_796580 ) ) ( not ( = ?auto_796578 ?auto_796581 ) ) ( not ( = ?auto_796578 ?auto_796582 ) ) ( not ( = ?auto_796578 ?auto_796583 ) ) ( not ( = ?auto_796578 ?auto_796584 ) ) ( not ( = ?auto_796578 ?auto_796585 ) ) ( not ( = ?auto_796578 ?auto_796586 ) ) ( not ( = ?auto_796579 ?auto_796580 ) ) ( not ( = ?auto_796579 ?auto_796581 ) ) ( not ( = ?auto_796579 ?auto_796582 ) ) ( not ( = ?auto_796579 ?auto_796583 ) ) ( not ( = ?auto_796579 ?auto_796584 ) ) ( not ( = ?auto_796579 ?auto_796585 ) ) ( not ( = ?auto_796579 ?auto_796586 ) ) ( not ( = ?auto_796580 ?auto_796581 ) ) ( not ( = ?auto_796580 ?auto_796582 ) ) ( not ( = ?auto_796580 ?auto_796583 ) ) ( not ( = ?auto_796580 ?auto_796584 ) ) ( not ( = ?auto_796580 ?auto_796585 ) ) ( not ( = ?auto_796580 ?auto_796586 ) ) ( not ( = ?auto_796581 ?auto_796582 ) ) ( not ( = ?auto_796581 ?auto_796583 ) ) ( not ( = ?auto_796581 ?auto_796584 ) ) ( not ( = ?auto_796581 ?auto_796585 ) ) ( not ( = ?auto_796581 ?auto_796586 ) ) ( not ( = ?auto_796582 ?auto_796583 ) ) ( not ( = ?auto_796582 ?auto_796584 ) ) ( not ( = ?auto_796582 ?auto_796585 ) ) ( not ( = ?auto_796582 ?auto_796586 ) ) ( not ( = ?auto_796583 ?auto_796584 ) ) ( not ( = ?auto_796583 ?auto_796585 ) ) ( not ( = ?auto_796583 ?auto_796586 ) ) ( not ( = ?auto_796584 ?auto_796585 ) ) ( not ( = ?auto_796584 ?auto_796586 ) ) ( not ( = ?auto_796585 ?auto_796586 ) ) ( ON ?auto_796584 ?auto_796585 ) ( ON ?auto_796583 ?auto_796584 ) ( ON ?auto_796582 ?auto_796583 ) ( ON ?auto_796581 ?auto_796582 ) ( ON ?auto_796580 ?auto_796581 ) ( ON ?auto_796579 ?auto_796580 ) ( ON ?auto_796578 ?auto_796579 ) ( ON ?auto_796577 ?auto_796578 ) ( ON ?auto_796576 ?auto_796577 ) ( ON ?auto_796575 ?auto_796576 ) ( CLEAR ?auto_796573 ) ( ON ?auto_796574 ?auto_796575 ) ( CLEAR ?auto_796574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_796572 ?auto_796573 ?auto_796574 )
      ( MAKE-14PILE ?auto_796572 ?auto_796573 ?auto_796574 ?auto_796575 ?auto_796576 ?auto_796577 ?auto_796578 ?auto_796579 ?auto_796580 ?auto_796581 ?auto_796582 ?auto_796583 ?auto_796584 ?auto_796585 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_796630 - BLOCK
      ?auto_796631 - BLOCK
      ?auto_796632 - BLOCK
      ?auto_796633 - BLOCK
      ?auto_796634 - BLOCK
      ?auto_796635 - BLOCK
      ?auto_796636 - BLOCK
      ?auto_796637 - BLOCK
      ?auto_796638 - BLOCK
      ?auto_796639 - BLOCK
      ?auto_796640 - BLOCK
      ?auto_796641 - BLOCK
      ?auto_796642 - BLOCK
      ?auto_796643 - BLOCK
    )
    :vars
    (
      ?auto_796644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_796643 ?auto_796644 ) ( ON-TABLE ?auto_796630 ) ( not ( = ?auto_796630 ?auto_796631 ) ) ( not ( = ?auto_796630 ?auto_796632 ) ) ( not ( = ?auto_796630 ?auto_796633 ) ) ( not ( = ?auto_796630 ?auto_796634 ) ) ( not ( = ?auto_796630 ?auto_796635 ) ) ( not ( = ?auto_796630 ?auto_796636 ) ) ( not ( = ?auto_796630 ?auto_796637 ) ) ( not ( = ?auto_796630 ?auto_796638 ) ) ( not ( = ?auto_796630 ?auto_796639 ) ) ( not ( = ?auto_796630 ?auto_796640 ) ) ( not ( = ?auto_796630 ?auto_796641 ) ) ( not ( = ?auto_796630 ?auto_796642 ) ) ( not ( = ?auto_796630 ?auto_796643 ) ) ( not ( = ?auto_796630 ?auto_796644 ) ) ( not ( = ?auto_796631 ?auto_796632 ) ) ( not ( = ?auto_796631 ?auto_796633 ) ) ( not ( = ?auto_796631 ?auto_796634 ) ) ( not ( = ?auto_796631 ?auto_796635 ) ) ( not ( = ?auto_796631 ?auto_796636 ) ) ( not ( = ?auto_796631 ?auto_796637 ) ) ( not ( = ?auto_796631 ?auto_796638 ) ) ( not ( = ?auto_796631 ?auto_796639 ) ) ( not ( = ?auto_796631 ?auto_796640 ) ) ( not ( = ?auto_796631 ?auto_796641 ) ) ( not ( = ?auto_796631 ?auto_796642 ) ) ( not ( = ?auto_796631 ?auto_796643 ) ) ( not ( = ?auto_796631 ?auto_796644 ) ) ( not ( = ?auto_796632 ?auto_796633 ) ) ( not ( = ?auto_796632 ?auto_796634 ) ) ( not ( = ?auto_796632 ?auto_796635 ) ) ( not ( = ?auto_796632 ?auto_796636 ) ) ( not ( = ?auto_796632 ?auto_796637 ) ) ( not ( = ?auto_796632 ?auto_796638 ) ) ( not ( = ?auto_796632 ?auto_796639 ) ) ( not ( = ?auto_796632 ?auto_796640 ) ) ( not ( = ?auto_796632 ?auto_796641 ) ) ( not ( = ?auto_796632 ?auto_796642 ) ) ( not ( = ?auto_796632 ?auto_796643 ) ) ( not ( = ?auto_796632 ?auto_796644 ) ) ( not ( = ?auto_796633 ?auto_796634 ) ) ( not ( = ?auto_796633 ?auto_796635 ) ) ( not ( = ?auto_796633 ?auto_796636 ) ) ( not ( = ?auto_796633 ?auto_796637 ) ) ( not ( = ?auto_796633 ?auto_796638 ) ) ( not ( = ?auto_796633 ?auto_796639 ) ) ( not ( = ?auto_796633 ?auto_796640 ) ) ( not ( = ?auto_796633 ?auto_796641 ) ) ( not ( = ?auto_796633 ?auto_796642 ) ) ( not ( = ?auto_796633 ?auto_796643 ) ) ( not ( = ?auto_796633 ?auto_796644 ) ) ( not ( = ?auto_796634 ?auto_796635 ) ) ( not ( = ?auto_796634 ?auto_796636 ) ) ( not ( = ?auto_796634 ?auto_796637 ) ) ( not ( = ?auto_796634 ?auto_796638 ) ) ( not ( = ?auto_796634 ?auto_796639 ) ) ( not ( = ?auto_796634 ?auto_796640 ) ) ( not ( = ?auto_796634 ?auto_796641 ) ) ( not ( = ?auto_796634 ?auto_796642 ) ) ( not ( = ?auto_796634 ?auto_796643 ) ) ( not ( = ?auto_796634 ?auto_796644 ) ) ( not ( = ?auto_796635 ?auto_796636 ) ) ( not ( = ?auto_796635 ?auto_796637 ) ) ( not ( = ?auto_796635 ?auto_796638 ) ) ( not ( = ?auto_796635 ?auto_796639 ) ) ( not ( = ?auto_796635 ?auto_796640 ) ) ( not ( = ?auto_796635 ?auto_796641 ) ) ( not ( = ?auto_796635 ?auto_796642 ) ) ( not ( = ?auto_796635 ?auto_796643 ) ) ( not ( = ?auto_796635 ?auto_796644 ) ) ( not ( = ?auto_796636 ?auto_796637 ) ) ( not ( = ?auto_796636 ?auto_796638 ) ) ( not ( = ?auto_796636 ?auto_796639 ) ) ( not ( = ?auto_796636 ?auto_796640 ) ) ( not ( = ?auto_796636 ?auto_796641 ) ) ( not ( = ?auto_796636 ?auto_796642 ) ) ( not ( = ?auto_796636 ?auto_796643 ) ) ( not ( = ?auto_796636 ?auto_796644 ) ) ( not ( = ?auto_796637 ?auto_796638 ) ) ( not ( = ?auto_796637 ?auto_796639 ) ) ( not ( = ?auto_796637 ?auto_796640 ) ) ( not ( = ?auto_796637 ?auto_796641 ) ) ( not ( = ?auto_796637 ?auto_796642 ) ) ( not ( = ?auto_796637 ?auto_796643 ) ) ( not ( = ?auto_796637 ?auto_796644 ) ) ( not ( = ?auto_796638 ?auto_796639 ) ) ( not ( = ?auto_796638 ?auto_796640 ) ) ( not ( = ?auto_796638 ?auto_796641 ) ) ( not ( = ?auto_796638 ?auto_796642 ) ) ( not ( = ?auto_796638 ?auto_796643 ) ) ( not ( = ?auto_796638 ?auto_796644 ) ) ( not ( = ?auto_796639 ?auto_796640 ) ) ( not ( = ?auto_796639 ?auto_796641 ) ) ( not ( = ?auto_796639 ?auto_796642 ) ) ( not ( = ?auto_796639 ?auto_796643 ) ) ( not ( = ?auto_796639 ?auto_796644 ) ) ( not ( = ?auto_796640 ?auto_796641 ) ) ( not ( = ?auto_796640 ?auto_796642 ) ) ( not ( = ?auto_796640 ?auto_796643 ) ) ( not ( = ?auto_796640 ?auto_796644 ) ) ( not ( = ?auto_796641 ?auto_796642 ) ) ( not ( = ?auto_796641 ?auto_796643 ) ) ( not ( = ?auto_796641 ?auto_796644 ) ) ( not ( = ?auto_796642 ?auto_796643 ) ) ( not ( = ?auto_796642 ?auto_796644 ) ) ( not ( = ?auto_796643 ?auto_796644 ) ) ( ON ?auto_796642 ?auto_796643 ) ( ON ?auto_796641 ?auto_796642 ) ( ON ?auto_796640 ?auto_796641 ) ( ON ?auto_796639 ?auto_796640 ) ( ON ?auto_796638 ?auto_796639 ) ( ON ?auto_796637 ?auto_796638 ) ( ON ?auto_796636 ?auto_796637 ) ( ON ?auto_796635 ?auto_796636 ) ( ON ?auto_796634 ?auto_796635 ) ( ON ?auto_796633 ?auto_796634 ) ( ON ?auto_796632 ?auto_796633 ) ( CLEAR ?auto_796630 ) ( ON ?auto_796631 ?auto_796632 ) ( CLEAR ?auto_796631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_796630 ?auto_796631 )
      ( MAKE-14PILE ?auto_796630 ?auto_796631 ?auto_796632 ?auto_796633 ?auto_796634 ?auto_796635 ?auto_796636 ?auto_796637 ?auto_796638 ?auto_796639 ?auto_796640 ?auto_796641 ?auto_796642 ?auto_796643 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_796688 - BLOCK
      ?auto_796689 - BLOCK
      ?auto_796690 - BLOCK
      ?auto_796691 - BLOCK
      ?auto_796692 - BLOCK
      ?auto_796693 - BLOCK
      ?auto_796694 - BLOCK
      ?auto_796695 - BLOCK
      ?auto_796696 - BLOCK
      ?auto_796697 - BLOCK
      ?auto_796698 - BLOCK
      ?auto_796699 - BLOCK
      ?auto_796700 - BLOCK
      ?auto_796701 - BLOCK
    )
    :vars
    (
      ?auto_796702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_796701 ?auto_796702 ) ( not ( = ?auto_796688 ?auto_796689 ) ) ( not ( = ?auto_796688 ?auto_796690 ) ) ( not ( = ?auto_796688 ?auto_796691 ) ) ( not ( = ?auto_796688 ?auto_796692 ) ) ( not ( = ?auto_796688 ?auto_796693 ) ) ( not ( = ?auto_796688 ?auto_796694 ) ) ( not ( = ?auto_796688 ?auto_796695 ) ) ( not ( = ?auto_796688 ?auto_796696 ) ) ( not ( = ?auto_796688 ?auto_796697 ) ) ( not ( = ?auto_796688 ?auto_796698 ) ) ( not ( = ?auto_796688 ?auto_796699 ) ) ( not ( = ?auto_796688 ?auto_796700 ) ) ( not ( = ?auto_796688 ?auto_796701 ) ) ( not ( = ?auto_796688 ?auto_796702 ) ) ( not ( = ?auto_796689 ?auto_796690 ) ) ( not ( = ?auto_796689 ?auto_796691 ) ) ( not ( = ?auto_796689 ?auto_796692 ) ) ( not ( = ?auto_796689 ?auto_796693 ) ) ( not ( = ?auto_796689 ?auto_796694 ) ) ( not ( = ?auto_796689 ?auto_796695 ) ) ( not ( = ?auto_796689 ?auto_796696 ) ) ( not ( = ?auto_796689 ?auto_796697 ) ) ( not ( = ?auto_796689 ?auto_796698 ) ) ( not ( = ?auto_796689 ?auto_796699 ) ) ( not ( = ?auto_796689 ?auto_796700 ) ) ( not ( = ?auto_796689 ?auto_796701 ) ) ( not ( = ?auto_796689 ?auto_796702 ) ) ( not ( = ?auto_796690 ?auto_796691 ) ) ( not ( = ?auto_796690 ?auto_796692 ) ) ( not ( = ?auto_796690 ?auto_796693 ) ) ( not ( = ?auto_796690 ?auto_796694 ) ) ( not ( = ?auto_796690 ?auto_796695 ) ) ( not ( = ?auto_796690 ?auto_796696 ) ) ( not ( = ?auto_796690 ?auto_796697 ) ) ( not ( = ?auto_796690 ?auto_796698 ) ) ( not ( = ?auto_796690 ?auto_796699 ) ) ( not ( = ?auto_796690 ?auto_796700 ) ) ( not ( = ?auto_796690 ?auto_796701 ) ) ( not ( = ?auto_796690 ?auto_796702 ) ) ( not ( = ?auto_796691 ?auto_796692 ) ) ( not ( = ?auto_796691 ?auto_796693 ) ) ( not ( = ?auto_796691 ?auto_796694 ) ) ( not ( = ?auto_796691 ?auto_796695 ) ) ( not ( = ?auto_796691 ?auto_796696 ) ) ( not ( = ?auto_796691 ?auto_796697 ) ) ( not ( = ?auto_796691 ?auto_796698 ) ) ( not ( = ?auto_796691 ?auto_796699 ) ) ( not ( = ?auto_796691 ?auto_796700 ) ) ( not ( = ?auto_796691 ?auto_796701 ) ) ( not ( = ?auto_796691 ?auto_796702 ) ) ( not ( = ?auto_796692 ?auto_796693 ) ) ( not ( = ?auto_796692 ?auto_796694 ) ) ( not ( = ?auto_796692 ?auto_796695 ) ) ( not ( = ?auto_796692 ?auto_796696 ) ) ( not ( = ?auto_796692 ?auto_796697 ) ) ( not ( = ?auto_796692 ?auto_796698 ) ) ( not ( = ?auto_796692 ?auto_796699 ) ) ( not ( = ?auto_796692 ?auto_796700 ) ) ( not ( = ?auto_796692 ?auto_796701 ) ) ( not ( = ?auto_796692 ?auto_796702 ) ) ( not ( = ?auto_796693 ?auto_796694 ) ) ( not ( = ?auto_796693 ?auto_796695 ) ) ( not ( = ?auto_796693 ?auto_796696 ) ) ( not ( = ?auto_796693 ?auto_796697 ) ) ( not ( = ?auto_796693 ?auto_796698 ) ) ( not ( = ?auto_796693 ?auto_796699 ) ) ( not ( = ?auto_796693 ?auto_796700 ) ) ( not ( = ?auto_796693 ?auto_796701 ) ) ( not ( = ?auto_796693 ?auto_796702 ) ) ( not ( = ?auto_796694 ?auto_796695 ) ) ( not ( = ?auto_796694 ?auto_796696 ) ) ( not ( = ?auto_796694 ?auto_796697 ) ) ( not ( = ?auto_796694 ?auto_796698 ) ) ( not ( = ?auto_796694 ?auto_796699 ) ) ( not ( = ?auto_796694 ?auto_796700 ) ) ( not ( = ?auto_796694 ?auto_796701 ) ) ( not ( = ?auto_796694 ?auto_796702 ) ) ( not ( = ?auto_796695 ?auto_796696 ) ) ( not ( = ?auto_796695 ?auto_796697 ) ) ( not ( = ?auto_796695 ?auto_796698 ) ) ( not ( = ?auto_796695 ?auto_796699 ) ) ( not ( = ?auto_796695 ?auto_796700 ) ) ( not ( = ?auto_796695 ?auto_796701 ) ) ( not ( = ?auto_796695 ?auto_796702 ) ) ( not ( = ?auto_796696 ?auto_796697 ) ) ( not ( = ?auto_796696 ?auto_796698 ) ) ( not ( = ?auto_796696 ?auto_796699 ) ) ( not ( = ?auto_796696 ?auto_796700 ) ) ( not ( = ?auto_796696 ?auto_796701 ) ) ( not ( = ?auto_796696 ?auto_796702 ) ) ( not ( = ?auto_796697 ?auto_796698 ) ) ( not ( = ?auto_796697 ?auto_796699 ) ) ( not ( = ?auto_796697 ?auto_796700 ) ) ( not ( = ?auto_796697 ?auto_796701 ) ) ( not ( = ?auto_796697 ?auto_796702 ) ) ( not ( = ?auto_796698 ?auto_796699 ) ) ( not ( = ?auto_796698 ?auto_796700 ) ) ( not ( = ?auto_796698 ?auto_796701 ) ) ( not ( = ?auto_796698 ?auto_796702 ) ) ( not ( = ?auto_796699 ?auto_796700 ) ) ( not ( = ?auto_796699 ?auto_796701 ) ) ( not ( = ?auto_796699 ?auto_796702 ) ) ( not ( = ?auto_796700 ?auto_796701 ) ) ( not ( = ?auto_796700 ?auto_796702 ) ) ( not ( = ?auto_796701 ?auto_796702 ) ) ( ON ?auto_796700 ?auto_796701 ) ( ON ?auto_796699 ?auto_796700 ) ( ON ?auto_796698 ?auto_796699 ) ( ON ?auto_796697 ?auto_796698 ) ( ON ?auto_796696 ?auto_796697 ) ( ON ?auto_796695 ?auto_796696 ) ( ON ?auto_796694 ?auto_796695 ) ( ON ?auto_796693 ?auto_796694 ) ( ON ?auto_796692 ?auto_796693 ) ( ON ?auto_796691 ?auto_796692 ) ( ON ?auto_796690 ?auto_796691 ) ( ON ?auto_796689 ?auto_796690 ) ( ON ?auto_796688 ?auto_796689 ) ( CLEAR ?auto_796688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_796688 )
      ( MAKE-14PILE ?auto_796688 ?auto_796689 ?auto_796690 ?auto_796691 ?auto_796692 ?auto_796693 ?auto_796694 ?auto_796695 ?auto_796696 ?auto_796697 ?auto_796698 ?auto_796699 ?auto_796700 ?auto_796701 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_796747 - BLOCK
      ?auto_796748 - BLOCK
      ?auto_796749 - BLOCK
      ?auto_796750 - BLOCK
      ?auto_796751 - BLOCK
      ?auto_796752 - BLOCK
      ?auto_796753 - BLOCK
      ?auto_796754 - BLOCK
      ?auto_796755 - BLOCK
      ?auto_796756 - BLOCK
      ?auto_796757 - BLOCK
      ?auto_796758 - BLOCK
      ?auto_796759 - BLOCK
      ?auto_796760 - BLOCK
      ?auto_796761 - BLOCK
    )
    :vars
    (
      ?auto_796762 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_796760 ) ( ON ?auto_796761 ?auto_796762 ) ( CLEAR ?auto_796761 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_796747 ) ( ON ?auto_796748 ?auto_796747 ) ( ON ?auto_796749 ?auto_796748 ) ( ON ?auto_796750 ?auto_796749 ) ( ON ?auto_796751 ?auto_796750 ) ( ON ?auto_796752 ?auto_796751 ) ( ON ?auto_796753 ?auto_796752 ) ( ON ?auto_796754 ?auto_796753 ) ( ON ?auto_796755 ?auto_796754 ) ( ON ?auto_796756 ?auto_796755 ) ( ON ?auto_796757 ?auto_796756 ) ( ON ?auto_796758 ?auto_796757 ) ( ON ?auto_796759 ?auto_796758 ) ( ON ?auto_796760 ?auto_796759 ) ( not ( = ?auto_796747 ?auto_796748 ) ) ( not ( = ?auto_796747 ?auto_796749 ) ) ( not ( = ?auto_796747 ?auto_796750 ) ) ( not ( = ?auto_796747 ?auto_796751 ) ) ( not ( = ?auto_796747 ?auto_796752 ) ) ( not ( = ?auto_796747 ?auto_796753 ) ) ( not ( = ?auto_796747 ?auto_796754 ) ) ( not ( = ?auto_796747 ?auto_796755 ) ) ( not ( = ?auto_796747 ?auto_796756 ) ) ( not ( = ?auto_796747 ?auto_796757 ) ) ( not ( = ?auto_796747 ?auto_796758 ) ) ( not ( = ?auto_796747 ?auto_796759 ) ) ( not ( = ?auto_796747 ?auto_796760 ) ) ( not ( = ?auto_796747 ?auto_796761 ) ) ( not ( = ?auto_796747 ?auto_796762 ) ) ( not ( = ?auto_796748 ?auto_796749 ) ) ( not ( = ?auto_796748 ?auto_796750 ) ) ( not ( = ?auto_796748 ?auto_796751 ) ) ( not ( = ?auto_796748 ?auto_796752 ) ) ( not ( = ?auto_796748 ?auto_796753 ) ) ( not ( = ?auto_796748 ?auto_796754 ) ) ( not ( = ?auto_796748 ?auto_796755 ) ) ( not ( = ?auto_796748 ?auto_796756 ) ) ( not ( = ?auto_796748 ?auto_796757 ) ) ( not ( = ?auto_796748 ?auto_796758 ) ) ( not ( = ?auto_796748 ?auto_796759 ) ) ( not ( = ?auto_796748 ?auto_796760 ) ) ( not ( = ?auto_796748 ?auto_796761 ) ) ( not ( = ?auto_796748 ?auto_796762 ) ) ( not ( = ?auto_796749 ?auto_796750 ) ) ( not ( = ?auto_796749 ?auto_796751 ) ) ( not ( = ?auto_796749 ?auto_796752 ) ) ( not ( = ?auto_796749 ?auto_796753 ) ) ( not ( = ?auto_796749 ?auto_796754 ) ) ( not ( = ?auto_796749 ?auto_796755 ) ) ( not ( = ?auto_796749 ?auto_796756 ) ) ( not ( = ?auto_796749 ?auto_796757 ) ) ( not ( = ?auto_796749 ?auto_796758 ) ) ( not ( = ?auto_796749 ?auto_796759 ) ) ( not ( = ?auto_796749 ?auto_796760 ) ) ( not ( = ?auto_796749 ?auto_796761 ) ) ( not ( = ?auto_796749 ?auto_796762 ) ) ( not ( = ?auto_796750 ?auto_796751 ) ) ( not ( = ?auto_796750 ?auto_796752 ) ) ( not ( = ?auto_796750 ?auto_796753 ) ) ( not ( = ?auto_796750 ?auto_796754 ) ) ( not ( = ?auto_796750 ?auto_796755 ) ) ( not ( = ?auto_796750 ?auto_796756 ) ) ( not ( = ?auto_796750 ?auto_796757 ) ) ( not ( = ?auto_796750 ?auto_796758 ) ) ( not ( = ?auto_796750 ?auto_796759 ) ) ( not ( = ?auto_796750 ?auto_796760 ) ) ( not ( = ?auto_796750 ?auto_796761 ) ) ( not ( = ?auto_796750 ?auto_796762 ) ) ( not ( = ?auto_796751 ?auto_796752 ) ) ( not ( = ?auto_796751 ?auto_796753 ) ) ( not ( = ?auto_796751 ?auto_796754 ) ) ( not ( = ?auto_796751 ?auto_796755 ) ) ( not ( = ?auto_796751 ?auto_796756 ) ) ( not ( = ?auto_796751 ?auto_796757 ) ) ( not ( = ?auto_796751 ?auto_796758 ) ) ( not ( = ?auto_796751 ?auto_796759 ) ) ( not ( = ?auto_796751 ?auto_796760 ) ) ( not ( = ?auto_796751 ?auto_796761 ) ) ( not ( = ?auto_796751 ?auto_796762 ) ) ( not ( = ?auto_796752 ?auto_796753 ) ) ( not ( = ?auto_796752 ?auto_796754 ) ) ( not ( = ?auto_796752 ?auto_796755 ) ) ( not ( = ?auto_796752 ?auto_796756 ) ) ( not ( = ?auto_796752 ?auto_796757 ) ) ( not ( = ?auto_796752 ?auto_796758 ) ) ( not ( = ?auto_796752 ?auto_796759 ) ) ( not ( = ?auto_796752 ?auto_796760 ) ) ( not ( = ?auto_796752 ?auto_796761 ) ) ( not ( = ?auto_796752 ?auto_796762 ) ) ( not ( = ?auto_796753 ?auto_796754 ) ) ( not ( = ?auto_796753 ?auto_796755 ) ) ( not ( = ?auto_796753 ?auto_796756 ) ) ( not ( = ?auto_796753 ?auto_796757 ) ) ( not ( = ?auto_796753 ?auto_796758 ) ) ( not ( = ?auto_796753 ?auto_796759 ) ) ( not ( = ?auto_796753 ?auto_796760 ) ) ( not ( = ?auto_796753 ?auto_796761 ) ) ( not ( = ?auto_796753 ?auto_796762 ) ) ( not ( = ?auto_796754 ?auto_796755 ) ) ( not ( = ?auto_796754 ?auto_796756 ) ) ( not ( = ?auto_796754 ?auto_796757 ) ) ( not ( = ?auto_796754 ?auto_796758 ) ) ( not ( = ?auto_796754 ?auto_796759 ) ) ( not ( = ?auto_796754 ?auto_796760 ) ) ( not ( = ?auto_796754 ?auto_796761 ) ) ( not ( = ?auto_796754 ?auto_796762 ) ) ( not ( = ?auto_796755 ?auto_796756 ) ) ( not ( = ?auto_796755 ?auto_796757 ) ) ( not ( = ?auto_796755 ?auto_796758 ) ) ( not ( = ?auto_796755 ?auto_796759 ) ) ( not ( = ?auto_796755 ?auto_796760 ) ) ( not ( = ?auto_796755 ?auto_796761 ) ) ( not ( = ?auto_796755 ?auto_796762 ) ) ( not ( = ?auto_796756 ?auto_796757 ) ) ( not ( = ?auto_796756 ?auto_796758 ) ) ( not ( = ?auto_796756 ?auto_796759 ) ) ( not ( = ?auto_796756 ?auto_796760 ) ) ( not ( = ?auto_796756 ?auto_796761 ) ) ( not ( = ?auto_796756 ?auto_796762 ) ) ( not ( = ?auto_796757 ?auto_796758 ) ) ( not ( = ?auto_796757 ?auto_796759 ) ) ( not ( = ?auto_796757 ?auto_796760 ) ) ( not ( = ?auto_796757 ?auto_796761 ) ) ( not ( = ?auto_796757 ?auto_796762 ) ) ( not ( = ?auto_796758 ?auto_796759 ) ) ( not ( = ?auto_796758 ?auto_796760 ) ) ( not ( = ?auto_796758 ?auto_796761 ) ) ( not ( = ?auto_796758 ?auto_796762 ) ) ( not ( = ?auto_796759 ?auto_796760 ) ) ( not ( = ?auto_796759 ?auto_796761 ) ) ( not ( = ?auto_796759 ?auto_796762 ) ) ( not ( = ?auto_796760 ?auto_796761 ) ) ( not ( = ?auto_796760 ?auto_796762 ) ) ( not ( = ?auto_796761 ?auto_796762 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_796761 ?auto_796762 )
      ( !STACK ?auto_796761 ?auto_796760 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_796809 - BLOCK
      ?auto_796810 - BLOCK
      ?auto_796811 - BLOCK
      ?auto_796812 - BLOCK
      ?auto_796813 - BLOCK
      ?auto_796814 - BLOCK
      ?auto_796815 - BLOCK
      ?auto_796816 - BLOCK
      ?auto_796817 - BLOCK
      ?auto_796818 - BLOCK
      ?auto_796819 - BLOCK
      ?auto_796820 - BLOCK
      ?auto_796821 - BLOCK
      ?auto_796822 - BLOCK
      ?auto_796823 - BLOCK
    )
    :vars
    (
      ?auto_796824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_796823 ?auto_796824 ) ( ON-TABLE ?auto_796809 ) ( ON ?auto_796810 ?auto_796809 ) ( ON ?auto_796811 ?auto_796810 ) ( ON ?auto_796812 ?auto_796811 ) ( ON ?auto_796813 ?auto_796812 ) ( ON ?auto_796814 ?auto_796813 ) ( ON ?auto_796815 ?auto_796814 ) ( ON ?auto_796816 ?auto_796815 ) ( ON ?auto_796817 ?auto_796816 ) ( ON ?auto_796818 ?auto_796817 ) ( ON ?auto_796819 ?auto_796818 ) ( ON ?auto_796820 ?auto_796819 ) ( ON ?auto_796821 ?auto_796820 ) ( not ( = ?auto_796809 ?auto_796810 ) ) ( not ( = ?auto_796809 ?auto_796811 ) ) ( not ( = ?auto_796809 ?auto_796812 ) ) ( not ( = ?auto_796809 ?auto_796813 ) ) ( not ( = ?auto_796809 ?auto_796814 ) ) ( not ( = ?auto_796809 ?auto_796815 ) ) ( not ( = ?auto_796809 ?auto_796816 ) ) ( not ( = ?auto_796809 ?auto_796817 ) ) ( not ( = ?auto_796809 ?auto_796818 ) ) ( not ( = ?auto_796809 ?auto_796819 ) ) ( not ( = ?auto_796809 ?auto_796820 ) ) ( not ( = ?auto_796809 ?auto_796821 ) ) ( not ( = ?auto_796809 ?auto_796822 ) ) ( not ( = ?auto_796809 ?auto_796823 ) ) ( not ( = ?auto_796809 ?auto_796824 ) ) ( not ( = ?auto_796810 ?auto_796811 ) ) ( not ( = ?auto_796810 ?auto_796812 ) ) ( not ( = ?auto_796810 ?auto_796813 ) ) ( not ( = ?auto_796810 ?auto_796814 ) ) ( not ( = ?auto_796810 ?auto_796815 ) ) ( not ( = ?auto_796810 ?auto_796816 ) ) ( not ( = ?auto_796810 ?auto_796817 ) ) ( not ( = ?auto_796810 ?auto_796818 ) ) ( not ( = ?auto_796810 ?auto_796819 ) ) ( not ( = ?auto_796810 ?auto_796820 ) ) ( not ( = ?auto_796810 ?auto_796821 ) ) ( not ( = ?auto_796810 ?auto_796822 ) ) ( not ( = ?auto_796810 ?auto_796823 ) ) ( not ( = ?auto_796810 ?auto_796824 ) ) ( not ( = ?auto_796811 ?auto_796812 ) ) ( not ( = ?auto_796811 ?auto_796813 ) ) ( not ( = ?auto_796811 ?auto_796814 ) ) ( not ( = ?auto_796811 ?auto_796815 ) ) ( not ( = ?auto_796811 ?auto_796816 ) ) ( not ( = ?auto_796811 ?auto_796817 ) ) ( not ( = ?auto_796811 ?auto_796818 ) ) ( not ( = ?auto_796811 ?auto_796819 ) ) ( not ( = ?auto_796811 ?auto_796820 ) ) ( not ( = ?auto_796811 ?auto_796821 ) ) ( not ( = ?auto_796811 ?auto_796822 ) ) ( not ( = ?auto_796811 ?auto_796823 ) ) ( not ( = ?auto_796811 ?auto_796824 ) ) ( not ( = ?auto_796812 ?auto_796813 ) ) ( not ( = ?auto_796812 ?auto_796814 ) ) ( not ( = ?auto_796812 ?auto_796815 ) ) ( not ( = ?auto_796812 ?auto_796816 ) ) ( not ( = ?auto_796812 ?auto_796817 ) ) ( not ( = ?auto_796812 ?auto_796818 ) ) ( not ( = ?auto_796812 ?auto_796819 ) ) ( not ( = ?auto_796812 ?auto_796820 ) ) ( not ( = ?auto_796812 ?auto_796821 ) ) ( not ( = ?auto_796812 ?auto_796822 ) ) ( not ( = ?auto_796812 ?auto_796823 ) ) ( not ( = ?auto_796812 ?auto_796824 ) ) ( not ( = ?auto_796813 ?auto_796814 ) ) ( not ( = ?auto_796813 ?auto_796815 ) ) ( not ( = ?auto_796813 ?auto_796816 ) ) ( not ( = ?auto_796813 ?auto_796817 ) ) ( not ( = ?auto_796813 ?auto_796818 ) ) ( not ( = ?auto_796813 ?auto_796819 ) ) ( not ( = ?auto_796813 ?auto_796820 ) ) ( not ( = ?auto_796813 ?auto_796821 ) ) ( not ( = ?auto_796813 ?auto_796822 ) ) ( not ( = ?auto_796813 ?auto_796823 ) ) ( not ( = ?auto_796813 ?auto_796824 ) ) ( not ( = ?auto_796814 ?auto_796815 ) ) ( not ( = ?auto_796814 ?auto_796816 ) ) ( not ( = ?auto_796814 ?auto_796817 ) ) ( not ( = ?auto_796814 ?auto_796818 ) ) ( not ( = ?auto_796814 ?auto_796819 ) ) ( not ( = ?auto_796814 ?auto_796820 ) ) ( not ( = ?auto_796814 ?auto_796821 ) ) ( not ( = ?auto_796814 ?auto_796822 ) ) ( not ( = ?auto_796814 ?auto_796823 ) ) ( not ( = ?auto_796814 ?auto_796824 ) ) ( not ( = ?auto_796815 ?auto_796816 ) ) ( not ( = ?auto_796815 ?auto_796817 ) ) ( not ( = ?auto_796815 ?auto_796818 ) ) ( not ( = ?auto_796815 ?auto_796819 ) ) ( not ( = ?auto_796815 ?auto_796820 ) ) ( not ( = ?auto_796815 ?auto_796821 ) ) ( not ( = ?auto_796815 ?auto_796822 ) ) ( not ( = ?auto_796815 ?auto_796823 ) ) ( not ( = ?auto_796815 ?auto_796824 ) ) ( not ( = ?auto_796816 ?auto_796817 ) ) ( not ( = ?auto_796816 ?auto_796818 ) ) ( not ( = ?auto_796816 ?auto_796819 ) ) ( not ( = ?auto_796816 ?auto_796820 ) ) ( not ( = ?auto_796816 ?auto_796821 ) ) ( not ( = ?auto_796816 ?auto_796822 ) ) ( not ( = ?auto_796816 ?auto_796823 ) ) ( not ( = ?auto_796816 ?auto_796824 ) ) ( not ( = ?auto_796817 ?auto_796818 ) ) ( not ( = ?auto_796817 ?auto_796819 ) ) ( not ( = ?auto_796817 ?auto_796820 ) ) ( not ( = ?auto_796817 ?auto_796821 ) ) ( not ( = ?auto_796817 ?auto_796822 ) ) ( not ( = ?auto_796817 ?auto_796823 ) ) ( not ( = ?auto_796817 ?auto_796824 ) ) ( not ( = ?auto_796818 ?auto_796819 ) ) ( not ( = ?auto_796818 ?auto_796820 ) ) ( not ( = ?auto_796818 ?auto_796821 ) ) ( not ( = ?auto_796818 ?auto_796822 ) ) ( not ( = ?auto_796818 ?auto_796823 ) ) ( not ( = ?auto_796818 ?auto_796824 ) ) ( not ( = ?auto_796819 ?auto_796820 ) ) ( not ( = ?auto_796819 ?auto_796821 ) ) ( not ( = ?auto_796819 ?auto_796822 ) ) ( not ( = ?auto_796819 ?auto_796823 ) ) ( not ( = ?auto_796819 ?auto_796824 ) ) ( not ( = ?auto_796820 ?auto_796821 ) ) ( not ( = ?auto_796820 ?auto_796822 ) ) ( not ( = ?auto_796820 ?auto_796823 ) ) ( not ( = ?auto_796820 ?auto_796824 ) ) ( not ( = ?auto_796821 ?auto_796822 ) ) ( not ( = ?auto_796821 ?auto_796823 ) ) ( not ( = ?auto_796821 ?auto_796824 ) ) ( not ( = ?auto_796822 ?auto_796823 ) ) ( not ( = ?auto_796822 ?auto_796824 ) ) ( not ( = ?auto_796823 ?auto_796824 ) ) ( CLEAR ?auto_796821 ) ( ON ?auto_796822 ?auto_796823 ) ( CLEAR ?auto_796822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_796809 ?auto_796810 ?auto_796811 ?auto_796812 ?auto_796813 ?auto_796814 ?auto_796815 ?auto_796816 ?auto_796817 ?auto_796818 ?auto_796819 ?auto_796820 ?auto_796821 ?auto_796822 )
      ( MAKE-15PILE ?auto_796809 ?auto_796810 ?auto_796811 ?auto_796812 ?auto_796813 ?auto_796814 ?auto_796815 ?auto_796816 ?auto_796817 ?auto_796818 ?auto_796819 ?auto_796820 ?auto_796821 ?auto_796822 ?auto_796823 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_796871 - BLOCK
      ?auto_796872 - BLOCK
      ?auto_796873 - BLOCK
      ?auto_796874 - BLOCK
      ?auto_796875 - BLOCK
      ?auto_796876 - BLOCK
      ?auto_796877 - BLOCK
      ?auto_796878 - BLOCK
      ?auto_796879 - BLOCK
      ?auto_796880 - BLOCK
      ?auto_796881 - BLOCK
      ?auto_796882 - BLOCK
      ?auto_796883 - BLOCK
      ?auto_796884 - BLOCK
      ?auto_796885 - BLOCK
    )
    :vars
    (
      ?auto_796886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_796885 ?auto_796886 ) ( ON-TABLE ?auto_796871 ) ( ON ?auto_796872 ?auto_796871 ) ( ON ?auto_796873 ?auto_796872 ) ( ON ?auto_796874 ?auto_796873 ) ( ON ?auto_796875 ?auto_796874 ) ( ON ?auto_796876 ?auto_796875 ) ( ON ?auto_796877 ?auto_796876 ) ( ON ?auto_796878 ?auto_796877 ) ( ON ?auto_796879 ?auto_796878 ) ( ON ?auto_796880 ?auto_796879 ) ( ON ?auto_796881 ?auto_796880 ) ( ON ?auto_796882 ?auto_796881 ) ( not ( = ?auto_796871 ?auto_796872 ) ) ( not ( = ?auto_796871 ?auto_796873 ) ) ( not ( = ?auto_796871 ?auto_796874 ) ) ( not ( = ?auto_796871 ?auto_796875 ) ) ( not ( = ?auto_796871 ?auto_796876 ) ) ( not ( = ?auto_796871 ?auto_796877 ) ) ( not ( = ?auto_796871 ?auto_796878 ) ) ( not ( = ?auto_796871 ?auto_796879 ) ) ( not ( = ?auto_796871 ?auto_796880 ) ) ( not ( = ?auto_796871 ?auto_796881 ) ) ( not ( = ?auto_796871 ?auto_796882 ) ) ( not ( = ?auto_796871 ?auto_796883 ) ) ( not ( = ?auto_796871 ?auto_796884 ) ) ( not ( = ?auto_796871 ?auto_796885 ) ) ( not ( = ?auto_796871 ?auto_796886 ) ) ( not ( = ?auto_796872 ?auto_796873 ) ) ( not ( = ?auto_796872 ?auto_796874 ) ) ( not ( = ?auto_796872 ?auto_796875 ) ) ( not ( = ?auto_796872 ?auto_796876 ) ) ( not ( = ?auto_796872 ?auto_796877 ) ) ( not ( = ?auto_796872 ?auto_796878 ) ) ( not ( = ?auto_796872 ?auto_796879 ) ) ( not ( = ?auto_796872 ?auto_796880 ) ) ( not ( = ?auto_796872 ?auto_796881 ) ) ( not ( = ?auto_796872 ?auto_796882 ) ) ( not ( = ?auto_796872 ?auto_796883 ) ) ( not ( = ?auto_796872 ?auto_796884 ) ) ( not ( = ?auto_796872 ?auto_796885 ) ) ( not ( = ?auto_796872 ?auto_796886 ) ) ( not ( = ?auto_796873 ?auto_796874 ) ) ( not ( = ?auto_796873 ?auto_796875 ) ) ( not ( = ?auto_796873 ?auto_796876 ) ) ( not ( = ?auto_796873 ?auto_796877 ) ) ( not ( = ?auto_796873 ?auto_796878 ) ) ( not ( = ?auto_796873 ?auto_796879 ) ) ( not ( = ?auto_796873 ?auto_796880 ) ) ( not ( = ?auto_796873 ?auto_796881 ) ) ( not ( = ?auto_796873 ?auto_796882 ) ) ( not ( = ?auto_796873 ?auto_796883 ) ) ( not ( = ?auto_796873 ?auto_796884 ) ) ( not ( = ?auto_796873 ?auto_796885 ) ) ( not ( = ?auto_796873 ?auto_796886 ) ) ( not ( = ?auto_796874 ?auto_796875 ) ) ( not ( = ?auto_796874 ?auto_796876 ) ) ( not ( = ?auto_796874 ?auto_796877 ) ) ( not ( = ?auto_796874 ?auto_796878 ) ) ( not ( = ?auto_796874 ?auto_796879 ) ) ( not ( = ?auto_796874 ?auto_796880 ) ) ( not ( = ?auto_796874 ?auto_796881 ) ) ( not ( = ?auto_796874 ?auto_796882 ) ) ( not ( = ?auto_796874 ?auto_796883 ) ) ( not ( = ?auto_796874 ?auto_796884 ) ) ( not ( = ?auto_796874 ?auto_796885 ) ) ( not ( = ?auto_796874 ?auto_796886 ) ) ( not ( = ?auto_796875 ?auto_796876 ) ) ( not ( = ?auto_796875 ?auto_796877 ) ) ( not ( = ?auto_796875 ?auto_796878 ) ) ( not ( = ?auto_796875 ?auto_796879 ) ) ( not ( = ?auto_796875 ?auto_796880 ) ) ( not ( = ?auto_796875 ?auto_796881 ) ) ( not ( = ?auto_796875 ?auto_796882 ) ) ( not ( = ?auto_796875 ?auto_796883 ) ) ( not ( = ?auto_796875 ?auto_796884 ) ) ( not ( = ?auto_796875 ?auto_796885 ) ) ( not ( = ?auto_796875 ?auto_796886 ) ) ( not ( = ?auto_796876 ?auto_796877 ) ) ( not ( = ?auto_796876 ?auto_796878 ) ) ( not ( = ?auto_796876 ?auto_796879 ) ) ( not ( = ?auto_796876 ?auto_796880 ) ) ( not ( = ?auto_796876 ?auto_796881 ) ) ( not ( = ?auto_796876 ?auto_796882 ) ) ( not ( = ?auto_796876 ?auto_796883 ) ) ( not ( = ?auto_796876 ?auto_796884 ) ) ( not ( = ?auto_796876 ?auto_796885 ) ) ( not ( = ?auto_796876 ?auto_796886 ) ) ( not ( = ?auto_796877 ?auto_796878 ) ) ( not ( = ?auto_796877 ?auto_796879 ) ) ( not ( = ?auto_796877 ?auto_796880 ) ) ( not ( = ?auto_796877 ?auto_796881 ) ) ( not ( = ?auto_796877 ?auto_796882 ) ) ( not ( = ?auto_796877 ?auto_796883 ) ) ( not ( = ?auto_796877 ?auto_796884 ) ) ( not ( = ?auto_796877 ?auto_796885 ) ) ( not ( = ?auto_796877 ?auto_796886 ) ) ( not ( = ?auto_796878 ?auto_796879 ) ) ( not ( = ?auto_796878 ?auto_796880 ) ) ( not ( = ?auto_796878 ?auto_796881 ) ) ( not ( = ?auto_796878 ?auto_796882 ) ) ( not ( = ?auto_796878 ?auto_796883 ) ) ( not ( = ?auto_796878 ?auto_796884 ) ) ( not ( = ?auto_796878 ?auto_796885 ) ) ( not ( = ?auto_796878 ?auto_796886 ) ) ( not ( = ?auto_796879 ?auto_796880 ) ) ( not ( = ?auto_796879 ?auto_796881 ) ) ( not ( = ?auto_796879 ?auto_796882 ) ) ( not ( = ?auto_796879 ?auto_796883 ) ) ( not ( = ?auto_796879 ?auto_796884 ) ) ( not ( = ?auto_796879 ?auto_796885 ) ) ( not ( = ?auto_796879 ?auto_796886 ) ) ( not ( = ?auto_796880 ?auto_796881 ) ) ( not ( = ?auto_796880 ?auto_796882 ) ) ( not ( = ?auto_796880 ?auto_796883 ) ) ( not ( = ?auto_796880 ?auto_796884 ) ) ( not ( = ?auto_796880 ?auto_796885 ) ) ( not ( = ?auto_796880 ?auto_796886 ) ) ( not ( = ?auto_796881 ?auto_796882 ) ) ( not ( = ?auto_796881 ?auto_796883 ) ) ( not ( = ?auto_796881 ?auto_796884 ) ) ( not ( = ?auto_796881 ?auto_796885 ) ) ( not ( = ?auto_796881 ?auto_796886 ) ) ( not ( = ?auto_796882 ?auto_796883 ) ) ( not ( = ?auto_796882 ?auto_796884 ) ) ( not ( = ?auto_796882 ?auto_796885 ) ) ( not ( = ?auto_796882 ?auto_796886 ) ) ( not ( = ?auto_796883 ?auto_796884 ) ) ( not ( = ?auto_796883 ?auto_796885 ) ) ( not ( = ?auto_796883 ?auto_796886 ) ) ( not ( = ?auto_796884 ?auto_796885 ) ) ( not ( = ?auto_796884 ?auto_796886 ) ) ( not ( = ?auto_796885 ?auto_796886 ) ) ( ON ?auto_796884 ?auto_796885 ) ( CLEAR ?auto_796882 ) ( ON ?auto_796883 ?auto_796884 ) ( CLEAR ?auto_796883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_796871 ?auto_796872 ?auto_796873 ?auto_796874 ?auto_796875 ?auto_796876 ?auto_796877 ?auto_796878 ?auto_796879 ?auto_796880 ?auto_796881 ?auto_796882 ?auto_796883 )
      ( MAKE-15PILE ?auto_796871 ?auto_796872 ?auto_796873 ?auto_796874 ?auto_796875 ?auto_796876 ?auto_796877 ?auto_796878 ?auto_796879 ?auto_796880 ?auto_796881 ?auto_796882 ?auto_796883 ?auto_796884 ?auto_796885 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_796933 - BLOCK
      ?auto_796934 - BLOCK
      ?auto_796935 - BLOCK
      ?auto_796936 - BLOCK
      ?auto_796937 - BLOCK
      ?auto_796938 - BLOCK
      ?auto_796939 - BLOCK
      ?auto_796940 - BLOCK
      ?auto_796941 - BLOCK
      ?auto_796942 - BLOCK
      ?auto_796943 - BLOCK
      ?auto_796944 - BLOCK
      ?auto_796945 - BLOCK
      ?auto_796946 - BLOCK
      ?auto_796947 - BLOCK
    )
    :vars
    (
      ?auto_796948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_796947 ?auto_796948 ) ( ON-TABLE ?auto_796933 ) ( ON ?auto_796934 ?auto_796933 ) ( ON ?auto_796935 ?auto_796934 ) ( ON ?auto_796936 ?auto_796935 ) ( ON ?auto_796937 ?auto_796936 ) ( ON ?auto_796938 ?auto_796937 ) ( ON ?auto_796939 ?auto_796938 ) ( ON ?auto_796940 ?auto_796939 ) ( ON ?auto_796941 ?auto_796940 ) ( ON ?auto_796942 ?auto_796941 ) ( ON ?auto_796943 ?auto_796942 ) ( not ( = ?auto_796933 ?auto_796934 ) ) ( not ( = ?auto_796933 ?auto_796935 ) ) ( not ( = ?auto_796933 ?auto_796936 ) ) ( not ( = ?auto_796933 ?auto_796937 ) ) ( not ( = ?auto_796933 ?auto_796938 ) ) ( not ( = ?auto_796933 ?auto_796939 ) ) ( not ( = ?auto_796933 ?auto_796940 ) ) ( not ( = ?auto_796933 ?auto_796941 ) ) ( not ( = ?auto_796933 ?auto_796942 ) ) ( not ( = ?auto_796933 ?auto_796943 ) ) ( not ( = ?auto_796933 ?auto_796944 ) ) ( not ( = ?auto_796933 ?auto_796945 ) ) ( not ( = ?auto_796933 ?auto_796946 ) ) ( not ( = ?auto_796933 ?auto_796947 ) ) ( not ( = ?auto_796933 ?auto_796948 ) ) ( not ( = ?auto_796934 ?auto_796935 ) ) ( not ( = ?auto_796934 ?auto_796936 ) ) ( not ( = ?auto_796934 ?auto_796937 ) ) ( not ( = ?auto_796934 ?auto_796938 ) ) ( not ( = ?auto_796934 ?auto_796939 ) ) ( not ( = ?auto_796934 ?auto_796940 ) ) ( not ( = ?auto_796934 ?auto_796941 ) ) ( not ( = ?auto_796934 ?auto_796942 ) ) ( not ( = ?auto_796934 ?auto_796943 ) ) ( not ( = ?auto_796934 ?auto_796944 ) ) ( not ( = ?auto_796934 ?auto_796945 ) ) ( not ( = ?auto_796934 ?auto_796946 ) ) ( not ( = ?auto_796934 ?auto_796947 ) ) ( not ( = ?auto_796934 ?auto_796948 ) ) ( not ( = ?auto_796935 ?auto_796936 ) ) ( not ( = ?auto_796935 ?auto_796937 ) ) ( not ( = ?auto_796935 ?auto_796938 ) ) ( not ( = ?auto_796935 ?auto_796939 ) ) ( not ( = ?auto_796935 ?auto_796940 ) ) ( not ( = ?auto_796935 ?auto_796941 ) ) ( not ( = ?auto_796935 ?auto_796942 ) ) ( not ( = ?auto_796935 ?auto_796943 ) ) ( not ( = ?auto_796935 ?auto_796944 ) ) ( not ( = ?auto_796935 ?auto_796945 ) ) ( not ( = ?auto_796935 ?auto_796946 ) ) ( not ( = ?auto_796935 ?auto_796947 ) ) ( not ( = ?auto_796935 ?auto_796948 ) ) ( not ( = ?auto_796936 ?auto_796937 ) ) ( not ( = ?auto_796936 ?auto_796938 ) ) ( not ( = ?auto_796936 ?auto_796939 ) ) ( not ( = ?auto_796936 ?auto_796940 ) ) ( not ( = ?auto_796936 ?auto_796941 ) ) ( not ( = ?auto_796936 ?auto_796942 ) ) ( not ( = ?auto_796936 ?auto_796943 ) ) ( not ( = ?auto_796936 ?auto_796944 ) ) ( not ( = ?auto_796936 ?auto_796945 ) ) ( not ( = ?auto_796936 ?auto_796946 ) ) ( not ( = ?auto_796936 ?auto_796947 ) ) ( not ( = ?auto_796936 ?auto_796948 ) ) ( not ( = ?auto_796937 ?auto_796938 ) ) ( not ( = ?auto_796937 ?auto_796939 ) ) ( not ( = ?auto_796937 ?auto_796940 ) ) ( not ( = ?auto_796937 ?auto_796941 ) ) ( not ( = ?auto_796937 ?auto_796942 ) ) ( not ( = ?auto_796937 ?auto_796943 ) ) ( not ( = ?auto_796937 ?auto_796944 ) ) ( not ( = ?auto_796937 ?auto_796945 ) ) ( not ( = ?auto_796937 ?auto_796946 ) ) ( not ( = ?auto_796937 ?auto_796947 ) ) ( not ( = ?auto_796937 ?auto_796948 ) ) ( not ( = ?auto_796938 ?auto_796939 ) ) ( not ( = ?auto_796938 ?auto_796940 ) ) ( not ( = ?auto_796938 ?auto_796941 ) ) ( not ( = ?auto_796938 ?auto_796942 ) ) ( not ( = ?auto_796938 ?auto_796943 ) ) ( not ( = ?auto_796938 ?auto_796944 ) ) ( not ( = ?auto_796938 ?auto_796945 ) ) ( not ( = ?auto_796938 ?auto_796946 ) ) ( not ( = ?auto_796938 ?auto_796947 ) ) ( not ( = ?auto_796938 ?auto_796948 ) ) ( not ( = ?auto_796939 ?auto_796940 ) ) ( not ( = ?auto_796939 ?auto_796941 ) ) ( not ( = ?auto_796939 ?auto_796942 ) ) ( not ( = ?auto_796939 ?auto_796943 ) ) ( not ( = ?auto_796939 ?auto_796944 ) ) ( not ( = ?auto_796939 ?auto_796945 ) ) ( not ( = ?auto_796939 ?auto_796946 ) ) ( not ( = ?auto_796939 ?auto_796947 ) ) ( not ( = ?auto_796939 ?auto_796948 ) ) ( not ( = ?auto_796940 ?auto_796941 ) ) ( not ( = ?auto_796940 ?auto_796942 ) ) ( not ( = ?auto_796940 ?auto_796943 ) ) ( not ( = ?auto_796940 ?auto_796944 ) ) ( not ( = ?auto_796940 ?auto_796945 ) ) ( not ( = ?auto_796940 ?auto_796946 ) ) ( not ( = ?auto_796940 ?auto_796947 ) ) ( not ( = ?auto_796940 ?auto_796948 ) ) ( not ( = ?auto_796941 ?auto_796942 ) ) ( not ( = ?auto_796941 ?auto_796943 ) ) ( not ( = ?auto_796941 ?auto_796944 ) ) ( not ( = ?auto_796941 ?auto_796945 ) ) ( not ( = ?auto_796941 ?auto_796946 ) ) ( not ( = ?auto_796941 ?auto_796947 ) ) ( not ( = ?auto_796941 ?auto_796948 ) ) ( not ( = ?auto_796942 ?auto_796943 ) ) ( not ( = ?auto_796942 ?auto_796944 ) ) ( not ( = ?auto_796942 ?auto_796945 ) ) ( not ( = ?auto_796942 ?auto_796946 ) ) ( not ( = ?auto_796942 ?auto_796947 ) ) ( not ( = ?auto_796942 ?auto_796948 ) ) ( not ( = ?auto_796943 ?auto_796944 ) ) ( not ( = ?auto_796943 ?auto_796945 ) ) ( not ( = ?auto_796943 ?auto_796946 ) ) ( not ( = ?auto_796943 ?auto_796947 ) ) ( not ( = ?auto_796943 ?auto_796948 ) ) ( not ( = ?auto_796944 ?auto_796945 ) ) ( not ( = ?auto_796944 ?auto_796946 ) ) ( not ( = ?auto_796944 ?auto_796947 ) ) ( not ( = ?auto_796944 ?auto_796948 ) ) ( not ( = ?auto_796945 ?auto_796946 ) ) ( not ( = ?auto_796945 ?auto_796947 ) ) ( not ( = ?auto_796945 ?auto_796948 ) ) ( not ( = ?auto_796946 ?auto_796947 ) ) ( not ( = ?auto_796946 ?auto_796948 ) ) ( not ( = ?auto_796947 ?auto_796948 ) ) ( ON ?auto_796946 ?auto_796947 ) ( ON ?auto_796945 ?auto_796946 ) ( CLEAR ?auto_796943 ) ( ON ?auto_796944 ?auto_796945 ) ( CLEAR ?auto_796944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_796933 ?auto_796934 ?auto_796935 ?auto_796936 ?auto_796937 ?auto_796938 ?auto_796939 ?auto_796940 ?auto_796941 ?auto_796942 ?auto_796943 ?auto_796944 )
      ( MAKE-15PILE ?auto_796933 ?auto_796934 ?auto_796935 ?auto_796936 ?auto_796937 ?auto_796938 ?auto_796939 ?auto_796940 ?auto_796941 ?auto_796942 ?auto_796943 ?auto_796944 ?auto_796945 ?auto_796946 ?auto_796947 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_796995 - BLOCK
      ?auto_796996 - BLOCK
      ?auto_796997 - BLOCK
      ?auto_796998 - BLOCK
      ?auto_796999 - BLOCK
      ?auto_797000 - BLOCK
      ?auto_797001 - BLOCK
      ?auto_797002 - BLOCK
      ?auto_797003 - BLOCK
      ?auto_797004 - BLOCK
      ?auto_797005 - BLOCK
      ?auto_797006 - BLOCK
      ?auto_797007 - BLOCK
      ?auto_797008 - BLOCK
      ?auto_797009 - BLOCK
    )
    :vars
    (
      ?auto_797010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_797009 ?auto_797010 ) ( ON-TABLE ?auto_796995 ) ( ON ?auto_796996 ?auto_796995 ) ( ON ?auto_796997 ?auto_796996 ) ( ON ?auto_796998 ?auto_796997 ) ( ON ?auto_796999 ?auto_796998 ) ( ON ?auto_797000 ?auto_796999 ) ( ON ?auto_797001 ?auto_797000 ) ( ON ?auto_797002 ?auto_797001 ) ( ON ?auto_797003 ?auto_797002 ) ( ON ?auto_797004 ?auto_797003 ) ( not ( = ?auto_796995 ?auto_796996 ) ) ( not ( = ?auto_796995 ?auto_796997 ) ) ( not ( = ?auto_796995 ?auto_796998 ) ) ( not ( = ?auto_796995 ?auto_796999 ) ) ( not ( = ?auto_796995 ?auto_797000 ) ) ( not ( = ?auto_796995 ?auto_797001 ) ) ( not ( = ?auto_796995 ?auto_797002 ) ) ( not ( = ?auto_796995 ?auto_797003 ) ) ( not ( = ?auto_796995 ?auto_797004 ) ) ( not ( = ?auto_796995 ?auto_797005 ) ) ( not ( = ?auto_796995 ?auto_797006 ) ) ( not ( = ?auto_796995 ?auto_797007 ) ) ( not ( = ?auto_796995 ?auto_797008 ) ) ( not ( = ?auto_796995 ?auto_797009 ) ) ( not ( = ?auto_796995 ?auto_797010 ) ) ( not ( = ?auto_796996 ?auto_796997 ) ) ( not ( = ?auto_796996 ?auto_796998 ) ) ( not ( = ?auto_796996 ?auto_796999 ) ) ( not ( = ?auto_796996 ?auto_797000 ) ) ( not ( = ?auto_796996 ?auto_797001 ) ) ( not ( = ?auto_796996 ?auto_797002 ) ) ( not ( = ?auto_796996 ?auto_797003 ) ) ( not ( = ?auto_796996 ?auto_797004 ) ) ( not ( = ?auto_796996 ?auto_797005 ) ) ( not ( = ?auto_796996 ?auto_797006 ) ) ( not ( = ?auto_796996 ?auto_797007 ) ) ( not ( = ?auto_796996 ?auto_797008 ) ) ( not ( = ?auto_796996 ?auto_797009 ) ) ( not ( = ?auto_796996 ?auto_797010 ) ) ( not ( = ?auto_796997 ?auto_796998 ) ) ( not ( = ?auto_796997 ?auto_796999 ) ) ( not ( = ?auto_796997 ?auto_797000 ) ) ( not ( = ?auto_796997 ?auto_797001 ) ) ( not ( = ?auto_796997 ?auto_797002 ) ) ( not ( = ?auto_796997 ?auto_797003 ) ) ( not ( = ?auto_796997 ?auto_797004 ) ) ( not ( = ?auto_796997 ?auto_797005 ) ) ( not ( = ?auto_796997 ?auto_797006 ) ) ( not ( = ?auto_796997 ?auto_797007 ) ) ( not ( = ?auto_796997 ?auto_797008 ) ) ( not ( = ?auto_796997 ?auto_797009 ) ) ( not ( = ?auto_796997 ?auto_797010 ) ) ( not ( = ?auto_796998 ?auto_796999 ) ) ( not ( = ?auto_796998 ?auto_797000 ) ) ( not ( = ?auto_796998 ?auto_797001 ) ) ( not ( = ?auto_796998 ?auto_797002 ) ) ( not ( = ?auto_796998 ?auto_797003 ) ) ( not ( = ?auto_796998 ?auto_797004 ) ) ( not ( = ?auto_796998 ?auto_797005 ) ) ( not ( = ?auto_796998 ?auto_797006 ) ) ( not ( = ?auto_796998 ?auto_797007 ) ) ( not ( = ?auto_796998 ?auto_797008 ) ) ( not ( = ?auto_796998 ?auto_797009 ) ) ( not ( = ?auto_796998 ?auto_797010 ) ) ( not ( = ?auto_796999 ?auto_797000 ) ) ( not ( = ?auto_796999 ?auto_797001 ) ) ( not ( = ?auto_796999 ?auto_797002 ) ) ( not ( = ?auto_796999 ?auto_797003 ) ) ( not ( = ?auto_796999 ?auto_797004 ) ) ( not ( = ?auto_796999 ?auto_797005 ) ) ( not ( = ?auto_796999 ?auto_797006 ) ) ( not ( = ?auto_796999 ?auto_797007 ) ) ( not ( = ?auto_796999 ?auto_797008 ) ) ( not ( = ?auto_796999 ?auto_797009 ) ) ( not ( = ?auto_796999 ?auto_797010 ) ) ( not ( = ?auto_797000 ?auto_797001 ) ) ( not ( = ?auto_797000 ?auto_797002 ) ) ( not ( = ?auto_797000 ?auto_797003 ) ) ( not ( = ?auto_797000 ?auto_797004 ) ) ( not ( = ?auto_797000 ?auto_797005 ) ) ( not ( = ?auto_797000 ?auto_797006 ) ) ( not ( = ?auto_797000 ?auto_797007 ) ) ( not ( = ?auto_797000 ?auto_797008 ) ) ( not ( = ?auto_797000 ?auto_797009 ) ) ( not ( = ?auto_797000 ?auto_797010 ) ) ( not ( = ?auto_797001 ?auto_797002 ) ) ( not ( = ?auto_797001 ?auto_797003 ) ) ( not ( = ?auto_797001 ?auto_797004 ) ) ( not ( = ?auto_797001 ?auto_797005 ) ) ( not ( = ?auto_797001 ?auto_797006 ) ) ( not ( = ?auto_797001 ?auto_797007 ) ) ( not ( = ?auto_797001 ?auto_797008 ) ) ( not ( = ?auto_797001 ?auto_797009 ) ) ( not ( = ?auto_797001 ?auto_797010 ) ) ( not ( = ?auto_797002 ?auto_797003 ) ) ( not ( = ?auto_797002 ?auto_797004 ) ) ( not ( = ?auto_797002 ?auto_797005 ) ) ( not ( = ?auto_797002 ?auto_797006 ) ) ( not ( = ?auto_797002 ?auto_797007 ) ) ( not ( = ?auto_797002 ?auto_797008 ) ) ( not ( = ?auto_797002 ?auto_797009 ) ) ( not ( = ?auto_797002 ?auto_797010 ) ) ( not ( = ?auto_797003 ?auto_797004 ) ) ( not ( = ?auto_797003 ?auto_797005 ) ) ( not ( = ?auto_797003 ?auto_797006 ) ) ( not ( = ?auto_797003 ?auto_797007 ) ) ( not ( = ?auto_797003 ?auto_797008 ) ) ( not ( = ?auto_797003 ?auto_797009 ) ) ( not ( = ?auto_797003 ?auto_797010 ) ) ( not ( = ?auto_797004 ?auto_797005 ) ) ( not ( = ?auto_797004 ?auto_797006 ) ) ( not ( = ?auto_797004 ?auto_797007 ) ) ( not ( = ?auto_797004 ?auto_797008 ) ) ( not ( = ?auto_797004 ?auto_797009 ) ) ( not ( = ?auto_797004 ?auto_797010 ) ) ( not ( = ?auto_797005 ?auto_797006 ) ) ( not ( = ?auto_797005 ?auto_797007 ) ) ( not ( = ?auto_797005 ?auto_797008 ) ) ( not ( = ?auto_797005 ?auto_797009 ) ) ( not ( = ?auto_797005 ?auto_797010 ) ) ( not ( = ?auto_797006 ?auto_797007 ) ) ( not ( = ?auto_797006 ?auto_797008 ) ) ( not ( = ?auto_797006 ?auto_797009 ) ) ( not ( = ?auto_797006 ?auto_797010 ) ) ( not ( = ?auto_797007 ?auto_797008 ) ) ( not ( = ?auto_797007 ?auto_797009 ) ) ( not ( = ?auto_797007 ?auto_797010 ) ) ( not ( = ?auto_797008 ?auto_797009 ) ) ( not ( = ?auto_797008 ?auto_797010 ) ) ( not ( = ?auto_797009 ?auto_797010 ) ) ( ON ?auto_797008 ?auto_797009 ) ( ON ?auto_797007 ?auto_797008 ) ( ON ?auto_797006 ?auto_797007 ) ( CLEAR ?auto_797004 ) ( ON ?auto_797005 ?auto_797006 ) ( CLEAR ?auto_797005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_796995 ?auto_796996 ?auto_796997 ?auto_796998 ?auto_796999 ?auto_797000 ?auto_797001 ?auto_797002 ?auto_797003 ?auto_797004 ?auto_797005 )
      ( MAKE-15PILE ?auto_796995 ?auto_796996 ?auto_796997 ?auto_796998 ?auto_796999 ?auto_797000 ?auto_797001 ?auto_797002 ?auto_797003 ?auto_797004 ?auto_797005 ?auto_797006 ?auto_797007 ?auto_797008 ?auto_797009 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_797057 - BLOCK
      ?auto_797058 - BLOCK
      ?auto_797059 - BLOCK
      ?auto_797060 - BLOCK
      ?auto_797061 - BLOCK
      ?auto_797062 - BLOCK
      ?auto_797063 - BLOCK
      ?auto_797064 - BLOCK
      ?auto_797065 - BLOCK
      ?auto_797066 - BLOCK
      ?auto_797067 - BLOCK
      ?auto_797068 - BLOCK
      ?auto_797069 - BLOCK
      ?auto_797070 - BLOCK
      ?auto_797071 - BLOCK
    )
    :vars
    (
      ?auto_797072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_797071 ?auto_797072 ) ( ON-TABLE ?auto_797057 ) ( ON ?auto_797058 ?auto_797057 ) ( ON ?auto_797059 ?auto_797058 ) ( ON ?auto_797060 ?auto_797059 ) ( ON ?auto_797061 ?auto_797060 ) ( ON ?auto_797062 ?auto_797061 ) ( ON ?auto_797063 ?auto_797062 ) ( ON ?auto_797064 ?auto_797063 ) ( ON ?auto_797065 ?auto_797064 ) ( not ( = ?auto_797057 ?auto_797058 ) ) ( not ( = ?auto_797057 ?auto_797059 ) ) ( not ( = ?auto_797057 ?auto_797060 ) ) ( not ( = ?auto_797057 ?auto_797061 ) ) ( not ( = ?auto_797057 ?auto_797062 ) ) ( not ( = ?auto_797057 ?auto_797063 ) ) ( not ( = ?auto_797057 ?auto_797064 ) ) ( not ( = ?auto_797057 ?auto_797065 ) ) ( not ( = ?auto_797057 ?auto_797066 ) ) ( not ( = ?auto_797057 ?auto_797067 ) ) ( not ( = ?auto_797057 ?auto_797068 ) ) ( not ( = ?auto_797057 ?auto_797069 ) ) ( not ( = ?auto_797057 ?auto_797070 ) ) ( not ( = ?auto_797057 ?auto_797071 ) ) ( not ( = ?auto_797057 ?auto_797072 ) ) ( not ( = ?auto_797058 ?auto_797059 ) ) ( not ( = ?auto_797058 ?auto_797060 ) ) ( not ( = ?auto_797058 ?auto_797061 ) ) ( not ( = ?auto_797058 ?auto_797062 ) ) ( not ( = ?auto_797058 ?auto_797063 ) ) ( not ( = ?auto_797058 ?auto_797064 ) ) ( not ( = ?auto_797058 ?auto_797065 ) ) ( not ( = ?auto_797058 ?auto_797066 ) ) ( not ( = ?auto_797058 ?auto_797067 ) ) ( not ( = ?auto_797058 ?auto_797068 ) ) ( not ( = ?auto_797058 ?auto_797069 ) ) ( not ( = ?auto_797058 ?auto_797070 ) ) ( not ( = ?auto_797058 ?auto_797071 ) ) ( not ( = ?auto_797058 ?auto_797072 ) ) ( not ( = ?auto_797059 ?auto_797060 ) ) ( not ( = ?auto_797059 ?auto_797061 ) ) ( not ( = ?auto_797059 ?auto_797062 ) ) ( not ( = ?auto_797059 ?auto_797063 ) ) ( not ( = ?auto_797059 ?auto_797064 ) ) ( not ( = ?auto_797059 ?auto_797065 ) ) ( not ( = ?auto_797059 ?auto_797066 ) ) ( not ( = ?auto_797059 ?auto_797067 ) ) ( not ( = ?auto_797059 ?auto_797068 ) ) ( not ( = ?auto_797059 ?auto_797069 ) ) ( not ( = ?auto_797059 ?auto_797070 ) ) ( not ( = ?auto_797059 ?auto_797071 ) ) ( not ( = ?auto_797059 ?auto_797072 ) ) ( not ( = ?auto_797060 ?auto_797061 ) ) ( not ( = ?auto_797060 ?auto_797062 ) ) ( not ( = ?auto_797060 ?auto_797063 ) ) ( not ( = ?auto_797060 ?auto_797064 ) ) ( not ( = ?auto_797060 ?auto_797065 ) ) ( not ( = ?auto_797060 ?auto_797066 ) ) ( not ( = ?auto_797060 ?auto_797067 ) ) ( not ( = ?auto_797060 ?auto_797068 ) ) ( not ( = ?auto_797060 ?auto_797069 ) ) ( not ( = ?auto_797060 ?auto_797070 ) ) ( not ( = ?auto_797060 ?auto_797071 ) ) ( not ( = ?auto_797060 ?auto_797072 ) ) ( not ( = ?auto_797061 ?auto_797062 ) ) ( not ( = ?auto_797061 ?auto_797063 ) ) ( not ( = ?auto_797061 ?auto_797064 ) ) ( not ( = ?auto_797061 ?auto_797065 ) ) ( not ( = ?auto_797061 ?auto_797066 ) ) ( not ( = ?auto_797061 ?auto_797067 ) ) ( not ( = ?auto_797061 ?auto_797068 ) ) ( not ( = ?auto_797061 ?auto_797069 ) ) ( not ( = ?auto_797061 ?auto_797070 ) ) ( not ( = ?auto_797061 ?auto_797071 ) ) ( not ( = ?auto_797061 ?auto_797072 ) ) ( not ( = ?auto_797062 ?auto_797063 ) ) ( not ( = ?auto_797062 ?auto_797064 ) ) ( not ( = ?auto_797062 ?auto_797065 ) ) ( not ( = ?auto_797062 ?auto_797066 ) ) ( not ( = ?auto_797062 ?auto_797067 ) ) ( not ( = ?auto_797062 ?auto_797068 ) ) ( not ( = ?auto_797062 ?auto_797069 ) ) ( not ( = ?auto_797062 ?auto_797070 ) ) ( not ( = ?auto_797062 ?auto_797071 ) ) ( not ( = ?auto_797062 ?auto_797072 ) ) ( not ( = ?auto_797063 ?auto_797064 ) ) ( not ( = ?auto_797063 ?auto_797065 ) ) ( not ( = ?auto_797063 ?auto_797066 ) ) ( not ( = ?auto_797063 ?auto_797067 ) ) ( not ( = ?auto_797063 ?auto_797068 ) ) ( not ( = ?auto_797063 ?auto_797069 ) ) ( not ( = ?auto_797063 ?auto_797070 ) ) ( not ( = ?auto_797063 ?auto_797071 ) ) ( not ( = ?auto_797063 ?auto_797072 ) ) ( not ( = ?auto_797064 ?auto_797065 ) ) ( not ( = ?auto_797064 ?auto_797066 ) ) ( not ( = ?auto_797064 ?auto_797067 ) ) ( not ( = ?auto_797064 ?auto_797068 ) ) ( not ( = ?auto_797064 ?auto_797069 ) ) ( not ( = ?auto_797064 ?auto_797070 ) ) ( not ( = ?auto_797064 ?auto_797071 ) ) ( not ( = ?auto_797064 ?auto_797072 ) ) ( not ( = ?auto_797065 ?auto_797066 ) ) ( not ( = ?auto_797065 ?auto_797067 ) ) ( not ( = ?auto_797065 ?auto_797068 ) ) ( not ( = ?auto_797065 ?auto_797069 ) ) ( not ( = ?auto_797065 ?auto_797070 ) ) ( not ( = ?auto_797065 ?auto_797071 ) ) ( not ( = ?auto_797065 ?auto_797072 ) ) ( not ( = ?auto_797066 ?auto_797067 ) ) ( not ( = ?auto_797066 ?auto_797068 ) ) ( not ( = ?auto_797066 ?auto_797069 ) ) ( not ( = ?auto_797066 ?auto_797070 ) ) ( not ( = ?auto_797066 ?auto_797071 ) ) ( not ( = ?auto_797066 ?auto_797072 ) ) ( not ( = ?auto_797067 ?auto_797068 ) ) ( not ( = ?auto_797067 ?auto_797069 ) ) ( not ( = ?auto_797067 ?auto_797070 ) ) ( not ( = ?auto_797067 ?auto_797071 ) ) ( not ( = ?auto_797067 ?auto_797072 ) ) ( not ( = ?auto_797068 ?auto_797069 ) ) ( not ( = ?auto_797068 ?auto_797070 ) ) ( not ( = ?auto_797068 ?auto_797071 ) ) ( not ( = ?auto_797068 ?auto_797072 ) ) ( not ( = ?auto_797069 ?auto_797070 ) ) ( not ( = ?auto_797069 ?auto_797071 ) ) ( not ( = ?auto_797069 ?auto_797072 ) ) ( not ( = ?auto_797070 ?auto_797071 ) ) ( not ( = ?auto_797070 ?auto_797072 ) ) ( not ( = ?auto_797071 ?auto_797072 ) ) ( ON ?auto_797070 ?auto_797071 ) ( ON ?auto_797069 ?auto_797070 ) ( ON ?auto_797068 ?auto_797069 ) ( ON ?auto_797067 ?auto_797068 ) ( CLEAR ?auto_797065 ) ( ON ?auto_797066 ?auto_797067 ) ( CLEAR ?auto_797066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_797057 ?auto_797058 ?auto_797059 ?auto_797060 ?auto_797061 ?auto_797062 ?auto_797063 ?auto_797064 ?auto_797065 ?auto_797066 )
      ( MAKE-15PILE ?auto_797057 ?auto_797058 ?auto_797059 ?auto_797060 ?auto_797061 ?auto_797062 ?auto_797063 ?auto_797064 ?auto_797065 ?auto_797066 ?auto_797067 ?auto_797068 ?auto_797069 ?auto_797070 ?auto_797071 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_797119 - BLOCK
      ?auto_797120 - BLOCK
      ?auto_797121 - BLOCK
      ?auto_797122 - BLOCK
      ?auto_797123 - BLOCK
      ?auto_797124 - BLOCK
      ?auto_797125 - BLOCK
      ?auto_797126 - BLOCK
      ?auto_797127 - BLOCK
      ?auto_797128 - BLOCK
      ?auto_797129 - BLOCK
      ?auto_797130 - BLOCK
      ?auto_797131 - BLOCK
      ?auto_797132 - BLOCK
      ?auto_797133 - BLOCK
    )
    :vars
    (
      ?auto_797134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_797133 ?auto_797134 ) ( ON-TABLE ?auto_797119 ) ( ON ?auto_797120 ?auto_797119 ) ( ON ?auto_797121 ?auto_797120 ) ( ON ?auto_797122 ?auto_797121 ) ( ON ?auto_797123 ?auto_797122 ) ( ON ?auto_797124 ?auto_797123 ) ( ON ?auto_797125 ?auto_797124 ) ( ON ?auto_797126 ?auto_797125 ) ( not ( = ?auto_797119 ?auto_797120 ) ) ( not ( = ?auto_797119 ?auto_797121 ) ) ( not ( = ?auto_797119 ?auto_797122 ) ) ( not ( = ?auto_797119 ?auto_797123 ) ) ( not ( = ?auto_797119 ?auto_797124 ) ) ( not ( = ?auto_797119 ?auto_797125 ) ) ( not ( = ?auto_797119 ?auto_797126 ) ) ( not ( = ?auto_797119 ?auto_797127 ) ) ( not ( = ?auto_797119 ?auto_797128 ) ) ( not ( = ?auto_797119 ?auto_797129 ) ) ( not ( = ?auto_797119 ?auto_797130 ) ) ( not ( = ?auto_797119 ?auto_797131 ) ) ( not ( = ?auto_797119 ?auto_797132 ) ) ( not ( = ?auto_797119 ?auto_797133 ) ) ( not ( = ?auto_797119 ?auto_797134 ) ) ( not ( = ?auto_797120 ?auto_797121 ) ) ( not ( = ?auto_797120 ?auto_797122 ) ) ( not ( = ?auto_797120 ?auto_797123 ) ) ( not ( = ?auto_797120 ?auto_797124 ) ) ( not ( = ?auto_797120 ?auto_797125 ) ) ( not ( = ?auto_797120 ?auto_797126 ) ) ( not ( = ?auto_797120 ?auto_797127 ) ) ( not ( = ?auto_797120 ?auto_797128 ) ) ( not ( = ?auto_797120 ?auto_797129 ) ) ( not ( = ?auto_797120 ?auto_797130 ) ) ( not ( = ?auto_797120 ?auto_797131 ) ) ( not ( = ?auto_797120 ?auto_797132 ) ) ( not ( = ?auto_797120 ?auto_797133 ) ) ( not ( = ?auto_797120 ?auto_797134 ) ) ( not ( = ?auto_797121 ?auto_797122 ) ) ( not ( = ?auto_797121 ?auto_797123 ) ) ( not ( = ?auto_797121 ?auto_797124 ) ) ( not ( = ?auto_797121 ?auto_797125 ) ) ( not ( = ?auto_797121 ?auto_797126 ) ) ( not ( = ?auto_797121 ?auto_797127 ) ) ( not ( = ?auto_797121 ?auto_797128 ) ) ( not ( = ?auto_797121 ?auto_797129 ) ) ( not ( = ?auto_797121 ?auto_797130 ) ) ( not ( = ?auto_797121 ?auto_797131 ) ) ( not ( = ?auto_797121 ?auto_797132 ) ) ( not ( = ?auto_797121 ?auto_797133 ) ) ( not ( = ?auto_797121 ?auto_797134 ) ) ( not ( = ?auto_797122 ?auto_797123 ) ) ( not ( = ?auto_797122 ?auto_797124 ) ) ( not ( = ?auto_797122 ?auto_797125 ) ) ( not ( = ?auto_797122 ?auto_797126 ) ) ( not ( = ?auto_797122 ?auto_797127 ) ) ( not ( = ?auto_797122 ?auto_797128 ) ) ( not ( = ?auto_797122 ?auto_797129 ) ) ( not ( = ?auto_797122 ?auto_797130 ) ) ( not ( = ?auto_797122 ?auto_797131 ) ) ( not ( = ?auto_797122 ?auto_797132 ) ) ( not ( = ?auto_797122 ?auto_797133 ) ) ( not ( = ?auto_797122 ?auto_797134 ) ) ( not ( = ?auto_797123 ?auto_797124 ) ) ( not ( = ?auto_797123 ?auto_797125 ) ) ( not ( = ?auto_797123 ?auto_797126 ) ) ( not ( = ?auto_797123 ?auto_797127 ) ) ( not ( = ?auto_797123 ?auto_797128 ) ) ( not ( = ?auto_797123 ?auto_797129 ) ) ( not ( = ?auto_797123 ?auto_797130 ) ) ( not ( = ?auto_797123 ?auto_797131 ) ) ( not ( = ?auto_797123 ?auto_797132 ) ) ( not ( = ?auto_797123 ?auto_797133 ) ) ( not ( = ?auto_797123 ?auto_797134 ) ) ( not ( = ?auto_797124 ?auto_797125 ) ) ( not ( = ?auto_797124 ?auto_797126 ) ) ( not ( = ?auto_797124 ?auto_797127 ) ) ( not ( = ?auto_797124 ?auto_797128 ) ) ( not ( = ?auto_797124 ?auto_797129 ) ) ( not ( = ?auto_797124 ?auto_797130 ) ) ( not ( = ?auto_797124 ?auto_797131 ) ) ( not ( = ?auto_797124 ?auto_797132 ) ) ( not ( = ?auto_797124 ?auto_797133 ) ) ( not ( = ?auto_797124 ?auto_797134 ) ) ( not ( = ?auto_797125 ?auto_797126 ) ) ( not ( = ?auto_797125 ?auto_797127 ) ) ( not ( = ?auto_797125 ?auto_797128 ) ) ( not ( = ?auto_797125 ?auto_797129 ) ) ( not ( = ?auto_797125 ?auto_797130 ) ) ( not ( = ?auto_797125 ?auto_797131 ) ) ( not ( = ?auto_797125 ?auto_797132 ) ) ( not ( = ?auto_797125 ?auto_797133 ) ) ( not ( = ?auto_797125 ?auto_797134 ) ) ( not ( = ?auto_797126 ?auto_797127 ) ) ( not ( = ?auto_797126 ?auto_797128 ) ) ( not ( = ?auto_797126 ?auto_797129 ) ) ( not ( = ?auto_797126 ?auto_797130 ) ) ( not ( = ?auto_797126 ?auto_797131 ) ) ( not ( = ?auto_797126 ?auto_797132 ) ) ( not ( = ?auto_797126 ?auto_797133 ) ) ( not ( = ?auto_797126 ?auto_797134 ) ) ( not ( = ?auto_797127 ?auto_797128 ) ) ( not ( = ?auto_797127 ?auto_797129 ) ) ( not ( = ?auto_797127 ?auto_797130 ) ) ( not ( = ?auto_797127 ?auto_797131 ) ) ( not ( = ?auto_797127 ?auto_797132 ) ) ( not ( = ?auto_797127 ?auto_797133 ) ) ( not ( = ?auto_797127 ?auto_797134 ) ) ( not ( = ?auto_797128 ?auto_797129 ) ) ( not ( = ?auto_797128 ?auto_797130 ) ) ( not ( = ?auto_797128 ?auto_797131 ) ) ( not ( = ?auto_797128 ?auto_797132 ) ) ( not ( = ?auto_797128 ?auto_797133 ) ) ( not ( = ?auto_797128 ?auto_797134 ) ) ( not ( = ?auto_797129 ?auto_797130 ) ) ( not ( = ?auto_797129 ?auto_797131 ) ) ( not ( = ?auto_797129 ?auto_797132 ) ) ( not ( = ?auto_797129 ?auto_797133 ) ) ( not ( = ?auto_797129 ?auto_797134 ) ) ( not ( = ?auto_797130 ?auto_797131 ) ) ( not ( = ?auto_797130 ?auto_797132 ) ) ( not ( = ?auto_797130 ?auto_797133 ) ) ( not ( = ?auto_797130 ?auto_797134 ) ) ( not ( = ?auto_797131 ?auto_797132 ) ) ( not ( = ?auto_797131 ?auto_797133 ) ) ( not ( = ?auto_797131 ?auto_797134 ) ) ( not ( = ?auto_797132 ?auto_797133 ) ) ( not ( = ?auto_797132 ?auto_797134 ) ) ( not ( = ?auto_797133 ?auto_797134 ) ) ( ON ?auto_797132 ?auto_797133 ) ( ON ?auto_797131 ?auto_797132 ) ( ON ?auto_797130 ?auto_797131 ) ( ON ?auto_797129 ?auto_797130 ) ( ON ?auto_797128 ?auto_797129 ) ( CLEAR ?auto_797126 ) ( ON ?auto_797127 ?auto_797128 ) ( CLEAR ?auto_797127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_797119 ?auto_797120 ?auto_797121 ?auto_797122 ?auto_797123 ?auto_797124 ?auto_797125 ?auto_797126 ?auto_797127 )
      ( MAKE-15PILE ?auto_797119 ?auto_797120 ?auto_797121 ?auto_797122 ?auto_797123 ?auto_797124 ?auto_797125 ?auto_797126 ?auto_797127 ?auto_797128 ?auto_797129 ?auto_797130 ?auto_797131 ?auto_797132 ?auto_797133 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_797181 - BLOCK
      ?auto_797182 - BLOCK
      ?auto_797183 - BLOCK
      ?auto_797184 - BLOCK
      ?auto_797185 - BLOCK
      ?auto_797186 - BLOCK
      ?auto_797187 - BLOCK
      ?auto_797188 - BLOCK
      ?auto_797189 - BLOCK
      ?auto_797190 - BLOCK
      ?auto_797191 - BLOCK
      ?auto_797192 - BLOCK
      ?auto_797193 - BLOCK
      ?auto_797194 - BLOCK
      ?auto_797195 - BLOCK
    )
    :vars
    (
      ?auto_797196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_797195 ?auto_797196 ) ( ON-TABLE ?auto_797181 ) ( ON ?auto_797182 ?auto_797181 ) ( ON ?auto_797183 ?auto_797182 ) ( ON ?auto_797184 ?auto_797183 ) ( ON ?auto_797185 ?auto_797184 ) ( ON ?auto_797186 ?auto_797185 ) ( ON ?auto_797187 ?auto_797186 ) ( not ( = ?auto_797181 ?auto_797182 ) ) ( not ( = ?auto_797181 ?auto_797183 ) ) ( not ( = ?auto_797181 ?auto_797184 ) ) ( not ( = ?auto_797181 ?auto_797185 ) ) ( not ( = ?auto_797181 ?auto_797186 ) ) ( not ( = ?auto_797181 ?auto_797187 ) ) ( not ( = ?auto_797181 ?auto_797188 ) ) ( not ( = ?auto_797181 ?auto_797189 ) ) ( not ( = ?auto_797181 ?auto_797190 ) ) ( not ( = ?auto_797181 ?auto_797191 ) ) ( not ( = ?auto_797181 ?auto_797192 ) ) ( not ( = ?auto_797181 ?auto_797193 ) ) ( not ( = ?auto_797181 ?auto_797194 ) ) ( not ( = ?auto_797181 ?auto_797195 ) ) ( not ( = ?auto_797181 ?auto_797196 ) ) ( not ( = ?auto_797182 ?auto_797183 ) ) ( not ( = ?auto_797182 ?auto_797184 ) ) ( not ( = ?auto_797182 ?auto_797185 ) ) ( not ( = ?auto_797182 ?auto_797186 ) ) ( not ( = ?auto_797182 ?auto_797187 ) ) ( not ( = ?auto_797182 ?auto_797188 ) ) ( not ( = ?auto_797182 ?auto_797189 ) ) ( not ( = ?auto_797182 ?auto_797190 ) ) ( not ( = ?auto_797182 ?auto_797191 ) ) ( not ( = ?auto_797182 ?auto_797192 ) ) ( not ( = ?auto_797182 ?auto_797193 ) ) ( not ( = ?auto_797182 ?auto_797194 ) ) ( not ( = ?auto_797182 ?auto_797195 ) ) ( not ( = ?auto_797182 ?auto_797196 ) ) ( not ( = ?auto_797183 ?auto_797184 ) ) ( not ( = ?auto_797183 ?auto_797185 ) ) ( not ( = ?auto_797183 ?auto_797186 ) ) ( not ( = ?auto_797183 ?auto_797187 ) ) ( not ( = ?auto_797183 ?auto_797188 ) ) ( not ( = ?auto_797183 ?auto_797189 ) ) ( not ( = ?auto_797183 ?auto_797190 ) ) ( not ( = ?auto_797183 ?auto_797191 ) ) ( not ( = ?auto_797183 ?auto_797192 ) ) ( not ( = ?auto_797183 ?auto_797193 ) ) ( not ( = ?auto_797183 ?auto_797194 ) ) ( not ( = ?auto_797183 ?auto_797195 ) ) ( not ( = ?auto_797183 ?auto_797196 ) ) ( not ( = ?auto_797184 ?auto_797185 ) ) ( not ( = ?auto_797184 ?auto_797186 ) ) ( not ( = ?auto_797184 ?auto_797187 ) ) ( not ( = ?auto_797184 ?auto_797188 ) ) ( not ( = ?auto_797184 ?auto_797189 ) ) ( not ( = ?auto_797184 ?auto_797190 ) ) ( not ( = ?auto_797184 ?auto_797191 ) ) ( not ( = ?auto_797184 ?auto_797192 ) ) ( not ( = ?auto_797184 ?auto_797193 ) ) ( not ( = ?auto_797184 ?auto_797194 ) ) ( not ( = ?auto_797184 ?auto_797195 ) ) ( not ( = ?auto_797184 ?auto_797196 ) ) ( not ( = ?auto_797185 ?auto_797186 ) ) ( not ( = ?auto_797185 ?auto_797187 ) ) ( not ( = ?auto_797185 ?auto_797188 ) ) ( not ( = ?auto_797185 ?auto_797189 ) ) ( not ( = ?auto_797185 ?auto_797190 ) ) ( not ( = ?auto_797185 ?auto_797191 ) ) ( not ( = ?auto_797185 ?auto_797192 ) ) ( not ( = ?auto_797185 ?auto_797193 ) ) ( not ( = ?auto_797185 ?auto_797194 ) ) ( not ( = ?auto_797185 ?auto_797195 ) ) ( not ( = ?auto_797185 ?auto_797196 ) ) ( not ( = ?auto_797186 ?auto_797187 ) ) ( not ( = ?auto_797186 ?auto_797188 ) ) ( not ( = ?auto_797186 ?auto_797189 ) ) ( not ( = ?auto_797186 ?auto_797190 ) ) ( not ( = ?auto_797186 ?auto_797191 ) ) ( not ( = ?auto_797186 ?auto_797192 ) ) ( not ( = ?auto_797186 ?auto_797193 ) ) ( not ( = ?auto_797186 ?auto_797194 ) ) ( not ( = ?auto_797186 ?auto_797195 ) ) ( not ( = ?auto_797186 ?auto_797196 ) ) ( not ( = ?auto_797187 ?auto_797188 ) ) ( not ( = ?auto_797187 ?auto_797189 ) ) ( not ( = ?auto_797187 ?auto_797190 ) ) ( not ( = ?auto_797187 ?auto_797191 ) ) ( not ( = ?auto_797187 ?auto_797192 ) ) ( not ( = ?auto_797187 ?auto_797193 ) ) ( not ( = ?auto_797187 ?auto_797194 ) ) ( not ( = ?auto_797187 ?auto_797195 ) ) ( not ( = ?auto_797187 ?auto_797196 ) ) ( not ( = ?auto_797188 ?auto_797189 ) ) ( not ( = ?auto_797188 ?auto_797190 ) ) ( not ( = ?auto_797188 ?auto_797191 ) ) ( not ( = ?auto_797188 ?auto_797192 ) ) ( not ( = ?auto_797188 ?auto_797193 ) ) ( not ( = ?auto_797188 ?auto_797194 ) ) ( not ( = ?auto_797188 ?auto_797195 ) ) ( not ( = ?auto_797188 ?auto_797196 ) ) ( not ( = ?auto_797189 ?auto_797190 ) ) ( not ( = ?auto_797189 ?auto_797191 ) ) ( not ( = ?auto_797189 ?auto_797192 ) ) ( not ( = ?auto_797189 ?auto_797193 ) ) ( not ( = ?auto_797189 ?auto_797194 ) ) ( not ( = ?auto_797189 ?auto_797195 ) ) ( not ( = ?auto_797189 ?auto_797196 ) ) ( not ( = ?auto_797190 ?auto_797191 ) ) ( not ( = ?auto_797190 ?auto_797192 ) ) ( not ( = ?auto_797190 ?auto_797193 ) ) ( not ( = ?auto_797190 ?auto_797194 ) ) ( not ( = ?auto_797190 ?auto_797195 ) ) ( not ( = ?auto_797190 ?auto_797196 ) ) ( not ( = ?auto_797191 ?auto_797192 ) ) ( not ( = ?auto_797191 ?auto_797193 ) ) ( not ( = ?auto_797191 ?auto_797194 ) ) ( not ( = ?auto_797191 ?auto_797195 ) ) ( not ( = ?auto_797191 ?auto_797196 ) ) ( not ( = ?auto_797192 ?auto_797193 ) ) ( not ( = ?auto_797192 ?auto_797194 ) ) ( not ( = ?auto_797192 ?auto_797195 ) ) ( not ( = ?auto_797192 ?auto_797196 ) ) ( not ( = ?auto_797193 ?auto_797194 ) ) ( not ( = ?auto_797193 ?auto_797195 ) ) ( not ( = ?auto_797193 ?auto_797196 ) ) ( not ( = ?auto_797194 ?auto_797195 ) ) ( not ( = ?auto_797194 ?auto_797196 ) ) ( not ( = ?auto_797195 ?auto_797196 ) ) ( ON ?auto_797194 ?auto_797195 ) ( ON ?auto_797193 ?auto_797194 ) ( ON ?auto_797192 ?auto_797193 ) ( ON ?auto_797191 ?auto_797192 ) ( ON ?auto_797190 ?auto_797191 ) ( ON ?auto_797189 ?auto_797190 ) ( CLEAR ?auto_797187 ) ( ON ?auto_797188 ?auto_797189 ) ( CLEAR ?auto_797188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_797181 ?auto_797182 ?auto_797183 ?auto_797184 ?auto_797185 ?auto_797186 ?auto_797187 ?auto_797188 )
      ( MAKE-15PILE ?auto_797181 ?auto_797182 ?auto_797183 ?auto_797184 ?auto_797185 ?auto_797186 ?auto_797187 ?auto_797188 ?auto_797189 ?auto_797190 ?auto_797191 ?auto_797192 ?auto_797193 ?auto_797194 ?auto_797195 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_797243 - BLOCK
      ?auto_797244 - BLOCK
      ?auto_797245 - BLOCK
      ?auto_797246 - BLOCK
      ?auto_797247 - BLOCK
      ?auto_797248 - BLOCK
      ?auto_797249 - BLOCK
      ?auto_797250 - BLOCK
      ?auto_797251 - BLOCK
      ?auto_797252 - BLOCK
      ?auto_797253 - BLOCK
      ?auto_797254 - BLOCK
      ?auto_797255 - BLOCK
      ?auto_797256 - BLOCK
      ?auto_797257 - BLOCK
    )
    :vars
    (
      ?auto_797258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_797257 ?auto_797258 ) ( ON-TABLE ?auto_797243 ) ( ON ?auto_797244 ?auto_797243 ) ( ON ?auto_797245 ?auto_797244 ) ( ON ?auto_797246 ?auto_797245 ) ( ON ?auto_797247 ?auto_797246 ) ( ON ?auto_797248 ?auto_797247 ) ( not ( = ?auto_797243 ?auto_797244 ) ) ( not ( = ?auto_797243 ?auto_797245 ) ) ( not ( = ?auto_797243 ?auto_797246 ) ) ( not ( = ?auto_797243 ?auto_797247 ) ) ( not ( = ?auto_797243 ?auto_797248 ) ) ( not ( = ?auto_797243 ?auto_797249 ) ) ( not ( = ?auto_797243 ?auto_797250 ) ) ( not ( = ?auto_797243 ?auto_797251 ) ) ( not ( = ?auto_797243 ?auto_797252 ) ) ( not ( = ?auto_797243 ?auto_797253 ) ) ( not ( = ?auto_797243 ?auto_797254 ) ) ( not ( = ?auto_797243 ?auto_797255 ) ) ( not ( = ?auto_797243 ?auto_797256 ) ) ( not ( = ?auto_797243 ?auto_797257 ) ) ( not ( = ?auto_797243 ?auto_797258 ) ) ( not ( = ?auto_797244 ?auto_797245 ) ) ( not ( = ?auto_797244 ?auto_797246 ) ) ( not ( = ?auto_797244 ?auto_797247 ) ) ( not ( = ?auto_797244 ?auto_797248 ) ) ( not ( = ?auto_797244 ?auto_797249 ) ) ( not ( = ?auto_797244 ?auto_797250 ) ) ( not ( = ?auto_797244 ?auto_797251 ) ) ( not ( = ?auto_797244 ?auto_797252 ) ) ( not ( = ?auto_797244 ?auto_797253 ) ) ( not ( = ?auto_797244 ?auto_797254 ) ) ( not ( = ?auto_797244 ?auto_797255 ) ) ( not ( = ?auto_797244 ?auto_797256 ) ) ( not ( = ?auto_797244 ?auto_797257 ) ) ( not ( = ?auto_797244 ?auto_797258 ) ) ( not ( = ?auto_797245 ?auto_797246 ) ) ( not ( = ?auto_797245 ?auto_797247 ) ) ( not ( = ?auto_797245 ?auto_797248 ) ) ( not ( = ?auto_797245 ?auto_797249 ) ) ( not ( = ?auto_797245 ?auto_797250 ) ) ( not ( = ?auto_797245 ?auto_797251 ) ) ( not ( = ?auto_797245 ?auto_797252 ) ) ( not ( = ?auto_797245 ?auto_797253 ) ) ( not ( = ?auto_797245 ?auto_797254 ) ) ( not ( = ?auto_797245 ?auto_797255 ) ) ( not ( = ?auto_797245 ?auto_797256 ) ) ( not ( = ?auto_797245 ?auto_797257 ) ) ( not ( = ?auto_797245 ?auto_797258 ) ) ( not ( = ?auto_797246 ?auto_797247 ) ) ( not ( = ?auto_797246 ?auto_797248 ) ) ( not ( = ?auto_797246 ?auto_797249 ) ) ( not ( = ?auto_797246 ?auto_797250 ) ) ( not ( = ?auto_797246 ?auto_797251 ) ) ( not ( = ?auto_797246 ?auto_797252 ) ) ( not ( = ?auto_797246 ?auto_797253 ) ) ( not ( = ?auto_797246 ?auto_797254 ) ) ( not ( = ?auto_797246 ?auto_797255 ) ) ( not ( = ?auto_797246 ?auto_797256 ) ) ( not ( = ?auto_797246 ?auto_797257 ) ) ( not ( = ?auto_797246 ?auto_797258 ) ) ( not ( = ?auto_797247 ?auto_797248 ) ) ( not ( = ?auto_797247 ?auto_797249 ) ) ( not ( = ?auto_797247 ?auto_797250 ) ) ( not ( = ?auto_797247 ?auto_797251 ) ) ( not ( = ?auto_797247 ?auto_797252 ) ) ( not ( = ?auto_797247 ?auto_797253 ) ) ( not ( = ?auto_797247 ?auto_797254 ) ) ( not ( = ?auto_797247 ?auto_797255 ) ) ( not ( = ?auto_797247 ?auto_797256 ) ) ( not ( = ?auto_797247 ?auto_797257 ) ) ( not ( = ?auto_797247 ?auto_797258 ) ) ( not ( = ?auto_797248 ?auto_797249 ) ) ( not ( = ?auto_797248 ?auto_797250 ) ) ( not ( = ?auto_797248 ?auto_797251 ) ) ( not ( = ?auto_797248 ?auto_797252 ) ) ( not ( = ?auto_797248 ?auto_797253 ) ) ( not ( = ?auto_797248 ?auto_797254 ) ) ( not ( = ?auto_797248 ?auto_797255 ) ) ( not ( = ?auto_797248 ?auto_797256 ) ) ( not ( = ?auto_797248 ?auto_797257 ) ) ( not ( = ?auto_797248 ?auto_797258 ) ) ( not ( = ?auto_797249 ?auto_797250 ) ) ( not ( = ?auto_797249 ?auto_797251 ) ) ( not ( = ?auto_797249 ?auto_797252 ) ) ( not ( = ?auto_797249 ?auto_797253 ) ) ( not ( = ?auto_797249 ?auto_797254 ) ) ( not ( = ?auto_797249 ?auto_797255 ) ) ( not ( = ?auto_797249 ?auto_797256 ) ) ( not ( = ?auto_797249 ?auto_797257 ) ) ( not ( = ?auto_797249 ?auto_797258 ) ) ( not ( = ?auto_797250 ?auto_797251 ) ) ( not ( = ?auto_797250 ?auto_797252 ) ) ( not ( = ?auto_797250 ?auto_797253 ) ) ( not ( = ?auto_797250 ?auto_797254 ) ) ( not ( = ?auto_797250 ?auto_797255 ) ) ( not ( = ?auto_797250 ?auto_797256 ) ) ( not ( = ?auto_797250 ?auto_797257 ) ) ( not ( = ?auto_797250 ?auto_797258 ) ) ( not ( = ?auto_797251 ?auto_797252 ) ) ( not ( = ?auto_797251 ?auto_797253 ) ) ( not ( = ?auto_797251 ?auto_797254 ) ) ( not ( = ?auto_797251 ?auto_797255 ) ) ( not ( = ?auto_797251 ?auto_797256 ) ) ( not ( = ?auto_797251 ?auto_797257 ) ) ( not ( = ?auto_797251 ?auto_797258 ) ) ( not ( = ?auto_797252 ?auto_797253 ) ) ( not ( = ?auto_797252 ?auto_797254 ) ) ( not ( = ?auto_797252 ?auto_797255 ) ) ( not ( = ?auto_797252 ?auto_797256 ) ) ( not ( = ?auto_797252 ?auto_797257 ) ) ( not ( = ?auto_797252 ?auto_797258 ) ) ( not ( = ?auto_797253 ?auto_797254 ) ) ( not ( = ?auto_797253 ?auto_797255 ) ) ( not ( = ?auto_797253 ?auto_797256 ) ) ( not ( = ?auto_797253 ?auto_797257 ) ) ( not ( = ?auto_797253 ?auto_797258 ) ) ( not ( = ?auto_797254 ?auto_797255 ) ) ( not ( = ?auto_797254 ?auto_797256 ) ) ( not ( = ?auto_797254 ?auto_797257 ) ) ( not ( = ?auto_797254 ?auto_797258 ) ) ( not ( = ?auto_797255 ?auto_797256 ) ) ( not ( = ?auto_797255 ?auto_797257 ) ) ( not ( = ?auto_797255 ?auto_797258 ) ) ( not ( = ?auto_797256 ?auto_797257 ) ) ( not ( = ?auto_797256 ?auto_797258 ) ) ( not ( = ?auto_797257 ?auto_797258 ) ) ( ON ?auto_797256 ?auto_797257 ) ( ON ?auto_797255 ?auto_797256 ) ( ON ?auto_797254 ?auto_797255 ) ( ON ?auto_797253 ?auto_797254 ) ( ON ?auto_797252 ?auto_797253 ) ( ON ?auto_797251 ?auto_797252 ) ( ON ?auto_797250 ?auto_797251 ) ( CLEAR ?auto_797248 ) ( ON ?auto_797249 ?auto_797250 ) ( CLEAR ?auto_797249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_797243 ?auto_797244 ?auto_797245 ?auto_797246 ?auto_797247 ?auto_797248 ?auto_797249 )
      ( MAKE-15PILE ?auto_797243 ?auto_797244 ?auto_797245 ?auto_797246 ?auto_797247 ?auto_797248 ?auto_797249 ?auto_797250 ?auto_797251 ?auto_797252 ?auto_797253 ?auto_797254 ?auto_797255 ?auto_797256 ?auto_797257 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_797305 - BLOCK
      ?auto_797306 - BLOCK
      ?auto_797307 - BLOCK
      ?auto_797308 - BLOCK
      ?auto_797309 - BLOCK
      ?auto_797310 - BLOCK
      ?auto_797311 - BLOCK
      ?auto_797312 - BLOCK
      ?auto_797313 - BLOCK
      ?auto_797314 - BLOCK
      ?auto_797315 - BLOCK
      ?auto_797316 - BLOCK
      ?auto_797317 - BLOCK
      ?auto_797318 - BLOCK
      ?auto_797319 - BLOCK
    )
    :vars
    (
      ?auto_797320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_797319 ?auto_797320 ) ( ON-TABLE ?auto_797305 ) ( ON ?auto_797306 ?auto_797305 ) ( ON ?auto_797307 ?auto_797306 ) ( ON ?auto_797308 ?auto_797307 ) ( ON ?auto_797309 ?auto_797308 ) ( not ( = ?auto_797305 ?auto_797306 ) ) ( not ( = ?auto_797305 ?auto_797307 ) ) ( not ( = ?auto_797305 ?auto_797308 ) ) ( not ( = ?auto_797305 ?auto_797309 ) ) ( not ( = ?auto_797305 ?auto_797310 ) ) ( not ( = ?auto_797305 ?auto_797311 ) ) ( not ( = ?auto_797305 ?auto_797312 ) ) ( not ( = ?auto_797305 ?auto_797313 ) ) ( not ( = ?auto_797305 ?auto_797314 ) ) ( not ( = ?auto_797305 ?auto_797315 ) ) ( not ( = ?auto_797305 ?auto_797316 ) ) ( not ( = ?auto_797305 ?auto_797317 ) ) ( not ( = ?auto_797305 ?auto_797318 ) ) ( not ( = ?auto_797305 ?auto_797319 ) ) ( not ( = ?auto_797305 ?auto_797320 ) ) ( not ( = ?auto_797306 ?auto_797307 ) ) ( not ( = ?auto_797306 ?auto_797308 ) ) ( not ( = ?auto_797306 ?auto_797309 ) ) ( not ( = ?auto_797306 ?auto_797310 ) ) ( not ( = ?auto_797306 ?auto_797311 ) ) ( not ( = ?auto_797306 ?auto_797312 ) ) ( not ( = ?auto_797306 ?auto_797313 ) ) ( not ( = ?auto_797306 ?auto_797314 ) ) ( not ( = ?auto_797306 ?auto_797315 ) ) ( not ( = ?auto_797306 ?auto_797316 ) ) ( not ( = ?auto_797306 ?auto_797317 ) ) ( not ( = ?auto_797306 ?auto_797318 ) ) ( not ( = ?auto_797306 ?auto_797319 ) ) ( not ( = ?auto_797306 ?auto_797320 ) ) ( not ( = ?auto_797307 ?auto_797308 ) ) ( not ( = ?auto_797307 ?auto_797309 ) ) ( not ( = ?auto_797307 ?auto_797310 ) ) ( not ( = ?auto_797307 ?auto_797311 ) ) ( not ( = ?auto_797307 ?auto_797312 ) ) ( not ( = ?auto_797307 ?auto_797313 ) ) ( not ( = ?auto_797307 ?auto_797314 ) ) ( not ( = ?auto_797307 ?auto_797315 ) ) ( not ( = ?auto_797307 ?auto_797316 ) ) ( not ( = ?auto_797307 ?auto_797317 ) ) ( not ( = ?auto_797307 ?auto_797318 ) ) ( not ( = ?auto_797307 ?auto_797319 ) ) ( not ( = ?auto_797307 ?auto_797320 ) ) ( not ( = ?auto_797308 ?auto_797309 ) ) ( not ( = ?auto_797308 ?auto_797310 ) ) ( not ( = ?auto_797308 ?auto_797311 ) ) ( not ( = ?auto_797308 ?auto_797312 ) ) ( not ( = ?auto_797308 ?auto_797313 ) ) ( not ( = ?auto_797308 ?auto_797314 ) ) ( not ( = ?auto_797308 ?auto_797315 ) ) ( not ( = ?auto_797308 ?auto_797316 ) ) ( not ( = ?auto_797308 ?auto_797317 ) ) ( not ( = ?auto_797308 ?auto_797318 ) ) ( not ( = ?auto_797308 ?auto_797319 ) ) ( not ( = ?auto_797308 ?auto_797320 ) ) ( not ( = ?auto_797309 ?auto_797310 ) ) ( not ( = ?auto_797309 ?auto_797311 ) ) ( not ( = ?auto_797309 ?auto_797312 ) ) ( not ( = ?auto_797309 ?auto_797313 ) ) ( not ( = ?auto_797309 ?auto_797314 ) ) ( not ( = ?auto_797309 ?auto_797315 ) ) ( not ( = ?auto_797309 ?auto_797316 ) ) ( not ( = ?auto_797309 ?auto_797317 ) ) ( not ( = ?auto_797309 ?auto_797318 ) ) ( not ( = ?auto_797309 ?auto_797319 ) ) ( not ( = ?auto_797309 ?auto_797320 ) ) ( not ( = ?auto_797310 ?auto_797311 ) ) ( not ( = ?auto_797310 ?auto_797312 ) ) ( not ( = ?auto_797310 ?auto_797313 ) ) ( not ( = ?auto_797310 ?auto_797314 ) ) ( not ( = ?auto_797310 ?auto_797315 ) ) ( not ( = ?auto_797310 ?auto_797316 ) ) ( not ( = ?auto_797310 ?auto_797317 ) ) ( not ( = ?auto_797310 ?auto_797318 ) ) ( not ( = ?auto_797310 ?auto_797319 ) ) ( not ( = ?auto_797310 ?auto_797320 ) ) ( not ( = ?auto_797311 ?auto_797312 ) ) ( not ( = ?auto_797311 ?auto_797313 ) ) ( not ( = ?auto_797311 ?auto_797314 ) ) ( not ( = ?auto_797311 ?auto_797315 ) ) ( not ( = ?auto_797311 ?auto_797316 ) ) ( not ( = ?auto_797311 ?auto_797317 ) ) ( not ( = ?auto_797311 ?auto_797318 ) ) ( not ( = ?auto_797311 ?auto_797319 ) ) ( not ( = ?auto_797311 ?auto_797320 ) ) ( not ( = ?auto_797312 ?auto_797313 ) ) ( not ( = ?auto_797312 ?auto_797314 ) ) ( not ( = ?auto_797312 ?auto_797315 ) ) ( not ( = ?auto_797312 ?auto_797316 ) ) ( not ( = ?auto_797312 ?auto_797317 ) ) ( not ( = ?auto_797312 ?auto_797318 ) ) ( not ( = ?auto_797312 ?auto_797319 ) ) ( not ( = ?auto_797312 ?auto_797320 ) ) ( not ( = ?auto_797313 ?auto_797314 ) ) ( not ( = ?auto_797313 ?auto_797315 ) ) ( not ( = ?auto_797313 ?auto_797316 ) ) ( not ( = ?auto_797313 ?auto_797317 ) ) ( not ( = ?auto_797313 ?auto_797318 ) ) ( not ( = ?auto_797313 ?auto_797319 ) ) ( not ( = ?auto_797313 ?auto_797320 ) ) ( not ( = ?auto_797314 ?auto_797315 ) ) ( not ( = ?auto_797314 ?auto_797316 ) ) ( not ( = ?auto_797314 ?auto_797317 ) ) ( not ( = ?auto_797314 ?auto_797318 ) ) ( not ( = ?auto_797314 ?auto_797319 ) ) ( not ( = ?auto_797314 ?auto_797320 ) ) ( not ( = ?auto_797315 ?auto_797316 ) ) ( not ( = ?auto_797315 ?auto_797317 ) ) ( not ( = ?auto_797315 ?auto_797318 ) ) ( not ( = ?auto_797315 ?auto_797319 ) ) ( not ( = ?auto_797315 ?auto_797320 ) ) ( not ( = ?auto_797316 ?auto_797317 ) ) ( not ( = ?auto_797316 ?auto_797318 ) ) ( not ( = ?auto_797316 ?auto_797319 ) ) ( not ( = ?auto_797316 ?auto_797320 ) ) ( not ( = ?auto_797317 ?auto_797318 ) ) ( not ( = ?auto_797317 ?auto_797319 ) ) ( not ( = ?auto_797317 ?auto_797320 ) ) ( not ( = ?auto_797318 ?auto_797319 ) ) ( not ( = ?auto_797318 ?auto_797320 ) ) ( not ( = ?auto_797319 ?auto_797320 ) ) ( ON ?auto_797318 ?auto_797319 ) ( ON ?auto_797317 ?auto_797318 ) ( ON ?auto_797316 ?auto_797317 ) ( ON ?auto_797315 ?auto_797316 ) ( ON ?auto_797314 ?auto_797315 ) ( ON ?auto_797313 ?auto_797314 ) ( ON ?auto_797312 ?auto_797313 ) ( ON ?auto_797311 ?auto_797312 ) ( CLEAR ?auto_797309 ) ( ON ?auto_797310 ?auto_797311 ) ( CLEAR ?auto_797310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_797305 ?auto_797306 ?auto_797307 ?auto_797308 ?auto_797309 ?auto_797310 )
      ( MAKE-15PILE ?auto_797305 ?auto_797306 ?auto_797307 ?auto_797308 ?auto_797309 ?auto_797310 ?auto_797311 ?auto_797312 ?auto_797313 ?auto_797314 ?auto_797315 ?auto_797316 ?auto_797317 ?auto_797318 ?auto_797319 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_797367 - BLOCK
      ?auto_797368 - BLOCK
      ?auto_797369 - BLOCK
      ?auto_797370 - BLOCK
      ?auto_797371 - BLOCK
      ?auto_797372 - BLOCK
      ?auto_797373 - BLOCK
      ?auto_797374 - BLOCK
      ?auto_797375 - BLOCK
      ?auto_797376 - BLOCK
      ?auto_797377 - BLOCK
      ?auto_797378 - BLOCK
      ?auto_797379 - BLOCK
      ?auto_797380 - BLOCK
      ?auto_797381 - BLOCK
    )
    :vars
    (
      ?auto_797382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_797381 ?auto_797382 ) ( ON-TABLE ?auto_797367 ) ( ON ?auto_797368 ?auto_797367 ) ( ON ?auto_797369 ?auto_797368 ) ( ON ?auto_797370 ?auto_797369 ) ( not ( = ?auto_797367 ?auto_797368 ) ) ( not ( = ?auto_797367 ?auto_797369 ) ) ( not ( = ?auto_797367 ?auto_797370 ) ) ( not ( = ?auto_797367 ?auto_797371 ) ) ( not ( = ?auto_797367 ?auto_797372 ) ) ( not ( = ?auto_797367 ?auto_797373 ) ) ( not ( = ?auto_797367 ?auto_797374 ) ) ( not ( = ?auto_797367 ?auto_797375 ) ) ( not ( = ?auto_797367 ?auto_797376 ) ) ( not ( = ?auto_797367 ?auto_797377 ) ) ( not ( = ?auto_797367 ?auto_797378 ) ) ( not ( = ?auto_797367 ?auto_797379 ) ) ( not ( = ?auto_797367 ?auto_797380 ) ) ( not ( = ?auto_797367 ?auto_797381 ) ) ( not ( = ?auto_797367 ?auto_797382 ) ) ( not ( = ?auto_797368 ?auto_797369 ) ) ( not ( = ?auto_797368 ?auto_797370 ) ) ( not ( = ?auto_797368 ?auto_797371 ) ) ( not ( = ?auto_797368 ?auto_797372 ) ) ( not ( = ?auto_797368 ?auto_797373 ) ) ( not ( = ?auto_797368 ?auto_797374 ) ) ( not ( = ?auto_797368 ?auto_797375 ) ) ( not ( = ?auto_797368 ?auto_797376 ) ) ( not ( = ?auto_797368 ?auto_797377 ) ) ( not ( = ?auto_797368 ?auto_797378 ) ) ( not ( = ?auto_797368 ?auto_797379 ) ) ( not ( = ?auto_797368 ?auto_797380 ) ) ( not ( = ?auto_797368 ?auto_797381 ) ) ( not ( = ?auto_797368 ?auto_797382 ) ) ( not ( = ?auto_797369 ?auto_797370 ) ) ( not ( = ?auto_797369 ?auto_797371 ) ) ( not ( = ?auto_797369 ?auto_797372 ) ) ( not ( = ?auto_797369 ?auto_797373 ) ) ( not ( = ?auto_797369 ?auto_797374 ) ) ( not ( = ?auto_797369 ?auto_797375 ) ) ( not ( = ?auto_797369 ?auto_797376 ) ) ( not ( = ?auto_797369 ?auto_797377 ) ) ( not ( = ?auto_797369 ?auto_797378 ) ) ( not ( = ?auto_797369 ?auto_797379 ) ) ( not ( = ?auto_797369 ?auto_797380 ) ) ( not ( = ?auto_797369 ?auto_797381 ) ) ( not ( = ?auto_797369 ?auto_797382 ) ) ( not ( = ?auto_797370 ?auto_797371 ) ) ( not ( = ?auto_797370 ?auto_797372 ) ) ( not ( = ?auto_797370 ?auto_797373 ) ) ( not ( = ?auto_797370 ?auto_797374 ) ) ( not ( = ?auto_797370 ?auto_797375 ) ) ( not ( = ?auto_797370 ?auto_797376 ) ) ( not ( = ?auto_797370 ?auto_797377 ) ) ( not ( = ?auto_797370 ?auto_797378 ) ) ( not ( = ?auto_797370 ?auto_797379 ) ) ( not ( = ?auto_797370 ?auto_797380 ) ) ( not ( = ?auto_797370 ?auto_797381 ) ) ( not ( = ?auto_797370 ?auto_797382 ) ) ( not ( = ?auto_797371 ?auto_797372 ) ) ( not ( = ?auto_797371 ?auto_797373 ) ) ( not ( = ?auto_797371 ?auto_797374 ) ) ( not ( = ?auto_797371 ?auto_797375 ) ) ( not ( = ?auto_797371 ?auto_797376 ) ) ( not ( = ?auto_797371 ?auto_797377 ) ) ( not ( = ?auto_797371 ?auto_797378 ) ) ( not ( = ?auto_797371 ?auto_797379 ) ) ( not ( = ?auto_797371 ?auto_797380 ) ) ( not ( = ?auto_797371 ?auto_797381 ) ) ( not ( = ?auto_797371 ?auto_797382 ) ) ( not ( = ?auto_797372 ?auto_797373 ) ) ( not ( = ?auto_797372 ?auto_797374 ) ) ( not ( = ?auto_797372 ?auto_797375 ) ) ( not ( = ?auto_797372 ?auto_797376 ) ) ( not ( = ?auto_797372 ?auto_797377 ) ) ( not ( = ?auto_797372 ?auto_797378 ) ) ( not ( = ?auto_797372 ?auto_797379 ) ) ( not ( = ?auto_797372 ?auto_797380 ) ) ( not ( = ?auto_797372 ?auto_797381 ) ) ( not ( = ?auto_797372 ?auto_797382 ) ) ( not ( = ?auto_797373 ?auto_797374 ) ) ( not ( = ?auto_797373 ?auto_797375 ) ) ( not ( = ?auto_797373 ?auto_797376 ) ) ( not ( = ?auto_797373 ?auto_797377 ) ) ( not ( = ?auto_797373 ?auto_797378 ) ) ( not ( = ?auto_797373 ?auto_797379 ) ) ( not ( = ?auto_797373 ?auto_797380 ) ) ( not ( = ?auto_797373 ?auto_797381 ) ) ( not ( = ?auto_797373 ?auto_797382 ) ) ( not ( = ?auto_797374 ?auto_797375 ) ) ( not ( = ?auto_797374 ?auto_797376 ) ) ( not ( = ?auto_797374 ?auto_797377 ) ) ( not ( = ?auto_797374 ?auto_797378 ) ) ( not ( = ?auto_797374 ?auto_797379 ) ) ( not ( = ?auto_797374 ?auto_797380 ) ) ( not ( = ?auto_797374 ?auto_797381 ) ) ( not ( = ?auto_797374 ?auto_797382 ) ) ( not ( = ?auto_797375 ?auto_797376 ) ) ( not ( = ?auto_797375 ?auto_797377 ) ) ( not ( = ?auto_797375 ?auto_797378 ) ) ( not ( = ?auto_797375 ?auto_797379 ) ) ( not ( = ?auto_797375 ?auto_797380 ) ) ( not ( = ?auto_797375 ?auto_797381 ) ) ( not ( = ?auto_797375 ?auto_797382 ) ) ( not ( = ?auto_797376 ?auto_797377 ) ) ( not ( = ?auto_797376 ?auto_797378 ) ) ( not ( = ?auto_797376 ?auto_797379 ) ) ( not ( = ?auto_797376 ?auto_797380 ) ) ( not ( = ?auto_797376 ?auto_797381 ) ) ( not ( = ?auto_797376 ?auto_797382 ) ) ( not ( = ?auto_797377 ?auto_797378 ) ) ( not ( = ?auto_797377 ?auto_797379 ) ) ( not ( = ?auto_797377 ?auto_797380 ) ) ( not ( = ?auto_797377 ?auto_797381 ) ) ( not ( = ?auto_797377 ?auto_797382 ) ) ( not ( = ?auto_797378 ?auto_797379 ) ) ( not ( = ?auto_797378 ?auto_797380 ) ) ( not ( = ?auto_797378 ?auto_797381 ) ) ( not ( = ?auto_797378 ?auto_797382 ) ) ( not ( = ?auto_797379 ?auto_797380 ) ) ( not ( = ?auto_797379 ?auto_797381 ) ) ( not ( = ?auto_797379 ?auto_797382 ) ) ( not ( = ?auto_797380 ?auto_797381 ) ) ( not ( = ?auto_797380 ?auto_797382 ) ) ( not ( = ?auto_797381 ?auto_797382 ) ) ( ON ?auto_797380 ?auto_797381 ) ( ON ?auto_797379 ?auto_797380 ) ( ON ?auto_797378 ?auto_797379 ) ( ON ?auto_797377 ?auto_797378 ) ( ON ?auto_797376 ?auto_797377 ) ( ON ?auto_797375 ?auto_797376 ) ( ON ?auto_797374 ?auto_797375 ) ( ON ?auto_797373 ?auto_797374 ) ( ON ?auto_797372 ?auto_797373 ) ( CLEAR ?auto_797370 ) ( ON ?auto_797371 ?auto_797372 ) ( CLEAR ?auto_797371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_797367 ?auto_797368 ?auto_797369 ?auto_797370 ?auto_797371 )
      ( MAKE-15PILE ?auto_797367 ?auto_797368 ?auto_797369 ?auto_797370 ?auto_797371 ?auto_797372 ?auto_797373 ?auto_797374 ?auto_797375 ?auto_797376 ?auto_797377 ?auto_797378 ?auto_797379 ?auto_797380 ?auto_797381 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_797429 - BLOCK
      ?auto_797430 - BLOCK
      ?auto_797431 - BLOCK
      ?auto_797432 - BLOCK
      ?auto_797433 - BLOCK
      ?auto_797434 - BLOCK
      ?auto_797435 - BLOCK
      ?auto_797436 - BLOCK
      ?auto_797437 - BLOCK
      ?auto_797438 - BLOCK
      ?auto_797439 - BLOCK
      ?auto_797440 - BLOCK
      ?auto_797441 - BLOCK
      ?auto_797442 - BLOCK
      ?auto_797443 - BLOCK
    )
    :vars
    (
      ?auto_797444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_797443 ?auto_797444 ) ( ON-TABLE ?auto_797429 ) ( ON ?auto_797430 ?auto_797429 ) ( ON ?auto_797431 ?auto_797430 ) ( not ( = ?auto_797429 ?auto_797430 ) ) ( not ( = ?auto_797429 ?auto_797431 ) ) ( not ( = ?auto_797429 ?auto_797432 ) ) ( not ( = ?auto_797429 ?auto_797433 ) ) ( not ( = ?auto_797429 ?auto_797434 ) ) ( not ( = ?auto_797429 ?auto_797435 ) ) ( not ( = ?auto_797429 ?auto_797436 ) ) ( not ( = ?auto_797429 ?auto_797437 ) ) ( not ( = ?auto_797429 ?auto_797438 ) ) ( not ( = ?auto_797429 ?auto_797439 ) ) ( not ( = ?auto_797429 ?auto_797440 ) ) ( not ( = ?auto_797429 ?auto_797441 ) ) ( not ( = ?auto_797429 ?auto_797442 ) ) ( not ( = ?auto_797429 ?auto_797443 ) ) ( not ( = ?auto_797429 ?auto_797444 ) ) ( not ( = ?auto_797430 ?auto_797431 ) ) ( not ( = ?auto_797430 ?auto_797432 ) ) ( not ( = ?auto_797430 ?auto_797433 ) ) ( not ( = ?auto_797430 ?auto_797434 ) ) ( not ( = ?auto_797430 ?auto_797435 ) ) ( not ( = ?auto_797430 ?auto_797436 ) ) ( not ( = ?auto_797430 ?auto_797437 ) ) ( not ( = ?auto_797430 ?auto_797438 ) ) ( not ( = ?auto_797430 ?auto_797439 ) ) ( not ( = ?auto_797430 ?auto_797440 ) ) ( not ( = ?auto_797430 ?auto_797441 ) ) ( not ( = ?auto_797430 ?auto_797442 ) ) ( not ( = ?auto_797430 ?auto_797443 ) ) ( not ( = ?auto_797430 ?auto_797444 ) ) ( not ( = ?auto_797431 ?auto_797432 ) ) ( not ( = ?auto_797431 ?auto_797433 ) ) ( not ( = ?auto_797431 ?auto_797434 ) ) ( not ( = ?auto_797431 ?auto_797435 ) ) ( not ( = ?auto_797431 ?auto_797436 ) ) ( not ( = ?auto_797431 ?auto_797437 ) ) ( not ( = ?auto_797431 ?auto_797438 ) ) ( not ( = ?auto_797431 ?auto_797439 ) ) ( not ( = ?auto_797431 ?auto_797440 ) ) ( not ( = ?auto_797431 ?auto_797441 ) ) ( not ( = ?auto_797431 ?auto_797442 ) ) ( not ( = ?auto_797431 ?auto_797443 ) ) ( not ( = ?auto_797431 ?auto_797444 ) ) ( not ( = ?auto_797432 ?auto_797433 ) ) ( not ( = ?auto_797432 ?auto_797434 ) ) ( not ( = ?auto_797432 ?auto_797435 ) ) ( not ( = ?auto_797432 ?auto_797436 ) ) ( not ( = ?auto_797432 ?auto_797437 ) ) ( not ( = ?auto_797432 ?auto_797438 ) ) ( not ( = ?auto_797432 ?auto_797439 ) ) ( not ( = ?auto_797432 ?auto_797440 ) ) ( not ( = ?auto_797432 ?auto_797441 ) ) ( not ( = ?auto_797432 ?auto_797442 ) ) ( not ( = ?auto_797432 ?auto_797443 ) ) ( not ( = ?auto_797432 ?auto_797444 ) ) ( not ( = ?auto_797433 ?auto_797434 ) ) ( not ( = ?auto_797433 ?auto_797435 ) ) ( not ( = ?auto_797433 ?auto_797436 ) ) ( not ( = ?auto_797433 ?auto_797437 ) ) ( not ( = ?auto_797433 ?auto_797438 ) ) ( not ( = ?auto_797433 ?auto_797439 ) ) ( not ( = ?auto_797433 ?auto_797440 ) ) ( not ( = ?auto_797433 ?auto_797441 ) ) ( not ( = ?auto_797433 ?auto_797442 ) ) ( not ( = ?auto_797433 ?auto_797443 ) ) ( not ( = ?auto_797433 ?auto_797444 ) ) ( not ( = ?auto_797434 ?auto_797435 ) ) ( not ( = ?auto_797434 ?auto_797436 ) ) ( not ( = ?auto_797434 ?auto_797437 ) ) ( not ( = ?auto_797434 ?auto_797438 ) ) ( not ( = ?auto_797434 ?auto_797439 ) ) ( not ( = ?auto_797434 ?auto_797440 ) ) ( not ( = ?auto_797434 ?auto_797441 ) ) ( not ( = ?auto_797434 ?auto_797442 ) ) ( not ( = ?auto_797434 ?auto_797443 ) ) ( not ( = ?auto_797434 ?auto_797444 ) ) ( not ( = ?auto_797435 ?auto_797436 ) ) ( not ( = ?auto_797435 ?auto_797437 ) ) ( not ( = ?auto_797435 ?auto_797438 ) ) ( not ( = ?auto_797435 ?auto_797439 ) ) ( not ( = ?auto_797435 ?auto_797440 ) ) ( not ( = ?auto_797435 ?auto_797441 ) ) ( not ( = ?auto_797435 ?auto_797442 ) ) ( not ( = ?auto_797435 ?auto_797443 ) ) ( not ( = ?auto_797435 ?auto_797444 ) ) ( not ( = ?auto_797436 ?auto_797437 ) ) ( not ( = ?auto_797436 ?auto_797438 ) ) ( not ( = ?auto_797436 ?auto_797439 ) ) ( not ( = ?auto_797436 ?auto_797440 ) ) ( not ( = ?auto_797436 ?auto_797441 ) ) ( not ( = ?auto_797436 ?auto_797442 ) ) ( not ( = ?auto_797436 ?auto_797443 ) ) ( not ( = ?auto_797436 ?auto_797444 ) ) ( not ( = ?auto_797437 ?auto_797438 ) ) ( not ( = ?auto_797437 ?auto_797439 ) ) ( not ( = ?auto_797437 ?auto_797440 ) ) ( not ( = ?auto_797437 ?auto_797441 ) ) ( not ( = ?auto_797437 ?auto_797442 ) ) ( not ( = ?auto_797437 ?auto_797443 ) ) ( not ( = ?auto_797437 ?auto_797444 ) ) ( not ( = ?auto_797438 ?auto_797439 ) ) ( not ( = ?auto_797438 ?auto_797440 ) ) ( not ( = ?auto_797438 ?auto_797441 ) ) ( not ( = ?auto_797438 ?auto_797442 ) ) ( not ( = ?auto_797438 ?auto_797443 ) ) ( not ( = ?auto_797438 ?auto_797444 ) ) ( not ( = ?auto_797439 ?auto_797440 ) ) ( not ( = ?auto_797439 ?auto_797441 ) ) ( not ( = ?auto_797439 ?auto_797442 ) ) ( not ( = ?auto_797439 ?auto_797443 ) ) ( not ( = ?auto_797439 ?auto_797444 ) ) ( not ( = ?auto_797440 ?auto_797441 ) ) ( not ( = ?auto_797440 ?auto_797442 ) ) ( not ( = ?auto_797440 ?auto_797443 ) ) ( not ( = ?auto_797440 ?auto_797444 ) ) ( not ( = ?auto_797441 ?auto_797442 ) ) ( not ( = ?auto_797441 ?auto_797443 ) ) ( not ( = ?auto_797441 ?auto_797444 ) ) ( not ( = ?auto_797442 ?auto_797443 ) ) ( not ( = ?auto_797442 ?auto_797444 ) ) ( not ( = ?auto_797443 ?auto_797444 ) ) ( ON ?auto_797442 ?auto_797443 ) ( ON ?auto_797441 ?auto_797442 ) ( ON ?auto_797440 ?auto_797441 ) ( ON ?auto_797439 ?auto_797440 ) ( ON ?auto_797438 ?auto_797439 ) ( ON ?auto_797437 ?auto_797438 ) ( ON ?auto_797436 ?auto_797437 ) ( ON ?auto_797435 ?auto_797436 ) ( ON ?auto_797434 ?auto_797435 ) ( ON ?auto_797433 ?auto_797434 ) ( CLEAR ?auto_797431 ) ( ON ?auto_797432 ?auto_797433 ) ( CLEAR ?auto_797432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_797429 ?auto_797430 ?auto_797431 ?auto_797432 )
      ( MAKE-15PILE ?auto_797429 ?auto_797430 ?auto_797431 ?auto_797432 ?auto_797433 ?auto_797434 ?auto_797435 ?auto_797436 ?auto_797437 ?auto_797438 ?auto_797439 ?auto_797440 ?auto_797441 ?auto_797442 ?auto_797443 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_797491 - BLOCK
      ?auto_797492 - BLOCK
      ?auto_797493 - BLOCK
      ?auto_797494 - BLOCK
      ?auto_797495 - BLOCK
      ?auto_797496 - BLOCK
      ?auto_797497 - BLOCK
      ?auto_797498 - BLOCK
      ?auto_797499 - BLOCK
      ?auto_797500 - BLOCK
      ?auto_797501 - BLOCK
      ?auto_797502 - BLOCK
      ?auto_797503 - BLOCK
      ?auto_797504 - BLOCK
      ?auto_797505 - BLOCK
    )
    :vars
    (
      ?auto_797506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_797505 ?auto_797506 ) ( ON-TABLE ?auto_797491 ) ( ON ?auto_797492 ?auto_797491 ) ( not ( = ?auto_797491 ?auto_797492 ) ) ( not ( = ?auto_797491 ?auto_797493 ) ) ( not ( = ?auto_797491 ?auto_797494 ) ) ( not ( = ?auto_797491 ?auto_797495 ) ) ( not ( = ?auto_797491 ?auto_797496 ) ) ( not ( = ?auto_797491 ?auto_797497 ) ) ( not ( = ?auto_797491 ?auto_797498 ) ) ( not ( = ?auto_797491 ?auto_797499 ) ) ( not ( = ?auto_797491 ?auto_797500 ) ) ( not ( = ?auto_797491 ?auto_797501 ) ) ( not ( = ?auto_797491 ?auto_797502 ) ) ( not ( = ?auto_797491 ?auto_797503 ) ) ( not ( = ?auto_797491 ?auto_797504 ) ) ( not ( = ?auto_797491 ?auto_797505 ) ) ( not ( = ?auto_797491 ?auto_797506 ) ) ( not ( = ?auto_797492 ?auto_797493 ) ) ( not ( = ?auto_797492 ?auto_797494 ) ) ( not ( = ?auto_797492 ?auto_797495 ) ) ( not ( = ?auto_797492 ?auto_797496 ) ) ( not ( = ?auto_797492 ?auto_797497 ) ) ( not ( = ?auto_797492 ?auto_797498 ) ) ( not ( = ?auto_797492 ?auto_797499 ) ) ( not ( = ?auto_797492 ?auto_797500 ) ) ( not ( = ?auto_797492 ?auto_797501 ) ) ( not ( = ?auto_797492 ?auto_797502 ) ) ( not ( = ?auto_797492 ?auto_797503 ) ) ( not ( = ?auto_797492 ?auto_797504 ) ) ( not ( = ?auto_797492 ?auto_797505 ) ) ( not ( = ?auto_797492 ?auto_797506 ) ) ( not ( = ?auto_797493 ?auto_797494 ) ) ( not ( = ?auto_797493 ?auto_797495 ) ) ( not ( = ?auto_797493 ?auto_797496 ) ) ( not ( = ?auto_797493 ?auto_797497 ) ) ( not ( = ?auto_797493 ?auto_797498 ) ) ( not ( = ?auto_797493 ?auto_797499 ) ) ( not ( = ?auto_797493 ?auto_797500 ) ) ( not ( = ?auto_797493 ?auto_797501 ) ) ( not ( = ?auto_797493 ?auto_797502 ) ) ( not ( = ?auto_797493 ?auto_797503 ) ) ( not ( = ?auto_797493 ?auto_797504 ) ) ( not ( = ?auto_797493 ?auto_797505 ) ) ( not ( = ?auto_797493 ?auto_797506 ) ) ( not ( = ?auto_797494 ?auto_797495 ) ) ( not ( = ?auto_797494 ?auto_797496 ) ) ( not ( = ?auto_797494 ?auto_797497 ) ) ( not ( = ?auto_797494 ?auto_797498 ) ) ( not ( = ?auto_797494 ?auto_797499 ) ) ( not ( = ?auto_797494 ?auto_797500 ) ) ( not ( = ?auto_797494 ?auto_797501 ) ) ( not ( = ?auto_797494 ?auto_797502 ) ) ( not ( = ?auto_797494 ?auto_797503 ) ) ( not ( = ?auto_797494 ?auto_797504 ) ) ( not ( = ?auto_797494 ?auto_797505 ) ) ( not ( = ?auto_797494 ?auto_797506 ) ) ( not ( = ?auto_797495 ?auto_797496 ) ) ( not ( = ?auto_797495 ?auto_797497 ) ) ( not ( = ?auto_797495 ?auto_797498 ) ) ( not ( = ?auto_797495 ?auto_797499 ) ) ( not ( = ?auto_797495 ?auto_797500 ) ) ( not ( = ?auto_797495 ?auto_797501 ) ) ( not ( = ?auto_797495 ?auto_797502 ) ) ( not ( = ?auto_797495 ?auto_797503 ) ) ( not ( = ?auto_797495 ?auto_797504 ) ) ( not ( = ?auto_797495 ?auto_797505 ) ) ( not ( = ?auto_797495 ?auto_797506 ) ) ( not ( = ?auto_797496 ?auto_797497 ) ) ( not ( = ?auto_797496 ?auto_797498 ) ) ( not ( = ?auto_797496 ?auto_797499 ) ) ( not ( = ?auto_797496 ?auto_797500 ) ) ( not ( = ?auto_797496 ?auto_797501 ) ) ( not ( = ?auto_797496 ?auto_797502 ) ) ( not ( = ?auto_797496 ?auto_797503 ) ) ( not ( = ?auto_797496 ?auto_797504 ) ) ( not ( = ?auto_797496 ?auto_797505 ) ) ( not ( = ?auto_797496 ?auto_797506 ) ) ( not ( = ?auto_797497 ?auto_797498 ) ) ( not ( = ?auto_797497 ?auto_797499 ) ) ( not ( = ?auto_797497 ?auto_797500 ) ) ( not ( = ?auto_797497 ?auto_797501 ) ) ( not ( = ?auto_797497 ?auto_797502 ) ) ( not ( = ?auto_797497 ?auto_797503 ) ) ( not ( = ?auto_797497 ?auto_797504 ) ) ( not ( = ?auto_797497 ?auto_797505 ) ) ( not ( = ?auto_797497 ?auto_797506 ) ) ( not ( = ?auto_797498 ?auto_797499 ) ) ( not ( = ?auto_797498 ?auto_797500 ) ) ( not ( = ?auto_797498 ?auto_797501 ) ) ( not ( = ?auto_797498 ?auto_797502 ) ) ( not ( = ?auto_797498 ?auto_797503 ) ) ( not ( = ?auto_797498 ?auto_797504 ) ) ( not ( = ?auto_797498 ?auto_797505 ) ) ( not ( = ?auto_797498 ?auto_797506 ) ) ( not ( = ?auto_797499 ?auto_797500 ) ) ( not ( = ?auto_797499 ?auto_797501 ) ) ( not ( = ?auto_797499 ?auto_797502 ) ) ( not ( = ?auto_797499 ?auto_797503 ) ) ( not ( = ?auto_797499 ?auto_797504 ) ) ( not ( = ?auto_797499 ?auto_797505 ) ) ( not ( = ?auto_797499 ?auto_797506 ) ) ( not ( = ?auto_797500 ?auto_797501 ) ) ( not ( = ?auto_797500 ?auto_797502 ) ) ( not ( = ?auto_797500 ?auto_797503 ) ) ( not ( = ?auto_797500 ?auto_797504 ) ) ( not ( = ?auto_797500 ?auto_797505 ) ) ( not ( = ?auto_797500 ?auto_797506 ) ) ( not ( = ?auto_797501 ?auto_797502 ) ) ( not ( = ?auto_797501 ?auto_797503 ) ) ( not ( = ?auto_797501 ?auto_797504 ) ) ( not ( = ?auto_797501 ?auto_797505 ) ) ( not ( = ?auto_797501 ?auto_797506 ) ) ( not ( = ?auto_797502 ?auto_797503 ) ) ( not ( = ?auto_797502 ?auto_797504 ) ) ( not ( = ?auto_797502 ?auto_797505 ) ) ( not ( = ?auto_797502 ?auto_797506 ) ) ( not ( = ?auto_797503 ?auto_797504 ) ) ( not ( = ?auto_797503 ?auto_797505 ) ) ( not ( = ?auto_797503 ?auto_797506 ) ) ( not ( = ?auto_797504 ?auto_797505 ) ) ( not ( = ?auto_797504 ?auto_797506 ) ) ( not ( = ?auto_797505 ?auto_797506 ) ) ( ON ?auto_797504 ?auto_797505 ) ( ON ?auto_797503 ?auto_797504 ) ( ON ?auto_797502 ?auto_797503 ) ( ON ?auto_797501 ?auto_797502 ) ( ON ?auto_797500 ?auto_797501 ) ( ON ?auto_797499 ?auto_797500 ) ( ON ?auto_797498 ?auto_797499 ) ( ON ?auto_797497 ?auto_797498 ) ( ON ?auto_797496 ?auto_797497 ) ( ON ?auto_797495 ?auto_797496 ) ( ON ?auto_797494 ?auto_797495 ) ( CLEAR ?auto_797492 ) ( ON ?auto_797493 ?auto_797494 ) ( CLEAR ?auto_797493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_797491 ?auto_797492 ?auto_797493 )
      ( MAKE-15PILE ?auto_797491 ?auto_797492 ?auto_797493 ?auto_797494 ?auto_797495 ?auto_797496 ?auto_797497 ?auto_797498 ?auto_797499 ?auto_797500 ?auto_797501 ?auto_797502 ?auto_797503 ?auto_797504 ?auto_797505 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_797553 - BLOCK
      ?auto_797554 - BLOCK
      ?auto_797555 - BLOCK
      ?auto_797556 - BLOCK
      ?auto_797557 - BLOCK
      ?auto_797558 - BLOCK
      ?auto_797559 - BLOCK
      ?auto_797560 - BLOCK
      ?auto_797561 - BLOCK
      ?auto_797562 - BLOCK
      ?auto_797563 - BLOCK
      ?auto_797564 - BLOCK
      ?auto_797565 - BLOCK
      ?auto_797566 - BLOCK
      ?auto_797567 - BLOCK
    )
    :vars
    (
      ?auto_797568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_797567 ?auto_797568 ) ( ON-TABLE ?auto_797553 ) ( not ( = ?auto_797553 ?auto_797554 ) ) ( not ( = ?auto_797553 ?auto_797555 ) ) ( not ( = ?auto_797553 ?auto_797556 ) ) ( not ( = ?auto_797553 ?auto_797557 ) ) ( not ( = ?auto_797553 ?auto_797558 ) ) ( not ( = ?auto_797553 ?auto_797559 ) ) ( not ( = ?auto_797553 ?auto_797560 ) ) ( not ( = ?auto_797553 ?auto_797561 ) ) ( not ( = ?auto_797553 ?auto_797562 ) ) ( not ( = ?auto_797553 ?auto_797563 ) ) ( not ( = ?auto_797553 ?auto_797564 ) ) ( not ( = ?auto_797553 ?auto_797565 ) ) ( not ( = ?auto_797553 ?auto_797566 ) ) ( not ( = ?auto_797553 ?auto_797567 ) ) ( not ( = ?auto_797553 ?auto_797568 ) ) ( not ( = ?auto_797554 ?auto_797555 ) ) ( not ( = ?auto_797554 ?auto_797556 ) ) ( not ( = ?auto_797554 ?auto_797557 ) ) ( not ( = ?auto_797554 ?auto_797558 ) ) ( not ( = ?auto_797554 ?auto_797559 ) ) ( not ( = ?auto_797554 ?auto_797560 ) ) ( not ( = ?auto_797554 ?auto_797561 ) ) ( not ( = ?auto_797554 ?auto_797562 ) ) ( not ( = ?auto_797554 ?auto_797563 ) ) ( not ( = ?auto_797554 ?auto_797564 ) ) ( not ( = ?auto_797554 ?auto_797565 ) ) ( not ( = ?auto_797554 ?auto_797566 ) ) ( not ( = ?auto_797554 ?auto_797567 ) ) ( not ( = ?auto_797554 ?auto_797568 ) ) ( not ( = ?auto_797555 ?auto_797556 ) ) ( not ( = ?auto_797555 ?auto_797557 ) ) ( not ( = ?auto_797555 ?auto_797558 ) ) ( not ( = ?auto_797555 ?auto_797559 ) ) ( not ( = ?auto_797555 ?auto_797560 ) ) ( not ( = ?auto_797555 ?auto_797561 ) ) ( not ( = ?auto_797555 ?auto_797562 ) ) ( not ( = ?auto_797555 ?auto_797563 ) ) ( not ( = ?auto_797555 ?auto_797564 ) ) ( not ( = ?auto_797555 ?auto_797565 ) ) ( not ( = ?auto_797555 ?auto_797566 ) ) ( not ( = ?auto_797555 ?auto_797567 ) ) ( not ( = ?auto_797555 ?auto_797568 ) ) ( not ( = ?auto_797556 ?auto_797557 ) ) ( not ( = ?auto_797556 ?auto_797558 ) ) ( not ( = ?auto_797556 ?auto_797559 ) ) ( not ( = ?auto_797556 ?auto_797560 ) ) ( not ( = ?auto_797556 ?auto_797561 ) ) ( not ( = ?auto_797556 ?auto_797562 ) ) ( not ( = ?auto_797556 ?auto_797563 ) ) ( not ( = ?auto_797556 ?auto_797564 ) ) ( not ( = ?auto_797556 ?auto_797565 ) ) ( not ( = ?auto_797556 ?auto_797566 ) ) ( not ( = ?auto_797556 ?auto_797567 ) ) ( not ( = ?auto_797556 ?auto_797568 ) ) ( not ( = ?auto_797557 ?auto_797558 ) ) ( not ( = ?auto_797557 ?auto_797559 ) ) ( not ( = ?auto_797557 ?auto_797560 ) ) ( not ( = ?auto_797557 ?auto_797561 ) ) ( not ( = ?auto_797557 ?auto_797562 ) ) ( not ( = ?auto_797557 ?auto_797563 ) ) ( not ( = ?auto_797557 ?auto_797564 ) ) ( not ( = ?auto_797557 ?auto_797565 ) ) ( not ( = ?auto_797557 ?auto_797566 ) ) ( not ( = ?auto_797557 ?auto_797567 ) ) ( not ( = ?auto_797557 ?auto_797568 ) ) ( not ( = ?auto_797558 ?auto_797559 ) ) ( not ( = ?auto_797558 ?auto_797560 ) ) ( not ( = ?auto_797558 ?auto_797561 ) ) ( not ( = ?auto_797558 ?auto_797562 ) ) ( not ( = ?auto_797558 ?auto_797563 ) ) ( not ( = ?auto_797558 ?auto_797564 ) ) ( not ( = ?auto_797558 ?auto_797565 ) ) ( not ( = ?auto_797558 ?auto_797566 ) ) ( not ( = ?auto_797558 ?auto_797567 ) ) ( not ( = ?auto_797558 ?auto_797568 ) ) ( not ( = ?auto_797559 ?auto_797560 ) ) ( not ( = ?auto_797559 ?auto_797561 ) ) ( not ( = ?auto_797559 ?auto_797562 ) ) ( not ( = ?auto_797559 ?auto_797563 ) ) ( not ( = ?auto_797559 ?auto_797564 ) ) ( not ( = ?auto_797559 ?auto_797565 ) ) ( not ( = ?auto_797559 ?auto_797566 ) ) ( not ( = ?auto_797559 ?auto_797567 ) ) ( not ( = ?auto_797559 ?auto_797568 ) ) ( not ( = ?auto_797560 ?auto_797561 ) ) ( not ( = ?auto_797560 ?auto_797562 ) ) ( not ( = ?auto_797560 ?auto_797563 ) ) ( not ( = ?auto_797560 ?auto_797564 ) ) ( not ( = ?auto_797560 ?auto_797565 ) ) ( not ( = ?auto_797560 ?auto_797566 ) ) ( not ( = ?auto_797560 ?auto_797567 ) ) ( not ( = ?auto_797560 ?auto_797568 ) ) ( not ( = ?auto_797561 ?auto_797562 ) ) ( not ( = ?auto_797561 ?auto_797563 ) ) ( not ( = ?auto_797561 ?auto_797564 ) ) ( not ( = ?auto_797561 ?auto_797565 ) ) ( not ( = ?auto_797561 ?auto_797566 ) ) ( not ( = ?auto_797561 ?auto_797567 ) ) ( not ( = ?auto_797561 ?auto_797568 ) ) ( not ( = ?auto_797562 ?auto_797563 ) ) ( not ( = ?auto_797562 ?auto_797564 ) ) ( not ( = ?auto_797562 ?auto_797565 ) ) ( not ( = ?auto_797562 ?auto_797566 ) ) ( not ( = ?auto_797562 ?auto_797567 ) ) ( not ( = ?auto_797562 ?auto_797568 ) ) ( not ( = ?auto_797563 ?auto_797564 ) ) ( not ( = ?auto_797563 ?auto_797565 ) ) ( not ( = ?auto_797563 ?auto_797566 ) ) ( not ( = ?auto_797563 ?auto_797567 ) ) ( not ( = ?auto_797563 ?auto_797568 ) ) ( not ( = ?auto_797564 ?auto_797565 ) ) ( not ( = ?auto_797564 ?auto_797566 ) ) ( not ( = ?auto_797564 ?auto_797567 ) ) ( not ( = ?auto_797564 ?auto_797568 ) ) ( not ( = ?auto_797565 ?auto_797566 ) ) ( not ( = ?auto_797565 ?auto_797567 ) ) ( not ( = ?auto_797565 ?auto_797568 ) ) ( not ( = ?auto_797566 ?auto_797567 ) ) ( not ( = ?auto_797566 ?auto_797568 ) ) ( not ( = ?auto_797567 ?auto_797568 ) ) ( ON ?auto_797566 ?auto_797567 ) ( ON ?auto_797565 ?auto_797566 ) ( ON ?auto_797564 ?auto_797565 ) ( ON ?auto_797563 ?auto_797564 ) ( ON ?auto_797562 ?auto_797563 ) ( ON ?auto_797561 ?auto_797562 ) ( ON ?auto_797560 ?auto_797561 ) ( ON ?auto_797559 ?auto_797560 ) ( ON ?auto_797558 ?auto_797559 ) ( ON ?auto_797557 ?auto_797558 ) ( ON ?auto_797556 ?auto_797557 ) ( ON ?auto_797555 ?auto_797556 ) ( CLEAR ?auto_797553 ) ( ON ?auto_797554 ?auto_797555 ) ( CLEAR ?auto_797554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_797553 ?auto_797554 )
      ( MAKE-15PILE ?auto_797553 ?auto_797554 ?auto_797555 ?auto_797556 ?auto_797557 ?auto_797558 ?auto_797559 ?auto_797560 ?auto_797561 ?auto_797562 ?auto_797563 ?auto_797564 ?auto_797565 ?auto_797566 ?auto_797567 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_797615 - BLOCK
      ?auto_797616 - BLOCK
      ?auto_797617 - BLOCK
      ?auto_797618 - BLOCK
      ?auto_797619 - BLOCK
      ?auto_797620 - BLOCK
      ?auto_797621 - BLOCK
      ?auto_797622 - BLOCK
      ?auto_797623 - BLOCK
      ?auto_797624 - BLOCK
      ?auto_797625 - BLOCK
      ?auto_797626 - BLOCK
      ?auto_797627 - BLOCK
      ?auto_797628 - BLOCK
      ?auto_797629 - BLOCK
    )
    :vars
    (
      ?auto_797630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_797629 ?auto_797630 ) ( not ( = ?auto_797615 ?auto_797616 ) ) ( not ( = ?auto_797615 ?auto_797617 ) ) ( not ( = ?auto_797615 ?auto_797618 ) ) ( not ( = ?auto_797615 ?auto_797619 ) ) ( not ( = ?auto_797615 ?auto_797620 ) ) ( not ( = ?auto_797615 ?auto_797621 ) ) ( not ( = ?auto_797615 ?auto_797622 ) ) ( not ( = ?auto_797615 ?auto_797623 ) ) ( not ( = ?auto_797615 ?auto_797624 ) ) ( not ( = ?auto_797615 ?auto_797625 ) ) ( not ( = ?auto_797615 ?auto_797626 ) ) ( not ( = ?auto_797615 ?auto_797627 ) ) ( not ( = ?auto_797615 ?auto_797628 ) ) ( not ( = ?auto_797615 ?auto_797629 ) ) ( not ( = ?auto_797615 ?auto_797630 ) ) ( not ( = ?auto_797616 ?auto_797617 ) ) ( not ( = ?auto_797616 ?auto_797618 ) ) ( not ( = ?auto_797616 ?auto_797619 ) ) ( not ( = ?auto_797616 ?auto_797620 ) ) ( not ( = ?auto_797616 ?auto_797621 ) ) ( not ( = ?auto_797616 ?auto_797622 ) ) ( not ( = ?auto_797616 ?auto_797623 ) ) ( not ( = ?auto_797616 ?auto_797624 ) ) ( not ( = ?auto_797616 ?auto_797625 ) ) ( not ( = ?auto_797616 ?auto_797626 ) ) ( not ( = ?auto_797616 ?auto_797627 ) ) ( not ( = ?auto_797616 ?auto_797628 ) ) ( not ( = ?auto_797616 ?auto_797629 ) ) ( not ( = ?auto_797616 ?auto_797630 ) ) ( not ( = ?auto_797617 ?auto_797618 ) ) ( not ( = ?auto_797617 ?auto_797619 ) ) ( not ( = ?auto_797617 ?auto_797620 ) ) ( not ( = ?auto_797617 ?auto_797621 ) ) ( not ( = ?auto_797617 ?auto_797622 ) ) ( not ( = ?auto_797617 ?auto_797623 ) ) ( not ( = ?auto_797617 ?auto_797624 ) ) ( not ( = ?auto_797617 ?auto_797625 ) ) ( not ( = ?auto_797617 ?auto_797626 ) ) ( not ( = ?auto_797617 ?auto_797627 ) ) ( not ( = ?auto_797617 ?auto_797628 ) ) ( not ( = ?auto_797617 ?auto_797629 ) ) ( not ( = ?auto_797617 ?auto_797630 ) ) ( not ( = ?auto_797618 ?auto_797619 ) ) ( not ( = ?auto_797618 ?auto_797620 ) ) ( not ( = ?auto_797618 ?auto_797621 ) ) ( not ( = ?auto_797618 ?auto_797622 ) ) ( not ( = ?auto_797618 ?auto_797623 ) ) ( not ( = ?auto_797618 ?auto_797624 ) ) ( not ( = ?auto_797618 ?auto_797625 ) ) ( not ( = ?auto_797618 ?auto_797626 ) ) ( not ( = ?auto_797618 ?auto_797627 ) ) ( not ( = ?auto_797618 ?auto_797628 ) ) ( not ( = ?auto_797618 ?auto_797629 ) ) ( not ( = ?auto_797618 ?auto_797630 ) ) ( not ( = ?auto_797619 ?auto_797620 ) ) ( not ( = ?auto_797619 ?auto_797621 ) ) ( not ( = ?auto_797619 ?auto_797622 ) ) ( not ( = ?auto_797619 ?auto_797623 ) ) ( not ( = ?auto_797619 ?auto_797624 ) ) ( not ( = ?auto_797619 ?auto_797625 ) ) ( not ( = ?auto_797619 ?auto_797626 ) ) ( not ( = ?auto_797619 ?auto_797627 ) ) ( not ( = ?auto_797619 ?auto_797628 ) ) ( not ( = ?auto_797619 ?auto_797629 ) ) ( not ( = ?auto_797619 ?auto_797630 ) ) ( not ( = ?auto_797620 ?auto_797621 ) ) ( not ( = ?auto_797620 ?auto_797622 ) ) ( not ( = ?auto_797620 ?auto_797623 ) ) ( not ( = ?auto_797620 ?auto_797624 ) ) ( not ( = ?auto_797620 ?auto_797625 ) ) ( not ( = ?auto_797620 ?auto_797626 ) ) ( not ( = ?auto_797620 ?auto_797627 ) ) ( not ( = ?auto_797620 ?auto_797628 ) ) ( not ( = ?auto_797620 ?auto_797629 ) ) ( not ( = ?auto_797620 ?auto_797630 ) ) ( not ( = ?auto_797621 ?auto_797622 ) ) ( not ( = ?auto_797621 ?auto_797623 ) ) ( not ( = ?auto_797621 ?auto_797624 ) ) ( not ( = ?auto_797621 ?auto_797625 ) ) ( not ( = ?auto_797621 ?auto_797626 ) ) ( not ( = ?auto_797621 ?auto_797627 ) ) ( not ( = ?auto_797621 ?auto_797628 ) ) ( not ( = ?auto_797621 ?auto_797629 ) ) ( not ( = ?auto_797621 ?auto_797630 ) ) ( not ( = ?auto_797622 ?auto_797623 ) ) ( not ( = ?auto_797622 ?auto_797624 ) ) ( not ( = ?auto_797622 ?auto_797625 ) ) ( not ( = ?auto_797622 ?auto_797626 ) ) ( not ( = ?auto_797622 ?auto_797627 ) ) ( not ( = ?auto_797622 ?auto_797628 ) ) ( not ( = ?auto_797622 ?auto_797629 ) ) ( not ( = ?auto_797622 ?auto_797630 ) ) ( not ( = ?auto_797623 ?auto_797624 ) ) ( not ( = ?auto_797623 ?auto_797625 ) ) ( not ( = ?auto_797623 ?auto_797626 ) ) ( not ( = ?auto_797623 ?auto_797627 ) ) ( not ( = ?auto_797623 ?auto_797628 ) ) ( not ( = ?auto_797623 ?auto_797629 ) ) ( not ( = ?auto_797623 ?auto_797630 ) ) ( not ( = ?auto_797624 ?auto_797625 ) ) ( not ( = ?auto_797624 ?auto_797626 ) ) ( not ( = ?auto_797624 ?auto_797627 ) ) ( not ( = ?auto_797624 ?auto_797628 ) ) ( not ( = ?auto_797624 ?auto_797629 ) ) ( not ( = ?auto_797624 ?auto_797630 ) ) ( not ( = ?auto_797625 ?auto_797626 ) ) ( not ( = ?auto_797625 ?auto_797627 ) ) ( not ( = ?auto_797625 ?auto_797628 ) ) ( not ( = ?auto_797625 ?auto_797629 ) ) ( not ( = ?auto_797625 ?auto_797630 ) ) ( not ( = ?auto_797626 ?auto_797627 ) ) ( not ( = ?auto_797626 ?auto_797628 ) ) ( not ( = ?auto_797626 ?auto_797629 ) ) ( not ( = ?auto_797626 ?auto_797630 ) ) ( not ( = ?auto_797627 ?auto_797628 ) ) ( not ( = ?auto_797627 ?auto_797629 ) ) ( not ( = ?auto_797627 ?auto_797630 ) ) ( not ( = ?auto_797628 ?auto_797629 ) ) ( not ( = ?auto_797628 ?auto_797630 ) ) ( not ( = ?auto_797629 ?auto_797630 ) ) ( ON ?auto_797628 ?auto_797629 ) ( ON ?auto_797627 ?auto_797628 ) ( ON ?auto_797626 ?auto_797627 ) ( ON ?auto_797625 ?auto_797626 ) ( ON ?auto_797624 ?auto_797625 ) ( ON ?auto_797623 ?auto_797624 ) ( ON ?auto_797622 ?auto_797623 ) ( ON ?auto_797621 ?auto_797622 ) ( ON ?auto_797620 ?auto_797621 ) ( ON ?auto_797619 ?auto_797620 ) ( ON ?auto_797618 ?auto_797619 ) ( ON ?auto_797617 ?auto_797618 ) ( ON ?auto_797616 ?auto_797617 ) ( ON ?auto_797615 ?auto_797616 ) ( CLEAR ?auto_797615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_797615 )
      ( MAKE-15PILE ?auto_797615 ?auto_797616 ?auto_797617 ?auto_797618 ?auto_797619 ?auto_797620 ?auto_797621 ?auto_797622 ?auto_797623 ?auto_797624 ?auto_797625 ?auto_797626 ?auto_797627 ?auto_797628 ?auto_797629 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_797678 - BLOCK
      ?auto_797679 - BLOCK
      ?auto_797680 - BLOCK
      ?auto_797681 - BLOCK
      ?auto_797682 - BLOCK
      ?auto_797683 - BLOCK
      ?auto_797684 - BLOCK
      ?auto_797685 - BLOCK
      ?auto_797686 - BLOCK
      ?auto_797687 - BLOCK
      ?auto_797688 - BLOCK
      ?auto_797689 - BLOCK
      ?auto_797690 - BLOCK
      ?auto_797691 - BLOCK
      ?auto_797692 - BLOCK
      ?auto_797693 - BLOCK
    )
    :vars
    (
      ?auto_797694 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_797692 ) ( ON ?auto_797693 ?auto_797694 ) ( CLEAR ?auto_797693 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_797678 ) ( ON ?auto_797679 ?auto_797678 ) ( ON ?auto_797680 ?auto_797679 ) ( ON ?auto_797681 ?auto_797680 ) ( ON ?auto_797682 ?auto_797681 ) ( ON ?auto_797683 ?auto_797682 ) ( ON ?auto_797684 ?auto_797683 ) ( ON ?auto_797685 ?auto_797684 ) ( ON ?auto_797686 ?auto_797685 ) ( ON ?auto_797687 ?auto_797686 ) ( ON ?auto_797688 ?auto_797687 ) ( ON ?auto_797689 ?auto_797688 ) ( ON ?auto_797690 ?auto_797689 ) ( ON ?auto_797691 ?auto_797690 ) ( ON ?auto_797692 ?auto_797691 ) ( not ( = ?auto_797678 ?auto_797679 ) ) ( not ( = ?auto_797678 ?auto_797680 ) ) ( not ( = ?auto_797678 ?auto_797681 ) ) ( not ( = ?auto_797678 ?auto_797682 ) ) ( not ( = ?auto_797678 ?auto_797683 ) ) ( not ( = ?auto_797678 ?auto_797684 ) ) ( not ( = ?auto_797678 ?auto_797685 ) ) ( not ( = ?auto_797678 ?auto_797686 ) ) ( not ( = ?auto_797678 ?auto_797687 ) ) ( not ( = ?auto_797678 ?auto_797688 ) ) ( not ( = ?auto_797678 ?auto_797689 ) ) ( not ( = ?auto_797678 ?auto_797690 ) ) ( not ( = ?auto_797678 ?auto_797691 ) ) ( not ( = ?auto_797678 ?auto_797692 ) ) ( not ( = ?auto_797678 ?auto_797693 ) ) ( not ( = ?auto_797678 ?auto_797694 ) ) ( not ( = ?auto_797679 ?auto_797680 ) ) ( not ( = ?auto_797679 ?auto_797681 ) ) ( not ( = ?auto_797679 ?auto_797682 ) ) ( not ( = ?auto_797679 ?auto_797683 ) ) ( not ( = ?auto_797679 ?auto_797684 ) ) ( not ( = ?auto_797679 ?auto_797685 ) ) ( not ( = ?auto_797679 ?auto_797686 ) ) ( not ( = ?auto_797679 ?auto_797687 ) ) ( not ( = ?auto_797679 ?auto_797688 ) ) ( not ( = ?auto_797679 ?auto_797689 ) ) ( not ( = ?auto_797679 ?auto_797690 ) ) ( not ( = ?auto_797679 ?auto_797691 ) ) ( not ( = ?auto_797679 ?auto_797692 ) ) ( not ( = ?auto_797679 ?auto_797693 ) ) ( not ( = ?auto_797679 ?auto_797694 ) ) ( not ( = ?auto_797680 ?auto_797681 ) ) ( not ( = ?auto_797680 ?auto_797682 ) ) ( not ( = ?auto_797680 ?auto_797683 ) ) ( not ( = ?auto_797680 ?auto_797684 ) ) ( not ( = ?auto_797680 ?auto_797685 ) ) ( not ( = ?auto_797680 ?auto_797686 ) ) ( not ( = ?auto_797680 ?auto_797687 ) ) ( not ( = ?auto_797680 ?auto_797688 ) ) ( not ( = ?auto_797680 ?auto_797689 ) ) ( not ( = ?auto_797680 ?auto_797690 ) ) ( not ( = ?auto_797680 ?auto_797691 ) ) ( not ( = ?auto_797680 ?auto_797692 ) ) ( not ( = ?auto_797680 ?auto_797693 ) ) ( not ( = ?auto_797680 ?auto_797694 ) ) ( not ( = ?auto_797681 ?auto_797682 ) ) ( not ( = ?auto_797681 ?auto_797683 ) ) ( not ( = ?auto_797681 ?auto_797684 ) ) ( not ( = ?auto_797681 ?auto_797685 ) ) ( not ( = ?auto_797681 ?auto_797686 ) ) ( not ( = ?auto_797681 ?auto_797687 ) ) ( not ( = ?auto_797681 ?auto_797688 ) ) ( not ( = ?auto_797681 ?auto_797689 ) ) ( not ( = ?auto_797681 ?auto_797690 ) ) ( not ( = ?auto_797681 ?auto_797691 ) ) ( not ( = ?auto_797681 ?auto_797692 ) ) ( not ( = ?auto_797681 ?auto_797693 ) ) ( not ( = ?auto_797681 ?auto_797694 ) ) ( not ( = ?auto_797682 ?auto_797683 ) ) ( not ( = ?auto_797682 ?auto_797684 ) ) ( not ( = ?auto_797682 ?auto_797685 ) ) ( not ( = ?auto_797682 ?auto_797686 ) ) ( not ( = ?auto_797682 ?auto_797687 ) ) ( not ( = ?auto_797682 ?auto_797688 ) ) ( not ( = ?auto_797682 ?auto_797689 ) ) ( not ( = ?auto_797682 ?auto_797690 ) ) ( not ( = ?auto_797682 ?auto_797691 ) ) ( not ( = ?auto_797682 ?auto_797692 ) ) ( not ( = ?auto_797682 ?auto_797693 ) ) ( not ( = ?auto_797682 ?auto_797694 ) ) ( not ( = ?auto_797683 ?auto_797684 ) ) ( not ( = ?auto_797683 ?auto_797685 ) ) ( not ( = ?auto_797683 ?auto_797686 ) ) ( not ( = ?auto_797683 ?auto_797687 ) ) ( not ( = ?auto_797683 ?auto_797688 ) ) ( not ( = ?auto_797683 ?auto_797689 ) ) ( not ( = ?auto_797683 ?auto_797690 ) ) ( not ( = ?auto_797683 ?auto_797691 ) ) ( not ( = ?auto_797683 ?auto_797692 ) ) ( not ( = ?auto_797683 ?auto_797693 ) ) ( not ( = ?auto_797683 ?auto_797694 ) ) ( not ( = ?auto_797684 ?auto_797685 ) ) ( not ( = ?auto_797684 ?auto_797686 ) ) ( not ( = ?auto_797684 ?auto_797687 ) ) ( not ( = ?auto_797684 ?auto_797688 ) ) ( not ( = ?auto_797684 ?auto_797689 ) ) ( not ( = ?auto_797684 ?auto_797690 ) ) ( not ( = ?auto_797684 ?auto_797691 ) ) ( not ( = ?auto_797684 ?auto_797692 ) ) ( not ( = ?auto_797684 ?auto_797693 ) ) ( not ( = ?auto_797684 ?auto_797694 ) ) ( not ( = ?auto_797685 ?auto_797686 ) ) ( not ( = ?auto_797685 ?auto_797687 ) ) ( not ( = ?auto_797685 ?auto_797688 ) ) ( not ( = ?auto_797685 ?auto_797689 ) ) ( not ( = ?auto_797685 ?auto_797690 ) ) ( not ( = ?auto_797685 ?auto_797691 ) ) ( not ( = ?auto_797685 ?auto_797692 ) ) ( not ( = ?auto_797685 ?auto_797693 ) ) ( not ( = ?auto_797685 ?auto_797694 ) ) ( not ( = ?auto_797686 ?auto_797687 ) ) ( not ( = ?auto_797686 ?auto_797688 ) ) ( not ( = ?auto_797686 ?auto_797689 ) ) ( not ( = ?auto_797686 ?auto_797690 ) ) ( not ( = ?auto_797686 ?auto_797691 ) ) ( not ( = ?auto_797686 ?auto_797692 ) ) ( not ( = ?auto_797686 ?auto_797693 ) ) ( not ( = ?auto_797686 ?auto_797694 ) ) ( not ( = ?auto_797687 ?auto_797688 ) ) ( not ( = ?auto_797687 ?auto_797689 ) ) ( not ( = ?auto_797687 ?auto_797690 ) ) ( not ( = ?auto_797687 ?auto_797691 ) ) ( not ( = ?auto_797687 ?auto_797692 ) ) ( not ( = ?auto_797687 ?auto_797693 ) ) ( not ( = ?auto_797687 ?auto_797694 ) ) ( not ( = ?auto_797688 ?auto_797689 ) ) ( not ( = ?auto_797688 ?auto_797690 ) ) ( not ( = ?auto_797688 ?auto_797691 ) ) ( not ( = ?auto_797688 ?auto_797692 ) ) ( not ( = ?auto_797688 ?auto_797693 ) ) ( not ( = ?auto_797688 ?auto_797694 ) ) ( not ( = ?auto_797689 ?auto_797690 ) ) ( not ( = ?auto_797689 ?auto_797691 ) ) ( not ( = ?auto_797689 ?auto_797692 ) ) ( not ( = ?auto_797689 ?auto_797693 ) ) ( not ( = ?auto_797689 ?auto_797694 ) ) ( not ( = ?auto_797690 ?auto_797691 ) ) ( not ( = ?auto_797690 ?auto_797692 ) ) ( not ( = ?auto_797690 ?auto_797693 ) ) ( not ( = ?auto_797690 ?auto_797694 ) ) ( not ( = ?auto_797691 ?auto_797692 ) ) ( not ( = ?auto_797691 ?auto_797693 ) ) ( not ( = ?auto_797691 ?auto_797694 ) ) ( not ( = ?auto_797692 ?auto_797693 ) ) ( not ( = ?auto_797692 ?auto_797694 ) ) ( not ( = ?auto_797693 ?auto_797694 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_797693 ?auto_797694 )
      ( !STACK ?auto_797693 ?auto_797692 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_797744 - BLOCK
      ?auto_797745 - BLOCK
      ?auto_797746 - BLOCK
      ?auto_797747 - BLOCK
      ?auto_797748 - BLOCK
      ?auto_797749 - BLOCK
      ?auto_797750 - BLOCK
      ?auto_797751 - BLOCK
      ?auto_797752 - BLOCK
      ?auto_797753 - BLOCK
      ?auto_797754 - BLOCK
      ?auto_797755 - BLOCK
      ?auto_797756 - BLOCK
      ?auto_797757 - BLOCK
      ?auto_797758 - BLOCK
      ?auto_797759 - BLOCK
    )
    :vars
    (
      ?auto_797760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_797759 ?auto_797760 ) ( ON-TABLE ?auto_797744 ) ( ON ?auto_797745 ?auto_797744 ) ( ON ?auto_797746 ?auto_797745 ) ( ON ?auto_797747 ?auto_797746 ) ( ON ?auto_797748 ?auto_797747 ) ( ON ?auto_797749 ?auto_797748 ) ( ON ?auto_797750 ?auto_797749 ) ( ON ?auto_797751 ?auto_797750 ) ( ON ?auto_797752 ?auto_797751 ) ( ON ?auto_797753 ?auto_797752 ) ( ON ?auto_797754 ?auto_797753 ) ( ON ?auto_797755 ?auto_797754 ) ( ON ?auto_797756 ?auto_797755 ) ( ON ?auto_797757 ?auto_797756 ) ( not ( = ?auto_797744 ?auto_797745 ) ) ( not ( = ?auto_797744 ?auto_797746 ) ) ( not ( = ?auto_797744 ?auto_797747 ) ) ( not ( = ?auto_797744 ?auto_797748 ) ) ( not ( = ?auto_797744 ?auto_797749 ) ) ( not ( = ?auto_797744 ?auto_797750 ) ) ( not ( = ?auto_797744 ?auto_797751 ) ) ( not ( = ?auto_797744 ?auto_797752 ) ) ( not ( = ?auto_797744 ?auto_797753 ) ) ( not ( = ?auto_797744 ?auto_797754 ) ) ( not ( = ?auto_797744 ?auto_797755 ) ) ( not ( = ?auto_797744 ?auto_797756 ) ) ( not ( = ?auto_797744 ?auto_797757 ) ) ( not ( = ?auto_797744 ?auto_797758 ) ) ( not ( = ?auto_797744 ?auto_797759 ) ) ( not ( = ?auto_797744 ?auto_797760 ) ) ( not ( = ?auto_797745 ?auto_797746 ) ) ( not ( = ?auto_797745 ?auto_797747 ) ) ( not ( = ?auto_797745 ?auto_797748 ) ) ( not ( = ?auto_797745 ?auto_797749 ) ) ( not ( = ?auto_797745 ?auto_797750 ) ) ( not ( = ?auto_797745 ?auto_797751 ) ) ( not ( = ?auto_797745 ?auto_797752 ) ) ( not ( = ?auto_797745 ?auto_797753 ) ) ( not ( = ?auto_797745 ?auto_797754 ) ) ( not ( = ?auto_797745 ?auto_797755 ) ) ( not ( = ?auto_797745 ?auto_797756 ) ) ( not ( = ?auto_797745 ?auto_797757 ) ) ( not ( = ?auto_797745 ?auto_797758 ) ) ( not ( = ?auto_797745 ?auto_797759 ) ) ( not ( = ?auto_797745 ?auto_797760 ) ) ( not ( = ?auto_797746 ?auto_797747 ) ) ( not ( = ?auto_797746 ?auto_797748 ) ) ( not ( = ?auto_797746 ?auto_797749 ) ) ( not ( = ?auto_797746 ?auto_797750 ) ) ( not ( = ?auto_797746 ?auto_797751 ) ) ( not ( = ?auto_797746 ?auto_797752 ) ) ( not ( = ?auto_797746 ?auto_797753 ) ) ( not ( = ?auto_797746 ?auto_797754 ) ) ( not ( = ?auto_797746 ?auto_797755 ) ) ( not ( = ?auto_797746 ?auto_797756 ) ) ( not ( = ?auto_797746 ?auto_797757 ) ) ( not ( = ?auto_797746 ?auto_797758 ) ) ( not ( = ?auto_797746 ?auto_797759 ) ) ( not ( = ?auto_797746 ?auto_797760 ) ) ( not ( = ?auto_797747 ?auto_797748 ) ) ( not ( = ?auto_797747 ?auto_797749 ) ) ( not ( = ?auto_797747 ?auto_797750 ) ) ( not ( = ?auto_797747 ?auto_797751 ) ) ( not ( = ?auto_797747 ?auto_797752 ) ) ( not ( = ?auto_797747 ?auto_797753 ) ) ( not ( = ?auto_797747 ?auto_797754 ) ) ( not ( = ?auto_797747 ?auto_797755 ) ) ( not ( = ?auto_797747 ?auto_797756 ) ) ( not ( = ?auto_797747 ?auto_797757 ) ) ( not ( = ?auto_797747 ?auto_797758 ) ) ( not ( = ?auto_797747 ?auto_797759 ) ) ( not ( = ?auto_797747 ?auto_797760 ) ) ( not ( = ?auto_797748 ?auto_797749 ) ) ( not ( = ?auto_797748 ?auto_797750 ) ) ( not ( = ?auto_797748 ?auto_797751 ) ) ( not ( = ?auto_797748 ?auto_797752 ) ) ( not ( = ?auto_797748 ?auto_797753 ) ) ( not ( = ?auto_797748 ?auto_797754 ) ) ( not ( = ?auto_797748 ?auto_797755 ) ) ( not ( = ?auto_797748 ?auto_797756 ) ) ( not ( = ?auto_797748 ?auto_797757 ) ) ( not ( = ?auto_797748 ?auto_797758 ) ) ( not ( = ?auto_797748 ?auto_797759 ) ) ( not ( = ?auto_797748 ?auto_797760 ) ) ( not ( = ?auto_797749 ?auto_797750 ) ) ( not ( = ?auto_797749 ?auto_797751 ) ) ( not ( = ?auto_797749 ?auto_797752 ) ) ( not ( = ?auto_797749 ?auto_797753 ) ) ( not ( = ?auto_797749 ?auto_797754 ) ) ( not ( = ?auto_797749 ?auto_797755 ) ) ( not ( = ?auto_797749 ?auto_797756 ) ) ( not ( = ?auto_797749 ?auto_797757 ) ) ( not ( = ?auto_797749 ?auto_797758 ) ) ( not ( = ?auto_797749 ?auto_797759 ) ) ( not ( = ?auto_797749 ?auto_797760 ) ) ( not ( = ?auto_797750 ?auto_797751 ) ) ( not ( = ?auto_797750 ?auto_797752 ) ) ( not ( = ?auto_797750 ?auto_797753 ) ) ( not ( = ?auto_797750 ?auto_797754 ) ) ( not ( = ?auto_797750 ?auto_797755 ) ) ( not ( = ?auto_797750 ?auto_797756 ) ) ( not ( = ?auto_797750 ?auto_797757 ) ) ( not ( = ?auto_797750 ?auto_797758 ) ) ( not ( = ?auto_797750 ?auto_797759 ) ) ( not ( = ?auto_797750 ?auto_797760 ) ) ( not ( = ?auto_797751 ?auto_797752 ) ) ( not ( = ?auto_797751 ?auto_797753 ) ) ( not ( = ?auto_797751 ?auto_797754 ) ) ( not ( = ?auto_797751 ?auto_797755 ) ) ( not ( = ?auto_797751 ?auto_797756 ) ) ( not ( = ?auto_797751 ?auto_797757 ) ) ( not ( = ?auto_797751 ?auto_797758 ) ) ( not ( = ?auto_797751 ?auto_797759 ) ) ( not ( = ?auto_797751 ?auto_797760 ) ) ( not ( = ?auto_797752 ?auto_797753 ) ) ( not ( = ?auto_797752 ?auto_797754 ) ) ( not ( = ?auto_797752 ?auto_797755 ) ) ( not ( = ?auto_797752 ?auto_797756 ) ) ( not ( = ?auto_797752 ?auto_797757 ) ) ( not ( = ?auto_797752 ?auto_797758 ) ) ( not ( = ?auto_797752 ?auto_797759 ) ) ( not ( = ?auto_797752 ?auto_797760 ) ) ( not ( = ?auto_797753 ?auto_797754 ) ) ( not ( = ?auto_797753 ?auto_797755 ) ) ( not ( = ?auto_797753 ?auto_797756 ) ) ( not ( = ?auto_797753 ?auto_797757 ) ) ( not ( = ?auto_797753 ?auto_797758 ) ) ( not ( = ?auto_797753 ?auto_797759 ) ) ( not ( = ?auto_797753 ?auto_797760 ) ) ( not ( = ?auto_797754 ?auto_797755 ) ) ( not ( = ?auto_797754 ?auto_797756 ) ) ( not ( = ?auto_797754 ?auto_797757 ) ) ( not ( = ?auto_797754 ?auto_797758 ) ) ( not ( = ?auto_797754 ?auto_797759 ) ) ( not ( = ?auto_797754 ?auto_797760 ) ) ( not ( = ?auto_797755 ?auto_797756 ) ) ( not ( = ?auto_797755 ?auto_797757 ) ) ( not ( = ?auto_797755 ?auto_797758 ) ) ( not ( = ?auto_797755 ?auto_797759 ) ) ( not ( = ?auto_797755 ?auto_797760 ) ) ( not ( = ?auto_797756 ?auto_797757 ) ) ( not ( = ?auto_797756 ?auto_797758 ) ) ( not ( = ?auto_797756 ?auto_797759 ) ) ( not ( = ?auto_797756 ?auto_797760 ) ) ( not ( = ?auto_797757 ?auto_797758 ) ) ( not ( = ?auto_797757 ?auto_797759 ) ) ( not ( = ?auto_797757 ?auto_797760 ) ) ( not ( = ?auto_797758 ?auto_797759 ) ) ( not ( = ?auto_797758 ?auto_797760 ) ) ( not ( = ?auto_797759 ?auto_797760 ) ) ( CLEAR ?auto_797757 ) ( ON ?auto_797758 ?auto_797759 ) ( CLEAR ?auto_797758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_797744 ?auto_797745 ?auto_797746 ?auto_797747 ?auto_797748 ?auto_797749 ?auto_797750 ?auto_797751 ?auto_797752 ?auto_797753 ?auto_797754 ?auto_797755 ?auto_797756 ?auto_797757 ?auto_797758 )
      ( MAKE-16PILE ?auto_797744 ?auto_797745 ?auto_797746 ?auto_797747 ?auto_797748 ?auto_797749 ?auto_797750 ?auto_797751 ?auto_797752 ?auto_797753 ?auto_797754 ?auto_797755 ?auto_797756 ?auto_797757 ?auto_797758 ?auto_797759 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_797810 - BLOCK
      ?auto_797811 - BLOCK
      ?auto_797812 - BLOCK
      ?auto_797813 - BLOCK
      ?auto_797814 - BLOCK
      ?auto_797815 - BLOCK
      ?auto_797816 - BLOCK
      ?auto_797817 - BLOCK
      ?auto_797818 - BLOCK
      ?auto_797819 - BLOCK
      ?auto_797820 - BLOCK
      ?auto_797821 - BLOCK
      ?auto_797822 - BLOCK
      ?auto_797823 - BLOCK
      ?auto_797824 - BLOCK
      ?auto_797825 - BLOCK
    )
    :vars
    (
      ?auto_797826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_797825 ?auto_797826 ) ( ON-TABLE ?auto_797810 ) ( ON ?auto_797811 ?auto_797810 ) ( ON ?auto_797812 ?auto_797811 ) ( ON ?auto_797813 ?auto_797812 ) ( ON ?auto_797814 ?auto_797813 ) ( ON ?auto_797815 ?auto_797814 ) ( ON ?auto_797816 ?auto_797815 ) ( ON ?auto_797817 ?auto_797816 ) ( ON ?auto_797818 ?auto_797817 ) ( ON ?auto_797819 ?auto_797818 ) ( ON ?auto_797820 ?auto_797819 ) ( ON ?auto_797821 ?auto_797820 ) ( ON ?auto_797822 ?auto_797821 ) ( not ( = ?auto_797810 ?auto_797811 ) ) ( not ( = ?auto_797810 ?auto_797812 ) ) ( not ( = ?auto_797810 ?auto_797813 ) ) ( not ( = ?auto_797810 ?auto_797814 ) ) ( not ( = ?auto_797810 ?auto_797815 ) ) ( not ( = ?auto_797810 ?auto_797816 ) ) ( not ( = ?auto_797810 ?auto_797817 ) ) ( not ( = ?auto_797810 ?auto_797818 ) ) ( not ( = ?auto_797810 ?auto_797819 ) ) ( not ( = ?auto_797810 ?auto_797820 ) ) ( not ( = ?auto_797810 ?auto_797821 ) ) ( not ( = ?auto_797810 ?auto_797822 ) ) ( not ( = ?auto_797810 ?auto_797823 ) ) ( not ( = ?auto_797810 ?auto_797824 ) ) ( not ( = ?auto_797810 ?auto_797825 ) ) ( not ( = ?auto_797810 ?auto_797826 ) ) ( not ( = ?auto_797811 ?auto_797812 ) ) ( not ( = ?auto_797811 ?auto_797813 ) ) ( not ( = ?auto_797811 ?auto_797814 ) ) ( not ( = ?auto_797811 ?auto_797815 ) ) ( not ( = ?auto_797811 ?auto_797816 ) ) ( not ( = ?auto_797811 ?auto_797817 ) ) ( not ( = ?auto_797811 ?auto_797818 ) ) ( not ( = ?auto_797811 ?auto_797819 ) ) ( not ( = ?auto_797811 ?auto_797820 ) ) ( not ( = ?auto_797811 ?auto_797821 ) ) ( not ( = ?auto_797811 ?auto_797822 ) ) ( not ( = ?auto_797811 ?auto_797823 ) ) ( not ( = ?auto_797811 ?auto_797824 ) ) ( not ( = ?auto_797811 ?auto_797825 ) ) ( not ( = ?auto_797811 ?auto_797826 ) ) ( not ( = ?auto_797812 ?auto_797813 ) ) ( not ( = ?auto_797812 ?auto_797814 ) ) ( not ( = ?auto_797812 ?auto_797815 ) ) ( not ( = ?auto_797812 ?auto_797816 ) ) ( not ( = ?auto_797812 ?auto_797817 ) ) ( not ( = ?auto_797812 ?auto_797818 ) ) ( not ( = ?auto_797812 ?auto_797819 ) ) ( not ( = ?auto_797812 ?auto_797820 ) ) ( not ( = ?auto_797812 ?auto_797821 ) ) ( not ( = ?auto_797812 ?auto_797822 ) ) ( not ( = ?auto_797812 ?auto_797823 ) ) ( not ( = ?auto_797812 ?auto_797824 ) ) ( not ( = ?auto_797812 ?auto_797825 ) ) ( not ( = ?auto_797812 ?auto_797826 ) ) ( not ( = ?auto_797813 ?auto_797814 ) ) ( not ( = ?auto_797813 ?auto_797815 ) ) ( not ( = ?auto_797813 ?auto_797816 ) ) ( not ( = ?auto_797813 ?auto_797817 ) ) ( not ( = ?auto_797813 ?auto_797818 ) ) ( not ( = ?auto_797813 ?auto_797819 ) ) ( not ( = ?auto_797813 ?auto_797820 ) ) ( not ( = ?auto_797813 ?auto_797821 ) ) ( not ( = ?auto_797813 ?auto_797822 ) ) ( not ( = ?auto_797813 ?auto_797823 ) ) ( not ( = ?auto_797813 ?auto_797824 ) ) ( not ( = ?auto_797813 ?auto_797825 ) ) ( not ( = ?auto_797813 ?auto_797826 ) ) ( not ( = ?auto_797814 ?auto_797815 ) ) ( not ( = ?auto_797814 ?auto_797816 ) ) ( not ( = ?auto_797814 ?auto_797817 ) ) ( not ( = ?auto_797814 ?auto_797818 ) ) ( not ( = ?auto_797814 ?auto_797819 ) ) ( not ( = ?auto_797814 ?auto_797820 ) ) ( not ( = ?auto_797814 ?auto_797821 ) ) ( not ( = ?auto_797814 ?auto_797822 ) ) ( not ( = ?auto_797814 ?auto_797823 ) ) ( not ( = ?auto_797814 ?auto_797824 ) ) ( not ( = ?auto_797814 ?auto_797825 ) ) ( not ( = ?auto_797814 ?auto_797826 ) ) ( not ( = ?auto_797815 ?auto_797816 ) ) ( not ( = ?auto_797815 ?auto_797817 ) ) ( not ( = ?auto_797815 ?auto_797818 ) ) ( not ( = ?auto_797815 ?auto_797819 ) ) ( not ( = ?auto_797815 ?auto_797820 ) ) ( not ( = ?auto_797815 ?auto_797821 ) ) ( not ( = ?auto_797815 ?auto_797822 ) ) ( not ( = ?auto_797815 ?auto_797823 ) ) ( not ( = ?auto_797815 ?auto_797824 ) ) ( not ( = ?auto_797815 ?auto_797825 ) ) ( not ( = ?auto_797815 ?auto_797826 ) ) ( not ( = ?auto_797816 ?auto_797817 ) ) ( not ( = ?auto_797816 ?auto_797818 ) ) ( not ( = ?auto_797816 ?auto_797819 ) ) ( not ( = ?auto_797816 ?auto_797820 ) ) ( not ( = ?auto_797816 ?auto_797821 ) ) ( not ( = ?auto_797816 ?auto_797822 ) ) ( not ( = ?auto_797816 ?auto_797823 ) ) ( not ( = ?auto_797816 ?auto_797824 ) ) ( not ( = ?auto_797816 ?auto_797825 ) ) ( not ( = ?auto_797816 ?auto_797826 ) ) ( not ( = ?auto_797817 ?auto_797818 ) ) ( not ( = ?auto_797817 ?auto_797819 ) ) ( not ( = ?auto_797817 ?auto_797820 ) ) ( not ( = ?auto_797817 ?auto_797821 ) ) ( not ( = ?auto_797817 ?auto_797822 ) ) ( not ( = ?auto_797817 ?auto_797823 ) ) ( not ( = ?auto_797817 ?auto_797824 ) ) ( not ( = ?auto_797817 ?auto_797825 ) ) ( not ( = ?auto_797817 ?auto_797826 ) ) ( not ( = ?auto_797818 ?auto_797819 ) ) ( not ( = ?auto_797818 ?auto_797820 ) ) ( not ( = ?auto_797818 ?auto_797821 ) ) ( not ( = ?auto_797818 ?auto_797822 ) ) ( not ( = ?auto_797818 ?auto_797823 ) ) ( not ( = ?auto_797818 ?auto_797824 ) ) ( not ( = ?auto_797818 ?auto_797825 ) ) ( not ( = ?auto_797818 ?auto_797826 ) ) ( not ( = ?auto_797819 ?auto_797820 ) ) ( not ( = ?auto_797819 ?auto_797821 ) ) ( not ( = ?auto_797819 ?auto_797822 ) ) ( not ( = ?auto_797819 ?auto_797823 ) ) ( not ( = ?auto_797819 ?auto_797824 ) ) ( not ( = ?auto_797819 ?auto_797825 ) ) ( not ( = ?auto_797819 ?auto_797826 ) ) ( not ( = ?auto_797820 ?auto_797821 ) ) ( not ( = ?auto_797820 ?auto_797822 ) ) ( not ( = ?auto_797820 ?auto_797823 ) ) ( not ( = ?auto_797820 ?auto_797824 ) ) ( not ( = ?auto_797820 ?auto_797825 ) ) ( not ( = ?auto_797820 ?auto_797826 ) ) ( not ( = ?auto_797821 ?auto_797822 ) ) ( not ( = ?auto_797821 ?auto_797823 ) ) ( not ( = ?auto_797821 ?auto_797824 ) ) ( not ( = ?auto_797821 ?auto_797825 ) ) ( not ( = ?auto_797821 ?auto_797826 ) ) ( not ( = ?auto_797822 ?auto_797823 ) ) ( not ( = ?auto_797822 ?auto_797824 ) ) ( not ( = ?auto_797822 ?auto_797825 ) ) ( not ( = ?auto_797822 ?auto_797826 ) ) ( not ( = ?auto_797823 ?auto_797824 ) ) ( not ( = ?auto_797823 ?auto_797825 ) ) ( not ( = ?auto_797823 ?auto_797826 ) ) ( not ( = ?auto_797824 ?auto_797825 ) ) ( not ( = ?auto_797824 ?auto_797826 ) ) ( not ( = ?auto_797825 ?auto_797826 ) ) ( ON ?auto_797824 ?auto_797825 ) ( CLEAR ?auto_797822 ) ( ON ?auto_797823 ?auto_797824 ) ( CLEAR ?auto_797823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_797810 ?auto_797811 ?auto_797812 ?auto_797813 ?auto_797814 ?auto_797815 ?auto_797816 ?auto_797817 ?auto_797818 ?auto_797819 ?auto_797820 ?auto_797821 ?auto_797822 ?auto_797823 )
      ( MAKE-16PILE ?auto_797810 ?auto_797811 ?auto_797812 ?auto_797813 ?auto_797814 ?auto_797815 ?auto_797816 ?auto_797817 ?auto_797818 ?auto_797819 ?auto_797820 ?auto_797821 ?auto_797822 ?auto_797823 ?auto_797824 ?auto_797825 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_797876 - BLOCK
      ?auto_797877 - BLOCK
      ?auto_797878 - BLOCK
      ?auto_797879 - BLOCK
      ?auto_797880 - BLOCK
      ?auto_797881 - BLOCK
      ?auto_797882 - BLOCK
      ?auto_797883 - BLOCK
      ?auto_797884 - BLOCK
      ?auto_797885 - BLOCK
      ?auto_797886 - BLOCK
      ?auto_797887 - BLOCK
      ?auto_797888 - BLOCK
      ?auto_797889 - BLOCK
      ?auto_797890 - BLOCK
      ?auto_797891 - BLOCK
    )
    :vars
    (
      ?auto_797892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_797891 ?auto_797892 ) ( ON-TABLE ?auto_797876 ) ( ON ?auto_797877 ?auto_797876 ) ( ON ?auto_797878 ?auto_797877 ) ( ON ?auto_797879 ?auto_797878 ) ( ON ?auto_797880 ?auto_797879 ) ( ON ?auto_797881 ?auto_797880 ) ( ON ?auto_797882 ?auto_797881 ) ( ON ?auto_797883 ?auto_797882 ) ( ON ?auto_797884 ?auto_797883 ) ( ON ?auto_797885 ?auto_797884 ) ( ON ?auto_797886 ?auto_797885 ) ( ON ?auto_797887 ?auto_797886 ) ( not ( = ?auto_797876 ?auto_797877 ) ) ( not ( = ?auto_797876 ?auto_797878 ) ) ( not ( = ?auto_797876 ?auto_797879 ) ) ( not ( = ?auto_797876 ?auto_797880 ) ) ( not ( = ?auto_797876 ?auto_797881 ) ) ( not ( = ?auto_797876 ?auto_797882 ) ) ( not ( = ?auto_797876 ?auto_797883 ) ) ( not ( = ?auto_797876 ?auto_797884 ) ) ( not ( = ?auto_797876 ?auto_797885 ) ) ( not ( = ?auto_797876 ?auto_797886 ) ) ( not ( = ?auto_797876 ?auto_797887 ) ) ( not ( = ?auto_797876 ?auto_797888 ) ) ( not ( = ?auto_797876 ?auto_797889 ) ) ( not ( = ?auto_797876 ?auto_797890 ) ) ( not ( = ?auto_797876 ?auto_797891 ) ) ( not ( = ?auto_797876 ?auto_797892 ) ) ( not ( = ?auto_797877 ?auto_797878 ) ) ( not ( = ?auto_797877 ?auto_797879 ) ) ( not ( = ?auto_797877 ?auto_797880 ) ) ( not ( = ?auto_797877 ?auto_797881 ) ) ( not ( = ?auto_797877 ?auto_797882 ) ) ( not ( = ?auto_797877 ?auto_797883 ) ) ( not ( = ?auto_797877 ?auto_797884 ) ) ( not ( = ?auto_797877 ?auto_797885 ) ) ( not ( = ?auto_797877 ?auto_797886 ) ) ( not ( = ?auto_797877 ?auto_797887 ) ) ( not ( = ?auto_797877 ?auto_797888 ) ) ( not ( = ?auto_797877 ?auto_797889 ) ) ( not ( = ?auto_797877 ?auto_797890 ) ) ( not ( = ?auto_797877 ?auto_797891 ) ) ( not ( = ?auto_797877 ?auto_797892 ) ) ( not ( = ?auto_797878 ?auto_797879 ) ) ( not ( = ?auto_797878 ?auto_797880 ) ) ( not ( = ?auto_797878 ?auto_797881 ) ) ( not ( = ?auto_797878 ?auto_797882 ) ) ( not ( = ?auto_797878 ?auto_797883 ) ) ( not ( = ?auto_797878 ?auto_797884 ) ) ( not ( = ?auto_797878 ?auto_797885 ) ) ( not ( = ?auto_797878 ?auto_797886 ) ) ( not ( = ?auto_797878 ?auto_797887 ) ) ( not ( = ?auto_797878 ?auto_797888 ) ) ( not ( = ?auto_797878 ?auto_797889 ) ) ( not ( = ?auto_797878 ?auto_797890 ) ) ( not ( = ?auto_797878 ?auto_797891 ) ) ( not ( = ?auto_797878 ?auto_797892 ) ) ( not ( = ?auto_797879 ?auto_797880 ) ) ( not ( = ?auto_797879 ?auto_797881 ) ) ( not ( = ?auto_797879 ?auto_797882 ) ) ( not ( = ?auto_797879 ?auto_797883 ) ) ( not ( = ?auto_797879 ?auto_797884 ) ) ( not ( = ?auto_797879 ?auto_797885 ) ) ( not ( = ?auto_797879 ?auto_797886 ) ) ( not ( = ?auto_797879 ?auto_797887 ) ) ( not ( = ?auto_797879 ?auto_797888 ) ) ( not ( = ?auto_797879 ?auto_797889 ) ) ( not ( = ?auto_797879 ?auto_797890 ) ) ( not ( = ?auto_797879 ?auto_797891 ) ) ( not ( = ?auto_797879 ?auto_797892 ) ) ( not ( = ?auto_797880 ?auto_797881 ) ) ( not ( = ?auto_797880 ?auto_797882 ) ) ( not ( = ?auto_797880 ?auto_797883 ) ) ( not ( = ?auto_797880 ?auto_797884 ) ) ( not ( = ?auto_797880 ?auto_797885 ) ) ( not ( = ?auto_797880 ?auto_797886 ) ) ( not ( = ?auto_797880 ?auto_797887 ) ) ( not ( = ?auto_797880 ?auto_797888 ) ) ( not ( = ?auto_797880 ?auto_797889 ) ) ( not ( = ?auto_797880 ?auto_797890 ) ) ( not ( = ?auto_797880 ?auto_797891 ) ) ( not ( = ?auto_797880 ?auto_797892 ) ) ( not ( = ?auto_797881 ?auto_797882 ) ) ( not ( = ?auto_797881 ?auto_797883 ) ) ( not ( = ?auto_797881 ?auto_797884 ) ) ( not ( = ?auto_797881 ?auto_797885 ) ) ( not ( = ?auto_797881 ?auto_797886 ) ) ( not ( = ?auto_797881 ?auto_797887 ) ) ( not ( = ?auto_797881 ?auto_797888 ) ) ( not ( = ?auto_797881 ?auto_797889 ) ) ( not ( = ?auto_797881 ?auto_797890 ) ) ( not ( = ?auto_797881 ?auto_797891 ) ) ( not ( = ?auto_797881 ?auto_797892 ) ) ( not ( = ?auto_797882 ?auto_797883 ) ) ( not ( = ?auto_797882 ?auto_797884 ) ) ( not ( = ?auto_797882 ?auto_797885 ) ) ( not ( = ?auto_797882 ?auto_797886 ) ) ( not ( = ?auto_797882 ?auto_797887 ) ) ( not ( = ?auto_797882 ?auto_797888 ) ) ( not ( = ?auto_797882 ?auto_797889 ) ) ( not ( = ?auto_797882 ?auto_797890 ) ) ( not ( = ?auto_797882 ?auto_797891 ) ) ( not ( = ?auto_797882 ?auto_797892 ) ) ( not ( = ?auto_797883 ?auto_797884 ) ) ( not ( = ?auto_797883 ?auto_797885 ) ) ( not ( = ?auto_797883 ?auto_797886 ) ) ( not ( = ?auto_797883 ?auto_797887 ) ) ( not ( = ?auto_797883 ?auto_797888 ) ) ( not ( = ?auto_797883 ?auto_797889 ) ) ( not ( = ?auto_797883 ?auto_797890 ) ) ( not ( = ?auto_797883 ?auto_797891 ) ) ( not ( = ?auto_797883 ?auto_797892 ) ) ( not ( = ?auto_797884 ?auto_797885 ) ) ( not ( = ?auto_797884 ?auto_797886 ) ) ( not ( = ?auto_797884 ?auto_797887 ) ) ( not ( = ?auto_797884 ?auto_797888 ) ) ( not ( = ?auto_797884 ?auto_797889 ) ) ( not ( = ?auto_797884 ?auto_797890 ) ) ( not ( = ?auto_797884 ?auto_797891 ) ) ( not ( = ?auto_797884 ?auto_797892 ) ) ( not ( = ?auto_797885 ?auto_797886 ) ) ( not ( = ?auto_797885 ?auto_797887 ) ) ( not ( = ?auto_797885 ?auto_797888 ) ) ( not ( = ?auto_797885 ?auto_797889 ) ) ( not ( = ?auto_797885 ?auto_797890 ) ) ( not ( = ?auto_797885 ?auto_797891 ) ) ( not ( = ?auto_797885 ?auto_797892 ) ) ( not ( = ?auto_797886 ?auto_797887 ) ) ( not ( = ?auto_797886 ?auto_797888 ) ) ( not ( = ?auto_797886 ?auto_797889 ) ) ( not ( = ?auto_797886 ?auto_797890 ) ) ( not ( = ?auto_797886 ?auto_797891 ) ) ( not ( = ?auto_797886 ?auto_797892 ) ) ( not ( = ?auto_797887 ?auto_797888 ) ) ( not ( = ?auto_797887 ?auto_797889 ) ) ( not ( = ?auto_797887 ?auto_797890 ) ) ( not ( = ?auto_797887 ?auto_797891 ) ) ( not ( = ?auto_797887 ?auto_797892 ) ) ( not ( = ?auto_797888 ?auto_797889 ) ) ( not ( = ?auto_797888 ?auto_797890 ) ) ( not ( = ?auto_797888 ?auto_797891 ) ) ( not ( = ?auto_797888 ?auto_797892 ) ) ( not ( = ?auto_797889 ?auto_797890 ) ) ( not ( = ?auto_797889 ?auto_797891 ) ) ( not ( = ?auto_797889 ?auto_797892 ) ) ( not ( = ?auto_797890 ?auto_797891 ) ) ( not ( = ?auto_797890 ?auto_797892 ) ) ( not ( = ?auto_797891 ?auto_797892 ) ) ( ON ?auto_797890 ?auto_797891 ) ( ON ?auto_797889 ?auto_797890 ) ( CLEAR ?auto_797887 ) ( ON ?auto_797888 ?auto_797889 ) ( CLEAR ?auto_797888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_797876 ?auto_797877 ?auto_797878 ?auto_797879 ?auto_797880 ?auto_797881 ?auto_797882 ?auto_797883 ?auto_797884 ?auto_797885 ?auto_797886 ?auto_797887 ?auto_797888 )
      ( MAKE-16PILE ?auto_797876 ?auto_797877 ?auto_797878 ?auto_797879 ?auto_797880 ?auto_797881 ?auto_797882 ?auto_797883 ?auto_797884 ?auto_797885 ?auto_797886 ?auto_797887 ?auto_797888 ?auto_797889 ?auto_797890 ?auto_797891 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_797942 - BLOCK
      ?auto_797943 - BLOCK
      ?auto_797944 - BLOCK
      ?auto_797945 - BLOCK
      ?auto_797946 - BLOCK
      ?auto_797947 - BLOCK
      ?auto_797948 - BLOCK
      ?auto_797949 - BLOCK
      ?auto_797950 - BLOCK
      ?auto_797951 - BLOCK
      ?auto_797952 - BLOCK
      ?auto_797953 - BLOCK
      ?auto_797954 - BLOCK
      ?auto_797955 - BLOCK
      ?auto_797956 - BLOCK
      ?auto_797957 - BLOCK
    )
    :vars
    (
      ?auto_797958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_797957 ?auto_797958 ) ( ON-TABLE ?auto_797942 ) ( ON ?auto_797943 ?auto_797942 ) ( ON ?auto_797944 ?auto_797943 ) ( ON ?auto_797945 ?auto_797944 ) ( ON ?auto_797946 ?auto_797945 ) ( ON ?auto_797947 ?auto_797946 ) ( ON ?auto_797948 ?auto_797947 ) ( ON ?auto_797949 ?auto_797948 ) ( ON ?auto_797950 ?auto_797949 ) ( ON ?auto_797951 ?auto_797950 ) ( ON ?auto_797952 ?auto_797951 ) ( not ( = ?auto_797942 ?auto_797943 ) ) ( not ( = ?auto_797942 ?auto_797944 ) ) ( not ( = ?auto_797942 ?auto_797945 ) ) ( not ( = ?auto_797942 ?auto_797946 ) ) ( not ( = ?auto_797942 ?auto_797947 ) ) ( not ( = ?auto_797942 ?auto_797948 ) ) ( not ( = ?auto_797942 ?auto_797949 ) ) ( not ( = ?auto_797942 ?auto_797950 ) ) ( not ( = ?auto_797942 ?auto_797951 ) ) ( not ( = ?auto_797942 ?auto_797952 ) ) ( not ( = ?auto_797942 ?auto_797953 ) ) ( not ( = ?auto_797942 ?auto_797954 ) ) ( not ( = ?auto_797942 ?auto_797955 ) ) ( not ( = ?auto_797942 ?auto_797956 ) ) ( not ( = ?auto_797942 ?auto_797957 ) ) ( not ( = ?auto_797942 ?auto_797958 ) ) ( not ( = ?auto_797943 ?auto_797944 ) ) ( not ( = ?auto_797943 ?auto_797945 ) ) ( not ( = ?auto_797943 ?auto_797946 ) ) ( not ( = ?auto_797943 ?auto_797947 ) ) ( not ( = ?auto_797943 ?auto_797948 ) ) ( not ( = ?auto_797943 ?auto_797949 ) ) ( not ( = ?auto_797943 ?auto_797950 ) ) ( not ( = ?auto_797943 ?auto_797951 ) ) ( not ( = ?auto_797943 ?auto_797952 ) ) ( not ( = ?auto_797943 ?auto_797953 ) ) ( not ( = ?auto_797943 ?auto_797954 ) ) ( not ( = ?auto_797943 ?auto_797955 ) ) ( not ( = ?auto_797943 ?auto_797956 ) ) ( not ( = ?auto_797943 ?auto_797957 ) ) ( not ( = ?auto_797943 ?auto_797958 ) ) ( not ( = ?auto_797944 ?auto_797945 ) ) ( not ( = ?auto_797944 ?auto_797946 ) ) ( not ( = ?auto_797944 ?auto_797947 ) ) ( not ( = ?auto_797944 ?auto_797948 ) ) ( not ( = ?auto_797944 ?auto_797949 ) ) ( not ( = ?auto_797944 ?auto_797950 ) ) ( not ( = ?auto_797944 ?auto_797951 ) ) ( not ( = ?auto_797944 ?auto_797952 ) ) ( not ( = ?auto_797944 ?auto_797953 ) ) ( not ( = ?auto_797944 ?auto_797954 ) ) ( not ( = ?auto_797944 ?auto_797955 ) ) ( not ( = ?auto_797944 ?auto_797956 ) ) ( not ( = ?auto_797944 ?auto_797957 ) ) ( not ( = ?auto_797944 ?auto_797958 ) ) ( not ( = ?auto_797945 ?auto_797946 ) ) ( not ( = ?auto_797945 ?auto_797947 ) ) ( not ( = ?auto_797945 ?auto_797948 ) ) ( not ( = ?auto_797945 ?auto_797949 ) ) ( not ( = ?auto_797945 ?auto_797950 ) ) ( not ( = ?auto_797945 ?auto_797951 ) ) ( not ( = ?auto_797945 ?auto_797952 ) ) ( not ( = ?auto_797945 ?auto_797953 ) ) ( not ( = ?auto_797945 ?auto_797954 ) ) ( not ( = ?auto_797945 ?auto_797955 ) ) ( not ( = ?auto_797945 ?auto_797956 ) ) ( not ( = ?auto_797945 ?auto_797957 ) ) ( not ( = ?auto_797945 ?auto_797958 ) ) ( not ( = ?auto_797946 ?auto_797947 ) ) ( not ( = ?auto_797946 ?auto_797948 ) ) ( not ( = ?auto_797946 ?auto_797949 ) ) ( not ( = ?auto_797946 ?auto_797950 ) ) ( not ( = ?auto_797946 ?auto_797951 ) ) ( not ( = ?auto_797946 ?auto_797952 ) ) ( not ( = ?auto_797946 ?auto_797953 ) ) ( not ( = ?auto_797946 ?auto_797954 ) ) ( not ( = ?auto_797946 ?auto_797955 ) ) ( not ( = ?auto_797946 ?auto_797956 ) ) ( not ( = ?auto_797946 ?auto_797957 ) ) ( not ( = ?auto_797946 ?auto_797958 ) ) ( not ( = ?auto_797947 ?auto_797948 ) ) ( not ( = ?auto_797947 ?auto_797949 ) ) ( not ( = ?auto_797947 ?auto_797950 ) ) ( not ( = ?auto_797947 ?auto_797951 ) ) ( not ( = ?auto_797947 ?auto_797952 ) ) ( not ( = ?auto_797947 ?auto_797953 ) ) ( not ( = ?auto_797947 ?auto_797954 ) ) ( not ( = ?auto_797947 ?auto_797955 ) ) ( not ( = ?auto_797947 ?auto_797956 ) ) ( not ( = ?auto_797947 ?auto_797957 ) ) ( not ( = ?auto_797947 ?auto_797958 ) ) ( not ( = ?auto_797948 ?auto_797949 ) ) ( not ( = ?auto_797948 ?auto_797950 ) ) ( not ( = ?auto_797948 ?auto_797951 ) ) ( not ( = ?auto_797948 ?auto_797952 ) ) ( not ( = ?auto_797948 ?auto_797953 ) ) ( not ( = ?auto_797948 ?auto_797954 ) ) ( not ( = ?auto_797948 ?auto_797955 ) ) ( not ( = ?auto_797948 ?auto_797956 ) ) ( not ( = ?auto_797948 ?auto_797957 ) ) ( not ( = ?auto_797948 ?auto_797958 ) ) ( not ( = ?auto_797949 ?auto_797950 ) ) ( not ( = ?auto_797949 ?auto_797951 ) ) ( not ( = ?auto_797949 ?auto_797952 ) ) ( not ( = ?auto_797949 ?auto_797953 ) ) ( not ( = ?auto_797949 ?auto_797954 ) ) ( not ( = ?auto_797949 ?auto_797955 ) ) ( not ( = ?auto_797949 ?auto_797956 ) ) ( not ( = ?auto_797949 ?auto_797957 ) ) ( not ( = ?auto_797949 ?auto_797958 ) ) ( not ( = ?auto_797950 ?auto_797951 ) ) ( not ( = ?auto_797950 ?auto_797952 ) ) ( not ( = ?auto_797950 ?auto_797953 ) ) ( not ( = ?auto_797950 ?auto_797954 ) ) ( not ( = ?auto_797950 ?auto_797955 ) ) ( not ( = ?auto_797950 ?auto_797956 ) ) ( not ( = ?auto_797950 ?auto_797957 ) ) ( not ( = ?auto_797950 ?auto_797958 ) ) ( not ( = ?auto_797951 ?auto_797952 ) ) ( not ( = ?auto_797951 ?auto_797953 ) ) ( not ( = ?auto_797951 ?auto_797954 ) ) ( not ( = ?auto_797951 ?auto_797955 ) ) ( not ( = ?auto_797951 ?auto_797956 ) ) ( not ( = ?auto_797951 ?auto_797957 ) ) ( not ( = ?auto_797951 ?auto_797958 ) ) ( not ( = ?auto_797952 ?auto_797953 ) ) ( not ( = ?auto_797952 ?auto_797954 ) ) ( not ( = ?auto_797952 ?auto_797955 ) ) ( not ( = ?auto_797952 ?auto_797956 ) ) ( not ( = ?auto_797952 ?auto_797957 ) ) ( not ( = ?auto_797952 ?auto_797958 ) ) ( not ( = ?auto_797953 ?auto_797954 ) ) ( not ( = ?auto_797953 ?auto_797955 ) ) ( not ( = ?auto_797953 ?auto_797956 ) ) ( not ( = ?auto_797953 ?auto_797957 ) ) ( not ( = ?auto_797953 ?auto_797958 ) ) ( not ( = ?auto_797954 ?auto_797955 ) ) ( not ( = ?auto_797954 ?auto_797956 ) ) ( not ( = ?auto_797954 ?auto_797957 ) ) ( not ( = ?auto_797954 ?auto_797958 ) ) ( not ( = ?auto_797955 ?auto_797956 ) ) ( not ( = ?auto_797955 ?auto_797957 ) ) ( not ( = ?auto_797955 ?auto_797958 ) ) ( not ( = ?auto_797956 ?auto_797957 ) ) ( not ( = ?auto_797956 ?auto_797958 ) ) ( not ( = ?auto_797957 ?auto_797958 ) ) ( ON ?auto_797956 ?auto_797957 ) ( ON ?auto_797955 ?auto_797956 ) ( ON ?auto_797954 ?auto_797955 ) ( CLEAR ?auto_797952 ) ( ON ?auto_797953 ?auto_797954 ) ( CLEAR ?auto_797953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_797942 ?auto_797943 ?auto_797944 ?auto_797945 ?auto_797946 ?auto_797947 ?auto_797948 ?auto_797949 ?auto_797950 ?auto_797951 ?auto_797952 ?auto_797953 )
      ( MAKE-16PILE ?auto_797942 ?auto_797943 ?auto_797944 ?auto_797945 ?auto_797946 ?auto_797947 ?auto_797948 ?auto_797949 ?auto_797950 ?auto_797951 ?auto_797952 ?auto_797953 ?auto_797954 ?auto_797955 ?auto_797956 ?auto_797957 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_798008 - BLOCK
      ?auto_798009 - BLOCK
      ?auto_798010 - BLOCK
      ?auto_798011 - BLOCK
      ?auto_798012 - BLOCK
      ?auto_798013 - BLOCK
      ?auto_798014 - BLOCK
      ?auto_798015 - BLOCK
      ?auto_798016 - BLOCK
      ?auto_798017 - BLOCK
      ?auto_798018 - BLOCK
      ?auto_798019 - BLOCK
      ?auto_798020 - BLOCK
      ?auto_798021 - BLOCK
      ?auto_798022 - BLOCK
      ?auto_798023 - BLOCK
    )
    :vars
    (
      ?auto_798024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_798023 ?auto_798024 ) ( ON-TABLE ?auto_798008 ) ( ON ?auto_798009 ?auto_798008 ) ( ON ?auto_798010 ?auto_798009 ) ( ON ?auto_798011 ?auto_798010 ) ( ON ?auto_798012 ?auto_798011 ) ( ON ?auto_798013 ?auto_798012 ) ( ON ?auto_798014 ?auto_798013 ) ( ON ?auto_798015 ?auto_798014 ) ( ON ?auto_798016 ?auto_798015 ) ( ON ?auto_798017 ?auto_798016 ) ( not ( = ?auto_798008 ?auto_798009 ) ) ( not ( = ?auto_798008 ?auto_798010 ) ) ( not ( = ?auto_798008 ?auto_798011 ) ) ( not ( = ?auto_798008 ?auto_798012 ) ) ( not ( = ?auto_798008 ?auto_798013 ) ) ( not ( = ?auto_798008 ?auto_798014 ) ) ( not ( = ?auto_798008 ?auto_798015 ) ) ( not ( = ?auto_798008 ?auto_798016 ) ) ( not ( = ?auto_798008 ?auto_798017 ) ) ( not ( = ?auto_798008 ?auto_798018 ) ) ( not ( = ?auto_798008 ?auto_798019 ) ) ( not ( = ?auto_798008 ?auto_798020 ) ) ( not ( = ?auto_798008 ?auto_798021 ) ) ( not ( = ?auto_798008 ?auto_798022 ) ) ( not ( = ?auto_798008 ?auto_798023 ) ) ( not ( = ?auto_798008 ?auto_798024 ) ) ( not ( = ?auto_798009 ?auto_798010 ) ) ( not ( = ?auto_798009 ?auto_798011 ) ) ( not ( = ?auto_798009 ?auto_798012 ) ) ( not ( = ?auto_798009 ?auto_798013 ) ) ( not ( = ?auto_798009 ?auto_798014 ) ) ( not ( = ?auto_798009 ?auto_798015 ) ) ( not ( = ?auto_798009 ?auto_798016 ) ) ( not ( = ?auto_798009 ?auto_798017 ) ) ( not ( = ?auto_798009 ?auto_798018 ) ) ( not ( = ?auto_798009 ?auto_798019 ) ) ( not ( = ?auto_798009 ?auto_798020 ) ) ( not ( = ?auto_798009 ?auto_798021 ) ) ( not ( = ?auto_798009 ?auto_798022 ) ) ( not ( = ?auto_798009 ?auto_798023 ) ) ( not ( = ?auto_798009 ?auto_798024 ) ) ( not ( = ?auto_798010 ?auto_798011 ) ) ( not ( = ?auto_798010 ?auto_798012 ) ) ( not ( = ?auto_798010 ?auto_798013 ) ) ( not ( = ?auto_798010 ?auto_798014 ) ) ( not ( = ?auto_798010 ?auto_798015 ) ) ( not ( = ?auto_798010 ?auto_798016 ) ) ( not ( = ?auto_798010 ?auto_798017 ) ) ( not ( = ?auto_798010 ?auto_798018 ) ) ( not ( = ?auto_798010 ?auto_798019 ) ) ( not ( = ?auto_798010 ?auto_798020 ) ) ( not ( = ?auto_798010 ?auto_798021 ) ) ( not ( = ?auto_798010 ?auto_798022 ) ) ( not ( = ?auto_798010 ?auto_798023 ) ) ( not ( = ?auto_798010 ?auto_798024 ) ) ( not ( = ?auto_798011 ?auto_798012 ) ) ( not ( = ?auto_798011 ?auto_798013 ) ) ( not ( = ?auto_798011 ?auto_798014 ) ) ( not ( = ?auto_798011 ?auto_798015 ) ) ( not ( = ?auto_798011 ?auto_798016 ) ) ( not ( = ?auto_798011 ?auto_798017 ) ) ( not ( = ?auto_798011 ?auto_798018 ) ) ( not ( = ?auto_798011 ?auto_798019 ) ) ( not ( = ?auto_798011 ?auto_798020 ) ) ( not ( = ?auto_798011 ?auto_798021 ) ) ( not ( = ?auto_798011 ?auto_798022 ) ) ( not ( = ?auto_798011 ?auto_798023 ) ) ( not ( = ?auto_798011 ?auto_798024 ) ) ( not ( = ?auto_798012 ?auto_798013 ) ) ( not ( = ?auto_798012 ?auto_798014 ) ) ( not ( = ?auto_798012 ?auto_798015 ) ) ( not ( = ?auto_798012 ?auto_798016 ) ) ( not ( = ?auto_798012 ?auto_798017 ) ) ( not ( = ?auto_798012 ?auto_798018 ) ) ( not ( = ?auto_798012 ?auto_798019 ) ) ( not ( = ?auto_798012 ?auto_798020 ) ) ( not ( = ?auto_798012 ?auto_798021 ) ) ( not ( = ?auto_798012 ?auto_798022 ) ) ( not ( = ?auto_798012 ?auto_798023 ) ) ( not ( = ?auto_798012 ?auto_798024 ) ) ( not ( = ?auto_798013 ?auto_798014 ) ) ( not ( = ?auto_798013 ?auto_798015 ) ) ( not ( = ?auto_798013 ?auto_798016 ) ) ( not ( = ?auto_798013 ?auto_798017 ) ) ( not ( = ?auto_798013 ?auto_798018 ) ) ( not ( = ?auto_798013 ?auto_798019 ) ) ( not ( = ?auto_798013 ?auto_798020 ) ) ( not ( = ?auto_798013 ?auto_798021 ) ) ( not ( = ?auto_798013 ?auto_798022 ) ) ( not ( = ?auto_798013 ?auto_798023 ) ) ( not ( = ?auto_798013 ?auto_798024 ) ) ( not ( = ?auto_798014 ?auto_798015 ) ) ( not ( = ?auto_798014 ?auto_798016 ) ) ( not ( = ?auto_798014 ?auto_798017 ) ) ( not ( = ?auto_798014 ?auto_798018 ) ) ( not ( = ?auto_798014 ?auto_798019 ) ) ( not ( = ?auto_798014 ?auto_798020 ) ) ( not ( = ?auto_798014 ?auto_798021 ) ) ( not ( = ?auto_798014 ?auto_798022 ) ) ( not ( = ?auto_798014 ?auto_798023 ) ) ( not ( = ?auto_798014 ?auto_798024 ) ) ( not ( = ?auto_798015 ?auto_798016 ) ) ( not ( = ?auto_798015 ?auto_798017 ) ) ( not ( = ?auto_798015 ?auto_798018 ) ) ( not ( = ?auto_798015 ?auto_798019 ) ) ( not ( = ?auto_798015 ?auto_798020 ) ) ( not ( = ?auto_798015 ?auto_798021 ) ) ( not ( = ?auto_798015 ?auto_798022 ) ) ( not ( = ?auto_798015 ?auto_798023 ) ) ( not ( = ?auto_798015 ?auto_798024 ) ) ( not ( = ?auto_798016 ?auto_798017 ) ) ( not ( = ?auto_798016 ?auto_798018 ) ) ( not ( = ?auto_798016 ?auto_798019 ) ) ( not ( = ?auto_798016 ?auto_798020 ) ) ( not ( = ?auto_798016 ?auto_798021 ) ) ( not ( = ?auto_798016 ?auto_798022 ) ) ( not ( = ?auto_798016 ?auto_798023 ) ) ( not ( = ?auto_798016 ?auto_798024 ) ) ( not ( = ?auto_798017 ?auto_798018 ) ) ( not ( = ?auto_798017 ?auto_798019 ) ) ( not ( = ?auto_798017 ?auto_798020 ) ) ( not ( = ?auto_798017 ?auto_798021 ) ) ( not ( = ?auto_798017 ?auto_798022 ) ) ( not ( = ?auto_798017 ?auto_798023 ) ) ( not ( = ?auto_798017 ?auto_798024 ) ) ( not ( = ?auto_798018 ?auto_798019 ) ) ( not ( = ?auto_798018 ?auto_798020 ) ) ( not ( = ?auto_798018 ?auto_798021 ) ) ( not ( = ?auto_798018 ?auto_798022 ) ) ( not ( = ?auto_798018 ?auto_798023 ) ) ( not ( = ?auto_798018 ?auto_798024 ) ) ( not ( = ?auto_798019 ?auto_798020 ) ) ( not ( = ?auto_798019 ?auto_798021 ) ) ( not ( = ?auto_798019 ?auto_798022 ) ) ( not ( = ?auto_798019 ?auto_798023 ) ) ( not ( = ?auto_798019 ?auto_798024 ) ) ( not ( = ?auto_798020 ?auto_798021 ) ) ( not ( = ?auto_798020 ?auto_798022 ) ) ( not ( = ?auto_798020 ?auto_798023 ) ) ( not ( = ?auto_798020 ?auto_798024 ) ) ( not ( = ?auto_798021 ?auto_798022 ) ) ( not ( = ?auto_798021 ?auto_798023 ) ) ( not ( = ?auto_798021 ?auto_798024 ) ) ( not ( = ?auto_798022 ?auto_798023 ) ) ( not ( = ?auto_798022 ?auto_798024 ) ) ( not ( = ?auto_798023 ?auto_798024 ) ) ( ON ?auto_798022 ?auto_798023 ) ( ON ?auto_798021 ?auto_798022 ) ( ON ?auto_798020 ?auto_798021 ) ( ON ?auto_798019 ?auto_798020 ) ( CLEAR ?auto_798017 ) ( ON ?auto_798018 ?auto_798019 ) ( CLEAR ?auto_798018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_798008 ?auto_798009 ?auto_798010 ?auto_798011 ?auto_798012 ?auto_798013 ?auto_798014 ?auto_798015 ?auto_798016 ?auto_798017 ?auto_798018 )
      ( MAKE-16PILE ?auto_798008 ?auto_798009 ?auto_798010 ?auto_798011 ?auto_798012 ?auto_798013 ?auto_798014 ?auto_798015 ?auto_798016 ?auto_798017 ?auto_798018 ?auto_798019 ?auto_798020 ?auto_798021 ?auto_798022 ?auto_798023 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_798074 - BLOCK
      ?auto_798075 - BLOCK
      ?auto_798076 - BLOCK
      ?auto_798077 - BLOCK
      ?auto_798078 - BLOCK
      ?auto_798079 - BLOCK
      ?auto_798080 - BLOCK
      ?auto_798081 - BLOCK
      ?auto_798082 - BLOCK
      ?auto_798083 - BLOCK
      ?auto_798084 - BLOCK
      ?auto_798085 - BLOCK
      ?auto_798086 - BLOCK
      ?auto_798087 - BLOCK
      ?auto_798088 - BLOCK
      ?auto_798089 - BLOCK
    )
    :vars
    (
      ?auto_798090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_798089 ?auto_798090 ) ( ON-TABLE ?auto_798074 ) ( ON ?auto_798075 ?auto_798074 ) ( ON ?auto_798076 ?auto_798075 ) ( ON ?auto_798077 ?auto_798076 ) ( ON ?auto_798078 ?auto_798077 ) ( ON ?auto_798079 ?auto_798078 ) ( ON ?auto_798080 ?auto_798079 ) ( ON ?auto_798081 ?auto_798080 ) ( ON ?auto_798082 ?auto_798081 ) ( not ( = ?auto_798074 ?auto_798075 ) ) ( not ( = ?auto_798074 ?auto_798076 ) ) ( not ( = ?auto_798074 ?auto_798077 ) ) ( not ( = ?auto_798074 ?auto_798078 ) ) ( not ( = ?auto_798074 ?auto_798079 ) ) ( not ( = ?auto_798074 ?auto_798080 ) ) ( not ( = ?auto_798074 ?auto_798081 ) ) ( not ( = ?auto_798074 ?auto_798082 ) ) ( not ( = ?auto_798074 ?auto_798083 ) ) ( not ( = ?auto_798074 ?auto_798084 ) ) ( not ( = ?auto_798074 ?auto_798085 ) ) ( not ( = ?auto_798074 ?auto_798086 ) ) ( not ( = ?auto_798074 ?auto_798087 ) ) ( not ( = ?auto_798074 ?auto_798088 ) ) ( not ( = ?auto_798074 ?auto_798089 ) ) ( not ( = ?auto_798074 ?auto_798090 ) ) ( not ( = ?auto_798075 ?auto_798076 ) ) ( not ( = ?auto_798075 ?auto_798077 ) ) ( not ( = ?auto_798075 ?auto_798078 ) ) ( not ( = ?auto_798075 ?auto_798079 ) ) ( not ( = ?auto_798075 ?auto_798080 ) ) ( not ( = ?auto_798075 ?auto_798081 ) ) ( not ( = ?auto_798075 ?auto_798082 ) ) ( not ( = ?auto_798075 ?auto_798083 ) ) ( not ( = ?auto_798075 ?auto_798084 ) ) ( not ( = ?auto_798075 ?auto_798085 ) ) ( not ( = ?auto_798075 ?auto_798086 ) ) ( not ( = ?auto_798075 ?auto_798087 ) ) ( not ( = ?auto_798075 ?auto_798088 ) ) ( not ( = ?auto_798075 ?auto_798089 ) ) ( not ( = ?auto_798075 ?auto_798090 ) ) ( not ( = ?auto_798076 ?auto_798077 ) ) ( not ( = ?auto_798076 ?auto_798078 ) ) ( not ( = ?auto_798076 ?auto_798079 ) ) ( not ( = ?auto_798076 ?auto_798080 ) ) ( not ( = ?auto_798076 ?auto_798081 ) ) ( not ( = ?auto_798076 ?auto_798082 ) ) ( not ( = ?auto_798076 ?auto_798083 ) ) ( not ( = ?auto_798076 ?auto_798084 ) ) ( not ( = ?auto_798076 ?auto_798085 ) ) ( not ( = ?auto_798076 ?auto_798086 ) ) ( not ( = ?auto_798076 ?auto_798087 ) ) ( not ( = ?auto_798076 ?auto_798088 ) ) ( not ( = ?auto_798076 ?auto_798089 ) ) ( not ( = ?auto_798076 ?auto_798090 ) ) ( not ( = ?auto_798077 ?auto_798078 ) ) ( not ( = ?auto_798077 ?auto_798079 ) ) ( not ( = ?auto_798077 ?auto_798080 ) ) ( not ( = ?auto_798077 ?auto_798081 ) ) ( not ( = ?auto_798077 ?auto_798082 ) ) ( not ( = ?auto_798077 ?auto_798083 ) ) ( not ( = ?auto_798077 ?auto_798084 ) ) ( not ( = ?auto_798077 ?auto_798085 ) ) ( not ( = ?auto_798077 ?auto_798086 ) ) ( not ( = ?auto_798077 ?auto_798087 ) ) ( not ( = ?auto_798077 ?auto_798088 ) ) ( not ( = ?auto_798077 ?auto_798089 ) ) ( not ( = ?auto_798077 ?auto_798090 ) ) ( not ( = ?auto_798078 ?auto_798079 ) ) ( not ( = ?auto_798078 ?auto_798080 ) ) ( not ( = ?auto_798078 ?auto_798081 ) ) ( not ( = ?auto_798078 ?auto_798082 ) ) ( not ( = ?auto_798078 ?auto_798083 ) ) ( not ( = ?auto_798078 ?auto_798084 ) ) ( not ( = ?auto_798078 ?auto_798085 ) ) ( not ( = ?auto_798078 ?auto_798086 ) ) ( not ( = ?auto_798078 ?auto_798087 ) ) ( not ( = ?auto_798078 ?auto_798088 ) ) ( not ( = ?auto_798078 ?auto_798089 ) ) ( not ( = ?auto_798078 ?auto_798090 ) ) ( not ( = ?auto_798079 ?auto_798080 ) ) ( not ( = ?auto_798079 ?auto_798081 ) ) ( not ( = ?auto_798079 ?auto_798082 ) ) ( not ( = ?auto_798079 ?auto_798083 ) ) ( not ( = ?auto_798079 ?auto_798084 ) ) ( not ( = ?auto_798079 ?auto_798085 ) ) ( not ( = ?auto_798079 ?auto_798086 ) ) ( not ( = ?auto_798079 ?auto_798087 ) ) ( not ( = ?auto_798079 ?auto_798088 ) ) ( not ( = ?auto_798079 ?auto_798089 ) ) ( not ( = ?auto_798079 ?auto_798090 ) ) ( not ( = ?auto_798080 ?auto_798081 ) ) ( not ( = ?auto_798080 ?auto_798082 ) ) ( not ( = ?auto_798080 ?auto_798083 ) ) ( not ( = ?auto_798080 ?auto_798084 ) ) ( not ( = ?auto_798080 ?auto_798085 ) ) ( not ( = ?auto_798080 ?auto_798086 ) ) ( not ( = ?auto_798080 ?auto_798087 ) ) ( not ( = ?auto_798080 ?auto_798088 ) ) ( not ( = ?auto_798080 ?auto_798089 ) ) ( not ( = ?auto_798080 ?auto_798090 ) ) ( not ( = ?auto_798081 ?auto_798082 ) ) ( not ( = ?auto_798081 ?auto_798083 ) ) ( not ( = ?auto_798081 ?auto_798084 ) ) ( not ( = ?auto_798081 ?auto_798085 ) ) ( not ( = ?auto_798081 ?auto_798086 ) ) ( not ( = ?auto_798081 ?auto_798087 ) ) ( not ( = ?auto_798081 ?auto_798088 ) ) ( not ( = ?auto_798081 ?auto_798089 ) ) ( not ( = ?auto_798081 ?auto_798090 ) ) ( not ( = ?auto_798082 ?auto_798083 ) ) ( not ( = ?auto_798082 ?auto_798084 ) ) ( not ( = ?auto_798082 ?auto_798085 ) ) ( not ( = ?auto_798082 ?auto_798086 ) ) ( not ( = ?auto_798082 ?auto_798087 ) ) ( not ( = ?auto_798082 ?auto_798088 ) ) ( not ( = ?auto_798082 ?auto_798089 ) ) ( not ( = ?auto_798082 ?auto_798090 ) ) ( not ( = ?auto_798083 ?auto_798084 ) ) ( not ( = ?auto_798083 ?auto_798085 ) ) ( not ( = ?auto_798083 ?auto_798086 ) ) ( not ( = ?auto_798083 ?auto_798087 ) ) ( not ( = ?auto_798083 ?auto_798088 ) ) ( not ( = ?auto_798083 ?auto_798089 ) ) ( not ( = ?auto_798083 ?auto_798090 ) ) ( not ( = ?auto_798084 ?auto_798085 ) ) ( not ( = ?auto_798084 ?auto_798086 ) ) ( not ( = ?auto_798084 ?auto_798087 ) ) ( not ( = ?auto_798084 ?auto_798088 ) ) ( not ( = ?auto_798084 ?auto_798089 ) ) ( not ( = ?auto_798084 ?auto_798090 ) ) ( not ( = ?auto_798085 ?auto_798086 ) ) ( not ( = ?auto_798085 ?auto_798087 ) ) ( not ( = ?auto_798085 ?auto_798088 ) ) ( not ( = ?auto_798085 ?auto_798089 ) ) ( not ( = ?auto_798085 ?auto_798090 ) ) ( not ( = ?auto_798086 ?auto_798087 ) ) ( not ( = ?auto_798086 ?auto_798088 ) ) ( not ( = ?auto_798086 ?auto_798089 ) ) ( not ( = ?auto_798086 ?auto_798090 ) ) ( not ( = ?auto_798087 ?auto_798088 ) ) ( not ( = ?auto_798087 ?auto_798089 ) ) ( not ( = ?auto_798087 ?auto_798090 ) ) ( not ( = ?auto_798088 ?auto_798089 ) ) ( not ( = ?auto_798088 ?auto_798090 ) ) ( not ( = ?auto_798089 ?auto_798090 ) ) ( ON ?auto_798088 ?auto_798089 ) ( ON ?auto_798087 ?auto_798088 ) ( ON ?auto_798086 ?auto_798087 ) ( ON ?auto_798085 ?auto_798086 ) ( ON ?auto_798084 ?auto_798085 ) ( CLEAR ?auto_798082 ) ( ON ?auto_798083 ?auto_798084 ) ( CLEAR ?auto_798083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_798074 ?auto_798075 ?auto_798076 ?auto_798077 ?auto_798078 ?auto_798079 ?auto_798080 ?auto_798081 ?auto_798082 ?auto_798083 )
      ( MAKE-16PILE ?auto_798074 ?auto_798075 ?auto_798076 ?auto_798077 ?auto_798078 ?auto_798079 ?auto_798080 ?auto_798081 ?auto_798082 ?auto_798083 ?auto_798084 ?auto_798085 ?auto_798086 ?auto_798087 ?auto_798088 ?auto_798089 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_798140 - BLOCK
      ?auto_798141 - BLOCK
      ?auto_798142 - BLOCK
      ?auto_798143 - BLOCK
      ?auto_798144 - BLOCK
      ?auto_798145 - BLOCK
      ?auto_798146 - BLOCK
      ?auto_798147 - BLOCK
      ?auto_798148 - BLOCK
      ?auto_798149 - BLOCK
      ?auto_798150 - BLOCK
      ?auto_798151 - BLOCK
      ?auto_798152 - BLOCK
      ?auto_798153 - BLOCK
      ?auto_798154 - BLOCK
      ?auto_798155 - BLOCK
    )
    :vars
    (
      ?auto_798156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_798155 ?auto_798156 ) ( ON-TABLE ?auto_798140 ) ( ON ?auto_798141 ?auto_798140 ) ( ON ?auto_798142 ?auto_798141 ) ( ON ?auto_798143 ?auto_798142 ) ( ON ?auto_798144 ?auto_798143 ) ( ON ?auto_798145 ?auto_798144 ) ( ON ?auto_798146 ?auto_798145 ) ( ON ?auto_798147 ?auto_798146 ) ( not ( = ?auto_798140 ?auto_798141 ) ) ( not ( = ?auto_798140 ?auto_798142 ) ) ( not ( = ?auto_798140 ?auto_798143 ) ) ( not ( = ?auto_798140 ?auto_798144 ) ) ( not ( = ?auto_798140 ?auto_798145 ) ) ( not ( = ?auto_798140 ?auto_798146 ) ) ( not ( = ?auto_798140 ?auto_798147 ) ) ( not ( = ?auto_798140 ?auto_798148 ) ) ( not ( = ?auto_798140 ?auto_798149 ) ) ( not ( = ?auto_798140 ?auto_798150 ) ) ( not ( = ?auto_798140 ?auto_798151 ) ) ( not ( = ?auto_798140 ?auto_798152 ) ) ( not ( = ?auto_798140 ?auto_798153 ) ) ( not ( = ?auto_798140 ?auto_798154 ) ) ( not ( = ?auto_798140 ?auto_798155 ) ) ( not ( = ?auto_798140 ?auto_798156 ) ) ( not ( = ?auto_798141 ?auto_798142 ) ) ( not ( = ?auto_798141 ?auto_798143 ) ) ( not ( = ?auto_798141 ?auto_798144 ) ) ( not ( = ?auto_798141 ?auto_798145 ) ) ( not ( = ?auto_798141 ?auto_798146 ) ) ( not ( = ?auto_798141 ?auto_798147 ) ) ( not ( = ?auto_798141 ?auto_798148 ) ) ( not ( = ?auto_798141 ?auto_798149 ) ) ( not ( = ?auto_798141 ?auto_798150 ) ) ( not ( = ?auto_798141 ?auto_798151 ) ) ( not ( = ?auto_798141 ?auto_798152 ) ) ( not ( = ?auto_798141 ?auto_798153 ) ) ( not ( = ?auto_798141 ?auto_798154 ) ) ( not ( = ?auto_798141 ?auto_798155 ) ) ( not ( = ?auto_798141 ?auto_798156 ) ) ( not ( = ?auto_798142 ?auto_798143 ) ) ( not ( = ?auto_798142 ?auto_798144 ) ) ( not ( = ?auto_798142 ?auto_798145 ) ) ( not ( = ?auto_798142 ?auto_798146 ) ) ( not ( = ?auto_798142 ?auto_798147 ) ) ( not ( = ?auto_798142 ?auto_798148 ) ) ( not ( = ?auto_798142 ?auto_798149 ) ) ( not ( = ?auto_798142 ?auto_798150 ) ) ( not ( = ?auto_798142 ?auto_798151 ) ) ( not ( = ?auto_798142 ?auto_798152 ) ) ( not ( = ?auto_798142 ?auto_798153 ) ) ( not ( = ?auto_798142 ?auto_798154 ) ) ( not ( = ?auto_798142 ?auto_798155 ) ) ( not ( = ?auto_798142 ?auto_798156 ) ) ( not ( = ?auto_798143 ?auto_798144 ) ) ( not ( = ?auto_798143 ?auto_798145 ) ) ( not ( = ?auto_798143 ?auto_798146 ) ) ( not ( = ?auto_798143 ?auto_798147 ) ) ( not ( = ?auto_798143 ?auto_798148 ) ) ( not ( = ?auto_798143 ?auto_798149 ) ) ( not ( = ?auto_798143 ?auto_798150 ) ) ( not ( = ?auto_798143 ?auto_798151 ) ) ( not ( = ?auto_798143 ?auto_798152 ) ) ( not ( = ?auto_798143 ?auto_798153 ) ) ( not ( = ?auto_798143 ?auto_798154 ) ) ( not ( = ?auto_798143 ?auto_798155 ) ) ( not ( = ?auto_798143 ?auto_798156 ) ) ( not ( = ?auto_798144 ?auto_798145 ) ) ( not ( = ?auto_798144 ?auto_798146 ) ) ( not ( = ?auto_798144 ?auto_798147 ) ) ( not ( = ?auto_798144 ?auto_798148 ) ) ( not ( = ?auto_798144 ?auto_798149 ) ) ( not ( = ?auto_798144 ?auto_798150 ) ) ( not ( = ?auto_798144 ?auto_798151 ) ) ( not ( = ?auto_798144 ?auto_798152 ) ) ( not ( = ?auto_798144 ?auto_798153 ) ) ( not ( = ?auto_798144 ?auto_798154 ) ) ( not ( = ?auto_798144 ?auto_798155 ) ) ( not ( = ?auto_798144 ?auto_798156 ) ) ( not ( = ?auto_798145 ?auto_798146 ) ) ( not ( = ?auto_798145 ?auto_798147 ) ) ( not ( = ?auto_798145 ?auto_798148 ) ) ( not ( = ?auto_798145 ?auto_798149 ) ) ( not ( = ?auto_798145 ?auto_798150 ) ) ( not ( = ?auto_798145 ?auto_798151 ) ) ( not ( = ?auto_798145 ?auto_798152 ) ) ( not ( = ?auto_798145 ?auto_798153 ) ) ( not ( = ?auto_798145 ?auto_798154 ) ) ( not ( = ?auto_798145 ?auto_798155 ) ) ( not ( = ?auto_798145 ?auto_798156 ) ) ( not ( = ?auto_798146 ?auto_798147 ) ) ( not ( = ?auto_798146 ?auto_798148 ) ) ( not ( = ?auto_798146 ?auto_798149 ) ) ( not ( = ?auto_798146 ?auto_798150 ) ) ( not ( = ?auto_798146 ?auto_798151 ) ) ( not ( = ?auto_798146 ?auto_798152 ) ) ( not ( = ?auto_798146 ?auto_798153 ) ) ( not ( = ?auto_798146 ?auto_798154 ) ) ( not ( = ?auto_798146 ?auto_798155 ) ) ( not ( = ?auto_798146 ?auto_798156 ) ) ( not ( = ?auto_798147 ?auto_798148 ) ) ( not ( = ?auto_798147 ?auto_798149 ) ) ( not ( = ?auto_798147 ?auto_798150 ) ) ( not ( = ?auto_798147 ?auto_798151 ) ) ( not ( = ?auto_798147 ?auto_798152 ) ) ( not ( = ?auto_798147 ?auto_798153 ) ) ( not ( = ?auto_798147 ?auto_798154 ) ) ( not ( = ?auto_798147 ?auto_798155 ) ) ( not ( = ?auto_798147 ?auto_798156 ) ) ( not ( = ?auto_798148 ?auto_798149 ) ) ( not ( = ?auto_798148 ?auto_798150 ) ) ( not ( = ?auto_798148 ?auto_798151 ) ) ( not ( = ?auto_798148 ?auto_798152 ) ) ( not ( = ?auto_798148 ?auto_798153 ) ) ( not ( = ?auto_798148 ?auto_798154 ) ) ( not ( = ?auto_798148 ?auto_798155 ) ) ( not ( = ?auto_798148 ?auto_798156 ) ) ( not ( = ?auto_798149 ?auto_798150 ) ) ( not ( = ?auto_798149 ?auto_798151 ) ) ( not ( = ?auto_798149 ?auto_798152 ) ) ( not ( = ?auto_798149 ?auto_798153 ) ) ( not ( = ?auto_798149 ?auto_798154 ) ) ( not ( = ?auto_798149 ?auto_798155 ) ) ( not ( = ?auto_798149 ?auto_798156 ) ) ( not ( = ?auto_798150 ?auto_798151 ) ) ( not ( = ?auto_798150 ?auto_798152 ) ) ( not ( = ?auto_798150 ?auto_798153 ) ) ( not ( = ?auto_798150 ?auto_798154 ) ) ( not ( = ?auto_798150 ?auto_798155 ) ) ( not ( = ?auto_798150 ?auto_798156 ) ) ( not ( = ?auto_798151 ?auto_798152 ) ) ( not ( = ?auto_798151 ?auto_798153 ) ) ( not ( = ?auto_798151 ?auto_798154 ) ) ( not ( = ?auto_798151 ?auto_798155 ) ) ( not ( = ?auto_798151 ?auto_798156 ) ) ( not ( = ?auto_798152 ?auto_798153 ) ) ( not ( = ?auto_798152 ?auto_798154 ) ) ( not ( = ?auto_798152 ?auto_798155 ) ) ( not ( = ?auto_798152 ?auto_798156 ) ) ( not ( = ?auto_798153 ?auto_798154 ) ) ( not ( = ?auto_798153 ?auto_798155 ) ) ( not ( = ?auto_798153 ?auto_798156 ) ) ( not ( = ?auto_798154 ?auto_798155 ) ) ( not ( = ?auto_798154 ?auto_798156 ) ) ( not ( = ?auto_798155 ?auto_798156 ) ) ( ON ?auto_798154 ?auto_798155 ) ( ON ?auto_798153 ?auto_798154 ) ( ON ?auto_798152 ?auto_798153 ) ( ON ?auto_798151 ?auto_798152 ) ( ON ?auto_798150 ?auto_798151 ) ( ON ?auto_798149 ?auto_798150 ) ( CLEAR ?auto_798147 ) ( ON ?auto_798148 ?auto_798149 ) ( CLEAR ?auto_798148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_798140 ?auto_798141 ?auto_798142 ?auto_798143 ?auto_798144 ?auto_798145 ?auto_798146 ?auto_798147 ?auto_798148 )
      ( MAKE-16PILE ?auto_798140 ?auto_798141 ?auto_798142 ?auto_798143 ?auto_798144 ?auto_798145 ?auto_798146 ?auto_798147 ?auto_798148 ?auto_798149 ?auto_798150 ?auto_798151 ?auto_798152 ?auto_798153 ?auto_798154 ?auto_798155 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_798206 - BLOCK
      ?auto_798207 - BLOCK
      ?auto_798208 - BLOCK
      ?auto_798209 - BLOCK
      ?auto_798210 - BLOCK
      ?auto_798211 - BLOCK
      ?auto_798212 - BLOCK
      ?auto_798213 - BLOCK
      ?auto_798214 - BLOCK
      ?auto_798215 - BLOCK
      ?auto_798216 - BLOCK
      ?auto_798217 - BLOCK
      ?auto_798218 - BLOCK
      ?auto_798219 - BLOCK
      ?auto_798220 - BLOCK
      ?auto_798221 - BLOCK
    )
    :vars
    (
      ?auto_798222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_798221 ?auto_798222 ) ( ON-TABLE ?auto_798206 ) ( ON ?auto_798207 ?auto_798206 ) ( ON ?auto_798208 ?auto_798207 ) ( ON ?auto_798209 ?auto_798208 ) ( ON ?auto_798210 ?auto_798209 ) ( ON ?auto_798211 ?auto_798210 ) ( ON ?auto_798212 ?auto_798211 ) ( not ( = ?auto_798206 ?auto_798207 ) ) ( not ( = ?auto_798206 ?auto_798208 ) ) ( not ( = ?auto_798206 ?auto_798209 ) ) ( not ( = ?auto_798206 ?auto_798210 ) ) ( not ( = ?auto_798206 ?auto_798211 ) ) ( not ( = ?auto_798206 ?auto_798212 ) ) ( not ( = ?auto_798206 ?auto_798213 ) ) ( not ( = ?auto_798206 ?auto_798214 ) ) ( not ( = ?auto_798206 ?auto_798215 ) ) ( not ( = ?auto_798206 ?auto_798216 ) ) ( not ( = ?auto_798206 ?auto_798217 ) ) ( not ( = ?auto_798206 ?auto_798218 ) ) ( not ( = ?auto_798206 ?auto_798219 ) ) ( not ( = ?auto_798206 ?auto_798220 ) ) ( not ( = ?auto_798206 ?auto_798221 ) ) ( not ( = ?auto_798206 ?auto_798222 ) ) ( not ( = ?auto_798207 ?auto_798208 ) ) ( not ( = ?auto_798207 ?auto_798209 ) ) ( not ( = ?auto_798207 ?auto_798210 ) ) ( not ( = ?auto_798207 ?auto_798211 ) ) ( not ( = ?auto_798207 ?auto_798212 ) ) ( not ( = ?auto_798207 ?auto_798213 ) ) ( not ( = ?auto_798207 ?auto_798214 ) ) ( not ( = ?auto_798207 ?auto_798215 ) ) ( not ( = ?auto_798207 ?auto_798216 ) ) ( not ( = ?auto_798207 ?auto_798217 ) ) ( not ( = ?auto_798207 ?auto_798218 ) ) ( not ( = ?auto_798207 ?auto_798219 ) ) ( not ( = ?auto_798207 ?auto_798220 ) ) ( not ( = ?auto_798207 ?auto_798221 ) ) ( not ( = ?auto_798207 ?auto_798222 ) ) ( not ( = ?auto_798208 ?auto_798209 ) ) ( not ( = ?auto_798208 ?auto_798210 ) ) ( not ( = ?auto_798208 ?auto_798211 ) ) ( not ( = ?auto_798208 ?auto_798212 ) ) ( not ( = ?auto_798208 ?auto_798213 ) ) ( not ( = ?auto_798208 ?auto_798214 ) ) ( not ( = ?auto_798208 ?auto_798215 ) ) ( not ( = ?auto_798208 ?auto_798216 ) ) ( not ( = ?auto_798208 ?auto_798217 ) ) ( not ( = ?auto_798208 ?auto_798218 ) ) ( not ( = ?auto_798208 ?auto_798219 ) ) ( not ( = ?auto_798208 ?auto_798220 ) ) ( not ( = ?auto_798208 ?auto_798221 ) ) ( not ( = ?auto_798208 ?auto_798222 ) ) ( not ( = ?auto_798209 ?auto_798210 ) ) ( not ( = ?auto_798209 ?auto_798211 ) ) ( not ( = ?auto_798209 ?auto_798212 ) ) ( not ( = ?auto_798209 ?auto_798213 ) ) ( not ( = ?auto_798209 ?auto_798214 ) ) ( not ( = ?auto_798209 ?auto_798215 ) ) ( not ( = ?auto_798209 ?auto_798216 ) ) ( not ( = ?auto_798209 ?auto_798217 ) ) ( not ( = ?auto_798209 ?auto_798218 ) ) ( not ( = ?auto_798209 ?auto_798219 ) ) ( not ( = ?auto_798209 ?auto_798220 ) ) ( not ( = ?auto_798209 ?auto_798221 ) ) ( not ( = ?auto_798209 ?auto_798222 ) ) ( not ( = ?auto_798210 ?auto_798211 ) ) ( not ( = ?auto_798210 ?auto_798212 ) ) ( not ( = ?auto_798210 ?auto_798213 ) ) ( not ( = ?auto_798210 ?auto_798214 ) ) ( not ( = ?auto_798210 ?auto_798215 ) ) ( not ( = ?auto_798210 ?auto_798216 ) ) ( not ( = ?auto_798210 ?auto_798217 ) ) ( not ( = ?auto_798210 ?auto_798218 ) ) ( not ( = ?auto_798210 ?auto_798219 ) ) ( not ( = ?auto_798210 ?auto_798220 ) ) ( not ( = ?auto_798210 ?auto_798221 ) ) ( not ( = ?auto_798210 ?auto_798222 ) ) ( not ( = ?auto_798211 ?auto_798212 ) ) ( not ( = ?auto_798211 ?auto_798213 ) ) ( not ( = ?auto_798211 ?auto_798214 ) ) ( not ( = ?auto_798211 ?auto_798215 ) ) ( not ( = ?auto_798211 ?auto_798216 ) ) ( not ( = ?auto_798211 ?auto_798217 ) ) ( not ( = ?auto_798211 ?auto_798218 ) ) ( not ( = ?auto_798211 ?auto_798219 ) ) ( not ( = ?auto_798211 ?auto_798220 ) ) ( not ( = ?auto_798211 ?auto_798221 ) ) ( not ( = ?auto_798211 ?auto_798222 ) ) ( not ( = ?auto_798212 ?auto_798213 ) ) ( not ( = ?auto_798212 ?auto_798214 ) ) ( not ( = ?auto_798212 ?auto_798215 ) ) ( not ( = ?auto_798212 ?auto_798216 ) ) ( not ( = ?auto_798212 ?auto_798217 ) ) ( not ( = ?auto_798212 ?auto_798218 ) ) ( not ( = ?auto_798212 ?auto_798219 ) ) ( not ( = ?auto_798212 ?auto_798220 ) ) ( not ( = ?auto_798212 ?auto_798221 ) ) ( not ( = ?auto_798212 ?auto_798222 ) ) ( not ( = ?auto_798213 ?auto_798214 ) ) ( not ( = ?auto_798213 ?auto_798215 ) ) ( not ( = ?auto_798213 ?auto_798216 ) ) ( not ( = ?auto_798213 ?auto_798217 ) ) ( not ( = ?auto_798213 ?auto_798218 ) ) ( not ( = ?auto_798213 ?auto_798219 ) ) ( not ( = ?auto_798213 ?auto_798220 ) ) ( not ( = ?auto_798213 ?auto_798221 ) ) ( not ( = ?auto_798213 ?auto_798222 ) ) ( not ( = ?auto_798214 ?auto_798215 ) ) ( not ( = ?auto_798214 ?auto_798216 ) ) ( not ( = ?auto_798214 ?auto_798217 ) ) ( not ( = ?auto_798214 ?auto_798218 ) ) ( not ( = ?auto_798214 ?auto_798219 ) ) ( not ( = ?auto_798214 ?auto_798220 ) ) ( not ( = ?auto_798214 ?auto_798221 ) ) ( not ( = ?auto_798214 ?auto_798222 ) ) ( not ( = ?auto_798215 ?auto_798216 ) ) ( not ( = ?auto_798215 ?auto_798217 ) ) ( not ( = ?auto_798215 ?auto_798218 ) ) ( not ( = ?auto_798215 ?auto_798219 ) ) ( not ( = ?auto_798215 ?auto_798220 ) ) ( not ( = ?auto_798215 ?auto_798221 ) ) ( not ( = ?auto_798215 ?auto_798222 ) ) ( not ( = ?auto_798216 ?auto_798217 ) ) ( not ( = ?auto_798216 ?auto_798218 ) ) ( not ( = ?auto_798216 ?auto_798219 ) ) ( not ( = ?auto_798216 ?auto_798220 ) ) ( not ( = ?auto_798216 ?auto_798221 ) ) ( not ( = ?auto_798216 ?auto_798222 ) ) ( not ( = ?auto_798217 ?auto_798218 ) ) ( not ( = ?auto_798217 ?auto_798219 ) ) ( not ( = ?auto_798217 ?auto_798220 ) ) ( not ( = ?auto_798217 ?auto_798221 ) ) ( not ( = ?auto_798217 ?auto_798222 ) ) ( not ( = ?auto_798218 ?auto_798219 ) ) ( not ( = ?auto_798218 ?auto_798220 ) ) ( not ( = ?auto_798218 ?auto_798221 ) ) ( not ( = ?auto_798218 ?auto_798222 ) ) ( not ( = ?auto_798219 ?auto_798220 ) ) ( not ( = ?auto_798219 ?auto_798221 ) ) ( not ( = ?auto_798219 ?auto_798222 ) ) ( not ( = ?auto_798220 ?auto_798221 ) ) ( not ( = ?auto_798220 ?auto_798222 ) ) ( not ( = ?auto_798221 ?auto_798222 ) ) ( ON ?auto_798220 ?auto_798221 ) ( ON ?auto_798219 ?auto_798220 ) ( ON ?auto_798218 ?auto_798219 ) ( ON ?auto_798217 ?auto_798218 ) ( ON ?auto_798216 ?auto_798217 ) ( ON ?auto_798215 ?auto_798216 ) ( ON ?auto_798214 ?auto_798215 ) ( CLEAR ?auto_798212 ) ( ON ?auto_798213 ?auto_798214 ) ( CLEAR ?auto_798213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_798206 ?auto_798207 ?auto_798208 ?auto_798209 ?auto_798210 ?auto_798211 ?auto_798212 ?auto_798213 )
      ( MAKE-16PILE ?auto_798206 ?auto_798207 ?auto_798208 ?auto_798209 ?auto_798210 ?auto_798211 ?auto_798212 ?auto_798213 ?auto_798214 ?auto_798215 ?auto_798216 ?auto_798217 ?auto_798218 ?auto_798219 ?auto_798220 ?auto_798221 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_798272 - BLOCK
      ?auto_798273 - BLOCK
      ?auto_798274 - BLOCK
      ?auto_798275 - BLOCK
      ?auto_798276 - BLOCK
      ?auto_798277 - BLOCK
      ?auto_798278 - BLOCK
      ?auto_798279 - BLOCK
      ?auto_798280 - BLOCK
      ?auto_798281 - BLOCK
      ?auto_798282 - BLOCK
      ?auto_798283 - BLOCK
      ?auto_798284 - BLOCK
      ?auto_798285 - BLOCK
      ?auto_798286 - BLOCK
      ?auto_798287 - BLOCK
    )
    :vars
    (
      ?auto_798288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_798287 ?auto_798288 ) ( ON-TABLE ?auto_798272 ) ( ON ?auto_798273 ?auto_798272 ) ( ON ?auto_798274 ?auto_798273 ) ( ON ?auto_798275 ?auto_798274 ) ( ON ?auto_798276 ?auto_798275 ) ( ON ?auto_798277 ?auto_798276 ) ( not ( = ?auto_798272 ?auto_798273 ) ) ( not ( = ?auto_798272 ?auto_798274 ) ) ( not ( = ?auto_798272 ?auto_798275 ) ) ( not ( = ?auto_798272 ?auto_798276 ) ) ( not ( = ?auto_798272 ?auto_798277 ) ) ( not ( = ?auto_798272 ?auto_798278 ) ) ( not ( = ?auto_798272 ?auto_798279 ) ) ( not ( = ?auto_798272 ?auto_798280 ) ) ( not ( = ?auto_798272 ?auto_798281 ) ) ( not ( = ?auto_798272 ?auto_798282 ) ) ( not ( = ?auto_798272 ?auto_798283 ) ) ( not ( = ?auto_798272 ?auto_798284 ) ) ( not ( = ?auto_798272 ?auto_798285 ) ) ( not ( = ?auto_798272 ?auto_798286 ) ) ( not ( = ?auto_798272 ?auto_798287 ) ) ( not ( = ?auto_798272 ?auto_798288 ) ) ( not ( = ?auto_798273 ?auto_798274 ) ) ( not ( = ?auto_798273 ?auto_798275 ) ) ( not ( = ?auto_798273 ?auto_798276 ) ) ( not ( = ?auto_798273 ?auto_798277 ) ) ( not ( = ?auto_798273 ?auto_798278 ) ) ( not ( = ?auto_798273 ?auto_798279 ) ) ( not ( = ?auto_798273 ?auto_798280 ) ) ( not ( = ?auto_798273 ?auto_798281 ) ) ( not ( = ?auto_798273 ?auto_798282 ) ) ( not ( = ?auto_798273 ?auto_798283 ) ) ( not ( = ?auto_798273 ?auto_798284 ) ) ( not ( = ?auto_798273 ?auto_798285 ) ) ( not ( = ?auto_798273 ?auto_798286 ) ) ( not ( = ?auto_798273 ?auto_798287 ) ) ( not ( = ?auto_798273 ?auto_798288 ) ) ( not ( = ?auto_798274 ?auto_798275 ) ) ( not ( = ?auto_798274 ?auto_798276 ) ) ( not ( = ?auto_798274 ?auto_798277 ) ) ( not ( = ?auto_798274 ?auto_798278 ) ) ( not ( = ?auto_798274 ?auto_798279 ) ) ( not ( = ?auto_798274 ?auto_798280 ) ) ( not ( = ?auto_798274 ?auto_798281 ) ) ( not ( = ?auto_798274 ?auto_798282 ) ) ( not ( = ?auto_798274 ?auto_798283 ) ) ( not ( = ?auto_798274 ?auto_798284 ) ) ( not ( = ?auto_798274 ?auto_798285 ) ) ( not ( = ?auto_798274 ?auto_798286 ) ) ( not ( = ?auto_798274 ?auto_798287 ) ) ( not ( = ?auto_798274 ?auto_798288 ) ) ( not ( = ?auto_798275 ?auto_798276 ) ) ( not ( = ?auto_798275 ?auto_798277 ) ) ( not ( = ?auto_798275 ?auto_798278 ) ) ( not ( = ?auto_798275 ?auto_798279 ) ) ( not ( = ?auto_798275 ?auto_798280 ) ) ( not ( = ?auto_798275 ?auto_798281 ) ) ( not ( = ?auto_798275 ?auto_798282 ) ) ( not ( = ?auto_798275 ?auto_798283 ) ) ( not ( = ?auto_798275 ?auto_798284 ) ) ( not ( = ?auto_798275 ?auto_798285 ) ) ( not ( = ?auto_798275 ?auto_798286 ) ) ( not ( = ?auto_798275 ?auto_798287 ) ) ( not ( = ?auto_798275 ?auto_798288 ) ) ( not ( = ?auto_798276 ?auto_798277 ) ) ( not ( = ?auto_798276 ?auto_798278 ) ) ( not ( = ?auto_798276 ?auto_798279 ) ) ( not ( = ?auto_798276 ?auto_798280 ) ) ( not ( = ?auto_798276 ?auto_798281 ) ) ( not ( = ?auto_798276 ?auto_798282 ) ) ( not ( = ?auto_798276 ?auto_798283 ) ) ( not ( = ?auto_798276 ?auto_798284 ) ) ( not ( = ?auto_798276 ?auto_798285 ) ) ( not ( = ?auto_798276 ?auto_798286 ) ) ( not ( = ?auto_798276 ?auto_798287 ) ) ( not ( = ?auto_798276 ?auto_798288 ) ) ( not ( = ?auto_798277 ?auto_798278 ) ) ( not ( = ?auto_798277 ?auto_798279 ) ) ( not ( = ?auto_798277 ?auto_798280 ) ) ( not ( = ?auto_798277 ?auto_798281 ) ) ( not ( = ?auto_798277 ?auto_798282 ) ) ( not ( = ?auto_798277 ?auto_798283 ) ) ( not ( = ?auto_798277 ?auto_798284 ) ) ( not ( = ?auto_798277 ?auto_798285 ) ) ( not ( = ?auto_798277 ?auto_798286 ) ) ( not ( = ?auto_798277 ?auto_798287 ) ) ( not ( = ?auto_798277 ?auto_798288 ) ) ( not ( = ?auto_798278 ?auto_798279 ) ) ( not ( = ?auto_798278 ?auto_798280 ) ) ( not ( = ?auto_798278 ?auto_798281 ) ) ( not ( = ?auto_798278 ?auto_798282 ) ) ( not ( = ?auto_798278 ?auto_798283 ) ) ( not ( = ?auto_798278 ?auto_798284 ) ) ( not ( = ?auto_798278 ?auto_798285 ) ) ( not ( = ?auto_798278 ?auto_798286 ) ) ( not ( = ?auto_798278 ?auto_798287 ) ) ( not ( = ?auto_798278 ?auto_798288 ) ) ( not ( = ?auto_798279 ?auto_798280 ) ) ( not ( = ?auto_798279 ?auto_798281 ) ) ( not ( = ?auto_798279 ?auto_798282 ) ) ( not ( = ?auto_798279 ?auto_798283 ) ) ( not ( = ?auto_798279 ?auto_798284 ) ) ( not ( = ?auto_798279 ?auto_798285 ) ) ( not ( = ?auto_798279 ?auto_798286 ) ) ( not ( = ?auto_798279 ?auto_798287 ) ) ( not ( = ?auto_798279 ?auto_798288 ) ) ( not ( = ?auto_798280 ?auto_798281 ) ) ( not ( = ?auto_798280 ?auto_798282 ) ) ( not ( = ?auto_798280 ?auto_798283 ) ) ( not ( = ?auto_798280 ?auto_798284 ) ) ( not ( = ?auto_798280 ?auto_798285 ) ) ( not ( = ?auto_798280 ?auto_798286 ) ) ( not ( = ?auto_798280 ?auto_798287 ) ) ( not ( = ?auto_798280 ?auto_798288 ) ) ( not ( = ?auto_798281 ?auto_798282 ) ) ( not ( = ?auto_798281 ?auto_798283 ) ) ( not ( = ?auto_798281 ?auto_798284 ) ) ( not ( = ?auto_798281 ?auto_798285 ) ) ( not ( = ?auto_798281 ?auto_798286 ) ) ( not ( = ?auto_798281 ?auto_798287 ) ) ( not ( = ?auto_798281 ?auto_798288 ) ) ( not ( = ?auto_798282 ?auto_798283 ) ) ( not ( = ?auto_798282 ?auto_798284 ) ) ( not ( = ?auto_798282 ?auto_798285 ) ) ( not ( = ?auto_798282 ?auto_798286 ) ) ( not ( = ?auto_798282 ?auto_798287 ) ) ( not ( = ?auto_798282 ?auto_798288 ) ) ( not ( = ?auto_798283 ?auto_798284 ) ) ( not ( = ?auto_798283 ?auto_798285 ) ) ( not ( = ?auto_798283 ?auto_798286 ) ) ( not ( = ?auto_798283 ?auto_798287 ) ) ( not ( = ?auto_798283 ?auto_798288 ) ) ( not ( = ?auto_798284 ?auto_798285 ) ) ( not ( = ?auto_798284 ?auto_798286 ) ) ( not ( = ?auto_798284 ?auto_798287 ) ) ( not ( = ?auto_798284 ?auto_798288 ) ) ( not ( = ?auto_798285 ?auto_798286 ) ) ( not ( = ?auto_798285 ?auto_798287 ) ) ( not ( = ?auto_798285 ?auto_798288 ) ) ( not ( = ?auto_798286 ?auto_798287 ) ) ( not ( = ?auto_798286 ?auto_798288 ) ) ( not ( = ?auto_798287 ?auto_798288 ) ) ( ON ?auto_798286 ?auto_798287 ) ( ON ?auto_798285 ?auto_798286 ) ( ON ?auto_798284 ?auto_798285 ) ( ON ?auto_798283 ?auto_798284 ) ( ON ?auto_798282 ?auto_798283 ) ( ON ?auto_798281 ?auto_798282 ) ( ON ?auto_798280 ?auto_798281 ) ( ON ?auto_798279 ?auto_798280 ) ( CLEAR ?auto_798277 ) ( ON ?auto_798278 ?auto_798279 ) ( CLEAR ?auto_798278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_798272 ?auto_798273 ?auto_798274 ?auto_798275 ?auto_798276 ?auto_798277 ?auto_798278 )
      ( MAKE-16PILE ?auto_798272 ?auto_798273 ?auto_798274 ?auto_798275 ?auto_798276 ?auto_798277 ?auto_798278 ?auto_798279 ?auto_798280 ?auto_798281 ?auto_798282 ?auto_798283 ?auto_798284 ?auto_798285 ?auto_798286 ?auto_798287 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_798338 - BLOCK
      ?auto_798339 - BLOCK
      ?auto_798340 - BLOCK
      ?auto_798341 - BLOCK
      ?auto_798342 - BLOCK
      ?auto_798343 - BLOCK
      ?auto_798344 - BLOCK
      ?auto_798345 - BLOCK
      ?auto_798346 - BLOCK
      ?auto_798347 - BLOCK
      ?auto_798348 - BLOCK
      ?auto_798349 - BLOCK
      ?auto_798350 - BLOCK
      ?auto_798351 - BLOCK
      ?auto_798352 - BLOCK
      ?auto_798353 - BLOCK
    )
    :vars
    (
      ?auto_798354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_798353 ?auto_798354 ) ( ON-TABLE ?auto_798338 ) ( ON ?auto_798339 ?auto_798338 ) ( ON ?auto_798340 ?auto_798339 ) ( ON ?auto_798341 ?auto_798340 ) ( ON ?auto_798342 ?auto_798341 ) ( not ( = ?auto_798338 ?auto_798339 ) ) ( not ( = ?auto_798338 ?auto_798340 ) ) ( not ( = ?auto_798338 ?auto_798341 ) ) ( not ( = ?auto_798338 ?auto_798342 ) ) ( not ( = ?auto_798338 ?auto_798343 ) ) ( not ( = ?auto_798338 ?auto_798344 ) ) ( not ( = ?auto_798338 ?auto_798345 ) ) ( not ( = ?auto_798338 ?auto_798346 ) ) ( not ( = ?auto_798338 ?auto_798347 ) ) ( not ( = ?auto_798338 ?auto_798348 ) ) ( not ( = ?auto_798338 ?auto_798349 ) ) ( not ( = ?auto_798338 ?auto_798350 ) ) ( not ( = ?auto_798338 ?auto_798351 ) ) ( not ( = ?auto_798338 ?auto_798352 ) ) ( not ( = ?auto_798338 ?auto_798353 ) ) ( not ( = ?auto_798338 ?auto_798354 ) ) ( not ( = ?auto_798339 ?auto_798340 ) ) ( not ( = ?auto_798339 ?auto_798341 ) ) ( not ( = ?auto_798339 ?auto_798342 ) ) ( not ( = ?auto_798339 ?auto_798343 ) ) ( not ( = ?auto_798339 ?auto_798344 ) ) ( not ( = ?auto_798339 ?auto_798345 ) ) ( not ( = ?auto_798339 ?auto_798346 ) ) ( not ( = ?auto_798339 ?auto_798347 ) ) ( not ( = ?auto_798339 ?auto_798348 ) ) ( not ( = ?auto_798339 ?auto_798349 ) ) ( not ( = ?auto_798339 ?auto_798350 ) ) ( not ( = ?auto_798339 ?auto_798351 ) ) ( not ( = ?auto_798339 ?auto_798352 ) ) ( not ( = ?auto_798339 ?auto_798353 ) ) ( not ( = ?auto_798339 ?auto_798354 ) ) ( not ( = ?auto_798340 ?auto_798341 ) ) ( not ( = ?auto_798340 ?auto_798342 ) ) ( not ( = ?auto_798340 ?auto_798343 ) ) ( not ( = ?auto_798340 ?auto_798344 ) ) ( not ( = ?auto_798340 ?auto_798345 ) ) ( not ( = ?auto_798340 ?auto_798346 ) ) ( not ( = ?auto_798340 ?auto_798347 ) ) ( not ( = ?auto_798340 ?auto_798348 ) ) ( not ( = ?auto_798340 ?auto_798349 ) ) ( not ( = ?auto_798340 ?auto_798350 ) ) ( not ( = ?auto_798340 ?auto_798351 ) ) ( not ( = ?auto_798340 ?auto_798352 ) ) ( not ( = ?auto_798340 ?auto_798353 ) ) ( not ( = ?auto_798340 ?auto_798354 ) ) ( not ( = ?auto_798341 ?auto_798342 ) ) ( not ( = ?auto_798341 ?auto_798343 ) ) ( not ( = ?auto_798341 ?auto_798344 ) ) ( not ( = ?auto_798341 ?auto_798345 ) ) ( not ( = ?auto_798341 ?auto_798346 ) ) ( not ( = ?auto_798341 ?auto_798347 ) ) ( not ( = ?auto_798341 ?auto_798348 ) ) ( not ( = ?auto_798341 ?auto_798349 ) ) ( not ( = ?auto_798341 ?auto_798350 ) ) ( not ( = ?auto_798341 ?auto_798351 ) ) ( not ( = ?auto_798341 ?auto_798352 ) ) ( not ( = ?auto_798341 ?auto_798353 ) ) ( not ( = ?auto_798341 ?auto_798354 ) ) ( not ( = ?auto_798342 ?auto_798343 ) ) ( not ( = ?auto_798342 ?auto_798344 ) ) ( not ( = ?auto_798342 ?auto_798345 ) ) ( not ( = ?auto_798342 ?auto_798346 ) ) ( not ( = ?auto_798342 ?auto_798347 ) ) ( not ( = ?auto_798342 ?auto_798348 ) ) ( not ( = ?auto_798342 ?auto_798349 ) ) ( not ( = ?auto_798342 ?auto_798350 ) ) ( not ( = ?auto_798342 ?auto_798351 ) ) ( not ( = ?auto_798342 ?auto_798352 ) ) ( not ( = ?auto_798342 ?auto_798353 ) ) ( not ( = ?auto_798342 ?auto_798354 ) ) ( not ( = ?auto_798343 ?auto_798344 ) ) ( not ( = ?auto_798343 ?auto_798345 ) ) ( not ( = ?auto_798343 ?auto_798346 ) ) ( not ( = ?auto_798343 ?auto_798347 ) ) ( not ( = ?auto_798343 ?auto_798348 ) ) ( not ( = ?auto_798343 ?auto_798349 ) ) ( not ( = ?auto_798343 ?auto_798350 ) ) ( not ( = ?auto_798343 ?auto_798351 ) ) ( not ( = ?auto_798343 ?auto_798352 ) ) ( not ( = ?auto_798343 ?auto_798353 ) ) ( not ( = ?auto_798343 ?auto_798354 ) ) ( not ( = ?auto_798344 ?auto_798345 ) ) ( not ( = ?auto_798344 ?auto_798346 ) ) ( not ( = ?auto_798344 ?auto_798347 ) ) ( not ( = ?auto_798344 ?auto_798348 ) ) ( not ( = ?auto_798344 ?auto_798349 ) ) ( not ( = ?auto_798344 ?auto_798350 ) ) ( not ( = ?auto_798344 ?auto_798351 ) ) ( not ( = ?auto_798344 ?auto_798352 ) ) ( not ( = ?auto_798344 ?auto_798353 ) ) ( not ( = ?auto_798344 ?auto_798354 ) ) ( not ( = ?auto_798345 ?auto_798346 ) ) ( not ( = ?auto_798345 ?auto_798347 ) ) ( not ( = ?auto_798345 ?auto_798348 ) ) ( not ( = ?auto_798345 ?auto_798349 ) ) ( not ( = ?auto_798345 ?auto_798350 ) ) ( not ( = ?auto_798345 ?auto_798351 ) ) ( not ( = ?auto_798345 ?auto_798352 ) ) ( not ( = ?auto_798345 ?auto_798353 ) ) ( not ( = ?auto_798345 ?auto_798354 ) ) ( not ( = ?auto_798346 ?auto_798347 ) ) ( not ( = ?auto_798346 ?auto_798348 ) ) ( not ( = ?auto_798346 ?auto_798349 ) ) ( not ( = ?auto_798346 ?auto_798350 ) ) ( not ( = ?auto_798346 ?auto_798351 ) ) ( not ( = ?auto_798346 ?auto_798352 ) ) ( not ( = ?auto_798346 ?auto_798353 ) ) ( not ( = ?auto_798346 ?auto_798354 ) ) ( not ( = ?auto_798347 ?auto_798348 ) ) ( not ( = ?auto_798347 ?auto_798349 ) ) ( not ( = ?auto_798347 ?auto_798350 ) ) ( not ( = ?auto_798347 ?auto_798351 ) ) ( not ( = ?auto_798347 ?auto_798352 ) ) ( not ( = ?auto_798347 ?auto_798353 ) ) ( not ( = ?auto_798347 ?auto_798354 ) ) ( not ( = ?auto_798348 ?auto_798349 ) ) ( not ( = ?auto_798348 ?auto_798350 ) ) ( not ( = ?auto_798348 ?auto_798351 ) ) ( not ( = ?auto_798348 ?auto_798352 ) ) ( not ( = ?auto_798348 ?auto_798353 ) ) ( not ( = ?auto_798348 ?auto_798354 ) ) ( not ( = ?auto_798349 ?auto_798350 ) ) ( not ( = ?auto_798349 ?auto_798351 ) ) ( not ( = ?auto_798349 ?auto_798352 ) ) ( not ( = ?auto_798349 ?auto_798353 ) ) ( not ( = ?auto_798349 ?auto_798354 ) ) ( not ( = ?auto_798350 ?auto_798351 ) ) ( not ( = ?auto_798350 ?auto_798352 ) ) ( not ( = ?auto_798350 ?auto_798353 ) ) ( not ( = ?auto_798350 ?auto_798354 ) ) ( not ( = ?auto_798351 ?auto_798352 ) ) ( not ( = ?auto_798351 ?auto_798353 ) ) ( not ( = ?auto_798351 ?auto_798354 ) ) ( not ( = ?auto_798352 ?auto_798353 ) ) ( not ( = ?auto_798352 ?auto_798354 ) ) ( not ( = ?auto_798353 ?auto_798354 ) ) ( ON ?auto_798352 ?auto_798353 ) ( ON ?auto_798351 ?auto_798352 ) ( ON ?auto_798350 ?auto_798351 ) ( ON ?auto_798349 ?auto_798350 ) ( ON ?auto_798348 ?auto_798349 ) ( ON ?auto_798347 ?auto_798348 ) ( ON ?auto_798346 ?auto_798347 ) ( ON ?auto_798345 ?auto_798346 ) ( ON ?auto_798344 ?auto_798345 ) ( CLEAR ?auto_798342 ) ( ON ?auto_798343 ?auto_798344 ) ( CLEAR ?auto_798343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_798338 ?auto_798339 ?auto_798340 ?auto_798341 ?auto_798342 ?auto_798343 )
      ( MAKE-16PILE ?auto_798338 ?auto_798339 ?auto_798340 ?auto_798341 ?auto_798342 ?auto_798343 ?auto_798344 ?auto_798345 ?auto_798346 ?auto_798347 ?auto_798348 ?auto_798349 ?auto_798350 ?auto_798351 ?auto_798352 ?auto_798353 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_798404 - BLOCK
      ?auto_798405 - BLOCK
      ?auto_798406 - BLOCK
      ?auto_798407 - BLOCK
      ?auto_798408 - BLOCK
      ?auto_798409 - BLOCK
      ?auto_798410 - BLOCK
      ?auto_798411 - BLOCK
      ?auto_798412 - BLOCK
      ?auto_798413 - BLOCK
      ?auto_798414 - BLOCK
      ?auto_798415 - BLOCK
      ?auto_798416 - BLOCK
      ?auto_798417 - BLOCK
      ?auto_798418 - BLOCK
      ?auto_798419 - BLOCK
    )
    :vars
    (
      ?auto_798420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_798419 ?auto_798420 ) ( ON-TABLE ?auto_798404 ) ( ON ?auto_798405 ?auto_798404 ) ( ON ?auto_798406 ?auto_798405 ) ( ON ?auto_798407 ?auto_798406 ) ( not ( = ?auto_798404 ?auto_798405 ) ) ( not ( = ?auto_798404 ?auto_798406 ) ) ( not ( = ?auto_798404 ?auto_798407 ) ) ( not ( = ?auto_798404 ?auto_798408 ) ) ( not ( = ?auto_798404 ?auto_798409 ) ) ( not ( = ?auto_798404 ?auto_798410 ) ) ( not ( = ?auto_798404 ?auto_798411 ) ) ( not ( = ?auto_798404 ?auto_798412 ) ) ( not ( = ?auto_798404 ?auto_798413 ) ) ( not ( = ?auto_798404 ?auto_798414 ) ) ( not ( = ?auto_798404 ?auto_798415 ) ) ( not ( = ?auto_798404 ?auto_798416 ) ) ( not ( = ?auto_798404 ?auto_798417 ) ) ( not ( = ?auto_798404 ?auto_798418 ) ) ( not ( = ?auto_798404 ?auto_798419 ) ) ( not ( = ?auto_798404 ?auto_798420 ) ) ( not ( = ?auto_798405 ?auto_798406 ) ) ( not ( = ?auto_798405 ?auto_798407 ) ) ( not ( = ?auto_798405 ?auto_798408 ) ) ( not ( = ?auto_798405 ?auto_798409 ) ) ( not ( = ?auto_798405 ?auto_798410 ) ) ( not ( = ?auto_798405 ?auto_798411 ) ) ( not ( = ?auto_798405 ?auto_798412 ) ) ( not ( = ?auto_798405 ?auto_798413 ) ) ( not ( = ?auto_798405 ?auto_798414 ) ) ( not ( = ?auto_798405 ?auto_798415 ) ) ( not ( = ?auto_798405 ?auto_798416 ) ) ( not ( = ?auto_798405 ?auto_798417 ) ) ( not ( = ?auto_798405 ?auto_798418 ) ) ( not ( = ?auto_798405 ?auto_798419 ) ) ( not ( = ?auto_798405 ?auto_798420 ) ) ( not ( = ?auto_798406 ?auto_798407 ) ) ( not ( = ?auto_798406 ?auto_798408 ) ) ( not ( = ?auto_798406 ?auto_798409 ) ) ( not ( = ?auto_798406 ?auto_798410 ) ) ( not ( = ?auto_798406 ?auto_798411 ) ) ( not ( = ?auto_798406 ?auto_798412 ) ) ( not ( = ?auto_798406 ?auto_798413 ) ) ( not ( = ?auto_798406 ?auto_798414 ) ) ( not ( = ?auto_798406 ?auto_798415 ) ) ( not ( = ?auto_798406 ?auto_798416 ) ) ( not ( = ?auto_798406 ?auto_798417 ) ) ( not ( = ?auto_798406 ?auto_798418 ) ) ( not ( = ?auto_798406 ?auto_798419 ) ) ( not ( = ?auto_798406 ?auto_798420 ) ) ( not ( = ?auto_798407 ?auto_798408 ) ) ( not ( = ?auto_798407 ?auto_798409 ) ) ( not ( = ?auto_798407 ?auto_798410 ) ) ( not ( = ?auto_798407 ?auto_798411 ) ) ( not ( = ?auto_798407 ?auto_798412 ) ) ( not ( = ?auto_798407 ?auto_798413 ) ) ( not ( = ?auto_798407 ?auto_798414 ) ) ( not ( = ?auto_798407 ?auto_798415 ) ) ( not ( = ?auto_798407 ?auto_798416 ) ) ( not ( = ?auto_798407 ?auto_798417 ) ) ( not ( = ?auto_798407 ?auto_798418 ) ) ( not ( = ?auto_798407 ?auto_798419 ) ) ( not ( = ?auto_798407 ?auto_798420 ) ) ( not ( = ?auto_798408 ?auto_798409 ) ) ( not ( = ?auto_798408 ?auto_798410 ) ) ( not ( = ?auto_798408 ?auto_798411 ) ) ( not ( = ?auto_798408 ?auto_798412 ) ) ( not ( = ?auto_798408 ?auto_798413 ) ) ( not ( = ?auto_798408 ?auto_798414 ) ) ( not ( = ?auto_798408 ?auto_798415 ) ) ( not ( = ?auto_798408 ?auto_798416 ) ) ( not ( = ?auto_798408 ?auto_798417 ) ) ( not ( = ?auto_798408 ?auto_798418 ) ) ( not ( = ?auto_798408 ?auto_798419 ) ) ( not ( = ?auto_798408 ?auto_798420 ) ) ( not ( = ?auto_798409 ?auto_798410 ) ) ( not ( = ?auto_798409 ?auto_798411 ) ) ( not ( = ?auto_798409 ?auto_798412 ) ) ( not ( = ?auto_798409 ?auto_798413 ) ) ( not ( = ?auto_798409 ?auto_798414 ) ) ( not ( = ?auto_798409 ?auto_798415 ) ) ( not ( = ?auto_798409 ?auto_798416 ) ) ( not ( = ?auto_798409 ?auto_798417 ) ) ( not ( = ?auto_798409 ?auto_798418 ) ) ( not ( = ?auto_798409 ?auto_798419 ) ) ( not ( = ?auto_798409 ?auto_798420 ) ) ( not ( = ?auto_798410 ?auto_798411 ) ) ( not ( = ?auto_798410 ?auto_798412 ) ) ( not ( = ?auto_798410 ?auto_798413 ) ) ( not ( = ?auto_798410 ?auto_798414 ) ) ( not ( = ?auto_798410 ?auto_798415 ) ) ( not ( = ?auto_798410 ?auto_798416 ) ) ( not ( = ?auto_798410 ?auto_798417 ) ) ( not ( = ?auto_798410 ?auto_798418 ) ) ( not ( = ?auto_798410 ?auto_798419 ) ) ( not ( = ?auto_798410 ?auto_798420 ) ) ( not ( = ?auto_798411 ?auto_798412 ) ) ( not ( = ?auto_798411 ?auto_798413 ) ) ( not ( = ?auto_798411 ?auto_798414 ) ) ( not ( = ?auto_798411 ?auto_798415 ) ) ( not ( = ?auto_798411 ?auto_798416 ) ) ( not ( = ?auto_798411 ?auto_798417 ) ) ( not ( = ?auto_798411 ?auto_798418 ) ) ( not ( = ?auto_798411 ?auto_798419 ) ) ( not ( = ?auto_798411 ?auto_798420 ) ) ( not ( = ?auto_798412 ?auto_798413 ) ) ( not ( = ?auto_798412 ?auto_798414 ) ) ( not ( = ?auto_798412 ?auto_798415 ) ) ( not ( = ?auto_798412 ?auto_798416 ) ) ( not ( = ?auto_798412 ?auto_798417 ) ) ( not ( = ?auto_798412 ?auto_798418 ) ) ( not ( = ?auto_798412 ?auto_798419 ) ) ( not ( = ?auto_798412 ?auto_798420 ) ) ( not ( = ?auto_798413 ?auto_798414 ) ) ( not ( = ?auto_798413 ?auto_798415 ) ) ( not ( = ?auto_798413 ?auto_798416 ) ) ( not ( = ?auto_798413 ?auto_798417 ) ) ( not ( = ?auto_798413 ?auto_798418 ) ) ( not ( = ?auto_798413 ?auto_798419 ) ) ( not ( = ?auto_798413 ?auto_798420 ) ) ( not ( = ?auto_798414 ?auto_798415 ) ) ( not ( = ?auto_798414 ?auto_798416 ) ) ( not ( = ?auto_798414 ?auto_798417 ) ) ( not ( = ?auto_798414 ?auto_798418 ) ) ( not ( = ?auto_798414 ?auto_798419 ) ) ( not ( = ?auto_798414 ?auto_798420 ) ) ( not ( = ?auto_798415 ?auto_798416 ) ) ( not ( = ?auto_798415 ?auto_798417 ) ) ( not ( = ?auto_798415 ?auto_798418 ) ) ( not ( = ?auto_798415 ?auto_798419 ) ) ( not ( = ?auto_798415 ?auto_798420 ) ) ( not ( = ?auto_798416 ?auto_798417 ) ) ( not ( = ?auto_798416 ?auto_798418 ) ) ( not ( = ?auto_798416 ?auto_798419 ) ) ( not ( = ?auto_798416 ?auto_798420 ) ) ( not ( = ?auto_798417 ?auto_798418 ) ) ( not ( = ?auto_798417 ?auto_798419 ) ) ( not ( = ?auto_798417 ?auto_798420 ) ) ( not ( = ?auto_798418 ?auto_798419 ) ) ( not ( = ?auto_798418 ?auto_798420 ) ) ( not ( = ?auto_798419 ?auto_798420 ) ) ( ON ?auto_798418 ?auto_798419 ) ( ON ?auto_798417 ?auto_798418 ) ( ON ?auto_798416 ?auto_798417 ) ( ON ?auto_798415 ?auto_798416 ) ( ON ?auto_798414 ?auto_798415 ) ( ON ?auto_798413 ?auto_798414 ) ( ON ?auto_798412 ?auto_798413 ) ( ON ?auto_798411 ?auto_798412 ) ( ON ?auto_798410 ?auto_798411 ) ( ON ?auto_798409 ?auto_798410 ) ( CLEAR ?auto_798407 ) ( ON ?auto_798408 ?auto_798409 ) ( CLEAR ?auto_798408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_798404 ?auto_798405 ?auto_798406 ?auto_798407 ?auto_798408 )
      ( MAKE-16PILE ?auto_798404 ?auto_798405 ?auto_798406 ?auto_798407 ?auto_798408 ?auto_798409 ?auto_798410 ?auto_798411 ?auto_798412 ?auto_798413 ?auto_798414 ?auto_798415 ?auto_798416 ?auto_798417 ?auto_798418 ?auto_798419 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_798470 - BLOCK
      ?auto_798471 - BLOCK
      ?auto_798472 - BLOCK
      ?auto_798473 - BLOCK
      ?auto_798474 - BLOCK
      ?auto_798475 - BLOCK
      ?auto_798476 - BLOCK
      ?auto_798477 - BLOCK
      ?auto_798478 - BLOCK
      ?auto_798479 - BLOCK
      ?auto_798480 - BLOCK
      ?auto_798481 - BLOCK
      ?auto_798482 - BLOCK
      ?auto_798483 - BLOCK
      ?auto_798484 - BLOCK
      ?auto_798485 - BLOCK
    )
    :vars
    (
      ?auto_798486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_798485 ?auto_798486 ) ( ON-TABLE ?auto_798470 ) ( ON ?auto_798471 ?auto_798470 ) ( ON ?auto_798472 ?auto_798471 ) ( not ( = ?auto_798470 ?auto_798471 ) ) ( not ( = ?auto_798470 ?auto_798472 ) ) ( not ( = ?auto_798470 ?auto_798473 ) ) ( not ( = ?auto_798470 ?auto_798474 ) ) ( not ( = ?auto_798470 ?auto_798475 ) ) ( not ( = ?auto_798470 ?auto_798476 ) ) ( not ( = ?auto_798470 ?auto_798477 ) ) ( not ( = ?auto_798470 ?auto_798478 ) ) ( not ( = ?auto_798470 ?auto_798479 ) ) ( not ( = ?auto_798470 ?auto_798480 ) ) ( not ( = ?auto_798470 ?auto_798481 ) ) ( not ( = ?auto_798470 ?auto_798482 ) ) ( not ( = ?auto_798470 ?auto_798483 ) ) ( not ( = ?auto_798470 ?auto_798484 ) ) ( not ( = ?auto_798470 ?auto_798485 ) ) ( not ( = ?auto_798470 ?auto_798486 ) ) ( not ( = ?auto_798471 ?auto_798472 ) ) ( not ( = ?auto_798471 ?auto_798473 ) ) ( not ( = ?auto_798471 ?auto_798474 ) ) ( not ( = ?auto_798471 ?auto_798475 ) ) ( not ( = ?auto_798471 ?auto_798476 ) ) ( not ( = ?auto_798471 ?auto_798477 ) ) ( not ( = ?auto_798471 ?auto_798478 ) ) ( not ( = ?auto_798471 ?auto_798479 ) ) ( not ( = ?auto_798471 ?auto_798480 ) ) ( not ( = ?auto_798471 ?auto_798481 ) ) ( not ( = ?auto_798471 ?auto_798482 ) ) ( not ( = ?auto_798471 ?auto_798483 ) ) ( not ( = ?auto_798471 ?auto_798484 ) ) ( not ( = ?auto_798471 ?auto_798485 ) ) ( not ( = ?auto_798471 ?auto_798486 ) ) ( not ( = ?auto_798472 ?auto_798473 ) ) ( not ( = ?auto_798472 ?auto_798474 ) ) ( not ( = ?auto_798472 ?auto_798475 ) ) ( not ( = ?auto_798472 ?auto_798476 ) ) ( not ( = ?auto_798472 ?auto_798477 ) ) ( not ( = ?auto_798472 ?auto_798478 ) ) ( not ( = ?auto_798472 ?auto_798479 ) ) ( not ( = ?auto_798472 ?auto_798480 ) ) ( not ( = ?auto_798472 ?auto_798481 ) ) ( not ( = ?auto_798472 ?auto_798482 ) ) ( not ( = ?auto_798472 ?auto_798483 ) ) ( not ( = ?auto_798472 ?auto_798484 ) ) ( not ( = ?auto_798472 ?auto_798485 ) ) ( not ( = ?auto_798472 ?auto_798486 ) ) ( not ( = ?auto_798473 ?auto_798474 ) ) ( not ( = ?auto_798473 ?auto_798475 ) ) ( not ( = ?auto_798473 ?auto_798476 ) ) ( not ( = ?auto_798473 ?auto_798477 ) ) ( not ( = ?auto_798473 ?auto_798478 ) ) ( not ( = ?auto_798473 ?auto_798479 ) ) ( not ( = ?auto_798473 ?auto_798480 ) ) ( not ( = ?auto_798473 ?auto_798481 ) ) ( not ( = ?auto_798473 ?auto_798482 ) ) ( not ( = ?auto_798473 ?auto_798483 ) ) ( not ( = ?auto_798473 ?auto_798484 ) ) ( not ( = ?auto_798473 ?auto_798485 ) ) ( not ( = ?auto_798473 ?auto_798486 ) ) ( not ( = ?auto_798474 ?auto_798475 ) ) ( not ( = ?auto_798474 ?auto_798476 ) ) ( not ( = ?auto_798474 ?auto_798477 ) ) ( not ( = ?auto_798474 ?auto_798478 ) ) ( not ( = ?auto_798474 ?auto_798479 ) ) ( not ( = ?auto_798474 ?auto_798480 ) ) ( not ( = ?auto_798474 ?auto_798481 ) ) ( not ( = ?auto_798474 ?auto_798482 ) ) ( not ( = ?auto_798474 ?auto_798483 ) ) ( not ( = ?auto_798474 ?auto_798484 ) ) ( not ( = ?auto_798474 ?auto_798485 ) ) ( not ( = ?auto_798474 ?auto_798486 ) ) ( not ( = ?auto_798475 ?auto_798476 ) ) ( not ( = ?auto_798475 ?auto_798477 ) ) ( not ( = ?auto_798475 ?auto_798478 ) ) ( not ( = ?auto_798475 ?auto_798479 ) ) ( not ( = ?auto_798475 ?auto_798480 ) ) ( not ( = ?auto_798475 ?auto_798481 ) ) ( not ( = ?auto_798475 ?auto_798482 ) ) ( not ( = ?auto_798475 ?auto_798483 ) ) ( not ( = ?auto_798475 ?auto_798484 ) ) ( not ( = ?auto_798475 ?auto_798485 ) ) ( not ( = ?auto_798475 ?auto_798486 ) ) ( not ( = ?auto_798476 ?auto_798477 ) ) ( not ( = ?auto_798476 ?auto_798478 ) ) ( not ( = ?auto_798476 ?auto_798479 ) ) ( not ( = ?auto_798476 ?auto_798480 ) ) ( not ( = ?auto_798476 ?auto_798481 ) ) ( not ( = ?auto_798476 ?auto_798482 ) ) ( not ( = ?auto_798476 ?auto_798483 ) ) ( not ( = ?auto_798476 ?auto_798484 ) ) ( not ( = ?auto_798476 ?auto_798485 ) ) ( not ( = ?auto_798476 ?auto_798486 ) ) ( not ( = ?auto_798477 ?auto_798478 ) ) ( not ( = ?auto_798477 ?auto_798479 ) ) ( not ( = ?auto_798477 ?auto_798480 ) ) ( not ( = ?auto_798477 ?auto_798481 ) ) ( not ( = ?auto_798477 ?auto_798482 ) ) ( not ( = ?auto_798477 ?auto_798483 ) ) ( not ( = ?auto_798477 ?auto_798484 ) ) ( not ( = ?auto_798477 ?auto_798485 ) ) ( not ( = ?auto_798477 ?auto_798486 ) ) ( not ( = ?auto_798478 ?auto_798479 ) ) ( not ( = ?auto_798478 ?auto_798480 ) ) ( not ( = ?auto_798478 ?auto_798481 ) ) ( not ( = ?auto_798478 ?auto_798482 ) ) ( not ( = ?auto_798478 ?auto_798483 ) ) ( not ( = ?auto_798478 ?auto_798484 ) ) ( not ( = ?auto_798478 ?auto_798485 ) ) ( not ( = ?auto_798478 ?auto_798486 ) ) ( not ( = ?auto_798479 ?auto_798480 ) ) ( not ( = ?auto_798479 ?auto_798481 ) ) ( not ( = ?auto_798479 ?auto_798482 ) ) ( not ( = ?auto_798479 ?auto_798483 ) ) ( not ( = ?auto_798479 ?auto_798484 ) ) ( not ( = ?auto_798479 ?auto_798485 ) ) ( not ( = ?auto_798479 ?auto_798486 ) ) ( not ( = ?auto_798480 ?auto_798481 ) ) ( not ( = ?auto_798480 ?auto_798482 ) ) ( not ( = ?auto_798480 ?auto_798483 ) ) ( not ( = ?auto_798480 ?auto_798484 ) ) ( not ( = ?auto_798480 ?auto_798485 ) ) ( not ( = ?auto_798480 ?auto_798486 ) ) ( not ( = ?auto_798481 ?auto_798482 ) ) ( not ( = ?auto_798481 ?auto_798483 ) ) ( not ( = ?auto_798481 ?auto_798484 ) ) ( not ( = ?auto_798481 ?auto_798485 ) ) ( not ( = ?auto_798481 ?auto_798486 ) ) ( not ( = ?auto_798482 ?auto_798483 ) ) ( not ( = ?auto_798482 ?auto_798484 ) ) ( not ( = ?auto_798482 ?auto_798485 ) ) ( not ( = ?auto_798482 ?auto_798486 ) ) ( not ( = ?auto_798483 ?auto_798484 ) ) ( not ( = ?auto_798483 ?auto_798485 ) ) ( not ( = ?auto_798483 ?auto_798486 ) ) ( not ( = ?auto_798484 ?auto_798485 ) ) ( not ( = ?auto_798484 ?auto_798486 ) ) ( not ( = ?auto_798485 ?auto_798486 ) ) ( ON ?auto_798484 ?auto_798485 ) ( ON ?auto_798483 ?auto_798484 ) ( ON ?auto_798482 ?auto_798483 ) ( ON ?auto_798481 ?auto_798482 ) ( ON ?auto_798480 ?auto_798481 ) ( ON ?auto_798479 ?auto_798480 ) ( ON ?auto_798478 ?auto_798479 ) ( ON ?auto_798477 ?auto_798478 ) ( ON ?auto_798476 ?auto_798477 ) ( ON ?auto_798475 ?auto_798476 ) ( ON ?auto_798474 ?auto_798475 ) ( CLEAR ?auto_798472 ) ( ON ?auto_798473 ?auto_798474 ) ( CLEAR ?auto_798473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_798470 ?auto_798471 ?auto_798472 ?auto_798473 )
      ( MAKE-16PILE ?auto_798470 ?auto_798471 ?auto_798472 ?auto_798473 ?auto_798474 ?auto_798475 ?auto_798476 ?auto_798477 ?auto_798478 ?auto_798479 ?auto_798480 ?auto_798481 ?auto_798482 ?auto_798483 ?auto_798484 ?auto_798485 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_798536 - BLOCK
      ?auto_798537 - BLOCK
      ?auto_798538 - BLOCK
      ?auto_798539 - BLOCK
      ?auto_798540 - BLOCK
      ?auto_798541 - BLOCK
      ?auto_798542 - BLOCK
      ?auto_798543 - BLOCK
      ?auto_798544 - BLOCK
      ?auto_798545 - BLOCK
      ?auto_798546 - BLOCK
      ?auto_798547 - BLOCK
      ?auto_798548 - BLOCK
      ?auto_798549 - BLOCK
      ?auto_798550 - BLOCK
      ?auto_798551 - BLOCK
    )
    :vars
    (
      ?auto_798552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_798551 ?auto_798552 ) ( ON-TABLE ?auto_798536 ) ( ON ?auto_798537 ?auto_798536 ) ( not ( = ?auto_798536 ?auto_798537 ) ) ( not ( = ?auto_798536 ?auto_798538 ) ) ( not ( = ?auto_798536 ?auto_798539 ) ) ( not ( = ?auto_798536 ?auto_798540 ) ) ( not ( = ?auto_798536 ?auto_798541 ) ) ( not ( = ?auto_798536 ?auto_798542 ) ) ( not ( = ?auto_798536 ?auto_798543 ) ) ( not ( = ?auto_798536 ?auto_798544 ) ) ( not ( = ?auto_798536 ?auto_798545 ) ) ( not ( = ?auto_798536 ?auto_798546 ) ) ( not ( = ?auto_798536 ?auto_798547 ) ) ( not ( = ?auto_798536 ?auto_798548 ) ) ( not ( = ?auto_798536 ?auto_798549 ) ) ( not ( = ?auto_798536 ?auto_798550 ) ) ( not ( = ?auto_798536 ?auto_798551 ) ) ( not ( = ?auto_798536 ?auto_798552 ) ) ( not ( = ?auto_798537 ?auto_798538 ) ) ( not ( = ?auto_798537 ?auto_798539 ) ) ( not ( = ?auto_798537 ?auto_798540 ) ) ( not ( = ?auto_798537 ?auto_798541 ) ) ( not ( = ?auto_798537 ?auto_798542 ) ) ( not ( = ?auto_798537 ?auto_798543 ) ) ( not ( = ?auto_798537 ?auto_798544 ) ) ( not ( = ?auto_798537 ?auto_798545 ) ) ( not ( = ?auto_798537 ?auto_798546 ) ) ( not ( = ?auto_798537 ?auto_798547 ) ) ( not ( = ?auto_798537 ?auto_798548 ) ) ( not ( = ?auto_798537 ?auto_798549 ) ) ( not ( = ?auto_798537 ?auto_798550 ) ) ( not ( = ?auto_798537 ?auto_798551 ) ) ( not ( = ?auto_798537 ?auto_798552 ) ) ( not ( = ?auto_798538 ?auto_798539 ) ) ( not ( = ?auto_798538 ?auto_798540 ) ) ( not ( = ?auto_798538 ?auto_798541 ) ) ( not ( = ?auto_798538 ?auto_798542 ) ) ( not ( = ?auto_798538 ?auto_798543 ) ) ( not ( = ?auto_798538 ?auto_798544 ) ) ( not ( = ?auto_798538 ?auto_798545 ) ) ( not ( = ?auto_798538 ?auto_798546 ) ) ( not ( = ?auto_798538 ?auto_798547 ) ) ( not ( = ?auto_798538 ?auto_798548 ) ) ( not ( = ?auto_798538 ?auto_798549 ) ) ( not ( = ?auto_798538 ?auto_798550 ) ) ( not ( = ?auto_798538 ?auto_798551 ) ) ( not ( = ?auto_798538 ?auto_798552 ) ) ( not ( = ?auto_798539 ?auto_798540 ) ) ( not ( = ?auto_798539 ?auto_798541 ) ) ( not ( = ?auto_798539 ?auto_798542 ) ) ( not ( = ?auto_798539 ?auto_798543 ) ) ( not ( = ?auto_798539 ?auto_798544 ) ) ( not ( = ?auto_798539 ?auto_798545 ) ) ( not ( = ?auto_798539 ?auto_798546 ) ) ( not ( = ?auto_798539 ?auto_798547 ) ) ( not ( = ?auto_798539 ?auto_798548 ) ) ( not ( = ?auto_798539 ?auto_798549 ) ) ( not ( = ?auto_798539 ?auto_798550 ) ) ( not ( = ?auto_798539 ?auto_798551 ) ) ( not ( = ?auto_798539 ?auto_798552 ) ) ( not ( = ?auto_798540 ?auto_798541 ) ) ( not ( = ?auto_798540 ?auto_798542 ) ) ( not ( = ?auto_798540 ?auto_798543 ) ) ( not ( = ?auto_798540 ?auto_798544 ) ) ( not ( = ?auto_798540 ?auto_798545 ) ) ( not ( = ?auto_798540 ?auto_798546 ) ) ( not ( = ?auto_798540 ?auto_798547 ) ) ( not ( = ?auto_798540 ?auto_798548 ) ) ( not ( = ?auto_798540 ?auto_798549 ) ) ( not ( = ?auto_798540 ?auto_798550 ) ) ( not ( = ?auto_798540 ?auto_798551 ) ) ( not ( = ?auto_798540 ?auto_798552 ) ) ( not ( = ?auto_798541 ?auto_798542 ) ) ( not ( = ?auto_798541 ?auto_798543 ) ) ( not ( = ?auto_798541 ?auto_798544 ) ) ( not ( = ?auto_798541 ?auto_798545 ) ) ( not ( = ?auto_798541 ?auto_798546 ) ) ( not ( = ?auto_798541 ?auto_798547 ) ) ( not ( = ?auto_798541 ?auto_798548 ) ) ( not ( = ?auto_798541 ?auto_798549 ) ) ( not ( = ?auto_798541 ?auto_798550 ) ) ( not ( = ?auto_798541 ?auto_798551 ) ) ( not ( = ?auto_798541 ?auto_798552 ) ) ( not ( = ?auto_798542 ?auto_798543 ) ) ( not ( = ?auto_798542 ?auto_798544 ) ) ( not ( = ?auto_798542 ?auto_798545 ) ) ( not ( = ?auto_798542 ?auto_798546 ) ) ( not ( = ?auto_798542 ?auto_798547 ) ) ( not ( = ?auto_798542 ?auto_798548 ) ) ( not ( = ?auto_798542 ?auto_798549 ) ) ( not ( = ?auto_798542 ?auto_798550 ) ) ( not ( = ?auto_798542 ?auto_798551 ) ) ( not ( = ?auto_798542 ?auto_798552 ) ) ( not ( = ?auto_798543 ?auto_798544 ) ) ( not ( = ?auto_798543 ?auto_798545 ) ) ( not ( = ?auto_798543 ?auto_798546 ) ) ( not ( = ?auto_798543 ?auto_798547 ) ) ( not ( = ?auto_798543 ?auto_798548 ) ) ( not ( = ?auto_798543 ?auto_798549 ) ) ( not ( = ?auto_798543 ?auto_798550 ) ) ( not ( = ?auto_798543 ?auto_798551 ) ) ( not ( = ?auto_798543 ?auto_798552 ) ) ( not ( = ?auto_798544 ?auto_798545 ) ) ( not ( = ?auto_798544 ?auto_798546 ) ) ( not ( = ?auto_798544 ?auto_798547 ) ) ( not ( = ?auto_798544 ?auto_798548 ) ) ( not ( = ?auto_798544 ?auto_798549 ) ) ( not ( = ?auto_798544 ?auto_798550 ) ) ( not ( = ?auto_798544 ?auto_798551 ) ) ( not ( = ?auto_798544 ?auto_798552 ) ) ( not ( = ?auto_798545 ?auto_798546 ) ) ( not ( = ?auto_798545 ?auto_798547 ) ) ( not ( = ?auto_798545 ?auto_798548 ) ) ( not ( = ?auto_798545 ?auto_798549 ) ) ( not ( = ?auto_798545 ?auto_798550 ) ) ( not ( = ?auto_798545 ?auto_798551 ) ) ( not ( = ?auto_798545 ?auto_798552 ) ) ( not ( = ?auto_798546 ?auto_798547 ) ) ( not ( = ?auto_798546 ?auto_798548 ) ) ( not ( = ?auto_798546 ?auto_798549 ) ) ( not ( = ?auto_798546 ?auto_798550 ) ) ( not ( = ?auto_798546 ?auto_798551 ) ) ( not ( = ?auto_798546 ?auto_798552 ) ) ( not ( = ?auto_798547 ?auto_798548 ) ) ( not ( = ?auto_798547 ?auto_798549 ) ) ( not ( = ?auto_798547 ?auto_798550 ) ) ( not ( = ?auto_798547 ?auto_798551 ) ) ( not ( = ?auto_798547 ?auto_798552 ) ) ( not ( = ?auto_798548 ?auto_798549 ) ) ( not ( = ?auto_798548 ?auto_798550 ) ) ( not ( = ?auto_798548 ?auto_798551 ) ) ( not ( = ?auto_798548 ?auto_798552 ) ) ( not ( = ?auto_798549 ?auto_798550 ) ) ( not ( = ?auto_798549 ?auto_798551 ) ) ( not ( = ?auto_798549 ?auto_798552 ) ) ( not ( = ?auto_798550 ?auto_798551 ) ) ( not ( = ?auto_798550 ?auto_798552 ) ) ( not ( = ?auto_798551 ?auto_798552 ) ) ( ON ?auto_798550 ?auto_798551 ) ( ON ?auto_798549 ?auto_798550 ) ( ON ?auto_798548 ?auto_798549 ) ( ON ?auto_798547 ?auto_798548 ) ( ON ?auto_798546 ?auto_798547 ) ( ON ?auto_798545 ?auto_798546 ) ( ON ?auto_798544 ?auto_798545 ) ( ON ?auto_798543 ?auto_798544 ) ( ON ?auto_798542 ?auto_798543 ) ( ON ?auto_798541 ?auto_798542 ) ( ON ?auto_798540 ?auto_798541 ) ( ON ?auto_798539 ?auto_798540 ) ( CLEAR ?auto_798537 ) ( ON ?auto_798538 ?auto_798539 ) ( CLEAR ?auto_798538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_798536 ?auto_798537 ?auto_798538 )
      ( MAKE-16PILE ?auto_798536 ?auto_798537 ?auto_798538 ?auto_798539 ?auto_798540 ?auto_798541 ?auto_798542 ?auto_798543 ?auto_798544 ?auto_798545 ?auto_798546 ?auto_798547 ?auto_798548 ?auto_798549 ?auto_798550 ?auto_798551 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_798602 - BLOCK
      ?auto_798603 - BLOCK
      ?auto_798604 - BLOCK
      ?auto_798605 - BLOCK
      ?auto_798606 - BLOCK
      ?auto_798607 - BLOCK
      ?auto_798608 - BLOCK
      ?auto_798609 - BLOCK
      ?auto_798610 - BLOCK
      ?auto_798611 - BLOCK
      ?auto_798612 - BLOCK
      ?auto_798613 - BLOCK
      ?auto_798614 - BLOCK
      ?auto_798615 - BLOCK
      ?auto_798616 - BLOCK
      ?auto_798617 - BLOCK
    )
    :vars
    (
      ?auto_798618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_798617 ?auto_798618 ) ( ON-TABLE ?auto_798602 ) ( not ( = ?auto_798602 ?auto_798603 ) ) ( not ( = ?auto_798602 ?auto_798604 ) ) ( not ( = ?auto_798602 ?auto_798605 ) ) ( not ( = ?auto_798602 ?auto_798606 ) ) ( not ( = ?auto_798602 ?auto_798607 ) ) ( not ( = ?auto_798602 ?auto_798608 ) ) ( not ( = ?auto_798602 ?auto_798609 ) ) ( not ( = ?auto_798602 ?auto_798610 ) ) ( not ( = ?auto_798602 ?auto_798611 ) ) ( not ( = ?auto_798602 ?auto_798612 ) ) ( not ( = ?auto_798602 ?auto_798613 ) ) ( not ( = ?auto_798602 ?auto_798614 ) ) ( not ( = ?auto_798602 ?auto_798615 ) ) ( not ( = ?auto_798602 ?auto_798616 ) ) ( not ( = ?auto_798602 ?auto_798617 ) ) ( not ( = ?auto_798602 ?auto_798618 ) ) ( not ( = ?auto_798603 ?auto_798604 ) ) ( not ( = ?auto_798603 ?auto_798605 ) ) ( not ( = ?auto_798603 ?auto_798606 ) ) ( not ( = ?auto_798603 ?auto_798607 ) ) ( not ( = ?auto_798603 ?auto_798608 ) ) ( not ( = ?auto_798603 ?auto_798609 ) ) ( not ( = ?auto_798603 ?auto_798610 ) ) ( not ( = ?auto_798603 ?auto_798611 ) ) ( not ( = ?auto_798603 ?auto_798612 ) ) ( not ( = ?auto_798603 ?auto_798613 ) ) ( not ( = ?auto_798603 ?auto_798614 ) ) ( not ( = ?auto_798603 ?auto_798615 ) ) ( not ( = ?auto_798603 ?auto_798616 ) ) ( not ( = ?auto_798603 ?auto_798617 ) ) ( not ( = ?auto_798603 ?auto_798618 ) ) ( not ( = ?auto_798604 ?auto_798605 ) ) ( not ( = ?auto_798604 ?auto_798606 ) ) ( not ( = ?auto_798604 ?auto_798607 ) ) ( not ( = ?auto_798604 ?auto_798608 ) ) ( not ( = ?auto_798604 ?auto_798609 ) ) ( not ( = ?auto_798604 ?auto_798610 ) ) ( not ( = ?auto_798604 ?auto_798611 ) ) ( not ( = ?auto_798604 ?auto_798612 ) ) ( not ( = ?auto_798604 ?auto_798613 ) ) ( not ( = ?auto_798604 ?auto_798614 ) ) ( not ( = ?auto_798604 ?auto_798615 ) ) ( not ( = ?auto_798604 ?auto_798616 ) ) ( not ( = ?auto_798604 ?auto_798617 ) ) ( not ( = ?auto_798604 ?auto_798618 ) ) ( not ( = ?auto_798605 ?auto_798606 ) ) ( not ( = ?auto_798605 ?auto_798607 ) ) ( not ( = ?auto_798605 ?auto_798608 ) ) ( not ( = ?auto_798605 ?auto_798609 ) ) ( not ( = ?auto_798605 ?auto_798610 ) ) ( not ( = ?auto_798605 ?auto_798611 ) ) ( not ( = ?auto_798605 ?auto_798612 ) ) ( not ( = ?auto_798605 ?auto_798613 ) ) ( not ( = ?auto_798605 ?auto_798614 ) ) ( not ( = ?auto_798605 ?auto_798615 ) ) ( not ( = ?auto_798605 ?auto_798616 ) ) ( not ( = ?auto_798605 ?auto_798617 ) ) ( not ( = ?auto_798605 ?auto_798618 ) ) ( not ( = ?auto_798606 ?auto_798607 ) ) ( not ( = ?auto_798606 ?auto_798608 ) ) ( not ( = ?auto_798606 ?auto_798609 ) ) ( not ( = ?auto_798606 ?auto_798610 ) ) ( not ( = ?auto_798606 ?auto_798611 ) ) ( not ( = ?auto_798606 ?auto_798612 ) ) ( not ( = ?auto_798606 ?auto_798613 ) ) ( not ( = ?auto_798606 ?auto_798614 ) ) ( not ( = ?auto_798606 ?auto_798615 ) ) ( not ( = ?auto_798606 ?auto_798616 ) ) ( not ( = ?auto_798606 ?auto_798617 ) ) ( not ( = ?auto_798606 ?auto_798618 ) ) ( not ( = ?auto_798607 ?auto_798608 ) ) ( not ( = ?auto_798607 ?auto_798609 ) ) ( not ( = ?auto_798607 ?auto_798610 ) ) ( not ( = ?auto_798607 ?auto_798611 ) ) ( not ( = ?auto_798607 ?auto_798612 ) ) ( not ( = ?auto_798607 ?auto_798613 ) ) ( not ( = ?auto_798607 ?auto_798614 ) ) ( not ( = ?auto_798607 ?auto_798615 ) ) ( not ( = ?auto_798607 ?auto_798616 ) ) ( not ( = ?auto_798607 ?auto_798617 ) ) ( not ( = ?auto_798607 ?auto_798618 ) ) ( not ( = ?auto_798608 ?auto_798609 ) ) ( not ( = ?auto_798608 ?auto_798610 ) ) ( not ( = ?auto_798608 ?auto_798611 ) ) ( not ( = ?auto_798608 ?auto_798612 ) ) ( not ( = ?auto_798608 ?auto_798613 ) ) ( not ( = ?auto_798608 ?auto_798614 ) ) ( not ( = ?auto_798608 ?auto_798615 ) ) ( not ( = ?auto_798608 ?auto_798616 ) ) ( not ( = ?auto_798608 ?auto_798617 ) ) ( not ( = ?auto_798608 ?auto_798618 ) ) ( not ( = ?auto_798609 ?auto_798610 ) ) ( not ( = ?auto_798609 ?auto_798611 ) ) ( not ( = ?auto_798609 ?auto_798612 ) ) ( not ( = ?auto_798609 ?auto_798613 ) ) ( not ( = ?auto_798609 ?auto_798614 ) ) ( not ( = ?auto_798609 ?auto_798615 ) ) ( not ( = ?auto_798609 ?auto_798616 ) ) ( not ( = ?auto_798609 ?auto_798617 ) ) ( not ( = ?auto_798609 ?auto_798618 ) ) ( not ( = ?auto_798610 ?auto_798611 ) ) ( not ( = ?auto_798610 ?auto_798612 ) ) ( not ( = ?auto_798610 ?auto_798613 ) ) ( not ( = ?auto_798610 ?auto_798614 ) ) ( not ( = ?auto_798610 ?auto_798615 ) ) ( not ( = ?auto_798610 ?auto_798616 ) ) ( not ( = ?auto_798610 ?auto_798617 ) ) ( not ( = ?auto_798610 ?auto_798618 ) ) ( not ( = ?auto_798611 ?auto_798612 ) ) ( not ( = ?auto_798611 ?auto_798613 ) ) ( not ( = ?auto_798611 ?auto_798614 ) ) ( not ( = ?auto_798611 ?auto_798615 ) ) ( not ( = ?auto_798611 ?auto_798616 ) ) ( not ( = ?auto_798611 ?auto_798617 ) ) ( not ( = ?auto_798611 ?auto_798618 ) ) ( not ( = ?auto_798612 ?auto_798613 ) ) ( not ( = ?auto_798612 ?auto_798614 ) ) ( not ( = ?auto_798612 ?auto_798615 ) ) ( not ( = ?auto_798612 ?auto_798616 ) ) ( not ( = ?auto_798612 ?auto_798617 ) ) ( not ( = ?auto_798612 ?auto_798618 ) ) ( not ( = ?auto_798613 ?auto_798614 ) ) ( not ( = ?auto_798613 ?auto_798615 ) ) ( not ( = ?auto_798613 ?auto_798616 ) ) ( not ( = ?auto_798613 ?auto_798617 ) ) ( not ( = ?auto_798613 ?auto_798618 ) ) ( not ( = ?auto_798614 ?auto_798615 ) ) ( not ( = ?auto_798614 ?auto_798616 ) ) ( not ( = ?auto_798614 ?auto_798617 ) ) ( not ( = ?auto_798614 ?auto_798618 ) ) ( not ( = ?auto_798615 ?auto_798616 ) ) ( not ( = ?auto_798615 ?auto_798617 ) ) ( not ( = ?auto_798615 ?auto_798618 ) ) ( not ( = ?auto_798616 ?auto_798617 ) ) ( not ( = ?auto_798616 ?auto_798618 ) ) ( not ( = ?auto_798617 ?auto_798618 ) ) ( ON ?auto_798616 ?auto_798617 ) ( ON ?auto_798615 ?auto_798616 ) ( ON ?auto_798614 ?auto_798615 ) ( ON ?auto_798613 ?auto_798614 ) ( ON ?auto_798612 ?auto_798613 ) ( ON ?auto_798611 ?auto_798612 ) ( ON ?auto_798610 ?auto_798611 ) ( ON ?auto_798609 ?auto_798610 ) ( ON ?auto_798608 ?auto_798609 ) ( ON ?auto_798607 ?auto_798608 ) ( ON ?auto_798606 ?auto_798607 ) ( ON ?auto_798605 ?auto_798606 ) ( ON ?auto_798604 ?auto_798605 ) ( CLEAR ?auto_798602 ) ( ON ?auto_798603 ?auto_798604 ) ( CLEAR ?auto_798603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_798602 ?auto_798603 )
      ( MAKE-16PILE ?auto_798602 ?auto_798603 ?auto_798604 ?auto_798605 ?auto_798606 ?auto_798607 ?auto_798608 ?auto_798609 ?auto_798610 ?auto_798611 ?auto_798612 ?auto_798613 ?auto_798614 ?auto_798615 ?auto_798616 ?auto_798617 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_798668 - BLOCK
      ?auto_798669 - BLOCK
      ?auto_798670 - BLOCK
      ?auto_798671 - BLOCK
      ?auto_798672 - BLOCK
      ?auto_798673 - BLOCK
      ?auto_798674 - BLOCK
      ?auto_798675 - BLOCK
      ?auto_798676 - BLOCK
      ?auto_798677 - BLOCK
      ?auto_798678 - BLOCK
      ?auto_798679 - BLOCK
      ?auto_798680 - BLOCK
      ?auto_798681 - BLOCK
      ?auto_798682 - BLOCK
      ?auto_798683 - BLOCK
    )
    :vars
    (
      ?auto_798684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_798683 ?auto_798684 ) ( not ( = ?auto_798668 ?auto_798669 ) ) ( not ( = ?auto_798668 ?auto_798670 ) ) ( not ( = ?auto_798668 ?auto_798671 ) ) ( not ( = ?auto_798668 ?auto_798672 ) ) ( not ( = ?auto_798668 ?auto_798673 ) ) ( not ( = ?auto_798668 ?auto_798674 ) ) ( not ( = ?auto_798668 ?auto_798675 ) ) ( not ( = ?auto_798668 ?auto_798676 ) ) ( not ( = ?auto_798668 ?auto_798677 ) ) ( not ( = ?auto_798668 ?auto_798678 ) ) ( not ( = ?auto_798668 ?auto_798679 ) ) ( not ( = ?auto_798668 ?auto_798680 ) ) ( not ( = ?auto_798668 ?auto_798681 ) ) ( not ( = ?auto_798668 ?auto_798682 ) ) ( not ( = ?auto_798668 ?auto_798683 ) ) ( not ( = ?auto_798668 ?auto_798684 ) ) ( not ( = ?auto_798669 ?auto_798670 ) ) ( not ( = ?auto_798669 ?auto_798671 ) ) ( not ( = ?auto_798669 ?auto_798672 ) ) ( not ( = ?auto_798669 ?auto_798673 ) ) ( not ( = ?auto_798669 ?auto_798674 ) ) ( not ( = ?auto_798669 ?auto_798675 ) ) ( not ( = ?auto_798669 ?auto_798676 ) ) ( not ( = ?auto_798669 ?auto_798677 ) ) ( not ( = ?auto_798669 ?auto_798678 ) ) ( not ( = ?auto_798669 ?auto_798679 ) ) ( not ( = ?auto_798669 ?auto_798680 ) ) ( not ( = ?auto_798669 ?auto_798681 ) ) ( not ( = ?auto_798669 ?auto_798682 ) ) ( not ( = ?auto_798669 ?auto_798683 ) ) ( not ( = ?auto_798669 ?auto_798684 ) ) ( not ( = ?auto_798670 ?auto_798671 ) ) ( not ( = ?auto_798670 ?auto_798672 ) ) ( not ( = ?auto_798670 ?auto_798673 ) ) ( not ( = ?auto_798670 ?auto_798674 ) ) ( not ( = ?auto_798670 ?auto_798675 ) ) ( not ( = ?auto_798670 ?auto_798676 ) ) ( not ( = ?auto_798670 ?auto_798677 ) ) ( not ( = ?auto_798670 ?auto_798678 ) ) ( not ( = ?auto_798670 ?auto_798679 ) ) ( not ( = ?auto_798670 ?auto_798680 ) ) ( not ( = ?auto_798670 ?auto_798681 ) ) ( not ( = ?auto_798670 ?auto_798682 ) ) ( not ( = ?auto_798670 ?auto_798683 ) ) ( not ( = ?auto_798670 ?auto_798684 ) ) ( not ( = ?auto_798671 ?auto_798672 ) ) ( not ( = ?auto_798671 ?auto_798673 ) ) ( not ( = ?auto_798671 ?auto_798674 ) ) ( not ( = ?auto_798671 ?auto_798675 ) ) ( not ( = ?auto_798671 ?auto_798676 ) ) ( not ( = ?auto_798671 ?auto_798677 ) ) ( not ( = ?auto_798671 ?auto_798678 ) ) ( not ( = ?auto_798671 ?auto_798679 ) ) ( not ( = ?auto_798671 ?auto_798680 ) ) ( not ( = ?auto_798671 ?auto_798681 ) ) ( not ( = ?auto_798671 ?auto_798682 ) ) ( not ( = ?auto_798671 ?auto_798683 ) ) ( not ( = ?auto_798671 ?auto_798684 ) ) ( not ( = ?auto_798672 ?auto_798673 ) ) ( not ( = ?auto_798672 ?auto_798674 ) ) ( not ( = ?auto_798672 ?auto_798675 ) ) ( not ( = ?auto_798672 ?auto_798676 ) ) ( not ( = ?auto_798672 ?auto_798677 ) ) ( not ( = ?auto_798672 ?auto_798678 ) ) ( not ( = ?auto_798672 ?auto_798679 ) ) ( not ( = ?auto_798672 ?auto_798680 ) ) ( not ( = ?auto_798672 ?auto_798681 ) ) ( not ( = ?auto_798672 ?auto_798682 ) ) ( not ( = ?auto_798672 ?auto_798683 ) ) ( not ( = ?auto_798672 ?auto_798684 ) ) ( not ( = ?auto_798673 ?auto_798674 ) ) ( not ( = ?auto_798673 ?auto_798675 ) ) ( not ( = ?auto_798673 ?auto_798676 ) ) ( not ( = ?auto_798673 ?auto_798677 ) ) ( not ( = ?auto_798673 ?auto_798678 ) ) ( not ( = ?auto_798673 ?auto_798679 ) ) ( not ( = ?auto_798673 ?auto_798680 ) ) ( not ( = ?auto_798673 ?auto_798681 ) ) ( not ( = ?auto_798673 ?auto_798682 ) ) ( not ( = ?auto_798673 ?auto_798683 ) ) ( not ( = ?auto_798673 ?auto_798684 ) ) ( not ( = ?auto_798674 ?auto_798675 ) ) ( not ( = ?auto_798674 ?auto_798676 ) ) ( not ( = ?auto_798674 ?auto_798677 ) ) ( not ( = ?auto_798674 ?auto_798678 ) ) ( not ( = ?auto_798674 ?auto_798679 ) ) ( not ( = ?auto_798674 ?auto_798680 ) ) ( not ( = ?auto_798674 ?auto_798681 ) ) ( not ( = ?auto_798674 ?auto_798682 ) ) ( not ( = ?auto_798674 ?auto_798683 ) ) ( not ( = ?auto_798674 ?auto_798684 ) ) ( not ( = ?auto_798675 ?auto_798676 ) ) ( not ( = ?auto_798675 ?auto_798677 ) ) ( not ( = ?auto_798675 ?auto_798678 ) ) ( not ( = ?auto_798675 ?auto_798679 ) ) ( not ( = ?auto_798675 ?auto_798680 ) ) ( not ( = ?auto_798675 ?auto_798681 ) ) ( not ( = ?auto_798675 ?auto_798682 ) ) ( not ( = ?auto_798675 ?auto_798683 ) ) ( not ( = ?auto_798675 ?auto_798684 ) ) ( not ( = ?auto_798676 ?auto_798677 ) ) ( not ( = ?auto_798676 ?auto_798678 ) ) ( not ( = ?auto_798676 ?auto_798679 ) ) ( not ( = ?auto_798676 ?auto_798680 ) ) ( not ( = ?auto_798676 ?auto_798681 ) ) ( not ( = ?auto_798676 ?auto_798682 ) ) ( not ( = ?auto_798676 ?auto_798683 ) ) ( not ( = ?auto_798676 ?auto_798684 ) ) ( not ( = ?auto_798677 ?auto_798678 ) ) ( not ( = ?auto_798677 ?auto_798679 ) ) ( not ( = ?auto_798677 ?auto_798680 ) ) ( not ( = ?auto_798677 ?auto_798681 ) ) ( not ( = ?auto_798677 ?auto_798682 ) ) ( not ( = ?auto_798677 ?auto_798683 ) ) ( not ( = ?auto_798677 ?auto_798684 ) ) ( not ( = ?auto_798678 ?auto_798679 ) ) ( not ( = ?auto_798678 ?auto_798680 ) ) ( not ( = ?auto_798678 ?auto_798681 ) ) ( not ( = ?auto_798678 ?auto_798682 ) ) ( not ( = ?auto_798678 ?auto_798683 ) ) ( not ( = ?auto_798678 ?auto_798684 ) ) ( not ( = ?auto_798679 ?auto_798680 ) ) ( not ( = ?auto_798679 ?auto_798681 ) ) ( not ( = ?auto_798679 ?auto_798682 ) ) ( not ( = ?auto_798679 ?auto_798683 ) ) ( not ( = ?auto_798679 ?auto_798684 ) ) ( not ( = ?auto_798680 ?auto_798681 ) ) ( not ( = ?auto_798680 ?auto_798682 ) ) ( not ( = ?auto_798680 ?auto_798683 ) ) ( not ( = ?auto_798680 ?auto_798684 ) ) ( not ( = ?auto_798681 ?auto_798682 ) ) ( not ( = ?auto_798681 ?auto_798683 ) ) ( not ( = ?auto_798681 ?auto_798684 ) ) ( not ( = ?auto_798682 ?auto_798683 ) ) ( not ( = ?auto_798682 ?auto_798684 ) ) ( not ( = ?auto_798683 ?auto_798684 ) ) ( ON ?auto_798682 ?auto_798683 ) ( ON ?auto_798681 ?auto_798682 ) ( ON ?auto_798680 ?auto_798681 ) ( ON ?auto_798679 ?auto_798680 ) ( ON ?auto_798678 ?auto_798679 ) ( ON ?auto_798677 ?auto_798678 ) ( ON ?auto_798676 ?auto_798677 ) ( ON ?auto_798675 ?auto_798676 ) ( ON ?auto_798674 ?auto_798675 ) ( ON ?auto_798673 ?auto_798674 ) ( ON ?auto_798672 ?auto_798673 ) ( ON ?auto_798671 ?auto_798672 ) ( ON ?auto_798670 ?auto_798671 ) ( ON ?auto_798669 ?auto_798670 ) ( ON ?auto_798668 ?auto_798669 ) ( CLEAR ?auto_798668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_798668 )
      ( MAKE-16PILE ?auto_798668 ?auto_798669 ?auto_798670 ?auto_798671 ?auto_798672 ?auto_798673 ?auto_798674 ?auto_798675 ?auto_798676 ?auto_798677 ?auto_798678 ?auto_798679 ?auto_798680 ?auto_798681 ?auto_798682 ?auto_798683 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_798735 - BLOCK
      ?auto_798736 - BLOCK
      ?auto_798737 - BLOCK
      ?auto_798738 - BLOCK
      ?auto_798739 - BLOCK
      ?auto_798740 - BLOCK
      ?auto_798741 - BLOCK
      ?auto_798742 - BLOCK
      ?auto_798743 - BLOCK
      ?auto_798744 - BLOCK
      ?auto_798745 - BLOCK
      ?auto_798746 - BLOCK
      ?auto_798747 - BLOCK
      ?auto_798748 - BLOCK
      ?auto_798749 - BLOCK
      ?auto_798750 - BLOCK
      ?auto_798751 - BLOCK
    )
    :vars
    (
      ?auto_798752 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_798750 ) ( ON ?auto_798751 ?auto_798752 ) ( CLEAR ?auto_798751 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_798735 ) ( ON ?auto_798736 ?auto_798735 ) ( ON ?auto_798737 ?auto_798736 ) ( ON ?auto_798738 ?auto_798737 ) ( ON ?auto_798739 ?auto_798738 ) ( ON ?auto_798740 ?auto_798739 ) ( ON ?auto_798741 ?auto_798740 ) ( ON ?auto_798742 ?auto_798741 ) ( ON ?auto_798743 ?auto_798742 ) ( ON ?auto_798744 ?auto_798743 ) ( ON ?auto_798745 ?auto_798744 ) ( ON ?auto_798746 ?auto_798745 ) ( ON ?auto_798747 ?auto_798746 ) ( ON ?auto_798748 ?auto_798747 ) ( ON ?auto_798749 ?auto_798748 ) ( ON ?auto_798750 ?auto_798749 ) ( not ( = ?auto_798735 ?auto_798736 ) ) ( not ( = ?auto_798735 ?auto_798737 ) ) ( not ( = ?auto_798735 ?auto_798738 ) ) ( not ( = ?auto_798735 ?auto_798739 ) ) ( not ( = ?auto_798735 ?auto_798740 ) ) ( not ( = ?auto_798735 ?auto_798741 ) ) ( not ( = ?auto_798735 ?auto_798742 ) ) ( not ( = ?auto_798735 ?auto_798743 ) ) ( not ( = ?auto_798735 ?auto_798744 ) ) ( not ( = ?auto_798735 ?auto_798745 ) ) ( not ( = ?auto_798735 ?auto_798746 ) ) ( not ( = ?auto_798735 ?auto_798747 ) ) ( not ( = ?auto_798735 ?auto_798748 ) ) ( not ( = ?auto_798735 ?auto_798749 ) ) ( not ( = ?auto_798735 ?auto_798750 ) ) ( not ( = ?auto_798735 ?auto_798751 ) ) ( not ( = ?auto_798735 ?auto_798752 ) ) ( not ( = ?auto_798736 ?auto_798737 ) ) ( not ( = ?auto_798736 ?auto_798738 ) ) ( not ( = ?auto_798736 ?auto_798739 ) ) ( not ( = ?auto_798736 ?auto_798740 ) ) ( not ( = ?auto_798736 ?auto_798741 ) ) ( not ( = ?auto_798736 ?auto_798742 ) ) ( not ( = ?auto_798736 ?auto_798743 ) ) ( not ( = ?auto_798736 ?auto_798744 ) ) ( not ( = ?auto_798736 ?auto_798745 ) ) ( not ( = ?auto_798736 ?auto_798746 ) ) ( not ( = ?auto_798736 ?auto_798747 ) ) ( not ( = ?auto_798736 ?auto_798748 ) ) ( not ( = ?auto_798736 ?auto_798749 ) ) ( not ( = ?auto_798736 ?auto_798750 ) ) ( not ( = ?auto_798736 ?auto_798751 ) ) ( not ( = ?auto_798736 ?auto_798752 ) ) ( not ( = ?auto_798737 ?auto_798738 ) ) ( not ( = ?auto_798737 ?auto_798739 ) ) ( not ( = ?auto_798737 ?auto_798740 ) ) ( not ( = ?auto_798737 ?auto_798741 ) ) ( not ( = ?auto_798737 ?auto_798742 ) ) ( not ( = ?auto_798737 ?auto_798743 ) ) ( not ( = ?auto_798737 ?auto_798744 ) ) ( not ( = ?auto_798737 ?auto_798745 ) ) ( not ( = ?auto_798737 ?auto_798746 ) ) ( not ( = ?auto_798737 ?auto_798747 ) ) ( not ( = ?auto_798737 ?auto_798748 ) ) ( not ( = ?auto_798737 ?auto_798749 ) ) ( not ( = ?auto_798737 ?auto_798750 ) ) ( not ( = ?auto_798737 ?auto_798751 ) ) ( not ( = ?auto_798737 ?auto_798752 ) ) ( not ( = ?auto_798738 ?auto_798739 ) ) ( not ( = ?auto_798738 ?auto_798740 ) ) ( not ( = ?auto_798738 ?auto_798741 ) ) ( not ( = ?auto_798738 ?auto_798742 ) ) ( not ( = ?auto_798738 ?auto_798743 ) ) ( not ( = ?auto_798738 ?auto_798744 ) ) ( not ( = ?auto_798738 ?auto_798745 ) ) ( not ( = ?auto_798738 ?auto_798746 ) ) ( not ( = ?auto_798738 ?auto_798747 ) ) ( not ( = ?auto_798738 ?auto_798748 ) ) ( not ( = ?auto_798738 ?auto_798749 ) ) ( not ( = ?auto_798738 ?auto_798750 ) ) ( not ( = ?auto_798738 ?auto_798751 ) ) ( not ( = ?auto_798738 ?auto_798752 ) ) ( not ( = ?auto_798739 ?auto_798740 ) ) ( not ( = ?auto_798739 ?auto_798741 ) ) ( not ( = ?auto_798739 ?auto_798742 ) ) ( not ( = ?auto_798739 ?auto_798743 ) ) ( not ( = ?auto_798739 ?auto_798744 ) ) ( not ( = ?auto_798739 ?auto_798745 ) ) ( not ( = ?auto_798739 ?auto_798746 ) ) ( not ( = ?auto_798739 ?auto_798747 ) ) ( not ( = ?auto_798739 ?auto_798748 ) ) ( not ( = ?auto_798739 ?auto_798749 ) ) ( not ( = ?auto_798739 ?auto_798750 ) ) ( not ( = ?auto_798739 ?auto_798751 ) ) ( not ( = ?auto_798739 ?auto_798752 ) ) ( not ( = ?auto_798740 ?auto_798741 ) ) ( not ( = ?auto_798740 ?auto_798742 ) ) ( not ( = ?auto_798740 ?auto_798743 ) ) ( not ( = ?auto_798740 ?auto_798744 ) ) ( not ( = ?auto_798740 ?auto_798745 ) ) ( not ( = ?auto_798740 ?auto_798746 ) ) ( not ( = ?auto_798740 ?auto_798747 ) ) ( not ( = ?auto_798740 ?auto_798748 ) ) ( not ( = ?auto_798740 ?auto_798749 ) ) ( not ( = ?auto_798740 ?auto_798750 ) ) ( not ( = ?auto_798740 ?auto_798751 ) ) ( not ( = ?auto_798740 ?auto_798752 ) ) ( not ( = ?auto_798741 ?auto_798742 ) ) ( not ( = ?auto_798741 ?auto_798743 ) ) ( not ( = ?auto_798741 ?auto_798744 ) ) ( not ( = ?auto_798741 ?auto_798745 ) ) ( not ( = ?auto_798741 ?auto_798746 ) ) ( not ( = ?auto_798741 ?auto_798747 ) ) ( not ( = ?auto_798741 ?auto_798748 ) ) ( not ( = ?auto_798741 ?auto_798749 ) ) ( not ( = ?auto_798741 ?auto_798750 ) ) ( not ( = ?auto_798741 ?auto_798751 ) ) ( not ( = ?auto_798741 ?auto_798752 ) ) ( not ( = ?auto_798742 ?auto_798743 ) ) ( not ( = ?auto_798742 ?auto_798744 ) ) ( not ( = ?auto_798742 ?auto_798745 ) ) ( not ( = ?auto_798742 ?auto_798746 ) ) ( not ( = ?auto_798742 ?auto_798747 ) ) ( not ( = ?auto_798742 ?auto_798748 ) ) ( not ( = ?auto_798742 ?auto_798749 ) ) ( not ( = ?auto_798742 ?auto_798750 ) ) ( not ( = ?auto_798742 ?auto_798751 ) ) ( not ( = ?auto_798742 ?auto_798752 ) ) ( not ( = ?auto_798743 ?auto_798744 ) ) ( not ( = ?auto_798743 ?auto_798745 ) ) ( not ( = ?auto_798743 ?auto_798746 ) ) ( not ( = ?auto_798743 ?auto_798747 ) ) ( not ( = ?auto_798743 ?auto_798748 ) ) ( not ( = ?auto_798743 ?auto_798749 ) ) ( not ( = ?auto_798743 ?auto_798750 ) ) ( not ( = ?auto_798743 ?auto_798751 ) ) ( not ( = ?auto_798743 ?auto_798752 ) ) ( not ( = ?auto_798744 ?auto_798745 ) ) ( not ( = ?auto_798744 ?auto_798746 ) ) ( not ( = ?auto_798744 ?auto_798747 ) ) ( not ( = ?auto_798744 ?auto_798748 ) ) ( not ( = ?auto_798744 ?auto_798749 ) ) ( not ( = ?auto_798744 ?auto_798750 ) ) ( not ( = ?auto_798744 ?auto_798751 ) ) ( not ( = ?auto_798744 ?auto_798752 ) ) ( not ( = ?auto_798745 ?auto_798746 ) ) ( not ( = ?auto_798745 ?auto_798747 ) ) ( not ( = ?auto_798745 ?auto_798748 ) ) ( not ( = ?auto_798745 ?auto_798749 ) ) ( not ( = ?auto_798745 ?auto_798750 ) ) ( not ( = ?auto_798745 ?auto_798751 ) ) ( not ( = ?auto_798745 ?auto_798752 ) ) ( not ( = ?auto_798746 ?auto_798747 ) ) ( not ( = ?auto_798746 ?auto_798748 ) ) ( not ( = ?auto_798746 ?auto_798749 ) ) ( not ( = ?auto_798746 ?auto_798750 ) ) ( not ( = ?auto_798746 ?auto_798751 ) ) ( not ( = ?auto_798746 ?auto_798752 ) ) ( not ( = ?auto_798747 ?auto_798748 ) ) ( not ( = ?auto_798747 ?auto_798749 ) ) ( not ( = ?auto_798747 ?auto_798750 ) ) ( not ( = ?auto_798747 ?auto_798751 ) ) ( not ( = ?auto_798747 ?auto_798752 ) ) ( not ( = ?auto_798748 ?auto_798749 ) ) ( not ( = ?auto_798748 ?auto_798750 ) ) ( not ( = ?auto_798748 ?auto_798751 ) ) ( not ( = ?auto_798748 ?auto_798752 ) ) ( not ( = ?auto_798749 ?auto_798750 ) ) ( not ( = ?auto_798749 ?auto_798751 ) ) ( not ( = ?auto_798749 ?auto_798752 ) ) ( not ( = ?auto_798750 ?auto_798751 ) ) ( not ( = ?auto_798750 ?auto_798752 ) ) ( not ( = ?auto_798751 ?auto_798752 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_798751 ?auto_798752 )
      ( !STACK ?auto_798751 ?auto_798750 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_798805 - BLOCK
      ?auto_798806 - BLOCK
      ?auto_798807 - BLOCK
      ?auto_798808 - BLOCK
      ?auto_798809 - BLOCK
      ?auto_798810 - BLOCK
      ?auto_798811 - BLOCK
      ?auto_798812 - BLOCK
      ?auto_798813 - BLOCK
      ?auto_798814 - BLOCK
      ?auto_798815 - BLOCK
      ?auto_798816 - BLOCK
      ?auto_798817 - BLOCK
      ?auto_798818 - BLOCK
      ?auto_798819 - BLOCK
      ?auto_798820 - BLOCK
      ?auto_798821 - BLOCK
    )
    :vars
    (
      ?auto_798822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_798821 ?auto_798822 ) ( ON-TABLE ?auto_798805 ) ( ON ?auto_798806 ?auto_798805 ) ( ON ?auto_798807 ?auto_798806 ) ( ON ?auto_798808 ?auto_798807 ) ( ON ?auto_798809 ?auto_798808 ) ( ON ?auto_798810 ?auto_798809 ) ( ON ?auto_798811 ?auto_798810 ) ( ON ?auto_798812 ?auto_798811 ) ( ON ?auto_798813 ?auto_798812 ) ( ON ?auto_798814 ?auto_798813 ) ( ON ?auto_798815 ?auto_798814 ) ( ON ?auto_798816 ?auto_798815 ) ( ON ?auto_798817 ?auto_798816 ) ( ON ?auto_798818 ?auto_798817 ) ( ON ?auto_798819 ?auto_798818 ) ( not ( = ?auto_798805 ?auto_798806 ) ) ( not ( = ?auto_798805 ?auto_798807 ) ) ( not ( = ?auto_798805 ?auto_798808 ) ) ( not ( = ?auto_798805 ?auto_798809 ) ) ( not ( = ?auto_798805 ?auto_798810 ) ) ( not ( = ?auto_798805 ?auto_798811 ) ) ( not ( = ?auto_798805 ?auto_798812 ) ) ( not ( = ?auto_798805 ?auto_798813 ) ) ( not ( = ?auto_798805 ?auto_798814 ) ) ( not ( = ?auto_798805 ?auto_798815 ) ) ( not ( = ?auto_798805 ?auto_798816 ) ) ( not ( = ?auto_798805 ?auto_798817 ) ) ( not ( = ?auto_798805 ?auto_798818 ) ) ( not ( = ?auto_798805 ?auto_798819 ) ) ( not ( = ?auto_798805 ?auto_798820 ) ) ( not ( = ?auto_798805 ?auto_798821 ) ) ( not ( = ?auto_798805 ?auto_798822 ) ) ( not ( = ?auto_798806 ?auto_798807 ) ) ( not ( = ?auto_798806 ?auto_798808 ) ) ( not ( = ?auto_798806 ?auto_798809 ) ) ( not ( = ?auto_798806 ?auto_798810 ) ) ( not ( = ?auto_798806 ?auto_798811 ) ) ( not ( = ?auto_798806 ?auto_798812 ) ) ( not ( = ?auto_798806 ?auto_798813 ) ) ( not ( = ?auto_798806 ?auto_798814 ) ) ( not ( = ?auto_798806 ?auto_798815 ) ) ( not ( = ?auto_798806 ?auto_798816 ) ) ( not ( = ?auto_798806 ?auto_798817 ) ) ( not ( = ?auto_798806 ?auto_798818 ) ) ( not ( = ?auto_798806 ?auto_798819 ) ) ( not ( = ?auto_798806 ?auto_798820 ) ) ( not ( = ?auto_798806 ?auto_798821 ) ) ( not ( = ?auto_798806 ?auto_798822 ) ) ( not ( = ?auto_798807 ?auto_798808 ) ) ( not ( = ?auto_798807 ?auto_798809 ) ) ( not ( = ?auto_798807 ?auto_798810 ) ) ( not ( = ?auto_798807 ?auto_798811 ) ) ( not ( = ?auto_798807 ?auto_798812 ) ) ( not ( = ?auto_798807 ?auto_798813 ) ) ( not ( = ?auto_798807 ?auto_798814 ) ) ( not ( = ?auto_798807 ?auto_798815 ) ) ( not ( = ?auto_798807 ?auto_798816 ) ) ( not ( = ?auto_798807 ?auto_798817 ) ) ( not ( = ?auto_798807 ?auto_798818 ) ) ( not ( = ?auto_798807 ?auto_798819 ) ) ( not ( = ?auto_798807 ?auto_798820 ) ) ( not ( = ?auto_798807 ?auto_798821 ) ) ( not ( = ?auto_798807 ?auto_798822 ) ) ( not ( = ?auto_798808 ?auto_798809 ) ) ( not ( = ?auto_798808 ?auto_798810 ) ) ( not ( = ?auto_798808 ?auto_798811 ) ) ( not ( = ?auto_798808 ?auto_798812 ) ) ( not ( = ?auto_798808 ?auto_798813 ) ) ( not ( = ?auto_798808 ?auto_798814 ) ) ( not ( = ?auto_798808 ?auto_798815 ) ) ( not ( = ?auto_798808 ?auto_798816 ) ) ( not ( = ?auto_798808 ?auto_798817 ) ) ( not ( = ?auto_798808 ?auto_798818 ) ) ( not ( = ?auto_798808 ?auto_798819 ) ) ( not ( = ?auto_798808 ?auto_798820 ) ) ( not ( = ?auto_798808 ?auto_798821 ) ) ( not ( = ?auto_798808 ?auto_798822 ) ) ( not ( = ?auto_798809 ?auto_798810 ) ) ( not ( = ?auto_798809 ?auto_798811 ) ) ( not ( = ?auto_798809 ?auto_798812 ) ) ( not ( = ?auto_798809 ?auto_798813 ) ) ( not ( = ?auto_798809 ?auto_798814 ) ) ( not ( = ?auto_798809 ?auto_798815 ) ) ( not ( = ?auto_798809 ?auto_798816 ) ) ( not ( = ?auto_798809 ?auto_798817 ) ) ( not ( = ?auto_798809 ?auto_798818 ) ) ( not ( = ?auto_798809 ?auto_798819 ) ) ( not ( = ?auto_798809 ?auto_798820 ) ) ( not ( = ?auto_798809 ?auto_798821 ) ) ( not ( = ?auto_798809 ?auto_798822 ) ) ( not ( = ?auto_798810 ?auto_798811 ) ) ( not ( = ?auto_798810 ?auto_798812 ) ) ( not ( = ?auto_798810 ?auto_798813 ) ) ( not ( = ?auto_798810 ?auto_798814 ) ) ( not ( = ?auto_798810 ?auto_798815 ) ) ( not ( = ?auto_798810 ?auto_798816 ) ) ( not ( = ?auto_798810 ?auto_798817 ) ) ( not ( = ?auto_798810 ?auto_798818 ) ) ( not ( = ?auto_798810 ?auto_798819 ) ) ( not ( = ?auto_798810 ?auto_798820 ) ) ( not ( = ?auto_798810 ?auto_798821 ) ) ( not ( = ?auto_798810 ?auto_798822 ) ) ( not ( = ?auto_798811 ?auto_798812 ) ) ( not ( = ?auto_798811 ?auto_798813 ) ) ( not ( = ?auto_798811 ?auto_798814 ) ) ( not ( = ?auto_798811 ?auto_798815 ) ) ( not ( = ?auto_798811 ?auto_798816 ) ) ( not ( = ?auto_798811 ?auto_798817 ) ) ( not ( = ?auto_798811 ?auto_798818 ) ) ( not ( = ?auto_798811 ?auto_798819 ) ) ( not ( = ?auto_798811 ?auto_798820 ) ) ( not ( = ?auto_798811 ?auto_798821 ) ) ( not ( = ?auto_798811 ?auto_798822 ) ) ( not ( = ?auto_798812 ?auto_798813 ) ) ( not ( = ?auto_798812 ?auto_798814 ) ) ( not ( = ?auto_798812 ?auto_798815 ) ) ( not ( = ?auto_798812 ?auto_798816 ) ) ( not ( = ?auto_798812 ?auto_798817 ) ) ( not ( = ?auto_798812 ?auto_798818 ) ) ( not ( = ?auto_798812 ?auto_798819 ) ) ( not ( = ?auto_798812 ?auto_798820 ) ) ( not ( = ?auto_798812 ?auto_798821 ) ) ( not ( = ?auto_798812 ?auto_798822 ) ) ( not ( = ?auto_798813 ?auto_798814 ) ) ( not ( = ?auto_798813 ?auto_798815 ) ) ( not ( = ?auto_798813 ?auto_798816 ) ) ( not ( = ?auto_798813 ?auto_798817 ) ) ( not ( = ?auto_798813 ?auto_798818 ) ) ( not ( = ?auto_798813 ?auto_798819 ) ) ( not ( = ?auto_798813 ?auto_798820 ) ) ( not ( = ?auto_798813 ?auto_798821 ) ) ( not ( = ?auto_798813 ?auto_798822 ) ) ( not ( = ?auto_798814 ?auto_798815 ) ) ( not ( = ?auto_798814 ?auto_798816 ) ) ( not ( = ?auto_798814 ?auto_798817 ) ) ( not ( = ?auto_798814 ?auto_798818 ) ) ( not ( = ?auto_798814 ?auto_798819 ) ) ( not ( = ?auto_798814 ?auto_798820 ) ) ( not ( = ?auto_798814 ?auto_798821 ) ) ( not ( = ?auto_798814 ?auto_798822 ) ) ( not ( = ?auto_798815 ?auto_798816 ) ) ( not ( = ?auto_798815 ?auto_798817 ) ) ( not ( = ?auto_798815 ?auto_798818 ) ) ( not ( = ?auto_798815 ?auto_798819 ) ) ( not ( = ?auto_798815 ?auto_798820 ) ) ( not ( = ?auto_798815 ?auto_798821 ) ) ( not ( = ?auto_798815 ?auto_798822 ) ) ( not ( = ?auto_798816 ?auto_798817 ) ) ( not ( = ?auto_798816 ?auto_798818 ) ) ( not ( = ?auto_798816 ?auto_798819 ) ) ( not ( = ?auto_798816 ?auto_798820 ) ) ( not ( = ?auto_798816 ?auto_798821 ) ) ( not ( = ?auto_798816 ?auto_798822 ) ) ( not ( = ?auto_798817 ?auto_798818 ) ) ( not ( = ?auto_798817 ?auto_798819 ) ) ( not ( = ?auto_798817 ?auto_798820 ) ) ( not ( = ?auto_798817 ?auto_798821 ) ) ( not ( = ?auto_798817 ?auto_798822 ) ) ( not ( = ?auto_798818 ?auto_798819 ) ) ( not ( = ?auto_798818 ?auto_798820 ) ) ( not ( = ?auto_798818 ?auto_798821 ) ) ( not ( = ?auto_798818 ?auto_798822 ) ) ( not ( = ?auto_798819 ?auto_798820 ) ) ( not ( = ?auto_798819 ?auto_798821 ) ) ( not ( = ?auto_798819 ?auto_798822 ) ) ( not ( = ?auto_798820 ?auto_798821 ) ) ( not ( = ?auto_798820 ?auto_798822 ) ) ( not ( = ?auto_798821 ?auto_798822 ) ) ( CLEAR ?auto_798819 ) ( ON ?auto_798820 ?auto_798821 ) ( CLEAR ?auto_798820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_798805 ?auto_798806 ?auto_798807 ?auto_798808 ?auto_798809 ?auto_798810 ?auto_798811 ?auto_798812 ?auto_798813 ?auto_798814 ?auto_798815 ?auto_798816 ?auto_798817 ?auto_798818 ?auto_798819 ?auto_798820 )
      ( MAKE-17PILE ?auto_798805 ?auto_798806 ?auto_798807 ?auto_798808 ?auto_798809 ?auto_798810 ?auto_798811 ?auto_798812 ?auto_798813 ?auto_798814 ?auto_798815 ?auto_798816 ?auto_798817 ?auto_798818 ?auto_798819 ?auto_798820 ?auto_798821 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_798875 - BLOCK
      ?auto_798876 - BLOCK
      ?auto_798877 - BLOCK
      ?auto_798878 - BLOCK
      ?auto_798879 - BLOCK
      ?auto_798880 - BLOCK
      ?auto_798881 - BLOCK
      ?auto_798882 - BLOCK
      ?auto_798883 - BLOCK
      ?auto_798884 - BLOCK
      ?auto_798885 - BLOCK
      ?auto_798886 - BLOCK
      ?auto_798887 - BLOCK
      ?auto_798888 - BLOCK
      ?auto_798889 - BLOCK
      ?auto_798890 - BLOCK
      ?auto_798891 - BLOCK
    )
    :vars
    (
      ?auto_798892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_798891 ?auto_798892 ) ( ON-TABLE ?auto_798875 ) ( ON ?auto_798876 ?auto_798875 ) ( ON ?auto_798877 ?auto_798876 ) ( ON ?auto_798878 ?auto_798877 ) ( ON ?auto_798879 ?auto_798878 ) ( ON ?auto_798880 ?auto_798879 ) ( ON ?auto_798881 ?auto_798880 ) ( ON ?auto_798882 ?auto_798881 ) ( ON ?auto_798883 ?auto_798882 ) ( ON ?auto_798884 ?auto_798883 ) ( ON ?auto_798885 ?auto_798884 ) ( ON ?auto_798886 ?auto_798885 ) ( ON ?auto_798887 ?auto_798886 ) ( ON ?auto_798888 ?auto_798887 ) ( not ( = ?auto_798875 ?auto_798876 ) ) ( not ( = ?auto_798875 ?auto_798877 ) ) ( not ( = ?auto_798875 ?auto_798878 ) ) ( not ( = ?auto_798875 ?auto_798879 ) ) ( not ( = ?auto_798875 ?auto_798880 ) ) ( not ( = ?auto_798875 ?auto_798881 ) ) ( not ( = ?auto_798875 ?auto_798882 ) ) ( not ( = ?auto_798875 ?auto_798883 ) ) ( not ( = ?auto_798875 ?auto_798884 ) ) ( not ( = ?auto_798875 ?auto_798885 ) ) ( not ( = ?auto_798875 ?auto_798886 ) ) ( not ( = ?auto_798875 ?auto_798887 ) ) ( not ( = ?auto_798875 ?auto_798888 ) ) ( not ( = ?auto_798875 ?auto_798889 ) ) ( not ( = ?auto_798875 ?auto_798890 ) ) ( not ( = ?auto_798875 ?auto_798891 ) ) ( not ( = ?auto_798875 ?auto_798892 ) ) ( not ( = ?auto_798876 ?auto_798877 ) ) ( not ( = ?auto_798876 ?auto_798878 ) ) ( not ( = ?auto_798876 ?auto_798879 ) ) ( not ( = ?auto_798876 ?auto_798880 ) ) ( not ( = ?auto_798876 ?auto_798881 ) ) ( not ( = ?auto_798876 ?auto_798882 ) ) ( not ( = ?auto_798876 ?auto_798883 ) ) ( not ( = ?auto_798876 ?auto_798884 ) ) ( not ( = ?auto_798876 ?auto_798885 ) ) ( not ( = ?auto_798876 ?auto_798886 ) ) ( not ( = ?auto_798876 ?auto_798887 ) ) ( not ( = ?auto_798876 ?auto_798888 ) ) ( not ( = ?auto_798876 ?auto_798889 ) ) ( not ( = ?auto_798876 ?auto_798890 ) ) ( not ( = ?auto_798876 ?auto_798891 ) ) ( not ( = ?auto_798876 ?auto_798892 ) ) ( not ( = ?auto_798877 ?auto_798878 ) ) ( not ( = ?auto_798877 ?auto_798879 ) ) ( not ( = ?auto_798877 ?auto_798880 ) ) ( not ( = ?auto_798877 ?auto_798881 ) ) ( not ( = ?auto_798877 ?auto_798882 ) ) ( not ( = ?auto_798877 ?auto_798883 ) ) ( not ( = ?auto_798877 ?auto_798884 ) ) ( not ( = ?auto_798877 ?auto_798885 ) ) ( not ( = ?auto_798877 ?auto_798886 ) ) ( not ( = ?auto_798877 ?auto_798887 ) ) ( not ( = ?auto_798877 ?auto_798888 ) ) ( not ( = ?auto_798877 ?auto_798889 ) ) ( not ( = ?auto_798877 ?auto_798890 ) ) ( not ( = ?auto_798877 ?auto_798891 ) ) ( not ( = ?auto_798877 ?auto_798892 ) ) ( not ( = ?auto_798878 ?auto_798879 ) ) ( not ( = ?auto_798878 ?auto_798880 ) ) ( not ( = ?auto_798878 ?auto_798881 ) ) ( not ( = ?auto_798878 ?auto_798882 ) ) ( not ( = ?auto_798878 ?auto_798883 ) ) ( not ( = ?auto_798878 ?auto_798884 ) ) ( not ( = ?auto_798878 ?auto_798885 ) ) ( not ( = ?auto_798878 ?auto_798886 ) ) ( not ( = ?auto_798878 ?auto_798887 ) ) ( not ( = ?auto_798878 ?auto_798888 ) ) ( not ( = ?auto_798878 ?auto_798889 ) ) ( not ( = ?auto_798878 ?auto_798890 ) ) ( not ( = ?auto_798878 ?auto_798891 ) ) ( not ( = ?auto_798878 ?auto_798892 ) ) ( not ( = ?auto_798879 ?auto_798880 ) ) ( not ( = ?auto_798879 ?auto_798881 ) ) ( not ( = ?auto_798879 ?auto_798882 ) ) ( not ( = ?auto_798879 ?auto_798883 ) ) ( not ( = ?auto_798879 ?auto_798884 ) ) ( not ( = ?auto_798879 ?auto_798885 ) ) ( not ( = ?auto_798879 ?auto_798886 ) ) ( not ( = ?auto_798879 ?auto_798887 ) ) ( not ( = ?auto_798879 ?auto_798888 ) ) ( not ( = ?auto_798879 ?auto_798889 ) ) ( not ( = ?auto_798879 ?auto_798890 ) ) ( not ( = ?auto_798879 ?auto_798891 ) ) ( not ( = ?auto_798879 ?auto_798892 ) ) ( not ( = ?auto_798880 ?auto_798881 ) ) ( not ( = ?auto_798880 ?auto_798882 ) ) ( not ( = ?auto_798880 ?auto_798883 ) ) ( not ( = ?auto_798880 ?auto_798884 ) ) ( not ( = ?auto_798880 ?auto_798885 ) ) ( not ( = ?auto_798880 ?auto_798886 ) ) ( not ( = ?auto_798880 ?auto_798887 ) ) ( not ( = ?auto_798880 ?auto_798888 ) ) ( not ( = ?auto_798880 ?auto_798889 ) ) ( not ( = ?auto_798880 ?auto_798890 ) ) ( not ( = ?auto_798880 ?auto_798891 ) ) ( not ( = ?auto_798880 ?auto_798892 ) ) ( not ( = ?auto_798881 ?auto_798882 ) ) ( not ( = ?auto_798881 ?auto_798883 ) ) ( not ( = ?auto_798881 ?auto_798884 ) ) ( not ( = ?auto_798881 ?auto_798885 ) ) ( not ( = ?auto_798881 ?auto_798886 ) ) ( not ( = ?auto_798881 ?auto_798887 ) ) ( not ( = ?auto_798881 ?auto_798888 ) ) ( not ( = ?auto_798881 ?auto_798889 ) ) ( not ( = ?auto_798881 ?auto_798890 ) ) ( not ( = ?auto_798881 ?auto_798891 ) ) ( not ( = ?auto_798881 ?auto_798892 ) ) ( not ( = ?auto_798882 ?auto_798883 ) ) ( not ( = ?auto_798882 ?auto_798884 ) ) ( not ( = ?auto_798882 ?auto_798885 ) ) ( not ( = ?auto_798882 ?auto_798886 ) ) ( not ( = ?auto_798882 ?auto_798887 ) ) ( not ( = ?auto_798882 ?auto_798888 ) ) ( not ( = ?auto_798882 ?auto_798889 ) ) ( not ( = ?auto_798882 ?auto_798890 ) ) ( not ( = ?auto_798882 ?auto_798891 ) ) ( not ( = ?auto_798882 ?auto_798892 ) ) ( not ( = ?auto_798883 ?auto_798884 ) ) ( not ( = ?auto_798883 ?auto_798885 ) ) ( not ( = ?auto_798883 ?auto_798886 ) ) ( not ( = ?auto_798883 ?auto_798887 ) ) ( not ( = ?auto_798883 ?auto_798888 ) ) ( not ( = ?auto_798883 ?auto_798889 ) ) ( not ( = ?auto_798883 ?auto_798890 ) ) ( not ( = ?auto_798883 ?auto_798891 ) ) ( not ( = ?auto_798883 ?auto_798892 ) ) ( not ( = ?auto_798884 ?auto_798885 ) ) ( not ( = ?auto_798884 ?auto_798886 ) ) ( not ( = ?auto_798884 ?auto_798887 ) ) ( not ( = ?auto_798884 ?auto_798888 ) ) ( not ( = ?auto_798884 ?auto_798889 ) ) ( not ( = ?auto_798884 ?auto_798890 ) ) ( not ( = ?auto_798884 ?auto_798891 ) ) ( not ( = ?auto_798884 ?auto_798892 ) ) ( not ( = ?auto_798885 ?auto_798886 ) ) ( not ( = ?auto_798885 ?auto_798887 ) ) ( not ( = ?auto_798885 ?auto_798888 ) ) ( not ( = ?auto_798885 ?auto_798889 ) ) ( not ( = ?auto_798885 ?auto_798890 ) ) ( not ( = ?auto_798885 ?auto_798891 ) ) ( not ( = ?auto_798885 ?auto_798892 ) ) ( not ( = ?auto_798886 ?auto_798887 ) ) ( not ( = ?auto_798886 ?auto_798888 ) ) ( not ( = ?auto_798886 ?auto_798889 ) ) ( not ( = ?auto_798886 ?auto_798890 ) ) ( not ( = ?auto_798886 ?auto_798891 ) ) ( not ( = ?auto_798886 ?auto_798892 ) ) ( not ( = ?auto_798887 ?auto_798888 ) ) ( not ( = ?auto_798887 ?auto_798889 ) ) ( not ( = ?auto_798887 ?auto_798890 ) ) ( not ( = ?auto_798887 ?auto_798891 ) ) ( not ( = ?auto_798887 ?auto_798892 ) ) ( not ( = ?auto_798888 ?auto_798889 ) ) ( not ( = ?auto_798888 ?auto_798890 ) ) ( not ( = ?auto_798888 ?auto_798891 ) ) ( not ( = ?auto_798888 ?auto_798892 ) ) ( not ( = ?auto_798889 ?auto_798890 ) ) ( not ( = ?auto_798889 ?auto_798891 ) ) ( not ( = ?auto_798889 ?auto_798892 ) ) ( not ( = ?auto_798890 ?auto_798891 ) ) ( not ( = ?auto_798890 ?auto_798892 ) ) ( not ( = ?auto_798891 ?auto_798892 ) ) ( ON ?auto_798890 ?auto_798891 ) ( CLEAR ?auto_798888 ) ( ON ?auto_798889 ?auto_798890 ) ( CLEAR ?auto_798889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_798875 ?auto_798876 ?auto_798877 ?auto_798878 ?auto_798879 ?auto_798880 ?auto_798881 ?auto_798882 ?auto_798883 ?auto_798884 ?auto_798885 ?auto_798886 ?auto_798887 ?auto_798888 ?auto_798889 )
      ( MAKE-17PILE ?auto_798875 ?auto_798876 ?auto_798877 ?auto_798878 ?auto_798879 ?auto_798880 ?auto_798881 ?auto_798882 ?auto_798883 ?auto_798884 ?auto_798885 ?auto_798886 ?auto_798887 ?auto_798888 ?auto_798889 ?auto_798890 ?auto_798891 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_798945 - BLOCK
      ?auto_798946 - BLOCK
      ?auto_798947 - BLOCK
      ?auto_798948 - BLOCK
      ?auto_798949 - BLOCK
      ?auto_798950 - BLOCK
      ?auto_798951 - BLOCK
      ?auto_798952 - BLOCK
      ?auto_798953 - BLOCK
      ?auto_798954 - BLOCK
      ?auto_798955 - BLOCK
      ?auto_798956 - BLOCK
      ?auto_798957 - BLOCK
      ?auto_798958 - BLOCK
      ?auto_798959 - BLOCK
      ?auto_798960 - BLOCK
      ?auto_798961 - BLOCK
    )
    :vars
    (
      ?auto_798962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_798961 ?auto_798962 ) ( ON-TABLE ?auto_798945 ) ( ON ?auto_798946 ?auto_798945 ) ( ON ?auto_798947 ?auto_798946 ) ( ON ?auto_798948 ?auto_798947 ) ( ON ?auto_798949 ?auto_798948 ) ( ON ?auto_798950 ?auto_798949 ) ( ON ?auto_798951 ?auto_798950 ) ( ON ?auto_798952 ?auto_798951 ) ( ON ?auto_798953 ?auto_798952 ) ( ON ?auto_798954 ?auto_798953 ) ( ON ?auto_798955 ?auto_798954 ) ( ON ?auto_798956 ?auto_798955 ) ( ON ?auto_798957 ?auto_798956 ) ( not ( = ?auto_798945 ?auto_798946 ) ) ( not ( = ?auto_798945 ?auto_798947 ) ) ( not ( = ?auto_798945 ?auto_798948 ) ) ( not ( = ?auto_798945 ?auto_798949 ) ) ( not ( = ?auto_798945 ?auto_798950 ) ) ( not ( = ?auto_798945 ?auto_798951 ) ) ( not ( = ?auto_798945 ?auto_798952 ) ) ( not ( = ?auto_798945 ?auto_798953 ) ) ( not ( = ?auto_798945 ?auto_798954 ) ) ( not ( = ?auto_798945 ?auto_798955 ) ) ( not ( = ?auto_798945 ?auto_798956 ) ) ( not ( = ?auto_798945 ?auto_798957 ) ) ( not ( = ?auto_798945 ?auto_798958 ) ) ( not ( = ?auto_798945 ?auto_798959 ) ) ( not ( = ?auto_798945 ?auto_798960 ) ) ( not ( = ?auto_798945 ?auto_798961 ) ) ( not ( = ?auto_798945 ?auto_798962 ) ) ( not ( = ?auto_798946 ?auto_798947 ) ) ( not ( = ?auto_798946 ?auto_798948 ) ) ( not ( = ?auto_798946 ?auto_798949 ) ) ( not ( = ?auto_798946 ?auto_798950 ) ) ( not ( = ?auto_798946 ?auto_798951 ) ) ( not ( = ?auto_798946 ?auto_798952 ) ) ( not ( = ?auto_798946 ?auto_798953 ) ) ( not ( = ?auto_798946 ?auto_798954 ) ) ( not ( = ?auto_798946 ?auto_798955 ) ) ( not ( = ?auto_798946 ?auto_798956 ) ) ( not ( = ?auto_798946 ?auto_798957 ) ) ( not ( = ?auto_798946 ?auto_798958 ) ) ( not ( = ?auto_798946 ?auto_798959 ) ) ( not ( = ?auto_798946 ?auto_798960 ) ) ( not ( = ?auto_798946 ?auto_798961 ) ) ( not ( = ?auto_798946 ?auto_798962 ) ) ( not ( = ?auto_798947 ?auto_798948 ) ) ( not ( = ?auto_798947 ?auto_798949 ) ) ( not ( = ?auto_798947 ?auto_798950 ) ) ( not ( = ?auto_798947 ?auto_798951 ) ) ( not ( = ?auto_798947 ?auto_798952 ) ) ( not ( = ?auto_798947 ?auto_798953 ) ) ( not ( = ?auto_798947 ?auto_798954 ) ) ( not ( = ?auto_798947 ?auto_798955 ) ) ( not ( = ?auto_798947 ?auto_798956 ) ) ( not ( = ?auto_798947 ?auto_798957 ) ) ( not ( = ?auto_798947 ?auto_798958 ) ) ( not ( = ?auto_798947 ?auto_798959 ) ) ( not ( = ?auto_798947 ?auto_798960 ) ) ( not ( = ?auto_798947 ?auto_798961 ) ) ( not ( = ?auto_798947 ?auto_798962 ) ) ( not ( = ?auto_798948 ?auto_798949 ) ) ( not ( = ?auto_798948 ?auto_798950 ) ) ( not ( = ?auto_798948 ?auto_798951 ) ) ( not ( = ?auto_798948 ?auto_798952 ) ) ( not ( = ?auto_798948 ?auto_798953 ) ) ( not ( = ?auto_798948 ?auto_798954 ) ) ( not ( = ?auto_798948 ?auto_798955 ) ) ( not ( = ?auto_798948 ?auto_798956 ) ) ( not ( = ?auto_798948 ?auto_798957 ) ) ( not ( = ?auto_798948 ?auto_798958 ) ) ( not ( = ?auto_798948 ?auto_798959 ) ) ( not ( = ?auto_798948 ?auto_798960 ) ) ( not ( = ?auto_798948 ?auto_798961 ) ) ( not ( = ?auto_798948 ?auto_798962 ) ) ( not ( = ?auto_798949 ?auto_798950 ) ) ( not ( = ?auto_798949 ?auto_798951 ) ) ( not ( = ?auto_798949 ?auto_798952 ) ) ( not ( = ?auto_798949 ?auto_798953 ) ) ( not ( = ?auto_798949 ?auto_798954 ) ) ( not ( = ?auto_798949 ?auto_798955 ) ) ( not ( = ?auto_798949 ?auto_798956 ) ) ( not ( = ?auto_798949 ?auto_798957 ) ) ( not ( = ?auto_798949 ?auto_798958 ) ) ( not ( = ?auto_798949 ?auto_798959 ) ) ( not ( = ?auto_798949 ?auto_798960 ) ) ( not ( = ?auto_798949 ?auto_798961 ) ) ( not ( = ?auto_798949 ?auto_798962 ) ) ( not ( = ?auto_798950 ?auto_798951 ) ) ( not ( = ?auto_798950 ?auto_798952 ) ) ( not ( = ?auto_798950 ?auto_798953 ) ) ( not ( = ?auto_798950 ?auto_798954 ) ) ( not ( = ?auto_798950 ?auto_798955 ) ) ( not ( = ?auto_798950 ?auto_798956 ) ) ( not ( = ?auto_798950 ?auto_798957 ) ) ( not ( = ?auto_798950 ?auto_798958 ) ) ( not ( = ?auto_798950 ?auto_798959 ) ) ( not ( = ?auto_798950 ?auto_798960 ) ) ( not ( = ?auto_798950 ?auto_798961 ) ) ( not ( = ?auto_798950 ?auto_798962 ) ) ( not ( = ?auto_798951 ?auto_798952 ) ) ( not ( = ?auto_798951 ?auto_798953 ) ) ( not ( = ?auto_798951 ?auto_798954 ) ) ( not ( = ?auto_798951 ?auto_798955 ) ) ( not ( = ?auto_798951 ?auto_798956 ) ) ( not ( = ?auto_798951 ?auto_798957 ) ) ( not ( = ?auto_798951 ?auto_798958 ) ) ( not ( = ?auto_798951 ?auto_798959 ) ) ( not ( = ?auto_798951 ?auto_798960 ) ) ( not ( = ?auto_798951 ?auto_798961 ) ) ( not ( = ?auto_798951 ?auto_798962 ) ) ( not ( = ?auto_798952 ?auto_798953 ) ) ( not ( = ?auto_798952 ?auto_798954 ) ) ( not ( = ?auto_798952 ?auto_798955 ) ) ( not ( = ?auto_798952 ?auto_798956 ) ) ( not ( = ?auto_798952 ?auto_798957 ) ) ( not ( = ?auto_798952 ?auto_798958 ) ) ( not ( = ?auto_798952 ?auto_798959 ) ) ( not ( = ?auto_798952 ?auto_798960 ) ) ( not ( = ?auto_798952 ?auto_798961 ) ) ( not ( = ?auto_798952 ?auto_798962 ) ) ( not ( = ?auto_798953 ?auto_798954 ) ) ( not ( = ?auto_798953 ?auto_798955 ) ) ( not ( = ?auto_798953 ?auto_798956 ) ) ( not ( = ?auto_798953 ?auto_798957 ) ) ( not ( = ?auto_798953 ?auto_798958 ) ) ( not ( = ?auto_798953 ?auto_798959 ) ) ( not ( = ?auto_798953 ?auto_798960 ) ) ( not ( = ?auto_798953 ?auto_798961 ) ) ( not ( = ?auto_798953 ?auto_798962 ) ) ( not ( = ?auto_798954 ?auto_798955 ) ) ( not ( = ?auto_798954 ?auto_798956 ) ) ( not ( = ?auto_798954 ?auto_798957 ) ) ( not ( = ?auto_798954 ?auto_798958 ) ) ( not ( = ?auto_798954 ?auto_798959 ) ) ( not ( = ?auto_798954 ?auto_798960 ) ) ( not ( = ?auto_798954 ?auto_798961 ) ) ( not ( = ?auto_798954 ?auto_798962 ) ) ( not ( = ?auto_798955 ?auto_798956 ) ) ( not ( = ?auto_798955 ?auto_798957 ) ) ( not ( = ?auto_798955 ?auto_798958 ) ) ( not ( = ?auto_798955 ?auto_798959 ) ) ( not ( = ?auto_798955 ?auto_798960 ) ) ( not ( = ?auto_798955 ?auto_798961 ) ) ( not ( = ?auto_798955 ?auto_798962 ) ) ( not ( = ?auto_798956 ?auto_798957 ) ) ( not ( = ?auto_798956 ?auto_798958 ) ) ( not ( = ?auto_798956 ?auto_798959 ) ) ( not ( = ?auto_798956 ?auto_798960 ) ) ( not ( = ?auto_798956 ?auto_798961 ) ) ( not ( = ?auto_798956 ?auto_798962 ) ) ( not ( = ?auto_798957 ?auto_798958 ) ) ( not ( = ?auto_798957 ?auto_798959 ) ) ( not ( = ?auto_798957 ?auto_798960 ) ) ( not ( = ?auto_798957 ?auto_798961 ) ) ( not ( = ?auto_798957 ?auto_798962 ) ) ( not ( = ?auto_798958 ?auto_798959 ) ) ( not ( = ?auto_798958 ?auto_798960 ) ) ( not ( = ?auto_798958 ?auto_798961 ) ) ( not ( = ?auto_798958 ?auto_798962 ) ) ( not ( = ?auto_798959 ?auto_798960 ) ) ( not ( = ?auto_798959 ?auto_798961 ) ) ( not ( = ?auto_798959 ?auto_798962 ) ) ( not ( = ?auto_798960 ?auto_798961 ) ) ( not ( = ?auto_798960 ?auto_798962 ) ) ( not ( = ?auto_798961 ?auto_798962 ) ) ( ON ?auto_798960 ?auto_798961 ) ( ON ?auto_798959 ?auto_798960 ) ( CLEAR ?auto_798957 ) ( ON ?auto_798958 ?auto_798959 ) ( CLEAR ?auto_798958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_798945 ?auto_798946 ?auto_798947 ?auto_798948 ?auto_798949 ?auto_798950 ?auto_798951 ?auto_798952 ?auto_798953 ?auto_798954 ?auto_798955 ?auto_798956 ?auto_798957 ?auto_798958 )
      ( MAKE-17PILE ?auto_798945 ?auto_798946 ?auto_798947 ?auto_798948 ?auto_798949 ?auto_798950 ?auto_798951 ?auto_798952 ?auto_798953 ?auto_798954 ?auto_798955 ?auto_798956 ?auto_798957 ?auto_798958 ?auto_798959 ?auto_798960 ?auto_798961 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_799015 - BLOCK
      ?auto_799016 - BLOCK
      ?auto_799017 - BLOCK
      ?auto_799018 - BLOCK
      ?auto_799019 - BLOCK
      ?auto_799020 - BLOCK
      ?auto_799021 - BLOCK
      ?auto_799022 - BLOCK
      ?auto_799023 - BLOCK
      ?auto_799024 - BLOCK
      ?auto_799025 - BLOCK
      ?auto_799026 - BLOCK
      ?auto_799027 - BLOCK
      ?auto_799028 - BLOCK
      ?auto_799029 - BLOCK
      ?auto_799030 - BLOCK
      ?auto_799031 - BLOCK
    )
    :vars
    (
      ?auto_799032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_799031 ?auto_799032 ) ( ON-TABLE ?auto_799015 ) ( ON ?auto_799016 ?auto_799015 ) ( ON ?auto_799017 ?auto_799016 ) ( ON ?auto_799018 ?auto_799017 ) ( ON ?auto_799019 ?auto_799018 ) ( ON ?auto_799020 ?auto_799019 ) ( ON ?auto_799021 ?auto_799020 ) ( ON ?auto_799022 ?auto_799021 ) ( ON ?auto_799023 ?auto_799022 ) ( ON ?auto_799024 ?auto_799023 ) ( ON ?auto_799025 ?auto_799024 ) ( ON ?auto_799026 ?auto_799025 ) ( not ( = ?auto_799015 ?auto_799016 ) ) ( not ( = ?auto_799015 ?auto_799017 ) ) ( not ( = ?auto_799015 ?auto_799018 ) ) ( not ( = ?auto_799015 ?auto_799019 ) ) ( not ( = ?auto_799015 ?auto_799020 ) ) ( not ( = ?auto_799015 ?auto_799021 ) ) ( not ( = ?auto_799015 ?auto_799022 ) ) ( not ( = ?auto_799015 ?auto_799023 ) ) ( not ( = ?auto_799015 ?auto_799024 ) ) ( not ( = ?auto_799015 ?auto_799025 ) ) ( not ( = ?auto_799015 ?auto_799026 ) ) ( not ( = ?auto_799015 ?auto_799027 ) ) ( not ( = ?auto_799015 ?auto_799028 ) ) ( not ( = ?auto_799015 ?auto_799029 ) ) ( not ( = ?auto_799015 ?auto_799030 ) ) ( not ( = ?auto_799015 ?auto_799031 ) ) ( not ( = ?auto_799015 ?auto_799032 ) ) ( not ( = ?auto_799016 ?auto_799017 ) ) ( not ( = ?auto_799016 ?auto_799018 ) ) ( not ( = ?auto_799016 ?auto_799019 ) ) ( not ( = ?auto_799016 ?auto_799020 ) ) ( not ( = ?auto_799016 ?auto_799021 ) ) ( not ( = ?auto_799016 ?auto_799022 ) ) ( not ( = ?auto_799016 ?auto_799023 ) ) ( not ( = ?auto_799016 ?auto_799024 ) ) ( not ( = ?auto_799016 ?auto_799025 ) ) ( not ( = ?auto_799016 ?auto_799026 ) ) ( not ( = ?auto_799016 ?auto_799027 ) ) ( not ( = ?auto_799016 ?auto_799028 ) ) ( not ( = ?auto_799016 ?auto_799029 ) ) ( not ( = ?auto_799016 ?auto_799030 ) ) ( not ( = ?auto_799016 ?auto_799031 ) ) ( not ( = ?auto_799016 ?auto_799032 ) ) ( not ( = ?auto_799017 ?auto_799018 ) ) ( not ( = ?auto_799017 ?auto_799019 ) ) ( not ( = ?auto_799017 ?auto_799020 ) ) ( not ( = ?auto_799017 ?auto_799021 ) ) ( not ( = ?auto_799017 ?auto_799022 ) ) ( not ( = ?auto_799017 ?auto_799023 ) ) ( not ( = ?auto_799017 ?auto_799024 ) ) ( not ( = ?auto_799017 ?auto_799025 ) ) ( not ( = ?auto_799017 ?auto_799026 ) ) ( not ( = ?auto_799017 ?auto_799027 ) ) ( not ( = ?auto_799017 ?auto_799028 ) ) ( not ( = ?auto_799017 ?auto_799029 ) ) ( not ( = ?auto_799017 ?auto_799030 ) ) ( not ( = ?auto_799017 ?auto_799031 ) ) ( not ( = ?auto_799017 ?auto_799032 ) ) ( not ( = ?auto_799018 ?auto_799019 ) ) ( not ( = ?auto_799018 ?auto_799020 ) ) ( not ( = ?auto_799018 ?auto_799021 ) ) ( not ( = ?auto_799018 ?auto_799022 ) ) ( not ( = ?auto_799018 ?auto_799023 ) ) ( not ( = ?auto_799018 ?auto_799024 ) ) ( not ( = ?auto_799018 ?auto_799025 ) ) ( not ( = ?auto_799018 ?auto_799026 ) ) ( not ( = ?auto_799018 ?auto_799027 ) ) ( not ( = ?auto_799018 ?auto_799028 ) ) ( not ( = ?auto_799018 ?auto_799029 ) ) ( not ( = ?auto_799018 ?auto_799030 ) ) ( not ( = ?auto_799018 ?auto_799031 ) ) ( not ( = ?auto_799018 ?auto_799032 ) ) ( not ( = ?auto_799019 ?auto_799020 ) ) ( not ( = ?auto_799019 ?auto_799021 ) ) ( not ( = ?auto_799019 ?auto_799022 ) ) ( not ( = ?auto_799019 ?auto_799023 ) ) ( not ( = ?auto_799019 ?auto_799024 ) ) ( not ( = ?auto_799019 ?auto_799025 ) ) ( not ( = ?auto_799019 ?auto_799026 ) ) ( not ( = ?auto_799019 ?auto_799027 ) ) ( not ( = ?auto_799019 ?auto_799028 ) ) ( not ( = ?auto_799019 ?auto_799029 ) ) ( not ( = ?auto_799019 ?auto_799030 ) ) ( not ( = ?auto_799019 ?auto_799031 ) ) ( not ( = ?auto_799019 ?auto_799032 ) ) ( not ( = ?auto_799020 ?auto_799021 ) ) ( not ( = ?auto_799020 ?auto_799022 ) ) ( not ( = ?auto_799020 ?auto_799023 ) ) ( not ( = ?auto_799020 ?auto_799024 ) ) ( not ( = ?auto_799020 ?auto_799025 ) ) ( not ( = ?auto_799020 ?auto_799026 ) ) ( not ( = ?auto_799020 ?auto_799027 ) ) ( not ( = ?auto_799020 ?auto_799028 ) ) ( not ( = ?auto_799020 ?auto_799029 ) ) ( not ( = ?auto_799020 ?auto_799030 ) ) ( not ( = ?auto_799020 ?auto_799031 ) ) ( not ( = ?auto_799020 ?auto_799032 ) ) ( not ( = ?auto_799021 ?auto_799022 ) ) ( not ( = ?auto_799021 ?auto_799023 ) ) ( not ( = ?auto_799021 ?auto_799024 ) ) ( not ( = ?auto_799021 ?auto_799025 ) ) ( not ( = ?auto_799021 ?auto_799026 ) ) ( not ( = ?auto_799021 ?auto_799027 ) ) ( not ( = ?auto_799021 ?auto_799028 ) ) ( not ( = ?auto_799021 ?auto_799029 ) ) ( not ( = ?auto_799021 ?auto_799030 ) ) ( not ( = ?auto_799021 ?auto_799031 ) ) ( not ( = ?auto_799021 ?auto_799032 ) ) ( not ( = ?auto_799022 ?auto_799023 ) ) ( not ( = ?auto_799022 ?auto_799024 ) ) ( not ( = ?auto_799022 ?auto_799025 ) ) ( not ( = ?auto_799022 ?auto_799026 ) ) ( not ( = ?auto_799022 ?auto_799027 ) ) ( not ( = ?auto_799022 ?auto_799028 ) ) ( not ( = ?auto_799022 ?auto_799029 ) ) ( not ( = ?auto_799022 ?auto_799030 ) ) ( not ( = ?auto_799022 ?auto_799031 ) ) ( not ( = ?auto_799022 ?auto_799032 ) ) ( not ( = ?auto_799023 ?auto_799024 ) ) ( not ( = ?auto_799023 ?auto_799025 ) ) ( not ( = ?auto_799023 ?auto_799026 ) ) ( not ( = ?auto_799023 ?auto_799027 ) ) ( not ( = ?auto_799023 ?auto_799028 ) ) ( not ( = ?auto_799023 ?auto_799029 ) ) ( not ( = ?auto_799023 ?auto_799030 ) ) ( not ( = ?auto_799023 ?auto_799031 ) ) ( not ( = ?auto_799023 ?auto_799032 ) ) ( not ( = ?auto_799024 ?auto_799025 ) ) ( not ( = ?auto_799024 ?auto_799026 ) ) ( not ( = ?auto_799024 ?auto_799027 ) ) ( not ( = ?auto_799024 ?auto_799028 ) ) ( not ( = ?auto_799024 ?auto_799029 ) ) ( not ( = ?auto_799024 ?auto_799030 ) ) ( not ( = ?auto_799024 ?auto_799031 ) ) ( not ( = ?auto_799024 ?auto_799032 ) ) ( not ( = ?auto_799025 ?auto_799026 ) ) ( not ( = ?auto_799025 ?auto_799027 ) ) ( not ( = ?auto_799025 ?auto_799028 ) ) ( not ( = ?auto_799025 ?auto_799029 ) ) ( not ( = ?auto_799025 ?auto_799030 ) ) ( not ( = ?auto_799025 ?auto_799031 ) ) ( not ( = ?auto_799025 ?auto_799032 ) ) ( not ( = ?auto_799026 ?auto_799027 ) ) ( not ( = ?auto_799026 ?auto_799028 ) ) ( not ( = ?auto_799026 ?auto_799029 ) ) ( not ( = ?auto_799026 ?auto_799030 ) ) ( not ( = ?auto_799026 ?auto_799031 ) ) ( not ( = ?auto_799026 ?auto_799032 ) ) ( not ( = ?auto_799027 ?auto_799028 ) ) ( not ( = ?auto_799027 ?auto_799029 ) ) ( not ( = ?auto_799027 ?auto_799030 ) ) ( not ( = ?auto_799027 ?auto_799031 ) ) ( not ( = ?auto_799027 ?auto_799032 ) ) ( not ( = ?auto_799028 ?auto_799029 ) ) ( not ( = ?auto_799028 ?auto_799030 ) ) ( not ( = ?auto_799028 ?auto_799031 ) ) ( not ( = ?auto_799028 ?auto_799032 ) ) ( not ( = ?auto_799029 ?auto_799030 ) ) ( not ( = ?auto_799029 ?auto_799031 ) ) ( not ( = ?auto_799029 ?auto_799032 ) ) ( not ( = ?auto_799030 ?auto_799031 ) ) ( not ( = ?auto_799030 ?auto_799032 ) ) ( not ( = ?auto_799031 ?auto_799032 ) ) ( ON ?auto_799030 ?auto_799031 ) ( ON ?auto_799029 ?auto_799030 ) ( ON ?auto_799028 ?auto_799029 ) ( CLEAR ?auto_799026 ) ( ON ?auto_799027 ?auto_799028 ) ( CLEAR ?auto_799027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_799015 ?auto_799016 ?auto_799017 ?auto_799018 ?auto_799019 ?auto_799020 ?auto_799021 ?auto_799022 ?auto_799023 ?auto_799024 ?auto_799025 ?auto_799026 ?auto_799027 )
      ( MAKE-17PILE ?auto_799015 ?auto_799016 ?auto_799017 ?auto_799018 ?auto_799019 ?auto_799020 ?auto_799021 ?auto_799022 ?auto_799023 ?auto_799024 ?auto_799025 ?auto_799026 ?auto_799027 ?auto_799028 ?auto_799029 ?auto_799030 ?auto_799031 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_799085 - BLOCK
      ?auto_799086 - BLOCK
      ?auto_799087 - BLOCK
      ?auto_799088 - BLOCK
      ?auto_799089 - BLOCK
      ?auto_799090 - BLOCK
      ?auto_799091 - BLOCK
      ?auto_799092 - BLOCK
      ?auto_799093 - BLOCK
      ?auto_799094 - BLOCK
      ?auto_799095 - BLOCK
      ?auto_799096 - BLOCK
      ?auto_799097 - BLOCK
      ?auto_799098 - BLOCK
      ?auto_799099 - BLOCK
      ?auto_799100 - BLOCK
      ?auto_799101 - BLOCK
    )
    :vars
    (
      ?auto_799102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_799101 ?auto_799102 ) ( ON-TABLE ?auto_799085 ) ( ON ?auto_799086 ?auto_799085 ) ( ON ?auto_799087 ?auto_799086 ) ( ON ?auto_799088 ?auto_799087 ) ( ON ?auto_799089 ?auto_799088 ) ( ON ?auto_799090 ?auto_799089 ) ( ON ?auto_799091 ?auto_799090 ) ( ON ?auto_799092 ?auto_799091 ) ( ON ?auto_799093 ?auto_799092 ) ( ON ?auto_799094 ?auto_799093 ) ( ON ?auto_799095 ?auto_799094 ) ( not ( = ?auto_799085 ?auto_799086 ) ) ( not ( = ?auto_799085 ?auto_799087 ) ) ( not ( = ?auto_799085 ?auto_799088 ) ) ( not ( = ?auto_799085 ?auto_799089 ) ) ( not ( = ?auto_799085 ?auto_799090 ) ) ( not ( = ?auto_799085 ?auto_799091 ) ) ( not ( = ?auto_799085 ?auto_799092 ) ) ( not ( = ?auto_799085 ?auto_799093 ) ) ( not ( = ?auto_799085 ?auto_799094 ) ) ( not ( = ?auto_799085 ?auto_799095 ) ) ( not ( = ?auto_799085 ?auto_799096 ) ) ( not ( = ?auto_799085 ?auto_799097 ) ) ( not ( = ?auto_799085 ?auto_799098 ) ) ( not ( = ?auto_799085 ?auto_799099 ) ) ( not ( = ?auto_799085 ?auto_799100 ) ) ( not ( = ?auto_799085 ?auto_799101 ) ) ( not ( = ?auto_799085 ?auto_799102 ) ) ( not ( = ?auto_799086 ?auto_799087 ) ) ( not ( = ?auto_799086 ?auto_799088 ) ) ( not ( = ?auto_799086 ?auto_799089 ) ) ( not ( = ?auto_799086 ?auto_799090 ) ) ( not ( = ?auto_799086 ?auto_799091 ) ) ( not ( = ?auto_799086 ?auto_799092 ) ) ( not ( = ?auto_799086 ?auto_799093 ) ) ( not ( = ?auto_799086 ?auto_799094 ) ) ( not ( = ?auto_799086 ?auto_799095 ) ) ( not ( = ?auto_799086 ?auto_799096 ) ) ( not ( = ?auto_799086 ?auto_799097 ) ) ( not ( = ?auto_799086 ?auto_799098 ) ) ( not ( = ?auto_799086 ?auto_799099 ) ) ( not ( = ?auto_799086 ?auto_799100 ) ) ( not ( = ?auto_799086 ?auto_799101 ) ) ( not ( = ?auto_799086 ?auto_799102 ) ) ( not ( = ?auto_799087 ?auto_799088 ) ) ( not ( = ?auto_799087 ?auto_799089 ) ) ( not ( = ?auto_799087 ?auto_799090 ) ) ( not ( = ?auto_799087 ?auto_799091 ) ) ( not ( = ?auto_799087 ?auto_799092 ) ) ( not ( = ?auto_799087 ?auto_799093 ) ) ( not ( = ?auto_799087 ?auto_799094 ) ) ( not ( = ?auto_799087 ?auto_799095 ) ) ( not ( = ?auto_799087 ?auto_799096 ) ) ( not ( = ?auto_799087 ?auto_799097 ) ) ( not ( = ?auto_799087 ?auto_799098 ) ) ( not ( = ?auto_799087 ?auto_799099 ) ) ( not ( = ?auto_799087 ?auto_799100 ) ) ( not ( = ?auto_799087 ?auto_799101 ) ) ( not ( = ?auto_799087 ?auto_799102 ) ) ( not ( = ?auto_799088 ?auto_799089 ) ) ( not ( = ?auto_799088 ?auto_799090 ) ) ( not ( = ?auto_799088 ?auto_799091 ) ) ( not ( = ?auto_799088 ?auto_799092 ) ) ( not ( = ?auto_799088 ?auto_799093 ) ) ( not ( = ?auto_799088 ?auto_799094 ) ) ( not ( = ?auto_799088 ?auto_799095 ) ) ( not ( = ?auto_799088 ?auto_799096 ) ) ( not ( = ?auto_799088 ?auto_799097 ) ) ( not ( = ?auto_799088 ?auto_799098 ) ) ( not ( = ?auto_799088 ?auto_799099 ) ) ( not ( = ?auto_799088 ?auto_799100 ) ) ( not ( = ?auto_799088 ?auto_799101 ) ) ( not ( = ?auto_799088 ?auto_799102 ) ) ( not ( = ?auto_799089 ?auto_799090 ) ) ( not ( = ?auto_799089 ?auto_799091 ) ) ( not ( = ?auto_799089 ?auto_799092 ) ) ( not ( = ?auto_799089 ?auto_799093 ) ) ( not ( = ?auto_799089 ?auto_799094 ) ) ( not ( = ?auto_799089 ?auto_799095 ) ) ( not ( = ?auto_799089 ?auto_799096 ) ) ( not ( = ?auto_799089 ?auto_799097 ) ) ( not ( = ?auto_799089 ?auto_799098 ) ) ( not ( = ?auto_799089 ?auto_799099 ) ) ( not ( = ?auto_799089 ?auto_799100 ) ) ( not ( = ?auto_799089 ?auto_799101 ) ) ( not ( = ?auto_799089 ?auto_799102 ) ) ( not ( = ?auto_799090 ?auto_799091 ) ) ( not ( = ?auto_799090 ?auto_799092 ) ) ( not ( = ?auto_799090 ?auto_799093 ) ) ( not ( = ?auto_799090 ?auto_799094 ) ) ( not ( = ?auto_799090 ?auto_799095 ) ) ( not ( = ?auto_799090 ?auto_799096 ) ) ( not ( = ?auto_799090 ?auto_799097 ) ) ( not ( = ?auto_799090 ?auto_799098 ) ) ( not ( = ?auto_799090 ?auto_799099 ) ) ( not ( = ?auto_799090 ?auto_799100 ) ) ( not ( = ?auto_799090 ?auto_799101 ) ) ( not ( = ?auto_799090 ?auto_799102 ) ) ( not ( = ?auto_799091 ?auto_799092 ) ) ( not ( = ?auto_799091 ?auto_799093 ) ) ( not ( = ?auto_799091 ?auto_799094 ) ) ( not ( = ?auto_799091 ?auto_799095 ) ) ( not ( = ?auto_799091 ?auto_799096 ) ) ( not ( = ?auto_799091 ?auto_799097 ) ) ( not ( = ?auto_799091 ?auto_799098 ) ) ( not ( = ?auto_799091 ?auto_799099 ) ) ( not ( = ?auto_799091 ?auto_799100 ) ) ( not ( = ?auto_799091 ?auto_799101 ) ) ( not ( = ?auto_799091 ?auto_799102 ) ) ( not ( = ?auto_799092 ?auto_799093 ) ) ( not ( = ?auto_799092 ?auto_799094 ) ) ( not ( = ?auto_799092 ?auto_799095 ) ) ( not ( = ?auto_799092 ?auto_799096 ) ) ( not ( = ?auto_799092 ?auto_799097 ) ) ( not ( = ?auto_799092 ?auto_799098 ) ) ( not ( = ?auto_799092 ?auto_799099 ) ) ( not ( = ?auto_799092 ?auto_799100 ) ) ( not ( = ?auto_799092 ?auto_799101 ) ) ( not ( = ?auto_799092 ?auto_799102 ) ) ( not ( = ?auto_799093 ?auto_799094 ) ) ( not ( = ?auto_799093 ?auto_799095 ) ) ( not ( = ?auto_799093 ?auto_799096 ) ) ( not ( = ?auto_799093 ?auto_799097 ) ) ( not ( = ?auto_799093 ?auto_799098 ) ) ( not ( = ?auto_799093 ?auto_799099 ) ) ( not ( = ?auto_799093 ?auto_799100 ) ) ( not ( = ?auto_799093 ?auto_799101 ) ) ( not ( = ?auto_799093 ?auto_799102 ) ) ( not ( = ?auto_799094 ?auto_799095 ) ) ( not ( = ?auto_799094 ?auto_799096 ) ) ( not ( = ?auto_799094 ?auto_799097 ) ) ( not ( = ?auto_799094 ?auto_799098 ) ) ( not ( = ?auto_799094 ?auto_799099 ) ) ( not ( = ?auto_799094 ?auto_799100 ) ) ( not ( = ?auto_799094 ?auto_799101 ) ) ( not ( = ?auto_799094 ?auto_799102 ) ) ( not ( = ?auto_799095 ?auto_799096 ) ) ( not ( = ?auto_799095 ?auto_799097 ) ) ( not ( = ?auto_799095 ?auto_799098 ) ) ( not ( = ?auto_799095 ?auto_799099 ) ) ( not ( = ?auto_799095 ?auto_799100 ) ) ( not ( = ?auto_799095 ?auto_799101 ) ) ( not ( = ?auto_799095 ?auto_799102 ) ) ( not ( = ?auto_799096 ?auto_799097 ) ) ( not ( = ?auto_799096 ?auto_799098 ) ) ( not ( = ?auto_799096 ?auto_799099 ) ) ( not ( = ?auto_799096 ?auto_799100 ) ) ( not ( = ?auto_799096 ?auto_799101 ) ) ( not ( = ?auto_799096 ?auto_799102 ) ) ( not ( = ?auto_799097 ?auto_799098 ) ) ( not ( = ?auto_799097 ?auto_799099 ) ) ( not ( = ?auto_799097 ?auto_799100 ) ) ( not ( = ?auto_799097 ?auto_799101 ) ) ( not ( = ?auto_799097 ?auto_799102 ) ) ( not ( = ?auto_799098 ?auto_799099 ) ) ( not ( = ?auto_799098 ?auto_799100 ) ) ( not ( = ?auto_799098 ?auto_799101 ) ) ( not ( = ?auto_799098 ?auto_799102 ) ) ( not ( = ?auto_799099 ?auto_799100 ) ) ( not ( = ?auto_799099 ?auto_799101 ) ) ( not ( = ?auto_799099 ?auto_799102 ) ) ( not ( = ?auto_799100 ?auto_799101 ) ) ( not ( = ?auto_799100 ?auto_799102 ) ) ( not ( = ?auto_799101 ?auto_799102 ) ) ( ON ?auto_799100 ?auto_799101 ) ( ON ?auto_799099 ?auto_799100 ) ( ON ?auto_799098 ?auto_799099 ) ( ON ?auto_799097 ?auto_799098 ) ( CLEAR ?auto_799095 ) ( ON ?auto_799096 ?auto_799097 ) ( CLEAR ?auto_799096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_799085 ?auto_799086 ?auto_799087 ?auto_799088 ?auto_799089 ?auto_799090 ?auto_799091 ?auto_799092 ?auto_799093 ?auto_799094 ?auto_799095 ?auto_799096 )
      ( MAKE-17PILE ?auto_799085 ?auto_799086 ?auto_799087 ?auto_799088 ?auto_799089 ?auto_799090 ?auto_799091 ?auto_799092 ?auto_799093 ?auto_799094 ?auto_799095 ?auto_799096 ?auto_799097 ?auto_799098 ?auto_799099 ?auto_799100 ?auto_799101 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_799155 - BLOCK
      ?auto_799156 - BLOCK
      ?auto_799157 - BLOCK
      ?auto_799158 - BLOCK
      ?auto_799159 - BLOCK
      ?auto_799160 - BLOCK
      ?auto_799161 - BLOCK
      ?auto_799162 - BLOCK
      ?auto_799163 - BLOCK
      ?auto_799164 - BLOCK
      ?auto_799165 - BLOCK
      ?auto_799166 - BLOCK
      ?auto_799167 - BLOCK
      ?auto_799168 - BLOCK
      ?auto_799169 - BLOCK
      ?auto_799170 - BLOCK
      ?auto_799171 - BLOCK
    )
    :vars
    (
      ?auto_799172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_799171 ?auto_799172 ) ( ON-TABLE ?auto_799155 ) ( ON ?auto_799156 ?auto_799155 ) ( ON ?auto_799157 ?auto_799156 ) ( ON ?auto_799158 ?auto_799157 ) ( ON ?auto_799159 ?auto_799158 ) ( ON ?auto_799160 ?auto_799159 ) ( ON ?auto_799161 ?auto_799160 ) ( ON ?auto_799162 ?auto_799161 ) ( ON ?auto_799163 ?auto_799162 ) ( ON ?auto_799164 ?auto_799163 ) ( not ( = ?auto_799155 ?auto_799156 ) ) ( not ( = ?auto_799155 ?auto_799157 ) ) ( not ( = ?auto_799155 ?auto_799158 ) ) ( not ( = ?auto_799155 ?auto_799159 ) ) ( not ( = ?auto_799155 ?auto_799160 ) ) ( not ( = ?auto_799155 ?auto_799161 ) ) ( not ( = ?auto_799155 ?auto_799162 ) ) ( not ( = ?auto_799155 ?auto_799163 ) ) ( not ( = ?auto_799155 ?auto_799164 ) ) ( not ( = ?auto_799155 ?auto_799165 ) ) ( not ( = ?auto_799155 ?auto_799166 ) ) ( not ( = ?auto_799155 ?auto_799167 ) ) ( not ( = ?auto_799155 ?auto_799168 ) ) ( not ( = ?auto_799155 ?auto_799169 ) ) ( not ( = ?auto_799155 ?auto_799170 ) ) ( not ( = ?auto_799155 ?auto_799171 ) ) ( not ( = ?auto_799155 ?auto_799172 ) ) ( not ( = ?auto_799156 ?auto_799157 ) ) ( not ( = ?auto_799156 ?auto_799158 ) ) ( not ( = ?auto_799156 ?auto_799159 ) ) ( not ( = ?auto_799156 ?auto_799160 ) ) ( not ( = ?auto_799156 ?auto_799161 ) ) ( not ( = ?auto_799156 ?auto_799162 ) ) ( not ( = ?auto_799156 ?auto_799163 ) ) ( not ( = ?auto_799156 ?auto_799164 ) ) ( not ( = ?auto_799156 ?auto_799165 ) ) ( not ( = ?auto_799156 ?auto_799166 ) ) ( not ( = ?auto_799156 ?auto_799167 ) ) ( not ( = ?auto_799156 ?auto_799168 ) ) ( not ( = ?auto_799156 ?auto_799169 ) ) ( not ( = ?auto_799156 ?auto_799170 ) ) ( not ( = ?auto_799156 ?auto_799171 ) ) ( not ( = ?auto_799156 ?auto_799172 ) ) ( not ( = ?auto_799157 ?auto_799158 ) ) ( not ( = ?auto_799157 ?auto_799159 ) ) ( not ( = ?auto_799157 ?auto_799160 ) ) ( not ( = ?auto_799157 ?auto_799161 ) ) ( not ( = ?auto_799157 ?auto_799162 ) ) ( not ( = ?auto_799157 ?auto_799163 ) ) ( not ( = ?auto_799157 ?auto_799164 ) ) ( not ( = ?auto_799157 ?auto_799165 ) ) ( not ( = ?auto_799157 ?auto_799166 ) ) ( not ( = ?auto_799157 ?auto_799167 ) ) ( not ( = ?auto_799157 ?auto_799168 ) ) ( not ( = ?auto_799157 ?auto_799169 ) ) ( not ( = ?auto_799157 ?auto_799170 ) ) ( not ( = ?auto_799157 ?auto_799171 ) ) ( not ( = ?auto_799157 ?auto_799172 ) ) ( not ( = ?auto_799158 ?auto_799159 ) ) ( not ( = ?auto_799158 ?auto_799160 ) ) ( not ( = ?auto_799158 ?auto_799161 ) ) ( not ( = ?auto_799158 ?auto_799162 ) ) ( not ( = ?auto_799158 ?auto_799163 ) ) ( not ( = ?auto_799158 ?auto_799164 ) ) ( not ( = ?auto_799158 ?auto_799165 ) ) ( not ( = ?auto_799158 ?auto_799166 ) ) ( not ( = ?auto_799158 ?auto_799167 ) ) ( not ( = ?auto_799158 ?auto_799168 ) ) ( not ( = ?auto_799158 ?auto_799169 ) ) ( not ( = ?auto_799158 ?auto_799170 ) ) ( not ( = ?auto_799158 ?auto_799171 ) ) ( not ( = ?auto_799158 ?auto_799172 ) ) ( not ( = ?auto_799159 ?auto_799160 ) ) ( not ( = ?auto_799159 ?auto_799161 ) ) ( not ( = ?auto_799159 ?auto_799162 ) ) ( not ( = ?auto_799159 ?auto_799163 ) ) ( not ( = ?auto_799159 ?auto_799164 ) ) ( not ( = ?auto_799159 ?auto_799165 ) ) ( not ( = ?auto_799159 ?auto_799166 ) ) ( not ( = ?auto_799159 ?auto_799167 ) ) ( not ( = ?auto_799159 ?auto_799168 ) ) ( not ( = ?auto_799159 ?auto_799169 ) ) ( not ( = ?auto_799159 ?auto_799170 ) ) ( not ( = ?auto_799159 ?auto_799171 ) ) ( not ( = ?auto_799159 ?auto_799172 ) ) ( not ( = ?auto_799160 ?auto_799161 ) ) ( not ( = ?auto_799160 ?auto_799162 ) ) ( not ( = ?auto_799160 ?auto_799163 ) ) ( not ( = ?auto_799160 ?auto_799164 ) ) ( not ( = ?auto_799160 ?auto_799165 ) ) ( not ( = ?auto_799160 ?auto_799166 ) ) ( not ( = ?auto_799160 ?auto_799167 ) ) ( not ( = ?auto_799160 ?auto_799168 ) ) ( not ( = ?auto_799160 ?auto_799169 ) ) ( not ( = ?auto_799160 ?auto_799170 ) ) ( not ( = ?auto_799160 ?auto_799171 ) ) ( not ( = ?auto_799160 ?auto_799172 ) ) ( not ( = ?auto_799161 ?auto_799162 ) ) ( not ( = ?auto_799161 ?auto_799163 ) ) ( not ( = ?auto_799161 ?auto_799164 ) ) ( not ( = ?auto_799161 ?auto_799165 ) ) ( not ( = ?auto_799161 ?auto_799166 ) ) ( not ( = ?auto_799161 ?auto_799167 ) ) ( not ( = ?auto_799161 ?auto_799168 ) ) ( not ( = ?auto_799161 ?auto_799169 ) ) ( not ( = ?auto_799161 ?auto_799170 ) ) ( not ( = ?auto_799161 ?auto_799171 ) ) ( not ( = ?auto_799161 ?auto_799172 ) ) ( not ( = ?auto_799162 ?auto_799163 ) ) ( not ( = ?auto_799162 ?auto_799164 ) ) ( not ( = ?auto_799162 ?auto_799165 ) ) ( not ( = ?auto_799162 ?auto_799166 ) ) ( not ( = ?auto_799162 ?auto_799167 ) ) ( not ( = ?auto_799162 ?auto_799168 ) ) ( not ( = ?auto_799162 ?auto_799169 ) ) ( not ( = ?auto_799162 ?auto_799170 ) ) ( not ( = ?auto_799162 ?auto_799171 ) ) ( not ( = ?auto_799162 ?auto_799172 ) ) ( not ( = ?auto_799163 ?auto_799164 ) ) ( not ( = ?auto_799163 ?auto_799165 ) ) ( not ( = ?auto_799163 ?auto_799166 ) ) ( not ( = ?auto_799163 ?auto_799167 ) ) ( not ( = ?auto_799163 ?auto_799168 ) ) ( not ( = ?auto_799163 ?auto_799169 ) ) ( not ( = ?auto_799163 ?auto_799170 ) ) ( not ( = ?auto_799163 ?auto_799171 ) ) ( not ( = ?auto_799163 ?auto_799172 ) ) ( not ( = ?auto_799164 ?auto_799165 ) ) ( not ( = ?auto_799164 ?auto_799166 ) ) ( not ( = ?auto_799164 ?auto_799167 ) ) ( not ( = ?auto_799164 ?auto_799168 ) ) ( not ( = ?auto_799164 ?auto_799169 ) ) ( not ( = ?auto_799164 ?auto_799170 ) ) ( not ( = ?auto_799164 ?auto_799171 ) ) ( not ( = ?auto_799164 ?auto_799172 ) ) ( not ( = ?auto_799165 ?auto_799166 ) ) ( not ( = ?auto_799165 ?auto_799167 ) ) ( not ( = ?auto_799165 ?auto_799168 ) ) ( not ( = ?auto_799165 ?auto_799169 ) ) ( not ( = ?auto_799165 ?auto_799170 ) ) ( not ( = ?auto_799165 ?auto_799171 ) ) ( not ( = ?auto_799165 ?auto_799172 ) ) ( not ( = ?auto_799166 ?auto_799167 ) ) ( not ( = ?auto_799166 ?auto_799168 ) ) ( not ( = ?auto_799166 ?auto_799169 ) ) ( not ( = ?auto_799166 ?auto_799170 ) ) ( not ( = ?auto_799166 ?auto_799171 ) ) ( not ( = ?auto_799166 ?auto_799172 ) ) ( not ( = ?auto_799167 ?auto_799168 ) ) ( not ( = ?auto_799167 ?auto_799169 ) ) ( not ( = ?auto_799167 ?auto_799170 ) ) ( not ( = ?auto_799167 ?auto_799171 ) ) ( not ( = ?auto_799167 ?auto_799172 ) ) ( not ( = ?auto_799168 ?auto_799169 ) ) ( not ( = ?auto_799168 ?auto_799170 ) ) ( not ( = ?auto_799168 ?auto_799171 ) ) ( not ( = ?auto_799168 ?auto_799172 ) ) ( not ( = ?auto_799169 ?auto_799170 ) ) ( not ( = ?auto_799169 ?auto_799171 ) ) ( not ( = ?auto_799169 ?auto_799172 ) ) ( not ( = ?auto_799170 ?auto_799171 ) ) ( not ( = ?auto_799170 ?auto_799172 ) ) ( not ( = ?auto_799171 ?auto_799172 ) ) ( ON ?auto_799170 ?auto_799171 ) ( ON ?auto_799169 ?auto_799170 ) ( ON ?auto_799168 ?auto_799169 ) ( ON ?auto_799167 ?auto_799168 ) ( ON ?auto_799166 ?auto_799167 ) ( CLEAR ?auto_799164 ) ( ON ?auto_799165 ?auto_799166 ) ( CLEAR ?auto_799165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_799155 ?auto_799156 ?auto_799157 ?auto_799158 ?auto_799159 ?auto_799160 ?auto_799161 ?auto_799162 ?auto_799163 ?auto_799164 ?auto_799165 )
      ( MAKE-17PILE ?auto_799155 ?auto_799156 ?auto_799157 ?auto_799158 ?auto_799159 ?auto_799160 ?auto_799161 ?auto_799162 ?auto_799163 ?auto_799164 ?auto_799165 ?auto_799166 ?auto_799167 ?auto_799168 ?auto_799169 ?auto_799170 ?auto_799171 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_799225 - BLOCK
      ?auto_799226 - BLOCK
      ?auto_799227 - BLOCK
      ?auto_799228 - BLOCK
      ?auto_799229 - BLOCK
      ?auto_799230 - BLOCK
      ?auto_799231 - BLOCK
      ?auto_799232 - BLOCK
      ?auto_799233 - BLOCK
      ?auto_799234 - BLOCK
      ?auto_799235 - BLOCK
      ?auto_799236 - BLOCK
      ?auto_799237 - BLOCK
      ?auto_799238 - BLOCK
      ?auto_799239 - BLOCK
      ?auto_799240 - BLOCK
      ?auto_799241 - BLOCK
    )
    :vars
    (
      ?auto_799242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_799241 ?auto_799242 ) ( ON-TABLE ?auto_799225 ) ( ON ?auto_799226 ?auto_799225 ) ( ON ?auto_799227 ?auto_799226 ) ( ON ?auto_799228 ?auto_799227 ) ( ON ?auto_799229 ?auto_799228 ) ( ON ?auto_799230 ?auto_799229 ) ( ON ?auto_799231 ?auto_799230 ) ( ON ?auto_799232 ?auto_799231 ) ( ON ?auto_799233 ?auto_799232 ) ( not ( = ?auto_799225 ?auto_799226 ) ) ( not ( = ?auto_799225 ?auto_799227 ) ) ( not ( = ?auto_799225 ?auto_799228 ) ) ( not ( = ?auto_799225 ?auto_799229 ) ) ( not ( = ?auto_799225 ?auto_799230 ) ) ( not ( = ?auto_799225 ?auto_799231 ) ) ( not ( = ?auto_799225 ?auto_799232 ) ) ( not ( = ?auto_799225 ?auto_799233 ) ) ( not ( = ?auto_799225 ?auto_799234 ) ) ( not ( = ?auto_799225 ?auto_799235 ) ) ( not ( = ?auto_799225 ?auto_799236 ) ) ( not ( = ?auto_799225 ?auto_799237 ) ) ( not ( = ?auto_799225 ?auto_799238 ) ) ( not ( = ?auto_799225 ?auto_799239 ) ) ( not ( = ?auto_799225 ?auto_799240 ) ) ( not ( = ?auto_799225 ?auto_799241 ) ) ( not ( = ?auto_799225 ?auto_799242 ) ) ( not ( = ?auto_799226 ?auto_799227 ) ) ( not ( = ?auto_799226 ?auto_799228 ) ) ( not ( = ?auto_799226 ?auto_799229 ) ) ( not ( = ?auto_799226 ?auto_799230 ) ) ( not ( = ?auto_799226 ?auto_799231 ) ) ( not ( = ?auto_799226 ?auto_799232 ) ) ( not ( = ?auto_799226 ?auto_799233 ) ) ( not ( = ?auto_799226 ?auto_799234 ) ) ( not ( = ?auto_799226 ?auto_799235 ) ) ( not ( = ?auto_799226 ?auto_799236 ) ) ( not ( = ?auto_799226 ?auto_799237 ) ) ( not ( = ?auto_799226 ?auto_799238 ) ) ( not ( = ?auto_799226 ?auto_799239 ) ) ( not ( = ?auto_799226 ?auto_799240 ) ) ( not ( = ?auto_799226 ?auto_799241 ) ) ( not ( = ?auto_799226 ?auto_799242 ) ) ( not ( = ?auto_799227 ?auto_799228 ) ) ( not ( = ?auto_799227 ?auto_799229 ) ) ( not ( = ?auto_799227 ?auto_799230 ) ) ( not ( = ?auto_799227 ?auto_799231 ) ) ( not ( = ?auto_799227 ?auto_799232 ) ) ( not ( = ?auto_799227 ?auto_799233 ) ) ( not ( = ?auto_799227 ?auto_799234 ) ) ( not ( = ?auto_799227 ?auto_799235 ) ) ( not ( = ?auto_799227 ?auto_799236 ) ) ( not ( = ?auto_799227 ?auto_799237 ) ) ( not ( = ?auto_799227 ?auto_799238 ) ) ( not ( = ?auto_799227 ?auto_799239 ) ) ( not ( = ?auto_799227 ?auto_799240 ) ) ( not ( = ?auto_799227 ?auto_799241 ) ) ( not ( = ?auto_799227 ?auto_799242 ) ) ( not ( = ?auto_799228 ?auto_799229 ) ) ( not ( = ?auto_799228 ?auto_799230 ) ) ( not ( = ?auto_799228 ?auto_799231 ) ) ( not ( = ?auto_799228 ?auto_799232 ) ) ( not ( = ?auto_799228 ?auto_799233 ) ) ( not ( = ?auto_799228 ?auto_799234 ) ) ( not ( = ?auto_799228 ?auto_799235 ) ) ( not ( = ?auto_799228 ?auto_799236 ) ) ( not ( = ?auto_799228 ?auto_799237 ) ) ( not ( = ?auto_799228 ?auto_799238 ) ) ( not ( = ?auto_799228 ?auto_799239 ) ) ( not ( = ?auto_799228 ?auto_799240 ) ) ( not ( = ?auto_799228 ?auto_799241 ) ) ( not ( = ?auto_799228 ?auto_799242 ) ) ( not ( = ?auto_799229 ?auto_799230 ) ) ( not ( = ?auto_799229 ?auto_799231 ) ) ( not ( = ?auto_799229 ?auto_799232 ) ) ( not ( = ?auto_799229 ?auto_799233 ) ) ( not ( = ?auto_799229 ?auto_799234 ) ) ( not ( = ?auto_799229 ?auto_799235 ) ) ( not ( = ?auto_799229 ?auto_799236 ) ) ( not ( = ?auto_799229 ?auto_799237 ) ) ( not ( = ?auto_799229 ?auto_799238 ) ) ( not ( = ?auto_799229 ?auto_799239 ) ) ( not ( = ?auto_799229 ?auto_799240 ) ) ( not ( = ?auto_799229 ?auto_799241 ) ) ( not ( = ?auto_799229 ?auto_799242 ) ) ( not ( = ?auto_799230 ?auto_799231 ) ) ( not ( = ?auto_799230 ?auto_799232 ) ) ( not ( = ?auto_799230 ?auto_799233 ) ) ( not ( = ?auto_799230 ?auto_799234 ) ) ( not ( = ?auto_799230 ?auto_799235 ) ) ( not ( = ?auto_799230 ?auto_799236 ) ) ( not ( = ?auto_799230 ?auto_799237 ) ) ( not ( = ?auto_799230 ?auto_799238 ) ) ( not ( = ?auto_799230 ?auto_799239 ) ) ( not ( = ?auto_799230 ?auto_799240 ) ) ( not ( = ?auto_799230 ?auto_799241 ) ) ( not ( = ?auto_799230 ?auto_799242 ) ) ( not ( = ?auto_799231 ?auto_799232 ) ) ( not ( = ?auto_799231 ?auto_799233 ) ) ( not ( = ?auto_799231 ?auto_799234 ) ) ( not ( = ?auto_799231 ?auto_799235 ) ) ( not ( = ?auto_799231 ?auto_799236 ) ) ( not ( = ?auto_799231 ?auto_799237 ) ) ( not ( = ?auto_799231 ?auto_799238 ) ) ( not ( = ?auto_799231 ?auto_799239 ) ) ( not ( = ?auto_799231 ?auto_799240 ) ) ( not ( = ?auto_799231 ?auto_799241 ) ) ( not ( = ?auto_799231 ?auto_799242 ) ) ( not ( = ?auto_799232 ?auto_799233 ) ) ( not ( = ?auto_799232 ?auto_799234 ) ) ( not ( = ?auto_799232 ?auto_799235 ) ) ( not ( = ?auto_799232 ?auto_799236 ) ) ( not ( = ?auto_799232 ?auto_799237 ) ) ( not ( = ?auto_799232 ?auto_799238 ) ) ( not ( = ?auto_799232 ?auto_799239 ) ) ( not ( = ?auto_799232 ?auto_799240 ) ) ( not ( = ?auto_799232 ?auto_799241 ) ) ( not ( = ?auto_799232 ?auto_799242 ) ) ( not ( = ?auto_799233 ?auto_799234 ) ) ( not ( = ?auto_799233 ?auto_799235 ) ) ( not ( = ?auto_799233 ?auto_799236 ) ) ( not ( = ?auto_799233 ?auto_799237 ) ) ( not ( = ?auto_799233 ?auto_799238 ) ) ( not ( = ?auto_799233 ?auto_799239 ) ) ( not ( = ?auto_799233 ?auto_799240 ) ) ( not ( = ?auto_799233 ?auto_799241 ) ) ( not ( = ?auto_799233 ?auto_799242 ) ) ( not ( = ?auto_799234 ?auto_799235 ) ) ( not ( = ?auto_799234 ?auto_799236 ) ) ( not ( = ?auto_799234 ?auto_799237 ) ) ( not ( = ?auto_799234 ?auto_799238 ) ) ( not ( = ?auto_799234 ?auto_799239 ) ) ( not ( = ?auto_799234 ?auto_799240 ) ) ( not ( = ?auto_799234 ?auto_799241 ) ) ( not ( = ?auto_799234 ?auto_799242 ) ) ( not ( = ?auto_799235 ?auto_799236 ) ) ( not ( = ?auto_799235 ?auto_799237 ) ) ( not ( = ?auto_799235 ?auto_799238 ) ) ( not ( = ?auto_799235 ?auto_799239 ) ) ( not ( = ?auto_799235 ?auto_799240 ) ) ( not ( = ?auto_799235 ?auto_799241 ) ) ( not ( = ?auto_799235 ?auto_799242 ) ) ( not ( = ?auto_799236 ?auto_799237 ) ) ( not ( = ?auto_799236 ?auto_799238 ) ) ( not ( = ?auto_799236 ?auto_799239 ) ) ( not ( = ?auto_799236 ?auto_799240 ) ) ( not ( = ?auto_799236 ?auto_799241 ) ) ( not ( = ?auto_799236 ?auto_799242 ) ) ( not ( = ?auto_799237 ?auto_799238 ) ) ( not ( = ?auto_799237 ?auto_799239 ) ) ( not ( = ?auto_799237 ?auto_799240 ) ) ( not ( = ?auto_799237 ?auto_799241 ) ) ( not ( = ?auto_799237 ?auto_799242 ) ) ( not ( = ?auto_799238 ?auto_799239 ) ) ( not ( = ?auto_799238 ?auto_799240 ) ) ( not ( = ?auto_799238 ?auto_799241 ) ) ( not ( = ?auto_799238 ?auto_799242 ) ) ( not ( = ?auto_799239 ?auto_799240 ) ) ( not ( = ?auto_799239 ?auto_799241 ) ) ( not ( = ?auto_799239 ?auto_799242 ) ) ( not ( = ?auto_799240 ?auto_799241 ) ) ( not ( = ?auto_799240 ?auto_799242 ) ) ( not ( = ?auto_799241 ?auto_799242 ) ) ( ON ?auto_799240 ?auto_799241 ) ( ON ?auto_799239 ?auto_799240 ) ( ON ?auto_799238 ?auto_799239 ) ( ON ?auto_799237 ?auto_799238 ) ( ON ?auto_799236 ?auto_799237 ) ( ON ?auto_799235 ?auto_799236 ) ( CLEAR ?auto_799233 ) ( ON ?auto_799234 ?auto_799235 ) ( CLEAR ?auto_799234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_799225 ?auto_799226 ?auto_799227 ?auto_799228 ?auto_799229 ?auto_799230 ?auto_799231 ?auto_799232 ?auto_799233 ?auto_799234 )
      ( MAKE-17PILE ?auto_799225 ?auto_799226 ?auto_799227 ?auto_799228 ?auto_799229 ?auto_799230 ?auto_799231 ?auto_799232 ?auto_799233 ?auto_799234 ?auto_799235 ?auto_799236 ?auto_799237 ?auto_799238 ?auto_799239 ?auto_799240 ?auto_799241 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_799295 - BLOCK
      ?auto_799296 - BLOCK
      ?auto_799297 - BLOCK
      ?auto_799298 - BLOCK
      ?auto_799299 - BLOCK
      ?auto_799300 - BLOCK
      ?auto_799301 - BLOCK
      ?auto_799302 - BLOCK
      ?auto_799303 - BLOCK
      ?auto_799304 - BLOCK
      ?auto_799305 - BLOCK
      ?auto_799306 - BLOCK
      ?auto_799307 - BLOCK
      ?auto_799308 - BLOCK
      ?auto_799309 - BLOCK
      ?auto_799310 - BLOCK
      ?auto_799311 - BLOCK
    )
    :vars
    (
      ?auto_799312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_799311 ?auto_799312 ) ( ON-TABLE ?auto_799295 ) ( ON ?auto_799296 ?auto_799295 ) ( ON ?auto_799297 ?auto_799296 ) ( ON ?auto_799298 ?auto_799297 ) ( ON ?auto_799299 ?auto_799298 ) ( ON ?auto_799300 ?auto_799299 ) ( ON ?auto_799301 ?auto_799300 ) ( ON ?auto_799302 ?auto_799301 ) ( not ( = ?auto_799295 ?auto_799296 ) ) ( not ( = ?auto_799295 ?auto_799297 ) ) ( not ( = ?auto_799295 ?auto_799298 ) ) ( not ( = ?auto_799295 ?auto_799299 ) ) ( not ( = ?auto_799295 ?auto_799300 ) ) ( not ( = ?auto_799295 ?auto_799301 ) ) ( not ( = ?auto_799295 ?auto_799302 ) ) ( not ( = ?auto_799295 ?auto_799303 ) ) ( not ( = ?auto_799295 ?auto_799304 ) ) ( not ( = ?auto_799295 ?auto_799305 ) ) ( not ( = ?auto_799295 ?auto_799306 ) ) ( not ( = ?auto_799295 ?auto_799307 ) ) ( not ( = ?auto_799295 ?auto_799308 ) ) ( not ( = ?auto_799295 ?auto_799309 ) ) ( not ( = ?auto_799295 ?auto_799310 ) ) ( not ( = ?auto_799295 ?auto_799311 ) ) ( not ( = ?auto_799295 ?auto_799312 ) ) ( not ( = ?auto_799296 ?auto_799297 ) ) ( not ( = ?auto_799296 ?auto_799298 ) ) ( not ( = ?auto_799296 ?auto_799299 ) ) ( not ( = ?auto_799296 ?auto_799300 ) ) ( not ( = ?auto_799296 ?auto_799301 ) ) ( not ( = ?auto_799296 ?auto_799302 ) ) ( not ( = ?auto_799296 ?auto_799303 ) ) ( not ( = ?auto_799296 ?auto_799304 ) ) ( not ( = ?auto_799296 ?auto_799305 ) ) ( not ( = ?auto_799296 ?auto_799306 ) ) ( not ( = ?auto_799296 ?auto_799307 ) ) ( not ( = ?auto_799296 ?auto_799308 ) ) ( not ( = ?auto_799296 ?auto_799309 ) ) ( not ( = ?auto_799296 ?auto_799310 ) ) ( not ( = ?auto_799296 ?auto_799311 ) ) ( not ( = ?auto_799296 ?auto_799312 ) ) ( not ( = ?auto_799297 ?auto_799298 ) ) ( not ( = ?auto_799297 ?auto_799299 ) ) ( not ( = ?auto_799297 ?auto_799300 ) ) ( not ( = ?auto_799297 ?auto_799301 ) ) ( not ( = ?auto_799297 ?auto_799302 ) ) ( not ( = ?auto_799297 ?auto_799303 ) ) ( not ( = ?auto_799297 ?auto_799304 ) ) ( not ( = ?auto_799297 ?auto_799305 ) ) ( not ( = ?auto_799297 ?auto_799306 ) ) ( not ( = ?auto_799297 ?auto_799307 ) ) ( not ( = ?auto_799297 ?auto_799308 ) ) ( not ( = ?auto_799297 ?auto_799309 ) ) ( not ( = ?auto_799297 ?auto_799310 ) ) ( not ( = ?auto_799297 ?auto_799311 ) ) ( not ( = ?auto_799297 ?auto_799312 ) ) ( not ( = ?auto_799298 ?auto_799299 ) ) ( not ( = ?auto_799298 ?auto_799300 ) ) ( not ( = ?auto_799298 ?auto_799301 ) ) ( not ( = ?auto_799298 ?auto_799302 ) ) ( not ( = ?auto_799298 ?auto_799303 ) ) ( not ( = ?auto_799298 ?auto_799304 ) ) ( not ( = ?auto_799298 ?auto_799305 ) ) ( not ( = ?auto_799298 ?auto_799306 ) ) ( not ( = ?auto_799298 ?auto_799307 ) ) ( not ( = ?auto_799298 ?auto_799308 ) ) ( not ( = ?auto_799298 ?auto_799309 ) ) ( not ( = ?auto_799298 ?auto_799310 ) ) ( not ( = ?auto_799298 ?auto_799311 ) ) ( not ( = ?auto_799298 ?auto_799312 ) ) ( not ( = ?auto_799299 ?auto_799300 ) ) ( not ( = ?auto_799299 ?auto_799301 ) ) ( not ( = ?auto_799299 ?auto_799302 ) ) ( not ( = ?auto_799299 ?auto_799303 ) ) ( not ( = ?auto_799299 ?auto_799304 ) ) ( not ( = ?auto_799299 ?auto_799305 ) ) ( not ( = ?auto_799299 ?auto_799306 ) ) ( not ( = ?auto_799299 ?auto_799307 ) ) ( not ( = ?auto_799299 ?auto_799308 ) ) ( not ( = ?auto_799299 ?auto_799309 ) ) ( not ( = ?auto_799299 ?auto_799310 ) ) ( not ( = ?auto_799299 ?auto_799311 ) ) ( not ( = ?auto_799299 ?auto_799312 ) ) ( not ( = ?auto_799300 ?auto_799301 ) ) ( not ( = ?auto_799300 ?auto_799302 ) ) ( not ( = ?auto_799300 ?auto_799303 ) ) ( not ( = ?auto_799300 ?auto_799304 ) ) ( not ( = ?auto_799300 ?auto_799305 ) ) ( not ( = ?auto_799300 ?auto_799306 ) ) ( not ( = ?auto_799300 ?auto_799307 ) ) ( not ( = ?auto_799300 ?auto_799308 ) ) ( not ( = ?auto_799300 ?auto_799309 ) ) ( not ( = ?auto_799300 ?auto_799310 ) ) ( not ( = ?auto_799300 ?auto_799311 ) ) ( not ( = ?auto_799300 ?auto_799312 ) ) ( not ( = ?auto_799301 ?auto_799302 ) ) ( not ( = ?auto_799301 ?auto_799303 ) ) ( not ( = ?auto_799301 ?auto_799304 ) ) ( not ( = ?auto_799301 ?auto_799305 ) ) ( not ( = ?auto_799301 ?auto_799306 ) ) ( not ( = ?auto_799301 ?auto_799307 ) ) ( not ( = ?auto_799301 ?auto_799308 ) ) ( not ( = ?auto_799301 ?auto_799309 ) ) ( not ( = ?auto_799301 ?auto_799310 ) ) ( not ( = ?auto_799301 ?auto_799311 ) ) ( not ( = ?auto_799301 ?auto_799312 ) ) ( not ( = ?auto_799302 ?auto_799303 ) ) ( not ( = ?auto_799302 ?auto_799304 ) ) ( not ( = ?auto_799302 ?auto_799305 ) ) ( not ( = ?auto_799302 ?auto_799306 ) ) ( not ( = ?auto_799302 ?auto_799307 ) ) ( not ( = ?auto_799302 ?auto_799308 ) ) ( not ( = ?auto_799302 ?auto_799309 ) ) ( not ( = ?auto_799302 ?auto_799310 ) ) ( not ( = ?auto_799302 ?auto_799311 ) ) ( not ( = ?auto_799302 ?auto_799312 ) ) ( not ( = ?auto_799303 ?auto_799304 ) ) ( not ( = ?auto_799303 ?auto_799305 ) ) ( not ( = ?auto_799303 ?auto_799306 ) ) ( not ( = ?auto_799303 ?auto_799307 ) ) ( not ( = ?auto_799303 ?auto_799308 ) ) ( not ( = ?auto_799303 ?auto_799309 ) ) ( not ( = ?auto_799303 ?auto_799310 ) ) ( not ( = ?auto_799303 ?auto_799311 ) ) ( not ( = ?auto_799303 ?auto_799312 ) ) ( not ( = ?auto_799304 ?auto_799305 ) ) ( not ( = ?auto_799304 ?auto_799306 ) ) ( not ( = ?auto_799304 ?auto_799307 ) ) ( not ( = ?auto_799304 ?auto_799308 ) ) ( not ( = ?auto_799304 ?auto_799309 ) ) ( not ( = ?auto_799304 ?auto_799310 ) ) ( not ( = ?auto_799304 ?auto_799311 ) ) ( not ( = ?auto_799304 ?auto_799312 ) ) ( not ( = ?auto_799305 ?auto_799306 ) ) ( not ( = ?auto_799305 ?auto_799307 ) ) ( not ( = ?auto_799305 ?auto_799308 ) ) ( not ( = ?auto_799305 ?auto_799309 ) ) ( not ( = ?auto_799305 ?auto_799310 ) ) ( not ( = ?auto_799305 ?auto_799311 ) ) ( not ( = ?auto_799305 ?auto_799312 ) ) ( not ( = ?auto_799306 ?auto_799307 ) ) ( not ( = ?auto_799306 ?auto_799308 ) ) ( not ( = ?auto_799306 ?auto_799309 ) ) ( not ( = ?auto_799306 ?auto_799310 ) ) ( not ( = ?auto_799306 ?auto_799311 ) ) ( not ( = ?auto_799306 ?auto_799312 ) ) ( not ( = ?auto_799307 ?auto_799308 ) ) ( not ( = ?auto_799307 ?auto_799309 ) ) ( not ( = ?auto_799307 ?auto_799310 ) ) ( not ( = ?auto_799307 ?auto_799311 ) ) ( not ( = ?auto_799307 ?auto_799312 ) ) ( not ( = ?auto_799308 ?auto_799309 ) ) ( not ( = ?auto_799308 ?auto_799310 ) ) ( not ( = ?auto_799308 ?auto_799311 ) ) ( not ( = ?auto_799308 ?auto_799312 ) ) ( not ( = ?auto_799309 ?auto_799310 ) ) ( not ( = ?auto_799309 ?auto_799311 ) ) ( not ( = ?auto_799309 ?auto_799312 ) ) ( not ( = ?auto_799310 ?auto_799311 ) ) ( not ( = ?auto_799310 ?auto_799312 ) ) ( not ( = ?auto_799311 ?auto_799312 ) ) ( ON ?auto_799310 ?auto_799311 ) ( ON ?auto_799309 ?auto_799310 ) ( ON ?auto_799308 ?auto_799309 ) ( ON ?auto_799307 ?auto_799308 ) ( ON ?auto_799306 ?auto_799307 ) ( ON ?auto_799305 ?auto_799306 ) ( ON ?auto_799304 ?auto_799305 ) ( CLEAR ?auto_799302 ) ( ON ?auto_799303 ?auto_799304 ) ( CLEAR ?auto_799303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_799295 ?auto_799296 ?auto_799297 ?auto_799298 ?auto_799299 ?auto_799300 ?auto_799301 ?auto_799302 ?auto_799303 )
      ( MAKE-17PILE ?auto_799295 ?auto_799296 ?auto_799297 ?auto_799298 ?auto_799299 ?auto_799300 ?auto_799301 ?auto_799302 ?auto_799303 ?auto_799304 ?auto_799305 ?auto_799306 ?auto_799307 ?auto_799308 ?auto_799309 ?auto_799310 ?auto_799311 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_799365 - BLOCK
      ?auto_799366 - BLOCK
      ?auto_799367 - BLOCK
      ?auto_799368 - BLOCK
      ?auto_799369 - BLOCK
      ?auto_799370 - BLOCK
      ?auto_799371 - BLOCK
      ?auto_799372 - BLOCK
      ?auto_799373 - BLOCK
      ?auto_799374 - BLOCK
      ?auto_799375 - BLOCK
      ?auto_799376 - BLOCK
      ?auto_799377 - BLOCK
      ?auto_799378 - BLOCK
      ?auto_799379 - BLOCK
      ?auto_799380 - BLOCK
      ?auto_799381 - BLOCK
    )
    :vars
    (
      ?auto_799382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_799381 ?auto_799382 ) ( ON-TABLE ?auto_799365 ) ( ON ?auto_799366 ?auto_799365 ) ( ON ?auto_799367 ?auto_799366 ) ( ON ?auto_799368 ?auto_799367 ) ( ON ?auto_799369 ?auto_799368 ) ( ON ?auto_799370 ?auto_799369 ) ( ON ?auto_799371 ?auto_799370 ) ( not ( = ?auto_799365 ?auto_799366 ) ) ( not ( = ?auto_799365 ?auto_799367 ) ) ( not ( = ?auto_799365 ?auto_799368 ) ) ( not ( = ?auto_799365 ?auto_799369 ) ) ( not ( = ?auto_799365 ?auto_799370 ) ) ( not ( = ?auto_799365 ?auto_799371 ) ) ( not ( = ?auto_799365 ?auto_799372 ) ) ( not ( = ?auto_799365 ?auto_799373 ) ) ( not ( = ?auto_799365 ?auto_799374 ) ) ( not ( = ?auto_799365 ?auto_799375 ) ) ( not ( = ?auto_799365 ?auto_799376 ) ) ( not ( = ?auto_799365 ?auto_799377 ) ) ( not ( = ?auto_799365 ?auto_799378 ) ) ( not ( = ?auto_799365 ?auto_799379 ) ) ( not ( = ?auto_799365 ?auto_799380 ) ) ( not ( = ?auto_799365 ?auto_799381 ) ) ( not ( = ?auto_799365 ?auto_799382 ) ) ( not ( = ?auto_799366 ?auto_799367 ) ) ( not ( = ?auto_799366 ?auto_799368 ) ) ( not ( = ?auto_799366 ?auto_799369 ) ) ( not ( = ?auto_799366 ?auto_799370 ) ) ( not ( = ?auto_799366 ?auto_799371 ) ) ( not ( = ?auto_799366 ?auto_799372 ) ) ( not ( = ?auto_799366 ?auto_799373 ) ) ( not ( = ?auto_799366 ?auto_799374 ) ) ( not ( = ?auto_799366 ?auto_799375 ) ) ( not ( = ?auto_799366 ?auto_799376 ) ) ( not ( = ?auto_799366 ?auto_799377 ) ) ( not ( = ?auto_799366 ?auto_799378 ) ) ( not ( = ?auto_799366 ?auto_799379 ) ) ( not ( = ?auto_799366 ?auto_799380 ) ) ( not ( = ?auto_799366 ?auto_799381 ) ) ( not ( = ?auto_799366 ?auto_799382 ) ) ( not ( = ?auto_799367 ?auto_799368 ) ) ( not ( = ?auto_799367 ?auto_799369 ) ) ( not ( = ?auto_799367 ?auto_799370 ) ) ( not ( = ?auto_799367 ?auto_799371 ) ) ( not ( = ?auto_799367 ?auto_799372 ) ) ( not ( = ?auto_799367 ?auto_799373 ) ) ( not ( = ?auto_799367 ?auto_799374 ) ) ( not ( = ?auto_799367 ?auto_799375 ) ) ( not ( = ?auto_799367 ?auto_799376 ) ) ( not ( = ?auto_799367 ?auto_799377 ) ) ( not ( = ?auto_799367 ?auto_799378 ) ) ( not ( = ?auto_799367 ?auto_799379 ) ) ( not ( = ?auto_799367 ?auto_799380 ) ) ( not ( = ?auto_799367 ?auto_799381 ) ) ( not ( = ?auto_799367 ?auto_799382 ) ) ( not ( = ?auto_799368 ?auto_799369 ) ) ( not ( = ?auto_799368 ?auto_799370 ) ) ( not ( = ?auto_799368 ?auto_799371 ) ) ( not ( = ?auto_799368 ?auto_799372 ) ) ( not ( = ?auto_799368 ?auto_799373 ) ) ( not ( = ?auto_799368 ?auto_799374 ) ) ( not ( = ?auto_799368 ?auto_799375 ) ) ( not ( = ?auto_799368 ?auto_799376 ) ) ( not ( = ?auto_799368 ?auto_799377 ) ) ( not ( = ?auto_799368 ?auto_799378 ) ) ( not ( = ?auto_799368 ?auto_799379 ) ) ( not ( = ?auto_799368 ?auto_799380 ) ) ( not ( = ?auto_799368 ?auto_799381 ) ) ( not ( = ?auto_799368 ?auto_799382 ) ) ( not ( = ?auto_799369 ?auto_799370 ) ) ( not ( = ?auto_799369 ?auto_799371 ) ) ( not ( = ?auto_799369 ?auto_799372 ) ) ( not ( = ?auto_799369 ?auto_799373 ) ) ( not ( = ?auto_799369 ?auto_799374 ) ) ( not ( = ?auto_799369 ?auto_799375 ) ) ( not ( = ?auto_799369 ?auto_799376 ) ) ( not ( = ?auto_799369 ?auto_799377 ) ) ( not ( = ?auto_799369 ?auto_799378 ) ) ( not ( = ?auto_799369 ?auto_799379 ) ) ( not ( = ?auto_799369 ?auto_799380 ) ) ( not ( = ?auto_799369 ?auto_799381 ) ) ( not ( = ?auto_799369 ?auto_799382 ) ) ( not ( = ?auto_799370 ?auto_799371 ) ) ( not ( = ?auto_799370 ?auto_799372 ) ) ( not ( = ?auto_799370 ?auto_799373 ) ) ( not ( = ?auto_799370 ?auto_799374 ) ) ( not ( = ?auto_799370 ?auto_799375 ) ) ( not ( = ?auto_799370 ?auto_799376 ) ) ( not ( = ?auto_799370 ?auto_799377 ) ) ( not ( = ?auto_799370 ?auto_799378 ) ) ( not ( = ?auto_799370 ?auto_799379 ) ) ( not ( = ?auto_799370 ?auto_799380 ) ) ( not ( = ?auto_799370 ?auto_799381 ) ) ( not ( = ?auto_799370 ?auto_799382 ) ) ( not ( = ?auto_799371 ?auto_799372 ) ) ( not ( = ?auto_799371 ?auto_799373 ) ) ( not ( = ?auto_799371 ?auto_799374 ) ) ( not ( = ?auto_799371 ?auto_799375 ) ) ( not ( = ?auto_799371 ?auto_799376 ) ) ( not ( = ?auto_799371 ?auto_799377 ) ) ( not ( = ?auto_799371 ?auto_799378 ) ) ( not ( = ?auto_799371 ?auto_799379 ) ) ( not ( = ?auto_799371 ?auto_799380 ) ) ( not ( = ?auto_799371 ?auto_799381 ) ) ( not ( = ?auto_799371 ?auto_799382 ) ) ( not ( = ?auto_799372 ?auto_799373 ) ) ( not ( = ?auto_799372 ?auto_799374 ) ) ( not ( = ?auto_799372 ?auto_799375 ) ) ( not ( = ?auto_799372 ?auto_799376 ) ) ( not ( = ?auto_799372 ?auto_799377 ) ) ( not ( = ?auto_799372 ?auto_799378 ) ) ( not ( = ?auto_799372 ?auto_799379 ) ) ( not ( = ?auto_799372 ?auto_799380 ) ) ( not ( = ?auto_799372 ?auto_799381 ) ) ( not ( = ?auto_799372 ?auto_799382 ) ) ( not ( = ?auto_799373 ?auto_799374 ) ) ( not ( = ?auto_799373 ?auto_799375 ) ) ( not ( = ?auto_799373 ?auto_799376 ) ) ( not ( = ?auto_799373 ?auto_799377 ) ) ( not ( = ?auto_799373 ?auto_799378 ) ) ( not ( = ?auto_799373 ?auto_799379 ) ) ( not ( = ?auto_799373 ?auto_799380 ) ) ( not ( = ?auto_799373 ?auto_799381 ) ) ( not ( = ?auto_799373 ?auto_799382 ) ) ( not ( = ?auto_799374 ?auto_799375 ) ) ( not ( = ?auto_799374 ?auto_799376 ) ) ( not ( = ?auto_799374 ?auto_799377 ) ) ( not ( = ?auto_799374 ?auto_799378 ) ) ( not ( = ?auto_799374 ?auto_799379 ) ) ( not ( = ?auto_799374 ?auto_799380 ) ) ( not ( = ?auto_799374 ?auto_799381 ) ) ( not ( = ?auto_799374 ?auto_799382 ) ) ( not ( = ?auto_799375 ?auto_799376 ) ) ( not ( = ?auto_799375 ?auto_799377 ) ) ( not ( = ?auto_799375 ?auto_799378 ) ) ( not ( = ?auto_799375 ?auto_799379 ) ) ( not ( = ?auto_799375 ?auto_799380 ) ) ( not ( = ?auto_799375 ?auto_799381 ) ) ( not ( = ?auto_799375 ?auto_799382 ) ) ( not ( = ?auto_799376 ?auto_799377 ) ) ( not ( = ?auto_799376 ?auto_799378 ) ) ( not ( = ?auto_799376 ?auto_799379 ) ) ( not ( = ?auto_799376 ?auto_799380 ) ) ( not ( = ?auto_799376 ?auto_799381 ) ) ( not ( = ?auto_799376 ?auto_799382 ) ) ( not ( = ?auto_799377 ?auto_799378 ) ) ( not ( = ?auto_799377 ?auto_799379 ) ) ( not ( = ?auto_799377 ?auto_799380 ) ) ( not ( = ?auto_799377 ?auto_799381 ) ) ( not ( = ?auto_799377 ?auto_799382 ) ) ( not ( = ?auto_799378 ?auto_799379 ) ) ( not ( = ?auto_799378 ?auto_799380 ) ) ( not ( = ?auto_799378 ?auto_799381 ) ) ( not ( = ?auto_799378 ?auto_799382 ) ) ( not ( = ?auto_799379 ?auto_799380 ) ) ( not ( = ?auto_799379 ?auto_799381 ) ) ( not ( = ?auto_799379 ?auto_799382 ) ) ( not ( = ?auto_799380 ?auto_799381 ) ) ( not ( = ?auto_799380 ?auto_799382 ) ) ( not ( = ?auto_799381 ?auto_799382 ) ) ( ON ?auto_799380 ?auto_799381 ) ( ON ?auto_799379 ?auto_799380 ) ( ON ?auto_799378 ?auto_799379 ) ( ON ?auto_799377 ?auto_799378 ) ( ON ?auto_799376 ?auto_799377 ) ( ON ?auto_799375 ?auto_799376 ) ( ON ?auto_799374 ?auto_799375 ) ( ON ?auto_799373 ?auto_799374 ) ( CLEAR ?auto_799371 ) ( ON ?auto_799372 ?auto_799373 ) ( CLEAR ?auto_799372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_799365 ?auto_799366 ?auto_799367 ?auto_799368 ?auto_799369 ?auto_799370 ?auto_799371 ?auto_799372 )
      ( MAKE-17PILE ?auto_799365 ?auto_799366 ?auto_799367 ?auto_799368 ?auto_799369 ?auto_799370 ?auto_799371 ?auto_799372 ?auto_799373 ?auto_799374 ?auto_799375 ?auto_799376 ?auto_799377 ?auto_799378 ?auto_799379 ?auto_799380 ?auto_799381 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_799435 - BLOCK
      ?auto_799436 - BLOCK
      ?auto_799437 - BLOCK
      ?auto_799438 - BLOCK
      ?auto_799439 - BLOCK
      ?auto_799440 - BLOCK
      ?auto_799441 - BLOCK
      ?auto_799442 - BLOCK
      ?auto_799443 - BLOCK
      ?auto_799444 - BLOCK
      ?auto_799445 - BLOCK
      ?auto_799446 - BLOCK
      ?auto_799447 - BLOCK
      ?auto_799448 - BLOCK
      ?auto_799449 - BLOCK
      ?auto_799450 - BLOCK
      ?auto_799451 - BLOCK
    )
    :vars
    (
      ?auto_799452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_799451 ?auto_799452 ) ( ON-TABLE ?auto_799435 ) ( ON ?auto_799436 ?auto_799435 ) ( ON ?auto_799437 ?auto_799436 ) ( ON ?auto_799438 ?auto_799437 ) ( ON ?auto_799439 ?auto_799438 ) ( ON ?auto_799440 ?auto_799439 ) ( not ( = ?auto_799435 ?auto_799436 ) ) ( not ( = ?auto_799435 ?auto_799437 ) ) ( not ( = ?auto_799435 ?auto_799438 ) ) ( not ( = ?auto_799435 ?auto_799439 ) ) ( not ( = ?auto_799435 ?auto_799440 ) ) ( not ( = ?auto_799435 ?auto_799441 ) ) ( not ( = ?auto_799435 ?auto_799442 ) ) ( not ( = ?auto_799435 ?auto_799443 ) ) ( not ( = ?auto_799435 ?auto_799444 ) ) ( not ( = ?auto_799435 ?auto_799445 ) ) ( not ( = ?auto_799435 ?auto_799446 ) ) ( not ( = ?auto_799435 ?auto_799447 ) ) ( not ( = ?auto_799435 ?auto_799448 ) ) ( not ( = ?auto_799435 ?auto_799449 ) ) ( not ( = ?auto_799435 ?auto_799450 ) ) ( not ( = ?auto_799435 ?auto_799451 ) ) ( not ( = ?auto_799435 ?auto_799452 ) ) ( not ( = ?auto_799436 ?auto_799437 ) ) ( not ( = ?auto_799436 ?auto_799438 ) ) ( not ( = ?auto_799436 ?auto_799439 ) ) ( not ( = ?auto_799436 ?auto_799440 ) ) ( not ( = ?auto_799436 ?auto_799441 ) ) ( not ( = ?auto_799436 ?auto_799442 ) ) ( not ( = ?auto_799436 ?auto_799443 ) ) ( not ( = ?auto_799436 ?auto_799444 ) ) ( not ( = ?auto_799436 ?auto_799445 ) ) ( not ( = ?auto_799436 ?auto_799446 ) ) ( not ( = ?auto_799436 ?auto_799447 ) ) ( not ( = ?auto_799436 ?auto_799448 ) ) ( not ( = ?auto_799436 ?auto_799449 ) ) ( not ( = ?auto_799436 ?auto_799450 ) ) ( not ( = ?auto_799436 ?auto_799451 ) ) ( not ( = ?auto_799436 ?auto_799452 ) ) ( not ( = ?auto_799437 ?auto_799438 ) ) ( not ( = ?auto_799437 ?auto_799439 ) ) ( not ( = ?auto_799437 ?auto_799440 ) ) ( not ( = ?auto_799437 ?auto_799441 ) ) ( not ( = ?auto_799437 ?auto_799442 ) ) ( not ( = ?auto_799437 ?auto_799443 ) ) ( not ( = ?auto_799437 ?auto_799444 ) ) ( not ( = ?auto_799437 ?auto_799445 ) ) ( not ( = ?auto_799437 ?auto_799446 ) ) ( not ( = ?auto_799437 ?auto_799447 ) ) ( not ( = ?auto_799437 ?auto_799448 ) ) ( not ( = ?auto_799437 ?auto_799449 ) ) ( not ( = ?auto_799437 ?auto_799450 ) ) ( not ( = ?auto_799437 ?auto_799451 ) ) ( not ( = ?auto_799437 ?auto_799452 ) ) ( not ( = ?auto_799438 ?auto_799439 ) ) ( not ( = ?auto_799438 ?auto_799440 ) ) ( not ( = ?auto_799438 ?auto_799441 ) ) ( not ( = ?auto_799438 ?auto_799442 ) ) ( not ( = ?auto_799438 ?auto_799443 ) ) ( not ( = ?auto_799438 ?auto_799444 ) ) ( not ( = ?auto_799438 ?auto_799445 ) ) ( not ( = ?auto_799438 ?auto_799446 ) ) ( not ( = ?auto_799438 ?auto_799447 ) ) ( not ( = ?auto_799438 ?auto_799448 ) ) ( not ( = ?auto_799438 ?auto_799449 ) ) ( not ( = ?auto_799438 ?auto_799450 ) ) ( not ( = ?auto_799438 ?auto_799451 ) ) ( not ( = ?auto_799438 ?auto_799452 ) ) ( not ( = ?auto_799439 ?auto_799440 ) ) ( not ( = ?auto_799439 ?auto_799441 ) ) ( not ( = ?auto_799439 ?auto_799442 ) ) ( not ( = ?auto_799439 ?auto_799443 ) ) ( not ( = ?auto_799439 ?auto_799444 ) ) ( not ( = ?auto_799439 ?auto_799445 ) ) ( not ( = ?auto_799439 ?auto_799446 ) ) ( not ( = ?auto_799439 ?auto_799447 ) ) ( not ( = ?auto_799439 ?auto_799448 ) ) ( not ( = ?auto_799439 ?auto_799449 ) ) ( not ( = ?auto_799439 ?auto_799450 ) ) ( not ( = ?auto_799439 ?auto_799451 ) ) ( not ( = ?auto_799439 ?auto_799452 ) ) ( not ( = ?auto_799440 ?auto_799441 ) ) ( not ( = ?auto_799440 ?auto_799442 ) ) ( not ( = ?auto_799440 ?auto_799443 ) ) ( not ( = ?auto_799440 ?auto_799444 ) ) ( not ( = ?auto_799440 ?auto_799445 ) ) ( not ( = ?auto_799440 ?auto_799446 ) ) ( not ( = ?auto_799440 ?auto_799447 ) ) ( not ( = ?auto_799440 ?auto_799448 ) ) ( not ( = ?auto_799440 ?auto_799449 ) ) ( not ( = ?auto_799440 ?auto_799450 ) ) ( not ( = ?auto_799440 ?auto_799451 ) ) ( not ( = ?auto_799440 ?auto_799452 ) ) ( not ( = ?auto_799441 ?auto_799442 ) ) ( not ( = ?auto_799441 ?auto_799443 ) ) ( not ( = ?auto_799441 ?auto_799444 ) ) ( not ( = ?auto_799441 ?auto_799445 ) ) ( not ( = ?auto_799441 ?auto_799446 ) ) ( not ( = ?auto_799441 ?auto_799447 ) ) ( not ( = ?auto_799441 ?auto_799448 ) ) ( not ( = ?auto_799441 ?auto_799449 ) ) ( not ( = ?auto_799441 ?auto_799450 ) ) ( not ( = ?auto_799441 ?auto_799451 ) ) ( not ( = ?auto_799441 ?auto_799452 ) ) ( not ( = ?auto_799442 ?auto_799443 ) ) ( not ( = ?auto_799442 ?auto_799444 ) ) ( not ( = ?auto_799442 ?auto_799445 ) ) ( not ( = ?auto_799442 ?auto_799446 ) ) ( not ( = ?auto_799442 ?auto_799447 ) ) ( not ( = ?auto_799442 ?auto_799448 ) ) ( not ( = ?auto_799442 ?auto_799449 ) ) ( not ( = ?auto_799442 ?auto_799450 ) ) ( not ( = ?auto_799442 ?auto_799451 ) ) ( not ( = ?auto_799442 ?auto_799452 ) ) ( not ( = ?auto_799443 ?auto_799444 ) ) ( not ( = ?auto_799443 ?auto_799445 ) ) ( not ( = ?auto_799443 ?auto_799446 ) ) ( not ( = ?auto_799443 ?auto_799447 ) ) ( not ( = ?auto_799443 ?auto_799448 ) ) ( not ( = ?auto_799443 ?auto_799449 ) ) ( not ( = ?auto_799443 ?auto_799450 ) ) ( not ( = ?auto_799443 ?auto_799451 ) ) ( not ( = ?auto_799443 ?auto_799452 ) ) ( not ( = ?auto_799444 ?auto_799445 ) ) ( not ( = ?auto_799444 ?auto_799446 ) ) ( not ( = ?auto_799444 ?auto_799447 ) ) ( not ( = ?auto_799444 ?auto_799448 ) ) ( not ( = ?auto_799444 ?auto_799449 ) ) ( not ( = ?auto_799444 ?auto_799450 ) ) ( not ( = ?auto_799444 ?auto_799451 ) ) ( not ( = ?auto_799444 ?auto_799452 ) ) ( not ( = ?auto_799445 ?auto_799446 ) ) ( not ( = ?auto_799445 ?auto_799447 ) ) ( not ( = ?auto_799445 ?auto_799448 ) ) ( not ( = ?auto_799445 ?auto_799449 ) ) ( not ( = ?auto_799445 ?auto_799450 ) ) ( not ( = ?auto_799445 ?auto_799451 ) ) ( not ( = ?auto_799445 ?auto_799452 ) ) ( not ( = ?auto_799446 ?auto_799447 ) ) ( not ( = ?auto_799446 ?auto_799448 ) ) ( not ( = ?auto_799446 ?auto_799449 ) ) ( not ( = ?auto_799446 ?auto_799450 ) ) ( not ( = ?auto_799446 ?auto_799451 ) ) ( not ( = ?auto_799446 ?auto_799452 ) ) ( not ( = ?auto_799447 ?auto_799448 ) ) ( not ( = ?auto_799447 ?auto_799449 ) ) ( not ( = ?auto_799447 ?auto_799450 ) ) ( not ( = ?auto_799447 ?auto_799451 ) ) ( not ( = ?auto_799447 ?auto_799452 ) ) ( not ( = ?auto_799448 ?auto_799449 ) ) ( not ( = ?auto_799448 ?auto_799450 ) ) ( not ( = ?auto_799448 ?auto_799451 ) ) ( not ( = ?auto_799448 ?auto_799452 ) ) ( not ( = ?auto_799449 ?auto_799450 ) ) ( not ( = ?auto_799449 ?auto_799451 ) ) ( not ( = ?auto_799449 ?auto_799452 ) ) ( not ( = ?auto_799450 ?auto_799451 ) ) ( not ( = ?auto_799450 ?auto_799452 ) ) ( not ( = ?auto_799451 ?auto_799452 ) ) ( ON ?auto_799450 ?auto_799451 ) ( ON ?auto_799449 ?auto_799450 ) ( ON ?auto_799448 ?auto_799449 ) ( ON ?auto_799447 ?auto_799448 ) ( ON ?auto_799446 ?auto_799447 ) ( ON ?auto_799445 ?auto_799446 ) ( ON ?auto_799444 ?auto_799445 ) ( ON ?auto_799443 ?auto_799444 ) ( ON ?auto_799442 ?auto_799443 ) ( CLEAR ?auto_799440 ) ( ON ?auto_799441 ?auto_799442 ) ( CLEAR ?auto_799441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_799435 ?auto_799436 ?auto_799437 ?auto_799438 ?auto_799439 ?auto_799440 ?auto_799441 )
      ( MAKE-17PILE ?auto_799435 ?auto_799436 ?auto_799437 ?auto_799438 ?auto_799439 ?auto_799440 ?auto_799441 ?auto_799442 ?auto_799443 ?auto_799444 ?auto_799445 ?auto_799446 ?auto_799447 ?auto_799448 ?auto_799449 ?auto_799450 ?auto_799451 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_799505 - BLOCK
      ?auto_799506 - BLOCK
      ?auto_799507 - BLOCK
      ?auto_799508 - BLOCK
      ?auto_799509 - BLOCK
      ?auto_799510 - BLOCK
      ?auto_799511 - BLOCK
      ?auto_799512 - BLOCK
      ?auto_799513 - BLOCK
      ?auto_799514 - BLOCK
      ?auto_799515 - BLOCK
      ?auto_799516 - BLOCK
      ?auto_799517 - BLOCK
      ?auto_799518 - BLOCK
      ?auto_799519 - BLOCK
      ?auto_799520 - BLOCK
      ?auto_799521 - BLOCK
    )
    :vars
    (
      ?auto_799522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_799521 ?auto_799522 ) ( ON-TABLE ?auto_799505 ) ( ON ?auto_799506 ?auto_799505 ) ( ON ?auto_799507 ?auto_799506 ) ( ON ?auto_799508 ?auto_799507 ) ( ON ?auto_799509 ?auto_799508 ) ( not ( = ?auto_799505 ?auto_799506 ) ) ( not ( = ?auto_799505 ?auto_799507 ) ) ( not ( = ?auto_799505 ?auto_799508 ) ) ( not ( = ?auto_799505 ?auto_799509 ) ) ( not ( = ?auto_799505 ?auto_799510 ) ) ( not ( = ?auto_799505 ?auto_799511 ) ) ( not ( = ?auto_799505 ?auto_799512 ) ) ( not ( = ?auto_799505 ?auto_799513 ) ) ( not ( = ?auto_799505 ?auto_799514 ) ) ( not ( = ?auto_799505 ?auto_799515 ) ) ( not ( = ?auto_799505 ?auto_799516 ) ) ( not ( = ?auto_799505 ?auto_799517 ) ) ( not ( = ?auto_799505 ?auto_799518 ) ) ( not ( = ?auto_799505 ?auto_799519 ) ) ( not ( = ?auto_799505 ?auto_799520 ) ) ( not ( = ?auto_799505 ?auto_799521 ) ) ( not ( = ?auto_799505 ?auto_799522 ) ) ( not ( = ?auto_799506 ?auto_799507 ) ) ( not ( = ?auto_799506 ?auto_799508 ) ) ( not ( = ?auto_799506 ?auto_799509 ) ) ( not ( = ?auto_799506 ?auto_799510 ) ) ( not ( = ?auto_799506 ?auto_799511 ) ) ( not ( = ?auto_799506 ?auto_799512 ) ) ( not ( = ?auto_799506 ?auto_799513 ) ) ( not ( = ?auto_799506 ?auto_799514 ) ) ( not ( = ?auto_799506 ?auto_799515 ) ) ( not ( = ?auto_799506 ?auto_799516 ) ) ( not ( = ?auto_799506 ?auto_799517 ) ) ( not ( = ?auto_799506 ?auto_799518 ) ) ( not ( = ?auto_799506 ?auto_799519 ) ) ( not ( = ?auto_799506 ?auto_799520 ) ) ( not ( = ?auto_799506 ?auto_799521 ) ) ( not ( = ?auto_799506 ?auto_799522 ) ) ( not ( = ?auto_799507 ?auto_799508 ) ) ( not ( = ?auto_799507 ?auto_799509 ) ) ( not ( = ?auto_799507 ?auto_799510 ) ) ( not ( = ?auto_799507 ?auto_799511 ) ) ( not ( = ?auto_799507 ?auto_799512 ) ) ( not ( = ?auto_799507 ?auto_799513 ) ) ( not ( = ?auto_799507 ?auto_799514 ) ) ( not ( = ?auto_799507 ?auto_799515 ) ) ( not ( = ?auto_799507 ?auto_799516 ) ) ( not ( = ?auto_799507 ?auto_799517 ) ) ( not ( = ?auto_799507 ?auto_799518 ) ) ( not ( = ?auto_799507 ?auto_799519 ) ) ( not ( = ?auto_799507 ?auto_799520 ) ) ( not ( = ?auto_799507 ?auto_799521 ) ) ( not ( = ?auto_799507 ?auto_799522 ) ) ( not ( = ?auto_799508 ?auto_799509 ) ) ( not ( = ?auto_799508 ?auto_799510 ) ) ( not ( = ?auto_799508 ?auto_799511 ) ) ( not ( = ?auto_799508 ?auto_799512 ) ) ( not ( = ?auto_799508 ?auto_799513 ) ) ( not ( = ?auto_799508 ?auto_799514 ) ) ( not ( = ?auto_799508 ?auto_799515 ) ) ( not ( = ?auto_799508 ?auto_799516 ) ) ( not ( = ?auto_799508 ?auto_799517 ) ) ( not ( = ?auto_799508 ?auto_799518 ) ) ( not ( = ?auto_799508 ?auto_799519 ) ) ( not ( = ?auto_799508 ?auto_799520 ) ) ( not ( = ?auto_799508 ?auto_799521 ) ) ( not ( = ?auto_799508 ?auto_799522 ) ) ( not ( = ?auto_799509 ?auto_799510 ) ) ( not ( = ?auto_799509 ?auto_799511 ) ) ( not ( = ?auto_799509 ?auto_799512 ) ) ( not ( = ?auto_799509 ?auto_799513 ) ) ( not ( = ?auto_799509 ?auto_799514 ) ) ( not ( = ?auto_799509 ?auto_799515 ) ) ( not ( = ?auto_799509 ?auto_799516 ) ) ( not ( = ?auto_799509 ?auto_799517 ) ) ( not ( = ?auto_799509 ?auto_799518 ) ) ( not ( = ?auto_799509 ?auto_799519 ) ) ( not ( = ?auto_799509 ?auto_799520 ) ) ( not ( = ?auto_799509 ?auto_799521 ) ) ( not ( = ?auto_799509 ?auto_799522 ) ) ( not ( = ?auto_799510 ?auto_799511 ) ) ( not ( = ?auto_799510 ?auto_799512 ) ) ( not ( = ?auto_799510 ?auto_799513 ) ) ( not ( = ?auto_799510 ?auto_799514 ) ) ( not ( = ?auto_799510 ?auto_799515 ) ) ( not ( = ?auto_799510 ?auto_799516 ) ) ( not ( = ?auto_799510 ?auto_799517 ) ) ( not ( = ?auto_799510 ?auto_799518 ) ) ( not ( = ?auto_799510 ?auto_799519 ) ) ( not ( = ?auto_799510 ?auto_799520 ) ) ( not ( = ?auto_799510 ?auto_799521 ) ) ( not ( = ?auto_799510 ?auto_799522 ) ) ( not ( = ?auto_799511 ?auto_799512 ) ) ( not ( = ?auto_799511 ?auto_799513 ) ) ( not ( = ?auto_799511 ?auto_799514 ) ) ( not ( = ?auto_799511 ?auto_799515 ) ) ( not ( = ?auto_799511 ?auto_799516 ) ) ( not ( = ?auto_799511 ?auto_799517 ) ) ( not ( = ?auto_799511 ?auto_799518 ) ) ( not ( = ?auto_799511 ?auto_799519 ) ) ( not ( = ?auto_799511 ?auto_799520 ) ) ( not ( = ?auto_799511 ?auto_799521 ) ) ( not ( = ?auto_799511 ?auto_799522 ) ) ( not ( = ?auto_799512 ?auto_799513 ) ) ( not ( = ?auto_799512 ?auto_799514 ) ) ( not ( = ?auto_799512 ?auto_799515 ) ) ( not ( = ?auto_799512 ?auto_799516 ) ) ( not ( = ?auto_799512 ?auto_799517 ) ) ( not ( = ?auto_799512 ?auto_799518 ) ) ( not ( = ?auto_799512 ?auto_799519 ) ) ( not ( = ?auto_799512 ?auto_799520 ) ) ( not ( = ?auto_799512 ?auto_799521 ) ) ( not ( = ?auto_799512 ?auto_799522 ) ) ( not ( = ?auto_799513 ?auto_799514 ) ) ( not ( = ?auto_799513 ?auto_799515 ) ) ( not ( = ?auto_799513 ?auto_799516 ) ) ( not ( = ?auto_799513 ?auto_799517 ) ) ( not ( = ?auto_799513 ?auto_799518 ) ) ( not ( = ?auto_799513 ?auto_799519 ) ) ( not ( = ?auto_799513 ?auto_799520 ) ) ( not ( = ?auto_799513 ?auto_799521 ) ) ( not ( = ?auto_799513 ?auto_799522 ) ) ( not ( = ?auto_799514 ?auto_799515 ) ) ( not ( = ?auto_799514 ?auto_799516 ) ) ( not ( = ?auto_799514 ?auto_799517 ) ) ( not ( = ?auto_799514 ?auto_799518 ) ) ( not ( = ?auto_799514 ?auto_799519 ) ) ( not ( = ?auto_799514 ?auto_799520 ) ) ( not ( = ?auto_799514 ?auto_799521 ) ) ( not ( = ?auto_799514 ?auto_799522 ) ) ( not ( = ?auto_799515 ?auto_799516 ) ) ( not ( = ?auto_799515 ?auto_799517 ) ) ( not ( = ?auto_799515 ?auto_799518 ) ) ( not ( = ?auto_799515 ?auto_799519 ) ) ( not ( = ?auto_799515 ?auto_799520 ) ) ( not ( = ?auto_799515 ?auto_799521 ) ) ( not ( = ?auto_799515 ?auto_799522 ) ) ( not ( = ?auto_799516 ?auto_799517 ) ) ( not ( = ?auto_799516 ?auto_799518 ) ) ( not ( = ?auto_799516 ?auto_799519 ) ) ( not ( = ?auto_799516 ?auto_799520 ) ) ( not ( = ?auto_799516 ?auto_799521 ) ) ( not ( = ?auto_799516 ?auto_799522 ) ) ( not ( = ?auto_799517 ?auto_799518 ) ) ( not ( = ?auto_799517 ?auto_799519 ) ) ( not ( = ?auto_799517 ?auto_799520 ) ) ( not ( = ?auto_799517 ?auto_799521 ) ) ( not ( = ?auto_799517 ?auto_799522 ) ) ( not ( = ?auto_799518 ?auto_799519 ) ) ( not ( = ?auto_799518 ?auto_799520 ) ) ( not ( = ?auto_799518 ?auto_799521 ) ) ( not ( = ?auto_799518 ?auto_799522 ) ) ( not ( = ?auto_799519 ?auto_799520 ) ) ( not ( = ?auto_799519 ?auto_799521 ) ) ( not ( = ?auto_799519 ?auto_799522 ) ) ( not ( = ?auto_799520 ?auto_799521 ) ) ( not ( = ?auto_799520 ?auto_799522 ) ) ( not ( = ?auto_799521 ?auto_799522 ) ) ( ON ?auto_799520 ?auto_799521 ) ( ON ?auto_799519 ?auto_799520 ) ( ON ?auto_799518 ?auto_799519 ) ( ON ?auto_799517 ?auto_799518 ) ( ON ?auto_799516 ?auto_799517 ) ( ON ?auto_799515 ?auto_799516 ) ( ON ?auto_799514 ?auto_799515 ) ( ON ?auto_799513 ?auto_799514 ) ( ON ?auto_799512 ?auto_799513 ) ( ON ?auto_799511 ?auto_799512 ) ( CLEAR ?auto_799509 ) ( ON ?auto_799510 ?auto_799511 ) ( CLEAR ?auto_799510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_799505 ?auto_799506 ?auto_799507 ?auto_799508 ?auto_799509 ?auto_799510 )
      ( MAKE-17PILE ?auto_799505 ?auto_799506 ?auto_799507 ?auto_799508 ?auto_799509 ?auto_799510 ?auto_799511 ?auto_799512 ?auto_799513 ?auto_799514 ?auto_799515 ?auto_799516 ?auto_799517 ?auto_799518 ?auto_799519 ?auto_799520 ?auto_799521 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_799575 - BLOCK
      ?auto_799576 - BLOCK
      ?auto_799577 - BLOCK
      ?auto_799578 - BLOCK
      ?auto_799579 - BLOCK
      ?auto_799580 - BLOCK
      ?auto_799581 - BLOCK
      ?auto_799582 - BLOCK
      ?auto_799583 - BLOCK
      ?auto_799584 - BLOCK
      ?auto_799585 - BLOCK
      ?auto_799586 - BLOCK
      ?auto_799587 - BLOCK
      ?auto_799588 - BLOCK
      ?auto_799589 - BLOCK
      ?auto_799590 - BLOCK
      ?auto_799591 - BLOCK
    )
    :vars
    (
      ?auto_799592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_799591 ?auto_799592 ) ( ON-TABLE ?auto_799575 ) ( ON ?auto_799576 ?auto_799575 ) ( ON ?auto_799577 ?auto_799576 ) ( ON ?auto_799578 ?auto_799577 ) ( not ( = ?auto_799575 ?auto_799576 ) ) ( not ( = ?auto_799575 ?auto_799577 ) ) ( not ( = ?auto_799575 ?auto_799578 ) ) ( not ( = ?auto_799575 ?auto_799579 ) ) ( not ( = ?auto_799575 ?auto_799580 ) ) ( not ( = ?auto_799575 ?auto_799581 ) ) ( not ( = ?auto_799575 ?auto_799582 ) ) ( not ( = ?auto_799575 ?auto_799583 ) ) ( not ( = ?auto_799575 ?auto_799584 ) ) ( not ( = ?auto_799575 ?auto_799585 ) ) ( not ( = ?auto_799575 ?auto_799586 ) ) ( not ( = ?auto_799575 ?auto_799587 ) ) ( not ( = ?auto_799575 ?auto_799588 ) ) ( not ( = ?auto_799575 ?auto_799589 ) ) ( not ( = ?auto_799575 ?auto_799590 ) ) ( not ( = ?auto_799575 ?auto_799591 ) ) ( not ( = ?auto_799575 ?auto_799592 ) ) ( not ( = ?auto_799576 ?auto_799577 ) ) ( not ( = ?auto_799576 ?auto_799578 ) ) ( not ( = ?auto_799576 ?auto_799579 ) ) ( not ( = ?auto_799576 ?auto_799580 ) ) ( not ( = ?auto_799576 ?auto_799581 ) ) ( not ( = ?auto_799576 ?auto_799582 ) ) ( not ( = ?auto_799576 ?auto_799583 ) ) ( not ( = ?auto_799576 ?auto_799584 ) ) ( not ( = ?auto_799576 ?auto_799585 ) ) ( not ( = ?auto_799576 ?auto_799586 ) ) ( not ( = ?auto_799576 ?auto_799587 ) ) ( not ( = ?auto_799576 ?auto_799588 ) ) ( not ( = ?auto_799576 ?auto_799589 ) ) ( not ( = ?auto_799576 ?auto_799590 ) ) ( not ( = ?auto_799576 ?auto_799591 ) ) ( not ( = ?auto_799576 ?auto_799592 ) ) ( not ( = ?auto_799577 ?auto_799578 ) ) ( not ( = ?auto_799577 ?auto_799579 ) ) ( not ( = ?auto_799577 ?auto_799580 ) ) ( not ( = ?auto_799577 ?auto_799581 ) ) ( not ( = ?auto_799577 ?auto_799582 ) ) ( not ( = ?auto_799577 ?auto_799583 ) ) ( not ( = ?auto_799577 ?auto_799584 ) ) ( not ( = ?auto_799577 ?auto_799585 ) ) ( not ( = ?auto_799577 ?auto_799586 ) ) ( not ( = ?auto_799577 ?auto_799587 ) ) ( not ( = ?auto_799577 ?auto_799588 ) ) ( not ( = ?auto_799577 ?auto_799589 ) ) ( not ( = ?auto_799577 ?auto_799590 ) ) ( not ( = ?auto_799577 ?auto_799591 ) ) ( not ( = ?auto_799577 ?auto_799592 ) ) ( not ( = ?auto_799578 ?auto_799579 ) ) ( not ( = ?auto_799578 ?auto_799580 ) ) ( not ( = ?auto_799578 ?auto_799581 ) ) ( not ( = ?auto_799578 ?auto_799582 ) ) ( not ( = ?auto_799578 ?auto_799583 ) ) ( not ( = ?auto_799578 ?auto_799584 ) ) ( not ( = ?auto_799578 ?auto_799585 ) ) ( not ( = ?auto_799578 ?auto_799586 ) ) ( not ( = ?auto_799578 ?auto_799587 ) ) ( not ( = ?auto_799578 ?auto_799588 ) ) ( not ( = ?auto_799578 ?auto_799589 ) ) ( not ( = ?auto_799578 ?auto_799590 ) ) ( not ( = ?auto_799578 ?auto_799591 ) ) ( not ( = ?auto_799578 ?auto_799592 ) ) ( not ( = ?auto_799579 ?auto_799580 ) ) ( not ( = ?auto_799579 ?auto_799581 ) ) ( not ( = ?auto_799579 ?auto_799582 ) ) ( not ( = ?auto_799579 ?auto_799583 ) ) ( not ( = ?auto_799579 ?auto_799584 ) ) ( not ( = ?auto_799579 ?auto_799585 ) ) ( not ( = ?auto_799579 ?auto_799586 ) ) ( not ( = ?auto_799579 ?auto_799587 ) ) ( not ( = ?auto_799579 ?auto_799588 ) ) ( not ( = ?auto_799579 ?auto_799589 ) ) ( not ( = ?auto_799579 ?auto_799590 ) ) ( not ( = ?auto_799579 ?auto_799591 ) ) ( not ( = ?auto_799579 ?auto_799592 ) ) ( not ( = ?auto_799580 ?auto_799581 ) ) ( not ( = ?auto_799580 ?auto_799582 ) ) ( not ( = ?auto_799580 ?auto_799583 ) ) ( not ( = ?auto_799580 ?auto_799584 ) ) ( not ( = ?auto_799580 ?auto_799585 ) ) ( not ( = ?auto_799580 ?auto_799586 ) ) ( not ( = ?auto_799580 ?auto_799587 ) ) ( not ( = ?auto_799580 ?auto_799588 ) ) ( not ( = ?auto_799580 ?auto_799589 ) ) ( not ( = ?auto_799580 ?auto_799590 ) ) ( not ( = ?auto_799580 ?auto_799591 ) ) ( not ( = ?auto_799580 ?auto_799592 ) ) ( not ( = ?auto_799581 ?auto_799582 ) ) ( not ( = ?auto_799581 ?auto_799583 ) ) ( not ( = ?auto_799581 ?auto_799584 ) ) ( not ( = ?auto_799581 ?auto_799585 ) ) ( not ( = ?auto_799581 ?auto_799586 ) ) ( not ( = ?auto_799581 ?auto_799587 ) ) ( not ( = ?auto_799581 ?auto_799588 ) ) ( not ( = ?auto_799581 ?auto_799589 ) ) ( not ( = ?auto_799581 ?auto_799590 ) ) ( not ( = ?auto_799581 ?auto_799591 ) ) ( not ( = ?auto_799581 ?auto_799592 ) ) ( not ( = ?auto_799582 ?auto_799583 ) ) ( not ( = ?auto_799582 ?auto_799584 ) ) ( not ( = ?auto_799582 ?auto_799585 ) ) ( not ( = ?auto_799582 ?auto_799586 ) ) ( not ( = ?auto_799582 ?auto_799587 ) ) ( not ( = ?auto_799582 ?auto_799588 ) ) ( not ( = ?auto_799582 ?auto_799589 ) ) ( not ( = ?auto_799582 ?auto_799590 ) ) ( not ( = ?auto_799582 ?auto_799591 ) ) ( not ( = ?auto_799582 ?auto_799592 ) ) ( not ( = ?auto_799583 ?auto_799584 ) ) ( not ( = ?auto_799583 ?auto_799585 ) ) ( not ( = ?auto_799583 ?auto_799586 ) ) ( not ( = ?auto_799583 ?auto_799587 ) ) ( not ( = ?auto_799583 ?auto_799588 ) ) ( not ( = ?auto_799583 ?auto_799589 ) ) ( not ( = ?auto_799583 ?auto_799590 ) ) ( not ( = ?auto_799583 ?auto_799591 ) ) ( not ( = ?auto_799583 ?auto_799592 ) ) ( not ( = ?auto_799584 ?auto_799585 ) ) ( not ( = ?auto_799584 ?auto_799586 ) ) ( not ( = ?auto_799584 ?auto_799587 ) ) ( not ( = ?auto_799584 ?auto_799588 ) ) ( not ( = ?auto_799584 ?auto_799589 ) ) ( not ( = ?auto_799584 ?auto_799590 ) ) ( not ( = ?auto_799584 ?auto_799591 ) ) ( not ( = ?auto_799584 ?auto_799592 ) ) ( not ( = ?auto_799585 ?auto_799586 ) ) ( not ( = ?auto_799585 ?auto_799587 ) ) ( not ( = ?auto_799585 ?auto_799588 ) ) ( not ( = ?auto_799585 ?auto_799589 ) ) ( not ( = ?auto_799585 ?auto_799590 ) ) ( not ( = ?auto_799585 ?auto_799591 ) ) ( not ( = ?auto_799585 ?auto_799592 ) ) ( not ( = ?auto_799586 ?auto_799587 ) ) ( not ( = ?auto_799586 ?auto_799588 ) ) ( not ( = ?auto_799586 ?auto_799589 ) ) ( not ( = ?auto_799586 ?auto_799590 ) ) ( not ( = ?auto_799586 ?auto_799591 ) ) ( not ( = ?auto_799586 ?auto_799592 ) ) ( not ( = ?auto_799587 ?auto_799588 ) ) ( not ( = ?auto_799587 ?auto_799589 ) ) ( not ( = ?auto_799587 ?auto_799590 ) ) ( not ( = ?auto_799587 ?auto_799591 ) ) ( not ( = ?auto_799587 ?auto_799592 ) ) ( not ( = ?auto_799588 ?auto_799589 ) ) ( not ( = ?auto_799588 ?auto_799590 ) ) ( not ( = ?auto_799588 ?auto_799591 ) ) ( not ( = ?auto_799588 ?auto_799592 ) ) ( not ( = ?auto_799589 ?auto_799590 ) ) ( not ( = ?auto_799589 ?auto_799591 ) ) ( not ( = ?auto_799589 ?auto_799592 ) ) ( not ( = ?auto_799590 ?auto_799591 ) ) ( not ( = ?auto_799590 ?auto_799592 ) ) ( not ( = ?auto_799591 ?auto_799592 ) ) ( ON ?auto_799590 ?auto_799591 ) ( ON ?auto_799589 ?auto_799590 ) ( ON ?auto_799588 ?auto_799589 ) ( ON ?auto_799587 ?auto_799588 ) ( ON ?auto_799586 ?auto_799587 ) ( ON ?auto_799585 ?auto_799586 ) ( ON ?auto_799584 ?auto_799585 ) ( ON ?auto_799583 ?auto_799584 ) ( ON ?auto_799582 ?auto_799583 ) ( ON ?auto_799581 ?auto_799582 ) ( ON ?auto_799580 ?auto_799581 ) ( CLEAR ?auto_799578 ) ( ON ?auto_799579 ?auto_799580 ) ( CLEAR ?auto_799579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_799575 ?auto_799576 ?auto_799577 ?auto_799578 ?auto_799579 )
      ( MAKE-17PILE ?auto_799575 ?auto_799576 ?auto_799577 ?auto_799578 ?auto_799579 ?auto_799580 ?auto_799581 ?auto_799582 ?auto_799583 ?auto_799584 ?auto_799585 ?auto_799586 ?auto_799587 ?auto_799588 ?auto_799589 ?auto_799590 ?auto_799591 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_799645 - BLOCK
      ?auto_799646 - BLOCK
      ?auto_799647 - BLOCK
      ?auto_799648 - BLOCK
      ?auto_799649 - BLOCK
      ?auto_799650 - BLOCK
      ?auto_799651 - BLOCK
      ?auto_799652 - BLOCK
      ?auto_799653 - BLOCK
      ?auto_799654 - BLOCK
      ?auto_799655 - BLOCK
      ?auto_799656 - BLOCK
      ?auto_799657 - BLOCK
      ?auto_799658 - BLOCK
      ?auto_799659 - BLOCK
      ?auto_799660 - BLOCK
      ?auto_799661 - BLOCK
    )
    :vars
    (
      ?auto_799662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_799661 ?auto_799662 ) ( ON-TABLE ?auto_799645 ) ( ON ?auto_799646 ?auto_799645 ) ( ON ?auto_799647 ?auto_799646 ) ( not ( = ?auto_799645 ?auto_799646 ) ) ( not ( = ?auto_799645 ?auto_799647 ) ) ( not ( = ?auto_799645 ?auto_799648 ) ) ( not ( = ?auto_799645 ?auto_799649 ) ) ( not ( = ?auto_799645 ?auto_799650 ) ) ( not ( = ?auto_799645 ?auto_799651 ) ) ( not ( = ?auto_799645 ?auto_799652 ) ) ( not ( = ?auto_799645 ?auto_799653 ) ) ( not ( = ?auto_799645 ?auto_799654 ) ) ( not ( = ?auto_799645 ?auto_799655 ) ) ( not ( = ?auto_799645 ?auto_799656 ) ) ( not ( = ?auto_799645 ?auto_799657 ) ) ( not ( = ?auto_799645 ?auto_799658 ) ) ( not ( = ?auto_799645 ?auto_799659 ) ) ( not ( = ?auto_799645 ?auto_799660 ) ) ( not ( = ?auto_799645 ?auto_799661 ) ) ( not ( = ?auto_799645 ?auto_799662 ) ) ( not ( = ?auto_799646 ?auto_799647 ) ) ( not ( = ?auto_799646 ?auto_799648 ) ) ( not ( = ?auto_799646 ?auto_799649 ) ) ( not ( = ?auto_799646 ?auto_799650 ) ) ( not ( = ?auto_799646 ?auto_799651 ) ) ( not ( = ?auto_799646 ?auto_799652 ) ) ( not ( = ?auto_799646 ?auto_799653 ) ) ( not ( = ?auto_799646 ?auto_799654 ) ) ( not ( = ?auto_799646 ?auto_799655 ) ) ( not ( = ?auto_799646 ?auto_799656 ) ) ( not ( = ?auto_799646 ?auto_799657 ) ) ( not ( = ?auto_799646 ?auto_799658 ) ) ( not ( = ?auto_799646 ?auto_799659 ) ) ( not ( = ?auto_799646 ?auto_799660 ) ) ( not ( = ?auto_799646 ?auto_799661 ) ) ( not ( = ?auto_799646 ?auto_799662 ) ) ( not ( = ?auto_799647 ?auto_799648 ) ) ( not ( = ?auto_799647 ?auto_799649 ) ) ( not ( = ?auto_799647 ?auto_799650 ) ) ( not ( = ?auto_799647 ?auto_799651 ) ) ( not ( = ?auto_799647 ?auto_799652 ) ) ( not ( = ?auto_799647 ?auto_799653 ) ) ( not ( = ?auto_799647 ?auto_799654 ) ) ( not ( = ?auto_799647 ?auto_799655 ) ) ( not ( = ?auto_799647 ?auto_799656 ) ) ( not ( = ?auto_799647 ?auto_799657 ) ) ( not ( = ?auto_799647 ?auto_799658 ) ) ( not ( = ?auto_799647 ?auto_799659 ) ) ( not ( = ?auto_799647 ?auto_799660 ) ) ( not ( = ?auto_799647 ?auto_799661 ) ) ( not ( = ?auto_799647 ?auto_799662 ) ) ( not ( = ?auto_799648 ?auto_799649 ) ) ( not ( = ?auto_799648 ?auto_799650 ) ) ( not ( = ?auto_799648 ?auto_799651 ) ) ( not ( = ?auto_799648 ?auto_799652 ) ) ( not ( = ?auto_799648 ?auto_799653 ) ) ( not ( = ?auto_799648 ?auto_799654 ) ) ( not ( = ?auto_799648 ?auto_799655 ) ) ( not ( = ?auto_799648 ?auto_799656 ) ) ( not ( = ?auto_799648 ?auto_799657 ) ) ( not ( = ?auto_799648 ?auto_799658 ) ) ( not ( = ?auto_799648 ?auto_799659 ) ) ( not ( = ?auto_799648 ?auto_799660 ) ) ( not ( = ?auto_799648 ?auto_799661 ) ) ( not ( = ?auto_799648 ?auto_799662 ) ) ( not ( = ?auto_799649 ?auto_799650 ) ) ( not ( = ?auto_799649 ?auto_799651 ) ) ( not ( = ?auto_799649 ?auto_799652 ) ) ( not ( = ?auto_799649 ?auto_799653 ) ) ( not ( = ?auto_799649 ?auto_799654 ) ) ( not ( = ?auto_799649 ?auto_799655 ) ) ( not ( = ?auto_799649 ?auto_799656 ) ) ( not ( = ?auto_799649 ?auto_799657 ) ) ( not ( = ?auto_799649 ?auto_799658 ) ) ( not ( = ?auto_799649 ?auto_799659 ) ) ( not ( = ?auto_799649 ?auto_799660 ) ) ( not ( = ?auto_799649 ?auto_799661 ) ) ( not ( = ?auto_799649 ?auto_799662 ) ) ( not ( = ?auto_799650 ?auto_799651 ) ) ( not ( = ?auto_799650 ?auto_799652 ) ) ( not ( = ?auto_799650 ?auto_799653 ) ) ( not ( = ?auto_799650 ?auto_799654 ) ) ( not ( = ?auto_799650 ?auto_799655 ) ) ( not ( = ?auto_799650 ?auto_799656 ) ) ( not ( = ?auto_799650 ?auto_799657 ) ) ( not ( = ?auto_799650 ?auto_799658 ) ) ( not ( = ?auto_799650 ?auto_799659 ) ) ( not ( = ?auto_799650 ?auto_799660 ) ) ( not ( = ?auto_799650 ?auto_799661 ) ) ( not ( = ?auto_799650 ?auto_799662 ) ) ( not ( = ?auto_799651 ?auto_799652 ) ) ( not ( = ?auto_799651 ?auto_799653 ) ) ( not ( = ?auto_799651 ?auto_799654 ) ) ( not ( = ?auto_799651 ?auto_799655 ) ) ( not ( = ?auto_799651 ?auto_799656 ) ) ( not ( = ?auto_799651 ?auto_799657 ) ) ( not ( = ?auto_799651 ?auto_799658 ) ) ( not ( = ?auto_799651 ?auto_799659 ) ) ( not ( = ?auto_799651 ?auto_799660 ) ) ( not ( = ?auto_799651 ?auto_799661 ) ) ( not ( = ?auto_799651 ?auto_799662 ) ) ( not ( = ?auto_799652 ?auto_799653 ) ) ( not ( = ?auto_799652 ?auto_799654 ) ) ( not ( = ?auto_799652 ?auto_799655 ) ) ( not ( = ?auto_799652 ?auto_799656 ) ) ( not ( = ?auto_799652 ?auto_799657 ) ) ( not ( = ?auto_799652 ?auto_799658 ) ) ( not ( = ?auto_799652 ?auto_799659 ) ) ( not ( = ?auto_799652 ?auto_799660 ) ) ( not ( = ?auto_799652 ?auto_799661 ) ) ( not ( = ?auto_799652 ?auto_799662 ) ) ( not ( = ?auto_799653 ?auto_799654 ) ) ( not ( = ?auto_799653 ?auto_799655 ) ) ( not ( = ?auto_799653 ?auto_799656 ) ) ( not ( = ?auto_799653 ?auto_799657 ) ) ( not ( = ?auto_799653 ?auto_799658 ) ) ( not ( = ?auto_799653 ?auto_799659 ) ) ( not ( = ?auto_799653 ?auto_799660 ) ) ( not ( = ?auto_799653 ?auto_799661 ) ) ( not ( = ?auto_799653 ?auto_799662 ) ) ( not ( = ?auto_799654 ?auto_799655 ) ) ( not ( = ?auto_799654 ?auto_799656 ) ) ( not ( = ?auto_799654 ?auto_799657 ) ) ( not ( = ?auto_799654 ?auto_799658 ) ) ( not ( = ?auto_799654 ?auto_799659 ) ) ( not ( = ?auto_799654 ?auto_799660 ) ) ( not ( = ?auto_799654 ?auto_799661 ) ) ( not ( = ?auto_799654 ?auto_799662 ) ) ( not ( = ?auto_799655 ?auto_799656 ) ) ( not ( = ?auto_799655 ?auto_799657 ) ) ( not ( = ?auto_799655 ?auto_799658 ) ) ( not ( = ?auto_799655 ?auto_799659 ) ) ( not ( = ?auto_799655 ?auto_799660 ) ) ( not ( = ?auto_799655 ?auto_799661 ) ) ( not ( = ?auto_799655 ?auto_799662 ) ) ( not ( = ?auto_799656 ?auto_799657 ) ) ( not ( = ?auto_799656 ?auto_799658 ) ) ( not ( = ?auto_799656 ?auto_799659 ) ) ( not ( = ?auto_799656 ?auto_799660 ) ) ( not ( = ?auto_799656 ?auto_799661 ) ) ( not ( = ?auto_799656 ?auto_799662 ) ) ( not ( = ?auto_799657 ?auto_799658 ) ) ( not ( = ?auto_799657 ?auto_799659 ) ) ( not ( = ?auto_799657 ?auto_799660 ) ) ( not ( = ?auto_799657 ?auto_799661 ) ) ( not ( = ?auto_799657 ?auto_799662 ) ) ( not ( = ?auto_799658 ?auto_799659 ) ) ( not ( = ?auto_799658 ?auto_799660 ) ) ( not ( = ?auto_799658 ?auto_799661 ) ) ( not ( = ?auto_799658 ?auto_799662 ) ) ( not ( = ?auto_799659 ?auto_799660 ) ) ( not ( = ?auto_799659 ?auto_799661 ) ) ( not ( = ?auto_799659 ?auto_799662 ) ) ( not ( = ?auto_799660 ?auto_799661 ) ) ( not ( = ?auto_799660 ?auto_799662 ) ) ( not ( = ?auto_799661 ?auto_799662 ) ) ( ON ?auto_799660 ?auto_799661 ) ( ON ?auto_799659 ?auto_799660 ) ( ON ?auto_799658 ?auto_799659 ) ( ON ?auto_799657 ?auto_799658 ) ( ON ?auto_799656 ?auto_799657 ) ( ON ?auto_799655 ?auto_799656 ) ( ON ?auto_799654 ?auto_799655 ) ( ON ?auto_799653 ?auto_799654 ) ( ON ?auto_799652 ?auto_799653 ) ( ON ?auto_799651 ?auto_799652 ) ( ON ?auto_799650 ?auto_799651 ) ( ON ?auto_799649 ?auto_799650 ) ( CLEAR ?auto_799647 ) ( ON ?auto_799648 ?auto_799649 ) ( CLEAR ?auto_799648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_799645 ?auto_799646 ?auto_799647 ?auto_799648 )
      ( MAKE-17PILE ?auto_799645 ?auto_799646 ?auto_799647 ?auto_799648 ?auto_799649 ?auto_799650 ?auto_799651 ?auto_799652 ?auto_799653 ?auto_799654 ?auto_799655 ?auto_799656 ?auto_799657 ?auto_799658 ?auto_799659 ?auto_799660 ?auto_799661 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_799715 - BLOCK
      ?auto_799716 - BLOCK
      ?auto_799717 - BLOCK
      ?auto_799718 - BLOCK
      ?auto_799719 - BLOCK
      ?auto_799720 - BLOCK
      ?auto_799721 - BLOCK
      ?auto_799722 - BLOCK
      ?auto_799723 - BLOCK
      ?auto_799724 - BLOCK
      ?auto_799725 - BLOCK
      ?auto_799726 - BLOCK
      ?auto_799727 - BLOCK
      ?auto_799728 - BLOCK
      ?auto_799729 - BLOCK
      ?auto_799730 - BLOCK
      ?auto_799731 - BLOCK
    )
    :vars
    (
      ?auto_799732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_799731 ?auto_799732 ) ( ON-TABLE ?auto_799715 ) ( ON ?auto_799716 ?auto_799715 ) ( not ( = ?auto_799715 ?auto_799716 ) ) ( not ( = ?auto_799715 ?auto_799717 ) ) ( not ( = ?auto_799715 ?auto_799718 ) ) ( not ( = ?auto_799715 ?auto_799719 ) ) ( not ( = ?auto_799715 ?auto_799720 ) ) ( not ( = ?auto_799715 ?auto_799721 ) ) ( not ( = ?auto_799715 ?auto_799722 ) ) ( not ( = ?auto_799715 ?auto_799723 ) ) ( not ( = ?auto_799715 ?auto_799724 ) ) ( not ( = ?auto_799715 ?auto_799725 ) ) ( not ( = ?auto_799715 ?auto_799726 ) ) ( not ( = ?auto_799715 ?auto_799727 ) ) ( not ( = ?auto_799715 ?auto_799728 ) ) ( not ( = ?auto_799715 ?auto_799729 ) ) ( not ( = ?auto_799715 ?auto_799730 ) ) ( not ( = ?auto_799715 ?auto_799731 ) ) ( not ( = ?auto_799715 ?auto_799732 ) ) ( not ( = ?auto_799716 ?auto_799717 ) ) ( not ( = ?auto_799716 ?auto_799718 ) ) ( not ( = ?auto_799716 ?auto_799719 ) ) ( not ( = ?auto_799716 ?auto_799720 ) ) ( not ( = ?auto_799716 ?auto_799721 ) ) ( not ( = ?auto_799716 ?auto_799722 ) ) ( not ( = ?auto_799716 ?auto_799723 ) ) ( not ( = ?auto_799716 ?auto_799724 ) ) ( not ( = ?auto_799716 ?auto_799725 ) ) ( not ( = ?auto_799716 ?auto_799726 ) ) ( not ( = ?auto_799716 ?auto_799727 ) ) ( not ( = ?auto_799716 ?auto_799728 ) ) ( not ( = ?auto_799716 ?auto_799729 ) ) ( not ( = ?auto_799716 ?auto_799730 ) ) ( not ( = ?auto_799716 ?auto_799731 ) ) ( not ( = ?auto_799716 ?auto_799732 ) ) ( not ( = ?auto_799717 ?auto_799718 ) ) ( not ( = ?auto_799717 ?auto_799719 ) ) ( not ( = ?auto_799717 ?auto_799720 ) ) ( not ( = ?auto_799717 ?auto_799721 ) ) ( not ( = ?auto_799717 ?auto_799722 ) ) ( not ( = ?auto_799717 ?auto_799723 ) ) ( not ( = ?auto_799717 ?auto_799724 ) ) ( not ( = ?auto_799717 ?auto_799725 ) ) ( not ( = ?auto_799717 ?auto_799726 ) ) ( not ( = ?auto_799717 ?auto_799727 ) ) ( not ( = ?auto_799717 ?auto_799728 ) ) ( not ( = ?auto_799717 ?auto_799729 ) ) ( not ( = ?auto_799717 ?auto_799730 ) ) ( not ( = ?auto_799717 ?auto_799731 ) ) ( not ( = ?auto_799717 ?auto_799732 ) ) ( not ( = ?auto_799718 ?auto_799719 ) ) ( not ( = ?auto_799718 ?auto_799720 ) ) ( not ( = ?auto_799718 ?auto_799721 ) ) ( not ( = ?auto_799718 ?auto_799722 ) ) ( not ( = ?auto_799718 ?auto_799723 ) ) ( not ( = ?auto_799718 ?auto_799724 ) ) ( not ( = ?auto_799718 ?auto_799725 ) ) ( not ( = ?auto_799718 ?auto_799726 ) ) ( not ( = ?auto_799718 ?auto_799727 ) ) ( not ( = ?auto_799718 ?auto_799728 ) ) ( not ( = ?auto_799718 ?auto_799729 ) ) ( not ( = ?auto_799718 ?auto_799730 ) ) ( not ( = ?auto_799718 ?auto_799731 ) ) ( not ( = ?auto_799718 ?auto_799732 ) ) ( not ( = ?auto_799719 ?auto_799720 ) ) ( not ( = ?auto_799719 ?auto_799721 ) ) ( not ( = ?auto_799719 ?auto_799722 ) ) ( not ( = ?auto_799719 ?auto_799723 ) ) ( not ( = ?auto_799719 ?auto_799724 ) ) ( not ( = ?auto_799719 ?auto_799725 ) ) ( not ( = ?auto_799719 ?auto_799726 ) ) ( not ( = ?auto_799719 ?auto_799727 ) ) ( not ( = ?auto_799719 ?auto_799728 ) ) ( not ( = ?auto_799719 ?auto_799729 ) ) ( not ( = ?auto_799719 ?auto_799730 ) ) ( not ( = ?auto_799719 ?auto_799731 ) ) ( not ( = ?auto_799719 ?auto_799732 ) ) ( not ( = ?auto_799720 ?auto_799721 ) ) ( not ( = ?auto_799720 ?auto_799722 ) ) ( not ( = ?auto_799720 ?auto_799723 ) ) ( not ( = ?auto_799720 ?auto_799724 ) ) ( not ( = ?auto_799720 ?auto_799725 ) ) ( not ( = ?auto_799720 ?auto_799726 ) ) ( not ( = ?auto_799720 ?auto_799727 ) ) ( not ( = ?auto_799720 ?auto_799728 ) ) ( not ( = ?auto_799720 ?auto_799729 ) ) ( not ( = ?auto_799720 ?auto_799730 ) ) ( not ( = ?auto_799720 ?auto_799731 ) ) ( not ( = ?auto_799720 ?auto_799732 ) ) ( not ( = ?auto_799721 ?auto_799722 ) ) ( not ( = ?auto_799721 ?auto_799723 ) ) ( not ( = ?auto_799721 ?auto_799724 ) ) ( not ( = ?auto_799721 ?auto_799725 ) ) ( not ( = ?auto_799721 ?auto_799726 ) ) ( not ( = ?auto_799721 ?auto_799727 ) ) ( not ( = ?auto_799721 ?auto_799728 ) ) ( not ( = ?auto_799721 ?auto_799729 ) ) ( not ( = ?auto_799721 ?auto_799730 ) ) ( not ( = ?auto_799721 ?auto_799731 ) ) ( not ( = ?auto_799721 ?auto_799732 ) ) ( not ( = ?auto_799722 ?auto_799723 ) ) ( not ( = ?auto_799722 ?auto_799724 ) ) ( not ( = ?auto_799722 ?auto_799725 ) ) ( not ( = ?auto_799722 ?auto_799726 ) ) ( not ( = ?auto_799722 ?auto_799727 ) ) ( not ( = ?auto_799722 ?auto_799728 ) ) ( not ( = ?auto_799722 ?auto_799729 ) ) ( not ( = ?auto_799722 ?auto_799730 ) ) ( not ( = ?auto_799722 ?auto_799731 ) ) ( not ( = ?auto_799722 ?auto_799732 ) ) ( not ( = ?auto_799723 ?auto_799724 ) ) ( not ( = ?auto_799723 ?auto_799725 ) ) ( not ( = ?auto_799723 ?auto_799726 ) ) ( not ( = ?auto_799723 ?auto_799727 ) ) ( not ( = ?auto_799723 ?auto_799728 ) ) ( not ( = ?auto_799723 ?auto_799729 ) ) ( not ( = ?auto_799723 ?auto_799730 ) ) ( not ( = ?auto_799723 ?auto_799731 ) ) ( not ( = ?auto_799723 ?auto_799732 ) ) ( not ( = ?auto_799724 ?auto_799725 ) ) ( not ( = ?auto_799724 ?auto_799726 ) ) ( not ( = ?auto_799724 ?auto_799727 ) ) ( not ( = ?auto_799724 ?auto_799728 ) ) ( not ( = ?auto_799724 ?auto_799729 ) ) ( not ( = ?auto_799724 ?auto_799730 ) ) ( not ( = ?auto_799724 ?auto_799731 ) ) ( not ( = ?auto_799724 ?auto_799732 ) ) ( not ( = ?auto_799725 ?auto_799726 ) ) ( not ( = ?auto_799725 ?auto_799727 ) ) ( not ( = ?auto_799725 ?auto_799728 ) ) ( not ( = ?auto_799725 ?auto_799729 ) ) ( not ( = ?auto_799725 ?auto_799730 ) ) ( not ( = ?auto_799725 ?auto_799731 ) ) ( not ( = ?auto_799725 ?auto_799732 ) ) ( not ( = ?auto_799726 ?auto_799727 ) ) ( not ( = ?auto_799726 ?auto_799728 ) ) ( not ( = ?auto_799726 ?auto_799729 ) ) ( not ( = ?auto_799726 ?auto_799730 ) ) ( not ( = ?auto_799726 ?auto_799731 ) ) ( not ( = ?auto_799726 ?auto_799732 ) ) ( not ( = ?auto_799727 ?auto_799728 ) ) ( not ( = ?auto_799727 ?auto_799729 ) ) ( not ( = ?auto_799727 ?auto_799730 ) ) ( not ( = ?auto_799727 ?auto_799731 ) ) ( not ( = ?auto_799727 ?auto_799732 ) ) ( not ( = ?auto_799728 ?auto_799729 ) ) ( not ( = ?auto_799728 ?auto_799730 ) ) ( not ( = ?auto_799728 ?auto_799731 ) ) ( not ( = ?auto_799728 ?auto_799732 ) ) ( not ( = ?auto_799729 ?auto_799730 ) ) ( not ( = ?auto_799729 ?auto_799731 ) ) ( not ( = ?auto_799729 ?auto_799732 ) ) ( not ( = ?auto_799730 ?auto_799731 ) ) ( not ( = ?auto_799730 ?auto_799732 ) ) ( not ( = ?auto_799731 ?auto_799732 ) ) ( ON ?auto_799730 ?auto_799731 ) ( ON ?auto_799729 ?auto_799730 ) ( ON ?auto_799728 ?auto_799729 ) ( ON ?auto_799727 ?auto_799728 ) ( ON ?auto_799726 ?auto_799727 ) ( ON ?auto_799725 ?auto_799726 ) ( ON ?auto_799724 ?auto_799725 ) ( ON ?auto_799723 ?auto_799724 ) ( ON ?auto_799722 ?auto_799723 ) ( ON ?auto_799721 ?auto_799722 ) ( ON ?auto_799720 ?auto_799721 ) ( ON ?auto_799719 ?auto_799720 ) ( ON ?auto_799718 ?auto_799719 ) ( CLEAR ?auto_799716 ) ( ON ?auto_799717 ?auto_799718 ) ( CLEAR ?auto_799717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_799715 ?auto_799716 ?auto_799717 )
      ( MAKE-17PILE ?auto_799715 ?auto_799716 ?auto_799717 ?auto_799718 ?auto_799719 ?auto_799720 ?auto_799721 ?auto_799722 ?auto_799723 ?auto_799724 ?auto_799725 ?auto_799726 ?auto_799727 ?auto_799728 ?auto_799729 ?auto_799730 ?auto_799731 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_799785 - BLOCK
      ?auto_799786 - BLOCK
      ?auto_799787 - BLOCK
      ?auto_799788 - BLOCK
      ?auto_799789 - BLOCK
      ?auto_799790 - BLOCK
      ?auto_799791 - BLOCK
      ?auto_799792 - BLOCK
      ?auto_799793 - BLOCK
      ?auto_799794 - BLOCK
      ?auto_799795 - BLOCK
      ?auto_799796 - BLOCK
      ?auto_799797 - BLOCK
      ?auto_799798 - BLOCK
      ?auto_799799 - BLOCK
      ?auto_799800 - BLOCK
      ?auto_799801 - BLOCK
    )
    :vars
    (
      ?auto_799802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_799801 ?auto_799802 ) ( ON-TABLE ?auto_799785 ) ( not ( = ?auto_799785 ?auto_799786 ) ) ( not ( = ?auto_799785 ?auto_799787 ) ) ( not ( = ?auto_799785 ?auto_799788 ) ) ( not ( = ?auto_799785 ?auto_799789 ) ) ( not ( = ?auto_799785 ?auto_799790 ) ) ( not ( = ?auto_799785 ?auto_799791 ) ) ( not ( = ?auto_799785 ?auto_799792 ) ) ( not ( = ?auto_799785 ?auto_799793 ) ) ( not ( = ?auto_799785 ?auto_799794 ) ) ( not ( = ?auto_799785 ?auto_799795 ) ) ( not ( = ?auto_799785 ?auto_799796 ) ) ( not ( = ?auto_799785 ?auto_799797 ) ) ( not ( = ?auto_799785 ?auto_799798 ) ) ( not ( = ?auto_799785 ?auto_799799 ) ) ( not ( = ?auto_799785 ?auto_799800 ) ) ( not ( = ?auto_799785 ?auto_799801 ) ) ( not ( = ?auto_799785 ?auto_799802 ) ) ( not ( = ?auto_799786 ?auto_799787 ) ) ( not ( = ?auto_799786 ?auto_799788 ) ) ( not ( = ?auto_799786 ?auto_799789 ) ) ( not ( = ?auto_799786 ?auto_799790 ) ) ( not ( = ?auto_799786 ?auto_799791 ) ) ( not ( = ?auto_799786 ?auto_799792 ) ) ( not ( = ?auto_799786 ?auto_799793 ) ) ( not ( = ?auto_799786 ?auto_799794 ) ) ( not ( = ?auto_799786 ?auto_799795 ) ) ( not ( = ?auto_799786 ?auto_799796 ) ) ( not ( = ?auto_799786 ?auto_799797 ) ) ( not ( = ?auto_799786 ?auto_799798 ) ) ( not ( = ?auto_799786 ?auto_799799 ) ) ( not ( = ?auto_799786 ?auto_799800 ) ) ( not ( = ?auto_799786 ?auto_799801 ) ) ( not ( = ?auto_799786 ?auto_799802 ) ) ( not ( = ?auto_799787 ?auto_799788 ) ) ( not ( = ?auto_799787 ?auto_799789 ) ) ( not ( = ?auto_799787 ?auto_799790 ) ) ( not ( = ?auto_799787 ?auto_799791 ) ) ( not ( = ?auto_799787 ?auto_799792 ) ) ( not ( = ?auto_799787 ?auto_799793 ) ) ( not ( = ?auto_799787 ?auto_799794 ) ) ( not ( = ?auto_799787 ?auto_799795 ) ) ( not ( = ?auto_799787 ?auto_799796 ) ) ( not ( = ?auto_799787 ?auto_799797 ) ) ( not ( = ?auto_799787 ?auto_799798 ) ) ( not ( = ?auto_799787 ?auto_799799 ) ) ( not ( = ?auto_799787 ?auto_799800 ) ) ( not ( = ?auto_799787 ?auto_799801 ) ) ( not ( = ?auto_799787 ?auto_799802 ) ) ( not ( = ?auto_799788 ?auto_799789 ) ) ( not ( = ?auto_799788 ?auto_799790 ) ) ( not ( = ?auto_799788 ?auto_799791 ) ) ( not ( = ?auto_799788 ?auto_799792 ) ) ( not ( = ?auto_799788 ?auto_799793 ) ) ( not ( = ?auto_799788 ?auto_799794 ) ) ( not ( = ?auto_799788 ?auto_799795 ) ) ( not ( = ?auto_799788 ?auto_799796 ) ) ( not ( = ?auto_799788 ?auto_799797 ) ) ( not ( = ?auto_799788 ?auto_799798 ) ) ( not ( = ?auto_799788 ?auto_799799 ) ) ( not ( = ?auto_799788 ?auto_799800 ) ) ( not ( = ?auto_799788 ?auto_799801 ) ) ( not ( = ?auto_799788 ?auto_799802 ) ) ( not ( = ?auto_799789 ?auto_799790 ) ) ( not ( = ?auto_799789 ?auto_799791 ) ) ( not ( = ?auto_799789 ?auto_799792 ) ) ( not ( = ?auto_799789 ?auto_799793 ) ) ( not ( = ?auto_799789 ?auto_799794 ) ) ( not ( = ?auto_799789 ?auto_799795 ) ) ( not ( = ?auto_799789 ?auto_799796 ) ) ( not ( = ?auto_799789 ?auto_799797 ) ) ( not ( = ?auto_799789 ?auto_799798 ) ) ( not ( = ?auto_799789 ?auto_799799 ) ) ( not ( = ?auto_799789 ?auto_799800 ) ) ( not ( = ?auto_799789 ?auto_799801 ) ) ( not ( = ?auto_799789 ?auto_799802 ) ) ( not ( = ?auto_799790 ?auto_799791 ) ) ( not ( = ?auto_799790 ?auto_799792 ) ) ( not ( = ?auto_799790 ?auto_799793 ) ) ( not ( = ?auto_799790 ?auto_799794 ) ) ( not ( = ?auto_799790 ?auto_799795 ) ) ( not ( = ?auto_799790 ?auto_799796 ) ) ( not ( = ?auto_799790 ?auto_799797 ) ) ( not ( = ?auto_799790 ?auto_799798 ) ) ( not ( = ?auto_799790 ?auto_799799 ) ) ( not ( = ?auto_799790 ?auto_799800 ) ) ( not ( = ?auto_799790 ?auto_799801 ) ) ( not ( = ?auto_799790 ?auto_799802 ) ) ( not ( = ?auto_799791 ?auto_799792 ) ) ( not ( = ?auto_799791 ?auto_799793 ) ) ( not ( = ?auto_799791 ?auto_799794 ) ) ( not ( = ?auto_799791 ?auto_799795 ) ) ( not ( = ?auto_799791 ?auto_799796 ) ) ( not ( = ?auto_799791 ?auto_799797 ) ) ( not ( = ?auto_799791 ?auto_799798 ) ) ( not ( = ?auto_799791 ?auto_799799 ) ) ( not ( = ?auto_799791 ?auto_799800 ) ) ( not ( = ?auto_799791 ?auto_799801 ) ) ( not ( = ?auto_799791 ?auto_799802 ) ) ( not ( = ?auto_799792 ?auto_799793 ) ) ( not ( = ?auto_799792 ?auto_799794 ) ) ( not ( = ?auto_799792 ?auto_799795 ) ) ( not ( = ?auto_799792 ?auto_799796 ) ) ( not ( = ?auto_799792 ?auto_799797 ) ) ( not ( = ?auto_799792 ?auto_799798 ) ) ( not ( = ?auto_799792 ?auto_799799 ) ) ( not ( = ?auto_799792 ?auto_799800 ) ) ( not ( = ?auto_799792 ?auto_799801 ) ) ( not ( = ?auto_799792 ?auto_799802 ) ) ( not ( = ?auto_799793 ?auto_799794 ) ) ( not ( = ?auto_799793 ?auto_799795 ) ) ( not ( = ?auto_799793 ?auto_799796 ) ) ( not ( = ?auto_799793 ?auto_799797 ) ) ( not ( = ?auto_799793 ?auto_799798 ) ) ( not ( = ?auto_799793 ?auto_799799 ) ) ( not ( = ?auto_799793 ?auto_799800 ) ) ( not ( = ?auto_799793 ?auto_799801 ) ) ( not ( = ?auto_799793 ?auto_799802 ) ) ( not ( = ?auto_799794 ?auto_799795 ) ) ( not ( = ?auto_799794 ?auto_799796 ) ) ( not ( = ?auto_799794 ?auto_799797 ) ) ( not ( = ?auto_799794 ?auto_799798 ) ) ( not ( = ?auto_799794 ?auto_799799 ) ) ( not ( = ?auto_799794 ?auto_799800 ) ) ( not ( = ?auto_799794 ?auto_799801 ) ) ( not ( = ?auto_799794 ?auto_799802 ) ) ( not ( = ?auto_799795 ?auto_799796 ) ) ( not ( = ?auto_799795 ?auto_799797 ) ) ( not ( = ?auto_799795 ?auto_799798 ) ) ( not ( = ?auto_799795 ?auto_799799 ) ) ( not ( = ?auto_799795 ?auto_799800 ) ) ( not ( = ?auto_799795 ?auto_799801 ) ) ( not ( = ?auto_799795 ?auto_799802 ) ) ( not ( = ?auto_799796 ?auto_799797 ) ) ( not ( = ?auto_799796 ?auto_799798 ) ) ( not ( = ?auto_799796 ?auto_799799 ) ) ( not ( = ?auto_799796 ?auto_799800 ) ) ( not ( = ?auto_799796 ?auto_799801 ) ) ( not ( = ?auto_799796 ?auto_799802 ) ) ( not ( = ?auto_799797 ?auto_799798 ) ) ( not ( = ?auto_799797 ?auto_799799 ) ) ( not ( = ?auto_799797 ?auto_799800 ) ) ( not ( = ?auto_799797 ?auto_799801 ) ) ( not ( = ?auto_799797 ?auto_799802 ) ) ( not ( = ?auto_799798 ?auto_799799 ) ) ( not ( = ?auto_799798 ?auto_799800 ) ) ( not ( = ?auto_799798 ?auto_799801 ) ) ( not ( = ?auto_799798 ?auto_799802 ) ) ( not ( = ?auto_799799 ?auto_799800 ) ) ( not ( = ?auto_799799 ?auto_799801 ) ) ( not ( = ?auto_799799 ?auto_799802 ) ) ( not ( = ?auto_799800 ?auto_799801 ) ) ( not ( = ?auto_799800 ?auto_799802 ) ) ( not ( = ?auto_799801 ?auto_799802 ) ) ( ON ?auto_799800 ?auto_799801 ) ( ON ?auto_799799 ?auto_799800 ) ( ON ?auto_799798 ?auto_799799 ) ( ON ?auto_799797 ?auto_799798 ) ( ON ?auto_799796 ?auto_799797 ) ( ON ?auto_799795 ?auto_799796 ) ( ON ?auto_799794 ?auto_799795 ) ( ON ?auto_799793 ?auto_799794 ) ( ON ?auto_799792 ?auto_799793 ) ( ON ?auto_799791 ?auto_799792 ) ( ON ?auto_799790 ?auto_799791 ) ( ON ?auto_799789 ?auto_799790 ) ( ON ?auto_799788 ?auto_799789 ) ( ON ?auto_799787 ?auto_799788 ) ( CLEAR ?auto_799785 ) ( ON ?auto_799786 ?auto_799787 ) ( CLEAR ?auto_799786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_799785 ?auto_799786 )
      ( MAKE-17PILE ?auto_799785 ?auto_799786 ?auto_799787 ?auto_799788 ?auto_799789 ?auto_799790 ?auto_799791 ?auto_799792 ?auto_799793 ?auto_799794 ?auto_799795 ?auto_799796 ?auto_799797 ?auto_799798 ?auto_799799 ?auto_799800 ?auto_799801 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_799855 - BLOCK
      ?auto_799856 - BLOCK
      ?auto_799857 - BLOCK
      ?auto_799858 - BLOCK
      ?auto_799859 - BLOCK
      ?auto_799860 - BLOCK
      ?auto_799861 - BLOCK
      ?auto_799862 - BLOCK
      ?auto_799863 - BLOCK
      ?auto_799864 - BLOCK
      ?auto_799865 - BLOCK
      ?auto_799866 - BLOCK
      ?auto_799867 - BLOCK
      ?auto_799868 - BLOCK
      ?auto_799869 - BLOCK
      ?auto_799870 - BLOCK
      ?auto_799871 - BLOCK
    )
    :vars
    (
      ?auto_799872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_799871 ?auto_799872 ) ( not ( = ?auto_799855 ?auto_799856 ) ) ( not ( = ?auto_799855 ?auto_799857 ) ) ( not ( = ?auto_799855 ?auto_799858 ) ) ( not ( = ?auto_799855 ?auto_799859 ) ) ( not ( = ?auto_799855 ?auto_799860 ) ) ( not ( = ?auto_799855 ?auto_799861 ) ) ( not ( = ?auto_799855 ?auto_799862 ) ) ( not ( = ?auto_799855 ?auto_799863 ) ) ( not ( = ?auto_799855 ?auto_799864 ) ) ( not ( = ?auto_799855 ?auto_799865 ) ) ( not ( = ?auto_799855 ?auto_799866 ) ) ( not ( = ?auto_799855 ?auto_799867 ) ) ( not ( = ?auto_799855 ?auto_799868 ) ) ( not ( = ?auto_799855 ?auto_799869 ) ) ( not ( = ?auto_799855 ?auto_799870 ) ) ( not ( = ?auto_799855 ?auto_799871 ) ) ( not ( = ?auto_799855 ?auto_799872 ) ) ( not ( = ?auto_799856 ?auto_799857 ) ) ( not ( = ?auto_799856 ?auto_799858 ) ) ( not ( = ?auto_799856 ?auto_799859 ) ) ( not ( = ?auto_799856 ?auto_799860 ) ) ( not ( = ?auto_799856 ?auto_799861 ) ) ( not ( = ?auto_799856 ?auto_799862 ) ) ( not ( = ?auto_799856 ?auto_799863 ) ) ( not ( = ?auto_799856 ?auto_799864 ) ) ( not ( = ?auto_799856 ?auto_799865 ) ) ( not ( = ?auto_799856 ?auto_799866 ) ) ( not ( = ?auto_799856 ?auto_799867 ) ) ( not ( = ?auto_799856 ?auto_799868 ) ) ( not ( = ?auto_799856 ?auto_799869 ) ) ( not ( = ?auto_799856 ?auto_799870 ) ) ( not ( = ?auto_799856 ?auto_799871 ) ) ( not ( = ?auto_799856 ?auto_799872 ) ) ( not ( = ?auto_799857 ?auto_799858 ) ) ( not ( = ?auto_799857 ?auto_799859 ) ) ( not ( = ?auto_799857 ?auto_799860 ) ) ( not ( = ?auto_799857 ?auto_799861 ) ) ( not ( = ?auto_799857 ?auto_799862 ) ) ( not ( = ?auto_799857 ?auto_799863 ) ) ( not ( = ?auto_799857 ?auto_799864 ) ) ( not ( = ?auto_799857 ?auto_799865 ) ) ( not ( = ?auto_799857 ?auto_799866 ) ) ( not ( = ?auto_799857 ?auto_799867 ) ) ( not ( = ?auto_799857 ?auto_799868 ) ) ( not ( = ?auto_799857 ?auto_799869 ) ) ( not ( = ?auto_799857 ?auto_799870 ) ) ( not ( = ?auto_799857 ?auto_799871 ) ) ( not ( = ?auto_799857 ?auto_799872 ) ) ( not ( = ?auto_799858 ?auto_799859 ) ) ( not ( = ?auto_799858 ?auto_799860 ) ) ( not ( = ?auto_799858 ?auto_799861 ) ) ( not ( = ?auto_799858 ?auto_799862 ) ) ( not ( = ?auto_799858 ?auto_799863 ) ) ( not ( = ?auto_799858 ?auto_799864 ) ) ( not ( = ?auto_799858 ?auto_799865 ) ) ( not ( = ?auto_799858 ?auto_799866 ) ) ( not ( = ?auto_799858 ?auto_799867 ) ) ( not ( = ?auto_799858 ?auto_799868 ) ) ( not ( = ?auto_799858 ?auto_799869 ) ) ( not ( = ?auto_799858 ?auto_799870 ) ) ( not ( = ?auto_799858 ?auto_799871 ) ) ( not ( = ?auto_799858 ?auto_799872 ) ) ( not ( = ?auto_799859 ?auto_799860 ) ) ( not ( = ?auto_799859 ?auto_799861 ) ) ( not ( = ?auto_799859 ?auto_799862 ) ) ( not ( = ?auto_799859 ?auto_799863 ) ) ( not ( = ?auto_799859 ?auto_799864 ) ) ( not ( = ?auto_799859 ?auto_799865 ) ) ( not ( = ?auto_799859 ?auto_799866 ) ) ( not ( = ?auto_799859 ?auto_799867 ) ) ( not ( = ?auto_799859 ?auto_799868 ) ) ( not ( = ?auto_799859 ?auto_799869 ) ) ( not ( = ?auto_799859 ?auto_799870 ) ) ( not ( = ?auto_799859 ?auto_799871 ) ) ( not ( = ?auto_799859 ?auto_799872 ) ) ( not ( = ?auto_799860 ?auto_799861 ) ) ( not ( = ?auto_799860 ?auto_799862 ) ) ( not ( = ?auto_799860 ?auto_799863 ) ) ( not ( = ?auto_799860 ?auto_799864 ) ) ( not ( = ?auto_799860 ?auto_799865 ) ) ( not ( = ?auto_799860 ?auto_799866 ) ) ( not ( = ?auto_799860 ?auto_799867 ) ) ( not ( = ?auto_799860 ?auto_799868 ) ) ( not ( = ?auto_799860 ?auto_799869 ) ) ( not ( = ?auto_799860 ?auto_799870 ) ) ( not ( = ?auto_799860 ?auto_799871 ) ) ( not ( = ?auto_799860 ?auto_799872 ) ) ( not ( = ?auto_799861 ?auto_799862 ) ) ( not ( = ?auto_799861 ?auto_799863 ) ) ( not ( = ?auto_799861 ?auto_799864 ) ) ( not ( = ?auto_799861 ?auto_799865 ) ) ( not ( = ?auto_799861 ?auto_799866 ) ) ( not ( = ?auto_799861 ?auto_799867 ) ) ( not ( = ?auto_799861 ?auto_799868 ) ) ( not ( = ?auto_799861 ?auto_799869 ) ) ( not ( = ?auto_799861 ?auto_799870 ) ) ( not ( = ?auto_799861 ?auto_799871 ) ) ( not ( = ?auto_799861 ?auto_799872 ) ) ( not ( = ?auto_799862 ?auto_799863 ) ) ( not ( = ?auto_799862 ?auto_799864 ) ) ( not ( = ?auto_799862 ?auto_799865 ) ) ( not ( = ?auto_799862 ?auto_799866 ) ) ( not ( = ?auto_799862 ?auto_799867 ) ) ( not ( = ?auto_799862 ?auto_799868 ) ) ( not ( = ?auto_799862 ?auto_799869 ) ) ( not ( = ?auto_799862 ?auto_799870 ) ) ( not ( = ?auto_799862 ?auto_799871 ) ) ( not ( = ?auto_799862 ?auto_799872 ) ) ( not ( = ?auto_799863 ?auto_799864 ) ) ( not ( = ?auto_799863 ?auto_799865 ) ) ( not ( = ?auto_799863 ?auto_799866 ) ) ( not ( = ?auto_799863 ?auto_799867 ) ) ( not ( = ?auto_799863 ?auto_799868 ) ) ( not ( = ?auto_799863 ?auto_799869 ) ) ( not ( = ?auto_799863 ?auto_799870 ) ) ( not ( = ?auto_799863 ?auto_799871 ) ) ( not ( = ?auto_799863 ?auto_799872 ) ) ( not ( = ?auto_799864 ?auto_799865 ) ) ( not ( = ?auto_799864 ?auto_799866 ) ) ( not ( = ?auto_799864 ?auto_799867 ) ) ( not ( = ?auto_799864 ?auto_799868 ) ) ( not ( = ?auto_799864 ?auto_799869 ) ) ( not ( = ?auto_799864 ?auto_799870 ) ) ( not ( = ?auto_799864 ?auto_799871 ) ) ( not ( = ?auto_799864 ?auto_799872 ) ) ( not ( = ?auto_799865 ?auto_799866 ) ) ( not ( = ?auto_799865 ?auto_799867 ) ) ( not ( = ?auto_799865 ?auto_799868 ) ) ( not ( = ?auto_799865 ?auto_799869 ) ) ( not ( = ?auto_799865 ?auto_799870 ) ) ( not ( = ?auto_799865 ?auto_799871 ) ) ( not ( = ?auto_799865 ?auto_799872 ) ) ( not ( = ?auto_799866 ?auto_799867 ) ) ( not ( = ?auto_799866 ?auto_799868 ) ) ( not ( = ?auto_799866 ?auto_799869 ) ) ( not ( = ?auto_799866 ?auto_799870 ) ) ( not ( = ?auto_799866 ?auto_799871 ) ) ( not ( = ?auto_799866 ?auto_799872 ) ) ( not ( = ?auto_799867 ?auto_799868 ) ) ( not ( = ?auto_799867 ?auto_799869 ) ) ( not ( = ?auto_799867 ?auto_799870 ) ) ( not ( = ?auto_799867 ?auto_799871 ) ) ( not ( = ?auto_799867 ?auto_799872 ) ) ( not ( = ?auto_799868 ?auto_799869 ) ) ( not ( = ?auto_799868 ?auto_799870 ) ) ( not ( = ?auto_799868 ?auto_799871 ) ) ( not ( = ?auto_799868 ?auto_799872 ) ) ( not ( = ?auto_799869 ?auto_799870 ) ) ( not ( = ?auto_799869 ?auto_799871 ) ) ( not ( = ?auto_799869 ?auto_799872 ) ) ( not ( = ?auto_799870 ?auto_799871 ) ) ( not ( = ?auto_799870 ?auto_799872 ) ) ( not ( = ?auto_799871 ?auto_799872 ) ) ( ON ?auto_799870 ?auto_799871 ) ( ON ?auto_799869 ?auto_799870 ) ( ON ?auto_799868 ?auto_799869 ) ( ON ?auto_799867 ?auto_799868 ) ( ON ?auto_799866 ?auto_799867 ) ( ON ?auto_799865 ?auto_799866 ) ( ON ?auto_799864 ?auto_799865 ) ( ON ?auto_799863 ?auto_799864 ) ( ON ?auto_799862 ?auto_799863 ) ( ON ?auto_799861 ?auto_799862 ) ( ON ?auto_799860 ?auto_799861 ) ( ON ?auto_799859 ?auto_799860 ) ( ON ?auto_799858 ?auto_799859 ) ( ON ?auto_799857 ?auto_799858 ) ( ON ?auto_799856 ?auto_799857 ) ( ON ?auto_799855 ?auto_799856 ) ( CLEAR ?auto_799855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_799855 )
      ( MAKE-17PILE ?auto_799855 ?auto_799856 ?auto_799857 ?auto_799858 ?auto_799859 ?auto_799860 ?auto_799861 ?auto_799862 ?auto_799863 ?auto_799864 ?auto_799865 ?auto_799866 ?auto_799867 ?auto_799868 ?auto_799869 ?auto_799870 ?auto_799871 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_799926 - BLOCK
      ?auto_799927 - BLOCK
      ?auto_799928 - BLOCK
      ?auto_799929 - BLOCK
      ?auto_799930 - BLOCK
      ?auto_799931 - BLOCK
      ?auto_799932 - BLOCK
      ?auto_799933 - BLOCK
      ?auto_799934 - BLOCK
      ?auto_799935 - BLOCK
      ?auto_799936 - BLOCK
      ?auto_799937 - BLOCK
      ?auto_799938 - BLOCK
      ?auto_799939 - BLOCK
      ?auto_799940 - BLOCK
      ?auto_799941 - BLOCK
      ?auto_799942 - BLOCK
      ?auto_799943 - BLOCK
    )
    :vars
    (
      ?auto_799944 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_799942 ) ( ON ?auto_799943 ?auto_799944 ) ( CLEAR ?auto_799943 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_799926 ) ( ON ?auto_799927 ?auto_799926 ) ( ON ?auto_799928 ?auto_799927 ) ( ON ?auto_799929 ?auto_799928 ) ( ON ?auto_799930 ?auto_799929 ) ( ON ?auto_799931 ?auto_799930 ) ( ON ?auto_799932 ?auto_799931 ) ( ON ?auto_799933 ?auto_799932 ) ( ON ?auto_799934 ?auto_799933 ) ( ON ?auto_799935 ?auto_799934 ) ( ON ?auto_799936 ?auto_799935 ) ( ON ?auto_799937 ?auto_799936 ) ( ON ?auto_799938 ?auto_799937 ) ( ON ?auto_799939 ?auto_799938 ) ( ON ?auto_799940 ?auto_799939 ) ( ON ?auto_799941 ?auto_799940 ) ( ON ?auto_799942 ?auto_799941 ) ( not ( = ?auto_799926 ?auto_799927 ) ) ( not ( = ?auto_799926 ?auto_799928 ) ) ( not ( = ?auto_799926 ?auto_799929 ) ) ( not ( = ?auto_799926 ?auto_799930 ) ) ( not ( = ?auto_799926 ?auto_799931 ) ) ( not ( = ?auto_799926 ?auto_799932 ) ) ( not ( = ?auto_799926 ?auto_799933 ) ) ( not ( = ?auto_799926 ?auto_799934 ) ) ( not ( = ?auto_799926 ?auto_799935 ) ) ( not ( = ?auto_799926 ?auto_799936 ) ) ( not ( = ?auto_799926 ?auto_799937 ) ) ( not ( = ?auto_799926 ?auto_799938 ) ) ( not ( = ?auto_799926 ?auto_799939 ) ) ( not ( = ?auto_799926 ?auto_799940 ) ) ( not ( = ?auto_799926 ?auto_799941 ) ) ( not ( = ?auto_799926 ?auto_799942 ) ) ( not ( = ?auto_799926 ?auto_799943 ) ) ( not ( = ?auto_799926 ?auto_799944 ) ) ( not ( = ?auto_799927 ?auto_799928 ) ) ( not ( = ?auto_799927 ?auto_799929 ) ) ( not ( = ?auto_799927 ?auto_799930 ) ) ( not ( = ?auto_799927 ?auto_799931 ) ) ( not ( = ?auto_799927 ?auto_799932 ) ) ( not ( = ?auto_799927 ?auto_799933 ) ) ( not ( = ?auto_799927 ?auto_799934 ) ) ( not ( = ?auto_799927 ?auto_799935 ) ) ( not ( = ?auto_799927 ?auto_799936 ) ) ( not ( = ?auto_799927 ?auto_799937 ) ) ( not ( = ?auto_799927 ?auto_799938 ) ) ( not ( = ?auto_799927 ?auto_799939 ) ) ( not ( = ?auto_799927 ?auto_799940 ) ) ( not ( = ?auto_799927 ?auto_799941 ) ) ( not ( = ?auto_799927 ?auto_799942 ) ) ( not ( = ?auto_799927 ?auto_799943 ) ) ( not ( = ?auto_799927 ?auto_799944 ) ) ( not ( = ?auto_799928 ?auto_799929 ) ) ( not ( = ?auto_799928 ?auto_799930 ) ) ( not ( = ?auto_799928 ?auto_799931 ) ) ( not ( = ?auto_799928 ?auto_799932 ) ) ( not ( = ?auto_799928 ?auto_799933 ) ) ( not ( = ?auto_799928 ?auto_799934 ) ) ( not ( = ?auto_799928 ?auto_799935 ) ) ( not ( = ?auto_799928 ?auto_799936 ) ) ( not ( = ?auto_799928 ?auto_799937 ) ) ( not ( = ?auto_799928 ?auto_799938 ) ) ( not ( = ?auto_799928 ?auto_799939 ) ) ( not ( = ?auto_799928 ?auto_799940 ) ) ( not ( = ?auto_799928 ?auto_799941 ) ) ( not ( = ?auto_799928 ?auto_799942 ) ) ( not ( = ?auto_799928 ?auto_799943 ) ) ( not ( = ?auto_799928 ?auto_799944 ) ) ( not ( = ?auto_799929 ?auto_799930 ) ) ( not ( = ?auto_799929 ?auto_799931 ) ) ( not ( = ?auto_799929 ?auto_799932 ) ) ( not ( = ?auto_799929 ?auto_799933 ) ) ( not ( = ?auto_799929 ?auto_799934 ) ) ( not ( = ?auto_799929 ?auto_799935 ) ) ( not ( = ?auto_799929 ?auto_799936 ) ) ( not ( = ?auto_799929 ?auto_799937 ) ) ( not ( = ?auto_799929 ?auto_799938 ) ) ( not ( = ?auto_799929 ?auto_799939 ) ) ( not ( = ?auto_799929 ?auto_799940 ) ) ( not ( = ?auto_799929 ?auto_799941 ) ) ( not ( = ?auto_799929 ?auto_799942 ) ) ( not ( = ?auto_799929 ?auto_799943 ) ) ( not ( = ?auto_799929 ?auto_799944 ) ) ( not ( = ?auto_799930 ?auto_799931 ) ) ( not ( = ?auto_799930 ?auto_799932 ) ) ( not ( = ?auto_799930 ?auto_799933 ) ) ( not ( = ?auto_799930 ?auto_799934 ) ) ( not ( = ?auto_799930 ?auto_799935 ) ) ( not ( = ?auto_799930 ?auto_799936 ) ) ( not ( = ?auto_799930 ?auto_799937 ) ) ( not ( = ?auto_799930 ?auto_799938 ) ) ( not ( = ?auto_799930 ?auto_799939 ) ) ( not ( = ?auto_799930 ?auto_799940 ) ) ( not ( = ?auto_799930 ?auto_799941 ) ) ( not ( = ?auto_799930 ?auto_799942 ) ) ( not ( = ?auto_799930 ?auto_799943 ) ) ( not ( = ?auto_799930 ?auto_799944 ) ) ( not ( = ?auto_799931 ?auto_799932 ) ) ( not ( = ?auto_799931 ?auto_799933 ) ) ( not ( = ?auto_799931 ?auto_799934 ) ) ( not ( = ?auto_799931 ?auto_799935 ) ) ( not ( = ?auto_799931 ?auto_799936 ) ) ( not ( = ?auto_799931 ?auto_799937 ) ) ( not ( = ?auto_799931 ?auto_799938 ) ) ( not ( = ?auto_799931 ?auto_799939 ) ) ( not ( = ?auto_799931 ?auto_799940 ) ) ( not ( = ?auto_799931 ?auto_799941 ) ) ( not ( = ?auto_799931 ?auto_799942 ) ) ( not ( = ?auto_799931 ?auto_799943 ) ) ( not ( = ?auto_799931 ?auto_799944 ) ) ( not ( = ?auto_799932 ?auto_799933 ) ) ( not ( = ?auto_799932 ?auto_799934 ) ) ( not ( = ?auto_799932 ?auto_799935 ) ) ( not ( = ?auto_799932 ?auto_799936 ) ) ( not ( = ?auto_799932 ?auto_799937 ) ) ( not ( = ?auto_799932 ?auto_799938 ) ) ( not ( = ?auto_799932 ?auto_799939 ) ) ( not ( = ?auto_799932 ?auto_799940 ) ) ( not ( = ?auto_799932 ?auto_799941 ) ) ( not ( = ?auto_799932 ?auto_799942 ) ) ( not ( = ?auto_799932 ?auto_799943 ) ) ( not ( = ?auto_799932 ?auto_799944 ) ) ( not ( = ?auto_799933 ?auto_799934 ) ) ( not ( = ?auto_799933 ?auto_799935 ) ) ( not ( = ?auto_799933 ?auto_799936 ) ) ( not ( = ?auto_799933 ?auto_799937 ) ) ( not ( = ?auto_799933 ?auto_799938 ) ) ( not ( = ?auto_799933 ?auto_799939 ) ) ( not ( = ?auto_799933 ?auto_799940 ) ) ( not ( = ?auto_799933 ?auto_799941 ) ) ( not ( = ?auto_799933 ?auto_799942 ) ) ( not ( = ?auto_799933 ?auto_799943 ) ) ( not ( = ?auto_799933 ?auto_799944 ) ) ( not ( = ?auto_799934 ?auto_799935 ) ) ( not ( = ?auto_799934 ?auto_799936 ) ) ( not ( = ?auto_799934 ?auto_799937 ) ) ( not ( = ?auto_799934 ?auto_799938 ) ) ( not ( = ?auto_799934 ?auto_799939 ) ) ( not ( = ?auto_799934 ?auto_799940 ) ) ( not ( = ?auto_799934 ?auto_799941 ) ) ( not ( = ?auto_799934 ?auto_799942 ) ) ( not ( = ?auto_799934 ?auto_799943 ) ) ( not ( = ?auto_799934 ?auto_799944 ) ) ( not ( = ?auto_799935 ?auto_799936 ) ) ( not ( = ?auto_799935 ?auto_799937 ) ) ( not ( = ?auto_799935 ?auto_799938 ) ) ( not ( = ?auto_799935 ?auto_799939 ) ) ( not ( = ?auto_799935 ?auto_799940 ) ) ( not ( = ?auto_799935 ?auto_799941 ) ) ( not ( = ?auto_799935 ?auto_799942 ) ) ( not ( = ?auto_799935 ?auto_799943 ) ) ( not ( = ?auto_799935 ?auto_799944 ) ) ( not ( = ?auto_799936 ?auto_799937 ) ) ( not ( = ?auto_799936 ?auto_799938 ) ) ( not ( = ?auto_799936 ?auto_799939 ) ) ( not ( = ?auto_799936 ?auto_799940 ) ) ( not ( = ?auto_799936 ?auto_799941 ) ) ( not ( = ?auto_799936 ?auto_799942 ) ) ( not ( = ?auto_799936 ?auto_799943 ) ) ( not ( = ?auto_799936 ?auto_799944 ) ) ( not ( = ?auto_799937 ?auto_799938 ) ) ( not ( = ?auto_799937 ?auto_799939 ) ) ( not ( = ?auto_799937 ?auto_799940 ) ) ( not ( = ?auto_799937 ?auto_799941 ) ) ( not ( = ?auto_799937 ?auto_799942 ) ) ( not ( = ?auto_799937 ?auto_799943 ) ) ( not ( = ?auto_799937 ?auto_799944 ) ) ( not ( = ?auto_799938 ?auto_799939 ) ) ( not ( = ?auto_799938 ?auto_799940 ) ) ( not ( = ?auto_799938 ?auto_799941 ) ) ( not ( = ?auto_799938 ?auto_799942 ) ) ( not ( = ?auto_799938 ?auto_799943 ) ) ( not ( = ?auto_799938 ?auto_799944 ) ) ( not ( = ?auto_799939 ?auto_799940 ) ) ( not ( = ?auto_799939 ?auto_799941 ) ) ( not ( = ?auto_799939 ?auto_799942 ) ) ( not ( = ?auto_799939 ?auto_799943 ) ) ( not ( = ?auto_799939 ?auto_799944 ) ) ( not ( = ?auto_799940 ?auto_799941 ) ) ( not ( = ?auto_799940 ?auto_799942 ) ) ( not ( = ?auto_799940 ?auto_799943 ) ) ( not ( = ?auto_799940 ?auto_799944 ) ) ( not ( = ?auto_799941 ?auto_799942 ) ) ( not ( = ?auto_799941 ?auto_799943 ) ) ( not ( = ?auto_799941 ?auto_799944 ) ) ( not ( = ?auto_799942 ?auto_799943 ) ) ( not ( = ?auto_799942 ?auto_799944 ) ) ( not ( = ?auto_799943 ?auto_799944 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_799943 ?auto_799944 )
      ( !STACK ?auto_799943 ?auto_799942 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_799963 - BLOCK
      ?auto_799964 - BLOCK
      ?auto_799965 - BLOCK
      ?auto_799966 - BLOCK
      ?auto_799967 - BLOCK
      ?auto_799968 - BLOCK
      ?auto_799969 - BLOCK
      ?auto_799970 - BLOCK
      ?auto_799971 - BLOCK
      ?auto_799972 - BLOCK
      ?auto_799973 - BLOCK
      ?auto_799974 - BLOCK
      ?auto_799975 - BLOCK
      ?auto_799976 - BLOCK
      ?auto_799977 - BLOCK
      ?auto_799978 - BLOCK
      ?auto_799979 - BLOCK
      ?auto_799980 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_799979 ) ( ON-TABLE ?auto_799980 ) ( CLEAR ?auto_799980 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_799963 ) ( ON ?auto_799964 ?auto_799963 ) ( ON ?auto_799965 ?auto_799964 ) ( ON ?auto_799966 ?auto_799965 ) ( ON ?auto_799967 ?auto_799966 ) ( ON ?auto_799968 ?auto_799967 ) ( ON ?auto_799969 ?auto_799968 ) ( ON ?auto_799970 ?auto_799969 ) ( ON ?auto_799971 ?auto_799970 ) ( ON ?auto_799972 ?auto_799971 ) ( ON ?auto_799973 ?auto_799972 ) ( ON ?auto_799974 ?auto_799973 ) ( ON ?auto_799975 ?auto_799974 ) ( ON ?auto_799976 ?auto_799975 ) ( ON ?auto_799977 ?auto_799976 ) ( ON ?auto_799978 ?auto_799977 ) ( ON ?auto_799979 ?auto_799978 ) ( not ( = ?auto_799963 ?auto_799964 ) ) ( not ( = ?auto_799963 ?auto_799965 ) ) ( not ( = ?auto_799963 ?auto_799966 ) ) ( not ( = ?auto_799963 ?auto_799967 ) ) ( not ( = ?auto_799963 ?auto_799968 ) ) ( not ( = ?auto_799963 ?auto_799969 ) ) ( not ( = ?auto_799963 ?auto_799970 ) ) ( not ( = ?auto_799963 ?auto_799971 ) ) ( not ( = ?auto_799963 ?auto_799972 ) ) ( not ( = ?auto_799963 ?auto_799973 ) ) ( not ( = ?auto_799963 ?auto_799974 ) ) ( not ( = ?auto_799963 ?auto_799975 ) ) ( not ( = ?auto_799963 ?auto_799976 ) ) ( not ( = ?auto_799963 ?auto_799977 ) ) ( not ( = ?auto_799963 ?auto_799978 ) ) ( not ( = ?auto_799963 ?auto_799979 ) ) ( not ( = ?auto_799963 ?auto_799980 ) ) ( not ( = ?auto_799964 ?auto_799965 ) ) ( not ( = ?auto_799964 ?auto_799966 ) ) ( not ( = ?auto_799964 ?auto_799967 ) ) ( not ( = ?auto_799964 ?auto_799968 ) ) ( not ( = ?auto_799964 ?auto_799969 ) ) ( not ( = ?auto_799964 ?auto_799970 ) ) ( not ( = ?auto_799964 ?auto_799971 ) ) ( not ( = ?auto_799964 ?auto_799972 ) ) ( not ( = ?auto_799964 ?auto_799973 ) ) ( not ( = ?auto_799964 ?auto_799974 ) ) ( not ( = ?auto_799964 ?auto_799975 ) ) ( not ( = ?auto_799964 ?auto_799976 ) ) ( not ( = ?auto_799964 ?auto_799977 ) ) ( not ( = ?auto_799964 ?auto_799978 ) ) ( not ( = ?auto_799964 ?auto_799979 ) ) ( not ( = ?auto_799964 ?auto_799980 ) ) ( not ( = ?auto_799965 ?auto_799966 ) ) ( not ( = ?auto_799965 ?auto_799967 ) ) ( not ( = ?auto_799965 ?auto_799968 ) ) ( not ( = ?auto_799965 ?auto_799969 ) ) ( not ( = ?auto_799965 ?auto_799970 ) ) ( not ( = ?auto_799965 ?auto_799971 ) ) ( not ( = ?auto_799965 ?auto_799972 ) ) ( not ( = ?auto_799965 ?auto_799973 ) ) ( not ( = ?auto_799965 ?auto_799974 ) ) ( not ( = ?auto_799965 ?auto_799975 ) ) ( not ( = ?auto_799965 ?auto_799976 ) ) ( not ( = ?auto_799965 ?auto_799977 ) ) ( not ( = ?auto_799965 ?auto_799978 ) ) ( not ( = ?auto_799965 ?auto_799979 ) ) ( not ( = ?auto_799965 ?auto_799980 ) ) ( not ( = ?auto_799966 ?auto_799967 ) ) ( not ( = ?auto_799966 ?auto_799968 ) ) ( not ( = ?auto_799966 ?auto_799969 ) ) ( not ( = ?auto_799966 ?auto_799970 ) ) ( not ( = ?auto_799966 ?auto_799971 ) ) ( not ( = ?auto_799966 ?auto_799972 ) ) ( not ( = ?auto_799966 ?auto_799973 ) ) ( not ( = ?auto_799966 ?auto_799974 ) ) ( not ( = ?auto_799966 ?auto_799975 ) ) ( not ( = ?auto_799966 ?auto_799976 ) ) ( not ( = ?auto_799966 ?auto_799977 ) ) ( not ( = ?auto_799966 ?auto_799978 ) ) ( not ( = ?auto_799966 ?auto_799979 ) ) ( not ( = ?auto_799966 ?auto_799980 ) ) ( not ( = ?auto_799967 ?auto_799968 ) ) ( not ( = ?auto_799967 ?auto_799969 ) ) ( not ( = ?auto_799967 ?auto_799970 ) ) ( not ( = ?auto_799967 ?auto_799971 ) ) ( not ( = ?auto_799967 ?auto_799972 ) ) ( not ( = ?auto_799967 ?auto_799973 ) ) ( not ( = ?auto_799967 ?auto_799974 ) ) ( not ( = ?auto_799967 ?auto_799975 ) ) ( not ( = ?auto_799967 ?auto_799976 ) ) ( not ( = ?auto_799967 ?auto_799977 ) ) ( not ( = ?auto_799967 ?auto_799978 ) ) ( not ( = ?auto_799967 ?auto_799979 ) ) ( not ( = ?auto_799967 ?auto_799980 ) ) ( not ( = ?auto_799968 ?auto_799969 ) ) ( not ( = ?auto_799968 ?auto_799970 ) ) ( not ( = ?auto_799968 ?auto_799971 ) ) ( not ( = ?auto_799968 ?auto_799972 ) ) ( not ( = ?auto_799968 ?auto_799973 ) ) ( not ( = ?auto_799968 ?auto_799974 ) ) ( not ( = ?auto_799968 ?auto_799975 ) ) ( not ( = ?auto_799968 ?auto_799976 ) ) ( not ( = ?auto_799968 ?auto_799977 ) ) ( not ( = ?auto_799968 ?auto_799978 ) ) ( not ( = ?auto_799968 ?auto_799979 ) ) ( not ( = ?auto_799968 ?auto_799980 ) ) ( not ( = ?auto_799969 ?auto_799970 ) ) ( not ( = ?auto_799969 ?auto_799971 ) ) ( not ( = ?auto_799969 ?auto_799972 ) ) ( not ( = ?auto_799969 ?auto_799973 ) ) ( not ( = ?auto_799969 ?auto_799974 ) ) ( not ( = ?auto_799969 ?auto_799975 ) ) ( not ( = ?auto_799969 ?auto_799976 ) ) ( not ( = ?auto_799969 ?auto_799977 ) ) ( not ( = ?auto_799969 ?auto_799978 ) ) ( not ( = ?auto_799969 ?auto_799979 ) ) ( not ( = ?auto_799969 ?auto_799980 ) ) ( not ( = ?auto_799970 ?auto_799971 ) ) ( not ( = ?auto_799970 ?auto_799972 ) ) ( not ( = ?auto_799970 ?auto_799973 ) ) ( not ( = ?auto_799970 ?auto_799974 ) ) ( not ( = ?auto_799970 ?auto_799975 ) ) ( not ( = ?auto_799970 ?auto_799976 ) ) ( not ( = ?auto_799970 ?auto_799977 ) ) ( not ( = ?auto_799970 ?auto_799978 ) ) ( not ( = ?auto_799970 ?auto_799979 ) ) ( not ( = ?auto_799970 ?auto_799980 ) ) ( not ( = ?auto_799971 ?auto_799972 ) ) ( not ( = ?auto_799971 ?auto_799973 ) ) ( not ( = ?auto_799971 ?auto_799974 ) ) ( not ( = ?auto_799971 ?auto_799975 ) ) ( not ( = ?auto_799971 ?auto_799976 ) ) ( not ( = ?auto_799971 ?auto_799977 ) ) ( not ( = ?auto_799971 ?auto_799978 ) ) ( not ( = ?auto_799971 ?auto_799979 ) ) ( not ( = ?auto_799971 ?auto_799980 ) ) ( not ( = ?auto_799972 ?auto_799973 ) ) ( not ( = ?auto_799972 ?auto_799974 ) ) ( not ( = ?auto_799972 ?auto_799975 ) ) ( not ( = ?auto_799972 ?auto_799976 ) ) ( not ( = ?auto_799972 ?auto_799977 ) ) ( not ( = ?auto_799972 ?auto_799978 ) ) ( not ( = ?auto_799972 ?auto_799979 ) ) ( not ( = ?auto_799972 ?auto_799980 ) ) ( not ( = ?auto_799973 ?auto_799974 ) ) ( not ( = ?auto_799973 ?auto_799975 ) ) ( not ( = ?auto_799973 ?auto_799976 ) ) ( not ( = ?auto_799973 ?auto_799977 ) ) ( not ( = ?auto_799973 ?auto_799978 ) ) ( not ( = ?auto_799973 ?auto_799979 ) ) ( not ( = ?auto_799973 ?auto_799980 ) ) ( not ( = ?auto_799974 ?auto_799975 ) ) ( not ( = ?auto_799974 ?auto_799976 ) ) ( not ( = ?auto_799974 ?auto_799977 ) ) ( not ( = ?auto_799974 ?auto_799978 ) ) ( not ( = ?auto_799974 ?auto_799979 ) ) ( not ( = ?auto_799974 ?auto_799980 ) ) ( not ( = ?auto_799975 ?auto_799976 ) ) ( not ( = ?auto_799975 ?auto_799977 ) ) ( not ( = ?auto_799975 ?auto_799978 ) ) ( not ( = ?auto_799975 ?auto_799979 ) ) ( not ( = ?auto_799975 ?auto_799980 ) ) ( not ( = ?auto_799976 ?auto_799977 ) ) ( not ( = ?auto_799976 ?auto_799978 ) ) ( not ( = ?auto_799976 ?auto_799979 ) ) ( not ( = ?auto_799976 ?auto_799980 ) ) ( not ( = ?auto_799977 ?auto_799978 ) ) ( not ( = ?auto_799977 ?auto_799979 ) ) ( not ( = ?auto_799977 ?auto_799980 ) ) ( not ( = ?auto_799978 ?auto_799979 ) ) ( not ( = ?auto_799978 ?auto_799980 ) ) ( not ( = ?auto_799979 ?auto_799980 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_799980 )
      ( !STACK ?auto_799980 ?auto_799979 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_799999 - BLOCK
      ?auto_800000 - BLOCK
      ?auto_800001 - BLOCK
      ?auto_800002 - BLOCK
      ?auto_800003 - BLOCK
      ?auto_800004 - BLOCK
      ?auto_800005 - BLOCK
      ?auto_800006 - BLOCK
      ?auto_800007 - BLOCK
      ?auto_800008 - BLOCK
      ?auto_800009 - BLOCK
      ?auto_800010 - BLOCK
      ?auto_800011 - BLOCK
      ?auto_800012 - BLOCK
      ?auto_800013 - BLOCK
      ?auto_800014 - BLOCK
      ?auto_800015 - BLOCK
      ?auto_800016 - BLOCK
    )
    :vars
    (
      ?auto_800017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_800016 ?auto_800017 ) ( ON-TABLE ?auto_799999 ) ( ON ?auto_800000 ?auto_799999 ) ( ON ?auto_800001 ?auto_800000 ) ( ON ?auto_800002 ?auto_800001 ) ( ON ?auto_800003 ?auto_800002 ) ( ON ?auto_800004 ?auto_800003 ) ( ON ?auto_800005 ?auto_800004 ) ( ON ?auto_800006 ?auto_800005 ) ( ON ?auto_800007 ?auto_800006 ) ( ON ?auto_800008 ?auto_800007 ) ( ON ?auto_800009 ?auto_800008 ) ( ON ?auto_800010 ?auto_800009 ) ( ON ?auto_800011 ?auto_800010 ) ( ON ?auto_800012 ?auto_800011 ) ( ON ?auto_800013 ?auto_800012 ) ( ON ?auto_800014 ?auto_800013 ) ( not ( = ?auto_799999 ?auto_800000 ) ) ( not ( = ?auto_799999 ?auto_800001 ) ) ( not ( = ?auto_799999 ?auto_800002 ) ) ( not ( = ?auto_799999 ?auto_800003 ) ) ( not ( = ?auto_799999 ?auto_800004 ) ) ( not ( = ?auto_799999 ?auto_800005 ) ) ( not ( = ?auto_799999 ?auto_800006 ) ) ( not ( = ?auto_799999 ?auto_800007 ) ) ( not ( = ?auto_799999 ?auto_800008 ) ) ( not ( = ?auto_799999 ?auto_800009 ) ) ( not ( = ?auto_799999 ?auto_800010 ) ) ( not ( = ?auto_799999 ?auto_800011 ) ) ( not ( = ?auto_799999 ?auto_800012 ) ) ( not ( = ?auto_799999 ?auto_800013 ) ) ( not ( = ?auto_799999 ?auto_800014 ) ) ( not ( = ?auto_799999 ?auto_800015 ) ) ( not ( = ?auto_799999 ?auto_800016 ) ) ( not ( = ?auto_799999 ?auto_800017 ) ) ( not ( = ?auto_800000 ?auto_800001 ) ) ( not ( = ?auto_800000 ?auto_800002 ) ) ( not ( = ?auto_800000 ?auto_800003 ) ) ( not ( = ?auto_800000 ?auto_800004 ) ) ( not ( = ?auto_800000 ?auto_800005 ) ) ( not ( = ?auto_800000 ?auto_800006 ) ) ( not ( = ?auto_800000 ?auto_800007 ) ) ( not ( = ?auto_800000 ?auto_800008 ) ) ( not ( = ?auto_800000 ?auto_800009 ) ) ( not ( = ?auto_800000 ?auto_800010 ) ) ( not ( = ?auto_800000 ?auto_800011 ) ) ( not ( = ?auto_800000 ?auto_800012 ) ) ( not ( = ?auto_800000 ?auto_800013 ) ) ( not ( = ?auto_800000 ?auto_800014 ) ) ( not ( = ?auto_800000 ?auto_800015 ) ) ( not ( = ?auto_800000 ?auto_800016 ) ) ( not ( = ?auto_800000 ?auto_800017 ) ) ( not ( = ?auto_800001 ?auto_800002 ) ) ( not ( = ?auto_800001 ?auto_800003 ) ) ( not ( = ?auto_800001 ?auto_800004 ) ) ( not ( = ?auto_800001 ?auto_800005 ) ) ( not ( = ?auto_800001 ?auto_800006 ) ) ( not ( = ?auto_800001 ?auto_800007 ) ) ( not ( = ?auto_800001 ?auto_800008 ) ) ( not ( = ?auto_800001 ?auto_800009 ) ) ( not ( = ?auto_800001 ?auto_800010 ) ) ( not ( = ?auto_800001 ?auto_800011 ) ) ( not ( = ?auto_800001 ?auto_800012 ) ) ( not ( = ?auto_800001 ?auto_800013 ) ) ( not ( = ?auto_800001 ?auto_800014 ) ) ( not ( = ?auto_800001 ?auto_800015 ) ) ( not ( = ?auto_800001 ?auto_800016 ) ) ( not ( = ?auto_800001 ?auto_800017 ) ) ( not ( = ?auto_800002 ?auto_800003 ) ) ( not ( = ?auto_800002 ?auto_800004 ) ) ( not ( = ?auto_800002 ?auto_800005 ) ) ( not ( = ?auto_800002 ?auto_800006 ) ) ( not ( = ?auto_800002 ?auto_800007 ) ) ( not ( = ?auto_800002 ?auto_800008 ) ) ( not ( = ?auto_800002 ?auto_800009 ) ) ( not ( = ?auto_800002 ?auto_800010 ) ) ( not ( = ?auto_800002 ?auto_800011 ) ) ( not ( = ?auto_800002 ?auto_800012 ) ) ( not ( = ?auto_800002 ?auto_800013 ) ) ( not ( = ?auto_800002 ?auto_800014 ) ) ( not ( = ?auto_800002 ?auto_800015 ) ) ( not ( = ?auto_800002 ?auto_800016 ) ) ( not ( = ?auto_800002 ?auto_800017 ) ) ( not ( = ?auto_800003 ?auto_800004 ) ) ( not ( = ?auto_800003 ?auto_800005 ) ) ( not ( = ?auto_800003 ?auto_800006 ) ) ( not ( = ?auto_800003 ?auto_800007 ) ) ( not ( = ?auto_800003 ?auto_800008 ) ) ( not ( = ?auto_800003 ?auto_800009 ) ) ( not ( = ?auto_800003 ?auto_800010 ) ) ( not ( = ?auto_800003 ?auto_800011 ) ) ( not ( = ?auto_800003 ?auto_800012 ) ) ( not ( = ?auto_800003 ?auto_800013 ) ) ( not ( = ?auto_800003 ?auto_800014 ) ) ( not ( = ?auto_800003 ?auto_800015 ) ) ( not ( = ?auto_800003 ?auto_800016 ) ) ( not ( = ?auto_800003 ?auto_800017 ) ) ( not ( = ?auto_800004 ?auto_800005 ) ) ( not ( = ?auto_800004 ?auto_800006 ) ) ( not ( = ?auto_800004 ?auto_800007 ) ) ( not ( = ?auto_800004 ?auto_800008 ) ) ( not ( = ?auto_800004 ?auto_800009 ) ) ( not ( = ?auto_800004 ?auto_800010 ) ) ( not ( = ?auto_800004 ?auto_800011 ) ) ( not ( = ?auto_800004 ?auto_800012 ) ) ( not ( = ?auto_800004 ?auto_800013 ) ) ( not ( = ?auto_800004 ?auto_800014 ) ) ( not ( = ?auto_800004 ?auto_800015 ) ) ( not ( = ?auto_800004 ?auto_800016 ) ) ( not ( = ?auto_800004 ?auto_800017 ) ) ( not ( = ?auto_800005 ?auto_800006 ) ) ( not ( = ?auto_800005 ?auto_800007 ) ) ( not ( = ?auto_800005 ?auto_800008 ) ) ( not ( = ?auto_800005 ?auto_800009 ) ) ( not ( = ?auto_800005 ?auto_800010 ) ) ( not ( = ?auto_800005 ?auto_800011 ) ) ( not ( = ?auto_800005 ?auto_800012 ) ) ( not ( = ?auto_800005 ?auto_800013 ) ) ( not ( = ?auto_800005 ?auto_800014 ) ) ( not ( = ?auto_800005 ?auto_800015 ) ) ( not ( = ?auto_800005 ?auto_800016 ) ) ( not ( = ?auto_800005 ?auto_800017 ) ) ( not ( = ?auto_800006 ?auto_800007 ) ) ( not ( = ?auto_800006 ?auto_800008 ) ) ( not ( = ?auto_800006 ?auto_800009 ) ) ( not ( = ?auto_800006 ?auto_800010 ) ) ( not ( = ?auto_800006 ?auto_800011 ) ) ( not ( = ?auto_800006 ?auto_800012 ) ) ( not ( = ?auto_800006 ?auto_800013 ) ) ( not ( = ?auto_800006 ?auto_800014 ) ) ( not ( = ?auto_800006 ?auto_800015 ) ) ( not ( = ?auto_800006 ?auto_800016 ) ) ( not ( = ?auto_800006 ?auto_800017 ) ) ( not ( = ?auto_800007 ?auto_800008 ) ) ( not ( = ?auto_800007 ?auto_800009 ) ) ( not ( = ?auto_800007 ?auto_800010 ) ) ( not ( = ?auto_800007 ?auto_800011 ) ) ( not ( = ?auto_800007 ?auto_800012 ) ) ( not ( = ?auto_800007 ?auto_800013 ) ) ( not ( = ?auto_800007 ?auto_800014 ) ) ( not ( = ?auto_800007 ?auto_800015 ) ) ( not ( = ?auto_800007 ?auto_800016 ) ) ( not ( = ?auto_800007 ?auto_800017 ) ) ( not ( = ?auto_800008 ?auto_800009 ) ) ( not ( = ?auto_800008 ?auto_800010 ) ) ( not ( = ?auto_800008 ?auto_800011 ) ) ( not ( = ?auto_800008 ?auto_800012 ) ) ( not ( = ?auto_800008 ?auto_800013 ) ) ( not ( = ?auto_800008 ?auto_800014 ) ) ( not ( = ?auto_800008 ?auto_800015 ) ) ( not ( = ?auto_800008 ?auto_800016 ) ) ( not ( = ?auto_800008 ?auto_800017 ) ) ( not ( = ?auto_800009 ?auto_800010 ) ) ( not ( = ?auto_800009 ?auto_800011 ) ) ( not ( = ?auto_800009 ?auto_800012 ) ) ( not ( = ?auto_800009 ?auto_800013 ) ) ( not ( = ?auto_800009 ?auto_800014 ) ) ( not ( = ?auto_800009 ?auto_800015 ) ) ( not ( = ?auto_800009 ?auto_800016 ) ) ( not ( = ?auto_800009 ?auto_800017 ) ) ( not ( = ?auto_800010 ?auto_800011 ) ) ( not ( = ?auto_800010 ?auto_800012 ) ) ( not ( = ?auto_800010 ?auto_800013 ) ) ( not ( = ?auto_800010 ?auto_800014 ) ) ( not ( = ?auto_800010 ?auto_800015 ) ) ( not ( = ?auto_800010 ?auto_800016 ) ) ( not ( = ?auto_800010 ?auto_800017 ) ) ( not ( = ?auto_800011 ?auto_800012 ) ) ( not ( = ?auto_800011 ?auto_800013 ) ) ( not ( = ?auto_800011 ?auto_800014 ) ) ( not ( = ?auto_800011 ?auto_800015 ) ) ( not ( = ?auto_800011 ?auto_800016 ) ) ( not ( = ?auto_800011 ?auto_800017 ) ) ( not ( = ?auto_800012 ?auto_800013 ) ) ( not ( = ?auto_800012 ?auto_800014 ) ) ( not ( = ?auto_800012 ?auto_800015 ) ) ( not ( = ?auto_800012 ?auto_800016 ) ) ( not ( = ?auto_800012 ?auto_800017 ) ) ( not ( = ?auto_800013 ?auto_800014 ) ) ( not ( = ?auto_800013 ?auto_800015 ) ) ( not ( = ?auto_800013 ?auto_800016 ) ) ( not ( = ?auto_800013 ?auto_800017 ) ) ( not ( = ?auto_800014 ?auto_800015 ) ) ( not ( = ?auto_800014 ?auto_800016 ) ) ( not ( = ?auto_800014 ?auto_800017 ) ) ( not ( = ?auto_800015 ?auto_800016 ) ) ( not ( = ?auto_800015 ?auto_800017 ) ) ( not ( = ?auto_800016 ?auto_800017 ) ) ( CLEAR ?auto_800014 ) ( ON ?auto_800015 ?auto_800016 ) ( CLEAR ?auto_800015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_799999 ?auto_800000 ?auto_800001 ?auto_800002 ?auto_800003 ?auto_800004 ?auto_800005 ?auto_800006 ?auto_800007 ?auto_800008 ?auto_800009 ?auto_800010 ?auto_800011 ?auto_800012 ?auto_800013 ?auto_800014 ?auto_800015 )
      ( MAKE-18PILE ?auto_799999 ?auto_800000 ?auto_800001 ?auto_800002 ?auto_800003 ?auto_800004 ?auto_800005 ?auto_800006 ?auto_800007 ?auto_800008 ?auto_800009 ?auto_800010 ?auto_800011 ?auto_800012 ?auto_800013 ?auto_800014 ?auto_800015 ?auto_800016 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800036 - BLOCK
      ?auto_800037 - BLOCK
      ?auto_800038 - BLOCK
      ?auto_800039 - BLOCK
      ?auto_800040 - BLOCK
      ?auto_800041 - BLOCK
      ?auto_800042 - BLOCK
      ?auto_800043 - BLOCK
      ?auto_800044 - BLOCK
      ?auto_800045 - BLOCK
      ?auto_800046 - BLOCK
      ?auto_800047 - BLOCK
      ?auto_800048 - BLOCK
      ?auto_800049 - BLOCK
      ?auto_800050 - BLOCK
      ?auto_800051 - BLOCK
      ?auto_800052 - BLOCK
      ?auto_800053 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_800053 ) ( ON-TABLE ?auto_800036 ) ( ON ?auto_800037 ?auto_800036 ) ( ON ?auto_800038 ?auto_800037 ) ( ON ?auto_800039 ?auto_800038 ) ( ON ?auto_800040 ?auto_800039 ) ( ON ?auto_800041 ?auto_800040 ) ( ON ?auto_800042 ?auto_800041 ) ( ON ?auto_800043 ?auto_800042 ) ( ON ?auto_800044 ?auto_800043 ) ( ON ?auto_800045 ?auto_800044 ) ( ON ?auto_800046 ?auto_800045 ) ( ON ?auto_800047 ?auto_800046 ) ( ON ?auto_800048 ?auto_800047 ) ( ON ?auto_800049 ?auto_800048 ) ( ON ?auto_800050 ?auto_800049 ) ( ON ?auto_800051 ?auto_800050 ) ( not ( = ?auto_800036 ?auto_800037 ) ) ( not ( = ?auto_800036 ?auto_800038 ) ) ( not ( = ?auto_800036 ?auto_800039 ) ) ( not ( = ?auto_800036 ?auto_800040 ) ) ( not ( = ?auto_800036 ?auto_800041 ) ) ( not ( = ?auto_800036 ?auto_800042 ) ) ( not ( = ?auto_800036 ?auto_800043 ) ) ( not ( = ?auto_800036 ?auto_800044 ) ) ( not ( = ?auto_800036 ?auto_800045 ) ) ( not ( = ?auto_800036 ?auto_800046 ) ) ( not ( = ?auto_800036 ?auto_800047 ) ) ( not ( = ?auto_800036 ?auto_800048 ) ) ( not ( = ?auto_800036 ?auto_800049 ) ) ( not ( = ?auto_800036 ?auto_800050 ) ) ( not ( = ?auto_800036 ?auto_800051 ) ) ( not ( = ?auto_800036 ?auto_800052 ) ) ( not ( = ?auto_800036 ?auto_800053 ) ) ( not ( = ?auto_800037 ?auto_800038 ) ) ( not ( = ?auto_800037 ?auto_800039 ) ) ( not ( = ?auto_800037 ?auto_800040 ) ) ( not ( = ?auto_800037 ?auto_800041 ) ) ( not ( = ?auto_800037 ?auto_800042 ) ) ( not ( = ?auto_800037 ?auto_800043 ) ) ( not ( = ?auto_800037 ?auto_800044 ) ) ( not ( = ?auto_800037 ?auto_800045 ) ) ( not ( = ?auto_800037 ?auto_800046 ) ) ( not ( = ?auto_800037 ?auto_800047 ) ) ( not ( = ?auto_800037 ?auto_800048 ) ) ( not ( = ?auto_800037 ?auto_800049 ) ) ( not ( = ?auto_800037 ?auto_800050 ) ) ( not ( = ?auto_800037 ?auto_800051 ) ) ( not ( = ?auto_800037 ?auto_800052 ) ) ( not ( = ?auto_800037 ?auto_800053 ) ) ( not ( = ?auto_800038 ?auto_800039 ) ) ( not ( = ?auto_800038 ?auto_800040 ) ) ( not ( = ?auto_800038 ?auto_800041 ) ) ( not ( = ?auto_800038 ?auto_800042 ) ) ( not ( = ?auto_800038 ?auto_800043 ) ) ( not ( = ?auto_800038 ?auto_800044 ) ) ( not ( = ?auto_800038 ?auto_800045 ) ) ( not ( = ?auto_800038 ?auto_800046 ) ) ( not ( = ?auto_800038 ?auto_800047 ) ) ( not ( = ?auto_800038 ?auto_800048 ) ) ( not ( = ?auto_800038 ?auto_800049 ) ) ( not ( = ?auto_800038 ?auto_800050 ) ) ( not ( = ?auto_800038 ?auto_800051 ) ) ( not ( = ?auto_800038 ?auto_800052 ) ) ( not ( = ?auto_800038 ?auto_800053 ) ) ( not ( = ?auto_800039 ?auto_800040 ) ) ( not ( = ?auto_800039 ?auto_800041 ) ) ( not ( = ?auto_800039 ?auto_800042 ) ) ( not ( = ?auto_800039 ?auto_800043 ) ) ( not ( = ?auto_800039 ?auto_800044 ) ) ( not ( = ?auto_800039 ?auto_800045 ) ) ( not ( = ?auto_800039 ?auto_800046 ) ) ( not ( = ?auto_800039 ?auto_800047 ) ) ( not ( = ?auto_800039 ?auto_800048 ) ) ( not ( = ?auto_800039 ?auto_800049 ) ) ( not ( = ?auto_800039 ?auto_800050 ) ) ( not ( = ?auto_800039 ?auto_800051 ) ) ( not ( = ?auto_800039 ?auto_800052 ) ) ( not ( = ?auto_800039 ?auto_800053 ) ) ( not ( = ?auto_800040 ?auto_800041 ) ) ( not ( = ?auto_800040 ?auto_800042 ) ) ( not ( = ?auto_800040 ?auto_800043 ) ) ( not ( = ?auto_800040 ?auto_800044 ) ) ( not ( = ?auto_800040 ?auto_800045 ) ) ( not ( = ?auto_800040 ?auto_800046 ) ) ( not ( = ?auto_800040 ?auto_800047 ) ) ( not ( = ?auto_800040 ?auto_800048 ) ) ( not ( = ?auto_800040 ?auto_800049 ) ) ( not ( = ?auto_800040 ?auto_800050 ) ) ( not ( = ?auto_800040 ?auto_800051 ) ) ( not ( = ?auto_800040 ?auto_800052 ) ) ( not ( = ?auto_800040 ?auto_800053 ) ) ( not ( = ?auto_800041 ?auto_800042 ) ) ( not ( = ?auto_800041 ?auto_800043 ) ) ( not ( = ?auto_800041 ?auto_800044 ) ) ( not ( = ?auto_800041 ?auto_800045 ) ) ( not ( = ?auto_800041 ?auto_800046 ) ) ( not ( = ?auto_800041 ?auto_800047 ) ) ( not ( = ?auto_800041 ?auto_800048 ) ) ( not ( = ?auto_800041 ?auto_800049 ) ) ( not ( = ?auto_800041 ?auto_800050 ) ) ( not ( = ?auto_800041 ?auto_800051 ) ) ( not ( = ?auto_800041 ?auto_800052 ) ) ( not ( = ?auto_800041 ?auto_800053 ) ) ( not ( = ?auto_800042 ?auto_800043 ) ) ( not ( = ?auto_800042 ?auto_800044 ) ) ( not ( = ?auto_800042 ?auto_800045 ) ) ( not ( = ?auto_800042 ?auto_800046 ) ) ( not ( = ?auto_800042 ?auto_800047 ) ) ( not ( = ?auto_800042 ?auto_800048 ) ) ( not ( = ?auto_800042 ?auto_800049 ) ) ( not ( = ?auto_800042 ?auto_800050 ) ) ( not ( = ?auto_800042 ?auto_800051 ) ) ( not ( = ?auto_800042 ?auto_800052 ) ) ( not ( = ?auto_800042 ?auto_800053 ) ) ( not ( = ?auto_800043 ?auto_800044 ) ) ( not ( = ?auto_800043 ?auto_800045 ) ) ( not ( = ?auto_800043 ?auto_800046 ) ) ( not ( = ?auto_800043 ?auto_800047 ) ) ( not ( = ?auto_800043 ?auto_800048 ) ) ( not ( = ?auto_800043 ?auto_800049 ) ) ( not ( = ?auto_800043 ?auto_800050 ) ) ( not ( = ?auto_800043 ?auto_800051 ) ) ( not ( = ?auto_800043 ?auto_800052 ) ) ( not ( = ?auto_800043 ?auto_800053 ) ) ( not ( = ?auto_800044 ?auto_800045 ) ) ( not ( = ?auto_800044 ?auto_800046 ) ) ( not ( = ?auto_800044 ?auto_800047 ) ) ( not ( = ?auto_800044 ?auto_800048 ) ) ( not ( = ?auto_800044 ?auto_800049 ) ) ( not ( = ?auto_800044 ?auto_800050 ) ) ( not ( = ?auto_800044 ?auto_800051 ) ) ( not ( = ?auto_800044 ?auto_800052 ) ) ( not ( = ?auto_800044 ?auto_800053 ) ) ( not ( = ?auto_800045 ?auto_800046 ) ) ( not ( = ?auto_800045 ?auto_800047 ) ) ( not ( = ?auto_800045 ?auto_800048 ) ) ( not ( = ?auto_800045 ?auto_800049 ) ) ( not ( = ?auto_800045 ?auto_800050 ) ) ( not ( = ?auto_800045 ?auto_800051 ) ) ( not ( = ?auto_800045 ?auto_800052 ) ) ( not ( = ?auto_800045 ?auto_800053 ) ) ( not ( = ?auto_800046 ?auto_800047 ) ) ( not ( = ?auto_800046 ?auto_800048 ) ) ( not ( = ?auto_800046 ?auto_800049 ) ) ( not ( = ?auto_800046 ?auto_800050 ) ) ( not ( = ?auto_800046 ?auto_800051 ) ) ( not ( = ?auto_800046 ?auto_800052 ) ) ( not ( = ?auto_800046 ?auto_800053 ) ) ( not ( = ?auto_800047 ?auto_800048 ) ) ( not ( = ?auto_800047 ?auto_800049 ) ) ( not ( = ?auto_800047 ?auto_800050 ) ) ( not ( = ?auto_800047 ?auto_800051 ) ) ( not ( = ?auto_800047 ?auto_800052 ) ) ( not ( = ?auto_800047 ?auto_800053 ) ) ( not ( = ?auto_800048 ?auto_800049 ) ) ( not ( = ?auto_800048 ?auto_800050 ) ) ( not ( = ?auto_800048 ?auto_800051 ) ) ( not ( = ?auto_800048 ?auto_800052 ) ) ( not ( = ?auto_800048 ?auto_800053 ) ) ( not ( = ?auto_800049 ?auto_800050 ) ) ( not ( = ?auto_800049 ?auto_800051 ) ) ( not ( = ?auto_800049 ?auto_800052 ) ) ( not ( = ?auto_800049 ?auto_800053 ) ) ( not ( = ?auto_800050 ?auto_800051 ) ) ( not ( = ?auto_800050 ?auto_800052 ) ) ( not ( = ?auto_800050 ?auto_800053 ) ) ( not ( = ?auto_800051 ?auto_800052 ) ) ( not ( = ?auto_800051 ?auto_800053 ) ) ( not ( = ?auto_800052 ?auto_800053 ) ) ( CLEAR ?auto_800051 ) ( ON ?auto_800052 ?auto_800053 ) ( CLEAR ?auto_800052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_800036 ?auto_800037 ?auto_800038 ?auto_800039 ?auto_800040 ?auto_800041 ?auto_800042 ?auto_800043 ?auto_800044 ?auto_800045 ?auto_800046 ?auto_800047 ?auto_800048 ?auto_800049 ?auto_800050 ?auto_800051 ?auto_800052 )
      ( MAKE-18PILE ?auto_800036 ?auto_800037 ?auto_800038 ?auto_800039 ?auto_800040 ?auto_800041 ?auto_800042 ?auto_800043 ?auto_800044 ?auto_800045 ?auto_800046 ?auto_800047 ?auto_800048 ?auto_800049 ?auto_800050 ?auto_800051 ?auto_800052 ?auto_800053 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800072 - BLOCK
      ?auto_800073 - BLOCK
      ?auto_800074 - BLOCK
      ?auto_800075 - BLOCK
      ?auto_800076 - BLOCK
      ?auto_800077 - BLOCK
      ?auto_800078 - BLOCK
      ?auto_800079 - BLOCK
      ?auto_800080 - BLOCK
      ?auto_800081 - BLOCK
      ?auto_800082 - BLOCK
      ?auto_800083 - BLOCK
      ?auto_800084 - BLOCK
      ?auto_800085 - BLOCK
      ?auto_800086 - BLOCK
      ?auto_800087 - BLOCK
      ?auto_800088 - BLOCK
      ?auto_800089 - BLOCK
    )
    :vars
    (
      ?auto_800090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_800089 ?auto_800090 ) ( ON-TABLE ?auto_800072 ) ( ON ?auto_800073 ?auto_800072 ) ( ON ?auto_800074 ?auto_800073 ) ( ON ?auto_800075 ?auto_800074 ) ( ON ?auto_800076 ?auto_800075 ) ( ON ?auto_800077 ?auto_800076 ) ( ON ?auto_800078 ?auto_800077 ) ( ON ?auto_800079 ?auto_800078 ) ( ON ?auto_800080 ?auto_800079 ) ( ON ?auto_800081 ?auto_800080 ) ( ON ?auto_800082 ?auto_800081 ) ( ON ?auto_800083 ?auto_800082 ) ( ON ?auto_800084 ?auto_800083 ) ( ON ?auto_800085 ?auto_800084 ) ( ON ?auto_800086 ?auto_800085 ) ( not ( = ?auto_800072 ?auto_800073 ) ) ( not ( = ?auto_800072 ?auto_800074 ) ) ( not ( = ?auto_800072 ?auto_800075 ) ) ( not ( = ?auto_800072 ?auto_800076 ) ) ( not ( = ?auto_800072 ?auto_800077 ) ) ( not ( = ?auto_800072 ?auto_800078 ) ) ( not ( = ?auto_800072 ?auto_800079 ) ) ( not ( = ?auto_800072 ?auto_800080 ) ) ( not ( = ?auto_800072 ?auto_800081 ) ) ( not ( = ?auto_800072 ?auto_800082 ) ) ( not ( = ?auto_800072 ?auto_800083 ) ) ( not ( = ?auto_800072 ?auto_800084 ) ) ( not ( = ?auto_800072 ?auto_800085 ) ) ( not ( = ?auto_800072 ?auto_800086 ) ) ( not ( = ?auto_800072 ?auto_800087 ) ) ( not ( = ?auto_800072 ?auto_800088 ) ) ( not ( = ?auto_800072 ?auto_800089 ) ) ( not ( = ?auto_800072 ?auto_800090 ) ) ( not ( = ?auto_800073 ?auto_800074 ) ) ( not ( = ?auto_800073 ?auto_800075 ) ) ( not ( = ?auto_800073 ?auto_800076 ) ) ( not ( = ?auto_800073 ?auto_800077 ) ) ( not ( = ?auto_800073 ?auto_800078 ) ) ( not ( = ?auto_800073 ?auto_800079 ) ) ( not ( = ?auto_800073 ?auto_800080 ) ) ( not ( = ?auto_800073 ?auto_800081 ) ) ( not ( = ?auto_800073 ?auto_800082 ) ) ( not ( = ?auto_800073 ?auto_800083 ) ) ( not ( = ?auto_800073 ?auto_800084 ) ) ( not ( = ?auto_800073 ?auto_800085 ) ) ( not ( = ?auto_800073 ?auto_800086 ) ) ( not ( = ?auto_800073 ?auto_800087 ) ) ( not ( = ?auto_800073 ?auto_800088 ) ) ( not ( = ?auto_800073 ?auto_800089 ) ) ( not ( = ?auto_800073 ?auto_800090 ) ) ( not ( = ?auto_800074 ?auto_800075 ) ) ( not ( = ?auto_800074 ?auto_800076 ) ) ( not ( = ?auto_800074 ?auto_800077 ) ) ( not ( = ?auto_800074 ?auto_800078 ) ) ( not ( = ?auto_800074 ?auto_800079 ) ) ( not ( = ?auto_800074 ?auto_800080 ) ) ( not ( = ?auto_800074 ?auto_800081 ) ) ( not ( = ?auto_800074 ?auto_800082 ) ) ( not ( = ?auto_800074 ?auto_800083 ) ) ( not ( = ?auto_800074 ?auto_800084 ) ) ( not ( = ?auto_800074 ?auto_800085 ) ) ( not ( = ?auto_800074 ?auto_800086 ) ) ( not ( = ?auto_800074 ?auto_800087 ) ) ( not ( = ?auto_800074 ?auto_800088 ) ) ( not ( = ?auto_800074 ?auto_800089 ) ) ( not ( = ?auto_800074 ?auto_800090 ) ) ( not ( = ?auto_800075 ?auto_800076 ) ) ( not ( = ?auto_800075 ?auto_800077 ) ) ( not ( = ?auto_800075 ?auto_800078 ) ) ( not ( = ?auto_800075 ?auto_800079 ) ) ( not ( = ?auto_800075 ?auto_800080 ) ) ( not ( = ?auto_800075 ?auto_800081 ) ) ( not ( = ?auto_800075 ?auto_800082 ) ) ( not ( = ?auto_800075 ?auto_800083 ) ) ( not ( = ?auto_800075 ?auto_800084 ) ) ( not ( = ?auto_800075 ?auto_800085 ) ) ( not ( = ?auto_800075 ?auto_800086 ) ) ( not ( = ?auto_800075 ?auto_800087 ) ) ( not ( = ?auto_800075 ?auto_800088 ) ) ( not ( = ?auto_800075 ?auto_800089 ) ) ( not ( = ?auto_800075 ?auto_800090 ) ) ( not ( = ?auto_800076 ?auto_800077 ) ) ( not ( = ?auto_800076 ?auto_800078 ) ) ( not ( = ?auto_800076 ?auto_800079 ) ) ( not ( = ?auto_800076 ?auto_800080 ) ) ( not ( = ?auto_800076 ?auto_800081 ) ) ( not ( = ?auto_800076 ?auto_800082 ) ) ( not ( = ?auto_800076 ?auto_800083 ) ) ( not ( = ?auto_800076 ?auto_800084 ) ) ( not ( = ?auto_800076 ?auto_800085 ) ) ( not ( = ?auto_800076 ?auto_800086 ) ) ( not ( = ?auto_800076 ?auto_800087 ) ) ( not ( = ?auto_800076 ?auto_800088 ) ) ( not ( = ?auto_800076 ?auto_800089 ) ) ( not ( = ?auto_800076 ?auto_800090 ) ) ( not ( = ?auto_800077 ?auto_800078 ) ) ( not ( = ?auto_800077 ?auto_800079 ) ) ( not ( = ?auto_800077 ?auto_800080 ) ) ( not ( = ?auto_800077 ?auto_800081 ) ) ( not ( = ?auto_800077 ?auto_800082 ) ) ( not ( = ?auto_800077 ?auto_800083 ) ) ( not ( = ?auto_800077 ?auto_800084 ) ) ( not ( = ?auto_800077 ?auto_800085 ) ) ( not ( = ?auto_800077 ?auto_800086 ) ) ( not ( = ?auto_800077 ?auto_800087 ) ) ( not ( = ?auto_800077 ?auto_800088 ) ) ( not ( = ?auto_800077 ?auto_800089 ) ) ( not ( = ?auto_800077 ?auto_800090 ) ) ( not ( = ?auto_800078 ?auto_800079 ) ) ( not ( = ?auto_800078 ?auto_800080 ) ) ( not ( = ?auto_800078 ?auto_800081 ) ) ( not ( = ?auto_800078 ?auto_800082 ) ) ( not ( = ?auto_800078 ?auto_800083 ) ) ( not ( = ?auto_800078 ?auto_800084 ) ) ( not ( = ?auto_800078 ?auto_800085 ) ) ( not ( = ?auto_800078 ?auto_800086 ) ) ( not ( = ?auto_800078 ?auto_800087 ) ) ( not ( = ?auto_800078 ?auto_800088 ) ) ( not ( = ?auto_800078 ?auto_800089 ) ) ( not ( = ?auto_800078 ?auto_800090 ) ) ( not ( = ?auto_800079 ?auto_800080 ) ) ( not ( = ?auto_800079 ?auto_800081 ) ) ( not ( = ?auto_800079 ?auto_800082 ) ) ( not ( = ?auto_800079 ?auto_800083 ) ) ( not ( = ?auto_800079 ?auto_800084 ) ) ( not ( = ?auto_800079 ?auto_800085 ) ) ( not ( = ?auto_800079 ?auto_800086 ) ) ( not ( = ?auto_800079 ?auto_800087 ) ) ( not ( = ?auto_800079 ?auto_800088 ) ) ( not ( = ?auto_800079 ?auto_800089 ) ) ( not ( = ?auto_800079 ?auto_800090 ) ) ( not ( = ?auto_800080 ?auto_800081 ) ) ( not ( = ?auto_800080 ?auto_800082 ) ) ( not ( = ?auto_800080 ?auto_800083 ) ) ( not ( = ?auto_800080 ?auto_800084 ) ) ( not ( = ?auto_800080 ?auto_800085 ) ) ( not ( = ?auto_800080 ?auto_800086 ) ) ( not ( = ?auto_800080 ?auto_800087 ) ) ( not ( = ?auto_800080 ?auto_800088 ) ) ( not ( = ?auto_800080 ?auto_800089 ) ) ( not ( = ?auto_800080 ?auto_800090 ) ) ( not ( = ?auto_800081 ?auto_800082 ) ) ( not ( = ?auto_800081 ?auto_800083 ) ) ( not ( = ?auto_800081 ?auto_800084 ) ) ( not ( = ?auto_800081 ?auto_800085 ) ) ( not ( = ?auto_800081 ?auto_800086 ) ) ( not ( = ?auto_800081 ?auto_800087 ) ) ( not ( = ?auto_800081 ?auto_800088 ) ) ( not ( = ?auto_800081 ?auto_800089 ) ) ( not ( = ?auto_800081 ?auto_800090 ) ) ( not ( = ?auto_800082 ?auto_800083 ) ) ( not ( = ?auto_800082 ?auto_800084 ) ) ( not ( = ?auto_800082 ?auto_800085 ) ) ( not ( = ?auto_800082 ?auto_800086 ) ) ( not ( = ?auto_800082 ?auto_800087 ) ) ( not ( = ?auto_800082 ?auto_800088 ) ) ( not ( = ?auto_800082 ?auto_800089 ) ) ( not ( = ?auto_800082 ?auto_800090 ) ) ( not ( = ?auto_800083 ?auto_800084 ) ) ( not ( = ?auto_800083 ?auto_800085 ) ) ( not ( = ?auto_800083 ?auto_800086 ) ) ( not ( = ?auto_800083 ?auto_800087 ) ) ( not ( = ?auto_800083 ?auto_800088 ) ) ( not ( = ?auto_800083 ?auto_800089 ) ) ( not ( = ?auto_800083 ?auto_800090 ) ) ( not ( = ?auto_800084 ?auto_800085 ) ) ( not ( = ?auto_800084 ?auto_800086 ) ) ( not ( = ?auto_800084 ?auto_800087 ) ) ( not ( = ?auto_800084 ?auto_800088 ) ) ( not ( = ?auto_800084 ?auto_800089 ) ) ( not ( = ?auto_800084 ?auto_800090 ) ) ( not ( = ?auto_800085 ?auto_800086 ) ) ( not ( = ?auto_800085 ?auto_800087 ) ) ( not ( = ?auto_800085 ?auto_800088 ) ) ( not ( = ?auto_800085 ?auto_800089 ) ) ( not ( = ?auto_800085 ?auto_800090 ) ) ( not ( = ?auto_800086 ?auto_800087 ) ) ( not ( = ?auto_800086 ?auto_800088 ) ) ( not ( = ?auto_800086 ?auto_800089 ) ) ( not ( = ?auto_800086 ?auto_800090 ) ) ( not ( = ?auto_800087 ?auto_800088 ) ) ( not ( = ?auto_800087 ?auto_800089 ) ) ( not ( = ?auto_800087 ?auto_800090 ) ) ( not ( = ?auto_800088 ?auto_800089 ) ) ( not ( = ?auto_800088 ?auto_800090 ) ) ( not ( = ?auto_800089 ?auto_800090 ) ) ( ON ?auto_800088 ?auto_800089 ) ( CLEAR ?auto_800086 ) ( ON ?auto_800087 ?auto_800088 ) ( CLEAR ?auto_800087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_800072 ?auto_800073 ?auto_800074 ?auto_800075 ?auto_800076 ?auto_800077 ?auto_800078 ?auto_800079 ?auto_800080 ?auto_800081 ?auto_800082 ?auto_800083 ?auto_800084 ?auto_800085 ?auto_800086 ?auto_800087 )
      ( MAKE-18PILE ?auto_800072 ?auto_800073 ?auto_800074 ?auto_800075 ?auto_800076 ?auto_800077 ?auto_800078 ?auto_800079 ?auto_800080 ?auto_800081 ?auto_800082 ?auto_800083 ?auto_800084 ?auto_800085 ?auto_800086 ?auto_800087 ?auto_800088 ?auto_800089 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800109 - BLOCK
      ?auto_800110 - BLOCK
      ?auto_800111 - BLOCK
      ?auto_800112 - BLOCK
      ?auto_800113 - BLOCK
      ?auto_800114 - BLOCK
      ?auto_800115 - BLOCK
      ?auto_800116 - BLOCK
      ?auto_800117 - BLOCK
      ?auto_800118 - BLOCK
      ?auto_800119 - BLOCK
      ?auto_800120 - BLOCK
      ?auto_800121 - BLOCK
      ?auto_800122 - BLOCK
      ?auto_800123 - BLOCK
      ?auto_800124 - BLOCK
      ?auto_800125 - BLOCK
      ?auto_800126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_800126 ) ( ON-TABLE ?auto_800109 ) ( ON ?auto_800110 ?auto_800109 ) ( ON ?auto_800111 ?auto_800110 ) ( ON ?auto_800112 ?auto_800111 ) ( ON ?auto_800113 ?auto_800112 ) ( ON ?auto_800114 ?auto_800113 ) ( ON ?auto_800115 ?auto_800114 ) ( ON ?auto_800116 ?auto_800115 ) ( ON ?auto_800117 ?auto_800116 ) ( ON ?auto_800118 ?auto_800117 ) ( ON ?auto_800119 ?auto_800118 ) ( ON ?auto_800120 ?auto_800119 ) ( ON ?auto_800121 ?auto_800120 ) ( ON ?auto_800122 ?auto_800121 ) ( ON ?auto_800123 ?auto_800122 ) ( not ( = ?auto_800109 ?auto_800110 ) ) ( not ( = ?auto_800109 ?auto_800111 ) ) ( not ( = ?auto_800109 ?auto_800112 ) ) ( not ( = ?auto_800109 ?auto_800113 ) ) ( not ( = ?auto_800109 ?auto_800114 ) ) ( not ( = ?auto_800109 ?auto_800115 ) ) ( not ( = ?auto_800109 ?auto_800116 ) ) ( not ( = ?auto_800109 ?auto_800117 ) ) ( not ( = ?auto_800109 ?auto_800118 ) ) ( not ( = ?auto_800109 ?auto_800119 ) ) ( not ( = ?auto_800109 ?auto_800120 ) ) ( not ( = ?auto_800109 ?auto_800121 ) ) ( not ( = ?auto_800109 ?auto_800122 ) ) ( not ( = ?auto_800109 ?auto_800123 ) ) ( not ( = ?auto_800109 ?auto_800124 ) ) ( not ( = ?auto_800109 ?auto_800125 ) ) ( not ( = ?auto_800109 ?auto_800126 ) ) ( not ( = ?auto_800110 ?auto_800111 ) ) ( not ( = ?auto_800110 ?auto_800112 ) ) ( not ( = ?auto_800110 ?auto_800113 ) ) ( not ( = ?auto_800110 ?auto_800114 ) ) ( not ( = ?auto_800110 ?auto_800115 ) ) ( not ( = ?auto_800110 ?auto_800116 ) ) ( not ( = ?auto_800110 ?auto_800117 ) ) ( not ( = ?auto_800110 ?auto_800118 ) ) ( not ( = ?auto_800110 ?auto_800119 ) ) ( not ( = ?auto_800110 ?auto_800120 ) ) ( not ( = ?auto_800110 ?auto_800121 ) ) ( not ( = ?auto_800110 ?auto_800122 ) ) ( not ( = ?auto_800110 ?auto_800123 ) ) ( not ( = ?auto_800110 ?auto_800124 ) ) ( not ( = ?auto_800110 ?auto_800125 ) ) ( not ( = ?auto_800110 ?auto_800126 ) ) ( not ( = ?auto_800111 ?auto_800112 ) ) ( not ( = ?auto_800111 ?auto_800113 ) ) ( not ( = ?auto_800111 ?auto_800114 ) ) ( not ( = ?auto_800111 ?auto_800115 ) ) ( not ( = ?auto_800111 ?auto_800116 ) ) ( not ( = ?auto_800111 ?auto_800117 ) ) ( not ( = ?auto_800111 ?auto_800118 ) ) ( not ( = ?auto_800111 ?auto_800119 ) ) ( not ( = ?auto_800111 ?auto_800120 ) ) ( not ( = ?auto_800111 ?auto_800121 ) ) ( not ( = ?auto_800111 ?auto_800122 ) ) ( not ( = ?auto_800111 ?auto_800123 ) ) ( not ( = ?auto_800111 ?auto_800124 ) ) ( not ( = ?auto_800111 ?auto_800125 ) ) ( not ( = ?auto_800111 ?auto_800126 ) ) ( not ( = ?auto_800112 ?auto_800113 ) ) ( not ( = ?auto_800112 ?auto_800114 ) ) ( not ( = ?auto_800112 ?auto_800115 ) ) ( not ( = ?auto_800112 ?auto_800116 ) ) ( not ( = ?auto_800112 ?auto_800117 ) ) ( not ( = ?auto_800112 ?auto_800118 ) ) ( not ( = ?auto_800112 ?auto_800119 ) ) ( not ( = ?auto_800112 ?auto_800120 ) ) ( not ( = ?auto_800112 ?auto_800121 ) ) ( not ( = ?auto_800112 ?auto_800122 ) ) ( not ( = ?auto_800112 ?auto_800123 ) ) ( not ( = ?auto_800112 ?auto_800124 ) ) ( not ( = ?auto_800112 ?auto_800125 ) ) ( not ( = ?auto_800112 ?auto_800126 ) ) ( not ( = ?auto_800113 ?auto_800114 ) ) ( not ( = ?auto_800113 ?auto_800115 ) ) ( not ( = ?auto_800113 ?auto_800116 ) ) ( not ( = ?auto_800113 ?auto_800117 ) ) ( not ( = ?auto_800113 ?auto_800118 ) ) ( not ( = ?auto_800113 ?auto_800119 ) ) ( not ( = ?auto_800113 ?auto_800120 ) ) ( not ( = ?auto_800113 ?auto_800121 ) ) ( not ( = ?auto_800113 ?auto_800122 ) ) ( not ( = ?auto_800113 ?auto_800123 ) ) ( not ( = ?auto_800113 ?auto_800124 ) ) ( not ( = ?auto_800113 ?auto_800125 ) ) ( not ( = ?auto_800113 ?auto_800126 ) ) ( not ( = ?auto_800114 ?auto_800115 ) ) ( not ( = ?auto_800114 ?auto_800116 ) ) ( not ( = ?auto_800114 ?auto_800117 ) ) ( not ( = ?auto_800114 ?auto_800118 ) ) ( not ( = ?auto_800114 ?auto_800119 ) ) ( not ( = ?auto_800114 ?auto_800120 ) ) ( not ( = ?auto_800114 ?auto_800121 ) ) ( not ( = ?auto_800114 ?auto_800122 ) ) ( not ( = ?auto_800114 ?auto_800123 ) ) ( not ( = ?auto_800114 ?auto_800124 ) ) ( not ( = ?auto_800114 ?auto_800125 ) ) ( not ( = ?auto_800114 ?auto_800126 ) ) ( not ( = ?auto_800115 ?auto_800116 ) ) ( not ( = ?auto_800115 ?auto_800117 ) ) ( not ( = ?auto_800115 ?auto_800118 ) ) ( not ( = ?auto_800115 ?auto_800119 ) ) ( not ( = ?auto_800115 ?auto_800120 ) ) ( not ( = ?auto_800115 ?auto_800121 ) ) ( not ( = ?auto_800115 ?auto_800122 ) ) ( not ( = ?auto_800115 ?auto_800123 ) ) ( not ( = ?auto_800115 ?auto_800124 ) ) ( not ( = ?auto_800115 ?auto_800125 ) ) ( not ( = ?auto_800115 ?auto_800126 ) ) ( not ( = ?auto_800116 ?auto_800117 ) ) ( not ( = ?auto_800116 ?auto_800118 ) ) ( not ( = ?auto_800116 ?auto_800119 ) ) ( not ( = ?auto_800116 ?auto_800120 ) ) ( not ( = ?auto_800116 ?auto_800121 ) ) ( not ( = ?auto_800116 ?auto_800122 ) ) ( not ( = ?auto_800116 ?auto_800123 ) ) ( not ( = ?auto_800116 ?auto_800124 ) ) ( not ( = ?auto_800116 ?auto_800125 ) ) ( not ( = ?auto_800116 ?auto_800126 ) ) ( not ( = ?auto_800117 ?auto_800118 ) ) ( not ( = ?auto_800117 ?auto_800119 ) ) ( not ( = ?auto_800117 ?auto_800120 ) ) ( not ( = ?auto_800117 ?auto_800121 ) ) ( not ( = ?auto_800117 ?auto_800122 ) ) ( not ( = ?auto_800117 ?auto_800123 ) ) ( not ( = ?auto_800117 ?auto_800124 ) ) ( not ( = ?auto_800117 ?auto_800125 ) ) ( not ( = ?auto_800117 ?auto_800126 ) ) ( not ( = ?auto_800118 ?auto_800119 ) ) ( not ( = ?auto_800118 ?auto_800120 ) ) ( not ( = ?auto_800118 ?auto_800121 ) ) ( not ( = ?auto_800118 ?auto_800122 ) ) ( not ( = ?auto_800118 ?auto_800123 ) ) ( not ( = ?auto_800118 ?auto_800124 ) ) ( not ( = ?auto_800118 ?auto_800125 ) ) ( not ( = ?auto_800118 ?auto_800126 ) ) ( not ( = ?auto_800119 ?auto_800120 ) ) ( not ( = ?auto_800119 ?auto_800121 ) ) ( not ( = ?auto_800119 ?auto_800122 ) ) ( not ( = ?auto_800119 ?auto_800123 ) ) ( not ( = ?auto_800119 ?auto_800124 ) ) ( not ( = ?auto_800119 ?auto_800125 ) ) ( not ( = ?auto_800119 ?auto_800126 ) ) ( not ( = ?auto_800120 ?auto_800121 ) ) ( not ( = ?auto_800120 ?auto_800122 ) ) ( not ( = ?auto_800120 ?auto_800123 ) ) ( not ( = ?auto_800120 ?auto_800124 ) ) ( not ( = ?auto_800120 ?auto_800125 ) ) ( not ( = ?auto_800120 ?auto_800126 ) ) ( not ( = ?auto_800121 ?auto_800122 ) ) ( not ( = ?auto_800121 ?auto_800123 ) ) ( not ( = ?auto_800121 ?auto_800124 ) ) ( not ( = ?auto_800121 ?auto_800125 ) ) ( not ( = ?auto_800121 ?auto_800126 ) ) ( not ( = ?auto_800122 ?auto_800123 ) ) ( not ( = ?auto_800122 ?auto_800124 ) ) ( not ( = ?auto_800122 ?auto_800125 ) ) ( not ( = ?auto_800122 ?auto_800126 ) ) ( not ( = ?auto_800123 ?auto_800124 ) ) ( not ( = ?auto_800123 ?auto_800125 ) ) ( not ( = ?auto_800123 ?auto_800126 ) ) ( not ( = ?auto_800124 ?auto_800125 ) ) ( not ( = ?auto_800124 ?auto_800126 ) ) ( not ( = ?auto_800125 ?auto_800126 ) ) ( ON ?auto_800125 ?auto_800126 ) ( CLEAR ?auto_800123 ) ( ON ?auto_800124 ?auto_800125 ) ( CLEAR ?auto_800124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_800109 ?auto_800110 ?auto_800111 ?auto_800112 ?auto_800113 ?auto_800114 ?auto_800115 ?auto_800116 ?auto_800117 ?auto_800118 ?auto_800119 ?auto_800120 ?auto_800121 ?auto_800122 ?auto_800123 ?auto_800124 )
      ( MAKE-18PILE ?auto_800109 ?auto_800110 ?auto_800111 ?auto_800112 ?auto_800113 ?auto_800114 ?auto_800115 ?auto_800116 ?auto_800117 ?auto_800118 ?auto_800119 ?auto_800120 ?auto_800121 ?auto_800122 ?auto_800123 ?auto_800124 ?auto_800125 ?auto_800126 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800145 - BLOCK
      ?auto_800146 - BLOCK
      ?auto_800147 - BLOCK
      ?auto_800148 - BLOCK
      ?auto_800149 - BLOCK
      ?auto_800150 - BLOCK
      ?auto_800151 - BLOCK
      ?auto_800152 - BLOCK
      ?auto_800153 - BLOCK
      ?auto_800154 - BLOCK
      ?auto_800155 - BLOCK
      ?auto_800156 - BLOCK
      ?auto_800157 - BLOCK
      ?auto_800158 - BLOCK
      ?auto_800159 - BLOCK
      ?auto_800160 - BLOCK
      ?auto_800161 - BLOCK
      ?auto_800162 - BLOCK
    )
    :vars
    (
      ?auto_800163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_800162 ?auto_800163 ) ( ON-TABLE ?auto_800145 ) ( ON ?auto_800146 ?auto_800145 ) ( ON ?auto_800147 ?auto_800146 ) ( ON ?auto_800148 ?auto_800147 ) ( ON ?auto_800149 ?auto_800148 ) ( ON ?auto_800150 ?auto_800149 ) ( ON ?auto_800151 ?auto_800150 ) ( ON ?auto_800152 ?auto_800151 ) ( ON ?auto_800153 ?auto_800152 ) ( ON ?auto_800154 ?auto_800153 ) ( ON ?auto_800155 ?auto_800154 ) ( ON ?auto_800156 ?auto_800155 ) ( ON ?auto_800157 ?auto_800156 ) ( ON ?auto_800158 ?auto_800157 ) ( not ( = ?auto_800145 ?auto_800146 ) ) ( not ( = ?auto_800145 ?auto_800147 ) ) ( not ( = ?auto_800145 ?auto_800148 ) ) ( not ( = ?auto_800145 ?auto_800149 ) ) ( not ( = ?auto_800145 ?auto_800150 ) ) ( not ( = ?auto_800145 ?auto_800151 ) ) ( not ( = ?auto_800145 ?auto_800152 ) ) ( not ( = ?auto_800145 ?auto_800153 ) ) ( not ( = ?auto_800145 ?auto_800154 ) ) ( not ( = ?auto_800145 ?auto_800155 ) ) ( not ( = ?auto_800145 ?auto_800156 ) ) ( not ( = ?auto_800145 ?auto_800157 ) ) ( not ( = ?auto_800145 ?auto_800158 ) ) ( not ( = ?auto_800145 ?auto_800159 ) ) ( not ( = ?auto_800145 ?auto_800160 ) ) ( not ( = ?auto_800145 ?auto_800161 ) ) ( not ( = ?auto_800145 ?auto_800162 ) ) ( not ( = ?auto_800145 ?auto_800163 ) ) ( not ( = ?auto_800146 ?auto_800147 ) ) ( not ( = ?auto_800146 ?auto_800148 ) ) ( not ( = ?auto_800146 ?auto_800149 ) ) ( not ( = ?auto_800146 ?auto_800150 ) ) ( not ( = ?auto_800146 ?auto_800151 ) ) ( not ( = ?auto_800146 ?auto_800152 ) ) ( not ( = ?auto_800146 ?auto_800153 ) ) ( not ( = ?auto_800146 ?auto_800154 ) ) ( not ( = ?auto_800146 ?auto_800155 ) ) ( not ( = ?auto_800146 ?auto_800156 ) ) ( not ( = ?auto_800146 ?auto_800157 ) ) ( not ( = ?auto_800146 ?auto_800158 ) ) ( not ( = ?auto_800146 ?auto_800159 ) ) ( not ( = ?auto_800146 ?auto_800160 ) ) ( not ( = ?auto_800146 ?auto_800161 ) ) ( not ( = ?auto_800146 ?auto_800162 ) ) ( not ( = ?auto_800146 ?auto_800163 ) ) ( not ( = ?auto_800147 ?auto_800148 ) ) ( not ( = ?auto_800147 ?auto_800149 ) ) ( not ( = ?auto_800147 ?auto_800150 ) ) ( not ( = ?auto_800147 ?auto_800151 ) ) ( not ( = ?auto_800147 ?auto_800152 ) ) ( not ( = ?auto_800147 ?auto_800153 ) ) ( not ( = ?auto_800147 ?auto_800154 ) ) ( not ( = ?auto_800147 ?auto_800155 ) ) ( not ( = ?auto_800147 ?auto_800156 ) ) ( not ( = ?auto_800147 ?auto_800157 ) ) ( not ( = ?auto_800147 ?auto_800158 ) ) ( not ( = ?auto_800147 ?auto_800159 ) ) ( not ( = ?auto_800147 ?auto_800160 ) ) ( not ( = ?auto_800147 ?auto_800161 ) ) ( not ( = ?auto_800147 ?auto_800162 ) ) ( not ( = ?auto_800147 ?auto_800163 ) ) ( not ( = ?auto_800148 ?auto_800149 ) ) ( not ( = ?auto_800148 ?auto_800150 ) ) ( not ( = ?auto_800148 ?auto_800151 ) ) ( not ( = ?auto_800148 ?auto_800152 ) ) ( not ( = ?auto_800148 ?auto_800153 ) ) ( not ( = ?auto_800148 ?auto_800154 ) ) ( not ( = ?auto_800148 ?auto_800155 ) ) ( not ( = ?auto_800148 ?auto_800156 ) ) ( not ( = ?auto_800148 ?auto_800157 ) ) ( not ( = ?auto_800148 ?auto_800158 ) ) ( not ( = ?auto_800148 ?auto_800159 ) ) ( not ( = ?auto_800148 ?auto_800160 ) ) ( not ( = ?auto_800148 ?auto_800161 ) ) ( not ( = ?auto_800148 ?auto_800162 ) ) ( not ( = ?auto_800148 ?auto_800163 ) ) ( not ( = ?auto_800149 ?auto_800150 ) ) ( not ( = ?auto_800149 ?auto_800151 ) ) ( not ( = ?auto_800149 ?auto_800152 ) ) ( not ( = ?auto_800149 ?auto_800153 ) ) ( not ( = ?auto_800149 ?auto_800154 ) ) ( not ( = ?auto_800149 ?auto_800155 ) ) ( not ( = ?auto_800149 ?auto_800156 ) ) ( not ( = ?auto_800149 ?auto_800157 ) ) ( not ( = ?auto_800149 ?auto_800158 ) ) ( not ( = ?auto_800149 ?auto_800159 ) ) ( not ( = ?auto_800149 ?auto_800160 ) ) ( not ( = ?auto_800149 ?auto_800161 ) ) ( not ( = ?auto_800149 ?auto_800162 ) ) ( not ( = ?auto_800149 ?auto_800163 ) ) ( not ( = ?auto_800150 ?auto_800151 ) ) ( not ( = ?auto_800150 ?auto_800152 ) ) ( not ( = ?auto_800150 ?auto_800153 ) ) ( not ( = ?auto_800150 ?auto_800154 ) ) ( not ( = ?auto_800150 ?auto_800155 ) ) ( not ( = ?auto_800150 ?auto_800156 ) ) ( not ( = ?auto_800150 ?auto_800157 ) ) ( not ( = ?auto_800150 ?auto_800158 ) ) ( not ( = ?auto_800150 ?auto_800159 ) ) ( not ( = ?auto_800150 ?auto_800160 ) ) ( not ( = ?auto_800150 ?auto_800161 ) ) ( not ( = ?auto_800150 ?auto_800162 ) ) ( not ( = ?auto_800150 ?auto_800163 ) ) ( not ( = ?auto_800151 ?auto_800152 ) ) ( not ( = ?auto_800151 ?auto_800153 ) ) ( not ( = ?auto_800151 ?auto_800154 ) ) ( not ( = ?auto_800151 ?auto_800155 ) ) ( not ( = ?auto_800151 ?auto_800156 ) ) ( not ( = ?auto_800151 ?auto_800157 ) ) ( not ( = ?auto_800151 ?auto_800158 ) ) ( not ( = ?auto_800151 ?auto_800159 ) ) ( not ( = ?auto_800151 ?auto_800160 ) ) ( not ( = ?auto_800151 ?auto_800161 ) ) ( not ( = ?auto_800151 ?auto_800162 ) ) ( not ( = ?auto_800151 ?auto_800163 ) ) ( not ( = ?auto_800152 ?auto_800153 ) ) ( not ( = ?auto_800152 ?auto_800154 ) ) ( not ( = ?auto_800152 ?auto_800155 ) ) ( not ( = ?auto_800152 ?auto_800156 ) ) ( not ( = ?auto_800152 ?auto_800157 ) ) ( not ( = ?auto_800152 ?auto_800158 ) ) ( not ( = ?auto_800152 ?auto_800159 ) ) ( not ( = ?auto_800152 ?auto_800160 ) ) ( not ( = ?auto_800152 ?auto_800161 ) ) ( not ( = ?auto_800152 ?auto_800162 ) ) ( not ( = ?auto_800152 ?auto_800163 ) ) ( not ( = ?auto_800153 ?auto_800154 ) ) ( not ( = ?auto_800153 ?auto_800155 ) ) ( not ( = ?auto_800153 ?auto_800156 ) ) ( not ( = ?auto_800153 ?auto_800157 ) ) ( not ( = ?auto_800153 ?auto_800158 ) ) ( not ( = ?auto_800153 ?auto_800159 ) ) ( not ( = ?auto_800153 ?auto_800160 ) ) ( not ( = ?auto_800153 ?auto_800161 ) ) ( not ( = ?auto_800153 ?auto_800162 ) ) ( not ( = ?auto_800153 ?auto_800163 ) ) ( not ( = ?auto_800154 ?auto_800155 ) ) ( not ( = ?auto_800154 ?auto_800156 ) ) ( not ( = ?auto_800154 ?auto_800157 ) ) ( not ( = ?auto_800154 ?auto_800158 ) ) ( not ( = ?auto_800154 ?auto_800159 ) ) ( not ( = ?auto_800154 ?auto_800160 ) ) ( not ( = ?auto_800154 ?auto_800161 ) ) ( not ( = ?auto_800154 ?auto_800162 ) ) ( not ( = ?auto_800154 ?auto_800163 ) ) ( not ( = ?auto_800155 ?auto_800156 ) ) ( not ( = ?auto_800155 ?auto_800157 ) ) ( not ( = ?auto_800155 ?auto_800158 ) ) ( not ( = ?auto_800155 ?auto_800159 ) ) ( not ( = ?auto_800155 ?auto_800160 ) ) ( not ( = ?auto_800155 ?auto_800161 ) ) ( not ( = ?auto_800155 ?auto_800162 ) ) ( not ( = ?auto_800155 ?auto_800163 ) ) ( not ( = ?auto_800156 ?auto_800157 ) ) ( not ( = ?auto_800156 ?auto_800158 ) ) ( not ( = ?auto_800156 ?auto_800159 ) ) ( not ( = ?auto_800156 ?auto_800160 ) ) ( not ( = ?auto_800156 ?auto_800161 ) ) ( not ( = ?auto_800156 ?auto_800162 ) ) ( not ( = ?auto_800156 ?auto_800163 ) ) ( not ( = ?auto_800157 ?auto_800158 ) ) ( not ( = ?auto_800157 ?auto_800159 ) ) ( not ( = ?auto_800157 ?auto_800160 ) ) ( not ( = ?auto_800157 ?auto_800161 ) ) ( not ( = ?auto_800157 ?auto_800162 ) ) ( not ( = ?auto_800157 ?auto_800163 ) ) ( not ( = ?auto_800158 ?auto_800159 ) ) ( not ( = ?auto_800158 ?auto_800160 ) ) ( not ( = ?auto_800158 ?auto_800161 ) ) ( not ( = ?auto_800158 ?auto_800162 ) ) ( not ( = ?auto_800158 ?auto_800163 ) ) ( not ( = ?auto_800159 ?auto_800160 ) ) ( not ( = ?auto_800159 ?auto_800161 ) ) ( not ( = ?auto_800159 ?auto_800162 ) ) ( not ( = ?auto_800159 ?auto_800163 ) ) ( not ( = ?auto_800160 ?auto_800161 ) ) ( not ( = ?auto_800160 ?auto_800162 ) ) ( not ( = ?auto_800160 ?auto_800163 ) ) ( not ( = ?auto_800161 ?auto_800162 ) ) ( not ( = ?auto_800161 ?auto_800163 ) ) ( not ( = ?auto_800162 ?auto_800163 ) ) ( ON ?auto_800161 ?auto_800162 ) ( ON ?auto_800160 ?auto_800161 ) ( CLEAR ?auto_800158 ) ( ON ?auto_800159 ?auto_800160 ) ( CLEAR ?auto_800159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_800145 ?auto_800146 ?auto_800147 ?auto_800148 ?auto_800149 ?auto_800150 ?auto_800151 ?auto_800152 ?auto_800153 ?auto_800154 ?auto_800155 ?auto_800156 ?auto_800157 ?auto_800158 ?auto_800159 )
      ( MAKE-18PILE ?auto_800145 ?auto_800146 ?auto_800147 ?auto_800148 ?auto_800149 ?auto_800150 ?auto_800151 ?auto_800152 ?auto_800153 ?auto_800154 ?auto_800155 ?auto_800156 ?auto_800157 ?auto_800158 ?auto_800159 ?auto_800160 ?auto_800161 ?auto_800162 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800182 - BLOCK
      ?auto_800183 - BLOCK
      ?auto_800184 - BLOCK
      ?auto_800185 - BLOCK
      ?auto_800186 - BLOCK
      ?auto_800187 - BLOCK
      ?auto_800188 - BLOCK
      ?auto_800189 - BLOCK
      ?auto_800190 - BLOCK
      ?auto_800191 - BLOCK
      ?auto_800192 - BLOCK
      ?auto_800193 - BLOCK
      ?auto_800194 - BLOCK
      ?auto_800195 - BLOCK
      ?auto_800196 - BLOCK
      ?auto_800197 - BLOCK
      ?auto_800198 - BLOCK
      ?auto_800199 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_800199 ) ( ON-TABLE ?auto_800182 ) ( ON ?auto_800183 ?auto_800182 ) ( ON ?auto_800184 ?auto_800183 ) ( ON ?auto_800185 ?auto_800184 ) ( ON ?auto_800186 ?auto_800185 ) ( ON ?auto_800187 ?auto_800186 ) ( ON ?auto_800188 ?auto_800187 ) ( ON ?auto_800189 ?auto_800188 ) ( ON ?auto_800190 ?auto_800189 ) ( ON ?auto_800191 ?auto_800190 ) ( ON ?auto_800192 ?auto_800191 ) ( ON ?auto_800193 ?auto_800192 ) ( ON ?auto_800194 ?auto_800193 ) ( ON ?auto_800195 ?auto_800194 ) ( not ( = ?auto_800182 ?auto_800183 ) ) ( not ( = ?auto_800182 ?auto_800184 ) ) ( not ( = ?auto_800182 ?auto_800185 ) ) ( not ( = ?auto_800182 ?auto_800186 ) ) ( not ( = ?auto_800182 ?auto_800187 ) ) ( not ( = ?auto_800182 ?auto_800188 ) ) ( not ( = ?auto_800182 ?auto_800189 ) ) ( not ( = ?auto_800182 ?auto_800190 ) ) ( not ( = ?auto_800182 ?auto_800191 ) ) ( not ( = ?auto_800182 ?auto_800192 ) ) ( not ( = ?auto_800182 ?auto_800193 ) ) ( not ( = ?auto_800182 ?auto_800194 ) ) ( not ( = ?auto_800182 ?auto_800195 ) ) ( not ( = ?auto_800182 ?auto_800196 ) ) ( not ( = ?auto_800182 ?auto_800197 ) ) ( not ( = ?auto_800182 ?auto_800198 ) ) ( not ( = ?auto_800182 ?auto_800199 ) ) ( not ( = ?auto_800183 ?auto_800184 ) ) ( not ( = ?auto_800183 ?auto_800185 ) ) ( not ( = ?auto_800183 ?auto_800186 ) ) ( not ( = ?auto_800183 ?auto_800187 ) ) ( not ( = ?auto_800183 ?auto_800188 ) ) ( not ( = ?auto_800183 ?auto_800189 ) ) ( not ( = ?auto_800183 ?auto_800190 ) ) ( not ( = ?auto_800183 ?auto_800191 ) ) ( not ( = ?auto_800183 ?auto_800192 ) ) ( not ( = ?auto_800183 ?auto_800193 ) ) ( not ( = ?auto_800183 ?auto_800194 ) ) ( not ( = ?auto_800183 ?auto_800195 ) ) ( not ( = ?auto_800183 ?auto_800196 ) ) ( not ( = ?auto_800183 ?auto_800197 ) ) ( not ( = ?auto_800183 ?auto_800198 ) ) ( not ( = ?auto_800183 ?auto_800199 ) ) ( not ( = ?auto_800184 ?auto_800185 ) ) ( not ( = ?auto_800184 ?auto_800186 ) ) ( not ( = ?auto_800184 ?auto_800187 ) ) ( not ( = ?auto_800184 ?auto_800188 ) ) ( not ( = ?auto_800184 ?auto_800189 ) ) ( not ( = ?auto_800184 ?auto_800190 ) ) ( not ( = ?auto_800184 ?auto_800191 ) ) ( not ( = ?auto_800184 ?auto_800192 ) ) ( not ( = ?auto_800184 ?auto_800193 ) ) ( not ( = ?auto_800184 ?auto_800194 ) ) ( not ( = ?auto_800184 ?auto_800195 ) ) ( not ( = ?auto_800184 ?auto_800196 ) ) ( not ( = ?auto_800184 ?auto_800197 ) ) ( not ( = ?auto_800184 ?auto_800198 ) ) ( not ( = ?auto_800184 ?auto_800199 ) ) ( not ( = ?auto_800185 ?auto_800186 ) ) ( not ( = ?auto_800185 ?auto_800187 ) ) ( not ( = ?auto_800185 ?auto_800188 ) ) ( not ( = ?auto_800185 ?auto_800189 ) ) ( not ( = ?auto_800185 ?auto_800190 ) ) ( not ( = ?auto_800185 ?auto_800191 ) ) ( not ( = ?auto_800185 ?auto_800192 ) ) ( not ( = ?auto_800185 ?auto_800193 ) ) ( not ( = ?auto_800185 ?auto_800194 ) ) ( not ( = ?auto_800185 ?auto_800195 ) ) ( not ( = ?auto_800185 ?auto_800196 ) ) ( not ( = ?auto_800185 ?auto_800197 ) ) ( not ( = ?auto_800185 ?auto_800198 ) ) ( not ( = ?auto_800185 ?auto_800199 ) ) ( not ( = ?auto_800186 ?auto_800187 ) ) ( not ( = ?auto_800186 ?auto_800188 ) ) ( not ( = ?auto_800186 ?auto_800189 ) ) ( not ( = ?auto_800186 ?auto_800190 ) ) ( not ( = ?auto_800186 ?auto_800191 ) ) ( not ( = ?auto_800186 ?auto_800192 ) ) ( not ( = ?auto_800186 ?auto_800193 ) ) ( not ( = ?auto_800186 ?auto_800194 ) ) ( not ( = ?auto_800186 ?auto_800195 ) ) ( not ( = ?auto_800186 ?auto_800196 ) ) ( not ( = ?auto_800186 ?auto_800197 ) ) ( not ( = ?auto_800186 ?auto_800198 ) ) ( not ( = ?auto_800186 ?auto_800199 ) ) ( not ( = ?auto_800187 ?auto_800188 ) ) ( not ( = ?auto_800187 ?auto_800189 ) ) ( not ( = ?auto_800187 ?auto_800190 ) ) ( not ( = ?auto_800187 ?auto_800191 ) ) ( not ( = ?auto_800187 ?auto_800192 ) ) ( not ( = ?auto_800187 ?auto_800193 ) ) ( not ( = ?auto_800187 ?auto_800194 ) ) ( not ( = ?auto_800187 ?auto_800195 ) ) ( not ( = ?auto_800187 ?auto_800196 ) ) ( not ( = ?auto_800187 ?auto_800197 ) ) ( not ( = ?auto_800187 ?auto_800198 ) ) ( not ( = ?auto_800187 ?auto_800199 ) ) ( not ( = ?auto_800188 ?auto_800189 ) ) ( not ( = ?auto_800188 ?auto_800190 ) ) ( not ( = ?auto_800188 ?auto_800191 ) ) ( not ( = ?auto_800188 ?auto_800192 ) ) ( not ( = ?auto_800188 ?auto_800193 ) ) ( not ( = ?auto_800188 ?auto_800194 ) ) ( not ( = ?auto_800188 ?auto_800195 ) ) ( not ( = ?auto_800188 ?auto_800196 ) ) ( not ( = ?auto_800188 ?auto_800197 ) ) ( not ( = ?auto_800188 ?auto_800198 ) ) ( not ( = ?auto_800188 ?auto_800199 ) ) ( not ( = ?auto_800189 ?auto_800190 ) ) ( not ( = ?auto_800189 ?auto_800191 ) ) ( not ( = ?auto_800189 ?auto_800192 ) ) ( not ( = ?auto_800189 ?auto_800193 ) ) ( not ( = ?auto_800189 ?auto_800194 ) ) ( not ( = ?auto_800189 ?auto_800195 ) ) ( not ( = ?auto_800189 ?auto_800196 ) ) ( not ( = ?auto_800189 ?auto_800197 ) ) ( not ( = ?auto_800189 ?auto_800198 ) ) ( not ( = ?auto_800189 ?auto_800199 ) ) ( not ( = ?auto_800190 ?auto_800191 ) ) ( not ( = ?auto_800190 ?auto_800192 ) ) ( not ( = ?auto_800190 ?auto_800193 ) ) ( not ( = ?auto_800190 ?auto_800194 ) ) ( not ( = ?auto_800190 ?auto_800195 ) ) ( not ( = ?auto_800190 ?auto_800196 ) ) ( not ( = ?auto_800190 ?auto_800197 ) ) ( not ( = ?auto_800190 ?auto_800198 ) ) ( not ( = ?auto_800190 ?auto_800199 ) ) ( not ( = ?auto_800191 ?auto_800192 ) ) ( not ( = ?auto_800191 ?auto_800193 ) ) ( not ( = ?auto_800191 ?auto_800194 ) ) ( not ( = ?auto_800191 ?auto_800195 ) ) ( not ( = ?auto_800191 ?auto_800196 ) ) ( not ( = ?auto_800191 ?auto_800197 ) ) ( not ( = ?auto_800191 ?auto_800198 ) ) ( not ( = ?auto_800191 ?auto_800199 ) ) ( not ( = ?auto_800192 ?auto_800193 ) ) ( not ( = ?auto_800192 ?auto_800194 ) ) ( not ( = ?auto_800192 ?auto_800195 ) ) ( not ( = ?auto_800192 ?auto_800196 ) ) ( not ( = ?auto_800192 ?auto_800197 ) ) ( not ( = ?auto_800192 ?auto_800198 ) ) ( not ( = ?auto_800192 ?auto_800199 ) ) ( not ( = ?auto_800193 ?auto_800194 ) ) ( not ( = ?auto_800193 ?auto_800195 ) ) ( not ( = ?auto_800193 ?auto_800196 ) ) ( not ( = ?auto_800193 ?auto_800197 ) ) ( not ( = ?auto_800193 ?auto_800198 ) ) ( not ( = ?auto_800193 ?auto_800199 ) ) ( not ( = ?auto_800194 ?auto_800195 ) ) ( not ( = ?auto_800194 ?auto_800196 ) ) ( not ( = ?auto_800194 ?auto_800197 ) ) ( not ( = ?auto_800194 ?auto_800198 ) ) ( not ( = ?auto_800194 ?auto_800199 ) ) ( not ( = ?auto_800195 ?auto_800196 ) ) ( not ( = ?auto_800195 ?auto_800197 ) ) ( not ( = ?auto_800195 ?auto_800198 ) ) ( not ( = ?auto_800195 ?auto_800199 ) ) ( not ( = ?auto_800196 ?auto_800197 ) ) ( not ( = ?auto_800196 ?auto_800198 ) ) ( not ( = ?auto_800196 ?auto_800199 ) ) ( not ( = ?auto_800197 ?auto_800198 ) ) ( not ( = ?auto_800197 ?auto_800199 ) ) ( not ( = ?auto_800198 ?auto_800199 ) ) ( ON ?auto_800198 ?auto_800199 ) ( ON ?auto_800197 ?auto_800198 ) ( CLEAR ?auto_800195 ) ( ON ?auto_800196 ?auto_800197 ) ( CLEAR ?auto_800196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_800182 ?auto_800183 ?auto_800184 ?auto_800185 ?auto_800186 ?auto_800187 ?auto_800188 ?auto_800189 ?auto_800190 ?auto_800191 ?auto_800192 ?auto_800193 ?auto_800194 ?auto_800195 ?auto_800196 )
      ( MAKE-18PILE ?auto_800182 ?auto_800183 ?auto_800184 ?auto_800185 ?auto_800186 ?auto_800187 ?auto_800188 ?auto_800189 ?auto_800190 ?auto_800191 ?auto_800192 ?auto_800193 ?auto_800194 ?auto_800195 ?auto_800196 ?auto_800197 ?auto_800198 ?auto_800199 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800218 - BLOCK
      ?auto_800219 - BLOCK
      ?auto_800220 - BLOCK
      ?auto_800221 - BLOCK
      ?auto_800222 - BLOCK
      ?auto_800223 - BLOCK
      ?auto_800224 - BLOCK
      ?auto_800225 - BLOCK
      ?auto_800226 - BLOCK
      ?auto_800227 - BLOCK
      ?auto_800228 - BLOCK
      ?auto_800229 - BLOCK
      ?auto_800230 - BLOCK
      ?auto_800231 - BLOCK
      ?auto_800232 - BLOCK
      ?auto_800233 - BLOCK
      ?auto_800234 - BLOCK
      ?auto_800235 - BLOCK
    )
    :vars
    (
      ?auto_800236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_800235 ?auto_800236 ) ( ON-TABLE ?auto_800218 ) ( ON ?auto_800219 ?auto_800218 ) ( ON ?auto_800220 ?auto_800219 ) ( ON ?auto_800221 ?auto_800220 ) ( ON ?auto_800222 ?auto_800221 ) ( ON ?auto_800223 ?auto_800222 ) ( ON ?auto_800224 ?auto_800223 ) ( ON ?auto_800225 ?auto_800224 ) ( ON ?auto_800226 ?auto_800225 ) ( ON ?auto_800227 ?auto_800226 ) ( ON ?auto_800228 ?auto_800227 ) ( ON ?auto_800229 ?auto_800228 ) ( ON ?auto_800230 ?auto_800229 ) ( not ( = ?auto_800218 ?auto_800219 ) ) ( not ( = ?auto_800218 ?auto_800220 ) ) ( not ( = ?auto_800218 ?auto_800221 ) ) ( not ( = ?auto_800218 ?auto_800222 ) ) ( not ( = ?auto_800218 ?auto_800223 ) ) ( not ( = ?auto_800218 ?auto_800224 ) ) ( not ( = ?auto_800218 ?auto_800225 ) ) ( not ( = ?auto_800218 ?auto_800226 ) ) ( not ( = ?auto_800218 ?auto_800227 ) ) ( not ( = ?auto_800218 ?auto_800228 ) ) ( not ( = ?auto_800218 ?auto_800229 ) ) ( not ( = ?auto_800218 ?auto_800230 ) ) ( not ( = ?auto_800218 ?auto_800231 ) ) ( not ( = ?auto_800218 ?auto_800232 ) ) ( not ( = ?auto_800218 ?auto_800233 ) ) ( not ( = ?auto_800218 ?auto_800234 ) ) ( not ( = ?auto_800218 ?auto_800235 ) ) ( not ( = ?auto_800218 ?auto_800236 ) ) ( not ( = ?auto_800219 ?auto_800220 ) ) ( not ( = ?auto_800219 ?auto_800221 ) ) ( not ( = ?auto_800219 ?auto_800222 ) ) ( not ( = ?auto_800219 ?auto_800223 ) ) ( not ( = ?auto_800219 ?auto_800224 ) ) ( not ( = ?auto_800219 ?auto_800225 ) ) ( not ( = ?auto_800219 ?auto_800226 ) ) ( not ( = ?auto_800219 ?auto_800227 ) ) ( not ( = ?auto_800219 ?auto_800228 ) ) ( not ( = ?auto_800219 ?auto_800229 ) ) ( not ( = ?auto_800219 ?auto_800230 ) ) ( not ( = ?auto_800219 ?auto_800231 ) ) ( not ( = ?auto_800219 ?auto_800232 ) ) ( not ( = ?auto_800219 ?auto_800233 ) ) ( not ( = ?auto_800219 ?auto_800234 ) ) ( not ( = ?auto_800219 ?auto_800235 ) ) ( not ( = ?auto_800219 ?auto_800236 ) ) ( not ( = ?auto_800220 ?auto_800221 ) ) ( not ( = ?auto_800220 ?auto_800222 ) ) ( not ( = ?auto_800220 ?auto_800223 ) ) ( not ( = ?auto_800220 ?auto_800224 ) ) ( not ( = ?auto_800220 ?auto_800225 ) ) ( not ( = ?auto_800220 ?auto_800226 ) ) ( not ( = ?auto_800220 ?auto_800227 ) ) ( not ( = ?auto_800220 ?auto_800228 ) ) ( not ( = ?auto_800220 ?auto_800229 ) ) ( not ( = ?auto_800220 ?auto_800230 ) ) ( not ( = ?auto_800220 ?auto_800231 ) ) ( not ( = ?auto_800220 ?auto_800232 ) ) ( not ( = ?auto_800220 ?auto_800233 ) ) ( not ( = ?auto_800220 ?auto_800234 ) ) ( not ( = ?auto_800220 ?auto_800235 ) ) ( not ( = ?auto_800220 ?auto_800236 ) ) ( not ( = ?auto_800221 ?auto_800222 ) ) ( not ( = ?auto_800221 ?auto_800223 ) ) ( not ( = ?auto_800221 ?auto_800224 ) ) ( not ( = ?auto_800221 ?auto_800225 ) ) ( not ( = ?auto_800221 ?auto_800226 ) ) ( not ( = ?auto_800221 ?auto_800227 ) ) ( not ( = ?auto_800221 ?auto_800228 ) ) ( not ( = ?auto_800221 ?auto_800229 ) ) ( not ( = ?auto_800221 ?auto_800230 ) ) ( not ( = ?auto_800221 ?auto_800231 ) ) ( not ( = ?auto_800221 ?auto_800232 ) ) ( not ( = ?auto_800221 ?auto_800233 ) ) ( not ( = ?auto_800221 ?auto_800234 ) ) ( not ( = ?auto_800221 ?auto_800235 ) ) ( not ( = ?auto_800221 ?auto_800236 ) ) ( not ( = ?auto_800222 ?auto_800223 ) ) ( not ( = ?auto_800222 ?auto_800224 ) ) ( not ( = ?auto_800222 ?auto_800225 ) ) ( not ( = ?auto_800222 ?auto_800226 ) ) ( not ( = ?auto_800222 ?auto_800227 ) ) ( not ( = ?auto_800222 ?auto_800228 ) ) ( not ( = ?auto_800222 ?auto_800229 ) ) ( not ( = ?auto_800222 ?auto_800230 ) ) ( not ( = ?auto_800222 ?auto_800231 ) ) ( not ( = ?auto_800222 ?auto_800232 ) ) ( not ( = ?auto_800222 ?auto_800233 ) ) ( not ( = ?auto_800222 ?auto_800234 ) ) ( not ( = ?auto_800222 ?auto_800235 ) ) ( not ( = ?auto_800222 ?auto_800236 ) ) ( not ( = ?auto_800223 ?auto_800224 ) ) ( not ( = ?auto_800223 ?auto_800225 ) ) ( not ( = ?auto_800223 ?auto_800226 ) ) ( not ( = ?auto_800223 ?auto_800227 ) ) ( not ( = ?auto_800223 ?auto_800228 ) ) ( not ( = ?auto_800223 ?auto_800229 ) ) ( not ( = ?auto_800223 ?auto_800230 ) ) ( not ( = ?auto_800223 ?auto_800231 ) ) ( not ( = ?auto_800223 ?auto_800232 ) ) ( not ( = ?auto_800223 ?auto_800233 ) ) ( not ( = ?auto_800223 ?auto_800234 ) ) ( not ( = ?auto_800223 ?auto_800235 ) ) ( not ( = ?auto_800223 ?auto_800236 ) ) ( not ( = ?auto_800224 ?auto_800225 ) ) ( not ( = ?auto_800224 ?auto_800226 ) ) ( not ( = ?auto_800224 ?auto_800227 ) ) ( not ( = ?auto_800224 ?auto_800228 ) ) ( not ( = ?auto_800224 ?auto_800229 ) ) ( not ( = ?auto_800224 ?auto_800230 ) ) ( not ( = ?auto_800224 ?auto_800231 ) ) ( not ( = ?auto_800224 ?auto_800232 ) ) ( not ( = ?auto_800224 ?auto_800233 ) ) ( not ( = ?auto_800224 ?auto_800234 ) ) ( not ( = ?auto_800224 ?auto_800235 ) ) ( not ( = ?auto_800224 ?auto_800236 ) ) ( not ( = ?auto_800225 ?auto_800226 ) ) ( not ( = ?auto_800225 ?auto_800227 ) ) ( not ( = ?auto_800225 ?auto_800228 ) ) ( not ( = ?auto_800225 ?auto_800229 ) ) ( not ( = ?auto_800225 ?auto_800230 ) ) ( not ( = ?auto_800225 ?auto_800231 ) ) ( not ( = ?auto_800225 ?auto_800232 ) ) ( not ( = ?auto_800225 ?auto_800233 ) ) ( not ( = ?auto_800225 ?auto_800234 ) ) ( not ( = ?auto_800225 ?auto_800235 ) ) ( not ( = ?auto_800225 ?auto_800236 ) ) ( not ( = ?auto_800226 ?auto_800227 ) ) ( not ( = ?auto_800226 ?auto_800228 ) ) ( not ( = ?auto_800226 ?auto_800229 ) ) ( not ( = ?auto_800226 ?auto_800230 ) ) ( not ( = ?auto_800226 ?auto_800231 ) ) ( not ( = ?auto_800226 ?auto_800232 ) ) ( not ( = ?auto_800226 ?auto_800233 ) ) ( not ( = ?auto_800226 ?auto_800234 ) ) ( not ( = ?auto_800226 ?auto_800235 ) ) ( not ( = ?auto_800226 ?auto_800236 ) ) ( not ( = ?auto_800227 ?auto_800228 ) ) ( not ( = ?auto_800227 ?auto_800229 ) ) ( not ( = ?auto_800227 ?auto_800230 ) ) ( not ( = ?auto_800227 ?auto_800231 ) ) ( not ( = ?auto_800227 ?auto_800232 ) ) ( not ( = ?auto_800227 ?auto_800233 ) ) ( not ( = ?auto_800227 ?auto_800234 ) ) ( not ( = ?auto_800227 ?auto_800235 ) ) ( not ( = ?auto_800227 ?auto_800236 ) ) ( not ( = ?auto_800228 ?auto_800229 ) ) ( not ( = ?auto_800228 ?auto_800230 ) ) ( not ( = ?auto_800228 ?auto_800231 ) ) ( not ( = ?auto_800228 ?auto_800232 ) ) ( not ( = ?auto_800228 ?auto_800233 ) ) ( not ( = ?auto_800228 ?auto_800234 ) ) ( not ( = ?auto_800228 ?auto_800235 ) ) ( not ( = ?auto_800228 ?auto_800236 ) ) ( not ( = ?auto_800229 ?auto_800230 ) ) ( not ( = ?auto_800229 ?auto_800231 ) ) ( not ( = ?auto_800229 ?auto_800232 ) ) ( not ( = ?auto_800229 ?auto_800233 ) ) ( not ( = ?auto_800229 ?auto_800234 ) ) ( not ( = ?auto_800229 ?auto_800235 ) ) ( not ( = ?auto_800229 ?auto_800236 ) ) ( not ( = ?auto_800230 ?auto_800231 ) ) ( not ( = ?auto_800230 ?auto_800232 ) ) ( not ( = ?auto_800230 ?auto_800233 ) ) ( not ( = ?auto_800230 ?auto_800234 ) ) ( not ( = ?auto_800230 ?auto_800235 ) ) ( not ( = ?auto_800230 ?auto_800236 ) ) ( not ( = ?auto_800231 ?auto_800232 ) ) ( not ( = ?auto_800231 ?auto_800233 ) ) ( not ( = ?auto_800231 ?auto_800234 ) ) ( not ( = ?auto_800231 ?auto_800235 ) ) ( not ( = ?auto_800231 ?auto_800236 ) ) ( not ( = ?auto_800232 ?auto_800233 ) ) ( not ( = ?auto_800232 ?auto_800234 ) ) ( not ( = ?auto_800232 ?auto_800235 ) ) ( not ( = ?auto_800232 ?auto_800236 ) ) ( not ( = ?auto_800233 ?auto_800234 ) ) ( not ( = ?auto_800233 ?auto_800235 ) ) ( not ( = ?auto_800233 ?auto_800236 ) ) ( not ( = ?auto_800234 ?auto_800235 ) ) ( not ( = ?auto_800234 ?auto_800236 ) ) ( not ( = ?auto_800235 ?auto_800236 ) ) ( ON ?auto_800234 ?auto_800235 ) ( ON ?auto_800233 ?auto_800234 ) ( ON ?auto_800232 ?auto_800233 ) ( CLEAR ?auto_800230 ) ( ON ?auto_800231 ?auto_800232 ) ( CLEAR ?auto_800231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_800218 ?auto_800219 ?auto_800220 ?auto_800221 ?auto_800222 ?auto_800223 ?auto_800224 ?auto_800225 ?auto_800226 ?auto_800227 ?auto_800228 ?auto_800229 ?auto_800230 ?auto_800231 )
      ( MAKE-18PILE ?auto_800218 ?auto_800219 ?auto_800220 ?auto_800221 ?auto_800222 ?auto_800223 ?auto_800224 ?auto_800225 ?auto_800226 ?auto_800227 ?auto_800228 ?auto_800229 ?auto_800230 ?auto_800231 ?auto_800232 ?auto_800233 ?auto_800234 ?auto_800235 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800255 - BLOCK
      ?auto_800256 - BLOCK
      ?auto_800257 - BLOCK
      ?auto_800258 - BLOCK
      ?auto_800259 - BLOCK
      ?auto_800260 - BLOCK
      ?auto_800261 - BLOCK
      ?auto_800262 - BLOCK
      ?auto_800263 - BLOCK
      ?auto_800264 - BLOCK
      ?auto_800265 - BLOCK
      ?auto_800266 - BLOCK
      ?auto_800267 - BLOCK
      ?auto_800268 - BLOCK
      ?auto_800269 - BLOCK
      ?auto_800270 - BLOCK
      ?auto_800271 - BLOCK
      ?auto_800272 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_800272 ) ( ON-TABLE ?auto_800255 ) ( ON ?auto_800256 ?auto_800255 ) ( ON ?auto_800257 ?auto_800256 ) ( ON ?auto_800258 ?auto_800257 ) ( ON ?auto_800259 ?auto_800258 ) ( ON ?auto_800260 ?auto_800259 ) ( ON ?auto_800261 ?auto_800260 ) ( ON ?auto_800262 ?auto_800261 ) ( ON ?auto_800263 ?auto_800262 ) ( ON ?auto_800264 ?auto_800263 ) ( ON ?auto_800265 ?auto_800264 ) ( ON ?auto_800266 ?auto_800265 ) ( ON ?auto_800267 ?auto_800266 ) ( not ( = ?auto_800255 ?auto_800256 ) ) ( not ( = ?auto_800255 ?auto_800257 ) ) ( not ( = ?auto_800255 ?auto_800258 ) ) ( not ( = ?auto_800255 ?auto_800259 ) ) ( not ( = ?auto_800255 ?auto_800260 ) ) ( not ( = ?auto_800255 ?auto_800261 ) ) ( not ( = ?auto_800255 ?auto_800262 ) ) ( not ( = ?auto_800255 ?auto_800263 ) ) ( not ( = ?auto_800255 ?auto_800264 ) ) ( not ( = ?auto_800255 ?auto_800265 ) ) ( not ( = ?auto_800255 ?auto_800266 ) ) ( not ( = ?auto_800255 ?auto_800267 ) ) ( not ( = ?auto_800255 ?auto_800268 ) ) ( not ( = ?auto_800255 ?auto_800269 ) ) ( not ( = ?auto_800255 ?auto_800270 ) ) ( not ( = ?auto_800255 ?auto_800271 ) ) ( not ( = ?auto_800255 ?auto_800272 ) ) ( not ( = ?auto_800256 ?auto_800257 ) ) ( not ( = ?auto_800256 ?auto_800258 ) ) ( not ( = ?auto_800256 ?auto_800259 ) ) ( not ( = ?auto_800256 ?auto_800260 ) ) ( not ( = ?auto_800256 ?auto_800261 ) ) ( not ( = ?auto_800256 ?auto_800262 ) ) ( not ( = ?auto_800256 ?auto_800263 ) ) ( not ( = ?auto_800256 ?auto_800264 ) ) ( not ( = ?auto_800256 ?auto_800265 ) ) ( not ( = ?auto_800256 ?auto_800266 ) ) ( not ( = ?auto_800256 ?auto_800267 ) ) ( not ( = ?auto_800256 ?auto_800268 ) ) ( not ( = ?auto_800256 ?auto_800269 ) ) ( not ( = ?auto_800256 ?auto_800270 ) ) ( not ( = ?auto_800256 ?auto_800271 ) ) ( not ( = ?auto_800256 ?auto_800272 ) ) ( not ( = ?auto_800257 ?auto_800258 ) ) ( not ( = ?auto_800257 ?auto_800259 ) ) ( not ( = ?auto_800257 ?auto_800260 ) ) ( not ( = ?auto_800257 ?auto_800261 ) ) ( not ( = ?auto_800257 ?auto_800262 ) ) ( not ( = ?auto_800257 ?auto_800263 ) ) ( not ( = ?auto_800257 ?auto_800264 ) ) ( not ( = ?auto_800257 ?auto_800265 ) ) ( not ( = ?auto_800257 ?auto_800266 ) ) ( not ( = ?auto_800257 ?auto_800267 ) ) ( not ( = ?auto_800257 ?auto_800268 ) ) ( not ( = ?auto_800257 ?auto_800269 ) ) ( not ( = ?auto_800257 ?auto_800270 ) ) ( not ( = ?auto_800257 ?auto_800271 ) ) ( not ( = ?auto_800257 ?auto_800272 ) ) ( not ( = ?auto_800258 ?auto_800259 ) ) ( not ( = ?auto_800258 ?auto_800260 ) ) ( not ( = ?auto_800258 ?auto_800261 ) ) ( not ( = ?auto_800258 ?auto_800262 ) ) ( not ( = ?auto_800258 ?auto_800263 ) ) ( not ( = ?auto_800258 ?auto_800264 ) ) ( not ( = ?auto_800258 ?auto_800265 ) ) ( not ( = ?auto_800258 ?auto_800266 ) ) ( not ( = ?auto_800258 ?auto_800267 ) ) ( not ( = ?auto_800258 ?auto_800268 ) ) ( not ( = ?auto_800258 ?auto_800269 ) ) ( not ( = ?auto_800258 ?auto_800270 ) ) ( not ( = ?auto_800258 ?auto_800271 ) ) ( not ( = ?auto_800258 ?auto_800272 ) ) ( not ( = ?auto_800259 ?auto_800260 ) ) ( not ( = ?auto_800259 ?auto_800261 ) ) ( not ( = ?auto_800259 ?auto_800262 ) ) ( not ( = ?auto_800259 ?auto_800263 ) ) ( not ( = ?auto_800259 ?auto_800264 ) ) ( not ( = ?auto_800259 ?auto_800265 ) ) ( not ( = ?auto_800259 ?auto_800266 ) ) ( not ( = ?auto_800259 ?auto_800267 ) ) ( not ( = ?auto_800259 ?auto_800268 ) ) ( not ( = ?auto_800259 ?auto_800269 ) ) ( not ( = ?auto_800259 ?auto_800270 ) ) ( not ( = ?auto_800259 ?auto_800271 ) ) ( not ( = ?auto_800259 ?auto_800272 ) ) ( not ( = ?auto_800260 ?auto_800261 ) ) ( not ( = ?auto_800260 ?auto_800262 ) ) ( not ( = ?auto_800260 ?auto_800263 ) ) ( not ( = ?auto_800260 ?auto_800264 ) ) ( not ( = ?auto_800260 ?auto_800265 ) ) ( not ( = ?auto_800260 ?auto_800266 ) ) ( not ( = ?auto_800260 ?auto_800267 ) ) ( not ( = ?auto_800260 ?auto_800268 ) ) ( not ( = ?auto_800260 ?auto_800269 ) ) ( not ( = ?auto_800260 ?auto_800270 ) ) ( not ( = ?auto_800260 ?auto_800271 ) ) ( not ( = ?auto_800260 ?auto_800272 ) ) ( not ( = ?auto_800261 ?auto_800262 ) ) ( not ( = ?auto_800261 ?auto_800263 ) ) ( not ( = ?auto_800261 ?auto_800264 ) ) ( not ( = ?auto_800261 ?auto_800265 ) ) ( not ( = ?auto_800261 ?auto_800266 ) ) ( not ( = ?auto_800261 ?auto_800267 ) ) ( not ( = ?auto_800261 ?auto_800268 ) ) ( not ( = ?auto_800261 ?auto_800269 ) ) ( not ( = ?auto_800261 ?auto_800270 ) ) ( not ( = ?auto_800261 ?auto_800271 ) ) ( not ( = ?auto_800261 ?auto_800272 ) ) ( not ( = ?auto_800262 ?auto_800263 ) ) ( not ( = ?auto_800262 ?auto_800264 ) ) ( not ( = ?auto_800262 ?auto_800265 ) ) ( not ( = ?auto_800262 ?auto_800266 ) ) ( not ( = ?auto_800262 ?auto_800267 ) ) ( not ( = ?auto_800262 ?auto_800268 ) ) ( not ( = ?auto_800262 ?auto_800269 ) ) ( not ( = ?auto_800262 ?auto_800270 ) ) ( not ( = ?auto_800262 ?auto_800271 ) ) ( not ( = ?auto_800262 ?auto_800272 ) ) ( not ( = ?auto_800263 ?auto_800264 ) ) ( not ( = ?auto_800263 ?auto_800265 ) ) ( not ( = ?auto_800263 ?auto_800266 ) ) ( not ( = ?auto_800263 ?auto_800267 ) ) ( not ( = ?auto_800263 ?auto_800268 ) ) ( not ( = ?auto_800263 ?auto_800269 ) ) ( not ( = ?auto_800263 ?auto_800270 ) ) ( not ( = ?auto_800263 ?auto_800271 ) ) ( not ( = ?auto_800263 ?auto_800272 ) ) ( not ( = ?auto_800264 ?auto_800265 ) ) ( not ( = ?auto_800264 ?auto_800266 ) ) ( not ( = ?auto_800264 ?auto_800267 ) ) ( not ( = ?auto_800264 ?auto_800268 ) ) ( not ( = ?auto_800264 ?auto_800269 ) ) ( not ( = ?auto_800264 ?auto_800270 ) ) ( not ( = ?auto_800264 ?auto_800271 ) ) ( not ( = ?auto_800264 ?auto_800272 ) ) ( not ( = ?auto_800265 ?auto_800266 ) ) ( not ( = ?auto_800265 ?auto_800267 ) ) ( not ( = ?auto_800265 ?auto_800268 ) ) ( not ( = ?auto_800265 ?auto_800269 ) ) ( not ( = ?auto_800265 ?auto_800270 ) ) ( not ( = ?auto_800265 ?auto_800271 ) ) ( not ( = ?auto_800265 ?auto_800272 ) ) ( not ( = ?auto_800266 ?auto_800267 ) ) ( not ( = ?auto_800266 ?auto_800268 ) ) ( not ( = ?auto_800266 ?auto_800269 ) ) ( not ( = ?auto_800266 ?auto_800270 ) ) ( not ( = ?auto_800266 ?auto_800271 ) ) ( not ( = ?auto_800266 ?auto_800272 ) ) ( not ( = ?auto_800267 ?auto_800268 ) ) ( not ( = ?auto_800267 ?auto_800269 ) ) ( not ( = ?auto_800267 ?auto_800270 ) ) ( not ( = ?auto_800267 ?auto_800271 ) ) ( not ( = ?auto_800267 ?auto_800272 ) ) ( not ( = ?auto_800268 ?auto_800269 ) ) ( not ( = ?auto_800268 ?auto_800270 ) ) ( not ( = ?auto_800268 ?auto_800271 ) ) ( not ( = ?auto_800268 ?auto_800272 ) ) ( not ( = ?auto_800269 ?auto_800270 ) ) ( not ( = ?auto_800269 ?auto_800271 ) ) ( not ( = ?auto_800269 ?auto_800272 ) ) ( not ( = ?auto_800270 ?auto_800271 ) ) ( not ( = ?auto_800270 ?auto_800272 ) ) ( not ( = ?auto_800271 ?auto_800272 ) ) ( ON ?auto_800271 ?auto_800272 ) ( ON ?auto_800270 ?auto_800271 ) ( ON ?auto_800269 ?auto_800270 ) ( CLEAR ?auto_800267 ) ( ON ?auto_800268 ?auto_800269 ) ( CLEAR ?auto_800268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_800255 ?auto_800256 ?auto_800257 ?auto_800258 ?auto_800259 ?auto_800260 ?auto_800261 ?auto_800262 ?auto_800263 ?auto_800264 ?auto_800265 ?auto_800266 ?auto_800267 ?auto_800268 )
      ( MAKE-18PILE ?auto_800255 ?auto_800256 ?auto_800257 ?auto_800258 ?auto_800259 ?auto_800260 ?auto_800261 ?auto_800262 ?auto_800263 ?auto_800264 ?auto_800265 ?auto_800266 ?auto_800267 ?auto_800268 ?auto_800269 ?auto_800270 ?auto_800271 ?auto_800272 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800291 - BLOCK
      ?auto_800292 - BLOCK
      ?auto_800293 - BLOCK
      ?auto_800294 - BLOCK
      ?auto_800295 - BLOCK
      ?auto_800296 - BLOCK
      ?auto_800297 - BLOCK
      ?auto_800298 - BLOCK
      ?auto_800299 - BLOCK
      ?auto_800300 - BLOCK
      ?auto_800301 - BLOCK
      ?auto_800302 - BLOCK
      ?auto_800303 - BLOCK
      ?auto_800304 - BLOCK
      ?auto_800305 - BLOCK
      ?auto_800306 - BLOCK
      ?auto_800307 - BLOCK
      ?auto_800308 - BLOCK
    )
    :vars
    (
      ?auto_800309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_800308 ?auto_800309 ) ( ON-TABLE ?auto_800291 ) ( ON ?auto_800292 ?auto_800291 ) ( ON ?auto_800293 ?auto_800292 ) ( ON ?auto_800294 ?auto_800293 ) ( ON ?auto_800295 ?auto_800294 ) ( ON ?auto_800296 ?auto_800295 ) ( ON ?auto_800297 ?auto_800296 ) ( ON ?auto_800298 ?auto_800297 ) ( ON ?auto_800299 ?auto_800298 ) ( ON ?auto_800300 ?auto_800299 ) ( ON ?auto_800301 ?auto_800300 ) ( ON ?auto_800302 ?auto_800301 ) ( not ( = ?auto_800291 ?auto_800292 ) ) ( not ( = ?auto_800291 ?auto_800293 ) ) ( not ( = ?auto_800291 ?auto_800294 ) ) ( not ( = ?auto_800291 ?auto_800295 ) ) ( not ( = ?auto_800291 ?auto_800296 ) ) ( not ( = ?auto_800291 ?auto_800297 ) ) ( not ( = ?auto_800291 ?auto_800298 ) ) ( not ( = ?auto_800291 ?auto_800299 ) ) ( not ( = ?auto_800291 ?auto_800300 ) ) ( not ( = ?auto_800291 ?auto_800301 ) ) ( not ( = ?auto_800291 ?auto_800302 ) ) ( not ( = ?auto_800291 ?auto_800303 ) ) ( not ( = ?auto_800291 ?auto_800304 ) ) ( not ( = ?auto_800291 ?auto_800305 ) ) ( not ( = ?auto_800291 ?auto_800306 ) ) ( not ( = ?auto_800291 ?auto_800307 ) ) ( not ( = ?auto_800291 ?auto_800308 ) ) ( not ( = ?auto_800291 ?auto_800309 ) ) ( not ( = ?auto_800292 ?auto_800293 ) ) ( not ( = ?auto_800292 ?auto_800294 ) ) ( not ( = ?auto_800292 ?auto_800295 ) ) ( not ( = ?auto_800292 ?auto_800296 ) ) ( not ( = ?auto_800292 ?auto_800297 ) ) ( not ( = ?auto_800292 ?auto_800298 ) ) ( not ( = ?auto_800292 ?auto_800299 ) ) ( not ( = ?auto_800292 ?auto_800300 ) ) ( not ( = ?auto_800292 ?auto_800301 ) ) ( not ( = ?auto_800292 ?auto_800302 ) ) ( not ( = ?auto_800292 ?auto_800303 ) ) ( not ( = ?auto_800292 ?auto_800304 ) ) ( not ( = ?auto_800292 ?auto_800305 ) ) ( not ( = ?auto_800292 ?auto_800306 ) ) ( not ( = ?auto_800292 ?auto_800307 ) ) ( not ( = ?auto_800292 ?auto_800308 ) ) ( not ( = ?auto_800292 ?auto_800309 ) ) ( not ( = ?auto_800293 ?auto_800294 ) ) ( not ( = ?auto_800293 ?auto_800295 ) ) ( not ( = ?auto_800293 ?auto_800296 ) ) ( not ( = ?auto_800293 ?auto_800297 ) ) ( not ( = ?auto_800293 ?auto_800298 ) ) ( not ( = ?auto_800293 ?auto_800299 ) ) ( not ( = ?auto_800293 ?auto_800300 ) ) ( not ( = ?auto_800293 ?auto_800301 ) ) ( not ( = ?auto_800293 ?auto_800302 ) ) ( not ( = ?auto_800293 ?auto_800303 ) ) ( not ( = ?auto_800293 ?auto_800304 ) ) ( not ( = ?auto_800293 ?auto_800305 ) ) ( not ( = ?auto_800293 ?auto_800306 ) ) ( not ( = ?auto_800293 ?auto_800307 ) ) ( not ( = ?auto_800293 ?auto_800308 ) ) ( not ( = ?auto_800293 ?auto_800309 ) ) ( not ( = ?auto_800294 ?auto_800295 ) ) ( not ( = ?auto_800294 ?auto_800296 ) ) ( not ( = ?auto_800294 ?auto_800297 ) ) ( not ( = ?auto_800294 ?auto_800298 ) ) ( not ( = ?auto_800294 ?auto_800299 ) ) ( not ( = ?auto_800294 ?auto_800300 ) ) ( not ( = ?auto_800294 ?auto_800301 ) ) ( not ( = ?auto_800294 ?auto_800302 ) ) ( not ( = ?auto_800294 ?auto_800303 ) ) ( not ( = ?auto_800294 ?auto_800304 ) ) ( not ( = ?auto_800294 ?auto_800305 ) ) ( not ( = ?auto_800294 ?auto_800306 ) ) ( not ( = ?auto_800294 ?auto_800307 ) ) ( not ( = ?auto_800294 ?auto_800308 ) ) ( not ( = ?auto_800294 ?auto_800309 ) ) ( not ( = ?auto_800295 ?auto_800296 ) ) ( not ( = ?auto_800295 ?auto_800297 ) ) ( not ( = ?auto_800295 ?auto_800298 ) ) ( not ( = ?auto_800295 ?auto_800299 ) ) ( not ( = ?auto_800295 ?auto_800300 ) ) ( not ( = ?auto_800295 ?auto_800301 ) ) ( not ( = ?auto_800295 ?auto_800302 ) ) ( not ( = ?auto_800295 ?auto_800303 ) ) ( not ( = ?auto_800295 ?auto_800304 ) ) ( not ( = ?auto_800295 ?auto_800305 ) ) ( not ( = ?auto_800295 ?auto_800306 ) ) ( not ( = ?auto_800295 ?auto_800307 ) ) ( not ( = ?auto_800295 ?auto_800308 ) ) ( not ( = ?auto_800295 ?auto_800309 ) ) ( not ( = ?auto_800296 ?auto_800297 ) ) ( not ( = ?auto_800296 ?auto_800298 ) ) ( not ( = ?auto_800296 ?auto_800299 ) ) ( not ( = ?auto_800296 ?auto_800300 ) ) ( not ( = ?auto_800296 ?auto_800301 ) ) ( not ( = ?auto_800296 ?auto_800302 ) ) ( not ( = ?auto_800296 ?auto_800303 ) ) ( not ( = ?auto_800296 ?auto_800304 ) ) ( not ( = ?auto_800296 ?auto_800305 ) ) ( not ( = ?auto_800296 ?auto_800306 ) ) ( not ( = ?auto_800296 ?auto_800307 ) ) ( not ( = ?auto_800296 ?auto_800308 ) ) ( not ( = ?auto_800296 ?auto_800309 ) ) ( not ( = ?auto_800297 ?auto_800298 ) ) ( not ( = ?auto_800297 ?auto_800299 ) ) ( not ( = ?auto_800297 ?auto_800300 ) ) ( not ( = ?auto_800297 ?auto_800301 ) ) ( not ( = ?auto_800297 ?auto_800302 ) ) ( not ( = ?auto_800297 ?auto_800303 ) ) ( not ( = ?auto_800297 ?auto_800304 ) ) ( not ( = ?auto_800297 ?auto_800305 ) ) ( not ( = ?auto_800297 ?auto_800306 ) ) ( not ( = ?auto_800297 ?auto_800307 ) ) ( not ( = ?auto_800297 ?auto_800308 ) ) ( not ( = ?auto_800297 ?auto_800309 ) ) ( not ( = ?auto_800298 ?auto_800299 ) ) ( not ( = ?auto_800298 ?auto_800300 ) ) ( not ( = ?auto_800298 ?auto_800301 ) ) ( not ( = ?auto_800298 ?auto_800302 ) ) ( not ( = ?auto_800298 ?auto_800303 ) ) ( not ( = ?auto_800298 ?auto_800304 ) ) ( not ( = ?auto_800298 ?auto_800305 ) ) ( not ( = ?auto_800298 ?auto_800306 ) ) ( not ( = ?auto_800298 ?auto_800307 ) ) ( not ( = ?auto_800298 ?auto_800308 ) ) ( not ( = ?auto_800298 ?auto_800309 ) ) ( not ( = ?auto_800299 ?auto_800300 ) ) ( not ( = ?auto_800299 ?auto_800301 ) ) ( not ( = ?auto_800299 ?auto_800302 ) ) ( not ( = ?auto_800299 ?auto_800303 ) ) ( not ( = ?auto_800299 ?auto_800304 ) ) ( not ( = ?auto_800299 ?auto_800305 ) ) ( not ( = ?auto_800299 ?auto_800306 ) ) ( not ( = ?auto_800299 ?auto_800307 ) ) ( not ( = ?auto_800299 ?auto_800308 ) ) ( not ( = ?auto_800299 ?auto_800309 ) ) ( not ( = ?auto_800300 ?auto_800301 ) ) ( not ( = ?auto_800300 ?auto_800302 ) ) ( not ( = ?auto_800300 ?auto_800303 ) ) ( not ( = ?auto_800300 ?auto_800304 ) ) ( not ( = ?auto_800300 ?auto_800305 ) ) ( not ( = ?auto_800300 ?auto_800306 ) ) ( not ( = ?auto_800300 ?auto_800307 ) ) ( not ( = ?auto_800300 ?auto_800308 ) ) ( not ( = ?auto_800300 ?auto_800309 ) ) ( not ( = ?auto_800301 ?auto_800302 ) ) ( not ( = ?auto_800301 ?auto_800303 ) ) ( not ( = ?auto_800301 ?auto_800304 ) ) ( not ( = ?auto_800301 ?auto_800305 ) ) ( not ( = ?auto_800301 ?auto_800306 ) ) ( not ( = ?auto_800301 ?auto_800307 ) ) ( not ( = ?auto_800301 ?auto_800308 ) ) ( not ( = ?auto_800301 ?auto_800309 ) ) ( not ( = ?auto_800302 ?auto_800303 ) ) ( not ( = ?auto_800302 ?auto_800304 ) ) ( not ( = ?auto_800302 ?auto_800305 ) ) ( not ( = ?auto_800302 ?auto_800306 ) ) ( not ( = ?auto_800302 ?auto_800307 ) ) ( not ( = ?auto_800302 ?auto_800308 ) ) ( not ( = ?auto_800302 ?auto_800309 ) ) ( not ( = ?auto_800303 ?auto_800304 ) ) ( not ( = ?auto_800303 ?auto_800305 ) ) ( not ( = ?auto_800303 ?auto_800306 ) ) ( not ( = ?auto_800303 ?auto_800307 ) ) ( not ( = ?auto_800303 ?auto_800308 ) ) ( not ( = ?auto_800303 ?auto_800309 ) ) ( not ( = ?auto_800304 ?auto_800305 ) ) ( not ( = ?auto_800304 ?auto_800306 ) ) ( not ( = ?auto_800304 ?auto_800307 ) ) ( not ( = ?auto_800304 ?auto_800308 ) ) ( not ( = ?auto_800304 ?auto_800309 ) ) ( not ( = ?auto_800305 ?auto_800306 ) ) ( not ( = ?auto_800305 ?auto_800307 ) ) ( not ( = ?auto_800305 ?auto_800308 ) ) ( not ( = ?auto_800305 ?auto_800309 ) ) ( not ( = ?auto_800306 ?auto_800307 ) ) ( not ( = ?auto_800306 ?auto_800308 ) ) ( not ( = ?auto_800306 ?auto_800309 ) ) ( not ( = ?auto_800307 ?auto_800308 ) ) ( not ( = ?auto_800307 ?auto_800309 ) ) ( not ( = ?auto_800308 ?auto_800309 ) ) ( ON ?auto_800307 ?auto_800308 ) ( ON ?auto_800306 ?auto_800307 ) ( ON ?auto_800305 ?auto_800306 ) ( ON ?auto_800304 ?auto_800305 ) ( CLEAR ?auto_800302 ) ( ON ?auto_800303 ?auto_800304 ) ( CLEAR ?auto_800303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_800291 ?auto_800292 ?auto_800293 ?auto_800294 ?auto_800295 ?auto_800296 ?auto_800297 ?auto_800298 ?auto_800299 ?auto_800300 ?auto_800301 ?auto_800302 ?auto_800303 )
      ( MAKE-18PILE ?auto_800291 ?auto_800292 ?auto_800293 ?auto_800294 ?auto_800295 ?auto_800296 ?auto_800297 ?auto_800298 ?auto_800299 ?auto_800300 ?auto_800301 ?auto_800302 ?auto_800303 ?auto_800304 ?auto_800305 ?auto_800306 ?auto_800307 ?auto_800308 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800328 - BLOCK
      ?auto_800329 - BLOCK
      ?auto_800330 - BLOCK
      ?auto_800331 - BLOCK
      ?auto_800332 - BLOCK
      ?auto_800333 - BLOCK
      ?auto_800334 - BLOCK
      ?auto_800335 - BLOCK
      ?auto_800336 - BLOCK
      ?auto_800337 - BLOCK
      ?auto_800338 - BLOCK
      ?auto_800339 - BLOCK
      ?auto_800340 - BLOCK
      ?auto_800341 - BLOCK
      ?auto_800342 - BLOCK
      ?auto_800343 - BLOCK
      ?auto_800344 - BLOCK
      ?auto_800345 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_800345 ) ( ON-TABLE ?auto_800328 ) ( ON ?auto_800329 ?auto_800328 ) ( ON ?auto_800330 ?auto_800329 ) ( ON ?auto_800331 ?auto_800330 ) ( ON ?auto_800332 ?auto_800331 ) ( ON ?auto_800333 ?auto_800332 ) ( ON ?auto_800334 ?auto_800333 ) ( ON ?auto_800335 ?auto_800334 ) ( ON ?auto_800336 ?auto_800335 ) ( ON ?auto_800337 ?auto_800336 ) ( ON ?auto_800338 ?auto_800337 ) ( ON ?auto_800339 ?auto_800338 ) ( not ( = ?auto_800328 ?auto_800329 ) ) ( not ( = ?auto_800328 ?auto_800330 ) ) ( not ( = ?auto_800328 ?auto_800331 ) ) ( not ( = ?auto_800328 ?auto_800332 ) ) ( not ( = ?auto_800328 ?auto_800333 ) ) ( not ( = ?auto_800328 ?auto_800334 ) ) ( not ( = ?auto_800328 ?auto_800335 ) ) ( not ( = ?auto_800328 ?auto_800336 ) ) ( not ( = ?auto_800328 ?auto_800337 ) ) ( not ( = ?auto_800328 ?auto_800338 ) ) ( not ( = ?auto_800328 ?auto_800339 ) ) ( not ( = ?auto_800328 ?auto_800340 ) ) ( not ( = ?auto_800328 ?auto_800341 ) ) ( not ( = ?auto_800328 ?auto_800342 ) ) ( not ( = ?auto_800328 ?auto_800343 ) ) ( not ( = ?auto_800328 ?auto_800344 ) ) ( not ( = ?auto_800328 ?auto_800345 ) ) ( not ( = ?auto_800329 ?auto_800330 ) ) ( not ( = ?auto_800329 ?auto_800331 ) ) ( not ( = ?auto_800329 ?auto_800332 ) ) ( not ( = ?auto_800329 ?auto_800333 ) ) ( not ( = ?auto_800329 ?auto_800334 ) ) ( not ( = ?auto_800329 ?auto_800335 ) ) ( not ( = ?auto_800329 ?auto_800336 ) ) ( not ( = ?auto_800329 ?auto_800337 ) ) ( not ( = ?auto_800329 ?auto_800338 ) ) ( not ( = ?auto_800329 ?auto_800339 ) ) ( not ( = ?auto_800329 ?auto_800340 ) ) ( not ( = ?auto_800329 ?auto_800341 ) ) ( not ( = ?auto_800329 ?auto_800342 ) ) ( not ( = ?auto_800329 ?auto_800343 ) ) ( not ( = ?auto_800329 ?auto_800344 ) ) ( not ( = ?auto_800329 ?auto_800345 ) ) ( not ( = ?auto_800330 ?auto_800331 ) ) ( not ( = ?auto_800330 ?auto_800332 ) ) ( not ( = ?auto_800330 ?auto_800333 ) ) ( not ( = ?auto_800330 ?auto_800334 ) ) ( not ( = ?auto_800330 ?auto_800335 ) ) ( not ( = ?auto_800330 ?auto_800336 ) ) ( not ( = ?auto_800330 ?auto_800337 ) ) ( not ( = ?auto_800330 ?auto_800338 ) ) ( not ( = ?auto_800330 ?auto_800339 ) ) ( not ( = ?auto_800330 ?auto_800340 ) ) ( not ( = ?auto_800330 ?auto_800341 ) ) ( not ( = ?auto_800330 ?auto_800342 ) ) ( not ( = ?auto_800330 ?auto_800343 ) ) ( not ( = ?auto_800330 ?auto_800344 ) ) ( not ( = ?auto_800330 ?auto_800345 ) ) ( not ( = ?auto_800331 ?auto_800332 ) ) ( not ( = ?auto_800331 ?auto_800333 ) ) ( not ( = ?auto_800331 ?auto_800334 ) ) ( not ( = ?auto_800331 ?auto_800335 ) ) ( not ( = ?auto_800331 ?auto_800336 ) ) ( not ( = ?auto_800331 ?auto_800337 ) ) ( not ( = ?auto_800331 ?auto_800338 ) ) ( not ( = ?auto_800331 ?auto_800339 ) ) ( not ( = ?auto_800331 ?auto_800340 ) ) ( not ( = ?auto_800331 ?auto_800341 ) ) ( not ( = ?auto_800331 ?auto_800342 ) ) ( not ( = ?auto_800331 ?auto_800343 ) ) ( not ( = ?auto_800331 ?auto_800344 ) ) ( not ( = ?auto_800331 ?auto_800345 ) ) ( not ( = ?auto_800332 ?auto_800333 ) ) ( not ( = ?auto_800332 ?auto_800334 ) ) ( not ( = ?auto_800332 ?auto_800335 ) ) ( not ( = ?auto_800332 ?auto_800336 ) ) ( not ( = ?auto_800332 ?auto_800337 ) ) ( not ( = ?auto_800332 ?auto_800338 ) ) ( not ( = ?auto_800332 ?auto_800339 ) ) ( not ( = ?auto_800332 ?auto_800340 ) ) ( not ( = ?auto_800332 ?auto_800341 ) ) ( not ( = ?auto_800332 ?auto_800342 ) ) ( not ( = ?auto_800332 ?auto_800343 ) ) ( not ( = ?auto_800332 ?auto_800344 ) ) ( not ( = ?auto_800332 ?auto_800345 ) ) ( not ( = ?auto_800333 ?auto_800334 ) ) ( not ( = ?auto_800333 ?auto_800335 ) ) ( not ( = ?auto_800333 ?auto_800336 ) ) ( not ( = ?auto_800333 ?auto_800337 ) ) ( not ( = ?auto_800333 ?auto_800338 ) ) ( not ( = ?auto_800333 ?auto_800339 ) ) ( not ( = ?auto_800333 ?auto_800340 ) ) ( not ( = ?auto_800333 ?auto_800341 ) ) ( not ( = ?auto_800333 ?auto_800342 ) ) ( not ( = ?auto_800333 ?auto_800343 ) ) ( not ( = ?auto_800333 ?auto_800344 ) ) ( not ( = ?auto_800333 ?auto_800345 ) ) ( not ( = ?auto_800334 ?auto_800335 ) ) ( not ( = ?auto_800334 ?auto_800336 ) ) ( not ( = ?auto_800334 ?auto_800337 ) ) ( not ( = ?auto_800334 ?auto_800338 ) ) ( not ( = ?auto_800334 ?auto_800339 ) ) ( not ( = ?auto_800334 ?auto_800340 ) ) ( not ( = ?auto_800334 ?auto_800341 ) ) ( not ( = ?auto_800334 ?auto_800342 ) ) ( not ( = ?auto_800334 ?auto_800343 ) ) ( not ( = ?auto_800334 ?auto_800344 ) ) ( not ( = ?auto_800334 ?auto_800345 ) ) ( not ( = ?auto_800335 ?auto_800336 ) ) ( not ( = ?auto_800335 ?auto_800337 ) ) ( not ( = ?auto_800335 ?auto_800338 ) ) ( not ( = ?auto_800335 ?auto_800339 ) ) ( not ( = ?auto_800335 ?auto_800340 ) ) ( not ( = ?auto_800335 ?auto_800341 ) ) ( not ( = ?auto_800335 ?auto_800342 ) ) ( not ( = ?auto_800335 ?auto_800343 ) ) ( not ( = ?auto_800335 ?auto_800344 ) ) ( not ( = ?auto_800335 ?auto_800345 ) ) ( not ( = ?auto_800336 ?auto_800337 ) ) ( not ( = ?auto_800336 ?auto_800338 ) ) ( not ( = ?auto_800336 ?auto_800339 ) ) ( not ( = ?auto_800336 ?auto_800340 ) ) ( not ( = ?auto_800336 ?auto_800341 ) ) ( not ( = ?auto_800336 ?auto_800342 ) ) ( not ( = ?auto_800336 ?auto_800343 ) ) ( not ( = ?auto_800336 ?auto_800344 ) ) ( not ( = ?auto_800336 ?auto_800345 ) ) ( not ( = ?auto_800337 ?auto_800338 ) ) ( not ( = ?auto_800337 ?auto_800339 ) ) ( not ( = ?auto_800337 ?auto_800340 ) ) ( not ( = ?auto_800337 ?auto_800341 ) ) ( not ( = ?auto_800337 ?auto_800342 ) ) ( not ( = ?auto_800337 ?auto_800343 ) ) ( not ( = ?auto_800337 ?auto_800344 ) ) ( not ( = ?auto_800337 ?auto_800345 ) ) ( not ( = ?auto_800338 ?auto_800339 ) ) ( not ( = ?auto_800338 ?auto_800340 ) ) ( not ( = ?auto_800338 ?auto_800341 ) ) ( not ( = ?auto_800338 ?auto_800342 ) ) ( not ( = ?auto_800338 ?auto_800343 ) ) ( not ( = ?auto_800338 ?auto_800344 ) ) ( not ( = ?auto_800338 ?auto_800345 ) ) ( not ( = ?auto_800339 ?auto_800340 ) ) ( not ( = ?auto_800339 ?auto_800341 ) ) ( not ( = ?auto_800339 ?auto_800342 ) ) ( not ( = ?auto_800339 ?auto_800343 ) ) ( not ( = ?auto_800339 ?auto_800344 ) ) ( not ( = ?auto_800339 ?auto_800345 ) ) ( not ( = ?auto_800340 ?auto_800341 ) ) ( not ( = ?auto_800340 ?auto_800342 ) ) ( not ( = ?auto_800340 ?auto_800343 ) ) ( not ( = ?auto_800340 ?auto_800344 ) ) ( not ( = ?auto_800340 ?auto_800345 ) ) ( not ( = ?auto_800341 ?auto_800342 ) ) ( not ( = ?auto_800341 ?auto_800343 ) ) ( not ( = ?auto_800341 ?auto_800344 ) ) ( not ( = ?auto_800341 ?auto_800345 ) ) ( not ( = ?auto_800342 ?auto_800343 ) ) ( not ( = ?auto_800342 ?auto_800344 ) ) ( not ( = ?auto_800342 ?auto_800345 ) ) ( not ( = ?auto_800343 ?auto_800344 ) ) ( not ( = ?auto_800343 ?auto_800345 ) ) ( not ( = ?auto_800344 ?auto_800345 ) ) ( ON ?auto_800344 ?auto_800345 ) ( ON ?auto_800343 ?auto_800344 ) ( ON ?auto_800342 ?auto_800343 ) ( ON ?auto_800341 ?auto_800342 ) ( CLEAR ?auto_800339 ) ( ON ?auto_800340 ?auto_800341 ) ( CLEAR ?auto_800340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_800328 ?auto_800329 ?auto_800330 ?auto_800331 ?auto_800332 ?auto_800333 ?auto_800334 ?auto_800335 ?auto_800336 ?auto_800337 ?auto_800338 ?auto_800339 ?auto_800340 )
      ( MAKE-18PILE ?auto_800328 ?auto_800329 ?auto_800330 ?auto_800331 ?auto_800332 ?auto_800333 ?auto_800334 ?auto_800335 ?auto_800336 ?auto_800337 ?auto_800338 ?auto_800339 ?auto_800340 ?auto_800341 ?auto_800342 ?auto_800343 ?auto_800344 ?auto_800345 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800364 - BLOCK
      ?auto_800365 - BLOCK
      ?auto_800366 - BLOCK
      ?auto_800367 - BLOCK
      ?auto_800368 - BLOCK
      ?auto_800369 - BLOCK
      ?auto_800370 - BLOCK
      ?auto_800371 - BLOCK
      ?auto_800372 - BLOCK
      ?auto_800373 - BLOCK
      ?auto_800374 - BLOCK
      ?auto_800375 - BLOCK
      ?auto_800376 - BLOCK
      ?auto_800377 - BLOCK
      ?auto_800378 - BLOCK
      ?auto_800379 - BLOCK
      ?auto_800380 - BLOCK
      ?auto_800381 - BLOCK
    )
    :vars
    (
      ?auto_800382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_800381 ?auto_800382 ) ( ON-TABLE ?auto_800364 ) ( ON ?auto_800365 ?auto_800364 ) ( ON ?auto_800366 ?auto_800365 ) ( ON ?auto_800367 ?auto_800366 ) ( ON ?auto_800368 ?auto_800367 ) ( ON ?auto_800369 ?auto_800368 ) ( ON ?auto_800370 ?auto_800369 ) ( ON ?auto_800371 ?auto_800370 ) ( ON ?auto_800372 ?auto_800371 ) ( ON ?auto_800373 ?auto_800372 ) ( ON ?auto_800374 ?auto_800373 ) ( not ( = ?auto_800364 ?auto_800365 ) ) ( not ( = ?auto_800364 ?auto_800366 ) ) ( not ( = ?auto_800364 ?auto_800367 ) ) ( not ( = ?auto_800364 ?auto_800368 ) ) ( not ( = ?auto_800364 ?auto_800369 ) ) ( not ( = ?auto_800364 ?auto_800370 ) ) ( not ( = ?auto_800364 ?auto_800371 ) ) ( not ( = ?auto_800364 ?auto_800372 ) ) ( not ( = ?auto_800364 ?auto_800373 ) ) ( not ( = ?auto_800364 ?auto_800374 ) ) ( not ( = ?auto_800364 ?auto_800375 ) ) ( not ( = ?auto_800364 ?auto_800376 ) ) ( not ( = ?auto_800364 ?auto_800377 ) ) ( not ( = ?auto_800364 ?auto_800378 ) ) ( not ( = ?auto_800364 ?auto_800379 ) ) ( not ( = ?auto_800364 ?auto_800380 ) ) ( not ( = ?auto_800364 ?auto_800381 ) ) ( not ( = ?auto_800364 ?auto_800382 ) ) ( not ( = ?auto_800365 ?auto_800366 ) ) ( not ( = ?auto_800365 ?auto_800367 ) ) ( not ( = ?auto_800365 ?auto_800368 ) ) ( not ( = ?auto_800365 ?auto_800369 ) ) ( not ( = ?auto_800365 ?auto_800370 ) ) ( not ( = ?auto_800365 ?auto_800371 ) ) ( not ( = ?auto_800365 ?auto_800372 ) ) ( not ( = ?auto_800365 ?auto_800373 ) ) ( not ( = ?auto_800365 ?auto_800374 ) ) ( not ( = ?auto_800365 ?auto_800375 ) ) ( not ( = ?auto_800365 ?auto_800376 ) ) ( not ( = ?auto_800365 ?auto_800377 ) ) ( not ( = ?auto_800365 ?auto_800378 ) ) ( not ( = ?auto_800365 ?auto_800379 ) ) ( not ( = ?auto_800365 ?auto_800380 ) ) ( not ( = ?auto_800365 ?auto_800381 ) ) ( not ( = ?auto_800365 ?auto_800382 ) ) ( not ( = ?auto_800366 ?auto_800367 ) ) ( not ( = ?auto_800366 ?auto_800368 ) ) ( not ( = ?auto_800366 ?auto_800369 ) ) ( not ( = ?auto_800366 ?auto_800370 ) ) ( not ( = ?auto_800366 ?auto_800371 ) ) ( not ( = ?auto_800366 ?auto_800372 ) ) ( not ( = ?auto_800366 ?auto_800373 ) ) ( not ( = ?auto_800366 ?auto_800374 ) ) ( not ( = ?auto_800366 ?auto_800375 ) ) ( not ( = ?auto_800366 ?auto_800376 ) ) ( not ( = ?auto_800366 ?auto_800377 ) ) ( not ( = ?auto_800366 ?auto_800378 ) ) ( not ( = ?auto_800366 ?auto_800379 ) ) ( not ( = ?auto_800366 ?auto_800380 ) ) ( not ( = ?auto_800366 ?auto_800381 ) ) ( not ( = ?auto_800366 ?auto_800382 ) ) ( not ( = ?auto_800367 ?auto_800368 ) ) ( not ( = ?auto_800367 ?auto_800369 ) ) ( not ( = ?auto_800367 ?auto_800370 ) ) ( not ( = ?auto_800367 ?auto_800371 ) ) ( not ( = ?auto_800367 ?auto_800372 ) ) ( not ( = ?auto_800367 ?auto_800373 ) ) ( not ( = ?auto_800367 ?auto_800374 ) ) ( not ( = ?auto_800367 ?auto_800375 ) ) ( not ( = ?auto_800367 ?auto_800376 ) ) ( not ( = ?auto_800367 ?auto_800377 ) ) ( not ( = ?auto_800367 ?auto_800378 ) ) ( not ( = ?auto_800367 ?auto_800379 ) ) ( not ( = ?auto_800367 ?auto_800380 ) ) ( not ( = ?auto_800367 ?auto_800381 ) ) ( not ( = ?auto_800367 ?auto_800382 ) ) ( not ( = ?auto_800368 ?auto_800369 ) ) ( not ( = ?auto_800368 ?auto_800370 ) ) ( not ( = ?auto_800368 ?auto_800371 ) ) ( not ( = ?auto_800368 ?auto_800372 ) ) ( not ( = ?auto_800368 ?auto_800373 ) ) ( not ( = ?auto_800368 ?auto_800374 ) ) ( not ( = ?auto_800368 ?auto_800375 ) ) ( not ( = ?auto_800368 ?auto_800376 ) ) ( not ( = ?auto_800368 ?auto_800377 ) ) ( not ( = ?auto_800368 ?auto_800378 ) ) ( not ( = ?auto_800368 ?auto_800379 ) ) ( not ( = ?auto_800368 ?auto_800380 ) ) ( not ( = ?auto_800368 ?auto_800381 ) ) ( not ( = ?auto_800368 ?auto_800382 ) ) ( not ( = ?auto_800369 ?auto_800370 ) ) ( not ( = ?auto_800369 ?auto_800371 ) ) ( not ( = ?auto_800369 ?auto_800372 ) ) ( not ( = ?auto_800369 ?auto_800373 ) ) ( not ( = ?auto_800369 ?auto_800374 ) ) ( not ( = ?auto_800369 ?auto_800375 ) ) ( not ( = ?auto_800369 ?auto_800376 ) ) ( not ( = ?auto_800369 ?auto_800377 ) ) ( not ( = ?auto_800369 ?auto_800378 ) ) ( not ( = ?auto_800369 ?auto_800379 ) ) ( not ( = ?auto_800369 ?auto_800380 ) ) ( not ( = ?auto_800369 ?auto_800381 ) ) ( not ( = ?auto_800369 ?auto_800382 ) ) ( not ( = ?auto_800370 ?auto_800371 ) ) ( not ( = ?auto_800370 ?auto_800372 ) ) ( not ( = ?auto_800370 ?auto_800373 ) ) ( not ( = ?auto_800370 ?auto_800374 ) ) ( not ( = ?auto_800370 ?auto_800375 ) ) ( not ( = ?auto_800370 ?auto_800376 ) ) ( not ( = ?auto_800370 ?auto_800377 ) ) ( not ( = ?auto_800370 ?auto_800378 ) ) ( not ( = ?auto_800370 ?auto_800379 ) ) ( not ( = ?auto_800370 ?auto_800380 ) ) ( not ( = ?auto_800370 ?auto_800381 ) ) ( not ( = ?auto_800370 ?auto_800382 ) ) ( not ( = ?auto_800371 ?auto_800372 ) ) ( not ( = ?auto_800371 ?auto_800373 ) ) ( not ( = ?auto_800371 ?auto_800374 ) ) ( not ( = ?auto_800371 ?auto_800375 ) ) ( not ( = ?auto_800371 ?auto_800376 ) ) ( not ( = ?auto_800371 ?auto_800377 ) ) ( not ( = ?auto_800371 ?auto_800378 ) ) ( not ( = ?auto_800371 ?auto_800379 ) ) ( not ( = ?auto_800371 ?auto_800380 ) ) ( not ( = ?auto_800371 ?auto_800381 ) ) ( not ( = ?auto_800371 ?auto_800382 ) ) ( not ( = ?auto_800372 ?auto_800373 ) ) ( not ( = ?auto_800372 ?auto_800374 ) ) ( not ( = ?auto_800372 ?auto_800375 ) ) ( not ( = ?auto_800372 ?auto_800376 ) ) ( not ( = ?auto_800372 ?auto_800377 ) ) ( not ( = ?auto_800372 ?auto_800378 ) ) ( not ( = ?auto_800372 ?auto_800379 ) ) ( not ( = ?auto_800372 ?auto_800380 ) ) ( not ( = ?auto_800372 ?auto_800381 ) ) ( not ( = ?auto_800372 ?auto_800382 ) ) ( not ( = ?auto_800373 ?auto_800374 ) ) ( not ( = ?auto_800373 ?auto_800375 ) ) ( not ( = ?auto_800373 ?auto_800376 ) ) ( not ( = ?auto_800373 ?auto_800377 ) ) ( not ( = ?auto_800373 ?auto_800378 ) ) ( not ( = ?auto_800373 ?auto_800379 ) ) ( not ( = ?auto_800373 ?auto_800380 ) ) ( not ( = ?auto_800373 ?auto_800381 ) ) ( not ( = ?auto_800373 ?auto_800382 ) ) ( not ( = ?auto_800374 ?auto_800375 ) ) ( not ( = ?auto_800374 ?auto_800376 ) ) ( not ( = ?auto_800374 ?auto_800377 ) ) ( not ( = ?auto_800374 ?auto_800378 ) ) ( not ( = ?auto_800374 ?auto_800379 ) ) ( not ( = ?auto_800374 ?auto_800380 ) ) ( not ( = ?auto_800374 ?auto_800381 ) ) ( not ( = ?auto_800374 ?auto_800382 ) ) ( not ( = ?auto_800375 ?auto_800376 ) ) ( not ( = ?auto_800375 ?auto_800377 ) ) ( not ( = ?auto_800375 ?auto_800378 ) ) ( not ( = ?auto_800375 ?auto_800379 ) ) ( not ( = ?auto_800375 ?auto_800380 ) ) ( not ( = ?auto_800375 ?auto_800381 ) ) ( not ( = ?auto_800375 ?auto_800382 ) ) ( not ( = ?auto_800376 ?auto_800377 ) ) ( not ( = ?auto_800376 ?auto_800378 ) ) ( not ( = ?auto_800376 ?auto_800379 ) ) ( not ( = ?auto_800376 ?auto_800380 ) ) ( not ( = ?auto_800376 ?auto_800381 ) ) ( not ( = ?auto_800376 ?auto_800382 ) ) ( not ( = ?auto_800377 ?auto_800378 ) ) ( not ( = ?auto_800377 ?auto_800379 ) ) ( not ( = ?auto_800377 ?auto_800380 ) ) ( not ( = ?auto_800377 ?auto_800381 ) ) ( not ( = ?auto_800377 ?auto_800382 ) ) ( not ( = ?auto_800378 ?auto_800379 ) ) ( not ( = ?auto_800378 ?auto_800380 ) ) ( not ( = ?auto_800378 ?auto_800381 ) ) ( not ( = ?auto_800378 ?auto_800382 ) ) ( not ( = ?auto_800379 ?auto_800380 ) ) ( not ( = ?auto_800379 ?auto_800381 ) ) ( not ( = ?auto_800379 ?auto_800382 ) ) ( not ( = ?auto_800380 ?auto_800381 ) ) ( not ( = ?auto_800380 ?auto_800382 ) ) ( not ( = ?auto_800381 ?auto_800382 ) ) ( ON ?auto_800380 ?auto_800381 ) ( ON ?auto_800379 ?auto_800380 ) ( ON ?auto_800378 ?auto_800379 ) ( ON ?auto_800377 ?auto_800378 ) ( ON ?auto_800376 ?auto_800377 ) ( CLEAR ?auto_800374 ) ( ON ?auto_800375 ?auto_800376 ) ( CLEAR ?auto_800375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_800364 ?auto_800365 ?auto_800366 ?auto_800367 ?auto_800368 ?auto_800369 ?auto_800370 ?auto_800371 ?auto_800372 ?auto_800373 ?auto_800374 ?auto_800375 )
      ( MAKE-18PILE ?auto_800364 ?auto_800365 ?auto_800366 ?auto_800367 ?auto_800368 ?auto_800369 ?auto_800370 ?auto_800371 ?auto_800372 ?auto_800373 ?auto_800374 ?auto_800375 ?auto_800376 ?auto_800377 ?auto_800378 ?auto_800379 ?auto_800380 ?auto_800381 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800401 - BLOCK
      ?auto_800402 - BLOCK
      ?auto_800403 - BLOCK
      ?auto_800404 - BLOCK
      ?auto_800405 - BLOCK
      ?auto_800406 - BLOCK
      ?auto_800407 - BLOCK
      ?auto_800408 - BLOCK
      ?auto_800409 - BLOCK
      ?auto_800410 - BLOCK
      ?auto_800411 - BLOCK
      ?auto_800412 - BLOCK
      ?auto_800413 - BLOCK
      ?auto_800414 - BLOCK
      ?auto_800415 - BLOCK
      ?auto_800416 - BLOCK
      ?auto_800417 - BLOCK
      ?auto_800418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_800418 ) ( ON-TABLE ?auto_800401 ) ( ON ?auto_800402 ?auto_800401 ) ( ON ?auto_800403 ?auto_800402 ) ( ON ?auto_800404 ?auto_800403 ) ( ON ?auto_800405 ?auto_800404 ) ( ON ?auto_800406 ?auto_800405 ) ( ON ?auto_800407 ?auto_800406 ) ( ON ?auto_800408 ?auto_800407 ) ( ON ?auto_800409 ?auto_800408 ) ( ON ?auto_800410 ?auto_800409 ) ( ON ?auto_800411 ?auto_800410 ) ( not ( = ?auto_800401 ?auto_800402 ) ) ( not ( = ?auto_800401 ?auto_800403 ) ) ( not ( = ?auto_800401 ?auto_800404 ) ) ( not ( = ?auto_800401 ?auto_800405 ) ) ( not ( = ?auto_800401 ?auto_800406 ) ) ( not ( = ?auto_800401 ?auto_800407 ) ) ( not ( = ?auto_800401 ?auto_800408 ) ) ( not ( = ?auto_800401 ?auto_800409 ) ) ( not ( = ?auto_800401 ?auto_800410 ) ) ( not ( = ?auto_800401 ?auto_800411 ) ) ( not ( = ?auto_800401 ?auto_800412 ) ) ( not ( = ?auto_800401 ?auto_800413 ) ) ( not ( = ?auto_800401 ?auto_800414 ) ) ( not ( = ?auto_800401 ?auto_800415 ) ) ( not ( = ?auto_800401 ?auto_800416 ) ) ( not ( = ?auto_800401 ?auto_800417 ) ) ( not ( = ?auto_800401 ?auto_800418 ) ) ( not ( = ?auto_800402 ?auto_800403 ) ) ( not ( = ?auto_800402 ?auto_800404 ) ) ( not ( = ?auto_800402 ?auto_800405 ) ) ( not ( = ?auto_800402 ?auto_800406 ) ) ( not ( = ?auto_800402 ?auto_800407 ) ) ( not ( = ?auto_800402 ?auto_800408 ) ) ( not ( = ?auto_800402 ?auto_800409 ) ) ( not ( = ?auto_800402 ?auto_800410 ) ) ( not ( = ?auto_800402 ?auto_800411 ) ) ( not ( = ?auto_800402 ?auto_800412 ) ) ( not ( = ?auto_800402 ?auto_800413 ) ) ( not ( = ?auto_800402 ?auto_800414 ) ) ( not ( = ?auto_800402 ?auto_800415 ) ) ( not ( = ?auto_800402 ?auto_800416 ) ) ( not ( = ?auto_800402 ?auto_800417 ) ) ( not ( = ?auto_800402 ?auto_800418 ) ) ( not ( = ?auto_800403 ?auto_800404 ) ) ( not ( = ?auto_800403 ?auto_800405 ) ) ( not ( = ?auto_800403 ?auto_800406 ) ) ( not ( = ?auto_800403 ?auto_800407 ) ) ( not ( = ?auto_800403 ?auto_800408 ) ) ( not ( = ?auto_800403 ?auto_800409 ) ) ( not ( = ?auto_800403 ?auto_800410 ) ) ( not ( = ?auto_800403 ?auto_800411 ) ) ( not ( = ?auto_800403 ?auto_800412 ) ) ( not ( = ?auto_800403 ?auto_800413 ) ) ( not ( = ?auto_800403 ?auto_800414 ) ) ( not ( = ?auto_800403 ?auto_800415 ) ) ( not ( = ?auto_800403 ?auto_800416 ) ) ( not ( = ?auto_800403 ?auto_800417 ) ) ( not ( = ?auto_800403 ?auto_800418 ) ) ( not ( = ?auto_800404 ?auto_800405 ) ) ( not ( = ?auto_800404 ?auto_800406 ) ) ( not ( = ?auto_800404 ?auto_800407 ) ) ( not ( = ?auto_800404 ?auto_800408 ) ) ( not ( = ?auto_800404 ?auto_800409 ) ) ( not ( = ?auto_800404 ?auto_800410 ) ) ( not ( = ?auto_800404 ?auto_800411 ) ) ( not ( = ?auto_800404 ?auto_800412 ) ) ( not ( = ?auto_800404 ?auto_800413 ) ) ( not ( = ?auto_800404 ?auto_800414 ) ) ( not ( = ?auto_800404 ?auto_800415 ) ) ( not ( = ?auto_800404 ?auto_800416 ) ) ( not ( = ?auto_800404 ?auto_800417 ) ) ( not ( = ?auto_800404 ?auto_800418 ) ) ( not ( = ?auto_800405 ?auto_800406 ) ) ( not ( = ?auto_800405 ?auto_800407 ) ) ( not ( = ?auto_800405 ?auto_800408 ) ) ( not ( = ?auto_800405 ?auto_800409 ) ) ( not ( = ?auto_800405 ?auto_800410 ) ) ( not ( = ?auto_800405 ?auto_800411 ) ) ( not ( = ?auto_800405 ?auto_800412 ) ) ( not ( = ?auto_800405 ?auto_800413 ) ) ( not ( = ?auto_800405 ?auto_800414 ) ) ( not ( = ?auto_800405 ?auto_800415 ) ) ( not ( = ?auto_800405 ?auto_800416 ) ) ( not ( = ?auto_800405 ?auto_800417 ) ) ( not ( = ?auto_800405 ?auto_800418 ) ) ( not ( = ?auto_800406 ?auto_800407 ) ) ( not ( = ?auto_800406 ?auto_800408 ) ) ( not ( = ?auto_800406 ?auto_800409 ) ) ( not ( = ?auto_800406 ?auto_800410 ) ) ( not ( = ?auto_800406 ?auto_800411 ) ) ( not ( = ?auto_800406 ?auto_800412 ) ) ( not ( = ?auto_800406 ?auto_800413 ) ) ( not ( = ?auto_800406 ?auto_800414 ) ) ( not ( = ?auto_800406 ?auto_800415 ) ) ( not ( = ?auto_800406 ?auto_800416 ) ) ( not ( = ?auto_800406 ?auto_800417 ) ) ( not ( = ?auto_800406 ?auto_800418 ) ) ( not ( = ?auto_800407 ?auto_800408 ) ) ( not ( = ?auto_800407 ?auto_800409 ) ) ( not ( = ?auto_800407 ?auto_800410 ) ) ( not ( = ?auto_800407 ?auto_800411 ) ) ( not ( = ?auto_800407 ?auto_800412 ) ) ( not ( = ?auto_800407 ?auto_800413 ) ) ( not ( = ?auto_800407 ?auto_800414 ) ) ( not ( = ?auto_800407 ?auto_800415 ) ) ( not ( = ?auto_800407 ?auto_800416 ) ) ( not ( = ?auto_800407 ?auto_800417 ) ) ( not ( = ?auto_800407 ?auto_800418 ) ) ( not ( = ?auto_800408 ?auto_800409 ) ) ( not ( = ?auto_800408 ?auto_800410 ) ) ( not ( = ?auto_800408 ?auto_800411 ) ) ( not ( = ?auto_800408 ?auto_800412 ) ) ( not ( = ?auto_800408 ?auto_800413 ) ) ( not ( = ?auto_800408 ?auto_800414 ) ) ( not ( = ?auto_800408 ?auto_800415 ) ) ( not ( = ?auto_800408 ?auto_800416 ) ) ( not ( = ?auto_800408 ?auto_800417 ) ) ( not ( = ?auto_800408 ?auto_800418 ) ) ( not ( = ?auto_800409 ?auto_800410 ) ) ( not ( = ?auto_800409 ?auto_800411 ) ) ( not ( = ?auto_800409 ?auto_800412 ) ) ( not ( = ?auto_800409 ?auto_800413 ) ) ( not ( = ?auto_800409 ?auto_800414 ) ) ( not ( = ?auto_800409 ?auto_800415 ) ) ( not ( = ?auto_800409 ?auto_800416 ) ) ( not ( = ?auto_800409 ?auto_800417 ) ) ( not ( = ?auto_800409 ?auto_800418 ) ) ( not ( = ?auto_800410 ?auto_800411 ) ) ( not ( = ?auto_800410 ?auto_800412 ) ) ( not ( = ?auto_800410 ?auto_800413 ) ) ( not ( = ?auto_800410 ?auto_800414 ) ) ( not ( = ?auto_800410 ?auto_800415 ) ) ( not ( = ?auto_800410 ?auto_800416 ) ) ( not ( = ?auto_800410 ?auto_800417 ) ) ( not ( = ?auto_800410 ?auto_800418 ) ) ( not ( = ?auto_800411 ?auto_800412 ) ) ( not ( = ?auto_800411 ?auto_800413 ) ) ( not ( = ?auto_800411 ?auto_800414 ) ) ( not ( = ?auto_800411 ?auto_800415 ) ) ( not ( = ?auto_800411 ?auto_800416 ) ) ( not ( = ?auto_800411 ?auto_800417 ) ) ( not ( = ?auto_800411 ?auto_800418 ) ) ( not ( = ?auto_800412 ?auto_800413 ) ) ( not ( = ?auto_800412 ?auto_800414 ) ) ( not ( = ?auto_800412 ?auto_800415 ) ) ( not ( = ?auto_800412 ?auto_800416 ) ) ( not ( = ?auto_800412 ?auto_800417 ) ) ( not ( = ?auto_800412 ?auto_800418 ) ) ( not ( = ?auto_800413 ?auto_800414 ) ) ( not ( = ?auto_800413 ?auto_800415 ) ) ( not ( = ?auto_800413 ?auto_800416 ) ) ( not ( = ?auto_800413 ?auto_800417 ) ) ( not ( = ?auto_800413 ?auto_800418 ) ) ( not ( = ?auto_800414 ?auto_800415 ) ) ( not ( = ?auto_800414 ?auto_800416 ) ) ( not ( = ?auto_800414 ?auto_800417 ) ) ( not ( = ?auto_800414 ?auto_800418 ) ) ( not ( = ?auto_800415 ?auto_800416 ) ) ( not ( = ?auto_800415 ?auto_800417 ) ) ( not ( = ?auto_800415 ?auto_800418 ) ) ( not ( = ?auto_800416 ?auto_800417 ) ) ( not ( = ?auto_800416 ?auto_800418 ) ) ( not ( = ?auto_800417 ?auto_800418 ) ) ( ON ?auto_800417 ?auto_800418 ) ( ON ?auto_800416 ?auto_800417 ) ( ON ?auto_800415 ?auto_800416 ) ( ON ?auto_800414 ?auto_800415 ) ( ON ?auto_800413 ?auto_800414 ) ( CLEAR ?auto_800411 ) ( ON ?auto_800412 ?auto_800413 ) ( CLEAR ?auto_800412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_800401 ?auto_800402 ?auto_800403 ?auto_800404 ?auto_800405 ?auto_800406 ?auto_800407 ?auto_800408 ?auto_800409 ?auto_800410 ?auto_800411 ?auto_800412 )
      ( MAKE-18PILE ?auto_800401 ?auto_800402 ?auto_800403 ?auto_800404 ?auto_800405 ?auto_800406 ?auto_800407 ?auto_800408 ?auto_800409 ?auto_800410 ?auto_800411 ?auto_800412 ?auto_800413 ?auto_800414 ?auto_800415 ?auto_800416 ?auto_800417 ?auto_800418 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800437 - BLOCK
      ?auto_800438 - BLOCK
      ?auto_800439 - BLOCK
      ?auto_800440 - BLOCK
      ?auto_800441 - BLOCK
      ?auto_800442 - BLOCK
      ?auto_800443 - BLOCK
      ?auto_800444 - BLOCK
      ?auto_800445 - BLOCK
      ?auto_800446 - BLOCK
      ?auto_800447 - BLOCK
      ?auto_800448 - BLOCK
      ?auto_800449 - BLOCK
      ?auto_800450 - BLOCK
      ?auto_800451 - BLOCK
      ?auto_800452 - BLOCK
      ?auto_800453 - BLOCK
      ?auto_800454 - BLOCK
    )
    :vars
    (
      ?auto_800455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_800454 ?auto_800455 ) ( ON-TABLE ?auto_800437 ) ( ON ?auto_800438 ?auto_800437 ) ( ON ?auto_800439 ?auto_800438 ) ( ON ?auto_800440 ?auto_800439 ) ( ON ?auto_800441 ?auto_800440 ) ( ON ?auto_800442 ?auto_800441 ) ( ON ?auto_800443 ?auto_800442 ) ( ON ?auto_800444 ?auto_800443 ) ( ON ?auto_800445 ?auto_800444 ) ( ON ?auto_800446 ?auto_800445 ) ( not ( = ?auto_800437 ?auto_800438 ) ) ( not ( = ?auto_800437 ?auto_800439 ) ) ( not ( = ?auto_800437 ?auto_800440 ) ) ( not ( = ?auto_800437 ?auto_800441 ) ) ( not ( = ?auto_800437 ?auto_800442 ) ) ( not ( = ?auto_800437 ?auto_800443 ) ) ( not ( = ?auto_800437 ?auto_800444 ) ) ( not ( = ?auto_800437 ?auto_800445 ) ) ( not ( = ?auto_800437 ?auto_800446 ) ) ( not ( = ?auto_800437 ?auto_800447 ) ) ( not ( = ?auto_800437 ?auto_800448 ) ) ( not ( = ?auto_800437 ?auto_800449 ) ) ( not ( = ?auto_800437 ?auto_800450 ) ) ( not ( = ?auto_800437 ?auto_800451 ) ) ( not ( = ?auto_800437 ?auto_800452 ) ) ( not ( = ?auto_800437 ?auto_800453 ) ) ( not ( = ?auto_800437 ?auto_800454 ) ) ( not ( = ?auto_800437 ?auto_800455 ) ) ( not ( = ?auto_800438 ?auto_800439 ) ) ( not ( = ?auto_800438 ?auto_800440 ) ) ( not ( = ?auto_800438 ?auto_800441 ) ) ( not ( = ?auto_800438 ?auto_800442 ) ) ( not ( = ?auto_800438 ?auto_800443 ) ) ( not ( = ?auto_800438 ?auto_800444 ) ) ( not ( = ?auto_800438 ?auto_800445 ) ) ( not ( = ?auto_800438 ?auto_800446 ) ) ( not ( = ?auto_800438 ?auto_800447 ) ) ( not ( = ?auto_800438 ?auto_800448 ) ) ( not ( = ?auto_800438 ?auto_800449 ) ) ( not ( = ?auto_800438 ?auto_800450 ) ) ( not ( = ?auto_800438 ?auto_800451 ) ) ( not ( = ?auto_800438 ?auto_800452 ) ) ( not ( = ?auto_800438 ?auto_800453 ) ) ( not ( = ?auto_800438 ?auto_800454 ) ) ( not ( = ?auto_800438 ?auto_800455 ) ) ( not ( = ?auto_800439 ?auto_800440 ) ) ( not ( = ?auto_800439 ?auto_800441 ) ) ( not ( = ?auto_800439 ?auto_800442 ) ) ( not ( = ?auto_800439 ?auto_800443 ) ) ( not ( = ?auto_800439 ?auto_800444 ) ) ( not ( = ?auto_800439 ?auto_800445 ) ) ( not ( = ?auto_800439 ?auto_800446 ) ) ( not ( = ?auto_800439 ?auto_800447 ) ) ( not ( = ?auto_800439 ?auto_800448 ) ) ( not ( = ?auto_800439 ?auto_800449 ) ) ( not ( = ?auto_800439 ?auto_800450 ) ) ( not ( = ?auto_800439 ?auto_800451 ) ) ( not ( = ?auto_800439 ?auto_800452 ) ) ( not ( = ?auto_800439 ?auto_800453 ) ) ( not ( = ?auto_800439 ?auto_800454 ) ) ( not ( = ?auto_800439 ?auto_800455 ) ) ( not ( = ?auto_800440 ?auto_800441 ) ) ( not ( = ?auto_800440 ?auto_800442 ) ) ( not ( = ?auto_800440 ?auto_800443 ) ) ( not ( = ?auto_800440 ?auto_800444 ) ) ( not ( = ?auto_800440 ?auto_800445 ) ) ( not ( = ?auto_800440 ?auto_800446 ) ) ( not ( = ?auto_800440 ?auto_800447 ) ) ( not ( = ?auto_800440 ?auto_800448 ) ) ( not ( = ?auto_800440 ?auto_800449 ) ) ( not ( = ?auto_800440 ?auto_800450 ) ) ( not ( = ?auto_800440 ?auto_800451 ) ) ( not ( = ?auto_800440 ?auto_800452 ) ) ( not ( = ?auto_800440 ?auto_800453 ) ) ( not ( = ?auto_800440 ?auto_800454 ) ) ( not ( = ?auto_800440 ?auto_800455 ) ) ( not ( = ?auto_800441 ?auto_800442 ) ) ( not ( = ?auto_800441 ?auto_800443 ) ) ( not ( = ?auto_800441 ?auto_800444 ) ) ( not ( = ?auto_800441 ?auto_800445 ) ) ( not ( = ?auto_800441 ?auto_800446 ) ) ( not ( = ?auto_800441 ?auto_800447 ) ) ( not ( = ?auto_800441 ?auto_800448 ) ) ( not ( = ?auto_800441 ?auto_800449 ) ) ( not ( = ?auto_800441 ?auto_800450 ) ) ( not ( = ?auto_800441 ?auto_800451 ) ) ( not ( = ?auto_800441 ?auto_800452 ) ) ( not ( = ?auto_800441 ?auto_800453 ) ) ( not ( = ?auto_800441 ?auto_800454 ) ) ( not ( = ?auto_800441 ?auto_800455 ) ) ( not ( = ?auto_800442 ?auto_800443 ) ) ( not ( = ?auto_800442 ?auto_800444 ) ) ( not ( = ?auto_800442 ?auto_800445 ) ) ( not ( = ?auto_800442 ?auto_800446 ) ) ( not ( = ?auto_800442 ?auto_800447 ) ) ( not ( = ?auto_800442 ?auto_800448 ) ) ( not ( = ?auto_800442 ?auto_800449 ) ) ( not ( = ?auto_800442 ?auto_800450 ) ) ( not ( = ?auto_800442 ?auto_800451 ) ) ( not ( = ?auto_800442 ?auto_800452 ) ) ( not ( = ?auto_800442 ?auto_800453 ) ) ( not ( = ?auto_800442 ?auto_800454 ) ) ( not ( = ?auto_800442 ?auto_800455 ) ) ( not ( = ?auto_800443 ?auto_800444 ) ) ( not ( = ?auto_800443 ?auto_800445 ) ) ( not ( = ?auto_800443 ?auto_800446 ) ) ( not ( = ?auto_800443 ?auto_800447 ) ) ( not ( = ?auto_800443 ?auto_800448 ) ) ( not ( = ?auto_800443 ?auto_800449 ) ) ( not ( = ?auto_800443 ?auto_800450 ) ) ( not ( = ?auto_800443 ?auto_800451 ) ) ( not ( = ?auto_800443 ?auto_800452 ) ) ( not ( = ?auto_800443 ?auto_800453 ) ) ( not ( = ?auto_800443 ?auto_800454 ) ) ( not ( = ?auto_800443 ?auto_800455 ) ) ( not ( = ?auto_800444 ?auto_800445 ) ) ( not ( = ?auto_800444 ?auto_800446 ) ) ( not ( = ?auto_800444 ?auto_800447 ) ) ( not ( = ?auto_800444 ?auto_800448 ) ) ( not ( = ?auto_800444 ?auto_800449 ) ) ( not ( = ?auto_800444 ?auto_800450 ) ) ( not ( = ?auto_800444 ?auto_800451 ) ) ( not ( = ?auto_800444 ?auto_800452 ) ) ( not ( = ?auto_800444 ?auto_800453 ) ) ( not ( = ?auto_800444 ?auto_800454 ) ) ( not ( = ?auto_800444 ?auto_800455 ) ) ( not ( = ?auto_800445 ?auto_800446 ) ) ( not ( = ?auto_800445 ?auto_800447 ) ) ( not ( = ?auto_800445 ?auto_800448 ) ) ( not ( = ?auto_800445 ?auto_800449 ) ) ( not ( = ?auto_800445 ?auto_800450 ) ) ( not ( = ?auto_800445 ?auto_800451 ) ) ( not ( = ?auto_800445 ?auto_800452 ) ) ( not ( = ?auto_800445 ?auto_800453 ) ) ( not ( = ?auto_800445 ?auto_800454 ) ) ( not ( = ?auto_800445 ?auto_800455 ) ) ( not ( = ?auto_800446 ?auto_800447 ) ) ( not ( = ?auto_800446 ?auto_800448 ) ) ( not ( = ?auto_800446 ?auto_800449 ) ) ( not ( = ?auto_800446 ?auto_800450 ) ) ( not ( = ?auto_800446 ?auto_800451 ) ) ( not ( = ?auto_800446 ?auto_800452 ) ) ( not ( = ?auto_800446 ?auto_800453 ) ) ( not ( = ?auto_800446 ?auto_800454 ) ) ( not ( = ?auto_800446 ?auto_800455 ) ) ( not ( = ?auto_800447 ?auto_800448 ) ) ( not ( = ?auto_800447 ?auto_800449 ) ) ( not ( = ?auto_800447 ?auto_800450 ) ) ( not ( = ?auto_800447 ?auto_800451 ) ) ( not ( = ?auto_800447 ?auto_800452 ) ) ( not ( = ?auto_800447 ?auto_800453 ) ) ( not ( = ?auto_800447 ?auto_800454 ) ) ( not ( = ?auto_800447 ?auto_800455 ) ) ( not ( = ?auto_800448 ?auto_800449 ) ) ( not ( = ?auto_800448 ?auto_800450 ) ) ( not ( = ?auto_800448 ?auto_800451 ) ) ( not ( = ?auto_800448 ?auto_800452 ) ) ( not ( = ?auto_800448 ?auto_800453 ) ) ( not ( = ?auto_800448 ?auto_800454 ) ) ( not ( = ?auto_800448 ?auto_800455 ) ) ( not ( = ?auto_800449 ?auto_800450 ) ) ( not ( = ?auto_800449 ?auto_800451 ) ) ( not ( = ?auto_800449 ?auto_800452 ) ) ( not ( = ?auto_800449 ?auto_800453 ) ) ( not ( = ?auto_800449 ?auto_800454 ) ) ( not ( = ?auto_800449 ?auto_800455 ) ) ( not ( = ?auto_800450 ?auto_800451 ) ) ( not ( = ?auto_800450 ?auto_800452 ) ) ( not ( = ?auto_800450 ?auto_800453 ) ) ( not ( = ?auto_800450 ?auto_800454 ) ) ( not ( = ?auto_800450 ?auto_800455 ) ) ( not ( = ?auto_800451 ?auto_800452 ) ) ( not ( = ?auto_800451 ?auto_800453 ) ) ( not ( = ?auto_800451 ?auto_800454 ) ) ( not ( = ?auto_800451 ?auto_800455 ) ) ( not ( = ?auto_800452 ?auto_800453 ) ) ( not ( = ?auto_800452 ?auto_800454 ) ) ( not ( = ?auto_800452 ?auto_800455 ) ) ( not ( = ?auto_800453 ?auto_800454 ) ) ( not ( = ?auto_800453 ?auto_800455 ) ) ( not ( = ?auto_800454 ?auto_800455 ) ) ( ON ?auto_800453 ?auto_800454 ) ( ON ?auto_800452 ?auto_800453 ) ( ON ?auto_800451 ?auto_800452 ) ( ON ?auto_800450 ?auto_800451 ) ( ON ?auto_800449 ?auto_800450 ) ( ON ?auto_800448 ?auto_800449 ) ( CLEAR ?auto_800446 ) ( ON ?auto_800447 ?auto_800448 ) ( CLEAR ?auto_800447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_800437 ?auto_800438 ?auto_800439 ?auto_800440 ?auto_800441 ?auto_800442 ?auto_800443 ?auto_800444 ?auto_800445 ?auto_800446 ?auto_800447 )
      ( MAKE-18PILE ?auto_800437 ?auto_800438 ?auto_800439 ?auto_800440 ?auto_800441 ?auto_800442 ?auto_800443 ?auto_800444 ?auto_800445 ?auto_800446 ?auto_800447 ?auto_800448 ?auto_800449 ?auto_800450 ?auto_800451 ?auto_800452 ?auto_800453 ?auto_800454 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800474 - BLOCK
      ?auto_800475 - BLOCK
      ?auto_800476 - BLOCK
      ?auto_800477 - BLOCK
      ?auto_800478 - BLOCK
      ?auto_800479 - BLOCK
      ?auto_800480 - BLOCK
      ?auto_800481 - BLOCK
      ?auto_800482 - BLOCK
      ?auto_800483 - BLOCK
      ?auto_800484 - BLOCK
      ?auto_800485 - BLOCK
      ?auto_800486 - BLOCK
      ?auto_800487 - BLOCK
      ?auto_800488 - BLOCK
      ?auto_800489 - BLOCK
      ?auto_800490 - BLOCK
      ?auto_800491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_800491 ) ( ON-TABLE ?auto_800474 ) ( ON ?auto_800475 ?auto_800474 ) ( ON ?auto_800476 ?auto_800475 ) ( ON ?auto_800477 ?auto_800476 ) ( ON ?auto_800478 ?auto_800477 ) ( ON ?auto_800479 ?auto_800478 ) ( ON ?auto_800480 ?auto_800479 ) ( ON ?auto_800481 ?auto_800480 ) ( ON ?auto_800482 ?auto_800481 ) ( ON ?auto_800483 ?auto_800482 ) ( not ( = ?auto_800474 ?auto_800475 ) ) ( not ( = ?auto_800474 ?auto_800476 ) ) ( not ( = ?auto_800474 ?auto_800477 ) ) ( not ( = ?auto_800474 ?auto_800478 ) ) ( not ( = ?auto_800474 ?auto_800479 ) ) ( not ( = ?auto_800474 ?auto_800480 ) ) ( not ( = ?auto_800474 ?auto_800481 ) ) ( not ( = ?auto_800474 ?auto_800482 ) ) ( not ( = ?auto_800474 ?auto_800483 ) ) ( not ( = ?auto_800474 ?auto_800484 ) ) ( not ( = ?auto_800474 ?auto_800485 ) ) ( not ( = ?auto_800474 ?auto_800486 ) ) ( not ( = ?auto_800474 ?auto_800487 ) ) ( not ( = ?auto_800474 ?auto_800488 ) ) ( not ( = ?auto_800474 ?auto_800489 ) ) ( not ( = ?auto_800474 ?auto_800490 ) ) ( not ( = ?auto_800474 ?auto_800491 ) ) ( not ( = ?auto_800475 ?auto_800476 ) ) ( not ( = ?auto_800475 ?auto_800477 ) ) ( not ( = ?auto_800475 ?auto_800478 ) ) ( not ( = ?auto_800475 ?auto_800479 ) ) ( not ( = ?auto_800475 ?auto_800480 ) ) ( not ( = ?auto_800475 ?auto_800481 ) ) ( not ( = ?auto_800475 ?auto_800482 ) ) ( not ( = ?auto_800475 ?auto_800483 ) ) ( not ( = ?auto_800475 ?auto_800484 ) ) ( not ( = ?auto_800475 ?auto_800485 ) ) ( not ( = ?auto_800475 ?auto_800486 ) ) ( not ( = ?auto_800475 ?auto_800487 ) ) ( not ( = ?auto_800475 ?auto_800488 ) ) ( not ( = ?auto_800475 ?auto_800489 ) ) ( not ( = ?auto_800475 ?auto_800490 ) ) ( not ( = ?auto_800475 ?auto_800491 ) ) ( not ( = ?auto_800476 ?auto_800477 ) ) ( not ( = ?auto_800476 ?auto_800478 ) ) ( not ( = ?auto_800476 ?auto_800479 ) ) ( not ( = ?auto_800476 ?auto_800480 ) ) ( not ( = ?auto_800476 ?auto_800481 ) ) ( not ( = ?auto_800476 ?auto_800482 ) ) ( not ( = ?auto_800476 ?auto_800483 ) ) ( not ( = ?auto_800476 ?auto_800484 ) ) ( not ( = ?auto_800476 ?auto_800485 ) ) ( not ( = ?auto_800476 ?auto_800486 ) ) ( not ( = ?auto_800476 ?auto_800487 ) ) ( not ( = ?auto_800476 ?auto_800488 ) ) ( not ( = ?auto_800476 ?auto_800489 ) ) ( not ( = ?auto_800476 ?auto_800490 ) ) ( not ( = ?auto_800476 ?auto_800491 ) ) ( not ( = ?auto_800477 ?auto_800478 ) ) ( not ( = ?auto_800477 ?auto_800479 ) ) ( not ( = ?auto_800477 ?auto_800480 ) ) ( not ( = ?auto_800477 ?auto_800481 ) ) ( not ( = ?auto_800477 ?auto_800482 ) ) ( not ( = ?auto_800477 ?auto_800483 ) ) ( not ( = ?auto_800477 ?auto_800484 ) ) ( not ( = ?auto_800477 ?auto_800485 ) ) ( not ( = ?auto_800477 ?auto_800486 ) ) ( not ( = ?auto_800477 ?auto_800487 ) ) ( not ( = ?auto_800477 ?auto_800488 ) ) ( not ( = ?auto_800477 ?auto_800489 ) ) ( not ( = ?auto_800477 ?auto_800490 ) ) ( not ( = ?auto_800477 ?auto_800491 ) ) ( not ( = ?auto_800478 ?auto_800479 ) ) ( not ( = ?auto_800478 ?auto_800480 ) ) ( not ( = ?auto_800478 ?auto_800481 ) ) ( not ( = ?auto_800478 ?auto_800482 ) ) ( not ( = ?auto_800478 ?auto_800483 ) ) ( not ( = ?auto_800478 ?auto_800484 ) ) ( not ( = ?auto_800478 ?auto_800485 ) ) ( not ( = ?auto_800478 ?auto_800486 ) ) ( not ( = ?auto_800478 ?auto_800487 ) ) ( not ( = ?auto_800478 ?auto_800488 ) ) ( not ( = ?auto_800478 ?auto_800489 ) ) ( not ( = ?auto_800478 ?auto_800490 ) ) ( not ( = ?auto_800478 ?auto_800491 ) ) ( not ( = ?auto_800479 ?auto_800480 ) ) ( not ( = ?auto_800479 ?auto_800481 ) ) ( not ( = ?auto_800479 ?auto_800482 ) ) ( not ( = ?auto_800479 ?auto_800483 ) ) ( not ( = ?auto_800479 ?auto_800484 ) ) ( not ( = ?auto_800479 ?auto_800485 ) ) ( not ( = ?auto_800479 ?auto_800486 ) ) ( not ( = ?auto_800479 ?auto_800487 ) ) ( not ( = ?auto_800479 ?auto_800488 ) ) ( not ( = ?auto_800479 ?auto_800489 ) ) ( not ( = ?auto_800479 ?auto_800490 ) ) ( not ( = ?auto_800479 ?auto_800491 ) ) ( not ( = ?auto_800480 ?auto_800481 ) ) ( not ( = ?auto_800480 ?auto_800482 ) ) ( not ( = ?auto_800480 ?auto_800483 ) ) ( not ( = ?auto_800480 ?auto_800484 ) ) ( not ( = ?auto_800480 ?auto_800485 ) ) ( not ( = ?auto_800480 ?auto_800486 ) ) ( not ( = ?auto_800480 ?auto_800487 ) ) ( not ( = ?auto_800480 ?auto_800488 ) ) ( not ( = ?auto_800480 ?auto_800489 ) ) ( not ( = ?auto_800480 ?auto_800490 ) ) ( not ( = ?auto_800480 ?auto_800491 ) ) ( not ( = ?auto_800481 ?auto_800482 ) ) ( not ( = ?auto_800481 ?auto_800483 ) ) ( not ( = ?auto_800481 ?auto_800484 ) ) ( not ( = ?auto_800481 ?auto_800485 ) ) ( not ( = ?auto_800481 ?auto_800486 ) ) ( not ( = ?auto_800481 ?auto_800487 ) ) ( not ( = ?auto_800481 ?auto_800488 ) ) ( not ( = ?auto_800481 ?auto_800489 ) ) ( not ( = ?auto_800481 ?auto_800490 ) ) ( not ( = ?auto_800481 ?auto_800491 ) ) ( not ( = ?auto_800482 ?auto_800483 ) ) ( not ( = ?auto_800482 ?auto_800484 ) ) ( not ( = ?auto_800482 ?auto_800485 ) ) ( not ( = ?auto_800482 ?auto_800486 ) ) ( not ( = ?auto_800482 ?auto_800487 ) ) ( not ( = ?auto_800482 ?auto_800488 ) ) ( not ( = ?auto_800482 ?auto_800489 ) ) ( not ( = ?auto_800482 ?auto_800490 ) ) ( not ( = ?auto_800482 ?auto_800491 ) ) ( not ( = ?auto_800483 ?auto_800484 ) ) ( not ( = ?auto_800483 ?auto_800485 ) ) ( not ( = ?auto_800483 ?auto_800486 ) ) ( not ( = ?auto_800483 ?auto_800487 ) ) ( not ( = ?auto_800483 ?auto_800488 ) ) ( not ( = ?auto_800483 ?auto_800489 ) ) ( not ( = ?auto_800483 ?auto_800490 ) ) ( not ( = ?auto_800483 ?auto_800491 ) ) ( not ( = ?auto_800484 ?auto_800485 ) ) ( not ( = ?auto_800484 ?auto_800486 ) ) ( not ( = ?auto_800484 ?auto_800487 ) ) ( not ( = ?auto_800484 ?auto_800488 ) ) ( not ( = ?auto_800484 ?auto_800489 ) ) ( not ( = ?auto_800484 ?auto_800490 ) ) ( not ( = ?auto_800484 ?auto_800491 ) ) ( not ( = ?auto_800485 ?auto_800486 ) ) ( not ( = ?auto_800485 ?auto_800487 ) ) ( not ( = ?auto_800485 ?auto_800488 ) ) ( not ( = ?auto_800485 ?auto_800489 ) ) ( not ( = ?auto_800485 ?auto_800490 ) ) ( not ( = ?auto_800485 ?auto_800491 ) ) ( not ( = ?auto_800486 ?auto_800487 ) ) ( not ( = ?auto_800486 ?auto_800488 ) ) ( not ( = ?auto_800486 ?auto_800489 ) ) ( not ( = ?auto_800486 ?auto_800490 ) ) ( not ( = ?auto_800486 ?auto_800491 ) ) ( not ( = ?auto_800487 ?auto_800488 ) ) ( not ( = ?auto_800487 ?auto_800489 ) ) ( not ( = ?auto_800487 ?auto_800490 ) ) ( not ( = ?auto_800487 ?auto_800491 ) ) ( not ( = ?auto_800488 ?auto_800489 ) ) ( not ( = ?auto_800488 ?auto_800490 ) ) ( not ( = ?auto_800488 ?auto_800491 ) ) ( not ( = ?auto_800489 ?auto_800490 ) ) ( not ( = ?auto_800489 ?auto_800491 ) ) ( not ( = ?auto_800490 ?auto_800491 ) ) ( ON ?auto_800490 ?auto_800491 ) ( ON ?auto_800489 ?auto_800490 ) ( ON ?auto_800488 ?auto_800489 ) ( ON ?auto_800487 ?auto_800488 ) ( ON ?auto_800486 ?auto_800487 ) ( ON ?auto_800485 ?auto_800486 ) ( CLEAR ?auto_800483 ) ( ON ?auto_800484 ?auto_800485 ) ( CLEAR ?auto_800484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_800474 ?auto_800475 ?auto_800476 ?auto_800477 ?auto_800478 ?auto_800479 ?auto_800480 ?auto_800481 ?auto_800482 ?auto_800483 ?auto_800484 )
      ( MAKE-18PILE ?auto_800474 ?auto_800475 ?auto_800476 ?auto_800477 ?auto_800478 ?auto_800479 ?auto_800480 ?auto_800481 ?auto_800482 ?auto_800483 ?auto_800484 ?auto_800485 ?auto_800486 ?auto_800487 ?auto_800488 ?auto_800489 ?auto_800490 ?auto_800491 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800510 - BLOCK
      ?auto_800511 - BLOCK
      ?auto_800512 - BLOCK
      ?auto_800513 - BLOCK
      ?auto_800514 - BLOCK
      ?auto_800515 - BLOCK
      ?auto_800516 - BLOCK
      ?auto_800517 - BLOCK
      ?auto_800518 - BLOCK
      ?auto_800519 - BLOCK
      ?auto_800520 - BLOCK
      ?auto_800521 - BLOCK
      ?auto_800522 - BLOCK
      ?auto_800523 - BLOCK
      ?auto_800524 - BLOCK
      ?auto_800525 - BLOCK
      ?auto_800526 - BLOCK
      ?auto_800527 - BLOCK
    )
    :vars
    (
      ?auto_800528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_800527 ?auto_800528 ) ( ON-TABLE ?auto_800510 ) ( ON ?auto_800511 ?auto_800510 ) ( ON ?auto_800512 ?auto_800511 ) ( ON ?auto_800513 ?auto_800512 ) ( ON ?auto_800514 ?auto_800513 ) ( ON ?auto_800515 ?auto_800514 ) ( ON ?auto_800516 ?auto_800515 ) ( ON ?auto_800517 ?auto_800516 ) ( ON ?auto_800518 ?auto_800517 ) ( not ( = ?auto_800510 ?auto_800511 ) ) ( not ( = ?auto_800510 ?auto_800512 ) ) ( not ( = ?auto_800510 ?auto_800513 ) ) ( not ( = ?auto_800510 ?auto_800514 ) ) ( not ( = ?auto_800510 ?auto_800515 ) ) ( not ( = ?auto_800510 ?auto_800516 ) ) ( not ( = ?auto_800510 ?auto_800517 ) ) ( not ( = ?auto_800510 ?auto_800518 ) ) ( not ( = ?auto_800510 ?auto_800519 ) ) ( not ( = ?auto_800510 ?auto_800520 ) ) ( not ( = ?auto_800510 ?auto_800521 ) ) ( not ( = ?auto_800510 ?auto_800522 ) ) ( not ( = ?auto_800510 ?auto_800523 ) ) ( not ( = ?auto_800510 ?auto_800524 ) ) ( not ( = ?auto_800510 ?auto_800525 ) ) ( not ( = ?auto_800510 ?auto_800526 ) ) ( not ( = ?auto_800510 ?auto_800527 ) ) ( not ( = ?auto_800510 ?auto_800528 ) ) ( not ( = ?auto_800511 ?auto_800512 ) ) ( not ( = ?auto_800511 ?auto_800513 ) ) ( not ( = ?auto_800511 ?auto_800514 ) ) ( not ( = ?auto_800511 ?auto_800515 ) ) ( not ( = ?auto_800511 ?auto_800516 ) ) ( not ( = ?auto_800511 ?auto_800517 ) ) ( not ( = ?auto_800511 ?auto_800518 ) ) ( not ( = ?auto_800511 ?auto_800519 ) ) ( not ( = ?auto_800511 ?auto_800520 ) ) ( not ( = ?auto_800511 ?auto_800521 ) ) ( not ( = ?auto_800511 ?auto_800522 ) ) ( not ( = ?auto_800511 ?auto_800523 ) ) ( not ( = ?auto_800511 ?auto_800524 ) ) ( not ( = ?auto_800511 ?auto_800525 ) ) ( not ( = ?auto_800511 ?auto_800526 ) ) ( not ( = ?auto_800511 ?auto_800527 ) ) ( not ( = ?auto_800511 ?auto_800528 ) ) ( not ( = ?auto_800512 ?auto_800513 ) ) ( not ( = ?auto_800512 ?auto_800514 ) ) ( not ( = ?auto_800512 ?auto_800515 ) ) ( not ( = ?auto_800512 ?auto_800516 ) ) ( not ( = ?auto_800512 ?auto_800517 ) ) ( not ( = ?auto_800512 ?auto_800518 ) ) ( not ( = ?auto_800512 ?auto_800519 ) ) ( not ( = ?auto_800512 ?auto_800520 ) ) ( not ( = ?auto_800512 ?auto_800521 ) ) ( not ( = ?auto_800512 ?auto_800522 ) ) ( not ( = ?auto_800512 ?auto_800523 ) ) ( not ( = ?auto_800512 ?auto_800524 ) ) ( not ( = ?auto_800512 ?auto_800525 ) ) ( not ( = ?auto_800512 ?auto_800526 ) ) ( not ( = ?auto_800512 ?auto_800527 ) ) ( not ( = ?auto_800512 ?auto_800528 ) ) ( not ( = ?auto_800513 ?auto_800514 ) ) ( not ( = ?auto_800513 ?auto_800515 ) ) ( not ( = ?auto_800513 ?auto_800516 ) ) ( not ( = ?auto_800513 ?auto_800517 ) ) ( not ( = ?auto_800513 ?auto_800518 ) ) ( not ( = ?auto_800513 ?auto_800519 ) ) ( not ( = ?auto_800513 ?auto_800520 ) ) ( not ( = ?auto_800513 ?auto_800521 ) ) ( not ( = ?auto_800513 ?auto_800522 ) ) ( not ( = ?auto_800513 ?auto_800523 ) ) ( not ( = ?auto_800513 ?auto_800524 ) ) ( not ( = ?auto_800513 ?auto_800525 ) ) ( not ( = ?auto_800513 ?auto_800526 ) ) ( not ( = ?auto_800513 ?auto_800527 ) ) ( not ( = ?auto_800513 ?auto_800528 ) ) ( not ( = ?auto_800514 ?auto_800515 ) ) ( not ( = ?auto_800514 ?auto_800516 ) ) ( not ( = ?auto_800514 ?auto_800517 ) ) ( not ( = ?auto_800514 ?auto_800518 ) ) ( not ( = ?auto_800514 ?auto_800519 ) ) ( not ( = ?auto_800514 ?auto_800520 ) ) ( not ( = ?auto_800514 ?auto_800521 ) ) ( not ( = ?auto_800514 ?auto_800522 ) ) ( not ( = ?auto_800514 ?auto_800523 ) ) ( not ( = ?auto_800514 ?auto_800524 ) ) ( not ( = ?auto_800514 ?auto_800525 ) ) ( not ( = ?auto_800514 ?auto_800526 ) ) ( not ( = ?auto_800514 ?auto_800527 ) ) ( not ( = ?auto_800514 ?auto_800528 ) ) ( not ( = ?auto_800515 ?auto_800516 ) ) ( not ( = ?auto_800515 ?auto_800517 ) ) ( not ( = ?auto_800515 ?auto_800518 ) ) ( not ( = ?auto_800515 ?auto_800519 ) ) ( not ( = ?auto_800515 ?auto_800520 ) ) ( not ( = ?auto_800515 ?auto_800521 ) ) ( not ( = ?auto_800515 ?auto_800522 ) ) ( not ( = ?auto_800515 ?auto_800523 ) ) ( not ( = ?auto_800515 ?auto_800524 ) ) ( not ( = ?auto_800515 ?auto_800525 ) ) ( not ( = ?auto_800515 ?auto_800526 ) ) ( not ( = ?auto_800515 ?auto_800527 ) ) ( not ( = ?auto_800515 ?auto_800528 ) ) ( not ( = ?auto_800516 ?auto_800517 ) ) ( not ( = ?auto_800516 ?auto_800518 ) ) ( not ( = ?auto_800516 ?auto_800519 ) ) ( not ( = ?auto_800516 ?auto_800520 ) ) ( not ( = ?auto_800516 ?auto_800521 ) ) ( not ( = ?auto_800516 ?auto_800522 ) ) ( not ( = ?auto_800516 ?auto_800523 ) ) ( not ( = ?auto_800516 ?auto_800524 ) ) ( not ( = ?auto_800516 ?auto_800525 ) ) ( not ( = ?auto_800516 ?auto_800526 ) ) ( not ( = ?auto_800516 ?auto_800527 ) ) ( not ( = ?auto_800516 ?auto_800528 ) ) ( not ( = ?auto_800517 ?auto_800518 ) ) ( not ( = ?auto_800517 ?auto_800519 ) ) ( not ( = ?auto_800517 ?auto_800520 ) ) ( not ( = ?auto_800517 ?auto_800521 ) ) ( not ( = ?auto_800517 ?auto_800522 ) ) ( not ( = ?auto_800517 ?auto_800523 ) ) ( not ( = ?auto_800517 ?auto_800524 ) ) ( not ( = ?auto_800517 ?auto_800525 ) ) ( not ( = ?auto_800517 ?auto_800526 ) ) ( not ( = ?auto_800517 ?auto_800527 ) ) ( not ( = ?auto_800517 ?auto_800528 ) ) ( not ( = ?auto_800518 ?auto_800519 ) ) ( not ( = ?auto_800518 ?auto_800520 ) ) ( not ( = ?auto_800518 ?auto_800521 ) ) ( not ( = ?auto_800518 ?auto_800522 ) ) ( not ( = ?auto_800518 ?auto_800523 ) ) ( not ( = ?auto_800518 ?auto_800524 ) ) ( not ( = ?auto_800518 ?auto_800525 ) ) ( not ( = ?auto_800518 ?auto_800526 ) ) ( not ( = ?auto_800518 ?auto_800527 ) ) ( not ( = ?auto_800518 ?auto_800528 ) ) ( not ( = ?auto_800519 ?auto_800520 ) ) ( not ( = ?auto_800519 ?auto_800521 ) ) ( not ( = ?auto_800519 ?auto_800522 ) ) ( not ( = ?auto_800519 ?auto_800523 ) ) ( not ( = ?auto_800519 ?auto_800524 ) ) ( not ( = ?auto_800519 ?auto_800525 ) ) ( not ( = ?auto_800519 ?auto_800526 ) ) ( not ( = ?auto_800519 ?auto_800527 ) ) ( not ( = ?auto_800519 ?auto_800528 ) ) ( not ( = ?auto_800520 ?auto_800521 ) ) ( not ( = ?auto_800520 ?auto_800522 ) ) ( not ( = ?auto_800520 ?auto_800523 ) ) ( not ( = ?auto_800520 ?auto_800524 ) ) ( not ( = ?auto_800520 ?auto_800525 ) ) ( not ( = ?auto_800520 ?auto_800526 ) ) ( not ( = ?auto_800520 ?auto_800527 ) ) ( not ( = ?auto_800520 ?auto_800528 ) ) ( not ( = ?auto_800521 ?auto_800522 ) ) ( not ( = ?auto_800521 ?auto_800523 ) ) ( not ( = ?auto_800521 ?auto_800524 ) ) ( not ( = ?auto_800521 ?auto_800525 ) ) ( not ( = ?auto_800521 ?auto_800526 ) ) ( not ( = ?auto_800521 ?auto_800527 ) ) ( not ( = ?auto_800521 ?auto_800528 ) ) ( not ( = ?auto_800522 ?auto_800523 ) ) ( not ( = ?auto_800522 ?auto_800524 ) ) ( not ( = ?auto_800522 ?auto_800525 ) ) ( not ( = ?auto_800522 ?auto_800526 ) ) ( not ( = ?auto_800522 ?auto_800527 ) ) ( not ( = ?auto_800522 ?auto_800528 ) ) ( not ( = ?auto_800523 ?auto_800524 ) ) ( not ( = ?auto_800523 ?auto_800525 ) ) ( not ( = ?auto_800523 ?auto_800526 ) ) ( not ( = ?auto_800523 ?auto_800527 ) ) ( not ( = ?auto_800523 ?auto_800528 ) ) ( not ( = ?auto_800524 ?auto_800525 ) ) ( not ( = ?auto_800524 ?auto_800526 ) ) ( not ( = ?auto_800524 ?auto_800527 ) ) ( not ( = ?auto_800524 ?auto_800528 ) ) ( not ( = ?auto_800525 ?auto_800526 ) ) ( not ( = ?auto_800525 ?auto_800527 ) ) ( not ( = ?auto_800525 ?auto_800528 ) ) ( not ( = ?auto_800526 ?auto_800527 ) ) ( not ( = ?auto_800526 ?auto_800528 ) ) ( not ( = ?auto_800527 ?auto_800528 ) ) ( ON ?auto_800526 ?auto_800527 ) ( ON ?auto_800525 ?auto_800526 ) ( ON ?auto_800524 ?auto_800525 ) ( ON ?auto_800523 ?auto_800524 ) ( ON ?auto_800522 ?auto_800523 ) ( ON ?auto_800521 ?auto_800522 ) ( ON ?auto_800520 ?auto_800521 ) ( CLEAR ?auto_800518 ) ( ON ?auto_800519 ?auto_800520 ) ( CLEAR ?auto_800519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_800510 ?auto_800511 ?auto_800512 ?auto_800513 ?auto_800514 ?auto_800515 ?auto_800516 ?auto_800517 ?auto_800518 ?auto_800519 )
      ( MAKE-18PILE ?auto_800510 ?auto_800511 ?auto_800512 ?auto_800513 ?auto_800514 ?auto_800515 ?auto_800516 ?auto_800517 ?auto_800518 ?auto_800519 ?auto_800520 ?auto_800521 ?auto_800522 ?auto_800523 ?auto_800524 ?auto_800525 ?auto_800526 ?auto_800527 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800547 - BLOCK
      ?auto_800548 - BLOCK
      ?auto_800549 - BLOCK
      ?auto_800550 - BLOCK
      ?auto_800551 - BLOCK
      ?auto_800552 - BLOCK
      ?auto_800553 - BLOCK
      ?auto_800554 - BLOCK
      ?auto_800555 - BLOCK
      ?auto_800556 - BLOCK
      ?auto_800557 - BLOCK
      ?auto_800558 - BLOCK
      ?auto_800559 - BLOCK
      ?auto_800560 - BLOCK
      ?auto_800561 - BLOCK
      ?auto_800562 - BLOCK
      ?auto_800563 - BLOCK
      ?auto_800564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_800564 ) ( ON-TABLE ?auto_800547 ) ( ON ?auto_800548 ?auto_800547 ) ( ON ?auto_800549 ?auto_800548 ) ( ON ?auto_800550 ?auto_800549 ) ( ON ?auto_800551 ?auto_800550 ) ( ON ?auto_800552 ?auto_800551 ) ( ON ?auto_800553 ?auto_800552 ) ( ON ?auto_800554 ?auto_800553 ) ( ON ?auto_800555 ?auto_800554 ) ( not ( = ?auto_800547 ?auto_800548 ) ) ( not ( = ?auto_800547 ?auto_800549 ) ) ( not ( = ?auto_800547 ?auto_800550 ) ) ( not ( = ?auto_800547 ?auto_800551 ) ) ( not ( = ?auto_800547 ?auto_800552 ) ) ( not ( = ?auto_800547 ?auto_800553 ) ) ( not ( = ?auto_800547 ?auto_800554 ) ) ( not ( = ?auto_800547 ?auto_800555 ) ) ( not ( = ?auto_800547 ?auto_800556 ) ) ( not ( = ?auto_800547 ?auto_800557 ) ) ( not ( = ?auto_800547 ?auto_800558 ) ) ( not ( = ?auto_800547 ?auto_800559 ) ) ( not ( = ?auto_800547 ?auto_800560 ) ) ( not ( = ?auto_800547 ?auto_800561 ) ) ( not ( = ?auto_800547 ?auto_800562 ) ) ( not ( = ?auto_800547 ?auto_800563 ) ) ( not ( = ?auto_800547 ?auto_800564 ) ) ( not ( = ?auto_800548 ?auto_800549 ) ) ( not ( = ?auto_800548 ?auto_800550 ) ) ( not ( = ?auto_800548 ?auto_800551 ) ) ( not ( = ?auto_800548 ?auto_800552 ) ) ( not ( = ?auto_800548 ?auto_800553 ) ) ( not ( = ?auto_800548 ?auto_800554 ) ) ( not ( = ?auto_800548 ?auto_800555 ) ) ( not ( = ?auto_800548 ?auto_800556 ) ) ( not ( = ?auto_800548 ?auto_800557 ) ) ( not ( = ?auto_800548 ?auto_800558 ) ) ( not ( = ?auto_800548 ?auto_800559 ) ) ( not ( = ?auto_800548 ?auto_800560 ) ) ( not ( = ?auto_800548 ?auto_800561 ) ) ( not ( = ?auto_800548 ?auto_800562 ) ) ( not ( = ?auto_800548 ?auto_800563 ) ) ( not ( = ?auto_800548 ?auto_800564 ) ) ( not ( = ?auto_800549 ?auto_800550 ) ) ( not ( = ?auto_800549 ?auto_800551 ) ) ( not ( = ?auto_800549 ?auto_800552 ) ) ( not ( = ?auto_800549 ?auto_800553 ) ) ( not ( = ?auto_800549 ?auto_800554 ) ) ( not ( = ?auto_800549 ?auto_800555 ) ) ( not ( = ?auto_800549 ?auto_800556 ) ) ( not ( = ?auto_800549 ?auto_800557 ) ) ( not ( = ?auto_800549 ?auto_800558 ) ) ( not ( = ?auto_800549 ?auto_800559 ) ) ( not ( = ?auto_800549 ?auto_800560 ) ) ( not ( = ?auto_800549 ?auto_800561 ) ) ( not ( = ?auto_800549 ?auto_800562 ) ) ( not ( = ?auto_800549 ?auto_800563 ) ) ( not ( = ?auto_800549 ?auto_800564 ) ) ( not ( = ?auto_800550 ?auto_800551 ) ) ( not ( = ?auto_800550 ?auto_800552 ) ) ( not ( = ?auto_800550 ?auto_800553 ) ) ( not ( = ?auto_800550 ?auto_800554 ) ) ( not ( = ?auto_800550 ?auto_800555 ) ) ( not ( = ?auto_800550 ?auto_800556 ) ) ( not ( = ?auto_800550 ?auto_800557 ) ) ( not ( = ?auto_800550 ?auto_800558 ) ) ( not ( = ?auto_800550 ?auto_800559 ) ) ( not ( = ?auto_800550 ?auto_800560 ) ) ( not ( = ?auto_800550 ?auto_800561 ) ) ( not ( = ?auto_800550 ?auto_800562 ) ) ( not ( = ?auto_800550 ?auto_800563 ) ) ( not ( = ?auto_800550 ?auto_800564 ) ) ( not ( = ?auto_800551 ?auto_800552 ) ) ( not ( = ?auto_800551 ?auto_800553 ) ) ( not ( = ?auto_800551 ?auto_800554 ) ) ( not ( = ?auto_800551 ?auto_800555 ) ) ( not ( = ?auto_800551 ?auto_800556 ) ) ( not ( = ?auto_800551 ?auto_800557 ) ) ( not ( = ?auto_800551 ?auto_800558 ) ) ( not ( = ?auto_800551 ?auto_800559 ) ) ( not ( = ?auto_800551 ?auto_800560 ) ) ( not ( = ?auto_800551 ?auto_800561 ) ) ( not ( = ?auto_800551 ?auto_800562 ) ) ( not ( = ?auto_800551 ?auto_800563 ) ) ( not ( = ?auto_800551 ?auto_800564 ) ) ( not ( = ?auto_800552 ?auto_800553 ) ) ( not ( = ?auto_800552 ?auto_800554 ) ) ( not ( = ?auto_800552 ?auto_800555 ) ) ( not ( = ?auto_800552 ?auto_800556 ) ) ( not ( = ?auto_800552 ?auto_800557 ) ) ( not ( = ?auto_800552 ?auto_800558 ) ) ( not ( = ?auto_800552 ?auto_800559 ) ) ( not ( = ?auto_800552 ?auto_800560 ) ) ( not ( = ?auto_800552 ?auto_800561 ) ) ( not ( = ?auto_800552 ?auto_800562 ) ) ( not ( = ?auto_800552 ?auto_800563 ) ) ( not ( = ?auto_800552 ?auto_800564 ) ) ( not ( = ?auto_800553 ?auto_800554 ) ) ( not ( = ?auto_800553 ?auto_800555 ) ) ( not ( = ?auto_800553 ?auto_800556 ) ) ( not ( = ?auto_800553 ?auto_800557 ) ) ( not ( = ?auto_800553 ?auto_800558 ) ) ( not ( = ?auto_800553 ?auto_800559 ) ) ( not ( = ?auto_800553 ?auto_800560 ) ) ( not ( = ?auto_800553 ?auto_800561 ) ) ( not ( = ?auto_800553 ?auto_800562 ) ) ( not ( = ?auto_800553 ?auto_800563 ) ) ( not ( = ?auto_800553 ?auto_800564 ) ) ( not ( = ?auto_800554 ?auto_800555 ) ) ( not ( = ?auto_800554 ?auto_800556 ) ) ( not ( = ?auto_800554 ?auto_800557 ) ) ( not ( = ?auto_800554 ?auto_800558 ) ) ( not ( = ?auto_800554 ?auto_800559 ) ) ( not ( = ?auto_800554 ?auto_800560 ) ) ( not ( = ?auto_800554 ?auto_800561 ) ) ( not ( = ?auto_800554 ?auto_800562 ) ) ( not ( = ?auto_800554 ?auto_800563 ) ) ( not ( = ?auto_800554 ?auto_800564 ) ) ( not ( = ?auto_800555 ?auto_800556 ) ) ( not ( = ?auto_800555 ?auto_800557 ) ) ( not ( = ?auto_800555 ?auto_800558 ) ) ( not ( = ?auto_800555 ?auto_800559 ) ) ( not ( = ?auto_800555 ?auto_800560 ) ) ( not ( = ?auto_800555 ?auto_800561 ) ) ( not ( = ?auto_800555 ?auto_800562 ) ) ( not ( = ?auto_800555 ?auto_800563 ) ) ( not ( = ?auto_800555 ?auto_800564 ) ) ( not ( = ?auto_800556 ?auto_800557 ) ) ( not ( = ?auto_800556 ?auto_800558 ) ) ( not ( = ?auto_800556 ?auto_800559 ) ) ( not ( = ?auto_800556 ?auto_800560 ) ) ( not ( = ?auto_800556 ?auto_800561 ) ) ( not ( = ?auto_800556 ?auto_800562 ) ) ( not ( = ?auto_800556 ?auto_800563 ) ) ( not ( = ?auto_800556 ?auto_800564 ) ) ( not ( = ?auto_800557 ?auto_800558 ) ) ( not ( = ?auto_800557 ?auto_800559 ) ) ( not ( = ?auto_800557 ?auto_800560 ) ) ( not ( = ?auto_800557 ?auto_800561 ) ) ( not ( = ?auto_800557 ?auto_800562 ) ) ( not ( = ?auto_800557 ?auto_800563 ) ) ( not ( = ?auto_800557 ?auto_800564 ) ) ( not ( = ?auto_800558 ?auto_800559 ) ) ( not ( = ?auto_800558 ?auto_800560 ) ) ( not ( = ?auto_800558 ?auto_800561 ) ) ( not ( = ?auto_800558 ?auto_800562 ) ) ( not ( = ?auto_800558 ?auto_800563 ) ) ( not ( = ?auto_800558 ?auto_800564 ) ) ( not ( = ?auto_800559 ?auto_800560 ) ) ( not ( = ?auto_800559 ?auto_800561 ) ) ( not ( = ?auto_800559 ?auto_800562 ) ) ( not ( = ?auto_800559 ?auto_800563 ) ) ( not ( = ?auto_800559 ?auto_800564 ) ) ( not ( = ?auto_800560 ?auto_800561 ) ) ( not ( = ?auto_800560 ?auto_800562 ) ) ( not ( = ?auto_800560 ?auto_800563 ) ) ( not ( = ?auto_800560 ?auto_800564 ) ) ( not ( = ?auto_800561 ?auto_800562 ) ) ( not ( = ?auto_800561 ?auto_800563 ) ) ( not ( = ?auto_800561 ?auto_800564 ) ) ( not ( = ?auto_800562 ?auto_800563 ) ) ( not ( = ?auto_800562 ?auto_800564 ) ) ( not ( = ?auto_800563 ?auto_800564 ) ) ( ON ?auto_800563 ?auto_800564 ) ( ON ?auto_800562 ?auto_800563 ) ( ON ?auto_800561 ?auto_800562 ) ( ON ?auto_800560 ?auto_800561 ) ( ON ?auto_800559 ?auto_800560 ) ( ON ?auto_800558 ?auto_800559 ) ( ON ?auto_800557 ?auto_800558 ) ( CLEAR ?auto_800555 ) ( ON ?auto_800556 ?auto_800557 ) ( CLEAR ?auto_800556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_800547 ?auto_800548 ?auto_800549 ?auto_800550 ?auto_800551 ?auto_800552 ?auto_800553 ?auto_800554 ?auto_800555 ?auto_800556 )
      ( MAKE-18PILE ?auto_800547 ?auto_800548 ?auto_800549 ?auto_800550 ?auto_800551 ?auto_800552 ?auto_800553 ?auto_800554 ?auto_800555 ?auto_800556 ?auto_800557 ?auto_800558 ?auto_800559 ?auto_800560 ?auto_800561 ?auto_800562 ?auto_800563 ?auto_800564 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800583 - BLOCK
      ?auto_800584 - BLOCK
      ?auto_800585 - BLOCK
      ?auto_800586 - BLOCK
      ?auto_800587 - BLOCK
      ?auto_800588 - BLOCK
      ?auto_800589 - BLOCK
      ?auto_800590 - BLOCK
      ?auto_800591 - BLOCK
      ?auto_800592 - BLOCK
      ?auto_800593 - BLOCK
      ?auto_800594 - BLOCK
      ?auto_800595 - BLOCK
      ?auto_800596 - BLOCK
      ?auto_800597 - BLOCK
      ?auto_800598 - BLOCK
      ?auto_800599 - BLOCK
      ?auto_800600 - BLOCK
    )
    :vars
    (
      ?auto_800601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_800600 ?auto_800601 ) ( ON-TABLE ?auto_800583 ) ( ON ?auto_800584 ?auto_800583 ) ( ON ?auto_800585 ?auto_800584 ) ( ON ?auto_800586 ?auto_800585 ) ( ON ?auto_800587 ?auto_800586 ) ( ON ?auto_800588 ?auto_800587 ) ( ON ?auto_800589 ?auto_800588 ) ( ON ?auto_800590 ?auto_800589 ) ( not ( = ?auto_800583 ?auto_800584 ) ) ( not ( = ?auto_800583 ?auto_800585 ) ) ( not ( = ?auto_800583 ?auto_800586 ) ) ( not ( = ?auto_800583 ?auto_800587 ) ) ( not ( = ?auto_800583 ?auto_800588 ) ) ( not ( = ?auto_800583 ?auto_800589 ) ) ( not ( = ?auto_800583 ?auto_800590 ) ) ( not ( = ?auto_800583 ?auto_800591 ) ) ( not ( = ?auto_800583 ?auto_800592 ) ) ( not ( = ?auto_800583 ?auto_800593 ) ) ( not ( = ?auto_800583 ?auto_800594 ) ) ( not ( = ?auto_800583 ?auto_800595 ) ) ( not ( = ?auto_800583 ?auto_800596 ) ) ( not ( = ?auto_800583 ?auto_800597 ) ) ( not ( = ?auto_800583 ?auto_800598 ) ) ( not ( = ?auto_800583 ?auto_800599 ) ) ( not ( = ?auto_800583 ?auto_800600 ) ) ( not ( = ?auto_800583 ?auto_800601 ) ) ( not ( = ?auto_800584 ?auto_800585 ) ) ( not ( = ?auto_800584 ?auto_800586 ) ) ( not ( = ?auto_800584 ?auto_800587 ) ) ( not ( = ?auto_800584 ?auto_800588 ) ) ( not ( = ?auto_800584 ?auto_800589 ) ) ( not ( = ?auto_800584 ?auto_800590 ) ) ( not ( = ?auto_800584 ?auto_800591 ) ) ( not ( = ?auto_800584 ?auto_800592 ) ) ( not ( = ?auto_800584 ?auto_800593 ) ) ( not ( = ?auto_800584 ?auto_800594 ) ) ( not ( = ?auto_800584 ?auto_800595 ) ) ( not ( = ?auto_800584 ?auto_800596 ) ) ( not ( = ?auto_800584 ?auto_800597 ) ) ( not ( = ?auto_800584 ?auto_800598 ) ) ( not ( = ?auto_800584 ?auto_800599 ) ) ( not ( = ?auto_800584 ?auto_800600 ) ) ( not ( = ?auto_800584 ?auto_800601 ) ) ( not ( = ?auto_800585 ?auto_800586 ) ) ( not ( = ?auto_800585 ?auto_800587 ) ) ( not ( = ?auto_800585 ?auto_800588 ) ) ( not ( = ?auto_800585 ?auto_800589 ) ) ( not ( = ?auto_800585 ?auto_800590 ) ) ( not ( = ?auto_800585 ?auto_800591 ) ) ( not ( = ?auto_800585 ?auto_800592 ) ) ( not ( = ?auto_800585 ?auto_800593 ) ) ( not ( = ?auto_800585 ?auto_800594 ) ) ( not ( = ?auto_800585 ?auto_800595 ) ) ( not ( = ?auto_800585 ?auto_800596 ) ) ( not ( = ?auto_800585 ?auto_800597 ) ) ( not ( = ?auto_800585 ?auto_800598 ) ) ( not ( = ?auto_800585 ?auto_800599 ) ) ( not ( = ?auto_800585 ?auto_800600 ) ) ( not ( = ?auto_800585 ?auto_800601 ) ) ( not ( = ?auto_800586 ?auto_800587 ) ) ( not ( = ?auto_800586 ?auto_800588 ) ) ( not ( = ?auto_800586 ?auto_800589 ) ) ( not ( = ?auto_800586 ?auto_800590 ) ) ( not ( = ?auto_800586 ?auto_800591 ) ) ( not ( = ?auto_800586 ?auto_800592 ) ) ( not ( = ?auto_800586 ?auto_800593 ) ) ( not ( = ?auto_800586 ?auto_800594 ) ) ( not ( = ?auto_800586 ?auto_800595 ) ) ( not ( = ?auto_800586 ?auto_800596 ) ) ( not ( = ?auto_800586 ?auto_800597 ) ) ( not ( = ?auto_800586 ?auto_800598 ) ) ( not ( = ?auto_800586 ?auto_800599 ) ) ( not ( = ?auto_800586 ?auto_800600 ) ) ( not ( = ?auto_800586 ?auto_800601 ) ) ( not ( = ?auto_800587 ?auto_800588 ) ) ( not ( = ?auto_800587 ?auto_800589 ) ) ( not ( = ?auto_800587 ?auto_800590 ) ) ( not ( = ?auto_800587 ?auto_800591 ) ) ( not ( = ?auto_800587 ?auto_800592 ) ) ( not ( = ?auto_800587 ?auto_800593 ) ) ( not ( = ?auto_800587 ?auto_800594 ) ) ( not ( = ?auto_800587 ?auto_800595 ) ) ( not ( = ?auto_800587 ?auto_800596 ) ) ( not ( = ?auto_800587 ?auto_800597 ) ) ( not ( = ?auto_800587 ?auto_800598 ) ) ( not ( = ?auto_800587 ?auto_800599 ) ) ( not ( = ?auto_800587 ?auto_800600 ) ) ( not ( = ?auto_800587 ?auto_800601 ) ) ( not ( = ?auto_800588 ?auto_800589 ) ) ( not ( = ?auto_800588 ?auto_800590 ) ) ( not ( = ?auto_800588 ?auto_800591 ) ) ( not ( = ?auto_800588 ?auto_800592 ) ) ( not ( = ?auto_800588 ?auto_800593 ) ) ( not ( = ?auto_800588 ?auto_800594 ) ) ( not ( = ?auto_800588 ?auto_800595 ) ) ( not ( = ?auto_800588 ?auto_800596 ) ) ( not ( = ?auto_800588 ?auto_800597 ) ) ( not ( = ?auto_800588 ?auto_800598 ) ) ( not ( = ?auto_800588 ?auto_800599 ) ) ( not ( = ?auto_800588 ?auto_800600 ) ) ( not ( = ?auto_800588 ?auto_800601 ) ) ( not ( = ?auto_800589 ?auto_800590 ) ) ( not ( = ?auto_800589 ?auto_800591 ) ) ( not ( = ?auto_800589 ?auto_800592 ) ) ( not ( = ?auto_800589 ?auto_800593 ) ) ( not ( = ?auto_800589 ?auto_800594 ) ) ( not ( = ?auto_800589 ?auto_800595 ) ) ( not ( = ?auto_800589 ?auto_800596 ) ) ( not ( = ?auto_800589 ?auto_800597 ) ) ( not ( = ?auto_800589 ?auto_800598 ) ) ( not ( = ?auto_800589 ?auto_800599 ) ) ( not ( = ?auto_800589 ?auto_800600 ) ) ( not ( = ?auto_800589 ?auto_800601 ) ) ( not ( = ?auto_800590 ?auto_800591 ) ) ( not ( = ?auto_800590 ?auto_800592 ) ) ( not ( = ?auto_800590 ?auto_800593 ) ) ( not ( = ?auto_800590 ?auto_800594 ) ) ( not ( = ?auto_800590 ?auto_800595 ) ) ( not ( = ?auto_800590 ?auto_800596 ) ) ( not ( = ?auto_800590 ?auto_800597 ) ) ( not ( = ?auto_800590 ?auto_800598 ) ) ( not ( = ?auto_800590 ?auto_800599 ) ) ( not ( = ?auto_800590 ?auto_800600 ) ) ( not ( = ?auto_800590 ?auto_800601 ) ) ( not ( = ?auto_800591 ?auto_800592 ) ) ( not ( = ?auto_800591 ?auto_800593 ) ) ( not ( = ?auto_800591 ?auto_800594 ) ) ( not ( = ?auto_800591 ?auto_800595 ) ) ( not ( = ?auto_800591 ?auto_800596 ) ) ( not ( = ?auto_800591 ?auto_800597 ) ) ( not ( = ?auto_800591 ?auto_800598 ) ) ( not ( = ?auto_800591 ?auto_800599 ) ) ( not ( = ?auto_800591 ?auto_800600 ) ) ( not ( = ?auto_800591 ?auto_800601 ) ) ( not ( = ?auto_800592 ?auto_800593 ) ) ( not ( = ?auto_800592 ?auto_800594 ) ) ( not ( = ?auto_800592 ?auto_800595 ) ) ( not ( = ?auto_800592 ?auto_800596 ) ) ( not ( = ?auto_800592 ?auto_800597 ) ) ( not ( = ?auto_800592 ?auto_800598 ) ) ( not ( = ?auto_800592 ?auto_800599 ) ) ( not ( = ?auto_800592 ?auto_800600 ) ) ( not ( = ?auto_800592 ?auto_800601 ) ) ( not ( = ?auto_800593 ?auto_800594 ) ) ( not ( = ?auto_800593 ?auto_800595 ) ) ( not ( = ?auto_800593 ?auto_800596 ) ) ( not ( = ?auto_800593 ?auto_800597 ) ) ( not ( = ?auto_800593 ?auto_800598 ) ) ( not ( = ?auto_800593 ?auto_800599 ) ) ( not ( = ?auto_800593 ?auto_800600 ) ) ( not ( = ?auto_800593 ?auto_800601 ) ) ( not ( = ?auto_800594 ?auto_800595 ) ) ( not ( = ?auto_800594 ?auto_800596 ) ) ( not ( = ?auto_800594 ?auto_800597 ) ) ( not ( = ?auto_800594 ?auto_800598 ) ) ( not ( = ?auto_800594 ?auto_800599 ) ) ( not ( = ?auto_800594 ?auto_800600 ) ) ( not ( = ?auto_800594 ?auto_800601 ) ) ( not ( = ?auto_800595 ?auto_800596 ) ) ( not ( = ?auto_800595 ?auto_800597 ) ) ( not ( = ?auto_800595 ?auto_800598 ) ) ( not ( = ?auto_800595 ?auto_800599 ) ) ( not ( = ?auto_800595 ?auto_800600 ) ) ( not ( = ?auto_800595 ?auto_800601 ) ) ( not ( = ?auto_800596 ?auto_800597 ) ) ( not ( = ?auto_800596 ?auto_800598 ) ) ( not ( = ?auto_800596 ?auto_800599 ) ) ( not ( = ?auto_800596 ?auto_800600 ) ) ( not ( = ?auto_800596 ?auto_800601 ) ) ( not ( = ?auto_800597 ?auto_800598 ) ) ( not ( = ?auto_800597 ?auto_800599 ) ) ( not ( = ?auto_800597 ?auto_800600 ) ) ( not ( = ?auto_800597 ?auto_800601 ) ) ( not ( = ?auto_800598 ?auto_800599 ) ) ( not ( = ?auto_800598 ?auto_800600 ) ) ( not ( = ?auto_800598 ?auto_800601 ) ) ( not ( = ?auto_800599 ?auto_800600 ) ) ( not ( = ?auto_800599 ?auto_800601 ) ) ( not ( = ?auto_800600 ?auto_800601 ) ) ( ON ?auto_800599 ?auto_800600 ) ( ON ?auto_800598 ?auto_800599 ) ( ON ?auto_800597 ?auto_800598 ) ( ON ?auto_800596 ?auto_800597 ) ( ON ?auto_800595 ?auto_800596 ) ( ON ?auto_800594 ?auto_800595 ) ( ON ?auto_800593 ?auto_800594 ) ( ON ?auto_800592 ?auto_800593 ) ( CLEAR ?auto_800590 ) ( ON ?auto_800591 ?auto_800592 ) ( CLEAR ?auto_800591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_800583 ?auto_800584 ?auto_800585 ?auto_800586 ?auto_800587 ?auto_800588 ?auto_800589 ?auto_800590 ?auto_800591 )
      ( MAKE-18PILE ?auto_800583 ?auto_800584 ?auto_800585 ?auto_800586 ?auto_800587 ?auto_800588 ?auto_800589 ?auto_800590 ?auto_800591 ?auto_800592 ?auto_800593 ?auto_800594 ?auto_800595 ?auto_800596 ?auto_800597 ?auto_800598 ?auto_800599 ?auto_800600 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800620 - BLOCK
      ?auto_800621 - BLOCK
      ?auto_800622 - BLOCK
      ?auto_800623 - BLOCK
      ?auto_800624 - BLOCK
      ?auto_800625 - BLOCK
      ?auto_800626 - BLOCK
      ?auto_800627 - BLOCK
      ?auto_800628 - BLOCK
      ?auto_800629 - BLOCK
      ?auto_800630 - BLOCK
      ?auto_800631 - BLOCK
      ?auto_800632 - BLOCK
      ?auto_800633 - BLOCK
      ?auto_800634 - BLOCK
      ?auto_800635 - BLOCK
      ?auto_800636 - BLOCK
      ?auto_800637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_800637 ) ( ON-TABLE ?auto_800620 ) ( ON ?auto_800621 ?auto_800620 ) ( ON ?auto_800622 ?auto_800621 ) ( ON ?auto_800623 ?auto_800622 ) ( ON ?auto_800624 ?auto_800623 ) ( ON ?auto_800625 ?auto_800624 ) ( ON ?auto_800626 ?auto_800625 ) ( ON ?auto_800627 ?auto_800626 ) ( not ( = ?auto_800620 ?auto_800621 ) ) ( not ( = ?auto_800620 ?auto_800622 ) ) ( not ( = ?auto_800620 ?auto_800623 ) ) ( not ( = ?auto_800620 ?auto_800624 ) ) ( not ( = ?auto_800620 ?auto_800625 ) ) ( not ( = ?auto_800620 ?auto_800626 ) ) ( not ( = ?auto_800620 ?auto_800627 ) ) ( not ( = ?auto_800620 ?auto_800628 ) ) ( not ( = ?auto_800620 ?auto_800629 ) ) ( not ( = ?auto_800620 ?auto_800630 ) ) ( not ( = ?auto_800620 ?auto_800631 ) ) ( not ( = ?auto_800620 ?auto_800632 ) ) ( not ( = ?auto_800620 ?auto_800633 ) ) ( not ( = ?auto_800620 ?auto_800634 ) ) ( not ( = ?auto_800620 ?auto_800635 ) ) ( not ( = ?auto_800620 ?auto_800636 ) ) ( not ( = ?auto_800620 ?auto_800637 ) ) ( not ( = ?auto_800621 ?auto_800622 ) ) ( not ( = ?auto_800621 ?auto_800623 ) ) ( not ( = ?auto_800621 ?auto_800624 ) ) ( not ( = ?auto_800621 ?auto_800625 ) ) ( not ( = ?auto_800621 ?auto_800626 ) ) ( not ( = ?auto_800621 ?auto_800627 ) ) ( not ( = ?auto_800621 ?auto_800628 ) ) ( not ( = ?auto_800621 ?auto_800629 ) ) ( not ( = ?auto_800621 ?auto_800630 ) ) ( not ( = ?auto_800621 ?auto_800631 ) ) ( not ( = ?auto_800621 ?auto_800632 ) ) ( not ( = ?auto_800621 ?auto_800633 ) ) ( not ( = ?auto_800621 ?auto_800634 ) ) ( not ( = ?auto_800621 ?auto_800635 ) ) ( not ( = ?auto_800621 ?auto_800636 ) ) ( not ( = ?auto_800621 ?auto_800637 ) ) ( not ( = ?auto_800622 ?auto_800623 ) ) ( not ( = ?auto_800622 ?auto_800624 ) ) ( not ( = ?auto_800622 ?auto_800625 ) ) ( not ( = ?auto_800622 ?auto_800626 ) ) ( not ( = ?auto_800622 ?auto_800627 ) ) ( not ( = ?auto_800622 ?auto_800628 ) ) ( not ( = ?auto_800622 ?auto_800629 ) ) ( not ( = ?auto_800622 ?auto_800630 ) ) ( not ( = ?auto_800622 ?auto_800631 ) ) ( not ( = ?auto_800622 ?auto_800632 ) ) ( not ( = ?auto_800622 ?auto_800633 ) ) ( not ( = ?auto_800622 ?auto_800634 ) ) ( not ( = ?auto_800622 ?auto_800635 ) ) ( not ( = ?auto_800622 ?auto_800636 ) ) ( not ( = ?auto_800622 ?auto_800637 ) ) ( not ( = ?auto_800623 ?auto_800624 ) ) ( not ( = ?auto_800623 ?auto_800625 ) ) ( not ( = ?auto_800623 ?auto_800626 ) ) ( not ( = ?auto_800623 ?auto_800627 ) ) ( not ( = ?auto_800623 ?auto_800628 ) ) ( not ( = ?auto_800623 ?auto_800629 ) ) ( not ( = ?auto_800623 ?auto_800630 ) ) ( not ( = ?auto_800623 ?auto_800631 ) ) ( not ( = ?auto_800623 ?auto_800632 ) ) ( not ( = ?auto_800623 ?auto_800633 ) ) ( not ( = ?auto_800623 ?auto_800634 ) ) ( not ( = ?auto_800623 ?auto_800635 ) ) ( not ( = ?auto_800623 ?auto_800636 ) ) ( not ( = ?auto_800623 ?auto_800637 ) ) ( not ( = ?auto_800624 ?auto_800625 ) ) ( not ( = ?auto_800624 ?auto_800626 ) ) ( not ( = ?auto_800624 ?auto_800627 ) ) ( not ( = ?auto_800624 ?auto_800628 ) ) ( not ( = ?auto_800624 ?auto_800629 ) ) ( not ( = ?auto_800624 ?auto_800630 ) ) ( not ( = ?auto_800624 ?auto_800631 ) ) ( not ( = ?auto_800624 ?auto_800632 ) ) ( not ( = ?auto_800624 ?auto_800633 ) ) ( not ( = ?auto_800624 ?auto_800634 ) ) ( not ( = ?auto_800624 ?auto_800635 ) ) ( not ( = ?auto_800624 ?auto_800636 ) ) ( not ( = ?auto_800624 ?auto_800637 ) ) ( not ( = ?auto_800625 ?auto_800626 ) ) ( not ( = ?auto_800625 ?auto_800627 ) ) ( not ( = ?auto_800625 ?auto_800628 ) ) ( not ( = ?auto_800625 ?auto_800629 ) ) ( not ( = ?auto_800625 ?auto_800630 ) ) ( not ( = ?auto_800625 ?auto_800631 ) ) ( not ( = ?auto_800625 ?auto_800632 ) ) ( not ( = ?auto_800625 ?auto_800633 ) ) ( not ( = ?auto_800625 ?auto_800634 ) ) ( not ( = ?auto_800625 ?auto_800635 ) ) ( not ( = ?auto_800625 ?auto_800636 ) ) ( not ( = ?auto_800625 ?auto_800637 ) ) ( not ( = ?auto_800626 ?auto_800627 ) ) ( not ( = ?auto_800626 ?auto_800628 ) ) ( not ( = ?auto_800626 ?auto_800629 ) ) ( not ( = ?auto_800626 ?auto_800630 ) ) ( not ( = ?auto_800626 ?auto_800631 ) ) ( not ( = ?auto_800626 ?auto_800632 ) ) ( not ( = ?auto_800626 ?auto_800633 ) ) ( not ( = ?auto_800626 ?auto_800634 ) ) ( not ( = ?auto_800626 ?auto_800635 ) ) ( not ( = ?auto_800626 ?auto_800636 ) ) ( not ( = ?auto_800626 ?auto_800637 ) ) ( not ( = ?auto_800627 ?auto_800628 ) ) ( not ( = ?auto_800627 ?auto_800629 ) ) ( not ( = ?auto_800627 ?auto_800630 ) ) ( not ( = ?auto_800627 ?auto_800631 ) ) ( not ( = ?auto_800627 ?auto_800632 ) ) ( not ( = ?auto_800627 ?auto_800633 ) ) ( not ( = ?auto_800627 ?auto_800634 ) ) ( not ( = ?auto_800627 ?auto_800635 ) ) ( not ( = ?auto_800627 ?auto_800636 ) ) ( not ( = ?auto_800627 ?auto_800637 ) ) ( not ( = ?auto_800628 ?auto_800629 ) ) ( not ( = ?auto_800628 ?auto_800630 ) ) ( not ( = ?auto_800628 ?auto_800631 ) ) ( not ( = ?auto_800628 ?auto_800632 ) ) ( not ( = ?auto_800628 ?auto_800633 ) ) ( not ( = ?auto_800628 ?auto_800634 ) ) ( not ( = ?auto_800628 ?auto_800635 ) ) ( not ( = ?auto_800628 ?auto_800636 ) ) ( not ( = ?auto_800628 ?auto_800637 ) ) ( not ( = ?auto_800629 ?auto_800630 ) ) ( not ( = ?auto_800629 ?auto_800631 ) ) ( not ( = ?auto_800629 ?auto_800632 ) ) ( not ( = ?auto_800629 ?auto_800633 ) ) ( not ( = ?auto_800629 ?auto_800634 ) ) ( not ( = ?auto_800629 ?auto_800635 ) ) ( not ( = ?auto_800629 ?auto_800636 ) ) ( not ( = ?auto_800629 ?auto_800637 ) ) ( not ( = ?auto_800630 ?auto_800631 ) ) ( not ( = ?auto_800630 ?auto_800632 ) ) ( not ( = ?auto_800630 ?auto_800633 ) ) ( not ( = ?auto_800630 ?auto_800634 ) ) ( not ( = ?auto_800630 ?auto_800635 ) ) ( not ( = ?auto_800630 ?auto_800636 ) ) ( not ( = ?auto_800630 ?auto_800637 ) ) ( not ( = ?auto_800631 ?auto_800632 ) ) ( not ( = ?auto_800631 ?auto_800633 ) ) ( not ( = ?auto_800631 ?auto_800634 ) ) ( not ( = ?auto_800631 ?auto_800635 ) ) ( not ( = ?auto_800631 ?auto_800636 ) ) ( not ( = ?auto_800631 ?auto_800637 ) ) ( not ( = ?auto_800632 ?auto_800633 ) ) ( not ( = ?auto_800632 ?auto_800634 ) ) ( not ( = ?auto_800632 ?auto_800635 ) ) ( not ( = ?auto_800632 ?auto_800636 ) ) ( not ( = ?auto_800632 ?auto_800637 ) ) ( not ( = ?auto_800633 ?auto_800634 ) ) ( not ( = ?auto_800633 ?auto_800635 ) ) ( not ( = ?auto_800633 ?auto_800636 ) ) ( not ( = ?auto_800633 ?auto_800637 ) ) ( not ( = ?auto_800634 ?auto_800635 ) ) ( not ( = ?auto_800634 ?auto_800636 ) ) ( not ( = ?auto_800634 ?auto_800637 ) ) ( not ( = ?auto_800635 ?auto_800636 ) ) ( not ( = ?auto_800635 ?auto_800637 ) ) ( not ( = ?auto_800636 ?auto_800637 ) ) ( ON ?auto_800636 ?auto_800637 ) ( ON ?auto_800635 ?auto_800636 ) ( ON ?auto_800634 ?auto_800635 ) ( ON ?auto_800633 ?auto_800634 ) ( ON ?auto_800632 ?auto_800633 ) ( ON ?auto_800631 ?auto_800632 ) ( ON ?auto_800630 ?auto_800631 ) ( ON ?auto_800629 ?auto_800630 ) ( CLEAR ?auto_800627 ) ( ON ?auto_800628 ?auto_800629 ) ( CLEAR ?auto_800628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_800620 ?auto_800621 ?auto_800622 ?auto_800623 ?auto_800624 ?auto_800625 ?auto_800626 ?auto_800627 ?auto_800628 )
      ( MAKE-18PILE ?auto_800620 ?auto_800621 ?auto_800622 ?auto_800623 ?auto_800624 ?auto_800625 ?auto_800626 ?auto_800627 ?auto_800628 ?auto_800629 ?auto_800630 ?auto_800631 ?auto_800632 ?auto_800633 ?auto_800634 ?auto_800635 ?auto_800636 ?auto_800637 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800656 - BLOCK
      ?auto_800657 - BLOCK
      ?auto_800658 - BLOCK
      ?auto_800659 - BLOCK
      ?auto_800660 - BLOCK
      ?auto_800661 - BLOCK
      ?auto_800662 - BLOCK
      ?auto_800663 - BLOCK
      ?auto_800664 - BLOCK
      ?auto_800665 - BLOCK
      ?auto_800666 - BLOCK
      ?auto_800667 - BLOCK
      ?auto_800668 - BLOCK
      ?auto_800669 - BLOCK
      ?auto_800670 - BLOCK
      ?auto_800671 - BLOCK
      ?auto_800672 - BLOCK
      ?auto_800673 - BLOCK
    )
    :vars
    (
      ?auto_800674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_800673 ?auto_800674 ) ( ON-TABLE ?auto_800656 ) ( ON ?auto_800657 ?auto_800656 ) ( ON ?auto_800658 ?auto_800657 ) ( ON ?auto_800659 ?auto_800658 ) ( ON ?auto_800660 ?auto_800659 ) ( ON ?auto_800661 ?auto_800660 ) ( ON ?auto_800662 ?auto_800661 ) ( not ( = ?auto_800656 ?auto_800657 ) ) ( not ( = ?auto_800656 ?auto_800658 ) ) ( not ( = ?auto_800656 ?auto_800659 ) ) ( not ( = ?auto_800656 ?auto_800660 ) ) ( not ( = ?auto_800656 ?auto_800661 ) ) ( not ( = ?auto_800656 ?auto_800662 ) ) ( not ( = ?auto_800656 ?auto_800663 ) ) ( not ( = ?auto_800656 ?auto_800664 ) ) ( not ( = ?auto_800656 ?auto_800665 ) ) ( not ( = ?auto_800656 ?auto_800666 ) ) ( not ( = ?auto_800656 ?auto_800667 ) ) ( not ( = ?auto_800656 ?auto_800668 ) ) ( not ( = ?auto_800656 ?auto_800669 ) ) ( not ( = ?auto_800656 ?auto_800670 ) ) ( not ( = ?auto_800656 ?auto_800671 ) ) ( not ( = ?auto_800656 ?auto_800672 ) ) ( not ( = ?auto_800656 ?auto_800673 ) ) ( not ( = ?auto_800656 ?auto_800674 ) ) ( not ( = ?auto_800657 ?auto_800658 ) ) ( not ( = ?auto_800657 ?auto_800659 ) ) ( not ( = ?auto_800657 ?auto_800660 ) ) ( not ( = ?auto_800657 ?auto_800661 ) ) ( not ( = ?auto_800657 ?auto_800662 ) ) ( not ( = ?auto_800657 ?auto_800663 ) ) ( not ( = ?auto_800657 ?auto_800664 ) ) ( not ( = ?auto_800657 ?auto_800665 ) ) ( not ( = ?auto_800657 ?auto_800666 ) ) ( not ( = ?auto_800657 ?auto_800667 ) ) ( not ( = ?auto_800657 ?auto_800668 ) ) ( not ( = ?auto_800657 ?auto_800669 ) ) ( not ( = ?auto_800657 ?auto_800670 ) ) ( not ( = ?auto_800657 ?auto_800671 ) ) ( not ( = ?auto_800657 ?auto_800672 ) ) ( not ( = ?auto_800657 ?auto_800673 ) ) ( not ( = ?auto_800657 ?auto_800674 ) ) ( not ( = ?auto_800658 ?auto_800659 ) ) ( not ( = ?auto_800658 ?auto_800660 ) ) ( not ( = ?auto_800658 ?auto_800661 ) ) ( not ( = ?auto_800658 ?auto_800662 ) ) ( not ( = ?auto_800658 ?auto_800663 ) ) ( not ( = ?auto_800658 ?auto_800664 ) ) ( not ( = ?auto_800658 ?auto_800665 ) ) ( not ( = ?auto_800658 ?auto_800666 ) ) ( not ( = ?auto_800658 ?auto_800667 ) ) ( not ( = ?auto_800658 ?auto_800668 ) ) ( not ( = ?auto_800658 ?auto_800669 ) ) ( not ( = ?auto_800658 ?auto_800670 ) ) ( not ( = ?auto_800658 ?auto_800671 ) ) ( not ( = ?auto_800658 ?auto_800672 ) ) ( not ( = ?auto_800658 ?auto_800673 ) ) ( not ( = ?auto_800658 ?auto_800674 ) ) ( not ( = ?auto_800659 ?auto_800660 ) ) ( not ( = ?auto_800659 ?auto_800661 ) ) ( not ( = ?auto_800659 ?auto_800662 ) ) ( not ( = ?auto_800659 ?auto_800663 ) ) ( not ( = ?auto_800659 ?auto_800664 ) ) ( not ( = ?auto_800659 ?auto_800665 ) ) ( not ( = ?auto_800659 ?auto_800666 ) ) ( not ( = ?auto_800659 ?auto_800667 ) ) ( not ( = ?auto_800659 ?auto_800668 ) ) ( not ( = ?auto_800659 ?auto_800669 ) ) ( not ( = ?auto_800659 ?auto_800670 ) ) ( not ( = ?auto_800659 ?auto_800671 ) ) ( not ( = ?auto_800659 ?auto_800672 ) ) ( not ( = ?auto_800659 ?auto_800673 ) ) ( not ( = ?auto_800659 ?auto_800674 ) ) ( not ( = ?auto_800660 ?auto_800661 ) ) ( not ( = ?auto_800660 ?auto_800662 ) ) ( not ( = ?auto_800660 ?auto_800663 ) ) ( not ( = ?auto_800660 ?auto_800664 ) ) ( not ( = ?auto_800660 ?auto_800665 ) ) ( not ( = ?auto_800660 ?auto_800666 ) ) ( not ( = ?auto_800660 ?auto_800667 ) ) ( not ( = ?auto_800660 ?auto_800668 ) ) ( not ( = ?auto_800660 ?auto_800669 ) ) ( not ( = ?auto_800660 ?auto_800670 ) ) ( not ( = ?auto_800660 ?auto_800671 ) ) ( not ( = ?auto_800660 ?auto_800672 ) ) ( not ( = ?auto_800660 ?auto_800673 ) ) ( not ( = ?auto_800660 ?auto_800674 ) ) ( not ( = ?auto_800661 ?auto_800662 ) ) ( not ( = ?auto_800661 ?auto_800663 ) ) ( not ( = ?auto_800661 ?auto_800664 ) ) ( not ( = ?auto_800661 ?auto_800665 ) ) ( not ( = ?auto_800661 ?auto_800666 ) ) ( not ( = ?auto_800661 ?auto_800667 ) ) ( not ( = ?auto_800661 ?auto_800668 ) ) ( not ( = ?auto_800661 ?auto_800669 ) ) ( not ( = ?auto_800661 ?auto_800670 ) ) ( not ( = ?auto_800661 ?auto_800671 ) ) ( not ( = ?auto_800661 ?auto_800672 ) ) ( not ( = ?auto_800661 ?auto_800673 ) ) ( not ( = ?auto_800661 ?auto_800674 ) ) ( not ( = ?auto_800662 ?auto_800663 ) ) ( not ( = ?auto_800662 ?auto_800664 ) ) ( not ( = ?auto_800662 ?auto_800665 ) ) ( not ( = ?auto_800662 ?auto_800666 ) ) ( not ( = ?auto_800662 ?auto_800667 ) ) ( not ( = ?auto_800662 ?auto_800668 ) ) ( not ( = ?auto_800662 ?auto_800669 ) ) ( not ( = ?auto_800662 ?auto_800670 ) ) ( not ( = ?auto_800662 ?auto_800671 ) ) ( not ( = ?auto_800662 ?auto_800672 ) ) ( not ( = ?auto_800662 ?auto_800673 ) ) ( not ( = ?auto_800662 ?auto_800674 ) ) ( not ( = ?auto_800663 ?auto_800664 ) ) ( not ( = ?auto_800663 ?auto_800665 ) ) ( not ( = ?auto_800663 ?auto_800666 ) ) ( not ( = ?auto_800663 ?auto_800667 ) ) ( not ( = ?auto_800663 ?auto_800668 ) ) ( not ( = ?auto_800663 ?auto_800669 ) ) ( not ( = ?auto_800663 ?auto_800670 ) ) ( not ( = ?auto_800663 ?auto_800671 ) ) ( not ( = ?auto_800663 ?auto_800672 ) ) ( not ( = ?auto_800663 ?auto_800673 ) ) ( not ( = ?auto_800663 ?auto_800674 ) ) ( not ( = ?auto_800664 ?auto_800665 ) ) ( not ( = ?auto_800664 ?auto_800666 ) ) ( not ( = ?auto_800664 ?auto_800667 ) ) ( not ( = ?auto_800664 ?auto_800668 ) ) ( not ( = ?auto_800664 ?auto_800669 ) ) ( not ( = ?auto_800664 ?auto_800670 ) ) ( not ( = ?auto_800664 ?auto_800671 ) ) ( not ( = ?auto_800664 ?auto_800672 ) ) ( not ( = ?auto_800664 ?auto_800673 ) ) ( not ( = ?auto_800664 ?auto_800674 ) ) ( not ( = ?auto_800665 ?auto_800666 ) ) ( not ( = ?auto_800665 ?auto_800667 ) ) ( not ( = ?auto_800665 ?auto_800668 ) ) ( not ( = ?auto_800665 ?auto_800669 ) ) ( not ( = ?auto_800665 ?auto_800670 ) ) ( not ( = ?auto_800665 ?auto_800671 ) ) ( not ( = ?auto_800665 ?auto_800672 ) ) ( not ( = ?auto_800665 ?auto_800673 ) ) ( not ( = ?auto_800665 ?auto_800674 ) ) ( not ( = ?auto_800666 ?auto_800667 ) ) ( not ( = ?auto_800666 ?auto_800668 ) ) ( not ( = ?auto_800666 ?auto_800669 ) ) ( not ( = ?auto_800666 ?auto_800670 ) ) ( not ( = ?auto_800666 ?auto_800671 ) ) ( not ( = ?auto_800666 ?auto_800672 ) ) ( not ( = ?auto_800666 ?auto_800673 ) ) ( not ( = ?auto_800666 ?auto_800674 ) ) ( not ( = ?auto_800667 ?auto_800668 ) ) ( not ( = ?auto_800667 ?auto_800669 ) ) ( not ( = ?auto_800667 ?auto_800670 ) ) ( not ( = ?auto_800667 ?auto_800671 ) ) ( not ( = ?auto_800667 ?auto_800672 ) ) ( not ( = ?auto_800667 ?auto_800673 ) ) ( not ( = ?auto_800667 ?auto_800674 ) ) ( not ( = ?auto_800668 ?auto_800669 ) ) ( not ( = ?auto_800668 ?auto_800670 ) ) ( not ( = ?auto_800668 ?auto_800671 ) ) ( not ( = ?auto_800668 ?auto_800672 ) ) ( not ( = ?auto_800668 ?auto_800673 ) ) ( not ( = ?auto_800668 ?auto_800674 ) ) ( not ( = ?auto_800669 ?auto_800670 ) ) ( not ( = ?auto_800669 ?auto_800671 ) ) ( not ( = ?auto_800669 ?auto_800672 ) ) ( not ( = ?auto_800669 ?auto_800673 ) ) ( not ( = ?auto_800669 ?auto_800674 ) ) ( not ( = ?auto_800670 ?auto_800671 ) ) ( not ( = ?auto_800670 ?auto_800672 ) ) ( not ( = ?auto_800670 ?auto_800673 ) ) ( not ( = ?auto_800670 ?auto_800674 ) ) ( not ( = ?auto_800671 ?auto_800672 ) ) ( not ( = ?auto_800671 ?auto_800673 ) ) ( not ( = ?auto_800671 ?auto_800674 ) ) ( not ( = ?auto_800672 ?auto_800673 ) ) ( not ( = ?auto_800672 ?auto_800674 ) ) ( not ( = ?auto_800673 ?auto_800674 ) ) ( ON ?auto_800672 ?auto_800673 ) ( ON ?auto_800671 ?auto_800672 ) ( ON ?auto_800670 ?auto_800671 ) ( ON ?auto_800669 ?auto_800670 ) ( ON ?auto_800668 ?auto_800669 ) ( ON ?auto_800667 ?auto_800668 ) ( ON ?auto_800666 ?auto_800667 ) ( ON ?auto_800665 ?auto_800666 ) ( ON ?auto_800664 ?auto_800665 ) ( CLEAR ?auto_800662 ) ( ON ?auto_800663 ?auto_800664 ) ( CLEAR ?auto_800663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_800656 ?auto_800657 ?auto_800658 ?auto_800659 ?auto_800660 ?auto_800661 ?auto_800662 ?auto_800663 )
      ( MAKE-18PILE ?auto_800656 ?auto_800657 ?auto_800658 ?auto_800659 ?auto_800660 ?auto_800661 ?auto_800662 ?auto_800663 ?auto_800664 ?auto_800665 ?auto_800666 ?auto_800667 ?auto_800668 ?auto_800669 ?auto_800670 ?auto_800671 ?auto_800672 ?auto_800673 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800693 - BLOCK
      ?auto_800694 - BLOCK
      ?auto_800695 - BLOCK
      ?auto_800696 - BLOCK
      ?auto_800697 - BLOCK
      ?auto_800698 - BLOCK
      ?auto_800699 - BLOCK
      ?auto_800700 - BLOCK
      ?auto_800701 - BLOCK
      ?auto_800702 - BLOCK
      ?auto_800703 - BLOCK
      ?auto_800704 - BLOCK
      ?auto_800705 - BLOCK
      ?auto_800706 - BLOCK
      ?auto_800707 - BLOCK
      ?auto_800708 - BLOCK
      ?auto_800709 - BLOCK
      ?auto_800710 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_800710 ) ( ON-TABLE ?auto_800693 ) ( ON ?auto_800694 ?auto_800693 ) ( ON ?auto_800695 ?auto_800694 ) ( ON ?auto_800696 ?auto_800695 ) ( ON ?auto_800697 ?auto_800696 ) ( ON ?auto_800698 ?auto_800697 ) ( ON ?auto_800699 ?auto_800698 ) ( not ( = ?auto_800693 ?auto_800694 ) ) ( not ( = ?auto_800693 ?auto_800695 ) ) ( not ( = ?auto_800693 ?auto_800696 ) ) ( not ( = ?auto_800693 ?auto_800697 ) ) ( not ( = ?auto_800693 ?auto_800698 ) ) ( not ( = ?auto_800693 ?auto_800699 ) ) ( not ( = ?auto_800693 ?auto_800700 ) ) ( not ( = ?auto_800693 ?auto_800701 ) ) ( not ( = ?auto_800693 ?auto_800702 ) ) ( not ( = ?auto_800693 ?auto_800703 ) ) ( not ( = ?auto_800693 ?auto_800704 ) ) ( not ( = ?auto_800693 ?auto_800705 ) ) ( not ( = ?auto_800693 ?auto_800706 ) ) ( not ( = ?auto_800693 ?auto_800707 ) ) ( not ( = ?auto_800693 ?auto_800708 ) ) ( not ( = ?auto_800693 ?auto_800709 ) ) ( not ( = ?auto_800693 ?auto_800710 ) ) ( not ( = ?auto_800694 ?auto_800695 ) ) ( not ( = ?auto_800694 ?auto_800696 ) ) ( not ( = ?auto_800694 ?auto_800697 ) ) ( not ( = ?auto_800694 ?auto_800698 ) ) ( not ( = ?auto_800694 ?auto_800699 ) ) ( not ( = ?auto_800694 ?auto_800700 ) ) ( not ( = ?auto_800694 ?auto_800701 ) ) ( not ( = ?auto_800694 ?auto_800702 ) ) ( not ( = ?auto_800694 ?auto_800703 ) ) ( not ( = ?auto_800694 ?auto_800704 ) ) ( not ( = ?auto_800694 ?auto_800705 ) ) ( not ( = ?auto_800694 ?auto_800706 ) ) ( not ( = ?auto_800694 ?auto_800707 ) ) ( not ( = ?auto_800694 ?auto_800708 ) ) ( not ( = ?auto_800694 ?auto_800709 ) ) ( not ( = ?auto_800694 ?auto_800710 ) ) ( not ( = ?auto_800695 ?auto_800696 ) ) ( not ( = ?auto_800695 ?auto_800697 ) ) ( not ( = ?auto_800695 ?auto_800698 ) ) ( not ( = ?auto_800695 ?auto_800699 ) ) ( not ( = ?auto_800695 ?auto_800700 ) ) ( not ( = ?auto_800695 ?auto_800701 ) ) ( not ( = ?auto_800695 ?auto_800702 ) ) ( not ( = ?auto_800695 ?auto_800703 ) ) ( not ( = ?auto_800695 ?auto_800704 ) ) ( not ( = ?auto_800695 ?auto_800705 ) ) ( not ( = ?auto_800695 ?auto_800706 ) ) ( not ( = ?auto_800695 ?auto_800707 ) ) ( not ( = ?auto_800695 ?auto_800708 ) ) ( not ( = ?auto_800695 ?auto_800709 ) ) ( not ( = ?auto_800695 ?auto_800710 ) ) ( not ( = ?auto_800696 ?auto_800697 ) ) ( not ( = ?auto_800696 ?auto_800698 ) ) ( not ( = ?auto_800696 ?auto_800699 ) ) ( not ( = ?auto_800696 ?auto_800700 ) ) ( not ( = ?auto_800696 ?auto_800701 ) ) ( not ( = ?auto_800696 ?auto_800702 ) ) ( not ( = ?auto_800696 ?auto_800703 ) ) ( not ( = ?auto_800696 ?auto_800704 ) ) ( not ( = ?auto_800696 ?auto_800705 ) ) ( not ( = ?auto_800696 ?auto_800706 ) ) ( not ( = ?auto_800696 ?auto_800707 ) ) ( not ( = ?auto_800696 ?auto_800708 ) ) ( not ( = ?auto_800696 ?auto_800709 ) ) ( not ( = ?auto_800696 ?auto_800710 ) ) ( not ( = ?auto_800697 ?auto_800698 ) ) ( not ( = ?auto_800697 ?auto_800699 ) ) ( not ( = ?auto_800697 ?auto_800700 ) ) ( not ( = ?auto_800697 ?auto_800701 ) ) ( not ( = ?auto_800697 ?auto_800702 ) ) ( not ( = ?auto_800697 ?auto_800703 ) ) ( not ( = ?auto_800697 ?auto_800704 ) ) ( not ( = ?auto_800697 ?auto_800705 ) ) ( not ( = ?auto_800697 ?auto_800706 ) ) ( not ( = ?auto_800697 ?auto_800707 ) ) ( not ( = ?auto_800697 ?auto_800708 ) ) ( not ( = ?auto_800697 ?auto_800709 ) ) ( not ( = ?auto_800697 ?auto_800710 ) ) ( not ( = ?auto_800698 ?auto_800699 ) ) ( not ( = ?auto_800698 ?auto_800700 ) ) ( not ( = ?auto_800698 ?auto_800701 ) ) ( not ( = ?auto_800698 ?auto_800702 ) ) ( not ( = ?auto_800698 ?auto_800703 ) ) ( not ( = ?auto_800698 ?auto_800704 ) ) ( not ( = ?auto_800698 ?auto_800705 ) ) ( not ( = ?auto_800698 ?auto_800706 ) ) ( not ( = ?auto_800698 ?auto_800707 ) ) ( not ( = ?auto_800698 ?auto_800708 ) ) ( not ( = ?auto_800698 ?auto_800709 ) ) ( not ( = ?auto_800698 ?auto_800710 ) ) ( not ( = ?auto_800699 ?auto_800700 ) ) ( not ( = ?auto_800699 ?auto_800701 ) ) ( not ( = ?auto_800699 ?auto_800702 ) ) ( not ( = ?auto_800699 ?auto_800703 ) ) ( not ( = ?auto_800699 ?auto_800704 ) ) ( not ( = ?auto_800699 ?auto_800705 ) ) ( not ( = ?auto_800699 ?auto_800706 ) ) ( not ( = ?auto_800699 ?auto_800707 ) ) ( not ( = ?auto_800699 ?auto_800708 ) ) ( not ( = ?auto_800699 ?auto_800709 ) ) ( not ( = ?auto_800699 ?auto_800710 ) ) ( not ( = ?auto_800700 ?auto_800701 ) ) ( not ( = ?auto_800700 ?auto_800702 ) ) ( not ( = ?auto_800700 ?auto_800703 ) ) ( not ( = ?auto_800700 ?auto_800704 ) ) ( not ( = ?auto_800700 ?auto_800705 ) ) ( not ( = ?auto_800700 ?auto_800706 ) ) ( not ( = ?auto_800700 ?auto_800707 ) ) ( not ( = ?auto_800700 ?auto_800708 ) ) ( not ( = ?auto_800700 ?auto_800709 ) ) ( not ( = ?auto_800700 ?auto_800710 ) ) ( not ( = ?auto_800701 ?auto_800702 ) ) ( not ( = ?auto_800701 ?auto_800703 ) ) ( not ( = ?auto_800701 ?auto_800704 ) ) ( not ( = ?auto_800701 ?auto_800705 ) ) ( not ( = ?auto_800701 ?auto_800706 ) ) ( not ( = ?auto_800701 ?auto_800707 ) ) ( not ( = ?auto_800701 ?auto_800708 ) ) ( not ( = ?auto_800701 ?auto_800709 ) ) ( not ( = ?auto_800701 ?auto_800710 ) ) ( not ( = ?auto_800702 ?auto_800703 ) ) ( not ( = ?auto_800702 ?auto_800704 ) ) ( not ( = ?auto_800702 ?auto_800705 ) ) ( not ( = ?auto_800702 ?auto_800706 ) ) ( not ( = ?auto_800702 ?auto_800707 ) ) ( not ( = ?auto_800702 ?auto_800708 ) ) ( not ( = ?auto_800702 ?auto_800709 ) ) ( not ( = ?auto_800702 ?auto_800710 ) ) ( not ( = ?auto_800703 ?auto_800704 ) ) ( not ( = ?auto_800703 ?auto_800705 ) ) ( not ( = ?auto_800703 ?auto_800706 ) ) ( not ( = ?auto_800703 ?auto_800707 ) ) ( not ( = ?auto_800703 ?auto_800708 ) ) ( not ( = ?auto_800703 ?auto_800709 ) ) ( not ( = ?auto_800703 ?auto_800710 ) ) ( not ( = ?auto_800704 ?auto_800705 ) ) ( not ( = ?auto_800704 ?auto_800706 ) ) ( not ( = ?auto_800704 ?auto_800707 ) ) ( not ( = ?auto_800704 ?auto_800708 ) ) ( not ( = ?auto_800704 ?auto_800709 ) ) ( not ( = ?auto_800704 ?auto_800710 ) ) ( not ( = ?auto_800705 ?auto_800706 ) ) ( not ( = ?auto_800705 ?auto_800707 ) ) ( not ( = ?auto_800705 ?auto_800708 ) ) ( not ( = ?auto_800705 ?auto_800709 ) ) ( not ( = ?auto_800705 ?auto_800710 ) ) ( not ( = ?auto_800706 ?auto_800707 ) ) ( not ( = ?auto_800706 ?auto_800708 ) ) ( not ( = ?auto_800706 ?auto_800709 ) ) ( not ( = ?auto_800706 ?auto_800710 ) ) ( not ( = ?auto_800707 ?auto_800708 ) ) ( not ( = ?auto_800707 ?auto_800709 ) ) ( not ( = ?auto_800707 ?auto_800710 ) ) ( not ( = ?auto_800708 ?auto_800709 ) ) ( not ( = ?auto_800708 ?auto_800710 ) ) ( not ( = ?auto_800709 ?auto_800710 ) ) ( ON ?auto_800709 ?auto_800710 ) ( ON ?auto_800708 ?auto_800709 ) ( ON ?auto_800707 ?auto_800708 ) ( ON ?auto_800706 ?auto_800707 ) ( ON ?auto_800705 ?auto_800706 ) ( ON ?auto_800704 ?auto_800705 ) ( ON ?auto_800703 ?auto_800704 ) ( ON ?auto_800702 ?auto_800703 ) ( ON ?auto_800701 ?auto_800702 ) ( CLEAR ?auto_800699 ) ( ON ?auto_800700 ?auto_800701 ) ( CLEAR ?auto_800700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_800693 ?auto_800694 ?auto_800695 ?auto_800696 ?auto_800697 ?auto_800698 ?auto_800699 ?auto_800700 )
      ( MAKE-18PILE ?auto_800693 ?auto_800694 ?auto_800695 ?auto_800696 ?auto_800697 ?auto_800698 ?auto_800699 ?auto_800700 ?auto_800701 ?auto_800702 ?auto_800703 ?auto_800704 ?auto_800705 ?auto_800706 ?auto_800707 ?auto_800708 ?auto_800709 ?auto_800710 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800729 - BLOCK
      ?auto_800730 - BLOCK
      ?auto_800731 - BLOCK
      ?auto_800732 - BLOCK
      ?auto_800733 - BLOCK
      ?auto_800734 - BLOCK
      ?auto_800735 - BLOCK
      ?auto_800736 - BLOCK
      ?auto_800737 - BLOCK
      ?auto_800738 - BLOCK
      ?auto_800739 - BLOCK
      ?auto_800740 - BLOCK
      ?auto_800741 - BLOCK
      ?auto_800742 - BLOCK
      ?auto_800743 - BLOCK
      ?auto_800744 - BLOCK
      ?auto_800745 - BLOCK
      ?auto_800746 - BLOCK
    )
    :vars
    (
      ?auto_800747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_800746 ?auto_800747 ) ( ON-TABLE ?auto_800729 ) ( ON ?auto_800730 ?auto_800729 ) ( ON ?auto_800731 ?auto_800730 ) ( ON ?auto_800732 ?auto_800731 ) ( ON ?auto_800733 ?auto_800732 ) ( ON ?auto_800734 ?auto_800733 ) ( not ( = ?auto_800729 ?auto_800730 ) ) ( not ( = ?auto_800729 ?auto_800731 ) ) ( not ( = ?auto_800729 ?auto_800732 ) ) ( not ( = ?auto_800729 ?auto_800733 ) ) ( not ( = ?auto_800729 ?auto_800734 ) ) ( not ( = ?auto_800729 ?auto_800735 ) ) ( not ( = ?auto_800729 ?auto_800736 ) ) ( not ( = ?auto_800729 ?auto_800737 ) ) ( not ( = ?auto_800729 ?auto_800738 ) ) ( not ( = ?auto_800729 ?auto_800739 ) ) ( not ( = ?auto_800729 ?auto_800740 ) ) ( not ( = ?auto_800729 ?auto_800741 ) ) ( not ( = ?auto_800729 ?auto_800742 ) ) ( not ( = ?auto_800729 ?auto_800743 ) ) ( not ( = ?auto_800729 ?auto_800744 ) ) ( not ( = ?auto_800729 ?auto_800745 ) ) ( not ( = ?auto_800729 ?auto_800746 ) ) ( not ( = ?auto_800729 ?auto_800747 ) ) ( not ( = ?auto_800730 ?auto_800731 ) ) ( not ( = ?auto_800730 ?auto_800732 ) ) ( not ( = ?auto_800730 ?auto_800733 ) ) ( not ( = ?auto_800730 ?auto_800734 ) ) ( not ( = ?auto_800730 ?auto_800735 ) ) ( not ( = ?auto_800730 ?auto_800736 ) ) ( not ( = ?auto_800730 ?auto_800737 ) ) ( not ( = ?auto_800730 ?auto_800738 ) ) ( not ( = ?auto_800730 ?auto_800739 ) ) ( not ( = ?auto_800730 ?auto_800740 ) ) ( not ( = ?auto_800730 ?auto_800741 ) ) ( not ( = ?auto_800730 ?auto_800742 ) ) ( not ( = ?auto_800730 ?auto_800743 ) ) ( not ( = ?auto_800730 ?auto_800744 ) ) ( not ( = ?auto_800730 ?auto_800745 ) ) ( not ( = ?auto_800730 ?auto_800746 ) ) ( not ( = ?auto_800730 ?auto_800747 ) ) ( not ( = ?auto_800731 ?auto_800732 ) ) ( not ( = ?auto_800731 ?auto_800733 ) ) ( not ( = ?auto_800731 ?auto_800734 ) ) ( not ( = ?auto_800731 ?auto_800735 ) ) ( not ( = ?auto_800731 ?auto_800736 ) ) ( not ( = ?auto_800731 ?auto_800737 ) ) ( not ( = ?auto_800731 ?auto_800738 ) ) ( not ( = ?auto_800731 ?auto_800739 ) ) ( not ( = ?auto_800731 ?auto_800740 ) ) ( not ( = ?auto_800731 ?auto_800741 ) ) ( not ( = ?auto_800731 ?auto_800742 ) ) ( not ( = ?auto_800731 ?auto_800743 ) ) ( not ( = ?auto_800731 ?auto_800744 ) ) ( not ( = ?auto_800731 ?auto_800745 ) ) ( not ( = ?auto_800731 ?auto_800746 ) ) ( not ( = ?auto_800731 ?auto_800747 ) ) ( not ( = ?auto_800732 ?auto_800733 ) ) ( not ( = ?auto_800732 ?auto_800734 ) ) ( not ( = ?auto_800732 ?auto_800735 ) ) ( not ( = ?auto_800732 ?auto_800736 ) ) ( not ( = ?auto_800732 ?auto_800737 ) ) ( not ( = ?auto_800732 ?auto_800738 ) ) ( not ( = ?auto_800732 ?auto_800739 ) ) ( not ( = ?auto_800732 ?auto_800740 ) ) ( not ( = ?auto_800732 ?auto_800741 ) ) ( not ( = ?auto_800732 ?auto_800742 ) ) ( not ( = ?auto_800732 ?auto_800743 ) ) ( not ( = ?auto_800732 ?auto_800744 ) ) ( not ( = ?auto_800732 ?auto_800745 ) ) ( not ( = ?auto_800732 ?auto_800746 ) ) ( not ( = ?auto_800732 ?auto_800747 ) ) ( not ( = ?auto_800733 ?auto_800734 ) ) ( not ( = ?auto_800733 ?auto_800735 ) ) ( not ( = ?auto_800733 ?auto_800736 ) ) ( not ( = ?auto_800733 ?auto_800737 ) ) ( not ( = ?auto_800733 ?auto_800738 ) ) ( not ( = ?auto_800733 ?auto_800739 ) ) ( not ( = ?auto_800733 ?auto_800740 ) ) ( not ( = ?auto_800733 ?auto_800741 ) ) ( not ( = ?auto_800733 ?auto_800742 ) ) ( not ( = ?auto_800733 ?auto_800743 ) ) ( not ( = ?auto_800733 ?auto_800744 ) ) ( not ( = ?auto_800733 ?auto_800745 ) ) ( not ( = ?auto_800733 ?auto_800746 ) ) ( not ( = ?auto_800733 ?auto_800747 ) ) ( not ( = ?auto_800734 ?auto_800735 ) ) ( not ( = ?auto_800734 ?auto_800736 ) ) ( not ( = ?auto_800734 ?auto_800737 ) ) ( not ( = ?auto_800734 ?auto_800738 ) ) ( not ( = ?auto_800734 ?auto_800739 ) ) ( not ( = ?auto_800734 ?auto_800740 ) ) ( not ( = ?auto_800734 ?auto_800741 ) ) ( not ( = ?auto_800734 ?auto_800742 ) ) ( not ( = ?auto_800734 ?auto_800743 ) ) ( not ( = ?auto_800734 ?auto_800744 ) ) ( not ( = ?auto_800734 ?auto_800745 ) ) ( not ( = ?auto_800734 ?auto_800746 ) ) ( not ( = ?auto_800734 ?auto_800747 ) ) ( not ( = ?auto_800735 ?auto_800736 ) ) ( not ( = ?auto_800735 ?auto_800737 ) ) ( not ( = ?auto_800735 ?auto_800738 ) ) ( not ( = ?auto_800735 ?auto_800739 ) ) ( not ( = ?auto_800735 ?auto_800740 ) ) ( not ( = ?auto_800735 ?auto_800741 ) ) ( not ( = ?auto_800735 ?auto_800742 ) ) ( not ( = ?auto_800735 ?auto_800743 ) ) ( not ( = ?auto_800735 ?auto_800744 ) ) ( not ( = ?auto_800735 ?auto_800745 ) ) ( not ( = ?auto_800735 ?auto_800746 ) ) ( not ( = ?auto_800735 ?auto_800747 ) ) ( not ( = ?auto_800736 ?auto_800737 ) ) ( not ( = ?auto_800736 ?auto_800738 ) ) ( not ( = ?auto_800736 ?auto_800739 ) ) ( not ( = ?auto_800736 ?auto_800740 ) ) ( not ( = ?auto_800736 ?auto_800741 ) ) ( not ( = ?auto_800736 ?auto_800742 ) ) ( not ( = ?auto_800736 ?auto_800743 ) ) ( not ( = ?auto_800736 ?auto_800744 ) ) ( not ( = ?auto_800736 ?auto_800745 ) ) ( not ( = ?auto_800736 ?auto_800746 ) ) ( not ( = ?auto_800736 ?auto_800747 ) ) ( not ( = ?auto_800737 ?auto_800738 ) ) ( not ( = ?auto_800737 ?auto_800739 ) ) ( not ( = ?auto_800737 ?auto_800740 ) ) ( not ( = ?auto_800737 ?auto_800741 ) ) ( not ( = ?auto_800737 ?auto_800742 ) ) ( not ( = ?auto_800737 ?auto_800743 ) ) ( not ( = ?auto_800737 ?auto_800744 ) ) ( not ( = ?auto_800737 ?auto_800745 ) ) ( not ( = ?auto_800737 ?auto_800746 ) ) ( not ( = ?auto_800737 ?auto_800747 ) ) ( not ( = ?auto_800738 ?auto_800739 ) ) ( not ( = ?auto_800738 ?auto_800740 ) ) ( not ( = ?auto_800738 ?auto_800741 ) ) ( not ( = ?auto_800738 ?auto_800742 ) ) ( not ( = ?auto_800738 ?auto_800743 ) ) ( not ( = ?auto_800738 ?auto_800744 ) ) ( not ( = ?auto_800738 ?auto_800745 ) ) ( not ( = ?auto_800738 ?auto_800746 ) ) ( not ( = ?auto_800738 ?auto_800747 ) ) ( not ( = ?auto_800739 ?auto_800740 ) ) ( not ( = ?auto_800739 ?auto_800741 ) ) ( not ( = ?auto_800739 ?auto_800742 ) ) ( not ( = ?auto_800739 ?auto_800743 ) ) ( not ( = ?auto_800739 ?auto_800744 ) ) ( not ( = ?auto_800739 ?auto_800745 ) ) ( not ( = ?auto_800739 ?auto_800746 ) ) ( not ( = ?auto_800739 ?auto_800747 ) ) ( not ( = ?auto_800740 ?auto_800741 ) ) ( not ( = ?auto_800740 ?auto_800742 ) ) ( not ( = ?auto_800740 ?auto_800743 ) ) ( not ( = ?auto_800740 ?auto_800744 ) ) ( not ( = ?auto_800740 ?auto_800745 ) ) ( not ( = ?auto_800740 ?auto_800746 ) ) ( not ( = ?auto_800740 ?auto_800747 ) ) ( not ( = ?auto_800741 ?auto_800742 ) ) ( not ( = ?auto_800741 ?auto_800743 ) ) ( not ( = ?auto_800741 ?auto_800744 ) ) ( not ( = ?auto_800741 ?auto_800745 ) ) ( not ( = ?auto_800741 ?auto_800746 ) ) ( not ( = ?auto_800741 ?auto_800747 ) ) ( not ( = ?auto_800742 ?auto_800743 ) ) ( not ( = ?auto_800742 ?auto_800744 ) ) ( not ( = ?auto_800742 ?auto_800745 ) ) ( not ( = ?auto_800742 ?auto_800746 ) ) ( not ( = ?auto_800742 ?auto_800747 ) ) ( not ( = ?auto_800743 ?auto_800744 ) ) ( not ( = ?auto_800743 ?auto_800745 ) ) ( not ( = ?auto_800743 ?auto_800746 ) ) ( not ( = ?auto_800743 ?auto_800747 ) ) ( not ( = ?auto_800744 ?auto_800745 ) ) ( not ( = ?auto_800744 ?auto_800746 ) ) ( not ( = ?auto_800744 ?auto_800747 ) ) ( not ( = ?auto_800745 ?auto_800746 ) ) ( not ( = ?auto_800745 ?auto_800747 ) ) ( not ( = ?auto_800746 ?auto_800747 ) ) ( ON ?auto_800745 ?auto_800746 ) ( ON ?auto_800744 ?auto_800745 ) ( ON ?auto_800743 ?auto_800744 ) ( ON ?auto_800742 ?auto_800743 ) ( ON ?auto_800741 ?auto_800742 ) ( ON ?auto_800740 ?auto_800741 ) ( ON ?auto_800739 ?auto_800740 ) ( ON ?auto_800738 ?auto_800739 ) ( ON ?auto_800737 ?auto_800738 ) ( ON ?auto_800736 ?auto_800737 ) ( CLEAR ?auto_800734 ) ( ON ?auto_800735 ?auto_800736 ) ( CLEAR ?auto_800735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_800729 ?auto_800730 ?auto_800731 ?auto_800732 ?auto_800733 ?auto_800734 ?auto_800735 )
      ( MAKE-18PILE ?auto_800729 ?auto_800730 ?auto_800731 ?auto_800732 ?auto_800733 ?auto_800734 ?auto_800735 ?auto_800736 ?auto_800737 ?auto_800738 ?auto_800739 ?auto_800740 ?auto_800741 ?auto_800742 ?auto_800743 ?auto_800744 ?auto_800745 ?auto_800746 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800766 - BLOCK
      ?auto_800767 - BLOCK
      ?auto_800768 - BLOCK
      ?auto_800769 - BLOCK
      ?auto_800770 - BLOCK
      ?auto_800771 - BLOCK
      ?auto_800772 - BLOCK
      ?auto_800773 - BLOCK
      ?auto_800774 - BLOCK
      ?auto_800775 - BLOCK
      ?auto_800776 - BLOCK
      ?auto_800777 - BLOCK
      ?auto_800778 - BLOCK
      ?auto_800779 - BLOCK
      ?auto_800780 - BLOCK
      ?auto_800781 - BLOCK
      ?auto_800782 - BLOCK
      ?auto_800783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_800783 ) ( ON-TABLE ?auto_800766 ) ( ON ?auto_800767 ?auto_800766 ) ( ON ?auto_800768 ?auto_800767 ) ( ON ?auto_800769 ?auto_800768 ) ( ON ?auto_800770 ?auto_800769 ) ( ON ?auto_800771 ?auto_800770 ) ( not ( = ?auto_800766 ?auto_800767 ) ) ( not ( = ?auto_800766 ?auto_800768 ) ) ( not ( = ?auto_800766 ?auto_800769 ) ) ( not ( = ?auto_800766 ?auto_800770 ) ) ( not ( = ?auto_800766 ?auto_800771 ) ) ( not ( = ?auto_800766 ?auto_800772 ) ) ( not ( = ?auto_800766 ?auto_800773 ) ) ( not ( = ?auto_800766 ?auto_800774 ) ) ( not ( = ?auto_800766 ?auto_800775 ) ) ( not ( = ?auto_800766 ?auto_800776 ) ) ( not ( = ?auto_800766 ?auto_800777 ) ) ( not ( = ?auto_800766 ?auto_800778 ) ) ( not ( = ?auto_800766 ?auto_800779 ) ) ( not ( = ?auto_800766 ?auto_800780 ) ) ( not ( = ?auto_800766 ?auto_800781 ) ) ( not ( = ?auto_800766 ?auto_800782 ) ) ( not ( = ?auto_800766 ?auto_800783 ) ) ( not ( = ?auto_800767 ?auto_800768 ) ) ( not ( = ?auto_800767 ?auto_800769 ) ) ( not ( = ?auto_800767 ?auto_800770 ) ) ( not ( = ?auto_800767 ?auto_800771 ) ) ( not ( = ?auto_800767 ?auto_800772 ) ) ( not ( = ?auto_800767 ?auto_800773 ) ) ( not ( = ?auto_800767 ?auto_800774 ) ) ( not ( = ?auto_800767 ?auto_800775 ) ) ( not ( = ?auto_800767 ?auto_800776 ) ) ( not ( = ?auto_800767 ?auto_800777 ) ) ( not ( = ?auto_800767 ?auto_800778 ) ) ( not ( = ?auto_800767 ?auto_800779 ) ) ( not ( = ?auto_800767 ?auto_800780 ) ) ( not ( = ?auto_800767 ?auto_800781 ) ) ( not ( = ?auto_800767 ?auto_800782 ) ) ( not ( = ?auto_800767 ?auto_800783 ) ) ( not ( = ?auto_800768 ?auto_800769 ) ) ( not ( = ?auto_800768 ?auto_800770 ) ) ( not ( = ?auto_800768 ?auto_800771 ) ) ( not ( = ?auto_800768 ?auto_800772 ) ) ( not ( = ?auto_800768 ?auto_800773 ) ) ( not ( = ?auto_800768 ?auto_800774 ) ) ( not ( = ?auto_800768 ?auto_800775 ) ) ( not ( = ?auto_800768 ?auto_800776 ) ) ( not ( = ?auto_800768 ?auto_800777 ) ) ( not ( = ?auto_800768 ?auto_800778 ) ) ( not ( = ?auto_800768 ?auto_800779 ) ) ( not ( = ?auto_800768 ?auto_800780 ) ) ( not ( = ?auto_800768 ?auto_800781 ) ) ( not ( = ?auto_800768 ?auto_800782 ) ) ( not ( = ?auto_800768 ?auto_800783 ) ) ( not ( = ?auto_800769 ?auto_800770 ) ) ( not ( = ?auto_800769 ?auto_800771 ) ) ( not ( = ?auto_800769 ?auto_800772 ) ) ( not ( = ?auto_800769 ?auto_800773 ) ) ( not ( = ?auto_800769 ?auto_800774 ) ) ( not ( = ?auto_800769 ?auto_800775 ) ) ( not ( = ?auto_800769 ?auto_800776 ) ) ( not ( = ?auto_800769 ?auto_800777 ) ) ( not ( = ?auto_800769 ?auto_800778 ) ) ( not ( = ?auto_800769 ?auto_800779 ) ) ( not ( = ?auto_800769 ?auto_800780 ) ) ( not ( = ?auto_800769 ?auto_800781 ) ) ( not ( = ?auto_800769 ?auto_800782 ) ) ( not ( = ?auto_800769 ?auto_800783 ) ) ( not ( = ?auto_800770 ?auto_800771 ) ) ( not ( = ?auto_800770 ?auto_800772 ) ) ( not ( = ?auto_800770 ?auto_800773 ) ) ( not ( = ?auto_800770 ?auto_800774 ) ) ( not ( = ?auto_800770 ?auto_800775 ) ) ( not ( = ?auto_800770 ?auto_800776 ) ) ( not ( = ?auto_800770 ?auto_800777 ) ) ( not ( = ?auto_800770 ?auto_800778 ) ) ( not ( = ?auto_800770 ?auto_800779 ) ) ( not ( = ?auto_800770 ?auto_800780 ) ) ( not ( = ?auto_800770 ?auto_800781 ) ) ( not ( = ?auto_800770 ?auto_800782 ) ) ( not ( = ?auto_800770 ?auto_800783 ) ) ( not ( = ?auto_800771 ?auto_800772 ) ) ( not ( = ?auto_800771 ?auto_800773 ) ) ( not ( = ?auto_800771 ?auto_800774 ) ) ( not ( = ?auto_800771 ?auto_800775 ) ) ( not ( = ?auto_800771 ?auto_800776 ) ) ( not ( = ?auto_800771 ?auto_800777 ) ) ( not ( = ?auto_800771 ?auto_800778 ) ) ( not ( = ?auto_800771 ?auto_800779 ) ) ( not ( = ?auto_800771 ?auto_800780 ) ) ( not ( = ?auto_800771 ?auto_800781 ) ) ( not ( = ?auto_800771 ?auto_800782 ) ) ( not ( = ?auto_800771 ?auto_800783 ) ) ( not ( = ?auto_800772 ?auto_800773 ) ) ( not ( = ?auto_800772 ?auto_800774 ) ) ( not ( = ?auto_800772 ?auto_800775 ) ) ( not ( = ?auto_800772 ?auto_800776 ) ) ( not ( = ?auto_800772 ?auto_800777 ) ) ( not ( = ?auto_800772 ?auto_800778 ) ) ( not ( = ?auto_800772 ?auto_800779 ) ) ( not ( = ?auto_800772 ?auto_800780 ) ) ( not ( = ?auto_800772 ?auto_800781 ) ) ( not ( = ?auto_800772 ?auto_800782 ) ) ( not ( = ?auto_800772 ?auto_800783 ) ) ( not ( = ?auto_800773 ?auto_800774 ) ) ( not ( = ?auto_800773 ?auto_800775 ) ) ( not ( = ?auto_800773 ?auto_800776 ) ) ( not ( = ?auto_800773 ?auto_800777 ) ) ( not ( = ?auto_800773 ?auto_800778 ) ) ( not ( = ?auto_800773 ?auto_800779 ) ) ( not ( = ?auto_800773 ?auto_800780 ) ) ( not ( = ?auto_800773 ?auto_800781 ) ) ( not ( = ?auto_800773 ?auto_800782 ) ) ( not ( = ?auto_800773 ?auto_800783 ) ) ( not ( = ?auto_800774 ?auto_800775 ) ) ( not ( = ?auto_800774 ?auto_800776 ) ) ( not ( = ?auto_800774 ?auto_800777 ) ) ( not ( = ?auto_800774 ?auto_800778 ) ) ( not ( = ?auto_800774 ?auto_800779 ) ) ( not ( = ?auto_800774 ?auto_800780 ) ) ( not ( = ?auto_800774 ?auto_800781 ) ) ( not ( = ?auto_800774 ?auto_800782 ) ) ( not ( = ?auto_800774 ?auto_800783 ) ) ( not ( = ?auto_800775 ?auto_800776 ) ) ( not ( = ?auto_800775 ?auto_800777 ) ) ( not ( = ?auto_800775 ?auto_800778 ) ) ( not ( = ?auto_800775 ?auto_800779 ) ) ( not ( = ?auto_800775 ?auto_800780 ) ) ( not ( = ?auto_800775 ?auto_800781 ) ) ( not ( = ?auto_800775 ?auto_800782 ) ) ( not ( = ?auto_800775 ?auto_800783 ) ) ( not ( = ?auto_800776 ?auto_800777 ) ) ( not ( = ?auto_800776 ?auto_800778 ) ) ( not ( = ?auto_800776 ?auto_800779 ) ) ( not ( = ?auto_800776 ?auto_800780 ) ) ( not ( = ?auto_800776 ?auto_800781 ) ) ( not ( = ?auto_800776 ?auto_800782 ) ) ( not ( = ?auto_800776 ?auto_800783 ) ) ( not ( = ?auto_800777 ?auto_800778 ) ) ( not ( = ?auto_800777 ?auto_800779 ) ) ( not ( = ?auto_800777 ?auto_800780 ) ) ( not ( = ?auto_800777 ?auto_800781 ) ) ( not ( = ?auto_800777 ?auto_800782 ) ) ( not ( = ?auto_800777 ?auto_800783 ) ) ( not ( = ?auto_800778 ?auto_800779 ) ) ( not ( = ?auto_800778 ?auto_800780 ) ) ( not ( = ?auto_800778 ?auto_800781 ) ) ( not ( = ?auto_800778 ?auto_800782 ) ) ( not ( = ?auto_800778 ?auto_800783 ) ) ( not ( = ?auto_800779 ?auto_800780 ) ) ( not ( = ?auto_800779 ?auto_800781 ) ) ( not ( = ?auto_800779 ?auto_800782 ) ) ( not ( = ?auto_800779 ?auto_800783 ) ) ( not ( = ?auto_800780 ?auto_800781 ) ) ( not ( = ?auto_800780 ?auto_800782 ) ) ( not ( = ?auto_800780 ?auto_800783 ) ) ( not ( = ?auto_800781 ?auto_800782 ) ) ( not ( = ?auto_800781 ?auto_800783 ) ) ( not ( = ?auto_800782 ?auto_800783 ) ) ( ON ?auto_800782 ?auto_800783 ) ( ON ?auto_800781 ?auto_800782 ) ( ON ?auto_800780 ?auto_800781 ) ( ON ?auto_800779 ?auto_800780 ) ( ON ?auto_800778 ?auto_800779 ) ( ON ?auto_800777 ?auto_800778 ) ( ON ?auto_800776 ?auto_800777 ) ( ON ?auto_800775 ?auto_800776 ) ( ON ?auto_800774 ?auto_800775 ) ( ON ?auto_800773 ?auto_800774 ) ( CLEAR ?auto_800771 ) ( ON ?auto_800772 ?auto_800773 ) ( CLEAR ?auto_800772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_800766 ?auto_800767 ?auto_800768 ?auto_800769 ?auto_800770 ?auto_800771 ?auto_800772 )
      ( MAKE-18PILE ?auto_800766 ?auto_800767 ?auto_800768 ?auto_800769 ?auto_800770 ?auto_800771 ?auto_800772 ?auto_800773 ?auto_800774 ?auto_800775 ?auto_800776 ?auto_800777 ?auto_800778 ?auto_800779 ?auto_800780 ?auto_800781 ?auto_800782 ?auto_800783 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800802 - BLOCK
      ?auto_800803 - BLOCK
      ?auto_800804 - BLOCK
      ?auto_800805 - BLOCK
      ?auto_800806 - BLOCK
      ?auto_800807 - BLOCK
      ?auto_800808 - BLOCK
      ?auto_800809 - BLOCK
      ?auto_800810 - BLOCK
      ?auto_800811 - BLOCK
      ?auto_800812 - BLOCK
      ?auto_800813 - BLOCK
      ?auto_800814 - BLOCK
      ?auto_800815 - BLOCK
      ?auto_800816 - BLOCK
      ?auto_800817 - BLOCK
      ?auto_800818 - BLOCK
      ?auto_800819 - BLOCK
    )
    :vars
    (
      ?auto_800820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_800819 ?auto_800820 ) ( ON-TABLE ?auto_800802 ) ( ON ?auto_800803 ?auto_800802 ) ( ON ?auto_800804 ?auto_800803 ) ( ON ?auto_800805 ?auto_800804 ) ( ON ?auto_800806 ?auto_800805 ) ( not ( = ?auto_800802 ?auto_800803 ) ) ( not ( = ?auto_800802 ?auto_800804 ) ) ( not ( = ?auto_800802 ?auto_800805 ) ) ( not ( = ?auto_800802 ?auto_800806 ) ) ( not ( = ?auto_800802 ?auto_800807 ) ) ( not ( = ?auto_800802 ?auto_800808 ) ) ( not ( = ?auto_800802 ?auto_800809 ) ) ( not ( = ?auto_800802 ?auto_800810 ) ) ( not ( = ?auto_800802 ?auto_800811 ) ) ( not ( = ?auto_800802 ?auto_800812 ) ) ( not ( = ?auto_800802 ?auto_800813 ) ) ( not ( = ?auto_800802 ?auto_800814 ) ) ( not ( = ?auto_800802 ?auto_800815 ) ) ( not ( = ?auto_800802 ?auto_800816 ) ) ( not ( = ?auto_800802 ?auto_800817 ) ) ( not ( = ?auto_800802 ?auto_800818 ) ) ( not ( = ?auto_800802 ?auto_800819 ) ) ( not ( = ?auto_800802 ?auto_800820 ) ) ( not ( = ?auto_800803 ?auto_800804 ) ) ( not ( = ?auto_800803 ?auto_800805 ) ) ( not ( = ?auto_800803 ?auto_800806 ) ) ( not ( = ?auto_800803 ?auto_800807 ) ) ( not ( = ?auto_800803 ?auto_800808 ) ) ( not ( = ?auto_800803 ?auto_800809 ) ) ( not ( = ?auto_800803 ?auto_800810 ) ) ( not ( = ?auto_800803 ?auto_800811 ) ) ( not ( = ?auto_800803 ?auto_800812 ) ) ( not ( = ?auto_800803 ?auto_800813 ) ) ( not ( = ?auto_800803 ?auto_800814 ) ) ( not ( = ?auto_800803 ?auto_800815 ) ) ( not ( = ?auto_800803 ?auto_800816 ) ) ( not ( = ?auto_800803 ?auto_800817 ) ) ( not ( = ?auto_800803 ?auto_800818 ) ) ( not ( = ?auto_800803 ?auto_800819 ) ) ( not ( = ?auto_800803 ?auto_800820 ) ) ( not ( = ?auto_800804 ?auto_800805 ) ) ( not ( = ?auto_800804 ?auto_800806 ) ) ( not ( = ?auto_800804 ?auto_800807 ) ) ( not ( = ?auto_800804 ?auto_800808 ) ) ( not ( = ?auto_800804 ?auto_800809 ) ) ( not ( = ?auto_800804 ?auto_800810 ) ) ( not ( = ?auto_800804 ?auto_800811 ) ) ( not ( = ?auto_800804 ?auto_800812 ) ) ( not ( = ?auto_800804 ?auto_800813 ) ) ( not ( = ?auto_800804 ?auto_800814 ) ) ( not ( = ?auto_800804 ?auto_800815 ) ) ( not ( = ?auto_800804 ?auto_800816 ) ) ( not ( = ?auto_800804 ?auto_800817 ) ) ( not ( = ?auto_800804 ?auto_800818 ) ) ( not ( = ?auto_800804 ?auto_800819 ) ) ( not ( = ?auto_800804 ?auto_800820 ) ) ( not ( = ?auto_800805 ?auto_800806 ) ) ( not ( = ?auto_800805 ?auto_800807 ) ) ( not ( = ?auto_800805 ?auto_800808 ) ) ( not ( = ?auto_800805 ?auto_800809 ) ) ( not ( = ?auto_800805 ?auto_800810 ) ) ( not ( = ?auto_800805 ?auto_800811 ) ) ( not ( = ?auto_800805 ?auto_800812 ) ) ( not ( = ?auto_800805 ?auto_800813 ) ) ( not ( = ?auto_800805 ?auto_800814 ) ) ( not ( = ?auto_800805 ?auto_800815 ) ) ( not ( = ?auto_800805 ?auto_800816 ) ) ( not ( = ?auto_800805 ?auto_800817 ) ) ( not ( = ?auto_800805 ?auto_800818 ) ) ( not ( = ?auto_800805 ?auto_800819 ) ) ( not ( = ?auto_800805 ?auto_800820 ) ) ( not ( = ?auto_800806 ?auto_800807 ) ) ( not ( = ?auto_800806 ?auto_800808 ) ) ( not ( = ?auto_800806 ?auto_800809 ) ) ( not ( = ?auto_800806 ?auto_800810 ) ) ( not ( = ?auto_800806 ?auto_800811 ) ) ( not ( = ?auto_800806 ?auto_800812 ) ) ( not ( = ?auto_800806 ?auto_800813 ) ) ( not ( = ?auto_800806 ?auto_800814 ) ) ( not ( = ?auto_800806 ?auto_800815 ) ) ( not ( = ?auto_800806 ?auto_800816 ) ) ( not ( = ?auto_800806 ?auto_800817 ) ) ( not ( = ?auto_800806 ?auto_800818 ) ) ( not ( = ?auto_800806 ?auto_800819 ) ) ( not ( = ?auto_800806 ?auto_800820 ) ) ( not ( = ?auto_800807 ?auto_800808 ) ) ( not ( = ?auto_800807 ?auto_800809 ) ) ( not ( = ?auto_800807 ?auto_800810 ) ) ( not ( = ?auto_800807 ?auto_800811 ) ) ( not ( = ?auto_800807 ?auto_800812 ) ) ( not ( = ?auto_800807 ?auto_800813 ) ) ( not ( = ?auto_800807 ?auto_800814 ) ) ( not ( = ?auto_800807 ?auto_800815 ) ) ( not ( = ?auto_800807 ?auto_800816 ) ) ( not ( = ?auto_800807 ?auto_800817 ) ) ( not ( = ?auto_800807 ?auto_800818 ) ) ( not ( = ?auto_800807 ?auto_800819 ) ) ( not ( = ?auto_800807 ?auto_800820 ) ) ( not ( = ?auto_800808 ?auto_800809 ) ) ( not ( = ?auto_800808 ?auto_800810 ) ) ( not ( = ?auto_800808 ?auto_800811 ) ) ( not ( = ?auto_800808 ?auto_800812 ) ) ( not ( = ?auto_800808 ?auto_800813 ) ) ( not ( = ?auto_800808 ?auto_800814 ) ) ( not ( = ?auto_800808 ?auto_800815 ) ) ( not ( = ?auto_800808 ?auto_800816 ) ) ( not ( = ?auto_800808 ?auto_800817 ) ) ( not ( = ?auto_800808 ?auto_800818 ) ) ( not ( = ?auto_800808 ?auto_800819 ) ) ( not ( = ?auto_800808 ?auto_800820 ) ) ( not ( = ?auto_800809 ?auto_800810 ) ) ( not ( = ?auto_800809 ?auto_800811 ) ) ( not ( = ?auto_800809 ?auto_800812 ) ) ( not ( = ?auto_800809 ?auto_800813 ) ) ( not ( = ?auto_800809 ?auto_800814 ) ) ( not ( = ?auto_800809 ?auto_800815 ) ) ( not ( = ?auto_800809 ?auto_800816 ) ) ( not ( = ?auto_800809 ?auto_800817 ) ) ( not ( = ?auto_800809 ?auto_800818 ) ) ( not ( = ?auto_800809 ?auto_800819 ) ) ( not ( = ?auto_800809 ?auto_800820 ) ) ( not ( = ?auto_800810 ?auto_800811 ) ) ( not ( = ?auto_800810 ?auto_800812 ) ) ( not ( = ?auto_800810 ?auto_800813 ) ) ( not ( = ?auto_800810 ?auto_800814 ) ) ( not ( = ?auto_800810 ?auto_800815 ) ) ( not ( = ?auto_800810 ?auto_800816 ) ) ( not ( = ?auto_800810 ?auto_800817 ) ) ( not ( = ?auto_800810 ?auto_800818 ) ) ( not ( = ?auto_800810 ?auto_800819 ) ) ( not ( = ?auto_800810 ?auto_800820 ) ) ( not ( = ?auto_800811 ?auto_800812 ) ) ( not ( = ?auto_800811 ?auto_800813 ) ) ( not ( = ?auto_800811 ?auto_800814 ) ) ( not ( = ?auto_800811 ?auto_800815 ) ) ( not ( = ?auto_800811 ?auto_800816 ) ) ( not ( = ?auto_800811 ?auto_800817 ) ) ( not ( = ?auto_800811 ?auto_800818 ) ) ( not ( = ?auto_800811 ?auto_800819 ) ) ( not ( = ?auto_800811 ?auto_800820 ) ) ( not ( = ?auto_800812 ?auto_800813 ) ) ( not ( = ?auto_800812 ?auto_800814 ) ) ( not ( = ?auto_800812 ?auto_800815 ) ) ( not ( = ?auto_800812 ?auto_800816 ) ) ( not ( = ?auto_800812 ?auto_800817 ) ) ( not ( = ?auto_800812 ?auto_800818 ) ) ( not ( = ?auto_800812 ?auto_800819 ) ) ( not ( = ?auto_800812 ?auto_800820 ) ) ( not ( = ?auto_800813 ?auto_800814 ) ) ( not ( = ?auto_800813 ?auto_800815 ) ) ( not ( = ?auto_800813 ?auto_800816 ) ) ( not ( = ?auto_800813 ?auto_800817 ) ) ( not ( = ?auto_800813 ?auto_800818 ) ) ( not ( = ?auto_800813 ?auto_800819 ) ) ( not ( = ?auto_800813 ?auto_800820 ) ) ( not ( = ?auto_800814 ?auto_800815 ) ) ( not ( = ?auto_800814 ?auto_800816 ) ) ( not ( = ?auto_800814 ?auto_800817 ) ) ( not ( = ?auto_800814 ?auto_800818 ) ) ( not ( = ?auto_800814 ?auto_800819 ) ) ( not ( = ?auto_800814 ?auto_800820 ) ) ( not ( = ?auto_800815 ?auto_800816 ) ) ( not ( = ?auto_800815 ?auto_800817 ) ) ( not ( = ?auto_800815 ?auto_800818 ) ) ( not ( = ?auto_800815 ?auto_800819 ) ) ( not ( = ?auto_800815 ?auto_800820 ) ) ( not ( = ?auto_800816 ?auto_800817 ) ) ( not ( = ?auto_800816 ?auto_800818 ) ) ( not ( = ?auto_800816 ?auto_800819 ) ) ( not ( = ?auto_800816 ?auto_800820 ) ) ( not ( = ?auto_800817 ?auto_800818 ) ) ( not ( = ?auto_800817 ?auto_800819 ) ) ( not ( = ?auto_800817 ?auto_800820 ) ) ( not ( = ?auto_800818 ?auto_800819 ) ) ( not ( = ?auto_800818 ?auto_800820 ) ) ( not ( = ?auto_800819 ?auto_800820 ) ) ( ON ?auto_800818 ?auto_800819 ) ( ON ?auto_800817 ?auto_800818 ) ( ON ?auto_800816 ?auto_800817 ) ( ON ?auto_800815 ?auto_800816 ) ( ON ?auto_800814 ?auto_800815 ) ( ON ?auto_800813 ?auto_800814 ) ( ON ?auto_800812 ?auto_800813 ) ( ON ?auto_800811 ?auto_800812 ) ( ON ?auto_800810 ?auto_800811 ) ( ON ?auto_800809 ?auto_800810 ) ( ON ?auto_800808 ?auto_800809 ) ( CLEAR ?auto_800806 ) ( ON ?auto_800807 ?auto_800808 ) ( CLEAR ?auto_800807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_800802 ?auto_800803 ?auto_800804 ?auto_800805 ?auto_800806 ?auto_800807 )
      ( MAKE-18PILE ?auto_800802 ?auto_800803 ?auto_800804 ?auto_800805 ?auto_800806 ?auto_800807 ?auto_800808 ?auto_800809 ?auto_800810 ?auto_800811 ?auto_800812 ?auto_800813 ?auto_800814 ?auto_800815 ?auto_800816 ?auto_800817 ?auto_800818 ?auto_800819 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800839 - BLOCK
      ?auto_800840 - BLOCK
      ?auto_800841 - BLOCK
      ?auto_800842 - BLOCK
      ?auto_800843 - BLOCK
      ?auto_800844 - BLOCK
      ?auto_800845 - BLOCK
      ?auto_800846 - BLOCK
      ?auto_800847 - BLOCK
      ?auto_800848 - BLOCK
      ?auto_800849 - BLOCK
      ?auto_800850 - BLOCK
      ?auto_800851 - BLOCK
      ?auto_800852 - BLOCK
      ?auto_800853 - BLOCK
      ?auto_800854 - BLOCK
      ?auto_800855 - BLOCK
      ?auto_800856 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_800856 ) ( ON-TABLE ?auto_800839 ) ( ON ?auto_800840 ?auto_800839 ) ( ON ?auto_800841 ?auto_800840 ) ( ON ?auto_800842 ?auto_800841 ) ( ON ?auto_800843 ?auto_800842 ) ( not ( = ?auto_800839 ?auto_800840 ) ) ( not ( = ?auto_800839 ?auto_800841 ) ) ( not ( = ?auto_800839 ?auto_800842 ) ) ( not ( = ?auto_800839 ?auto_800843 ) ) ( not ( = ?auto_800839 ?auto_800844 ) ) ( not ( = ?auto_800839 ?auto_800845 ) ) ( not ( = ?auto_800839 ?auto_800846 ) ) ( not ( = ?auto_800839 ?auto_800847 ) ) ( not ( = ?auto_800839 ?auto_800848 ) ) ( not ( = ?auto_800839 ?auto_800849 ) ) ( not ( = ?auto_800839 ?auto_800850 ) ) ( not ( = ?auto_800839 ?auto_800851 ) ) ( not ( = ?auto_800839 ?auto_800852 ) ) ( not ( = ?auto_800839 ?auto_800853 ) ) ( not ( = ?auto_800839 ?auto_800854 ) ) ( not ( = ?auto_800839 ?auto_800855 ) ) ( not ( = ?auto_800839 ?auto_800856 ) ) ( not ( = ?auto_800840 ?auto_800841 ) ) ( not ( = ?auto_800840 ?auto_800842 ) ) ( not ( = ?auto_800840 ?auto_800843 ) ) ( not ( = ?auto_800840 ?auto_800844 ) ) ( not ( = ?auto_800840 ?auto_800845 ) ) ( not ( = ?auto_800840 ?auto_800846 ) ) ( not ( = ?auto_800840 ?auto_800847 ) ) ( not ( = ?auto_800840 ?auto_800848 ) ) ( not ( = ?auto_800840 ?auto_800849 ) ) ( not ( = ?auto_800840 ?auto_800850 ) ) ( not ( = ?auto_800840 ?auto_800851 ) ) ( not ( = ?auto_800840 ?auto_800852 ) ) ( not ( = ?auto_800840 ?auto_800853 ) ) ( not ( = ?auto_800840 ?auto_800854 ) ) ( not ( = ?auto_800840 ?auto_800855 ) ) ( not ( = ?auto_800840 ?auto_800856 ) ) ( not ( = ?auto_800841 ?auto_800842 ) ) ( not ( = ?auto_800841 ?auto_800843 ) ) ( not ( = ?auto_800841 ?auto_800844 ) ) ( not ( = ?auto_800841 ?auto_800845 ) ) ( not ( = ?auto_800841 ?auto_800846 ) ) ( not ( = ?auto_800841 ?auto_800847 ) ) ( not ( = ?auto_800841 ?auto_800848 ) ) ( not ( = ?auto_800841 ?auto_800849 ) ) ( not ( = ?auto_800841 ?auto_800850 ) ) ( not ( = ?auto_800841 ?auto_800851 ) ) ( not ( = ?auto_800841 ?auto_800852 ) ) ( not ( = ?auto_800841 ?auto_800853 ) ) ( not ( = ?auto_800841 ?auto_800854 ) ) ( not ( = ?auto_800841 ?auto_800855 ) ) ( not ( = ?auto_800841 ?auto_800856 ) ) ( not ( = ?auto_800842 ?auto_800843 ) ) ( not ( = ?auto_800842 ?auto_800844 ) ) ( not ( = ?auto_800842 ?auto_800845 ) ) ( not ( = ?auto_800842 ?auto_800846 ) ) ( not ( = ?auto_800842 ?auto_800847 ) ) ( not ( = ?auto_800842 ?auto_800848 ) ) ( not ( = ?auto_800842 ?auto_800849 ) ) ( not ( = ?auto_800842 ?auto_800850 ) ) ( not ( = ?auto_800842 ?auto_800851 ) ) ( not ( = ?auto_800842 ?auto_800852 ) ) ( not ( = ?auto_800842 ?auto_800853 ) ) ( not ( = ?auto_800842 ?auto_800854 ) ) ( not ( = ?auto_800842 ?auto_800855 ) ) ( not ( = ?auto_800842 ?auto_800856 ) ) ( not ( = ?auto_800843 ?auto_800844 ) ) ( not ( = ?auto_800843 ?auto_800845 ) ) ( not ( = ?auto_800843 ?auto_800846 ) ) ( not ( = ?auto_800843 ?auto_800847 ) ) ( not ( = ?auto_800843 ?auto_800848 ) ) ( not ( = ?auto_800843 ?auto_800849 ) ) ( not ( = ?auto_800843 ?auto_800850 ) ) ( not ( = ?auto_800843 ?auto_800851 ) ) ( not ( = ?auto_800843 ?auto_800852 ) ) ( not ( = ?auto_800843 ?auto_800853 ) ) ( not ( = ?auto_800843 ?auto_800854 ) ) ( not ( = ?auto_800843 ?auto_800855 ) ) ( not ( = ?auto_800843 ?auto_800856 ) ) ( not ( = ?auto_800844 ?auto_800845 ) ) ( not ( = ?auto_800844 ?auto_800846 ) ) ( not ( = ?auto_800844 ?auto_800847 ) ) ( not ( = ?auto_800844 ?auto_800848 ) ) ( not ( = ?auto_800844 ?auto_800849 ) ) ( not ( = ?auto_800844 ?auto_800850 ) ) ( not ( = ?auto_800844 ?auto_800851 ) ) ( not ( = ?auto_800844 ?auto_800852 ) ) ( not ( = ?auto_800844 ?auto_800853 ) ) ( not ( = ?auto_800844 ?auto_800854 ) ) ( not ( = ?auto_800844 ?auto_800855 ) ) ( not ( = ?auto_800844 ?auto_800856 ) ) ( not ( = ?auto_800845 ?auto_800846 ) ) ( not ( = ?auto_800845 ?auto_800847 ) ) ( not ( = ?auto_800845 ?auto_800848 ) ) ( not ( = ?auto_800845 ?auto_800849 ) ) ( not ( = ?auto_800845 ?auto_800850 ) ) ( not ( = ?auto_800845 ?auto_800851 ) ) ( not ( = ?auto_800845 ?auto_800852 ) ) ( not ( = ?auto_800845 ?auto_800853 ) ) ( not ( = ?auto_800845 ?auto_800854 ) ) ( not ( = ?auto_800845 ?auto_800855 ) ) ( not ( = ?auto_800845 ?auto_800856 ) ) ( not ( = ?auto_800846 ?auto_800847 ) ) ( not ( = ?auto_800846 ?auto_800848 ) ) ( not ( = ?auto_800846 ?auto_800849 ) ) ( not ( = ?auto_800846 ?auto_800850 ) ) ( not ( = ?auto_800846 ?auto_800851 ) ) ( not ( = ?auto_800846 ?auto_800852 ) ) ( not ( = ?auto_800846 ?auto_800853 ) ) ( not ( = ?auto_800846 ?auto_800854 ) ) ( not ( = ?auto_800846 ?auto_800855 ) ) ( not ( = ?auto_800846 ?auto_800856 ) ) ( not ( = ?auto_800847 ?auto_800848 ) ) ( not ( = ?auto_800847 ?auto_800849 ) ) ( not ( = ?auto_800847 ?auto_800850 ) ) ( not ( = ?auto_800847 ?auto_800851 ) ) ( not ( = ?auto_800847 ?auto_800852 ) ) ( not ( = ?auto_800847 ?auto_800853 ) ) ( not ( = ?auto_800847 ?auto_800854 ) ) ( not ( = ?auto_800847 ?auto_800855 ) ) ( not ( = ?auto_800847 ?auto_800856 ) ) ( not ( = ?auto_800848 ?auto_800849 ) ) ( not ( = ?auto_800848 ?auto_800850 ) ) ( not ( = ?auto_800848 ?auto_800851 ) ) ( not ( = ?auto_800848 ?auto_800852 ) ) ( not ( = ?auto_800848 ?auto_800853 ) ) ( not ( = ?auto_800848 ?auto_800854 ) ) ( not ( = ?auto_800848 ?auto_800855 ) ) ( not ( = ?auto_800848 ?auto_800856 ) ) ( not ( = ?auto_800849 ?auto_800850 ) ) ( not ( = ?auto_800849 ?auto_800851 ) ) ( not ( = ?auto_800849 ?auto_800852 ) ) ( not ( = ?auto_800849 ?auto_800853 ) ) ( not ( = ?auto_800849 ?auto_800854 ) ) ( not ( = ?auto_800849 ?auto_800855 ) ) ( not ( = ?auto_800849 ?auto_800856 ) ) ( not ( = ?auto_800850 ?auto_800851 ) ) ( not ( = ?auto_800850 ?auto_800852 ) ) ( not ( = ?auto_800850 ?auto_800853 ) ) ( not ( = ?auto_800850 ?auto_800854 ) ) ( not ( = ?auto_800850 ?auto_800855 ) ) ( not ( = ?auto_800850 ?auto_800856 ) ) ( not ( = ?auto_800851 ?auto_800852 ) ) ( not ( = ?auto_800851 ?auto_800853 ) ) ( not ( = ?auto_800851 ?auto_800854 ) ) ( not ( = ?auto_800851 ?auto_800855 ) ) ( not ( = ?auto_800851 ?auto_800856 ) ) ( not ( = ?auto_800852 ?auto_800853 ) ) ( not ( = ?auto_800852 ?auto_800854 ) ) ( not ( = ?auto_800852 ?auto_800855 ) ) ( not ( = ?auto_800852 ?auto_800856 ) ) ( not ( = ?auto_800853 ?auto_800854 ) ) ( not ( = ?auto_800853 ?auto_800855 ) ) ( not ( = ?auto_800853 ?auto_800856 ) ) ( not ( = ?auto_800854 ?auto_800855 ) ) ( not ( = ?auto_800854 ?auto_800856 ) ) ( not ( = ?auto_800855 ?auto_800856 ) ) ( ON ?auto_800855 ?auto_800856 ) ( ON ?auto_800854 ?auto_800855 ) ( ON ?auto_800853 ?auto_800854 ) ( ON ?auto_800852 ?auto_800853 ) ( ON ?auto_800851 ?auto_800852 ) ( ON ?auto_800850 ?auto_800851 ) ( ON ?auto_800849 ?auto_800850 ) ( ON ?auto_800848 ?auto_800849 ) ( ON ?auto_800847 ?auto_800848 ) ( ON ?auto_800846 ?auto_800847 ) ( ON ?auto_800845 ?auto_800846 ) ( CLEAR ?auto_800843 ) ( ON ?auto_800844 ?auto_800845 ) ( CLEAR ?auto_800844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_800839 ?auto_800840 ?auto_800841 ?auto_800842 ?auto_800843 ?auto_800844 )
      ( MAKE-18PILE ?auto_800839 ?auto_800840 ?auto_800841 ?auto_800842 ?auto_800843 ?auto_800844 ?auto_800845 ?auto_800846 ?auto_800847 ?auto_800848 ?auto_800849 ?auto_800850 ?auto_800851 ?auto_800852 ?auto_800853 ?auto_800854 ?auto_800855 ?auto_800856 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800875 - BLOCK
      ?auto_800876 - BLOCK
      ?auto_800877 - BLOCK
      ?auto_800878 - BLOCK
      ?auto_800879 - BLOCK
      ?auto_800880 - BLOCK
      ?auto_800881 - BLOCK
      ?auto_800882 - BLOCK
      ?auto_800883 - BLOCK
      ?auto_800884 - BLOCK
      ?auto_800885 - BLOCK
      ?auto_800886 - BLOCK
      ?auto_800887 - BLOCK
      ?auto_800888 - BLOCK
      ?auto_800889 - BLOCK
      ?auto_800890 - BLOCK
      ?auto_800891 - BLOCK
      ?auto_800892 - BLOCK
    )
    :vars
    (
      ?auto_800893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_800892 ?auto_800893 ) ( ON-TABLE ?auto_800875 ) ( ON ?auto_800876 ?auto_800875 ) ( ON ?auto_800877 ?auto_800876 ) ( ON ?auto_800878 ?auto_800877 ) ( not ( = ?auto_800875 ?auto_800876 ) ) ( not ( = ?auto_800875 ?auto_800877 ) ) ( not ( = ?auto_800875 ?auto_800878 ) ) ( not ( = ?auto_800875 ?auto_800879 ) ) ( not ( = ?auto_800875 ?auto_800880 ) ) ( not ( = ?auto_800875 ?auto_800881 ) ) ( not ( = ?auto_800875 ?auto_800882 ) ) ( not ( = ?auto_800875 ?auto_800883 ) ) ( not ( = ?auto_800875 ?auto_800884 ) ) ( not ( = ?auto_800875 ?auto_800885 ) ) ( not ( = ?auto_800875 ?auto_800886 ) ) ( not ( = ?auto_800875 ?auto_800887 ) ) ( not ( = ?auto_800875 ?auto_800888 ) ) ( not ( = ?auto_800875 ?auto_800889 ) ) ( not ( = ?auto_800875 ?auto_800890 ) ) ( not ( = ?auto_800875 ?auto_800891 ) ) ( not ( = ?auto_800875 ?auto_800892 ) ) ( not ( = ?auto_800875 ?auto_800893 ) ) ( not ( = ?auto_800876 ?auto_800877 ) ) ( not ( = ?auto_800876 ?auto_800878 ) ) ( not ( = ?auto_800876 ?auto_800879 ) ) ( not ( = ?auto_800876 ?auto_800880 ) ) ( not ( = ?auto_800876 ?auto_800881 ) ) ( not ( = ?auto_800876 ?auto_800882 ) ) ( not ( = ?auto_800876 ?auto_800883 ) ) ( not ( = ?auto_800876 ?auto_800884 ) ) ( not ( = ?auto_800876 ?auto_800885 ) ) ( not ( = ?auto_800876 ?auto_800886 ) ) ( not ( = ?auto_800876 ?auto_800887 ) ) ( not ( = ?auto_800876 ?auto_800888 ) ) ( not ( = ?auto_800876 ?auto_800889 ) ) ( not ( = ?auto_800876 ?auto_800890 ) ) ( not ( = ?auto_800876 ?auto_800891 ) ) ( not ( = ?auto_800876 ?auto_800892 ) ) ( not ( = ?auto_800876 ?auto_800893 ) ) ( not ( = ?auto_800877 ?auto_800878 ) ) ( not ( = ?auto_800877 ?auto_800879 ) ) ( not ( = ?auto_800877 ?auto_800880 ) ) ( not ( = ?auto_800877 ?auto_800881 ) ) ( not ( = ?auto_800877 ?auto_800882 ) ) ( not ( = ?auto_800877 ?auto_800883 ) ) ( not ( = ?auto_800877 ?auto_800884 ) ) ( not ( = ?auto_800877 ?auto_800885 ) ) ( not ( = ?auto_800877 ?auto_800886 ) ) ( not ( = ?auto_800877 ?auto_800887 ) ) ( not ( = ?auto_800877 ?auto_800888 ) ) ( not ( = ?auto_800877 ?auto_800889 ) ) ( not ( = ?auto_800877 ?auto_800890 ) ) ( not ( = ?auto_800877 ?auto_800891 ) ) ( not ( = ?auto_800877 ?auto_800892 ) ) ( not ( = ?auto_800877 ?auto_800893 ) ) ( not ( = ?auto_800878 ?auto_800879 ) ) ( not ( = ?auto_800878 ?auto_800880 ) ) ( not ( = ?auto_800878 ?auto_800881 ) ) ( not ( = ?auto_800878 ?auto_800882 ) ) ( not ( = ?auto_800878 ?auto_800883 ) ) ( not ( = ?auto_800878 ?auto_800884 ) ) ( not ( = ?auto_800878 ?auto_800885 ) ) ( not ( = ?auto_800878 ?auto_800886 ) ) ( not ( = ?auto_800878 ?auto_800887 ) ) ( not ( = ?auto_800878 ?auto_800888 ) ) ( not ( = ?auto_800878 ?auto_800889 ) ) ( not ( = ?auto_800878 ?auto_800890 ) ) ( not ( = ?auto_800878 ?auto_800891 ) ) ( not ( = ?auto_800878 ?auto_800892 ) ) ( not ( = ?auto_800878 ?auto_800893 ) ) ( not ( = ?auto_800879 ?auto_800880 ) ) ( not ( = ?auto_800879 ?auto_800881 ) ) ( not ( = ?auto_800879 ?auto_800882 ) ) ( not ( = ?auto_800879 ?auto_800883 ) ) ( not ( = ?auto_800879 ?auto_800884 ) ) ( not ( = ?auto_800879 ?auto_800885 ) ) ( not ( = ?auto_800879 ?auto_800886 ) ) ( not ( = ?auto_800879 ?auto_800887 ) ) ( not ( = ?auto_800879 ?auto_800888 ) ) ( not ( = ?auto_800879 ?auto_800889 ) ) ( not ( = ?auto_800879 ?auto_800890 ) ) ( not ( = ?auto_800879 ?auto_800891 ) ) ( not ( = ?auto_800879 ?auto_800892 ) ) ( not ( = ?auto_800879 ?auto_800893 ) ) ( not ( = ?auto_800880 ?auto_800881 ) ) ( not ( = ?auto_800880 ?auto_800882 ) ) ( not ( = ?auto_800880 ?auto_800883 ) ) ( not ( = ?auto_800880 ?auto_800884 ) ) ( not ( = ?auto_800880 ?auto_800885 ) ) ( not ( = ?auto_800880 ?auto_800886 ) ) ( not ( = ?auto_800880 ?auto_800887 ) ) ( not ( = ?auto_800880 ?auto_800888 ) ) ( not ( = ?auto_800880 ?auto_800889 ) ) ( not ( = ?auto_800880 ?auto_800890 ) ) ( not ( = ?auto_800880 ?auto_800891 ) ) ( not ( = ?auto_800880 ?auto_800892 ) ) ( not ( = ?auto_800880 ?auto_800893 ) ) ( not ( = ?auto_800881 ?auto_800882 ) ) ( not ( = ?auto_800881 ?auto_800883 ) ) ( not ( = ?auto_800881 ?auto_800884 ) ) ( not ( = ?auto_800881 ?auto_800885 ) ) ( not ( = ?auto_800881 ?auto_800886 ) ) ( not ( = ?auto_800881 ?auto_800887 ) ) ( not ( = ?auto_800881 ?auto_800888 ) ) ( not ( = ?auto_800881 ?auto_800889 ) ) ( not ( = ?auto_800881 ?auto_800890 ) ) ( not ( = ?auto_800881 ?auto_800891 ) ) ( not ( = ?auto_800881 ?auto_800892 ) ) ( not ( = ?auto_800881 ?auto_800893 ) ) ( not ( = ?auto_800882 ?auto_800883 ) ) ( not ( = ?auto_800882 ?auto_800884 ) ) ( not ( = ?auto_800882 ?auto_800885 ) ) ( not ( = ?auto_800882 ?auto_800886 ) ) ( not ( = ?auto_800882 ?auto_800887 ) ) ( not ( = ?auto_800882 ?auto_800888 ) ) ( not ( = ?auto_800882 ?auto_800889 ) ) ( not ( = ?auto_800882 ?auto_800890 ) ) ( not ( = ?auto_800882 ?auto_800891 ) ) ( not ( = ?auto_800882 ?auto_800892 ) ) ( not ( = ?auto_800882 ?auto_800893 ) ) ( not ( = ?auto_800883 ?auto_800884 ) ) ( not ( = ?auto_800883 ?auto_800885 ) ) ( not ( = ?auto_800883 ?auto_800886 ) ) ( not ( = ?auto_800883 ?auto_800887 ) ) ( not ( = ?auto_800883 ?auto_800888 ) ) ( not ( = ?auto_800883 ?auto_800889 ) ) ( not ( = ?auto_800883 ?auto_800890 ) ) ( not ( = ?auto_800883 ?auto_800891 ) ) ( not ( = ?auto_800883 ?auto_800892 ) ) ( not ( = ?auto_800883 ?auto_800893 ) ) ( not ( = ?auto_800884 ?auto_800885 ) ) ( not ( = ?auto_800884 ?auto_800886 ) ) ( not ( = ?auto_800884 ?auto_800887 ) ) ( not ( = ?auto_800884 ?auto_800888 ) ) ( not ( = ?auto_800884 ?auto_800889 ) ) ( not ( = ?auto_800884 ?auto_800890 ) ) ( not ( = ?auto_800884 ?auto_800891 ) ) ( not ( = ?auto_800884 ?auto_800892 ) ) ( not ( = ?auto_800884 ?auto_800893 ) ) ( not ( = ?auto_800885 ?auto_800886 ) ) ( not ( = ?auto_800885 ?auto_800887 ) ) ( not ( = ?auto_800885 ?auto_800888 ) ) ( not ( = ?auto_800885 ?auto_800889 ) ) ( not ( = ?auto_800885 ?auto_800890 ) ) ( not ( = ?auto_800885 ?auto_800891 ) ) ( not ( = ?auto_800885 ?auto_800892 ) ) ( not ( = ?auto_800885 ?auto_800893 ) ) ( not ( = ?auto_800886 ?auto_800887 ) ) ( not ( = ?auto_800886 ?auto_800888 ) ) ( not ( = ?auto_800886 ?auto_800889 ) ) ( not ( = ?auto_800886 ?auto_800890 ) ) ( not ( = ?auto_800886 ?auto_800891 ) ) ( not ( = ?auto_800886 ?auto_800892 ) ) ( not ( = ?auto_800886 ?auto_800893 ) ) ( not ( = ?auto_800887 ?auto_800888 ) ) ( not ( = ?auto_800887 ?auto_800889 ) ) ( not ( = ?auto_800887 ?auto_800890 ) ) ( not ( = ?auto_800887 ?auto_800891 ) ) ( not ( = ?auto_800887 ?auto_800892 ) ) ( not ( = ?auto_800887 ?auto_800893 ) ) ( not ( = ?auto_800888 ?auto_800889 ) ) ( not ( = ?auto_800888 ?auto_800890 ) ) ( not ( = ?auto_800888 ?auto_800891 ) ) ( not ( = ?auto_800888 ?auto_800892 ) ) ( not ( = ?auto_800888 ?auto_800893 ) ) ( not ( = ?auto_800889 ?auto_800890 ) ) ( not ( = ?auto_800889 ?auto_800891 ) ) ( not ( = ?auto_800889 ?auto_800892 ) ) ( not ( = ?auto_800889 ?auto_800893 ) ) ( not ( = ?auto_800890 ?auto_800891 ) ) ( not ( = ?auto_800890 ?auto_800892 ) ) ( not ( = ?auto_800890 ?auto_800893 ) ) ( not ( = ?auto_800891 ?auto_800892 ) ) ( not ( = ?auto_800891 ?auto_800893 ) ) ( not ( = ?auto_800892 ?auto_800893 ) ) ( ON ?auto_800891 ?auto_800892 ) ( ON ?auto_800890 ?auto_800891 ) ( ON ?auto_800889 ?auto_800890 ) ( ON ?auto_800888 ?auto_800889 ) ( ON ?auto_800887 ?auto_800888 ) ( ON ?auto_800886 ?auto_800887 ) ( ON ?auto_800885 ?auto_800886 ) ( ON ?auto_800884 ?auto_800885 ) ( ON ?auto_800883 ?auto_800884 ) ( ON ?auto_800882 ?auto_800883 ) ( ON ?auto_800881 ?auto_800882 ) ( ON ?auto_800880 ?auto_800881 ) ( CLEAR ?auto_800878 ) ( ON ?auto_800879 ?auto_800880 ) ( CLEAR ?auto_800879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_800875 ?auto_800876 ?auto_800877 ?auto_800878 ?auto_800879 )
      ( MAKE-18PILE ?auto_800875 ?auto_800876 ?auto_800877 ?auto_800878 ?auto_800879 ?auto_800880 ?auto_800881 ?auto_800882 ?auto_800883 ?auto_800884 ?auto_800885 ?auto_800886 ?auto_800887 ?auto_800888 ?auto_800889 ?auto_800890 ?auto_800891 ?auto_800892 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800912 - BLOCK
      ?auto_800913 - BLOCK
      ?auto_800914 - BLOCK
      ?auto_800915 - BLOCK
      ?auto_800916 - BLOCK
      ?auto_800917 - BLOCK
      ?auto_800918 - BLOCK
      ?auto_800919 - BLOCK
      ?auto_800920 - BLOCK
      ?auto_800921 - BLOCK
      ?auto_800922 - BLOCK
      ?auto_800923 - BLOCK
      ?auto_800924 - BLOCK
      ?auto_800925 - BLOCK
      ?auto_800926 - BLOCK
      ?auto_800927 - BLOCK
      ?auto_800928 - BLOCK
      ?auto_800929 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_800929 ) ( ON-TABLE ?auto_800912 ) ( ON ?auto_800913 ?auto_800912 ) ( ON ?auto_800914 ?auto_800913 ) ( ON ?auto_800915 ?auto_800914 ) ( not ( = ?auto_800912 ?auto_800913 ) ) ( not ( = ?auto_800912 ?auto_800914 ) ) ( not ( = ?auto_800912 ?auto_800915 ) ) ( not ( = ?auto_800912 ?auto_800916 ) ) ( not ( = ?auto_800912 ?auto_800917 ) ) ( not ( = ?auto_800912 ?auto_800918 ) ) ( not ( = ?auto_800912 ?auto_800919 ) ) ( not ( = ?auto_800912 ?auto_800920 ) ) ( not ( = ?auto_800912 ?auto_800921 ) ) ( not ( = ?auto_800912 ?auto_800922 ) ) ( not ( = ?auto_800912 ?auto_800923 ) ) ( not ( = ?auto_800912 ?auto_800924 ) ) ( not ( = ?auto_800912 ?auto_800925 ) ) ( not ( = ?auto_800912 ?auto_800926 ) ) ( not ( = ?auto_800912 ?auto_800927 ) ) ( not ( = ?auto_800912 ?auto_800928 ) ) ( not ( = ?auto_800912 ?auto_800929 ) ) ( not ( = ?auto_800913 ?auto_800914 ) ) ( not ( = ?auto_800913 ?auto_800915 ) ) ( not ( = ?auto_800913 ?auto_800916 ) ) ( not ( = ?auto_800913 ?auto_800917 ) ) ( not ( = ?auto_800913 ?auto_800918 ) ) ( not ( = ?auto_800913 ?auto_800919 ) ) ( not ( = ?auto_800913 ?auto_800920 ) ) ( not ( = ?auto_800913 ?auto_800921 ) ) ( not ( = ?auto_800913 ?auto_800922 ) ) ( not ( = ?auto_800913 ?auto_800923 ) ) ( not ( = ?auto_800913 ?auto_800924 ) ) ( not ( = ?auto_800913 ?auto_800925 ) ) ( not ( = ?auto_800913 ?auto_800926 ) ) ( not ( = ?auto_800913 ?auto_800927 ) ) ( not ( = ?auto_800913 ?auto_800928 ) ) ( not ( = ?auto_800913 ?auto_800929 ) ) ( not ( = ?auto_800914 ?auto_800915 ) ) ( not ( = ?auto_800914 ?auto_800916 ) ) ( not ( = ?auto_800914 ?auto_800917 ) ) ( not ( = ?auto_800914 ?auto_800918 ) ) ( not ( = ?auto_800914 ?auto_800919 ) ) ( not ( = ?auto_800914 ?auto_800920 ) ) ( not ( = ?auto_800914 ?auto_800921 ) ) ( not ( = ?auto_800914 ?auto_800922 ) ) ( not ( = ?auto_800914 ?auto_800923 ) ) ( not ( = ?auto_800914 ?auto_800924 ) ) ( not ( = ?auto_800914 ?auto_800925 ) ) ( not ( = ?auto_800914 ?auto_800926 ) ) ( not ( = ?auto_800914 ?auto_800927 ) ) ( not ( = ?auto_800914 ?auto_800928 ) ) ( not ( = ?auto_800914 ?auto_800929 ) ) ( not ( = ?auto_800915 ?auto_800916 ) ) ( not ( = ?auto_800915 ?auto_800917 ) ) ( not ( = ?auto_800915 ?auto_800918 ) ) ( not ( = ?auto_800915 ?auto_800919 ) ) ( not ( = ?auto_800915 ?auto_800920 ) ) ( not ( = ?auto_800915 ?auto_800921 ) ) ( not ( = ?auto_800915 ?auto_800922 ) ) ( not ( = ?auto_800915 ?auto_800923 ) ) ( not ( = ?auto_800915 ?auto_800924 ) ) ( not ( = ?auto_800915 ?auto_800925 ) ) ( not ( = ?auto_800915 ?auto_800926 ) ) ( not ( = ?auto_800915 ?auto_800927 ) ) ( not ( = ?auto_800915 ?auto_800928 ) ) ( not ( = ?auto_800915 ?auto_800929 ) ) ( not ( = ?auto_800916 ?auto_800917 ) ) ( not ( = ?auto_800916 ?auto_800918 ) ) ( not ( = ?auto_800916 ?auto_800919 ) ) ( not ( = ?auto_800916 ?auto_800920 ) ) ( not ( = ?auto_800916 ?auto_800921 ) ) ( not ( = ?auto_800916 ?auto_800922 ) ) ( not ( = ?auto_800916 ?auto_800923 ) ) ( not ( = ?auto_800916 ?auto_800924 ) ) ( not ( = ?auto_800916 ?auto_800925 ) ) ( not ( = ?auto_800916 ?auto_800926 ) ) ( not ( = ?auto_800916 ?auto_800927 ) ) ( not ( = ?auto_800916 ?auto_800928 ) ) ( not ( = ?auto_800916 ?auto_800929 ) ) ( not ( = ?auto_800917 ?auto_800918 ) ) ( not ( = ?auto_800917 ?auto_800919 ) ) ( not ( = ?auto_800917 ?auto_800920 ) ) ( not ( = ?auto_800917 ?auto_800921 ) ) ( not ( = ?auto_800917 ?auto_800922 ) ) ( not ( = ?auto_800917 ?auto_800923 ) ) ( not ( = ?auto_800917 ?auto_800924 ) ) ( not ( = ?auto_800917 ?auto_800925 ) ) ( not ( = ?auto_800917 ?auto_800926 ) ) ( not ( = ?auto_800917 ?auto_800927 ) ) ( not ( = ?auto_800917 ?auto_800928 ) ) ( not ( = ?auto_800917 ?auto_800929 ) ) ( not ( = ?auto_800918 ?auto_800919 ) ) ( not ( = ?auto_800918 ?auto_800920 ) ) ( not ( = ?auto_800918 ?auto_800921 ) ) ( not ( = ?auto_800918 ?auto_800922 ) ) ( not ( = ?auto_800918 ?auto_800923 ) ) ( not ( = ?auto_800918 ?auto_800924 ) ) ( not ( = ?auto_800918 ?auto_800925 ) ) ( not ( = ?auto_800918 ?auto_800926 ) ) ( not ( = ?auto_800918 ?auto_800927 ) ) ( not ( = ?auto_800918 ?auto_800928 ) ) ( not ( = ?auto_800918 ?auto_800929 ) ) ( not ( = ?auto_800919 ?auto_800920 ) ) ( not ( = ?auto_800919 ?auto_800921 ) ) ( not ( = ?auto_800919 ?auto_800922 ) ) ( not ( = ?auto_800919 ?auto_800923 ) ) ( not ( = ?auto_800919 ?auto_800924 ) ) ( not ( = ?auto_800919 ?auto_800925 ) ) ( not ( = ?auto_800919 ?auto_800926 ) ) ( not ( = ?auto_800919 ?auto_800927 ) ) ( not ( = ?auto_800919 ?auto_800928 ) ) ( not ( = ?auto_800919 ?auto_800929 ) ) ( not ( = ?auto_800920 ?auto_800921 ) ) ( not ( = ?auto_800920 ?auto_800922 ) ) ( not ( = ?auto_800920 ?auto_800923 ) ) ( not ( = ?auto_800920 ?auto_800924 ) ) ( not ( = ?auto_800920 ?auto_800925 ) ) ( not ( = ?auto_800920 ?auto_800926 ) ) ( not ( = ?auto_800920 ?auto_800927 ) ) ( not ( = ?auto_800920 ?auto_800928 ) ) ( not ( = ?auto_800920 ?auto_800929 ) ) ( not ( = ?auto_800921 ?auto_800922 ) ) ( not ( = ?auto_800921 ?auto_800923 ) ) ( not ( = ?auto_800921 ?auto_800924 ) ) ( not ( = ?auto_800921 ?auto_800925 ) ) ( not ( = ?auto_800921 ?auto_800926 ) ) ( not ( = ?auto_800921 ?auto_800927 ) ) ( not ( = ?auto_800921 ?auto_800928 ) ) ( not ( = ?auto_800921 ?auto_800929 ) ) ( not ( = ?auto_800922 ?auto_800923 ) ) ( not ( = ?auto_800922 ?auto_800924 ) ) ( not ( = ?auto_800922 ?auto_800925 ) ) ( not ( = ?auto_800922 ?auto_800926 ) ) ( not ( = ?auto_800922 ?auto_800927 ) ) ( not ( = ?auto_800922 ?auto_800928 ) ) ( not ( = ?auto_800922 ?auto_800929 ) ) ( not ( = ?auto_800923 ?auto_800924 ) ) ( not ( = ?auto_800923 ?auto_800925 ) ) ( not ( = ?auto_800923 ?auto_800926 ) ) ( not ( = ?auto_800923 ?auto_800927 ) ) ( not ( = ?auto_800923 ?auto_800928 ) ) ( not ( = ?auto_800923 ?auto_800929 ) ) ( not ( = ?auto_800924 ?auto_800925 ) ) ( not ( = ?auto_800924 ?auto_800926 ) ) ( not ( = ?auto_800924 ?auto_800927 ) ) ( not ( = ?auto_800924 ?auto_800928 ) ) ( not ( = ?auto_800924 ?auto_800929 ) ) ( not ( = ?auto_800925 ?auto_800926 ) ) ( not ( = ?auto_800925 ?auto_800927 ) ) ( not ( = ?auto_800925 ?auto_800928 ) ) ( not ( = ?auto_800925 ?auto_800929 ) ) ( not ( = ?auto_800926 ?auto_800927 ) ) ( not ( = ?auto_800926 ?auto_800928 ) ) ( not ( = ?auto_800926 ?auto_800929 ) ) ( not ( = ?auto_800927 ?auto_800928 ) ) ( not ( = ?auto_800927 ?auto_800929 ) ) ( not ( = ?auto_800928 ?auto_800929 ) ) ( ON ?auto_800928 ?auto_800929 ) ( ON ?auto_800927 ?auto_800928 ) ( ON ?auto_800926 ?auto_800927 ) ( ON ?auto_800925 ?auto_800926 ) ( ON ?auto_800924 ?auto_800925 ) ( ON ?auto_800923 ?auto_800924 ) ( ON ?auto_800922 ?auto_800923 ) ( ON ?auto_800921 ?auto_800922 ) ( ON ?auto_800920 ?auto_800921 ) ( ON ?auto_800919 ?auto_800920 ) ( ON ?auto_800918 ?auto_800919 ) ( ON ?auto_800917 ?auto_800918 ) ( CLEAR ?auto_800915 ) ( ON ?auto_800916 ?auto_800917 ) ( CLEAR ?auto_800916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_800912 ?auto_800913 ?auto_800914 ?auto_800915 ?auto_800916 )
      ( MAKE-18PILE ?auto_800912 ?auto_800913 ?auto_800914 ?auto_800915 ?auto_800916 ?auto_800917 ?auto_800918 ?auto_800919 ?auto_800920 ?auto_800921 ?auto_800922 ?auto_800923 ?auto_800924 ?auto_800925 ?auto_800926 ?auto_800927 ?auto_800928 ?auto_800929 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800948 - BLOCK
      ?auto_800949 - BLOCK
      ?auto_800950 - BLOCK
      ?auto_800951 - BLOCK
      ?auto_800952 - BLOCK
      ?auto_800953 - BLOCK
      ?auto_800954 - BLOCK
      ?auto_800955 - BLOCK
      ?auto_800956 - BLOCK
      ?auto_800957 - BLOCK
      ?auto_800958 - BLOCK
      ?auto_800959 - BLOCK
      ?auto_800960 - BLOCK
      ?auto_800961 - BLOCK
      ?auto_800962 - BLOCK
      ?auto_800963 - BLOCK
      ?auto_800964 - BLOCK
      ?auto_800965 - BLOCK
    )
    :vars
    (
      ?auto_800966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_800965 ?auto_800966 ) ( ON-TABLE ?auto_800948 ) ( ON ?auto_800949 ?auto_800948 ) ( ON ?auto_800950 ?auto_800949 ) ( not ( = ?auto_800948 ?auto_800949 ) ) ( not ( = ?auto_800948 ?auto_800950 ) ) ( not ( = ?auto_800948 ?auto_800951 ) ) ( not ( = ?auto_800948 ?auto_800952 ) ) ( not ( = ?auto_800948 ?auto_800953 ) ) ( not ( = ?auto_800948 ?auto_800954 ) ) ( not ( = ?auto_800948 ?auto_800955 ) ) ( not ( = ?auto_800948 ?auto_800956 ) ) ( not ( = ?auto_800948 ?auto_800957 ) ) ( not ( = ?auto_800948 ?auto_800958 ) ) ( not ( = ?auto_800948 ?auto_800959 ) ) ( not ( = ?auto_800948 ?auto_800960 ) ) ( not ( = ?auto_800948 ?auto_800961 ) ) ( not ( = ?auto_800948 ?auto_800962 ) ) ( not ( = ?auto_800948 ?auto_800963 ) ) ( not ( = ?auto_800948 ?auto_800964 ) ) ( not ( = ?auto_800948 ?auto_800965 ) ) ( not ( = ?auto_800948 ?auto_800966 ) ) ( not ( = ?auto_800949 ?auto_800950 ) ) ( not ( = ?auto_800949 ?auto_800951 ) ) ( not ( = ?auto_800949 ?auto_800952 ) ) ( not ( = ?auto_800949 ?auto_800953 ) ) ( not ( = ?auto_800949 ?auto_800954 ) ) ( not ( = ?auto_800949 ?auto_800955 ) ) ( not ( = ?auto_800949 ?auto_800956 ) ) ( not ( = ?auto_800949 ?auto_800957 ) ) ( not ( = ?auto_800949 ?auto_800958 ) ) ( not ( = ?auto_800949 ?auto_800959 ) ) ( not ( = ?auto_800949 ?auto_800960 ) ) ( not ( = ?auto_800949 ?auto_800961 ) ) ( not ( = ?auto_800949 ?auto_800962 ) ) ( not ( = ?auto_800949 ?auto_800963 ) ) ( not ( = ?auto_800949 ?auto_800964 ) ) ( not ( = ?auto_800949 ?auto_800965 ) ) ( not ( = ?auto_800949 ?auto_800966 ) ) ( not ( = ?auto_800950 ?auto_800951 ) ) ( not ( = ?auto_800950 ?auto_800952 ) ) ( not ( = ?auto_800950 ?auto_800953 ) ) ( not ( = ?auto_800950 ?auto_800954 ) ) ( not ( = ?auto_800950 ?auto_800955 ) ) ( not ( = ?auto_800950 ?auto_800956 ) ) ( not ( = ?auto_800950 ?auto_800957 ) ) ( not ( = ?auto_800950 ?auto_800958 ) ) ( not ( = ?auto_800950 ?auto_800959 ) ) ( not ( = ?auto_800950 ?auto_800960 ) ) ( not ( = ?auto_800950 ?auto_800961 ) ) ( not ( = ?auto_800950 ?auto_800962 ) ) ( not ( = ?auto_800950 ?auto_800963 ) ) ( not ( = ?auto_800950 ?auto_800964 ) ) ( not ( = ?auto_800950 ?auto_800965 ) ) ( not ( = ?auto_800950 ?auto_800966 ) ) ( not ( = ?auto_800951 ?auto_800952 ) ) ( not ( = ?auto_800951 ?auto_800953 ) ) ( not ( = ?auto_800951 ?auto_800954 ) ) ( not ( = ?auto_800951 ?auto_800955 ) ) ( not ( = ?auto_800951 ?auto_800956 ) ) ( not ( = ?auto_800951 ?auto_800957 ) ) ( not ( = ?auto_800951 ?auto_800958 ) ) ( not ( = ?auto_800951 ?auto_800959 ) ) ( not ( = ?auto_800951 ?auto_800960 ) ) ( not ( = ?auto_800951 ?auto_800961 ) ) ( not ( = ?auto_800951 ?auto_800962 ) ) ( not ( = ?auto_800951 ?auto_800963 ) ) ( not ( = ?auto_800951 ?auto_800964 ) ) ( not ( = ?auto_800951 ?auto_800965 ) ) ( not ( = ?auto_800951 ?auto_800966 ) ) ( not ( = ?auto_800952 ?auto_800953 ) ) ( not ( = ?auto_800952 ?auto_800954 ) ) ( not ( = ?auto_800952 ?auto_800955 ) ) ( not ( = ?auto_800952 ?auto_800956 ) ) ( not ( = ?auto_800952 ?auto_800957 ) ) ( not ( = ?auto_800952 ?auto_800958 ) ) ( not ( = ?auto_800952 ?auto_800959 ) ) ( not ( = ?auto_800952 ?auto_800960 ) ) ( not ( = ?auto_800952 ?auto_800961 ) ) ( not ( = ?auto_800952 ?auto_800962 ) ) ( not ( = ?auto_800952 ?auto_800963 ) ) ( not ( = ?auto_800952 ?auto_800964 ) ) ( not ( = ?auto_800952 ?auto_800965 ) ) ( not ( = ?auto_800952 ?auto_800966 ) ) ( not ( = ?auto_800953 ?auto_800954 ) ) ( not ( = ?auto_800953 ?auto_800955 ) ) ( not ( = ?auto_800953 ?auto_800956 ) ) ( not ( = ?auto_800953 ?auto_800957 ) ) ( not ( = ?auto_800953 ?auto_800958 ) ) ( not ( = ?auto_800953 ?auto_800959 ) ) ( not ( = ?auto_800953 ?auto_800960 ) ) ( not ( = ?auto_800953 ?auto_800961 ) ) ( not ( = ?auto_800953 ?auto_800962 ) ) ( not ( = ?auto_800953 ?auto_800963 ) ) ( not ( = ?auto_800953 ?auto_800964 ) ) ( not ( = ?auto_800953 ?auto_800965 ) ) ( not ( = ?auto_800953 ?auto_800966 ) ) ( not ( = ?auto_800954 ?auto_800955 ) ) ( not ( = ?auto_800954 ?auto_800956 ) ) ( not ( = ?auto_800954 ?auto_800957 ) ) ( not ( = ?auto_800954 ?auto_800958 ) ) ( not ( = ?auto_800954 ?auto_800959 ) ) ( not ( = ?auto_800954 ?auto_800960 ) ) ( not ( = ?auto_800954 ?auto_800961 ) ) ( not ( = ?auto_800954 ?auto_800962 ) ) ( not ( = ?auto_800954 ?auto_800963 ) ) ( not ( = ?auto_800954 ?auto_800964 ) ) ( not ( = ?auto_800954 ?auto_800965 ) ) ( not ( = ?auto_800954 ?auto_800966 ) ) ( not ( = ?auto_800955 ?auto_800956 ) ) ( not ( = ?auto_800955 ?auto_800957 ) ) ( not ( = ?auto_800955 ?auto_800958 ) ) ( not ( = ?auto_800955 ?auto_800959 ) ) ( not ( = ?auto_800955 ?auto_800960 ) ) ( not ( = ?auto_800955 ?auto_800961 ) ) ( not ( = ?auto_800955 ?auto_800962 ) ) ( not ( = ?auto_800955 ?auto_800963 ) ) ( not ( = ?auto_800955 ?auto_800964 ) ) ( not ( = ?auto_800955 ?auto_800965 ) ) ( not ( = ?auto_800955 ?auto_800966 ) ) ( not ( = ?auto_800956 ?auto_800957 ) ) ( not ( = ?auto_800956 ?auto_800958 ) ) ( not ( = ?auto_800956 ?auto_800959 ) ) ( not ( = ?auto_800956 ?auto_800960 ) ) ( not ( = ?auto_800956 ?auto_800961 ) ) ( not ( = ?auto_800956 ?auto_800962 ) ) ( not ( = ?auto_800956 ?auto_800963 ) ) ( not ( = ?auto_800956 ?auto_800964 ) ) ( not ( = ?auto_800956 ?auto_800965 ) ) ( not ( = ?auto_800956 ?auto_800966 ) ) ( not ( = ?auto_800957 ?auto_800958 ) ) ( not ( = ?auto_800957 ?auto_800959 ) ) ( not ( = ?auto_800957 ?auto_800960 ) ) ( not ( = ?auto_800957 ?auto_800961 ) ) ( not ( = ?auto_800957 ?auto_800962 ) ) ( not ( = ?auto_800957 ?auto_800963 ) ) ( not ( = ?auto_800957 ?auto_800964 ) ) ( not ( = ?auto_800957 ?auto_800965 ) ) ( not ( = ?auto_800957 ?auto_800966 ) ) ( not ( = ?auto_800958 ?auto_800959 ) ) ( not ( = ?auto_800958 ?auto_800960 ) ) ( not ( = ?auto_800958 ?auto_800961 ) ) ( not ( = ?auto_800958 ?auto_800962 ) ) ( not ( = ?auto_800958 ?auto_800963 ) ) ( not ( = ?auto_800958 ?auto_800964 ) ) ( not ( = ?auto_800958 ?auto_800965 ) ) ( not ( = ?auto_800958 ?auto_800966 ) ) ( not ( = ?auto_800959 ?auto_800960 ) ) ( not ( = ?auto_800959 ?auto_800961 ) ) ( not ( = ?auto_800959 ?auto_800962 ) ) ( not ( = ?auto_800959 ?auto_800963 ) ) ( not ( = ?auto_800959 ?auto_800964 ) ) ( not ( = ?auto_800959 ?auto_800965 ) ) ( not ( = ?auto_800959 ?auto_800966 ) ) ( not ( = ?auto_800960 ?auto_800961 ) ) ( not ( = ?auto_800960 ?auto_800962 ) ) ( not ( = ?auto_800960 ?auto_800963 ) ) ( not ( = ?auto_800960 ?auto_800964 ) ) ( not ( = ?auto_800960 ?auto_800965 ) ) ( not ( = ?auto_800960 ?auto_800966 ) ) ( not ( = ?auto_800961 ?auto_800962 ) ) ( not ( = ?auto_800961 ?auto_800963 ) ) ( not ( = ?auto_800961 ?auto_800964 ) ) ( not ( = ?auto_800961 ?auto_800965 ) ) ( not ( = ?auto_800961 ?auto_800966 ) ) ( not ( = ?auto_800962 ?auto_800963 ) ) ( not ( = ?auto_800962 ?auto_800964 ) ) ( not ( = ?auto_800962 ?auto_800965 ) ) ( not ( = ?auto_800962 ?auto_800966 ) ) ( not ( = ?auto_800963 ?auto_800964 ) ) ( not ( = ?auto_800963 ?auto_800965 ) ) ( not ( = ?auto_800963 ?auto_800966 ) ) ( not ( = ?auto_800964 ?auto_800965 ) ) ( not ( = ?auto_800964 ?auto_800966 ) ) ( not ( = ?auto_800965 ?auto_800966 ) ) ( ON ?auto_800964 ?auto_800965 ) ( ON ?auto_800963 ?auto_800964 ) ( ON ?auto_800962 ?auto_800963 ) ( ON ?auto_800961 ?auto_800962 ) ( ON ?auto_800960 ?auto_800961 ) ( ON ?auto_800959 ?auto_800960 ) ( ON ?auto_800958 ?auto_800959 ) ( ON ?auto_800957 ?auto_800958 ) ( ON ?auto_800956 ?auto_800957 ) ( ON ?auto_800955 ?auto_800956 ) ( ON ?auto_800954 ?auto_800955 ) ( ON ?auto_800953 ?auto_800954 ) ( ON ?auto_800952 ?auto_800953 ) ( CLEAR ?auto_800950 ) ( ON ?auto_800951 ?auto_800952 ) ( CLEAR ?auto_800951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_800948 ?auto_800949 ?auto_800950 ?auto_800951 )
      ( MAKE-18PILE ?auto_800948 ?auto_800949 ?auto_800950 ?auto_800951 ?auto_800952 ?auto_800953 ?auto_800954 ?auto_800955 ?auto_800956 ?auto_800957 ?auto_800958 ?auto_800959 ?auto_800960 ?auto_800961 ?auto_800962 ?auto_800963 ?auto_800964 ?auto_800965 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_800985 - BLOCK
      ?auto_800986 - BLOCK
      ?auto_800987 - BLOCK
      ?auto_800988 - BLOCK
      ?auto_800989 - BLOCK
      ?auto_800990 - BLOCK
      ?auto_800991 - BLOCK
      ?auto_800992 - BLOCK
      ?auto_800993 - BLOCK
      ?auto_800994 - BLOCK
      ?auto_800995 - BLOCK
      ?auto_800996 - BLOCK
      ?auto_800997 - BLOCK
      ?auto_800998 - BLOCK
      ?auto_800999 - BLOCK
      ?auto_801000 - BLOCK
      ?auto_801001 - BLOCK
      ?auto_801002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_801002 ) ( ON-TABLE ?auto_800985 ) ( ON ?auto_800986 ?auto_800985 ) ( ON ?auto_800987 ?auto_800986 ) ( not ( = ?auto_800985 ?auto_800986 ) ) ( not ( = ?auto_800985 ?auto_800987 ) ) ( not ( = ?auto_800985 ?auto_800988 ) ) ( not ( = ?auto_800985 ?auto_800989 ) ) ( not ( = ?auto_800985 ?auto_800990 ) ) ( not ( = ?auto_800985 ?auto_800991 ) ) ( not ( = ?auto_800985 ?auto_800992 ) ) ( not ( = ?auto_800985 ?auto_800993 ) ) ( not ( = ?auto_800985 ?auto_800994 ) ) ( not ( = ?auto_800985 ?auto_800995 ) ) ( not ( = ?auto_800985 ?auto_800996 ) ) ( not ( = ?auto_800985 ?auto_800997 ) ) ( not ( = ?auto_800985 ?auto_800998 ) ) ( not ( = ?auto_800985 ?auto_800999 ) ) ( not ( = ?auto_800985 ?auto_801000 ) ) ( not ( = ?auto_800985 ?auto_801001 ) ) ( not ( = ?auto_800985 ?auto_801002 ) ) ( not ( = ?auto_800986 ?auto_800987 ) ) ( not ( = ?auto_800986 ?auto_800988 ) ) ( not ( = ?auto_800986 ?auto_800989 ) ) ( not ( = ?auto_800986 ?auto_800990 ) ) ( not ( = ?auto_800986 ?auto_800991 ) ) ( not ( = ?auto_800986 ?auto_800992 ) ) ( not ( = ?auto_800986 ?auto_800993 ) ) ( not ( = ?auto_800986 ?auto_800994 ) ) ( not ( = ?auto_800986 ?auto_800995 ) ) ( not ( = ?auto_800986 ?auto_800996 ) ) ( not ( = ?auto_800986 ?auto_800997 ) ) ( not ( = ?auto_800986 ?auto_800998 ) ) ( not ( = ?auto_800986 ?auto_800999 ) ) ( not ( = ?auto_800986 ?auto_801000 ) ) ( not ( = ?auto_800986 ?auto_801001 ) ) ( not ( = ?auto_800986 ?auto_801002 ) ) ( not ( = ?auto_800987 ?auto_800988 ) ) ( not ( = ?auto_800987 ?auto_800989 ) ) ( not ( = ?auto_800987 ?auto_800990 ) ) ( not ( = ?auto_800987 ?auto_800991 ) ) ( not ( = ?auto_800987 ?auto_800992 ) ) ( not ( = ?auto_800987 ?auto_800993 ) ) ( not ( = ?auto_800987 ?auto_800994 ) ) ( not ( = ?auto_800987 ?auto_800995 ) ) ( not ( = ?auto_800987 ?auto_800996 ) ) ( not ( = ?auto_800987 ?auto_800997 ) ) ( not ( = ?auto_800987 ?auto_800998 ) ) ( not ( = ?auto_800987 ?auto_800999 ) ) ( not ( = ?auto_800987 ?auto_801000 ) ) ( not ( = ?auto_800987 ?auto_801001 ) ) ( not ( = ?auto_800987 ?auto_801002 ) ) ( not ( = ?auto_800988 ?auto_800989 ) ) ( not ( = ?auto_800988 ?auto_800990 ) ) ( not ( = ?auto_800988 ?auto_800991 ) ) ( not ( = ?auto_800988 ?auto_800992 ) ) ( not ( = ?auto_800988 ?auto_800993 ) ) ( not ( = ?auto_800988 ?auto_800994 ) ) ( not ( = ?auto_800988 ?auto_800995 ) ) ( not ( = ?auto_800988 ?auto_800996 ) ) ( not ( = ?auto_800988 ?auto_800997 ) ) ( not ( = ?auto_800988 ?auto_800998 ) ) ( not ( = ?auto_800988 ?auto_800999 ) ) ( not ( = ?auto_800988 ?auto_801000 ) ) ( not ( = ?auto_800988 ?auto_801001 ) ) ( not ( = ?auto_800988 ?auto_801002 ) ) ( not ( = ?auto_800989 ?auto_800990 ) ) ( not ( = ?auto_800989 ?auto_800991 ) ) ( not ( = ?auto_800989 ?auto_800992 ) ) ( not ( = ?auto_800989 ?auto_800993 ) ) ( not ( = ?auto_800989 ?auto_800994 ) ) ( not ( = ?auto_800989 ?auto_800995 ) ) ( not ( = ?auto_800989 ?auto_800996 ) ) ( not ( = ?auto_800989 ?auto_800997 ) ) ( not ( = ?auto_800989 ?auto_800998 ) ) ( not ( = ?auto_800989 ?auto_800999 ) ) ( not ( = ?auto_800989 ?auto_801000 ) ) ( not ( = ?auto_800989 ?auto_801001 ) ) ( not ( = ?auto_800989 ?auto_801002 ) ) ( not ( = ?auto_800990 ?auto_800991 ) ) ( not ( = ?auto_800990 ?auto_800992 ) ) ( not ( = ?auto_800990 ?auto_800993 ) ) ( not ( = ?auto_800990 ?auto_800994 ) ) ( not ( = ?auto_800990 ?auto_800995 ) ) ( not ( = ?auto_800990 ?auto_800996 ) ) ( not ( = ?auto_800990 ?auto_800997 ) ) ( not ( = ?auto_800990 ?auto_800998 ) ) ( not ( = ?auto_800990 ?auto_800999 ) ) ( not ( = ?auto_800990 ?auto_801000 ) ) ( not ( = ?auto_800990 ?auto_801001 ) ) ( not ( = ?auto_800990 ?auto_801002 ) ) ( not ( = ?auto_800991 ?auto_800992 ) ) ( not ( = ?auto_800991 ?auto_800993 ) ) ( not ( = ?auto_800991 ?auto_800994 ) ) ( not ( = ?auto_800991 ?auto_800995 ) ) ( not ( = ?auto_800991 ?auto_800996 ) ) ( not ( = ?auto_800991 ?auto_800997 ) ) ( not ( = ?auto_800991 ?auto_800998 ) ) ( not ( = ?auto_800991 ?auto_800999 ) ) ( not ( = ?auto_800991 ?auto_801000 ) ) ( not ( = ?auto_800991 ?auto_801001 ) ) ( not ( = ?auto_800991 ?auto_801002 ) ) ( not ( = ?auto_800992 ?auto_800993 ) ) ( not ( = ?auto_800992 ?auto_800994 ) ) ( not ( = ?auto_800992 ?auto_800995 ) ) ( not ( = ?auto_800992 ?auto_800996 ) ) ( not ( = ?auto_800992 ?auto_800997 ) ) ( not ( = ?auto_800992 ?auto_800998 ) ) ( not ( = ?auto_800992 ?auto_800999 ) ) ( not ( = ?auto_800992 ?auto_801000 ) ) ( not ( = ?auto_800992 ?auto_801001 ) ) ( not ( = ?auto_800992 ?auto_801002 ) ) ( not ( = ?auto_800993 ?auto_800994 ) ) ( not ( = ?auto_800993 ?auto_800995 ) ) ( not ( = ?auto_800993 ?auto_800996 ) ) ( not ( = ?auto_800993 ?auto_800997 ) ) ( not ( = ?auto_800993 ?auto_800998 ) ) ( not ( = ?auto_800993 ?auto_800999 ) ) ( not ( = ?auto_800993 ?auto_801000 ) ) ( not ( = ?auto_800993 ?auto_801001 ) ) ( not ( = ?auto_800993 ?auto_801002 ) ) ( not ( = ?auto_800994 ?auto_800995 ) ) ( not ( = ?auto_800994 ?auto_800996 ) ) ( not ( = ?auto_800994 ?auto_800997 ) ) ( not ( = ?auto_800994 ?auto_800998 ) ) ( not ( = ?auto_800994 ?auto_800999 ) ) ( not ( = ?auto_800994 ?auto_801000 ) ) ( not ( = ?auto_800994 ?auto_801001 ) ) ( not ( = ?auto_800994 ?auto_801002 ) ) ( not ( = ?auto_800995 ?auto_800996 ) ) ( not ( = ?auto_800995 ?auto_800997 ) ) ( not ( = ?auto_800995 ?auto_800998 ) ) ( not ( = ?auto_800995 ?auto_800999 ) ) ( not ( = ?auto_800995 ?auto_801000 ) ) ( not ( = ?auto_800995 ?auto_801001 ) ) ( not ( = ?auto_800995 ?auto_801002 ) ) ( not ( = ?auto_800996 ?auto_800997 ) ) ( not ( = ?auto_800996 ?auto_800998 ) ) ( not ( = ?auto_800996 ?auto_800999 ) ) ( not ( = ?auto_800996 ?auto_801000 ) ) ( not ( = ?auto_800996 ?auto_801001 ) ) ( not ( = ?auto_800996 ?auto_801002 ) ) ( not ( = ?auto_800997 ?auto_800998 ) ) ( not ( = ?auto_800997 ?auto_800999 ) ) ( not ( = ?auto_800997 ?auto_801000 ) ) ( not ( = ?auto_800997 ?auto_801001 ) ) ( not ( = ?auto_800997 ?auto_801002 ) ) ( not ( = ?auto_800998 ?auto_800999 ) ) ( not ( = ?auto_800998 ?auto_801000 ) ) ( not ( = ?auto_800998 ?auto_801001 ) ) ( not ( = ?auto_800998 ?auto_801002 ) ) ( not ( = ?auto_800999 ?auto_801000 ) ) ( not ( = ?auto_800999 ?auto_801001 ) ) ( not ( = ?auto_800999 ?auto_801002 ) ) ( not ( = ?auto_801000 ?auto_801001 ) ) ( not ( = ?auto_801000 ?auto_801002 ) ) ( not ( = ?auto_801001 ?auto_801002 ) ) ( ON ?auto_801001 ?auto_801002 ) ( ON ?auto_801000 ?auto_801001 ) ( ON ?auto_800999 ?auto_801000 ) ( ON ?auto_800998 ?auto_800999 ) ( ON ?auto_800997 ?auto_800998 ) ( ON ?auto_800996 ?auto_800997 ) ( ON ?auto_800995 ?auto_800996 ) ( ON ?auto_800994 ?auto_800995 ) ( ON ?auto_800993 ?auto_800994 ) ( ON ?auto_800992 ?auto_800993 ) ( ON ?auto_800991 ?auto_800992 ) ( ON ?auto_800990 ?auto_800991 ) ( ON ?auto_800989 ?auto_800990 ) ( CLEAR ?auto_800987 ) ( ON ?auto_800988 ?auto_800989 ) ( CLEAR ?auto_800988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_800985 ?auto_800986 ?auto_800987 ?auto_800988 )
      ( MAKE-18PILE ?auto_800985 ?auto_800986 ?auto_800987 ?auto_800988 ?auto_800989 ?auto_800990 ?auto_800991 ?auto_800992 ?auto_800993 ?auto_800994 ?auto_800995 ?auto_800996 ?auto_800997 ?auto_800998 ?auto_800999 ?auto_801000 ?auto_801001 ?auto_801002 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_801021 - BLOCK
      ?auto_801022 - BLOCK
      ?auto_801023 - BLOCK
      ?auto_801024 - BLOCK
      ?auto_801025 - BLOCK
      ?auto_801026 - BLOCK
      ?auto_801027 - BLOCK
      ?auto_801028 - BLOCK
      ?auto_801029 - BLOCK
      ?auto_801030 - BLOCK
      ?auto_801031 - BLOCK
      ?auto_801032 - BLOCK
      ?auto_801033 - BLOCK
      ?auto_801034 - BLOCK
      ?auto_801035 - BLOCK
      ?auto_801036 - BLOCK
      ?auto_801037 - BLOCK
      ?auto_801038 - BLOCK
    )
    :vars
    (
      ?auto_801039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801038 ?auto_801039 ) ( ON-TABLE ?auto_801021 ) ( ON ?auto_801022 ?auto_801021 ) ( not ( = ?auto_801021 ?auto_801022 ) ) ( not ( = ?auto_801021 ?auto_801023 ) ) ( not ( = ?auto_801021 ?auto_801024 ) ) ( not ( = ?auto_801021 ?auto_801025 ) ) ( not ( = ?auto_801021 ?auto_801026 ) ) ( not ( = ?auto_801021 ?auto_801027 ) ) ( not ( = ?auto_801021 ?auto_801028 ) ) ( not ( = ?auto_801021 ?auto_801029 ) ) ( not ( = ?auto_801021 ?auto_801030 ) ) ( not ( = ?auto_801021 ?auto_801031 ) ) ( not ( = ?auto_801021 ?auto_801032 ) ) ( not ( = ?auto_801021 ?auto_801033 ) ) ( not ( = ?auto_801021 ?auto_801034 ) ) ( not ( = ?auto_801021 ?auto_801035 ) ) ( not ( = ?auto_801021 ?auto_801036 ) ) ( not ( = ?auto_801021 ?auto_801037 ) ) ( not ( = ?auto_801021 ?auto_801038 ) ) ( not ( = ?auto_801021 ?auto_801039 ) ) ( not ( = ?auto_801022 ?auto_801023 ) ) ( not ( = ?auto_801022 ?auto_801024 ) ) ( not ( = ?auto_801022 ?auto_801025 ) ) ( not ( = ?auto_801022 ?auto_801026 ) ) ( not ( = ?auto_801022 ?auto_801027 ) ) ( not ( = ?auto_801022 ?auto_801028 ) ) ( not ( = ?auto_801022 ?auto_801029 ) ) ( not ( = ?auto_801022 ?auto_801030 ) ) ( not ( = ?auto_801022 ?auto_801031 ) ) ( not ( = ?auto_801022 ?auto_801032 ) ) ( not ( = ?auto_801022 ?auto_801033 ) ) ( not ( = ?auto_801022 ?auto_801034 ) ) ( not ( = ?auto_801022 ?auto_801035 ) ) ( not ( = ?auto_801022 ?auto_801036 ) ) ( not ( = ?auto_801022 ?auto_801037 ) ) ( not ( = ?auto_801022 ?auto_801038 ) ) ( not ( = ?auto_801022 ?auto_801039 ) ) ( not ( = ?auto_801023 ?auto_801024 ) ) ( not ( = ?auto_801023 ?auto_801025 ) ) ( not ( = ?auto_801023 ?auto_801026 ) ) ( not ( = ?auto_801023 ?auto_801027 ) ) ( not ( = ?auto_801023 ?auto_801028 ) ) ( not ( = ?auto_801023 ?auto_801029 ) ) ( not ( = ?auto_801023 ?auto_801030 ) ) ( not ( = ?auto_801023 ?auto_801031 ) ) ( not ( = ?auto_801023 ?auto_801032 ) ) ( not ( = ?auto_801023 ?auto_801033 ) ) ( not ( = ?auto_801023 ?auto_801034 ) ) ( not ( = ?auto_801023 ?auto_801035 ) ) ( not ( = ?auto_801023 ?auto_801036 ) ) ( not ( = ?auto_801023 ?auto_801037 ) ) ( not ( = ?auto_801023 ?auto_801038 ) ) ( not ( = ?auto_801023 ?auto_801039 ) ) ( not ( = ?auto_801024 ?auto_801025 ) ) ( not ( = ?auto_801024 ?auto_801026 ) ) ( not ( = ?auto_801024 ?auto_801027 ) ) ( not ( = ?auto_801024 ?auto_801028 ) ) ( not ( = ?auto_801024 ?auto_801029 ) ) ( not ( = ?auto_801024 ?auto_801030 ) ) ( not ( = ?auto_801024 ?auto_801031 ) ) ( not ( = ?auto_801024 ?auto_801032 ) ) ( not ( = ?auto_801024 ?auto_801033 ) ) ( not ( = ?auto_801024 ?auto_801034 ) ) ( not ( = ?auto_801024 ?auto_801035 ) ) ( not ( = ?auto_801024 ?auto_801036 ) ) ( not ( = ?auto_801024 ?auto_801037 ) ) ( not ( = ?auto_801024 ?auto_801038 ) ) ( not ( = ?auto_801024 ?auto_801039 ) ) ( not ( = ?auto_801025 ?auto_801026 ) ) ( not ( = ?auto_801025 ?auto_801027 ) ) ( not ( = ?auto_801025 ?auto_801028 ) ) ( not ( = ?auto_801025 ?auto_801029 ) ) ( not ( = ?auto_801025 ?auto_801030 ) ) ( not ( = ?auto_801025 ?auto_801031 ) ) ( not ( = ?auto_801025 ?auto_801032 ) ) ( not ( = ?auto_801025 ?auto_801033 ) ) ( not ( = ?auto_801025 ?auto_801034 ) ) ( not ( = ?auto_801025 ?auto_801035 ) ) ( not ( = ?auto_801025 ?auto_801036 ) ) ( not ( = ?auto_801025 ?auto_801037 ) ) ( not ( = ?auto_801025 ?auto_801038 ) ) ( not ( = ?auto_801025 ?auto_801039 ) ) ( not ( = ?auto_801026 ?auto_801027 ) ) ( not ( = ?auto_801026 ?auto_801028 ) ) ( not ( = ?auto_801026 ?auto_801029 ) ) ( not ( = ?auto_801026 ?auto_801030 ) ) ( not ( = ?auto_801026 ?auto_801031 ) ) ( not ( = ?auto_801026 ?auto_801032 ) ) ( not ( = ?auto_801026 ?auto_801033 ) ) ( not ( = ?auto_801026 ?auto_801034 ) ) ( not ( = ?auto_801026 ?auto_801035 ) ) ( not ( = ?auto_801026 ?auto_801036 ) ) ( not ( = ?auto_801026 ?auto_801037 ) ) ( not ( = ?auto_801026 ?auto_801038 ) ) ( not ( = ?auto_801026 ?auto_801039 ) ) ( not ( = ?auto_801027 ?auto_801028 ) ) ( not ( = ?auto_801027 ?auto_801029 ) ) ( not ( = ?auto_801027 ?auto_801030 ) ) ( not ( = ?auto_801027 ?auto_801031 ) ) ( not ( = ?auto_801027 ?auto_801032 ) ) ( not ( = ?auto_801027 ?auto_801033 ) ) ( not ( = ?auto_801027 ?auto_801034 ) ) ( not ( = ?auto_801027 ?auto_801035 ) ) ( not ( = ?auto_801027 ?auto_801036 ) ) ( not ( = ?auto_801027 ?auto_801037 ) ) ( not ( = ?auto_801027 ?auto_801038 ) ) ( not ( = ?auto_801027 ?auto_801039 ) ) ( not ( = ?auto_801028 ?auto_801029 ) ) ( not ( = ?auto_801028 ?auto_801030 ) ) ( not ( = ?auto_801028 ?auto_801031 ) ) ( not ( = ?auto_801028 ?auto_801032 ) ) ( not ( = ?auto_801028 ?auto_801033 ) ) ( not ( = ?auto_801028 ?auto_801034 ) ) ( not ( = ?auto_801028 ?auto_801035 ) ) ( not ( = ?auto_801028 ?auto_801036 ) ) ( not ( = ?auto_801028 ?auto_801037 ) ) ( not ( = ?auto_801028 ?auto_801038 ) ) ( not ( = ?auto_801028 ?auto_801039 ) ) ( not ( = ?auto_801029 ?auto_801030 ) ) ( not ( = ?auto_801029 ?auto_801031 ) ) ( not ( = ?auto_801029 ?auto_801032 ) ) ( not ( = ?auto_801029 ?auto_801033 ) ) ( not ( = ?auto_801029 ?auto_801034 ) ) ( not ( = ?auto_801029 ?auto_801035 ) ) ( not ( = ?auto_801029 ?auto_801036 ) ) ( not ( = ?auto_801029 ?auto_801037 ) ) ( not ( = ?auto_801029 ?auto_801038 ) ) ( not ( = ?auto_801029 ?auto_801039 ) ) ( not ( = ?auto_801030 ?auto_801031 ) ) ( not ( = ?auto_801030 ?auto_801032 ) ) ( not ( = ?auto_801030 ?auto_801033 ) ) ( not ( = ?auto_801030 ?auto_801034 ) ) ( not ( = ?auto_801030 ?auto_801035 ) ) ( not ( = ?auto_801030 ?auto_801036 ) ) ( not ( = ?auto_801030 ?auto_801037 ) ) ( not ( = ?auto_801030 ?auto_801038 ) ) ( not ( = ?auto_801030 ?auto_801039 ) ) ( not ( = ?auto_801031 ?auto_801032 ) ) ( not ( = ?auto_801031 ?auto_801033 ) ) ( not ( = ?auto_801031 ?auto_801034 ) ) ( not ( = ?auto_801031 ?auto_801035 ) ) ( not ( = ?auto_801031 ?auto_801036 ) ) ( not ( = ?auto_801031 ?auto_801037 ) ) ( not ( = ?auto_801031 ?auto_801038 ) ) ( not ( = ?auto_801031 ?auto_801039 ) ) ( not ( = ?auto_801032 ?auto_801033 ) ) ( not ( = ?auto_801032 ?auto_801034 ) ) ( not ( = ?auto_801032 ?auto_801035 ) ) ( not ( = ?auto_801032 ?auto_801036 ) ) ( not ( = ?auto_801032 ?auto_801037 ) ) ( not ( = ?auto_801032 ?auto_801038 ) ) ( not ( = ?auto_801032 ?auto_801039 ) ) ( not ( = ?auto_801033 ?auto_801034 ) ) ( not ( = ?auto_801033 ?auto_801035 ) ) ( not ( = ?auto_801033 ?auto_801036 ) ) ( not ( = ?auto_801033 ?auto_801037 ) ) ( not ( = ?auto_801033 ?auto_801038 ) ) ( not ( = ?auto_801033 ?auto_801039 ) ) ( not ( = ?auto_801034 ?auto_801035 ) ) ( not ( = ?auto_801034 ?auto_801036 ) ) ( not ( = ?auto_801034 ?auto_801037 ) ) ( not ( = ?auto_801034 ?auto_801038 ) ) ( not ( = ?auto_801034 ?auto_801039 ) ) ( not ( = ?auto_801035 ?auto_801036 ) ) ( not ( = ?auto_801035 ?auto_801037 ) ) ( not ( = ?auto_801035 ?auto_801038 ) ) ( not ( = ?auto_801035 ?auto_801039 ) ) ( not ( = ?auto_801036 ?auto_801037 ) ) ( not ( = ?auto_801036 ?auto_801038 ) ) ( not ( = ?auto_801036 ?auto_801039 ) ) ( not ( = ?auto_801037 ?auto_801038 ) ) ( not ( = ?auto_801037 ?auto_801039 ) ) ( not ( = ?auto_801038 ?auto_801039 ) ) ( ON ?auto_801037 ?auto_801038 ) ( ON ?auto_801036 ?auto_801037 ) ( ON ?auto_801035 ?auto_801036 ) ( ON ?auto_801034 ?auto_801035 ) ( ON ?auto_801033 ?auto_801034 ) ( ON ?auto_801032 ?auto_801033 ) ( ON ?auto_801031 ?auto_801032 ) ( ON ?auto_801030 ?auto_801031 ) ( ON ?auto_801029 ?auto_801030 ) ( ON ?auto_801028 ?auto_801029 ) ( ON ?auto_801027 ?auto_801028 ) ( ON ?auto_801026 ?auto_801027 ) ( ON ?auto_801025 ?auto_801026 ) ( ON ?auto_801024 ?auto_801025 ) ( CLEAR ?auto_801022 ) ( ON ?auto_801023 ?auto_801024 ) ( CLEAR ?auto_801023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_801021 ?auto_801022 ?auto_801023 )
      ( MAKE-18PILE ?auto_801021 ?auto_801022 ?auto_801023 ?auto_801024 ?auto_801025 ?auto_801026 ?auto_801027 ?auto_801028 ?auto_801029 ?auto_801030 ?auto_801031 ?auto_801032 ?auto_801033 ?auto_801034 ?auto_801035 ?auto_801036 ?auto_801037 ?auto_801038 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_801058 - BLOCK
      ?auto_801059 - BLOCK
      ?auto_801060 - BLOCK
      ?auto_801061 - BLOCK
      ?auto_801062 - BLOCK
      ?auto_801063 - BLOCK
      ?auto_801064 - BLOCK
      ?auto_801065 - BLOCK
      ?auto_801066 - BLOCK
      ?auto_801067 - BLOCK
      ?auto_801068 - BLOCK
      ?auto_801069 - BLOCK
      ?auto_801070 - BLOCK
      ?auto_801071 - BLOCK
      ?auto_801072 - BLOCK
      ?auto_801073 - BLOCK
      ?auto_801074 - BLOCK
      ?auto_801075 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_801075 ) ( ON-TABLE ?auto_801058 ) ( ON ?auto_801059 ?auto_801058 ) ( not ( = ?auto_801058 ?auto_801059 ) ) ( not ( = ?auto_801058 ?auto_801060 ) ) ( not ( = ?auto_801058 ?auto_801061 ) ) ( not ( = ?auto_801058 ?auto_801062 ) ) ( not ( = ?auto_801058 ?auto_801063 ) ) ( not ( = ?auto_801058 ?auto_801064 ) ) ( not ( = ?auto_801058 ?auto_801065 ) ) ( not ( = ?auto_801058 ?auto_801066 ) ) ( not ( = ?auto_801058 ?auto_801067 ) ) ( not ( = ?auto_801058 ?auto_801068 ) ) ( not ( = ?auto_801058 ?auto_801069 ) ) ( not ( = ?auto_801058 ?auto_801070 ) ) ( not ( = ?auto_801058 ?auto_801071 ) ) ( not ( = ?auto_801058 ?auto_801072 ) ) ( not ( = ?auto_801058 ?auto_801073 ) ) ( not ( = ?auto_801058 ?auto_801074 ) ) ( not ( = ?auto_801058 ?auto_801075 ) ) ( not ( = ?auto_801059 ?auto_801060 ) ) ( not ( = ?auto_801059 ?auto_801061 ) ) ( not ( = ?auto_801059 ?auto_801062 ) ) ( not ( = ?auto_801059 ?auto_801063 ) ) ( not ( = ?auto_801059 ?auto_801064 ) ) ( not ( = ?auto_801059 ?auto_801065 ) ) ( not ( = ?auto_801059 ?auto_801066 ) ) ( not ( = ?auto_801059 ?auto_801067 ) ) ( not ( = ?auto_801059 ?auto_801068 ) ) ( not ( = ?auto_801059 ?auto_801069 ) ) ( not ( = ?auto_801059 ?auto_801070 ) ) ( not ( = ?auto_801059 ?auto_801071 ) ) ( not ( = ?auto_801059 ?auto_801072 ) ) ( not ( = ?auto_801059 ?auto_801073 ) ) ( not ( = ?auto_801059 ?auto_801074 ) ) ( not ( = ?auto_801059 ?auto_801075 ) ) ( not ( = ?auto_801060 ?auto_801061 ) ) ( not ( = ?auto_801060 ?auto_801062 ) ) ( not ( = ?auto_801060 ?auto_801063 ) ) ( not ( = ?auto_801060 ?auto_801064 ) ) ( not ( = ?auto_801060 ?auto_801065 ) ) ( not ( = ?auto_801060 ?auto_801066 ) ) ( not ( = ?auto_801060 ?auto_801067 ) ) ( not ( = ?auto_801060 ?auto_801068 ) ) ( not ( = ?auto_801060 ?auto_801069 ) ) ( not ( = ?auto_801060 ?auto_801070 ) ) ( not ( = ?auto_801060 ?auto_801071 ) ) ( not ( = ?auto_801060 ?auto_801072 ) ) ( not ( = ?auto_801060 ?auto_801073 ) ) ( not ( = ?auto_801060 ?auto_801074 ) ) ( not ( = ?auto_801060 ?auto_801075 ) ) ( not ( = ?auto_801061 ?auto_801062 ) ) ( not ( = ?auto_801061 ?auto_801063 ) ) ( not ( = ?auto_801061 ?auto_801064 ) ) ( not ( = ?auto_801061 ?auto_801065 ) ) ( not ( = ?auto_801061 ?auto_801066 ) ) ( not ( = ?auto_801061 ?auto_801067 ) ) ( not ( = ?auto_801061 ?auto_801068 ) ) ( not ( = ?auto_801061 ?auto_801069 ) ) ( not ( = ?auto_801061 ?auto_801070 ) ) ( not ( = ?auto_801061 ?auto_801071 ) ) ( not ( = ?auto_801061 ?auto_801072 ) ) ( not ( = ?auto_801061 ?auto_801073 ) ) ( not ( = ?auto_801061 ?auto_801074 ) ) ( not ( = ?auto_801061 ?auto_801075 ) ) ( not ( = ?auto_801062 ?auto_801063 ) ) ( not ( = ?auto_801062 ?auto_801064 ) ) ( not ( = ?auto_801062 ?auto_801065 ) ) ( not ( = ?auto_801062 ?auto_801066 ) ) ( not ( = ?auto_801062 ?auto_801067 ) ) ( not ( = ?auto_801062 ?auto_801068 ) ) ( not ( = ?auto_801062 ?auto_801069 ) ) ( not ( = ?auto_801062 ?auto_801070 ) ) ( not ( = ?auto_801062 ?auto_801071 ) ) ( not ( = ?auto_801062 ?auto_801072 ) ) ( not ( = ?auto_801062 ?auto_801073 ) ) ( not ( = ?auto_801062 ?auto_801074 ) ) ( not ( = ?auto_801062 ?auto_801075 ) ) ( not ( = ?auto_801063 ?auto_801064 ) ) ( not ( = ?auto_801063 ?auto_801065 ) ) ( not ( = ?auto_801063 ?auto_801066 ) ) ( not ( = ?auto_801063 ?auto_801067 ) ) ( not ( = ?auto_801063 ?auto_801068 ) ) ( not ( = ?auto_801063 ?auto_801069 ) ) ( not ( = ?auto_801063 ?auto_801070 ) ) ( not ( = ?auto_801063 ?auto_801071 ) ) ( not ( = ?auto_801063 ?auto_801072 ) ) ( not ( = ?auto_801063 ?auto_801073 ) ) ( not ( = ?auto_801063 ?auto_801074 ) ) ( not ( = ?auto_801063 ?auto_801075 ) ) ( not ( = ?auto_801064 ?auto_801065 ) ) ( not ( = ?auto_801064 ?auto_801066 ) ) ( not ( = ?auto_801064 ?auto_801067 ) ) ( not ( = ?auto_801064 ?auto_801068 ) ) ( not ( = ?auto_801064 ?auto_801069 ) ) ( not ( = ?auto_801064 ?auto_801070 ) ) ( not ( = ?auto_801064 ?auto_801071 ) ) ( not ( = ?auto_801064 ?auto_801072 ) ) ( not ( = ?auto_801064 ?auto_801073 ) ) ( not ( = ?auto_801064 ?auto_801074 ) ) ( not ( = ?auto_801064 ?auto_801075 ) ) ( not ( = ?auto_801065 ?auto_801066 ) ) ( not ( = ?auto_801065 ?auto_801067 ) ) ( not ( = ?auto_801065 ?auto_801068 ) ) ( not ( = ?auto_801065 ?auto_801069 ) ) ( not ( = ?auto_801065 ?auto_801070 ) ) ( not ( = ?auto_801065 ?auto_801071 ) ) ( not ( = ?auto_801065 ?auto_801072 ) ) ( not ( = ?auto_801065 ?auto_801073 ) ) ( not ( = ?auto_801065 ?auto_801074 ) ) ( not ( = ?auto_801065 ?auto_801075 ) ) ( not ( = ?auto_801066 ?auto_801067 ) ) ( not ( = ?auto_801066 ?auto_801068 ) ) ( not ( = ?auto_801066 ?auto_801069 ) ) ( not ( = ?auto_801066 ?auto_801070 ) ) ( not ( = ?auto_801066 ?auto_801071 ) ) ( not ( = ?auto_801066 ?auto_801072 ) ) ( not ( = ?auto_801066 ?auto_801073 ) ) ( not ( = ?auto_801066 ?auto_801074 ) ) ( not ( = ?auto_801066 ?auto_801075 ) ) ( not ( = ?auto_801067 ?auto_801068 ) ) ( not ( = ?auto_801067 ?auto_801069 ) ) ( not ( = ?auto_801067 ?auto_801070 ) ) ( not ( = ?auto_801067 ?auto_801071 ) ) ( not ( = ?auto_801067 ?auto_801072 ) ) ( not ( = ?auto_801067 ?auto_801073 ) ) ( not ( = ?auto_801067 ?auto_801074 ) ) ( not ( = ?auto_801067 ?auto_801075 ) ) ( not ( = ?auto_801068 ?auto_801069 ) ) ( not ( = ?auto_801068 ?auto_801070 ) ) ( not ( = ?auto_801068 ?auto_801071 ) ) ( not ( = ?auto_801068 ?auto_801072 ) ) ( not ( = ?auto_801068 ?auto_801073 ) ) ( not ( = ?auto_801068 ?auto_801074 ) ) ( not ( = ?auto_801068 ?auto_801075 ) ) ( not ( = ?auto_801069 ?auto_801070 ) ) ( not ( = ?auto_801069 ?auto_801071 ) ) ( not ( = ?auto_801069 ?auto_801072 ) ) ( not ( = ?auto_801069 ?auto_801073 ) ) ( not ( = ?auto_801069 ?auto_801074 ) ) ( not ( = ?auto_801069 ?auto_801075 ) ) ( not ( = ?auto_801070 ?auto_801071 ) ) ( not ( = ?auto_801070 ?auto_801072 ) ) ( not ( = ?auto_801070 ?auto_801073 ) ) ( not ( = ?auto_801070 ?auto_801074 ) ) ( not ( = ?auto_801070 ?auto_801075 ) ) ( not ( = ?auto_801071 ?auto_801072 ) ) ( not ( = ?auto_801071 ?auto_801073 ) ) ( not ( = ?auto_801071 ?auto_801074 ) ) ( not ( = ?auto_801071 ?auto_801075 ) ) ( not ( = ?auto_801072 ?auto_801073 ) ) ( not ( = ?auto_801072 ?auto_801074 ) ) ( not ( = ?auto_801072 ?auto_801075 ) ) ( not ( = ?auto_801073 ?auto_801074 ) ) ( not ( = ?auto_801073 ?auto_801075 ) ) ( not ( = ?auto_801074 ?auto_801075 ) ) ( ON ?auto_801074 ?auto_801075 ) ( ON ?auto_801073 ?auto_801074 ) ( ON ?auto_801072 ?auto_801073 ) ( ON ?auto_801071 ?auto_801072 ) ( ON ?auto_801070 ?auto_801071 ) ( ON ?auto_801069 ?auto_801070 ) ( ON ?auto_801068 ?auto_801069 ) ( ON ?auto_801067 ?auto_801068 ) ( ON ?auto_801066 ?auto_801067 ) ( ON ?auto_801065 ?auto_801066 ) ( ON ?auto_801064 ?auto_801065 ) ( ON ?auto_801063 ?auto_801064 ) ( ON ?auto_801062 ?auto_801063 ) ( ON ?auto_801061 ?auto_801062 ) ( CLEAR ?auto_801059 ) ( ON ?auto_801060 ?auto_801061 ) ( CLEAR ?auto_801060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_801058 ?auto_801059 ?auto_801060 )
      ( MAKE-18PILE ?auto_801058 ?auto_801059 ?auto_801060 ?auto_801061 ?auto_801062 ?auto_801063 ?auto_801064 ?auto_801065 ?auto_801066 ?auto_801067 ?auto_801068 ?auto_801069 ?auto_801070 ?auto_801071 ?auto_801072 ?auto_801073 ?auto_801074 ?auto_801075 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_801094 - BLOCK
      ?auto_801095 - BLOCK
      ?auto_801096 - BLOCK
      ?auto_801097 - BLOCK
      ?auto_801098 - BLOCK
      ?auto_801099 - BLOCK
      ?auto_801100 - BLOCK
      ?auto_801101 - BLOCK
      ?auto_801102 - BLOCK
      ?auto_801103 - BLOCK
      ?auto_801104 - BLOCK
      ?auto_801105 - BLOCK
      ?auto_801106 - BLOCK
      ?auto_801107 - BLOCK
      ?auto_801108 - BLOCK
      ?auto_801109 - BLOCK
      ?auto_801110 - BLOCK
      ?auto_801111 - BLOCK
    )
    :vars
    (
      ?auto_801112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801111 ?auto_801112 ) ( ON-TABLE ?auto_801094 ) ( not ( = ?auto_801094 ?auto_801095 ) ) ( not ( = ?auto_801094 ?auto_801096 ) ) ( not ( = ?auto_801094 ?auto_801097 ) ) ( not ( = ?auto_801094 ?auto_801098 ) ) ( not ( = ?auto_801094 ?auto_801099 ) ) ( not ( = ?auto_801094 ?auto_801100 ) ) ( not ( = ?auto_801094 ?auto_801101 ) ) ( not ( = ?auto_801094 ?auto_801102 ) ) ( not ( = ?auto_801094 ?auto_801103 ) ) ( not ( = ?auto_801094 ?auto_801104 ) ) ( not ( = ?auto_801094 ?auto_801105 ) ) ( not ( = ?auto_801094 ?auto_801106 ) ) ( not ( = ?auto_801094 ?auto_801107 ) ) ( not ( = ?auto_801094 ?auto_801108 ) ) ( not ( = ?auto_801094 ?auto_801109 ) ) ( not ( = ?auto_801094 ?auto_801110 ) ) ( not ( = ?auto_801094 ?auto_801111 ) ) ( not ( = ?auto_801094 ?auto_801112 ) ) ( not ( = ?auto_801095 ?auto_801096 ) ) ( not ( = ?auto_801095 ?auto_801097 ) ) ( not ( = ?auto_801095 ?auto_801098 ) ) ( not ( = ?auto_801095 ?auto_801099 ) ) ( not ( = ?auto_801095 ?auto_801100 ) ) ( not ( = ?auto_801095 ?auto_801101 ) ) ( not ( = ?auto_801095 ?auto_801102 ) ) ( not ( = ?auto_801095 ?auto_801103 ) ) ( not ( = ?auto_801095 ?auto_801104 ) ) ( not ( = ?auto_801095 ?auto_801105 ) ) ( not ( = ?auto_801095 ?auto_801106 ) ) ( not ( = ?auto_801095 ?auto_801107 ) ) ( not ( = ?auto_801095 ?auto_801108 ) ) ( not ( = ?auto_801095 ?auto_801109 ) ) ( not ( = ?auto_801095 ?auto_801110 ) ) ( not ( = ?auto_801095 ?auto_801111 ) ) ( not ( = ?auto_801095 ?auto_801112 ) ) ( not ( = ?auto_801096 ?auto_801097 ) ) ( not ( = ?auto_801096 ?auto_801098 ) ) ( not ( = ?auto_801096 ?auto_801099 ) ) ( not ( = ?auto_801096 ?auto_801100 ) ) ( not ( = ?auto_801096 ?auto_801101 ) ) ( not ( = ?auto_801096 ?auto_801102 ) ) ( not ( = ?auto_801096 ?auto_801103 ) ) ( not ( = ?auto_801096 ?auto_801104 ) ) ( not ( = ?auto_801096 ?auto_801105 ) ) ( not ( = ?auto_801096 ?auto_801106 ) ) ( not ( = ?auto_801096 ?auto_801107 ) ) ( not ( = ?auto_801096 ?auto_801108 ) ) ( not ( = ?auto_801096 ?auto_801109 ) ) ( not ( = ?auto_801096 ?auto_801110 ) ) ( not ( = ?auto_801096 ?auto_801111 ) ) ( not ( = ?auto_801096 ?auto_801112 ) ) ( not ( = ?auto_801097 ?auto_801098 ) ) ( not ( = ?auto_801097 ?auto_801099 ) ) ( not ( = ?auto_801097 ?auto_801100 ) ) ( not ( = ?auto_801097 ?auto_801101 ) ) ( not ( = ?auto_801097 ?auto_801102 ) ) ( not ( = ?auto_801097 ?auto_801103 ) ) ( not ( = ?auto_801097 ?auto_801104 ) ) ( not ( = ?auto_801097 ?auto_801105 ) ) ( not ( = ?auto_801097 ?auto_801106 ) ) ( not ( = ?auto_801097 ?auto_801107 ) ) ( not ( = ?auto_801097 ?auto_801108 ) ) ( not ( = ?auto_801097 ?auto_801109 ) ) ( not ( = ?auto_801097 ?auto_801110 ) ) ( not ( = ?auto_801097 ?auto_801111 ) ) ( not ( = ?auto_801097 ?auto_801112 ) ) ( not ( = ?auto_801098 ?auto_801099 ) ) ( not ( = ?auto_801098 ?auto_801100 ) ) ( not ( = ?auto_801098 ?auto_801101 ) ) ( not ( = ?auto_801098 ?auto_801102 ) ) ( not ( = ?auto_801098 ?auto_801103 ) ) ( not ( = ?auto_801098 ?auto_801104 ) ) ( not ( = ?auto_801098 ?auto_801105 ) ) ( not ( = ?auto_801098 ?auto_801106 ) ) ( not ( = ?auto_801098 ?auto_801107 ) ) ( not ( = ?auto_801098 ?auto_801108 ) ) ( not ( = ?auto_801098 ?auto_801109 ) ) ( not ( = ?auto_801098 ?auto_801110 ) ) ( not ( = ?auto_801098 ?auto_801111 ) ) ( not ( = ?auto_801098 ?auto_801112 ) ) ( not ( = ?auto_801099 ?auto_801100 ) ) ( not ( = ?auto_801099 ?auto_801101 ) ) ( not ( = ?auto_801099 ?auto_801102 ) ) ( not ( = ?auto_801099 ?auto_801103 ) ) ( not ( = ?auto_801099 ?auto_801104 ) ) ( not ( = ?auto_801099 ?auto_801105 ) ) ( not ( = ?auto_801099 ?auto_801106 ) ) ( not ( = ?auto_801099 ?auto_801107 ) ) ( not ( = ?auto_801099 ?auto_801108 ) ) ( not ( = ?auto_801099 ?auto_801109 ) ) ( not ( = ?auto_801099 ?auto_801110 ) ) ( not ( = ?auto_801099 ?auto_801111 ) ) ( not ( = ?auto_801099 ?auto_801112 ) ) ( not ( = ?auto_801100 ?auto_801101 ) ) ( not ( = ?auto_801100 ?auto_801102 ) ) ( not ( = ?auto_801100 ?auto_801103 ) ) ( not ( = ?auto_801100 ?auto_801104 ) ) ( not ( = ?auto_801100 ?auto_801105 ) ) ( not ( = ?auto_801100 ?auto_801106 ) ) ( not ( = ?auto_801100 ?auto_801107 ) ) ( not ( = ?auto_801100 ?auto_801108 ) ) ( not ( = ?auto_801100 ?auto_801109 ) ) ( not ( = ?auto_801100 ?auto_801110 ) ) ( not ( = ?auto_801100 ?auto_801111 ) ) ( not ( = ?auto_801100 ?auto_801112 ) ) ( not ( = ?auto_801101 ?auto_801102 ) ) ( not ( = ?auto_801101 ?auto_801103 ) ) ( not ( = ?auto_801101 ?auto_801104 ) ) ( not ( = ?auto_801101 ?auto_801105 ) ) ( not ( = ?auto_801101 ?auto_801106 ) ) ( not ( = ?auto_801101 ?auto_801107 ) ) ( not ( = ?auto_801101 ?auto_801108 ) ) ( not ( = ?auto_801101 ?auto_801109 ) ) ( not ( = ?auto_801101 ?auto_801110 ) ) ( not ( = ?auto_801101 ?auto_801111 ) ) ( not ( = ?auto_801101 ?auto_801112 ) ) ( not ( = ?auto_801102 ?auto_801103 ) ) ( not ( = ?auto_801102 ?auto_801104 ) ) ( not ( = ?auto_801102 ?auto_801105 ) ) ( not ( = ?auto_801102 ?auto_801106 ) ) ( not ( = ?auto_801102 ?auto_801107 ) ) ( not ( = ?auto_801102 ?auto_801108 ) ) ( not ( = ?auto_801102 ?auto_801109 ) ) ( not ( = ?auto_801102 ?auto_801110 ) ) ( not ( = ?auto_801102 ?auto_801111 ) ) ( not ( = ?auto_801102 ?auto_801112 ) ) ( not ( = ?auto_801103 ?auto_801104 ) ) ( not ( = ?auto_801103 ?auto_801105 ) ) ( not ( = ?auto_801103 ?auto_801106 ) ) ( not ( = ?auto_801103 ?auto_801107 ) ) ( not ( = ?auto_801103 ?auto_801108 ) ) ( not ( = ?auto_801103 ?auto_801109 ) ) ( not ( = ?auto_801103 ?auto_801110 ) ) ( not ( = ?auto_801103 ?auto_801111 ) ) ( not ( = ?auto_801103 ?auto_801112 ) ) ( not ( = ?auto_801104 ?auto_801105 ) ) ( not ( = ?auto_801104 ?auto_801106 ) ) ( not ( = ?auto_801104 ?auto_801107 ) ) ( not ( = ?auto_801104 ?auto_801108 ) ) ( not ( = ?auto_801104 ?auto_801109 ) ) ( not ( = ?auto_801104 ?auto_801110 ) ) ( not ( = ?auto_801104 ?auto_801111 ) ) ( not ( = ?auto_801104 ?auto_801112 ) ) ( not ( = ?auto_801105 ?auto_801106 ) ) ( not ( = ?auto_801105 ?auto_801107 ) ) ( not ( = ?auto_801105 ?auto_801108 ) ) ( not ( = ?auto_801105 ?auto_801109 ) ) ( not ( = ?auto_801105 ?auto_801110 ) ) ( not ( = ?auto_801105 ?auto_801111 ) ) ( not ( = ?auto_801105 ?auto_801112 ) ) ( not ( = ?auto_801106 ?auto_801107 ) ) ( not ( = ?auto_801106 ?auto_801108 ) ) ( not ( = ?auto_801106 ?auto_801109 ) ) ( not ( = ?auto_801106 ?auto_801110 ) ) ( not ( = ?auto_801106 ?auto_801111 ) ) ( not ( = ?auto_801106 ?auto_801112 ) ) ( not ( = ?auto_801107 ?auto_801108 ) ) ( not ( = ?auto_801107 ?auto_801109 ) ) ( not ( = ?auto_801107 ?auto_801110 ) ) ( not ( = ?auto_801107 ?auto_801111 ) ) ( not ( = ?auto_801107 ?auto_801112 ) ) ( not ( = ?auto_801108 ?auto_801109 ) ) ( not ( = ?auto_801108 ?auto_801110 ) ) ( not ( = ?auto_801108 ?auto_801111 ) ) ( not ( = ?auto_801108 ?auto_801112 ) ) ( not ( = ?auto_801109 ?auto_801110 ) ) ( not ( = ?auto_801109 ?auto_801111 ) ) ( not ( = ?auto_801109 ?auto_801112 ) ) ( not ( = ?auto_801110 ?auto_801111 ) ) ( not ( = ?auto_801110 ?auto_801112 ) ) ( not ( = ?auto_801111 ?auto_801112 ) ) ( ON ?auto_801110 ?auto_801111 ) ( ON ?auto_801109 ?auto_801110 ) ( ON ?auto_801108 ?auto_801109 ) ( ON ?auto_801107 ?auto_801108 ) ( ON ?auto_801106 ?auto_801107 ) ( ON ?auto_801105 ?auto_801106 ) ( ON ?auto_801104 ?auto_801105 ) ( ON ?auto_801103 ?auto_801104 ) ( ON ?auto_801102 ?auto_801103 ) ( ON ?auto_801101 ?auto_801102 ) ( ON ?auto_801100 ?auto_801101 ) ( ON ?auto_801099 ?auto_801100 ) ( ON ?auto_801098 ?auto_801099 ) ( ON ?auto_801097 ?auto_801098 ) ( ON ?auto_801096 ?auto_801097 ) ( CLEAR ?auto_801094 ) ( ON ?auto_801095 ?auto_801096 ) ( CLEAR ?auto_801095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_801094 ?auto_801095 )
      ( MAKE-18PILE ?auto_801094 ?auto_801095 ?auto_801096 ?auto_801097 ?auto_801098 ?auto_801099 ?auto_801100 ?auto_801101 ?auto_801102 ?auto_801103 ?auto_801104 ?auto_801105 ?auto_801106 ?auto_801107 ?auto_801108 ?auto_801109 ?auto_801110 ?auto_801111 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_801131 - BLOCK
      ?auto_801132 - BLOCK
      ?auto_801133 - BLOCK
      ?auto_801134 - BLOCK
      ?auto_801135 - BLOCK
      ?auto_801136 - BLOCK
      ?auto_801137 - BLOCK
      ?auto_801138 - BLOCK
      ?auto_801139 - BLOCK
      ?auto_801140 - BLOCK
      ?auto_801141 - BLOCK
      ?auto_801142 - BLOCK
      ?auto_801143 - BLOCK
      ?auto_801144 - BLOCK
      ?auto_801145 - BLOCK
      ?auto_801146 - BLOCK
      ?auto_801147 - BLOCK
      ?auto_801148 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_801148 ) ( ON-TABLE ?auto_801131 ) ( not ( = ?auto_801131 ?auto_801132 ) ) ( not ( = ?auto_801131 ?auto_801133 ) ) ( not ( = ?auto_801131 ?auto_801134 ) ) ( not ( = ?auto_801131 ?auto_801135 ) ) ( not ( = ?auto_801131 ?auto_801136 ) ) ( not ( = ?auto_801131 ?auto_801137 ) ) ( not ( = ?auto_801131 ?auto_801138 ) ) ( not ( = ?auto_801131 ?auto_801139 ) ) ( not ( = ?auto_801131 ?auto_801140 ) ) ( not ( = ?auto_801131 ?auto_801141 ) ) ( not ( = ?auto_801131 ?auto_801142 ) ) ( not ( = ?auto_801131 ?auto_801143 ) ) ( not ( = ?auto_801131 ?auto_801144 ) ) ( not ( = ?auto_801131 ?auto_801145 ) ) ( not ( = ?auto_801131 ?auto_801146 ) ) ( not ( = ?auto_801131 ?auto_801147 ) ) ( not ( = ?auto_801131 ?auto_801148 ) ) ( not ( = ?auto_801132 ?auto_801133 ) ) ( not ( = ?auto_801132 ?auto_801134 ) ) ( not ( = ?auto_801132 ?auto_801135 ) ) ( not ( = ?auto_801132 ?auto_801136 ) ) ( not ( = ?auto_801132 ?auto_801137 ) ) ( not ( = ?auto_801132 ?auto_801138 ) ) ( not ( = ?auto_801132 ?auto_801139 ) ) ( not ( = ?auto_801132 ?auto_801140 ) ) ( not ( = ?auto_801132 ?auto_801141 ) ) ( not ( = ?auto_801132 ?auto_801142 ) ) ( not ( = ?auto_801132 ?auto_801143 ) ) ( not ( = ?auto_801132 ?auto_801144 ) ) ( not ( = ?auto_801132 ?auto_801145 ) ) ( not ( = ?auto_801132 ?auto_801146 ) ) ( not ( = ?auto_801132 ?auto_801147 ) ) ( not ( = ?auto_801132 ?auto_801148 ) ) ( not ( = ?auto_801133 ?auto_801134 ) ) ( not ( = ?auto_801133 ?auto_801135 ) ) ( not ( = ?auto_801133 ?auto_801136 ) ) ( not ( = ?auto_801133 ?auto_801137 ) ) ( not ( = ?auto_801133 ?auto_801138 ) ) ( not ( = ?auto_801133 ?auto_801139 ) ) ( not ( = ?auto_801133 ?auto_801140 ) ) ( not ( = ?auto_801133 ?auto_801141 ) ) ( not ( = ?auto_801133 ?auto_801142 ) ) ( not ( = ?auto_801133 ?auto_801143 ) ) ( not ( = ?auto_801133 ?auto_801144 ) ) ( not ( = ?auto_801133 ?auto_801145 ) ) ( not ( = ?auto_801133 ?auto_801146 ) ) ( not ( = ?auto_801133 ?auto_801147 ) ) ( not ( = ?auto_801133 ?auto_801148 ) ) ( not ( = ?auto_801134 ?auto_801135 ) ) ( not ( = ?auto_801134 ?auto_801136 ) ) ( not ( = ?auto_801134 ?auto_801137 ) ) ( not ( = ?auto_801134 ?auto_801138 ) ) ( not ( = ?auto_801134 ?auto_801139 ) ) ( not ( = ?auto_801134 ?auto_801140 ) ) ( not ( = ?auto_801134 ?auto_801141 ) ) ( not ( = ?auto_801134 ?auto_801142 ) ) ( not ( = ?auto_801134 ?auto_801143 ) ) ( not ( = ?auto_801134 ?auto_801144 ) ) ( not ( = ?auto_801134 ?auto_801145 ) ) ( not ( = ?auto_801134 ?auto_801146 ) ) ( not ( = ?auto_801134 ?auto_801147 ) ) ( not ( = ?auto_801134 ?auto_801148 ) ) ( not ( = ?auto_801135 ?auto_801136 ) ) ( not ( = ?auto_801135 ?auto_801137 ) ) ( not ( = ?auto_801135 ?auto_801138 ) ) ( not ( = ?auto_801135 ?auto_801139 ) ) ( not ( = ?auto_801135 ?auto_801140 ) ) ( not ( = ?auto_801135 ?auto_801141 ) ) ( not ( = ?auto_801135 ?auto_801142 ) ) ( not ( = ?auto_801135 ?auto_801143 ) ) ( not ( = ?auto_801135 ?auto_801144 ) ) ( not ( = ?auto_801135 ?auto_801145 ) ) ( not ( = ?auto_801135 ?auto_801146 ) ) ( not ( = ?auto_801135 ?auto_801147 ) ) ( not ( = ?auto_801135 ?auto_801148 ) ) ( not ( = ?auto_801136 ?auto_801137 ) ) ( not ( = ?auto_801136 ?auto_801138 ) ) ( not ( = ?auto_801136 ?auto_801139 ) ) ( not ( = ?auto_801136 ?auto_801140 ) ) ( not ( = ?auto_801136 ?auto_801141 ) ) ( not ( = ?auto_801136 ?auto_801142 ) ) ( not ( = ?auto_801136 ?auto_801143 ) ) ( not ( = ?auto_801136 ?auto_801144 ) ) ( not ( = ?auto_801136 ?auto_801145 ) ) ( not ( = ?auto_801136 ?auto_801146 ) ) ( not ( = ?auto_801136 ?auto_801147 ) ) ( not ( = ?auto_801136 ?auto_801148 ) ) ( not ( = ?auto_801137 ?auto_801138 ) ) ( not ( = ?auto_801137 ?auto_801139 ) ) ( not ( = ?auto_801137 ?auto_801140 ) ) ( not ( = ?auto_801137 ?auto_801141 ) ) ( not ( = ?auto_801137 ?auto_801142 ) ) ( not ( = ?auto_801137 ?auto_801143 ) ) ( not ( = ?auto_801137 ?auto_801144 ) ) ( not ( = ?auto_801137 ?auto_801145 ) ) ( not ( = ?auto_801137 ?auto_801146 ) ) ( not ( = ?auto_801137 ?auto_801147 ) ) ( not ( = ?auto_801137 ?auto_801148 ) ) ( not ( = ?auto_801138 ?auto_801139 ) ) ( not ( = ?auto_801138 ?auto_801140 ) ) ( not ( = ?auto_801138 ?auto_801141 ) ) ( not ( = ?auto_801138 ?auto_801142 ) ) ( not ( = ?auto_801138 ?auto_801143 ) ) ( not ( = ?auto_801138 ?auto_801144 ) ) ( not ( = ?auto_801138 ?auto_801145 ) ) ( not ( = ?auto_801138 ?auto_801146 ) ) ( not ( = ?auto_801138 ?auto_801147 ) ) ( not ( = ?auto_801138 ?auto_801148 ) ) ( not ( = ?auto_801139 ?auto_801140 ) ) ( not ( = ?auto_801139 ?auto_801141 ) ) ( not ( = ?auto_801139 ?auto_801142 ) ) ( not ( = ?auto_801139 ?auto_801143 ) ) ( not ( = ?auto_801139 ?auto_801144 ) ) ( not ( = ?auto_801139 ?auto_801145 ) ) ( not ( = ?auto_801139 ?auto_801146 ) ) ( not ( = ?auto_801139 ?auto_801147 ) ) ( not ( = ?auto_801139 ?auto_801148 ) ) ( not ( = ?auto_801140 ?auto_801141 ) ) ( not ( = ?auto_801140 ?auto_801142 ) ) ( not ( = ?auto_801140 ?auto_801143 ) ) ( not ( = ?auto_801140 ?auto_801144 ) ) ( not ( = ?auto_801140 ?auto_801145 ) ) ( not ( = ?auto_801140 ?auto_801146 ) ) ( not ( = ?auto_801140 ?auto_801147 ) ) ( not ( = ?auto_801140 ?auto_801148 ) ) ( not ( = ?auto_801141 ?auto_801142 ) ) ( not ( = ?auto_801141 ?auto_801143 ) ) ( not ( = ?auto_801141 ?auto_801144 ) ) ( not ( = ?auto_801141 ?auto_801145 ) ) ( not ( = ?auto_801141 ?auto_801146 ) ) ( not ( = ?auto_801141 ?auto_801147 ) ) ( not ( = ?auto_801141 ?auto_801148 ) ) ( not ( = ?auto_801142 ?auto_801143 ) ) ( not ( = ?auto_801142 ?auto_801144 ) ) ( not ( = ?auto_801142 ?auto_801145 ) ) ( not ( = ?auto_801142 ?auto_801146 ) ) ( not ( = ?auto_801142 ?auto_801147 ) ) ( not ( = ?auto_801142 ?auto_801148 ) ) ( not ( = ?auto_801143 ?auto_801144 ) ) ( not ( = ?auto_801143 ?auto_801145 ) ) ( not ( = ?auto_801143 ?auto_801146 ) ) ( not ( = ?auto_801143 ?auto_801147 ) ) ( not ( = ?auto_801143 ?auto_801148 ) ) ( not ( = ?auto_801144 ?auto_801145 ) ) ( not ( = ?auto_801144 ?auto_801146 ) ) ( not ( = ?auto_801144 ?auto_801147 ) ) ( not ( = ?auto_801144 ?auto_801148 ) ) ( not ( = ?auto_801145 ?auto_801146 ) ) ( not ( = ?auto_801145 ?auto_801147 ) ) ( not ( = ?auto_801145 ?auto_801148 ) ) ( not ( = ?auto_801146 ?auto_801147 ) ) ( not ( = ?auto_801146 ?auto_801148 ) ) ( not ( = ?auto_801147 ?auto_801148 ) ) ( ON ?auto_801147 ?auto_801148 ) ( ON ?auto_801146 ?auto_801147 ) ( ON ?auto_801145 ?auto_801146 ) ( ON ?auto_801144 ?auto_801145 ) ( ON ?auto_801143 ?auto_801144 ) ( ON ?auto_801142 ?auto_801143 ) ( ON ?auto_801141 ?auto_801142 ) ( ON ?auto_801140 ?auto_801141 ) ( ON ?auto_801139 ?auto_801140 ) ( ON ?auto_801138 ?auto_801139 ) ( ON ?auto_801137 ?auto_801138 ) ( ON ?auto_801136 ?auto_801137 ) ( ON ?auto_801135 ?auto_801136 ) ( ON ?auto_801134 ?auto_801135 ) ( ON ?auto_801133 ?auto_801134 ) ( CLEAR ?auto_801131 ) ( ON ?auto_801132 ?auto_801133 ) ( CLEAR ?auto_801132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_801131 ?auto_801132 )
      ( MAKE-18PILE ?auto_801131 ?auto_801132 ?auto_801133 ?auto_801134 ?auto_801135 ?auto_801136 ?auto_801137 ?auto_801138 ?auto_801139 ?auto_801140 ?auto_801141 ?auto_801142 ?auto_801143 ?auto_801144 ?auto_801145 ?auto_801146 ?auto_801147 ?auto_801148 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_801167 - BLOCK
      ?auto_801168 - BLOCK
      ?auto_801169 - BLOCK
      ?auto_801170 - BLOCK
      ?auto_801171 - BLOCK
      ?auto_801172 - BLOCK
      ?auto_801173 - BLOCK
      ?auto_801174 - BLOCK
      ?auto_801175 - BLOCK
      ?auto_801176 - BLOCK
      ?auto_801177 - BLOCK
      ?auto_801178 - BLOCK
      ?auto_801179 - BLOCK
      ?auto_801180 - BLOCK
      ?auto_801181 - BLOCK
      ?auto_801182 - BLOCK
      ?auto_801183 - BLOCK
      ?auto_801184 - BLOCK
    )
    :vars
    (
      ?auto_801185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801184 ?auto_801185 ) ( not ( = ?auto_801167 ?auto_801168 ) ) ( not ( = ?auto_801167 ?auto_801169 ) ) ( not ( = ?auto_801167 ?auto_801170 ) ) ( not ( = ?auto_801167 ?auto_801171 ) ) ( not ( = ?auto_801167 ?auto_801172 ) ) ( not ( = ?auto_801167 ?auto_801173 ) ) ( not ( = ?auto_801167 ?auto_801174 ) ) ( not ( = ?auto_801167 ?auto_801175 ) ) ( not ( = ?auto_801167 ?auto_801176 ) ) ( not ( = ?auto_801167 ?auto_801177 ) ) ( not ( = ?auto_801167 ?auto_801178 ) ) ( not ( = ?auto_801167 ?auto_801179 ) ) ( not ( = ?auto_801167 ?auto_801180 ) ) ( not ( = ?auto_801167 ?auto_801181 ) ) ( not ( = ?auto_801167 ?auto_801182 ) ) ( not ( = ?auto_801167 ?auto_801183 ) ) ( not ( = ?auto_801167 ?auto_801184 ) ) ( not ( = ?auto_801167 ?auto_801185 ) ) ( not ( = ?auto_801168 ?auto_801169 ) ) ( not ( = ?auto_801168 ?auto_801170 ) ) ( not ( = ?auto_801168 ?auto_801171 ) ) ( not ( = ?auto_801168 ?auto_801172 ) ) ( not ( = ?auto_801168 ?auto_801173 ) ) ( not ( = ?auto_801168 ?auto_801174 ) ) ( not ( = ?auto_801168 ?auto_801175 ) ) ( not ( = ?auto_801168 ?auto_801176 ) ) ( not ( = ?auto_801168 ?auto_801177 ) ) ( not ( = ?auto_801168 ?auto_801178 ) ) ( not ( = ?auto_801168 ?auto_801179 ) ) ( not ( = ?auto_801168 ?auto_801180 ) ) ( not ( = ?auto_801168 ?auto_801181 ) ) ( not ( = ?auto_801168 ?auto_801182 ) ) ( not ( = ?auto_801168 ?auto_801183 ) ) ( not ( = ?auto_801168 ?auto_801184 ) ) ( not ( = ?auto_801168 ?auto_801185 ) ) ( not ( = ?auto_801169 ?auto_801170 ) ) ( not ( = ?auto_801169 ?auto_801171 ) ) ( not ( = ?auto_801169 ?auto_801172 ) ) ( not ( = ?auto_801169 ?auto_801173 ) ) ( not ( = ?auto_801169 ?auto_801174 ) ) ( not ( = ?auto_801169 ?auto_801175 ) ) ( not ( = ?auto_801169 ?auto_801176 ) ) ( not ( = ?auto_801169 ?auto_801177 ) ) ( not ( = ?auto_801169 ?auto_801178 ) ) ( not ( = ?auto_801169 ?auto_801179 ) ) ( not ( = ?auto_801169 ?auto_801180 ) ) ( not ( = ?auto_801169 ?auto_801181 ) ) ( not ( = ?auto_801169 ?auto_801182 ) ) ( not ( = ?auto_801169 ?auto_801183 ) ) ( not ( = ?auto_801169 ?auto_801184 ) ) ( not ( = ?auto_801169 ?auto_801185 ) ) ( not ( = ?auto_801170 ?auto_801171 ) ) ( not ( = ?auto_801170 ?auto_801172 ) ) ( not ( = ?auto_801170 ?auto_801173 ) ) ( not ( = ?auto_801170 ?auto_801174 ) ) ( not ( = ?auto_801170 ?auto_801175 ) ) ( not ( = ?auto_801170 ?auto_801176 ) ) ( not ( = ?auto_801170 ?auto_801177 ) ) ( not ( = ?auto_801170 ?auto_801178 ) ) ( not ( = ?auto_801170 ?auto_801179 ) ) ( not ( = ?auto_801170 ?auto_801180 ) ) ( not ( = ?auto_801170 ?auto_801181 ) ) ( not ( = ?auto_801170 ?auto_801182 ) ) ( not ( = ?auto_801170 ?auto_801183 ) ) ( not ( = ?auto_801170 ?auto_801184 ) ) ( not ( = ?auto_801170 ?auto_801185 ) ) ( not ( = ?auto_801171 ?auto_801172 ) ) ( not ( = ?auto_801171 ?auto_801173 ) ) ( not ( = ?auto_801171 ?auto_801174 ) ) ( not ( = ?auto_801171 ?auto_801175 ) ) ( not ( = ?auto_801171 ?auto_801176 ) ) ( not ( = ?auto_801171 ?auto_801177 ) ) ( not ( = ?auto_801171 ?auto_801178 ) ) ( not ( = ?auto_801171 ?auto_801179 ) ) ( not ( = ?auto_801171 ?auto_801180 ) ) ( not ( = ?auto_801171 ?auto_801181 ) ) ( not ( = ?auto_801171 ?auto_801182 ) ) ( not ( = ?auto_801171 ?auto_801183 ) ) ( not ( = ?auto_801171 ?auto_801184 ) ) ( not ( = ?auto_801171 ?auto_801185 ) ) ( not ( = ?auto_801172 ?auto_801173 ) ) ( not ( = ?auto_801172 ?auto_801174 ) ) ( not ( = ?auto_801172 ?auto_801175 ) ) ( not ( = ?auto_801172 ?auto_801176 ) ) ( not ( = ?auto_801172 ?auto_801177 ) ) ( not ( = ?auto_801172 ?auto_801178 ) ) ( not ( = ?auto_801172 ?auto_801179 ) ) ( not ( = ?auto_801172 ?auto_801180 ) ) ( not ( = ?auto_801172 ?auto_801181 ) ) ( not ( = ?auto_801172 ?auto_801182 ) ) ( not ( = ?auto_801172 ?auto_801183 ) ) ( not ( = ?auto_801172 ?auto_801184 ) ) ( not ( = ?auto_801172 ?auto_801185 ) ) ( not ( = ?auto_801173 ?auto_801174 ) ) ( not ( = ?auto_801173 ?auto_801175 ) ) ( not ( = ?auto_801173 ?auto_801176 ) ) ( not ( = ?auto_801173 ?auto_801177 ) ) ( not ( = ?auto_801173 ?auto_801178 ) ) ( not ( = ?auto_801173 ?auto_801179 ) ) ( not ( = ?auto_801173 ?auto_801180 ) ) ( not ( = ?auto_801173 ?auto_801181 ) ) ( not ( = ?auto_801173 ?auto_801182 ) ) ( not ( = ?auto_801173 ?auto_801183 ) ) ( not ( = ?auto_801173 ?auto_801184 ) ) ( not ( = ?auto_801173 ?auto_801185 ) ) ( not ( = ?auto_801174 ?auto_801175 ) ) ( not ( = ?auto_801174 ?auto_801176 ) ) ( not ( = ?auto_801174 ?auto_801177 ) ) ( not ( = ?auto_801174 ?auto_801178 ) ) ( not ( = ?auto_801174 ?auto_801179 ) ) ( not ( = ?auto_801174 ?auto_801180 ) ) ( not ( = ?auto_801174 ?auto_801181 ) ) ( not ( = ?auto_801174 ?auto_801182 ) ) ( not ( = ?auto_801174 ?auto_801183 ) ) ( not ( = ?auto_801174 ?auto_801184 ) ) ( not ( = ?auto_801174 ?auto_801185 ) ) ( not ( = ?auto_801175 ?auto_801176 ) ) ( not ( = ?auto_801175 ?auto_801177 ) ) ( not ( = ?auto_801175 ?auto_801178 ) ) ( not ( = ?auto_801175 ?auto_801179 ) ) ( not ( = ?auto_801175 ?auto_801180 ) ) ( not ( = ?auto_801175 ?auto_801181 ) ) ( not ( = ?auto_801175 ?auto_801182 ) ) ( not ( = ?auto_801175 ?auto_801183 ) ) ( not ( = ?auto_801175 ?auto_801184 ) ) ( not ( = ?auto_801175 ?auto_801185 ) ) ( not ( = ?auto_801176 ?auto_801177 ) ) ( not ( = ?auto_801176 ?auto_801178 ) ) ( not ( = ?auto_801176 ?auto_801179 ) ) ( not ( = ?auto_801176 ?auto_801180 ) ) ( not ( = ?auto_801176 ?auto_801181 ) ) ( not ( = ?auto_801176 ?auto_801182 ) ) ( not ( = ?auto_801176 ?auto_801183 ) ) ( not ( = ?auto_801176 ?auto_801184 ) ) ( not ( = ?auto_801176 ?auto_801185 ) ) ( not ( = ?auto_801177 ?auto_801178 ) ) ( not ( = ?auto_801177 ?auto_801179 ) ) ( not ( = ?auto_801177 ?auto_801180 ) ) ( not ( = ?auto_801177 ?auto_801181 ) ) ( not ( = ?auto_801177 ?auto_801182 ) ) ( not ( = ?auto_801177 ?auto_801183 ) ) ( not ( = ?auto_801177 ?auto_801184 ) ) ( not ( = ?auto_801177 ?auto_801185 ) ) ( not ( = ?auto_801178 ?auto_801179 ) ) ( not ( = ?auto_801178 ?auto_801180 ) ) ( not ( = ?auto_801178 ?auto_801181 ) ) ( not ( = ?auto_801178 ?auto_801182 ) ) ( not ( = ?auto_801178 ?auto_801183 ) ) ( not ( = ?auto_801178 ?auto_801184 ) ) ( not ( = ?auto_801178 ?auto_801185 ) ) ( not ( = ?auto_801179 ?auto_801180 ) ) ( not ( = ?auto_801179 ?auto_801181 ) ) ( not ( = ?auto_801179 ?auto_801182 ) ) ( not ( = ?auto_801179 ?auto_801183 ) ) ( not ( = ?auto_801179 ?auto_801184 ) ) ( not ( = ?auto_801179 ?auto_801185 ) ) ( not ( = ?auto_801180 ?auto_801181 ) ) ( not ( = ?auto_801180 ?auto_801182 ) ) ( not ( = ?auto_801180 ?auto_801183 ) ) ( not ( = ?auto_801180 ?auto_801184 ) ) ( not ( = ?auto_801180 ?auto_801185 ) ) ( not ( = ?auto_801181 ?auto_801182 ) ) ( not ( = ?auto_801181 ?auto_801183 ) ) ( not ( = ?auto_801181 ?auto_801184 ) ) ( not ( = ?auto_801181 ?auto_801185 ) ) ( not ( = ?auto_801182 ?auto_801183 ) ) ( not ( = ?auto_801182 ?auto_801184 ) ) ( not ( = ?auto_801182 ?auto_801185 ) ) ( not ( = ?auto_801183 ?auto_801184 ) ) ( not ( = ?auto_801183 ?auto_801185 ) ) ( not ( = ?auto_801184 ?auto_801185 ) ) ( ON ?auto_801183 ?auto_801184 ) ( ON ?auto_801182 ?auto_801183 ) ( ON ?auto_801181 ?auto_801182 ) ( ON ?auto_801180 ?auto_801181 ) ( ON ?auto_801179 ?auto_801180 ) ( ON ?auto_801178 ?auto_801179 ) ( ON ?auto_801177 ?auto_801178 ) ( ON ?auto_801176 ?auto_801177 ) ( ON ?auto_801175 ?auto_801176 ) ( ON ?auto_801174 ?auto_801175 ) ( ON ?auto_801173 ?auto_801174 ) ( ON ?auto_801172 ?auto_801173 ) ( ON ?auto_801171 ?auto_801172 ) ( ON ?auto_801170 ?auto_801171 ) ( ON ?auto_801169 ?auto_801170 ) ( ON ?auto_801168 ?auto_801169 ) ( ON ?auto_801167 ?auto_801168 ) ( CLEAR ?auto_801167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_801167 )
      ( MAKE-18PILE ?auto_801167 ?auto_801168 ?auto_801169 ?auto_801170 ?auto_801171 ?auto_801172 ?auto_801173 ?auto_801174 ?auto_801175 ?auto_801176 ?auto_801177 ?auto_801178 ?auto_801179 ?auto_801180 ?auto_801181 ?auto_801182 ?auto_801183 ?auto_801184 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_801204 - BLOCK
      ?auto_801205 - BLOCK
      ?auto_801206 - BLOCK
      ?auto_801207 - BLOCK
      ?auto_801208 - BLOCK
      ?auto_801209 - BLOCK
      ?auto_801210 - BLOCK
      ?auto_801211 - BLOCK
      ?auto_801212 - BLOCK
      ?auto_801213 - BLOCK
      ?auto_801214 - BLOCK
      ?auto_801215 - BLOCK
      ?auto_801216 - BLOCK
      ?auto_801217 - BLOCK
      ?auto_801218 - BLOCK
      ?auto_801219 - BLOCK
      ?auto_801220 - BLOCK
      ?auto_801221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_801221 ) ( not ( = ?auto_801204 ?auto_801205 ) ) ( not ( = ?auto_801204 ?auto_801206 ) ) ( not ( = ?auto_801204 ?auto_801207 ) ) ( not ( = ?auto_801204 ?auto_801208 ) ) ( not ( = ?auto_801204 ?auto_801209 ) ) ( not ( = ?auto_801204 ?auto_801210 ) ) ( not ( = ?auto_801204 ?auto_801211 ) ) ( not ( = ?auto_801204 ?auto_801212 ) ) ( not ( = ?auto_801204 ?auto_801213 ) ) ( not ( = ?auto_801204 ?auto_801214 ) ) ( not ( = ?auto_801204 ?auto_801215 ) ) ( not ( = ?auto_801204 ?auto_801216 ) ) ( not ( = ?auto_801204 ?auto_801217 ) ) ( not ( = ?auto_801204 ?auto_801218 ) ) ( not ( = ?auto_801204 ?auto_801219 ) ) ( not ( = ?auto_801204 ?auto_801220 ) ) ( not ( = ?auto_801204 ?auto_801221 ) ) ( not ( = ?auto_801205 ?auto_801206 ) ) ( not ( = ?auto_801205 ?auto_801207 ) ) ( not ( = ?auto_801205 ?auto_801208 ) ) ( not ( = ?auto_801205 ?auto_801209 ) ) ( not ( = ?auto_801205 ?auto_801210 ) ) ( not ( = ?auto_801205 ?auto_801211 ) ) ( not ( = ?auto_801205 ?auto_801212 ) ) ( not ( = ?auto_801205 ?auto_801213 ) ) ( not ( = ?auto_801205 ?auto_801214 ) ) ( not ( = ?auto_801205 ?auto_801215 ) ) ( not ( = ?auto_801205 ?auto_801216 ) ) ( not ( = ?auto_801205 ?auto_801217 ) ) ( not ( = ?auto_801205 ?auto_801218 ) ) ( not ( = ?auto_801205 ?auto_801219 ) ) ( not ( = ?auto_801205 ?auto_801220 ) ) ( not ( = ?auto_801205 ?auto_801221 ) ) ( not ( = ?auto_801206 ?auto_801207 ) ) ( not ( = ?auto_801206 ?auto_801208 ) ) ( not ( = ?auto_801206 ?auto_801209 ) ) ( not ( = ?auto_801206 ?auto_801210 ) ) ( not ( = ?auto_801206 ?auto_801211 ) ) ( not ( = ?auto_801206 ?auto_801212 ) ) ( not ( = ?auto_801206 ?auto_801213 ) ) ( not ( = ?auto_801206 ?auto_801214 ) ) ( not ( = ?auto_801206 ?auto_801215 ) ) ( not ( = ?auto_801206 ?auto_801216 ) ) ( not ( = ?auto_801206 ?auto_801217 ) ) ( not ( = ?auto_801206 ?auto_801218 ) ) ( not ( = ?auto_801206 ?auto_801219 ) ) ( not ( = ?auto_801206 ?auto_801220 ) ) ( not ( = ?auto_801206 ?auto_801221 ) ) ( not ( = ?auto_801207 ?auto_801208 ) ) ( not ( = ?auto_801207 ?auto_801209 ) ) ( not ( = ?auto_801207 ?auto_801210 ) ) ( not ( = ?auto_801207 ?auto_801211 ) ) ( not ( = ?auto_801207 ?auto_801212 ) ) ( not ( = ?auto_801207 ?auto_801213 ) ) ( not ( = ?auto_801207 ?auto_801214 ) ) ( not ( = ?auto_801207 ?auto_801215 ) ) ( not ( = ?auto_801207 ?auto_801216 ) ) ( not ( = ?auto_801207 ?auto_801217 ) ) ( not ( = ?auto_801207 ?auto_801218 ) ) ( not ( = ?auto_801207 ?auto_801219 ) ) ( not ( = ?auto_801207 ?auto_801220 ) ) ( not ( = ?auto_801207 ?auto_801221 ) ) ( not ( = ?auto_801208 ?auto_801209 ) ) ( not ( = ?auto_801208 ?auto_801210 ) ) ( not ( = ?auto_801208 ?auto_801211 ) ) ( not ( = ?auto_801208 ?auto_801212 ) ) ( not ( = ?auto_801208 ?auto_801213 ) ) ( not ( = ?auto_801208 ?auto_801214 ) ) ( not ( = ?auto_801208 ?auto_801215 ) ) ( not ( = ?auto_801208 ?auto_801216 ) ) ( not ( = ?auto_801208 ?auto_801217 ) ) ( not ( = ?auto_801208 ?auto_801218 ) ) ( not ( = ?auto_801208 ?auto_801219 ) ) ( not ( = ?auto_801208 ?auto_801220 ) ) ( not ( = ?auto_801208 ?auto_801221 ) ) ( not ( = ?auto_801209 ?auto_801210 ) ) ( not ( = ?auto_801209 ?auto_801211 ) ) ( not ( = ?auto_801209 ?auto_801212 ) ) ( not ( = ?auto_801209 ?auto_801213 ) ) ( not ( = ?auto_801209 ?auto_801214 ) ) ( not ( = ?auto_801209 ?auto_801215 ) ) ( not ( = ?auto_801209 ?auto_801216 ) ) ( not ( = ?auto_801209 ?auto_801217 ) ) ( not ( = ?auto_801209 ?auto_801218 ) ) ( not ( = ?auto_801209 ?auto_801219 ) ) ( not ( = ?auto_801209 ?auto_801220 ) ) ( not ( = ?auto_801209 ?auto_801221 ) ) ( not ( = ?auto_801210 ?auto_801211 ) ) ( not ( = ?auto_801210 ?auto_801212 ) ) ( not ( = ?auto_801210 ?auto_801213 ) ) ( not ( = ?auto_801210 ?auto_801214 ) ) ( not ( = ?auto_801210 ?auto_801215 ) ) ( not ( = ?auto_801210 ?auto_801216 ) ) ( not ( = ?auto_801210 ?auto_801217 ) ) ( not ( = ?auto_801210 ?auto_801218 ) ) ( not ( = ?auto_801210 ?auto_801219 ) ) ( not ( = ?auto_801210 ?auto_801220 ) ) ( not ( = ?auto_801210 ?auto_801221 ) ) ( not ( = ?auto_801211 ?auto_801212 ) ) ( not ( = ?auto_801211 ?auto_801213 ) ) ( not ( = ?auto_801211 ?auto_801214 ) ) ( not ( = ?auto_801211 ?auto_801215 ) ) ( not ( = ?auto_801211 ?auto_801216 ) ) ( not ( = ?auto_801211 ?auto_801217 ) ) ( not ( = ?auto_801211 ?auto_801218 ) ) ( not ( = ?auto_801211 ?auto_801219 ) ) ( not ( = ?auto_801211 ?auto_801220 ) ) ( not ( = ?auto_801211 ?auto_801221 ) ) ( not ( = ?auto_801212 ?auto_801213 ) ) ( not ( = ?auto_801212 ?auto_801214 ) ) ( not ( = ?auto_801212 ?auto_801215 ) ) ( not ( = ?auto_801212 ?auto_801216 ) ) ( not ( = ?auto_801212 ?auto_801217 ) ) ( not ( = ?auto_801212 ?auto_801218 ) ) ( not ( = ?auto_801212 ?auto_801219 ) ) ( not ( = ?auto_801212 ?auto_801220 ) ) ( not ( = ?auto_801212 ?auto_801221 ) ) ( not ( = ?auto_801213 ?auto_801214 ) ) ( not ( = ?auto_801213 ?auto_801215 ) ) ( not ( = ?auto_801213 ?auto_801216 ) ) ( not ( = ?auto_801213 ?auto_801217 ) ) ( not ( = ?auto_801213 ?auto_801218 ) ) ( not ( = ?auto_801213 ?auto_801219 ) ) ( not ( = ?auto_801213 ?auto_801220 ) ) ( not ( = ?auto_801213 ?auto_801221 ) ) ( not ( = ?auto_801214 ?auto_801215 ) ) ( not ( = ?auto_801214 ?auto_801216 ) ) ( not ( = ?auto_801214 ?auto_801217 ) ) ( not ( = ?auto_801214 ?auto_801218 ) ) ( not ( = ?auto_801214 ?auto_801219 ) ) ( not ( = ?auto_801214 ?auto_801220 ) ) ( not ( = ?auto_801214 ?auto_801221 ) ) ( not ( = ?auto_801215 ?auto_801216 ) ) ( not ( = ?auto_801215 ?auto_801217 ) ) ( not ( = ?auto_801215 ?auto_801218 ) ) ( not ( = ?auto_801215 ?auto_801219 ) ) ( not ( = ?auto_801215 ?auto_801220 ) ) ( not ( = ?auto_801215 ?auto_801221 ) ) ( not ( = ?auto_801216 ?auto_801217 ) ) ( not ( = ?auto_801216 ?auto_801218 ) ) ( not ( = ?auto_801216 ?auto_801219 ) ) ( not ( = ?auto_801216 ?auto_801220 ) ) ( not ( = ?auto_801216 ?auto_801221 ) ) ( not ( = ?auto_801217 ?auto_801218 ) ) ( not ( = ?auto_801217 ?auto_801219 ) ) ( not ( = ?auto_801217 ?auto_801220 ) ) ( not ( = ?auto_801217 ?auto_801221 ) ) ( not ( = ?auto_801218 ?auto_801219 ) ) ( not ( = ?auto_801218 ?auto_801220 ) ) ( not ( = ?auto_801218 ?auto_801221 ) ) ( not ( = ?auto_801219 ?auto_801220 ) ) ( not ( = ?auto_801219 ?auto_801221 ) ) ( not ( = ?auto_801220 ?auto_801221 ) ) ( ON ?auto_801220 ?auto_801221 ) ( ON ?auto_801219 ?auto_801220 ) ( ON ?auto_801218 ?auto_801219 ) ( ON ?auto_801217 ?auto_801218 ) ( ON ?auto_801216 ?auto_801217 ) ( ON ?auto_801215 ?auto_801216 ) ( ON ?auto_801214 ?auto_801215 ) ( ON ?auto_801213 ?auto_801214 ) ( ON ?auto_801212 ?auto_801213 ) ( ON ?auto_801211 ?auto_801212 ) ( ON ?auto_801210 ?auto_801211 ) ( ON ?auto_801209 ?auto_801210 ) ( ON ?auto_801208 ?auto_801209 ) ( ON ?auto_801207 ?auto_801208 ) ( ON ?auto_801206 ?auto_801207 ) ( ON ?auto_801205 ?auto_801206 ) ( ON ?auto_801204 ?auto_801205 ) ( CLEAR ?auto_801204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_801204 )
      ( MAKE-18PILE ?auto_801204 ?auto_801205 ?auto_801206 ?auto_801207 ?auto_801208 ?auto_801209 ?auto_801210 ?auto_801211 ?auto_801212 ?auto_801213 ?auto_801214 ?auto_801215 ?auto_801216 ?auto_801217 ?auto_801218 ?auto_801219 ?auto_801220 ?auto_801221 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_801240 - BLOCK
      ?auto_801241 - BLOCK
      ?auto_801242 - BLOCK
      ?auto_801243 - BLOCK
      ?auto_801244 - BLOCK
      ?auto_801245 - BLOCK
      ?auto_801246 - BLOCK
      ?auto_801247 - BLOCK
      ?auto_801248 - BLOCK
      ?auto_801249 - BLOCK
      ?auto_801250 - BLOCK
      ?auto_801251 - BLOCK
      ?auto_801252 - BLOCK
      ?auto_801253 - BLOCK
      ?auto_801254 - BLOCK
      ?auto_801255 - BLOCK
      ?auto_801256 - BLOCK
      ?auto_801257 - BLOCK
    )
    :vars
    (
      ?auto_801258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_801240 ?auto_801241 ) ) ( not ( = ?auto_801240 ?auto_801242 ) ) ( not ( = ?auto_801240 ?auto_801243 ) ) ( not ( = ?auto_801240 ?auto_801244 ) ) ( not ( = ?auto_801240 ?auto_801245 ) ) ( not ( = ?auto_801240 ?auto_801246 ) ) ( not ( = ?auto_801240 ?auto_801247 ) ) ( not ( = ?auto_801240 ?auto_801248 ) ) ( not ( = ?auto_801240 ?auto_801249 ) ) ( not ( = ?auto_801240 ?auto_801250 ) ) ( not ( = ?auto_801240 ?auto_801251 ) ) ( not ( = ?auto_801240 ?auto_801252 ) ) ( not ( = ?auto_801240 ?auto_801253 ) ) ( not ( = ?auto_801240 ?auto_801254 ) ) ( not ( = ?auto_801240 ?auto_801255 ) ) ( not ( = ?auto_801240 ?auto_801256 ) ) ( not ( = ?auto_801240 ?auto_801257 ) ) ( not ( = ?auto_801241 ?auto_801242 ) ) ( not ( = ?auto_801241 ?auto_801243 ) ) ( not ( = ?auto_801241 ?auto_801244 ) ) ( not ( = ?auto_801241 ?auto_801245 ) ) ( not ( = ?auto_801241 ?auto_801246 ) ) ( not ( = ?auto_801241 ?auto_801247 ) ) ( not ( = ?auto_801241 ?auto_801248 ) ) ( not ( = ?auto_801241 ?auto_801249 ) ) ( not ( = ?auto_801241 ?auto_801250 ) ) ( not ( = ?auto_801241 ?auto_801251 ) ) ( not ( = ?auto_801241 ?auto_801252 ) ) ( not ( = ?auto_801241 ?auto_801253 ) ) ( not ( = ?auto_801241 ?auto_801254 ) ) ( not ( = ?auto_801241 ?auto_801255 ) ) ( not ( = ?auto_801241 ?auto_801256 ) ) ( not ( = ?auto_801241 ?auto_801257 ) ) ( not ( = ?auto_801242 ?auto_801243 ) ) ( not ( = ?auto_801242 ?auto_801244 ) ) ( not ( = ?auto_801242 ?auto_801245 ) ) ( not ( = ?auto_801242 ?auto_801246 ) ) ( not ( = ?auto_801242 ?auto_801247 ) ) ( not ( = ?auto_801242 ?auto_801248 ) ) ( not ( = ?auto_801242 ?auto_801249 ) ) ( not ( = ?auto_801242 ?auto_801250 ) ) ( not ( = ?auto_801242 ?auto_801251 ) ) ( not ( = ?auto_801242 ?auto_801252 ) ) ( not ( = ?auto_801242 ?auto_801253 ) ) ( not ( = ?auto_801242 ?auto_801254 ) ) ( not ( = ?auto_801242 ?auto_801255 ) ) ( not ( = ?auto_801242 ?auto_801256 ) ) ( not ( = ?auto_801242 ?auto_801257 ) ) ( not ( = ?auto_801243 ?auto_801244 ) ) ( not ( = ?auto_801243 ?auto_801245 ) ) ( not ( = ?auto_801243 ?auto_801246 ) ) ( not ( = ?auto_801243 ?auto_801247 ) ) ( not ( = ?auto_801243 ?auto_801248 ) ) ( not ( = ?auto_801243 ?auto_801249 ) ) ( not ( = ?auto_801243 ?auto_801250 ) ) ( not ( = ?auto_801243 ?auto_801251 ) ) ( not ( = ?auto_801243 ?auto_801252 ) ) ( not ( = ?auto_801243 ?auto_801253 ) ) ( not ( = ?auto_801243 ?auto_801254 ) ) ( not ( = ?auto_801243 ?auto_801255 ) ) ( not ( = ?auto_801243 ?auto_801256 ) ) ( not ( = ?auto_801243 ?auto_801257 ) ) ( not ( = ?auto_801244 ?auto_801245 ) ) ( not ( = ?auto_801244 ?auto_801246 ) ) ( not ( = ?auto_801244 ?auto_801247 ) ) ( not ( = ?auto_801244 ?auto_801248 ) ) ( not ( = ?auto_801244 ?auto_801249 ) ) ( not ( = ?auto_801244 ?auto_801250 ) ) ( not ( = ?auto_801244 ?auto_801251 ) ) ( not ( = ?auto_801244 ?auto_801252 ) ) ( not ( = ?auto_801244 ?auto_801253 ) ) ( not ( = ?auto_801244 ?auto_801254 ) ) ( not ( = ?auto_801244 ?auto_801255 ) ) ( not ( = ?auto_801244 ?auto_801256 ) ) ( not ( = ?auto_801244 ?auto_801257 ) ) ( not ( = ?auto_801245 ?auto_801246 ) ) ( not ( = ?auto_801245 ?auto_801247 ) ) ( not ( = ?auto_801245 ?auto_801248 ) ) ( not ( = ?auto_801245 ?auto_801249 ) ) ( not ( = ?auto_801245 ?auto_801250 ) ) ( not ( = ?auto_801245 ?auto_801251 ) ) ( not ( = ?auto_801245 ?auto_801252 ) ) ( not ( = ?auto_801245 ?auto_801253 ) ) ( not ( = ?auto_801245 ?auto_801254 ) ) ( not ( = ?auto_801245 ?auto_801255 ) ) ( not ( = ?auto_801245 ?auto_801256 ) ) ( not ( = ?auto_801245 ?auto_801257 ) ) ( not ( = ?auto_801246 ?auto_801247 ) ) ( not ( = ?auto_801246 ?auto_801248 ) ) ( not ( = ?auto_801246 ?auto_801249 ) ) ( not ( = ?auto_801246 ?auto_801250 ) ) ( not ( = ?auto_801246 ?auto_801251 ) ) ( not ( = ?auto_801246 ?auto_801252 ) ) ( not ( = ?auto_801246 ?auto_801253 ) ) ( not ( = ?auto_801246 ?auto_801254 ) ) ( not ( = ?auto_801246 ?auto_801255 ) ) ( not ( = ?auto_801246 ?auto_801256 ) ) ( not ( = ?auto_801246 ?auto_801257 ) ) ( not ( = ?auto_801247 ?auto_801248 ) ) ( not ( = ?auto_801247 ?auto_801249 ) ) ( not ( = ?auto_801247 ?auto_801250 ) ) ( not ( = ?auto_801247 ?auto_801251 ) ) ( not ( = ?auto_801247 ?auto_801252 ) ) ( not ( = ?auto_801247 ?auto_801253 ) ) ( not ( = ?auto_801247 ?auto_801254 ) ) ( not ( = ?auto_801247 ?auto_801255 ) ) ( not ( = ?auto_801247 ?auto_801256 ) ) ( not ( = ?auto_801247 ?auto_801257 ) ) ( not ( = ?auto_801248 ?auto_801249 ) ) ( not ( = ?auto_801248 ?auto_801250 ) ) ( not ( = ?auto_801248 ?auto_801251 ) ) ( not ( = ?auto_801248 ?auto_801252 ) ) ( not ( = ?auto_801248 ?auto_801253 ) ) ( not ( = ?auto_801248 ?auto_801254 ) ) ( not ( = ?auto_801248 ?auto_801255 ) ) ( not ( = ?auto_801248 ?auto_801256 ) ) ( not ( = ?auto_801248 ?auto_801257 ) ) ( not ( = ?auto_801249 ?auto_801250 ) ) ( not ( = ?auto_801249 ?auto_801251 ) ) ( not ( = ?auto_801249 ?auto_801252 ) ) ( not ( = ?auto_801249 ?auto_801253 ) ) ( not ( = ?auto_801249 ?auto_801254 ) ) ( not ( = ?auto_801249 ?auto_801255 ) ) ( not ( = ?auto_801249 ?auto_801256 ) ) ( not ( = ?auto_801249 ?auto_801257 ) ) ( not ( = ?auto_801250 ?auto_801251 ) ) ( not ( = ?auto_801250 ?auto_801252 ) ) ( not ( = ?auto_801250 ?auto_801253 ) ) ( not ( = ?auto_801250 ?auto_801254 ) ) ( not ( = ?auto_801250 ?auto_801255 ) ) ( not ( = ?auto_801250 ?auto_801256 ) ) ( not ( = ?auto_801250 ?auto_801257 ) ) ( not ( = ?auto_801251 ?auto_801252 ) ) ( not ( = ?auto_801251 ?auto_801253 ) ) ( not ( = ?auto_801251 ?auto_801254 ) ) ( not ( = ?auto_801251 ?auto_801255 ) ) ( not ( = ?auto_801251 ?auto_801256 ) ) ( not ( = ?auto_801251 ?auto_801257 ) ) ( not ( = ?auto_801252 ?auto_801253 ) ) ( not ( = ?auto_801252 ?auto_801254 ) ) ( not ( = ?auto_801252 ?auto_801255 ) ) ( not ( = ?auto_801252 ?auto_801256 ) ) ( not ( = ?auto_801252 ?auto_801257 ) ) ( not ( = ?auto_801253 ?auto_801254 ) ) ( not ( = ?auto_801253 ?auto_801255 ) ) ( not ( = ?auto_801253 ?auto_801256 ) ) ( not ( = ?auto_801253 ?auto_801257 ) ) ( not ( = ?auto_801254 ?auto_801255 ) ) ( not ( = ?auto_801254 ?auto_801256 ) ) ( not ( = ?auto_801254 ?auto_801257 ) ) ( not ( = ?auto_801255 ?auto_801256 ) ) ( not ( = ?auto_801255 ?auto_801257 ) ) ( not ( = ?auto_801256 ?auto_801257 ) ) ( ON ?auto_801240 ?auto_801258 ) ( not ( = ?auto_801257 ?auto_801258 ) ) ( not ( = ?auto_801256 ?auto_801258 ) ) ( not ( = ?auto_801255 ?auto_801258 ) ) ( not ( = ?auto_801254 ?auto_801258 ) ) ( not ( = ?auto_801253 ?auto_801258 ) ) ( not ( = ?auto_801252 ?auto_801258 ) ) ( not ( = ?auto_801251 ?auto_801258 ) ) ( not ( = ?auto_801250 ?auto_801258 ) ) ( not ( = ?auto_801249 ?auto_801258 ) ) ( not ( = ?auto_801248 ?auto_801258 ) ) ( not ( = ?auto_801247 ?auto_801258 ) ) ( not ( = ?auto_801246 ?auto_801258 ) ) ( not ( = ?auto_801245 ?auto_801258 ) ) ( not ( = ?auto_801244 ?auto_801258 ) ) ( not ( = ?auto_801243 ?auto_801258 ) ) ( not ( = ?auto_801242 ?auto_801258 ) ) ( not ( = ?auto_801241 ?auto_801258 ) ) ( not ( = ?auto_801240 ?auto_801258 ) ) ( ON ?auto_801241 ?auto_801240 ) ( ON ?auto_801242 ?auto_801241 ) ( ON ?auto_801243 ?auto_801242 ) ( ON ?auto_801244 ?auto_801243 ) ( ON ?auto_801245 ?auto_801244 ) ( ON ?auto_801246 ?auto_801245 ) ( ON ?auto_801247 ?auto_801246 ) ( ON ?auto_801248 ?auto_801247 ) ( ON ?auto_801249 ?auto_801248 ) ( ON ?auto_801250 ?auto_801249 ) ( ON ?auto_801251 ?auto_801250 ) ( ON ?auto_801252 ?auto_801251 ) ( ON ?auto_801253 ?auto_801252 ) ( ON ?auto_801254 ?auto_801253 ) ( ON ?auto_801255 ?auto_801254 ) ( ON ?auto_801256 ?auto_801255 ) ( ON ?auto_801257 ?auto_801256 ) ( CLEAR ?auto_801257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_801257 ?auto_801256 ?auto_801255 ?auto_801254 ?auto_801253 ?auto_801252 ?auto_801251 ?auto_801250 ?auto_801249 ?auto_801248 ?auto_801247 ?auto_801246 ?auto_801245 ?auto_801244 ?auto_801243 ?auto_801242 ?auto_801241 ?auto_801240 )
      ( MAKE-18PILE ?auto_801240 ?auto_801241 ?auto_801242 ?auto_801243 ?auto_801244 ?auto_801245 ?auto_801246 ?auto_801247 ?auto_801248 ?auto_801249 ?auto_801250 ?auto_801251 ?auto_801252 ?auto_801253 ?auto_801254 ?auto_801255 ?auto_801256 ?auto_801257 ) )
  )

)

