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
      ?auto_477487 - BLOCK
    )
    :vars
    (
      ?auto_477488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477487 ?auto_477488 ) ( CLEAR ?auto_477487 ) ( HAND-EMPTY ) ( not ( = ?auto_477487 ?auto_477488 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_477487 ?auto_477488 )
      ( !PUTDOWN ?auto_477487 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_477494 - BLOCK
      ?auto_477495 - BLOCK
    )
    :vars
    (
      ?auto_477496 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_477494 ) ( ON ?auto_477495 ?auto_477496 ) ( CLEAR ?auto_477495 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_477494 ) ( not ( = ?auto_477494 ?auto_477495 ) ) ( not ( = ?auto_477494 ?auto_477496 ) ) ( not ( = ?auto_477495 ?auto_477496 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_477495 ?auto_477496 )
      ( !STACK ?auto_477495 ?auto_477494 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_477504 - BLOCK
      ?auto_477505 - BLOCK
    )
    :vars
    (
      ?auto_477506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477505 ?auto_477506 ) ( not ( = ?auto_477504 ?auto_477505 ) ) ( not ( = ?auto_477504 ?auto_477506 ) ) ( not ( = ?auto_477505 ?auto_477506 ) ) ( ON ?auto_477504 ?auto_477505 ) ( CLEAR ?auto_477504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_477504 )
      ( MAKE-2PILE ?auto_477504 ?auto_477505 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_477515 - BLOCK
      ?auto_477516 - BLOCK
      ?auto_477517 - BLOCK
    )
    :vars
    (
      ?auto_477518 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_477516 ) ( ON ?auto_477517 ?auto_477518 ) ( CLEAR ?auto_477517 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_477515 ) ( ON ?auto_477516 ?auto_477515 ) ( not ( = ?auto_477515 ?auto_477516 ) ) ( not ( = ?auto_477515 ?auto_477517 ) ) ( not ( = ?auto_477515 ?auto_477518 ) ) ( not ( = ?auto_477516 ?auto_477517 ) ) ( not ( = ?auto_477516 ?auto_477518 ) ) ( not ( = ?auto_477517 ?auto_477518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_477517 ?auto_477518 )
      ( !STACK ?auto_477517 ?auto_477516 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_477529 - BLOCK
      ?auto_477530 - BLOCK
      ?auto_477531 - BLOCK
    )
    :vars
    (
      ?auto_477532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477531 ?auto_477532 ) ( ON-TABLE ?auto_477529 ) ( not ( = ?auto_477529 ?auto_477530 ) ) ( not ( = ?auto_477529 ?auto_477531 ) ) ( not ( = ?auto_477529 ?auto_477532 ) ) ( not ( = ?auto_477530 ?auto_477531 ) ) ( not ( = ?auto_477530 ?auto_477532 ) ) ( not ( = ?auto_477531 ?auto_477532 ) ) ( CLEAR ?auto_477529 ) ( ON ?auto_477530 ?auto_477531 ) ( CLEAR ?auto_477530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_477529 ?auto_477530 )
      ( MAKE-3PILE ?auto_477529 ?auto_477530 ?auto_477531 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_477543 - BLOCK
      ?auto_477544 - BLOCK
      ?auto_477545 - BLOCK
    )
    :vars
    (
      ?auto_477546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477545 ?auto_477546 ) ( not ( = ?auto_477543 ?auto_477544 ) ) ( not ( = ?auto_477543 ?auto_477545 ) ) ( not ( = ?auto_477543 ?auto_477546 ) ) ( not ( = ?auto_477544 ?auto_477545 ) ) ( not ( = ?auto_477544 ?auto_477546 ) ) ( not ( = ?auto_477545 ?auto_477546 ) ) ( ON ?auto_477544 ?auto_477545 ) ( ON ?auto_477543 ?auto_477544 ) ( CLEAR ?auto_477543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_477543 )
      ( MAKE-3PILE ?auto_477543 ?auto_477544 ?auto_477545 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_477558 - BLOCK
      ?auto_477559 - BLOCK
      ?auto_477560 - BLOCK
      ?auto_477561 - BLOCK
    )
    :vars
    (
      ?auto_477562 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_477560 ) ( ON ?auto_477561 ?auto_477562 ) ( CLEAR ?auto_477561 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_477558 ) ( ON ?auto_477559 ?auto_477558 ) ( ON ?auto_477560 ?auto_477559 ) ( not ( = ?auto_477558 ?auto_477559 ) ) ( not ( = ?auto_477558 ?auto_477560 ) ) ( not ( = ?auto_477558 ?auto_477561 ) ) ( not ( = ?auto_477558 ?auto_477562 ) ) ( not ( = ?auto_477559 ?auto_477560 ) ) ( not ( = ?auto_477559 ?auto_477561 ) ) ( not ( = ?auto_477559 ?auto_477562 ) ) ( not ( = ?auto_477560 ?auto_477561 ) ) ( not ( = ?auto_477560 ?auto_477562 ) ) ( not ( = ?auto_477561 ?auto_477562 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_477561 ?auto_477562 )
      ( !STACK ?auto_477561 ?auto_477560 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_477576 - BLOCK
      ?auto_477577 - BLOCK
      ?auto_477578 - BLOCK
      ?auto_477579 - BLOCK
    )
    :vars
    (
      ?auto_477580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477579 ?auto_477580 ) ( ON-TABLE ?auto_477576 ) ( ON ?auto_477577 ?auto_477576 ) ( not ( = ?auto_477576 ?auto_477577 ) ) ( not ( = ?auto_477576 ?auto_477578 ) ) ( not ( = ?auto_477576 ?auto_477579 ) ) ( not ( = ?auto_477576 ?auto_477580 ) ) ( not ( = ?auto_477577 ?auto_477578 ) ) ( not ( = ?auto_477577 ?auto_477579 ) ) ( not ( = ?auto_477577 ?auto_477580 ) ) ( not ( = ?auto_477578 ?auto_477579 ) ) ( not ( = ?auto_477578 ?auto_477580 ) ) ( not ( = ?auto_477579 ?auto_477580 ) ) ( CLEAR ?auto_477577 ) ( ON ?auto_477578 ?auto_477579 ) ( CLEAR ?auto_477578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_477576 ?auto_477577 ?auto_477578 )
      ( MAKE-4PILE ?auto_477576 ?auto_477577 ?auto_477578 ?auto_477579 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_477594 - BLOCK
      ?auto_477595 - BLOCK
      ?auto_477596 - BLOCK
      ?auto_477597 - BLOCK
    )
    :vars
    (
      ?auto_477598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477597 ?auto_477598 ) ( ON-TABLE ?auto_477594 ) ( not ( = ?auto_477594 ?auto_477595 ) ) ( not ( = ?auto_477594 ?auto_477596 ) ) ( not ( = ?auto_477594 ?auto_477597 ) ) ( not ( = ?auto_477594 ?auto_477598 ) ) ( not ( = ?auto_477595 ?auto_477596 ) ) ( not ( = ?auto_477595 ?auto_477597 ) ) ( not ( = ?auto_477595 ?auto_477598 ) ) ( not ( = ?auto_477596 ?auto_477597 ) ) ( not ( = ?auto_477596 ?auto_477598 ) ) ( not ( = ?auto_477597 ?auto_477598 ) ) ( ON ?auto_477596 ?auto_477597 ) ( CLEAR ?auto_477594 ) ( ON ?auto_477595 ?auto_477596 ) ( CLEAR ?auto_477595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_477594 ?auto_477595 )
      ( MAKE-4PILE ?auto_477594 ?auto_477595 ?auto_477596 ?auto_477597 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_477612 - BLOCK
      ?auto_477613 - BLOCK
      ?auto_477614 - BLOCK
      ?auto_477615 - BLOCK
    )
    :vars
    (
      ?auto_477616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477615 ?auto_477616 ) ( not ( = ?auto_477612 ?auto_477613 ) ) ( not ( = ?auto_477612 ?auto_477614 ) ) ( not ( = ?auto_477612 ?auto_477615 ) ) ( not ( = ?auto_477612 ?auto_477616 ) ) ( not ( = ?auto_477613 ?auto_477614 ) ) ( not ( = ?auto_477613 ?auto_477615 ) ) ( not ( = ?auto_477613 ?auto_477616 ) ) ( not ( = ?auto_477614 ?auto_477615 ) ) ( not ( = ?auto_477614 ?auto_477616 ) ) ( not ( = ?auto_477615 ?auto_477616 ) ) ( ON ?auto_477614 ?auto_477615 ) ( ON ?auto_477613 ?auto_477614 ) ( ON ?auto_477612 ?auto_477613 ) ( CLEAR ?auto_477612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_477612 )
      ( MAKE-4PILE ?auto_477612 ?auto_477613 ?auto_477614 ?auto_477615 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_477631 - BLOCK
      ?auto_477632 - BLOCK
      ?auto_477633 - BLOCK
      ?auto_477634 - BLOCK
      ?auto_477635 - BLOCK
    )
    :vars
    (
      ?auto_477636 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_477634 ) ( ON ?auto_477635 ?auto_477636 ) ( CLEAR ?auto_477635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_477631 ) ( ON ?auto_477632 ?auto_477631 ) ( ON ?auto_477633 ?auto_477632 ) ( ON ?auto_477634 ?auto_477633 ) ( not ( = ?auto_477631 ?auto_477632 ) ) ( not ( = ?auto_477631 ?auto_477633 ) ) ( not ( = ?auto_477631 ?auto_477634 ) ) ( not ( = ?auto_477631 ?auto_477635 ) ) ( not ( = ?auto_477631 ?auto_477636 ) ) ( not ( = ?auto_477632 ?auto_477633 ) ) ( not ( = ?auto_477632 ?auto_477634 ) ) ( not ( = ?auto_477632 ?auto_477635 ) ) ( not ( = ?auto_477632 ?auto_477636 ) ) ( not ( = ?auto_477633 ?auto_477634 ) ) ( not ( = ?auto_477633 ?auto_477635 ) ) ( not ( = ?auto_477633 ?auto_477636 ) ) ( not ( = ?auto_477634 ?auto_477635 ) ) ( not ( = ?auto_477634 ?auto_477636 ) ) ( not ( = ?auto_477635 ?auto_477636 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_477635 ?auto_477636 )
      ( !STACK ?auto_477635 ?auto_477634 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_477653 - BLOCK
      ?auto_477654 - BLOCK
      ?auto_477655 - BLOCK
      ?auto_477656 - BLOCK
      ?auto_477657 - BLOCK
    )
    :vars
    (
      ?auto_477658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477657 ?auto_477658 ) ( ON-TABLE ?auto_477653 ) ( ON ?auto_477654 ?auto_477653 ) ( ON ?auto_477655 ?auto_477654 ) ( not ( = ?auto_477653 ?auto_477654 ) ) ( not ( = ?auto_477653 ?auto_477655 ) ) ( not ( = ?auto_477653 ?auto_477656 ) ) ( not ( = ?auto_477653 ?auto_477657 ) ) ( not ( = ?auto_477653 ?auto_477658 ) ) ( not ( = ?auto_477654 ?auto_477655 ) ) ( not ( = ?auto_477654 ?auto_477656 ) ) ( not ( = ?auto_477654 ?auto_477657 ) ) ( not ( = ?auto_477654 ?auto_477658 ) ) ( not ( = ?auto_477655 ?auto_477656 ) ) ( not ( = ?auto_477655 ?auto_477657 ) ) ( not ( = ?auto_477655 ?auto_477658 ) ) ( not ( = ?auto_477656 ?auto_477657 ) ) ( not ( = ?auto_477656 ?auto_477658 ) ) ( not ( = ?auto_477657 ?auto_477658 ) ) ( CLEAR ?auto_477655 ) ( ON ?auto_477656 ?auto_477657 ) ( CLEAR ?auto_477656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_477653 ?auto_477654 ?auto_477655 ?auto_477656 )
      ( MAKE-5PILE ?auto_477653 ?auto_477654 ?auto_477655 ?auto_477656 ?auto_477657 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_477675 - BLOCK
      ?auto_477676 - BLOCK
      ?auto_477677 - BLOCK
      ?auto_477678 - BLOCK
      ?auto_477679 - BLOCK
    )
    :vars
    (
      ?auto_477680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477679 ?auto_477680 ) ( ON-TABLE ?auto_477675 ) ( ON ?auto_477676 ?auto_477675 ) ( not ( = ?auto_477675 ?auto_477676 ) ) ( not ( = ?auto_477675 ?auto_477677 ) ) ( not ( = ?auto_477675 ?auto_477678 ) ) ( not ( = ?auto_477675 ?auto_477679 ) ) ( not ( = ?auto_477675 ?auto_477680 ) ) ( not ( = ?auto_477676 ?auto_477677 ) ) ( not ( = ?auto_477676 ?auto_477678 ) ) ( not ( = ?auto_477676 ?auto_477679 ) ) ( not ( = ?auto_477676 ?auto_477680 ) ) ( not ( = ?auto_477677 ?auto_477678 ) ) ( not ( = ?auto_477677 ?auto_477679 ) ) ( not ( = ?auto_477677 ?auto_477680 ) ) ( not ( = ?auto_477678 ?auto_477679 ) ) ( not ( = ?auto_477678 ?auto_477680 ) ) ( not ( = ?auto_477679 ?auto_477680 ) ) ( ON ?auto_477678 ?auto_477679 ) ( CLEAR ?auto_477676 ) ( ON ?auto_477677 ?auto_477678 ) ( CLEAR ?auto_477677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_477675 ?auto_477676 ?auto_477677 )
      ( MAKE-5PILE ?auto_477675 ?auto_477676 ?auto_477677 ?auto_477678 ?auto_477679 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_477697 - BLOCK
      ?auto_477698 - BLOCK
      ?auto_477699 - BLOCK
      ?auto_477700 - BLOCK
      ?auto_477701 - BLOCK
    )
    :vars
    (
      ?auto_477702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477701 ?auto_477702 ) ( ON-TABLE ?auto_477697 ) ( not ( = ?auto_477697 ?auto_477698 ) ) ( not ( = ?auto_477697 ?auto_477699 ) ) ( not ( = ?auto_477697 ?auto_477700 ) ) ( not ( = ?auto_477697 ?auto_477701 ) ) ( not ( = ?auto_477697 ?auto_477702 ) ) ( not ( = ?auto_477698 ?auto_477699 ) ) ( not ( = ?auto_477698 ?auto_477700 ) ) ( not ( = ?auto_477698 ?auto_477701 ) ) ( not ( = ?auto_477698 ?auto_477702 ) ) ( not ( = ?auto_477699 ?auto_477700 ) ) ( not ( = ?auto_477699 ?auto_477701 ) ) ( not ( = ?auto_477699 ?auto_477702 ) ) ( not ( = ?auto_477700 ?auto_477701 ) ) ( not ( = ?auto_477700 ?auto_477702 ) ) ( not ( = ?auto_477701 ?auto_477702 ) ) ( ON ?auto_477700 ?auto_477701 ) ( ON ?auto_477699 ?auto_477700 ) ( CLEAR ?auto_477697 ) ( ON ?auto_477698 ?auto_477699 ) ( CLEAR ?auto_477698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_477697 ?auto_477698 )
      ( MAKE-5PILE ?auto_477697 ?auto_477698 ?auto_477699 ?auto_477700 ?auto_477701 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_477719 - BLOCK
      ?auto_477720 - BLOCK
      ?auto_477721 - BLOCK
      ?auto_477722 - BLOCK
      ?auto_477723 - BLOCK
    )
    :vars
    (
      ?auto_477724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477723 ?auto_477724 ) ( not ( = ?auto_477719 ?auto_477720 ) ) ( not ( = ?auto_477719 ?auto_477721 ) ) ( not ( = ?auto_477719 ?auto_477722 ) ) ( not ( = ?auto_477719 ?auto_477723 ) ) ( not ( = ?auto_477719 ?auto_477724 ) ) ( not ( = ?auto_477720 ?auto_477721 ) ) ( not ( = ?auto_477720 ?auto_477722 ) ) ( not ( = ?auto_477720 ?auto_477723 ) ) ( not ( = ?auto_477720 ?auto_477724 ) ) ( not ( = ?auto_477721 ?auto_477722 ) ) ( not ( = ?auto_477721 ?auto_477723 ) ) ( not ( = ?auto_477721 ?auto_477724 ) ) ( not ( = ?auto_477722 ?auto_477723 ) ) ( not ( = ?auto_477722 ?auto_477724 ) ) ( not ( = ?auto_477723 ?auto_477724 ) ) ( ON ?auto_477722 ?auto_477723 ) ( ON ?auto_477721 ?auto_477722 ) ( ON ?auto_477720 ?auto_477721 ) ( ON ?auto_477719 ?auto_477720 ) ( CLEAR ?auto_477719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_477719 )
      ( MAKE-5PILE ?auto_477719 ?auto_477720 ?auto_477721 ?auto_477722 ?auto_477723 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_477742 - BLOCK
      ?auto_477743 - BLOCK
      ?auto_477744 - BLOCK
      ?auto_477745 - BLOCK
      ?auto_477746 - BLOCK
      ?auto_477747 - BLOCK
    )
    :vars
    (
      ?auto_477748 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_477746 ) ( ON ?auto_477747 ?auto_477748 ) ( CLEAR ?auto_477747 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_477742 ) ( ON ?auto_477743 ?auto_477742 ) ( ON ?auto_477744 ?auto_477743 ) ( ON ?auto_477745 ?auto_477744 ) ( ON ?auto_477746 ?auto_477745 ) ( not ( = ?auto_477742 ?auto_477743 ) ) ( not ( = ?auto_477742 ?auto_477744 ) ) ( not ( = ?auto_477742 ?auto_477745 ) ) ( not ( = ?auto_477742 ?auto_477746 ) ) ( not ( = ?auto_477742 ?auto_477747 ) ) ( not ( = ?auto_477742 ?auto_477748 ) ) ( not ( = ?auto_477743 ?auto_477744 ) ) ( not ( = ?auto_477743 ?auto_477745 ) ) ( not ( = ?auto_477743 ?auto_477746 ) ) ( not ( = ?auto_477743 ?auto_477747 ) ) ( not ( = ?auto_477743 ?auto_477748 ) ) ( not ( = ?auto_477744 ?auto_477745 ) ) ( not ( = ?auto_477744 ?auto_477746 ) ) ( not ( = ?auto_477744 ?auto_477747 ) ) ( not ( = ?auto_477744 ?auto_477748 ) ) ( not ( = ?auto_477745 ?auto_477746 ) ) ( not ( = ?auto_477745 ?auto_477747 ) ) ( not ( = ?auto_477745 ?auto_477748 ) ) ( not ( = ?auto_477746 ?auto_477747 ) ) ( not ( = ?auto_477746 ?auto_477748 ) ) ( not ( = ?auto_477747 ?auto_477748 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_477747 ?auto_477748 )
      ( !STACK ?auto_477747 ?auto_477746 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_477768 - BLOCK
      ?auto_477769 - BLOCK
      ?auto_477770 - BLOCK
      ?auto_477771 - BLOCK
      ?auto_477772 - BLOCK
      ?auto_477773 - BLOCK
    )
    :vars
    (
      ?auto_477774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477773 ?auto_477774 ) ( ON-TABLE ?auto_477768 ) ( ON ?auto_477769 ?auto_477768 ) ( ON ?auto_477770 ?auto_477769 ) ( ON ?auto_477771 ?auto_477770 ) ( not ( = ?auto_477768 ?auto_477769 ) ) ( not ( = ?auto_477768 ?auto_477770 ) ) ( not ( = ?auto_477768 ?auto_477771 ) ) ( not ( = ?auto_477768 ?auto_477772 ) ) ( not ( = ?auto_477768 ?auto_477773 ) ) ( not ( = ?auto_477768 ?auto_477774 ) ) ( not ( = ?auto_477769 ?auto_477770 ) ) ( not ( = ?auto_477769 ?auto_477771 ) ) ( not ( = ?auto_477769 ?auto_477772 ) ) ( not ( = ?auto_477769 ?auto_477773 ) ) ( not ( = ?auto_477769 ?auto_477774 ) ) ( not ( = ?auto_477770 ?auto_477771 ) ) ( not ( = ?auto_477770 ?auto_477772 ) ) ( not ( = ?auto_477770 ?auto_477773 ) ) ( not ( = ?auto_477770 ?auto_477774 ) ) ( not ( = ?auto_477771 ?auto_477772 ) ) ( not ( = ?auto_477771 ?auto_477773 ) ) ( not ( = ?auto_477771 ?auto_477774 ) ) ( not ( = ?auto_477772 ?auto_477773 ) ) ( not ( = ?auto_477772 ?auto_477774 ) ) ( not ( = ?auto_477773 ?auto_477774 ) ) ( CLEAR ?auto_477771 ) ( ON ?auto_477772 ?auto_477773 ) ( CLEAR ?auto_477772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_477768 ?auto_477769 ?auto_477770 ?auto_477771 ?auto_477772 )
      ( MAKE-6PILE ?auto_477768 ?auto_477769 ?auto_477770 ?auto_477771 ?auto_477772 ?auto_477773 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_477794 - BLOCK
      ?auto_477795 - BLOCK
      ?auto_477796 - BLOCK
      ?auto_477797 - BLOCK
      ?auto_477798 - BLOCK
      ?auto_477799 - BLOCK
    )
    :vars
    (
      ?auto_477800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477799 ?auto_477800 ) ( ON-TABLE ?auto_477794 ) ( ON ?auto_477795 ?auto_477794 ) ( ON ?auto_477796 ?auto_477795 ) ( not ( = ?auto_477794 ?auto_477795 ) ) ( not ( = ?auto_477794 ?auto_477796 ) ) ( not ( = ?auto_477794 ?auto_477797 ) ) ( not ( = ?auto_477794 ?auto_477798 ) ) ( not ( = ?auto_477794 ?auto_477799 ) ) ( not ( = ?auto_477794 ?auto_477800 ) ) ( not ( = ?auto_477795 ?auto_477796 ) ) ( not ( = ?auto_477795 ?auto_477797 ) ) ( not ( = ?auto_477795 ?auto_477798 ) ) ( not ( = ?auto_477795 ?auto_477799 ) ) ( not ( = ?auto_477795 ?auto_477800 ) ) ( not ( = ?auto_477796 ?auto_477797 ) ) ( not ( = ?auto_477796 ?auto_477798 ) ) ( not ( = ?auto_477796 ?auto_477799 ) ) ( not ( = ?auto_477796 ?auto_477800 ) ) ( not ( = ?auto_477797 ?auto_477798 ) ) ( not ( = ?auto_477797 ?auto_477799 ) ) ( not ( = ?auto_477797 ?auto_477800 ) ) ( not ( = ?auto_477798 ?auto_477799 ) ) ( not ( = ?auto_477798 ?auto_477800 ) ) ( not ( = ?auto_477799 ?auto_477800 ) ) ( ON ?auto_477798 ?auto_477799 ) ( CLEAR ?auto_477796 ) ( ON ?auto_477797 ?auto_477798 ) ( CLEAR ?auto_477797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_477794 ?auto_477795 ?auto_477796 ?auto_477797 )
      ( MAKE-6PILE ?auto_477794 ?auto_477795 ?auto_477796 ?auto_477797 ?auto_477798 ?auto_477799 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_477820 - BLOCK
      ?auto_477821 - BLOCK
      ?auto_477822 - BLOCK
      ?auto_477823 - BLOCK
      ?auto_477824 - BLOCK
      ?auto_477825 - BLOCK
    )
    :vars
    (
      ?auto_477826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477825 ?auto_477826 ) ( ON-TABLE ?auto_477820 ) ( ON ?auto_477821 ?auto_477820 ) ( not ( = ?auto_477820 ?auto_477821 ) ) ( not ( = ?auto_477820 ?auto_477822 ) ) ( not ( = ?auto_477820 ?auto_477823 ) ) ( not ( = ?auto_477820 ?auto_477824 ) ) ( not ( = ?auto_477820 ?auto_477825 ) ) ( not ( = ?auto_477820 ?auto_477826 ) ) ( not ( = ?auto_477821 ?auto_477822 ) ) ( not ( = ?auto_477821 ?auto_477823 ) ) ( not ( = ?auto_477821 ?auto_477824 ) ) ( not ( = ?auto_477821 ?auto_477825 ) ) ( not ( = ?auto_477821 ?auto_477826 ) ) ( not ( = ?auto_477822 ?auto_477823 ) ) ( not ( = ?auto_477822 ?auto_477824 ) ) ( not ( = ?auto_477822 ?auto_477825 ) ) ( not ( = ?auto_477822 ?auto_477826 ) ) ( not ( = ?auto_477823 ?auto_477824 ) ) ( not ( = ?auto_477823 ?auto_477825 ) ) ( not ( = ?auto_477823 ?auto_477826 ) ) ( not ( = ?auto_477824 ?auto_477825 ) ) ( not ( = ?auto_477824 ?auto_477826 ) ) ( not ( = ?auto_477825 ?auto_477826 ) ) ( ON ?auto_477824 ?auto_477825 ) ( ON ?auto_477823 ?auto_477824 ) ( CLEAR ?auto_477821 ) ( ON ?auto_477822 ?auto_477823 ) ( CLEAR ?auto_477822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_477820 ?auto_477821 ?auto_477822 )
      ( MAKE-6PILE ?auto_477820 ?auto_477821 ?auto_477822 ?auto_477823 ?auto_477824 ?auto_477825 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_477846 - BLOCK
      ?auto_477847 - BLOCK
      ?auto_477848 - BLOCK
      ?auto_477849 - BLOCK
      ?auto_477850 - BLOCK
      ?auto_477851 - BLOCK
    )
    :vars
    (
      ?auto_477852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477851 ?auto_477852 ) ( ON-TABLE ?auto_477846 ) ( not ( = ?auto_477846 ?auto_477847 ) ) ( not ( = ?auto_477846 ?auto_477848 ) ) ( not ( = ?auto_477846 ?auto_477849 ) ) ( not ( = ?auto_477846 ?auto_477850 ) ) ( not ( = ?auto_477846 ?auto_477851 ) ) ( not ( = ?auto_477846 ?auto_477852 ) ) ( not ( = ?auto_477847 ?auto_477848 ) ) ( not ( = ?auto_477847 ?auto_477849 ) ) ( not ( = ?auto_477847 ?auto_477850 ) ) ( not ( = ?auto_477847 ?auto_477851 ) ) ( not ( = ?auto_477847 ?auto_477852 ) ) ( not ( = ?auto_477848 ?auto_477849 ) ) ( not ( = ?auto_477848 ?auto_477850 ) ) ( not ( = ?auto_477848 ?auto_477851 ) ) ( not ( = ?auto_477848 ?auto_477852 ) ) ( not ( = ?auto_477849 ?auto_477850 ) ) ( not ( = ?auto_477849 ?auto_477851 ) ) ( not ( = ?auto_477849 ?auto_477852 ) ) ( not ( = ?auto_477850 ?auto_477851 ) ) ( not ( = ?auto_477850 ?auto_477852 ) ) ( not ( = ?auto_477851 ?auto_477852 ) ) ( ON ?auto_477850 ?auto_477851 ) ( ON ?auto_477849 ?auto_477850 ) ( ON ?auto_477848 ?auto_477849 ) ( CLEAR ?auto_477846 ) ( ON ?auto_477847 ?auto_477848 ) ( CLEAR ?auto_477847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_477846 ?auto_477847 )
      ( MAKE-6PILE ?auto_477846 ?auto_477847 ?auto_477848 ?auto_477849 ?auto_477850 ?auto_477851 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_477872 - BLOCK
      ?auto_477873 - BLOCK
      ?auto_477874 - BLOCK
      ?auto_477875 - BLOCK
      ?auto_477876 - BLOCK
      ?auto_477877 - BLOCK
    )
    :vars
    (
      ?auto_477878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477877 ?auto_477878 ) ( not ( = ?auto_477872 ?auto_477873 ) ) ( not ( = ?auto_477872 ?auto_477874 ) ) ( not ( = ?auto_477872 ?auto_477875 ) ) ( not ( = ?auto_477872 ?auto_477876 ) ) ( not ( = ?auto_477872 ?auto_477877 ) ) ( not ( = ?auto_477872 ?auto_477878 ) ) ( not ( = ?auto_477873 ?auto_477874 ) ) ( not ( = ?auto_477873 ?auto_477875 ) ) ( not ( = ?auto_477873 ?auto_477876 ) ) ( not ( = ?auto_477873 ?auto_477877 ) ) ( not ( = ?auto_477873 ?auto_477878 ) ) ( not ( = ?auto_477874 ?auto_477875 ) ) ( not ( = ?auto_477874 ?auto_477876 ) ) ( not ( = ?auto_477874 ?auto_477877 ) ) ( not ( = ?auto_477874 ?auto_477878 ) ) ( not ( = ?auto_477875 ?auto_477876 ) ) ( not ( = ?auto_477875 ?auto_477877 ) ) ( not ( = ?auto_477875 ?auto_477878 ) ) ( not ( = ?auto_477876 ?auto_477877 ) ) ( not ( = ?auto_477876 ?auto_477878 ) ) ( not ( = ?auto_477877 ?auto_477878 ) ) ( ON ?auto_477876 ?auto_477877 ) ( ON ?auto_477875 ?auto_477876 ) ( ON ?auto_477874 ?auto_477875 ) ( ON ?auto_477873 ?auto_477874 ) ( ON ?auto_477872 ?auto_477873 ) ( CLEAR ?auto_477872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_477872 )
      ( MAKE-6PILE ?auto_477872 ?auto_477873 ?auto_477874 ?auto_477875 ?auto_477876 ?auto_477877 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_477899 - BLOCK
      ?auto_477900 - BLOCK
      ?auto_477901 - BLOCK
      ?auto_477902 - BLOCK
      ?auto_477903 - BLOCK
      ?auto_477904 - BLOCK
      ?auto_477905 - BLOCK
    )
    :vars
    (
      ?auto_477906 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_477904 ) ( ON ?auto_477905 ?auto_477906 ) ( CLEAR ?auto_477905 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_477899 ) ( ON ?auto_477900 ?auto_477899 ) ( ON ?auto_477901 ?auto_477900 ) ( ON ?auto_477902 ?auto_477901 ) ( ON ?auto_477903 ?auto_477902 ) ( ON ?auto_477904 ?auto_477903 ) ( not ( = ?auto_477899 ?auto_477900 ) ) ( not ( = ?auto_477899 ?auto_477901 ) ) ( not ( = ?auto_477899 ?auto_477902 ) ) ( not ( = ?auto_477899 ?auto_477903 ) ) ( not ( = ?auto_477899 ?auto_477904 ) ) ( not ( = ?auto_477899 ?auto_477905 ) ) ( not ( = ?auto_477899 ?auto_477906 ) ) ( not ( = ?auto_477900 ?auto_477901 ) ) ( not ( = ?auto_477900 ?auto_477902 ) ) ( not ( = ?auto_477900 ?auto_477903 ) ) ( not ( = ?auto_477900 ?auto_477904 ) ) ( not ( = ?auto_477900 ?auto_477905 ) ) ( not ( = ?auto_477900 ?auto_477906 ) ) ( not ( = ?auto_477901 ?auto_477902 ) ) ( not ( = ?auto_477901 ?auto_477903 ) ) ( not ( = ?auto_477901 ?auto_477904 ) ) ( not ( = ?auto_477901 ?auto_477905 ) ) ( not ( = ?auto_477901 ?auto_477906 ) ) ( not ( = ?auto_477902 ?auto_477903 ) ) ( not ( = ?auto_477902 ?auto_477904 ) ) ( not ( = ?auto_477902 ?auto_477905 ) ) ( not ( = ?auto_477902 ?auto_477906 ) ) ( not ( = ?auto_477903 ?auto_477904 ) ) ( not ( = ?auto_477903 ?auto_477905 ) ) ( not ( = ?auto_477903 ?auto_477906 ) ) ( not ( = ?auto_477904 ?auto_477905 ) ) ( not ( = ?auto_477904 ?auto_477906 ) ) ( not ( = ?auto_477905 ?auto_477906 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_477905 ?auto_477906 )
      ( !STACK ?auto_477905 ?auto_477904 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_477929 - BLOCK
      ?auto_477930 - BLOCK
      ?auto_477931 - BLOCK
      ?auto_477932 - BLOCK
      ?auto_477933 - BLOCK
      ?auto_477934 - BLOCK
      ?auto_477935 - BLOCK
    )
    :vars
    (
      ?auto_477936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477935 ?auto_477936 ) ( ON-TABLE ?auto_477929 ) ( ON ?auto_477930 ?auto_477929 ) ( ON ?auto_477931 ?auto_477930 ) ( ON ?auto_477932 ?auto_477931 ) ( ON ?auto_477933 ?auto_477932 ) ( not ( = ?auto_477929 ?auto_477930 ) ) ( not ( = ?auto_477929 ?auto_477931 ) ) ( not ( = ?auto_477929 ?auto_477932 ) ) ( not ( = ?auto_477929 ?auto_477933 ) ) ( not ( = ?auto_477929 ?auto_477934 ) ) ( not ( = ?auto_477929 ?auto_477935 ) ) ( not ( = ?auto_477929 ?auto_477936 ) ) ( not ( = ?auto_477930 ?auto_477931 ) ) ( not ( = ?auto_477930 ?auto_477932 ) ) ( not ( = ?auto_477930 ?auto_477933 ) ) ( not ( = ?auto_477930 ?auto_477934 ) ) ( not ( = ?auto_477930 ?auto_477935 ) ) ( not ( = ?auto_477930 ?auto_477936 ) ) ( not ( = ?auto_477931 ?auto_477932 ) ) ( not ( = ?auto_477931 ?auto_477933 ) ) ( not ( = ?auto_477931 ?auto_477934 ) ) ( not ( = ?auto_477931 ?auto_477935 ) ) ( not ( = ?auto_477931 ?auto_477936 ) ) ( not ( = ?auto_477932 ?auto_477933 ) ) ( not ( = ?auto_477932 ?auto_477934 ) ) ( not ( = ?auto_477932 ?auto_477935 ) ) ( not ( = ?auto_477932 ?auto_477936 ) ) ( not ( = ?auto_477933 ?auto_477934 ) ) ( not ( = ?auto_477933 ?auto_477935 ) ) ( not ( = ?auto_477933 ?auto_477936 ) ) ( not ( = ?auto_477934 ?auto_477935 ) ) ( not ( = ?auto_477934 ?auto_477936 ) ) ( not ( = ?auto_477935 ?auto_477936 ) ) ( CLEAR ?auto_477933 ) ( ON ?auto_477934 ?auto_477935 ) ( CLEAR ?auto_477934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_477929 ?auto_477930 ?auto_477931 ?auto_477932 ?auto_477933 ?auto_477934 )
      ( MAKE-7PILE ?auto_477929 ?auto_477930 ?auto_477931 ?auto_477932 ?auto_477933 ?auto_477934 ?auto_477935 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_477959 - BLOCK
      ?auto_477960 - BLOCK
      ?auto_477961 - BLOCK
      ?auto_477962 - BLOCK
      ?auto_477963 - BLOCK
      ?auto_477964 - BLOCK
      ?auto_477965 - BLOCK
    )
    :vars
    (
      ?auto_477966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477965 ?auto_477966 ) ( ON-TABLE ?auto_477959 ) ( ON ?auto_477960 ?auto_477959 ) ( ON ?auto_477961 ?auto_477960 ) ( ON ?auto_477962 ?auto_477961 ) ( not ( = ?auto_477959 ?auto_477960 ) ) ( not ( = ?auto_477959 ?auto_477961 ) ) ( not ( = ?auto_477959 ?auto_477962 ) ) ( not ( = ?auto_477959 ?auto_477963 ) ) ( not ( = ?auto_477959 ?auto_477964 ) ) ( not ( = ?auto_477959 ?auto_477965 ) ) ( not ( = ?auto_477959 ?auto_477966 ) ) ( not ( = ?auto_477960 ?auto_477961 ) ) ( not ( = ?auto_477960 ?auto_477962 ) ) ( not ( = ?auto_477960 ?auto_477963 ) ) ( not ( = ?auto_477960 ?auto_477964 ) ) ( not ( = ?auto_477960 ?auto_477965 ) ) ( not ( = ?auto_477960 ?auto_477966 ) ) ( not ( = ?auto_477961 ?auto_477962 ) ) ( not ( = ?auto_477961 ?auto_477963 ) ) ( not ( = ?auto_477961 ?auto_477964 ) ) ( not ( = ?auto_477961 ?auto_477965 ) ) ( not ( = ?auto_477961 ?auto_477966 ) ) ( not ( = ?auto_477962 ?auto_477963 ) ) ( not ( = ?auto_477962 ?auto_477964 ) ) ( not ( = ?auto_477962 ?auto_477965 ) ) ( not ( = ?auto_477962 ?auto_477966 ) ) ( not ( = ?auto_477963 ?auto_477964 ) ) ( not ( = ?auto_477963 ?auto_477965 ) ) ( not ( = ?auto_477963 ?auto_477966 ) ) ( not ( = ?auto_477964 ?auto_477965 ) ) ( not ( = ?auto_477964 ?auto_477966 ) ) ( not ( = ?auto_477965 ?auto_477966 ) ) ( ON ?auto_477964 ?auto_477965 ) ( CLEAR ?auto_477962 ) ( ON ?auto_477963 ?auto_477964 ) ( CLEAR ?auto_477963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_477959 ?auto_477960 ?auto_477961 ?auto_477962 ?auto_477963 )
      ( MAKE-7PILE ?auto_477959 ?auto_477960 ?auto_477961 ?auto_477962 ?auto_477963 ?auto_477964 ?auto_477965 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_477989 - BLOCK
      ?auto_477990 - BLOCK
      ?auto_477991 - BLOCK
      ?auto_477992 - BLOCK
      ?auto_477993 - BLOCK
      ?auto_477994 - BLOCK
      ?auto_477995 - BLOCK
    )
    :vars
    (
      ?auto_477996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477995 ?auto_477996 ) ( ON-TABLE ?auto_477989 ) ( ON ?auto_477990 ?auto_477989 ) ( ON ?auto_477991 ?auto_477990 ) ( not ( = ?auto_477989 ?auto_477990 ) ) ( not ( = ?auto_477989 ?auto_477991 ) ) ( not ( = ?auto_477989 ?auto_477992 ) ) ( not ( = ?auto_477989 ?auto_477993 ) ) ( not ( = ?auto_477989 ?auto_477994 ) ) ( not ( = ?auto_477989 ?auto_477995 ) ) ( not ( = ?auto_477989 ?auto_477996 ) ) ( not ( = ?auto_477990 ?auto_477991 ) ) ( not ( = ?auto_477990 ?auto_477992 ) ) ( not ( = ?auto_477990 ?auto_477993 ) ) ( not ( = ?auto_477990 ?auto_477994 ) ) ( not ( = ?auto_477990 ?auto_477995 ) ) ( not ( = ?auto_477990 ?auto_477996 ) ) ( not ( = ?auto_477991 ?auto_477992 ) ) ( not ( = ?auto_477991 ?auto_477993 ) ) ( not ( = ?auto_477991 ?auto_477994 ) ) ( not ( = ?auto_477991 ?auto_477995 ) ) ( not ( = ?auto_477991 ?auto_477996 ) ) ( not ( = ?auto_477992 ?auto_477993 ) ) ( not ( = ?auto_477992 ?auto_477994 ) ) ( not ( = ?auto_477992 ?auto_477995 ) ) ( not ( = ?auto_477992 ?auto_477996 ) ) ( not ( = ?auto_477993 ?auto_477994 ) ) ( not ( = ?auto_477993 ?auto_477995 ) ) ( not ( = ?auto_477993 ?auto_477996 ) ) ( not ( = ?auto_477994 ?auto_477995 ) ) ( not ( = ?auto_477994 ?auto_477996 ) ) ( not ( = ?auto_477995 ?auto_477996 ) ) ( ON ?auto_477994 ?auto_477995 ) ( ON ?auto_477993 ?auto_477994 ) ( CLEAR ?auto_477991 ) ( ON ?auto_477992 ?auto_477993 ) ( CLEAR ?auto_477992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_477989 ?auto_477990 ?auto_477991 ?auto_477992 )
      ( MAKE-7PILE ?auto_477989 ?auto_477990 ?auto_477991 ?auto_477992 ?auto_477993 ?auto_477994 ?auto_477995 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_478019 - BLOCK
      ?auto_478020 - BLOCK
      ?auto_478021 - BLOCK
      ?auto_478022 - BLOCK
      ?auto_478023 - BLOCK
      ?auto_478024 - BLOCK
      ?auto_478025 - BLOCK
    )
    :vars
    (
      ?auto_478026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478025 ?auto_478026 ) ( ON-TABLE ?auto_478019 ) ( ON ?auto_478020 ?auto_478019 ) ( not ( = ?auto_478019 ?auto_478020 ) ) ( not ( = ?auto_478019 ?auto_478021 ) ) ( not ( = ?auto_478019 ?auto_478022 ) ) ( not ( = ?auto_478019 ?auto_478023 ) ) ( not ( = ?auto_478019 ?auto_478024 ) ) ( not ( = ?auto_478019 ?auto_478025 ) ) ( not ( = ?auto_478019 ?auto_478026 ) ) ( not ( = ?auto_478020 ?auto_478021 ) ) ( not ( = ?auto_478020 ?auto_478022 ) ) ( not ( = ?auto_478020 ?auto_478023 ) ) ( not ( = ?auto_478020 ?auto_478024 ) ) ( not ( = ?auto_478020 ?auto_478025 ) ) ( not ( = ?auto_478020 ?auto_478026 ) ) ( not ( = ?auto_478021 ?auto_478022 ) ) ( not ( = ?auto_478021 ?auto_478023 ) ) ( not ( = ?auto_478021 ?auto_478024 ) ) ( not ( = ?auto_478021 ?auto_478025 ) ) ( not ( = ?auto_478021 ?auto_478026 ) ) ( not ( = ?auto_478022 ?auto_478023 ) ) ( not ( = ?auto_478022 ?auto_478024 ) ) ( not ( = ?auto_478022 ?auto_478025 ) ) ( not ( = ?auto_478022 ?auto_478026 ) ) ( not ( = ?auto_478023 ?auto_478024 ) ) ( not ( = ?auto_478023 ?auto_478025 ) ) ( not ( = ?auto_478023 ?auto_478026 ) ) ( not ( = ?auto_478024 ?auto_478025 ) ) ( not ( = ?auto_478024 ?auto_478026 ) ) ( not ( = ?auto_478025 ?auto_478026 ) ) ( ON ?auto_478024 ?auto_478025 ) ( ON ?auto_478023 ?auto_478024 ) ( ON ?auto_478022 ?auto_478023 ) ( CLEAR ?auto_478020 ) ( ON ?auto_478021 ?auto_478022 ) ( CLEAR ?auto_478021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_478019 ?auto_478020 ?auto_478021 )
      ( MAKE-7PILE ?auto_478019 ?auto_478020 ?auto_478021 ?auto_478022 ?auto_478023 ?auto_478024 ?auto_478025 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_478049 - BLOCK
      ?auto_478050 - BLOCK
      ?auto_478051 - BLOCK
      ?auto_478052 - BLOCK
      ?auto_478053 - BLOCK
      ?auto_478054 - BLOCK
      ?auto_478055 - BLOCK
    )
    :vars
    (
      ?auto_478056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478055 ?auto_478056 ) ( ON-TABLE ?auto_478049 ) ( not ( = ?auto_478049 ?auto_478050 ) ) ( not ( = ?auto_478049 ?auto_478051 ) ) ( not ( = ?auto_478049 ?auto_478052 ) ) ( not ( = ?auto_478049 ?auto_478053 ) ) ( not ( = ?auto_478049 ?auto_478054 ) ) ( not ( = ?auto_478049 ?auto_478055 ) ) ( not ( = ?auto_478049 ?auto_478056 ) ) ( not ( = ?auto_478050 ?auto_478051 ) ) ( not ( = ?auto_478050 ?auto_478052 ) ) ( not ( = ?auto_478050 ?auto_478053 ) ) ( not ( = ?auto_478050 ?auto_478054 ) ) ( not ( = ?auto_478050 ?auto_478055 ) ) ( not ( = ?auto_478050 ?auto_478056 ) ) ( not ( = ?auto_478051 ?auto_478052 ) ) ( not ( = ?auto_478051 ?auto_478053 ) ) ( not ( = ?auto_478051 ?auto_478054 ) ) ( not ( = ?auto_478051 ?auto_478055 ) ) ( not ( = ?auto_478051 ?auto_478056 ) ) ( not ( = ?auto_478052 ?auto_478053 ) ) ( not ( = ?auto_478052 ?auto_478054 ) ) ( not ( = ?auto_478052 ?auto_478055 ) ) ( not ( = ?auto_478052 ?auto_478056 ) ) ( not ( = ?auto_478053 ?auto_478054 ) ) ( not ( = ?auto_478053 ?auto_478055 ) ) ( not ( = ?auto_478053 ?auto_478056 ) ) ( not ( = ?auto_478054 ?auto_478055 ) ) ( not ( = ?auto_478054 ?auto_478056 ) ) ( not ( = ?auto_478055 ?auto_478056 ) ) ( ON ?auto_478054 ?auto_478055 ) ( ON ?auto_478053 ?auto_478054 ) ( ON ?auto_478052 ?auto_478053 ) ( ON ?auto_478051 ?auto_478052 ) ( CLEAR ?auto_478049 ) ( ON ?auto_478050 ?auto_478051 ) ( CLEAR ?auto_478050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_478049 ?auto_478050 )
      ( MAKE-7PILE ?auto_478049 ?auto_478050 ?auto_478051 ?auto_478052 ?auto_478053 ?auto_478054 ?auto_478055 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_478079 - BLOCK
      ?auto_478080 - BLOCK
      ?auto_478081 - BLOCK
      ?auto_478082 - BLOCK
      ?auto_478083 - BLOCK
      ?auto_478084 - BLOCK
      ?auto_478085 - BLOCK
    )
    :vars
    (
      ?auto_478086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478085 ?auto_478086 ) ( not ( = ?auto_478079 ?auto_478080 ) ) ( not ( = ?auto_478079 ?auto_478081 ) ) ( not ( = ?auto_478079 ?auto_478082 ) ) ( not ( = ?auto_478079 ?auto_478083 ) ) ( not ( = ?auto_478079 ?auto_478084 ) ) ( not ( = ?auto_478079 ?auto_478085 ) ) ( not ( = ?auto_478079 ?auto_478086 ) ) ( not ( = ?auto_478080 ?auto_478081 ) ) ( not ( = ?auto_478080 ?auto_478082 ) ) ( not ( = ?auto_478080 ?auto_478083 ) ) ( not ( = ?auto_478080 ?auto_478084 ) ) ( not ( = ?auto_478080 ?auto_478085 ) ) ( not ( = ?auto_478080 ?auto_478086 ) ) ( not ( = ?auto_478081 ?auto_478082 ) ) ( not ( = ?auto_478081 ?auto_478083 ) ) ( not ( = ?auto_478081 ?auto_478084 ) ) ( not ( = ?auto_478081 ?auto_478085 ) ) ( not ( = ?auto_478081 ?auto_478086 ) ) ( not ( = ?auto_478082 ?auto_478083 ) ) ( not ( = ?auto_478082 ?auto_478084 ) ) ( not ( = ?auto_478082 ?auto_478085 ) ) ( not ( = ?auto_478082 ?auto_478086 ) ) ( not ( = ?auto_478083 ?auto_478084 ) ) ( not ( = ?auto_478083 ?auto_478085 ) ) ( not ( = ?auto_478083 ?auto_478086 ) ) ( not ( = ?auto_478084 ?auto_478085 ) ) ( not ( = ?auto_478084 ?auto_478086 ) ) ( not ( = ?auto_478085 ?auto_478086 ) ) ( ON ?auto_478084 ?auto_478085 ) ( ON ?auto_478083 ?auto_478084 ) ( ON ?auto_478082 ?auto_478083 ) ( ON ?auto_478081 ?auto_478082 ) ( ON ?auto_478080 ?auto_478081 ) ( ON ?auto_478079 ?auto_478080 ) ( CLEAR ?auto_478079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_478079 )
      ( MAKE-7PILE ?auto_478079 ?auto_478080 ?auto_478081 ?auto_478082 ?auto_478083 ?auto_478084 ?auto_478085 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_478110 - BLOCK
      ?auto_478111 - BLOCK
      ?auto_478112 - BLOCK
      ?auto_478113 - BLOCK
      ?auto_478114 - BLOCK
      ?auto_478115 - BLOCK
      ?auto_478116 - BLOCK
      ?auto_478117 - BLOCK
    )
    :vars
    (
      ?auto_478118 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_478116 ) ( ON ?auto_478117 ?auto_478118 ) ( CLEAR ?auto_478117 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_478110 ) ( ON ?auto_478111 ?auto_478110 ) ( ON ?auto_478112 ?auto_478111 ) ( ON ?auto_478113 ?auto_478112 ) ( ON ?auto_478114 ?auto_478113 ) ( ON ?auto_478115 ?auto_478114 ) ( ON ?auto_478116 ?auto_478115 ) ( not ( = ?auto_478110 ?auto_478111 ) ) ( not ( = ?auto_478110 ?auto_478112 ) ) ( not ( = ?auto_478110 ?auto_478113 ) ) ( not ( = ?auto_478110 ?auto_478114 ) ) ( not ( = ?auto_478110 ?auto_478115 ) ) ( not ( = ?auto_478110 ?auto_478116 ) ) ( not ( = ?auto_478110 ?auto_478117 ) ) ( not ( = ?auto_478110 ?auto_478118 ) ) ( not ( = ?auto_478111 ?auto_478112 ) ) ( not ( = ?auto_478111 ?auto_478113 ) ) ( not ( = ?auto_478111 ?auto_478114 ) ) ( not ( = ?auto_478111 ?auto_478115 ) ) ( not ( = ?auto_478111 ?auto_478116 ) ) ( not ( = ?auto_478111 ?auto_478117 ) ) ( not ( = ?auto_478111 ?auto_478118 ) ) ( not ( = ?auto_478112 ?auto_478113 ) ) ( not ( = ?auto_478112 ?auto_478114 ) ) ( not ( = ?auto_478112 ?auto_478115 ) ) ( not ( = ?auto_478112 ?auto_478116 ) ) ( not ( = ?auto_478112 ?auto_478117 ) ) ( not ( = ?auto_478112 ?auto_478118 ) ) ( not ( = ?auto_478113 ?auto_478114 ) ) ( not ( = ?auto_478113 ?auto_478115 ) ) ( not ( = ?auto_478113 ?auto_478116 ) ) ( not ( = ?auto_478113 ?auto_478117 ) ) ( not ( = ?auto_478113 ?auto_478118 ) ) ( not ( = ?auto_478114 ?auto_478115 ) ) ( not ( = ?auto_478114 ?auto_478116 ) ) ( not ( = ?auto_478114 ?auto_478117 ) ) ( not ( = ?auto_478114 ?auto_478118 ) ) ( not ( = ?auto_478115 ?auto_478116 ) ) ( not ( = ?auto_478115 ?auto_478117 ) ) ( not ( = ?auto_478115 ?auto_478118 ) ) ( not ( = ?auto_478116 ?auto_478117 ) ) ( not ( = ?auto_478116 ?auto_478118 ) ) ( not ( = ?auto_478117 ?auto_478118 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_478117 ?auto_478118 )
      ( !STACK ?auto_478117 ?auto_478116 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_478144 - BLOCK
      ?auto_478145 - BLOCK
      ?auto_478146 - BLOCK
      ?auto_478147 - BLOCK
      ?auto_478148 - BLOCK
      ?auto_478149 - BLOCK
      ?auto_478150 - BLOCK
      ?auto_478151 - BLOCK
    )
    :vars
    (
      ?auto_478152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478151 ?auto_478152 ) ( ON-TABLE ?auto_478144 ) ( ON ?auto_478145 ?auto_478144 ) ( ON ?auto_478146 ?auto_478145 ) ( ON ?auto_478147 ?auto_478146 ) ( ON ?auto_478148 ?auto_478147 ) ( ON ?auto_478149 ?auto_478148 ) ( not ( = ?auto_478144 ?auto_478145 ) ) ( not ( = ?auto_478144 ?auto_478146 ) ) ( not ( = ?auto_478144 ?auto_478147 ) ) ( not ( = ?auto_478144 ?auto_478148 ) ) ( not ( = ?auto_478144 ?auto_478149 ) ) ( not ( = ?auto_478144 ?auto_478150 ) ) ( not ( = ?auto_478144 ?auto_478151 ) ) ( not ( = ?auto_478144 ?auto_478152 ) ) ( not ( = ?auto_478145 ?auto_478146 ) ) ( not ( = ?auto_478145 ?auto_478147 ) ) ( not ( = ?auto_478145 ?auto_478148 ) ) ( not ( = ?auto_478145 ?auto_478149 ) ) ( not ( = ?auto_478145 ?auto_478150 ) ) ( not ( = ?auto_478145 ?auto_478151 ) ) ( not ( = ?auto_478145 ?auto_478152 ) ) ( not ( = ?auto_478146 ?auto_478147 ) ) ( not ( = ?auto_478146 ?auto_478148 ) ) ( not ( = ?auto_478146 ?auto_478149 ) ) ( not ( = ?auto_478146 ?auto_478150 ) ) ( not ( = ?auto_478146 ?auto_478151 ) ) ( not ( = ?auto_478146 ?auto_478152 ) ) ( not ( = ?auto_478147 ?auto_478148 ) ) ( not ( = ?auto_478147 ?auto_478149 ) ) ( not ( = ?auto_478147 ?auto_478150 ) ) ( not ( = ?auto_478147 ?auto_478151 ) ) ( not ( = ?auto_478147 ?auto_478152 ) ) ( not ( = ?auto_478148 ?auto_478149 ) ) ( not ( = ?auto_478148 ?auto_478150 ) ) ( not ( = ?auto_478148 ?auto_478151 ) ) ( not ( = ?auto_478148 ?auto_478152 ) ) ( not ( = ?auto_478149 ?auto_478150 ) ) ( not ( = ?auto_478149 ?auto_478151 ) ) ( not ( = ?auto_478149 ?auto_478152 ) ) ( not ( = ?auto_478150 ?auto_478151 ) ) ( not ( = ?auto_478150 ?auto_478152 ) ) ( not ( = ?auto_478151 ?auto_478152 ) ) ( CLEAR ?auto_478149 ) ( ON ?auto_478150 ?auto_478151 ) ( CLEAR ?auto_478150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_478144 ?auto_478145 ?auto_478146 ?auto_478147 ?auto_478148 ?auto_478149 ?auto_478150 )
      ( MAKE-8PILE ?auto_478144 ?auto_478145 ?auto_478146 ?auto_478147 ?auto_478148 ?auto_478149 ?auto_478150 ?auto_478151 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_478178 - BLOCK
      ?auto_478179 - BLOCK
      ?auto_478180 - BLOCK
      ?auto_478181 - BLOCK
      ?auto_478182 - BLOCK
      ?auto_478183 - BLOCK
      ?auto_478184 - BLOCK
      ?auto_478185 - BLOCK
    )
    :vars
    (
      ?auto_478186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478185 ?auto_478186 ) ( ON-TABLE ?auto_478178 ) ( ON ?auto_478179 ?auto_478178 ) ( ON ?auto_478180 ?auto_478179 ) ( ON ?auto_478181 ?auto_478180 ) ( ON ?auto_478182 ?auto_478181 ) ( not ( = ?auto_478178 ?auto_478179 ) ) ( not ( = ?auto_478178 ?auto_478180 ) ) ( not ( = ?auto_478178 ?auto_478181 ) ) ( not ( = ?auto_478178 ?auto_478182 ) ) ( not ( = ?auto_478178 ?auto_478183 ) ) ( not ( = ?auto_478178 ?auto_478184 ) ) ( not ( = ?auto_478178 ?auto_478185 ) ) ( not ( = ?auto_478178 ?auto_478186 ) ) ( not ( = ?auto_478179 ?auto_478180 ) ) ( not ( = ?auto_478179 ?auto_478181 ) ) ( not ( = ?auto_478179 ?auto_478182 ) ) ( not ( = ?auto_478179 ?auto_478183 ) ) ( not ( = ?auto_478179 ?auto_478184 ) ) ( not ( = ?auto_478179 ?auto_478185 ) ) ( not ( = ?auto_478179 ?auto_478186 ) ) ( not ( = ?auto_478180 ?auto_478181 ) ) ( not ( = ?auto_478180 ?auto_478182 ) ) ( not ( = ?auto_478180 ?auto_478183 ) ) ( not ( = ?auto_478180 ?auto_478184 ) ) ( not ( = ?auto_478180 ?auto_478185 ) ) ( not ( = ?auto_478180 ?auto_478186 ) ) ( not ( = ?auto_478181 ?auto_478182 ) ) ( not ( = ?auto_478181 ?auto_478183 ) ) ( not ( = ?auto_478181 ?auto_478184 ) ) ( not ( = ?auto_478181 ?auto_478185 ) ) ( not ( = ?auto_478181 ?auto_478186 ) ) ( not ( = ?auto_478182 ?auto_478183 ) ) ( not ( = ?auto_478182 ?auto_478184 ) ) ( not ( = ?auto_478182 ?auto_478185 ) ) ( not ( = ?auto_478182 ?auto_478186 ) ) ( not ( = ?auto_478183 ?auto_478184 ) ) ( not ( = ?auto_478183 ?auto_478185 ) ) ( not ( = ?auto_478183 ?auto_478186 ) ) ( not ( = ?auto_478184 ?auto_478185 ) ) ( not ( = ?auto_478184 ?auto_478186 ) ) ( not ( = ?auto_478185 ?auto_478186 ) ) ( ON ?auto_478184 ?auto_478185 ) ( CLEAR ?auto_478182 ) ( ON ?auto_478183 ?auto_478184 ) ( CLEAR ?auto_478183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_478178 ?auto_478179 ?auto_478180 ?auto_478181 ?auto_478182 ?auto_478183 )
      ( MAKE-8PILE ?auto_478178 ?auto_478179 ?auto_478180 ?auto_478181 ?auto_478182 ?auto_478183 ?auto_478184 ?auto_478185 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_478212 - BLOCK
      ?auto_478213 - BLOCK
      ?auto_478214 - BLOCK
      ?auto_478215 - BLOCK
      ?auto_478216 - BLOCK
      ?auto_478217 - BLOCK
      ?auto_478218 - BLOCK
      ?auto_478219 - BLOCK
    )
    :vars
    (
      ?auto_478220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478219 ?auto_478220 ) ( ON-TABLE ?auto_478212 ) ( ON ?auto_478213 ?auto_478212 ) ( ON ?auto_478214 ?auto_478213 ) ( ON ?auto_478215 ?auto_478214 ) ( not ( = ?auto_478212 ?auto_478213 ) ) ( not ( = ?auto_478212 ?auto_478214 ) ) ( not ( = ?auto_478212 ?auto_478215 ) ) ( not ( = ?auto_478212 ?auto_478216 ) ) ( not ( = ?auto_478212 ?auto_478217 ) ) ( not ( = ?auto_478212 ?auto_478218 ) ) ( not ( = ?auto_478212 ?auto_478219 ) ) ( not ( = ?auto_478212 ?auto_478220 ) ) ( not ( = ?auto_478213 ?auto_478214 ) ) ( not ( = ?auto_478213 ?auto_478215 ) ) ( not ( = ?auto_478213 ?auto_478216 ) ) ( not ( = ?auto_478213 ?auto_478217 ) ) ( not ( = ?auto_478213 ?auto_478218 ) ) ( not ( = ?auto_478213 ?auto_478219 ) ) ( not ( = ?auto_478213 ?auto_478220 ) ) ( not ( = ?auto_478214 ?auto_478215 ) ) ( not ( = ?auto_478214 ?auto_478216 ) ) ( not ( = ?auto_478214 ?auto_478217 ) ) ( not ( = ?auto_478214 ?auto_478218 ) ) ( not ( = ?auto_478214 ?auto_478219 ) ) ( not ( = ?auto_478214 ?auto_478220 ) ) ( not ( = ?auto_478215 ?auto_478216 ) ) ( not ( = ?auto_478215 ?auto_478217 ) ) ( not ( = ?auto_478215 ?auto_478218 ) ) ( not ( = ?auto_478215 ?auto_478219 ) ) ( not ( = ?auto_478215 ?auto_478220 ) ) ( not ( = ?auto_478216 ?auto_478217 ) ) ( not ( = ?auto_478216 ?auto_478218 ) ) ( not ( = ?auto_478216 ?auto_478219 ) ) ( not ( = ?auto_478216 ?auto_478220 ) ) ( not ( = ?auto_478217 ?auto_478218 ) ) ( not ( = ?auto_478217 ?auto_478219 ) ) ( not ( = ?auto_478217 ?auto_478220 ) ) ( not ( = ?auto_478218 ?auto_478219 ) ) ( not ( = ?auto_478218 ?auto_478220 ) ) ( not ( = ?auto_478219 ?auto_478220 ) ) ( ON ?auto_478218 ?auto_478219 ) ( ON ?auto_478217 ?auto_478218 ) ( CLEAR ?auto_478215 ) ( ON ?auto_478216 ?auto_478217 ) ( CLEAR ?auto_478216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_478212 ?auto_478213 ?auto_478214 ?auto_478215 ?auto_478216 )
      ( MAKE-8PILE ?auto_478212 ?auto_478213 ?auto_478214 ?auto_478215 ?auto_478216 ?auto_478217 ?auto_478218 ?auto_478219 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_478246 - BLOCK
      ?auto_478247 - BLOCK
      ?auto_478248 - BLOCK
      ?auto_478249 - BLOCK
      ?auto_478250 - BLOCK
      ?auto_478251 - BLOCK
      ?auto_478252 - BLOCK
      ?auto_478253 - BLOCK
    )
    :vars
    (
      ?auto_478254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478253 ?auto_478254 ) ( ON-TABLE ?auto_478246 ) ( ON ?auto_478247 ?auto_478246 ) ( ON ?auto_478248 ?auto_478247 ) ( not ( = ?auto_478246 ?auto_478247 ) ) ( not ( = ?auto_478246 ?auto_478248 ) ) ( not ( = ?auto_478246 ?auto_478249 ) ) ( not ( = ?auto_478246 ?auto_478250 ) ) ( not ( = ?auto_478246 ?auto_478251 ) ) ( not ( = ?auto_478246 ?auto_478252 ) ) ( not ( = ?auto_478246 ?auto_478253 ) ) ( not ( = ?auto_478246 ?auto_478254 ) ) ( not ( = ?auto_478247 ?auto_478248 ) ) ( not ( = ?auto_478247 ?auto_478249 ) ) ( not ( = ?auto_478247 ?auto_478250 ) ) ( not ( = ?auto_478247 ?auto_478251 ) ) ( not ( = ?auto_478247 ?auto_478252 ) ) ( not ( = ?auto_478247 ?auto_478253 ) ) ( not ( = ?auto_478247 ?auto_478254 ) ) ( not ( = ?auto_478248 ?auto_478249 ) ) ( not ( = ?auto_478248 ?auto_478250 ) ) ( not ( = ?auto_478248 ?auto_478251 ) ) ( not ( = ?auto_478248 ?auto_478252 ) ) ( not ( = ?auto_478248 ?auto_478253 ) ) ( not ( = ?auto_478248 ?auto_478254 ) ) ( not ( = ?auto_478249 ?auto_478250 ) ) ( not ( = ?auto_478249 ?auto_478251 ) ) ( not ( = ?auto_478249 ?auto_478252 ) ) ( not ( = ?auto_478249 ?auto_478253 ) ) ( not ( = ?auto_478249 ?auto_478254 ) ) ( not ( = ?auto_478250 ?auto_478251 ) ) ( not ( = ?auto_478250 ?auto_478252 ) ) ( not ( = ?auto_478250 ?auto_478253 ) ) ( not ( = ?auto_478250 ?auto_478254 ) ) ( not ( = ?auto_478251 ?auto_478252 ) ) ( not ( = ?auto_478251 ?auto_478253 ) ) ( not ( = ?auto_478251 ?auto_478254 ) ) ( not ( = ?auto_478252 ?auto_478253 ) ) ( not ( = ?auto_478252 ?auto_478254 ) ) ( not ( = ?auto_478253 ?auto_478254 ) ) ( ON ?auto_478252 ?auto_478253 ) ( ON ?auto_478251 ?auto_478252 ) ( ON ?auto_478250 ?auto_478251 ) ( CLEAR ?auto_478248 ) ( ON ?auto_478249 ?auto_478250 ) ( CLEAR ?auto_478249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_478246 ?auto_478247 ?auto_478248 ?auto_478249 )
      ( MAKE-8PILE ?auto_478246 ?auto_478247 ?auto_478248 ?auto_478249 ?auto_478250 ?auto_478251 ?auto_478252 ?auto_478253 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_478280 - BLOCK
      ?auto_478281 - BLOCK
      ?auto_478282 - BLOCK
      ?auto_478283 - BLOCK
      ?auto_478284 - BLOCK
      ?auto_478285 - BLOCK
      ?auto_478286 - BLOCK
      ?auto_478287 - BLOCK
    )
    :vars
    (
      ?auto_478288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478287 ?auto_478288 ) ( ON-TABLE ?auto_478280 ) ( ON ?auto_478281 ?auto_478280 ) ( not ( = ?auto_478280 ?auto_478281 ) ) ( not ( = ?auto_478280 ?auto_478282 ) ) ( not ( = ?auto_478280 ?auto_478283 ) ) ( not ( = ?auto_478280 ?auto_478284 ) ) ( not ( = ?auto_478280 ?auto_478285 ) ) ( not ( = ?auto_478280 ?auto_478286 ) ) ( not ( = ?auto_478280 ?auto_478287 ) ) ( not ( = ?auto_478280 ?auto_478288 ) ) ( not ( = ?auto_478281 ?auto_478282 ) ) ( not ( = ?auto_478281 ?auto_478283 ) ) ( not ( = ?auto_478281 ?auto_478284 ) ) ( not ( = ?auto_478281 ?auto_478285 ) ) ( not ( = ?auto_478281 ?auto_478286 ) ) ( not ( = ?auto_478281 ?auto_478287 ) ) ( not ( = ?auto_478281 ?auto_478288 ) ) ( not ( = ?auto_478282 ?auto_478283 ) ) ( not ( = ?auto_478282 ?auto_478284 ) ) ( not ( = ?auto_478282 ?auto_478285 ) ) ( not ( = ?auto_478282 ?auto_478286 ) ) ( not ( = ?auto_478282 ?auto_478287 ) ) ( not ( = ?auto_478282 ?auto_478288 ) ) ( not ( = ?auto_478283 ?auto_478284 ) ) ( not ( = ?auto_478283 ?auto_478285 ) ) ( not ( = ?auto_478283 ?auto_478286 ) ) ( not ( = ?auto_478283 ?auto_478287 ) ) ( not ( = ?auto_478283 ?auto_478288 ) ) ( not ( = ?auto_478284 ?auto_478285 ) ) ( not ( = ?auto_478284 ?auto_478286 ) ) ( not ( = ?auto_478284 ?auto_478287 ) ) ( not ( = ?auto_478284 ?auto_478288 ) ) ( not ( = ?auto_478285 ?auto_478286 ) ) ( not ( = ?auto_478285 ?auto_478287 ) ) ( not ( = ?auto_478285 ?auto_478288 ) ) ( not ( = ?auto_478286 ?auto_478287 ) ) ( not ( = ?auto_478286 ?auto_478288 ) ) ( not ( = ?auto_478287 ?auto_478288 ) ) ( ON ?auto_478286 ?auto_478287 ) ( ON ?auto_478285 ?auto_478286 ) ( ON ?auto_478284 ?auto_478285 ) ( ON ?auto_478283 ?auto_478284 ) ( CLEAR ?auto_478281 ) ( ON ?auto_478282 ?auto_478283 ) ( CLEAR ?auto_478282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_478280 ?auto_478281 ?auto_478282 )
      ( MAKE-8PILE ?auto_478280 ?auto_478281 ?auto_478282 ?auto_478283 ?auto_478284 ?auto_478285 ?auto_478286 ?auto_478287 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_478314 - BLOCK
      ?auto_478315 - BLOCK
      ?auto_478316 - BLOCK
      ?auto_478317 - BLOCK
      ?auto_478318 - BLOCK
      ?auto_478319 - BLOCK
      ?auto_478320 - BLOCK
      ?auto_478321 - BLOCK
    )
    :vars
    (
      ?auto_478322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478321 ?auto_478322 ) ( ON-TABLE ?auto_478314 ) ( not ( = ?auto_478314 ?auto_478315 ) ) ( not ( = ?auto_478314 ?auto_478316 ) ) ( not ( = ?auto_478314 ?auto_478317 ) ) ( not ( = ?auto_478314 ?auto_478318 ) ) ( not ( = ?auto_478314 ?auto_478319 ) ) ( not ( = ?auto_478314 ?auto_478320 ) ) ( not ( = ?auto_478314 ?auto_478321 ) ) ( not ( = ?auto_478314 ?auto_478322 ) ) ( not ( = ?auto_478315 ?auto_478316 ) ) ( not ( = ?auto_478315 ?auto_478317 ) ) ( not ( = ?auto_478315 ?auto_478318 ) ) ( not ( = ?auto_478315 ?auto_478319 ) ) ( not ( = ?auto_478315 ?auto_478320 ) ) ( not ( = ?auto_478315 ?auto_478321 ) ) ( not ( = ?auto_478315 ?auto_478322 ) ) ( not ( = ?auto_478316 ?auto_478317 ) ) ( not ( = ?auto_478316 ?auto_478318 ) ) ( not ( = ?auto_478316 ?auto_478319 ) ) ( not ( = ?auto_478316 ?auto_478320 ) ) ( not ( = ?auto_478316 ?auto_478321 ) ) ( not ( = ?auto_478316 ?auto_478322 ) ) ( not ( = ?auto_478317 ?auto_478318 ) ) ( not ( = ?auto_478317 ?auto_478319 ) ) ( not ( = ?auto_478317 ?auto_478320 ) ) ( not ( = ?auto_478317 ?auto_478321 ) ) ( not ( = ?auto_478317 ?auto_478322 ) ) ( not ( = ?auto_478318 ?auto_478319 ) ) ( not ( = ?auto_478318 ?auto_478320 ) ) ( not ( = ?auto_478318 ?auto_478321 ) ) ( not ( = ?auto_478318 ?auto_478322 ) ) ( not ( = ?auto_478319 ?auto_478320 ) ) ( not ( = ?auto_478319 ?auto_478321 ) ) ( not ( = ?auto_478319 ?auto_478322 ) ) ( not ( = ?auto_478320 ?auto_478321 ) ) ( not ( = ?auto_478320 ?auto_478322 ) ) ( not ( = ?auto_478321 ?auto_478322 ) ) ( ON ?auto_478320 ?auto_478321 ) ( ON ?auto_478319 ?auto_478320 ) ( ON ?auto_478318 ?auto_478319 ) ( ON ?auto_478317 ?auto_478318 ) ( ON ?auto_478316 ?auto_478317 ) ( CLEAR ?auto_478314 ) ( ON ?auto_478315 ?auto_478316 ) ( CLEAR ?auto_478315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_478314 ?auto_478315 )
      ( MAKE-8PILE ?auto_478314 ?auto_478315 ?auto_478316 ?auto_478317 ?auto_478318 ?auto_478319 ?auto_478320 ?auto_478321 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_478348 - BLOCK
      ?auto_478349 - BLOCK
      ?auto_478350 - BLOCK
      ?auto_478351 - BLOCK
      ?auto_478352 - BLOCK
      ?auto_478353 - BLOCK
      ?auto_478354 - BLOCK
      ?auto_478355 - BLOCK
    )
    :vars
    (
      ?auto_478356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478355 ?auto_478356 ) ( not ( = ?auto_478348 ?auto_478349 ) ) ( not ( = ?auto_478348 ?auto_478350 ) ) ( not ( = ?auto_478348 ?auto_478351 ) ) ( not ( = ?auto_478348 ?auto_478352 ) ) ( not ( = ?auto_478348 ?auto_478353 ) ) ( not ( = ?auto_478348 ?auto_478354 ) ) ( not ( = ?auto_478348 ?auto_478355 ) ) ( not ( = ?auto_478348 ?auto_478356 ) ) ( not ( = ?auto_478349 ?auto_478350 ) ) ( not ( = ?auto_478349 ?auto_478351 ) ) ( not ( = ?auto_478349 ?auto_478352 ) ) ( not ( = ?auto_478349 ?auto_478353 ) ) ( not ( = ?auto_478349 ?auto_478354 ) ) ( not ( = ?auto_478349 ?auto_478355 ) ) ( not ( = ?auto_478349 ?auto_478356 ) ) ( not ( = ?auto_478350 ?auto_478351 ) ) ( not ( = ?auto_478350 ?auto_478352 ) ) ( not ( = ?auto_478350 ?auto_478353 ) ) ( not ( = ?auto_478350 ?auto_478354 ) ) ( not ( = ?auto_478350 ?auto_478355 ) ) ( not ( = ?auto_478350 ?auto_478356 ) ) ( not ( = ?auto_478351 ?auto_478352 ) ) ( not ( = ?auto_478351 ?auto_478353 ) ) ( not ( = ?auto_478351 ?auto_478354 ) ) ( not ( = ?auto_478351 ?auto_478355 ) ) ( not ( = ?auto_478351 ?auto_478356 ) ) ( not ( = ?auto_478352 ?auto_478353 ) ) ( not ( = ?auto_478352 ?auto_478354 ) ) ( not ( = ?auto_478352 ?auto_478355 ) ) ( not ( = ?auto_478352 ?auto_478356 ) ) ( not ( = ?auto_478353 ?auto_478354 ) ) ( not ( = ?auto_478353 ?auto_478355 ) ) ( not ( = ?auto_478353 ?auto_478356 ) ) ( not ( = ?auto_478354 ?auto_478355 ) ) ( not ( = ?auto_478354 ?auto_478356 ) ) ( not ( = ?auto_478355 ?auto_478356 ) ) ( ON ?auto_478354 ?auto_478355 ) ( ON ?auto_478353 ?auto_478354 ) ( ON ?auto_478352 ?auto_478353 ) ( ON ?auto_478351 ?auto_478352 ) ( ON ?auto_478350 ?auto_478351 ) ( ON ?auto_478349 ?auto_478350 ) ( ON ?auto_478348 ?auto_478349 ) ( CLEAR ?auto_478348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_478348 )
      ( MAKE-8PILE ?auto_478348 ?auto_478349 ?auto_478350 ?auto_478351 ?auto_478352 ?auto_478353 ?auto_478354 ?auto_478355 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_478383 - BLOCK
      ?auto_478384 - BLOCK
      ?auto_478385 - BLOCK
      ?auto_478386 - BLOCK
      ?auto_478387 - BLOCK
      ?auto_478388 - BLOCK
      ?auto_478389 - BLOCK
      ?auto_478390 - BLOCK
      ?auto_478391 - BLOCK
    )
    :vars
    (
      ?auto_478392 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_478390 ) ( ON ?auto_478391 ?auto_478392 ) ( CLEAR ?auto_478391 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_478383 ) ( ON ?auto_478384 ?auto_478383 ) ( ON ?auto_478385 ?auto_478384 ) ( ON ?auto_478386 ?auto_478385 ) ( ON ?auto_478387 ?auto_478386 ) ( ON ?auto_478388 ?auto_478387 ) ( ON ?auto_478389 ?auto_478388 ) ( ON ?auto_478390 ?auto_478389 ) ( not ( = ?auto_478383 ?auto_478384 ) ) ( not ( = ?auto_478383 ?auto_478385 ) ) ( not ( = ?auto_478383 ?auto_478386 ) ) ( not ( = ?auto_478383 ?auto_478387 ) ) ( not ( = ?auto_478383 ?auto_478388 ) ) ( not ( = ?auto_478383 ?auto_478389 ) ) ( not ( = ?auto_478383 ?auto_478390 ) ) ( not ( = ?auto_478383 ?auto_478391 ) ) ( not ( = ?auto_478383 ?auto_478392 ) ) ( not ( = ?auto_478384 ?auto_478385 ) ) ( not ( = ?auto_478384 ?auto_478386 ) ) ( not ( = ?auto_478384 ?auto_478387 ) ) ( not ( = ?auto_478384 ?auto_478388 ) ) ( not ( = ?auto_478384 ?auto_478389 ) ) ( not ( = ?auto_478384 ?auto_478390 ) ) ( not ( = ?auto_478384 ?auto_478391 ) ) ( not ( = ?auto_478384 ?auto_478392 ) ) ( not ( = ?auto_478385 ?auto_478386 ) ) ( not ( = ?auto_478385 ?auto_478387 ) ) ( not ( = ?auto_478385 ?auto_478388 ) ) ( not ( = ?auto_478385 ?auto_478389 ) ) ( not ( = ?auto_478385 ?auto_478390 ) ) ( not ( = ?auto_478385 ?auto_478391 ) ) ( not ( = ?auto_478385 ?auto_478392 ) ) ( not ( = ?auto_478386 ?auto_478387 ) ) ( not ( = ?auto_478386 ?auto_478388 ) ) ( not ( = ?auto_478386 ?auto_478389 ) ) ( not ( = ?auto_478386 ?auto_478390 ) ) ( not ( = ?auto_478386 ?auto_478391 ) ) ( not ( = ?auto_478386 ?auto_478392 ) ) ( not ( = ?auto_478387 ?auto_478388 ) ) ( not ( = ?auto_478387 ?auto_478389 ) ) ( not ( = ?auto_478387 ?auto_478390 ) ) ( not ( = ?auto_478387 ?auto_478391 ) ) ( not ( = ?auto_478387 ?auto_478392 ) ) ( not ( = ?auto_478388 ?auto_478389 ) ) ( not ( = ?auto_478388 ?auto_478390 ) ) ( not ( = ?auto_478388 ?auto_478391 ) ) ( not ( = ?auto_478388 ?auto_478392 ) ) ( not ( = ?auto_478389 ?auto_478390 ) ) ( not ( = ?auto_478389 ?auto_478391 ) ) ( not ( = ?auto_478389 ?auto_478392 ) ) ( not ( = ?auto_478390 ?auto_478391 ) ) ( not ( = ?auto_478390 ?auto_478392 ) ) ( not ( = ?auto_478391 ?auto_478392 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_478391 ?auto_478392 )
      ( !STACK ?auto_478391 ?auto_478390 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_478421 - BLOCK
      ?auto_478422 - BLOCK
      ?auto_478423 - BLOCK
      ?auto_478424 - BLOCK
      ?auto_478425 - BLOCK
      ?auto_478426 - BLOCK
      ?auto_478427 - BLOCK
      ?auto_478428 - BLOCK
      ?auto_478429 - BLOCK
    )
    :vars
    (
      ?auto_478430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478429 ?auto_478430 ) ( ON-TABLE ?auto_478421 ) ( ON ?auto_478422 ?auto_478421 ) ( ON ?auto_478423 ?auto_478422 ) ( ON ?auto_478424 ?auto_478423 ) ( ON ?auto_478425 ?auto_478424 ) ( ON ?auto_478426 ?auto_478425 ) ( ON ?auto_478427 ?auto_478426 ) ( not ( = ?auto_478421 ?auto_478422 ) ) ( not ( = ?auto_478421 ?auto_478423 ) ) ( not ( = ?auto_478421 ?auto_478424 ) ) ( not ( = ?auto_478421 ?auto_478425 ) ) ( not ( = ?auto_478421 ?auto_478426 ) ) ( not ( = ?auto_478421 ?auto_478427 ) ) ( not ( = ?auto_478421 ?auto_478428 ) ) ( not ( = ?auto_478421 ?auto_478429 ) ) ( not ( = ?auto_478421 ?auto_478430 ) ) ( not ( = ?auto_478422 ?auto_478423 ) ) ( not ( = ?auto_478422 ?auto_478424 ) ) ( not ( = ?auto_478422 ?auto_478425 ) ) ( not ( = ?auto_478422 ?auto_478426 ) ) ( not ( = ?auto_478422 ?auto_478427 ) ) ( not ( = ?auto_478422 ?auto_478428 ) ) ( not ( = ?auto_478422 ?auto_478429 ) ) ( not ( = ?auto_478422 ?auto_478430 ) ) ( not ( = ?auto_478423 ?auto_478424 ) ) ( not ( = ?auto_478423 ?auto_478425 ) ) ( not ( = ?auto_478423 ?auto_478426 ) ) ( not ( = ?auto_478423 ?auto_478427 ) ) ( not ( = ?auto_478423 ?auto_478428 ) ) ( not ( = ?auto_478423 ?auto_478429 ) ) ( not ( = ?auto_478423 ?auto_478430 ) ) ( not ( = ?auto_478424 ?auto_478425 ) ) ( not ( = ?auto_478424 ?auto_478426 ) ) ( not ( = ?auto_478424 ?auto_478427 ) ) ( not ( = ?auto_478424 ?auto_478428 ) ) ( not ( = ?auto_478424 ?auto_478429 ) ) ( not ( = ?auto_478424 ?auto_478430 ) ) ( not ( = ?auto_478425 ?auto_478426 ) ) ( not ( = ?auto_478425 ?auto_478427 ) ) ( not ( = ?auto_478425 ?auto_478428 ) ) ( not ( = ?auto_478425 ?auto_478429 ) ) ( not ( = ?auto_478425 ?auto_478430 ) ) ( not ( = ?auto_478426 ?auto_478427 ) ) ( not ( = ?auto_478426 ?auto_478428 ) ) ( not ( = ?auto_478426 ?auto_478429 ) ) ( not ( = ?auto_478426 ?auto_478430 ) ) ( not ( = ?auto_478427 ?auto_478428 ) ) ( not ( = ?auto_478427 ?auto_478429 ) ) ( not ( = ?auto_478427 ?auto_478430 ) ) ( not ( = ?auto_478428 ?auto_478429 ) ) ( not ( = ?auto_478428 ?auto_478430 ) ) ( not ( = ?auto_478429 ?auto_478430 ) ) ( CLEAR ?auto_478427 ) ( ON ?auto_478428 ?auto_478429 ) ( CLEAR ?auto_478428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_478421 ?auto_478422 ?auto_478423 ?auto_478424 ?auto_478425 ?auto_478426 ?auto_478427 ?auto_478428 )
      ( MAKE-9PILE ?auto_478421 ?auto_478422 ?auto_478423 ?auto_478424 ?auto_478425 ?auto_478426 ?auto_478427 ?auto_478428 ?auto_478429 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_478459 - BLOCK
      ?auto_478460 - BLOCK
      ?auto_478461 - BLOCK
      ?auto_478462 - BLOCK
      ?auto_478463 - BLOCK
      ?auto_478464 - BLOCK
      ?auto_478465 - BLOCK
      ?auto_478466 - BLOCK
      ?auto_478467 - BLOCK
    )
    :vars
    (
      ?auto_478468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478467 ?auto_478468 ) ( ON-TABLE ?auto_478459 ) ( ON ?auto_478460 ?auto_478459 ) ( ON ?auto_478461 ?auto_478460 ) ( ON ?auto_478462 ?auto_478461 ) ( ON ?auto_478463 ?auto_478462 ) ( ON ?auto_478464 ?auto_478463 ) ( not ( = ?auto_478459 ?auto_478460 ) ) ( not ( = ?auto_478459 ?auto_478461 ) ) ( not ( = ?auto_478459 ?auto_478462 ) ) ( not ( = ?auto_478459 ?auto_478463 ) ) ( not ( = ?auto_478459 ?auto_478464 ) ) ( not ( = ?auto_478459 ?auto_478465 ) ) ( not ( = ?auto_478459 ?auto_478466 ) ) ( not ( = ?auto_478459 ?auto_478467 ) ) ( not ( = ?auto_478459 ?auto_478468 ) ) ( not ( = ?auto_478460 ?auto_478461 ) ) ( not ( = ?auto_478460 ?auto_478462 ) ) ( not ( = ?auto_478460 ?auto_478463 ) ) ( not ( = ?auto_478460 ?auto_478464 ) ) ( not ( = ?auto_478460 ?auto_478465 ) ) ( not ( = ?auto_478460 ?auto_478466 ) ) ( not ( = ?auto_478460 ?auto_478467 ) ) ( not ( = ?auto_478460 ?auto_478468 ) ) ( not ( = ?auto_478461 ?auto_478462 ) ) ( not ( = ?auto_478461 ?auto_478463 ) ) ( not ( = ?auto_478461 ?auto_478464 ) ) ( not ( = ?auto_478461 ?auto_478465 ) ) ( not ( = ?auto_478461 ?auto_478466 ) ) ( not ( = ?auto_478461 ?auto_478467 ) ) ( not ( = ?auto_478461 ?auto_478468 ) ) ( not ( = ?auto_478462 ?auto_478463 ) ) ( not ( = ?auto_478462 ?auto_478464 ) ) ( not ( = ?auto_478462 ?auto_478465 ) ) ( not ( = ?auto_478462 ?auto_478466 ) ) ( not ( = ?auto_478462 ?auto_478467 ) ) ( not ( = ?auto_478462 ?auto_478468 ) ) ( not ( = ?auto_478463 ?auto_478464 ) ) ( not ( = ?auto_478463 ?auto_478465 ) ) ( not ( = ?auto_478463 ?auto_478466 ) ) ( not ( = ?auto_478463 ?auto_478467 ) ) ( not ( = ?auto_478463 ?auto_478468 ) ) ( not ( = ?auto_478464 ?auto_478465 ) ) ( not ( = ?auto_478464 ?auto_478466 ) ) ( not ( = ?auto_478464 ?auto_478467 ) ) ( not ( = ?auto_478464 ?auto_478468 ) ) ( not ( = ?auto_478465 ?auto_478466 ) ) ( not ( = ?auto_478465 ?auto_478467 ) ) ( not ( = ?auto_478465 ?auto_478468 ) ) ( not ( = ?auto_478466 ?auto_478467 ) ) ( not ( = ?auto_478466 ?auto_478468 ) ) ( not ( = ?auto_478467 ?auto_478468 ) ) ( ON ?auto_478466 ?auto_478467 ) ( CLEAR ?auto_478464 ) ( ON ?auto_478465 ?auto_478466 ) ( CLEAR ?auto_478465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_478459 ?auto_478460 ?auto_478461 ?auto_478462 ?auto_478463 ?auto_478464 ?auto_478465 )
      ( MAKE-9PILE ?auto_478459 ?auto_478460 ?auto_478461 ?auto_478462 ?auto_478463 ?auto_478464 ?auto_478465 ?auto_478466 ?auto_478467 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_478497 - BLOCK
      ?auto_478498 - BLOCK
      ?auto_478499 - BLOCK
      ?auto_478500 - BLOCK
      ?auto_478501 - BLOCK
      ?auto_478502 - BLOCK
      ?auto_478503 - BLOCK
      ?auto_478504 - BLOCK
      ?auto_478505 - BLOCK
    )
    :vars
    (
      ?auto_478506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478505 ?auto_478506 ) ( ON-TABLE ?auto_478497 ) ( ON ?auto_478498 ?auto_478497 ) ( ON ?auto_478499 ?auto_478498 ) ( ON ?auto_478500 ?auto_478499 ) ( ON ?auto_478501 ?auto_478500 ) ( not ( = ?auto_478497 ?auto_478498 ) ) ( not ( = ?auto_478497 ?auto_478499 ) ) ( not ( = ?auto_478497 ?auto_478500 ) ) ( not ( = ?auto_478497 ?auto_478501 ) ) ( not ( = ?auto_478497 ?auto_478502 ) ) ( not ( = ?auto_478497 ?auto_478503 ) ) ( not ( = ?auto_478497 ?auto_478504 ) ) ( not ( = ?auto_478497 ?auto_478505 ) ) ( not ( = ?auto_478497 ?auto_478506 ) ) ( not ( = ?auto_478498 ?auto_478499 ) ) ( not ( = ?auto_478498 ?auto_478500 ) ) ( not ( = ?auto_478498 ?auto_478501 ) ) ( not ( = ?auto_478498 ?auto_478502 ) ) ( not ( = ?auto_478498 ?auto_478503 ) ) ( not ( = ?auto_478498 ?auto_478504 ) ) ( not ( = ?auto_478498 ?auto_478505 ) ) ( not ( = ?auto_478498 ?auto_478506 ) ) ( not ( = ?auto_478499 ?auto_478500 ) ) ( not ( = ?auto_478499 ?auto_478501 ) ) ( not ( = ?auto_478499 ?auto_478502 ) ) ( not ( = ?auto_478499 ?auto_478503 ) ) ( not ( = ?auto_478499 ?auto_478504 ) ) ( not ( = ?auto_478499 ?auto_478505 ) ) ( not ( = ?auto_478499 ?auto_478506 ) ) ( not ( = ?auto_478500 ?auto_478501 ) ) ( not ( = ?auto_478500 ?auto_478502 ) ) ( not ( = ?auto_478500 ?auto_478503 ) ) ( not ( = ?auto_478500 ?auto_478504 ) ) ( not ( = ?auto_478500 ?auto_478505 ) ) ( not ( = ?auto_478500 ?auto_478506 ) ) ( not ( = ?auto_478501 ?auto_478502 ) ) ( not ( = ?auto_478501 ?auto_478503 ) ) ( not ( = ?auto_478501 ?auto_478504 ) ) ( not ( = ?auto_478501 ?auto_478505 ) ) ( not ( = ?auto_478501 ?auto_478506 ) ) ( not ( = ?auto_478502 ?auto_478503 ) ) ( not ( = ?auto_478502 ?auto_478504 ) ) ( not ( = ?auto_478502 ?auto_478505 ) ) ( not ( = ?auto_478502 ?auto_478506 ) ) ( not ( = ?auto_478503 ?auto_478504 ) ) ( not ( = ?auto_478503 ?auto_478505 ) ) ( not ( = ?auto_478503 ?auto_478506 ) ) ( not ( = ?auto_478504 ?auto_478505 ) ) ( not ( = ?auto_478504 ?auto_478506 ) ) ( not ( = ?auto_478505 ?auto_478506 ) ) ( ON ?auto_478504 ?auto_478505 ) ( ON ?auto_478503 ?auto_478504 ) ( CLEAR ?auto_478501 ) ( ON ?auto_478502 ?auto_478503 ) ( CLEAR ?auto_478502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_478497 ?auto_478498 ?auto_478499 ?auto_478500 ?auto_478501 ?auto_478502 )
      ( MAKE-9PILE ?auto_478497 ?auto_478498 ?auto_478499 ?auto_478500 ?auto_478501 ?auto_478502 ?auto_478503 ?auto_478504 ?auto_478505 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_478535 - BLOCK
      ?auto_478536 - BLOCK
      ?auto_478537 - BLOCK
      ?auto_478538 - BLOCK
      ?auto_478539 - BLOCK
      ?auto_478540 - BLOCK
      ?auto_478541 - BLOCK
      ?auto_478542 - BLOCK
      ?auto_478543 - BLOCK
    )
    :vars
    (
      ?auto_478544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478543 ?auto_478544 ) ( ON-TABLE ?auto_478535 ) ( ON ?auto_478536 ?auto_478535 ) ( ON ?auto_478537 ?auto_478536 ) ( ON ?auto_478538 ?auto_478537 ) ( not ( = ?auto_478535 ?auto_478536 ) ) ( not ( = ?auto_478535 ?auto_478537 ) ) ( not ( = ?auto_478535 ?auto_478538 ) ) ( not ( = ?auto_478535 ?auto_478539 ) ) ( not ( = ?auto_478535 ?auto_478540 ) ) ( not ( = ?auto_478535 ?auto_478541 ) ) ( not ( = ?auto_478535 ?auto_478542 ) ) ( not ( = ?auto_478535 ?auto_478543 ) ) ( not ( = ?auto_478535 ?auto_478544 ) ) ( not ( = ?auto_478536 ?auto_478537 ) ) ( not ( = ?auto_478536 ?auto_478538 ) ) ( not ( = ?auto_478536 ?auto_478539 ) ) ( not ( = ?auto_478536 ?auto_478540 ) ) ( not ( = ?auto_478536 ?auto_478541 ) ) ( not ( = ?auto_478536 ?auto_478542 ) ) ( not ( = ?auto_478536 ?auto_478543 ) ) ( not ( = ?auto_478536 ?auto_478544 ) ) ( not ( = ?auto_478537 ?auto_478538 ) ) ( not ( = ?auto_478537 ?auto_478539 ) ) ( not ( = ?auto_478537 ?auto_478540 ) ) ( not ( = ?auto_478537 ?auto_478541 ) ) ( not ( = ?auto_478537 ?auto_478542 ) ) ( not ( = ?auto_478537 ?auto_478543 ) ) ( not ( = ?auto_478537 ?auto_478544 ) ) ( not ( = ?auto_478538 ?auto_478539 ) ) ( not ( = ?auto_478538 ?auto_478540 ) ) ( not ( = ?auto_478538 ?auto_478541 ) ) ( not ( = ?auto_478538 ?auto_478542 ) ) ( not ( = ?auto_478538 ?auto_478543 ) ) ( not ( = ?auto_478538 ?auto_478544 ) ) ( not ( = ?auto_478539 ?auto_478540 ) ) ( not ( = ?auto_478539 ?auto_478541 ) ) ( not ( = ?auto_478539 ?auto_478542 ) ) ( not ( = ?auto_478539 ?auto_478543 ) ) ( not ( = ?auto_478539 ?auto_478544 ) ) ( not ( = ?auto_478540 ?auto_478541 ) ) ( not ( = ?auto_478540 ?auto_478542 ) ) ( not ( = ?auto_478540 ?auto_478543 ) ) ( not ( = ?auto_478540 ?auto_478544 ) ) ( not ( = ?auto_478541 ?auto_478542 ) ) ( not ( = ?auto_478541 ?auto_478543 ) ) ( not ( = ?auto_478541 ?auto_478544 ) ) ( not ( = ?auto_478542 ?auto_478543 ) ) ( not ( = ?auto_478542 ?auto_478544 ) ) ( not ( = ?auto_478543 ?auto_478544 ) ) ( ON ?auto_478542 ?auto_478543 ) ( ON ?auto_478541 ?auto_478542 ) ( ON ?auto_478540 ?auto_478541 ) ( CLEAR ?auto_478538 ) ( ON ?auto_478539 ?auto_478540 ) ( CLEAR ?auto_478539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_478535 ?auto_478536 ?auto_478537 ?auto_478538 ?auto_478539 )
      ( MAKE-9PILE ?auto_478535 ?auto_478536 ?auto_478537 ?auto_478538 ?auto_478539 ?auto_478540 ?auto_478541 ?auto_478542 ?auto_478543 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_478573 - BLOCK
      ?auto_478574 - BLOCK
      ?auto_478575 - BLOCK
      ?auto_478576 - BLOCK
      ?auto_478577 - BLOCK
      ?auto_478578 - BLOCK
      ?auto_478579 - BLOCK
      ?auto_478580 - BLOCK
      ?auto_478581 - BLOCK
    )
    :vars
    (
      ?auto_478582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478581 ?auto_478582 ) ( ON-TABLE ?auto_478573 ) ( ON ?auto_478574 ?auto_478573 ) ( ON ?auto_478575 ?auto_478574 ) ( not ( = ?auto_478573 ?auto_478574 ) ) ( not ( = ?auto_478573 ?auto_478575 ) ) ( not ( = ?auto_478573 ?auto_478576 ) ) ( not ( = ?auto_478573 ?auto_478577 ) ) ( not ( = ?auto_478573 ?auto_478578 ) ) ( not ( = ?auto_478573 ?auto_478579 ) ) ( not ( = ?auto_478573 ?auto_478580 ) ) ( not ( = ?auto_478573 ?auto_478581 ) ) ( not ( = ?auto_478573 ?auto_478582 ) ) ( not ( = ?auto_478574 ?auto_478575 ) ) ( not ( = ?auto_478574 ?auto_478576 ) ) ( not ( = ?auto_478574 ?auto_478577 ) ) ( not ( = ?auto_478574 ?auto_478578 ) ) ( not ( = ?auto_478574 ?auto_478579 ) ) ( not ( = ?auto_478574 ?auto_478580 ) ) ( not ( = ?auto_478574 ?auto_478581 ) ) ( not ( = ?auto_478574 ?auto_478582 ) ) ( not ( = ?auto_478575 ?auto_478576 ) ) ( not ( = ?auto_478575 ?auto_478577 ) ) ( not ( = ?auto_478575 ?auto_478578 ) ) ( not ( = ?auto_478575 ?auto_478579 ) ) ( not ( = ?auto_478575 ?auto_478580 ) ) ( not ( = ?auto_478575 ?auto_478581 ) ) ( not ( = ?auto_478575 ?auto_478582 ) ) ( not ( = ?auto_478576 ?auto_478577 ) ) ( not ( = ?auto_478576 ?auto_478578 ) ) ( not ( = ?auto_478576 ?auto_478579 ) ) ( not ( = ?auto_478576 ?auto_478580 ) ) ( not ( = ?auto_478576 ?auto_478581 ) ) ( not ( = ?auto_478576 ?auto_478582 ) ) ( not ( = ?auto_478577 ?auto_478578 ) ) ( not ( = ?auto_478577 ?auto_478579 ) ) ( not ( = ?auto_478577 ?auto_478580 ) ) ( not ( = ?auto_478577 ?auto_478581 ) ) ( not ( = ?auto_478577 ?auto_478582 ) ) ( not ( = ?auto_478578 ?auto_478579 ) ) ( not ( = ?auto_478578 ?auto_478580 ) ) ( not ( = ?auto_478578 ?auto_478581 ) ) ( not ( = ?auto_478578 ?auto_478582 ) ) ( not ( = ?auto_478579 ?auto_478580 ) ) ( not ( = ?auto_478579 ?auto_478581 ) ) ( not ( = ?auto_478579 ?auto_478582 ) ) ( not ( = ?auto_478580 ?auto_478581 ) ) ( not ( = ?auto_478580 ?auto_478582 ) ) ( not ( = ?auto_478581 ?auto_478582 ) ) ( ON ?auto_478580 ?auto_478581 ) ( ON ?auto_478579 ?auto_478580 ) ( ON ?auto_478578 ?auto_478579 ) ( ON ?auto_478577 ?auto_478578 ) ( CLEAR ?auto_478575 ) ( ON ?auto_478576 ?auto_478577 ) ( CLEAR ?auto_478576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_478573 ?auto_478574 ?auto_478575 ?auto_478576 )
      ( MAKE-9PILE ?auto_478573 ?auto_478574 ?auto_478575 ?auto_478576 ?auto_478577 ?auto_478578 ?auto_478579 ?auto_478580 ?auto_478581 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_478611 - BLOCK
      ?auto_478612 - BLOCK
      ?auto_478613 - BLOCK
      ?auto_478614 - BLOCK
      ?auto_478615 - BLOCK
      ?auto_478616 - BLOCK
      ?auto_478617 - BLOCK
      ?auto_478618 - BLOCK
      ?auto_478619 - BLOCK
    )
    :vars
    (
      ?auto_478620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478619 ?auto_478620 ) ( ON-TABLE ?auto_478611 ) ( ON ?auto_478612 ?auto_478611 ) ( not ( = ?auto_478611 ?auto_478612 ) ) ( not ( = ?auto_478611 ?auto_478613 ) ) ( not ( = ?auto_478611 ?auto_478614 ) ) ( not ( = ?auto_478611 ?auto_478615 ) ) ( not ( = ?auto_478611 ?auto_478616 ) ) ( not ( = ?auto_478611 ?auto_478617 ) ) ( not ( = ?auto_478611 ?auto_478618 ) ) ( not ( = ?auto_478611 ?auto_478619 ) ) ( not ( = ?auto_478611 ?auto_478620 ) ) ( not ( = ?auto_478612 ?auto_478613 ) ) ( not ( = ?auto_478612 ?auto_478614 ) ) ( not ( = ?auto_478612 ?auto_478615 ) ) ( not ( = ?auto_478612 ?auto_478616 ) ) ( not ( = ?auto_478612 ?auto_478617 ) ) ( not ( = ?auto_478612 ?auto_478618 ) ) ( not ( = ?auto_478612 ?auto_478619 ) ) ( not ( = ?auto_478612 ?auto_478620 ) ) ( not ( = ?auto_478613 ?auto_478614 ) ) ( not ( = ?auto_478613 ?auto_478615 ) ) ( not ( = ?auto_478613 ?auto_478616 ) ) ( not ( = ?auto_478613 ?auto_478617 ) ) ( not ( = ?auto_478613 ?auto_478618 ) ) ( not ( = ?auto_478613 ?auto_478619 ) ) ( not ( = ?auto_478613 ?auto_478620 ) ) ( not ( = ?auto_478614 ?auto_478615 ) ) ( not ( = ?auto_478614 ?auto_478616 ) ) ( not ( = ?auto_478614 ?auto_478617 ) ) ( not ( = ?auto_478614 ?auto_478618 ) ) ( not ( = ?auto_478614 ?auto_478619 ) ) ( not ( = ?auto_478614 ?auto_478620 ) ) ( not ( = ?auto_478615 ?auto_478616 ) ) ( not ( = ?auto_478615 ?auto_478617 ) ) ( not ( = ?auto_478615 ?auto_478618 ) ) ( not ( = ?auto_478615 ?auto_478619 ) ) ( not ( = ?auto_478615 ?auto_478620 ) ) ( not ( = ?auto_478616 ?auto_478617 ) ) ( not ( = ?auto_478616 ?auto_478618 ) ) ( not ( = ?auto_478616 ?auto_478619 ) ) ( not ( = ?auto_478616 ?auto_478620 ) ) ( not ( = ?auto_478617 ?auto_478618 ) ) ( not ( = ?auto_478617 ?auto_478619 ) ) ( not ( = ?auto_478617 ?auto_478620 ) ) ( not ( = ?auto_478618 ?auto_478619 ) ) ( not ( = ?auto_478618 ?auto_478620 ) ) ( not ( = ?auto_478619 ?auto_478620 ) ) ( ON ?auto_478618 ?auto_478619 ) ( ON ?auto_478617 ?auto_478618 ) ( ON ?auto_478616 ?auto_478617 ) ( ON ?auto_478615 ?auto_478616 ) ( ON ?auto_478614 ?auto_478615 ) ( CLEAR ?auto_478612 ) ( ON ?auto_478613 ?auto_478614 ) ( CLEAR ?auto_478613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_478611 ?auto_478612 ?auto_478613 )
      ( MAKE-9PILE ?auto_478611 ?auto_478612 ?auto_478613 ?auto_478614 ?auto_478615 ?auto_478616 ?auto_478617 ?auto_478618 ?auto_478619 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_478649 - BLOCK
      ?auto_478650 - BLOCK
      ?auto_478651 - BLOCK
      ?auto_478652 - BLOCK
      ?auto_478653 - BLOCK
      ?auto_478654 - BLOCK
      ?auto_478655 - BLOCK
      ?auto_478656 - BLOCK
      ?auto_478657 - BLOCK
    )
    :vars
    (
      ?auto_478658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478657 ?auto_478658 ) ( ON-TABLE ?auto_478649 ) ( not ( = ?auto_478649 ?auto_478650 ) ) ( not ( = ?auto_478649 ?auto_478651 ) ) ( not ( = ?auto_478649 ?auto_478652 ) ) ( not ( = ?auto_478649 ?auto_478653 ) ) ( not ( = ?auto_478649 ?auto_478654 ) ) ( not ( = ?auto_478649 ?auto_478655 ) ) ( not ( = ?auto_478649 ?auto_478656 ) ) ( not ( = ?auto_478649 ?auto_478657 ) ) ( not ( = ?auto_478649 ?auto_478658 ) ) ( not ( = ?auto_478650 ?auto_478651 ) ) ( not ( = ?auto_478650 ?auto_478652 ) ) ( not ( = ?auto_478650 ?auto_478653 ) ) ( not ( = ?auto_478650 ?auto_478654 ) ) ( not ( = ?auto_478650 ?auto_478655 ) ) ( not ( = ?auto_478650 ?auto_478656 ) ) ( not ( = ?auto_478650 ?auto_478657 ) ) ( not ( = ?auto_478650 ?auto_478658 ) ) ( not ( = ?auto_478651 ?auto_478652 ) ) ( not ( = ?auto_478651 ?auto_478653 ) ) ( not ( = ?auto_478651 ?auto_478654 ) ) ( not ( = ?auto_478651 ?auto_478655 ) ) ( not ( = ?auto_478651 ?auto_478656 ) ) ( not ( = ?auto_478651 ?auto_478657 ) ) ( not ( = ?auto_478651 ?auto_478658 ) ) ( not ( = ?auto_478652 ?auto_478653 ) ) ( not ( = ?auto_478652 ?auto_478654 ) ) ( not ( = ?auto_478652 ?auto_478655 ) ) ( not ( = ?auto_478652 ?auto_478656 ) ) ( not ( = ?auto_478652 ?auto_478657 ) ) ( not ( = ?auto_478652 ?auto_478658 ) ) ( not ( = ?auto_478653 ?auto_478654 ) ) ( not ( = ?auto_478653 ?auto_478655 ) ) ( not ( = ?auto_478653 ?auto_478656 ) ) ( not ( = ?auto_478653 ?auto_478657 ) ) ( not ( = ?auto_478653 ?auto_478658 ) ) ( not ( = ?auto_478654 ?auto_478655 ) ) ( not ( = ?auto_478654 ?auto_478656 ) ) ( not ( = ?auto_478654 ?auto_478657 ) ) ( not ( = ?auto_478654 ?auto_478658 ) ) ( not ( = ?auto_478655 ?auto_478656 ) ) ( not ( = ?auto_478655 ?auto_478657 ) ) ( not ( = ?auto_478655 ?auto_478658 ) ) ( not ( = ?auto_478656 ?auto_478657 ) ) ( not ( = ?auto_478656 ?auto_478658 ) ) ( not ( = ?auto_478657 ?auto_478658 ) ) ( ON ?auto_478656 ?auto_478657 ) ( ON ?auto_478655 ?auto_478656 ) ( ON ?auto_478654 ?auto_478655 ) ( ON ?auto_478653 ?auto_478654 ) ( ON ?auto_478652 ?auto_478653 ) ( ON ?auto_478651 ?auto_478652 ) ( CLEAR ?auto_478649 ) ( ON ?auto_478650 ?auto_478651 ) ( CLEAR ?auto_478650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_478649 ?auto_478650 )
      ( MAKE-9PILE ?auto_478649 ?auto_478650 ?auto_478651 ?auto_478652 ?auto_478653 ?auto_478654 ?auto_478655 ?auto_478656 ?auto_478657 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_478687 - BLOCK
      ?auto_478688 - BLOCK
      ?auto_478689 - BLOCK
      ?auto_478690 - BLOCK
      ?auto_478691 - BLOCK
      ?auto_478692 - BLOCK
      ?auto_478693 - BLOCK
      ?auto_478694 - BLOCK
      ?auto_478695 - BLOCK
    )
    :vars
    (
      ?auto_478696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478695 ?auto_478696 ) ( not ( = ?auto_478687 ?auto_478688 ) ) ( not ( = ?auto_478687 ?auto_478689 ) ) ( not ( = ?auto_478687 ?auto_478690 ) ) ( not ( = ?auto_478687 ?auto_478691 ) ) ( not ( = ?auto_478687 ?auto_478692 ) ) ( not ( = ?auto_478687 ?auto_478693 ) ) ( not ( = ?auto_478687 ?auto_478694 ) ) ( not ( = ?auto_478687 ?auto_478695 ) ) ( not ( = ?auto_478687 ?auto_478696 ) ) ( not ( = ?auto_478688 ?auto_478689 ) ) ( not ( = ?auto_478688 ?auto_478690 ) ) ( not ( = ?auto_478688 ?auto_478691 ) ) ( not ( = ?auto_478688 ?auto_478692 ) ) ( not ( = ?auto_478688 ?auto_478693 ) ) ( not ( = ?auto_478688 ?auto_478694 ) ) ( not ( = ?auto_478688 ?auto_478695 ) ) ( not ( = ?auto_478688 ?auto_478696 ) ) ( not ( = ?auto_478689 ?auto_478690 ) ) ( not ( = ?auto_478689 ?auto_478691 ) ) ( not ( = ?auto_478689 ?auto_478692 ) ) ( not ( = ?auto_478689 ?auto_478693 ) ) ( not ( = ?auto_478689 ?auto_478694 ) ) ( not ( = ?auto_478689 ?auto_478695 ) ) ( not ( = ?auto_478689 ?auto_478696 ) ) ( not ( = ?auto_478690 ?auto_478691 ) ) ( not ( = ?auto_478690 ?auto_478692 ) ) ( not ( = ?auto_478690 ?auto_478693 ) ) ( not ( = ?auto_478690 ?auto_478694 ) ) ( not ( = ?auto_478690 ?auto_478695 ) ) ( not ( = ?auto_478690 ?auto_478696 ) ) ( not ( = ?auto_478691 ?auto_478692 ) ) ( not ( = ?auto_478691 ?auto_478693 ) ) ( not ( = ?auto_478691 ?auto_478694 ) ) ( not ( = ?auto_478691 ?auto_478695 ) ) ( not ( = ?auto_478691 ?auto_478696 ) ) ( not ( = ?auto_478692 ?auto_478693 ) ) ( not ( = ?auto_478692 ?auto_478694 ) ) ( not ( = ?auto_478692 ?auto_478695 ) ) ( not ( = ?auto_478692 ?auto_478696 ) ) ( not ( = ?auto_478693 ?auto_478694 ) ) ( not ( = ?auto_478693 ?auto_478695 ) ) ( not ( = ?auto_478693 ?auto_478696 ) ) ( not ( = ?auto_478694 ?auto_478695 ) ) ( not ( = ?auto_478694 ?auto_478696 ) ) ( not ( = ?auto_478695 ?auto_478696 ) ) ( ON ?auto_478694 ?auto_478695 ) ( ON ?auto_478693 ?auto_478694 ) ( ON ?auto_478692 ?auto_478693 ) ( ON ?auto_478691 ?auto_478692 ) ( ON ?auto_478690 ?auto_478691 ) ( ON ?auto_478689 ?auto_478690 ) ( ON ?auto_478688 ?auto_478689 ) ( ON ?auto_478687 ?auto_478688 ) ( CLEAR ?auto_478687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_478687 )
      ( MAKE-9PILE ?auto_478687 ?auto_478688 ?auto_478689 ?auto_478690 ?auto_478691 ?auto_478692 ?auto_478693 ?auto_478694 ?auto_478695 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_478726 - BLOCK
      ?auto_478727 - BLOCK
      ?auto_478728 - BLOCK
      ?auto_478729 - BLOCK
      ?auto_478730 - BLOCK
      ?auto_478731 - BLOCK
      ?auto_478732 - BLOCK
      ?auto_478733 - BLOCK
      ?auto_478734 - BLOCK
      ?auto_478735 - BLOCK
    )
    :vars
    (
      ?auto_478736 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_478734 ) ( ON ?auto_478735 ?auto_478736 ) ( CLEAR ?auto_478735 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_478726 ) ( ON ?auto_478727 ?auto_478726 ) ( ON ?auto_478728 ?auto_478727 ) ( ON ?auto_478729 ?auto_478728 ) ( ON ?auto_478730 ?auto_478729 ) ( ON ?auto_478731 ?auto_478730 ) ( ON ?auto_478732 ?auto_478731 ) ( ON ?auto_478733 ?auto_478732 ) ( ON ?auto_478734 ?auto_478733 ) ( not ( = ?auto_478726 ?auto_478727 ) ) ( not ( = ?auto_478726 ?auto_478728 ) ) ( not ( = ?auto_478726 ?auto_478729 ) ) ( not ( = ?auto_478726 ?auto_478730 ) ) ( not ( = ?auto_478726 ?auto_478731 ) ) ( not ( = ?auto_478726 ?auto_478732 ) ) ( not ( = ?auto_478726 ?auto_478733 ) ) ( not ( = ?auto_478726 ?auto_478734 ) ) ( not ( = ?auto_478726 ?auto_478735 ) ) ( not ( = ?auto_478726 ?auto_478736 ) ) ( not ( = ?auto_478727 ?auto_478728 ) ) ( not ( = ?auto_478727 ?auto_478729 ) ) ( not ( = ?auto_478727 ?auto_478730 ) ) ( not ( = ?auto_478727 ?auto_478731 ) ) ( not ( = ?auto_478727 ?auto_478732 ) ) ( not ( = ?auto_478727 ?auto_478733 ) ) ( not ( = ?auto_478727 ?auto_478734 ) ) ( not ( = ?auto_478727 ?auto_478735 ) ) ( not ( = ?auto_478727 ?auto_478736 ) ) ( not ( = ?auto_478728 ?auto_478729 ) ) ( not ( = ?auto_478728 ?auto_478730 ) ) ( not ( = ?auto_478728 ?auto_478731 ) ) ( not ( = ?auto_478728 ?auto_478732 ) ) ( not ( = ?auto_478728 ?auto_478733 ) ) ( not ( = ?auto_478728 ?auto_478734 ) ) ( not ( = ?auto_478728 ?auto_478735 ) ) ( not ( = ?auto_478728 ?auto_478736 ) ) ( not ( = ?auto_478729 ?auto_478730 ) ) ( not ( = ?auto_478729 ?auto_478731 ) ) ( not ( = ?auto_478729 ?auto_478732 ) ) ( not ( = ?auto_478729 ?auto_478733 ) ) ( not ( = ?auto_478729 ?auto_478734 ) ) ( not ( = ?auto_478729 ?auto_478735 ) ) ( not ( = ?auto_478729 ?auto_478736 ) ) ( not ( = ?auto_478730 ?auto_478731 ) ) ( not ( = ?auto_478730 ?auto_478732 ) ) ( not ( = ?auto_478730 ?auto_478733 ) ) ( not ( = ?auto_478730 ?auto_478734 ) ) ( not ( = ?auto_478730 ?auto_478735 ) ) ( not ( = ?auto_478730 ?auto_478736 ) ) ( not ( = ?auto_478731 ?auto_478732 ) ) ( not ( = ?auto_478731 ?auto_478733 ) ) ( not ( = ?auto_478731 ?auto_478734 ) ) ( not ( = ?auto_478731 ?auto_478735 ) ) ( not ( = ?auto_478731 ?auto_478736 ) ) ( not ( = ?auto_478732 ?auto_478733 ) ) ( not ( = ?auto_478732 ?auto_478734 ) ) ( not ( = ?auto_478732 ?auto_478735 ) ) ( not ( = ?auto_478732 ?auto_478736 ) ) ( not ( = ?auto_478733 ?auto_478734 ) ) ( not ( = ?auto_478733 ?auto_478735 ) ) ( not ( = ?auto_478733 ?auto_478736 ) ) ( not ( = ?auto_478734 ?auto_478735 ) ) ( not ( = ?auto_478734 ?auto_478736 ) ) ( not ( = ?auto_478735 ?auto_478736 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_478735 ?auto_478736 )
      ( !STACK ?auto_478735 ?auto_478734 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_478768 - BLOCK
      ?auto_478769 - BLOCK
      ?auto_478770 - BLOCK
      ?auto_478771 - BLOCK
      ?auto_478772 - BLOCK
      ?auto_478773 - BLOCK
      ?auto_478774 - BLOCK
      ?auto_478775 - BLOCK
      ?auto_478776 - BLOCK
      ?auto_478777 - BLOCK
    )
    :vars
    (
      ?auto_478778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478777 ?auto_478778 ) ( ON-TABLE ?auto_478768 ) ( ON ?auto_478769 ?auto_478768 ) ( ON ?auto_478770 ?auto_478769 ) ( ON ?auto_478771 ?auto_478770 ) ( ON ?auto_478772 ?auto_478771 ) ( ON ?auto_478773 ?auto_478772 ) ( ON ?auto_478774 ?auto_478773 ) ( ON ?auto_478775 ?auto_478774 ) ( not ( = ?auto_478768 ?auto_478769 ) ) ( not ( = ?auto_478768 ?auto_478770 ) ) ( not ( = ?auto_478768 ?auto_478771 ) ) ( not ( = ?auto_478768 ?auto_478772 ) ) ( not ( = ?auto_478768 ?auto_478773 ) ) ( not ( = ?auto_478768 ?auto_478774 ) ) ( not ( = ?auto_478768 ?auto_478775 ) ) ( not ( = ?auto_478768 ?auto_478776 ) ) ( not ( = ?auto_478768 ?auto_478777 ) ) ( not ( = ?auto_478768 ?auto_478778 ) ) ( not ( = ?auto_478769 ?auto_478770 ) ) ( not ( = ?auto_478769 ?auto_478771 ) ) ( not ( = ?auto_478769 ?auto_478772 ) ) ( not ( = ?auto_478769 ?auto_478773 ) ) ( not ( = ?auto_478769 ?auto_478774 ) ) ( not ( = ?auto_478769 ?auto_478775 ) ) ( not ( = ?auto_478769 ?auto_478776 ) ) ( not ( = ?auto_478769 ?auto_478777 ) ) ( not ( = ?auto_478769 ?auto_478778 ) ) ( not ( = ?auto_478770 ?auto_478771 ) ) ( not ( = ?auto_478770 ?auto_478772 ) ) ( not ( = ?auto_478770 ?auto_478773 ) ) ( not ( = ?auto_478770 ?auto_478774 ) ) ( not ( = ?auto_478770 ?auto_478775 ) ) ( not ( = ?auto_478770 ?auto_478776 ) ) ( not ( = ?auto_478770 ?auto_478777 ) ) ( not ( = ?auto_478770 ?auto_478778 ) ) ( not ( = ?auto_478771 ?auto_478772 ) ) ( not ( = ?auto_478771 ?auto_478773 ) ) ( not ( = ?auto_478771 ?auto_478774 ) ) ( not ( = ?auto_478771 ?auto_478775 ) ) ( not ( = ?auto_478771 ?auto_478776 ) ) ( not ( = ?auto_478771 ?auto_478777 ) ) ( not ( = ?auto_478771 ?auto_478778 ) ) ( not ( = ?auto_478772 ?auto_478773 ) ) ( not ( = ?auto_478772 ?auto_478774 ) ) ( not ( = ?auto_478772 ?auto_478775 ) ) ( not ( = ?auto_478772 ?auto_478776 ) ) ( not ( = ?auto_478772 ?auto_478777 ) ) ( not ( = ?auto_478772 ?auto_478778 ) ) ( not ( = ?auto_478773 ?auto_478774 ) ) ( not ( = ?auto_478773 ?auto_478775 ) ) ( not ( = ?auto_478773 ?auto_478776 ) ) ( not ( = ?auto_478773 ?auto_478777 ) ) ( not ( = ?auto_478773 ?auto_478778 ) ) ( not ( = ?auto_478774 ?auto_478775 ) ) ( not ( = ?auto_478774 ?auto_478776 ) ) ( not ( = ?auto_478774 ?auto_478777 ) ) ( not ( = ?auto_478774 ?auto_478778 ) ) ( not ( = ?auto_478775 ?auto_478776 ) ) ( not ( = ?auto_478775 ?auto_478777 ) ) ( not ( = ?auto_478775 ?auto_478778 ) ) ( not ( = ?auto_478776 ?auto_478777 ) ) ( not ( = ?auto_478776 ?auto_478778 ) ) ( not ( = ?auto_478777 ?auto_478778 ) ) ( CLEAR ?auto_478775 ) ( ON ?auto_478776 ?auto_478777 ) ( CLEAR ?auto_478776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_478768 ?auto_478769 ?auto_478770 ?auto_478771 ?auto_478772 ?auto_478773 ?auto_478774 ?auto_478775 ?auto_478776 )
      ( MAKE-10PILE ?auto_478768 ?auto_478769 ?auto_478770 ?auto_478771 ?auto_478772 ?auto_478773 ?auto_478774 ?auto_478775 ?auto_478776 ?auto_478777 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_478810 - BLOCK
      ?auto_478811 - BLOCK
      ?auto_478812 - BLOCK
      ?auto_478813 - BLOCK
      ?auto_478814 - BLOCK
      ?auto_478815 - BLOCK
      ?auto_478816 - BLOCK
      ?auto_478817 - BLOCK
      ?auto_478818 - BLOCK
      ?auto_478819 - BLOCK
    )
    :vars
    (
      ?auto_478820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478819 ?auto_478820 ) ( ON-TABLE ?auto_478810 ) ( ON ?auto_478811 ?auto_478810 ) ( ON ?auto_478812 ?auto_478811 ) ( ON ?auto_478813 ?auto_478812 ) ( ON ?auto_478814 ?auto_478813 ) ( ON ?auto_478815 ?auto_478814 ) ( ON ?auto_478816 ?auto_478815 ) ( not ( = ?auto_478810 ?auto_478811 ) ) ( not ( = ?auto_478810 ?auto_478812 ) ) ( not ( = ?auto_478810 ?auto_478813 ) ) ( not ( = ?auto_478810 ?auto_478814 ) ) ( not ( = ?auto_478810 ?auto_478815 ) ) ( not ( = ?auto_478810 ?auto_478816 ) ) ( not ( = ?auto_478810 ?auto_478817 ) ) ( not ( = ?auto_478810 ?auto_478818 ) ) ( not ( = ?auto_478810 ?auto_478819 ) ) ( not ( = ?auto_478810 ?auto_478820 ) ) ( not ( = ?auto_478811 ?auto_478812 ) ) ( not ( = ?auto_478811 ?auto_478813 ) ) ( not ( = ?auto_478811 ?auto_478814 ) ) ( not ( = ?auto_478811 ?auto_478815 ) ) ( not ( = ?auto_478811 ?auto_478816 ) ) ( not ( = ?auto_478811 ?auto_478817 ) ) ( not ( = ?auto_478811 ?auto_478818 ) ) ( not ( = ?auto_478811 ?auto_478819 ) ) ( not ( = ?auto_478811 ?auto_478820 ) ) ( not ( = ?auto_478812 ?auto_478813 ) ) ( not ( = ?auto_478812 ?auto_478814 ) ) ( not ( = ?auto_478812 ?auto_478815 ) ) ( not ( = ?auto_478812 ?auto_478816 ) ) ( not ( = ?auto_478812 ?auto_478817 ) ) ( not ( = ?auto_478812 ?auto_478818 ) ) ( not ( = ?auto_478812 ?auto_478819 ) ) ( not ( = ?auto_478812 ?auto_478820 ) ) ( not ( = ?auto_478813 ?auto_478814 ) ) ( not ( = ?auto_478813 ?auto_478815 ) ) ( not ( = ?auto_478813 ?auto_478816 ) ) ( not ( = ?auto_478813 ?auto_478817 ) ) ( not ( = ?auto_478813 ?auto_478818 ) ) ( not ( = ?auto_478813 ?auto_478819 ) ) ( not ( = ?auto_478813 ?auto_478820 ) ) ( not ( = ?auto_478814 ?auto_478815 ) ) ( not ( = ?auto_478814 ?auto_478816 ) ) ( not ( = ?auto_478814 ?auto_478817 ) ) ( not ( = ?auto_478814 ?auto_478818 ) ) ( not ( = ?auto_478814 ?auto_478819 ) ) ( not ( = ?auto_478814 ?auto_478820 ) ) ( not ( = ?auto_478815 ?auto_478816 ) ) ( not ( = ?auto_478815 ?auto_478817 ) ) ( not ( = ?auto_478815 ?auto_478818 ) ) ( not ( = ?auto_478815 ?auto_478819 ) ) ( not ( = ?auto_478815 ?auto_478820 ) ) ( not ( = ?auto_478816 ?auto_478817 ) ) ( not ( = ?auto_478816 ?auto_478818 ) ) ( not ( = ?auto_478816 ?auto_478819 ) ) ( not ( = ?auto_478816 ?auto_478820 ) ) ( not ( = ?auto_478817 ?auto_478818 ) ) ( not ( = ?auto_478817 ?auto_478819 ) ) ( not ( = ?auto_478817 ?auto_478820 ) ) ( not ( = ?auto_478818 ?auto_478819 ) ) ( not ( = ?auto_478818 ?auto_478820 ) ) ( not ( = ?auto_478819 ?auto_478820 ) ) ( ON ?auto_478818 ?auto_478819 ) ( CLEAR ?auto_478816 ) ( ON ?auto_478817 ?auto_478818 ) ( CLEAR ?auto_478817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_478810 ?auto_478811 ?auto_478812 ?auto_478813 ?auto_478814 ?auto_478815 ?auto_478816 ?auto_478817 )
      ( MAKE-10PILE ?auto_478810 ?auto_478811 ?auto_478812 ?auto_478813 ?auto_478814 ?auto_478815 ?auto_478816 ?auto_478817 ?auto_478818 ?auto_478819 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_478852 - BLOCK
      ?auto_478853 - BLOCK
      ?auto_478854 - BLOCK
      ?auto_478855 - BLOCK
      ?auto_478856 - BLOCK
      ?auto_478857 - BLOCK
      ?auto_478858 - BLOCK
      ?auto_478859 - BLOCK
      ?auto_478860 - BLOCK
      ?auto_478861 - BLOCK
    )
    :vars
    (
      ?auto_478862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478861 ?auto_478862 ) ( ON-TABLE ?auto_478852 ) ( ON ?auto_478853 ?auto_478852 ) ( ON ?auto_478854 ?auto_478853 ) ( ON ?auto_478855 ?auto_478854 ) ( ON ?auto_478856 ?auto_478855 ) ( ON ?auto_478857 ?auto_478856 ) ( not ( = ?auto_478852 ?auto_478853 ) ) ( not ( = ?auto_478852 ?auto_478854 ) ) ( not ( = ?auto_478852 ?auto_478855 ) ) ( not ( = ?auto_478852 ?auto_478856 ) ) ( not ( = ?auto_478852 ?auto_478857 ) ) ( not ( = ?auto_478852 ?auto_478858 ) ) ( not ( = ?auto_478852 ?auto_478859 ) ) ( not ( = ?auto_478852 ?auto_478860 ) ) ( not ( = ?auto_478852 ?auto_478861 ) ) ( not ( = ?auto_478852 ?auto_478862 ) ) ( not ( = ?auto_478853 ?auto_478854 ) ) ( not ( = ?auto_478853 ?auto_478855 ) ) ( not ( = ?auto_478853 ?auto_478856 ) ) ( not ( = ?auto_478853 ?auto_478857 ) ) ( not ( = ?auto_478853 ?auto_478858 ) ) ( not ( = ?auto_478853 ?auto_478859 ) ) ( not ( = ?auto_478853 ?auto_478860 ) ) ( not ( = ?auto_478853 ?auto_478861 ) ) ( not ( = ?auto_478853 ?auto_478862 ) ) ( not ( = ?auto_478854 ?auto_478855 ) ) ( not ( = ?auto_478854 ?auto_478856 ) ) ( not ( = ?auto_478854 ?auto_478857 ) ) ( not ( = ?auto_478854 ?auto_478858 ) ) ( not ( = ?auto_478854 ?auto_478859 ) ) ( not ( = ?auto_478854 ?auto_478860 ) ) ( not ( = ?auto_478854 ?auto_478861 ) ) ( not ( = ?auto_478854 ?auto_478862 ) ) ( not ( = ?auto_478855 ?auto_478856 ) ) ( not ( = ?auto_478855 ?auto_478857 ) ) ( not ( = ?auto_478855 ?auto_478858 ) ) ( not ( = ?auto_478855 ?auto_478859 ) ) ( not ( = ?auto_478855 ?auto_478860 ) ) ( not ( = ?auto_478855 ?auto_478861 ) ) ( not ( = ?auto_478855 ?auto_478862 ) ) ( not ( = ?auto_478856 ?auto_478857 ) ) ( not ( = ?auto_478856 ?auto_478858 ) ) ( not ( = ?auto_478856 ?auto_478859 ) ) ( not ( = ?auto_478856 ?auto_478860 ) ) ( not ( = ?auto_478856 ?auto_478861 ) ) ( not ( = ?auto_478856 ?auto_478862 ) ) ( not ( = ?auto_478857 ?auto_478858 ) ) ( not ( = ?auto_478857 ?auto_478859 ) ) ( not ( = ?auto_478857 ?auto_478860 ) ) ( not ( = ?auto_478857 ?auto_478861 ) ) ( not ( = ?auto_478857 ?auto_478862 ) ) ( not ( = ?auto_478858 ?auto_478859 ) ) ( not ( = ?auto_478858 ?auto_478860 ) ) ( not ( = ?auto_478858 ?auto_478861 ) ) ( not ( = ?auto_478858 ?auto_478862 ) ) ( not ( = ?auto_478859 ?auto_478860 ) ) ( not ( = ?auto_478859 ?auto_478861 ) ) ( not ( = ?auto_478859 ?auto_478862 ) ) ( not ( = ?auto_478860 ?auto_478861 ) ) ( not ( = ?auto_478860 ?auto_478862 ) ) ( not ( = ?auto_478861 ?auto_478862 ) ) ( ON ?auto_478860 ?auto_478861 ) ( ON ?auto_478859 ?auto_478860 ) ( CLEAR ?auto_478857 ) ( ON ?auto_478858 ?auto_478859 ) ( CLEAR ?auto_478858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_478852 ?auto_478853 ?auto_478854 ?auto_478855 ?auto_478856 ?auto_478857 ?auto_478858 )
      ( MAKE-10PILE ?auto_478852 ?auto_478853 ?auto_478854 ?auto_478855 ?auto_478856 ?auto_478857 ?auto_478858 ?auto_478859 ?auto_478860 ?auto_478861 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_478894 - BLOCK
      ?auto_478895 - BLOCK
      ?auto_478896 - BLOCK
      ?auto_478897 - BLOCK
      ?auto_478898 - BLOCK
      ?auto_478899 - BLOCK
      ?auto_478900 - BLOCK
      ?auto_478901 - BLOCK
      ?auto_478902 - BLOCK
      ?auto_478903 - BLOCK
    )
    :vars
    (
      ?auto_478904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478903 ?auto_478904 ) ( ON-TABLE ?auto_478894 ) ( ON ?auto_478895 ?auto_478894 ) ( ON ?auto_478896 ?auto_478895 ) ( ON ?auto_478897 ?auto_478896 ) ( ON ?auto_478898 ?auto_478897 ) ( not ( = ?auto_478894 ?auto_478895 ) ) ( not ( = ?auto_478894 ?auto_478896 ) ) ( not ( = ?auto_478894 ?auto_478897 ) ) ( not ( = ?auto_478894 ?auto_478898 ) ) ( not ( = ?auto_478894 ?auto_478899 ) ) ( not ( = ?auto_478894 ?auto_478900 ) ) ( not ( = ?auto_478894 ?auto_478901 ) ) ( not ( = ?auto_478894 ?auto_478902 ) ) ( not ( = ?auto_478894 ?auto_478903 ) ) ( not ( = ?auto_478894 ?auto_478904 ) ) ( not ( = ?auto_478895 ?auto_478896 ) ) ( not ( = ?auto_478895 ?auto_478897 ) ) ( not ( = ?auto_478895 ?auto_478898 ) ) ( not ( = ?auto_478895 ?auto_478899 ) ) ( not ( = ?auto_478895 ?auto_478900 ) ) ( not ( = ?auto_478895 ?auto_478901 ) ) ( not ( = ?auto_478895 ?auto_478902 ) ) ( not ( = ?auto_478895 ?auto_478903 ) ) ( not ( = ?auto_478895 ?auto_478904 ) ) ( not ( = ?auto_478896 ?auto_478897 ) ) ( not ( = ?auto_478896 ?auto_478898 ) ) ( not ( = ?auto_478896 ?auto_478899 ) ) ( not ( = ?auto_478896 ?auto_478900 ) ) ( not ( = ?auto_478896 ?auto_478901 ) ) ( not ( = ?auto_478896 ?auto_478902 ) ) ( not ( = ?auto_478896 ?auto_478903 ) ) ( not ( = ?auto_478896 ?auto_478904 ) ) ( not ( = ?auto_478897 ?auto_478898 ) ) ( not ( = ?auto_478897 ?auto_478899 ) ) ( not ( = ?auto_478897 ?auto_478900 ) ) ( not ( = ?auto_478897 ?auto_478901 ) ) ( not ( = ?auto_478897 ?auto_478902 ) ) ( not ( = ?auto_478897 ?auto_478903 ) ) ( not ( = ?auto_478897 ?auto_478904 ) ) ( not ( = ?auto_478898 ?auto_478899 ) ) ( not ( = ?auto_478898 ?auto_478900 ) ) ( not ( = ?auto_478898 ?auto_478901 ) ) ( not ( = ?auto_478898 ?auto_478902 ) ) ( not ( = ?auto_478898 ?auto_478903 ) ) ( not ( = ?auto_478898 ?auto_478904 ) ) ( not ( = ?auto_478899 ?auto_478900 ) ) ( not ( = ?auto_478899 ?auto_478901 ) ) ( not ( = ?auto_478899 ?auto_478902 ) ) ( not ( = ?auto_478899 ?auto_478903 ) ) ( not ( = ?auto_478899 ?auto_478904 ) ) ( not ( = ?auto_478900 ?auto_478901 ) ) ( not ( = ?auto_478900 ?auto_478902 ) ) ( not ( = ?auto_478900 ?auto_478903 ) ) ( not ( = ?auto_478900 ?auto_478904 ) ) ( not ( = ?auto_478901 ?auto_478902 ) ) ( not ( = ?auto_478901 ?auto_478903 ) ) ( not ( = ?auto_478901 ?auto_478904 ) ) ( not ( = ?auto_478902 ?auto_478903 ) ) ( not ( = ?auto_478902 ?auto_478904 ) ) ( not ( = ?auto_478903 ?auto_478904 ) ) ( ON ?auto_478902 ?auto_478903 ) ( ON ?auto_478901 ?auto_478902 ) ( ON ?auto_478900 ?auto_478901 ) ( CLEAR ?auto_478898 ) ( ON ?auto_478899 ?auto_478900 ) ( CLEAR ?auto_478899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_478894 ?auto_478895 ?auto_478896 ?auto_478897 ?auto_478898 ?auto_478899 )
      ( MAKE-10PILE ?auto_478894 ?auto_478895 ?auto_478896 ?auto_478897 ?auto_478898 ?auto_478899 ?auto_478900 ?auto_478901 ?auto_478902 ?auto_478903 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_478936 - BLOCK
      ?auto_478937 - BLOCK
      ?auto_478938 - BLOCK
      ?auto_478939 - BLOCK
      ?auto_478940 - BLOCK
      ?auto_478941 - BLOCK
      ?auto_478942 - BLOCK
      ?auto_478943 - BLOCK
      ?auto_478944 - BLOCK
      ?auto_478945 - BLOCK
    )
    :vars
    (
      ?auto_478946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478945 ?auto_478946 ) ( ON-TABLE ?auto_478936 ) ( ON ?auto_478937 ?auto_478936 ) ( ON ?auto_478938 ?auto_478937 ) ( ON ?auto_478939 ?auto_478938 ) ( not ( = ?auto_478936 ?auto_478937 ) ) ( not ( = ?auto_478936 ?auto_478938 ) ) ( not ( = ?auto_478936 ?auto_478939 ) ) ( not ( = ?auto_478936 ?auto_478940 ) ) ( not ( = ?auto_478936 ?auto_478941 ) ) ( not ( = ?auto_478936 ?auto_478942 ) ) ( not ( = ?auto_478936 ?auto_478943 ) ) ( not ( = ?auto_478936 ?auto_478944 ) ) ( not ( = ?auto_478936 ?auto_478945 ) ) ( not ( = ?auto_478936 ?auto_478946 ) ) ( not ( = ?auto_478937 ?auto_478938 ) ) ( not ( = ?auto_478937 ?auto_478939 ) ) ( not ( = ?auto_478937 ?auto_478940 ) ) ( not ( = ?auto_478937 ?auto_478941 ) ) ( not ( = ?auto_478937 ?auto_478942 ) ) ( not ( = ?auto_478937 ?auto_478943 ) ) ( not ( = ?auto_478937 ?auto_478944 ) ) ( not ( = ?auto_478937 ?auto_478945 ) ) ( not ( = ?auto_478937 ?auto_478946 ) ) ( not ( = ?auto_478938 ?auto_478939 ) ) ( not ( = ?auto_478938 ?auto_478940 ) ) ( not ( = ?auto_478938 ?auto_478941 ) ) ( not ( = ?auto_478938 ?auto_478942 ) ) ( not ( = ?auto_478938 ?auto_478943 ) ) ( not ( = ?auto_478938 ?auto_478944 ) ) ( not ( = ?auto_478938 ?auto_478945 ) ) ( not ( = ?auto_478938 ?auto_478946 ) ) ( not ( = ?auto_478939 ?auto_478940 ) ) ( not ( = ?auto_478939 ?auto_478941 ) ) ( not ( = ?auto_478939 ?auto_478942 ) ) ( not ( = ?auto_478939 ?auto_478943 ) ) ( not ( = ?auto_478939 ?auto_478944 ) ) ( not ( = ?auto_478939 ?auto_478945 ) ) ( not ( = ?auto_478939 ?auto_478946 ) ) ( not ( = ?auto_478940 ?auto_478941 ) ) ( not ( = ?auto_478940 ?auto_478942 ) ) ( not ( = ?auto_478940 ?auto_478943 ) ) ( not ( = ?auto_478940 ?auto_478944 ) ) ( not ( = ?auto_478940 ?auto_478945 ) ) ( not ( = ?auto_478940 ?auto_478946 ) ) ( not ( = ?auto_478941 ?auto_478942 ) ) ( not ( = ?auto_478941 ?auto_478943 ) ) ( not ( = ?auto_478941 ?auto_478944 ) ) ( not ( = ?auto_478941 ?auto_478945 ) ) ( not ( = ?auto_478941 ?auto_478946 ) ) ( not ( = ?auto_478942 ?auto_478943 ) ) ( not ( = ?auto_478942 ?auto_478944 ) ) ( not ( = ?auto_478942 ?auto_478945 ) ) ( not ( = ?auto_478942 ?auto_478946 ) ) ( not ( = ?auto_478943 ?auto_478944 ) ) ( not ( = ?auto_478943 ?auto_478945 ) ) ( not ( = ?auto_478943 ?auto_478946 ) ) ( not ( = ?auto_478944 ?auto_478945 ) ) ( not ( = ?auto_478944 ?auto_478946 ) ) ( not ( = ?auto_478945 ?auto_478946 ) ) ( ON ?auto_478944 ?auto_478945 ) ( ON ?auto_478943 ?auto_478944 ) ( ON ?auto_478942 ?auto_478943 ) ( ON ?auto_478941 ?auto_478942 ) ( CLEAR ?auto_478939 ) ( ON ?auto_478940 ?auto_478941 ) ( CLEAR ?auto_478940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_478936 ?auto_478937 ?auto_478938 ?auto_478939 ?auto_478940 )
      ( MAKE-10PILE ?auto_478936 ?auto_478937 ?auto_478938 ?auto_478939 ?auto_478940 ?auto_478941 ?auto_478942 ?auto_478943 ?auto_478944 ?auto_478945 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_478978 - BLOCK
      ?auto_478979 - BLOCK
      ?auto_478980 - BLOCK
      ?auto_478981 - BLOCK
      ?auto_478982 - BLOCK
      ?auto_478983 - BLOCK
      ?auto_478984 - BLOCK
      ?auto_478985 - BLOCK
      ?auto_478986 - BLOCK
      ?auto_478987 - BLOCK
    )
    :vars
    (
      ?auto_478988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_478987 ?auto_478988 ) ( ON-TABLE ?auto_478978 ) ( ON ?auto_478979 ?auto_478978 ) ( ON ?auto_478980 ?auto_478979 ) ( not ( = ?auto_478978 ?auto_478979 ) ) ( not ( = ?auto_478978 ?auto_478980 ) ) ( not ( = ?auto_478978 ?auto_478981 ) ) ( not ( = ?auto_478978 ?auto_478982 ) ) ( not ( = ?auto_478978 ?auto_478983 ) ) ( not ( = ?auto_478978 ?auto_478984 ) ) ( not ( = ?auto_478978 ?auto_478985 ) ) ( not ( = ?auto_478978 ?auto_478986 ) ) ( not ( = ?auto_478978 ?auto_478987 ) ) ( not ( = ?auto_478978 ?auto_478988 ) ) ( not ( = ?auto_478979 ?auto_478980 ) ) ( not ( = ?auto_478979 ?auto_478981 ) ) ( not ( = ?auto_478979 ?auto_478982 ) ) ( not ( = ?auto_478979 ?auto_478983 ) ) ( not ( = ?auto_478979 ?auto_478984 ) ) ( not ( = ?auto_478979 ?auto_478985 ) ) ( not ( = ?auto_478979 ?auto_478986 ) ) ( not ( = ?auto_478979 ?auto_478987 ) ) ( not ( = ?auto_478979 ?auto_478988 ) ) ( not ( = ?auto_478980 ?auto_478981 ) ) ( not ( = ?auto_478980 ?auto_478982 ) ) ( not ( = ?auto_478980 ?auto_478983 ) ) ( not ( = ?auto_478980 ?auto_478984 ) ) ( not ( = ?auto_478980 ?auto_478985 ) ) ( not ( = ?auto_478980 ?auto_478986 ) ) ( not ( = ?auto_478980 ?auto_478987 ) ) ( not ( = ?auto_478980 ?auto_478988 ) ) ( not ( = ?auto_478981 ?auto_478982 ) ) ( not ( = ?auto_478981 ?auto_478983 ) ) ( not ( = ?auto_478981 ?auto_478984 ) ) ( not ( = ?auto_478981 ?auto_478985 ) ) ( not ( = ?auto_478981 ?auto_478986 ) ) ( not ( = ?auto_478981 ?auto_478987 ) ) ( not ( = ?auto_478981 ?auto_478988 ) ) ( not ( = ?auto_478982 ?auto_478983 ) ) ( not ( = ?auto_478982 ?auto_478984 ) ) ( not ( = ?auto_478982 ?auto_478985 ) ) ( not ( = ?auto_478982 ?auto_478986 ) ) ( not ( = ?auto_478982 ?auto_478987 ) ) ( not ( = ?auto_478982 ?auto_478988 ) ) ( not ( = ?auto_478983 ?auto_478984 ) ) ( not ( = ?auto_478983 ?auto_478985 ) ) ( not ( = ?auto_478983 ?auto_478986 ) ) ( not ( = ?auto_478983 ?auto_478987 ) ) ( not ( = ?auto_478983 ?auto_478988 ) ) ( not ( = ?auto_478984 ?auto_478985 ) ) ( not ( = ?auto_478984 ?auto_478986 ) ) ( not ( = ?auto_478984 ?auto_478987 ) ) ( not ( = ?auto_478984 ?auto_478988 ) ) ( not ( = ?auto_478985 ?auto_478986 ) ) ( not ( = ?auto_478985 ?auto_478987 ) ) ( not ( = ?auto_478985 ?auto_478988 ) ) ( not ( = ?auto_478986 ?auto_478987 ) ) ( not ( = ?auto_478986 ?auto_478988 ) ) ( not ( = ?auto_478987 ?auto_478988 ) ) ( ON ?auto_478986 ?auto_478987 ) ( ON ?auto_478985 ?auto_478986 ) ( ON ?auto_478984 ?auto_478985 ) ( ON ?auto_478983 ?auto_478984 ) ( ON ?auto_478982 ?auto_478983 ) ( CLEAR ?auto_478980 ) ( ON ?auto_478981 ?auto_478982 ) ( CLEAR ?auto_478981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_478978 ?auto_478979 ?auto_478980 ?auto_478981 )
      ( MAKE-10PILE ?auto_478978 ?auto_478979 ?auto_478980 ?auto_478981 ?auto_478982 ?auto_478983 ?auto_478984 ?auto_478985 ?auto_478986 ?auto_478987 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_479020 - BLOCK
      ?auto_479021 - BLOCK
      ?auto_479022 - BLOCK
      ?auto_479023 - BLOCK
      ?auto_479024 - BLOCK
      ?auto_479025 - BLOCK
      ?auto_479026 - BLOCK
      ?auto_479027 - BLOCK
      ?auto_479028 - BLOCK
      ?auto_479029 - BLOCK
    )
    :vars
    (
      ?auto_479030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479029 ?auto_479030 ) ( ON-TABLE ?auto_479020 ) ( ON ?auto_479021 ?auto_479020 ) ( not ( = ?auto_479020 ?auto_479021 ) ) ( not ( = ?auto_479020 ?auto_479022 ) ) ( not ( = ?auto_479020 ?auto_479023 ) ) ( not ( = ?auto_479020 ?auto_479024 ) ) ( not ( = ?auto_479020 ?auto_479025 ) ) ( not ( = ?auto_479020 ?auto_479026 ) ) ( not ( = ?auto_479020 ?auto_479027 ) ) ( not ( = ?auto_479020 ?auto_479028 ) ) ( not ( = ?auto_479020 ?auto_479029 ) ) ( not ( = ?auto_479020 ?auto_479030 ) ) ( not ( = ?auto_479021 ?auto_479022 ) ) ( not ( = ?auto_479021 ?auto_479023 ) ) ( not ( = ?auto_479021 ?auto_479024 ) ) ( not ( = ?auto_479021 ?auto_479025 ) ) ( not ( = ?auto_479021 ?auto_479026 ) ) ( not ( = ?auto_479021 ?auto_479027 ) ) ( not ( = ?auto_479021 ?auto_479028 ) ) ( not ( = ?auto_479021 ?auto_479029 ) ) ( not ( = ?auto_479021 ?auto_479030 ) ) ( not ( = ?auto_479022 ?auto_479023 ) ) ( not ( = ?auto_479022 ?auto_479024 ) ) ( not ( = ?auto_479022 ?auto_479025 ) ) ( not ( = ?auto_479022 ?auto_479026 ) ) ( not ( = ?auto_479022 ?auto_479027 ) ) ( not ( = ?auto_479022 ?auto_479028 ) ) ( not ( = ?auto_479022 ?auto_479029 ) ) ( not ( = ?auto_479022 ?auto_479030 ) ) ( not ( = ?auto_479023 ?auto_479024 ) ) ( not ( = ?auto_479023 ?auto_479025 ) ) ( not ( = ?auto_479023 ?auto_479026 ) ) ( not ( = ?auto_479023 ?auto_479027 ) ) ( not ( = ?auto_479023 ?auto_479028 ) ) ( not ( = ?auto_479023 ?auto_479029 ) ) ( not ( = ?auto_479023 ?auto_479030 ) ) ( not ( = ?auto_479024 ?auto_479025 ) ) ( not ( = ?auto_479024 ?auto_479026 ) ) ( not ( = ?auto_479024 ?auto_479027 ) ) ( not ( = ?auto_479024 ?auto_479028 ) ) ( not ( = ?auto_479024 ?auto_479029 ) ) ( not ( = ?auto_479024 ?auto_479030 ) ) ( not ( = ?auto_479025 ?auto_479026 ) ) ( not ( = ?auto_479025 ?auto_479027 ) ) ( not ( = ?auto_479025 ?auto_479028 ) ) ( not ( = ?auto_479025 ?auto_479029 ) ) ( not ( = ?auto_479025 ?auto_479030 ) ) ( not ( = ?auto_479026 ?auto_479027 ) ) ( not ( = ?auto_479026 ?auto_479028 ) ) ( not ( = ?auto_479026 ?auto_479029 ) ) ( not ( = ?auto_479026 ?auto_479030 ) ) ( not ( = ?auto_479027 ?auto_479028 ) ) ( not ( = ?auto_479027 ?auto_479029 ) ) ( not ( = ?auto_479027 ?auto_479030 ) ) ( not ( = ?auto_479028 ?auto_479029 ) ) ( not ( = ?auto_479028 ?auto_479030 ) ) ( not ( = ?auto_479029 ?auto_479030 ) ) ( ON ?auto_479028 ?auto_479029 ) ( ON ?auto_479027 ?auto_479028 ) ( ON ?auto_479026 ?auto_479027 ) ( ON ?auto_479025 ?auto_479026 ) ( ON ?auto_479024 ?auto_479025 ) ( ON ?auto_479023 ?auto_479024 ) ( CLEAR ?auto_479021 ) ( ON ?auto_479022 ?auto_479023 ) ( CLEAR ?auto_479022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_479020 ?auto_479021 ?auto_479022 )
      ( MAKE-10PILE ?auto_479020 ?auto_479021 ?auto_479022 ?auto_479023 ?auto_479024 ?auto_479025 ?auto_479026 ?auto_479027 ?auto_479028 ?auto_479029 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_479062 - BLOCK
      ?auto_479063 - BLOCK
      ?auto_479064 - BLOCK
      ?auto_479065 - BLOCK
      ?auto_479066 - BLOCK
      ?auto_479067 - BLOCK
      ?auto_479068 - BLOCK
      ?auto_479069 - BLOCK
      ?auto_479070 - BLOCK
      ?auto_479071 - BLOCK
    )
    :vars
    (
      ?auto_479072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479071 ?auto_479072 ) ( ON-TABLE ?auto_479062 ) ( not ( = ?auto_479062 ?auto_479063 ) ) ( not ( = ?auto_479062 ?auto_479064 ) ) ( not ( = ?auto_479062 ?auto_479065 ) ) ( not ( = ?auto_479062 ?auto_479066 ) ) ( not ( = ?auto_479062 ?auto_479067 ) ) ( not ( = ?auto_479062 ?auto_479068 ) ) ( not ( = ?auto_479062 ?auto_479069 ) ) ( not ( = ?auto_479062 ?auto_479070 ) ) ( not ( = ?auto_479062 ?auto_479071 ) ) ( not ( = ?auto_479062 ?auto_479072 ) ) ( not ( = ?auto_479063 ?auto_479064 ) ) ( not ( = ?auto_479063 ?auto_479065 ) ) ( not ( = ?auto_479063 ?auto_479066 ) ) ( not ( = ?auto_479063 ?auto_479067 ) ) ( not ( = ?auto_479063 ?auto_479068 ) ) ( not ( = ?auto_479063 ?auto_479069 ) ) ( not ( = ?auto_479063 ?auto_479070 ) ) ( not ( = ?auto_479063 ?auto_479071 ) ) ( not ( = ?auto_479063 ?auto_479072 ) ) ( not ( = ?auto_479064 ?auto_479065 ) ) ( not ( = ?auto_479064 ?auto_479066 ) ) ( not ( = ?auto_479064 ?auto_479067 ) ) ( not ( = ?auto_479064 ?auto_479068 ) ) ( not ( = ?auto_479064 ?auto_479069 ) ) ( not ( = ?auto_479064 ?auto_479070 ) ) ( not ( = ?auto_479064 ?auto_479071 ) ) ( not ( = ?auto_479064 ?auto_479072 ) ) ( not ( = ?auto_479065 ?auto_479066 ) ) ( not ( = ?auto_479065 ?auto_479067 ) ) ( not ( = ?auto_479065 ?auto_479068 ) ) ( not ( = ?auto_479065 ?auto_479069 ) ) ( not ( = ?auto_479065 ?auto_479070 ) ) ( not ( = ?auto_479065 ?auto_479071 ) ) ( not ( = ?auto_479065 ?auto_479072 ) ) ( not ( = ?auto_479066 ?auto_479067 ) ) ( not ( = ?auto_479066 ?auto_479068 ) ) ( not ( = ?auto_479066 ?auto_479069 ) ) ( not ( = ?auto_479066 ?auto_479070 ) ) ( not ( = ?auto_479066 ?auto_479071 ) ) ( not ( = ?auto_479066 ?auto_479072 ) ) ( not ( = ?auto_479067 ?auto_479068 ) ) ( not ( = ?auto_479067 ?auto_479069 ) ) ( not ( = ?auto_479067 ?auto_479070 ) ) ( not ( = ?auto_479067 ?auto_479071 ) ) ( not ( = ?auto_479067 ?auto_479072 ) ) ( not ( = ?auto_479068 ?auto_479069 ) ) ( not ( = ?auto_479068 ?auto_479070 ) ) ( not ( = ?auto_479068 ?auto_479071 ) ) ( not ( = ?auto_479068 ?auto_479072 ) ) ( not ( = ?auto_479069 ?auto_479070 ) ) ( not ( = ?auto_479069 ?auto_479071 ) ) ( not ( = ?auto_479069 ?auto_479072 ) ) ( not ( = ?auto_479070 ?auto_479071 ) ) ( not ( = ?auto_479070 ?auto_479072 ) ) ( not ( = ?auto_479071 ?auto_479072 ) ) ( ON ?auto_479070 ?auto_479071 ) ( ON ?auto_479069 ?auto_479070 ) ( ON ?auto_479068 ?auto_479069 ) ( ON ?auto_479067 ?auto_479068 ) ( ON ?auto_479066 ?auto_479067 ) ( ON ?auto_479065 ?auto_479066 ) ( ON ?auto_479064 ?auto_479065 ) ( CLEAR ?auto_479062 ) ( ON ?auto_479063 ?auto_479064 ) ( CLEAR ?auto_479063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_479062 ?auto_479063 )
      ( MAKE-10PILE ?auto_479062 ?auto_479063 ?auto_479064 ?auto_479065 ?auto_479066 ?auto_479067 ?auto_479068 ?auto_479069 ?auto_479070 ?auto_479071 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_479104 - BLOCK
      ?auto_479105 - BLOCK
      ?auto_479106 - BLOCK
      ?auto_479107 - BLOCK
      ?auto_479108 - BLOCK
      ?auto_479109 - BLOCK
      ?auto_479110 - BLOCK
      ?auto_479111 - BLOCK
      ?auto_479112 - BLOCK
      ?auto_479113 - BLOCK
    )
    :vars
    (
      ?auto_479114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479113 ?auto_479114 ) ( not ( = ?auto_479104 ?auto_479105 ) ) ( not ( = ?auto_479104 ?auto_479106 ) ) ( not ( = ?auto_479104 ?auto_479107 ) ) ( not ( = ?auto_479104 ?auto_479108 ) ) ( not ( = ?auto_479104 ?auto_479109 ) ) ( not ( = ?auto_479104 ?auto_479110 ) ) ( not ( = ?auto_479104 ?auto_479111 ) ) ( not ( = ?auto_479104 ?auto_479112 ) ) ( not ( = ?auto_479104 ?auto_479113 ) ) ( not ( = ?auto_479104 ?auto_479114 ) ) ( not ( = ?auto_479105 ?auto_479106 ) ) ( not ( = ?auto_479105 ?auto_479107 ) ) ( not ( = ?auto_479105 ?auto_479108 ) ) ( not ( = ?auto_479105 ?auto_479109 ) ) ( not ( = ?auto_479105 ?auto_479110 ) ) ( not ( = ?auto_479105 ?auto_479111 ) ) ( not ( = ?auto_479105 ?auto_479112 ) ) ( not ( = ?auto_479105 ?auto_479113 ) ) ( not ( = ?auto_479105 ?auto_479114 ) ) ( not ( = ?auto_479106 ?auto_479107 ) ) ( not ( = ?auto_479106 ?auto_479108 ) ) ( not ( = ?auto_479106 ?auto_479109 ) ) ( not ( = ?auto_479106 ?auto_479110 ) ) ( not ( = ?auto_479106 ?auto_479111 ) ) ( not ( = ?auto_479106 ?auto_479112 ) ) ( not ( = ?auto_479106 ?auto_479113 ) ) ( not ( = ?auto_479106 ?auto_479114 ) ) ( not ( = ?auto_479107 ?auto_479108 ) ) ( not ( = ?auto_479107 ?auto_479109 ) ) ( not ( = ?auto_479107 ?auto_479110 ) ) ( not ( = ?auto_479107 ?auto_479111 ) ) ( not ( = ?auto_479107 ?auto_479112 ) ) ( not ( = ?auto_479107 ?auto_479113 ) ) ( not ( = ?auto_479107 ?auto_479114 ) ) ( not ( = ?auto_479108 ?auto_479109 ) ) ( not ( = ?auto_479108 ?auto_479110 ) ) ( not ( = ?auto_479108 ?auto_479111 ) ) ( not ( = ?auto_479108 ?auto_479112 ) ) ( not ( = ?auto_479108 ?auto_479113 ) ) ( not ( = ?auto_479108 ?auto_479114 ) ) ( not ( = ?auto_479109 ?auto_479110 ) ) ( not ( = ?auto_479109 ?auto_479111 ) ) ( not ( = ?auto_479109 ?auto_479112 ) ) ( not ( = ?auto_479109 ?auto_479113 ) ) ( not ( = ?auto_479109 ?auto_479114 ) ) ( not ( = ?auto_479110 ?auto_479111 ) ) ( not ( = ?auto_479110 ?auto_479112 ) ) ( not ( = ?auto_479110 ?auto_479113 ) ) ( not ( = ?auto_479110 ?auto_479114 ) ) ( not ( = ?auto_479111 ?auto_479112 ) ) ( not ( = ?auto_479111 ?auto_479113 ) ) ( not ( = ?auto_479111 ?auto_479114 ) ) ( not ( = ?auto_479112 ?auto_479113 ) ) ( not ( = ?auto_479112 ?auto_479114 ) ) ( not ( = ?auto_479113 ?auto_479114 ) ) ( ON ?auto_479112 ?auto_479113 ) ( ON ?auto_479111 ?auto_479112 ) ( ON ?auto_479110 ?auto_479111 ) ( ON ?auto_479109 ?auto_479110 ) ( ON ?auto_479108 ?auto_479109 ) ( ON ?auto_479107 ?auto_479108 ) ( ON ?auto_479106 ?auto_479107 ) ( ON ?auto_479105 ?auto_479106 ) ( ON ?auto_479104 ?auto_479105 ) ( CLEAR ?auto_479104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_479104 )
      ( MAKE-10PILE ?auto_479104 ?auto_479105 ?auto_479106 ?auto_479107 ?auto_479108 ?auto_479109 ?auto_479110 ?auto_479111 ?auto_479112 ?auto_479113 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_479147 - BLOCK
      ?auto_479148 - BLOCK
      ?auto_479149 - BLOCK
      ?auto_479150 - BLOCK
      ?auto_479151 - BLOCK
      ?auto_479152 - BLOCK
      ?auto_479153 - BLOCK
      ?auto_479154 - BLOCK
      ?auto_479155 - BLOCK
      ?auto_479156 - BLOCK
      ?auto_479157 - BLOCK
    )
    :vars
    (
      ?auto_479158 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_479156 ) ( ON ?auto_479157 ?auto_479158 ) ( CLEAR ?auto_479157 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_479147 ) ( ON ?auto_479148 ?auto_479147 ) ( ON ?auto_479149 ?auto_479148 ) ( ON ?auto_479150 ?auto_479149 ) ( ON ?auto_479151 ?auto_479150 ) ( ON ?auto_479152 ?auto_479151 ) ( ON ?auto_479153 ?auto_479152 ) ( ON ?auto_479154 ?auto_479153 ) ( ON ?auto_479155 ?auto_479154 ) ( ON ?auto_479156 ?auto_479155 ) ( not ( = ?auto_479147 ?auto_479148 ) ) ( not ( = ?auto_479147 ?auto_479149 ) ) ( not ( = ?auto_479147 ?auto_479150 ) ) ( not ( = ?auto_479147 ?auto_479151 ) ) ( not ( = ?auto_479147 ?auto_479152 ) ) ( not ( = ?auto_479147 ?auto_479153 ) ) ( not ( = ?auto_479147 ?auto_479154 ) ) ( not ( = ?auto_479147 ?auto_479155 ) ) ( not ( = ?auto_479147 ?auto_479156 ) ) ( not ( = ?auto_479147 ?auto_479157 ) ) ( not ( = ?auto_479147 ?auto_479158 ) ) ( not ( = ?auto_479148 ?auto_479149 ) ) ( not ( = ?auto_479148 ?auto_479150 ) ) ( not ( = ?auto_479148 ?auto_479151 ) ) ( not ( = ?auto_479148 ?auto_479152 ) ) ( not ( = ?auto_479148 ?auto_479153 ) ) ( not ( = ?auto_479148 ?auto_479154 ) ) ( not ( = ?auto_479148 ?auto_479155 ) ) ( not ( = ?auto_479148 ?auto_479156 ) ) ( not ( = ?auto_479148 ?auto_479157 ) ) ( not ( = ?auto_479148 ?auto_479158 ) ) ( not ( = ?auto_479149 ?auto_479150 ) ) ( not ( = ?auto_479149 ?auto_479151 ) ) ( not ( = ?auto_479149 ?auto_479152 ) ) ( not ( = ?auto_479149 ?auto_479153 ) ) ( not ( = ?auto_479149 ?auto_479154 ) ) ( not ( = ?auto_479149 ?auto_479155 ) ) ( not ( = ?auto_479149 ?auto_479156 ) ) ( not ( = ?auto_479149 ?auto_479157 ) ) ( not ( = ?auto_479149 ?auto_479158 ) ) ( not ( = ?auto_479150 ?auto_479151 ) ) ( not ( = ?auto_479150 ?auto_479152 ) ) ( not ( = ?auto_479150 ?auto_479153 ) ) ( not ( = ?auto_479150 ?auto_479154 ) ) ( not ( = ?auto_479150 ?auto_479155 ) ) ( not ( = ?auto_479150 ?auto_479156 ) ) ( not ( = ?auto_479150 ?auto_479157 ) ) ( not ( = ?auto_479150 ?auto_479158 ) ) ( not ( = ?auto_479151 ?auto_479152 ) ) ( not ( = ?auto_479151 ?auto_479153 ) ) ( not ( = ?auto_479151 ?auto_479154 ) ) ( not ( = ?auto_479151 ?auto_479155 ) ) ( not ( = ?auto_479151 ?auto_479156 ) ) ( not ( = ?auto_479151 ?auto_479157 ) ) ( not ( = ?auto_479151 ?auto_479158 ) ) ( not ( = ?auto_479152 ?auto_479153 ) ) ( not ( = ?auto_479152 ?auto_479154 ) ) ( not ( = ?auto_479152 ?auto_479155 ) ) ( not ( = ?auto_479152 ?auto_479156 ) ) ( not ( = ?auto_479152 ?auto_479157 ) ) ( not ( = ?auto_479152 ?auto_479158 ) ) ( not ( = ?auto_479153 ?auto_479154 ) ) ( not ( = ?auto_479153 ?auto_479155 ) ) ( not ( = ?auto_479153 ?auto_479156 ) ) ( not ( = ?auto_479153 ?auto_479157 ) ) ( not ( = ?auto_479153 ?auto_479158 ) ) ( not ( = ?auto_479154 ?auto_479155 ) ) ( not ( = ?auto_479154 ?auto_479156 ) ) ( not ( = ?auto_479154 ?auto_479157 ) ) ( not ( = ?auto_479154 ?auto_479158 ) ) ( not ( = ?auto_479155 ?auto_479156 ) ) ( not ( = ?auto_479155 ?auto_479157 ) ) ( not ( = ?auto_479155 ?auto_479158 ) ) ( not ( = ?auto_479156 ?auto_479157 ) ) ( not ( = ?auto_479156 ?auto_479158 ) ) ( not ( = ?auto_479157 ?auto_479158 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_479157 ?auto_479158 )
      ( !STACK ?auto_479157 ?auto_479156 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_479193 - BLOCK
      ?auto_479194 - BLOCK
      ?auto_479195 - BLOCK
      ?auto_479196 - BLOCK
      ?auto_479197 - BLOCK
      ?auto_479198 - BLOCK
      ?auto_479199 - BLOCK
      ?auto_479200 - BLOCK
      ?auto_479201 - BLOCK
      ?auto_479202 - BLOCK
      ?auto_479203 - BLOCK
    )
    :vars
    (
      ?auto_479204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479203 ?auto_479204 ) ( ON-TABLE ?auto_479193 ) ( ON ?auto_479194 ?auto_479193 ) ( ON ?auto_479195 ?auto_479194 ) ( ON ?auto_479196 ?auto_479195 ) ( ON ?auto_479197 ?auto_479196 ) ( ON ?auto_479198 ?auto_479197 ) ( ON ?auto_479199 ?auto_479198 ) ( ON ?auto_479200 ?auto_479199 ) ( ON ?auto_479201 ?auto_479200 ) ( not ( = ?auto_479193 ?auto_479194 ) ) ( not ( = ?auto_479193 ?auto_479195 ) ) ( not ( = ?auto_479193 ?auto_479196 ) ) ( not ( = ?auto_479193 ?auto_479197 ) ) ( not ( = ?auto_479193 ?auto_479198 ) ) ( not ( = ?auto_479193 ?auto_479199 ) ) ( not ( = ?auto_479193 ?auto_479200 ) ) ( not ( = ?auto_479193 ?auto_479201 ) ) ( not ( = ?auto_479193 ?auto_479202 ) ) ( not ( = ?auto_479193 ?auto_479203 ) ) ( not ( = ?auto_479193 ?auto_479204 ) ) ( not ( = ?auto_479194 ?auto_479195 ) ) ( not ( = ?auto_479194 ?auto_479196 ) ) ( not ( = ?auto_479194 ?auto_479197 ) ) ( not ( = ?auto_479194 ?auto_479198 ) ) ( not ( = ?auto_479194 ?auto_479199 ) ) ( not ( = ?auto_479194 ?auto_479200 ) ) ( not ( = ?auto_479194 ?auto_479201 ) ) ( not ( = ?auto_479194 ?auto_479202 ) ) ( not ( = ?auto_479194 ?auto_479203 ) ) ( not ( = ?auto_479194 ?auto_479204 ) ) ( not ( = ?auto_479195 ?auto_479196 ) ) ( not ( = ?auto_479195 ?auto_479197 ) ) ( not ( = ?auto_479195 ?auto_479198 ) ) ( not ( = ?auto_479195 ?auto_479199 ) ) ( not ( = ?auto_479195 ?auto_479200 ) ) ( not ( = ?auto_479195 ?auto_479201 ) ) ( not ( = ?auto_479195 ?auto_479202 ) ) ( not ( = ?auto_479195 ?auto_479203 ) ) ( not ( = ?auto_479195 ?auto_479204 ) ) ( not ( = ?auto_479196 ?auto_479197 ) ) ( not ( = ?auto_479196 ?auto_479198 ) ) ( not ( = ?auto_479196 ?auto_479199 ) ) ( not ( = ?auto_479196 ?auto_479200 ) ) ( not ( = ?auto_479196 ?auto_479201 ) ) ( not ( = ?auto_479196 ?auto_479202 ) ) ( not ( = ?auto_479196 ?auto_479203 ) ) ( not ( = ?auto_479196 ?auto_479204 ) ) ( not ( = ?auto_479197 ?auto_479198 ) ) ( not ( = ?auto_479197 ?auto_479199 ) ) ( not ( = ?auto_479197 ?auto_479200 ) ) ( not ( = ?auto_479197 ?auto_479201 ) ) ( not ( = ?auto_479197 ?auto_479202 ) ) ( not ( = ?auto_479197 ?auto_479203 ) ) ( not ( = ?auto_479197 ?auto_479204 ) ) ( not ( = ?auto_479198 ?auto_479199 ) ) ( not ( = ?auto_479198 ?auto_479200 ) ) ( not ( = ?auto_479198 ?auto_479201 ) ) ( not ( = ?auto_479198 ?auto_479202 ) ) ( not ( = ?auto_479198 ?auto_479203 ) ) ( not ( = ?auto_479198 ?auto_479204 ) ) ( not ( = ?auto_479199 ?auto_479200 ) ) ( not ( = ?auto_479199 ?auto_479201 ) ) ( not ( = ?auto_479199 ?auto_479202 ) ) ( not ( = ?auto_479199 ?auto_479203 ) ) ( not ( = ?auto_479199 ?auto_479204 ) ) ( not ( = ?auto_479200 ?auto_479201 ) ) ( not ( = ?auto_479200 ?auto_479202 ) ) ( not ( = ?auto_479200 ?auto_479203 ) ) ( not ( = ?auto_479200 ?auto_479204 ) ) ( not ( = ?auto_479201 ?auto_479202 ) ) ( not ( = ?auto_479201 ?auto_479203 ) ) ( not ( = ?auto_479201 ?auto_479204 ) ) ( not ( = ?auto_479202 ?auto_479203 ) ) ( not ( = ?auto_479202 ?auto_479204 ) ) ( not ( = ?auto_479203 ?auto_479204 ) ) ( CLEAR ?auto_479201 ) ( ON ?auto_479202 ?auto_479203 ) ( CLEAR ?auto_479202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_479193 ?auto_479194 ?auto_479195 ?auto_479196 ?auto_479197 ?auto_479198 ?auto_479199 ?auto_479200 ?auto_479201 ?auto_479202 )
      ( MAKE-11PILE ?auto_479193 ?auto_479194 ?auto_479195 ?auto_479196 ?auto_479197 ?auto_479198 ?auto_479199 ?auto_479200 ?auto_479201 ?auto_479202 ?auto_479203 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_479239 - BLOCK
      ?auto_479240 - BLOCK
      ?auto_479241 - BLOCK
      ?auto_479242 - BLOCK
      ?auto_479243 - BLOCK
      ?auto_479244 - BLOCK
      ?auto_479245 - BLOCK
      ?auto_479246 - BLOCK
      ?auto_479247 - BLOCK
      ?auto_479248 - BLOCK
      ?auto_479249 - BLOCK
    )
    :vars
    (
      ?auto_479250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479249 ?auto_479250 ) ( ON-TABLE ?auto_479239 ) ( ON ?auto_479240 ?auto_479239 ) ( ON ?auto_479241 ?auto_479240 ) ( ON ?auto_479242 ?auto_479241 ) ( ON ?auto_479243 ?auto_479242 ) ( ON ?auto_479244 ?auto_479243 ) ( ON ?auto_479245 ?auto_479244 ) ( ON ?auto_479246 ?auto_479245 ) ( not ( = ?auto_479239 ?auto_479240 ) ) ( not ( = ?auto_479239 ?auto_479241 ) ) ( not ( = ?auto_479239 ?auto_479242 ) ) ( not ( = ?auto_479239 ?auto_479243 ) ) ( not ( = ?auto_479239 ?auto_479244 ) ) ( not ( = ?auto_479239 ?auto_479245 ) ) ( not ( = ?auto_479239 ?auto_479246 ) ) ( not ( = ?auto_479239 ?auto_479247 ) ) ( not ( = ?auto_479239 ?auto_479248 ) ) ( not ( = ?auto_479239 ?auto_479249 ) ) ( not ( = ?auto_479239 ?auto_479250 ) ) ( not ( = ?auto_479240 ?auto_479241 ) ) ( not ( = ?auto_479240 ?auto_479242 ) ) ( not ( = ?auto_479240 ?auto_479243 ) ) ( not ( = ?auto_479240 ?auto_479244 ) ) ( not ( = ?auto_479240 ?auto_479245 ) ) ( not ( = ?auto_479240 ?auto_479246 ) ) ( not ( = ?auto_479240 ?auto_479247 ) ) ( not ( = ?auto_479240 ?auto_479248 ) ) ( not ( = ?auto_479240 ?auto_479249 ) ) ( not ( = ?auto_479240 ?auto_479250 ) ) ( not ( = ?auto_479241 ?auto_479242 ) ) ( not ( = ?auto_479241 ?auto_479243 ) ) ( not ( = ?auto_479241 ?auto_479244 ) ) ( not ( = ?auto_479241 ?auto_479245 ) ) ( not ( = ?auto_479241 ?auto_479246 ) ) ( not ( = ?auto_479241 ?auto_479247 ) ) ( not ( = ?auto_479241 ?auto_479248 ) ) ( not ( = ?auto_479241 ?auto_479249 ) ) ( not ( = ?auto_479241 ?auto_479250 ) ) ( not ( = ?auto_479242 ?auto_479243 ) ) ( not ( = ?auto_479242 ?auto_479244 ) ) ( not ( = ?auto_479242 ?auto_479245 ) ) ( not ( = ?auto_479242 ?auto_479246 ) ) ( not ( = ?auto_479242 ?auto_479247 ) ) ( not ( = ?auto_479242 ?auto_479248 ) ) ( not ( = ?auto_479242 ?auto_479249 ) ) ( not ( = ?auto_479242 ?auto_479250 ) ) ( not ( = ?auto_479243 ?auto_479244 ) ) ( not ( = ?auto_479243 ?auto_479245 ) ) ( not ( = ?auto_479243 ?auto_479246 ) ) ( not ( = ?auto_479243 ?auto_479247 ) ) ( not ( = ?auto_479243 ?auto_479248 ) ) ( not ( = ?auto_479243 ?auto_479249 ) ) ( not ( = ?auto_479243 ?auto_479250 ) ) ( not ( = ?auto_479244 ?auto_479245 ) ) ( not ( = ?auto_479244 ?auto_479246 ) ) ( not ( = ?auto_479244 ?auto_479247 ) ) ( not ( = ?auto_479244 ?auto_479248 ) ) ( not ( = ?auto_479244 ?auto_479249 ) ) ( not ( = ?auto_479244 ?auto_479250 ) ) ( not ( = ?auto_479245 ?auto_479246 ) ) ( not ( = ?auto_479245 ?auto_479247 ) ) ( not ( = ?auto_479245 ?auto_479248 ) ) ( not ( = ?auto_479245 ?auto_479249 ) ) ( not ( = ?auto_479245 ?auto_479250 ) ) ( not ( = ?auto_479246 ?auto_479247 ) ) ( not ( = ?auto_479246 ?auto_479248 ) ) ( not ( = ?auto_479246 ?auto_479249 ) ) ( not ( = ?auto_479246 ?auto_479250 ) ) ( not ( = ?auto_479247 ?auto_479248 ) ) ( not ( = ?auto_479247 ?auto_479249 ) ) ( not ( = ?auto_479247 ?auto_479250 ) ) ( not ( = ?auto_479248 ?auto_479249 ) ) ( not ( = ?auto_479248 ?auto_479250 ) ) ( not ( = ?auto_479249 ?auto_479250 ) ) ( ON ?auto_479248 ?auto_479249 ) ( CLEAR ?auto_479246 ) ( ON ?auto_479247 ?auto_479248 ) ( CLEAR ?auto_479247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_479239 ?auto_479240 ?auto_479241 ?auto_479242 ?auto_479243 ?auto_479244 ?auto_479245 ?auto_479246 ?auto_479247 )
      ( MAKE-11PILE ?auto_479239 ?auto_479240 ?auto_479241 ?auto_479242 ?auto_479243 ?auto_479244 ?auto_479245 ?auto_479246 ?auto_479247 ?auto_479248 ?auto_479249 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_479285 - BLOCK
      ?auto_479286 - BLOCK
      ?auto_479287 - BLOCK
      ?auto_479288 - BLOCK
      ?auto_479289 - BLOCK
      ?auto_479290 - BLOCK
      ?auto_479291 - BLOCK
      ?auto_479292 - BLOCK
      ?auto_479293 - BLOCK
      ?auto_479294 - BLOCK
      ?auto_479295 - BLOCK
    )
    :vars
    (
      ?auto_479296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479295 ?auto_479296 ) ( ON-TABLE ?auto_479285 ) ( ON ?auto_479286 ?auto_479285 ) ( ON ?auto_479287 ?auto_479286 ) ( ON ?auto_479288 ?auto_479287 ) ( ON ?auto_479289 ?auto_479288 ) ( ON ?auto_479290 ?auto_479289 ) ( ON ?auto_479291 ?auto_479290 ) ( not ( = ?auto_479285 ?auto_479286 ) ) ( not ( = ?auto_479285 ?auto_479287 ) ) ( not ( = ?auto_479285 ?auto_479288 ) ) ( not ( = ?auto_479285 ?auto_479289 ) ) ( not ( = ?auto_479285 ?auto_479290 ) ) ( not ( = ?auto_479285 ?auto_479291 ) ) ( not ( = ?auto_479285 ?auto_479292 ) ) ( not ( = ?auto_479285 ?auto_479293 ) ) ( not ( = ?auto_479285 ?auto_479294 ) ) ( not ( = ?auto_479285 ?auto_479295 ) ) ( not ( = ?auto_479285 ?auto_479296 ) ) ( not ( = ?auto_479286 ?auto_479287 ) ) ( not ( = ?auto_479286 ?auto_479288 ) ) ( not ( = ?auto_479286 ?auto_479289 ) ) ( not ( = ?auto_479286 ?auto_479290 ) ) ( not ( = ?auto_479286 ?auto_479291 ) ) ( not ( = ?auto_479286 ?auto_479292 ) ) ( not ( = ?auto_479286 ?auto_479293 ) ) ( not ( = ?auto_479286 ?auto_479294 ) ) ( not ( = ?auto_479286 ?auto_479295 ) ) ( not ( = ?auto_479286 ?auto_479296 ) ) ( not ( = ?auto_479287 ?auto_479288 ) ) ( not ( = ?auto_479287 ?auto_479289 ) ) ( not ( = ?auto_479287 ?auto_479290 ) ) ( not ( = ?auto_479287 ?auto_479291 ) ) ( not ( = ?auto_479287 ?auto_479292 ) ) ( not ( = ?auto_479287 ?auto_479293 ) ) ( not ( = ?auto_479287 ?auto_479294 ) ) ( not ( = ?auto_479287 ?auto_479295 ) ) ( not ( = ?auto_479287 ?auto_479296 ) ) ( not ( = ?auto_479288 ?auto_479289 ) ) ( not ( = ?auto_479288 ?auto_479290 ) ) ( not ( = ?auto_479288 ?auto_479291 ) ) ( not ( = ?auto_479288 ?auto_479292 ) ) ( not ( = ?auto_479288 ?auto_479293 ) ) ( not ( = ?auto_479288 ?auto_479294 ) ) ( not ( = ?auto_479288 ?auto_479295 ) ) ( not ( = ?auto_479288 ?auto_479296 ) ) ( not ( = ?auto_479289 ?auto_479290 ) ) ( not ( = ?auto_479289 ?auto_479291 ) ) ( not ( = ?auto_479289 ?auto_479292 ) ) ( not ( = ?auto_479289 ?auto_479293 ) ) ( not ( = ?auto_479289 ?auto_479294 ) ) ( not ( = ?auto_479289 ?auto_479295 ) ) ( not ( = ?auto_479289 ?auto_479296 ) ) ( not ( = ?auto_479290 ?auto_479291 ) ) ( not ( = ?auto_479290 ?auto_479292 ) ) ( not ( = ?auto_479290 ?auto_479293 ) ) ( not ( = ?auto_479290 ?auto_479294 ) ) ( not ( = ?auto_479290 ?auto_479295 ) ) ( not ( = ?auto_479290 ?auto_479296 ) ) ( not ( = ?auto_479291 ?auto_479292 ) ) ( not ( = ?auto_479291 ?auto_479293 ) ) ( not ( = ?auto_479291 ?auto_479294 ) ) ( not ( = ?auto_479291 ?auto_479295 ) ) ( not ( = ?auto_479291 ?auto_479296 ) ) ( not ( = ?auto_479292 ?auto_479293 ) ) ( not ( = ?auto_479292 ?auto_479294 ) ) ( not ( = ?auto_479292 ?auto_479295 ) ) ( not ( = ?auto_479292 ?auto_479296 ) ) ( not ( = ?auto_479293 ?auto_479294 ) ) ( not ( = ?auto_479293 ?auto_479295 ) ) ( not ( = ?auto_479293 ?auto_479296 ) ) ( not ( = ?auto_479294 ?auto_479295 ) ) ( not ( = ?auto_479294 ?auto_479296 ) ) ( not ( = ?auto_479295 ?auto_479296 ) ) ( ON ?auto_479294 ?auto_479295 ) ( ON ?auto_479293 ?auto_479294 ) ( CLEAR ?auto_479291 ) ( ON ?auto_479292 ?auto_479293 ) ( CLEAR ?auto_479292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_479285 ?auto_479286 ?auto_479287 ?auto_479288 ?auto_479289 ?auto_479290 ?auto_479291 ?auto_479292 )
      ( MAKE-11PILE ?auto_479285 ?auto_479286 ?auto_479287 ?auto_479288 ?auto_479289 ?auto_479290 ?auto_479291 ?auto_479292 ?auto_479293 ?auto_479294 ?auto_479295 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_479331 - BLOCK
      ?auto_479332 - BLOCK
      ?auto_479333 - BLOCK
      ?auto_479334 - BLOCK
      ?auto_479335 - BLOCK
      ?auto_479336 - BLOCK
      ?auto_479337 - BLOCK
      ?auto_479338 - BLOCK
      ?auto_479339 - BLOCK
      ?auto_479340 - BLOCK
      ?auto_479341 - BLOCK
    )
    :vars
    (
      ?auto_479342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479341 ?auto_479342 ) ( ON-TABLE ?auto_479331 ) ( ON ?auto_479332 ?auto_479331 ) ( ON ?auto_479333 ?auto_479332 ) ( ON ?auto_479334 ?auto_479333 ) ( ON ?auto_479335 ?auto_479334 ) ( ON ?auto_479336 ?auto_479335 ) ( not ( = ?auto_479331 ?auto_479332 ) ) ( not ( = ?auto_479331 ?auto_479333 ) ) ( not ( = ?auto_479331 ?auto_479334 ) ) ( not ( = ?auto_479331 ?auto_479335 ) ) ( not ( = ?auto_479331 ?auto_479336 ) ) ( not ( = ?auto_479331 ?auto_479337 ) ) ( not ( = ?auto_479331 ?auto_479338 ) ) ( not ( = ?auto_479331 ?auto_479339 ) ) ( not ( = ?auto_479331 ?auto_479340 ) ) ( not ( = ?auto_479331 ?auto_479341 ) ) ( not ( = ?auto_479331 ?auto_479342 ) ) ( not ( = ?auto_479332 ?auto_479333 ) ) ( not ( = ?auto_479332 ?auto_479334 ) ) ( not ( = ?auto_479332 ?auto_479335 ) ) ( not ( = ?auto_479332 ?auto_479336 ) ) ( not ( = ?auto_479332 ?auto_479337 ) ) ( not ( = ?auto_479332 ?auto_479338 ) ) ( not ( = ?auto_479332 ?auto_479339 ) ) ( not ( = ?auto_479332 ?auto_479340 ) ) ( not ( = ?auto_479332 ?auto_479341 ) ) ( not ( = ?auto_479332 ?auto_479342 ) ) ( not ( = ?auto_479333 ?auto_479334 ) ) ( not ( = ?auto_479333 ?auto_479335 ) ) ( not ( = ?auto_479333 ?auto_479336 ) ) ( not ( = ?auto_479333 ?auto_479337 ) ) ( not ( = ?auto_479333 ?auto_479338 ) ) ( not ( = ?auto_479333 ?auto_479339 ) ) ( not ( = ?auto_479333 ?auto_479340 ) ) ( not ( = ?auto_479333 ?auto_479341 ) ) ( not ( = ?auto_479333 ?auto_479342 ) ) ( not ( = ?auto_479334 ?auto_479335 ) ) ( not ( = ?auto_479334 ?auto_479336 ) ) ( not ( = ?auto_479334 ?auto_479337 ) ) ( not ( = ?auto_479334 ?auto_479338 ) ) ( not ( = ?auto_479334 ?auto_479339 ) ) ( not ( = ?auto_479334 ?auto_479340 ) ) ( not ( = ?auto_479334 ?auto_479341 ) ) ( not ( = ?auto_479334 ?auto_479342 ) ) ( not ( = ?auto_479335 ?auto_479336 ) ) ( not ( = ?auto_479335 ?auto_479337 ) ) ( not ( = ?auto_479335 ?auto_479338 ) ) ( not ( = ?auto_479335 ?auto_479339 ) ) ( not ( = ?auto_479335 ?auto_479340 ) ) ( not ( = ?auto_479335 ?auto_479341 ) ) ( not ( = ?auto_479335 ?auto_479342 ) ) ( not ( = ?auto_479336 ?auto_479337 ) ) ( not ( = ?auto_479336 ?auto_479338 ) ) ( not ( = ?auto_479336 ?auto_479339 ) ) ( not ( = ?auto_479336 ?auto_479340 ) ) ( not ( = ?auto_479336 ?auto_479341 ) ) ( not ( = ?auto_479336 ?auto_479342 ) ) ( not ( = ?auto_479337 ?auto_479338 ) ) ( not ( = ?auto_479337 ?auto_479339 ) ) ( not ( = ?auto_479337 ?auto_479340 ) ) ( not ( = ?auto_479337 ?auto_479341 ) ) ( not ( = ?auto_479337 ?auto_479342 ) ) ( not ( = ?auto_479338 ?auto_479339 ) ) ( not ( = ?auto_479338 ?auto_479340 ) ) ( not ( = ?auto_479338 ?auto_479341 ) ) ( not ( = ?auto_479338 ?auto_479342 ) ) ( not ( = ?auto_479339 ?auto_479340 ) ) ( not ( = ?auto_479339 ?auto_479341 ) ) ( not ( = ?auto_479339 ?auto_479342 ) ) ( not ( = ?auto_479340 ?auto_479341 ) ) ( not ( = ?auto_479340 ?auto_479342 ) ) ( not ( = ?auto_479341 ?auto_479342 ) ) ( ON ?auto_479340 ?auto_479341 ) ( ON ?auto_479339 ?auto_479340 ) ( ON ?auto_479338 ?auto_479339 ) ( CLEAR ?auto_479336 ) ( ON ?auto_479337 ?auto_479338 ) ( CLEAR ?auto_479337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_479331 ?auto_479332 ?auto_479333 ?auto_479334 ?auto_479335 ?auto_479336 ?auto_479337 )
      ( MAKE-11PILE ?auto_479331 ?auto_479332 ?auto_479333 ?auto_479334 ?auto_479335 ?auto_479336 ?auto_479337 ?auto_479338 ?auto_479339 ?auto_479340 ?auto_479341 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_479377 - BLOCK
      ?auto_479378 - BLOCK
      ?auto_479379 - BLOCK
      ?auto_479380 - BLOCK
      ?auto_479381 - BLOCK
      ?auto_479382 - BLOCK
      ?auto_479383 - BLOCK
      ?auto_479384 - BLOCK
      ?auto_479385 - BLOCK
      ?auto_479386 - BLOCK
      ?auto_479387 - BLOCK
    )
    :vars
    (
      ?auto_479388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479387 ?auto_479388 ) ( ON-TABLE ?auto_479377 ) ( ON ?auto_479378 ?auto_479377 ) ( ON ?auto_479379 ?auto_479378 ) ( ON ?auto_479380 ?auto_479379 ) ( ON ?auto_479381 ?auto_479380 ) ( not ( = ?auto_479377 ?auto_479378 ) ) ( not ( = ?auto_479377 ?auto_479379 ) ) ( not ( = ?auto_479377 ?auto_479380 ) ) ( not ( = ?auto_479377 ?auto_479381 ) ) ( not ( = ?auto_479377 ?auto_479382 ) ) ( not ( = ?auto_479377 ?auto_479383 ) ) ( not ( = ?auto_479377 ?auto_479384 ) ) ( not ( = ?auto_479377 ?auto_479385 ) ) ( not ( = ?auto_479377 ?auto_479386 ) ) ( not ( = ?auto_479377 ?auto_479387 ) ) ( not ( = ?auto_479377 ?auto_479388 ) ) ( not ( = ?auto_479378 ?auto_479379 ) ) ( not ( = ?auto_479378 ?auto_479380 ) ) ( not ( = ?auto_479378 ?auto_479381 ) ) ( not ( = ?auto_479378 ?auto_479382 ) ) ( not ( = ?auto_479378 ?auto_479383 ) ) ( not ( = ?auto_479378 ?auto_479384 ) ) ( not ( = ?auto_479378 ?auto_479385 ) ) ( not ( = ?auto_479378 ?auto_479386 ) ) ( not ( = ?auto_479378 ?auto_479387 ) ) ( not ( = ?auto_479378 ?auto_479388 ) ) ( not ( = ?auto_479379 ?auto_479380 ) ) ( not ( = ?auto_479379 ?auto_479381 ) ) ( not ( = ?auto_479379 ?auto_479382 ) ) ( not ( = ?auto_479379 ?auto_479383 ) ) ( not ( = ?auto_479379 ?auto_479384 ) ) ( not ( = ?auto_479379 ?auto_479385 ) ) ( not ( = ?auto_479379 ?auto_479386 ) ) ( not ( = ?auto_479379 ?auto_479387 ) ) ( not ( = ?auto_479379 ?auto_479388 ) ) ( not ( = ?auto_479380 ?auto_479381 ) ) ( not ( = ?auto_479380 ?auto_479382 ) ) ( not ( = ?auto_479380 ?auto_479383 ) ) ( not ( = ?auto_479380 ?auto_479384 ) ) ( not ( = ?auto_479380 ?auto_479385 ) ) ( not ( = ?auto_479380 ?auto_479386 ) ) ( not ( = ?auto_479380 ?auto_479387 ) ) ( not ( = ?auto_479380 ?auto_479388 ) ) ( not ( = ?auto_479381 ?auto_479382 ) ) ( not ( = ?auto_479381 ?auto_479383 ) ) ( not ( = ?auto_479381 ?auto_479384 ) ) ( not ( = ?auto_479381 ?auto_479385 ) ) ( not ( = ?auto_479381 ?auto_479386 ) ) ( not ( = ?auto_479381 ?auto_479387 ) ) ( not ( = ?auto_479381 ?auto_479388 ) ) ( not ( = ?auto_479382 ?auto_479383 ) ) ( not ( = ?auto_479382 ?auto_479384 ) ) ( not ( = ?auto_479382 ?auto_479385 ) ) ( not ( = ?auto_479382 ?auto_479386 ) ) ( not ( = ?auto_479382 ?auto_479387 ) ) ( not ( = ?auto_479382 ?auto_479388 ) ) ( not ( = ?auto_479383 ?auto_479384 ) ) ( not ( = ?auto_479383 ?auto_479385 ) ) ( not ( = ?auto_479383 ?auto_479386 ) ) ( not ( = ?auto_479383 ?auto_479387 ) ) ( not ( = ?auto_479383 ?auto_479388 ) ) ( not ( = ?auto_479384 ?auto_479385 ) ) ( not ( = ?auto_479384 ?auto_479386 ) ) ( not ( = ?auto_479384 ?auto_479387 ) ) ( not ( = ?auto_479384 ?auto_479388 ) ) ( not ( = ?auto_479385 ?auto_479386 ) ) ( not ( = ?auto_479385 ?auto_479387 ) ) ( not ( = ?auto_479385 ?auto_479388 ) ) ( not ( = ?auto_479386 ?auto_479387 ) ) ( not ( = ?auto_479386 ?auto_479388 ) ) ( not ( = ?auto_479387 ?auto_479388 ) ) ( ON ?auto_479386 ?auto_479387 ) ( ON ?auto_479385 ?auto_479386 ) ( ON ?auto_479384 ?auto_479385 ) ( ON ?auto_479383 ?auto_479384 ) ( CLEAR ?auto_479381 ) ( ON ?auto_479382 ?auto_479383 ) ( CLEAR ?auto_479382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_479377 ?auto_479378 ?auto_479379 ?auto_479380 ?auto_479381 ?auto_479382 )
      ( MAKE-11PILE ?auto_479377 ?auto_479378 ?auto_479379 ?auto_479380 ?auto_479381 ?auto_479382 ?auto_479383 ?auto_479384 ?auto_479385 ?auto_479386 ?auto_479387 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_479423 - BLOCK
      ?auto_479424 - BLOCK
      ?auto_479425 - BLOCK
      ?auto_479426 - BLOCK
      ?auto_479427 - BLOCK
      ?auto_479428 - BLOCK
      ?auto_479429 - BLOCK
      ?auto_479430 - BLOCK
      ?auto_479431 - BLOCK
      ?auto_479432 - BLOCK
      ?auto_479433 - BLOCK
    )
    :vars
    (
      ?auto_479434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479433 ?auto_479434 ) ( ON-TABLE ?auto_479423 ) ( ON ?auto_479424 ?auto_479423 ) ( ON ?auto_479425 ?auto_479424 ) ( ON ?auto_479426 ?auto_479425 ) ( not ( = ?auto_479423 ?auto_479424 ) ) ( not ( = ?auto_479423 ?auto_479425 ) ) ( not ( = ?auto_479423 ?auto_479426 ) ) ( not ( = ?auto_479423 ?auto_479427 ) ) ( not ( = ?auto_479423 ?auto_479428 ) ) ( not ( = ?auto_479423 ?auto_479429 ) ) ( not ( = ?auto_479423 ?auto_479430 ) ) ( not ( = ?auto_479423 ?auto_479431 ) ) ( not ( = ?auto_479423 ?auto_479432 ) ) ( not ( = ?auto_479423 ?auto_479433 ) ) ( not ( = ?auto_479423 ?auto_479434 ) ) ( not ( = ?auto_479424 ?auto_479425 ) ) ( not ( = ?auto_479424 ?auto_479426 ) ) ( not ( = ?auto_479424 ?auto_479427 ) ) ( not ( = ?auto_479424 ?auto_479428 ) ) ( not ( = ?auto_479424 ?auto_479429 ) ) ( not ( = ?auto_479424 ?auto_479430 ) ) ( not ( = ?auto_479424 ?auto_479431 ) ) ( not ( = ?auto_479424 ?auto_479432 ) ) ( not ( = ?auto_479424 ?auto_479433 ) ) ( not ( = ?auto_479424 ?auto_479434 ) ) ( not ( = ?auto_479425 ?auto_479426 ) ) ( not ( = ?auto_479425 ?auto_479427 ) ) ( not ( = ?auto_479425 ?auto_479428 ) ) ( not ( = ?auto_479425 ?auto_479429 ) ) ( not ( = ?auto_479425 ?auto_479430 ) ) ( not ( = ?auto_479425 ?auto_479431 ) ) ( not ( = ?auto_479425 ?auto_479432 ) ) ( not ( = ?auto_479425 ?auto_479433 ) ) ( not ( = ?auto_479425 ?auto_479434 ) ) ( not ( = ?auto_479426 ?auto_479427 ) ) ( not ( = ?auto_479426 ?auto_479428 ) ) ( not ( = ?auto_479426 ?auto_479429 ) ) ( not ( = ?auto_479426 ?auto_479430 ) ) ( not ( = ?auto_479426 ?auto_479431 ) ) ( not ( = ?auto_479426 ?auto_479432 ) ) ( not ( = ?auto_479426 ?auto_479433 ) ) ( not ( = ?auto_479426 ?auto_479434 ) ) ( not ( = ?auto_479427 ?auto_479428 ) ) ( not ( = ?auto_479427 ?auto_479429 ) ) ( not ( = ?auto_479427 ?auto_479430 ) ) ( not ( = ?auto_479427 ?auto_479431 ) ) ( not ( = ?auto_479427 ?auto_479432 ) ) ( not ( = ?auto_479427 ?auto_479433 ) ) ( not ( = ?auto_479427 ?auto_479434 ) ) ( not ( = ?auto_479428 ?auto_479429 ) ) ( not ( = ?auto_479428 ?auto_479430 ) ) ( not ( = ?auto_479428 ?auto_479431 ) ) ( not ( = ?auto_479428 ?auto_479432 ) ) ( not ( = ?auto_479428 ?auto_479433 ) ) ( not ( = ?auto_479428 ?auto_479434 ) ) ( not ( = ?auto_479429 ?auto_479430 ) ) ( not ( = ?auto_479429 ?auto_479431 ) ) ( not ( = ?auto_479429 ?auto_479432 ) ) ( not ( = ?auto_479429 ?auto_479433 ) ) ( not ( = ?auto_479429 ?auto_479434 ) ) ( not ( = ?auto_479430 ?auto_479431 ) ) ( not ( = ?auto_479430 ?auto_479432 ) ) ( not ( = ?auto_479430 ?auto_479433 ) ) ( not ( = ?auto_479430 ?auto_479434 ) ) ( not ( = ?auto_479431 ?auto_479432 ) ) ( not ( = ?auto_479431 ?auto_479433 ) ) ( not ( = ?auto_479431 ?auto_479434 ) ) ( not ( = ?auto_479432 ?auto_479433 ) ) ( not ( = ?auto_479432 ?auto_479434 ) ) ( not ( = ?auto_479433 ?auto_479434 ) ) ( ON ?auto_479432 ?auto_479433 ) ( ON ?auto_479431 ?auto_479432 ) ( ON ?auto_479430 ?auto_479431 ) ( ON ?auto_479429 ?auto_479430 ) ( ON ?auto_479428 ?auto_479429 ) ( CLEAR ?auto_479426 ) ( ON ?auto_479427 ?auto_479428 ) ( CLEAR ?auto_479427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_479423 ?auto_479424 ?auto_479425 ?auto_479426 ?auto_479427 )
      ( MAKE-11PILE ?auto_479423 ?auto_479424 ?auto_479425 ?auto_479426 ?auto_479427 ?auto_479428 ?auto_479429 ?auto_479430 ?auto_479431 ?auto_479432 ?auto_479433 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_479469 - BLOCK
      ?auto_479470 - BLOCK
      ?auto_479471 - BLOCK
      ?auto_479472 - BLOCK
      ?auto_479473 - BLOCK
      ?auto_479474 - BLOCK
      ?auto_479475 - BLOCK
      ?auto_479476 - BLOCK
      ?auto_479477 - BLOCK
      ?auto_479478 - BLOCK
      ?auto_479479 - BLOCK
    )
    :vars
    (
      ?auto_479480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479479 ?auto_479480 ) ( ON-TABLE ?auto_479469 ) ( ON ?auto_479470 ?auto_479469 ) ( ON ?auto_479471 ?auto_479470 ) ( not ( = ?auto_479469 ?auto_479470 ) ) ( not ( = ?auto_479469 ?auto_479471 ) ) ( not ( = ?auto_479469 ?auto_479472 ) ) ( not ( = ?auto_479469 ?auto_479473 ) ) ( not ( = ?auto_479469 ?auto_479474 ) ) ( not ( = ?auto_479469 ?auto_479475 ) ) ( not ( = ?auto_479469 ?auto_479476 ) ) ( not ( = ?auto_479469 ?auto_479477 ) ) ( not ( = ?auto_479469 ?auto_479478 ) ) ( not ( = ?auto_479469 ?auto_479479 ) ) ( not ( = ?auto_479469 ?auto_479480 ) ) ( not ( = ?auto_479470 ?auto_479471 ) ) ( not ( = ?auto_479470 ?auto_479472 ) ) ( not ( = ?auto_479470 ?auto_479473 ) ) ( not ( = ?auto_479470 ?auto_479474 ) ) ( not ( = ?auto_479470 ?auto_479475 ) ) ( not ( = ?auto_479470 ?auto_479476 ) ) ( not ( = ?auto_479470 ?auto_479477 ) ) ( not ( = ?auto_479470 ?auto_479478 ) ) ( not ( = ?auto_479470 ?auto_479479 ) ) ( not ( = ?auto_479470 ?auto_479480 ) ) ( not ( = ?auto_479471 ?auto_479472 ) ) ( not ( = ?auto_479471 ?auto_479473 ) ) ( not ( = ?auto_479471 ?auto_479474 ) ) ( not ( = ?auto_479471 ?auto_479475 ) ) ( not ( = ?auto_479471 ?auto_479476 ) ) ( not ( = ?auto_479471 ?auto_479477 ) ) ( not ( = ?auto_479471 ?auto_479478 ) ) ( not ( = ?auto_479471 ?auto_479479 ) ) ( not ( = ?auto_479471 ?auto_479480 ) ) ( not ( = ?auto_479472 ?auto_479473 ) ) ( not ( = ?auto_479472 ?auto_479474 ) ) ( not ( = ?auto_479472 ?auto_479475 ) ) ( not ( = ?auto_479472 ?auto_479476 ) ) ( not ( = ?auto_479472 ?auto_479477 ) ) ( not ( = ?auto_479472 ?auto_479478 ) ) ( not ( = ?auto_479472 ?auto_479479 ) ) ( not ( = ?auto_479472 ?auto_479480 ) ) ( not ( = ?auto_479473 ?auto_479474 ) ) ( not ( = ?auto_479473 ?auto_479475 ) ) ( not ( = ?auto_479473 ?auto_479476 ) ) ( not ( = ?auto_479473 ?auto_479477 ) ) ( not ( = ?auto_479473 ?auto_479478 ) ) ( not ( = ?auto_479473 ?auto_479479 ) ) ( not ( = ?auto_479473 ?auto_479480 ) ) ( not ( = ?auto_479474 ?auto_479475 ) ) ( not ( = ?auto_479474 ?auto_479476 ) ) ( not ( = ?auto_479474 ?auto_479477 ) ) ( not ( = ?auto_479474 ?auto_479478 ) ) ( not ( = ?auto_479474 ?auto_479479 ) ) ( not ( = ?auto_479474 ?auto_479480 ) ) ( not ( = ?auto_479475 ?auto_479476 ) ) ( not ( = ?auto_479475 ?auto_479477 ) ) ( not ( = ?auto_479475 ?auto_479478 ) ) ( not ( = ?auto_479475 ?auto_479479 ) ) ( not ( = ?auto_479475 ?auto_479480 ) ) ( not ( = ?auto_479476 ?auto_479477 ) ) ( not ( = ?auto_479476 ?auto_479478 ) ) ( not ( = ?auto_479476 ?auto_479479 ) ) ( not ( = ?auto_479476 ?auto_479480 ) ) ( not ( = ?auto_479477 ?auto_479478 ) ) ( not ( = ?auto_479477 ?auto_479479 ) ) ( not ( = ?auto_479477 ?auto_479480 ) ) ( not ( = ?auto_479478 ?auto_479479 ) ) ( not ( = ?auto_479478 ?auto_479480 ) ) ( not ( = ?auto_479479 ?auto_479480 ) ) ( ON ?auto_479478 ?auto_479479 ) ( ON ?auto_479477 ?auto_479478 ) ( ON ?auto_479476 ?auto_479477 ) ( ON ?auto_479475 ?auto_479476 ) ( ON ?auto_479474 ?auto_479475 ) ( ON ?auto_479473 ?auto_479474 ) ( CLEAR ?auto_479471 ) ( ON ?auto_479472 ?auto_479473 ) ( CLEAR ?auto_479472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_479469 ?auto_479470 ?auto_479471 ?auto_479472 )
      ( MAKE-11PILE ?auto_479469 ?auto_479470 ?auto_479471 ?auto_479472 ?auto_479473 ?auto_479474 ?auto_479475 ?auto_479476 ?auto_479477 ?auto_479478 ?auto_479479 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_479515 - BLOCK
      ?auto_479516 - BLOCK
      ?auto_479517 - BLOCK
      ?auto_479518 - BLOCK
      ?auto_479519 - BLOCK
      ?auto_479520 - BLOCK
      ?auto_479521 - BLOCK
      ?auto_479522 - BLOCK
      ?auto_479523 - BLOCK
      ?auto_479524 - BLOCK
      ?auto_479525 - BLOCK
    )
    :vars
    (
      ?auto_479526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479525 ?auto_479526 ) ( ON-TABLE ?auto_479515 ) ( ON ?auto_479516 ?auto_479515 ) ( not ( = ?auto_479515 ?auto_479516 ) ) ( not ( = ?auto_479515 ?auto_479517 ) ) ( not ( = ?auto_479515 ?auto_479518 ) ) ( not ( = ?auto_479515 ?auto_479519 ) ) ( not ( = ?auto_479515 ?auto_479520 ) ) ( not ( = ?auto_479515 ?auto_479521 ) ) ( not ( = ?auto_479515 ?auto_479522 ) ) ( not ( = ?auto_479515 ?auto_479523 ) ) ( not ( = ?auto_479515 ?auto_479524 ) ) ( not ( = ?auto_479515 ?auto_479525 ) ) ( not ( = ?auto_479515 ?auto_479526 ) ) ( not ( = ?auto_479516 ?auto_479517 ) ) ( not ( = ?auto_479516 ?auto_479518 ) ) ( not ( = ?auto_479516 ?auto_479519 ) ) ( not ( = ?auto_479516 ?auto_479520 ) ) ( not ( = ?auto_479516 ?auto_479521 ) ) ( not ( = ?auto_479516 ?auto_479522 ) ) ( not ( = ?auto_479516 ?auto_479523 ) ) ( not ( = ?auto_479516 ?auto_479524 ) ) ( not ( = ?auto_479516 ?auto_479525 ) ) ( not ( = ?auto_479516 ?auto_479526 ) ) ( not ( = ?auto_479517 ?auto_479518 ) ) ( not ( = ?auto_479517 ?auto_479519 ) ) ( not ( = ?auto_479517 ?auto_479520 ) ) ( not ( = ?auto_479517 ?auto_479521 ) ) ( not ( = ?auto_479517 ?auto_479522 ) ) ( not ( = ?auto_479517 ?auto_479523 ) ) ( not ( = ?auto_479517 ?auto_479524 ) ) ( not ( = ?auto_479517 ?auto_479525 ) ) ( not ( = ?auto_479517 ?auto_479526 ) ) ( not ( = ?auto_479518 ?auto_479519 ) ) ( not ( = ?auto_479518 ?auto_479520 ) ) ( not ( = ?auto_479518 ?auto_479521 ) ) ( not ( = ?auto_479518 ?auto_479522 ) ) ( not ( = ?auto_479518 ?auto_479523 ) ) ( not ( = ?auto_479518 ?auto_479524 ) ) ( not ( = ?auto_479518 ?auto_479525 ) ) ( not ( = ?auto_479518 ?auto_479526 ) ) ( not ( = ?auto_479519 ?auto_479520 ) ) ( not ( = ?auto_479519 ?auto_479521 ) ) ( not ( = ?auto_479519 ?auto_479522 ) ) ( not ( = ?auto_479519 ?auto_479523 ) ) ( not ( = ?auto_479519 ?auto_479524 ) ) ( not ( = ?auto_479519 ?auto_479525 ) ) ( not ( = ?auto_479519 ?auto_479526 ) ) ( not ( = ?auto_479520 ?auto_479521 ) ) ( not ( = ?auto_479520 ?auto_479522 ) ) ( not ( = ?auto_479520 ?auto_479523 ) ) ( not ( = ?auto_479520 ?auto_479524 ) ) ( not ( = ?auto_479520 ?auto_479525 ) ) ( not ( = ?auto_479520 ?auto_479526 ) ) ( not ( = ?auto_479521 ?auto_479522 ) ) ( not ( = ?auto_479521 ?auto_479523 ) ) ( not ( = ?auto_479521 ?auto_479524 ) ) ( not ( = ?auto_479521 ?auto_479525 ) ) ( not ( = ?auto_479521 ?auto_479526 ) ) ( not ( = ?auto_479522 ?auto_479523 ) ) ( not ( = ?auto_479522 ?auto_479524 ) ) ( not ( = ?auto_479522 ?auto_479525 ) ) ( not ( = ?auto_479522 ?auto_479526 ) ) ( not ( = ?auto_479523 ?auto_479524 ) ) ( not ( = ?auto_479523 ?auto_479525 ) ) ( not ( = ?auto_479523 ?auto_479526 ) ) ( not ( = ?auto_479524 ?auto_479525 ) ) ( not ( = ?auto_479524 ?auto_479526 ) ) ( not ( = ?auto_479525 ?auto_479526 ) ) ( ON ?auto_479524 ?auto_479525 ) ( ON ?auto_479523 ?auto_479524 ) ( ON ?auto_479522 ?auto_479523 ) ( ON ?auto_479521 ?auto_479522 ) ( ON ?auto_479520 ?auto_479521 ) ( ON ?auto_479519 ?auto_479520 ) ( ON ?auto_479518 ?auto_479519 ) ( CLEAR ?auto_479516 ) ( ON ?auto_479517 ?auto_479518 ) ( CLEAR ?auto_479517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_479515 ?auto_479516 ?auto_479517 )
      ( MAKE-11PILE ?auto_479515 ?auto_479516 ?auto_479517 ?auto_479518 ?auto_479519 ?auto_479520 ?auto_479521 ?auto_479522 ?auto_479523 ?auto_479524 ?auto_479525 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_479561 - BLOCK
      ?auto_479562 - BLOCK
      ?auto_479563 - BLOCK
      ?auto_479564 - BLOCK
      ?auto_479565 - BLOCK
      ?auto_479566 - BLOCK
      ?auto_479567 - BLOCK
      ?auto_479568 - BLOCK
      ?auto_479569 - BLOCK
      ?auto_479570 - BLOCK
      ?auto_479571 - BLOCK
    )
    :vars
    (
      ?auto_479572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479571 ?auto_479572 ) ( ON-TABLE ?auto_479561 ) ( not ( = ?auto_479561 ?auto_479562 ) ) ( not ( = ?auto_479561 ?auto_479563 ) ) ( not ( = ?auto_479561 ?auto_479564 ) ) ( not ( = ?auto_479561 ?auto_479565 ) ) ( not ( = ?auto_479561 ?auto_479566 ) ) ( not ( = ?auto_479561 ?auto_479567 ) ) ( not ( = ?auto_479561 ?auto_479568 ) ) ( not ( = ?auto_479561 ?auto_479569 ) ) ( not ( = ?auto_479561 ?auto_479570 ) ) ( not ( = ?auto_479561 ?auto_479571 ) ) ( not ( = ?auto_479561 ?auto_479572 ) ) ( not ( = ?auto_479562 ?auto_479563 ) ) ( not ( = ?auto_479562 ?auto_479564 ) ) ( not ( = ?auto_479562 ?auto_479565 ) ) ( not ( = ?auto_479562 ?auto_479566 ) ) ( not ( = ?auto_479562 ?auto_479567 ) ) ( not ( = ?auto_479562 ?auto_479568 ) ) ( not ( = ?auto_479562 ?auto_479569 ) ) ( not ( = ?auto_479562 ?auto_479570 ) ) ( not ( = ?auto_479562 ?auto_479571 ) ) ( not ( = ?auto_479562 ?auto_479572 ) ) ( not ( = ?auto_479563 ?auto_479564 ) ) ( not ( = ?auto_479563 ?auto_479565 ) ) ( not ( = ?auto_479563 ?auto_479566 ) ) ( not ( = ?auto_479563 ?auto_479567 ) ) ( not ( = ?auto_479563 ?auto_479568 ) ) ( not ( = ?auto_479563 ?auto_479569 ) ) ( not ( = ?auto_479563 ?auto_479570 ) ) ( not ( = ?auto_479563 ?auto_479571 ) ) ( not ( = ?auto_479563 ?auto_479572 ) ) ( not ( = ?auto_479564 ?auto_479565 ) ) ( not ( = ?auto_479564 ?auto_479566 ) ) ( not ( = ?auto_479564 ?auto_479567 ) ) ( not ( = ?auto_479564 ?auto_479568 ) ) ( not ( = ?auto_479564 ?auto_479569 ) ) ( not ( = ?auto_479564 ?auto_479570 ) ) ( not ( = ?auto_479564 ?auto_479571 ) ) ( not ( = ?auto_479564 ?auto_479572 ) ) ( not ( = ?auto_479565 ?auto_479566 ) ) ( not ( = ?auto_479565 ?auto_479567 ) ) ( not ( = ?auto_479565 ?auto_479568 ) ) ( not ( = ?auto_479565 ?auto_479569 ) ) ( not ( = ?auto_479565 ?auto_479570 ) ) ( not ( = ?auto_479565 ?auto_479571 ) ) ( not ( = ?auto_479565 ?auto_479572 ) ) ( not ( = ?auto_479566 ?auto_479567 ) ) ( not ( = ?auto_479566 ?auto_479568 ) ) ( not ( = ?auto_479566 ?auto_479569 ) ) ( not ( = ?auto_479566 ?auto_479570 ) ) ( not ( = ?auto_479566 ?auto_479571 ) ) ( not ( = ?auto_479566 ?auto_479572 ) ) ( not ( = ?auto_479567 ?auto_479568 ) ) ( not ( = ?auto_479567 ?auto_479569 ) ) ( not ( = ?auto_479567 ?auto_479570 ) ) ( not ( = ?auto_479567 ?auto_479571 ) ) ( not ( = ?auto_479567 ?auto_479572 ) ) ( not ( = ?auto_479568 ?auto_479569 ) ) ( not ( = ?auto_479568 ?auto_479570 ) ) ( not ( = ?auto_479568 ?auto_479571 ) ) ( not ( = ?auto_479568 ?auto_479572 ) ) ( not ( = ?auto_479569 ?auto_479570 ) ) ( not ( = ?auto_479569 ?auto_479571 ) ) ( not ( = ?auto_479569 ?auto_479572 ) ) ( not ( = ?auto_479570 ?auto_479571 ) ) ( not ( = ?auto_479570 ?auto_479572 ) ) ( not ( = ?auto_479571 ?auto_479572 ) ) ( ON ?auto_479570 ?auto_479571 ) ( ON ?auto_479569 ?auto_479570 ) ( ON ?auto_479568 ?auto_479569 ) ( ON ?auto_479567 ?auto_479568 ) ( ON ?auto_479566 ?auto_479567 ) ( ON ?auto_479565 ?auto_479566 ) ( ON ?auto_479564 ?auto_479565 ) ( ON ?auto_479563 ?auto_479564 ) ( CLEAR ?auto_479561 ) ( ON ?auto_479562 ?auto_479563 ) ( CLEAR ?auto_479562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_479561 ?auto_479562 )
      ( MAKE-11PILE ?auto_479561 ?auto_479562 ?auto_479563 ?auto_479564 ?auto_479565 ?auto_479566 ?auto_479567 ?auto_479568 ?auto_479569 ?auto_479570 ?auto_479571 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_479607 - BLOCK
      ?auto_479608 - BLOCK
      ?auto_479609 - BLOCK
      ?auto_479610 - BLOCK
      ?auto_479611 - BLOCK
      ?auto_479612 - BLOCK
      ?auto_479613 - BLOCK
      ?auto_479614 - BLOCK
      ?auto_479615 - BLOCK
      ?auto_479616 - BLOCK
      ?auto_479617 - BLOCK
    )
    :vars
    (
      ?auto_479618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479617 ?auto_479618 ) ( not ( = ?auto_479607 ?auto_479608 ) ) ( not ( = ?auto_479607 ?auto_479609 ) ) ( not ( = ?auto_479607 ?auto_479610 ) ) ( not ( = ?auto_479607 ?auto_479611 ) ) ( not ( = ?auto_479607 ?auto_479612 ) ) ( not ( = ?auto_479607 ?auto_479613 ) ) ( not ( = ?auto_479607 ?auto_479614 ) ) ( not ( = ?auto_479607 ?auto_479615 ) ) ( not ( = ?auto_479607 ?auto_479616 ) ) ( not ( = ?auto_479607 ?auto_479617 ) ) ( not ( = ?auto_479607 ?auto_479618 ) ) ( not ( = ?auto_479608 ?auto_479609 ) ) ( not ( = ?auto_479608 ?auto_479610 ) ) ( not ( = ?auto_479608 ?auto_479611 ) ) ( not ( = ?auto_479608 ?auto_479612 ) ) ( not ( = ?auto_479608 ?auto_479613 ) ) ( not ( = ?auto_479608 ?auto_479614 ) ) ( not ( = ?auto_479608 ?auto_479615 ) ) ( not ( = ?auto_479608 ?auto_479616 ) ) ( not ( = ?auto_479608 ?auto_479617 ) ) ( not ( = ?auto_479608 ?auto_479618 ) ) ( not ( = ?auto_479609 ?auto_479610 ) ) ( not ( = ?auto_479609 ?auto_479611 ) ) ( not ( = ?auto_479609 ?auto_479612 ) ) ( not ( = ?auto_479609 ?auto_479613 ) ) ( not ( = ?auto_479609 ?auto_479614 ) ) ( not ( = ?auto_479609 ?auto_479615 ) ) ( not ( = ?auto_479609 ?auto_479616 ) ) ( not ( = ?auto_479609 ?auto_479617 ) ) ( not ( = ?auto_479609 ?auto_479618 ) ) ( not ( = ?auto_479610 ?auto_479611 ) ) ( not ( = ?auto_479610 ?auto_479612 ) ) ( not ( = ?auto_479610 ?auto_479613 ) ) ( not ( = ?auto_479610 ?auto_479614 ) ) ( not ( = ?auto_479610 ?auto_479615 ) ) ( not ( = ?auto_479610 ?auto_479616 ) ) ( not ( = ?auto_479610 ?auto_479617 ) ) ( not ( = ?auto_479610 ?auto_479618 ) ) ( not ( = ?auto_479611 ?auto_479612 ) ) ( not ( = ?auto_479611 ?auto_479613 ) ) ( not ( = ?auto_479611 ?auto_479614 ) ) ( not ( = ?auto_479611 ?auto_479615 ) ) ( not ( = ?auto_479611 ?auto_479616 ) ) ( not ( = ?auto_479611 ?auto_479617 ) ) ( not ( = ?auto_479611 ?auto_479618 ) ) ( not ( = ?auto_479612 ?auto_479613 ) ) ( not ( = ?auto_479612 ?auto_479614 ) ) ( not ( = ?auto_479612 ?auto_479615 ) ) ( not ( = ?auto_479612 ?auto_479616 ) ) ( not ( = ?auto_479612 ?auto_479617 ) ) ( not ( = ?auto_479612 ?auto_479618 ) ) ( not ( = ?auto_479613 ?auto_479614 ) ) ( not ( = ?auto_479613 ?auto_479615 ) ) ( not ( = ?auto_479613 ?auto_479616 ) ) ( not ( = ?auto_479613 ?auto_479617 ) ) ( not ( = ?auto_479613 ?auto_479618 ) ) ( not ( = ?auto_479614 ?auto_479615 ) ) ( not ( = ?auto_479614 ?auto_479616 ) ) ( not ( = ?auto_479614 ?auto_479617 ) ) ( not ( = ?auto_479614 ?auto_479618 ) ) ( not ( = ?auto_479615 ?auto_479616 ) ) ( not ( = ?auto_479615 ?auto_479617 ) ) ( not ( = ?auto_479615 ?auto_479618 ) ) ( not ( = ?auto_479616 ?auto_479617 ) ) ( not ( = ?auto_479616 ?auto_479618 ) ) ( not ( = ?auto_479617 ?auto_479618 ) ) ( ON ?auto_479616 ?auto_479617 ) ( ON ?auto_479615 ?auto_479616 ) ( ON ?auto_479614 ?auto_479615 ) ( ON ?auto_479613 ?auto_479614 ) ( ON ?auto_479612 ?auto_479613 ) ( ON ?auto_479611 ?auto_479612 ) ( ON ?auto_479610 ?auto_479611 ) ( ON ?auto_479609 ?auto_479610 ) ( ON ?auto_479608 ?auto_479609 ) ( ON ?auto_479607 ?auto_479608 ) ( CLEAR ?auto_479607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_479607 )
      ( MAKE-11PILE ?auto_479607 ?auto_479608 ?auto_479609 ?auto_479610 ?auto_479611 ?auto_479612 ?auto_479613 ?auto_479614 ?auto_479615 ?auto_479616 ?auto_479617 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_479654 - BLOCK
      ?auto_479655 - BLOCK
      ?auto_479656 - BLOCK
      ?auto_479657 - BLOCK
      ?auto_479658 - BLOCK
      ?auto_479659 - BLOCK
      ?auto_479660 - BLOCK
      ?auto_479661 - BLOCK
      ?auto_479662 - BLOCK
      ?auto_479663 - BLOCK
      ?auto_479664 - BLOCK
      ?auto_479665 - BLOCK
    )
    :vars
    (
      ?auto_479666 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_479664 ) ( ON ?auto_479665 ?auto_479666 ) ( CLEAR ?auto_479665 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_479654 ) ( ON ?auto_479655 ?auto_479654 ) ( ON ?auto_479656 ?auto_479655 ) ( ON ?auto_479657 ?auto_479656 ) ( ON ?auto_479658 ?auto_479657 ) ( ON ?auto_479659 ?auto_479658 ) ( ON ?auto_479660 ?auto_479659 ) ( ON ?auto_479661 ?auto_479660 ) ( ON ?auto_479662 ?auto_479661 ) ( ON ?auto_479663 ?auto_479662 ) ( ON ?auto_479664 ?auto_479663 ) ( not ( = ?auto_479654 ?auto_479655 ) ) ( not ( = ?auto_479654 ?auto_479656 ) ) ( not ( = ?auto_479654 ?auto_479657 ) ) ( not ( = ?auto_479654 ?auto_479658 ) ) ( not ( = ?auto_479654 ?auto_479659 ) ) ( not ( = ?auto_479654 ?auto_479660 ) ) ( not ( = ?auto_479654 ?auto_479661 ) ) ( not ( = ?auto_479654 ?auto_479662 ) ) ( not ( = ?auto_479654 ?auto_479663 ) ) ( not ( = ?auto_479654 ?auto_479664 ) ) ( not ( = ?auto_479654 ?auto_479665 ) ) ( not ( = ?auto_479654 ?auto_479666 ) ) ( not ( = ?auto_479655 ?auto_479656 ) ) ( not ( = ?auto_479655 ?auto_479657 ) ) ( not ( = ?auto_479655 ?auto_479658 ) ) ( not ( = ?auto_479655 ?auto_479659 ) ) ( not ( = ?auto_479655 ?auto_479660 ) ) ( not ( = ?auto_479655 ?auto_479661 ) ) ( not ( = ?auto_479655 ?auto_479662 ) ) ( not ( = ?auto_479655 ?auto_479663 ) ) ( not ( = ?auto_479655 ?auto_479664 ) ) ( not ( = ?auto_479655 ?auto_479665 ) ) ( not ( = ?auto_479655 ?auto_479666 ) ) ( not ( = ?auto_479656 ?auto_479657 ) ) ( not ( = ?auto_479656 ?auto_479658 ) ) ( not ( = ?auto_479656 ?auto_479659 ) ) ( not ( = ?auto_479656 ?auto_479660 ) ) ( not ( = ?auto_479656 ?auto_479661 ) ) ( not ( = ?auto_479656 ?auto_479662 ) ) ( not ( = ?auto_479656 ?auto_479663 ) ) ( not ( = ?auto_479656 ?auto_479664 ) ) ( not ( = ?auto_479656 ?auto_479665 ) ) ( not ( = ?auto_479656 ?auto_479666 ) ) ( not ( = ?auto_479657 ?auto_479658 ) ) ( not ( = ?auto_479657 ?auto_479659 ) ) ( not ( = ?auto_479657 ?auto_479660 ) ) ( not ( = ?auto_479657 ?auto_479661 ) ) ( not ( = ?auto_479657 ?auto_479662 ) ) ( not ( = ?auto_479657 ?auto_479663 ) ) ( not ( = ?auto_479657 ?auto_479664 ) ) ( not ( = ?auto_479657 ?auto_479665 ) ) ( not ( = ?auto_479657 ?auto_479666 ) ) ( not ( = ?auto_479658 ?auto_479659 ) ) ( not ( = ?auto_479658 ?auto_479660 ) ) ( not ( = ?auto_479658 ?auto_479661 ) ) ( not ( = ?auto_479658 ?auto_479662 ) ) ( not ( = ?auto_479658 ?auto_479663 ) ) ( not ( = ?auto_479658 ?auto_479664 ) ) ( not ( = ?auto_479658 ?auto_479665 ) ) ( not ( = ?auto_479658 ?auto_479666 ) ) ( not ( = ?auto_479659 ?auto_479660 ) ) ( not ( = ?auto_479659 ?auto_479661 ) ) ( not ( = ?auto_479659 ?auto_479662 ) ) ( not ( = ?auto_479659 ?auto_479663 ) ) ( not ( = ?auto_479659 ?auto_479664 ) ) ( not ( = ?auto_479659 ?auto_479665 ) ) ( not ( = ?auto_479659 ?auto_479666 ) ) ( not ( = ?auto_479660 ?auto_479661 ) ) ( not ( = ?auto_479660 ?auto_479662 ) ) ( not ( = ?auto_479660 ?auto_479663 ) ) ( not ( = ?auto_479660 ?auto_479664 ) ) ( not ( = ?auto_479660 ?auto_479665 ) ) ( not ( = ?auto_479660 ?auto_479666 ) ) ( not ( = ?auto_479661 ?auto_479662 ) ) ( not ( = ?auto_479661 ?auto_479663 ) ) ( not ( = ?auto_479661 ?auto_479664 ) ) ( not ( = ?auto_479661 ?auto_479665 ) ) ( not ( = ?auto_479661 ?auto_479666 ) ) ( not ( = ?auto_479662 ?auto_479663 ) ) ( not ( = ?auto_479662 ?auto_479664 ) ) ( not ( = ?auto_479662 ?auto_479665 ) ) ( not ( = ?auto_479662 ?auto_479666 ) ) ( not ( = ?auto_479663 ?auto_479664 ) ) ( not ( = ?auto_479663 ?auto_479665 ) ) ( not ( = ?auto_479663 ?auto_479666 ) ) ( not ( = ?auto_479664 ?auto_479665 ) ) ( not ( = ?auto_479664 ?auto_479666 ) ) ( not ( = ?auto_479665 ?auto_479666 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_479665 ?auto_479666 )
      ( !STACK ?auto_479665 ?auto_479664 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_479704 - BLOCK
      ?auto_479705 - BLOCK
      ?auto_479706 - BLOCK
      ?auto_479707 - BLOCK
      ?auto_479708 - BLOCK
      ?auto_479709 - BLOCK
      ?auto_479710 - BLOCK
      ?auto_479711 - BLOCK
      ?auto_479712 - BLOCK
      ?auto_479713 - BLOCK
      ?auto_479714 - BLOCK
      ?auto_479715 - BLOCK
    )
    :vars
    (
      ?auto_479716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479715 ?auto_479716 ) ( ON-TABLE ?auto_479704 ) ( ON ?auto_479705 ?auto_479704 ) ( ON ?auto_479706 ?auto_479705 ) ( ON ?auto_479707 ?auto_479706 ) ( ON ?auto_479708 ?auto_479707 ) ( ON ?auto_479709 ?auto_479708 ) ( ON ?auto_479710 ?auto_479709 ) ( ON ?auto_479711 ?auto_479710 ) ( ON ?auto_479712 ?auto_479711 ) ( ON ?auto_479713 ?auto_479712 ) ( not ( = ?auto_479704 ?auto_479705 ) ) ( not ( = ?auto_479704 ?auto_479706 ) ) ( not ( = ?auto_479704 ?auto_479707 ) ) ( not ( = ?auto_479704 ?auto_479708 ) ) ( not ( = ?auto_479704 ?auto_479709 ) ) ( not ( = ?auto_479704 ?auto_479710 ) ) ( not ( = ?auto_479704 ?auto_479711 ) ) ( not ( = ?auto_479704 ?auto_479712 ) ) ( not ( = ?auto_479704 ?auto_479713 ) ) ( not ( = ?auto_479704 ?auto_479714 ) ) ( not ( = ?auto_479704 ?auto_479715 ) ) ( not ( = ?auto_479704 ?auto_479716 ) ) ( not ( = ?auto_479705 ?auto_479706 ) ) ( not ( = ?auto_479705 ?auto_479707 ) ) ( not ( = ?auto_479705 ?auto_479708 ) ) ( not ( = ?auto_479705 ?auto_479709 ) ) ( not ( = ?auto_479705 ?auto_479710 ) ) ( not ( = ?auto_479705 ?auto_479711 ) ) ( not ( = ?auto_479705 ?auto_479712 ) ) ( not ( = ?auto_479705 ?auto_479713 ) ) ( not ( = ?auto_479705 ?auto_479714 ) ) ( not ( = ?auto_479705 ?auto_479715 ) ) ( not ( = ?auto_479705 ?auto_479716 ) ) ( not ( = ?auto_479706 ?auto_479707 ) ) ( not ( = ?auto_479706 ?auto_479708 ) ) ( not ( = ?auto_479706 ?auto_479709 ) ) ( not ( = ?auto_479706 ?auto_479710 ) ) ( not ( = ?auto_479706 ?auto_479711 ) ) ( not ( = ?auto_479706 ?auto_479712 ) ) ( not ( = ?auto_479706 ?auto_479713 ) ) ( not ( = ?auto_479706 ?auto_479714 ) ) ( not ( = ?auto_479706 ?auto_479715 ) ) ( not ( = ?auto_479706 ?auto_479716 ) ) ( not ( = ?auto_479707 ?auto_479708 ) ) ( not ( = ?auto_479707 ?auto_479709 ) ) ( not ( = ?auto_479707 ?auto_479710 ) ) ( not ( = ?auto_479707 ?auto_479711 ) ) ( not ( = ?auto_479707 ?auto_479712 ) ) ( not ( = ?auto_479707 ?auto_479713 ) ) ( not ( = ?auto_479707 ?auto_479714 ) ) ( not ( = ?auto_479707 ?auto_479715 ) ) ( not ( = ?auto_479707 ?auto_479716 ) ) ( not ( = ?auto_479708 ?auto_479709 ) ) ( not ( = ?auto_479708 ?auto_479710 ) ) ( not ( = ?auto_479708 ?auto_479711 ) ) ( not ( = ?auto_479708 ?auto_479712 ) ) ( not ( = ?auto_479708 ?auto_479713 ) ) ( not ( = ?auto_479708 ?auto_479714 ) ) ( not ( = ?auto_479708 ?auto_479715 ) ) ( not ( = ?auto_479708 ?auto_479716 ) ) ( not ( = ?auto_479709 ?auto_479710 ) ) ( not ( = ?auto_479709 ?auto_479711 ) ) ( not ( = ?auto_479709 ?auto_479712 ) ) ( not ( = ?auto_479709 ?auto_479713 ) ) ( not ( = ?auto_479709 ?auto_479714 ) ) ( not ( = ?auto_479709 ?auto_479715 ) ) ( not ( = ?auto_479709 ?auto_479716 ) ) ( not ( = ?auto_479710 ?auto_479711 ) ) ( not ( = ?auto_479710 ?auto_479712 ) ) ( not ( = ?auto_479710 ?auto_479713 ) ) ( not ( = ?auto_479710 ?auto_479714 ) ) ( not ( = ?auto_479710 ?auto_479715 ) ) ( not ( = ?auto_479710 ?auto_479716 ) ) ( not ( = ?auto_479711 ?auto_479712 ) ) ( not ( = ?auto_479711 ?auto_479713 ) ) ( not ( = ?auto_479711 ?auto_479714 ) ) ( not ( = ?auto_479711 ?auto_479715 ) ) ( not ( = ?auto_479711 ?auto_479716 ) ) ( not ( = ?auto_479712 ?auto_479713 ) ) ( not ( = ?auto_479712 ?auto_479714 ) ) ( not ( = ?auto_479712 ?auto_479715 ) ) ( not ( = ?auto_479712 ?auto_479716 ) ) ( not ( = ?auto_479713 ?auto_479714 ) ) ( not ( = ?auto_479713 ?auto_479715 ) ) ( not ( = ?auto_479713 ?auto_479716 ) ) ( not ( = ?auto_479714 ?auto_479715 ) ) ( not ( = ?auto_479714 ?auto_479716 ) ) ( not ( = ?auto_479715 ?auto_479716 ) ) ( CLEAR ?auto_479713 ) ( ON ?auto_479714 ?auto_479715 ) ( CLEAR ?auto_479714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_479704 ?auto_479705 ?auto_479706 ?auto_479707 ?auto_479708 ?auto_479709 ?auto_479710 ?auto_479711 ?auto_479712 ?auto_479713 ?auto_479714 )
      ( MAKE-12PILE ?auto_479704 ?auto_479705 ?auto_479706 ?auto_479707 ?auto_479708 ?auto_479709 ?auto_479710 ?auto_479711 ?auto_479712 ?auto_479713 ?auto_479714 ?auto_479715 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_479754 - BLOCK
      ?auto_479755 - BLOCK
      ?auto_479756 - BLOCK
      ?auto_479757 - BLOCK
      ?auto_479758 - BLOCK
      ?auto_479759 - BLOCK
      ?auto_479760 - BLOCK
      ?auto_479761 - BLOCK
      ?auto_479762 - BLOCK
      ?auto_479763 - BLOCK
      ?auto_479764 - BLOCK
      ?auto_479765 - BLOCK
    )
    :vars
    (
      ?auto_479766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479765 ?auto_479766 ) ( ON-TABLE ?auto_479754 ) ( ON ?auto_479755 ?auto_479754 ) ( ON ?auto_479756 ?auto_479755 ) ( ON ?auto_479757 ?auto_479756 ) ( ON ?auto_479758 ?auto_479757 ) ( ON ?auto_479759 ?auto_479758 ) ( ON ?auto_479760 ?auto_479759 ) ( ON ?auto_479761 ?auto_479760 ) ( ON ?auto_479762 ?auto_479761 ) ( not ( = ?auto_479754 ?auto_479755 ) ) ( not ( = ?auto_479754 ?auto_479756 ) ) ( not ( = ?auto_479754 ?auto_479757 ) ) ( not ( = ?auto_479754 ?auto_479758 ) ) ( not ( = ?auto_479754 ?auto_479759 ) ) ( not ( = ?auto_479754 ?auto_479760 ) ) ( not ( = ?auto_479754 ?auto_479761 ) ) ( not ( = ?auto_479754 ?auto_479762 ) ) ( not ( = ?auto_479754 ?auto_479763 ) ) ( not ( = ?auto_479754 ?auto_479764 ) ) ( not ( = ?auto_479754 ?auto_479765 ) ) ( not ( = ?auto_479754 ?auto_479766 ) ) ( not ( = ?auto_479755 ?auto_479756 ) ) ( not ( = ?auto_479755 ?auto_479757 ) ) ( not ( = ?auto_479755 ?auto_479758 ) ) ( not ( = ?auto_479755 ?auto_479759 ) ) ( not ( = ?auto_479755 ?auto_479760 ) ) ( not ( = ?auto_479755 ?auto_479761 ) ) ( not ( = ?auto_479755 ?auto_479762 ) ) ( not ( = ?auto_479755 ?auto_479763 ) ) ( not ( = ?auto_479755 ?auto_479764 ) ) ( not ( = ?auto_479755 ?auto_479765 ) ) ( not ( = ?auto_479755 ?auto_479766 ) ) ( not ( = ?auto_479756 ?auto_479757 ) ) ( not ( = ?auto_479756 ?auto_479758 ) ) ( not ( = ?auto_479756 ?auto_479759 ) ) ( not ( = ?auto_479756 ?auto_479760 ) ) ( not ( = ?auto_479756 ?auto_479761 ) ) ( not ( = ?auto_479756 ?auto_479762 ) ) ( not ( = ?auto_479756 ?auto_479763 ) ) ( not ( = ?auto_479756 ?auto_479764 ) ) ( not ( = ?auto_479756 ?auto_479765 ) ) ( not ( = ?auto_479756 ?auto_479766 ) ) ( not ( = ?auto_479757 ?auto_479758 ) ) ( not ( = ?auto_479757 ?auto_479759 ) ) ( not ( = ?auto_479757 ?auto_479760 ) ) ( not ( = ?auto_479757 ?auto_479761 ) ) ( not ( = ?auto_479757 ?auto_479762 ) ) ( not ( = ?auto_479757 ?auto_479763 ) ) ( not ( = ?auto_479757 ?auto_479764 ) ) ( not ( = ?auto_479757 ?auto_479765 ) ) ( not ( = ?auto_479757 ?auto_479766 ) ) ( not ( = ?auto_479758 ?auto_479759 ) ) ( not ( = ?auto_479758 ?auto_479760 ) ) ( not ( = ?auto_479758 ?auto_479761 ) ) ( not ( = ?auto_479758 ?auto_479762 ) ) ( not ( = ?auto_479758 ?auto_479763 ) ) ( not ( = ?auto_479758 ?auto_479764 ) ) ( not ( = ?auto_479758 ?auto_479765 ) ) ( not ( = ?auto_479758 ?auto_479766 ) ) ( not ( = ?auto_479759 ?auto_479760 ) ) ( not ( = ?auto_479759 ?auto_479761 ) ) ( not ( = ?auto_479759 ?auto_479762 ) ) ( not ( = ?auto_479759 ?auto_479763 ) ) ( not ( = ?auto_479759 ?auto_479764 ) ) ( not ( = ?auto_479759 ?auto_479765 ) ) ( not ( = ?auto_479759 ?auto_479766 ) ) ( not ( = ?auto_479760 ?auto_479761 ) ) ( not ( = ?auto_479760 ?auto_479762 ) ) ( not ( = ?auto_479760 ?auto_479763 ) ) ( not ( = ?auto_479760 ?auto_479764 ) ) ( not ( = ?auto_479760 ?auto_479765 ) ) ( not ( = ?auto_479760 ?auto_479766 ) ) ( not ( = ?auto_479761 ?auto_479762 ) ) ( not ( = ?auto_479761 ?auto_479763 ) ) ( not ( = ?auto_479761 ?auto_479764 ) ) ( not ( = ?auto_479761 ?auto_479765 ) ) ( not ( = ?auto_479761 ?auto_479766 ) ) ( not ( = ?auto_479762 ?auto_479763 ) ) ( not ( = ?auto_479762 ?auto_479764 ) ) ( not ( = ?auto_479762 ?auto_479765 ) ) ( not ( = ?auto_479762 ?auto_479766 ) ) ( not ( = ?auto_479763 ?auto_479764 ) ) ( not ( = ?auto_479763 ?auto_479765 ) ) ( not ( = ?auto_479763 ?auto_479766 ) ) ( not ( = ?auto_479764 ?auto_479765 ) ) ( not ( = ?auto_479764 ?auto_479766 ) ) ( not ( = ?auto_479765 ?auto_479766 ) ) ( ON ?auto_479764 ?auto_479765 ) ( CLEAR ?auto_479762 ) ( ON ?auto_479763 ?auto_479764 ) ( CLEAR ?auto_479763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_479754 ?auto_479755 ?auto_479756 ?auto_479757 ?auto_479758 ?auto_479759 ?auto_479760 ?auto_479761 ?auto_479762 ?auto_479763 )
      ( MAKE-12PILE ?auto_479754 ?auto_479755 ?auto_479756 ?auto_479757 ?auto_479758 ?auto_479759 ?auto_479760 ?auto_479761 ?auto_479762 ?auto_479763 ?auto_479764 ?auto_479765 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_479804 - BLOCK
      ?auto_479805 - BLOCK
      ?auto_479806 - BLOCK
      ?auto_479807 - BLOCK
      ?auto_479808 - BLOCK
      ?auto_479809 - BLOCK
      ?auto_479810 - BLOCK
      ?auto_479811 - BLOCK
      ?auto_479812 - BLOCK
      ?auto_479813 - BLOCK
      ?auto_479814 - BLOCK
      ?auto_479815 - BLOCK
    )
    :vars
    (
      ?auto_479816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479815 ?auto_479816 ) ( ON-TABLE ?auto_479804 ) ( ON ?auto_479805 ?auto_479804 ) ( ON ?auto_479806 ?auto_479805 ) ( ON ?auto_479807 ?auto_479806 ) ( ON ?auto_479808 ?auto_479807 ) ( ON ?auto_479809 ?auto_479808 ) ( ON ?auto_479810 ?auto_479809 ) ( ON ?auto_479811 ?auto_479810 ) ( not ( = ?auto_479804 ?auto_479805 ) ) ( not ( = ?auto_479804 ?auto_479806 ) ) ( not ( = ?auto_479804 ?auto_479807 ) ) ( not ( = ?auto_479804 ?auto_479808 ) ) ( not ( = ?auto_479804 ?auto_479809 ) ) ( not ( = ?auto_479804 ?auto_479810 ) ) ( not ( = ?auto_479804 ?auto_479811 ) ) ( not ( = ?auto_479804 ?auto_479812 ) ) ( not ( = ?auto_479804 ?auto_479813 ) ) ( not ( = ?auto_479804 ?auto_479814 ) ) ( not ( = ?auto_479804 ?auto_479815 ) ) ( not ( = ?auto_479804 ?auto_479816 ) ) ( not ( = ?auto_479805 ?auto_479806 ) ) ( not ( = ?auto_479805 ?auto_479807 ) ) ( not ( = ?auto_479805 ?auto_479808 ) ) ( not ( = ?auto_479805 ?auto_479809 ) ) ( not ( = ?auto_479805 ?auto_479810 ) ) ( not ( = ?auto_479805 ?auto_479811 ) ) ( not ( = ?auto_479805 ?auto_479812 ) ) ( not ( = ?auto_479805 ?auto_479813 ) ) ( not ( = ?auto_479805 ?auto_479814 ) ) ( not ( = ?auto_479805 ?auto_479815 ) ) ( not ( = ?auto_479805 ?auto_479816 ) ) ( not ( = ?auto_479806 ?auto_479807 ) ) ( not ( = ?auto_479806 ?auto_479808 ) ) ( not ( = ?auto_479806 ?auto_479809 ) ) ( not ( = ?auto_479806 ?auto_479810 ) ) ( not ( = ?auto_479806 ?auto_479811 ) ) ( not ( = ?auto_479806 ?auto_479812 ) ) ( not ( = ?auto_479806 ?auto_479813 ) ) ( not ( = ?auto_479806 ?auto_479814 ) ) ( not ( = ?auto_479806 ?auto_479815 ) ) ( not ( = ?auto_479806 ?auto_479816 ) ) ( not ( = ?auto_479807 ?auto_479808 ) ) ( not ( = ?auto_479807 ?auto_479809 ) ) ( not ( = ?auto_479807 ?auto_479810 ) ) ( not ( = ?auto_479807 ?auto_479811 ) ) ( not ( = ?auto_479807 ?auto_479812 ) ) ( not ( = ?auto_479807 ?auto_479813 ) ) ( not ( = ?auto_479807 ?auto_479814 ) ) ( not ( = ?auto_479807 ?auto_479815 ) ) ( not ( = ?auto_479807 ?auto_479816 ) ) ( not ( = ?auto_479808 ?auto_479809 ) ) ( not ( = ?auto_479808 ?auto_479810 ) ) ( not ( = ?auto_479808 ?auto_479811 ) ) ( not ( = ?auto_479808 ?auto_479812 ) ) ( not ( = ?auto_479808 ?auto_479813 ) ) ( not ( = ?auto_479808 ?auto_479814 ) ) ( not ( = ?auto_479808 ?auto_479815 ) ) ( not ( = ?auto_479808 ?auto_479816 ) ) ( not ( = ?auto_479809 ?auto_479810 ) ) ( not ( = ?auto_479809 ?auto_479811 ) ) ( not ( = ?auto_479809 ?auto_479812 ) ) ( not ( = ?auto_479809 ?auto_479813 ) ) ( not ( = ?auto_479809 ?auto_479814 ) ) ( not ( = ?auto_479809 ?auto_479815 ) ) ( not ( = ?auto_479809 ?auto_479816 ) ) ( not ( = ?auto_479810 ?auto_479811 ) ) ( not ( = ?auto_479810 ?auto_479812 ) ) ( not ( = ?auto_479810 ?auto_479813 ) ) ( not ( = ?auto_479810 ?auto_479814 ) ) ( not ( = ?auto_479810 ?auto_479815 ) ) ( not ( = ?auto_479810 ?auto_479816 ) ) ( not ( = ?auto_479811 ?auto_479812 ) ) ( not ( = ?auto_479811 ?auto_479813 ) ) ( not ( = ?auto_479811 ?auto_479814 ) ) ( not ( = ?auto_479811 ?auto_479815 ) ) ( not ( = ?auto_479811 ?auto_479816 ) ) ( not ( = ?auto_479812 ?auto_479813 ) ) ( not ( = ?auto_479812 ?auto_479814 ) ) ( not ( = ?auto_479812 ?auto_479815 ) ) ( not ( = ?auto_479812 ?auto_479816 ) ) ( not ( = ?auto_479813 ?auto_479814 ) ) ( not ( = ?auto_479813 ?auto_479815 ) ) ( not ( = ?auto_479813 ?auto_479816 ) ) ( not ( = ?auto_479814 ?auto_479815 ) ) ( not ( = ?auto_479814 ?auto_479816 ) ) ( not ( = ?auto_479815 ?auto_479816 ) ) ( ON ?auto_479814 ?auto_479815 ) ( ON ?auto_479813 ?auto_479814 ) ( CLEAR ?auto_479811 ) ( ON ?auto_479812 ?auto_479813 ) ( CLEAR ?auto_479812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_479804 ?auto_479805 ?auto_479806 ?auto_479807 ?auto_479808 ?auto_479809 ?auto_479810 ?auto_479811 ?auto_479812 )
      ( MAKE-12PILE ?auto_479804 ?auto_479805 ?auto_479806 ?auto_479807 ?auto_479808 ?auto_479809 ?auto_479810 ?auto_479811 ?auto_479812 ?auto_479813 ?auto_479814 ?auto_479815 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_479854 - BLOCK
      ?auto_479855 - BLOCK
      ?auto_479856 - BLOCK
      ?auto_479857 - BLOCK
      ?auto_479858 - BLOCK
      ?auto_479859 - BLOCK
      ?auto_479860 - BLOCK
      ?auto_479861 - BLOCK
      ?auto_479862 - BLOCK
      ?auto_479863 - BLOCK
      ?auto_479864 - BLOCK
      ?auto_479865 - BLOCK
    )
    :vars
    (
      ?auto_479866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479865 ?auto_479866 ) ( ON-TABLE ?auto_479854 ) ( ON ?auto_479855 ?auto_479854 ) ( ON ?auto_479856 ?auto_479855 ) ( ON ?auto_479857 ?auto_479856 ) ( ON ?auto_479858 ?auto_479857 ) ( ON ?auto_479859 ?auto_479858 ) ( ON ?auto_479860 ?auto_479859 ) ( not ( = ?auto_479854 ?auto_479855 ) ) ( not ( = ?auto_479854 ?auto_479856 ) ) ( not ( = ?auto_479854 ?auto_479857 ) ) ( not ( = ?auto_479854 ?auto_479858 ) ) ( not ( = ?auto_479854 ?auto_479859 ) ) ( not ( = ?auto_479854 ?auto_479860 ) ) ( not ( = ?auto_479854 ?auto_479861 ) ) ( not ( = ?auto_479854 ?auto_479862 ) ) ( not ( = ?auto_479854 ?auto_479863 ) ) ( not ( = ?auto_479854 ?auto_479864 ) ) ( not ( = ?auto_479854 ?auto_479865 ) ) ( not ( = ?auto_479854 ?auto_479866 ) ) ( not ( = ?auto_479855 ?auto_479856 ) ) ( not ( = ?auto_479855 ?auto_479857 ) ) ( not ( = ?auto_479855 ?auto_479858 ) ) ( not ( = ?auto_479855 ?auto_479859 ) ) ( not ( = ?auto_479855 ?auto_479860 ) ) ( not ( = ?auto_479855 ?auto_479861 ) ) ( not ( = ?auto_479855 ?auto_479862 ) ) ( not ( = ?auto_479855 ?auto_479863 ) ) ( not ( = ?auto_479855 ?auto_479864 ) ) ( not ( = ?auto_479855 ?auto_479865 ) ) ( not ( = ?auto_479855 ?auto_479866 ) ) ( not ( = ?auto_479856 ?auto_479857 ) ) ( not ( = ?auto_479856 ?auto_479858 ) ) ( not ( = ?auto_479856 ?auto_479859 ) ) ( not ( = ?auto_479856 ?auto_479860 ) ) ( not ( = ?auto_479856 ?auto_479861 ) ) ( not ( = ?auto_479856 ?auto_479862 ) ) ( not ( = ?auto_479856 ?auto_479863 ) ) ( not ( = ?auto_479856 ?auto_479864 ) ) ( not ( = ?auto_479856 ?auto_479865 ) ) ( not ( = ?auto_479856 ?auto_479866 ) ) ( not ( = ?auto_479857 ?auto_479858 ) ) ( not ( = ?auto_479857 ?auto_479859 ) ) ( not ( = ?auto_479857 ?auto_479860 ) ) ( not ( = ?auto_479857 ?auto_479861 ) ) ( not ( = ?auto_479857 ?auto_479862 ) ) ( not ( = ?auto_479857 ?auto_479863 ) ) ( not ( = ?auto_479857 ?auto_479864 ) ) ( not ( = ?auto_479857 ?auto_479865 ) ) ( not ( = ?auto_479857 ?auto_479866 ) ) ( not ( = ?auto_479858 ?auto_479859 ) ) ( not ( = ?auto_479858 ?auto_479860 ) ) ( not ( = ?auto_479858 ?auto_479861 ) ) ( not ( = ?auto_479858 ?auto_479862 ) ) ( not ( = ?auto_479858 ?auto_479863 ) ) ( not ( = ?auto_479858 ?auto_479864 ) ) ( not ( = ?auto_479858 ?auto_479865 ) ) ( not ( = ?auto_479858 ?auto_479866 ) ) ( not ( = ?auto_479859 ?auto_479860 ) ) ( not ( = ?auto_479859 ?auto_479861 ) ) ( not ( = ?auto_479859 ?auto_479862 ) ) ( not ( = ?auto_479859 ?auto_479863 ) ) ( not ( = ?auto_479859 ?auto_479864 ) ) ( not ( = ?auto_479859 ?auto_479865 ) ) ( not ( = ?auto_479859 ?auto_479866 ) ) ( not ( = ?auto_479860 ?auto_479861 ) ) ( not ( = ?auto_479860 ?auto_479862 ) ) ( not ( = ?auto_479860 ?auto_479863 ) ) ( not ( = ?auto_479860 ?auto_479864 ) ) ( not ( = ?auto_479860 ?auto_479865 ) ) ( not ( = ?auto_479860 ?auto_479866 ) ) ( not ( = ?auto_479861 ?auto_479862 ) ) ( not ( = ?auto_479861 ?auto_479863 ) ) ( not ( = ?auto_479861 ?auto_479864 ) ) ( not ( = ?auto_479861 ?auto_479865 ) ) ( not ( = ?auto_479861 ?auto_479866 ) ) ( not ( = ?auto_479862 ?auto_479863 ) ) ( not ( = ?auto_479862 ?auto_479864 ) ) ( not ( = ?auto_479862 ?auto_479865 ) ) ( not ( = ?auto_479862 ?auto_479866 ) ) ( not ( = ?auto_479863 ?auto_479864 ) ) ( not ( = ?auto_479863 ?auto_479865 ) ) ( not ( = ?auto_479863 ?auto_479866 ) ) ( not ( = ?auto_479864 ?auto_479865 ) ) ( not ( = ?auto_479864 ?auto_479866 ) ) ( not ( = ?auto_479865 ?auto_479866 ) ) ( ON ?auto_479864 ?auto_479865 ) ( ON ?auto_479863 ?auto_479864 ) ( ON ?auto_479862 ?auto_479863 ) ( CLEAR ?auto_479860 ) ( ON ?auto_479861 ?auto_479862 ) ( CLEAR ?auto_479861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_479854 ?auto_479855 ?auto_479856 ?auto_479857 ?auto_479858 ?auto_479859 ?auto_479860 ?auto_479861 )
      ( MAKE-12PILE ?auto_479854 ?auto_479855 ?auto_479856 ?auto_479857 ?auto_479858 ?auto_479859 ?auto_479860 ?auto_479861 ?auto_479862 ?auto_479863 ?auto_479864 ?auto_479865 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_479904 - BLOCK
      ?auto_479905 - BLOCK
      ?auto_479906 - BLOCK
      ?auto_479907 - BLOCK
      ?auto_479908 - BLOCK
      ?auto_479909 - BLOCK
      ?auto_479910 - BLOCK
      ?auto_479911 - BLOCK
      ?auto_479912 - BLOCK
      ?auto_479913 - BLOCK
      ?auto_479914 - BLOCK
      ?auto_479915 - BLOCK
    )
    :vars
    (
      ?auto_479916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479915 ?auto_479916 ) ( ON-TABLE ?auto_479904 ) ( ON ?auto_479905 ?auto_479904 ) ( ON ?auto_479906 ?auto_479905 ) ( ON ?auto_479907 ?auto_479906 ) ( ON ?auto_479908 ?auto_479907 ) ( ON ?auto_479909 ?auto_479908 ) ( not ( = ?auto_479904 ?auto_479905 ) ) ( not ( = ?auto_479904 ?auto_479906 ) ) ( not ( = ?auto_479904 ?auto_479907 ) ) ( not ( = ?auto_479904 ?auto_479908 ) ) ( not ( = ?auto_479904 ?auto_479909 ) ) ( not ( = ?auto_479904 ?auto_479910 ) ) ( not ( = ?auto_479904 ?auto_479911 ) ) ( not ( = ?auto_479904 ?auto_479912 ) ) ( not ( = ?auto_479904 ?auto_479913 ) ) ( not ( = ?auto_479904 ?auto_479914 ) ) ( not ( = ?auto_479904 ?auto_479915 ) ) ( not ( = ?auto_479904 ?auto_479916 ) ) ( not ( = ?auto_479905 ?auto_479906 ) ) ( not ( = ?auto_479905 ?auto_479907 ) ) ( not ( = ?auto_479905 ?auto_479908 ) ) ( not ( = ?auto_479905 ?auto_479909 ) ) ( not ( = ?auto_479905 ?auto_479910 ) ) ( not ( = ?auto_479905 ?auto_479911 ) ) ( not ( = ?auto_479905 ?auto_479912 ) ) ( not ( = ?auto_479905 ?auto_479913 ) ) ( not ( = ?auto_479905 ?auto_479914 ) ) ( not ( = ?auto_479905 ?auto_479915 ) ) ( not ( = ?auto_479905 ?auto_479916 ) ) ( not ( = ?auto_479906 ?auto_479907 ) ) ( not ( = ?auto_479906 ?auto_479908 ) ) ( not ( = ?auto_479906 ?auto_479909 ) ) ( not ( = ?auto_479906 ?auto_479910 ) ) ( not ( = ?auto_479906 ?auto_479911 ) ) ( not ( = ?auto_479906 ?auto_479912 ) ) ( not ( = ?auto_479906 ?auto_479913 ) ) ( not ( = ?auto_479906 ?auto_479914 ) ) ( not ( = ?auto_479906 ?auto_479915 ) ) ( not ( = ?auto_479906 ?auto_479916 ) ) ( not ( = ?auto_479907 ?auto_479908 ) ) ( not ( = ?auto_479907 ?auto_479909 ) ) ( not ( = ?auto_479907 ?auto_479910 ) ) ( not ( = ?auto_479907 ?auto_479911 ) ) ( not ( = ?auto_479907 ?auto_479912 ) ) ( not ( = ?auto_479907 ?auto_479913 ) ) ( not ( = ?auto_479907 ?auto_479914 ) ) ( not ( = ?auto_479907 ?auto_479915 ) ) ( not ( = ?auto_479907 ?auto_479916 ) ) ( not ( = ?auto_479908 ?auto_479909 ) ) ( not ( = ?auto_479908 ?auto_479910 ) ) ( not ( = ?auto_479908 ?auto_479911 ) ) ( not ( = ?auto_479908 ?auto_479912 ) ) ( not ( = ?auto_479908 ?auto_479913 ) ) ( not ( = ?auto_479908 ?auto_479914 ) ) ( not ( = ?auto_479908 ?auto_479915 ) ) ( not ( = ?auto_479908 ?auto_479916 ) ) ( not ( = ?auto_479909 ?auto_479910 ) ) ( not ( = ?auto_479909 ?auto_479911 ) ) ( not ( = ?auto_479909 ?auto_479912 ) ) ( not ( = ?auto_479909 ?auto_479913 ) ) ( not ( = ?auto_479909 ?auto_479914 ) ) ( not ( = ?auto_479909 ?auto_479915 ) ) ( not ( = ?auto_479909 ?auto_479916 ) ) ( not ( = ?auto_479910 ?auto_479911 ) ) ( not ( = ?auto_479910 ?auto_479912 ) ) ( not ( = ?auto_479910 ?auto_479913 ) ) ( not ( = ?auto_479910 ?auto_479914 ) ) ( not ( = ?auto_479910 ?auto_479915 ) ) ( not ( = ?auto_479910 ?auto_479916 ) ) ( not ( = ?auto_479911 ?auto_479912 ) ) ( not ( = ?auto_479911 ?auto_479913 ) ) ( not ( = ?auto_479911 ?auto_479914 ) ) ( not ( = ?auto_479911 ?auto_479915 ) ) ( not ( = ?auto_479911 ?auto_479916 ) ) ( not ( = ?auto_479912 ?auto_479913 ) ) ( not ( = ?auto_479912 ?auto_479914 ) ) ( not ( = ?auto_479912 ?auto_479915 ) ) ( not ( = ?auto_479912 ?auto_479916 ) ) ( not ( = ?auto_479913 ?auto_479914 ) ) ( not ( = ?auto_479913 ?auto_479915 ) ) ( not ( = ?auto_479913 ?auto_479916 ) ) ( not ( = ?auto_479914 ?auto_479915 ) ) ( not ( = ?auto_479914 ?auto_479916 ) ) ( not ( = ?auto_479915 ?auto_479916 ) ) ( ON ?auto_479914 ?auto_479915 ) ( ON ?auto_479913 ?auto_479914 ) ( ON ?auto_479912 ?auto_479913 ) ( ON ?auto_479911 ?auto_479912 ) ( CLEAR ?auto_479909 ) ( ON ?auto_479910 ?auto_479911 ) ( CLEAR ?auto_479910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_479904 ?auto_479905 ?auto_479906 ?auto_479907 ?auto_479908 ?auto_479909 ?auto_479910 )
      ( MAKE-12PILE ?auto_479904 ?auto_479905 ?auto_479906 ?auto_479907 ?auto_479908 ?auto_479909 ?auto_479910 ?auto_479911 ?auto_479912 ?auto_479913 ?auto_479914 ?auto_479915 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_479954 - BLOCK
      ?auto_479955 - BLOCK
      ?auto_479956 - BLOCK
      ?auto_479957 - BLOCK
      ?auto_479958 - BLOCK
      ?auto_479959 - BLOCK
      ?auto_479960 - BLOCK
      ?auto_479961 - BLOCK
      ?auto_479962 - BLOCK
      ?auto_479963 - BLOCK
      ?auto_479964 - BLOCK
      ?auto_479965 - BLOCK
    )
    :vars
    (
      ?auto_479966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_479965 ?auto_479966 ) ( ON-TABLE ?auto_479954 ) ( ON ?auto_479955 ?auto_479954 ) ( ON ?auto_479956 ?auto_479955 ) ( ON ?auto_479957 ?auto_479956 ) ( ON ?auto_479958 ?auto_479957 ) ( not ( = ?auto_479954 ?auto_479955 ) ) ( not ( = ?auto_479954 ?auto_479956 ) ) ( not ( = ?auto_479954 ?auto_479957 ) ) ( not ( = ?auto_479954 ?auto_479958 ) ) ( not ( = ?auto_479954 ?auto_479959 ) ) ( not ( = ?auto_479954 ?auto_479960 ) ) ( not ( = ?auto_479954 ?auto_479961 ) ) ( not ( = ?auto_479954 ?auto_479962 ) ) ( not ( = ?auto_479954 ?auto_479963 ) ) ( not ( = ?auto_479954 ?auto_479964 ) ) ( not ( = ?auto_479954 ?auto_479965 ) ) ( not ( = ?auto_479954 ?auto_479966 ) ) ( not ( = ?auto_479955 ?auto_479956 ) ) ( not ( = ?auto_479955 ?auto_479957 ) ) ( not ( = ?auto_479955 ?auto_479958 ) ) ( not ( = ?auto_479955 ?auto_479959 ) ) ( not ( = ?auto_479955 ?auto_479960 ) ) ( not ( = ?auto_479955 ?auto_479961 ) ) ( not ( = ?auto_479955 ?auto_479962 ) ) ( not ( = ?auto_479955 ?auto_479963 ) ) ( not ( = ?auto_479955 ?auto_479964 ) ) ( not ( = ?auto_479955 ?auto_479965 ) ) ( not ( = ?auto_479955 ?auto_479966 ) ) ( not ( = ?auto_479956 ?auto_479957 ) ) ( not ( = ?auto_479956 ?auto_479958 ) ) ( not ( = ?auto_479956 ?auto_479959 ) ) ( not ( = ?auto_479956 ?auto_479960 ) ) ( not ( = ?auto_479956 ?auto_479961 ) ) ( not ( = ?auto_479956 ?auto_479962 ) ) ( not ( = ?auto_479956 ?auto_479963 ) ) ( not ( = ?auto_479956 ?auto_479964 ) ) ( not ( = ?auto_479956 ?auto_479965 ) ) ( not ( = ?auto_479956 ?auto_479966 ) ) ( not ( = ?auto_479957 ?auto_479958 ) ) ( not ( = ?auto_479957 ?auto_479959 ) ) ( not ( = ?auto_479957 ?auto_479960 ) ) ( not ( = ?auto_479957 ?auto_479961 ) ) ( not ( = ?auto_479957 ?auto_479962 ) ) ( not ( = ?auto_479957 ?auto_479963 ) ) ( not ( = ?auto_479957 ?auto_479964 ) ) ( not ( = ?auto_479957 ?auto_479965 ) ) ( not ( = ?auto_479957 ?auto_479966 ) ) ( not ( = ?auto_479958 ?auto_479959 ) ) ( not ( = ?auto_479958 ?auto_479960 ) ) ( not ( = ?auto_479958 ?auto_479961 ) ) ( not ( = ?auto_479958 ?auto_479962 ) ) ( not ( = ?auto_479958 ?auto_479963 ) ) ( not ( = ?auto_479958 ?auto_479964 ) ) ( not ( = ?auto_479958 ?auto_479965 ) ) ( not ( = ?auto_479958 ?auto_479966 ) ) ( not ( = ?auto_479959 ?auto_479960 ) ) ( not ( = ?auto_479959 ?auto_479961 ) ) ( not ( = ?auto_479959 ?auto_479962 ) ) ( not ( = ?auto_479959 ?auto_479963 ) ) ( not ( = ?auto_479959 ?auto_479964 ) ) ( not ( = ?auto_479959 ?auto_479965 ) ) ( not ( = ?auto_479959 ?auto_479966 ) ) ( not ( = ?auto_479960 ?auto_479961 ) ) ( not ( = ?auto_479960 ?auto_479962 ) ) ( not ( = ?auto_479960 ?auto_479963 ) ) ( not ( = ?auto_479960 ?auto_479964 ) ) ( not ( = ?auto_479960 ?auto_479965 ) ) ( not ( = ?auto_479960 ?auto_479966 ) ) ( not ( = ?auto_479961 ?auto_479962 ) ) ( not ( = ?auto_479961 ?auto_479963 ) ) ( not ( = ?auto_479961 ?auto_479964 ) ) ( not ( = ?auto_479961 ?auto_479965 ) ) ( not ( = ?auto_479961 ?auto_479966 ) ) ( not ( = ?auto_479962 ?auto_479963 ) ) ( not ( = ?auto_479962 ?auto_479964 ) ) ( not ( = ?auto_479962 ?auto_479965 ) ) ( not ( = ?auto_479962 ?auto_479966 ) ) ( not ( = ?auto_479963 ?auto_479964 ) ) ( not ( = ?auto_479963 ?auto_479965 ) ) ( not ( = ?auto_479963 ?auto_479966 ) ) ( not ( = ?auto_479964 ?auto_479965 ) ) ( not ( = ?auto_479964 ?auto_479966 ) ) ( not ( = ?auto_479965 ?auto_479966 ) ) ( ON ?auto_479964 ?auto_479965 ) ( ON ?auto_479963 ?auto_479964 ) ( ON ?auto_479962 ?auto_479963 ) ( ON ?auto_479961 ?auto_479962 ) ( ON ?auto_479960 ?auto_479961 ) ( CLEAR ?auto_479958 ) ( ON ?auto_479959 ?auto_479960 ) ( CLEAR ?auto_479959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_479954 ?auto_479955 ?auto_479956 ?auto_479957 ?auto_479958 ?auto_479959 )
      ( MAKE-12PILE ?auto_479954 ?auto_479955 ?auto_479956 ?auto_479957 ?auto_479958 ?auto_479959 ?auto_479960 ?auto_479961 ?auto_479962 ?auto_479963 ?auto_479964 ?auto_479965 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_480004 - BLOCK
      ?auto_480005 - BLOCK
      ?auto_480006 - BLOCK
      ?auto_480007 - BLOCK
      ?auto_480008 - BLOCK
      ?auto_480009 - BLOCK
      ?auto_480010 - BLOCK
      ?auto_480011 - BLOCK
      ?auto_480012 - BLOCK
      ?auto_480013 - BLOCK
      ?auto_480014 - BLOCK
      ?auto_480015 - BLOCK
    )
    :vars
    (
      ?auto_480016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_480015 ?auto_480016 ) ( ON-TABLE ?auto_480004 ) ( ON ?auto_480005 ?auto_480004 ) ( ON ?auto_480006 ?auto_480005 ) ( ON ?auto_480007 ?auto_480006 ) ( not ( = ?auto_480004 ?auto_480005 ) ) ( not ( = ?auto_480004 ?auto_480006 ) ) ( not ( = ?auto_480004 ?auto_480007 ) ) ( not ( = ?auto_480004 ?auto_480008 ) ) ( not ( = ?auto_480004 ?auto_480009 ) ) ( not ( = ?auto_480004 ?auto_480010 ) ) ( not ( = ?auto_480004 ?auto_480011 ) ) ( not ( = ?auto_480004 ?auto_480012 ) ) ( not ( = ?auto_480004 ?auto_480013 ) ) ( not ( = ?auto_480004 ?auto_480014 ) ) ( not ( = ?auto_480004 ?auto_480015 ) ) ( not ( = ?auto_480004 ?auto_480016 ) ) ( not ( = ?auto_480005 ?auto_480006 ) ) ( not ( = ?auto_480005 ?auto_480007 ) ) ( not ( = ?auto_480005 ?auto_480008 ) ) ( not ( = ?auto_480005 ?auto_480009 ) ) ( not ( = ?auto_480005 ?auto_480010 ) ) ( not ( = ?auto_480005 ?auto_480011 ) ) ( not ( = ?auto_480005 ?auto_480012 ) ) ( not ( = ?auto_480005 ?auto_480013 ) ) ( not ( = ?auto_480005 ?auto_480014 ) ) ( not ( = ?auto_480005 ?auto_480015 ) ) ( not ( = ?auto_480005 ?auto_480016 ) ) ( not ( = ?auto_480006 ?auto_480007 ) ) ( not ( = ?auto_480006 ?auto_480008 ) ) ( not ( = ?auto_480006 ?auto_480009 ) ) ( not ( = ?auto_480006 ?auto_480010 ) ) ( not ( = ?auto_480006 ?auto_480011 ) ) ( not ( = ?auto_480006 ?auto_480012 ) ) ( not ( = ?auto_480006 ?auto_480013 ) ) ( not ( = ?auto_480006 ?auto_480014 ) ) ( not ( = ?auto_480006 ?auto_480015 ) ) ( not ( = ?auto_480006 ?auto_480016 ) ) ( not ( = ?auto_480007 ?auto_480008 ) ) ( not ( = ?auto_480007 ?auto_480009 ) ) ( not ( = ?auto_480007 ?auto_480010 ) ) ( not ( = ?auto_480007 ?auto_480011 ) ) ( not ( = ?auto_480007 ?auto_480012 ) ) ( not ( = ?auto_480007 ?auto_480013 ) ) ( not ( = ?auto_480007 ?auto_480014 ) ) ( not ( = ?auto_480007 ?auto_480015 ) ) ( not ( = ?auto_480007 ?auto_480016 ) ) ( not ( = ?auto_480008 ?auto_480009 ) ) ( not ( = ?auto_480008 ?auto_480010 ) ) ( not ( = ?auto_480008 ?auto_480011 ) ) ( not ( = ?auto_480008 ?auto_480012 ) ) ( not ( = ?auto_480008 ?auto_480013 ) ) ( not ( = ?auto_480008 ?auto_480014 ) ) ( not ( = ?auto_480008 ?auto_480015 ) ) ( not ( = ?auto_480008 ?auto_480016 ) ) ( not ( = ?auto_480009 ?auto_480010 ) ) ( not ( = ?auto_480009 ?auto_480011 ) ) ( not ( = ?auto_480009 ?auto_480012 ) ) ( not ( = ?auto_480009 ?auto_480013 ) ) ( not ( = ?auto_480009 ?auto_480014 ) ) ( not ( = ?auto_480009 ?auto_480015 ) ) ( not ( = ?auto_480009 ?auto_480016 ) ) ( not ( = ?auto_480010 ?auto_480011 ) ) ( not ( = ?auto_480010 ?auto_480012 ) ) ( not ( = ?auto_480010 ?auto_480013 ) ) ( not ( = ?auto_480010 ?auto_480014 ) ) ( not ( = ?auto_480010 ?auto_480015 ) ) ( not ( = ?auto_480010 ?auto_480016 ) ) ( not ( = ?auto_480011 ?auto_480012 ) ) ( not ( = ?auto_480011 ?auto_480013 ) ) ( not ( = ?auto_480011 ?auto_480014 ) ) ( not ( = ?auto_480011 ?auto_480015 ) ) ( not ( = ?auto_480011 ?auto_480016 ) ) ( not ( = ?auto_480012 ?auto_480013 ) ) ( not ( = ?auto_480012 ?auto_480014 ) ) ( not ( = ?auto_480012 ?auto_480015 ) ) ( not ( = ?auto_480012 ?auto_480016 ) ) ( not ( = ?auto_480013 ?auto_480014 ) ) ( not ( = ?auto_480013 ?auto_480015 ) ) ( not ( = ?auto_480013 ?auto_480016 ) ) ( not ( = ?auto_480014 ?auto_480015 ) ) ( not ( = ?auto_480014 ?auto_480016 ) ) ( not ( = ?auto_480015 ?auto_480016 ) ) ( ON ?auto_480014 ?auto_480015 ) ( ON ?auto_480013 ?auto_480014 ) ( ON ?auto_480012 ?auto_480013 ) ( ON ?auto_480011 ?auto_480012 ) ( ON ?auto_480010 ?auto_480011 ) ( ON ?auto_480009 ?auto_480010 ) ( CLEAR ?auto_480007 ) ( ON ?auto_480008 ?auto_480009 ) ( CLEAR ?auto_480008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_480004 ?auto_480005 ?auto_480006 ?auto_480007 ?auto_480008 )
      ( MAKE-12PILE ?auto_480004 ?auto_480005 ?auto_480006 ?auto_480007 ?auto_480008 ?auto_480009 ?auto_480010 ?auto_480011 ?auto_480012 ?auto_480013 ?auto_480014 ?auto_480015 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_480054 - BLOCK
      ?auto_480055 - BLOCK
      ?auto_480056 - BLOCK
      ?auto_480057 - BLOCK
      ?auto_480058 - BLOCK
      ?auto_480059 - BLOCK
      ?auto_480060 - BLOCK
      ?auto_480061 - BLOCK
      ?auto_480062 - BLOCK
      ?auto_480063 - BLOCK
      ?auto_480064 - BLOCK
      ?auto_480065 - BLOCK
    )
    :vars
    (
      ?auto_480066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_480065 ?auto_480066 ) ( ON-TABLE ?auto_480054 ) ( ON ?auto_480055 ?auto_480054 ) ( ON ?auto_480056 ?auto_480055 ) ( not ( = ?auto_480054 ?auto_480055 ) ) ( not ( = ?auto_480054 ?auto_480056 ) ) ( not ( = ?auto_480054 ?auto_480057 ) ) ( not ( = ?auto_480054 ?auto_480058 ) ) ( not ( = ?auto_480054 ?auto_480059 ) ) ( not ( = ?auto_480054 ?auto_480060 ) ) ( not ( = ?auto_480054 ?auto_480061 ) ) ( not ( = ?auto_480054 ?auto_480062 ) ) ( not ( = ?auto_480054 ?auto_480063 ) ) ( not ( = ?auto_480054 ?auto_480064 ) ) ( not ( = ?auto_480054 ?auto_480065 ) ) ( not ( = ?auto_480054 ?auto_480066 ) ) ( not ( = ?auto_480055 ?auto_480056 ) ) ( not ( = ?auto_480055 ?auto_480057 ) ) ( not ( = ?auto_480055 ?auto_480058 ) ) ( not ( = ?auto_480055 ?auto_480059 ) ) ( not ( = ?auto_480055 ?auto_480060 ) ) ( not ( = ?auto_480055 ?auto_480061 ) ) ( not ( = ?auto_480055 ?auto_480062 ) ) ( not ( = ?auto_480055 ?auto_480063 ) ) ( not ( = ?auto_480055 ?auto_480064 ) ) ( not ( = ?auto_480055 ?auto_480065 ) ) ( not ( = ?auto_480055 ?auto_480066 ) ) ( not ( = ?auto_480056 ?auto_480057 ) ) ( not ( = ?auto_480056 ?auto_480058 ) ) ( not ( = ?auto_480056 ?auto_480059 ) ) ( not ( = ?auto_480056 ?auto_480060 ) ) ( not ( = ?auto_480056 ?auto_480061 ) ) ( not ( = ?auto_480056 ?auto_480062 ) ) ( not ( = ?auto_480056 ?auto_480063 ) ) ( not ( = ?auto_480056 ?auto_480064 ) ) ( not ( = ?auto_480056 ?auto_480065 ) ) ( not ( = ?auto_480056 ?auto_480066 ) ) ( not ( = ?auto_480057 ?auto_480058 ) ) ( not ( = ?auto_480057 ?auto_480059 ) ) ( not ( = ?auto_480057 ?auto_480060 ) ) ( not ( = ?auto_480057 ?auto_480061 ) ) ( not ( = ?auto_480057 ?auto_480062 ) ) ( not ( = ?auto_480057 ?auto_480063 ) ) ( not ( = ?auto_480057 ?auto_480064 ) ) ( not ( = ?auto_480057 ?auto_480065 ) ) ( not ( = ?auto_480057 ?auto_480066 ) ) ( not ( = ?auto_480058 ?auto_480059 ) ) ( not ( = ?auto_480058 ?auto_480060 ) ) ( not ( = ?auto_480058 ?auto_480061 ) ) ( not ( = ?auto_480058 ?auto_480062 ) ) ( not ( = ?auto_480058 ?auto_480063 ) ) ( not ( = ?auto_480058 ?auto_480064 ) ) ( not ( = ?auto_480058 ?auto_480065 ) ) ( not ( = ?auto_480058 ?auto_480066 ) ) ( not ( = ?auto_480059 ?auto_480060 ) ) ( not ( = ?auto_480059 ?auto_480061 ) ) ( not ( = ?auto_480059 ?auto_480062 ) ) ( not ( = ?auto_480059 ?auto_480063 ) ) ( not ( = ?auto_480059 ?auto_480064 ) ) ( not ( = ?auto_480059 ?auto_480065 ) ) ( not ( = ?auto_480059 ?auto_480066 ) ) ( not ( = ?auto_480060 ?auto_480061 ) ) ( not ( = ?auto_480060 ?auto_480062 ) ) ( not ( = ?auto_480060 ?auto_480063 ) ) ( not ( = ?auto_480060 ?auto_480064 ) ) ( not ( = ?auto_480060 ?auto_480065 ) ) ( not ( = ?auto_480060 ?auto_480066 ) ) ( not ( = ?auto_480061 ?auto_480062 ) ) ( not ( = ?auto_480061 ?auto_480063 ) ) ( not ( = ?auto_480061 ?auto_480064 ) ) ( not ( = ?auto_480061 ?auto_480065 ) ) ( not ( = ?auto_480061 ?auto_480066 ) ) ( not ( = ?auto_480062 ?auto_480063 ) ) ( not ( = ?auto_480062 ?auto_480064 ) ) ( not ( = ?auto_480062 ?auto_480065 ) ) ( not ( = ?auto_480062 ?auto_480066 ) ) ( not ( = ?auto_480063 ?auto_480064 ) ) ( not ( = ?auto_480063 ?auto_480065 ) ) ( not ( = ?auto_480063 ?auto_480066 ) ) ( not ( = ?auto_480064 ?auto_480065 ) ) ( not ( = ?auto_480064 ?auto_480066 ) ) ( not ( = ?auto_480065 ?auto_480066 ) ) ( ON ?auto_480064 ?auto_480065 ) ( ON ?auto_480063 ?auto_480064 ) ( ON ?auto_480062 ?auto_480063 ) ( ON ?auto_480061 ?auto_480062 ) ( ON ?auto_480060 ?auto_480061 ) ( ON ?auto_480059 ?auto_480060 ) ( ON ?auto_480058 ?auto_480059 ) ( CLEAR ?auto_480056 ) ( ON ?auto_480057 ?auto_480058 ) ( CLEAR ?auto_480057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_480054 ?auto_480055 ?auto_480056 ?auto_480057 )
      ( MAKE-12PILE ?auto_480054 ?auto_480055 ?auto_480056 ?auto_480057 ?auto_480058 ?auto_480059 ?auto_480060 ?auto_480061 ?auto_480062 ?auto_480063 ?auto_480064 ?auto_480065 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_480104 - BLOCK
      ?auto_480105 - BLOCK
      ?auto_480106 - BLOCK
      ?auto_480107 - BLOCK
      ?auto_480108 - BLOCK
      ?auto_480109 - BLOCK
      ?auto_480110 - BLOCK
      ?auto_480111 - BLOCK
      ?auto_480112 - BLOCK
      ?auto_480113 - BLOCK
      ?auto_480114 - BLOCK
      ?auto_480115 - BLOCK
    )
    :vars
    (
      ?auto_480116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_480115 ?auto_480116 ) ( ON-TABLE ?auto_480104 ) ( ON ?auto_480105 ?auto_480104 ) ( not ( = ?auto_480104 ?auto_480105 ) ) ( not ( = ?auto_480104 ?auto_480106 ) ) ( not ( = ?auto_480104 ?auto_480107 ) ) ( not ( = ?auto_480104 ?auto_480108 ) ) ( not ( = ?auto_480104 ?auto_480109 ) ) ( not ( = ?auto_480104 ?auto_480110 ) ) ( not ( = ?auto_480104 ?auto_480111 ) ) ( not ( = ?auto_480104 ?auto_480112 ) ) ( not ( = ?auto_480104 ?auto_480113 ) ) ( not ( = ?auto_480104 ?auto_480114 ) ) ( not ( = ?auto_480104 ?auto_480115 ) ) ( not ( = ?auto_480104 ?auto_480116 ) ) ( not ( = ?auto_480105 ?auto_480106 ) ) ( not ( = ?auto_480105 ?auto_480107 ) ) ( not ( = ?auto_480105 ?auto_480108 ) ) ( not ( = ?auto_480105 ?auto_480109 ) ) ( not ( = ?auto_480105 ?auto_480110 ) ) ( not ( = ?auto_480105 ?auto_480111 ) ) ( not ( = ?auto_480105 ?auto_480112 ) ) ( not ( = ?auto_480105 ?auto_480113 ) ) ( not ( = ?auto_480105 ?auto_480114 ) ) ( not ( = ?auto_480105 ?auto_480115 ) ) ( not ( = ?auto_480105 ?auto_480116 ) ) ( not ( = ?auto_480106 ?auto_480107 ) ) ( not ( = ?auto_480106 ?auto_480108 ) ) ( not ( = ?auto_480106 ?auto_480109 ) ) ( not ( = ?auto_480106 ?auto_480110 ) ) ( not ( = ?auto_480106 ?auto_480111 ) ) ( not ( = ?auto_480106 ?auto_480112 ) ) ( not ( = ?auto_480106 ?auto_480113 ) ) ( not ( = ?auto_480106 ?auto_480114 ) ) ( not ( = ?auto_480106 ?auto_480115 ) ) ( not ( = ?auto_480106 ?auto_480116 ) ) ( not ( = ?auto_480107 ?auto_480108 ) ) ( not ( = ?auto_480107 ?auto_480109 ) ) ( not ( = ?auto_480107 ?auto_480110 ) ) ( not ( = ?auto_480107 ?auto_480111 ) ) ( not ( = ?auto_480107 ?auto_480112 ) ) ( not ( = ?auto_480107 ?auto_480113 ) ) ( not ( = ?auto_480107 ?auto_480114 ) ) ( not ( = ?auto_480107 ?auto_480115 ) ) ( not ( = ?auto_480107 ?auto_480116 ) ) ( not ( = ?auto_480108 ?auto_480109 ) ) ( not ( = ?auto_480108 ?auto_480110 ) ) ( not ( = ?auto_480108 ?auto_480111 ) ) ( not ( = ?auto_480108 ?auto_480112 ) ) ( not ( = ?auto_480108 ?auto_480113 ) ) ( not ( = ?auto_480108 ?auto_480114 ) ) ( not ( = ?auto_480108 ?auto_480115 ) ) ( not ( = ?auto_480108 ?auto_480116 ) ) ( not ( = ?auto_480109 ?auto_480110 ) ) ( not ( = ?auto_480109 ?auto_480111 ) ) ( not ( = ?auto_480109 ?auto_480112 ) ) ( not ( = ?auto_480109 ?auto_480113 ) ) ( not ( = ?auto_480109 ?auto_480114 ) ) ( not ( = ?auto_480109 ?auto_480115 ) ) ( not ( = ?auto_480109 ?auto_480116 ) ) ( not ( = ?auto_480110 ?auto_480111 ) ) ( not ( = ?auto_480110 ?auto_480112 ) ) ( not ( = ?auto_480110 ?auto_480113 ) ) ( not ( = ?auto_480110 ?auto_480114 ) ) ( not ( = ?auto_480110 ?auto_480115 ) ) ( not ( = ?auto_480110 ?auto_480116 ) ) ( not ( = ?auto_480111 ?auto_480112 ) ) ( not ( = ?auto_480111 ?auto_480113 ) ) ( not ( = ?auto_480111 ?auto_480114 ) ) ( not ( = ?auto_480111 ?auto_480115 ) ) ( not ( = ?auto_480111 ?auto_480116 ) ) ( not ( = ?auto_480112 ?auto_480113 ) ) ( not ( = ?auto_480112 ?auto_480114 ) ) ( not ( = ?auto_480112 ?auto_480115 ) ) ( not ( = ?auto_480112 ?auto_480116 ) ) ( not ( = ?auto_480113 ?auto_480114 ) ) ( not ( = ?auto_480113 ?auto_480115 ) ) ( not ( = ?auto_480113 ?auto_480116 ) ) ( not ( = ?auto_480114 ?auto_480115 ) ) ( not ( = ?auto_480114 ?auto_480116 ) ) ( not ( = ?auto_480115 ?auto_480116 ) ) ( ON ?auto_480114 ?auto_480115 ) ( ON ?auto_480113 ?auto_480114 ) ( ON ?auto_480112 ?auto_480113 ) ( ON ?auto_480111 ?auto_480112 ) ( ON ?auto_480110 ?auto_480111 ) ( ON ?auto_480109 ?auto_480110 ) ( ON ?auto_480108 ?auto_480109 ) ( ON ?auto_480107 ?auto_480108 ) ( CLEAR ?auto_480105 ) ( ON ?auto_480106 ?auto_480107 ) ( CLEAR ?auto_480106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_480104 ?auto_480105 ?auto_480106 )
      ( MAKE-12PILE ?auto_480104 ?auto_480105 ?auto_480106 ?auto_480107 ?auto_480108 ?auto_480109 ?auto_480110 ?auto_480111 ?auto_480112 ?auto_480113 ?auto_480114 ?auto_480115 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_480154 - BLOCK
      ?auto_480155 - BLOCK
      ?auto_480156 - BLOCK
      ?auto_480157 - BLOCK
      ?auto_480158 - BLOCK
      ?auto_480159 - BLOCK
      ?auto_480160 - BLOCK
      ?auto_480161 - BLOCK
      ?auto_480162 - BLOCK
      ?auto_480163 - BLOCK
      ?auto_480164 - BLOCK
      ?auto_480165 - BLOCK
    )
    :vars
    (
      ?auto_480166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_480165 ?auto_480166 ) ( ON-TABLE ?auto_480154 ) ( not ( = ?auto_480154 ?auto_480155 ) ) ( not ( = ?auto_480154 ?auto_480156 ) ) ( not ( = ?auto_480154 ?auto_480157 ) ) ( not ( = ?auto_480154 ?auto_480158 ) ) ( not ( = ?auto_480154 ?auto_480159 ) ) ( not ( = ?auto_480154 ?auto_480160 ) ) ( not ( = ?auto_480154 ?auto_480161 ) ) ( not ( = ?auto_480154 ?auto_480162 ) ) ( not ( = ?auto_480154 ?auto_480163 ) ) ( not ( = ?auto_480154 ?auto_480164 ) ) ( not ( = ?auto_480154 ?auto_480165 ) ) ( not ( = ?auto_480154 ?auto_480166 ) ) ( not ( = ?auto_480155 ?auto_480156 ) ) ( not ( = ?auto_480155 ?auto_480157 ) ) ( not ( = ?auto_480155 ?auto_480158 ) ) ( not ( = ?auto_480155 ?auto_480159 ) ) ( not ( = ?auto_480155 ?auto_480160 ) ) ( not ( = ?auto_480155 ?auto_480161 ) ) ( not ( = ?auto_480155 ?auto_480162 ) ) ( not ( = ?auto_480155 ?auto_480163 ) ) ( not ( = ?auto_480155 ?auto_480164 ) ) ( not ( = ?auto_480155 ?auto_480165 ) ) ( not ( = ?auto_480155 ?auto_480166 ) ) ( not ( = ?auto_480156 ?auto_480157 ) ) ( not ( = ?auto_480156 ?auto_480158 ) ) ( not ( = ?auto_480156 ?auto_480159 ) ) ( not ( = ?auto_480156 ?auto_480160 ) ) ( not ( = ?auto_480156 ?auto_480161 ) ) ( not ( = ?auto_480156 ?auto_480162 ) ) ( not ( = ?auto_480156 ?auto_480163 ) ) ( not ( = ?auto_480156 ?auto_480164 ) ) ( not ( = ?auto_480156 ?auto_480165 ) ) ( not ( = ?auto_480156 ?auto_480166 ) ) ( not ( = ?auto_480157 ?auto_480158 ) ) ( not ( = ?auto_480157 ?auto_480159 ) ) ( not ( = ?auto_480157 ?auto_480160 ) ) ( not ( = ?auto_480157 ?auto_480161 ) ) ( not ( = ?auto_480157 ?auto_480162 ) ) ( not ( = ?auto_480157 ?auto_480163 ) ) ( not ( = ?auto_480157 ?auto_480164 ) ) ( not ( = ?auto_480157 ?auto_480165 ) ) ( not ( = ?auto_480157 ?auto_480166 ) ) ( not ( = ?auto_480158 ?auto_480159 ) ) ( not ( = ?auto_480158 ?auto_480160 ) ) ( not ( = ?auto_480158 ?auto_480161 ) ) ( not ( = ?auto_480158 ?auto_480162 ) ) ( not ( = ?auto_480158 ?auto_480163 ) ) ( not ( = ?auto_480158 ?auto_480164 ) ) ( not ( = ?auto_480158 ?auto_480165 ) ) ( not ( = ?auto_480158 ?auto_480166 ) ) ( not ( = ?auto_480159 ?auto_480160 ) ) ( not ( = ?auto_480159 ?auto_480161 ) ) ( not ( = ?auto_480159 ?auto_480162 ) ) ( not ( = ?auto_480159 ?auto_480163 ) ) ( not ( = ?auto_480159 ?auto_480164 ) ) ( not ( = ?auto_480159 ?auto_480165 ) ) ( not ( = ?auto_480159 ?auto_480166 ) ) ( not ( = ?auto_480160 ?auto_480161 ) ) ( not ( = ?auto_480160 ?auto_480162 ) ) ( not ( = ?auto_480160 ?auto_480163 ) ) ( not ( = ?auto_480160 ?auto_480164 ) ) ( not ( = ?auto_480160 ?auto_480165 ) ) ( not ( = ?auto_480160 ?auto_480166 ) ) ( not ( = ?auto_480161 ?auto_480162 ) ) ( not ( = ?auto_480161 ?auto_480163 ) ) ( not ( = ?auto_480161 ?auto_480164 ) ) ( not ( = ?auto_480161 ?auto_480165 ) ) ( not ( = ?auto_480161 ?auto_480166 ) ) ( not ( = ?auto_480162 ?auto_480163 ) ) ( not ( = ?auto_480162 ?auto_480164 ) ) ( not ( = ?auto_480162 ?auto_480165 ) ) ( not ( = ?auto_480162 ?auto_480166 ) ) ( not ( = ?auto_480163 ?auto_480164 ) ) ( not ( = ?auto_480163 ?auto_480165 ) ) ( not ( = ?auto_480163 ?auto_480166 ) ) ( not ( = ?auto_480164 ?auto_480165 ) ) ( not ( = ?auto_480164 ?auto_480166 ) ) ( not ( = ?auto_480165 ?auto_480166 ) ) ( ON ?auto_480164 ?auto_480165 ) ( ON ?auto_480163 ?auto_480164 ) ( ON ?auto_480162 ?auto_480163 ) ( ON ?auto_480161 ?auto_480162 ) ( ON ?auto_480160 ?auto_480161 ) ( ON ?auto_480159 ?auto_480160 ) ( ON ?auto_480158 ?auto_480159 ) ( ON ?auto_480157 ?auto_480158 ) ( ON ?auto_480156 ?auto_480157 ) ( CLEAR ?auto_480154 ) ( ON ?auto_480155 ?auto_480156 ) ( CLEAR ?auto_480155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_480154 ?auto_480155 )
      ( MAKE-12PILE ?auto_480154 ?auto_480155 ?auto_480156 ?auto_480157 ?auto_480158 ?auto_480159 ?auto_480160 ?auto_480161 ?auto_480162 ?auto_480163 ?auto_480164 ?auto_480165 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_480204 - BLOCK
      ?auto_480205 - BLOCK
      ?auto_480206 - BLOCK
      ?auto_480207 - BLOCK
      ?auto_480208 - BLOCK
      ?auto_480209 - BLOCK
      ?auto_480210 - BLOCK
      ?auto_480211 - BLOCK
      ?auto_480212 - BLOCK
      ?auto_480213 - BLOCK
      ?auto_480214 - BLOCK
      ?auto_480215 - BLOCK
    )
    :vars
    (
      ?auto_480216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_480215 ?auto_480216 ) ( not ( = ?auto_480204 ?auto_480205 ) ) ( not ( = ?auto_480204 ?auto_480206 ) ) ( not ( = ?auto_480204 ?auto_480207 ) ) ( not ( = ?auto_480204 ?auto_480208 ) ) ( not ( = ?auto_480204 ?auto_480209 ) ) ( not ( = ?auto_480204 ?auto_480210 ) ) ( not ( = ?auto_480204 ?auto_480211 ) ) ( not ( = ?auto_480204 ?auto_480212 ) ) ( not ( = ?auto_480204 ?auto_480213 ) ) ( not ( = ?auto_480204 ?auto_480214 ) ) ( not ( = ?auto_480204 ?auto_480215 ) ) ( not ( = ?auto_480204 ?auto_480216 ) ) ( not ( = ?auto_480205 ?auto_480206 ) ) ( not ( = ?auto_480205 ?auto_480207 ) ) ( not ( = ?auto_480205 ?auto_480208 ) ) ( not ( = ?auto_480205 ?auto_480209 ) ) ( not ( = ?auto_480205 ?auto_480210 ) ) ( not ( = ?auto_480205 ?auto_480211 ) ) ( not ( = ?auto_480205 ?auto_480212 ) ) ( not ( = ?auto_480205 ?auto_480213 ) ) ( not ( = ?auto_480205 ?auto_480214 ) ) ( not ( = ?auto_480205 ?auto_480215 ) ) ( not ( = ?auto_480205 ?auto_480216 ) ) ( not ( = ?auto_480206 ?auto_480207 ) ) ( not ( = ?auto_480206 ?auto_480208 ) ) ( not ( = ?auto_480206 ?auto_480209 ) ) ( not ( = ?auto_480206 ?auto_480210 ) ) ( not ( = ?auto_480206 ?auto_480211 ) ) ( not ( = ?auto_480206 ?auto_480212 ) ) ( not ( = ?auto_480206 ?auto_480213 ) ) ( not ( = ?auto_480206 ?auto_480214 ) ) ( not ( = ?auto_480206 ?auto_480215 ) ) ( not ( = ?auto_480206 ?auto_480216 ) ) ( not ( = ?auto_480207 ?auto_480208 ) ) ( not ( = ?auto_480207 ?auto_480209 ) ) ( not ( = ?auto_480207 ?auto_480210 ) ) ( not ( = ?auto_480207 ?auto_480211 ) ) ( not ( = ?auto_480207 ?auto_480212 ) ) ( not ( = ?auto_480207 ?auto_480213 ) ) ( not ( = ?auto_480207 ?auto_480214 ) ) ( not ( = ?auto_480207 ?auto_480215 ) ) ( not ( = ?auto_480207 ?auto_480216 ) ) ( not ( = ?auto_480208 ?auto_480209 ) ) ( not ( = ?auto_480208 ?auto_480210 ) ) ( not ( = ?auto_480208 ?auto_480211 ) ) ( not ( = ?auto_480208 ?auto_480212 ) ) ( not ( = ?auto_480208 ?auto_480213 ) ) ( not ( = ?auto_480208 ?auto_480214 ) ) ( not ( = ?auto_480208 ?auto_480215 ) ) ( not ( = ?auto_480208 ?auto_480216 ) ) ( not ( = ?auto_480209 ?auto_480210 ) ) ( not ( = ?auto_480209 ?auto_480211 ) ) ( not ( = ?auto_480209 ?auto_480212 ) ) ( not ( = ?auto_480209 ?auto_480213 ) ) ( not ( = ?auto_480209 ?auto_480214 ) ) ( not ( = ?auto_480209 ?auto_480215 ) ) ( not ( = ?auto_480209 ?auto_480216 ) ) ( not ( = ?auto_480210 ?auto_480211 ) ) ( not ( = ?auto_480210 ?auto_480212 ) ) ( not ( = ?auto_480210 ?auto_480213 ) ) ( not ( = ?auto_480210 ?auto_480214 ) ) ( not ( = ?auto_480210 ?auto_480215 ) ) ( not ( = ?auto_480210 ?auto_480216 ) ) ( not ( = ?auto_480211 ?auto_480212 ) ) ( not ( = ?auto_480211 ?auto_480213 ) ) ( not ( = ?auto_480211 ?auto_480214 ) ) ( not ( = ?auto_480211 ?auto_480215 ) ) ( not ( = ?auto_480211 ?auto_480216 ) ) ( not ( = ?auto_480212 ?auto_480213 ) ) ( not ( = ?auto_480212 ?auto_480214 ) ) ( not ( = ?auto_480212 ?auto_480215 ) ) ( not ( = ?auto_480212 ?auto_480216 ) ) ( not ( = ?auto_480213 ?auto_480214 ) ) ( not ( = ?auto_480213 ?auto_480215 ) ) ( not ( = ?auto_480213 ?auto_480216 ) ) ( not ( = ?auto_480214 ?auto_480215 ) ) ( not ( = ?auto_480214 ?auto_480216 ) ) ( not ( = ?auto_480215 ?auto_480216 ) ) ( ON ?auto_480214 ?auto_480215 ) ( ON ?auto_480213 ?auto_480214 ) ( ON ?auto_480212 ?auto_480213 ) ( ON ?auto_480211 ?auto_480212 ) ( ON ?auto_480210 ?auto_480211 ) ( ON ?auto_480209 ?auto_480210 ) ( ON ?auto_480208 ?auto_480209 ) ( ON ?auto_480207 ?auto_480208 ) ( ON ?auto_480206 ?auto_480207 ) ( ON ?auto_480205 ?auto_480206 ) ( ON ?auto_480204 ?auto_480205 ) ( CLEAR ?auto_480204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_480204 )
      ( MAKE-12PILE ?auto_480204 ?auto_480205 ?auto_480206 ?auto_480207 ?auto_480208 ?auto_480209 ?auto_480210 ?auto_480211 ?auto_480212 ?auto_480213 ?auto_480214 ?auto_480215 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_480255 - BLOCK
      ?auto_480256 - BLOCK
      ?auto_480257 - BLOCK
      ?auto_480258 - BLOCK
      ?auto_480259 - BLOCK
      ?auto_480260 - BLOCK
      ?auto_480261 - BLOCK
      ?auto_480262 - BLOCK
      ?auto_480263 - BLOCK
      ?auto_480264 - BLOCK
      ?auto_480265 - BLOCK
      ?auto_480266 - BLOCK
      ?auto_480267 - BLOCK
    )
    :vars
    (
      ?auto_480268 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_480266 ) ( ON ?auto_480267 ?auto_480268 ) ( CLEAR ?auto_480267 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_480255 ) ( ON ?auto_480256 ?auto_480255 ) ( ON ?auto_480257 ?auto_480256 ) ( ON ?auto_480258 ?auto_480257 ) ( ON ?auto_480259 ?auto_480258 ) ( ON ?auto_480260 ?auto_480259 ) ( ON ?auto_480261 ?auto_480260 ) ( ON ?auto_480262 ?auto_480261 ) ( ON ?auto_480263 ?auto_480262 ) ( ON ?auto_480264 ?auto_480263 ) ( ON ?auto_480265 ?auto_480264 ) ( ON ?auto_480266 ?auto_480265 ) ( not ( = ?auto_480255 ?auto_480256 ) ) ( not ( = ?auto_480255 ?auto_480257 ) ) ( not ( = ?auto_480255 ?auto_480258 ) ) ( not ( = ?auto_480255 ?auto_480259 ) ) ( not ( = ?auto_480255 ?auto_480260 ) ) ( not ( = ?auto_480255 ?auto_480261 ) ) ( not ( = ?auto_480255 ?auto_480262 ) ) ( not ( = ?auto_480255 ?auto_480263 ) ) ( not ( = ?auto_480255 ?auto_480264 ) ) ( not ( = ?auto_480255 ?auto_480265 ) ) ( not ( = ?auto_480255 ?auto_480266 ) ) ( not ( = ?auto_480255 ?auto_480267 ) ) ( not ( = ?auto_480255 ?auto_480268 ) ) ( not ( = ?auto_480256 ?auto_480257 ) ) ( not ( = ?auto_480256 ?auto_480258 ) ) ( not ( = ?auto_480256 ?auto_480259 ) ) ( not ( = ?auto_480256 ?auto_480260 ) ) ( not ( = ?auto_480256 ?auto_480261 ) ) ( not ( = ?auto_480256 ?auto_480262 ) ) ( not ( = ?auto_480256 ?auto_480263 ) ) ( not ( = ?auto_480256 ?auto_480264 ) ) ( not ( = ?auto_480256 ?auto_480265 ) ) ( not ( = ?auto_480256 ?auto_480266 ) ) ( not ( = ?auto_480256 ?auto_480267 ) ) ( not ( = ?auto_480256 ?auto_480268 ) ) ( not ( = ?auto_480257 ?auto_480258 ) ) ( not ( = ?auto_480257 ?auto_480259 ) ) ( not ( = ?auto_480257 ?auto_480260 ) ) ( not ( = ?auto_480257 ?auto_480261 ) ) ( not ( = ?auto_480257 ?auto_480262 ) ) ( not ( = ?auto_480257 ?auto_480263 ) ) ( not ( = ?auto_480257 ?auto_480264 ) ) ( not ( = ?auto_480257 ?auto_480265 ) ) ( not ( = ?auto_480257 ?auto_480266 ) ) ( not ( = ?auto_480257 ?auto_480267 ) ) ( not ( = ?auto_480257 ?auto_480268 ) ) ( not ( = ?auto_480258 ?auto_480259 ) ) ( not ( = ?auto_480258 ?auto_480260 ) ) ( not ( = ?auto_480258 ?auto_480261 ) ) ( not ( = ?auto_480258 ?auto_480262 ) ) ( not ( = ?auto_480258 ?auto_480263 ) ) ( not ( = ?auto_480258 ?auto_480264 ) ) ( not ( = ?auto_480258 ?auto_480265 ) ) ( not ( = ?auto_480258 ?auto_480266 ) ) ( not ( = ?auto_480258 ?auto_480267 ) ) ( not ( = ?auto_480258 ?auto_480268 ) ) ( not ( = ?auto_480259 ?auto_480260 ) ) ( not ( = ?auto_480259 ?auto_480261 ) ) ( not ( = ?auto_480259 ?auto_480262 ) ) ( not ( = ?auto_480259 ?auto_480263 ) ) ( not ( = ?auto_480259 ?auto_480264 ) ) ( not ( = ?auto_480259 ?auto_480265 ) ) ( not ( = ?auto_480259 ?auto_480266 ) ) ( not ( = ?auto_480259 ?auto_480267 ) ) ( not ( = ?auto_480259 ?auto_480268 ) ) ( not ( = ?auto_480260 ?auto_480261 ) ) ( not ( = ?auto_480260 ?auto_480262 ) ) ( not ( = ?auto_480260 ?auto_480263 ) ) ( not ( = ?auto_480260 ?auto_480264 ) ) ( not ( = ?auto_480260 ?auto_480265 ) ) ( not ( = ?auto_480260 ?auto_480266 ) ) ( not ( = ?auto_480260 ?auto_480267 ) ) ( not ( = ?auto_480260 ?auto_480268 ) ) ( not ( = ?auto_480261 ?auto_480262 ) ) ( not ( = ?auto_480261 ?auto_480263 ) ) ( not ( = ?auto_480261 ?auto_480264 ) ) ( not ( = ?auto_480261 ?auto_480265 ) ) ( not ( = ?auto_480261 ?auto_480266 ) ) ( not ( = ?auto_480261 ?auto_480267 ) ) ( not ( = ?auto_480261 ?auto_480268 ) ) ( not ( = ?auto_480262 ?auto_480263 ) ) ( not ( = ?auto_480262 ?auto_480264 ) ) ( not ( = ?auto_480262 ?auto_480265 ) ) ( not ( = ?auto_480262 ?auto_480266 ) ) ( not ( = ?auto_480262 ?auto_480267 ) ) ( not ( = ?auto_480262 ?auto_480268 ) ) ( not ( = ?auto_480263 ?auto_480264 ) ) ( not ( = ?auto_480263 ?auto_480265 ) ) ( not ( = ?auto_480263 ?auto_480266 ) ) ( not ( = ?auto_480263 ?auto_480267 ) ) ( not ( = ?auto_480263 ?auto_480268 ) ) ( not ( = ?auto_480264 ?auto_480265 ) ) ( not ( = ?auto_480264 ?auto_480266 ) ) ( not ( = ?auto_480264 ?auto_480267 ) ) ( not ( = ?auto_480264 ?auto_480268 ) ) ( not ( = ?auto_480265 ?auto_480266 ) ) ( not ( = ?auto_480265 ?auto_480267 ) ) ( not ( = ?auto_480265 ?auto_480268 ) ) ( not ( = ?auto_480266 ?auto_480267 ) ) ( not ( = ?auto_480266 ?auto_480268 ) ) ( not ( = ?auto_480267 ?auto_480268 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_480267 ?auto_480268 )
      ( !STACK ?auto_480267 ?auto_480266 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_480309 - BLOCK
      ?auto_480310 - BLOCK
      ?auto_480311 - BLOCK
      ?auto_480312 - BLOCK
      ?auto_480313 - BLOCK
      ?auto_480314 - BLOCK
      ?auto_480315 - BLOCK
      ?auto_480316 - BLOCK
      ?auto_480317 - BLOCK
      ?auto_480318 - BLOCK
      ?auto_480319 - BLOCK
      ?auto_480320 - BLOCK
      ?auto_480321 - BLOCK
    )
    :vars
    (
      ?auto_480322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_480321 ?auto_480322 ) ( ON-TABLE ?auto_480309 ) ( ON ?auto_480310 ?auto_480309 ) ( ON ?auto_480311 ?auto_480310 ) ( ON ?auto_480312 ?auto_480311 ) ( ON ?auto_480313 ?auto_480312 ) ( ON ?auto_480314 ?auto_480313 ) ( ON ?auto_480315 ?auto_480314 ) ( ON ?auto_480316 ?auto_480315 ) ( ON ?auto_480317 ?auto_480316 ) ( ON ?auto_480318 ?auto_480317 ) ( ON ?auto_480319 ?auto_480318 ) ( not ( = ?auto_480309 ?auto_480310 ) ) ( not ( = ?auto_480309 ?auto_480311 ) ) ( not ( = ?auto_480309 ?auto_480312 ) ) ( not ( = ?auto_480309 ?auto_480313 ) ) ( not ( = ?auto_480309 ?auto_480314 ) ) ( not ( = ?auto_480309 ?auto_480315 ) ) ( not ( = ?auto_480309 ?auto_480316 ) ) ( not ( = ?auto_480309 ?auto_480317 ) ) ( not ( = ?auto_480309 ?auto_480318 ) ) ( not ( = ?auto_480309 ?auto_480319 ) ) ( not ( = ?auto_480309 ?auto_480320 ) ) ( not ( = ?auto_480309 ?auto_480321 ) ) ( not ( = ?auto_480309 ?auto_480322 ) ) ( not ( = ?auto_480310 ?auto_480311 ) ) ( not ( = ?auto_480310 ?auto_480312 ) ) ( not ( = ?auto_480310 ?auto_480313 ) ) ( not ( = ?auto_480310 ?auto_480314 ) ) ( not ( = ?auto_480310 ?auto_480315 ) ) ( not ( = ?auto_480310 ?auto_480316 ) ) ( not ( = ?auto_480310 ?auto_480317 ) ) ( not ( = ?auto_480310 ?auto_480318 ) ) ( not ( = ?auto_480310 ?auto_480319 ) ) ( not ( = ?auto_480310 ?auto_480320 ) ) ( not ( = ?auto_480310 ?auto_480321 ) ) ( not ( = ?auto_480310 ?auto_480322 ) ) ( not ( = ?auto_480311 ?auto_480312 ) ) ( not ( = ?auto_480311 ?auto_480313 ) ) ( not ( = ?auto_480311 ?auto_480314 ) ) ( not ( = ?auto_480311 ?auto_480315 ) ) ( not ( = ?auto_480311 ?auto_480316 ) ) ( not ( = ?auto_480311 ?auto_480317 ) ) ( not ( = ?auto_480311 ?auto_480318 ) ) ( not ( = ?auto_480311 ?auto_480319 ) ) ( not ( = ?auto_480311 ?auto_480320 ) ) ( not ( = ?auto_480311 ?auto_480321 ) ) ( not ( = ?auto_480311 ?auto_480322 ) ) ( not ( = ?auto_480312 ?auto_480313 ) ) ( not ( = ?auto_480312 ?auto_480314 ) ) ( not ( = ?auto_480312 ?auto_480315 ) ) ( not ( = ?auto_480312 ?auto_480316 ) ) ( not ( = ?auto_480312 ?auto_480317 ) ) ( not ( = ?auto_480312 ?auto_480318 ) ) ( not ( = ?auto_480312 ?auto_480319 ) ) ( not ( = ?auto_480312 ?auto_480320 ) ) ( not ( = ?auto_480312 ?auto_480321 ) ) ( not ( = ?auto_480312 ?auto_480322 ) ) ( not ( = ?auto_480313 ?auto_480314 ) ) ( not ( = ?auto_480313 ?auto_480315 ) ) ( not ( = ?auto_480313 ?auto_480316 ) ) ( not ( = ?auto_480313 ?auto_480317 ) ) ( not ( = ?auto_480313 ?auto_480318 ) ) ( not ( = ?auto_480313 ?auto_480319 ) ) ( not ( = ?auto_480313 ?auto_480320 ) ) ( not ( = ?auto_480313 ?auto_480321 ) ) ( not ( = ?auto_480313 ?auto_480322 ) ) ( not ( = ?auto_480314 ?auto_480315 ) ) ( not ( = ?auto_480314 ?auto_480316 ) ) ( not ( = ?auto_480314 ?auto_480317 ) ) ( not ( = ?auto_480314 ?auto_480318 ) ) ( not ( = ?auto_480314 ?auto_480319 ) ) ( not ( = ?auto_480314 ?auto_480320 ) ) ( not ( = ?auto_480314 ?auto_480321 ) ) ( not ( = ?auto_480314 ?auto_480322 ) ) ( not ( = ?auto_480315 ?auto_480316 ) ) ( not ( = ?auto_480315 ?auto_480317 ) ) ( not ( = ?auto_480315 ?auto_480318 ) ) ( not ( = ?auto_480315 ?auto_480319 ) ) ( not ( = ?auto_480315 ?auto_480320 ) ) ( not ( = ?auto_480315 ?auto_480321 ) ) ( not ( = ?auto_480315 ?auto_480322 ) ) ( not ( = ?auto_480316 ?auto_480317 ) ) ( not ( = ?auto_480316 ?auto_480318 ) ) ( not ( = ?auto_480316 ?auto_480319 ) ) ( not ( = ?auto_480316 ?auto_480320 ) ) ( not ( = ?auto_480316 ?auto_480321 ) ) ( not ( = ?auto_480316 ?auto_480322 ) ) ( not ( = ?auto_480317 ?auto_480318 ) ) ( not ( = ?auto_480317 ?auto_480319 ) ) ( not ( = ?auto_480317 ?auto_480320 ) ) ( not ( = ?auto_480317 ?auto_480321 ) ) ( not ( = ?auto_480317 ?auto_480322 ) ) ( not ( = ?auto_480318 ?auto_480319 ) ) ( not ( = ?auto_480318 ?auto_480320 ) ) ( not ( = ?auto_480318 ?auto_480321 ) ) ( not ( = ?auto_480318 ?auto_480322 ) ) ( not ( = ?auto_480319 ?auto_480320 ) ) ( not ( = ?auto_480319 ?auto_480321 ) ) ( not ( = ?auto_480319 ?auto_480322 ) ) ( not ( = ?auto_480320 ?auto_480321 ) ) ( not ( = ?auto_480320 ?auto_480322 ) ) ( not ( = ?auto_480321 ?auto_480322 ) ) ( CLEAR ?auto_480319 ) ( ON ?auto_480320 ?auto_480321 ) ( CLEAR ?auto_480320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_480309 ?auto_480310 ?auto_480311 ?auto_480312 ?auto_480313 ?auto_480314 ?auto_480315 ?auto_480316 ?auto_480317 ?auto_480318 ?auto_480319 ?auto_480320 )
      ( MAKE-13PILE ?auto_480309 ?auto_480310 ?auto_480311 ?auto_480312 ?auto_480313 ?auto_480314 ?auto_480315 ?auto_480316 ?auto_480317 ?auto_480318 ?auto_480319 ?auto_480320 ?auto_480321 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_480363 - BLOCK
      ?auto_480364 - BLOCK
      ?auto_480365 - BLOCK
      ?auto_480366 - BLOCK
      ?auto_480367 - BLOCK
      ?auto_480368 - BLOCK
      ?auto_480369 - BLOCK
      ?auto_480370 - BLOCK
      ?auto_480371 - BLOCK
      ?auto_480372 - BLOCK
      ?auto_480373 - BLOCK
      ?auto_480374 - BLOCK
      ?auto_480375 - BLOCK
    )
    :vars
    (
      ?auto_480376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_480375 ?auto_480376 ) ( ON-TABLE ?auto_480363 ) ( ON ?auto_480364 ?auto_480363 ) ( ON ?auto_480365 ?auto_480364 ) ( ON ?auto_480366 ?auto_480365 ) ( ON ?auto_480367 ?auto_480366 ) ( ON ?auto_480368 ?auto_480367 ) ( ON ?auto_480369 ?auto_480368 ) ( ON ?auto_480370 ?auto_480369 ) ( ON ?auto_480371 ?auto_480370 ) ( ON ?auto_480372 ?auto_480371 ) ( not ( = ?auto_480363 ?auto_480364 ) ) ( not ( = ?auto_480363 ?auto_480365 ) ) ( not ( = ?auto_480363 ?auto_480366 ) ) ( not ( = ?auto_480363 ?auto_480367 ) ) ( not ( = ?auto_480363 ?auto_480368 ) ) ( not ( = ?auto_480363 ?auto_480369 ) ) ( not ( = ?auto_480363 ?auto_480370 ) ) ( not ( = ?auto_480363 ?auto_480371 ) ) ( not ( = ?auto_480363 ?auto_480372 ) ) ( not ( = ?auto_480363 ?auto_480373 ) ) ( not ( = ?auto_480363 ?auto_480374 ) ) ( not ( = ?auto_480363 ?auto_480375 ) ) ( not ( = ?auto_480363 ?auto_480376 ) ) ( not ( = ?auto_480364 ?auto_480365 ) ) ( not ( = ?auto_480364 ?auto_480366 ) ) ( not ( = ?auto_480364 ?auto_480367 ) ) ( not ( = ?auto_480364 ?auto_480368 ) ) ( not ( = ?auto_480364 ?auto_480369 ) ) ( not ( = ?auto_480364 ?auto_480370 ) ) ( not ( = ?auto_480364 ?auto_480371 ) ) ( not ( = ?auto_480364 ?auto_480372 ) ) ( not ( = ?auto_480364 ?auto_480373 ) ) ( not ( = ?auto_480364 ?auto_480374 ) ) ( not ( = ?auto_480364 ?auto_480375 ) ) ( not ( = ?auto_480364 ?auto_480376 ) ) ( not ( = ?auto_480365 ?auto_480366 ) ) ( not ( = ?auto_480365 ?auto_480367 ) ) ( not ( = ?auto_480365 ?auto_480368 ) ) ( not ( = ?auto_480365 ?auto_480369 ) ) ( not ( = ?auto_480365 ?auto_480370 ) ) ( not ( = ?auto_480365 ?auto_480371 ) ) ( not ( = ?auto_480365 ?auto_480372 ) ) ( not ( = ?auto_480365 ?auto_480373 ) ) ( not ( = ?auto_480365 ?auto_480374 ) ) ( not ( = ?auto_480365 ?auto_480375 ) ) ( not ( = ?auto_480365 ?auto_480376 ) ) ( not ( = ?auto_480366 ?auto_480367 ) ) ( not ( = ?auto_480366 ?auto_480368 ) ) ( not ( = ?auto_480366 ?auto_480369 ) ) ( not ( = ?auto_480366 ?auto_480370 ) ) ( not ( = ?auto_480366 ?auto_480371 ) ) ( not ( = ?auto_480366 ?auto_480372 ) ) ( not ( = ?auto_480366 ?auto_480373 ) ) ( not ( = ?auto_480366 ?auto_480374 ) ) ( not ( = ?auto_480366 ?auto_480375 ) ) ( not ( = ?auto_480366 ?auto_480376 ) ) ( not ( = ?auto_480367 ?auto_480368 ) ) ( not ( = ?auto_480367 ?auto_480369 ) ) ( not ( = ?auto_480367 ?auto_480370 ) ) ( not ( = ?auto_480367 ?auto_480371 ) ) ( not ( = ?auto_480367 ?auto_480372 ) ) ( not ( = ?auto_480367 ?auto_480373 ) ) ( not ( = ?auto_480367 ?auto_480374 ) ) ( not ( = ?auto_480367 ?auto_480375 ) ) ( not ( = ?auto_480367 ?auto_480376 ) ) ( not ( = ?auto_480368 ?auto_480369 ) ) ( not ( = ?auto_480368 ?auto_480370 ) ) ( not ( = ?auto_480368 ?auto_480371 ) ) ( not ( = ?auto_480368 ?auto_480372 ) ) ( not ( = ?auto_480368 ?auto_480373 ) ) ( not ( = ?auto_480368 ?auto_480374 ) ) ( not ( = ?auto_480368 ?auto_480375 ) ) ( not ( = ?auto_480368 ?auto_480376 ) ) ( not ( = ?auto_480369 ?auto_480370 ) ) ( not ( = ?auto_480369 ?auto_480371 ) ) ( not ( = ?auto_480369 ?auto_480372 ) ) ( not ( = ?auto_480369 ?auto_480373 ) ) ( not ( = ?auto_480369 ?auto_480374 ) ) ( not ( = ?auto_480369 ?auto_480375 ) ) ( not ( = ?auto_480369 ?auto_480376 ) ) ( not ( = ?auto_480370 ?auto_480371 ) ) ( not ( = ?auto_480370 ?auto_480372 ) ) ( not ( = ?auto_480370 ?auto_480373 ) ) ( not ( = ?auto_480370 ?auto_480374 ) ) ( not ( = ?auto_480370 ?auto_480375 ) ) ( not ( = ?auto_480370 ?auto_480376 ) ) ( not ( = ?auto_480371 ?auto_480372 ) ) ( not ( = ?auto_480371 ?auto_480373 ) ) ( not ( = ?auto_480371 ?auto_480374 ) ) ( not ( = ?auto_480371 ?auto_480375 ) ) ( not ( = ?auto_480371 ?auto_480376 ) ) ( not ( = ?auto_480372 ?auto_480373 ) ) ( not ( = ?auto_480372 ?auto_480374 ) ) ( not ( = ?auto_480372 ?auto_480375 ) ) ( not ( = ?auto_480372 ?auto_480376 ) ) ( not ( = ?auto_480373 ?auto_480374 ) ) ( not ( = ?auto_480373 ?auto_480375 ) ) ( not ( = ?auto_480373 ?auto_480376 ) ) ( not ( = ?auto_480374 ?auto_480375 ) ) ( not ( = ?auto_480374 ?auto_480376 ) ) ( not ( = ?auto_480375 ?auto_480376 ) ) ( ON ?auto_480374 ?auto_480375 ) ( CLEAR ?auto_480372 ) ( ON ?auto_480373 ?auto_480374 ) ( CLEAR ?auto_480373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_480363 ?auto_480364 ?auto_480365 ?auto_480366 ?auto_480367 ?auto_480368 ?auto_480369 ?auto_480370 ?auto_480371 ?auto_480372 ?auto_480373 )
      ( MAKE-13PILE ?auto_480363 ?auto_480364 ?auto_480365 ?auto_480366 ?auto_480367 ?auto_480368 ?auto_480369 ?auto_480370 ?auto_480371 ?auto_480372 ?auto_480373 ?auto_480374 ?auto_480375 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_480417 - BLOCK
      ?auto_480418 - BLOCK
      ?auto_480419 - BLOCK
      ?auto_480420 - BLOCK
      ?auto_480421 - BLOCK
      ?auto_480422 - BLOCK
      ?auto_480423 - BLOCK
      ?auto_480424 - BLOCK
      ?auto_480425 - BLOCK
      ?auto_480426 - BLOCK
      ?auto_480427 - BLOCK
      ?auto_480428 - BLOCK
      ?auto_480429 - BLOCK
    )
    :vars
    (
      ?auto_480430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_480429 ?auto_480430 ) ( ON-TABLE ?auto_480417 ) ( ON ?auto_480418 ?auto_480417 ) ( ON ?auto_480419 ?auto_480418 ) ( ON ?auto_480420 ?auto_480419 ) ( ON ?auto_480421 ?auto_480420 ) ( ON ?auto_480422 ?auto_480421 ) ( ON ?auto_480423 ?auto_480422 ) ( ON ?auto_480424 ?auto_480423 ) ( ON ?auto_480425 ?auto_480424 ) ( not ( = ?auto_480417 ?auto_480418 ) ) ( not ( = ?auto_480417 ?auto_480419 ) ) ( not ( = ?auto_480417 ?auto_480420 ) ) ( not ( = ?auto_480417 ?auto_480421 ) ) ( not ( = ?auto_480417 ?auto_480422 ) ) ( not ( = ?auto_480417 ?auto_480423 ) ) ( not ( = ?auto_480417 ?auto_480424 ) ) ( not ( = ?auto_480417 ?auto_480425 ) ) ( not ( = ?auto_480417 ?auto_480426 ) ) ( not ( = ?auto_480417 ?auto_480427 ) ) ( not ( = ?auto_480417 ?auto_480428 ) ) ( not ( = ?auto_480417 ?auto_480429 ) ) ( not ( = ?auto_480417 ?auto_480430 ) ) ( not ( = ?auto_480418 ?auto_480419 ) ) ( not ( = ?auto_480418 ?auto_480420 ) ) ( not ( = ?auto_480418 ?auto_480421 ) ) ( not ( = ?auto_480418 ?auto_480422 ) ) ( not ( = ?auto_480418 ?auto_480423 ) ) ( not ( = ?auto_480418 ?auto_480424 ) ) ( not ( = ?auto_480418 ?auto_480425 ) ) ( not ( = ?auto_480418 ?auto_480426 ) ) ( not ( = ?auto_480418 ?auto_480427 ) ) ( not ( = ?auto_480418 ?auto_480428 ) ) ( not ( = ?auto_480418 ?auto_480429 ) ) ( not ( = ?auto_480418 ?auto_480430 ) ) ( not ( = ?auto_480419 ?auto_480420 ) ) ( not ( = ?auto_480419 ?auto_480421 ) ) ( not ( = ?auto_480419 ?auto_480422 ) ) ( not ( = ?auto_480419 ?auto_480423 ) ) ( not ( = ?auto_480419 ?auto_480424 ) ) ( not ( = ?auto_480419 ?auto_480425 ) ) ( not ( = ?auto_480419 ?auto_480426 ) ) ( not ( = ?auto_480419 ?auto_480427 ) ) ( not ( = ?auto_480419 ?auto_480428 ) ) ( not ( = ?auto_480419 ?auto_480429 ) ) ( not ( = ?auto_480419 ?auto_480430 ) ) ( not ( = ?auto_480420 ?auto_480421 ) ) ( not ( = ?auto_480420 ?auto_480422 ) ) ( not ( = ?auto_480420 ?auto_480423 ) ) ( not ( = ?auto_480420 ?auto_480424 ) ) ( not ( = ?auto_480420 ?auto_480425 ) ) ( not ( = ?auto_480420 ?auto_480426 ) ) ( not ( = ?auto_480420 ?auto_480427 ) ) ( not ( = ?auto_480420 ?auto_480428 ) ) ( not ( = ?auto_480420 ?auto_480429 ) ) ( not ( = ?auto_480420 ?auto_480430 ) ) ( not ( = ?auto_480421 ?auto_480422 ) ) ( not ( = ?auto_480421 ?auto_480423 ) ) ( not ( = ?auto_480421 ?auto_480424 ) ) ( not ( = ?auto_480421 ?auto_480425 ) ) ( not ( = ?auto_480421 ?auto_480426 ) ) ( not ( = ?auto_480421 ?auto_480427 ) ) ( not ( = ?auto_480421 ?auto_480428 ) ) ( not ( = ?auto_480421 ?auto_480429 ) ) ( not ( = ?auto_480421 ?auto_480430 ) ) ( not ( = ?auto_480422 ?auto_480423 ) ) ( not ( = ?auto_480422 ?auto_480424 ) ) ( not ( = ?auto_480422 ?auto_480425 ) ) ( not ( = ?auto_480422 ?auto_480426 ) ) ( not ( = ?auto_480422 ?auto_480427 ) ) ( not ( = ?auto_480422 ?auto_480428 ) ) ( not ( = ?auto_480422 ?auto_480429 ) ) ( not ( = ?auto_480422 ?auto_480430 ) ) ( not ( = ?auto_480423 ?auto_480424 ) ) ( not ( = ?auto_480423 ?auto_480425 ) ) ( not ( = ?auto_480423 ?auto_480426 ) ) ( not ( = ?auto_480423 ?auto_480427 ) ) ( not ( = ?auto_480423 ?auto_480428 ) ) ( not ( = ?auto_480423 ?auto_480429 ) ) ( not ( = ?auto_480423 ?auto_480430 ) ) ( not ( = ?auto_480424 ?auto_480425 ) ) ( not ( = ?auto_480424 ?auto_480426 ) ) ( not ( = ?auto_480424 ?auto_480427 ) ) ( not ( = ?auto_480424 ?auto_480428 ) ) ( not ( = ?auto_480424 ?auto_480429 ) ) ( not ( = ?auto_480424 ?auto_480430 ) ) ( not ( = ?auto_480425 ?auto_480426 ) ) ( not ( = ?auto_480425 ?auto_480427 ) ) ( not ( = ?auto_480425 ?auto_480428 ) ) ( not ( = ?auto_480425 ?auto_480429 ) ) ( not ( = ?auto_480425 ?auto_480430 ) ) ( not ( = ?auto_480426 ?auto_480427 ) ) ( not ( = ?auto_480426 ?auto_480428 ) ) ( not ( = ?auto_480426 ?auto_480429 ) ) ( not ( = ?auto_480426 ?auto_480430 ) ) ( not ( = ?auto_480427 ?auto_480428 ) ) ( not ( = ?auto_480427 ?auto_480429 ) ) ( not ( = ?auto_480427 ?auto_480430 ) ) ( not ( = ?auto_480428 ?auto_480429 ) ) ( not ( = ?auto_480428 ?auto_480430 ) ) ( not ( = ?auto_480429 ?auto_480430 ) ) ( ON ?auto_480428 ?auto_480429 ) ( ON ?auto_480427 ?auto_480428 ) ( CLEAR ?auto_480425 ) ( ON ?auto_480426 ?auto_480427 ) ( CLEAR ?auto_480426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_480417 ?auto_480418 ?auto_480419 ?auto_480420 ?auto_480421 ?auto_480422 ?auto_480423 ?auto_480424 ?auto_480425 ?auto_480426 )
      ( MAKE-13PILE ?auto_480417 ?auto_480418 ?auto_480419 ?auto_480420 ?auto_480421 ?auto_480422 ?auto_480423 ?auto_480424 ?auto_480425 ?auto_480426 ?auto_480427 ?auto_480428 ?auto_480429 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_480471 - BLOCK
      ?auto_480472 - BLOCK
      ?auto_480473 - BLOCK
      ?auto_480474 - BLOCK
      ?auto_480475 - BLOCK
      ?auto_480476 - BLOCK
      ?auto_480477 - BLOCK
      ?auto_480478 - BLOCK
      ?auto_480479 - BLOCK
      ?auto_480480 - BLOCK
      ?auto_480481 - BLOCK
      ?auto_480482 - BLOCK
      ?auto_480483 - BLOCK
    )
    :vars
    (
      ?auto_480484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_480483 ?auto_480484 ) ( ON-TABLE ?auto_480471 ) ( ON ?auto_480472 ?auto_480471 ) ( ON ?auto_480473 ?auto_480472 ) ( ON ?auto_480474 ?auto_480473 ) ( ON ?auto_480475 ?auto_480474 ) ( ON ?auto_480476 ?auto_480475 ) ( ON ?auto_480477 ?auto_480476 ) ( ON ?auto_480478 ?auto_480477 ) ( not ( = ?auto_480471 ?auto_480472 ) ) ( not ( = ?auto_480471 ?auto_480473 ) ) ( not ( = ?auto_480471 ?auto_480474 ) ) ( not ( = ?auto_480471 ?auto_480475 ) ) ( not ( = ?auto_480471 ?auto_480476 ) ) ( not ( = ?auto_480471 ?auto_480477 ) ) ( not ( = ?auto_480471 ?auto_480478 ) ) ( not ( = ?auto_480471 ?auto_480479 ) ) ( not ( = ?auto_480471 ?auto_480480 ) ) ( not ( = ?auto_480471 ?auto_480481 ) ) ( not ( = ?auto_480471 ?auto_480482 ) ) ( not ( = ?auto_480471 ?auto_480483 ) ) ( not ( = ?auto_480471 ?auto_480484 ) ) ( not ( = ?auto_480472 ?auto_480473 ) ) ( not ( = ?auto_480472 ?auto_480474 ) ) ( not ( = ?auto_480472 ?auto_480475 ) ) ( not ( = ?auto_480472 ?auto_480476 ) ) ( not ( = ?auto_480472 ?auto_480477 ) ) ( not ( = ?auto_480472 ?auto_480478 ) ) ( not ( = ?auto_480472 ?auto_480479 ) ) ( not ( = ?auto_480472 ?auto_480480 ) ) ( not ( = ?auto_480472 ?auto_480481 ) ) ( not ( = ?auto_480472 ?auto_480482 ) ) ( not ( = ?auto_480472 ?auto_480483 ) ) ( not ( = ?auto_480472 ?auto_480484 ) ) ( not ( = ?auto_480473 ?auto_480474 ) ) ( not ( = ?auto_480473 ?auto_480475 ) ) ( not ( = ?auto_480473 ?auto_480476 ) ) ( not ( = ?auto_480473 ?auto_480477 ) ) ( not ( = ?auto_480473 ?auto_480478 ) ) ( not ( = ?auto_480473 ?auto_480479 ) ) ( not ( = ?auto_480473 ?auto_480480 ) ) ( not ( = ?auto_480473 ?auto_480481 ) ) ( not ( = ?auto_480473 ?auto_480482 ) ) ( not ( = ?auto_480473 ?auto_480483 ) ) ( not ( = ?auto_480473 ?auto_480484 ) ) ( not ( = ?auto_480474 ?auto_480475 ) ) ( not ( = ?auto_480474 ?auto_480476 ) ) ( not ( = ?auto_480474 ?auto_480477 ) ) ( not ( = ?auto_480474 ?auto_480478 ) ) ( not ( = ?auto_480474 ?auto_480479 ) ) ( not ( = ?auto_480474 ?auto_480480 ) ) ( not ( = ?auto_480474 ?auto_480481 ) ) ( not ( = ?auto_480474 ?auto_480482 ) ) ( not ( = ?auto_480474 ?auto_480483 ) ) ( not ( = ?auto_480474 ?auto_480484 ) ) ( not ( = ?auto_480475 ?auto_480476 ) ) ( not ( = ?auto_480475 ?auto_480477 ) ) ( not ( = ?auto_480475 ?auto_480478 ) ) ( not ( = ?auto_480475 ?auto_480479 ) ) ( not ( = ?auto_480475 ?auto_480480 ) ) ( not ( = ?auto_480475 ?auto_480481 ) ) ( not ( = ?auto_480475 ?auto_480482 ) ) ( not ( = ?auto_480475 ?auto_480483 ) ) ( not ( = ?auto_480475 ?auto_480484 ) ) ( not ( = ?auto_480476 ?auto_480477 ) ) ( not ( = ?auto_480476 ?auto_480478 ) ) ( not ( = ?auto_480476 ?auto_480479 ) ) ( not ( = ?auto_480476 ?auto_480480 ) ) ( not ( = ?auto_480476 ?auto_480481 ) ) ( not ( = ?auto_480476 ?auto_480482 ) ) ( not ( = ?auto_480476 ?auto_480483 ) ) ( not ( = ?auto_480476 ?auto_480484 ) ) ( not ( = ?auto_480477 ?auto_480478 ) ) ( not ( = ?auto_480477 ?auto_480479 ) ) ( not ( = ?auto_480477 ?auto_480480 ) ) ( not ( = ?auto_480477 ?auto_480481 ) ) ( not ( = ?auto_480477 ?auto_480482 ) ) ( not ( = ?auto_480477 ?auto_480483 ) ) ( not ( = ?auto_480477 ?auto_480484 ) ) ( not ( = ?auto_480478 ?auto_480479 ) ) ( not ( = ?auto_480478 ?auto_480480 ) ) ( not ( = ?auto_480478 ?auto_480481 ) ) ( not ( = ?auto_480478 ?auto_480482 ) ) ( not ( = ?auto_480478 ?auto_480483 ) ) ( not ( = ?auto_480478 ?auto_480484 ) ) ( not ( = ?auto_480479 ?auto_480480 ) ) ( not ( = ?auto_480479 ?auto_480481 ) ) ( not ( = ?auto_480479 ?auto_480482 ) ) ( not ( = ?auto_480479 ?auto_480483 ) ) ( not ( = ?auto_480479 ?auto_480484 ) ) ( not ( = ?auto_480480 ?auto_480481 ) ) ( not ( = ?auto_480480 ?auto_480482 ) ) ( not ( = ?auto_480480 ?auto_480483 ) ) ( not ( = ?auto_480480 ?auto_480484 ) ) ( not ( = ?auto_480481 ?auto_480482 ) ) ( not ( = ?auto_480481 ?auto_480483 ) ) ( not ( = ?auto_480481 ?auto_480484 ) ) ( not ( = ?auto_480482 ?auto_480483 ) ) ( not ( = ?auto_480482 ?auto_480484 ) ) ( not ( = ?auto_480483 ?auto_480484 ) ) ( ON ?auto_480482 ?auto_480483 ) ( ON ?auto_480481 ?auto_480482 ) ( ON ?auto_480480 ?auto_480481 ) ( CLEAR ?auto_480478 ) ( ON ?auto_480479 ?auto_480480 ) ( CLEAR ?auto_480479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_480471 ?auto_480472 ?auto_480473 ?auto_480474 ?auto_480475 ?auto_480476 ?auto_480477 ?auto_480478 ?auto_480479 )
      ( MAKE-13PILE ?auto_480471 ?auto_480472 ?auto_480473 ?auto_480474 ?auto_480475 ?auto_480476 ?auto_480477 ?auto_480478 ?auto_480479 ?auto_480480 ?auto_480481 ?auto_480482 ?auto_480483 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_480525 - BLOCK
      ?auto_480526 - BLOCK
      ?auto_480527 - BLOCK
      ?auto_480528 - BLOCK
      ?auto_480529 - BLOCK
      ?auto_480530 - BLOCK
      ?auto_480531 - BLOCK
      ?auto_480532 - BLOCK
      ?auto_480533 - BLOCK
      ?auto_480534 - BLOCK
      ?auto_480535 - BLOCK
      ?auto_480536 - BLOCK
      ?auto_480537 - BLOCK
    )
    :vars
    (
      ?auto_480538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_480537 ?auto_480538 ) ( ON-TABLE ?auto_480525 ) ( ON ?auto_480526 ?auto_480525 ) ( ON ?auto_480527 ?auto_480526 ) ( ON ?auto_480528 ?auto_480527 ) ( ON ?auto_480529 ?auto_480528 ) ( ON ?auto_480530 ?auto_480529 ) ( ON ?auto_480531 ?auto_480530 ) ( not ( = ?auto_480525 ?auto_480526 ) ) ( not ( = ?auto_480525 ?auto_480527 ) ) ( not ( = ?auto_480525 ?auto_480528 ) ) ( not ( = ?auto_480525 ?auto_480529 ) ) ( not ( = ?auto_480525 ?auto_480530 ) ) ( not ( = ?auto_480525 ?auto_480531 ) ) ( not ( = ?auto_480525 ?auto_480532 ) ) ( not ( = ?auto_480525 ?auto_480533 ) ) ( not ( = ?auto_480525 ?auto_480534 ) ) ( not ( = ?auto_480525 ?auto_480535 ) ) ( not ( = ?auto_480525 ?auto_480536 ) ) ( not ( = ?auto_480525 ?auto_480537 ) ) ( not ( = ?auto_480525 ?auto_480538 ) ) ( not ( = ?auto_480526 ?auto_480527 ) ) ( not ( = ?auto_480526 ?auto_480528 ) ) ( not ( = ?auto_480526 ?auto_480529 ) ) ( not ( = ?auto_480526 ?auto_480530 ) ) ( not ( = ?auto_480526 ?auto_480531 ) ) ( not ( = ?auto_480526 ?auto_480532 ) ) ( not ( = ?auto_480526 ?auto_480533 ) ) ( not ( = ?auto_480526 ?auto_480534 ) ) ( not ( = ?auto_480526 ?auto_480535 ) ) ( not ( = ?auto_480526 ?auto_480536 ) ) ( not ( = ?auto_480526 ?auto_480537 ) ) ( not ( = ?auto_480526 ?auto_480538 ) ) ( not ( = ?auto_480527 ?auto_480528 ) ) ( not ( = ?auto_480527 ?auto_480529 ) ) ( not ( = ?auto_480527 ?auto_480530 ) ) ( not ( = ?auto_480527 ?auto_480531 ) ) ( not ( = ?auto_480527 ?auto_480532 ) ) ( not ( = ?auto_480527 ?auto_480533 ) ) ( not ( = ?auto_480527 ?auto_480534 ) ) ( not ( = ?auto_480527 ?auto_480535 ) ) ( not ( = ?auto_480527 ?auto_480536 ) ) ( not ( = ?auto_480527 ?auto_480537 ) ) ( not ( = ?auto_480527 ?auto_480538 ) ) ( not ( = ?auto_480528 ?auto_480529 ) ) ( not ( = ?auto_480528 ?auto_480530 ) ) ( not ( = ?auto_480528 ?auto_480531 ) ) ( not ( = ?auto_480528 ?auto_480532 ) ) ( not ( = ?auto_480528 ?auto_480533 ) ) ( not ( = ?auto_480528 ?auto_480534 ) ) ( not ( = ?auto_480528 ?auto_480535 ) ) ( not ( = ?auto_480528 ?auto_480536 ) ) ( not ( = ?auto_480528 ?auto_480537 ) ) ( not ( = ?auto_480528 ?auto_480538 ) ) ( not ( = ?auto_480529 ?auto_480530 ) ) ( not ( = ?auto_480529 ?auto_480531 ) ) ( not ( = ?auto_480529 ?auto_480532 ) ) ( not ( = ?auto_480529 ?auto_480533 ) ) ( not ( = ?auto_480529 ?auto_480534 ) ) ( not ( = ?auto_480529 ?auto_480535 ) ) ( not ( = ?auto_480529 ?auto_480536 ) ) ( not ( = ?auto_480529 ?auto_480537 ) ) ( not ( = ?auto_480529 ?auto_480538 ) ) ( not ( = ?auto_480530 ?auto_480531 ) ) ( not ( = ?auto_480530 ?auto_480532 ) ) ( not ( = ?auto_480530 ?auto_480533 ) ) ( not ( = ?auto_480530 ?auto_480534 ) ) ( not ( = ?auto_480530 ?auto_480535 ) ) ( not ( = ?auto_480530 ?auto_480536 ) ) ( not ( = ?auto_480530 ?auto_480537 ) ) ( not ( = ?auto_480530 ?auto_480538 ) ) ( not ( = ?auto_480531 ?auto_480532 ) ) ( not ( = ?auto_480531 ?auto_480533 ) ) ( not ( = ?auto_480531 ?auto_480534 ) ) ( not ( = ?auto_480531 ?auto_480535 ) ) ( not ( = ?auto_480531 ?auto_480536 ) ) ( not ( = ?auto_480531 ?auto_480537 ) ) ( not ( = ?auto_480531 ?auto_480538 ) ) ( not ( = ?auto_480532 ?auto_480533 ) ) ( not ( = ?auto_480532 ?auto_480534 ) ) ( not ( = ?auto_480532 ?auto_480535 ) ) ( not ( = ?auto_480532 ?auto_480536 ) ) ( not ( = ?auto_480532 ?auto_480537 ) ) ( not ( = ?auto_480532 ?auto_480538 ) ) ( not ( = ?auto_480533 ?auto_480534 ) ) ( not ( = ?auto_480533 ?auto_480535 ) ) ( not ( = ?auto_480533 ?auto_480536 ) ) ( not ( = ?auto_480533 ?auto_480537 ) ) ( not ( = ?auto_480533 ?auto_480538 ) ) ( not ( = ?auto_480534 ?auto_480535 ) ) ( not ( = ?auto_480534 ?auto_480536 ) ) ( not ( = ?auto_480534 ?auto_480537 ) ) ( not ( = ?auto_480534 ?auto_480538 ) ) ( not ( = ?auto_480535 ?auto_480536 ) ) ( not ( = ?auto_480535 ?auto_480537 ) ) ( not ( = ?auto_480535 ?auto_480538 ) ) ( not ( = ?auto_480536 ?auto_480537 ) ) ( not ( = ?auto_480536 ?auto_480538 ) ) ( not ( = ?auto_480537 ?auto_480538 ) ) ( ON ?auto_480536 ?auto_480537 ) ( ON ?auto_480535 ?auto_480536 ) ( ON ?auto_480534 ?auto_480535 ) ( ON ?auto_480533 ?auto_480534 ) ( CLEAR ?auto_480531 ) ( ON ?auto_480532 ?auto_480533 ) ( CLEAR ?auto_480532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_480525 ?auto_480526 ?auto_480527 ?auto_480528 ?auto_480529 ?auto_480530 ?auto_480531 ?auto_480532 )
      ( MAKE-13PILE ?auto_480525 ?auto_480526 ?auto_480527 ?auto_480528 ?auto_480529 ?auto_480530 ?auto_480531 ?auto_480532 ?auto_480533 ?auto_480534 ?auto_480535 ?auto_480536 ?auto_480537 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_480579 - BLOCK
      ?auto_480580 - BLOCK
      ?auto_480581 - BLOCK
      ?auto_480582 - BLOCK
      ?auto_480583 - BLOCK
      ?auto_480584 - BLOCK
      ?auto_480585 - BLOCK
      ?auto_480586 - BLOCK
      ?auto_480587 - BLOCK
      ?auto_480588 - BLOCK
      ?auto_480589 - BLOCK
      ?auto_480590 - BLOCK
      ?auto_480591 - BLOCK
    )
    :vars
    (
      ?auto_480592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_480591 ?auto_480592 ) ( ON-TABLE ?auto_480579 ) ( ON ?auto_480580 ?auto_480579 ) ( ON ?auto_480581 ?auto_480580 ) ( ON ?auto_480582 ?auto_480581 ) ( ON ?auto_480583 ?auto_480582 ) ( ON ?auto_480584 ?auto_480583 ) ( not ( = ?auto_480579 ?auto_480580 ) ) ( not ( = ?auto_480579 ?auto_480581 ) ) ( not ( = ?auto_480579 ?auto_480582 ) ) ( not ( = ?auto_480579 ?auto_480583 ) ) ( not ( = ?auto_480579 ?auto_480584 ) ) ( not ( = ?auto_480579 ?auto_480585 ) ) ( not ( = ?auto_480579 ?auto_480586 ) ) ( not ( = ?auto_480579 ?auto_480587 ) ) ( not ( = ?auto_480579 ?auto_480588 ) ) ( not ( = ?auto_480579 ?auto_480589 ) ) ( not ( = ?auto_480579 ?auto_480590 ) ) ( not ( = ?auto_480579 ?auto_480591 ) ) ( not ( = ?auto_480579 ?auto_480592 ) ) ( not ( = ?auto_480580 ?auto_480581 ) ) ( not ( = ?auto_480580 ?auto_480582 ) ) ( not ( = ?auto_480580 ?auto_480583 ) ) ( not ( = ?auto_480580 ?auto_480584 ) ) ( not ( = ?auto_480580 ?auto_480585 ) ) ( not ( = ?auto_480580 ?auto_480586 ) ) ( not ( = ?auto_480580 ?auto_480587 ) ) ( not ( = ?auto_480580 ?auto_480588 ) ) ( not ( = ?auto_480580 ?auto_480589 ) ) ( not ( = ?auto_480580 ?auto_480590 ) ) ( not ( = ?auto_480580 ?auto_480591 ) ) ( not ( = ?auto_480580 ?auto_480592 ) ) ( not ( = ?auto_480581 ?auto_480582 ) ) ( not ( = ?auto_480581 ?auto_480583 ) ) ( not ( = ?auto_480581 ?auto_480584 ) ) ( not ( = ?auto_480581 ?auto_480585 ) ) ( not ( = ?auto_480581 ?auto_480586 ) ) ( not ( = ?auto_480581 ?auto_480587 ) ) ( not ( = ?auto_480581 ?auto_480588 ) ) ( not ( = ?auto_480581 ?auto_480589 ) ) ( not ( = ?auto_480581 ?auto_480590 ) ) ( not ( = ?auto_480581 ?auto_480591 ) ) ( not ( = ?auto_480581 ?auto_480592 ) ) ( not ( = ?auto_480582 ?auto_480583 ) ) ( not ( = ?auto_480582 ?auto_480584 ) ) ( not ( = ?auto_480582 ?auto_480585 ) ) ( not ( = ?auto_480582 ?auto_480586 ) ) ( not ( = ?auto_480582 ?auto_480587 ) ) ( not ( = ?auto_480582 ?auto_480588 ) ) ( not ( = ?auto_480582 ?auto_480589 ) ) ( not ( = ?auto_480582 ?auto_480590 ) ) ( not ( = ?auto_480582 ?auto_480591 ) ) ( not ( = ?auto_480582 ?auto_480592 ) ) ( not ( = ?auto_480583 ?auto_480584 ) ) ( not ( = ?auto_480583 ?auto_480585 ) ) ( not ( = ?auto_480583 ?auto_480586 ) ) ( not ( = ?auto_480583 ?auto_480587 ) ) ( not ( = ?auto_480583 ?auto_480588 ) ) ( not ( = ?auto_480583 ?auto_480589 ) ) ( not ( = ?auto_480583 ?auto_480590 ) ) ( not ( = ?auto_480583 ?auto_480591 ) ) ( not ( = ?auto_480583 ?auto_480592 ) ) ( not ( = ?auto_480584 ?auto_480585 ) ) ( not ( = ?auto_480584 ?auto_480586 ) ) ( not ( = ?auto_480584 ?auto_480587 ) ) ( not ( = ?auto_480584 ?auto_480588 ) ) ( not ( = ?auto_480584 ?auto_480589 ) ) ( not ( = ?auto_480584 ?auto_480590 ) ) ( not ( = ?auto_480584 ?auto_480591 ) ) ( not ( = ?auto_480584 ?auto_480592 ) ) ( not ( = ?auto_480585 ?auto_480586 ) ) ( not ( = ?auto_480585 ?auto_480587 ) ) ( not ( = ?auto_480585 ?auto_480588 ) ) ( not ( = ?auto_480585 ?auto_480589 ) ) ( not ( = ?auto_480585 ?auto_480590 ) ) ( not ( = ?auto_480585 ?auto_480591 ) ) ( not ( = ?auto_480585 ?auto_480592 ) ) ( not ( = ?auto_480586 ?auto_480587 ) ) ( not ( = ?auto_480586 ?auto_480588 ) ) ( not ( = ?auto_480586 ?auto_480589 ) ) ( not ( = ?auto_480586 ?auto_480590 ) ) ( not ( = ?auto_480586 ?auto_480591 ) ) ( not ( = ?auto_480586 ?auto_480592 ) ) ( not ( = ?auto_480587 ?auto_480588 ) ) ( not ( = ?auto_480587 ?auto_480589 ) ) ( not ( = ?auto_480587 ?auto_480590 ) ) ( not ( = ?auto_480587 ?auto_480591 ) ) ( not ( = ?auto_480587 ?auto_480592 ) ) ( not ( = ?auto_480588 ?auto_480589 ) ) ( not ( = ?auto_480588 ?auto_480590 ) ) ( not ( = ?auto_480588 ?auto_480591 ) ) ( not ( = ?auto_480588 ?auto_480592 ) ) ( not ( = ?auto_480589 ?auto_480590 ) ) ( not ( = ?auto_480589 ?auto_480591 ) ) ( not ( = ?auto_480589 ?auto_480592 ) ) ( not ( = ?auto_480590 ?auto_480591 ) ) ( not ( = ?auto_480590 ?auto_480592 ) ) ( not ( = ?auto_480591 ?auto_480592 ) ) ( ON ?auto_480590 ?auto_480591 ) ( ON ?auto_480589 ?auto_480590 ) ( ON ?auto_480588 ?auto_480589 ) ( ON ?auto_480587 ?auto_480588 ) ( ON ?auto_480586 ?auto_480587 ) ( CLEAR ?auto_480584 ) ( ON ?auto_480585 ?auto_480586 ) ( CLEAR ?auto_480585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_480579 ?auto_480580 ?auto_480581 ?auto_480582 ?auto_480583 ?auto_480584 ?auto_480585 )
      ( MAKE-13PILE ?auto_480579 ?auto_480580 ?auto_480581 ?auto_480582 ?auto_480583 ?auto_480584 ?auto_480585 ?auto_480586 ?auto_480587 ?auto_480588 ?auto_480589 ?auto_480590 ?auto_480591 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_480633 - BLOCK
      ?auto_480634 - BLOCK
      ?auto_480635 - BLOCK
      ?auto_480636 - BLOCK
      ?auto_480637 - BLOCK
      ?auto_480638 - BLOCK
      ?auto_480639 - BLOCK
      ?auto_480640 - BLOCK
      ?auto_480641 - BLOCK
      ?auto_480642 - BLOCK
      ?auto_480643 - BLOCK
      ?auto_480644 - BLOCK
      ?auto_480645 - BLOCK
    )
    :vars
    (
      ?auto_480646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_480645 ?auto_480646 ) ( ON-TABLE ?auto_480633 ) ( ON ?auto_480634 ?auto_480633 ) ( ON ?auto_480635 ?auto_480634 ) ( ON ?auto_480636 ?auto_480635 ) ( ON ?auto_480637 ?auto_480636 ) ( not ( = ?auto_480633 ?auto_480634 ) ) ( not ( = ?auto_480633 ?auto_480635 ) ) ( not ( = ?auto_480633 ?auto_480636 ) ) ( not ( = ?auto_480633 ?auto_480637 ) ) ( not ( = ?auto_480633 ?auto_480638 ) ) ( not ( = ?auto_480633 ?auto_480639 ) ) ( not ( = ?auto_480633 ?auto_480640 ) ) ( not ( = ?auto_480633 ?auto_480641 ) ) ( not ( = ?auto_480633 ?auto_480642 ) ) ( not ( = ?auto_480633 ?auto_480643 ) ) ( not ( = ?auto_480633 ?auto_480644 ) ) ( not ( = ?auto_480633 ?auto_480645 ) ) ( not ( = ?auto_480633 ?auto_480646 ) ) ( not ( = ?auto_480634 ?auto_480635 ) ) ( not ( = ?auto_480634 ?auto_480636 ) ) ( not ( = ?auto_480634 ?auto_480637 ) ) ( not ( = ?auto_480634 ?auto_480638 ) ) ( not ( = ?auto_480634 ?auto_480639 ) ) ( not ( = ?auto_480634 ?auto_480640 ) ) ( not ( = ?auto_480634 ?auto_480641 ) ) ( not ( = ?auto_480634 ?auto_480642 ) ) ( not ( = ?auto_480634 ?auto_480643 ) ) ( not ( = ?auto_480634 ?auto_480644 ) ) ( not ( = ?auto_480634 ?auto_480645 ) ) ( not ( = ?auto_480634 ?auto_480646 ) ) ( not ( = ?auto_480635 ?auto_480636 ) ) ( not ( = ?auto_480635 ?auto_480637 ) ) ( not ( = ?auto_480635 ?auto_480638 ) ) ( not ( = ?auto_480635 ?auto_480639 ) ) ( not ( = ?auto_480635 ?auto_480640 ) ) ( not ( = ?auto_480635 ?auto_480641 ) ) ( not ( = ?auto_480635 ?auto_480642 ) ) ( not ( = ?auto_480635 ?auto_480643 ) ) ( not ( = ?auto_480635 ?auto_480644 ) ) ( not ( = ?auto_480635 ?auto_480645 ) ) ( not ( = ?auto_480635 ?auto_480646 ) ) ( not ( = ?auto_480636 ?auto_480637 ) ) ( not ( = ?auto_480636 ?auto_480638 ) ) ( not ( = ?auto_480636 ?auto_480639 ) ) ( not ( = ?auto_480636 ?auto_480640 ) ) ( not ( = ?auto_480636 ?auto_480641 ) ) ( not ( = ?auto_480636 ?auto_480642 ) ) ( not ( = ?auto_480636 ?auto_480643 ) ) ( not ( = ?auto_480636 ?auto_480644 ) ) ( not ( = ?auto_480636 ?auto_480645 ) ) ( not ( = ?auto_480636 ?auto_480646 ) ) ( not ( = ?auto_480637 ?auto_480638 ) ) ( not ( = ?auto_480637 ?auto_480639 ) ) ( not ( = ?auto_480637 ?auto_480640 ) ) ( not ( = ?auto_480637 ?auto_480641 ) ) ( not ( = ?auto_480637 ?auto_480642 ) ) ( not ( = ?auto_480637 ?auto_480643 ) ) ( not ( = ?auto_480637 ?auto_480644 ) ) ( not ( = ?auto_480637 ?auto_480645 ) ) ( not ( = ?auto_480637 ?auto_480646 ) ) ( not ( = ?auto_480638 ?auto_480639 ) ) ( not ( = ?auto_480638 ?auto_480640 ) ) ( not ( = ?auto_480638 ?auto_480641 ) ) ( not ( = ?auto_480638 ?auto_480642 ) ) ( not ( = ?auto_480638 ?auto_480643 ) ) ( not ( = ?auto_480638 ?auto_480644 ) ) ( not ( = ?auto_480638 ?auto_480645 ) ) ( not ( = ?auto_480638 ?auto_480646 ) ) ( not ( = ?auto_480639 ?auto_480640 ) ) ( not ( = ?auto_480639 ?auto_480641 ) ) ( not ( = ?auto_480639 ?auto_480642 ) ) ( not ( = ?auto_480639 ?auto_480643 ) ) ( not ( = ?auto_480639 ?auto_480644 ) ) ( not ( = ?auto_480639 ?auto_480645 ) ) ( not ( = ?auto_480639 ?auto_480646 ) ) ( not ( = ?auto_480640 ?auto_480641 ) ) ( not ( = ?auto_480640 ?auto_480642 ) ) ( not ( = ?auto_480640 ?auto_480643 ) ) ( not ( = ?auto_480640 ?auto_480644 ) ) ( not ( = ?auto_480640 ?auto_480645 ) ) ( not ( = ?auto_480640 ?auto_480646 ) ) ( not ( = ?auto_480641 ?auto_480642 ) ) ( not ( = ?auto_480641 ?auto_480643 ) ) ( not ( = ?auto_480641 ?auto_480644 ) ) ( not ( = ?auto_480641 ?auto_480645 ) ) ( not ( = ?auto_480641 ?auto_480646 ) ) ( not ( = ?auto_480642 ?auto_480643 ) ) ( not ( = ?auto_480642 ?auto_480644 ) ) ( not ( = ?auto_480642 ?auto_480645 ) ) ( not ( = ?auto_480642 ?auto_480646 ) ) ( not ( = ?auto_480643 ?auto_480644 ) ) ( not ( = ?auto_480643 ?auto_480645 ) ) ( not ( = ?auto_480643 ?auto_480646 ) ) ( not ( = ?auto_480644 ?auto_480645 ) ) ( not ( = ?auto_480644 ?auto_480646 ) ) ( not ( = ?auto_480645 ?auto_480646 ) ) ( ON ?auto_480644 ?auto_480645 ) ( ON ?auto_480643 ?auto_480644 ) ( ON ?auto_480642 ?auto_480643 ) ( ON ?auto_480641 ?auto_480642 ) ( ON ?auto_480640 ?auto_480641 ) ( ON ?auto_480639 ?auto_480640 ) ( CLEAR ?auto_480637 ) ( ON ?auto_480638 ?auto_480639 ) ( CLEAR ?auto_480638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_480633 ?auto_480634 ?auto_480635 ?auto_480636 ?auto_480637 ?auto_480638 )
      ( MAKE-13PILE ?auto_480633 ?auto_480634 ?auto_480635 ?auto_480636 ?auto_480637 ?auto_480638 ?auto_480639 ?auto_480640 ?auto_480641 ?auto_480642 ?auto_480643 ?auto_480644 ?auto_480645 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_480687 - BLOCK
      ?auto_480688 - BLOCK
      ?auto_480689 - BLOCK
      ?auto_480690 - BLOCK
      ?auto_480691 - BLOCK
      ?auto_480692 - BLOCK
      ?auto_480693 - BLOCK
      ?auto_480694 - BLOCK
      ?auto_480695 - BLOCK
      ?auto_480696 - BLOCK
      ?auto_480697 - BLOCK
      ?auto_480698 - BLOCK
      ?auto_480699 - BLOCK
    )
    :vars
    (
      ?auto_480700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_480699 ?auto_480700 ) ( ON-TABLE ?auto_480687 ) ( ON ?auto_480688 ?auto_480687 ) ( ON ?auto_480689 ?auto_480688 ) ( ON ?auto_480690 ?auto_480689 ) ( not ( = ?auto_480687 ?auto_480688 ) ) ( not ( = ?auto_480687 ?auto_480689 ) ) ( not ( = ?auto_480687 ?auto_480690 ) ) ( not ( = ?auto_480687 ?auto_480691 ) ) ( not ( = ?auto_480687 ?auto_480692 ) ) ( not ( = ?auto_480687 ?auto_480693 ) ) ( not ( = ?auto_480687 ?auto_480694 ) ) ( not ( = ?auto_480687 ?auto_480695 ) ) ( not ( = ?auto_480687 ?auto_480696 ) ) ( not ( = ?auto_480687 ?auto_480697 ) ) ( not ( = ?auto_480687 ?auto_480698 ) ) ( not ( = ?auto_480687 ?auto_480699 ) ) ( not ( = ?auto_480687 ?auto_480700 ) ) ( not ( = ?auto_480688 ?auto_480689 ) ) ( not ( = ?auto_480688 ?auto_480690 ) ) ( not ( = ?auto_480688 ?auto_480691 ) ) ( not ( = ?auto_480688 ?auto_480692 ) ) ( not ( = ?auto_480688 ?auto_480693 ) ) ( not ( = ?auto_480688 ?auto_480694 ) ) ( not ( = ?auto_480688 ?auto_480695 ) ) ( not ( = ?auto_480688 ?auto_480696 ) ) ( not ( = ?auto_480688 ?auto_480697 ) ) ( not ( = ?auto_480688 ?auto_480698 ) ) ( not ( = ?auto_480688 ?auto_480699 ) ) ( not ( = ?auto_480688 ?auto_480700 ) ) ( not ( = ?auto_480689 ?auto_480690 ) ) ( not ( = ?auto_480689 ?auto_480691 ) ) ( not ( = ?auto_480689 ?auto_480692 ) ) ( not ( = ?auto_480689 ?auto_480693 ) ) ( not ( = ?auto_480689 ?auto_480694 ) ) ( not ( = ?auto_480689 ?auto_480695 ) ) ( not ( = ?auto_480689 ?auto_480696 ) ) ( not ( = ?auto_480689 ?auto_480697 ) ) ( not ( = ?auto_480689 ?auto_480698 ) ) ( not ( = ?auto_480689 ?auto_480699 ) ) ( not ( = ?auto_480689 ?auto_480700 ) ) ( not ( = ?auto_480690 ?auto_480691 ) ) ( not ( = ?auto_480690 ?auto_480692 ) ) ( not ( = ?auto_480690 ?auto_480693 ) ) ( not ( = ?auto_480690 ?auto_480694 ) ) ( not ( = ?auto_480690 ?auto_480695 ) ) ( not ( = ?auto_480690 ?auto_480696 ) ) ( not ( = ?auto_480690 ?auto_480697 ) ) ( not ( = ?auto_480690 ?auto_480698 ) ) ( not ( = ?auto_480690 ?auto_480699 ) ) ( not ( = ?auto_480690 ?auto_480700 ) ) ( not ( = ?auto_480691 ?auto_480692 ) ) ( not ( = ?auto_480691 ?auto_480693 ) ) ( not ( = ?auto_480691 ?auto_480694 ) ) ( not ( = ?auto_480691 ?auto_480695 ) ) ( not ( = ?auto_480691 ?auto_480696 ) ) ( not ( = ?auto_480691 ?auto_480697 ) ) ( not ( = ?auto_480691 ?auto_480698 ) ) ( not ( = ?auto_480691 ?auto_480699 ) ) ( not ( = ?auto_480691 ?auto_480700 ) ) ( not ( = ?auto_480692 ?auto_480693 ) ) ( not ( = ?auto_480692 ?auto_480694 ) ) ( not ( = ?auto_480692 ?auto_480695 ) ) ( not ( = ?auto_480692 ?auto_480696 ) ) ( not ( = ?auto_480692 ?auto_480697 ) ) ( not ( = ?auto_480692 ?auto_480698 ) ) ( not ( = ?auto_480692 ?auto_480699 ) ) ( not ( = ?auto_480692 ?auto_480700 ) ) ( not ( = ?auto_480693 ?auto_480694 ) ) ( not ( = ?auto_480693 ?auto_480695 ) ) ( not ( = ?auto_480693 ?auto_480696 ) ) ( not ( = ?auto_480693 ?auto_480697 ) ) ( not ( = ?auto_480693 ?auto_480698 ) ) ( not ( = ?auto_480693 ?auto_480699 ) ) ( not ( = ?auto_480693 ?auto_480700 ) ) ( not ( = ?auto_480694 ?auto_480695 ) ) ( not ( = ?auto_480694 ?auto_480696 ) ) ( not ( = ?auto_480694 ?auto_480697 ) ) ( not ( = ?auto_480694 ?auto_480698 ) ) ( not ( = ?auto_480694 ?auto_480699 ) ) ( not ( = ?auto_480694 ?auto_480700 ) ) ( not ( = ?auto_480695 ?auto_480696 ) ) ( not ( = ?auto_480695 ?auto_480697 ) ) ( not ( = ?auto_480695 ?auto_480698 ) ) ( not ( = ?auto_480695 ?auto_480699 ) ) ( not ( = ?auto_480695 ?auto_480700 ) ) ( not ( = ?auto_480696 ?auto_480697 ) ) ( not ( = ?auto_480696 ?auto_480698 ) ) ( not ( = ?auto_480696 ?auto_480699 ) ) ( not ( = ?auto_480696 ?auto_480700 ) ) ( not ( = ?auto_480697 ?auto_480698 ) ) ( not ( = ?auto_480697 ?auto_480699 ) ) ( not ( = ?auto_480697 ?auto_480700 ) ) ( not ( = ?auto_480698 ?auto_480699 ) ) ( not ( = ?auto_480698 ?auto_480700 ) ) ( not ( = ?auto_480699 ?auto_480700 ) ) ( ON ?auto_480698 ?auto_480699 ) ( ON ?auto_480697 ?auto_480698 ) ( ON ?auto_480696 ?auto_480697 ) ( ON ?auto_480695 ?auto_480696 ) ( ON ?auto_480694 ?auto_480695 ) ( ON ?auto_480693 ?auto_480694 ) ( ON ?auto_480692 ?auto_480693 ) ( CLEAR ?auto_480690 ) ( ON ?auto_480691 ?auto_480692 ) ( CLEAR ?auto_480691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_480687 ?auto_480688 ?auto_480689 ?auto_480690 ?auto_480691 )
      ( MAKE-13PILE ?auto_480687 ?auto_480688 ?auto_480689 ?auto_480690 ?auto_480691 ?auto_480692 ?auto_480693 ?auto_480694 ?auto_480695 ?auto_480696 ?auto_480697 ?auto_480698 ?auto_480699 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_480741 - BLOCK
      ?auto_480742 - BLOCK
      ?auto_480743 - BLOCK
      ?auto_480744 - BLOCK
      ?auto_480745 - BLOCK
      ?auto_480746 - BLOCK
      ?auto_480747 - BLOCK
      ?auto_480748 - BLOCK
      ?auto_480749 - BLOCK
      ?auto_480750 - BLOCK
      ?auto_480751 - BLOCK
      ?auto_480752 - BLOCK
      ?auto_480753 - BLOCK
    )
    :vars
    (
      ?auto_480754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_480753 ?auto_480754 ) ( ON-TABLE ?auto_480741 ) ( ON ?auto_480742 ?auto_480741 ) ( ON ?auto_480743 ?auto_480742 ) ( not ( = ?auto_480741 ?auto_480742 ) ) ( not ( = ?auto_480741 ?auto_480743 ) ) ( not ( = ?auto_480741 ?auto_480744 ) ) ( not ( = ?auto_480741 ?auto_480745 ) ) ( not ( = ?auto_480741 ?auto_480746 ) ) ( not ( = ?auto_480741 ?auto_480747 ) ) ( not ( = ?auto_480741 ?auto_480748 ) ) ( not ( = ?auto_480741 ?auto_480749 ) ) ( not ( = ?auto_480741 ?auto_480750 ) ) ( not ( = ?auto_480741 ?auto_480751 ) ) ( not ( = ?auto_480741 ?auto_480752 ) ) ( not ( = ?auto_480741 ?auto_480753 ) ) ( not ( = ?auto_480741 ?auto_480754 ) ) ( not ( = ?auto_480742 ?auto_480743 ) ) ( not ( = ?auto_480742 ?auto_480744 ) ) ( not ( = ?auto_480742 ?auto_480745 ) ) ( not ( = ?auto_480742 ?auto_480746 ) ) ( not ( = ?auto_480742 ?auto_480747 ) ) ( not ( = ?auto_480742 ?auto_480748 ) ) ( not ( = ?auto_480742 ?auto_480749 ) ) ( not ( = ?auto_480742 ?auto_480750 ) ) ( not ( = ?auto_480742 ?auto_480751 ) ) ( not ( = ?auto_480742 ?auto_480752 ) ) ( not ( = ?auto_480742 ?auto_480753 ) ) ( not ( = ?auto_480742 ?auto_480754 ) ) ( not ( = ?auto_480743 ?auto_480744 ) ) ( not ( = ?auto_480743 ?auto_480745 ) ) ( not ( = ?auto_480743 ?auto_480746 ) ) ( not ( = ?auto_480743 ?auto_480747 ) ) ( not ( = ?auto_480743 ?auto_480748 ) ) ( not ( = ?auto_480743 ?auto_480749 ) ) ( not ( = ?auto_480743 ?auto_480750 ) ) ( not ( = ?auto_480743 ?auto_480751 ) ) ( not ( = ?auto_480743 ?auto_480752 ) ) ( not ( = ?auto_480743 ?auto_480753 ) ) ( not ( = ?auto_480743 ?auto_480754 ) ) ( not ( = ?auto_480744 ?auto_480745 ) ) ( not ( = ?auto_480744 ?auto_480746 ) ) ( not ( = ?auto_480744 ?auto_480747 ) ) ( not ( = ?auto_480744 ?auto_480748 ) ) ( not ( = ?auto_480744 ?auto_480749 ) ) ( not ( = ?auto_480744 ?auto_480750 ) ) ( not ( = ?auto_480744 ?auto_480751 ) ) ( not ( = ?auto_480744 ?auto_480752 ) ) ( not ( = ?auto_480744 ?auto_480753 ) ) ( not ( = ?auto_480744 ?auto_480754 ) ) ( not ( = ?auto_480745 ?auto_480746 ) ) ( not ( = ?auto_480745 ?auto_480747 ) ) ( not ( = ?auto_480745 ?auto_480748 ) ) ( not ( = ?auto_480745 ?auto_480749 ) ) ( not ( = ?auto_480745 ?auto_480750 ) ) ( not ( = ?auto_480745 ?auto_480751 ) ) ( not ( = ?auto_480745 ?auto_480752 ) ) ( not ( = ?auto_480745 ?auto_480753 ) ) ( not ( = ?auto_480745 ?auto_480754 ) ) ( not ( = ?auto_480746 ?auto_480747 ) ) ( not ( = ?auto_480746 ?auto_480748 ) ) ( not ( = ?auto_480746 ?auto_480749 ) ) ( not ( = ?auto_480746 ?auto_480750 ) ) ( not ( = ?auto_480746 ?auto_480751 ) ) ( not ( = ?auto_480746 ?auto_480752 ) ) ( not ( = ?auto_480746 ?auto_480753 ) ) ( not ( = ?auto_480746 ?auto_480754 ) ) ( not ( = ?auto_480747 ?auto_480748 ) ) ( not ( = ?auto_480747 ?auto_480749 ) ) ( not ( = ?auto_480747 ?auto_480750 ) ) ( not ( = ?auto_480747 ?auto_480751 ) ) ( not ( = ?auto_480747 ?auto_480752 ) ) ( not ( = ?auto_480747 ?auto_480753 ) ) ( not ( = ?auto_480747 ?auto_480754 ) ) ( not ( = ?auto_480748 ?auto_480749 ) ) ( not ( = ?auto_480748 ?auto_480750 ) ) ( not ( = ?auto_480748 ?auto_480751 ) ) ( not ( = ?auto_480748 ?auto_480752 ) ) ( not ( = ?auto_480748 ?auto_480753 ) ) ( not ( = ?auto_480748 ?auto_480754 ) ) ( not ( = ?auto_480749 ?auto_480750 ) ) ( not ( = ?auto_480749 ?auto_480751 ) ) ( not ( = ?auto_480749 ?auto_480752 ) ) ( not ( = ?auto_480749 ?auto_480753 ) ) ( not ( = ?auto_480749 ?auto_480754 ) ) ( not ( = ?auto_480750 ?auto_480751 ) ) ( not ( = ?auto_480750 ?auto_480752 ) ) ( not ( = ?auto_480750 ?auto_480753 ) ) ( not ( = ?auto_480750 ?auto_480754 ) ) ( not ( = ?auto_480751 ?auto_480752 ) ) ( not ( = ?auto_480751 ?auto_480753 ) ) ( not ( = ?auto_480751 ?auto_480754 ) ) ( not ( = ?auto_480752 ?auto_480753 ) ) ( not ( = ?auto_480752 ?auto_480754 ) ) ( not ( = ?auto_480753 ?auto_480754 ) ) ( ON ?auto_480752 ?auto_480753 ) ( ON ?auto_480751 ?auto_480752 ) ( ON ?auto_480750 ?auto_480751 ) ( ON ?auto_480749 ?auto_480750 ) ( ON ?auto_480748 ?auto_480749 ) ( ON ?auto_480747 ?auto_480748 ) ( ON ?auto_480746 ?auto_480747 ) ( ON ?auto_480745 ?auto_480746 ) ( CLEAR ?auto_480743 ) ( ON ?auto_480744 ?auto_480745 ) ( CLEAR ?auto_480744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_480741 ?auto_480742 ?auto_480743 ?auto_480744 )
      ( MAKE-13PILE ?auto_480741 ?auto_480742 ?auto_480743 ?auto_480744 ?auto_480745 ?auto_480746 ?auto_480747 ?auto_480748 ?auto_480749 ?auto_480750 ?auto_480751 ?auto_480752 ?auto_480753 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_480795 - BLOCK
      ?auto_480796 - BLOCK
      ?auto_480797 - BLOCK
      ?auto_480798 - BLOCK
      ?auto_480799 - BLOCK
      ?auto_480800 - BLOCK
      ?auto_480801 - BLOCK
      ?auto_480802 - BLOCK
      ?auto_480803 - BLOCK
      ?auto_480804 - BLOCK
      ?auto_480805 - BLOCK
      ?auto_480806 - BLOCK
      ?auto_480807 - BLOCK
    )
    :vars
    (
      ?auto_480808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_480807 ?auto_480808 ) ( ON-TABLE ?auto_480795 ) ( ON ?auto_480796 ?auto_480795 ) ( not ( = ?auto_480795 ?auto_480796 ) ) ( not ( = ?auto_480795 ?auto_480797 ) ) ( not ( = ?auto_480795 ?auto_480798 ) ) ( not ( = ?auto_480795 ?auto_480799 ) ) ( not ( = ?auto_480795 ?auto_480800 ) ) ( not ( = ?auto_480795 ?auto_480801 ) ) ( not ( = ?auto_480795 ?auto_480802 ) ) ( not ( = ?auto_480795 ?auto_480803 ) ) ( not ( = ?auto_480795 ?auto_480804 ) ) ( not ( = ?auto_480795 ?auto_480805 ) ) ( not ( = ?auto_480795 ?auto_480806 ) ) ( not ( = ?auto_480795 ?auto_480807 ) ) ( not ( = ?auto_480795 ?auto_480808 ) ) ( not ( = ?auto_480796 ?auto_480797 ) ) ( not ( = ?auto_480796 ?auto_480798 ) ) ( not ( = ?auto_480796 ?auto_480799 ) ) ( not ( = ?auto_480796 ?auto_480800 ) ) ( not ( = ?auto_480796 ?auto_480801 ) ) ( not ( = ?auto_480796 ?auto_480802 ) ) ( not ( = ?auto_480796 ?auto_480803 ) ) ( not ( = ?auto_480796 ?auto_480804 ) ) ( not ( = ?auto_480796 ?auto_480805 ) ) ( not ( = ?auto_480796 ?auto_480806 ) ) ( not ( = ?auto_480796 ?auto_480807 ) ) ( not ( = ?auto_480796 ?auto_480808 ) ) ( not ( = ?auto_480797 ?auto_480798 ) ) ( not ( = ?auto_480797 ?auto_480799 ) ) ( not ( = ?auto_480797 ?auto_480800 ) ) ( not ( = ?auto_480797 ?auto_480801 ) ) ( not ( = ?auto_480797 ?auto_480802 ) ) ( not ( = ?auto_480797 ?auto_480803 ) ) ( not ( = ?auto_480797 ?auto_480804 ) ) ( not ( = ?auto_480797 ?auto_480805 ) ) ( not ( = ?auto_480797 ?auto_480806 ) ) ( not ( = ?auto_480797 ?auto_480807 ) ) ( not ( = ?auto_480797 ?auto_480808 ) ) ( not ( = ?auto_480798 ?auto_480799 ) ) ( not ( = ?auto_480798 ?auto_480800 ) ) ( not ( = ?auto_480798 ?auto_480801 ) ) ( not ( = ?auto_480798 ?auto_480802 ) ) ( not ( = ?auto_480798 ?auto_480803 ) ) ( not ( = ?auto_480798 ?auto_480804 ) ) ( not ( = ?auto_480798 ?auto_480805 ) ) ( not ( = ?auto_480798 ?auto_480806 ) ) ( not ( = ?auto_480798 ?auto_480807 ) ) ( not ( = ?auto_480798 ?auto_480808 ) ) ( not ( = ?auto_480799 ?auto_480800 ) ) ( not ( = ?auto_480799 ?auto_480801 ) ) ( not ( = ?auto_480799 ?auto_480802 ) ) ( not ( = ?auto_480799 ?auto_480803 ) ) ( not ( = ?auto_480799 ?auto_480804 ) ) ( not ( = ?auto_480799 ?auto_480805 ) ) ( not ( = ?auto_480799 ?auto_480806 ) ) ( not ( = ?auto_480799 ?auto_480807 ) ) ( not ( = ?auto_480799 ?auto_480808 ) ) ( not ( = ?auto_480800 ?auto_480801 ) ) ( not ( = ?auto_480800 ?auto_480802 ) ) ( not ( = ?auto_480800 ?auto_480803 ) ) ( not ( = ?auto_480800 ?auto_480804 ) ) ( not ( = ?auto_480800 ?auto_480805 ) ) ( not ( = ?auto_480800 ?auto_480806 ) ) ( not ( = ?auto_480800 ?auto_480807 ) ) ( not ( = ?auto_480800 ?auto_480808 ) ) ( not ( = ?auto_480801 ?auto_480802 ) ) ( not ( = ?auto_480801 ?auto_480803 ) ) ( not ( = ?auto_480801 ?auto_480804 ) ) ( not ( = ?auto_480801 ?auto_480805 ) ) ( not ( = ?auto_480801 ?auto_480806 ) ) ( not ( = ?auto_480801 ?auto_480807 ) ) ( not ( = ?auto_480801 ?auto_480808 ) ) ( not ( = ?auto_480802 ?auto_480803 ) ) ( not ( = ?auto_480802 ?auto_480804 ) ) ( not ( = ?auto_480802 ?auto_480805 ) ) ( not ( = ?auto_480802 ?auto_480806 ) ) ( not ( = ?auto_480802 ?auto_480807 ) ) ( not ( = ?auto_480802 ?auto_480808 ) ) ( not ( = ?auto_480803 ?auto_480804 ) ) ( not ( = ?auto_480803 ?auto_480805 ) ) ( not ( = ?auto_480803 ?auto_480806 ) ) ( not ( = ?auto_480803 ?auto_480807 ) ) ( not ( = ?auto_480803 ?auto_480808 ) ) ( not ( = ?auto_480804 ?auto_480805 ) ) ( not ( = ?auto_480804 ?auto_480806 ) ) ( not ( = ?auto_480804 ?auto_480807 ) ) ( not ( = ?auto_480804 ?auto_480808 ) ) ( not ( = ?auto_480805 ?auto_480806 ) ) ( not ( = ?auto_480805 ?auto_480807 ) ) ( not ( = ?auto_480805 ?auto_480808 ) ) ( not ( = ?auto_480806 ?auto_480807 ) ) ( not ( = ?auto_480806 ?auto_480808 ) ) ( not ( = ?auto_480807 ?auto_480808 ) ) ( ON ?auto_480806 ?auto_480807 ) ( ON ?auto_480805 ?auto_480806 ) ( ON ?auto_480804 ?auto_480805 ) ( ON ?auto_480803 ?auto_480804 ) ( ON ?auto_480802 ?auto_480803 ) ( ON ?auto_480801 ?auto_480802 ) ( ON ?auto_480800 ?auto_480801 ) ( ON ?auto_480799 ?auto_480800 ) ( ON ?auto_480798 ?auto_480799 ) ( CLEAR ?auto_480796 ) ( ON ?auto_480797 ?auto_480798 ) ( CLEAR ?auto_480797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_480795 ?auto_480796 ?auto_480797 )
      ( MAKE-13PILE ?auto_480795 ?auto_480796 ?auto_480797 ?auto_480798 ?auto_480799 ?auto_480800 ?auto_480801 ?auto_480802 ?auto_480803 ?auto_480804 ?auto_480805 ?auto_480806 ?auto_480807 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_480849 - BLOCK
      ?auto_480850 - BLOCK
      ?auto_480851 - BLOCK
      ?auto_480852 - BLOCK
      ?auto_480853 - BLOCK
      ?auto_480854 - BLOCK
      ?auto_480855 - BLOCK
      ?auto_480856 - BLOCK
      ?auto_480857 - BLOCK
      ?auto_480858 - BLOCK
      ?auto_480859 - BLOCK
      ?auto_480860 - BLOCK
      ?auto_480861 - BLOCK
    )
    :vars
    (
      ?auto_480862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_480861 ?auto_480862 ) ( ON-TABLE ?auto_480849 ) ( not ( = ?auto_480849 ?auto_480850 ) ) ( not ( = ?auto_480849 ?auto_480851 ) ) ( not ( = ?auto_480849 ?auto_480852 ) ) ( not ( = ?auto_480849 ?auto_480853 ) ) ( not ( = ?auto_480849 ?auto_480854 ) ) ( not ( = ?auto_480849 ?auto_480855 ) ) ( not ( = ?auto_480849 ?auto_480856 ) ) ( not ( = ?auto_480849 ?auto_480857 ) ) ( not ( = ?auto_480849 ?auto_480858 ) ) ( not ( = ?auto_480849 ?auto_480859 ) ) ( not ( = ?auto_480849 ?auto_480860 ) ) ( not ( = ?auto_480849 ?auto_480861 ) ) ( not ( = ?auto_480849 ?auto_480862 ) ) ( not ( = ?auto_480850 ?auto_480851 ) ) ( not ( = ?auto_480850 ?auto_480852 ) ) ( not ( = ?auto_480850 ?auto_480853 ) ) ( not ( = ?auto_480850 ?auto_480854 ) ) ( not ( = ?auto_480850 ?auto_480855 ) ) ( not ( = ?auto_480850 ?auto_480856 ) ) ( not ( = ?auto_480850 ?auto_480857 ) ) ( not ( = ?auto_480850 ?auto_480858 ) ) ( not ( = ?auto_480850 ?auto_480859 ) ) ( not ( = ?auto_480850 ?auto_480860 ) ) ( not ( = ?auto_480850 ?auto_480861 ) ) ( not ( = ?auto_480850 ?auto_480862 ) ) ( not ( = ?auto_480851 ?auto_480852 ) ) ( not ( = ?auto_480851 ?auto_480853 ) ) ( not ( = ?auto_480851 ?auto_480854 ) ) ( not ( = ?auto_480851 ?auto_480855 ) ) ( not ( = ?auto_480851 ?auto_480856 ) ) ( not ( = ?auto_480851 ?auto_480857 ) ) ( not ( = ?auto_480851 ?auto_480858 ) ) ( not ( = ?auto_480851 ?auto_480859 ) ) ( not ( = ?auto_480851 ?auto_480860 ) ) ( not ( = ?auto_480851 ?auto_480861 ) ) ( not ( = ?auto_480851 ?auto_480862 ) ) ( not ( = ?auto_480852 ?auto_480853 ) ) ( not ( = ?auto_480852 ?auto_480854 ) ) ( not ( = ?auto_480852 ?auto_480855 ) ) ( not ( = ?auto_480852 ?auto_480856 ) ) ( not ( = ?auto_480852 ?auto_480857 ) ) ( not ( = ?auto_480852 ?auto_480858 ) ) ( not ( = ?auto_480852 ?auto_480859 ) ) ( not ( = ?auto_480852 ?auto_480860 ) ) ( not ( = ?auto_480852 ?auto_480861 ) ) ( not ( = ?auto_480852 ?auto_480862 ) ) ( not ( = ?auto_480853 ?auto_480854 ) ) ( not ( = ?auto_480853 ?auto_480855 ) ) ( not ( = ?auto_480853 ?auto_480856 ) ) ( not ( = ?auto_480853 ?auto_480857 ) ) ( not ( = ?auto_480853 ?auto_480858 ) ) ( not ( = ?auto_480853 ?auto_480859 ) ) ( not ( = ?auto_480853 ?auto_480860 ) ) ( not ( = ?auto_480853 ?auto_480861 ) ) ( not ( = ?auto_480853 ?auto_480862 ) ) ( not ( = ?auto_480854 ?auto_480855 ) ) ( not ( = ?auto_480854 ?auto_480856 ) ) ( not ( = ?auto_480854 ?auto_480857 ) ) ( not ( = ?auto_480854 ?auto_480858 ) ) ( not ( = ?auto_480854 ?auto_480859 ) ) ( not ( = ?auto_480854 ?auto_480860 ) ) ( not ( = ?auto_480854 ?auto_480861 ) ) ( not ( = ?auto_480854 ?auto_480862 ) ) ( not ( = ?auto_480855 ?auto_480856 ) ) ( not ( = ?auto_480855 ?auto_480857 ) ) ( not ( = ?auto_480855 ?auto_480858 ) ) ( not ( = ?auto_480855 ?auto_480859 ) ) ( not ( = ?auto_480855 ?auto_480860 ) ) ( not ( = ?auto_480855 ?auto_480861 ) ) ( not ( = ?auto_480855 ?auto_480862 ) ) ( not ( = ?auto_480856 ?auto_480857 ) ) ( not ( = ?auto_480856 ?auto_480858 ) ) ( not ( = ?auto_480856 ?auto_480859 ) ) ( not ( = ?auto_480856 ?auto_480860 ) ) ( not ( = ?auto_480856 ?auto_480861 ) ) ( not ( = ?auto_480856 ?auto_480862 ) ) ( not ( = ?auto_480857 ?auto_480858 ) ) ( not ( = ?auto_480857 ?auto_480859 ) ) ( not ( = ?auto_480857 ?auto_480860 ) ) ( not ( = ?auto_480857 ?auto_480861 ) ) ( not ( = ?auto_480857 ?auto_480862 ) ) ( not ( = ?auto_480858 ?auto_480859 ) ) ( not ( = ?auto_480858 ?auto_480860 ) ) ( not ( = ?auto_480858 ?auto_480861 ) ) ( not ( = ?auto_480858 ?auto_480862 ) ) ( not ( = ?auto_480859 ?auto_480860 ) ) ( not ( = ?auto_480859 ?auto_480861 ) ) ( not ( = ?auto_480859 ?auto_480862 ) ) ( not ( = ?auto_480860 ?auto_480861 ) ) ( not ( = ?auto_480860 ?auto_480862 ) ) ( not ( = ?auto_480861 ?auto_480862 ) ) ( ON ?auto_480860 ?auto_480861 ) ( ON ?auto_480859 ?auto_480860 ) ( ON ?auto_480858 ?auto_480859 ) ( ON ?auto_480857 ?auto_480858 ) ( ON ?auto_480856 ?auto_480857 ) ( ON ?auto_480855 ?auto_480856 ) ( ON ?auto_480854 ?auto_480855 ) ( ON ?auto_480853 ?auto_480854 ) ( ON ?auto_480852 ?auto_480853 ) ( ON ?auto_480851 ?auto_480852 ) ( CLEAR ?auto_480849 ) ( ON ?auto_480850 ?auto_480851 ) ( CLEAR ?auto_480850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_480849 ?auto_480850 )
      ( MAKE-13PILE ?auto_480849 ?auto_480850 ?auto_480851 ?auto_480852 ?auto_480853 ?auto_480854 ?auto_480855 ?auto_480856 ?auto_480857 ?auto_480858 ?auto_480859 ?auto_480860 ?auto_480861 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_480903 - BLOCK
      ?auto_480904 - BLOCK
      ?auto_480905 - BLOCK
      ?auto_480906 - BLOCK
      ?auto_480907 - BLOCK
      ?auto_480908 - BLOCK
      ?auto_480909 - BLOCK
      ?auto_480910 - BLOCK
      ?auto_480911 - BLOCK
      ?auto_480912 - BLOCK
      ?auto_480913 - BLOCK
      ?auto_480914 - BLOCK
      ?auto_480915 - BLOCK
    )
    :vars
    (
      ?auto_480916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_480915 ?auto_480916 ) ( not ( = ?auto_480903 ?auto_480904 ) ) ( not ( = ?auto_480903 ?auto_480905 ) ) ( not ( = ?auto_480903 ?auto_480906 ) ) ( not ( = ?auto_480903 ?auto_480907 ) ) ( not ( = ?auto_480903 ?auto_480908 ) ) ( not ( = ?auto_480903 ?auto_480909 ) ) ( not ( = ?auto_480903 ?auto_480910 ) ) ( not ( = ?auto_480903 ?auto_480911 ) ) ( not ( = ?auto_480903 ?auto_480912 ) ) ( not ( = ?auto_480903 ?auto_480913 ) ) ( not ( = ?auto_480903 ?auto_480914 ) ) ( not ( = ?auto_480903 ?auto_480915 ) ) ( not ( = ?auto_480903 ?auto_480916 ) ) ( not ( = ?auto_480904 ?auto_480905 ) ) ( not ( = ?auto_480904 ?auto_480906 ) ) ( not ( = ?auto_480904 ?auto_480907 ) ) ( not ( = ?auto_480904 ?auto_480908 ) ) ( not ( = ?auto_480904 ?auto_480909 ) ) ( not ( = ?auto_480904 ?auto_480910 ) ) ( not ( = ?auto_480904 ?auto_480911 ) ) ( not ( = ?auto_480904 ?auto_480912 ) ) ( not ( = ?auto_480904 ?auto_480913 ) ) ( not ( = ?auto_480904 ?auto_480914 ) ) ( not ( = ?auto_480904 ?auto_480915 ) ) ( not ( = ?auto_480904 ?auto_480916 ) ) ( not ( = ?auto_480905 ?auto_480906 ) ) ( not ( = ?auto_480905 ?auto_480907 ) ) ( not ( = ?auto_480905 ?auto_480908 ) ) ( not ( = ?auto_480905 ?auto_480909 ) ) ( not ( = ?auto_480905 ?auto_480910 ) ) ( not ( = ?auto_480905 ?auto_480911 ) ) ( not ( = ?auto_480905 ?auto_480912 ) ) ( not ( = ?auto_480905 ?auto_480913 ) ) ( not ( = ?auto_480905 ?auto_480914 ) ) ( not ( = ?auto_480905 ?auto_480915 ) ) ( not ( = ?auto_480905 ?auto_480916 ) ) ( not ( = ?auto_480906 ?auto_480907 ) ) ( not ( = ?auto_480906 ?auto_480908 ) ) ( not ( = ?auto_480906 ?auto_480909 ) ) ( not ( = ?auto_480906 ?auto_480910 ) ) ( not ( = ?auto_480906 ?auto_480911 ) ) ( not ( = ?auto_480906 ?auto_480912 ) ) ( not ( = ?auto_480906 ?auto_480913 ) ) ( not ( = ?auto_480906 ?auto_480914 ) ) ( not ( = ?auto_480906 ?auto_480915 ) ) ( not ( = ?auto_480906 ?auto_480916 ) ) ( not ( = ?auto_480907 ?auto_480908 ) ) ( not ( = ?auto_480907 ?auto_480909 ) ) ( not ( = ?auto_480907 ?auto_480910 ) ) ( not ( = ?auto_480907 ?auto_480911 ) ) ( not ( = ?auto_480907 ?auto_480912 ) ) ( not ( = ?auto_480907 ?auto_480913 ) ) ( not ( = ?auto_480907 ?auto_480914 ) ) ( not ( = ?auto_480907 ?auto_480915 ) ) ( not ( = ?auto_480907 ?auto_480916 ) ) ( not ( = ?auto_480908 ?auto_480909 ) ) ( not ( = ?auto_480908 ?auto_480910 ) ) ( not ( = ?auto_480908 ?auto_480911 ) ) ( not ( = ?auto_480908 ?auto_480912 ) ) ( not ( = ?auto_480908 ?auto_480913 ) ) ( not ( = ?auto_480908 ?auto_480914 ) ) ( not ( = ?auto_480908 ?auto_480915 ) ) ( not ( = ?auto_480908 ?auto_480916 ) ) ( not ( = ?auto_480909 ?auto_480910 ) ) ( not ( = ?auto_480909 ?auto_480911 ) ) ( not ( = ?auto_480909 ?auto_480912 ) ) ( not ( = ?auto_480909 ?auto_480913 ) ) ( not ( = ?auto_480909 ?auto_480914 ) ) ( not ( = ?auto_480909 ?auto_480915 ) ) ( not ( = ?auto_480909 ?auto_480916 ) ) ( not ( = ?auto_480910 ?auto_480911 ) ) ( not ( = ?auto_480910 ?auto_480912 ) ) ( not ( = ?auto_480910 ?auto_480913 ) ) ( not ( = ?auto_480910 ?auto_480914 ) ) ( not ( = ?auto_480910 ?auto_480915 ) ) ( not ( = ?auto_480910 ?auto_480916 ) ) ( not ( = ?auto_480911 ?auto_480912 ) ) ( not ( = ?auto_480911 ?auto_480913 ) ) ( not ( = ?auto_480911 ?auto_480914 ) ) ( not ( = ?auto_480911 ?auto_480915 ) ) ( not ( = ?auto_480911 ?auto_480916 ) ) ( not ( = ?auto_480912 ?auto_480913 ) ) ( not ( = ?auto_480912 ?auto_480914 ) ) ( not ( = ?auto_480912 ?auto_480915 ) ) ( not ( = ?auto_480912 ?auto_480916 ) ) ( not ( = ?auto_480913 ?auto_480914 ) ) ( not ( = ?auto_480913 ?auto_480915 ) ) ( not ( = ?auto_480913 ?auto_480916 ) ) ( not ( = ?auto_480914 ?auto_480915 ) ) ( not ( = ?auto_480914 ?auto_480916 ) ) ( not ( = ?auto_480915 ?auto_480916 ) ) ( ON ?auto_480914 ?auto_480915 ) ( ON ?auto_480913 ?auto_480914 ) ( ON ?auto_480912 ?auto_480913 ) ( ON ?auto_480911 ?auto_480912 ) ( ON ?auto_480910 ?auto_480911 ) ( ON ?auto_480909 ?auto_480910 ) ( ON ?auto_480908 ?auto_480909 ) ( ON ?auto_480907 ?auto_480908 ) ( ON ?auto_480906 ?auto_480907 ) ( ON ?auto_480905 ?auto_480906 ) ( ON ?auto_480904 ?auto_480905 ) ( ON ?auto_480903 ?auto_480904 ) ( CLEAR ?auto_480903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_480903 )
      ( MAKE-13PILE ?auto_480903 ?auto_480904 ?auto_480905 ?auto_480906 ?auto_480907 ?auto_480908 ?auto_480909 ?auto_480910 ?auto_480911 ?auto_480912 ?auto_480913 ?auto_480914 ?auto_480915 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_480958 - BLOCK
      ?auto_480959 - BLOCK
      ?auto_480960 - BLOCK
      ?auto_480961 - BLOCK
      ?auto_480962 - BLOCK
      ?auto_480963 - BLOCK
      ?auto_480964 - BLOCK
      ?auto_480965 - BLOCK
      ?auto_480966 - BLOCK
      ?auto_480967 - BLOCK
      ?auto_480968 - BLOCK
      ?auto_480969 - BLOCK
      ?auto_480970 - BLOCK
      ?auto_480971 - BLOCK
    )
    :vars
    (
      ?auto_480972 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_480970 ) ( ON ?auto_480971 ?auto_480972 ) ( CLEAR ?auto_480971 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_480958 ) ( ON ?auto_480959 ?auto_480958 ) ( ON ?auto_480960 ?auto_480959 ) ( ON ?auto_480961 ?auto_480960 ) ( ON ?auto_480962 ?auto_480961 ) ( ON ?auto_480963 ?auto_480962 ) ( ON ?auto_480964 ?auto_480963 ) ( ON ?auto_480965 ?auto_480964 ) ( ON ?auto_480966 ?auto_480965 ) ( ON ?auto_480967 ?auto_480966 ) ( ON ?auto_480968 ?auto_480967 ) ( ON ?auto_480969 ?auto_480968 ) ( ON ?auto_480970 ?auto_480969 ) ( not ( = ?auto_480958 ?auto_480959 ) ) ( not ( = ?auto_480958 ?auto_480960 ) ) ( not ( = ?auto_480958 ?auto_480961 ) ) ( not ( = ?auto_480958 ?auto_480962 ) ) ( not ( = ?auto_480958 ?auto_480963 ) ) ( not ( = ?auto_480958 ?auto_480964 ) ) ( not ( = ?auto_480958 ?auto_480965 ) ) ( not ( = ?auto_480958 ?auto_480966 ) ) ( not ( = ?auto_480958 ?auto_480967 ) ) ( not ( = ?auto_480958 ?auto_480968 ) ) ( not ( = ?auto_480958 ?auto_480969 ) ) ( not ( = ?auto_480958 ?auto_480970 ) ) ( not ( = ?auto_480958 ?auto_480971 ) ) ( not ( = ?auto_480958 ?auto_480972 ) ) ( not ( = ?auto_480959 ?auto_480960 ) ) ( not ( = ?auto_480959 ?auto_480961 ) ) ( not ( = ?auto_480959 ?auto_480962 ) ) ( not ( = ?auto_480959 ?auto_480963 ) ) ( not ( = ?auto_480959 ?auto_480964 ) ) ( not ( = ?auto_480959 ?auto_480965 ) ) ( not ( = ?auto_480959 ?auto_480966 ) ) ( not ( = ?auto_480959 ?auto_480967 ) ) ( not ( = ?auto_480959 ?auto_480968 ) ) ( not ( = ?auto_480959 ?auto_480969 ) ) ( not ( = ?auto_480959 ?auto_480970 ) ) ( not ( = ?auto_480959 ?auto_480971 ) ) ( not ( = ?auto_480959 ?auto_480972 ) ) ( not ( = ?auto_480960 ?auto_480961 ) ) ( not ( = ?auto_480960 ?auto_480962 ) ) ( not ( = ?auto_480960 ?auto_480963 ) ) ( not ( = ?auto_480960 ?auto_480964 ) ) ( not ( = ?auto_480960 ?auto_480965 ) ) ( not ( = ?auto_480960 ?auto_480966 ) ) ( not ( = ?auto_480960 ?auto_480967 ) ) ( not ( = ?auto_480960 ?auto_480968 ) ) ( not ( = ?auto_480960 ?auto_480969 ) ) ( not ( = ?auto_480960 ?auto_480970 ) ) ( not ( = ?auto_480960 ?auto_480971 ) ) ( not ( = ?auto_480960 ?auto_480972 ) ) ( not ( = ?auto_480961 ?auto_480962 ) ) ( not ( = ?auto_480961 ?auto_480963 ) ) ( not ( = ?auto_480961 ?auto_480964 ) ) ( not ( = ?auto_480961 ?auto_480965 ) ) ( not ( = ?auto_480961 ?auto_480966 ) ) ( not ( = ?auto_480961 ?auto_480967 ) ) ( not ( = ?auto_480961 ?auto_480968 ) ) ( not ( = ?auto_480961 ?auto_480969 ) ) ( not ( = ?auto_480961 ?auto_480970 ) ) ( not ( = ?auto_480961 ?auto_480971 ) ) ( not ( = ?auto_480961 ?auto_480972 ) ) ( not ( = ?auto_480962 ?auto_480963 ) ) ( not ( = ?auto_480962 ?auto_480964 ) ) ( not ( = ?auto_480962 ?auto_480965 ) ) ( not ( = ?auto_480962 ?auto_480966 ) ) ( not ( = ?auto_480962 ?auto_480967 ) ) ( not ( = ?auto_480962 ?auto_480968 ) ) ( not ( = ?auto_480962 ?auto_480969 ) ) ( not ( = ?auto_480962 ?auto_480970 ) ) ( not ( = ?auto_480962 ?auto_480971 ) ) ( not ( = ?auto_480962 ?auto_480972 ) ) ( not ( = ?auto_480963 ?auto_480964 ) ) ( not ( = ?auto_480963 ?auto_480965 ) ) ( not ( = ?auto_480963 ?auto_480966 ) ) ( not ( = ?auto_480963 ?auto_480967 ) ) ( not ( = ?auto_480963 ?auto_480968 ) ) ( not ( = ?auto_480963 ?auto_480969 ) ) ( not ( = ?auto_480963 ?auto_480970 ) ) ( not ( = ?auto_480963 ?auto_480971 ) ) ( not ( = ?auto_480963 ?auto_480972 ) ) ( not ( = ?auto_480964 ?auto_480965 ) ) ( not ( = ?auto_480964 ?auto_480966 ) ) ( not ( = ?auto_480964 ?auto_480967 ) ) ( not ( = ?auto_480964 ?auto_480968 ) ) ( not ( = ?auto_480964 ?auto_480969 ) ) ( not ( = ?auto_480964 ?auto_480970 ) ) ( not ( = ?auto_480964 ?auto_480971 ) ) ( not ( = ?auto_480964 ?auto_480972 ) ) ( not ( = ?auto_480965 ?auto_480966 ) ) ( not ( = ?auto_480965 ?auto_480967 ) ) ( not ( = ?auto_480965 ?auto_480968 ) ) ( not ( = ?auto_480965 ?auto_480969 ) ) ( not ( = ?auto_480965 ?auto_480970 ) ) ( not ( = ?auto_480965 ?auto_480971 ) ) ( not ( = ?auto_480965 ?auto_480972 ) ) ( not ( = ?auto_480966 ?auto_480967 ) ) ( not ( = ?auto_480966 ?auto_480968 ) ) ( not ( = ?auto_480966 ?auto_480969 ) ) ( not ( = ?auto_480966 ?auto_480970 ) ) ( not ( = ?auto_480966 ?auto_480971 ) ) ( not ( = ?auto_480966 ?auto_480972 ) ) ( not ( = ?auto_480967 ?auto_480968 ) ) ( not ( = ?auto_480967 ?auto_480969 ) ) ( not ( = ?auto_480967 ?auto_480970 ) ) ( not ( = ?auto_480967 ?auto_480971 ) ) ( not ( = ?auto_480967 ?auto_480972 ) ) ( not ( = ?auto_480968 ?auto_480969 ) ) ( not ( = ?auto_480968 ?auto_480970 ) ) ( not ( = ?auto_480968 ?auto_480971 ) ) ( not ( = ?auto_480968 ?auto_480972 ) ) ( not ( = ?auto_480969 ?auto_480970 ) ) ( not ( = ?auto_480969 ?auto_480971 ) ) ( not ( = ?auto_480969 ?auto_480972 ) ) ( not ( = ?auto_480970 ?auto_480971 ) ) ( not ( = ?auto_480970 ?auto_480972 ) ) ( not ( = ?auto_480971 ?auto_480972 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_480971 ?auto_480972 )
      ( !STACK ?auto_480971 ?auto_480970 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_481016 - BLOCK
      ?auto_481017 - BLOCK
      ?auto_481018 - BLOCK
      ?auto_481019 - BLOCK
      ?auto_481020 - BLOCK
      ?auto_481021 - BLOCK
      ?auto_481022 - BLOCK
      ?auto_481023 - BLOCK
      ?auto_481024 - BLOCK
      ?auto_481025 - BLOCK
      ?auto_481026 - BLOCK
      ?auto_481027 - BLOCK
      ?auto_481028 - BLOCK
      ?auto_481029 - BLOCK
    )
    :vars
    (
      ?auto_481030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_481029 ?auto_481030 ) ( ON-TABLE ?auto_481016 ) ( ON ?auto_481017 ?auto_481016 ) ( ON ?auto_481018 ?auto_481017 ) ( ON ?auto_481019 ?auto_481018 ) ( ON ?auto_481020 ?auto_481019 ) ( ON ?auto_481021 ?auto_481020 ) ( ON ?auto_481022 ?auto_481021 ) ( ON ?auto_481023 ?auto_481022 ) ( ON ?auto_481024 ?auto_481023 ) ( ON ?auto_481025 ?auto_481024 ) ( ON ?auto_481026 ?auto_481025 ) ( ON ?auto_481027 ?auto_481026 ) ( not ( = ?auto_481016 ?auto_481017 ) ) ( not ( = ?auto_481016 ?auto_481018 ) ) ( not ( = ?auto_481016 ?auto_481019 ) ) ( not ( = ?auto_481016 ?auto_481020 ) ) ( not ( = ?auto_481016 ?auto_481021 ) ) ( not ( = ?auto_481016 ?auto_481022 ) ) ( not ( = ?auto_481016 ?auto_481023 ) ) ( not ( = ?auto_481016 ?auto_481024 ) ) ( not ( = ?auto_481016 ?auto_481025 ) ) ( not ( = ?auto_481016 ?auto_481026 ) ) ( not ( = ?auto_481016 ?auto_481027 ) ) ( not ( = ?auto_481016 ?auto_481028 ) ) ( not ( = ?auto_481016 ?auto_481029 ) ) ( not ( = ?auto_481016 ?auto_481030 ) ) ( not ( = ?auto_481017 ?auto_481018 ) ) ( not ( = ?auto_481017 ?auto_481019 ) ) ( not ( = ?auto_481017 ?auto_481020 ) ) ( not ( = ?auto_481017 ?auto_481021 ) ) ( not ( = ?auto_481017 ?auto_481022 ) ) ( not ( = ?auto_481017 ?auto_481023 ) ) ( not ( = ?auto_481017 ?auto_481024 ) ) ( not ( = ?auto_481017 ?auto_481025 ) ) ( not ( = ?auto_481017 ?auto_481026 ) ) ( not ( = ?auto_481017 ?auto_481027 ) ) ( not ( = ?auto_481017 ?auto_481028 ) ) ( not ( = ?auto_481017 ?auto_481029 ) ) ( not ( = ?auto_481017 ?auto_481030 ) ) ( not ( = ?auto_481018 ?auto_481019 ) ) ( not ( = ?auto_481018 ?auto_481020 ) ) ( not ( = ?auto_481018 ?auto_481021 ) ) ( not ( = ?auto_481018 ?auto_481022 ) ) ( not ( = ?auto_481018 ?auto_481023 ) ) ( not ( = ?auto_481018 ?auto_481024 ) ) ( not ( = ?auto_481018 ?auto_481025 ) ) ( not ( = ?auto_481018 ?auto_481026 ) ) ( not ( = ?auto_481018 ?auto_481027 ) ) ( not ( = ?auto_481018 ?auto_481028 ) ) ( not ( = ?auto_481018 ?auto_481029 ) ) ( not ( = ?auto_481018 ?auto_481030 ) ) ( not ( = ?auto_481019 ?auto_481020 ) ) ( not ( = ?auto_481019 ?auto_481021 ) ) ( not ( = ?auto_481019 ?auto_481022 ) ) ( not ( = ?auto_481019 ?auto_481023 ) ) ( not ( = ?auto_481019 ?auto_481024 ) ) ( not ( = ?auto_481019 ?auto_481025 ) ) ( not ( = ?auto_481019 ?auto_481026 ) ) ( not ( = ?auto_481019 ?auto_481027 ) ) ( not ( = ?auto_481019 ?auto_481028 ) ) ( not ( = ?auto_481019 ?auto_481029 ) ) ( not ( = ?auto_481019 ?auto_481030 ) ) ( not ( = ?auto_481020 ?auto_481021 ) ) ( not ( = ?auto_481020 ?auto_481022 ) ) ( not ( = ?auto_481020 ?auto_481023 ) ) ( not ( = ?auto_481020 ?auto_481024 ) ) ( not ( = ?auto_481020 ?auto_481025 ) ) ( not ( = ?auto_481020 ?auto_481026 ) ) ( not ( = ?auto_481020 ?auto_481027 ) ) ( not ( = ?auto_481020 ?auto_481028 ) ) ( not ( = ?auto_481020 ?auto_481029 ) ) ( not ( = ?auto_481020 ?auto_481030 ) ) ( not ( = ?auto_481021 ?auto_481022 ) ) ( not ( = ?auto_481021 ?auto_481023 ) ) ( not ( = ?auto_481021 ?auto_481024 ) ) ( not ( = ?auto_481021 ?auto_481025 ) ) ( not ( = ?auto_481021 ?auto_481026 ) ) ( not ( = ?auto_481021 ?auto_481027 ) ) ( not ( = ?auto_481021 ?auto_481028 ) ) ( not ( = ?auto_481021 ?auto_481029 ) ) ( not ( = ?auto_481021 ?auto_481030 ) ) ( not ( = ?auto_481022 ?auto_481023 ) ) ( not ( = ?auto_481022 ?auto_481024 ) ) ( not ( = ?auto_481022 ?auto_481025 ) ) ( not ( = ?auto_481022 ?auto_481026 ) ) ( not ( = ?auto_481022 ?auto_481027 ) ) ( not ( = ?auto_481022 ?auto_481028 ) ) ( not ( = ?auto_481022 ?auto_481029 ) ) ( not ( = ?auto_481022 ?auto_481030 ) ) ( not ( = ?auto_481023 ?auto_481024 ) ) ( not ( = ?auto_481023 ?auto_481025 ) ) ( not ( = ?auto_481023 ?auto_481026 ) ) ( not ( = ?auto_481023 ?auto_481027 ) ) ( not ( = ?auto_481023 ?auto_481028 ) ) ( not ( = ?auto_481023 ?auto_481029 ) ) ( not ( = ?auto_481023 ?auto_481030 ) ) ( not ( = ?auto_481024 ?auto_481025 ) ) ( not ( = ?auto_481024 ?auto_481026 ) ) ( not ( = ?auto_481024 ?auto_481027 ) ) ( not ( = ?auto_481024 ?auto_481028 ) ) ( not ( = ?auto_481024 ?auto_481029 ) ) ( not ( = ?auto_481024 ?auto_481030 ) ) ( not ( = ?auto_481025 ?auto_481026 ) ) ( not ( = ?auto_481025 ?auto_481027 ) ) ( not ( = ?auto_481025 ?auto_481028 ) ) ( not ( = ?auto_481025 ?auto_481029 ) ) ( not ( = ?auto_481025 ?auto_481030 ) ) ( not ( = ?auto_481026 ?auto_481027 ) ) ( not ( = ?auto_481026 ?auto_481028 ) ) ( not ( = ?auto_481026 ?auto_481029 ) ) ( not ( = ?auto_481026 ?auto_481030 ) ) ( not ( = ?auto_481027 ?auto_481028 ) ) ( not ( = ?auto_481027 ?auto_481029 ) ) ( not ( = ?auto_481027 ?auto_481030 ) ) ( not ( = ?auto_481028 ?auto_481029 ) ) ( not ( = ?auto_481028 ?auto_481030 ) ) ( not ( = ?auto_481029 ?auto_481030 ) ) ( CLEAR ?auto_481027 ) ( ON ?auto_481028 ?auto_481029 ) ( CLEAR ?auto_481028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_481016 ?auto_481017 ?auto_481018 ?auto_481019 ?auto_481020 ?auto_481021 ?auto_481022 ?auto_481023 ?auto_481024 ?auto_481025 ?auto_481026 ?auto_481027 ?auto_481028 )
      ( MAKE-14PILE ?auto_481016 ?auto_481017 ?auto_481018 ?auto_481019 ?auto_481020 ?auto_481021 ?auto_481022 ?auto_481023 ?auto_481024 ?auto_481025 ?auto_481026 ?auto_481027 ?auto_481028 ?auto_481029 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_481074 - BLOCK
      ?auto_481075 - BLOCK
      ?auto_481076 - BLOCK
      ?auto_481077 - BLOCK
      ?auto_481078 - BLOCK
      ?auto_481079 - BLOCK
      ?auto_481080 - BLOCK
      ?auto_481081 - BLOCK
      ?auto_481082 - BLOCK
      ?auto_481083 - BLOCK
      ?auto_481084 - BLOCK
      ?auto_481085 - BLOCK
      ?auto_481086 - BLOCK
      ?auto_481087 - BLOCK
    )
    :vars
    (
      ?auto_481088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_481087 ?auto_481088 ) ( ON-TABLE ?auto_481074 ) ( ON ?auto_481075 ?auto_481074 ) ( ON ?auto_481076 ?auto_481075 ) ( ON ?auto_481077 ?auto_481076 ) ( ON ?auto_481078 ?auto_481077 ) ( ON ?auto_481079 ?auto_481078 ) ( ON ?auto_481080 ?auto_481079 ) ( ON ?auto_481081 ?auto_481080 ) ( ON ?auto_481082 ?auto_481081 ) ( ON ?auto_481083 ?auto_481082 ) ( ON ?auto_481084 ?auto_481083 ) ( not ( = ?auto_481074 ?auto_481075 ) ) ( not ( = ?auto_481074 ?auto_481076 ) ) ( not ( = ?auto_481074 ?auto_481077 ) ) ( not ( = ?auto_481074 ?auto_481078 ) ) ( not ( = ?auto_481074 ?auto_481079 ) ) ( not ( = ?auto_481074 ?auto_481080 ) ) ( not ( = ?auto_481074 ?auto_481081 ) ) ( not ( = ?auto_481074 ?auto_481082 ) ) ( not ( = ?auto_481074 ?auto_481083 ) ) ( not ( = ?auto_481074 ?auto_481084 ) ) ( not ( = ?auto_481074 ?auto_481085 ) ) ( not ( = ?auto_481074 ?auto_481086 ) ) ( not ( = ?auto_481074 ?auto_481087 ) ) ( not ( = ?auto_481074 ?auto_481088 ) ) ( not ( = ?auto_481075 ?auto_481076 ) ) ( not ( = ?auto_481075 ?auto_481077 ) ) ( not ( = ?auto_481075 ?auto_481078 ) ) ( not ( = ?auto_481075 ?auto_481079 ) ) ( not ( = ?auto_481075 ?auto_481080 ) ) ( not ( = ?auto_481075 ?auto_481081 ) ) ( not ( = ?auto_481075 ?auto_481082 ) ) ( not ( = ?auto_481075 ?auto_481083 ) ) ( not ( = ?auto_481075 ?auto_481084 ) ) ( not ( = ?auto_481075 ?auto_481085 ) ) ( not ( = ?auto_481075 ?auto_481086 ) ) ( not ( = ?auto_481075 ?auto_481087 ) ) ( not ( = ?auto_481075 ?auto_481088 ) ) ( not ( = ?auto_481076 ?auto_481077 ) ) ( not ( = ?auto_481076 ?auto_481078 ) ) ( not ( = ?auto_481076 ?auto_481079 ) ) ( not ( = ?auto_481076 ?auto_481080 ) ) ( not ( = ?auto_481076 ?auto_481081 ) ) ( not ( = ?auto_481076 ?auto_481082 ) ) ( not ( = ?auto_481076 ?auto_481083 ) ) ( not ( = ?auto_481076 ?auto_481084 ) ) ( not ( = ?auto_481076 ?auto_481085 ) ) ( not ( = ?auto_481076 ?auto_481086 ) ) ( not ( = ?auto_481076 ?auto_481087 ) ) ( not ( = ?auto_481076 ?auto_481088 ) ) ( not ( = ?auto_481077 ?auto_481078 ) ) ( not ( = ?auto_481077 ?auto_481079 ) ) ( not ( = ?auto_481077 ?auto_481080 ) ) ( not ( = ?auto_481077 ?auto_481081 ) ) ( not ( = ?auto_481077 ?auto_481082 ) ) ( not ( = ?auto_481077 ?auto_481083 ) ) ( not ( = ?auto_481077 ?auto_481084 ) ) ( not ( = ?auto_481077 ?auto_481085 ) ) ( not ( = ?auto_481077 ?auto_481086 ) ) ( not ( = ?auto_481077 ?auto_481087 ) ) ( not ( = ?auto_481077 ?auto_481088 ) ) ( not ( = ?auto_481078 ?auto_481079 ) ) ( not ( = ?auto_481078 ?auto_481080 ) ) ( not ( = ?auto_481078 ?auto_481081 ) ) ( not ( = ?auto_481078 ?auto_481082 ) ) ( not ( = ?auto_481078 ?auto_481083 ) ) ( not ( = ?auto_481078 ?auto_481084 ) ) ( not ( = ?auto_481078 ?auto_481085 ) ) ( not ( = ?auto_481078 ?auto_481086 ) ) ( not ( = ?auto_481078 ?auto_481087 ) ) ( not ( = ?auto_481078 ?auto_481088 ) ) ( not ( = ?auto_481079 ?auto_481080 ) ) ( not ( = ?auto_481079 ?auto_481081 ) ) ( not ( = ?auto_481079 ?auto_481082 ) ) ( not ( = ?auto_481079 ?auto_481083 ) ) ( not ( = ?auto_481079 ?auto_481084 ) ) ( not ( = ?auto_481079 ?auto_481085 ) ) ( not ( = ?auto_481079 ?auto_481086 ) ) ( not ( = ?auto_481079 ?auto_481087 ) ) ( not ( = ?auto_481079 ?auto_481088 ) ) ( not ( = ?auto_481080 ?auto_481081 ) ) ( not ( = ?auto_481080 ?auto_481082 ) ) ( not ( = ?auto_481080 ?auto_481083 ) ) ( not ( = ?auto_481080 ?auto_481084 ) ) ( not ( = ?auto_481080 ?auto_481085 ) ) ( not ( = ?auto_481080 ?auto_481086 ) ) ( not ( = ?auto_481080 ?auto_481087 ) ) ( not ( = ?auto_481080 ?auto_481088 ) ) ( not ( = ?auto_481081 ?auto_481082 ) ) ( not ( = ?auto_481081 ?auto_481083 ) ) ( not ( = ?auto_481081 ?auto_481084 ) ) ( not ( = ?auto_481081 ?auto_481085 ) ) ( not ( = ?auto_481081 ?auto_481086 ) ) ( not ( = ?auto_481081 ?auto_481087 ) ) ( not ( = ?auto_481081 ?auto_481088 ) ) ( not ( = ?auto_481082 ?auto_481083 ) ) ( not ( = ?auto_481082 ?auto_481084 ) ) ( not ( = ?auto_481082 ?auto_481085 ) ) ( not ( = ?auto_481082 ?auto_481086 ) ) ( not ( = ?auto_481082 ?auto_481087 ) ) ( not ( = ?auto_481082 ?auto_481088 ) ) ( not ( = ?auto_481083 ?auto_481084 ) ) ( not ( = ?auto_481083 ?auto_481085 ) ) ( not ( = ?auto_481083 ?auto_481086 ) ) ( not ( = ?auto_481083 ?auto_481087 ) ) ( not ( = ?auto_481083 ?auto_481088 ) ) ( not ( = ?auto_481084 ?auto_481085 ) ) ( not ( = ?auto_481084 ?auto_481086 ) ) ( not ( = ?auto_481084 ?auto_481087 ) ) ( not ( = ?auto_481084 ?auto_481088 ) ) ( not ( = ?auto_481085 ?auto_481086 ) ) ( not ( = ?auto_481085 ?auto_481087 ) ) ( not ( = ?auto_481085 ?auto_481088 ) ) ( not ( = ?auto_481086 ?auto_481087 ) ) ( not ( = ?auto_481086 ?auto_481088 ) ) ( not ( = ?auto_481087 ?auto_481088 ) ) ( ON ?auto_481086 ?auto_481087 ) ( CLEAR ?auto_481084 ) ( ON ?auto_481085 ?auto_481086 ) ( CLEAR ?auto_481085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_481074 ?auto_481075 ?auto_481076 ?auto_481077 ?auto_481078 ?auto_481079 ?auto_481080 ?auto_481081 ?auto_481082 ?auto_481083 ?auto_481084 ?auto_481085 )
      ( MAKE-14PILE ?auto_481074 ?auto_481075 ?auto_481076 ?auto_481077 ?auto_481078 ?auto_481079 ?auto_481080 ?auto_481081 ?auto_481082 ?auto_481083 ?auto_481084 ?auto_481085 ?auto_481086 ?auto_481087 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_481132 - BLOCK
      ?auto_481133 - BLOCK
      ?auto_481134 - BLOCK
      ?auto_481135 - BLOCK
      ?auto_481136 - BLOCK
      ?auto_481137 - BLOCK
      ?auto_481138 - BLOCK
      ?auto_481139 - BLOCK
      ?auto_481140 - BLOCK
      ?auto_481141 - BLOCK
      ?auto_481142 - BLOCK
      ?auto_481143 - BLOCK
      ?auto_481144 - BLOCK
      ?auto_481145 - BLOCK
    )
    :vars
    (
      ?auto_481146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_481145 ?auto_481146 ) ( ON-TABLE ?auto_481132 ) ( ON ?auto_481133 ?auto_481132 ) ( ON ?auto_481134 ?auto_481133 ) ( ON ?auto_481135 ?auto_481134 ) ( ON ?auto_481136 ?auto_481135 ) ( ON ?auto_481137 ?auto_481136 ) ( ON ?auto_481138 ?auto_481137 ) ( ON ?auto_481139 ?auto_481138 ) ( ON ?auto_481140 ?auto_481139 ) ( ON ?auto_481141 ?auto_481140 ) ( not ( = ?auto_481132 ?auto_481133 ) ) ( not ( = ?auto_481132 ?auto_481134 ) ) ( not ( = ?auto_481132 ?auto_481135 ) ) ( not ( = ?auto_481132 ?auto_481136 ) ) ( not ( = ?auto_481132 ?auto_481137 ) ) ( not ( = ?auto_481132 ?auto_481138 ) ) ( not ( = ?auto_481132 ?auto_481139 ) ) ( not ( = ?auto_481132 ?auto_481140 ) ) ( not ( = ?auto_481132 ?auto_481141 ) ) ( not ( = ?auto_481132 ?auto_481142 ) ) ( not ( = ?auto_481132 ?auto_481143 ) ) ( not ( = ?auto_481132 ?auto_481144 ) ) ( not ( = ?auto_481132 ?auto_481145 ) ) ( not ( = ?auto_481132 ?auto_481146 ) ) ( not ( = ?auto_481133 ?auto_481134 ) ) ( not ( = ?auto_481133 ?auto_481135 ) ) ( not ( = ?auto_481133 ?auto_481136 ) ) ( not ( = ?auto_481133 ?auto_481137 ) ) ( not ( = ?auto_481133 ?auto_481138 ) ) ( not ( = ?auto_481133 ?auto_481139 ) ) ( not ( = ?auto_481133 ?auto_481140 ) ) ( not ( = ?auto_481133 ?auto_481141 ) ) ( not ( = ?auto_481133 ?auto_481142 ) ) ( not ( = ?auto_481133 ?auto_481143 ) ) ( not ( = ?auto_481133 ?auto_481144 ) ) ( not ( = ?auto_481133 ?auto_481145 ) ) ( not ( = ?auto_481133 ?auto_481146 ) ) ( not ( = ?auto_481134 ?auto_481135 ) ) ( not ( = ?auto_481134 ?auto_481136 ) ) ( not ( = ?auto_481134 ?auto_481137 ) ) ( not ( = ?auto_481134 ?auto_481138 ) ) ( not ( = ?auto_481134 ?auto_481139 ) ) ( not ( = ?auto_481134 ?auto_481140 ) ) ( not ( = ?auto_481134 ?auto_481141 ) ) ( not ( = ?auto_481134 ?auto_481142 ) ) ( not ( = ?auto_481134 ?auto_481143 ) ) ( not ( = ?auto_481134 ?auto_481144 ) ) ( not ( = ?auto_481134 ?auto_481145 ) ) ( not ( = ?auto_481134 ?auto_481146 ) ) ( not ( = ?auto_481135 ?auto_481136 ) ) ( not ( = ?auto_481135 ?auto_481137 ) ) ( not ( = ?auto_481135 ?auto_481138 ) ) ( not ( = ?auto_481135 ?auto_481139 ) ) ( not ( = ?auto_481135 ?auto_481140 ) ) ( not ( = ?auto_481135 ?auto_481141 ) ) ( not ( = ?auto_481135 ?auto_481142 ) ) ( not ( = ?auto_481135 ?auto_481143 ) ) ( not ( = ?auto_481135 ?auto_481144 ) ) ( not ( = ?auto_481135 ?auto_481145 ) ) ( not ( = ?auto_481135 ?auto_481146 ) ) ( not ( = ?auto_481136 ?auto_481137 ) ) ( not ( = ?auto_481136 ?auto_481138 ) ) ( not ( = ?auto_481136 ?auto_481139 ) ) ( not ( = ?auto_481136 ?auto_481140 ) ) ( not ( = ?auto_481136 ?auto_481141 ) ) ( not ( = ?auto_481136 ?auto_481142 ) ) ( not ( = ?auto_481136 ?auto_481143 ) ) ( not ( = ?auto_481136 ?auto_481144 ) ) ( not ( = ?auto_481136 ?auto_481145 ) ) ( not ( = ?auto_481136 ?auto_481146 ) ) ( not ( = ?auto_481137 ?auto_481138 ) ) ( not ( = ?auto_481137 ?auto_481139 ) ) ( not ( = ?auto_481137 ?auto_481140 ) ) ( not ( = ?auto_481137 ?auto_481141 ) ) ( not ( = ?auto_481137 ?auto_481142 ) ) ( not ( = ?auto_481137 ?auto_481143 ) ) ( not ( = ?auto_481137 ?auto_481144 ) ) ( not ( = ?auto_481137 ?auto_481145 ) ) ( not ( = ?auto_481137 ?auto_481146 ) ) ( not ( = ?auto_481138 ?auto_481139 ) ) ( not ( = ?auto_481138 ?auto_481140 ) ) ( not ( = ?auto_481138 ?auto_481141 ) ) ( not ( = ?auto_481138 ?auto_481142 ) ) ( not ( = ?auto_481138 ?auto_481143 ) ) ( not ( = ?auto_481138 ?auto_481144 ) ) ( not ( = ?auto_481138 ?auto_481145 ) ) ( not ( = ?auto_481138 ?auto_481146 ) ) ( not ( = ?auto_481139 ?auto_481140 ) ) ( not ( = ?auto_481139 ?auto_481141 ) ) ( not ( = ?auto_481139 ?auto_481142 ) ) ( not ( = ?auto_481139 ?auto_481143 ) ) ( not ( = ?auto_481139 ?auto_481144 ) ) ( not ( = ?auto_481139 ?auto_481145 ) ) ( not ( = ?auto_481139 ?auto_481146 ) ) ( not ( = ?auto_481140 ?auto_481141 ) ) ( not ( = ?auto_481140 ?auto_481142 ) ) ( not ( = ?auto_481140 ?auto_481143 ) ) ( not ( = ?auto_481140 ?auto_481144 ) ) ( not ( = ?auto_481140 ?auto_481145 ) ) ( not ( = ?auto_481140 ?auto_481146 ) ) ( not ( = ?auto_481141 ?auto_481142 ) ) ( not ( = ?auto_481141 ?auto_481143 ) ) ( not ( = ?auto_481141 ?auto_481144 ) ) ( not ( = ?auto_481141 ?auto_481145 ) ) ( not ( = ?auto_481141 ?auto_481146 ) ) ( not ( = ?auto_481142 ?auto_481143 ) ) ( not ( = ?auto_481142 ?auto_481144 ) ) ( not ( = ?auto_481142 ?auto_481145 ) ) ( not ( = ?auto_481142 ?auto_481146 ) ) ( not ( = ?auto_481143 ?auto_481144 ) ) ( not ( = ?auto_481143 ?auto_481145 ) ) ( not ( = ?auto_481143 ?auto_481146 ) ) ( not ( = ?auto_481144 ?auto_481145 ) ) ( not ( = ?auto_481144 ?auto_481146 ) ) ( not ( = ?auto_481145 ?auto_481146 ) ) ( ON ?auto_481144 ?auto_481145 ) ( ON ?auto_481143 ?auto_481144 ) ( CLEAR ?auto_481141 ) ( ON ?auto_481142 ?auto_481143 ) ( CLEAR ?auto_481142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_481132 ?auto_481133 ?auto_481134 ?auto_481135 ?auto_481136 ?auto_481137 ?auto_481138 ?auto_481139 ?auto_481140 ?auto_481141 ?auto_481142 )
      ( MAKE-14PILE ?auto_481132 ?auto_481133 ?auto_481134 ?auto_481135 ?auto_481136 ?auto_481137 ?auto_481138 ?auto_481139 ?auto_481140 ?auto_481141 ?auto_481142 ?auto_481143 ?auto_481144 ?auto_481145 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_481190 - BLOCK
      ?auto_481191 - BLOCK
      ?auto_481192 - BLOCK
      ?auto_481193 - BLOCK
      ?auto_481194 - BLOCK
      ?auto_481195 - BLOCK
      ?auto_481196 - BLOCK
      ?auto_481197 - BLOCK
      ?auto_481198 - BLOCK
      ?auto_481199 - BLOCK
      ?auto_481200 - BLOCK
      ?auto_481201 - BLOCK
      ?auto_481202 - BLOCK
      ?auto_481203 - BLOCK
    )
    :vars
    (
      ?auto_481204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_481203 ?auto_481204 ) ( ON-TABLE ?auto_481190 ) ( ON ?auto_481191 ?auto_481190 ) ( ON ?auto_481192 ?auto_481191 ) ( ON ?auto_481193 ?auto_481192 ) ( ON ?auto_481194 ?auto_481193 ) ( ON ?auto_481195 ?auto_481194 ) ( ON ?auto_481196 ?auto_481195 ) ( ON ?auto_481197 ?auto_481196 ) ( ON ?auto_481198 ?auto_481197 ) ( not ( = ?auto_481190 ?auto_481191 ) ) ( not ( = ?auto_481190 ?auto_481192 ) ) ( not ( = ?auto_481190 ?auto_481193 ) ) ( not ( = ?auto_481190 ?auto_481194 ) ) ( not ( = ?auto_481190 ?auto_481195 ) ) ( not ( = ?auto_481190 ?auto_481196 ) ) ( not ( = ?auto_481190 ?auto_481197 ) ) ( not ( = ?auto_481190 ?auto_481198 ) ) ( not ( = ?auto_481190 ?auto_481199 ) ) ( not ( = ?auto_481190 ?auto_481200 ) ) ( not ( = ?auto_481190 ?auto_481201 ) ) ( not ( = ?auto_481190 ?auto_481202 ) ) ( not ( = ?auto_481190 ?auto_481203 ) ) ( not ( = ?auto_481190 ?auto_481204 ) ) ( not ( = ?auto_481191 ?auto_481192 ) ) ( not ( = ?auto_481191 ?auto_481193 ) ) ( not ( = ?auto_481191 ?auto_481194 ) ) ( not ( = ?auto_481191 ?auto_481195 ) ) ( not ( = ?auto_481191 ?auto_481196 ) ) ( not ( = ?auto_481191 ?auto_481197 ) ) ( not ( = ?auto_481191 ?auto_481198 ) ) ( not ( = ?auto_481191 ?auto_481199 ) ) ( not ( = ?auto_481191 ?auto_481200 ) ) ( not ( = ?auto_481191 ?auto_481201 ) ) ( not ( = ?auto_481191 ?auto_481202 ) ) ( not ( = ?auto_481191 ?auto_481203 ) ) ( not ( = ?auto_481191 ?auto_481204 ) ) ( not ( = ?auto_481192 ?auto_481193 ) ) ( not ( = ?auto_481192 ?auto_481194 ) ) ( not ( = ?auto_481192 ?auto_481195 ) ) ( not ( = ?auto_481192 ?auto_481196 ) ) ( not ( = ?auto_481192 ?auto_481197 ) ) ( not ( = ?auto_481192 ?auto_481198 ) ) ( not ( = ?auto_481192 ?auto_481199 ) ) ( not ( = ?auto_481192 ?auto_481200 ) ) ( not ( = ?auto_481192 ?auto_481201 ) ) ( not ( = ?auto_481192 ?auto_481202 ) ) ( not ( = ?auto_481192 ?auto_481203 ) ) ( not ( = ?auto_481192 ?auto_481204 ) ) ( not ( = ?auto_481193 ?auto_481194 ) ) ( not ( = ?auto_481193 ?auto_481195 ) ) ( not ( = ?auto_481193 ?auto_481196 ) ) ( not ( = ?auto_481193 ?auto_481197 ) ) ( not ( = ?auto_481193 ?auto_481198 ) ) ( not ( = ?auto_481193 ?auto_481199 ) ) ( not ( = ?auto_481193 ?auto_481200 ) ) ( not ( = ?auto_481193 ?auto_481201 ) ) ( not ( = ?auto_481193 ?auto_481202 ) ) ( not ( = ?auto_481193 ?auto_481203 ) ) ( not ( = ?auto_481193 ?auto_481204 ) ) ( not ( = ?auto_481194 ?auto_481195 ) ) ( not ( = ?auto_481194 ?auto_481196 ) ) ( not ( = ?auto_481194 ?auto_481197 ) ) ( not ( = ?auto_481194 ?auto_481198 ) ) ( not ( = ?auto_481194 ?auto_481199 ) ) ( not ( = ?auto_481194 ?auto_481200 ) ) ( not ( = ?auto_481194 ?auto_481201 ) ) ( not ( = ?auto_481194 ?auto_481202 ) ) ( not ( = ?auto_481194 ?auto_481203 ) ) ( not ( = ?auto_481194 ?auto_481204 ) ) ( not ( = ?auto_481195 ?auto_481196 ) ) ( not ( = ?auto_481195 ?auto_481197 ) ) ( not ( = ?auto_481195 ?auto_481198 ) ) ( not ( = ?auto_481195 ?auto_481199 ) ) ( not ( = ?auto_481195 ?auto_481200 ) ) ( not ( = ?auto_481195 ?auto_481201 ) ) ( not ( = ?auto_481195 ?auto_481202 ) ) ( not ( = ?auto_481195 ?auto_481203 ) ) ( not ( = ?auto_481195 ?auto_481204 ) ) ( not ( = ?auto_481196 ?auto_481197 ) ) ( not ( = ?auto_481196 ?auto_481198 ) ) ( not ( = ?auto_481196 ?auto_481199 ) ) ( not ( = ?auto_481196 ?auto_481200 ) ) ( not ( = ?auto_481196 ?auto_481201 ) ) ( not ( = ?auto_481196 ?auto_481202 ) ) ( not ( = ?auto_481196 ?auto_481203 ) ) ( not ( = ?auto_481196 ?auto_481204 ) ) ( not ( = ?auto_481197 ?auto_481198 ) ) ( not ( = ?auto_481197 ?auto_481199 ) ) ( not ( = ?auto_481197 ?auto_481200 ) ) ( not ( = ?auto_481197 ?auto_481201 ) ) ( not ( = ?auto_481197 ?auto_481202 ) ) ( not ( = ?auto_481197 ?auto_481203 ) ) ( not ( = ?auto_481197 ?auto_481204 ) ) ( not ( = ?auto_481198 ?auto_481199 ) ) ( not ( = ?auto_481198 ?auto_481200 ) ) ( not ( = ?auto_481198 ?auto_481201 ) ) ( not ( = ?auto_481198 ?auto_481202 ) ) ( not ( = ?auto_481198 ?auto_481203 ) ) ( not ( = ?auto_481198 ?auto_481204 ) ) ( not ( = ?auto_481199 ?auto_481200 ) ) ( not ( = ?auto_481199 ?auto_481201 ) ) ( not ( = ?auto_481199 ?auto_481202 ) ) ( not ( = ?auto_481199 ?auto_481203 ) ) ( not ( = ?auto_481199 ?auto_481204 ) ) ( not ( = ?auto_481200 ?auto_481201 ) ) ( not ( = ?auto_481200 ?auto_481202 ) ) ( not ( = ?auto_481200 ?auto_481203 ) ) ( not ( = ?auto_481200 ?auto_481204 ) ) ( not ( = ?auto_481201 ?auto_481202 ) ) ( not ( = ?auto_481201 ?auto_481203 ) ) ( not ( = ?auto_481201 ?auto_481204 ) ) ( not ( = ?auto_481202 ?auto_481203 ) ) ( not ( = ?auto_481202 ?auto_481204 ) ) ( not ( = ?auto_481203 ?auto_481204 ) ) ( ON ?auto_481202 ?auto_481203 ) ( ON ?auto_481201 ?auto_481202 ) ( ON ?auto_481200 ?auto_481201 ) ( CLEAR ?auto_481198 ) ( ON ?auto_481199 ?auto_481200 ) ( CLEAR ?auto_481199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_481190 ?auto_481191 ?auto_481192 ?auto_481193 ?auto_481194 ?auto_481195 ?auto_481196 ?auto_481197 ?auto_481198 ?auto_481199 )
      ( MAKE-14PILE ?auto_481190 ?auto_481191 ?auto_481192 ?auto_481193 ?auto_481194 ?auto_481195 ?auto_481196 ?auto_481197 ?auto_481198 ?auto_481199 ?auto_481200 ?auto_481201 ?auto_481202 ?auto_481203 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_481248 - BLOCK
      ?auto_481249 - BLOCK
      ?auto_481250 - BLOCK
      ?auto_481251 - BLOCK
      ?auto_481252 - BLOCK
      ?auto_481253 - BLOCK
      ?auto_481254 - BLOCK
      ?auto_481255 - BLOCK
      ?auto_481256 - BLOCK
      ?auto_481257 - BLOCK
      ?auto_481258 - BLOCK
      ?auto_481259 - BLOCK
      ?auto_481260 - BLOCK
      ?auto_481261 - BLOCK
    )
    :vars
    (
      ?auto_481262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_481261 ?auto_481262 ) ( ON-TABLE ?auto_481248 ) ( ON ?auto_481249 ?auto_481248 ) ( ON ?auto_481250 ?auto_481249 ) ( ON ?auto_481251 ?auto_481250 ) ( ON ?auto_481252 ?auto_481251 ) ( ON ?auto_481253 ?auto_481252 ) ( ON ?auto_481254 ?auto_481253 ) ( ON ?auto_481255 ?auto_481254 ) ( not ( = ?auto_481248 ?auto_481249 ) ) ( not ( = ?auto_481248 ?auto_481250 ) ) ( not ( = ?auto_481248 ?auto_481251 ) ) ( not ( = ?auto_481248 ?auto_481252 ) ) ( not ( = ?auto_481248 ?auto_481253 ) ) ( not ( = ?auto_481248 ?auto_481254 ) ) ( not ( = ?auto_481248 ?auto_481255 ) ) ( not ( = ?auto_481248 ?auto_481256 ) ) ( not ( = ?auto_481248 ?auto_481257 ) ) ( not ( = ?auto_481248 ?auto_481258 ) ) ( not ( = ?auto_481248 ?auto_481259 ) ) ( not ( = ?auto_481248 ?auto_481260 ) ) ( not ( = ?auto_481248 ?auto_481261 ) ) ( not ( = ?auto_481248 ?auto_481262 ) ) ( not ( = ?auto_481249 ?auto_481250 ) ) ( not ( = ?auto_481249 ?auto_481251 ) ) ( not ( = ?auto_481249 ?auto_481252 ) ) ( not ( = ?auto_481249 ?auto_481253 ) ) ( not ( = ?auto_481249 ?auto_481254 ) ) ( not ( = ?auto_481249 ?auto_481255 ) ) ( not ( = ?auto_481249 ?auto_481256 ) ) ( not ( = ?auto_481249 ?auto_481257 ) ) ( not ( = ?auto_481249 ?auto_481258 ) ) ( not ( = ?auto_481249 ?auto_481259 ) ) ( not ( = ?auto_481249 ?auto_481260 ) ) ( not ( = ?auto_481249 ?auto_481261 ) ) ( not ( = ?auto_481249 ?auto_481262 ) ) ( not ( = ?auto_481250 ?auto_481251 ) ) ( not ( = ?auto_481250 ?auto_481252 ) ) ( not ( = ?auto_481250 ?auto_481253 ) ) ( not ( = ?auto_481250 ?auto_481254 ) ) ( not ( = ?auto_481250 ?auto_481255 ) ) ( not ( = ?auto_481250 ?auto_481256 ) ) ( not ( = ?auto_481250 ?auto_481257 ) ) ( not ( = ?auto_481250 ?auto_481258 ) ) ( not ( = ?auto_481250 ?auto_481259 ) ) ( not ( = ?auto_481250 ?auto_481260 ) ) ( not ( = ?auto_481250 ?auto_481261 ) ) ( not ( = ?auto_481250 ?auto_481262 ) ) ( not ( = ?auto_481251 ?auto_481252 ) ) ( not ( = ?auto_481251 ?auto_481253 ) ) ( not ( = ?auto_481251 ?auto_481254 ) ) ( not ( = ?auto_481251 ?auto_481255 ) ) ( not ( = ?auto_481251 ?auto_481256 ) ) ( not ( = ?auto_481251 ?auto_481257 ) ) ( not ( = ?auto_481251 ?auto_481258 ) ) ( not ( = ?auto_481251 ?auto_481259 ) ) ( not ( = ?auto_481251 ?auto_481260 ) ) ( not ( = ?auto_481251 ?auto_481261 ) ) ( not ( = ?auto_481251 ?auto_481262 ) ) ( not ( = ?auto_481252 ?auto_481253 ) ) ( not ( = ?auto_481252 ?auto_481254 ) ) ( not ( = ?auto_481252 ?auto_481255 ) ) ( not ( = ?auto_481252 ?auto_481256 ) ) ( not ( = ?auto_481252 ?auto_481257 ) ) ( not ( = ?auto_481252 ?auto_481258 ) ) ( not ( = ?auto_481252 ?auto_481259 ) ) ( not ( = ?auto_481252 ?auto_481260 ) ) ( not ( = ?auto_481252 ?auto_481261 ) ) ( not ( = ?auto_481252 ?auto_481262 ) ) ( not ( = ?auto_481253 ?auto_481254 ) ) ( not ( = ?auto_481253 ?auto_481255 ) ) ( not ( = ?auto_481253 ?auto_481256 ) ) ( not ( = ?auto_481253 ?auto_481257 ) ) ( not ( = ?auto_481253 ?auto_481258 ) ) ( not ( = ?auto_481253 ?auto_481259 ) ) ( not ( = ?auto_481253 ?auto_481260 ) ) ( not ( = ?auto_481253 ?auto_481261 ) ) ( not ( = ?auto_481253 ?auto_481262 ) ) ( not ( = ?auto_481254 ?auto_481255 ) ) ( not ( = ?auto_481254 ?auto_481256 ) ) ( not ( = ?auto_481254 ?auto_481257 ) ) ( not ( = ?auto_481254 ?auto_481258 ) ) ( not ( = ?auto_481254 ?auto_481259 ) ) ( not ( = ?auto_481254 ?auto_481260 ) ) ( not ( = ?auto_481254 ?auto_481261 ) ) ( not ( = ?auto_481254 ?auto_481262 ) ) ( not ( = ?auto_481255 ?auto_481256 ) ) ( not ( = ?auto_481255 ?auto_481257 ) ) ( not ( = ?auto_481255 ?auto_481258 ) ) ( not ( = ?auto_481255 ?auto_481259 ) ) ( not ( = ?auto_481255 ?auto_481260 ) ) ( not ( = ?auto_481255 ?auto_481261 ) ) ( not ( = ?auto_481255 ?auto_481262 ) ) ( not ( = ?auto_481256 ?auto_481257 ) ) ( not ( = ?auto_481256 ?auto_481258 ) ) ( not ( = ?auto_481256 ?auto_481259 ) ) ( not ( = ?auto_481256 ?auto_481260 ) ) ( not ( = ?auto_481256 ?auto_481261 ) ) ( not ( = ?auto_481256 ?auto_481262 ) ) ( not ( = ?auto_481257 ?auto_481258 ) ) ( not ( = ?auto_481257 ?auto_481259 ) ) ( not ( = ?auto_481257 ?auto_481260 ) ) ( not ( = ?auto_481257 ?auto_481261 ) ) ( not ( = ?auto_481257 ?auto_481262 ) ) ( not ( = ?auto_481258 ?auto_481259 ) ) ( not ( = ?auto_481258 ?auto_481260 ) ) ( not ( = ?auto_481258 ?auto_481261 ) ) ( not ( = ?auto_481258 ?auto_481262 ) ) ( not ( = ?auto_481259 ?auto_481260 ) ) ( not ( = ?auto_481259 ?auto_481261 ) ) ( not ( = ?auto_481259 ?auto_481262 ) ) ( not ( = ?auto_481260 ?auto_481261 ) ) ( not ( = ?auto_481260 ?auto_481262 ) ) ( not ( = ?auto_481261 ?auto_481262 ) ) ( ON ?auto_481260 ?auto_481261 ) ( ON ?auto_481259 ?auto_481260 ) ( ON ?auto_481258 ?auto_481259 ) ( ON ?auto_481257 ?auto_481258 ) ( CLEAR ?auto_481255 ) ( ON ?auto_481256 ?auto_481257 ) ( CLEAR ?auto_481256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_481248 ?auto_481249 ?auto_481250 ?auto_481251 ?auto_481252 ?auto_481253 ?auto_481254 ?auto_481255 ?auto_481256 )
      ( MAKE-14PILE ?auto_481248 ?auto_481249 ?auto_481250 ?auto_481251 ?auto_481252 ?auto_481253 ?auto_481254 ?auto_481255 ?auto_481256 ?auto_481257 ?auto_481258 ?auto_481259 ?auto_481260 ?auto_481261 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_481306 - BLOCK
      ?auto_481307 - BLOCK
      ?auto_481308 - BLOCK
      ?auto_481309 - BLOCK
      ?auto_481310 - BLOCK
      ?auto_481311 - BLOCK
      ?auto_481312 - BLOCK
      ?auto_481313 - BLOCK
      ?auto_481314 - BLOCK
      ?auto_481315 - BLOCK
      ?auto_481316 - BLOCK
      ?auto_481317 - BLOCK
      ?auto_481318 - BLOCK
      ?auto_481319 - BLOCK
    )
    :vars
    (
      ?auto_481320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_481319 ?auto_481320 ) ( ON-TABLE ?auto_481306 ) ( ON ?auto_481307 ?auto_481306 ) ( ON ?auto_481308 ?auto_481307 ) ( ON ?auto_481309 ?auto_481308 ) ( ON ?auto_481310 ?auto_481309 ) ( ON ?auto_481311 ?auto_481310 ) ( ON ?auto_481312 ?auto_481311 ) ( not ( = ?auto_481306 ?auto_481307 ) ) ( not ( = ?auto_481306 ?auto_481308 ) ) ( not ( = ?auto_481306 ?auto_481309 ) ) ( not ( = ?auto_481306 ?auto_481310 ) ) ( not ( = ?auto_481306 ?auto_481311 ) ) ( not ( = ?auto_481306 ?auto_481312 ) ) ( not ( = ?auto_481306 ?auto_481313 ) ) ( not ( = ?auto_481306 ?auto_481314 ) ) ( not ( = ?auto_481306 ?auto_481315 ) ) ( not ( = ?auto_481306 ?auto_481316 ) ) ( not ( = ?auto_481306 ?auto_481317 ) ) ( not ( = ?auto_481306 ?auto_481318 ) ) ( not ( = ?auto_481306 ?auto_481319 ) ) ( not ( = ?auto_481306 ?auto_481320 ) ) ( not ( = ?auto_481307 ?auto_481308 ) ) ( not ( = ?auto_481307 ?auto_481309 ) ) ( not ( = ?auto_481307 ?auto_481310 ) ) ( not ( = ?auto_481307 ?auto_481311 ) ) ( not ( = ?auto_481307 ?auto_481312 ) ) ( not ( = ?auto_481307 ?auto_481313 ) ) ( not ( = ?auto_481307 ?auto_481314 ) ) ( not ( = ?auto_481307 ?auto_481315 ) ) ( not ( = ?auto_481307 ?auto_481316 ) ) ( not ( = ?auto_481307 ?auto_481317 ) ) ( not ( = ?auto_481307 ?auto_481318 ) ) ( not ( = ?auto_481307 ?auto_481319 ) ) ( not ( = ?auto_481307 ?auto_481320 ) ) ( not ( = ?auto_481308 ?auto_481309 ) ) ( not ( = ?auto_481308 ?auto_481310 ) ) ( not ( = ?auto_481308 ?auto_481311 ) ) ( not ( = ?auto_481308 ?auto_481312 ) ) ( not ( = ?auto_481308 ?auto_481313 ) ) ( not ( = ?auto_481308 ?auto_481314 ) ) ( not ( = ?auto_481308 ?auto_481315 ) ) ( not ( = ?auto_481308 ?auto_481316 ) ) ( not ( = ?auto_481308 ?auto_481317 ) ) ( not ( = ?auto_481308 ?auto_481318 ) ) ( not ( = ?auto_481308 ?auto_481319 ) ) ( not ( = ?auto_481308 ?auto_481320 ) ) ( not ( = ?auto_481309 ?auto_481310 ) ) ( not ( = ?auto_481309 ?auto_481311 ) ) ( not ( = ?auto_481309 ?auto_481312 ) ) ( not ( = ?auto_481309 ?auto_481313 ) ) ( not ( = ?auto_481309 ?auto_481314 ) ) ( not ( = ?auto_481309 ?auto_481315 ) ) ( not ( = ?auto_481309 ?auto_481316 ) ) ( not ( = ?auto_481309 ?auto_481317 ) ) ( not ( = ?auto_481309 ?auto_481318 ) ) ( not ( = ?auto_481309 ?auto_481319 ) ) ( not ( = ?auto_481309 ?auto_481320 ) ) ( not ( = ?auto_481310 ?auto_481311 ) ) ( not ( = ?auto_481310 ?auto_481312 ) ) ( not ( = ?auto_481310 ?auto_481313 ) ) ( not ( = ?auto_481310 ?auto_481314 ) ) ( not ( = ?auto_481310 ?auto_481315 ) ) ( not ( = ?auto_481310 ?auto_481316 ) ) ( not ( = ?auto_481310 ?auto_481317 ) ) ( not ( = ?auto_481310 ?auto_481318 ) ) ( not ( = ?auto_481310 ?auto_481319 ) ) ( not ( = ?auto_481310 ?auto_481320 ) ) ( not ( = ?auto_481311 ?auto_481312 ) ) ( not ( = ?auto_481311 ?auto_481313 ) ) ( not ( = ?auto_481311 ?auto_481314 ) ) ( not ( = ?auto_481311 ?auto_481315 ) ) ( not ( = ?auto_481311 ?auto_481316 ) ) ( not ( = ?auto_481311 ?auto_481317 ) ) ( not ( = ?auto_481311 ?auto_481318 ) ) ( not ( = ?auto_481311 ?auto_481319 ) ) ( not ( = ?auto_481311 ?auto_481320 ) ) ( not ( = ?auto_481312 ?auto_481313 ) ) ( not ( = ?auto_481312 ?auto_481314 ) ) ( not ( = ?auto_481312 ?auto_481315 ) ) ( not ( = ?auto_481312 ?auto_481316 ) ) ( not ( = ?auto_481312 ?auto_481317 ) ) ( not ( = ?auto_481312 ?auto_481318 ) ) ( not ( = ?auto_481312 ?auto_481319 ) ) ( not ( = ?auto_481312 ?auto_481320 ) ) ( not ( = ?auto_481313 ?auto_481314 ) ) ( not ( = ?auto_481313 ?auto_481315 ) ) ( not ( = ?auto_481313 ?auto_481316 ) ) ( not ( = ?auto_481313 ?auto_481317 ) ) ( not ( = ?auto_481313 ?auto_481318 ) ) ( not ( = ?auto_481313 ?auto_481319 ) ) ( not ( = ?auto_481313 ?auto_481320 ) ) ( not ( = ?auto_481314 ?auto_481315 ) ) ( not ( = ?auto_481314 ?auto_481316 ) ) ( not ( = ?auto_481314 ?auto_481317 ) ) ( not ( = ?auto_481314 ?auto_481318 ) ) ( not ( = ?auto_481314 ?auto_481319 ) ) ( not ( = ?auto_481314 ?auto_481320 ) ) ( not ( = ?auto_481315 ?auto_481316 ) ) ( not ( = ?auto_481315 ?auto_481317 ) ) ( not ( = ?auto_481315 ?auto_481318 ) ) ( not ( = ?auto_481315 ?auto_481319 ) ) ( not ( = ?auto_481315 ?auto_481320 ) ) ( not ( = ?auto_481316 ?auto_481317 ) ) ( not ( = ?auto_481316 ?auto_481318 ) ) ( not ( = ?auto_481316 ?auto_481319 ) ) ( not ( = ?auto_481316 ?auto_481320 ) ) ( not ( = ?auto_481317 ?auto_481318 ) ) ( not ( = ?auto_481317 ?auto_481319 ) ) ( not ( = ?auto_481317 ?auto_481320 ) ) ( not ( = ?auto_481318 ?auto_481319 ) ) ( not ( = ?auto_481318 ?auto_481320 ) ) ( not ( = ?auto_481319 ?auto_481320 ) ) ( ON ?auto_481318 ?auto_481319 ) ( ON ?auto_481317 ?auto_481318 ) ( ON ?auto_481316 ?auto_481317 ) ( ON ?auto_481315 ?auto_481316 ) ( ON ?auto_481314 ?auto_481315 ) ( CLEAR ?auto_481312 ) ( ON ?auto_481313 ?auto_481314 ) ( CLEAR ?auto_481313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_481306 ?auto_481307 ?auto_481308 ?auto_481309 ?auto_481310 ?auto_481311 ?auto_481312 ?auto_481313 )
      ( MAKE-14PILE ?auto_481306 ?auto_481307 ?auto_481308 ?auto_481309 ?auto_481310 ?auto_481311 ?auto_481312 ?auto_481313 ?auto_481314 ?auto_481315 ?auto_481316 ?auto_481317 ?auto_481318 ?auto_481319 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_481364 - BLOCK
      ?auto_481365 - BLOCK
      ?auto_481366 - BLOCK
      ?auto_481367 - BLOCK
      ?auto_481368 - BLOCK
      ?auto_481369 - BLOCK
      ?auto_481370 - BLOCK
      ?auto_481371 - BLOCK
      ?auto_481372 - BLOCK
      ?auto_481373 - BLOCK
      ?auto_481374 - BLOCK
      ?auto_481375 - BLOCK
      ?auto_481376 - BLOCK
      ?auto_481377 - BLOCK
    )
    :vars
    (
      ?auto_481378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_481377 ?auto_481378 ) ( ON-TABLE ?auto_481364 ) ( ON ?auto_481365 ?auto_481364 ) ( ON ?auto_481366 ?auto_481365 ) ( ON ?auto_481367 ?auto_481366 ) ( ON ?auto_481368 ?auto_481367 ) ( ON ?auto_481369 ?auto_481368 ) ( not ( = ?auto_481364 ?auto_481365 ) ) ( not ( = ?auto_481364 ?auto_481366 ) ) ( not ( = ?auto_481364 ?auto_481367 ) ) ( not ( = ?auto_481364 ?auto_481368 ) ) ( not ( = ?auto_481364 ?auto_481369 ) ) ( not ( = ?auto_481364 ?auto_481370 ) ) ( not ( = ?auto_481364 ?auto_481371 ) ) ( not ( = ?auto_481364 ?auto_481372 ) ) ( not ( = ?auto_481364 ?auto_481373 ) ) ( not ( = ?auto_481364 ?auto_481374 ) ) ( not ( = ?auto_481364 ?auto_481375 ) ) ( not ( = ?auto_481364 ?auto_481376 ) ) ( not ( = ?auto_481364 ?auto_481377 ) ) ( not ( = ?auto_481364 ?auto_481378 ) ) ( not ( = ?auto_481365 ?auto_481366 ) ) ( not ( = ?auto_481365 ?auto_481367 ) ) ( not ( = ?auto_481365 ?auto_481368 ) ) ( not ( = ?auto_481365 ?auto_481369 ) ) ( not ( = ?auto_481365 ?auto_481370 ) ) ( not ( = ?auto_481365 ?auto_481371 ) ) ( not ( = ?auto_481365 ?auto_481372 ) ) ( not ( = ?auto_481365 ?auto_481373 ) ) ( not ( = ?auto_481365 ?auto_481374 ) ) ( not ( = ?auto_481365 ?auto_481375 ) ) ( not ( = ?auto_481365 ?auto_481376 ) ) ( not ( = ?auto_481365 ?auto_481377 ) ) ( not ( = ?auto_481365 ?auto_481378 ) ) ( not ( = ?auto_481366 ?auto_481367 ) ) ( not ( = ?auto_481366 ?auto_481368 ) ) ( not ( = ?auto_481366 ?auto_481369 ) ) ( not ( = ?auto_481366 ?auto_481370 ) ) ( not ( = ?auto_481366 ?auto_481371 ) ) ( not ( = ?auto_481366 ?auto_481372 ) ) ( not ( = ?auto_481366 ?auto_481373 ) ) ( not ( = ?auto_481366 ?auto_481374 ) ) ( not ( = ?auto_481366 ?auto_481375 ) ) ( not ( = ?auto_481366 ?auto_481376 ) ) ( not ( = ?auto_481366 ?auto_481377 ) ) ( not ( = ?auto_481366 ?auto_481378 ) ) ( not ( = ?auto_481367 ?auto_481368 ) ) ( not ( = ?auto_481367 ?auto_481369 ) ) ( not ( = ?auto_481367 ?auto_481370 ) ) ( not ( = ?auto_481367 ?auto_481371 ) ) ( not ( = ?auto_481367 ?auto_481372 ) ) ( not ( = ?auto_481367 ?auto_481373 ) ) ( not ( = ?auto_481367 ?auto_481374 ) ) ( not ( = ?auto_481367 ?auto_481375 ) ) ( not ( = ?auto_481367 ?auto_481376 ) ) ( not ( = ?auto_481367 ?auto_481377 ) ) ( not ( = ?auto_481367 ?auto_481378 ) ) ( not ( = ?auto_481368 ?auto_481369 ) ) ( not ( = ?auto_481368 ?auto_481370 ) ) ( not ( = ?auto_481368 ?auto_481371 ) ) ( not ( = ?auto_481368 ?auto_481372 ) ) ( not ( = ?auto_481368 ?auto_481373 ) ) ( not ( = ?auto_481368 ?auto_481374 ) ) ( not ( = ?auto_481368 ?auto_481375 ) ) ( not ( = ?auto_481368 ?auto_481376 ) ) ( not ( = ?auto_481368 ?auto_481377 ) ) ( not ( = ?auto_481368 ?auto_481378 ) ) ( not ( = ?auto_481369 ?auto_481370 ) ) ( not ( = ?auto_481369 ?auto_481371 ) ) ( not ( = ?auto_481369 ?auto_481372 ) ) ( not ( = ?auto_481369 ?auto_481373 ) ) ( not ( = ?auto_481369 ?auto_481374 ) ) ( not ( = ?auto_481369 ?auto_481375 ) ) ( not ( = ?auto_481369 ?auto_481376 ) ) ( not ( = ?auto_481369 ?auto_481377 ) ) ( not ( = ?auto_481369 ?auto_481378 ) ) ( not ( = ?auto_481370 ?auto_481371 ) ) ( not ( = ?auto_481370 ?auto_481372 ) ) ( not ( = ?auto_481370 ?auto_481373 ) ) ( not ( = ?auto_481370 ?auto_481374 ) ) ( not ( = ?auto_481370 ?auto_481375 ) ) ( not ( = ?auto_481370 ?auto_481376 ) ) ( not ( = ?auto_481370 ?auto_481377 ) ) ( not ( = ?auto_481370 ?auto_481378 ) ) ( not ( = ?auto_481371 ?auto_481372 ) ) ( not ( = ?auto_481371 ?auto_481373 ) ) ( not ( = ?auto_481371 ?auto_481374 ) ) ( not ( = ?auto_481371 ?auto_481375 ) ) ( not ( = ?auto_481371 ?auto_481376 ) ) ( not ( = ?auto_481371 ?auto_481377 ) ) ( not ( = ?auto_481371 ?auto_481378 ) ) ( not ( = ?auto_481372 ?auto_481373 ) ) ( not ( = ?auto_481372 ?auto_481374 ) ) ( not ( = ?auto_481372 ?auto_481375 ) ) ( not ( = ?auto_481372 ?auto_481376 ) ) ( not ( = ?auto_481372 ?auto_481377 ) ) ( not ( = ?auto_481372 ?auto_481378 ) ) ( not ( = ?auto_481373 ?auto_481374 ) ) ( not ( = ?auto_481373 ?auto_481375 ) ) ( not ( = ?auto_481373 ?auto_481376 ) ) ( not ( = ?auto_481373 ?auto_481377 ) ) ( not ( = ?auto_481373 ?auto_481378 ) ) ( not ( = ?auto_481374 ?auto_481375 ) ) ( not ( = ?auto_481374 ?auto_481376 ) ) ( not ( = ?auto_481374 ?auto_481377 ) ) ( not ( = ?auto_481374 ?auto_481378 ) ) ( not ( = ?auto_481375 ?auto_481376 ) ) ( not ( = ?auto_481375 ?auto_481377 ) ) ( not ( = ?auto_481375 ?auto_481378 ) ) ( not ( = ?auto_481376 ?auto_481377 ) ) ( not ( = ?auto_481376 ?auto_481378 ) ) ( not ( = ?auto_481377 ?auto_481378 ) ) ( ON ?auto_481376 ?auto_481377 ) ( ON ?auto_481375 ?auto_481376 ) ( ON ?auto_481374 ?auto_481375 ) ( ON ?auto_481373 ?auto_481374 ) ( ON ?auto_481372 ?auto_481373 ) ( ON ?auto_481371 ?auto_481372 ) ( CLEAR ?auto_481369 ) ( ON ?auto_481370 ?auto_481371 ) ( CLEAR ?auto_481370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_481364 ?auto_481365 ?auto_481366 ?auto_481367 ?auto_481368 ?auto_481369 ?auto_481370 )
      ( MAKE-14PILE ?auto_481364 ?auto_481365 ?auto_481366 ?auto_481367 ?auto_481368 ?auto_481369 ?auto_481370 ?auto_481371 ?auto_481372 ?auto_481373 ?auto_481374 ?auto_481375 ?auto_481376 ?auto_481377 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_481422 - BLOCK
      ?auto_481423 - BLOCK
      ?auto_481424 - BLOCK
      ?auto_481425 - BLOCK
      ?auto_481426 - BLOCK
      ?auto_481427 - BLOCK
      ?auto_481428 - BLOCK
      ?auto_481429 - BLOCK
      ?auto_481430 - BLOCK
      ?auto_481431 - BLOCK
      ?auto_481432 - BLOCK
      ?auto_481433 - BLOCK
      ?auto_481434 - BLOCK
      ?auto_481435 - BLOCK
    )
    :vars
    (
      ?auto_481436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_481435 ?auto_481436 ) ( ON-TABLE ?auto_481422 ) ( ON ?auto_481423 ?auto_481422 ) ( ON ?auto_481424 ?auto_481423 ) ( ON ?auto_481425 ?auto_481424 ) ( ON ?auto_481426 ?auto_481425 ) ( not ( = ?auto_481422 ?auto_481423 ) ) ( not ( = ?auto_481422 ?auto_481424 ) ) ( not ( = ?auto_481422 ?auto_481425 ) ) ( not ( = ?auto_481422 ?auto_481426 ) ) ( not ( = ?auto_481422 ?auto_481427 ) ) ( not ( = ?auto_481422 ?auto_481428 ) ) ( not ( = ?auto_481422 ?auto_481429 ) ) ( not ( = ?auto_481422 ?auto_481430 ) ) ( not ( = ?auto_481422 ?auto_481431 ) ) ( not ( = ?auto_481422 ?auto_481432 ) ) ( not ( = ?auto_481422 ?auto_481433 ) ) ( not ( = ?auto_481422 ?auto_481434 ) ) ( not ( = ?auto_481422 ?auto_481435 ) ) ( not ( = ?auto_481422 ?auto_481436 ) ) ( not ( = ?auto_481423 ?auto_481424 ) ) ( not ( = ?auto_481423 ?auto_481425 ) ) ( not ( = ?auto_481423 ?auto_481426 ) ) ( not ( = ?auto_481423 ?auto_481427 ) ) ( not ( = ?auto_481423 ?auto_481428 ) ) ( not ( = ?auto_481423 ?auto_481429 ) ) ( not ( = ?auto_481423 ?auto_481430 ) ) ( not ( = ?auto_481423 ?auto_481431 ) ) ( not ( = ?auto_481423 ?auto_481432 ) ) ( not ( = ?auto_481423 ?auto_481433 ) ) ( not ( = ?auto_481423 ?auto_481434 ) ) ( not ( = ?auto_481423 ?auto_481435 ) ) ( not ( = ?auto_481423 ?auto_481436 ) ) ( not ( = ?auto_481424 ?auto_481425 ) ) ( not ( = ?auto_481424 ?auto_481426 ) ) ( not ( = ?auto_481424 ?auto_481427 ) ) ( not ( = ?auto_481424 ?auto_481428 ) ) ( not ( = ?auto_481424 ?auto_481429 ) ) ( not ( = ?auto_481424 ?auto_481430 ) ) ( not ( = ?auto_481424 ?auto_481431 ) ) ( not ( = ?auto_481424 ?auto_481432 ) ) ( not ( = ?auto_481424 ?auto_481433 ) ) ( not ( = ?auto_481424 ?auto_481434 ) ) ( not ( = ?auto_481424 ?auto_481435 ) ) ( not ( = ?auto_481424 ?auto_481436 ) ) ( not ( = ?auto_481425 ?auto_481426 ) ) ( not ( = ?auto_481425 ?auto_481427 ) ) ( not ( = ?auto_481425 ?auto_481428 ) ) ( not ( = ?auto_481425 ?auto_481429 ) ) ( not ( = ?auto_481425 ?auto_481430 ) ) ( not ( = ?auto_481425 ?auto_481431 ) ) ( not ( = ?auto_481425 ?auto_481432 ) ) ( not ( = ?auto_481425 ?auto_481433 ) ) ( not ( = ?auto_481425 ?auto_481434 ) ) ( not ( = ?auto_481425 ?auto_481435 ) ) ( not ( = ?auto_481425 ?auto_481436 ) ) ( not ( = ?auto_481426 ?auto_481427 ) ) ( not ( = ?auto_481426 ?auto_481428 ) ) ( not ( = ?auto_481426 ?auto_481429 ) ) ( not ( = ?auto_481426 ?auto_481430 ) ) ( not ( = ?auto_481426 ?auto_481431 ) ) ( not ( = ?auto_481426 ?auto_481432 ) ) ( not ( = ?auto_481426 ?auto_481433 ) ) ( not ( = ?auto_481426 ?auto_481434 ) ) ( not ( = ?auto_481426 ?auto_481435 ) ) ( not ( = ?auto_481426 ?auto_481436 ) ) ( not ( = ?auto_481427 ?auto_481428 ) ) ( not ( = ?auto_481427 ?auto_481429 ) ) ( not ( = ?auto_481427 ?auto_481430 ) ) ( not ( = ?auto_481427 ?auto_481431 ) ) ( not ( = ?auto_481427 ?auto_481432 ) ) ( not ( = ?auto_481427 ?auto_481433 ) ) ( not ( = ?auto_481427 ?auto_481434 ) ) ( not ( = ?auto_481427 ?auto_481435 ) ) ( not ( = ?auto_481427 ?auto_481436 ) ) ( not ( = ?auto_481428 ?auto_481429 ) ) ( not ( = ?auto_481428 ?auto_481430 ) ) ( not ( = ?auto_481428 ?auto_481431 ) ) ( not ( = ?auto_481428 ?auto_481432 ) ) ( not ( = ?auto_481428 ?auto_481433 ) ) ( not ( = ?auto_481428 ?auto_481434 ) ) ( not ( = ?auto_481428 ?auto_481435 ) ) ( not ( = ?auto_481428 ?auto_481436 ) ) ( not ( = ?auto_481429 ?auto_481430 ) ) ( not ( = ?auto_481429 ?auto_481431 ) ) ( not ( = ?auto_481429 ?auto_481432 ) ) ( not ( = ?auto_481429 ?auto_481433 ) ) ( not ( = ?auto_481429 ?auto_481434 ) ) ( not ( = ?auto_481429 ?auto_481435 ) ) ( not ( = ?auto_481429 ?auto_481436 ) ) ( not ( = ?auto_481430 ?auto_481431 ) ) ( not ( = ?auto_481430 ?auto_481432 ) ) ( not ( = ?auto_481430 ?auto_481433 ) ) ( not ( = ?auto_481430 ?auto_481434 ) ) ( not ( = ?auto_481430 ?auto_481435 ) ) ( not ( = ?auto_481430 ?auto_481436 ) ) ( not ( = ?auto_481431 ?auto_481432 ) ) ( not ( = ?auto_481431 ?auto_481433 ) ) ( not ( = ?auto_481431 ?auto_481434 ) ) ( not ( = ?auto_481431 ?auto_481435 ) ) ( not ( = ?auto_481431 ?auto_481436 ) ) ( not ( = ?auto_481432 ?auto_481433 ) ) ( not ( = ?auto_481432 ?auto_481434 ) ) ( not ( = ?auto_481432 ?auto_481435 ) ) ( not ( = ?auto_481432 ?auto_481436 ) ) ( not ( = ?auto_481433 ?auto_481434 ) ) ( not ( = ?auto_481433 ?auto_481435 ) ) ( not ( = ?auto_481433 ?auto_481436 ) ) ( not ( = ?auto_481434 ?auto_481435 ) ) ( not ( = ?auto_481434 ?auto_481436 ) ) ( not ( = ?auto_481435 ?auto_481436 ) ) ( ON ?auto_481434 ?auto_481435 ) ( ON ?auto_481433 ?auto_481434 ) ( ON ?auto_481432 ?auto_481433 ) ( ON ?auto_481431 ?auto_481432 ) ( ON ?auto_481430 ?auto_481431 ) ( ON ?auto_481429 ?auto_481430 ) ( ON ?auto_481428 ?auto_481429 ) ( CLEAR ?auto_481426 ) ( ON ?auto_481427 ?auto_481428 ) ( CLEAR ?auto_481427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_481422 ?auto_481423 ?auto_481424 ?auto_481425 ?auto_481426 ?auto_481427 )
      ( MAKE-14PILE ?auto_481422 ?auto_481423 ?auto_481424 ?auto_481425 ?auto_481426 ?auto_481427 ?auto_481428 ?auto_481429 ?auto_481430 ?auto_481431 ?auto_481432 ?auto_481433 ?auto_481434 ?auto_481435 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_481480 - BLOCK
      ?auto_481481 - BLOCK
      ?auto_481482 - BLOCK
      ?auto_481483 - BLOCK
      ?auto_481484 - BLOCK
      ?auto_481485 - BLOCK
      ?auto_481486 - BLOCK
      ?auto_481487 - BLOCK
      ?auto_481488 - BLOCK
      ?auto_481489 - BLOCK
      ?auto_481490 - BLOCK
      ?auto_481491 - BLOCK
      ?auto_481492 - BLOCK
      ?auto_481493 - BLOCK
    )
    :vars
    (
      ?auto_481494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_481493 ?auto_481494 ) ( ON-TABLE ?auto_481480 ) ( ON ?auto_481481 ?auto_481480 ) ( ON ?auto_481482 ?auto_481481 ) ( ON ?auto_481483 ?auto_481482 ) ( not ( = ?auto_481480 ?auto_481481 ) ) ( not ( = ?auto_481480 ?auto_481482 ) ) ( not ( = ?auto_481480 ?auto_481483 ) ) ( not ( = ?auto_481480 ?auto_481484 ) ) ( not ( = ?auto_481480 ?auto_481485 ) ) ( not ( = ?auto_481480 ?auto_481486 ) ) ( not ( = ?auto_481480 ?auto_481487 ) ) ( not ( = ?auto_481480 ?auto_481488 ) ) ( not ( = ?auto_481480 ?auto_481489 ) ) ( not ( = ?auto_481480 ?auto_481490 ) ) ( not ( = ?auto_481480 ?auto_481491 ) ) ( not ( = ?auto_481480 ?auto_481492 ) ) ( not ( = ?auto_481480 ?auto_481493 ) ) ( not ( = ?auto_481480 ?auto_481494 ) ) ( not ( = ?auto_481481 ?auto_481482 ) ) ( not ( = ?auto_481481 ?auto_481483 ) ) ( not ( = ?auto_481481 ?auto_481484 ) ) ( not ( = ?auto_481481 ?auto_481485 ) ) ( not ( = ?auto_481481 ?auto_481486 ) ) ( not ( = ?auto_481481 ?auto_481487 ) ) ( not ( = ?auto_481481 ?auto_481488 ) ) ( not ( = ?auto_481481 ?auto_481489 ) ) ( not ( = ?auto_481481 ?auto_481490 ) ) ( not ( = ?auto_481481 ?auto_481491 ) ) ( not ( = ?auto_481481 ?auto_481492 ) ) ( not ( = ?auto_481481 ?auto_481493 ) ) ( not ( = ?auto_481481 ?auto_481494 ) ) ( not ( = ?auto_481482 ?auto_481483 ) ) ( not ( = ?auto_481482 ?auto_481484 ) ) ( not ( = ?auto_481482 ?auto_481485 ) ) ( not ( = ?auto_481482 ?auto_481486 ) ) ( not ( = ?auto_481482 ?auto_481487 ) ) ( not ( = ?auto_481482 ?auto_481488 ) ) ( not ( = ?auto_481482 ?auto_481489 ) ) ( not ( = ?auto_481482 ?auto_481490 ) ) ( not ( = ?auto_481482 ?auto_481491 ) ) ( not ( = ?auto_481482 ?auto_481492 ) ) ( not ( = ?auto_481482 ?auto_481493 ) ) ( not ( = ?auto_481482 ?auto_481494 ) ) ( not ( = ?auto_481483 ?auto_481484 ) ) ( not ( = ?auto_481483 ?auto_481485 ) ) ( not ( = ?auto_481483 ?auto_481486 ) ) ( not ( = ?auto_481483 ?auto_481487 ) ) ( not ( = ?auto_481483 ?auto_481488 ) ) ( not ( = ?auto_481483 ?auto_481489 ) ) ( not ( = ?auto_481483 ?auto_481490 ) ) ( not ( = ?auto_481483 ?auto_481491 ) ) ( not ( = ?auto_481483 ?auto_481492 ) ) ( not ( = ?auto_481483 ?auto_481493 ) ) ( not ( = ?auto_481483 ?auto_481494 ) ) ( not ( = ?auto_481484 ?auto_481485 ) ) ( not ( = ?auto_481484 ?auto_481486 ) ) ( not ( = ?auto_481484 ?auto_481487 ) ) ( not ( = ?auto_481484 ?auto_481488 ) ) ( not ( = ?auto_481484 ?auto_481489 ) ) ( not ( = ?auto_481484 ?auto_481490 ) ) ( not ( = ?auto_481484 ?auto_481491 ) ) ( not ( = ?auto_481484 ?auto_481492 ) ) ( not ( = ?auto_481484 ?auto_481493 ) ) ( not ( = ?auto_481484 ?auto_481494 ) ) ( not ( = ?auto_481485 ?auto_481486 ) ) ( not ( = ?auto_481485 ?auto_481487 ) ) ( not ( = ?auto_481485 ?auto_481488 ) ) ( not ( = ?auto_481485 ?auto_481489 ) ) ( not ( = ?auto_481485 ?auto_481490 ) ) ( not ( = ?auto_481485 ?auto_481491 ) ) ( not ( = ?auto_481485 ?auto_481492 ) ) ( not ( = ?auto_481485 ?auto_481493 ) ) ( not ( = ?auto_481485 ?auto_481494 ) ) ( not ( = ?auto_481486 ?auto_481487 ) ) ( not ( = ?auto_481486 ?auto_481488 ) ) ( not ( = ?auto_481486 ?auto_481489 ) ) ( not ( = ?auto_481486 ?auto_481490 ) ) ( not ( = ?auto_481486 ?auto_481491 ) ) ( not ( = ?auto_481486 ?auto_481492 ) ) ( not ( = ?auto_481486 ?auto_481493 ) ) ( not ( = ?auto_481486 ?auto_481494 ) ) ( not ( = ?auto_481487 ?auto_481488 ) ) ( not ( = ?auto_481487 ?auto_481489 ) ) ( not ( = ?auto_481487 ?auto_481490 ) ) ( not ( = ?auto_481487 ?auto_481491 ) ) ( not ( = ?auto_481487 ?auto_481492 ) ) ( not ( = ?auto_481487 ?auto_481493 ) ) ( not ( = ?auto_481487 ?auto_481494 ) ) ( not ( = ?auto_481488 ?auto_481489 ) ) ( not ( = ?auto_481488 ?auto_481490 ) ) ( not ( = ?auto_481488 ?auto_481491 ) ) ( not ( = ?auto_481488 ?auto_481492 ) ) ( not ( = ?auto_481488 ?auto_481493 ) ) ( not ( = ?auto_481488 ?auto_481494 ) ) ( not ( = ?auto_481489 ?auto_481490 ) ) ( not ( = ?auto_481489 ?auto_481491 ) ) ( not ( = ?auto_481489 ?auto_481492 ) ) ( not ( = ?auto_481489 ?auto_481493 ) ) ( not ( = ?auto_481489 ?auto_481494 ) ) ( not ( = ?auto_481490 ?auto_481491 ) ) ( not ( = ?auto_481490 ?auto_481492 ) ) ( not ( = ?auto_481490 ?auto_481493 ) ) ( not ( = ?auto_481490 ?auto_481494 ) ) ( not ( = ?auto_481491 ?auto_481492 ) ) ( not ( = ?auto_481491 ?auto_481493 ) ) ( not ( = ?auto_481491 ?auto_481494 ) ) ( not ( = ?auto_481492 ?auto_481493 ) ) ( not ( = ?auto_481492 ?auto_481494 ) ) ( not ( = ?auto_481493 ?auto_481494 ) ) ( ON ?auto_481492 ?auto_481493 ) ( ON ?auto_481491 ?auto_481492 ) ( ON ?auto_481490 ?auto_481491 ) ( ON ?auto_481489 ?auto_481490 ) ( ON ?auto_481488 ?auto_481489 ) ( ON ?auto_481487 ?auto_481488 ) ( ON ?auto_481486 ?auto_481487 ) ( ON ?auto_481485 ?auto_481486 ) ( CLEAR ?auto_481483 ) ( ON ?auto_481484 ?auto_481485 ) ( CLEAR ?auto_481484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_481480 ?auto_481481 ?auto_481482 ?auto_481483 ?auto_481484 )
      ( MAKE-14PILE ?auto_481480 ?auto_481481 ?auto_481482 ?auto_481483 ?auto_481484 ?auto_481485 ?auto_481486 ?auto_481487 ?auto_481488 ?auto_481489 ?auto_481490 ?auto_481491 ?auto_481492 ?auto_481493 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_481538 - BLOCK
      ?auto_481539 - BLOCK
      ?auto_481540 - BLOCK
      ?auto_481541 - BLOCK
      ?auto_481542 - BLOCK
      ?auto_481543 - BLOCK
      ?auto_481544 - BLOCK
      ?auto_481545 - BLOCK
      ?auto_481546 - BLOCK
      ?auto_481547 - BLOCK
      ?auto_481548 - BLOCK
      ?auto_481549 - BLOCK
      ?auto_481550 - BLOCK
      ?auto_481551 - BLOCK
    )
    :vars
    (
      ?auto_481552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_481551 ?auto_481552 ) ( ON-TABLE ?auto_481538 ) ( ON ?auto_481539 ?auto_481538 ) ( ON ?auto_481540 ?auto_481539 ) ( not ( = ?auto_481538 ?auto_481539 ) ) ( not ( = ?auto_481538 ?auto_481540 ) ) ( not ( = ?auto_481538 ?auto_481541 ) ) ( not ( = ?auto_481538 ?auto_481542 ) ) ( not ( = ?auto_481538 ?auto_481543 ) ) ( not ( = ?auto_481538 ?auto_481544 ) ) ( not ( = ?auto_481538 ?auto_481545 ) ) ( not ( = ?auto_481538 ?auto_481546 ) ) ( not ( = ?auto_481538 ?auto_481547 ) ) ( not ( = ?auto_481538 ?auto_481548 ) ) ( not ( = ?auto_481538 ?auto_481549 ) ) ( not ( = ?auto_481538 ?auto_481550 ) ) ( not ( = ?auto_481538 ?auto_481551 ) ) ( not ( = ?auto_481538 ?auto_481552 ) ) ( not ( = ?auto_481539 ?auto_481540 ) ) ( not ( = ?auto_481539 ?auto_481541 ) ) ( not ( = ?auto_481539 ?auto_481542 ) ) ( not ( = ?auto_481539 ?auto_481543 ) ) ( not ( = ?auto_481539 ?auto_481544 ) ) ( not ( = ?auto_481539 ?auto_481545 ) ) ( not ( = ?auto_481539 ?auto_481546 ) ) ( not ( = ?auto_481539 ?auto_481547 ) ) ( not ( = ?auto_481539 ?auto_481548 ) ) ( not ( = ?auto_481539 ?auto_481549 ) ) ( not ( = ?auto_481539 ?auto_481550 ) ) ( not ( = ?auto_481539 ?auto_481551 ) ) ( not ( = ?auto_481539 ?auto_481552 ) ) ( not ( = ?auto_481540 ?auto_481541 ) ) ( not ( = ?auto_481540 ?auto_481542 ) ) ( not ( = ?auto_481540 ?auto_481543 ) ) ( not ( = ?auto_481540 ?auto_481544 ) ) ( not ( = ?auto_481540 ?auto_481545 ) ) ( not ( = ?auto_481540 ?auto_481546 ) ) ( not ( = ?auto_481540 ?auto_481547 ) ) ( not ( = ?auto_481540 ?auto_481548 ) ) ( not ( = ?auto_481540 ?auto_481549 ) ) ( not ( = ?auto_481540 ?auto_481550 ) ) ( not ( = ?auto_481540 ?auto_481551 ) ) ( not ( = ?auto_481540 ?auto_481552 ) ) ( not ( = ?auto_481541 ?auto_481542 ) ) ( not ( = ?auto_481541 ?auto_481543 ) ) ( not ( = ?auto_481541 ?auto_481544 ) ) ( not ( = ?auto_481541 ?auto_481545 ) ) ( not ( = ?auto_481541 ?auto_481546 ) ) ( not ( = ?auto_481541 ?auto_481547 ) ) ( not ( = ?auto_481541 ?auto_481548 ) ) ( not ( = ?auto_481541 ?auto_481549 ) ) ( not ( = ?auto_481541 ?auto_481550 ) ) ( not ( = ?auto_481541 ?auto_481551 ) ) ( not ( = ?auto_481541 ?auto_481552 ) ) ( not ( = ?auto_481542 ?auto_481543 ) ) ( not ( = ?auto_481542 ?auto_481544 ) ) ( not ( = ?auto_481542 ?auto_481545 ) ) ( not ( = ?auto_481542 ?auto_481546 ) ) ( not ( = ?auto_481542 ?auto_481547 ) ) ( not ( = ?auto_481542 ?auto_481548 ) ) ( not ( = ?auto_481542 ?auto_481549 ) ) ( not ( = ?auto_481542 ?auto_481550 ) ) ( not ( = ?auto_481542 ?auto_481551 ) ) ( not ( = ?auto_481542 ?auto_481552 ) ) ( not ( = ?auto_481543 ?auto_481544 ) ) ( not ( = ?auto_481543 ?auto_481545 ) ) ( not ( = ?auto_481543 ?auto_481546 ) ) ( not ( = ?auto_481543 ?auto_481547 ) ) ( not ( = ?auto_481543 ?auto_481548 ) ) ( not ( = ?auto_481543 ?auto_481549 ) ) ( not ( = ?auto_481543 ?auto_481550 ) ) ( not ( = ?auto_481543 ?auto_481551 ) ) ( not ( = ?auto_481543 ?auto_481552 ) ) ( not ( = ?auto_481544 ?auto_481545 ) ) ( not ( = ?auto_481544 ?auto_481546 ) ) ( not ( = ?auto_481544 ?auto_481547 ) ) ( not ( = ?auto_481544 ?auto_481548 ) ) ( not ( = ?auto_481544 ?auto_481549 ) ) ( not ( = ?auto_481544 ?auto_481550 ) ) ( not ( = ?auto_481544 ?auto_481551 ) ) ( not ( = ?auto_481544 ?auto_481552 ) ) ( not ( = ?auto_481545 ?auto_481546 ) ) ( not ( = ?auto_481545 ?auto_481547 ) ) ( not ( = ?auto_481545 ?auto_481548 ) ) ( not ( = ?auto_481545 ?auto_481549 ) ) ( not ( = ?auto_481545 ?auto_481550 ) ) ( not ( = ?auto_481545 ?auto_481551 ) ) ( not ( = ?auto_481545 ?auto_481552 ) ) ( not ( = ?auto_481546 ?auto_481547 ) ) ( not ( = ?auto_481546 ?auto_481548 ) ) ( not ( = ?auto_481546 ?auto_481549 ) ) ( not ( = ?auto_481546 ?auto_481550 ) ) ( not ( = ?auto_481546 ?auto_481551 ) ) ( not ( = ?auto_481546 ?auto_481552 ) ) ( not ( = ?auto_481547 ?auto_481548 ) ) ( not ( = ?auto_481547 ?auto_481549 ) ) ( not ( = ?auto_481547 ?auto_481550 ) ) ( not ( = ?auto_481547 ?auto_481551 ) ) ( not ( = ?auto_481547 ?auto_481552 ) ) ( not ( = ?auto_481548 ?auto_481549 ) ) ( not ( = ?auto_481548 ?auto_481550 ) ) ( not ( = ?auto_481548 ?auto_481551 ) ) ( not ( = ?auto_481548 ?auto_481552 ) ) ( not ( = ?auto_481549 ?auto_481550 ) ) ( not ( = ?auto_481549 ?auto_481551 ) ) ( not ( = ?auto_481549 ?auto_481552 ) ) ( not ( = ?auto_481550 ?auto_481551 ) ) ( not ( = ?auto_481550 ?auto_481552 ) ) ( not ( = ?auto_481551 ?auto_481552 ) ) ( ON ?auto_481550 ?auto_481551 ) ( ON ?auto_481549 ?auto_481550 ) ( ON ?auto_481548 ?auto_481549 ) ( ON ?auto_481547 ?auto_481548 ) ( ON ?auto_481546 ?auto_481547 ) ( ON ?auto_481545 ?auto_481546 ) ( ON ?auto_481544 ?auto_481545 ) ( ON ?auto_481543 ?auto_481544 ) ( ON ?auto_481542 ?auto_481543 ) ( CLEAR ?auto_481540 ) ( ON ?auto_481541 ?auto_481542 ) ( CLEAR ?auto_481541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_481538 ?auto_481539 ?auto_481540 ?auto_481541 )
      ( MAKE-14PILE ?auto_481538 ?auto_481539 ?auto_481540 ?auto_481541 ?auto_481542 ?auto_481543 ?auto_481544 ?auto_481545 ?auto_481546 ?auto_481547 ?auto_481548 ?auto_481549 ?auto_481550 ?auto_481551 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_481596 - BLOCK
      ?auto_481597 - BLOCK
      ?auto_481598 - BLOCK
      ?auto_481599 - BLOCK
      ?auto_481600 - BLOCK
      ?auto_481601 - BLOCK
      ?auto_481602 - BLOCK
      ?auto_481603 - BLOCK
      ?auto_481604 - BLOCK
      ?auto_481605 - BLOCK
      ?auto_481606 - BLOCK
      ?auto_481607 - BLOCK
      ?auto_481608 - BLOCK
      ?auto_481609 - BLOCK
    )
    :vars
    (
      ?auto_481610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_481609 ?auto_481610 ) ( ON-TABLE ?auto_481596 ) ( ON ?auto_481597 ?auto_481596 ) ( not ( = ?auto_481596 ?auto_481597 ) ) ( not ( = ?auto_481596 ?auto_481598 ) ) ( not ( = ?auto_481596 ?auto_481599 ) ) ( not ( = ?auto_481596 ?auto_481600 ) ) ( not ( = ?auto_481596 ?auto_481601 ) ) ( not ( = ?auto_481596 ?auto_481602 ) ) ( not ( = ?auto_481596 ?auto_481603 ) ) ( not ( = ?auto_481596 ?auto_481604 ) ) ( not ( = ?auto_481596 ?auto_481605 ) ) ( not ( = ?auto_481596 ?auto_481606 ) ) ( not ( = ?auto_481596 ?auto_481607 ) ) ( not ( = ?auto_481596 ?auto_481608 ) ) ( not ( = ?auto_481596 ?auto_481609 ) ) ( not ( = ?auto_481596 ?auto_481610 ) ) ( not ( = ?auto_481597 ?auto_481598 ) ) ( not ( = ?auto_481597 ?auto_481599 ) ) ( not ( = ?auto_481597 ?auto_481600 ) ) ( not ( = ?auto_481597 ?auto_481601 ) ) ( not ( = ?auto_481597 ?auto_481602 ) ) ( not ( = ?auto_481597 ?auto_481603 ) ) ( not ( = ?auto_481597 ?auto_481604 ) ) ( not ( = ?auto_481597 ?auto_481605 ) ) ( not ( = ?auto_481597 ?auto_481606 ) ) ( not ( = ?auto_481597 ?auto_481607 ) ) ( not ( = ?auto_481597 ?auto_481608 ) ) ( not ( = ?auto_481597 ?auto_481609 ) ) ( not ( = ?auto_481597 ?auto_481610 ) ) ( not ( = ?auto_481598 ?auto_481599 ) ) ( not ( = ?auto_481598 ?auto_481600 ) ) ( not ( = ?auto_481598 ?auto_481601 ) ) ( not ( = ?auto_481598 ?auto_481602 ) ) ( not ( = ?auto_481598 ?auto_481603 ) ) ( not ( = ?auto_481598 ?auto_481604 ) ) ( not ( = ?auto_481598 ?auto_481605 ) ) ( not ( = ?auto_481598 ?auto_481606 ) ) ( not ( = ?auto_481598 ?auto_481607 ) ) ( not ( = ?auto_481598 ?auto_481608 ) ) ( not ( = ?auto_481598 ?auto_481609 ) ) ( not ( = ?auto_481598 ?auto_481610 ) ) ( not ( = ?auto_481599 ?auto_481600 ) ) ( not ( = ?auto_481599 ?auto_481601 ) ) ( not ( = ?auto_481599 ?auto_481602 ) ) ( not ( = ?auto_481599 ?auto_481603 ) ) ( not ( = ?auto_481599 ?auto_481604 ) ) ( not ( = ?auto_481599 ?auto_481605 ) ) ( not ( = ?auto_481599 ?auto_481606 ) ) ( not ( = ?auto_481599 ?auto_481607 ) ) ( not ( = ?auto_481599 ?auto_481608 ) ) ( not ( = ?auto_481599 ?auto_481609 ) ) ( not ( = ?auto_481599 ?auto_481610 ) ) ( not ( = ?auto_481600 ?auto_481601 ) ) ( not ( = ?auto_481600 ?auto_481602 ) ) ( not ( = ?auto_481600 ?auto_481603 ) ) ( not ( = ?auto_481600 ?auto_481604 ) ) ( not ( = ?auto_481600 ?auto_481605 ) ) ( not ( = ?auto_481600 ?auto_481606 ) ) ( not ( = ?auto_481600 ?auto_481607 ) ) ( not ( = ?auto_481600 ?auto_481608 ) ) ( not ( = ?auto_481600 ?auto_481609 ) ) ( not ( = ?auto_481600 ?auto_481610 ) ) ( not ( = ?auto_481601 ?auto_481602 ) ) ( not ( = ?auto_481601 ?auto_481603 ) ) ( not ( = ?auto_481601 ?auto_481604 ) ) ( not ( = ?auto_481601 ?auto_481605 ) ) ( not ( = ?auto_481601 ?auto_481606 ) ) ( not ( = ?auto_481601 ?auto_481607 ) ) ( not ( = ?auto_481601 ?auto_481608 ) ) ( not ( = ?auto_481601 ?auto_481609 ) ) ( not ( = ?auto_481601 ?auto_481610 ) ) ( not ( = ?auto_481602 ?auto_481603 ) ) ( not ( = ?auto_481602 ?auto_481604 ) ) ( not ( = ?auto_481602 ?auto_481605 ) ) ( not ( = ?auto_481602 ?auto_481606 ) ) ( not ( = ?auto_481602 ?auto_481607 ) ) ( not ( = ?auto_481602 ?auto_481608 ) ) ( not ( = ?auto_481602 ?auto_481609 ) ) ( not ( = ?auto_481602 ?auto_481610 ) ) ( not ( = ?auto_481603 ?auto_481604 ) ) ( not ( = ?auto_481603 ?auto_481605 ) ) ( not ( = ?auto_481603 ?auto_481606 ) ) ( not ( = ?auto_481603 ?auto_481607 ) ) ( not ( = ?auto_481603 ?auto_481608 ) ) ( not ( = ?auto_481603 ?auto_481609 ) ) ( not ( = ?auto_481603 ?auto_481610 ) ) ( not ( = ?auto_481604 ?auto_481605 ) ) ( not ( = ?auto_481604 ?auto_481606 ) ) ( not ( = ?auto_481604 ?auto_481607 ) ) ( not ( = ?auto_481604 ?auto_481608 ) ) ( not ( = ?auto_481604 ?auto_481609 ) ) ( not ( = ?auto_481604 ?auto_481610 ) ) ( not ( = ?auto_481605 ?auto_481606 ) ) ( not ( = ?auto_481605 ?auto_481607 ) ) ( not ( = ?auto_481605 ?auto_481608 ) ) ( not ( = ?auto_481605 ?auto_481609 ) ) ( not ( = ?auto_481605 ?auto_481610 ) ) ( not ( = ?auto_481606 ?auto_481607 ) ) ( not ( = ?auto_481606 ?auto_481608 ) ) ( not ( = ?auto_481606 ?auto_481609 ) ) ( not ( = ?auto_481606 ?auto_481610 ) ) ( not ( = ?auto_481607 ?auto_481608 ) ) ( not ( = ?auto_481607 ?auto_481609 ) ) ( not ( = ?auto_481607 ?auto_481610 ) ) ( not ( = ?auto_481608 ?auto_481609 ) ) ( not ( = ?auto_481608 ?auto_481610 ) ) ( not ( = ?auto_481609 ?auto_481610 ) ) ( ON ?auto_481608 ?auto_481609 ) ( ON ?auto_481607 ?auto_481608 ) ( ON ?auto_481606 ?auto_481607 ) ( ON ?auto_481605 ?auto_481606 ) ( ON ?auto_481604 ?auto_481605 ) ( ON ?auto_481603 ?auto_481604 ) ( ON ?auto_481602 ?auto_481603 ) ( ON ?auto_481601 ?auto_481602 ) ( ON ?auto_481600 ?auto_481601 ) ( ON ?auto_481599 ?auto_481600 ) ( CLEAR ?auto_481597 ) ( ON ?auto_481598 ?auto_481599 ) ( CLEAR ?auto_481598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_481596 ?auto_481597 ?auto_481598 )
      ( MAKE-14PILE ?auto_481596 ?auto_481597 ?auto_481598 ?auto_481599 ?auto_481600 ?auto_481601 ?auto_481602 ?auto_481603 ?auto_481604 ?auto_481605 ?auto_481606 ?auto_481607 ?auto_481608 ?auto_481609 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_481654 - BLOCK
      ?auto_481655 - BLOCK
      ?auto_481656 - BLOCK
      ?auto_481657 - BLOCK
      ?auto_481658 - BLOCK
      ?auto_481659 - BLOCK
      ?auto_481660 - BLOCK
      ?auto_481661 - BLOCK
      ?auto_481662 - BLOCK
      ?auto_481663 - BLOCK
      ?auto_481664 - BLOCK
      ?auto_481665 - BLOCK
      ?auto_481666 - BLOCK
      ?auto_481667 - BLOCK
    )
    :vars
    (
      ?auto_481668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_481667 ?auto_481668 ) ( ON-TABLE ?auto_481654 ) ( not ( = ?auto_481654 ?auto_481655 ) ) ( not ( = ?auto_481654 ?auto_481656 ) ) ( not ( = ?auto_481654 ?auto_481657 ) ) ( not ( = ?auto_481654 ?auto_481658 ) ) ( not ( = ?auto_481654 ?auto_481659 ) ) ( not ( = ?auto_481654 ?auto_481660 ) ) ( not ( = ?auto_481654 ?auto_481661 ) ) ( not ( = ?auto_481654 ?auto_481662 ) ) ( not ( = ?auto_481654 ?auto_481663 ) ) ( not ( = ?auto_481654 ?auto_481664 ) ) ( not ( = ?auto_481654 ?auto_481665 ) ) ( not ( = ?auto_481654 ?auto_481666 ) ) ( not ( = ?auto_481654 ?auto_481667 ) ) ( not ( = ?auto_481654 ?auto_481668 ) ) ( not ( = ?auto_481655 ?auto_481656 ) ) ( not ( = ?auto_481655 ?auto_481657 ) ) ( not ( = ?auto_481655 ?auto_481658 ) ) ( not ( = ?auto_481655 ?auto_481659 ) ) ( not ( = ?auto_481655 ?auto_481660 ) ) ( not ( = ?auto_481655 ?auto_481661 ) ) ( not ( = ?auto_481655 ?auto_481662 ) ) ( not ( = ?auto_481655 ?auto_481663 ) ) ( not ( = ?auto_481655 ?auto_481664 ) ) ( not ( = ?auto_481655 ?auto_481665 ) ) ( not ( = ?auto_481655 ?auto_481666 ) ) ( not ( = ?auto_481655 ?auto_481667 ) ) ( not ( = ?auto_481655 ?auto_481668 ) ) ( not ( = ?auto_481656 ?auto_481657 ) ) ( not ( = ?auto_481656 ?auto_481658 ) ) ( not ( = ?auto_481656 ?auto_481659 ) ) ( not ( = ?auto_481656 ?auto_481660 ) ) ( not ( = ?auto_481656 ?auto_481661 ) ) ( not ( = ?auto_481656 ?auto_481662 ) ) ( not ( = ?auto_481656 ?auto_481663 ) ) ( not ( = ?auto_481656 ?auto_481664 ) ) ( not ( = ?auto_481656 ?auto_481665 ) ) ( not ( = ?auto_481656 ?auto_481666 ) ) ( not ( = ?auto_481656 ?auto_481667 ) ) ( not ( = ?auto_481656 ?auto_481668 ) ) ( not ( = ?auto_481657 ?auto_481658 ) ) ( not ( = ?auto_481657 ?auto_481659 ) ) ( not ( = ?auto_481657 ?auto_481660 ) ) ( not ( = ?auto_481657 ?auto_481661 ) ) ( not ( = ?auto_481657 ?auto_481662 ) ) ( not ( = ?auto_481657 ?auto_481663 ) ) ( not ( = ?auto_481657 ?auto_481664 ) ) ( not ( = ?auto_481657 ?auto_481665 ) ) ( not ( = ?auto_481657 ?auto_481666 ) ) ( not ( = ?auto_481657 ?auto_481667 ) ) ( not ( = ?auto_481657 ?auto_481668 ) ) ( not ( = ?auto_481658 ?auto_481659 ) ) ( not ( = ?auto_481658 ?auto_481660 ) ) ( not ( = ?auto_481658 ?auto_481661 ) ) ( not ( = ?auto_481658 ?auto_481662 ) ) ( not ( = ?auto_481658 ?auto_481663 ) ) ( not ( = ?auto_481658 ?auto_481664 ) ) ( not ( = ?auto_481658 ?auto_481665 ) ) ( not ( = ?auto_481658 ?auto_481666 ) ) ( not ( = ?auto_481658 ?auto_481667 ) ) ( not ( = ?auto_481658 ?auto_481668 ) ) ( not ( = ?auto_481659 ?auto_481660 ) ) ( not ( = ?auto_481659 ?auto_481661 ) ) ( not ( = ?auto_481659 ?auto_481662 ) ) ( not ( = ?auto_481659 ?auto_481663 ) ) ( not ( = ?auto_481659 ?auto_481664 ) ) ( not ( = ?auto_481659 ?auto_481665 ) ) ( not ( = ?auto_481659 ?auto_481666 ) ) ( not ( = ?auto_481659 ?auto_481667 ) ) ( not ( = ?auto_481659 ?auto_481668 ) ) ( not ( = ?auto_481660 ?auto_481661 ) ) ( not ( = ?auto_481660 ?auto_481662 ) ) ( not ( = ?auto_481660 ?auto_481663 ) ) ( not ( = ?auto_481660 ?auto_481664 ) ) ( not ( = ?auto_481660 ?auto_481665 ) ) ( not ( = ?auto_481660 ?auto_481666 ) ) ( not ( = ?auto_481660 ?auto_481667 ) ) ( not ( = ?auto_481660 ?auto_481668 ) ) ( not ( = ?auto_481661 ?auto_481662 ) ) ( not ( = ?auto_481661 ?auto_481663 ) ) ( not ( = ?auto_481661 ?auto_481664 ) ) ( not ( = ?auto_481661 ?auto_481665 ) ) ( not ( = ?auto_481661 ?auto_481666 ) ) ( not ( = ?auto_481661 ?auto_481667 ) ) ( not ( = ?auto_481661 ?auto_481668 ) ) ( not ( = ?auto_481662 ?auto_481663 ) ) ( not ( = ?auto_481662 ?auto_481664 ) ) ( not ( = ?auto_481662 ?auto_481665 ) ) ( not ( = ?auto_481662 ?auto_481666 ) ) ( not ( = ?auto_481662 ?auto_481667 ) ) ( not ( = ?auto_481662 ?auto_481668 ) ) ( not ( = ?auto_481663 ?auto_481664 ) ) ( not ( = ?auto_481663 ?auto_481665 ) ) ( not ( = ?auto_481663 ?auto_481666 ) ) ( not ( = ?auto_481663 ?auto_481667 ) ) ( not ( = ?auto_481663 ?auto_481668 ) ) ( not ( = ?auto_481664 ?auto_481665 ) ) ( not ( = ?auto_481664 ?auto_481666 ) ) ( not ( = ?auto_481664 ?auto_481667 ) ) ( not ( = ?auto_481664 ?auto_481668 ) ) ( not ( = ?auto_481665 ?auto_481666 ) ) ( not ( = ?auto_481665 ?auto_481667 ) ) ( not ( = ?auto_481665 ?auto_481668 ) ) ( not ( = ?auto_481666 ?auto_481667 ) ) ( not ( = ?auto_481666 ?auto_481668 ) ) ( not ( = ?auto_481667 ?auto_481668 ) ) ( ON ?auto_481666 ?auto_481667 ) ( ON ?auto_481665 ?auto_481666 ) ( ON ?auto_481664 ?auto_481665 ) ( ON ?auto_481663 ?auto_481664 ) ( ON ?auto_481662 ?auto_481663 ) ( ON ?auto_481661 ?auto_481662 ) ( ON ?auto_481660 ?auto_481661 ) ( ON ?auto_481659 ?auto_481660 ) ( ON ?auto_481658 ?auto_481659 ) ( ON ?auto_481657 ?auto_481658 ) ( ON ?auto_481656 ?auto_481657 ) ( CLEAR ?auto_481654 ) ( ON ?auto_481655 ?auto_481656 ) ( CLEAR ?auto_481655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_481654 ?auto_481655 )
      ( MAKE-14PILE ?auto_481654 ?auto_481655 ?auto_481656 ?auto_481657 ?auto_481658 ?auto_481659 ?auto_481660 ?auto_481661 ?auto_481662 ?auto_481663 ?auto_481664 ?auto_481665 ?auto_481666 ?auto_481667 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_481712 - BLOCK
      ?auto_481713 - BLOCK
      ?auto_481714 - BLOCK
      ?auto_481715 - BLOCK
      ?auto_481716 - BLOCK
      ?auto_481717 - BLOCK
      ?auto_481718 - BLOCK
      ?auto_481719 - BLOCK
      ?auto_481720 - BLOCK
      ?auto_481721 - BLOCK
      ?auto_481722 - BLOCK
      ?auto_481723 - BLOCK
      ?auto_481724 - BLOCK
      ?auto_481725 - BLOCK
    )
    :vars
    (
      ?auto_481726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_481725 ?auto_481726 ) ( not ( = ?auto_481712 ?auto_481713 ) ) ( not ( = ?auto_481712 ?auto_481714 ) ) ( not ( = ?auto_481712 ?auto_481715 ) ) ( not ( = ?auto_481712 ?auto_481716 ) ) ( not ( = ?auto_481712 ?auto_481717 ) ) ( not ( = ?auto_481712 ?auto_481718 ) ) ( not ( = ?auto_481712 ?auto_481719 ) ) ( not ( = ?auto_481712 ?auto_481720 ) ) ( not ( = ?auto_481712 ?auto_481721 ) ) ( not ( = ?auto_481712 ?auto_481722 ) ) ( not ( = ?auto_481712 ?auto_481723 ) ) ( not ( = ?auto_481712 ?auto_481724 ) ) ( not ( = ?auto_481712 ?auto_481725 ) ) ( not ( = ?auto_481712 ?auto_481726 ) ) ( not ( = ?auto_481713 ?auto_481714 ) ) ( not ( = ?auto_481713 ?auto_481715 ) ) ( not ( = ?auto_481713 ?auto_481716 ) ) ( not ( = ?auto_481713 ?auto_481717 ) ) ( not ( = ?auto_481713 ?auto_481718 ) ) ( not ( = ?auto_481713 ?auto_481719 ) ) ( not ( = ?auto_481713 ?auto_481720 ) ) ( not ( = ?auto_481713 ?auto_481721 ) ) ( not ( = ?auto_481713 ?auto_481722 ) ) ( not ( = ?auto_481713 ?auto_481723 ) ) ( not ( = ?auto_481713 ?auto_481724 ) ) ( not ( = ?auto_481713 ?auto_481725 ) ) ( not ( = ?auto_481713 ?auto_481726 ) ) ( not ( = ?auto_481714 ?auto_481715 ) ) ( not ( = ?auto_481714 ?auto_481716 ) ) ( not ( = ?auto_481714 ?auto_481717 ) ) ( not ( = ?auto_481714 ?auto_481718 ) ) ( not ( = ?auto_481714 ?auto_481719 ) ) ( not ( = ?auto_481714 ?auto_481720 ) ) ( not ( = ?auto_481714 ?auto_481721 ) ) ( not ( = ?auto_481714 ?auto_481722 ) ) ( not ( = ?auto_481714 ?auto_481723 ) ) ( not ( = ?auto_481714 ?auto_481724 ) ) ( not ( = ?auto_481714 ?auto_481725 ) ) ( not ( = ?auto_481714 ?auto_481726 ) ) ( not ( = ?auto_481715 ?auto_481716 ) ) ( not ( = ?auto_481715 ?auto_481717 ) ) ( not ( = ?auto_481715 ?auto_481718 ) ) ( not ( = ?auto_481715 ?auto_481719 ) ) ( not ( = ?auto_481715 ?auto_481720 ) ) ( not ( = ?auto_481715 ?auto_481721 ) ) ( not ( = ?auto_481715 ?auto_481722 ) ) ( not ( = ?auto_481715 ?auto_481723 ) ) ( not ( = ?auto_481715 ?auto_481724 ) ) ( not ( = ?auto_481715 ?auto_481725 ) ) ( not ( = ?auto_481715 ?auto_481726 ) ) ( not ( = ?auto_481716 ?auto_481717 ) ) ( not ( = ?auto_481716 ?auto_481718 ) ) ( not ( = ?auto_481716 ?auto_481719 ) ) ( not ( = ?auto_481716 ?auto_481720 ) ) ( not ( = ?auto_481716 ?auto_481721 ) ) ( not ( = ?auto_481716 ?auto_481722 ) ) ( not ( = ?auto_481716 ?auto_481723 ) ) ( not ( = ?auto_481716 ?auto_481724 ) ) ( not ( = ?auto_481716 ?auto_481725 ) ) ( not ( = ?auto_481716 ?auto_481726 ) ) ( not ( = ?auto_481717 ?auto_481718 ) ) ( not ( = ?auto_481717 ?auto_481719 ) ) ( not ( = ?auto_481717 ?auto_481720 ) ) ( not ( = ?auto_481717 ?auto_481721 ) ) ( not ( = ?auto_481717 ?auto_481722 ) ) ( not ( = ?auto_481717 ?auto_481723 ) ) ( not ( = ?auto_481717 ?auto_481724 ) ) ( not ( = ?auto_481717 ?auto_481725 ) ) ( not ( = ?auto_481717 ?auto_481726 ) ) ( not ( = ?auto_481718 ?auto_481719 ) ) ( not ( = ?auto_481718 ?auto_481720 ) ) ( not ( = ?auto_481718 ?auto_481721 ) ) ( not ( = ?auto_481718 ?auto_481722 ) ) ( not ( = ?auto_481718 ?auto_481723 ) ) ( not ( = ?auto_481718 ?auto_481724 ) ) ( not ( = ?auto_481718 ?auto_481725 ) ) ( not ( = ?auto_481718 ?auto_481726 ) ) ( not ( = ?auto_481719 ?auto_481720 ) ) ( not ( = ?auto_481719 ?auto_481721 ) ) ( not ( = ?auto_481719 ?auto_481722 ) ) ( not ( = ?auto_481719 ?auto_481723 ) ) ( not ( = ?auto_481719 ?auto_481724 ) ) ( not ( = ?auto_481719 ?auto_481725 ) ) ( not ( = ?auto_481719 ?auto_481726 ) ) ( not ( = ?auto_481720 ?auto_481721 ) ) ( not ( = ?auto_481720 ?auto_481722 ) ) ( not ( = ?auto_481720 ?auto_481723 ) ) ( not ( = ?auto_481720 ?auto_481724 ) ) ( not ( = ?auto_481720 ?auto_481725 ) ) ( not ( = ?auto_481720 ?auto_481726 ) ) ( not ( = ?auto_481721 ?auto_481722 ) ) ( not ( = ?auto_481721 ?auto_481723 ) ) ( not ( = ?auto_481721 ?auto_481724 ) ) ( not ( = ?auto_481721 ?auto_481725 ) ) ( not ( = ?auto_481721 ?auto_481726 ) ) ( not ( = ?auto_481722 ?auto_481723 ) ) ( not ( = ?auto_481722 ?auto_481724 ) ) ( not ( = ?auto_481722 ?auto_481725 ) ) ( not ( = ?auto_481722 ?auto_481726 ) ) ( not ( = ?auto_481723 ?auto_481724 ) ) ( not ( = ?auto_481723 ?auto_481725 ) ) ( not ( = ?auto_481723 ?auto_481726 ) ) ( not ( = ?auto_481724 ?auto_481725 ) ) ( not ( = ?auto_481724 ?auto_481726 ) ) ( not ( = ?auto_481725 ?auto_481726 ) ) ( ON ?auto_481724 ?auto_481725 ) ( ON ?auto_481723 ?auto_481724 ) ( ON ?auto_481722 ?auto_481723 ) ( ON ?auto_481721 ?auto_481722 ) ( ON ?auto_481720 ?auto_481721 ) ( ON ?auto_481719 ?auto_481720 ) ( ON ?auto_481718 ?auto_481719 ) ( ON ?auto_481717 ?auto_481718 ) ( ON ?auto_481716 ?auto_481717 ) ( ON ?auto_481715 ?auto_481716 ) ( ON ?auto_481714 ?auto_481715 ) ( ON ?auto_481713 ?auto_481714 ) ( ON ?auto_481712 ?auto_481713 ) ( CLEAR ?auto_481712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_481712 )
      ( MAKE-14PILE ?auto_481712 ?auto_481713 ?auto_481714 ?auto_481715 ?auto_481716 ?auto_481717 ?auto_481718 ?auto_481719 ?auto_481720 ?auto_481721 ?auto_481722 ?auto_481723 ?auto_481724 ?auto_481725 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_481771 - BLOCK
      ?auto_481772 - BLOCK
      ?auto_481773 - BLOCK
      ?auto_481774 - BLOCK
      ?auto_481775 - BLOCK
      ?auto_481776 - BLOCK
      ?auto_481777 - BLOCK
      ?auto_481778 - BLOCK
      ?auto_481779 - BLOCK
      ?auto_481780 - BLOCK
      ?auto_481781 - BLOCK
      ?auto_481782 - BLOCK
      ?auto_481783 - BLOCK
      ?auto_481784 - BLOCK
      ?auto_481785 - BLOCK
    )
    :vars
    (
      ?auto_481786 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_481784 ) ( ON ?auto_481785 ?auto_481786 ) ( CLEAR ?auto_481785 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_481771 ) ( ON ?auto_481772 ?auto_481771 ) ( ON ?auto_481773 ?auto_481772 ) ( ON ?auto_481774 ?auto_481773 ) ( ON ?auto_481775 ?auto_481774 ) ( ON ?auto_481776 ?auto_481775 ) ( ON ?auto_481777 ?auto_481776 ) ( ON ?auto_481778 ?auto_481777 ) ( ON ?auto_481779 ?auto_481778 ) ( ON ?auto_481780 ?auto_481779 ) ( ON ?auto_481781 ?auto_481780 ) ( ON ?auto_481782 ?auto_481781 ) ( ON ?auto_481783 ?auto_481782 ) ( ON ?auto_481784 ?auto_481783 ) ( not ( = ?auto_481771 ?auto_481772 ) ) ( not ( = ?auto_481771 ?auto_481773 ) ) ( not ( = ?auto_481771 ?auto_481774 ) ) ( not ( = ?auto_481771 ?auto_481775 ) ) ( not ( = ?auto_481771 ?auto_481776 ) ) ( not ( = ?auto_481771 ?auto_481777 ) ) ( not ( = ?auto_481771 ?auto_481778 ) ) ( not ( = ?auto_481771 ?auto_481779 ) ) ( not ( = ?auto_481771 ?auto_481780 ) ) ( not ( = ?auto_481771 ?auto_481781 ) ) ( not ( = ?auto_481771 ?auto_481782 ) ) ( not ( = ?auto_481771 ?auto_481783 ) ) ( not ( = ?auto_481771 ?auto_481784 ) ) ( not ( = ?auto_481771 ?auto_481785 ) ) ( not ( = ?auto_481771 ?auto_481786 ) ) ( not ( = ?auto_481772 ?auto_481773 ) ) ( not ( = ?auto_481772 ?auto_481774 ) ) ( not ( = ?auto_481772 ?auto_481775 ) ) ( not ( = ?auto_481772 ?auto_481776 ) ) ( not ( = ?auto_481772 ?auto_481777 ) ) ( not ( = ?auto_481772 ?auto_481778 ) ) ( not ( = ?auto_481772 ?auto_481779 ) ) ( not ( = ?auto_481772 ?auto_481780 ) ) ( not ( = ?auto_481772 ?auto_481781 ) ) ( not ( = ?auto_481772 ?auto_481782 ) ) ( not ( = ?auto_481772 ?auto_481783 ) ) ( not ( = ?auto_481772 ?auto_481784 ) ) ( not ( = ?auto_481772 ?auto_481785 ) ) ( not ( = ?auto_481772 ?auto_481786 ) ) ( not ( = ?auto_481773 ?auto_481774 ) ) ( not ( = ?auto_481773 ?auto_481775 ) ) ( not ( = ?auto_481773 ?auto_481776 ) ) ( not ( = ?auto_481773 ?auto_481777 ) ) ( not ( = ?auto_481773 ?auto_481778 ) ) ( not ( = ?auto_481773 ?auto_481779 ) ) ( not ( = ?auto_481773 ?auto_481780 ) ) ( not ( = ?auto_481773 ?auto_481781 ) ) ( not ( = ?auto_481773 ?auto_481782 ) ) ( not ( = ?auto_481773 ?auto_481783 ) ) ( not ( = ?auto_481773 ?auto_481784 ) ) ( not ( = ?auto_481773 ?auto_481785 ) ) ( not ( = ?auto_481773 ?auto_481786 ) ) ( not ( = ?auto_481774 ?auto_481775 ) ) ( not ( = ?auto_481774 ?auto_481776 ) ) ( not ( = ?auto_481774 ?auto_481777 ) ) ( not ( = ?auto_481774 ?auto_481778 ) ) ( not ( = ?auto_481774 ?auto_481779 ) ) ( not ( = ?auto_481774 ?auto_481780 ) ) ( not ( = ?auto_481774 ?auto_481781 ) ) ( not ( = ?auto_481774 ?auto_481782 ) ) ( not ( = ?auto_481774 ?auto_481783 ) ) ( not ( = ?auto_481774 ?auto_481784 ) ) ( not ( = ?auto_481774 ?auto_481785 ) ) ( not ( = ?auto_481774 ?auto_481786 ) ) ( not ( = ?auto_481775 ?auto_481776 ) ) ( not ( = ?auto_481775 ?auto_481777 ) ) ( not ( = ?auto_481775 ?auto_481778 ) ) ( not ( = ?auto_481775 ?auto_481779 ) ) ( not ( = ?auto_481775 ?auto_481780 ) ) ( not ( = ?auto_481775 ?auto_481781 ) ) ( not ( = ?auto_481775 ?auto_481782 ) ) ( not ( = ?auto_481775 ?auto_481783 ) ) ( not ( = ?auto_481775 ?auto_481784 ) ) ( not ( = ?auto_481775 ?auto_481785 ) ) ( not ( = ?auto_481775 ?auto_481786 ) ) ( not ( = ?auto_481776 ?auto_481777 ) ) ( not ( = ?auto_481776 ?auto_481778 ) ) ( not ( = ?auto_481776 ?auto_481779 ) ) ( not ( = ?auto_481776 ?auto_481780 ) ) ( not ( = ?auto_481776 ?auto_481781 ) ) ( not ( = ?auto_481776 ?auto_481782 ) ) ( not ( = ?auto_481776 ?auto_481783 ) ) ( not ( = ?auto_481776 ?auto_481784 ) ) ( not ( = ?auto_481776 ?auto_481785 ) ) ( not ( = ?auto_481776 ?auto_481786 ) ) ( not ( = ?auto_481777 ?auto_481778 ) ) ( not ( = ?auto_481777 ?auto_481779 ) ) ( not ( = ?auto_481777 ?auto_481780 ) ) ( not ( = ?auto_481777 ?auto_481781 ) ) ( not ( = ?auto_481777 ?auto_481782 ) ) ( not ( = ?auto_481777 ?auto_481783 ) ) ( not ( = ?auto_481777 ?auto_481784 ) ) ( not ( = ?auto_481777 ?auto_481785 ) ) ( not ( = ?auto_481777 ?auto_481786 ) ) ( not ( = ?auto_481778 ?auto_481779 ) ) ( not ( = ?auto_481778 ?auto_481780 ) ) ( not ( = ?auto_481778 ?auto_481781 ) ) ( not ( = ?auto_481778 ?auto_481782 ) ) ( not ( = ?auto_481778 ?auto_481783 ) ) ( not ( = ?auto_481778 ?auto_481784 ) ) ( not ( = ?auto_481778 ?auto_481785 ) ) ( not ( = ?auto_481778 ?auto_481786 ) ) ( not ( = ?auto_481779 ?auto_481780 ) ) ( not ( = ?auto_481779 ?auto_481781 ) ) ( not ( = ?auto_481779 ?auto_481782 ) ) ( not ( = ?auto_481779 ?auto_481783 ) ) ( not ( = ?auto_481779 ?auto_481784 ) ) ( not ( = ?auto_481779 ?auto_481785 ) ) ( not ( = ?auto_481779 ?auto_481786 ) ) ( not ( = ?auto_481780 ?auto_481781 ) ) ( not ( = ?auto_481780 ?auto_481782 ) ) ( not ( = ?auto_481780 ?auto_481783 ) ) ( not ( = ?auto_481780 ?auto_481784 ) ) ( not ( = ?auto_481780 ?auto_481785 ) ) ( not ( = ?auto_481780 ?auto_481786 ) ) ( not ( = ?auto_481781 ?auto_481782 ) ) ( not ( = ?auto_481781 ?auto_481783 ) ) ( not ( = ?auto_481781 ?auto_481784 ) ) ( not ( = ?auto_481781 ?auto_481785 ) ) ( not ( = ?auto_481781 ?auto_481786 ) ) ( not ( = ?auto_481782 ?auto_481783 ) ) ( not ( = ?auto_481782 ?auto_481784 ) ) ( not ( = ?auto_481782 ?auto_481785 ) ) ( not ( = ?auto_481782 ?auto_481786 ) ) ( not ( = ?auto_481783 ?auto_481784 ) ) ( not ( = ?auto_481783 ?auto_481785 ) ) ( not ( = ?auto_481783 ?auto_481786 ) ) ( not ( = ?auto_481784 ?auto_481785 ) ) ( not ( = ?auto_481784 ?auto_481786 ) ) ( not ( = ?auto_481785 ?auto_481786 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_481785 ?auto_481786 )
      ( !STACK ?auto_481785 ?auto_481784 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_481833 - BLOCK
      ?auto_481834 - BLOCK
      ?auto_481835 - BLOCK
      ?auto_481836 - BLOCK
      ?auto_481837 - BLOCK
      ?auto_481838 - BLOCK
      ?auto_481839 - BLOCK
      ?auto_481840 - BLOCK
      ?auto_481841 - BLOCK
      ?auto_481842 - BLOCK
      ?auto_481843 - BLOCK
      ?auto_481844 - BLOCK
      ?auto_481845 - BLOCK
      ?auto_481846 - BLOCK
      ?auto_481847 - BLOCK
    )
    :vars
    (
      ?auto_481848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_481847 ?auto_481848 ) ( ON-TABLE ?auto_481833 ) ( ON ?auto_481834 ?auto_481833 ) ( ON ?auto_481835 ?auto_481834 ) ( ON ?auto_481836 ?auto_481835 ) ( ON ?auto_481837 ?auto_481836 ) ( ON ?auto_481838 ?auto_481837 ) ( ON ?auto_481839 ?auto_481838 ) ( ON ?auto_481840 ?auto_481839 ) ( ON ?auto_481841 ?auto_481840 ) ( ON ?auto_481842 ?auto_481841 ) ( ON ?auto_481843 ?auto_481842 ) ( ON ?auto_481844 ?auto_481843 ) ( ON ?auto_481845 ?auto_481844 ) ( not ( = ?auto_481833 ?auto_481834 ) ) ( not ( = ?auto_481833 ?auto_481835 ) ) ( not ( = ?auto_481833 ?auto_481836 ) ) ( not ( = ?auto_481833 ?auto_481837 ) ) ( not ( = ?auto_481833 ?auto_481838 ) ) ( not ( = ?auto_481833 ?auto_481839 ) ) ( not ( = ?auto_481833 ?auto_481840 ) ) ( not ( = ?auto_481833 ?auto_481841 ) ) ( not ( = ?auto_481833 ?auto_481842 ) ) ( not ( = ?auto_481833 ?auto_481843 ) ) ( not ( = ?auto_481833 ?auto_481844 ) ) ( not ( = ?auto_481833 ?auto_481845 ) ) ( not ( = ?auto_481833 ?auto_481846 ) ) ( not ( = ?auto_481833 ?auto_481847 ) ) ( not ( = ?auto_481833 ?auto_481848 ) ) ( not ( = ?auto_481834 ?auto_481835 ) ) ( not ( = ?auto_481834 ?auto_481836 ) ) ( not ( = ?auto_481834 ?auto_481837 ) ) ( not ( = ?auto_481834 ?auto_481838 ) ) ( not ( = ?auto_481834 ?auto_481839 ) ) ( not ( = ?auto_481834 ?auto_481840 ) ) ( not ( = ?auto_481834 ?auto_481841 ) ) ( not ( = ?auto_481834 ?auto_481842 ) ) ( not ( = ?auto_481834 ?auto_481843 ) ) ( not ( = ?auto_481834 ?auto_481844 ) ) ( not ( = ?auto_481834 ?auto_481845 ) ) ( not ( = ?auto_481834 ?auto_481846 ) ) ( not ( = ?auto_481834 ?auto_481847 ) ) ( not ( = ?auto_481834 ?auto_481848 ) ) ( not ( = ?auto_481835 ?auto_481836 ) ) ( not ( = ?auto_481835 ?auto_481837 ) ) ( not ( = ?auto_481835 ?auto_481838 ) ) ( not ( = ?auto_481835 ?auto_481839 ) ) ( not ( = ?auto_481835 ?auto_481840 ) ) ( not ( = ?auto_481835 ?auto_481841 ) ) ( not ( = ?auto_481835 ?auto_481842 ) ) ( not ( = ?auto_481835 ?auto_481843 ) ) ( not ( = ?auto_481835 ?auto_481844 ) ) ( not ( = ?auto_481835 ?auto_481845 ) ) ( not ( = ?auto_481835 ?auto_481846 ) ) ( not ( = ?auto_481835 ?auto_481847 ) ) ( not ( = ?auto_481835 ?auto_481848 ) ) ( not ( = ?auto_481836 ?auto_481837 ) ) ( not ( = ?auto_481836 ?auto_481838 ) ) ( not ( = ?auto_481836 ?auto_481839 ) ) ( not ( = ?auto_481836 ?auto_481840 ) ) ( not ( = ?auto_481836 ?auto_481841 ) ) ( not ( = ?auto_481836 ?auto_481842 ) ) ( not ( = ?auto_481836 ?auto_481843 ) ) ( not ( = ?auto_481836 ?auto_481844 ) ) ( not ( = ?auto_481836 ?auto_481845 ) ) ( not ( = ?auto_481836 ?auto_481846 ) ) ( not ( = ?auto_481836 ?auto_481847 ) ) ( not ( = ?auto_481836 ?auto_481848 ) ) ( not ( = ?auto_481837 ?auto_481838 ) ) ( not ( = ?auto_481837 ?auto_481839 ) ) ( not ( = ?auto_481837 ?auto_481840 ) ) ( not ( = ?auto_481837 ?auto_481841 ) ) ( not ( = ?auto_481837 ?auto_481842 ) ) ( not ( = ?auto_481837 ?auto_481843 ) ) ( not ( = ?auto_481837 ?auto_481844 ) ) ( not ( = ?auto_481837 ?auto_481845 ) ) ( not ( = ?auto_481837 ?auto_481846 ) ) ( not ( = ?auto_481837 ?auto_481847 ) ) ( not ( = ?auto_481837 ?auto_481848 ) ) ( not ( = ?auto_481838 ?auto_481839 ) ) ( not ( = ?auto_481838 ?auto_481840 ) ) ( not ( = ?auto_481838 ?auto_481841 ) ) ( not ( = ?auto_481838 ?auto_481842 ) ) ( not ( = ?auto_481838 ?auto_481843 ) ) ( not ( = ?auto_481838 ?auto_481844 ) ) ( not ( = ?auto_481838 ?auto_481845 ) ) ( not ( = ?auto_481838 ?auto_481846 ) ) ( not ( = ?auto_481838 ?auto_481847 ) ) ( not ( = ?auto_481838 ?auto_481848 ) ) ( not ( = ?auto_481839 ?auto_481840 ) ) ( not ( = ?auto_481839 ?auto_481841 ) ) ( not ( = ?auto_481839 ?auto_481842 ) ) ( not ( = ?auto_481839 ?auto_481843 ) ) ( not ( = ?auto_481839 ?auto_481844 ) ) ( not ( = ?auto_481839 ?auto_481845 ) ) ( not ( = ?auto_481839 ?auto_481846 ) ) ( not ( = ?auto_481839 ?auto_481847 ) ) ( not ( = ?auto_481839 ?auto_481848 ) ) ( not ( = ?auto_481840 ?auto_481841 ) ) ( not ( = ?auto_481840 ?auto_481842 ) ) ( not ( = ?auto_481840 ?auto_481843 ) ) ( not ( = ?auto_481840 ?auto_481844 ) ) ( not ( = ?auto_481840 ?auto_481845 ) ) ( not ( = ?auto_481840 ?auto_481846 ) ) ( not ( = ?auto_481840 ?auto_481847 ) ) ( not ( = ?auto_481840 ?auto_481848 ) ) ( not ( = ?auto_481841 ?auto_481842 ) ) ( not ( = ?auto_481841 ?auto_481843 ) ) ( not ( = ?auto_481841 ?auto_481844 ) ) ( not ( = ?auto_481841 ?auto_481845 ) ) ( not ( = ?auto_481841 ?auto_481846 ) ) ( not ( = ?auto_481841 ?auto_481847 ) ) ( not ( = ?auto_481841 ?auto_481848 ) ) ( not ( = ?auto_481842 ?auto_481843 ) ) ( not ( = ?auto_481842 ?auto_481844 ) ) ( not ( = ?auto_481842 ?auto_481845 ) ) ( not ( = ?auto_481842 ?auto_481846 ) ) ( not ( = ?auto_481842 ?auto_481847 ) ) ( not ( = ?auto_481842 ?auto_481848 ) ) ( not ( = ?auto_481843 ?auto_481844 ) ) ( not ( = ?auto_481843 ?auto_481845 ) ) ( not ( = ?auto_481843 ?auto_481846 ) ) ( not ( = ?auto_481843 ?auto_481847 ) ) ( not ( = ?auto_481843 ?auto_481848 ) ) ( not ( = ?auto_481844 ?auto_481845 ) ) ( not ( = ?auto_481844 ?auto_481846 ) ) ( not ( = ?auto_481844 ?auto_481847 ) ) ( not ( = ?auto_481844 ?auto_481848 ) ) ( not ( = ?auto_481845 ?auto_481846 ) ) ( not ( = ?auto_481845 ?auto_481847 ) ) ( not ( = ?auto_481845 ?auto_481848 ) ) ( not ( = ?auto_481846 ?auto_481847 ) ) ( not ( = ?auto_481846 ?auto_481848 ) ) ( not ( = ?auto_481847 ?auto_481848 ) ) ( CLEAR ?auto_481845 ) ( ON ?auto_481846 ?auto_481847 ) ( CLEAR ?auto_481846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_481833 ?auto_481834 ?auto_481835 ?auto_481836 ?auto_481837 ?auto_481838 ?auto_481839 ?auto_481840 ?auto_481841 ?auto_481842 ?auto_481843 ?auto_481844 ?auto_481845 ?auto_481846 )
      ( MAKE-15PILE ?auto_481833 ?auto_481834 ?auto_481835 ?auto_481836 ?auto_481837 ?auto_481838 ?auto_481839 ?auto_481840 ?auto_481841 ?auto_481842 ?auto_481843 ?auto_481844 ?auto_481845 ?auto_481846 ?auto_481847 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_481895 - BLOCK
      ?auto_481896 - BLOCK
      ?auto_481897 - BLOCK
      ?auto_481898 - BLOCK
      ?auto_481899 - BLOCK
      ?auto_481900 - BLOCK
      ?auto_481901 - BLOCK
      ?auto_481902 - BLOCK
      ?auto_481903 - BLOCK
      ?auto_481904 - BLOCK
      ?auto_481905 - BLOCK
      ?auto_481906 - BLOCK
      ?auto_481907 - BLOCK
      ?auto_481908 - BLOCK
      ?auto_481909 - BLOCK
    )
    :vars
    (
      ?auto_481910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_481909 ?auto_481910 ) ( ON-TABLE ?auto_481895 ) ( ON ?auto_481896 ?auto_481895 ) ( ON ?auto_481897 ?auto_481896 ) ( ON ?auto_481898 ?auto_481897 ) ( ON ?auto_481899 ?auto_481898 ) ( ON ?auto_481900 ?auto_481899 ) ( ON ?auto_481901 ?auto_481900 ) ( ON ?auto_481902 ?auto_481901 ) ( ON ?auto_481903 ?auto_481902 ) ( ON ?auto_481904 ?auto_481903 ) ( ON ?auto_481905 ?auto_481904 ) ( ON ?auto_481906 ?auto_481905 ) ( not ( = ?auto_481895 ?auto_481896 ) ) ( not ( = ?auto_481895 ?auto_481897 ) ) ( not ( = ?auto_481895 ?auto_481898 ) ) ( not ( = ?auto_481895 ?auto_481899 ) ) ( not ( = ?auto_481895 ?auto_481900 ) ) ( not ( = ?auto_481895 ?auto_481901 ) ) ( not ( = ?auto_481895 ?auto_481902 ) ) ( not ( = ?auto_481895 ?auto_481903 ) ) ( not ( = ?auto_481895 ?auto_481904 ) ) ( not ( = ?auto_481895 ?auto_481905 ) ) ( not ( = ?auto_481895 ?auto_481906 ) ) ( not ( = ?auto_481895 ?auto_481907 ) ) ( not ( = ?auto_481895 ?auto_481908 ) ) ( not ( = ?auto_481895 ?auto_481909 ) ) ( not ( = ?auto_481895 ?auto_481910 ) ) ( not ( = ?auto_481896 ?auto_481897 ) ) ( not ( = ?auto_481896 ?auto_481898 ) ) ( not ( = ?auto_481896 ?auto_481899 ) ) ( not ( = ?auto_481896 ?auto_481900 ) ) ( not ( = ?auto_481896 ?auto_481901 ) ) ( not ( = ?auto_481896 ?auto_481902 ) ) ( not ( = ?auto_481896 ?auto_481903 ) ) ( not ( = ?auto_481896 ?auto_481904 ) ) ( not ( = ?auto_481896 ?auto_481905 ) ) ( not ( = ?auto_481896 ?auto_481906 ) ) ( not ( = ?auto_481896 ?auto_481907 ) ) ( not ( = ?auto_481896 ?auto_481908 ) ) ( not ( = ?auto_481896 ?auto_481909 ) ) ( not ( = ?auto_481896 ?auto_481910 ) ) ( not ( = ?auto_481897 ?auto_481898 ) ) ( not ( = ?auto_481897 ?auto_481899 ) ) ( not ( = ?auto_481897 ?auto_481900 ) ) ( not ( = ?auto_481897 ?auto_481901 ) ) ( not ( = ?auto_481897 ?auto_481902 ) ) ( not ( = ?auto_481897 ?auto_481903 ) ) ( not ( = ?auto_481897 ?auto_481904 ) ) ( not ( = ?auto_481897 ?auto_481905 ) ) ( not ( = ?auto_481897 ?auto_481906 ) ) ( not ( = ?auto_481897 ?auto_481907 ) ) ( not ( = ?auto_481897 ?auto_481908 ) ) ( not ( = ?auto_481897 ?auto_481909 ) ) ( not ( = ?auto_481897 ?auto_481910 ) ) ( not ( = ?auto_481898 ?auto_481899 ) ) ( not ( = ?auto_481898 ?auto_481900 ) ) ( not ( = ?auto_481898 ?auto_481901 ) ) ( not ( = ?auto_481898 ?auto_481902 ) ) ( not ( = ?auto_481898 ?auto_481903 ) ) ( not ( = ?auto_481898 ?auto_481904 ) ) ( not ( = ?auto_481898 ?auto_481905 ) ) ( not ( = ?auto_481898 ?auto_481906 ) ) ( not ( = ?auto_481898 ?auto_481907 ) ) ( not ( = ?auto_481898 ?auto_481908 ) ) ( not ( = ?auto_481898 ?auto_481909 ) ) ( not ( = ?auto_481898 ?auto_481910 ) ) ( not ( = ?auto_481899 ?auto_481900 ) ) ( not ( = ?auto_481899 ?auto_481901 ) ) ( not ( = ?auto_481899 ?auto_481902 ) ) ( not ( = ?auto_481899 ?auto_481903 ) ) ( not ( = ?auto_481899 ?auto_481904 ) ) ( not ( = ?auto_481899 ?auto_481905 ) ) ( not ( = ?auto_481899 ?auto_481906 ) ) ( not ( = ?auto_481899 ?auto_481907 ) ) ( not ( = ?auto_481899 ?auto_481908 ) ) ( not ( = ?auto_481899 ?auto_481909 ) ) ( not ( = ?auto_481899 ?auto_481910 ) ) ( not ( = ?auto_481900 ?auto_481901 ) ) ( not ( = ?auto_481900 ?auto_481902 ) ) ( not ( = ?auto_481900 ?auto_481903 ) ) ( not ( = ?auto_481900 ?auto_481904 ) ) ( not ( = ?auto_481900 ?auto_481905 ) ) ( not ( = ?auto_481900 ?auto_481906 ) ) ( not ( = ?auto_481900 ?auto_481907 ) ) ( not ( = ?auto_481900 ?auto_481908 ) ) ( not ( = ?auto_481900 ?auto_481909 ) ) ( not ( = ?auto_481900 ?auto_481910 ) ) ( not ( = ?auto_481901 ?auto_481902 ) ) ( not ( = ?auto_481901 ?auto_481903 ) ) ( not ( = ?auto_481901 ?auto_481904 ) ) ( not ( = ?auto_481901 ?auto_481905 ) ) ( not ( = ?auto_481901 ?auto_481906 ) ) ( not ( = ?auto_481901 ?auto_481907 ) ) ( not ( = ?auto_481901 ?auto_481908 ) ) ( not ( = ?auto_481901 ?auto_481909 ) ) ( not ( = ?auto_481901 ?auto_481910 ) ) ( not ( = ?auto_481902 ?auto_481903 ) ) ( not ( = ?auto_481902 ?auto_481904 ) ) ( not ( = ?auto_481902 ?auto_481905 ) ) ( not ( = ?auto_481902 ?auto_481906 ) ) ( not ( = ?auto_481902 ?auto_481907 ) ) ( not ( = ?auto_481902 ?auto_481908 ) ) ( not ( = ?auto_481902 ?auto_481909 ) ) ( not ( = ?auto_481902 ?auto_481910 ) ) ( not ( = ?auto_481903 ?auto_481904 ) ) ( not ( = ?auto_481903 ?auto_481905 ) ) ( not ( = ?auto_481903 ?auto_481906 ) ) ( not ( = ?auto_481903 ?auto_481907 ) ) ( not ( = ?auto_481903 ?auto_481908 ) ) ( not ( = ?auto_481903 ?auto_481909 ) ) ( not ( = ?auto_481903 ?auto_481910 ) ) ( not ( = ?auto_481904 ?auto_481905 ) ) ( not ( = ?auto_481904 ?auto_481906 ) ) ( not ( = ?auto_481904 ?auto_481907 ) ) ( not ( = ?auto_481904 ?auto_481908 ) ) ( not ( = ?auto_481904 ?auto_481909 ) ) ( not ( = ?auto_481904 ?auto_481910 ) ) ( not ( = ?auto_481905 ?auto_481906 ) ) ( not ( = ?auto_481905 ?auto_481907 ) ) ( not ( = ?auto_481905 ?auto_481908 ) ) ( not ( = ?auto_481905 ?auto_481909 ) ) ( not ( = ?auto_481905 ?auto_481910 ) ) ( not ( = ?auto_481906 ?auto_481907 ) ) ( not ( = ?auto_481906 ?auto_481908 ) ) ( not ( = ?auto_481906 ?auto_481909 ) ) ( not ( = ?auto_481906 ?auto_481910 ) ) ( not ( = ?auto_481907 ?auto_481908 ) ) ( not ( = ?auto_481907 ?auto_481909 ) ) ( not ( = ?auto_481907 ?auto_481910 ) ) ( not ( = ?auto_481908 ?auto_481909 ) ) ( not ( = ?auto_481908 ?auto_481910 ) ) ( not ( = ?auto_481909 ?auto_481910 ) ) ( ON ?auto_481908 ?auto_481909 ) ( CLEAR ?auto_481906 ) ( ON ?auto_481907 ?auto_481908 ) ( CLEAR ?auto_481907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_481895 ?auto_481896 ?auto_481897 ?auto_481898 ?auto_481899 ?auto_481900 ?auto_481901 ?auto_481902 ?auto_481903 ?auto_481904 ?auto_481905 ?auto_481906 ?auto_481907 )
      ( MAKE-15PILE ?auto_481895 ?auto_481896 ?auto_481897 ?auto_481898 ?auto_481899 ?auto_481900 ?auto_481901 ?auto_481902 ?auto_481903 ?auto_481904 ?auto_481905 ?auto_481906 ?auto_481907 ?auto_481908 ?auto_481909 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_481957 - BLOCK
      ?auto_481958 - BLOCK
      ?auto_481959 - BLOCK
      ?auto_481960 - BLOCK
      ?auto_481961 - BLOCK
      ?auto_481962 - BLOCK
      ?auto_481963 - BLOCK
      ?auto_481964 - BLOCK
      ?auto_481965 - BLOCK
      ?auto_481966 - BLOCK
      ?auto_481967 - BLOCK
      ?auto_481968 - BLOCK
      ?auto_481969 - BLOCK
      ?auto_481970 - BLOCK
      ?auto_481971 - BLOCK
    )
    :vars
    (
      ?auto_481972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_481971 ?auto_481972 ) ( ON-TABLE ?auto_481957 ) ( ON ?auto_481958 ?auto_481957 ) ( ON ?auto_481959 ?auto_481958 ) ( ON ?auto_481960 ?auto_481959 ) ( ON ?auto_481961 ?auto_481960 ) ( ON ?auto_481962 ?auto_481961 ) ( ON ?auto_481963 ?auto_481962 ) ( ON ?auto_481964 ?auto_481963 ) ( ON ?auto_481965 ?auto_481964 ) ( ON ?auto_481966 ?auto_481965 ) ( ON ?auto_481967 ?auto_481966 ) ( not ( = ?auto_481957 ?auto_481958 ) ) ( not ( = ?auto_481957 ?auto_481959 ) ) ( not ( = ?auto_481957 ?auto_481960 ) ) ( not ( = ?auto_481957 ?auto_481961 ) ) ( not ( = ?auto_481957 ?auto_481962 ) ) ( not ( = ?auto_481957 ?auto_481963 ) ) ( not ( = ?auto_481957 ?auto_481964 ) ) ( not ( = ?auto_481957 ?auto_481965 ) ) ( not ( = ?auto_481957 ?auto_481966 ) ) ( not ( = ?auto_481957 ?auto_481967 ) ) ( not ( = ?auto_481957 ?auto_481968 ) ) ( not ( = ?auto_481957 ?auto_481969 ) ) ( not ( = ?auto_481957 ?auto_481970 ) ) ( not ( = ?auto_481957 ?auto_481971 ) ) ( not ( = ?auto_481957 ?auto_481972 ) ) ( not ( = ?auto_481958 ?auto_481959 ) ) ( not ( = ?auto_481958 ?auto_481960 ) ) ( not ( = ?auto_481958 ?auto_481961 ) ) ( not ( = ?auto_481958 ?auto_481962 ) ) ( not ( = ?auto_481958 ?auto_481963 ) ) ( not ( = ?auto_481958 ?auto_481964 ) ) ( not ( = ?auto_481958 ?auto_481965 ) ) ( not ( = ?auto_481958 ?auto_481966 ) ) ( not ( = ?auto_481958 ?auto_481967 ) ) ( not ( = ?auto_481958 ?auto_481968 ) ) ( not ( = ?auto_481958 ?auto_481969 ) ) ( not ( = ?auto_481958 ?auto_481970 ) ) ( not ( = ?auto_481958 ?auto_481971 ) ) ( not ( = ?auto_481958 ?auto_481972 ) ) ( not ( = ?auto_481959 ?auto_481960 ) ) ( not ( = ?auto_481959 ?auto_481961 ) ) ( not ( = ?auto_481959 ?auto_481962 ) ) ( not ( = ?auto_481959 ?auto_481963 ) ) ( not ( = ?auto_481959 ?auto_481964 ) ) ( not ( = ?auto_481959 ?auto_481965 ) ) ( not ( = ?auto_481959 ?auto_481966 ) ) ( not ( = ?auto_481959 ?auto_481967 ) ) ( not ( = ?auto_481959 ?auto_481968 ) ) ( not ( = ?auto_481959 ?auto_481969 ) ) ( not ( = ?auto_481959 ?auto_481970 ) ) ( not ( = ?auto_481959 ?auto_481971 ) ) ( not ( = ?auto_481959 ?auto_481972 ) ) ( not ( = ?auto_481960 ?auto_481961 ) ) ( not ( = ?auto_481960 ?auto_481962 ) ) ( not ( = ?auto_481960 ?auto_481963 ) ) ( not ( = ?auto_481960 ?auto_481964 ) ) ( not ( = ?auto_481960 ?auto_481965 ) ) ( not ( = ?auto_481960 ?auto_481966 ) ) ( not ( = ?auto_481960 ?auto_481967 ) ) ( not ( = ?auto_481960 ?auto_481968 ) ) ( not ( = ?auto_481960 ?auto_481969 ) ) ( not ( = ?auto_481960 ?auto_481970 ) ) ( not ( = ?auto_481960 ?auto_481971 ) ) ( not ( = ?auto_481960 ?auto_481972 ) ) ( not ( = ?auto_481961 ?auto_481962 ) ) ( not ( = ?auto_481961 ?auto_481963 ) ) ( not ( = ?auto_481961 ?auto_481964 ) ) ( not ( = ?auto_481961 ?auto_481965 ) ) ( not ( = ?auto_481961 ?auto_481966 ) ) ( not ( = ?auto_481961 ?auto_481967 ) ) ( not ( = ?auto_481961 ?auto_481968 ) ) ( not ( = ?auto_481961 ?auto_481969 ) ) ( not ( = ?auto_481961 ?auto_481970 ) ) ( not ( = ?auto_481961 ?auto_481971 ) ) ( not ( = ?auto_481961 ?auto_481972 ) ) ( not ( = ?auto_481962 ?auto_481963 ) ) ( not ( = ?auto_481962 ?auto_481964 ) ) ( not ( = ?auto_481962 ?auto_481965 ) ) ( not ( = ?auto_481962 ?auto_481966 ) ) ( not ( = ?auto_481962 ?auto_481967 ) ) ( not ( = ?auto_481962 ?auto_481968 ) ) ( not ( = ?auto_481962 ?auto_481969 ) ) ( not ( = ?auto_481962 ?auto_481970 ) ) ( not ( = ?auto_481962 ?auto_481971 ) ) ( not ( = ?auto_481962 ?auto_481972 ) ) ( not ( = ?auto_481963 ?auto_481964 ) ) ( not ( = ?auto_481963 ?auto_481965 ) ) ( not ( = ?auto_481963 ?auto_481966 ) ) ( not ( = ?auto_481963 ?auto_481967 ) ) ( not ( = ?auto_481963 ?auto_481968 ) ) ( not ( = ?auto_481963 ?auto_481969 ) ) ( not ( = ?auto_481963 ?auto_481970 ) ) ( not ( = ?auto_481963 ?auto_481971 ) ) ( not ( = ?auto_481963 ?auto_481972 ) ) ( not ( = ?auto_481964 ?auto_481965 ) ) ( not ( = ?auto_481964 ?auto_481966 ) ) ( not ( = ?auto_481964 ?auto_481967 ) ) ( not ( = ?auto_481964 ?auto_481968 ) ) ( not ( = ?auto_481964 ?auto_481969 ) ) ( not ( = ?auto_481964 ?auto_481970 ) ) ( not ( = ?auto_481964 ?auto_481971 ) ) ( not ( = ?auto_481964 ?auto_481972 ) ) ( not ( = ?auto_481965 ?auto_481966 ) ) ( not ( = ?auto_481965 ?auto_481967 ) ) ( not ( = ?auto_481965 ?auto_481968 ) ) ( not ( = ?auto_481965 ?auto_481969 ) ) ( not ( = ?auto_481965 ?auto_481970 ) ) ( not ( = ?auto_481965 ?auto_481971 ) ) ( not ( = ?auto_481965 ?auto_481972 ) ) ( not ( = ?auto_481966 ?auto_481967 ) ) ( not ( = ?auto_481966 ?auto_481968 ) ) ( not ( = ?auto_481966 ?auto_481969 ) ) ( not ( = ?auto_481966 ?auto_481970 ) ) ( not ( = ?auto_481966 ?auto_481971 ) ) ( not ( = ?auto_481966 ?auto_481972 ) ) ( not ( = ?auto_481967 ?auto_481968 ) ) ( not ( = ?auto_481967 ?auto_481969 ) ) ( not ( = ?auto_481967 ?auto_481970 ) ) ( not ( = ?auto_481967 ?auto_481971 ) ) ( not ( = ?auto_481967 ?auto_481972 ) ) ( not ( = ?auto_481968 ?auto_481969 ) ) ( not ( = ?auto_481968 ?auto_481970 ) ) ( not ( = ?auto_481968 ?auto_481971 ) ) ( not ( = ?auto_481968 ?auto_481972 ) ) ( not ( = ?auto_481969 ?auto_481970 ) ) ( not ( = ?auto_481969 ?auto_481971 ) ) ( not ( = ?auto_481969 ?auto_481972 ) ) ( not ( = ?auto_481970 ?auto_481971 ) ) ( not ( = ?auto_481970 ?auto_481972 ) ) ( not ( = ?auto_481971 ?auto_481972 ) ) ( ON ?auto_481970 ?auto_481971 ) ( ON ?auto_481969 ?auto_481970 ) ( CLEAR ?auto_481967 ) ( ON ?auto_481968 ?auto_481969 ) ( CLEAR ?auto_481968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_481957 ?auto_481958 ?auto_481959 ?auto_481960 ?auto_481961 ?auto_481962 ?auto_481963 ?auto_481964 ?auto_481965 ?auto_481966 ?auto_481967 ?auto_481968 )
      ( MAKE-15PILE ?auto_481957 ?auto_481958 ?auto_481959 ?auto_481960 ?auto_481961 ?auto_481962 ?auto_481963 ?auto_481964 ?auto_481965 ?auto_481966 ?auto_481967 ?auto_481968 ?auto_481969 ?auto_481970 ?auto_481971 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_482019 - BLOCK
      ?auto_482020 - BLOCK
      ?auto_482021 - BLOCK
      ?auto_482022 - BLOCK
      ?auto_482023 - BLOCK
      ?auto_482024 - BLOCK
      ?auto_482025 - BLOCK
      ?auto_482026 - BLOCK
      ?auto_482027 - BLOCK
      ?auto_482028 - BLOCK
      ?auto_482029 - BLOCK
      ?auto_482030 - BLOCK
      ?auto_482031 - BLOCK
      ?auto_482032 - BLOCK
      ?auto_482033 - BLOCK
    )
    :vars
    (
      ?auto_482034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_482033 ?auto_482034 ) ( ON-TABLE ?auto_482019 ) ( ON ?auto_482020 ?auto_482019 ) ( ON ?auto_482021 ?auto_482020 ) ( ON ?auto_482022 ?auto_482021 ) ( ON ?auto_482023 ?auto_482022 ) ( ON ?auto_482024 ?auto_482023 ) ( ON ?auto_482025 ?auto_482024 ) ( ON ?auto_482026 ?auto_482025 ) ( ON ?auto_482027 ?auto_482026 ) ( ON ?auto_482028 ?auto_482027 ) ( not ( = ?auto_482019 ?auto_482020 ) ) ( not ( = ?auto_482019 ?auto_482021 ) ) ( not ( = ?auto_482019 ?auto_482022 ) ) ( not ( = ?auto_482019 ?auto_482023 ) ) ( not ( = ?auto_482019 ?auto_482024 ) ) ( not ( = ?auto_482019 ?auto_482025 ) ) ( not ( = ?auto_482019 ?auto_482026 ) ) ( not ( = ?auto_482019 ?auto_482027 ) ) ( not ( = ?auto_482019 ?auto_482028 ) ) ( not ( = ?auto_482019 ?auto_482029 ) ) ( not ( = ?auto_482019 ?auto_482030 ) ) ( not ( = ?auto_482019 ?auto_482031 ) ) ( not ( = ?auto_482019 ?auto_482032 ) ) ( not ( = ?auto_482019 ?auto_482033 ) ) ( not ( = ?auto_482019 ?auto_482034 ) ) ( not ( = ?auto_482020 ?auto_482021 ) ) ( not ( = ?auto_482020 ?auto_482022 ) ) ( not ( = ?auto_482020 ?auto_482023 ) ) ( not ( = ?auto_482020 ?auto_482024 ) ) ( not ( = ?auto_482020 ?auto_482025 ) ) ( not ( = ?auto_482020 ?auto_482026 ) ) ( not ( = ?auto_482020 ?auto_482027 ) ) ( not ( = ?auto_482020 ?auto_482028 ) ) ( not ( = ?auto_482020 ?auto_482029 ) ) ( not ( = ?auto_482020 ?auto_482030 ) ) ( not ( = ?auto_482020 ?auto_482031 ) ) ( not ( = ?auto_482020 ?auto_482032 ) ) ( not ( = ?auto_482020 ?auto_482033 ) ) ( not ( = ?auto_482020 ?auto_482034 ) ) ( not ( = ?auto_482021 ?auto_482022 ) ) ( not ( = ?auto_482021 ?auto_482023 ) ) ( not ( = ?auto_482021 ?auto_482024 ) ) ( not ( = ?auto_482021 ?auto_482025 ) ) ( not ( = ?auto_482021 ?auto_482026 ) ) ( not ( = ?auto_482021 ?auto_482027 ) ) ( not ( = ?auto_482021 ?auto_482028 ) ) ( not ( = ?auto_482021 ?auto_482029 ) ) ( not ( = ?auto_482021 ?auto_482030 ) ) ( not ( = ?auto_482021 ?auto_482031 ) ) ( not ( = ?auto_482021 ?auto_482032 ) ) ( not ( = ?auto_482021 ?auto_482033 ) ) ( not ( = ?auto_482021 ?auto_482034 ) ) ( not ( = ?auto_482022 ?auto_482023 ) ) ( not ( = ?auto_482022 ?auto_482024 ) ) ( not ( = ?auto_482022 ?auto_482025 ) ) ( not ( = ?auto_482022 ?auto_482026 ) ) ( not ( = ?auto_482022 ?auto_482027 ) ) ( not ( = ?auto_482022 ?auto_482028 ) ) ( not ( = ?auto_482022 ?auto_482029 ) ) ( not ( = ?auto_482022 ?auto_482030 ) ) ( not ( = ?auto_482022 ?auto_482031 ) ) ( not ( = ?auto_482022 ?auto_482032 ) ) ( not ( = ?auto_482022 ?auto_482033 ) ) ( not ( = ?auto_482022 ?auto_482034 ) ) ( not ( = ?auto_482023 ?auto_482024 ) ) ( not ( = ?auto_482023 ?auto_482025 ) ) ( not ( = ?auto_482023 ?auto_482026 ) ) ( not ( = ?auto_482023 ?auto_482027 ) ) ( not ( = ?auto_482023 ?auto_482028 ) ) ( not ( = ?auto_482023 ?auto_482029 ) ) ( not ( = ?auto_482023 ?auto_482030 ) ) ( not ( = ?auto_482023 ?auto_482031 ) ) ( not ( = ?auto_482023 ?auto_482032 ) ) ( not ( = ?auto_482023 ?auto_482033 ) ) ( not ( = ?auto_482023 ?auto_482034 ) ) ( not ( = ?auto_482024 ?auto_482025 ) ) ( not ( = ?auto_482024 ?auto_482026 ) ) ( not ( = ?auto_482024 ?auto_482027 ) ) ( not ( = ?auto_482024 ?auto_482028 ) ) ( not ( = ?auto_482024 ?auto_482029 ) ) ( not ( = ?auto_482024 ?auto_482030 ) ) ( not ( = ?auto_482024 ?auto_482031 ) ) ( not ( = ?auto_482024 ?auto_482032 ) ) ( not ( = ?auto_482024 ?auto_482033 ) ) ( not ( = ?auto_482024 ?auto_482034 ) ) ( not ( = ?auto_482025 ?auto_482026 ) ) ( not ( = ?auto_482025 ?auto_482027 ) ) ( not ( = ?auto_482025 ?auto_482028 ) ) ( not ( = ?auto_482025 ?auto_482029 ) ) ( not ( = ?auto_482025 ?auto_482030 ) ) ( not ( = ?auto_482025 ?auto_482031 ) ) ( not ( = ?auto_482025 ?auto_482032 ) ) ( not ( = ?auto_482025 ?auto_482033 ) ) ( not ( = ?auto_482025 ?auto_482034 ) ) ( not ( = ?auto_482026 ?auto_482027 ) ) ( not ( = ?auto_482026 ?auto_482028 ) ) ( not ( = ?auto_482026 ?auto_482029 ) ) ( not ( = ?auto_482026 ?auto_482030 ) ) ( not ( = ?auto_482026 ?auto_482031 ) ) ( not ( = ?auto_482026 ?auto_482032 ) ) ( not ( = ?auto_482026 ?auto_482033 ) ) ( not ( = ?auto_482026 ?auto_482034 ) ) ( not ( = ?auto_482027 ?auto_482028 ) ) ( not ( = ?auto_482027 ?auto_482029 ) ) ( not ( = ?auto_482027 ?auto_482030 ) ) ( not ( = ?auto_482027 ?auto_482031 ) ) ( not ( = ?auto_482027 ?auto_482032 ) ) ( not ( = ?auto_482027 ?auto_482033 ) ) ( not ( = ?auto_482027 ?auto_482034 ) ) ( not ( = ?auto_482028 ?auto_482029 ) ) ( not ( = ?auto_482028 ?auto_482030 ) ) ( not ( = ?auto_482028 ?auto_482031 ) ) ( not ( = ?auto_482028 ?auto_482032 ) ) ( not ( = ?auto_482028 ?auto_482033 ) ) ( not ( = ?auto_482028 ?auto_482034 ) ) ( not ( = ?auto_482029 ?auto_482030 ) ) ( not ( = ?auto_482029 ?auto_482031 ) ) ( not ( = ?auto_482029 ?auto_482032 ) ) ( not ( = ?auto_482029 ?auto_482033 ) ) ( not ( = ?auto_482029 ?auto_482034 ) ) ( not ( = ?auto_482030 ?auto_482031 ) ) ( not ( = ?auto_482030 ?auto_482032 ) ) ( not ( = ?auto_482030 ?auto_482033 ) ) ( not ( = ?auto_482030 ?auto_482034 ) ) ( not ( = ?auto_482031 ?auto_482032 ) ) ( not ( = ?auto_482031 ?auto_482033 ) ) ( not ( = ?auto_482031 ?auto_482034 ) ) ( not ( = ?auto_482032 ?auto_482033 ) ) ( not ( = ?auto_482032 ?auto_482034 ) ) ( not ( = ?auto_482033 ?auto_482034 ) ) ( ON ?auto_482032 ?auto_482033 ) ( ON ?auto_482031 ?auto_482032 ) ( ON ?auto_482030 ?auto_482031 ) ( CLEAR ?auto_482028 ) ( ON ?auto_482029 ?auto_482030 ) ( CLEAR ?auto_482029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_482019 ?auto_482020 ?auto_482021 ?auto_482022 ?auto_482023 ?auto_482024 ?auto_482025 ?auto_482026 ?auto_482027 ?auto_482028 ?auto_482029 )
      ( MAKE-15PILE ?auto_482019 ?auto_482020 ?auto_482021 ?auto_482022 ?auto_482023 ?auto_482024 ?auto_482025 ?auto_482026 ?auto_482027 ?auto_482028 ?auto_482029 ?auto_482030 ?auto_482031 ?auto_482032 ?auto_482033 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_482081 - BLOCK
      ?auto_482082 - BLOCK
      ?auto_482083 - BLOCK
      ?auto_482084 - BLOCK
      ?auto_482085 - BLOCK
      ?auto_482086 - BLOCK
      ?auto_482087 - BLOCK
      ?auto_482088 - BLOCK
      ?auto_482089 - BLOCK
      ?auto_482090 - BLOCK
      ?auto_482091 - BLOCK
      ?auto_482092 - BLOCK
      ?auto_482093 - BLOCK
      ?auto_482094 - BLOCK
      ?auto_482095 - BLOCK
    )
    :vars
    (
      ?auto_482096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_482095 ?auto_482096 ) ( ON-TABLE ?auto_482081 ) ( ON ?auto_482082 ?auto_482081 ) ( ON ?auto_482083 ?auto_482082 ) ( ON ?auto_482084 ?auto_482083 ) ( ON ?auto_482085 ?auto_482084 ) ( ON ?auto_482086 ?auto_482085 ) ( ON ?auto_482087 ?auto_482086 ) ( ON ?auto_482088 ?auto_482087 ) ( ON ?auto_482089 ?auto_482088 ) ( not ( = ?auto_482081 ?auto_482082 ) ) ( not ( = ?auto_482081 ?auto_482083 ) ) ( not ( = ?auto_482081 ?auto_482084 ) ) ( not ( = ?auto_482081 ?auto_482085 ) ) ( not ( = ?auto_482081 ?auto_482086 ) ) ( not ( = ?auto_482081 ?auto_482087 ) ) ( not ( = ?auto_482081 ?auto_482088 ) ) ( not ( = ?auto_482081 ?auto_482089 ) ) ( not ( = ?auto_482081 ?auto_482090 ) ) ( not ( = ?auto_482081 ?auto_482091 ) ) ( not ( = ?auto_482081 ?auto_482092 ) ) ( not ( = ?auto_482081 ?auto_482093 ) ) ( not ( = ?auto_482081 ?auto_482094 ) ) ( not ( = ?auto_482081 ?auto_482095 ) ) ( not ( = ?auto_482081 ?auto_482096 ) ) ( not ( = ?auto_482082 ?auto_482083 ) ) ( not ( = ?auto_482082 ?auto_482084 ) ) ( not ( = ?auto_482082 ?auto_482085 ) ) ( not ( = ?auto_482082 ?auto_482086 ) ) ( not ( = ?auto_482082 ?auto_482087 ) ) ( not ( = ?auto_482082 ?auto_482088 ) ) ( not ( = ?auto_482082 ?auto_482089 ) ) ( not ( = ?auto_482082 ?auto_482090 ) ) ( not ( = ?auto_482082 ?auto_482091 ) ) ( not ( = ?auto_482082 ?auto_482092 ) ) ( not ( = ?auto_482082 ?auto_482093 ) ) ( not ( = ?auto_482082 ?auto_482094 ) ) ( not ( = ?auto_482082 ?auto_482095 ) ) ( not ( = ?auto_482082 ?auto_482096 ) ) ( not ( = ?auto_482083 ?auto_482084 ) ) ( not ( = ?auto_482083 ?auto_482085 ) ) ( not ( = ?auto_482083 ?auto_482086 ) ) ( not ( = ?auto_482083 ?auto_482087 ) ) ( not ( = ?auto_482083 ?auto_482088 ) ) ( not ( = ?auto_482083 ?auto_482089 ) ) ( not ( = ?auto_482083 ?auto_482090 ) ) ( not ( = ?auto_482083 ?auto_482091 ) ) ( not ( = ?auto_482083 ?auto_482092 ) ) ( not ( = ?auto_482083 ?auto_482093 ) ) ( not ( = ?auto_482083 ?auto_482094 ) ) ( not ( = ?auto_482083 ?auto_482095 ) ) ( not ( = ?auto_482083 ?auto_482096 ) ) ( not ( = ?auto_482084 ?auto_482085 ) ) ( not ( = ?auto_482084 ?auto_482086 ) ) ( not ( = ?auto_482084 ?auto_482087 ) ) ( not ( = ?auto_482084 ?auto_482088 ) ) ( not ( = ?auto_482084 ?auto_482089 ) ) ( not ( = ?auto_482084 ?auto_482090 ) ) ( not ( = ?auto_482084 ?auto_482091 ) ) ( not ( = ?auto_482084 ?auto_482092 ) ) ( not ( = ?auto_482084 ?auto_482093 ) ) ( not ( = ?auto_482084 ?auto_482094 ) ) ( not ( = ?auto_482084 ?auto_482095 ) ) ( not ( = ?auto_482084 ?auto_482096 ) ) ( not ( = ?auto_482085 ?auto_482086 ) ) ( not ( = ?auto_482085 ?auto_482087 ) ) ( not ( = ?auto_482085 ?auto_482088 ) ) ( not ( = ?auto_482085 ?auto_482089 ) ) ( not ( = ?auto_482085 ?auto_482090 ) ) ( not ( = ?auto_482085 ?auto_482091 ) ) ( not ( = ?auto_482085 ?auto_482092 ) ) ( not ( = ?auto_482085 ?auto_482093 ) ) ( not ( = ?auto_482085 ?auto_482094 ) ) ( not ( = ?auto_482085 ?auto_482095 ) ) ( not ( = ?auto_482085 ?auto_482096 ) ) ( not ( = ?auto_482086 ?auto_482087 ) ) ( not ( = ?auto_482086 ?auto_482088 ) ) ( not ( = ?auto_482086 ?auto_482089 ) ) ( not ( = ?auto_482086 ?auto_482090 ) ) ( not ( = ?auto_482086 ?auto_482091 ) ) ( not ( = ?auto_482086 ?auto_482092 ) ) ( not ( = ?auto_482086 ?auto_482093 ) ) ( not ( = ?auto_482086 ?auto_482094 ) ) ( not ( = ?auto_482086 ?auto_482095 ) ) ( not ( = ?auto_482086 ?auto_482096 ) ) ( not ( = ?auto_482087 ?auto_482088 ) ) ( not ( = ?auto_482087 ?auto_482089 ) ) ( not ( = ?auto_482087 ?auto_482090 ) ) ( not ( = ?auto_482087 ?auto_482091 ) ) ( not ( = ?auto_482087 ?auto_482092 ) ) ( not ( = ?auto_482087 ?auto_482093 ) ) ( not ( = ?auto_482087 ?auto_482094 ) ) ( not ( = ?auto_482087 ?auto_482095 ) ) ( not ( = ?auto_482087 ?auto_482096 ) ) ( not ( = ?auto_482088 ?auto_482089 ) ) ( not ( = ?auto_482088 ?auto_482090 ) ) ( not ( = ?auto_482088 ?auto_482091 ) ) ( not ( = ?auto_482088 ?auto_482092 ) ) ( not ( = ?auto_482088 ?auto_482093 ) ) ( not ( = ?auto_482088 ?auto_482094 ) ) ( not ( = ?auto_482088 ?auto_482095 ) ) ( not ( = ?auto_482088 ?auto_482096 ) ) ( not ( = ?auto_482089 ?auto_482090 ) ) ( not ( = ?auto_482089 ?auto_482091 ) ) ( not ( = ?auto_482089 ?auto_482092 ) ) ( not ( = ?auto_482089 ?auto_482093 ) ) ( not ( = ?auto_482089 ?auto_482094 ) ) ( not ( = ?auto_482089 ?auto_482095 ) ) ( not ( = ?auto_482089 ?auto_482096 ) ) ( not ( = ?auto_482090 ?auto_482091 ) ) ( not ( = ?auto_482090 ?auto_482092 ) ) ( not ( = ?auto_482090 ?auto_482093 ) ) ( not ( = ?auto_482090 ?auto_482094 ) ) ( not ( = ?auto_482090 ?auto_482095 ) ) ( not ( = ?auto_482090 ?auto_482096 ) ) ( not ( = ?auto_482091 ?auto_482092 ) ) ( not ( = ?auto_482091 ?auto_482093 ) ) ( not ( = ?auto_482091 ?auto_482094 ) ) ( not ( = ?auto_482091 ?auto_482095 ) ) ( not ( = ?auto_482091 ?auto_482096 ) ) ( not ( = ?auto_482092 ?auto_482093 ) ) ( not ( = ?auto_482092 ?auto_482094 ) ) ( not ( = ?auto_482092 ?auto_482095 ) ) ( not ( = ?auto_482092 ?auto_482096 ) ) ( not ( = ?auto_482093 ?auto_482094 ) ) ( not ( = ?auto_482093 ?auto_482095 ) ) ( not ( = ?auto_482093 ?auto_482096 ) ) ( not ( = ?auto_482094 ?auto_482095 ) ) ( not ( = ?auto_482094 ?auto_482096 ) ) ( not ( = ?auto_482095 ?auto_482096 ) ) ( ON ?auto_482094 ?auto_482095 ) ( ON ?auto_482093 ?auto_482094 ) ( ON ?auto_482092 ?auto_482093 ) ( ON ?auto_482091 ?auto_482092 ) ( CLEAR ?auto_482089 ) ( ON ?auto_482090 ?auto_482091 ) ( CLEAR ?auto_482090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_482081 ?auto_482082 ?auto_482083 ?auto_482084 ?auto_482085 ?auto_482086 ?auto_482087 ?auto_482088 ?auto_482089 ?auto_482090 )
      ( MAKE-15PILE ?auto_482081 ?auto_482082 ?auto_482083 ?auto_482084 ?auto_482085 ?auto_482086 ?auto_482087 ?auto_482088 ?auto_482089 ?auto_482090 ?auto_482091 ?auto_482092 ?auto_482093 ?auto_482094 ?auto_482095 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_482143 - BLOCK
      ?auto_482144 - BLOCK
      ?auto_482145 - BLOCK
      ?auto_482146 - BLOCK
      ?auto_482147 - BLOCK
      ?auto_482148 - BLOCK
      ?auto_482149 - BLOCK
      ?auto_482150 - BLOCK
      ?auto_482151 - BLOCK
      ?auto_482152 - BLOCK
      ?auto_482153 - BLOCK
      ?auto_482154 - BLOCK
      ?auto_482155 - BLOCK
      ?auto_482156 - BLOCK
      ?auto_482157 - BLOCK
    )
    :vars
    (
      ?auto_482158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_482157 ?auto_482158 ) ( ON-TABLE ?auto_482143 ) ( ON ?auto_482144 ?auto_482143 ) ( ON ?auto_482145 ?auto_482144 ) ( ON ?auto_482146 ?auto_482145 ) ( ON ?auto_482147 ?auto_482146 ) ( ON ?auto_482148 ?auto_482147 ) ( ON ?auto_482149 ?auto_482148 ) ( ON ?auto_482150 ?auto_482149 ) ( not ( = ?auto_482143 ?auto_482144 ) ) ( not ( = ?auto_482143 ?auto_482145 ) ) ( not ( = ?auto_482143 ?auto_482146 ) ) ( not ( = ?auto_482143 ?auto_482147 ) ) ( not ( = ?auto_482143 ?auto_482148 ) ) ( not ( = ?auto_482143 ?auto_482149 ) ) ( not ( = ?auto_482143 ?auto_482150 ) ) ( not ( = ?auto_482143 ?auto_482151 ) ) ( not ( = ?auto_482143 ?auto_482152 ) ) ( not ( = ?auto_482143 ?auto_482153 ) ) ( not ( = ?auto_482143 ?auto_482154 ) ) ( not ( = ?auto_482143 ?auto_482155 ) ) ( not ( = ?auto_482143 ?auto_482156 ) ) ( not ( = ?auto_482143 ?auto_482157 ) ) ( not ( = ?auto_482143 ?auto_482158 ) ) ( not ( = ?auto_482144 ?auto_482145 ) ) ( not ( = ?auto_482144 ?auto_482146 ) ) ( not ( = ?auto_482144 ?auto_482147 ) ) ( not ( = ?auto_482144 ?auto_482148 ) ) ( not ( = ?auto_482144 ?auto_482149 ) ) ( not ( = ?auto_482144 ?auto_482150 ) ) ( not ( = ?auto_482144 ?auto_482151 ) ) ( not ( = ?auto_482144 ?auto_482152 ) ) ( not ( = ?auto_482144 ?auto_482153 ) ) ( not ( = ?auto_482144 ?auto_482154 ) ) ( not ( = ?auto_482144 ?auto_482155 ) ) ( not ( = ?auto_482144 ?auto_482156 ) ) ( not ( = ?auto_482144 ?auto_482157 ) ) ( not ( = ?auto_482144 ?auto_482158 ) ) ( not ( = ?auto_482145 ?auto_482146 ) ) ( not ( = ?auto_482145 ?auto_482147 ) ) ( not ( = ?auto_482145 ?auto_482148 ) ) ( not ( = ?auto_482145 ?auto_482149 ) ) ( not ( = ?auto_482145 ?auto_482150 ) ) ( not ( = ?auto_482145 ?auto_482151 ) ) ( not ( = ?auto_482145 ?auto_482152 ) ) ( not ( = ?auto_482145 ?auto_482153 ) ) ( not ( = ?auto_482145 ?auto_482154 ) ) ( not ( = ?auto_482145 ?auto_482155 ) ) ( not ( = ?auto_482145 ?auto_482156 ) ) ( not ( = ?auto_482145 ?auto_482157 ) ) ( not ( = ?auto_482145 ?auto_482158 ) ) ( not ( = ?auto_482146 ?auto_482147 ) ) ( not ( = ?auto_482146 ?auto_482148 ) ) ( not ( = ?auto_482146 ?auto_482149 ) ) ( not ( = ?auto_482146 ?auto_482150 ) ) ( not ( = ?auto_482146 ?auto_482151 ) ) ( not ( = ?auto_482146 ?auto_482152 ) ) ( not ( = ?auto_482146 ?auto_482153 ) ) ( not ( = ?auto_482146 ?auto_482154 ) ) ( not ( = ?auto_482146 ?auto_482155 ) ) ( not ( = ?auto_482146 ?auto_482156 ) ) ( not ( = ?auto_482146 ?auto_482157 ) ) ( not ( = ?auto_482146 ?auto_482158 ) ) ( not ( = ?auto_482147 ?auto_482148 ) ) ( not ( = ?auto_482147 ?auto_482149 ) ) ( not ( = ?auto_482147 ?auto_482150 ) ) ( not ( = ?auto_482147 ?auto_482151 ) ) ( not ( = ?auto_482147 ?auto_482152 ) ) ( not ( = ?auto_482147 ?auto_482153 ) ) ( not ( = ?auto_482147 ?auto_482154 ) ) ( not ( = ?auto_482147 ?auto_482155 ) ) ( not ( = ?auto_482147 ?auto_482156 ) ) ( not ( = ?auto_482147 ?auto_482157 ) ) ( not ( = ?auto_482147 ?auto_482158 ) ) ( not ( = ?auto_482148 ?auto_482149 ) ) ( not ( = ?auto_482148 ?auto_482150 ) ) ( not ( = ?auto_482148 ?auto_482151 ) ) ( not ( = ?auto_482148 ?auto_482152 ) ) ( not ( = ?auto_482148 ?auto_482153 ) ) ( not ( = ?auto_482148 ?auto_482154 ) ) ( not ( = ?auto_482148 ?auto_482155 ) ) ( not ( = ?auto_482148 ?auto_482156 ) ) ( not ( = ?auto_482148 ?auto_482157 ) ) ( not ( = ?auto_482148 ?auto_482158 ) ) ( not ( = ?auto_482149 ?auto_482150 ) ) ( not ( = ?auto_482149 ?auto_482151 ) ) ( not ( = ?auto_482149 ?auto_482152 ) ) ( not ( = ?auto_482149 ?auto_482153 ) ) ( not ( = ?auto_482149 ?auto_482154 ) ) ( not ( = ?auto_482149 ?auto_482155 ) ) ( not ( = ?auto_482149 ?auto_482156 ) ) ( not ( = ?auto_482149 ?auto_482157 ) ) ( not ( = ?auto_482149 ?auto_482158 ) ) ( not ( = ?auto_482150 ?auto_482151 ) ) ( not ( = ?auto_482150 ?auto_482152 ) ) ( not ( = ?auto_482150 ?auto_482153 ) ) ( not ( = ?auto_482150 ?auto_482154 ) ) ( not ( = ?auto_482150 ?auto_482155 ) ) ( not ( = ?auto_482150 ?auto_482156 ) ) ( not ( = ?auto_482150 ?auto_482157 ) ) ( not ( = ?auto_482150 ?auto_482158 ) ) ( not ( = ?auto_482151 ?auto_482152 ) ) ( not ( = ?auto_482151 ?auto_482153 ) ) ( not ( = ?auto_482151 ?auto_482154 ) ) ( not ( = ?auto_482151 ?auto_482155 ) ) ( not ( = ?auto_482151 ?auto_482156 ) ) ( not ( = ?auto_482151 ?auto_482157 ) ) ( not ( = ?auto_482151 ?auto_482158 ) ) ( not ( = ?auto_482152 ?auto_482153 ) ) ( not ( = ?auto_482152 ?auto_482154 ) ) ( not ( = ?auto_482152 ?auto_482155 ) ) ( not ( = ?auto_482152 ?auto_482156 ) ) ( not ( = ?auto_482152 ?auto_482157 ) ) ( not ( = ?auto_482152 ?auto_482158 ) ) ( not ( = ?auto_482153 ?auto_482154 ) ) ( not ( = ?auto_482153 ?auto_482155 ) ) ( not ( = ?auto_482153 ?auto_482156 ) ) ( not ( = ?auto_482153 ?auto_482157 ) ) ( not ( = ?auto_482153 ?auto_482158 ) ) ( not ( = ?auto_482154 ?auto_482155 ) ) ( not ( = ?auto_482154 ?auto_482156 ) ) ( not ( = ?auto_482154 ?auto_482157 ) ) ( not ( = ?auto_482154 ?auto_482158 ) ) ( not ( = ?auto_482155 ?auto_482156 ) ) ( not ( = ?auto_482155 ?auto_482157 ) ) ( not ( = ?auto_482155 ?auto_482158 ) ) ( not ( = ?auto_482156 ?auto_482157 ) ) ( not ( = ?auto_482156 ?auto_482158 ) ) ( not ( = ?auto_482157 ?auto_482158 ) ) ( ON ?auto_482156 ?auto_482157 ) ( ON ?auto_482155 ?auto_482156 ) ( ON ?auto_482154 ?auto_482155 ) ( ON ?auto_482153 ?auto_482154 ) ( ON ?auto_482152 ?auto_482153 ) ( CLEAR ?auto_482150 ) ( ON ?auto_482151 ?auto_482152 ) ( CLEAR ?auto_482151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_482143 ?auto_482144 ?auto_482145 ?auto_482146 ?auto_482147 ?auto_482148 ?auto_482149 ?auto_482150 ?auto_482151 )
      ( MAKE-15PILE ?auto_482143 ?auto_482144 ?auto_482145 ?auto_482146 ?auto_482147 ?auto_482148 ?auto_482149 ?auto_482150 ?auto_482151 ?auto_482152 ?auto_482153 ?auto_482154 ?auto_482155 ?auto_482156 ?auto_482157 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_482205 - BLOCK
      ?auto_482206 - BLOCK
      ?auto_482207 - BLOCK
      ?auto_482208 - BLOCK
      ?auto_482209 - BLOCK
      ?auto_482210 - BLOCK
      ?auto_482211 - BLOCK
      ?auto_482212 - BLOCK
      ?auto_482213 - BLOCK
      ?auto_482214 - BLOCK
      ?auto_482215 - BLOCK
      ?auto_482216 - BLOCK
      ?auto_482217 - BLOCK
      ?auto_482218 - BLOCK
      ?auto_482219 - BLOCK
    )
    :vars
    (
      ?auto_482220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_482219 ?auto_482220 ) ( ON-TABLE ?auto_482205 ) ( ON ?auto_482206 ?auto_482205 ) ( ON ?auto_482207 ?auto_482206 ) ( ON ?auto_482208 ?auto_482207 ) ( ON ?auto_482209 ?auto_482208 ) ( ON ?auto_482210 ?auto_482209 ) ( ON ?auto_482211 ?auto_482210 ) ( not ( = ?auto_482205 ?auto_482206 ) ) ( not ( = ?auto_482205 ?auto_482207 ) ) ( not ( = ?auto_482205 ?auto_482208 ) ) ( not ( = ?auto_482205 ?auto_482209 ) ) ( not ( = ?auto_482205 ?auto_482210 ) ) ( not ( = ?auto_482205 ?auto_482211 ) ) ( not ( = ?auto_482205 ?auto_482212 ) ) ( not ( = ?auto_482205 ?auto_482213 ) ) ( not ( = ?auto_482205 ?auto_482214 ) ) ( not ( = ?auto_482205 ?auto_482215 ) ) ( not ( = ?auto_482205 ?auto_482216 ) ) ( not ( = ?auto_482205 ?auto_482217 ) ) ( not ( = ?auto_482205 ?auto_482218 ) ) ( not ( = ?auto_482205 ?auto_482219 ) ) ( not ( = ?auto_482205 ?auto_482220 ) ) ( not ( = ?auto_482206 ?auto_482207 ) ) ( not ( = ?auto_482206 ?auto_482208 ) ) ( not ( = ?auto_482206 ?auto_482209 ) ) ( not ( = ?auto_482206 ?auto_482210 ) ) ( not ( = ?auto_482206 ?auto_482211 ) ) ( not ( = ?auto_482206 ?auto_482212 ) ) ( not ( = ?auto_482206 ?auto_482213 ) ) ( not ( = ?auto_482206 ?auto_482214 ) ) ( not ( = ?auto_482206 ?auto_482215 ) ) ( not ( = ?auto_482206 ?auto_482216 ) ) ( not ( = ?auto_482206 ?auto_482217 ) ) ( not ( = ?auto_482206 ?auto_482218 ) ) ( not ( = ?auto_482206 ?auto_482219 ) ) ( not ( = ?auto_482206 ?auto_482220 ) ) ( not ( = ?auto_482207 ?auto_482208 ) ) ( not ( = ?auto_482207 ?auto_482209 ) ) ( not ( = ?auto_482207 ?auto_482210 ) ) ( not ( = ?auto_482207 ?auto_482211 ) ) ( not ( = ?auto_482207 ?auto_482212 ) ) ( not ( = ?auto_482207 ?auto_482213 ) ) ( not ( = ?auto_482207 ?auto_482214 ) ) ( not ( = ?auto_482207 ?auto_482215 ) ) ( not ( = ?auto_482207 ?auto_482216 ) ) ( not ( = ?auto_482207 ?auto_482217 ) ) ( not ( = ?auto_482207 ?auto_482218 ) ) ( not ( = ?auto_482207 ?auto_482219 ) ) ( not ( = ?auto_482207 ?auto_482220 ) ) ( not ( = ?auto_482208 ?auto_482209 ) ) ( not ( = ?auto_482208 ?auto_482210 ) ) ( not ( = ?auto_482208 ?auto_482211 ) ) ( not ( = ?auto_482208 ?auto_482212 ) ) ( not ( = ?auto_482208 ?auto_482213 ) ) ( not ( = ?auto_482208 ?auto_482214 ) ) ( not ( = ?auto_482208 ?auto_482215 ) ) ( not ( = ?auto_482208 ?auto_482216 ) ) ( not ( = ?auto_482208 ?auto_482217 ) ) ( not ( = ?auto_482208 ?auto_482218 ) ) ( not ( = ?auto_482208 ?auto_482219 ) ) ( not ( = ?auto_482208 ?auto_482220 ) ) ( not ( = ?auto_482209 ?auto_482210 ) ) ( not ( = ?auto_482209 ?auto_482211 ) ) ( not ( = ?auto_482209 ?auto_482212 ) ) ( not ( = ?auto_482209 ?auto_482213 ) ) ( not ( = ?auto_482209 ?auto_482214 ) ) ( not ( = ?auto_482209 ?auto_482215 ) ) ( not ( = ?auto_482209 ?auto_482216 ) ) ( not ( = ?auto_482209 ?auto_482217 ) ) ( not ( = ?auto_482209 ?auto_482218 ) ) ( not ( = ?auto_482209 ?auto_482219 ) ) ( not ( = ?auto_482209 ?auto_482220 ) ) ( not ( = ?auto_482210 ?auto_482211 ) ) ( not ( = ?auto_482210 ?auto_482212 ) ) ( not ( = ?auto_482210 ?auto_482213 ) ) ( not ( = ?auto_482210 ?auto_482214 ) ) ( not ( = ?auto_482210 ?auto_482215 ) ) ( not ( = ?auto_482210 ?auto_482216 ) ) ( not ( = ?auto_482210 ?auto_482217 ) ) ( not ( = ?auto_482210 ?auto_482218 ) ) ( not ( = ?auto_482210 ?auto_482219 ) ) ( not ( = ?auto_482210 ?auto_482220 ) ) ( not ( = ?auto_482211 ?auto_482212 ) ) ( not ( = ?auto_482211 ?auto_482213 ) ) ( not ( = ?auto_482211 ?auto_482214 ) ) ( not ( = ?auto_482211 ?auto_482215 ) ) ( not ( = ?auto_482211 ?auto_482216 ) ) ( not ( = ?auto_482211 ?auto_482217 ) ) ( not ( = ?auto_482211 ?auto_482218 ) ) ( not ( = ?auto_482211 ?auto_482219 ) ) ( not ( = ?auto_482211 ?auto_482220 ) ) ( not ( = ?auto_482212 ?auto_482213 ) ) ( not ( = ?auto_482212 ?auto_482214 ) ) ( not ( = ?auto_482212 ?auto_482215 ) ) ( not ( = ?auto_482212 ?auto_482216 ) ) ( not ( = ?auto_482212 ?auto_482217 ) ) ( not ( = ?auto_482212 ?auto_482218 ) ) ( not ( = ?auto_482212 ?auto_482219 ) ) ( not ( = ?auto_482212 ?auto_482220 ) ) ( not ( = ?auto_482213 ?auto_482214 ) ) ( not ( = ?auto_482213 ?auto_482215 ) ) ( not ( = ?auto_482213 ?auto_482216 ) ) ( not ( = ?auto_482213 ?auto_482217 ) ) ( not ( = ?auto_482213 ?auto_482218 ) ) ( not ( = ?auto_482213 ?auto_482219 ) ) ( not ( = ?auto_482213 ?auto_482220 ) ) ( not ( = ?auto_482214 ?auto_482215 ) ) ( not ( = ?auto_482214 ?auto_482216 ) ) ( not ( = ?auto_482214 ?auto_482217 ) ) ( not ( = ?auto_482214 ?auto_482218 ) ) ( not ( = ?auto_482214 ?auto_482219 ) ) ( not ( = ?auto_482214 ?auto_482220 ) ) ( not ( = ?auto_482215 ?auto_482216 ) ) ( not ( = ?auto_482215 ?auto_482217 ) ) ( not ( = ?auto_482215 ?auto_482218 ) ) ( not ( = ?auto_482215 ?auto_482219 ) ) ( not ( = ?auto_482215 ?auto_482220 ) ) ( not ( = ?auto_482216 ?auto_482217 ) ) ( not ( = ?auto_482216 ?auto_482218 ) ) ( not ( = ?auto_482216 ?auto_482219 ) ) ( not ( = ?auto_482216 ?auto_482220 ) ) ( not ( = ?auto_482217 ?auto_482218 ) ) ( not ( = ?auto_482217 ?auto_482219 ) ) ( not ( = ?auto_482217 ?auto_482220 ) ) ( not ( = ?auto_482218 ?auto_482219 ) ) ( not ( = ?auto_482218 ?auto_482220 ) ) ( not ( = ?auto_482219 ?auto_482220 ) ) ( ON ?auto_482218 ?auto_482219 ) ( ON ?auto_482217 ?auto_482218 ) ( ON ?auto_482216 ?auto_482217 ) ( ON ?auto_482215 ?auto_482216 ) ( ON ?auto_482214 ?auto_482215 ) ( ON ?auto_482213 ?auto_482214 ) ( CLEAR ?auto_482211 ) ( ON ?auto_482212 ?auto_482213 ) ( CLEAR ?auto_482212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_482205 ?auto_482206 ?auto_482207 ?auto_482208 ?auto_482209 ?auto_482210 ?auto_482211 ?auto_482212 )
      ( MAKE-15PILE ?auto_482205 ?auto_482206 ?auto_482207 ?auto_482208 ?auto_482209 ?auto_482210 ?auto_482211 ?auto_482212 ?auto_482213 ?auto_482214 ?auto_482215 ?auto_482216 ?auto_482217 ?auto_482218 ?auto_482219 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_482267 - BLOCK
      ?auto_482268 - BLOCK
      ?auto_482269 - BLOCK
      ?auto_482270 - BLOCK
      ?auto_482271 - BLOCK
      ?auto_482272 - BLOCK
      ?auto_482273 - BLOCK
      ?auto_482274 - BLOCK
      ?auto_482275 - BLOCK
      ?auto_482276 - BLOCK
      ?auto_482277 - BLOCK
      ?auto_482278 - BLOCK
      ?auto_482279 - BLOCK
      ?auto_482280 - BLOCK
      ?auto_482281 - BLOCK
    )
    :vars
    (
      ?auto_482282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_482281 ?auto_482282 ) ( ON-TABLE ?auto_482267 ) ( ON ?auto_482268 ?auto_482267 ) ( ON ?auto_482269 ?auto_482268 ) ( ON ?auto_482270 ?auto_482269 ) ( ON ?auto_482271 ?auto_482270 ) ( ON ?auto_482272 ?auto_482271 ) ( not ( = ?auto_482267 ?auto_482268 ) ) ( not ( = ?auto_482267 ?auto_482269 ) ) ( not ( = ?auto_482267 ?auto_482270 ) ) ( not ( = ?auto_482267 ?auto_482271 ) ) ( not ( = ?auto_482267 ?auto_482272 ) ) ( not ( = ?auto_482267 ?auto_482273 ) ) ( not ( = ?auto_482267 ?auto_482274 ) ) ( not ( = ?auto_482267 ?auto_482275 ) ) ( not ( = ?auto_482267 ?auto_482276 ) ) ( not ( = ?auto_482267 ?auto_482277 ) ) ( not ( = ?auto_482267 ?auto_482278 ) ) ( not ( = ?auto_482267 ?auto_482279 ) ) ( not ( = ?auto_482267 ?auto_482280 ) ) ( not ( = ?auto_482267 ?auto_482281 ) ) ( not ( = ?auto_482267 ?auto_482282 ) ) ( not ( = ?auto_482268 ?auto_482269 ) ) ( not ( = ?auto_482268 ?auto_482270 ) ) ( not ( = ?auto_482268 ?auto_482271 ) ) ( not ( = ?auto_482268 ?auto_482272 ) ) ( not ( = ?auto_482268 ?auto_482273 ) ) ( not ( = ?auto_482268 ?auto_482274 ) ) ( not ( = ?auto_482268 ?auto_482275 ) ) ( not ( = ?auto_482268 ?auto_482276 ) ) ( not ( = ?auto_482268 ?auto_482277 ) ) ( not ( = ?auto_482268 ?auto_482278 ) ) ( not ( = ?auto_482268 ?auto_482279 ) ) ( not ( = ?auto_482268 ?auto_482280 ) ) ( not ( = ?auto_482268 ?auto_482281 ) ) ( not ( = ?auto_482268 ?auto_482282 ) ) ( not ( = ?auto_482269 ?auto_482270 ) ) ( not ( = ?auto_482269 ?auto_482271 ) ) ( not ( = ?auto_482269 ?auto_482272 ) ) ( not ( = ?auto_482269 ?auto_482273 ) ) ( not ( = ?auto_482269 ?auto_482274 ) ) ( not ( = ?auto_482269 ?auto_482275 ) ) ( not ( = ?auto_482269 ?auto_482276 ) ) ( not ( = ?auto_482269 ?auto_482277 ) ) ( not ( = ?auto_482269 ?auto_482278 ) ) ( not ( = ?auto_482269 ?auto_482279 ) ) ( not ( = ?auto_482269 ?auto_482280 ) ) ( not ( = ?auto_482269 ?auto_482281 ) ) ( not ( = ?auto_482269 ?auto_482282 ) ) ( not ( = ?auto_482270 ?auto_482271 ) ) ( not ( = ?auto_482270 ?auto_482272 ) ) ( not ( = ?auto_482270 ?auto_482273 ) ) ( not ( = ?auto_482270 ?auto_482274 ) ) ( not ( = ?auto_482270 ?auto_482275 ) ) ( not ( = ?auto_482270 ?auto_482276 ) ) ( not ( = ?auto_482270 ?auto_482277 ) ) ( not ( = ?auto_482270 ?auto_482278 ) ) ( not ( = ?auto_482270 ?auto_482279 ) ) ( not ( = ?auto_482270 ?auto_482280 ) ) ( not ( = ?auto_482270 ?auto_482281 ) ) ( not ( = ?auto_482270 ?auto_482282 ) ) ( not ( = ?auto_482271 ?auto_482272 ) ) ( not ( = ?auto_482271 ?auto_482273 ) ) ( not ( = ?auto_482271 ?auto_482274 ) ) ( not ( = ?auto_482271 ?auto_482275 ) ) ( not ( = ?auto_482271 ?auto_482276 ) ) ( not ( = ?auto_482271 ?auto_482277 ) ) ( not ( = ?auto_482271 ?auto_482278 ) ) ( not ( = ?auto_482271 ?auto_482279 ) ) ( not ( = ?auto_482271 ?auto_482280 ) ) ( not ( = ?auto_482271 ?auto_482281 ) ) ( not ( = ?auto_482271 ?auto_482282 ) ) ( not ( = ?auto_482272 ?auto_482273 ) ) ( not ( = ?auto_482272 ?auto_482274 ) ) ( not ( = ?auto_482272 ?auto_482275 ) ) ( not ( = ?auto_482272 ?auto_482276 ) ) ( not ( = ?auto_482272 ?auto_482277 ) ) ( not ( = ?auto_482272 ?auto_482278 ) ) ( not ( = ?auto_482272 ?auto_482279 ) ) ( not ( = ?auto_482272 ?auto_482280 ) ) ( not ( = ?auto_482272 ?auto_482281 ) ) ( not ( = ?auto_482272 ?auto_482282 ) ) ( not ( = ?auto_482273 ?auto_482274 ) ) ( not ( = ?auto_482273 ?auto_482275 ) ) ( not ( = ?auto_482273 ?auto_482276 ) ) ( not ( = ?auto_482273 ?auto_482277 ) ) ( not ( = ?auto_482273 ?auto_482278 ) ) ( not ( = ?auto_482273 ?auto_482279 ) ) ( not ( = ?auto_482273 ?auto_482280 ) ) ( not ( = ?auto_482273 ?auto_482281 ) ) ( not ( = ?auto_482273 ?auto_482282 ) ) ( not ( = ?auto_482274 ?auto_482275 ) ) ( not ( = ?auto_482274 ?auto_482276 ) ) ( not ( = ?auto_482274 ?auto_482277 ) ) ( not ( = ?auto_482274 ?auto_482278 ) ) ( not ( = ?auto_482274 ?auto_482279 ) ) ( not ( = ?auto_482274 ?auto_482280 ) ) ( not ( = ?auto_482274 ?auto_482281 ) ) ( not ( = ?auto_482274 ?auto_482282 ) ) ( not ( = ?auto_482275 ?auto_482276 ) ) ( not ( = ?auto_482275 ?auto_482277 ) ) ( not ( = ?auto_482275 ?auto_482278 ) ) ( not ( = ?auto_482275 ?auto_482279 ) ) ( not ( = ?auto_482275 ?auto_482280 ) ) ( not ( = ?auto_482275 ?auto_482281 ) ) ( not ( = ?auto_482275 ?auto_482282 ) ) ( not ( = ?auto_482276 ?auto_482277 ) ) ( not ( = ?auto_482276 ?auto_482278 ) ) ( not ( = ?auto_482276 ?auto_482279 ) ) ( not ( = ?auto_482276 ?auto_482280 ) ) ( not ( = ?auto_482276 ?auto_482281 ) ) ( not ( = ?auto_482276 ?auto_482282 ) ) ( not ( = ?auto_482277 ?auto_482278 ) ) ( not ( = ?auto_482277 ?auto_482279 ) ) ( not ( = ?auto_482277 ?auto_482280 ) ) ( not ( = ?auto_482277 ?auto_482281 ) ) ( not ( = ?auto_482277 ?auto_482282 ) ) ( not ( = ?auto_482278 ?auto_482279 ) ) ( not ( = ?auto_482278 ?auto_482280 ) ) ( not ( = ?auto_482278 ?auto_482281 ) ) ( not ( = ?auto_482278 ?auto_482282 ) ) ( not ( = ?auto_482279 ?auto_482280 ) ) ( not ( = ?auto_482279 ?auto_482281 ) ) ( not ( = ?auto_482279 ?auto_482282 ) ) ( not ( = ?auto_482280 ?auto_482281 ) ) ( not ( = ?auto_482280 ?auto_482282 ) ) ( not ( = ?auto_482281 ?auto_482282 ) ) ( ON ?auto_482280 ?auto_482281 ) ( ON ?auto_482279 ?auto_482280 ) ( ON ?auto_482278 ?auto_482279 ) ( ON ?auto_482277 ?auto_482278 ) ( ON ?auto_482276 ?auto_482277 ) ( ON ?auto_482275 ?auto_482276 ) ( ON ?auto_482274 ?auto_482275 ) ( CLEAR ?auto_482272 ) ( ON ?auto_482273 ?auto_482274 ) ( CLEAR ?auto_482273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_482267 ?auto_482268 ?auto_482269 ?auto_482270 ?auto_482271 ?auto_482272 ?auto_482273 )
      ( MAKE-15PILE ?auto_482267 ?auto_482268 ?auto_482269 ?auto_482270 ?auto_482271 ?auto_482272 ?auto_482273 ?auto_482274 ?auto_482275 ?auto_482276 ?auto_482277 ?auto_482278 ?auto_482279 ?auto_482280 ?auto_482281 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_482329 - BLOCK
      ?auto_482330 - BLOCK
      ?auto_482331 - BLOCK
      ?auto_482332 - BLOCK
      ?auto_482333 - BLOCK
      ?auto_482334 - BLOCK
      ?auto_482335 - BLOCK
      ?auto_482336 - BLOCK
      ?auto_482337 - BLOCK
      ?auto_482338 - BLOCK
      ?auto_482339 - BLOCK
      ?auto_482340 - BLOCK
      ?auto_482341 - BLOCK
      ?auto_482342 - BLOCK
      ?auto_482343 - BLOCK
    )
    :vars
    (
      ?auto_482344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_482343 ?auto_482344 ) ( ON-TABLE ?auto_482329 ) ( ON ?auto_482330 ?auto_482329 ) ( ON ?auto_482331 ?auto_482330 ) ( ON ?auto_482332 ?auto_482331 ) ( ON ?auto_482333 ?auto_482332 ) ( not ( = ?auto_482329 ?auto_482330 ) ) ( not ( = ?auto_482329 ?auto_482331 ) ) ( not ( = ?auto_482329 ?auto_482332 ) ) ( not ( = ?auto_482329 ?auto_482333 ) ) ( not ( = ?auto_482329 ?auto_482334 ) ) ( not ( = ?auto_482329 ?auto_482335 ) ) ( not ( = ?auto_482329 ?auto_482336 ) ) ( not ( = ?auto_482329 ?auto_482337 ) ) ( not ( = ?auto_482329 ?auto_482338 ) ) ( not ( = ?auto_482329 ?auto_482339 ) ) ( not ( = ?auto_482329 ?auto_482340 ) ) ( not ( = ?auto_482329 ?auto_482341 ) ) ( not ( = ?auto_482329 ?auto_482342 ) ) ( not ( = ?auto_482329 ?auto_482343 ) ) ( not ( = ?auto_482329 ?auto_482344 ) ) ( not ( = ?auto_482330 ?auto_482331 ) ) ( not ( = ?auto_482330 ?auto_482332 ) ) ( not ( = ?auto_482330 ?auto_482333 ) ) ( not ( = ?auto_482330 ?auto_482334 ) ) ( not ( = ?auto_482330 ?auto_482335 ) ) ( not ( = ?auto_482330 ?auto_482336 ) ) ( not ( = ?auto_482330 ?auto_482337 ) ) ( not ( = ?auto_482330 ?auto_482338 ) ) ( not ( = ?auto_482330 ?auto_482339 ) ) ( not ( = ?auto_482330 ?auto_482340 ) ) ( not ( = ?auto_482330 ?auto_482341 ) ) ( not ( = ?auto_482330 ?auto_482342 ) ) ( not ( = ?auto_482330 ?auto_482343 ) ) ( not ( = ?auto_482330 ?auto_482344 ) ) ( not ( = ?auto_482331 ?auto_482332 ) ) ( not ( = ?auto_482331 ?auto_482333 ) ) ( not ( = ?auto_482331 ?auto_482334 ) ) ( not ( = ?auto_482331 ?auto_482335 ) ) ( not ( = ?auto_482331 ?auto_482336 ) ) ( not ( = ?auto_482331 ?auto_482337 ) ) ( not ( = ?auto_482331 ?auto_482338 ) ) ( not ( = ?auto_482331 ?auto_482339 ) ) ( not ( = ?auto_482331 ?auto_482340 ) ) ( not ( = ?auto_482331 ?auto_482341 ) ) ( not ( = ?auto_482331 ?auto_482342 ) ) ( not ( = ?auto_482331 ?auto_482343 ) ) ( not ( = ?auto_482331 ?auto_482344 ) ) ( not ( = ?auto_482332 ?auto_482333 ) ) ( not ( = ?auto_482332 ?auto_482334 ) ) ( not ( = ?auto_482332 ?auto_482335 ) ) ( not ( = ?auto_482332 ?auto_482336 ) ) ( not ( = ?auto_482332 ?auto_482337 ) ) ( not ( = ?auto_482332 ?auto_482338 ) ) ( not ( = ?auto_482332 ?auto_482339 ) ) ( not ( = ?auto_482332 ?auto_482340 ) ) ( not ( = ?auto_482332 ?auto_482341 ) ) ( not ( = ?auto_482332 ?auto_482342 ) ) ( not ( = ?auto_482332 ?auto_482343 ) ) ( not ( = ?auto_482332 ?auto_482344 ) ) ( not ( = ?auto_482333 ?auto_482334 ) ) ( not ( = ?auto_482333 ?auto_482335 ) ) ( not ( = ?auto_482333 ?auto_482336 ) ) ( not ( = ?auto_482333 ?auto_482337 ) ) ( not ( = ?auto_482333 ?auto_482338 ) ) ( not ( = ?auto_482333 ?auto_482339 ) ) ( not ( = ?auto_482333 ?auto_482340 ) ) ( not ( = ?auto_482333 ?auto_482341 ) ) ( not ( = ?auto_482333 ?auto_482342 ) ) ( not ( = ?auto_482333 ?auto_482343 ) ) ( not ( = ?auto_482333 ?auto_482344 ) ) ( not ( = ?auto_482334 ?auto_482335 ) ) ( not ( = ?auto_482334 ?auto_482336 ) ) ( not ( = ?auto_482334 ?auto_482337 ) ) ( not ( = ?auto_482334 ?auto_482338 ) ) ( not ( = ?auto_482334 ?auto_482339 ) ) ( not ( = ?auto_482334 ?auto_482340 ) ) ( not ( = ?auto_482334 ?auto_482341 ) ) ( not ( = ?auto_482334 ?auto_482342 ) ) ( not ( = ?auto_482334 ?auto_482343 ) ) ( not ( = ?auto_482334 ?auto_482344 ) ) ( not ( = ?auto_482335 ?auto_482336 ) ) ( not ( = ?auto_482335 ?auto_482337 ) ) ( not ( = ?auto_482335 ?auto_482338 ) ) ( not ( = ?auto_482335 ?auto_482339 ) ) ( not ( = ?auto_482335 ?auto_482340 ) ) ( not ( = ?auto_482335 ?auto_482341 ) ) ( not ( = ?auto_482335 ?auto_482342 ) ) ( not ( = ?auto_482335 ?auto_482343 ) ) ( not ( = ?auto_482335 ?auto_482344 ) ) ( not ( = ?auto_482336 ?auto_482337 ) ) ( not ( = ?auto_482336 ?auto_482338 ) ) ( not ( = ?auto_482336 ?auto_482339 ) ) ( not ( = ?auto_482336 ?auto_482340 ) ) ( not ( = ?auto_482336 ?auto_482341 ) ) ( not ( = ?auto_482336 ?auto_482342 ) ) ( not ( = ?auto_482336 ?auto_482343 ) ) ( not ( = ?auto_482336 ?auto_482344 ) ) ( not ( = ?auto_482337 ?auto_482338 ) ) ( not ( = ?auto_482337 ?auto_482339 ) ) ( not ( = ?auto_482337 ?auto_482340 ) ) ( not ( = ?auto_482337 ?auto_482341 ) ) ( not ( = ?auto_482337 ?auto_482342 ) ) ( not ( = ?auto_482337 ?auto_482343 ) ) ( not ( = ?auto_482337 ?auto_482344 ) ) ( not ( = ?auto_482338 ?auto_482339 ) ) ( not ( = ?auto_482338 ?auto_482340 ) ) ( not ( = ?auto_482338 ?auto_482341 ) ) ( not ( = ?auto_482338 ?auto_482342 ) ) ( not ( = ?auto_482338 ?auto_482343 ) ) ( not ( = ?auto_482338 ?auto_482344 ) ) ( not ( = ?auto_482339 ?auto_482340 ) ) ( not ( = ?auto_482339 ?auto_482341 ) ) ( not ( = ?auto_482339 ?auto_482342 ) ) ( not ( = ?auto_482339 ?auto_482343 ) ) ( not ( = ?auto_482339 ?auto_482344 ) ) ( not ( = ?auto_482340 ?auto_482341 ) ) ( not ( = ?auto_482340 ?auto_482342 ) ) ( not ( = ?auto_482340 ?auto_482343 ) ) ( not ( = ?auto_482340 ?auto_482344 ) ) ( not ( = ?auto_482341 ?auto_482342 ) ) ( not ( = ?auto_482341 ?auto_482343 ) ) ( not ( = ?auto_482341 ?auto_482344 ) ) ( not ( = ?auto_482342 ?auto_482343 ) ) ( not ( = ?auto_482342 ?auto_482344 ) ) ( not ( = ?auto_482343 ?auto_482344 ) ) ( ON ?auto_482342 ?auto_482343 ) ( ON ?auto_482341 ?auto_482342 ) ( ON ?auto_482340 ?auto_482341 ) ( ON ?auto_482339 ?auto_482340 ) ( ON ?auto_482338 ?auto_482339 ) ( ON ?auto_482337 ?auto_482338 ) ( ON ?auto_482336 ?auto_482337 ) ( ON ?auto_482335 ?auto_482336 ) ( CLEAR ?auto_482333 ) ( ON ?auto_482334 ?auto_482335 ) ( CLEAR ?auto_482334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_482329 ?auto_482330 ?auto_482331 ?auto_482332 ?auto_482333 ?auto_482334 )
      ( MAKE-15PILE ?auto_482329 ?auto_482330 ?auto_482331 ?auto_482332 ?auto_482333 ?auto_482334 ?auto_482335 ?auto_482336 ?auto_482337 ?auto_482338 ?auto_482339 ?auto_482340 ?auto_482341 ?auto_482342 ?auto_482343 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_482391 - BLOCK
      ?auto_482392 - BLOCK
      ?auto_482393 - BLOCK
      ?auto_482394 - BLOCK
      ?auto_482395 - BLOCK
      ?auto_482396 - BLOCK
      ?auto_482397 - BLOCK
      ?auto_482398 - BLOCK
      ?auto_482399 - BLOCK
      ?auto_482400 - BLOCK
      ?auto_482401 - BLOCK
      ?auto_482402 - BLOCK
      ?auto_482403 - BLOCK
      ?auto_482404 - BLOCK
      ?auto_482405 - BLOCK
    )
    :vars
    (
      ?auto_482406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_482405 ?auto_482406 ) ( ON-TABLE ?auto_482391 ) ( ON ?auto_482392 ?auto_482391 ) ( ON ?auto_482393 ?auto_482392 ) ( ON ?auto_482394 ?auto_482393 ) ( not ( = ?auto_482391 ?auto_482392 ) ) ( not ( = ?auto_482391 ?auto_482393 ) ) ( not ( = ?auto_482391 ?auto_482394 ) ) ( not ( = ?auto_482391 ?auto_482395 ) ) ( not ( = ?auto_482391 ?auto_482396 ) ) ( not ( = ?auto_482391 ?auto_482397 ) ) ( not ( = ?auto_482391 ?auto_482398 ) ) ( not ( = ?auto_482391 ?auto_482399 ) ) ( not ( = ?auto_482391 ?auto_482400 ) ) ( not ( = ?auto_482391 ?auto_482401 ) ) ( not ( = ?auto_482391 ?auto_482402 ) ) ( not ( = ?auto_482391 ?auto_482403 ) ) ( not ( = ?auto_482391 ?auto_482404 ) ) ( not ( = ?auto_482391 ?auto_482405 ) ) ( not ( = ?auto_482391 ?auto_482406 ) ) ( not ( = ?auto_482392 ?auto_482393 ) ) ( not ( = ?auto_482392 ?auto_482394 ) ) ( not ( = ?auto_482392 ?auto_482395 ) ) ( not ( = ?auto_482392 ?auto_482396 ) ) ( not ( = ?auto_482392 ?auto_482397 ) ) ( not ( = ?auto_482392 ?auto_482398 ) ) ( not ( = ?auto_482392 ?auto_482399 ) ) ( not ( = ?auto_482392 ?auto_482400 ) ) ( not ( = ?auto_482392 ?auto_482401 ) ) ( not ( = ?auto_482392 ?auto_482402 ) ) ( not ( = ?auto_482392 ?auto_482403 ) ) ( not ( = ?auto_482392 ?auto_482404 ) ) ( not ( = ?auto_482392 ?auto_482405 ) ) ( not ( = ?auto_482392 ?auto_482406 ) ) ( not ( = ?auto_482393 ?auto_482394 ) ) ( not ( = ?auto_482393 ?auto_482395 ) ) ( not ( = ?auto_482393 ?auto_482396 ) ) ( not ( = ?auto_482393 ?auto_482397 ) ) ( not ( = ?auto_482393 ?auto_482398 ) ) ( not ( = ?auto_482393 ?auto_482399 ) ) ( not ( = ?auto_482393 ?auto_482400 ) ) ( not ( = ?auto_482393 ?auto_482401 ) ) ( not ( = ?auto_482393 ?auto_482402 ) ) ( not ( = ?auto_482393 ?auto_482403 ) ) ( not ( = ?auto_482393 ?auto_482404 ) ) ( not ( = ?auto_482393 ?auto_482405 ) ) ( not ( = ?auto_482393 ?auto_482406 ) ) ( not ( = ?auto_482394 ?auto_482395 ) ) ( not ( = ?auto_482394 ?auto_482396 ) ) ( not ( = ?auto_482394 ?auto_482397 ) ) ( not ( = ?auto_482394 ?auto_482398 ) ) ( not ( = ?auto_482394 ?auto_482399 ) ) ( not ( = ?auto_482394 ?auto_482400 ) ) ( not ( = ?auto_482394 ?auto_482401 ) ) ( not ( = ?auto_482394 ?auto_482402 ) ) ( not ( = ?auto_482394 ?auto_482403 ) ) ( not ( = ?auto_482394 ?auto_482404 ) ) ( not ( = ?auto_482394 ?auto_482405 ) ) ( not ( = ?auto_482394 ?auto_482406 ) ) ( not ( = ?auto_482395 ?auto_482396 ) ) ( not ( = ?auto_482395 ?auto_482397 ) ) ( not ( = ?auto_482395 ?auto_482398 ) ) ( not ( = ?auto_482395 ?auto_482399 ) ) ( not ( = ?auto_482395 ?auto_482400 ) ) ( not ( = ?auto_482395 ?auto_482401 ) ) ( not ( = ?auto_482395 ?auto_482402 ) ) ( not ( = ?auto_482395 ?auto_482403 ) ) ( not ( = ?auto_482395 ?auto_482404 ) ) ( not ( = ?auto_482395 ?auto_482405 ) ) ( not ( = ?auto_482395 ?auto_482406 ) ) ( not ( = ?auto_482396 ?auto_482397 ) ) ( not ( = ?auto_482396 ?auto_482398 ) ) ( not ( = ?auto_482396 ?auto_482399 ) ) ( not ( = ?auto_482396 ?auto_482400 ) ) ( not ( = ?auto_482396 ?auto_482401 ) ) ( not ( = ?auto_482396 ?auto_482402 ) ) ( not ( = ?auto_482396 ?auto_482403 ) ) ( not ( = ?auto_482396 ?auto_482404 ) ) ( not ( = ?auto_482396 ?auto_482405 ) ) ( not ( = ?auto_482396 ?auto_482406 ) ) ( not ( = ?auto_482397 ?auto_482398 ) ) ( not ( = ?auto_482397 ?auto_482399 ) ) ( not ( = ?auto_482397 ?auto_482400 ) ) ( not ( = ?auto_482397 ?auto_482401 ) ) ( not ( = ?auto_482397 ?auto_482402 ) ) ( not ( = ?auto_482397 ?auto_482403 ) ) ( not ( = ?auto_482397 ?auto_482404 ) ) ( not ( = ?auto_482397 ?auto_482405 ) ) ( not ( = ?auto_482397 ?auto_482406 ) ) ( not ( = ?auto_482398 ?auto_482399 ) ) ( not ( = ?auto_482398 ?auto_482400 ) ) ( not ( = ?auto_482398 ?auto_482401 ) ) ( not ( = ?auto_482398 ?auto_482402 ) ) ( not ( = ?auto_482398 ?auto_482403 ) ) ( not ( = ?auto_482398 ?auto_482404 ) ) ( not ( = ?auto_482398 ?auto_482405 ) ) ( not ( = ?auto_482398 ?auto_482406 ) ) ( not ( = ?auto_482399 ?auto_482400 ) ) ( not ( = ?auto_482399 ?auto_482401 ) ) ( not ( = ?auto_482399 ?auto_482402 ) ) ( not ( = ?auto_482399 ?auto_482403 ) ) ( not ( = ?auto_482399 ?auto_482404 ) ) ( not ( = ?auto_482399 ?auto_482405 ) ) ( not ( = ?auto_482399 ?auto_482406 ) ) ( not ( = ?auto_482400 ?auto_482401 ) ) ( not ( = ?auto_482400 ?auto_482402 ) ) ( not ( = ?auto_482400 ?auto_482403 ) ) ( not ( = ?auto_482400 ?auto_482404 ) ) ( not ( = ?auto_482400 ?auto_482405 ) ) ( not ( = ?auto_482400 ?auto_482406 ) ) ( not ( = ?auto_482401 ?auto_482402 ) ) ( not ( = ?auto_482401 ?auto_482403 ) ) ( not ( = ?auto_482401 ?auto_482404 ) ) ( not ( = ?auto_482401 ?auto_482405 ) ) ( not ( = ?auto_482401 ?auto_482406 ) ) ( not ( = ?auto_482402 ?auto_482403 ) ) ( not ( = ?auto_482402 ?auto_482404 ) ) ( not ( = ?auto_482402 ?auto_482405 ) ) ( not ( = ?auto_482402 ?auto_482406 ) ) ( not ( = ?auto_482403 ?auto_482404 ) ) ( not ( = ?auto_482403 ?auto_482405 ) ) ( not ( = ?auto_482403 ?auto_482406 ) ) ( not ( = ?auto_482404 ?auto_482405 ) ) ( not ( = ?auto_482404 ?auto_482406 ) ) ( not ( = ?auto_482405 ?auto_482406 ) ) ( ON ?auto_482404 ?auto_482405 ) ( ON ?auto_482403 ?auto_482404 ) ( ON ?auto_482402 ?auto_482403 ) ( ON ?auto_482401 ?auto_482402 ) ( ON ?auto_482400 ?auto_482401 ) ( ON ?auto_482399 ?auto_482400 ) ( ON ?auto_482398 ?auto_482399 ) ( ON ?auto_482397 ?auto_482398 ) ( ON ?auto_482396 ?auto_482397 ) ( CLEAR ?auto_482394 ) ( ON ?auto_482395 ?auto_482396 ) ( CLEAR ?auto_482395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_482391 ?auto_482392 ?auto_482393 ?auto_482394 ?auto_482395 )
      ( MAKE-15PILE ?auto_482391 ?auto_482392 ?auto_482393 ?auto_482394 ?auto_482395 ?auto_482396 ?auto_482397 ?auto_482398 ?auto_482399 ?auto_482400 ?auto_482401 ?auto_482402 ?auto_482403 ?auto_482404 ?auto_482405 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_482453 - BLOCK
      ?auto_482454 - BLOCK
      ?auto_482455 - BLOCK
      ?auto_482456 - BLOCK
      ?auto_482457 - BLOCK
      ?auto_482458 - BLOCK
      ?auto_482459 - BLOCK
      ?auto_482460 - BLOCK
      ?auto_482461 - BLOCK
      ?auto_482462 - BLOCK
      ?auto_482463 - BLOCK
      ?auto_482464 - BLOCK
      ?auto_482465 - BLOCK
      ?auto_482466 - BLOCK
      ?auto_482467 - BLOCK
    )
    :vars
    (
      ?auto_482468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_482467 ?auto_482468 ) ( ON-TABLE ?auto_482453 ) ( ON ?auto_482454 ?auto_482453 ) ( ON ?auto_482455 ?auto_482454 ) ( not ( = ?auto_482453 ?auto_482454 ) ) ( not ( = ?auto_482453 ?auto_482455 ) ) ( not ( = ?auto_482453 ?auto_482456 ) ) ( not ( = ?auto_482453 ?auto_482457 ) ) ( not ( = ?auto_482453 ?auto_482458 ) ) ( not ( = ?auto_482453 ?auto_482459 ) ) ( not ( = ?auto_482453 ?auto_482460 ) ) ( not ( = ?auto_482453 ?auto_482461 ) ) ( not ( = ?auto_482453 ?auto_482462 ) ) ( not ( = ?auto_482453 ?auto_482463 ) ) ( not ( = ?auto_482453 ?auto_482464 ) ) ( not ( = ?auto_482453 ?auto_482465 ) ) ( not ( = ?auto_482453 ?auto_482466 ) ) ( not ( = ?auto_482453 ?auto_482467 ) ) ( not ( = ?auto_482453 ?auto_482468 ) ) ( not ( = ?auto_482454 ?auto_482455 ) ) ( not ( = ?auto_482454 ?auto_482456 ) ) ( not ( = ?auto_482454 ?auto_482457 ) ) ( not ( = ?auto_482454 ?auto_482458 ) ) ( not ( = ?auto_482454 ?auto_482459 ) ) ( not ( = ?auto_482454 ?auto_482460 ) ) ( not ( = ?auto_482454 ?auto_482461 ) ) ( not ( = ?auto_482454 ?auto_482462 ) ) ( not ( = ?auto_482454 ?auto_482463 ) ) ( not ( = ?auto_482454 ?auto_482464 ) ) ( not ( = ?auto_482454 ?auto_482465 ) ) ( not ( = ?auto_482454 ?auto_482466 ) ) ( not ( = ?auto_482454 ?auto_482467 ) ) ( not ( = ?auto_482454 ?auto_482468 ) ) ( not ( = ?auto_482455 ?auto_482456 ) ) ( not ( = ?auto_482455 ?auto_482457 ) ) ( not ( = ?auto_482455 ?auto_482458 ) ) ( not ( = ?auto_482455 ?auto_482459 ) ) ( not ( = ?auto_482455 ?auto_482460 ) ) ( not ( = ?auto_482455 ?auto_482461 ) ) ( not ( = ?auto_482455 ?auto_482462 ) ) ( not ( = ?auto_482455 ?auto_482463 ) ) ( not ( = ?auto_482455 ?auto_482464 ) ) ( not ( = ?auto_482455 ?auto_482465 ) ) ( not ( = ?auto_482455 ?auto_482466 ) ) ( not ( = ?auto_482455 ?auto_482467 ) ) ( not ( = ?auto_482455 ?auto_482468 ) ) ( not ( = ?auto_482456 ?auto_482457 ) ) ( not ( = ?auto_482456 ?auto_482458 ) ) ( not ( = ?auto_482456 ?auto_482459 ) ) ( not ( = ?auto_482456 ?auto_482460 ) ) ( not ( = ?auto_482456 ?auto_482461 ) ) ( not ( = ?auto_482456 ?auto_482462 ) ) ( not ( = ?auto_482456 ?auto_482463 ) ) ( not ( = ?auto_482456 ?auto_482464 ) ) ( not ( = ?auto_482456 ?auto_482465 ) ) ( not ( = ?auto_482456 ?auto_482466 ) ) ( not ( = ?auto_482456 ?auto_482467 ) ) ( not ( = ?auto_482456 ?auto_482468 ) ) ( not ( = ?auto_482457 ?auto_482458 ) ) ( not ( = ?auto_482457 ?auto_482459 ) ) ( not ( = ?auto_482457 ?auto_482460 ) ) ( not ( = ?auto_482457 ?auto_482461 ) ) ( not ( = ?auto_482457 ?auto_482462 ) ) ( not ( = ?auto_482457 ?auto_482463 ) ) ( not ( = ?auto_482457 ?auto_482464 ) ) ( not ( = ?auto_482457 ?auto_482465 ) ) ( not ( = ?auto_482457 ?auto_482466 ) ) ( not ( = ?auto_482457 ?auto_482467 ) ) ( not ( = ?auto_482457 ?auto_482468 ) ) ( not ( = ?auto_482458 ?auto_482459 ) ) ( not ( = ?auto_482458 ?auto_482460 ) ) ( not ( = ?auto_482458 ?auto_482461 ) ) ( not ( = ?auto_482458 ?auto_482462 ) ) ( not ( = ?auto_482458 ?auto_482463 ) ) ( not ( = ?auto_482458 ?auto_482464 ) ) ( not ( = ?auto_482458 ?auto_482465 ) ) ( not ( = ?auto_482458 ?auto_482466 ) ) ( not ( = ?auto_482458 ?auto_482467 ) ) ( not ( = ?auto_482458 ?auto_482468 ) ) ( not ( = ?auto_482459 ?auto_482460 ) ) ( not ( = ?auto_482459 ?auto_482461 ) ) ( not ( = ?auto_482459 ?auto_482462 ) ) ( not ( = ?auto_482459 ?auto_482463 ) ) ( not ( = ?auto_482459 ?auto_482464 ) ) ( not ( = ?auto_482459 ?auto_482465 ) ) ( not ( = ?auto_482459 ?auto_482466 ) ) ( not ( = ?auto_482459 ?auto_482467 ) ) ( not ( = ?auto_482459 ?auto_482468 ) ) ( not ( = ?auto_482460 ?auto_482461 ) ) ( not ( = ?auto_482460 ?auto_482462 ) ) ( not ( = ?auto_482460 ?auto_482463 ) ) ( not ( = ?auto_482460 ?auto_482464 ) ) ( not ( = ?auto_482460 ?auto_482465 ) ) ( not ( = ?auto_482460 ?auto_482466 ) ) ( not ( = ?auto_482460 ?auto_482467 ) ) ( not ( = ?auto_482460 ?auto_482468 ) ) ( not ( = ?auto_482461 ?auto_482462 ) ) ( not ( = ?auto_482461 ?auto_482463 ) ) ( not ( = ?auto_482461 ?auto_482464 ) ) ( not ( = ?auto_482461 ?auto_482465 ) ) ( not ( = ?auto_482461 ?auto_482466 ) ) ( not ( = ?auto_482461 ?auto_482467 ) ) ( not ( = ?auto_482461 ?auto_482468 ) ) ( not ( = ?auto_482462 ?auto_482463 ) ) ( not ( = ?auto_482462 ?auto_482464 ) ) ( not ( = ?auto_482462 ?auto_482465 ) ) ( not ( = ?auto_482462 ?auto_482466 ) ) ( not ( = ?auto_482462 ?auto_482467 ) ) ( not ( = ?auto_482462 ?auto_482468 ) ) ( not ( = ?auto_482463 ?auto_482464 ) ) ( not ( = ?auto_482463 ?auto_482465 ) ) ( not ( = ?auto_482463 ?auto_482466 ) ) ( not ( = ?auto_482463 ?auto_482467 ) ) ( not ( = ?auto_482463 ?auto_482468 ) ) ( not ( = ?auto_482464 ?auto_482465 ) ) ( not ( = ?auto_482464 ?auto_482466 ) ) ( not ( = ?auto_482464 ?auto_482467 ) ) ( not ( = ?auto_482464 ?auto_482468 ) ) ( not ( = ?auto_482465 ?auto_482466 ) ) ( not ( = ?auto_482465 ?auto_482467 ) ) ( not ( = ?auto_482465 ?auto_482468 ) ) ( not ( = ?auto_482466 ?auto_482467 ) ) ( not ( = ?auto_482466 ?auto_482468 ) ) ( not ( = ?auto_482467 ?auto_482468 ) ) ( ON ?auto_482466 ?auto_482467 ) ( ON ?auto_482465 ?auto_482466 ) ( ON ?auto_482464 ?auto_482465 ) ( ON ?auto_482463 ?auto_482464 ) ( ON ?auto_482462 ?auto_482463 ) ( ON ?auto_482461 ?auto_482462 ) ( ON ?auto_482460 ?auto_482461 ) ( ON ?auto_482459 ?auto_482460 ) ( ON ?auto_482458 ?auto_482459 ) ( ON ?auto_482457 ?auto_482458 ) ( CLEAR ?auto_482455 ) ( ON ?auto_482456 ?auto_482457 ) ( CLEAR ?auto_482456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_482453 ?auto_482454 ?auto_482455 ?auto_482456 )
      ( MAKE-15PILE ?auto_482453 ?auto_482454 ?auto_482455 ?auto_482456 ?auto_482457 ?auto_482458 ?auto_482459 ?auto_482460 ?auto_482461 ?auto_482462 ?auto_482463 ?auto_482464 ?auto_482465 ?auto_482466 ?auto_482467 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_482515 - BLOCK
      ?auto_482516 - BLOCK
      ?auto_482517 - BLOCK
      ?auto_482518 - BLOCK
      ?auto_482519 - BLOCK
      ?auto_482520 - BLOCK
      ?auto_482521 - BLOCK
      ?auto_482522 - BLOCK
      ?auto_482523 - BLOCK
      ?auto_482524 - BLOCK
      ?auto_482525 - BLOCK
      ?auto_482526 - BLOCK
      ?auto_482527 - BLOCK
      ?auto_482528 - BLOCK
      ?auto_482529 - BLOCK
    )
    :vars
    (
      ?auto_482530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_482529 ?auto_482530 ) ( ON-TABLE ?auto_482515 ) ( ON ?auto_482516 ?auto_482515 ) ( not ( = ?auto_482515 ?auto_482516 ) ) ( not ( = ?auto_482515 ?auto_482517 ) ) ( not ( = ?auto_482515 ?auto_482518 ) ) ( not ( = ?auto_482515 ?auto_482519 ) ) ( not ( = ?auto_482515 ?auto_482520 ) ) ( not ( = ?auto_482515 ?auto_482521 ) ) ( not ( = ?auto_482515 ?auto_482522 ) ) ( not ( = ?auto_482515 ?auto_482523 ) ) ( not ( = ?auto_482515 ?auto_482524 ) ) ( not ( = ?auto_482515 ?auto_482525 ) ) ( not ( = ?auto_482515 ?auto_482526 ) ) ( not ( = ?auto_482515 ?auto_482527 ) ) ( not ( = ?auto_482515 ?auto_482528 ) ) ( not ( = ?auto_482515 ?auto_482529 ) ) ( not ( = ?auto_482515 ?auto_482530 ) ) ( not ( = ?auto_482516 ?auto_482517 ) ) ( not ( = ?auto_482516 ?auto_482518 ) ) ( not ( = ?auto_482516 ?auto_482519 ) ) ( not ( = ?auto_482516 ?auto_482520 ) ) ( not ( = ?auto_482516 ?auto_482521 ) ) ( not ( = ?auto_482516 ?auto_482522 ) ) ( not ( = ?auto_482516 ?auto_482523 ) ) ( not ( = ?auto_482516 ?auto_482524 ) ) ( not ( = ?auto_482516 ?auto_482525 ) ) ( not ( = ?auto_482516 ?auto_482526 ) ) ( not ( = ?auto_482516 ?auto_482527 ) ) ( not ( = ?auto_482516 ?auto_482528 ) ) ( not ( = ?auto_482516 ?auto_482529 ) ) ( not ( = ?auto_482516 ?auto_482530 ) ) ( not ( = ?auto_482517 ?auto_482518 ) ) ( not ( = ?auto_482517 ?auto_482519 ) ) ( not ( = ?auto_482517 ?auto_482520 ) ) ( not ( = ?auto_482517 ?auto_482521 ) ) ( not ( = ?auto_482517 ?auto_482522 ) ) ( not ( = ?auto_482517 ?auto_482523 ) ) ( not ( = ?auto_482517 ?auto_482524 ) ) ( not ( = ?auto_482517 ?auto_482525 ) ) ( not ( = ?auto_482517 ?auto_482526 ) ) ( not ( = ?auto_482517 ?auto_482527 ) ) ( not ( = ?auto_482517 ?auto_482528 ) ) ( not ( = ?auto_482517 ?auto_482529 ) ) ( not ( = ?auto_482517 ?auto_482530 ) ) ( not ( = ?auto_482518 ?auto_482519 ) ) ( not ( = ?auto_482518 ?auto_482520 ) ) ( not ( = ?auto_482518 ?auto_482521 ) ) ( not ( = ?auto_482518 ?auto_482522 ) ) ( not ( = ?auto_482518 ?auto_482523 ) ) ( not ( = ?auto_482518 ?auto_482524 ) ) ( not ( = ?auto_482518 ?auto_482525 ) ) ( not ( = ?auto_482518 ?auto_482526 ) ) ( not ( = ?auto_482518 ?auto_482527 ) ) ( not ( = ?auto_482518 ?auto_482528 ) ) ( not ( = ?auto_482518 ?auto_482529 ) ) ( not ( = ?auto_482518 ?auto_482530 ) ) ( not ( = ?auto_482519 ?auto_482520 ) ) ( not ( = ?auto_482519 ?auto_482521 ) ) ( not ( = ?auto_482519 ?auto_482522 ) ) ( not ( = ?auto_482519 ?auto_482523 ) ) ( not ( = ?auto_482519 ?auto_482524 ) ) ( not ( = ?auto_482519 ?auto_482525 ) ) ( not ( = ?auto_482519 ?auto_482526 ) ) ( not ( = ?auto_482519 ?auto_482527 ) ) ( not ( = ?auto_482519 ?auto_482528 ) ) ( not ( = ?auto_482519 ?auto_482529 ) ) ( not ( = ?auto_482519 ?auto_482530 ) ) ( not ( = ?auto_482520 ?auto_482521 ) ) ( not ( = ?auto_482520 ?auto_482522 ) ) ( not ( = ?auto_482520 ?auto_482523 ) ) ( not ( = ?auto_482520 ?auto_482524 ) ) ( not ( = ?auto_482520 ?auto_482525 ) ) ( not ( = ?auto_482520 ?auto_482526 ) ) ( not ( = ?auto_482520 ?auto_482527 ) ) ( not ( = ?auto_482520 ?auto_482528 ) ) ( not ( = ?auto_482520 ?auto_482529 ) ) ( not ( = ?auto_482520 ?auto_482530 ) ) ( not ( = ?auto_482521 ?auto_482522 ) ) ( not ( = ?auto_482521 ?auto_482523 ) ) ( not ( = ?auto_482521 ?auto_482524 ) ) ( not ( = ?auto_482521 ?auto_482525 ) ) ( not ( = ?auto_482521 ?auto_482526 ) ) ( not ( = ?auto_482521 ?auto_482527 ) ) ( not ( = ?auto_482521 ?auto_482528 ) ) ( not ( = ?auto_482521 ?auto_482529 ) ) ( not ( = ?auto_482521 ?auto_482530 ) ) ( not ( = ?auto_482522 ?auto_482523 ) ) ( not ( = ?auto_482522 ?auto_482524 ) ) ( not ( = ?auto_482522 ?auto_482525 ) ) ( not ( = ?auto_482522 ?auto_482526 ) ) ( not ( = ?auto_482522 ?auto_482527 ) ) ( not ( = ?auto_482522 ?auto_482528 ) ) ( not ( = ?auto_482522 ?auto_482529 ) ) ( not ( = ?auto_482522 ?auto_482530 ) ) ( not ( = ?auto_482523 ?auto_482524 ) ) ( not ( = ?auto_482523 ?auto_482525 ) ) ( not ( = ?auto_482523 ?auto_482526 ) ) ( not ( = ?auto_482523 ?auto_482527 ) ) ( not ( = ?auto_482523 ?auto_482528 ) ) ( not ( = ?auto_482523 ?auto_482529 ) ) ( not ( = ?auto_482523 ?auto_482530 ) ) ( not ( = ?auto_482524 ?auto_482525 ) ) ( not ( = ?auto_482524 ?auto_482526 ) ) ( not ( = ?auto_482524 ?auto_482527 ) ) ( not ( = ?auto_482524 ?auto_482528 ) ) ( not ( = ?auto_482524 ?auto_482529 ) ) ( not ( = ?auto_482524 ?auto_482530 ) ) ( not ( = ?auto_482525 ?auto_482526 ) ) ( not ( = ?auto_482525 ?auto_482527 ) ) ( not ( = ?auto_482525 ?auto_482528 ) ) ( not ( = ?auto_482525 ?auto_482529 ) ) ( not ( = ?auto_482525 ?auto_482530 ) ) ( not ( = ?auto_482526 ?auto_482527 ) ) ( not ( = ?auto_482526 ?auto_482528 ) ) ( not ( = ?auto_482526 ?auto_482529 ) ) ( not ( = ?auto_482526 ?auto_482530 ) ) ( not ( = ?auto_482527 ?auto_482528 ) ) ( not ( = ?auto_482527 ?auto_482529 ) ) ( not ( = ?auto_482527 ?auto_482530 ) ) ( not ( = ?auto_482528 ?auto_482529 ) ) ( not ( = ?auto_482528 ?auto_482530 ) ) ( not ( = ?auto_482529 ?auto_482530 ) ) ( ON ?auto_482528 ?auto_482529 ) ( ON ?auto_482527 ?auto_482528 ) ( ON ?auto_482526 ?auto_482527 ) ( ON ?auto_482525 ?auto_482526 ) ( ON ?auto_482524 ?auto_482525 ) ( ON ?auto_482523 ?auto_482524 ) ( ON ?auto_482522 ?auto_482523 ) ( ON ?auto_482521 ?auto_482522 ) ( ON ?auto_482520 ?auto_482521 ) ( ON ?auto_482519 ?auto_482520 ) ( ON ?auto_482518 ?auto_482519 ) ( CLEAR ?auto_482516 ) ( ON ?auto_482517 ?auto_482518 ) ( CLEAR ?auto_482517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_482515 ?auto_482516 ?auto_482517 )
      ( MAKE-15PILE ?auto_482515 ?auto_482516 ?auto_482517 ?auto_482518 ?auto_482519 ?auto_482520 ?auto_482521 ?auto_482522 ?auto_482523 ?auto_482524 ?auto_482525 ?auto_482526 ?auto_482527 ?auto_482528 ?auto_482529 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_482577 - BLOCK
      ?auto_482578 - BLOCK
      ?auto_482579 - BLOCK
      ?auto_482580 - BLOCK
      ?auto_482581 - BLOCK
      ?auto_482582 - BLOCK
      ?auto_482583 - BLOCK
      ?auto_482584 - BLOCK
      ?auto_482585 - BLOCK
      ?auto_482586 - BLOCK
      ?auto_482587 - BLOCK
      ?auto_482588 - BLOCK
      ?auto_482589 - BLOCK
      ?auto_482590 - BLOCK
      ?auto_482591 - BLOCK
    )
    :vars
    (
      ?auto_482592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_482591 ?auto_482592 ) ( ON-TABLE ?auto_482577 ) ( not ( = ?auto_482577 ?auto_482578 ) ) ( not ( = ?auto_482577 ?auto_482579 ) ) ( not ( = ?auto_482577 ?auto_482580 ) ) ( not ( = ?auto_482577 ?auto_482581 ) ) ( not ( = ?auto_482577 ?auto_482582 ) ) ( not ( = ?auto_482577 ?auto_482583 ) ) ( not ( = ?auto_482577 ?auto_482584 ) ) ( not ( = ?auto_482577 ?auto_482585 ) ) ( not ( = ?auto_482577 ?auto_482586 ) ) ( not ( = ?auto_482577 ?auto_482587 ) ) ( not ( = ?auto_482577 ?auto_482588 ) ) ( not ( = ?auto_482577 ?auto_482589 ) ) ( not ( = ?auto_482577 ?auto_482590 ) ) ( not ( = ?auto_482577 ?auto_482591 ) ) ( not ( = ?auto_482577 ?auto_482592 ) ) ( not ( = ?auto_482578 ?auto_482579 ) ) ( not ( = ?auto_482578 ?auto_482580 ) ) ( not ( = ?auto_482578 ?auto_482581 ) ) ( not ( = ?auto_482578 ?auto_482582 ) ) ( not ( = ?auto_482578 ?auto_482583 ) ) ( not ( = ?auto_482578 ?auto_482584 ) ) ( not ( = ?auto_482578 ?auto_482585 ) ) ( not ( = ?auto_482578 ?auto_482586 ) ) ( not ( = ?auto_482578 ?auto_482587 ) ) ( not ( = ?auto_482578 ?auto_482588 ) ) ( not ( = ?auto_482578 ?auto_482589 ) ) ( not ( = ?auto_482578 ?auto_482590 ) ) ( not ( = ?auto_482578 ?auto_482591 ) ) ( not ( = ?auto_482578 ?auto_482592 ) ) ( not ( = ?auto_482579 ?auto_482580 ) ) ( not ( = ?auto_482579 ?auto_482581 ) ) ( not ( = ?auto_482579 ?auto_482582 ) ) ( not ( = ?auto_482579 ?auto_482583 ) ) ( not ( = ?auto_482579 ?auto_482584 ) ) ( not ( = ?auto_482579 ?auto_482585 ) ) ( not ( = ?auto_482579 ?auto_482586 ) ) ( not ( = ?auto_482579 ?auto_482587 ) ) ( not ( = ?auto_482579 ?auto_482588 ) ) ( not ( = ?auto_482579 ?auto_482589 ) ) ( not ( = ?auto_482579 ?auto_482590 ) ) ( not ( = ?auto_482579 ?auto_482591 ) ) ( not ( = ?auto_482579 ?auto_482592 ) ) ( not ( = ?auto_482580 ?auto_482581 ) ) ( not ( = ?auto_482580 ?auto_482582 ) ) ( not ( = ?auto_482580 ?auto_482583 ) ) ( not ( = ?auto_482580 ?auto_482584 ) ) ( not ( = ?auto_482580 ?auto_482585 ) ) ( not ( = ?auto_482580 ?auto_482586 ) ) ( not ( = ?auto_482580 ?auto_482587 ) ) ( not ( = ?auto_482580 ?auto_482588 ) ) ( not ( = ?auto_482580 ?auto_482589 ) ) ( not ( = ?auto_482580 ?auto_482590 ) ) ( not ( = ?auto_482580 ?auto_482591 ) ) ( not ( = ?auto_482580 ?auto_482592 ) ) ( not ( = ?auto_482581 ?auto_482582 ) ) ( not ( = ?auto_482581 ?auto_482583 ) ) ( not ( = ?auto_482581 ?auto_482584 ) ) ( not ( = ?auto_482581 ?auto_482585 ) ) ( not ( = ?auto_482581 ?auto_482586 ) ) ( not ( = ?auto_482581 ?auto_482587 ) ) ( not ( = ?auto_482581 ?auto_482588 ) ) ( not ( = ?auto_482581 ?auto_482589 ) ) ( not ( = ?auto_482581 ?auto_482590 ) ) ( not ( = ?auto_482581 ?auto_482591 ) ) ( not ( = ?auto_482581 ?auto_482592 ) ) ( not ( = ?auto_482582 ?auto_482583 ) ) ( not ( = ?auto_482582 ?auto_482584 ) ) ( not ( = ?auto_482582 ?auto_482585 ) ) ( not ( = ?auto_482582 ?auto_482586 ) ) ( not ( = ?auto_482582 ?auto_482587 ) ) ( not ( = ?auto_482582 ?auto_482588 ) ) ( not ( = ?auto_482582 ?auto_482589 ) ) ( not ( = ?auto_482582 ?auto_482590 ) ) ( not ( = ?auto_482582 ?auto_482591 ) ) ( not ( = ?auto_482582 ?auto_482592 ) ) ( not ( = ?auto_482583 ?auto_482584 ) ) ( not ( = ?auto_482583 ?auto_482585 ) ) ( not ( = ?auto_482583 ?auto_482586 ) ) ( not ( = ?auto_482583 ?auto_482587 ) ) ( not ( = ?auto_482583 ?auto_482588 ) ) ( not ( = ?auto_482583 ?auto_482589 ) ) ( not ( = ?auto_482583 ?auto_482590 ) ) ( not ( = ?auto_482583 ?auto_482591 ) ) ( not ( = ?auto_482583 ?auto_482592 ) ) ( not ( = ?auto_482584 ?auto_482585 ) ) ( not ( = ?auto_482584 ?auto_482586 ) ) ( not ( = ?auto_482584 ?auto_482587 ) ) ( not ( = ?auto_482584 ?auto_482588 ) ) ( not ( = ?auto_482584 ?auto_482589 ) ) ( not ( = ?auto_482584 ?auto_482590 ) ) ( not ( = ?auto_482584 ?auto_482591 ) ) ( not ( = ?auto_482584 ?auto_482592 ) ) ( not ( = ?auto_482585 ?auto_482586 ) ) ( not ( = ?auto_482585 ?auto_482587 ) ) ( not ( = ?auto_482585 ?auto_482588 ) ) ( not ( = ?auto_482585 ?auto_482589 ) ) ( not ( = ?auto_482585 ?auto_482590 ) ) ( not ( = ?auto_482585 ?auto_482591 ) ) ( not ( = ?auto_482585 ?auto_482592 ) ) ( not ( = ?auto_482586 ?auto_482587 ) ) ( not ( = ?auto_482586 ?auto_482588 ) ) ( not ( = ?auto_482586 ?auto_482589 ) ) ( not ( = ?auto_482586 ?auto_482590 ) ) ( not ( = ?auto_482586 ?auto_482591 ) ) ( not ( = ?auto_482586 ?auto_482592 ) ) ( not ( = ?auto_482587 ?auto_482588 ) ) ( not ( = ?auto_482587 ?auto_482589 ) ) ( not ( = ?auto_482587 ?auto_482590 ) ) ( not ( = ?auto_482587 ?auto_482591 ) ) ( not ( = ?auto_482587 ?auto_482592 ) ) ( not ( = ?auto_482588 ?auto_482589 ) ) ( not ( = ?auto_482588 ?auto_482590 ) ) ( not ( = ?auto_482588 ?auto_482591 ) ) ( not ( = ?auto_482588 ?auto_482592 ) ) ( not ( = ?auto_482589 ?auto_482590 ) ) ( not ( = ?auto_482589 ?auto_482591 ) ) ( not ( = ?auto_482589 ?auto_482592 ) ) ( not ( = ?auto_482590 ?auto_482591 ) ) ( not ( = ?auto_482590 ?auto_482592 ) ) ( not ( = ?auto_482591 ?auto_482592 ) ) ( ON ?auto_482590 ?auto_482591 ) ( ON ?auto_482589 ?auto_482590 ) ( ON ?auto_482588 ?auto_482589 ) ( ON ?auto_482587 ?auto_482588 ) ( ON ?auto_482586 ?auto_482587 ) ( ON ?auto_482585 ?auto_482586 ) ( ON ?auto_482584 ?auto_482585 ) ( ON ?auto_482583 ?auto_482584 ) ( ON ?auto_482582 ?auto_482583 ) ( ON ?auto_482581 ?auto_482582 ) ( ON ?auto_482580 ?auto_482581 ) ( ON ?auto_482579 ?auto_482580 ) ( CLEAR ?auto_482577 ) ( ON ?auto_482578 ?auto_482579 ) ( CLEAR ?auto_482578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_482577 ?auto_482578 )
      ( MAKE-15PILE ?auto_482577 ?auto_482578 ?auto_482579 ?auto_482580 ?auto_482581 ?auto_482582 ?auto_482583 ?auto_482584 ?auto_482585 ?auto_482586 ?auto_482587 ?auto_482588 ?auto_482589 ?auto_482590 ?auto_482591 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_482639 - BLOCK
      ?auto_482640 - BLOCK
      ?auto_482641 - BLOCK
      ?auto_482642 - BLOCK
      ?auto_482643 - BLOCK
      ?auto_482644 - BLOCK
      ?auto_482645 - BLOCK
      ?auto_482646 - BLOCK
      ?auto_482647 - BLOCK
      ?auto_482648 - BLOCK
      ?auto_482649 - BLOCK
      ?auto_482650 - BLOCK
      ?auto_482651 - BLOCK
      ?auto_482652 - BLOCK
      ?auto_482653 - BLOCK
    )
    :vars
    (
      ?auto_482654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_482653 ?auto_482654 ) ( not ( = ?auto_482639 ?auto_482640 ) ) ( not ( = ?auto_482639 ?auto_482641 ) ) ( not ( = ?auto_482639 ?auto_482642 ) ) ( not ( = ?auto_482639 ?auto_482643 ) ) ( not ( = ?auto_482639 ?auto_482644 ) ) ( not ( = ?auto_482639 ?auto_482645 ) ) ( not ( = ?auto_482639 ?auto_482646 ) ) ( not ( = ?auto_482639 ?auto_482647 ) ) ( not ( = ?auto_482639 ?auto_482648 ) ) ( not ( = ?auto_482639 ?auto_482649 ) ) ( not ( = ?auto_482639 ?auto_482650 ) ) ( not ( = ?auto_482639 ?auto_482651 ) ) ( not ( = ?auto_482639 ?auto_482652 ) ) ( not ( = ?auto_482639 ?auto_482653 ) ) ( not ( = ?auto_482639 ?auto_482654 ) ) ( not ( = ?auto_482640 ?auto_482641 ) ) ( not ( = ?auto_482640 ?auto_482642 ) ) ( not ( = ?auto_482640 ?auto_482643 ) ) ( not ( = ?auto_482640 ?auto_482644 ) ) ( not ( = ?auto_482640 ?auto_482645 ) ) ( not ( = ?auto_482640 ?auto_482646 ) ) ( not ( = ?auto_482640 ?auto_482647 ) ) ( not ( = ?auto_482640 ?auto_482648 ) ) ( not ( = ?auto_482640 ?auto_482649 ) ) ( not ( = ?auto_482640 ?auto_482650 ) ) ( not ( = ?auto_482640 ?auto_482651 ) ) ( not ( = ?auto_482640 ?auto_482652 ) ) ( not ( = ?auto_482640 ?auto_482653 ) ) ( not ( = ?auto_482640 ?auto_482654 ) ) ( not ( = ?auto_482641 ?auto_482642 ) ) ( not ( = ?auto_482641 ?auto_482643 ) ) ( not ( = ?auto_482641 ?auto_482644 ) ) ( not ( = ?auto_482641 ?auto_482645 ) ) ( not ( = ?auto_482641 ?auto_482646 ) ) ( not ( = ?auto_482641 ?auto_482647 ) ) ( not ( = ?auto_482641 ?auto_482648 ) ) ( not ( = ?auto_482641 ?auto_482649 ) ) ( not ( = ?auto_482641 ?auto_482650 ) ) ( not ( = ?auto_482641 ?auto_482651 ) ) ( not ( = ?auto_482641 ?auto_482652 ) ) ( not ( = ?auto_482641 ?auto_482653 ) ) ( not ( = ?auto_482641 ?auto_482654 ) ) ( not ( = ?auto_482642 ?auto_482643 ) ) ( not ( = ?auto_482642 ?auto_482644 ) ) ( not ( = ?auto_482642 ?auto_482645 ) ) ( not ( = ?auto_482642 ?auto_482646 ) ) ( not ( = ?auto_482642 ?auto_482647 ) ) ( not ( = ?auto_482642 ?auto_482648 ) ) ( not ( = ?auto_482642 ?auto_482649 ) ) ( not ( = ?auto_482642 ?auto_482650 ) ) ( not ( = ?auto_482642 ?auto_482651 ) ) ( not ( = ?auto_482642 ?auto_482652 ) ) ( not ( = ?auto_482642 ?auto_482653 ) ) ( not ( = ?auto_482642 ?auto_482654 ) ) ( not ( = ?auto_482643 ?auto_482644 ) ) ( not ( = ?auto_482643 ?auto_482645 ) ) ( not ( = ?auto_482643 ?auto_482646 ) ) ( not ( = ?auto_482643 ?auto_482647 ) ) ( not ( = ?auto_482643 ?auto_482648 ) ) ( not ( = ?auto_482643 ?auto_482649 ) ) ( not ( = ?auto_482643 ?auto_482650 ) ) ( not ( = ?auto_482643 ?auto_482651 ) ) ( not ( = ?auto_482643 ?auto_482652 ) ) ( not ( = ?auto_482643 ?auto_482653 ) ) ( not ( = ?auto_482643 ?auto_482654 ) ) ( not ( = ?auto_482644 ?auto_482645 ) ) ( not ( = ?auto_482644 ?auto_482646 ) ) ( not ( = ?auto_482644 ?auto_482647 ) ) ( not ( = ?auto_482644 ?auto_482648 ) ) ( not ( = ?auto_482644 ?auto_482649 ) ) ( not ( = ?auto_482644 ?auto_482650 ) ) ( not ( = ?auto_482644 ?auto_482651 ) ) ( not ( = ?auto_482644 ?auto_482652 ) ) ( not ( = ?auto_482644 ?auto_482653 ) ) ( not ( = ?auto_482644 ?auto_482654 ) ) ( not ( = ?auto_482645 ?auto_482646 ) ) ( not ( = ?auto_482645 ?auto_482647 ) ) ( not ( = ?auto_482645 ?auto_482648 ) ) ( not ( = ?auto_482645 ?auto_482649 ) ) ( not ( = ?auto_482645 ?auto_482650 ) ) ( not ( = ?auto_482645 ?auto_482651 ) ) ( not ( = ?auto_482645 ?auto_482652 ) ) ( not ( = ?auto_482645 ?auto_482653 ) ) ( not ( = ?auto_482645 ?auto_482654 ) ) ( not ( = ?auto_482646 ?auto_482647 ) ) ( not ( = ?auto_482646 ?auto_482648 ) ) ( not ( = ?auto_482646 ?auto_482649 ) ) ( not ( = ?auto_482646 ?auto_482650 ) ) ( not ( = ?auto_482646 ?auto_482651 ) ) ( not ( = ?auto_482646 ?auto_482652 ) ) ( not ( = ?auto_482646 ?auto_482653 ) ) ( not ( = ?auto_482646 ?auto_482654 ) ) ( not ( = ?auto_482647 ?auto_482648 ) ) ( not ( = ?auto_482647 ?auto_482649 ) ) ( not ( = ?auto_482647 ?auto_482650 ) ) ( not ( = ?auto_482647 ?auto_482651 ) ) ( not ( = ?auto_482647 ?auto_482652 ) ) ( not ( = ?auto_482647 ?auto_482653 ) ) ( not ( = ?auto_482647 ?auto_482654 ) ) ( not ( = ?auto_482648 ?auto_482649 ) ) ( not ( = ?auto_482648 ?auto_482650 ) ) ( not ( = ?auto_482648 ?auto_482651 ) ) ( not ( = ?auto_482648 ?auto_482652 ) ) ( not ( = ?auto_482648 ?auto_482653 ) ) ( not ( = ?auto_482648 ?auto_482654 ) ) ( not ( = ?auto_482649 ?auto_482650 ) ) ( not ( = ?auto_482649 ?auto_482651 ) ) ( not ( = ?auto_482649 ?auto_482652 ) ) ( not ( = ?auto_482649 ?auto_482653 ) ) ( not ( = ?auto_482649 ?auto_482654 ) ) ( not ( = ?auto_482650 ?auto_482651 ) ) ( not ( = ?auto_482650 ?auto_482652 ) ) ( not ( = ?auto_482650 ?auto_482653 ) ) ( not ( = ?auto_482650 ?auto_482654 ) ) ( not ( = ?auto_482651 ?auto_482652 ) ) ( not ( = ?auto_482651 ?auto_482653 ) ) ( not ( = ?auto_482651 ?auto_482654 ) ) ( not ( = ?auto_482652 ?auto_482653 ) ) ( not ( = ?auto_482652 ?auto_482654 ) ) ( not ( = ?auto_482653 ?auto_482654 ) ) ( ON ?auto_482652 ?auto_482653 ) ( ON ?auto_482651 ?auto_482652 ) ( ON ?auto_482650 ?auto_482651 ) ( ON ?auto_482649 ?auto_482650 ) ( ON ?auto_482648 ?auto_482649 ) ( ON ?auto_482647 ?auto_482648 ) ( ON ?auto_482646 ?auto_482647 ) ( ON ?auto_482645 ?auto_482646 ) ( ON ?auto_482644 ?auto_482645 ) ( ON ?auto_482643 ?auto_482644 ) ( ON ?auto_482642 ?auto_482643 ) ( ON ?auto_482641 ?auto_482642 ) ( ON ?auto_482640 ?auto_482641 ) ( ON ?auto_482639 ?auto_482640 ) ( CLEAR ?auto_482639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_482639 )
      ( MAKE-15PILE ?auto_482639 ?auto_482640 ?auto_482641 ?auto_482642 ?auto_482643 ?auto_482644 ?auto_482645 ?auto_482646 ?auto_482647 ?auto_482648 ?auto_482649 ?auto_482650 ?auto_482651 ?auto_482652 ?auto_482653 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_482702 - BLOCK
      ?auto_482703 - BLOCK
      ?auto_482704 - BLOCK
      ?auto_482705 - BLOCK
      ?auto_482706 - BLOCK
      ?auto_482707 - BLOCK
      ?auto_482708 - BLOCK
      ?auto_482709 - BLOCK
      ?auto_482710 - BLOCK
      ?auto_482711 - BLOCK
      ?auto_482712 - BLOCK
      ?auto_482713 - BLOCK
      ?auto_482714 - BLOCK
      ?auto_482715 - BLOCK
      ?auto_482716 - BLOCK
      ?auto_482717 - BLOCK
    )
    :vars
    (
      ?auto_482718 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_482716 ) ( ON ?auto_482717 ?auto_482718 ) ( CLEAR ?auto_482717 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_482702 ) ( ON ?auto_482703 ?auto_482702 ) ( ON ?auto_482704 ?auto_482703 ) ( ON ?auto_482705 ?auto_482704 ) ( ON ?auto_482706 ?auto_482705 ) ( ON ?auto_482707 ?auto_482706 ) ( ON ?auto_482708 ?auto_482707 ) ( ON ?auto_482709 ?auto_482708 ) ( ON ?auto_482710 ?auto_482709 ) ( ON ?auto_482711 ?auto_482710 ) ( ON ?auto_482712 ?auto_482711 ) ( ON ?auto_482713 ?auto_482712 ) ( ON ?auto_482714 ?auto_482713 ) ( ON ?auto_482715 ?auto_482714 ) ( ON ?auto_482716 ?auto_482715 ) ( not ( = ?auto_482702 ?auto_482703 ) ) ( not ( = ?auto_482702 ?auto_482704 ) ) ( not ( = ?auto_482702 ?auto_482705 ) ) ( not ( = ?auto_482702 ?auto_482706 ) ) ( not ( = ?auto_482702 ?auto_482707 ) ) ( not ( = ?auto_482702 ?auto_482708 ) ) ( not ( = ?auto_482702 ?auto_482709 ) ) ( not ( = ?auto_482702 ?auto_482710 ) ) ( not ( = ?auto_482702 ?auto_482711 ) ) ( not ( = ?auto_482702 ?auto_482712 ) ) ( not ( = ?auto_482702 ?auto_482713 ) ) ( not ( = ?auto_482702 ?auto_482714 ) ) ( not ( = ?auto_482702 ?auto_482715 ) ) ( not ( = ?auto_482702 ?auto_482716 ) ) ( not ( = ?auto_482702 ?auto_482717 ) ) ( not ( = ?auto_482702 ?auto_482718 ) ) ( not ( = ?auto_482703 ?auto_482704 ) ) ( not ( = ?auto_482703 ?auto_482705 ) ) ( not ( = ?auto_482703 ?auto_482706 ) ) ( not ( = ?auto_482703 ?auto_482707 ) ) ( not ( = ?auto_482703 ?auto_482708 ) ) ( not ( = ?auto_482703 ?auto_482709 ) ) ( not ( = ?auto_482703 ?auto_482710 ) ) ( not ( = ?auto_482703 ?auto_482711 ) ) ( not ( = ?auto_482703 ?auto_482712 ) ) ( not ( = ?auto_482703 ?auto_482713 ) ) ( not ( = ?auto_482703 ?auto_482714 ) ) ( not ( = ?auto_482703 ?auto_482715 ) ) ( not ( = ?auto_482703 ?auto_482716 ) ) ( not ( = ?auto_482703 ?auto_482717 ) ) ( not ( = ?auto_482703 ?auto_482718 ) ) ( not ( = ?auto_482704 ?auto_482705 ) ) ( not ( = ?auto_482704 ?auto_482706 ) ) ( not ( = ?auto_482704 ?auto_482707 ) ) ( not ( = ?auto_482704 ?auto_482708 ) ) ( not ( = ?auto_482704 ?auto_482709 ) ) ( not ( = ?auto_482704 ?auto_482710 ) ) ( not ( = ?auto_482704 ?auto_482711 ) ) ( not ( = ?auto_482704 ?auto_482712 ) ) ( not ( = ?auto_482704 ?auto_482713 ) ) ( not ( = ?auto_482704 ?auto_482714 ) ) ( not ( = ?auto_482704 ?auto_482715 ) ) ( not ( = ?auto_482704 ?auto_482716 ) ) ( not ( = ?auto_482704 ?auto_482717 ) ) ( not ( = ?auto_482704 ?auto_482718 ) ) ( not ( = ?auto_482705 ?auto_482706 ) ) ( not ( = ?auto_482705 ?auto_482707 ) ) ( not ( = ?auto_482705 ?auto_482708 ) ) ( not ( = ?auto_482705 ?auto_482709 ) ) ( not ( = ?auto_482705 ?auto_482710 ) ) ( not ( = ?auto_482705 ?auto_482711 ) ) ( not ( = ?auto_482705 ?auto_482712 ) ) ( not ( = ?auto_482705 ?auto_482713 ) ) ( not ( = ?auto_482705 ?auto_482714 ) ) ( not ( = ?auto_482705 ?auto_482715 ) ) ( not ( = ?auto_482705 ?auto_482716 ) ) ( not ( = ?auto_482705 ?auto_482717 ) ) ( not ( = ?auto_482705 ?auto_482718 ) ) ( not ( = ?auto_482706 ?auto_482707 ) ) ( not ( = ?auto_482706 ?auto_482708 ) ) ( not ( = ?auto_482706 ?auto_482709 ) ) ( not ( = ?auto_482706 ?auto_482710 ) ) ( not ( = ?auto_482706 ?auto_482711 ) ) ( not ( = ?auto_482706 ?auto_482712 ) ) ( not ( = ?auto_482706 ?auto_482713 ) ) ( not ( = ?auto_482706 ?auto_482714 ) ) ( not ( = ?auto_482706 ?auto_482715 ) ) ( not ( = ?auto_482706 ?auto_482716 ) ) ( not ( = ?auto_482706 ?auto_482717 ) ) ( not ( = ?auto_482706 ?auto_482718 ) ) ( not ( = ?auto_482707 ?auto_482708 ) ) ( not ( = ?auto_482707 ?auto_482709 ) ) ( not ( = ?auto_482707 ?auto_482710 ) ) ( not ( = ?auto_482707 ?auto_482711 ) ) ( not ( = ?auto_482707 ?auto_482712 ) ) ( not ( = ?auto_482707 ?auto_482713 ) ) ( not ( = ?auto_482707 ?auto_482714 ) ) ( not ( = ?auto_482707 ?auto_482715 ) ) ( not ( = ?auto_482707 ?auto_482716 ) ) ( not ( = ?auto_482707 ?auto_482717 ) ) ( not ( = ?auto_482707 ?auto_482718 ) ) ( not ( = ?auto_482708 ?auto_482709 ) ) ( not ( = ?auto_482708 ?auto_482710 ) ) ( not ( = ?auto_482708 ?auto_482711 ) ) ( not ( = ?auto_482708 ?auto_482712 ) ) ( not ( = ?auto_482708 ?auto_482713 ) ) ( not ( = ?auto_482708 ?auto_482714 ) ) ( not ( = ?auto_482708 ?auto_482715 ) ) ( not ( = ?auto_482708 ?auto_482716 ) ) ( not ( = ?auto_482708 ?auto_482717 ) ) ( not ( = ?auto_482708 ?auto_482718 ) ) ( not ( = ?auto_482709 ?auto_482710 ) ) ( not ( = ?auto_482709 ?auto_482711 ) ) ( not ( = ?auto_482709 ?auto_482712 ) ) ( not ( = ?auto_482709 ?auto_482713 ) ) ( not ( = ?auto_482709 ?auto_482714 ) ) ( not ( = ?auto_482709 ?auto_482715 ) ) ( not ( = ?auto_482709 ?auto_482716 ) ) ( not ( = ?auto_482709 ?auto_482717 ) ) ( not ( = ?auto_482709 ?auto_482718 ) ) ( not ( = ?auto_482710 ?auto_482711 ) ) ( not ( = ?auto_482710 ?auto_482712 ) ) ( not ( = ?auto_482710 ?auto_482713 ) ) ( not ( = ?auto_482710 ?auto_482714 ) ) ( not ( = ?auto_482710 ?auto_482715 ) ) ( not ( = ?auto_482710 ?auto_482716 ) ) ( not ( = ?auto_482710 ?auto_482717 ) ) ( not ( = ?auto_482710 ?auto_482718 ) ) ( not ( = ?auto_482711 ?auto_482712 ) ) ( not ( = ?auto_482711 ?auto_482713 ) ) ( not ( = ?auto_482711 ?auto_482714 ) ) ( not ( = ?auto_482711 ?auto_482715 ) ) ( not ( = ?auto_482711 ?auto_482716 ) ) ( not ( = ?auto_482711 ?auto_482717 ) ) ( not ( = ?auto_482711 ?auto_482718 ) ) ( not ( = ?auto_482712 ?auto_482713 ) ) ( not ( = ?auto_482712 ?auto_482714 ) ) ( not ( = ?auto_482712 ?auto_482715 ) ) ( not ( = ?auto_482712 ?auto_482716 ) ) ( not ( = ?auto_482712 ?auto_482717 ) ) ( not ( = ?auto_482712 ?auto_482718 ) ) ( not ( = ?auto_482713 ?auto_482714 ) ) ( not ( = ?auto_482713 ?auto_482715 ) ) ( not ( = ?auto_482713 ?auto_482716 ) ) ( not ( = ?auto_482713 ?auto_482717 ) ) ( not ( = ?auto_482713 ?auto_482718 ) ) ( not ( = ?auto_482714 ?auto_482715 ) ) ( not ( = ?auto_482714 ?auto_482716 ) ) ( not ( = ?auto_482714 ?auto_482717 ) ) ( not ( = ?auto_482714 ?auto_482718 ) ) ( not ( = ?auto_482715 ?auto_482716 ) ) ( not ( = ?auto_482715 ?auto_482717 ) ) ( not ( = ?auto_482715 ?auto_482718 ) ) ( not ( = ?auto_482716 ?auto_482717 ) ) ( not ( = ?auto_482716 ?auto_482718 ) ) ( not ( = ?auto_482717 ?auto_482718 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_482717 ?auto_482718 )
      ( !STACK ?auto_482717 ?auto_482716 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_482735 - BLOCK
      ?auto_482736 - BLOCK
      ?auto_482737 - BLOCK
      ?auto_482738 - BLOCK
      ?auto_482739 - BLOCK
      ?auto_482740 - BLOCK
      ?auto_482741 - BLOCK
      ?auto_482742 - BLOCK
      ?auto_482743 - BLOCK
      ?auto_482744 - BLOCK
      ?auto_482745 - BLOCK
      ?auto_482746 - BLOCK
      ?auto_482747 - BLOCK
      ?auto_482748 - BLOCK
      ?auto_482749 - BLOCK
      ?auto_482750 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_482749 ) ( ON-TABLE ?auto_482750 ) ( CLEAR ?auto_482750 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_482735 ) ( ON ?auto_482736 ?auto_482735 ) ( ON ?auto_482737 ?auto_482736 ) ( ON ?auto_482738 ?auto_482737 ) ( ON ?auto_482739 ?auto_482738 ) ( ON ?auto_482740 ?auto_482739 ) ( ON ?auto_482741 ?auto_482740 ) ( ON ?auto_482742 ?auto_482741 ) ( ON ?auto_482743 ?auto_482742 ) ( ON ?auto_482744 ?auto_482743 ) ( ON ?auto_482745 ?auto_482744 ) ( ON ?auto_482746 ?auto_482745 ) ( ON ?auto_482747 ?auto_482746 ) ( ON ?auto_482748 ?auto_482747 ) ( ON ?auto_482749 ?auto_482748 ) ( not ( = ?auto_482735 ?auto_482736 ) ) ( not ( = ?auto_482735 ?auto_482737 ) ) ( not ( = ?auto_482735 ?auto_482738 ) ) ( not ( = ?auto_482735 ?auto_482739 ) ) ( not ( = ?auto_482735 ?auto_482740 ) ) ( not ( = ?auto_482735 ?auto_482741 ) ) ( not ( = ?auto_482735 ?auto_482742 ) ) ( not ( = ?auto_482735 ?auto_482743 ) ) ( not ( = ?auto_482735 ?auto_482744 ) ) ( not ( = ?auto_482735 ?auto_482745 ) ) ( not ( = ?auto_482735 ?auto_482746 ) ) ( not ( = ?auto_482735 ?auto_482747 ) ) ( not ( = ?auto_482735 ?auto_482748 ) ) ( not ( = ?auto_482735 ?auto_482749 ) ) ( not ( = ?auto_482735 ?auto_482750 ) ) ( not ( = ?auto_482736 ?auto_482737 ) ) ( not ( = ?auto_482736 ?auto_482738 ) ) ( not ( = ?auto_482736 ?auto_482739 ) ) ( not ( = ?auto_482736 ?auto_482740 ) ) ( not ( = ?auto_482736 ?auto_482741 ) ) ( not ( = ?auto_482736 ?auto_482742 ) ) ( not ( = ?auto_482736 ?auto_482743 ) ) ( not ( = ?auto_482736 ?auto_482744 ) ) ( not ( = ?auto_482736 ?auto_482745 ) ) ( not ( = ?auto_482736 ?auto_482746 ) ) ( not ( = ?auto_482736 ?auto_482747 ) ) ( not ( = ?auto_482736 ?auto_482748 ) ) ( not ( = ?auto_482736 ?auto_482749 ) ) ( not ( = ?auto_482736 ?auto_482750 ) ) ( not ( = ?auto_482737 ?auto_482738 ) ) ( not ( = ?auto_482737 ?auto_482739 ) ) ( not ( = ?auto_482737 ?auto_482740 ) ) ( not ( = ?auto_482737 ?auto_482741 ) ) ( not ( = ?auto_482737 ?auto_482742 ) ) ( not ( = ?auto_482737 ?auto_482743 ) ) ( not ( = ?auto_482737 ?auto_482744 ) ) ( not ( = ?auto_482737 ?auto_482745 ) ) ( not ( = ?auto_482737 ?auto_482746 ) ) ( not ( = ?auto_482737 ?auto_482747 ) ) ( not ( = ?auto_482737 ?auto_482748 ) ) ( not ( = ?auto_482737 ?auto_482749 ) ) ( not ( = ?auto_482737 ?auto_482750 ) ) ( not ( = ?auto_482738 ?auto_482739 ) ) ( not ( = ?auto_482738 ?auto_482740 ) ) ( not ( = ?auto_482738 ?auto_482741 ) ) ( not ( = ?auto_482738 ?auto_482742 ) ) ( not ( = ?auto_482738 ?auto_482743 ) ) ( not ( = ?auto_482738 ?auto_482744 ) ) ( not ( = ?auto_482738 ?auto_482745 ) ) ( not ( = ?auto_482738 ?auto_482746 ) ) ( not ( = ?auto_482738 ?auto_482747 ) ) ( not ( = ?auto_482738 ?auto_482748 ) ) ( not ( = ?auto_482738 ?auto_482749 ) ) ( not ( = ?auto_482738 ?auto_482750 ) ) ( not ( = ?auto_482739 ?auto_482740 ) ) ( not ( = ?auto_482739 ?auto_482741 ) ) ( not ( = ?auto_482739 ?auto_482742 ) ) ( not ( = ?auto_482739 ?auto_482743 ) ) ( not ( = ?auto_482739 ?auto_482744 ) ) ( not ( = ?auto_482739 ?auto_482745 ) ) ( not ( = ?auto_482739 ?auto_482746 ) ) ( not ( = ?auto_482739 ?auto_482747 ) ) ( not ( = ?auto_482739 ?auto_482748 ) ) ( not ( = ?auto_482739 ?auto_482749 ) ) ( not ( = ?auto_482739 ?auto_482750 ) ) ( not ( = ?auto_482740 ?auto_482741 ) ) ( not ( = ?auto_482740 ?auto_482742 ) ) ( not ( = ?auto_482740 ?auto_482743 ) ) ( not ( = ?auto_482740 ?auto_482744 ) ) ( not ( = ?auto_482740 ?auto_482745 ) ) ( not ( = ?auto_482740 ?auto_482746 ) ) ( not ( = ?auto_482740 ?auto_482747 ) ) ( not ( = ?auto_482740 ?auto_482748 ) ) ( not ( = ?auto_482740 ?auto_482749 ) ) ( not ( = ?auto_482740 ?auto_482750 ) ) ( not ( = ?auto_482741 ?auto_482742 ) ) ( not ( = ?auto_482741 ?auto_482743 ) ) ( not ( = ?auto_482741 ?auto_482744 ) ) ( not ( = ?auto_482741 ?auto_482745 ) ) ( not ( = ?auto_482741 ?auto_482746 ) ) ( not ( = ?auto_482741 ?auto_482747 ) ) ( not ( = ?auto_482741 ?auto_482748 ) ) ( not ( = ?auto_482741 ?auto_482749 ) ) ( not ( = ?auto_482741 ?auto_482750 ) ) ( not ( = ?auto_482742 ?auto_482743 ) ) ( not ( = ?auto_482742 ?auto_482744 ) ) ( not ( = ?auto_482742 ?auto_482745 ) ) ( not ( = ?auto_482742 ?auto_482746 ) ) ( not ( = ?auto_482742 ?auto_482747 ) ) ( not ( = ?auto_482742 ?auto_482748 ) ) ( not ( = ?auto_482742 ?auto_482749 ) ) ( not ( = ?auto_482742 ?auto_482750 ) ) ( not ( = ?auto_482743 ?auto_482744 ) ) ( not ( = ?auto_482743 ?auto_482745 ) ) ( not ( = ?auto_482743 ?auto_482746 ) ) ( not ( = ?auto_482743 ?auto_482747 ) ) ( not ( = ?auto_482743 ?auto_482748 ) ) ( not ( = ?auto_482743 ?auto_482749 ) ) ( not ( = ?auto_482743 ?auto_482750 ) ) ( not ( = ?auto_482744 ?auto_482745 ) ) ( not ( = ?auto_482744 ?auto_482746 ) ) ( not ( = ?auto_482744 ?auto_482747 ) ) ( not ( = ?auto_482744 ?auto_482748 ) ) ( not ( = ?auto_482744 ?auto_482749 ) ) ( not ( = ?auto_482744 ?auto_482750 ) ) ( not ( = ?auto_482745 ?auto_482746 ) ) ( not ( = ?auto_482745 ?auto_482747 ) ) ( not ( = ?auto_482745 ?auto_482748 ) ) ( not ( = ?auto_482745 ?auto_482749 ) ) ( not ( = ?auto_482745 ?auto_482750 ) ) ( not ( = ?auto_482746 ?auto_482747 ) ) ( not ( = ?auto_482746 ?auto_482748 ) ) ( not ( = ?auto_482746 ?auto_482749 ) ) ( not ( = ?auto_482746 ?auto_482750 ) ) ( not ( = ?auto_482747 ?auto_482748 ) ) ( not ( = ?auto_482747 ?auto_482749 ) ) ( not ( = ?auto_482747 ?auto_482750 ) ) ( not ( = ?auto_482748 ?auto_482749 ) ) ( not ( = ?auto_482748 ?auto_482750 ) ) ( not ( = ?auto_482749 ?auto_482750 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_482750 )
      ( !STACK ?auto_482750 ?auto_482749 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_482767 - BLOCK
      ?auto_482768 - BLOCK
      ?auto_482769 - BLOCK
      ?auto_482770 - BLOCK
      ?auto_482771 - BLOCK
      ?auto_482772 - BLOCK
      ?auto_482773 - BLOCK
      ?auto_482774 - BLOCK
      ?auto_482775 - BLOCK
      ?auto_482776 - BLOCK
      ?auto_482777 - BLOCK
      ?auto_482778 - BLOCK
      ?auto_482779 - BLOCK
      ?auto_482780 - BLOCK
      ?auto_482781 - BLOCK
      ?auto_482782 - BLOCK
    )
    :vars
    (
      ?auto_482783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_482782 ?auto_482783 ) ( ON-TABLE ?auto_482767 ) ( ON ?auto_482768 ?auto_482767 ) ( ON ?auto_482769 ?auto_482768 ) ( ON ?auto_482770 ?auto_482769 ) ( ON ?auto_482771 ?auto_482770 ) ( ON ?auto_482772 ?auto_482771 ) ( ON ?auto_482773 ?auto_482772 ) ( ON ?auto_482774 ?auto_482773 ) ( ON ?auto_482775 ?auto_482774 ) ( ON ?auto_482776 ?auto_482775 ) ( ON ?auto_482777 ?auto_482776 ) ( ON ?auto_482778 ?auto_482777 ) ( ON ?auto_482779 ?auto_482778 ) ( ON ?auto_482780 ?auto_482779 ) ( not ( = ?auto_482767 ?auto_482768 ) ) ( not ( = ?auto_482767 ?auto_482769 ) ) ( not ( = ?auto_482767 ?auto_482770 ) ) ( not ( = ?auto_482767 ?auto_482771 ) ) ( not ( = ?auto_482767 ?auto_482772 ) ) ( not ( = ?auto_482767 ?auto_482773 ) ) ( not ( = ?auto_482767 ?auto_482774 ) ) ( not ( = ?auto_482767 ?auto_482775 ) ) ( not ( = ?auto_482767 ?auto_482776 ) ) ( not ( = ?auto_482767 ?auto_482777 ) ) ( not ( = ?auto_482767 ?auto_482778 ) ) ( not ( = ?auto_482767 ?auto_482779 ) ) ( not ( = ?auto_482767 ?auto_482780 ) ) ( not ( = ?auto_482767 ?auto_482781 ) ) ( not ( = ?auto_482767 ?auto_482782 ) ) ( not ( = ?auto_482767 ?auto_482783 ) ) ( not ( = ?auto_482768 ?auto_482769 ) ) ( not ( = ?auto_482768 ?auto_482770 ) ) ( not ( = ?auto_482768 ?auto_482771 ) ) ( not ( = ?auto_482768 ?auto_482772 ) ) ( not ( = ?auto_482768 ?auto_482773 ) ) ( not ( = ?auto_482768 ?auto_482774 ) ) ( not ( = ?auto_482768 ?auto_482775 ) ) ( not ( = ?auto_482768 ?auto_482776 ) ) ( not ( = ?auto_482768 ?auto_482777 ) ) ( not ( = ?auto_482768 ?auto_482778 ) ) ( not ( = ?auto_482768 ?auto_482779 ) ) ( not ( = ?auto_482768 ?auto_482780 ) ) ( not ( = ?auto_482768 ?auto_482781 ) ) ( not ( = ?auto_482768 ?auto_482782 ) ) ( not ( = ?auto_482768 ?auto_482783 ) ) ( not ( = ?auto_482769 ?auto_482770 ) ) ( not ( = ?auto_482769 ?auto_482771 ) ) ( not ( = ?auto_482769 ?auto_482772 ) ) ( not ( = ?auto_482769 ?auto_482773 ) ) ( not ( = ?auto_482769 ?auto_482774 ) ) ( not ( = ?auto_482769 ?auto_482775 ) ) ( not ( = ?auto_482769 ?auto_482776 ) ) ( not ( = ?auto_482769 ?auto_482777 ) ) ( not ( = ?auto_482769 ?auto_482778 ) ) ( not ( = ?auto_482769 ?auto_482779 ) ) ( not ( = ?auto_482769 ?auto_482780 ) ) ( not ( = ?auto_482769 ?auto_482781 ) ) ( not ( = ?auto_482769 ?auto_482782 ) ) ( not ( = ?auto_482769 ?auto_482783 ) ) ( not ( = ?auto_482770 ?auto_482771 ) ) ( not ( = ?auto_482770 ?auto_482772 ) ) ( not ( = ?auto_482770 ?auto_482773 ) ) ( not ( = ?auto_482770 ?auto_482774 ) ) ( not ( = ?auto_482770 ?auto_482775 ) ) ( not ( = ?auto_482770 ?auto_482776 ) ) ( not ( = ?auto_482770 ?auto_482777 ) ) ( not ( = ?auto_482770 ?auto_482778 ) ) ( not ( = ?auto_482770 ?auto_482779 ) ) ( not ( = ?auto_482770 ?auto_482780 ) ) ( not ( = ?auto_482770 ?auto_482781 ) ) ( not ( = ?auto_482770 ?auto_482782 ) ) ( not ( = ?auto_482770 ?auto_482783 ) ) ( not ( = ?auto_482771 ?auto_482772 ) ) ( not ( = ?auto_482771 ?auto_482773 ) ) ( not ( = ?auto_482771 ?auto_482774 ) ) ( not ( = ?auto_482771 ?auto_482775 ) ) ( not ( = ?auto_482771 ?auto_482776 ) ) ( not ( = ?auto_482771 ?auto_482777 ) ) ( not ( = ?auto_482771 ?auto_482778 ) ) ( not ( = ?auto_482771 ?auto_482779 ) ) ( not ( = ?auto_482771 ?auto_482780 ) ) ( not ( = ?auto_482771 ?auto_482781 ) ) ( not ( = ?auto_482771 ?auto_482782 ) ) ( not ( = ?auto_482771 ?auto_482783 ) ) ( not ( = ?auto_482772 ?auto_482773 ) ) ( not ( = ?auto_482772 ?auto_482774 ) ) ( not ( = ?auto_482772 ?auto_482775 ) ) ( not ( = ?auto_482772 ?auto_482776 ) ) ( not ( = ?auto_482772 ?auto_482777 ) ) ( not ( = ?auto_482772 ?auto_482778 ) ) ( not ( = ?auto_482772 ?auto_482779 ) ) ( not ( = ?auto_482772 ?auto_482780 ) ) ( not ( = ?auto_482772 ?auto_482781 ) ) ( not ( = ?auto_482772 ?auto_482782 ) ) ( not ( = ?auto_482772 ?auto_482783 ) ) ( not ( = ?auto_482773 ?auto_482774 ) ) ( not ( = ?auto_482773 ?auto_482775 ) ) ( not ( = ?auto_482773 ?auto_482776 ) ) ( not ( = ?auto_482773 ?auto_482777 ) ) ( not ( = ?auto_482773 ?auto_482778 ) ) ( not ( = ?auto_482773 ?auto_482779 ) ) ( not ( = ?auto_482773 ?auto_482780 ) ) ( not ( = ?auto_482773 ?auto_482781 ) ) ( not ( = ?auto_482773 ?auto_482782 ) ) ( not ( = ?auto_482773 ?auto_482783 ) ) ( not ( = ?auto_482774 ?auto_482775 ) ) ( not ( = ?auto_482774 ?auto_482776 ) ) ( not ( = ?auto_482774 ?auto_482777 ) ) ( not ( = ?auto_482774 ?auto_482778 ) ) ( not ( = ?auto_482774 ?auto_482779 ) ) ( not ( = ?auto_482774 ?auto_482780 ) ) ( not ( = ?auto_482774 ?auto_482781 ) ) ( not ( = ?auto_482774 ?auto_482782 ) ) ( not ( = ?auto_482774 ?auto_482783 ) ) ( not ( = ?auto_482775 ?auto_482776 ) ) ( not ( = ?auto_482775 ?auto_482777 ) ) ( not ( = ?auto_482775 ?auto_482778 ) ) ( not ( = ?auto_482775 ?auto_482779 ) ) ( not ( = ?auto_482775 ?auto_482780 ) ) ( not ( = ?auto_482775 ?auto_482781 ) ) ( not ( = ?auto_482775 ?auto_482782 ) ) ( not ( = ?auto_482775 ?auto_482783 ) ) ( not ( = ?auto_482776 ?auto_482777 ) ) ( not ( = ?auto_482776 ?auto_482778 ) ) ( not ( = ?auto_482776 ?auto_482779 ) ) ( not ( = ?auto_482776 ?auto_482780 ) ) ( not ( = ?auto_482776 ?auto_482781 ) ) ( not ( = ?auto_482776 ?auto_482782 ) ) ( not ( = ?auto_482776 ?auto_482783 ) ) ( not ( = ?auto_482777 ?auto_482778 ) ) ( not ( = ?auto_482777 ?auto_482779 ) ) ( not ( = ?auto_482777 ?auto_482780 ) ) ( not ( = ?auto_482777 ?auto_482781 ) ) ( not ( = ?auto_482777 ?auto_482782 ) ) ( not ( = ?auto_482777 ?auto_482783 ) ) ( not ( = ?auto_482778 ?auto_482779 ) ) ( not ( = ?auto_482778 ?auto_482780 ) ) ( not ( = ?auto_482778 ?auto_482781 ) ) ( not ( = ?auto_482778 ?auto_482782 ) ) ( not ( = ?auto_482778 ?auto_482783 ) ) ( not ( = ?auto_482779 ?auto_482780 ) ) ( not ( = ?auto_482779 ?auto_482781 ) ) ( not ( = ?auto_482779 ?auto_482782 ) ) ( not ( = ?auto_482779 ?auto_482783 ) ) ( not ( = ?auto_482780 ?auto_482781 ) ) ( not ( = ?auto_482780 ?auto_482782 ) ) ( not ( = ?auto_482780 ?auto_482783 ) ) ( not ( = ?auto_482781 ?auto_482782 ) ) ( not ( = ?auto_482781 ?auto_482783 ) ) ( not ( = ?auto_482782 ?auto_482783 ) ) ( CLEAR ?auto_482780 ) ( ON ?auto_482781 ?auto_482782 ) ( CLEAR ?auto_482781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_482767 ?auto_482768 ?auto_482769 ?auto_482770 ?auto_482771 ?auto_482772 ?auto_482773 ?auto_482774 ?auto_482775 ?auto_482776 ?auto_482777 ?auto_482778 ?auto_482779 ?auto_482780 ?auto_482781 )
      ( MAKE-16PILE ?auto_482767 ?auto_482768 ?auto_482769 ?auto_482770 ?auto_482771 ?auto_482772 ?auto_482773 ?auto_482774 ?auto_482775 ?auto_482776 ?auto_482777 ?auto_482778 ?auto_482779 ?auto_482780 ?auto_482781 ?auto_482782 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_482800 - BLOCK
      ?auto_482801 - BLOCK
      ?auto_482802 - BLOCK
      ?auto_482803 - BLOCK
      ?auto_482804 - BLOCK
      ?auto_482805 - BLOCK
      ?auto_482806 - BLOCK
      ?auto_482807 - BLOCK
      ?auto_482808 - BLOCK
      ?auto_482809 - BLOCK
      ?auto_482810 - BLOCK
      ?auto_482811 - BLOCK
      ?auto_482812 - BLOCK
      ?auto_482813 - BLOCK
      ?auto_482814 - BLOCK
      ?auto_482815 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_482815 ) ( ON-TABLE ?auto_482800 ) ( ON ?auto_482801 ?auto_482800 ) ( ON ?auto_482802 ?auto_482801 ) ( ON ?auto_482803 ?auto_482802 ) ( ON ?auto_482804 ?auto_482803 ) ( ON ?auto_482805 ?auto_482804 ) ( ON ?auto_482806 ?auto_482805 ) ( ON ?auto_482807 ?auto_482806 ) ( ON ?auto_482808 ?auto_482807 ) ( ON ?auto_482809 ?auto_482808 ) ( ON ?auto_482810 ?auto_482809 ) ( ON ?auto_482811 ?auto_482810 ) ( ON ?auto_482812 ?auto_482811 ) ( ON ?auto_482813 ?auto_482812 ) ( not ( = ?auto_482800 ?auto_482801 ) ) ( not ( = ?auto_482800 ?auto_482802 ) ) ( not ( = ?auto_482800 ?auto_482803 ) ) ( not ( = ?auto_482800 ?auto_482804 ) ) ( not ( = ?auto_482800 ?auto_482805 ) ) ( not ( = ?auto_482800 ?auto_482806 ) ) ( not ( = ?auto_482800 ?auto_482807 ) ) ( not ( = ?auto_482800 ?auto_482808 ) ) ( not ( = ?auto_482800 ?auto_482809 ) ) ( not ( = ?auto_482800 ?auto_482810 ) ) ( not ( = ?auto_482800 ?auto_482811 ) ) ( not ( = ?auto_482800 ?auto_482812 ) ) ( not ( = ?auto_482800 ?auto_482813 ) ) ( not ( = ?auto_482800 ?auto_482814 ) ) ( not ( = ?auto_482800 ?auto_482815 ) ) ( not ( = ?auto_482801 ?auto_482802 ) ) ( not ( = ?auto_482801 ?auto_482803 ) ) ( not ( = ?auto_482801 ?auto_482804 ) ) ( not ( = ?auto_482801 ?auto_482805 ) ) ( not ( = ?auto_482801 ?auto_482806 ) ) ( not ( = ?auto_482801 ?auto_482807 ) ) ( not ( = ?auto_482801 ?auto_482808 ) ) ( not ( = ?auto_482801 ?auto_482809 ) ) ( not ( = ?auto_482801 ?auto_482810 ) ) ( not ( = ?auto_482801 ?auto_482811 ) ) ( not ( = ?auto_482801 ?auto_482812 ) ) ( not ( = ?auto_482801 ?auto_482813 ) ) ( not ( = ?auto_482801 ?auto_482814 ) ) ( not ( = ?auto_482801 ?auto_482815 ) ) ( not ( = ?auto_482802 ?auto_482803 ) ) ( not ( = ?auto_482802 ?auto_482804 ) ) ( not ( = ?auto_482802 ?auto_482805 ) ) ( not ( = ?auto_482802 ?auto_482806 ) ) ( not ( = ?auto_482802 ?auto_482807 ) ) ( not ( = ?auto_482802 ?auto_482808 ) ) ( not ( = ?auto_482802 ?auto_482809 ) ) ( not ( = ?auto_482802 ?auto_482810 ) ) ( not ( = ?auto_482802 ?auto_482811 ) ) ( not ( = ?auto_482802 ?auto_482812 ) ) ( not ( = ?auto_482802 ?auto_482813 ) ) ( not ( = ?auto_482802 ?auto_482814 ) ) ( not ( = ?auto_482802 ?auto_482815 ) ) ( not ( = ?auto_482803 ?auto_482804 ) ) ( not ( = ?auto_482803 ?auto_482805 ) ) ( not ( = ?auto_482803 ?auto_482806 ) ) ( not ( = ?auto_482803 ?auto_482807 ) ) ( not ( = ?auto_482803 ?auto_482808 ) ) ( not ( = ?auto_482803 ?auto_482809 ) ) ( not ( = ?auto_482803 ?auto_482810 ) ) ( not ( = ?auto_482803 ?auto_482811 ) ) ( not ( = ?auto_482803 ?auto_482812 ) ) ( not ( = ?auto_482803 ?auto_482813 ) ) ( not ( = ?auto_482803 ?auto_482814 ) ) ( not ( = ?auto_482803 ?auto_482815 ) ) ( not ( = ?auto_482804 ?auto_482805 ) ) ( not ( = ?auto_482804 ?auto_482806 ) ) ( not ( = ?auto_482804 ?auto_482807 ) ) ( not ( = ?auto_482804 ?auto_482808 ) ) ( not ( = ?auto_482804 ?auto_482809 ) ) ( not ( = ?auto_482804 ?auto_482810 ) ) ( not ( = ?auto_482804 ?auto_482811 ) ) ( not ( = ?auto_482804 ?auto_482812 ) ) ( not ( = ?auto_482804 ?auto_482813 ) ) ( not ( = ?auto_482804 ?auto_482814 ) ) ( not ( = ?auto_482804 ?auto_482815 ) ) ( not ( = ?auto_482805 ?auto_482806 ) ) ( not ( = ?auto_482805 ?auto_482807 ) ) ( not ( = ?auto_482805 ?auto_482808 ) ) ( not ( = ?auto_482805 ?auto_482809 ) ) ( not ( = ?auto_482805 ?auto_482810 ) ) ( not ( = ?auto_482805 ?auto_482811 ) ) ( not ( = ?auto_482805 ?auto_482812 ) ) ( not ( = ?auto_482805 ?auto_482813 ) ) ( not ( = ?auto_482805 ?auto_482814 ) ) ( not ( = ?auto_482805 ?auto_482815 ) ) ( not ( = ?auto_482806 ?auto_482807 ) ) ( not ( = ?auto_482806 ?auto_482808 ) ) ( not ( = ?auto_482806 ?auto_482809 ) ) ( not ( = ?auto_482806 ?auto_482810 ) ) ( not ( = ?auto_482806 ?auto_482811 ) ) ( not ( = ?auto_482806 ?auto_482812 ) ) ( not ( = ?auto_482806 ?auto_482813 ) ) ( not ( = ?auto_482806 ?auto_482814 ) ) ( not ( = ?auto_482806 ?auto_482815 ) ) ( not ( = ?auto_482807 ?auto_482808 ) ) ( not ( = ?auto_482807 ?auto_482809 ) ) ( not ( = ?auto_482807 ?auto_482810 ) ) ( not ( = ?auto_482807 ?auto_482811 ) ) ( not ( = ?auto_482807 ?auto_482812 ) ) ( not ( = ?auto_482807 ?auto_482813 ) ) ( not ( = ?auto_482807 ?auto_482814 ) ) ( not ( = ?auto_482807 ?auto_482815 ) ) ( not ( = ?auto_482808 ?auto_482809 ) ) ( not ( = ?auto_482808 ?auto_482810 ) ) ( not ( = ?auto_482808 ?auto_482811 ) ) ( not ( = ?auto_482808 ?auto_482812 ) ) ( not ( = ?auto_482808 ?auto_482813 ) ) ( not ( = ?auto_482808 ?auto_482814 ) ) ( not ( = ?auto_482808 ?auto_482815 ) ) ( not ( = ?auto_482809 ?auto_482810 ) ) ( not ( = ?auto_482809 ?auto_482811 ) ) ( not ( = ?auto_482809 ?auto_482812 ) ) ( not ( = ?auto_482809 ?auto_482813 ) ) ( not ( = ?auto_482809 ?auto_482814 ) ) ( not ( = ?auto_482809 ?auto_482815 ) ) ( not ( = ?auto_482810 ?auto_482811 ) ) ( not ( = ?auto_482810 ?auto_482812 ) ) ( not ( = ?auto_482810 ?auto_482813 ) ) ( not ( = ?auto_482810 ?auto_482814 ) ) ( not ( = ?auto_482810 ?auto_482815 ) ) ( not ( = ?auto_482811 ?auto_482812 ) ) ( not ( = ?auto_482811 ?auto_482813 ) ) ( not ( = ?auto_482811 ?auto_482814 ) ) ( not ( = ?auto_482811 ?auto_482815 ) ) ( not ( = ?auto_482812 ?auto_482813 ) ) ( not ( = ?auto_482812 ?auto_482814 ) ) ( not ( = ?auto_482812 ?auto_482815 ) ) ( not ( = ?auto_482813 ?auto_482814 ) ) ( not ( = ?auto_482813 ?auto_482815 ) ) ( not ( = ?auto_482814 ?auto_482815 ) ) ( CLEAR ?auto_482813 ) ( ON ?auto_482814 ?auto_482815 ) ( CLEAR ?auto_482814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_482800 ?auto_482801 ?auto_482802 ?auto_482803 ?auto_482804 ?auto_482805 ?auto_482806 ?auto_482807 ?auto_482808 ?auto_482809 ?auto_482810 ?auto_482811 ?auto_482812 ?auto_482813 ?auto_482814 )
      ( MAKE-16PILE ?auto_482800 ?auto_482801 ?auto_482802 ?auto_482803 ?auto_482804 ?auto_482805 ?auto_482806 ?auto_482807 ?auto_482808 ?auto_482809 ?auto_482810 ?auto_482811 ?auto_482812 ?auto_482813 ?auto_482814 ?auto_482815 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_482832 - BLOCK
      ?auto_482833 - BLOCK
      ?auto_482834 - BLOCK
      ?auto_482835 - BLOCK
      ?auto_482836 - BLOCK
      ?auto_482837 - BLOCK
      ?auto_482838 - BLOCK
      ?auto_482839 - BLOCK
      ?auto_482840 - BLOCK
      ?auto_482841 - BLOCK
      ?auto_482842 - BLOCK
      ?auto_482843 - BLOCK
      ?auto_482844 - BLOCK
      ?auto_482845 - BLOCK
      ?auto_482846 - BLOCK
      ?auto_482847 - BLOCK
    )
    :vars
    (
      ?auto_482848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_482847 ?auto_482848 ) ( ON-TABLE ?auto_482832 ) ( ON ?auto_482833 ?auto_482832 ) ( ON ?auto_482834 ?auto_482833 ) ( ON ?auto_482835 ?auto_482834 ) ( ON ?auto_482836 ?auto_482835 ) ( ON ?auto_482837 ?auto_482836 ) ( ON ?auto_482838 ?auto_482837 ) ( ON ?auto_482839 ?auto_482838 ) ( ON ?auto_482840 ?auto_482839 ) ( ON ?auto_482841 ?auto_482840 ) ( ON ?auto_482842 ?auto_482841 ) ( ON ?auto_482843 ?auto_482842 ) ( ON ?auto_482844 ?auto_482843 ) ( not ( = ?auto_482832 ?auto_482833 ) ) ( not ( = ?auto_482832 ?auto_482834 ) ) ( not ( = ?auto_482832 ?auto_482835 ) ) ( not ( = ?auto_482832 ?auto_482836 ) ) ( not ( = ?auto_482832 ?auto_482837 ) ) ( not ( = ?auto_482832 ?auto_482838 ) ) ( not ( = ?auto_482832 ?auto_482839 ) ) ( not ( = ?auto_482832 ?auto_482840 ) ) ( not ( = ?auto_482832 ?auto_482841 ) ) ( not ( = ?auto_482832 ?auto_482842 ) ) ( not ( = ?auto_482832 ?auto_482843 ) ) ( not ( = ?auto_482832 ?auto_482844 ) ) ( not ( = ?auto_482832 ?auto_482845 ) ) ( not ( = ?auto_482832 ?auto_482846 ) ) ( not ( = ?auto_482832 ?auto_482847 ) ) ( not ( = ?auto_482832 ?auto_482848 ) ) ( not ( = ?auto_482833 ?auto_482834 ) ) ( not ( = ?auto_482833 ?auto_482835 ) ) ( not ( = ?auto_482833 ?auto_482836 ) ) ( not ( = ?auto_482833 ?auto_482837 ) ) ( not ( = ?auto_482833 ?auto_482838 ) ) ( not ( = ?auto_482833 ?auto_482839 ) ) ( not ( = ?auto_482833 ?auto_482840 ) ) ( not ( = ?auto_482833 ?auto_482841 ) ) ( not ( = ?auto_482833 ?auto_482842 ) ) ( not ( = ?auto_482833 ?auto_482843 ) ) ( not ( = ?auto_482833 ?auto_482844 ) ) ( not ( = ?auto_482833 ?auto_482845 ) ) ( not ( = ?auto_482833 ?auto_482846 ) ) ( not ( = ?auto_482833 ?auto_482847 ) ) ( not ( = ?auto_482833 ?auto_482848 ) ) ( not ( = ?auto_482834 ?auto_482835 ) ) ( not ( = ?auto_482834 ?auto_482836 ) ) ( not ( = ?auto_482834 ?auto_482837 ) ) ( not ( = ?auto_482834 ?auto_482838 ) ) ( not ( = ?auto_482834 ?auto_482839 ) ) ( not ( = ?auto_482834 ?auto_482840 ) ) ( not ( = ?auto_482834 ?auto_482841 ) ) ( not ( = ?auto_482834 ?auto_482842 ) ) ( not ( = ?auto_482834 ?auto_482843 ) ) ( not ( = ?auto_482834 ?auto_482844 ) ) ( not ( = ?auto_482834 ?auto_482845 ) ) ( not ( = ?auto_482834 ?auto_482846 ) ) ( not ( = ?auto_482834 ?auto_482847 ) ) ( not ( = ?auto_482834 ?auto_482848 ) ) ( not ( = ?auto_482835 ?auto_482836 ) ) ( not ( = ?auto_482835 ?auto_482837 ) ) ( not ( = ?auto_482835 ?auto_482838 ) ) ( not ( = ?auto_482835 ?auto_482839 ) ) ( not ( = ?auto_482835 ?auto_482840 ) ) ( not ( = ?auto_482835 ?auto_482841 ) ) ( not ( = ?auto_482835 ?auto_482842 ) ) ( not ( = ?auto_482835 ?auto_482843 ) ) ( not ( = ?auto_482835 ?auto_482844 ) ) ( not ( = ?auto_482835 ?auto_482845 ) ) ( not ( = ?auto_482835 ?auto_482846 ) ) ( not ( = ?auto_482835 ?auto_482847 ) ) ( not ( = ?auto_482835 ?auto_482848 ) ) ( not ( = ?auto_482836 ?auto_482837 ) ) ( not ( = ?auto_482836 ?auto_482838 ) ) ( not ( = ?auto_482836 ?auto_482839 ) ) ( not ( = ?auto_482836 ?auto_482840 ) ) ( not ( = ?auto_482836 ?auto_482841 ) ) ( not ( = ?auto_482836 ?auto_482842 ) ) ( not ( = ?auto_482836 ?auto_482843 ) ) ( not ( = ?auto_482836 ?auto_482844 ) ) ( not ( = ?auto_482836 ?auto_482845 ) ) ( not ( = ?auto_482836 ?auto_482846 ) ) ( not ( = ?auto_482836 ?auto_482847 ) ) ( not ( = ?auto_482836 ?auto_482848 ) ) ( not ( = ?auto_482837 ?auto_482838 ) ) ( not ( = ?auto_482837 ?auto_482839 ) ) ( not ( = ?auto_482837 ?auto_482840 ) ) ( not ( = ?auto_482837 ?auto_482841 ) ) ( not ( = ?auto_482837 ?auto_482842 ) ) ( not ( = ?auto_482837 ?auto_482843 ) ) ( not ( = ?auto_482837 ?auto_482844 ) ) ( not ( = ?auto_482837 ?auto_482845 ) ) ( not ( = ?auto_482837 ?auto_482846 ) ) ( not ( = ?auto_482837 ?auto_482847 ) ) ( not ( = ?auto_482837 ?auto_482848 ) ) ( not ( = ?auto_482838 ?auto_482839 ) ) ( not ( = ?auto_482838 ?auto_482840 ) ) ( not ( = ?auto_482838 ?auto_482841 ) ) ( not ( = ?auto_482838 ?auto_482842 ) ) ( not ( = ?auto_482838 ?auto_482843 ) ) ( not ( = ?auto_482838 ?auto_482844 ) ) ( not ( = ?auto_482838 ?auto_482845 ) ) ( not ( = ?auto_482838 ?auto_482846 ) ) ( not ( = ?auto_482838 ?auto_482847 ) ) ( not ( = ?auto_482838 ?auto_482848 ) ) ( not ( = ?auto_482839 ?auto_482840 ) ) ( not ( = ?auto_482839 ?auto_482841 ) ) ( not ( = ?auto_482839 ?auto_482842 ) ) ( not ( = ?auto_482839 ?auto_482843 ) ) ( not ( = ?auto_482839 ?auto_482844 ) ) ( not ( = ?auto_482839 ?auto_482845 ) ) ( not ( = ?auto_482839 ?auto_482846 ) ) ( not ( = ?auto_482839 ?auto_482847 ) ) ( not ( = ?auto_482839 ?auto_482848 ) ) ( not ( = ?auto_482840 ?auto_482841 ) ) ( not ( = ?auto_482840 ?auto_482842 ) ) ( not ( = ?auto_482840 ?auto_482843 ) ) ( not ( = ?auto_482840 ?auto_482844 ) ) ( not ( = ?auto_482840 ?auto_482845 ) ) ( not ( = ?auto_482840 ?auto_482846 ) ) ( not ( = ?auto_482840 ?auto_482847 ) ) ( not ( = ?auto_482840 ?auto_482848 ) ) ( not ( = ?auto_482841 ?auto_482842 ) ) ( not ( = ?auto_482841 ?auto_482843 ) ) ( not ( = ?auto_482841 ?auto_482844 ) ) ( not ( = ?auto_482841 ?auto_482845 ) ) ( not ( = ?auto_482841 ?auto_482846 ) ) ( not ( = ?auto_482841 ?auto_482847 ) ) ( not ( = ?auto_482841 ?auto_482848 ) ) ( not ( = ?auto_482842 ?auto_482843 ) ) ( not ( = ?auto_482842 ?auto_482844 ) ) ( not ( = ?auto_482842 ?auto_482845 ) ) ( not ( = ?auto_482842 ?auto_482846 ) ) ( not ( = ?auto_482842 ?auto_482847 ) ) ( not ( = ?auto_482842 ?auto_482848 ) ) ( not ( = ?auto_482843 ?auto_482844 ) ) ( not ( = ?auto_482843 ?auto_482845 ) ) ( not ( = ?auto_482843 ?auto_482846 ) ) ( not ( = ?auto_482843 ?auto_482847 ) ) ( not ( = ?auto_482843 ?auto_482848 ) ) ( not ( = ?auto_482844 ?auto_482845 ) ) ( not ( = ?auto_482844 ?auto_482846 ) ) ( not ( = ?auto_482844 ?auto_482847 ) ) ( not ( = ?auto_482844 ?auto_482848 ) ) ( not ( = ?auto_482845 ?auto_482846 ) ) ( not ( = ?auto_482845 ?auto_482847 ) ) ( not ( = ?auto_482845 ?auto_482848 ) ) ( not ( = ?auto_482846 ?auto_482847 ) ) ( not ( = ?auto_482846 ?auto_482848 ) ) ( not ( = ?auto_482847 ?auto_482848 ) ) ( ON ?auto_482846 ?auto_482847 ) ( CLEAR ?auto_482844 ) ( ON ?auto_482845 ?auto_482846 ) ( CLEAR ?auto_482845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_482832 ?auto_482833 ?auto_482834 ?auto_482835 ?auto_482836 ?auto_482837 ?auto_482838 ?auto_482839 ?auto_482840 ?auto_482841 ?auto_482842 ?auto_482843 ?auto_482844 ?auto_482845 )
      ( MAKE-16PILE ?auto_482832 ?auto_482833 ?auto_482834 ?auto_482835 ?auto_482836 ?auto_482837 ?auto_482838 ?auto_482839 ?auto_482840 ?auto_482841 ?auto_482842 ?auto_482843 ?auto_482844 ?auto_482845 ?auto_482846 ?auto_482847 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_482865 - BLOCK
      ?auto_482866 - BLOCK
      ?auto_482867 - BLOCK
      ?auto_482868 - BLOCK
      ?auto_482869 - BLOCK
      ?auto_482870 - BLOCK
      ?auto_482871 - BLOCK
      ?auto_482872 - BLOCK
      ?auto_482873 - BLOCK
      ?auto_482874 - BLOCK
      ?auto_482875 - BLOCK
      ?auto_482876 - BLOCK
      ?auto_482877 - BLOCK
      ?auto_482878 - BLOCK
      ?auto_482879 - BLOCK
      ?auto_482880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_482880 ) ( ON-TABLE ?auto_482865 ) ( ON ?auto_482866 ?auto_482865 ) ( ON ?auto_482867 ?auto_482866 ) ( ON ?auto_482868 ?auto_482867 ) ( ON ?auto_482869 ?auto_482868 ) ( ON ?auto_482870 ?auto_482869 ) ( ON ?auto_482871 ?auto_482870 ) ( ON ?auto_482872 ?auto_482871 ) ( ON ?auto_482873 ?auto_482872 ) ( ON ?auto_482874 ?auto_482873 ) ( ON ?auto_482875 ?auto_482874 ) ( ON ?auto_482876 ?auto_482875 ) ( ON ?auto_482877 ?auto_482876 ) ( not ( = ?auto_482865 ?auto_482866 ) ) ( not ( = ?auto_482865 ?auto_482867 ) ) ( not ( = ?auto_482865 ?auto_482868 ) ) ( not ( = ?auto_482865 ?auto_482869 ) ) ( not ( = ?auto_482865 ?auto_482870 ) ) ( not ( = ?auto_482865 ?auto_482871 ) ) ( not ( = ?auto_482865 ?auto_482872 ) ) ( not ( = ?auto_482865 ?auto_482873 ) ) ( not ( = ?auto_482865 ?auto_482874 ) ) ( not ( = ?auto_482865 ?auto_482875 ) ) ( not ( = ?auto_482865 ?auto_482876 ) ) ( not ( = ?auto_482865 ?auto_482877 ) ) ( not ( = ?auto_482865 ?auto_482878 ) ) ( not ( = ?auto_482865 ?auto_482879 ) ) ( not ( = ?auto_482865 ?auto_482880 ) ) ( not ( = ?auto_482866 ?auto_482867 ) ) ( not ( = ?auto_482866 ?auto_482868 ) ) ( not ( = ?auto_482866 ?auto_482869 ) ) ( not ( = ?auto_482866 ?auto_482870 ) ) ( not ( = ?auto_482866 ?auto_482871 ) ) ( not ( = ?auto_482866 ?auto_482872 ) ) ( not ( = ?auto_482866 ?auto_482873 ) ) ( not ( = ?auto_482866 ?auto_482874 ) ) ( not ( = ?auto_482866 ?auto_482875 ) ) ( not ( = ?auto_482866 ?auto_482876 ) ) ( not ( = ?auto_482866 ?auto_482877 ) ) ( not ( = ?auto_482866 ?auto_482878 ) ) ( not ( = ?auto_482866 ?auto_482879 ) ) ( not ( = ?auto_482866 ?auto_482880 ) ) ( not ( = ?auto_482867 ?auto_482868 ) ) ( not ( = ?auto_482867 ?auto_482869 ) ) ( not ( = ?auto_482867 ?auto_482870 ) ) ( not ( = ?auto_482867 ?auto_482871 ) ) ( not ( = ?auto_482867 ?auto_482872 ) ) ( not ( = ?auto_482867 ?auto_482873 ) ) ( not ( = ?auto_482867 ?auto_482874 ) ) ( not ( = ?auto_482867 ?auto_482875 ) ) ( not ( = ?auto_482867 ?auto_482876 ) ) ( not ( = ?auto_482867 ?auto_482877 ) ) ( not ( = ?auto_482867 ?auto_482878 ) ) ( not ( = ?auto_482867 ?auto_482879 ) ) ( not ( = ?auto_482867 ?auto_482880 ) ) ( not ( = ?auto_482868 ?auto_482869 ) ) ( not ( = ?auto_482868 ?auto_482870 ) ) ( not ( = ?auto_482868 ?auto_482871 ) ) ( not ( = ?auto_482868 ?auto_482872 ) ) ( not ( = ?auto_482868 ?auto_482873 ) ) ( not ( = ?auto_482868 ?auto_482874 ) ) ( not ( = ?auto_482868 ?auto_482875 ) ) ( not ( = ?auto_482868 ?auto_482876 ) ) ( not ( = ?auto_482868 ?auto_482877 ) ) ( not ( = ?auto_482868 ?auto_482878 ) ) ( not ( = ?auto_482868 ?auto_482879 ) ) ( not ( = ?auto_482868 ?auto_482880 ) ) ( not ( = ?auto_482869 ?auto_482870 ) ) ( not ( = ?auto_482869 ?auto_482871 ) ) ( not ( = ?auto_482869 ?auto_482872 ) ) ( not ( = ?auto_482869 ?auto_482873 ) ) ( not ( = ?auto_482869 ?auto_482874 ) ) ( not ( = ?auto_482869 ?auto_482875 ) ) ( not ( = ?auto_482869 ?auto_482876 ) ) ( not ( = ?auto_482869 ?auto_482877 ) ) ( not ( = ?auto_482869 ?auto_482878 ) ) ( not ( = ?auto_482869 ?auto_482879 ) ) ( not ( = ?auto_482869 ?auto_482880 ) ) ( not ( = ?auto_482870 ?auto_482871 ) ) ( not ( = ?auto_482870 ?auto_482872 ) ) ( not ( = ?auto_482870 ?auto_482873 ) ) ( not ( = ?auto_482870 ?auto_482874 ) ) ( not ( = ?auto_482870 ?auto_482875 ) ) ( not ( = ?auto_482870 ?auto_482876 ) ) ( not ( = ?auto_482870 ?auto_482877 ) ) ( not ( = ?auto_482870 ?auto_482878 ) ) ( not ( = ?auto_482870 ?auto_482879 ) ) ( not ( = ?auto_482870 ?auto_482880 ) ) ( not ( = ?auto_482871 ?auto_482872 ) ) ( not ( = ?auto_482871 ?auto_482873 ) ) ( not ( = ?auto_482871 ?auto_482874 ) ) ( not ( = ?auto_482871 ?auto_482875 ) ) ( not ( = ?auto_482871 ?auto_482876 ) ) ( not ( = ?auto_482871 ?auto_482877 ) ) ( not ( = ?auto_482871 ?auto_482878 ) ) ( not ( = ?auto_482871 ?auto_482879 ) ) ( not ( = ?auto_482871 ?auto_482880 ) ) ( not ( = ?auto_482872 ?auto_482873 ) ) ( not ( = ?auto_482872 ?auto_482874 ) ) ( not ( = ?auto_482872 ?auto_482875 ) ) ( not ( = ?auto_482872 ?auto_482876 ) ) ( not ( = ?auto_482872 ?auto_482877 ) ) ( not ( = ?auto_482872 ?auto_482878 ) ) ( not ( = ?auto_482872 ?auto_482879 ) ) ( not ( = ?auto_482872 ?auto_482880 ) ) ( not ( = ?auto_482873 ?auto_482874 ) ) ( not ( = ?auto_482873 ?auto_482875 ) ) ( not ( = ?auto_482873 ?auto_482876 ) ) ( not ( = ?auto_482873 ?auto_482877 ) ) ( not ( = ?auto_482873 ?auto_482878 ) ) ( not ( = ?auto_482873 ?auto_482879 ) ) ( not ( = ?auto_482873 ?auto_482880 ) ) ( not ( = ?auto_482874 ?auto_482875 ) ) ( not ( = ?auto_482874 ?auto_482876 ) ) ( not ( = ?auto_482874 ?auto_482877 ) ) ( not ( = ?auto_482874 ?auto_482878 ) ) ( not ( = ?auto_482874 ?auto_482879 ) ) ( not ( = ?auto_482874 ?auto_482880 ) ) ( not ( = ?auto_482875 ?auto_482876 ) ) ( not ( = ?auto_482875 ?auto_482877 ) ) ( not ( = ?auto_482875 ?auto_482878 ) ) ( not ( = ?auto_482875 ?auto_482879 ) ) ( not ( = ?auto_482875 ?auto_482880 ) ) ( not ( = ?auto_482876 ?auto_482877 ) ) ( not ( = ?auto_482876 ?auto_482878 ) ) ( not ( = ?auto_482876 ?auto_482879 ) ) ( not ( = ?auto_482876 ?auto_482880 ) ) ( not ( = ?auto_482877 ?auto_482878 ) ) ( not ( = ?auto_482877 ?auto_482879 ) ) ( not ( = ?auto_482877 ?auto_482880 ) ) ( not ( = ?auto_482878 ?auto_482879 ) ) ( not ( = ?auto_482878 ?auto_482880 ) ) ( not ( = ?auto_482879 ?auto_482880 ) ) ( ON ?auto_482879 ?auto_482880 ) ( CLEAR ?auto_482877 ) ( ON ?auto_482878 ?auto_482879 ) ( CLEAR ?auto_482878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_482865 ?auto_482866 ?auto_482867 ?auto_482868 ?auto_482869 ?auto_482870 ?auto_482871 ?auto_482872 ?auto_482873 ?auto_482874 ?auto_482875 ?auto_482876 ?auto_482877 ?auto_482878 )
      ( MAKE-16PILE ?auto_482865 ?auto_482866 ?auto_482867 ?auto_482868 ?auto_482869 ?auto_482870 ?auto_482871 ?auto_482872 ?auto_482873 ?auto_482874 ?auto_482875 ?auto_482876 ?auto_482877 ?auto_482878 ?auto_482879 ?auto_482880 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_482897 - BLOCK
      ?auto_482898 - BLOCK
      ?auto_482899 - BLOCK
      ?auto_482900 - BLOCK
      ?auto_482901 - BLOCK
      ?auto_482902 - BLOCK
      ?auto_482903 - BLOCK
      ?auto_482904 - BLOCK
      ?auto_482905 - BLOCK
      ?auto_482906 - BLOCK
      ?auto_482907 - BLOCK
      ?auto_482908 - BLOCK
      ?auto_482909 - BLOCK
      ?auto_482910 - BLOCK
      ?auto_482911 - BLOCK
      ?auto_482912 - BLOCK
    )
    :vars
    (
      ?auto_482913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_482912 ?auto_482913 ) ( ON-TABLE ?auto_482897 ) ( ON ?auto_482898 ?auto_482897 ) ( ON ?auto_482899 ?auto_482898 ) ( ON ?auto_482900 ?auto_482899 ) ( ON ?auto_482901 ?auto_482900 ) ( ON ?auto_482902 ?auto_482901 ) ( ON ?auto_482903 ?auto_482902 ) ( ON ?auto_482904 ?auto_482903 ) ( ON ?auto_482905 ?auto_482904 ) ( ON ?auto_482906 ?auto_482905 ) ( ON ?auto_482907 ?auto_482906 ) ( ON ?auto_482908 ?auto_482907 ) ( not ( = ?auto_482897 ?auto_482898 ) ) ( not ( = ?auto_482897 ?auto_482899 ) ) ( not ( = ?auto_482897 ?auto_482900 ) ) ( not ( = ?auto_482897 ?auto_482901 ) ) ( not ( = ?auto_482897 ?auto_482902 ) ) ( not ( = ?auto_482897 ?auto_482903 ) ) ( not ( = ?auto_482897 ?auto_482904 ) ) ( not ( = ?auto_482897 ?auto_482905 ) ) ( not ( = ?auto_482897 ?auto_482906 ) ) ( not ( = ?auto_482897 ?auto_482907 ) ) ( not ( = ?auto_482897 ?auto_482908 ) ) ( not ( = ?auto_482897 ?auto_482909 ) ) ( not ( = ?auto_482897 ?auto_482910 ) ) ( not ( = ?auto_482897 ?auto_482911 ) ) ( not ( = ?auto_482897 ?auto_482912 ) ) ( not ( = ?auto_482897 ?auto_482913 ) ) ( not ( = ?auto_482898 ?auto_482899 ) ) ( not ( = ?auto_482898 ?auto_482900 ) ) ( not ( = ?auto_482898 ?auto_482901 ) ) ( not ( = ?auto_482898 ?auto_482902 ) ) ( not ( = ?auto_482898 ?auto_482903 ) ) ( not ( = ?auto_482898 ?auto_482904 ) ) ( not ( = ?auto_482898 ?auto_482905 ) ) ( not ( = ?auto_482898 ?auto_482906 ) ) ( not ( = ?auto_482898 ?auto_482907 ) ) ( not ( = ?auto_482898 ?auto_482908 ) ) ( not ( = ?auto_482898 ?auto_482909 ) ) ( not ( = ?auto_482898 ?auto_482910 ) ) ( not ( = ?auto_482898 ?auto_482911 ) ) ( not ( = ?auto_482898 ?auto_482912 ) ) ( not ( = ?auto_482898 ?auto_482913 ) ) ( not ( = ?auto_482899 ?auto_482900 ) ) ( not ( = ?auto_482899 ?auto_482901 ) ) ( not ( = ?auto_482899 ?auto_482902 ) ) ( not ( = ?auto_482899 ?auto_482903 ) ) ( not ( = ?auto_482899 ?auto_482904 ) ) ( not ( = ?auto_482899 ?auto_482905 ) ) ( not ( = ?auto_482899 ?auto_482906 ) ) ( not ( = ?auto_482899 ?auto_482907 ) ) ( not ( = ?auto_482899 ?auto_482908 ) ) ( not ( = ?auto_482899 ?auto_482909 ) ) ( not ( = ?auto_482899 ?auto_482910 ) ) ( not ( = ?auto_482899 ?auto_482911 ) ) ( not ( = ?auto_482899 ?auto_482912 ) ) ( not ( = ?auto_482899 ?auto_482913 ) ) ( not ( = ?auto_482900 ?auto_482901 ) ) ( not ( = ?auto_482900 ?auto_482902 ) ) ( not ( = ?auto_482900 ?auto_482903 ) ) ( not ( = ?auto_482900 ?auto_482904 ) ) ( not ( = ?auto_482900 ?auto_482905 ) ) ( not ( = ?auto_482900 ?auto_482906 ) ) ( not ( = ?auto_482900 ?auto_482907 ) ) ( not ( = ?auto_482900 ?auto_482908 ) ) ( not ( = ?auto_482900 ?auto_482909 ) ) ( not ( = ?auto_482900 ?auto_482910 ) ) ( not ( = ?auto_482900 ?auto_482911 ) ) ( not ( = ?auto_482900 ?auto_482912 ) ) ( not ( = ?auto_482900 ?auto_482913 ) ) ( not ( = ?auto_482901 ?auto_482902 ) ) ( not ( = ?auto_482901 ?auto_482903 ) ) ( not ( = ?auto_482901 ?auto_482904 ) ) ( not ( = ?auto_482901 ?auto_482905 ) ) ( not ( = ?auto_482901 ?auto_482906 ) ) ( not ( = ?auto_482901 ?auto_482907 ) ) ( not ( = ?auto_482901 ?auto_482908 ) ) ( not ( = ?auto_482901 ?auto_482909 ) ) ( not ( = ?auto_482901 ?auto_482910 ) ) ( not ( = ?auto_482901 ?auto_482911 ) ) ( not ( = ?auto_482901 ?auto_482912 ) ) ( not ( = ?auto_482901 ?auto_482913 ) ) ( not ( = ?auto_482902 ?auto_482903 ) ) ( not ( = ?auto_482902 ?auto_482904 ) ) ( not ( = ?auto_482902 ?auto_482905 ) ) ( not ( = ?auto_482902 ?auto_482906 ) ) ( not ( = ?auto_482902 ?auto_482907 ) ) ( not ( = ?auto_482902 ?auto_482908 ) ) ( not ( = ?auto_482902 ?auto_482909 ) ) ( not ( = ?auto_482902 ?auto_482910 ) ) ( not ( = ?auto_482902 ?auto_482911 ) ) ( not ( = ?auto_482902 ?auto_482912 ) ) ( not ( = ?auto_482902 ?auto_482913 ) ) ( not ( = ?auto_482903 ?auto_482904 ) ) ( not ( = ?auto_482903 ?auto_482905 ) ) ( not ( = ?auto_482903 ?auto_482906 ) ) ( not ( = ?auto_482903 ?auto_482907 ) ) ( not ( = ?auto_482903 ?auto_482908 ) ) ( not ( = ?auto_482903 ?auto_482909 ) ) ( not ( = ?auto_482903 ?auto_482910 ) ) ( not ( = ?auto_482903 ?auto_482911 ) ) ( not ( = ?auto_482903 ?auto_482912 ) ) ( not ( = ?auto_482903 ?auto_482913 ) ) ( not ( = ?auto_482904 ?auto_482905 ) ) ( not ( = ?auto_482904 ?auto_482906 ) ) ( not ( = ?auto_482904 ?auto_482907 ) ) ( not ( = ?auto_482904 ?auto_482908 ) ) ( not ( = ?auto_482904 ?auto_482909 ) ) ( not ( = ?auto_482904 ?auto_482910 ) ) ( not ( = ?auto_482904 ?auto_482911 ) ) ( not ( = ?auto_482904 ?auto_482912 ) ) ( not ( = ?auto_482904 ?auto_482913 ) ) ( not ( = ?auto_482905 ?auto_482906 ) ) ( not ( = ?auto_482905 ?auto_482907 ) ) ( not ( = ?auto_482905 ?auto_482908 ) ) ( not ( = ?auto_482905 ?auto_482909 ) ) ( not ( = ?auto_482905 ?auto_482910 ) ) ( not ( = ?auto_482905 ?auto_482911 ) ) ( not ( = ?auto_482905 ?auto_482912 ) ) ( not ( = ?auto_482905 ?auto_482913 ) ) ( not ( = ?auto_482906 ?auto_482907 ) ) ( not ( = ?auto_482906 ?auto_482908 ) ) ( not ( = ?auto_482906 ?auto_482909 ) ) ( not ( = ?auto_482906 ?auto_482910 ) ) ( not ( = ?auto_482906 ?auto_482911 ) ) ( not ( = ?auto_482906 ?auto_482912 ) ) ( not ( = ?auto_482906 ?auto_482913 ) ) ( not ( = ?auto_482907 ?auto_482908 ) ) ( not ( = ?auto_482907 ?auto_482909 ) ) ( not ( = ?auto_482907 ?auto_482910 ) ) ( not ( = ?auto_482907 ?auto_482911 ) ) ( not ( = ?auto_482907 ?auto_482912 ) ) ( not ( = ?auto_482907 ?auto_482913 ) ) ( not ( = ?auto_482908 ?auto_482909 ) ) ( not ( = ?auto_482908 ?auto_482910 ) ) ( not ( = ?auto_482908 ?auto_482911 ) ) ( not ( = ?auto_482908 ?auto_482912 ) ) ( not ( = ?auto_482908 ?auto_482913 ) ) ( not ( = ?auto_482909 ?auto_482910 ) ) ( not ( = ?auto_482909 ?auto_482911 ) ) ( not ( = ?auto_482909 ?auto_482912 ) ) ( not ( = ?auto_482909 ?auto_482913 ) ) ( not ( = ?auto_482910 ?auto_482911 ) ) ( not ( = ?auto_482910 ?auto_482912 ) ) ( not ( = ?auto_482910 ?auto_482913 ) ) ( not ( = ?auto_482911 ?auto_482912 ) ) ( not ( = ?auto_482911 ?auto_482913 ) ) ( not ( = ?auto_482912 ?auto_482913 ) ) ( ON ?auto_482911 ?auto_482912 ) ( ON ?auto_482910 ?auto_482911 ) ( CLEAR ?auto_482908 ) ( ON ?auto_482909 ?auto_482910 ) ( CLEAR ?auto_482909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_482897 ?auto_482898 ?auto_482899 ?auto_482900 ?auto_482901 ?auto_482902 ?auto_482903 ?auto_482904 ?auto_482905 ?auto_482906 ?auto_482907 ?auto_482908 ?auto_482909 )
      ( MAKE-16PILE ?auto_482897 ?auto_482898 ?auto_482899 ?auto_482900 ?auto_482901 ?auto_482902 ?auto_482903 ?auto_482904 ?auto_482905 ?auto_482906 ?auto_482907 ?auto_482908 ?auto_482909 ?auto_482910 ?auto_482911 ?auto_482912 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_482930 - BLOCK
      ?auto_482931 - BLOCK
      ?auto_482932 - BLOCK
      ?auto_482933 - BLOCK
      ?auto_482934 - BLOCK
      ?auto_482935 - BLOCK
      ?auto_482936 - BLOCK
      ?auto_482937 - BLOCK
      ?auto_482938 - BLOCK
      ?auto_482939 - BLOCK
      ?auto_482940 - BLOCK
      ?auto_482941 - BLOCK
      ?auto_482942 - BLOCK
      ?auto_482943 - BLOCK
      ?auto_482944 - BLOCK
      ?auto_482945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_482945 ) ( ON-TABLE ?auto_482930 ) ( ON ?auto_482931 ?auto_482930 ) ( ON ?auto_482932 ?auto_482931 ) ( ON ?auto_482933 ?auto_482932 ) ( ON ?auto_482934 ?auto_482933 ) ( ON ?auto_482935 ?auto_482934 ) ( ON ?auto_482936 ?auto_482935 ) ( ON ?auto_482937 ?auto_482936 ) ( ON ?auto_482938 ?auto_482937 ) ( ON ?auto_482939 ?auto_482938 ) ( ON ?auto_482940 ?auto_482939 ) ( ON ?auto_482941 ?auto_482940 ) ( not ( = ?auto_482930 ?auto_482931 ) ) ( not ( = ?auto_482930 ?auto_482932 ) ) ( not ( = ?auto_482930 ?auto_482933 ) ) ( not ( = ?auto_482930 ?auto_482934 ) ) ( not ( = ?auto_482930 ?auto_482935 ) ) ( not ( = ?auto_482930 ?auto_482936 ) ) ( not ( = ?auto_482930 ?auto_482937 ) ) ( not ( = ?auto_482930 ?auto_482938 ) ) ( not ( = ?auto_482930 ?auto_482939 ) ) ( not ( = ?auto_482930 ?auto_482940 ) ) ( not ( = ?auto_482930 ?auto_482941 ) ) ( not ( = ?auto_482930 ?auto_482942 ) ) ( not ( = ?auto_482930 ?auto_482943 ) ) ( not ( = ?auto_482930 ?auto_482944 ) ) ( not ( = ?auto_482930 ?auto_482945 ) ) ( not ( = ?auto_482931 ?auto_482932 ) ) ( not ( = ?auto_482931 ?auto_482933 ) ) ( not ( = ?auto_482931 ?auto_482934 ) ) ( not ( = ?auto_482931 ?auto_482935 ) ) ( not ( = ?auto_482931 ?auto_482936 ) ) ( not ( = ?auto_482931 ?auto_482937 ) ) ( not ( = ?auto_482931 ?auto_482938 ) ) ( not ( = ?auto_482931 ?auto_482939 ) ) ( not ( = ?auto_482931 ?auto_482940 ) ) ( not ( = ?auto_482931 ?auto_482941 ) ) ( not ( = ?auto_482931 ?auto_482942 ) ) ( not ( = ?auto_482931 ?auto_482943 ) ) ( not ( = ?auto_482931 ?auto_482944 ) ) ( not ( = ?auto_482931 ?auto_482945 ) ) ( not ( = ?auto_482932 ?auto_482933 ) ) ( not ( = ?auto_482932 ?auto_482934 ) ) ( not ( = ?auto_482932 ?auto_482935 ) ) ( not ( = ?auto_482932 ?auto_482936 ) ) ( not ( = ?auto_482932 ?auto_482937 ) ) ( not ( = ?auto_482932 ?auto_482938 ) ) ( not ( = ?auto_482932 ?auto_482939 ) ) ( not ( = ?auto_482932 ?auto_482940 ) ) ( not ( = ?auto_482932 ?auto_482941 ) ) ( not ( = ?auto_482932 ?auto_482942 ) ) ( not ( = ?auto_482932 ?auto_482943 ) ) ( not ( = ?auto_482932 ?auto_482944 ) ) ( not ( = ?auto_482932 ?auto_482945 ) ) ( not ( = ?auto_482933 ?auto_482934 ) ) ( not ( = ?auto_482933 ?auto_482935 ) ) ( not ( = ?auto_482933 ?auto_482936 ) ) ( not ( = ?auto_482933 ?auto_482937 ) ) ( not ( = ?auto_482933 ?auto_482938 ) ) ( not ( = ?auto_482933 ?auto_482939 ) ) ( not ( = ?auto_482933 ?auto_482940 ) ) ( not ( = ?auto_482933 ?auto_482941 ) ) ( not ( = ?auto_482933 ?auto_482942 ) ) ( not ( = ?auto_482933 ?auto_482943 ) ) ( not ( = ?auto_482933 ?auto_482944 ) ) ( not ( = ?auto_482933 ?auto_482945 ) ) ( not ( = ?auto_482934 ?auto_482935 ) ) ( not ( = ?auto_482934 ?auto_482936 ) ) ( not ( = ?auto_482934 ?auto_482937 ) ) ( not ( = ?auto_482934 ?auto_482938 ) ) ( not ( = ?auto_482934 ?auto_482939 ) ) ( not ( = ?auto_482934 ?auto_482940 ) ) ( not ( = ?auto_482934 ?auto_482941 ) ) ( not ( = ?auto_482934 ?auto_482942 ) ) ( not ( = ?auto_482934 ?auto_482943 ) ) ( not ( = ?auto_482934 ?auto_482944 ) ) ( not ( = ?auto_482934 ?auto_482945 ) ) ( not ( = ?auto_482935 ?auto_482936 ) ) ( not ( = ?auto_482935 ?auto_482937 ) ) ( not ( = ?auto_482935 ?auto_482938 ) ) ( not ( = ?auto_482935 ?auto_482939 ) ) ( not ( = ?auto_482935 ?auto_482940 ) ) ( not ( = ?auto_482935 ?auto_482941 ) ) ( not ( = ?auto_482935 ?auto_482942 ) ) ( not ( = ?auto_482935 ?auto_482943 ) ) ( not ( = ?auto_482935 ?auto_482944 ) ) ( not ( = ?auto_482935 ?auto_482945 ) ) ( not ( = ?auto_482936 ?auto_482937 ) ) ( not ( = ?auto_482936 ?auto_482938 ) ) ( not ( = ?auto_482936 ?auto_482939 ) ) ( not ( = ?auto_482936 ?auto_482940 ) ) ( not ( = ?auto_482936 ?auto_482941 ) ) ( not ( = ?auto_482936 ?auto_482942 ) ) ( not ( = ?auto_482936 ?auto_482943 ) ) ( not ( = ?auto_482936 ?auto_482944 ) ) ( not ( = ?auto_482936 ?auto_482945 ) ) ( not ( = ?auto_482937 ?auto_482938 ) ) ( not ( = ?auto_482937 ?auto_482939 ) ) ( not ( = ?auto_482937 ?auto_482940 ) ) ( not ( = ?auto_482937 ?auto_482941 ) ) ( not ( = ?auto_482937 ?auto_482942 ) ) ( not ( = ?auto_482937 ?auto_482943 ) ) ( not ( = ?auto_482937 ?auto_482944 ) ) ( not ( = ?auto_482937 ?auto_482945 ) ) ( not ( = ?auto_482938 ?auto_482939 ) ) ( not ( = ?auto_482938 ?auto_482940 ) ) ( not ( = ?auto_482938 ?auto_482941 ) ) ( not ( = ?auto_482938 ?auto_482942 ) ) ( not ( = ?auto_482938 ?auto_482943 ) ) ( not ( = ?auto_482938 ?auto_482944 ) ) ( not ( = ?auto_482938 ?auto_482945 ) ) ( not ( = ?auto_482939 ?auto_482940 ) ) ( not ( = ?auto_482939 ?auto_482941 ) ) ( not ( = ?auto_482939 ?auto_482942 ) ) ( not ( = ?auto_482939 ?auto_482943 ) ) ( not ( = ?auto_482939 ?auto_482944 ) ) ( not ( = ?auto_482939 ?auto_482945 ) ) ( not ( = ?auto_482940 ?auto_482941 ) ) ( not ( = ?auto_482940 ?auto_482942 ) ) ( not ( = ?auto_482940 ?auto_482943 ) ) ( not ( = ?auto_482940 ?auto_482944 ) ) ( not ( = ?auto_482940 ?auto_482945 ) ) ( not ( = ?auto_482941 ?auto_482942 ) ) ( not ( = ?auto_482941 ?auto_482943 ) ) ( not ( = ?auto_482941 ?auto_482944 ) ) ( not ( = ?auto_482941 ?auto_482945 ) ) ( not ( = ?auto_482942 ?auto_482943 ) ) ( not ( = ?auto_482942 ?auto_482944 ) ) ( not ( = ?auto_482942 ?auto_482945 ) ) ( not ( = ?auto_482943 ?auto_482944 ) ) ( not ( = ?auto_482943 ?auto_482945 ) ) ( not ( = ?auto_482944 ?auto_482945 ) ) ( ON ?auto_482944 ?auto_482945 ) ( ON ?auto_482943 ?auto_482944 ) ( CLEAR ?auto_482941 ) ( ON ?auto_482942 ?auto_482943 ) ( CLEAR ?auto_482942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_482930 ?auto_482931 ?auto_482932 ?auto_482933 ?auto_482934 ?auto_482935 ?auto_482936 ?auto_482937 ?auto_482938 ?auto_482939 ?auto_482940 ?auto_482941 ?auto_482942 )
      ( MAKE-16PILE ?auto_482930 ?auto_482931 ?auto_482932 ?auto_482933 ?auto_482934 ?auto_482935 ?auto_482936 ?auto_482937 ?auto_482938 ?auto_482939 ?auto_482940 ?auto_482941 ?auto_482942 ?auto_482943 ?auto_482944 ?auto_482945 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_482962 - BLOCK
      ?auto_482963 - BLOCK
      ?auto_482964 - BLOCK
      ?auto_482965 - BLOCK
      ?auto_482966 - BLOCK
      ?auto_482967 - BLOCK
      ?auto_482968 - BLOCK
      ?auto_482969 - BLOCK
      ?auto_482970 - BLOCK
      ?auto_482971 - BLOCK
      ?auto_482972 - BLOCK
      ?auto_482973 - BLOCK
      ?auto_482974 - BLOCK
      ?auto_482975 - BLOCK
      ?auto_482976 - BLOCK
      ?auto_482977 - BLOCK
    )
    :vars
    (
      ?auto_482978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_482977 ?auto_482978 ) ( ON-TABLE ?auto_482962 ) ( ON ?auto_482963 ?auto_482962 ) ( ON ?auto_482964 ?auto_482963 ) ( ON ?auto_482965 ?auto_482964 ) ( ON ?auto_482966 ?auto_482965 ) ( ON ?auto_482967 ?auto_482966 ) ( ON ?auto_482968 ?auto_482967 ) ( ON ?auto_482969 ?auto_482968 ) ( ON ?auto_482970 ?auto_482969 ) ( ON ?auto_482971 ?auto_482970 ) ( ON ?auto_482972 ?auto_482971 ) ( not ( = ?auto_482962 ?auto_482963 ) ) ( not ( = ?auto_482962 ?auto_482964 ) ) ( not ( = ?auto_482962 ?auto_482965 ) ) ( not ( = ?auto_482962 ?auto_482966 ) ) ( not ( = ?auto_482962 ?auto_482967 ) ) ( not ( = ?auto_482962 ?auto_482968 ) ) ( not ( = ?auto_482962 ?auto_482969 ) ) ( not ( = ?auto_482962 ?auto_482970 ) ) ( not ( = ?auto_482962 ?auto_482971 ) ) ( not ( = ?auto_482962 ?auto_482972 ) ) ( not ( = ?auto_482962 ?auto_482973 ) ) ( not ( = ?auto_482962 ?auto_482974 ) ) ( not ( = ?auto_482962 ?auto_482975 ) ) ( not ( = ?auto_482962 ?auto_482976 ) ) ( not ( = ?auto_482962 ?auto_482977 ) ) ( not ( = ?auto_482962 ?auto_482978 ) ) ( not ( = ?auto_482963 ?auto_482964 ) ) ( not ( = ?auto_482963 ?auto_482965 ) ) ( not ( = ?auto_482963 ?auto_482966 ) ) ( not ( = ?auto_482963 ?auto_482967 ) ) ( not ( = ?auto_482963 ?auto_482968 ) ) ( not ( = ?auto_482963 ?auto_482969 ) ) ( not ( = ?auto_482963 ?auto_482970 ) ) ( not ( = ?auto_482963 ?auto_482971 ) ) ( not ( = ?auto_482963 ?auto_482972 ) ) ( not ( = ?auto_482963 ?auto_482973 ) ) ( not ( = ?auto_482963 ?auto_482974 ) ) ( not ( = ?auto_482963 ?auto_482975 ) ) ( not ( = ?auto_482963 ?auto_482976 ) ) ( not ( = ?auto_482963 ?auto_482977 ) ) ( not ( = ?auto_482963 ?auto_482978 ) ) ( not ( = ?auto_482964 ?auto_482965 ) ) ( not ( = ?auto_482964 ?auto_482966 ) ) ( not ( = ?auto_482964 ?auto_482967 ) ) ( not ( = ?auto_482964 ?auto_482968 ) ) ( not ( = ?auto_482964 ?auto_482969 ) ) ( not ( = ?auto_482964 ?auto_482970 ) ) ( not ( = ?auto_482964 ?auto_482971 ) ) ( not ( = ?auto_482964 ?auto_482972 ) ) ( not ( = ?auto_482964 ?auto_482973 ) ) ( not ( = ?auto_482964 ?auto_482974 ) ) ( not ( = ?auto_482964 ?auto_482975 ) ) ( not ( = ?auto_482964 ?auto_482976 ) ) ( not ( = ?auto_482964 ?auto_482977 ) ) ( not ( = ?auto_482964 ?auto_482978 ) ) ( not ( = ?auto_482965 ?auto_482966 ) ) ( not ( = ?auto_482965 ?auto_482967 ) ) ( not ( = ?auto_482965 ?auto_482968 ) ) ( not ( = ?auto_482965 ?auto_482969 ) ) ( not ( = ?auto_482965 ?auto_482970 ) ) ( not ( = ?auto_482965 ?auto_482971 ) ) ( not ( = ?auto_482965 ?auto_482972 ) ) ( not ( = ?auto_482965 ?auto_482973 ) ) ( not ( = ?auto_482965 ?auto_482974 ) ) ( not ( = ?auto_482965 ?auto_482975 ) ) ( not ( = ?auto_482965 ?auto_482976 ) ) ( not ( = ?auto_482965 ?auto_482977 ) ) ( not ( = ?auto_482965 ?auto_482978 ) ) ( not ( = ?auto_482966 ?auto_482967 ) ) ( not ( = ?auto_482966 ?auto_482968 ) ) ( not ( = ?auto_482966 ?auto_482969 ) ) ( not ( = ?auto_482966 ?auto_482970 ) ) ( not ( = ?auto_482966 ?auto_482971 ) ) ( not ( = ?auto_482966 ?auto_482972 ) ) ( not ( = ?auto_482966 ?auto_482973 ) ) ( not ( = ?auto_482966 ?auto_482974 ) ) ( not ( = ?auto_482966 ?auto_482975 ) ) ( not ( = ?auto_482966 ?auto_482976 ) ) ( not ( = ?auto_482966 ?auto_482977 ) ) ( not ( = ?auto_482966 ?auto_482978 ) ) ( not ( = ?auto_482967 ?auto_482968 ) ) ( not ( = ?auto_482967 ?auto_482969 ) ) ( not ( = ?auto_482967 ?auto_482970 ) ) ( not ( = ?auto_482967 ?auto_482971 ) ) ( not ( = ?auto_482967 ?auto_482972 ) ) ( not ( = ?auto_482967 ?auto_482973 ) ) ( not ( = ?auto_482967 ?auto_482974 ) ) ( not ( = ?auto_482967 ?auto_482975 ) ) ( not ( = ?auto_482967 ?auto_482976 ) ) ( not ( = ?auto_482967 ?auto_482977 ) ) ( not ( = ?auto_482967 ?auto_482978 ) ) ( not ( = ?auto_482968 ?auto_482969 ) ) ( not ( = ?auto_482968 ?auto_482970 ) ) ( not ( = ?auto_482968 ?auto_482971 ) ) ( not ( = ?auto_482968 ?auto_482972 ) ) ( not ( = ?auto_482968 ?auto_482973 ) ) ( not ( = ?auto_482968 ?auto_482974 ) ) ( not ( = ?auto_482968 ?auto_482975 ) ) ( not ( = ?auto_482968 ?auto_482976 ) ) ( not ( = ?auto_482968 ?auto_482977 ) ) ( not ( = ?auto_482968 ?auto_482978 ) ) ( not ( = ?auto_482969 ?auto_482970 ) ) ( not ( = ?auto_482969 ?auto_482971 ) ) ( not ( = ?auto_482969 ?auto_482972 ) ) ( not ( = ?auto_482969 ?auto_482973 ) ) ( not ( = ?auto_482969 ?auto_482974 ) ) ( not ( = ?auto_482969 ?auto_482975 ) ) ( not ( = ?auto_482969 ?auto_482976 ) ) ( not ( = ?auto_482969 ?auto_482977 ) ) ( not ( = ?auto_482969 ?auto_482978 ) ) ( not ( = ?auto_482970 ?auto_482971 ) ) ( not ( = ?auto_482970 ?auto_482972 ) ) ( not ( = ?auto_482970 ?auto_482973 ) ) ( not ( = ?auto_482970 ?auto_482974 ) ) ( not ( = ?auto_482970 ?auto_482975 ) ) ( not ( = ?auto_482970 ?auto_482976 ) ) ( not ( = ?auto_482970 ?auto_482977 ) ) ( not ( = ?auto_482970 ?auto_482978 ) ) ( not ( = ?auto_482971 ?auto_482972 ) ) ( not ( = ?auto_482971 ?auto_482973 ) ) ( not ( = ?auto_482971 ?auto_482974 ) ) ( not ( = ?auto_482971 ?auto_482975 ) ) ( not ( = ?auto_482971 ?auto_482976 ) ) ( not ( = ?auto_482971 ?auto_482977 ) ) ( not ( = ?auto_482971 ?auto_482978 ) ) ( not ( = ?auto_482972 ?auto_482973 ) ) ( not ( = ?auto_482972 ?auto_482974 ) ) ( not ( = ?auto_482972 ?auto_482975 ) ) ( not ( = ?auto_482972 ?auto_482976 ) ) ( not ( = ?auto_482972 ?auto_482977 ) ) ( not ( = ?auto_482972 ?auto_482978 ) ) ( not ( = ?auto_482973 ?auto_482974 ) ) ( not ( = ?auto_482973 ?auto_482975 ) ) ( not ( = ?auto_482973 ?auto_482976 ) ) ( not ( = ?auto_482973 ?auto_482977 ) ) ( not ( = ?auto_482973 ?auto_482978 ) ) ( not ( = ?auto_482974 ?auto_482975 ) ) ( not ( = ?auto_482974 ?auto_482976 ) ) ( not ( = ?auto_482974 ?auto_482977 ) ) ( not ( = ?auto_482974 ?auto_482978 ) ) ( not ( = ?auto_482975 ?auto_482976 ) ) ( not ( = ?auto_482975 ?auto_482977 ) ) ( not ( = ?auto_482975 ?auto_482978 ) ) ( not ( = ?auto_482976 ?auto_482977 ) ) ( not ( = ?auto_482976 ?auto_482978 ) ) ( not ( = ?auto_482977 ?auto_482978 ) ) ( ON ?auto_482976 ?auto_482977 ) ( ON ?auto_482975 ?auto_482976 ) ( ON ?auto_482974 ?auto_482975 ) ( CLEAR ?auto_482972 ) ( ON ?auto_482973 ?auto_482974 ) ( CLEAR ?auto_482973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_482962 ?auto_482963 ?auto_482964 ?auto_482965 ?auto_482966 ?auto_482967 ?auto_482968 ?auto_482969 ?auto_482970 ?auto_482971 ?auto_482972 ?auto_482973 )
      ( MAKE-16PILE ?auto_482962 ?auto_482963 ?auto_482964 ?auto_482965 ?auto_482966 ?auto_482967 ?auto_482968 ?auto_482969 ?auto_482970 ?auto_482971 ?auto_482972 ?auto_482973 ?auto_482974 ?auto_482975 ?auto_482976 ?auto_482977 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_482995 - BLOCK
      ?auto_482996 - BLOCK
      ?auto_482997 - BLOCK
      ?auto_482998 - BLOCK
      ?auto_482999 - BLOCK
      ?auto_483000 - BLOCK
      ?auto_483001 - BLOCK
      ?auto_483002 - BLOCK
      ?auto_483003 - BLOCK
      ?auto_483004 - BLOCK
      ?auto_483005 - BLOCK
      ?auto_483006 - BLOCK
      ?auto_483007 - BLOCK
      ?auto_483008 - BLOCK
      ?auto_483009 - BLOCK
      ?auto_483010 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_483010 ) ( ON-TABLE ?auto_482995 ) ( ON ?auto_482996 ?auto_482995 ) ( ON ?auto_482997 ?auto_482996 ) ( ON ?auto_482998 ?auto_482997 ) ( ON ?auto_482999 ?auto_482998 ) ( ON ?auto_483000 ?auto_482999 ) ( ON ?auto_483001 ?auto_483000 ) ( ON ?auto_483002 ?auto_483001 ) ( ON ?auto_483003 ?auto_483002 ) ( ON ?auto_483004 ?auto_483003 ) ( ON ?auto_483005 ?auto_483004 ) ( not ( = ?auto_482995 ?auto_482996 ) ) ( not ( = ?auto_482995 ?auto_482997 ) ) ( not ( = ?auto_482995 ?auto_482998 ) ) ( not ( = ?auto_482995 ?auto_482999 ) ) ( not ( = ?auto_482995 ?auto_483000 ) ) ( not ( = ?auto_482995 ?auto_483001 ) ) ( not ( = ?auto_482995 ?auto_483002 ) ) ( not ( = ?auto_482995 ?auto_483003 ) ) ( not ( = ?auto_482995 ?auto_483004 ) ) ( not ( = ?auto_482995 ?auto_483005 ) ) ( not ( = ?auto_482995 ?auto_483006 ) ) ( not ( = ?auto_482995 ?auto_483007 ) ) ( not ( = ?auto_482995 ?auto_483008 ) ) ( not ( = ?auto_482995 ?auto_483009 ) ) ( not ( = ?auto_482995 ?auto_483010 ) ) ( not ( = ?auto_482996 ?auto_482997 ) ) ( not ( = ?auto_482996 ?auto_482998 ) ) ( not ( = ?auto_482996 ?auto_482999 ) ) ( not ( = ?auto_482996 ?auto_483000 ) ) ( not ( = ?auto_482996 ?auto_483001 ) ) ( not ( = ?auto_482996 ?auto_483002 ) ) ( not ( = ?auto_482996 ?auto_483003 ) ) ( not ( = ?auto_482996 ?auto_483004 ) ) ( not ( = ?auto_482996 ?auto_483005 ) ) ( not ( = ?auto_482996 ?auto_483006 ) ) ( not ( = ?auto_482996 ?auto_483007 ) ) ( not ( = ?auto_482996 ?auto_483008 ) ) ( not ( = ?auto_482996 ?auto_483009 ) ) ( not ( = ?auto_482996 ?auto_483010 ) ) ( not ( = ?auto_482997 ?auto_482998 ) ) ( not ( = ?auto_482997 ?auto_482999 ) ) ( not ( = ?auto_482997 ?auto_483000 ) ) ( not ( = ?auto_482997 ?auto_483001 ) ) ( not ( = ?auto_482997 ?auto_483002 ) ) ( not ( = ?auto_482997 ?auto_483003 ) ) ( not ( = ?auto_482997 ?auto_483004 ) ) ( not ( = ?auto_482997 ?auto_483005 ) ) ( not ( = ?auto_482997 ?auto_483006 ) ) ( not ( = ?auto_482997 ?auto_483007 ) ) ( not ( = ?auto_482997 ?auto_483008 ) ) ( not ( = ?auto_482997 ?auto_483009 ) ) ( not ( = ?auto_482997 ?auto_483010 ) ) ( not ( = ?auto_482998 ?auto_482999 ) ) ( not ( = ?auto_482998 ?auto_483000 ) ) ( not ( = ?auto_482998 ?auto_483001 ) ) ( not ( = ?auto_482998 ?auto_483002 ) ) ( not ( = ?auto_482998 ?auto_483003 ) ) ( not ( = ?auto_482998 ?auto_483004 ) ) ( not ( = ?auto_482998 ?auto_483005 ) ) ( not ( = ?auto_482998 ?auto_483006 ) ) ( not ( = ?auto_482998 ?auto_483007 ) ) ( not ( = ?auto_482998 ?auto_483008 ) ) ( not ( = ?auto_482998 ?auto_483009 ) ) ( not ( = ?auto_482998 ?auto_483010 ) ) ( not ( = ?auto_482999 ?auto_483000 ) ) ( not ( = ?auto_482999 ?auto_483001 ) ) ( not ( = ?auto_482999 ?auto_483002 ) ) ( not ( = ?auto_482999 ?auto_483003 ) ) ( not ( = ?auto_482999 ?auto_483004 ) ) ( not ( = ?auto_482999 ?auto_483005 ) ) ( not ( = ?auto_482999 ?auto_483006 ) ) ( not ( = ?auto_482999 ?auto_483007 ) ) ( not ( = ?auto_482999 ?auto_483008 ) ) ( not ( = ?auto_482999 ?auto_483009 ) ) ( not ( = ?auto_482999 ?auto_483010 ) ) ( not ( = ?auto_483000 ?auto_483001 ) ) ( not ( = ?auto_483000 ?auto_483002 ) ) ( not ( = ?auto_483000 ?auto_483003 ) ) ( not ( = ?auto_483000 ?auto_483004 ) ) ( not ( = ?auto_483000 ?auto_483005 ) ) ( not ( = ?auto_483000 ?auto_483006 ) ) ( not ( = ?auto_483000 ?auto_483007 ) ) ( not ( = ?auto_483000 ?auto_483008 ) ) ( not ( = ?auto_483000 ?auto_483009 ) ) ( not ( = ?auto_483000 ?auto_483010 ) ) ( not ( = ?auto_483001 ?auto_483002 ) ) ( not ( = ?auto_483001 ?auto_483003 ) ) ( not ( = ?auto_483001 ?auto_483004 ) ) ( not ( = ?auto_483001 ?auto_483005 ) ) ( not ( = ?auto_483001 ?auto_483006 ) ) ( not ( = ?auto_483001 ?auto_483007 ) ) ( not ( = ?auto_483001 ?auto_483008 ) ) ( not ( = ?auto_483001 ?auto_483009 ) ) ( not ( = ?auto_483001 ?auto_483010 ) ) ( not ( = ?auto_483002 ?auto_483003 ) ) ( not ( = ?auto_483002 ?auto_483004 ) ) ( not ( = ?auto_483002 ?auto_483005 ) ) ( not ( = ?auto_483002 ?auto_483006 ) ) ( not ( = ?auto_483002 ?auto_483007 ) ) ( not ( = ?auto_483002 ?auto_483008 ) ) ( not ( = ?auto_483002 ?auto_483009 ) ) ( not ( = ?auto_483002 ?auto_483010 ) ) ( not ( = ?auto_483003 ?auto_483004 ) ) ( not ( = ?auto_483003 ?auto_483005 ) ) ( not ( = ?auto_483003 ?auto_483006 ) ) ( not ( = ?auto_483003 ?auto_483007 ) ) ( not ( = ?auto_483003 ?auto_483008 ) ) ( not ( = ?auto_483003 ?auto_483009 ) ) ( not ( = ?auto_483003 ?auto_483010 ) ) ( not ( = ?auto_483004 ?auto_483005 ) ) ( not ( = ?auto_483004 ?auto_483006 ) ) ( not ( = ?auto_483004 ?auto_483007 ) ) ( not ( = ?auto_483004 ?auto_483008 ) ) ( not ( = ?auto_483004 ?auto_483009 ) ) ( not ( = ?auto_483004 ?auto_483010 ) ) ( not ( = ?auto_483005 ?auto_483006 ) ) ( not ( = ?auto_483005 ?auto_483007 ) ) ( not ( = ?auto_483005 ?auto_483008 ) ) ( not ( = ?auto_483005 ?auto_483009 ) ) ( not ( = ?auto_483005 ?auto_483010 ) ) ( not ( = ?auto_483006 ?auto_483007 ) ) ( not ( = ?auto_483006 ?auto_483008 ) ) ( not ( = ?auto_483006 ?auto_483009 ) ) ( not ( = ?auto_483006 ?auto_483010 ) ) ( not ( = ?auto_483007 ?auto_483008 ) ) ( not ( = ?auto_483007 ?auto_483009 ) ) ( not ( = ?auto_483007 ?auto_483010 ) ) ( not ( = ?auto_483008 ?auto_483009 ) ) ( not ( = ?auto_483008 ?auto_483010 ) ) ( not ( = ?auto_483009 ?auto_483010 ) ) ( ON ?auto_483009 ?auto_483010 ) ( ON ?auto_483008 ?auto_483009 ) ( ON ?auto_483007 ?auto_483008 ) ( CLEAR ?auto_483005 ) ( ON ?auto_483006 ?auto_483007 ) ( CLEAR ?auto_483006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_482995 ?auto_482996 ?auto_482997 ?auto_482998 ?auto_482999 ?auto_483000 ?auto_483001 ?auto_483002 ?auto_483003 ?auto_483004 ?auto_483005 ?auto_483006 )
      ( MAKE-16PILE ?auto_482995 ?auto_482996 ?auto_482997 ?auto_482998 ?auto_482999 ?auto_483000 ?auto_483001 ?auto_483002 ?auto_483003 ?auto_483004 ?auto_483005 ?auto_483006 ?auto_483007 ?auto_483008 ?auto_483009 ?auto_483010 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483027 - BLOCK
      ?auto_483028 - BLOCK
      ?auto_483029 - BLOCK
      ?auto_483030 - BLOCK
      ?auto_483031 - BLOCK
      ?auto_483032 - BLOCK
      ?auto_483033 - BLOCK
      ?auto_483034 - BLOCK
      ?auto_483035 - BLOCK
      ?auto_483036 - BLOCK
      ?auto_483037 - BLOCK
      ?auto_483038 - BLOCK
      ?auto_483039 - BLOCK
      ?auto_483040 - BLOCK
      ?auto_483041 - BLOCK
      ?auto_483042 - BLOCK
    )
    :vars
    (
      ?auto_483043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483042 ?auto_483043 ) ( ON-TABLE ?auto_483027 ) ( ON ?auto_483028 ?auto_483027 ) ( ON ?auto_483029 ?auto_483028 ) ( ON ?auto_483030 ?auto_483029 ) ( ON ?auto_483031 ?auto_483030 ) ( ON ?auto_483032 ?auto_483031 ) ( ON ?auto_483033 ?auto_483032 ) ( ON ?auto_483034 ?auto_483033 ) ( ON ?auto_483035 ?auto_483034 ) ( ON ?auto_483036 ?auto_483035 ) ( not ( = ?auto_483027 ?auto_483028 ) ) ( not ( = ?auto_483027 ?auto_483029 ) ) ( not ( = ?auto_483027 ?auto_483030 ) ) ( not ( = ?auto_483027 ?auto_483031 ) ) ( not ( = ?auto_483027 ?auto_483032 ) ) ( not ( = ?auto_483027 ?auto_483033 ) ) ( not ( = ?auto_483027 ?auto_483034 ) ) ( not ( = ?auto_483027 ?auto_483035 ) ) ( not ( = ?auto_483027 ?auto_483036 ) ) ( not ( = ?auto_483027 ?auto_483037 ) ) ( not ( = ?auto_483027 ?auto_483038 ) ) ( not ( = ?auto_483027 ?auto_483039 ) ) ( not ( = ?auto_483027 ?auto_483040 ) ) ( not ( = ?auto_483027 ?auto_483041 ) ) ( not ( = ?auto_483027 ?auto_483042 ) ) ( not ( = ?auto_483027 ?auto_483043 ) ) ( not ( = ?auto_483028 ?auto_483029 ) ) ( not ( = ?auto_483028 ?auto_483030 ) ) ( not ( = ?auto_483028 ?auto_483031 ) ) ( not ( = ?auto_483028 ?auto_483032 ) ) ( not ( = ?auto_483028 ?auto_483033 ) ) ( not ( = ?auto_483028 ?auto_483034 ) ) ( not ( = ?auto_483028 ?auto_483035 ) ) ( not ( = ?auto_483028 ?auto_483036 ) ) ( not ( = ?auto_483028 ?auto_483037 ) ) ( not ( = ?auto_483028 ?auto_483038 ) ) ( not ( = ?auto_483028 ?auto_483039 ) ) ( not ( = ?auto_483028 ?auto_483040 ) ) ( not ( = ?auto_483028 ?auto_483041 ) ) ( not ( = ?auto_483028 ?auto_483042 ) ) ( not ( = ?auto_483028 ?auto_483043 ) ) ( not ( = ?auto_483029 ?auto_483030 ) ) ( not ( = ?auto_483029 ?auto_483031 ) ) ( not ( = ?auto_483029 ?auto_483032 ) ) ( not ( = ?auto_483029 ?auto_483033 ) ) ( not ( = ?auto_483029 ?auto_483034 ) ) ( not ( = ?auto_483029 ?auto_483035 ) ) ( not ( = ?auto_483029 ?auto_483036 ) ) ( not ( = ?auto_483029 ?auto_483037 ) ) ( not ( = ?auto_483029 ?auto_483038 ) ) ( not ( = ?auto_483029 ?auto_483039 ) ) ( not ( = ?auto_483029 ?auto_483040 ) ) ( not ( = ?auto_483029 ?auto_483041 ) ) ( not ( = ?auto_483029 ?auto_483042 ) ) ( not ( = ?auto_483029 ?auto_483043 ) ) ( not ( = ?auto_483030 ?auto_483031 ) ) ( not ( = ?auto_483030 ?auto_483032 ) ) ( not ( = ?auto_483030 ?auto_483033 ) ) ( not ( = ?auto_483030 ?auto_483034 ) ) ( not ( = ?auto_483030 ?auto_483035 ) ) ( not ( = ?auto_483030 ?auto_483036 ) ) ( not ( = ?auto_483030 ?auto_483037 ) ) ( not ( = ?auto_483030 ?auto_483038 ) ) ( not ( = ?auto_483030 ?auto_483039 ) ) ( not ( = ?auto_483030 ?auto_483040 ) ) ( not ( = ?auto_483030 ?auto_483041 ) ) ( not ( = ?auto_483030 ?auto_483042 ) ) ( not ( = ?auto_483030 ?auto_483043 ) ) ( not ( = ?auto_483031 ?auto_483032 ) ) ( not ( = ?auto_483031 ?auto_483033 ) ) ( not ( = ?auto_483031 ?auto_483034 ) ) ( not ( = ?auto_483031 ?auto_483035 ) ) ( not ( = ?auto_483031 ?auto_483036 ) ) ( not ( = ?auto_483031 ?auto_483037 ) ) ( not ( = ?auto_483031 ?auto_483038 ) ) ( not ( = ?auto_483031 ?auto_483039 ) ) ( not ( = ?auto_483031 ?auto_483040 ) ) ( not ( = ?auto_483031 ?auto_483041 ) ) ( not ( = ?auto_483031 ?auto_483042 ) ) ( not ( = ?auto_483031 ?auto_483043 ) ) ( not ( = ?auto_483032 ?auto_483033 ) ) ( not ( = ?auto_483032 ?auto_483034 ) ) ( not ( = ?auto_483032 ?auto_483035 ) ) ( not ( = ?auto_483032 ?auto_483036 ) ) ( not ( = ?auto_483032 ?auto_483037 ) ) ( not ( = ?auto_483032 ?auto_483038 ) ) ( not ( = ?auto_483032 ?auto_483039 ) ) ( not ( = ?auto_483032 ?auto_483040 ) ) ( not ( = ?auto_483032 ?auto_483041 ) ) ( not ( = ?auto_483032 ?auto_483042 ) ) ( not ( = ?auto_483032 ?auto_483043 ) ) ( not ( = ?auto_483033 ?auto_483034 ) ) ( not ( = ?auto_483033 ?auto_483035 ) ) ( not ( = ?auto_483033 ?auto_483036 ) ) ( not ( = ?auto_483033 ?auto_483037 ) ) ( not ( = ?auto_483033 ?auto_483038 ) ) ( not ( = ?auto_483033 ?auto_483039 ) ) ( not ( = ?auto_483033 ?auto_483040 ) ) ( not ( = ?auto_483033 ?auto_483041 ) ) ( not ( = ?auto_483033 ?auto_483042 ) ) ( not ( = ?auto_483033 ?auto_483043 ) ) ( not ( = ?auto_483034 ?auto_483035 ) ) ( not ( = ?auto_483034 ?auto_483036 ) ) ( not ( = ?auto_483034 ?auto_483037 ) ) ( not ( = ?auto_483034 ?auto_483038 ) ) ( not ( = ?auto_483034 ?auto_483039 ) ) ( not ( = ?auto_483034 ?auto_483040 ) ) ( not ( = ?auto_483034 ?auto_483041 ) ) ( not ( = ?auto_483034 ?auto_483042 ) ) ( not ( = ?auto_483034 ?auto_483043 ) ) ( not ( = ?auto_483035 ?auto_483036 ) ) ( not ( = ?auto_483035 ?auto_483037 ) ) ( not ( = ?auto_483035 ?auto_483038 ) ) ( not ( = ?auto_483035 ?auto_483039 ) ) ( not ( = ?auto_483035 ?auto_483040 ) ) ( not ( = ?auto_483035 ?auto_483041 ) ) ( not ( = ?auto_483035 ?auto_483042 ) ) ( not ( = ?auto_483035 ?auto_483043 ) ) ( not ( = ?auto_483036 ?auto_483037 ) ) ( not ( = ?auto_483036 ?auto_483038 ) ) ( not ( = ?auto_483036 ?auto_483039 ) ) ( not ( = ?auto_483036 ?auto_483040 ) ) ( not ( = ?auto_483036 ?auto_483041 ) ) ( not ( = ?auto_483036 ?auto_483042 ) ) ( not ( = ?auto_483036 ?auto_483043 ) ) ( not ( = ?auto_483037 ?auto_483038 ) ) ( not ( = ?auto_483037 ?auto_483039 ) ) ( not ( = ?auto_483037 ?auto_483040 ) ) ( not ( = ?auto_483037 ?auto_483041 ) ) ( not ( = ?auto_483037 ?auto_483042 ) ) ( not ( = ?auto_483037 ?auto_483043 ) ) ( not ( = ?auto_483038 ?auto_483039 ) ) ( not ( = ?auto_483038 ?auto_483040 ) ) ( not ( = ?auto_483038 ?auto_483041 ) ) ( not ( = ?auto_483038 ?auto_483042 ) ) ( not ( = ?auto_483038 ?auto_483043 ) ) ( not ( = ?auto_483039 ?auto_483040 ) ) ( not ( = ?auto_483039 ?auto_483041 ) ) ( not ( = ?auto_483039 ?auto_483042 ) ) ( not ( = ?auto_483039 ?auto_483043 ) ) ( not ( = ?auto_483040 ?auto_483041 ) ) ( not ( = ?auto_483040 ?auto_483042 ) ) ( not ( = ?auto_483040 ?auto_483043 ) ) ( not ( = ?auto_483041 ?auto_483042 ) ) ( not ( = ?auto_483041 ?auto_483043 ) ) ( not ( = ?auto_483042 ?auto_483043 ) ) ( ON ?auto_483041 ?auto_483042 ) ( ON ?auto_483040 ?auto_483041 ) ( ON ?auto_483039 ?auto_483040 ) ( ON ?auto_483038 ?auto_483039 ) ( CLEAR ?auto_483036 ) ( ON ?auto_483037 ?auto_483038 ) ( CLEAR ?auto_483037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_483027 ?auto_483028 ?auto_483029 ?auto_483030 ?auto_483031 ?auto_483032 ?auto_483033 ?auto_483034 ?auto_483035 ?auto_483036 ?auto_483037 )
      ( MAKE-16PILE ?auto_483027 ?auto_483028 ?auto_483029 ?auto_483030 ?auto_483031 ?auto_483032 ?auto_483033 ?auto_483034 ?auto_483035 ?auto_483036 ?auto_483037 ?auto_483038 ?auto_483039 ?auto_483040 ?auto_483041 ?auto_483042 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483060 - BLOCK
      ?auto_483061 - BLOCK
      ?auto_483062 - BLOCK
      ?auto_483063 - BLOCK
      ?auto_483064 - BLOCK
      ?auto_483065 - BLOCK
      ?auto_483066 - BLOCK
      ?auto_483067 - BLOCK
      ?auto_483068 - BLOCK
      ?auto_483069 - BLOCK
      ?auto_483070 - BLOCK
      ?auto_483071 - BLOCK
      ?auto_483072 - BLOCK
      ?auto_483073 - BLOCK
      ?auto_483074 - BLOCK
      ?auto_483075 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_483075 ) ( ON-TABLE ?auto_483060 ) ( ON ?auto_483061 ?auto_483060 ) ( ON ?auto_483062 ?auto_483061 ) ( ON ?auto_483063 ?auto_483062 ) ( ON ?auto_483064 ?auto_483063 ) ( ON ?auto_483065 ?auto_483064 ) ( ON ?auto_483066 ?auto_483065 ) ( ON ?auto_483067 ?auto_483066 ) ( ON ?auto_483068 ?auto_483067 ) ( ON ?auto_483069 ?auto_483068 ) ( not ( = ?auto_483060 ?auto_483061 ) ) ( not ( = ?auto_483060 ?auto_483062 ) ) ( not ( = ?auto_483060 ?auto_483063 ) ) ( not ( = ?auto_483060 ?auto_483064 ) ) ( not ( = ?auto_483060 ?auto_483065 ) ) ( not ( = ?auto_483060 ?auto_483066 ) ) ( not ( = ?auto_483060 ?auto_483067 ) ) ( not ( = ?auto_483060 ?auto_483068 ) ) ( not ( = ?auto_483060 ?auto_483069 ) ) ( not ( = ?auto_483060 ?auto_483070 ) ) ( not ( = ?auto_483060 ?auto_483071 ) ) ( not ( = ?auto_483060 ?auto_483072 ) ) ( not ( = ?auto_483060 ?auto_483073 ) ) ( not ( = ?auto_483060 ?auto_483074 ) ) ( not ( = ?auto_483060 ?auto_483075 ) ) ( not ( = ?auto_483061 ?auto_483062 ) ) ( not ( = ?auto_483061 ?auto_483063 ) ) ( not ( = ?auto_483061 ?auto_483064 ) ) ( not ( = ?auto_483061 ?auto_483065 ) ) ( not ( = ?auto_483061 ?auto_483066 ) ) ( not ( = ?auto_483061 ?auto_483067 ) ) ( not ( = ?auto_483061 ?auto_483068 ) ) ( not ( = ?auto_483061 ?auto_483069 ) ) ( not ( = ?auto_483061 ?auto_483070 ) ) ( not ( = ?auto_483061 ?auto_483071 ) ) ( not ( = ?auto_483061 ?auto_483072 ) ) ( not ( = ?auto_483061 ?auto_483073 ) ) ( not ( = ?auto_483061 ?auto_483074 ) ) ( not ( = ?auto_483061 ?auto_483075 ) ) ( not ( = ?auto_483062 ?auto_483063 ) ) ( not ( = ?auto_483062 ?auto_483064 ) ) ( not ( = ?auto_483062 ?auto_483065 ) ) ( not ( = ?auto_483062 ?auto_483066 ) ) ( not ( = ?auto_483062 ?auto_483067 ) ) ( not ( = ?auto_483062 ?auto_483068 ) ) ( not ( = ?auto_483062 ?auto_483069 ) ) ( not ( = ?auto_483062 ?auto_483070 ) ) ( not ( = ?auto_483062 ?auto_483071 ) ) ( not ( = ?auto_483062 ?auto_483072 ) ) ( not ( = ?auto_483062 ?auto_483073 ) ) ( not ( = ?auto_483062 ?auto_483074 ) ) ( not ( = ?auto_483062 ?auto_483075 ) ) ( not ( = ?auto_483063 ?auto_483064 ) ) ( not ( = ?auto_483063 ?auto_483065 ) ) ( not ( = ?auto_483063 ?auto_483066 ) ) ( not ( = ?auto_483063 ?auto_483067 ) ) ( not ( = ?auto_483063 ?auto_483068 ) ) ( not ( = ?auto_483063 ?auto_483069 ) ) ( not ( = ?auto_483063 ?auto_483070 ) ) ( not ( = ?auto_483063 ?auto_483071 ) ) ( not ( = ?auto_483063 ?auto_483072 ) ) ( not ( = ?auto_483063 ?auto_483073 ) ) ( not ( = ?auto_483063 ?auto_483074 ) ) ( not ( = ?auto_483063 ?auto_483075 ) ) ( not ( = ?auto_483064 ?auto_483065 ) ) ( not ( = ?auto_483064 ?auto_483066 ) ) ( not ( = ?auto_483064 ?auto_483067 ) ) ( not ( = ?auto_483064 ?auto_483068 ) ) ( not ( = ?auto_483064 ?auto_483069 ) ) ( not ( = ?auto_483064 ?auto_483070 ) ) ( not ( = ?auto_483064 ?auto_483071 ) ) ( not ( = ?auto_483064 ?auto_483072 ) ) ( not ( = ?auto_483064 ?auto_483073 ) ) ( not ( = ?auto_483064 ?auto_483074 ) ) ( not ( = ?auto_483064 ?auto_483075 ) ) ( not ( = ?auto_483065 ?auto_483066 ) ) ( not ( = ?auto_483065 ?auto_483067 ) ) ( not ( = ?auto_483065 ?auto_483068 ) ) ( not ( = ?auto_483065 ?auto_483069 ) ) ( not ( = ?auto_483065 ?auto_483070 ) ) ( not ( = ?auto_483065 ?auto_483071 ) ) ( not ( = ?auto_483065 ?auto_483072 ) ) ( not ( = ?auto_483065 ?auto_483073 ) ) ( not ( = ?auto_483065 ?auto_483074 ) ) ( not ( = ?auto_483065 ?auto_483075 ) ) ( not ( = ?auto_483066 ?auto_483067 ) ) ( not ( = ?auto_483066 ?auto_483068 ) ) ( not ( = ?auto_483066 ?auto_483069 ) ) ( not ( = ?auto_483066 ?auto_483070 ) ) ( not ( = ?auto_483066 ?auto_483071 ) ) ( not ( = ?auto_483066 ?auto_483072 ) ) ( not ( = ?auto_483066 ?auto_483073 ) ) ( not ( = ?auto_483066 ?auto_483074 ) ) ( not ( = ?auto_483066 ?auto_483075 ) ) ( not ( = ?auto_483067 ?auto_483068 ) ) ( not ( = ?auto_483067 ?auto_483069 ) ) ( not ( = ?auto_483067 ?auto_483070 ) ) ( not ( = ?auto_483067 ?auto_483071 ) ) ( not ( = ?auto_483067 ?auto_483072 ) ) ( not ( = ?auto_483067 ?auto_483073 ) ) ( not ( = ?auto_483067 ?auto_483074 ) ) ( not ( = ?auto_483067 ?auto_483075 ) ) ( not ( = ?auto_483068 ?auto_483069 ) ) ( not ( = ?auto_483068 ?auto_483070 ) ) ( not ( = ?auto_483068 ?auto_483071 ) ) ( not ( = ?auto_483068 ?auto_483072 ) ) ( not ( = ?auto_483068 ?auto_483073 ) ) ( not ( = ?auto_483068 ?auto_483074 ) ) ( not ( = ?auto_483068 ?auto_483075 ) ) ( not ( = ?auto_483069 ?auto_483070 ) ) ( not ( = ?auto_483069 ?auto_483071 ) ) ( not ( = ?auto_483069 ?auto_483072 ) ) ( not ( = ?auto_483069 ?auto_483073 ) ) ( not ( = ?auto_483069 ?auto_483074 ) ) ( not ( = ?auto_483069 ?auto_483075 ) ) ( not ( = ?auto_483070 ?auto_483071 ) ) ( not ( = ?auto_483070 ?auto_483072 ) ) ( not ( = ?auto_483070 ?auto_483073 ) ) ( not ( = ?auto_483070 ?auto_483074 ) ) ( not ( = ?auto_483070 ?auto_483075 ) ) ( not ( = ?auto_483071 ?auto_483072 ) ) ( not ( = ?auto_483071 ?auto_483073 ) ) ( not ( = ?auto_483071 ?auto_483074 ) ) ( not ( = ?auto_483071 ?auto_483075 ) ) ( not ( = ?auto_483072 ?auto_483073 ) ) ( not ( = ?auto_483072 ?auto_483074 ) ) ( not ( = ?auto_483072 ?auto_483075 ) ) ( not ( = ?auto_483073 ?auto_483074 ) ) ( not ( = ?auto_483073 ?auto_483075 ) ) ( not ( = ?auto_483074 ?auto_483075 ) ) ( ON ?auto_483074 ?auto_483075 ) ( ON ?auto_483073 ?auto_483074 ) ( ON ?auto_483072 ?auto_483073 ) ( ON ?auto_483071 ?auto_483072 ) ( CLEAR ?auto_483069 ) ( ON ?auto_483070 ?auto_483071 ) ( CLEAR ?auto_483070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_483060 ?auto_483061 ?auto_483062 ?auto_483063 ?auto_483064 ?auto_483065 ?auto_483066 ?auto_483067 ?auto_483068 ?auto_483069 ?auto_483070 )
      ( MAKE-16PILE ?auto_483060 ?auto_483061 ?auto_483062 ?auto_483063 ?auto_483064 ?auto_483065 ?auto_483066 ?auto_483067 ?auto_483068 ?auto_483069 ?auto_483070 ?auto_483071 ?auto_483072 ?auto_483073 ?auto_483074 ?auto_483075 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483092 - BLOCK
      ?auto_483093 - BLOCK
      ?auto_483094 - BLOCK
      ?auto_483095 - BLOCK
      ?auto_483096 - BLOCK
      ?auto_483097 - BLOCK
      ?auto_483098 - BLOCK
      ?auto_483099 - BLOCK
      ?auto_483100 - BLOCK
      ?auto_483101 - BLOCK
      ?auto_483102 - BLOCK
      ?auto_483103 - BLOCK
      ?auto_483104 - BLOCK
      ?auto_483105 - BLOCK
      ?auto_483106 - BLOCK
      ?auto_483107 - BLOCK
    )
    :vars
    (
      ?auto_483108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483107 ?auto_483108 ) ( ON-TABLE ?auto_483092 ) ( ON ?auto_483093 ?auto_483092 ) ( ON ?auto_483094 ?auto_483093 ) ( ON ?auto_483095 ?auto_483094 ) ( ON ?auto_483096 ?auto_483095 ) ( ON ?auto_483097 ?auto_483096 ) ( ON ?auto_483098 ?auto_483097 ) ( ON ?auto_483099 ?auto_483098 ) ( ON ?auto_483100 ?auto_483099 ) ( not ( = ?auto_483092 ?auto_483093 ) ) ( not ( = ?auto_483092 ?auto_483094 ) ) ( not ( = ?auto_483092 ?auto_483095 ) ) ( not ( = ?auto_483092 ?auto_483096 ) ) ( not ( = ?auto_483092 ?auto_483097 ) ) ( not ( = ?auto_483092 ?auto_483098 ) ) ( not ( = ?auto_483092 ?auto_483099 ) ) ( not ( = ?auto_483092 ?auto_483100 ) ) ( not ( = ?auto_483092 ?auto_483101 ) ) ( not ( = ?auto_483092 ?auto_483102 ) ) ( not ( = ?auto_483092 ?auto_483103 ) ) ( not ( = ?auto_483092 ?auto_483104 ) ) ( not ( = ?auto_483092 ?auto_483105 ) ) ( not ( = ?auto_483092 ?auto_483106 ) ) ( not ( = ?auto_483092 ?auto_483107 ) ) ( not ( = ?auto_483092 ?auto_483108 ) ) ( not ( = ?auto_483093 ?auto_483094 ) ) ( not ( = ?auto_483093 ?auto_483095 ) ) ( not ( = ?auto_483093 ?auto_483096 ) ) ( not ( = ?auto_483093 ?auto_483097 ) ) ( not ( = ?auto_483093 ?auto_483098 ) ) ( not ( = ?auto_483093 ?auto_483099 ) ) ( not ( = ?auto_483093 ?auto_483100 ) ) ( not ( = ?auto_483093 ?auto_483101 ) ) ( not ( = ?auto_483093 ?auto_483102 ) ) ( not ( = ?auto_483093 ?auto_483103 ) ) ( not ( = ?auto_483093 ?auto_483104 ) ) ( not ( = ?auto_483093 ?auto_483105 ) ) ( not ( = ?auto_483093 ?auto_483106 ) ) ( not ( = ?auto_483093 ?auto_483107 ) ) ( not ( = ?auto_483093 ?auto_483108 ) ) ( not ( = ?auto_483094 ?auto_483095 ) ) ( not ( = ?auto_483094 ?auto_483096 ) ) ( not ( = ?auto_483094 ?auto_483097 ) ) ( not ( = ?auto_483094 ?auto_483098 ) ) ( not ( = ?auto_483094 ?auto_483099 ) ) ( not ( = ?auto_483094 ?auto_483100 ) ) ( not ( = ?auto_483094 ?auto_483101 ) ) ( not ( = ?auto_483094 ?auto_483102 ) ) ( not ( = ?auto_483094 ?auto_483103 ) ) ( not ( = ?auto_483094 ?auto_483104 ) ) ( not ( = ?auto_483094 ?auto_483105 ) ) ( not ( = ?auto_483094 ?auto_483106 ) ) ( not ( = ?auto_483094 ?auto_483107 ) ) ( not ( = ?auto_483094 ?auto_483108 ) ) ( not ( = ?auto_483095 ?auto_483096 ) ) ( not ( = ?auto_483095 ?auto_483097 ) ) ( not ( = ?auto_483095 ?auto_483098 ) ) ( not ( = ?auto_483095 ?auto_483099 ) ) ( not ( = ?auto_483095 ?auto_483100 ) ) ( not ( = ?auto_483095 ?auto_483101 ) ) ( not ( = ?auto_483095 ?auto_483102 ) ) ( not ( = ?auto_483095 ?auto_483103 ) ) ( not ( = ?auto_483095 ?auto_483104 ) ) ( not ( = ?auto_483095 ?auto_483105 ) ) ( not ( = ?auto_483095 ?auto_483106 ) ) ( not ( = ?auto_483095 ?auto_483107 ) ) ( not ( = ?auto_483095 ?auto_483108 ) ) ( not ( = ?auto_483096 ?auto_483097 ) ) ( not ( = ?auto_483096 ?auto_483098 ) ) ( not ( = ?auto_483096 ?auto_483099 ) ) ( not ( = ?auto_483096 ?auto_483100 ) ) ( not ( = ?auto_483096 ?auto_483101 ) ) ( not ( = ?auto_483096 ?auto_483102 ) ) ( not ( = ?auto_483096 ?auto_483103 ) ) ( not ( = ?auto_483096 ?auto_483104 ) ) ( not ( = ?auto_483096 ?auto_483105 ) ) ( not ( = ?auto_483096 ?auto_483106 ) ) ( not ( = ?auto_483096 ?auto_483107 ) ) ( not ( = ?auto_483096 ?auto_483108 ) ) ( not ( = ?auto_483097 ?auto_483098 ) ) ( not ( = ?auto_483097 ?auto_483099 ) ) ( not ( = ?auto_483097 ?auto_483100 ) ) ( not ( = ?auto_483097 ?auto_483101 ) ) ( not ( = ?auto_483097 ?auto_483102 ) ) ( not ( = ?auto_483097 ?auto_483103 ) ) ( not ( = ?auto_483097 ?auto_483104 ) ) ( not ( = ?auto_483097 ?auto_483105 ) ) ( not ( = ?auto_483097 ?auto_483106 ) ) ( not ( = ?auto_483097 ?auto_483107 ) ) ( not ( = ?auto_483097 ?auto_483108 ) ) ( not ( = ?auto_483098 ?auto_483099 ) ) ( not ( = ?auto_483098 ?auto_483100 ) ) ( not ( = ?auto_483098 ?auto_483101 ) ) ( not ( = ?auto_483098 ?auto_483102 ) ) ( not ( = ?auto_483098 ?auto_483103 ) ) ( not ( = ?auto_483098 ?auto_483104 ) ) ( not ( = ?auto_483098 ?auto_483105 ) ) ( not ( = ?auto_483098 ?auto_483106 ) ) ( not ( = ?auto_483098 ?auto_483107 ) ) ( not ( = ?auto_483098 ?auto_483108 ) ) ( not ( = ?auto_483099 ?auto_483100 ) ) ( not ( = ?auto_483099 ?auto_483101 ) ) ( not ( = ?auto_483099 ?auto_483102 ) ) ( not ( = ?auto_483099 ?auto_483103 ) ) ( not ( = ?auto_483099 ?auto_483104 ) ) ( not ( = ?auto_483099 ?auto_483105 ) ) ( not ( = ?auto_483099 ?auto_483106 ) ) ( not ( = ?auto_483099 ?auto_483107 ) ) ( not ( = ?auto_483099 ?auto_483108 ) ) ( not ( = ?auto_483100 ?auto_483101 ) ) ( not ( = ?auto_483100 ?auto_483102 ) ) ( not ( = ?auto_483100 ?auto_483103 ) ) ( not ( = ?auto_483100 ?auto_483104 ) ) ( not ( = ?auto_483100 ?auto_483105 ) ) ( not ( = ?auto_483100 ?auto_483106 ) ) ( not ( = ?auto_483100 ?auto_483107 ) ) ( not ( = ?auto_483100 ?auto_483108 ) ) ( not ( = ?auto_483101 ?auto_483102 ) ) ( not ( = ?auto_483101 ?auto_483103 ) ) ( not ( = ?auto_483101 ?auto_483104 ) ) ( not ( = ?auto_483101 ?auto_483105 ) ) ( not ( = ?auto_483101 ?auto_483106 ) ) ( not ( = ?auto_483101 ?auto_483107 ) ) ( not ( = ?auto_483101 ?auto_483108 ) ) ( not ( = ?auto_483102 ?auto_483103 ) ) ( not ( = ?auto_483102 ?auto_483104 ) ) ( not ( = ?auto_483102 ?auto_483105 ) ) ( not ( = ?auto_483102 ?auto_483106 ) ) ( not ( = ?auto_483102 ?auto_483107 ) ) ( not ( = ?auto_483102 ?auto_483108 ) ) ( not ( = ?auto_483103 ?auto_483104 ) ) ( not ( = ?auto_483103 ?auto_483105 ) ) ( not ( = ?auto_483103 ?auto_483106 ) ) ( not ( = ?auto_483103 ?auto_483107 ) ) ( not ( = ?auto_483103 ?auto_483108 ) ) ( not ( = ?auto_483104 ?auto_483105 ) ) ( not ( = ?auto_483104 ?auto_483106 ) ) ( not ( = ?auto_483104 ?auto_483107 ) ) ( not ( = ?auto_483104 ?auto_483108 ) ) ( not ( = ?auto_483105 ?auto_483106 ) ) ( not ( = ?auto_483105 ?auto_483107 ) ) ( not ( = ?auto_483105 ?auto_483108 ) ) ( not ( = ?auto_483106 ?auto_483107 ) ) ( not ( = ?auto_483106 ?auto_483108 ) ) ( not ( = ?auto_483107 ?auto_483108 ) ) ( ON ?auto_483106 ?auto_483107 ) ( ON ?auto_483105 ?auto_483106 ) ( ON ?auto_483104 ?auto_483105 ) ( ON ?auto_483103 ?auto_483104 ) ( ON ?auto_483102 ?auto_483103 ) ( CLEAR ?auto_483100 ) ( ON ?auto_483101 ?auto_483102 ) ( CLEAR ?auto_483101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_483092 ?auto_483093 ?auto_483094 ?auto_483095 ?auto_483096 ?auto_483097 ?auto_483098 ?auto_483099 ?auto_483100 ?auto_483101 )
      ( MAKE-16PILE ?auto_483092 ?auto_483093 ?auto_483094 ?auto_483095 ?auto_483096 ?auto_483097 ?auto_483098 ?auto_483099 ?auto_483100 ?auto_483101 ?auto_483102 ?auto_483103 ?auto_483104 ?auto_483105 ?auto_483106 ?auto_483107 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483125 - BLOCK
      ?auto_483126 - BLOCK
      ?auto_483127 - BLOCK
      ?auto_483128 - BLOCK
      ?auto_483129 - BLOCK
      ?auto_483130 - BLOCK
      ?auto_483131 - BLOCK
      ?auto_483132 - BLOCK
      ?auto_483133 - BLOCK
      ?auto_483134 - BLOCK
      ?auto_483135 - BLOCK
      ?auto_483136 - BLOCK
      ?auto_483137 - BLOCK
      ?auto_483138 - BLOCK
      ?auto_483139 - BLOCK
      ?auto_483140 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_483140 ) ( ON-TABLE ?auto_483125 ) ( ON ?auto_483126 ?auto_483125 ) ( ON ?auto_483127 ?auto_483126 ) ( ON ?auto_483128 ?auto_483127 ) ( ON ?auto_483129 ?auto_483128 ) ( ON ?auto_483130 ?auto_483129 ) ( ON ?auto_483131 ?auto_483130 ) ( ON ?auto_483132 ?auto_483131 ) ( ON ?auto_483133 ?auto_483132 ) ( not ( = ?auto_483125 ?auto_483126 ) ) ( not ( = ?auto_483125 ?auto_483127 ) ) ( not ( = ?auto_483125 ?auto_483128 ) ) ( not ( = ?auto_483125 ?auto_483129 ) ) ( not ( = ?auto_483125 ?auto_483130 ) ) ( not ( = ?auto_483125 ?auto_483131 ) ) ( not ( = ?auto_483125 ?auto_483132 ) ) ( not ( = ?auto_483125 ?auto_483133 ) ) ( not ( = ?auto_483125 ?auto_483134 ) ) ( not ( = ?auto_483125 ?auto_483135 ) ) ( not ( = ?auto_483125 ?auto_483136 ) ) ( not ( = ?auto_483125 ?auto_483137 ) ) ( not ( = ?auto_483125 ?auto_483138 ) ) ( not ( = ?auto_483125 ?auto_483139 ) ) ( not ( = ?auto_483125 ?auto_483140 ) ) ( not ( = ?auto_483126 ?auto_483127 ) ) ( not ( = ?auto_483126 ?auto_483128 ) ) ( not ( = ?auto_483126 ?auto_483129 ) ) ( not ( = ?auto_483126 ?auto_483130 ) ) ( not ( = ?auto_483126 ?auto_483131 ) ) ( not ( = ?auto_483126 ?auto_483132 ) ) ( not ( = ?auto_483126 ?auto_483133 ) ) ( not ( = ?auto_483126 ?auto_483134 ) ) ( not ( = ?auto_483126 ?auto_483135 ) ) ( not ( = ?auto_483126 ?auto_483136 ) ) ( not ( = ?auto_483126 ?auto_483137 ) ) ( not ( = ?auto_483126 ?auto_483138 ) ) ( not ( = ?auto_483126 ?auto_483139 ) ) ( not ( = ?auto_483126 ?auto_483140 ) ) ( not ( = ?auto_483127 ?auto_483128 ) ) ( not ( = ?auto_483127 ?auto_483129 ) ) ( not ( = ?auto_483127 ?auto_483130 ) ) ( not ( = ?auto_483127 ?auto_483131 ) ) ( not ( = ?auto_483127 ?auto_483132 ) ) ( not ( = ?auto_483127 ?auto_483133 ) ) ( not ( = ?auto_483127 ?auto_483134 ) ) ( not ( = ?auto_483127 ?auto_483135 ) ) ( not ( = ?auto_483127 ?auto_483136 ) ) ( not ( = ?auto_483127 ?auto_483137 ) ) ( not ( = ?auto_483127 ?auto_483138 ) ) ( not ( = ?auto_483127 ?auto_483139 ) ) ( not ( = ?auto_483127 ?auto_483140 ) ) ( not ( = ?auto_483128 ?auto_483129 ) ) ( not ( = ?auto_483128 ?auto_483130 ) ) ( not ( = ?auto_483128 ?auto_483131 ) ) ( not ( = ?auto_483128 ?auto_483132 ) ) ( not ( = ?auto_483128 ?auto_483133 ) ) ( not ( = ?auto_483128 ?auto_483134 ) ) ( not ( = ?auto_483128 ?auto_483135 ) ) ( not ( = ?auto_483128 ?auto_483136 ) ) ( not ( = ?auto_483128 ?auto_483137 ) ) ( not ( = ?auto_483128 ?auto_483138 ) ) ( not ( = ?auto_483128 ?auto_483139 ) ) ( not ( = ?auto_483128 ?auto_483140 ) ) ( not ( = ?auto_483129 ?auto_483130 ) ) ( not ( = ?auto_483129 ?auto_483131 ) ) ( not ( = ?auto_483129 ?auto_483132 ) ) ( not ( = ?auto_483129 ?auto_483133 ) ) ( not ( = ?auto_483129 ?auto_483134 ) ) ( not ( = ?auto_483129 ?auto_483135 ) ) ( not ( = ?auto_483129 ?auto_483136 ) ) ( not ( = ?auto_483129 ?auto_483137 ) ) ( not ( = ?auto_483129 ?auto_483138 ) ) ( not ( = ?auto_483129 ?auto_483139 ) ) ( not ( = ?auto_483129 ?auto_483140 ) ) ( not ( = ?auto_483130 ?auto_483131 ) ) ( not ( = ?auto_483130 ?auto_483132 ) ) ( not ( = ?auto_483130 ?auto_483133 ) ) ( not ( = ?auto_483130 ?auto_483134 ) ) ( not ( = ?auto_483130 ?auto_483135 ) ) ( not ( = ?auto_483130 ?auto_483136 ) ) ( not ( = ?auto_483130 ?auto_483137 ) ) ( not ( = ?auto_483130 ?auto_483138 ) ) ( not ( = ?auto_483130 ?auto_483139 ) ) ( not ( = ?auto_483130 ?auto_483140 ) ) ( not ( = ?auto_483131 ?auto_483132 ) ) ( not ( = ?auto_483131 ?auto_483133 ) ) ( not ( = ?auto_483131 ?auto_483134 ) ) ( not ( = ?auto_483131 ?auto_483135 ) ) ( not ( = ?auto_483131 ?auto_483136 ) ) ( not ( = ?auto_483131 ?auto_483137 ) ) ( not ( = ?auto_483131 ?auto_483138 ) ) ( not ( = ?auto_483131 ?auto_483139 ) ) ( not ( = ?auto_483131 ?auto_483140 ) ) ( not ( = ?auto_483132 ?auto_483133 ) ) ( not ( = ?auto_483132 ?auto_483134 ) ) ( not ( = ?auto_483132 ?auto_483135 ) ) ( not ( = ?auto_483132 ?auto_483136 ) ) ( not ( = ?auto_483132 ?auto_483137 ) ) ( not ( = ?auto_483132 ?auto_483138 ) ) ( not ( = ?auto_483132 ?auto_483139 ) ) ( not ( = ?auto_483132 ?auto_483140 ) ) ( not ( = ?auto_483133 ?auto_483134 ) ) ( not ( = ?auto_483133 ?auto_483135 ) ) ( not ( = ?auto_483133 ?auto_483136 ) ) ( not ( = ?auto_483133 ?auto_483137 ) ) ( not ( = ?auto_483133 ?auto_483138 ) ) ( not ( = ?auto_483133 ?auto_483139 ) ) ( not ( = ?auto_483133 ?auto_483140 ) ) ( not ( = ?auto_483134 ?auto_483135 ) ) ( not ( = ?auto_483134 ?auto_483136 ) ) ( not ( = ?auto_483134 ?auto_483137 ) ) ( not ( = ?auto_483134 ?auto_483138 ) ) ( not ( = ?auto_483134 ?auto_483139 ) ) ( not ( = ?auto_483134 ?auto_483140 ) ) ( not ( = ?auto_483135 ?auto_483136 ) ) ( not ( = ?auto_483135 ?auto_483137 ) ) ( not ( = ?auto_483135 ?auto_483138 ) ) ( not ( = ?auto_483135 ?auto_483139 ) ) ( not ( = ?auto_483135 ?auto_483140 ) ) ( not ( = ?auto_483136 ?auto_483137 ) ) ( not ( = ?auto_483136 ?auto_483138 ) ) ( not ( = ?auto_483136 ?auto_483139 ) ) ( not ( = ?auto_483136 ?auto_483140 ) ) ( not ( = ?auto_483137 ?auto_483138 ) ) ( not ( = ?auto_483137 ?auto_483139 ) ) ( not ( = ?auto_483137 ?auto_483140 ) ) ( not ( = ?auto_483138 ?auto_483139 ) ) ( not ( = ?auto_483138 ?auto_483140 ) ) ( not ( = ?auto_483139 ?auto_483140 ) ) ( ON ?auto_483139 ?auto_483140 ) ( ON ?auto_483138 ?auto_483139 ) ( ON ?auto_483137 ?auto_483138 ) ( ON ?auto_483136 ?auto_483137 ) ( ON ?auto_483135 ?auto_483136 ) ( CLEAR ?auto_483133 ) ( ON ?auto_483134 ?auto_483135 ) ( CLEAR ?auto_483134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_483125 ?auto_483126 ?auto_483127 ?auto_483128 ?auto_483129 ?auto_483130 ?auto_483131 ?auto_483132 ?auto_483133 ?auto_483134 )
      ( MAKE-16PILE ?auto_483125 ?auto_483126 ?auto_483127 ?auto_483128 ?auto_483129 ?auto_483130 ?auto_483131 ?auto_483132 ?auto_483133 ?auto_483134 ?auto_483135 ?auto_483136 ?auto_483137 ?auto_483138 ?auto_483139 ?auto_483140 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483157 - BLOCK
      ?auto_483158 - BLOCK
      ?auto_483159 - BLOCK
      ?auto_483160 - BLOCK
      ?auto_483161 - BLOCK
      ?auto_483162 - BLOCK
      ?auto_483163 - BLOCK
      ?auto_483164 - BLOCK
      ?auto_483165 - BLOCK
      ?auto_483166 - BLOCK
      ?auto_483167 - BLOCK
      ?auto_483168 - BLOCK
      ?auto_483169 - BLOCK
      ?auto_483170 - BLOCK
      ?auto_483171 - BLOCK
      ?auto_483172 - BLOCK
    )
    :vars
    (
      ?auto_483173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483172 ?auto_483173 ) ( ON-TABLE ?auto_483157 ) ( ON ?auto_483158 ?auto_483157 ) ( ON ?auto_483159 ?auto_483158 ) ( ON ?auto_483160 ?auto_483159 ) ( ON ?auto_483161 ?auto_483160 ) ( ON ?auto_483162 ?auto_483161 ) ( ON ?auto_483163 ?auto_483162 ) ( ON ?auto_483164 ?auto_483163 ) ( not ( = ?auto_483157 ?auto_483158 ) ) ( not ( = ?auto_483157 ?auto_483159 ) ) ( not ( = ?auto_483157 ?auto_483160 ) ) ( not ( = ?auto_483157 ?auto_483161 ) ) ( not ( = ?auto_483157 ?auto_483162 ) ) ( not ( = ?auto_483157 ?auto_483163 ) ) ( not ( = ?auto_483157 ?auto_483164 ) ) ( not ( = ?auto_483157 ?auto_483165 ) ) ( not ( = ?auto_483157 ?auto_483166 ) ) ( not ( = ?auto_483157 ?auto_483167 ) ) ( not ( = ?auto_483157 ?auto_483168 ) ) ( not ( = ?auto_483157 ?auto_483169 ) ) ( not ( = ?auto_483157 ?auto_483170 ) ) ( not ( = ?auto_483157 ?auto_483171 ) ) ( not ( = ?auto_483157 ?auto_483172 ) ) ( not ( = ?auto_483157 ?auto_483173 ) ) ( not ( = ?auto_483158 ?auto_483159 ) ) ( not ( = ?auto_483158 ?auto_483160 ) ) ( not ( = ?auto_483158 ?auto_483161 ) ) ( not ( = ?auto_483158 ?auto_483162 ) ) ( not ( = ?auto_483158 ?auto_483163 ) ) ( not ( = ?auto_483158 ?auto_483164 ) ) ( not ( = ?auto_483158 ?auto_483165 ) ) ( not ( = ?auto_483158 ?auto_483166 ) ) ( not ( = ?auto_483158 ?auto_483167 ) ) ( not ( = ?auto_483158 ?auto_483168 ) ) ( not ( = ?auto_483158 ?auto_483169 ) ) ( not ( = ?auto_483158 ?auto_483170 ) ) ( not ( = ?auto_483158 ?auto_483171 ) ) ( not ( = ?auto_483158 ?auto_483172 ) ) ( not ( = ?auto_483158 ?auto_483173 ) ) ( not ( = ?auto_483159 ?auto_483160 ) ) ( not ( = ?auto_483159 ?auto_483161 ) ) ( not ( = ?auto_483159 ?auto_483162 ) ) ( not ( = ?auto_483159 ?auto_483163 ) ) ( not ( = ?auto_483159 ?auto_483164 ) ) ( not ( = ?auto_483159 ?auto_483165 ) ) ( not ( = ?auto_483159 ?auto_483166 ) ) ( not ( = ?auto_483159 ?auto_483167 ) ) ( not ( = ?auto_483159 ?auto_483168 ) ) ( not ( = ?auto_483159 ?auto_483169 ) ) ( not ( = ?auto_483159 ?auto_483170 ) ) ( not ( = ?auto_483159 ?auto_483171 ) ) ( not ( = ?auto_483159 ?auto_483172 ) ) ( not ( = ?auto_483159 ?auto_483173 ) ) ( not ( = ?auto_483160 ?auto_483161 ) ) ( not ( = ?auto_483160 ?auto_483162 ) ) ( not ( = ?auto_483160 ?auto_483163 ) ) ( not ( = ?auto_483160 ?auto_483164 ) ) ( not ( = ?auto_483160 ?auto_483165 ) ) ( not ( = ?auto_483160 ?auto_483166 ) ) ( not ( = ?auto_483160 ?auto_483167 ) ) ( not ( = ?auto_483160 ?auto_483168 ) ) ( not ( = ?auto_483160 ?auto_483169 ) ) ( not ( = ?auto_483160 ?auto_483170 ) ) ( not ( = ?auto_483160 ?auto_483171 ) ) ( not ( = ?auto_483160 ?auto_483172 ) ) ( not ( = ?auto_483160 ?auto_483173 ) ) ( not ( = ?auto_483161 ?auto_483162 ) ) ( not ( = ?auto_483161 ?auto_483163 ) ) ( not ( = ?auto_483161 ?auto_483164 ) ) ( not ( = ?auto_483161 ?auto_483165 ) ) ( not ( = ?auto_483161 ?auto_483166 ) ) ( not ( = ?auto_483161 ?auto_483167 ) ) ( not ( = ?auto_483161 ?auto_483168 ) ) ( not ( = ?auto_483161 ?auto_483169 ) ) ( not ( = ?auto_483161 ?auto_483170 ) ) ( not ( = ?auto_483161 ?auto_483171 ) ) ( not ( = ?auto_483161 ?auto_483172 ) ) ( not ( = ?auto_483161 ?auto_483173 ) ) ( not ( = ?auto_483162 ?auto_483163 ) ) ( not ( = ?auto_483162 ?auto_483164 ) ) ( not ( = ?auto_483162 ?auto_483165 ) ) ( not ( = ?auto_483162 ?auto_483166 ) ) ( not ( = ?auto_483162 ?auto_483167 ) ) ( not ( = ?auto_483162 ?auto_483168 ) ) ( not ( = ?auto_483162 ?auto_483169 ) ) ( not ( = ?auto_483162 ?auto_483170 ) ) ( not ( = ?auto_483162 ?auto_483171 ) ) ( not ( = ?auto_483162 ?auto_483172 ) ) ( not ( = ?auto_483162 ?auto_483173 ) ) ( not ( = ?auto_483163 ?auto_483164 ) ) ( not ( = ?auto_483163 ?auto_483165 ) ) ( not ( = ?auto_483163 ?auto_483166 ) ) ( not ( = ?auto_483163 ?auto_483167 ) ) ( not ( = ?auto_483163 ?auto_483168 ) ) ( not ( = ?auto_483163 ?auto_483169 ) ) ( not ( = ?auto_483163 ?auto_483170 ) ) ( not ( = ?auto_483163 ?auto_483171 ) ) ( not ( = ?auto_483163 ?auto_483172 ) ) ( not ( = ?auto_483163 ?auto_483173 ) ) ( not ( = ?auto_483164 ?auto_483165 ) ) ( not ( = ?auto_483164 ?auto_483166 ) ) ( not ( = ?auto_483164 ?auto_483167 ) ) ( not ( = ?auto_483164 ?auto_483168 ) ) ( not ( = ?auto_483164 ?auto_483169 ) ) ( not ( = ?auto_483164 ?auto_483170 ) ) ( not ( = ?auto_483164 ?auto_483171 ) ) ( not ( = ?auto_483164 ?auto_483172 ) ) ( not ( = ?auto_483164 ?auto_483173 ) ) ( not ( = ?auto_483165 ?auto_483166 ) ) ( not ( = ?auto_483165 ?auto_483167 ) ) ( not ( = ?auto_483165 ?auto_483168 ) ) ( not ( = ?auto_483165 ?auto_483169 ) ) ( not ( = ?auto_483165 ?auto_483170 ) ) ( not ( = ?auto_483165 ?auto_483171 ) ) ( not ( = ?auto_483165 ?auto_483172 ) ) ( not ( = ?auto_483165 ?auto_483173 ) ) ( not ( = ?auto_483166 ?auto_483167 ) ) ( not ( = ?auto_483166 ?auto_483168 ) ) ( not ( = ?auto_483166 ?auto_483169 ) ) ( not ( = ?auto_483166 ?auto_483170 ) ) ( not ( = ?auto_483166 ?auto_483171 ) ) ( not ( = ?auto_483166 ?auto_483172 ) ) ( not ( = ?auto_483166 ?auto_483173 ) ) ( not ( = ?auto_483167 ?auto_483168 ) ) ( not ( = ?auto_483167 ?auto_483169 ) ) ( not ( = ?auto_483167 ?auto_483170 ) ) ( not ( = ?auto_483167 ?auto_483171 ) ) ( not ( = ?auto_483167 ?auto_483172 ) ) ( not ( = ?auto_483167 ?auto_483173 ) ) ( not ( = ?auto_483168 ?auto_483169 ) ) ( not ( = ?auto_483168 ?auto_483170 ) ) ( not ( = ?auto_483168 ?auto_483171 ) ) ( not ( = ?auto_483168 ?auto_483172 ) ) ( not ( = ?auto_483168 ?auto_483173 ) ) ( not ( = ?auto_483169 ?auto_483170 ) ) ( not ( = ?auto_483169 ?auto_483171 ) ) ( not ( = ?auto_483169 ?auto_483172 ) ) ( not ( = ?auto_483169 ?auto_483173 ) ) ( not ( = ?auto_483170 ?auto_483171 ) ) ( not ( = ?auto_483170 ?auto_483172 ) ) ( not ( = ?auto_483170 ?auto_483173 ) ) ( not ( = ?auto_483171 ?auto_483172 ) ) ( not ( = ?auto_483171 ?auto_483173 ) ) ( not ( = ?auto_483172 ?auto_483173 ) ) ( ON ?auto_483171 ?auto_483172 ) ( ON ?auto_483170 ?auto_483171 ) ( ON ?auto_483169 ?auto_483170 ) ( ON ?auto_483168 ?auto_483169 ) ( ON ?auto_483167 ?auto_483168 ) ( ON ?auto_483166 ?auto_483167 ) ( CLEAR ?auto_483164 ) ( ON ?auto_483165 ?auto_483166 ) ( CLEAR ?auto_483165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_483157 ?auto_483158 ?auto_483159 ?auto_483160 ?auto_483161 ?auto_483162 ?auto_483163 ?auto_483164 ?auto_483165 )
      ( MAKE-16PILE ?auto_483157 ?auto_483158 ?auto_483159 ?auto_483160 ?auto_483161 ?auto_483162 ?auto_483163 ?auto_483164 ?auto_483165 ?auto_483166 ?auto_483167 ?auto_483168 ?auto_483169 ?auto_483170 ?auto_483171 ?auto_483172 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483190 - BLOCK
      ?auto_483191 - BLOCK
      ?auto_483192 - BLOCK
      ?auto_483193 - BLOCK
      ?auto_483194 - BLOCK
      ?auto_483195 - BLOCK
      ?auto_483196 - BLOCK
      ?auto_483197 - BLOCK
      ?auto_483198 - BLOCK
      ?auto_483199 - BLOCK
      ?auto_483200 - BLOCK
      ?auto_483201 - BLOCK
      ?auto_483202 - BLOCK
      ?auto_483203 - BLOCK
      ?auto_483204 - BLOCK
      ?auto_483205 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_483205 ) ( ON-TABLE ?auto_483190 ) ( ON ?auto_483191 ?auto_483190 ) ( ON ?auto_483192 ?auto_483191 ) ( ON ?auto_483193 ?auto_483192 ) ( ON ?auto_483194 ?auto_483193 ) ( ON ?auto_483195 ?auto_483194 ) ( ON ?auto_483196 ?auto_483195 ) ( ON ?auto_483197 ?auto_483196 ) ( not ( = ?auto_483190 ?auto_483191 ) ) ( not ( = ?auto_483190 ?auto_483192 ) ) ( not ( = ?auto_483190 ?auto_483193 ) ) ( not ( = ?auto_483190 ?auto_483194 ) ) ( not ( = ?auto_483190 ?auto_483195 ) ) ( not ( = ?auto_483190 ?auto_483196 ) ) ( not ( = ?auto_483190 ?auto_483197 ) ) ( not ( = ?auto_483190 ?auto_483198 ) ) ( not ( = ?auto_483190 ?auto_483199 ) ) ( not ( = ?auto_483190 ?auto_483200 ) ) ( not ( = ?auto_483190 ?auto_483201 ) ) ( not ( = ?auto_483190 ?auto_483202 ) ) ( not ( = ?auto_483190 ?auto_483203 ) ) ( not ( = ?auto_483190 ?auto_483204 ) ) ( not ( = ?auto_483190 ?auto_483205 ) ) ( not ( = ?auto_483191 ?auto_483192 ) ) ( not ( = ?auto_483191 ?auto_483193 ) ) ( not ( = ?auto_483191 ?auto_483194 ) ) ( not ( = ?auto_483191 ?auto_483195 ) ) ( not ( = ?auto_483191 ?auto_483196 ) ) ( not ( = ?auto_483191 ?auto_483197 ) ) ( not ( = ?auto_483191 ?auto_483198 ) ) ( not ( = ?auto_483191 ?auto_483199 ) ) ( not ( = ?auto_483191 ?auto_483200 ) ) ( not ( = ?auto_483191 ?auto_483201 ) ) ( not ( = ?auto_483191 ?auto_483202 ) ) ( not ( = ?auto_483191 ?auto_483203 ) ) ( not ( = ?auto_483191 ?auto_483204 ) ) ( not ( = ?auto_483191 ?auto_483205 ) ) ( not ( = ?auto_483192 ?auto_483193 ) ) ( not ( = ?auto_483192 ?auto_483194 ) ) ( not ( = ?auto_483192 ?auto_483195 ) ) ( not ( = ?auto_483192 ?auto_483196 ) ) ( not ( = ?auto_483192 ?auto_483197 ) ) ( not ( = ?auto_483192 ?auto_483198 ) ) ( not ( = ?auto_483192 ?auto_483199 ) ) ( not ( = ?auto_483192 ?auto_483200 ) ) ( not ( = ?auto_483192 ?auto_483201 ) ) ( not ( = ?auto_483192 ?auto_483202 ) ) ( not ( = ?auto_483192 ?auto_483203 ) ) ( not ( = ?auto_483192 ?auto_483204 ) ) ( not ( = ?auto_483192 ?auto_483205 ) ) ( not ( = ?auto_483193 ?auto_483194 ) ) ( not ( = ?auto_483193 ?auto_483195 ) ) ( not ( = ?auto_483193 ?auto_483196 ) ) ( not ( = ?auto_483193 ?auto_483197 ) ) ( not ( = ?auto_483193 ?auto_483198 ) ) ( not ( = ?auto_483193 ?auto_483199 ) ) ( not ( = ?auto_483193 ?auto_483200 ) ) ( not ( = ?auto_483193 ?auto_483201 ) ) ( not ( = ?auto_483193 ?auto_483202 ) ) ( not ( = ?auto_483193 ?auto_483203 ) ) ( not ( = ?auto_483193 ?auto_483204 ) ) ( not ( = ?auto_483193 ?auto_483205 ) ) ( not ( = ?auto_483194 ?auto_483195 ) ) ( not ( = ?auto_483194 ?auto_483196 ) ) ( not ( = ?auto_483194 ?auto_483197 ) ) ( not ( = ?auto_483194 ?auto_483198 ) ) ( not ( = ?auto_483194 ?auto_483199 ) ) ( not ( = ?auto_483194 ?auto_483200 ) ) ( not ( = ?auto_483194 ?auto_483201 ) ) ( not ( = ?auto_483194 ?auto_483202 ) ) ( not ( = ?auto_483194 ?auto_483203 ) ) ( not ( = ?auto_483194 ?auto_483204 ) ) ( not ( = ?auto_483194 ?auto_483205 ) ) ( not ( = ?auto_483195 ?auto_483196 ) ) ( not ( = ?auto_483195 ?auto_483197 ) ) ( not ( = ?auto_483195 ?auto_483198 ) ) ( not ( = ?auto_483195 ?auto_483199 ) ) ( not ( = ?auto_483195 ?auto_483200 ) ) ( not ( = ?auto_483195 ?auto_483201 ) ) ( not ( = ?auto_483195 ?auto_483202 ) ) ( not ( = ?auto_483195 ?auto_483203 ) ) ( not ( = ?auto_483195 ?auto_483204 ) ) ( not ( = ?auto_483195 ?auto_483205 ) ) ( not ( = ?auto_483196 ?auto_483197 ) ) ( not ( = ?auto_483196 ?auto_483198 ) ) ( not ( = ?auto_483196 ?auto_483199 ) ) ( not ( = ?auto_483196 ?auto_483200 ) ) ( not ( = ?auto_483196 ?auto_483201 ) ) ( not ( = ?auto_483196 ?auto_483202 ) ) ( not ( = ?auto_483196 ?auto_483203 ) ) ( not ( = ?auto_483196 ?auto_483204 ) ) ( not ( = ?auto_483196 ?auto_483205 ) ) ( not ( = ?auto_483197 ?auto_483198 ) ) ( not ( = ?auto_483197 ?auto_483199 ) ) ( not ( = ?auto_483197 ?auto_483200 ) ) ( not ( = ?auto_483197 ?auto_483201 ) ) ( not ( = ?auto_483197 ?auto_483202 ) ) ( not ( = ?auto_483197 ?auto_483203 ) ) ( not ( = ?auto_483197 ?auto_483204 ) ) ( not ( = ?auto_483197 ?auto_483205 ) ) ( not ( = ?auto_483198 ?auto_483199 ) ) ( not ( = ?auto_483198 ?auto_483200 ) ) ( not ( = ?auto_483198 ?auto_483201 ) ) ( not ( = ?auto_483198 ?auto_483202 ) ) ( not ( = ?auto_483198 ?auto_483203 ) ) ( not ( = ?auto_483198 ?auto_483204 ) ) ( not ( = ?auto_483198 ?auto_483205 ) ) ( not ( = ?auto_483199 ?auto_483200 ) ) ( not ( = ?auto_483199 ?auto_483201 ) ) ( not ( = ?auto_483199 ?auto_483202 ) ) ( not ( = ?auto_483199 ?auto_483203 ) ) ( not ( = ?auto_483199 ?auto_483204 ) ) ( not ( = ?auto_483199 ?auto_483205 ) ) ( not ( = ?auto_483200 ?auto_483201 ) ) ( not ( = ?auto_483200 ?auto_483202 ) ) ( not ( = ?auto_483200 ?auto_483203 ) ) ( not ( = ?auto_483200 ?auto_483204 ) ) ( not ( = ?auto_483200 ?auto_483205 ) ) ( not ( = ?auto_483201 ?auto_483202 ) ) ( not ( = ?auto_483201 ?auto_483203 ) ) ( not ( = ?auto_483201 ?auto_483204 ) ) ( not ( = ?auto_483201 ?auto_483205 ) ) ( not ( = ?auto_483202 ?auto_483203 ) ) ( not ( = ?auto_483202 ?auto_483204 ) ) ( not ( = ?auto_483202 ?auto_483205 ) ) ( not ( = ?auto_483203 ?auto_483204 ) ) ( not ( = ?auto_483203 ?auto_483205 ) ) ( not ( = ?auto_483204 ?auto_483205 ) ) ( ON ?auto_483204 ?auto_483205 ) ( ON ?auto_483203 ?auto_483204 ) ( ON ?auto_483202 ?auto_483203 ) ( ON ?auto_483201 ?auto_483202 ) ( ON ?auto_483200 ?auto_483201 ) ( ON ?auto_483199 ?auto_483200 ) ( CLEAR ?auto_483197 ) ( ON ?auto_483198 ?auto_483199 ) ( CLEAR ?auto_483198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_483190 ?auto_483191 ?auto_483192 ?auto_483193 ?auto_483194 ?auto_483195 ?auto_483196 ?auto_483197 ?auto_483198 )
      ( MAKE-16PILE ?auto_483190 ?auto_483191 ?auto_483192 ?auto_483193 ?auto_483194 ?auto_483195 ?auto_483196 ?auto_483197 ?auto_483198 ?auto_483199 ?auto_483200 ?auto_483201 ?auto_483202 ?auto_483203 ?auto_483204 ?auto_483205 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483222 - BLOCK
      ?auto_483223 - BLOCK
      ?auto_483224 - BLOCK
      ?auto_483225 - BLOCK
      ?auto_483226 - BLOCK
      ?auto_483227 - BLOCK
      ?auto_483228 - BLOCK
      ?auto_483229 - BLOCK
      ?auto_483230 - BLOCK
      ?auto_483231 - BLOCK
      ?auto_483232 - BLOCK
      ?auto_483233 - BLOCK
      ?auto_483234 - BLOCK
      ?auto_483235 - BLOCK
      ?auto_483236 - BLOCK
      ?auto_483237 - BLOCK
    )
    :vars
    (
      ?auto_483238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483237 ?auto_483238 ) ( ON-TABLE ?auto_483222 ) ( ON ?auto_483223 ?auto_483222 ) ( ON ?auto_483224 ?auto_483223 ) ( ON ?auto_483225 ?auto_483224 ) ( ON ?auto_483226 ?auto_483225 ) ( ON ?auto_483227 ?auto_483226 ) ( ON ?auto_483228 ?auto_483227 ) ( not ( = ?auto_483222 ?auto_483223 ) ) ( not ( = ?auto_483222 ?auto_483224 ) ) ( not ( = ?auto_483222 ?auto_483225 ) ) ( not ( = ?auto_483222 ?auto_483226 ) ) ( not ( = ?auto_483222 ?auto_483227 ) ) ( not ( = ?auto_483222 ?auto_483228 ) ) ( not ( = ?auto_483222 ?auto_483229 ) ) ( not ( = ?auto_483222 ?auto_483230 ) ) ( not ( = ?auto_483222 ?auto_483231 ) ) ( not ( = ?auto_483222 ?auto_483232 ) ) ( not ( = ?auto_483222 ?auto_483233 ) ) ( not ( = ?auto_483222 ?auto_483234 ) ) ( not ( = ?auto_483222 ?auto_483235 ) ) ( not ( = ?auto_483222 ?auto_483236 ) ) ( not ( = ?auto_483222 ?auto_483237 ) ) ( not ( = ?auto_483222 ?auto_483238 ) ) ( not ( = ?auto_483223 ?auto_483224 ) ) ( not ( = ?auto_483223 ?auto_483225 ) ) ( not ( = ?auto_483223 ?auto_483226 ) ) ( not ( = ?auto_483223 ?auto_483227 ) ) ( not ( = ?auto_483223 ?auto_483228 ) ) ( not ( = ?auto_483223 ?auto_483229 ) ) ( not ( = ?auto_483223 ?auto_483230 ) ) ( not ( = ?auto_483223 ?auto_483231 ) ) ( not ( = ?auto_483223 ?auto_483232 ) ) ( not ( = ?auto_483223 ?auto_483233 ) ) ( not ( = ?auto_483223 ?auto_483234 ) ) ( not ( = ?auto_483223 ?auto_483235 ) ) ( not ( = ?auto_483223 ?auto_483236 ) ) ( not ( = ?auto_483223 ?auto_483237 ) ) ( not ( = ?auto_483223 ?auto_483238 ) ) ( not ( = ?auto_483224 ?auto_483225 ) ) ( not ( = ?auto_483224 ?auto_483226 ) ) ( not ( = ?auto_483224 ?auto_483227 ) ) ( not ( = ?auto_483224 ?auto_483228 ) ) ( not ( = ?auto_483224 ?auto_483229 ) ) ( not ( = ?auto_483224 ?auto_483230 ) ) ( not ( = ?auto_483224 ?auto_483231 ) ) ( not ( = ?auto_483224 ?auto_483232 ) ) ( not ( = ?auto_483224 ?auto_483233 ) ) ( not ( = ?auto_483224 ?auto_483234 ) ) ( not ( = ?auto_483224 ?auto_483235 ) ) ( not ( = ?auto_483224 ?auto_483236 ) ) ( not ( = ?auto_483224 ?auto_483237 ) ) ( not ( = ?auto_483224 ?auto_483238 ) ) ( not ( = ?auto_483225 ?auto_483226 ) ) ( not ( = ?auto_483225 ?auto_483227 ) ) ( not ( = ?auto_483225 ?auto_483228 ) ) ( not ( = ?auto_483225 ?auto_483229 ) ) ( not ( = ?auto_483225 ?auto_483230 ) ) ( not ( = ?auto_483225 ?auto_483231 ) ) ( not ( = ?auto_483225 ?auto_483232 ) ) ( not ( = ?auto_483225 ?auto_483233 ) ) ( not ( = ?auto_483225 ?auto_483234 ) ) ( not ( = ?auto_483225 ?auto_483235 ) ) ( not ( = ?auto_483225 ?auto_483236 ) ) ( not ( = ?auto_483225 ?auto_483237 ) ) ( not ( = ?auto_483225 ?auto_483238 ) ) ( not ( = ?auto_483226 ?auto_483227 ) ) ( not ( = ?auto_483226 ?auto_483228 ) ) ( not ( = ?auto_483226 ?auto_483229 ) ) ( not ( = ?auto_483226 ?auto_483230 ) ) ( not ( = ?auto_483226 ?auto_483231 ) ) ( not ( = ?auto_483226 ?auto_483232 ) ) ( not ( = ?auto_483226 ?auto_483233 ) ) ( not ( = ?auto_483226 ?auto_483234 ) ) ( not ( = ?auto_483226 ?auto_483235 ) ) ( not ( = ?auto_483226 ?auto_483236 ) ) ( not ( = ?auto_483226 ?auto_483237 ) ) ( not ( = ?auto_483226 ?auto_483238 ) ) ( not ( = ?auto_483227 ?auto_483228 ) ) ( not ( = ?auto_483227 ?auto_483229 ) ) ( not ( = ?auto_483227 ?auto_483230 ) ) ( not ( = ?auto_483227 ?auto_483231 ) ) ( not ( = ?auto_483227 ?auto_483232 ) ) ( not ( = ?auto_483227 ?auto_483233 ) ) ( not ( = ?auto_483227 ?auto_483234 ) ) ( not ( = ?auto_483227 ?auto_483235 ) ) ( not ( = ?auto_483227 ?auto_483236 ) ) ( not ( = ?auto_483227 ?auto_483237 ) ) ( not ( = ?auto_483227 ?auto_483238 ) ) ( not ( = ?auto_483228 ?auto_483229 ) ) ( not ( = ?auto_483228 ?auto_483230 ) ) ( not ( = ?auto_483228 ?auto_483231 ) ) ( not ( = ?auto_483228 ?auto_483232 ) ) ( not ( = ?auto_483228 ?auto_483233 ) ) ( not ( = ?auto_483228 ?auto_483234 ) ) ( not ( = ?auto_483228 ?auto_483235 ) ) ( not ( = ?auto_483228 ?auto_483236 ) ) ( not ( = ?auto_483228 ?auto_483237 ) ) ( not ( = ?auto_483228 ?auto_483238 ) ) ( not ( = ?auto_483229 ?auto_483230 ) ) ( not ( = ?auto_483229 ?auto_483231 ) ) ( not ( = ?auto_483229 ?auto_483232 ) ) ( not ( = ?auto_483229 ?auto_483233 ) ) ( not ( = ?auto_483229 ?auto_483234 ) ) ( not ( = ?auto_483229 ?auto_483235 ) ) ( not ( = ?auto_483229 ?auto_483236 ) ) ( not ( = ?auto_483229 ?auto_483237 ) ) ( not ( = ?auto_483229 ?auto_483238 ) ) ( not ( = ?auto_483230 ?auto_483231 ) ) ( not ( = ?auto_483230 ?auto_483232 ) ) ( not ( = ?auto_483230 ?auto_483233 ) ) ( not ( = ?auto_483230 ?auto_483234 ) ) ( not ( = ?auto_483230 ?auto_483235 ) ) ( not ( = ?auto_483230 ?auto_483236 ) ) ( not ( = ?auto_483230 ?auto_483237 ) ) ( not ( = ?auto_483230 ?auto_483238 ) ) ( not ( = ?auto_483231 ?auto_483232 ) ) ( not ( = ?auto_483231 ?auto_483233 ) ) ( not ( = ?auto_483231 ?auto_483234 ) ) ( not ( = ?auto_483231 ?auto_483235 ) ) ( not ( = ?auto_483231 ?auto_483236 ) ) ( not ( = ?auto_483231 ?auto_483237 ) ) ( not ( = ?auto_483231 ?auto_483238 ) ) ( not ( = ?auto_483232 ?auto_483233 ) ) ( not ( = ?auto_483232 ?auto_483234 ) ) ( not ( = ?auto_483232 ?auto_483235 ) ) ( not ( = ?auto_483232 ?auto_483236 ) ) ( not ( = ?auto_483232 ?auto_483237 ) ) ( not ( = ?auto_483232 ?auto_483238 ) ) ( not ( = ?auto_483233 ?auto_483234 ) ) ( not ( = ?auto_483233 ?auto_483235 ) ) ( not ( = ?auto_483233 ?auto_483236 ) ) ( not ( = ?auto_483233 ?auto_483237 ) ) ( not ( = ?auto_483233 ?auto_483238 ) ) ( not ( = ?auto_483234 ?auto_483235 ) ) ( not ( = ?auto_483234 ?auto_483236 ) ) ( not ( = ?auto_483234 ?auto_483237 ) ) ( not ( = ?auto_483234 ?auto_483238 ) ) ( not ( = ?auto_483235 ?auto_483236 ) ) ( not ( = ?auto_483235 ?auto_483237 ) ) ( not ( = ?auto_483235 ?auto_483238 ) ) ( not ( = ?auto_483236 ?auto_483237 ) ) ( not ( = ?auto_483236 ?auto_483238 ) ) ( not ( = ?auto_483237 ?auto_483238 ) ) ( ON ?auto_483236 ?auto_483237 ) ( ON ?auto_483235 ?auto_483236 ) ( ON ?auto_483234 ?auto_483235 ) ( ON ?auto_483233 ?auto_483234 ) ( ON ?auto_483232 ?auto_483233 ) ( ON ?auto_483231 ?auto_483232 ) ( ON ?auto_483230 ?auto_483231 ) ( CLEAR ?auto_483228 ) ( ON ?auto_483229 ?auto_483230 ) ( CLEAR ?auto_483229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_483222 ?auto_483223 ?auto_483224 ?auto_483225 ?auto_483226 ?auto_483227 ?auto_483228 ?auto_483229 )
      ( MAKE-16PILE ?auto_483222 ?auto_483223 ?auto_483224 ?auto_483225 ?auto_483226 ?auto_483227 ?auto_483228 ?auto_483229 ?auto_483230 ?auto_483231 ?auto_483232 ?auto_483233 ?auto_483234 ?auto_483235 ?auto_483236 ?auto_483237 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483255 - BLOCK
      ?auto_483256 - BLOCK
      ?auto_483257 - BLOCK
      ?auto_483258 - BLOCK
      ?auto_483259 - BLOCK
      ?auto_483260 - BLOCK
      ?auto_483261 - BLOCK
      ?auto_483262 - BLOCK
      ?auto_483263 - BLOCK
      ?auto_483264 - BLOCK
      ?auto_483265 - BLOCK
      ?auto_483266 - BLOCK
      ?auto_483267 - BLOCK
      ?auto_483268 - BLOCK
      ?auto_483269 - BLOCK
      ?auto_483270 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_483270 ) ( ON-TABLE ?auto_483255 ) ( ON ?auto_483256 ?auto_483255 ) ( ON ?auto_483257 ?auto_483256 ) ( ON ?auto_483258 ?auto_483257 ) ( ON ?auto_483259 ?auto_483258 ) ( ON ?auto_483260 ?auto_483259 ) ( ON ?auto_483261 ?auto_483260 ) ( not ( = ?auto_483255 ?auto_483256 ) ) ( not ( = ?auto_483255 ?auto_483257 ) ) ( not ( = ?auto_483255 ?auto_483258 ) ) ( not ( = ?auto_483255 ?auto_483259 ) ) ( not ( = ?auto_483255 ?auto_483260 ) ) ( not ( = ?auto_483255 ?auto_483261 ) ) ( not ( = ?auto_483255 ?auto_483262 ) ) ( not ( = ?auto_483255 ?auto_483263 ) ) ( not ( = ?auto_483255 ?auto_483264 ) ) ( not ( = ?auto_483255 ?auto_483265 ) ) ( not ( = ?auto_483255 ?auto_483266 ) ) ( not ( = ?auto_483255 ?auto_483267 ) ) ( not ( = ?auto_483255 ?auto_483268 ) ) ( not ( = ?auto_483255 ?auto_483269 ) ) ( not ( = ?auto_483255 ?auto_483270 ) ) ( not ( = ?auto_483256 ?auto_483257 ) ) ( not ( = ?auto_483256 ?auto_483258 ) ) ( not ( = ?auto_483256 ?auto_483259 ) ) ( not ( = ?auto_483256 ?auto_483260 ) ) ( not ( = ?auto_483256 ?auto_483261 ) ) ( not ( = ?auto_483256 ?auto_483262 ) ) ( not ( = ?auto_483256 ?auto_483263 ) ) ( not ( = ?auto_483256 ?auto_483264 ) ) ( not ( = ?auto_483256 ?auto_483265 ) ) ( not ( = ?auto_483256 ?auto_483266 ) ) ( not ( = ?auto_483256 ?auto_483267 ) ) ( not ( = ?auto_483256 ?auto_483268 ) ) ( not ( = ?auto_483256 ?auto_483269 ) ) ( not ( = ?auto_483256 ?auto_483270 ) ) ( not ( = ?auto_483257 ?auto_483258 ) ) ( not ( = ?auto_483257 ?auto_483259 ) ) ( not ( = ?auto_483257 ?auto_483260 ) ) ( not ( = ?auto_483257 ?auto_483261 ) ) ( not ( = ?auto_483257 ?auto_483262 ) ) ( not ( = ?auto_483257 ?auto_483263 ) ) ( not ( = ?auto_483257 ?auto_483264 ) ) ( not ( = ?auto_483257 ?auto_483265 ) ) ( not ( = ?auto_483257 ?auto_483266 ) ) ( not ( = ?auto_483257 ?auto_483267 ) ) ( not ( = ?auto_483257 ?auto_483268 ) ) ( not ( = ?auto_483257 ?auto_483269 ) ) ( not ( = ?auto_483257 ?auto_483270 ) ) ( not ( = ?auto_483258 ?auto_483259 ) ) ( not ( = ?auto_483258 ?auto_483260 ) ) ( not ( = ?auto_483258 ?auto_483261 ) ) ( not ( = ?auto_483258 ?auto_483262 ) ) ( not ( = ?auto_483258 ?auto_483263 ) ) ( not ( = ?auto_483258 ?auto_483264 ) ) ( not ( = ?auto_483258 ?auto_483265 ) ) ( not ( = ?auto_483258 ?auto_483266 ) ) ( not ( = ?auto_483258 ?auto_483267 ) ) ( not ( = ?auto_483258 ?auto_483268 ) ) ( not ( = ?auto_483258 ?auto_483269 ) ) ( not ( = ?auto_483258 ?auto_483270 ) ) ( not ( = ?auto_483259 ?auto_483260 ) ) ( not ( = ?auto_483259 ?auto_483261 ) ) ( not ( = ?auto_483259 ?auto_483262 ) ) ( not ( = ?auto_483259 ?auto_483263 ) ) ( not ( = ?auto_483259 ?auto_483264 ) ) ( not ( = ?auto_483259 ?auto_483265 ) ) ( not ( = ?auto_483259 ?auto_483266 ) ) ( not ( = ?auto_483259 ?auto_483267 ) ) ( not ( = ?auto_483259 ?auto_483268 ) ) ( not ( = ?auto_483259 ?auto_483269 ) ) ( not ( = ?auto_483259 ?auto_483270 ) ) ( not ( = ?auto_483260 ?auto_483261 ) ) ( not ( = ?auto_483260 ?auto_483262 ) ) ( not ( = ?auto_483260 ?auto_483263 ) ) ( not ( = ?auto_483260 ?auto_483264 ) ) ( not ( = ?auto_483260 ?auto_483265 ) ) ( not ( = ?auto_483260 ?auto_483266 ) ) ( not ( = ?auto_483260 ?auto_483267 ) ) ( not ( = ?auto_483260 ?auto_483268 ) ) ( not ( = ?auto_483260 ?auto_483269 ) ) ( not ( = ?auto_483260 ?auto_483270 ) ) ( not ( = ?auto_483261 ?auto_483262 ) ) ( not ( = ?auto_483261 ?auto_483263 ) ) ( not ( = ?auto_483261 ?auto_483264 ) ) ( not ( = ?auto_483261 ?auto_483265 ) ) ( not ( = ?auto_483261 ?auto_483266 ) ) ( not ( = ?auto_483261 ?auto_483267 ) ) ( not ( = ?auto_483261 ?auto_483268 ) ) ( not ( = ?auto_483261 ?auto_483269 ) ) ( not ( = ?auto_483261 ?auto_483270 ) ) ( not ( = ?auto_483262 ?auto_483263 ) ) ( not ( = ?auto_483262 ?auto_483264 ) ) ( not ( = ?auto_483262 ?auto_483265 ) ) ( not ( = ?auto_483262 ?auto_483266 ) ) ( not ( = ?auto_483262 ?auto_483267 ) ) ( not ( = ?auto_483262 ?auto_483268 ) ) ( not ( = ?auto_483262 ?auto_483269 ) ) ( not ( = ?auto_483262 ?auto_483270 ) ) ( not ( = ?auto_483263 ?auto_483264 ) ) ( not ( = ?auto_483263 ?auto_483265 ) ) ( not ( = ?auto_483263 ?auto_483266 ) ) ( not ( = ?auto_483263 ?auto_483267 ) ) ( not ( = ?auto_483263 ?auto_483268 ) ) ( not ( = ?auto_483263 ?auto_483269 ) ) ( not ( = ?auto_483263 ?auto_483270 ) ) ( not ( = ?auto_483264 ?auto_483265 ) ) ( not ( = ?auto_483264 ?auto_483266 ) ) ( not ( = ?auto_483264 ?auto_483267 ) ) ( not ( = ?auto_483264 ?auto_483268 ) ) ( not ( = ?auto_483264 ?auto_483269 ) ) ( not ( = ?auto_483264 ?auto_483270 ) ) ( not ( = ?auto_483265 ?auto_483266 ) ) ( not ( = ?auto_483265 ?auto_483267 ) ) ( not ( = ?auto_483265 ?auto_483268 ) ) ( not ( = ?auto_483265 ?auto_483269 ) ) ( not ( = ?auto_483265 ?auto_483270 ) ) ( not ( = ?auto_483266 ?auto_483267 ) ) ( not ( = ?auto_483266 ?auto_483268 ) ) ( not ( = ?auto_483266 ?auto_483269 ) ) ( not ( = ?auto_483266 ?auto_483270 ) ) ( not ( = ?auto_483267 ?auto_483268 ) ) ( not ( = ?auto_483267 ?auto_483269 ) ) ( not ( = ?auto_483267 ?auto_483270 ) ) ( not ( = ?auto_483268 ?auto_483269 ) ) ( not ( = ?auto_483268 ?auto_483270 ) ) ( not ( = ?auto_483269 ?auto_483270 ) ) ( ON ?auto_483269 ?auto_483270 ) ( ON ?auto_483268 ?auto_483269 ) ( ON ?auto_483267 ?auto_483268 ) ( ON ?auto_483266 ?auto_483267 ) ( ON ?auto_483265 ?auto_483266 ) ( ON ?auto_483264 ?auto_483265 ) ( ON ?auto_483263 ?auto_483264 ) ( CLEAR ?auto_483261 ) ( ON ?auto_483262 ?auto_483263 ) ( CLEAR ?auto_483262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_483255 ?auto_483256 ?auto_483257 ?auto_483258 ?auto_483259 ?auto_483260 ?auto_483261 ?auto_483262 )
      ( MAKE-16PILE ?auto_483255 ?auto_483256 ?auto_483257 ?auto_483258 ?auto_483259 ?auto_483260 ?auto_483261 ?auto_483262 ?auto_483263 ?auto_483264 ?auto_483265 ?auto_483266 ?auto_483267 ?auto_483268 ?auto_483269 ?auto_483270 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483287 - BLOCK
      ?auto_483288 - BLOCK
      ?auto_483289 - BLOCK
      ?auto_483290 - BLOCK
      ?auto_483291 - BLOCK
      ?auto_483292 - BLOCK
      ?auto_483293 - BLOCK
      ?auto_483294 - BLOCK
      ?auto_483295 - BLOCK
      ?auto_483296 - BLOCK
      ?auto_483297 - BLOCK
      ?auto_483298 - BLOCK
      ?auto_483299 - BLOCK
      ?auto_483300 - BLOCK
      ?auto_483301 - BLOCK
      ?auto_483302 - BLOCK
    )
    :vars
    (
      ?auto_483303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483302 ?auto_483303 ) ( ON-TABLE ?auto_483287 ) ( ON ?auto_483288 ?auto_483287 ) ( ON ?auto_483289 ?auto_483288 ) ( ON ?auto_483290 ?auto_483289 ) ( ON ?auto_483291 ?auto_483290 ) ( ON ?auto_483292 ?auto_483291 ) ( not ( = ?auto_483287 ?auto_483288 ) ) ( not ( = ?auto_483287 ?auto_483289 ) ) ( not ( = ?auto_483287 ?auto_483290 ) ) ( not ( = ?auto_483287 ?auto_483291 ) ) ( not ( = ?auto_483287 ?auto_483292 ) ) ( not ( = ?auto_483287 ?auto_483293 ) ) ( not ( = ?auto_483287 ?auto_483294 ) ) ( not ( = ?auto_483287 ?auto_483295 ) ) ( not ( = ?auto_483287 ?auto_483296 ) ) ( not ( = ?auto_483287 ?auto_483297 ) ) ( not ( = ?auto_483287 ?auto_483298 ) ) ( not ( = ?auto_483287 ?auto_483299 ) ) ( not ( = ?auto_483287 ?auto_483300 ) ) ( not ( = ?auto_483287 ?auto_483301 ) ) ( not ( = ?auto_483287 ?auto_483302 ) ) ( not ( = ?auto_483287 ?auto_483303 ) ) ( not ( = ?auto_483288 ?auto_483289 ) ) ( not ( = ?auto_483288 ?auto_483290 ) ) ( not ( = ?auto_483288 ?auto_483291 ) ) ( not ( = ?auto_483288 ?auto_483292 ) ) ( not ( = ?auto_483288 ?auto_483293 ) ) ( not ( = ?auto_483288 ?auto_483294 ) ) ( not ( = ?auto_483288 ?auto_483295 ) ) ( not ( = ?auto_483288 ?auto_483296 ) ) ( not ( = ?auto_483288 ?auto_483297 ) ) ( not ( = ?auto_483288 ?auto_483298 ) ) ( not ( = ?auto_483288 ?auto_483299 ) ) ( not ( = ?auto_483288 ?auto_483300 ) ) ( not ( = ?auto_483288 ?auto_483301 ) ) ( not ( = ?auto_483288 ?auto_483302 ) ) ( not ( = ?auto_483288 ?auto_483303 ) ) ( not ( = ?auto_483289 ?auto_483290 ) ) ( not ( = ?auto_483289 ?auto_483291 ) ) ( not ( = ?auto_483289 ?auto_483292 ) ) ( not ( = ?auto_483289 ?auto_483293 ) ) ( not ( = ?auto_483289 ?auto_483294 ) ) ( not ( = ?auto_483289 ?auto_483295 ) ) ( not ( = ?auto_483289 ?auto_483296 ) ) ( not ( = ?auto_483289 ?auto_483297 ) ) ( not ( = ?auto_483289 ?auto_483298 ) ) ( not ( = ?auto_483289 ?auto_483299 ) ) ( not ( = ?auto_483289 ?auto_483300 ) ) ( not ( = ?auto_483289 ?auto_483301 ) ) ( not ( = ?auto_483289 ?auto_483302 ) ) ( not ( = ?auto_483289 ?auto_483303 ) ) ( not ( = ?auto_483290 ?auto_483291 ) ) ( not ( = ?auto_483290 ?auto_483292 ) ) ( not ( = ?auto_483290 ?auto_483293 ) ) ( not ( = ?auto_483290 ?auto_483294 ) ) ( not ( = ?auto_483290 ?auto_483295 ) ) ( not ( = ?auto_483290 ?auto_483296 ) ) ( not ( = ?auto_483290 ?auto_483297 ) ) ( not ( = ?auto_483290 ?auto_483298 ) ) ( not ( = ?auto_483290 ?auto_483299 ) ) ( not ( = ?auto_483290 ?auto_483300 ) ) ( not ( = ?auto_483290 ?auto_483301 ) ) ( not ( = ?auto_483290 ?auto_483302 ) ) ( not ( = ?auto_483290 ?auto_483303 ) ) ( not ( = ?auto_483291 ?auto_483292 ) ) ( not ( = ?auto_483291 ?auto_483293 ) ) ( not ( = ?auto_483291 ?auto_483294 ) ) ( not ( = ?auto_483291 ?auto_483295 ) ) ( not ( = ?auto_483291 ?auto_483296 ) ) ( not ( = ?auto_483291 ?auto_483297 ) ) ( not ( = ?auto_483291 ?auto_483298 ) ) ( not ( = ?auto_483291 ?auto_483299 ) ) ( not ( = ?auto_483291 ?auto_483300 ) ) ( not ( = ?auto_483291 ?auto_483301 ) ) ( not ( = ?auto_483291 ?auto_483302 ) ) ( not ( = ?auto_483291 ?auto_483303 ) ) ( not ( = ?auto_483292 ?auto_483293 ) ) ( not ( = ?auto_483292 ?auto_483294 ) ) ( not ( = ?auto_483292 ?auto_483295 ) ) ( not ( = ?auto_483292 ?auto_483296 ) ) ( not ( = ?auto_483292 ?auto_483297 ) ) ( not ( = ?auto_483292 ?auto_483298 ) ) ( not ( = ?auto_483292 ?auto_483299 ) ) ( not ( = ?auto_483292 ?auto_483300 ) ) ( not ( = ?auto_483292 ?auto_483301 ) ) ( not ( = ?auto_483292 ?auto_483302 ) ) ( not ( = ?auto_483292 ?auto_483303 ) ) ( not ( = ?auto_483293 ?auto_483294 ) ) ( not ( = ?auto_483293 ?auto_483295 ) ) ( not ( = ?auto_483293 ?auto_483296 ) ) ( not ( = ?auto_483293 ?auto_483297 ) ) ( not ( = ?auto_483293 ?auto_483298 ) ) ( not ( = ?auto_483293 ?auto_483299 ) ) ( not ( = ?auto_483293 ?auto_483300 ) ) ( not ( = ?auto_483293 ?auto_483301 ) ) ( not ( = ?auto_483293 ?auto_483302 ) ) ( not ( = ?auto_483293 ?auto_483303 ) ) ( not ( = ?auto_483294 ?auto_483295 ) ) ( not ( = ?auto_483294 ?auto_483296 ) ) ( not ( = ?auto_483294 ?auto_483297 ) ) ( not ( = ?auto_483294 ?auto_483298 ) ) ( not ( = ?auto_483294 ?auto_483299 ) ) ( not ( = ?auto_483294 ?auto_483300 ) ) ( not ( = ?auto_483294 ?auto_483301 ) ) ( not ( = ?auto_483294 ?auto_483302 ) ) ( not ( = ?auto_483294 ?auto_483303 ) ) ( not ( = ?auto_483295 ?auto_483296 ) ) ( not ( = ?auto_483295 ?auto_483297 ) ) ( not ( = ?auto_483295 ?auto_483298 ) ) ( not ( = ?auto_483295 ?auto_483299 ) ) ( not ( = ?auto_483295 ?auto_483300 ) ) ( not ( = ?auto_483295 ?auto_483301 ) ) ( not ( = ?auto_483295 ?auto_483302 ) ) ( not ( = ?auto_483295 ?auto_483303 ) ) ( not ( = ?auto_483296 ?auto_483297 ) ) ( not ( = ?auto_483296 ?auto_483298 ) ) ( not ( = ?auto_483296 ?auto_483299 ) ) ( not ( = ?auto_483296 ?auto_483300 ) ) ( not ( = ?auto_483296 ?auto_483301 ) ) ( not ( = ?auto_483296 ?auto_483302 ) ) ( not ( = ?auto_483296 ?auto_483303 ) ) ( not ( = ?auto_483297 ?auto_483298 ) ) ( not ( = ?auto_483297 ?auto_483299 ) ) ( not ( = ?auto_483297 ?auto_483300 ) ) ( not ( = ?auto_483297 ?auto_483301 ) ) ( not ( = ?auto_483297 ?auto_483302 ) ) ( not ( = ?auto_483297 ?auto_483303 ) ) ( not ( = ?auto_483298 ?auto_483299 ) ) ( not ( = ?auto_483298 ?auto_483300 ) ) ( not ( = ?auto_483298 ?auto_483301 ) ) ( not ( = ?auto_483298 ?auto_483302 ) ) ( not ( = ?auto_483298 ?auto_483303 ) ) ( not ( = ?auto_483299 ?auto_483300 ) ) ( not ( = ?auto_483299 ?auto_483301 ) ) ( not ( = ?auto_483299 ?auto_483302 ) ) ( not ( = ?auto_483299 ?auto_483303 ) ) ( not ( = ?auto_483300 ?auto_483301 ) ) ( not ( = ?auto_483300 ?auto_483302 ) ) ( not ( = ?auto_483300 ?auto_483303 ) ) ( not ( = ?auto_483301 ?auto_483302 ) ) ( not ( = ?auto_483301 ?auto_483303 ) ) ( not ( = ?auto_483302 ?auto_483303 ) ) ( ON ?auto_483301 ?auto_483302 ) ( ON ?auto_483300 ?auto_483301 ) ( ON ?auto_483299 ?auto_483300 ) ( ON ?auto_483298 ?auto_483299 ) ( ON ?auto_483297 ?auto_483298 ) ( ON ?auto_483296 ?auto_483297 ) ( ON ?auto_483295 ?auto_483296 ) ( ON ?auto_483294 ?auto_483295 ) ( CLEAR ?auto_483292 ) ( ON ?auto_483293 ?auto_483294 ) ( CLEAR ?auto_483293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_483287 ?auto_483288 ?auto_483289 ?auto_483290 ?auto_483291 ?auto_483292 ?auto_483293 )
      ( MAKE-16PILE ?auto_483287 ?auto_483288 ?auto_483289 ?auto_483290 ?auto_483291 ?auto_483292 ?auto_483293 ?auto_483294 ?auto_483295 ?auto_483296 ?auto_483297 ?auto_483298 ?auto_483299 ?auto_483300 ?auto_483301 ?auto_483302 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483320 - BLOCK
      ?auto_483321 - BLOCK
      ?auto_483322 - BLOCK
      ?auto_483323 - BLOCK
      ?auto_483324 - BLOCK
      ?auto_483325 - BLOCK
      ?auto_483326 - BLOCK
      ?auto_483327 - BLOCK
      ?auto_483328 - BLOCK
      ?auto_483329 - BLOCK
      ?auto_483330 - BLOCK
      ?auto_483331 - BLOCK
      ?auto_483332 - BLOCK
      ?auto_483333 - BLOCK
      ?auto_483334 - BLOCK
      ?auto_483335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_483335 ) ( ON-TABLE ?auto_483320 ) ( ON ?auto_483321 ?auto_483320 ) ( ON ?auto_483322 ?auto_483321 ) ( ON ?auto_483323 ?auto_483322 ) ( ON ?auto_483324 ?auto_483323 ) ( ON ?auto_483325 ?auto_483324 ) ( not ( = ?auto_483320 ?auto_483321 ) ) ( not ( = ?auto_483320 ?auto_483322 ) ) ( not ( = ?auto_483320 ?auto_483323 ) ) ( not ( = ?auto_483320 ?auto_483324 ) ) ( not ( = ?auto_483320 ?auto_483325 ) ) ( not ( = ?auto_483320 ?auto_483326 ) ) ( not ( = ?auto_483320 ?auto_483327 ) ) ( not ( = ?auto_483320 ?auto_483328 ) ) ( not ( = ?auto_483320 ?auto_483329 ) ) ( not ( = ?auto_483320 ?auto_483330 ) ) ( not ( = ?auto_483320 ?auto_483331 ) ) ( not ( = ?auto_483320 ?auto_483332 ) ) ( not ( = ?auto_483320 ?auto_483333 ) ) ( not ( = ?auto_483320 ?auto_483334 ) ) ( not ( = ?auto_483320 ?auto_483335 ) ) ( not ( = ?auto_483321 ?auto_483322 ) ) ( not ( = ?auto_483321 ?auto_483323 ) ) ( not ( = ?auto_483321 ?auto_483324 ) ) ( not ( = ?auto_483321 ?auto_483325 ) ) ( not ( = ?auto_483321 ?auto_483326 ) ) ( not ( = ?auto_483321 ?auto_483327 ) ) ( not ( = ?auto_483321 ?auto_483328 ) ) ( not ( = ?auto_483321 ?auto_483329 ) ) ( not ( = ?auto_483321 ?auto_483330 ) ) ( not ( = ?auto_483321 ?auto_483331 ) ) ( not ( = ?auto_483321 ?auto_483332 ) ) ( not ( = ?auto_483321 ?auto_483333 ) ) ( not ( = ?auto_483321 ?auto_483334 ) ) ( not ( = ?auto_483321 ?auto_483335 ) ) ( not ( = ?auto_483322 ?auto_483323 ) ) ( not ( = ?auto_483322 ?auto_483324 ) ) ( not ( = ?auto_483322 ?auto_483325 ) ) ( not ( = ?auto_483322 ?auto_483326 ) ) ( not ( = ?auto_483322 ?auto_483327 ) ) ( not ( = ?auto_483322 ?auto_483328 ) ) ( not ( = ?auto_483322 ?auto_483329 ) ) ( not ( = ?auto_483322 ?auto_483330 ) ) ( not ( = ?auto_483322 ?auto_483331 ) ) ( not ( = ?auto_483322 ?auto_483332 ) ) ( not ( = ?auto_483322 ?auto_483333 ) ) ( not ( = ?auto_483322 ?auto_483334 ) ) ( not ( = ?auto_483322 ?auto_483335 ) ) ( not ( = ?auto_483323 ?auto_483324 ) ) ( not ( = ?auto_483323 ?auto_483325 ) ) ( not ( = ?auto_483323 ?auto_483326 ) ) ( not ( = ?auto_483323 ?auto_483327 ) ) ( not ( = ?auto_483323 ?auto_483328 ) ) ( not ( = ?auto_483323 ?auto_483329 ) ) ( not ( = ?auto_483323 ?auto_483330 ) ) ( not ( = ?auto_483323 ?auto_483331 ) ) ( not ( = ?auto_483323 ?auto_483332 ) ) ( not ( = ?auto_483323 ?auto_483333 ) ) ( not ( = ?auto_483323 ?auto_483334 ) ) ( not ( = ?auto_483323 ?auto_483335 ) ) ( not ( = ?auto_483324 ?auto_483325 ) ) ( not ( = ?auto_483324 ?auto_483326 ) ) ( not ( = ?auto_483324 ?auto_483327 ) ) ( not ( = ?auto_483324 ?auto_483328 ) ) ( not ( = ?auto_483324 ?auto_483329 ) ) ( not ( = ?auto_483324 ?auto_483330 ) ) ( not ( = ?auto_483324 ?auto_483331 ) ) ( not ( = ?auto_483324 ?auto_483332 ) ) ( not ( = ?auto_483324 ?auto_483333 ) ) ( not ( = ?auto_483324 ?auto_483334 ) ) ( not ( = ?auto_483324 ?auto_483335 ) ) ( not ( = ?auto_483325 ?auto_483326 ) ) ( not ( = ?auto_483325 ?auto_483327 ) ) ( not ( = ?auto_483325 ?auto_483328 ) ) ( not ( = ?auto_483325 ?auto_483329 ) ) ( not ( = ?auto_483325 ?auto_483330 ) ) ( not ( = ?auto_483325 ?auto_483331 ) ) ( not ( = ?auto_483325 ?auto_483332 ) ) ( not ( = ?auto_483325 ?auto_483333 ) ) ( not ( = ?auto_483325 ?auto_483334 ) ) ( not ( = ?auto_483325 ?auto_483335 ) ) ( not ( = ?auto_483326 ?auto_483327 ) ) ( not ( = ?auto_483326 ?auto_483328 ) ) ( not ( = ?auto_483326 ?auto_483329 ) ) ( not ( = ?auto_483326 ?auto_483330 ) ) ( not ( = ?auto_483326 ?auto_483331 ) ) ( not ( = ?auto_483326 ?auto_483332 ) ) ( not ( = ?auto_483326 ?auto_483333 ) ) ( not ( = ?auto_483326 ?auto_483334 ) ) ( not ( = ?auto_483326 ?auto_483335 ) ) ( not ( = ?auto_483327 ?auto_483328 ) ) ( not ( = ?auto_483327 ?auto_483329 ) ) ( not ( = ?auto_483327 ?auto_483330 ) ) ( not ( = ?auto_483327 ?auto_483331 ) ) ( not ( = ?auto_483327 ?auto_483332 ) ) ( not ( = ?auto_483327 ?auto_483333 ) ) ( not ( = ?auto_483327 ?auto_483334 ) ) ( not ( = ?auto_483327 ?auto_483335 ) ) ( not ( = ?auto_483328 ?auto_483329 ) ) ( not ( = ?auto_483328 ?auto_483330 ) ) ( not ( = ?auto_483328 ?auto_483331 ) ) ( not ( = ?auto_483328 ?auto_483332 ) ) ( not ( = ?auto_483328 ?auto_483333 ) ) ( not ( = ?auto_483328 ?auto_483334 ) ) ( not ( = ?auto_483328 ?auto_483335 ) ) ( not ( = ?auto_483329 ?auto_483330 ) ) ( not ( = ?auto_483329 ?auto_483331 ) ) ( not ( = ?auto_483329 ?auto_483332 ) ) ( not ( = ?auto_483329 ?auto_483333 ) ) ( not ( = ?auto_483329 ?auto_483334 ) ) ( not ( = ?auto_483329 ?auto_483335 ) ) ( not ( = ?auto_483330 ?auto_483331 ) ) ( not ( = ?auto_483330 ?auto_483332 ) ) ( not ( = ?auto_483330 ?auto_483333 ) ) ( not ( = ?auto_483330 ?auto_483334 ) ) ( not ( = ?auto_483330 ?auto_483335 ) ) ( not ( = ?auto_483331 ?auto_483332 ) ) ( not ( = ?auto_483331 ?auto_483333 ) ) ( not ( = ?auto_483331 ?auto_483334 ) ) ( not ( = ?auto_483331 ?auto_483335 ) ) ( not ( = ?auto_483332 ?auto_483333 ) ) ( not ( = ?auto_483332 ?auto_483334 ) ) ( not ( = ?auto_483332 ?auto_483335 ) ) ( not ( = ?auto_483333 ?auto_483334 ) ) ( not ( = ?auto_483333 ?auto_483335 ) ) ( not ( = ?auto_483334 ?auto_483335 ) ) ( ON ?auto_483334 ?auto_483335 ) ( ON ?auto_483333 ?auto_483334 ) ( ON ?auto_483332 ?auto_483333 ) ( ON ?auto_483331 ?auto_483332 ) ( ON ?auto_483330 ?auto_483331 ) ( ON ?auto_483329 ?auto_483330 ) ( ON ?auto_483328 ?auto_483329 ) ( ON ?auto_483327 ?auto_483328 ) ( CLEAR ?auto_483325 ) ( ON ?auto_483326 ?auto_483327 ) ( CLEAR ?auto_483326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_483320 ?auto_483321 ?auto_483322 ?auto_483323 ?auto_483324 ?auto_483325 ?auto_483326 )
      ( MAKE-16PILE ?auto_483320 ?auto_483321 ?auto_483322 ?auto_483323 ?auto_483324 ?auto_483325 ?auto_483326 ?auto_483327 ?auto_483328 ?auto_483329 ?auto_483330 ?auto_483331 ?auto_483332 ?auto_483333 ?auto_483334 ?auto_483335 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483352 - BLOCK
      ?auto_483353 - BLOCK
      ?auto_483354 - BLOCK
      ?auto_483355 - BLOCK
      ?auto_483356 - BLOCK
      ?auto_483357 - BLOCK
      ?auto_483358 - BLOCK
      ?auto_483359 - BLOCK
      ?auto_483360 - BLOCK
      ?auto_483361 - BLOCK
      ?auto_483362 - BLOCK
      ?auto_483363 - BLOCK
      ?auto_483364 - BLOCK
      ?auto_483365 - BLOCK
      ?auto_483366 - BLOCK
      ?auto_483367 - BLOCK
    )
    :vars
    (
      ?auto_483368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483367 ?auto_483368 ) ( ON-TABLE ?auto_483352 ) ( ON ?auto_483353 ?auto_483352 ) ( ON ?auto_483354 ?auto_483353 ) ( ON ?auto_483355 ?auto_483354 ) ( ON ?auto_483356 ?auto_483355 ) ( not ( = ?auto_483352 ?auto_483353 ) ) ( not ( = ?auto_483352 ?auto_483354 ) ) ( not ( = ?auto_483352 ?auto_483355 ) ) ( not ( = ?auto_483352 ?auto_483356 ) ) ( not ( = ?auto_483352 ?auto_483357 ) ) ( not ( = ?auto_483352 ?auto_483358 ) ) ( not ( = ?auto_483352 ?auto_483359 ) ) ( not ( = ?auto_483352 ?auto_483360 ) ) ( not ( = ?auto_483352 ?auto_483361 ) ) ( not ( = ?auto_483352 ?auto_483362 ) ) ( not ( = ?auto_483352 ?auto_483363 ) ) ( not ( = ?auto_483352 ?auto_483364 ) ) ( not ( = ?auto_483352 ?auto_483365 ) ) ( not ( = ?auto_483352 ?auto_483366 ) ) ( not ( = ?auto_483352 ?auto_483367 ) ) ( not ( = ?auto_483352 ?auto_483368 ) ) ( not ( = ?auto_483353 ?auto_483354 ) ) ( not ( = ?auto_483353 ?auto_483355 ) ) ( not ( = ?auto_483353 ?auto_483356 ) ) ( not ( = ?auto_483353 ?auto_483357 ) ) ( not ( = ?auto_483353 ?auto_483358 ) ) ( not ( = ?auto_483353 ?auto_483359 ) ) ( not ( = ?auto_483353 ?auto_483360 ) ) ( not ( = ?auto_483353 ?auto_483361 ) ) ( not ( = ?auto_483353 ?auto_483362 ) ) ( not ( = ?auto_483353 ?auto_483363 ) ) ( not ( = ?auto_483353 ?auto_483364 ) ) ( not ( = ?auto_483353 ?auto_483365 ) ) ( not ( = ?auto_483353 ?auto_483366 ) ) ( not ( = ?auto_483353 ?auto_483367 ) ) ( not ( = ?auto_483353 ?auto_483368 ) ) ( not ( = ?auto_483354 ?auto_483355 ) ) ( not ( = ?auto_483354 ?auto_483356 ) ) ( not ( = ?auto_483354 ?auto_483357 ) ) ( not ( = ?auto_483354 ?auto_483358 ) ) ( not ( = ?auto_483354 ?auto_483359 ) ) ( not ( = ?auto_483354 ?auto_483360 ) ) ( not ( = ?auto_483354 ?auto_483361 ) ) ( not ( = ?auto_483354 ?auto_483362 ) ) ( not ( = ?auto_483354 ?auto_483363 ) ) ( not ( = ?auto_483354 ?auto_483364 ) ) ( not ( = ?auto_483354 ?auto_483365 ) ) ( not ( = ?auto_483354 ?auto_483366 ) ) ( not ( = ?auto_483354 ?auto_483367 ) ) ( not ( = ?auto_483354 ?auto_483368 ) ) ( not ( = ?auto_483355 ?auto_483356 ) ) ( not ( = ?auto_483355 ?auto_483357 ) ) ( not ( = ?auto_483355 ?auto_483358 ) ) ( not ( = ?auto_483355 ?auto_483359 ) ) ( not ( = ?auto_483355 ?auto_483360 ) ) ( not ( = ?auto_483355 ?auto_483361 ) ) ( not ( = ?auto_483355 ?auto_483362 ) ) ( not ( = ?auto_483355 ?auto_483363 ) ) ( not ( = ?auto_483355 ?auto_483364 ) ) ( not ( = ?auto_483355 ?auto_483365 ) ) ( not ( = ?auto_483355 ?auto_483366 ) ) ( not ( = ?auto_483355 ?auto_483367 ) ) ( not ( = ?auto_483355 ?auto_483368 ) ) ( not ( = ?auto_483356 ?auto_483357 ) ) ( not ( = ?auto_483356 ?auto_483358 ) ) ( not ( = ?auto_483356 ?auto_483359 ) ) ( not ( = ?auto_483356 ?auto_483360 ) ) ( not ( = ?auto_483356 ?auto_483361 ) ) ( not ( = ?auto_483356 ?auto_483362 ) ) ( not ( = ?auto_483356 ?auto_483363 ) ) ( not ( = ?auto_483356 ?auto_483364 ) ) ( not ( = ?auto_483356 ?auto_483365 ) ) ( not ( = ?auto_483356 ?auto_483366 ) ) ( not ( = ?auto_483356 ?auto_483367 ) ) ( not ( = ?auto_483356 ?auto_483368 ) ) ( not ( = ?auto_483357 ?auto_483358 ) ) ( not ( = ?auto_483357 ?auto_483359 ) ) ( not ( = ?auto_483357 ?auto_483360 ) ) ( not ( = ?auto_483357 ?auto_483361 ) ) ( not ( = ?auto_483357 ?auto_483362 ) ) ( not ( = ?auto_483357 ?auto_483363 ) ) ( not ( = ?auto_483357 ?auto_483364 ) ) ( not ( = ?auto_483357 ?auto_483365 ) ) ( not ( = ?auto_483357 ?auto_483366 ) ) ( not ( = ?auto_483357 ?auto_483367 ) ) ( not ( = ?auto_483357 ?auto_483368 ) ) ( not ( = ?auto_483358 ?auto_483359 ) ) ( not ( = ?auto_483358 ?auto_483360 ) ) ( not ( = ?auto_483358 ?auto_483361 ) ) ( not ( = ?auto_483358 ?auto_483362 ) ) ( not ( = ?auto_483358 ?auto_483363 ) ) ( not ( = ?auto_483358 ?auto_483364 ) ) ( not ( = ?auto_483358 ?auto_483365 ) ) ( not ( = ?auto_483358 ?auto_483366 ) ) ( not ( = ?auto_483358 ?auto_483367 ) ) ( not ( = ?auto_483358 ?auto_483368 ) ) ( not ( = ?auto_483359 ?auto_483360 ) ) ( not ( = ?auto_483359 ?auto_483361 ) ) ( not ( = ?auto_483359 ?auto_483362 ) ) ( not ( = ?auto_483359 ?auto_483363 ) ) ( not ( = ?auto_483359 ?auto_483364 ) ) ( not ( = ?auto_483359 ?auto_483365 ) ) ( not ( = ?auto_483359 ?auto_483366 ) ) ( not ( = ?auto_483359 ?auto_483367 ) ) ( not ( = ?auto_483359 ?auto_483368 ) ) ( not ( = ?auto_483360 ?auto_483361 ) ) ( not ( = ?auto_483360 ?auto_483362 ) ) ( not ( = ?auto_483360 ?auto_483363 ) ) ( not ( = ?auto_483360 ?auto_483364 ) ) ( not ( = ?auto_483360 ?auto_483365 ) ) ( not ( = ?auto_483360 ?auto_483366 ) ) ( not ( = ?auto_483360 ?auto_483367 ) ) ( not ( = ?auto_483360 ?auto_483368 ) ) ( not ( = ?auto_483361 ?auto_483362 ) ) ( not ( = ?auto_483361 ?auto_483363 ) ) ( not ( = ?auto_483361 ?auto_483364 ) ) ( not ( = ?auto_483361 ?auto_483365 ) ) ( not ( = ?auto_483361 ?auto_483366 ) ) ( not ( = ?auto_483361 ?auto_483367 ) ) ( not ( = ?auto_483361 ?auto_483368 ) ) ( not ( = ?auto_483362 ?auto_483363 ) ) ( not ( = ?auto_483362 ?auto_483364 ) ) ( not ( = ?auto_483362 ?auto_483365 ) ) ( not ( = ?auto_483362 ?auto_483366 ) ) ( not ( = ?auto_483362 ?auto_483367 ) ) ( not ( = ?auto_483362 ?auto_483368 ) ) ( not ( = ?auto_483363 ?auto_483364 ) ) ( not ( = ?auto_483363 ?auto_483365 ) ) ( not ( = ?auto_483363 ?auto_483366 ) ) ( not ( = ?auto_483363 ?auto_483367 ) ) ( not ( = ?auto_483363 ?auto_483368 ) ) ( not ( = ?auto_483364 ?auto_483365 ) ) ( not ( = ?auto_483364 ?auto_483366 ) ) ( not ( = ?auto_483364 ?auto_483367 ) ) ( not ( = ?auto_483364 ?auto_483368 ) ) ( not ( = ?auto_483365 ?auto_483366 ) ) ( not ( = ?auto_483365 ?auto_483367 ) ) ( not ( = ?auto_483365 ?auto_483368 ) ) ( not ( = ?auto_483366 ?auto_483367 ) ) ( not ( = ?auto_483366 ?auto_483368 ) ) ( not ( = ?auto_483367 ?auto_483368 ) ) ( ON ?auto_483366 ?auto_483367 ) ( ON ?auto_483365 ?auto_483366 ) ( ON ?auto_483364 ?auto_483365 ) ( ON ?auto_483363 ?auto_483364 ) ( ON ?auto_483362 ?auto_483363 ) ( ON ?auto_483361 ?auto_483362 ) ( ON ?auto_483360 ?auto_483361 ) ( ON ?auto_483359 ?auto_483360 ) ( ON ?auto_483358 ?auto_483359 ) ( CLEAR ?auto_483356 ) ( ON ?auto_483357 ?auto_483358 ) ( CLEAR ?auto_483357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_483352 ?auto_483353 ?auto_483354 ?auto_483355 ?auto_483356 ?auto_483357 )
      ( MAKE-16PILE ?auto_483352 ?auto_483353 ?auto_483354 ?auto_483355 ?auto_483356 ?auto_483357 ?auto_483358 ?auto_483359 ?auto_483360 ?auto_483361 ?auto_483362 ?auto_483363 ?auto_483364 ?auto_483365 ?auto_483366 ?auto_483367 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483385 - BLOCK
      ?auto_483386 - BLOCK
      ?auto_483387 - BLOCK
      ?auto_483388 - BLOCK
      ?auto_483389 - BLOCK
      ?auto_483390 - BLOCK
      ?auto_483391 - BLOCK
      ?auto_483392 - BLOCK
      ?auto_483393 - BLOCK
      ?auto_483394 - BLOCK
      ?auto_483395 - BLOCK
      ?auto_483396 - BLOCK
      ?auto_483397 - BLOCK
      ?auto_483398 - BLOCK
      ?auto_483399 - BLOCK
      ?auto_483400 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_483400 ) ( ON-TABLE ?auto_483385 ) ( ON ?auto_483386 ?auto_483385 ) ( ON ?auto_483387 ?auto_483386 ) ( ON ?auto_483388 ?auto_483387 ) ( ON ?auto_483389 ?auto_483388 ) ( not ( = ?auto_483385 ?auto_483386 ) ) ( not ( = ?auto_483385 ?auto_483387 ) ) ( not ( = ?auto_483385 ?auto_483388 ) ) ( not ( = ?auto_483385 ?auto_483389 ) ) ( not ( = ?auto_483385 ?auto_483390 ) ) ( not ( = ?auto_483385 ?auto_483391 ) ) ( not ( = ?auto_483385 ?auto_483392 ) ) ( not ( = ?auto_483385 ?auto_483393 ) ) ( not ( = ?auto_483385 ?auto_483394 ) ) ( not ( = ?auto_483385 ?auto_483395 ) ) ( not ( = ?auto_483385 ?auto_483396 ) ) ( not ( = ?auto_483385 ?auto_483397 ) ) ( not ( = ?auto_483385 ?auto_483398 ) ) ( not ( = ?auto_483385 ?auto_483399 ) ) ( not ( = ?auto_483385 ?auto_483400 ) ) ( not ( = ?auto_483386 ?auto_483387 ) ) ( not ( = ?auto_483386 ?auto_483388 ) ) ( not ( = ?auto_483386 ?auto_483389 ) ) ( not ( = ?auto_483386 ?auto_483390 ) ) ( not ( = ?auto_483386 ?auto_483391 ) ) ( not ( = ?auto_483386 ?auto_483392 ) ) ( not ( = ?auto_483386 ?auto_483393 ) ) ( not ( = ?auto_483386 ?auto_483394 ) ) ( not ( = ?auto_483386 ?auto_483395 ) ) ( not ( = ?auto_483386 ?auto_483396 ) ) ( not ( = ?auto_483386 ?auto_483397 ) ) ( not ( = ?auto_483386 ?auto_483398 ) ) ( not ( = ?auto_483386 ?auto_483399 ) ) ( not ( = ?auto_483386 ?auto_483400 ) ) ( not ( = ?auto_483387 ?auto_483388 ) ) ( not ( = ?auto_483387 ?auto_483389 ) ) ( not ( = ?auto_483387 ?auto_483390 ) ) ( not ( = ?auto_483387 ?auto_483391 ) ) ( not ( = ?auto_483387 ?auto_483392 ) ) ( not ( = ?auto_483387 ?auto_483393 ) ) ( not ( = ?auto_483387 ?auto_483394 ) ) ( not ( = ?auto_483387 ?auto_483395 ) ) ( not ( = ?auto_483387 ?auto_483396 ) ) ( not ( = ?auto_483387 ?auto_483397 ) ) ( not ( = ?auto_483387 ?auto_483398 ) ) ( not ( = ?auto_483387 ?auto_483399 ) ) ( not ( = ?auto_483387 ?auto_483400 ) ) ( not ( = ?auto_483388 ?auto_483389 ) ) ( not ( = ?auto_483388 ?auto_483390 ) ) ( not ( = ?auto_483388 ?auto_483391 ) ) ( not ( = ?auto_483388 ?auto_483392 ) ) ( not ( = ?auto_483388 ?auto_483393 ) ) ( not ( = ?auto_483388 ?auto_483394 ) ) ( not ( = ?auto_483388 ?auto_483395 ) ) ( not ( = ?auto_483388 ?auto_483396 ) ) ( not ( = ?auto_483388 ?auto_483397 ) ) ( not ( = ?auto_483388 ?auto_483398 ) ) ( not ( = ?auto_483388 ?auto_483399 ) ) ( not ( = ?auto_483388 ?auto_483400 ) ) ( not ( = ?auto_483389 ?auto_483390 ) ) ( not ( = ?auto_483389 ?auto_483391 ) ) ( not ( = ?auto_483389 ?auto_483392 ) ) ( not ( = ?auto_483389 ?auto_483393 ) ) ( not ( = ?auto_483389 ?auto_483394 ) ) ( not ( = ?auto_483389 ?auto_483395 ) ) ( not ( = ?auto_483389 ?auto_483396 ) ) ( not ( = ?auto_483389 ?auto_483397 ) ) ( not ( = ?auto_483389 ?auto_483398 ) ) ( not ( = ?auto_483389 ?auto_483399 ) ) ( not ( = ?auto_483389 ?auto_483400 ) ) ( not ( = ?auto_483390 ?auto_483391 ) ) ( not ( = ?auto_483390 ?auto_483392 ) ) ( not ( = ?auto_483390 ?auto_483393 ) ) ( not ( = ?auto_483390 ?auto_483394 ) ) ( not ( = ?auto_483390 ?auto_483395 ) ) ( not ( = ?auto_483390 ?auto_483396 ) ) ( not ( = ?auto_483390 ?auto_483397 ) ) ( not ( = ?auto_483390 ?auto_483398 ) ) ( not ( = ?auto_483390 ?auto_483399 ) ) ( not ( = ?auto_483390 ?auto_483400 ) ) ( not ( = ?auto_483391 ?auto_483392 ) ) ( not ( = ?auto_483391 ?auto_483393 ) ) ( not ( = ?auto_483391 ?auto_483394 ) ) ( not ( = ?auto_483391 ?auto_483395 ) ) ( not ( = ?auto_483391 ?auto_483396 ) ) ( not ( = ?auto_483391 ?auto_483397 ) ) ( not ( = ?auto_483391 ?auto_483398 ) ) ( not ( = ?auto_483391 ?auto_483399 ) ) ( not ( = ?auto_483391 ?auto_483400 ) ) ( not ( = ?auto_483392 ?auto_483393 ) ) ( not ( = ?auto_483392 ?auto_483394 ) ) ( not ( = ?auto_483392 ?auto_483395 ) ) ( not ( = ?auto_483392 ?auto_483396 ) ) ( not ( = ?auto_483392 ?auto_483397 ) ) ( not ( = ?auto_483392 ?auto_483398 ) ) ( not ( = ?auto_483392 ?auto_483399 ) ) ( not ( = ?auto_483392 ?auto_483400 ) ) ( not ( = ?auto_483393 ?auto_483394 ) ) ( not ( = ?auto_483393 ?auto_483395 ) ) ( not ( = ?auto_483393 ?auto_483396 ) ) ( not ( = ?auto_483393 ?auto_483397 ) ) ( not ( = ?auto_483393 ?auto_483398 ) ) ( not ( = ?auto_483393 ?auto_483399 ) ) ( not ( = ?auto_483393 ?auto_483400 ) ) ( not ( = ?auto_483394 ?auto_483395 ) ) ( not ( = ?auto_483394 ?auto_483396 ) ) ( not ( = ?auto_483394 ?auto_483397 ) ) ( not ( = ?auto_483394 ?auto_483398 ) ) ( not ( = ?auto_483394 ?auto_483399 ) ) ( not ( = ?auto_483394 ?auto_483400 ) ) ( not ( = ?auto_483395 ?auto_483396 ) ) ( not ( = ?auto_483395 ?auto_483397 ) ) ( not ( = ?auto_483395 ?auto_483398 ) ) ( not ( = ?auto_483395 ?auto_483399 ) ) ( not ( = ?auto_483395 ?auto_483400 ) ) ( not ( = ?auto_483396 ?auto_483397 ) ) ( not ( = ?auto_483396 ?auto_483398 ) ) ( not ( = ?auto_483396 ?auto_483399 ) ) ( not ( = ?auto_483396 ?auto_483400 ) ) ( not ( = ?auto_483397 ?auto_483398 ) ) ( not ( = ?auto_483397 ?auto_483399 ) ) ( not ( = ?auto_483397 ?auto_483400 ) ) ( not ( = ?auto_483398 ?auto_483399 ) ) ( not ( = ?auto_483398 ?auto_483400 ) ) ( not ( = ?auto_483399 ?auto_483400 ) ) ( ON ?auto_483399 ?auto_483400 ) ( ON ?auto_483398 ?auto_483399 ) ( ON ?auto_483397 ?auto_483398 ) ( ON ?auto_483396 ?auto_483397 ) ( ON ?auto_483395 ?auto_483396 ) ( ON ?auto_483394 ?auto_483395 ) ( ON ?auto_483393 ?auto_483394 ) ( ON ?auto_483392 ?auto_483393 ) ( ON ?auto_483391 ?auto_483392 ) ( CLEAR ?auto_483389 ) ( ON ?auto_483390 ?auto_483391 ) ( CLEAR ?auto_483390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_483385 ?auto_483386 ?auto_483387 ?auto_483388 ?auto_483389 ?auto_483390 )
      ( MAKE-16PILE ?auto_483385 ?auto_483386 ?auto_483387 ?auto_483388 ?auto_483389 ?auto_483390 ?auto_483391 ?auto_483392 ?auto_483393 ?auto_483394 ?auto_483395 ?auto_483396 ?auto_483397 ?auto_483398 ?auto_483399 ?auto_483400 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483417 - BLOCK
      ?auto_483418 - BLOCK
      ?auto_483419 - BLOCK
      ?auto_483420 - BLOCK
      ?auto_483421 - BLOCK
      ?auto_483422 - BLOCK
      ?auto_483423 - BLOCK
      ?auto_483424 - BLOCK
      ?auto_483425 - BLOCK
      ?auto_483426 - BLOCK
      ?auto_483427 - BLOCK
      ?auto_483428 - BLOCK
      ?auto_483429 - BLOCK
      ?auto_483430 - BLOCK
      ?auto_483431 - BLOCK
      ?auto_483432 - BLOCK
    )
    :vars
    (
      ?auto_483433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483432 ?auto_483433 ) ( ON-TABLE ?auto_483417 ) ( ON ?auto_483418 ?auto_483417 ) ( ON ?auto_483419 ?auto_483418 ) ( ON ?auto_483420 ?auto_483419 ) ( not ( = ?auto_483417 ?auto_483418 ) ) ( not ( = ?auto_483417 ?auto_483419 ) ) ( not ( = ?auto_483417 ?auto_483420 ) ) ( not ( = ?auto_483417 ?auto_483421 ) ) ( not ( = ?auto_483417 ?auto_483422 ) ) ( not ( = ?auto_483417 ?auto_483423 ) ) ( not ( = ?auto_483417 ?auto_483424 ) ) ( not ( = ?auto_483417 ?auto_483425 ) ) ( not ( = ?auto_483417 ?auto_483426 ) ) ( not ( = ?auto_483417 ?auto_483427 ) ) ( not ( = ?auto_483417 ?auto_483428 ) ) ( not ( = ?auto_483417 ?auto_483429 ) ) ( not ( = ?auto_483417 ?auto_483430 ) ) ( not ( = ?auto_483417 ?auto_483431 ) ) ( not ( = ?auto_483417 ?auto_483432 ) ) ( not ( = ?auto_483417 ?auto_483433 ) ) ( not ( = ?auto_483418 ?auto_483419 ) ) ( not ( = ?auto_483418 ?auto_483420 ) ) ( not ( = ?auto_483418 ?auto_483421 ) ) ( not ( = ?auto_483418 ?auto_483422 ) ) ( not ( = ?auto_483418 ?auto_483423 ) ) ( not ( = ?auto_483418 ?auto_483424 ) ) ( not ( = ?auto_483418 ?auto_483425 ) ) ( not ( = ?auto_483418 ?auto_483426 ) ) ( not ( = ?auto_483418 ?auto_483427 ) ) ( not ( = ?auto_483418 ?auto_483428 ) ) ( not ( = ?auto_483418 ?auto_483429 ) ) ( not ( = ?auto_483418 ?auto_483430 ) ) ( not ( = ?auto_483418 ?auto_483431 ) ) ( not ( = ?auto_483418 ?auto_483432 ) ) ( not ( = ?auto_483418 ?auto_483433 ) ) ( not ( = ?auto_483419 ?auto_483420 ) ) ( not ( = ?auto_483419 ?auto_483421 ) ) ( not ( = ?auto_483419 ?auto_483422 ) ) ( not ( = ?auto_483419 ?auto_483423 ) ) ( not ( = ?auto_483419 ?auto_483424 ) ) ( not ( = ?auto_483419 ?auto_483425 ) ) ( not ( = ?auto_483419 ?auto_483426 ) ) ( not ( = ?auto_483419 ?auto_483427 ) ) ( not ( = ?auto_483419 ?auto_483428 ) ) ( not ( = ?auto_483419 ?auto_483429 ) ) ( not ( = ?auto_483419 ?auto_483430 ) ) ( not ( = ?auto_483419 ?auto_483431 ) ) ( not ( = ?auto_483419 ?auto_483432 ) ) ( not ( = ?auto_483419 ?auto_483433 ) ) ( not ( = ?auto_483420 ?auto_483421 ) ) ( not ( = ?auto_483420 ?auto_483422 ) ) ( not ( = ?auto_483420 ?auto_483423 ) ) ( not ( = ?auto_483420 ?auto_483424 ) ) ( not ( = ?auto_483420 ?auto_483425 ) ) ( not ( = ?auto_483420 ?auto_483426 ) ) ( not ( = ?auto_483420 ?auto_483427 ) ) ( not ( = ?auto_483420 ?auto_483428 ) ) ( not ( = ?auto_483420 ?auto_483429 ) ) ( not ( = ?auto_483420 ?auto_483430 ) ) ( not ( = ?auto_483420 ?auto_483431 ) ) ( not ( = ?auto_483420 ?auto_483432 ) ) ( not ( = ?auto_483420 ?auto_483433 ) ) ( not ( = ?auto_483421 ?auto_483422 ) ) ( not ( = ?auto_483421 ?auto_483423 ) ) ( not ( = ?auto_483421 ?auto_483424 ) ) ( not ( = ?auto_483421 ?auto_483425 ) ) ( not ( = ?auto_483421 ?auto_483426 ) ) ( not ( = ?auto_483421 ?auto_483427 ) ) ( not ( = ?auto_483421 ?auto_483428 ) ) ( not ( = ?auto_483421 ?auto_483429 ) ) ( not ( = ?auto_483421 ?auto_483430 ) ) ( not ( = ?auto_483421 ?auto_483431 ) ) ( not ( = ?auto_483421 ?auto_483432 ) ) ( not ( = ?auto_483421 ?auto_483433 ) ) ( not ( = ?auto_483422 ?auto_483423 ) ) ( not ( = ?auto_483422 ?auto_483424 ) ) ( not ( = ?auto_483422 ?auto_483425 ) ) ( not ( = ?auto_483422 ?auto_483426 ) ) ( not ( = ?auto_483422 ?auto_483427 ) ) ( not ( = ?auto_483422 ?auto_483428 ) ) ( not ( = ?auto_483422 ?auto_483429 ) ) ( not ( = ?auto_483422 ?auto_483430 ) ) ( not ( = ?auto_483422 ?auto_483431 ) ) ( not ( = ?auto_483422 ?auto_483432 ) ) ( not ( = ?auto_483422 ?auto_483433 ) ) ( not ( = ?auto_483423 ?auto_483424 ) ) ( not ( = ?auto_483423 ?auto_483425 ) ) ( not ( = ?auto_483423 ?auto_483426 ) ) ( not ( = ?auto_483423 ?auto_483427 ) ) ( not ( = ?auto_483423 ?auto_483428 ) ) ( not ( = ?auto_483423 ?auto_483429 ) ) ( not ( = ?auto_483423 ?auto_483430 ) ) ( not ( = ?auto_483423 ?auto_483431 ) ) ( not ( = ?auto_483423 ?auto_483432 ) ) ( not ( = ?auto_483423 ?auto_483433 ) ) ( not ( = ?auto_483424 ?auto_483425 ) ) ( not ( = ?auto_483424 ?auto_483426 ) ) ( not ( = ?auto_483424 ?auto_483427 ) ) ( not ( = ?auto_483424 ?auto_483428 ) ) ( not ( = ?auto_483424 ?auto_483429 ) ) ( not ( = ?auto_483424 ?auto_483430 ) ) ( not ( = ?auto_483424 ?auto_483431 ) ) ( not ( = ?auto_483424 ?auto_483432 ) ) ( not ( = ?auto_483424 ?auto_483433 ) ) ( not ( = ?auto_483425 ?auto_483426 ) ) ( not ( = ?auto_483425 ?auto_483427 ) ) ( not ( = ?auto_483425 ?auto_483428 ) ) ( not ( = ?auto_483425 ?auto_483429 ) ) ( not ( = ?auto_483425 ?auto_483430 ) ) ( not ( = ?auto_483425 ?auto_483431 ) ) ( not ( = ?auto_483425 ?auto_483432 ) ) ( not ( = ?auto_483425 ?auto_483433 ) ) ( not ( = ?auto_483426 ?auto_483427 ) ) ( not ( = ?auto_483426 ?auto_483428 ) ) ( not ( = ?auto_483426 ?auto_483429 ) ) ( not ( = ?auto_483426 ?auto_483430 ) ) ( not ( = ?auto_483426 ?auto_483431 ) ) ( not ( = ?auto_483426 ?auto_483432 ) ) ( not ( = ?auto_483426 ?auto_483433 ) ) ( not ( = ?auto_483427 ?auto_483428 ) ) ( not ( = ?auto_483427 ?auto_483429 ) ) ( not ( = ?auto_483427 ?auto_483430 ) ) ( not ( = ?auto_483427 ?auto_483431 ) ) ( not ( = ?auto_483427 ?auto_483432 ) ) ( not ( = ?auto_483427 ?auto_483433 ) ) ( not ( = ?auto_483428 ?auto_483429 ) ) ( not ( = ?auto_483428 ?auto_483430 ) ) ( not ( = ?auto_483428 ?auto_483431 ) ) ( not ( = ?auto_483428 ?auto_483432 ) ) ( not ( = ?auto_483428 ?auto_483433 ) ) ( not ( = ?auto_483429 ?auto_483430 ) ) ( not ( = ?auto_483429 ?auto_483431 ) ) ( not ( = ?auto_483429 ?auto_483432 ) ) ( not ( = ?auto_483429 ?auto_483433 ) ) ( not ( = ?auto_483430 ?auto_483431 ) ) ( not ( = ?auto_483430 ?auto_483432 ) ) ( not ( = ?auto_483430 ?auto_483433 ) ) ( not ( = ?auto_483431 ?auto_483432 ) ) ( not ( = ?auto_483431 ?auto_483433 ) ) ( not ( = ?auto_483432 ?auto_483433 ) ) ( ON ?auto_483431 ?auto_483432 ) ( ON ?auto_483430 ?auto_483431 ) ( ON ?auto_483429 ?auto_483430 ) ( ON ?auto_483428 ?auto_483429 ) ( ON ?auto_483427 ?auto_483428 ) ( ON ?auto_483426 ?auto_483427 ) ( ON ?auto_483425 ?auto_483426 ) ( ON ?auto_483424 ?auto_483425 ) ( ON ?auto_483423 ?auto_483424 ) ( ON ?auto_483422 ?auto_483423 ) ( CLEAR ?auto_483420 ) ( ON ?auto_483421 ?auto_483422 ) ( CLEAR ?auto_483421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_483417 ?auto_483418 ?auto_483419 ?auto_483420 ?auto_483421 )
      ( MAKE-16PILE ?auto_483417 ?auto_483418 ?auto_483419 ?auto_483420 ?auto_483421 ?auto_483422 ?auto_483423 ?auto_483424 ?auto_483425 ?auto_483426 ?auto_483427 ?auto_483428 ?auto_483429 ?auto_483430 ?auto_483431 ?auto_483432 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483450 - BLOCK
      ?auto_483451 - BLOCK
      ?auto_483452 - BLOCK
      ?auto_483453 - BLOCK
      ?auto_483454 - BLOCK
      ?auto_483455 - BLOCK
      ?auto_483456 - BLOCK
      ?auto_483457 - BLOCK
      ?auto_483458 - BLOCK
      ?auto_483459 - BLOCK
      ?auto_483460 - BLOCK
      ?auto_483461 - BLOCK
      ?auto_483462 - BLOCK
      ?auto_483463 - BLOCK
      ?auto_483464 - BLOCK
      ?auto_483465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_483465 ) ( ON-TABLE ?auto_483450 ) ( ON ?auto_483451 ?auto_483450 ) ( ON ?auto_483452 ?auto_483451 ) ( ON ?auto_483453 ?auto_483452 ) ( not ( = ?auto_483450 ?auto_483451 ) ) ( not ( = ?auto_483450 ?auto_483452 ) ) ( not ( = ?auto_483450 ?auto_483453 ) ) ( not ( = ?auto_483450 ?auto_483454 ) ) ( not ( = ?auto_483450 ?auto_483455 ) ) ( not ( = ?auto_483450 ?auto_483456 ) ) ( not ( = ?auto_483450 ?auto_483457 ) ) ( not ( = ?auto_483450 ?auto_483458 ) ) ( not ( = ?auto_483450 ?auto_483459 ) ) ( not ( = ?auto_483450 ?auto_483460 ) ) ( not ( = ?auto_483450 ?auto_483461 ) ) ( not ( = ?auto_483450 ?auto_483462 ) ) ( not ( = ?auto_483450 ?auto_483463 ) ) ( not ( = ?auto_483450 ?auto_483464 ) ) ( not ( = ?auto_483450 ?auto_483465 ) ) ( not ( = ?auto_483451 ?auto_483452 ) ) ( not ( = ?auto_483451 ?auto_483453 ) ) ( not ( = ?auto_483451 ?auto_483454 ) ) ( not ( = ?auto_483451 ?auto_483455 ) ) ( not ( = ?auto_483451 ?auto_483456 ) ) ( not ( = ?auto_483451 ?auto_483457 ) ) ( not ( = ?auto_483451 ?auto_483458 ) ) ( not ( = ?auto_483451 ?auto_483459 ) ) ( not ( = ?auto_483451 ?auto_483460 ) ) ( not ( = ?auto_483451 ?auto_483461 ) ) ( not ( = ?auto_483451 ?auto_483462 ) ) ( not ( = ?auto_483451 ?auto_483463 ) ) ( not ( = ?auto_483451 ?auto_483464 ) ) ( not ( = ?auto_483451 ?auto_483465 ) ) ( not ( = ?auto_483452 ?auto_483453 ) ) ( not ( = ?auto_483452 ?auto_483454 ) ) ( not ( = ?auto_483452 ?auto_483455 ) ) ( not ( = ?auto_483452 ?auto_483456 ) ) ( not ( = ?auto_483452 ?auto_483457 ) ) ( not ( = ?auto_483452 ?auto_483458 ) ) ( not ( = ?auto_483452 ?auto_483459 ) ) ( not ( = ?auto_483452 ?auto_483460 ) ) ( not ( = ?auto_483452 ?auto_483461 ) ) ( not ( = ?auto_483452 ?auto_483462 ) ) ( not ( = ?auto_483452 ?auto_483463 ) ) ( not ( = ?auto_483452 ?auto_483464 ) ) ( not ( = ?auto_483452 ?auto_483465 ) ) ( not ( = ?auto_483453 ?auto_483454 ) ) ( not ( = ?auto_483453 ?auto_483455 ) ) ( not ( = ?auto_483453 ?auto_483456 ) ) ( not ( = ?auto_483453 ?auto_483457 ) ) ( not ( = ?auto_483453 ?auto_483458 ) ) ( not ( = ?auto_483453 ?auto_483459 ) ) ( not ( = ?auto_483453 ?auto_483460 ) ) ( not ( = ?auto_483453 ?auto_483461 ) ) ( not ( = ?auto_483453 ?auto_483462 ) ) ( not ( = ?auto_483453 ?auto_483463 ) ) ( not ( = ?auto_483453 ?auto_483464 ) ) ( not ( = ?auto_483453 ?auto_483465 ) ) ( not ( = ?auto_483454 ?auto_483455 ) ) ( not ( = ?auto_483454 ?auto_483456 ) ) ( not ( = ?auto_483454 ?auto_483457 ) ) ( not ( = ?auto_483454 ?auto_483458 ) ) ( not ( = ?auto_483454 ?auto_483459 ) ) ( not ( = ?auto_483454 ?auto_483460 ) ) ( not ( = ?auto_483454 ?auto_483461 ) ) ( not ( = ?auto_483454 ?auto_483462 ) ) ( not ( = ?auto_483454 ?auto_483463 ) ) ( not ( = ?auto_483454 ?auto_483464 ) ) ( not ( = ?auto_483454 ?auto_483465 ) ) ( not ( = ?auto_483455 ?auto_483456 ) ) ( not ( = ?auto_483455 ?auto_483457 ) ) ( not ( = ?auto_483455 ?auto_483458 ) ) ( not ( = ?auto_483455 ?auto_483459 ) ) ( not ( = ?auto_483455 ?auto_483460 ) ) ( not ( = ?auto_483455 ?auto_483461 ) ) ( not ( = ?auto_483455 ?auto_483462 ) ) ( not ( = ?auto_483455 ?auto_483463 ) ) ( not ( = ?auto_483455 ?auto_483464 ) ) ( not ( = ?auto_483455 ?auto_483465 ) ) ( not ( = ?auto_483456 ?auto_483457 ) ) ( not ( = ?auto_483456 ?auto_483458 ) ) ( not ( = ?auto_483456 ?auto_483459 ) ) ( not ( = ?auto_483456 ?auto_483460 ) ) ( not ( = ?auto_483456 ?auto_483461 ) ) ( not ( = ?auto_483456 ?auto_483462 ) ) ( not ( = ?auto_483456 ?auto_483463 ) ) ( not ( = ?auto_483456 ?auto_483464 ) ) ( not ( = ?auto_483456 ?auto_483465 ) ) ( not ( = ?auto_483457 ?auto_483458 ) ) ( not ( = ?auto_483457 ?auto_483459 ) ) ( not ( = ?auto_483457 ?auto_483460 ) ) ( not ( = ?auto_483457 ?auto_483461 ) ) ( not ( = ?auto_483457 ?auto_483462 ) ) ( not ( = ?auto_483457 ?auto_483463 ) ) ( not ( = ?auto_483457 ?auto_483464 ) ) ( not ( = ?auto_483457 ?auto_483465 ) ) ( not ( = ?auto_483458 ?auto_483459 ) ) ( not ( = ?auto_483458 ?auto_483460 ) ) ( not ( = ?auto_483458 ?auto_483461 ) ) ( not ( = ?auto_483458 ?auto_483462 ) ) ( not ( = ?auto_483458 ?auto_483463 ) ) ( not ( = ?auto_483458 ?auto_483464 ) ) ( not ( = ?auto_483458 ?auto_483465 ) ) ( not ( = ?auto_483459 ?auto_483460 ) ) ( not ( = ?auto_483459 ?auto_483461 ) ) ( not ( = ?auto_483459 ?auto_483462 ) ) ( not ( = ?auto_483459 ?auto_483463 ) ) ( not ( = ?auto_483459 ?auto_483464 ) ) ( not ( = ?auto_483459 ?auto_483465 ) ) ( not ( = ?auto_483460 ?auto_483461 ) ) ( not ( = ?auto_483460 ?auto_483462 ) ) ( not ( = ?auto_483460 ?auto_483463 ) ) ( not ( = ?auto_483460 ?auto_483464 ) ) ( not ( = ?auto_483460 ?auto_483465 ) ) ( not ( = ?auto_483461 ?auto_483462 ) ) ( not ( = ?auto_483461 ?auto_483463 ) ) ( not ( = ?auto_483461 ?auto_483464 ) ) ( not ( = ?auto_483461 ?auto_483465 ) ) ( not ( = ?auto_483462 ?auto_483463 ) ) ( not ( = ?auto_483462 ?auto_483464 ) ) ( not ( = ?auto_483462 ?auto_483465 ) ) ( not ( = ?auto_483463 ?auto_483464 ) ) ( not ( = ?auto_483463 ?auto_483465 ) ) ( not ( = ?auto_483464 ?auto_483465 ) ) ( ON ?auto_483464 ?auto_483465 ) ( ON ?auto_483463 ?auto_483464 ) ( ON ?auto_483462 ?auto_483463 ) ( ON ?auto_483461 ?auto_483462 ) ( ON ?auto_483460 ?auto_483461 ) ( ON ?auto_483459 ?auto_483460 ) ( ON ?auto_483458 ?auto_483459 ) ( ON ?auto_483457 ?auto_483458 ) ( ON ?auto_483456 ?auto_483457 ) ( ON ?auto_483455 ?auto_483456 ) ( CLEAR ?auto_483453 ) ( ON ?auto_483454 ?auto_483455 ) ( CLEAR ?auto_483454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_483450 ?auto_483451 ?auto_483452 ?auto_483453 ?auto_483454 )
      ( MAKE-16PILE ?auto_483450 ?auto_483451 ?auto_483452 ?auto_483453 ?auto_483454 ?auto_483455 ?auto_483456 ?auto_483457 ?auto_483458 ?auto_483459 ?auto_483460 ?auto_483461 ?auto_483462 ?auto_483463 ?auto_483464 ?auto_483465 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483482 - BLOCK
      ?auto_483483 - BLOCK
      ?auto_483484 - BLOCK
      ?auto_483485 - BLOCK
      ?auto_483486 - BLOCK
      ?auto_483487 - BLOCK
      ?auto_483488 - BLOCK
      ?auto_483489 - BLOCK
      ?auto_483490 - BLOCK
      ?auto_483491 - BLOCK
      ?auto_483492 - BLOCK
      ?auto_483493 - BLOCK
      ?auto_483494 - BLOCK
      ?auto_483495 - BLOCK
      ?auto_483496 - BLOCK
      ?auto_483497 - BLOCK
    )
    :vars
    (
      ?auto_483498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483497 ?auto_483498 ) ( ON-TABLE ?auto_483482 ) ( ON ?auto_483483 ?auto_483482 ) ( ON ?auto_483484 ?auto_483483 ) ( not ( = ?auto_483482 ?auto_483483 ) ) ( not ( = ?auto_483482 ?auto_483484 ) ) ( not ( = ?auto_483482 ?auto_483485 ) ) ( not ( = ?auto_483482 ?auto_483486 ) ) ( not ( = ?auto_483482 ?auto_483487 ) ) ( not ( = ?auto_483482 ?auto_483488 ) ) ( not ( = ?auto_483482 ?auto_483489 ) ) ( not ( = ?auto_483482 ?auto_483490 ) ) ( not ( = ?auto_483482 ?auto_483491 ) ) ( not ( = ?auto_483482 ?auto_483492 ) ) ( not ( = ?auto_483482 ?auto_483493 ) ) ( not ( = ?auto_483482 ?auto_483494 ) ) ( not ( = ?auto_483482 ?auto_483495 ) ) ( not ( = ?auto_483482 ?auto_483496 ) ) ( not ( = ?auto_483482 ?auto_483497 ) ) ( not ( = ?auto_483482 ?auto_483498 ) ) ( not ( = ?auto_483483 ?auto_483484 ) ) ( not ( = ?auto_483483 ?auto_483485 ) ) ( not ( = ?auto_483483 ?auto_483486 ) ) ( not ( = ?auto_483483 ?auto_483487 ) ) ( not ( = ?auto_483483 ?auto_483488 ) ) ( not ( = ?auto_483483 ?auto_483489 ) ) ( not ( = ?auto_483483 ?auto_483490 ) ) ( not ( = ?auto_483483 ?auto_483491 ) ) ( not ( = ?auto_483483 ?auto_483492 ) ) ( not ( = ?auto_483483 ?auto_483493 ) ) ( not ( = ?auto_483483 ?auto_483494 ) ) ( not ( = ?auto_483483 ?auto_483495 ) ) ( not ( = ?auto_483483 ?auto_483496 ) ) ( not ( = ?auto_483483 ?auto_483497 ) ) ( not ( = ?auto_483483 ?auto_483498 ) ) ( not ( = ?auto_483484 ?auto_483485 ) ) ( not ( = ?auto_483484 ?auto_483486 ) ) ( not ( = ?auto_483484 ?auto_483487 ) ) ( not ( = ?auto_483484 ?auto_483488 ) ) ( not ( = ?auto_483484 ?auto_483489 ) ) ( not ( = ?auto_483484 ?auto_483490 ) ) ( not ( = ?auto_483484 ?auto_483491 ) ) ( not ( = ?auto_483484 ?auto_483492 ) ) ( not ( = ?auto_483484 ?auto_483493 ) ) ( not ( = ?auto_483484 ?auto_483494 ) ) ( not ( = ?auto_483484 ?auto_483495 ) ) ( not ( = ?auto_483484 ?auto_483496 ) ) ( not ( = ?auto_483484 ?auto_483497 ) ) ( not ( = ?auto_483484 ?auto_483498 ) ) ( not ( = ?auto_483485 ?auto_483486 ) ) ( not ( = ?auto_483485 ?auto_483487 ) ) ( not ( = ?auto_483485 ?auto_483488 ) ) ( not ( = ?auto_483485 ?auto_483489 ) ) ( not ( = ?auto_483485 ?auto_483490 ) ) ( not ( = ?auto_483485 ?auto_483491 ) ) ( not ( = ?auto_483485 ?auto_483492 ) ) ( not ( = ?auto_483485 ?auto_483493 ) ) ( not ( = ?auto_483485 ?auto_483494 ) ) ( not ( = ?auto_483485 ?auto_483495 ) ) ( not ( = ?auto_483485 ?auto_483496 ) ) ( not ( = ?auto_483485 ?auto_483497 ) ) ( not ( = ?auto_483485 ?auto_483498 ) ) ( not ( = ?auto_483486 ?auto_483487 ) ) ( not ( = ?auto_483486 ?auto_483488 ) ) ( not ( = ?auto_483486 ?auto_483489 ) ) ( not ( = ?auto_483486 ?auto_483490 ) ) ( not ( = ?auto_483486 ?auto_483491 ) ) ( not ( = ?auto_483486 ?auto_483492 ) ) ( not ( = ?auto_483486 ?auto_483493 ) ) ( not ( = ?auto_483486 ?auto_483494 ) ) ( not ( = ?auto_483486 ?auto_483495 ) ) ( not ( = ?auto_483486 ?auto_483496 ) ) ( not ( = ?auto_483486 ?auto_483497 ) ) ( not ( = ?auto_483486 ?auto_483498 ) ) ( not ( = ?auto_483487 ?auto_483488 ) ) ( not ( = ?auto_483487 ?auto_483489 ) ) ( not ( = ?auto_483487 ?auto_483490 ) ) ( not ( = ?auto_483487 ?auto_483491 ) ) ( not ( = ?auto_483487 ?auto_483492 ) ) ( not ( = ?auto_483487 ?auto_483493 ) ) ( not ( = ?auto_483487 ?auto_483494 ) ) ( not ( = ?auto_483487 ?auto_483495 ) ) ( not ( = ?auto_483487 ?auto_483496 ) ) ( not ( = ?auto_483487 ?auto_483497 ) ) ( not ( = ?auto_483487 ?auto_483498 ) ) ( not ( = ?auto_483488 ?auto_483489 ) ) ( not ( = ?auto_483488 ?auto_483490 ) ) ( not ( = ?auto_483488 ?auto_483491 ) ) ( not ( = ?auto_483488 ?auto_483492 ) ) ( not ( = ?auto_483488 ?auto_483493 ) ) ( not ( = ?auto_483488 ?auto_483494 ) ) ( not ( = ?auto_483488 ?auto_483495 ) ) ( not ( = ?auto_483488 ?auto_483496 ) ) ( not ( = ?auto_483488 ?auto_483497 ) ) ( not ( = ?auto_483488 ?auto_483498 ) ) ( not ( = ?auto_483489 ?auto_483490 ) ) ( not ( = ?auto_483489 ?auto_483491 ) ) ( not ( = ?auto_483489 ?auto_483492 ) ) ( not ( = ?auto_483489 ?auto_483493 ) ) ( not ( = ?auto_483489 ?auto_483494 ) ) ( not ( = ?auto_483489 ?auto_483495 ) ) ( not ( = ?auto_483489 ?auto_483496 ) ) ( not ( = ?auto_483489 ?auto_483497 ) ) ( not ( = ?auto_483489 ?auto_483498 ) ) ( not ( = ?auto_483490 ?auto_483491 ) ) ( not ( = ?auto_483490 ?auto_483492 ) ) ( not ( = ?auto_483490 ?auto_483493 ) ) ( not ( = ?auto_483490 ?auto_483494 ) ) ( not ( = ?auto_483490 ?auto_483495 ) ) ( not ( = ?auto_483490 ?auto_483496 ) ) ( not ( = ?auto_483490 ?auto_483497 ) ) ( not ( = ?auto_483490 ?auto_483498 ) ) ( not ( = ?auto_483491 ?auto_483492 ) ) ( not ( = ?auto_483491 ?auto_483493 ) ) ( not ( = ?auto_483491 ?auto_483494 ) ) ( not ( = ?auto_483491 ?auto_483495 ) ) ( not ( = ?auto_483491 ?auto_483496 ) ) ( not ( = ?auto_483491 ?auto_483497 ) ) ( not ( = ?auto_483491 ?auto_483498 ) ) ( not ( = ?auto_483492 ?auto_483493 ) ) ( not ( = ?auto_483492 ?auto_483494 ) ) ( not ( = ?auto_483492 ?auto_483495 ) ) ( not ( = ?auto_483492 ?auto_483496 ) ) ( not ( = ?auto_483492 ?auto_483497 ) ) ( not ( = ?auto_483492 ?auto_483498 ) ) ( not ( = ?auto_483493 ?auto_483494 ) ) ( not ( = ?auto_483493 ?auto_483495 ) ) ( not ( = ?auto_483493 ?auto_483496 ) ) ( not ( = ?auto_483493 ?auto_483497 ) ) ( not ( = ?auto_483493 ?auto_483498 ) ) ( not ( = ?auto_483494 ?auto_483495 ) ) ( not ( = ?auto_483494 ?auto_483496 ) ) ( not ( = ?auto_483494 ?auto_483497 ) ) ( not ( = ?auto_483494 ?auto_483498 ) ) ( not ( = ?auto_483495 ?auto_483496 ) ) ( not ( = ?auto_483495 ?auto_483497 ) ) ( not ( = ?auto_483495 ?auto_483498 ) ) ( not ( = ?auto_483496 ?auto_483497 ) ) ( not ( = ?auto_483496 ?auto_483498 ) ) ( not ( = ?auto_483497 ?auto_483498 ) ) ( ON ?auto_483496 ?auto_483497 ) ( ON ?auto_483495 ?auto_483496 ) ( ON ?auto_483494 ?auto_483495 ) ( ON ?auto_483493 ?auto_483494 ) ( ON ?auto_483492 ?auto_483493 ) ( ON ?auto_483491 ?auto_483492 ) ( ON ?auto_483490 ?auto_483491 ) ( ON ?auto_483489 ?auto_483490 ) ( ON ?auto_483488 ?auto_483489 ) ( ON ?auto_483487 ?auto_483488 ) ( ON ?auto_483486 ?auto_483487 ) ( CLEAR ?auto_483484 ) ( ON ?auto_483485 ?auto_483486 ) ( CLEAR ?auto_483485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_483482 ?auto_483483 ?auto_483484 ?auto_483485 )
      ( MAKE-16PILE ?auto_483482 ?auto_483483 ?auto_483484 ?auto_483485 ?auto_483486 ?auto_483487 ?auto_483488 ?auto_483489 ?auto_483490 ?auto_483491 ?auto_483492 ?auto_483493 ?auto_483494 ?auto_483495 ?auto_483496 ?auto_483497 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483515 - BLOCK
      ?auto_483516 - BLOCK
      ?auto_483517 - BLOCK
      ?auto_483518 - BLOCK
      ?auto_483519 - BLOCK
      ?auto_483520 - BLOCK
      ?auto_483521 - BLOCK
      ?auto_483522 - BLOCK
      ?auto_483523 - BLOCK
      ?auto_483524 - BLOCK
      ?auto_483525 - BLOCK
      ?auto_483526 - BLOCK
      ?auto_483527 - BLOCK
      ?auto_483528 - BLOCK
      ?auto_483529 - BLOCK
      ?auto_483530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_483530 ) ( ON-TABLE ?auto_483515 ) ( ON ?auto_483516 ?auto_483515 ) ( ON ?auto_483517 ?auto_483516 ) ( not ( = ?auto_483515 ?auto_483516 ) ) ( not ( = ?auto_483515 ?auto_483517 ) ) ( not ( = ?auto_483515 ?auto_483518 ) ) ( not ( = ?auto_483515 ?auto_483519 ) ) ( not ( = ?auto_483515 ?auto_483520 ) ) ( not ( = ?auto_483515 ?auto_483521 ) ) ( not ( = ?auto_483515 ?auto_483522 ) ) ( not ( = ?auto_483515 ?auto_483523 ) ) ( not ( = ?auto_483515 ?auto_483524 ) ) ( not ( = ?auto_483515 ?auto_483525 ) ) ( not ( = ?auto_483515 ?auto_483526 ) ) ( not ( = ?auto_483515 ?auto_483527 ) ) ( not ( = ?auto_483515 ?auto_483528 ) ) ( not ( = ?auto_483515 ?auto_483529 ) ) ( not ( = ?auto_483515 ?auto_483530 ) ) ( not ( = ?auto_483516 ?auto_483517 ) ) ( not ( = ?auto_483516 ?auto_483518 ) ) ( not ( = ?auto_483516 ?auto_483519 ) ) ( not ( = ?auto_483516 ?auto_483520 ) ) ( not ( = ?auto_483516 ?auto_483521 ) ) ( not ( = ?auto_483516 ?auto_483522 ) ) ( not ( = ?auto_483516 ?auto_483523 ) ) ( not ( = ?auto_483516 ?auto_483524 ) ) ( not ( = ?auto_483516 ?auto_483525 ) ) ( not ( = ?auto_483516 ?auto_483526 ) ) ( not ( = ?auto_483516 ?auto_483527 ) ) ( not ( = ?auto_483516 ?auto_483528 ) ) ( not ( = ?auto_483516 ?auto_483529 ) ) ( not ( = ?auto_483516 ?auto_483530 ) ) ( not ( = ?auto_483517 ?auto_483518 ) ) ( not ( = ?auto_483517 ?auto_483519 ) ) ( not ( = ?auto_483517 ?auto_483520 ) ) ( not ( = ?auto_483517 ?auto_483521 ) ) ( not ( = ?auto_483517 ?auto_483522 ) ) ( not ( = ?auto_483517 ?auto_483523 ) ) ( not ( = ?auto_483517 ?auto_483524 ) ) ( not ( = ?auto_483517 ?auto_483525 ) ) ( not ( = ?auto_483517 ?auto_483526 ) ) ( not ( = ?auto_483517 ?auto_483527 ) ) ( not ( = ?auto_483517 ?auto_483528 ) ) ( not ( = ?auto_483517 ?auto_483529 ) ) ( not ( = ?auto_483517 ?auto_483530 ) ) ( not ( = ?auto_483518 ?auto_483519 ) ) ( not ( = ?auto_483518 ?auto_483520 ) ) ( not ( = ?auto_483518 ?auto_483521 ) ) ( not ( = ?auto_483518 ?auto_483522 ) ) ( not ( = ?auto_483518 ?auto_483523 ) ) ( not ( = ?auto_483518 ?auto_483524 ) ) ( not ( = ?auto_483518 ?auto_483525 ) ) ( not ( = ?auto_483518 ?auto_483526 ) ) ( not ( = ?auto_483518 ?auto_483527 ) ) ( not ( = ?auto_483518 ?auto_483528 ) ) ( not ( = ?auto_483518 ?auto_483529 ) ) ( not ( = ?auto_483518 ?auto_483530 ) ) ( not ( = ?auto_483519 ?auto_483520 ) ) ( not ( = ?auto_483519 ?auto_483521 ) ) ( not ( = ?auto_483519 ?auto_483522 ) ) ( not ( = ?auto_483519 ?auto_483523 ) ) ( not ( = ?auto_483519 ?auto_483524 ) ) ( not ( = ?auto_483519 ?auto_483525 ) ) ( not ( = ?auto_483519 ?auto_483526 ) ) ( not ( = ?auto_483519 ?auto_483527 ) ) ( not ( = ?auto_483519 ?auto_483528 ) ) ( not ( = ?auto_483519 ?auto_483529 ) ) ( not ( = ?auto_483519 ?auto_483530 ) ) ( not ( = ?auto_483520 ?auto_483521 ) ) ( not ( = ?auto_483520 ?auto_483522 ) ) ( not ( = ?auto_483520 ?auto_483523 ) ) ( not ( = ?auto_483520 ?auto_483524 ) ) ( not ( = ?auto_483520 ?auto_483525 ) ) ( not ( = ?auto_483520 ?auto_483526 ) ) ( not ( = ?auto_483520 ?auto_483527 ) ) ( not ( = ?auto_483520 ?auto_483528 ) ) ( not ( = ?auto_483520 ?auto_483529 ) ) ( not ( = ?auto_483520 ?auto_483530 ) ) ( not ( = ?auto_483521 ?auto_483522 ) ) ( not ( = ?auto_483521 ?auto_483523 ) ) ( not ( = ?auto_483521 ?auto_483524 ) ) ( not ( = ?auto_483521 ?auto_483525 ) ) ( not ( = ?auto_483521 ?auto_483526 ) ) ( not ( = ?auto_483521 ?auto_483527 ) ) ( not ( = ?auto_483521 ?auto_483528 ) ) ( not ( = ?auto_483521 ?auto_483529 ) ) ( not ( = ?auto_483521 ?auto_483530 ) ) ( not ( = ?auto_483522 ?auto_483523 ) ) ( not ( = ?auto_483522 ?auto_483524 ) ) ( not ( = ?auto_483522 ?auto_483525 ) ) ( not ( = ?auto_483522 ?auto_483526 ) ) ( not ( = ?auto_483522 ?auto_483527 ) ) ( not ( = ?auto_483522 ?auto_483528 ) ) ( not ( = ?auto_483522 ?auto_483529 ) ) ( not ( = ?auto_483522 ?auto_483530 ) ) ( not ( = ?auto_483523 ?auto_483524 ) ) ( not ( = ?auto_483523 ?auto_483525 ) ) ( not ( = ?auto_483523 ?auto_483526 ) ) ( not ( = ?auto_483523 ?auto_483527 ) ) ( not ( = ?auto_483523 ?auto_483528 ) ) ( not ( = ?auto_483523 ?auto_483529 ) ) ( not ( = ?auto_483523 ?auto_483530 ) ) ( not ( = ?auto_483524 ?auto_483525 ) ) ( not ( = ?auto_483524 ?auto_483526 ) ) ( not ( = ?auto_483524 ?auto_483527 ) ) ( not ( = ?auto_483524 ?auto_483528 ) ) ( not ( = ?auto_483524 ?auto_483529 ) ) ( not ( = ?auto_483524 ?auto_483530 ) ) ( not ( = ?auto_483525 ?auto_483526 ) ) ( not ( = ?auto_483525 ?auto_483527 ) ) ( not ( = ?auto_483525 ?auto_483528 ) ) ( not ( = ?auto_483525 ?auto_483529 ) ) ( not ( = ?auto_483525 ?auto_483530 ) ) ( not ( = ?auto_483526 ?auto_483527 ) ) ( not ( = ?auto_483526 ?auto_483528 ) ) ( not ( = ?auto_483526 ?auto_483529 ) ) ( not ( = ?auto_483526 ?auto_483530 ) ) ( not ( = ?auto_483527 ?auto_483528 ) ) ( not ( = ?auto_483527 ?auto_483529 ) ) ( not ( = ?auto_483527 ?auto_483530 ) ) ( not ( = ?auto_483528 ?auto_483529 ) ) ( not ( = ?auto_483528 ?auto_483530 ) ) ( not ( = ?auto_483529 ?auto_483530 ) ) ( ON ?auto_483529 ?auto_483530 ) ( ON ?auto_483528 ?auto_483529 ) ( ON ?auto_483527 ?auto_483528 ) ( ON ?auto_483526 ?auto_483527 ) ( ON ?auto_483525 ?auto_483526 ) ( ON ?auto_483524 ?auto_483525 ) ( ON ?auto_483523 ?auto_483524 ) ( ON ?auto_483522 ?auto_483523 ) ( ON ?auto_483521 ?auto_483522 ) ( ON ?auto_483520 ?auto_483521 ) ( ON ?auto_483519 ?auto_483520 ) ( CLEAR ?auto_483517 ) ( ON ?auto_483518 ?auto_483519 ) ( CLEAR ?auto_483518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_483515 ?auto_483516 ?auto_483517 ?auto_483518 )
      ( MAKE-16PILE ?auto_483515 ?auto_483516 ?auto_483517 ?auto_483518 ?auto_483519 ?auto_483520 ?auto_483521 ?auto_483522 ?auto_483523 ?auto_483524 ?auto_483525 ?auto_483526 ?auto_483527 ?auto_483528 ?auto_483529 ?auto_483530 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483547 - BLOCK
      ?auto_483548 - BLOCK
      ?auto_483549 - BLOCK
      ?auto_483550 - BLOCK
      ?auto_483551 - BLOCK
      ?auto_483552 - BLOCK
      ?auto_483553 - BLOCK
      ?auto_483554 - BLOCK
      ?auto_483555 - BLOCK
      ?auto_483556 - BLOCK
      ?auto_483557 - BLOCK
      ?auto_483558 - BLOCK
      ?auto_483559 - BLOCK
      ?auto_483560 - BLOCK
      ?auto_483561 - BLOCK
      ?auto_483562 - BLOCK
    )
    :vars
    (
      ?auto_483563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483562 ?auto_483563 ) ( ON-TABLE ?auto_483547 ) ( ON ?auto_483548 ?auto_483547 ) ( not ( = ?auto_483547 ?auto_483548 ) ) ( not ( = ?auto_483547 ?auto_483549 ) ) ( not ( = ?auto_483547 ?auto_483550 ) ) ( not ( = ?auto_483547 ?auto_483551 ) ) ( not ( = ?auto_483547 ?auto_483552 ) ) ( not ( = ?auto_483547 ?auto_483553 ) ) ( not ( = ?auto_483547 ?auto_483554 ) ) ( not ( = ?auto_483547 ?auto_483555 ) ) ( not ( = ?auto_483547 ?auto_483556 ) ) ( not ( = ?auto_483547 ?auto_483557 ) ) ( not ( = ?auto_483547 ?auto_483558 ) ) ( not ( = ?auto_483547 ?auto_483559 ) ) ( not ( = ?auto_483547 ?auto_483560 ) ) ( not ( = ?auto_483547 ?auto_483561 ) ) ( not ( = ?auto_483547 ?auto_483562 ) ) ( not ( = ?auto_483547 ?auto_483563 ) ) ( not ( = ?auto_483548 ?auto_483549 ) ) ( not ( = ?auto_483548 ?auto_483550 ) ) ( not ( = ?auto_483548 ?auto_483551 ) ) ( not ( = ?auto_483548 ?auto_483552 ) ) ( not ( = ?auto_483548 ?auto_483553 ) ) ( not ( = ?auto_483548 ?auto_483554 ) ) ( not ( = ?auto_483548 ?auto_483555 ) ) ( not ( = ?auto_483548 ?auto_483556 ) ) ( not ( = ?auto_483548 ?auto_483557 ) ) ( not ( = ?auto_483548 ?auto_483558 ) ) ( not ( = ?auto_483548 ?auto_483559 ) ) ( not ( = ?auto_483548 ?auto_483560 ) ) ( not ( = ?auto_483548 ?auto_483561 ) ) ( not ( = ?auto_483548 ?auto_483562 ) ) ( not ( = ?auto_483548 ?auto_483563 ) ) ( not ( = ?auto_483549 ?auto_483550 ) ) ( not ( = ?auto_483549 ?auto_483551 ) ) ( not ( = ?auto_483549 ?auto_483552 ) ) ( not ( = ?auto_483549 ?auto_483553 ) ) ( not ( = ?auto_483549 ?auto_483554 ) ) ( not ( = ?auto_483549 ?auto_483555 ) ) ( not ( = ?auto_483549 ?auto_483556 ) ) ( not ( = ?auto_483549 ?auto_483557 ) ) ( not ( = ?auto_483549 ?auto_483558 ) ) ( not ( = ?auto_483549 ?auto_483559 ) ) ( not ( = ?auto_483549 ?auto_483560 ) ) ( not ( = ?auto_483549 ?auto_483561 ) ) ( not ( = ?auto_483549 ?auto_483562 ) ) ( not ( = ?auto_483549 ?auto_483563 ) ) ( not ( = ?auto_483550 ?auto_483551 ) ) ( not ( = ?auto_483550 ?auto_483552 ) ) ( not ( = ?auto_483550 ?auto_483553 ) ) ( not ( = ?auto_483550 ?auto_483554 ) ) ( not ( = ?auto_483550 ?auto_483555 ) ) ( not ( = ?auto_483550 ?auto_483556 ) ) ( not ( = ?auto_483550 ?auto_483557 ) ) ( not ( = ?auto_483550 ?auto_483558 ) ) ( not ( = ?auto_483550 ?auto_483559 ) ) ( not ( = ?auto_483550 ?auto_483560 ) ) ( not ( = ?auto_483550 ?auto_483561 ) ) ( not ( = ?auto_483550 ?auto_483562 ) ) ( not ( = ?auto_483550 ?auto_483563 ) ) ( not ( = ?auto_483551 ?auto_483552 ) ) ( not ( = ?auto_483551 ?auto_483553 ) ) ( not ( = ?auto_483551 ?auto_483554 ) ) ( not ( = ?auto_483551 ?auto_483555 ) ) ( not ( = ?auto_483551 ?auto_483556 ) ) ( not ( = ?auto_483551 ?auto_483557 ) ) ( not ( = ?auto_483551 ?auto_483558 ) ) ( not ( = ?auto_483551 ?auto_483559 ) ) ( not ( = ?auto_483551 ?auto_483560 ) ) ( not ( = ?auto_483551 ?auto_483561 ) ) ( not ( = ?auto_483551 ?auto_483562 ) ) ( not ( = ?auto_483551 ?auto_483563 ) ) ( not ( = ?auto_483552 ?auto_483553 ) ) ( not ( = ?auto_483552 ?auto_483554 ) ) ( not ( = ?auto_483552 ?auto_483555 ) ) ( not ( = ?auto_483552 ?auto_483556 ) ) ( not ( = ?auto_483552 ?auto_483557 ) ) ( not ( = ?auto_483552 ?auto_483558 ) ) ( not ( = ?auto_483552 ?auto_483559 ) ) ( not ( = ?auto_483552 ?auto_483560 ) ) ( not ( = ?auto_483552 ?auto_483561 ) ) ( not ( = ?auto_483552 ?auto_483562 ) ) ( not ( = ?auto_483552 ?auto_483563 ) ) ( not ( = ?auto_483553 ?auto_483554 ) ) ( not ( = ?auto_483553 ?auto_483555 ) ) ( not ( = ?auto_483553 ?auto_483556 ) ) ( not ( = ?auto_483553 ?auto_483557 ) ) ( not ( = ?auto_483553 ?auto_483558 ) ) ( not ( = ?auto_483553 ?auto_483559 ) ) ( not ( = ?auto_483553 ?auto_483560 ) ) ( not ( = ?auto_483553 ?auto_483561 ) ) ( not ( = ?auto_483553 ?auto_483562 ) ) ( not ( = ?auto_483553 ?auto_483563 ) ) ( not ( = ?auto_483554 ?auto_483555 ) ) ( not ( = ?auto_483554 ?auto_483556 ) ) ( not ( = ?auto_483554 ?auto_483557 ) ) ( not ( = ?auto_483554 ?auto_483558 ) ) ( not ( = ?auto_483554 ?auto_483559 ) ) ( not ( = ?auto_483554 ?auto_483560 ) ) ( not ( = ?auto_483554 ?auto_483561 ) ) ( not ( = ?auto_483554 ?auto_483562 ) ) ( not ( = ?auto_483554 ?auto_483563 ) ) ( not ( = ?auto_483555 ?auto_483556 ) ) ( not ( = ?auto_483555 ?auto_483557 ) ) ( not ( = ?auto_483555 ?auto_483558 ) ) ( not ( = ?auto_483555 ?auto_483559 ) ) ( not ( = ?auto_483555 ?auto_483560 ) ) ( not ( = ?auto_483555 ?auto_483561 ) ) ( not ( = ?auto_483555 ?auto_483562 ) ) ( not ( = ?auto_483555 ?auto_483563 ) ) ( not ( = ?auto_483556 ?auto_483557 ) ) ( not ( = ?auto_483556 ?auto_483558 ) ) ( not ( = ?auto_483556 ?auto_483559 ) ) ( not ( = ?auto_483556 ?auto_483560 ) ) ( not ( = ?auto_483556 ?auto_483561 ) ) ( not ( = ?auto_483556 ?auto_483562 ) ) ( not ( = ?auto_483556 ?auto_483563 ) ) ( not ( = ?auto_483557 ?auto_483558 ) ) ( not ( = ?auto_483557 ?auto_483559 ) ) ( not ( = ?auto_483557 ?auto_483560 ) ) ( not ( = ?auto_483557 ?auto_483561 ) ) ( not ( = ?auto_483557 ?auto_483562 ) ) ( not ( = ?auto_483557 ?auto_483563 ) ) ( not ( = ?auto_483558 ?auto_483559 ) ) ( not ( = ?auto_483558 ?auto_483560 ) ) ( not ( = ?auto_483558 ?auto_483561 ) ) ( not ( = ?auto_483558 ?auto_483562 ) ) ( not ( = ?auto_483558 ?auto_483563 ) ) ( not ( = ?auto_483559 ?auto_483560 ) ) ( not ( = ?auto_483559 ?auto_483561 ) ) ( not ( = ?auto_483559 ?auto_483562 ) ) ( not ( = ?auto_483559 ?auto_483563 ) ) ( not ( = ?auto_483560 ?auto_483561 ) ) ( not ( = ?auto_483560 ?auto_483562 ) ) ( not ( = ?auto_483560 ?auto_483563 ) ) ( not ( = ?auto_483561 ?auto_483562 ) ) ( not ( = ?auto_483561 ?auto_483563 ) ) ( not ( = ?auto_483562 ?auto_483563 ) ) ( ON ?auto_483561 ?auto_483562 ) ( ON ?auto_483560 ?auto_483561 ) ( ON ?auto_483559 ?auto_483560 ) ( ON ?auto_483558 ?auto_483559 ) ( ON ?auto_483557 ?auto_483558 ) ( ON ?auto_483556 ?auto_483557 ) ( ON ?auto_483555 ?auto_483556 ) ( ON ?auto_483554 ?auto_483555 ) ( ON ?auto_483553 ?auto_483554 ) ( ON ?auto_483552 ?auto_483553 ) ( ON ?auto_483551 ?auto_483552 ) ( ON ?auto_483550 ?auto_483551 ) ( CLEAR ?auto_483548 ) ( ON ?auto_483549 ?auto_483550 ) ( CLEAR ?auto_483549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_483547 ?auto_483548 ?auto_483549 )
      ( MAKE-16PILE ?auto_483547 ?auto_483548 ?auto_483549 ?auto_483550 ?auto_483551 ?auto_483552 ?auto_483553 ?auto_483554 ?auto_483555 ?auto_483556 ?auto_483557 ?auto_483558 ?auto_483559 ?auto_483560 ?auto_483561 ?auto_483562 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483580 - BLOCK
      ?auto_483581 - BLOCK
      ?auto_483582 - BLOCK
      ?auto_483583 - BLOCK
      ?auto_483584 - BLOCK
      ?auto_483585 - BLOCK
      ?auto_483586 - BLOCK
      ?auto_483587 - BLOCK
      ?auto_483588 - BLOCK
      ?auto_483589 - BLOCK
      ?auto_483590 - BLOCK
      ?auto_483591 - BLOCK
      ?auto_483592 - BLOCK
      ?auto_483593 - BLOCK
      ?auto_483594 - BLOCK
      ?auto_483595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_483595 ) ( ON-TABLE ?auto_483580 ) ( ON ?auto_483581 ?auto_483580 ) ( not ( = ?auto_483580 ?auto_483581 ) ) ( not ( = ?auto_483580 ?auto_483582 ) ) ( not ( = ?auto_483580 ?auto_483583 ) ) ( not ( = ?auto_483580 ?auto_483584 ) ) ( not ( = ?auto_483580 ?auto_483585 ) ) ( not ( = ?auto_483580 ?auto_483586 ) ) ( not ( = ?auto_483580 ?auto_483587 ) ) ( not ( = ?auto_483580 ?auto_483588 ) ) ( not ( = ?auto_483580 ?auto_483589 ) ) ( not ( = ?auto_483580 ?auto_483590 ) ) ( not ( = ?auto_483580 ?auto_483591 ) ) ( not ( = ?auto_483580 ?auto_483592 ) ) ( not ( = ?auto_483580 ?auto_483593 ) ) ( not ( = ?auto_483580 ?auto_483594 ) ) ( not ( = ?auto_483580 ?auto_483595 ) ) ( not ( = ?auto_483581 ?auto_483582 ) ) ( not ( = ?auto_483581 ?auto_483583 ) ) ( not ( = ?auto_483581 ?auto_483584 ) ) ( not ( = ?auto_483581 ?auto_483585 ) ) ( not ( = ?auto_483581 ?auto_483586 ) ) ( not ( = ?auto_483581 ?auto_483587 ) ) ( not ( = ?auto_483581 ?auto_483588 ) ) ( not ( = ?auto_483581 ?auto_483589 ) ) ( not ( = ?auto_483581 ?auto_483590 ) ) ( not ( = ?auto_483581 ?auto_483591 ) ) ( not ( = ?auto_483581 ?auto_483592 ) ) ( not ( = ?auto_483581 ?auto_483593 ) ) ( not ( = ?auto_483581 ?auto_483594 ) ) ( not ( = ?auto_483581 ?auto_483595 ) ) ( not ( = ?auto_483582 ?auto_483583 ) ) ( not ( = ?auto_483582 ?auto_483584 ) ) ( not ( = ?auto_483582 ?auto_483585 ) ) ( not ( = ?auto_483582 ?auto_483586 ) ) ( not ( = ?auto_483582 ?auto_483587 ) ) ( not ( = ?auto_483582 ?auto_483588 ) ) ( not ( = ?auto_483582 ?auto_483589 ) ) ( not ( = ?auto_483582 ?auto_483590 ) ) ( not ( = ?auto_483582 ?auto_483591 ) ) ( not ( = ?auto_483582 ?auto_483592 ) ) ( not ( = ?auto_483582 ?auto_483593 ) ) ( not ( = ?auto_483582 ?auto_483594 ) ) ( not ( = ?auto_483582 ?auto_483595 ) ) ( not ( = ?auto_483583 ?auto_483584 ) ) ( not ( = ?auto_483583 ?auto_483585 ) ) ( not ( = ?auto_483583 ?auto_483586 ) ) ( not ( = ?auto_483583 ?auto_483587 ) ) ( not ( = ?auto_483583 ?auto_483588 ) ) ( not ( = ?auto_483583 ?auto_483589 ) ) ( not ( = ?auto_483583 ?auto_483590 ) ) ( not ( = ?auto_483583 ?auto_483591 ) ) ( not ( = ?auto_483583 ?auto_483592 ) ) ( not ( = ?auto_483583 ?auto_483593 ) ) ( not ( = ?auto_483583 ?auto_483594 ) ) ( not ( = ?auto_483583 ?auto_483595 ) ) ( not ( = ?auto_483584 ?auto_483585 ) ) ( not ( = ?auto_483584 ?auto_483586 ) ) ( not ( = ?auto_483584 ?auto_483587 ) ) ( not ( = ?auto_483584 ?auto_483588 ) ) ( not ( = ?auto_483584 ?auto_483589 ) ) ( not ( = ?auto_483584 ?auto_483590 ) ) ( not ( = ?auto_483584 ?auto_483591 ) ) ( not ( = ?auto_483584 ?auto_483592 ) ) ( not ( = ?auto_483584 ?auto_483593 ) ) ( not ( = ?auto_483584 ?auto_483594 ) ) ( not ( = ?auto_483584 ?auto_483595 ) ) ( not ( = ?auto_483585 ?auto_483586 ) ) ( not ( = ?auto_483585 ?auto_483587 ) ) ( not ( = ?auto_483585 ?auto_483588 ) ) ( not ( = ?auto_483585 ?auto_483589 ) ) ( not ( = ?auto_483585 ?auto_483590 ) ) ( not ( = ?auto_483585 ?auto_483591 ) ) ( not ( = ?auto_483585 ?auto_483592 ) ) ( not ( = ?auto_483585 ?auto_483593 ) ) ( not ( = ?auto_483585 ?auto_483594 ) ) ( not ( = ?auto_483585 ?auto_483595 ) ) ( not ( = ?auto_483586 ?auto_483587 ) ) ( not ( = ?auto_483586 ?auto_483588 ) ) ( not ( = ?auto_483586 ?auto_483589 ) ) ( not ( = ?auto_483586 ?auto_483590 ) ) ( not ( = ?auto_483586 ?auto_483591 ) ) ( not ( = ?auto_483586 ?auto_483592 ) ) ( not ( = ?auto_483586 ?auto_483593 ) ) ( not ( = ?auto_483586 ?auto_483594 ) ) ( not ( = ?auto_483586 ?auto_483595 ) ) ( not ( = ?auto_483587 ?auto_483588 ) ) ( not ( = ?auto_483587 ?auto_483589 ) ) ( not ( = ?auto_483587 ?auto_483590 ) ) ( not ( = ?auto_483587 ?auto_483591 ) ) ( not ( = ?auto_483587 ?auto_483592 ) ) ( not ( = ?auto_483587 ?auto_483593 ) ) ( not ( = ?auto_483587 ?auto_483594 ) ) ( not ( = ?auto_483587 ?auto_483595 ) ) ( not ( = ?auto_483588 ?auto_483589 ) ) ( not ( = ?auto_483588 ?auto_483590 ) ) ( not ( = ?auto_483588 ?auto_483591 ) ) ( not ( = ?auto_483588 ?auto_483592 ) ) ( not ( = ?auto_483588 ?auto_483593 ) ) ( not ( = ?auto_483588 ?auto_483594 ) ) ( not ( = ?auto_483588 ?auto_483595 ) ) ( not ( = ?auto_483589 ?auto_483590 ) ) ( not ( = ?auto_483589 ?auto_483591 ) ) ( not ( = ?auto_483589 ?auto_483592 ) ) ( not ( = ?auto_483589 ?auto_483593 ) ) ( not ( = ?auto_483589 ?auto_483594 ) ) ( not ( = ?auto_483589 ?auto_483595 ) ) ( not ( = ?auto_483590 ?auto_483591 ) ) ( not ( = ?auto_483590 ?auto_483592 ) ) ( not ( = ?auto_483590 ?auto_483593 ) ) ( not ( = ?auto_483590 ?auto_483594 ) ) ( not ( = ?auto_483590 ?auto_483595 ) ) ( not ( = ?auto_483591 ?auto_483592 ) ) ( not ( = ?auto_483591 ?auto_483593 ) ) ( not ( = ?auto_483591 ?auto_483594 ) ) ( not ( = ?auto_483591 ?auto_483595 ) ) ( not ( = ?auto_483592 ?auto_483593 ) ) ( not ( = ?auto_483592 ?auto_483594 ) ) ( not ( = ?auto_483592 ?auto_483595 ) ) ( not ( = ?auto_483593 ?auto_483594 ) ) ( not ( = ?auto_483593 ?auto_483595 ) ) ( not ( = ?auto_483594 ?auto_483595 ) ) ( ON ?auto_483594 ?auto_483595 ) ( ON ?auto_483593 ?auto_483594 ) ( ON ?auto_483592 ?auto_483593 ) ( ON ?auto_483591 ?auto_483592 ) ( ON ?auto_483590 ?auto_483591 ) ( ON ?auto_483589 ?auto_483590 ) ( ON ?auto_483588 ?auto_483589 ) ( ON ?auto_483587 ?auto_483588 ) ( ON ?auto_483586 ?auto_483587 ) ( ON ?auto_483585 ?auto_483586 ) ( ON ?auto_483584 ?auto_483585 ) ( ON ?auto_483583 ?auto_483584 ) ( CLEAR ?auto_483581 ) ( ON ?auto_483582 ?auto_483583 ) ( CLEAR ?auto_483582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_483580 ?auto_483581 ?auto_483582 )
      ( MAKE-16PILE ?auto_483580 ?auto_483581 ?auto_483582 ?auto_483583 ?auto_483584 ?auto_483585 ?auto_483586 ?auto_483587 ?auto_483588 ?auto_483589 ?auto_483590 ?auto_483591 ?auto_483592 ?auto_483593 ?auto_483594 ?auto_483595 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483612 - BLOCK
      ?auto_483613 - BLOCK
      ?auto_483614 - BLOCK
      ?auto_483615 - BLOCK
      ?auto_483616 - BLOCK
      ?auto_483617 - BLOCK
      ?auto_483618 - BLOCK
      ?auto_483619 - BLOCK
      ?auto_483620 - BLOCK
      ?auto_483621 - BLOCK
      ?auto_483622 - BLOCK
      ?auto_483623 - BLOCK
      ?auto_483624 - BLOCK
      ?auto_483625 - BLOCK
      ?auto_483626 - BLOCK
      ?auto_483627 - BLOCK
    )
    :vars
    (
      ?auto_483628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483627 ?auto_483628 ) ( ON-TABLE ?auto_483612 ) ( not ( = ?auto_483612 ?auto_483613 ) ) ( not ( = ?auto_483612 ?auto_483614 ) ) ( not ( = ?auto_483612 ?auto_483615 ) ) ( not ( = ?auto_483612 ?auto_483616 ) ) ( not ( = ?auto_483612 ?auto_483617 ) ) ( not ( = ?auto_483612 ?auto_483618 ) ) ( not ( = ?auto_483612 ?auto_483619 ) ) ( not ( = ?auto_483612 ?auto_483620 ) ) ( not ( = ?auto_483612 ?auto_483621 ) ) ( not ( = ?auto_483612 ?auto_483622 ) ) ( not ( = ?auto_483612 ?auto_483623 ) ) ( not ( = ?auto_483612 ?auto_483624 ) ) ( not ( = ?auto_483612 ?auto_483625 ) ) ( not ( = ?auto_483612 ?auto_483626 ) ) ( not ( = ?auto_483612 ?auto_483627 ) ) ( not ( = ?auto_483612 ?auto_483628 ) ) ( not ( = ?auto_483613 ?auto_483614 ) ) ( not ( = ?auto_483613 ?auto_483615 ) ) ( not ( = ?auto_483613 ?auto_483616 ) ) ( not ( = ?auto_483613 ?auto_483617 ) ) ( not ( = ?auto_483613 ?auto_483618 ) ) ( not ( = ?auto_483613 ?auto_483619 ) ) ( not ( = ?auto_483613 ?auto_483620 ) ) ( not ( = ?auto_483613 ?auto_483621 ) ) ( not ( = ?auto_483613 ?auto_483622 ) ) ( not ( = ?auto_483613 ?auto_483623 ) ) ( not ( = ?auto_483613 ?auto_483624 ) ) ( not ( = ?auto_483613 ?auto_483625 ) ) ( not ( = ?auto_483613 ?auto_483626 ) ) ( not ( = ?auto_483613 ?auto_483627 ) ) ( not ( = ?auto_483613 ?auto_483628 ) ) ( not ( = ?auto_483614 ?auto_483615 ) ) ( not ( = ?auto_483614 ?auto_483616 ) ) ( not ( = ?auto_483614 ?auto_483617 ) ) ( not ( = ?auto_483614 ?auto_483618 ) ) ( not ( = ?auto_483614 ?auto_483619 ) ) ( not ( = ?auto_483614 ?auto_483620 ) ) ( not ( = ?auto_483614 ?auto_483621 ) ) ( not ( = ?auto_483614 ?auto_483622 ) ) ( not ( = ?auto_483614 ?auto_483623 ) ) ( not ( = ?auto_483614 ?auto_483624 ) ) ( not ( = ?auto_483614 ?auto_483625 ) ) ( not ( = ?auto_483614 ?auto_483626 ) ) ( not ( = ?auto_483614 ?auto_483627 ) ) ( not ( = ?auto_483614 ?auto_483628 ) ) ( not ( = ?auto_483615 ?auto_483616 ) ) ( not ( = ?auto_483615 ?auto_483617 ) ) ( not ( = ?auto_483615 ?auto_483618 ) ) ( not ( = ?auto_483615 ?auto_483619 ) ) ( not ( = ?auto_483615 ?auto_483620 ) ) ( not ( = ?auto_483615 ?auto_483621 ) ) ( not ( = ?auto_483615 ?auto_483622 ) ) ( not ( = ?auto_483615 ?auto_483623 ) ) ( not ( = ?auto_483615 ?auto_483624 ) ) ( not ( = ?auto_483615 ?auto_483625 ) ) ( not ( = ?auto_483615 ?auto_483626 ) ) ( not ( = ?auto_483615 ?auto_483627 ) ) ( not ( = ?auto_483615 ?auto_483628 ) ) ( not ( = ?auto_483616 ?auto_483617 ) ) ( not ( = ?auto_483616 ?auto_483618 ) ) ( not ( = ?auto_483616 ?auto_483619 ) ) ( not ( = ?auto_483616 ?auto_483620 ) ) ( not ( = ?auto_483616 ?auto_483621 ) ) ( not ( = ?auto_483616 ?auto_483622 ) ) ( not ( = ?auto_483616 ?auto_483623 ) ) ( not ( = ?auto_483616 ?auto_483624 ) ) ( not ( = ?auto_483616 ?auto_483625 ) ) ( not ( = ?auto_483616 ?auto_483626 ) ) ( not ( = ?auto_483616 ?auto_483627 ) ) ( not ( = ?auto_483616 ?auto_483628 ) ) ( not ( = ?auto_483617 ?auto_483618 ) ) ( not ( = ?auto_483617 ?auto_483619 ) ) ( not ( = ?auto_483617 ?auto_483620 ) ) ( not ( = ?auto_483617 ?auto_483621 ) ) ( not ( = ?auto_483617 ?auto_483622 ) ) ( not ( = ?auto_483617 ?auto_483623 ) ) ( not ( = ?auto_483617 ?auto_483624 ) ) ( not ( = ?auto_483617 ?auto_483625 ) ) ( not ( = ?auto_483617 ?auto_483626 ) ) ( not ( = ?auto_483617 ?auto_483627 ) ) ( not ( = ?auto_483617 ?auto_483628 ) ) ( not ( = ?auto_483618 ?auto_483619 ) ) ( not ( = ?auto_483618 ?auto_483620 ) ) ( not ( = ?auto_483618 ?auto_483621 ) ) ( not ( = ?auto_483618 ?auto_483622 ) ) ( not ( = ?auto_483618 ?auto_483623 ) ) ( not ( = ?auto_483618 ?auto_483624 ) ) ( not ( = ?auto_483618 ?auto_483625 ) ) ( not ( = ?auto_483618 ?auto_483626 ) ) ( not ( = ?auto_483618 ?auto_483627 ) ) ( not ( = ?auto_483618 ?auto_483628 ) ) ( not ( = ?auto_483619 ?auto_483620 ) ) ( not ( = ?auto_483619 ?auto_483621 ) ) ( not ( = ?auto_483619 ?auto_483622 ) ) ( not ( = ?auto_483619 ?auto_483623 ) ) ( not ( = ?auto_483619 ?auto_483624 ) ) ( not ( = ?auto_483619 ?auto_483625 ) ) ( not ( = ?auto_483619 ?auto_483626 ) ) ( not ( = ?auto_483619 ?auto_483627 ) ) ( not ( = ?auto_483619 ?auto_483628 ) ) ( not ( = ?auto_483620 ?auto_483621 ) ) ( not ( = ?auto_483620 ?auto_483622 ) ) ( not ( = ?auto_483620 ?auto_483623 ) ) ( not ( = ?auto_483620 ?auto_483624 ) ) ( not ( = ?auto_483620 ?auto_483625 ) ) ( not ( = ?auto_483620 ?auto_483626 ) ) ( not ( = ?auto_483620 ?auto_483627 ) ) ( not ( = ?auto_483620 ?auto_483628 ) ) ( not ( = ?auto_483621 ?auto_483622 ) ) ( not ( = ?auto_483621 ?auto_483623 ) ) ( not ( = ?auto_483621 ?auto_483624 ) ) ( not ( = ?auto_483621 ?auto_483625 ) ) ( not ( = ?auto_483621 ?auto_483626 ) ) ( not ( = ?auto_483621 ?auto_483627 ) ) ( not ( = ?auto_483621 ?auto_483628 ) ) ( not ( = ?auto_483622 ?auto_483623 ) ) ( not ( = ?auto_483622 ?auto_483624 ) ) ( not ( = ?auto_483622 ?auto_483625 ) ) ( not ( = ?auto_483622 ?auto_483626 ) ) ( not ( = ?auto_483622 ?auto_483627 ) ) ( not ( = ?auto_483622 ?auto_483628 ) ) ( not ( = ?auto_483623 ?auto_483624 ) ) ( not ( = ?auto_483623 ?auto_483625 ) ) ( not ( = ?auto_483623 ?auto_483626 ) ) ( not ( = ?auto_483623 ?auto_483627 ) ) ( not ( = ?auto_483623 ?auto_483628 ) ) ( not ( = ?auto_483624 ?auto_483625 ) ) ( not ( = ?auto_483624 ?auto_483626 ) ) ( not ( = ?auto_483624 ?auto_483627 ) ) ( not ( = ?auto_483624 ?auto_483628 ) ) ( not ( = ?auto_483625 ?auto_483626 ) ) ( not ( = ?auto_483625 ?auto_483627 ) ) ( not ( = ?auto_483625 ?auto_483628 ) ) ( not ( = ?auto_483626 ?auto_483627 ) ) ( not ( = ?auto_483626 ?auto_483628 ) ) ( not ( = ?auto_483627 ?auto_483628 ) ) ( ON ?auto_483626 ?auto_483627 ) ( ON ?auto_483625 ?auto_483626 ) ( ON ?auto_483624 ?auto_483625 ) ( ON ?auto_483623 ?auto_483624 ) ( ON ?auto_483622 ?auto_483623 ) ( ON ?auto_483621 ?auto_483622 ) ( ON ?auto_483620 ?auto_483621 ) ( ON ?auto_483619 ?auto_483620 ) ( ON ?auto_483618 ?auto_483619 ) ( ON ?auto_483617 ?auto_483618 ) ( ON ?auto_483616 ?auto_483617 ) ( ON ?auto_483615 ?auto_483616 ) ( ON ?auto_483614 ?auto_483615 ) ( CLEAR ?auto_483612 ) ( ON ?auto_483613 ?auto_483614 ) ( CLEAR ?auto_483613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_483612 ?auto_483613 )
      ( MAKE-16PILE ?auto_483612 ?auto_483613 ?auto_483614 ?auto_483615 ?auto_483616 ?auto_483617 ?auto_483618 ?auto_483619 ?auto_483620 ?auto_483621 ?auto_483622 ?auto_483623 ?auto_483624 ?auto_483625 ?auto_483626 ?auto_483627 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483645 - BLOCK
      ?auto_483646 - BLOCK
      ?auto_483647 - BLOCK
      ?auto_483648 - BLOCK
      ?auto_483649 - BLOCK
      ?auto_483650 - BLOCK
      ?auto_483651 - BLOCK
      ?auto_483652 - BLOCK
      ?auto_483653 - BLOCK
      ?auto_483654 - BLOCK
      ?auto_483655 - BLOCK
      ?auto_483656 - BLOCK
      ?auto_483657 - BLOCK
      ?auto_483658 - BLOCK
      ?auto_483659 - BLOCK
      ?auto_483660 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_483660 ) ( ON-TABLE ?auto_483645 ) ( not ( = ?auto_483645 ?auto_483646 ) ) ( not ( = ?auto_483645 ?auto_483647 ) ) ( not ( = ?auto_483645 ?auto_483648 ) ) ( not ( = ?auto_483645 ?auto_483649 ) ) ( not ( = ?auto_483645 ?auto_483650 ) ) ( not ( = ?auto_483645 ?auto_483651 ) ) ( not ( = ?auto_483645 ?auto_483652 ) ) ( not ( = ?auto_483645 ?auto_483653 ) ) ( not ( = ?auto_483645 ?auto_483654 ) ) ( not ( = ?auto_483645 ?auto_483655 ) ) ( not ( = ?auto_483645 ?auto_483656 ) ) ( not ( = ?auto_483645 ?auto_483657 ) ) ( not ( = ?auto_483645 ?auto_483658 ) ) ( not ( = ?auto_483645 ?auto_483659 ) ) ( not ( = ?auto_483645 ?auto_483660 ) ) ( not ( = ?auto_483646 ?auto_483647 ) ) ( not ( = ?auto_483646 ?auto_483648 ) ) ( not ( = ?auto_483646 ?auto_483649 ) ) ( not ( = ?auto_483646 ?auto_483650 ) ) ( not ( = ?auto_483646 ?auto_483651 ) ) ( not ( = ?auto_483646 ?auto_483652 ) ) ( not ( = ?auto_483646 ?auto_483653 ) ) ( not ( = ?auto_483646 ?auto_483654 ) ) ( not ( = ?auto_483646 ?auto_483655 ) ) ( not ( = ?auto_483646 ?auto_483656 ) ) ( not ( = ?auto_483646 ?auto_483657 ) ) ( not ( = ?auto_483646 ?auto_483658 ) ) ( not ( = ?auto_483646 ?auto_483659 ) ) ( not ( = ?auto_483646 ?auto_483660 ) ) ( not ( = ?auto_483647 ?auto_483648 ) ) ( not ( = ?auto_483647 ?auto_483649 ) ) ( not ( = ?auto_483647 ?auto_483650 ) ) ( not ( = ?auto_483647 ?auto_483651 ) ) ( not ( = ?auto_483647 ?auto_483652 ) ) ( not ( = ?auto_483647 ?auto_483653 ) ) ( not ( = ?auto_483647 ?auto_483654 ) ) ( not ( = ?auto_483647 ?auto_483655 ) ) ( not ( = ?auto_483647 ?auto_483656 ) ) ( not ( = ?auto_483647 ?auto_483657 ) ) ( not ( = ?auto_483647 ?auto_483658 ) ) ( not ( = ?auto_483647 ?auto_483659 ) ) ( not ( = ?auto_483647 ?auto_483660 ) ) ( not ( = ?auto_483648 ?auto_483649 ) ) ( not ( = ?auto_483648 ?auto_483650 ) ) ( not ( = ?auto_483648 ?auto_483651 ) ) ( not ( = ?auto_483648 ?auto_483652 ) ) ( not ( = ?auto_483648 ?auto_483653 ) ) ( not ( = ?auto_483648 ?auto_483654 ) ) ( not ( = ?auto_483648 ?auto_483655 ) ) ( not ( = ?auto_483648 ?auto_483656 ) ) ( not ( = ?auto_483648 ?auto_483657 ) ) ( not ( = ?auto_483648 ?auto_483658 ) ) ( not ( = ?auto_483648 ?auto_483659 ) ) ( not ( = ?auto_483648 ?auto_483660 ) ) ( not ( = ?auto_483649 ?auto_483650 ) ) ( not ( = ?auto_483649 ?auto_483651 ) ) ( not ( = ?auto_483649 ?auto_483652 ) ) ( not ( = ?auto_483649 ?auto_483653 ) ) ( not ( = ?auto_483649 ?auto_483654 ) ) ( not ( = ?auto_483649 ?auto_483655 ) ) ( not ( = ?auto_483649 ?auto_483656 ) ) ( not ( = ?auto_483649 ?auto_483657 ) ) ( not ( = ?auto_483649 ?auto_483658 ) ) ( not ( = ?auto_483649 ?auto_483659 ) ) ( not ( = ?auto_483649 ?auto_483660 ) ) ( not ( = ?auto_483650 ?auto_483651 ) ) ( not ( = ?auto_483650 ?auto_483652 ) ) ( not ( = ?auto_483650 ?auto_483653 ) ) ( not ( = ?auto_483650 ?auto_483654 ) ) ( not ( = ?auto_483650 ?auto_483655 ) ) ( not ( = ?auto_483650 ?auto_483656 ) ) ( not ( = ?auto_483650 ?auto_483657 ) ) ( not ( = ?auto_483650 ?auto_483658 ) ) ( not ( = ?auto_483650 ?auto_483659 ) ) ( not ( = ?auto_483650 ?auto_483660 ) ) ( not ( = ?auto_483651 ?auto_483652 ) ) ( not ( = ?auto_483651 ?auto_483653 ) ) ( not ( = ?auto_483651 ?auto_483654 ) ) ( not ( = ?auto_483651 ?auto_483655 ) ) ( not ( = ?auto_483651 ?auto_483656 ) ) ( not ( = ?auto_483651 ?auto_483657 ) ) ( not ( = ?auto_483651 ?auto_483658 ) ) ( not ( = ?auto_483651 ?auto_483659 ) ) ( not ( = ?auto_483651 ?auto_483660 ) ) ( not ( = ?auto_483652 ?auto_483653 ) ) ( not ( = ?auto_483652 ?auto_483654 ) ) ( not ( = ?auto_483652 ?auto_483655 ) ) ( not ( = ?auto_483652 ?auto_483656 ) ) ( not ( = ?auto_483652 ?auto_483657 ) ) ( not ( = ?auto_483652 ?auto_483658 ) ) ( not ( = ?auto_483652 ?auto_483659 ) ) ( not ( = ?auto_483652 ?auto_483660 ) ) ( not ( = ?auto_483653 ?auto_483654 ) ) ( not ( = ?auto_483653 ?auto_483655 ) ) ( not ( = ?auto_483653 ?auto_483656 ) ) ( not ( = ?auto_483653 ?auto_483657 ) ) ( not ( = ?auto_483653 ?auto_483658 ) ) ( not ( = ?auto_483653 ?auto_483659 ) ) ( not ( = ?auto_483653 ?auto_483660 ) ) ( not ( = ?auto_483654 ?auto_483655 ) ) ( not ( = ?auto_483654 ?auto_483656 ) ) ( not ( = ?auto_483654 ?auto_483657 ) ) ( not ( = ?auto_483654 ?auto_483658 ) ) ( not ( = ?auto_483654 ?auto_483659 ) ) ( not ( = ?auto_483654 ?auto_483660 ) ) ( not ( = ?auto_483655 ?auto_483656 ) ) ( not ( = ?auto_483655 ?auto_483657 ) ) ( not ( = ?auto_483655 ?auto_483658 ) ) ( not ( = ?auto_483655 ?auto_483659 ) ) ( not ( = ?auto_483655 ?auto_483660 ) ) ( not ( = ?auto_483656 ?auto_483657 ) ) ( not ( = ?auto_483656 ?auto_483658 ) ) ( not ( = ?auto_483656 ?auto_483659 ) ) ( not ( = ?auto_483656 ?auto_483660 ) ) ( not ( = ?auto_483657 ?auto_483658 ) ) ( not ( = ?auto_483657 ?auto_483659 ) ) ( not ( = ?auto_483657 ?auto_483660 ) ) ( not ( = ?auto_483658 ?auto_483659 ) ) ( not ( = ?auto_483658 ?auto_483660 ) ) ( not ( = ?auto_483659 ?auto_483660 ) ) ( ON ?auto_483659 ?auto_483660 ) ( ON ?auto_483658 ?auto_483659 ) ( ON ?auto_483657 ?auto_483658 ) ( ON ?auto_483656 ?auto_483657 ) ( ON ?auto_483655 ?auto_483656 ) ( ON ?auto_483654 ?auto_483655 ) ( ON ?auto_483653 ?auto_483654 ) ( ON ?auto_483652 ?auto_483653 ) ( ON ?auto_483651 ?auto_483652 ) ( ON ?auto_483650 ?auto_483651 ) ( ON ?auto_483649 ?auto_483650 ) ( ON ?auto_483648 ?auto_483649 ) ( ON ?auto_483647 ?auto_483648 ) ( CLEAR ?auto_483645 ) ( ON ?auto_483646 ?auto_483647 ) ( CLEAR ?auto_483646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_483645 ?auto_483646 )
      ( MAKE-16PILE ?auto_483645 ?auto_483646 ?auto_483647 ?auto_483648 ?auto_483649 ?auto_483650 ?auto_483651 ?auto_483652 ?auto_483653 ?auto_483654 ?auto_483655 ?auto_483656 ?auto_483657 ?auto_483658 ?auto_483659 ?auto_483660 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483677 - BLOCK
      ?auto_483678 - BLOCK
      ?auto_483679 - BLOCK
      ?auto_483680 - BLOCK
      ?auto_483681 - BLOCK
      ?auto_483682 - BLOCK
      ?auto_483683 - BLOCK
      ?auto_483684 - BLOCK
      ?auto_483685 - BLOCK
      ?auto_483686 - BLOCK
      ?auto_483687 - BLOCK
      ?auto_483688 - BLOCK
      ?auto_483689 - BLOCK
      ?auto_483690 - BLOCK
      ?auto_483691 - BLOCK
      ?auto_483692 - BLOCK
    )
    :vars
    (
      ?auto_483693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483692 ?auto_483693 ) ( not ( = ?auto_483677 ?auto_483678 ) ) ( not ( = ?auto_483677 ?auto_483679 ) ) ( not ( = ?auto_483677 ?auto_483680 ) ) ( not ( = ?auto_483677 ?auto_483681 ) ) ( not ( = ?auto_483677 ?auto_483682 ) ) ( not ( = ?auto_483677 ?auto_483683 ) ) ( not ( = ?auto_483677 ?auto_483684 ) ) ( not ( = ?auto_483677 ?auto_483685 ) ) ( not ( = ?auto_483677 ?auto_483686 ) ) ( not ( = ?auto_483677 ?auto_483687 ) ) ( not ( = ?auto_483677 ?auto_483688 ) ) ( not ( = ?auto_483677 ?auto_483689 ) ) ( not ( = ?auto_483677 ?auto_483690 ) ) ( not ( = ?auto_483677 ?auto_483691 ) ) ( not ( = ?auto_483677 ?auto_483692 ) ) ( not ( = ?auto_483677 ?auto_483693 ) ) ( not ( = ?auto_483678 ?auto_483679 ) ) ( not ( = ?auto_483678 ?auto_483680 ) ) ( not ( = ?auto_483678 ?auto_483681 ) ) ( not ( = ?auto_483678 ?auto_483682 ) ) ( not ( = ?auto_483678 ?auto_483683 ) ) ( not ( = ?auto_483678 ?auto_483684 ) ) ( not ( = ?auto_483678 ?auto_483685 ) ) ( not ( = ?auto_483678 ?auto_483686 ) ) ( not ( = ?auto_483678 ?auto_483687 ) ) ( not ( = ?auto_483678 ?auto_483688 ) ) ( not ( = ?auto_483678 ?auto_483689 ) ) ( not ( = ?auto_483678 ?auto_483690 ) ) ( not ( = ?auto_483678 ?auto_483691 ) ) ( not ( = ?auto_483678 ?auto_483692 ) ) ( not ( = ?auto_483678 ?auto_483693 ) ) ( not ( = ?auto_483679 ?auto_483680 ) ) ( not ( = ?auto_483679 ?auto_483681 ) ) ( not ( = ?auto_483679 ?auto_483682 ) ) ( not ( = ?auto_483679 ?auto_483683 ) ) ( not ( = ?auto_483679 ?auto_483684 ) ) ( not ( = ?auto_483679 ?auto_483685 ) ) ( not ( = ?auto_483679 ?auto_483686 ) ) ( not ( = ?auto_483679 ?auto_483687 ) ) ( not ( = ?auto_483679 ?auto_483688 ) ) ( not ( = ?auto_483679 ?auto_483689 ) ) ( not ( = ?auto_483679 ?auto_483690 ) ) ( not ( = ?auto_483679 ?auto_483691 ) ) ( not ( = ?auto_483679 ?auto_483692 ) ) ( not ( = ?auto_483679 ?auto_483693 ) ) ( not ( = ?auto_483680 ?auto_483681 ) ) ( not ( = ?auto_483680 ?auto_483682 ) ) ( not ( = ?auto_483680 ?auto_483683 ) ) ( not ( = ?auto_483680 ?auto_483684 ) ) ( not ( = ?auto_483680 ?auto_483685 ) ) ( not ( = ?auto_483680 ?auto_483686 ) ) ( not ( = ?auto_483680 ?auto_483687 ) ) ( not ( = ?auto_483680 ?auto_483688 ) ) ( not ( = ?auto_483680 ?auto_483689 ) ) ( not ( = ?auto_483680 ?auto_483690 ) ) ( not ( = ?auto_483680 ?auto_483691 ) ) ( not ( = ?auto_483680 ?auto_483692 ) ) ( not ( = ?auto_483680 ?auto_483693 ) ) ( not ( = ?auto_483681 ?auto_483682 ) ) ( not ( = ?auto_483681 ?auto_483683 ) ) ( not ( = ?auto_483681 ?auto_483684 ) ) ( not ( = ?auto_483681 ?auto_483685 ) ) ( not ( = ?auto_483681 ?auto_483686 ) ) ( not ( = ?auto_483681 ?auto_483687 ) ) ( not ( = ?auto_483681 ?auto_483688 ) ) ( not ( = ?auto_483681 ?auto_483689 ) ) ( not ( = ?auto_483681 ?auto_483690 ) ) ( not ( = ?auto_483681 ?auto_483691 ) ) ( not ( = ?auto_483681 ?auto_483692 ) ) ( not ( = ?auto_483681 ?auto_483693 ) ) ( not ( = ?auto_483682 ?auto_483683 ) ) ( not ( = ?auto_483682 ?auto_483684 ) ) ( not ( = ?auto_483682 ?auto_483685 ) ) ( not ( = ?auto_483682 ?auto_483686 ) ) ( not ( = ?auto_483682 ?auto_483687 ) ) ( not ( = ?auto_483682 ?auto_483688 ) ) ( not ( = ?auto_483682 ?auto_483689 ) ) ( not ( = ?auto_483682 ?auto_483690 ) ) ( not ( = ?auto_483682 ?auto_483691 ) ) ( not ( = ?auto_483682 ?auto_483692 ) ) ( not ( = ?auto_483682 ?auto_483693 ) ) ( not ( = ?auto_483683 ?auto_483684 ) ) ( not ( = ?auto_483683 ?auto_483685 ) ) ( not ( = ?auto_483683 ?auto_483686 ) ) ( not ( = ?auto_483683 ?auto_483687 ) ) ( not ( = ?auto_483683 ?auto_483688 ) ) ( not ( = ?auto_483683 ?auto_483689 ) ) ( not ( = ?auto_483683 ?auto_483690 ) ) ( not ( = ?auto_483683 ?auto_483691 ) ) ( not ( = ?auto_483683 ?auto_483692 ) ) ( not ( = ?auto_483683 ?auto_483693 ) ) ( not ( = ?auto_483684 ?auto_483685 ) ) ( not ( = ?auto_483684 ?auto_483686 ) ) ( not ( = ?auto_483684 ?auto_483687 ) ) ( not ( = ?auto_483684 ?auto_483688 ) ) ( not ( = ?auto_483684 ?auto_483689 ) ) ( not ( = ?auto_483684 ?auto_483690 ) ) ( not ( = ?auto_483684 ?auto_483691 ) ) ( not ( = ?auto_483684 ?auto_483692 ) ) ( not ( = ?auto_483684 ?auto_483693 ) ) ( not ( = ?auto_483685 ?auto_483686 ) ) ( not ( = ?auto_483685 ?auto_483687 ) ) ( not ( = ?auto_483685 ?auto_483688 ) ) ( not ( = ?auto_483685 ?auto_483689 ) ) ( not ( = ?auto_483685 ?auto_483690 ) ) ( not ( = ?auto_483685 ?auto_483691 ) ) ( not ( = ?auto_483685 ?auto_483692 ) ) ( not ( = ?auto_483685 ?auto_483693 ) ) ( not ( = ?auto_483686 ?auto_483687 ) ) ( not ( = ?auto_483686 ?auto_483688 ) ) ( not ( = ?auto_483686 ?auto_483689 ) ) ( not ( = ?auto_483686 ?auto_483690 ) ) ( not ( = ?auto_483686 ?auto_483691 ) ) ( not ( = ?auto_483686 ?auto_483692 ) ) ( not ( = ?auto_483686 ?auto_483693 ) ) ( not ( = ?auto_483687 ?auto_483688 ) ) ( not ( = ?auto_483687 ?auto_483689 ) ) ( not ( = ?auto_483687 ?auto_483690 ) ) ( not ( = ?auto_483687 ?auto_483691 ) ) ( not ( = ?auto_483687 ?auto_483692 ) ) ( not ( = ?auto_483687 ?auto_483693 ) ) ( not ( = ?auto_483688 ?auto_483689 ) ) ( not ( = ?auto_483688 ?auto_483690 ) ) ( not ( = ?auto_483688 ?auto_483691 ) ) ( not ( = ?auto_483688 ?auto_483692 ) ) ( not ( = ?auto_483688 ?auto_483693 ) ) ( not ( = ?auto_483689 ?auto_483690 ) ) ( not ( = ?auto_483689 ?auto_483691 ) ) ( not ( = ?auto_483689 ?auto_483692 ) ) ( not ( = ?auto_483689 ?auto_483693 ) ) ( not ( = ?auto_483690 ?auto_483691 ) ) ( not ( = ?auto_483690 ?auto_483692 ) ) ( not ( = ?auto_483690 ?auto_483693 ) ) ( not ( = ?auto_483691 ?auto_483692 ) ) ( not ( = ?auto_483691 ?auto_483693 ) ) ( not ( = ?auto_483692 ?auto_483693 ) ) ( ON ?auto_483691 ?auto_483692 ) ( ON ?auto_483690 ?auto_483691 ) ( ON ?auto_483689 ?auto_483690 ) ( ON ?auto_483688 ?auto_483689 ) ( ON ?auto_483687 ?auto_483688 ) ( ON ?auto_483686 ?auto_483687 ) ( ON ?auto_483685 ?auto_483686 ) ( ON ?auto_483684 ?auto_483685 ) ( ON ?auto_483683 ?auto_483684 ) ( ON ?auto_483682 ?auto_483683 ) ( ON ?auto_483681 ?auto_483682 ) ( ON ?auto_483680 ?auto_483681 ) ( ON ?auto_483679 ?auto_483680 ) ( ON ?auto_483678 ?auto_483679 ) ( ON ?auto_483677 ?auto_483678 ) ( CLEAR ?auto_483677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_483677 )
      ( MAKE-16PILE ?auto_483677 ?auto_483678 ?auto_483679 ?auto_483680 ?auto_483681 ?auto_483682 ?auto_483683 ?auto_483684 ?auto_483685 ?auto_483686 ?auto_483687 ?auto_483688 ?auto_483689 ?auto_483690 ?auto_483691 ?auto_483692 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483710 - BLOCK
      ?auto_483711 - BLOCK
      ?auto_483712 - BLOCK
      ?auto_483713 - BLOCK
      ?auto_483714 - BLOCK
      ?auto_483715 - BLOCK
      ?auto_483716 - BLOCK
      ?auto_483717 - BLOCK
      ?auto_483718 - BLOCK
      ?auto_483719 - BLOCK
      ?auto_483720 - BLOCK
      ?auto_483721 - BLOCK
      ?auto_483722 - BLOCK
      ?auto_483723 - BLOCK
      ?auto_483724 - BLOCK
      ?auto_483725 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_483725 ) ( not ( = ?auto_483710 ?auto_483711 ) ) ( not ( = ?auto_483710 ?auto_483712 ) ) ( not ( = ?auto_483710 ?auto_483713 ) ) ( not ( = ?auto_483710 ?auto_483714 ) ) ( not ( = ?auto_483710 ?auto_483715 ) ) ( not ( = ?auto_483710 ?auto_483716 ) ) ( not ( = ?auto_483710 ?auto_483717 ) ) ( not ( = ?auto_483710 ?auto_483718 ) ) ( not ( = ?auto_483710 ?auto_483719 ) ) ( not ( = ?auto_483710 ?auto_483720 ) ) ( not ( = ?auto_483710 ?auto_483721 ) ) ( not ( = ?auto_483710 ?auto_483722 ) ) ( not ( = ?auto_483710 ?auto_483723 ) ) ( not ( = ?auto_483710 ?auto_483724 ) ) ( not ( = ?auto_483710 ?auto_483725 ) ) ( not ( = ?auto_483711 ?auto_483712 ) ) ( not ( = ?auto_483711 ?auto_483713 ) ) ( not ( = ?auto_483711 ?auto_483714 ) ) ( not ( = ?auto_483711 ?auto_483715 ) ) ( not ( = ?auto_483711 ?auto_483716 ) ) ( not ( = ?auto_483711 ?auto_483717 ) ) ( not ( = ?auto_483711 ?auto_483718 ) ) ( not ( = ?auto_483711 ?auto_483719 ) ) ( not ( = ?auto_483711 ?auto_483720 ) ) ( not ( = ?auto_483711 ?auto_483721 ) ) ( not ( = ?auto_483711 ?auto_483722 ) ) ( not ( = ?auto_483711 ?auto_483723 ) ) ( not ( = ?auto_483711 ?auto_483724 ) ) ( not ( = ?auto_483711 ?auto_483725 ) ) ( not ( = ?auto_483712 ?auto_483713 ) ) ( not ( = ?auto_483712 ?auto_483714 ) ) ( not ( = ?auto_483712 ?auto_483715 ) ) ( not ( = ?auto_483712 ?auto_483716 ) ) ( not ( = ?auto_483712 ?auto_483717 ) ) ( not ( = ?auto_483712 ?auto_483718 ) ) ( not ( = ?auto_483712 ?auto_483719 ) ) ( not ( = ?auto_483712 ?auto_483720 ) ) ( not ( = ?auto_483712 ?auto_483721 ) ) ( not ( = ?auto_483712 ?auto_483722 ) ) ( not ( = ?auto_483712 ?auto_483723 ) ) ( not ( = ?auto_483712 ?auto_483724 ) ) ( not ( = ?auto_483712 ?auto_483725 ) ) ( not ( = ?auto_483713 ?auto_483714 ) ) ( not ( = ?auto_483713 ?auto_483715 ) ) ( not ( = ?auto_483713 ?auto_483716 ) ) ( not ( = ?auto_483713 ?auto_483717 ) ) ( not ( = ?auto_483713 ?auto_483718 ) ) ( not ( = ?auto_483713 ?auto_483719 ) ) ( not ( = ?auto_483713 ?auto_483720 ) ) ( not ( = ?auto_483713 ?auto_483721 ) ) ( not ( = ?auto_483713 ?auto_483722 ) ) ( not ( = ?auto_483713 ?auto_483723 ) ) ( not ( = ?auto_483713 ?auto_483724 ) ) ( not ( = ?auto_483713 ?auto_483725 ) ) ( not ( = ?auto_483714 ?auto_483715 ) ) ( not ( = ?auto_483714 ?auto_483716 ) ) ( not ( = ?auto_483714 ?auto_483717 ) ) ( not ( = ?auto_483714 ?auto_483718 ) ) ( not ( = ?auto_483714 ?auto_483719 ) ) ( not ( = ?auto_483714 ?auto_483720 ) ) ( not ( = ?auto_483714 ?auto_483721 ) ) ( not ( = ?auto_483714 ?auto_483722 ) ) ( not ( = ?auto_483714 ?auto_483723 ) ) ( not ( = ?auto_483714 ?auto_483724 ) ) ( not ( = ?auto_483714 ?auto_483725 ) ) ( not ( = ?auto_483715 ?auto_483716 ) ) ( not ( = ?auto_483715 ?auto_483717 ) ) ( not ( = ?auto_483715 ?auto_483718 ) ) ( not ( = ?auto_483715 ?auto_483719 ) ) ( not ( = ?auto_483715 ?auto_483720 ) ) ( not ( = ?auto_483715 ?auto_483721 ) ) ( not ( = ?auto_483715 ?auto_483722 ) ) ( not ( = ?auto_483715 ?auto_483723 ) ) ( not ( = ?auto_483715 ?auto_483724 ) ) ( not ( = ?auto_483715 ?auto_483725 ) ) ( not ( = ?auto_483716 ?auto_483717 ) ) ( not ( = ?auto_483716 ?auto_483718 ) ) ( not ( = ?auto_483716 ?auto_483719 ) ) ( not ( = ?auto_483716 ?auto_483720 ) ) ( not ( = ?auto_483716 ?auto_483721 ) ) ( not ( = ?auto_483716 ?auto_483722 ) ) ( not ( = ?auto_483716 ?auto_483723 ) ) ( not ( = ?auto_483716 ?auto_483724 ) ) ( not ( = ?auto_483716 ?auto_483725 ) ) ( not ( = ?auto_483717 ?auto_483718 ) ) ( not ( = ?auto_483717 ?auto_483719 ) ) ( not ( = ?auto_483717 ?auto_483720 ) ) ( not ( = ?auto_483717 ?auto_483721 ) ) ( not ( = ?auto_483717 ?auto_483722 ) ) ( not ( = ?auto_483717 ?auto_483723 ) ) ( not ( = ?auto_483717 ?auto_483724 ) ) ( not ( = ?auto_483717 ?auto_483725 ) ) ( not ( = ?auto_483718 ?auto_483719 ) ) ( not ( = ?auto_483718 ?auto_483720 ) ) ( not ( = ?auto_483718 ?auto_483721 ) ) ( not ( = ?auto_483718 ?auto_483722 ) ) ( not ( = ?auto_483718 ?auto_483723 ) ) ( not ( = ?auto_483718 ?auto_483724 ) ) ( not ( = ?auto_483718 ?auto_483725 ) ) ( not ( = ?auto_483719 ?auto_483720 ) ) ( not ( = ?auto_483719 ?auto_483721 ) ) ( not ( = ?auto_483719 ?auto_483722 ) ) ( not ( = ?auto_483719 ?auto_483723 ) ) ( not ( = ?auto_483719 ?auto_483724 ) ) ( not ( = ?auto_483719 ?auto_483725 ) ) ( not ( = ?auto_483720 ?auto_483721 ) ) ( not ( = ?auto_483720 ?auto_483722 ) ) ( not ( = ?auto_483720 ?auto_483723 ) ) ( not ( = ?auto_483720 ?auto_483724 ) ) ( not ( = ?auto_483720 ?auto_483725 ) ) ( not ( = ?auto_483721 ?auto_483722 ) ) ( not ( = ?auto_483721 ?auto_483723 ) ) ( not ( = ?auto_483721 ?auto_483724 ) ) ( not ( = ?auto_483721 ?auto_483725 ) ) ( not ( = ?auto_483722 ?auto_483723 ) ) ( not ( = ?auto_483722 ?auto_483724 ) ) ( not ( = ?auto_483722 ?auto_483725 ) ) ( not ( = ?auto_483723 ?auto_483724 ) ) ( not ( = ?auto_483723 ?auto_483725 ) ) ( not ( = ?auto_483724 ?auto_483725 ) ) ( ON ?auto_483724 ?auto_483725 ) ( ON ?auto_483723 ?auto_483724 ) ( ON ?auto_483722 ?auto_483723 ) ( ON ?auto_483721 ?auto_483722 ) ( ON ?auto_483720 ?auto_483721 ) ( ON ?auto_483719 ?auto_483720 ) ( ON ?auto_483718 ?auto_483719 ) ( ON ?auto_483717 ?auto_483718 ) ( ON ?auto_483716 ?auto_483717 ) ( ON ?auto_483715 ?auto_483716 ) ( ON ?auto_483714 ?auto_483715 ) ( ON ?auto_483713 ?auto_483714 ) ( ON ?auto_483712 ?auto_483713 ) ( ON ?auto_483711 ?auto_483712 ) ( ON ?auto_483710 ?auto_483711 ) ( CLEAR ?auto_483710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_483710 )
      ( MAKE-16PILE ?auto_483710 ?auto_483711 ?auto_483712 ?auto_483713 ?auto_483714 ?auto_483715 ?auto_483716 ?auto_483717 ?auto_483718 ?auto_483719 ?auto_483720 ?auto_483721 ?auto_483722 ?auto_483723 ?auto_483724 ?auto_483725 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_483742 - BLOCK
      ?auto_483743 - BLOCK
      ?auto_483744 - BLOCK
      ?auto_483745 - BLOCK
      ?auto_483746 - BLOCK
      ?auto_483747 - BLOCK
      ?auto_483748 - BLOCK
      ?auto_483749 - BLOCK
      ?auto_483750 - BLOCK
      ?auto_483751 - BLOCK
      ?auto_483752 - BLOCK
      ?auto_483753 - BLOCK
      ?auto_483754 - BLOCK
      ?auto_483755 - BLOCK
      ?auto_483756 - BLOCK
      ?auto_483757 - BLOCK
    )
    :vars
    (
      ?auto_483758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_483742 ?auto_483743 ) ) ( not ( = ?auto_483742 ?auto_483744 ) ) ( not ( = ?auto_483742 ?auto_483745 ) ) ( not ( = ?auto_483742 ?auto_483746 ) ) ( not ( = ?auto_483742 ?auto_483747 ) ) ( not ( = ?auto_483742 ?auto_483748 ) ) ( not ( = ?auto_483742 ?auto_483749 ) ) ( not ( = ?auto_483742 ?auto_483750 ) ) ( not ( = ?auto_483742 ?auto_483751 ) ) ( not ( = ?auto_483742 ?auto_483752 ) ) ( not ( = ?auto_483742 ?auto_483753 ) ) ( not ( = ?auto_483742 ?auto_483754 ) ) ( not ( = ?auto_483742 ?auto_483755 ) ) ( not ( = ?auto_483742 ?auto_483756 ) ) ( not ( = ?auto_483742 ?auto_483757 ) ) ( not ( = ?auto_483743 ?auto_483744 ) ) ( not ( = ?auto_483743 ?auto_483745 ) ) ( not ( = ?auto_483743 ?auto_483746 ) ) ( not ( = ?auto_483743 ?auto_483747 ) ) ( not ( = ?auto_483743 ?auto_483748 ) ) ( not ( = ?auto_483743 ?auto_483749 ) ) ( not ( = ?auto_483743 ?auto_483750 ) ) ( not ( = ?auto_483743 ?auto_483751 ) ) ( not ( = ?auto_483743 ?auto_483752 ) ) ( not ( = ?auto_483743 ?auto_483753 ) ) ( not ( = ?auto_483743 ?auto_483754 ) ) ( not ( = ?auto_483743 ?auto_483755 ) ) ( not ( = ?auto_483743 ?auto_483756 ) ) ( not ( = ?auto_483743 ?auto_483757 ) ) ( not ( = ?auto_483744 ?auto_483745 ) ) ( not ( = ?auto_483744 ?auto_483746 ) ) ( not ( = ?auto_483744 ?auto_483747 ) ) ( not ( = ?auto_483744 ?auto_483748 ) ) ( not ( = ?auto_483744 ?auto_483749 ) ) ( not ( = ?auto_483744 ?auto_483750 ) ) ( not ( = ?auto_483744 ?auto_483751 ) ) ( not ( = ?auto_483744 ?auto_483752 ) ) ( not ( = ?auto_483744 ?auto_483753 ) ) ( not ( = ?auto_483744 ?auto_483754 ) ) ( not ( = ?auto_483744 ?auto_483755 ) ) ( not ( = ?auto_483744 ?auto_483756 ) ) ( not ( = ?auto_483744 ?auto_483757 ) ) ( not ( = ?auto_483745 ?auto_483746 ) ) ( not ( = ?auto_483745 ?auto_483747 ) ) ( not ( = ?auto_483745 ?auto_483748 ) ) ( not ( = ?auto_483745 ?auto_483749 ) ) ( not ( = ?auto_483745 ?auto_483750 ) ) ( not ( = ?auto_483745 ?auto_483751 ) ) ( not ( = ?auto_483745 ?auto_483752 ) ) ( not ( = ?auto_483745 ?auto_483753 ) ) ( not ( = ?auto_483745 ?auto_483754 ) ) ( not ( = ?auto_483745 ?auto_483755 ) ) ( not ( = ?auto_483745 ?auto_483756 ) ) ( not ( = ?auto_483745 ?auto_483757 ) ) ( not ( = ?auto_483746 ?auto_483747 ) ) ( not ( = ?auto_483746 ?auto_483748 ) ) ( not ( = ?auto_483746 ?auto_483749 ) ) ( not ( = ?auto_483746 ?auto_483750 ) ) ( not ( = ?auto_483746 ?auto_483751 ) ) ( not ( = ?auto_483746 ?auto_483752 ) ) ( not ( = ?auto_483746 ?auto_483753 ) ) ( not ( = ?auto_483746 ?auto_483754 ) ) ( not ( = ?auto_483746 ?auto_483755 ) ) ( not ( = ?auto_483746 ?auto_483756 ) ) ( not ( = ?auto_483746 ?auto_483757 ) ) ( not ( = ?auto_483747 ?auto_483748 ) ) ( not ( = ?auto_483747 ?auto_483749 ) ) ( not ( = ?auto_483747 ?auto_483750 ) ) ( not ( = ?auto_483747 ?auto_483751 ) ) ( not ( = ?auto_483747 ?auto_483752 ) ) ( not ( = ?auto_483747 ?auto_483753 ) ) ( not ( = ?auto_483747 ?auto_483754 ) ) ( not ( = ?auto_483747 ?auto_483755 ) ) ( not ( = ?auto_483747 ?auto_483756 ) ) ( not ( = ?auto_483747 ?auto_483757 ) ) ( not ( = ?auto_483748 ?auto_483749 ) ) ( not ( = ?auto_483748 ?auto_483750 ) ) ( not ( = ?auto_483748 ?auto_483751 ) ) ( not ( = ?auto_483748 ?auto_483752 ) ) ( not ( = ?auto_483748 ?auto_483753 ) ) ( not ( = ?auto_483748 ?auto_483754 ) ) ( not ( = ?auto_483748 ?auto_483755 ) ) ( not ( = ?auto_483748 ?auto_483756 ) ) ( not ( = ?auto_483748 ?auto_483757 ) ) ( not ( = ?auto_483749 ?auto_483750 ) ) ( not ( = ?auto_483749 ?auto_483751 ) ) ( not ( = ?auto_483749 ?auto_483752 ) ) ( not ( = ?auto_483749 ?auto_483753 ) ) ( not ( = ?auto_483749 ?auto_483754 ) ) ( not ( = ?auto_483749 ?auto_483755 ) ) ( not ( = ?auto_483749 ?auto_483756 ) ) ( not ( = ?auto_483749 ?auto_483757 ) ) ( not ( = ?auto_483750 ?auto_483751 ) ) ( not ( = ?auto_483750 ?auto_483752 ) ) ( not ( = ?auto_483750 ?auto_483753 ) ) ( not ( = ?auto_483750 ?auto_483754 ) ) ( not ( = ?auto_483750 ?auto_483755 ) ) ( not ( = ?auto_483750 ?auto_483756 ) ) ( not ( = ?auto_483750 ?auto_483757 ) ) ( not ( = ?auto_483751 ?auto_483752 ) ) ( not ( = ?auto_483751 ?auto_483753 ) ) ( not ( = ?auto_483751 ?auto_483754 ) ) ( not ( = ?auto_483751 ?auto_483755 ) ) ( not ( = ?auto_483751 ?auto_483756 ) ) ( not ( = ?auto_483751 ?auto_483757 ) ) ( not ( = ?auto_483752 ?auto_483753 ) ) ( not ( = ?auto_483752 ?auto_483754 ) ) ( not ( = ?auto_483752 ?auto_483755 ) ) ( not ( = ?auto_483752 ?auto_483756 ) ) ( not ( = ?auto_483752 ?auto_483757 ) ) ( not ( = ?auto_483753 ?auto_483754 ) ) ( not ( = ?auto_483753 ?auto_483755 ) ) ( not ( = ?auto_483753 ?auto_483756 ) ) ( not ( = ?auto_483753 ?auto_483757 ) ) ( not ( = ?auto_483754 ?auto_483755 ) ) ( not ( = ?auto_483754 ?auto_483756 ) ) ( not ( = ?auto_483754 ?auto_483757 ) ) ( not ( = ?auto_483755 ?auto_483756 ) ) ( not ( = ?auto_483755 ?auto_483757 ) ) ( not ( = ?auto_483756 ?auto_483757 ) ) ( ON ?auto_483742 ?auto_483758 ) ( not ( = ?auto_483757 ?auto_483758 ) ) ( not ( = ?auto_483756 ?auto_483758 ) ) ( not ( = ?auto_483755 ?auto_483758 ) ) ( not ( = ?auto_483754 ?auto_483758 ) ) ( not ( = ?auto_483753 ?auto_483758 ) ) ( not ( = ?auto_483752 ?auto_483758 ) ) ( not ( = ?auto_483751 ?auto_483758 ) ) ( not ( = ?auto_483750 ?auto_483758 ) ) ( not ( = ?auto_483749 ?auto_483758 ) ) ( not ( = ?auto_483748 ?auto_483758 ) ) ( not ( = ?auto_483747 ?auto_483758 ) ) ( not ( = ?auto_483746 ?auto_483758 ) ) ( not ( = ?auto_483745 ?auto_483758 ) ) ( not ( = ?auto_483744 ?auto_483758 ) ) ( not ( = ?auto_483743 ?auto_483758 ) ) ( not ( = ?auto_483742 ?auto_483758 ) ) ( ON ?auto_483743 ?auto_483742 ) ( ON ?auto_483744 ?auto_483743 ) ( ON ?auto_483745 ?auto_483744 ) ( ON ?auto_483746 ?auto_483745 ) ( ON ?auto_483747 ?auto_483746 ) ( ON ?auto_483748 ?auto_483747 ) ( ON ?auto_483749 ?auto_483748 ) ( ON ?auto_483750 ?auto_483749 ) ( ON ?auto_483751 ?auto_483750 ) ( ON ?auto_483752 ?auto_483751 ) ( ON ?auto_483753 ?auto_483752 ) ( ON ?auto_483754 ?auto_483753 ) ( ON ?auto_483755 ?auto_483754 ) ( ON ?auto_483756 ?auto_483755 ) ( ON ?auto_483757 ?auto_483756 ) ( CLEAR ?auto_483757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_483757 ?auto_483756 ?auto_483755 ?auto_483754 ?auto_483753 ?auto_483752 ?auto_483751 ?auto_483750 ?auto_483749 ?auto_483748 ?auto_483747 ?auto_483746 ?auto_483745 ?auto_483744 ?auto_483743 ?auto_483742 )
      ( MAKE-16PILE ?auto_483742 ?auto_483743 ?auto_483744 ?auto_483745 ?auto_483746 ?auto_483747 ?auto_483748 ?auto_483749 ?auto_483750 ?auto_483751 ?auto_483752 ?auto_483753 ?auto_483754 ?auto_483755 ?auto_483756 ?auto_483757 ) )
  )

)

