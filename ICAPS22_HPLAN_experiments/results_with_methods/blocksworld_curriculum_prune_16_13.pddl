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
      ?auto_546490 - BLOCK
    )
    :vars
    (
      ?auto_546491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546490 ?auto_546491 ) ( CLEAR ?auto_546490 ) ( HAND-EMPTY ) ( not ( = ?auto_546490 ?auto_546491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_546490 ?auto_546491 )
      ( !PUTDOWN ?auto_546490 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_546497 - BLOCK
      ?auto_546498 - BLOCK
    )
    :vars
    (
      ?auto_546499 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_546497 ) ( ON ?auto_546498 ?auto_546499 ) ( CLEAR ?auto_546498 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_546497 ) ( not ( = ?auto_546497 ?auto_546498 ) ) ( not ( = ?auto_546497 ?auto_546499 ) ) ( not ( = ?auto_546498 ?auto_546499 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_546498 ?auto_546499 )
      ( !STACK ?auto_546498 ?auto_546497 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_546507 - BLOCK
      ?auto_546508 - BLOCK
    )
    :vars
    (
      ?auto_546509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546508 ?auto_546509 ) ( not ( = ?auto_546507 ?auto_546508 ) ) ( not ( = ?auto_546507 ?auto_546509 ) ) ( not ( = ?auto_546508 ?auto_546509 ) ) ( ON ?auto_546507 ?auto_546508 ) ( CLEAR ?auto_546507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_546507 )
      ( MAKE-2PILE ?auto_546507 ?auto_546508 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_546518 - BLOCK
      ?auto_546519 - BLOCK
      ?auto_546520 - BLOCK
    )
    :vars
    (
      ?auto_546521 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_546519 ) ( ON ?auto_546520 ?auto_546521 ) ( CLEAR ?auto_546520 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_546518 ) ( ON ?auto_546519 ?auto_546518 ) ( not ( = ?auto_546518 ?auto_546519 ) ) ( not ( = ?auto_546518 ?auto_546520 ) ) ( not ( = ?auto_546518 ?auto_546521 ) ) ( not ( = ?auto_546519 ?auto_546520 ) ) ( not ( = ?auto_546519 ?auto_546521 ) ) ( not ( = ?auto_546520 ?auto_546521 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_546520 ?auto_546521 )
      ( !STACK ?auto_546520 ?auto_546519 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_546532 - BLOCK
      ?auto_546533 - BLOCK
      ?auto_546534 - BLOCK
    )
    :vars
    (
      ?auto_546535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546534 ?auto_546535 ) ( ON-TABLE ?auto_546532 ) ( not ( = ?auto_546532 ?auto_546533 ) ) ( not ( = ?auto_546532 ?auto_546534 ) ) ( not ( = ?auto_546532 ?auto_546535 ) ) ( not ( = ?auto_546533 ?auto_546534 ) ) ( not ( = ?auto_546533 ?auto_546535 ) ) ( not ( = ?auto_546534 ?auto_546535 ) ) ( CLEAR ?auto_546532 ) ( ON ?auto_546533 ?auto_546534 ) ( CLEAR ?auto_546533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_546532 ?auto_546533 )
      ( MAKE-3PILE ?auto_546532 ?auto_546533 ?auto_546534 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_546546 - BLOCK
      ?auto_546547 - BLOCK
      ?auto_546548 - BLOCK
    )
    :vars
    (
      ?auto_546549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546548 ?auto_546549 ) ( not ( = ?auto_546546 ?auto_546547 ) ) ( not ( = ?auto_546546 ?auto_546548 ) ) ( not ( = ?auto_546546 ?auto_546549 ) ) ( not ( = ?auto_546547 ?auto_546548 ) ) ( not ( = ?auto_546547 ?auto_546549 ) ) ( not ( = ?auto_546548 ?auto_546549 ) ) ( ON ?auto_546547 ?auto_546548 ) ( ON ?auto_546546 ?auto_546547 ) ( CLEAR ?auto_546546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_546546 )
      ( MAKE-3PILE ?auto_546546 ?auto_546547 ?auto_546548 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_546561 - BLOCK
      ?auto_546562 - BLOCK
      ?auto_546563 - BLOCK
      ?auto_546564 - BLOCK
    )
    :vars
    (
      ?auto_546565 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_546563 ) ( ON ?auto_546564 ?auto_546565 ) ( CLEAR ?auto_546564 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_546561 ) ( ON ?auto_546562 ?auto_546561 ) ( ON ?auto_546563 ?auto_546562 ) ( not ( = ?auto_546561 ?auto_546562 ) ) ( not ( = ?auto_546561 ?auto_546563 ) ) ( not ( = ?auto_546561 ?auto_546564 ) ) ( not ( = ?auto_546561 ?auto_546565 ) ) ( not ( = ?auto_546562 ?auto_546563 ) ) ( not ( = ?auto_546562 ?auto_546564 ) ) ( not ( = ?auto_546562 ?auto_546565 ) ) ( not ( = ?auto_546563 ?auto_546564 ) ) ( not ( = ?auto_546563 ?auto_546565 ) ) ( not ( = ?auto_546564 ?auto_546565 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_546564 ?auto_546565 )
      ( !STACK ?auto_546564 ?auto_546563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_546579 - BLOCK
      ?auto_546580 - BLOCK
      ?auto_546581 - BLOCK
      ?auto_546582 - BLOCK
    )
    :vars
    (
      ?auto_546583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546582 ?auto_546583 ) ( ON-TABLE ?auto_546579 ) ( ON ?auto_546580 ?auto_546579 ) ( not ( = ?auto_546579 ?auto_546580 ) ) ( not ( = ?auto_546579 ?auto_546581 ) ) ( not ( = ?auto_546579 ?auto_546582 ) ) ( not ( = ?auto_546579 ?auto_546583 ) ) ( not ( = ?auto_546580 ?auto_546581 ) ) ( not ( = ?auto_546580 ?auto_546582 ) ) ( not ( = ?auto_546580 ?auto_546583 ) ) ( not ( = ?auto_546581 ?auto_546582 ) ) ( not ( = ?auto_546581 ?auto_546583 ) ) ( not ( = ?auto_546582 ?auto_546583 ) ) ( CLEAR ?auto_546580 ) ( ON ?auto_546581 ?auto_546582 ) ( CLEAR ?auto_546581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_546579 ?auto_546580 ?auto_546581 )
      ( MAKE-4PILE ?auto_546579 ?auto_546580 ?auto_546581 ?auto_546582 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_546597 - BLOCK
      ?auto_546598 - BLOCK
      ?auto_546599 - BLOCK
      ?auto_546600 - BLOCK
    )
    :vars
    (
      ?auto_546601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546600 ?auto_546601 ) ( ON-TABLE ?auto_546597 ) ( not ( = ?auto_546597 ?auto_546598 ) ) ( not ( = ?auto_546597 ?auto_546599 ) ) ( not ( = ?auto_546597 ?auto_546600 ) ) ( not ( = ?auto_546597 ?auto_546601 ) ) ( not ( = ?auto_546598 ?auto_546599 ) ) ( not ( = ?auto_546598 ?auto_546600 ) ) ( not ( = ?auto_546598 ?auto_546601 ) ) ( not ( = ?auto_546599 ?auto_546600 ) ) ( not ( = ?auto_546599 ?auto_546601 ) ) ( not ( = ?auto_546600 ?auto_546601 ) ) ( ON ?auto_546599 ?auto_546600 ) ( CLEAR ?auto_546597 ) ( ON ?auto_546598 ?auto_546599 ) ( CLEAR ?auto_546598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_546597 ?auto_546598 )
      ( MAKE-4PILE ?auto_546597 ?auto_546598 ?auto_546599 ?auto_546600 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_546615 - BLOCK
      ?auto_546616 - BLOCK
      ?auto_546617 - BLOCK
      ?auto_546618 - BLOCK
    )
    :vars
    (
      ?auto_546619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546618 ?auto_546619 ) ( not ( = ?auto_546615 ?auto_546616 ) ) ( not ( = ?auto_546615 ?auto_546617 ) ) ( not ( = ?auto_546615 ?auto_546618 ) ) ( not ( = ?auto_546615 ?auto_546619 ) ) ( not ( = ?auto_546616 ?auto_546617 ) ) ( not ( = ?auto_546616 ?auto_546618 ) ) ( not ( = ?auto_546616 ?auto_546619 ) ) ( not ( = ?auto_546617 ?auto_546618 ) ) ( not ( = ?auto_546617 ?auto_546619 ) ) ( not ( = ?auto_546618 ?auto_546619 ) ) ( ON ?auto_546617 ?auto_546618 ) ( ON ?auto_546616 ?auto_546617 ) ( ON ?auto_546615 ?auto_546616 ) ( CLEAR ?auto_546615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_546615 )
      ( MAKE-4PILE ?auto_546615 ?auto_546616 ?auto_546617 ?auto_546618 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_546634 - BLOCK
      ?auto_546635 - BLOCK
      ?auto_546636 - BLOCK
      ?auto_546637 - BLOCK
      ?auto_546638 - BLOCK
    )
    :vars
    (
      ?auto_546639 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_546637 ) ( ON ?auto_546638 ?auto_546639 ) ( CLEAR ?auto_546638 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_546634 ) ( ON ?auto_546635 ?auto_546634 ) ( ON ?auto_546636 ?auto_546635 ) ( ON ?auto_546637 ?auto_546636 ) ( not ( = ?auto_546634 ?auto_546635 ) ) ( not ( = ?auto_546634 ?auto_546636 ) ) ( not ( = ?auto_546634 ?auto_546637 ) ) ( not ( = ?auto_546634 ?auto_546638 ) ) ( not ( = ?auto_546634 ?auto_546639 ) ) ( not ( = ?auto_546635 ?auto_546636 ) ) ( not ( = ?auto_546635 ?auto_546637 ) ) ( not ( = ?auto_546635 ?auto_546638 ) ) ( not ( = ?auto_546635 ?auto_546639 ) ) ( not ( = ?auto_546636 ?auto_546637 ) ) ( not ( = ?auto_546636 ?auto_546638 ) ) ( not ( = ?auto_546636 ?auto_546639 ) ) ( not ( = ?auto_546637 ?auto_546638 ) ) ( not ( = ?auto_546637 ?auto_546639 ) ) ( not ( = ?auto_546638 ?auto_546639 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_546638 ?auto_546639 )
      ( !STACK ?auto_546638 ?auto_546637 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_546656 - BLOCK
      ?auto_546657 - BLOCK
      ?auto_546658 - BLOCK
      ?auto_546659 - BLOCK
      ?auto_546660 - BLOCK
    )
    :vars
    (
      ?auto_546661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546660 ?auto_546661 ) ( ON-TABLE ?auto_546656 ) ( ON ?auto_546657 ?auto_546656 ) ( ON ?auto_546658 ?auto_546657 ) ( not ( = ?auto_546656 ?auto_546657 ) ) ( not ( = ?auto_546656 ?auto_546658 ) ) ( not ( = ?auto_546656 ?auto_546659 ) ) ( not ( = ?auto_546656 ?auto_546660 ) ) ( not ( = ?auto_546656 ?auto_546661 ) ) ( not ( = ?auto_546657 ?auto_546658 ) ) ( not ( = ?auto_546657 ?auto_546659 ) ) ( not ( = ?auto_546657 ?auto_546660 ) ) ( not ( = ?auto_546657 ?auto_546661 ) ) ( not ( = ?auto_546658 ?auto_546659 ) ) ( not ( = ?auto_546658 ?auto_546660 ) ) ( not ( = ?auto_546658 ?auto_546661 ) ) ( not ( = ?auto_546659 ?auto_546660 ) ) ( not ( = ?auto_546659 ?auto_546661 ) ) ( not ( = ?auto_546660 ?auto_546661 ) ) ( CLEAR ?auto_546658 ) ( ON ?auto_546659 ?auto_546660 ) ( CLEAR ?auto_546659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_546656 ?auto_546657 ?auto_546658 ?auto_546659 )
      ( MAKE-5PILE ?auto_546656 ?auto_546657 ?auto_546658 ?auto_546659 ?auto_546660 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_546678 - BLOCK
      ?auto_546679 - BLOCK
      ?auto_546680 - BLOCK
      ?auto_546681 - BLOCK
      ?auto_546682 - BLOCK
    )
    :vars
    (
      ?auto_546683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546682 ?auto_546683 ) ( ON-TABLE ?auto_546678 ) ( ON ?auto_546679 ?auto_546678 ) ( not ( = ?auto_546678 ?auto_546679 ) ) ( not ( = ?auto_546678 ?auto_546680 ) ) ( not ( = ?auto_546678 ?auto_546681 ) ) ( not ( = ?auto_546678 ?auto_546682 ) ) ( not ( = ?auto_546678 ?auto_546683 ) ) ( not ( = ?auto_546679 ?auto_546680 ) ) ( not ( = ?auto_546679 ?auto_546681 ) ) ( not ( = ?auto_546679 ?auto_546682 ) ) ( not ( = ?auto_546679 ?auto_546683 ) ) ( not ( = ?auto_546680 ?auto_546681 ) ) ( not ( = ?auto_546680 ?auto_546682 ) ) ( not ( = ?auto_546680 ?auto_546683 ) ) ( not ( = ?auto_546681 ?auto_546682 ) ) ( not ( = ?auto_546681 ?auto_546683 ) ) ( not ( = ?auto_546682 ?auto_546683 ) ) ( ON ?auto_546681 ?auto_546682 ) ( CLEAR ?auto_546679 ) ( ON ?auto_546680 ?auto_546681 ) ( CLEAR ?auto_546680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_546678 ?auto_546679 ?auto_546680 )
      ( MAKE-5PILE ?auto_546678 ?auto_546679 ?auto_546680 ?auto_546681 ?auto_546682 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_546700 - BLOCK
      ?auto_546701 - BLOCK
      ?auto_546702 - BLOCK
      ?auto_546703 - BLOCK
      ?auto_546704 - BLOCK
    )
    :vars
    (
      ?auto_546705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546704 ?auto_546705 ) ( ON-TABLE ?auto_546700 ) ( not ( = ?auto_546700 ?auto_546701 ) ) ( not ( = ?auto_546700 ?auto_546702 ) ) ( not ( = ?auto_546700 ?auto_546703 ) ) ( not ( = ?auto_546700 ?auto_546704 ) ) ( not ( = ?auto_546700 ?auto_546705 ) ) ( not ( = ?auto_546701 ?auto_546702 ) ) ( not ( = ?auto_546701 ?auto_546703 ) ) ( not ( = ?auto_546701 ?auto_546704 ) ) ( not ( = ?auto_546701 ?auto_546705 ) ) ( not ( = ?auto_546702 ?auto_546703 ) ) ( not ( = ?auto_546702 ?auto_546704 ) ) ( not ( = ?auto_546702 ?auto_546705 ) ) ( not ( = ?auto_546703 ?auto_546704 ) ) ( not ( = ?auto_546703 ?auto_546705 ) ) ( not ( = ?auto_546704 ?auto_546705 ) ) ( ON ?auto_546703 ?auto_546704 ) ( ON ?auto_546702 ?auto_546703 ) ( CLEAR ?auto_546700 ) ( ON ?auto_546701 ?auto_546702 ) ( CLEAR ?auto_546701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_546700 ?auto_546701 )
      ( MAKE-5PILE ?auto_546700 ?auto_546701 ?auto_546702 ?auto_546703 ?auto_546704 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_546722 - BLOCK
      ?auto_546723 - BLOCK
      ?auto_546724 - BLOCK
      ?auto_546725 - BLOCK
      ?auto_546726 - BLOCK
    )
    :vars
    (
      ?auto_546727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546726 ?auto_546727 ) ( not ( = ?auto_546722 ?auto_546723 ) ) ( not ( = ?auto_546722 ?auto_546724 ) ) ( not ( = ?auto_546722 ?auto_546725 ) ) ( not ( = ?auto_546722 ?auto_546726 ) ) ( not ( = ?auto_546722 ?auto_546727 ) ) ( not ( = ?auto_546723 ?auto_546724 ) ) ( not ( = ?auto_546723 ?auto_546725 ) ) ( not ( = ?auto_546723 ?auto_546726 ) ) ( not ( = ?auto_546723 ?auto_546727 ) ) ( not ( = ?auto_546724 ?auto_546725 ) ) ( not ( = ?auto_546724 ?auto_546726 ) ) ( not ( = ?auto_546724 ?auto_546727 ) ) ( not ( = ?auto_546725 ?auto_546726 ) ) ( not ( = ?auto_546725 ?auto_546727 ) ) ( not ( = ?auto_546726 ?auto_546727 ) ) ( ON ?auto_546725 ?auto_546726 ) ( ON ?auto_546724 ?auto_546725 ) ( ON ?auto_546723 ?auto_546724 ) ( ON ?auto_546722 ?auto_546723 ) ( CLEAR ?auto_546722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_546722 )
      ( MAKE-5PILE ?auto_546722 ?auto_546723 ?auto_546724 ?auto_546725 ?auto_546726 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_546745 - BLOCK
      ?auto_546746 - BLOCK
      ?auto_546747 - BLOCK
      ?auto_546748 - BLOCK
      ?auto_546749 - BLOCK
      ?auto_546750 - BLOCK
    )
    :vars
    (
      ?auto_546751 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_546749 ) ( ON ?auto_546750 ?auto_546751 ) ( CLEAR ?auto_546750 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_546745 ) ( ON ?auto_546746 ?auto_546745 ) ( ON ?auto_546747 ?auto_546746 ) ( ON ?auto_546748 ?auto_546747 ) ( ON ?auto_546749 ?auto_546748 ) ( not ( = ?auto_546745 ?auto_546746 ) ) ( not ( = ?auto_546745 ?auto_546747 ) ) ( not ( = ?auto_546745 ?auto_546748 ) ) ( not ( = ?auto_546745 ?auto_546749 ) ) ( not ( = ?auto_546745 ?auto_546750 ) ) ( not ( = ?auto_546745 ?auto_546751 ) ) ( not ( = ?auto_546746 ?auto_546747 ) ) ( not ( = ?auto_546746 ?auto_546748 ) ) ( not ( = ?auto_546746 ?auto_546749 ) ) ( not ( = ?auto_546746 ?auto_546750 ) ) ( not ( = ?auto_546746 ?auto_546751 ) ) ( not ( = ?auto_546747 ?auto_546748 ) ) ( not ( = ?auto_546747 ?auto_546749 ) ) ( not ( = ?auto_546747 ?auto_546750 ) ) ( not ( = ?auto_546747 ?auto_546751 ) ) ( not ( = ?auto_546748 ?auto_546749 ) ) ( not ( = ?auto_546748 ?auto_546750 ) ) ( not ( = ?auto_546748 ?auto_546751 ) ) ( not ( = ?auto_546749 ?auto_546750 ) ) ( not ( = ?auto_546749 ?auto_546751 ) ) ( not ( = ?auto_546750 ?auto_546751 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_546750 ?auto_546751 )
      ( !STACK ?auto_546750 ?auto_546749 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_546771 - BLOCK
      ?auto_546772 - BLOCK
      ?auto_546773 - BLOCK
      ?auto_546774 - BLOCK
      ?auto_546775 - BLOCK
      ?auto_546776 - BLOCK
    )
    :vars
    (
      ?auto_546777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546776 ?auto_546777 ) ( ON-TABLE ?auto_546771 ) ( ON ?auto_546772 ?auto_546771 ) ( ON ?auto_546773 ?auto_546772 ) ( ON ?auto_546774 ?auto_546773 ) ( not ( = ?auto_546771 ?auto_546772 ) ) ( not ( = ?auto_546771 ?auto_546773 ) ) ( not ( = ?auto_546771 ?auto_546774 ) ) ( not ( = ?auto_546771 ?auto_546775 ) ) ( not ( = ?auto_546771 ?auto_546776 ) ) ( not ( = ?auto_546771 ?auto_546777 ) ) ( not ( = ?auto_546772 ?auto_546773 ) ) ( not ( = ?auto_546772 ?auto_546774 ) ) ( not ( = ?auto_546772 ?auto_546775 ) ) ( not ( = ?auto_546772 ?auto_546776 ) ) ( not ( = ?auto_546772 ?auto_546777 ) ) ( not ( = ?auto_546773 ?auto_546774 ) ) ( not ( = ?auto_546773 ?auto_546775 ) ) ( not ( = ?auto_546773 ?auto_546776 ) ) ( not ( = ?auto_546773 ?auto_546777 ) ) ( not ( = ?auto_546774 ?auto_546775 ) ) ( not ( = ?auto_546774 ?auto_546776 ) ) ( not ( = ?auto_546774 ?auto_546777 ) ) ( not ( = ?auto_546775 ?auto_546776 ) ) ( not ( = ?auto_546775 ?auto_546777 ) ) ( not ( = ?auto_546776 ?auto_546777 ) ) ( CLEAR ?auto_546774 ) ( ON ?auto_546775 ?auto_546776 ) ( CLEAR ?auto_546775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_546771 ?auto_546772 ?auto_546773 ?auto_546774 ?auto_546775 )
      ( MAKE-6PILE ?auto_546771 ?auto_546772 ?auto_546773 ?auto_546774 ?auto_546775 ?auto_546776 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_546797 - BLOCK
      ?auto_546798 - BLOCK
      ?auto_546799 - BLOCK
      ?auto_546800 - BLOCK
      ?auto_546801 - BLOCK
      ?auto_546802 - BLOCK
    )
    :vars
    (
      ?auto_546803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546802 ?auto_546803 ) ( ON-TABLE ?auto_546797 ) ( ON ?auto_546798 ?auto_546797 ) ( ON ?auto_546799 ?auto_546798 ) ( not ( = ?auto_546797 ?auto_546798 ) ) ( not ( = ?auto_546797 ?auto_546799 ) ) ( not ( = ?auto_546797 ?auto_546800 ) ) ( not ( = ?auto_546797 ?auto_546801 ) ) ( not ( = ?auto_546797 ?auto_546802 ) ) ( not ( = ?auto_546797 ?auto_546803 ) ) ( not ( = ?auto_546798 ?auto_546799 ) ) ( not ( = ?auto_546798 ?auto_546800 ) ) ( not ( = ?auto_546798 ?auto_546801 ) ) ( not ( = ?auto_546798 ?auto_546802 ) ) ( not ( = ?auto_546798 ?auto_546803 ) ) ( not ( = ?auto_546799 ?auto_546800 ) ) ( not ( = ?auto_546799 ?auto_546801 ) ) ( not ( = ?auto_546799 ?auto_546802 ) ) ( not ( = ?auto_546799 ?auto_546803 ) ) ( not ( = ?auto_546800 ?auto_546801 ) ) ( not ( = ?auto_546800 ?auto_546802 ) ) ( not ( = ?auto_546800 ?auto_546803 ) ) ( not ( = ?auto_546801 ?auto_546802 ) ) ( not ( = ?auto_546801 ?auto_546803 ) ) ( not ( = ?auto_546802 ?auto_546803 ) ) ( ON ?auto_546801 ?auto_546802 ) ( CLEAR ?auto_546799 ) ( ON ?auto_546800 ?auto_546801 ) ( CLEAR ?auto_546800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_546797 ?auto_546798 ?auto_546799 ?auto_546800 )
      ( MAKE-6PILE ?auto_546797 ?auto_546798 ?auto_546799 ?auto_546800 ?auto_546801 ?auto_546802 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_546823 - BLOCK
      ?auto_546824 - BLOCK
      ?auto_546825 - BLOCK
      ?auto_546826 - BLOCK
      ?auto_546827 - BLOCK
      ?auto_546828 - BLOCK
    )
    :vars
    (
      ?auto_546829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546828 ?auto_546829 ) ( ON-TABLE ?auto_546823 ) ( ON ?auto_546824 ?auto_546823 ) ( not ( = ?auto_546823 ?auto_546824 ) ) ( not ( = ?auto_546823 ?auto_546825 ) ) ( not ( = ?auto_546823 ?auto_546826 ) ) ( not ( = ?auto_546823 ?auto_546827 ) ) ( not ( = ?auto_546823 ?auto_546828 ) ) ( not ( = ?auto_546823 ?auto_546829 ) ) ( not ( = ?auto_546824 ?auto_546825 ) ) ( not ( = ?auto_546824 ?auto_546826 ) ) ( not ( = ?auto_546824 ?auto_546827 ) ) ( not ( = ?auto_546824 ?auto_546828 ) ) ( not ( = ?auto_546824 ?auto_546829 ) ) ( not ( = ?auto_546825 ?auto_546826 ) ) ( not ( = ?auto_546825 ?auto_546827 ) ) ( not ( = ?auto_546825 ?auto_546828 ) ) ( not ( = ?auto_546825 ?auto_546829 ) ) ( not ( = ?auto_546826 ?auto_546827 ) ) ( not ( = ?auto_546826 ?auto_546828 ) ) ( not ( = ?auto_546826 ?auto_546829 ) ) ( not ( = ?auto_546827 ?auto_546828 ) ) ( not ( = ?auto_546827 ?auto_546829 ) ) ( not ( = ?auto_546828 ?auto_546829 ) ) ( ON ?auto_546827 ?auto_546828 ) ( ON ?auto_546826 ?auto_546827 ) ( CLEAR ?auto_546824 ) ( ON ?auto_546825 ?auto_546826 ) ( CLEAR ?auto_546825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_546823 ?auto_546824 ?auto_546825 )
      ( MAKE-6PILE ?auto_546823 ?auto_546824 ?auto_546825 ?auto_546826 ?auto_546827 ?auto_546828 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_546849 - BLOCK
      ?auto_546850 - BLOCK
      ?auto_546851 - BLOCK
      ?auto_546852 - BLOCK
      ?auto_546853 - BLOCK
      ?auto_546854 - BLOCK
    )
    :vars
    (
      ?auto_546855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546854 ?auto_546855 ) ( ON-TABLE ?auto_546849 ) ( not ( = ?auto_546849 ?auto_546850 ) ) ( not ( = ?auto_546849 ?auto_546851 ) ) ( not ( = ?auto_546849 ?auto_546852 ) ) ( not ( = ?auto_546849 ?auto_546853 ) ) ( not ( = ?auto_546849 ?auto_546854 ) ) ( not ( = ?auto_546849 ?auto_546855 ) ) ( not ( = ?auto_546850 ?auto_546851 ) ) ( not ( = ?auto_546850 ?auto_546852 ) ) ( not ( = ?auto_546850 ?auto_546853 ) ) ( not ( = ?auto_546850 ?auto_546854 ) ) ( not ( = ?auto_546850 ?auto_546855 ) ) ( not ( = ?auto_546851 ?auto_546852 ) ) ( not ( = ?auto_546851 ?auto_546853 ) ) ( not ( = ?auto_546851 ?auto_546854 ) ) ( not ( = ?auto_546851 ?auto_546855 ) ) ( not ( = ?auto_546852 ?auto_546853 ) ) ( not ( = ?auto_546852 ?auto_546854 ) ) ( not ( = ?auto_546852 ?auto_546855 ) ) ( not ( = ?auto_546853 ?auto_546854 ) ) ( not ( = ?auto_546853 ?auto_546855 ) ) ( not ( = ?auto_546854 ?auto_546855 ) ) ( ON ?auto_546853 ?auto_546854 ) ( ON ?auto_546852 ?auto_546853 ) ( ON ?auto_546851 ?auto_546852 ) ( CLEAR ?auto_546849 ) ( ON ?auto_546850 ?auto_546851 ) ( CLEAR ?auto_546850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_546849 ?auto_546850 )
      ( MAKE-6PILE ?auto_546849 ?auto_546850 ?auto_546851 ?auto_546852 ?auto_546853 ?auto_546854 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_546875 - BLOCK
      ?auto_546876 - BLOCK
      ?auto_546877 - BLOCK
      ?auto_546878 - BLOCK
      ?auto_546879 - BLOCK
      ?auto_546880 - BLOCK
    )
    :vars
    (
      ?auto_546881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546880 ?auto_546881 ) ( not ( = ?auto_546875 ?auto_546876 ) ) ( not ( = ?auto_546875 ?auto_546877 ) ) ( not ( = ?auto_546875 ?auto_546878 ) ) ( not ( = ?auto_546875 ?auto_546879 ) ) ( not ( = ?auto_546875 ?auto_546880 ) ) ( not ( = ?auto_546875 ?auto_546881 ) ) ( not ( = ?auto_546876 ?auto_546877 ) ) ( not ( = ?auto_546876 ?auto_546878 ) ) ( not ( = ?auto_546876 ?auto_546879 ) ) ( not ( = ?auto_546876 ?auto_546880 ) ) ( not ( = ?auto_546876 ?auto_546881 ) ) ( not ( = ?auto_546877 ?auto_546878 ) ) ( not ( = ?auto_546877 ?auto_546879 ) ) ( not ( = ?auto_546877 ?auto_546880 ) ) ( not ( = ?auto_546877 ?auto_546881 ) ) ( not ( = ?auto_546878 ?auto_546879 ) ) ( not ( = ?auto_546878 ?auto_546880 ) ) ( not ( = ?auto_546878 ?auto_546881 ) ) ( not ( = ?auto_546879 ?auto_546880 ) ) ( not ( = ?auto_546879 ?auto_546881 ) ) ( not ( = ?auto_546880 ?auto_546881 ) ) ( ON ?auto_546879 ?auto_546880 ) ( ON ?auto_546878 ?auto_546879 ) ( ON ?auto_546877 ?auto_546878 ) ( ON ?auto_546876 ?auto_546877 ) ( ON ?auto_546875 ?auto_546876 ) ( CLEAR ?auto_546875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_546875 )
      ( MAKE-6PILE ?auto_546875 ?auto_546876 ?auto_546877 ?auto_546878 ?auto_546879 ?auto_546880 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_546902 - BLOCK
      ?auto_546903 - BLOCK
      ?auto_546904 - BLOCK
      ?auto_546905 - BLOCK
      ?auto_546906 - BLOCK
      ?auto_546907 - BLOCK
      ?auto_546908 - BLOCK
    )
    :vars
    (
      ?auto_546909 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_546907 ) ( ON ?auto_546908 ?auto_546909 ) ( CLEAR ?auto_546908 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_546902 ) ( ON ?auto_546903 ?auto_546902 ) ( ON ?auto_546904 ?auto_546903 ) ( ON ?auto_546905 ?auto_546904 ) ( ON ?auto_546906 ?auto_546905 ) ( ON ?auto_546907 ?auto_546906 ) ( not ( = ?auto_546902 ?auto_546903 ) ) ( not ( = ?auto_546902 ?auto_546904 ) ) ( not ( = ?auto_546902 ?auto_546905 ) ) ( not ( = ?auto_546902 ?auto_546906 ) ) ( not ( = ?auto_546902 ?auto_546907 ) ) ( not ( = ?auto_546902 ?auto_546908 ) ) ( not ( = ?auto_546902 ?auto_546909 ) ) ( not ( = ?auto_546903 ?auto_546904 ) ) ( not ( = ?auto_546903 ?auto_546905 ) ) ( not ( = ?auto_546903 ?auto_546906 ) ) ( not ( = ?auto_546903 ?auto_546907 ) ) ( not ( = ?auto_546903 ?auto_546908 ) ) ( not ( = ?auto_546903 ?auto_546909 ) ) ( not ( = ?auto_546904 ?auto_546905 ) ) ( not ( = ?auto_546904 ?auto_546906 ) ) ( not ( = ?auto_546904 ?auto_546907 ) ) ( not ( = ?auto_546904 ?auto_546908 ) ) ( not ( = ?auto_546904 ?auto_546909 ) ) ( not ( = ?auto_546905 ?auto_546906 ) ) ( not ( = ?auto_546905 ?auto_546907 ) ) ( not ( = ?auto_546905 ?auto_546908 ) ) ( not ( = ?auto_546905 ?auto_546909 ) ) ( not ( = ?auto_546906 ?auto_546907 ) ) ( not ( = ?auto_546906 ?auto_546908 ) ) ( not ( = ?auto_546906 ?auto_546909 ) ) ( not ( = ?auto_546907 ?auto_546908 ) ) ( not ( = ?auto_546907 ?auto_546909 ) ) ( not ( = ?auto_546908 ?auto_546909 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_546908 ?auto_546909 )
      ( !STACK ?auto_546908 ?auto_546907 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_546932 - BLOCK
      ?auto_546933 - BLOCK
      ?auto_546934 - BLOCK
      ?auto_546935 - BLOCK
      ?auto_546936 - BLOCK
      ?auto_546937 - BLOCK
      ?auto_546938 - BLOCK
    )
    :vars
    (
      ?auto_546939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546938 ?auto_546939 ) ( ON-TABLE ?auto_546932 ) ( ON ?auto_546933 ?auto_546932 ) ( ON ?auto_546934 ?auto_546933 ) ( ON ?auto_546935 ?auto_546934 ) ( ON ?auto_546936 ?auto_546935 ) ( not ( = ?auto_546932 ?auto_546933 ) ) ( not ( = ?auto_546932 ?auto_546934 ) ) ( not ( = ?auto_546932 ?auto_546935 ) ) ( not ( = ?auto_546932 ?auto_546936 ) ) ( not ( = ?auto_546932 ?auto_546937 ) ) ( not ( = ?auto_546932 ?auto_546938 ) ) ( not ( = ?auto_546932 ?auto_546939 ) ) ( not ( = ?auto_546933 ?auto_546934 ) ) ( not ( = ?auto_546933 ?auto_546935 ) ) ( not ( = ?auto_546933 ?auto_546936 ) ) ( not ( = ?auto_546933 ?auto_546937 ) ) ( not ( = ?auto_546933 ?auto_546938 ) ) ( not ( = ?auto_546933 ?auto_546939 ) ) ( not ( = ?auto_546934 ?auto_546935 ) ) ( not ( = ?auto_546934 ?auto_546936 ) ) ( not ( = ?auto_546934 ?auto_546937 ) ) ( not ( = ?auto_546934 ?auto_546938 ) ) ( not ( = ?auto_546934 ?auto_546939 ) ) ( not ( = ?auto_546935 ?auto_546936 ) ) ( not ( = ?auto_546935 ?auto_546937 ) ) ( not ( = ?auto_546935 ?auto_546938 ) ) ( not ( = ?auto_546935 ?auto_546939 ) ) ( not ( = ?auto_546936 ?auto_546937 ) ) ( not ( = ?auto_546936 ?auto_546938 ) ) ( not ( = ?auto_546936 ?auto_546939 ) ) ( not ( = ?auto_546937 ?auto_546938 ) ) ( not ( = ?auto_546937 ?auto_546939 ) ) ( not ( = ?auto_546938 ?auto_546939 ) ) ( CLEAR ?auto_546936 ) ( ON ?auto_546937 ?auto_546938 ) ( CLEAR ?auto_546937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_546932 ?auto_546933 ?auto_546934 ?auto_546935 ?auto_546936 ?auto_546937 )
      ( MAKE-7PILE ?auto_546932 ?auto_546933 ?auto_546934 ?auto_546935 ?auto_546936 ?auto_546937 ?auto_546938 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_546962 - BLOCK
      ?auto_546963 - BLOCK
      ?auto_546964 - BLOCK
      ?auto_546965 - BLOCK
      ?auto_546966 - BLOCK
      ?auto_546967 - BLOCK
      ?auto_546968 - BLOCK
    )
    :vars
    (
      ?auto_546969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546968 ?auto_546969 ) ( ON-TABLE ?auto_546962 ) ( ON ?auto_546963 ?auto_546962 ) ( ON ?auto_546964 ?auto_546963 ) ( ON ?auto_546965 ?auto_546964 ) ( not ( = ?auto_546962 ?auto_546963 ) ) ( not ( = ?auto_546962 ?auto_546964 ) ) ( not ( = ?auto_546962 ?auto_546965 ) ) ( not ( = ?auto_546962 ?auto_546966 ) ) ( not ( = ?auto_546962 ?auto_546967 ) ) ( not ( = ?auto_546962 ?auto_546968 ) ) ( not ( = ?auto_546962 ?auto_546969 ) ) ( not ( = ?auto_546963 ?auto_546964 ) ) ( not ( = ?auto_546963 ?auto_546965 ) ) ( not ( = ?auto_546963 ?auto_546966 ) ) ( not ( = ?auto_546963 ?auto_546967 ) ) ( not ( = ?auto_546963 ?auto_546968 ) ) ( not ( = ?auto_546963 ?auto_546969 ) ) ( not ( = ?auto_546964 ?auto_546965 ) ) ( not ( = ?auto_546964 ?auto_546966 ) ) ( not ( = ?auto_546964 ?auto_546967 ) ) ( not ( = ?auto_546964 ?auto_546968 ) ) ( not ( = ?auto_546964 ?auto_546969 ) ) ( not ( = ?auto_546965 ?auto_546966 ) ) ( not ( = ?auto_546965 ?auto_546967 ) ) ( not ( = ?auto_546965 ?auto_546968 ) ) ( not ( = ?auto_546965 ?auto_546969 ) ) ( not ( = ?auto_546966 ?auto_546967 ) ) ( not ( = ?auto_546966 ?auto_546968 ) ) ( not ( = ?auto_546966 ?auto_546969 ) ) ( not ( = ?auto_546967 ?auto_546968 ) ) ( not ( = ?auto_546967 ?auto_546969 ) ) ( not ( = ?auto_546968 ?auto_546969 ) ) ( ON ?auto_546967 ?auto_546968 ) ( CLEAR ?auto_546965 ) ( ON ?auto_546966 ?auto_546967 ) ( CLEAR ?auto_546966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_546962 ?auto_546963 ?auto_546964 ?auto_546965 ?auto_546966 )
      ( MAKE-7PILE ?auto_546962 ?auto_546963 ?auto_546964 ?auto_546965 ?auto_546966 ?auto_546967 ?auto_546968 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_546992 - BLOCK
      ?auto_546993 - BLOCK
      ?auto_546994 - BLOCK
      ?auto_546995 - BLOCK
      ?auto_546996 - BLOCK
      ?auto_546997 - BLOCK
      ?auto_546998 - BLOCK
    )
    :vars
    (
      ?auto_546999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546998 ?auto_546999 ) ( ON-TABLE ?auto_546992 ) ( ON ?auto_546993 ?auto_546992 ) ( ON ?auto_546994 ?auto_546993 ) ( not ( = ?auto_546992 ?auto_546993 ) ) ( not ( = ?auto_546992 ?auto_546994 ) ) ( not ( = ?auto_546992 ?auto_546995 ) ) ( not ( = ?auto_546992 ?auto_546996 ) ) ( not ( = ?auto_546992 ?auto_546997 ) ) ( not ( = ?auto_546992 ?auto_546998 ) ) ( not ( = ?auto_546992 ?auto_546999 ) ) ( not ( = ?auto_546993 ?auto_546994 ) ) ( not ( = ?auto_546993 ?auto_546995 ) ) ( not ( = ?auto_546993 ?auto_546996 ) ) ( not ( = ?auto_546993 ?auto_546997 ) ) ( not ( = ?auto_546993 ?auto_546998 ) ) ( not ( = ?auto_546993 ?auto_546999 ) ) ( not ( = ?auto_546994 ?auto_546995 ) ) ( not ( = ?auto_546994 ?auto_546996 ) ) ( not ( = ?auto_546994 ?auto_546997 ) ) ( not ( = ?auto_546994 ?auto_546998 ) ) ( not ( = ?auto_546994 ?auto_546999 ) ) ( not ( = ?auto_546995 ?auto_546996 ) ) ( not ( = ?auto_546995 ?auto_546997 ) ) ( not ( = ?auto_546995 ?auto_546998 ) ) ( not ( = ?auto_546995 ?auto_546999 ) ) ( not ( = ?auto_546996 ?auto_546997 ) ) ( not ( = ?auto_546996 ?auto_546998 ) ) ( not ( = ?auto_546996 ?auto_546999 ) ) ( not ( = ?auto_546997 ?auto_546998 ) ) ( not ( = ?auto_546997 ?auto_546999 ) ) ( not ( = ?auto_546998 ?auto_546999 ) ) ( ON ?auto_546997 ?auto_546998 ) ( ON ?auto_546996 ?auto_546997 ) ( CLEAR ?auto_546994 ) ( ON ?auto_546995 ?auto_546996 ) ( CLEAR ?auto_546995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_546992 ?auto_546993 ?auto_546994 ?auto_546995 )
      ( MAKE-7PILE ?auto_546992 ?auto_546993 ?auto_546994 ?auto_546995 ?auto_546996 ?auto_546997 ?auto_546998 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_547022 - BLOCK
      ?auto_547023 - BLOCK
      ?auto_547024 - BLOCK
      ?auto_547025 - BLOCK
      ?auto_547026 - BLOCK
      ?auto_547027 - BLOCK
      ?auto_547028 - BLOCK
    )
    :vars
    (
      ?auto_547029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547028 ?auto_547029 ) ( ON-TABLE ?auto_547022 ) ( ON ?auto_547023 ?auto_547022 ) ( not ( = ?auto_547022 ?auto_547023 ) ) ( not ( = ?auto_547022 ?auto_547024 ) ) ( not ( = ?auto_547022 ?auto_547025 ) ) ( not ( = ?auto_547022 ?auto_547026 ) ) ( not ( = ?auto_547022 ?auto_547027 ) ) ( not ( = ?auto_547022 ?auto_547028 ) ) ( not ( = ?auto_547022 ?auto_547029 ) ) ( not ( = ?auto_547023 ?auto_547024 ) ) ( not ( = ?auto_547023 ?auto_547025 ) ) ( not ( = ?auto_547023 ?auto_547026 ) ) ( not ( = ?auto_547023 ?auto_547027 ) ) ( not ( = ?auto_547023 ?auto_547028 ) ) ( not ( = ?auto_547023 ?auto_547029 ) ) ( not ( = ?auto_547024 ?auto_547025 ) ) ( not ( = ?auto_547024 ?auto_547026 ) ) ( not ( = ?auto_547024 ?auto_547027 ) ) ( not ( = ?auto_547024 ?auto_547028 ) ) ( not ( = ?auto_547024 ?auto_547029 ) ) ( not ( = ?auto_547025 ?auto_547026 ) ) ( not ( = ?auto_547025 ?auto_547027 ) ) ( not ( = ?auto_547025 ?auto_547028 ) ) ( not ( = ?auto_547025 ?auto_547029 ) ) ( not ( = ?auto_547026 ?auto_547027 ) ) ( not ( = ?auto_547026 ?auto_547028 ) ) ( not ( = ?auto_547026 ?auto_547029 ) ) ( not ( = ?auto_547027 ?auto_547028 ) ) ( not ( = ?auto_547027 ?auto_547029 ) ) ( not ( = ?auto_547028 ?auto_547029 ) ) ( ON ?auto_547027 ?auto_547028 ) ( ON ?auto_547026 ?auto_547027 ) ( ON ?auto_547025 ?auto_547026 ) ( CLEAR ?auto_547023 ) ( ON ?auto_547024 ?auto_547025 ) ( CLEAR ?auto_547024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_547022 ?auto_547023 ?auto_547024 )
      ( MAKE-7PILE ?auto_547022 ?auto_547023 ?auto_547024 ?auto_547025 ?auto_547026 ?auto_547027 ?auto_547028 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_547052 - BLOCK
      ?auto_547053 - BLOCK
      ?auto_547054 - BLOCK
      ?auto_547055 - BLOCK
      ?auto_547056 - BLOCK
      ?auto_547057 - BLOCK
      ?auto_547058 - BLOCK
    )
    :vars
    (
      ?auto_547059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547058 ?auto_547059 ) ( ON-TABLE ?auto_547052 ) ( not ( = ?auto_547052 ?auto_547053 ) ) ( not ( = ?auto_547052 ?auto_547054 ) ) ( not ( = ?auto_547052 ?auto_547055 ) ) ( not ( = ?auto_547052 ?auto_547056 ) ) ( not ( = ?auto_547052 ?auto_547057 ) ) ( not ( = ?auto_547052 ?auto_547058 ) ) ( not ( = ?auto_547052 ?auto_547059 ) ) ( not ( = ?auto_547053 ?auto_547054 ) ) ( not ( = ?auto_547053 ?auto_547055 ) ) ( not ( = ?auto_547053 ?auto_547056 ) ) ( not ( = ?auto_547053 ?auto_547057 ) ) ( not ( = ?auto_547053 ?auto_547058 ) ) ( not ( = ?auto_547053 ?auto_547059 ) ) ( not ( = ?auto_547054 ?auto_547055 ) ) ( not ( = ?auto_547054 ?auto_547056 ) ) ( not ( = ?auto_547054 ?auto_547057 ) ) ( not ( = ?auto_547054 ?auto_547058 ) ) ( not ( = ?auto_547054 ?auto_547059 ) ) ( not ( = ?auto_547055 ?auto_547056 ) ) ( not ( = ?auto_547055 ?auto_547057 ) ) ( not ( = ?auto_547055 ?auto_547058 ) ) ( not ( = ?auto_547055 ?auto_547059 ) ) ( not ( = ?auto_547056 ?auto_547057 ) ) ( not ( = ?auto_547056 ?auto_547058 ) ) ( not ( = ?auto_547056 ?auto_547059 ) ) ( not ( = ?auto_547057 ?auto_547058 ) ) ( not ( = ?auto_547057 ?auto_547059 ) ) ( not ( = ?auto_547058 ?auto_547059 ) ) ( ON ?auto_547057 ?auto_547058 ) ( ON ?auto_547056 ?auto_547057 ) ( ON ?auto_547055 ?auto_547056 ) ( ON ?auto_547054 ?auto_547055 ) ( CLEAR ?auto_547052 ) ( ON ?auto_547053 ?auto_547054 ) ( CLEAR ?auto_547053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_547052 ?auto_547053 )
      ( MAKE-7PILE ?auto_547052 ?auto_547053 ?auto_547054 ?auto_547055 ?auto_547056 ?auto_547057 ?auto_547058 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_547082 - BLOCK
      ?auto_547083 - BLOCK
      ?auto_547084 - BLOCK
      ?auto_547085 - BLOCK
      ?auto_547086 - BLOCK
      ?auto_547087 - BLOCK
      ?auto_547088 - BLOCK
    )
    :vars
    (
      ?auto_547089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547088 ?auto_547089 ) ( not ( = ?auto_547082 ?auto_547083 ) ) ( not ( = ?auto_547082 ?auto_547084 ) ) ( not ( = ?auto_547082 ?auto_547085 ) ) ( not ( = ?auto_547082 ?auto_547086 ) ) ( not ( = ?auto_547082 ?auto_547087 ) ) ( not ( = ?auto_547082 ?auto_547088 ) ) ( not ( = ?auto_547082 ?auto_547089 ) ) ( not ( = ?auto_547083 ?auto_547084 ) ) ( not ( = ?auto_547083 ?auto_547085 ) ) ( not ( = ?auto_547083 ?auto_547086 ) ) ( not ( = ?auto_547083 ?auto_547087 ) ) ( not ( = ?auto_547083 ?auto_547088 ) ) ( not ( = ?auto_547083 ?auto_547089 ) ) ( not ( = ?auto_547084 ?auto_547085 ) ) ( not ( = ?auto_547084 ?auto_547086 ) ) ( not ( = ?auto_547084 ?auto_547087 ) ) ( not ( = ?auto_547084 ?auto_547088 ) ) ( not ( = ?auto_547084 ?auto_547089 ) ) ( not ( = ?auto_547085 ?auto_547086 ) ) ( not ( = ?auto_547085 ?auto_547087 ) ) ( not ( = ?auto_547085 ?auto_547088 ) ) ( not ( = ?auto_547085 ?auto_547089 ) ) ( not ( = ?auto_547086 ?auto_547087 ) ) ( not ( = ?auto_547086 ?auto_547088 ) ) ( not ( = ?auto_547086 ?auto_547089 ) ) ( not ( = ?auto_547087 ?auto_547088 ) ) ( not ( = ?auto_547087 ?auto_547089 ) ) ( not ( = ?auto_547088 ?auto_547089 ) ) ( ON ?auto_547087 ?auto_547088 ) ( ON ?auto_547086 ?auto_547087 ) ( ON ?auto_547085 ?auto_547086 ) ( ON ?auto_547084 ?auto_547085 ) ( ON ?auto_547083 ?auto_547084 ) ( ON ?auto_547082 ?auto_547083 ) ( CLEAR ?auto_547082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_547082 )
      ( MAKE-7PILE ?auto_547082 ?auto_547083 ?auto_547084 ?auto_547085 ?auto_547086 ?auto_547087 ?auto_547088 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_547113 - BLOCK
      ?auto_547114 - BLOCK
      ?auto_547115 - BLOCK
      ?auto_547116 - BLOCK
      ?auto_547117 - BLOCK
      ?auto_547118 - BLOCK
      ?auto_547119 - BLOCK
      ?auto_547120 - BLOCK
    )
    :vars
    (
      ?auto_547121 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_547119 ) ( ON ?auto_547120 ?auto_547121 ) ( CLEAR ?auto_547120 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_547113 ) ( ON ?auto_547114 ?auto_547113 ) ( ON ?auto_547115 ?auto_547114 ) ( ON ?auto_547116 ?auto_547115 ) ( ON ?auto_547117 ?auto_547116 ) ( ON ?auto_547118 ?auto_547117 ) ( ON ?auto_547119 ?auto_547118 ) ( not ( = ?auto_547113 ?auto_547114 ) ) ( not ( = ?auto_547113 ?auto_547115 ) ) ( not ( = ?auto_547113 ?auto_547116 ) ) ( not ( = ?auto_547113 ?auto_547117 ) ) ( not ( = ?auto_547113 ?auto_547118 ) ) ( not ( = ?auto_547113 ?auto_547119 ) ) ( not ( = ?auto_547113 ?auto_547120 ) ) ( not ( = ?auto_547113 ?auto_547121 ) ) ( not ( = ?auto_547114 ?auto_547115 ) ) ( not ( = ?auto_547114 ?auto_547116 ) ) ( not ( = ?auto_547114 ?auto_547117 ) ) ( not ( = ?auto_547114 ?auto_547118 ) ) ( not ( = ?auto_547114 ?auto_547119 ) ) ( not ( = ?auto_547114 ?auto_547120 ) ) ( not ( = ?auto_547114 ?auto_547121 ) ) ( not ( = ?auto_547115 ?auto_547116 ) ) ( not ( = ?auto_547115 ?auto_547117 ) ) ( not ( = ?auto_547115 ?auto_547118 ) ) ( not ( = ?auto_547115 ?auto_547119 ) ) ( not ( = ?auto_547115 ?auto_547120 ) ) ( not ( = ?auto_547115 ?auto_547121 ) ) ( not ( = ?auto_547116 ?auto_547117 ) ) ( not ( = ?auto_547116 ?auto_547118 ) ) ( not ( = ?auto_547116 ?auto_547119 ) ) ( not ( = ?auto_547116 ?auto_547120 ) ) ( not ( = ?auto_547116 ?auto_547121 ) ) ( not ( = ?auto_547117 ?auto_547118 ) ) ( not ( = ?auto_547117 ?auto_547119 ) ) ( not ( = ?auto_547117 ?auto_547120 ) ) ( not ( = ?auto_547117 ?auto_547121 ) ) ( not ( = ?auto_547118 ?auto_547119 ) ) ( not ( = ?auto_547118 ?auto_547120 ) ) ( not ( = ?auto_547118 ?auto_547121 ) ) ( not ( = ?auto_547119 ?auto_547120 ) ) ( not ( = ?auto_547119 ?auto_547121 ) ) ( not ( = ?auto_547120 ?auto_547121 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_547120 ?auto_547121 )
      ( !STACK ?auto_547120 ?auto_547119 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_547147 - BLOCK
      ?auto_547148 - BLOCK
      ?auto_547149 - BLOCK
      ?auto_547150 - BLOCK
      ?auto_547151 - BLOCK
      ?auto_547152 - BLOCK
      ?auto_547153 - BLOCK
      ?auto_547154 - BLOCK
    )
    :vars
    (
      ?auto_547155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547154 ?auto_547155 ) ( ON-TABLE ?auto_547147 ) ( ON ?auto_547148 ?auto_547147 ) ( ON ?auto_547149 ?auto_547148 ) ( ON ?auto_547150 ?auto_547149 ) ( ON ?auto_547151 ?auto_547150 ) ( ON ?auto_547152 ?auto_547151 ) ( not ( = ?auto_547147 ?auto_547148 ) ) ( not ( = ?auto_547147 ?auto_547149 ) ) ( not ( = ?auto_547147 ?auto_547150 ) ) ( not ( = ?auto_547147 ?auto_547151 ) ) ( not ( = ?auto_547147 ?auto_547152 ) ) ( not ( = ?auto_547147 ?auto_547153 ) ) ( not ( = ?auto_547147 ?auto_547154 ) ) ( not ( = ?auto_547147 ?auto_547155 ) ) ( not ( = ?auto_547148 ?auto_547149 ) ) ( not ( = ?auto_547148 ?auto_547150 ) ) ( not ( = ?auto_547148 ?auto_547151 ) ) ( not ( = ?auto_547148 ?auto_547152 ) ) ( not ( = ?auto_547148 ?auto_547153 ) ) ( not ( = ?auto_547148 ?auto_547154 ) ) ( not ( = ?auto_547148 ?auto_547155 ) ) ( not ( = ?auto_547149 ?auto_547150 ) ) ( not ( = ?auto_547149 ?auto_547151 ) ) ( not ( = ?auto_547149 ?auto_547152 ) ) ( not ( = ?auto_547149 ?auto_547153 ) ) ( not ( = ?auto_547149 ?auto_547154 ) ) ( not ( = ?auto_547149 ?auto_547155 ) ) ( not ( = ?auto_547150 ?auto_547151 ) ) ( not ( = ?auto_547150 ?auto_547152 ) ) ( not ( = ?auto_547150 ?auto_547153 ) ) ( not ( = ?auto_547150 ?auto_547154 ) ) ( not ( = ?auto_547150 ?auto_547155 ) ) ( not ( = ?auto_547151 ?auto_547152 ) ) ( not ( = ?auto_547151 ?auto_547153 ) ) ( not ( = ?auto_547151 ?auto_547154 ) ) ( not ( = ?auto_547151 ?auto_547155 ) ) ( not ( = ?auto_547152 ?auto_547153 ) ) ( not ( = ?auto_547152 ?auto_547154 ) ) ( not ( = ?auto_547152 ?auto_547155 ) ) ( not ( = ?auto_547153 ?auto_547154 ) ) ( not ( = ?auto_547153 ?auto_547155 ) ) ( not ( = ?auto_547154 ?auto_547155 ) ) ( CLEAR ?auto_547152 ) ( ON ?auto_547153 ?auto_547154 ) ( CLEAR ?auto_547153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_547147 ?auto_547148 ?auto_547149 ?auto_547150 ?auto_547151 ?auto_547152 ?auto_547153 )
      ( MAKE-8PILE ?auto_547147 ?auto_547148 ?auto_547149 ?auto_547150 ?auto_547151 ?auto_547152 ?auto_547153 ?auto_547154 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_547181 - BLOCK
      ?auto_547182 - BLOCK
      ?auto_547183 - BLOCK
      ?auto_547184 - BLOCK
      ?auto_547185 - BLOCK
      ?auto_547186 - BLOCK
      ?auto_547187 - BLOCK
      ?auto_547188 - BLOCK
    )
    :vars
    (
      ?auto_547189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547188 ?auto_547189 ) ( ON-TABLE ?auto_547181 ) ( ON ?auto_547182 ?auto_547181 ) ( ON ?auto_547183 ?auto_547182 ) ( ON ?auto_547184 ?auto_547183 ) ( ON ?auto_547185 ?auto_547184 ) ( not ( = ?auto_547181 ?auto_547182 ) ) ( not ( = ?auto_547181 ?auto_547183 ) ) ( not ( = ?auto_547181 ?auto_547184 ) ) ( not ( = ?auto_547181 ?auto_547185 ) ) ( not ( = ?auto_547181 ?auto_547186 ) ) ( not ( = ?auto_547181 ?auto_547187 ) ) ( not ( = ?auto_547181 ?auto_547188 ) ) ( not ( = ?auto_547181 ?auto_547189 ) ) ( not ( = ?auto_547182 ?auto_547183 ) ) ( not ( = ?auto_547182 ?auto_547184 ) ) ( not ( = ?auto_547182 ?auto_547185 ) ) ( not ( = ?auto_547182 ?auto_547186 ) ) ( not ( = ?auto_547182 ?auto_547187 ) ) ( not ( = ?auto_547182 ?auto_547188 ) ) ( not ( = ?auto_547182 ?auto_547189 ) ) ( not ( = ?auto_547183 ?auto_547184 ) ) ( not ( = ?auto_547183 ?auto_547185 ) ) ( not ( = ?auto_547183 ?auto_547186 ) ) ( not ( = ?auto_547183 ?auto_547187 ) ) ( not ( = ?auto_547183 ?auto_547188 ) ) ( not ( = ?auto_547183 ?auto_547189 ) ) ( not ( = ?auto_547184 ?auto_547185 ) ) ( not ( = ?auto_547184 ?auto_547186 ) ) ( not ( = ?auto_547184 ?auto_547187 ) ) ( not ( = ?auto_547184 ?auto_547188 ) ) ( not ( = ?auto_547184 ?auto_547189 ) ) ( not ( = ?auto_547185 ?auto_547186 ) ) ( not ( = ?auto_547185 ?auto_547187 ) ) ( not ( = ?auto_547185 ?auto_547188 ) ) ( not ( = ?auto_547185 ?auto_547189 ) ) ( not ( = ?auto_547186 ?auto_547187 ) ) ( not ( = ?auto_547186 ?auto_547188 ) ) ( not ( = ?auto_547186 ?auto_547189 ) ) ( not ( = ?auto_547187 ?auto_547188 ) ) ( not ( = ?auto_547187 ?auto_547189 ) ) ( not ( = ?auto_547188 ?auto_547189 ) ) ( ON ?auto_547187 ?auto_547188 ) ( CLEAR ?auto_547185 ) ( ON ?auto_547186 ?auto_547187 ) ( CLEAR ?auto_547186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_547181 ?auto_547182 ?auto_547183 ?auto_547184 ?auto_547185 ?auto_547186 )
      ( MAKE-8PILE ?auto_547181 ?auto_547182 ?auto_547183 ?auto_547184 ?auto_547185 ?auto_547186 ?auto_547187 ?auto_547188 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_547215 - BLOCK
      ?auto_547216 - BLOCK
      ?auto_547217 - BLOCK
      ?auto_547218 - BLOCK
      ?auto_547219 - BLOCK
      ?auto_547220 - BLOCK
      ?auto_547221 - BLOCK
      ?auto_547222 - BLOCK
    )
    :vars
    (
      ?auto_547223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547222 ?auto_547223 ) ( ON-TABLE ?auto_547215 ) ( ON ?auto_547216 ?auto_547215 ) ( ON ?auto_547217 ?auto_547216 ) ( ON ?auto_547218 ?auto_547217 ) ( not ( = ?auto_547215 ?auto_547216 ) ) ( not ( = ?auto_547215 ?auto_547217 ) ) ( not ( = ?auto_547215 ?auto_547218 ) ) ( not ( = ?auto_547215 ?auto_547219 ) ) ( not ( = ?auto_547215 ?auto_547220 ) ) ( not ( = ?auto_547215 ?auto_547221 ) ) ( not ( = ?auto_547215 ?auto_547222 ) ) ( not ( = ?auto_547215 ?auto_547223 ) ) ( not ( = ?auto_547216 ?auto_547217 ) ) ( not ( = ?auto_547216 ?auto_547218 ) ) ( not ( = ?auto_547216 ?auto_547219 ) ) ( not ( = ?auto_547216 ?auto_547220 ) ) ( not ( = ?auto_547216 ?auto_547221 ) ) ( not ( = ?auto_547216 ?auto_547222 ) ) ( not ( = ?auto_547216 ?auto_547223 ) ) ( not ( = ?auto_547217 ?auto_547218 ) ) ( not ( = ?auto_547217 ?auto_547219 ) ) ( not ( = ?auto_547217 ?auto_547220 ) ) ( not ( = ?auto_547217 ?auto_547221 ) ) ( not ( = ?auto_547217 ?auto_547222 ) ) ( not ( = ?auto_547217 ?auto_547223 ) ) ( not ( = ?auto_547218 ?auto_547219 ) ) ( not ( = ?auto_547218 ?auto_547220 ) ) ( not ( = ?auto_547218 ?auto_547221 ) ) ( not ( = ?auto_547218 ?auto_547222 ) ) ( not ( = ?auto_547218 ?auto_547223 ) ) ( not ( = ?auto_547219 ?auto_547220 ) ) ( not ( = ?auto_547219 ?auto_547221 ) ) ( not ( = ?auto_547219 ?auto_547222 ) ) ( not ( = ?auto_547219 ?auto_547223 ) ) ( not ( = ?auto_547220 ?auto_547221 ) ) ( not ( = ?auto_547220 ?auto_547222 ) ) ( not ( = ?auto_547220 ?auto_547223 ) ) ( not ( = ?auto_547221 ?auto_547222 ) ) ( not ( = ?auto_547221 ?auto_547223 ) ) ( not ( = ?auto_547222 ?auto_547223 ) ) ( ON ?auto_547221 ?auto_547222 ) ( ON ?auto_547220 ?auto_547221 ) ( CLEAR ?auto_547218 ) ( ON ?auto_547219 ?auto_547220 ) ( CLEAR ?auto_547219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_547215 ?auto_547216 ?auto_547217 ?auto_547218 ?auto_547219 )
      ( MAKE-8PILE ?auto_547215 ?auto_547216 ?auto_547217 ?auto_547218 ?auto_547219 ?auto_547220 ?auto_547221 ?auto_547222 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_547249 - BLOCK
      ?auto_547250 - BLOCK
      ?auto_547251 - BLOCK
      ?auto_547252 - BLOCK
      ?auto_547253 - BLOCK
      ?auto_547254 - BLOCK
      ?auto_547255 - BLOCK
      ?auto_547256 - BLOCK
    )
    :vars
    (
      ?auto_547257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547256 ?auto_547257 ) ( ON-TABLE ?auto_547249 ) ( ON ?auto_547250 ?auto_547249 ) ( ON ?auto_547251 ?auto_547250 ) ( not ( = ?auto_547249 ?auto_547250 ) ) ( not ( = ?auto_547249 ?auto_547251 ) ) ( not ( = ?auto_547249 ?auto_547252 ) ) ( not ( = ?auto_547249 ?auto_547253 ) ) ( not ( = ?auto_547249 ?auto_547254 ) ) ( not ( = ?auto_547249 ?auto_547255 ) ) ( not ( = ?auto_547249 ?auto_547256 ) ) ( not ( = ?auto_547249 ?auto_547257 ) ) ( not ( = ?auto_547250 ?auto_547251 ) ) ( not ( = ?auto_547250 ?auto_547252 ) ) ( not ( = ?auto_547250 ?auto_547253 ) ) ( not ( = ?auto_547250 ?auto_547254 ) ) ( not ( = ?auto_547250 ?auto_547255 ) ) ( not ( = ?auto_547250 ?auto_547256 ) ) ( not ( = ?auto_547250 ?auto_547257 ) ) ( not ( = ?auto_547251 ?auto_547252 ) ) ( not ( = ?auto_547251 ?auto_547253 ) ) ( not ( = ?auto_547251 ?auto_547254 ) ) ( not ( = ?auto_547251 ?auto_547255 ) ) ( not ( = ?auto_547251 ?auto_547256 ) ) ( not ( = ?auto_547251 ?auto_547257 ) ) ( not ( = ?auto_547252 ?auto_547253 ) ) ( not ( = ?auto_547252 ?auto_547254 ) ) ( not ( = ?auto_547252 ?auto_547255 ) ) ( not ( = ?auto_547252 ?auto_547256 ) ) ( not ( = ?auto_547252 ?auto_547257 ) ) ( not ( = ?auto_547253 ?auto_547254 ) ) ( not ( = ?auto_547253 ?auto_547255 ) ) ( not ( = ?auto_547253 ?auto_547256 ) ) ( not ( = ?auto_547253 ?auto_547257 ) ) ( not ( = ?auto_547254 ?auto_547255 ) ) ( not ( = ?auto_547254 ?auto_547256 ) ) ( not ( = ?auto_547254 ?auto_547257 ) ) ( not ( = ?auto_547255 ?auto_547256 ) ) ( not ( = ?auto_547255 ?auto_547257 ) ) ( not ( = ?auto_547256 ?auto_547257 ) ) ( ON ?auto_547255 ?auto_547256 ) ( ON ?auto_547254 ?auto_547255 ) ( ON ?auto_547253 ?auto_547254 ) ( CLEAR ?auto_547251 ) ( ON ?auto_547252 ?auto_547253 ) ( CLEAR ?auto_547252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_547249 ?auto_547250 ?auto_547251 ?auto_547252 )
      ( MAKE-8PILE ?auto_547249 ?auto_547250 ?auto_547251 ?auto_547252 ?auto_547253 ?auto_547254 ?auto_547255 ?auto_547256 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_547283 - BLOCK
      ?auto_547284 - BLOCK
      ?auto_547285 - BLOCK
      ?auto_547286 - BLOCK
      ?auto_547287 - BLOCK
      ?auto_547288 - BLOCK
      ?auto_547289 - BLOCK
      ?auto_547290 - BLOCK
    )
    :vars
    (
      ?auto_547291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547290 ?auto_547291 ) ( ON-TABLE ?auto_547283 ) ( ON ?auto_547284 ?auto_547283 ) ( not ( = ?auto_547283 ?auto_547284 ) ) ( not ( = ?auto_547283 ?auto_547285 ) ) ( not ( = ?auto_547283 ?auto_547286 ) ) ( not ( = ?auto_547283 ?auto_547287 ) ) ( not ( = ?auto_547283 ?auto_547288 ) ) ( not ( = ?auto_547283 ?auto_547289 ) ) ( not ( = ?auto_547283 ?auto_547290 ) ) ( not ( = ?auto_547283 ?auto_547291 ) ) ( not ( = ?auto_547284 ?auto_547285 ) ) ( not ( = ?auto_547284 ?auto_547286 ) ) ( not ( = ?auto_547284 ?auto_547287 ) ) ( not ( = ?auto_547284 ?auto_547288 ) ) ( not ( = ?auto_547284 ?auto_547289 ) ) ( not ( = ?auto_547284 ?auto_547290 ) ) ( not ( = ?auto_547284 ?auto_547291 ) ) ( not ( = ?auto_547285 ?auto_547286 ) ) ( not ( = ?auto_547285 ?auto_547287 ) ) ( not ( = ?auto_547285 ?auto_547288 ) ) ( not ( = ?auto_547285 ?auto_547289 ) ) ( not ( = ?auto_547285 ?auto_547290 ) ) ( not ( = ?auto_547285 ?auto_547291 ) ) ( not ( = ?auto_547286 ?auto_547287 ) ) ( not ( = ?auto_547286 ?auto_547288 ) ) ( not ( = ?auto_547286 ?auto_547289 ) ) ( not ( = ?auto_547286 ?auto_547290 ) ) ( not ( = ?auto_547286 ?auto_547291 ) ) ( not ( = ?auto_547287 ?auto_547288 ) ) ( not ( = ?auto_547287 ?auto_547289 ) ) ( not ( = ?auto_547287 ?auto_547290 ) ) ( not ( = ?auto_547287 ?auto_547291 ) ) ( not ( = ?auto_547288 ?auto_547289 ) ) ( not ( = ?auto_547288 ?auto_547290 ) ) ( not ( = ?auto_547288 ?auto_547291 ) ) ( not ( = ?auto_547289 ?auto_547290 ) ) ( not ( = ?auto_547289 ?auto_547291 ) ) ( not ( = ?auto_547290 ?auto_547291 ) ) ( ON ?auto_547289 ?auto_547290 ) ( ON ?auto_547288 ?auto_547289 ) ( ON ?auto_547287 ?auto_547288 ) ( ON ?auto_547286 ?auto_547287 ) ( CLEAR ?auto_547284 ) ( ON ?auto_547285 ?auto_547286 ) ( CLEAR ?auto_547285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_547283 ?auto_547284 ?auto_547285 )
      ( MAKE-8PILE ?auto_547283 ?auto_547284 ?auto_547285 ?auto_547286 ?auto_547287 ?auto_547288 ?auto_547289 ?auto_547290 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_547317 - BLOCK
      ?auto_547318 - BLOCK
      ?auto_547319 - BLOCK
      ?auto_547320 - BLOCK
      ?auto_547321 - BLOCK
      ?auto_547322 - BLOCK
      ?auto_547323 - BLOCK
      ?auto_547324 - BLOCK
    )
    :vars
    (
      ?auto_547325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547324 ?auto_547325 ) ( ON-TABLE ?auto_547317 ) ( not ( = ?auto_547317 ?auto_547318 ) ) ( not ( = ?auto_547317 ?auto_547319 ) ) ( not ( = ?auto_547317 ?auto_547320 ) ) ( not ( = ?auto_547317 ?auto_547321 ) ) ( not ( = ?auto_547317 ?auto_547322 ) ) ( not ( = ?auto_547317 ?auto_547323 ) ) ( not ( = ?auto_547317 ?auto_547324 ) ) ( not ( = ?auto_547317 ?auto_547325 ) ) ( not ( = ?auto_547318 ?auto_547319 ) ) ( not ( = ?auto_547318 ?auto_547320 ) ) ( not ( = ?auto_547318 ?auto_547321 ) ) ( not ( = ?auto_547318 ?auto_547322 ) ) ( not ( = ?auto_547318 ?auto_547323 ) ) ( not ( = ?auto_547318 ?auto_547324 ) ) ( not ( = ?auto_547318 ?auto_547325 ) ) ( not ( = ?auto_547319 ?auto_547320 ) ) ( not ( = ?auto_547319 ?auto_547321 ) ) ( not ( = ?auto_547319 ?auto_547322 ) ) ( not ( = ?auto_547319 ?auto_547323 ) ) ( not ( = ?auto_547319 ?auto_547324 ) ) ( not ( = ?auto_547319 ?auto_547325 ) ) ( not ( = ?auto_547320 ?auto_547321 ) ) ( not ( = ?auto_547320 ?auto_547322 ) ) ( not ( = ?auto_547320 ?auto_547323 ) ) ( not ( = ?auto_547320 ?auto_547324 ) ) ( not ( = ?auto_547320 ?auto_547325 ) ) ( not ( = ?auto_547321 ?auto_547322 ) ) ( not ( = ?auto_547321 ?auto_547323 ) ) ( not ( = ?auto_547321 ?auto_547324 ) ) ( not ( = ?auto_547321 ?auto_547325 ) ) ( not ( = ?auto_547322 ?auto_547323 ) ) ( not ( = ?auto_547322 ?auto_547324 ) ) ( not ( = ?auto_547322 ?auto_547325 ) ) ( not ( = ?auto_547323 ?auto_547324 ) ) ( not ( = ?auto_547323 ?auto_547325 ) ) ( not ( = ?auto_547324 ?auto_547325 ) ) ( ON ?auto_547323 ?auto_547324 ) ( ON ?auto_547322 ?auto_547323 ) ( ON ?auto_547321 ?auto_547322 ) ( ON ?auto_547320 ?auto_547321 ) ( ON ?auto_547319 ?auto_547320 ) ( CLEAR ?auto_547317 ) ( ON ?auto_547318 ?auto_547319 ) ( CLEAR ?auto_547318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_547317 ?auto_547318 )
      ( MAKE-8PILE ?auto_547317 ?auto_547318 ?auto_547319 ?auto_547320 ?auto_547321 ?auto_547322 ?auto_547323 ?auto_547324 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_547351 - BLOCK
      ?auto_547352 - BLOCK
      ?auto_547353 - BLOCK
      ?auto_547354 - BLOCK
      ?auto_547355 - BLOCK
      ?auto_547356 - BLOCK
      ?auto_547357 - BLOCK
      ?auto_547358 - BLOCK
    )
    :vars
    (
      ?auto_547359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547358 ?auto_547359 ) ( not ( = ?auto_547351 ?auto_547352 ) ) ( not ( = ?auto_547351 ?auto_547353 ) ) ( not ( = ?auto_547351 ?auto_547354 ) ) ( not ( = ?auto_547351 ?auto_547355 ) ) ( not ( = ?auto_547351 ?auto_547356 ) ) ( not ( = ?auto_547351 ?auto_547357 ) ) ( not ( = ?auto_547351 ?auto_547358 ) ) ( not ( = ?auto_547351 ?auto_547359 ) ) ( not ( = ?auto_547352 ?auto_547353 ) ) ( not ( = ?auto_547352 ?auto_547354 ) ) ( not ( = ?auto_547352 ?auto_547355 ) ) ( not ( = ?auto_547352 ?auto_547356 ) ) ( not ( = ?auto_547352 ?auto_547357 ) ) ( not ( = ?auto_547352 ?auto_547358 ) ) ( not ( = ?auto_547352 ?auto_547359 ) ) ( not ( = ?auto_547353 ?auto_547354 ) ) ( not ( = ?auto_547353 ?auto_547355 ) ) ( not ( = ?auto_547353 ?auto_547356 ) ) ( not ( = ?auto_547353 ?auto_547357 ) ) ( not ( = ?auto_547353 ?auto_547358 ) ) ( not ( = ?auto_547353 ?auto_547359 ) ) ( not ( = ?auto_547354 ?auto_547355 ) ) ( not ( = ?auto_547354 ?auto_547356 ) ) ( not ( = ?auto_547354 ?auto_547357 ) ) ( not ( = ?auto_547354 ?auto_547358 ) ) ( not ( = ?auto_547354 ?auto_547359 ) ) ( not ( = ?auto_547355 ?auto_547356 ) ) ( not ( = ?auto_547355 ?auto_547357 ) ) ( not ( = ?auto_547355 ?auto_547358 ) ) ( not ( = ?auto_547355 ?auto_547359 ) ) ( not ( = ?auto_547356 ?auto_547357 ) ) ( not ( = ?auto_547356 ?auto_547358 ) ) ( not ( = ?auto_547356 ?auto_547359 ) ) ( not ( = ?auto_547357 ?auto_547358 ) ) ( not ( = ?auto_547357 ?auto_547359 ) ) ( not ( = ?auto_547358 ?auto_547359 ) ) ( ON ?auto_547357 ?auto_547358 ) ( ON ?auto_547356 ?auto_547357 ) ( ON ?auto_547355 ?auto_547356 ) ( ON ?auto_547354 ?auto_547355 ) ( ON ?auto_547353 ?auto_547354 ) ( ON ?auto_547352 ?auto_547353 ) ( ON ?auto_547351 ?auto_547352 ) ( CLEAR ?auto_547351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_547351 )
      ( MAKE-8PILE ?auto_547351 ?auto_547352 ?auto_547353 ?auto_547354 ?auto_547355 ?auto_547356 ?auto_547357 ?auto_547358 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_547386 - BLOCK
      ?auto_547387 - BLOCK
      ?auto_547388 - BLOCK
      ?auto_547389 - BLOCK
      ?auto_547390 - BLOCK
      ?auto_547391 - BLOCK
      ?auto_547392 - BLOCK
      ?auto_547393 - BLOCK
      ?auto_547394 - BLOCK
    )
    :vars
    (
      ?auto_547395 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_547393 ) ( ON ?auto_547394 ?auto_547395 ) ( CLEAR ?auto_547394 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_547386 ) ( ON ?auto_547387 ?auto_547386 ) ( ON ?auto_547388 ?auto_547387 ) ( ON ?auto_547389 ?auto_547388 ) ( ON ?auto_547390 ?auto_547389 ) ( ON ?auto_547391 ?auto_547390 ) ( ON ?auto_547392 ?auto_547391 ) ( ON ?auto_547393 ?auto_547392 ) ( not ( = ?auto_547386 ?auto_547387 ) ) ( not ( = ?auto_547386 ?auto_547388 ) ) ( not ( = ?auto_547386 ?auto_547389 ) ) ( not ( = ?auto_547386 ?auto_547390 ) ) ( not ( = ?auto_547386 ?auto_547391 ) ) ( not ( = ?auto_547386 ?auto_547392 ) ) ( not ( = ?auto_547386 ?auto_547393 ) ) ( not ( = ?auto_547386 ?auto_547394 ) ) ( not ( = ?auto_547386 ?auto_547395 ) ) ( not ( = ?auto_547387 ?auto_547388 ) ) ( not ( = ?auto_547387 ?auto_547389 ) ) ( not ( = ?auto_547387 ?auto_547390 ) ) ( not ( = ?auto_547387 ?auto_547391 ) ) ( not ( = ?auto_547387 ?auto_547392 ) ) ( not ( = ?auto_547387 ?auto_547393 ) ) ( not ( = ?auto_547387 ?auto_547394 ) ) ( not ( = ?auto_547387 ?auto_547395 ) ) ( not ( = ?auto_547388 ?auto_547389 ) ) ( not ( = ?auto_547388 ?auto_547390 ) ) ( not ( = ?auto_547388 ?auto_547391 ) ) ( not ( = ?auto_547388 ?auto_547392 ) ) ( not ( = ?auto_547388 ?auto_547393 ) ) ( not ( = ?auto_547388 ?auto_547394 ) ) ( not ( = ?auto_547388 ?auto_547395 ) ) ( not ( = ?auto_547389 ?auto_547390 ) ) ( not ( = ?auto_547389 ?auto_547391 ) ) ( not ( = ?auto_547389 ?auto_547392 ) ) ( not ( = ?auto_547389 ?auto_547393 ) ) ( not ( = ?auto_547389 ?auto_547394 ) ) ( not ( = ?auto_547389 ?auto_547395 ) ) ( not ( = ?auto_547390 ?auto_547391 ) ) ( not ( = ?auto_547390 ?auto_547392 ) ) ( not ( = ?auto_547390 ?auto_547393 ) ) ( not ( = ?auto_547390 ?auto_547394 ) ) ( not ( = ?auto_547390 ?auto_547395 ) ) ( not ( = ?auto_547391 ?auto_547392 ) ) ( not ( = ?auto_547391 ?auto_547393 ) ) ( not ( = ?auto_547391 ?auto_547394 ) ) ( not ( = ?auto_547391 ?auto_547395 ) ) ( not ( = ?auto_547392 ?auto_547393 ) ) ( not ( = ?auto_547392 ?auto_547394 ) ) ( not ( = ?auto_547392 ?auto_547395 ) ) ( not ( = ?auto_547393 ?auto_547394 ) ) ( not ( = ?auto_547393 ?auto_547395 ) ) ( not ( = ?auto_547394 ?auto_547395 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_547394 ?auto_547395 )
      ( !STACK ?auto_547394 ?auto_547393 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_547424 - BLOCK
      ?auto_547425 - BLOCK
      ?auto_547426 - BLOCK
      ?auto_547427 - BLOCK
      ?auto_547428 - BLOCK
      ?auto_547429 - BLOCK
      ?auto_547430 - BLOCK
      ?auto_547431 - BLOCK
      ?auto_547432 - BLOCK
    )
    :vars
    (
      ?auto_547433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547432 ?auto_547433 ) ( ON-TABLE ?auto_547424 ) ( ON ?auto_547425 ?auto_547424 ) ( ON ?auto_547426 ?auto_547425 ) ( ON ?auto_547427 ?auto_547426 ) ( ON ?auto_547428 ?auto_547427 ) ( ON ?auto_547429 ?auto_547428 ) ( ON ?auto_547430 ?auto_547429 ) ( not ( = ?auto_547424 ?auto_547425 ) ) ( not ( = ?auto_547424 ?auto_547426 ) ) ( not ( = ?auto_547424 ?auto_547427 ) ) ( not ( = ?auto_547424 ?auto_547428 ) ) ( not ( = ?auto_547424 ?auto_547429 ) ) ( not ( = ?auto_547424 ?auto_547430 ) ) ( not ( = ?auto_547424 ?auto_547431 ) ) ( not ( = ?auto_547424 ?auto_547432 ) ) ( not ( = ?auto_547424 ?auto_547433 ) ) ( not ( = ?auto_547425 ?auto_547426 ) ) ( not ( = ?auto_547425 ?auto_547427 ) ) ( not ( = ?auto_547425 ?auto_547428 ) ) ( not ( = ?auto_547425 ?auto_547429 ) ) ( not ( = ?auto_547425 ?auto_547430 ) ) ( not ( = ?auto_547425 ?auto_547431 ) ) ( not ( = ?auto_547425 ?auto_547432 ) ) ( not ( = ?auto_547425 ?auto_547433 ) ) ( not ( = ?auto_547426 ?auto_547427 ) ) ( not ( = ?auto_547426 ?auto_547428 ) ) ( not ( = ?auto_547426 ?auto_547429 ) ) ( not ( = ?auto_547426 ?auto_547430 ) ) ( not ( = ?auto_547426 ?auto_547431 ) ) ( not ( = ?auto_547426 ?auto_547432 ) ) ( not ( = ?auto_547426 ?auto_547433 ) ) ( not ( = ?auto_547427 ?auto_547428 ) ) ( not ( = ?auto_547427 ?auto_547429 ) ) ( not ( = ?auto_547427 ?auto_547430 ) ) ( not ( = ?auto_547427 ?auto_547431 ) ) ( not ( = ?auto_547427 ?auto_547432 ) ) ( not ( = ?auto_547427 ?auto_547433 ) ) ( not ( = ?auto_547428 ?auto_547429 ) ) ( not ( = ?auto_547428 ?auto_547430 ) ) ( not ( = ?auto_547428 ?auto_547431 ) ) ( not ( = ?auto_547428 ?auto_547432 ) ) ( not ( = ?auto_547428 ?auto_547433 ) ) ( not ( = ?auto_547429 ?auto_547430 ) ) ( not ( = ?auto_547429 ?auto_547431 ) ) ( not ( = ?auto_547429 ?auto_547432 ) ) ( not ( = ?auto_547429 ?auto_547433 ) ) ( not ( = ?auto_547430 ?auto_547431 ) ) ( not ( = ?auto_547430 ?auto_547432 ) ) ( not ( = ?auto_547430 ?auto_547433 ) ) ( not ( = ?auto_547431 ?auto_547432 ) ) ( not ( = ?auto_547431 ?auto_547433 ) ) ( not ( = ?auto_547432 ?auto_547433 ) ) ( CLEAR ?auto_547430 ) ( ON ?auto_547431 ?auto_547432 ) ( CLEAR ?auto_547431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_547424 ?auto_547425 ?auto_547426 ?auto_547427 ?auto_547428 ?auto_547429 ?auto_547430 ?auto_547431 )
      ( MAKE-9PILE ?auto_547424 ?auto_547425 ?auto_547426 ?auto_547427 ?auto_547428 ?auto_547429 ?auto_547430 ?auto_547431 ?auto_547432 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_547462 - BLOCK
      ?auto_547463 - BLOCK
      ?auto_547464 - BLOCK
      ?auto_547465 - BLOCK
      ?auto_547466 - BLOCK
      ?auto_547467 - BLOCK
      ?auto_547468 - BLOCK
      ?auto_547469 - BLOCK
      ?auto_547470 - BLOCK
    )
    :vars
    (
      ?auto_547471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547470 ?auto_547471 ) ( ON-TABLE ?auto_547462 ) ( ON ?auto_547463 ?auto_547462 ) ( ON ?auto_547464 ?auto_547463 ) ( ON ?auto_547465 ?auto_547464 ) ( ON ?auto_547466 ?auto_547465 ) ( ON ?auto_547467 ?auto_547466 ) ( not ( = ?auto_547462 ?auto_547463 ) ) ( not ( = ?auto_547462 ?auto_547464 ) ) ( not ( = ?auto_547462 ?auto_547465 ) ) ( not ( = ?auto_547462 ?auto_547466 ) ) ( not ( = ?auto_547462 ?auto_547467 ) ) ( not ( = ?auto_547462 ?auto_547468 ) ) ( not ( = ?auto_547462 ?auto_547469 ) ) ( not ( = ?auto_547462 ?auto_547470 ) ) ( not ( = ?auto_547462 ?auto_547471 ) ) ( not ( = ?auto_547463 ?auto_547464 ) ) ( not ( = ?auto_547463 ?auto_547465 ) ) ( not ( = ?auto_547463 ?auto_547466 ) ) ( not ( = ?auto_547463 ?auto_547467 ) ) ( not ( = ?auto_547463 ?auto_547468 ) ) ( not ( = ?auto_547463 ?auto_547469 ) ) ( not ( = ?auto_547463 ?auto_547470 ) ) ( not ( = ?auto_547463 ?auto_547471 ) ) ( not ( = ?auto_547464 ?auto_547465 ) ) ( not ( = ?auto_547464 ?auto_547466 ) ) ( not ( = ?auto_547464 ?auto_547467 ) ) ( not ( = ?auto_547464 ?auto_547468 ) ) ( not ( = ?auto_547464 ?auto_547469 ) ) ( not ( = ?auto_547464 ?auto_547470 ) ) ( not ( = ?auto_547464 ?auto_547471 ) ) ( not ( = ?auto_547465 ?auto_547466 ) ) ( not ( = ?auto_547465 ?auto_547467 ) ) ( not ( = ?auto_547465 ?auto_547468 ) ) ( not ( = ?auto_547465 ?auto_547469 ) ) ( not ( = ?auto_547465 ?auto_547470 ) ) ( not ( = ?auto_547465 ?auto_547471 ) ) ( not ( = ?auto_547466 ?auto_547467 ) ) ( not ( = ?auto_547466 ?auto_547468 ) ) ( not ( = ?auto_547466 ?auto_547469 ) ) ( not ( = ?auto_547466 ?auto_547470 ) ) ( not ( = ?auto_547466 ?auto_547471 ) ) ( not ( = ?auto_547467 ?auto_547468 ) ) ( not ( = ?auto_547467 ?auto_547469 ) ) ( not ( = ?auto_547467 ?auto_547470 ) ) ( not ( = ?auto_547467 ?auto_547471 ) ) ( not ( = ?auto_547468 ?auto_547469 ) ) ( not ( = ?auto_547468 ?auto_547470 ) ) ( not ( = ?auto_547468 ?auto_547471 ) ) ( not ( = ?auto_547469 ?auto_547470 ) ) ( not ( = ?auto_547469 ?auto_547471 ) ) ( not ( = ?auto_547470 ?auto_547471 ) ) ( ON ?auto_547469 ?auto_547470 ) ( CLEAR ?auto_547467 ) ( ON ?auto_547468 ?auto_547469 ) ( CLEAR ?auto_547468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_547462 ?auto_547463 ?auto_547464 ?auto_547465 ?auto_547466 ?auto_547467 ?auto_547468 )
      ( MAKE-9PILE ?auto_547462 ?auto_547463 ?auto_547464 ?auto_547465 ?auto_547466 ?auto_547467 ?auto_547468 ?auto_547469 ?auto_547470 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_547500 - BLOCK
      ?auto_547501 - BLOCK
      ?auto_547502 - BLOCK
      ?auto_547503 - BLOCK
      ?auto_547504 - BLOCK
      ?auto_547505 - BLOCK
      ?auto_547506 - BLOCK
      ?auto_547507 - BLOCK
      ?auto_547508 - BLOCK
    )
    :vars
    (
      ?auto_547509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547508 ?auto_547509 ) ( ON-TABLE ?auto_547500 ) ( ON ?auto_547501 ?auto_547500 ) ( ON ?auto_547502 ?auto_547501 ) ( ON ?auto_547503 ?auto_547502 ) ( ON ?auto_547504 ?auto_547503 ) ( not ( = ?auto_547500 ?auto_547501 ) ) ( not ( = ?auto_547500 ?auto_547502 ) ) ( not ( = ?auto_547500 ?auto_547503 ) ) ( not ( = ?auto_547500 ?auto_547504 ) ) ( not ( = ?auto_547500 ?auto_547505 ) ) ( not ( = ?auto_547500 ?auto_547506 ) ) ( not ( = ?auto_547500 ?auto_547507 ) ) ( not ( = ?auto_547500 ?auto_547508 ) ) ( not ( = ?auto_547500 ?auto_547509 ) ) ( not ( = ?auto_547501 ?auto_547502 ) ) ( not ( = ?auto_547501 ?auto_547503 ) ) ( not ( = ?auto_547501 ?auto_547504 ) ) ( not ( = ?auto_547501 ?auto_547505 ) ) ( not ( = ?auto_547501 ?auto_547506 ) ) ( not ( = ?auto_547501 ?auto_547507 ) ) ( not ( = ?auto_547501 ?auto_547508 ) ) ( not ( = ?auto_547501 ?auto_547509 ) ) ( not ( = ?auto_547502 ?auto_547503 ) ) ( not ( = ?auto_547502 ?auto_547504 ) ) ( not ( = ?auto_547502 ?auto_547505 ) ) ( not ( = ?auto_547502 ?auto_547506 ) ) ( not ( = ?auto_547502 ?auto_547507 ) ) ( not ( = ?auto_547502 ?auto_547508 ) ) ( not ( = ?auto_547502 ?auto_547509 ) ) ( not ( = ?auto_547503 ?auto_547504 ) ) ( not ( = ?auto_547503 ?auto_547505 ) ) ( not ( = ?auto_547503 ?auto_547506 ) ) ( not ( = ?auto_547503 ?auto_547507 ) ) ( not ( = ?auto_547503 ?auto_547508 ) ) ( not ( = ?auto_547503 ?auto_547509 ) ) ( not ( = ?auto_547504 ?auto_547505 ) ) ( not ( = ?auto_547504 ?auto_547506 ) ) ( not ( = ?auto_547504 ?auto_547507 ) ) ( not ( = ?auto_547504 ?auto_547508 ) ) ( not ( = ?auto_547504 ?auto_547509 ) ) ( not ( = ?auto_547505 ?auto_547506 ) ) ( not ( = ?auto_547505 ?auto_547507 ) ) ( not ( = ?auto_547505 ?auto_547508 ) ) ( not ( = ?auto_547505 ?auto_547509 ) ) ( not ( = ?auto_547506 ?auto_547507 ) ) ( not ( = ?auto_547506 ?auto_547508 ) ) ( not ( = ?auto_547506 ?auto_547509 ) ) ( not ( = ?auto_547507 ?auto_547508 ) ) ( not ( = ?auto_547507 ?auto_547509 ) ) ( not ( = ?auto_547508 ?auto_547509 ) ) ( ON ?auto_547507 ?auto_547508 ) ( ON ?auto_547506 ?auto_547507 ) ( CLEAR ?auto_547504 ) ( ON ?auto_547505 ?auto_547506 ) ( CLEAR ?auto_547505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_547500 ?auto_547501 ?auto_547502 ?auto_547503 ?auto_547504 ?auto_547505 )
      ( MAKE-9PILE ?auto_547500 ?auto_547501 ?auto_547502 ?auto_547503 ?auto_547504 ?auto_547505 ?auto_547506 ?auto_547507 ?auto_547508 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_547538 - BLOCK
      ?auto_547539 - BLOCK
      ?auto_547540 - BLOCK
      ?auto_547541 - BLOCK
      ?auto_547542 - BLOCK
      ?auto_547543 - BLOCK
      ?auto_547544 - BLOCK
      ?auto_547545 - BLOCK
      ?auto_547546 - BLOCK
    )
    :vars
    (
      ?auto_547547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547546 ?auto_547547 ) ( ON-TABLE ?auto_547538 ) ( ON ?auto_547539 ?auto_547538 ) ( ON ?auto_547540 ?auto_547539 ) ( ON ?auto_547541 ?auto_547540 ) ( not ( = ?auto_547538 ?auto_547539 ) ) ( not ( = ?auto_547538 ?auto_547540 ) ) ( not ( = ?auto_547538 ?auto_547541 ) ) ( not ( = ?auto_547538 ?auto_547542 ) ) ( not ( = ?auto_547538 ?auto_547543 ) ) ( not ( = ?auto_547538 ?auto_547544 ) ) ( not ( = ?auto_547538 ?auto_547545 ) ) ( not ( = ?auto_547538 ?auto_547546 ) ) ( not ( = ?auto_547538 ?auto_547547 ) ) ( not ( = ?auto_547539 ?auto_547540 ) ) ( not ( = ?auto_547539 ?auto_547541 ) ) ( not ( = ?auto_547539 ?auto_547542 ) ) ( not ( = ?auto_547539 ?auto_547543 ) ) ( not ( = ?auto_547539 ?auto_547544 ) ) ( not ( = ?auto_547539 ?auto_547545 ) ) ( not ( = ?auto_547539 ?auto_547546 ) ) ( not ( = ?auto_547539 ?auto_547547 ) ) ( not ( = ?auto_547540 ?auto_547541 ) ) ( not ( = ?auto_547540 ?auto_547542 ) ) ( not ( = ?auto_547540 ?auto_547543 ) ) ( not ( = ?auto_547540 ?auto_547544 ) ) ( not ( = ?auto_547540 ?auto_547545 ) ) ( not ( = ?auto_547540 ?auto_547546 ) ) ( not ( = ?auto_547540 ?auto_547547 ) ) ( not ( = ?auto_547541 ?auto_547542 ) ) ( not ( = ?auto_547541 ?auto_547543 ) ) ( not ( = ?auto_547541 ?auto_547544 ) ) ( not ( = ?auto_547541 ?auto_547545 ) ) ( not ( = ?auto_547541 ?auto_547546 ) ) ( not ( = ?auto_547541 ?auto_547547 ) ) ( not ( = ?auto_547542 ?auto_547543 ) ) ( not ( = ?auto_547542 ?auto_547544 ) ) ( not ( = ?auto_547542 ?auto_547545 ) ) ( not ( = ?auto_547542 ?auto_547546 ) ) ( not ( = ?auto_547542 ?auto_547547 ) ) ( not ( = ?auto_547543 ?auto_547544 ) ) ( not ( = ?auto_547543 ?auto_547545 ) ) ( not ( = ?auto_547543 ?auto_547546 ) ) ( not ( = ?auto_547543 ?auto_547547 ) ) ( not ( = ?auto_547544 ?auto_547545 ) ) ( not ( = ?auto_547544 ?auto_547546 ) ) ( not ( = ?auto_547544 ?auto_547547 ) ) ( not ( = ?auto_547545 ?auto_547546 ) ) ( not ( = ?auto_547545 ?auto_547547 ) ) ( not ( = ?auto_547546 ?auto_547547 ) ) ( ON ?auto_547545 ?auto_547546 ) ( ON ?auto_547544 ?auto_547545 ) ( ON ?auto_547543 ?auto_547544 ) ( CLEAR ?auto_547541 ) ( ON ?auto_547542 ?auto_547543 ) ( CLEAR ?auto_547542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_547538 ?auto_547539 ?auto_547540 ?auto_547541 ?auto_547542 )
      ( MAKE-9PILE ?auto_547538 ?auto_547539 ?auto_547540 ?auto_547541 ?auto_547542 ?auto_547543 ?auto_547544 ?auto_547545 ?auto_547546 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_547576 - BLOCK
      ?auto_547577 - BLOCK
      ?auto_547578 - BLOCK
      ?auto_547579 - BLOCK
      ?auto_547580 - BLOCK
      ?auto_547581 - BLOCK
      ?auto_547582 - BLOCK
      ?auto_547583 - BLOCK
      ?auto_547584 - BLOCK
    )
    :vars
    (
      ?auto_547585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547584 ?auto_547585 ) ( ON-TABLE ?auto_547576 ) ( ON ?auto_547577 ?auto_547576 ) ( ON ?auto_547578 ?auto_547577 ) ( not ( = ?auto_547576 ?auto_547577 ) ) ( not ( = ?auto_547576 ?auto_547578 ) ) ( not ( = ?auto_547576 ?auto_547579 ) ) ( not ( = ?auto_547576 ?auto_547580 ) ) ( not ( = ?auto_547576 ?auto_547581 ) ) ( not ( = ?auto_547576 ?auto_547582 ) ) ( not ( = ?auto_547576 ?auto_547583 ) ) ( not ( = ?auto_547576 ?auto_547584 ) ) ( not ( = ?auto_547576 ?auto_547585 ) ) ( not ( = ?auto_547577 ?auto_547578 ) ) ( not ( = ?auto_547577 ?auto_547579 ) ) ( not ( = ?auto_547577 ?auto_547580 ) ) ( not ( = ?auto_547577 ?auto_547581 ) ) ( not ( = ?auto_547577 ?auto_547582 ) ) ( not ( = ?auto_547577 ?auto_547583 ) ) ( not ( = ?auto_547577 ?auto_547584 ) ) ( not ( = ?auto_547577 ?auto_547585 ) ) ( not ( = ?auto_547578 ?auto_547579 ) ) ( not ( = ?auto_547578 ?auto_547580 ) ) ( not ( = ?auto_547578 ?auto_547581 ) ) ( not ( = ?auto_547578 ?auto_547582 ) ) ( not ( = ?auto_547578 ?auto_547583 ) ) ( not ( = ?auto_547578 ?auto_547584 ) ) ( not ( = ?auto_547578 ?auto_547585 ) ) ( not ( = ?auto_547579 ?auto_547580 ) ) ( not ( = ?auto_547579 ?auto_547581 ) ) ( not ( = ?auto_547579 ?auto_547582 ) ) ( not ( = ?auto_547579 ?auto_547583 ) ) ( not ( = ?auto_547579 ?auto_547584 ) ) ( not ( = ?auto_547579 ?auto_547585 ) ) ( not ( = ?auto_547580 ?auto_547581 ) ) ( not ( = ?auto_547580 ?auto_547582 ) ) ( not ( = ?auto_547580 ?auto_547583 ) ) ( not ( = ?auto_547580 ?auto_547584 ) ) ( not ( = ?auto_547580 ?auto_547585 ) ) ( not ( = ?auto_547581 ?auto_547582 ) ) ( not ( = ?auto_547581 ?auto_547583 ) ) ( not ( = ?auto_547581 ?auto_547584 ) ) ( not ( = ?auto_547581 ?auto_547585 ) ) ( not ( = ?auto_547582 ?auto_547583 ) ) ( not ( = ?auto_547582 ?auto_547584 ) ) ( not ( = ?auto_547582 ?auto_547585 ) ) ( not ( = ?auto_547583 ?auto_547584 ) ) ( not ( = ?auto_547583 ?auto_547585 ) ) ( not ( = ?auto_547584 ?auto_547585 ) ) ( ON ?auto_547583 ?auto_547584 ) ( ON ?auto_547582 ?auto_547583 ) ( ON ?auto_547581 ?auto_547582 ) ( ON ?auto_547580 ?auto_547581 ) ( CLEAR ?auto_547578 ) ( ON ?auto_547579 ?auto_547580 ) ( CLEAR ?auto_547579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_547576 ?auto_547577 ?auto_547578 ?auto_547579 )
      ( MAKE-9PILE ?auto_547576 ?auto_547577 ?auto_547578 ?auto_547579 ?auto_547580 ?auto_547581 ?auto_547582 ?auto_547583 ?auto_547584 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_547614 - BLOCK
      ?auto_547615 - BLOCK
      ?auto_547616 - BLOCK
      ?auto_547617 - BLOCK
      ?auto_547618 - BLOCK
      ?auto_547619 - BLOCK
      ?auto_547620 - BLOCK
      ?auto_547621 - BLOCK
      ?auto_547622 - BLOCK
    )
    :vars
    (
      ?auto_547623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547622 ?auto_547623 ) ( ON-TABLE ?auto_547614 ) ( ON ?auto_547615 ?auto_547614 ) ( not ( = ?auto_547614 ?auto_547615 ) ) ( not ( = ?auto_547614 ?auto_547616 ) ) ( not ( = ?auto_547614 ?auto_547617 ) ) ( not ( = ?auto_547614 ?auto_547618 ) ) ( not ( = ?auto_547614 ?auto_547619 ) ) ( not ( = ?auto_547614 ?auto_547620 ) ) ( not ( = ?auto_547614 ?auto_547621 ) ) ( not ( = ?auto_547614 ?auto_547622 ) ) ( not ( = ?auto_547614 ?auto_547623 ) ) ( not ( = ?auto_547615 ?auto_547616 ) ) ( not ( = ?auto_547615 ?auto_547617 ) ) ( not ( = ?auto_547615 ?auto_547618 ) ) ( not ( = ?auto_547615 ?auto_547619 ) ) ( not ( = ?auto_547615 ?auto_547620 ) ) ( not ( = ?auto_547615 ?auto_547621 ) ) ( not ( = ?auto_547615 ?auto_547622 ) ) ( not ( = ?auto_547615 ?auto_547623 ) ) ( not ( = ?auto_547616 ?auto_547617 ) ) ( not ( = ?auto_547616 ?auto_547618 ) ) ( not ( = ?auto_547616 ?auto_547619 ) ) ( not ( = ?auto_547616 ?auto_547620 ) ) ( not ( = ?auto_547616 ?auto_547621 ) ) ( not ( = ?auto_547616 ?auto_547622 ) ) ( not ( = ?auto_547616 ?auto_547623 ) ) ( not ( = ?auto_547617 ?auto_547618 ) ) ( not ( = ?auto_547617 ?auto_547619 ) ) ( not ( = ?auto_547617 ?auto_547620 ) ) ( not ( = ?auto_547617 ?auto_547621 ) ) ( not ( = ?auto_547617 ?auto_547622 ) ) ( not ( = ?auto_547617 ?auto_547623 ) ) ( not ( = ?auto_547618 ?auto_547619 ) ) ( not ( = ?auto_547618 ?auto_547620 ) ) ( not ( = ?auto_547618 ?auto_547621 ) ) ( not ( = ?auto_547618 ?auto_547622 ) ) ( not ( = ?auto_547618 ?auto_547623 ) ) ( not ( = ?auto_547619 ?auto_547620 ) ) ( not ( = ?auto_547619 ?auto_547621 ) ) ( not ( = ?auto_547619 ?auto_547622 ) ) ( not ( = ?auto_547619 ?auto_547623 ) ) ( not ( = ?auto_547620 ?auto_547621 ) ) ( not ( = ?auto_547620 ?auto_547622 ) ) ( not ( = ?auto_547620 ?auto_547623 ) ) ( not ( = ?auto_547621 ?auto_547622 ) ) ( not ( = ?auto_547621 ?auto_547623 ) ) ( not ( = ?auto_547622 ?auto_547623 ) ) ( ON ?auto_547621 ?auto_547622 ) ( ON ?auto_547620 ?auto_547621 ) ( ON ?auto_547619 ?auto_547620 ) ( ON ?auto_547618 ?auto_547619 ) ( ON ?auto_547617 ?auto_547618 ) ( CLEAR ?auto_547615 ) ( ON ?auto_547616 ?auto_547617 ) ( CLEAR ?auto_547616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_547614 ?auto_547615 ?auto_547616 )
      ( MAKE-9PILE ?auto_547614 ?auto_547615 ?auto_547616 ?auto_547617 ?auto_547618 ?auto_547619 ?auto_547620 ?auto_547621 ?auto_547622 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_547652 - BLOCK
      ?auto_547653 - BLOCK
      ?auto_547654 - BLOCK
      ?auto_547655 - BLOCK
      ?auto_547656 - BLOCK
      ?auto_547657 - BLOCK
      ?auto_547658 - BLOCK
      ?auto_547659 - BLOCK
      ?auto_547660 - BLOCK
    )
    :vars
    (
      ?auto_547661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547660 ?auto_547661 ) ( ON-TABLE ?auto_547652 ) ( not ( = ?auto_547652 ?auto_547653 ) ) ( not ( = ?auto_547652 ?auto_547654 ) ) ( not ( = ?auto_547652 ?auto_547655 ) ) ( not ( = ?auto_547652 ?auto_547656 ) ) ( not ( = ?auto_547652 ?auto_547657 ) ) ( not ( = ?auto_547652 ?auto_547658 ) ) ( not ( = ?auto_547652 ?auto_547659 ) ) ( not ( = ?auto_547652 ?auto_547660 ) ) ( not ( = ?auto_547652 ?auto_547661 ) ) ( not ( = ?auto_547653 ?auto_547654 ) ) ( not ( = ?auto_547653 ?auto_547655 ) ) ( not ( = ?auto_547653 ?auto_547656 ) ) ( not ( = ?auto_547653 ?auto_547657 ) ) ( not ( = ?auto_547653 ?auto_547658 ) ) ( not ( = ?auto_547653 ?auto_547659 ) ) ( not ( = ?auto_547653 ?auto_547660 ) ) ( not ( = ?auto_547653 ?auto_547661 ) ) ( not ( = ?auto_547654 ?auto_547655 ) ) ( not ( = ?auto_547654 ?auto_547656 ) ) ( not ( = ?auto_547654 ?auto_547657 ) ) ( not ( = ?auto_547654 ?auto_547658 ) ) ( not ( = ?auto_547654 ?auto_547659 ) ) ( not ( = ?auto_547654 ?auto_547660 ) ) ( not ( = ?auto_547654 ?auto_547661 ) ) ( not ( = ?auto_547655 ?auto_547656 ) ) ( not ( = ?auto_547655 ?auto_547657 ) ) ( not ( = ?auto_547655 ?auto_547658 ) ) ( not ( = ?auto_547655 ?auto_547659 ) ) ( not ( = ?auto_547655 ?auto_547660 ) ) ( not ( = ?auto_547655 ?auto_547661 ) ) ( not ( = ?auto_547656 ?auto_547657 ) ) ( not ( = ?auto_547656 ?auto_547658 ) ) ( not ( = ?auto_547656 ?auto_547659 ) ) ( not ( = ?auto_547656 ?auto_547660 ) ) ( not ( = ?auto_547656 ?auto_547661 ) ) ( not ( = ?auto_547657 ?auto_547658 ) ) ( not ( = ?auto_547657 ?auto_547659 ) ) ( not ( = ?auto_547657 ?auto_547660 ) ) ( not ( = ?auto_547657 ?auto_547661 ) ) ( not ( = ?auto_547658 ?auto_547659 ) ) ( not ( = ?auto_547658 ?auto_547660 ) ) ( not ( = ?auto_547658 ?auto_547661 ) ) ( not ( = ?auto_547659 ?auto_547660 ) ) ( not ( = ?auto_547659 ?auto_547661 ) ) ( not ( = ?auto_547660 ?auto_547661 ) ) ( ON ?auto_547659 ?auto_547660 ) ( ON ?auto_547658 ?auto_547659 ) ( ON ?auto_547657 ?auto_547658 ) ( ON ?auto_547656 ?auto_547657 ) ( ON ?auto_547655 ?auto_547656 ) ( ON ?auto_547654 ?auto_547655 ) ( CLEAR ?auto_547652 ) ( ON ?auto_547653 ?auto_547654 ) ( CLEAR ?auto_547653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_547652 ?auto_547653 )
      ( MAKE-9PILE ?auto_547652 ?auto_547653 ?auto_547654 ?auto_547655 ?auto_547656 ?auto_547657 ?auto_547658 ?auto_547659 ?auto_547660 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_547690 - BLOCK
      ?auto_547691 - BLOCK
      ?auto_547692 - BLOCK
      ?auto_547693 - BLOCK
      ?auto_547694 - BLOCK
      ?auto_547695 - BLOCK
      ?auto_547696 - BLOCK
      ?auto_547697 - BLOCK
      ?auto_547698 - BLOCK
    )
    :vars
    (
      ?auto_547699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547698 ?auto_547699 ) ( not ( = ?auto_547690 ?auto_547691 ) ) ( not ( = ?auto_547690 ?auto_547692 ) ) ( not ( = ?auto_547690 ?auto_547693 ) ) ( not ( = ?auto_547690 ?auto_547694 ) ) ( not ( = ?auto_547690 ?auto_547695 ) ) ( not ( = ?auto_547690 ?auto_547696 ) ) ( not ( = ?auto_547690 ?auto_547697 ) ) ( not ( = ?auto_547690 ?auto_547698 ) ) ( not ( = ?auto_547690 ?auto_547699 ) ) ( not ( = ?auto_547691 ?auto_547692 ) ) ( not ( = ?auto_547691 ?auto_547693 ) ) ( not ( = ?auto_547691 ?auto_547694 ) ) ( not ( = ?auto_547691 ?auto_547695 ) ) ( not ( = ?auto_547691 ?auto_547696 ) ) ( not ( = ?auto_547691 ?auto_547697 ) ) ( not ( = ?auto_547691 ?auto_547698 ) ) ( not ( = ?auto_547691 ?auto_547699 ) ) ( not ( = ?auto_547692 ?auto_547693 ) ) ( not ( = ?auto_547692 ?auto_547694 ) ) ( not ( = ?auto_547692 ?auto_547695 ) ) ( not ( = ?auto_547692 ?auto_547696 ) ) ( not ( = ?auto_547692 ?auto_547697 ) ) ( not ( = ?auto_547692 ?auto_547698 ) ) ( not ( = ?auto_547692 ?auto_547699 ) ) ( not ( = ?auto_547693 ?auto_547694 ) ) ( not ( = ?auto_547693 ?auto_547695 ) ) ( not ( = ?auto_547693 ?auto_547696 ) ) ( not ( = ?auto_547693 ?auto_547697 ) ) ( not ( = ?auto_547693 ?auto_547698 ) ) ( not ( = ?auto_547693 ?auto_547699 ) ) ( not ( = ?auto_547694 ?auto_547695 ) ) ( not ( = ?auto_547694 ?auto_547696 ) ) ( not ( = ?auto_547694 ?auto_547697 ) ) ( not ( = ?auto_547694 ?auto_547698 ) ) ( not ( = ?auto_547694 ?auto_547699 ) ) ( not ( = ?auto_547695 ?auto_547696 ) ) ( not ( = ?auto_547695 ?auto_547697 ) ) ( not ( = ?auto_547695 ?auto_547698 ) ) ( not ( = ?auto_547695 ?auto_547699 ) ) ( not ( = ?auto_547696 ?auto_547697 ) ) ( not ( = ?auto_547696 ?auto_547698 ) ) ( not ( = ?auto_547696 ?auto_547699 ) ) ( not ( = ?auto_547697 ?auto_547698 ) ) ( not ( = ?auto_547697 ?auto_547699 ) ) ( not ( = ?auto_547698 ?auto_547699 ) ) ( ON ?auto_547697 ?auto_547698 ) ( ON ?auto_547696 ?auto_547697 ) ( ON ?auto_547695 ?auto_547696 ) ( ON ?auto_547694 ?auto_547695 ) ( ON ?auto_547693 ?auto_547694 ) ( ON ?auto_547692 ?auto_547693 ) ( ON ?auto_547691 ?auto_547692 ) ( ON ?auto_547690 ?auto_547691 ) ( CLEAR ?auto_547690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_547690 )
      ( MAKE-9PILE ?auto_547690 ?auto_547691 ?auto_547692 ?auto_547693 ?auto_547694 ?auto_547695 ?auto_547696 ?auto_547697 ?auto_547698 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_547729 - BLOCK
      ?auto_547730 - BLOCK
      ?auto_547731 - BLOCK
      ?auto_547732 - BLOCK
      ?auto_547733 - BLOCK
      ?auto_547734 - BLOCK
      ?auto_547735 - BLOCK
      ?auto_547736 - BLOCK
      ?auto_547737 - BLOCK
      ?auto_547738 - BLOCK
    )
    :vars
    (
      ?auto_547739 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_547737 ) ( ON ?auto_547738 ?auto_547739 ) ( CLEAR ?auto_547738 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_547729 ) ( ON ?auto_547730 ?auto_547729 ) ( ON ?auto_547731 ?auto_547730 ) ( ON ?auto_547732 ?auto_547731 ) ( ON ?auto_547733 ?auto_547732 ) ( ON ?auto_547734 ?auto_547733 ) ( ON ?auto_547735 ?auto_547734 ) ( ON ?auto_547736 ?auto_547735 ) ( ON ?auto_547737 ?auto_547736 ) ( not ( = ?auto_547729 ?auto_547730 ) ) ( not ( = ?auto_547729 ?auto_547731 ) ) ( not ( = ?auto_547729 ?auto_547732 ) ) ( not ( = ?auto_547729 ?auto_547733 ) ) ( not ( = ?auto_547729 ?auto_547734 ) ) ( not ( = ?auto_547729 ?auto_547735 ) ) ( not ( = ?auto_547729 ?auto_547736 ) ) ( not ( = ?auto_547729 ?auto_547737 ) ) ( not ( = ?auto_547729 ?auto_547738 ) ) ( not ( = ?auto_547729 ?auto_547739 ) ) ( not ( = ?auto_547730 ?auto_547731 ) ) ( not ( = ?auto_547730 ?auto_547732 ) ) ( not ( = ?auto_547730 ?auto_547733 ) ) ( not ( = ?auto_547730 ?auto_547734 ) ) ( not ( = ?auto_547730 ?auto_547735 ) ) ( not ( = ?auto_547730 ?auto_547736 ) ) ( not ( = ?auto_547730 ?auto_547737 ) ) ( not ( = ?auto_547730 ?auto_547738 ) ) ( not ( = ?auto_547730 ?auto_547739 ) ) ( not ( = ?auto_547731 ?auto_547732 ) ) ( not ( = ?auto_547731 ?auto_547733 ) ) ( not ( = ?auto_547731 ?auto_547734 ) ) ( not ( = ?auto_547731 ?auto_547735 ) ) ( not ( = ?auto_547731 ?auto_547736 ) ) ( not ( = ?auto_547731 ?auto_547737 ) ) ( not ( = ?auto_547731 ?auto_547738 ) ) ( not ( = ?auto_547731 ?auto_547739 ) ) ( not ( = ?auto_547732 ?auto_547733 ) ) ( not ( = ?auto_547732 ?auto_547734 ) ) ( not ( = ?auto_547732 ?auto_547735 ) ) ( not ( = ?auto_547732 ?auto_547736 ) ) ( not ( = ?auto_547732 ?auto_547737 ) ) ( not ( = ?auto_547732 ?auto_547738 ) ) ( not ( = ?auto_547732 ?auto_547739 ) ) ( not ( = ?auto_547733 ?auto_547734 ) ) ( not ( = ?auto_547733 ?auto_547735 ) ) ( not ( = ?auto_547733 ?auto_547736 ) ) ( not ( = ?auto_547733 ?auto_547737 ) ) ( not ( = ?auto_547733 ?auto_547738 ) ) ( not ( = ?auto_547733 ?auto_547739 ) ) ( not ( = ?auto_547734 ?auto_547735 ) ) ( not ( = ?auto_547734 ?auto_547736 ) ) ( not ( = ?auto_547734 ?auto_547737 ) ) ( not ( = ?auto_547734 ?auto_547738 ) ) ( not ( = ?auto_547734 ?auto_547739 ) ) ( not ( = ?auto_547735 ?auto_547736 ) ) ( not ( = ?auto_547735 ?auto_547737 ) ) ( not ( = ?auto_547735 ?auto_547738 ) ) ( not ( = ?auto_547735 ?auto_547739 ) ) ( not ( = ?auto_547736 ?auto_547737 ) ) ( not ( = ?auto_547736 ?auto_547738 ) ) ( not ( = ?auto_547736 ?auto_547739 ) ) ( not ( = ?auto_547737 ?auto_547738 ) ) ( not ( = ?auto_547737 ?auto_547739 ) ) ( not ( = ?auto_547738 ?auto_547739 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_547738 ?auto_547739 )
      ( !STACK ?auto_547738 ?auto_547737 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_547771 - BLOCK
      ?auto_547772 - BLOCK
      ?auto_547773 - BLOCK
      ?auto_547774 - BLOCK
      ?auto_547775 - BLOCK
      ?auto_547776 - BLOCK
      ?auto_547777 - BLOCK
      ?auto_547778 - BLOCK
      ?auto_547779 - BLOCK
      ?auto_547780 - BLOCK
    )
    :vars
    (
      ?auto_547781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547780 ?auto_547781 ) ( ON-TABLE ?auto_547771 ) ( ON ?auto_547772 ?auto_547771 ) ( ON ?auto_547773 ?auto_547772 ) ( ON ?auto_547774 ?auto_547773 ) ( ON ?auto_547775 ?auto_547774 ) ( ON ?auto_547776 ?auto_547775 ) ( ON ?auto_547777 ?auto_547776 ) ( ON ?auto_547778 ?auto_547777 ) ( not ( = ?auto_547771 ?auto_547772 ) ) ( not ( = ?auto_547771 ?auto_547773 ) ) ( not ( = ?auto_547771 ?auto_547774 ) ) ( not ( = ?auto_547771 ?auto_547775 ) ) ( not ( = ?auto_547771 ?auto_547776 ) ) ( not ( = ?auto_547771 ?auto_547777 ) ) ( not ( = ?auto_547771 ?auto_547778 ) ) ( not ( = ?auto_547771 ?auto_547779 ) ) ( not ( = ?auto_547771 ?auto_547780 ) ) ( not ( = ?auto_547771 ?auto_547781 ) ) ( not ( = ?auto_547772 ?auto_547773 ) ) ( not ( = ?auto_547772 ?auto_547774 ) ) ( not ( = ?auto_547772 ?auto_547775 ) ) ( not ( = ?auto_547772 ?auto_547776 ) ) ( not ( = ?auto_547772 ?auto_547777 ) ) ( not ( = ?auto_547772 ?auto_547778 ) ) ( not ( = ?auto_547772 ?auto_547779 ) ) ( not ( = ?auto_547772 ?auto_547780 ) ) ( not ( = ?auto_547772 ?auto_547781 ) ) ( not ( = ?auto_547773 ?auto_547774 ) ) ( not ( = ?auto_547773 ?auto_547775 ) ) ( not ( = ?auto_547773 ?auto_547776 ) ) ( not ( = ?auto_547773 ?auto_547777 ) ) ( not ( = ?auto_547773 ?auto_547778 ) ) ( not ( = ?auto_547773 ?auto_547779 ) ) ( not ( = ?auto_547773 ?auto_547780 ) ) ( not ( = ?auto_547773 ?auto_547781 ) ) ( not ( = ?auto_547774 ?auto_547775 ) ) ( not ( = ?auto_547774 ?auto_547776 ) ) ( not ( = ?auto_547774 ?auto_547777 ) ) ( not ( = ?auto_547774 ?auto_547778 ) ) ( not ( = ?auto_547774 ?auto_547779 ) ) ( not ( = ?auto_547774 ?auto_547780 ) ) ( not ( = ?auto_547774 ?auto_547781 ) ) ( not ( = ?auto_547775 ?auto_547776 ) ) ( not ( = ?auto_547775 ?auto_547777 ) ) ( not ( = ?auto_547775 ?auto_547778 ) ) ( not ( = ?auto_547775 ?auto_547779 ) ) ( not ( = ?auto_547775 ?auto_547780 ) ) ( not ( = ?auto_547775 ?auto_547781 ) ) ( not ( = ?auto_547776 ?auto_547777 ) ) ( not ( = ?auto_547776 ?auto_547778 ) ) ( not ( = ?auto_547776 ?auto_547779 ) ) ( not ( = ?auto_547776 ?auto_547780 ) ) ( not ( = ?auto_547776 ?auto_547781 ) ) ( not ( = ?auto_547777 ?auto_547778 ) ) ( not ( = ?auto_547777 ?auto_547779 ) ) ( not ( = ?auto_547777 ?auto_547780 ) ) ( not ( = ?auto_547777 ?auto_547781 ) ) ( not ( = ?auto_547778 ?auto_547779 ) ) ( not ( = ?auto_547778 ?auto_547780 ) ) ( not ( = ?auto_547778 ?auto_547781 ) ) ( not ( = ?auto_547779 ?auto_547780 ) ) ( not ( = ?auto_547779 ?auto_547781 ) ) ( not ( = ?auto_547780 ?auto_547781 ) ) ( CLEAR ?auto_547778 ) ( ON ?auto_547779 ?auto_547780 ) ( CLEAR ?auto_547779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_547771 ?auto_547772 ?auto_547773 ?auto_547774 ?auto_547775 ?auto_547776 ?auto_547777 ?auto_547778 ?auto_547779 )
      ( MAKE-10PILE ?auto_547771 ?auto_547772 ?auto_547773 ?auto_547774 ?auto_547775 ?auto_547776 ?auto_547777 ?auto_547778 ?auto_547779 ?auto_547780 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_547813 - BLOCK
      ?auto_547814 - BLOCK
      ?auto_547815 - BLOCK
      ?auto_547816 - BLOCK
      ?auto_547817 - BLOCK
      ?auto_547818 - BLOCK
      ?auto_547819 - BLOCK
      ?auto_547820 - BLOCK
      ?auto_547821 - BLOCK
      ?auto_547822 - BLOCK
    )
    :vars
    (
      ?auto_547823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547822 ?auto_547823 ) ( ON-TABLE ?auto_547813 ) ( ON ?auto_547814 ?auto_547813 ) ( ON ?auto_547815 ?auto_547814 ) ( ON ?auto_547816 ?auto_547815 ) ( ON ?auto_547817 ?auto_547816 ) ( ON ?auto_547818 ?auto_547817 ) ( ON ?auto_547819 ?auto_547818 ) ( not ( = ?auto_547813 ?auto_547814 ) ) ( not ( = ?auto_547813 ?auto_547815 ) ) ( not ( = ?auto_547813 ?auto_547816 ) ) ( not ( = ?auto_547813 ?auto_547817 ) ) ( not ( = ?auto_547813 ?auto_547818 ) ) ( not ( = ?auto_547813 ?auto_547819 ) ) ( not ( = ?auto_547813 ?auto_547820 ) ) ( not ( = ?auto_547813 ?auto_547821 ) ) ( not ( = ?auto_547813 ?auto_547822 ) ) ( not ( = ?auto_547813 ?auto_547823 ) ) ( not ( = ?auto_547814 ?auto_547815 ) ) ( not ( = ?auto_547814 ?auto_547816 ) ) ( not ( = ?auto_547814 ?auto_547817 ) ) ( not ( = ?auto_547814 ?auto_547818 ) ) ( not ( = ?auto_547814 ?auto_547819 ) ) ( not ( = ?auto_547814 ?auto_547820 ) ) ( not ( = ?auto_547814 ?auto_547821 ) ) ( not ( = ?auto_547814 ?auto_547822 ) ) ( not ( = ?auto_547814 ?auto_547823 ) ) ( not ( = ?auto_547815 ?auto_547816 ) ) ( not ( = ?auto_547815 ?auto_547817 ) ) ( not ( = ?auto_547815 ?auto_547818 ) ) ( not ( = ?auto_547815 ?auto_547819 ) ) ( not ( = ?auto_547815 ?auto_547820 ) ) ( not ( = ?auto_547815 ?auto_547821 ) ) ( not ( = ?auto_547815 ?auto_547822 ) ) ( not ( = ?auto_547815 ?auto_547823 ) ) ( not ( = ?auto_547816 ?auto_547817 ) ) ( not ( = ?auto_547816 ?auto_547818 ) ) ( not ( = ?auto_547816 ?auto_547819 ) ) ( not ( = ?auto_547816 ?auto_547820 ) ) ( not ( = ?auto_547816 ?auto_547821 ) ) ( not ( = ?auto_547816 ?auto_547822 ) ) ( not ( = ?auto_547816 ?auto_547823 ) ) ( not ( = ?auto_547817 ?auto_547818 ) ) ( not ( = ?auto_547817 ?auto_547819 ) ) ( not ( = ?auto_547817 ?auto_547820 ) ) ( not ( = ?auto_547817 ?auto_547821 ) ) ( not ( = ?auto_547817 ?auto_547822 ) ) ( not ( = ?auto_547817 ?auto_547823 ) ) ( not ( = ?auto_547818 ?auto_547819 ) ) ( not ( = ?auto_547818 ?auto_547820 ) ) ( not ( = ?auto_547818 ?auto_547821 ) ) ( not ( = ?auto_547818 ?auto_547822 ) ) ( not ( = ?auto_547818 ?auto_547823 ) ) ( not ( = ?auto_547819 ?auto_547820 ) ) ( not ( = ?auto_547819 ?auto_547821 ) ) ( not ( = ?auto_547819 ?auto_547822 ) ) ( not ( = ?auto_547819 ?auto_547823 ) ) ( not ( = ?auto_547820 ?auto_547821 ) ) ( not ( = ?auto_547820 ?auto_547822 ) ) ( not ( = ?auto_547820 ?auto_547823 ) ) ( not ( = ?auto_547821 ?auto_547822 ) ) ( not ( = ?auto_547821 ?auto_547823 ) ) ( not ( = ?auto_547822 ?auto_547823 ) ) ( ON ?auto_547821 ?auto_547822 ) ( CLEAR ?auto_547819 ) ( ON ?auto_547820 ?auto_547821 ) ( CLEAR ?auto_547820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_547813 ?auto_547814 ?auto_547815 ?auto_547816 ?auto_547817 ?auto_547818 ?auto_547819 ?auto_547820 )
      ( MAKE-10PILE ?auto_547813 ?auto_547814 ?auto_547815 ?auto_547816 ?auto_547817 ?auto_547818 ?auto_547819 ?auto_547820 ?auto_547821 ?auto_547822 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_547855 - BLOCK
      ?auto_547856 - BLOCK
      ?auto_547857 - BLOCK
      ?auto_547858 - BLOCK
      ?auto_547859 - BLOCK
      ?auto_547860 - BLOCK
      ?auto_547861 - BLOCK
      ?auto_547862 - BLOCK
      ?auto_547863 - BLOCK
      ?auto_547864 - BLOCK
    )
    :vars
    (
      ?auto_547865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547864 ?auto_547865 ) ( ON-TABLE ?auto_547855 ) ( ON ?auto_547856 ?auto_547855 ) ( ON ?auto_547857 ?auto_547856 ) ( ON ?auto_547858 ?auto_547857 ) ( ON ?auto_547859 ?auto_547858 ) ( ON ?auto_547860 ?auto_547859 ) ( not ( = ?auto_547855 ?auto_547856 ) ) ( not ( = ?auto_547855 ?auto_547857 ) ) ( not ( = ?auto_547855 ?auto_547858 ) ) ( not ( = ?auto_547855 ?auto_547859 ) ) ( not ( = ?auto_547855 ?auto_547860 ) ) ( not ( = ?auto_547855 ?auto_547861 ) ) ( not ( = ?auto_547855 ?auto_547862 ) ) ( not ( = ?auto_547855 ?auto_547863 ) ) ( not ( = ?auto_547855 ?auto_547864 ) ) ( not ( = ?auto_547855 ?auto_547865 ) ) ( not ( = ?auto_547856 ?auto_547857 ) ) ( not ( = ?auto_547856 ?auto_547858 ) ) ( not ( = ?auto_547856 ?auto_547859 ) ) ( not ( = ?auto_547856 ?auto_547860 ) ) ( not ( = ?auto_547856 ?auto_547861 ) ) ( not ( = ?auto_547856 ?auto_547862 ) ) ( not ( = ?auto_547856 ?auto_547863 ) ) ( not ( = ?auto_547856 ?auto_547864 ) ) ( not ( = ?auto_547856 ?auto_547865 ) ) ( not ( = ?auto_547857 ?auto_547858 ) ) ( not ( = ?auto_547857 ?auto_547859 ) ) ( not ( = ?auto_547857 ?auto_547860 ) ) ( not ( = ?auto_547857 ?auto_547861 ) ) ( not ( = ?auto_547857 ?auto_547862 ) ) ( not ( = ?auto_547857 ?auto_547863 ) ) ( not ( = ?auto_547857 ?auto_547864 ) ) ( not ( = ?auto_547857 ?auto_547865 ) ) ( not ( = ?auto_547858 ?auto_547859 ) ) ( not ( = ?auto_547858 ?auto_547860 ) ) ( not ( = ?auto_547858 ?auto_547861 ) ) ( not ( = ?auto_547858 ?auto_547862 ) ) ( not ( = ?auto_547858 ?auto_547863 ) ) ( not ( = ?auto_547858 ?auto_547864 ) ) ( not ( = ?auto_547858 ?auto_547865 ) ) ( not ( = ?auto_547859 ?auto_547860 ) ) ( not ( = ?auto_547859 ?auto_547861 ) ) ( not ( = ?auto_547859 ?auto_547862 ) ) ( not ( = ?auto_547859 ?auto_547863 ) ) ( not ( = ?auto_547859 ?auto_547864 ) ) ( not ( = ?auto_547859 ?auto_547865 ) ) ( not ( = ?auto_547860 ?auto_547861 ) ) ( not ( = ?auto_547860 ?auto_547862 ) ) ( not ( = ?auto_547860 ?auto_547863 ) ) ( not ( = ?auto_547860 ?auto_547864 ) ) ( not ( = ?auto_547860 ?auto_547865 ) ) ( not ( = ?auto_547861 ?auto_547862 ) ) ( not ( = ?auto_547861 ?auto_547863 ) ) ( not ( = ?auto_547861 ?auto_547864 ) ) ( not ( = ?auto_547861 ?auto_547865 ) ) ( not ( = ?auto_547862 ?auto_547863 ) ) ( not ( = ?auto_547862 ?auto_547864 ) ) ( not ( = ?auto_547862 ?auto_547865 ) ) ( not ( = ?auto_547863 ?auto_547864 ) ) ( not ( = ?auto_547863 ?auto_547865 ) ) ( not ( = ?auto_547864 ?auto_547865 ) ) ( ON ?auto_547863 ?auto_547864 ) ( ON ?auto_547862 ?auto_547863 ) ( CLEAR ?auto_547860 ) ( ON ?auto_547861 ?auto_547862 ) ( CLEAR ?auto_547861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_547855 ?auto_547856 ?auto_547857 ?auto_547858 ?auto_547859 ?auto_547860 ?auto_547861 )
      ( MAKE-10PILE ?auto_547855 ?auto_547856 ?auto_547857 ?auto_547858 ?auto_547859 ?auto_547860 ?auto_547861 ?auto_547862 ?auto_547863 ?auto_547864 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_547897 - BLOCK
      ?auto_547898 - BLOCK
      ?auto_547899 - BLOCK
      ?auto_547900 - BLOCK
      ?auto_547901 - BLOCK
      ?auto_547902 - BLOCK
      ?auto_547903 - BLOCK
      ?auto_547904 - BLOCK
      ?auto_547905 - BLOCK
      ?auto_547906 - BLOCK
    )
    :vars
    (
      ?auto_547907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547906 ?auto_547907 ) ( ON-TABLE ?auto_547897 ) ( ON ?auto_547898 ?auto_547897 ) ( ON ?auto_547899 ?auto_547898 ) ( ON ?auto_547900 ?auto_547899 ) ( ON ?auto_547901 ?auto_547900 ) ( not ( = ?auto_547897 ?auto_547898 ) ) ( not ( = ?auto_547897 ?auto_547899 ) ) ( not ( = ?auto_547897 ?auto_547900 ) ) ( not ( = ?auto_547897 ?auto_547901 ) ) ( not ( = ?auto_547897 ?auto_547902 ) ) ( not ( = ?auto_547897 ?auto_547903 ) ) ( not ( = ?auto_547897 ?auto_547904 ) ) ( not ( = ?auto_547897 ?auto_547905 ) ) ( not ( = ?auto_547897 ?auto_547906 ) ) ( not ( = ?auto_547897 ?auto_547907 ) ) ( not ( = ?auto_547898 ?auto_547899 ) ) ( not ( = ?auto_547898 ?auto_547900 ) ) ( not ( = ?auto_547898 ?auto_547901 ) ) ( not ( = ?auto_547898 ?auto_547902 ) ) ( not ( = ?auto_547898 ?auto_547903 ) ) ( not ( = ?auto_547898 ?auto_547904 ) ) ( not ( = ?auto_547898 ?auto_547905 ) ) ( not ( = ?auto_547898 ?auto_547906 ) ) ( not ( = ?auto_547898 ?auto_547907 ) ) ( not ( = ?auto_547899 ?auto_547900 ) ) ( not ( = ?auto_547899 ?auto_547901 ) ) ( not ( = ?auto_547899 ?auto_547902 ) ) ( not ( = ?auto_547899 ?auto_547903 ) ) ( not ( = ?auto_547899 ?auto_547904 ) ) ( not ( = ?auto_547899 ?auto_547905 ) ) ( not ( = ?auto_547899 ?auto_547906 ) ) ( not ( = ?auto_547899 ?auto_547907 ) ) ( not ( = ?auto_547900 ?auto_547901 ) ) ( not ( = ?auto_547900 ?auto_547902 ) ) ( not ( = ?auto_547900 ?auto_547903 ) ) ( not ( = ?auto_547900 ?auto_547904 ) ) ( not ( = ?auto_547900 ?auto_547905 ) ) ( not ( = ?auto_547900 ?auto_547906 ) ) ( not ( = ?auto_547900 ?auto_547907 ) ) ( not ( = ?auto_547901 ?auto_547902 ) ) ( not ( = ?auto_547901 ?auto_547903 ) ) ( not ( = ?auto_547901 ?auto_547904 ) ) ( not ( = ?auto_547901 ?auto_547905 ) ) ( not ( = ?auto_547901 ?auto_547906 ) ) ( not ( = ?auto_547901 ?auto_547907 ) ) ( not ( = ?auto_547902 ?auto_547903 ) ) ( not ( = ?auto_547902 ?auto_547904 ) ) ( not ( = ?auto_547902 ?auto_547905 ) ) ( not ( = ?auto_547902 ?auto_547906 ) ) ( not ( = ?auto_547902 ?auto_547907 ) ) ( not ( = ?auto_547903 ?auto_547904 ) ) ( not ( = ?auto_547903 ?auto_547905 ) ) ( not ( = ?auto_547903 ?auto_547906 ) ) ( not ( = ?auto_547903 ?auto_547907 ) ) ( not ( = ?auto_547904 ?auto_547905 ) ) ( not ( = ?auto_547904 ?auto_547906 ) ) ( not ( = ?auto_547904 ?auto_547907 ) ) ( not ( = ?auto_547905 ?auto_547906 ) ) ( not ( = ?auto_547905 ?auto_547907 ) ) ( not ( = ?auto_547906 ?auto_547907 ) ) ( ON ?auto_547905 ?auto_547906 ) ( ON ?auto_547904 ?auto_547905 ) ( ON ?auto_547903 ?auto_547904 ) ( CLEAR ?auto_547901 ) ( ON ?auto_547902 ?auto_547903 ) ( CLEAR ?auto_547902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_547897 ?auto_547898 ?auto_547899 ?auto_547900 ?auto_547901 ?auto_547902 )
      ( MAKE-10PILE ?auto_547897 ?auto_547898 ?auto_547899 ?auto_547900 ?auto_547901 ?auto_547902 ?auto_547903 ?auto_547904 ?auto_547905 ?auto_547906 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_547939 - BLOCK
      ?auto_547940 - BLOCK
      ?auto_547941 - BLOCK
      ?auto_547942 - BLOCK
      ?auto_547943 - BLOCK
      ?auto_547944 - BLOCK
      ?auto_547945 - BLOCK
      ?auto_547946 - BLOCK
      ?auto_547947 - BLOCK
      ?auto_547948 - BLOCK
    )
    :vars
    (
      ?auto_547949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547948 ?auto_547949 ) ( ON-TABLE ?auto_547939 ) ( ON ?auto_547940 ?auto_547939 ) ( ON ?auto_547941 ?auto_547940 ) ( ON ?auto_547942 ?auto_547941 ) ( not ( = ?auto_547939 ?auto_547940 ) ) ( not ( = ?auto_547939 ?auto_547941 ) ) ( not ( = ?auto_547939 ?auto_547942 ) ) ( not ( = ?auto_547939 ?auto_547943 ) ) ( not ( = ?auto_547939 ?auto_547944 ) ) ( not ( = ?auto_547939 ?auto_547945 ) ) ( not ( = ?auto_547939 ?auto_547946 ) ) ( not ( = ?auto_547939 ?auto_547947 ) ) ( not ( = ?auto_547939 ?auto_547948 ) ) ( not ( = ?auto_547939 ?auto_547949 ) ) ( not ( = ?auto_547940 ?auto_547941 ) ) ( not ( = ?auto_547940 ?auto_547942 ) ) ( not ( = ?auto_547940 ?auto_547943 ) ) ( not ( = ?auto_547940 ?auto_547944 ) ) ( not ( = ?auto_547940 ?auto_547945 ) ) ( not ( = ?auto_547940 ?auto_547946 ) ) ( not ( = ?auto_547940 ?auto_547947 ) ) ( not ( = ?auto_547940 ?auto_547948 ) ) ( not ( = ?auto_547940 ?auto_547949 ) ) ( not ( = ?auto_547941 ?auto_547942 ) ) ( not ( = ?auto_547941 ?auto_547943 ) ) ( not ( = ?auto_547941 ?auto_547944 ) ) ( not ( = ?auto_547941 ?auto_547945 ) ) ( not ( = ?auto_547941 ?auto_547946 ) ) ( not ( = ?auto_547941 ?auto_547947 ) ) ( not ( = ?auto_547941 ?auto_547948 ) ) ( not ( = ?auto_547941 ?auto_547949 ) ) ( not ( = ?auto_547942 ?auto_547943 ) ) ( not ( = ?auto_547942 ?auto_547944 ) ) ( not ( = ?auto_547942 ?auto_547945 ) ) ( not ( = ?auto_547942 ?auto_547946 ) ) ( not ( = ?auto_547942 ?auto_547947 ) ) ( not ( = ?auto_547942 ?auto_547948 ) ) ( not ( = ?auto_547942 ?auto_547949 ) ) ( not ( = ?auto_547943 ?auto_547944 ) ) ( not ( = ?auto_547943 ?auto_547945 ) ) ( not ( = ?auto_547943 ?auto_547946 ) ) ( not ( = ?auto_547943 ?auto_547947 ) ) ( not ( = ?auto_547943 ?auto_547948 ) ) ( not ( = ?auto_547943 ?auto_547949 ) ) ( not ( = ?auto_547944 ?auto_547945 ) ) ( not ( = ?auto_547944 ?auto_547946 ) ) ( not ( = ?auto_547944 ?auto_547947 ) ) ( not ( = ?auto_547944 ?auto_547948 ) ) ( not ( = ?auto_547944 ?auto_547949 ) ) ( not ( = ?auto_547945 ?auto_547946 ) ) ( not ( = ?auto_547945 ?auto_547947 ) ) ( not ( = ?auto_547945 ?auto_547948 ) ) ( not ( = ?auto_547945 ?auto_547949 ) ) ( not ( = ?auto_547946 ?auto_547947 ) ) ( not ( = ?auto_547946 ?auto_547948 ) ) ( not ( = ?auto_547946 ?auto_547949 ) ) ( not ( = ?auto_547947 ?auto_547948 ) ) ( not ( = ?auto_547947 ?auto_547949 ) ) ( not ( = ?auto_547948 ?auto_547949 ) ) ( ON ?auto_547947 ?auto_547948 ) ( ON ?auto_547946 ?auto_547947 ) ( ON ?auto_547945 ?auto_547946 ) ( ON ?auto_547944 ?auto_547945 ) ( CLEAR ?auto_547942 ) ( ON ?auto_547943 ?auto_547944 ) ( CLEAR ?auto_547943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_547939 ?auto_547940 ?auto_547941 ?auto_547942 ?auto_547943 )
      ( MAKE-10PILE ?auto_547939 ?auto_547940 ?auto_547941 ?auto_547942 ?auto_547943 ?auto_547944 ?auto_547945 ?auto_547946 ?auto_547947 ?auto_547948 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_547981 - BLOCK
      ?auto_547982 - BLOCK
      ?auto_547983 - BLOCK
      ?auto_547984 - BLOCK
      ?auto_547985 - BLOCK
      ?auto_547986 - BLOCK
      ?auto_547987 - BLOCK
      ?auto_547988 - BLOCK
      ?auto_547989 - BLOCK
      ?auto_547990 - BLOCK
    )
    :vars
    (
      ?auto_547991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_547990 ?auto_547991 ) ( ON-TABLE ?auto_547981 ) ( ON ?auto_547982 ?auto_547981 ) ( ON ?auto_547983 ?auto_547982 ) ( not ( = ?auto_547981 ?auto_547982 ) ) ( not ( = ?auto_547981 ?auto_547983 ) ) ( not ( = ?auto_547981 ?auto_547984 ) ) ( not ( = ?auto_547981 ?auto_547985 ) ) ( not ( = ?auto_547981 ?auto_547986 ) ) ( not ( = ?auto_547981 ?auto_547987 ) ) ( not ( = ?auto_547981 ?auto_547988 ) ) ( not ( = ?auto_547981 ?auto_547989 ) ) ( not ( = ?auto_547981 ?auto_547990 ) ) ( not ( = ?auto_547981 ?auto_547991 ) ) ( not ( = ?auto_547982 ?auto_547983 ) ) ( not ( = ?auto_547982 ?auto_547984 ) ) ( not ( = ?auto_547982 ?auto_547985 ) ) ( not ( = ?auto_547982 ?auto_547986 ) ) ( not ( = ?auto_547982 ?auto_547987 ) ) ( not ( = ?auto_547982 ?auto_547988 ) ) ( not ( = ?auto_547982 ?auto_547989 ) ) ( not ( = ?auto_547982 ?auto_547990 ) ) ( not ( = ?auto_547982 ?auto_547991 ) ) ( not ( = ?auto_547983 ?auto_547984 ) ) ( not ( = ?auto_547983 ?auto_547985 ) ) ( not ( = ?auto_547983 ?auto_547986 ) ) ( not ( = ?auto_547983 ?auto_547987 ) ) ( not ( = ?auto_547983 ?auto_547988 ) ) ( not ( = ?auto_547983 ?auto_547989 ) ) ( not ( = ?auto_547983 ?auto_547990 ) ) ( not ( = ?auto_547983 ?auto_547991 ) ) ( not ( = ?auto_547984 ?auto_547985 ) ) ( not ( = ?auto_547984 ?auto_547986 ) ) ( not ( = ?auto_547984 ?auto_547987 ) ) ( not ( = ?auto_547984 ?auto_547988 ) ) ( not ( = ?auto_547984 ?auto_547989 ) ) ( not ( = ?auto_547984 ?auto_547990 ) ) ( not ( = ?auto_547984 ?auto_547991 ) ) ( not ( = ?auto_547985 ?auto_547986 ) ) ( not ( = ?auto_547985 ?auto_547987 ) ) ( not ( = ?auto_547985 ?auto_547988 ) ) ( not ( = ?auto_547985 ?auto_547989 ) ) ( not ( = ?auto_547985 ?auto_547990 ) ) ( not ( = ?auto_547985 ?auto_547991 ) ) ( not ( = ?auto_547986 ?auto_547987 ) ) ( not ( = ?auto_547986 ?auto_547988 ) ) ( not ( = ?auto_547986 ?auto_547989 ) ) ( not ( = ?auto_547986 ?auto_547990 ) ) ( not ( = ?auto_547986 ?auto_547991 ) ) ( not ( = ?auto_547987 ?auto_547988 ) ) ( not ( = ?auto_547987 ?auto_547989 ) ) ( not ( = ?auto_547987 ?auto_547990 ) ) ( not ( = ?auto_547987 ?auto_547991 ) ) ( not ( = ?auto_547988 ?auto_547989 ) ) ( not ( = ?auto_547988 ?auto_547990 ) ) ( not ( = ?auto_547988 ?auto_547991 ) ) ( not ( = ?auto_547989 ?auto_547990 ) ) ( not ( = ?auto_547989 ?auto_547991 ) ) ( not ( = ?auto_547990 ?auto_547991 ) ) ( ON ?auto_547989 ?auto_547990 ) ( ON ?auto_547988 ?auto_547989 ) ( ON ?auto_547987 ?auto_547988 ) ( ON ?auto_547986 ?auto_547987 ) ( ON ?auto_547985 ?auto_547986 ) ( CLEAR ?auto_547983 ) ( ON ?auto_547984 ?auto_547985 ) ( CLEAR ?auto_547984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_547981 ?auto_547982 ?auto_547983 ?auto_547984 )
      ( MAKE-10PILE ?auto_547981 ?auto_547982 ?auto_547983 ?auto_547984 ?auto_547985 ?auto_547986 ?auto_547987 ?auto_547988 ?auto_547989 ?auto_547990 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_548023 - BLOCK
      ?auto_548024 - BLOCK
      ?auto_548025 - BLOCK
      ?auto_548026 - BLOCK
      ?auto_548027 - BLOCK
      ?auto_548028 - BLOCK
      ?auto_548029 - BLOCK
      ?auto_548030 - BLOCK
      ?auto_548031 - BLOCK
      ?auto_548032 - BLOCK
    )
    :vars
    (
      ?auto_548033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548032 ?auto_548033 ) ( ON-TABLE ?auto_548023 ) ( ON ?auto_548024 ?auto_548023 ) ( not ( = ?auto_548023 ?auto_548024 ) ) ( not ( = ?auto_548023 ?auto_548025 ) ) ( not ( = ?auto_548023 ?auto_548026 ) ) ( not ( = ?auto_548023 ?auto_548027 ) ) ( not ( = ?auto_548023 ?auto_548028 ) ) ( not ( = ?auto_548023 ?auto_548029 ) ) ( not ( = ?auto_548023 ?auto_548030 ) ) ( not ( = ?auto_548023 ?auto_548031 ) ) ( not ( = ?auto_548023 ?auto_548032 ) ) ( not ( = ?auto_548023 ?auto_548033 ) ) ( not ( = ?auto_548024 ?auto_548025 ) ) ( not ( = ?auto_548024 ?auto_548026 ) ) ( not ( = ?auto_548024 ?auto_548027 ) ) ( not ( = ?auto_548024 ?auto_548028 ) ) ( not ( = ?auto_548024 ?auto_548029 ) ) ( not ( = ?auto_548024 ?auto_548030 ) ) ( not ( = ?auto_548024 ?auto_548031 ) ) ( not ( = ?auto_548024 ?auto_548032 ) ) ( not ( = ?auto_548024 ?auto_548033 ) ) ( not ( = ?auto_548025 ?auto_548026 ) ) ( not ( = ?auto_548025 ?auto_548027 ) ) ( not ( = ?auto_548025 ?auto_548028 ) ) ( not ( = ?auto_548025 ?auto_548029 ) ) ( not ( = ?auto_548025 ?auto_548030 ) ) ( not ( = ?auto_548025 ?auto_548031 ) ) ( not ( = ?auto_548025 ?auto_548032 ) ) ( not ( = ?auto_548025 ?auto_548033 ) ) ( not ( = ?auto_548026 ?auto_548027 ) ) ( not ( = ?auto_548026 ?auto_548028 ) ) ( not ( = ?auto_548026 ?auto_548029 ) ) ( not ( = ?auto_548026 ?auto_548030 ) ) ( not ( = ?auto_548026 ?auto_548031 ) ) ( not ( = ?auto_548026 ?auto_548032 ) ) ( not ( = ?auto_548026 ?auto_548033 ) ) ( not ( = ?auto_548027 ?auto_548028 ) ) ( not ( = ?auto_548027 ?auto_548029 ) ) ( not ( = ?auto_548027 ?auto_548030 ) ) ( not ( = ?auto_548027 ?auto_548031 ) ) ( not ( = ?auto_548027 ?auto_548032 ) ) ( not ( = ?auto_548027 ?auto_548033 ) ) ( not ( = ?auto_548028 ?auto_548029 ) ) ( not ( = ?auto_548028 ?auto_548030 ) ) ( not ( = ?auto_548028 ?auto_548031 ) ) ( not ( = ?auto_548028 ?auto_548032 ) ) ( not ( = ?auto_548028 ?auto_548033 ) ) ( not ( = ?auto_548029 ?auto_548030 ) ) ( not ( = ?auto_548029 ?auto_548031 ) ) ( not ( = ?auto_548029 ?auto_548032 ) ) ( not ( = ?auto_548029 ?auto_548033 ) ) ( not ( = ?auto_548030 ?auto_548031 ) ) ( not ( = ?auto_548030 ?auto_548032 ) ) ( not ( = ?auto_548030 ?auto_548033 ) ) ( not ( = ?auto_548031 ?auto_548032 ) ) ( not ( = ?auto_548031 ?auto_548033 ) ) ( not ( = ?auto_548032 ?auto_548033 ) ) ( ON ?auto_548031 ?auto_548032 ) ( ON ?auto_548030 ?auto_548031 ) ( ON ?auto_548029 ?auto_548030 ) ( ON ?auto_548028 ?auto_548029 ) ( ON ?auto_548027 ?auto_548028 ) ( ON ?auto_548026 ?auto_548027 ) ( CLEAR ?auto_548024 ) ( ON ?auto_548025 ?auto_548026 ) ( CLEAR ?auto_548025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_548023 ?auto_548024 ?auto_548025 )
      ( MAKE-10PILE ?auto_548023 ?auto_548024 ?auto_548025 ?auto_548026 ?auto_548027 ?auto_548028 ?auto_548029 ?auto_548030 ?auto_548031 ?auto_548032 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_548065 - BLOCK
      ?auto_548066 - BLOCK
      ?auto_548067 - BLOCK
      ?auto_548068 - BLOCK
      ?auto_548069 - BLOCK
      ?auto_548070 - BLOCK
      ?auto_548071 - BLOCK
      ?auto_548072 - BLOCK
      ?auto_548073 - BLOCK
      ?auto_548074 - BLOCK
    )
    :vars
    (
      ?auto_548075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548074 ?auto_548075 ) ( ON-TABLE ?auto_548065 ) ( not ( = ?auto_548065 ?auto_548066 ) ) ( not ( = ?auto_548065 ?auto_548067 ) ) ( not ( = ?auto_548065 ?auto_548068 ) ) ( not ( = ?auto_548065 ?auto_548069 ) ) ( not ( = ?auto_548065 ?auto_548070 ) ) ( not ( = ?auto_548065 ?auto_548071 ) ) ( not ( = ?auto_548065 ?auto_548072 ) ) ( not ( = ?auto_548065 ?auto_548073 ) ) ( not ( = ?auto_548065 ?auto_548074 ) ) ( not ( = ?auto_548065 ?auto_548075 ) ) ( not ( = ?auto_548066 ?auto_548067 ) ) ( not ( = ?auto_548066 ?auto_548068 ) ) ( not ( = ?auto_548066 ?auto_548069 ) ) ( not ( = ?auto_548066 ?auto_548070 ) ) ( not ( = ?auto_548066 ?auto_548071 ) ) ( not ( = ?auto_548066 ?auto_548072 ) ) ( not ( = ?auto_548066 ?auto_548073 ) ) ( not ( = ?auto_548066 ?auto_548074 ) ) ( not ( = ?auto_548066 ?auto_548075 ) ) ( not ( = ?auto_548067 ?auto_548068 ) ) ( not ( = ?auto_548067 ?auto_548069 ) ) ( not ( = ?auto_548067 ?auto_548070 ) ) ( not ( = ?auto_548067 ?auto_548071 ) ) ( not ( = ?auto_548067 ?auto_548072 ) ) ( not ( = ?auto_548067 ?auto_548073 ) ) ( not ( = ?auto_548067 ?auto_548074 ) ) ( not ( = ?auto_548067 ?auto_548075 ) ) ( not ( = ?auto_548068 ?auto_548069 ) ) ( not ( = ?auto_548068 ?auto_548070 ) ) ( not ( = ?auto_548068 ?auto_548071 ) ) ( not ( = ?auto_548068 ?auto_548072 ) ) ( not ( = ?auto_548068 ?auto_548073 ) ) ( not ( = ?auto_548068 ?auto_548074 ) ) ( not ( = ?auto_548068 ?auto_548075 ) ) ( not ( = ?auto_548069 ?auto_548070 ) ) ( not ( = ?auto_548069 ?auto_548071 ) ) ( not ( = ?auto_548069 ?auto_548072 ) ) ( not ( = ?auto_548069 ?auto_548073 ) ) ( not ( = ?auto_548069 ?auto_548074 ) ) ( not ( = ?auto_548069 ?auto_548075 ) ) ( not ( = ?auto_548070 ?auto_548071 ) ) ( not ( = ?auto_548070 ?auto_548072 ) ) ( not ( = ?auto_548070 ?auto_548073 ) ) ( not ( = ?auto_548070 ?auto_548074 ) ) ( not ( = ?auto_548070 ?auto_548075 ) ) ( not ( = ?auto_548071 ?auto_548072 ) ) ( not ( = ?auto_548071 ?auto_548073 ) ) ( not ( = ?auto_548071 ?auto_548074 ) ) ( not ( = ?auto_548071 ?auto_548075 ) ) ( not ( = ?auto_548072 ?auto_548073 ) ) ( not ( = ?auto_548072 ?auto_548074 ) ) ( not ( = ?auto_548072 ?auto_548075 ) ) ( not ( = ?auto_548073 ?auto_548074 ) ) ( not ( = ?auto_548073 ?auto_548075 ) ) ( not ( = ?auto_548074 ?auto_548075 ) ) ( ON ?auto_548073 ?auto_548074 ) ( ON ?auto_548072 ?auto_548073 ) ( ON ?auto_548071 ?auto_548072 ) ( ON ?auto_548070 ?auto_548071 ) ( ON ?auto_548069 ?auto_548070 ) ( ON ?auto_548068 ?auto_548069 ) ( ON ?auto_548067 ?auto_548068 ) ( CLEAR ?auto_548065 ) ( ON ?auto_548066 ?auto_548067 ) ( CLEAR ?auto_548066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_548065 ?auto_548066 )
      ( MAKE-10PILE ?auto_548065 ?auto_548066 ?auto_548067 ?auto_548068 ?auto_548069 ?auto_548070 ?auto_548071 ?auto_548072 ?auto_548073 ?auto_548074 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_548107 - BLOCK
      ?auto_548108 - BLOCK
      ?auto_548109 - BLOCK
      ?auto_548110 - BLOCK
      ?auto_548111 - BLOCK
      ?auto_548112 - BLOCK
      ?auto_548113 - BLOCK
      ?auto_548114 - BLOCK
      ?auto_548115 - BLOCK
      ?auto_548116 - BLOCK
    )
    :vars
    (
      ?auto_548117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548116 ?auto_548117 ) ( not ( = ?auto_548107 ?auto_548108 ) ) ( not ( = ?auto_548107 ?auto_548109 ) ) ( not ( = ?auto_548107 ?auto_548110 ) ) ( not ( = ?auto_548107 ?auto_548111 ) ) ( not ( = ?auto_548107 ?auto_548112 ) ) ( not ( = ?auto_548107 ?auto_548113 ) ) ( not ( = ?auto_548107 ?auto_548114 ) ) ( not ( = ?auto_548107 ?auto_548115 ) ) ( not ( = ?auto_548107 ?auto_548116 ) ) ( not ( = ?auto_548107 ?auto_548117 ) ) ( not ( = ?auto_548108 ?auto_548109 ) ) ( not ( = ?auto_548108 ?auto_548110 ) ) ( not ( = ?auto_548108 ?auto_548111 ) ) ( not ( = ?auto_548108 ?auto_548112 ) ) ( not ( = ?auto_548108 ?auto_548113 ) ) ( not ( = ?auto_548108 ?auto_548114 ) ) ( not ( = ?auto_548108 ?auto_548115 ) ) ( not ( = ?auto_548108 ?auto_548116 ) ) ( not ( = ?auto_548108 ?auto_548117 ) ) ( not ( = ?auto_548109 ?auto_548110 ) ) ( not ( = ?auto_548109 ?auto_548111 ) ) ( not ( = ?auto_548109 ?auto_548112 ) ) ( not ( = ?auto_548109 ?auto_548113 ) ) ( not ( = ?auto_548109 ?auto_548114 ) ) ( not ( = ?auto_548109 ?auto_548115 ) ) ( not ( = ?auto_548109 ?auto_548116 ) ) ( not ( = ?auto_548109 ?auto_548117 ) ) ( not ( = ?auto_548110 ?auto_548111 ) ) ( not ( = ?auto_548110 ?auto_548112 ) ) ( not ( = ?auto_548110 ?auto_548113 ) ) ( not ( = ?auto_548110 ?auto_548114 ) ) ( not ( = ?auto_548110 ?auto_548115 ) ) ( not ( = ?auto_548110 ?auto_548116 ) ) ( not ( = ?auto_548110 ?auto_548117 ) ) ( not ( = ?auto_548111 ?auto_548112 ) ) ( not ( = ?auto_548111 ?auto_548113 ) ) ( not ( = ?auto_548111 ?auto_548114 ) ) ( not ( = ?auto_548111 ?auto_548115 ) ) ( not ( = ?auto_548111 ?auto_548116 ) ) ( not ( = ?auto_548111 ?auto_548117 ) ) ( not ( = ?auto_548112 ?auto_548113 ) ) ( not ( = ?auto_548112 ?auto_548114 ) ) ( not ( = ?auto_548112 ?auto_548115 ) ) ( not ( = ?auto_548112 ?auto_548116 ) ) ( not ( = ?auto_548112 ?auto_548117 ) ) ( not ( = ?auto_548113 ?auto_548114 ) ) ( not ( = ?auto_548113 ?auto_548115 ) ) ( not ( = ?auto_548113 ?auto_548116 ) ) ( not ( = ?auto_548113 ?auto_548117 ) ) ( not ( = ?auto_548114 ?auto_548115 ) ) ( not ( = ?auto_548114 ?auto_548116 ) ) ( not ( = ?auto_548114 ?auto_548117 ) ) ( not ( = ?auto_548115 ?auto_548116 ) ) ( not ( = ?auto_548115 ?auto_548117 ) ) ( not ( = ?auto_548116 ?auto_548117 ) ) ( ON ?auto_548115 ?auto_548116 ) ( ON ?auto_548114 ?auto_548115 ) ( ON ?auto_548113 ?auto_548114 ) ( ON ?auto_548112 ?auto_548113 ) ( ON ?auto_548111 ?auto_548112 ) ( ON ?auto_548110 ?auto_548111 ) ( ON ?auto_548109 ?auto_548110 ) ( ON ?auto_548108 ?auto_548109 ) ( ON ?auto_548107 ?auto_548108 ) ( CLEAR ?auto_548107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_548107 )
      ( MAKE-10PILE ?auto_548107 ?auto_548108 ?auto_548109 ?auto_548110 ?auto_548111 ?auto_548112 ?auto_548113 ?auto_548114 ?auto_548115 ?auto_548116 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_548150 - BLOCK
      ?auto_548151 - BLOCK
      ?auto_548152 - BLOCK
      ?auto_548153 - BLOCK
      ?auto_548154 - BLOCK
      ?auto_548155 - BLOCK
      ?auto_548156 - BLOCK
      ?auto_548157 - BLOCK
      ?auto_548158 - BLOCK
      ?auto_548159 - BLOCK
      ?auto_548160 - BLOCK
    )
    :vars
    (
      ?auto_548161 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_548159 ) ( ON ?auto_548160 ?auto_548161 ) ( CLEAR ?auto_548160 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_548150 ) ( ON ?auto_548151 ?auto_548150 ) ( ON ?auto_548152 ?auto_548151 ) ( ON ?auto_548153 ?auto_548152 ) ( ON ?auto_548154 ?auto_548153 ) ( ON ?auto_548155 ?auto_548154 ) ( ON ?auto_548156 ?auto_548155 ) ( ON ?auto_548157 ?auto_548156 ) ( ON ?auto_548158 ?auto_548157 ) ( ON ?auto_548159 ?auto_548158 ) ( not ( = ?auto_548150 ?auto_548151 ) ) ( not ( = ?auto_548150 ?auto_548152 ) ) ( not ( = ?auto_548150 ?auto_548153 ) ) ( not ( = ?auto_548150 ?auto_548154 ) ) ( not ( = ?auto_548150 ?auto_548155 ) ) ( not ( = ?auto_548150 ?auto_548156 ) ) ( not ( = ?auto_548150 ?auto_548157 ) ) ( not ( = ?auto_548150 ?auto_548158 ) ) ( not ( = ?auto_548150 ?auto_548159 ) ) ( not ( = ?auto_548150 ?auto_548160 ) ) ( not ( = ?auto_548150 ?auto_548161 ) ) ( not ( = ?auto_548151 ?auto_548152 ) ) ( not ( = ?auto_548151 ?auto_548153 ) ) ( not ( = ?auto_548151 ?auto_548154 ) ) ( not ( = ?auto_548151 ?auto_548155 ) ) ( not ( = ?auto_548151 ?auto_548156 ) ) ( not ( = ?auto_548151 ?auto_548157 ) ) ( not ( = ?auto_548151 ?auto_548158 ) ) ( not ( = ?auto_548151 ?auto_548159 ) ) ( not ( = ?auto_548151 ?auto_548160 ) ) ( not ( = ?auto_548151 ?auto_548161 ) ) ( not ( = ?auto_548152 ?auto_548153 ) ) ( not ( = ?auto_548152 ?auto_548154 ) ) ( not ( = ?auto_548152 ?auto_548155 ) ) ( not ( = ?auto_548152 ?auto_548156 ) ) ( not ( = ?auto_548152 ?auto_548157 ) ) ( not ( = ?auto_548152 ?auto_548158 ) ) ( not ( = ?auto_548152 ?auto_548159 ) ) ( not ( = ?auto_548152 ?auto_548160 ) ) ( not ( = ?auto_548152 ?auto_548161 ) ) ( not ( = ?auto_548153 ?auto_548154 ) ) ( not ( = ?auto_548153 ?auto_548155 ) ) ( not ( = ?auto_548153 ?auto_548156 ) ) ( not ( = ?auto_548153 ?auto_548157 ) ) ( not ( = ?auto_548153 ?auto_548158 ) ) ( not ( = ?auto_548153 ?auto_548159 ) ) ( not ( = ?auto_548153 ?auto_548160 ) ) ( not ( = ?auto_548153 ?auto_548161 ) ) ( not ( = ?auto_548154 ?auto_548155 ) ) ( not ( = ?auto_548154 ?auto_548156 ) ) ( not ( = ?auto_548154 ?auto_548157 ) ) ( not ( = ?auto_548154 ?auto_548158 ) ) ( not ( = ?auto_548154 ?auto_548159 ) ) ( not ( = ?auto_548154 ?auto_548160 ) ) ( not ( = ?auto_548154 ?auto_548161 ) ) ( not ( = ?auto_548155 ?auto_548156 ) ) ( not ( = ?auto_548155 ?auto_548157 ) ) ( not ( = ?auto_548155 ?auto_548158 ) ) ( not ( = ?auto_548155 ?auto_548159 ) ) ( not ( = ?auto_548155 ?auto_548160 ) ) ( not ( = ?auto_548155 ?auto_548161 ) ) ( not ( = ?auto_548156 ?auto_548157 ) ) ( not ( = ?auto_548156 ?auto_548158 ) ) ( not ( = ?auto_548156 ?auto_548159 ) ) ( not ( = ?auto_548156 ?auto_548160 ) ) ( not ( = ?auto_548156 ?auto_548161 ) ) ( not ( = ?auto_548157 ?auto_548158 ) ) ( not ( = ?auto_548157 ?auto_548159 ) ) ( not ( = ?auto_548157 ?auto_548160 ) ) ( not ( = ?auto_548157 ?auto_548161 ) ) ( not ( = ?auto_548158 ?auto_548159 ) ) ( not ( = ?auto_548158 ?auto_548160 ) ) ( not ( = ?auto_548158 ?auto_548161 ) ) ( not ( = ?auto_548159 ?auto_548160 ) ) ( not ( = ?auto_548159 ?auto_548161 ) ) ( not ( = ?auto_548160 ?auto_548161 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_548160 ?auto_548161 )
      ( !STACK ?auto_548160 ?auto_548159 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_548196 - BLOCK
      ?auto_548197 - BLOCK
      ?auto_548198 - BLOCK
      ?auto_548199 - BLOCK
      ?auto_548200 - BLOCK
      ?auto_548201 - BLOCK
      ?auto_548202 - BLOCK
      ?auto_548203 - BLOCK
      ?auto_548204 - BLOCK
      ?auto_548205 - BLOCK
      ?auto_548206 - BLOCK
    )
    :vars
    (
      ?auto_548207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548206 ?auto_548207 ) ( ON-TABLE ?auto_548196 ) ( ON ?auto_548197 ?auto_548196 ) ( ON ?auto_548198 ?auto_548197 ) ( ON ?auto_548199 ?auto_548198 ) ( ON ?auto_548200 ?auto_548199 ) ( ON ?auto_548201 ?auto_548200 ) ( ON ?auto_548202 ?auto_548201 ) ( ON ?auto_548203 ?auto_548202 ) ( ON ?auto_548204 ?auto_548203 ) ( not ( = ?auto_548196 ?auto_548197 ) ) ( not ( = ?auto_548196 ?auto_548198 ) ) ( not ( = ?auto_548196 ?auto_548199 ) ) ( not ( = ?auto_548196 ?auto_548200 ) ) ( not ( = ?auto_548196 ?auto_548201 ) ) ( not ( = ?auto_548196 ?auto_548202 ) ) ( not ( = ?auto_548196 ?auto_548203 ) ) ( not ( = ?auto_548196 ?auto_548204 ) ) ( not ( = ?auto_548196 ?auto_548205 ) ) ( not ( = ?auto_548196 ?auto_548206 ) ) ( not ( = ?auto_548196 ?auto_548207 ) ) ( not ( = ?auto_548197 ?auto_548198 ) ) ( not ( = ?auto_548197 ?auto_548199 ) ) ( not ( = ?auto_548197 ?auto_548200 ) ) ( not ( = ?auto_548197 ?auto_548201 ) ) ( not ( = ?auto_548197 ?auto_548202 ) ) ( not ( = ?auto_548197 ?auto_548203 ) ) ( not ( = ?auto_548197 ?auto_548204 ) ) ( not ( = ?auto_548197 ?auto_548205 ) ) ( not ( = ?auto_548197 ?auto_548206 ) ) ( not ( = ?auto_548197 ?auto_548207 ) ) ( not ( = ?auto_548198 ?auto_548199 ) ) ( not ( = ?auto_548198 ?auto_548200 ) ) ( not ( = ?auto_548198 ?auto_548201 ) ) ( not ( = ?auto_548198 ?auto_548202 ) ) ( not ( = ?auto_548198 ?auto_548203 ) ) ( not ( = ?auto_548198 ?auto_548204 ) ) ( not ( = ?auto_548198 ?auto_548205 ) ) ( not ( = ?auto_548198 ?auto_548206 ) ) ( not ( = ?auto_548198 ?auto_548207 ) ) ( not ( = ?auto_548199 ?auto_548200 ) ) ( not ( = ?auto_548199 ?auto_548201 ) ) ( not ( = ?auto_548199 ?auto_548202 ) ) ( not ( = ?auto_548199 ?auto_548203 ) ) ( not ( = ?auto_548199 ?auto_548204 ) ) ( not ( = ?auto_548199 ?auto_548205 ) ) ( not ( = ?auto_548199 ?auto_548206 ) ) ( not ( = ?auto_548199 ?auto_548207 ) ) ( not ( = ?auto_548200 ?auto_548201 ) ) ( not ( = ?auto_548200 ?auto_548202 ) ) ( not ( = ?auto_548200 ?auto_548203 ) ) ( not ( = ?auto_548200 ?auto_548204 ) ) ( not ( = ?auto_548200 ?auto_548205 ) ) ( not ( = ?auto_548200 ?auto_548206 ) ) ( not ( = ?auto_548200 ?auto_548207 ) ) ( not ( = ?auto_548201 ?auto_548202 ) ) ( not ( = ?auto_548201 ?auto_548203 ) ) ( not ( = ?auto_548201 ?auto_548204 ) ) ( not ( = ?auto_548201 ?auto_548205 ) ) ( not ( = ?auto_548201 ?auto_548206 ) ) ( not ( = ?auto_548201 ?auto_548207 ) ) ( not ( = ?auto_548202 ?auto_548203 ) ) ( not ( = ?auto_548202 ?auto_548204 ) ) ( not ( = ?auto_548202 ?auto_548205 ) ) ( not ( = ?auto_548202 ?auto_548206 ) ) ( not ( = ?auto_548202 ?auto_548207 ) ) ( not ( = ?auto_548203 ?auto_548204 ) ) ( not ( = ?auto_548203 ?auto_548205 ) ) ( not ( = ?auto_548203 ?auto_548206 ) ) ( not ( = ?auto_548203 ?auto_548207 ) ) ( not ( = ?auto_548204 ?auto_548205 ) ) ( not ( = ?auto_548204 ?auto_548206 ) ) ( not ( = ?auto_548204 ?auto_548207 ) ) ( not ( = ?auto_548205 ?auto_548206 ) ) ( not ( = ?auto_548205 ?auto_548207 ) ) ( not ( = ?auto_548206 ?auto_548207 ) ) ( CLEAR ?auto_548204 ) ( ON ?auto_548205 ?auto_548206 ) ( CLEAR ?auto_548205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_548196 ?auto_548197 ?auto_548198 ?auto_548199 ?auto_548200 ?auto_548201 ?auto_548202 ?auto_548203 ?auto_548204 ?auto_548205 )
      ( MAKE-11PILE ?auto_548196 ?auto_548197 ?auto_548198 ?auto_548199 ?auto_548200 ?auto_548201 ?auto_548202 ?auto_548203 ?auto_548204 ?auto_548205 ?auto_548206 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_548242 - BLOCK
      ?auto_548243 - BLOCK
      ?auto_548244 - BLOCK
      ?auto_548245 - BLOCK
      ?auto_548246 - BLOCK
      ?auto_548247 - BLOCK
      ?auto_548248 - BLOCK
      ?auto_548249 - BLOCK
      ?auto_548250 - BLOCK
      ?auto_548251 - BLOCK
      ?auto_548252 - BLOCK
    )
    :vars
    (
      ?auto_548253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548252 ?auto_548253 ) ( ON-TABLE ?auto_548242 ) ( ON ?auto_548243 ?auto_548242 ) ( ON ?auto_548244 ?auto_548243 ) ( ON ?auto_548245 ?auto_548244 ) ( ON ?auto_548246 ?auto_548245 ) ( ON ?auto_548247 ?auto_548246 ) ( ON ?auto_548248 ?auto_548247 ) ( ON ?auto_548249 ?auto_548248 ) ( not ( = ?auto_548242 ?auto_548243 ) ) ( not ( = ?auto_548242 ?auto_548244 ) ) ( not ( = ?auto_548242 ?auto_548245 ) ) ( not ( = ?auto_548242 ?auto_548246 ) ) ( not ( = ?auto_548242 ?auto_548247 ) ) ( not ( = ?auto_548242 ?auto_548248 ) ) ( not ( = ?auto_548242 ?auto_548249 ) ) ( not ( = ?auto_548242 ?auto_548250 ) ) ( not ( = ?auto_548242 ?auto_548251 ) ) ( not ( = ?auto_548242 ?auto_548252 ) ) ( not ( = ?auto_548242 ?auto_548253 ) ) ( not ( = ?auto_548243 ?auto_548244 ) ) ( not ( = ?auto_548243 ?auto_548245 ) ) ( not ( = ?auto_548243 ?auto_548246 ) ) ( not ( = ?auto_548243 ?auto_548247 ) ) ( not ( = ?auto_548243 ?auto_548248 ) ) ( not ( = ?auto_548243 ?auto_548249 ) ) ( not ( = ?auto_548243 ?auto_548250 ) ) ( not ( = ?auto_548243 ?auto_548251 ) ) ( not ( = ?auto_548243 ?auto_548252 ) ) ( not ( = ?auto_548243 ?auto_548253 ) ) ( not ( = ?auto_548244 ?auto_548245 ) ) ( not ( = ?auto_548244 ?auto_548246 ) ) ( not ( = ?auto_548244 ?auto_548247 ) ) ( not ( = ?auto_548244 ?auto_548248 ) ) ( not ( = ?auto_548244 ?auto_548249 ) ) ( not ( = ?auto_548244 ?auto_548250 ) ) ( not ( = ?auto_548244 ?auto_548251 ) ) ( not ( = ?auto_548244 ?auto_548252 ) ) ( not ( = ?auto_548244 ?auto_548253 ) ) ( not ( = ?auto_548245 ?auto_548246 ) ) ( not ( = ?auto_548245 ?auto_548247 ) ) ( not ( = ?auto_548245 ?auto_548248 ) ) ( not ( = ?auto_548245 ?auto_548249 ) ) ( not ( = ?auto_548245 ?auto_548250 ) ) ( not ( = ?auto_548245 ?auto_548251 ) ) ( not ( = ?auto_548245 ?auto_548252 ) ) ( not ( = ?auto_548245 ?auto_548253 ) ) ( not ( = ?auto_548246 ?auto_548247 ) ) ( not ( = ?auto_548246 ?auto_548248 ) ) ( not ( = ?auto_548246 ?auto_548249 ) ) ( not ( = ?auto_548246 ?auto_548250 ) ) ( not ( = ?auto_548246 ?auto_548251 ) ) ( not ( = ?auto_548246 ?auto_548252 ) ) ( not ( = ?auto_548246 ?auto_548253 ) ) ( not ( = ?auto_548247 ?auto_548248 ) ) ( not ( = ?auto_548247 ?auto_548249 ) ) ( not ( = ?auto_548247 ?auto_548250 ) ) ( not ( = ?auto_548247 ?auto_548251 ) ) ( not ( = ?auto_548247 ?auto_548252 ) ) ( not ( = ?auto_548247 ?auto_548253 ) ) ( not ( = ?auto_548248 ?auto_548249 ) ) ( not ( = ?auto_548248 ?auto_548250 ) ) ( not ( = ?auto_548248 ?auto_548251 ) ) ( not ( = ?auto_548248 ?auto_548252 ) ) ( not ( = ?auto_548248 ?auto_548253 ) ) ( not ( = ?auto_548249 ?auto_548250 ) ) ( not ( = ?auto_548249 ?auto_548251 ) ) ( not ( = ?auto_548249 ?auto_548252 ) ) ( not ( = ?auto_548249 ?auto_548253 ) ) ( not ( = ?auto_548250 ?auto_548251 ) ) ( not ( = ?auto_548250 ?auto_548252 ) ) ( not ( = ?auto_548250 ?auto_548253 ) ) ( not ( = ?auto_548251 ?auto_548252 ) ) ( not ( = ?auto_548251 ?auto_548253 ) ) ( not ( = ?auto_548252 ?auto_548253 ) ) ( ON ?auto_548251 ?auto_548252 ) ( CLEAR ?auto_548249 ) ( ON ?auto_548250 ?auto_548251 ) ( CLEAR ?auto_548250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_548242 ?auto_548243 ?auto_548244 ?auto_548245 ?auto_548246 ?auto_548247 ?auto_548248 ?auto_548249 ?auto_548250 )
      ( MAKE-11PILE ?auto_548242 ?auto_548243 ?auto_548244 ?auto_548245 ?auto_548246 ?auto_548247 ?auto_548248 ?auto_548249 ?auto_548250 ?auto_548251 ?auto_548252 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_548288 - BLOCK
      ?auto_548289 - BLOCK
      ?auto_548290 - BLOCK
      ?auto_548291 - BLOCK
      ?auto_548292 - BLOCK
      ?auto_548293 - BLOCK
      ?auto_548294 - BLOCK
      ?auto_548295 - BLOCK
      ?auto_548296 - BLOCK
      ?auto_548297 - BLOCK
      ?auto_548298 - BLOCK
    )
    :vars
    (
      ?auto_548299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548298 ?auto_548299 ) ( ON-TABLE ?auto_548288 ) ( ON ?auto_548289 ?auto_548288 ) ( ON ?auto_548290 ?auto_548289 ) ( ON ?auto_548291 ?auto_548290 ) ( ON ?auto_548292 ?auto_548291 ) ( ON ?auto_548293 ?auto_548292 ) ( ON ?auto_548294 ?auto_548293 ) ( not ( = ?auto_548288 ?auto_548289 ) ) ( not ( = ?auto_548288 ?auto_548290 ) ) ( not ( = ?auto_548288 ?auto_548291 ) ) ( not ( = ?auto_548288 ?auto_548292 ) ) ( not ( = ?auto_548288 ?auto_548293 ) ) ( not ( = ?auto_548288 ?auto_548294 ) ) ( not ( = ?auto_548288 ?auto_548295 ) ) ( not ( = ?auto_548288 ?auto_548296 ) ) ( not ( = ?auto_548288 ?auto_548297 ) ) ( not ( = ?auto_548288 ?auto_548298 ) ) ( not ( = ?auto_548288 ?auto_548299 ) ) ( not ( = ?auto_548289 ?auto_548290 ) ) ( not ( = ?auto_548289 ?auto_548291 ) ) ( not ( = ?auto_548289 ?auto_548292 ) ) ( not ( = ?auto_548289 ?auto_548293 ) ) ( not ( = ?auto_548289 ?auto_548294 ) ) ( not ( = ?auto_548289 ?auto_548295 ) ) ( not ( = ?auto_548289 ?auto_548296 ) ) ( not ( = ?auto_548289 ?auto_548297 ) ) ( not ( = ?auto_548289 ?auto_548298 ) ) ( not ( = ?auto_548289 ?auto_548299 ) ) ( not ( = ?auto_548290 ?auto_548291 ) ) ( not ( = ?auto_548290 ?auto_548292 ) ) ( not ( = ?auto_548290 ?auto_548293 ) ) ( not ( = ?auto_548290 ?auto_548294 ) ) ( not ( = ?auto_548290 ?auto_548295 ) ) ( not ( = ?auto_548290 ?auto_548296 ) ) ( not ( = ?auto_548290 ?auto_548297 ) ) ( not ( = ?auto_548290 ?auto_548298 ) ) ( not ( = ?auto_548290 ?auto_548299 ) ) ( not ( = ?auto_548291 ?auto_548292 ) ) ( not ( = ?auto_548291 ?auto_548293 ) ) ( not ( = ?auto_548291 ?auto_548294 ) ) ( not ( = ?auto_548291 ?auto_548295 ) ) ( not ( = ?auto_548291 ?auto_548296 ) ) ( not ( = ?auto_548291 ?auto_548297 ) ) ( not ( = ?auto_548291 ?auto_548298 ) ) ( not ( = ?auto_548291 ?auto_548299 ) ) ( not ( = ?auto_548292 ?auto_548293 ) ) ( not ( = ?auto_548292 ?auto_548294 ) ) ( not ( = ?auto_548292 ?auto_548295 ) ) ( not ( = ?auto_548292 ?auto_548296 ) ) ( not ( = ?auto_548292 ?auto_548297 ) ) ( not ( = ?auto_548292 ?auto_548298 ) ) ( not ( = ?auto_548292 ?auto_548299 ) ) ( not ( = ?auto_548293 ?auto_548294 ) ) ( not ( = ?auto_548293 ?auto_548295 ) ) ( not ( = ?auto_548293 ?auto_548296 ) ) ( not ( = ?auto_548293 ?auto_548297 ) ) ( not ( = ?auto_548293 ?auto_548298 ) ) ( not ( = ?auto_548293 ?auto_548299 ) ) ( not ( = ?auto_548294 ?auto_548295 ) ) ( not ( = ?auto_548294 ?auto_548296 ) ) ( not ( = ?auto_548294 ?auto_548297 ) ) ( not ( = ?auto_548294 ?auto_548298 ) ) ( not ( = ?auto_548294 ?auto_548299 ) ) ( not ( = ?auto_548295 ?auto_548296 ) ) ( not ( = ?auto_548295 ?auto_548297 ) ) ( not ( = ?auto_548295 ?auto_548298 ) ) ( not ( = ?auto_548295 ?auto_548299 ) ) ( not ( = ?auto_548296 ?auto_548297 ) ) ( not ( = ?auto_548296 ?auto_548298 ) ) ( not ( = ?auto_548296 ?auto_548299 ) ) ( not ( = ?auto_548297 ?auto_548298 ) ) ( not ( = ?auto_548297 ?auto_548299 ) ) ( not ( = ?auto_548298 ?auto_548299 ) ) ( ON ?auto_548297 ?auto_548298 ) ( ON ?auto_548296 ?auto_548297 ) ( CLEAR ?auto_548294 ) ( ON ?auto_548295 ?auto_548296 ) ( CLEAR ?auto_548295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_548288 ?auto_548289 ?auto_548290 ?auto_548291 ?auto_548292 ?auto_548293 ?auto_548294 ?auto_548295 )
      ( MAKE-11PILE ?auto_548288 ?auto_548289 ?auto_548290 ?auto_548291 ?auto_548292 ?auto_548293 ?auto_548294 ?auto_548295 ?auto_548296 ?auto_548297 ?auto_548298 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_548334 - BLOCK
      ?auto_548335 - BLOCK
      ?auto_548336 - BLOCK
      ?auto_548337 - BLOCK
      ?auto_548338 - BLOCK
      ?auto_548339 - BLOCK
      ?auto_548340 - BLOCK
      ?auto_548341 - BLOCK
      ?auto_548342 - BLOCK
      ?auto_548343 - BLOCK
      ?auto_548344 - BLOCK
    )
    :vars
    (
      ?auto_548345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548344 ?auto_548345 ) ( ON-TABLE ?auto_548334 ) ( ON ?auto_548335 ?auto_548334 ) ( ON ?auto_548336 ?auto_548335 ) ( ON ?auto_548337 ?auto_548336 ) ( ON ?auto_548338 ?auto_548337 ) ( ON ?auto_548339 ?auto_548338 ) ( not ( = ?auto_548334 ?auto_548335 ) ) ( not ( = ?auto_548334 ?auto_548336 ) ) ( not ( = ?auto_548334 ?auto_548337 ) ) ( not ( = ?auto_548334 ?auto_548338 ) ) ( not ( = ?auto_548334 ?auto_548339 ) ) ( not ( = ?auto_548334 ?auto_548340 ) ) ( not ( = ?auto_548334 ?auto_548341 ) ) ( not ( = ?auto_548334 ?auto_548342 ) ) ( not ( = ?auto_548334 ?auto_548343 ) ) ( not ( = ?auto_548334 ?auto_548344 ) ) ( not ( = ?auto_548334 ?auto_548345 ) ) ( not ( = ?auto_548335 ?auto_548336 ) ) ( not ( = ?auto_548335 ?auto_548337 ) ) ( not ( = ?auto_548335 ?auto_548338 ) ) ( not ( = ?auto_548335 ?auto_548339 ) ) ( not ( = ?auto_548335 ?auto_548340 ) ) ( not ( = ?auto_548335 ?auto_548341 ) ) ( not ( = ?auto_548335 ?auto_548342 ) ) ( not ( = ?auto_548335 ?auto_548343 ) ) ( not ( = ?auto_548335 ?auto_548344 ) ) ( not ( = ?auto_548335 ?auto_548345 ) ) ( not ( = ?auto_548336 ?auto_548337 ) ) ( not ( = ?auto_548336 ?auto_548338 ) ) ( not ( = ?auto_548336 ?auto_548339 ) ) ( not ( = ?auto_548336 ?auto_548340 ) ) ( not ( = ?auto_548336 ?auto_548341 ) ) ( not ( = ?auto_548336 ?auto_548342 ) ) ( not ( = ?auto_548336 ?auto_548343 ) ) ( not ( = ?auto_548336 ?auto_548344 ) ) ( not ( = ?auto_548336 ?auto_548345 ) ) ( not ( = ?auto_548337 ?auto_548338 ) ) ( not ( = ?auto_548337 ?auto_548339 ) ) ( not ( = ?auto_548337 ?auto_548340 ) ) ( not ( = ?auto_548337 ?auto_548341 ) ) ( not ( = ?auto_548337 ?auto_548342 ) ) ( not ( = ?auto_548337 ?auto_548343 ) ) ( not ( = ?auto_548337 ?auto_548344 ) ) ( not ( = ?auto_548337 ?auto_548345 ) ) ( not ( = ?auto_548338 ?auto_548339 ) ) ( not ( = ?auto_548338 ?auto_548340 ) ) ( not ( = ?auto_548338 ?auto_548341 ) ) ( not ( = ?auto_548338 ?auto_548342 ) ) ( not ( = ?auto_548338 ?auto_548343 ) ) ( not ( = ?auto_548338 ?auto_548344 ) ) ( not ( = ?auto_548338 ?auto_548345 ) ) ( not ( = ?auto_548339 ?auto_548340 ) ) ( not ( = ?auto_548339 ?auto_548341 ) ) ( not ( = ?auto_548339 ?auto_548342 ) ) ( not ( = ?auto_548339 ?auto_548343 ) ) ( not ( = ?auto_548339 ?auto_548344 ) ) ( not ( = ?auto_548339 ?auto_548345 ) ) ( not ( = ?auto_548340 ?auto_548341 ) ) ( not ( = ?auto_548340 ?auto_548342 ) ) ( not ( = ?auto_548340 ?auto_548343 ) ) ( not ( = ?auto_548340 ?auto_548344 ) ) ( not ( = ?auto_548340 ?auto_548345 ) ) ( not ( = ?auto_548341 ?auto_548342 ) ) ( not ( = ?auto_548341 ?auto_548343 ) ) ( not ( = ?auto_548341 ?auto_548344 ) ) ( not ( = ?auto_548341 ?auto_548345 ) ) ( not ( = ?auto_548342 ?auto_548343 ) ) ( not ( = ?auto_548342 ?auto_548344 ) ) ( not ( = ?auto_548342 ?auto_548345 ) ) ( not ( = ?auto_548343 ?auto_548344 ) ) ( not ( = ?auto_548343 ?auto_548345 ) ) ( not ( = ?auto_548344 ?auto_548345 ) ) ( ON ?auto_548343 ?auto_548344 ) ( ON ?auto_548342 ?auto_548343 ) ( ON ?auto_548341 ?auto_548342 ) ( CLEAR ?auto_548339 ) ( ON ?auto_548340 ?auto_548341 ) ( CLEAR ?auto_548340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_548334 ?auto_548335 ?auto_548336 ?auto_548337 ?auto_548338 ?auto_548339 ?auto_548340 )
      ( MAKE-11PILE ?auto_548334 ?auto_548335 ?auto_548336 ?auto_548337 ?auto_548338 ?auto_548339 ?auto_548340 ?auto_548341 ?auto_548342 ?auto_548343 ?auto_548344 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_548380 - BLOCK
      ?auto_548381 - BLOCK
      ?auto_548382 - BLOCK
      ?auto_548383 - BLOCK
      ?auto_548384 - BLOCK
      ?auto_548385 - BLOCK
      ?auto_548386 - BLOCK
      ?auto_548387 - BLOCK
      ?auto_548388 - BLOCK
      ?auto_548389 - BLOCK
      ?auto_548390 - BLOCK
    )
    :vars
    (
      ?auto_548391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548390 ?auto_548391 ) ( ON-TABLE ?auto_548380 ) ( ON ?auto_548381 ?auto_548380 ) ( ON ?auto_548382 ?auto_548381 ) ( ON ?auto_548383 ?auto_548382 ) ( ON ?auto_548384 ?auto_548383 ) ( not ( = ?auto_548380 ?auto_548381 ) ) ( not ( = ?auto_548380 ?auto_548382 ) ) ( not ( = ?auto_548380 ?auto_548383 ) ) ( not ( = ?auto_548380 ?auto_548384 ) ) ( not ( = ?auto_548380 ?auto_548385 ) ) ( not ( = ?auto_548380 ?auto_548386 ) ) ( not ( = ?auto_548380 ?auto_548387 ) ) ( not ( = ?auto_548380 ?auto_548388 ) ) ( not ( = ?auto_548380 ?auto_548389 ) ) ( not ( = ?auto_548380 ?auto_548390 ) ) ( not ( = ?auto_548380 ?auto_548391 ) ) ( not ( = ?auto_548381 ?auto_548382 ) ) ( not ( = ?auto_548381 ?auto_548383 ) ) ( not ( = ?auto_548381 ?auto_548384 ) ) ( not ( = ?auto_548381 ?auto_548385 ) ) ( not ( = ?auto_548381 ?auto_548386 ) ) ( not ( = ?auto_548381 ?auto_548387 ) ) ( not ( = ?auto_548381 ?auto_548388 ) ) ( not ( = ?auto_548381 ?auto_548389 ) ) ( not ( = ?auto_548381 ?auto_548390 ) ) ( not ( = ?auto_548381 ?auto_548391 ) ) ( not ( = ?auto_548382 ?auto_548383 ) ) ( not ( = ?auto_548382 ?auto_548384 ) ) ( not ( = ?auto_548382 ?auto_548385 ) ) ( not ( = ?auto_548382 ?auto_548386 ) ) ( not ( = ?auto_548382 ?auto_548387 ) ) ( not ( = ?auto_548382 ?auto_548388 ) ) ( not ( = ?auto_548382 ?auto_548389 ) ) ( not ( = ?auto_548382 ?auto_548390 ) ) ( not ( = ?auto_548382 ?auto_548391 ) ) ( not ( = ?auto_548383 ?auto_548384 ) ) ( not ( = ?auto_548383 ?auto_548385 ) ) ( not ( = ?auto_548383 ?auto_548386 ) ) ( not ( = ?auto_548383 ?auto_548387 ) ) ( not ( = ?auto_548383 ?auto_548388 ) ) ( not ( = ?auto_548383 ?auto_548389 ) ) ( not ( = ?auto_548383 ?auto_548390 ) ) ( not ( = ?auto_548383 ?auto_548391 ) ) ( not ( = ?auto_548384 ?auto_548385 ) ) ( not ( = ?auto_548384 ?auto_548386 ) ) ( not ( = ?auto_548384 ?auto_548387 ) ) ( not ( = ?auto_548384 ?auto_548388 ) ) ( not ( = ?auto_548384 ?auto_548389 ) ) ( not ( = ?auto_548384 ?auto_548390 ) ) ( not ( = ?auto_548384 ?auto_548391 ) ) ( not ( = ?auto_548385 ?auto_548386 ) ) ( not ( = ?auto_548385 ?auto_548387 ) ) ( not ( = ?auto_548385 ?auto_548388 ) ) ( not ( = ?auto_548385 ?auto_548389 ) ) ( not ( = ?auto_548385 ?auto_548390 ) ) ( not ( = ?auto_548385 ?auto_548391 ) ) ( not ( = ?auto_548386 ?auto_548387 ) ) ( not ( = ?auto_548386 ?auto_548388 ) ) ( not ( = ?auto_548386 ?auto_548389 ) ) ( not ( = ?auto_548386 ?auto_548390 ) ) ( not ( = ?auto_548386 ?auto_548391 ) ) ( not ( = ?auto_548387 ?auto_548388 ) ) ( not ( = ?auto_548387 ?auto_548389 ) ) ( not ( = ?auto_548387 ?auto_548390 ) ) ( not ( = ?auto_548387 ?auto_548391 ) ) ( not ( = ?auto_548388 ?auto_548389 ) ) ( not ( = ?auto_548388 ?auto_548390 ) ) ( not ( = ?auto_548388 ?auto_548391 ) ) ( not ( = ?auto_548389 ?auto_548390 ) ) ( not ( = ?auto_548389 ?auto_548391 ) ) ( not ( = ?auto_548390 ?auto_548391 ) ) ( ON ?auto_548389 ?auto_548390 ) ( ON ?auto_548388 ?auto_548389 ) ( ON ?auto_548387 ?auto_548388 ) ( ON ?auto_548386 ?auto_548387 ) ( CLEAR ?auto_548384 ) ( ON ?auto_548385 ?auto_548386 ) ( CLEAR ?auto_548385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_548380 ?auto_548381 ?auto_548382 ?auto_548383 ?auto_548384 ?auto_548385 )
      ( MAKE-11PILE ?auto_548380 ?auto_548381 ?auto_548382 ?auto_548383 ?auto_548384 ?auto_548385 ?auto_548386 ?auto_548387 ?auto_548388 ?auto_548389 ?auto_548390 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_548426 - BLOCK
      ?auto_548427 - BLOCK
      ?auto_548428 - BLOCK
      ?auto_548429 - BLOCK
      ?auto_548430 - BLOCK
      ?auto_548431 - BLOCK
      ?auto_548432 - BLOCK
      ?auto_548433 - BLOCK
      ?auto_548434 - BLOCK
      ?auto_548435 - BLOCK
      ?auto_548436 - BLOCK
    )
    :vars
    (
      ?auto_548437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548436 ?auto_548437 ) ( ON-TABLE ?auto_548426 ) ( ON ?auto_548427 ?auto_548426 ) ( ON ?auto_548428 ?auto_548427 ) ( ON ?auto_548429 ?auto_548428 ) ( not ( = ?auto_548426 ?auto_548427 ) ) ( not ( = ?auto_548426 ?auto_548428 ) ) ( not ( = ?auto_548426 ?auto_548429 ) ) ( not ( = ?auto_548426 ?auto_548430 ) ) ( not ( = ?auto_548426 ?auto_548431 ) ) ( not ( = ?auto_548426 ?auto_548432 ) ) ( not ( = ?auto_548426 ?auto_548433 ) ) ( not ( = ?auto_548426 ?auto_548434 ) ) ( not ( = ?auto_548426 ?auto_548435 ) ) ( not ( = ?auto_548426 ?auto_548436 ) ) ( not ( = ?auto_548426 ?auto_548437 ) ) ( not ( = ?auto_548427 ?auto_548428 ) ) ( not ( = ?auto_548427 ?auto_548429 ) ) ( not ( = ?auto_548427 ?auto_548430 ) ) ( not ( = ?auto_548427 ?auto_548431 ) ) ( not ( = ?auto_548427 ?auto_548432 ) ) ( not ( = ?auto_548427 ?auto_548433 ) ) ( not ( = ?auto_548427 ?auto_548434 ) ) ( not ( = ?auto_548427 ?auto_548435 ) ) ( not ( = ?auto_548427 ?auto_548436 ) ) ( not ( = ?auto_548427 ?auto_548437 ) ) ( not ( = ?auto_548428 ?auto_548429 ) ) ( not ( = ?auto_548428 ?auto_548430 ) ) ( not ( = ?auto_548428 ?auto_548431 ) ) ( not ( = ?auto_548428 ?auto_548432 ) ) ( not ( = ?auto_548428 ?auto_548433 ) ) ( not ( = ?auto_548428 ?auto_548434 ) ) ( not ( = ?auto_548428 ?auto_548435 ) ) ( not ( = ?auto_548428 ?auto_548436 ) ) ( not ( = ?auto_548428 ?auto_548437 ) ) ( not ( = ?auto_548429 ?auto_548430 ) ) ( not ( = ?auto_548429 ?auto_548431 ) ) ( not ( = ?auto_548429 ?auto_548432 ) ) ( not ( = ?auto_548429 ?auto_548433 ) ) ( not ( = ?auto_548429 ?auto_548434 ) ) ( not ( = ?auto_548429 ?auto_548435 ) ) ( not ( = ?auto_548429 ?auto_548436 ) ) ( not ( = ?auto_548429 ?auto_548437 ) ) ( not ( = ?auto_548430 ?auto_548431 ) ) ( not ( = ?auto_548430 ?auto_548432 ) ) ( not ( = ?auto_548430 ?auto_548433 ) ) ( not ( = ?auto_548430 ?auto_548434 ) ) ( not ( = ?auto_548430 ?auto_548435 ) ) ( not ( = ?auto_548430 ?auto_548436 ) ) ( not ( = ?auto_548430 ?auto_548437 ) ) ( not ( = ?auto_548431 ?auto_548432 ) ) ( not ( = ?auto_548431 ?auto_548433 ) ) ( not ( = ?auto_548431 ?auto_548434 ) ) ( not ( = ?auto_548431 ?auto_548435 ) ) ( not ( = ?auto_548431 ?auto_548436 ) ) ( not ( = ?auto_548431 ?auto_548437 ) ) ( not ( = ?auto_548432 ?auto_548433 ) ) ( not ( = ?auto_548432 ?auto_548434 ) ) ( not ( = ?auto_548432 ?auto_548435 ) ) ( not ( = ?auto_548432 ?auto_548436 ) ) ( not ( = ?auto_548432 ?auto_548437 ) ) ( not ( = ?auto_548433 ?auto_548434 ) ) ( not ( = ?auto_548433 ?auto_548435 ) ) ( not ( = ?auto_548433 ?auto_548436 ) ) ( not ( = ?auto_548433 ?auto_548437 ) ) ( not ( = ?auto_548434 ?auto_548435 ) ) ( not ( = ?auto_548434 ?auto_548436 ) ) ( not ( = ?auto_548434 ?auto_548437 ) ) ( not ( = ?auto_548435 ?auto_548436 ) ) ( not ( = ?auto_548435 ?auto_548437 ) ) ( not ( = ?auto_548436 ?auto_548437 ) ) ( ON ?auto_548435 ?auto_548436 ) ( ON ?auto_548434 ?auto_548435 ) ( ON ?auto_548433 ?auto_548434 ) ( ON ?auto_548432 ?auto_548433 ) ( ON ?auto_548431 ?auto_548432 ) ( CLEAR ?auto_548429 ) ( ON ?auto_548430 ?auto_548431 ) ( CLEAR ?auto_548430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_548426 ?auto_548427 ?auto_548428 ?auto_548429 ?auto_548430 )
      ( MAKE-11PILE ?auto_548426 ?auto_548427 ?auto_548428 ?auto_548429 ?auto_548430 ?auto_548431 ?auto_548432 ?auto_548433 ?auto_548434 ?auto_548435 ?auto_548436 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_548472 - BLOCK
      ?auto_548473 - BLOCK
      ?auto_548474 - BLOCK
      ?auto_548475 - BLOCK
      ?auto_548476 - BLOCK
      ?auto_548477 - BLOCK
      ?auto_548478 - BLOCK
      ?auto_548479 - BLOCK
      ?auto_548480 - BLOCK
      ?auto_548481 - BLOCK
      ?auto_548482 - BLOCK
    )
    :vars
    (
      ?auto_548483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548482 ?auto_548483 ) ( ON-TABLE ?auto_548472 ) ( ON ?auto_548473 ?auto_548472 ) ( ON ?auto_548474 ?auto_548473 ) ( not ( = ?auto_548472 ?auto_548473 ) ) ( not ( = ?auto_548472 ?auto_548474 ) ) ( not ( = ?auto_548472 ?auto_548475 ) ) ( not ( = ?auto_548472 ?auto_548476 ) ) ( not ( = ?auto_548472 ?auto_548477 ) ) ( not ( = ?auto_548472 ?auto_548478 ) ) ( not ( = ?auto_548472 ?auto_548479 ) ) ( not ( = ?auto_548472 ?auto_548480 ) ) ( not ( = ?auto_548472 ?auto_548481 ) ) ( not ( = ?auto_548472 ?auto_548482 ) ) ( not ( = ?auto_548472 ?auto_548483 ) ) ( not ( = ?auto_548473 ?auto_548474 ) ) ( not ( = ?auto_548473 ?auto_548475 ) ) ( not ( = ?auto_548473 ?auto_548476 ) ) ( not ( = ?auto_548473 ?auto_548477 ) ) ( not ( = ?auto_548473 ?auto_548478 ) ) ( not ( = ?auto_548473 ?auto_548479 ) ) ( not ( = ?auto_548473 ?auto_548480 ) ) ( not ( = ?auto_548473 ?auto_548481 ) ) ( not ( = ?auto_548473 ?auto_548482 ) ) ( not ( = ?auto_548473 ?auto_548483 ) ) ( not ( = ?auto_548474 ?auto_548475 ) ) ( not ( = ?auto_548474 ?auto_548476 ) ) ( not ( = ?auto_548474 ?auto_548477 ) ) ( not ( = ?auto_548474 ?auto_548478 ) ) ( not ( = ?auto_548474 ?auto_548479 ) ) ( not ( = ?auto_548474 ?auto_548480 ) ) ( not ( = ?auto_548474 ?auto_548481 ) ) ( not ( = ?auto_548474 ?auto_548482 ) ) ( not ( = ?auto_548474 ?auto_548483 ) ) ( not ( = ?auto_548475 ?auto_548476 ) ) ( not ( = ?auto_548475 ?auto_548477 ) ) ( not ( = ?auto_548475 ?auto_548478 ) ) ( not ( = ?auto_548475 ?auto_548479 ) ) ( not ( = ?auto_548475 ?auto_548480 ) ) ( not ( = ?auto_548475 ?auto_548481 ) ) ( not ( = ?auto_548475 ?auto_548482 ) ) ( not ( = ?auto_548475 ?auto_548483 ) ) ( not ( = ?auto_548476 ?auto_548477 ) ) ( not ( = ?auto_548476 ?auto_548478 ) ) ( not ( = ?auto_548476 ?auto_548479 ) ) ( not ( = ?auto_548476 ?auto_548480 ) ) ( not ( = ?auto_548476 ?auto_548481 ) ) ( not ( = ?auto_548476 ?auto_548482 ) ) ( not ( = ?auto_548476 ?auto_548483 ) ) ( not ( = ?auto_548477 ?auto_548478 ) ) ( not ( = ?auto_548477 ?auto_548479 ) ) ( not ( = ?auto_548477 ?auto_548480 ) ) ( not ( = ?auto_548477 ?auto_548481 ) ) ( not ( = ?auto_548477 ?auto_548482 ) ) ( not ( = ?auto_548477 ?auto_548483 ) ) ( not ( = ?auto_548478 ?auto_548479 ) ) ( not ( = ?auto_548478 ?auto_548480 ) ) ( not ( = ?auto_548478 ?auto_548481 ) ) ( not ( = ?auto_548478 ?auto_548482 ) ) ( not ( = ?auto_548478 ?auto_548483 ) ) ( not ( = ?auto_548479 ?auto_548480 ) ) ( not ( = ?auto_548479 ?auto_548481 ) ) ( not ( = ?auto_548479 ?auto_548482 ) ) ( not ( = ?auto_548479 ?auto_548483 ) ) ( not ( = ?auto_548480 ?auto_548481 ) ) ( not ( = ?auto_548480 ?auto_548482 ) ) ( not ( = ?auto_548480 ?auto_548483 ) ) ( not ( = ?auto_548481 ?auto_548482 ) ) ( not ( = ?auto_548481 ?auto_548483 ) ) ( not ( = ?auto_548482 ?auto_548483 ) ) ( ON ?auto_548481 ?auto_548482 ) ( ON ?auto_548480 ?auto_548481 ) ( ON ?auto_548479 ?auto_548480 ) ( ON ?auto_548478 ?auto_548479 ) ( ON ?auto_548477 ?auto_548478 ) ( ON ?auto_548476 ?auto_548477 ) ( CLEAR ?auto_548474 ) ( ON ?auto_548475 ?auto_548476 ) ( CLEAR ?auto_548475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_548472 ?auto_548473 ?auto_548474 ?auto_548475 )
      ( MAKE-11PILE ?auto_548472 ?auto_548473 ?auto_548474 ?auto_548475 ?auto_548476 ?auto_548477 ?auto_548478 ?auto_548479 ?auto_548480 ?auto_548481 ?auto_548482 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_548518 - BLOCK
      ?auto_548519 - BLOCK
      ?auto_548520 - BLOCK
      ?auto_548521 - BLOCK
      ?auto_548522 - BLOCK
      ?auto_548523 - BLOCK
      ?auto_548524 - BLOCK
      ?auto_548525 - BLOCK
      ?auto_548526 - BLOCK
      ?auto_548527 - BLOCK
      ?auto_548528 - BLOCK
    )
    :vars
    (
      ?auto_548529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548528 ?auto_548529 ) ( ON-TABLE ?auto_548518 ) ( ON ?auto_548519 ?auto_548518 ) ( not ( = ?auto_548518 ?auto_548519 ) ) ( not ( = ?auto_548518 ?auto_548520 ) ) ( not ( = ?auto_548518 ?auto_548521 ) ) ( not ( = ?auto_548518 ?auto_548522 ) ) ( not ( = ?auto_548518 ?auto_548523 ) ) ( not ( = ?auto_548518 ?auto_548524 ) ) ( not ( = ?auto_548518 ?auto_548525 ) ) ( not ( = ?auto_548518 ?auto_548526 ) ) ( not ( = ?auto_548518 ?auto_548527 ) ) ( not ( = ?auto_548518 ?auto_548528 ) ) ( not ( = ?auto_548518 ?auto_548529 ) ) ( not ( = ?auto_548519 ?auto_548520 ) ) ( not ( = ?auto_548519 ?auto_548521 ) ) ( not ( = ?auto_548519 ?auto_548522 ) ) ( not ( = ?auto_548519 ?auto_548523 ) ) ( not ( = ?auto_548519 ?auto_548524 ) ) ( not ( = ?auto_548519 ?auto_548525 ) ) ( not ( = ?auto_548519 ?auto_548526 ) ) ( not ( = ?auto_548519 ?auto_548527 ) ) ( not ( = ?auto_548519 ?auto_548528 ) ) ( not ( = ?auto_548519 ?auto_548529 ) ) ( not ( = ?auto_548520 ?auto_548521 ) ) ( not ( = ?auto_548520 ?auto_548522 ) ) ( not ( = ?auto_548520 ?auto_548523 ) ) ( not ( = ?auto_548520 ?auto_548524 ) ) ( not ( = ?auto_548520 ?auto_548525 ) ) ( not ( = ?auto_548520 ?auto_548526 ) ) ( not ( = ?auto_548520 ?auto_548527 ) ) ( not ( = ?auto_548520 ?auto_548528 ) ) ( not ( = ?auto_548520 ?auto_548529 ) ) ( not ( = ?auto_548521 ?auto_548522 ) ) ( not ( = ?auto_548521 ?auto_548523 ) ) ( not ( = ?auto_548521 ?auto_548524 ) ) ( not ( = ?auto_548521 ?auto_548525 ) ) ( not ( = ?auto_548521 ?auto_548526 ) ) ( not ( = ?auto_548521 ?auto_548527 ) ) ( not ( = ?auto_548521 ?auto_548528 ) ) ( not ( = ?auto_548521 ?auto_548529 ) ) ( not ( = ?auto_548522 ?auto_548523 ) ) ( not ( = ?auto_548522 ?auto_548524 ) ) ( not ( = ?auto_548522 ?auto_548525 ) ) ( not ( = ?auto_548522 ?auto_548526 ) ) ( not ( = ?auto_548522 ?auto_548527 ) ) ( not ( = ?auto_548522 ?auto_548528 ) ) ( not ( = ?auto_548522 ?auto_548529 ) ) ( not ( = ?auto_548523 ?auto_548524 ) ) ( not ( = ?auto_548523 ?auto_548525 ) ) ( not ( = ?auto_548523 ?auto_548526 ) ) ( not ( = ?auto_548523 ?auto_548527 ) ) ( not ( = ?auto_548523 ?auto_548528 ) ) ( not ( = ?auto_548523 ?auto_548529 ) ) ( not ( = ?auto_548524 ?auto_548525 ) ) ( not ( = ?auto_548524 ?auto_548526 ) ) ( not ( = ?auto_548524 ?auto_548527 ) ) ( not ( = ?auto_548524 ?auto_548528 ) ) ( not ( = ?auto_548524 ?auto_548529 ) ) ( not ( = ?auto_548525 ?auto_548526 ) ) ( not ( = ?auto_548525 ?auto_548527 ) ) ( not ( = ?auto_548525 ?auto_548528 ) ) ( not ( = ?auto_548525 ?auto_548529 ) ) ( not ( = ?auto_548526 ?auto_548527 ) ) ( not ( = ?auto_548526 ?auto_548528 ) ) ( not ( = ?auto_548526 ?auto_548529 ) ) ( not ( = ?auto_548527 ?auto_548528 ) ) ( not ( = ?auto_548527 ?auto_548529 ) ) ( not ( = ?auto_548528 ?auto_548529 ) ) ( ON ?auto_548527 ?auto_548528 ) ( ON ?auto_548526 ?auto_548527 ) ( ON ?auto_548525 ?auto_548526 ) ( ON ?auto_548524 ?auto_548525 ) ( ON ?auto_548523 ?auto_548524 ) ( ON ?auto_548522 ?auto_548523 ) ( ON ?auto_548521 ?auto_548522 ) ( CLEAR ?auto_548519 ) ( ON ?auto_548520 ?auto_548521 ) ( CLEAR ?auto_548520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_548518 ?auto_548519 ?auto_548520 )
      ( MAKE-11PILE ?auto_548518 ?auto_548519 ?auto_548520 ?auto_548521 ?auto_548522 ?auto_548523 ?auto_548524 ?auto_548525 ?auto_548526 ?auto_548527 ?auto_548528 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_548564 - BLOCK
      ?auto_548565 - BLOCK
      ?auto_548566 - BLOCK
      ?auto_548567 - BLOCK
      ?auto_548568 - BLOCK
      ?auto_548569 - BLOCK
      ?auto_548570 - BLOCK
      ?auto_548571 - BLOCK
      ?auto_548572 - BLOCK
      ?auto_548573 - BLOCK
      ?auto_548574 - BLOCK
    )
    :vars
    (
      ?auto_548575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548574 ?auto_548575 ) ( ON-TABLE ?auto_548564 ) ( not ( = ?auto_548564 ?auto_548565 ) ) ( not ( = ?auto_548564 ?auto_548566 ) ) ( not ( = ?auto_548564 ?auto_548567 ) ) ( not ( = ?auto_548564 ?auto_548568 ) ) ( not ( = ?auto_548564 ?auto_548569 ) ) ( not ( = ?auto_548564 ?auto_548570 ) ) ( not ( = ?auto_548564 ?auto_548571 ) ) ( not ( = ?auto_548564 ?auto_548572 ) ) ( not ( = ?auto_548564 ?auto_548573 ) ) ( not ( = ?auto_548564 ?auto_548574 ) ) ( not ( = ?auto_548564 ?auto_548575 ) ) ( not ( = ?auto_548565 ?auto_548566 ) ) ( not ( = ?auto_548565 ?auto_548567 ) ) ( not ( = ?auto_548565 ?auto_548568 ) ) ( not ( = ?auto_548565 ?auto_548569 ) ) ( not ( = ?auto_548565 ?auto_548570 ) ) ( not ( = ?auto_548565 ?auto_548571 ) ) ( not ( = ?auto_548565 ?auto_548572 ) ) ( not ( = ?auto_548565 ?auto_548573 ) ) ( not ( = ?auto_548565 ?auto_548574 ) ) ( not ( = ?auto_548565 ?auto_548575 ) ) ( not ( = ?auto_548566 ?auto_548567 ) ) ( not ( = ?auto_548566 ?auto_548568 ) ) ( not ( = ?auto_548566 ?auto_548569 ) ) ( not ( = ?auto_548566 ?auto_548570 ) ) ( not ( = ?auto_548566 ?auto_548571 ) ) ( not ( = ?auto_548566 ?auto_548572 ) ) ( not ( = ?auto_548566 ?auto_548573 ) ) ( not ( = ?auto_548566 ?auto_548574 ) ) ( not ( = ?auto_548566 ?auto_548575 ) ) ( not ( = ?auto_548567 ?auto_548568 ) ) ( not ( = ?auto_548567 ?auto_548569 ) ) ( not ( = ?auto_548567 ?auto_548570 ) ) ( not ( = ?auto_548567 ?auto_548571 ) ) ( not ( = ?auto_548567 ?auto_548572 ) ) ( not ( = ?auto_548567 ?auto_548573 ) ) ( not ( = ?auto_548567 ?auto_548574 ) ) ( not ( = ?auto_548567 ?auto_548575 ) ) ( not ( = ?auto_548568 ?auto_548569 ) ) ( not ( = ?auto_548568 ?auto_548570 ) ) ( not ( = ?auto_548568 ?auto_548571 ) ) ( not ( = ?auto_548568 ?auto_548572 ) ) ( not ( = ?auto_548568 ?auto_548573 ) ) ( not ( = ?auto_548568 ?auto_548574 ) ) ( not ( = ?auto_548568 ?auto_548575 ) ) ( not ( = ?auto_548569 ?auto_548570 ) ) ( not ( = ?auto_548569 ?auto_548571 ) ) ( not ( = ?auto_548569 ?auto_548572 ) ) ( not ( = ?auto_548569 ?auto_548573 ) ) ( not ( = ?auto_548569 ?auto_548574 ) ) ( not ( = ?auto_548569 ?auto_548575 ) ) ( not ( = ?auto_548570 ?auto_548571 ) ) ( not ( = ?auto_548570 ?auto_548572 ) ) ( not ( = ?auto_548570 ?auto_548573 ) ) ( not ( = ?auto_548570 ?auto_548574 ) ) ( not ( = ?auto_548570 ?auto_548575 ) ) ( not ( = ?auto_548571 ?auto_548572 ) ) ( not ( = ?auto_548571 ?auto_548573 ) ) ( not ( = ?auto_548571 ?auto_548574 ) ) ( not ( = ?auto_548571 ?auto_548575 ) ) ( not ( = ?auto_548572 ?auto_548573 ) ) ( not ( = ?auto_548572 ?auto_548574 ) ) ( not ( = ?auto_548572 ?auto_548575 ) ) ( not ( = ?auto_548573 ?auto_548574 ) ) ( not ( = ?auto_548573 ?auto_548575 ) ) ( not ( = ?auto_548574 ?auto_548575 ) ) ( ON ?auto_548573 ?auto_548574 ) ( ON ?auto_548572 ?auto_548573 ) ( ON ?auto_548571 ?auto_548572 ) ( ON ?auto_548570 ?auto_548571 ) ( ON ?auto_548569 ?auto_548570 ) ( ON ?auto_548568 ?auto_548569 ) ( ON ?auto_548567 ?auto_548568 ) ( ON ?auto_548566 ?auto_548567 ) ( CLEAR ?auto_548564 ) ( ON ?auto_548565 ?auto_548566 ) ( CLEAR ?auto_548565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_548564 ?auto_548565 )
      ( MAKE-11PILE ?auto_548564 ?auto_548565 ?auto_548566 ?auto_548567 ?auto_548568 ?auto_548569 ?auto_548570 ?auto_548571 ?auto_548572 ?auto_548573 ?auto_548574 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_548610 - BLOCK
      ?auto_548611 - BLOCK
      ?auto_548612 - BLOCK
      ?auto_548613 - BLOCK
      ?auto_548614 - BLOCK
      ?auto_548615 - BLOCK
      ?auto_548616 - BLOCK
      ?auto_548617 - BLOCK
      ?auto_548618 - BLOCK
      ?auto_548619 - BLOCK
      ?auto_548620 - BLOCK
    )
    :vars
    (
      ?auto_548621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548620 ?auto_548621 ) ( not ( = ?auto_548610 ?auto_548611 ) ) ( not ( = ?auto_548610 ?auto_548612 ) ) ( not ( = ?auto_548610 ?auto_548613 ) ) ( not ( = ?auto_548610 ?auto_548614 ) ) ( not ( = ?auto_548610 ?auto_548615 ) ) ( not ( = ?auto_548610 ?auto_548616 ) ) ( not ( = ?auto_548610 ?auto_548617 ) ) ( not ( = ?auto_548610 ?auto_548618 ) ) ( not ( = ?auto_548610 ?auto_548619 ) ) ( not ( = ?auto_548610 ?auto_548620 ) ) ( not ( = ?auto_548610 ?auto_548621 ) ) ( not ( = ?auto_548611 ?auto_548612 ) ) ( not ( = ?auto_548611 ?auto_548613 ) ) ( not ( = ?auto_548611 ?auto_548614 ) ) ( not ( = ?auto_548611 ?auto_548615 ) ) ( not ( = ?auto_548611 ?auto_548616 ) ) ( not ( = ?auto_548611 ?auto_548617 ) ) ( not ( = ?auto_548611 ?auto_548618 ) ) ( not ( = ?auto_548611 ?auto_548619 ) ) ( not ( = ?auto_548611 ?auto_548620 ) ) ( not ( = ?auto_548611 ?auto_548621 ) ) ( not ( = ?auto_548612 ?auto_548613 ) ) ( not ( = ?auto_548612 ?auto_548614 ) ) ( not ( = ?auto_548612 ?auto_548615 ) ) ( not ( = ?auto_548612 ?auto_548616 ) ) ( not ( = ?auto_548612 ?auto_548617 ) ) ( not ( = ?auto_548612 ?auto_548618 ) ) ( not ( = ?auto_548612 ?auto_548619 ) ) ( not ( = ?auto_548612 ?auto_548620 ) ) ( not ( = ?auto_548612 ?auto_548621 ) ) ( not ( = ?auto_548613 ?auto_548614 ) ) ( not ( = ?auto_548613 ?auto_548615 ) ) ( not ( = ?auto_548613 ?auto_548616 ) ) ( not ( = ?auto_548613 ?auto_548617 ) ) ( not ( = ?auto_548613 ?auto_548618 ) ) ( not ( = ?auto_548613 ?auto_548619 ) ) ( not ( = ?auto_548613 ?auto_548620 ) ) ( not ( = ?auto_548613 ?auto_548621 ) ) ( not ( = ?auto_548614 ?auto_548615 ) ) ( not ( = ?auto_548614 ?auto_548616 ) ) ( not ( = ?auto_548614 ?auto_548617 ) ) ( not ( = ?auto_548614 ?auto_548618 ) ) ( not ( = ?auto_548614 ?auto_548619 ) ) ( not ( = ?auto_548614 ?auto_548620 ) ) ( not ( = ?auto_548614 ?auto_548621 ) ) ( not ( = ?auto_548615 ?auto_548616 ) ) ( not ( = ?auto_548615 ?auto_548617 ) ) ( not ( = ?auto_548615 ?auto_548618 ) ) ( not ( = ?auto_548615 ?auto_548619 ) ) ( not ( = ?auto_548615 ?auto_548620 ) ) ( not ( = ?auto_548615 ?auto_548621 ) ) ( not ( = ?auto_548616 ?auto_548617 ) ) ( not ( = ?auto_548616 ?auto_548618 ) ) ( not ( = ?auto_548616 ?auto_548619 ) ) ( not ( = ?auto_548616 ?auto_548620 ) ) ( not ( = ?auto_548616 ?auto_548621 ) ) ( not ( = ?auto_548617 ?auto_548618 ) ) ( not ( = ?auto_548617 ?auto_548619 ) ) ( not ( = ?auto_548617 ?auto_548620 ) ) ( not ( = ?auto_548617 ?auto_548621 ) ) ( not ( = ?auto_548618 ?auto_548619 ) ) ( not ( = ?auto_548618 ?auto_548620 ) ) ( not ( = ?auto_548618 ?auto_548621 ) ) ( not ( = ?auto_548619 ?auto_548620 ) ) ( not ( = ?auto_548619 ?auto_548621 ) ) ( not ( = ?auto_548620 ?auto_548621 ) ) ( ON ?auto_548619 ?auto_548620 ) ( ON ?auto_548618 ?auto_548619 ) ( ON ?auto_548617 ?auto_548618 ) ( ON ?auto_548616 ?auto_548617 ) ( ON ?auto_548615 ?auto_548616 ) ( ON ?auto_548614 ?auto_548615 ) ( ON ?auto_548613 ?auto_548614 ) ( ON ?auto_548612 ?auto_548613 ) ( ON ?auto_548611 ?auto_548612 ) ( ON ?auto_548610 ?auto_548611 ) ( CLEAR ?auto_548610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_548610 )
      ( MAKE-11PILE ?auto_548610 ?auto_548611 ?auto_548612 ?auto_548613 ?auto_548614 ?auto_548615 ?auto_548616 ?auto_548617 ?auto_548618 ?auto_548619 ?auto_548620 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_548657 - BLOCK
      ?auto_548658 - BLOCK
      ?auto_548659 - BLOCK
      ?auto_548660 - BLOCK
      ?auto_548661 - BLOCK
      ?auto_548662 - BLOCK
      ?auto_548663 - BLOCK
      ?auto_548664 - BLOCK
      ?auto_548665 - BLOCK
      ?auto_548666 - BLOCK
      ?auto_548667 - BLOCK
      ?auto_548668 - BLOCK
    )
    :vars
    (
      ?auto_548669 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_548667 ) ( ON ?auto_548668 ?auto_548669 ) ( CLEAR ?auto_548668 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_548657 ) ( ON ?auto_548658 ?auto_548657 ) ( ON ?auto_548659 ?auto_548658 ) ( ON ?auto_548660 ?auto_548659 ) ( ON ?auto_548661 ?auto_548660 ) ( ON ?auto_548662 ?auto_548661 ) ( ON ?auto_548663 ?auto_548662 ) ( ON ?auto_548664 ?auto_548663 ) ( ON ?auto_548665 ?auto_548664 ) ( ON ?auto_548666 ?auto_548665 ) ( ON ?auto_548667 ?auto_548666 ) ( not ( = ?auto_548657 ?auto_548658 ) ) ( not ( = ?auto_548657 ?auto_548659 ) ) ( not ( = ?auto_548657 ?auto_548660 ) ) ( not ( = ?auto_548657 ?auto_548661 ) ) ( not ( = ?auto_548657 ?auto_548662 ) ) ( not ( = ?auto_548657 ?auto_548663 ) ) ( not ( = ?auto_548657 ?auto_548664 ) ) ( not ( = ?auto_548657 ?auto_548665 ) ) ( not ( = ?auto_548657 ?auto_548666 ) ) ( not ( = ?auto_548657 ?auto_548667 ) ) ( not ( = ?auto_548657 ?auto_548668 ) ) ( not ( = ?auto_548657 ?auto_548669 ) ) ( not ( = ?auto_548658 ?auto_548659 ) ) ( not ( = ?auto_548658 ?auto_548660 ) ) ( not ( = ?auto_548658 ?auto_548661 ) ) ( not ( = ?auto_548658 ?auto_548662 ) ) ( not ( = ?auto_548658 ?auto_548663 ) ) ( not ( = ?auto_548658 ?auto_548664 ) ) ( not ( = ?auto_548658 ?auto_548665 ) ) ( not ( = ?auto_548658 ?auto_548666 ) ) ( not ( = ?auto_548658 ?auto_548667 ) ) ( not ( = ?auto_548658 ?auto_548668 ) ) ( not ( = ?auto_548658 ?auto_548669 ) ) ( not ( = ?auto_548659 ?auto_548660 ) ) ( not ( = ?auto_548659 ?auto_548661 ) ) ( not ( = ?auto_548659 ?auto_548662 ) ) ( not ( = ?auto_548659 ?auto_548663 ) ) ( not ( = ?auto_548659 ?auto_548664 ) ) ( not ( = ?auto_548659 ?auto_548665 ) ) ( not ( = ?auto_548659 ?auto_548666 ) ) ( not ( = ?auto_548659 ?auto_548667 ) ) ( not ( = ?auto_548659 ?auto_548668 ) ) ( not ( = ?auto_548659 ?auto_548669 ) ) ( not ( = ?auto_548660 ?auto_548661 ) ) ( not ( = ?auto_548660 ?auto_548662 ) ) ( not ( = ?auto_548660 ?auto_548663 ) ) ( not ( = ?auto_548660 ?auto_548664 ) ) ( not ( = ?auto_548660 ?auto_548665 ) ) ( not ( = ?auto_548660 ?auto_548666 ) ) ( not ( = ?auto_548660 ?auto_548667 ) ) ( not ( = ?auto_548660 ?auto_548668 ) ) ( not ( = ?auto_548660 ?auto_548669 ) ) ( not ( = ?auto_548661 ?auto_548662 ) ) ( not ( = ?auto_548661 ?auto_548663 ) ) ( not ( = ?auto_548661 ?auto_548664 ) ) ( not ( = ?auto_548661 ?auto_548665 ) ) ( not ( = ?auto_548661 ?auto_548666 ) ) ( not ( = ?auto_548661 ?auto_548667 ) ) ( not ( = ?auto_548661 ?auto_548668 ) ) ( not ( = ?auto_548661 ?auto_548669 ) ) ( not ( = ?auto_548662 ?auto_548663 ) ) ( not ( = ?auto_548662 ?auto_548664 ) ) ( not ( = ?auto_548662 ?auto_548665 ) ) ( not ( = ?auto_548662 ?auto_548666 ) ) ( not ( = ?auto_548662 ?auto_548667 ) ) ( not ( = ?auto_548662 ?auto_548668 ) ) ( not ( = ?auto_548662 ?auto_548669 ) ) ( not ( = ?auto_548663 ?auto_548664 ) ) ( not ( = ?auto_548663 ?auto_548665 ) ) ( not ( = ?auto_548663 ?auto_548666 ) ) ( not ( = ?auto_548663 ?auto_548667 ) ) ( not ( = ?auto_548663 ?auto_548668 ) ) ( not ( = ?auto_548663 ?auto_548669 ) ) ( not ( = ?auto_548664 ?auto_548665 ) ) ( not ( = ?auto_548664 ?auto_548666 ) ) ( not ( = ?auto_548664 ?auto_548667 ) ) ( not ( = ?auto_548664 ?auto_548668 ) ) ( not ( = ?auto_548664 ?auto_548669 ) ) ( not ( = ?auto_548665 ?auto_548666 ) ) ( not ( = ?auto_548665 ?auto_548667 ) ) ( not ( = ?auto_548665 ?auto_548668 ) ) ( not ( = ?auto_548665 ?auto_548669 ) ) ( not ( = ?auto_548666 ?auto_548667 ) ) ( not ( = ?auto_548666 ?auto_548668 ) ) ( not ( = ?auto_548666 ?auto_548669 ) ) ( not ( = ?auto_548667 ?auto_548668 ) ) ( not ( = ?auto_548667 ?auto_548669 ) ) ( not ( = ?auto_548668 ?auto_548669 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_548668 ?auto_548669 )
      ( !STACK ?auto_548668 ?auto_548667 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_548707 - BLOCK
      ?auto_548708 - BLOCK
      ?auto_548709 - BLOCK
      ?auto_548710 - BLOCK
      ?auto_548711 - BLOCK
      ?auto_548712 - BLOCK
      ?auto_548713 - BLOCK
      ?auto_548714 - BLOCK
      ?auto_548715 - BLOCK
      ?auto_548716 - BLOCK
      ?auto_548717 - BLOCK
      ?auto_548718 - BLOCK
    )
    :vars
    (
      ?auto_548719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548718 ?auto_548719 ) ( ON-TABLE ?auto_548707 ) ( ON ?auto_548708 ?auto_548707 ) ( ON ?auto_548709 ?auto_548708 ) ( ON ?auto_548710 ?auto_548709 ) ( ON ?auto_548711 ?auto_548710 ) ( ON ?auto_548712 ?auto_548711 ) ( ON ?auto_548713 ?auto_548712 ) ( ON ?auto_548714 ?auto_548713 ) ( ON ?auto_548715 ?auto_548714 ) ( ON ?auto_548716 ?auto_548715 ) ( not ( = ?auto_548707 ?auto_548708 ) ) ( not ( = ?auto_548707 ?auto_548709 ) ) ( not ( = ?auto_548707 ?auto_548710 ) ) ( not ( = ?auto_548707 ?auto_548711 ) ) ( not ( = ?auto_548707 ?auto_548712 ) ) ( not ( = ?auto_548707 ?auto_548713 ) ) ( not ( = ?auto_548707 ?auto_548714 ) ) ( not ( = ?auto_548707 ?auto_548715 ) ) ( not ( = ?auto_548707 ?auto_548716 ) ) ( not ( = ?auto_548707 ?auto_548717 ) ) ( not ( = ?auto_548707 ?auto_548718 ) ) ( not ( = ?auto_548707 ?auto_548719 ) ) ( not ( = ?auto_548708 ?auto_548709 ) ) ( not ( = ?auto_548708 ?auto_548710 ) ) ( not ( = ?auto_548708 ?auto_548711 ) ) ( not ( = ?auto_548708 ?auto_548712 ) ) ( not ( = ?auto_548708 ?auto_548713 ) ) ( not ( = ?auto_548708 ?auto_548714 ) ) ( not ( = ?auto_548708 ?auto_548715 ) ) ( not ( = ?auto_548708 ?auto_548716 ) ) ( not ( = ?auto_548708 ?auto_548717 ) ) ( not ( = ?auto_548708 ?auto_548718 ) ) ( not ( = ?auto_548708 ?auto_548719 ) ) ( not ( = ?auto_548709 ?auto_548710 ) ) ( not ( = ?auto_548709 ?auto_548711 ) ) ( not ( = ?auto_548709 ?auto_548712 ) ) ( not ( = ?auto_548709 ?auto_548713 ) ) ( not ( = ?auto_548709 ?auto_548714 ) ) ( not ( = ?auto_548709 ?auto_548715 ) ) ( not ( = ?auto_548709 ?auto_548716 ) ) ( not ( = ?auto_548709 ?auto_548717 ) ) ( not ( = ?auto_548709 ?auto_548718 ) ) ( not ( = ?auto_548709 ?auto_548719 ) ) ( not ( = ?auto_548710 ?auto_548711 ) ) ( not ( = ?auto_548710 ?auto_548712 ) ) ( not ( = ?auto_548710 ?auto_548713 ) ) ( not ( = ?auto_548710 ?auto_548714 ) ) ( not ( = ?auto_548710 ?auto_548715 ) ) ( not ( = ?auto_548710 ?auto_548716 ) ) ( not ( = ?auto_548710 ?auto_548717 ) ) ( not ( = ?auto_548710 ?auto_548718 ) ) ( not ( = ?auto_548710 ?auto_548719 ) ) ( not ( = ?auto_548711 ?auto_548712 ) ) ( not ( = ?auto_548711 ?auto_548713 ) ) ( not ( = ?auto_548711 ?auto_548714 ) ) ( not ( = ?auto_548711 ?auto_548715 ) ) ( not ( = ?auto_548711 ?auto_548716 ) ) ( not ( = ?auto_548711 ?auto_548717 ) ) ( not ( = ?auto_548711 ?auto_548718 ) ) ( not ( = ?auto_548711 ?auto_548719 ) ) ( not ( = ?auto_548712 ?auto_548713 ) ) ( not ( = ?auto_548712 ?auto_548714 ) ) ( not ( = ?auto_548712 ?auto_548715 ) ) ( not ( = ?auto_548712 ?auto_548716 ) ) ( not ( = ?auto_548712 ?auto_548717 ) ) ( not ( = ?auto_548712 ?auto_548718 ) ) ( not ( = ?auto_548712 ?auto_548719 ) ) ( not ( = ?auto_548713 ?auto_548714 ) ) ( not ( = ?auto_548713 ?auto_548715 ) ) ( not ( = ?auto_548713 ?auto_548716 ) ) ( not ( = ?auto_548713 ?auto_548717 ) ) ( not ( = ?auto_548713 ?auto_548718 ) ) ( not ( = ?auto_548713 ?auto_548719 ) ) ( not ( = ?auto_548714 ?auto_548715 ) ) ( not ( = ?auto_548714 ?auto_548716 ) ) ( not ( = ?auto_548714 ?auto_548717 ) ) ( not ( = ?auto_548714 ?auto_548718 ) ) ( not ( = ?auto_548714 ?auto_548719 ) ) ( not ( = ?auto_548715 ?auto_548716 ) ) ( not ( = ?auto_548715 ?auto_548717 ) ) ( not ( = ?auto_548715 ?auto_548718 ) ) ( not ( = ?auto_548715 ?auto_548719 ) ) ( not ( = ?auto_548716 ?auto_548717 ) ) ( not ( = ?auto_548716 ?auto_548718 ) ) ( not ( = ?auto_548716 ?auto_548719 ) ) ( not ( = ?auto_548717 ?auto_548718 ) ) ( not ( = ?auto_548717 ?auto_548719 ) ) ( not ( = ?auto_548718 ?auto_548719 ) ) ( CLEAR ?auto_548716 ) ( ON ?auto_548717 ?auto_548718 ) ( CLEAR ?auto_548717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_548707 ?auto_548708 ?auto_548709 ?auto_548710 ?auto_548711 ?auto_548712 ?auto_548713 ?auto_548714 ?auto_548715 ?auto_548716 ?auto_548717 )
      ( MAKE-12PILE ?auto_548707 ?auto_548708 ?auto_548709 ?auto_548710 ?auto_548711 ?auto_548712 ?auto_548713 ?auto_548714 ?auto_548715 ?auto_548716 ?auto_548717 ?auto_548718 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_548757 - BLOCK
      ?auto_548758 - BLOCK
      ?auto_548759 - BLOCK
      ?auto_548760 - BLOCK
      ?auto_548761 - BLOCK
      ?auto_548762 - BLOCK
      ?auto_548763 - BLOCK
      ?auto_548764 - BLOCK
      ?auto_548765 - BLOCK
      ?auto_548766 - BLOCK
      ?auto_548767 - BLOCK
      ?auto_548768 - BLOCK
    )
    :vars
    (
      ?auto_548769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548768 ?auto_548769 ) ( ON-TABLE ?auto_548757 ) ( ON ?auto_548758 ?auto_548757 ) ( ON ?auto_548759 ?auto_548758 ) ( ON ?auto_548760 ?auto_548759 ) ( ON ?auto_548761 ?auto_548760 ) ( ON ?auto_548762 ?auto_548761 ) ( ON ?auto_548763 ?auto_548762 ) ( ON ?auto_548764 ?auto_548763 ) ( ON ?auto_548765 ?auto_548764 ) ( not ( = ?auto_548757 ?auto_548758 ) ) ( not ( = ?auto_548757 ?auto_548759 ) ) ( not ( = ?auto_548757 ?auto_548760 ) ) ( not ( = ?auto_548757 ?auto_548761 ) ) ( not ( = ?auto_548757 ?auto_548762 ) ) ( not ( = ?auto_548757 ?auto_548763 ) ) ( not ( = ?auto_548757 ?auto_548764 ) ) ( not ( = ?auto_548757 ?auto_548765 ) ) ( not ( = ?auto_548757 ?auto_548766 ) ) ( not ( = ?auto_548757 ?auto_548767 ) ) ( not ( = ?auto_548757 ?auto_548768 ) ) ( not ( = ?auto_548757 ?auto_548769 ) ) ( not ( = ?auto_548758 ?auto_548759 ) ) ( not ( = ?auto_548758 ?auto_548760 ) ) ( not ( = ?auto_548758 ?auto_548761 ) ) ( not ( = ?auto_548758 ?auto_548762 ) ) ( not ( = ?auto_548758 ?auto_548763 ) ) ( not ( = ?auto_548758 ?auto_548764 ) ) ( not ( = ?auto_548758 ?auto_548765 ) ) ( not ( = ?auto_548758 ?auto_548766 ) ) ( not ( = ?auto_548758 ?auto_548767 ) ) ( not ( = ?auto_548758 ?auto_548768 ) ) ( not ( = ?auto_548758 ?auto_548769 ) ) ( not ( = ?auto_548759 ?auto_548760 ) ) ( not ( = ?auto_548759 ?auto_548761 ) ) ( not ( = ?auto_548759 ?auto_548762 ) ) ( not ( = ?auto_548759 ?auto_548763 ) ) ( not ( = ?auto_548759 ?auto_548764 ) ) ( not ( = ?auto_548759 ?auto_548765 ) ) ( not ( = ?auto_548759 ?auto_548766 ) ) ( not ( = ?auto_548759 ?auto_548767 ) ) ( not ( = ?auto_548759 ?auto_548768 ) ) ( not ( = ?auto_548759 ?auto_548769 ) ) ( not ( = ?auto_548760 ?auto_548761 ) ) ( not ( = ?auto_548760 ?auto_548762 ) ) ( not ( = ?auto_548760 ?auto_548763 ) ) ( not ( = ?auto_548760 ?auto_548764 ) ) ( not ( = ?auto_548760 ?auto_548765 ) ) ( not ( = ?auto_548760 ?auto_548766 ) ) ( not ( = ?auto_548760 ?auto_548767 ) ) ( not ( = ?auto_548760 ?auto_548768 ) ) ( not ( = ?auto_548760 ?auto_548769 ) ) ( not ( = ?auto_548761 ?auto_548762 ) ) ( not ( = ?auto_548761 ?auto_548763 ) ) ( not ( = ?auto_548761 ?auto_548764 ) ) ( not ( = ?auto_548761 ?auto_548765 ) ) ( not ( = ?auto_548761 ?auto_548766 ) ) ( not ( = ?auto_548761 ?auto_548767 ) ) ( not ( = ?auto_548761 ?auto_548768 ) ) ( not ( = ?auto_548761 ?auto_548769 ) ) ( not ( = ?auto_548762 ?auto_548763 ) ) ( not ( = ?auto_548762 ?auto_548764 ) ) ( not ( = ?auto_548762 ?auto_548765 ) ) ( not ( = ?auto_548762 ?auto_548766 ) ) ( not ( = ?auto_548762 ?auto_548767 ) ) ( not ( = ?auto_548762 ?auto_548768 ) ) ( not ( = ?auto_548762 ?auto_548769 ) ) ( not ( = ?auto_548763 ?auto_548764 ) ) ( not ( = ?auto_548763 ?auto_548765 ) ) ( not ( = ?auto_548763 ?auto_548766 ) ) ( not ( = ?auto_548763 ?auto_548767 ) ) ( not ( = ?auto_548763 ?auto_548768 ) ) ( not ( = ?auto_548763 ?auto_548769 ) ) ( not ( = ?auto_548764 ?auto_548765 ) ) ( not ( = ?auto_548764 ?auto_548766 ) ) ( not ( = ?auto_548764 ?auto_548767 ) ) ( not ( = ?auto_548764 ?auto_548768 ) ) ( not ( = ?auto_548764 ?auto_548769 ) ) ( not ( = ?auto_548765 ?auto_548766 ) ) ( not ( = ?auto_548765 ?auto_548767 ) ) ( not ( = ?auto_548765 ?auto_548768 ) ) ( not ( = ?auto_548765 ?auto_548769 ) ) ( not ( = ?auto_548766 ?auto_548767 ) ) ( not ( = ?auto_548766 ?auto_548768 ) ) ( not ( = ?auto_548766 ?auto_548769 ) ) ( not ( = ?auto_548767 ?auto_548768 ) ) ( not ( = ?auto_548767 ?auto_548769 ) ) ( not ( = ?auto_548768 ?auto_548769 ) ) ( ON ?auto_548767 ?auto_548768 ) ( CLEAR ?auto_548765 ) ( ON ?auto_548766 ?auto_548767 ) ( CLEAR ?auto_548766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_548757 ?auto_548758 ?auto_548759 ?auto_548760 ?auto_548761 ?auto_548762 ?auto_548763 ?auto_548764 ?auto_548765 ?auto_548766 )
      ( MAKE-12PILE ?auto_548757 ?auto_548758 ?auto_548759 ?auto_548760 ?auto_548761 ?auto_548762 ?auto_548763 ?auto_548764 ?auto_548765 ?auto_548766 ?auto_548767 ?auto_548768 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_548807 - BLOCK
      ?auto_548808 - BLOCK
      ?auto_548809 - BLOCK
      ?auto_548810 - BLOCK
      ?auto_548811 - BLOCK
      ?auto_548812 - BLOCK
      ?auto_548813 - BLOCK
      ?auto_548814 - BLOCK
      ?auto_548815 - BLOCK
      ?auto_548816 - BLOCK
      ?auto_548817 - BLOCK
      ?auto_548818 - BLOCK
    )
    :vars
    (
      ?auto_548819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548818 ?auto_548819 ) ( ON-TABLE ?auto_548807 ) ( ON ?auto_548808 ?auto_548807 ) ( ON ?auto_548809 ?auto_548808 ) ( ON ?auto_548810 ?auto_548809 ) ( ON ?auto_548811 ?auto_548810 ) ( ON ?auto_548812 ?auto_548811 ) ( ON ?auto_548813 ?auto_548812 ) ( ON ?auto_548814 ?auto_548813 ) ( not ( = ?auto_548807 ?auto_548808 ) ) ( not ( = ?auto_548807 ?auto_548809 ) ) ( not ( = ?auto_548807 ?auto_548810 ) ) ( not ( = ?auto_548807 ?auto_548811 ) ) ( not ( = ?auto_548807 ?auto_548812 ) ) ( not ( = ?auto_548807 ?auto_548813 ) ) ( not ( = ?auto_548807 ?auto_548814 ) ) ( not ( = ?auto_548807 ?auto_548815 ) ) ( not ( = ?auto_548807 ?auto_548816 ) ) ( not ( = ?auto_548807 ?auto_548817 ) ) ( not ( = ?auto_548807 ?auto_548818 ) ) ( not ( = ?auto_548807 ?auto_548819 ) ) ( not ( = ?auto_548808 ?auto_548809 ) ) ( not ( = ?auto_548808 ?auto_548810 ) ) ( not ( = ?auto_548808 ?auto_548811 ) ) ( not ( = ?auto_548808 ?auto_548812 ) ) ( not ( = ?auto_548808 ?auto_548813 ) ) ( not ( = ?auto_548808 ?auto_548814 ) ) ( not ( = ?auto_548808 ?auto_548815 ) ) ( not ( = ?auto_548808 ?auto_548816 ) ) ( not ( = ?auto_548808 ?auto_548817 ) ) ( not ( = ?auto_548808 ?auto_548818 ) ) ( not ( = ?auto_548808 ?auto_548819 ) ) ( not ( = ?auto_548809 ?auto_548810 ) ) ( not ( = ?auto_548809 ?auto_548811 ) ) ( not ( = ?auto_548809 ?auto_548812 ) ) ( not ( = ?auto_548809 ?auto_548813 ) ) ( not ( = ?auto_548809 ?auto_548814 ) ) ( not ( = ?auto_548809 ?auto_548815 ) ) ( not ( = ?auto_548809 ?auto_548816 ) ) ( not ( = ?auto_548809 ?auto_548817 ) ) ( not ( = ?auto_548809 ?auto_548818 ) ) ( not ( = ?auto_548809 ?auto_548819 ) ) ( not ( = ?auto_548810 ?auto_548811 ) ) ( not ( = ?auto_548810 ?auto_548812 ) ) ( not ( = ?auto_548810 ?auto_548813 ) ) ( not ( = ?auto_548810 ?auto_548814 ) ) ( not ( = ?auto_548810 ?auto_548815 ) ) ( not ( = ?auto_548810 ?auto_548816 ) ) ( not ( = ?auto_548810 ?auto_548817 ) ) ( not ( = ?auto_548810 ?auto_548818 ) ) ( not ( = ?auto_548810 ?auto_548819 ) ) ( not ( = ?auto_548811 ?auto_548812 ) ) ( not ( = ?auto_548811 ?auto_548813 ) ) ( not ( = ?auto_548811 ?auto_548814 ) ) ( not ( = ?auto_548811 ?auto_548815 ) ) ( not ( = ?auto_548811 ?auto_548816 ) ) ( not ( = ?auto_548811 ?auto_548817 ) ) ( not ( = ?auto_548811 ?auto_548818 ) ) ( not ( = ?auto_548811 ?auto_548819 ) ) ( not ( = ?auto_548812 ?auto_548813 ) ) ( not ( = ?auto_548812 ?auto_548814 ) ) ( not ( = ?auto_548812 ?auto_548815 ) ) ( not ( = ?auto_548812 ?auto_548816 ) ) ( not ( = ?auto_548812 ?auto_548817 ) ) ( not ( = ?auto_548812 ?auto_548818 ) ) ( not ( = ?auto_548812 ?auto_548819 ) ) ( not ( = ?auto_548813 ?auto_548814 ) ) ( not ( = ?auto_548813 ?auto_548815 ) ) ( not ( = ?auto_548813 ?auto_548816 ) ) ( not ( = ?auto_548813 ?auto_548817 ) ) ( not ( = ?auto_548813 ?auto_548818 ) ) ( not ( = ?auto_548813 ?auto_548819 ) ) ( not ( = ?auto_548814 ?auto_548815 ) ) ( not ( = ?auto_548814 ?auto_548816 ) ) ( not ( = ?auto_548814 ?auto_548817 ) ) ( not ( = ?auto_548814 ?auto_548818 ) ) ( not ( = ?auto_548814 ?auto_548819 ) ) ( not ( = ?auto_548815 ?auto_548816 ) ) ( not ( = ?auto_548815 ?auto_548817 ) ) ( not ( = ?auto_548815 ?auto_548818 ) ) ( not ( = ?auto_548815 ?auto_548819 ) ) ( not ( = ?auto_548816 ?auto_548817 ) ) ( not ( = ?auto_548816 ?auto_548818 ) ) ( not ( = ?auto_548816 ?auto_548819 ) ) ( not ( = ?auto_548817 ?auto_548818 ) ) ( not ( = ?auto_548817 ?auto_548819 ) ) ( not ( = ?auto_548818 ?auto_548819 ) ) ( ON ?auto_548817 ?auto_548818 ) ( ON ?auto_548816 ?auto_548817 ) ( CLEAR ?auto_548814 ) ( ON ?auto_548815 ?auto_548816 ) ( CLEAR ?auto_548815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_548807 ?auto_548808 ?auto_548809 ?auto_548810 ?auto_548811 ?auto_548812 ?auto_548813 ?auto_548814 ?auto_548815 )
      ( MAKE-12PILE ?auto_548807 ?auto_548808 ?auto_548809 ?auto_548810 ?auto_548811 ?auto_548812 ?auto_548813 ?auto_548814 ?auto_548815 ?auto_548816 ?auto_548817 ?auto_548818 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_548857 - BLOCK
      ?auto_548858 - BLOCK
      ?auto_548859 - BLOCK
      ?auto_548860 - BLOCK
      ?auto_548861 - BLOCK
      ?auto_548862 - BLOCK
      ?auto_548863 - BLOCK
      ?auto_548864 - BLOCK
      ?auto_548865 - BLOCK
      ?auto_548866 - BLOCK
      ?auto_548867 - BLOCK
      ?auto_548868 - BLOCK
    )
    :vars
    (
      ?auto_548869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548868 ?auto_548869 ) ( ON-TABLE ?auto_548857 ) ( ON ?auto_548858 ?auto_548857 ) ( ON ?auto_548859 ?auto_548858 ) ( ON ?auto_548860 ?auto_548859 ) ( ON ?auto_548861 ?auto_548860 ) ( ON ?auto_548862 ?auto_548861 ) ( ON ?auto_548863 ?auto_548862 ) ( not ( = ?auto_548857 ?auto_548858 ) ) ( not ( = ?auto_548857 ?auto_548859 ) ) ( not ( = ?auto_548857 ?auto_548860 ) ) ( not ( = ?auto_548857 ?auto_548861 ) ) ( not ( = ?auto_548857 ?auto_548862 ) ) ( not ( = ?auto_548857 ?auto_548863 ) ) ( not ( = ?auto_548857 ?auto_548864 ) ) ( not ( = ?auto_548857 ?auto_548865 ) ) ( not ( = ?auto_548857 ?auto_548866 ) ) ( not ( = ?auto_548857 ?auto_548867 ) ) ( not ( = ?auto_548857 ?auto_548868 ) ) ( not ( = ?auto_548857 ?auto_548869 ) ) ( not ( = ?auto_548858 ?auto_548859 ) ) ( not ( = ?auto_548858 ?auto_548860 ) ) ( not ( = ?auto_548858 ?auto_548861 ) ) ( not ( = ?auto_548858 ?auto_548862 ) ) ( not ( = ?auto_548858 ?auto_548863 ) ) ( not ( = ?auto_548858 ?auto_548864 ) ) ( not ( = ?auto_548858 ?auto_548865 ) ) ( not ( = ?auto_548858 ?auto_548866 ) ) ( not ( = ?auto_548858 ?auto_548867 ) ) ( not ( = ?auto_548858 ?auto_548868 ) ) ( not ( = ?auto_548858 ?auto_548869 ) ) ( not ( = ?auto_548859 ?auto_548860 ) ) ( not ( = ?auto_548859 ?auto_548861 ) ) ( not ( = ?auto_548859 ?auto_548862 ) ) ( not ( = ?auto_548859 ?auto_548863 ) ) ( not ( = ?auto_548859 ?auto_548864 ) ) ( not ( = ?auto_548859 ?auto_548865 ) ) ( not ( = ?auto_548859 ?auto_548866 ) ) ( not ( = ?auto_548859 ?auto_548867 ) ) ( not ( = ?auto_548859 ?auto_548868 ) ) ( not ( = ?auto_548859 ?auto_548869 ) ) ( not ( = ?auto_548860 ?auto_548861 ) ) ( not ( = ?auto_548860 ?auto_548862 ) ) ( not ( = ?auto_548860 ?auto_548863 ) ) ( not ( = ?auto_548860 ?auto_548864 ) ) ( not ( = ?auto_548860 ?auto_548865 ) ) ( not ( = ?auto_548860 ?auto_548866 ) ) ( not ( = ?auto_548860 ?auto_548867 ) ) ( not ( = ?auto_548860 ?auto_548868 ) ) ( not ( = ?auto_548860 ?auto_548869 ) ) ( not ( = ?auto_548861 ?auto_548862 ) ) ( not ( = ?auto_548861 ?auto_548863 ) ) ( not ( = ?auto_548861 ?auto_548864 ) ) ( not ( = ?auto_548861 ?auto_548865 ) ) ( not ( = ?auto_548861 ?auto_548866 ) ) ( not ( = ?auto_548861 ?auto_548867 ) ) ( not ( = ?auto_548861 ?auto_548868 ) ) ( not ( = ?auto_548861 ?auto_548869 ) ) ( not ( = ?auto_548862 ?auto_548863 ) ) ( not ( = ?auto_548862 ?auto_548864 ) ) ( not ( = ?auto_548862 ?auto_548865 ) ) ( not ( = ?auto_548862 ?auto_548866 ) ) ( not ( = ?auto_548862 ?auto_548867 ) ) ( not ( = ?auto_548862 ?auto_548868 ) ) ( not ( = ?auto_548862 ?auto_548869 ) ) ( not ( = ?auto_548863 ?auto_548864 ) ) ( not ( = ?auto_548863 ?auto_548865 ) ) ( not ( = ?auto_548863 ?auto_548866 ) ) ( not ( = ?auto_548863 ?auto_548867 ) ) ( not ( = ?auto_548863 ?auto_548868 ) ) ( not ( = ?auto_548863 ?auto_548869 ) ) ( not ( = ?auto_548864 ?auto_548865 ) ) ( not ( = ?auto_548864 ?auto_548866 ) ) ( not ( = ?auto_548864 ?auto_548867 ) ) ( not ( = ?auto_548864 ?auto_548868 ) ) ( not ( = ?auto_548864 ?auto_548869 ) ) ( not ( = ?auto_548865 ?auto_548866 ) ) ( not ( = ?auto_548865 ?auto_548867 ) ) ( not ( = ?auto_548865 ?auto_548868 ) ) ( not ( = ?auto_548865 ?auto_548869 ) ) ( not ( = ?auto_548866 ?auto_548867 ) ) ( not ( = ?auto_548866 ?auto_548868 ) ) ( not ( = ?auto_548866 ?auto_548869 ) ) ( not ( = ?auto_548867 ?auto_548868 ) ) ( not ( = ?auto_548867 ?auto_548869 ) ) ( not ( = ?auto_548868 ?auto_548869 ) ) ( ON ?auto_548867 ?auto_548868 ) ( ON ?auto_548866 ?auto_548867 ) ( ON ?auto_548865 ?auto_548866 ) ( CLEAR ?auto_548863 ) ( ON ?auto_548864 ?auto_548865 ) ( CLEAR ?auto_548864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_548857 ?auto_548858 ?auto_548859 ?auto_548860 ?auto_548861 ?auto_548862 ?auto_548863 ?auto_548864 )
      ( MAKE-12PILE ?auto_548857 ?auto_548858 ?auto_548859 ?auto_548860 ?auto_548861 ?auto_548862 ?auto_548863 ?auto_548864 ?auto_548865 ?auto_548866 ?auto_548867 ?auto_548868 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_548907 - BLOCK
      ?auto_548908 - BLOCK
      ?auto_548909 - BLOCK
      ?auto_548910 - BLOCK
      ?auto_548911 - BLOCK
      ?auto_548912 - BLOCK
      ?auto_548913 - BLOCK
      ?auto_548914 - BLOCK
      ?auto_548915 - BLOCK
      ?auto_548916 - BLOCK
      ?auto_548917 - BLOCK
      ?auto_548918 - BLOCK
    )
    :vars
    (
      ?auto_548919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548918 ?auto_548919 ) ( ON-TABLE ?auto_548907 ) ( ON ?auto_548908 ?auto_548907 ) ( ON ?auto_548909 ?auto_548908 ) ( ON ?auto_548910 ?auto_548909 ) ( ON ?auto_548911 ?auto_548910 ) ( ON ?auto_548912 ?auto_548911 ) ( not ( = ?auto_548907 ?auto_548908 ) ) ( not ( = ?auto_548907 ?auto_548909 ) ) ( not ( = ?auto_548907 ?auto_548910 ) ) ( not ( = ?auto_548907 ?auto_548911 ) ) ( not ( = ?auto_548907 ?auto_548912 ) ) ( not ( = ?auto_548907 ?auto_548913 ) ) ( not ( = ?auto_548907 ?auto_548914 ) ) ( not ( = ?auto_548907 ?auto_548915 ) ) ( not ( = ?auto_548907 ?auto_548916 ) ) ( not ( = ?auto_548907 ?auto_548917 ) ) ( not ( = ?auto_548907 ?auto_548918 ) ) ( not ( = ?auto_548907 ?auto_548919 ) ) ( not ( = ?auto_548908 ?auto_548909 ) ) ( not ( = ?auto_548908 ?auto_548910 ) ) ( not ( = ?auto_548908 ?auto_548911 ) ) ( not ( = ?auto_548908 ?auto_548912 ) ) ( not ( = ?auto_548908 ?auto_548913 ) ) ( not ( = ?auto_548908 ?auto_548914 ) ) ( not ( = ?auto_548908 ?auto_548915 ) ) ( not ( = ?auto_548908 ?auto_548916 ) ) ( not ( = ?auto_548908 ?auto_548917 ) ) ( not ( = ?auto_548908 ?auto_548918 ) ) ( not ( = ?auto_548908 ?auto_548919 ) ) ( not ( = ?auto_548909 ?auto_548910 ) ) ( not ( = ?auto_548909 ?auto_548911 ) ) ( not ( = ?auto_548909 ?auto_548912 ) ) ( not ( = ?auto_548909 ?auto_548913 ) ) ( not ( = ?auto_548909 ?auto_548914 ) ) ( not ( = ?auto_548909 ?auto_548915 ) ) ( not ( = ?auto_548909 ?auto_548916 ) ) ( not ( = ?auto_548909 ?auto_548917 ) ) ( not ( = ?auto_548909 ?auto_548918 ) ) ( not ( = ?auto_548909 ?auto_548919 ) ) ( not ( = ?auto_548910 ?auto_548911 ) ) ( not ( = ?auto_548910 ?auto_548912 ) ) ( not ( = ?auto_548910 ?auto_548913 ) ) ( not ( = ?auto_548910 ?auto_548914 ) ) ( not ( = ?auto_548910 ?auto_548915 ) ) ( not ( = ?auto_548910 ?auto_548916 ) ) ( not ( = ?auto_548910 ?auto_548917 ) ) ( not ( = ?auto_548910 ?auto_548918 ) ) ( not ( = ?auto_548910 ?auto_548919 ) ) ( not ( = ?auto_548911 ?auto_548912 ) ) ( not ( = ?auto_548911 ?auto_548913 ) ) ( not ( = ?auto_548911 ?auto_548914 ) ) ( not ( = ?auto_548911 ?auto_548915 ) ) ( not ( = ?auto_548911 ?auto_548916 ) ) ( not ( = ?auto_548911 ?auto_548917 ) ) ( not ( = ?auto_548911 ?auto_548918 ) ) ( not ( = ?auto_548911 ?auto_548919 ) ) ( not ( = ?auto_548912 ?auto_548913 ) ) ( not ( = ?auto_548912 ?auto_548914 ) ) ( not ( = ?auto_548912 ?auto_548915 ) ) ( not ( = ?auto_548912 ?auto_548916 ) ) ( not ( = ?auto_548912 ?auto_548917 ) ) ( not ( = ?auto_548912 ?auto_548918 ) ) ( not ( = ?auto_548912 ?auto_548919 ) ) ( not ( = ?auto_548913 ?auto_548914 ) ) ( not ( = ?auto_548913 ?auto_548915 ) ) ( not ( = ?auto_548913 ?auto_548916 ) ) ( not ( = ?auto_548913 ?auto_548917 ) ) ( not ( = ?auto_548913 ?auto_548918 ) ) ( not ( = ?auto_548913 ?auto_548919 ) ) ( not ( = ?auto_548914 ?auto_548915 ) ) ( not ( = ?auto_548914 ?auto_548916 ) ) ( not ( = ?auto_548914 ?auto_548917 ) ) ( not ( = ?auto_548914 ?auto_548918 ) ) ( not ( = ?auto_548914 ?auto_548919 ) ) ( not ( = ?auto_548915 ?auto_548916 ) ) ( not ( = ?auto_548915 ?auto_548917 ) ) ( not ( = ?auto_548915 ?auto_548918 ) ) ( not ( = ?auto_548915 ?auto_548919 ) ) ( not ( = ?auto_548916 ?auto_548917 ) ) ( not ( = ?auto_548916 ?auto_548918 ) ) ( not ( = ?auto_548916 ?auto_548919 ) ) ( not ( = ?auto_548917 ?auto_548918 ) ) ( not ( = ?auto_548917 ?auto_548919 ) ) ( not ( = ?auto_548918 ?auto_548919 ) ) ( ON ?auto_548917 ?auto_548918 ) ( ON ?auto_548916 ?auto_548917 ) ( ON ?auto_548915 ?auto_548916 ) ( ON ?auto_548914 ?auto_548915 ) ( CLEAR ?auto_548912 ) ( ON ?auto_548913 ?auto_548914 ) ( CLEAR ?auto_548913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_548907 ?auto_548908 ?auto_548909 ?auto_548910 ?auto_548911 ?auto_548912 ?auto_548913 )
      ( MAKE-12PILE ?auto_548907 ?auto_548908 ?auto_548909 ?auto_548910 ?auto_548911 ?auto_548912 ?auto_548913 ?auto_548914 ?auto_548915 ?auto_548916 ?auto_548917 ?auto_548918 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_548957 - BLOCK
      ?auto_548958 - BLOCK
      ?auto_548959 - BLOCK
      ?auto_548960 - BLOCK
      ?auto_548961 - BLOCK
      ?auto_548962 - BLOCK
      ?auto_548963 - BLOCK
      ?auto_548964 - BLOCK
      ?auto_548965 - BLOCK
      ?auto_548966 - BLOCK
      ?auto_548967 - BLOCK
      ?auto_548968 - BLOCK
    )
    :vars
    (
      ?auto_548969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_548968 ?auto_548969 ) ( ON-TABLE ?auto_548957 ) ( ON ?auto_548958 ?auto_548957 ) ( ON ?auto_548959 ?auto_548958 ) ( ON ?auto_548960 ?auto_548959 ) ( ON ?auto_548961 ?auto_548960 ) ( not ( = ?auto_548957 ?auto_548958 ) ) ( not ( = ?auto_548957 ?auto_548959 ) ) ( not ( = ?auto_548957 ?auto_548960 ) ) ( not ( = ?auto_548957 ?auto_548961 ) ) ( not ( = ?auto_548957 ?auto_548962 ) ) ( not ( = ?auto_548957 ?auto_548963 ) ) ( not ( = ?auto_548957 ?auto_548964 ) ) ( not ( = ?auto_548957 ?auto_548965 ) ) ( not ( = ?auto_548957 ?auto_548966 ) ) ( not ( = ?auto_548957 ?auto_548967 ) ) ( not ( = ?auto_548957 ?auto_548968 ) ) ( not ( = ?auto_548957 ?auto_548969 ) ) ( not ( = ?auto_548958 ?auto_548959 ) ) ( not ( = ?auto_548958 ?auto_548960 ) ) ( not ( = ?auto_548958 ?auto_548961 ) ) ( not ( = ?auto_548958 ?auto_548962 ) ) ( not ( = ?auto_548958 ?auto_548963 ) ) ( not ( = ?auto_548958 ?auto_548964 ) ) ( not ( = ?auto_548958 ?auto_548965 ) ) ( not ( = ?auto_548958 ?auto_548966 ) ) ( not ( = ?auto_548958 ?auto_548967 ) ) ( not ( = ?auto_548958 ?auto_548968 ) ) ( not ( = ?auto_548958 ?auto_548969 ) ) ( not ( = ?auto_548959 ?auto_548960 ) ) ( not ( = ?auto_548959 ?auto_548961 ) ) ( not ( = ?auto_548959 ?auto_548962 ) ) ( not ( = ?auto_548959 ?auto_548963 ) ) ( not ( = ?auto_548959 ?auto_548964 ) ) ( not ( = ?auto_548959 ?auto_548965 ) ) ( not ( = ?auto_548959 ?auto_548966 ) ) ( not ( = ?auto_548959 ?auto_548967 ) ) ( not ( = ?auto_548959 ?auto_548968 ) ) ( not ( = ?auto_548959 ?auto_548969 ) ) ( not ( = ?auto_548960 ?auto_548961 ) ) ( not ( = ?auto_548960 ?auto_548962 ) ) ( not ( = ?auto_548960 ?auto_548963 ) ) ( not ( = ?auto_548960 ?auto_548964 ) ) ( not ( = ?auto_548960 ?auto_548965 ) ) ( not ( = ?auto_548960 ?auto_548966 ) ) ( not ( = ?auto_548960 ?auto_548967 ) ) ( not ( = ?auto_548960 ?auto_548968 ) ) ( not ( = ?auto_548960 ?auto_548969 ) ) ( not ( = ?auto_548961 ?auto_548962 ) ) ( not ( = ?auto_548961 ?auto_548963 ) ) ( not ( = ?auto_548961 ?auto_548964 ) ) ( not ( = ?auto_548961 ?auto_548965 ) ) ( not ( = ?auto_548961 ?auto_548966 ) ) ( not ( = ?auto_548961 ?auto_548967 ) ) ( not ( = ?auto_548961 ?auto_548968 ) ) ( not ( = ?auto_548961 ?auto_548969 ) ) ( not ( = ?auto_548962 ?auto_548963 ) ) ( not ( = ?auto_548962 ?auto_548964 ) ) ( not ( = ?auto_548962 ?auto_548965 ) ) ( not ( = ?auto_548962 ?auto_548966 ) ) ( not ( = ?auto_548962 ?auto_548967 ) ) ( not ( = ?auto_548962 ?auto_548968 ) ) ( not ( = ?auto_548962 ?auto_548969 ) ) ( not ( = ?auto_548963 ?auto_548964 ) ) ( not ( = ?auto_548963 ?auto_548965 ) ) ( not ( = ?auto_548963 ?auto_548966 ) ) ( not ( = ?auto_548963 ?auto_548967 ) ) ( not ( = ?auto_548963 ?auto_548968 ) ) ( not ( = ?auto_548963 ?auto_548969 ) ) ( not ( = ?auto_548964 ?auto_548965 ) ) ( not ( = ?auto_548964 ?auto_548966 ) ) ( not ( = ?auto_548964 ?auto_548967 ) ) ( not ( = ?auto_548964 ?auto_548968 ) ) ( not ( = ?auto_548964 ?auto_548969 ) ) ( not ( = ?auto_548965 ?auto_548966 ) ) ( not ( = ?auto_548965 ?auto_548967 ) ) ( not ( = ?auto_548965 ?auto_548968 ) ) ( not ( = ?auto_548965 ?auto_548969 ) ) ( not ( = ?auto_548966 ?auto_548967 ) ) ( not ( = ?auto_548966 ?auto_548968 ) ) ( not ( = ?auto_548966 ?auto_548969 ) ) ( not ( = ?auto_548967 ?auto_548968 ) ) ( not ( = ?auto_548967 ?auto_548969 ) ) ( not ( = ?auto_548968 ?auto_548969 ) ) ( ON ?auto_548967 ?auto_548968 ) ( ON ?auto_548966 ?auto_548967 ) ( ON ?auto_548965 ?auto_548966 ) ( ON ?auto_548964 ?auto_548965 ) ( ON ?auto_548963 ?auto_548964 ) ( CLEAR ?auto_548961 ) ( ON ?auto_548962 ?auto_548963 ) ( CLEAR ?auto_548962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_548957 ?auto_548958 ?auto_548959 ?auto_548960 ?auto_548961 ?auto_548962 )
      ( MAKE-12PILE ?auto_548957 ?auto_548958 ?auto_548959 ?auto_548960 ?auto_548961 ?auto_548962 ?auto_548963 ?auto_548964 ?auto_548965 ?auto_548966 ?auto_548967 ?auto_548968 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_549007 - BLOCK
      ?auto_549008 - BLOCK
      ?auto_549009 - BLOCK
      ?auto_549010 - BLOCK
      ?auto_549011 - BLOCK
      ?auto_549012 - BLOCK
      ?auto_549013 - BLOCK
      ?auto_549014 - BLOCK
      ?auto_549015 - BLOCK
      ?auto_549016 - BLOCK
      ?auto_549017 - BLOCK
      ?auto_549018 - BLOCK
    )
    :vars
    (
      ?auto_549019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_549018 ?auto_549019 ) ( ON-TABLE ?auto_549007 ) ( ON ?auto_549008 ?auto_549007 ) ( ON ?auto_549009 ?auto_549008 ) ( ON ?auto_549010 ?auto_549009 ) ( not ( = ?auto_549007 ?auto_549008 ) ) ( not ( = ?auto_549007 ?auto_549009 ) ) ( not ( = ?auto_549007 ?auto_549010 ) ) ( not ( = ?auto_549007 ?auto_549011 ) ) ( not ( = ?auto_549007 ?auto_549012 ) ) ( not ( = ?auto_549007 ?auto_549013 ) ) ( not ( = ?auto_549007 ?auto_549014 ) ) ( not ( = ?auto_549007 ?auto_549015 ) ) ( not ( = ?auto_549007 ?auto_549016 ) ) ( not ( = ?auto_549007 ?auto_549017 ) ) ( not ( = ?auto_549007 ?auto_549018 ) ) ( not ( = ?auto_549007 ?auto_549019 ) ) ( not ( = ?auto_549008 ?auto_549009 ) ) ( not ( = ?auto_549008 ?auto_549010 ) ) ( not ( = ?auto_549008 ?auto_549011 ) ) ( not ( = ?auto_549008 ?auto_549012 ) ) ( not ( = ?auto_549008 ?auto_549013 ) ) ( not ( = ?auto_549008 ?auto_549014 ) ) ( not ( = ?auto_549008 ?auto_549015 ) ) ( not ( = ?auto_549008 ?auto_549016 ) ) ( not ( = ?auto_549008 ?auto_549017 ) ) ( not ( = ?auto_549008 ?auto_549018 ) ) ( not ( = ?auto_549008 ?auto_549019 ) ) ( not ( = ?auto_549009 ?auto_549010 ) ) ( not ( = ?auto_549009 ?auto_549011 ) ) ( not ( = ?auto_549009 ?auto_549012 ) ) ( not ( = ?auto_549009 ?auto_549013 ) ) ( not ( = ?auto_549009 ?auto_549014 ) ) ( not ( = ?auto_549009 ?auto_549015 ) ) ( not ( = ?auto_549009 ?auto_549016 ) ) ( not ( = ?auto_549009 ?auto_549017 ) ) ( not ( = ?auto_549009 ?auto_549018 ) ) ( not ( = ?auto_549009 ?auto_549019 ) ) ( not ( = ?auto_549010 ?auto_549011 ) ) ( not ( = ?auto_549010 ?auto_549012 ) ) ( not ( = ?auto_549010 ?auto_549013 ) ) ( not ( = ?auto_549010 ?auto_549014 ) ) ( not ( = ?auto_549010 ?auto_549015 ) ) ( not ( = ?auto_549010 ?auto_549016 ) ) ( not ( = ?auto_549010 ?auto_549017 ) ) ( not ( = ?auto_549010 ?auto_549018 ) ) ( not ( = ?auto_549010 ?auto_549019 ) ) ( not ( = ?auto_549011 ?auto_549012 ) ) ( not ( = ?auto_549011 ?auto_549013 ) ) ( not ( = ?auto_549011 ?auto_549014 ) ) ( not ( = ?auto_549011 ?auto_549015 ) ) ( not ( = ?auto_549011 ?auto_549016 ) ) ( not ( = ?auto_549011 ?auto_549017 ) ) ( not ( = ?auto_549011 ?auto_549018 ) ) ( not ( = ?auto_549011 ?auto_549019 ) ) ( not ( = ?auto_549012 ?auto_549013 ) ) ( not ( = ?auto_549012 ?auto_549014 ) ) ( not ( = ?auto_549012 ?auto_549015 ) ) ( not ( = ?auto_549012 ?auto_549016 ) ) ( not ( = ?auto_549012 ?auto_549017 ) ) ( not ( = ?auto_549012 ?auto_549018 ) ) ( not ( = ?auto_549012 ?auto_549019 ) ) ( not ( = ?auto_549013 ?auto_549014 ) ) ( not ( = ?auto_549013 ?auto_549015 ) ) ( not ( = ?auto_549013 ?auto_549016 ) ) ( not ( = ?auto_549013 ?auto_549017 ) ) ( not ( = ?auto_549013 ?auto_549018 ) ) ( not ( = ?auto_549013 ?auto_549019 ) ) ( not ( = ?auto_549014 ?auto_549015 ) ) ( not ( = ?auto_549014 ?auto_549016 ) ) ( not ( = ?auto_549014 ?auto_549017 ) ) ( not ( = ?auto_549014 ?auto_549018 ) ) ( not ( = ?auto_549014 ?auto_549019 ) ) ( not ( = ?auto_549015 ?auto_549016 ) ) ( not ( = ?auto_549015 ?auto_549017 ) ) ( not ( = ?auto_549015 ?auto_549018 ) ) ( not ( = ?auto_549015 ?auto_549019 ) ) ( not ( = ?auto_549016 ?auto_549017 ) ) ( not ( = ?auto_549016 ?auto_549018 ) ) ( not ( = ?auto_549016 ?auto_549019 ) ) ( not ( = ?auto_549017 ?auto_549018 ) ) ( not ( = ?auto_549017 ?auto_549019 ) ) ( not ( = ?auto_549018 ?auto_549019 ) ) ( ON ?auto_549017 ?auto_549018 ) ( ON ?auto_549016 ?auto_549017 ) ( ON ?auto_549015 ?auto_549016 ) ( ON ?auto_549014 ?auto_549015 ) ( ON ?auto_549013 ?auto_549014 ) ( ON ?auto_549012 ?auto_549013 ) ( CLEAR ?auto_549010 ) ( ON ?auto_549011 ?auto_549012 ) ( CLEAR ?auto_549011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_549007 ?auto_549008 ?auto_549009 ?auto_549010 ?auto_549011 )
      ( MAKE-12PILE ?auto_549007 ?auto_549008 ?auto_549009 ?auto_549010 ?auto_549011 ?auto_549012 ?auto_549013 ?auto_549014 ?auto_549015 ?auto_549016 ?auto_549017 ?auto_549018 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_549057 - BLOCK
      ?auto_549058 - BLOCK
      ?auto_549059 - BLOCK
      ?auto_549060 - BLOCK
      ?auto_549061 - BLOCK
      ?auto_549062 - BLOCK
      ?auto_549063 - BLOCK
      ?auto_549064 - BLOCK
      ?auto_549065 - BLOCK
      ?auto_549066 - BLOCK
      ?auto_549067 - BLOCK
      ?auto_549068 - BLOCK
    )
    :vars
    (
      ?auto_549069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_549068 ?auto_549069 ) ( ON-TABLE ?auto_549057 ) ( ON ?auto_549058 ?auto_549057 ) ( ON ?auto_549059 ?auto_549058 ) ( not ( = ?auto_549057 ?auto_549058 ) ) ( not ( = ?auto_549057 ?auto_549059 ) ) ( not ( = ?auto_549057 ?auto_549060 ) ) ( not ( = ?auto_549057 ?auto_549061 ) ) ( not ( = ?auto_549057 ?auto_549062 ) ) ( not ( = ?auto_549057 ?auto_549063 ) ) ( not ( = ?auto_549057 ?auto_549064 ) ) ( not ( = ?auto_549057 ?auto_549065 ) ) ( not ( = ?auto_549057 ?auto_549066 ) ) ( not ( = ?auto_549057 ?auto_549067 ) ) ( not ( = ?auto_549057 ?auto_549068 ) ) ( not ( = ?auto_549057 ?auto_549069 ) ) ( not ( = ?auto_549058 ?auto_549059 ) ) ( not ( = ?auto_549058 ?auto_549060 ) ) ( not ( = ?auto_549058 ?auto_549061 ) ) ( not ( = ?auto_549058 ?auto_549062 ) ) ( not ( = ?auto_549058 ?auto_549063 ) ) ( not ( = ?auto_549058 ?auto_549064 ) ) ( not ( = ?auto_549058 ?auto_549065 ) ) ( not ( = ?auto_549058 ?auto_549066 ) ) ( not ( = ?auto_549058 ?auto_549067 ) ) ( not ( = ?auto_549058 ?auto_549068 ) ) ( not ( = ?auto_549058 ?auto_549069 ) ) ( not ( = ?auto_549059 ?auto_549060 ) ) ( not ( = ?auto_549059 ?auto_549061 ) ) ( not ( = ?auto_549059 ?auto_549062 ) ) ( not ( = ?auto_549059 ?auto_549063 ) ) ( not ( = ?auto_549059 ?auto_549064 ) ) ( not ( = ?auto_549059 ?auto_549065 ) ) ( not ( = ?auto_549059 ?auto_549066 ) ) ( not ( = ?auto_549059 ?auto_549067 ) ) ( not ( = ?auto_549059 ?auto_549068 ) ) ( not ( = ?auto_549059 ?auto_549069 ) ) ( not ( = ?auto_549060 ?auto_549061 ) ) ( not ( = ?auto_549060 ?auto_549062 ) ) ( not ( = ?auto_549060 ?auto_549063 ) ) ( not ( = ?auto_549060 ?auto_549064 ) ) ( not ( = ?auto_549060 ?auto_549065 ) ) ( not ( = ?auto_549060 ?auto_549066 ) ) ( not ( = ?auto_549060 ?auto_549067 ) ) ( not ( = ?auto_549060 ?auto_549068 ) ) ( not ( = ?auto_549060 ?auto_549069 ) ) ( not ( = ?auto_549061 ?auto_549062 ) ) ( not ( = ?auto_549061 ?auto_549063 ) ) ( not ( = ?auto_549061 ?auto_549064 ) ) ( not ( = ?auto_549061 ?auto_549065 ) ) ( not ( = ?auto_549061 ?auto_549066 ) ) ( not ( = ?auto_549061 ?auto_549067 ) ) ( not ( = ?auto_549061 ?auto_549068 ) ) ( not ( = ?auto_549061 ?auto_549069 ) ) ( not ( = ?auto_549062 ?auto_549063 ) ) ( not ( = ?auto_549062 ?auto_549064 ) ) ( not ( = ?auto_549062 ?auto_549065 ) ) ( not ( = ?auto_549062 ?auto_549066 ) ) ( not ( = ?auto_549062 ?auto_549067 ) ) ( not ( = ?auto_549062 ?auto_549068 ) ) ( not ( = ?auto_549062 ?auto_549069 ) ) ( not ( = ?auto_549063 ?auto_549064 ) ) ( not ( = ?auto_549063 ?auto_549065 ) ) ( not ( = ?auto_549063 ?auto_549066 ) ) ( not ( = ?auto_549063 ?auto_549067 ) ) ( not ( = ?auto_549063 ?auto_549068 ) ) ( not ( = ?auto_549063 ?auto_549069 ) ) ( not ( = ?auto_549064 ?auto_549065 ) ) ( not ( = ?auto_549064 ?auto_549066 ) ) ( not ( = ?auto_549064 ?auto_549067 ) ) ( not ( = ?auto_549064 ?auto_549068 ) ) ( not ( = ?auto_549064 ?auto_549069 ) ) ( not ( = ?auto_549065 ?auto_549066 ) ) ( not ( = ?auto_549065 ?auto_549067 ) ) ( not ( = ?auto_549065 ?auto_549068 ) ) ( not ( = ?auto_549065 ?auto_549069 ) ) ( not ( = ?auto_549066 ?auto_549067 ) ) ( not ( = ?auto_549066 ?auto_549068 ) ) ( not ( = ?auto_549066 ?auto_549069 ) ) ( not ( = ?auto_549067 ?auto_549068 ) ) ( not ( = ?auto_549067 ?auto_549069 ) ) ( not ( = ?auto_549068 ?auto_549069 ) ) ( ON ?auto_549067 ?auto_549068 ) ( ON ?auto_549066 ?auto_549067 ) ( ON ?auto_549065 ?auto_549066 ) ( ON ?auto_549064 ?auto_549065 ) ( ON ?auto_549063 ?auto_549064 ) ( ON ?auto_549062 ?auto_549063 ) ( ON ?auto_549061 ?auto_549062 ) ( CLEAR ?auto_549059 ) ( ON ?auto_549060 ?auto_549061 ) ( CLEAR ?auto_549060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_549057 ?auto_549058 ?auto_549059 ?auto_549060 )
      ( MAKE-12PILE ?auto_549057 ?auto_549058 ?auto_549059 ?auto_549060 ?auto_549061 ?auto_549062 ?auto_549063 ?auto_549064 ?auto_549065 ?auto_549066 ?auto_549067 ?auto_549068 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_549107 - BLOCK
      ?auto_549108 - BLOCK
      ?auto_549109 - BLOCK
      ?auto_549110 - BLOCK
      ?auto_549111 - BLOCK
      ?auto_549112 - BLOCK
      ?auto_549113 - BLOCK
      ?auto_549114 - BLOCK
      ?auto_549115 - BLOCK
      ?auto_549116 - BLOCK
      ?auto_549117 - BLOCK
      ?auto_549118 - BLOCK
    )
    :vars
    (
      ?auto_549119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_549118 ?auto_549119 ) ( ON-TABLE ?auto_549107 ) ( ON ?auto_549108 ?auto_549107 ) ( not ( = ?auto_549107 ?auto_549108 ) ) ( not ( = ?auto_549107 ?auto_549109 ) ) ( not ( = ?auto_549107 ?auto_549110 ) ) ( not ( = ?auto_549107 ?auto_549111 ) ) ( not ( = ?auto_549107 ?auto_549112 ) ) ( not ( = ?auto_549107 ?auto_549113 ) ) ( not ( = ?auto_549107 ?auto_549114 ) ) ( not ( = ?auto_549107 ?auto_549115 ) ) ( not ( = ?auto_549107 ?auto_549116 ) ) ( not ( = ?auto_549107 ?auto_549117 ) ) ( not ( = ?auto_549107 ?auto_549118 ) ) ( not ( = ?auto_549107 ?auto_549119 ) ) ( not ( = ?auto_549108 ?auto_549109 ) ) ( not ( = ?auto_549108 ?auto_549110 ) ) ( not ( = ?auto_549108 ?auto_549111 ) ) ( not ( = ?auto_549108 ?auto_549112 ) ) ( not ( = ?auto_549108 ?auto_549113 ) ) ( not ( = ?auto_549108 ?auto_549114 ) ) ( not ( = ?auto_549108 ?auto_549115 ) ) ( not ( = ?auto_549108 ?auto_549116 ) ) ( not ( = ?auto_549108 ?auto_549117 ) ) ( not ( = ?auto_549108 ?auto_549118 ) ) ( not ( = ?auto_549108 ?auto_549119 ) ) ( not ( = ?auto_549109 ?auto_549110 ) ) ( not ( = ?auto_549109 ?auto_549111 ) ) ( not ( = ?auto_549109 ?auto_549112 ) ) ( not ( = ?auto_549109 ?auto_549113 ) ) ( not ( = ?auto_549109 ?auto_549114 ) ) ( not ( = ?auto_549109 ?auto_549115 ) ) ( not ( = ?auto_549109 ?auto_549116 ) ) ( not ( = ?auto_549109 ?auto_549117 ) ) ( not ( = ?auto_549109 ?auto_549118 ) ) ( not ( = ?auto_549109 ?auto_549119 ) ) ( not ( = ?auto_549110 ?auto_549111 ) ) ( not ( = ?auto_549110 ?auto_549112 ) ) ( not ( = ?auto_549110 ?auto_549113 ) ) ( not ( = ?auto_549110 ?auto_549114 ) ) ( not ( = ?auto_549110 ?auto_549115 ) ) ( not ( = ?auto_549110 ?auto_549116 ) ) ( not ( = ?auto_549110 ?auto_549117 ) ) ( not ( = ?auto_549110 ?auto_549118 ) ) ( not ( = ?auto_549110 ?auto_549119 ) ) ( not ( = ?auto_549111 ?auto_549112 ) ) ( not ( = ?auto_549111 ?auto_549113 ) ) ( not ( = ?auto_549111 ?auto_549114 ) ) ( not ( = ?auto_549111 ?auto_549115 ) ) ( not ( = ?auto_549111 ?auto_549116 ) ) ( not ( = ?auto_549111 ?auto_549117 ) ) ( not ( = ?auto_549111 ?auto_549118 ) ) ( not ( = ?auto_549111 ?auto_549119 ) ) ( not ( = ?auto_549112 ?auto_549113 ) ) ( not ( = ?auto_549112 ?auto_549114 ) ) ( not ( = ?auto_549112 ?auto_549115 ) ) ( not ( = ?auto_549112 ?auto_549116 ) ) ( not ( = ?auto_549112 ?auto_549117 ) ) ( not ( = ?auto_549112 ?auto_549118 ) ) ( not ( = ?auto_549112 ?auto_549119 ) ) ( not ( = ?auto_549113 ?auto_549114 ) ) ( not ( = ?auto_549113 ?auto_549115 ) ) ( not ( = ?auto_549113 ?auto_549116 ) ) ( not ( = ?auto_549113 ?auto_549117 ) ) ( not ( = ?auto_549113 ?auto_549118 ) ) ( not ( = ?auto_549113 ?auto_549119 ) ) ( not ( = ?auto_549114 ?auto_549115 ) ) ( not ( = ?auto_549114 ?auto_549116 ) ) ( not ( = ?auto_549114 ?auto_549117 ) ) ( not ( = ?auto_549114 ?auto_549118 ) ) ( not ( = ?auto_549114 ?auto_549119 ) ) ( not ( = ?auto_549115 ?auto_549116 ) ) ( not ( = ?auto_549115 ?auto_549117 ) ) ( not ( = ?auto_549115 ?auto_549118 ) ) ( not ( = ?auto_549115 ?auto_549119 ) ) ( not ( = ?auto_549116 ?auto_549117 ) ) ( not ( = ?auto_549116 ?auto_549118 ) ) ( not ( = ?auto_549116 ?auto_549119 ) ) ( not ( = ?auto_549117 ?auto_549118 ) ) ( not ( = ?auto_549117 ?auto_549119 ) ) ( not ( = ?auto_549118 ?auto_549119 ) ) ( ON ?auto_549117 ?auto_549118 ) ( ON ?auto_549116 ?auto_549117 ) ( ON ?auto_549115 ?auto_549116 ) ( ON ?auto_549114 ?auto_549115 ) ( ON ?auto_549113 ?auto_549114 ) ( ON ?auto_549112 ?auto_549113 ) ( ON ?auto_549111 ?auto_549112 ) ( ON ?auto_549110 ?auto_549111 ) ( CLEAR ?auto_549108 ) ( ON ?auto_549109 ?auto_549110 ) ( CLEAR ?auto_549109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_549107 ?auto_549108 ?auto_549109 )
      ( MAKE-12PILE ?auto_549107 ?auto_549108 ?auto_549109 ?auto_549110 ?auto_549111 ?auto_549112 ?auto_549113 ?auto_549114 ?auto_549115 ?auto_549116 ?auto_549117 ?auto_549118 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_549157 - BLOCK
      ?auto_549158 - BLOCK
      ?auto_549159 - BLOCK
      ?auto_549160 - BLOCK
      ?auto_549161 - BLOCK
      ?auto_549162 - BLOCK
      ?auto_549163 - BLOCK
      ?auto_549164 - BLOCK
      ?auto_549165 - BLOCK
      ?auto_549166 - BLOCK
      ?auto_549167 - BLOCK
      ?auto_549168 - BLOCK
    )
    :vars
    (
      ?auto_549169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_549168 ?auto_549169 ) ( ON-TABLE ?auto_549157 ) ( not ( = ?auto_549157 ?auto_549158 ) ) ( not ( = ?auto_549157 ?auto_549159 ) ) ( not ( = ?auto_549157 ?auto_549160 ) ) ( not ( = ?auto_549157 ?auto_549161 ) ) ( not ( = ?auto_549157 ?auto_549162 ) ) ( not ( = ?auto_549157 ?auto_549163 ) ) ( not ( = ?auto_549157 ?auto_549164 ) ) ( not ( = ?auto_549157 ?auto_549165 ) ) ( not ( = ?auto_549157 ?auto_549166 ) ) ( not ( = ?auto_549157 ?auto_549167 ) ) ( not ( = ?auto_549157 ?auto_549168 ) ) ( not ( = ?auto_549157 ?auto_549169 ) ) ( not ( = ?auto_549158 ?auto_549159 ) ) ( not ( = ?auto_549158 ?auto_549160 ) ) ( not ( = ?auto_549158 ?auto_549161 ) ) ( not ( = ?auto_549158 ?auto_549162 ) ) ( not ( = ?auto_549158 ?auto_549163 ) ) ( not ( = ?auto_549158 ?auto_549164 ) ) ( not ( = ?auto_549158 ?auto_549165 ) ) ( not ( = ?auto_549158 ?auto_549166 ) ) ( not ( = ?auto_549158 ?auto_549167 ) ) ( not ( = ?auto_549158 ?auto_549168 ) ) ( not ( = ?auto_549158 ?auto_549169 ) ) ( not ( = ?auto_549159 ?auto_549160 ) ) ( not ( = ?auto_549159 ?auto_549161 ) ) ( not ( = ?auto_549159 ?auto_549162 ) ) ( not ( = ?auto_549159 ?auto_549163 ) ) ( not ( = ?auto_549159 ?auto_549164 ) ) ( not ( = ?auto_549159 ?auto_549165 ) ) ( not ( = ?auto_549159 ?auto_549166 ) ) ( not ( = ?auto_549159 ?auto_549167 ) ) ( not ( = ?auto_549159 ?auto_549168 ) ) ( not ( = ?auto_549159 ?auto_549169 ) ) ( not ( = ?auto_549160 ?auto_549161 ) ) ( not ( = ?auto_549160 ?auto_549162 ) ) ( not ( = ?auto_549160 ?auto_549163 ) ) ( not ( = ?auto_549160 ?auto_549164 ) ) ( not ( = ?auto_549160 ?auto_549165 ) ) ( not ( = ?auto_549160 ?auto_549166 ) ) ( not ( = ?auto_549160 ?auto_549167 ) ) ( not ( = ?auto_549160 ?auto_549168 ) ) ( not ( = ?auto_549160 ?auto_549169 ) ) ( not ( = ?auto_549161 ?auto_549162 ) ) ( not ( = ?auto_549161 ?auto_549163 ) ) ( not ( = ?auto_549161 ?auto_549164 ) ) ( not ( = ?auto_549161 ?auto_549165 ) ) ( not ( = ?auto_549161 ?auto_549166 ) ) ( not ( = ?auto_549161 ?auto_549167 ) ) ( not ( = ?auto_549161 ?auto_549168 ) ) ( not ( = ?auto_549161 ?auto_549169 ) ) ( not ( = ?auto_549162 ?auto_549163 ) ) ( not ( = ?auto_549162 ?auto_549164 ) ) ( not ( = ?auto_549162 ?auto_549165 ) ) ( not ( = ?auto_549162 ?auto_549166 ) ) ( not ( = ?auto_549162 ?auto_549167 ) ) ( not ( = ?auto_549162 ?auto_549168 ) ) ( not ( = ?auto_549162 ?auto_549169 ) ) ( not ( = ?auto_549163 ?auto_549164 ) ) ( not ( = ?auto_549163 ?auto_549165 ) ) ( not ( = ?auto_549163 ?auto_549166 ) ) ( not ( = ?auto_549163 ?auto_549167 ) ) ( not ( = ?auto_549163 ?auto_549168 ) ) ( not ( = ?auto_549163 ?auto_549169 ) ) ( not ( = ?auto_549164 ?auto_549165 ) ) ( not ( = ?auto_549164 ?auto_549166 ) ) ( not ( = ?auto_549164 ?auto_549167 ) ) ( not ( = ?auto_549164 ?auto_549168 ) ) ( not ( = ?auto_549164 ?auto_549169 ) ) ( not ( = ?auto_549165 ?auto_549166 ) ) ( not ( = ?auto_549165 ?auto_549167 ) ) ( not ( = ?auto_549165 ?auto_549168 ) ) ( not ( = ?auto_549165 ?auto_549169 ) ) ( not ( = ?auto_549166 ?auto_549167 ) ) ( not ( = ?auto_549166 ?auto_549168 ) ) ( not ( = ?auto_549166 ?auto_549169 ) ) ( not ( = ?auto_549167 ?auto_549168 ) ) ( not ( = ?auto_549167 ?auto_549169 ) ) ( not ( = ?auto_549168 ?auto_549169 ) ) ( ON ?auto_549167 ?auto_549168 ) ( ON ?auto_549166 ?auto_549167 ) ( ON ?auto_549165 ?auto_549166 ) ( ON ?auto_549164 ?auto_549165 ) ( ON ?auto_549163 ?auto_549164 ) ( ON ?auto_549162 ?auto_549163 ) ( ON ?auto_549161 ?auto_549162 ) ( ON ?auto_549160 ?auto_549161 ) ( ON ?auto_549159 ?auto_549160 ) ( CLEAR ?auto_549157 ) ( ON ?auto_549158 ?auto_549159 ) ( CLEAR ?auto_549158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_549157 ?auto_549158 )
      ( MAKE-12PILE ?auto_549157 ?auto_549158 ?auto_549159 ?auto_549160 ?auto_549161 ?auto_549162 ?auto_549163 ?auto_549164 ?auto_549165 ?auto_549166 ?auto_549167 ?auto_549168 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_549207 - BLOCK
      ?auto_549208 - BLOCK
      ?auto_549209 - BLOCK
      ?auto_549210 - BLOCK
      ?auto_549211 - BLOCK
      ?auto_549212 - BLOCK
      ?auto_549213 - BLOCK
      ?auto_549214 - BLOCK
      ?auto_549215 - BLOCK
      ?auto_549216 - BLOCK
      ?auto_549217 - BLOCK
      ?auto_549218 - BLOCK
    )
    :vars
    (
      ?auto_549219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_549218 ?auto_549219 ) ( not ( = ?auto_549207 ?auto_549208 ) ) ( not ( = ?auto_549207 ?auto_549209 ) ) ( not ( = ?auto_549207 ?auto_549210 ) ) ( not ( = ?auto_549207 ?auto_549211 ) ) ( not ( = ?auto_549207 ?auto_549212 ) ) ( not ( = ?auto_549207 ?auto_549213 ) ) ( not ( = ?auto_549207 ?auto_549214 ) ) ( not ( = ?auto_549207 ?auto_549215 ) ) ( not ( = ?auto_549207 ?auto_549216 ) ) ( not ( = ?auto_549207 ?auto_549217 ) ) ( not ( = ?auto_549207 ?auto_549218 ) ) ( not ( = ?auto_549207 ?auto_549219 ) ) ( not ( = ?auto_549208 ?auto_549209 ) ) ( not ( = ?auto_549208 ?auto_549210 ) ) ( not ( = ?auto_549208 ?auto_549211 ) ) ( not ( = ?auto_549208 ?auto_549212 ) ) ( not ( = ?auto_549208 ?auto_549213 ) ) ( not ( = ?auto_549208 ?auto_549214 ) ) ( not ( = ?auto_549208 ?auto_549215 ) ) ( not ( = ?auto_549208 ?auto_549216 ) ) ( not ( = ?auto_549208 ?auto_549217 ) ) ( not ( = ?auto_549208 ?auto_549218 ) ) ( not ( = ?auto_549208 ?auto_549219 ) ) ( not ( = ?auto_549209 ?auto_549210 ) ) ( not ( = ?auto_549209 ?auto_549211 ) ) ( not ( = ?auto_549209 ?auto_549212 ) ) ( not ( = ?auto_549209 ?auto_549213 ) ) ( not ( = ?auto_549209 ?auto_549214 ) ) ( not ( = ?auto_549209 ?auto_549215 ) ) ( not ( = ?auto_549209 ?auto_549216 ) ) ( not ( = ?auto_549209 ?auto_549217 ) ) ( not ( = ?auto_549209 ?auto_549218 ) ) ( not ( = ?auto_549209 ?auto_549219 ) ) ( not ( = ?auto_549210 ?auto_549211 ) ) ( not ( = ?auto_549210 ?auto_549212 ) ) ( not ( = ?auto_549210 ?auto_549213 ) ) ( not ( = ?auto_549210 ?auto_549214 ) ) ( not ( = ?auto_549210 ?auto_549215 ) ) ( not ( = ?auto_549210 ?auto_549216 ) ) ( not ( = ?auto_549210 ?auto_549217 ) ) ( not ( = ?auto_549210 ?auto_549218 ) ) ( not ( = ?auto_549210 ?auto_549219 ) ) ( not ( = ?auto_549211 ?auto_549212 ) ) ( not ( = ?auto_549211 ?auto_549213 ) ) ( not ( = ?auto_549211 ?auto_549214 ) ) ( not ( = ?auto_549211 ?auto_549215 ) ) ( not ( = ?auto_549211 ?auto_549216 ) ) ( not ( = ?auto_549211 ?auto_549217 ) ) ( not ( = ?auto_549211 ?auto_549218 ) ) ( not ( = ?auto_549211 ?auto_549219 ) ) ( not ( = ?auto_549212 ?auto_549213 ) ) ( not ( = ?auto_549212 ?auto_549214 ) ) ( not ( = ?auto_549212 ?auto_549215 ) ) ( not ( = ?auto_549212 ?auto_549216 ) ) ( not ( = ?auto_549212 ?auto_549217 ) ) ( not ( = ?auto_549212 ?auto_549218 ) ) ( not ( = ?auto_549212 ?auto_549219 ) ) ( not ( = ?auto_549213 ?auto_549214 ) ) ( not ( = ?auto_549213 ?auto_549215 ) ) ( not ( = ?auto_549213 ?auto_549216 ) ) ( not ( = ?auto_549213 ?auto_549217 ) ) ( not ( = ?auto_549213 ?auto_549218 ) ) ( not ( = ?auto_549213 ?auto_549219 ) ) ( not ( = ?auto_549214 ?auto_549215 ) ) ( not ( = ?auto_549214 ?auto_549216 ) ) ( not ( = ?auto_549214 ?auto_549217 ) ) ( not ( = ?auto_549214 ?auto_549218 ) ) ( not ( = ?auto_549214 ?auto_549219 ) ) ( not ( = ?auto_549215 ?auto_549216 ) ) ( not ( = ?auto_549215 ?auto_549217 ) ) ( not ( = ?auto_549215 ?auto_549218 ) ) ( not ( = ?auto_549215 ?auto_549219 ) ) ( not ( = ?auto_549216 ?auto_549217 ) ) ( not ( = ?auto_549216 ?auto_549218 ) ) ( not ( = ?auto_549216 ?auto_549219 ) ) ( not ( = ?auto_549217 ?auto_549218 ) ) ( not ( = ?auto_549217 ?auto_549219 ) ) ( not ( = ?auto_549218 ?auto_549219 ) ) ( ON ?auto_549217 ?auto_549218 ) ( ON ?auto_549216 ?auto_549217 ) ( ON ?auto_549215 ?auto_549216 ) ( ON ?auto_549214 ?auto_549215 ) ( ON ?auto_549213 ?auto_549214 ) ( ON ?auto_549212 ?auto_549213 ) ( ON ?auto_549211 ?auto_549212 ) ( ON ?auto_549210 ?auto_549211 ) ( ON ?auto_549209 ?auto_549210 ) ( ON ?auto_549208 ?auto_549209 ) ( ON ?auto_549207 ?auto_549208 ) ( CLEAR ?auto_549207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_549207 )
      ( MAKE-12PILE ?auto_549207 ?auto_549208 ?auto_549209 ?auto_549210 ?auto_549211 ?auto_549212 ?auto_549213 ?auto_549214 ?auto_549215 ?auto_549216 ?auto_549217 ?auto_549218 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_549258 - BLOCK
      ?auto_549259 - BLOCK
      ?auto_549260 - BLOCK
      ?auto_549261 - BLOCK
      ?auto_549262 - BLOCK
      ?auto_549263 - BLOCK
      ?auto_549264 - BLOCK
      ?auto_549265 - BLOCK
      ?auto_549266 - BLOCK
      ?auto_549267 - BLOCK
      ?auto_549268 - BLOCK
      ?auto_549269 - BLOCK
      ?auto_549270 - BLOCK
    )
    :vars
    (
      ?auto_549271 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_549269 ) ( ON ?auto_549270 ?auto_549271 ) ( CLEAR ?auto_549270 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_549258 ) ( ON ?auto_549259 ?auto_549258 ) ( ON ?auto_549260 ?auto_549259 ) ( ON ?auto_549261 ?auto_549260 ) ( ON ?auto_549262 ?auto_549261 ) ( ON ?auto_549263 ?auto_549262 ) ( ON ?auto_549264 ?auto_549263 ) ( ON ?auto_549265 ?auto_549264 ) ( ON ?auto_549266 ?auto_549265 ) ( ON ?auto_549267 ?auto_549266 ) ( ON ?auto_549268 ?auto_549267 ) ( ON ?auto_549269 ?auto_549268 ) ( not ( = ?auto_549258 ?auto_549259 ) ) ( not ( = ?auto_549258 ?auto_549260 ) ) ( not ( = ?auto_549258 ?auto_549261 ) ) ( not ( = ?auto_549258 ?auto_549262 ) ) ( not ( = ?auto_549258 ?auto_549263 ) ) ( not ( = ?auto_549258 ?auto_549264 ) ) ( not ( = ?auto_549258 ?auto_549265 ) ) ( not ( = ?auto_549258 ?auto_549266 ) ) ( not ( = ?auto_549258 ?auto_549267 ) ) ( not ( = ?auto_549258 ?auto_549268 ) ) ( not ( = ?auto_549258 ?auto_549269 ) ) ( not ( = ?auto_549258 ?auto_549270 ) ) ( not ( = ?auto_549258 ?auto_549271 ) ) ( not ( = ?auto_549259 ?auto_549260 ) ) ( not ( = ?auto_549259 ?auto_549261 ) ) ( not ( = ?auto_549259 ?auto_549262 ) ) ( not ( = ?auto_549259 ?auto_549263 ) ) ( not ( = ?auto_549259 ?auto_549264 ) ) ( not ( = ?auto_549259 ?auto_549265 ) ) ( not ( = ?auto_549259 ?auto_549266 ) ) ( not ( = ?auto_549259 ?auto_549267 ) ) ( not ( = ?auto_549259 ?auto_549268 ) ) ( not ( = ?auto_549259 ?auto_549269 ) ) ( not ( = ?auto_549259 ?auto_549270 ) ) ( not ( = ?auto_549259 ?auto_549271 ) ) ( not ( = ?auto_549260 ?auto_549261 ) ) ( not ( = ?auto_549260 ?auto_549262 ) ) ( not ( = ?auto_549260 ?auto_549263 ) ) ( not ( = ?auto_549260 ?auto_549264 ) ) ( not ( = ?auto_549260 ?auto_549265 ) ) ( not ( = ?auto_549260 ?auto_549266 ) ) ( not ( = ?auto_549260 ?auto_549267 ) ) ( not ( = ?auto_549260 ?auto_549268 ) ) ( not ( = ?auto_549260 ?auto_549269 ) ) ( not ( = ?auto_549260 ?auto_549270 ) ) ( not ( = ?auto_549260 ?auto_549271 ) ) ( not ( = ?auto_549261 ?auto_549262 ) ) ( not ( = ?auto_549261 ?auto_549263 ) ) ( not ( = ?auto_549261 ?auto_549264 ) ) ( not ( = ?auto_549261 ?auto_549265 ) ) ( not ( = ?auto_549261 ?auto_549266 ) ) ( not ( = ?auto_549261 ?auto_549267 ) ) ( not ( = ?auto_549261 ?auto_549268 ) ) ( not ( = ?auto_549261 ?auto_549269 ) ) ( not ( = ?auto_549261 ?auto_549270 ) ) ( not ( = ?auto_549261 ?auto_549271 ) ) ( not ( = ?auto_549262 ?auto_549263 ) ) ( not ( = ?auto_549262 ?auto_549264 ) ) ( not ( = ?auto_549262 ?auto_549265 ) ) ( not ( = ?auto_549262 ?auto_549266 ) ) ( not ( = ?auto_549262 ?auto_549267 ) ) ( not ( = ?auto_549262 ?auto_549268 ) ) ( not ( = ?auto_549262 ?auto_549269 ) ) ( not ( = ?auto_549262 ?auto_549270 ) ) ( not ( = ?auto_549262 ?auto_549271 ) ) ( not ( = ?auto_549263 ?auto_549264 ) ) ( not ( = ?auto_549263 ?auto_549265 ) ) ( not ( = ?auto_549263 ?auto_549266 ) ) ( not ( = ?auto_549263 ?auto_549267 ) ) ( not ( = ?auto_549263 ?auto_549268 ) ) ( not ( = ?auto_549263 ?auto_549269 ) ) ( not ( = ?auto_549263 ?auto_549270 ) ) ( not ( = ?auto_549263 ?auto_549271 ) ) ( not ( = ?auto_549264 ?auto_549265 ) ) ( not ( = ?auto_549264 ?auto_549266 ) ) ( not ( = ?auto_549264 ?auto_549267 ) ) ( not ( = ?auto_549264 ?auto_549268 ) ) ( not ( = ?auto_549264 ?auto_549269 ) ) ( not ( = ?auto_549264 ?auto_549270 ) ) ( not ( = ?auto_549264 ?auto_549271 ) ) ( not ( = ?auto_549265 ?auto_549266 ) ) ( not ( = ?auto_549265 ?auto_549267 ) ) ( not ( = ?auto_549265 ?auto_549268 ) ) ( not ( = ?auto_549265 ?auto_549269 ) ) ( not ( = ?auto_549265 ?auto_549270 ) ) ( not ( = ?auto_549265 ?auto_549271 ) ) ( not ( = ?auto_549266 ?auto_549267 ) ) ( not ( = ?auto_549266 ?auto_549268 ) ) ( not ( = ?auto_549266 ?auto_549269 ) ) ( not ( = ?auto_549266 ?auto_549270 ) ) ( not ( = ?auto_549266 ?auto_549271 ) ) ( not ( = ?auto_549267 ?auto_549268 ) ) ( not ( = ?auto_549267 ?auto_549269 ) ) ( not ( = ?auto_549267 ?auto_549270 ) ) ( not ( = ?auto_549267 ?auto_549271 ) ) ( not ( = ?auto_549268 ?auto_549269 ) ) ( not ( = ?auto_549268 ?auto_549270 ) ) ( not ( = ?auto_549268 ?auto_549271 ) ) ( not ( = ?auto_549269 ?auto_549270 ) ) ( not ( = ?auto_549269 ?auto_549271 ) ) ( not ( = ?auto_549270 ?auto_549271 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_549270 ?auto_549271 )
      ( !STACK ?auto_549270 ?auto_549269 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_549312 - BLOCK
      ?auto_549313 - BLOCK
      ?auto_549314 - BLOCK
      ?auto_549315 - BLOCK
      ?auto_549316 - BLOCK
      ?auto_549317 - BLOCK
      ?auto_549318 - BLOCK
      ?auto_549319 - BLOCK
      ?auto_549320 - BLOCK
      ?auto_549321 - BLOCK
      ?auto_549322 - BLOCK
      ?auto_549323 - BLOCK
      ?auto_549324 - BLOCK
    )
    :vars
    (
      ?auto_549325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_549324 ?auto_549325 ) ( ON-TABLE ?auto_549312 ) ( ON ?auto_549313 ?auto_549312 ) ( ON ?auto_549314 ?auto_549313 ) ( ON ?auto_549315 ?auto_549314 ) ( ON ?auto_549316 ?auto_549315 ) ( ON ?auto_549317 ?auto_549316 ) ( ON ?auto_549318 ?auto_549317 ) ( ON ?auto_549319 ?auto_549318 ) ( ON ?auto_549320 ?auto_549319 ) ( ON ?auto_549321 ?auto_549320 ) ( ON ?auto_549322 ?auto_549321 ) ( not ( = ?auto_549312 ?auto_549313 ) ) ( not ( = ?auto_549312 ?auto_549314 ) ) ( not ( = ?auto_549312 ?auto_549315 ) ) ( not ( = ?auto_549312 ?auto_549316 ) ) ( not ( = ?auto_549312 ?auto_549317 ) ) ( not ( = ?auto_549312 ?auto_549318 ) ) ( not ( = ?auto_549312 ?auto_549319 ) ) ( not ( = ?auto_549312 ?auto_549320 ) ) ( not ( = ?auto_549312 ?auto_549321 ) ) ( not ( = ?auto_549312 ?auto_549322 ) ) ( not ( = ?auto_549312 ?auto_549323 ) ) ( not ( = ?auto_549312 ?auto_549324 ) ) ( not ( = ?auto_549312 ?auto_549325 ) ) ( not ( = ?auto_549313 ?auto_549314 ) ) ( not ( = ?auto_549313 ?auto_549315 ) ) ( not ( = ?auto_549313 ?auto_549316 ) ) ( not ( = ?auto_549313 ?auto_549317 ) ) ( not ( = ?auto_549313 ?auto_549318 ) ) ( not ( = ?auto_549313 ?auto_549319 ) ) ( not ( = ?auto_549313 ?auto_549320 ) ) ( not ( = ?auto_549313 ?auto_549321 ) ) ( not ( = ?auto_549313 ?auto_549322 ) ) ( not ( = ?auto_549313 ?auto_549323 ) ) ( not ( = ?auto_549313 ?auto_549324 ) ) ( not ( = ?auto_549313 ?auto_549325 ) ) ( not ( = ?auto_549314 ?auto_549315 ) ) ( not ( = ?auto_549314 ?auto_549316 ) ) ( not ( = ?auto_549314 ?auto_549317 ) ) ( not ( = ?auto_549314 ?auto_549318 ) ) ( not ( = ?auto_549314 ?auto_549319 ) ) ( not ( = ?auto_549314 ?auto_549320 ) ) ( not ( = ?auto_549314 ?auto_549321 ) ) ( not ( = ?auto_549314 ?auto_549322 ) ) ( not ( = ?auto_549314 ?auto_549323 ) ) ( not ( = ?auto_549314 ?auto_549324 ) ) ( not ( = ?auto_549314 ?auto_549325 ) ) ( not ( = ?auto_549315 ?auto_549316 ) ) ( not ( = ?auto_549315 ?auto_549317 ) ) ( not ( = ?auto_549315 ?auto_549318 ) ) ( not ( = ?auto_549315 ?auto_549319 ) ) ( not ( = ?auto_549315 ?auto_549320 ) ) ( not ( = ?auto_549315 ?auto_549321 ) ) ( not ( = ?auto_549315 ?auto_549322 ) ) ( not ( = ?auto_549315 ?auto_549323 ) ) ( not ( = ?auto_549315 ?auto_549324 ) ) ( not ( = ?auto_549315 ?auto_549325 ) ) ( not ( = ?auto_549316 ?auto_549317 ) ) ( not ( = ?auto_549316 ?auto_549318 ) ) ( not ( = ?auto_549316 ?auto_549319 ) ) ( not ( = ?auto_549316 ?auto_549320 ) ) ( not ( = ?auto_549316 ?auto_549321 ) ) ( not ( = ?auto_549316 ?auto_549322 ) ) ( not ( = ?auto_549316 ?auto_549323 ) ) ( not ( = ?auto_549316 ?auto_549324 ) ) ( not ( = ?auto_549316 ?auto_549325 ) ) ( not ( = ?auto_549317 ?auto_549318 ) ) ( not ( = ?auto_549317 ?auto_549319 ) ) ( not ( = ?auto_549317 ?auto_549320 ) ) ( not ( = ?auto_549317 ?auto_549321 ) ) ( not ( = ?auto_549317 ?auto_549322 ) ) ( not ( = ?auto_549317 ?auto_549323 ) ) ( not ( = ?auto_549317 ?auto_549324 ) ) ( not ( = ?auto_549317 ?auto_549325 ) ) ( not ( = ?auto_549318 ?auto_549319 ) ) ( not ( = ?auto_549318 ?auto_549320 ) ) ( not ( = ?auto_549318 ?auto_549321 ) ) ( not ( = ?auto_549318 ?auto_549322 ) ) ( not ( = ?auto_549318 ?auto_549323 ) ) ( not ( = ?auto_549318 ?auto_549324 ) ) ( not ( = ?auto_549318 ?auto_549325 ) ) ( not ( = ?auto_549319 ?auto_549320 ) ) ( not ( = ?auto_549319 ?auto_549321 ) ) ( not ( = ?auto_549319 ?auto_549322 ) ) ( not ( = ?auto_549319 ?auto_549323 ) ) ( not ( = ?auto_549319 ?auto_549324 ) ) ( not ( = ?auto_549319 ?auto_549325 ) ) ( not ( = ?auto_549320 ?auto_549321 ) ) ( not ( = ?auto_549320 ?auto_549322 ) ) ( not ( = ?auto_549320 ?auto_549323 ) ) ( not ( = ?auto_549320 ?auto_549324 ) ) ( not ( = ?auto_549320 ?auto_549325 ) ) ( not ( = ?auto_549321 ?auto_549322 ) ) ( not ( = ?auto_549321 ?auto_549323 ) ) ( not ( = ?auto_549321 ?auto_549324 ) ) ( not ( = ?auto_549321 ?auto_549325 ) ) ( not ( = ?auto_549322 ?auto_549323 ) ) ( not ( = ?auto_549322 ?auto_549324 ) ) ( not ( = ?auto_549322 ?auto_549325 ) ) ( not ( = ?auto_549323 ?auto_549324 ) ) ( not ( = ?auto_549323 ?auto_549325 ) ) ( not ( = ?auto_549324 ?auto_549325 ) ) ( CLEAR ?auto_549322 ) ( ON ?auto_549323 ?auto_549324 ) ( CLEAR ?auto_549323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_549312 ?auto_549313 ?auto_549314 ?auto_549315 ?auto_549316 ?auto_549317 ?auto_549318 ?auto_549319 ?auto_549320 ?auto_549321 ?auto_549322 ?auto_549323 )
      ( MAKE-13PILE ?auto_549312 ?auto_549313 ?auto_549314 ?auto_549315 ?auto_549316 ?auto_549317 ?auto_549318 ?auto_549319 ?auto_549320 ?auto_549321 ?auto_549322 ?auto_549323 ?auto_549324 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_549366 - BLOCK
      ?auto_549367 - BLOCK
      ?auto_549368 - BLOCK
      ?auto_549369 - BLOCK
      ?auto_549370 - BLOCK
      ?auto_549371 - BLOCK
      ?auto_549372 - BLOCK
      ?auto_549373 - BLOCK
      ?auto_549374 - BLOCK
      ?auto_549375 - BLOCK
      ?auto_549376 - BLOCK
      ?auto_549377 - BLOCK
      ?auto_549378 - BLOCK
    )
    :vars
    (
      ?auto_549379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_549378 ?auto_549379 ) ( ON-TABLE ?auto_549366 ) ( ON ?auto_549367 ?auto_549366 ) ( ON ?auto_549368 ?auto_549367 ) ( ON ?auto_549369 ?auto_549368 ) ( ON ?auto_549370 ?auto_549369 ) ( ON ?auto_549371 ?auto_549370 ) ( ON ?auto_549372 ?auto_549371 ) ( ON ?auto_549373 ?auto_549372 ) ( ON ?auto_549374 ?auto_549373 ) ( ON ?auto_549375 ?auto_549374 ) ( not ( = ?auto_549366 ?auto_549367 ) ) ( not ( = ?auto_549366 ?auto_549368 ) ) ( not ( = ?auto_549366 ?auto_549369 ) ) ( not ( = ?auto_549366 ?auto_549370 ) ) ( not ( = ?auto_549366 ?auto_549371 ) ) ( not ( = ?auto_549366 ?auto_549372 ) ) ( not ( = ?auto_549366 ?auto_549373 ) ) ( not ( = ?auto_549366 ?auto_549374 ) ) ( not ( = ?auto_549366 ?auto_549375 ) ) ( not ( = ?auto_549366 ?auto_549376 ) ) ( not ( = ?auto_549366 ?auto_549377 ) ) ( not ( = ?auto_549366 ?auto_549378 ) ) ( not ( = ?auto_549366 ?auto_549379 ) ) ( not ( = ?auto_549367 ?auto_549368 ) ) ( not ( = ?auto_549367 ?auto_549369 ) ) ( not ( = ?auto_549367 ?auto_549370 ) ) ( not ( = ?auto_549367 ?auto_549371 ) ) ( not ( = ?auto_549367 ?auto_549372 ) ) ( not ( = ?auto_549367 ?auto_549373 ) ) ( not ( = ?auto_549367 ?auto_549374 ) ) ( not ( = ?auto_549367 ?auto_549375 ) ) ( not ( = ?auto_549367 ?auto_549376 ) ) ( not ( = ?auto_549367 ?auto_549377 ) ) ( not ( = ?auto_549367 ?auto_549378 ) ) ( not ( = ?auto_549367 ?auto_549379 ) ) ( not ( = ?auto_549368 ?auto_549369 ) ) ( not ( = ?auto_549368 ?auto_549370 ) ) ( not ( = ?auto_549368 ?auto_549371 ) ) ( not ( = ?auto_549368 ?auto_549372 ) ) ( not ( = ?auto_549368 ?auto_549373 ) ) ( not ( = ?auto_549368 ?auto_549374 ) ) ( not ( = ?auto_549368 ?auto_549375 ) ) ( not ( = ?auto_549368 ?auto_549376 ) ) ( not ( = ?auto_549368 ?auto_549377 ) ) ( not ( = ?auto_549368 ?auto_549378 ) ) ( not ( = ?auto_549368 ?auto_549379 ) ) ( not ( = ?auto_549369 ?auto_549370 ) ) ( not ( = ?auto_549369 ?auto_549371 ) ) ( not ( = ?auto_549369 ?auto_549372 ) ) ( not ( = ?auto_549369 ?auto_549373 ) ) ( not ( = ?auto_549369 ?auto_549374 ) ) ( not ( = ?auto_549369 ?auto_549375 ) ) ( not ( = ?auto_549369 ?auto_549376 ) ) ( not ( = ?auto_549369 ?auto_549377 ) ) ( not ( = ?auto_549369 ?auto_549378 ) ) ( not ( = ?auto_549369 ?auto_549379 ) ) ( not ( = ?auto_549370 ?auto_549371 ) ) ( not ( = ?auto_549370 ?auto_549372 ) ) ( not ( = ?auto_549370 ?auto_549373 ) ) ( not ( = ?auto_549370 ?auto_549374 ) ) ( not ( = ?auto_549370 ?auto_549375 ) ) ( not ( = ?auto_549370 ?auto_549376 ) ) ( not ( = ?auto_549370 ?auto_549377 ) ) ( not ( = ?auto_549370 ?auto_549378 ) ) ( not ( = ?auto_549370 ?auto_549379 ) ) ( not ( = ?auto_549371 ?auto_549372 ) ) ( not ( = ?auto_549371 ?auto_549373 ) ) ( not ( = ?auto_549371 ?auto_549374 ) ) ( not ( = ?auto_549371 ?auto_549375 ) ) ( not ( = ?auto_549371 ?auto_549376 ) ) ( not ( = ?auto_549371 ?auto_549377 ) ) ( not ( = ?auto_549371 ?auto_549378 ) ) ( not ( = ?auto_549371 ?auto_549379 ) ) ( not ( = ?auto_549372 ?auto_549373 ) ) ( not ( = ?auto_549372 ?auto_549374 ) ) ( not ( = ?auto_549372 ?auto_549375 ) ) ( not ( = ?auto_549372 ?auto_549376 ) ) ( not ( = ?auto_549372 ?auto_549377 ) ) ( not ( = ?auto_549372 ?auto_549378 ) ) ( not ( = ?auto_549372 ?auto_549379 ) ) ( not ( = ?auto_549373 ?auto_549374 ) ) ( not ( = ?auto_549373 ?auto_549375 ) ) ( not ( = ?auto_549373 ?auto_549376 ) ) ( not ( = ?auto_549373 ?auto_549377 ) ) ( not ( = ?auto_549373 ?auto_549378 ) ) ( not ( = ?auto_549373 ?auto_549379 ) ) ( not ( = ?auto_549374 ?auto_549375 ) ) ( not ( = ?auto_549374 ?auto_549376 ) ) ( not ( = ?auto_549374 ?auto_549377 ) ) ( not ( = ?auto_549374 ?auto_549378 ) ) ( not ( = ?auto_549374 ?auto_549379 ) ) ( not ( = ?auto_549375 ?auto_549376 ) ) ( not ( = ?auto_549375 ?auto_549377 ) ) ( not ( = ?auto_549375 ?auto_549378 ) ) ( not ( = ?auto_549375 ?auto_549379 ) ) ( not ( = ?auto_549376 ?auto_549377 ) ) ( not ( = ?auto_549376 ?auto_549378 ) ) ( not ( = ?auto_549376 ?auto_549379 ) ) ( not ( = ?auto_549377 ?auto_549378 ) ) ( not ( = ?auto_549377 ?auto_549379 ) ) ( not ( = ?auto_549378 ?auto_549379 ) ) ( ON ?auto_549377 ?auto_549378 ) ( CLEAR ?auto_549375 ) ( ON ?auto_549376 ?auto_549377 ) ( CLEAR ?auto_549376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_549366 ?auto_549367 ?auto_549368 ?auto_549369 ?auto_549370 ?auto_549371 ?auto_549372 ?auto_549373 ?auto_549374 ?auto_549375 ?auto_549376 )
      ( MAKE-13PILE ?auto_549366 ?auto_549367 ?auto_549368 ?auto_549369 ?auto_549370 ?auto_549371 ?auto_549372 ?auto_549373 ?auto_549374 ?auto_549375 ?auto_549376 ?auto_549377 ?auto_549378 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_549420 - BLOCK
      ?auto_549421 - BLOCK
      ?auto_549422 - BLOCK
      ?auto_549423 - BLOCK
      ?auto_549424 - BLOCK
      ?auto_549425 - BLOCK
      ?auto_549426 - BLOCK
      ?auto_549427 - BLOCK
      ?auto_549428 - BLOCK
      ?auto_549429 - BLOCK
      ?auto_549430 - BLOCK
      ?auto_549431 - BLOCK
      ?auto_549432 - BLOCK
    )
    :vars
    (
      ?auto_549433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_549432 ?auto_549433 ) ( ON-TABLE ?auto_549420 ) ( ON ?auto_549421 ?auto_549420 ) ( ON ?auto_549422 ?auto_549421 ) ( ON ?auto_549423 ?auto_549422 ) ( ON ?auto_549424 ?auto_549423 ) ( ON ?auto_549425 ?auto_549424 ) ( ON ?auto_549426 ?auto_549425 ) ( ON ?auto_549427 ?auto_549426 ) ( ON ?auto_549428 ?auto_549427 ) ( not ( = ?auto_549420 ?auto_549421 ) ) ( not ( = ?auto_549420 ?auto_549422 ) ) ( not ( = ?auto_549420 ?auto_549423 ) ) ( not ( = ?auto_549420 ?auto_549424 ) ) ( not ( = ?auto_549420 ?auto_549425 ) ) ( not ( = ?auto_549420 ?auto_549426 ) ) ( not ( = ?auto_549420 ?auto_549427 ) ) ( not ( = ?auto_549420 ?auto_549428 ) ) ( not ( = ?auto_549420 ?auto_549429 ) ) ( not ( = ?auto_549420 ?auto_549430 ) ) ( not ( = ?auto_549420 ?auto_549431 ) ) ( not ( = ?auto_549420 ?auto_549432 ) ) ( not ( = ?auto_549420 ?auto_549433 ) ) ( not ( = ?auto_549421 ?auto_549422 ) ) ( not ( = ?auto_549421 ?auto_549423 ) ) ( not ( = ?auto_549421 ?auto_549424 ) ) ( not ( = ?auto_549421 ?auto_549425 ) ) ( not ( = ?auto_549421 ?auto_549426 ) ) ( not ( = ?auto_549421 ?auto_549427 ) ) ( not ( = ?auto_549421 ?auto_549428 ) ) ( not ( = ?auto_549421 ?auto_549429 ) ) ( not ( = ?auto_549421 ?auto_549430 ) ) ( not ( = ?auto_549421 ?auto_549431 ) ) ( not ( = ?auto_549421 ?auto_549432 ) ) ( not ( = ?auto_549421 ?auto_549433 ) ) ( not ( = ?auto_549422 ?auto_549423 ) ) ( not ( = ?auto_549422 ?auto_549424 ) ) ( not ( = ?auto_549422 ?auto_549425 ) ) ( not ( = ?auto_549422 ?auto_549426 ) ) ( not ( = ?auto_549422 ?auto_549427 ) ) ( not ( = ?auto_549422 ?auto_549428 ) ) ( not ( = ?auto_549422 ?auto_549429 ) ) ( not ( = ?auto_549422 ?auto_549430 ) ) ( not ( = ?auto_549422 ?auto_549431 ) ) ( not ( = ?auto_549422 ?auto_549432 ) ) ( not ( = ?auto_549422 ?auto_549433 ) ) ( not ( = ?auto_549423 ?auto_549424 ) ) ( not ( = ?auto_549423 ?auto_549425 ) ) ( not ( = ?auto_549423 ?auto_549426 ) ) ( not ( = ?auto_549423 ?auto_549427 ) ) ( not ( = ?auto_549423 ?auto_549428 ) ) ( not ( = ?auto_549423 ?auto_549429 ) ) ( not ( = ?auto_549423 ?auto_549430 ) ) ( not ( = ?auto_549423 ?auto_549431 ) ) ( not ( = ?auto_549423 ?auto_549432 ) ) ( not ( = ?auto_549423 ?auto_549433 ) ) ( not ( = ?auto_549424 ?auto_549425 ) ) ( not ( = ?auto_549424 ?auto_549426 ) ) ( not ( = ?auto_549424 ?auto_549427 ) ) ( not ( = ?auto_549424 ?auto_549428 ) ) ( not ( = ?auto_549424 ?auto_549429 ) ) ( not ( = ?auto_549424 ?auto_549430 ) ) ( not ( = ?auto_549424 ?auto_549431 ) ) ( not ( = ?auto_549424 ?auto_549432 ) ) ( not ( = ?auto_549424 ?auto_549433 ) ) ( not ( = ?auto_549425 ?auto_549426 ) ) ( not ( = ?auto_549425 ?auto_549427 ) ) ( not ( = ?auto_549425 ?auto_549428 ) ) ( not ( = ?auto_549425 ?auto_549429 ) ) ( not ( = ?auto_549425 ?auto_549430 ) ) ( not ( = ?auto_549425 ?auto_549431 ) ) ( not ( = ?auto_549425 ?auto_549432 ) ) ( not ( = ?auto_549425 ?auto_549433 ) ) ( not ( = ?auto_549426 ?auto_549427 ) ) ( not ( = ?auto_549426 ?auto_549428 ) ) ( not ( = ?auto_549426 ?auto_549429 ) ) ( not ( = ?auto_549426 ?auto_549430 ) ) ( not ( = ?auto_549426 ?auto_549431 ) ) ( not ( = ?auto_549426 ?auto_549432 ) ) ( not ( = ?auto_549426 ?auto_549433 ) ) ( not ( = ?auto_549427 ?auto_549428 ) ) ( not ( = ?auto_549427 ?auto_549429 ) ) ( not ( = ?auto_549427 ?auto_549430 ) ) ( not ( = ?auto_549427 ?auto_549431 ) ) ( not ( = ?auto_549427 ?auto_549432 ) ) ( not ( = ?auto_549427 ?auto_549433 ) ) ( not ( = ?auto_549428 ?auto_549429 ) ) ( not ( = ?auto_549428 ?auto_549430 ) ) ( not ( = ?auto_549428 ?auto_549431 ) ) ( not ( = ?auto_549428 ?auto_549432 ) ) ( not ( = ?auto_549428 ?auto_549433 ) ) ( not ( = ?auto_549429 ?auto_549430 ) ) ( not ( = ?auto_549429 ?auto_549431 ) ) ( not ( = ?auto_549429 ?auto_549432 ) ) ( not ( = ?auto_549429 ?auto_549433 ) ) ( not ( = ?auto_549430 ?auto_549431 ) ) ( not ( = ?auto_549430 ?auto_549432 ) ) ( not ( = ?auto_549430 ?auto_549433 ) ) ( not ( = ?auto_549431 ?auto_549432 ) ) ( not ( = ?auto_549431 ?auto_549433 ) ) ( not ( = ?auto_549432 ?auto_549433 ) ) ( ON ?auto_549431 ?auto_549432 ) ( ON ?auto_549430 ?auto_549431 ) ( CLEAR ?auto_549428 ) ( ON ?auto_549429 ?auto_549430 ) ( CLEAR ?auto_549429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_549420 ?auto_549421 ?auto_549422 ?auto_549423 ?auto_549424 ?auto_549425 ?auto_549426 ?auto_549427 ?auto_549428 ?auto_549429 )
      ( MAKE-13PILE ?auto_549420 ?auto_549421 ?auto_549422 ?auto_549423 ?auto_549424 ?auto_549425 ?auto_549426 ?auto_549427 ?auto_549428 ?auto_549429 ?auto_549430 ?auto_549431 ?auto_549432 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_549474 - BLOCK
      ?auto_549475 - BLOCK
      ?auto_549476 - BLOCK
      ?auto_549477 - BLOCK
      ?auto_549478 - BLOCK
      ?auto_549479 - BLOCK
      ?auto_549480 - BLOCK
      ?auto_549481 - BLOCK
      ?auto_549482 - BLOCK
      ?auto_549483 - BLOCK
      ?auto_549484 - BLOCK
      ?auto_549485 - BLOCK
      ?auto_549486 - BLOCK
    )
    :vars
    (
      ?auto_549487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_549486 ?auto_549487 ) ( ON-TABLE ?auto_549474 ) ( ON ?auto_549475 ?auto_549474 ) ( ON ?auto_549476 ?auto_549475 ) ( ON ?auto_549477 ?auto_549476 ) ( ON ?auto_549478 ?auto_549477 ) ( ON ?auto_549479 ?auto_549478 ) ( ON ?auto_549480 ?auto_549479 ) ( ON ?auto_549481 ?auto_549480 ) ( not ( = ?auto_549474 ?auto_549475 ) ) ( not ( = ?auto_549474 ?auto_549476 ) ) ( not ( = ?auto_549474 ?auto_549477 ) ) ( not ( = ?auto_549474 ?auto_549478 ) ) ( not ( = ?auto_549474 ?auto_549479 ) ) ( not ( = ?auto_549474 ?auto_549480 ) ) ( not ( = ?auto_549474 ?auto_549481 ) ) ( not ( = ?auto_549474 ?auto_549482 ) ) ( not ( = ?auto_549474 ?auto_549483 ) ) ( not ( = ?auto_549474 ?auto_549484 ) ) ( not ( = ?auto_549474 ?auto_549485 ) ) ( not ( = ?auto_549474 ?auto_549486 ) ) ( not ( = ?auto_549474 ?auto_549487 ) ) ( not ( = ?auto_549475 ?auto_549476 ) ) ( not ( = ?auto_549475 ?auto_549477 ) ) ( not ( = ?auto_549475 ?auto_549478 ) ) ( not ( = ?auto_549475 ?auto_549479 ) ) ( not ( = ?auto_549475 ?auto_549480 ) ) ( not ( = ?auto_549475 ?auto_549481 ) ) ( not ( = ?auto_549475 ?auto_549482 ) ) ( not ( = ?auto_549475 ?auto_549483 ) ) ( not ( = ?auto_549475 ?auto_549484 ) ) ( not ( = ?auto_549475 ?auto_549485 ) ) ( not ( = ?auto_549475 ?auto_549486 ) ) ( not ( = ?auto_549475 ?auto_549487 ) ) ( not ( = ?auto_549476 ?auto_549477 ) ) ( not ( = ?auto_549476 ?auto_549478 ) ) ( not ( = ?auto_549476 ?auto_549479 ) ) ( not ( = ?auto_549476 ?auto_549480 ) ) ( not ( = ?auto_549476 ?auto_549481 ) ) ( not ( = ?auto_549476 ?auto_549482 ) ) ( not ( = ?auto_549476 ?auto_549483 ) ) ( not ( = ?auto_549476 ?auto_549484 ) ) ( not ( = ?auto_549476 ?auto_549485 ) ) ( not ( = ?auto_549476 ?auto_549486 ) ) ( not ( = ?auto_549476 ?auto_549487 ) ) ( not ( = ?auto_549477 ?auto_549478 ) ) ( not ( = ?auto_549477 ?auto_549479 ) ) ( not ( = ?auto_549477 ?auto_549480 ) ) ( not ( = ?auto_549477 ?auto_549481 ) ) ( not ( = ?auto_549477 ?auto_549482 ) ) ( not ( = ?auto_549477 ?auto_549483 ) ) ( not ( = ?auto_549477 ?auto_549484 ) ) ( not ( = ?auto_549477 ?auto_549485 ) ) ( not ( = ?auto_549477 ?auto_549486 ) ) ( not ( = ?auto_549477 ?auto_549487 ) ) ( not ( = ?auto_549478 ?auto_549479 ) ) ( not ( = ?auto_549478 ?auto_549480 ) ) ( not ( = ?auto_549478 ?auto_549481 ) ) ( not ( = ?auto_549478 ?auto_549482 ) ) ( not ( = ?auto_549478 ?auto_549483 ) ) ( not ( = ?auto_549478 ?auto_549484 ) ) ( not ( = ?auto_549478 ?auto_549485 ) ) ( not ( = ?auto_549478 ?auto_549486 ) ) ( not ( = ?auto_549478 ?auto_549487 ) ) ( not ( = ?auto_549479 ?auto_549480 ) ) ( not ( = ?auto_549479 ?auto_549481 ) ) ( not ( = ?auto_549479 ?auto_549482 ) ) ( not ( = ?auto_549479 ?auto_549483 ) ) ( not ( = ?auto_549479 ?auto_549484 ) ) ( not ( = ?auto_549479 ?auto_549485 ) ) ( not ( = ?auto_549479 ?auto_549486 ) ) ( not ( = ?auto_549479 ?auto_549487 ) ) ( not ( = ?auto_549480 ?auto_549481 ) ) ( not ( = ?auto_549480 ?auto_549482 ) ) ( not ( = ?auto_549480 ?auto_549483 ) ) ( not ( = ?auto_549480 ?auto_549484 ) ) ( not ( = ?auto_549480 ?auto_549485 ) ) ( not ( = ?auto_549480 ?auto_549486 ) ) ( not ( = ?auto_549480 ?auto_549487 ) ) ( not ( = ?auto_549481 ?auto_549482 ) ) ( not ( = ?auto_549481 ?auto_549483 ) ) ( not ( = ?auto_549481 ?auto_549484 ) ) ( not ( = ?auto_549481 ?auto_549485 ) ) ( not ( = ?auto_549481 ?auto_549486 ) ) ( not ( = ?auto_549481 ?auto_549487 ) ) ( not ( = ?auto_549482 ?auto_549483 ) ) ( not ( = ?auto_549482 ?auto_549484 ) ) ( not ( = ?auto_549482 ?auto_549485 ) ) ( not ( = ?auto_549482 ?auto_549486 ) ) ( not ( = ?auto_549482 ?auto_549487 ) ) ( not ( = ?auto_549483 ?auto_549484 ) ) ( not ( = ?auto_549483 ?auto_549485 ) ) ( not ( = ?auto_549483 ?auto_549486 ) ) ( not ( = ?auto_549483 ?auto_549487 ) ) ( not ( = ?auto_549484 ?auto_549485 ) ) ( not ( = ?auto_549484 ?auto_549486 ) ) ( not ( = ?auto_549484 ?auto_549487 ) ) ( not ( = ?auto_549485 ?auto_549486 ) ) ( not ( = ?auto_549485 ?auto_549487 ) ) ( not ( = ?auto_549486 ?auto_549487 ) ) ( ON ?auto_549485 ?auto_549486 ) ( ON ?auto_549484 ?auto_549485 ) ( ON ?auto_549483 ?auto_549484 ) ( CLEAR ?auto_549481 ) ( ON ?auto_549482 ?auto_549483 ) ( CLEAR ?auto_549482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_549474 ?auto_549475 ?auto_549476 ?auto_549477 ?auto_549478 ?auto_549479 ?auto_549480 ?auto_549481 ?auto_549482 )
      ( MAKE-13PILE ?auto_549474 ?auto_549475 ?auto_549476 ?auto_549477 ?auto_549478 ?auto_549479 ?auto_549480 ?auto_549481 ?auto_549482 ?auto_549483 ?auto_549484 ?auto_549485 ?auto_549486 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_549528 - BLOCK
      ?auto_549529 - BLOCK
      ?auto_549530 - BLOCK
      ?auto_549531 - BLOCK
      ?auto_549532 - BLOCK
      ?auto_549533 - BLOCK
      ?auto_549534 - BLOCK
      ?auto_549535 - BLOCK
      ?auto_549536 - BLOCK
      ?auto_549537 - BLOCK
      ?auto_549538 - BLOCK
      ?auto_549539 - BLOCK
      ?auto_549540 - BLOCK
    )
    :vars
    (
      ?auto_549541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_549540 ?auto_549541 ) ( ON-TABLE ?auto_549528 ) ( ON ?auto_549529 ?auto_549528 ) ( ON ?auto_549530 ?auto_549529 ) ( ON ?auto_549531 ?auto_549530 ) ( ON ?auto_549532 ?auto_549531 ) ( ON ?auto_549533 ?auto_549532 ) ( ON ?auto_549534 ?auto_549533 ) ( not ( = ?auto_549528 ?auto_549529 ) ) ( not ( = ?auto_549528 ?auto_549530 ) ) ( not ( = ?auto_549528 ?auto_549531 ) ) ( not ( = ?auto_549528 ?auto_549532 ) ) ( not ( = ?auto_549528 ?auto_549533 ) ) ( not ( = ?auto_549528 ?auto_549534 ) ) ( not ( = ?auto_549528 ?auto_549535 ) ) ( not ( = ?auto_549528 ?auto_549536 ) ) ( not ( = ?auto_549528 ?auto_549537 ) ) ( not ( = ?auto_549528 ?auto_549538 ) ) ( not ( = ?auto_549528 ?auto_549539 ) ) ( not ( = ?auto_549528 ?auto_549540 ) ) ( not ( = ?auto_549528 ?auto_549541 ) ) ( not ( = ?auto_549529 ?auto_549530 ) ) ( not ( = ?auto_549529 ?auto_549531 ) ) ( not ( = ?auto_549529 ?auto_549532 ) ) ( not ( = ?auto_549529 ?auto_549533 ) ) ( not ( = ?auto_549529 ?auto_549534 ) ) ( not ( = ?auto_549529 ?auto_549535 ) ) ( not ( = ?auto_549529 ?auto_549536 ) ) ( not ( = ?auto_549529 ?auto_549537 ) ) ( not ( = ?auto_549529 ?auto_549538 ) ) ( not ( = ?auto_549529 ?auto_549539 ) ) ( not ( = ?auto_549529 ?auto_549540 ) ) ( not ( = ?auto_549529 ?auto_549541 ) ) ( not ( = ?auto_549530 ?auto_549531 ) ) ( not ( = ?auto_549530 ?auto_549532 ) ) ( not ( = ?auto_549530 ?auto_549533 ) ) ( not ( = ?auto_549530 ?auto_549534 ) ) ( not ( = ?auto_549530 ?auto_549535 ) ) ( not ( = ?auto_549530 ?auto_549536 ) ) ( not ( = ?auto_549530 ?auto_549537 ) ) ( not ( = ?auto_549530 ?auto_549538 ) ) ( not ( = ?auto_549530 ?auto_549539 ) ) ( not ( = ?auto_549530 ?auto_549540 ) ) ( not ( = ?auto_549530 ?auto_549541 ) ) ( not ( = ?auto_549531 ?auto_549532 ) ) ( not ( = ?auto_549531 ?auto_549533 ) ) ( not ( = ?auto_549531 ?auto_549534 ) ) ( not ( = ?auto_549531 ?auto_549535 ) ) ( not ( = ?auto_549531 ?auto_549536 ) ) ( not ( = ?auto_549531 ?auto_549537 ) ) ( not ( = ?auto_549531 ?auto_549538 ) ) ( not ( = ?auto_549531 ?auto_549539 ) ) ( not ( = ?auto_549531 ?auto_549540 ) ) ( not ( = ?auto_549531 ?auto_549541 ) ) ( not ( = ?auto_549532 ?auto_549533 ) ) ( not ( = ?auto_549532 ?auto_549534 ) ) ( not ( = ?auto_549532 ?auto_549535 ) ) ( not ( = ?auto_549532 ?auto_549536 ) ) ( not ( = ?auto_549532 ?auto_549537 ) ) ( not ( = ?auto_549532 ?auto_549538 ) ) ( not ( = ?auto_549532 ?auto_549539 ) ) ( not ( = ?auto_549532 ?auto_549540 ) ) ( not ( = ?auto_549532 ?auto_549541 ) ) ( not ( = ?auto_549533 ?auto_549534 ) ) ( not ( = ?auto_549533 ?auto_549535 ) ) ( not ( = ?auto_549533 ?auto_549536 ) ) ( not ( = ?auto_549533 ?auto_549537 ) ) ( not ( = ?auto_549533 ?auto_549538 ) ) ( not ( = ?auto_549533 ?auto_549539 ) ) ( not ( = ?auto_549533 ?auto_549540 ) ) ( not ( = ?auto_549533 ?auto_549541 ) ) ( not ( = ?auto_549534 ?auto_549535 ) ) ( not ( = ?auto_549534 ?auto_549536 ) ) ( not ( = ?auto_549534 ?auto_549537 ) ) ( not ( = ?auto_549534 ?auto_549538 ) ) ( not ( = ?auto_549534 ?auto_549539 ) ) ( not ( = ?auto_549534 ?auto_549540 ) ) ( not ( = ?auto_549534 ?auto_549541 ) ) ( not ( = ?auto_549535 ?auto_549536 ) ) ( not ( = ?auto_549535 ?auto_549537 ) ) ( not ( = ?auto_549535 ?auto_549538 ) ) ( not ( = ?auto_549535 ?auto_549539 ) ) ( not ( = ?auto_549535 ?auto_549540 ) ) ( not ( = ?auto_549535 ?auto_549541 ) ) ( not ( = ?auto_549536 ?auto_549537 ) ) ( not ( = ?auto_549536 ?auto_549538 ) ) ( not ( = ?auto_549536 ?auto_549539 ) ) ( not ( = ?auto_549536 ?auto_549540 ) ) ( not ( = ?auto_549536 ?auto_549541 ) ) ( not ( = ?auto_549537 ?auto_549538 ) ) ( not ( = ?auto_549537 ?auto_549539 ) ) ( not ( = ?auto_549537 ?auto_549540 ) ) ( not ( = ?auto_549537 ?auto_549541 ) ) ( not ( = ?auto_549538 ?auto_549539 ) ) ( not ( = ?auto_549538 ?auto_549540 ) ) ( not ( = ?auto_549538 ?auto_549541 ) ) ( not ( = ?auto_549539 ?auto_549540 ) ) ( not ( = ?auto_549539 ?auto_549541 ) ) ( not ( = ?auto_549540 ?auto_549541 ) ) ( ON ?auto_549539 ?auto_549540 ) ( ON ?auto_549538 ?auto_549539 ) ( ON ?auto_549537 ?auto_549538 ) ( ON ?auto_549536 ?auto_549537 ) ( CLEAR ?auto_549534 ) ( ON ?auto_549535 ?auto_549536 ) ( CLEAR ?auto_549535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_549528 ?auto_549529 ?auto_549530 ?auto_549531 ?auto_549532 ?auto_549533 ?auto_549534 ?auto_549535 )
      ( MAKE-13PILE ?auto_549528 ?auto_549529 ?auto_549530 ?auto_549531 ?auto_549532 ?auto_549533 ?auto_549534 ?auto_549535 ?auto_549536 ?auto_549537 ?auto_549538 ?auto_549539 ?auto_549540 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_549582 - BLOCK
      ?auto_549583 - BLOCK
      ?auto_549584 - BLOCK
      ?auto_549585 - BLOCK
      ?auto_549586 - BLOCK
      ?auto_549587 - BLOCK
      ?auto_549588 - BLOCK
      ?auto_549589 - BLOCK
      ?auto_549590 - BLOCK
      ?auto_549591 - BLOCK
      ?auto_549592 - BLOCK
      ?auto_549593 - BLOCK
      ?auto_549594 - BLOCK
    )
    :vars
    (
      ?auto_549595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_549594 ?auto_549595 ) ( ON-TABLE ?auto_549582 ) ( ON ?auto_549583 ?auto_549582 ) ( ON ?auto_549584 ?auto_549583 ) ( ON ?auto_549585 ?auto_549584 ) ( ON ?auto_549586 ?auto_549585 ) ( ON ?auto_549587 ?auto_549586 ) ( not ( = ?auto_549582 ?auto_549583 ) ) ( not ( = ?auto_549582 ?auto_549584 ) ) ( not ( = ?auto_549582 ?auto_549585 ) ) ( not ( = ?auto_549582 ?auto_549586 ) ) ( not ( = ?auto_549582 ?auto_549587 ) ) ( not ( = ?auto_549582 ?auto_549588 ) ) ( not ( = ?auto_549582 ?auto_549589 ) ) ( not ( = ?auto_549582 ?auto_549590 ) ) ( not ( = ?auto_549582 ?auto_549591 ) ) ( not ( = ?auto_549582 ?auto_549592 ) ) ( not ( = ?auto_549582 ?auto_549593 ) ) ( not ( = ?auto_549582 ?auto_549594 ) ) ( not ( = ?auto_549582 ?auto_549595 ) ) ( not ( = ?auto_549583 ?auto_549584 ) ) ( not ( = ?auto_549583 ?auto_549585 ) ) ( not ( = ?auto_549583 ?auto_549586 ) ) ( not ( = ?auto_549583 ?auto_549587 ) ) ( not ( = ?auto_549583 ?auto_549588 ) ) ( not ( = ?auto_549583 ?auto_549589 ) ) ( not ( = ?auto_549583 ?auto_549590 ) ) ( not ( = ?auto_549583 ?auto_549591 ) ) ( not ( = ?auto_549583 ?auto_549592 ) ) ( not ( = ?auto_549583 ?auto_549593 ) ) ( not ( = ?auto_549583 ?auto_549594 ) ) ( not ( = ?auto_549583 ?auto_549595 ) ) ( not ( = ?auto_549584 ?auto_549585 ) ) ( not ( = ?auto_549584 ?auto_549586 ) ) ( not ( = ?auto_549584 ?auto_549587 ) ) ( not ( = ?auto_549584 ?auto_549588 ) ) ( not ( = ?auto_549584 ?auto_549589 ) ) ( not ( = ?auto_549584 ?auto_549590 ) ) ( not ( = ?auto_549584 ?auto_549591 ) ) ( not ( = ?auto_549584 ?auto_549592 ) ) ( not ( = ?auto_549584 ?auto_549593 ) ) ( not ( = ?auto_549584 ?auto_549594 ) ) ( not ( = ?auto_549584 ?auto_549595 ) ) ( not ( = ?auto_549585 ?auto_549586 ) ) ( not ( = ?auto_549585 ?auto_549587 ) ) ( not ( = ?auto_549585 ?auto_549588 ) ) ( not ( = ?auto_549585 ?auto_549589 ) ) ( not ( = ?auto_549585 ?auto_549590 ) ) ( not ( = ?auto_549585 ?auto_549591 ) ) ( not ( = ?auto_549585 ?auto_549592 ) ) ( not ( = ?auto_549585 ?auto_549593 ) ) ( not ( = ?auto_549585 ?auto_549594 ) ) ( not ( = ?auto_549585 ?auto_549595 ) ) ( not ( = ?auto_549586 ?auto_549587 ) ) ( not ( = ?auto_549586 ?auto_549588 ) ) ( not ( = ?auto_549586 ?auto_549589 ) ) ( not ( = ?auto_549586 ?auto_549590 ) ) ( not ( = ?auto_549586 ?auto_549591 ) ) ( not ( = ?auto_549586 ?auto_549592 ) ) ( not ( = ?auto_549586 ?auto_549593 ) ) ( not ( = ?auto_549586 ?auto_549594 ) ) ( not ( = ?auto_549586 ?auto_549595 ) ) ( not ( = ?auto_549587 ?auto_549588 ) ) ( not ( = ?auto_549587 ?auto_549589 ) ) ( not ( = ?auto_549587 ?auto_549590 ) ) ( not ( = ?auto_549587 ?auto_549591 ) ) ( not ( = ?auto_549587 ?auto_549592 ) ) ( not ( = ?auto_549587 ?auto_549593 ) ) ( not ( = ?auto_549587 ?auto_549594 ) ) ( not ( = ?auto_549587 ?auto_549595 ) ) ( not ( = ?auto_549588 ?auto_549589 ) ) ( not ( = ?auto_549588 ?auto_549590 ) ) ( not ( = ?auto_549588 ?auto_549591 ) ) ( not ( = ?auto_549588 ?auto_549592 ) ) ( not ( = ?auto_549588 ?auto_549593 ) ) ( not ( = ?auto_549588 ?auto_549594 ) ) ( not ( = ?auto_549588 ?auto_549595 ) ) ( not ( = ?auto_549589 ?auto_549590 ) ) ( not ( = ?auto_549589 ?auto_549591 ) ) ( not ( = ?auto_549589 ?auto_549592 ) ) ( not ( = ?auto_549589 ?auto_549593 ) ) ( not ( = ?auto_549589 ?auto_549594 ) ) ( not ( = ?auto_549589 ?auto_549595 ) ) ( not ( = ?auto_549590 ?auto_549591 ) ) ( not ( = ?auto_549590 ?auto_549592 ) ) ( not ( = ?auto_549590 ?auto_549593 ) ) ( not ( = ?auto_549590 ?auto_549594 ) ) ( not ( = ?auto_549590 ?auto_549595 ) ) ( not ( = ?auto_549591 ?auto_549592 ) ) ( not ( = ?auto_549591 ?auto_549593 ) ) ( not ( = ?auto_549591 ?auto_549594 ) ) ( not ( = ?auto_549591 ?auto_549595 ) ) ( not ( = ?auto_549592 ?auto_549593 ) ) ( not ( = ?auto_549592 ?auto_549594 ) ) ( not ( = ?auto_549592 ?auto_549595 ) ) ( not ( = ?auto_549593 ?auto_549594 ) ) ( not ( = ?auto_549593 ?auto_549595 ) ) ( not ( = ?auto_549594 ?auto_549595 ) ) ( ON ?auto_549593 ?auto_549594 ) ( ON ?auto_549592 ?auto_549593 ) ( ON ?auto_549591 ?auto_549592 ) ( ON ?auto_549590 ?auto_549591 ) ( ON ?auto_549589 ?auto_549590 ) ( CLEAR ?auto_549587 ) ( ON ?auto_549588 ?auto_549589 ) ( CLEAR ?auto_549588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_549582 ?auto_549583 ?auto_549584 ?auto_549585 ?auto_549586 ?auto_549587 ?auto_549588 )
      ( MAKE-13PILE ?auto_549582 ?auto_549583 ?auto_549584 ?auto_549585 ?auto_549586 ?auto_549587 ?auto_549588 ?auto_549589 ?auto_549590 ?auto_549591 ?auto_549592 ?auto_549593 ?auto_549594 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_549636 - BLOCK
      ?auto_549637 - BLOCK
      ?auto_549638 - BLOCK
      ?auto_549639 - BLOCK
      ?auto_549640 - BLOCK
      ?auto_549641 - BLOCK
      ?auto_549642 - BLOCK
      ?auto_549643 - BLOCK
      ?auto_549644 - BLOCK
      ?auto_549645 - BLOCK
      ?auto_549646 - BLOCK
      ?auto_549647 - BLOCK
      ?auto_549648 - BLOCK
    )
    :vars
    (
      ?auto_549649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_549648 ?auto_549649 ) ( ON-TABLE ?auto_549636 ) ( ON ?auto_549637 ?auto_549636 ) ( ON ?auto_549638 ?auto_549637 ) ( ON ?auto_549639 ?auto_549638 ) ( ON ?auto_549640 ?auto_549639 ) ( not ( = ?auto_549636 ?auto_549637 ) ) ( not ( = ?auto_549636 ?auto_549638 ) ) ( not ( = ?auto_549636 ?auto_549639 ) ) ( not ( = ?auto_549636 ?auto_549640 ) ) ( not ( = ?auto_549636 ?auto_549641 ) ) ( not ( = ?auto_549636 ?auto_549642 ) ) ( not ( = ?auto_549636 ?auto_549643 ) ) ( not ( = ?auto_549636 ?auto_549644 ) ) ( not ( = ?auto_549636 ?auto_549645 ) ) ( not ( = ?auto_549636 ?auto_549646 ) ) ( not ( = ?auto_549636 ?auto_549647 ) ) ( not ( = ?auto_549636 ?auto_549648 ) ) ( not ( = ?auto_549636 ?auto_549649 ) ) ( not ( = ?auto_549637 ?auto_549638 ) ) ( not ( = ?auto_549637 ?auto_549639 ) ) ( not ( = ?auto_549637 ?auto_549640 ) ) ( not ( = ?auto_549637 ?auto_549641 ) ) ( not ( = ?auto_549637 ?auto_549642 ) ) ( not ( = ?auto_549637 ?auto_549643 ) ) ( not ( = ?auto_549637 ?auto_549644 ) ) ( not ( = ?auto_549637 ?auto_549645 ) ) ( not ( = ?auto_549637 ?auto_549646 ) ) ( not ( = ?auto_549637 ?auto_549647 ) ) ( not ( = ?auto_549637 ?auto_549648 ) ) ( not ( = ?auto_549637 ?auto_549649 ) ) ( not ( = ?auto_549638 ?auto_549639 ) ) ( not ( = ?auto_549638 ?auto_549640 ) ) ( not ( = ?auto_549638 ?auto_549641 ) ) ( not ( = ?auto_549638 ?auto_549642 ) ) ( not ( = ?auto_549638 ?auto_549643 ) ) ( not ( = ?auto_549638 ?auto_549644 ) ) ( not ( = ?auto_549638 ?auto_549645 ) ) ( not ( = ?auto_549638 ?auto_549646 ) ) ( not ( = ?auto_549638 ?auto_549647 ) ) ( not ( = ?auto_549638 ?auto_549648 ) ) ( not ( = ?auto_549638 ?auto_549649 ) ) ( not ( = ?auto_549639 ?auto_549640 ) ) ( not ( = ?auto_549639 ?auto_549641 ) ) ( not ( = ?auto_549639 ?auto_549642 ) ) ( not ( = ?auto_549639 ?auto_549643 ) ) ( not ( = ?auto_549639 ?auto_549644 ) ) ( not ( = ?auto_549639 ?auto_549645 ) ) ( not ( = ?auto_549639 ?auto_549646 ) ) ( not ( = ?auto_549639 ?auto_549647 ) ) ( not ( = ?auto_549639 ?auto_549648 ) ) ( not ( = ?auto_549639 ?auto_549649 ) ) ( not ( = ?auto_549640 ?auto_549641 ) ) ( not ( = ?auto_549640 ?auto_549642 ) ) ( not ( = ?auto_549640 ?auto_549643 ) ) ( not ( = ?auto_549640 ?auto_549644 ) ) ( not ( = ?auto_549640 ?auto_549645 ) ) ( not ( = ?auto_549640 ?auto_549646 ) ) ( not ( = ?auto_549640 ?auto_549647 ) ) ( not ( = ?auto_549640 ?auto_549648 ) ) ( not ( = ?auto_549640 ?auto_549649 ) ) ( not ( = ?auto_549641 ?auto_549642 ) ) ( not ( = ?auto_549641 ?auto_549643 ) ) ( not ( = ?auto_549641 ?auto_549644 ) ) ( not ( = ?auto_549641 ?auto_549645 ) ) ( not ( = ?auto_549641 ?auto_549646 ) ) ( not ( = ?auto_549641 ?auto_549647 ) ) ( not ( = ?auto_549641 ?auto_549648 ) ) ( not ( = ?auto_549641 ?auto_549649 ) ) ( not ( = ?auto_549642 ?auto_549643 ) ) ( not ( = ?auto_549642 ?auto_549644 ) ) ( not ( = ?auto_549642 ?auto_549645 ) ) ( not ( = ?auto_549642 ?auto_549646 ) ) ( not ( = ?auto_549642 ?auto_549647 ) ) ( not ( = ?auto_549642 ?auto_549648 ) ) ( not ( = ?auto_549642 ?auto_549649 ) ) ( not ( = ?auto_549643 ?auto_549644 ) ) ( not ( = ?auto_549643 ?auto_549645 ) ) ( not ( = ?auto_549643 ?auto_549646 ) ) ( not ( = ?auto_549643 ?auto_549647 ) ) ( not ( = ?auto_549643 ?auto_549648 ) ) ( not ( = ?auto_549643 ?auto_549649 ) ) ( not ( = ?auto_549644 ?auto_549645 ) ) ( not ( = ?auto_549644 ?auto_549646 ) ) ( not ( = ?auto_549644 ?auto_549647 ) ) ( not ( = ?auto_549644 ?auto_549648 ) ) ( not ( = ?auto_549644 ?auto_549649 ) ) ( not ( = ?auto_549645 ?auto_549646 ) ) ( not ( = ?auto_549645 ?auto_549647 ) ) ( not ( = ?auto_549645 ?auto_549648 ) ) ( not ( = ?auto_549645 ?auto_549649 ) ) ( not ( = ?auto_549646 ?auto_549647 ) ) ( not ( = ?auto_549646 ?auto_549648 ) ) ( not ( = ?auto_549646 ?auto_549649 ) ) ( not ( = ?auto_549647 ?auto_549648 ) ) ( not ( = ?auto_549647 ?auto_549649 ) ) ( not ( = ?auto_549648 ?auto_549649 ) ) ( ON ?auto_549647 ?auto_549648 ) ( ON ?auto_549646 ?auto_549647 ) ( ON ?auto_549645 ?auto_549646 ) ( ON ?auto_549644 ?auto_549645 ) ( ON ?auto_549643 ?auto_549644 ) ( ON ?auto_549642 ?auto_549643 ) ( CLEAR ?auto_549640 ) ( ON ?auto_549641 ?auto_549642 ) ( CLEAR ?auto_549641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_549636 ?auto_549637 ?auto_549638 ?auto_549639 ?auto_549640 ?auto_549641 )
      ( MAKE-13PILE ?auto_549636 ?auto_549637 ?auto_549638 ?auto_549639 ?auto_549640 ?auto_549641 ?auto_549642 ?auto_549643 ?auto_549644 ?auto_549645 ?auto_549646 ?auto_549647 ?auto_549648 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_549690 - BLOCK
      ?auto_549691 - BLOCK
      ?auto_549692 - BLOCK
      ?auto_549693 - BLOCK
      ?auto_549694 - BLOCK
      ?auto_549695 - BLOCK
      ?auto_549696 - BLOCK
      ?auto_549697 - BLOCK
      ?auto_549698 - BLOCK
      ?auto_549699 - BLOCK
      ?auto_549700 - BLOCK
      ?auto_549701 - BLOCK
      ?auto_549702 - BLOCK
    )
    :vars
    (
      ?auto_549703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_549702 ?auto_549703 ) ( ON-TABLE ?auto_549690 ) ( ON ?auto_549691 ?auto_549690 ) ( ON ?auto_549692 ?auto_549691 ) ( ON ?auto_549693 ?auto_549692 ) ( not ( = ?auto_549690 ?auto_549691 ) ) ( not ( = ?auto_549690 ?auto_549692 ) ) ( not ( = ?auto_549690 ?auto_549693 ) ) ( not ( = ?auto_549690 ?auto_549694 ) ) ( not ( = ?auto_549690 ?auto_549695 ) ) ( not ( = ?auto_549690 ?auto_549696 ) ) ( not ( = ?auto_549690 ?auto_549697 ) ) ( not ( = ?auto_549690 ?auto_549698 ) ) ( not ( = ?auto_549690 ?auto_549699 ) ) ( not ( = ?auto_549690 ?auto_549700 ) ) ( not ( = ?auto_549690 ?auto_549701 ) ) ( not ( = ?auto_549690 ?auto_549702 ) ) ( not ( = ?auto_549690 ?auto_549703 ) ) ( not ( = ?auto_549691 ?auto_549692 ) ) ( not ( = ?auto_549691 ?auto_549693 ) ) ( not ( = ?auto_549691 ?auto_549694 ) ) ( not ( = ?auto_549691 ?auto_549695 ) ) ( not ( = ?auto_549691 ?auto_549696 ) ) ( not ( = ?auto_549691 ?auto_549697 ) ) ( not ( = ?auto_549691 ?auto_549698 ) ) ( not ( = ?auto_549691 ?auto_549699 ) ) ( not ( = ?auto_549691 ?auto_549700 ) ) ( not ( = ?auto_549691 ?auto_549701 ) ) ( not ( = ?auto_549691 ?auto_549702 ) ) ( not ( = ?auto_549691 ?auto_549703 ) ) ( not ( = ?auto_549692 ?auto_549693 ) ) ( not ( = ?auto_549692 ?auto_549694 ) ) ( not ( = ?auto_549692 ?auto_549695 ) ) ( not ( = ?auto_549692 ?auto_549696 ) ) ( not ( = ?auto_549692 ?auto_549697 ) ) ( not ( = ?auto_549692 ?auto_549698 ) ) ( not ( = ?auto_549692 ?auto_549699 ) ) ( not ( = ?auto_549692 ?auto_549700 ) ) ( not ( = ?auto_549692 ?auto_549701 ) ) ( not ( = ?auto_549692 ?auto_549702 ) ) ( not ( = ?auto_549692 ?auto_549703 ) ) ( not ( = ?auto_549693 ?auto_549694 ) ) ( not ( = ?auto_549693 ?auto_549695 ) ) ( not ( = ?auto_549693 ?auto_549696 ) ) ( not ( = ?auto_549693 ?auto_549697 ) ) ( not ( = ?auto_549693 ?auto_549698 ) ) ( not ( = ?auto_549693 ?auto_549699 ) ) ( not ( = ?auto_549693 ?auto_549700 ) ) ( not ( = ?auto_549693 ?auto_549701 ) ) ( not ( = ?auto_549693 ?auto_549702 ) ) ( not ( = ?auto_549693 ?auto_549703 ) ) ( not ( = ?auto_549694 ?auto_549695 ) ) ( not ( = ?auto_549694 ?auto_549696 ) ) ( not ( = ?auto_549694 ?auto_549697 ) ) ( not ( = ?auto_549694 ?auto_549698 ) ) ( not ( = ?auto_549694 ?auto_549699 ) ) ( not ( = ?auto_549694 ?auto_549700 ) ) ( not ( = ?auto_549694 ?auto_549701 ) ) ( not ( = ?auto_549694 ?auto_549702 ) ) ( not ( = ?auto_549694 ?auto_549703 ) ) ( not ( = ?auto_549695 ?auto_549696 ) ) ( not ( = ?auto_549695 ?auto_549697 ) ) ( not ( = ?auto_549695 ?auto_549698 ) ) ( not ( = ?auto_549695 ?auto_549699 ) ) ( not ( = ?auto_549695 ?auto_549700 ) ) ( not ( = ?auto_549695 ?auto_549701 ) ) ( not ( = ?auto_549695 ?auto_549702 ) ) ( not ( = ?auto_549695 ?auto_549703 ) ) ( not ( = ?auto_549696 ?auto_549697 ) ) ( not ( = ?auto_549696 ?auto_549698 ) ) ( not ( = ?auto_549696 ?auto_549699 ) ) ( not ( = ?auto_549696 ?auto_549700 ) ) ( not ( = ?auto_549696 ?auto_549701 ) ) ( not ( = ?auto_549696 ?auto_549702 ) ) ( not ( = ?auto_549696 ?auto_549703 ) ) ( not ( = ?auto_549697 ?auto_549698 ) ) ( not ( = ?auto_549697 ?auto_549699 ) ) ( not ( = ?auto_549697 ?auto_549700 ) ) ( not ( = ?auto_549697 ?auto_549701 ) ) ( not ( = ?auto_549697 ?auto_549702 ) ) ( not ( = ?auto_549697 ?auto_549703 ) ) ( not ( = ?auto_549698 ?auto_549699 ) ) ( not ( = ?auto_549698 ?auto_549700 ) ) ( not ( = ?auto_549698 ?auto_549701 ) ) ( not ( = ?auto_549698 ?auto_549702 ) ) ( not ( = ?auto_549698 ?auto_549703 ) ) ( not ( = ?auto_549699 ?auto_549700 ) ) ( not ( = ?auto_549699 ?auto_549701 ) ) ( not ( = ?auto_549699 ?auto_549702 ) ) ( not ( = ?auto_549699 ?auto_549703 ) ) ( not ( = ?auto_549700 ?auto_549701 ) ) ( not ( = ?auto_549700 ?auto_549702 ) ) ( not ( = ?auto_549700 ?auto_549703 ) ) ( not ( = ?auto_549701 ?auto_549702 ) ) ( not ( = ?auto_549701 ?auto_549703 ) ) ( not ( = ?auto_549702 ?auto_549703 ) ) ( ON ?auto_549701 ?auto_549702 ) ( ON ?auto_549700 ?auto_549701 ) ( ON ?auto_549699 ?auto_549700 ) ( ON ?auto_549698 ?auto_549699 ) ( ON ?auto_549697 ?auto_549698 ) ( ON ?auto_549696 ?auto_549697 ) ( ON ?auto_549695 ?auto_549696 ) ( CLEAR ?auto_549693 ) ( ON ?auto_549694 ?auto_549695 ) ( CLEAR ?auto_549694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_549690 ?auto_549691 ?auto_549692 ?auto_549693 ?auto_549694 )
      ( MAKE-13PILE ?auto_549690 ?auto_549691 ?auto_549692 ?auto_549693 ?auto_549694 ?auto_549695 ?auto_549696 ?auto_549697 ?auto_549698 ?auto_549699 ?auto_549700 ?auto_549701 ?auto_549702 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_549744 - BLOCK
      ?auto_549745 - BLOCK
      ?auto_549746 - BLOCK
      ?auto_549747 - BLOCK
      ?auto_549748 - BLOCK
      ?auto_549749 - BLOCK
      ?auto_549750 - BLOCK
      ?auto_549751 - BLOCK
      ?auto_549752 - BLOCK
      ?auto_549753 - BLOCK
      ?auto_549754 - BLOCK
      ?auto_549755 - BLOCK
      ?auto_549756 - BLOCK
    )
    :vars
    (
      ?auto_549757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_549756 ?auto_549757 ) ( ON-TABLE ?auto_549744 ) ( ON ?auto_549745 ?auto_549744 ) ( ON ?auto_549746 ?auto_549745 ) ( not ( = ?auto_549744 ?auto_549745 ) ) ( not ( = ?auto_549744 ?auto_549746 ) ) ( not ( = ?auto_549744 ?auto_549747 ) ) ( not ( = ?auto_549744 ?auto_549748 ) ) ( not ( = ?auto_549744 ?auto_549749 ) ) ( not ( = ?auto_549744 ?auto_549750 ) ) ( not ( = ?auto_549744 ?auto_549751 ) ) ( not ( = ?auto_549744 ?auto_549752 ) ) ( not ( = ?auto_549744 ?auto_549753 ) ) ( not ( = ?auto_549744 ?auto_549754 ) ) ( not ( = ?auto_549744 ?auto_549755 ) ) ( not ( = ?auto_549744 ?auto_549756 ) ) ( not ( = ?auto_549744 ?auto_549757 ) ) ( not ( = ?auto_549745 ?auto_549746 ) ) ( not ( = ?auto_549745 ?auto_549747 ) ) ( not ( = ?auto_549745 ?auto_549748 ) ) ( not ( = ?auto_549745 ?auto_549749 ) ) ( not ( = ?auto_549745 ?auto_549750 ) ) ( not ( = ?auto_549745 ?auto_549751 ) ) ( not ( = ?auto_549745 ?auto_549752 ) ) ( not ( = ?auto_549745 ?auto_549753 ) ) ( not ( = ?auto_549745 ?auto_549754 ) ) ( not ( = ?auto_549745 ?auto_549755 ) ) ( not ( = ?auto_549745 ?auto_549756 ) ) ( not ( = ?auto_549745 ?auto_549757 ) ) ( not ( = ?auto_549746 ?auto_549747 ) ) ( not ( = ?auto_549746 ?auto_549748 ) ) ( not ( = ?auto_549746 ?auto_549749 ) ) ( not ( = ?auto_549746 ?auto_549750 ) ) ( not ( = ?auto_549746 ?auto_549751 ) ) ( not ( = ?auto_549746 ?auto_549752 ) ) ( not ( = ?auto_549746 ?auto_549753 ) ) ( not ( = ?auto_549746 ?auto_549754 ) ) ( not ( = ?auto_549746 ?auto_549755 ) ) ( not ( = ?auto_549746 ?auto_549756 ) ) ( not ( = ?auto_549746 ?auto_549757 ) ) ( not ( = ?auto_549747 ?auto_549748 ) ) ( not ( = ?auto_549747 ?auto_549749 ) ) ( not ( = ?auto_549747 ?auto_549750 ) ) ( not ( = ?auto_549747 ?auto_549751 ) ) ( not ( = ?auto_549747 ?auto_549752 ) ) ( not ( = ?auto_549747 ?auto_549753 ) ) ( not ( = ?auto_549747 ?auto_549754 ) ) ( not ( = ?auto_549747 ?auto_549755 ) ) ( not ( = ?auto_549747 ?auto_549756 ) ) ( not ( = ?auto_549747 ?auto_549757 ) ) ( not ( = ?auto_549748 ?auto_549749 ) ) ( not ( = ?auto_549748 ?auto_549750 ) ) ( not ( = ?auto_549748 ?auto_549751 ) ) ( not ( = ?auto_549748 ?auto_549752 ) ) ( not ( = ?auto_549748 ?auto_549753 ) ) ( not ( = ?auto_549748 ?auto_549754 ) ) ( not ( = ?auto_549748 ?auto_549755 ) ) ( not ( = ?auto_549748 ?auto_549756 ) ) ( not ( = ?auto_549748 ?auto_549757 ) ) ( not ( = ?auto_549749 ?auto_549750 ) ) ( not ( = ?auto_549749 ?auto_549751 ) ) ( not ( = ?auto_549749 ?auto_549752 ) ) ( not ( = ?auto_549749 ?auto_549753 ) ) ( not ( = ?auto_549749 ?auto_549754 ) ) ( not ( = ?auto_549749 ?auto_549755 ) ) ( not ( = ?auto_549749 ?auto_549756 ) ) ( not ( = ?auto_549749 ?auto_549757 ) ) ( not ( = ?auto_549750 ?auto_549751 ) ) ( not ( = ?auto_549750 ?auto_549752 ) ) ( not ( = ?auto_549750 ?auto_549753 ) ) ( not ( = ?auto_549750 ?auto_549754 ) ) ( not ( = ?auto_549750 ?auto_549755 ) ) ( not ( = ?auto_549750 ?auto_549756 ) ) ( not ( = ?auto_549750 ?auto_549757 ) ) ( not ( = ?auto_549751 ?auto_549752 ) ) ( not ( = ?auto_549751 ?auto_549753 ) ) ( not ( = ?auto_549751 ?auto_549754 ) ) ( not ( = ?auto_549751 ?auto_549755 ) ) ( not ( = ?auto_549751 ?auto_549756 ) ) ( not ( = ?auto_549751 ?auto_549757 ) ) ( not ( = ?auto_549752 ?auto_549753 ) ) ( not ( = ?auto_549752 ?auto_549754 ) ) ( not ( = ?auto_549752 ?auto_549755 ) ) ( not ( = ?auto_549752 ?auto_549756 ) ) ( not ( = ?auto_549752 ?auto_549757 ) ) ( not ( = ?auto_549753 ?auto_549754 ) ) ( not ( = ?auto_549753 ?auto_549755 ) ) ( not ( = ?auto_549753 ?auto_549756 ) ) ( not ( = ?auto_549753 ?auto_549757 ) ) ( not ( = ?auto_549754 ?auto_549755 ) ) ( not ( = ?auto_549754 ?auto_549756 ) ) ( not ( = ?auto_549754 ?auto_549757 ) ) ( not ( = ?auto_549755 ?auto_549756 ) ) ( not ( = ?auto_549755 ?auto_549757 ) ) ( not ( = ?auto_549756 ?auto_549757 ) ) ( ON ?auto_549755 ?auto_549756 ) ( ON ?auto_549754 ?auto_549755 ) ( ON ?auto_549753 ?auto_549754 ) ( ON ?auto_549752 ?auto_549753 ) ( ON ?auto_549751 ?auto_549752 ) ( ON ?auto_549750 ?auto_549751 ) ( ON ?auto_549749 ?auto_549750 ) ( ON ?auto_549748 ?auto_549749 ) ( CLEAR ?auto_549746 ) ( ON ?auto_549747 ?auto_549748 ) ( CLEAR ?auto_549747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_549744 ?auto_549745 ?auto_549746 ?auto_549747 )
      ( MAKE-13PILE ?auto_549744 ?auto_549745 ?auto_549746 ?auto_549747 ?auto_549748 ?auto_549749 ?auto_549750 ?auto_549751 ?auto_549752 ?auto_549753 ?auto_549754 ?auto_549755 ?auto_549756 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_549798 - BLOCK
      ?auto_549799 - BLOCK
      ?auto_549800 - BLOCK
      ?auto_549801 - BLOCK
      ?auto_549802 - BLOCK
      ?auto_549803 - BLOCK
      ?auto_549804 - BLOCK
      ?auto_549805 - BLOCK
      ?auto_549806 - BLOCK
      ?auto_549807 - BLOCK
      ?auto_549808 - BLOCK
      ?auto_549809 - BLOCK
      ?auto_549810 - BLOCK
    )
    :vars
    (
      ?auto_549811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_549810 ?auto_549811 ) ( ON-TABLE ?auto_549798 ) ( ON ?auto_549799 ?auto_549798 ) ( not ( = ?auto_549798 ?auto_549799 ) ) ( not ( = ?auto_549798 ?auto_549800 ) ) ( not ( = ?auto_549798 ?auto_549801 ) ) ( not ( = ?auto_549798 ?auto_549802 ) ) ( not ( = ?auto_549798 ?auto_549803 ) ) ( not ( = ?auto_549798 ?auto_549804 ) ) ( not ( = ?auto_549798 ?auto_549805 ) ) ( not ( = ?auto_549798 ?auto_549806 ) ) ( not ( = ?auto_549798 ?auto_549807 ) ) ( not ( = ?auto_549798 ?auto_549808 ) ) ( not ( = ?auto_549798 ?auto_549809 ) ) ( not ( = ?auto_549798 ?auto_549810 ) ) ( not ( = ?auto_549798 ?auto_549811 ) ) ( not ( = ?auto_549799 ?auto_549800 ) ) ( not ( = ?auto_549799 ?auto_549801 ) ) ( not ( = ?auto_549799 ?auto_549802 ) ) ( not ( = ?auto_549799 ?auto_549803 ) ) ( not ( = ?auto_549799 ?auto_549804 ) ) ( not ( = ?auto_549799 ?auto_549805 ) ) ( not ( = ?auto_549799 ?auto_549806 ) ) ( not ( = ?auto_549799 ?auto_549807 ) ) ( not ( = ?auto_549799 ?auto_549808 ) ) ( not ( = ?auto_549799 ?auto_549809 ) ) ( not ( = ?auto_549799 ?auto_549810 ) ) ( not ( = ?auto_549799 ?auto_549811 ) ) ( not ( = ?auto_549800 ?auto_549801 ) ) ( not ( = ?auto_549800 ?auto_549802 ) ) ( not ( = ?auto_549800 ?auto_549803 ) ) ( not ( = ?auto_549800 ?auto_549804 ) ) ( not ( = ?auto_549800 ?auto_549805 ) ) ( not ( = ?auto_549800 ?auto_549806 ) ) ( not ( = ?auto_549800 ?auto_549807 ) ) ( not ( = ?auto_549800 ?auto_549808 ) ) ( not ( = ?auto_549800 ?auto_549809 ) ) ( not ( = ?auto_549800 ?auto_549810 ) ) ( not ( = ?auto_549800 ?auto_549811 ) ) ( not ( = ?auto_549801 ?auto_549802 ) ) ( not ( = ?auto_549801 ?auto_549803 ) ) ( not ( = ?auto_549801 ?auto_549804 ) ) ( not ( = ?auto_549801 ?auto_549805 ) ) ( not ( = ?auto_549801 ?auto_549806 ) ) ( not ( = ?auto_549801 ?auto_549807 ) ) ( not ( = ?auto_549801 ?auto_549808 ) ) ( not ( = ?auto_549801 ?auto_549809 ) ) ( not ( = ?auto_549801 ?auto_549810 ) ) ( not ( = ?auto_549801 ?auto_549811 ) ) ( not ( = ?auto_549802 ?auto_549803 ) ) ( not ( = ?auto_549802 ?auto_549804 ) ) ( not ( = ?auto_549802 ?auto_549805 ) ) ( not ( = ?auto_549802 ?auto_549806 ) ) ( not ( = ?auto_549802 ?auto_549807 ) ) ( not ( = ?auto_549802 ?auto_549808 ) ) ( not ( = ?auto_549802 ?auto_549809 ) ) ( not ( = ?auto_549802 ?auto_549810 ) ) ( not ( = ?auto_549802 ?auto_549811 ) ) ( not ( = ?auto_549803 ?auto_549804 ) ) ( not ( = ?auto_549803 ?auto_549805 ) ) ( not ( = ?auto_549803 ?auto_549806 ) ) ( not ( = ?auto_549803 ?auto_549807 ) ) ( not ( = ?auto_549803 ?auto_549808 ) ) ( not ( = ?auto_549803 ?auto_549809 ) ) ( not ( = ?auto_549803 ?auto_549810 ) ) ( not ( = ?auto_549803 ?auto_549811 ) ) ( not ( = ?auto_549804 ?auto_549805 ) ) ( not ( = ?auto_549804 ?auto_549806 ) ) ( not ( = ?auto_549804 ?auto_549807 ) ) ( not ( = ?auto_549804 ?auto_549808 ) ) ( not ( = ?auto_549804 ?auto_549809 ) ) ( not ( = ?auto_549804 ?auto_549810 ) ) ( not ( = ?auto_549804 ?auto_549811 ) ) ( not ( = ?auto_549805 ?auto_549806 ) ) ( not ( = ?auto_549805 ?auto_549807 ) ) ( not ( = ?auto_549805 ?auto_549808 ) ) ( not ( = ?auto_549805 ?auto_549809 ) ) ( not ( = ?auto_549805 ?auto_549810 ) ) ( not ( = ?auto_549805 ?auto_549811 ) ) ( not ( = ?auto_549806 ?auto_549807 ) ) ( not ( = ?auto_549806 ?auto_549808 ) ) ( not ( = ?auto_549806 ?auto_549809 ) ) ( not ( = ?auto_549806 ?auto_549810 ) ) ( not ( = ?auto_549806 ?auto_549811 ) ) ( not ( = ?auto_549807 ?auto_549808 ) ) ( not ( = ?auto_549807 ?auto_549809 ) ) ( not ( = ?auto_549807 ?auto_549810 ) ) ( not ( = ?auto_549807 ?auto_549811 ) ) ( not ( = ?auto_549808 ?auto_549809 ) ) ( not ( = ?auto_549808 ?auto_549810 ) ) ( not ( = ?auto_549808 ?auto_549811 ) ) ( not ( = ?auto_549809 ?auto_549810 ) ) ( not ( = ?auto_549809 ?auto_549811 ) ) ( not ( = ?auto_549810 ?auto_549811 ) ) ( ON ?auto_549809 ?auto_549810 ) ( ON ?auto_549808 ?auto_549809 ) ( ON ?auto_549807 ?auto_549808 ) ( ON ?auto_549806 ?auto_549807 ) ( ON ?auto_549805 ?auto_549806 ) ( ON ?auto_549804 ?auto_549805 ) ( ON ?auto_549803 ?auto_549804 ) ( ON ?auto_549802 ?auto_549803 ) ( ON ?auto_549801 ?auto_549802 ) ( CLEAR ?auto_549799 ) ( ON ?auto_549800 ?auto_549801 ) ( CLEAR ?auto_549800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_549798 ?auto_549799 ?auto_549800 )
      ( MAKE-13PILE ?auto_549798 ?auto_549799 ?auto_549800 ?auto_549801 ?auto_549802 ?auto_549803 ?auto_549804 ?auto_549805 ?auto_549806 ?auto_549807 ?auto_549808 ?auto_549809 ?auto_549810 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_549852 - BLOCK
      ?auto_549853 - BLOCK
      ?auto_549854 - BLOCK
      ?auto_549855 - BLOCK
      ?auto_549856 - BLOCK
      ?auto_549857 - BLOCK
      ?auto_549858 - BLOCK
      ?auto_549859 - BLOCK
      ?auto_549860 - BLOCK
      ?auto_549861 - BLOCK
      ?auto_549862 - BLOCK
      ?auto_549863 - BLOCK
      ?auto_549864 - BLOCK
    )
    :vars
    (
      ?auto_549865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_549864 ?auto_549865 ) ( ON-TABLE ?auto_549852 ) ( not ( = ?auto_549852 ?auto_549853 ) ) ( not ( = ?auto_549852 ?auto_549854 ) ) ( not ( = ?auto_549852 ?auto_549855 ) ) ( not ( = ?auto_549852 ?auto_549856 ) ) ( not ( = ?auto_549852 ?auto_549857 ) ) ( not ( = ?auto_549852 ?auto_549858 ) ) ( not ( = ?auto_549852 ?auto_549859 ) ) ( not ( = ?auto_549852 ?auto_549860 ) ) ( not ( = ?auto_549852 ?auto_549861 ) ) ( not ( = ?auto_549852 ?auto_549862 ) ) ( not ( = ?auto_549852 ?auto_549863 ) ) ( not ( = ?auto_549852 ?auto_549864 ) ) ( not ( = ?auto_549852 ?auto_549865 ) ) ( not ( = ?auto_549853 ?auto_549854 ) ) ( not ( = ?auto_549853 ?auto_549855 ) ) ( not ( = ?auto_549853 ?auto_549856 ) ) ( not ( = ?auto_549853 ?auto_549857 ) ) ( not ( = ?auto_549853 ?auto_549858 ) ) ( not ( = ?auto_549853 ?auto_549859 ) ) ( not ( = ?auto_549853 ?auto_549860 ) ) ( not ( = ?auto_549853 ?auto_549861 ) ) ( not ( = ?auto_549853 ?auto_549862 ) ) ( not ( = ?auto_549853 ?auto_549863 ) ) ( not ( = ?auto_549853 ?auto_549864 ) ) ( not ( = ?auto_549853 ?auto_549865 ) ) ( not ( = ?auto_549854 ?auto_549855 ) ) ( not ( = ?auto_549854 ?auto_549856 ) ) ( not ( = ?auto_549854 ?auto_549857 ) ) ( not ( = ?auto_549854 ?auto_549858 ) ) ( not ( = ?auto_549854 ?auto_549859 ) ) ( not ( = ?auto_549854 ?auto_549860 ) ) ( not ( = ?auto_549854 ?auto_549861 ) ) ( not ( = ?auto_549854 ?auto_549862 ) ) ( not ( = ?auto_549854 ?auto_549863 ) ) ( not ( = ?auto_549854 ?auto_549864 ) ) ( not ( = ?auto_549854 ?auto_549865 ) ) ( not ( = ?auto_549855 ?auto_549856 ) ) ( not ( = ?auto_549855 ?auto_549857 ) ) ( not ( = ?auto_549855 ?auto_549858 ) ) ( not ( = ?auto_549855 ?auto_549859 ) ) ( not ( = ?auto_549855 ?auto_549860 ) ) ( not ( = ?auto_549855 ?auto_549861 ) ) ( not ( = ?auto_549855 ?auto_549862 ) ) ( not ( = ?auto_549855 ?auto_549863 ) ) ( not ( = ?auto_549855 ?auto_549864 ) ) ( not ( = ?auto_549855 ?auto_549865 ) ) ( not ( = ?auto_549856 ?auto_549857 ) ) ( not ( = ?auto_549856 ?auto_549858 ) ) ( not ( = ?auto_549856 ?auto_549859 ) ) ( not ( = ?auto_549856 ?auto_549860 ) ) ( not ( = ?auto_549856 ?auto_549861 ) ) ( not ( = ?auto_549856 ?auto_549862 ) ) ( not ( = ?auto_549856 ?auto_549863 ) ) ( not ( = ?auto_549856 ?auto_549864 ) ) ( not ( = ?auto_549856 ?auto_549865 ) ) ( not ( = ?auto_549857 ?auto_549858 ) ) ( not ( = ?auto_549857 ?auto_549859 ) ) ( not ( = ?auto_549857 ?auto_549860 ) ) ( not ( = ?auto_549857 ?auto_549861 ) ) ( not ( = ?auto_549857 ?auto_549862 ) ) ( not ( = ?auto_549857 ?auto_549863 ) ) ( not ( = ?auto_549857 ?auto_549864 ) ) ( not ( = ?auto_549857 ?auto_549865 ) ) ( not ( = ?auto_549858 ?auto_549859 ) ) ( not ( = ?auto_549858 ?auto_549860 ) ) ( not ( = ?auto_549858 ?auto_549861 ) ) ( not ( = ?auto_549858 ?auto_549862 ) ) ( not ( = ?auto_549858 ?auto_549863 ) ) ( not ( = ?auto_549858 ?auto_549864 ) ) ( not ( = ?auto_549858 ?auto_549865 ) ) ( not ( = ?auto_549859 ?auto_549860 ) ) ( not ( = ?auto_549859 ?auto_549861 ) ) ( not ( = ?auto_549859 ?auto_549862 ) ) ( not ( = ?auto_549859 ?auto_549863 ) ) ( not ( = ?auto_549859 ?auto_549864 ) ) ( not ( = ?auto_549859 ?auto_549865 ) ) ( not ( = ?auto_549860 ?auto_549861 ) ) ( not ( = ?auto_549860 ?auto_549862 ) ) ( not ( = ?auto_549860 ?auto_549863 ) ) ( not ( = ?auto_549860 ?auto_549864 ) ) ( not ( = ?auto_549860 ?auto_549865 ) ) ( not ( = ?auto_549861 ?auto_549862 ) ) ( not ( = ?auto_549861 ?auto_549863 ) ) ( not ( = ?auto_549861 ?auto_549864 ) ) ( not ( = ?auto_549861 ?auto_549865 ) ) ( not ( = ?auto_549862 ?auto_549863 ) ) ( not ( = ?auto_549862 ?auto_549864 ) ) ( not ( = ?auto_549862 ?auto_549865 ) ) ( not ( = ?auto_549863 ?auto_549864 ) ) ( not ( = ?auto_549863 ?auto_549865 ) ) ( not ( = ?auto_549864 ?auto_549865 ) ) ( ON ?auto_549863 ?auto_549864 ) ( ON ?auto_549862 ?auto_549863 ) ( ON ?auto_549861 ?auto_549862 ) ( ON ?auto_549860 ?auto_549861 ) ( ON ?auto_549859 ?auto_549860 ) ( ON ?auto_549858 ?auto_549859 ) ( ON ?auto_549857 ?auto_549858 ) ( ON ?auto_549856 ?auto_549857 ) ( ON ?auto_549855 ?auto_549856 ) ( ON ?auto_549854 ?auto_549855 ) ( CLEAR ?auto_549852 ) ( ON ?auto_549853 ?auto_549854 ) ( CLEAR ?auto_549853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_549852 ?auto_549853 )
      ( MAKE-13PILE ?auto_549852 ?auto_549853 ?auto_549854 ?auto_549855 ?auto_549856 ?auto_549857 ?auto_549858 ?auto_549859 ?auto_549860 ?auto_549861 ?auto_549862 ?auto_549863 ?auto_549864 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_549906 - BLOCK
      ?auto_549907 - BLOCK
      ?auto_549908 - BLOCK
      ?auto_549909 - BLOCK
      ?auto_549910 - BLOCK
      ?auto_549911 - BLOCK
      ?auto_549912 - BLOCK
      ?auto_549913 - BLOCK
      ?auto_549914 - BLOCK
      ?auto_549915 - BLOCK
      ?auto_549916 - BLOCK
      ?auto_549917 - BLOCK
      ?auto_549918 - BLOCK
    )
    :vars
    (
      ?auto_549919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_549918 ?auto_549919 ) ( not ( = ?auto_549906 ?auto_549907 ) ) ( not ( = ?auto_549906 ?auto_549908 ) ) ( not ( = ?auto_549906 ?auto_549909 ) ) ( not ( = ?auto_549906 ?auto_549910 ) ) ( not ( = ?auto_549906 ?auto_549911 ) ) ( not ( = ?auto_549906 ?auto_549912 ) ) ( not ( = ?auto_549906 ?auto_549913 ) ) ( not ( = ?auto_549906 ?auto_549914 ) ) ( not ( = ?auto_549906 ?auto_549915 ) ) ( not ( = ?auto_549906 ?auto_549916 ) ) ( not ( = ?auto_549906 ?auto_549917 ) ) ( not ( = ?auto_549906 ?auto_549918 ) ) ( not ( = ?auto_549906 ?auto_549919 ) ) ( not ( = ?auto_549907 ?auto_549908 ) ) ( not ( = ?auto_549907 ?auto_549909 ) ) ( not ( = ?auto_549907 ?auto_549910 ) ) ( not ( = ?auto_549907 ?auto_549911 ) ) ( not ( = ?auto_549907 ?auto_549912 ) ) ( not ( = ?auto_549907 ?auto_549913 ) ) ( not ( = ?auto_549907 ?auto_549914 ) ) ( not ( = ?auto_549907 ?auto_549915 ) ) ( not ( = ?auto_549907 ?auto_549916 ) ) ( not ( = ?auto_549907 ?auto_549917 ) ) ( not ( = ?auto_549907 ?auto_549918 ) ) ( not ( = ?auto_549907 ?auto_549919 ) ) ( not ( = ?auto_549908 ?auto_549909 ) ) ( not ( = ?auto_549908 ?auto_549910 ) ) ( not ( = ?auto_549908 ?auto_549911 ) ) ( not ( = ?auto_549908 ?auto_549912 ) ) ( not ( = ?auto_549908 ?auto_549913 ) ) ( not ( = ?auto_549908 ?auto_549914 ) ) ( not ( = ?auto_549908 ?auto_549915 ) ) ( not ( = ?auto_549908 ?auto_549916 ) ) ( not ( = ?auto_549908 ?auto_549917 ) ) ( not ( = ?auto_549908 ?auto_549918 ) ) ( not ( = ?auto_549908 ?auto_549919 ) ) ( not ( = ?auto_549909 ?auto_549910 ) ) ( not ( = ?auto_549909 ?auto_549911 ) ) ( not ( = ?auto_549909 ?auto_549912 ) ) ( not ( = ?auto_549909 ?auto_549913 ) ) ( not ( = ?auto_549909 ?auto_549914 ) ) ( not ( = ?auto_549909 ?auto_549915 ) ) ( not ( = ?auto_549909 ?auto_549916 ) ) ( not ( = ?auto_549909 ?auto_549917 ) ) ( not ( = ?auto_549909 ?auto_549918 ) ) ( not ( = ?auto_549909 ?auto_549919 ) ) ( not ( = ?auto_549910 ?auto_549911 ) ) ( not ( = ?auto_549910 ?auto_549912 ) ) ( not ( = ?auto_549910 ?auto_549913 ) ) ( not ( = ?auto_549910 ?auto_549914 ) ) ( not ( = ?auto_549910 ?auto_549915 ) ) ( not ( = ?auto_549910 ?auto_549916 ) ) ( not ( = ?auto_549910 ?auto_549917 ) ) ( not ( = ?auto_549910 ?auto_549918 ) ) ( not ( = ?auto_549910 ?auto_549919 ) ) ( not ( = ?auto_549911 ?auto_549912 ) ) ( not ( = ?auto_549911 ?auto_549913 ) ) ( not ( = ?auto_549911 ?auto_549914 ) ) ( not ( = ?auto_549911 ?auto_549915 ) ) ( not ( = ?auto_549911 ?auto_549916 ) ) ( not ( = ?auto_549911 ?auto_549917 ) ) ( not ( = ?auto_549911 ?auto_549918 ) ) ( not ( = ?auto_549911 ?auto_549919 ) ) ( not ( = ?auto_549912 ?auto_549913 ) ) ( not ( = ?auto_549912 ?auto_549914 ) ) ( not ( = ?auto_549912 ?auto_549915 ) ) ( not ( = ?auto_549912 ?auto_549916 ) ) ( not ( = ?auto_549912 ?auto_549917 ) ) ( not ( = ?auto_549912 ?auto_549918 ) ) ( not ( = ?auto_549912 ?auto_549919 ) ) ( not ( = ?auto_549913 ?auto_549914 ) ) ( not ( = ?auto_549913 ?auto_549915 ) ) ( not ( = ?auto_549913 ?auto_549916 ) ) ( not ( = ?auto_549913 ?auto_549917 ) ) ( not ( = ?auto_549913 ?auto_549918 ) ) ( not ( = ?auto_549913 ?auto_549919 ) ) ( not ( = ?auto_549914 ?auto_549915 ) ) ( not ( = ?auto_549914 ?auto_549916 ) ) ( not ( = ?auto_549914 ?auto_549917 ) ) ( not ( = ?auto_549914 ?auto_549918 ) ) ( not ( = ?auto_549914 ?auto_549919 ) ) ( not ( = ?auto_549915 ?auto_549916 ) ) ( not ( = ?auto_549915 ?auto_549917 ) ) ( not ( = ?auto_549915 ?auto_549918 ) ) ( not ( = ?auto_549915 ?auto_549919 ) ) ( not ( = ?auto_549916 ?auto_549917 ) ) ( not ( = ?auto_549916 ?auto_549918 ) ) ( not ( = ?auto_549916 ?auto_549919 ) ) ( not ( = ?auto_549917 ?auto_549918 ) ) ( not ( = ?auto_549917 ?auto_549919 ) ) ( not ( = ?auto_549918 ?auto_549919 ) ) ( ON ?auto_549917 ?auto_549918 ) ( ON ?auto_549916 ?auto_549917 ) ( ON ?auto_549915 ?auto_549916 ) ( ON ?auto_549914 ?auto_549915 ) ( ON ?auto_549913 ?auto_549914 ) ( ON ?auto_549912 ?auto_549913 ) ( ON ?auto_549911 ?auto_549912 ) ( ON ?auto_549910 ?auto_549911 ) ( ON ?auto_549909 ?auto_549910 ) ( ON ?auto_549908 ?auto_549909 ) ( ON ?auto_549907 ?auto_549908 ) ( ON ?auto_549906 ?auto_549907 ) ( CLEAR ?auto_549906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_549906 )
      ( MAKE-13PILE ?auto_549906 ?auto_549907 ?auto_549908 ?auto_549909 ?auto_549910 ?auto_549911 ?auto_549912 ?auto_549913 ?auto_549914 ?auto_549915 ?auto_549916 ?auto_549917 ?auto_549918 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_549961 - BLOCK
      ?auto_549962 - BLOCK
      ?auto_549963 - BLOCK
      ?auto_549964 - BLOCK
      ?auto_549965 - BLOCK
      ?auto_549966 - BLOCK
      ?auto_549967 - BLOCK
      ?auto_549968 - BLOCK
      ?auto_549969 - BLOCK
      ?auto_549970 - BLOCK
      ?auto_549971 - BLOCK
      ?auto_549972 - BLOCK
      ?auto_549973 - BLOCK
      ?auto_549974 - BLOCK
    )
    :vars
    (
      ?auto_549975 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_549973 ) ( ON ?auto_549974 ?auto_549975 ) ( CLEAR ?auto_549974 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_549961 ) ( ON ?auto_549962 ?auto_549961 ) ( ON ?auto_549963 ?auto_549962 ) ( ON ?auto_549964 ?auto_549963 ) ( ON ?auto_549965 ?auto_549964 ) ( ON ?auto_549966 ?auto_549965 ) ( ON ?auto_549967 ?auto_549966 ) ( ON ?auto_549968 ?auto_549967 ) ( ON ?auto_549969 ?auto_549968 ) ( ON ?auto_549970 ?auto_549969 ) ( ON ?auto_549971 ?auto_549970 ) ( ON ?auto_549972 ?auto_549971 ) ( ON ?auto_549973 ?auto_549972 ) ( not ( = ?auto_549961 ?auto_549962 ) ) ( not ( = ?auto_549961 ?auto_549963 ) ) ( not ( = ?auto_549961 ?auto_549964 ) ) ( not ( = ?auto_549961 ?auto_549965 ) ) ( not ( = ?auto_549961 ?auto_549966 ) ) ( not ( = ?auto_549961 ?auto_549967 ) ) ( not ( = ?auto_549961 ?auto_549968 ) ) ( not ( = ?auto_549961 ?auto_549969 ) ) ( not ( = ?auto_549961 ?auto_549970 ) ) ( not ( = ?auto_549961 ?auto_549971 ) ) ( not ( = ?auto_549961 ?auto_549972 ) ) ( not ( = ?auto_549961 ?auto_549973 ) ) ( not ( = ?auto_549961 ?auto_549974 ) ) ( not ( = ?auto_549961 ?auto_549975 ) ) ( not ( = ?auto_549962 ?auto_549963 ) ) ( not ( = ?auto_549962 ?auto_549964 ) ) ( not ( = ?auto_549962 ?auto_549965 ) ) ( not ( = ?auto_549962 ?auto_549966 ) ) ( not ( = ?auto_549962 ?auto_549967 ) ) ( not ( = ?auto_549962 ?auto_549968 ) ) ( not ( = ?auto_549962 ?auto_549969 ) ) ( not ( = ?auto_549962 ?auto_549970 ) ) ( not ( = ?auto_549962 ?auto_549971 ) ) ( not ( = ?auto_549962 ?auto_549972 ) ) ( not ( = ?auto_549962 ?auto_549973 ) ) ( not ( = ?auto_549962 ?auto_549974 ) ) ( not ( = ?auto_549962 ?auto_549975 ) ) ( not ( = ?auto_549963 ?auto_549964 ) ) ( not ( = ?auto_549963 ?auto_549965 ) ) ( not ( = ?auto_549963 ?auto_549966 ) ) ( not ( = ?auto_549963 ?auto_549967 ) ) ( not ( = ?auto_549963 ?auto_549968 ) ) ( not ( = ?auto_549963 ?auto_549969 ) ) ( not ( = ?auto_549963 ?auto_549970 ) ) ( not ( = ?auto_549963 ?auto_549971 ) ) ( not ( = ?auto_549963 ?auto_549972 ) ) ( not ( = ?auto_549963 ?auto_549973 ) ) ( not ( = ?auto_549963 ?auto_549974 ) ) ( not ( = ?auto_549963 ?auto_549975 ) ) ( not ( = ?auto_549964 ?auto_549965 ) ) ( not ( = ?auto_549964 ?auto_549966 ) ) ( not ( = ?auto_549964 ?auto_549967 ) ) ( not ( = ?auto_549964 ?auto_549968 ) ) ( not ( = ?auto_549964 ?auto_549969 ) ) ( not ( = ?auto_549964 ?auto_549970 ) ) ( not ( = ?auto_549964 ?auto_549971 ) ) ( not ( = ?auto_549964 ?auto_549972 ) ) ( not ( = ?auto_549964 ?auto_549973 ) ) ( not ( = ?auto_549964 ?auto_549974 ) ) ( not ( = ?auto_549964 ?auto_549975 ) ) ( not ( = ?auto_549965 ?auto_549966 ) ) ( not ( = ?auto_549965 ?auto_549967 ) ) ( not ( = ?auto_549965 ?auto_549968 ) ) ( not ( = ?auto_549965 ?auto_549969 ) ) ( not ( = ?auto_549965 ?auto_549970 ) ) ( not ( = ?auto_549965 ?auto_549971 ) ) ( not ( = ?auto_549965 ?auto_549972 ) ) ( not ( = ?auto_549965 ?auto_549973 ) ) ( not ( = ?auto_549965 ?auto_549974 ) ) ( not ( = ?auto_549965 ?auto_549975 ) ) ( not ( = ?auto_549966 ?auto_549967 ) ) ( not ( = ?auto_549966 ?auto_549968 ) ) ( not ( = ?auto_549966 ?auto_549969 ) ) ( not ( = ?auto_549966 ?auto_549970 ) ) ( not ( = ?auto_549966 ?auto_549971 ) ) ( not ( = ?auto_549966 ?auto_549972 ) ) ( not ( = ?auto_549966 ?auto_549973 ) ) ( not ( = ?auto_549966 ?auto_549974 ) ) ( not ( = ?auto_549966 ?auto_549975 ) ) ( not ( = ?auto_549967 ?auto_549968 ) ) ( not ( = ?auto_549967 ?auto_549969 ) ) ( not ( = ?auto_549967 ?auto_549970 ) ) ( not ( = ?auto_549967 ?auto_549971 ) ) ( not ( = ?auto_549967 ?auto_549972 ) ) ( not ( = ?auto_549967 ?auto_549973 ) ) ( not ( = ?auto_549967 ?auto_549974 ) ) ( not ( = ?auto_549967 ?auto_549975 ) ) ( not ( = ?auto_549968 ?auto_549969 ) ) ( not ( = ?auto_549968 ?auto_549970 ) ) ( not ( = ?auto_549968 ?auto_549971 ) ) ( not ( = ?auto_549968 ?auto_549972 ) ) ( not ( = ?auto_549968 ?auto_549973 ) ) ( not ( = ?auto_549968 ?auto_549974 ) ) ( not ( = ?auto_549968 ?auto_549975 ) ) ( not ( = ?auto_549969 ?auto_549970 ) ) ( not ( = ?auto_549969 ?auto_549971 ) ) ( not ( = ?auto_549969 ?auto_549972 ) ) ( not ( = ?auto_549969 ?auto_549973 ) ) ( not ( = ?auto_549969 ?auto_549974 ) ) ( not ( = ?auto_549969 ?auto_549975 ) ) ( not ( = ?auto_549970 ?auto_549971 ) ) ( not ( = ?auto_549970 ?auto_549972 ) ) ( not ( = ?auto_549970 ?auto_549973 ) ) ( not ( = ?auto_549970 ?auto_549974 ) ) ( not ( = ?auto_549970 ?auto_549975 ) ) ( not ( = ?auto_549971 ?auto_549972 ) ) ( not ( = ?auto_549971 ?auto_549973 ) ) ( not ( = ?auto_549971 ?auto_549974 ) ) ( not ( = ?auto_549971 ?auto_549975 ) ) ( not ( = ?auto_549972 ?auto_549973 ) ) ( not ( = ?auto_549972 ?auto_549974 ) ) ( not ( = ?auto_549972 ?auto_549975 ) ) ( not ( = ?auto_549973 ?auto_549974 ) ) ( not ( = ?auto_549973 ?auto_549975 ) ) ( not ( = ?auto_549974 ?auto_549975 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_549974 ?auto_549975 )
      ( !STACK ?auto_549974 ?auto_549973 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_550019 - BLOCK
      ?auto_550020 - BLOCK
      ?auto_550021 - BLOCK
      ?auto_550022 - BLOCK
      ?auto_550023 - BLOCK
      ?auto_550024 - BLOCK
      ?auto_550025 - BLOCK
      ?auto_550026 - BLOCK
      ?auto_550027 - BLOCK
      ?auto_550028 - BLOCK
      ?auto_550029 - BLOCK
      ?auto_550030 - BLOCK
      ?auto_550031 - BLOCK
      ?auto_550032 - BLOCK
    )
    :vars
    (
      ?auto_550033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_550032 ?auto_550033 ) ( ON-TABLE ?auto_550019 ) ( ON ?auto_550020 ?auto_550019 ) ( ON ?auto_550021 ?auto_550020 ) ( ON ?auto_550022 ?auto_550021 ) ( ON ?auto_550023 ?auto_550022 ) ( ON ?auto_550024 ?auto_550023 ) ( ON ?auto_550025 ?auto_550024 ) ( ON ?auto_550026 ?auto_550025 ) ( ON ?auto_550027 ?auto_550026 ) ( ON ?auto_550028 ?auto_550027 ) ( ON ?auto_550029 ?auto_550028 ) ( ON ?auto_550030 ?auto_550029 ) ( not ( = ?auto_550019 ?auto_550020 ) ) ( not ( = ?auto_550019 ?auto_550021 ) ) ( not ( = ?auto_550019 ?auto_550022 ) ) ( not ( = ?auto_550019 ?auto_550023 ) ) ( not ( = ?auto_550019 ?auto_550024 ) ) ( not ( = ?auto_550019 ?auto_550025 ) ) ( not ( = ?auto_550019 ?auto_550026 ) ) ( not ( = ?auto_550019 ?auto_550027 ) ) ( not ( = ?auto_550019 ?auto_550028 ) ) ( not ( = ?auto_550019 ?auto_550029 ) ) ( not ( = ?auto_550019 ?auto_550030 ) ) ( not ( = ?auto_550019 ?auto_550031 ) ) ( not ( = ?auto_550019 ?auto_550032 ) ) ( not ( = ?auto_550019 ?auto_550033 ) ) ( not ( = ?auto_550020 ?auto_550021 ) ) ( not ( = ?auto_550020 ?auto_550022 ) ) ( not ( = ?auto_550020 ?auto_550023 ) ) ( not ( = ?auto_550020 ?auto_550024 ) ) ( not ( = ?auto_550020 ?auto_550025 ) ) ( not ( = ?auto_550020 ?auto_550026 ) ) ( not ( = ?auto_550020 ?auto_550027 ) ) ( not ( = ?auto_550020 ?auto_550028 ) ) ( not ( = ?auto_550020 ?auto_550029 ) ) ( not ( = ?auto_550020 ?auto_550030 ) ) ( not ( = ?auto_550020 ?auto_550031 ) ) ( not ( = ?auto_550020 ?auto_550032 ) ) ( not ( = ?auto_550020 ?auto_550033 ) ) ( not ( = ?auto_550021 ?auto_550022 ) ) ( not ( = ?auto_550021 ?auto_550023 ) ) ( not ( = ?auto_550021 ?auto_550024 ) ) ( not ( = ?auto_550021 ?auto_550025 ) ) ( not ( = ?auto_550021 ?auto_550026 ) ) ( not ( = ?auto_550021 ?auto_550027 ) ) ( not ( = ?auto_550021 ?auto_550028 ) ) ( not ( = ?auto_550021 ?auto_550029 ) ) ( not ( = ?auto_550021 ?auto_550030 ) ) ( not ( = ?auto_550021 ?auto_550031 ) ) ( not ( = ?auto_550021 ?auto_550032 ) ) ( not ( = ?auto_550021 ?auto_550033 ) ) ( not ( = ?auto_550022 ?auto_550023 ) ) ( not ( = ?auto_550022 ?auto_550024 ) ) ( not ( = ?auto_550022 ?auto_550025 ) ) ( not ( = ?auto_550022 ?auto_550026 ) ) ( not ( = ?auto_550022 ?auto_550027 ) ) ( not ( = ?auto_550022 ?auto_550028 ) ) ( not ( = ?auto_550022 ?auto_550029 ) ) ( not ( = ?auto_550022 ?auto_550030 ) ) ( not ( = ?auto_550022 ?auto_550031 ) ) ( not ( = ?auto_550022 ?auto_550032 ) ) ( not ( = ?auto_550022 ?auto_550033 ) ) ( not ( = ?auto_550023 ?auto_550024 ) ) ( not ( = ?auto_550023 ?auto_550025 ) ) ( not ( = ?auto_550023 ?auto_550026 ) ) ( not ( = ?auto_550023 ?auto_550027 ) ) ( not ( = ?auto_550023 ?auto_550028 ) ) ( not ( = ?auto_550023 ?auto_550029 ) ) ( not ( = ?auto_550023 ?auto_550030 ) ) ( not ( = ?auto_550023 ?auto_550031 ) ) ( not ( = ?auto_550023 ?auto_550032 ) ) ( not ( = ?auto_550023 ?auto_550033 ) ) ( not ( = ?auto_550024 ?auto_550025 ) ) ( not ( = ?auto_550024 ?auto_550026 ) ) ( not ( = ?auto_550024 ?auto_550027 ) ) ( not ( = ?auto_550024 ?auto_550028 ) ) ( not ( = ?auto_550024 ?auto_550029 ) ) ( not ( = ?auto_550024 ?auto_550030 ) ) ( not ( = ?auto_550024 ?auto_550031 ) ) ( not ( = ?auto_550024 ?auto_550032 ) ) ( not ( = ?auto_550024 ?auto_550033 ) ) ( not ( = ?auto_550025 ?auto_550026 ) ) ( not ( = ?auto_550025 ?auto_550027 ) ) ( not ( = ?auto_550025 ?auto_550028 ) ) ( not ( = ?auto_550025 ?auto_550029 ) ) ( not ( = ?auto_550025 ?auto_550030 ) ) ( not ( = ?auto_550025 ?auto_550031 ) ) ( not ( = ?auto_550025 ?auto_550032 ) ) ( not ( = ?auto_550025 ?auto_550033 ) ) ( not ( = ?auto_550026 ?auto_550027 ) ) ( not ( = ?auto_550026 ?auto_550028 ) ) ( not ( = ?auto_550026 ?auto_550029 ) ) ( not ( = ?auto_550026 ?auto_550030 ) ) ( not ( = ?auto_550026 ?auto_550031 ) ) ( not ( = ?auto_550026 ?auto_550032 ) ) ( not ( = ?auto_550026 ?auto_550033 ) ) ( not ( = ?auto_550027 ?auto_550028 ) ) ( not ( = ?auto_550027 ?auto_550029 ) ) ( not ( = ?auto_550027 ?auto_550030 ) ) ( not ( = ?auto_550027 ?auto_550031 ) ) ( not ( = ?auto_550027 ?auto_550032 ) ) ( not ( = ?auto_550027 ?auto_550033 ) ) ( not ( = ?auto_550028 ?auto_550029 ) ) ( not ( = ?auto_550028 ?auto_550030 ) ) ( not ( = ?auto_550028 ?auto_550031 ) ) ( not ( = ?auto_550028 ?auto_550032 ) ) ( not ( = ?auto_550028 ?auto_550033 ) ) ( not ( = ?auto_550029 ?auto_550030 ) ) ( not ( = ?auto_550029 ?auto_550031 ) ) ( not ( = ?auto_550029 ?auto_550032 ) ) ( not ( = ?auto_550029 ?auto_550033 ) ) ( not ( = ?auto_550030 ?auto_550031 ) ) ( not ( = ?auto_550030 ?auto_550032 ) ) ( not ( = ?auto_550030 ?auto_550033 ) ) ( not ( = ?auto_550031 ?auto_550032 ) ) ( not ( = ?auto_550031 ?auto_550033 ) ) ( not ( = ?auto_550032 ?auto_550033 ) ) ( CLEAR ?auto_550030 ) ( ON ?auto_550031 ?auto_550032 ) ( CLEAR ?auto_550031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_550019 ?auto_550020 ?auto_550021 ?auto_550022 ?auto_550023 ?auto_550024 ?auto_550025 ?auto_550026 ?auto_550027 ?auto_550028 ?auto_550029 ?auto_550030 ?auto_550031 )
      ( MAKE-14PILE ?auto_550019 ?auto_550020 ?auto_550021 ?auto_550022 ?auto_550023 ?auto_550024 ?auto_550025 ?auto_550026 ?auto_550027 ?auto_550028 ?auto_550029 ?auto_550030 ?auto_550031 ?auto_550032 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_550077 - BLOCK
      ?auto_550078 - BLOCK
      ?auto_550079 - BLOCK
      ?auto_550080 - BLOCK
      ?auto_550081 - BLOCK
      ?auto_550082 - BLOCK
      ?auto_550083 - BLOCK
      ?auto_550084 - BLOCK
      ?auto_550085 - BLOCK
      ?auto_550086 - BLOCK
      ?auto_550087 - BLOCK
      ?auto_550088 - BLOCK
      ?auto_550089 - BLOCK
      ?auto_550090 - BLOCK
    )
    :vars
    (
      ?auto_550091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_550090 ?auto_550091 ) ( ON-TABLE ?auto_550077 ) ( ON ?auto_550078 ?auto_550077 ) ( ON ?auto_550079 ?auto_550078 ) ( ON ?auto_550080 ?auto_550079 ) ( ON ?auto_550081 ?auto_550080 ) ( ON ?auto_550082 ?auto_550081 ) ( ON ?auto_550083 ?auto_550082 ) ( ON ?auto_550084 ?auto_550083 ) ( ON ?auto_550085 ?auto_550084 ) ( ON ?auto_550086 ?auto_550085 ) ( ON ?auto_550087 ?auto_550086 ) ( not ( = ?auto_550077 ?auto_550078 ) ) ( not ( = ?auto_550077 ?auto_550079 ) ) ( not ( = ?auto_550077 ?auto_550080 ) ) ( not ( = ?auto_550077 ?auto_550081 ) ) ( not ( = ?auto_550077 ?auto_550082 ) ) ( not ( = ?auto_550077 ?auto_550083 ) ) ( not ( = ?auto_550077 ?auto_550084 ) ) ( not ( = ?auto_550077 ?auto_550085 ) ) ( not ( = ?auto_550077 ?auto_550086 ) ) ( not ( = ?auto_550077 ?auto_550087 ) ) ( not ( = ?auto_550077 ?auto_550088 ) ) ( not ( = ?auto_550077 ?auto_550089 ) ) ( not ( = ?auto_550077 ?auto_550090 ) ) ( not ( = ?auto_550077 ?auto_550091 ) ) ( not ( = ?auto_550078 ?auto_550079 ) ) ( not ( = ?auto_550078 ?auto_550080 ) ) ( not ( = ?auto_550078 ?auto_550081 ) ) ( not ( = ?auto_550078 ?auto_550082 ) ) ( not ( = ?auto_550078 ?auto_550083 ) ) ( not ( = ?auto_550078 ?auto_550084 ) ) ( not ( = ?auto_550078 ?auto_550085 ) ) ( not ( = ?auto_550078 ?auto_550086 ) ) ( not ( = ?auto_550078 ?auto_550087 ) ) ( not ( = ?auto_550078 ?auto_550088 ) ) ( not ( = ?auto_550078 ?auto_550089 ) ) ( not ( = ?auto_550078 ?auto_550090 ) ) ( not ( = ?auto_550078 ?auto_550091 ) ) ( not ( = ?auto_550079 ?auto_550080 ) ) ( not ( = ?auto_550079 ?auto_550081 ) ) ( not ( = ?auto_550079 ?auto_550082 ) ) ( not ( = ?auto_550079 ?auto_550083 ) ) ( not ( = ?auto_550079 ?auto_550084 ) ) ( not ( = ?auto_550079 ?auto_550085 ) ) ( not ( = ?auto_550079 ?auto_550086 ) ) ( not ( = ?auto_550079 ?auto_550087 ) ) ( not ( = ?auto_550079 ?auto_550088 ) ) ( not ( = ?auto_550079 ?auto_550089 ) ) ( not ( = ?auto_550079 ?auto_550090 ) ) ( not ( = ?auto_550079 ?auto_550091 ) ) ( not ( = ?auto_550080 ?auto_550081 ) ) ( not ( = ?auto_550080 ?auto_550082 ) ) ( not ( = ?auto_550080 ?auto_550083 ) ) ( not ( = ?auto_550080 ?auto_550084 ) ) ( not ( = ?auto_550080 ?auto_550085 ) ) ( not ( = ?auto_550080 ?auto_550086 ) ) ( not ( = ?auto_550080 ?auto_550087 ) ) ( not ( = ?auto_550080 ?auto_550088 ) ) ( not ( = ?auto_550080 ?auto_550089 ) ) ( not ( = ?auto_550080 ?auto_550090 ) ) ( not ( = ?auto_550080 ?auto_550091 ) ) ( not ( = ?auto_550081 ?auto_550082 ) ) ( not ( = ?auto_550081 ?auto_550083 ) ) ( not ( = ?auto_550081 ?auto_550084 ) ) ( not ( = ?auto_550081 ?auto_550085 ) ) ( not ( = ?auto_550081 ?auto_550086 ) ) ( not ( = ?auto_550081 ?auto_550087 ) ) ( not ( = ?auto_550081 ?auto_550088 ) ) ( not ( = ?auto_550081 ?auto_550089 ) ) ( not ( = ?auto_550081 ?auto_550090 ) ) ( not ( = ?auto_550081 ?auto_550091 ) ) ( not ( = ?auto_550082 ?auto_550083 ) ) ( not ( = ?auto_550082 ?auto_550084 ) ) ( not ( = ?auto_550082 ?auto_550085 ) ) ( not ( = ?auto_550082 ?auto_550086 ) ) ( not ( = ?auto_550082 ?auto_550087 ) ) ( not ( = ?auto_550082 ?auto_550088 ) ) ( not ( = ?auto_550082 ?auto_550089 ) ) ( not ( = ?auto_550082 ?auto_550090 ) ) ( not ( = ?auto_550082 ?auto_550091 ) ) ( not ( = ?auto_550083 ?auto_550084 ) ) ( not ( = ?auto_550083 ?auto_550085 ) ) ( not ( = ?auto_550083 ?auto_550086 ) ) ( not ( = ?auto_550083 ?auto_550087 ) ) ( not ( = ?auto_550083 ?auto_550088 ) ) ( not ( = ?auto_550083 ?auto_550089 ) ) ( not ( = ?auto_550083 ?auto_550090 ) ) ( not ( = ?auto_550083 ?auto_550091 ) ) ( not ( = ?auto_550084 ?auto_550085 ) ) ( not ( = ?auto_550084 ?auto_550086 ) ) ( not ( = ?auto_550084 ?auto_550087 ) ) ( not ( = ?auto_550084 ?auto_550088 ) ) ( not ( = ?auto_550084 ?auto_550089 ) ) ( not ( = ?auto_550084 ?auto_550090 ) ) ( not ( = ?auto_550084 ?auto_550091 ) ) ( not ( = ?auto_550085 ?auto_550086 ) ) ( not ( = ?auto_550085 ?auto_550087 ) ) ( not ( = ?auto_550085 ?auto_550088 ) ) ( not ( = ?auto_550085 ?auto_550089 ) ) ( not ( = ?auto_550085 ?auto_550090 ) ) ( not ( = ?auto_550085 ?auto_550091 ) ) ( not ( = ?auto_550086 ?auto_550087 ) ) ( not ( = ?auto_550086 ?auto_550088 ) ) ( not ( = ?auto_550086 ?auto_550089 ) ) ( not ( = ?auto_550086 ?auto_550090 ) ) ( not ( = ?auto_550086 ?auto_550091 ) ) ( not ( = ?auto_550087 ?auto_550088 ) ) ( not ( = ?auto_550087 ?auto_550089 ) ) ( not ( = ?auto_550087 ?auto_550090 ) ) ( not ( = ?auto_550087 ?auto_550091 ) ) ( not ( = ?auto_550088 ?auto_550089 ) ) ( not ( = ?auto_550088 ?auto_550090 ) ) ( not ( = ?auto_550088 ?auto_550091 ) ) ( not ( = ?auto_550089 ?auto_550090 ) ) ( not ( = ?auto_550089 ?auto_550091 ) ) ( not ( = ?auto_550090 ?auto_550091 ) ) ( ON ?auto_550089 ?auto_550090 ) ( CLEAR ?auto_550087 ) ( ON ?auto_550088 ?auto_550089 ) ( CLEAR ?auto_550088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_550077 ?auto_550078 ?auto_550079 ?auto_550080 ?auto_550081 ?auto_550082 ?auto_550083 ?auto_550084 ?auto_550085 ?auto_550086 ?auto_550087 ?auto_550088 )
      ( MAKE-14PILE ?auto_550077 ?auto_550078 ?auto_550079 ?auto_550080 ?auto_550081 ?auto_550082 ?auto_550083 ?auto_550084 ?auto_550085 ?auto_550086 ?auto_550087 ?auto_550088 ?auto_550089 ?auto_550090 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_550135 - BLOCK
      ?auto_550136 - BLOCK
      ?auto_550137 - BLOCK
      ?auto_550138 - BLOCK
      ?auto_550139 - BLOCK
      ?auto_550140 - BLOCK
      ?auto_550141 - BLOCK
      ?auto_550142 - BLOCK
      ?auto_550143 - BLOCK
      ?auto_550144 - BLOCK
      ?auto_550145 - BLOCK
      ?auto_550146 - BLOCK
      ?auto_550147 - BLOCK
      ?auto_550148 - BLOCK
    )
    :vars
    (
      ?auto_550149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_550148 ?auto_550149 ) ( ON-TABLE ?auto_550135 ) ( ON ?auto_550136 ?auto_550135 ) ( ON ?auto_550137 ?auto_550136 ) ( ON ?auto_550138 ?auto_550137 ) ( ON ?auto_550139 ?auto_550138 ) ( ON ?auto_550140 ?auto_550139 ) ( ON ?auto_550141 ?auto_550140 ) ( ON ?auto_550142 ?auto_550141 ) ( ON ?auto_550143 ?auto_550142 ) ( ON ?auto_550144 ?auto_550143 ) ( not ( = ?auto_550135 ?auto_550136 ) ) ( not ( = ?auto_550135 ?auto_550137 ) ) ( not ( = ?auto_550135 ?auto_550138 ) ) ( not ( = ?auto_550135 ?auto_550139 ) ) ( not ( = ?auto_550135 ?auto_550140 ) ) ( not ( = ?auto_550135 ?auto_550141 ) ) ( not ( = ?auto_550135 ?auto_550142 ) ) ( not ( = ?auto_550135 ?auto_550143 ) ) ( not ( = ?auto_550135 ?auto_550144 ) ) ( not ( = ?auto_550135 ?auto_550145 ) ) ( not ( = ?auto_550135 ?auto_550146 ) ) ( not ( = ?auto_550135 ?auto_550147 ) ) ( not ( = ?auto_550135 ?auto_550148 ) ) ( not ( = ?auto_550135 ?auto_550149 ) ) ( not ( = ?auto_550136 ?auto_550137 ) ) ( not ( = ?auto_550136 ?auto_550138 ) ) ( not ( = ?auto_550136 ?auto_550139 ) ) ( not ( = ?auto_550136 ?auto_550140 ) ) ( not ( = ?auto_550136 ?auto_550141 ) ) ( not ( = ?auto_550136 ?auto_550142 ) ) ( not ( = ?auto_550136 ?auto_550143 ) ) ( not ( = ?auto_550136 ?auto_550144 ) ) ( not ( = ?auto_550136 ?auto_550145 ) ) ( not ( = ?auto_550136 ?auto_550146 ) ) ( not ( = ?auto_550136 ?auto_550147 ) ) ( not ( = ?auto_550136 ?auto_550148 ) ) ( not ( = ?auto_550136 ?auto_550149 ) ) ( not ( = ?auto_550137 ?auto_550138 ) ) ( not ( = ?auto_550137 ?auto_550139 ) ) ( not ( = ?auto_550137 ?auto_550140 ) ) ( not ( = ?auto_550137 ?auto_550141 ) ) ( not ( = ?auto_550137 ?auto_550142 ) ) ( not ( = ?auto_550137 ?auto_550143 ) ) ( not ( = ?auto_550137 ?auto_550144 ) ) ( not ( = ?auto_550137 ?auto_550145 ) ) ( not ( = ?auto_550137 ?auto_550146 ) ) ( not ( = ?auto_550137 ?auto_550147 ) ) ( not ( = ?auto_550137 ?auto_550148 ) ) ( not ( = ?auto_550137 ?auto_550149 ) ) ( not ( = ?auto_550138 ?auto_550139 ) ) ( not ( = ?auto_550138 ?auto_550140 ) ) ( not ( = ?auto_550138 ?auto_550141 ) ) ( not ( = ?auto_550138 ?auto_550142 ) ) ( not ( = ?auto_550138 ?auto_550143 ) ) ( not ( = ?auto_550138 ?auto_550144 ) ) ( not ( = ?auto_550138 ?auto_550145 ) ) ( not ( = ?auto_550138 ?auto_550146 ) ) ( not ( = ?auto_550138 ?auto_550147 ) ) ( not ( = ?auto_550138 ?auto_550148 ) ) ( not ( = ?auto_550138 ?auto_550149 ) ) ( not ( = ?auto_550139 ?auto_550140 ) ) ( not ( = ?auto_550139 ?auto_550141 ) ) ( not ( = ?auto_550139 ?auto_550142 ) ) ( not ( = ?auto_550139 ?auto_550143 ) ) ( not ( = ?auto_550139 ?auto_550144 ) ) ( not ( = ?auto_550139 ?auto_550145 ) ) ( not ( = ?auto_550139 ?auto_550146 ) ) ( not ( = ?auto_550139 ?auto_550147 ) ) ( not ( = ?auto_550139 ?auto_550148 ) ) ( not ( = ?auto_550139 ?auto_550149 ) ) ( not ( = ?auto_550140 ?auto_550141 ) ) ( not ( = ?auto_550140 ?auto_550142 ) ) ( not ( = ?auto_550140 ?auto_550143 ) ) ( not ( = ?auto_550140 ?auto_550144 ) ) ( not ( = ?auto_550140 ?auto_550145 ) ) ( not ( = ?auto_550140 ?auto_550146 ) ) ( not ( = ?auto_550140 ?auto_550147 ) ) ( not ( = ?auto_550140 ?auto_550148 ) ) ( not ( = ?auto_550140 ?auto_550149 ) ) ( not ( = ?auto_550141 ?auto_550142 ) ) ( not ( = ?auto_550141 ?auto_550143 ) ) ( not ( = ?auto_550141 ?auto_550144 ) ) ( not ( = ?auto_550141 ?auto_550145 ) ) ( not ( = ?auto_550141 ?auto_550146 ) ) ( not ( = ?auto_550141 ?auto_550147 ) ) ( not ( = ?auto_550141 ?auto_550148 ) ) ( not ( = ?auto_550141 ?auto_550149 ) ) ( not ( = ?auto_550142 ?auto_550143 ) ) ( not ( = ?auto_550142 ?auto_550144 ) ) ( not ( = ?auto_550142 ?auto_550145 ) ) ( not ( = ?auto_550142 ?auto_550146 ) ) ( not ( = ?auto_550142 ?auto_550147 ) ) ( not ( = ?auto_550142 ?auto_550148 ) ) ( not ( = ?auto_550142 ?auto_550149 ) ) ( not ( = ?auto_550143 ?auto_550144 ) ) ( not ( = ?auto_550143 ?auto_550145 ) ) ( not ( = ?auto_550143 ?auto_550146 ) ) ( not ( = ?auto_550143 ?auto_550147 ) ) ( not ( = ?auto_550143 ?auto_550148 ) ) ( not ( = ?auto_550143 ?auto_550149 ) ) ( not ( = ?auto_550144 ?auto_550145 ) ) ( not ( = ?auto_550144 ?auto_550146 ) ) ( not ( = ?auto_550144 ?auto_550147 ) ) ( not ( = ?auto_550144 ?auto_550148 ) ) ( not ( = ?auto_550144 ?auto_550149 ) ) ( not ( = ?auto_550145 ?auto_550146 ) ) ( not ( = ?auto_550145 ?auto_550147 ) ) ( not ( = ?auto_550145 ?auto_550148 ) ) ( not ( = ?auto_550145 ?auto_550149 ) ) ( not ( = ?auto_550146 ?auto_550147 ) ) ( not ( = ?auto_550146 ?auto_550148 ) ) ( not ( = ?auto_550146 ?auto_550149 ) ) ( not ( = ?auto_550147 ?auto_550148 ) ) ( not ( = ?auto_550147 ?auto_550149 ) ) ( not ( = ?auto_550148 ?auto_550149 ) ) ( ON ?auto_550147 ?auto_550148 ) ( ON ?auto_550146 ?auto_550147 ) ( CLEAR ?auto_550144 ) ( ON ?auto_550145 ?auto_550146 ) ( CLEAR ?auto_550145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_550135 ?auto_550136 ?auto_550137 ?auto_550138 ?auto_550139 ?auto_550140 ?auto_550141 ?auto_550142 ?auto_550143 ?auto_550144 ?auto_550145 )
      ( MAKE-14PILE ?auto_550135 ?auto_550136 ?auto_550137 ?auto_550138 ?auto_550139 ?auto_550140 ?auto_550141 ?auto_550142 ?auto_550143 ?auto_550144 ?auto_550145 ?auto_550146 ?auto_550147 ?auto_550148 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_550193 - BLOCK
      ?auto_550194 - BLOCK
      ?auto_550195 - BLOCK
      ?auto_550196 - BLOCK
      ?auto_550197 - BLOCK
      ?auto_550198 - BLOCK
      ?auto_550199 - BLOCK
      ?auto_550200 - BLOCK
      ?auto_550201 - BLOCK
      ?auto_550202 - BLOCK
      ?auto_550203 - BLOCK
      ?auto_550204 - BLOCK
      ?auto_550205 - BLOCK
      ?auto_550206 - BLOCK
    )
    :vars
    (
      ?auto_550207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_550206 ?auto_550207 ) ( ON-TABLE ?auto_550193 ) ( ON ?auto_550194 ?auto_550193 ) ( ON ?auto_550195 ?auto_550194 ) ( ON ?auto_550196 ?auto_550195 ) ( ON ?auto_550197 ?auto_550196 ) ( ON ?auto_550198 ?auto_550197 ) ( ON ?auto_550199 ?auto_550198 ) ( ON ?auto_550200 ?auto_550199 ) ( ON ?auto_550201 ?auto_550200 ) ( not ( = ?auto_550193 ?auto_550194 ) ) ( not ( = ?auto_550193 ?auto_550195 ) ) ( not ( = ?auto_550193 ?auto_550196 ) ) ( not ( = ?auto_550193 ?auto_550197 ) ) ( not ( = ?auto_550193 ?auto_550198 ) ) ( not ( = ?auto_550193 ?auto_550199 ) ) ( not ( = ?auto_550193 ?auto_550200 ) ) ( not ( = ?auto_550193 ?auto_550201 ) ) ( not ( = ?auto_550193 ?auto_550202 ) ) ( not ( = ?auto_550193 ?auto_550203 ) ) ( not ( = ?auto_550193 ?auto_550204 ) ) ( not ( = ?auto_550193 ?auto_550205 ) ) ( not ( = ?auto_550193 ?auto_550206 ) ) ( not ( = ?auto_550193 ?auto_550207 ) ) ( not ( = ?auto_550194 ?auto_550195 ) ) ( not ( = ?auto_550194 ?auto_550196 ) ) ( not ( = ?auto_550194 ?auto_550197 ) ) ( not ( = ?auto_550194 ?auto_550198 ) ) ( not ( = ?auto_550194 ?auto_550199 ) ) ( not ( = ?auto_550194 ?auto_550200 ) ) ( not ( = ?auto_550194 ?auto_550201 ) ) ( not ( = ?auto_550194 ?auto_550202 ) ) ( not ( = ?auto_550194 ?auto_550203 ) ) ( not ( = ?auto_550194 ?auto_550204 ) ) ( not ( = ?auto_550194 ?auto_550205 ) ) ( not ( = ?auto_550194 ?auto_550206 ) ) ( not ( = ?auto_550194 ?auto_550207 ) ) ( not ( = ?auto_550195 ?auto_550196 ) ) ( not ( = ?auto_550195 ?auto_550197 ) ) ( not ( = ?auto_550195 ?auto_550198 ) ) ( not ( = ?auto_550195 ?auto_550199 ) ) ( not ( = ?auto_550195 ?auto_550200 ) ) ( not ( = ?auto_550195 ?auto_550201 ) ) ( not ( = ?auto_550195 ?auto_550202 ) ) ( not ( = ?auto_550195 ?auto_550203 ) ) ( not ( = ?auto_550195 ?auto_550204 ) ) ( not ( = ?auto_550195 ?auto_550205 ) ) ( not ( = ?auto_550195 ?auto_550206 ) ) ( not ( = ?auto_550195 ?auto_550207 ) ) ( not ( = ?auto_550196 ?auto_550197 ) ) ( not ( = ?auto_550196 ?auto_550198 ) ) ( not ( = ?auto_550196 ?auto_550199 ) ) ( not ( = ?auto_550196 ?auto_550200 ) ) ( not ( = ?auto_550196 ?auto_550201 ) ) ( not ( = ?auto_550196 ?auto_550202 ) ) ( not ( = ?auto_550196 ?auto_550203 ) ) ( not ( = ?auto_550196 ?auto_550204 ) ) ( not ( = ?auto_550196 ?auto_550205 ) ) ( not ( = ?auto_550196 ?auto_550206 ) ) ( not ( = ?auto_550196 ?auto_550207 ) ) ( not ( = ?auto_550197 ?auto_550198 ) ) ( not ( = ?auto_550197 ?auto_550199 ) ) ( not ( = ?auto_550197 ?auto_550200 ) ) ( not ( = ?auto_550197 ?auto_550201 ) ) ( not ( = ?auto_550197 ?auto_550202 ) ) ( not ( = ?auto_550197 ?auto_550203 ) ) ( not ( = ?auto_550197 ?auto_550204 ) ) ( not ( = ?auto_550197 ?auto_550205 ) ) ( not ( = ?auto_550197 ?auto_550206 ) ) ( not ( = ?auto_550197 ?auto_550207 ) ) ( not ( = ?auto_550198 ?auto_550199 ) ) ( not ( = ?auto_550198 ?auto_550200 ) ) ( not ( = ?auto_550198 ?auto_550201 ) ) ( not ( = ?auto_550198 ?auto_550202 ) ) ( not ( = ?auto_550198 ?auto_550203 ) ) ( not ( = ?auto_550198 ?auto_550204 ) ) ( not ( = ?auto_550198 ?auto_550205 ) ) ( not ( = ?auto_550198 ?auto_550206 ) ) ( not ( = ?auto_550198 ?auto_550207 ) ) ( not ( = ?auto_550199 ?auto_550200 ) ) ( not ( = ?auto_550199 ?auto_550201 ) ) ( not ( = ?auto_550199 ?auto_550202 ) ) ( not ( = ?auto_550199 ?auto_550203 ) ) ( not ( = ?auto_550199 ?auto_550204 ) ) ( not ( = ?auto_550199 ?auto_550205 ) ) ( not ( = ?auto_550199 ?auto_550206 ) ) ( not ( = ?auto_550199 ?auto_550207 ) ) ( not ( = ?auto_550200 ?auto_550201 ) ) ( not ( = ?auto_550200 ?auto_550202 ) ) ( not ( = ?auto_550200 ?auto_550203 ) ) ( not ( = ?auto_550200 ?auto_550204 ) ) ( not ( = ?auto_550200 ?auto_550205 ) ) ( not ( = ?auto_550200 ?auto_550206 ) ) ( not ( = ?auto_550200 ?auto_550207 ) ) ( not ( = ?auto_550201 ?auto_550202 ) ) ( not ( = ?auto_550201 ?auto_550203 ) ) ( not ( = ?auto_550201 ?auto_550204 ) ) ( not ( = ?auto_550201 ?auto_550205 ) ) ( not ( = ?auto_550201 ?auto_550206 ) ) ( not ( = ?auto_550201 ?auto_550207 ) ) ( not ( = ?auto_550202 ?auto_550203 ) ) ( not ( = ?auto_550202 ?auto_550204 ) ) ( not ( = ?auto_550202 ?auto_550205 ) ) ( not ( = ?auto_550202 ?auto_550206 ) ) ( not ( = ?auto_550202 ?auto_550207 ) ) ( not ( = ?auto_550203 ?auto_550204 ) ) ( not ( = ?auto_550203 ?auto_550205 ) ) ( not ( = ?auto_550203 ?auto_550206 ) ) ( not ( = ?auto_550203 ?auto_550207 ) ) ( not ( = ?auto_550204 ?auto_550205 ) ) ( not ( = ?auto_550204 ?auto_550206 ) ) ( not ( = ?auto_550204 ?auto_550207 ) ) ( not ( = ?auto_550205 ?auto_550206 ) ) ( not ( = ?auto_550205 ?auto_550207 ) ) ( not ( = ?auto_550206 ?auto_550207 ) ) ( ON ?auto_550205 ?auto_550206 ) ( ON ?auto_550204 ?auto_550205 ) ( ON ?auto_550203 ?auto_550204 ) ( CLEAR ?auto_550201 ) ( ON ?auto_550202 ?auto_550203 ) ( CLEAR ?auto_550202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_550193 ?auto_550194 ?auto_550195 ?auto_550196 ?auto_550197 ?auto_550198 ?auto_550199 ?auto_550200 ?auto_550201 ?auto_550202 )
      ( MAKE-14PILE ?auto_550193 ?auto_550194 ?auto_550195 ?auto_550196 ?auto_550197 ?auto_550198 ?auto_550199 ?auto_550200 ?auto_550201 ?auto_550202 ?auto_550203 ?auto_550204 ?auto_550205 ?auto_550206 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_550251 - BLOCK
      ?auto_550252 - BLOCK
      ?auto_550253 - BLOCK
      ?auto_550254 - BLOCK
      ?auto_550255 - BLOCK
      ?auto_550256 - BLOCK
      ?auto_550257 - BLOCK
      ?auto_550258 - BLOCK
      ?auto_550259 - BLOCK
      ?auto_550260 - BLOCK
      ?auto_550261 - BLOCK
      ?auto_550262 - BLOCK
      ?auto_550263 - BLOCK
      ?auto_550264 - BLOCK
    )
    :vars
    (
      ?auto_550265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_550264 ?auto_550265 ) ( ON-TABLE ?auto_550251 ) ( ON ?auto_550252 ?auto_550251 ) ( ON ?auto_550253 ?auto_550252 ) ( ON ?auto_550254 ?auto_550253 ) ( ON ?auto_550255 ?auto_550254 ) ( ON ?auto_550256 ?auto_550255 ) ( ON ?auto_550257 ?auto_550256 ) ( ON ?auto_550258 ?auto_550257 ) ( not ( = ?auto_550251 ?auto_550252 ) ) ( not ( = ?auto_550251 ?auto_550253 ) ) ( not ( = ?auto_550251 ?auto_550254 ) ) ( not ( = ?auto_550251 ?auto_550255 ) ) ( not ( = ?auto_550251 ?auto_550256 ) ) ( not ( = ?auto_550251 ?auto_550257 ) ) ( not ( = ?auto_550251 ?auto_550258 ) ) ( not ( = ?auto_550251 ?auto_550259 ) ) ( not ( = ?auto_550251 ?auto_550260 ) ) ( not ( = ?auto_550251 ?auto_550261 ) ) ( not ( = ?auto_550251 ?auto_550262 ) ) ( not ( = ?auto_550251 ?auto_550263 ) ) ( not ( = ?auto_550251 ?auto_550264 ) ) ( not ( = ?auto_550251 ?auto_550265 ) ) ( not ( = ?auto_550252 ?auto_550253 ) ) ( not ( = ?auto_550252 ?auto_550254 ) ) ( not ( = ?auto_550252 ?auto_550255 ) ) ( not ( = ?auto_550252 ?auto_550256 ) ) ( not ( = ?auto_550252 ?auto_550257 ) ) ( not ( = ?auto_550252 ?auto_550258 ) ) ( not ( = ?auto_550252 ?auto_550259 ) ) ( not ( = ?auto_550252 ?auto_550260 ) ) ( not ( = ?auto_550252 ?auto_550261 ) ) ( not ( = ?auto_550252 ?auto_550262 ) ) ( not ( = ?auto_550252 ?auto_550263 ) ) ( not ( = ?auto_550252 ?auto_550264 ) ) ( not ( = ?auto_550252 ?auto_550265 ) ) ( not ( = ?auto_550253 ?auto_550254 ) ) ( not ( = ?auto_550253 ?auto_550255 ) ) ( not ( = ?auto_550253 ?auto_550256 ) ) ( not ( = ?auto_550253 ?auto_550257 ) ) ( not ( = ?auto_550253 ?auto_550258 ) ) ( not ( = ?auto_550253 ?auto_550259 ) ) ( not ( = ?auto_550253 ?auto_550260 ) ) ( not ( = ?auto_550253 ?auto_550261 ) ) ( not ( = ?auto_550253 ?auto_550262 ) ) ( not ( = ?auto_550253 ?auto_550263 ) ) ( not ( = ?auto_550253 ?auto_550264 ) ) ( not ( = ?auto_550253 ?auto_550265 ) ) ( not ( = ?auto_550254 ?auto_550255 ) ) ( not ( = ?auto_550254 ?auto_550256 ) ) ( not ( = ?auto_550254 ?auto_550257 ) ) ( not ( = ?auto_550254 ?auto_550258 ) ) ( not ( = ?auto_550254 ?auto_550259 ) ) ( not ( = ?auto_550254 ?auto_550260 ) ) ( not ( = ?auto_550254 ?auto_550261 ) ) ( not ( = ?auto_550254 ?auto_550262 ) ) ( not ( = ?auto_550254 ?auto_550263 ) ) ( not ( = ?auto_550254 ?auto_550264 ) ) ( not ( = ?auto_550254 ?auto_550265 ) ) ( not ( = ?auto_550255 ?auto_550256 ) ) ( not ( = ?auto_550255 ?auto_550257 ) ) ( not ( = ?auto_550255 ?auto_550258 ) ) ( not ( = ?auto_550255 ?auto_550259 ) ) ( not ( = ?auto_550255 ?auto_550260 ) ) ( not ( = ?auto_550255 ?auto_550261 ) ) ( not ( = ?auto_550255 ?auto_550262 ) ) ( not ( = ?auto_550255 ?auto_550263 ) ) ( not ( = ?auto_550255 ?auto_550264 ) ) ( not ( = ?auto_550255 ?auto_550265 ) ) ( not ( = ?auto_550256 ?auto_550257 ) ) ( not ( = ?auto_550256 ?auto_550258 ) ) ( not ( = ?auto_550256 ?auto_550259 ) ) ( not ( = ?auto_550256 ?auto_550260 ) ) ( not ( = ?auto_550256 ?auto_550261 ) ) ( not ( = ?auto_550256 ?auto_550262 ) ) ( not ( = ?auto_550256 ?auto_550263 ) ) ( not ( = ?auto_550256 ?auto_550264 ) ) ( not ( = ?auto_550256 ?auto_550265 ) ) ( not ( = ?auto_550257 ?auto_550258 ) ) ( not ( = ?auto_550257 ?auto_550259 ) ) ( not ( = ?auto_550257 ?auto_550260 ) ) ( not ( = ?auto_550257 ?auto_550261 ) ) ( not ( = ?auto_550257 ?auto_550262 ) ) ( not ( = ?auto_550257 ?auto_550263 ) ) ( not ( = ?auto_550257 ?auto_550264 ) ) ( not ( = ?auto_550257 ?auto_550265 ) ) ( not ( = ?auto_550258 ?auto_550259 ) ) ( not ( = ?auto_550258 ?auto_550260 ) ) ( not ( = ?auto_550258 ?auto_550261 ) ) ( not ( = ?auto_550258 ?auto_550262 ) ) ( not ( = ?auto_550258 ?auto_550263 ) ) ( not ( = ?auto_550258 ?auto_550264 ) ) ( not ( = ?auto_550258 ?auto_550265 ) ) ( not ( = ?auto_550259 ?auto_550260 ) ) ( not ( = ?auto_550259 ?auto_550261 ) ) ( not ( = ?auto_550259 ?auto_550262 ) ) ( not ( = ?auto_550259 ?auto_550263 ) ) ( not ( = ?auto_550259 ?auto_550264 ) ) ( not ( = ?auto_550259 ?auto_550265 ) ) ( not ( = ?auto_550260 ?auto_550261 ) ) ( not ( = ?auto_550260 ?auto_550262 ) ) ( not ( = ?auto_550260 ?auto_550263 ) ) ( not ( = ?auto_550260 ?auto_550264 ) ) ( not ( = ?auto_550260 ?auto_550265 ) ) ( not ( = ?auto_550261 ?auto_550262 ) ) ( not ( = ?auto_550261 ?auto_550263 ) ) ( not ( = ?auto_550261 ?auto_550264 ) ) ( not ( = ?auto_550261 ?auto_550265 ) ) ( not ( = ?auto_550262 ?auto_550263 ) ) ( not ( = ?auto_550262 ?auto_550264 ) ) ( not ( = ?auto_550262 ?auto_550265 ) ) ( not ( = ?auto_550263 ?auto_550264 ) ) ( not ( = ?auto_550263 ?auto_550265 ) ) ( not ( = ?auto_550264 ?auto_550265 ) ) ( ON ?auto_550263 ?auto_550264 ) ( ON ?auto_550262 ?auto_550263 ) ( ON ?auto_550261 ?auto_550262 ) ( ON ?auto_550260 ?auto_550261 ) ( CLEAR ?auto_550258 ) ( ON ?auto_550259 ?auto_550260 ) ( CLEAR ?auto_550259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_550251 ?auto_550252 ?auto_550253 ?auto_550254 ?auto_550255 ?auto_550256 ?auto_550257 ?auto_550258 ?auto_550259 )
      ( MAKE-14PILE ?auto_550251 ?auto_550252 ?auto_550253 ?auto_550254 ?auto_550255 ?auto_550256 ?auto_550257 ?auto_550258 ?auto_550259 ?auto_550260 ?auto_550261 ?auto_550262 ?auto_550263 ?auto_550264 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_550309 - BLOCK
      ?auto_550310 - BLOCK
      ?auto_550311 - BLOCK
      ?auto_550312 - BLOCK
      ?auto_550313 - BLOCK
      ?auto_550314 - BLOCK
      ?auto_550315 - BLOCK
      ?auto_550316 - BLOCK
      ?auto_550317 - BLOCK
      ?auto_550318 - BLOCK
      ?auto_550319 - BLOCK
      ?auto_550320 - BLOCK
      ?auto_550321 - BLOCK
      ?auto_550322 - BLOCK
    )
    :vars
    (
      ?auto_550323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_550322 ?auto_550323 ) ( ON-TABLE ?auto_550309 ) ( ON ?auto_550310 ?auto_550309 ) ( ON ?auto_550311 ?auto_550310 ) ( ON ?auto_550312 ?auto_550311 ) ( ON ?auto_550313 ?auto_550312 ) ( ON ?auto_550314 ?auto_550313 ) ( ON ?auto_550315 ?auto_550314 ) ( not ( = ?auto_550309 ?auto_550310 ) ) ( not ( = ?auto_550309 ?auto_550311 ) ) ( not ( = ?auto_550309 ?auto_550312 ) ) ( not ( = ?auto_550309 ?auto_550313 ) ) ( not ( = ?auto_550309 ?auto_550314 ) ) ( not ( = ?auto_550309 ?auto_550315 ) ) ( not ( = ?auto_550309 ?auto_550316 ) ) ( not ( = ?auto_550309 ?auto_550317 ) ) ( not ( = ?auto_550309 ?auto_550318 ) ) ( not ( = ?auto_550309 ?auto_550319 ) ) ( not ( = ?auto_550309 ?auto_550320 ) ) ( not ( = ?auto_550309 ?auto_550321 ) ) ( not ( = ?auto_550309 ?auto_550322 ) ) ( not ( = ?auto_550309 ?auto_550323 ) ) ( not ( = ?auto_550310 ?auto_550311 ) ) ( not ( = ?auto_550310 ?auto_550312 ) ) ( not ( = ?auto_550310 ?auto_550313 ) ) ( not ( = ?auto_550310 ?auto_550314 ) ) ( not ( = ?auto_550310 ?auto_550315 ) ) ( not ( = ?auto_550310 ?auto_550316 ) ) ( not ( = ?auto_550310 ?auto_550317 ) ) ( not ( = ?auto_550310 ?auto_550318 ) ) ( not ( = ?auto_550310 ?auto_550319 ) ) ( not ( = ?auto_550310 ?auto_550320 ) ) ( not ( = ?auto_550310 ?auto_550321 ) ) ( not ( = ?auto_550310 ?auto_550322 ) ) ( not ( = ?auto_550310 ?auto_550323 ) ) ( not ( = ?auto_550311 ?auto_550312 ) ) ( not ( = ?auto_550311 ?auto_550313 ) ) ( not ( = ?auto_550311 ?auto_550314 ) ) ( not ( = ?auto_550311 ?auto_550315 ) ) ( not ( = ?auto_550311 ?auto_550316 ) ) ( not ( = ?auto_550311 ?auto_550317 ) ) ( not ( = ?auto_550311 ?auto_550318 ) ) ( not ( = ?auto_550311 ?auto_550319 ) ) ( not ( = ?auto_550311 ?auto_550320 ) ) ( not ( = ?auto_550311 ?auto_550321 ) ) ( not ( = ?auto_550311 ?auto_550322 ) ) ( not ( = ?auto_550311 ?auto_550323 ) ) ( not ( = ?auto_550312 ?auto_550313 ) ) ( not ( = ?auto_550312 ?auto_550314 ) ) ( not ( = ?auto_550312 ?auto_550315 ) ) ( not ( = ?auto_550312 ?auto_550316 ) ) ( not ( = ?auto_550312 ?auto_550317 ) ) ( not ( = ?auto_550312 ?auto_550318 ) ) ( not ( = ?auto_550312 ?auto_550319 ) ) ( not ( = ?auto_550312 ?auto_550320 ) ) ( not ( = ?auto_550312 ?auto_550321 ) ) ( not ( = ?auto_550312 ?auto_550322 ) ) ( not ( = ?auto_550312 ?auto_550323 ) ) ( not ( = ?auto_550313 ?auto_550314 ) ) ( not ( = ?auto_550313 ?auto_550315 ) ) ( not ( = ?auto_550313 ?auto_550316 ) ) ( not ( = ?auto_550313 ?auto_550317 ) ) ( not ( = ?auto_550313 ?auto_550318 ) ) ( not ( = ?auto_550313 ?auto_550319 ) ) ( not ( = ?auto_550313 ?auto_550320 ) ) ( not ( = ?auto_550313 ?auto_550321 ) ) ( not ( = ?auto_550313 ?auto_550322 ) ) ( not ( = ?auto_550313 ?auto_550323 ) ) ( not ( = ?auto_550314 ?auto_550315 ) ) ( not ( = ?auto_550314 ?auto_550316 ) ) ( not ( = ?auto_550314 ?auto_550317 ) ) ( not ( = ?auto_550314 ?auto_550318 ) ) ( not ( = ?auto_550314 ?auto_550319 ) ) ( not ( = ?auto_550314 ?auto_550320 ) ) ( not ( = ?auto_550314 ?auto_550321 ) ) ( not ( = ?auto_550314 ?auto_550322 ) ) ( not ( = ?auto_550314 ?auto_550323 ) ) ( not ( = ?auto_550315 ?auto_550316 ) ) ( not ( = ?auto_550315 ?auto_550317 ) ) ( not ( = ?auto_550315 ?auto_550318 ) ) ( not ( = ?auto_550315 ?auto_550319 ) ) ( not ( = ?auto_550315 ?auto_550320 ) ) ( not ( = ?auto_550315 ?auto_550321 ) ) ( not ( = ?auto_550315 ?auto_550322 ) ) ( not ( = ?auto_550315 ?auto_550323 ) ) ( not ( = ?auto_550316 ?auto_550317 ) ) ( not ( = ?auto_550316 ?auto_550318 ) ) ( not ( = ?auto_550316 ?auto_550319 ) ) ( not ( = ?auto_550316 ?auto_550320 ) ) ( not ( = ?auto_550316 ?auto_550321 ) ) ( not ( = ?auto_550316 ?auto_550322 ) ) ( not ( = ?auto_550316 ?auto_550323 ) ) ( not ( = ?auto_550317 ?auto_550318 ) ) ( not ( = ?auto_550317 ?auto_550319 ) ) ( not ( = ?auto_550317 ?auto_550320 ) ) ( not ( = ?auto_550317 ?auto_550321 ) ) ( not ( = ?auto_550317 ?auto_550322 ) ) ( not ( = ?auto_550317 ?auto_550323 ) ) ( not ( = ?auto_550318 ?auto_550319 ) ) ( not ( = ?auto_550318 ?auto_550320 ) ) ( not ( = ?auto_550318 ?auto_550321 ) ) ( not ( = ?auto_550318 ?auto_550322 ) ) ( not ( = ?auto_550318 ?auto_550323 ) ) ( not ( = ?auto_550319 ?auto_550320 ) ) ( not ( = ?auto_550319 ?auto_550321 ) ) ( not ( = ?auto_550319 ?auto_550322 ) ) ( not ( = ?auto_550319 ?auto_550323 ) ) ( not ( = ?auto_550320 ?auto_550321 ) ) ( not ( = ?auto_550320 ?auto_550322 ) ) ( not ( = ?auto_550320 ?auto_550323 ) ) ( not ( = ?auto_550321 ?auto_550322 ) ) ( not ( = ?auto_550321 ?auto_550323 ) ) ( not ( = ?auto_550322 ?auto_550323 ) ) ( ON ?auto_550321 ?auto_550322 ) ( ON ?auto_550320 ?auto_550321 ) ( ON ?auto_550319 ?auto_550320 ) ( ON ?auto_550318 ?auto_550319 ) ( ON ?auto_550317 ?auto_550318 ) ( CLEAR ?auto_550315 ) ( ON ?auto_550316 ?auto_550317 ) ( CLEAR ?auto_550316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_550309 ?auto_550310 ?auto_550311 ?auto_550312 ?auto_550313 ?auto_550314 ?auto_550315 ?auto_550316 )
      ( MAKE-14PILE ?auto_550309 ?auto_550310 ?auto_550311 ?auto_550312 ?auto_550313 ?auto_550314 ?auto_550315 ?auto_550316 ?auto_550317 ?auto_550318 ?auto_550319 ?auto_550320 ?auto_550321 ?auto_550322 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_550367 - BLOCK
      ?auto_550368 - BLOCK
      ?auto_550369 - BLOCK
      ?auto_550370 - BLOCK
      ?auto_550371 - BLOCK
      ?auto_550372 - BLOCK
      ?auto_550373 - BLOCK
      ?auto_550374 - BLOCK
      ?auto_550375 - BLOCK
      ?auto_550376 - BLOCK
      ?auto_550377 - BLOCK
      ?auto_550378 - BLOCK
      ?auto_550379 - BLOCK
      ?auto_550380 - BLOCK
    )
    :vars
    (
      ?auto_550381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_550380 ?auto_550381 ) ( ON-TABLE ?auto_550367 ) ( ON ?auto_550368 ?auto_550367 ) ( ON ?auto_550369 ?auto_550368 ) ( ON ?auto_550370 ?auto_550369 ) ( ON ?auto_550371 ?auto_550370 ) ( ON ?auto_550372 ?auto_550371 ) ( not ( = ?auto_550367 ?auto_550368 ) ) ( not ( = ?auto_550367 ?auto_550369 ) ) ( not ( = ?auto_550367 ?auto_550370 ) ) ( not ( = ?auto_550367 ?auto_550371 ) ) ( not ( = ?auto_550367 ?auto_550372 ) ) ( not ( = ?auto_550367 ?auto_550373 ) ) ( not ( = ?auto_550367 ?auto_550374 ) ) ( not ( = ?auto_550367 ?auto_550375 ) ) ( not ( = ?auto_550367 ?auto_550376 ) ) ( not ( = ?auto_550367 ?auto_550377 ) ) ( not ( = ?auto_550367 ?auto_550378 ) ) ( not ( = ?auto_550367 ?auto_550379 ) ) ( not ( = ?auto_550367 ?auto_550380 ) ) ( not ( = ?auto_550367 ?auto_550381 ) ) ( not ( = ?auto_550368 ?auto_550369 ) ) ( not ( = ?auto_550368 ?auto_550370 ) ) ( not ( = ?auto_550368 ?auto_550371 ) ) ( not ( = ?auto_550368 ?auto_550372 ) ) ( not ( = ?auto_550368 ?auto_550373 ) ) ( not ( = ?auto_550368 ?auto_550374 ) ) ( not ( = ?auto_550368 ?auto_550375 ) ) ( not ( = ?auto_550368 ?auto_550376 ) ) ( not ( = ?auto_550368 ?auto_550377 ) ) ( not ( = ?auto_550368 ?auto_550378 ) ) ( not ( = ?auto_550368 ?auto_550379 ) ) ( not ( = ?auto_550368 ?auto_550380 ) ) ( not ( = ?auto_550368 ?auto_550381 ) ) ( not ( = ?auto_550369 ?auto_550370 ) ) ( not ( = ?auto_550369 ?auto_550371 ) ) ( not ( = ?auto_550369 ?auto_550372 ) ) ( not ( = ?auto_550369 ?auto_550373 ) ) ( not ( = ?auto_550369 ?auto_550374 ) ) ( not ( = ?auto_550369 ?auto_550375 ) ) ( not ( = ?auto_550369 ?auto_550376 ) ) ( not ( = ?auto_550369 ?auto_550377 ) ) ( not ( = ?auto_550369 ?auto_550378 ) ) ( not ( = ?auto_550369 ?auto_550379 ) ) ( not ( = ?auto_550369 ?auto_550380 ) ) ( not ( = ?auto_550369 ?auto_550381 ) ) ( not ( = ?auto_550370 ?auto_550371 ) ) ( not ( = ?auto_550370 ?auto_550372 ) ) ( not ( = ?auto_550370 ?auto_550373 ) ) ( not ( = ?auto_550370 ?auto_550374 ) ) ( not ( = ?auto_550370 ?auto_550375 ) ) ( not ( = ?auto_550370 ?auto_550376 ) ) ( not ( = ?auto_550370 ?auto_550377 ) ) ( not ( = ?auto_550370 ?auto_550378 ) ) ( not ( = ?auto_550370 ?auto_550379 ) ) ( not ( = ?auto_550370 ?auto_550380 ) ) ( not ( = ?auto_550370 ?auto_550381 ) ) ( not ( = ?auto_550371 ?auto_550372 ) ) ( not ( = ?auto_550371 ?auto_550373 ) ) ( not ( = ?auto_550371 ?auto_550374 ) ) ( not ( = ?auto_550371 ?auto_550375 ) ) ( not ( = ?auto_550371 ?auto_550376 ) ) ( not ( = ?auto_550371 ?auto_550377 ) ) ( not ( = ?auto_550371 ?auto_550378 ) ) ( not ( = ?auto_550371 ?auto_550379 ) ) ( not ( = ?auto_550371 ?auto_550380 ) ) ( not ( = ?auto_550371 ?auto_550381 ) ) ( not ( = ?auto_550372 ?auto_550373 ) ) ( not ( = ?auto_550372 ?auto_550374 ) ) ( not ( = ?auto_550372 ?auto_550375 ) ) ( not ( = ?auto_550372 ?auto_550376 ) ) ( not ( = ?auto_550372 ?auto_550377 ) ) ( not ( = ?auto_550372 ?auto_550378 ) ) ( not ( = ?auto_550372 ?auto_550379 ) ) ( not ( = ?auto_550372 ?auto_550380 ) ) ( not ( = ?auto_550372 ?auto_550381 ) ) ( not ( = ?auto_550373 ?auto_550374 ) ) ( not ( = ?auto_550373 ?auto_550375 ) ) ( not ( = ?auto_550373 ?auto_550376 ) ) ( not ( = ?auto_550373 ?auto_550377 ) ) ( not ( = ?auto_550373 ?auto_550378 ) ) ( not ( = ?auto_550373 ?auto_550379 ) ) ( not ( = ?auto_550373 ?auto_550380 ) ) ( not ( = ?auto_550373 ?auto_550381 ) ) ( not ( = ?auto_550374 ?auto_550375 ) ) ( not ( = ?auto_550374 ?auto_550376 ) ) ( not ( = ?auto_550374 ?auto_550377 ) ) ( not ( = ?auto_550374 ?auto_550378 ) ) ( not ( = ?auto_550374 ?auto_550379 ) ) ( not ( = ?auto_550374 ?auto_550380 ) ) ( not ( = ?auto_550374 ?auto_550381 ) ) ( not ( = ?auto_550375 ?auto_550376 ) ) ( not ( = ?auto_550375 ?auto_550377 ) ) ( not ( = ?auto_550375 ?auto_550378 ) ) ( not ( = ?auto_550375 ?auto_550379 ) ) ( not ( = ?auto_550375 ?auto_550380 ) ) ( not ( = ?auto_550375 ?auto_550381 ) ) ( not ( = ?auto_550376 ?auto_550377 ) ) ( not ( = ?auto_550376 ?auto_550378 ) ) ( not ( = ?auto_550376 ?auto_550379 ) ) ( not ( = ?auto_550376 ?auto_550380 ) ) ( not ( = ?auto_550376 ?auto_550381 ) ) ( not ( = ?auto_550377 ?auto_550378 ) ) ( not ( = ?auto_550377 ?auto_550379 ) ) ( not ( = ?auto_550377 ?auto_550380 ) ) ( not ( = ?auto_550377 ?auto_550381 ) ) ( not ( = ?auto_550378 ?auto_550379 ) ) ( not ( = ?auto_550378 ?auto_550380 ) ) ( not ( = ?auto_550378 ?auto_550381 ) ) ( not ( = ?auto_550379 ?auto_550380 ) ) ( not ( = ?auto_550379 ?auto_550381 ) ) ( not ( = ?auto_550380 ?auto_550381 ) ) ( ON ?auto_550379 ?auto_550380 ) ( ON ?auto_550378 ?auto_550379 ) ( ON ?auto_550377 ?auto_550378 ) ( ON ?auto_550376 ?auto_550377 ) ( ON ?auto_550375 ?auto_550376 ) ( ON ?auto_550374 ?auto_550375 ) ( CLEAR ?auto_550372 ) ( ON ?auto_550373 ?auto_550374 ) ( CLEAR ?auto_550373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_550367 ?auto_550368 ?auto_550369 ?auto_550370 ?auto_550371 ?auto_550372 ?auto_550373 )
      ( MAKE-14PILE ?auto_550367 ?auto_550368 ?auto_550369 ?auto_550370 ?auto_550371 ?auto_550372 ?auto_550373 ?auto_550374 ?auto_550375 ?auto_550376 ?auto_550377 ?auto_550378 ?auto_550379 ?auto_550380 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_550425 - BLOCK
      ?auto_550426 - BLOCK
      ?auto_550427 - BLOCK
      ?auto_550428 - BLOCK
      ?auto_550429 - BLOCK
      ?auto_550430 - BLOCK
      ?auto_550431 - BLOCK
      ?auto_550432 - BLOCK
      ?auto_550433 - BLOCK
      ?auto_550434 - BLOCK
      ?auto_550435 - BLOCK
      ?auto_550436 - BLOCK
      ?auto_550437 - BLOCK
      ?auto_550438 - BLOCK
    )
    :vars
    (
      ?auto_550439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_550438 ?auto_550439 ) ( ON-TABLE ?auto_550425 ) ( ON ?auto_550426 ?auto_550425 ) ( ON ?auto_550427 ?auto_550426 ) ( ON ?auto_550428 ?auto_550427 ) ( ON ?auto_550429 ?auto_550428 ) ( not ( = ?auto_550425 ?auto_550426 ) ) ( not ( = ?auto_550425 ?auto_550427 ) ) ( not ( = ?auto_550425 ?auto_550428 ) ) ( not ( = ?auto_550425 ?auto_550429 ) ) ( not ( = ?auto_550425 ?auto_550430 ) ) ( not ( = ?auto_550425 ?auto_550431 ) ) ( not ( = ?auto_550425 ?auto_550432 ) ) ( not ( = ?auto_550425 ?auto_550433 ) ) ( not ( = ?auto_550425 ?auto_550434 ) ) ( not ( = ?auto_550425 ?auto_550435 ) ) ( not ( = ?auto_550425 ?auto_550436 ) ) ( not ( = ?auto_550425 ?auto_550437 ) ) ( not ( = ?auto_550425 ?auto_550438 ) ) ( not ( = ?auto_550425 ?auto_550439 ) ) ( not ( = ?auto_550426 ?auto_550427 ) ) ( not ( = ?auto_550426 ?auto_550428 ) ) ( not ( = ?auto_550426 ?auto_550429 ) ) ( not ( = ?auto_550426 ?auto_550430 ) ) ( not ( = ?auto_550426 ?auto_550431 ) ) ( not ( = ?auto_550426 ?auto_550432 ) ) ( not ( = ?auto_550426 ?auto_550433 ) ) ( not ( = ?auto_550426 ?auto_550434 ) ) ( not ( = ?auto_550426 ?auto_550435 ) ) ( not ( = ?auto_550426 ?auto_550436 ) ) ( not ( = ?auto_550426 ?auto_550437 ) ) ( not ( = ?auto_550426 ?auto_550438 ) ) ( not ( = ?auto_550426 ?auto_550439 ) ) ( not ( = ?auto_550427 ?auto_550428 ) ) ( not ( = ?auto_550427 ?auto_550429 ) ) ( not ( = ?auto_550427 ?auto_550430 ) ) ( not ( = ?auto_550427 ?auto_550431 ) ) ( not ( = ?auto_550427 ?auto_550432 ) ) ( not ( = ?auto_550427 ?auto_550433 ) ) ( not ( = ?auto_550427 ?auto_550434 ) ) ( not ( = ?auto_550427 ?auto_550435 ) ) ( not ( = ?auto_550427 ?auto_550436 ) ) ( not ( = ?auto_550427 ?auto_550437 ) ) ( not ( = ?auto_550427 ?auto_550438 ) ) ( not ( = ?auto_550427 ?auto_550439 ) ) ( not ( = ?auto_550428 ?auto_550429 ) ) ( not ( = ?auto_550428 ?auto_550430 ) ) ( not ( = ?auto_550428 ?auto_550431 ) ) ( not ( = ?auto_550428 ?auto_550432 ) ) ( not ( = ?auto_550428 ?auto_550433 ) ) ( not ( = ?auto_550428 ?auto_550434 ) ) ( not ( = ?auto_550428 ?auto_550435 ) ) ( not ( = ?auto_550428 ?auto_550436 ) ) ( not ( = ?auto_550428 ?auto_550437 ) ) ( not ( = ?auto_550428 ?auto_550438 ) ) ( not ( = ?auto_550428 ?auto_550439 ) ) ( not ( = ?auto_550429 ?auto_550430 ) ) ( not ( = ?auto_550429 ?auto_550431 ) ) ( not ( = ?auto_550429 ?auto_550432 ) ) ( not ( = ?auto_550429 ?auto_550433 ) ) ( not ( = ?auto_550429 ?auto_550434 ) ) ( not ( = ?auto_550429 ?auto_550435 ) ) ( not ( = ?auto_550429 ?auto_550436 ) ) ( not ( = ?auto_550429 ?auto_550437 ) ) ( not ( = ?auto_550429 ?auto_550438 ) ) ( not ( = ?auto_550429 ?auto_550439 ) ) ( not ( = ?auto_550430 ?auto_550431 ) ) ( not ( = ?auto_550430 ?auto_550432 ) ) ( not ( = ?auto_550430 ?auto_550433 ) ) ( not ( = ?auto_550430 ?auto_550434 ) ) ( not ( = ?auto_550430 ?auto_550435 ) ) ( not ( = ?auto_550430 ?auto_550436 ) ) ( not ( = ?auto_550430 ?auto_550437 ) ) ( not ( = ?auto_550430 ?auto_550438 ) ) ( not ( = ?auto_550430 ?auto_550439 ) ) ( not ( = ?auto_550431 ?auto_550432 ) ) ( not ( = ?auto_550431 ?auto_550433 ) ) ( not ( = ?auto_550431 ?auto_550434 ) ) ( not ( = ?auto_550431 ?auto_550435 ) ) ( not ( = ?auto_550431 ?auto_550436 ) ) ( not ( = ?auto_550431 ?auto_550437 ) ) ( not ( = ?auto_550431 ?auto_550438 ) ) ( not ( = ?auto_550431 ?auto_550439 ) ) ( not ( = ?auto_550432 ?auto_550433 ) ) ( not ( = ?auto_550432 ?auto_550434 ) ) ( not ( = ?auto_550432 ?auto_550435 ) ) ( not ( = ?auto_550432 ?auto_550436 ) ) ( not ( = ?auto_550432 ?auto_550437 ) ) ( not ( = ?auto_550432 ?auto_550438 ) ) ( not ( = ?auto_550432 ?auto_550439 ) ) ( not ( = ?auto_550433 ?auto_550434 ) ) ( not ( = ?auto_550433 ?auto_550435 ) ) ( not ( = ?auto_550433 ?auto_550436 ) ) ( not ( = ?auto_550433 ?auto_550437 ) ) ( not ( = ?auto_550433 ?auto_550438 ) ) ( not ( = ?auto_550433 ?auto_550439 ) ) ( not ( = ?auto_550434 ?auto_550435 ) ) ( not ( = ?auto_550434 ?auto_550436 ) ) ( not ( = ?auto_550434 ?auto_550437 ) ) ( not ( = ?auto_550434 ?auto_550438 ) ) ( not ( = ?auto_550434 ?auto_550439 ) ) ( not ( = ?auto_550435 ?auto_550436 ) ) ( not ( = ?auto_550435 ?auto_550437 ) ) ( not ( = ?auto_550435 ?auto_550438 ) ) ( not ( = ?auto_550435 ?auto_550439 ) ) ( not ( = ?auto_550436 ?auto_550437 ) ) ( not ( = ?auto_550436 ?auto_550438 ) ) ( not ( = ?auto_550436 ?auto_550439 ) ) ( not ( = ?auto_550437 ?auto_550438 ) ) ( not ( = ?auto_550437 ?auto_550439 ) ) ( not ( = ?auto_550438 ?auto_550439 ) ) ( ON ?auto_550437 ?auto_550438 ) ( ON ?auto_550436 ?auto_550437 ) ( ON ?auto_550435 ?auto_550436 ) ( ON ?auto_550434 ?auto_550435 ) ( ON ?auto_550433 ?auto_550434 ) ( ON ?auto_550432 ?auto_550433 ) ( ON ?auto_550431 ?auto_550432 ) ( CLEAR ?auto_550429 ) ( ON ?auto_550430 ?auto_550431 ) ( CLEAR ?auto_550430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_550425 ?auto_550426 ?auto_550427 ?auto_550428 ?auto_550429 ?auto_550430 )
      ( MAKE-14PILE ?auto_550425 ?auto_550426 ?auto_550427 ?auto_550428 ?auto_550429 ?auto_550430 ?auto_550431 ?auto_550432 ?auto_550433 ?auto_550434 ?auto_550435 ?auto_550436 ?auto_550437 ?auto_550438 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_550483 - BLOCK
      ?auto_550484 - BLOCK
      ?auto_550485 - BLOCK
      ?auto_550486 - BLOCK
      ?auto_550487 - BLOCK
      ?auto_550488 - BLOCK
      ?auto_550489 - BLOCK
      ?auto_550490 - BLOCK
      ?auto_550491 - BLOCK
      ?auto_550492 - BLOCK
      ?auto_550493 - BLOCK
      ?auto_550494 - BLOCK
      ?auto_550495 - BLOCK
      ?auto_550496 - BLOCK
    )
    :vars
    (
      ?auto_550497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_550496 ?auto_550497 ) ( ON-TABLE ?auto_550483 ) ( ON ?auto_550484 ?auto_550483 ) ( ON ?auto_550485 ?auto_550484 ) ( ON ?auto_550486 ?auto_550485 ) ( not ( = ?auto_550483 ?auto_550484 ) ) ( not ( = ?auto_550483 ?auto_550485 ) ) ( not ( = ?auto_550483 ?auto_550486 ) ) ( not ( = ?auto_550483 ?auto_550487 ) ) ( not ( = ?auto_550483 ?auto_550488 ) ) ( not ( = ?auto_550483 ?auto_550489 ) ) ( not ( = ?auto_550483 ?auto_550490 ) ) ( not ( = ?auto_550483 ?auto_550491 ) ) ( not ( = ?auto_550483 ?auto_550492 ) ) ( not ( = ?auto_550483 ?auto_550493 ) ) ( not ( = ?auto_550483 ?auto_550494 ) ) ( not ( = ?auto_550483 ?auto_550495 ) ) ( not ( = ?auto_550483 ?auto_550496 ) ) ( not ( = ?auto_550483 ?auto_550497 ) ) ( not ( = ?auto_550484 ?auto_550485 ) ) ( not ( = ?auto_550484 ?auto_550486 ) ) ( not ( = ?auto_550484 ?auto_550487 ) ) ( not ( = ?auto_550484 ?auto_550488 ) ) ( not ( = ?auto_550484 ?auto_550489 ) ) ( not ( = ?auto_550484 ?auto_550490 ) ) ( not ( = ?auto_550484 ?auto_550491 ) ) ( not ( = ?auto_550484 ?auto_550492 ) ) ( not ( = ?auto_550484 ?auto_550493 ) ) ( not ( = ?auto_550484 ?auto_550494 ) ) ( not ( = ?auto_550484 ?auto_550495 ) ) ( not ( = ?auto_550484 ?auto_550496 ) ) ( not ( = ?auto_550484 ?auto_550497 ) ) ( not ( = ?auto_550485 ?auto_550486 ) ) ( not ( = ?auto_550485 ?auto_550487 ) ) ( not ( = ?auto_550485 ?auto_550488 ) ) ( not ( = ?auto_550485 ?auto_550489 ) ) ( not ( = ?auto_550485 ?auto_550490 ) ) ( not ( = ?auto_550485 ?auto_550491 ) ) ( not ( = ?auto_550485 ?auto_550492 ) ) ( not ( = ?auto_550485 ?auto_550493 ) ) ( not ( = ?auto_550485 ?auto_550494 ) ) ( not ( = ?auto_550485 ?auto_550495 ) ) ( not ( = ?auto_550485 ?auto_550496 ) ) ( not ( = ?auto_550485 ?auto_550497 ) ) ( not ( = ?auto_550486 ?auto_550487 ) ) ( not ( = ?auto_550486 ?auto_550488 ) ) ( not ( = ?auto_550486 ?auto_550489 ) ) ( not ( = ?auto_550486 ?auto_550490 ) ) ( not ( = ?auto_550486 ?auto_550491 ) ) ( not ( = ?auto_550486 ?auto_550492 ) ) ( not ( = ?auto_550486 ?auto_550493 ) ) ( not ( = ?auto_550486 ?auto_550494 ) ) ( not ( = ?auto_550486 ?auto_550495 ) ) ( not ( = ?auto_550486 ?auto_550496 ) ) ( not ( = ?auto_550486 ?auto_550497 ) ) ( not ( = ?auto_550487 ?auto_550488 ) ) ( not ( = ?auto_550487 ?auto_550489 ) ) ( not ( = ?auto_550487 ?auto_550490 ) ) ( not ( = ?auto_550487 ?auto_550491 ) ) ( not ( = ?auto_550487 ?auto_550492 ) ) ( not ( = ?auto_550487 ?auto_550493 ) ) ( not ( = ?auto_550487 ?auto_550494 ) ) ( not ( = ?auto_550487 ?auto_550495 ) ) ( not ( = ?auto_550487 ?auto_550496 ) ) ( not ( = ?auto_550487 ?auto_550497 ) ) ( not ( = ?auto_550488 ?auto_550489 ) ) ( not ( = ?auto_550488 ?auto_550490 ) ) ( not ( = ?auto_550488 ?auto_550491 ) ) ( not ( = ?auto_550488 ?auto_550492 ) ) ( not ( = ?auto_550488 ?auto_550493 ) ) ( not ( = ?auto_550488 ?auto_550494 ) ) ( not ( = ?auto_550488 ?auto_550495 ) ) ( not ( = ?auto_550488 ?auto_550496 ) ) ( not ( = ?auto_550488 ?auto_550497 ) ) ( not ( = ?auto_550489 ?auto_550490 ) ) ( not ( = ?auto_550489 ?auto_550491 ) ) ( not ( = ?auto_550489 ?auto_550492 ) ) ( not ( = ?auto_550489 ?auto_550493 ) ) ( not ( = ?auto_550489 ?auto_550494 ) ) ( not ( = ?auto_550489 ?auto_550495 ) ) ( not ( = ?auto_550489 ?auto_550496 ) ) ( not ( = ?auto_550489 ?auto_550497 ) ) ( not ( = ?auto_550490 ?auto_550491 ) ) ( not ( = ?auto_550490 ?auto_550492 ) ) ( not ( = ?auto_550490 ?auto_550493 ) ) ( not ( = ?auto_550490 ?auto_550494 ) ) ( not ( = ?auto_550490 ?auto_550495 ) ) ( not ( = ?auto_550490 ?auto_550496 ) ) ( not ( = ?auto_550490 ?auto_550497 ) ) ( not ( = ?auto_550491 ?auto_550492 ) ) ( not ( = ?auto_550491 ?auto_550493 ) ) ( not ( = ?auto_550491 ?auto_550494 ) ) ( not ( = ?auto_550491 ?auto_550495 ) ) ( not ( = ?auto_550491 ?auto_550496 ) ) ( not ( = ?auto_550491 ?auto_550497 ) ) ( not ( = ?auto_550492 ?auto_550493 ) ) ( not ( = ?auto_550492 ?auto_550494 ) ) ( not ( = ?auto_550492 ?auto_550495 ) ) ( not ( = ?auto_550492 ?auto_550496 ) ) ( not ( = ?auto_550492 ?auto_550497 ) ) ( not ( = ?auto_550493 ?auto_550494 ) ) ( not ( = ?auto_550493 ?auto_550495 ) ) ( not ( = ?auto_550493 ?auto_550496 ) ) ( not ( = ?auto_550493 ?auto_550497 ) ) ( not ( = ?auto_550494 ?auto_550495 ) ) ( not ( = ?auto_550494 ?auto_550496 ) ) ( not ( = ?auto_550494 ?auto_550497 ) ) ( not ( = ?auto_550495 ?auto_550496 ) ) ( not ( = ?auto_550495 ?auto_550497 ) ) ( not ( = ?auto_550496 ?auto_550497 ) ) ( ON ?auto_550495 ?auto_550496 ) ( ON ?auto_550494 ?auto_550495 ) ( ON ?auto_550493 ?auto_550494 ) ( ON ?auto_550492 ?auto_550493 ) ( ON ?auto_550491 ?auto_550492 ) ( ON ?auto_550490 ?auto_550491 ) ( ON ?auto_550489 ?auto_550490 ) ( ON ?auto_550488 ?auto_550489 ) ( CLEAR ?auto_550486 ) ( ON ?auto_550487 ?auto_550488 ) ( CLEAR ?auto_550487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_550483 ?auto_550484 ?auto_550485 ?auto_550486 ?auto_550487 )
      ( MAKE-14PILE ?auto_550483 ?auto_550484 ?auto_550485 ?auto_550486 ?auto_550487 ?auto_550488 ?auto_550489 ?auto_550490 ?auto_550491 ?auto_550492 ?auto_550493 ?auto_550494 ?auto_550495 ?auto_550496 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_550541 - BLOCK
      ?auto_550542 - BLOCK
      ?auto_550543 - BLOCK
      ?auto_550544 - BLOCK
      ?auto_550545 - BLOCK
      ?auto_550546 - BLOCK
      ?auto_550547 - BLOCK
      ?auto_550548 - BLOCK
      ?auto_550549 - BLOCK
      ?auto_550550 - BLOCK
      ?auto_550551 - BLOCK
      ?auto_550552 - BLOCK
      ?auto_550553 - BLOCK
      ?auto_550554 - BLOCK
    )
    :vars
    (
      ?auto_550555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_550554 ?auto_550555 ) ( ON-TABLE ?auto_550541 ) ( ON ?auto_550542 ?auto_550541 ) ( ON ?auto_550543 ?auto_550542 ) ( not ( = ?auto_550541 ?auto_550542 ) ) ( not ( = ?auto_550541 ?auto_550543 ) ) ( not ( = ?auto_550541 ?auto_550544 ) ) ( not ( = ?auto_550541 ?auto_550545 ) ) ( not ( = ?auto_550541 ?auto_550546 ) ) ( not ( = ?auto_550541 ?auto_550547 ) ) ( not ( = ?auto_550541 ?auto_550548 ) ) ( not ( = ?auto_550541 ?auto_550549 ) ) ( not ( = ?auto_550541 ?auto_550550 ) ) ( not ( = ?auto_550541 ?auto_550551 ) ) ( not ( = ?auto_550541 ?auto_550552 ) ) ( not ( = ?auto_550541 ?auto_550553 ) ) ( not ( = ?auto_550541 ?auto_550554 ) ) ( not ( = ?auto_550541 ?auto_550555 ) ) ( not ( = ?auto_550542 ?auto_550543 ) ) ( not ( = ?auto_550542 ?auto_550544 ) ) ( not ( = ?auto_550542 ?auto_550545 ) ) ( not ( = ?auto_550542 ?auto_550546 ) ) ( not ( = ?auto_550542 ?auto_550547 ) ) ( not ( = ?auto_550542 ?auto_550548 ) ) ( not ( = ?auto_550542 ?auto_550549 ) ) ( not ( = ?auto_550542 ?auto_550550 ) ) ( not ( = ?auto_550542 ?auto_550551 ) ) ( not ( = ?auto_550542 ?auto_550552 ) ) ( not ( = ?auto_550542 ?auto_550553 ) ) ( not ( = ?auto_550542 ?auto_550554 ) ) ( not ( = ?auto_550542 ?auto_550555 ) ) ( not ( = ?auto_550543 ?auto_550544 ) ) ( not ( = ?auto_550543 ?auto_550545 ) ) ( not ( = ?auto_550543 ?auto_550546 ) ) ( not ( = ?auto_550543 ?auto_550547 ) ) ( not ( = ?auto_550543 ?auto_550548 ) ) ( not ( = ?auto_550543 ?auto_550549 ) ) ( not ( = ?auto_550543 ?auto_550550 ) ) ( not ( = ?auto_550543 ?auto_550551 ) ) ( not ( = ?auto_550543 ?auto_550552 ) ) ( not ( = ?auto_550543 ?auto_550553 ) ) ( not ( = ?auto_550543 ?auto_550554 ) ) ( not ( = ?auto_550543 ?auto_550555 ) ) ( not ( = ?auto_550544 ?auto_550545 ) ) ( not ( = ?auto_550544 ?auto_550546 ) ) ( not ( = ?auto_550544 ?auto_550547 ) ) ( not ( = ?auto_550544 ?auto_550548 ) ) ( not ( = ?auto_550544 ?auto_550549 ) ) ( not ( = ?auto_550544 ?auto_550550 ) ) ( not ( = ?auto_550544 ?auto_550551 ) ) ( not ( = ?auto_550544 ?auto_550552 ) ) ( not ( = ?auto_550544 ?auto_550553 ) ) ( not ( = ?auto_550544 ?auto_550554 ) ) ( not ( = ?auto_550544 ?auto_550555 ) ) ( not ( = ?auto_550545 ?auto_550546 ) ) ( not ( = ?auto_550545 ?auto_550547 ) ) ( not ( = ?auto_550545 ?auto_550548 ) ) ( not ( = ?auto_550545 ?auto_550549 ) ) ( not ( = ?auto_550545 ?auto_550550 ) ) ( not ( = ?auto_550545 ?auto_550551 ) ) ( not ( = ?auto_550545 ?auto_550552 ) ) ( not ( = ?auto_550545 ?auto_550553 ) ) ( not ( = ?auto_550545 ?auto_550554 ) ) ( not ( = ?auto_550545 ?auto_550555 ) ) ( not ( = ?auto_550546 ?auto_550547 ) ) ( not ( = ?auto_550546 ?auto_550548 ) ) ( not ( = ?auto_550546 ?auto_550549 ) ) ( not ( = ?auto_550546 ?auto_550550 ) ) ( not ( = ?auto_550546 ?auto_550551 ) ) ( not ( = ?auto_550546 ?auto_550552 ) ) ( not ( = ?auto_550546 ?auto_550553 ) ) ( not ( = ?auto_550546 ?auto_550554 ) ) ( not ( = ?auto_550546 ?auto_550555 ) ) ( not ( = ?auto_550547 ?auto_550548 ) ) ( not ( = ?auto_550547 ?auto_550549 ) ) ( not ( = ?auto_550547 ?auto_550550 ) ) ( not ( = ?auto_550547 ?auto_550551 ) ) ( not ( = ?auto_550547 ?auto_550552 ) ) ( not ( = ?auto_550547 ?auto_550553 ) ) ( not ( = ?auto_550547 ?auto_550554 ) ) ( not ( = ?auto_550547 ?auto_550555 ) ) ( not ( = ?auto_550548 ?auto_550549 ) ) ( not ( = ?auto_550548 ?auto_550550 ) ) ( not ( = ?auto_550548 ?auto_550551 ) ) ( not ( = ?auto_550548 ?auto_550552 ) ) ( not ( = ?auto_550548 ?auto_550553 ) ) ( not ( = ?auto_550548 ?auto_550554 ) ) ( not ( = ?auto_550548 ?auto_550555 ) ) ( not ( = ?auto_550549 ?auto_550550 ) ) ( not ( = ?auto_550549 ?auto_550551 ) ) ( not ( = ?auto_550549 ?auto_550552 ) ) ( not ( = ?auto_550549 ?auto_550553 ) ) ( not ( = ?auto_550549 ?auto_550554 ) ) ( not ( = ?auto_550549 ?auto_550555 ) ) ( not ( = ?auto_550550 ?auto_550551 ) ) ( not ( = ?auto_550550 ?auto_550552 ) ) ( not ( = ?auto_550550 ?auto_550553 ) ) ( not ( = ?auto_550550 ?auto_550554 ) ) ( not ( = ?auto_550550 ?auto_550555 ) ) ( not ( = ?auto_550551 ?auto_550552 ) ) ( not ( = ?auto_550551 ?auto_550553 ) ) ( not ( = ?auto_550551 ?auto_550554 ) ) ( not ( = ?auto_550551 ?auto_550555 ) ) ( not ( = ?auto_550552 ?auto_550553 ) ) ( not ( = ?auto_550552 ?auto_550554 ) ) ( not ( = ?auto_550552 ?auto_550555 ) ) ( not ( = ?auto_550553 ?auto_550554 ) ) ( not ( = ?auto_550553 ?auto_550555 ) ) ( not ( = ?auto_550554 ?auto_550555 ) ) ( ON ?auto_550553 ?auto_550554 ) ( ON ?auto_550552 ?auto_550553 ) ( ON ?auto_550551 ?auto_550552 ) ( ON ?auto_550550 ?auto_550551 ) ( ON ?auto_550549 ?auto_550550 ) ( ON ?auto_550548 ?auto_550549 ) ( ON ?auto_550547 ?auto_550548 ) ( ON ?auto_550546 ?auto_550547 ) ( ON ?auto_550545 ?auto_550546 ) ( CLEAR ?auto_550543 ) ( ON ?auto_550544 ?auto_550545 ) ( CLEAR ?auto_550544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_550541 ?auto_550542 ?auto_550543 ?auto_550544 )
      ( MAKE-14PILE ?auto_550541 ?auto_550542 ?auto_550543 ?auto_550544 ?auto_550545 ?auto_550546 ?auto_550547 ?auto_550548 ?auto_550549 ?auto_550550 ?auto_550551 ?auto_550552 ?auto_550553 ?auto_550554 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_550599 - BLOCK
      ?auto_550600 - BLOCK
      ?auto_550601 - BLOCK
      ?auto_550602 - BLOCK
      ?auto_550603 - BLOCK
      ?auto_550604 - BLOCK
      ?auto_550605 - BLOCK
      ?auto_550606 - BLOCK
      ?auto_550607 - BLOCK
      ?auto_550608 - BLOCK
      ?auto_550609 - BLOCK
      ?auto_550610 - BLOCK
      ?auto_550611 - BLOCK
      ?auto_550612 - BLOCK
    )
    :vars
    (
      ?auto_550613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_550612 ?auto_550613 ) ( ON-TABLE ?auto_550599 ) ( ON ?auto_550600 ?auto_550599 ) ( not ( = ?auto_550599 ?auto_550600 ) ) ( not ( = ?auto_550599 ?auto_550601 ) ) ( not ( = ?auto_550599 ?auto_550602 ) ) ( not ( = ?auto_550599 ?auto_550603 ) ) ( not ( = ?auto_550599 ?auto_550604 ) ) ( not ( = ?auto_550599 ?auto_550605 ) ) ( not ( = ?auto_550599 ?auto_550606 ) ) ( not ( = ?auto_550599 ?auto_550607 ) ) ( not ( = ?auto_550599 ?auto_550608 ) ) ( not ( = ?auto_550599 ?auto_550609 ) ) ( not ( = ?auto_550599 ?auto_550610 ) ) ( not ( = ?auto_550599 ?auto_550611 ) ) ( not ( = ?auto_550599 ?auto_550612 ) ) ( not ( = ?auto_550599 ?auto_550613 ) ) ( not ( = ?auto_550600 ?auto_550601 ) ) ( not ( = ?auto_550600 ?auto_550602 ) ) ( not ( = ?auto_550600 ?auto_550603 ) ) ( not ( = ?auto_550600 ?auto_550604 ) ) ( not ( = ?auto_550600 ?auto_550605 ) ) ( not ( = ?auto_550600 ?auto_550606 ) ) ( not ( = ?auto_550600 ?auto_550607 ) ) ( not ( = ?auto_550600 ?auto_550608 ) ) ( not ( = ?auto_550600 ?auto_550609 ) ) ( not ( = ?auto_550600 ?auto_550610 ) ) ( not ( = ?auto_550600 ?auto_550611 ) ) ( not ( = ?auto_550600 ?auto_550612 ) ) ( not ( = ?auto_550600 ?auto_550613 ) ) ( not ( = ?auto_550601 ?auto_550602 ) ) ( not ( = ?auto_550601 ?auto_550603 ) ) ( not ( = ?auto_550601 ?auto_550604 ) ) ( not ( = ?auto_550601 ?auto_550605 ) ) ( not ( = ?auto_550601 ?auto_550606 ) ) ( not ( = ?auto_550601 ?auto_550607 ) ) ( not ( = ?auto_550601 ?auto_550608 ) ) ( not ( = ?auto_550601 ?auto_550609 ) ) ( not ( = ?auto_550601 ?auto_550610 ) ) ( not ( = ?auto_550601 ?auto_550611 ) ) ( not ( = ?auto_550601 ?auto_550612 ) ) ( not ( = ?auto_550601 ?auto_550613 ) ) ( not ( = ?auto_550602 ?auto_550603 ) ) ( not ( = ?auto_550602 ?auto_550604 ) ) ( not ( = ?auto_550602 ?auto_550605 ) ) ( not ( = ?auto_550602 ?auto_550606 ) ) ( not ( = ?auto_550602 ?auto_550607 ) ) ( not ( = ?auto_550602 ?auto_550608 ) ) ( not ( = ?auto_550602 ?auto_550609 ) ) ( not ( = ?auto_550602 ?auto_550610 ) ) ( not ( = ?auto_550602 ?auto_550611 ) ) ( not ( = ?auto_550602 ?auto_550612 ) ) ( not ( = ?auto_550602 ?auto_550613 ) ) ( not ( = ?auto_550603 ?auto_550604 ) ) ( not ( = ?auto_550603 ?auto_550605 ) ) ( not ( = ?auto_550603 ?auto_550606 ) ) ( not ( = ?auto_550603 ?auto_550607 ) ) ( not ( = ?auto_550603 ?auto_550608 ) ) ( not ( = ?auto_550603 ?auto_550609 ) ) ( not ( = ?auto_550603 ?auto_550610 ) ) ( not ( = ?auto_550603 ?auto_550611 ) ) ( not ( = ?auto_550603 ?auto_550612 ) ) ( not ( = ?auto_550603 ?auto_550613 ) ) ( not ( = ?auto_550604 ?auto_550605 ) ) ( not ( = ?auto_550604 ?auto_550606 ) ) ( not ( = ?auto_550604 ?auto_550607 ) ) ( not ( = ?auto_550604 ?auto_550608 ) ) ( not ( = ?auto_550604 ?auto_550609 ) ) ( not ( = ?auto_550604 ?auto_550610 ) ) ( not ( = ?auto_550604 ?auto_550611 ) ) ( not ( = ?auto_550604 ?auto_550612 ) ) ( not ( = ?auto_550604 ?auto_550613 ) ) ( not ( = ?auto_550605 ?auto_550606 ) ) ( not ( = ?auto_550605 ?auto_550607 ) ) ( not ( = ?auto_550605 ?auto_550608 ) ) ( not ( = ?auto_550605 ?auto_550609 ) ) ( not ( = ?auto_550605 ?auto_550610 ) ) ( not ( = ?auto_550605 ?auto_550611 ) ) ( not ( = ?auto_550605 ?auto_550612 ) ) ( not ( = ?auto_550605 ?auto_550613 ) ) ( not ( = ?auto_550606 ?auto_550607 ) ) ( not ( = ?auto_550606 ?auto_550608 ) ) ( not ( = ?auto_550606 ?auto_550609 ) ) ( not ( = ?auto_550606 ?auto_550610 ) ) ( not ( = ?auto_550606 ?auto_550611 ) ) ( not ( = ?auto_550606 ?auto_550612 ) ) ( not ( = ?auto_550606 ?auto_550613 ) ) ( not ( = ?auto_550607 ?auto_550608 ) ) ( not ( = ?auto_550607 ?auto_550609 ) ) ( not ( = ?auto_550607 ?auto_550610 ) ) ( not ( = ?auto_550607 ?auto_550611 ) ) ( not ( = ?auto_550607 ?auto_550612 ) ) ( not ( = ?auto_550607 ?auto_550613 ) ) ( not ( = ?auto_550608 ?auto_550609 ) ) ( not ( = ?auto_550608 ?auto_550610 ) ) ( not ( = ?auto_550608 ?auto_550611 ) ) ( not ( = ?auto_550608 ?auto_550612 ) ) ( not ( = ?auto_550608 ?auto_550613 ) ) ( not ( = ?auto_550609 ?auto_550610 ) ) ( not ( = ?auto_550609 ?auto_550611 ) ) ( not ( = ?auto_550609 ?auto_550612 ) ) ( not ( = ?auto_550609 ?auto_550613 ) ) ( not ( = ?auto_550610 ?auto_550611 ) ) ( not ( = ?auto_550610 ?auto_550612 ) ) ( not ( = ?auto_550610 ?auto_550613 ) ) ( not ( = ?auto_550611 ?auto_550612 ) ) ( not ( = ?auto_550611 ?auto_550613 ) ) ( not ( = ?auto_550612 ?auto_550613 ) ) ( ON ?auto_550611 ?auto_550612 ) ( ON ?auto_550610 ?auto_550611 ) ( ON ?auto_550609 ?auto_550610 ) ( ON ?auto_550608 ?auto_550609 ) ( ON ?auto_550607 ?auto_550608 ) ( ON ?auto_550606 ?auto_550607 ) ( ON ?auto_550605 ?auto_550606 ) ( ON ?auto_550604 ?auto_550605 ) ( ON ?auto_550603 ?auto_550604 ) ( ON ?auto_550602 ?auto_550603 ) ( CLEAR ?auto_550600 ) ( ON ?auto_550601 ?auto_550602 ) ( CLEAR ?auto_550601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_550599 ?auto_550600 ?auto_550601 )
      ( MAKE-14PILE ?auto_550599 ?auto_550600 ?auto_550601 ?auto_550602 ?auto_550603 ?auto_550604 ?auto_550605 ?auto_550606 ?auto_550607 ?auto_550608 ?auto_550609 ?auto_550610 ?auto_550611 ?auto_550612 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_550657 - BLOCK
      ?auto_550658 - BLOCK
      ?auto_550659 - BLOCK
      ?auto_550660 - BLOCK
      ?auto_550661 - BLOCK
      ?auto_550662 - BLOCK
      ?auto_550663 - BLOCK
      ?auto_550664 - BLOCK
      ?auto_550665 - BLOCK
      ?auto_550666 - BLOCK
      ?auto_550667 - BLOCK
      ?auto_550668 - BLOCK
      ?auto_550669 - BLOCK
      ?auto_550670 - BLOCK
    )
    :vars
    (
      ?auto_550671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_550670 ?auto_550671 ) ( ON-TABLE ?auto_550657 ) ( not ( = ?auto_550657 ?auto_550658 ) ) ( not ( = ?auto_550657 ?auto_550659 ) ) ( not ( = ?auto_550657 ?auto_550660 ) ) ( not ( = ?auto_550657 ?auto_550661 ) ) ( not ( = ?auto_550657 ?auto_550662 ) ) ( not ( = ?auto_550657 ?auto_550663 ) ) ( not ( = ?auto_550657 ?auto_550664 ) ) ( not ( = ?auto_550657 ?auto_550665 ) ) ( not ( = ?auto_550657 ?auto_550666 ) ) ( not ( = ?auto_550657 ?auto_550667 ) ) ( not ( = ?auto_550657 ?auto_550668 ) ) ( not ( = ?auto_550657 ?auto_550669 ) ) ( not ( = ?auto_550657 ?auto_550670 ) ) ( not ( = ?auto_550657 ?auto_550671 ) ) ( not ( = ?auto_550658 ?auto_550659 ) ) ( not ( = ?auto_550658 ?auto_550660 ) ) ( not ( = ?auto_550658 ?auto_550661 ) ) ( not ( = ?auto_550658 ?auto_550662 ) ) ( not ( = ?auto_550658 ?auto_550663 ) ) ( not ( = ?auto_550658 ?auto_550664 ) ) ( not ( = ?auto_550658 ?auto_550665 ) ) ( not ( = ?auto_550658 ?auto_550666 ) ) ( not ( = ?auto_550658 ?auto_550667 ) ) ( not ( = ?auto_550658 ?auto_550668 ) ) ( not ( = ?auto_550658 ?auto_550669 ) ) ( not ( = ?auto_550658 ?auto_550670 ) ) ( not ( = ?auto_550658 ?auto_550671 ) ) ( not ( = ?auto_550659 ?auto_550660 ) ) ( not ( = ?auto_550659 ?auto_550661 ) ) ( not ( = ?auto_550659 ?auto_550662 ) ) ( not ( = ?auto_550659 ?auto_550663 ) ) ( not ( = ?auto_550659 ?auto_550664 ) ) ( not ( = ?auto_550659 ?auto_550665 ) ) ( not ( = ?auto_550659 ?auto_550666 ) ) ( not ( = ?auto_550659 ?auto_550667 ) ) ( not ( = ?auto_550659 ?auto_550668 ) ) ( not ( = ?auto_550659 ?auto_550669 ) ) ( not ( = ?auto_550659 ?auto_550670 ) ) ( not ( = ?auto_550659 ?auto_550671 ) ) ( not ( = ?auto_550660 ?auto_550661 ) ) ( not ( = ?auto_550660 ?auto_550662 ) ) ( not ( = ?auto_550660 ?auto_550663 ) ) ( not ( = ?auto_550660 ?auto_550664 ) ) ( not ( = ?auto_550660 ?auto_550665 ) ) ( not ( = ?auto_550660 ?auto_550666 ) ) ( not ( = ?auto_550660 ?auto_550667 ) ) ( not ( = ?auto_550660 ?auto_550668 ) ) ( not ( = ?auto_550660 ?auto_550669 ) ) ( not ( = ?auto_550660 ?auto_550670 ) ) ( not ( = ?auto_550660 ?auto_550671 ) ) ( not ( = ?auto_550661 ?auto_550662 ) ) ( not ( = ?auto_550661 ?auto_550663 ) ) ( not ( = ?auto_550661 ?auto_550664 ) ) ( not ( = ?auto_550661 ?auto_550665 ) ) ( not ( = ?auto_550661 ?auto_550666 ) ) ( not ( = ?auto_550661 ?auto_550667 ) ) ( not ( = ?auto_550661 ?auto_550668 ) ) ( not ( = ?auto_550661 ?auto_550669 ) ) ( not ( = ?auto_550661 ?auto_550670 ) ) ( not ( = ?auto_550661 ?auto_550671 ) ) ( not ( = ?auto_550662 ?auto_550663 ) ) ( not ( = ?auto_550662 ?auto_550664 ) ) ( not ( = ?auto_550662 ?auto_550665 ) ) ( not ( = ?auto_550662 ?auto_550666 ) ) ( not ( = ?auto_550662 ?auto_550667 ) ) ( not ( = ?auto_550662 ?auto_550668 ) ) ( not ( = ?auto_550662 ?auto_550669 ) ) ( not ( = ?auto_550662 ?auto_550670 ) ) ( not ( = ?auto_550662 ?auto_550671 ) ) ( not ( = ?auto_550663 ?auto_550664 ) ) ( not ( = ?auto_550663 ?auto_550665 ) ) ( not ( = ?auto_550663 ?auto_550666 ) ) ( not ( = ?auto_550663 ?auto_550667 ) ) ( not ( = ?auto_550663 ?auto_550668 ) ) ( not ( = ?auto_550663 ?auto_550669 ) ) ( not ( = ?auto_550663 ?auto_550670 ) ) ( not ( = ?auto_550663 ?auto_550671 ) ) ( not ( = ?auto_550664 ?auto_550665 ) ) ( not ( = ?auto_550664 ?auto_550666 ) ) ( not ( = ?auto_550664 ?auto_550667 ) ) ( not ( = ?auto_550664 ?auto_550668 ) ) ( not ( = ?auto_550664 ?auto_550669 ) ) ( not ( = ?auto_550664 ?auto_550670 ) ) ( not ( = ?auto_550664 ?auto_550671 ) ) ( not ( = ?auto_550665 ?auto_550666 ) ) ( not ( = ?auto_550665 ?auto_550667 ) ) ( not ( = ?auto_550665 ?auto_550668 ) ) ( not ( = ?auto_550665 ?auto_550669 ) ) ( not ( = ?auto_550665 ?auto_550670 ) ) ( not ( = ?auto_550665 ?auto_550671 ) ) ( not ( = ?auto_550666 ?auto_550667 ) ) ( not ( = ?auto_550666 ?auto_550668 ) ) ( not ( = ?auto_550666 ?auto_550669 ) ) ( not ( = ?auto_550666 ?auto_550670 ) ) ( not ( = ?auto_550666 ?auto_550671 ) ) ( not ( = ?auto_550667 ?auto_550668 ) ) ( not ( = ?auto_550667 ?auto_550669 ) ) ( not ( = ?auto_550667 ?auto_550670 ) ) ( not ( = ?auto_550667 ?auto_550671 ) ) ( not ( = ?auto_550668 ?auto_550669 ) ) ( not ( = ?auto_550668 ?auto_550670 ) ) ( not ( = ?auto_550668 ?auto_550671 ) ) ( not ( = ?auto_550669 ?auto_550670 ) ) ( not ( = ?auto_550669 ?auto_550671 ) ) ( not ( = ?auto_550670 ?auto_550671 ) ) ( ON ?auto_550669 ?auto_550670 ) ( ON ?auto_550668 ?auto_550669 ) ( ON ?auto_550667 ?auto_550668 ) ( ON ?auto_550666 ?auto_550667 ) ( ON ?auto_550665 ?auto_550666 ) ( ON ?auto_550664 ?auto_550665 ) ( ON ?auto_550663 ?auto_550664 ) ( ON ?auto_550662 ?auto_550663 ) ( ON ?auto_550661 ?auto_550662 ) ( ON ?auto_550660 ?auto_550661 ) ( ON ?auto_550659 ?auto_550660 ) ( CLEAR ?auto_550657 ) ( ON ?auto_550658 ?auto_550659 ) ( CLEAR ?auto_550658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_550657 ?auto_550658 )
      ( MAKE-14PILE ?auto_550657 ?auto_550658 ?auto_550659 ?auto_550660 ?auto_550661 ?auto_550662 ?auto_550663 ?auto_550664 ?auto_550665 ?auto_550666 ?auto_550667 ?auto_550668 ?auto_550669 ?auto_550670 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_550715 - BLOCK
      ?auto_550716 - BLOCK
      ?auto_550717 - BLOCK
      ?auto_550718 - BLOCK
      ?auto_550719 - BLOCK
      ?auto_550720 - BLOCK
      ?auto_550721 - BLOCK
      ?auto_550722 - BLOCK
      ?auto_550723 - BLOCK
      ?auto_550724 - BLOCK
      ?auto_550725 - BLOCK
      ?auto_550726 - BLOCK
      ?auto_550727 - BLOCK
      ?auto_550728 - BLOCK
    )
    :vars
    (
      ?auto_550729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_550728 ?auto_550729 ) ( not ( = ?auto_550715 ?auto_550716 ) ) ( not ( = ?auto_550715 ?auto_550717 ) ) ( not ( = ?auto_550715 ?auto_550718 ) ) ( not ( = ?auto_550715 ?auto_550719 ) ) ( not ( = ?auto_550715 ?auto_550720 ) ) ( not ( = ?auto_550715 ?auto_550721 ) ) ( not ( = ?auto_550715 ?auto_550722 ) ) ( not ( = ?auto_550715 ?auto_550723 ) ) ( not ( = ?auto_550715 ?auto_550724 ) ) ( not ( = ?auto_550715 ?auto_550725 ) ) ( not ( = ?auto_550715 ?auto_550726 ) ) ( not ( = ?auto_550715 ?auto_550727 ) ) ( not ( = ?auto_550715 ?auto_550728 ) ) ( not ( = ?auto_550715 ?auto_550729 ) ) ( not ( = ?auto_550716 ?auto_550717 ) ) ( not ( = ?auto_550716 ?auto_550718 ) ) ( not ( = ?auto_550716 ?auto_550719 ) ) ( not ( = ?auto_550716 ?auto_550720 ) ) ( not ( = ?auto_550716 ?auto_550721 ) ) ( not ( = ?auto_550716 ?auto_550722 ) ) ( not ( = ?auto_550716 ?auto_550723 ) ) ( not ( = ?auto_550716 ?auto_550724 ) ) ( not ( = ?auto_550716 ?auto_550725 ) ) ( not ( = ?auto_550716 ?auto_550726 ) ) ( not ( = ?auto_550716 ?auto_550727 ) ) ( not ( = ?auto_550716 ?auto_550728 ) ) ( not ( = ?auto_550716 ?auto_550729 ) ) ( not ( = ?auto_550717 ?auto_550718 ) ) ( not ( = ?auto_550717 ?auto_550719 ) ) ( not ( = ?auto_550717 ?auto_550720 ) ) ( not ( = ?auto_550717 ?auto_550721 ) ) ( not ( = ?auto_550717 ?auto_550722 ) ) ( not ( = ?auto_550717 ?auto_550723 ) ) ( not ( = ?auto_550717 ?auto_550724 ) ) ( not ( = ?auto_550717 ?auto_550725 ) ) ( not ( = ?auto_550717 ?auto_550726 ) ) ( not ( = ?auto_550717 ?auto_550727 ) ) ( not ( = ?auto_550717 ?auto_550728 ) ) ( not ( = ?auto_550717 ?auto_550729 ) ) ( not ( = ?auto_550718 ?auto_550719 ) ) ( not ( = ?auto_550718 ?auto_550720 ) ) ( not ( = ?auto_550718 ?auto_550721 ) ) ( not ( = ?auto_550718 ?auto_550722 ) ) ( not ( = ?auto_550718 ?auto_550723 ) ) ( not ( = ?auto_550718 ?auto_550724 ) ) ( not ( = ?auto_550718 ?auto_550725 ) ) ( not ( = ?auto_550718 ?auto_550726 ) ) ( not ( = ?auto_550718 ?auto_550727 ) ) ( not ( = ?auto_550718 ?auto_550728 ) ) ( not ( = ?auto_550718 ?auto_550729 ) ) ( not ( = ?auto_550719 ?auto_550720 ) ) ( not ( = ?auto_550719 ?auto_550721 ) ) ( not ( = ?auto_550719 ?auto_550722 ) ) ( not ( = ?auto_550719 ?auto_550723 ) ) ( not ( = ?auto_550719 ?auto_550724 ) ) ( not ( = ?auto_550719 ?auto_550725 ) ) ( not ( = ?auto_550719 ?auto_550726 ) ) ( not ( = ?auto_550719 ?auto_550727 ) ) ( not ( = ?auto_550719 ?auto_550728 ) ) ( not ( = ?auto_550719 ?auto_550729 ) ) ( not ( = ?auto_550720 ?auto_550721 ) ) ( not ( = ?auto_550720 ?auto_550722 ) ) ( not ( = ?auto_550720 ?auto_550723 ) ) ( not ( = ?auto_550720 ?auto_550724 ) ) ( not ( = ?auto_550720 ?auto_550725 ) ) ( not ( = ?auto_550720 ?auto_550726 ) ) ( not ( = ?auto_550720 ?auto_550727 ) ) ( not ( = ?auto_550720 ?auto_550728 ) ) ( not ( = ?auto_550720 ?auto_550729 ) ) ( not ( = ?auto_550721 ?auto_550722 ) ) ( not ( = ?auto_550721 ?auto_550723 ) ) ( not ( = ?auto_550721 ?auto_550724 ) ) ( not ( = ?auto_550721 ?auto_550725 ) ) ( not ( = ?auto_550721 ?auto_550726 ) ) ( not ( = ?auto_550721 ?auto_550727 ) ) ( not ( = ?auto_550721 ?auto_550728 ) ) ( not ( = ?auto_550721 ?auto_550729 ) ) ( not ( = ?auto_550722 ?auto_550723 ) ) ( not ( = ?auto_550722 ?auto_550724 ) ) ( not ( = ?auto_550722 ?auto_550725 ) ) ( not ( = ?auto_550722 ?auto_550726 ) ) ( not ( = ?auto_550722 ?auto_550727 ) ) ( not ( = ?auto_550722 ?auto_550728 ) ) ( not ( = ?auto_550722 ?auto_550729 ) ) ( not ( = ?auto_550723 ?auto_550724 ) ) ( not ( = ?auto_550723 ?auto_550725 ) ) ( not ( = ?auto_550723 ?auto_550726 ) ) ( not ( = ?auto_550723 ?auto_550727 ) ) ( not ( = ?auto_550723 ?auto_550728 ) ) ( not ( = ?auto_550723 ?auto_550729 ) ) ( not ( = ?auto_550724 ?auto_550725 ) ) ( not ( = ?auto_550724 ?auto_550726 ) ) ( not ( = ?auto_550724 ?auto_550727 ) ) ( not ( = ?auto_550724 ?auto_550728 ) ) ( not ( = ?auto_550724 ?auto_550729 ) ) ( not ( = ?auto_550725 ?auto_550726 ) ) ( not ( = ?auto_550725 ?auto_550727 ) ) ( not ( = ?auto_550725 ?auto_550728 ) ) ( not ( = ?auto_550725 ?auto_550729 ) ) ( not ( = ?auto_550726 ?auto_550727 ) ) ( not ( = ?auto_550726 ?auto_550728 ) ) ( not ( = ?auto_550726 ?auto_550729 ) ) ( not ( = ?auto_550727 ?auto_550728 ) ) ( not ( = ?auto_550727 ?auto_550729 ) ) ( not ( = ?auto_550728 ?auto_550729 ) ) ( ON ?auto_550727 ?auto_550728 ) ( ON ?auto_550726 ?auto_550727 ) ( ON ?auto_550725 ?auto_550726 ) ( ON ?auto_550724 ?auto_550725 ) ( ON ?auto_550723 ?auto_550724 ) ( ON ?auto_550722 ?auto_550723 ) ( ON ?auto_550721 ?auto_550722 ) ( ON ?auto_550720 ?auto_550721 ) ( ON ?auto_550719 ?auto_550720 ) ( ON ?auto_550718 ?auto_550719 ) ( ON ?auto_550717 ?auto_550718 ) ( ON ?auto_550716 ?auto_550717 ) ( ON ?auto_550715 ?auto_550716 ) ( CLEAR ?auto_550715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_550715 )
      ( MAKE-14PILE ?auto_550715 ?auto_550716 ?auto_550717 ?auto_550718 ?auto_550719 ?auto_550720 ?auto_550721 ?auto_550722 ?auto_550723 ?auto_550724 ?auto_550725 ?auto_550726 ?auto_550727 ?auto_550728 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_550774 - BLOCK
      ?auto_550775 - BLOCK
      ?auto_550776 - BLOCK
      ?auto_550777 - BLOCK
      ?auto_550778 - BLOCK
      ?auto_550779 - BLOCK
      ?auto_550780 - BLOCK
      ?auto_550781 - BLOCK
      ?auto_550782 - BLOCK
      ?auto_550783 - BLOCK
      ?auto_550784 - BLOCK
      ?auto_550785 - BLOCK
      ?auto_550786 - BLOCK
      ?auto_550787 - BLOCK
      ?auto_550788 - BLOCK
    )
    :vars
    (
      ?auto_550789 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_550787 ) ( ON ?auto_550788 ?auto_550789 ) ( CLEAR ?auto_550788 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_550774 ) ( ON ?auto_550775 ?auto_550774 ) ( ON ?auto_550776 ?auto_550775 ) ( ON ?auto_550777 ?auto_550776 ) ( ON ?auto_550778 ?auto_550777 ) ( ON ?auto_550779 ?auto_550778 ) ( ON ?auto_550780 ?auto_550779 ) ( ON ?auto_550781 ?auto_550780 ) ( ON ?auto_550782 ?auto_550781 ) ( ON ?auto_550783 ?auto_550782 ) ( ON ?auto_550784 ?auto_550783 ) ( ON ?auto_550785 ?auto_550784 ) ( ON ?auto_550786 ?auto_550785 ) ( ON ?auto_550787 ?auto_550786 ) ( not ( = ?auto_550774 ?auto_550775 ) ) ( not ( = ?auto_550774 ?auto_550776 ) ) ( not ( = ?auto_550774 ?auto_550777 ) ) ( not ( = ?auto_550774 ?auto_550778 ) ) ( not ( = ?auto_550774 ?auto_550779 ) ) ( not ( = ?auto_550774 ?auto_550780 ) ) ( not ( = ?auto_550774 ?auto_550781 ) ) ( not ( = ?auto_550774 ?auto_550782 ) ) ( not ( = ?auto_550774 ?auto_550783 ) ) ( not ( = ?auto_550774 ?auto_550784 ) ) ( not ( = ?auto_550774 ?auto_550785 ) ) ( not ( = ?auto_550774 ?auto_550786 ) ) ( not ( = ?auto_550774 ?auto_550787 ) ) ( not ( = ?auto_550774 ?auto_550788 ) ) ( not ( = ?auto_550774 ?auto_550789 ) ) ( not ( = ?auto_550775 ?auto_550776 ) ) ( not ( = ?auto_550775 ?auto_550777 ) ) ( not ( = ?auto_550775 ?auto_550778 ) ) ( not ( = ?auto_550775 ?auto_550779 ) ) ( not ( = ?auto_550775 ?auto_550780 ) ) ( not ( = ?auto_550775 ?auto_550781 ) ) ( not ( = ?auto_550775 ?auto_550782 ) ) ( not ( = ?auto_550775 ?auto_550783 ) ) ( not ( = ?auto_550775 ?auto_550784 ) ) ( not ( = ?auto_550775 ?auto_550785 ) ) ( not ( = ?auto_550775 ?auto_550786 ) ) ( not ( = ?auto_550775 ?auto_550787 ) ) ( not ( = ?auto_550775 ?auto_550788 ) ) ( not ( = ?auto_550775 ?auto_550789 ) ) ( not ( = ?auto_550776 ?auto_550777 ) ) ( not ( = ?auto_550776 ?auto_550778 ) ) ( not ( = ?auto_550776 ?auto_550779 ) ) ( not ( = ?auto_550776 ?auto_550780 ) ) ( not ( = ?auto_550776 ?auto_550781 ) ) ( not ( = ?auto_550776 ?auto_550782 ) ) ( not ( = ?auto_550776 ?auto_550783 ) ) ( not ( = ?auto_550776 ?auto_550784 ) ) ( not ( = ?auto_550776 ?auto_550785 ) ) ( not ( = ?auto_550776 ?auto_550786 ) ) ( not ( = ?auto_550776 ?auto_550787 ) ) ( not ( = ?auto_550776 ?auto_550788 ) ) ( not ( = ?auto_550776 ?auto_550789 ) ) ( not ( = ?auto_550777 ?auto_550778 ) ) ( not ( = ?auto_550777 ?auto_550779 ) ) ( not ( = ?auto_550777 ?auto_550780 ) ) ( not ( = ?auto_550777 ?auto_550781 ) ) ( not ( = ?auto_550777 ?auto_550782 ) ) ( not ( = ?auto_550777 ?auto_550783 ) ) ( not ( = ?auto_550777 ?auto_550784 ) ) ( not ( = ?auto_550777 ?auto_550785 ) ) ( not ( = ?auto_550777 ?auto_550786 ) ) ( not ( = ?auto_550777 ?auto_550787 ) ) ( not ( = ?auto_550777 ?auto_550788 ) ) ( not ( = ?auto_550777 ?auto_550789 ) ) ( not ( = ?auto_550778 ?auto_550779 ) ) ( not ( = ?auto_550778 ?auto_550780 ) ) ( not ( = ?auto_550778 ?auto_550781 ) ) ( not ( = ?auto_550778 ?auto_550782 ) ) ( not ( = ?auto_550778 ?auto_550783 ) ) ( not ( = ?auto_550778 ?auto_550784 ) ) ( not ( = ?auto_550778 ?auto_550785 ) ) ( not ( = ?auto_550778 ?auto_550786 ) ) ( not ( = ?auto_550778 ?auto_550787 ) ) ( not ( = ?auto_550778 ?auto_550788 ) ) ( not ( = ?auto_550778 ?auto_550789 ) ) ( not ( = ?auto_550779 ?auto_550780 ) ) ( not ( = ?auto_550779 ?auto_550781 ) ) ( not ( = ?auto_550779 ?auto_550782 ) ) ( not ( = ?auto_550779 ?auto_550783 ) ) ( not ( = ?auto_550779 ?auto_550784 ) ) ( not ( = ?auto_550779 ?auto_550785 ) ) ( not ( = ?auto_550779 ?auto_550786 ) ) ( not ( = ?auto_550779 ?auto_550787 ) ) ( not ( = ?auto_550779 ?auto_550788 ) ) ( not ( = ?auto_550779 ?auto_550789 ) ) ( not ( = ?auto_550780 ?auto_550781 ) ) ( not ( = ?auto_550780 ?auto_550782 ) ) ( not ( = ?auto_550780 ?auto_550783 ) ) ( not ( = ?auto_550780 ?auto_550784 ) ) ( not ( = ?auto_550780 ?auto_550785 ) ) ( not ( = ?auto_550780 ?auto_550786 ) ) ( not ( = ?auto_550780 ?auto_550787 ) ) ( not ( = ?auto_550780 ?auto_550788 ) ) ( not ( = ?auto_550780 ?auto_550789 ) ) ( not ( = ?auto_550781 ?auto_550782 ) ) ( not ( = ?auto_550781 ?auto_550783 ) ) ( not ( = ?auto_550781 ?auto_550784 ) ) ( not ( = ?auto_550781 ?auto_550785 ) ) ( not ( = ?auto_550781 ?auto_550786 ) ) ( not ( = ?auto_550781 ?auto_550787 ) ) ( not ( = ?auto_550781 ?auto_550788 ) ) ( not ( = ?auto_550781 ?auto_550789 ) ) ( not ( = ?auto_550782 ?auto_550783 ) ) ( not ( = ?auto_550782 ?auto_550784 ) ) ( not ( = ?auto_550782 ?auto_550785 ) ) ( not ( = ?auto_550782 ?auto_550786 ) ) ( not ( = ?auto_550782 ?auto_550787 ) ) ( not ( = ?auto_550782 ?auto_550788 ) ) ( not ( = ?auto_550782 ?auto_550789 ) ) ( not ( = ?auto_550783 ?auto_550784 ) ) ( not ( = ?auto_550783 ?auto_550785 ) ) ( not ( = ?auto_550783 ?auto_550786 ) ) ( not ( = ?auto_550783 ?auto_550787 ) ) ( not ( = ?auto_550783 ?auto_550788 ) ) ( not ( = ?auto_550783 ?auto_550789 ) ) ( not ( = ?auto_550784 ?auto_550785 ) ) ( not ( = ?auto_550784 ?auto_550786 ) ) ( not ( = ?auto_550784 ?auto_550787 ) ) ( not ( = ?auto_550784 ?auto_550788 ) ) ( not ( = ?auto_550784 ?auto_550789 ) ) ( not ( = ?auto_550785 ?auto_550786 ) ) ( not ( = ?auto_550785 ?auto_550787 ) ) ( not ( = ?auto_550785 ?auto_550788 ) ) ( not ( = ?auto_550785 ?auto_550789 ) ) ( not ( = ?auto_550786 ?auto_550787 ) ) ( not ( = ?auto_550786 ?auto_550788 ) ) ( not ( = ?auto_550786 ?auto_550789 ) ) ( not ( = ?auto_550787 ?auto_550788 ) ) ( not ( = ?auto_550787 ?auto_550789 ) ) ( not ( = ?auto_550788 ?auto_550789 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_550788 ?auto_550789 )
      ( !STACK ?auto_550788 ?auto_550787 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_550836 - BLOCK
      ?auto_550837 - BLOCK
      ?auto_550838 - BLOCK
      ?auto_550839 - BLOCK
      ?auto_550840 - BLOCK
      ?auto_550841 - BLOCK
      ?auto_550842 - BLOCK
      ?auto_550843 - BLOCK
      ?auto_550844 - BLOCK
      ?auto_550845 - BLOCK
      ?auto_550846 - BLOCK
      ?auto_550847 - BLOCK
      ?auto_550848 - BLOCK
      ?auto_550849 - BLOCK
      ?auto_550850 - BLOCK
    )
    :vars
    (
      ?auto_550851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_550850 ?auto_550851 ) ( ON-TABLE ?auto_550836 ) ( ON ?auto_550837 ?auto_550836 ) ( ON ?auto_550838 ?auto_550837 ) ( ON ?auto_550839 ?auto_550838 ) ( ON ?auto_550840 ?auto_550839 ) ( ON ?auto_550841 ?auto_550840 ) ( ON ?auto_550842 ?auto_550841 ) ( ON ?auto_550843 ?auto_550842 ) ( ON ?auto_550844 ?auto_550843 ) ( ON ?auto_550845 ?auto_550844 ) ( ON ?auto_550846 ?auto_550845 ) ( ON ?auto_550847 ?auto_550846 ) ( ON ?auto_550848 ?auto_550847 ) ( not ( = ?auto_550836 ?auto_550837 ) ) ( not ( = ?auto_550836 ?auto_550838 ) ) ( not ( = ?auto_550836 ?auto_550839 ) ) ( not ( = ?auto_550836 ?auto_550840 ) ) ( not ( = ?auto_550836 ?auto_550841 ) ) ( not ( = ?auto_550836 ?auto_550842 ) ) ( not ( = ?auto_550836 ?auto_550843 ) ) ( not ( = ?auto_550836 ?auto_550844 ) ) ( not ( = ?auto_550836 ?auto_550845 ) ) ( not ( = ?auto_550836 ?auto_550846 ) ) ( not ( = ?auto_550836 ?auto_550847 ) ) ( not ( = ?auto_550836 ?auto_550848 ) ) ( not ( = ?auto_550836 ?auto_550849 ) ) ( not ( = ?auto_550836 ?auto_550850 ) ) ( not ( = ?auto_550836 ?auto_550851 ) ) ( not ( = ?auto_550837 ?auto_550838 ) ) ( not ( = ?auto_550837 ?auto_550839 ) ) ( not ( = ?auto_550837 ?auto_550840 ) ) ( not ( = ?auto_550837 ?auto_550841 ) ) ( not ( = ?auto_550837 ?auto_550842 ) ) ( not ( = ?auto_550837 ?auto_550843 ) ) ( not ( = ?auto_550837 ?auto_550844 ) ) ( not ( = ?auto_550837 ?auto_550845 ) ) ( not ( = ?auto_550837 ?auto_550846 ) ) ( not ( = ?auto_550837 ?auto_550847 ) ) ( not ( = ?auto_550837 ?auto_550848 ) ) ( not ( = ?auto_550837 ?auto_550849 ) ) ( not ( = ?auto_550837 ?auto_550850 ) ) ( not ( = ?auto_550837 ?auto_550851 ) ) ( not ( = ?auto_550838 ?auto_550839 ) ) ( not ( = ?auto_550838 ?auto_550840 ) ) ( not ( = ?auto_550838 ?auto_550841 ) ) ( not ( = ?auto_550838 ?auto_550842 ) ) ( not ( = ?auto_550838 ?auto_550843 ) ) ( not ( = ?auto_550838 ?auto_550844 ) ) ( not ( = ?auto_550838 ?auto_550845 ) ) ( not ( = ?auto_550838 ?auto_550846 ) ) ( not ( = ?auto_550838 ?auto_550847 ) ) ( not ( = ?auto_550838 ?auto_550848 ) ) ( not ( = ?auto_550838 ?auto_550849 ) ) ( not ( = ?auto_550838 ?auto_550850 ) ) ( not ( = ?auto_550838 ?auto_550851 ) ) ( not ( = ?auto_550839 ?auto_550840 ) ) ( not ( = ?auto_550839 ?auto_550841 ) ) ( not ( = ?auto_550839 ?auto_550842 ) ) ( not ( = ?auto_550839 ?auto_550843 ) ) ( not ( = ?auto_550839 ?auto_550844 ) ) ( not ( = ?auto_550839 ?auto_550845 ) ) ( not ( = ?auto_550839 ?auto_550846 ) ) ( not ( = ?auto_550839 ?auto_550847 ) ) ( not ( = ?auto_550839 ?auto_550848 ) ) ( not ( = ?auto_550839 ?auto_550849 ) ) ( not ( = ?auto_550839 ?auto_550850 ) ) ( not ( = ?auto_550839 ?auto_550851 ) ) ( not ( = ?auto_550840 ?auto_550841 ) ) ( not ( = ?auto_550840 ?auto_550842 ) ) ( not ( = ?auto_550840 ?auto_550843 ) ) ( not ( = ?auto_550840 ?auto_550844 ) ) ( not ( = ?auto_550840 ?auto_550845 ) ) ( not ( = ?auto_550840 ?auto_550846 ) ) ( not ( = ?auto_550840 ?auto_550847 ) ) ( not ( = ?auto_550840 ?auto_550848 ) ) ( not ( = ?auto_550840 ?auto_550849 ) ) ( not ( = ?auto_550840 ?auto_550850 ) ) ( not ( = ?auto_550840 ?auto_550851 ) ) ( not ( = ?auto_550841 ?auto_550842 ) ) ( not ( = ?auto_550841 ?auto_550843 ) ) ( not ( = ?auto_550841 ?auto_550844 ) ) ( not ( = ?auto_550841 ?auto_550845 ) ) ( not ( = ?auto_550841 ?auto_550846 ) ) ( not ( = ?auto_550841 ?auto_550847 ) ) ( not ( = ?auto_550841 ?auto_550848 ) ) ( not ( = ?auto_550841 ?auto_550849 ) ) ( not ( = ?auto_550841 ?auto_550850 ) ) ( not ( = ?auto_550841 ?auto_550851 ) ) ( not ( = ?auto_550842 ?auto_550843 ) ) ( not ( = ?auto_550842 ?auto_550844 ) ) ( not ( = ?auto_550842 ?auto_550845 ) ) ( not ( = ?auto_550842 ?auto_550846 ) ) ( not ( = ?auto_550842 ?auto_550847 ) ) ( not ( = ?auto_550842 ?auto_550848 ) ) ( not ( = ?auto_550842 ?auto_550849 ) ) ( not ( = ?auto_550842 ?auto_550850 ) ) ( not ( = ?auto_550842 ?auto_550851 ) ) ( not ( = ?auto_550843 ?auto_550844 ) ) ( not ( = ?auto_550843 ?auto_550845 ) ) ( not ( = ?auto_550843 ?auto_550846 ) ) ( not ( = ?auto_550843 ?auto_550847 ) ) ( not ( = ?auto_550843 ?auto_550848 ) ) ( not ( = ?auto_550843 ?auto_550849 ) ) ( not ( = ?auto_550843 ?auto_550850 ) ) ( not ( = ?auto_550843 ?auto_550851 ) ) ( not ( = ?auto_550844 ?auto_550845 ) ) ( not ( = ?auto_550844 ?auto_550846 ) ) ( not ( = ?auto_550844 ?auto_550847 ) ) ( not ( = ?auto_550844 ?auto_550848 ) ) ( not ( = ?auto_550844 ?auto_550849 ) ) ( not ( = ?auto_550844 ?auto_550850 ) ) ( not ( = ?auto_550844 ?auto_550851 ) ) ( not ( = ?auto_550845 ?auto_550846 ) ) ( not ( = ?auto_550845 ?auto_550847 ) ) ( not ( = ?auto_550845 ?auto_550848 ) ) ( not ( = ?auto_550845 ?auto_550849 ) ) ( not ( = ?auto_550845 ?auto_550850 ) ) ( not ( = ?auto_550845 ?auto_550851 ) ) ( not ( = ?auto_550846 ?auto_550847 ) ) ( not ( = ?auto_550846 ?auto_550848 ) ) ( not ( = ?auto_550846 ?auto_550849 ) ) ( not ( = ?auto_550846 ?auto_550850 ) ) ( not ( = ?auto_550846 ?auto_550851 ) ) ( not ( = ?auto_550847 ?auto_550848 ) ) ( not ( = ?auto_550847 ?auto_550849 ) ) ( not ( = ?auto_550847 ?auto_550850 ) ) ( not ( = ?auto_550847 ?auto_550851 ) ) ( not ( = ?auto_550848 ?auto_550849 ) ) ( not ( = ?auto_550848 ?auto_550850 ) ) ( not ( = ?auto_550848 ?auto_550851 ) ) ( not ( = ?auto_550849 ?auto_550850 ) ) ( not ( = ?auto_550849 ?auto_550851 ) ) ( not ( = ?auto_550850 ?auto_550851 ) ) ( CLEAR ?auto_550848 ) ( ON ?auto_550849 ?auto_550850 ) ( CLEAR ?auto_550849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_550836 ?auto_550837 ?auto_550838 ?auto_550839 ?auto_550840 ?auto_550841 ?auto_550842 ?auto_550843 ?auto_550844 ?auto_550845 ?auto_550846 ?auto_550847 ?auto_550848 ?auto_550849 )
      ( MAKE-15PILE ?auto_550836 ?auto_550837 ?auto_550838 ?auto_550839 ?auto_550840 ?auto_550841 ?auto_550842 ?auto_550843 ?auto_550844 ?auto_550845 ?auto_550846 ?auto_550847 ?auto_550848 ?auto_550849 ?auto_550850 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_550898 - BLOCK
      ?auto_550899 - BLOCK
      ?auto_550900 - BLOCK
      ?auto_550901 - BLOCK
      ?auto_550902 - BLOCK
      ?auto_550903 - BLOCK
      ?auto_550904 - BLOCK
      ?auto_550905 - BLOCK
      ?auto_550906 - BLOCK
      ?auto_550907 - BLOCK
      ?auto_550908 - BLOCK
      ?auto_550909 - BLOCK
      ?auto_550910 - BLOCK
      ?auto_550911 - BLOCK
      ?auto_550912 - BLOCK
    )
    :vars
    (
      ?auto_550913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_550912 ?auto_550913 ) ( ON-TABLE ?auto_550898 ) ( ON ?auto_550899 ?auto_550898 ) ( ON ?auto_550900 ?auto_550899 ) ( ON ?auto_550901 ?auto_550900 ) ( ON ?auto_550902 ?auto_550901 ) ( ON ?auto_550903 ?auto_550902 ) ( ON ?auto_550904 ?auto_550903 ) ( ON ?auto_550905 ?auto_550904 ) ( ON ?auto_550906 ?auto_550905 ) ( ON ?auto_550907 ?auto_550906 ) ( ON ?auto_550908 ?auto_550907 ) ( ON ?auto_550909 ?auto_550908 ) ( not ( = ?auto_550898 ?auto_550899 ) ) ( not ( = ?auto_550898 ?auto_550900 ) ) ( not ( = ?auto_550898 ?auto_550901 ) ) ( not ( = ?auto_550898 ?auto_550902 ) ) ( not ( = ?auto_550898 ?auto_550903 ) ) ( not ( = ?auto_550898 ?auto_550904 ) ) ( not ( = ?auto_550898 ?auto_550905 ) ) ( not ( = ?auto_550898 ?auto_550906 ) ) ( not ( = ?auto_550898 ?auto_550907 ) ) ( not ( = ?auto_550898 ?auto_550908 ) ) ( not ( = ?auto_550898 ?auto_550909 ) ) ( not ( = ?auto_550898 ?auto_550910 ) ) ( not ( = ?auto_550898 ?auto_550911 ) ) ( not ( = ?auto_550898 ?auto_550912 ) ) ( not ( = ?auto_550898 ?auto_550913 ) ) ( not ( = ?auto_550899 ?auto_550900 ) ) ( not ( = ?auto_550899 ?auto_550901 ) ) ( not ( = ?auto_550899 ?auto_550902 ) ) ( not ( = ?auto_550899 ?auto_550903 ) ) ( not ( = ?auto_550899 ?auto_550904 ) ) ( not ( = ?auto_550899 ?auto_550905 ) ) ( not ( = ?auto_550899 ?auto_550906 ) ) ( not ( = ?auto_550899 ?auto_550907 ) ) ( not ( = ?auto_550899 ?auto_550908 ) ) ( not ( = ?auto_550899 ?auto_550909 ) ) ( not ( = ?auto_550899 ?auto_550910 ) ) ( not ( = ?auto_550899 ?auto_550911 ) ) ( not ( = ?auto_550899 ?auto_550912 ) ) ( not ( = ?auto_550899 ?auto_550913 ) ) ( not ( = ?auto_550900 ?auto_550901 ) ) ( not ( = ?auto_550900 ?auto_550902 ) ) ( not ( = ?auto_550900 ?auto_550903 ) ) ( not ( = ?auto_550900 ?auto_550904 ) ) ( not ( = ?auto_550900 ?auto_550905 ) ) ( not ( = ?auto_550900 ?auto_550906 ) ) ( not ( = ?auto_550900 ?auto_550907 ) ) ( not ( = ?auto_550900 ?auto_550908 ) ) ( not ( = ?auto_550900 ?auto_550909 ) ) ( not ( = ?auto_550900 ?auto_550910 ) ) ( not ( = ?auto_550900 ?auto_550911 ) ) ( not ( = ?auto_550900 ?auto_550912 ) ) ( not ( = ?auto_550900 ?auto_550913 ) ) ( not ( = ?auto_550901 ?auto_550902 ) ) ( not ( = ?auto_550901 ?auto_550903 ) ) ( not ( = ?auto_550901 ?auto_550904 ) ) ( not ( = ?auto_550901 ?auto_550905 ) ) ( not ( = ?auto_550901 ?auto_550906 ) ) ( not ( = ?auto_550901 ?auto_550907 ) ) ( not ( = ?auto_550901 ?auto_550908 ) ) ( not ( = ?auto_550901 ?auto_550909 ) ) ( not ( = ?auto_550901 ?auto_550910 ) ) ( not ( = ?auto_550901 ?auto_550911 ) ) ( not ( = ?auto_550901 ?auto_550912 ) ) ( not ( = ?auto_550901 ?auto_550913 ) ) ( not ( = ?auto_550902 ?auto_550903 ) ) ( not ( = ?auto_550902 ?auto_550904 ) ) ( not ( = ?auto_550902 ?auto_550905 ) ) ( not ( = ?auto_550902 ?auto_550906 ) ) ( not ( = ?auto_550902 ?auto_550907 ) ) ( not ( = ?auto_550902 ?auto_550908 ) ) ( not ( = ?auto_550902 ?auto_550909 ) ) ( not ( = ?auto_550902 ?auto_550910 ) ) ( not ( = ?auto_550902 ?auto_550911 ) ) ( not ( = ?auto_550902 ?auto_550912 ) ) ( not ( = ?auto_550902 ?auto_550913 ) ) ( not ( = ?auto_550903 ?auto_550904 ) ) ( not ( = ?auto_550903 ?auto_550905 ) ) ( not ( = ?auto_550903 ?auto_550906 ) ) ( not ( = ?auto_550903 ?auto_550907 ) ) ( not ( = ?auto_550903 ?auto_550908 ) ) ( not ( = ?auto_550903 ?auto_550909 ) ) ( not ( = ?auto_550903 ?auto_550910 ) ) ( not ( = ?auto_550903 ?auto_550911 ) ) ( not ( = ?auto_550903 ?auto_550912 ) ) ( not ( = ?auto_550903 ?auto_550913 ) ) ( not ( = ?auto_550904 ?auto_550905 ) ) ( not ( = ?auto_550904 ?auto_550906 ) ) ( not ( = ?auto_550904 ?auto_550907 ) ) ( not ( = ?auto_550904 ?auto_550908 ) ) ( not ( = ?auto_550904 ?auto_550909 ) ) ( not ( = ?auto_550904 ?auto_550910 ) ) ( not ( = ?auto_550904 ?auto_550911 ) ) ( not ( = ?auto_550904 ?auto_550912 ) ) ( not ( = ?auto_550904 ?auto_550913 ) ) ( not ( = ?auto_550905 ?auto_550906 ) ) ( not ( = ?auto_550905 ?auto_550907 ) ) ( not ( = ?auto_550905 ?auto_550908 ) ) ( not ( = ?auto_550905 ?auto_550909 ) ) ( not ( = ?auto_550905 ?auto_550910 ) ) ( not ( = ?auto_550905 ?auto_550911 ) ) ( not ( = ?auto_550905 ?auto_550912 ) ) ( not ( = ?auto_550905 ?auto_550913 ) ) ( not ( = ?auto_550906 ?auto_550907 ) ) ( not ( = ?auto_550906 ?auto_550908 ) ) ( not ( = ?auto_550906 ?auto_550909 ) ) ( not ( = ?auto_550906 ?auto_550910 ) ) ( not ( = ?auto_550906 ?auto_550911 ) ) ( not ( = ?auto_550906 ?auto_550912 ) ) ( not ( = ?auto_550906 ?auto_550913 ) ) ( not ( = ?auto_550907 ?auto_550908 ) ) ( not ( = ?auto_550907 ?auto_550909 ) ) ( not ( = ?auto_550907 ?auto_550910 ) ) ( not ( = ?auto_550907 ?auto_550911 ) ) ( not ( = ?auto_550907 ?auto_550912 ) ) ( not ( = ?auto_550907 ?auto_550913 ) ) ( not ( = ?auto_550908 ?auto_550909 ) ) ( not ( = ?auto_550908 ?auto_550910 ) ) ( not ( = ?auto_550908 ?auto_550911 ) ) ( not ( = ?auto_550908 ?auto_550912 ) ) ( not ( = ?auto_550908 ?auto_550913 ) ) ( not ( = ?auto_550909 ?auto_550910 ) ) ( not ( = ?auto_550909 ?auto_550911 ) ) ( not ( = ?auto_550909 ?auto_550912 ) ) ( not ( = ?auto_550909 ?auto_550913 ) ) ( not ( = ?auto_550910 ?auto_550911 ) ) ( not ( = ?auto_550910 ?auto_550912 ) ) ( not ( = ?auto_550910 ?auto_550913 ) ) ( not ( = ?auto_550911 ?auto_550912 ) ) ( not ( = ?auto_550911 ?auto_550913 ) ) ( not ( = ?auto_550912 ?auto_550913 ) ) ( ON ?auto_550911 ?auto_550912 ) ( CLEAR ?auto_550909 ) ( ON ?auto_550910 ?auto_550911 ) ( CLEAR ?auto_550910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_550898 ?auto_550899 ?auto_550900 ?auto_550901 ?auto_550902 ?auto_550903 ?auto_550904 ?auto_550905 ?auto_550906 ?auto_550907 ?auto_550908 ?auto_550909 ?auto_550910 )
      ( MAKE-15PILE ?auto_550898 ?auto_550899 ?auto_550900 ?auto_550901 ?auto_550902 ?auto_550903 ?auto_550904 ?auto_550905 ?auto_550906 ?auto_550907 ?auto_550908 ?auto_550909 ?auto_550910 ?auto_550911 ?auto_550912 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_550960 - BLOCK
      ?auto_550961 - BLOCK
      ?auto_550962 - BLOCK
      ?auto_550963 - BLOCK
      ?auto_550964 - BLOCK
      ?auto_550965 - BLOCK
      ?auto_550966 - BLOCK
      ?auto_550967 - BLOCK
      ?auto_550968 - BLOCK
      ?auto_550969 - BLOCK
      ?auto_550970 - BLOCK
      ?auto_550971 - BLOCK
      ?auto_550972 - BLOCK
      ?auto_550973 - BLOCK
      ?auto_550974 - BLOCK
    )
    :vars
    (
      ?auto_550975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_550974 ?auto_550975 ) ( ON-TABLE ?auto_550960 ) ( ON ?auto_550961 ?auto_550960 ) ( ON ?auto_550962 ?auto_550961 ) ( ON ?auto_550963 ?auto_550962 ) ( ON ?auto_550964 ?auto_550963 ) ( ON ?auto_550965 ?auto_550964 ) ( ON ?auto_550966 ?auto_550965 ) ( ON ?auto_550967 ?auto_550966 ) ( ON ?auto_550968 ?auto_550967 ) ( ON ?auto_550969 ?auto_550968 ) ( ON ?auto_550970 ?auto_550969 ) ( not ( = ?auto_550960 ?auto_550961 ) ) ( not ( = ?auto_550960 ?auto_550962 ) ) ( not ( = ?auto_550960 ?auto_550963 ) ) ( not ( = ?auto_550960 ?auto_550964 ) ) ( not ( = ?auto_550960 ?auto_550965 ) ) ( not ( = ?auto_550960 ?auto_550966 ) ) ( not ( = ?auto_550960 ?auto_550967 ) ) ( not ( = ?auto_550960 ?auto_550968 ) ) ( not ( = ?auto_550960 ?auto_550969 ) ) ( not ( = ?auto_550960 ?auto_550970 ) ) ( not ( = ?auto_550960 ?auto_550971 ) ) ( not ( = ?auto_550960 ?auto_550972 ) ) ( not ( = ?auto_550960 ?auto_550973 ) ) ( not ( = ?auto_550960 ?auto_550974 ) ) ( not ( = ?auto_550960 ?auto_550975 ) ) ( not ( = ?auto_550961 ?auto_550962 ) ) ( not ( = ?auto_550961 ?auto_550963 ) ) ( not ( = ?auto_550961 ?auto_550964 ) ) ( not ( = ?auto_550961 ?auto_550965 ) ) ( not ( = ?auto_550961 ?auto_550966 ) ) ( not ( = ?auto_550961 ?auto_550967 ) ) ( not ( = ?auto_550961 ?auto_550968 ) ) ( not ( = ?auto_550961 ?auto_550969 ) ) ( not ( = ?auto_550961 ?auto_550970 ) ) ( not ( = ?auto_550961 ?auto_550971 ) ) ( not ( = ?auto_550961 ?auto_550972 ) ) ( not ( = ?auto_550961 ?auto_550973 ) ) ( not ( = ?auto_550961 ?auto_550974 ) ) ( not ( = ?auto_550961 ?auto_550975 ) ) ( not ( = ?auto_550962 ?auto_550963 ) ) ( not ( = ?auto_550962 ?auto_550964 ) ) ( not ( = ?auto_550962 ?auto_550965 ) ) ( not ( = ?auto_550962 ?auto_550966 ) ) ( not ( = ?auto_550962 ?auto_550967 ) ) ( not ( = ?auto_550962 ?auto_550968 ) ) ( not ( = ?auto_550962 ?auto_550969 ) ) ( not ( = ?auto_550962 ?auto_550970 ) ) ( not ( = ?auto_550962 ?auto_550971 ) ) ( not ( = ?auto_550962 ?auto_550972 ) ) ( not ( = ?auto_550962 ?auto_550973 ) ) ( not ( = ?auto_550962 ?auto_550974 ) ) ( not ( = ?auto_550962 ?auto_550975 ) ) ( not ( = ?auto_550963 ?auto_550964 ) ) ( not ( = ?auto_550963 ?auto_550965 ) ) ( not ( = ?auto_550963 ?auto_550966 ) ) ( not ( = ?auto_550963 ?auto_550967 ) ) ( not ( = ?auto_550963 ?auto_550968 ) ) ( not ( = ?auto_550963 ?auto_550969 ) ) ( not ( = ?auto_550963 ?auto_550970 ) ) ( not ( = ?auto_550963 ?auto_550971 ) ) ( not ( = ?auto_550963 ?auto_550972 ) ) ( not ( = ?auto_550963 ?auto_550973 ) ) ( not ( = ?auto_550963 ?auto_550974 ) ) ( not ( = ?auto_550963 ?auto_550975 ) ) ( not ( = ?auto_550964 ?auto_550965 ) ) ( not ( = ?auto_550964 ?auto_550966 ) ) ( not ( = ?auto_550964 ?auto_550967 ) ) ( not ( = ?auto_550964 ?auto_550968 ) ) ( not ( = ?auto_550964 ?auto_550969 ) ) ( not ( = ?auto_550964 ?auto_550970 ) ) ( not ( = ?auto_550964 ?auto_550971 ) ) ( not ( = ?auto_550964 ?auto_550972 ) ) ( not ( = ?auto_550964 ?auto_550973 ) ) ( not ( = ?auto_550964 ?auto_550974 ) ) ( not ( = ?auto_550964 ?auto_550975 ) ) ( not ( = ?auto_550965 ?auto_550966 ) ) ( not ( = ?auto_550965 ?auto_550967 ) ) ( not ( = ?auto_550965 ?auto_550968 ) ) ( not ( = ?auto_550965 ?auto_550969 ) ) ( not ( = ?auto_550965 ?auto_550970 ) ) ( not ( = ?auto_550965 ?auto_550971 ) ) ( not ( = ?auto_550965 ?auto_550972 ) ) ( not ( = ?auto_550965 ?auto_550973 ) ) ( not ( = ?auto_550965 ?auto_550974 ) ) ( not ( = ?auto_550965 ?auto_550975 ) ) ( not ( = ?auto_550966 ?auto_550967 ) ) ( not ( = ?auto_550966 ?auto_550968 ) ) ( not ( = ?auto_550966 ?auto_550969 ) ) ( not ( = ?auto_550966 ?auto_550970 ) ) ( not ( = ?auto_550966 ?auto_550971 ) ) ( not ( = ?auto_550966 ?auto_550972 ) ) ( not ( = ?auto_550966 ?auto_550973 ) ) ( not ( = ?auto_550966 ?auto_550974 ) ) ( not ( = ?auto_550966 ?auto_550975 ) ) ( not ( = ?auto_550967 ?auto_550968 ) ) ( not ( = ?auto_550967 ?auto_550969 ) ) ( not ( = ?auto_550967 ?auto_550970 ) ) ( not ( = ?auto_550967 ?auto_550971 ) ) ( not ( = ?auto_550967 ?auto_550972 ) ) ( not ( = ?auto_550967 ?auto_550973 ) ) ( not ( = ?auto_550967 ?auto_550974 ) ) ( not ( = ?auto_550967 ?auto_550975 ) ) ( not ( = ?auto_550968 ?auto_550969 ) ) ( not ( = ?auto_550968 ?auto_550970 ) ) ( not ( = ?auto_550968 ?auto_550971 ) ) ( not ( = ?auto_550968 ?auto_550972 ) ) ( not ( = ?auto_550968 ?auto_550973 ) ) ( not ( = ?auto_550968 ?auto_550974 ) ) ( not ( = ?auto_550968 ?auto_550975 ) ) ( not ( = ?auto_550969 ?auto_550970 ) ) ( not ( = ?auto_550969 ?auto_550971 ) ) ( not ( = ?auto_550969 ?auto_550972 ) ) ( not ( = ?auto_550969 ?auto_550973 ) ) ( not ( = ?auto_550969 ?auto_550974 ) ) ( not ( = ?auto_550969 ?auto_550975 ) ) ( not ( = ?auto_550970 ?auto_550971 ) ) ( not ( = ?auto_550970 ?auto_550972 ) ) ( not ( = ?auto_550970 ?auto_550973 ) ) ( not ( = ?auto_550970 ?auto_550974 ) ) ( not ( = ?auto_550970 ?auto_550975 ) ) ( not ( = ?auto_550971 ?auto_550972 ) ) ( not ( = ?auto_550971 ?auto_550973 ) ) ( not ( = ?auto_550971 ?auto_550974 ) ) ( not ( = ?auto_550971 ?auto_550975 ) ) ( not ( = ?auto_550972 ?auto_550973 ) ) ( not ( = ?auto_550972 ?auto_550974 ) ) ( not ( = ?auto_550972 ?auto_550975 ) ) ( not ( = ?auto_550973 ?auto_550974 ) ) ( not ( = ?auto_550973 ?auto_550975 ) ) ( not ( = ?auto_550974 ?auto_550975 ) ) ( ON ?auto_550973 ?auto_550974 ) ( ON ?auto_550972 ?auto_550973 ) ( CLEAR ?auto_550970 ) ( ON ?auto_550971 ?auto_550972 ) ( CLEAR ?auto_550971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_550960 ?auto_550961 ?auto_550962 ?auto_550963 ?auto_550964 ?auto_550965 ?auto_550966 ?auto_550967 ?auto_550968 ?auto_550969 ?auto_550970 ?auto_550971 )
      ( MAKE-15PILE ?auto_550960 ?auto_550961 ?auto_550962 ?auto_550963 ?auto_550964 ?auto_550965 ?auto_550966 ?auto_550967 ?auto_550968 ?auto_550969 ?auto_550970 ?auto_550971 ?auto_550972 ?auto_550973 ?auto_550974 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_551022 - BLOCK
      ?auto_551023 - BLOCK
      ?auto_551024 - BLOCK
      ?auto_551025 - BLOCK
      ?auto_551026 - BLOCK
      ?auto_551027 - BLOCK
      ?auto_551028 - BLOCK
      ?auto_551029 - BLOCK
      ?auto_551030 - BLOCK
      ?auto_551031 - BLOCK
      ?auto_551032 - BLOCK
      ?auto_551033 - BLOCK
      ?auto_551034 - BLOCK
      ?auto_551035 - BLOCK
      ?auto_551036 - BLOCK
    )
    :vars
    (
      ?auto_551037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_551036 ?auto_551037 ) ( ON-TABLE ?auto_551022 ) ( ON ?auto_551023 ?auto_551022 ) ( ON ?auto_551024 ?auto_551023 ) ( ON ?auto_551025 ?auto_551024 ) ( ON ?auto_551026 ?auto_551025 ) ( ON ?auto_551027 ?auto_551026 ) ( ON ?auto_551028 ?auto_551027 ) ( ON ?auto_551029 ?auto_551028 ) ( ON ?auto_551030 ?auto_551029 ) ( ON ?auto_551031 ?auto_551030 ) ( not ( = ?auto_551022 ?auto_551023 ) ) ( not ( = ?auto_551022 ?auto_551024 ) ) ( not ( = ?auto_551022 ?auto_551025 ) ) ( not ( = ?auto_551022 ?auto_551026 ) ) ( not ( = ?auto_551022 ?auto_551027 ) ) ( not ( = ?auto_551022 ?auto_551028 ) ) ( not ( = ?auto_551022 ?auto_551029 ) ) ( not ( = ?auto_551022 ?auto_551030 ) ) ( not ( = ?auto_551022 ?auto_551031 ) ) ( not ( = ?auto_551022 ?auto_551032 ) ) ( not ( = ?auto_551022 ?auto_551033 ) ) ( not ( = ?auto_551022 ?auto_551034 ) ) ( not ( = ?auto_551022 ?auto_551035 ) ) ( not ( = ?auto_551022 ?auto_551036 ) ) ( not ( = ?auto_551022 ?auto_551037 ) ) ( not ( = ?auto_551023 ?auto_551024 ) ) ( not ( = ?auto_551023 ?auto_551025 ) ) ( not ( = ?auto_551023 ?auto_551026 ) ) ( not ( = ?auto_551023 ?auto_551027 ) ) ( not ( = ?auto_551023 ?auto_551028 ) ) ( not ( = ?auto_551023 ?auto_551029 ) ) ( not ( = ?auto_551023 ?auto_551030 ) ) ( not ( = ?auto_551023 ?auto_551031 ) ) ( not ( = ?auto_551023 ?auto_551032 ) ) ( not ( = ?auto_551023 ?auto_551033 ) ) ( not ( = ?auto_551023 ?auto_551034 ) ) ( not ( = ?auto_551023 ?auto_551035 ) ) ( not ( = ?auto_551023 ?auto_551036 ) ) ( not ( = ?auto_551023 ?auto_551037 ) ) ( not ( = ?auto_551024 ?auto_551025 ) ) ( not ( = ?auto_551024 ?auto_551026 ) ) ( not ( = ?auto_551024 ?auto_551027 ) ) ( not ( = ?auto_551024 ?auto_551028 ) ) ( not ( = ?auto_551024 ?auto_551029 ) ) ( not ( = ?auto_551024 ?auto_551030 ) ) ( not ( = ?auto_551024 ?auto_551031 ) ) ( not ( = ?auto_551024 ?auto_551032 ) ) ( not ( = ?auto_551024 ?auto_551033 ) ) ( not ( = ?auto_551024 ?auto_551034 ) ) ( not ( = ?auto_551024 ?auto_551035 ) ) ( not ( = ?auto_551024 ?auto_551036 ) ) ( not ( = ?auto_551024 ?auto_551037 ) ) ( not ( = ?auto_551025 ?auto_551026 ) ) ( not ( = ?auto_551025 ?auto_551027 ) ) ( not ( = ?auto_551025 ?auto_551028 ) ) ( not ( = ?auto_551025 ?auto_551029 ) ) ( not ( = ?auto_551025 ?auto_551030 ) ) ( not ( = ?auto_551025 ?auto_551031 ) ) ( not ( = ?auto_551025 ?auto_551032 ) ) ( not ( = ?auto_551025 ?auto_551033 ) ) ( not ( = ?auto_551025 ?auto_551034 ) ) ( not ( = ?auto_551025 ?auto_551035 ) ) ( not ( = ?auto_551025 ?auto_551036 ) ) ( not ( = ?auto_551025 ?auto_551037 ) ) ( not ( = ?auto_551026 ?auto_551027 ) ) ( not ( = ?auto_551026 ?auto_551028 ) ) ( not ( = ?auto_551026 ?auto_551029 ) ) ( not ( = ?auto_551026 ?auto_551030 ) ) ( not ( = ?auto_551026 ?auto_551031 ) ) ( not ( = ?auto_551026 ?auto_551032 ) ) ( not ( = ?auto_551026 ?auto_551033 ) ) ( not ( = ?auto_551026 ?auto_551034 ) ) ( not ( = ?auto_551026 ?auto_551035 ) ) ( not ( = ?auto_551026 ?auto_551036 ) ) ( not ( = ?auto_551026 ?auto_551037 ) ) ( not ( = ?auto_551027 ?auto_551028 ) ) ( not ( = ?auto_551027 ?auto_551029 ) ) ( not ( = ?auto_551027 ?auto_551030 ) ) ( not ( = ?auto_551027 ?auto_551031 ) ) ( not ( = ?auto_551027 ?auto_551032 ) ) ( not ( = ?auto_551027 ?auto_551033 ) ) ( not ( = ?auto_551027 ?auto_551034 ) ) ( not ( = ?auto_551027 ?auto_551035 ) ) ( not ( = ?auto_551027 ?auto_551036 ) ) ( not ( = ?auto_551027 ?auto_551037 ) ) ( not ( = ?auto_551028 ?auto_551029 ) ) ( not ( = ?auto_551028 ?auto_551030 ) ) ( not ( = ?auto_551028 ?auto_551031 ) ) ( not ( = ?auto_551028 ?auto_551032 ) ) ( not ( = ?auto_551028 ?auto_551033 ) ) ( not ( = ?auto_551028 ?auto_551034 ) ) ( not ( = ?auto_551028 ?auto_551035 ) ) ( not ( = ?auto_551028 ?auto_551036 ) ) ( not ( = ?auto_551028 ?auto_551037 ) ) ( not ( = ?auto_551029 ?auto_551030 ) ) ( not ( = ?auto_551029 ?auto_551031 ) ) ( not ( = ?auto_551029 ?auto_551032 ) ) ( not ( = ?auto_551029 ?auto_551033 ) ) ( not ( = ?auto_551029 ?auto_551034 ) ) ( not ( = ?auto_551029 ?auto_551035 ) ) ( not ( = ?auto_551029 ?auto_551036 ) ) ( not ( = ?auto_551029 ?auto_551037 ) ) ( not ( = ?auto_551030 ?auto_551031 ) ) ( not ( = ?auto_551030 ?auto_551032 ) ) ( not ( = ?auto_551030 ?auto_551033 ) ) ( not ( = ?auto_551030 ?auto_551034 ) ) ( not ( = ?auto_551030 ?auto_551035 ) ) ( not ( = ?auto_551030 ?auto_551036 ) ) ( not ( = ?auto_551030 ?auto_551037 ) ) ( not ( = ?auto_551031 ?auto_551032 ) ) ( not ( = ?auto_551031 ?auto_551033 ) ) ( not ( = ?auto_551031 ?auto_551034 ) ) ( not ( = ?auto_551031 ?auto_551035 ) ) ( not ( = ?auto_551031 ?auto_551036 ) ) ( not ( = ?auto_551031 ?auto_551037 ) ) ( not ( = ?auto_551032 ?auto_551033 ) ) ( not ( = ?auto_551032 ?auto_551034 ) ) ( not ( = ?auto_551032 ?auto_551035 ) ) ( not ( = ?auto_551032 ?auto_551036 ) ) ( not ( = ?auto_551032 ?auto_551037 ) ) ( not ( = ?auto_551033 ?auto_551034 ) ) ( not ( = ?auto_551033 ?auto_551035 ) ) ( not ( = ?auto_551033 ?auto_551036 ) ) ( not ( = ?auto_551033 ?auto_551037 ) ) ( not ( = ?auto_551034 ?auto_551035 ) ) ( not ( = ?auto_551034 ?auto_551036 ) ) ( not ( = ?auto_551034 ?auto_551037 ) ) ( not ( = ?auto_551035 ?auto_551036 ) ) ( not ( = ?auto_551035 ?auto_551037 ) ) ( not ( = ?auto_551036 ?auto_551037 ) ) ( ON ?auto_551035 ?auto_551036 ) ( ON ?auto_551034 ?auto_551035 ) ( ON ?auto_551033 ?auto_551034 ) ( CLEAR ?auto_551031 ) ( ON ?auto_551032 ?auto_551033 ) ( CLEAR ?auto_551032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_551022 ?auto_551023 ?auto_551024 ?auto_551025 ?auto_551026 ?auto_551027 ?auto_551028 ?auto_551029 ?auto_551030 ?auto_551031 ?auto_551032 )
      ( MAKE-15PILE ?auto_551022 ?auto_551023 ?auto_551024 ?auto_551025 ?auto_551026 ?auto_551027 ?auto_551028 ?auto_551029 ?auto_551030 ?auto_551031 ?auto_551032 ?auto_551033 ?auto_551034 ?auto_551035 ?auto_551036 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_551084 - BLOCK
      ?auto_551085 - BLOCK
      ?auto_551086 - BLOCK
      ?auto_551087 - BLOCK
      ?auto_551088 - BLOCK
      ?auto_551089 - BLOCK
      ?auto_551090 - BLOCK
      ?auto_551091 - BLOCK
      ?auto_551092 - BLOCK
      ?auto_551093 - BLOCK
      ?auto_551094 - BLOCK
      ?auto_551095 - BLOCK
      ?auto_551096 - BLOCK
      ?auto_551097 - BLOCK
      ?auto_551098 - BLOCK
    )
    :vars
    (
      ?auto_551099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_551098 ?auto_551099 ) ( ON-TABLE ?auto_551084 ) ( ON ?auto_551085 ?auto_551084 ) ( ON ?auto_551086 ?auto_551085 ) ( ON ?auto_551087 ?auto_551086 ) ( ON ?auto_551088 ?auto_551087 ) ( ON ?auto_551089 ?auto_551088 ) ( ON ?auto_551090 ?auto_551089 ) ( ON ?auto_551091 ?auto_551090 ) ( ON ?auto_551092 ?auto_551091 ) ( not ( = ?auto_551084 ?auto_551085 ) ) ( not ( = ?auto_551084 ?auto_551086 ) ) ( not ( = ?auto_551084 ?auto_551087 ) ) ( not ( = ?auto_551084 ?auto_551088 ) ) ( not ( = ?auto_551084 ?auto_551089 ) ) ( not ( = ?auto_551084 ?auto_551090 ) ) ( not ( = ?auto_551084 ?auto_551091 ) ) ( not ( = ?auto_551084 ?auto_551092 ) ) ( not ( = ?auto_551084 ?auto_551093 ) ) ( not ( = ?auto_551084 ?auto_551094 ) ) ( not ( = ?auto_551084 ?auto_551095 ) ) ( not ( = ?auto_551084 ?auto_551096 ) ) ( not ( = ?auto_551084 ?auto_551097 ) ) ( not ( = ?auto_551084 ?auto_551098 ) ) ( not ( = ?auto_551084 ?auto_551099 ) ) ( not ( = ?auto_551085 ?auto_551086 ) ) ( not ( = ?auto_551085 ?auto_551087 ) ) ( not ( = ?auto_551085 ?auto_551088 ) ) ( not ( = ?auto_551085 ?auto_551089 ) ) ( not ( = ?auto_551085 ?auto_551090 ) ) ( not ( = ?auto_551085 ?auto_551091 ) ) ( not ( = ?auto_551085 ?auto_551092 ) ) ( not ( = ?auto_551085 ?auto_551093 ) ) ( not ( = ?auto_551085 ?auto_551094 ) ) ( not ( = ?auto_551085 ?auto_551095 ) ) ( not ( = ?auto_551085 ?auto_551096 ) ) ( not ( = ?auto_551085 ?auto_551097 ) ) ( not ( = ?auto_551085 ?auto_551098 ) ) ( not ( = ?auto_551085 ?auto_551099 ) ) ( not ( = ?auto_551086 ?auto_551087 ) ) ( not ( = ?auto_551086 ?auto_551088 ) ) ( not ( = ?auto_551086 ?auto_551089 ) ) ( not ( = ?auto_551086 ?auto_551090 ) ) ( not ( = ?auto_551086 ?auto_551091 ) ) ( not ( = ?auto_551086 ?auto_551092 ) ) ( not ( = ?auto_551086 ?auto_551093 ) ) ( not ( = ?auto_551086 ?auto_551094 ) ) ( not ( = ?auto_551086 ?auto_551095 ) ) ( not ( = ?auto_551086 ?auto_551096 ) ) ( not ( = ?auto_551086 ?auto_551097 ) ) ( not ( = ?auto_551086 ?auto_551098 ) ) ( not ( = ?auto_551086 ?auto_551099 ) ) ( not ( = ?auto_551087 ?auto_551088 ) ) ( not ( = ?auto_551087 ?auto_551089 ) ) ( not ( = ?auto_551087 ?auto_551090 ) ) ( not ( = ?auto_551087 ?auto_551091 ) ) ( not ( = ?auto_551087 ?auto_551092 ) ) ( not ( = ?auto_551087 ?auto_551093 ) ) ( not ( = ?auto_551087 ?auto_551094 ) ) ( not ( = ?auto_551087 ?auto_551095 ) ) ( not ( = ?auto_551087 ?auto_551096 ) ) ( not ( = ?auto_551087 ?auto_551097 ) ) ( not ( = ?auto_551087 ?auto_551098 ) ) ( not ( = ?auto_551087 ?auto_551099 ) ) ( not ( = ?auto_551088 ?auto_551089 ) ) ( not ( = ?auto_551088 ?auto_551090 ) ) ( not ( = ?auto_551088 ?auto_551091 ) ) ( not ( = ?auto_551088 ?auto_551092 ) ) ( not ( = ?auto_551088 ?auto_551093 ) ) ( not ( = ?auto_551088 ?auto_551094 ) ) ( not ( = ?auto_551088 ?auto_551095 ) ) ( not ( = ?auto_551088 ?auto_551096 ) ) ( not ( = ?auto_551088 ?auto_551097 ) ) ( not ( = ?auto_551088 ?auto_551098 ) ) ( not ( = ?auto_551088 ?auto_551099 ) ) ( not ( = ?auto_551089 ?auto_551090 ) ) ( not ( = ?auto_551089 ?auto_551091 ) ) ( not ( = ?auto_551089 ?auto_551092 ) ) ( not ( = ?auto_551089 ?auto_551093 ) ) ( not ( = ?auto_551089 ?auto_551094 ) ) ( not ( = ?auto_551089 ?auto_551095 ) ) ( not ( = ?auto_551089 ?auto_551096 ) ) ( not ( = ?auto_551089 ?auto_551097 ) ) ( not ( = ?auto_551089 ?auto_551098 ) ) ( not ( = ?auto_551089 ?auto_551099 ) ) ( not ( = ?auto_551090 ?auto_551091 ) ) ( not ( = ?auto_551090 ?auto_551092 ) ) ( not ( = ?auto_551090 ?auto_551093 ) ) ( not ( = ?auto_551090 ?auto_551094 ) ) ( not ( = ?auto_551090 ?auto_551095 ) ) ( not ( = ?auto_551090 ?auto_551096 ) ) ( not ( = ?auto_551090 ?auto_551097 ) ) ( not ( = ?auto_551090 ?auto_551098 ) ) ( not ( = ?auto_551090 ?auto_551099 ) ) ( not ( = ?auto_551091 ?auto_551092 ) ) ( not ( = ?auto_551091 ?auto_551093 ) ) ( not ( = ?auto_551091 ?auto_551094 ) ) ( not ( = ?auto_551091 ?auto_551095 ) ) ( not ( = ?auto_551091 ?auto_551096 ) ) ( not ( = ?auto_551091 ?auto_551097 ) ) ( not ( = ?auto_551091 ?auto_551098 ) ) ( not ( = ?auto_551091 ?auto_551099 ) ) ( not ( = ?auto_551092 ?auto_551093 ) ) ( not ( = ?auto_551092 ?auto_551094 ) ) ( not ( = ?auto_551092 ?auto_551095 ) ) ( not ( = ?auto_551092 ?auto_551096 ) ) ( not ( = ?auto_551092 ?auto_551097 ) ) ( not ( = ?auto_551092 ?auto_551098 ) ) ( not ( = ?auto_551092 ?auto_551099 ) ) ( not ( = ?auto_551093 ?auto_551094 ) ) ( not ( = ?auto_551093 ?auto_551095 ) ) ( not ( = ?auto_551093 ?auto_551096 ) ) ( not ( = ?auto_551093 ?auto_551097 ) ) ( not ( = ?auto_551093 ?auto_551098 ) ) ( not ( = ?auto_551093 ?auto_551099 ) ) ( not ( = ?auto_551094 ?auto_551095 ) ) ( not ( = ?auto_551094 ?auto_551096 ) ) ( not ( = ?auto_551094 ?auto_551097 ) ) ( not ( = ?auto_551094 ?auto_551098 ) ) ( not ( = ?auto_551094 ?auto_551099 ) ) ( not ( = ?auto_551095 ?auto_551096 ) ) ( not ( = ?auto_551095 ?auto_551097 ) ) ( not ( = ?auto_551095 ?auto_551098 ) ) ( not ( = ?auto_551095 ?auto_551099 ) ) ( not ( = ?auto_551096 ?auto_551097 ) ) ( not ( = ?auto_551096 ?auto_551098 ) ) ( not ( = ?auto_551096 ?auto_551099 ) ) ( not ( = ?auto_551097 ?auto_551098 ) ) ( not ( = ?auto_551097 ?auto_551099 ) ) ( not ( = ?auto_551098 ?auto_551099 ) ) ( ON ?auto_551097 ?auto_551098 ) ( ON ?auto_551096 ?auto_551097 ) ( ON ?auto_551095 ?auto_551096 ) ( ON ?auto_551094 ?auto_551095 ) ( CLEAR ?auto_551092 ) ( ON ?auto_551093 ?auto_551094 ) ( CLEAR ?auto_551093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_551084 ?auto_551085 ?auto_551086 ?auto_551087 ?auto_551088 ?auto_551089 ?auto_551090 ?auto_551091 ?auto_551092 ?auto_551093 )
      ( MAKE-15PILE ?auto_551084 ?auto_551085 ?auto_551086 ?auto_551087 ?auto_551088 ?auto_551089 ?auto_551090 ?auto_551091 ?auto_551092 ?auto_551093 ?auto_551094 ?auto_551095 ?auto_551096 ?auto_551097 ?auto_551098 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_551146 - BLOCK
      ?auto_551147 - BLOCK
      ?auto_551148 - BLOCK
      ?auto_551149 - BLOCK
      ?auto_551150 - BLOCK
      ?auto_551151 - BLOCK
      ?auto_551152 - BLOCK
      ?auto_551153 - BLOCK
      ?auto_551154 - BLOCK
      ?auto_551155 - BLOCK
      ?auto_551156 - BLOCK
      ?auto_551157 - BLOCK
      ?auto_551158 - BLOCK
      ?auto_551159 - BLOCK
      ?auto_551160 - BLOCK
    )
    :vars
    (
      ?auto_551161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_551160 ?auto_551161 ) ( ON-TABLE ?auto_551146 ) ( ON ?auto_551147 ?auto_551146 ) ( ON ?auto_551148 ?auto_551147 ) ( ON ?auto_551149 ?auto_551148 ) ( ON ?auto_551150 ?auto_551149 ) ( ON ?auto_551151 ?auto_551150 ) ( ON ?auto_551152 ?auto_551151 ) ( ON ?auto_551153 ?auto_551152 ) ( not ( = ?auto_551146 ?auto_551147 ) ) ( not ( = ?auto_551146 ?auto_551148 ) ) ( not ( = ?auto_551146 ?auto_551149 ) ) ( not ( = ?auto_551146 ?auto_551150 ) ) ( not ( = ?auto_551146 ?auto_551151 ) ) ( not ( = ?auto_551146 ?auto_551152 ) ) ( not ( = ?auto_551146 ?auto_551153 ) ) ( not ( = ?auto_551146 ?auto_551154 ) ) ( not ( = ?auto_551146 ?auto_551155 ) ) ( not ( = ?auto_551146 ?auto_551156 ) ) ( not ( = ?auto_551146 ?auto_551157 ) ) ( not ( = ?auto_551146 ?auto_551158 ) ) ( not ( = ?auto_551146 ?auto_551159 ) ) ( not ( = ?auto_551146 ?auto_551160 ) ) ( not ( = ?auto_551146 ?auto_551161 ) ) ( not ( = ?auto_551147 ?auto_551148 ) ) ( not ( = ?auto_551147 ?auto_551149 ) ) ( not ( = ?auto_551147 ?auto_551150 ) ) ( not ( = ?auto_551147 ?auto_551151 ) ) ( not ( = ?auto_551147 ?auto_551152 ) ) ( not ( = ?auto_551147 ?auto_551153 ) ) ( not ( = ?auto_551147 ?auto_551154 ) ) ( not ( = ?auto_551147 ?auto_551155 ) ) ( not ( = ?auto_551147 ?auto_551156 ) ) ( not ( = ?auto_551147 ?auto_551157 ) ) ( not ( = ?auto_551147 ?auto_551158 ) ) ( not ( = ?auto_551147 ?auto_551159 ) ) ( not ( = ?auto_551147 ?auto_551160 ) ) ( not ( = ?auto_551147 ?auto_551161 ) ) ( not ( = ?auto_551148 ?auto_551149 ) ) ( not ( = ?auto_551148 ?auto_551150 ) ) ( not ( = ?auto_551148 ?auto_551151 ) ) ( not ( = ?auto_551148 ?auto_551152 ) ) ( not ( = ?auto_551148 ?auto_551153 ) ) ( not ( = ?auto_551148 ?auto_551154 ) ) ( not ( = ?auto_551148 ?auto_551155 ) ) ( not ( = ?auto_551148 ?auto_551156 ) ) ( not ( = ?auto_551148 ?auto_551157 ) ) ( not ( = ?auto_551148 ?auto_551158 ) ) ( not ( = ?auto_551148 ?auto_551159 ) ) ( not ( = ?auto_551148 ?auto_551160 ) ) ( not ( = ?auto_551148 ?auto_551161 ) ) ( not ( = ?auto_551149 ?auto_551150 ) ) ( not ( = ?auto_551149 ?auto_551151 ) ) ( not ( = ?auto_551149 ?auto_551152 ) ) ( not ( = ?auto_551149 ?auto_551153 ) ) ( not ( = ?auto_551149 ?auto_551154 ) ) ( not ( = ?auto_551149 ?auto_551155 ) ) ( not ( = ?auto_551149 ?auto_551156 ) ) ( not ( = ?auto_551149 ?auto_551157 ) ) ( not ( = ?auto_551149 ?auto_551158 ) ) ( not ( = ?auto_551149 ?auto_551159 ) ) ( not ( = ?auto_551149 ?auto_551160 ) ) ( not ( = ?auto_551149 ?auto_551161 ) ) ( not ( = ?auto_551150 ?auto_551151 ) ) ( not ( = ?auto_551150 ?auto_551152 ) ) ( not ( = ?auto_551150 ?auto_551153 ) ) ( not ( = ?auto_551150 ?auto_551154 ) ) ( not ( = ?auto_551150 ?auto_551155 ) ) ( not ( = ?auto_551150 ?auto_551156 ) ) ( not ( = ?auto_551150 ?auto_551157 ) ) ( not ( = ?auto_551150 ?auto_551158 ) ) ( not ( = ?auto_551150 ?auto_551159 ) ) ( not ( = ?auto_551150 ?auto_551160 ) ) ( not ( = ?auto_551150 ?auto_551161 ) ) ( not ( = ?auto_551151 ?auto_551152 ) ) ( not ( = ?auto_551151 ?auto_551153 ) ) ( not ( = ?auto_551151 ?auto_551154 ) ) ( not ( = ?auto_551151 ?auto_551155 ) ) ( not ( = ?auto_551151 ?auto_551156 ) ) ( not ( = ?auto_551151 ?auto_551157 ) ) ( not ( = ?auto_551151 ?auto_551158 ) ) ( not ( = ?auto_551151 ?auto_551159 ) ) ( not ( = ?auto_551151 ?auto_551160 ) ) ( not ( = ?auto_551151 ?auto_551161 ) ) ( not ( = ?auto_551152 ?auto_551153 ) ) ( not ( = ?auto_551152 ?auto_551154 ) ) ( not ( = ?auto_551152 ?auto_551155 ) ) ( not ( = ?auto_551152 ?auto_551156 ) ) ( not ( = ?auto_551152 ?auto_551157 ) ) ( not ( = ?auto_551152 ?auto_551158 ) ) ( not ( = ?auto_551152 ?auto_551159 ) ) ( not ( = ?auto_551152 ?auto_551160 ) ) ( not ( = ?auto_551152 ?auto_551161 ) ) ( not ( = ?auto_551153 ?auto_551154 ) ) ( not ( = ?auto_551153 ?auto_551155 ) ) ( not ( = ?auto_551153 ?auto_551156 ) ) ( not ( = ?auto_551153 ?auto_551157 ) ) ( not ( = ?auto_551153 ?auto_551158 ) ) ( not ( = ?auto_551153 ?auto_551159 ) ) ( not ( = ?auto_551153 ?auto_551160 ) ) ( not ( = ?auto_551153 ?auto_551161 ) ) ( not ( = ?auto_551154 ?auto_551155 ) ) ( not ( = ?auto_551154 ?auto_551156 ) ) ( not ( = ?auto_551154 ?auto_551157 ) ) ( not ( = ?auto_551154 ?auto_551158 ) ) ( not ( = ?auto_551154 ?auto_551159 ) ) ( not ( = ?auto_551154 ?auto_551160 ) ) ( not ( = ?auto_551154 ?auto_551161 ) ) ( not ( = ?auto_551155 ?auto_551156 ) ) ( not ( = ?auto_551155 ?auto_551157 ) ) ( not ( = ?auto_551155 ?auto_551158 ) ) ( not ( = ?auto_551155 ?auto_551159 ) ) ( not ( = ?auto_551155 ?auto_551160 ) ) ( not ( = ?auto_551155 ?auto_551161 ) ) ( not ( = ?auto_551156 ?auto_551157 ) ) ( not ( = ?auto_551156 ?auto_551158 ) ) ( not ( = ?auto_551156 ?auto_551159 ) ) ( not ( = ?auto_551156 ?auto_551160 ) ) ( not ( = ?auto_551156 ?auto_551161 ) ) ( not ( = ?auto_551157 ?auto_551158 ) ) ( not ( = ?auto_551157 ?auto_551159 ) ) ( not ( = ?auto_551157 ?auto_551160 ) ) ( not ( = ?auto_551157 ?auto_551161 ) ) ( not ( = ?auto_551158 ?auto_551159 ) ) ( not ( = ?auto_551158 ?auto_551160 ) ) ( not ( = ?auto_551158 ?auto_551161 ) ) ( not ( = ?auto_551159 ?auto_551160 ) ) ( not ( = ?auto_551159 ?auto_551161 ) ) ( not ( = ?auto_551160 ?auto_551161 ) ) ( ON ?auto_551159 ?auto_551160 ) ( ON ?auto_551158 ?auto_551159 ) ( ON ?auto_551157 ?auto_551158 ) ( ON ?auto_551156 ?auto_551157 ) ( ON ?auto_551155 ?auto_551156 ) ( CLEAR ?auto_551153 ) ( ON ?auto_551154 ?auto_551155 ) ( CLEAR ?auto_551154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_551146 ?auto_551147 ?auto_551148 ?auto_551149 ?auto_551150 ?auto_551151 ?auto_551152 ?auto_551153 ?auto_551154 )
      ( MAKE-15PILE ?auto_551146 ?auto_551147 ?auto_551148 ?auto_551149 ?auto_551150 ?auto_551151 ?auto_551152 ?auto_551153 ?auto_551154 ?auto_551155 ?auto_551156 ?auto_551157 ?auto_551158 ?auto_551159 ?auto_551160 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_551208 - BLOCK
      ?auto_551209 - BLOCK
      ?auto_551210 - BLOCK
      ?auto_551211 - BLOCK
      ?auto_551212 - BLOCK
      ?auto_551213 - BLOCK
      ?auto_551214 - BLOCK
      ?auto_551215 - BLOCK
      ?auto_551216 - BLOCK
      ?auto_551217 - BLOCK
      ?auto_551218 - BLOCK
      ?auto_551219 - BLOCK
      ?auto_551220 - BLOCK
      ?auto_551221 - BLOCK
      ?auto_551222 - BLOCK
    )
    :vars
    (
      ?auto_551223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_551222 ?auto_551223 ) ( ON-TABLE ?auto_551208 ) ( ON ?auto_551209 ?auto_551208 ) ( ON ?auto_551210 ?auto_551209 ) ( ON ?auto_551211 ?auto_551210 ) ( ON ?auto_551212 ?auto_551211 ) ( ON ?auto_551213 ?auto_551212 ) ( ON ?auto_551214 ?auto_551213 ) ( not ( = ?auto_551208 ?auto_551209 ) ) ( not ( = ?auto_551208 ?auto_551210 ) ) ( not ( = ?auto_551208 ?auto_551211 ) ) ( not ( = ?auto_551208 ?auto_551212 ) ) ( not ( = ?auto_551208 ?auto_551213 ) ) ( not ( = ?auto_551208 ?auto_551214 ) ) ( not ( = ?auto_551208 ?auto_551215 ) ) ( not ( = ?auto_551208 ?auto_551216 ) ) ( not ( = ?auto_551208 ?auto_551217 ) ) ( not ( = ?auto_551208 ?auto_551218 ) ) ( not ( = ?auto_551208 ?auto_551219 ) ) ( not ( = ?auto_551208 ?auto_551220 ) ) ( not ( = ?auto_551208 ?auto_551221 ) ) ( not ( = ?auto_551208 ?auto_551222 ) ) ( not ( = ?auto_551208 ?auto_551223 ) ) ( not ( = ?auto_551209 ?auto_551210 ) ) ( not ( = ?auto_551209 ?auto_551211 ) ) ( not ( = ?auto_551209 ?auto_551212 ) ) ( not ( = ?auto_551209 ?auto_551213 ) ) ( not ( = ?auto_551209 ?auto_551214 ) ) ( not ( = ?auto_551209 ?auto_551215 ) ) ( not ( = ?auto_551209 ?auto_551216 ) ) ( not ( = ?auto_551209 ?auto_551217 ) ) ( not ( = ?auto_551209 ?auto_551218 ) ) ( not ( = ?auto_551209 ?auto_551219 ) ) ( not ( = ?auto_551209 ?auto_551220 ) ) ( not ( = ?auto_551209 ?auto_551221 ) ) ( not ( = ?auto_551209 ?auto_551222 ) ) ( not ( = ?auto_551209 ?auto_551223 ) ) ( not ( = ?auto_551210 ?auto_551211 ) ) ( not ( = ?auto_551210 ?auto_551212 ) ) ( not ( = ?auto_551210 ?auto_551213 ) ) ( not ( = ?auto_551210 ?auto_551214 ) ) ( not ( = ?auto_551210 ?auto_551215 ) ) ( not ( = ?auto_551210 ?auto_551216 ) ) ( not ( = ?auto_551210 ?auto_551217 ) ) ( not ( = ?auto_551210 ?auto_551218 ) ) ( not ( = ?auto_551210 ?auto_551219 ) ) ( not ( = ?auto_551210 ?auto_551220 ) ) ( not ( = ?auto_551210 ?auto_551221 ) ) ( not ( = ?auto_551210 ?auto_551222 ) ) ( not ( = ?auto_551210 ?auto_551223 ) ) ( not ( = ?auto_551211 ?auto_551212 ) ) ( not ( = ?auto_551211 ?auto_551213 ) ) ( not ( = ?auto_551211 ?auto_551214 ) ) ( not ( = ?auto_551211 ?auto_551215 ) ) ( not ( = ?auto_551211 ?auto_551216 ) ) ( not ( = ?auto_551211 ?auto_551217 ) ) ( not ( = ?auto_551211 ?auto_551218 ) ) ( not ( = ?auto_551211 ?auto_551219 ) ) ( not ( = ?auto_551211 ?auto_551220 ) ) ( not ( = ?auto_551211 ?auto_551221 ) ) ( not ( = ?auto_551211 ?auto_551222 ) ) ( not ( = ?auto_551211 ?auto_551223 ) ) ( not ( = ?auto_551212 ?auto_551213 ) ) ( not ( = ?auto_551212 ?auto_551214 ) ) ( not ( = ?auto_551212 ?auto_551215 ) ) ( not ( = ?auto_551212 ?auto_551216 ) ) ( not ( = ?auto_551212 ?auto_551217 ) ) ( not ( = ?auto_551212 ?auto_551218 ) ) ( not ( = ?auto_551212 ?auto_551219 ) ) ( not ( = ?auto_551212 ?auto_551220 ) ) ( not ( = ?auto_551212 ?auto_551221 ) ) ( not ( = ?auto_551212 ?auto_551222 ) ) ( not ( = ?auto_551212 ?auto_551223 ) ) ( not ( = ?auto_551213 ?auto_551214 ) ) ( not ( = ?auto_551213 ?auto_551215 ) ) ( not ( = ?auto_551213 ?auto_551216 ) ) ( not ( = ?auto_551213 ?auto_551217 ) ) ( not ( = ?auto_551213 ?auto_551218 ) ) ( not ( = ?auto_551213 ?auto_551219 ) ) ( not ( = ?auto_551213 ?auto_551220 ) ) ( not ( = ?auto_551213 ?auto_551221 ) ) ( not ( = ?auto_551213 ?auto_551222 ) ) ( not ( = ?auto_551213 ?auto_551223 ) ) ( not ( = ?auto_551214 ?auto_551215 ) ) ( not ( = ?auto_551214 ?auto_551216 ) ) ( not ( = ?auto_551214 ?auto_551217 ) ) ( not ( = ?auto_551214 ?auto_551218 ) ) ( not ( = ?auto_551214 ?auto_551219 ) ) ( not ( = ?auto_551214 ?auto_551220 ) ) ( not ( = ?auto_551214 ?auto_551221 ) ) ( not ( = ?auto_551214 ?auto_551222 ) ) ( not ( = ?auto_551214 ?auto_551223 ) ) ( not ( = ?auto_551215 ?auto_551216 ) ) ( not ( = ?auto_551215 ?auto_551217 ) ) ( not ( = ?auto_551215 ?auto_551218 ) ) ( not ( = ?auto_551215 ?auto_551219 ) ) ( not ( = ?auto_551215 ?auto_551220 ) ) ( not ( = ?auto_551215 ?auto_551221 ) ) ( not ( = ?auto_551215 ?auto_551222 ) ) ( not ( = ?auto_551215 ?auto_551223 ) ) ( not ( = ?auto_551216 ?auto_551217 ) ) ( not ( = ?auto_551216 ?auto_551218 ) ) ( not ( = ?auto_551216 ?auto_551219 ) ) ( not ( = ?auto_551216 ?auto_551220 ) ) ( not ( = ?auto_551216 ?auto_551221 ) ) ( not ( = ?auto_551216 ?auto_551222 ) ) ( not ( = ?auto_551216 ?auto_551223 ) ) ( not ( = ?auto_551217 ?auto_551218 ) ) ( not ( = ?auto_551217 ?auto_551219 ) ) ( not ( = ?auto_551217 ?auto_551220 ) ) ( not ( = ?auto_551217 ?auto_551221 ) ) ( not ( = ?auto_551217 ?auto_551222 ) ) ( not ( = ?auto_551217 ?auto_551223 ) ) ( not ( = ?auto_551218 ?auto_551219 ) ) ( not ( = ?auto_551218 ?auto_551220 ) ) ( not ( = ?auto_551218 ?auto_551221 ) ) ( not ( = ?auto_551218 ?auto_551222 ) ) ( not ( = ?auto_551218 ?auto_551223 ) ) ( not ( = ?auto_551219 ?auto_551220 ) ) ( not ( = ?auto_551219 ?auto_551221 ) ) ( not ( = ?auto_551219 ?auto_551222 ) ) ( not ( = ?auto_551219 ?auto_551223 ) ) ( not ( = ?auto_551220 ?auto_551221 ) ) ( not ( = ?auto_551220 ?auto_551222 ) ) ( not ( = ?auto_551220 ?auto_551223 ) ) ( not ( = ?auto_551221 ?auto_551222 ) ) ( not ( = ?auto_551221 ?auto_551223 ) ) ( not ( = ?auto_551222 ?auto_551223 ) ) ( ON ?auto_551221 ?auto_551222 ) ( ON ?auto_551220 ?auto_551221 ) ( ON ?auto_551219 ?auto_551220 ) ( ON ?auto_551218 ?auto_551219 ) ( ON ?auto_551217 ?auto_551218 ) ( ON ?auto_551216 ?auto_551217 ) ( CLEAR ?auto_551214 ) ( ON ?auto_551215 ?auto_551216 ) ( CLEAR ?auto_551215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_551208 ?auto_551209 ?auto_551210 ?auto_551211 ?auto_551212 ?auto_551213 ?auto_551214 ?auto_551215 )
      ( MAKE-15PILE ?auto_551208 ?auto_551209 ?auto_551210 ?auto_551211 ?auto_551212 ?auto_551213 ?auto_551214 ?auto_551215 ?auto_551216 ?auto_551217 ?auto_551218 ?auto_551219 ?auto_551220 ?auto_551221 ?auto_551222 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_551270 - BLOCK
      ?auto_551271 - BLOCK
      ?auto_551272 - BLOCK
      ?auto_551273 - BLOCK
      ?auto_551274 - BLOCK
      ?auto_551275 - BLOCK
      ?auto_551276 - BLOCK
      ?auto_551277 - BLOCK
      ?auto_551278 - BLOCK
      ?auto_551279 - BLOCK
      ?auto_551280 - BLOCK
      ?auto_551281 - BLOCK
      ?auto_551282 - BLOCK
      ?auto_551283 - BLOCK
      ?auto_551284 - BLOCK
    )
    :vars
    (
      ?auto_551285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_551284 ?auto_551285 ) ( ON-TABLE ?auto_551270 ) ( ON ?auto_551271 ?auto_551270 ) ( ON ?auto_551272 ?auto_551271 ) ( ON ?auto_551273 ?auto_551272 ) ( ON ?auto_551274 ?auto_551273 ) ( ON ?auto_551275 ?auto_551274 ) ( not ( = ?auto_551270 ?auto_551271 ) ) ( not ( = ?auto_551270 ?auto_551272 ) ) ( not ( = ?auto_551270 ?auto_551273 ) ) ( not ( = ?auto_551270 ?auto_551274 ) ) ( not ( = ?auto_551270 ?auto_551275 ) ) ( not ( = ?auto_551270 ?auto_551276 ) ) ( not ( = ?auto_551270 ?auto_551277 ) ) ( not ( = ?auto_551270 ?auto_551278 ) ) ( not ( = ?auto_551270 ?auto_551279 ) ) ( not ( = ?auto_551270 ?auto_551280 ) ) ( not ( = ?auto_551270 ?auto_551281 ) ) ( not ( = ?auto_551270 ?auto_551282 ) ) ( not ( = ?auto_551270 ?auto_551283 ) ) ( not ( = ?auto_551270 ?auto_551284 ) ) ( not ( = ?auto_551270 ?auto_551285 ) ) ( not ( = ?auto_551271 ?auto_551272 ) ) ( not ( = ?auto_551271 ?auto_551273 ) ) ( not ( = ?auto_551271 ?auto_551274 ) ) ( not ( = ?auto_551271 ?auto_551275 ) ) ( not ( = ?auto_551271 ?auto_551276 ) ) ( not ( = ?auto_551271 ?auto_551277 ) ) ( not ( = ?auto_551271 ?auto_551278 ) ) ( not ( = ?auto_551271 ?auto_551279 ) ) ( not ( = ?auto_551271 ?auto_551280 ) ) ( not ( = ?auto_551271 ?auto_551281 ) ) ( not ( = ?auto_551271 ?auto_551282 ) ) ( not ( = ?auto_551271 ?auto_551283 ) ) ( not ( = ?auto_551271 ?auto_551284 ) ) ( not ( = ?auto_551271 ?auto_551285 ) ) ( not ( = ?auto_551272 ?auto_551273 ) ) ( not ( = ?auto_551272 ?auto_551274 ) ) ( not ( = ?auto_551272 ?auto_551275 ) ) ( not ( = ?auto_551272 ?auto_551276 ) ) ( not ( = ?auto_551272 ?auto_551277 ) ) ( not ( = ?auto_551272 ?auto_551278 ) ) ( not ( = ?auto_551272 ?auto_551279 ) ) ( not ( = ?auto_551272 ?auto_551280 ) ) ( not ( = ?auto_551272 ?auto_551281 ) ) ( not ( = ?auto_551272 ?auto_551282 ) ) ( not ( = ?auto_551272 ?auto_551283 ) ) ( not ( = ?auto_551272 ?auto_551284 ) ) ( not ( = ?auto_551272 ?auto_551285 ) ) ( not ( = ?auto_551273 ?auto_551274 ) ) ( not ( = ?auto_551273 ?auto_551275 ) ) ( not ( = ?auto_551273 ?auto_551276 ) ) ( not ( = ?auto_551273 ?auto_551277 ) ) ( not ( = ?auto_551273 ?auto_551278 ) ) ( not ( = ?auto_551273 ?auto_551279 ) ) ( not ( = ?auto_551273 ?auto_551280 ) ) ( not ( = ?auto_551273 ?auto_551281 ) ) ( not ( = ?auto_551273 ?auto_551282 ) ) ( not ( = ?auto_551273 ?auto_551283 ) ) ( not ( = ?auto_551273 ?auto_551284 ) ) ( not ( = ?auto_551273 ?auto_551285 ) ) ( not ( = ?auto_551274 ?auto_551275 ) ) ( not ( = ?auto_551274 ?auto_551276 ) ) ( not ( = ?auto_551274 ?auto_551277 ) ) ( not ( = ?auto_551274 ?auto_551278 ) ) ( not ( = ?auto_551274 ?auto_551279 ) ) ( not ( = ?auto_551274 ?auto_551280 ) ) ( not ( = ?auto_551274 ?auto_551281 ) ) ( not ( = ?auto_551274 ?auto_551282 ) ) ( not ( = ?auto_551274 ?auto_551283 ) ) ( not ( = ?auto_551274 ?auto_551284 ) ) ( not ( = ?auto_551274 ?auto_551285 ) ) ( not ( = ?auto_551275 ?auto_551276 ) ) ( not ( = ?auto_551275 ?auto_551277 ) ) ( not ( = ?auto_551275 ?auto_551278 ) ) ( not ( = ?auto_551275 ?auto_551279 ) ) ( not ( = ?auto_551275 ?auto_551280 ) ) ( not ( = ?auto_551275 ?auto_551281 ) ) ( not ( = ?auto_551275 ?auto_551282 ) ) ( not ( = ?auto_551275 ?auto_551283 ) ) ( not ( = ?auto_551275 ?auto_551284 ) ) ( not ( = ?auto_551275 ?auto_551285 ) ) ( not ( = ?auto_551276 ?auto_551277 ) ) ( not ( = ?auto_551276 ?auto_551278 ) ) ( not ( = ?auto_551276 ?auto_551279 ) ) ( not ( = ?auto_551276 ?auto_551280 ) ) ( not ( = ?auto_551276 ?auto_551281 ) ) ( not ( = ?auto_551276 ?auto_551282 ) ) ( not ( = ?auto_551276 ?auto_551283 ) ) ( not ( = ?auto_551276 ?auto_551284 ) ) ( not ( = ?auto_551276 ?auto_551285 ) ) ( not ( = ?auto_551277 ?auto_551278 ) ) ( not ( = ?auto_551277 ?auto_551279 ) ) ( not ( = ?auto_551277 ?auto_551280 ) ) ( not ( = ?auto_551277 ?auto_551281 ) ) ( not ( = ?auto_551277 ?auto_551282 ) ) ( not ( = ?auto_551277 ?auto_551283 ) ) ( not ( = ?auto_551277 ?auto_551284 ) ) ( not ( = ?auto_551277 ?auto_551285 ) ) ( not ( = ?auto_551278 ?auto_551279 ) ) ( not ( = ?auto_551278 ?auto_551280 ) ) ( not ( = ?auto_551278 ?auto_551281 ) ) ( not ( = ?auto_551278 ?auto_551282 ) ) ( not ( = ?auto_551278 ?auto_551283 ) ) ( not ( = ?auto_551278 ?auto_551284 ) ) ( not ( = ?auto_551278 ?auto_551285 ) ) ( not ( = ?auto_551279 ?auto_551280 ) ) ( not ( = ?auto_551279 ?auto_551281 ) ) ( not ( = ?auto_551279 ?auto_551282 ) ) ( not ( = ?auto_551279 ?auto_551283 ) ) ( not ( = ?auto_551279 ?auto_551284 ) ) ( not ( = ?auto_551279 ?auto_551285 ) ) ( not ( = ?auto_551280 ?auto_551281 ) ) ( not ( = ?auto_551280 ?auto_551282 ) ) ( not ( = ?auto_551280 ?auto_551283 ) ) ( not ( = ?auto_551280 ?auto_551284 ) ) ( not ( = ?auto_551280 ?auto_551285 ) ) ( not ( = ?auto_551281 ?auto_551282 ) ) ( not ( = ?auto_551281 ?auto_551283 ) ) ( not ( = ?auto_551281 ?auto_551284 ) ) ( not ( = ?auto_551281 ?auto_551285 ) ) ( not ( = ?auto_551282 ?auto_551283 ) ) ( not ( = ?auto_551282 ?auto_551284 ) ) ( not ( = ?auto_551282 ?auto_551285 ) ) ( not ( = ?auto_551283 ?auto_551284 ) ) ( not ( = ?auto_551283 ?auto_551285 ) ) ( not ( = ?auto_551284 ?auto_551285 ) ) ( ON ?auto_551283 ?auto_551284 ) ( ON ?auto_551282 ?auto_551283 ) ( ON ?auto_551281 ?auto_551282 ) ( ON ?auto_551280 ?auto_551281 ) ( ON ?auto_551279 ?auto_551280 ) ( ON ?auto_551278 ?auto_551279 ) ( ON ?auto_551277 ?auto_551278 ) ( CLEAR ?auto_551275 ) ( ON ?auto_551276 ?auto_551277 ) ( CLEAR ?auto_551276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_551270 ?auto_551271 ?auto_551272 ?auto_551273 ?auto_551274 ?auto_551275 ?auto_551276 )
      ( MAKE-15PILE ?auto_551270 ?auto_551271 ?auto_551272 ?auto_551273 ?auto_551274 ?auto_551275 ?auto_551276 ?auto_551277 ?auto_551278 ?auto_551279 ?auto_551280 ?auto_551281 ?auto_551282 ?auto_551283 ?auto_551284 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_551332 - BLOCK
      ?auto_551333 - BLOCK
      ?auto_551334 - BLOCK
      ?auto_551335 - BLOCK
      ?auto_551336 - BLOCK
      ?auto_551337 - BLOCK
      ?auto_551338 - BLOCK
      ?auto_551339 - BLOCK
      ?auto_551340 - BLOCK
      ?auto_551341 - BLOCK
      ?auto_551342 - BLOCK
      ?auto_551343 - BLOCK
      ?auto_551344 - BLOCK
      ?auto_551345 - BLOCK
      ?auto_551346 - BLOCK
    )
    :vars
    (
      ?auto_551347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_551346 ?auto_551347 ) ( ON-TABLE ?auto_551332 ) ( ON ?auto_551333 ?auto_551332 ) ( ON ?auto_551334 ?auto_551333 ) ( ON ?auto_551335 ?auto_551334 ) ( ON ?auto_551336 ?auto_551335 ) ( not ( = ?auto_551332 ?auto_551333 ) ) ( not ( = ?auto_551332 ?auto_551334 ) ) ( not ( = ?auto_551332 ?auto_551335 ) ) ( not ( = ?auto_551332 ?auto_551336 ) ) ( not ( = ?auto_551332 ?auto_551337 ) ) ( not ( = ?auto_551332 ?auto_551338 ) ) ( not ( = ?auto_551332 ?auto_551339 ) ) ( not ( = ?auto_551332 ?auto_551340 ) ) ( not ( = ?auto_551332 ?auto_551341 ) ) ( not ( = ?auto_551332 ?auto_551342 ) ) ( not ( = ?auto_551332 ?auto_551343 ) ) ( not ( = ?auto_551332 ?auto_551344 ) ) ( not ( = ?auto_551332 ?auto_551345 ) ) ( not ( = ?auto_551332 ?auto_551346 ) ) ( not ( = ?auto_551332 ?auto_551347 ) ) ( not ( = ?auto_551333 ?auto_551334 ) ) ( not ( = ?auto_551333 ?auto_551335 ) ) ( not ( = ?auto_551333 ?auto_551336 ) ) ( not ( = ?auto_551333 ?auto_551337 ) ) ( not ( = ?auto_551333 ?auto_551338 ) ) ( not ( = ?auto_551333 ?auto_551339 ) ) ( not ( = ?auto_551333 ?auto_551340 ) ) ( not ( = ?auto_551333 ?auto_551341 ) ) ( not ( = ?auto_551333 ?auto_551342 ) ) ( not ( = ?auto_551333 ?auto_551343 ) ) ( not ( = ?auto_551333 ?auto_551344 ) ) ( not ( = ?auto_551333 ?auto_551345 ) ) ( not ( = ?auto_551333 ?auto_551346 ) ) ( not ( = ?auto_551333 ?auto_551347 ) ) ( not ( = ?auto_551334 ?auto_551335 ) ) ( not ( = ?auto_551334 ?auto_551336 ) ) ( not ( = ?auto_551334 ?auto_551337 ) ) ( not ( = ?auto_551334 ?auto_551338 ) ) ( not ( = ?auto_551334 ?auto_551339 ) ) ( not ( = ?auto_551334 ?auto_551340 ) ) ( not ( = ?auto_551334 ?auto_551341 ) ) ( not ( = ?auto_551334 ?auto_551342 ) ) ( not ( = ?auto_551334 ?auto_551343 ) ) ( not ( = ?auto_551334 ?auto_551344 ) ) ( not ( = ?auto_551334 ?auto_551345 ) ) ( not ( = ?auto_551334 ?auto_551346 ) ) ( not ( = ?auto_551334 ?auto_551347 ) ) ( not ( = ?auto_551335 ?auto_551336 ) ) ( not ( = ?auto_551335 ?auto_551337 ) ) ( not ( = ?auto_551335 ?auto_551338 ) ) ( not ( = ?auto_551335 ?auto_551339 ) ) ( not ( = ?auto_551335 ?auto_551340 ) ) ( not ( = ?auto_551335 ?auto_551341 ) ) ( not ( = ?auto_551335 ?auto_551342 ) ) ( not ( = ?auto_551335 ?auto_551343 ) ) ( not ( = ?auto_551335 ?auto_551344 ) ) ( not ( = ?auto_551335 ?auto_551345 ) ) ( not ( = ?auto_551335 ?auto_551346 ) ) ( not ( = ?auto_551335 ?auto_551347 ) ) ( not ( = ?auto_551336 ?auto_551337 ) ) ( not ( = ?auto_551336 ?auto_551338 ) ) ( not ( = ?auto_551336 ?auto_551339 ) ) ( not ( = ?auto_551336 ?auto_551340 ) ) ( not ( = ?auto_551336 ?auto_551341 ) ) ( not ( = ?auto_551336 ?auto_551342 ) ) ( not ( = ?auto_551336 ?auto_551343 ) ) ( not ( = ?auto_551336 ?auto_551344 ) ) ( not ( = ?auto_551336 ?auto_551345 ) ) ( not ( = ?auto_551336 ?auto_551346 ) ) ( not ( = ?auto_551336 ?auto_551347 ) ) ( not ( = ?auto_551337 ?auto_551338 ) ) ( not ( = ?auto_551337 ?auto_551339 ) ) ( not ( = ?auto_551337 ?auto_551340 ) ) ( not ( = ?auto_551337 ?auto_551341 ) ) ( not ( = ?auto_551337 ?auto_551342 ) ) ( not ( = ?auto_551337 ?auto_551343 ) ) ( not ( = ?auto_551337 ?auto_551344 ) ) ( not ( = ?auto_551337 ?auto_551345 ) ) ( not ( = ?auto_551337 ?auto_551346 ) ) ( not ( = ?auto_551337 ?auto_551347 ) ) ( not ( = ?auto_551338 ?auto_551339 ) ) ( not ( = ?auto_551338 ?auto_551340 ) ) ( not ( = ?auto_551338 ?auto_551341 ) ) ( not ( = ?auto_551338 ?auto_551342 ) ) ( not ( = ?auto_551338 ?auto_551343 ) ) ( not ( = ?auto_551338 ?auto_551344 ) ) ( not ( = ?auto_551338 ?auto_551345 ) ) ( not ( = ?auto_551338 ?auto_551346 ) ) ( not ( = ?auto_551338 ?auto_551347 ) ) ( not ( = ?auto_551339 ?auto_551340 ) ) ( not ( = ?auto_551339 ?auto_551341 ) ) ( not ( = ?auto_551339 ?auto_551342 ) ) ( not ( = ?auto_551339 ?auto_551343 ) ) ( not ( = ?auto_551339 ?auto_551344 ) ) ( not ( = ?auto_551339 ?auto_551345 ) ) ( not ( = ?auto_551339 ?auto_551346 ) ) ( not ( = ?auto_551339 ?auto_551347 ) ) ( not ( = ?auto_551340 ?auto_551341 ) ) ( not ( = ?auto_551340 ?auto_551342 ) ) ( not ( = ?auto_551340 ?auto_551343 ) ) ( not ( = ?auto_551340 ?auto_551344 ) ) ( not ( = ?auto_551340 ?auto_551345 ) ) ( not ( = ?auto_551340 ?auto_551346 ) ) ( not ( = ?auto_551340 ?auto_551347 ) ) ( not ( = ?auto_551341 ?auto_551342 ) ) ( not ( = ?auto_551341 ?auto_551343 ) ) ( not ( = ?auto_551341 ?auto_551344 ) ) ( not ( = ?auto_551341 ?auto_551345 ) ) ( not ( = ?auto_551341 ?auto_551346 ) ) ( not ( = ?auto_551341 ?auto_551347 ) ) ( not ( = ?auto_551342 ?auto_551343 ) ) ( not ( = ?auto_551342 ?auto_551344 ) ) ( not ( = ?auto_551342 ?auto_551345 ) ) ( not ( = ?auto_551342 ?auto_551346 ) ) ( not ( = ?auto_551342 ?auto_551347 ) ) ( not ( = ?auto_551343 ?auto_551344 ) ) ( not ( = ?auto_551343 ?auto_551345 ) ) ( not ( = ?auto_551343 ?auto_551346 ) ) ( not ( = ?auto_551343 ?auto_551347 ) ) ( not ( = ?auto_551344 ?auto_551345 ) ) ( not ( = ?auto_551344 ?auto_551346 ) ) ( not ( = ?auto_551344 ?auto_551347 ) ) ( not ( = ?auto_551345 ?auto_551346 ) ) ( not ( = ?auto_551345 ?auto_551347 ) ) ( not ( = ?auto_551346 ?auto_551347 ) ) ( ON ?auto_551345 ?auto_551346 ) ( ON ?auto_551344 ?auto_551345 ) ( ON ?auto_551343 ?auto_551344 ) ( ON ?auto_551342 ?auto_551343 ) ( ON ?auto_551341 ?auto_551342 ) ( ON ?auto_551340 ?auto_551341 ) ( ON ?auto_551339 ?auto_551340 ) ( ON ?auto_551338 ?auto_551339 ) ( CLEAR ?auto_551336 ) ( ON ?auto_551337 ?auto_551338 ) ( CLEAR ?auto_551337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_551332 ?auto_551333 ?auto_551334 ?auto_551335 ?auto_551336 ?auto_551337 )
      ( MAKE-15PILE ?auto_551332 ?auto_551333 ?auto_551334 ?auto_551335 ?auto_551336 ?auto_551337 ?auto_551338 ?auto_551339 ?auto_551340 ?auto_551341 ?auto_551342 ?auto_551343 ?auto_551344 ?auto_551345 ?auto_551346 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_551394 - BLOCK
      ?auto_551395 - BLOCK
      ?auto_551396 - BLOCK
      ?auto_551397 - BLOCK
      ?auto_551398 - BLOCK
      ?auto_551399 - BLOCK
      ?auto_551400 - BLOCK
      ?auto_551401 - BLOCK
      ?auto_551402 - BLOCK
      ?auto_551403 - BLOCK
      ?auto_551404 - BLOCK
      ?auto_551405 - BLOCK
      ?auto_551406 - BLOCK
      ?auto_551407 - BLOCK
      ?auto_551408 - BLOCK
    )
    :vars
    (
      ?auto_551409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_551408 ?auto_551409 ) ( ON-TABLE ?auto_551394 ) ( ON ?auto_551395 ?auto_551394 ) ( ON ?auto_551396 ?auto_551395 ) ( ON ?auto_551397 ?auto_551396 ) ( not ( = ?auto_551394 ?auto_551395 ) ) ( not ( = ?auto_551394 ?auto_551396 ) ) ( not ( = ?auto_551394 ?auto_551397 ) ) ( not ( = ?auto_551394 ?auto_551398 ) ) ( not ( = ?auto_551394 ?auto_551399 ) ) ( not ( = ?auto_551394 ?auto_551400 ) ) ( not ( = ?auto_551394 ?auto_551401 ) ) ( not ( = ?auto_551394 ?auto_551402 ) ) ( not ( = ?auto_551394 ?auto_551403 ) ) ( not ( = ?auto_551394 ?auto_551404 ) ) ( not ( = ?auto_551394 ?auto_551405 ) ) ( not ( = ?auto_551394 ?auto_551406 ) ) ( not ( = ?auto_551394 ?auto_551407 ) ) ( not ( = ?auto_551394 ?auto_551408 ) ) ( not ( = ?auto_551394 ?auto_551409 ) ) ( not ( = ?auto_551395 ?auto_551396 ) ) ( not ( = ?auto_551395 ?auto_551397 ) ) ( not ( = ?auto_551395 ?auto_551398 ) ) ( not ( = ?auto_551395 ?auto_551399 ) ) ( not ( = ?auto_551395 ?auto_551400 ) ) ( not ( = ?auto_551395 ?auto_551401 ) ) ( not ( = ?auto_551395 ?auto_551402 ) ) ( not ( = ?auto_551395 ?auto_551403 ) ) ( not ( = ?auto_551395 ?auto_551404 ) ) ( not ( = ?auto_551395 ?auto_551405 ) ) ( not ( = ?auto_551395 ?auto_551406 ) ) ( not ( = ?auto_551395 ?auto_551407 ) ) ( not ( = ?auto_551395 ?auto_551408 ) ) ( not ( = ?auto_551395 ?auto_551409 ) ) ( not ( = ?auto_551396 ?auto_551397 ) ) ( not ( = ?auto_551396 ?auto_551398 ) ) ( not ( = ?auto_551396 ?auto_551399 ) ) ( not ( = ?auto_551396 ?auto_551400 ) ) ( not ( = ?auto_551396 ?auto_551401 ) ) ( not ( = ?auto_551396 ?auto_551402 ) ) ( not ( = ?auto_551396 ?auto_551403 ) ) ( not ( = ?auto_551396 ?auto_551404 ) ) ( not ( = ?auto_551396 ?auto_551405 ) ) ( not ( = ?auto_551396 ?auto_551406 ) ) ( not ( = ?auto_551396 ?auto_551407 ) ) ( not ( = ?auto_551396 ?auto_551408 ) ) ( not ( = ?auto_551396 ?auto_551409 ) ) ( not ( = ?auto_551397 ?auto_551398 ) ) ( not ( = ?auto_551397 ?auto_551399 ) ) ( not ( = ?auto_551397 ?auto_551400 ) ) ( not ( = ?auto_551397 ?auto_551401 ) ) ( not ( = ?auto_551397 ?auto_551402 ) ) ( not ( = ?auto_551397 ?auto_551403 ) ) ( not ( = ?auto_551397 ?auto_551404 ) ) ( not ( = ?auto_551397 ?auto_551405 ) ) ( not ( = ?auto_551397 ?auto_551406 ) ) ( not ( = ?auto_551397 ?auto_551407 ) ) ( not ( = ?auto_551397 ?auto_551408 ) ) ( not ( = ?auto_551397 ?auto_551409 ) ) ( not ( = ?auto_551398 ?auto_551399 ) ) ( not ( = ?auto_551398 ?auto_551400 ) ) ( not ( = ?auto_551398 ?auto_551401 ) ) ( not ( = ?auto_551398 ?auto_551402 ) ) ( not ( = ?auto_551398 ?auto_551403 ) ) ( not ( = ?auto_551398 ?auto_551404 ) ) ( not ( = ?auto_551398 ?auto_551405 ) ) ( not ( = ?auto_551398 ?auto_551406 ) ) ( not ( = ?auto_551398 ?auto_551407 ) ) ( not ( = ?auto_551398 ?auto_551408 ) ) ( not ( = ?auto_551398 ?auto_551409 ) ) ( not ( = ?auto_551399 ?auto_551400 ) ) ( not ( = ?auto_551399 ?auto_551401 ) ) ( not ( = ?auto_551399 ?auto_551402 ) ) ( not ( = ?auto_551399 ?auto_551403 ) ) ( not ( = ?auto_551399 ?auto_551404 ) ) ( not ( = ?auto_551399 ?auto_551405 ) ) ( not ( = ?auto_551399 ?auto_551406 ) ) ( not ( = ?auto_551399 ?auto_551407 ) ) ( not ( = ?auto_551399 ?auto_551408 ) ) ( not ( = ?auto_551399 ?auto_551409 ) ) ( not ( = ?auto_551400 ?auto_551401 ) ) ( not ( = ?auto_551400 ?auto_551402 ) ) ( not ( = ?auto_551400 ?auto_551403 ) ) ( not ( = ?auto_551400 ?auto_551404 ) ) ( not ( = ?auto_551400 ?auto_551405 ) ) ( not ( = ?auto_551400 ?auto_551406 ) ) ( not ( = ?auto_551400 ?auto_551407 ) ) ( not ( = ?auto_551400 ?auto_551408 ) ) ( not ( = ?auto_551400 ?auto_551409 ) ) ( not ( = ?auto_551401 ?auto_551402 ) ) ( not ( = ?auto_551401 ?auto_551403 ) ) ( not ( = ?auto_551401 ?auto_551404 ) ) ( not ( = ?auto_551401 ?auto_551405 ) ) ( not ( = ?auto_551401 ?auto_551406 ) ) ( not ( = ?auto_551401 ?auto_551407 ) ) ( not ( = ?auto_551401 ?auto_551408 ) ) ( not ( = ?auto_551401 ?auto_551409 ) ) ( not ( = ?auto_551402 ?auto_551403 ) ) ( not ( = ?auto_551402 ?auto_551404 ) ) ( not ( = ?auto_551402 ?auto_551405 ) ) ( not ( = ?auto_551402 ?auto_551406 ) ) ( not ( = ?auto_551402 ?auto_551407 ) ) ( not ( = ?auto_551402 ?auto_551408 ) ) ( not ( = ?auto_551402 ?auto_551409 ) ) ( not ( = ?auto_551403 ?auto_551404 ) ) ( not ( = ?auto_551403 ?auto_551405 ) ) ( not ( = ?auto_551403 ?auto_551406 ) ) ( not ( = ?auto_551403 ?auto_551407 ) ) ( not ( = ?auto_551403 ?auto_551408 ) ) ( not ( = ?auto_551403 ?auto_551409 ) ) ( not ( = ?auto_551404 ?auto_551405 ) ) ( not ( = ?auto_551404 ?auto_551406 ) ) ( not ( = ?auto_551404 ?auto_551407 ) ) ( not ( = ?auto_551404 ?auto_551408 ) ) ( not ( = ?auto_551404 ?auto_551409 ) ) ( not ( = ?auto_551405 ?auto_551406 ) ) ( not ( = ?auto_551405 ?auto_551407 ) ) ( not ( = ?auto_551405 ?auto_551408 ) ) ( not ( = ?auto_551405 ?auto_551409 ) ) ( not ( = ?auto_551406 ?auto_551407 ) ) ( not ( = ?auto_551406 ?auto_551408 ) ) ( not ( = ?auto_551406 ?auto_551409 ) ) ( not ( = ?auto_551407 ?auto_551408 ) ) ( not ( = ?auto_551407 ?auto_551409 ) ) ( not ( = ?auto_551408 ?auto_551409 ) ) ( ON ?auto_551407 ?auto_551408 ) ( ON ?auto_551406 ?auto_551407 ) ( ON ?auto_551405 ?auto_551406 ) ( ON ?auto_551404 ?auto_551405 ) ( ON ?auto_551403 ?auto_551404 ) ( ON ?auto_551402 ?auto_551403 ) ( ON ?auto_551401 ?auto_551402 ) ( ON ?auto_551400 ?auto_551401 ) ( ON ?auto_551399 ?auto_551400 ) ( CLEAR ?auto_551397 ) ( ON ?auto_551398 ?auto_551399 ) ( CLEAR ?auto_551398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_551394 ?auto_551395 ?auto_551396 ?auto_551397 ?auto_551398 )
      ( MAKE-15PILE ?auto_551394 ?auto_551395 ?auto_551396 ?auto_551397 ?auto_551398 ?auto_551399 ?auto_551400 ?auto_551401 ?auto_551402 ?auto_551403 ?auto_551404 ?auto_551405 ?auto_551406 ?auto_551407 ?auto_551408 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_551456 - BLOCK
      ?auto_551457 - BLOCK
      ?auto_551458 - BLOCK
      ?auto_551459 - BLOCK
      ?auto_551460 - BLOCK
      ?auto_551461 - BLOCK
      ?auto_551462 - BLOCK
      ?auto_551463 - BLOCK
      ?auto_551464 - BLOCK
      ?auto_551465 - BLOCK
      ?auto_551466 - BLOCK
      ?auto_551467 - BLOCK
      ?auto_551468 - BLOCK
      ?auto_551469 - BLOCK
      ?auto_551470 - BLOCK
    )
    :vars
    (
      ?auto_551471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_551470 ?auto_551471 ) ( ON-TABLE ?auto_551456 ) ( ON ?auto_551457 ?auto_551456 ) ( ON ?auto_551458 ?auto_551457 ) ( not ( = ?auto_551456 ?auto_551457 ) ) ( not ( = ?auto_551456 ?auto_551458 ) ) ( not ( = ?auto_551456 ?auto_551459 ) ) ( not ( = ?auto_551456 ?auto_551460 ) ) ( not ( = ?auto_551456 ?auto_551461 ) ) ( not ( = ?auto_551456 ?auto_551462 ) ) ( not ( = ?auto_551456 ?auto_551463 ) ) ( not ( = ?auto_551456 ?auto_551464 ) ) ( not ( = ?auto_551456 ?auto_551465 ) ) ( not ( = ?auto_551456 ?auto_551466 ) ) ( not ( = ?auto_551456 ?auto_551467 ) ) ( not ( = ?auto_551456 ?auto_551468 ) ) ( not ( = ?auto_551456 ?auto_551469 ) ) ( not ( = ?auto_551456 ?auto_551470 ) ) ( not ( = ?auto_551456 ?auto_551471 ) ) ( not ( = ?auto_551457 ?auto_551458 ) ) ( not ( = ?auto_551457 ?auto_551459 ) ) ( not ( = ?auto_551457 ?auto_551460 ) ) ( not ( = ?auto_551457 ?auto_551461 ) ) ( not ( = ?auto_551457 ?auto_551462 ) ) ( not ( = ?auto_551457 ?auto_551463 ) ) ( not ( = ?auto_551457 ?auto_551464 ) ) ( not ( = ?auto_551457 ?auto_551465 ) ) ( not ( = ?auto_551457 ?auto_551466 ) ) ( not ( = ?auto_551457 ?auto_551467 ) ) ( not ( = ?auto_551457 ?auto_551468 ) ) ( not ( = ?auto_551457 ?auto_551469 ) ) ( not ( = ?auto_551457 ?auto_551470 ) ) ( not ( = ?auto_551457 ?auto_551471 ) ) ( not ( = ?auto_551458 ?auto_551459 ) ) ( not ( = ?auto_551458 ?auto_551460 ) ) ( not ( = ?auto_551458 ?auto_551461 ) ) ( not ( = ?auto_551458 ?auto_551462 ) ) ( not ( = ?auto_551458 ?auto_551463 ) ) ( not ( = ?auto_551458 ?auto_551464 ) ) ( not ( = ?auto_551458 ?auto_551465 ) ) ( not ( = ?auto_551458 ?auto_551466 ) ) ( not ( = ?auto_551458 ?auto_551467 ) ) ( not ( = ?auto_551458 ?auto_551468 ) ) ( not ( = ?auto_551458 ?auto_551469 ) ) ( not ( = ?auto_551458 ?auto_551470 ) ) ( not ( = ?auto_551458 ?auto_551471 ) ) ( not ( = ?auto_551459 ?auto_551460 ) ) ( not ( = ?auto_551459 ?auto_551461 ) ) ( not ( = ?auto_551459 ?auto_551462 ) ) ( not ( = ?auto_551459 ?auto_551463 ) ) ( not ( = ?auto_551459 ?auto_551464 ) ) ( not ( = ?auto_551459 ?auto_551465 ) ) ( not ( = ?auto_551459 ?auto_551466 ) ) ( not ( = ?auto_551459 ?auto_551467 ) ) ( not ( = ?auto_551459 ?auto_551468 ) ) ( not ( = ?auto_551459 ?auto_551469 ) ) ( not ( = ?auto_551459 ?auto_551470 ) ) ( not ( = ?auto_551459 ?auto_551471 ) ) ( not ( = ?auto_551460 ?auto_551461 ) ) ( not ( = ?auto_551460 ?auto_551462 ) ) ( not ( = ?auto_551460 ?auto_551463 ) ) ( not ( = ?auto_551460 ?auto_551464 ) ) ( not ( = ?auto_551460 ?auto_551465 ) ) ( not ( = ?auto_551460 ?auto_551466 ) ) ( not ( = ?auto_551460 ?auto_551467 ) ) ( not ( = ?auto_551460 ?auto_551468 ) ) ( not ( = ?auto_551460 ?auto_551469 ) ) ( not ( = ?auto_551460 ?auto_551470 ) ) ( not ( = ?auto_551460 ?auto_551471 ) ) ( not ( = ?auto_551461 ?auto_551462 ) ) ( not ( = ?auto_551461 ?auto_551463 ) ) ( not ( = ?auto_551461 ?auto_551464 ) ) ( not ( = ?auto_551461 ?auto_551465 ) ) ( not ( = ?auto_551461 ?auto_551466 ) ) ( not ( = ?auto_551461 ?auto_551467 ) ) ( not ( = ?auto_551461 ?auto_551468 ) ) ( not ( = ?auto_551461 ?auto_551469 ) ) ( not ( = ?auto_551461 ?auto_551470 ) ) ( not ( = ?auto_551461 ?auto_551471 ) ) ( not ( = ?auto_551462 ?auto_551463 ) ) ( not ( = ?auto_551462 ?auto_551464 ) ) ( not ( = ?auto_551462 ?auto_551465 ) ) ( not ( = ?auto_551462 ?auto_551466 ) ) ( not ( = ?auto_551462 ?auto_551467 ) ) ( not ( = ?auto_551462 ?auto_551468 ) ) ( not ( = ?auto_551462 ?auto_551469 ) ) ( not ( = ?auto_551462 ?auto_551470 ) ) ( not ( = ?auto_551462 ?auto_551471 ) ) ( not ( = ?auto_551463 ?auto_551464 ) ) ( not ( = ?auto_551463 ?auto_551465 ) ) ( not ( = ?auto_551463 ?auto_551466 ) ) ( not ( = ?auto_551463 ?auto_551467 ) ) ( not ( = ?auto_551463 ?auto_551468 ) ) ( not ( = ?auto_551463 ?auto_551469 ) ) ( not ( = ?auto_551463 ?auto_551470 ) ) ( not ( = ?auto_551463 ?auto_551471 ) ) ( not ( = ?auto_551464 ?auto_551465 ) ) ( not ( = ?auto_551464 ?auto_551466 ) ) ( not ( = ?auto_551464 ?auto_551467 ) ) ( not ( = ?auto_551464 ?auto_551468 ) ) ( not ( = ?auto_551464 ?auto_551469 ) ) ( not ( = ?auto_551464 ?auto_551470 ) ) ( not ( = ?auto_551464 ?auto_551471 ) ) ( not ( = ?auto_551465 ?auto_551466 ) ) ( not ( = ?auto_551465 ?auto_551467 ) ) ( not ( = ?auto_551465 ?auto_551468 ) ) ( not ( = ?auto_551465 ?auto_551469 ) ) ( not ( = ?auto_551465 ?auto_551470 ) ) ( not ( = ?auto_551465 ?auto_551471 ) ) ( not ( = ?auto_551466 ?auto_551467 ) ) ( not ( = ?auto_551466 ?auto_551468 ) ) ( not ( = ?auto_551466 ?auto_551469 ) ) ( not ( = ?auto_551466 ?auto_551470 ) ) ( not ( = ?auto_551466 ?auto_551471 ) ) ( not ( = ?auto_551467 ?auto_551468 ) ) ( not ( = ?auto_551467 ?auto_551469 ) ) ( not ( = ?auto_551467 ?auto_551470 ) ) ( not ( = ?auto_551467 ?auto_551471 ) ) ( not ( = ?auto_551468 ?auto_551469 ) ) ( not ( = ?auto_551468 ?auto_551470 ) ) ( not ( = ?auto_551468 ?auto_551471 ) ) ( not ( = ?auto_551469 ?auto_551470 ) ) ( not ( = ?auto_551469 ?auto_551471 ) ) ( not ( = ?auto_551470 ?auto_551471 ) ) ( ON ?auto_551469 ?auto_551470 ) ( ON ?auto_551468 ?auto_551469 ) ( ON ?auto_551467 ?auto_551468 ) ( ON ?auto_551466 ?auto_551467 ) ( ON ?auto_551465 ?auto_551466 ) ( ON ?auto_551464 ?auto_551465 ) ( ON ?auto_551463 ?auto_551464 ) ( ON ?auto_551462 ?auto_551463 ) ( ON ?auto_551461 ?auto_551462 ) ( ON ?auto_551460 ?auto_551461 ) ( CLEAR ?auto_551458 ) ( ON ?auto_551459 ?auto_551460 ) ( CLEAR ?auto_551459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_551456 ?auto_551457 ?auto_551458 ?auto_551459 )
      ( MAKE-15PILE ?auto_551456 ?auto_551457 ?auto_551458 ?auto_551459 ?auto_551460 ?auto_551461 ?auto_551462 ?auto_551463 ?auto_551464 ?auto_551465 ?auto_551466 ?auto_551467 ?auto_551468 ?auto_551469 ?auto_551470 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_551518 - BLOCK
      ?auto_551519 - BLOCK
      ?auto_551520 - BLOCK
      ?auto_551521 - BLOCK
      ?auto_551522 - BLOCK
      ?auto_551523 - BLOCK
      ?auto_551524 - BLOCK
      ?auto_551525 - BLOCK
      ?auto_551526 - BLOCK
      ?auto_551527 - BLOCK
      ?auto_551528 - BLOCK
      ?auto_551529 - BLOCK
      ?auto_551530 - BLOCK
      ?auto_551531 - BLOCK
      ?auto_551532 - BLOCK
    )
    :vars
    (
      ?auto_551533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_551532 ?auto_551533 ) ( ON-TABLE ?auto_551518 ) ( ON ?auto_551519 ?auto_551518 ) ( not ( = ?auto_551518 ?auto_551519 ) ) ( not ( = ?auto_551518 ?auto_551520 ) ) ( not ( = ?auto_551518 ?auto_551521 ) ) ( not ( = ?auto_551518 ?auto_551522 ) ) ( not ( = ?auto_551518 ?auto_551523 ) ) ( not ( = ?auto_551518 ?auto_551524 ) ) ( not ( = ?auto_551518 ?auto_551525 ) ) ( not ( = ?auto_551518 ?auto_551526 ) ) ( not ( = ?auto_551518 ?auto_551527 ) ) ( not ( = ?auto_551518 ?auto_551528 ) ) ( not ( = ?auto_551518 ?auto_551529 ) ) ( not ( = ?auto_551518 ?auto_551530 ) ) ( not ( = ?auto_551518 ?auto_551531 ) ) ( not ( = ?auto_551518 ?auto_551532 ) ) ( not ( = ?auto_551518 ?auto_551533 ) ) ( not ( = ?auto_551519 ?auto_551520 ) ) ( not ( = ?auto_551519 ?auto_551521 ) ) ( not ( = ?auto_551519 ?auto_551522 ) ) ( not ( = ?auto_551519 ?auto_551523 ) ) ( not ( = ?auto_551519 ?auto_551524 ) ) ( not ( = ?auto_551519 ?auto_551525 ) ) ( not ( = ?auto_551519 ?auto_551526 ) ) ( not ( = ?auto_551519 ?auto_551527 ) ) ( not ( = ?auto_551519 ?auto_551528 ) ) ( not ( = ?auto_551519 ?auto_551529 ) ) ( not ( = ?auto_551519 ?auto_551530 ) ) ( not ( = ?auto_551519 ?auto_551531 ) ) ( not ( = ?auto_551519 ?auto_551532 ) ) ( not ( = ?auto_551519 ?auto_551533 ) ) ( not ( = ?auto_551520 ?auto_551521 ) ) ( not ( = ?auto_551520 ?auto_551522 ) ) ( not ( = ?auto_551520 ?auto_551523 ) ) ( not ( = ?auto_551520 ?auto_551524 ) ) ( not ( = ?auto_551520 ?auto_551525 ) ) ( not ( = ?auto_551520 ?auto_551526 ) ) ( not ( = ?auto_551520 ?auto_551527 ) ) ( not ( = ?auto_551520 ?auto_551528 ) ) ( not ( = ?auto_551520 ?auto_551529 ) ) ( not ( = ?auto_551520 ?auto_551530 ) ) ( not ( = ?auto_551520 ?auto_551531 ) ) ( not ( = ?auto_551520 ?auto_551532 ) ) ( not ( = ?auto_551520 ?auto_551533 ) ) ( not ( = ?auto_551521 ?auto_551522 ) ) ( not ( = ?auto_551521 ?auto_551523 ) ) ( not ( = ?auto_551521 ?auto_551524 ) ) ( not ( = ?auto_551521 ?auto_551525 ) ) ( not ( = ?auto_551521 ?auto_551526 ) ) ( not ( = ?auto_551521 ?auto_551527 ) ) ( not ( = ?auto_551521 ?auto_551528 ) ) ( not ( = ?auto_551521 ?auto_551529 ) ) ( not ( = ?auto_551521 ?auto_551530 ) ) ( not ( = ?auto_551521 ?auto_551531 ) ) ( not ( = ?auto_551521 ?auto_551532 ) ) ( not ( = ?auto_551521 ?auto_551533 ) ) ( not ( = ?auto_551522 ?auto_551523 ) ) ( not ( = ?auto_551522 ?auto_551524 ) ) ( not ( = ?auto_551522 ?auto_551525 ) ) ( not ( = ?auto_551522 ?auto_551526 ) ) ( not ( = ?auto_551522 ?auto_551527 ) ) ( not ( = ?auto_551522 ?auto_551528 ) ) ( not ( = ?auto_551522 ?auto_551529 ) ) ( not ( = ?auto_551522 ?auto_551530 ) ) ( not ( = ?auto_551522 ?auto_551531 ) ) ( not ( = ?auto_551522 ?auto_551532 ) ) ( not ( = ?auto_551522 ?auto_551533 ) ) ( not ( = ?auto_551523 ?auto_551524 ) ) ( not ( = ?auto_551523 ?auto_551525 ) ) ( not ( = ?auto_551523 ?auto_551526 ) ) ( not ( = ?auto_551523 ?auto_551527 ) ) ( not ( = ?auto_551523 ?auto_551528 ) ) ( not ( = ?auto_551523 ?auto_551529 ) ) ( not ( = ?auto_551523 ?auto_551530 ) ) ( not ( = ?auto_551523 ?auto_551531 ) ) ( not ( = ?auto_551523 ?auto_551532 ) ) ( not ( = ?auto_551523 ?auto_551533 ) ) ( not ( = ?auto_551524 ?auto_551525 ) ) ( not ( = ?auto_551524 ?auto_551526 ) ) ( not ( = ?auto_551524 ?auto_551527 ) ) ( not ( = ?auto_551524 ?auto_551528 ) ) ( not ( = ?auto_551524 ?auto_551529 ) ) ( not ( = ?auto_551524 ?auto_551530 ) ) ( not ( = ?auto_551524 ?auto_551531 ) ) ( not ( = ?auto_551524 ?auto_551532 ) ) ( not ( = ?auto_551524 ?auto_551533 ) ) ( not ( = ?auto_551525 ?auto_551526 ) ) ( not ( = ?auto_551525 ?auto_551527 ) ) ( not ( = ?auto_551525 ?auto_551528 ) ) ( not ( = ?auto_551525 ?auto_551529 ) ) ( not ( = ?auto_551525 ?auto_551530 ) ) ( not ( = ?auto_551525 ?auto_551531 ) ) ( not ( = ?auto_551525 ?auto_551532 ) ) ( not ( = ?auto_551525 ?auto_551533 ) ) ( not ( = ?auto_551526 ?auto_551527 ) ) ( not ( = ?auto_551526 ?auto_551528 ) ) ( not ( = ?auto_551526 ?auto_551529 ) ) ( not ( = ?auto_551526 ?auto_551530 ) ) ( not ( = ?auto_551526 ?auto_551531 ) ) ( not ( = ?auto_551526 ?auto_551532 ) ) ( not ( = ?auto_551526 ?auto_551533 ) ) ( not ( = ?auto_551527 ?auto_551528 ) ) ( not ( = ?auto_551527 ?auto_551529 ) ) ( not ( = ?auto_551527 ?auto_551530 ) ) ( not ( = ?auto_551527 ?auto_551531 ) ) ( not ( = ?auto_551527 ?auto_551532 ) ) ( not ( = ?auto_551527 ?auto_551533 ) ) ( not ( = ?auto_551528 ?auto_551529 ) ) ( not ( = ?auto_551528 ?auto_551530 ) ) ( not ( = ?auto_551528 ?auto_551531 ) ) ( not ( = ?auto_551528 ?auto_551532 ) ) ( not ( = ?auto_551528 ?auto_551533 ) ) ( not ( = ?auto_551529 ?auto_551530 ) ) ( not ( = ?auto_551529 ?auto_551531 ) ) ( not ( = ?auto_551529 ?auto_551532 ) ) ( not ( = ?auto_551529 ?auto_551533 ) ) ( not ( = ?auto_551530 ?auto_551531 ) ) ( not ( = ?auto_551530 ?auto_551532 ) ) ( not ( = ?auto_551530 ?auto_551533 ) ) ( not ( = ?auto_551531 ?auto_551532 ) ) ( not ( = ?auto_551531 ?auto_551533 ) ) ( not ( = ?auto_551532 ?auto_551533 ) ) ( ON ?auto_551531 ?auto_551532 ) ( ON ?auto_551530 ?auto_551531 ) ( ON ?auto_551529 ?auto_551530 ) ( ON ?auto_551528 ?auto_551529 ) ( ON ?auto_551527 ?auto_551528 ) ( ON ?auto_551526 ?auto_551527 ) ( ON ?auto_551525 ?auto_551526 ) ( ON ?auto_551524 ?auto_551525 ) ( ON ?auto_551523 ?auto_551524 ) ( ON ?auto_551522 ?auto_551523 ) ( ON ?auto_551521 ?auto_551522 ) ( CLEAR ?auto_551519 ) ( ON ?auto_551520 ?auto_551521 ) ( CLEAR ?auto_551520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_551518 ?auto_551519 ?auto_551520 )
      ( MAKE-15PILE ?auto_551518 ?auto_551519 ?auto_551520 ?auto_551521 ?auto_551522 ?auto_551523 ?auto_551524 ?auto_551525 ?auto_551526 ?auto_551527 ?auto_551528 ?auto_551529 ?auto_551530 ?auto_551531 ?auto_551532 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_551580 - BLOCK
      ?auto_551581 - BLOCK
      ?auto_551582 - BLOCK
      ?auto_551583 - BLOCK
      ?auto_551584 - BLOCK
      ?auto_551585 - BLOCK
      ?auto_551586 - BLOCK
      ?auto_551587 - BLOCK
      ?auto_551588 - BLOCK
      ?auto_551589 - BLOCK
      ?auto_551590 - BLOCK
      ?auto_551591 - BLOCK
      ?auto_551592 - BLOCK
      ?auto_551593 - BLOCK
      ?auto_551594 - BLOCK
    )
    :vars
    (
      ?auto_551595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_551594 ?auto_551595 ) ( ON-TABLE ?auto_551580 ) ( not ( = ?auto_551580 ?auto_551581 ) ) ( not ( = ?auto_551580 ?auto_551582 ) ) ( not ( = ?auto_551580 ?auto_551583 ) ) ( not ( = ?auto_551580 ?auto_551584 ) ) ( not ( = ?auto_551580 ?auto_551585 ) ) ( not ( = ?auto_551580 ?auto_551586 ) ) ( not ( = ?auto_551580 ?auto_551587 ) ) ( not ( = ?auto_551580 ?auto_551588 ) ) ( not ( = ?auto_551580 ?auto_551589 ) ) ( not ( = ?auto_551580 ?auto_551590 ) ) ( not ( = ?auto_551580 ?auto_551591 ) ) ( not ( = ?auto_551580 ?auto_551592 ) ) ( not ( = ?auto_551580 ?auto_551593 ) ) ( not ( = ?auto_551580 ?auto_551594 ) ) ( not ( = ?auto_551580 ?auto_551595 ) ) ( not ( = ?auto_551581 ?auto_551582 ) ) ( not ( = ?auto_551581 ?auto_551583 ) ) ( not ( = ?auto_551581 ?auto_551584 ) ) ( not ( = ?auto_551581 ?auto_551585 ) ) ( not ( = ?auto_551581 ?auto_551586 ) ) ( not ( = ?auto_551581 ?auto_551587 ) ) ( not ( = ?auto_551581 ?auto_551588 ) ) ( not ( = ?auto_551581 ?auto_551589 ) ) ( not ( = ?auto_551581 ?auto_551590 ) ) ( not ( = ?auto_551581 ?auto_551591 ) ) ( not ( = ?auto_551581 ?auto_551592 ) ) ( not ( = ?auto_551581 ?auto_551593 ) ) ( not ( = ?auto_551581 ?auto_551594 ) ) ( not ( = ?auto_551581 ?auto_551595 ) ) ( not ( = ?auto_551582 ?auto_551583 ) ) ( not ( = ?auto_551582 ?auto_551584 ) ) ( not ( = ?auto_551582 ?auto_551585 ) ) ( not ( = ?auto_551582 ?auto_551586 ) ) ( not ( = ?auto_551582 ?auto_551587 ) ) ( not ( = ?auto_551582 ?auto_551588 ) ) ( not ( = ?auto_551582 ?auto_551589 ) ) ( not ( = ?auto_551582 ?auto_551590 ) ) ( not ( = ?auto_551582 ?auto_551591 ) ) ( not ( = ?auto_551582 ?auto_551592 ) ) ( not ( = ?auto_551582 ?auto_551593 ) ) ( not ( = ?auto_551582 ?auto_551594 ) ) ( not ( = ?auto_551582 ?auto_551595 ) ) ( not ( = ?auto_551583 ?auto_551584 ) ) ( not ( = ?auto_551583 ?auto_551585 ) ) ( not ( = ?auto_551583 ?auto_551586 ) ) ( not ( = ?auto_551583 ?auto_551587 ) ) ( not ( = ?auto_551583 ?auto_551588 ) ) ( not ( = ?auto_551583 ?auto_551589 ) ) ( not ( = ?auto_551583 ?auto_551590 ) ) ( not ( = ?auto_551583 ?auto_551591 ) ) ( not ( = ?auto_551583 ?auto_551592 ) ) ( not ( = ?auto_551583 ?auto_551593 ) ) ( not ( = ?auto_551583 ?auto_551594 ) ) ( not ( = ?auto_551583 ?auto_551595 ) ) ( not ( = ?auto_551584 ?auto_551585 ) ) ( not ( = ?auto_551584 ?auto_551586 ) ) ( not ( = ?auto_551584 ?auto_551587 ) ) ( not ( = ?auto_551584 ?auto_551588 ) ) ( not ( = ?auto_551584 ?auto_551589 ) ) ( not ( = ?auto_551584 ?auto_551590 ) ) ( not ( = ?auto_551584 ?auto_551591 ) ) ( not ( = ?auto_551584 ?auto_551592 ) ) ( not ( = ?auto_551584 ?auto_551593 ) ) ( not ( = ?auto_551584 ?auto_551594 ) ) ( not ( = ?auto_551584 ?auto_551595 ) ) ( not ( = ?auto_551585 ?auto_551586 ) ) ( not ( = ?auto_551585 ?auto_551587 ) ) ( not ( = ?auto_551585 ?auto_551588 ) ) ( not ( = ?auto_551585 ?auto_551589 ) ) ( not ( = ?auto_551585 ?auto_551590 ) ) ( not ( = ?auto_551585 ?auto_551591 ) ) ( not ( = ?auto_551585 ?auto_551592 ) ) ( not ( = ?auto_551585 ?auto_551593 ) ) ( not ( = ?auto_551585 ?auto_551594 ) ) ( not ( = ?auto_551585 ?auto_551595 ) ) ( not ( = ?auto_551586 ?auto_551587 ) ) ( not ( = ?auto_551586 ?auto_551588 ) ) ( not ( = ?auto_551586 ?auto_551589 ) ) ( not ( = ?auto_551586 ?auto_551590 ) ) ( not ( = ?auto_551586 ?auto_551591 ) ) ( not ( = ?auto_551586 ?auto_551592 ) ) ( not ( = ?auto_551586 ?auto_551593 ) ) ( not ( = ?auto_551586 ?auto_551594 ) ) ( not ( = ?auto_551586 ?auto_551595 ) ) ( not ( = ?auto_551587 ?auto_551588 ) ) ( not ( = ?auto_551587 ?auto_551589 ) ) ( not ( = ?auto_551587 ?auto_551590 ) ) ( not ( = ?auto_551587 ?auto_551591 ) ) ( not ( = ?auto_551587 ?auto_551592 ) ) ( not ( = ?auto_551587 ?auto_551593 ) ) ( not ( = ?auto_551587 ?auto_551594 ) ) ( not ( = ?auto_551587 ?auto_551595 ) ) ( not ( = ?auto_551588 ?auto_551589 ) ) ( not ( = ?auto_551588 ?auto_551590 ) ) ( not ( = ?auto_551588 ?auto_551591 ) ) ( not ( = ?auto_551588 ?auto_551592 ) ) ( not ( = ?auto_551588 ?auto_551593 ) ) ( not ( = ?auto_551588 ?auto_551594 ) ) ( not ( = ?auto_551588 ?auto_551595 ) ) ( not ( = ?auto_551589 ?auto_551590 ) ) ( not ( = ?auto_551589 ?auto_551591 ) ) ( not ( = ?auto_551589 ?auto_551592 ) ) ( not ( = ?auto_551589 ?auto_551593 ) ) ( not ( = ?auto_551589 ?auto_551594 ) ) ( not ( = ?auto_551589 ?auto_551595 ) ) ( not ( = ?auto_551590 ?auto_551591 ) ) ( not ( = ?auto_551590 ?auto_551592 ) ) ( not ( = ?auto_551590 ?auto_551593 ) ) ( not ( = ?auto_551590 ?auto_551594 ) ) ( not ( = ?auto_551590 ?auto_551595 ) ) ( not ( = ?auto_551591 ?auto_551592 ) ) ( not ( = ?auto_551591 ?auto_551593 ) ) ( not ( = ?auto_551591 ?auto_551594 ) ) ( not ( = ?auto_551591 ?auto_551595 ) ) ( not ( = ?auto_551592 ?auto_551593 ) ) ( not ( = ?auto_551592 ?auto_551594 ) ) ( not ( = ?auto_551592 ?auto_551595 ) ) ( not ( = ?auto_551593 ?auto_551594 ) ) ( not ( = ?auto_551593 ?auto_551595 ) ) ( not ( = ?auto_551594 ?auto_551595 ) ) ( ON ?auto_551593 ?auto_551594 ) ( ON ?auto_551592 ?auto_551593 ) ( ON ?auto_551591 ?auto_551592 ) ( ON ?auto_551590 ?auto_551591 ) ( ON ?auto_551589 ?auto_551590 ) ( ON ?auto_551588 ?auto_551589 ) ( ON ?auto_551587 ?auto_551588 ) ( ON ?auto_551586 ?auto_551587 ) ( ON ?auto_551585 ?auto_551586 ) ( ON ?auto_551584 ?auto_551585 ) ( ON ?auto_551583 ?auto_551584 ) ( ON ?auto_551582 ?auto_551583 ) ( CLEAR ?auto_551580 ) ( ON ?auto_551581 ?auto_551582 ) ( CLEAR ?auto_551581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_551580 ?auto_551581 )
      ( MAKE-15PILE ?auto_551580 ?auto_551581 ?auto_551582 ?auto_551583 ?auto_551584 ?auto_551585 ?auto_551586 ?auto_551587 ?auto_551588 ?auto_551589 ?auto_551590 ?auto_551591 ?auto_551592 ?auto_551593 ?auto_551594 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_551642 - BLOCK
      ?auto_551643 - BLOCK
      ?auto_551644 - BLOCK
      ?auto_551645 - BLOCK
      ?auto_551646 - BLOCK
      ?auto_551647 - BLOCK
      ?auto_551648 - BLOCK
      ?auto_551649 - BLOCK
      ?auto_551650 - BLOCK
      ?auto_551651 - BLOCK
      ?auto_551652 - BLOCK
      ?auto_551653 - BLOCK
      ?auto_551654 - BLOCK
      ?auto_551655 - BLOCK
      ?auto_551656 - BLOCK
    )
    :vars
    (
      ?auto_551657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_551656 ?auto_551657 ) ( not ( = ?auto_551642 ?auto_551643 ) ) ( not ( = ?auto_551642 ?auto_551644 ) ) ( not ( = ?auto_551642 ?auto_551645 ) ) ( not ( = ?auto_551642 ?auto_551646 ) ) ( not ( = ?auto_551642 ?auto_551647 ) ) ( not ( = ?auto_551642 ?auto_551648 ) ) ( not ( = ?auto_551642 ?auto_551649 ) ) ( not ( = ?auto_551642 ?auto_551650 ) ) ( not ( = ?auto_551642 ?auto_551651 ) ) ( not ( = ?auto_551642 ?auto_551652 ) ) ( not ( = ?auto_551642 ?auto_551653 ) ) ( not ( = ?auto_551642 ?auto_551654 ) ) ( not ( = ?auto_551642 ?auto_551655 ) ) ( not ( = ?auto_551642 ?auto_551656 ) ) ( not ( = ?auto_551642 ?auto_551657 ) ) ( not ( = ?auto_551643 ?auto_551644 ) ) ( not ( = ?auto_551643 ?auto_551645 ) ) ( not ( = ?auto_551643 ?auto_551646 ) ) ( not ( = ?auto_551643 ?auto_551647 ) ) ( not ( = ?auto_551643 ?auto_551648 ) ) ( not ( = ?auto_551643 ?auto_551649 ) ) ( not ( = ?auto_551643 ?auto_551650 ) ) ( not ( = ?auto_551643 ?auto_551651 ) ) ( not ( = ?auto_551643 ?auto_551652 ) ) ( not ( = ?auto_551643 ?auto_551653 ) ) ( not ( = ?auto_551643 ?auto_551654 ) ) ( not ( = ?auto_551643 ?auto_551655 ) ) ( not ( = ?auto_551643 ?auto_551656 ) ) ( not ( = ?auto_551643 ?auto_551657 ) ) ( not ( = ?auto_551644 ?auto_551645 ) ) ( not ( = ?auto_551644 ?auto_551646 ) ) ( not ( = ?auto_551644 ?auto_551647 ) ) ( not ( = ?auto_551644 ?auto_551648 ) ) ( not ( = ?auto_551644 ?auto_551649 ) ) ( not ( = ?auto_551644 ?auto_551650 ) ) ( not ( = ?auto_551644 ?auto_551651 ) ) ( not ( = ?auto_551644 ?auto_551652 ) ) ( not ( = ?auto_551644 ?auto_551653 ) ) ( not ( = ?auto_551644 ?auto_551654 ) ) ( not ( = ?auto_551644 ?auto_551655 ) ) ( not ( = ?auto_551644 ?auto_551656 ) ) ( not ( = ?auto_551644 ?auto_551657 ) ) ( not ( = ?auto_551645 ?auto_551646 ) ) ( not ( = ?auto_551645 ?auto_551647 ) ) ( not ( = ?auto_551645 ?auto_551648 ) ) ( not ( = ?auto_551645 ?auto_551649 ) ) ( not ( = ?auto_551645 ?auto_551650 ) ) ( not ( = ?auto_551645 ?auto_551651 ) ) ( not ( = ?auto_551645 ?auto_551652 ) ) ( not ( = ?auto_551645 ?auto_551653 ) ) ( not ( = ?auto_551645 ?auto_551654 ) ) ( not ( = ?auto_551645 ?auto_551655 ) ) ( not ( = ?auto_551645 ?auto_551656 ) ) ( not ( = ?auto_551645 ?auto_551657 ) ) ( not ( = ?auto_551646 ?auto_551647 ) ) ( not ( = ?auto_551646 ?auto_551648 ) ) ( not ( = ?auto_551646 ?auto_551649 ) ) ( not ( = ?auto_551646 ?auto_551650 ) ) ( not ( = ?auto_551646 ?auto_551651 ) ) ( not ( = ?auto_551646 ?auto_551652 ) ) ( not ( = ?auto_551646 ?auto_551653 ) ) ( not ( = ?auto_551646 ?auto_551654 ) ) ( not ( = ?auto_551646 ?auto_551655 ) ) ( not ( = ?auto_551646 ?auto_551656 ) ) ( not ( = ?auto_551646 ?auto_551657 ) ) ( not ( = ?auto_551647 ?auto_551648 ) ) ( not ( = ?auto_551647 ?auto_551649 ) ) ( not ( = ?auto_551647 ?auto_551650 ) ) ( not ( = ?auto_551647 ?auto_551651 ) ) ( not ( = ?auto_551647 ?auto_551652 ) ) ( not ( = ?auto_551647 ?auto_551653 ) ) ( not ( = ?auto_551647 ?auto_551654 ) ) ( not ( = ?auto_551647 ?auto_551655 ) ) ( not ( = ?auto_551647 ?auto_551656 ) ) ( not ( = ?auto_551647 ?auto_551657 ) ) ( not ( = ?auto_551648 ?auto_551649 ) ) ( not ( = ?auto_551648 ?auto_551650 ) ) ( not ( = ?auto_551648 ?auto_551651 ) ) ( not ( = ?auto_551648 ?auto_551652 ) ) ( not ( = ?auto_551648 ?auto_551653 ) ) ( not ( = ?auto_551648 ?auto_551654 ) ) ( not ( = ?auto_551648 ?auto_551655 ) ) ( not ( = ?auto_551648 ?auto_551656 ) ) ( not ( = ?auto_551648 ?auto_551657 ) ) ( not ( = ?auto_551649 ?auto_551650 ) ) ( not ( = ?auto_551649 ?auto_551651 ) ) ( not ( = ?auto_551649 ?auto_551652 ) ) ( not ( = ?auto_551649 ?auto_551653 ) ) ( not ( = ?auto_551649 ?auto_551654 ) ) ( not ( = ?auto_551649 ?auto_551655 ) ) ( not ( = ?auto_551649 ?auto_551656 ) ) ( not ( = ?auto_551649 ?auto_551657 ) ) ( not ( = ?auto_551650 ?auto_551651 ) ) ( not ( = ?auto_551650 ?auto_551652 ) ) ( not ( = ?auto_551650 ?auto_551653 ) ) ( not ( = ?auto_551650 ?auto_551654 ) ) ( not ( = ?auto_551650 ?auto_551655 ) ) ( not ( = ?auto_551650 ?auto_551656 ) ) ( not ( = ?auto_551650 ?auto_551657 ) ) ( not ( = ?auto_551651 ?auto_551652 ) ) ( not ( = ?auto_551651 ?auto_551653 ) ) ( not ( = ?auto_551651 ?auto_551654 ) ) ( not ( = ?auto_551651 ?auto_551655 ) ) ( not ( = ?auto_551651 ?auto_551656 ) ) ( not ( = ?auto_551651 ?auto_551657 ) ) ( not ( = ?auto_551652 ?auto_551653 ) ) ( not ( = ?auto_551652 ?auto_551654 ) ) ( not ( = ?auto_551652 ?auto_551655 ) ) ( not ( = ?auto_551652 ?auto_551656 ) ) ( not ( = ?auto_551652 ?auto_551657 ) ) ( not ( = ?auto_551653 ?auto_551654 ) ) ( not ( = ?auto_551653 ?auto_551655 ) ) ( not ( = ?auto_551653 ?auto_551656 ) ) ( not ( = ?auto_551653 ?auto_551657 ) ) ( not ( = ?auto_551654 ?auto_551655 ) ) ( not ( = ?auto_551654 ?auto_551656 ) ) ( not ( = ?auto_551654 ?auto_551657 ) ) ( not ( = ?auto_551655 ?auto_551656 ) ) ( not ( = ?auto_551655 ?auto_551657 ) ) ( not ( = ?auto_551656 ?auto_551657 ) ) ( ON ?auto_551655 ?auto_551656 ) ( ON ?auto_551654 ?auto_551655 ) ( ON ?auto_551653 ?auto_551654 ) ( ON ?auto_551652 ?auto_551653 ) ( ON ?auto_551651 ?auto_551652 ) ( ON ?auto_551650 ?auto_551651 ) ( ON ?auto_551649 ?auto_551650 ) ( ON ?auto_551648 ?auto_551649 ) ( ON ?auto_551647 ?auto_551648 ) ( ON ?auto_551646 ?auto_551647 ) ( ON ?auto_551645 ?auto_551646 ) ( ON ?auto_551644 ?auto_551645 ) ( ON ?auto_551643 ?auto_551644 ) ( ON ?auto_551642 ?auto_551643 ) ( CLEAR ?auto_551642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_551642 )
      ( MAKE-15PILE ?auto_551642 ?auto_551643 ?auto_551644 ?auto_551645 ?auto_551646 ?auto_551647 ?auto_551648 ?auto_551649 ?auto_551650 ?auto_551651 ?auto_551652 ?auto_551653 ?auto_551654 ?auto_551655 ?auto_551656 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_551705 - BLOCK
      ?auto_551706 - BLOCK
      ?auto_551707 - BLOCK
      ?auto_551708 - BLOCK
      ?auto_551709 - BLOCK
      ?auto_551710 - BLOCK
      ?auto_551711 - BLOCK
      ?auto_551712 - BLOCK
      ?auto_551713 - BLOCK
      ?auto_551714 - BLOCK
      ?auto_551715 - BLOCK
      ?auto_551716 - BLOCK
      ?auto_551717 - BLOCK
      ?auto_551718 - BLOCK
      ?auto_551719 - BLOCK
      ?auto_551720 - BLOCK
    )
    :vars
    (
      ?auto_551721 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_551719 ) ( ON ?auto_551720 ?auto_551721 ) ( CLEAR ?auto_551720 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_551705 ) ( ON ?auto_551706 ?auto_551705 ) ( ON ?auto_551707 ?auto_551706 ) ( ON ?auto_551708 ?auto_551707 ) ( ON ?auto_551709 ?auto_551708 ) ( ON ?auto_551710 ?auto_551709 ) ( ON ?auto_551711 ?auto_551710 ) ( ON ?auto_551712 ?auto_551711 ) ( ON ?auto_551713 ?auto_551712 ) ( ON ?auto_551714 ?auto_551713 ) ( ON ?auto_551715 ?auto_551714 ) ( ON ?auto_551716 ?auto_551715 ) ( ON ?auto_551717 ?auto_551716 ) ( ON ?auto_551718 ?auto_551717 ) ( ON ?auto_551719 ?auto_551718 ) ( not ( = ?auto_551705 ?auto_551706 ) ) ( not ( = ?auto_551705 ?auto_551707 ) ) ( not ( = ?auto_551705 ?auto_551708 ) ) ( not ( = ?auto_551705 ?auto_551709 ) ) ( not ( = ?auto_551705 ?auto_551710 ) ) ( not ( = ?auto_551705 ?auto_551711 ) ) ( not ( = ?auto_551705 ?auto_551712 ) ) ( not ( = ?auto_551705 ?auto_551713 ) ) ( not ( = ?auto_551705 ?auto_551714 ) ) ( not ( = ?auto_551705 ?auto_551715 ) ) ( not ( = ?auto_551705 ?auto_551716 ) ) ( not ( = ?auto_551705 ?auto_551717 ) ) ( not ( = ?auto_551705 ?auto_551718 ) ) ( not ( = ?auto_551705 ?auto_551719 ) ) ( not ( = ?auto_551705 ?auto_551720 ) ) ( not ( = ?auto_551705 ?auto_551721 ) ) ( not ( = ?auto_551706 ?auto_551707 ) ) ( not ( = ?auto_551706 ?auto_551708 ) ) ( not ( = ?auto_551706 ?auto_551709 ) ) ( not ( = ?auto_551706 ?auto_551710 ) ) ( not ( = ?auto_551706 ?auto_551711 ) ) ( not ( = ?auto_551706 ?auto_551712 ) ) ( not ( = ?auto_551706 ?auto_551713 ) ) ( not ( = ?auto_551706 ?auto_551714 ) ) ( not ( = ?auto_551706 ?auto_551715 ) ) ( not ( = ?auto_551706 ?auto_551716 ) ) ( not ( = ?auto_551706 ?auto_551717 ) ) ( not ( = ?auto_551706 ?auto_551718 ) ) ( not ( = ?auto_551706 ?auto_551719 ) ) ( not ( = ?auto_551706 ?auto_551720 ) ) ( not ( = ?auto_551706 ?auto_551721 ) ) ( not ( = ?auto_551707 ?auto_551708 ) ) ( not ( = ?auto_551707 ?auto_551709 ) ) ( not ( = ?auto_551707 ?auto_551710 ) ) ( not ( = ?auto_551707 ?auto_551711 ) ) ( not ( = ?auto_551707 ?auto_551712 ) ) ( not ( = ?auto_551707 ?auto_551713 ) ) ( not ( = ?auto_551707 ?auto_551714 ) ) ( not ( = ?auto_551707 ?auto_551715 ) ) ( not ( = ?auto_551707 ?auto_551716 ) ) ( not ( = ?auto_551707 ?auto_551717 ) ) ( not ( = ?auto_551707 ?auto_551718 ) ) ( not ( = ?auto_551707 ?auto_551719 ) ) ( not ( = ?auto_551707 ?auto_551720 ) ) ( not ( = ?auto_551707 ?auto_551721 ) ) ( not ( = ?auto_551708 ?auto_551709 ) ) ( not ( = ?auto_551708 ?auto_551710 ) ) ( not ( = ?auto_551708 ?auto_551711 ) ) ( not ( = ?auto_551708 ?auto_551712 ) ) ( not ( = ?auto_551708 ?auto_551713 ) ) ( not ( = ?auto_551708 ?auto_551714 ) ) ( not ( = ?auto_551708 ?auto_551715 ) ) ( not ( = ?auto_551708 ?auto_551716 ) ) ( not ( = ?auto_551708 ?auto_551717 ) ) ( not ( = ?auto_551708 ?auto_551718 ) ) ( not ( = ?auto_551708 ?auto_551719 ) ) ( not ( = ?auto_551708 ?auto_551720 ) ) ( not ( = ?auto_551708 ?auto_551721 ) ) ( not ( = ?auto_551709 ?auto_551710 ) ) ( not ( = ?auto_551709 ?auto_551711 ) ) ( not ( = ?auto_551709 ?auto_551712 ) ) ( not ( = ?auto_551709 ?auto_551713 ) ) ( not ( = ?auto_551709 ?auto_551714 ) ) ( not ( = ?auto_551709 ?auto_551715 ) ) ( not ( = ?auto_551709 ?auto_551716 ) ) ( not ( = ?auto_551709 ?auto_551717 ) ) ( not ( = ?auto_551709 ?auto_551718 ) ) ( not ( = ?auto_551709 ?auto_551719 ) ) ( not ( = ?auto_551709 ?auto_551720 ) ) ( not ( = ?auto_551709 ?auto_551721 ) ) ( not ( = ?auto_551710 ?auto_551711 ) ) ( not ( = ?auto_551710 ?auto_551712 ) ) ( not ( = ?auto_551710 ?auto_551713 ) ) ( not ( = ?auto_551710 ?auto_551714 ) ) ( not ( = ?auto_551710 ?auto_551715 ) ) ( not ( = ?auto_551710 ?auto_551716 ) ) ( not ( = ?auto_551710 ?auto_551717 ) ) ( not ( = ?auto_551710 ?auto_551718 ) ) ( not ( = ?auto_551710 ?auto_551719 ) ) ( not ( = ?auto_551710 ?auto_551720 ) ) ( not ( = ?auto_551710 ?auto_551721 ) ) ( not ( = ?auto_551711 ?auto_551712 ) ) ( not ( = ?auto_551711 ?auto_551713 ) ) ( not ( = ?auto_551711 ?auto_551714 ) ) ( not ( = ?auto_551711 ?auto_551715 ) ) ( not ( = ?auto_551711 ?auto_551716 ) ) ( not ( = ?auto_551711 ?auto_551717 ) ) ( not ( = ?auto_551711 ?auto_551718 ) ) ( not ( = ?auto_551711 ?auto_551719 ) ) ( not ( = ?auto_551711 ?auto_551720 ) ) ( not ( = ?auto_551711 ?auto_551721 ) ) ( not ( = ?auto_551712 ?auto_551713 ) ) ( not ( = ?auto_551712 ?auto_551714 ) ) ( not ( = ?auto_551712 ?auto_551715 ) ) ( not ( = ?auto_551712 ?auto_551716 ) ) ( not ( = ?auto_551712 ?auto_551717 ) ) ( not ( = ?auto_551712 ?auto_551718 ) ) ( not ( = ?auto_551712 ?auto_551719 ) ) ( not ( = ?auto_551712 ?auto_551720 ) ) ( not ( = ?auto_551712 ?auto_551721 ) ) ( not ( = ?auto_551713 ?auto_551714 ) ) ( not ( = ?auto_551713 ?auto_551715 ) ) ( not ( = ?auto_551713 ?auto_551716 ) ) ( not ( = ?auto_551713 ?auto_551717 ) ) ( not ( = ?auto_551713 ?auto_551718 ) ) ( not ( = ?auto_551713 ?auto_551719 ) ) ( not ( = ?auto_551713 ?auto_551720 ) ) ( not ( = ?auto_551713 ?auto_551721 ) ) ( not ( = ?auto_551714 ?auto_551715 ) ) ( not ( = ?auto_551714 ?auto_551716 ) ) ( not ( = ?auto_551714 ?auto_551717 ) ) ( not ( = ?auto_551714 ?auto_551718 ) ) ( not ( = ?auto_551714 ?auto_551719 ) ) ( not ( = ?auto_551714 ?auto_551720 ) ) ( not ( = ?auto_551714 ?auto_551721 ) ) ( not ( = ?auto_551715 ?auto_551716 ) ) ( not ( = ?auto_551715 ?auto_551717 ) ) ( not ( = ?auto_551715 ?auto_551718 ) ) ( not ( = ?auto_551715 ?auto_551719 ) ) ( not ( = ?auto_551715 ?auto_551720 ) ) ( not ( = ?auto_551715 ?auto_551721 ) ) ( not ( = ?auto_551716 ?auto_551717 ) ) ( not ( = ?auto_551716 ?auto_551718 ) ) ( not ( = ?auto_551716 ?auto_551719 ) ) ( not ( = ?auto_551716 ?auto_551720 ) ) ( not ( = ?auto_551716 ?auto_551721 ) ) ( not ( = ?auto_551717 ?auto_551718 ) ) ( not ( = ?auto_551717 ?auto_551719 ) ) ( not ( = ?auto_551717 ?auto_551720 ) ) ( not ( = ?auto_551717 ?auto_551721 ) ) ( not ( = ?auto_551718 ?auto_551719 ) ) ( not ( = ?auto_551718 ?auto_551720 ) ) ( not ( = ?auto_551718 ?auto_551721 ) ) ( not ( = ?auto_551719 ?auto_551720 ) ) ( not ( = ?auto_551719 ?auto_551721 ) ) ( not ( = ?auto_551720 ?auto_551721 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_551720 ?auto_551721 )
      ( !STACK ?auto_551720 ?auto_551719 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_551738 - BLOCK
      ?auto_551739 - BLOCK
      ?auto_551740 - BLOCK
      ?auto_551741 - BLOCK
      ?auto_551742 - BLOCK
      ?auto_551743 - BLOCK
      ?auto_551744 - BLOCK
      ?auto_551745 - BLOCK
      ?auto_551746 - BLOCK
      ?auto_551747 - BLOCK
      ?auto_551748 - BLOCK
      ?auto_551749 - BLOCK
      ?auto_551750 - BLOCK
      ?auto_551751 - BLOCK
      ?auto_551752 - BLOCK
      ?auto_551753 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_551752 ) ( ON-TABLE ?auto_551753 ) ( CLEAR ?auto_551753 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_551738 ) ( ON ?auto_551739 ?auto_551738 ) ( ON ?auto_551740 ?auto_551739 ) ( ON ?auto_551741 ?auto_551740 ) ( ON ?auto_551742 ?auto_551741 ) ( ON ?auto_551743 ?auto_551742 ) ( ON ?auto_551744 ?auto_551743 ) ( ON ?auto_551745 ?auto_551744 ) ( ON ?auto_551746 ?auto_551745 ) ( ON ?auto_551747 ?auto_551746 ) ( ON ?auto_551748 ?auto_551747 ) ( ON ?auto_551749 ?auto_551748 ) ( ON ?auto_551750 ?auto_551749 ) ( ON ?auto_551751 ?auto_551750 ) ( ON ?auto_551752 ?auto_551751 ) ( not ( = ?auto_551738 ?auto_551739 ) ) ( not ( = ?auto_551738 ?auto_551740 ) ) ( not ( = ?auto_551738 ?auto_551741 ) ) ( not ( = ?auto_551738 ?auto_551742 ) ) ( not ( = ?auto_551738 ?auto_551743 ) ) ( not ( = ?auto_551738 ?auto_551744 ) ) ( not ( = ?auto_551738 ?auto_551745 ) ) ( not ( = ?auto_551738 ?auto_551746 ) ) ( not ( = ?auto_551738 ?auto_551747 ) ) ( not ( = ?auto_551738 ?auto_551748 ) ) ( not ( = ?auto_551738 ?auto_551749 ) ) ( not ( = ?auto_551738 ?auto_551750 ) ) ( not ( = ?auto_551738 ?auto_551751 ) ) ( not ( = ?auto_551738 ?auto_551752 ) ) ( not ( = ?auto_551738 ?auto_551753 ) ) ( not ( = ?auto_551739 ?auto_551740 ) ) ( not ( = ?auto_551739 ?auto_551741 ) ) ( not ( = ?auto_551739 ?auto_551742 ) ) ( not ( = ?auto_551739 ?auto_551743 ) ) ( not ( = ?auto_551739 ?auto_551744 ) ) ( not ( = ?auto_551739 ?auto_551745 ) ) ( not ( = ?auto_551739 ?auto_551746 ) ) ( not ( = ?auto_551739 ?auto_551747 ) ) ( not ( = ?auto_551739 ?auto_551748 ) ) ( not ( = ?auto_551739 ?auto_551749 ) ) ( not ( = ?auto_551739 ?auto_551750 ) ) ( not ( = ?auto_551739 ?auto_551751 ) ) ( not ( = ?auto_551739 ?auto_551752 ) ) ( not ( = ?auto_551739 ?auto_551753 ) ) ( not ( = ?auto_551740 ?auto_551741 ) ) ( not ( = ?auto_551740 ?auto_551742 ) ) ( not ( = ?auto_551740 ?auto_551743 ) ) ( not ( = ?auto_551740 ?auto_551744 ) ) ( not ( = ?auto_551740 ?auto_551745 ) ) ( not ( = ?auto_551740 ?auto_551746 ) ) ( not ( = ?auto_551740 ?auto_551747 ) ) ( not ( = ?auto_551740 ?auto_551748 ) ) ( not ( = ?auto_551740 ?auto_551749 ) ) ( not ( = ?auto_551740 ?auto_551750 ) ) ( not ( = ?auto_551740 ?auto_551751 ) ) ( not ( = ?auto_551740 ?auto_551752 ) ) ( not ( = ?auto_551740 ?auto_551753 ) ) ( not ( = ?auto_551741 ?auto_551742 ) ) ( not ( = ?auto_551741 ?auto_551743 ) ) ( not ( = ?auto_551741 ?auto_551744 ) ) ( not ( = ?auto_551741 ?auto_551745 ) ) ( not ( = ?auto_551741 ?auto_551746 ) ) ( not ( = ?auto_551741 ?auto_551747 ) ) ( not ( = ?auto_551741 ?auto_551748 ) ) ( not ( = ?auto_551741 ?auto_551749 ) ) ( not ( = ?auto_551741 ?auto_551750 ) ) ( not ( = ?auto_551741 ?auto_551751 ) ) ( not ( = ?auto_551741 ?auto_551752 ) ) ( not ( = ?auto_551741 ?auto_551753 ) ) ( not ( = ?auto_551742 ?auto_551743 ) ) ( not ( = ?auto_551742 ?auto_551744 ) ) ( not ( = ?auto_551742 ?auto_551745 ) ) ( not ( = ?auto_551742 ?auto_551746 ) ) ( not ( = ?auto_551742 ?auto_551747 ) ) ( not ( = ?auto_551742 ?auto_551748 ) ) ( not ( = ?auto_551742 ?auto_551749 ) ) ( not ( = ?auto_551742 ?auto_551750 ) ) ( not ( = ?auto_551742 ?auto_551751 ) ) ( not ( = ?auto_551742 ?auto_551752 ) ) ( not ( = ?auto_551742 ?auto_551753 ) ) ( not ( = ?auto_551743 ?auto_551744 ) ) ( not ( = ?auto_551743 ?auto_551745 ) ) ( not ( = ?auto_551743 ?auto_551746 ) ) ( not ( = ?auto_551743 ?auto_551747 ) ) ( not ( = ?auto_551743 ?auto_551748 ) ) ( not ( = ?auto_551743 ?auto_551749 ) ) ( not ( = ?auto_551743 ?auto_551750 ) ) ( not ( = ?auto_551743 ?auto_551751 ) ) ( not ( = ?auto_551743 ?auto_551752 ) ) ( not ( = ?auto_551743 ?auto_551753 ) ) ( not ( = ?auto_551744 ?auto_551745 ) ) ( not ( = ?auto_551744 ?auto_551746 ) ) ( not ( = ?auto_551744 ?auto_551747 ) ) ( not ( = ?auto_551744 ?auto_551748 ) ) ( not ( = ?auto_551744 ?auto_551749 ) ) ( not ( = ?auto_551744 ?auto_551750 ) ) ( not ( = ?auto_551744 ?auto_551751 ) ) ( not ( = ?auto_551744 ?auto_551752 ) ) ( not ( = ?auto_551744 ?auto_551753 ) ) ( not ( = ?auto_551745 ?auto_551746 ) ) ( not ( = ?auto_551745 ?auto_551747 ) ) ( not ( = ?auto_551745 ?auto_551748 ) ) ( not ( = ?auto_551745 ?auto_551749 ) ) ( not ( = ?auto_551745 ?auto_551750 ) ) ( not ( = ?auto_551745 ?auto_551751 ) ) ( not ( = ?auto_551745 ?auto_551752 ) ) ( not ( = ?auto_551745 ?auto_551753 ) ) ( not ( = ?auto_551746 ?auto_551747 ) ) ( not ( = ?auto_551746 ?auto_551748 ) ) ( not ( = ?auto_551746 ?auto_551749 ) ) ( not ( = ?auto_551746 ?auto_551750 ) ) ( not ( = ?auto_551746 ?auto_551751 ) ) ( not ( = ?auto_551746 ?auto_551752 ) ) ( not ( = ?auto_551746 ?auto_551753 ) ) ( not ( = ?auto_551747 ?auto_551748 ) ) ( not ( = ?auto_551747 ?auto_551749 ) ) ( not ( = ?auto_551747 ?auto_551750 ) ) ( not ( = ?auto_551747 ?auto_551751 ) ) ( not ( = ?auto_551747 ?auto_551752 ) ) ( not ( = ?auto_551747 ?auto_551753 ) ) ( not ( = ?auto_551748 ?auto_551749 ) ) ( not ( = ?auto_551748 ?auto_551750 ) ) ( not ( = ?auto_551748 ?auto_551751 ) ) ( not ( = ?auto_551748 ?auto_551752 ) ) ( not ( = ?auto_551748 ?auto_551753 ) ) ( not ( = ?auto_551749 ?auto_551750 ) ) ( not ( = ?auto_551749 ?auto_551751 ) ) ( not ( = ?auto_551749 ?auto_551752 ) ) ( not ( = ?auto_551749 ?auto_551753 ) ) ( not ( = ?auto_551750 ?auto_551751 ) ) ( not ( = ?auto_551750 ?auto_551752 ) ) ( not ( = ?auto_551750 ?auto_551753 ) ) ( not ( = ?auto_551751 ?auto_551752 ) ) ( not ( = ?auto_551751 ?auto_551753 ) ) ( not ( = ?auto_551752 ?auto_551753 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_551753 )
      ( !STACK ?auto_551753 ?auto_551752 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_551770 - BLOCK
      ?auto_551771 - BLOCK
      ?auto_551772 - BLOCK
      ?auto_551773 - BLOCK
      ?auto_551774 - BLOCK
      ?auto_551775 - BLOCK
      ?auto_551776 - BLOCK
      ?auto_551777 - BLOCK
      ?auto_551778 - BLOCK
      ?auto_551779 - BLOCK
      ?auto_551780 - BLOCK
      ?auto_551781 - BLOCK
      ?auto_551782 - BLOCK
      ?auto_551783 - BLOCK
      ?auto_551784 - BLOCK
      ?auto_551785 - BLOCK
    )
    :vars
    (
      ?auto_551786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_551785 ?auto_551786 ) ( ON-TABLE ?auto_551770 ) ( ON ?auto_551771 ?auto_551770 ) ( ON ?auto_551772 ?auto_551771 ) ( ON ?auto_551773 ?auto_551772 ) ( ON ?auto_551774 ?auto_551773 ) ( ON ?auto_551775 ?auto_551774 ) ( ON ?auto_551776 ?auto_551775 ) ( ON ?auto_551777 ?auto_551776 ) ( ON ?auto_551778 ?auto_551777 ) ( ON ?auto_551779 ?auto_551778 ) ( ON ?auto_551780 ?auto_551779 ) ( ON ?auto_551781 ?auto_551780 ) ( ON ?auto_551782 ?auto_551781 ) ( ON ?auto_551783 ?auto_551782 ) ( not ( = ?auto_551770 ?auto_551771 ) ) ( not ( = ?auto_551770 ?auto_551772 ) ) ( not ( = ?auto_551770 ?auto_551773 ) ) ( not ( = ?auto_551770 ?auto_551774 ) ) ( not ( = ?auto_551770 ?auto_551775 ) ) ( not ( = ?auto_551770 ?auto_551776 ) ) ( not ( = ?auto_551770 ?auto_551777 ) ) ( not ( = ?auto_551770 ?auto_551778 ) ) ( not ( = ?auto_551770 ?auto_551779 ) ) ( not ( = ?auto_551770 ?auto_551780 ) ) ( not ( = ?auto_551770 ?auto_551781 ) ) ( not ( = ?auto_551770 ?auto_551782 ) ) ( not ( = ?auto_551770 ?auto_551783 ) ) ( not ( = ?auto_551770 ?auto_551784 ) ) ( not ( = ?auto_551770 ?auto_551785 ) ) ( not ( = ?auto_551770 ?auto_551786 ) ) ( not ( = ?auto_551771 ?auto_551772 ) ) ( not ( = ?auto_551771 ?auto_551773 ) ) ( not ( = ?auto_551771 ?auto_551774 ) ) ( not ( = ?auto_551771 ?auto_551775 ) ) ( not ( = ?auto_551771 ?auto_551776 ) ) ( not ( = ?auto_551771 ?auto_551777 ) ) ( not ( = ?auto_551771 ?auto_551778 ) ) ( not ( = ?auto_551771 ?auto_551779 ) ) ( not ( = ?auto_551771 ?auto_551780 ) ) ( not ( = ?auto_551771 ?auto_551781 ) ) ( not ( = ?auto_551771 ?auto_551782 ) ) ( not ( = ?auto_551771 ?auto_551783 ) ) ( not ( = ?auto_551771 ?auto_551784 ) ) ( not ( = ?auto_551771 ?auto_551785 ) ) ( not ( = ?auto_551771 ?auto_551786 ) ) ( not ( = ?auto_551772 ?auto_551773 ) ) ( not ( = ?auto_551772 ?auto_551774 ) ) ( not ( = ?auto_551772 ?auto_551775 ) ) ( not ( = ?auto_551772 ?auto_551776 ) ) ( not ( = ?auto_551772 ?auto_551777 ) ) ( not ( = ?auto_551772 ?auto_551778 ) ) ( not ( = ?auto_551772 ?auto_551779 ) ) ( not ( = ?auto_551772 ?auto_551780 ) ) ( not ( = ?auto_551772 ?auto_551781 ) ) ( not ( = ?auto_551772 ?auto_551782 ) ) ( not ( = ?auto_551772 ?auto_551783 ) ) ( not ( = ?auto_551772 ?auto_551784 ) ) ( not ( = ?auto_551772 ?auto_551785 ) ) ( not ( = ?auto_551772 ?auto_551786 ) ) ( not ( = ?auto_551773 ?auto_551774 ) ) ( not ( = ?auto_551773 ?auto_551775 ) ) ( not ( = ?auto_551773 ?auto_551776 ) ) ( not ( = ?auto_551773 ?auto_551777 ) ) ( not ( = ?auto_551773 ?auto_551778 ) ) ( not ( = ?auto_551773 ?auto_551779 ) ) ( not ( = ?auto_551773 ?auto_551780 ) ) ( not ( = ?auto_551773 ?auto_551781 ) ) ( not ( = ?auto_551773 ?auto_551782 ) ) ( not ( = ?auto_551773 ?auto_551783 ) ) ( not ( = ?auto_551773 ?auto_551784 ) ) ( not ( = ?auto_551773 ?auto_551785 ) ) ( not ( = ?auto_551773 ?auto_551786 ) ) ( not ( = ?auto_551774 ?auto_551775 ) ) ( not ( = ?auto_551774 ?auto_551776 ) ) ( not ( = ?auto_551774 ?auto_551777 ) ) ( not ( = ?auto_551774 ?auto_551778 ) ) ( not ( = ?auto_551774 ?auto_551779 ) ) ( not ( = ?auto_551774 ?auto_551780 ) ) ( not ( = ?auto_551774 ?auto_551781 ) ) ( not ( = ?auto_551774 ?auto_551782 ) ) ( not ( = ?auto_551774 ?auto_551783 ) ) ( not ( = ?auto_551774 ?auto_551784 ) ) ( not ( = ?auto_551774 ?auto_551785 ) ) ( not ( = ?auto_551774 ?auto_551786 ) ) ( not ( = ?auto_551775 ?auto_551776 ) ) ( not ( = ?auto_551775 ?auto_551777 ) ) ( not ( = ?auto_551775 ?auto_551778 ) ) ( not ( = ?auto_551775 ?auto_551779 ) ) ( not ( = ?auto_551775 ?auto_551780 ) ) ( not ( = ?auto_551775 ?auto_551781 ) ) ( not ( = ?auto_551775 ?auto_551782 ) ) ( not ( = ?auto_551775 ?auto_551783 ) ) ( not ( = ?auto_551775 ?auto_551784 ) ) ( not ( = ?auto_551775 ?auto_551785 ) ) ( not ( = ?auto_551775 ?auto_551786 ) ) ( not ( = ?auto_551776 ?auto_551777 ) ) ( not ( = ?auto_551776 ?auto_551778 ) ) ( not ( = ?auto_551776 ?auto_551779 ) ) ( not ( = ?auto_551776 ?auto_551780 ) ) ( not ( = ?auto_551776 ?auto_551781 ) ) ( not ( = ?auto_551776 ?auto_551782 ) ) ( not ( = ?auto_551776 ?auto_551783 ) ) ( not ( = ?auto_551776 ?auto_551784 ) ) ( not ( = ?auto_551776 ?auto_551785 ) ) ( not ( = ?auto_551776 ?auto_551786 ) ) ( not ( = ?auto_551777 ?auto_551778 ) ) ( not ( = ?auto_551777 ?auto_551779 ) ) ( not ( = ?auto_551777 ?auto_551780 ) ) ( not ( = ?auto_551777 ?auto_551781 ) ) ( not ( = ?auto_551777 ?auto_551782 ) ) ( not ( = ?auto_551777 ?auto_551783 ) ) ( not ( = ?auto_551777 ?auto_551784 ) ) ( not ( = ?auto_551777 ?auto_551785 ) ) ( not ( = ?auto_551777 ?auto_551786 ) ) ( not ( = ?auto_551778 ?auto_551779 ) ) ( not ( = ?auto_551778 ?auto_551780 ) ) ( not ( = ?auto_551778 ?auto_551781 ) ) ( not ( = ?auto_551778 ?auto_551782 ) ) ( not ( = ?auto_551778 ?auto_551783 ) ) ( not ( = ?auto_551778 ?auto_551784 ) ) ( not ( = ?auto_551778 ?auto_551785 ) ) ( not ( = ?auto_551778 ?auto_551786 ) ) ( not ( = ?auto_551779 ?auto_551780 ) ) ( not ( = ?auto_551779 ?auto_551781 ) ) ( not ( = ?auto_551779 ?auto_551782 ) ) ( not ( = ?auto_551779 ?auto_551783 ) ) ( not ( = ?auto_551779 ?auto_551784 ) ) ( not ( = ?auto_551779 ?auto_551785 ) ) ( not ( = ?auto_551779 ?auto_551786 ) ) ( not ( = ?auto_551780 ?auto_551781 ) ) ( not ( = ?auto_551780 ?auto_551782 ) ) ( not ( = ?auto_551780 ?auto_551783 ) ) ( not ( = ?auto_551780 ?auto_551784 ) ) ( not ( = ?auto_551780 ?auto_551785 ) ) ( not ( = ?auto_551780 ?auto_551786 ) ) ( not ( = ?auto_551781 ?auto_551782 ) ) ( not ( = ?auto_551781 ?auto_551783 ) ) ( not ( = ?auto_551781 ?auto_551784 ) ) ( not ( = ?auto_551781 ?auto_551785 ) ) ( not ( = ?auto_551781 ?auto_551786 ) ) ( not ( = ?auto_551782 ?auto_551783 ) ) ( not ( = ?auto_551782 ?auto_551784 ) ) ( not ( = ?auto_551782 ?auto_551785 ) ) ( not ( = ?auto_551782 ?auto_551786 ) ) ( not ( = ?auto_551783 ?auto_551784 ) ) ( not ( = ?auto_551783 ?auto_551785 ) ) ( not ( = ?auto_551783 ?auto_551786 ) ) ( not ( = ?auto_551784 ?auto_551785 ) ) ( not ( = ?auto_551784 ?auto_551786 ) ) ( not ( = ?auto_551785 ?auto_551786 ) ) ( CLEAR ?auto_551783 ) ( ON ?auto_551784 ?auto_551785 ) ( CLEAR ?auto_551784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_551770 ?auto_551771 ?auto_551772 ?auto_551773 ?auto_551774 ?auto_551775 ?auto_551776 ?auto_551777 ?auto_551778 ?auto_551779 ?auto_551780 ?auto_551781 ?auto_551782 ?auto_551783 ?auto_551784 )
      ( MAKE-16PILE ?auto_551770 ?auto_551771 ?auto_551772 ?auto_551773 ?auto_551774 ?auto_551775 ?auto_551776 ?auto_551777 ?auto_551778 ?auto_551779 ?auto_551780 ?auto_551781 ?auto_551782 ?auto_551783 ?auto_551784 ?auto_551785 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_551803 - BLOCK
      ?auto_551804 - BLOCK
      ?auto_551805 - BLOCK
      ?auto_551806 - BLOCK
      ?auto_551807 - BLOCK
      ?auto_551808 - BLOCK
      ?auto_551809 - BLOCK
      ?auto_551810 - BLOCK
      ?auto_551811 - BLOCK
      ?auto_551812 - BLOCK
      ?auto_551813 - BLOCK
      ?auto_551814 - BLOCK
      ?auto_551815 - BLOCK
      ?auto_551816 - BLOCK
      ?auto_551817 - BLOCK
      ?auto_551818 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_551818 ) ( ON-TABLE ?auto_551803 ) ( ON ?auto_551804 ?auto_551803 ) ( ON ?auto_551805 ?auto_551804 ) ( ON ?auto_551806 ?auto_551805 ) ( ON ?auto_551807 ?auto_551806 ) ( ON ?auto_551808 ?auto_551807 ) ( ON ?auto_551809 ?auto_551808 ) ( ON ?auto_551810 ?auto_551809 ) ( ON ?auto_551811 ?auto_551810 ) ( ON ?auto_551812 ?auto_551811 ) ( ON ?auto_551813 ?auto_551812 ) ( ON ?auto_551814 ?auto_551813 ) ( ON ?auto_551815 ?auto_551814 ) ( ON ?auto_551816 ?auto_551815 ) ( not ( = ?auto_551803 ?auto_551804 ) ) ( not ( = ?auto_551803 ?auto_551805 ) ) ( not ( = ?auto_551803 ?auto_551806 ) ) ( not ( = ?auto_551803 ?auto_551807 ) ) ( not ( = ?auto_551803 ?auto_551808 ) ) ( not ( = ?auto_551803 ?auto_551809 ) ) ( not ( = ?auto_551803 ?auto_551810 ) ) ( not ( = ?auto_551803 ?auto_551811 ) ) ( not ( = ?auto_551803 ?auto_551812 ) ) ( not ( = ?auto_551803 ?auto_551813 ) ) ( not ( = ?auto_551803 ?auto_551814 ) ) ( not ( = ?auto_551803 ?auto_551815 ) ) ( not ( = ?auto_551803 ?auto_551816 ) ) ( not ( = ?auto_551803 ?auto_551817 ) ) ( not ( = ?auto_551803 ?auto_551818 ) ) ( not ( = ?auto_551804 ?auto_551805 ) ) ( not ( = ?auto_551804 ?auto_551806 ) ) ( not ( = ?auto_551804 ?auto_551807 ) ) ( not ( = ?auto_551804 ?auto_551808 ) ) ( not ( = ?auto_551804 ?auto_551809 ) ) ( not ( = ?auto_551804 ?auto_551810 ) ) ( not ( = ?auto_551804 ?auto_551811 ) ) ( not ( = ?auto_551804 ?auto_551812 ) ) ( not ( = ?auto_551804 ?auto_551813 ) ) ( not ( = ?auto_551804 ?auto_551814 ) ) ( not ( = ?auto_551804 ?auto_551815 ) ) ( not ( = ?auto_551804 ?auto_551816 ) ) ( not ( = ?auto_551804 ?auto_551817 ) ) ( not ( = ?auto_551804 ?auto_551818 ) ) ( not ( = ?auto_551805 ?auto_551806 ) ) ( not ( = ?auto_551805 ?auto_551807 ) ) ( not ( = ?auto_551805 ?auto_551808 ) ) ( not ( = ?auto_551805 ?auto_551809 ) ) ( not ( = ?auto_551805 ?auto_551810 ) ) ( not ( = ?auto_551805 ?auto_551811 ) ) ( not ( = ?auto_551805 ?auto_551812 ) ) ( not ( = ?auto_551805 ?auto_551813 ) ) ( not ( = ?auto_551805 ?auto_551814 ) ) ( not ( = ?auto_551805 ?auto_551815 ) ) ( not ( = ?auto_551805 ?auto_551816 ) ) ( not ( = ?auto_551805 ?auto_551817 ) ) ( not ( = ?auto_551805 ?auto_551818 ) ) ( not ( = ?auto_551806 ?auto_551807 ) ) ( not ( = ?auto_551806 ?auto_551808 ) ) ( not ( = ?auto_551806 ?auto_551809 ) ) ( not ( = ?auto_551806 ?auto_551810 ) ) ( not ( = ?auto_551806 ?auto_551811 ) ) ( not ( = ?auto_551806 ?auto_551812 ) ) ( not ( = ?auto_551806 ?auto_551813 ) ) ( not ( = ?auto_551806 ?auto_551814 ) ) ( not ( = ?auto_551806 ?auto_551815 ) ) ( not ( = ?auto_551806 ?auto_551816 ) ) ( not ( = ?auto_551806 ?auto_551817 ) ) ( not ( = ?auto_551806 ?auto_551818 ) ) ( not ( = ?auto_551807 ?auto_551808 ) ) ( not ( = ?auto_551807 ?auto_551809 ) ) ( not ( = ?auto_551807 ?auto_551810 ) ) ( not ( = ?auto_551807 ?auto_551811 ) ) ( not ( = ?auto_551807 ?auto_551812 ) ) ( not ( = ?auto_551807 ?auto_551813 ) ) ( not ( = ?auto_551807 ?auto_551814 ) ) ( not ( = ?auto_551807 ?auto_551815 ) ) ( not ( = ?auto_551807 ?auto_551816 ) ) ( not ( = ?auto_551807 ?auto_551817 ) ) ( not ( = ?auto_551807 ?auto_551818 ) ) ( not ( = ?auto_551808 ?auto_551809 ) ) ( not ( = ?auto_551808 ?auto_551810 ) ) ( not ( = ?auto_551808 ?auto_551811 ) ) ( not ( = ?auto_551808 ?auto_551812 ) ) ( not ( = ?auto_551808 ?auto_551813 ) ) ( not ( = ?auto_551808 ?auto_551814 ) ) ( not ( = ?auto_551808 ?auto_551815 ) ) ( not ( = ?auto_551808 ?auto_551816 ) ) ( not ( = ?auto_551808 ?auto_551817 ) ) ( not ( = ?auto_551808 ?auto_551818 ) ) ( not ( = ?auto_551809 ?auto_551810 ) ) ( not ( = ?auto_551809 ?auto_551811 ) ) ( not ( = ?auto_551809 ?auto_551812 ) ) ( not ( = ?auto_551809 ?auto_551813 ) ) ( not ( = ?auto_551809 ?auto_551814 ) ) ( not ( = ?auto_551809 ?auto_551815 ) ) ( not ( = ?auto_551809 ?auto_551816 ) ) ( not ( = ?auto_551809 ?auto_551817 ) ) ( not ( = ?auto_551809 ?auto_551818 ) ) ( not ( = ?auto_551810 ?auto_551811 ) ) ( not ( = ?auto_551810 ?auto_551812 ) ) ( not ( = ?auto_551810 ?auto_551813 ) ) ( not ( = ?auto_551810 ?auto_551814 ) ) ( not ( = ?auto_551810 ?auto_551815 ) ) ( not ( = ?auto_551810 ?auto_551816 ) ) ( not ( = ?auto_551810 ?auto_551817 ) ) ( not ( = ?auto_551810 ?auto_551818 ) ) ( not ( = ?auto_551811 ?auto_551812 ) ) ( not ( = ?auto_551811 ?auto_551813 ) ) ( not ( = ?auto_551811 ?auto_551814 ) ) ( not ( = ?auto_551811 ?auto_551815 ) ) ( not ( = ?auto_551811 ?auto_551816 ) ) ( not ( = ?auto_551811 ?auto_551817 ) ) ( not ( = ?auto_551811 ?auto_551818 ) ) ( not ( = ?auto_551812 ?auto_551813 ) ) ( not ( = ?auto_551812 ?auto_551814 ) ) ( not ( = ?auto_551812 ?auto_551815 ) ) ( not ( = ?auto_551812 ?auto_551816 ) ) ( not ( = ?auto_551812 ?auto_551817 ) ) ( not ( = ?auto_551812 ?auto_551818 ) ) ( not ( = ?auto_551813 ?auto_551814 ) ) ( not ( = ?auto_551813 ?auto_551815 ) ) ( not ( = ?auto_551813 ?auto_551816 ) ) ( not ( = ?auto_551813 ?auto_551817 ) ) ( not ( = ?auto_551813 ?auto_551818 ) ) ( not ( = ?auto_551814 ?auto_551815 ) ) ( not ( = ?auto_551814 ?auto_551816 ) ) ( not ( = ?auto_551814 ?auto_551817 ) ) ( not ( = ?auto_551814 ?auto_551818 ) ) ( not ( = ?auto_551815 ?auto_551816 ) ) ( not ( = ?auto_551815 ?auto_551817 ) ) ( not ( = ?auto_551815 ?auto_551818 ) ) ( not ( = ?auto_551816 ?auto_551817 ) ) ( not ( = ?auto_551816 ?auto_551818 ) ) ( not ( = ?auto_551817 ?auto_551818 ) ) ( CLEAR ?auto_551816 ) ( ON ?auto_551817 ?auto_551818 ) ( CLEAR ?auto_551817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_551803 ?auto_551804 ?auto_551805 ?auto_551806 ?auto_551807 ?auto_551808 ?auto_551809 ?auto_551810 ?auto_551811 ?auto_551812 ?auto_551813 ?auto_551814 ?auto_551815 ?auto_551816 ?auto_551817 )
      ( MAKE-16PILE ?auto_551803 ?auto_551804 ?auto_551805 ?auto_551806 ?auto_551807 ?auto_551808 ?auto_551809 ?auto_551810 ?auto_551811 ?auto_551812 ?auto_551813 ?auto_551814 ?auto_551815 ?auto_551816 ?auto_551817 ?auto_551818 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_551835 - BLOCK
      ?auto_551836 - BLOCK
      ?auto_551837 - BLOCK
      ?auto_551838 - BLOCK
      ?auto_551839 - BLOCK
      ?auto_551840 - BLOCK
      ?auto_551841 - BLOCK
      ?auto_551842 - BLOCK
      ?auto_551843 - BLOCK
      ?auto_551844 - BLOCK
      ?auto_551845 - BLOCK
      ?auto_551846 - BLOCK
      ?auto_551847 - BLOCK
      ?auto_551848 - BLOCK
      ?auto_551849 - BLOCK
      ?auto_551850 - BLOCK
    )
    :vars
    (
      ?auto_551851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_551850 ?auto_551851 ) ( ON-TABLE ?auto_551835 ) ( ON ?auto_551836 ?auto_551835 ) ( ON ?auto_551837 ?auto_551836 ) ( ON ?auto_551838 ?auto_551837 ) ( ON ?auto_551839 ?auto_551838 ) ( ON ?auto_551840 ?auto_551839 ) ( ON ?auto_551841 ?auto_551840 ) ( ON ?auto_551842 ?auto_551841 ) ( ON ?auto_551843 ?auto_551842 ) ( ON ?auto_551844 ?auto_551843 ) ( ON ?auto_551845 ?auto_551844 ) ( ON ?auto_551846 ?auto_551845 ) ( ON ?auto_551847 ?auto_551846 ) ( not ( = ?auto_551835 ?auto_551836 ) ) ( not ( = ?auto_551835 ?auto_551837 ) ) ( not ( = ?auto_551835 ?auto_551838 ) ) ( not ( = ?auto_551835 ?auto_551839 ) ) ( not ( = ?auto_551835 ?auto_551840 ) ) ( not ( = ?auto_551835 ?auto_551841 ) ) ( not ( = ?auto_551835 ?auto_551842 ) ) ( not ( = ?auto_551835 ?auto_551843 ) ) ( not ( = ?auto_551835 ?auto_551844 ) ) ( not ( = ?auto_551835 ?auto_551845 ) ) ( not ( = ?auto_551835 ?auto_551846 ) ) ( not ( = ?auto_551835 ?auto_551847 ) ) ( not ( = ?auto_551835 ?auto_551848 ) ) ( not ( = ?auto_551835 ?auto_551849 ) ) ( not ( = ?auto_551835 ?auto_551850 ) ) ( not ( = ?auto_551835 ?auto_551851 ) ) ( not ( = ?auto_551836 ?auto_551837 ) ) ( not ( = ?auto_551836 ?auto_551838 ) ) ( not ( = ?auto_551836 ?auto_551839 ) ) ( not ( = ?auto_551836 ?auto_551840 ) ) ( not ( = ?auto_551836 ?auto_551841 ) ) ( not ( = ?auto_551836 ?auto_551842 ) ) ( not ( = ?auto_551836 ?auto_551843 ) ) ( not ( = ?auto_551836 ?auto_551844 ) ) ( not ( = ?auto_551836 ?auto_551845 ) ) ( not ( = ?auto_551836 ?auto_551846 ) ) ( not ( = ?auto_551836 ?auto_551847 ) ) ( not ( = ?auto_551836 ?auto_551848 ) ) ( not ( = ?auto_551836 ?auto_551849 ) ) ( not ( = ?auto_551836 ?auto_551850 ) ) ( not ( = ?auto_551836 ?auto_551851 ) ) ( not ( = ?auto_551837 ?auto_551838 ) ) ( not ( = ?auto_551837 ?auto_551839 ) ) ( not ( = ?auto_551837 ?auto_551840 ) ) ( not ( = ?auto_551837 ?auto_551841 ) ) ( not ( = ?auto_551837 ?auto_551842 ) ) ( not ( = ?auto_551837 ?auto_551843 ) ) ( not ( = ?auto_551837 ?auto_551844 ) ) ( not ( = ?auto_551837 ?auto_551845 ) ) ( not ( = ?auto_551837 ?auto_551846 ) ) ( not ( = ?auto_551837 ?auto_551847 ) ) ( not ( = ?auto_551837 ?auto_551848 ) ) ( not ( = ?auto_551837 ?auto_551849 ) ) ( not ( = ?auto_551837 ?auto_551850 ) ) ( not ( = ?auto_551837 ?auto_551851 ) ) ( not ( = ?auto_551838 ?auto_551839 ) ) ( not ( = ?auto_551838 ?auto_551840 ) ) ( not ( = ?auto_551838 ?auto_551841 ) ) ( not ( = ?auto_551838 ?auto_551842 ) ) ( not ( = ?auto_551838 ?auto_551843 ) ) ( not ( = ?auto_551838 ?auto_551844 ) ) ( not ( = ?auto_551838 ?auto_551845 ) ) ( not ( = ?auto_551838 ?auto_551846 ) ) ( not ( = ?auto_551838 ?auto_551847 ) ) ( not ( = ?auto_551838 ?auto_551848 ) ) ( not ( = ?auto_551838 ?auto_551849 ) ) ( not ( = ?auto_551838 ?auto_551850 ) ) ( not ( = ?auto_551838 ?auto_551851 ) ) ( not ( = ?auto_551839 ?auto_551840 ) ) ( not ( = ?auto_551839 ?auto_551841 ) ) ( not ( = ?auto_551839 ?auto_551842 ) ) ( not ( = ?auto_551839 ?auto_551843 ) ) ( not ( = ?auto_551839 ?auto_551844 ) ) ( not ( = ?auto_551839 ?auto_551845 ) ) ( not ( = ?auto_551839 ?auto_551846 ) ) ( not ( = ?auto_551839 ?auto_551847 ) ) ( not ( = ?auto_551839 ?auto_551848 ) ) ( not ( = ?auto_551839 ?auto_551849 ) ) ( not ( = ?auto_551839 ?auto_551850 ) ) ( not ( = ?auto_551839 ?auto_551851 ) ) ( not ( = ?auto_551840 ?auto_551841 ) ) ( not ( = ?auto_551840 ?auto_551842 ) ) ( not ( = ?auto_551840 ?auto_551843 ) ) ( not ( = ?auto_551840 ?auto_551844 ) ) ( not ( = ?auto_551840 ?auto_551845 ) ) ( not ( = ?auto_551840 ?auto_551846 ) ) ( not ( = ?auto_551840 ?auto_551847 ) ) ( not ( = ?auto_551840 ?auto_551848 ) ) ( not ( = ?auto_551840 ?auto_551849 ) ) ( not ( = ?auto_551840 ?auto_551850 ) ) ( not ( = ?auto_551840 ?auto_551851 ) ) ( not ( = ?auto_551841 ?auto_551842 ) ) ( not ( = ?auto_551841 ?auto_551843 ) ) ( not ( = ?auto_551841 ?auto_551844 ) ) ( not ( = ?auto_551841 ?auto_551845 ) ) ( not ( = ?auto_551841 ?auto_551846 ) ) ( not ( = ?auto_551841 ?auto_551847 ) ) ( not ( = ?auto_551841 ?auto_551848 ) ) ( not ( = ?auto_551841 ?auto_551849 ) ) ( not ( = ?auto_551841 ?auto_551850 ) ) ( not ( = ?auto_551841 ?auto_551851 ) ) ( not ( = ?auto_551842 ?auto_551843 ) ) ( not ( = ?auto_551842 ?auto_551844 ) ) ( not ( = ?auto_551842 ?auto_551845 ) ) ( not ( = ?auto_551842 ?auto_551846 ) ) ( not ( = ?auto_551842 ?auto_551847 ) ) ( not ( = ?auto_551842 ?auto_551848 ) ) ( not ( = ?auto_551842 ?auto_551849 ) ) ( not ( = ?auto_551842 ?auto_551850 ) ) ( not ( = ?auto_551842 ?auto_551851 ) ) ( not ( = ?auto_551843 ?auto_551844 ) ) ( not ( = ?auto_551843 ?auto_551845 ) ) ( not ( = ?auto_551843 ?auto_551846 ) ) ( not ( = ?auto_551843 ?auto_551847 ) ) ( not ( = ?auto_551843 ?auto_551848 ) ) ( not ( = ?auto_551843 ?auto_551849 ) ) ( not ( = ?auto_551843 ?auto_551850 ) ) ( not ( = ?auto_551843 ?auto_551851 ) ) ( not ( = ?auto_551844 ?auto_551845 ) ) ( not ( = ?auto_551844 ?auto_551846 ) ) ( not ( = ?auto_551844 ?auto_551847 ) ) ( not ( = ?auto_551844 ?auto_551848 ) ) ( not ( = ?auto_551844 ?auto_551849 ) ) ( not ( = ?auto_551844 ?auto_551850 ) ) ( not ( = ?auto_551844 ?auto_551851 ) ) ( not ( = ?auto_551845 ?auto_551846 ) ) ( not ( = ?auto_551845 ?auto_551847 ) ) ( not ( = ?auto_551845 ?auto_551848 ) ) ( not ( = ?auto_551845 ?auto_551849 ) ) ( not ( = ?auto_551845 ?auto_551850 ) ) ( not ( = ?auto_551845 ?auto_551851 ) ) ( not ( = ?auto_551846 ?auto_551847 ) ) ( not ( = ?auto_551846 ?auto_551848 ) ) ( not ( = ?auto_551846 ?auto_551849 ) ) ( not ( = ?auto_551846 ?auto_551850 ) ) ( not ( = ?auto_551846 ?auto_551851 ) ) ( not ( = ?auto_551847 ?auto_551848 ) ) ( not ( = ?auto_551847 ?auto_551849 ) ) ( not ( = ?auto_551847 ?auto_551850 ) ) ( not ( = ?auto_551847 ?auto_551851 ) ) ( not ( = ?auto_551848 ?auto_551849 ) ) ( not ( = ?auto_551848 ?auto_551850 ) ) ( not ( = ?auto_551848 ?auto_551851 ) ) ( not ( = ?auto_551849 ?auto_551850 ) ) ( not ( = ?auto_551849 ?auto_551851 ) ) ( not ( = ?auto_551850 ?auto_551851 ) ) ( ON ?auto_551849 ?auto_551850 ) ( CLEAR ?auto_551847 ) ( ON ?auto_551848 ?auto_551849 ) ( CLEAR ?auto_551848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_551835 ?auto_551836 ?auto_551837 ?auto_551838 ?auto_551839 ?auto_551840 ?auto_551841 ?auto_551842 ?auto_551843 ?auto_551844 ?auto_551845 ?auto_551846 ?auto_551847 ?auto_551848 )
      ( MAKE-16PILE ?auto_551835 ?auto_551836 ?auto_551837 ?auto_551838 ?auto_551839 ?auto_551840 ?auto_551841 ?auto_551842 ?auto_551843 ?auto_551844 ?auto_551845 ?auto_551846 ?auto_551847 ?auto_551848 ?auto_551849 ?auto_551850 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_551868 - BLOCK
      ?auto_551869 - BLOCK
      ?auto_551870 - BLOCK
      ?auto_551871 - BLOCK
      ?auto_551872 - BLOCK
      ?auto_551873 - BLOCK
      ?auto_551874 - BLOCK
      ?auto_551875 - BLOCK
      ?auto_551876 - BLOCK
      ?auto_551877 - BLOCK
      ?auto_551878 - BLOCK
      ?auto_551879 - BLOCK
      ?auto_551880 - BLOCK
      ?auto_551881 - BLOCK
      ?auto_551882 - BLOCK
      ?auto_551883 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_551883 ) ( ON-TABLE ?auto_551868 ) ( ON ?auto_551869 ?auto_551868 ) ( ON ?auto_551870 ?auto_551869 ) ( ON ?auto_551871 ?auto_551870 ) ( ON ?auto_551872 ?auto_551871 ) ( ON ?auto_551873 ?auto_551872 ) ( ON ?auto_551874 ?auto_551873 ) ( ON ?auto_551875 ?auto_551874 ) ( ON ?auto_551876 ?auto_551875 ) ( ON ?auto_551877 ?auto_551876 ) ( ON ?auto_551878 ?auto_551877 ) ( ON ?auto_551879 ?auto_551878 ) ( ON ?auto_551880 ?auto_551879 ) ( not ( = ?auto_551868 ?auto_551869 ) ) ( not ( = ?auto_551868 ?auto_551870 ) ) ( not ( = ?auto_551868 ?auto_551871 ) ) ( not ( = ?auto_551868 ?auto_551872 ) ) ( not ( = ?auto_551868 ?auto_551873 ) ) ( not ( = ?auto_551868 ?auto_551874 ) ) ( not ( = ?auto_551868 ?auto_551875 ) ) ( not ( = ?auto_551868 ?auto_551876 ) ) ( not ( = ?auto_551868 ?auto_551877 ) ) ( not ( = ?auto_551868 ?auto_551878 ) ) ( not ( = ?auto_551868 ?auto_551879 ) ) ( not ( = ?auto_551868 ?auto_551880 ) ) ( not ( = ?auto_551868 ?auto_551881 ) ) ( not ( = ?auto_551868 ?auto_551882 ) ) ( not ( = ?auto_551868 ?auto_551883 ) ) ( not ( = ?auto_551869 ?auto_551870 ) ) ( not ( = ?auto_551869 ?auto_551871 ) ) ( not ( = ?auto_551869 ?auto_551872 ) ) ( not ( = ?auto_551869 ?auto_551873 ) ) ( not ( = ?auto_551869 ?auto_551874 ) ) ( not ( = ?auto_551869 ?auto_551875 ) ) ( not ( = ?auto_551869 ?auto_551876 ) ) ( not ( = ?auto_551869 ?auto_551877 ) ) ( not ( = ?auto_551869 ?auto_551878 ) ) ( not ( = ?auto_551869 ?auto_551879 ) ) ( not ( = ?auto_551869 ?auto_551880 ) ) ( not ( = ?auto_551869 ?auto_551881 ) ) ( not ( = ?auto_551869 ?auto_551882 ) ) ( not ( = ?auto_551869 ?auto_551883 ) ) ( not ( = ?auto_551870 ?auto_551871 ) ) ( not ( = ?auto_551870 ?auto_551872 ) ) ( not ( = ?auto_551870 ?auto_551873 ) ) ( not ( = ?auto_551870 ?auto_551874 ) ) ( not ( = ?auto_551870 ?auto_551875 ) ) ( not ( = ?auto_551870 ?auto_551876 ) ) ( not ( = ?auto_551870 ?auto_551877 ) ) ( not ( = ?auto_551870 ?auto_551878 ) ) ( not ( = ?auto_551870 ?auto_551879 ) ) ( not ( = ?auto_551870 ?auto_551880 ) ) ( not ( = ?auto_551870 ?auto_551881 ) ) ( not ( = ?auto_551870 ?auto_551882 ) ) ( not ( = ?auto_551870 ?auto_551883 ) ) ( not ( = ?auto_551871 ?auto_551872 ) ) ( not ( = ?auto_551871 ?auto_551873 ) ) ( not ( = ?auto_551871 ?auto_551874 ) ) ( not ( = ?auto_551871 ?auto_551875 ) ) ( not ( = ?auto_551871 ?auto_551876 ) ) ( not ( = ?auto_551871 ?auto_551877 ) ) ( not ( = ?auto_551871 ?auto_551878 ) ) ( not ( = ?auto_551871 ?auto_551879 ) ) ( not ( = ?auto_551871 ?auto_551880 ) ) ( not ( = ?auto_551871 ?auto_551881 ) ) ( not ( = ?auto_551871 ?auto_551882 ) ) ( not ( = ?auto_551871 ?auto_551883 ) ) ( not ( = ?auto_551872 ?auto_551873 ) ) ( not ( = ?auto_551872 ?auto_551874 ) ) ( not ( = ?auto_551872 ?auto_551875 ) ) ( not ( = ?auto_551872 ?auto_551876 ) ) ( not ( = ?auto_551872 ?auto_551877 ) ) ( not ( = ?auto_551872 ?auto_551878 ) ) ( not ( = ?auto_551872 ?auto_551879 ) ) ( not ( = ?auto_551872 ?auto_551880 ) ) ( not ( = ?auto_551872 ?auto_551881 ) ) ( not ( = ?auto_551872 ?auto_551882 ) ) ( not ( = ?auto_551872 ?auto_551883 ) ) ( not ( = ?auto_551873 ?auto_551874 ) ) ( not ( = ?auto_551873 ?auto_551875 ) ) ( not ( = ?auto_551873 ?auto_551876 ) ) ( not ( = ?auto_551873 ?auto_551877 ) ) ( not ( = ?auto_551873 ?auto_551878 ) ) ( not ( = ?auto_551873 ?auto_551879 ) ) ( not ( = ?auto_551873 ?auto_551880 ) ) ( not ( = ?auto_551873 ?auto_551881 ) ) ( not ( = ?auto_551873 ?auto_551882 ) ) ( not ( = ?auto_551873 ?auto_551883 ) ) ( not ( = ?auto_551874 ?auto_551875 ) ) ( not ( = ?auto_551874 ?auto_551876 ) ) ( not ( = ?auto_551874 ?auto_551877 ) ) ( not ( = ?auto_551874 ?auto_551878 ) ) ( not ( = ?auto_551874 ?auto_551879 ) ) ( not ( = ?auto_551874 ?auto_551880 ) ) ( not ( = ?auto_551874 ?auto_551881 ) ) ( not ( = ?auto_551874 ?auto_551882 ) ) ( not ( = ?auto_551874 ?auto_551883 ) ) ( not ( = ?auto_551875 ?auto_551876 ) ) ( not ( = ?auto_551875 ?auto_551877 ) ) ( not ( = ?auto_551875 ?auto_551878 ) ) ( not ( = ?auto_551875 ?auto_551879 ) ) ( not ( = ?auto_551875 ?auto_551880 ) ) ( not ( = ?auto_551875 ?auto_551881 ) ) ( not ( = ?auto_551875 ?auto_551882 ) ) ( not ( = ?auto_551875 ?auto_551883 ) ) ( not ( = ?auto_551876 ?auto_551877 ) ) ( not ( = ?auto_551876 ?auto_551878 ) ) ( not ( = ?auto_551876 ?auto_551879 ) ) ( not ( = ?auto_551876 ?auto_551880 ) ) ( not ( = ?auto_551876 ?auto_551881 ) ) ( not ( = ?auto_551876 ?auto_551882 ) ) ( not ( = ?auto_551876 ?auto_551883 ) ) ( not ( = ?auto_551877 ?auto_551878 ) ) ( not ( = ?auto_551877 ?auto_551879 ) ) ( not ( = ?auto_551877 ?auto_551880 ) ) ( not ( = ?auto_551877 ?auto_551881 ) ) ( not ( = ?auto_551877 ?auto_551882 ) ) ( not ( = ?auto_551877 ?auto_551883 ) ) ( not ( = ?auto_551878 ?auto_551879 ) ) ( not ( = ?auto_551878 ?auto_551880 ) ) ( not ( = ?auto_551878 ?auto_551881 ) ) ( not ( = ?auto_551878 ?auto_551882 ) ) ( not ( = ?auto_551878 ?auto_551883 ) ) ( not ( = ?auto_551879 ?auto_551880 ) ) ( not ( = ?auto_551879 ?auto_551881 ) ) ( not ( = ?auto_551879 ?auto_551882 ) ) ( not ( = ?auto_551879 ?auto_551883 ) ) ( not ( = ?auto_551880 ?auto_551881 ) ) ( not ( = ?auto_551880 ?auto_551882 ) ) ( not ( = ?auto_551880 ?auto_551883 ) ) ( not ( = ?auto_551881 ?auto_551882 ) ) ( not ( = ?auto_551881 ?auto_551883 ) ) ( not ( = ?auto_551882 ?auto_551883 ) ) ( ON ?auto_551882 ?auto_551883 ) ( CLEAR ?auto_551880 ) ( ON ?auto_551881 ?auto_551882 ) ( CLEAR ?auto_551881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_551868 ?auto_551869 ?auto_551870 ?auto_551871 ?auto_551872 ?auto_551873 ?auto_551874 ?auto_551875 ?auto_551876 ?auto_551877 ?auto_551878 ?auto_551879 ?auto_551880 ?auto_551881 )
      ( MAKE-16PILE ?auto_551868 ?auto_551869 ?auto_551870 ?auto_551871 ?auto_551872 ?auto_551873 ?auto_551874 ?auto_551875 ?auto_551876 ?auto_551877 ?auto_551878 ?auto_551879 ?auto_551880 ?auto_551881 ?auto_551882 ?auto_551883 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_551900 - BLOCK
      ?auto_551901 - BLOCK
      ?auto_551902 - BLOCK
      ?auto_551903 - BLOCK
      ?auto_551904 - BLOCK
      ?auto_551905 - BLOCK
      ?auto_551906 - BLOCK
      ?auto_551907 - BLOCK
      ?auto_551908 - BLOCK
      ?auto_551909 - BLOCK
      ?auto_551910 - BLOCK
      ?auto_551911 - BLOCK
      ?auto_551912 - BLOCK
      ?auto_551913 - BLOCK
      ?auto_551914 - BLOCK
      ?auto_551915 - BLOCK
    )
    :vars
    (
      ?auto_551916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_551915 ?auto_551916 ) ( ON-TABLE ?auto_551900 ) ( ON ?auto_551901 ?auto_551900 ) ( ON ?auto_551902 ?auto_551901 ) ( ON ?auto_551903 ?auto_551902 ) ( ON ?auto_551904 ?auto_551903 ) ( ON ?auto_551905 ?auto_551904 ) ( ON ?auto_551906 ?auto_551905 ) ( ON ?auto_551907 ?auto_551906 ) ( ON ?auto_551908 ?auto_551907 ) ( ON ?auto_551909 ?auto_551908 ) ( ON ?auto_551910 ?auto_551909 ) ( ON ?auto_551911 ?auto_551910 ) ( not ( = ?auto_551900 ?auto_551901 ) ) ( not ( = ?auto_551900 ?auto_551902 ) ) ( not ( = ?auto_551900 ?auto_551903 ) ) ( not ( = ?auto_551900 ?auto_551904 ) ) ( not ( = ?auto_551900 ?auto_551905 ) ) ( not ( = ?auto_551900 ?auto_551906 ) ) ( not ( = ?auto_551900 ?auto_551907 ) ) ( not ( = ?auto_551900 ?auto_551908 ) ) ( not ( = ?auto_551900 ?auto_551909 ) ) ( not ( = ?auto_551900 ?auto_551910 ) ) ( not ( = ?auto_551900 ?auto_551911 ) ) ( not ( = ?auto_551900 ?auto_551912 ) ) ( not ( = ?auto_551900 ?auto_551913 ) ) ( not ( = ?auto_551900 ?auto_551914 ) ) ( not ( = ?auto_551900 ?auto_551915 ) ) ( not ( = ?auto_551900 ?auto_551916 ) ) ( not ( = ?auto_551901 ?auto_551902 ) ) ( not ( = ?auto_551901 ?auto_551903 ) ) ( not ( = ?auto_551901 ?auto_551904 ) ) ( not ( = ?auto_551901 ?auto_551905 ) ) ( not ( = ?auto_551901 ?auto_551906 ) ) ( not ( = ?auto_551901 ?auto_551907 ) ) ( not ( = ?auto_551901 ?auto_551908 ) ) ( not ( = ?auto_551901 ?auto_551909 ) ) ( not ( = ?auto_551901 ?auto_551910 ) ) ( not ( = ?auto_551901 ?auto_551911 ) ) ( not ( = ?auto_551901 ?auto_551912 ) ) ( not ( = ?auto_551901 ?auto_551913 ) ) ( not ( = ?auto_551901 ?auto_551914 ) ) ( not ( = ?auto_551901 ?auto_551915 ) ) ( not ( = ?auto_551901 ?auto_551916 ) ) ( not ( = ?auto_551902 ?auto_551903 ) ) ( not ( = ?auto_551902 ?auto_551904 ) ) ( not ( = ?auto_551902 ?auto_551905 ) ) ( not ( = ?auto_551902 ?auto_551906 ) ) ( not ( = ?auto_551902 ?auto_551907 ) ) ( not ( = ?auto_551902 ?auto_551908 ) ) ( not ( = ?auto_551902 ?auto_551909 ) ) ( not ( = ?auto_551902 ?auto_551910 ) ) ( not ( = ?auto_551902 ?auto_551911 ) ) ( not ( = ?auto_551902 ?auto_551912 ) ) ( not ( = ?auto_551902 ?auto_551913 ) ) ( not ( = ?auto_551902 ?auto_551914 ) ) ( not ( = ?auto_551902 ?auto_551915 ) ) ( not ( = ?auto_551902 ?auto_551916 ) ) ( not ( = ?auto_551903 ?auto_551904 ) ) ( not ( = ?auto_551903 ?auto_551905 ) ) ( not ( = ?auto_551903 ?auto_551906 ) ) ( not ( = ?auto_551903 ?auto_551907 ) ) ( not ( = ?auto_551903 ?auto_551908 ) ) ( not ( = ?auto_551903 ?auto_551909 ) ) ( not ( = ?auto_551903 ?auto_551910 ) ) ( not ( = ?auto_551903 ?auto_551911 ) ) ( not ( = ?auto_551903 ?auto_551912 ) ) ( not ( = ?auto_551903 ?auto_551913 ) ) ( not ( = ?auto_551903 ?auto_551914 ) ) ( not ( = ?auto_551903 ?auto_551915 ) ) ( not ( = ?auto_551903 ?auto_551916 ) ) ( not ( = ?auto_551904 ?auto_551905 ) ) ( not ( = ?auto_551904 ?auto_551906 ) ) ( not ( = ?auto_551904 ?auto_551907 ) ) ( not ( = ?auto_551904 ?auto_551908 ) ) ( not ( = ?auto_551904 ?auto_551909 ) ) ( not ( = ?auto_551904 ?auto_551910 ) ) ( not ( = ?auto_551904 ?auto_551911 ) ) ( not ( = ?auto_551904 ?auto_551912 ) ) ( not ( = ?auto_551904 ?auto_551913 ) ) ( not ( = ?auto_551904 ?auto_551914 ) ) ( not ( = ?auto_551904 ?auto_551915 ) ) ( not ( = ?auto_551904 ?auto_551916 ) ) ( not ( = ?auto_551905 ?auto_551906 ) ) ( not ( = ?auto_551905 ?auto_551907 ) ) ( not ( = ?auto_551905 ?auto_551908 ) ) ( not ( = ?auto_551905 ?auto_551909 ) ) ( not ( = ?auto_551905 ?auto_551910 ) ) ( not ( = ?auto_551905 ?auto_551911 ) ) ( not ( = ?auto_551905 ?auto_551912 ) ) ( not ( = ?auto_551905 ?auto_551913 ) ) ( not ( = ?auto_551905 ?auto_551914 ) ) ( not ( = ?auto_551905 ?auto_551915 ) ) ( not ( = ?auto_551905 ?auto_551916 ) ) ( not ( = ?auto_551906 ?auto_551907 ) ) ( not ( = ?auto_551906 ?auto_551908 ) ) ( not ( = ?auto_551906 ?auto_551909 ) ) ( not ( = ?auto_551906 ?auto_551910 ) ) ( not ( = ?auto_551906 ?auto_551911 ) ) ( not ( = ?auto_551906 ?auto_551912 ) ) ( not ( = ?auto_551906 ?auto_551913 ) ) ( not ( = ?auto_551906 ?auto_551914 ) ) ( not ( = ?auto_551906 ?auto_551915 ) ) ( not ( = ?auto_551906 ?auto_551916 ) ) ( not ( = ?auto_551907 ?auto_551908 ) ) ( not ( = ?auto_551907 ?auto_551909 ) ) ( not ( = ?auto_551907 ?auto_551910 ) ) ( not ( = ?auto_551907 ?auto_551911 ) ) ( not ( = ?auto_551907 ?auto_551912 ) ) ( not ( = ?auto_551907 ?auto_551913 ) ) ( not ( = ?auto_551907 ?auto_551914 ) ) ( not ( = ?auto_551907 ?auto_551915 ) ) ( not ( = ?auto_551907 ?auto_551916 ) ) ( not ( = ?auto_551908 ?auto_551909 ) ) ( not ( = ?auto_551908 ?auto_551910 ) ) ( not ( = ?auto_551908 ?auto_551911 ) ) ( not ( = ?auto_551908 ?auto_551912 ) ) ( not ( = ?auto_551908 ?auto_551913 ) ) ( not ( = ?auto_551908 ?auto_551914 ) ) ( not ( = ?auto_551908 ?auto_551915 ) ) ( not ( = ?auto_551908 ?auto_551916 ) ) ( not ( = ?auto_551909 ?auto_551910 ) ) ( not ( = ?auto_551909 ?auto_551911 ) ) ( not ( = ?auto_551909 ?auto_551912 ) ) ( not ( = ?auto_551909 ?auto_551913 ) ) ( not ( = ?auto_551909 ?auto_551914 ) ) ( not ( = ?auto_551909 ?auto_551915 ) ) ( not ( = ?auto_551909 ?auto_551916 ) ) ( not ( = ?auto_551910 ?auto_551911 ) ) ( not ( = ?auto_551910 ?auto_551912 ) ) ( not ( = ?auto_551910 ?auto_551913 ) ) ( not ( = ?auto_551910 ?auto_551914 ) ) ( not ( = ?auto_551910 ?auto_551915 ) ) ( not ( = ?auto_551910 ?auto_551916 ) ) ( not ( = ?auto_551911 ?auto_551912 ) ) ( not ( = ?auto_551911 ?auto_551913 ) ) ( not ( = ?auto_551911 ?auto_551914 ) ) ( not ( = ?auto_551911 ?auto_551915 ) ) ( not ( = ?auto_551911 ?auto_551916 ) ) ( not ( = ?auto_551912 ?auto_551913 ) ) ( not ( = ?auto_551912 ?auto_551914 ) ) ( not ( = ?auto_551912 ?auto_551915 ) ) ( not ( = ?auto_551912 ?auto_551916 ) ) ( not ( = ?auto_551913 ?auto_551914 ) ) ( not ( = ?auto_551913 ?auto_551915 ) ) ( not ( = ?auto_551913 ?auto_551916 ) ) ( not ( = ?auto_551914 ?auto_551915 ) ) ( not ( = ?auto_551914 ?auto_551916 ) ) ( not ( = ?auto_551915 ?auto_551916 ) ) ( ON ?auto_551914 ?auto_551915 ) ( ON ?auto_551913 ?auto_551914 ) ( CLEAR ?auto_551911 ) ( ON ?auto_551912 ?auto_551913 ) ( CLEAR ?auto_551912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_551900 ?auto_551901 ?auto_551902 ?auto_551903 ?auto_551904 ?auto_551905 ?auto_551906 ?auto_551907 ?auto_551908 ?auto_551909 ?auto_551910 ?auto_551911 ?auto_551912 )
      ( MAKE-16PILE ?auto_551900 ?auto_551901 ?auto_551902 ?auto_551903 ?auto_551904 ?auto_551905 ?auto_551906 ?auto_551907 ?auto_551908 ?auto_551909 ?auto_551910 ?auto_551911 ?auto_551912 ?auto_551913 ?auto_551914 ?auto_551915 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_551933 - BLOCK
      ?auto_551934 - BLOCK
      ?auto_551935 - BLOCK
      ?auto_551936 - BLOCK
      ?auto_551937 - BLOCK
      ?auto_551938 - BLOCK
      ?auto_551939 - BLOCK
      ?auto_551940 - BLOCK
      ?auto_551941 - BLOCK
      ?auto_551942 - BLOCK
      ?auto_551943 - BLOCK
      ?auto_551944 - BLOCK
      ?auto_551945 - BLOCK
      ?auto_551946 - BLOCK
      ?auto_551947 - BLOCK
      ?auto_551948 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_551948 ) ( ON-TABLE ?auto_551933 ) ( ON ?auto_551934 ?auto_551933 ) ( ON ?auto_551935 ?auto_551934 ) ( ON ?auto_551936 ?auto_551935 ) ( ON ?auto_551937 ?auto_551936 ) ( ON ?auto_551938 ?auto_551937 ) ( ON ?auto_551939 ?auto_551938 ) ( ON ?auto_551940 ?auto_551939 ) ( ON ?auto_551941 ?auto_551940 ) ( ON ?auto_551942 ?auto_551941 ) ( ON ?auto_551943 ?auto_551942 ) ( ON ?auto_551944 ?auto_551943 ) ( not ( = ?auto_551933 ?auto_551934 ) ) ( not ( = ?auto_551933 ?auto_551935 ) ) ( not ( = ?auto_551933 ?auto_551936 ) ) ( not ( = ?auto_551933 ?auto_551937 ) ) ( not ( = ?auto_551933 ?auto_551938 ) ) ( not ( = ?auto_551933 ?auto_551939 ) ) ( not ( = ?auto_551933 ?auto_551940 ) ) ( not ( = ?auto_551933 ?auto_551941 ) ) ( not ( = ?auto_551933 ?auto_551942 ) ) ( not ( = ?auto_551933 ?auto_551943 ) ) ( not ( = ?auto_551933 ?auto_551944 ) ) ( not ( = ?auto_551933 ?auto_551945 ) ) ( not ( = ?auto_551933 ?auto_551946 ) ) ( not ( = ?auto_551933 ?auto_551947 ) ) ( not ( = ?auto_551933 ?auto_551948 ) ) ( not ( = ?auto_551934 ?auto_551935 ) ) ( not ( = ?auto_551934 ?auto_551936 ) ) ( not ( = ?auto_551934 ?auto_551937 ) ) ( not ( = ?auto_551934 ?auto_551938 ) ) ( not ( = ?auto_551934 ?auto_551939 ) ) ( not ( = ?auto_551934 ?auto_551940 ) ) ( not ( = ?auto_551934 ?auto_551941 ) ) ( not ( = ?auto_551934 ?auto_551942 ) ) ( not ( = ?auto_551934 ?auto_551943 ) ) ( not ( = ?auto_551934 ?auto_551944 ) ) ( not ( = ?auto_551934 ?auto_551945 ) ) ( not ( = ?auto_551934 ?auto_551946 ) ) ( not ( = ?auto_551934 ?auto_551947 ) ) ( not ( = ?auto_551934 ?auto_551948 ) ) ( not ( = ?auto_551935 ?auto_551936 ) ) ( not ( = ?auto_551935 ?auto_551937 ) ) ( not ( = ?auto_551935 ?auto_551938 ) ) ( not ( = ?auto_551935 ?auto_551939 ) ) ( not ( = ?auto_551935 ?auto_551940 ) ) ( not ( = ?auto_551935 ?auto_551941 ) ) ( not ( = ?auto_551935 ?auto_551942 ) ) ( not ( = ?auto_551935 ?auto_551943 ) ) ( not ( = ?auto_551935 ?auto_551944 ) ) ( not ( = ?auto_551935 ?auto_551945 ) ) ( not ( = ?auto_551935 ?auto_551946 ) ) ( not ( = ?auto_551935 ?auto_551947 ) ) ( not ( = ?auto_551935 ?auto_551948 ) ) ( not ( = ?auto_551936 ?auto_551937 ) ) ( not ( = ?auto_551936 ?auto_551938 ) ) ( not ( = ?auto_551936 ?auto_551939 ) ) ( not ( = ?auto_551936 ?auto_551940 ) ) ( not ( = ?auto_551936 ?auto_551941 ) ) ( not ( = ?auto_551936 ?auto_551942 ) ) ( not ( = ?auto_551936 ?auto_551943 ) ) ( not ( = ?auto_551936 ?auto_551944 ) ) ( not ( = ?auto_551936 ?auto_551945 ) ) ( not ( = ?auto_551936 ?auto_551946 ) ) ( not ( = ?auto_551936 ?auto_551947 ) ) ( not ( = ?auto_551936 ?auto_551948 ) ) ( not ( = ?auto_551937 ?auto_551938 ) ) ( not ( = ?auto_551937 ?auto_551939 ) ) ( not ( = ?auto_551937 ?auto_551940 ) ) ( not ( = ?auto_551937 ?auto_551941 ) ) ( not ( = ?auto_551937 ?auto_551942 ) ) ( not ( = ?auto_551937 ?auto_551943 ) ) ( not ( = ?auto_551937 ?auto_551944 ) ) ( not ( = ?auto_551937 ?auto_551945 ) ) ( not ( = ?auto_551937 ?auto_551946 ) ) ( not ( = ?auto_551937 ?auto_551947 ) ) ( not ( = ?auto_551937 ?auto_551948 ) ) ( not ( = ?auto_551938 ?auto_551939 ) ) ( not ( = ?auto_551938 ?auto_551940 ) ) ( not ( = ?auto_551938 ?auto_551941 ) ) ( not ( = ?auto_551938 ?auto_551942 ) ) ( not ( = ?auto_551938 ?auto_551943 ) ) ( not ( = ?auto_551938 ?auto_551944 ) ) ( not ( = ?auto_551938 ?auto_551945 ) ) ( not ( = ?auto_551938 ?auto_551946 ) ) ( not ( = ?auto_551938 ?auto_551947 ) ) ( not ( = ?auto_551938 ?auto_551948 ) ) ( not ( = ?auto_551939 ?auto_551940 ) ) ( not ( = ?auto_551939 ?auto_551941 ) ) ( not ( = ?auto_551939 ?auto_551942 ) ) ( not ( = ?auto_551939 ?auto_551943 ) ) ( not ( = ?auto_551939 ?auto_551944 ) ) ( not ( = ?auto_551939 ?auto_551945 ) ) ( not ( = ?auto_551939 ?auto_551946 ) ) ( not ( = ?auto_551939 ?auto_551947 ) ) ( not ( = ?auto_551939 ?auto_551948 ) ) ( not ( = ?auto_551940 ?auto_551941 ) ) ( not ( = ?auto_551940 ?auto_551942 ) ) ( not ( = ?auto_551940 ?auto_551943 ) ) ( not ( = ?auto_551940 ?auto_551944 ) ) ( not ( = ?auto_551940 ?auto_551945 ) ) ( not ( = ?auto_551940 ?auto_551946 ) ) ( not ( = ?auto_551940 ?auto_551947 ) ) ( not ( = ?auto_551940 ?auto_551948 ) ) ( not ( = ?auto_551941 ?auto_551942 ) ) ( not ( = ?auto_551941 ?auto_551943 ) ) ( not ( = ?auto_551941 ?auto_551944 ) ) ( not ( = ?auto_551941 ?auto_551945 ) ) ( not ( = ?auto_551941 ?auto_551946 ) ) ( not ( = ?auto_551941 ?auto_551947 ) ) ( not ( = ?auto_551941 ?auto_551948 ) ) ( not ( = ?auto_551942 ?auto_551943 ) ) ( not ( = ?auto_551942 ?auto_551944 ) ) ( not ( = ?auto_551942 ?auto_551945 ) ) ( not ( = ?auto_551942 ?auto_551946 ) ) ( not ( = ?auto_551942 ?auto_551947 ) ) ( not ( = ?auto_551942 ?auto_551948 ) ) ( not ( = ?auto_551943 ?auto_551944 ) ) ( not ( = ?auto_551943 ?auto_551945 ) ) ( not ( = ?auto_551943 ?auto_551946 ) ) ( not ( = ?auto_551943 ?auto_551947 ) ) ( not ( = ?auto_551943 ?auto_551948 ) ) ( not ( = ?auto_551944 ?auto_551945 ) ) ( not ( = ?auto_551944 ?auto_551946 ) ) ( not ( = ?auto_551944 ?auto_551947 ) ) ( not ( = ?auto_551944 ?auto_551948 ) ) ( not ( = ?auto_551945 ?auto_551946 ) ) ( not ( = ?auto_551945 ?auto_551947 ) ) ( not ( = ?auto_551945 ?auto_551948 ) ) ( not ( = ?auto_551946 ?auto_551947 ) ) ( not ( = ?auto_551946 ?auto_551948 ) ) ( not ( = ?auto_551947 ?auto_551948 ) ) ( ON ?auto_551947 ?auto_551948 ) ( ON ?auto_551946 ?auto_551947 ) ( CLEAR ?auto_551944 ) ( ON ?auto_551945 ?auto_551946 ) ( CLEAR ?auto_551945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_551933 ?auto_551934 ?auto_551935 ?auto_551936 ?auto_551937 ?auto_551938 ?auto_551939 ?auto_551940 ?auto_551941 ?auto_551942 ?auto_551943 ?auto_551944 ?auto_551945 )
      ( MAKE-16PILE ?auto_551933 ?auto_551934 ?auto_551935 ?auto_551936 ?auto_551937 ?auto_551938 ?auto_551939 ?auto_551940 ?auto_551941 ?auto_551942 ?auto_551943 ?auto_551944 ?auto_551945 ?auto_551946 ?auto_551947 ?auto_551948 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_551965 - BLOCK
      ?auto_551966 - BLOCK
      ?auto_551967 - BLOCK
      ?auto_551968 - BLOCK
      ?auto_551969 - BLOCK
      ?auto_551970 - BLOCK
      ?auto_551971 - BLOCK
      ?auto_551972 - BLOCK
      ?auto_551973 - BLOCK
      ?auto_551974 - BLOCK
      ?auto_551975 - BLOCK
      ?auto_551976 - BLOCK
      ?auto_551977 - BLOCK
      ?auto_551978 - BLOCK
      ?auto_551979 - BLOCK
      ?auto_551980 - BLOCK
    )
    :vars
    (
      ?auto_551981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_551980 ?auto_551981 ) ( ON-TABLE ?auto_551965 ) ( ON ?auto_551966 ?auto_551965 ) ( ON ?auto_551967 ?auto_551966 ) ( ON ?auto_551968 ?auto_551967 ) ( ON ?auto_551969 ?auto_551968 ) ( ON ?auto_551970 ?auto_551969 ) ( ON ?auto_551971 ?auto_551970 ) ( ON ?auto_551972 ?auto_551971 ) ( ON ?auto_551973 ?auto_551972 ) ( ON ?auto_551974 ?auto_551973 ) ( ON ?auto_551975 ?auto_551974 ) ( not ( = ?auto_551965 ?auto_551966 ) ) ( not ( = ?auto_551965 ?auto_551967 ) ) ( not ( = ?auto_551965 ?auto_551968 ) ) ( not ( = ?auto_551965 ?auto_551969 ) ) ( not ( = ?auto_551965 ?auto_551970 ) ) ( not ( = ?auto_551965 ?auto_551971 ) ) ( not ( = ?auto_551965 ?auto_551972 ) ) ( not ( = ?auto_551965 ?auto_551973 ) ) ( not ( = ?auto_551965 ?auto_551974 ) ) ( not ( = ?auto_551965 ?auto_551975 ) ) ( not ( = ?auto_551965 ?auto_551976 ) ) ( not ( = ?auto_551965 ?auto_551977 ) ) ( not ( = ?auto_551965 ?auto_551978 ) ) ( not ( = ?auto_551965 ?auto_551979 ) ) ( not ( = ?auto_551965 ?auto_551980 ) ) ( not ( = ?auto_551965 ?auto_551981 ) ) ( not ( = ?auto_551966 ?auto_551967 ) ) ( not ( = ?auto_551966 ?auto_551968 ) ) ( not ( = ?auto_551966 ?auto_551969 ) ) ( not ( = ?auto_551966 ?auto_551970 ) ) ( not ( = ?auto_551966 ?auto_551971 ) ) ( not ( = ?auto_551966 ?auto_551972 ) ) ( not ( = ?auto_551966 ?auto_551973 ) ) ( not ( = ?auto_551966 ?auto_551974 ) ) ( not ( = ?auto_551966 ?auto_551975 ) ) ( not ( = ?auto_551966 ?auto_551976 ) ) ( not ( = ?auto_551966 ?auto_551977 ) ) ( not ( = ?auto_551966 ?auto_551978 ) ) ( not ( = ?auto_551966 ?auto_551979 ) ) ( not ( = ?auto_551966 ?auto_551980 ) ) ( not ( = ?auto_551966 ?auto_551981 ) ) ( not ( = ?auto_551967 ?auto_551968 ) ) ( not ( = ?auto_551967 ?auto_551969 ) ) ( not ( = ?auto_551967 ?auto_551970 ) ) ( not ( = ?auto_551967 ?auto_551971 ) ) ( not ( = ?auto_551967 ?auto_551972 ) ) ( not ( = ?auto_551967 ?auto_551973 ) ) ( not ( = ?auto_551967 ?auto_551974 ) ) ( not ( = ?auto_551967 ?auto_551975 ) ) ( not ( = ?auto_551967 ?auto_551976 ) ) ( not ( = ?auto_551967 ?auto_551977 ) ) ( not ( = ?auto_551967 ?auto_551978 ) ) ( not ( = ?auto_551967 ?auto_551979 ) ) ( not ( = ?auto_551967 ?auto_551980 ) ) ( not ( = ?auto_551967 ?auto_551981 ) ) ( not ( = ?auto_551968 ?auto_551969 ) ) ( not ( = ?auto_551968 ?auto_551970 ) ) ( not ( = ?auto_551968 ?auto_551971 ) ) ( not ( = ?auto_551968 ?auto_551972 ) ) ( not ( = ?auto_551968 ?auto_551973 ) ) ( not ( = ?auto_551968 ?auto_551974 ) ) ( not ( = ?auto_551968 ?auto_551975 ) ) ( not ( = ?auto_551968 ?auto_551976 ) ) ( not ( = ?auto_551968 ?auto_551977 ) ) ( not ( = ?auto_551968 ?auto_551978 ) ) ( not ( = ?auto_551968 ?auto_551979 ) ) ( not ( = ?auto_551968 ?auto_551980 ) ) ( not ( = ?auto_551968 ?auto_551981 ) ) ( not ( = ?auto_551969 ?auto_551970 ) ) ( not ( = ?auto_551969 ?auto_551971 ) ) ( not ( = ?auto_551969 ?auto_551972 ) ) ( not ( = ?auto_551969 ?auto_551973 ) ) ( not ( = ?auto_551969 ?auto_551974 ) ) ( not ( = ?auto_551969 ?auto_551975 ) ) ( not ( = ?auto_551969 ?auto_551976 ) ) ( not ( = ?auto_551969 ?auto_551977 ) ) ( not ( = ?auto_551969 ?auto_551978 ) ) ( not ( = ?auto_551969 ?auto_551979 ) ) ( not ( = ?auto_551969 ?auto_551980 ) ) ( not ( = ?auto_551969 ?auto_551981 ) ) ( not ( = ?auto_551970 ?auto_551971 ) ) ( not ( = ?auto_551970 ?auto_551972 ) ) ( not ( = ?auto_551970 ?auto_551973 ) ) ( not ( = ?auto_551970 ?auto_551974 ) ) ( not ( = ?auto_551970 ?auto_551975 ) ) ( not ( = ?auto_551970 ?auto_551976 ) ) ( not ( = ?auto_551970 ?auto_551977 ) ) ( not ( = ?auto_551970 ?auto_551978 ) ) ( not ( = ?auto_551970 ?auto_551979 ) ) ( not ( = ?auto_551970 ?auto_551980 ) ) ( not ( = ?auto_551970 ?auto_551981 ) ) ( not ( = ?auto_551971 ?auto_551972 ) ) ( not ( = ?auto_551971 ?auto_551973 ) ) ( not ( = ?auto_551971 ?auto_551974 ) ) ( not ( = ?auto_551971 ?auto_551975 ) ) ( not ( = ?auto_551971 ?auto_551976 ) ) ( not ( = ?auto_551971 ?auto_551977 ) ) ( not ( = ?auto_551971 ?auto_551978 ) ) ( not ( = ?auto_551971 ?auto_551979 ) ) ( not ( = ?auto_551971 ?auto_551980 ) ) ( not ( = ?auto_551971 ?auto_551981 ) ) ( not ( = ?auto_551972 ?auto_551973 ) ) ( not ( = ?auto_551972 ?auto_551974 ) ) ( not ( = ?auto_551972 ?auto_551975 ) ) ( not ( = ?auto_551972 ?auto_551976 ) ) ( not ( = ?auto_551972 ?auto_551977 ) ) ( not ( = ?auto_551972 ?auto_551978 ) ) ( not ( = ?auto_551972 ?auto_551979 ) ) ( not ( = ?auto_551972 ?auto_551980 ) ) ( not ( = ?auto_551972 ?auto_551981 ) ) ( not ( = ?auto_551973 ?auto_551974 ) ) ( not ( = ?auto_551973 ?auto_551975 ) ) ( not ( = ?auto_551973 ?auto_551976 ) ) ( not ( = ?auto_551973 ?auto_551977 ) ) ( not ( = ?auto_551973 ?auto_551978 ) ) ( not ( = ?auto_551973 ?auto_551979 ) ) ( not ( = ?auto_551973 ?auto_551980 ) ) ( not ( = ?auto_551973 ?auto_551981 ) ) ( not ( = ?auto_551974 ?auto_551975 ) ) ( not ( = ?auto_551974 ?auto_551976 ) ) ( not ( = ?auto_551974 ?auto_551977 ) ) ( not ( = ?auto_551974 ?auto_551978 ) ) ( not ( = ?auto_551974 ?auto_551979 ) ) ( not ( = ?auto_551974 ?auto_551980 ) ) ( not ( = ?auto_551974 ?auto_551981 ) ) ( not ( = ?auto_551975 ?auto_551976 ) ) ( not ( = ?auto_551975 ?auto_551977 ) ) ( not ( = ?auto_551975 ?auto_551978 ) ) ( not ( = ?auto_551975 ?auto_551979 ) ) ( not ( = ?auto_551975 ?auto_551980 ) ) ( not ( = ?auto_551975 ?auto_551981 ) ) ( not ( = ?auto_551976 ?auto_551977 ) ) ( not ( = ?auto_551976 ?auto_551978 ) ) ( not ( = ?auto_551976 ?auto_551979 ) ) ( not ( = ?auto_551976 ?auto_551980 ) ) ( not ( = ?auto_551976 ?auto_551981 ) ) ( not ( = ?auto_551977 ?auto_551978 ) ) ( not ( = ?auto_551977 ?auto_551979 ) ) ( not ( = ?auto_551977 ?auto_551980 ) ) ( not ( = ?auto_551977 ?auto_551981 ) ) ( not ( = ?auto_551978 ?auto_551979 ) ) ( not ( = ?auto_551978 ?auto_551980 ) ) ( not ( = ?auto_551978 ?auto_551981 ) ) ( not ( = ?auto_551979 ?auto_551980 ) ) ( not ( = ?auto_551979 ?auto_551981 ) ) ( not ( = ?auto_551980 ?auto_551981 ) ) ( ON ?auto_551979 ?auto_551980 ) ( ON ?auto_551978 ?auto_551979 ) ( ON ?auto_551977 ?auto_551978 ) ( CLEAR ?auto_551975 ) ( ON ?auto_551976 ?auto_551977 ) ( CLEAR ?auto_551976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_551965 ?auto_551966 ?auto_551967 ?auto_551968 ?auto_551969 ?auto_551970 ?auto_551971 ?auto_551972 ?auto_551973 ?auto_551974 ?auto_551975 ?auto_551976 )
      ( MAKE-16PILE ?auto_551965 ?auto_551966 ?auto_551967 ?auto_551968 ?auto_551969 ?auto_551970 ?auto_551971 ?auto_551972 ?auto_551973 ?auto_551974 ?auto_551975 ?auto_551976 ?auto_551977 ?auto_551978 ?auto_551979 ?auto_551980 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_551998 - BLOCK
      ?auto_551999 - BLOCK
      ?auto_552000 - BLOCK
      ?auto_552001 - BLOCK
      ?auto_552002 - BLOCK
      ?auto_552003 - BLOCK
      ?auto_552004 - BLOCK
      ?auto_552005 - BLOCK
      ?auto_552006 - BLOCK
      ?auto_552007 - BLOCK
      ?auto_552008 - BLOCK
      ?auto_552009 - BLOCK
      ?auto_552010 - BLOCK
      ?auto_552011 - BLOCK
      ?auto_552012 - BLOCK
      ?auto_552013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_552013 ) ( ON-TABLE ?auto_551998 ) ( ON ?auto_551999 ?auto_551998 ) ( ON ?auto_552000 ?auto_551999 ) ( ON ?auto_552001 ?auto_552000 ) ( ON ?auto_552002 ?auto_552001 ) ( ON ?auto_552003 ?auto_552002 ) ( ON ?auto_552004 ?auto_552003 ) ( ON ?auto_552005 ?auto_552004 ) ( ON ?auto_552006 ?auto_552005 ) ( ON ?auto_552007 ?auto_552006 ) ( ON ?auto_552008 ?auto_552007 ) ( not ( = ?auto_551998 ?auto_551999 ) ) ( not ( = ?auto_551998 ?auto_552000 ) ) ( not ( = ?auto_551998 ?auto_552001 ) ) ( not ( = ?auto_551998 ?auto_552002 ) ) ( not ( = ?auto_551998 ?auto_552003 ) ) ( not ( = ?auto_551998 ?auto_552004 ) ) ( not ( = ?auto_551998 ?auto_552005 ) ) ( not ( = ?auto_551998 ?auto_552006 ) ) ( not ( = ?auto_551998 ?auto_552007 ) ) ( not ( = ?auto_551998 ?auto_552008 ) ) ( not ( = ?auto_551998 ?auto_552009 ) ) ( not ( = ?auto_551998 ?auto_552010 ) ) ( not ( = ?auto_551998 ?auto_552011 ) ) ( not ( = ?auto_551998 ?auto_552012 ) ) ( not ( = ?auto_551998 ?auto_552013 ) ) ( not ( = ?auto_551999 ?auto_552000 ) ) ( not ( = ?auto_551999 ?auto_552001 ) ) ( not ( = ?auto_551999 ?auto_552002 ) ) ( not ( = ?auto_551999 ?auto_552003 ) ) ( not ( = ?auto_551999 ?auto_552004 ) ) ( not ( = ?auto_551999 ?auto_552005 ) ) ( not ( = ?auto_551999 ?auto_552006 ) ) ( not ( = ?auto_551999 ?auto_552007 ) ) ( not ( = ?auto_551999 ?auto_552008 ) ) ( not ( = ?auto_551999 ?auto_552009 ) ) ( not ( = ?auto_551999 ?auto_552010 ) ) ( not ( = ?auto_551999 ?auto_552011 ) ) ( not ( = ?auto_551999 ?auto_552012 ) ) ( not ( = ?auto_551999 ?auto_552013 ) ) ( not ( = ?auto_552000 ?auto_552001 ) ) ( not ( = ?auto_552000 ?auto_552002 ) ) ( not ( = ?auto_552000 ?auto_552003 ) ) ( not ( = ?auto_552000 ?auto_552004 ) ) ( not ( = ?auto_552000 ?auto_552005 ) ) ( not ( = ?auto_552000 ?auto_552006 ) ) ( not ( = ?auto_552000 ?auto_552007 ) ) ( not ( = ?auto_552000 ?auto_552008 ) ) ( not ( = ?auto_552000 ?auto_552009 ) ) ( not ( = ?auto_552000 ?auto_552010 ) ) ( not ( = ?auto_552000 ?auto_552011 ) ) ( not ( = ?auto_552000 ?auto_552012 ) ) ( not ( = ?auto_552000 ?auto_552013 ) ) ( not ( = ?auto_552001 ?auto_552002 ) ) ( not ( = ?auto_552001 ?auto_552003 ) ) ( not ( = ?auto_552001 ?auto_552004 ) ) ( not ( = ?auto_552001 ?auto_552005 ) ) ( not ( = ?auto_552001 ?auto_552006 ) ) ( not ( = ?auto_552001 ?auto_552007 ) ) ( not ( = ?auto_552001 ?auto_552008 ) ) ( not ( = ?auto_552001 ?auto_552009 ) ) ( not ( = ?auto_552001 ?auto_552010 ) ) ( not ( = ?auto_552001 ?auto_552011 ) ) ( not ( = ?auto_552001 ?auto_552012 ) ) ( not ( = ?auto_552001 ?auto_552013 ) ) ( not ( = ?auto_552002 ?auto_552003 ) ) ( not ( = ?auto_552002 ?auto_552004 ) ) ( not ( = ?auto_552002 ?auto_552005 ) ) ( not ( = ?auto_552002 ?auto_552006 ) ) ( not ( = ?auto_552002 ?auto_552007 ) ) ( not ( = ?auto_552002 ?auto_552008 ) ) ( not ( = ?auto_552002 ?auto_552009 ) ) ( not ( = ?auto_552002 ?auto_552010 ) ) ( not ( = ?auto_552002 ?auto_552011 ) ) ( not ( = ?auto_552002 ?auto_552012 ) ) ( not ( = ?auto_552002 ?auto_552013 ) ) ( not ( = ?auto_552003 ?auto_552004 ) ) ( not ( = ?auto_552003 ?auto_552005 ) ) ( not ( = ?auto_552003 ?auto_552006 ) ) ( not ( = ?auto_552003 ?auto_552007 ) ) ( not ( = ?auto_552003 ?auto_552008 ) ) ( not ( = ?auto_552003 ?auto_552009 ) ) ( not ( = ?auto_552003 ?auto_552010 ) ) ( not ( = ?auto_552003 ?auto_552011 ) ) ( not ( = ?auto_552003 ?auto_552012 ) ) ( not ( = ?auto_552003 ?auto_552013 ) ) ( not ( = ?auto_552004 ?auto_552005 ) ) ( not ( = ?auto_552004 ?auto_552006 ) ) ( not ( = ?auto_552004 ?auto_552007 ) ) ( not ( = ?auto_552004 ?auto_552008 ) ) ( not ( = ?auto_552004 ?auto_552009 ) ) ( not ( = ?auto_552004 ?auto_552010 ) ) ( not ( = ?auto_552004 ?auto_552011 ) ) ( not ( = ?auto_552004 ?auto_552012 ) ) ( not ( = ?auto_552004 ?auto_552013 ) ) ( not ( = ?auto_552005 ?auto_552006 ) ) ( not ( = ?auto_552005 ?auto_552007 ) ) ( not ( = ?auto_552005 ?auto_552008 ) ) ( not ( = ?auto_552005 ?auto_552009 ) ) ( not ( = ?auto_552005 ?auto_552010 ) ) ( not ( = ?auto_552005 ?auto_552011 ) ) ( not ( = ?auto_552005 ?auto_552012 ) ) ( not ( = ?auto_552005 ?auto_552013 ) ) ( not ( = ?auto_552006 ?auto_552007 ) ) ( not ( = ?auto_552006 ?auto_552008 ) ) ( not ( = ?auto_552006 ?auto_552009 ) ) ( not ( = ?auto_552006 ?auto_552010 ) ) ( not ( = ?auto_552006 ?auto_552011 ) ) ( not ( = ?auto_552006 ?auto_552012 ) ) ( not ( = ?auto_552006 ?auto_552013 ) ) ( not ( = ?auto_552007 ?auto_552008 ) ) ( not ( = ?auto_552007 ?auto_552009 ) ) ( not ( = ?auto_552007 ?auto_552010 ) ) ( not ( = ?auto_552007 ?auto_552011 ) ) ( not ( = ?auto_552007 ?auto_552012 ) ) ( not ( = ?auto_552007 ?auto_552013 ) ) ( not ( = ?auto_552008 ?auto_552009 ) ) ( not ( = ?auto_552008 ?auto_552010 ) ) ( not ( = ?auto_552008 ?auto_552011 ) ) ( not ( = ?auto_552008 ?auto_552012 ) ) ( not ( = ?auto_552008 ?auto_552013 ) ) ( not ( = ?auto_552009 ?auto_552010 ) ) ( not ( = ?auto_552009 ?auto_552011 ) ) ( not ( = ?auto_552009 ?auto_552012 ) ) ( not ( = ?auto_552009 ?auto_552013 ) ) ( not ( = ?auto_552010 ?auto_552011 ) ) ( not ( = ?auto_552010 ?auto_552012 ) ) ( not ( = ?auto_552010 ?auto_552013 ) ) ( not ( = ?auto_552011 ?auto_552012 ) ) ( not ( = ?auto_552011 ?auto_552013 ) ) ( not ( = ?auto_552012 ?auto_552013 ) ) ( ON ?auto_552012 ?auto_552013 ) ( ON ?auto_552011 ?auto_552012 ) ( ON ?auto_552010 ?auto_552011 ) ( CLEAR ?auto_552008 ) ( ON ?auto_552009 ?auto_552010 ) ( CLEAR ?auto_552009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_551998 ?auto_551999 ?auto_552000 ?auto_552001 ?auto_552002 ?auto_552003 ?auto_552004 ?auto_552005 ?auto_552006 ?auto_552007 ?auto_552008 ?auto_552009 )
      ( MAKE-16PILE ?auto_551998 ?auto_551999 ?auto_552000 ?auto_552001 ?auto_552002 ?auto_552003 ?auto_552004 ?auto_552005 ?auto_552006 ?auto_552007 ?auto_552008 ?auto_552009 ?auto_552010 ?auto_552011 ?auto_552012 ?auto_552013 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552030 - BLOCK
      ?auto_552031 - BLOCK
      ?auto_552032 - BLOCK
      ?auto_552033 - BLOCK
      ?auto_552034 - BLOCK
      ?auto_552035 - BLOCK
      ?auto_552036 - BLOCK
      ?auto_552037 - BLOCK
      ?auto_552038 - BLOCK
      ?auto_552039 - BLOCK
      ?auto_552040 - BLOCK
      ?auto_552041 - BLOCK
      ?auto_552042 - BLOCK
      ?auto_552043 - BLOCK
      ?auto_552044 - BLOCK
      ?auto_552045 - BLOCK
    )
    :vars
    (
      ?auto_552046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552045 ?auto_552046 ) ( ON-TABLE ?auto_552030 ) ( ON ?auto_552031 ?auto_552030 ) ( ON ?auto_552032 ?auto_552031 ) ( ON ?auto_552033 ?auto_552032 ) ( ON ?auto_552034 ?auto_552033 ) ( ON ?auto_552035 ?auto_552034 ) ( ON ?auto_552036 ?auto_552035 ) ( ON ?auto_552037 ?auto_552036 ) ( ON ?auto_552038 ?auto_552037 ) ( ON ?auto_552039 ?auto_552038 ) ( not ( = ?auto_552030 ?auto_552031 ) ) ( not ( = ?auto_552030 ?auto_552032 ) ) ( not ( = ?auto_552030 ?auto_552033 ) ) ( not ( = ?auto_552030 ?auto_552034 ) ) ( not ( = ?auto_552030 ?auto_552035 ) ) ( not ( = ?auto_552030 ?auto_552036 ) ) ( not ( = ?auto_552030 ?auto_552037 ) ) ( not ( = ?auto_552030 ?auto_552038 ) ) ( not ( = ?auto_552030 ?auto_552039 ) ) ( not ( = ?auto_552030 ?auto_552040 ) ) ( not ( = ?auto_552030 ?auto_552041 ) ) ( not ( = ?auto_552030 ?auto_552042 ) ) ( not ( = ?auto_552030 ?auto_552043 ) ) ( not ( = ?auto_552030 ?auto_552044 ) ) ( not ( = ?auto_552030 ?auto_552045 ) ) ( not ( = ?auto_552030 ?auto_552046 ) ) ( not ( = ?auto_552031 ?auto_552032 ) ) ( not ( = ?auto_552031 ?auto_552033 ) ) ( not ( = ?auto_552031 ?auto_552034 ) ) ( not ( = ?auto_552031 ?auto_552035 ) ) ( not ( = ?auto_552031 ?auto_552036 ) ) ( not ( = ?auto_552031 ?auto_552037 ) ) ( not ( = ?auto_552031 ?auto_552038 ) ) ( not ( = ?auto_552031 ?auto_552039 ) ) ( not ( = ?auto_552031 ?auto_552040 ) ) ( not ( = ?auto_552031 ?auto_552041 ) ) ( not ( = ?auto_552031 ?auto_552042 ) ) ( not ( = ?auto_552031 ?auto_552043 ) ) ( not ( = ?auto_552031 ?auto_552044 ) ) ( not ( = ?auto_552031 ?auto_552045 ) ) ( not ( = ?auto_552031 ?auto_552046 ) ) ( not ( = ?auto_552032 ?auto_552033 ) ) ( not ( = ?auto_552032 ?auto_552034 ) ) ( not ( = ?auto_552032 ?auto_552035 ) ) ( not ( = ?auto_552032 ?auto_552036 ) ) ( not ( = ?auto_552032 ?auto_552037 ) ) ( not ( = ?auto_552032 ?auto_552038 ) ) ( not ( = ?auto_552032 ?auto_552039 ) ) ( not ( = ?auto_552032 ?auto_552040 ) ) ( not ( = ?auto_552032 ?auto_552041 ) ) ( not ( = ?auto_552032 ?auto_552042 ) ) ( not ( = ?auto_552032 ?auto_552043 ) ) ( not ( = ?auto_552032 ?auto_552044 ) ) ( not ( = ?auto_552032 ?auto_552045 ) ) ( not ( = ?auto_552032 ?auto_552046 ) ) ( not ( = ?auto_552033 ?auto_552034 ) ) ( not ( = ?auto_552033 ?auto_552035 ) ) ( not ( = ?auto_552033 ?auto_552036 ) ) ( not ( = ?auto_552033 ?auto_552037 ) ) ( not ( = ?auto_552033 ?auto_552038 ) ) ( not ( = ?auto_552033 ?auto_552039 ) ) ( not ( = ?auto_552033 ?auto_552040 ) ) ( not ( = ?auto_552033 ?auto_552041 ) ) ( not ( = ?auto_552033 ?auto_552042 ) ) ( not ( = ?auto_552033 ?auto_552043 ) ) ( not ( = ?auto_552033 ?auto_552044 ) ) ( not ( = ?auto_552033 ?auto_552045 ) ) ( not ( = ?auto_552033 ?auto_552046 ) ) ( not ( = ?auto_552034 ?auto_552035 ) ) ( not ( = ?auto_552034 ?auto_552036 ) ) ( not ( = ?auto_552034 ?auto_552037 ) ) ( not ( = ?auto_552034 ?auto_552038 ) ) ( not ( = ?auto_552034 ?auto_552039 ) ) ( not ( = ?auto_552034 ?auto_552040 ) ) ( not ( = ?auto_552034 ?auto_552041 ) ) ( not ( = ?auto_552034 ?auto_552042 ) ) ( not ( = ?auto_552034 ?auto_552043 ) ) ( not ( = ?auto_552034 ?auto_552044 ) ) ( not ( = ?auto_552034 ?auto_552045 ) ) ( not ( = ?auto_552034 ?auto_552046 ) ) ( not ( = ?auto_552035 ?auto_552036 ) ) ( not ( = ?auto_552035 ?auto_552037 ) ) ( not ( = ?auto_552035 ?auto_552038 ) ) ( not ( = ?auto_552035 ?auto_552039 ) ) ( not ( = ?auto_552035 ?auto_552040 ) ) ( not ( = ?auto_552035 ?auto_552041 ) ) ( not ( = ?auto_552035 ?auto_552042 ) ) ( not ( = ?auto_552035 ?auto_552043 ) ) ( not ( = ?auto_552035 ?auto_552044 ) ) ( not ( = ?auto_552035 ?auto_552045 ) ) ( not ( = ?auto_552035 ?auto_552046 ) ) ( not ( = ?auto_552036 ?auto_552037 ) ) ( not ( = ?auto_552036 ?auto_552038 ) ) ( not ( = ?auto_552036 ?auto_552039 ) ) ( not ( = ?auto_552036 ?auto_552040 ) ) ( not ( = ?auto_552036 ?auto_552041 ) ) ( not ( = ?auto_552036 ?auto_552042 ) ) ( not ( = ?auto_552036 ?auto_552043 ) ) ( not ( = ?auto_552036 ?auto_552044 ) ) ( not ( = ?auto_552036 ?auto_552045 ) ) ( not ( = ?auto_552036 ?auto_552046 ) ) ( not ( = ?auto_552037 ?auto_552038 ) ) ( not ( = ?auto_552037 ?auto_552039 ) ) ( not ( = ?auto_552037 ?auto_552040 ) ) ( not ( = ?auto_552037 ?auto_552041 ) ) ( not ( = ?auto_552037 ?auto_552042 ) ) ( not ( = ?auto_552037 ?auto_552043 ) ) ( not ( = ?auto_552037 ?auto_552044 ) ) ( not ( = ?auto_552037 ?auto_552045 ) ) ( not ( = ?auto_552037 ?auto_552046 ) ) ( not ( = ?auto_552038 ?auto_552039 ) ) ( not ( = ?auto_552038 ?auto_552040 ) ) ( not ( = ?auto_552038 ?auto_552041 ) ) ( not ( = ?auto_552038 ?auto_552042 ) ) ( not ( = ?auto_552038 ?auto_552043 ) ) ( not ( = ?auto_552038 ?auto_552044 ) ) ( not ( = ?auto_552038 ?auto_552045 ) ) ( not ( = ?auto_552038 ?auto_552046 ) ) ( not ( = ?auto_552039 ?auto_552040 ) ) ( not ( = ?auto_552039 ?auto_552041 ) ) ( not ( = ?auto_552039 ?auto_552042 ) ) ( not ( = ?auto_552039 ?auto_552043 ) ) ( not ( = ?auto_552039 ?auto_552044 ) ) ( not ( = ?auto_552039 ?auto_552045 ) ) ( not ( = ?auto_552039 ?auto_552046 ) ) ( not ( = ?auto_552040 ?auto_552041 ) ) ( not ( = ?auto_552040 ?auto_552042 ) ) ( not ( = ?auto_552040 ?auto_552043 ) ) ( not ( = ?auto_552040 ?auto_552044 ) ) ( not ( = ?auto_552040 ?auto_552045 ) ) ( not ( = ?auto_552040 ?auto_552046 ) ) ( not ( = ?auto_552041 ?auto_552042 ) ) ( not ( = ?auto_552041 ?auto_552043 ) ) ( not ( = ?auto_552041 ?auto_552044 ) ) ( not ( = ?auto_552041 ?auto_552045 ) ) ( not ( = ?auto_552041 ?auto_552046 ) ) ( not ( = ?auto_552042 ?auto_552043 ) ) ( not ( = ?auto_552042 ?auto_552044 ) ) ( not ( = ?auto_552042 ?auto_552045 ) ) ( not ( = ?auto_552042 ?auto_552046 ) ) ( not ( = ?auto_552043 ?auto_552044 ) ) ( not ( = ?auto_552043 ?auto_552045 ) ) ( not ( = ?auto_552043 ?auto_552046 ) ) ( not ( = ?auto_552044 ?auto_552045 ) ) ( not ( = ?auto_552044 ?auto_552046 ) ) ( not ( = ?auto_552045 ?auto_552046 ) ) ( ON ?auto_552044 ?auto_552045 ) ( ON ?auto_552043 ?auto_552044 ) ( ON ?auto_552042 ?auto_552043 ) ( ON ?auto_552041 ?auto_552042 ) ( CLEAR ?auto_552039 ) ( ON ?auto_552040 ?auto_552041 ) ( CLEAR ?auto_552040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_552030 ?auto_552031 ?auto_552032 ?auto_552033 ?auto_552034 ?auto_552035 ?auto_552036 ?auto_552037 ?auto_552038 ?auto_552039 ?auto_552040 )
      ( MAKE-16PILE ?auto_552030 ?auto_552031 ?auto_552032 ?auto_552033 ?auto_552034 ?auto_552035 ?auto_552036 ?auto_552037 ?auto_552038 ?auto_552039 ?auto_552040 ?auto_552041 ?auto_552042 ?auto_552043 ?auto_552044 ?auto_552045 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552063 - BLOCK
      ?auto_552064 - BLOCK
      ?auto_552065 - BLOCK
      ?auto_552066 - BLOCK
      ?auto_552067 - BLOCK
      ?auto_552068 - BLOCK
      ?auto_552069 - BLOCK
      ?auto_552070 - BLOCK
      ?auto_552071 - BLOCK
      ?auto_552072 - BLOCK
      ?auto_552073 - BLOCK
      ?auto_552074 - BLOCK
      ?auto_552075 - BLOCK
      ?auto_552076 - BLOCK
      ?auto_552077 - BLOCK
      ?auto_552078 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_552078 ) ( ON-TABLE ?auto_552063 ) ( ON ?auto_552064 ?auto_552063 ) ( ON ?auto_552065 ?auto_552064 ) ( ON ?auto_552066 ?auto_552065 ) ( ON ?auto_552067 ?auto_552066 ) ( ON ?auto_552068 ?auto_552067 ) ( ON ?auto_552069 ?auto_552068 ) ( ON ?auto_552070 ?auto_552069 ) ( ON ?auto_552071 ?auto_552070 ) ( ON ?auto_552072 ?auto_552071 ) ( not ( = ?auto_552063 ?auto_552064 ) ) ( not ( = ?auto_552063 ?auto_552065 ) ) ( not ( = ?auto_552063 ?auto_552066 ) ) ( not ( = ?auto_552063 ?auto_552067 ) ) ( not ( = ?auto_552063 ?auto_552068 ) ) ( not ( = ?auto_552063 ?auto_552069 ) ) ( not ( = ?auto_552063 ?auto_552070 ) ) ( not ( = ?auto_552063 ?auto_552071 ) ) ( not ( = ?auto_552063 ?auto_552072 ) ) ( not ( = ?auto_552063 ?auto_552073 ) ) ( not ( = ?auto_552063 ?auto_552074 ) ) ( not ( = ?auto_552063 ?auto_552075 ) ) ( not ( = ?auto_552063 ?auto_552076 ) ) ( not ( = ?auto_552063 ?auto_552077 ) ) ( not ( = ?auto_552063 ?auto_552078 ) ) ( not ( = ?auto_552064 ?auto_552065 ) ) ( not ( = ?auto_552064 ?auto_552066 ) ) ( not ( = ?auto_552064 ?auto_552067 ) ) ( not ( = ?auto_552064 ?auto_552068 ) ) ( not ( = ?auto_552064 ?auto_552069 ) ) ( not ( = ?auto_552064 ?auto_552070 ) ) ( not ( = ?auto_552064 ?auto_552071 ) ) ( not ( = ?auto_552064 ?auto_552072 ) ) ( not ( = ?auto_552064 ?auto_552073 ) ) ( not ( = ?auto_552064 ?auto_552074 ) ) ( not ( = ?auto_552064 ?auto_552075 ) ) ( not ( = ?auto_552064 ?auto_552076 ) ) ( not ( = ?auto_552064 ?auto_552077 ) ) ( not ( = ?auto_552064 ?auto_552078 ) ) ( not ( = ?auto_552065 ?auto_552066 ) ) ( not ( = ?auto_552065 ?auto_552067 ) ) ( not ( = ?auto_552065 ?auto_552068 ) ) ( not ( = ?auto_552065 ?auto_552069 ) ) ( not ( = ?auto_552065 ?auto_552070 ) ) ( not ( = ?auto_552065 ?auto_552071 ) ) ( not ( = ?auto_552065 ?auto_552072 ) ) ( not ( = ?auto_552065 ?auto_552073 ) ) ( not ( = ?auto_552065 ?auto_552074 ) ) ( not ( = ?auto_552065 ?auto_552075 ) ) ( not ( = ?auto_552065 ?auto_552076 ) ) ( not ( = ?auto_552065 ?auto_552077 ) ) ( not ( = ?auto_552065 ?auto_552078 ) ) ( not ( = ?auto_552066 ?auto_552067 ) ) ( not ( = ?auto_552066 ?auto_552068 ) ) ( not ( = ?auto_552066 ?auto_552069 ) ) ( not ( = ?auto_552066 ?auto_552070 ) ) ( not ( = ?auto_552066 ?auto_552071 ) ) ( not ( = ?auto_552066 ?auto_552072 ) ) ( not ( = ?auto_552066 ?auto_552073 ) ) ( not ( = ?auto_552066 ?auto_552074 ) ) ( not ( = ?auto_552066 ?auto_552075 ) ) ( not ( = ?auto_552066 ?auto_552076 ) ) ( not ( = ?auto_552066 ?auto_552077 ) ) ( not ( = ?auto_552066 ?auto_552078 ) ) ( not ( = ?auto_552067 ?auto_552068 ) ) ( not ( = ?auto_552067 ?auto_552069 ) ) ( not ( = ?auto_552067 ?auto_552070 ) ) ( not ( = ?auto_552067 ?auto_552071 ) ) ( not ( = ?auto_552067 ?auto_552072 ) ) ( not ( = ?auto_552067 ?auto_552073 ) ) ( not ( = ?auto_552067 ?auto_552074 ) ) ( not ( = ?auto_552067 ?auto_552075 ) ) ( not ( = ?auto_552067 ?auto_552076 ) ) ( not ( = ?auto_552067 ?auto_552077 ) ) ( not ( = ?auto_552067 ?auto_552078 ) ) ( not ( = ?auto_552068 ?auto_552069 ) ) ( not ( = ?auto_552068 ?auto_552070 ) ) ( not ( = ?auto_552068 ?auto_552071 ) ) ( not ( = ?auto_552068 ?auto_552072 ) ) ( not ( = ?auto_552068 ?auto_552073 ) ) ( not ( = ?auto_552068 ?auto_552074 ) ) ( not ( = ?auto_552068 ?auto_552075 ) ) ( not ( = ?auto_552068 ?auto_552076 ) ) ( not ( = ?auto_552068 ?auto_552077 ) ) ( not ( = ?auto_552068 ?auto_552078 ) ) ( not ( = ?auto_552069 ?auto_552070 ) ) ( not ( = ?auto_552069 ?auto_552071 ) ) ( not ( = ?auto_552069 ?auto_552072 ) ) ( not ( = ?auto_552069 ?auto_552073 ) ) ( not ( = ?auto_552069 ?auto_552074 ) ) ( not ( = ?auto_552069 ?auto_552075 ) ) ( not ( = ?auto_552069 ?auto_552076 ) ) ( not ( = ?auto_552069 ?auto_552077 ) ) ( not ( = ?auto_552069 ?auto_552078 ) ) ( not ( = ?auto_552070 ?auto_552071 ) ) ( not ( = ?auto_552070 ?auto_552072 ) ) ( not ( = ?auto_552070 ?auto_552073 ) ) ( not ( = ?auto_552070 ?auto_552074 ) ) ( not ( = ?auto_552070 ?auto_552075 ) ) ( not ( = ?auto_552070 ?auto_552076 ) ) ( not ( = ?auto_552070 ?auto_552077 ) ) ( not ( = ?auto_552070 ?auto_552078 ) ) ( not ( = ?auto_552071 ?auto_552072 ) ) ( not ( = ?auto_552071 ?auto_552073 ) ) ( not ( = ?auto_552071 ?auto_552074 ) ) ( not ( = ?auto_552071 ?auto_552075 ) ) ( not ( = ?auto_552071 ?auto_552076 ) ) ( not ( = ?auto_552071 ?auto_552077 ) ) ( not ( = ?auto_552071 ?auto_552078 ) ) ( not ( = ?auto_552072 ?auto_552073 ) ) ( not ( = ?auto_552072 ?auto_552074 ) ) ( not ( = ?auto_552072 ?auto_552075 ) ) ( not ( = ?auto_552072 ?auto_552076 ) ) ( not ( = ?auto_552072 ?auto_552077 ) ) ( not ( = ?auto_552072 ?auto_552078 ) ) ( not ( = ?auto_552073 ?auto_552074 ) ) ( not ( = ?auto_552073 ?auto_552075 ) ) ( not ( = ?auto_552073 ?auto_552076 ) ) ( not ( = ?auto_552073 ?auto_552077 ) ) ( not ( = ?auto_552073 ?auto_552078 ) ) ( not ( = ?auto_552074 ?auto_552075 ) ) ( not ( = ?auto_552074 ?auto_552076 ) ) ( not ( = ?auto_552074 ?auto_552077 ) ) ( not ( = ?auto_552074 ?auto_552078 ) ) ( not ( = ?auto_552075 ?auto_552076 ) ) ( not ( = ?auto_552075 ?auto_552077 ) ) ( not ( = ?auto_552075 ?auto_552078 ) ) ( not ( = ?auto_552076 ?auto_552077 ) ) ( not ( = ?auto_552076 ?auto_552078 ) ) ( not ( = ?auto_552077 ?auto_552078 ) ) ( ON ?auto_552077 ?auto_552078 ) ( ON ?auto_552076 ?auto_552077 ) ( ON ?auto_552075 ?auto_552076 ) ( ON ?auto_552074 ?auto_552075 ) ( CLEAR ?auto_552072 ) ( ON ?auto_552073 ?auto_552074 ) ( CLEAR ?auto_552073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_552063 ?auto_552064 ?auto_552065 ?auto_552066 ?auto_552067 ?auto_552068 ?auto_552069 ?auto_552070 ?auto_552071 ?auto_552072 ?auto_552073 )
      ( MAKE-16PILE ?auto_552063 ?auto_552064 ?auto_552065 ?auto_552066 ?auto_552067 ?auto_552068 ?auto_552069 ?auto_552070 ?auto_552071 ?auto_552072 ?auto_552073 ?auto_552074 ?auto_552075 ?auto_552076 ?auto_552077 ?auto_552078 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552095 - BLOCK
      ?auto_552096 - BLOCK
      ?auto_552097 - BLOCK
      ?auto_552098 - BLOCK
      ?auto_552099 - BLOCK
      ?auto_552100 - BLOCK
      ?auto_552101 - BLOCK
      ?auto_552102 - BLOCK
      ?auto_552103 - BLOCK
      ?auto_552104 - BLOCK
      ?auto_552105 - BLOCK
      ?auto_552106 - BLOCK
      ?auto_552107 - BLOCK
      ?auto_552108 - BLOCK
      ?auto_552109 - BLOCK
      ?auto_552110 - BLOCK
    )
    :vars
    (
      ?auto_552111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552110 ?auto_552111 ) ( ON-TABLE ?auto_552095 ) ( ON ?auto_552096 ?auto_552095 ) ( ON ?auto_552097 ?auto_552096 ) ( ON ?auto_552098 ?auto_552097 ) ( ON ?auto_552099 ?auto_552098 ) ( ON ?auto_552100 ?auto_552099 ) ( ON ?auto_552101 ?auto_552100 ) ( ON ?auto_552102 ?auto_552101 ) ( ON ?auto_552103 ?auto_552102 ) ( not ( = ?auto_552095 ?auto_552096 ) ) ( not ( = ?auto_552095 ?auto_552097 ) ) ( not ( = ?auto_552095 ?auto_552098 ) ) ( not ( = ?auto_552095 ?auto_552099 ) ) ( not ( = ?auto_552095 ?auto_552100 ) ) ( not ( = ?auto_552095 ?auto_552101 ) ) ( not ( = ?auto_552095 ?auto_552102 ) ) ( not ( = ?auto_552095 ?auto_552103 ) ) ( not ( = ?auto_552095 ?auto_552104 ) ) ( not ( = ?auto_552095 ?auto_552105 ) ) ( not ( = ?auto_552095 ?auto_552106 ) ) ( not ( = ?auto_552095 ?auto_552107 ) ) ( not ( = ?auto_552095 ?auto_552108 ) ) ( not ( = ?auto_552095 ?auto_552109 ) ) ( not ( = ?auto_552095 ?auto_552110 ) ) ( not ( = ?auto_552095 ?auto_552111 ) ) ( not ( = ?auto_552096 ?auto_552097 ) ) ( not ( = ?auto_552096 ?auto_552098 ) ) ( not ( = ?auto_552096 ?auto_552099 ) ) ( not ( = ?auto_552096 ?auto_552100 ) ) ( not ( = ?auto_552096 ?auto_552101 ) ) ( not ( = ?auto_552096 ?auto_552102 ) ) ( not ( = ?auto_552096 ?auto_552103 ) ) ( not ( = ?auto_552096 ?auto_552104 ) ) ( not ( = ?auto_552096 ?auto_552105 ) ) ( not ( = ?auto_552096 ?auto_552106 ) ) ( not ( = ?auto_552096 ?auto_552107 ) ) ( not ( = ?auto_552096 ?auto_552108 ) ) ( not ( = ?auto_552096 ?auto_552109 ) ) ( not ( = ?auto_552096 ?auto_552110 ) ) ( not ( = ?auto_552096 ?auto_552111 ) ) ( not ( = ?auto_552097 ?auto_552098 ) ) ( not ( = ?auto_552097 ?auto_552099 ) ) ( not ( = ?auto_552097 ?auto_552100 ) ) ( not ( = ?auto_552097 ?auto_552101 ) ) ( not ( = ?auto_552097 ?auto_552102 ) ) ( not ( = ?auto_552097 ?auto_552103 ) ) ( not ( = ?auto_552097 ?auto_552104 ) ) ( not ( = ?auto_552097 ?auto_552105 ) ) ( not ( = ?auto_552097 ?auto_552106 ) ) ( not ( = ?auto_552097 ?auto_552107 ) ) ( not ( = ?auto_552097 ?auto_552108 ) ) ( not ( = ?auto_552097 ?auto_552109 ) ) ( not ( = ?auto_552097 ?auto_552110 ) ) ( not ( = ?auto_552097 ?auto_552111 ) ) ( not ( = ?auto_552098 ?auto_552099 ) ) ( not ( = ?auto_552098 ?auto_552100 ) ) ( not ( = ?auto_552098 ?auto_552101 ) ) ( not ( = ?auto_552098 ?auto_552102 ) ) ( not ( = ?auto_552098 ?auto_552103 ) ) ( not ( = ?auto_552098 ?auto_552104 ) ) ( not ( = ?auto_552098 ?auto_552105 ) ) ( not ( = ?auto_552098 ?auto_552106 ) ) ( not ( = ?auto_552098 ?auto_552107 ) ) ( not ( = ?auto_552098 ?auto_552108 ) ) ( not ( = ?auto_552098 ?auto_552109 ) ) ( not ( = ?auto_552098 ?auto_552110 ) ) ( not ( = ?auto_552098 ?auto_552111 ) ) ( not ( = ?auto_552099 ?auto_552100 ) ) ( not ( = ?auto_552099 ?auto_552101 ) ) ( not ( = ?auto_552099 ?auto_552102 ) ) ( not ( = ?auto_552099 ?auto_552103 ) ) ( not ( = ?auto_552099 ?auto_552104 ) ) ( not ( = ?auto_552099 ?auto_552105 ) ) ( not ( = ?auto_552099 ?auto_552106 ) ) ( not ( = ?auto_552099 ?auto_552107 ) ) ( not ( = ?auto_552099 ?auto_552108 ) ) ( not ( = ?auto_552099 ?auto_552109 ) ) ( not ( = ?auto_552099 ?auto_552110 ) ) ( not ( = ?auto_552099 ?auto_552111 ) ) ( not ( = ?auto_552100 ?auto_552101 ) ) ( not ( = ?auto_552100 ?auto_552102 ) ) ( not ( = ?auto_552100 ?auto_552103 ) ) ( not ( = ?auto_552100 ?auto_552104 ) ) ( not ( = ?auto_552100 ?auto_552105 ) ) ( not ( = ?auto_552100 ?auto_552106 ) ) ( not ( = ?auto_552100 ?auto_552107 ) ) ( not ( = ?auto_552100 ?auto_552108 ) ) ( not ( = ?auto_552100 ?auto_552109 ) ) ( not ( = ?auto_552100 ?auto_552110 ) ) ( not ( = ?auto_552100 ?auto_552111 ) ) ( not ( = ?auto_552101 ?auto_552102 ) ) ( not ( = ?auto_552101 ?auto_552103 ) ) ( not ( = ?auto_552101 ?auto_552104 ) ) ( not ( = ?auto_552101 ?auto_552105 ) ) ( not ( = ?auto_552101 ?auto_552106 ) ) ( not ( = ?auto_552101 ?auto_552107 ) ) ( not ( = ?auto_552101 ?auto_552108 ) ) ( not ( = ?auto_552101 ?auto_552109 ) ) ( not ( = ?auto_552101 ?auto_552110 ) ) ( not ( = ?auto_552101 ?auto_552111 ) ) ( not ( = ?auto_552102 ?auto_552103 ) ) ( not ( = ?auto_552102 ?auto_552104 ) ) ( not ( = ?auto_552102 ?auto_552105 ) ) ( not ( = ?auto_552102 ?auto_552106 ) ) ( not ( = ?auto_552102 ?auto_552107 ) ) ( not ( = ?auto_552102 ?auto_552108 ) ) ( not ( = ?auto_552102 ?auto_552109 ) ) ( not ( = ?auto_552102 ?auto_552110 ) ) ( not ( = ?auto_552102 ?auto_552111 ) ) ( not ( = ?auto_552103 ?auto_552104 ) ) ( not ( = ?auto_552103 ?auto_552105 ) ) ( not ( = ?auto_552103 ?auto_552106 ) ) ( not ( = ?auto_552103 ?auto_552107 ) ) ( not ( = ?auto_552103 ?auto_552108 ) ) ( not ( = ?auto_552103 ?auto_552109 ) ) ( not ( = ?auto_552103 ?auto_552110 ) ) ( not ( = ?auto_552103 ?auto_552111 ) ) ( not ( = ?auto_552104 ?auto_552105 ) ) ( not ( = ?auto_552104 ?auto_552106 ) ) ( not ( = ?auto_552104 ?auto_552107 ) ) ( not ( = ?auto_552104 ?auto_552108 ) ) ( not ( = ?auto_552104 ?auto_552109 ) ) ( not ( = ?auto_552104 ?auto_552110 ) ) ( not ( = ?auto_552104 ?auto_552111 ) ) ( not ( = ?auto_552105 ?auto_552106 ) ) ( not ( = ?auto_552105 ?auto_552107 ) ) ( not ( = ?auto_552105 ?auto_552108 ) ) ( not ( = ?auto_552105 ?auto_552109 ) ) ( not ( = ?auto_552105 ?auto_552110 ) ) ( not ( = ?auto_552105 ?auto_552111 ) ) ( not ( = ?auto_552106 ?auto_552107 ) ) ( not ( = ?auto_552106 ?auto_552108 ) ) ( not ( = ?auto_552106 ?auto_552109 ) ) ( not ( = ?auto_552106 ?auto_552110 ) ) ( not ( = ?auto_552106 ?auto_552111 ) ) ( not ( = ?auto_552107 ?auto_552108 ) ) ( not ( = ?auto_552107 ?auto_552109 ) ) ( not ( = ?auto_552107 ?auto_552110 ) ) ( not ( = ?auto_552107 ?auto_552111 ) ) ( not ( = ?auto_552108 ?auto_552109 ) ) ( not ( = ?auto_552108 ?auto_552110 ) ) ( not ( = ?auto_552108 ?auto_552111 ) ) ( not ( = ?auto_552109 ?auto_552110 ) ) ( not ( = ?auto_552109 ?auto_552111 ) ) ( not ( = ?auto_552110 ?auto_552111 ) ) ( ON ?auto_552109 ?auto_552110 ) ( ON ?auto_552108 ?auto_552109 ) ( ON ?auto_552107 ?auto_552108 ) ( ON ?auto_552106 ?auto_552107 ) ( ON ?auto_552105 ?auto_552106 ) ( CLEAR ?auto_552103 ) ( ON ?auto_552104 ?auto_552105 ) ( CLEAR ?auto_552104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_552095 ?auto_552096 ?auto_552097 ?auto_552098 ?auto_552099 ?auto_552100 ?auto_552101 ?auto_552102 ?auto_552103 ?auto_552104 )
      ( MAKE-16PILE ?auto_552095 ?auto_552096 ?auto_552097 ?auto_552098 ?auto_552099 ?auto_552100 ?auto_552101 ?auto_552102 ?auto_552103 ?auto_552104 ?auto_552105 ?auto_552106 ?auto_552107 ?auto_552108 ?auto_552109 ?auto_552110 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552128 - BLOCK
      ?auto_552129 - BLOCK
      ?auto_552130 - BLOCK
      ?auto_552131 - BLOCK
      ?auto_552132 - BLOCK
      ?auto_552133 - BLOCK
      ?auto_552134 - BLOCK
      ?auto_552135 - BLOCK
      ?auto_552136 - BLOCK
      ?auto_552137 - BLOCK
      ?auto_552138 - BLOCK
      ?auto_552139 - BLOCK
      ?auto_552140 - BLOCK
      ?auto_552141 - BLOCK
      ?auto_552142 - BLOCK
      ?auto_552143 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_552143 ) ( ON-TABLE ?auto_552128 ) ( ON ?auto_552129 ?auto_552128 ) ( ON ?auto_552130 ?auto_552129 ) ( ON ?auto_552131 ?auto_552130 ) ( ON ?auto_552132 ?auto_552131 ) ( ON ?auto_552133 ?auto_552132 ) ( ON ?auto_552134 ?auto_552133 ) ( ON ?auto_552135 ?auto_552134 ) ( ON ?auto_552136 ?auto_552135 ) ( not ( = ?auto_552128 ?auto_552129 ) ) ( not ( = ?auto_552128 ?auto_552130 ) ) ( not ( = ?auto_552128 ?auto_552131 ) ) ( not ( = ?auto_552128 ?auto_552132 ) ) ( not ( = ?auto_552128 ?auto_552133 ) ) ( not ( = ?auto_552128 ?auto_552134 ) ) ( not ( = ?auto_552128 ?auto_552135 ) ) ( not ( = ?auto_552128 ?auto_552136 ) ) ( not ( = ?auto_552128 ?auto_552137 ) ) ( not ( = ?auto_552128 ?auto_552138 ) ) ( not ( = ?auto_552128 ?auto_552139 ) ) ( not ( = ?auto_552128 ?auto_552140 ) ) ( not ( = ?auto_552128 ?auto_552141 ) ) ( not ( = ?auto_552128 ?auto_552142 ) ) ( not ( = ?auto_552128 ?auto_552143 ) ) ( not ( = ?auto_552129 ?auto_552130 ) ) ( not ( = ?auto_552129 ?auto_552131 ) ) ( not ( = ?auto_552129 ?auto_552132 ) ) ( not ( = ?auto_552129 ?auto_552133 ) ) ( not ( = ?auto_552129 ?auto_552134 ) ) ( not ( = ?auto_552129 ?auto_552135 ) ) ( not ( = ?auto_552129 ?auto_552136 ) ) ( not ( = ?auto_552129 ?auto_552137 ) ) ( not ( = ?auto_552129 ?auto_552138 ) ) ( not ( = ?auto_552129 ?auto_552139 ) ) ( not ( = ?auto_552129 ?auto_552140 ) ) ( not ( = ?auto_552129 ?auto_552141 ) ) ( not ( = ?auto_552129 ?auto_552142 ) ) ( not ( = ?auto_552129 ?auto_552143 ) ) ( not ( = ?auto_552130 ?auto_552131 ) ) ( not ( = ?auto_552130 ?auto_552132 ) ) ( not ( = ?auto_552130 ?auto_552133 ) ) ( not ( = ?auto_552130 ?auto_552134 ) ) ( not ( = ?auto_552130 ?auto_552135 ) ) ( not ( = ?auto_552130 ?auto_552136 ) ) ( not ( = ?auto_552130 ?auto_552137 ) ) ( not ( = ?auto_552130 ?auto_552138 ) ) ( not ( = ?auto_552130 ?auto_552139 ) ) ( not ( = ?auto_552130 ?auto_552140 ) ) ( not ( = ?auto_552130 ?auto_552141 ) ) ( not ( = ?auto_552130 ?auto_552142 ) ) ( not ( = ?auto_552130 ?auto_552143 ) ) ( not ( = ?auto_552131 ?auto_552132 ) ) ( not ( = ?auto_552131 ?auto_552133 ) ) ( not ( = ?auto_552131 ?auto_552134 ) ) ( not ( = ?auto_552131 ?auto_552135 ) ) ( not ( = ?auto_552131 ?auto_552136 ) ) ( not ( = ?auto_552131 ?auto_552137 ) ) ( not ( = ?auto_552131 ?auto_552138 ) ) ( not ( = ?auto_552131 ?auto_552139 ) ) ( not ( = ?auto_552131 ?auto_552140 ) ) ( not ( = ?auto_552131 ?auto_552141 ) ) ( not ( = ?auto_552131 ?auto_552142 ) ) ( not ( = ?auto_552131 ?auto_552143 ) ) ( not ( = ?auto_552132 ?auto_552133 ) ) ( not ( = ?auto_552132 ?auto_552134 ) ) ( not ( = ?auto_552132 ?auto_552135 ) ) ( not ( = ?auto_552132 ?auto_552136 ) ) ( not ( = ?auto_552132 ?auto_552137 ) ) ( not ( = ?auto_552132 ?auto_552138 ) ) ( not ( = ?auto_552132 ?auto_552139 ) ) ( not ( = ?auto_552132 ?auto_552140 ) ) ( not ( = ?auto_552132 ?auto_552141 ) ) ( not ( = ?auto_552132 ?auto_552142 ) ) ( not ( = ?auto_552132 ?auto_552143 ) ) ( not ( = ?auto_552133 ?auto_552134 ) ) ( not ( = ?auto_552133 ?auto_552135 ) ) ( not ( = ?auto_552133 ?auto_552136 ) ) ( not ( = ?auto_552133 ?auto_552137 ) ) ( not ( = ?auto_552133 ?auto_552138 ) ) ( not ( = ?auto_552133 ?auto_552139 ) ) ( not ( = ?auto_552133 ?auto_552140 ) ) ( not ( = ?auto_552133 ?auto_552141 ) ) ( not ( = ?auto_552133 ?auto_552142 ) ) ( not ( = ?auto_552133 ?auto_552143 ) ) ( not ( = ?auto_552134 ?auto_552135 ) ) ( not ( = ?auto_552134 ?auto_552136 ) ) ( not ( = ?auto_552134 ?auto_552137 ) ) ( not ( = ?auto_552134 ?auto_552138 ) ) ( not ( = ?auto_552134 ?auto_552139 ) ) ( not ( = ?auto_552134 ?auto_552140 ) ) ( not ( = ?auto_552134 ?auto_552141 ) ) ( not ( = ?auto_552134 ?auto_552142 ) ) ( not ( = ?auto_552134 ?auto_552143 ) ) ( not ( = ?auto_552135 ?auto_552136 ) ) ( not ( = ?auto_552135 ?auto_552137 ) ) ( not ( = ?auto_552135 ?auto_552138 ) ) ( not ( = ?auto_552135 ?auto_552139 ) ) ( not ( = ?auto_552135 ?auto_552140 ) ) ( not ( = ?auto_552135 ?auto_552141 ) ) ( not ( = ?auto_552135 ?auto_552142 ) ) ( not ( = ?auto_552135 ?auto_552143 ) ) ( not ( = ?auto_552136 ?auto_552137 ) ) ( not ( = ?auto_552136 ?auto_552138 ) ) ( not ( = ?auto_552136 ?auto_552139 ) ) ( not ( = ?auto_552136 ?auto_552140 ) ) ( not ( = ?auto_552136 ?auto_552141 ) ) ( not ( = ?auto_552136 ?auto_552142 ) ) ( not ( = ?auto_552136 ?auto_552143 ) ) ( not ( = ?auto_552137 ?auto_552138 ) ) ( not ( = ?auto_552137 ?auto_552139 ) ) ( not ( = ?auto_552137 ?auto_552140 ) ) ( not ( = ?auto_552137 ?auto_552141 ) ) ( not ( = ?auto_552137 ?auto_552142 ) ) ( not ( = ?auto_552137 ?auto_552143 ) ) ( not ( = ?auto_552138 ?auto_552139 ) ) ( not ( = ?auto_552138 ?auto_552140 ) ) ( not ( = ?auto_552138 ?auto_552141 ) ) ( not ( = ?auto_552138 ?auto_552142 ) ) ( not ( = ?auto_552138 ?auto_552143 ) ) ( not ( = ?auto_552139 ?auto_552140 ) ) ( not ( = ?auto_552139 ?auto_552141 ) ) ( not ( = ?auto_552139 ?auto_552142 ) ) ( not ( = ?auto_552139 ?auto_552143 ) ) ( not ( = ?auto_552140 ?auto_552141 ) ) ( not ( = ?auto_552140 ?auto_552142 ) ) ( not ( = ?auto_552140 ?auto_552143 ) ) ( not ( = ?auto_552141 ?auto_552142 ) ) ( not ( = ?auto_552141 ?auto_552143 ) ) ( not ( = ?auto_552142 ?auto_552143 ) ) ( ON ?auto_552142 ?auto_552143 ) ( ON ?auto_552141 ?auto_552142 ) ( ON ?auto_552140 ?auto_552141 ) ( ON ?auto_552139 ?auto_552140 ) ( ON ?auto_552138 ?auto_552139 ) ( CLEAR ?auto_552136 ) ( ON ?auto_552137 ?auto_552138 ) ( CLEAR ?auto_552137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_552128 ?auto_552129 ?auto_552130 ?auto_552131 ?auto_552132 ?auto_552133 ?auto_552134 ?auto_552135 ?auto_552136 ?auto_552137 )
      ( MAKE-16PILE ?auto_552128 ?auto_552129 ?auto_552130 ?auto_552131 ?auto_552132 ?auto_552133 ?auto_552134 ?auto_552135 ?auto_552136 ?auto_552137 ?auto_552138 ?auto_552139 ?auto_552140 ?auto_552141 ?auto_552142 ?auto_552143 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552160 - BLOCK
      ?auto_552161 - BLOCK
      ?auto_552162 - BLOCK
      ?auto_552163 - BLOCK
      ?auto_552164 - BLOCK
      ?auto_552165 - BLOCK
      ?auto_552166 - BLOCK
      ?auto_552167 - BLOCK
      ?auto_552168 - BLOCK
      ?auto_552169 - BLOCK
      ?auto_552170 - BLOCK
      ?auto_552171 - BLOCK
      ?auto_552172 - BLOCK
      ?auto_552173 - BLOCK
      ?auto_552174 - BLOCK
      ?auto_552175 - BLOCK
    )
    :vars
    (
      ?auto_552176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552175 ?auto_552176 ) ( ON-TABLE ?auto_552160 ) ( ON ?auto_552161 ?auto_552160 ) ( ON ?auto_552162 ?auto_552161 ) ( ON ?auto_552163 ?auto_552162 ) ( ON ?auto_552164 ?auto_552163 ) ( ON ?auto_552165 ?auto_552164 ) ( ON ?auto_552166 ?auto_552165 ) ( ON ?auto_552167 ?auto_552166 ) ( not ( = ?auto_552160 ?auto_552161 ) ) ( not ( = ?auto_552160 ?auto_552162 ) ) ( not ( = ?auto_552160 ?auto_552163 ) ) ( not ( = ?auto_552160 ?auto_552164 ) ) ( not ( = ?auto_552160 ?auto_552165 ) ) ( not ( = ?auto_552160 ?auto_552166 ) ) ( not ( = ?auto_552160 ?auto_552167 ) ) ( not ( = ?auto_552160 ?auto_552168 ) ) ( not ( = ?auto_552160 ?auto_552169 ) ) ( not ( = ?auto_552160 ?auto_552170 ) ) ( not ( = ?auto_552160 ?auto_552171 ) ) ( not ( = ?auto_552160 ?auto_552172 ) ) ( not ( = ?auto_552160 ?auto_552173 ) ) ( not ( = ?auto_552160 ?auto_552174 ) ) ( not ( = ?auto_552160 ?auto_552175 ) ) ( not ( = ?auto_552160 ?auto_552176 ) ) ( not ( = ?auto_552161 ?auto_552162 ) ) ( not ( = ?auto_552161 ?auto_552163 ) ) ( not ( = ?auto_552161 ?auto_552164 ) ) ( not ( = ?auto_552161 ?auto_552165 ) ) ( not ( = ?auto_552161 ?auto_552166 ) ) ( not ( = ?auto_552161 ?auto_552167 ) ) ( not ( = ?auto_552161 ?auto_552168 ) ) ( not ( = ?auto_552161 ?auto_552169 ) ) ( not ( = ?auto_552161 ?auto_552170 ) ) ( not ( = ?auto_552161 ?auto_552171 ) ) ( not ( = ?auto_552161 ?auto_552172 ) ) ( not ( = ?auto_552161 ?auto_552173 ) ) ( not ( = ?auto_552161 ?auto_552174 ) ) ( not ( = ?auto_552161 ?auto_552175 ) ) ( not ( = ?auto_552161 ?auto_552176 ) ) ( not ( = ?auto_552162 ?auto_552163 ) ) ( not ( = ?auto_552162 ?auto_552164 ) ) ( not ( = ?auto_552162 ?auto_552165 ) ) ( not ( = ?auto_552162 ?auto_552166 ) ) ( not ( = ?auto_552162 ?auto_552167 ) ) ( not ( = ?auto_552162 ?auto_552168 ) ) ( not ( = ?auto_552162 ?auto_552169 ) ) ( not ( = ?auto_552162 ?auto_552170 ) ) ( not ( = ?auto_552162 ?auto_552171 ) ) ( not ( = ?auto_552162 ?auto_552172 ) ) ( not ( = ?auto_552162 ?auto_552173 ) ) ( not ( = ?auto_552162 ?auto_552174 ) ) ( not ( = ?auto_552162 ?auto_552175 ) ) ( not ( = ?auto_552162 ?auto_552176 ) ) ( not ( = ?auto_552163 ?auto_552164 ) ) ( not ( = ?auto_552163 ?auto_552165 ) ) ( not ( = ?auto_552163 ?auto_552166 ) ) ( not ( = ?auto_552163 ?auto_552167 ) ) ( not ( = ?auto_552163 ?auto_552168 ) ) ( not ( = ?auto_552163 ?auto_552169 ) ) ( not ( = ?auto_552163 ?auto_552170 ) ) ( not ( = ?auto_552163 ?auto_552171 ) ) ( not ( = ?auto_552163 ?auto_552172 ) ) ( not ( = ?auto_552163 ?auto_552173 ) ) ( not ( = ?auto_552163 ?auto_552174 ) ) ( not ( = ?auto_552163 ?auto_552175 ) ) ( not ( = ?auto_552163 ?auto_552176 ) ) ( not ( = ?auto_552164 ?auto_552165 ) ) ( not ( = ?auto_552164 ?auto_552166 ) ) ( not ( = ?auto_552164 ?auto_552167 ) ) ( not ( = ?auto_552164 ?auto_552168 ) ) ( not ( = ?auto_552164 ?auto_552169 ) ) ( not ( = ?auto_552164 ?auto_552170 ) ) ( not ( = ?auto_552164 ?auto_552171 ) ) ( not ( = ?auto_552164 ?auto_552172 ) ) ( not ( = ?auto_552164 ?auto_552173 ) ) ( not ( = ?auto_552164 ?auto_552174 ) ) ( not ( = ?auto_552164 ?auto_552175 ) ) ( not ( = ?auto_552164 ?auto_552176 ) ) ( not ( = ?auto_552165 ?auto_552166 ) ) ( not ( = ?auto_552165 ?auto_552167 ) ) ( not ( = ?auto_552165 ?auto_552168 ) ) ( not ( = ?auto_552165 ?auto_552169 ) ) ( not ( = ?auto_552165 ?auto_552170 ) ) ( not ( = ?auto_552165 ?auto_552171 ) ) ( not ( = ?auto_552165 ?auto_552172 ) ) ( not ( = ?auto_552165 ?auto_552173 ) ) ( not ( = ?auto_552165 ?auto_552174 ) ) ( not ( = ?auto_552165 ?auto_552175 ) ) ( not ( = ?auto_552165 ?auto_552176 ) ) ( not ( = ?auto_552166 ?auto_552167 ) ) ( not ( = ?auto_552166 ?auto_552168 ) ) ( not ( = ?auto_552166 ?auto_552169 ) ) ( not ( = ?auto_552166 ?auto_552170 ) ) ( not ( = ?auto_552166 ?auto_552171 ) ) ( not ( = ?auto_552166 ?auto_552172 ) ) ( not ( = ?auto_552166 ?auto_552173 ) ) ( not ( = ?auto_552166 ?auto_552174 ) ) ( not ( = ?auto_552166 ?auto_552175 ) ) ( not ( = ?auto_552166 ?auto_552176 ) ) ( not ( = ?auto_552167 ?auto_552168 ) ) ( not ( = ?auto_552167 ?auto_552169 ) ) ( not ( = ?auto_552167 ?auto_552170 ) ) ( not ( = ?auto_552167 ?auto_552171 ) ) ( not ( = ?auto_552167 ?auto_552172 ) ) ( not ( = ?auto_552167 ?auto_552173 ) ) ( not ( = ?auto_552167 ?auto_552174 ) ) ( not ( = ?auto_552167 ?auto_552175 ) ) ( not ( = ?auto_552167 ?auto_552176 ) ) ( not ( = ?auto_552168 ?auto_552169 ) ) ( not ( = ?auto_552168 ?auto_552170 ) ) ( not ( = ?auto_552168 ?auto_552171 ) ) ( not ( = ?auto_552168 ?auto_552172 ) ) ( not ( = ?auto_552168 ?auto_552173 ) ) ( not ( = ?auto_552168 ?auto_552174 ) ) ( not ( = ?auto_552168 ?auto_552175 ) ) ( not ( = ?auto_552168 ?auto_552176 ) ) ( not ( = ?auto_552169 ?auto_552170 ) ) ( not ( = ?auto_552169 ?auto_552171 ) ) ( not ( = ?auto_552169 ?auto_552172 ) ) ( not ( = ?auto_552169 ?auto_552173 ) ) ( not ( = ?auto_552169 ?auto_552174 ) ) ( not ( = ?auto_552169 ?auto_552175 ) ) ( not ( = ?auto_552169 ?auto_552176 ) ) ( not ( = ?auto_552170 ?auto_552171 ) ) ( not ( = ?auto_552170 ?auto_552172 ) ) ( not ( = ?auto_552170 ?auto_552173 ) ) ( not ( = ?auto_552170 ?auto_552174 ) ) ( not ( = ?auto_552170 ?auto_552175 ) ) ( not ( = ?auto_552170 ?auto_552176 ) ) ( not ( = ?auto_552171 ?auto_552172 ) ) ( not ( = ?auto_552171 ?auto_552173 ) ) ( not ( = ?auto_552171 ?auto_552174 ) ) ( not ( = ?auto_552171 ?auto_552175 ) ) ( not ( = ?auto_552171 ?auto_552176 ) ) ( not ( = ?auto_552172 ?auto_552173 ) ) ( not ( = ?auto_552172 ?auto_552174 ) ) ( not ( = ?auto_552172 ?auto_552175 ) ) ( not ( = ?auto_552172 ?auto_552176 ) ) ( not ( = ?auto_552173 ?auto_552174 ) ) ( not ( = ?auto_552173 ?auto_552175 ) ) ( not ( = ?auto_552173 ?auto_552176 ) ) ( not ( = ?auto_552174 ?auto_552175 ) ) ( not ( = ?auto_552174 ?auto_552176 ) ) ( not ( = ?auto_552175 ?auto_552176 ) ) ( ON ?auto_552174 ?auto_552175 ) ( ON ?auto_552173 ?auto_552174 ) ( ON ?auto_552172 ?auto_552173 ) ( ON ?auto_552171 ?auto_552172 ) ( ON ?auto_552170 ?auto_552171 ) ( ON ?auto_552169 ?auto_552170 ) ( CLEAR ?auto_552167 ) ( ON ?auto_552168 ?auto_552169 ) ( CLEAR ?auto_552168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_552160 ?auto_552161 ?auto_552162 ?auto_552163 ?auto_552164 ?auto_552165 ?auto_552166 ?auto_552167 ?auto_552168 )
      ( MAKE-16PILE ?auto_552160 ?auto_552161 ?auto_552162 ?auto_552163 ?auto_552164 ?auto_552165 ?auto_552166 ?auto_552167 ?auto_552168 ?auto_552169 ?auto_552170 ?auto_552171 ?auto_552172 ?auto_552173 ?auto_552174 ?auto_552175 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552193 - BLOCK
      ?auto_552194 - BLOCK
      ?auto_552195 - BLOCK
      ?auto_552196 - BLOCK
      ?auto_552197 - BLOCK
      ?auto_552198 - BLOCK
      ?auto_552199 - BLOCK
      ?auto_552200 - BLOCK
      ?auto_552201 - BLOCK
      ?auto_552202 - BLOCK
      ?auto_552203 - BLOCK
      ?auto_552204 - BLOCK
      ?auto_552205 - BLOCK
      ?auto_552206 - BLOCK
      ?auto_552207 - BLOCK
      ?auto_552208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_552208 ) ( ON-TABLE ?auto_552193 ) ( ON ?auto_552194 ?auto_552193 ) ( ON ?auto_552195 ?auto_552194 ) ( ON ?auto_552196 ?auto_552195 ) ( ON ?auto_552197 ?auto_552196 ) ( ON ?auto_552198 ?auto_552197 ) ( ON ?auto_552199 ?auto_552198 ) ( ON ?auto_552200 ?auto_552199 ) ( not ( = ?auto_552193 ?auto_552194 ) ) ( not ( = ?auto_552193 ?auto_552195 ) ) ( not ( = ?auto_552193 ?auto_552196 ) ) ( not ( = ?auto_552193 ?auto_552197 ) ) ( not ( = ?auto_552193 ?auto_552198 ) ) ( not ( = ?auto_552193 ?auto_552199 ) ) ( not ( = ?auto_552193 ?auto_552200 ) ) ( not ( = ?auto_552193 ?auto_552201 ) ) ( not ( = ?auto_552193 ?auto_552202 ) ) ( not ( = ?auto_552193 ?auto_552203 ) ) ( not ( = ?auto_552193 ?auto_552204 ) ) ( not ( = ?auto_552193 ?auto_552205 ) ) ( not ( = ?auto_552193 ?auto_552206 ) ) ( not ( = ?auto_552193 ?auto_552207 ) ) ( not ( = ?auto_552193 ?auto_552208 ) ) ( not ( = ?auto_552194 ?auto_552195 ) ) ( not ( = ?auto_552194 ?auto_552196 ) ) ( not ( = ?auto_552194 ?auto_552197 ) ) ( not ( = ?auto_552194 ?auto_552198 ) ) ( not ( = ?auto_552194 ?auto_552199 ) ) ( not ( = ?auto_552194 ?auto_552200 ) ) ( not ( = ?auto_552194 ?auto_552201 ) ) ( not ( = ?auto_552194 ?auto_552202 ) ) ( not ( = ?auto_552194 ?auto_552203 ) ) ( not ( = ?auto_552194 ?auto_552204 ) ) ( not ( = ?auto_552194 ?auto_552205 ) ) ( not ( = ?auto_552194 ?auto_552206 ) ) ( not ( = ?auto_552194 ?auto_552207 ) ) ( not ( = ?auto_552194 ?auto_552208 ) ) ( not ( = ?auto_552195 ?auto_552196 ) ) ( not ( = ?auto_552195 ?auto_552197 ) ) ( not ( = ?auto_552195 ?auto_552198 ) ) ( not ( = ?auto_552195 ?auto_552199 ) ) ( not ( = ?auto_552195 ?auto_552200 ) ) ( not ( = ?auto_552195 ?auto_552201 ) ) ( not ( = ?auto_552195 ?auto_552202 ) ) ( not ( = ?auto_552195 ?auto_552203 ) ) ( not ( = ?auto_552195 ?auto_552204 ) ) ( not ( = ?auto_552195 ?auto_552205 ) ) ( not ( = ?auto_552195 ?auto_552206 ) ) ( not ( = ?auto_552195 ?auto_552207 ) ) ( not ( = ?auto_552195 ?auto_552208 ) ) ( not ( = ?auto_552196 ?auto_552197 ) ) ( not ( = ?auto_552196 ?auto_552198 ) ) ( not ( = ?auto_552196 ?auto_552199 ) ) ( not ( = ?auto_552196 ?auto_552200 ) ) ( not ( = ?auto_552196 ?auto_552201 ) ) ( not ( = ?auto_552196 ?auto_552202 ) ) ( not ( = ?auto_552196 ?auto_552203 ) ) ( not ( = ?auto_552196 ?auto_552204 ) ) ( not ( = ?auto_552196 ?auto_552205 ) ) ( not ( = ?auto_552196 ?auto_552206 ) ) ( not ( = ?auto_552196 ?auto_552207 ) ) ( not ( = ?auto_552196 ?auto_552208 ) ) ( not ( = ?auto_552197 ?auto_552198 ) ) ( not ( = ?auto_552197 ?auto_552199 ) ) ( not ( = ?auto_552197 ?auto_552200 ) ) ( not ( = ?auto_552197 ?auto_552201 ) ) ( not ( = ?auto_552197 ?auto_552202 ) ) ( not ( = ?auto_552197 ?auto_552203 ) ) ( not ( = ?auto_552197 ?auto_552204 ) ) ( not ( = ?auto_552197 ?auto_552205 ) ) ( not ( = ?auto_552197 ?auto_552206 ) ) ( not ( = ?auto_552197 ?auto_552207 ) ) ( not ( = ?auto_552197 ?auto_552208 ) ) ( not ( = ?auto_552198 ?auto_552199 ) ) ( not ( = ?auto_552198 ?auto_552200 ) ) ( not ( = ?auto_552198 ?auto_552201 ) ) ( not ( = ?auto_552198 ?auto_552202 ) ) ( not ( = ?auto_552198 ?auto_552203 ) ) ( not ( = ?auto_552198 ?auto_552204 ) ) ( not ( = ?auto_552198 ?auto_552205 ) ) ( not ( = ?auto_552198 ?auto_552206 ) ) ( not ( = ?auto_552198 ?auto_552207 ) ) ( not ( = ?auto_552198 ?auto_552208 ) ) ( not ( = ?auto_552199 ?auto_552200 ) ) ( not ( = ?auto_552199 ?auto_552201 ) ) ( not ( = ?auto_552199 ?auto_552202 ) ) ( not ( = ?auto_552199 ?auto_552203 ) ) ( not ( = ?auto_552199 ?auto_552204 ) ) ( not ( = ?auto_552199 ?auto_552205 ) ) ( not ( = ?auto_552199 ?auto_552206 ) ) ( not ( = ?auto_552199 ?auto_552207 ) ) ( not ( = ?auto_552199 ?auto_552208 ) ) ( not ( = ?auto_552200 ?auto_552201 ) ) ( not ( = ?auto_552200 ?auto_552202 ) ) ( not ( = ?auto_552200 ?auto_552203 ) ) ( not ( = ?auto_552200 ?auto_552204 ) ) ( not ( = ?auto_552200 ?auto_552205 ) ) ( not ( = ?auto_552200 ?auto_552206 ) ) ( not ( = ?auto_552200 ?auto_552207 ) ) ( not ( = ?auto_552200 ?auto_552208 ) ) ( not ( = ?auto_552201 ?auto_552202 ) ) ( not ( = ?auto_552201 ?auto_552203 ) ) ( not ( = ?auto_552201 ?auto_552204 ) ) ( not ( = ?auto_552201 ?auto_552205 ) ) ( not ( = ?auto_552201 ?auto_552206 ) ) ( not ( = ?auto_552201 ?auto_552207 ) ) ( not ( = ?auto_552201 ?auto_552208 ) ) ( not ( = ?auto_552202 ?auto_552203 ) ) ( not ( = ?auto_552202 ?auto_552204 ) ) ( not ( = ?auto_552202 ?auto_552205 ) ) ( not ( = ?auto_552202 ?auto_552206 ) ) ( not ( = ?auto_552202 ?auto_552207 ) ) ( not ( = ?auto_552202 ?auto_552208 ) ) ( not ( = ?auto_552203 ?auto_552204 ) ) ( not ( = ?auto_552203 ?auto_552205 ) ) ( not ( = ?auto_552203 ?auto_552206 ) ) ( not ( = ?auto_552203 ?auto_552207 ) ) ( not ( = ?auto_552203 ?auto_552208 ) ) ( not ( = ?auto_552204 ?auto_552205 ) ) ( not ( = ?auto_552204 ?auto_552206 ) ) ( not ( = ?auto_552204 ?auto_552207 ) ) ( not ( = ?auto_552204 ?auto_552208 ) ) ( not ( = ?auto_552205 ?auto_552206 ) ) ( not ( = ?auto_552205 ?auto_552207 ) ) ( not ( = ?auto_552205 ?auto_552208 ) ) ( not ( = ?auto_552206 ?auto_552207 ) ) ( not ( = ?auto_552206 ?auto_552208 ) ) ( not ( = ?auto_552207 ?auto_552208 ) ) ( ON ?auto_552207 ?auto_552208 ) ( ON ?auto_552206 ?auto_552207 ) ( ON ?auto_552205 ?auto_552206 ) ( ON ?auto_552204 ?auto_552205 ) ( ON ?auto_552203 ?auto_552204 ) ( ON ?auto_552202 ?auto_552203 ) ( CLEAR ?auto_552200 ) ( ON ?auto_552201 ?auto_552202 ) ( CLEAR ?auto_552201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_552193 ?auto_552194 ?auto_552195 ?auto_552196 ?auto_552197 ?auto_552198 ?auto_552199 ?auto_552200 ?auto_552201 )
      ( MAKE-16PILE ?auto_552193 ?auto_552194 ?auto_552195 ?auto_552196 ?auto_552197 ?auto_552198 ?auto_552199 ?auto_552200 ?auto_552201 ?auto_552202 ?auto_552203 ?auto_552204 ?auto_552205 ?auto_552206 ?auto_552207 ?auto_552208 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552225 - BLOCK
      ?auto_552226 - BLOCK
      ?auto_552227 - BLOCK
      ?auto_552228 - BLOCK
      ?auto_552229 - BLOCK
      ?auto_552230 - BLOCK
      ?auto_552231 - BLOCK
      ?auto_552232 - BLOCK
      ?auto_552233 - BLOCK
      ?auto_552234 - BLOCK
      ?auto_552235 - BLOCK
      ?auto_552236 - BLOCK
      ?auto_552237 - BLOCK
      ?auto_552238 - BLOCK
      ?auto_552239 - BLOCK
      ?auto_552240 - BLOCK
    )
    :vars
    (
      ?auto_552241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552240 ?auto_552241 ) ( ON-TABLE ?auto_552225 ) ( ON ?auto_552226 ?auto_552225 ) ( ON ?auto_552227 ?auto_552226 ) ( ON ?auto_552228 ?auto_552227 ) ( ON ?auto_552229 ?auto_552228 ) ( ON ?auto_552230 ?auto_552229 ) ( ON ?auto_552231 ?auto_552230 ) ( not ( = ?auto_552225 ?auto_552226 ) ) ( not ( = ?auto_552225 ?auto_552227 ) ) ( not ( = ?auto_552225 ?auto_552228 ) ) ( not ( = ?auto_552225 ?auto_552229 ) ) ( not ( = ?auto_552225 ?auto_552230 ) ) ( not ( = ?auto_552225 ?auto_552231 ) ) ( not ( = ?auto_552225 ?auto_552232 ) ) ( not ( = ?auto_552225 ?auto_552233 ) ) ( not ( = ?auto_552225 ?auto_552234 ) ) ( not ( = ?auto_552225 ?auto_552235 ) ) ( not ( = ?auto_552225 ?auto_552236 ) ) ( not ( = ?auto_552225 ?auto_552237 ) ) ( not ( = ?auto_552225 ?auto_552238 ) ) ( not ( = ?auto_552225 ?auto_552239 ) ) ( not ( = ?auto_552225 ?auto_552240 ) ) ( not ( = ?auto_552225 ?auto_552241 ) ) ( not ( = ?auto_552226 ?auto_552227 ) ) ( not ( = ?auto_552226 ?auto_552228 ) ) ( not ( = ?auto_552226 ?auto_552229 ) ) ( not ( = ?auto_552226 ?auto_552230 ) ) ( not ( = ?auto_552226 ?auto_552231 ) ) ( not ( = ?auto_552226 ?auto_552232 ) ) ( not ( = ?auto_552226 ?auto_552233 ) ) ( not ( = ?auto_552226 ?auto_552234 ) ) ( not ( = ?auto_552226 ?auto_552235 ) ) ( not ( = ?auto_552226 ?auto_552236 ) ) ( not ( = ?auto_552226 ?auto_552237 ) ) ( not ( = ?auto_552226 ?auto_552238 ) ) ( not ( = ?auto_552226 ?auto_552239 ) ) ( not ( = ?auto_552226 ?auto_552240 ) ) ( not ( = ?auto_552226 ?auto_552241 ) ) ( not ( = ?auto_552227 ?auto_552228 ) ) ( not ( = ?auto_552227 ?auto_552229 ) ) ( not ( = ?auto_552227 ?auto_552230 ) ) ( not ( = ?auto_552227 ?auto_552231 ) ) ( not ( = ?auto_552227 ?auto_552232 ) ) ( not ( = ?auto_552227 ?auto_552233 ) ) ( not ( = ?auto_552227 ?auto_552234 ) ) ( not ( = ?auto_552227 ?auto_552235 ) ) ( not ( = ?auto_552227 ?auto_552236 ) ) ( not ( = ?auto_552227 ?auto_552237 ) ) ( not ( = ?auto_552227 ?auto_552238 ) ) ( not ( = ?auto_552227 ?auto_552239 ) ) ( not ( = ?auto_552227 ?auto_552240 ) ) ( not ( = ?auto_552227 ?auto_552241 ) ) ( not ( = ?auto_552228 ?auto_552229 ) ) ( not ( = ?auto_552228 ?auto_552230 ) ) ( not ( = ?auto_552228 ?auto_552231 ) ) ( not ( = ?auto_552228 ?auto_552232 ) ) ( not ( = ?auto_552228 ?auto_552233 ) ) ( not ( = ?auto_552228 ?auto_552234 ) ) ( not ( = ?auto_552228 ?auto_552235 ) ) ( not ( = ?auto_552228 ?auto_552236 ) ) ( not ( = ?auto_552228 ?auto_552237 ) ) ( not ( = ?auto_552228 ?auto_552238 ) ) ( not ( = ?auto_552228 ?auto_552239 ) ) ( not ( = ?auto_552228 ?auto_552240 ) ) ( not ( = ?auto_552228 ?auto_552241 ) ) ( not ( = ?auto_552229 ?auto_552230 ) ) ( not ( = ?auto_552229 ?auto_552231 ) ) ( not ( = ?auto_552229 ?auto_552232 ) ) ( not ( = ?auto_552229 ?auto_552233 ) ) ( not ( = ?auto_552229 ?auto_552234 ) ) ( not ( = ?auto_552229 ?auto_552235 ) ) ( not ( = ?auto_552229 ?auto_552236 ) ) ( not ( = ?auto_552229 ?auto_552237 ) ) ( not ( = ?auto_552229 ?auto_552238 ) ) ( not ( = ?auto_552229 ?auto_552239 ) ) ( not ( = ?auto_552229 ?auto_552240 ) ) ( not ( = ?auto_552229 ?auto_552241 ) ) ( not ( = ?auto_552230 ?auto_552231 ) ) ( not ( = ?auto_552230 ?auto_552232 ) ) ( not ( = ?auto_552230 ?auto_552233 ) ) ( not ( = ?auto_552230 ?auto_552234 ) ) ( not ( = ?auto_552230 ?auto_552235 ) ) ( not ( = ?auto_552230 ?auto_552236 ) ) ( not ( = ?auto_552230 ?auto_552237 ) ) ( not ( = ?auto_552230 ?auto_552238 ) ) ( not ( = ?auto_552230 ?auto_552239 ) ) ( not ( = ?auto_552230 ?auto_552240 ) ) ( not ( = ?auto_552230 ?auto_552241 ) ) ( not ( = ?auto_552231 ?auto_552232 ) ) ( not ( = ?auto_552231 ?auto_552233 ) ) ( not ( = ?auto_552231 ?auto_552234 ) ) ( not ( = ?auto_552231 ?auto_552235 ) ) ( not ( = ?auto_552231 ?auto_552236 ) ) ( not ( = ?auto_552231 ?auto_552237 ) ) ( not ( = ?auto_552231 ?auto_552238 ) ) ( not ( = ?auto_552231 ?auto_552239 ) ) ( not ( = ?auto_552231 ?auto_552240 ) ) ( not ( = ?auto_552231 ?auto_552241 ) ) ( not ( = ?auto_552232 ?auto_552233 ) ) ( not ( = ?auto_552232 ?auto_552234 ) ) ( not ( = ?auto_552232 ?auto_552235 ) ) ( not ( = ?auto_552232 ?auto_552236 ) ) ( not ( = ?auto_552232 ?auto_552237 ) ) ( not ( = ?auto_552232 ?auto_552238 ) ) ( not ( = ?auto_552232 ?auto_552239 ) ) ( not ( = ?auto_552232 ?auto_552240 ) ) ( not ( = ?auto_552232 ?auto_552241 ) ) ( not ( = ?auto_552233 ?auto_552234 ) ) ( not ( = ?auto_552233 ?auto_552235 ) ) ( not ( = ?auto_552233 ?auto_552236 ) ) ( not ( = ?auto_552233 ?auto_552237 ) ) ( not ( = ?auto_552233 ?auto_552238 ) ) ( not ( = ?auto_552233 ?auto_552239 ) ) ( not ( = ?auto_552233 ?auto_552240 ) ) ( not ( = ?auto_552233 ?auto_552241 ) ) ( not ( = ?auto_552234 ?auto_552235 ) ) ( not ( = ?auto_552234 ?auto_552236 ) ) ( not ( = ?auto_552234 ?auto_552237 ) ) ( not ( = ?auto_552234 ?auto_552238 ) ) ( not ( = ?auto_552234 ?auto_552239 ) ) ( not ( = ?auto_552234 ?auto_552240 ) ) ( not ( = ?auto_552234 ?auto_552241 ) ) ( not ( = ?auto_552235 ?auto_552236 ) ) ( not ( = ?auto_552235 ?auto_552237 ) ) ( not ( = ?auto_552235 ?auto_552238 ) ) ( not ( = ?auto_552235 ?auto_552239 ) ) ( not ( = ?auto_552235 ?auto_552240 ) ) ( not ( = ?auto_552235 ?auto_552241 ) ) ( not ( = ?auto_552236 ?auto_552237 ) ) ( not ( = ?auto_552236 ?auto_552238 ) ) ( not ( = ?auto_552236 ?auto_552239 ) ) ( not ( = ?auto_552236 ?auto_552240 ) ) ( not ( = ?auto_552236 ?auto_552241 ) ) ( not ( = ?auto_552237 ?auto_552238 ) ) ( not ( = ?auto_552237 ?auto_552239 ) ) ( not ( = ?auto_552237 ?auto_552240 ) ) ( not ( = ?auto_552237 ?auto_552241 ) ) ( not ( = ?auto_552238 ?auto_552239 ) ) ( not ( = ?auto_552238 ?auto_552240 ) ) ( not ( = ?auto_552238 ?auto_552241 ) ) ( not ( = ?auto_552239 ?auto_552240 ) ) ( not ( = ?auto_552239 ?auto_552241 ) ) ( not ( = ?auto_552240 ?auto_552241 ) ) ( ON ?auto_552239 ?auto_552240 ) ( ON ?auto_552238 ?auto_552239 ) ( ON ?auto_552237 ?auto_552238 ) ( ON ?auto_552236 ?auto_552237 ) ( ON ?auto_552235 ?auto_552236 ) ( ON ?auto_552234 ?auto_552235 ) ( ON ?auto_552233 ?auto_552234 ) ( CLEAR ?auto_552231 ) ( ON ?auto_552232 ?auto_552233 ) ( CLEAR ?auto_552232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_552225 ?auto_552226 ?auto_552227 ?auto_552228 ?auto_552229 ?auto_552230 ?auto_552231 ?auto_552232 )
      ( MAKE-16PILE ?auto_552225 ?auto_552226 ?auto_552227 ?auto_552228 ?auto_552229 ?auto_552230 ?auto_552231 ?auto_552232 ?auto_552233 ?auto_552234 ?auto_552235 ?auto_552236 ?auto_552237 ?auto_552238 ?auto_552239 ?auto_552240 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552258 - BLOCK
      ?auto_552259 - BLOCK
      ?auto_552260 - BLOCK
      ?auto_552261 - BLOCK
      ?auto_552262 - BLOCK
      ?auto_552263 - BLOCK
      ?auto_552264 - BLOCK
      ?auto_552265 - BLOCK
      ?auto_552266 - BLOCK
      ?auto_552267 - BLOCK
      ?auto_552268 - BLOCK
      ?auto_552269 - BLOCK
      ?auto_552270 - BLOCK
      ?auto_552271 - BLOCK
      ?auto_552272 - BLOCK
      ?auto_552273 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_552273 ) ( ON-TABLE ?auto_552258 ) ( ON ?auto_552259 ?auto_552258 ) ( ON ?auto_552260 ?auto_552259 ) ( ON ?auto_552261 ?auto_552260 ) ( ON ?auto_552262 ?auto_552261 ) ( ON ?auto_552263 ?auto_552262 ) ( ON ?auto_552264 ?auto_552263 ) ( not ( = ?auto_552258 ?auto_552259 ) ) ( not ( = ?auto_552258 ?auto_552260 ) ) ( not ( = ?auto_552258 ?auto_552261 ) ) ( not ( = ?auto_552258 ?auto_552262 ) ) ( not ( = ?auto_552258 ?auto_552263 ) ) ( not ( = ?auto_552258 ?auto_552264 ) ) ( not ( = ?auto_552258 ?auto_552265 ) ) ( not ( = ?auto_552258 ?auto_552266 ) ) ( not ( = ?auto_552258 ?auto_552267 ) ) ( not ( = ?auto_552258 ?auto_552268 ) ) ( not ( = ?auto_552258 ?auto_552269 ) ) ( not ( = ?auto_552258 ?auto_552270 ) ) ( not ( = ?auto_552258 ?auto_552271 ) ) ( not ( = ?auto_552258 ?auto_552272 ) ) ( not ( = ?auto_552258 ?auto_552273 ) ) ( not ( = ?auto_552259 ?auto_552260 ) ) ( not ( = ?auto_552259 ?auto_552261 ) ) ( not ( = ?auto_552259 ?auto_552262 ) ) ( not ( = ?auto_552259 ?auto_552263 ) ) ( not ( = ?auto_552259 ?auto_552264 ) ) ( not ( = ?auto_552259 ?auto_552265 ) ) ( not ( = ?auto_552259 ?auto_552266 ) ) ( not ( = ?auto_552259 ?auto_552267 ) ) ( not ( = ?auto_552259 ?auto_552268 ) ) ( not ( = ?auto_552259 ?auto_552269 ) ) ( not ( = ?auto_552259 ?auto_552270 ) ) ( not ( = ?auto_552259 ?auto_552271 ) ) ( not ( = ?auto_552259 ?auto_552272 ) ) ( not ( = ?auto_552259 ?auto_552273 ) ) ( not ( = ?auto_552260 ?auto_552261 ) ) ( not ( = ?auto_552260 ?auto_552262 ) ) ( not ( = ?auto_552260 ?auto_552263 ) ) ( not ( = ?auto_552260 ?auto_552264 ) ) ( not ( = ?auto_552260 ?auto_552265 ) ) ( not ( = ?auto_552260 ?auto_552266 ) ) ( not ( = ?auto_552260 ?auto_552267 ) ) ( not ( = ?auto_552260 ?auto_552268 ) ) ( not ( = ?auto_552260 ?auto_552269 ) ) ( not ( = ?auto_552260 ?auto_552270 ) ) ( not ( = ?auto_552260 ?auto_552271 ) ) ( not ( = ?auto_552260 ?auto_552272 ) ) ( not ( = ?auto_552260 ?auto_552273 ) ) ( not ( = ?auto_552261 ?auto_552262 ) ) ( not ( = ?auto_552261 ?auto_552263 ) ) ( not ( = ?auto_552261 ?auto_552264 ) ) ( not ( = ?auto_552261 ?auto_552265 ) ) ( not ( = ?auto_552261 ?auto_552266 ) ) ( not ( = ?auto_552261 ?auto_552267 ) ) ( not ( = ?auto_552261 ?auto_552268 ) ) ( not ( = ?auto_552261 ?auto_552269 ) ) ( not ( = ?auto_552261 ?auto_552270 ) ) ( not ( = ?auto_552261 ?auto_552271 ) ) ( not ( = ?auto_552261 ?auto_552272 ) ) ( not ( = ?auto_552261 ?auto_552273 ) ) ( not ( = ?auto_552262 ?auto_552263 ) ) ( not ( = ?auto_552262 ?auto_552264 ) ) ( not ( = ?auto_552262 ?auto_552265 ) ) ( not ( = ?auto_552262 ?auto_552266 ) ) ( not ( = ?auto_552262 ?auto_552267 ) ) ( not ( = ?auto_552262 ?auto_552268 ) ) ( not ( = ?auto_552262 ?auto_552269 ) ) ( not ( = ?auto_552262 ?auto_552270 ) ) ( not ( = ?auto_552262 ?auto_552271 ) ) ( not ( = ?auto_552262 ?auto_552272 ) ) ( not ( = ?auto_552262 ?auto_552273 ) ) ( not ( = ?auto_552263 ?auto_552264 ) ) ( not ( = ?auto_552263 ?auto_552265 ) ) ( not ( = ?auto_552263 ?auto_552266 ) ) ( not ( = ?auto_552263 ?auto_552267 ) ) ( not ( = ?auto_552263 ?auto_552268 ) ) ( not ( = ?auto_552263 ?auto_552269 ) ) ( not ( = ?auto_552263 ?auto_552270 ) ) ( not ( = ?auto_552263 ?auto_552271 ) ) ( not ( = ?auto_552263 ?auto_552272 ) ) ( not ( = ?auto_552263 ?auto_552273 ) ) ( not ( = ?auto_552264 ?auto_552265 ) ) ( not ( = ?auto_552264 ?auto_552266 ) ) ( not ( = ?auto_552264 ?auto_552267 ) ) ( not ( = ?auto_552264 ?auto_552268 ) ) ( not ( = ?auto_552264 ?auto_552269 ) ) ( not ( = ?auto_552264 ?auto_552270 ) ) ( not ( = ?auto_552264 ?auto_552271 ) ) ( not ( = ?auto_552264 ?auto_552272 ) ) ( not ( = ?auto_552264 ?auto_552273 ) ) ( not ( = ?auto_552265 ?auto_552266 ) ) ( not ( = ?auto_552265 ?auto_552267 ) ) ( not ( = ?auto_552265 ?auto_552268 ) ) ( not ( = ?auto_552265 ?auto_552269 ) ) ( not ( = ?auto_552265 ?auto_552270 ) ) ( not ( = ?auto_552265 ?auto_552271 ) ) ( not ( = ?auto_552265 ?auto_552272 ) ) ( not ( = ?auto_552265 ?auto_552273 ) ) ( not ( = ?auto_552266 ?auto_552267 ) ) ( not ( = ?auto_552266 ?auto_552268 ) ) ( not ( = ?auto_552266 ?auto_552269 ) ) ( not ( = ?auto_552266 ?auto_552270 ) ) ( not ( = ?auto_552266 ?auto_552271 ) ) ( not ( = ?auto_552266 ?auto_552272 ) ) ( not ( = ?auto_552266 ?auto_552273 ) ) ( not ( = ?auto_552267 ?auto_552268 ) ) ( not ( = ?auto_552267 ?auto_552269 ) ) ( not ( = ?auto_552267 ?auto_552270 ) ) ( not ( = ?auto_552267 ?auto_552271 ) ) ( not ( = ?auto_552267 ?auto_552272 ) ) ( not ( = ?auto_552267 ?auto_552273 ) ) ( not ( = ?auto_552268 ?auto_552269 ) ) ( not ( = ?auto_552268 ?auto_552270 ) ) ( not ( = ?auto_552268 ?auto_552271 ) ) ( not ( = ?auto_552268 ?auto_552272 ) ) ( not ( = ?auto_552268 ?auto_552273 ) ) ( not ( = ?auto_552269 ?auto_552270 ) ) ( not ( = ?auto_552269 ?auto_552271 ) ) ( not ( = ?auto_552269 ?auto_552272 ) ) ( not ( = ?auto_552269 ?auto_552273 ) ) ( not ( = ?auto_552270 ?auto_552271 ) ) ( not ( = ?auto_552270 ?auto_552272 ) ) ( not ( = ?auto_552270 ?auto_552273 ) ) ( not ( = ?auto_552271 ?auto_552272 ) ) ( not ( = ?auto_552271 ?auto_552273 ) ) ( not ( = ?auto_552272 ?auto_552273 ) ) ( ON ?auto_552272 ?auto_552273 ) ( ON ?auto_552271 ?auto_552272 ) ( ON ?auto_552270 ?auto_552271 ) ( ON ?auto_552269 ?auto_552270 ) ( ON ?auto_552268 ?auto_552269 ) ( ON ?auto_552267 ?auto_552268 ) ( ON ?auto_552266 ?auto_552267 ) ( CLEAR ?auto_552264 ) ( ON ?auto_552265 ?auto_552266 ) ( CLEAR ?auto_552265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_552258 ?auto_552259 ?auto_552260 ?auto_552261 ?auto_552262 ?auto_552263 ?auto_552264 ?auto_552265 )
      ( MAKE-16PILE ?auto_552258 ?auto_552259 ?auto_552260 ?auto_552261 ?auto_552262 ?auto_552263 ?auto_552264 ?auto_552265 ?auto_552266 ?auto_552267 ?auto_552268 ?auto_552269 ?auto_552270 ?auto_552271 ?auto_552272 ?auto_552273 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552290 - BLOCK
      ?auto_552291 - BLOCK
      ?auto_552292 - BLOCK
      ?auto_552293 - BLOCK
      ?auto_552294 - BLOCK
      ?auto_552295 - BLOCK
      ?auto_552296 - BLOCK
      ?auto_552297 - BLOCK
      ?auto_552298 - BLOCK
      ?auto_552299 - BLOCK
      ?auto_552300 - BLOCK
      ?auto_552301 - BLOCK
      ?auto_552302 - BLOCK
      ?auto_552303 - BLOCK
      ?auto_552304 - BLOCK
      ?auto_552305 - BLOCK
    )
    :vars
    (
      ?auto_552306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552305 ?auto_552306 ) ( ON-TABLE ?auto_552290 ) ( ON ?auto_552291 ?auto_552290 ) ( ON ?auto_552292 ?auto_552291 ) ( ON ?auto_552293 ?auto_552292 ) ( ON ?auto_552294 ?auto_552293 ) ( ON ?auto_552295 ?auto_552294 ) ( not ( = ?auto_552290 ?auto_552291 ) ) ( not ( = ?auto_552290 ?auto_552292 ) ) ( not ( = ?auto_552290 ?auto_552293 ) ) ( not ( = ?auto_552290 ?auto_552294 ) ) ( not ( = ?auto_552290 ?auto_552295 ) ) ( not ( = ?auto_552290 ?auto_552296 ) ) ( not ( = ?auto_552290 ?auto_552297 ) ) ( not ( = ?auto_552290 ?auto_552298 ) ) ( not ( = ?auto_552290 ?auto_552299 ) ) ( not ( = ?auto_552290 ?auto_552300 ) ) ( not ( = ?auto_552290 ?auto_552301 ) ) ( not ( = ?auto_552290 ?auto_552302 ) ) ( not ( = ?auto_552290 ?auto_552303 ) ) ( not ( = ?auto_552290 ?auto_552304 ) ) ( not ( = ?auto_552290 ?auto_552305 ) ) ( not ( = ?auto_552290 ?auto_552306 ) ) ( not ( = ?auto_552291 ?auto_552292 ) ) ( not ( = ?auto_552291 ?auto_552293 ) ) ( not ( = ?auto_552291 ?auto_552294 ) ) ( not ( = ?auto_552291 ?auto_552295 ) ) ( not ( = ?auto_552291 ?auto_552296 ) ) ( not ( = ?auto_552291 ?auto_552297 ) ) ( not ( = ?auto_552291 ?auto_552298 ) ) ( not ( = ?auto_552291 ?auto_552299 ) ) ( not ( = ?auto_552291 ?auto_552300 ) ) ( not ( = ?auto_552291 ?auto_552301 ) ) ( not ( = ?auto_552291 ?auto_552302 ) ) ( not ( = ?auto_552291 ?auto_552303 ) ) ( not ( = ?auto_552291 ?auto_552304 ) ) ( not ( = ?auto_552291 ?auto_552305 ) ) ( not ( = ?auto_552291 ?auto_552306 ) ) ( not ( = ?auto_552292 ?auto_552293 ) ) ( not ( = ?auto_552292 ?auto_552294 ) ) ( not ( = ?auto_552292 ?auto_552295 ) ) ( not ( = ?auto_552292 ?auto_552296 ) ) ( not ( = ?auto_552292 ?auto_552297 ) ) ( not ( = ?auto_552292 ?auto_552298 ) ) ( not ( = ?auto_552292 ?auto_552299 ) ) ( not ( = ?auto_552292 ?auto_552300 ) ) ( not ( = ?auto_552292 ?auto_552301 ) ) ( not ( = ?auto_552292 ?auto_552302 ) ) ( not ( = ?auto_552292 ?auto_552303 ) ) ( not ( = ?auto_552292 ?auto_552304 ) ) ( not ( = ?auto_552292 ?auto_552305 ) ) ( not ( = ?auto_552292 ?auto_552306 ) ) ( not ( = ?auto_552293 ?auto_552294 ) ) ( not ( = ?auto_552293 ?auto_552295 ) ) ( not ( = ?auto_552293 ?auto_552296 ) ) ( not ( = ?auto_552293 ?auto_552297 ) ) ( not ( = ?auto_552293 ?auto_552298 ) ) ( not ( = ?auto_552293 ?auto_552299 ) ) ( not ( = ?auto_552293 ?auto_552300 ) ) ( not ( = ?auto_552293 ?auto_552301 ) ) ( not ( = ?auto_552293 ?auto_552302 ) ) ( not ( = ?auto_552293 ?auto_552303 ) ) ( not ( = ?auto_552293 ?auto_552304 ) ) ( not ( = ?auto_552293 ?auto_552305 ) ) ( not ( = ?auto_552293 ?auto_552306 ) ) ( not ( = ?auto_552294 ?auto_552295 ) ) ( not ( = ?auto_552294 ?auto_552296 ) ) ( not ( = ?auto_552294 ?auto_552297 ) ) ( not ( = ?auto_552294 ?auto_552298 ) ) ( not ( = ?auto_552294 ?auto_552299 ) ) ( not ( = ?auto_552294 ?auto_552300 ) ) ( not ( = ?auto_552294 ?auto_552301 ) ) ( not ( = ?auto_552294 ?auto_552302 ) ) ( not ( = ?auto_552294 ?auto_552303 ) ) ( not ( = ?auto_552294 ?auto_552304 ) ) ( not ( = ?auto_552294 ?auto_552305 ) ) ( not ( = ?auto_552294 ?auto_552306 ) ) ( not ( = ?auto_552295 ?auto_552296 ) ) ( not ( = ?auto_552295 ?auto_552297 ) ) ( not ( = ?auto_552295 ?auto_552298 ) ) ( not ( = ?auto_552295 ?auto_552299 ) ) ( not ( = ?auto_552295 ?auto_552300 ) ) ( not ( = ?auto_552295 ?auto_552301 ) ) ( not ( = ?auto_552295 ?auto_552302 ) ) ( not ( = ?auto_552295 ?auto_552303 ) ) ( not ( = ?auto_552295 ?auto_552304 ) ) ( not ( = ?auto_552295 ?auto_552305 ) ) ( not ( = ?auto_552295 ?auto_552306 ) ) ( not ( = ?auto_552296 ?auto_552297 ) ) ( not ( = ?auto_552296 ?auto_552298 ) ) ( not ( = ?auto_552296 ?auto_552299 ) ) ( not ( = ?auto_552296 ?auto_552300 ) ) ( not ( = ?auto_552296 ?auto_552301 ) ) ( not ( = ?auto_552296 ?auto_552302 ) ) ( not ( = ?auto_552296 ?auto_552303 ) ) ( not ( = ?auto_552296 ?auto_552304 ) ) ( not ( = ?auto_552296 ?auto_552305 ) ) ( not ( = ?auto_552296 ?auto_552306 ) ) ( not ( = ?auto_552297 ?auto_552298 ) ) ( not ( = ?auto_552297 ?auto_552299 ) ) ( not ( = ?auto_552297 ?auto_552300 ) ) ( not ( = ?auto_552297 ?auto_552301 ) ) ( not ( = ?auto_552297 ?auto_552302 ) ) ( not ( = ?auto_552297 ?auto_552303 ) ) ( not ( = ?auto_552297 ?auto_552304 ) ) ( not ( = ?auto_552297 ?auto_552305 ) ) ( not ( = ?auto_552297 ?auto_552306 ) ) ( not ( = ?auto_552298 ?auto_552299 ) ) ( not ( = ?auto_552298 ?auto_552300 ) ) ( not ( = ?auto_552298 ?auto_552301 ) ) ( not ( = ?auto_552298 ?auto_552302 ) ) ( not ( = ?auto_552298 ?auto_552303 ) ) ( not ( = ?auto_552298 ?auto_552304 ) ) ( not ( = ?auto_552298 ?auto_552305 ) ) ( not ( = ?auto_552298 ?auto_552306 ) ) ( not ( = ?auto_552299 ?auto_552300 ) ) ( not ( = ?auto_552299 ?auto_552301 ) ) ( not ( = ?auto_552299 ?auto_552302 ) ) ( not ( = ?auto_552299 ?auto_552303 ) ) ( not ( = ?auto_552299 ?auto_552304 ) ) ( not ( = ?auto_552299 ?auto_552305 ) ) ( not ( = ?auto_552299 ?auto_552306 ) ) ( not ( = ?auto_552300 ?auto_552301 ) ) ( not ( = ?auto_552300 ?auto_552302 ) ) ( not ( = ?auto_552300 ?auto_552303 ) ) ( not ( = ?auto_552300 ?auto_552304 ) ) ( not ( = ?auto_552300 ?auto_552305 ) ) ( not ( = ?auto_552300 ?auto_552306 ) ) ( not ( = ?auto_552301 ?auto_552302 ) ) ( not ( = ?auto_552301 ?auto_552303 ) ) ( not ( = ?auto_552301 ?auto_552304 ) ) ( not ( = ?auto_552301 ?auto_552305 ) ) ( not ( = ?auto_552301 ?auto_552306 ) ) ( not ( = ?auto_552302 ?auto_552303 ) ) ( not ( = ?auto_552302 ?auto_552304 ) ) ( not ( = ?auto_552302 ?auto_552305 ) ) ( not ( = ?auto_552302 ?auto_552306 ) ) ( not ( = ?auto_552303 ?auto_552304 ) ) ( not ( = ?auto_552303 ?auto_552305 ) ) ( not ( = ?auto_552303 ?auto_552306 ) ) ( not ( = ?auto_552304 ?auto_552305 ) ) ( not ( = ?auto_552304 ?auto_552306 ) ) ( not ( = ?auto_552305 ?auto_552306 ) ) ( ON ?auto_552304 ?auto_552305 ) ( ON ?auto_552303 ?auto_552304 ) ( ON ?auto_552302 ?auto_552303 ) ( ON ?auto_552301 ?auto_552302 ) ( ON ?auto_552300 ?auto_552301 ) ( ON ?auto_552299 ?auto_552300 ) ( ON ?auto_552298 ?auto_552299 ) ( ON ?auto_552297 ?auto_552298 ) ( CLEAR ?auto_552295 ) ( ON ?auto_552296 ?auto_552297 ) ( CLEAR ?auto_552296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_552290 ?auto_552291 ?auto_552292 ?auto_552293 ?auto_552294 ?auto_552295 ?auto_552296 )
      ( MAKE-16PILE ?auto_552290 ?auto_552291 ?auto_552292 ?auto_552293 ?auto_552294 ?auto_552295 ?auto_552296 ?auto_552297 ?auto_552298 ?auto_552299 ?auto_552300 ?auto_552301 ?auto_552302 ?auto_552303 ?auto_552304 ?auto_552305 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552323 - BLOCK
      ?auto_552324 - BLOCK
      ?auto_552325 - BLOCK
      ?auto_552326 - BLOCK
      ?auto_552327 - BLOCK
      ?auto_552328 - BLOCK
      ?auto_552329 - BLOCK
      ?auto_552330 - BLOCK
      ?auto_552331 - BLOCK
      ?auto_552332 - BLOCK
      ?auto_552333 - BLOCK
      ?auto_552334 - BLOCK
      ?auto_552335 - BLOCK
      ?auto_552336 - BLOCK
      ?auto_552337 - BLOCK
      ?auto_552338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_552338 ) ( ON-TABLE ?auto_552323 ) ( ON ?auto_552324 ?auto_552323 ) ( ON ?auto_552325 ?auto_552324 ) ( ON ?auto_552326 ?auto_552325 ) ( ON ?auto_552327 ?auto_552326 ) ( ON ?auto_552328 ?auto_552327 ) ( not ( = ?auto_552323 ?auto_552324 ) ) ( not ( = ?auto_552323 ?auto_552325 ) ) ( not ( = ?auto_552323 ?auto_552326 ) ) ( not ( = ?auto_552323 ?auto_552327 ) ) ( not ( = ?auto_552323 ?auto_552328 ) ) ( not ( = ?auto_552323 ?auto_552329 ) ) ( not ( = ?auto_552323 ?auto_552330 ) ) ( not ( = ?auto_552323 ?auto_552331 ) ) ( not ( = ?auto_552323 ?auto_552332 ) ) ( not ( = ?auto_552323 ?auto_552333 ) ) ( not ( = ?auto_552323 ?auto_552334 ) ) ( not ( = ?auto_552323 ?auto_552335 ) ) ( not ( = ?auto_552323 ?auto_552336 ) ) ( not ( = ?auto_552323 ?auto_552337 ) ) ( not ( = ?auto_552323 ?auto_552338 ) ) ( not ( = ?auto_552324 ?auto_552325 ) ) ( not ( = ?auto_552324 ?auto_552326 ) ) ( not ( = ?auto_552324 ?auto_552327 ) ) ( not ( = ?auto_552324 ?auto_552328 ) ) ( not ( = ?auto_552324 ?auto_552329 ) ) ( not ( = ?auto_552324 ?auto_552330 ) ) ( not ( = ?auto_552324 ?auto_552331 ) ) ( not ( = ?auto_552324 ?auto_552332 ) ) ( not ( = ?auto_552324 ?auto_552333 ) ) ( not ( = ?auto_552324 ?auto_552334 ) ) ( not ( = ?auto_552324 ?auto_552335 ) ) ( not ( = ?auto_552324 ?auto_552336 ) ) ( not ( = ?auto_552324 ?auto_552337 ) ) ( not ( = ?auto_552324 ?auto_552338 ) ) ( not ( = ?auto_552325 ?auto_552326 ) ) ( not ( = ?auto_552325 ?auto_552327 ) ) ( not ( = ?auto_552325 ?auto_552328 ) ) ( not ( = ?auto_552325 ?auto_552329 ) ) ( not ( = ?auto_552325 ?auto_552330 ) ) ( not ( = ?auto_552325 ?auto_552331 ) ) ( not ( = ?auto_552325 ?auto_552332 ) ) ( not ( = ?auto_552325 ?auto_552333 ) ) ( not ( = ?auto_552325 ?auto_552334 ) ) ( not ( = ?auto_552325 ?auto_552335 ) ) ( not ( = ?auto_552325 ?auto_552336 ) ) ( not ( = ?auto_552325 ?auto_552337 ) ) ( not ( = ?auto_552325 ?auto_552338 ) ) ( not ( = ?auto_552326 ?auto_552327 ) ) ( not ( = ?auto_552326 ?auto_552328 ) ) ( not ( = ?auto_552326 ?auto_552329 ) ) ( not ( = ?auto_552326 ?auto_552330 ) ) ( not ( = ?auto_552326 ?auto_552331 ) ) ( not ( = ?auto_552326 ?auto_552332 ) ) ( not ( = ?auto_552326 ?auto_552333 ) ) ( not ( = ?auto_552326 ?auto_552334 ) ) ( not ( = ?auto_552326 ?auto_552335 ) ) ( not ( = ?auto_552326 ?auto_552336 ) ) ( not ( = ?auto_552326 ?auto_552337 ) ) ( not ( = ?auto_552326 ?auto_552338 ) ) ( not ( = ?auto_552327 ?auto_552328 ) ) ( not ( = ?auto_552327 ?auto_552329 ) ) ( not ( = ?auto_552327 ?auto_552330 ) ) ( not ( = ?auto_552327 ?auto_552331 ) ) ( not ( = ?auto_552327 ?auto_552332 ) ) ( not ( = ?auto_552327 ?auto_552333 ) ) ( not ( = ?auto_552327 ?auto_552334 ) ) ( not ( = ?auto_552327 ?auto_552335 ) ) ( not ( = ?auto_552327 ?auto_552336 ) ) ( not ( = ?auto_552327 ?auto_552337 ) ) ( not ( = ?auto_552327 ?auto_552338 ) ) ( not ( = ?auto_552328 ?auto_552329 ) ) ( not ( = ?auto_552328 ?auto_552330 ) ) ( not ( = ?auto_552328 ?auto_552331 ) ) ( not ( = ?auto_552328 ?auto_552332 ) ) ( not ( = ?auto_552328 ?auto_552333 ) ) ( not ( = ?auto_552328 ?auto_552334 ) ) ( not ( = ?auto_552328 ?auto_552335 ) ) ( not ( = ?auto_552328 ?auto_552336 ) ) ( not ( = ?auto_552328 ?auto_552337 ) ) ( not ( = ?auto_552328 ?auto_552338 ) ) ( not ( = ?auto_552329 ?auto_552330 ) ) ( not ( = ?auto_552329 ?auto_552331 ) ) ( not ( = ?auto_552329 ?auto_552332 ) ) ( not ( = ?auto_552329 ?auto_552333 ) ) ( not ( = ?auto_552329 ?auto_552334 ) ) ( not ( = ?auto_552329 ?auto_552335 ) ) ( not ( = ?auto_552329 ?auto_552336 ) ) ( not ( = ?auto_552329 ?auto_552337 ) ) ( not ( = ?auto_552329 ?auto_552338 ) ) ( not ( = ?auto_552330 ?auto_552331 ) ) ( not ( = ?auto_552330 ?auto_552332 ) ) ( not ( = ?auto_552330 ?auto_552333 ) ) ( not ( = ?auto_552330 ?auto_552334 ) ) ( not ( = ?auto_552330 ?auto_552335 ) ) ( not ( = ?auto_552330 ?auto_552336 ) ) ( not ( = ?auto_552330 ?auto_552337 ) ) ( not ( = ?auto_552330 ?auto_552338 ) ) ( not ( = ?auto_552331 ?auto_552332 ) ) ( not ( = ?auto_552331 ?auto_552333 ) ) ( not ( = ?auto_552331 ?auto_552334 ) ) ( not ( = ?auto_552331 ?auto_552335 ) ) ( not ( = ?auto_552331 ?auto_552336 ) ) ( not ( = ?auto_552331 ?auto_552337 ) ) ( not ( = ?auto_552331 ?auto_552338 ) ) ( not ( = ?auto_552332 ?auto_552333 ) ) ( not ( = ?auto_552332 ?auto_552334 ) ) ( not ( = ?auto_552332 ?auto_552335 ) ) ( not ( = ?auto_552332 ?auto_552336 ) ) ( not ( = ?auto_552332 ?auto_552337 ) ) ( not ( = ?auto_552332 ?auto_552338 ) ) ( not ( = ?auto_552333 ?auto_552334 ) ) ( not ( = ?auto_552333 ?auto_552335 ) ) ( not ( = ?auto_552333 ?auto_552336 ) ) ( not ( = ?auto_552333 ?auto_552337 ) ) ( not ( = ?auto_552333 ?auto_552338 ) ) ( not ( = ?auto_552334 ?auto_552335 ) ) ( not ( = ?auto_552334 ?auto_552336 ) ) ( not ( = ?auto_552334 ?auto_552337 ) ) ( not ( = ?auto_552334 ?auto_552338 ) ) ( not ( = ?auto_552335 ?auto_552336 ) ) ( not ( = ?auto_552335 ?auto_552337 ) ) ( not ( = ?auto_552335 ?auto_552338 ) ) ( not ( = ?auto_552336 ?auto_552337 ) ) ( not ( = ?auto_552336 ?auto_552338 ) ) ( not ( = ?auto_552337 ?auto_552338 ) ) ( ON ?auto_552337 ?auto_552338 ) ( ON ?auto_552336 ?auto_552337 ) ( ON ?auto_552335 ?auto_552336 ) ( ON ?auto_552334 ?auto_552335 ) ( ON ?auto_552333 ?auto_552334 ) ( ON ?auto_552332 ?auto_552333 ) ( ON ?auto_552331 ?auto_552332 ) ( ON ?auto_552330 ?auto_552331 ) ( CLEAR ?auto_552328 ) ( ON ?auto_552329 ?auto_552330 ) ( CLEAR ?auto_552329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_552323 ?auto_552324 ?auto_552325 ?auto_552326 ?auto_552327 ?auto_552328 ?auto_552329 )
      ( MAKE-16PILE ?auto_552323 ?auto_552324 ?auto_552325 ?auto_552326 ?auto_552327 ?auto_552328 ?auto_552329 ?auto_552330 ?auto_552331 ?auto_552332 ?auto_552333 ?auto_552334 ?auto_552335 ?auto_552336 ?auto_552337 ?auto_552338 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552355 - BLOCK
      ?auto_552356 - BLOCK
      ?auto_552357 - BLOCK
      ?auto_552358 - BLOCK
      ?auto_552359 - BLOCK
      ?auto_552360 - BLOCK
      ?auto_552361 - BLOCK
      ?auto_552362 - BLOCK
      ?auto_552363 - BLOCK
      ?auto_552364 - BLOCK
      ?auto_552365 - BLOCK
      ?auto_552366 - BLOCK
      ?auto_552367 - BLOCK
      ?auto_552368 - BLOCK
      ?auto_552369 - BLOCK
      ?auto_552370 - BLOCK
    )
    :vars
    (
      ?auto_552371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552370 ?auto_552371 ) ( ON-TABLE ?auto_552355 ) ( ON ?auto_552356 ?auto_552355 ) ( ON ?auto_552357 ?auto_552356 ) ( ON ?auto_552358 ?auto_552357 ) ( ON ?auto_552359 ?auto_552358 ) ( not ( = ?auto_552355 ?auto_552356 ) ) ( not ( = ?auto_552355 ?auto_552357 ) ) ( not ( = ?auto_552355 ?auto_552358 ) ) ( not ( = ?auto_552355 ?auto_552359 ) ) ( not ( = ?auto_552355 ?auto_552360 ) ) ( not ( = ?auto_552355 ?auto_552361 ) ) ( not ( = ?auto_552355 ?auto_552362 ) ) ( not ( = ?auto_552355 ?auto_552363 ) ) ( not ( = ?auto_552355 ?auto_552364 ) ) ( not ( = ?auto_552355 ?auto_552365 ) ) ( not ( = ?auto_552355 ?auto_552366 ) ) ( not ( = ?auto_552355 ?auto_552367 ) ) ( not ( = ?auto_552355 ?auto_552368 ) ) ( not ( = ?auto_552355 ?auto_552369 ) ) ( not ( = ?auto_552355 ?auto_552370 ) ) ( not ( = ?auto_552355 ?auto_552371 ) ) ( not ( = ?auto_552356 ?auto_552357 ) ) ( not ( = ?auto_552356 ?auto_552358 ) ) ( not ( = ?auto_552356 ?auto_552359 ) ) ( not ( = ?auto_552356 ?auto_552360 ) ) ( not ( = ?auto_552356 ?auto_552361 ) ) ( not ( = ?auto_552356 ?auto_552362 ) ) ( not ( = ?auto_552356 ?auto_552363 ) ) ( not ( = ?auto_552356 ?auto_552364 ) ) ( not ( = ?auto_552356 ?auto_552365 ) ) ( not ( = ?auto_552356 ?auto_552366 ) ) ( not ( = ?auto_552356 ?auto_552367 ) ) ( not ( = ?auto_552356 ?auto_552368 ) ) ( not ( = ?auto_552356 ?auto_552369 ) ) ( not ( = ?auto_552356 ?auto_552370 ) ) ( not ( = ?auto_552356 ?auto_552371 ) ) ( not ( = ?auto_552357 ?auto_552358 ) ) ( not ( = ?auto_552357 ?auto_552359 ) ) ( not ( = ?auto_552357 ?auto_552360 ) ) ( not ( = ?auto_552357 ?auto_552361 ) ) ( not ( = ?auto_552357 ?auto_552362 ) ) ( not ( = ?auto_552357 ?auto_552363 ) ) ( not ( = ?auto_552357 ?auto_552364 ) ) ( not ( = ?auto_552357 ?auto_552365 ) ) ( not ( = ?auto_552357 ?auto_552366 ) ) ( not ( = ?auto_552357 ?auto_552367 ) ) ( not ( = ?auto_552357 ?auto_552368 ) ) ( not ( = ?auto_552357 ?auto_552369 ) ) ( not ( = ?auto_552357 ?auto_552370 ) ) ( not ( = ?auto_552357 ?auto_552371 ) ) ( not ( = ?auto_552358 ?auto_552359 ) ) ( not ( = ?auto_552358 ?auto_552360 ) ) ( not ( = ?auto_552358 ?auto_552361 ) ) ( not ( = ?auto_552358 ?auto_552362 ) ) ( not ( = ?auto_552358 ?auto_552363 ) ) ( not ( = ?auto_552358 ?auto_552364 ) ) ( not ( = ?auto_552358 ?auto_552365 ) ) ( not ( = ?auto_552358 ?auto_552366 ) ) ( not ( = ?auto_552358 ?auto_552367 ) ) ( not ( = ?auto_552358 ?auto_552368 ) ) ( not ( = ?auto_552358 ?auto_552369 ) ) ( not ( = ?auto_552358 ?auto_552370 ) ) ( not ( = ?auto_552358 ?auto_552371 ) ) ( not ( = ?auto_552359 ?auto_552360 ) ) ( not ( = ?auto_552359 ?auto_552361 ) ) ( not ( = ?auto_552359 ?auto_552362 ) ) ( not ( = ?auto_552359 ?auto_552363 ) ) ( not ( = ?auto_552359 ?auto_552364 ) ) ( not ( = ?auto_552359 ?auto_552365 ) ) ( not ( = ?auto_552359 ?auto_552366 ) ) ( not ( = ?auto_552359 ?auto_552367 ) ) ( not ( = ?auto_552359 ?auto_552368 ) ) ( not ( = ?auto_552359 ?auto_552369 ) ) ( not ( = ?auto_552359 ?auto_552370 ) ) ( not ( = ?auto_552359 ?auto_552371 ) ) ( not ( = ?auto_552360 ?auto_552361 ) ) ( not ( = ?auto_552360 ?auto_552362 ) ) ( not ( = ?auto_552360 ?auto_552363 ) ) ( not ( = ?auto_552360 ?auto_552364 ) ) ( not ( = ?auto_552360 ?auto_552365 ) ) ( not ( = ?auto_552360 ?auto_552366 ) ) ( not ( = ?auto_552360 ?auto_552367 ) ) ( not ( = ?auto_552360 ?auto_552368 ) ) ( not ( = ?auto_552360 ?auto_552369 ) ) ( not ( = ?auto_552360 ?auto_552370 ) ) ( not ( = ?auto_552360 ?auto_552371 ) ) ( not ( = ?auto_552361 ?auto_552362 ) ) ( not ( = ?auto_552361 ?auto_552363 ) ) ( not ( = ?auto_552361 ?auto_552364 ) ) ( not ( = ?auto_552361 ?auto_552365 ) ) ( not ( = ?auto_552361 ?auto_552366 ) ) ( not ( = ?auto_552361 ?auto_552367 ) ) ( not ( = ?auto_552361 ?auto_552368 ) ) ( not ( = ?auto_552361 ?auto_552369 ) ) ( not ( = ?auto_552361 ?auto_552370 ) ) ( not ( = ?auto_552361 ?auto_552371 ) ) ( not ( = ?auto_552362 ?auto_552363 ) ) ( not ( = ?auto_552362 ?auto_552364 ) ) ( not ( = ?auto_552362 ?auto_552365 ) ) ( not ( = ?auto_552362 ?auto_552366 ) ) ( not ( = ?auto_552362 ?auto_552367 ) ) ( not ( = ?auto_552362 ?auto_552368 ) ) ( not ( = ?auto_552362 ?auto_552369 ) ) ( not ( = ?auto_552362 ?auto_552370 ) ) ( not ( = ?auto_552362 ?auto_552371 ) ) ( not ( = ?auto_552363 ?auto_552364 ) ) ( not ( = ?auto_552363 ?auto_552365 ) ) ( not ( = ?auto_552363 ?auto_552366 ) ) ( not ( = ?auto_552363 ?auto_552367 ) ) ( not ( = ?auto_552363 ?auto_552368 ) ) ( not ( = ?auto_552363 ?auto_552369 ) ) ( not ( = ?auto_552363 ?auto_552370 ) ) ( not ( = ?auto_552363 ?auto_552371 ) ) ( not ( = ?auto_552364 ?auto_552365 ) ) ( not ( = ?auto_552364 ?auto_552366 ) ) ( not ( = ?auto_552364 ?auto_552367 ) ) ( not ( = ?auto_552364 ?auto_552368 ) ) ( not ( = ?auto_552364 ?auto_552369 ) ) ( not ( = ?auto_552364 ?auto_552370 ) ) ( not ( = ?auto_552364 ?auto_552371 ) ) ( not ( = ?auto_552365 ?auto_552366 ) ) ( not ( = ?auto_552365 ?auto_552367 ) ) ( not ( = ?auto_552365 ?auto_552368 ) ) ( not ( = ?auto_552365 ?auto_552369 ) ) ( not ( = ?auto_552365 ?auto_552370 ) ) ( not ( = ?auto_552365 ?auto_552371 ) ) ( not ( = ?auto_552366 ?auto_552367 ) ) ( not ( = ?auto_552366 ?auto_552368 ) ) ( not ( = ?auto_552366 ?auto_552369 ) ) ( not ( = ?auto_552366 ?auto_552370 ) ) ( not ( = ?auto_552366 ?auto_552371 ) ) ( not ( = ?auto_552367 ?auto_552368 ) ) ( not ( = ?auto_552367 ?auto_552369 ) ) ( not ( = ?auto_552367 ?auto_552370 ) ) ( not ( = ?auto_552367 ?auto_552371 ) ) ( not ( = ?auto_552368 ?auto_552369 ) ) ( not ( = ?auto_552368 ?auto_552370 ) ) ( not ( = ?auto_552368 ?auto_552371 ) ) ( not ( = ?auto_552369 ?auto_552370 ) ) ( not ( = ?auto_552369 ?auto_552371 ) ) ( not ( = ?auto_552370 ?auto_552371 ) ) ( ON ?auto_552369 ?auto_552370 ) ( ON ?auto_552368 ?auto_552369 ) ( ON ?auto_552367 ?auto_552368 ) ( ON ?auto_552366 ?auto_552367 ) ( ON ?auto_552365 ?auto_552366 ) ( ON ?auto_552364 ?auto_552365 ) ( ON ?auto_552363 ?auto_552364 ) ( ON ?auto_552362 ?auto_552363 ) ( ON ?auto_552361 ?auto_552362 ) ( CLEAR ?auto_552359 ) ( ON ?auto_552360 ?auto_552361 ) ( CLEAR ?auto_552360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_552355 ?auto_552356 ?auto_552357 ?auto_552358 ?auto_552359 ?auto_552360 )
      ( MAKE-16PILE ?auto_552355 ?auto_552356 ?auto_552357 ?auto_552358 ?auto_552359 ?auto_552360 ?auto_552361 ?auto_552362 ?auto_552363 ?auto_552364 ?auto_552365 ?auto_552366 ?auto_552367 ?auto_552368 ?auto_552369 ?auto_552370 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552388 - BLOCK
      ?auto_552389 - BLOCK
      ?auto_552390 - BLOCK
      ?auto_552391 - BLOCK
      ?auto_552392 - BLOCK
      ?auto_552393 - BLOCK
      ?auto_552394 - BLOCK
      ?auto_552395 - BLOCK
      ?auto_552396 - BLOCK
      ?auto_552397 - BLOCK
      ?auto_552398 - BLOCK
      ?auto_552399 - BLOCK
      ?auto_552400 - BLOCK
      ?auto_552401 - BLOCK
      ?auto_552402 - BLOCK
      ?auto_552403 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_552403 ) ( ON-TABLE ?auto_552388 ) ( ON ?auto_552389 ?auto_552388 ) ( ON ?auto_552390 ?auto_552389 ) ( ON ?auto_552391 ?auto_552390 ) ( ON ?auto_552392 ?auto_552391 ) ( not ( = ?auto_552388 ?auto_552389 ) ) ( not ( = ?auto_552388 ?auto_552390 ) ) ( not ( = ?auto_552388 ?auto_552391 ) ) ( not ( = ?auto_552388 ?auto_552392 ) ) ( not ( = ?auto_552388 ?auto_552393 ) ) ( not ( = ?auto_552388 ?auto_552394 ) ) ( not ( = ?auto_552388 ?auto_552395 ) ) ( not ( = ?auto_552388 ?auto_552396 ) ) ( not ( = ?auto_552388 ?auto_552397 ) ) ( not ( = ?auto_552388 ?auto_552398 ) ) ( not ( = ?auto_552388 ?auto_552399 ) ) ( not ( = ?auto_552388 ?auto_552400 ) ) ( not ( = ?auto_552388 ?auto_552401 ) ) ( not ( = ?auto_552388 ?auto_552402 ) ) ( not ( = ?auto_552388 ?auto_552403 ) ) ( not ( = ?auto_552389 ?auto_552390 ) ) ( not ( = ?auto_552389 ?auto_552391 ) ) ( not ( = ?auto_552389 ?auto_552392 ) ) ( not ( = ?auto_552389 ?auto_552393 ) ) ( not ( = ?auto_552389 ?auto_552394 ) ) ( not ( = ?auto_552389 ?auto_552395 ) ) ( not ( = ?auto_552389 ?auto_552396 ) ) ( not ( = ?auto_552389 ?auto_552397 ) ) ( not ( = ?auto_552389 ?auto_552398 ) ) ( not ( = ?auto_552389 ?auto_552399 ) ) ( not ( = ?auto_552389 ?auto_552400 ) ) ( not ( = ?auto_552389 ?auto_552401 ) ) ( not ( = ?auto_552389 ?auto_552402 ) ) ( not ( = ?auto_552389 ?auto_552403 ) ) ( not ( = ?auto_552390 ?auto_552391 ) ) ( not ( = ?auto_552390 ?auto_552392 ) ) ( not ( = ?auto_552390 ?auto_552393 ) ) ( not ( = ?auto_552390 ?auto_552394 ) ) ( not ( = ?auto_552390 ?auto_552395 ) ) ( not ( = ?auto_552390 ?auto_552396 ) ) ( not ( = ?auto_552390 ?auto_552397 ) ) ( not ( = ?auto_552390 ?auto_552398 ) ) ( not ( = ?auto_552390 ?auto_552399 ) ) ( not ( = ?auto_552390 ?auto_552400 ) ) ( not ( = ?auto_552390 ?auto_552401 ) ) ( not ( = ?auto_552390 ?auto_552402 ) ) ( not ( = ?auto_552390 ?auto_552403 ) ) ( not ( = ?auto_552391 ?auto_552392 ) ) ( not ( = ?auto_552391 ?auto_552393 ) ) ( not ( = ?auto_552391 ?auto_552394 ) ) ( not ( = ?auto_552391 ?auto_552395 ) ) ( not ( = ?auto_552391 ?auto_552396 ) ) ( not ( = ?auto_552391 ?auto_552397 ) ) ( not ( = ?auto_552391 ?auto_552398 ) ) ( not ( = ?auto_552391 ?auto_552399 ) ) ( not ( = ?auto_552391 ?auto_552400 ) ) ( not ( = ?auto_552391 ?auto_552401 ) ) ( not ( = ?auto_552391 ?auto_552402 ) ) ( not ( = ?auto_552391 ?auto_552403 ) ) ( not ( = ?auto_552392 ?auto_552393 ) ) ( not ( = ?auto_552392 ?auto_552394 ) ) ( not ( = ?auto_552392 ?auto_552395 ) ) ( not ( = ?auto_552392 ?auto_552396 ) ) ( not ( = ?auto_552392 ?auto_552397 ) ) ( not ( = ?auto_552392 ?auto_552398 ) ) ( not ( = ?auto_552392 ?auto_552399 ) ) ( not ( = ?auto_552392 ?auto_552400 ) ) ( not ( = ?auto_552392 ?auto_552401 ) ) ( not ( = ?auto_552392 ?auto_552402 ) ) ( not ( = ?auto_552392 ?auto_552403 ) ) ( not ( = ?auto_552393 ?auto_552394 ) ) ( not ( = ?auto_552393 ?auto_552395 ) ) ( not ( = ?auto_552393 ?auto_552396 ) ) ( not ( = ?auto_552393 ?auto_552397 ) ) ( not ( = ?auto_552393 ?auto_552398 ) ) ( not ( = ?auto_552393 ?auto_552399 ) ) ( not ( = ?auto_552393 ?auto_552400 ) ) ( not ( = ?auto_552393 ?auto_552401 ) ) ( not ( = ?auto_552393 ?auto_552402 ) ) ( not ( = ?auto_552393 ?auto_552403 ) ) ( not ( = ?auto_552394 ?auto_552395 ) ) ( not ( = ?auto_552394 ?auto_552396 ) ) ( not ( = ?auto_552394 ?auto_552397 ) ) ( not ( = ?auto_552394 ?auto_552398 ) ) ( not ( = ?auto_552394 ?auto_552399 ) ) ( not ( = ?auto_552394 ?auto_552400 ) ) ( not ( = ?auto_552394 ?auto_552401 ) ) ( not ( = ?auto_552394 ?auto_552402 ) ) ( not ( = ?auto_552394 ?auto_552403 ) ) ( not ( = ?auto_552395 ?auto_552396 ) ) ( not ( = ?auto_552395 ?auto_552397 ) ) ( not ( = ?auto_552395 ?auto_552398 ) ) ( not ( = ?auto_552395 ?auto_552399 ) ) ( not ( = ?auto_552395 ?auto_552400 ) ) ( not ( = ?auto_552395 ?auto_552401 ) ) ( not ( = ?auto_552395 ?auto_552402 ) ) ( not ( = ?auto_552395 ?auto_552403 ) ) ( not ( = ?auto_552396 ?auto_552397 ) ) ( not ( = ?auto_552396 ?auto_552398 ) ) ( not ( = ?auto_552396 ?auto_552399 ) ) ( not ( = ?auto_552396 ?auto_552400 ) ) ( not ( = ?auto_552396 ?auto_552401 ) ) ( not ( = ?auto_552396 ?auto_552402 ) ) ( not ( = ?auto_552396 ?auto_552403 ) ) ( not ( = ?auto_552397 ?auto_552398 ) ) ( not ( = ?auto_552397 ?auto_552399 ) ) ( not ( = ?auto_552397 ?auto_552400 ) ) ( not ( = ?auto_552397 ?auto_552401 ) ) ( not ( = ?auto_552397 ?auto_552402 ) ) ( not ( = ?auto_552397 ?auto_552403 ) ) ( not ( = ?auto_552398 ?auto_552399 ) ) ( not ( = ?auto_552398 ?auto_552400 ) ) ( not ( = ?auto_552398 ?auto_552401 ) ) ( not ( = ?auto_552398 ?auto_552402 ) ) ( not ( = ?auto_552398 ?auto_552403 ) ) ( not ( = ?auto_552399 ?auto_552400 ) ) ( not ( = ?auto_552399 ?auto_552401 ) ) ( not ( = ?auto_552399 ?auto_552402 ) ) ( not ( = ?auto_552399 ?auto_552403 ) ) ( not ( = ?auto_552400 ?auto_552401 ) ) ( not ( = ?auto_552400 ?auto_552402 ) ) ( not ( = ?auto_552400 ?auto_552403 ) ) ( not ( = ?auto_552401 ?auto_552402 ) ) ( not ( = ?auto_552401 ?auto_552403 ) ) ( not ( = ?auto_552402 ?auto_552403 ) ) ( ON ?auto_552402 ?auto_552403 ) ( ON ?auto_552401 ?auto_552402 ) ( ON ?auto_552400 ?auto_552401 ) ( ON ?auto_552399 ?auto_552400 ) ( ON ?auto_552398 ?auto_552399 ) ( ON ?auto_552397 ?auto_552398 ) ( ON ?auto_552396 ?auto_552397 ) ( ON ?auto_552395 ?auto_552396 ) ( ON ?auto_552394 ?auto_552395 ) ( CLEAR ?auto_552392 ) ( ON ?auto_552393 ?auto_552394 ) ( CLEAR ?auto_552393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_552388 ?auto_552389 ?auto_552390 ?auto_552391 ?auto_552392 ?auto_552393 )
      ( MAKE-16PILE ?auto_552388 ?auto_552389 ?auto_552390 ?auto_552391 ?auto_552392 ?auto_552393 ?auto_552394 ?auto_552395 ?auto_552396 ?auto_552397 ?auto_552398 ?auto_552399 ?auto_552400 ?auto_552401 ?auto_552402 ?auto_552403 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552420 - BLOCK
      ?auto_552421 - BLOCK
      ?auto_552422 - BLOCK
      ?auto_552423 - BLOCK
      ?auto_552424 - BLOCK
      ?auto_552425 - BLOCK
      ?auto_552426 - BLOCK
      ?auto_552427 - BLOCK
      ?auto_552428 - BLOCK
      ?auto_552429 - BLOCK
      ?auto_552430 - BLOCK
      ?auto_552431 - BLOCK
      ?auto_552432 - BLOCK
      ?auto_552433 - BLOCK
      ?auto_552434 - BLOCK
      ?auto_552435 - BLOCK
    )
    :vars
    (
      ?auto_552436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552435 ?auto_552436 ) ( ON-TABLE ?auto_552420 ) ( ON ?auto_552421 ?auto_552420 ) ( ON ?auto_552422 ?auto_552421 ) ( ON ?auto_552423 ?auto_552422 ) ( not ( = ?auto_552420 ?auto_552421 ) ) ( not ( = ?auto_552420 ?auto_552422 ) ) ( not ( = ?auto_552420 ?auto_552423 ) ) ( not ( = ?auto_552420 ?auto_552424 ) ) ( not ( = ?auto_552420 ?auto_552425 ) ) ( not ( = ?auto_552420 ?auto_552426 ) ) ( not ( = ?auto_552420 ?auto_552427 ) ) ( not ( = ?auto_552420 ?auto_552428 ) ) ( not ( = ?auto_552420 ?auto_552429 ) ) ( not ( = ?auto_552420 ?auto_552430 ) ) ( not ( = ?auto_552420 ?auto_552431 ) ) ( not ( = ?auto_552420 ?auto_552432 ) ) ( not ( = ?auto_552420 ?auto_552433 ) ) ( not ( = ?auto_552420 ?auto_552434 ) ) ( not ( = ?auto_552420 ?auto_552435 ) ) ( not ( = ?auto_552420 ?auto_552436 ) ) ( not ( = ?auto_552421 ?auto_552422 ) ) ( not ( = ?auto_552421 ?auto_552423 ) ) ( not ( = ?auto_552421 ?auto_552424 ) ) ( not ( = ?auto_552421 ?auto_552425 ) ) ( not ( = ?auto_552421 ?auto_552426 ) ) ( not ( = ?auto_552421 ?auto_552427 ) ) ( not ( = ?auto_552421 ?auto_552428 ) ) ( not ( = ?auto_552421 ?auto_552429 ) ) ( not ( = ?auto_552421 ?auto_552430 ) ) ( not ( = ?auto_552421 ?auto_552431 ) ) ( not ( = ?auto_552421 ?auto_552432 ) ) ( not ( = ?auto_552421 ?auto_552433 ) ) ( not ( = ?auto_552421 ?auto_552434 ) ) ( not ( = ?auto_552421 ?auto_552435 ) ) ( not ( = ?auto_552421 ?auto_552436 ) ) ( not ( = ?auto_552422 ?auto_552423 ) ) ( not ( = ?auto_552422 ?auto_552424 ) ) ( not ( = ?auto_552422 ?auto_552425 ) ) ( not ( = ?auto_552422 ?auto_552426 ) ) ( not ( = ?auto_552422 ?auto_552427 ) ) ( not ( = ?auto_552422 ?auto_552428 ) ) ( not ( = ?auto_552422 ?auto_552429 ) ) ( not ( = ?auto_552422 ?auto_552430 ) ) ( not ( = ?auto_552422 ?auto_552431 ) ) ( not ( = ?auto_552422 ?auto_552432 ) ) ( not ( = ?auto_552422 ?auto_552433 ) ) ( not ( = ?auto_552422 ?auto_552434 ) ) ( not ( = ?auto_552422 ?auto_552435 ) ) ( not ( = ?auto_552422 ?auto_552436 ) ) ( not ( = ?auto_552423 ?auto_552424 ) ) ( not ( = ?auto_552423 ?auto_552425 ) ) ( not ( = ?auto_552423 ?auto_552426 ) ) ( not ( = ?auto_552423 ?auto_552427 ) ) ( not ( = ?auto_552423 ?auto_552428 ) ) ( not ( = ?auto_552423 ?auto_552429 ) ) ( not ( = ?auto_552423 ?auto_552430 ) ) ( not ( = ?auto_552423 ?auto_552431 ) ) ( not ( = ?auto_552423 ?auto_552432 ) ) ( not ( = ?auto_552423 ?auto_552433 ) ) ( not ( = ?auto_552423 ?auto_552434 ) ) ( not ( = ?auto_552423 ?auto_552435 ) ) ( not ( = ?auto_552423 ?auto_552436 ) ) ( not ( = ?auto_552424 ?auto_552425 ) ) ( not ( = ?auto_552424 ?auto_552426 ) ) ( not ( = ?auto_552424 ?auto_552427 ) ) ( not ( = ?auto_552424 ?auto_552428 ) ) ( not ( = ?auto_552424 ?auto_552429 ) ) ( not ( = ?auto_552424 ?auto_552430 ) ) ( not ( = ?auto_552424 ?auto_552431 ) ) ( not ( = ?auto_552424 ?auto_552432 ) ) ( not ( = ?auto_552424 ?auto_552433 ) ) ( not ( = ?auto_552424 ?auto_552434 ) ) ( not ( = ?auto_552424 ?auto_552435 ) ) ( not ( = ?auto_552424 ?auto_552436 ) ) ( not ( = ?auto_552425 ?auto_552426 ) ) ( not ( = ?auto_552425 ?auto_552427 ) ) ( not ( = ?auto_552425 ?auto_552428 ) ) ( not ( = ?auto_552425 ?auto_552429 ) ) ( not ( = ?auto_552425 ?auto_552430 ) ) ( not ( = ?auto_552425 ?auto_552431 ) ) ( not ( = ?auto_552425 ?auto_552432 ) ) ( not ( = ?auto_552425 ?auto_552433 ) ) ( not ( = ?auto_552425 ?auto_552434 ) ) ( not ( = ?auto_552425 ?auto_552435 ) ) ( not ( = ?auto_552425 ?auto_552436 ) ) ( not ( = ?auto_552426 ?auto_552427 ) ) ( not ( = ?auto_552426 ?auto_552428 ) ) ( not ( = ?auto_552426 ?auto_552429 ) ) ( not ( = ?auto_552426 ?auto_552430 ) ) ( not ( = ?auto_552426 ?auto_552431 ) ) ( not ( = ?auto_552426 ?auto_552432 ) ) ( not ( = ?auto_552426 ?auto_552433 ) ) ( not ( = ?auto_552426 ?auto_552434 ) ) ( not ( = ?auto_552426 ?auto_552435 ) ) ( not ( = ?auto_552426 ?auto_552436 ) ) ( not ( = ?auto_552427 ?auto_552428 ) ) ( not ( = ?auto_552427 ?auto_552429 ) ) ( not ( = ?auto_552427 ?auto_552430 ) ) ( not ( = ?auto_552427 ?auto_552431 ) ) ( not ( = ?auto_552427 ?auto_552432 ) ) ( not ( = ?auto_552427 ?auto_552433 ) ) ( not ( = ?auto_552427 ?auto_552434 ) ) ( not ( = ?auto_552427 ?auto_552435 ) ) ( not ( = ?auto_552427 ?auto_552436 ) ) ( not ( = ?auto_552428 ?auto_552429 ) ) ( not ( = ?auto_552428 ?auto_552430 ) ) ( not ( = ?auto_552428 ?auto_552431 ) ) ( not ( = ?auto_552428 ?auto_552432 ) ) ( not ( = ?auto_552428 ?auto_552433 ) ) ( not ( = ?auto_552428 ?auto_552434 ) ) ( not ( = ?auto_552428 ?auto_552435 ) ) ( not ( = ?auto_552428 ?auto_552436 ) ) ( not ( = ?auto_552429 ?auto_552430 ) ) ( not ( = ?auto_552429 ?auto_552431 ) ) ( not ( = ?auto_552429 ?auto_552432 ) ) ( not ( = ?auto_552429 ?auto_552433 ) ) ( not ( = ?auto_552429 ?auto_552434 ) ) ( not ( = ?auto_552429 ?auto_552435 ) ) ( not ( = ?auto_552429 ?auto_552436 ) ) ( not ( = ?auto_552430 ?auto_552431 ) ) ( not ( = ?auto_552430 ?auto_552432 ) ) ( not ( = ?auto_552430 ?auto_552433 ) ) ( not ( = ?auto_552430 ?auto_552434 ) ) ( not ( = ?auto_552430 ?auto_552435 ) ) ( not ( = ?auto_552430 ?auto_552436 ) ) ( not ( = ?auto_552431 ?auto_552432 ) ) ( not ( = ?auto_552431 ?auto_552433 ) ) ( not ( = ?auto_552431 ?auto_552434 ) ) ( not ( = ?auto_552431 ?auto_552435 ) ) ( not ( = ?auto_552431 ?auto_552436 ) ) ( not ( = ?auto_552432 ?auto_552433 ) ) ( not ( = ?auto_552432 ?auto_552434 ) ) ( not ( = ?auto_552432 ?auto_552435 ) ) ( not ( = ?auto_552432 ?auto_552436 ) ) ( not ( = ?auto_552433 ?auto_552434 ) ) ( not ( = ?auto_552433 ?auto_552435 ) ) ( not ( = ?auto_552433 ?auto_552436 ) ) ( not ( = ?auto_552434 ?auto_552435 ) ) ( not ( = ?auto_552434 ?auto_552436 ) ) ( not ( = ?auto_552435 ?auto_552436 ) ) ( ON ?auto_552434 ?auto_552435 ) ( ON ?auto_552433 ?auto_552434 ) ( ON ?auto_552432 ?auto_552433 ) ( ON ?auto_552431 ?auto_552432 ) ( ON ?auto_552430 ?auto_552431 ) ( ON ?auto_552429 ?auto_552430 ) ( ON ?auto_552428 ?auto_552429 ) ( ON ?auto_552427 ?auto_552428 ) ( ON ?auto_552426 ?auto_552427 ) ( ON ?auto_552425 ?auto_552426 ) ( CLEAR ?auto_552423 ) ( ON ?auto_552424 ?auto_552425 ) ( CLEAR ?auto_552424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_552420 ?auto_552421 ?auto_552422 ?auto_552423 ?auto_552424 )
      ( MAKE-16PILE ?auto_552420 ?auto_552421 ?auto_552422 ?auto_552423 ?auto_552424 ?auto_552425 ?auto_552426 ?auto_552427 ?auto_552428 ?auto_552429 ?auto_552430 ?auto_552431 ?auto_552432 ?auto_552433 ?auto_552434 ?auto_552435 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552453 - BLOCK
      ?auto_552454 - BLOCK
      ?auto_552455 - BLOCK
      ?auto_552456 - BLOCK
      ?auto_552457 - BLOCK
      ?auto_552458 - BLOCK
      ?auto_552459 - BLOCK
      ?auto_552460 - BLOCK
      ?auto_552461 - BLOCK
      ?auto_552462 - BLOCK
      ?auto_552463 - BLOCK
      ?auto_552464 - BLOCK
      ?auto_552465 - BLOCK
      ?auto_552466 - BLOCK
      ?auto_552467 - BLOCK
      ?auto_552468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_552468 ) ( ON-TABLE ?auto_552453 ) ( ON ?auto_552454 ?auto_552453 ) ( ON ?auto_552455 ?auto_552454 ) ( ON ?auto_552456 ?auto_552455 ) ( not ( = ?auto_552453 ?auto_552454 ) ) ( not ( = ?auto_552453 ?auto_552455 ) ) ( not ( = ?auto_552453 ?auto_552456 ) ) ( not ( = ?auto_552453 ?auto_552457 ) ) ( not ( = ?auto_552453 ?auto_552458 ) ) ( not ( = ?auto_552453 ?auto_552459 ) ) ( not ( = ?auto_552453 ?auto_552460 ) ) ( not ( = ?auto_552453 ?auto_552461 ) ) ( not ( = ?auto_552453 ?auto_552462 ) ) ( not ( = ?auto_552453 ?auto_552463 ) ) ( not ( = ?auto_552453 ?auto_552464 ) ) ( not ( = ?auto_552453 ?auto_552465 ) ) ( not ( = ?auto_552453 ?auto_552466 ) ) ( not ( = ?auto_552453 ?auto_552467 ) ) ( not ( = ?auto_552453 ?auto_552468 ) ) ( not ( = ?auto_552454 ?auto_552455 ) ) ( not ( = ?auto_552454 ?auto_552456 ) ) ( not ( = ?auto_552454 ?auto_552457 ) ) ( not ( = ?auto_552454 ?auto_552458 ) ) ( not ( = ?auto_552454 ?auto_552459 ) ) ( not ( = ?auto_552454 ?auto_552460 ) ) ( not ( = ?auto_552454 ?auto_552461 ) ) ( not ( = ?auto_552454 ?auto_552462 ) ) ( not ( = ?auto_552454 ?auto_552463 ) ) ( not ( = ?auto_552454 ?auto_552464 ) ) ( not ( = ?auto_552454 ?auto_552465 ) ) ( not ( = ?auto_552454 ?auto_552466 ) ) ( not ( = ?auto_552454 ?auto_552467 ) ) ( not ( = ?auto_552454 ?auto_552468 ) ) ( not ( = ?auto_552455 ?auto_552456 ) ) ( not ( = ?auto_552455 ?auto_552457 ) ) ( not ( = ?auto_552455 ?auto_552458 ) ) ( not ( = ?auto_552455 ?auto_552459 ) ) ( not ( = ?auto_552455 ?auto_552460 ) ) ( not ( = ?auto_552455 ?auto_552461 ) ) ( not ( = ?auto_552455 ?auto_552462 ) ) ( not ( = ?auto_552455 ?auto_552463 ) ) ( not ( = ?auto_552455 ?auto_552464 ) ) ( not ( = ?auto_552455 ?auto_552465 ) ) ( not ( = ?auto_552455 ?auto_552466 ) ) ( not ( = ?auto_552455 ?auto_552467 ) ) ( not ( = ?auto_552455 ?auto_552468 ) ) ( not ( = ?auto_552456 ?auto_552457 ) ) ( not ( = ?auto_552456 ?auto_552458 ) ) ( not ( = ?auto_552456 ?auto_552459 ) ) ( not ( = ?auto_552456 ?auto_552460 ) ) ( not ( = ?auto_552456 ?auto_552461 ) ) ( not ( = ?auto_552456 ?auto_552462 ) ) ( not ( = ?auto_552456 ?auto_552463 ) ) ( not ( = ?auto_552456 ?auto_552464 ) ) ( not ( = ?auto_552456 ?auto_552465 ) ) ( not ( = ?auto_552456 ?auto_552466 ) ) ( not ( = ?auto_552456 ?auto_552467 ) ) ( not ( = ?auto_552456 ?auto_552468 ) ) ( not ( = ?auto_552457 ?auto_552458 ) ) ( not ( = ?auto_552457 ?auto_552459 ) ) ( not ( = ?auto_552457 ?auto_552460 ) ) ( not ( = ?auto_552457 ?auto_552461 ) ) ( not ( = ?auto_552457 ?auto_552462 ) ) ( not ( = ?auto_552457 ?auto_552463 ) ) ( not ( = ?auto_552457 ?auto_552464 ) ) ( not ( = ?auto_552457 ?auto_552465 ) ) ( not ( = ?auto_552457 ?auto_552466 ) ) ( not ( = ?auto_552457 ?auto_552467 ) ) ( not ( = ?auto_552457 ?auto_552468 ) ) ( not ( = ?auto_552458 ?auto_552459 ) ) ( not ( = ?auto_552458 ?auto_552460 ) ) ( not ( = ?auto_552458 ?auto_552461 ) ) ( not ( = ?auto_552458 ?auto_552462 ) ) ( not ( = ?auto_552458 ?auto_552463 ) ) ( not ( = ?auto_552458 ?auto_552464 ) ) ( not ( = ?auto_552458 ?auto_552465 ) ) ( not ( = ?auto_552458 ?auto_552466 ) ) ( not ( = ?auto_552458 ?auto_552467 ) ) ( not ( = ?auto_552458 ?auto_552468 ) ) ( not ( = ?auto_552459 ?auto_552460 ) ) ( not ( = ?auto_552459 ?auto_552461 ) ) ( not ( = ?auto_552459 ?auto_552462 ) ) ( not ( = ?auto_552459 ?auto_552463 ) ) ( not ( = ?auto_552459 ?auto_552464 ) ) ( not ( = ?auto_552459 ?auto_552465 ) ) ( not ( = ?auto_552459 ?auto_552466 ) ) ( not ( = ?auto_552459 ?auto_552467 ) ) ( not ( = ?auto_552459 ?auto_552468 ) ) ( not ( = ?auto_552460 ?auto_552461 ) ) ( not ( = ?auto_552460 ?auto_552462 ) ) ( not ( = ?auto_552460 ?auto_552463 ) ) ( not ( = ?auto_552460 ?auto_552464 ) ) ( not ( = ?auto_552460 ?auto_552465 ) ) ( not ( = ?auto_552460 ?auto_552466 ) ) ( not ( = ?auto_552460 ?auto_552467 ) ) ( not ( = ?auto_552460 ?auto_552468 ) ) ( not ( = ?auto_552461 ?auto_552462 ) ) ( not ( = ?auto_552461 ?auto_552463 ) ) ( not ( = ?auto_552461 ?auto_552464 ) ) ( not ( = ?auto_552461 ?auto_552465 ) ) ( not ( = ?auto_552461 ?auto_552466 ) ) ( not ( = ?auto_552461 ?auto_552467 ) ) ( not ( = ?auto_552461 ?auto_552468 ) ) ( not ( = ?auto_552462 ?auto_552463 ) ) ( not ( = ?auto_552462 ?auto_552464 ) ) ( not ( = ?auto_552462 ?auto_552465 ) ) ( not ( = ?auto_552462 ?auto_552466 ) ) ( not ( = ?auto_552462 ?auto_552467 ) ) ( not ( = ?auto_552462 ?auto_552468 ) ) ( not ( = ?auto_552463 ?auto_552464 ) ) ( not ( = ?auto_552463 ?auto_552465 ) ) ( not ( = ?auto_552463 ?auto_552466 ) ) ( not ( = ?auto_552463 ?auto_552467 ) ) ( not ( = ?auto_552463 ?auto_552468 ) ) ( not ( = ?auto_552464 ?auto_552465 ) ) ( not ( = ?auto_552464 ?auto_552466 ) ) ( not ( = ?auto_552464 ?auto_552467 ) ) ( not ( = ?auto_552464 ?auto_552468 ) ) ( not ( = ?auto_552465 ?auto_552466 ) ) ( not ( = ?auto_552465 ?auto_552467 ) ) ( not ( = ?auto_552465 ?auto_552468 ) ) ( not ( = ?auto_552466 ?auto_552467 ) ) ( not ( = ?auto_552466 ?auto_552468 ) ) ( not ( = ?auto_552467 ?auto_552468 ) ) ( ON ?auto_552467 ?auto_552468 ) ( ON ?auto_552466 ?auto_552467 ) ( ON ?auto_552465 ?auto_552466 ) ( ON ?auto_552464 ?auto_552465 ) ( ON ?auto_552463 ?auto_552464 ) ( ON ?auto_552462 ?auto_552463 ) ( ON ?auto_552461 ?auto_552462 ) ( ON ?auto_552460 ?auto_552461 ) ( ON ?auto_552459 ?auto_552460 ) ( ON ?auto_552458 ?auto_552459 ) ( CLEAR ?auto_552456 ) ( ON ?auto_552457 ?auto_552458 ) ( CLEAR ?auto_552457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_552453 ?auto_552454 ?auto_552455 ?auto_552456 ?auto_552457 )
      ( MAKE-16PILE ?auto_552453 ?auto_552454 ?auto_552455 ?auto_552456 ?auto_552457 ?auto_552458 ?auto_552459 ?auto_552460 ?auto_552461 ?auto_552462 ?auto_552463 ?auto_552464 ?auto_552465 ?auto_552466 ?auto_552467 ?auto_552468 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552485 - BLOCK
      ?auto_552486 - BLOCK
      ?auto_552487 - BLOCK
      ?auto_552488 - BLOCK
      ?auto_552489 - BLOCK
      ?auto_552490 - BLOCK
      ?auto_552491 - BLOCK
      ?auto_552492 - BLOCK
      ?auto_552493 - BLOCK
      ?auto_552494 - BLOCK
      ?auto_552495 - BLOCK
      ?auto_552496 - BLOCK
      ?auto_552497 - BLOCK
      ?auto_552498 - BLOCK
      ?auto_552499 - BLOCK
      ?auto_552500 - BLOCK
    )
    :vars
    (
      ?auto_552501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552500 ?auto_552501 ) ( ON-TABLE ?auto_552485 ) ( ON ?auto_552486 ?auto_552485 ) ( ON ?auto_552487 ?auto_552486 ) ( not ( = ?auto_552485 ?auto_552486 ) ) ( not ( = ?auto_552485 ?auto_552487 ) ) ( not ( = ?auto_552485 ?auto_552488 ) ) ( not ( = ?auto_552485 ?auto_552489 ) ) ( not ( = ?auto_552485 ?auto_552490 ) ) ( not ( = ?auto_552485 ?auto_552491 ) ) ( not ( = ?auto_552485 ?auto_552492 ) ) ( not ( = ?auto_552485 ?auto_552493 ) ) ( not ( = ?auto_552485 ?auto_552494 ) ) ( not ( = ?auto_552485 ?auto_552495 ) ) ( not ( = ?auto_552485 ?auto_552496 ) ) ( not ( = ?auto_552485 ?auto_552497 ) ) ( not ( = ?auto_552485 ?auto_552498 ) ) ( not ( = ?auto_552485 ?auto_552499 ) ) ( not ( = ?auto_552485 ?auto_552500 ) ) ( not ( = ?auto_552485 ?auto_552501 ) ) ( not ( = ?auto_552486 ?auto_552487 ) ) ( not ( = ?auto_552486 ?auto_552488 ) ) ( not ( = ?auto_552486 ?auto_552489 ) ) ( not ( = ?auto_552486 ?auto_552490 ) ) ( not ( = ?auto_552486 ?auto_552491 ) ) ( not ( = ?auto_552486 ?auto_552492 ) ) ( not ( = ?auto_552486 ?auto_552493 ) ) ( not ( = ?auto_552486 ?auto_552494 ) ) ( not ( = ?auto_552486 ?auto_552495 ) ) ( not ( = ?auto_552486 ?auto_552496 ) ) ( not ( = ?auto_552486 ?auto_552497 ) ) ( not ( = ?auto_552486 ?auto_552498 ) ) ( not ( = ?auto_552486 ?auto_552499 ) ) ( not ( = ?auto_552486 ?auto_552500 ) ) ( not ( = ?auto_552486 ?auto_552501 ) ) ( not ( = ?auto_552487 ?auto_552488 ) ) ( not ( = ?auto_552487 ?auto_552489 ) ) ( not ( = ?auto_552487 ?auto_552490 ) ) ( not ( = ?auto_552487 ?auto_552491 ) ) ( not ( = ?auto_552487 ?auto_552492 ) ) ( not ( = ?auto_552487 ?auto_552493 ) ) ( not ( = ?auto_552487 ?auto_552494 ) ) ( not ( = ?auto_552487 ?auto_552495 ) ) ( not ( = ?auto_552487 ?auto_552496 ) ) ( not ( = ?auto_552487 ?auto_552497 ) ) ( not ( = ?auto_552487 ?auto_552498 ) ) ( not ( = ?auto_552487 ?auto_552499 ) ) ( not ( = ?auto_552487 ?auto_552500 ) ) ( not ( = ?auto_552487 ?auto_552501 ) ) ( not ( = ?auto_552488 ?auto_552489 ) ) ( not ( = ?auto_552488 ?auto_552490 ) ) ( not ( = ?auto_552488 ?auto_552491 ) ) ( not ( = ?auto_552488 ?auto_552492 ) ) ( not ( = ?auto_552488 ?auto_552493 ) ) ( not ( = ?auto_552488 ?auto_552494 ) ) ( not ( = ?auto_552488 ?auto_552495 ) ) ( not ( = ?auto_552488 ?auto_552496 ) ) ( not ( = ?auto_552488 ?auto_552497 ) ) ( not ( = ?auto_552488 ?auto_552498 ) ) ( not ( = ?auto_552488 ?auto_552499 ) ) ( not ( = ?auto_552488 ?auto_552500 ) ) ( not ( = ?auto_552488 ?auto_552501 ) ) ( not ( = ?auto_552489 ?auto_552490 ) ) ( not ( = ?auto_552489 ?auto_552491 ) ) ( not ( = ?auto_552489 ?auto_552492 ) ) ( not ( = ?auto_552489 ?auto_552493 ) ) ( not ( = ?auto_552489 ?auto_552494 ) ) ( not ( = ?auto_552489 ?auto_552495 ) ) ( not ( = ?auto_552489 ?auto_552496 ) ) ( not ( = ?auto_552489 ?auto_552497 ) ) ( not ( = ?auto_552489 ?auto_552498 ) ) ( not ( = ?auto_552489 ?auto_552499 ) ) ( not ( = ?auto_552489 ?auto_552500 ) ) ( not ( = ?auto_552489 ?auto_552501 ) ) ( not ( = ?auto_552490 ?auto_552491 ) ) ( not ( = ?auto_552490 ?auto_552492 ) ) ( not ( = ?auto_552490 ?auto_552493 ) ) ( not ( = ?auto_552490 ?auto_552494 ) ) ( not ( = ?auto_552490 ?auto_552495 ) ) ( not ( = ?auto_552490 ?auto_552496 ) ) ( not ( = ?auto_552490 ?auto_552497 ) ) ( not ( = ?auto_552490 ?auto_552498 ) ) ( not ( = ?auto_552490 ?auto_552499 ) ) ( not ( = ?auto_552490 ?auto_552500 ) ) ( not ( = ?auto_552490 ?auto_552501 ) ) ( not ( = ?auto_552491 ?auto_552492 ) ) ( not ( = ?auto_552491 ?auto_552493 ) ) ( not ( = ?auto_552491 ?auto_552494 ) ) ( not ( = ?auto_552491 ?auto_552495 ) ) ( not ( = ?auto_552491 ?auto_552496 ) ) ( not ( = ?auto_552491 ?auto_552497 ) ) ( not ( = ?auto_552491 ?auto_552498 ) ) ( not ( = ?auto_552491 ?auto_552499 ) ) ( not ( = ?auto_552491 ?auto_552500 ) ) ( not ( = ?auto_552491 ?auto_552501 ) ) ( not ( = ?auto_552492 ?auto_552493 ) ) ( not ( = ?auto_552492 ?auto_552494 ) ) ( not ( = ?auto_552492 ?auto_552495 ) ) ( not ( = ?auto_552492 ?auto_552496 ) ) ( not ( = ?auto_552492 ?auto_552497 ) ) ( not ( = ?auto_552492 ?auto_552498 ) ) ( not ( = ?auto_552492 ?auto_552499 ) ) ( not ( = ?auto_552492 ?auto_552500 ) ) ( not ( = ?auto_552492 ?auto_552501 ) ) ( not ( = ?auto_552493 ?auto_552494 ) ) ( not ( = ?auto_552493 ?auto_552495 ) ) ( not ( = ?auto_552493 ?auto_552496 ) ) ( not ( = ?auto_552493 ?auto_552497 ) ) ( not ( = ?auto_552493 ?auto_552498 ) ) ( not ( = ?auto_552493 ?auto_552499 ) ) ( not ( = ?auto_552493 ?auto_552500 ) ) ( not ( = ?auto_552493 ?auto_552501 ) ) ( not ( = ?auto_552494 ?auto_552495 ) ) ( not ( = ?auto_552494 ?auto_552496 ) ) ( not ( = ?auto_552494 ?auto_552497 ) ) ( not ( = ?auto_552494 ?auto_552498 ) ) ( not ( = ?auto_552494 ?auto_552499 ) ) ( not ( = ?auto_552494 ?auto_552500 ) ) ( not ( = ?auto_552494 ?auto_552501 ) ) ( not ( = ?auto_552495 ?auto_552496 ) ) ( not ( = ?auto_552495 ?auto_552497 ) ) ( not ( = ?auto_552495 ?auto_552498 ) ) ( not ( = ?auto_552495 ?auto_552499 ) ) ( not ( = ?auto_552495 ?auto_552500 ) ) ( not ( = ?auto_552495 ?auto_552501 ) ) ( not ( = ?auto_552496 ?auto_552497 ) ) ( not ( = ?auto_552496 ?auto_552498 ) ) ( not ( = ?auto_552496 ?auto_552499 ) ) ( not ( = ?auto_552496 ?auto_552500 ) ) ( not ( = ?auto_552496 ?auto_552501 ) ) ( not ( = ?auto_552497 ?auto_552498 ) ) ( not ( = ?auto_552497 ?auto_552499 ) ) ( not ( = ?auto_552497 ?auto_552500 ) ) ( not ( = ?auto_552497 ?auto_552501 ) ) ( not ( = ?auto_552498 ?auto_552499 ) ) ( not ( = ?auto_552498 ?auto_552500 ) ) ( not ( = ?auto_552498 ?auto_552501 ) ) ( not ( = ?auto_552499 ?auto_552500 ) ) ( not ( = ?auto_552499 ?auto_552501 ) ) ( not ( = ?auto_552500 ?auto_552501 ) ) ( ON ?auto_552499 ?auto_552500 ) ( ON ?auto_552498 ?auto_552499 ) ( ON ?auto_552497 ?auto_552498 ) ( ON ?auto_552496 ?auto_552497 ) ( ON ?auto_552495 ?auto_552496 ) ( ON ?auto_552494 ?auto_552495 ) ( ON ?auto_552493 ?auto_552494 ) ( ON ?auto_552492 ?auto_552493 ) ( ON ?auto_552491 ?auto_552492 ) ( ON ?auto_552490 ?auto_552491 ) ( ON ?auto_552489 ?auto_552490 ) ( CLEAR ?auto_552487 ) ( ON ?auto_552488 ?auto_552489 ) ( CLEAR ?auto_552488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_552485 ?auto_552486 ?auto_552487 ?auto_552488 )
      ( MAKE-16PILE ?auto_552485 ?auto_552486 ?auto_552487 ?auto_552488 ?auto_552489 ?auto_552490 ?auto_552491 ?auto_552492 ?auto_552493 ?auto_552494 ?auto_552495 ?auto_552496 ?auto_552497 ?auto_552498 ?auto_552499 ?auto_552500 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552518 - BLOCK
      ?auto_552519 - BLOCK
      ?auto_552520 - BLOCK
      ?auto_552521 - BLOCK
      ?auto_552522 - BLOCK
      ?auto_552523 - BLOCK
      ?auto_552524 - BLOCK
      ?auto_552525 - BLOCK
      ?auto_552526 - BLOCK
      ?auto_552527 - BLOCK
      ?auto_552528 - BLOCK
      ?auto_552529 - BLOCK
      ?auto_552530 - BLOCK
      ?auto_552531 - BLOCK
      ?auto_552532 - BLOCK
      ?auto_552533 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_552533 ) ( ON-TABLE ?auto_552518 ) ( ON ?auto_552519 ?auto_552518 ) ( ON ?auto_552520 ?auto_552519 ) ( not ( = ?auto_552518 ?auto_552519 ) ) ( not ( = ?auto_552518 ?auto_552520 ) ) ( not ( = ?auto_552518 ?auto_552521 ) ) ( not ( = ?auto_552518 ?auto_552522 ) ) ( not ( = ?auto_552518 ?auto_552523 ) ) ( not ( = ?auto_552518 ?auto_552524 ) ) ( not ( = ?auto_552518 ?auto_552525 ) ) ( not ( = ?auto_552518 ?auto_552526 ) ) ( not ( = ?auto_552518 ?auto_552527 ) ) ( not ( = ?auto_552518 ?auto_552528 ) ) ( not ( = ?auto_552518 ?auto_552529 ) ) ( not ( = ?auto_552518 ?auto_552530 ) ) ( not ( = ?auto_552518 ?auto_552531 ) ) ( not ( = ?auto_552518 ?auto_552532 ) ) ( not ( = ?auto_552518 ?auto_552533 ) ) ( not ( = ?auto_552519 ?auto_552520 ) ) ( not ( = ?auto_552519 ?auto_552521 ) ) ( not ( = ?auto_552519 ?auto_552522 ) ) ( not ( = ?auto_552519 ?auto_552523 ) ) ( not ( = ?auto_552519 ?auto_552524 ) ) ( not ( = ?auto_552519 ?auto_552525 ) ) ( not ( = ?auto_552519 ?auto_552526 ) ) ( not ( = ?auto_552519 ?auto_552527 ) ) ( not ( = ?auto_552519 ?auto_552528 ) ) ( not ( = ?auto_552519 ?auto_552529 ) ) ( not ( = ?auto_552519 ?auto_552530 ) ) ( not ( = ?auto_552519 ?auto_552531 ) ) ( not ( = ?auto_552519 ?auto_552532 ) ) ( not ( = ?auto_552519 ?auto_552533 ) ) ( not ( = ?auto_552520 ?auto_552521 ) ) ( not ( = ?auto_552520 ?auto_552522 ) ) ( not ( = ?auto_552520 ?auto_552523 ) ) ( not ( = ?auto_552520 ?auto_552524 ) ) ( not ( = ?auto_552520 ?auto_552525 ) ) ( not ( = ?auto_552520 ?auto_552526 ) ) ( not ( = ?auto_552520 ?auto_552527 ) ) ( not ( = ?auto_552520 ?auto_552528 ) ) ( not ( = ?auto_552520 ?auto_552529 ) ) ( not ( = ?auto_552520 ?auto_552530 ) ) ( not ( = ?auto_552520 ?auto_552531 ) ) ( not ( = ?auto_552520 ?auto_552532 ) ) ( not ( = ?auto_552520 ?auto_552533 ) ) ( not ( = ?auto_552521 ?auto_552522 ) ) ( not ( = ?auto_552521 ?auto_552523 ) ) ( not ( = ?auto_552521 ?auto_552524 ) ) ( not ( = ?auto_552521 ?auto_552525 ) ) ( not ( = ?auto_552521 ?auto_552526 ) ) ( not ( = ?auto_552521 ?auto_552527 ) ) ( not ( = ?auto_552521 ?auto_552528 ) ) ( not ( = ?auto_552521 ?auto_552529 ) ) ( not ( = ?auto_552521 ?auto_552530 ) ) ( not ( = ?auto_552521 ?auto_552531 ) ) ( not ( = ?auto_552521 ?auto_552532 ) ) ( not ( = ?auto_552521 ?auto_552533 ) ) ( not ( = ?auto_552522 ?auto_552523 ) ) ( not ( = ?auto_552522 ?auto_552524 ) ) ( not ( = ?auto_552522 ?auto_552525 ) ) ( not ( = ?auto_552522 ?auto_552526 ) ) ( not ( = ?auto_552522 ?auto_552527 ) ) ( not ( = ?auto_552522 ?auto_552528 ) ) ( not ( = ?auto_552522 ?auto_552529 ) ) ( not ( = ?auto_552522 ?auto_552530 ) ) ( not ( = ?auto_552522 ?auto_552531 ) ) ( not ( = ?auto_552522 ?auto_552532 ) ) ( not ( = ?auto_552522 ?auto_552533 ) ) ( not ( = ?auto_552523 ?auto_552524 ) ) ( not ( = ?auto_552523 ?auto_552525 ) ) ( not ( = ?auto_552523 ?auto_552526 ) ) ( not ( = ?auto_552523 ?auto_552527 ) ) ( not ( = ?auto_552523 ?auto_552528 ) ) ( not ( = ?auto_552523 ?auto_552529 ) ) ( not ( = ?auto_552523 ?auto_552530 ) ) ( not ( = ?auto_552523 ?auto_552531 ) ) ( not ( = ?auto_552523 ?auto_552532 ) ) ( not ( = ?auto_552523 ?auto_552533 ) ) ( not ( = ?auto_552524 ?auto_552525 ) ) ( not ( = ?auto_552524 ?auto_552526 ) ) ( not ( = ?auto_552524 ?auto_552527 ) ) ( not ( = ?auto_552524 ?auto_552528 ) ) ( not ( = ?auto_552524 ?auto_552529 ) ) ( not ( = ?auto_552524 ?auto_552530 ) ) ( not ( = ?auto_552524 ?auto_552531 ) ) ( not ( = ?auto_552524 ?auto_552532 ) ) ( not ( = ?auto_552524 ?auto_552533 ) ) ( not ( = ?auto_552525 ?auto_552526 ) ) ( not ( = ?auto_552525 ?auto_552527 ) ) ( not ( = ?auto_552525 ?auto_552528 ) ) ( not ( = ?auto_552525 ?auto_552529 ) ) ( not ( = ?auto_552525 ?auto_552530 ) ) ( not ( = ?auto_552525 ?auto_552531 ) ) ( not ( = ?auto_552525 ?auto_552532 ) ) ( not ( = ?auto_552525 ?auto_552533 ) ) ( not ( = ?auto_552526 ?auto_552527 ) ) ( not ( = ?auto_552526 ?auto_552528 ) ) ( not ( = ?auto_552526 ?auto_552529 ) ) ( not ( = ?auto_552526 ?auto_552530 ) ) ( not ( = ?auto_552526 ?auto_552531 ) ) ( not ( = ?auto_552526 ?auto_552532 ) ) ( not ( = ?auto_552526 ?auto_552533 ) ) ( not ( = ?auto_552527 ?auto_552528 ) ) ( not ( = ?auto_552527 ?auto_552529 ) ) ( not ( = ?auto_552527 ?auto_552530 ) ) ( not ( = ?auto_552527 ?auto_552531 ) ) ( not ( = ?auto_552527 ?auto_552532 ) ) ( not ( = ?auto_552527 ?auto_552533 ) ) ( not ( = ?auto_552528 ?auto_552529 ) ) ( not ( = ?auto_552528 ?auto_552530 ) ) ( not ( = ?auto_552528 ?auto_552531 ) ) ( not ( = ?auto_552528 ?auto_552532 ) ) ( not ( = ?auto_552528 ?auto_552533 ) ) ( not ( = ?auto_552529 ?auto_552530 ) ) ( not ( = ?auto_552529 ?auto_552531 ) ) ( not ( = ?auto_552529 ?auto_552532 ) ) ( not ( = ?auto_552529 ?auto_552533 ) ) ( not ( = ?auto_552530 ?auto_552531 ) ) ( not ( = ?auto_552530 ?auto_552532 ) ) ( not ( = ?auto_552530 ?auto_552533 ) ) ( not ( = ?auto_552531 ?auto_552532 ) ) ( not ( = ?auto_552531 ?auto_552533 ) ) ( not ( = ?auto_552532 ?auto_552533 ) ) ( ON ?auto_552532 ?auto_552533 ) ( ON ?auto_552531 ?auto_552532 ) ( ON ?auto_552530 ?auto_552531 ) ( ON ?auto_552529 ?auto_552530 ) ( ON ?auto_552528 ?auto_552529 ) ( ON ?auto_552527 ?auto_552528 ) ( ON ?auto_552526 ?auto_552527 ) ( ON ?auto_552525 ?auto_552526 ) ( ON ?auto_552524 ?auto_552525 ) ( ON ?auto_552523 ?auto_552524 ) ( ON ?auto_552522 ?auto_552523 ) ( CLEAR ?auto_552520 ) ( ON ?auto_552521 ?auto_552522 ) ( CLEAR ?auto_552521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_552518 ?auto_552519 ?auto_552520 ?auto_552521 )
      ( MAKE-16PILE ?auto_552518 ?auto_552519 ?auto_552520 ?auto_552521 ?auto_552522 ?auto_552523 ?auto_552524 ?auto_552525 ?auto_552526 ?auto_552527 ?auto_552528 ?auto_552529 ?auto_552530 ?auto_552531 ?auto_552532 ?auto_552533 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552550 - BLOCK
      ?auto_552551 - BLOCK
      ?auto_552552 - BLOCK
      ?auto_552553 - BLOCK
      ?auto_552554 - BLOCK
      ?auto_552555 - BLOCK
      ?auto_552556 - BLOCK
      ?auto_552557 - BLOCK
      ?auto_552558 - BLOCK
      ?auto_552559 - BLOCK
      ?auto_552560 - BLOCK
      ?auto_552561 - BLOCK
      ?auto_552562 - BLOCK
      ?auto_552563 - BLOCK
      ?auto_552564 - BLOCK
      ?auto_552565 - BLOCK
    )
    :vars
    (
      ?auto_552566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552565 ?auto_552566 ) ( ON-TABLE ?auto_552550 ) ( ON ?auto_552551 ?auto_552550 ) ( not ( = ?auto_552550 ?auto_552551 ) ) ( not ( = ?auto_552550 ?auto_552552 ) ) ( not ( = ?auto_552550 ?auto_552553 ) ) ( not ( = ?auto_552550 ?auto_552554 ) ) ( not ( = ?auto_552550 ?auto_552555 ) ) ( not ( = ?auto_552550 ?auto_552556 ) ) ( not ( = ?auto_552550 ?auto_552557 ) ) ( not ( = ?auto_552550 ?auto_552558 ) ) ( not ( = ?auto_552550 ?auto_552559 ) ) ( not ( = ?auto_552550 ?auto_552560 ) ) ( not ( = ?auto_552550 ?auto_552561 ) ) ( not ( = ?auto_552550 ?auto_552562 ) ) ( not ( = ?auto_552550 ?auto_552563 ) ) ( not ( = ?auto_552550 ?auto_552564 ) ) ( not ( = ?auto_552550 ?auto_552565 ) ) ( not ( = ?auto_552550 ?auto_552566 ) ) ( not ( = ?auto_552551 ?auto_552552 ) ) ( not ( = ?auto_552551 ?auto_552553 ) ) ( not ( = ?auto_552551 ?auto_552554 ) ) ( not ( = ?auto_552551 ?auto_552555 ) ) ( not ( = ?auto_552551 ?auto_552556 ) ) ( not ( = ?auto_552551 ?auto_552557 ) ) ( not ( = ?auto_552551 ?auto_552558 ) ) ( not ( = ?auto_552551 ?auto_552559 ) ) ( not ( = ?auto_552551 ?auto_552560 ) ) ( not ( = ?auto_552551 ?auto_552561 ) ) ( not ( = ?auto_552551 ?auto_552562 ) ) ( not ( = ?auto_552551 ?auto_552563 ) ) ( not ( = ?auto_552551 ?auto_552564 ) ) ( not ( = ?auto_552551 ?auto_552565 ) ) ( not ( = ?auto_552551 ?auto_552566 ) ) ( not ( = ?auto_552552 ?auto_552553 ) ) ( not ( = ?auto_552552 ?auto_552554 ) ) ( not ( = ?auto_552552 ?auto_552555 ) ) ( not ( = ?auto_552552 ?auto_552556 ) ) ( not ( = ?auto_552552 ?auto_552557 ) ) ( not ( = ?auto_552552 ?auto_552558 ) ) ( not ( = ?auto_552552 ?auto_552559 ) ) ( not ( = ?auto_552552 ?auto_552560 ) ) ( not ( = ?auto_552552 ?auto_552561 ) ) ( not ( = ?auto_552552 ?auto_552562 ) ) ( not ( = ?auto_552552 ?auto_552563 ) ) ( not ( = ?auto_552552 ?auto_552564 ) ) ( not ( = ?auto_552552 ?auto_552565 ) ) ( not ( = ?auto_552552 ?auto_552566 ) ) ( not ( = ?auto_552553 ?auto_552554 ) ) ( not ( = ?auto_552553 ?auto_552555 ) ) ( not ( = ?auto_552553 ?auto_552556 ) ) ( not ( = ?auto_552553 ?auto_552557 ) ) ( not ( = ?auto_552553 ?auto_552558 ) ) ( not ( = ?auto_552553 ?auto_552559 ) ) ( not ( = ?auto_552553 ?auto_552560 ) ) ( not ( = ?auto_552553 ?auto_552561 ) ) ( not ( = ?auto_552553 ?auto_552562 ) ) ( not ( = ?auto_552553 ?auto_552563 ) ) ( not ( = ?auto_552553 ?auto_552564 ) ) ( not ( = ?auto_552553 ?auto_552565 ) ) ( not ( = ?auto_552553 ?auto_552566 ) ) ( not ( = ?auto_552554 ?auto_552555 ) ) ( not ( = ?auto_552554 ?auto_552556 ) ) ( not ( = ?auto_552554 ?auto_552557 ) ) ( not ( = ?auto_552554 ?auto_552558 ) ) ( not ( = ?auto_552554 ?auto_552559 ) ) ( not ( = ?auto_552554 ?auto_552560 ) ) ( not ( = ?auto_552554 ?auto_552561 ) ) ( not ( = ?auto_552554 ?auto_552562 ) ) ( not ( = ?auto_552554 ?auto_552563 ) ) ( not ( = ?auto_552554 ?auto_552564 ) ) ( not ( = ?auto_552554 ?auto_552565 ) ) ( not ( = ?auto_552554 ?auto_552566 ) ) ( not ( = ?auto_552555 ?auto_552556 ) ) ( not ( = ?auto_552555 ?auto_552557 ) ) ( not ( = ?auto_552555 ?auto_552558 ) ) ( not ( = ?auto_552555 ?auto_552559 ) ) ( not ( = ?auto_552555 ?auto_552560 ) ) ( not ( = ?auto_552555 ?auto_552561 ) ) ( not ( = ?auto_552555 ?auto_552562 ) ) ( not ( = ?auto_552555 ?auto_552563 ) ) ( not ( = ?auto_552555 ?auto_552564 ) ) ( not ( = ?auto_552555 ?auto_552565 ) ) ( not ( = ?auto_552555 ?auto_552566 ) ) ( not ( = ?auto_552556 ?auto_552557 ) ) ( not ( = ?auto_552556 ?auto_552558 ) ) ( not ( = ?auto_552556 ?auto_552559 ) ) ( not ( = ?auto_552556 ?auto_552560 ) ) ( not ( = ?auto_552556 ?auto_552561 ) ) ( not ( = ?auto_552556 ?auto_552562 ) ) ( not ( = ?auto_552556 ?auto_552563 ) ) ( not ( = ?auto_552556 ?auto_552564 ) ) ( not ( = ?auto_552556 ?auto_552565 ) ) ( not ( = ?auto_552556 ?auto_552566 ) ) ( not ( = ?auto_552557 ?auto_552558 ) ) ( not ( = ?auto_552557 ?auto_552559 ) ) ( not ( = ?auto_552557 ?auto_552560 ) ) ( not ( = ?auto_552557 ?auto_552561 ) ) ( not ( = ?auto_552557 ?auto_552562 ) ) ( not ( = ?auto_552557 ?auto_552563 ) ) ( not ( = ?auto_552557 ?auto_552564 ) ) ( not ( = ?auto_552557 ?auto_552565 ) ) ( not ( = ?auto_552557 ?auto_552566 ) ) ( not ( = ?auto_552558 ?auto_552559 ) ) ( not ( = ?auto_552558 ?auto_552560 ) ) ( not ( = ?auto_552558 ?auto_552561 ) ) ( not ( = ?auto_552558 ?auto_552562 ) ) ( not ( = ?auto_552558 ?auto_552563 ) ) ( not ( = ?auto_552558 ?auto_552564 ) ) ( not ( = ?auto_552558 ?auto_552565 ) ) ( not ( = ?auto_552558 ?auto_552566 ) ) ( not ( = ?auto_552559 ?auto_552560 ) ) ( not ( = ?auto_552559 ?auto_552561 ) ) ( not ( = ?auto_552559 ?auto_552562 ) ) ( not ( = ?auto_552559 ?auto_552563 ) ) ( not ( = ?auto_552559 ?auto_552564 ) ) ( not ( = ?auto_552559 ?auto_552565 ) ) ( not ( = ?auto_552559 ?auto_552566 ) ) ( not ( = ?auto_552560 ?auto_552561 ) ) ( not ( = ?auto_552560 ?auto_552562 ) ) ( not ( = ?auto_552560 ?auto_552563 ) ) ( not ( = ?auto_552560 ?auto_552564 ) ) ( not ( = ?auto_552560 ?auto_552565 ) ) ( not ( = ?auto_552560 ?auto_552566 ) ) ( not ( = ?auto_552561 ?auto_552562 ) ) ( not ( = ?auto_552561 ?auto_552563 ) ) ( not ( = ?auto_552561 ?auto_552564 ) ) ( not ( = ?auto_552561 ?auto_552565 ) ) ( not ( = ?auto_552561 ?auto_552566 ) ) ( not ( = ?auto_552562 ?auto_552563 ) ) ( not ( = ?auto_552562 ?auto_552564 ) ) ( not ( = ?auto_552562 ?auto_552565 ) ) ( not ( = ?auto_552562 ?auto_552566 ) ) ( not ( = ?auto_552563 ?auto_552564 ) ) ( not ( = ?auto_552563 ?auto_552565 ) ) ( not ( = ?auto_552563 ?auto_552566 ) ) ( not ( = ?auto_552564 ?auto_552565 ) ) ( not ( = ?auto_552564 ?auto_552566 ) ) ( not ( = ?auto_552565 ?auto_552566 ) ) ( ON ?auto_552564 ?auto_552565 ) ( ON ?auto_552563 ?auto_552564 ) ( ON ?auto_552562 ?auto_552563 ) ( ON ?auto_552561 ?auto_552562 ) ( ON ?auto_552560 ?auto_552561 ) ( ON ?auto_552559 ?auto_552560 ) ( ON ?auto_552558 ?auto_552559 ) ( ON ?auto_552557 ?auto_552558 ) ( ON ?auto_552556 ?auto_552557 ) ( ON ?auto_552555 ?auto_552556 ) ( ON ?auto_552554 ?auto_552555 ) ( ON ?auto_552553 ?auto_552554 ) ( CLEAR ?auto_552551 ) ( ON ?auto_552552 ?auto_552553 ) ( CLEAR ?auto_552552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_552550 ?auto_552551 ?auto_552552 )
      ( MAKE-16PILE ?auto_552550 ?auto_552551 ?auto_552552 ?auto_552553 ?auto_552554 ?auto_552555 ?auto_552556 ?auto_552557 ?auto_552558 ?auto_552559 ?auto_552560 ?auto_552561 ?auto_552562 ?auto_552563 ?auto_552564 ?auto_552565 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552583 - BLOCK
      ?auto_552584 - BLOCK
      ?auto_552585 - BLOCK
      ?auto_552586 - BLOCK
      ?auto_552587 - BLOCK
      ?auto_552588 - BLOCK
      ?auto_552589 - BLOCK
      ?auto_552590 - BLOCK
      ?auto_552591 - BLOCK
      ?auto_552592 - BLOCK
      ?auto_552593 - BLOCK
      ?auto_552594 - BLOCK
      ?auto_552595 - BLOCK
      ?auto_552596 - BLOCK
      ?auto_552597 - BLOCK
      ?auto_552598 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_552598 ) ( ON-TABLE ?auto_552583 ) ( ON ?auto_552584 ?auto_552583 ) ( not ( = ?auto_552583 ?auto_552584 ) ) ( not ( = ?auto_552583 ?auto_552585 ) ) ( not ( = ?auto_552583 ?auto_552586 ) ) ( not ( = ?auto_552583 ?auto_552587 ) ) ( not ( = ?auto_552583 ?auto_552588 ) ) ( not ( = ?auto_552583 ?auto_552589 ) ) ( not ( = ?auto_552583 ?auto_552590 ) ) ( not ( = ?auto_552583 ?auto_552591 ) ) ( not ( = ?auto_552583 ?auto_552592 ) ) ( not ( = ?auto_552583 ?auto_552593 ) ) ( not ( = ?auto_552583 ?auto_552594 ) ) ( not ( = ?auto_552583 ?auto_552595 ) ) ( not ( = ?auto_552583 ?auto_552596 ) ) ( not ( = ?auto_552583 ?auto_552597 ) ) ( not ( = ?auto_552583 ?auto_552598 ) ) ( not ( = ?auto_552584 ?auto_552585 ) ) ( not ( = ?auto_552584 ?auto_552586 ) ) ( not ( = ?auto_552584 ?auto_552587 ) ) ( not ( = ?auto_552584 ?auto_552588 ) ) ( not ( = ?auto_552584 ?auto_552589 ) ) ( not ( = ?auto_552584 ?auto_552590 ) ) ( not ( = ?auto_552584 ?auto_552591 ) ) ( not ( = ?auto_552584 ?auto_552592 ) ) ( not ( = ?auto_552584 ?auto_552593 ) ) ( not ( = ?auto_552584 ?auto_552594 ) ) ( not ( = ?auto_552584 ?auto_552595 ) ) ( not ( = ?auto_552584 ?auto_552596 ) ) ( not ( = ?auto_552584 ?auto_552597 ) ) ( not ( = ?auto_552584 ?auto_552598 ) ) ( not ( = ?auto_552585 ?auto_552586 ) ) ( not ( = ?auto_552585 ?auto_552587 ) ) ( not ( = ?auto_552585 ?auto_552588 ) ) ( not ( = ?auto_552585 ?auto_552589 ) ) ( not ( = ?auto_552585 ?auto_552590 ) ) ( not ( = ?auto_552585 ?auto_552591 ) ) ( not ( = ?auto_552585 ?auto_552592 ) ) ( not ( = ?auto_552585 ?auto_552593 ) ) ( not ( = ?auto_552585 ?auto_552594 ) ) ( not ( = ?auto_552585 ?auto_552595 ) ) ( not ( = ?auto_552585 ?auto_552596 ) ) ( not ( = ?auto_552585 ?auto_552597 ) ) ( not ( = ?auto_552585 ?auto_552598 ) ) ( not ( = ?auto_552586 ?auto_552587 ) ) ( not ( = ?auto_552586 ?auto_552588 ) ) ( not ( = ?auto_552586 ?auto_552589 ) ) ( not ( = ?auto_552586 ?auto_552590 ) ) ( not ( = ?auto_552586 ?auto_552591 ) ) ( not ( = ?auto_552586 ?auto_552592 ) ) ( not ( = ?auto_552586 ?auto_552593 ) ) ( not ( = ?auto_552586 ?auto_552594 ) ) ( not ( = ?auto_552586 ?auto_552595 ) ) ( not ( = ?auto_552586 ?auto_552596 ) ) ( not ( = ?auto_552586 ?auto_552597 ) ) ( not ( = ?auto_552586 ?auto_552598 ) ) ( not ( = ?auto_552587 ?auto_552588 ) ) ( not ( = ?auto_552587 ?auto_552589 ) ) ( not ( = ?auto_552587 ?auto_552590 ) ) ( not ( = ?auto_552587 ?auto_552591 ) ) ( not ( = ?auto_552587 ?auto_552592 ) ) ( not ( = ?auto_552587 ?auto_552593 ) ) ( not ( = ?auto_552587 ?auto_552594 ) ) ( not ( = ?auto_552587 ?auto_552595 ) ) ( not ( = ?auto_552587 ?auto_552596 ) ) ( not ( = ?auto_552587 ?auto_552597 ) ) ( not ( = ?auto_552587 ?auto_552598 ) ) ( not ( = ?auto_552588 ?auto_552589 ) ) ( not ( = ?auto_552588 ?auto_552590 ) ) ( not ( = ?auto_552588 ?auto_552591 ) ) ( not ( = ?auto_552588 ?auto_552592 ) ) ( not ( = ?auto_552588 ?auto_552593 ) ) ( not ( = ?auto_552588 ?auto_552594 ) ) ( not ( = ?auto_552588 ?auto_552595 ) ) ( not ( = ?auto_552588 ?auto_552596 ) ) ( not ( = ?auto_552588 ?auto_552597 ) ) ( not ( = ?auto_552588 ?auto_552598 ) ) ( not ( = ?auto_552589 ?auto_552590 ) ) ( not ( = ?auto_552589 ?auto_552591 ) ) ( not ( = ?auto_552589 ?auto_552592 ) ) ( not ( = ?auto_552589 ?auto_552593 ) ) ( not ( = ?auto_552589 ?auto_552594 ) ) ( not ( = ?auto_552589 ?auto_552595 ) ) ( not ( = ?auto_552589 ?auto_552596 ) ) ( not ( = ?auto_552589 ?auto_552597 ) ) ( not ( = ?auto_552589 ?auto_552598 ) ) ( not ( = ?auto_552590 ?auto_552591 ) ) ( not ( = ?auto_552590 ?auto_552592 ) ) ( not ( = ?auto_552590 ?auto_552593 ) ) ( not ( = ?auto_552590 ?auto_552594 ) ) ( not ( = ?auto_552590 ?auto_552595 ) ) ( not ( = ?auto_552590 ?auto_552596 ) ) ( not ( = ?auto_552590 ?auto_552597 ) ) ( not ( = ?auto_552590 ?auto_552598 ) ) ( not ( = ?auto_552591 ?auto_552592 ) ) ( not ( = ?auto_552591 ?auto_552593 ) ) ( not ( = ?auto_552591 ?auto_552594 ) ) ( not ( = ?auto_552591 ?auto_552595 ) ) ( not ( = ?auto_552591 ?auto_552596 ) ) ( not ( = ?auto_552591 ?auto_552597 ) ) ( not ( = ?auto_552591 ?auto_552598 ) ) ( not ( = ?auto_552592 ?auto_552593 ) ) ( not ( = ?auto_552592 ?auto_552594 ) ) ( not ( = ?auto_552592 ?auto_552595 ) ) ( not ( = ?auto_552592 ?auto_552596 ) ) ( not ( = ?auto_552592 ?auto_552597 ) ) ( not ( = ?auto_552592 ?auto_552598 ) ) ( not ( = ?auto_552593 ?auto_552594 ) ) ( not ( = ?auto_552593 ?auto_552595 ) ) ( not ( = ?auto_552593 ?auto_552596 ) ) ( not ( = ?auto_552593 ?auto_552597 ) ) ( not ( = ?auto_552593 ?auto_552598 ) ) ( not ( = ?auto_552594 ?auto_552595 ) ) ( not ( = ?auto_552594 ?auto_552596 ) ) ( not ( = ?auto_552594 ?auto_552597 ) ) ( not ( = ?auto_552594 ?auto_552598 ) ) ( not ( = ?auto_552595 ?auto_552596 ) ) ( not ( = ?auto_552595 ?auto_552597 ) ) ( not ( = ?auto_552595 ?auto_552598 ) ) ( not ( = ?auto_552596 ?auto_552597 ) ) ( not ( = ?auto_552596 ?auto_552598 ) ) ( not ( = ?auto_552597 ?auto_552598 ) ) ( ON ?auto_552597 ?auto_552598 ) ( ON ?auto_552596 ?auto_552597 ) ( ON ?auto_552595 ?auto_552596 ) ( ON ?auto_552594 ?auto_552595 ) ( ON ?auto_552593 ?auto_552594 ) ( ON ?auto_552592 ?auto_552593 ) ( ON ?auto_552591 ?auto_552592 ) ( ON ?auto_552590 ?auto_552591 ) ( ON ?auto_552589 ?auto_552590 ) ( ON ?auto_552588 ?auto_552589 ) ( ON ?auto_552587 ?auto_552588 ) ( ON ?auto_552586 ?auto_552587 ) ( CLEAR ?auto_552584 ) ( ON ?auto_552585 ?auto_552586 ) ( CLEAR ?auto_552585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_552583 ?auto_552584 ?auto_552585 )
      ( MAKE-16PILE ?auto_552583 ?auto_552584 ?auto_552585 ?auto_552586 ?auto_552587 ?auto_552588 ?auto_552589 ?auto_552590 ?auto_552591 ?auto_552592 ?auto_552593 ?auto_552594 ?auto_552595 ?auto_552596 ?auto_552597 ?auto_552598 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552615 - BLOCK
      ?auto_552616 - BLOCK
      ?auto_552617 - BLOCK
      ?auto_552618 - BLOCK
      ?auto_552619 - BLOCK
      ?auto_552620 - BLOCK
      ?auto_552621 - BLOCK
      ?auto_552622 - BLOCK
      ?auto_552623 - BLOCK
      ?auto_552624 - BLOCK
      ?auto_552625 - BLOCK
      ?auto_552626 - BLOCK
      ?auto_552627 - BLOCK
      ?auto_552628 - BLOCK
      ?auto_552629 - BLOCK
      ?auto_552630 - BLOCK
    )
    :vars
    (
      ?auto_552631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552630 ?auto_552631 ) ( ON-TABLE ?auto_552615 ) ( not ( = ?auto_552615 ?auto_552616 ) ) ( not ( = ?auto_552615 ?auto_552617 ) ) ( not ( = ?auto_552615 ?auto_552618 ) ) ( not ( = ?auto_552615 ?auto_552619 ) ) ( not ( = ?auto_552615 ?auto_552620 ) ) ( not ( = ?auto_552615 ?auto_552621 ) ) ( not ( = ?auto_552615 ?auto_552622 ) ) ( not ( = ?auto_552615 ?auto_552623 ) ) ( not ( = ?auto_552615 ?auto_552624 ) ) ( not ( = ?auto_552615 ?auto_552625 ) ) ( not ( = ?auto_552615 ?auto_552626 ) ) ( not ( = ?auto_552615 ?auto_552627 ) ) ( not ( = ?auto_552615 ?auto_552628 ) ) ( not ( = ?auto_552615 ?auto_552629 ) ) ( not ( = ?auto_552615 ?auto_552630 ) ) ( not ( = ?auto_552615 ?auto_552631 ) ) ( not ( = ?auto_552616 ?auto_552617 ) ) ( not ( = ?auto_552616 ?auto_552618 ) ) ( not ( = ?auto_552616 ?auto_552619 ) ) ( not ( = ?auto_552616 ?auto_552620 ) ) ( not ( = ?auto_552616 ?auto_552621 ) ) ( not ( = ?auto_552616 ?auto_552622 ) ) ( not ( = ?auto_552616 ?auto_552623 ) ) ( not ( = ?auto_552616 ?auto_552624 ) ) ( not ( = ?auto_552616 ?auto_552625 ) ) ( not ( = ?auto_552616 ?auto_552626 ) ) ( not ( = ?auto_552616 ?auto_552627 ) ) ( not ( = ?auto_552616 ?auto_552628 ) ) ( not ( = ?auto_552616 ?auto_552629 ) ) ( not ( = ?auto_552616 ?auto_552630 ) ) ( not ( = ?auto_552616 ?auto_552631 ) ) ( not ( = ?auto_552617 ?auto_552618 ) ) ( not ( = ?auto_552617 ?auto_552619 ) ) ( not ( = ?auto_552617 ?auto_552620 ) ) ( not ( = ?auto_552617 ?auto_552621 ) ) ( not ( = ?auto_552617 ?auto_552622 ) ) ( not ( = ?auto_552617 ?auto_552623 ) ) ( not ( = ?auto_552617 ?auto_552624 ) ) ( not ( = ?auto_552617 ?auto_552625 ) ) ( not ( = ?auto_552617 ?auto_552626 ) ) ( not ( = ?auto_552617 ?auto_552627 ) ) ( not ( = ?auto_552617 ?auto_552628 ) ) ( not ( = ?auto_552617 ?auto_552629 ) ) ( not ( = ?auto_552617 ?auto_552630 ) ) ( not ( = ?auto_552617 ?auto_552631 ) ) ( not ( = ?auto_552618 ?auto_552619 ) ) ( not ( = ?auto_552618 ?auto_552620 ) ) ( not ( = ?auto_552618 ?auto_552621 ) ) ( not ( = ?auto_552618 ?auto_552622 ) ) ( not ( = ?auto_552618 ?auto_552623 ) ) ( not ( = ?auto_552618 ?auto_552624 ) ) ( not ( = ?auto_552618 ?auto_552625 ) ) ( not ( = ?auto_552618 ?auto_552626 ) ) ( not ( = ?auto_552618 ?auto_552627 ) ) ( not ( = ?auto_552618 ?auto_552628 ) ) ( not ( = ?auto_552618 ?auto_552629 ) ) ( not ( = ?auto_552618 ?auto_552630 ) ) ( not ( = ?auto_552618 ?auto_552631 ) ) ( not ( = ?auto_552619 ?auto_552620 ) ) ( not ( = ?auto_552619 ?auto_552621 ) ) ( not ( = ?auto_552619 ?auto_552622 ) ) ( not ( = ?auto_552619 ?auto_552623 ) ) ( not ( = ?auto_552619 ?auto_552624 ) ) ( not ( = ?auto_552619 ?auto_552625 ) ) ( not ( = ?auto_552619 ?auto_552626 ) ) ( not ( = ?auto_552619 ?auto_552627 ) ) ( not ( = ?auto_552619 ?auto_552628 ) ) ( not ( = ?auto_552619 ?auto_552629 ) ) ( not ( = ?auto_552619 ?auto_552630 ) ) ( not ( = ?auto_552619 ?auto_552631 ) ) ( not ( = ?auto_552620 ?auto_552621 ) ) ( not ( = ?auto_552620 ?auto_552622 ) ) ( not ( = ?auto_552620 ?auto_552623 ) ) ( not ( = ?auto_552620 ?auto_552624 ) ) ( not ( = ?auto_552620 ?auto_552625 ) ) ( not ( = ?auto_552620 ?auto_552626 ) ) ( not ( = ?auto_552620 ?auto_552627 ) ) ( not ( = ?auto_552620 ?auto_552628 ) ) ( not ( = ?auto_552620 ?auto_552629 ) ) ( not ( = ?auto_552620 ?auto_552630 ) ) ( not ( = ?auto_552620 ?auto_552631 ) ) ( not ( = ?auto_552621 ?auto_552622 ) ) ( not ( = ?auto_552621 ?auto_552623 ) ) ( not ( = ?auto_552621 ?auto_552624 ) ) ( not ( = ?auto_552621 ?auto_552625 ) ) ( not ( = ?auto_552621 ?auto_552626 ) ) ( not ( = ?auto_552621 ?auto_552627 ) ) ( not ( = ?auto_552621 ?auto_552628 ) ) ( not ( = ?auto_552621 ?auto_552629 ) ) ( not ( = ?auto_552621 ?auto_552630 ) ) ( not ( = ?auto_552621 ?auto_552631 ) ) ( not ( = ?auto_552622 ?auto_552623 ) ) ( not ( = ?auto_552622 ?auto_552624 ) ) ( not ( = ?auto_552622 ?auto_552625 ) ) ( not ( = ?auto_552622 ?auto_552626 ) ) ( not ( = ?auto_552622 ?auto_552627 ) ) ( not ( = ?auto_552622 ?auto_552628 ) ) ( not ( = ?auto_552622 ?auto_552629 ) ) ( not ( = ?auto_552622 ?auto_552630 ) ) ( not ( = ?auto_552622 ?auto_552631 ) ) ( not ( = ?auto_552623 ?auto_552624 ) ) ( not ( = ?auto_552623 ?auto_552625 ) ) ( not ( = ?auto_552623 ?auto_552626 ) ) ( not ( = ?auto_552623 ?auto_552627 ) ) ( not ( = ?auto_552623 ?auto_552628 ) ) ( not ( = ?auto_552623 ?auto_552629 ) ) ( not ( = ?auto_552623 ?auto_552630 ) ) ( not ( = ?auto_552623 ?auto_552631 ) ) ( not ( = ?auto_552624 ?auto_552625 ) ) ( not ( = ?auto_552624 ?auto_552626 ) ) ( not ( = ?auto_552624 ?auto_552627 ) ) ( not ( = ?auto_552624 ?auto_552628 ) ) ( not ( = ?auto_552624 ?auto_552629 ) ) ( not ( = ?auto_552624 ?auto_552630 ) ) ( not ( = ?auto_552624 ?auto_552631 ) ) ( not ( = ?auto_552625 ?auto_552626 ) ) ( not ( = ?auto_552625 ?auto_552627 ) ) ( not ( = ?auto_552625 ?auto_552628 ) ) ( not ( = ?auto_552625 ?auto_552629 ) ) ( not ( = ?auto_552625 ?auto_552630 ) ) ( not ( = ?auto_552625 ?auto_552631 ) ) ( not ( = ?auto_552626 ?auto_552627 ) ) ( not ( = ?auto_552626 ?auto_552628 ) ) ( not ( = ?auto_552626 ?auto_552629 ) ) ( not ( = ?auto_552626 ?auto_552630 ) ) ( not ( = ?auto_552626 ?auto_552631 ) ) ( not ( = ?auto_552627 ?auto_552628 ) ) ( not ( = ?auto_552627 ?auto_552629 ) ) ( not ( = ?auto_552627 ?auto_552630 ) ) ( not ( = ?auto_552627 ?auto_552631 ) ) ( not ( = ?auto_552628 ?auto_552629 ) ) ( not ( = ?auto_552628 ?auto_552630 ) ) ( not ( = ?auto_552628 ?auto_552631 ) ) ( not ( = ?auto_552629 ?auto_552630 ) ) ( not ( = ?auto_552629 ?auto_552631 ) ) ( not ( = ?auto_552630 ?auto_552631 ) ) ( ON ?auto_552629 ?auto_552630 ) ( ON ?auto_552628 ?auto_552629 ) ( ON ?auto_552627 ?auto_552628 ) ( ON ?auto_552626 ?auto_552627 ) ( ON ?auto_552625 ?auto_552626 ) ( ON ?auto_552624 ?auto_552625 ) ( ON ?auto_552623 ?auto_552624 ) ( ON ?auto_552622 ?auto_552623 ) ( ON ?auto_552621 ?auto_552622 ) ( ON ?auto_552620 ?auto_552621 ) ( ON ?auto_552619 ?auto_552620 ) ( ON ?auto_552618 ?auto_552619 ) ( ON ?auto_552617 ?auto_552618 ) ( CLEAR ?auto_552615 ) ( ON ?auto_552616 ?auto_552617 ) ( CLEAR ?auto_552616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_552615 ?auto_552616 )
      ( MAKE-16PILE ?auto_552615 ?auto_552616 ?auto_552617 ?auto_552618 ?auto_552619 ?auto_552620 ?auto_552621 ?auto_552622 ?auto_552623 ?auto_552624 ?auto_552625 ?auto_552626 ?auto_552627 ?auto_552628 ?auto_552629 ?auto_552630 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552648 - BLOCK
      ?auto_552649 - BLOCK
      ?auto_552650 - BLOCK
      ?auto_552651 - BLOCK
      ?auto_552652 - BLOCK
      ?auto_552653 - BLOCK
      ?auto_552654 - BLOCK
      ?auto_552655 - BLOCK
      ?auto_552656 - BLOCK
      ?auto_552657 - BLOCK
      ?auto_552658 - BLOCK
      ?auto_552659 - BLOCK
      ?auto_552660 - BLOCK
      ?auto_552661 - BLOCK
      ?auto_552662 - BLOCK
      ?auto_552663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_552663 ) ( ON-TABLE ?auto_552648 ) ( not ( = ?auto_552648 ?auto_552649 ) ) ( not ( = ?auto_552648 ?auto_552650 ) ) ( not ( = ?auto_552648 ?auto_552651 ) ) ( not ( = ?auto_552648 ?auto_552652 ) ) ( not ( = ?auto_552648 ?auto_552653 ) ) ( not ( = ?auto_552648 ?auto_552654 ) ) ( not ( = ?auto_552648 ?auto_552655 ) ) ( not ( = ?auto_552648 ?auto_552656 ) ) ( not ( = ?auto_552648 ?auto_552657 ) ) ( not ( = ?auto_552648 ?auto_552658 ) ) ( not ( = ?auto_552648 ?auto_552659 ) ) ( not ( = ?auto_552648 ?auto_552660 ) ) ( not ( = ?auto_552648 ?auto_552661 ) ) ( not ( = ?auto_552648 ?auto_552662 ) ) ( not ( = ?auto_552648 ?auto_552663 ) ) ( not ( = ?auto_552649 ?auto_552650 ) ) ( not ( = ?auto_552649 ?auto_552651 ) ) ( not ( = ?auto_552649 ?auto_552652 ) ) ( not ( = ?auto_552649 ?auto_552653 ) ) ( not ( = ?auto_552649 ?auto_552654 ) ) ( not ( = ?auto_552649 ?auto_552655 ) ) ( not ( = ?auto_552649 ?auto_552656 ) ) ( not ( = ?auto_552649 ?auto_552657 ) ) ( not ( = ?auto_552649 ?auto_552658 ) ) ( not ( = ?auto_552649 ?auto_552659 ) ) ( not ( = ?auto_552649 ?auto_552660 ) ) ( not ( = ?auto_552649 ?auto_552661 ) ) ( not ( = ?auto_552649 ?auto_552662 ) ) ( not ( = ?auto_552649 ?auto_552663 ) ) ( not ( = ?auto_552650 ?auto_552651 ) ) ( not ( = ?auto_552650 ?auto_552652 ) ) ( not ( = ?auto_552650 ?auto_552653 ) ) ( not ( = ?auto_552650 ?auto_552654 ) ) ( not ( = ?auto_552650 ?auto_552655 ) ) ( not ( = ?auto_552650 ?auto_552656 ) ) ( not ( = ?auto_552650 ?auto_552657 ) ) ( not ( = ?auto_552650 ?auto_552658 ) ) ( not ( = ?auto_552650 ?auto_552659 ) ) ( not ( = ?auto_552650 ?auto_552660 ) ) ( not ( = ?auto_552650 ?auto_552661 ) ) ( not ( = ?auto_552650 ?auto_552662 ) ) ( not ( = ?auto_552650 ?auto_552663 ) ) ( not ( = ?auto_552651 ?auto_552652 ) ) ( not ( = ?auto_552651 ?auto_552653 ) ) ( not ( = ?auto_552651 ?auto_552654 ) ) ( not ( = ?auto_552651 ?auto_552655 ) ) ( not ( = ?auto_552651 ?auto_552656 ) ) ( not ( = ?auto_552651 ?auto_552657 ) ) ( not ( = ?auto_552651 ?auto_552658 ) ) ( not ( = ?auto_552651 ?auto_552659 ) ) ( not ( = ?auto_552651 ?auto_552660 ) ) ( not ( = ?auto_552651 ?auto_552661 ) ) ( not ( = ?auto_552651 ?auto_552662 ) ) ( not ( = ?auto_552651 ?auto_552663 ) ) ( not ( = ?auto_552652 ?auto_552653 ) ) ( not ( = ?auto_552652 ?auto_552654 ) ) ( not ( = ?auto_552652 ?auto_552655 ) ) ( not ( = ?auto_552652 ?auto_552656 ) ) ( not ( = ?auto_552652 ?auto_552657 ) ) ( not ( = ?auto_552652 ?auto_552658 ) ) ( not ( = ?auto_552652 ?auto_552659 ) ) ( not ( = ?auto_552652 ?auto_552660 ) ) ( not ( = ?auto_552652 ?auto_552661 ) ) ( not ( = ?auto_552652 ?auto_552662 ) ) ( not ( = ?auto_552652 ?auto_552663 ) ) ( not ( = ?auto_552653 ?auto_552654 ) ) ( not ( = ?auto_552653 ?auto_552655 ) ) ( not ( = ?auto_552653 ?auto_552656 ) ) ( not ( = ?auto_552653 ?auto_552657 ) ) ( not ( = ?auto_552653 ?auto_552658 ) ) ( not ( = ?auto_552653 ?auto_552659 ) ) ( not ( = ?auto_552653 ?auto_552660 ) ) ( not ( = ?auto_552653 ?auto_552661 ) ) ( not ( = ?auto_552653 ?auto_552662 ) ) ( not ( = ?auto_552653 ?auto_552663 ) ) ( not ( = ?auto_552654 ?auto_552655 ) ) ( not ( = ?auto_552654 ?auto_552656 ) ) ( not ( = ?auto_552654 ?auto_552657 ) ) ( not ( = ?auto_552654 ?auto_552658 ) ) ( not ( = ?auto_552654 ?auto_552659 ) ) ( not ( = ?auto_552654 ?auto_552660 ) ) ( not ( = ?auto_552654 ?auto_552661 ) ) ( not ( = ?auto_552654 ?auto_552662 ) ) ( not ( = ?auto_552654 ?auto_552663 ) ) ( not ( = ?auto_552655 ?auto_552656 ) ) ( not ( = ?auto_552655 ?auto_552657 ) ) ( not ( = ?auto_552655 ?auto_552658 ) ) ( not ( = ?auto_552655 ?auto_552659 ) ) ( not ( = ?auto_552655 ?auto_552660 ) ) ( not ( = ?auto_552655 ?auto_552661 ) ) ( not ( = ?auto_552655 ?auto_552662 ) ) ( not ( = ?auto_552655 ?auto_552663 ) ) ( not ( = ?auto_552656 ?auto_552657 ) ) ( not ( = ?auto_552656 ?auto_552658 ) ) ( not ( = ?auto_552656 ?auto_552659 ) ) ( not ( = ?auto_552656 ?auto_552660 ) ) ( not ( = ?auto_552656 ?auto_552661 ) ) ( not ( = ?auto_552656 ?auto_552662 ) ) ( not ( = ?auto_552656 ?auto_552663 ) ) ( not ( = ?auto_552657 ?auto_552658 ) ) ( not ( = ?auto_552657 ?auto_552659 ) ) ( not ( = ?auto_552657 ?auto_552660 ) ) ( not ( = ?auto_552657 ?auto_552661 ) ) ( not ( = ?auto_552657 ?auto_552662 ) ) ( not ( = ?auto_552657 ?auto_552663 ) ) ( not ( = ?auto_552658 ?auto_552659 ) ) ( not ( = ?auto_552658 ?auto_552660 ) ) ( not ( = ?auto_552658 ?auto_552661 ) ) ( not ( = ?auto_552658 ?auto_552662 ) ) ( not ( = ?auto_552658 ?auto_552663 ) ) ( not ( = ?auto_552659 ?auto_552660 ) ) ( not ( = ?auto_552659 ?auto_552661 ) ) ( not ( = ?auto_552659 ?auto_552662 ) ) ( not ( = ?auto_552659 ?auto_552663 ) ) ( not ( = ?auto_552660 ?auto_552661 ) ) ( not ( = ?auto_552660 ?auto_552662 ) ) ( not ( = ?auto_552660 ?auto_552663 ) ) ( not ( = ?auto_552661 ?auto_552662 ) ) ( not ( = ?auto_552661 ?auto_552663 ) ) ( not ( = ?auto_552662 ?auto_552663 ) ) ( ON ?auto_552662 ?auto_552663 ) ( ON ?auto_552661 ?auto_552662 ) ( ON ?auto_552660 ?auto_552661 ) ( ON ?auto_552659 ?auto_552660 ) ( ON ?auto_552658 ?auto_552659 ) ( ON ?auto_552657 ?auto_552658 ) ( ON ?auto_552656 ?auto_552657 ) ( ON ?auto_552655 ?auto_552656 ) ( ON ?auto_552654 ?auto_552655 ) ( ON ?auto_552653 ?auto_552654 ) ( ON ?auto_552652 ?auto_552653 ) ( ON ?auto_552651 ?auto_552652 ) ( ON ?auto_552650 ?auto_552651 ) ( CLEAR ?auto_552648 ) ( ON ?auto_552649 ?auto_552650 ) ( CLEAR ?auto_552649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_552648 ?auto_552649 )
      ( MAKE-16PILE ?auto_552648 ?auto_552649 ?auto_552650 ?auto_552651 ?auto_552652 ?auto_552653 ?auto_552654 ?auto_552655 ?auto_552656 ?auto_552657 ?auto_552658 ?auto_552659 ?auto_552660 ?auto_552661 ?auto_552662 ?auto_552663 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552680 - BLOCK
      ?auto_552681 - BLOCK
      ?auto_552682 - BLOCK
      ?auto_552683 - BLOCK
      ?auto_552684 - BLOCK
      ?auto_552685 - BLOCK
      ?auto_552686 - BLOCK
      ?auto_552687 - BLOCK
      ?auto_552688 - BLOCK
      ?auto_552689 - BLOCK
      ?auto_552690 - BLOCK
      ?auto_552691 - BLOCK
      ?auto_552692 - BLOCK
      ?auto_552693 - BLOCK
      ?auto_552694 - BLOCK
      ?auto_552695 - BLOCK
    )
    :vars
    (
      ?auto_552696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552695 ?auto_552696 ) ( not ( = ?auto_552680 ?auto_552681 ) ) ( not ( = ?auto_552680 ?auto_552682 ) ) ( not ( = ?auto_552680 ?auto_552683 ) ) ( not ( = ?auto_552680 ?auto_552684 ) ) ( not ( = ?auto_552680 ?auto_552685 ) ) ( not ( = ?auto_552680 ?auto_552686 ) ) ( not ( = ?auto_552680 ?auto_552687 ) ) ( not ( = ?auto_552680 ?auto_552688 ) ) ( not ( = ?auto_552680 ?auto_552689 ) ) ( not ( = ?auto_552680 ?auto_552690 ) ) ( not ( = ?auto_552680 ?auto_552691 ) ) ( not ( = ?auto_552680 ?auto_552692 ) ) ( not ( = ?auto_552680 ?auto_552693 ) ) ( not ( = ?auto_552680 ?auto_552694 ) ) ( not ( = ?auto_552680 ?auto_552695 ) ) ( not ( = ?auto_552680 ?auto_552696 ) ) ( not ( = ?auto_552681 ?auto_552682 ) ) ( not ( = ?auto_552681 ?auto_552683 ) ) ( not ( = ?auto_552681 ?auto_552684 ) ) ( not ( = ?auto_552681 ?auto_552685 ) ) ( not ( = ?auto_552681 ?auto_552686 ) ) ( not ( = ?auto_552681 ?auto_552687 ) ) ( not ( = ?auto_552681 ?auto_552688 ) ) ( not ( = ?auto_552681 ?auto_552689 ) ) ( not ( = ?auto_552681 ?auto_552690 ) ) ( not ( = ?auto_552681 ?auto_552691 ) ) ( not ( = ?auto_552681 ?auto_552692 ) ) ( not ( = ?auto_552681 ?auto_552693 ) ) ( not ( = ?auto_552681 ?auto_552694 ) ) ( not ( = ?auto_552681 ?auto_552695 ) ) ( not ( = ?auto_552681 ?auto_552696 ) ) ( not ( = ?auto_552682 ?auto_552683 ) ) ( not ( = ?auto_552682 ?auto_552684 ) ) ( not ( = ?auto_552682 ?auto_552685 ) ) ( not ( = ?auto_552682 ?auto_552686 ) ) ( not ( = ?auto_552682 ?auto_552687 ) ) ( not ( = ?auto_552682 ?auto_552688 ) ) ( not ( = ?auto_552682 ?auto_552689 ) ) ( not ( = ?auto_552682 ?auto_552690 ) ) ( not ( = ?auto_552682 ?auto_552691 ) ) ( not ( = ?auto_552682 ?auto_552692 ) ) ( not ( = ?auto_552682 ?auto_552693 ) ) ( not ( = ?auto_552682 ?auto_552694 ) ) ( not ( = ?auto_552682 ?auto_552695 ) ) ( not ( = ?auto_552682 ?auto_552696 ) ) ( not ( = ?auto_552683 ?auto_552684 ) ) ( not ( = ?auto_552683 ?auto_552685 ) ) ( not ( = ?auto_552683 ?auto_552686 ) ) ( not ( = ?auto_552683 ?auto_552687 ) ) ( not ( = ?auto_552683 ?auto_552688 ) ) ( not ( = ?auto_552683 ?auto_552689 ) ) ( not ( = ?auto_552683 ?auto_552690 ) ) ( not ( = ?auto_552683 ?auto_552691 ) ) ( not ( = ?auto_552683 ?auto_552692 ) ) ( not ( = ?auto_552683 ?auto_552693 ) ) ( not ( = ?auto_552683 ?auto_552694 ) ) ( not ( = ?auto_552683 ?auto_552695 ) ) ( not ( = ?auto_552683 ?auto_552696 ) ) ( not ( = ?auto_552684 ?auto_552685 ) ) ( not ( = ?auto_552684 ?auto_552686 ) ) ( not ( = ?auto_552684 ?auto_552687 ) ) ( not ( = ?auto_552684 ?auto_552688 ) ) ( not ( = ?auto_552684 ?auto_552689 ) ) ( not ( = ?auto_552684 ?auto_552690 ) ) ( not ( = ?auto_552684 ?auto_552691 ) ) ( not ( = ?auto_552684 ?auto_552692 ) ) ( not ( = ?auto_552684 ?auto_552693 ) ) ( not ( = ?auto_552684 ?auto_552694 ) ) ( not ( = ?auto_552684 ?auto_552695 ) ) ( not ( = ?auto_552684 ?auto_552696 ) ) ( not ( = ?auto_552685 ?auto_552686 ) ) ( not ( = ?auto_552685 ?auto_552687 ) ) ( not ( = ?auto_552685 ?auto_552688 ) ) ( not ( = ?auto_552685 ?auto_552689 ) ) ( not ( = ?auto_552685 ?auto_552690 ) ) ( not ( = ?auto_552685 ?auto_552691 ) ) ( not ( = ?auto_552685 ?auto_552692 ) ) ( not ( = ?auto_552685 ?auto_552693 ) ) ( not ( = ?auto_552685 ?auto_552694 ) ) ( not ( = ?auto_552685 ?auto_552695 ) ) ( not ( = ?auto_552685 ?auto_552696 ) ) ( not ( = ?auto_552686 ?auto_552687 ) ) ( not ( = ?auto_552686 ?auto_552688 ) ) ( not ( = ?auto_552686 ?auto_552689 ) ) ( not ( = ?auto_552686 ?auto_552690 ) ) ( not ( = ?auto_552686 ?auto_552691 ) ) ( not ( = ?auto_552686 ?auto_552692 ) ) ( not ( = ?auto_552686 ?auto_552693 ) ) ( not ( = ?auto_552686 ?auto_552694 ) ) ( not ( = ?auto_552686 ?auto_552695 ) ) ( not ( = ?auto_552686 ?auto_552696 ) ) ( not ( = ?auto_552687 ?auto_552688 ) ) ( not ( = ?auto_552687 ?auto_552689 ) ) ( not ( = ?auto_552687 ?auto_552690 ) ) ( not ( = ?auto_552687 ?auto_552691 ) ) ( not ( = ?auto_552687 ?auto_552692 ) ) ( not ( = ?auto_552687 ?auto_552693 ) ) ( not ( = ?auto_552687 ?auto_552694 ) ) ( not ( = ?auto_552687 ?auto_552695 ) ) ( not ( = ?auto_552687 ?auto_552696 ) ) ( not ( = ?auto_552688 ?auto_552689 ) ) ( not ( = ?auto_552688 ?auto_552690 ) ) ( not ( = ?auto_552688 ?auto_552691 ) ) ( not ( = ?auto_552688 ?auto_552692 ) ) ( not ( = ?auto_552688 ?auto_552693 ) ) ( not ( = ?auto_552688 ?auto_552694 ) ) ( not ( = ?auto_552688 ?auto_552695 ) ) ( not ( = ?auto_552688 ?auto_552696 ) ) ( not ( = ?auto_552689 ?auto_552690 ) ) ( not ( = ?auto_552689 ?auto_552691 ) ) ( not ( = ?auto_552689 ?auto_552692 ) ) ( not ( = ?auto_552689 ?auto_552693 ) ) ( not ( = ?auto_552689 ?auto_552694 ) ) ( not ( = ?auto_552689 ?auto_552695 ) ) ( not ( = ?auto_552689 ?auto_552696 ) ) ( not ( = ?auto_552690 ?auto_552691 ) ) ( not ( = ?auto_552690 ?auto_552692 ) ) ( not ( = ?auto_552690 ?auto_552693 ) ) ( not ( = ?auto_552690 ?auto_552694 ) ) ( not ( = ?auto_552690 ?auto_552695 ) ) ( not ( = ?auto_552690 ?auto_552696 ) ) ( not ( = ?auto_552691 ?auto_552692 ) ) ( not ( = ?auto_552691 ?auto_552693 ) ) ( not ( = ?auto_552691 ?auto_552694 ) ) ( not ( = ?auto_552691 ?auto_552695 ) ) ( not ( = ?auto_552691 ?auto_552696 ) ) ( not ( = ?auto_552692 ?auto_552693 ) ) ( not ( = ?auto_552692 ?auto_552694 ) ) ( not ( = ?auto_552692 ?auto_552695 ) ) ( not ( = ?auto_552692 ?auto_552696 ) ) ( not ( = ?auto_552693 ?auto_552694 ) ) ( not ( = ?auto_552693 ?auto_552695 ) ) ( not ( = ?auto_552693 ?auto_552696 ) ) ( not ( = ?auto_552694 ?auto_552695 ) ) ( not ( = ?auto_552694 ?auto_552696 ) ) ( not ( = ?auto_552695 ?auto_552696 ) ) ( ON ?auto_552694 ?auto_552695 ) ( ON ?auto_552693 ?auto_552694 ) ( ON ?auto_552692 ?auto_552693 ) ( ON ?auto_552691 ?auto_552692 ) ( ON ?auto_552690 ?auto_552691 ) ( ON ?auto_552689 ?auto_552690 ) ( ON ?auto_552688 ?auto_552689 ) ( ON ?auto_552687 ?auto_552688 ) ( ON ?auto_552686 ?auto_552687 ) ( ON ?auto_552685 ?auto_552686 ) ( ON ?auto_552684 ?auto_552685 ) ( ON ?auto_552683 ?auto_552684 ) ( ON ?auto_552682 ?auto_552683 ) ( ON ?auto_552681 ?auto_552682 ) ( ON ?auto_552680 ?auto_552681 ) ( CLEAR ?auto_552680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_552680 )
      ( MAKE-16PILE ?auto_552680 ?auto_552681 ?auto_552682 ?auto_552683 ?auto_552684 ?auto_552685 ?auto_552686 ?auto_552687 ?auto_552688 ?auto_552689 ?auto_552690 ?auto_552691 ?auto_552692 ?auto_552693 ?auto_552694 ?auto_552695 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552713 - BLOCK
      ?auto_552714 - BLOCK
      ?auto_552715 - BLOCK
      ?auto_552716 - BLOCK
      ?auto_552717 - BLOCK
      ?auto_552718 - BLOCK
      ?auto_552719 - BLOCK
      ?auto_552720 - BLOCK
      ?auto_552721 - BLOCK
      ?auto_552722 - BLOCK
      ?auto_552723 - BLOCK
      ?auto_552724 - BLOCK
      ?auto_552725 - BLOCK
      ?auto_552726 - BLOCK
      ?auto_552727 - BLOCK
      ?auto_552728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_552728 ) ( not ( = ?auto_552713 ?auto_552714 ) ) ( not ( = ?auto_552713 ?auto_552715 ) ) ( not ( = ?auto_552713 ?auto_552716 ) ) ( not ( = ?auto_552713 ?auto_552717 ) ) ( not ( = ?auto_552713 ?auto_552718 ) ) ( not ( = ?auto_552713 ?auto_552719 ) ) ( not ( = ?auto_552713 ?auto_552720 ) ) ( not ( = ?auto_552713 ?auto_552721 ) ) ( not ( = ?auto_552713 ?auto_552722 ) ) ( not ( = ?auto_552713 ?auto_552723 ) ) ( not ( = ?auto_552713 ?auto_552724 ) ) ( not ( = ?auto_552713 ?auto_552725 ) ) ( not ( = ?auto_552713 ?auto_552726 ) ) ( not ( = ?auto_552713 ?auto_552727 ) ) ( not ( = ?auto_552713 ?auto_552728 ) ) ( not ( = ?auto_552714 ?auto_552715 ) ) ( not ( = ?auto_552714 ?auto_552716 ) ) ( not ( = ?auto_552714 ?auto_552717 ) ) ( not ( = ?auto_552714 ?auto_552718 ) ) ( not ( = ?auto_552714 ?auto_552719 ) ) ( not ( = ?auto_552714 ?auto_552720 ) ) ( not ( = ?auto_552714 ?auto_552721 ) ) ( not ( = ?auto_552714 ?auto_552722 ) ) ( not ( = ?auto_552714 ?auto_552723 ) ) ( not ( = ?auto_552714 ?auto_552724 ) ) ( not ( = ?auto_552714 ?auto_552725 ) ) ( not ( = ?auto_552714 ?auto_552726 ) ) ( not ( = ?auto_552714 ?auto_552727 ) ) ( not ( = ?auto_552714 ?auto_552728 ) ) ( not ( = ?auto_552715 ?auto_552716 ) ) ( not ( = ?auto_552715 ?auto_552717 ) ) ( not ( = ?auto_552715 ?auto_552718 ) ) ( not ( = ?auto_552715 ?auto_552719 ) ) ( not ( = ?auto_552715 ?auto_552720 ) ) ( not ( = ?auto_552715 ?auto_552721 ) ) ( not ( = ?auto_552715 ?auto_552722 ) ) ( not ( = ?auto_552715 ?auto_552723 ) ) ( not ( = ?auto_552715 ?auto_552724 ) ) ( not ( = ?auto_552715 ?auto_552725 ) ) ( not ( = ?auto_552715 ?auto_552726 ) ) ( not ( = ?auto_552715 ?auto_552727 ) ) ( not ( = ?auto_552715 ?auto_552728 ) ) ( not ( = ?auto_552716 ?auto_552717 ) ) ( not ( = ?auto_552716 ?auto_552718 ) ) ( not ( = ?auto_552716 ?auto_552719 ) ) ( not ( = ?auto_552716 ?auto_552720 ) ) ( not ( = ?auto_552716 ?auto_552721 ) ) ( not ( = ?auto_552716 ?auto_552722 ) ) ( not ( = ?auto_552716 ?auto_552723 ) ) ( not ( = ?auto_552716 ?auto_552724 ) ) ( not ( = ?auto_552716 ?auto_552725 ) ) ( not ( = ?auto_552716 ?auto_552726 ) ) ( not ( = ?auto_552716 ?auto_552727 ) ) ( not ( = ?auto_552716 ?auto_552728 ) ) ( not ( = ?auto_552717 ?auto_552718 ) ) ( not ( = ?auto_552717 ?auto_552719 ) ) ( not ( = ?auto_552717 ?auto_552720 ) ) ( not ( = ?auto_552717 ?auto_552721 ) ) ( not ( = ?auto_552717 ?auto_552722 ) ) ( not ( = ?auto_552717 ?auto_552723 ) ) ( not ( = ?auto_552717 ?auto_552724 ) ) ( not ( = ?auto_552717 ?auto_552725 ) ) ( not ( = ?auto_552717 ?auto_552726 ) ) ( not ( = ?auto_552717 ?auto_552727 ) ) ( not ( = ?auto_552717 ?auto_552728 ) ) ( not ( = ?auto_552718 ?auto_552719 ) ) ( not ( = ?auto_552718 ?auto_552720 ) ) ( not ( = ?auto_552718 ?auto_552721 ) ) ( not ( = ?auto_552718 ?auto_552722 ) ) ( not ( = ?auto_552718 ?auto_552723 ) ) ( not ( = ?auto_552718 ?auto_552724 ) ) ( not ( = ?auto_552718 ?auto_552725 ) ) ( not ( = ?auto_552718 ?auto_552726 ) ) ( not ( = ?auto_552718 ?auto_552727 ) ) ( not ( = ?auto_552718 ?auto_552728 ) ) ( not ( = ?auto_552719 ?auto_552720 ) ) ( not ( = ?auto_552719 ?auto_552721 ) ) ( not ( = ?auto_552719 ?auto_552722 ) ) ( not ( = ?auto_552719 ?auto_552723 ) ) ( not ( = ?auto_552719 ?auto_552724 ) ) ( not ( = ?auto_552719 ?auto_552725 ) ) ( not ( = ?auto_552719 ?auto_552726 ) ) ( not ( = ?auto_552719 ?auto_552727 ) ) ( not ( = ?auto_552719 ?auto_552728 ) ) ( not ( = ?auto_552720 ?auto_552721 ) ) ( not ( = ?auto_552720 ?auto_552722 ) ) ( not ( = ?auto_552720 ?auto_552723 ) ) ( not ( = ?auto_552720 ?auto_552724 ) ) ( not ( = ?auto_552720 ?auto_552725 ) ) ( not ( = ?auto_552720 ?auto_552726 ) ) ( not ( = ?auto_552720 ?auto_552727 ) ) ( not ( = ?auto_552720 ?auto_552728 ) ) ( not ( = ?auto_552721 ?auto_552722 ) ) ( not ( = ?auto_552721 ?auto_552723 ) ) ( not ( = ?auto_552721 ?auto_552724 ) ) ( not ( = ?auto_552721 ?auto_552725 ) ) ( not ( = ?auto_552721 ?auto_552726 ) ) ( not ( = ?auto_552721 ?auto_552727 ) ) ( not ( = ?auto_552721 ?auto_552728 ) ) ( not ( = ?auto_552722 ?auto_552723 ) ) ( not ( = ?auto_552722 ?auto_552724 ) ) ( not ( = ?auto_552722 ?auto_552725 ) ) ( not ( = ?auto_552722 ?auto_552726 ) ) ( not ( = ?auto_552722 ?auto_552727 ) ) ( not ( = ?auto_552722 ?auto_552728 ) ) ( not ( = ?auto_552723 ?auto_552724 ) ) ( not ( = ?auto_552723 ?auto_552725 ) ) ( not ( = ?auto_552723 ?auto_552726 ) ) ( not ( = ?auto_552723 ?auto_552727 ) ) ( not ( = ?auto_552723 ?auto_552728 ) ) ( not ( = ?auto_552724 ?auto_552725 ) ) ( not ( = ?auto_552724 ?auto_552726 ) ) ( not ( = ?auto_552724 ?auto_552727 ) ) ( not ( = ?auto_552724 ?auto_552728 ) ) ( not ( = ?auto_552725 ?auto_552726 ) ) ( not ( = ?auto_552725 ?auto_552727 ) ) ( not ( = ?auto_552725 ?auto_552728 ) ) ( not ( = ?auto_552726 ?auto_552727 ) ) ( not ( = ?auto_552726 ?auto_552728 ) ) ( not ( = ?auto_552727 ?auto_552728 ) ) ( ON ?auto_552727 ?auto_552728 ) ( ON ?auto_552726 ?auto_552727 ) ( ON ?auto_552725 ?auto_552726 ) ( ON ?auto_552724 ?auto_552725 ) ( ON ?auto_552723 ?auto_552724 ) ( ON ?auto_552722 ?auto_552723 ) ( ON ?auto_552721 ?auto_552722 ) ( ON ?auto_552720 ?auto_552721 ) ( ON ?auto_552719 ?auto_552720 ) ( ON ?auto_552718 ?auto_552719 ) ( ON ?auto_552717 ?auto_552718 ) ( ON ?auto_552716 ?auto_552717 ) ( ON ?auto_552715 ?auto_552716 ) ( ON ?auto_552714 ?auto_552715 ) ( ON ?auto_552713 ?auto_552714 ) ( CLEAR ?auto_552713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_552713 )
      ( MAKE-16PILE ?auto_552713 ?auto_552714 ?auto_552715 ?auto_552716 ?auto_552717 ?auto_552718 ?auto_552719 ?auto_552720 ?auto_552721 ?auto_552722 ?auto_552723 ?auto_552724 ?auto_552725 ?auto_552726 ?auto_552727 ?auto_552728 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_552745 - BLOCK
      ?auto_552746 - BLOCK
      ?auto_552747 - BLOCK
      ?auto_552748 - BLOCK
      ?auto_552749 - BLOCK
      ?auto_552750 - BLOCK
      ?auto_552751 - BLOCK
      ?auto_552752 - BLOCK
      ?auto_552753 - BLOCK
      ?auto_552754 - BLOCK
      ?auto_552755 - BLOCK
      ?auto_552756 - BLOCK
      ?auto_552757 - BLOCK
      ?auto_552758 - BLOCK
      ?auto_552759 - BLOCK
      ?auto_552760 - BLOCK
    )
    :vars
    (
      ?auto_552761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_552745 ?auto_552746 ) ) ( not ( = ?auto_552745 ?auto_552747 ) ) ( not ( = ?auto_552745 ?auto_552748 ) ) ( not ( = ?auto_552745 ?auto_552749 ) ) ( not ( = ?auto_552745 ?auto_552750 ) ) ( not ( = ?auto_552745 ?auto_552751 ) ) ( not ( = ?auto_552745 ?auto_552752 ) ) ( not ( = ?auto_552745 ?auto_552753 ) ) ( not ( = ?auto_552745 ?auto_552754 ) ) ( not ( = ?auto_552745 ?auto_552755 ) ) ( not ( = ?auto_552745 ?auto_552756 ) ) ( not ( = ?auto_552745 ?auto_552757 ) ) ( not ( = ?auto_552745 ?auto_552758 ) ) ( not ( = ?auto_552745 ?auto_552759 ) ) ( not ( = ?auto_552745 ?auto_552760 ) ) ( not ( = ?auto_552746 ?auto_552747 ) ) ( not ( = ?auto_552746 ?auto_552748 ) ) ( not ( = ?auto_552746 ?auto_552749 ) ) ( not ( = ?auto_552746 ?auto_552750 ) ) ( not ( = ?auto_552746 ?auto_552751 ) ) ( not ( = ?auto_552746 ?auto_552752 ) ) ( not ( = ?auto_552746 ?auto_552753 ) ) ( not ( = ?auto_552746 ?auto_552754 ) ) ( not ( = ?auto_552746 ?auto_552755 ) ) ( not ( = ?auto_552746 ?auto_552756 ) ) ( not ( = ?auto_552746 ?auto_552757 ) ) ( not ( = ?auto_552746 ?auto_552758 ) ) ( not ( = ?auto_552746 ?auto_552759 ) ) ( not ( = ?auto_552746 ?auto_552760 ) ) ( not ( = ?auto_552747 ?auto_552748 ) ) ( not ( = ?auto_552747 ?auto_552749 ) ) ( not ( = ?auto_552747 ?auto_552750 ) ) ( not ( = ?auto_552747 ?auto_552751 ) ) ( not ( = ?auto_552747 ?auto_552752 ) ) ( not ( = ?auto_552747 ?auto_552753 ) ) ( not ( = ?auto_552747 ?auto_552754 ) ) ( not ( = ?auto_552747 ?auto_552755 ) ) ( not ( = ?auto_552747 ?auto_552756 ) ) ( not ( = ?auto_552747 ?auto_552757 ) ) ( not ( = ?auto_552747 ?auto_552758 ) ) ( not ( = ?auto_552747 ?auto_552759 ) ) ( not ( = ?auto_552747 ?auto_552760 ) ) ( not ( = ?auto_552748 ?auto_552749 ) ) ( not ( = ?auto_552748 ?auto_552750 ) ) ( not ( = ?auto_552748 ?auto_552751 ) ) ( not ( = ?auto_552748 ?auto_552752 ) ) ( not ( = ?auto_552748 ?auto_552753 ) ) ( not ( = ?auto_552748 ?auto_552754 ) ) ( not ( = ?auto_552748 ?auto_552755 ) ) ( not ( = ?auto_552748 ?auto_552756 ) ) ( not ( = ?auto_552748 ?auto_552757 ) ) ( not ( = ?auto_552748 ?auto_552758 ) ) ( not ( = ?auto_552748 ?auto_552759 ) ) ( not ( = ?auto_552748 ?auto_552760 ) ) ( not ( = ?auto_552749 ?auto_552750 ) ) ( not ( = ?auto_552749 ?auto_552751 ) ) ( not ( = ?auto_552749 ?auto_552752 ) ) ( not ( = ?auto_552749 ?auto_552753 ) ) ( not ( = ?auto_552749 ?auto_552754 ) ) ( not ( = ?auto_552749 ?auto_552755 ) ) ( not ( = ?auto_552749 ?auto_552756 ) ) ( not ( = ?auto_552749 ?auto_552757 ) ) ( not ( = ?auto_552749 ?auto_552758 ) ) ( not ( = ?auto_552749 ?auto_552759 ) ) ( not ( = ?auto_552749 ?auto_552760 ) ) ( not ( = ?auto_552750 ?auto_552751 ) ) ( not ( = ?auto_552750 ?auto_552752 ) ) ( not ( = ?auto_552750 ?auto_552753 ) ) ( not ( = ?auto_552750 ?auto_552754 ) ) ( not ( = ?auto_552750 ?auto_552755 ) ) ( not ( = ?auto_552750 ?auto_552756 ) ) ( not ( = ?auto_552750 ?auto_552757 ) ) ( not ( = ?auto_552750 ?auto_552758 ) ) ( not ( = ?auto_552750 ?auto_552759 ) ) ( not ( = ?auto_552750 ?auto_552760 ) ) ( not ( = ?auto_552751 ?auto_552752 ) ) ( not ( = ?auto_552751 ?auto_552753 ) ) ( not ( = ?auto_552751 ?auto_552754 ) ) ( not ( = ?auto_552751 ?auto_552755 ) ) ( not ( = ?auto_552751 ?auto_552756 ) ) ( not ( = ?auto_552751 ?auto_552757 ) ) ( not ( = ?auto_552751 ?auto_552758 ) ) ( not ( = ?auto_552751 ?auto_552759 ) ) ( not ( = ?auto_552751 ?auto_552760 ) ) ( not ( = ?auto_552752 ?auto_552753 ) ) ( not ( = ?auto_552752 ?auto_552754 ) ) ( not ( = ?auto_552752 ?auto_552755 ) ) ( not ( = ?auto_552752 ?auto_552756 ) ) ( not ( = ?auto_552752 ?auto_552757 ) ) ( not ( = ?auto_552752 ?auto_552758 ) ) ( not ( = ?auto_552752 ?auto_552759 ) ) ( not ( = ?auto_552752 ?auto_552760 ) ) ( not ( = ?auto_552753 ?auto_552754 ) ) ( not ( = ?auto_552753 ?auto_552755 ) ) ( not ( = ?auto_552753 ?auto_552756 ) ) ( not ( = ?auto_552753 ?auto_552757 ) ) ( not ( = ?auto_552753 ?auto_552758 ) ) ( not ( = ?auto_552753 ?auto_552759 ) ) ( not ( = ?auto_552753 ?auto_552760 ) ) ( not ( = ?auto_552754 ?auto_552755 ) ) ( not ( = ?auto_552754 ?auto_552756 ) ) ( not ( = ?auto_552754 ?auto_552757 ) ) ( not ( = ?auto_552754 ?auto_552758 ) ) ( not ( = ?auto_552754 ?auto_552759 ) ) ( not ( = ?auto_552754 ?auto_552760 ) ) ( not ( = ?auto_552755 ?auto_552756 ) ) ( not ( = ?auto_552755 ?auto_552757 ) ) ( not ( = ?auto_552755 ?auto_552758 ) ) ( not ( = ?auto_552755 ?auto_552759 ) ) ( not ( = ?auto_552755 ?auto_552760 ) ) ( not ( = ?auto_552756 ?auto_552757 ) ) ( not ( = ?auto_552756 ?auto_552758 ) ) ( not ( = ?auto_552756 ?auto_552759 ) ) ( not ( = ?auto_552756 ?auto_552760 ) ) ( not ( = ?auto_552757 ?auto_552758 ) ) ( not ( = ?auto_552757 ?auto_552759 ) ) ( not ( = ?auto_552757 ?auto_552760 ) ) ( not ( = ?auto_552758 ?auto_552759 ) ) ( not ( = ?auto_552758 ?auto_552760 ) ) ( not ( = ?auto_552759 ?auto_552760 ) ) ( ON ?auto_552745 ?auto_552761 ) ( not ( = ?auto_552760 ?auto_552761 ) ) ( not ( = ?auto_552759 ?auto_552761 ) ) ( not ( = ?auto_552758 ?auto_552761 ) ) ( not ( = ?auto_552757 ?auto_552761 ) ) ( not ( = ?auto_552756 ?auto_552761 ) ) ( not ( = ?auto_552755 ?auto_552761 ) ) ( not ( = ?auto_552754 ?auto_552761 ) ) ( not ( = ?auto_552753 ?auto_552761 ) ) ( not ( = ?auto_552752 ?auto_552761 ) ) ( not ( = ?auto_552751 ?auto_552761 ) ) ( not ( = ?auto_552750 ?auto_552761 ) ) ( not ( = ?auto_552749 ?auto_552761 ) ) ( not ( = ?auto_552748 ?auto_552761 ) ) ( not ( = ?auto_552747 ?auto_552761 ) ) ( not ( = ?auto_552746 ?auto_552761 ) ) ( not ( = ?auto_552745 ?auto_552761 ) ) ( ON ?auto_552746 ?auto_552745 ) ( ON ?auto_552747 ?auto_552746 ) ( ON ?auto_552748 ?auto_552747 ) ( ON ?auto_552749 ?auto_552748 ) ( ON ?auto_552750 ?auto_552749 ) ( ON ?auto_552751 ?auto_552750 ) ( ON ?auto_552752 ?auto_552751 ) ( ON ?auto_552753 ?auto_552752 ) ( ON ?auto_552754 ?auto_552753 ) ( ON ?auto_552755 ?auto_552754 ) ( ON ?auto_552756 ?auto_552755 ) ( ON ?auto_552757 ?auto_552756 ) ( ON ?auto_552758 ?auto_552757 ) ( ON ?auto_552759 ?auto_552758 ) ( ON ?auto_552760 ?auto_552759 ) ( CLEAR ?auto_552760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_552760 ?auto_552759 ?auto_552758 ?auto_552757 ?auto_552756 ?auto_552755 ?auto_552754 ?auto_552753 ?auto_552752 ?auto_552751 ?auto_552750 ?auto_552749 ?auto_552748 ?auto_552747 ?auto_552746 ?auto_552745 )
      ( MAKE-16PILE ?auto_552745 ?auto_552746 ?auto_552747 ?auto_552748 ?auto_552749 ?auto_552750 ?auto_552751 ?auto_552752 ?auto_552753 ?auto_552754 ?auto_552755 ?auto_552756 ?auto_552757 ?auto_552758 ?auto_552759 ?auto_552760 ) )
  )

)

