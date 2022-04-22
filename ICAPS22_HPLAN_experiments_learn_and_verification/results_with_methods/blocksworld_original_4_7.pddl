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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10579 - BLOCK
      ?auto_10580 - BLOCK
      ?auto_10581 - BLOCK
      ?auto_10582 - BLOCK
    )
    :vars
    (
      ?auto_10583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10583 ?auto_10582 ) ( CLEAR ?auto_10583 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10579 ) ( ON ?auto_10580 ?auto_10579 ) ( ON ?auto_10581 ?auto_10580 ) ( ON ?auto_10582 ?auto_10581 ) ( not ( = ?auto_10579 ?auto_10580 ) ) ( not ( = ?auto_10579 ?auto_10581 ) ) ( not ( = ?auto_10579 ?auto_10582 ) ) ( not ( = ?auto_10579 ?auto_10583 ) ) ( not ( = ?auto_10580 ?auto_10581 ) ) ( not ( = ?auto_10580 ?auto_10582 ) ) ( not ( = ?auto_10580 ?auto_10583 ) ) ( not ( = ?auto_10581 ?auto_10582 ) ) ( not ( = ?auto_10581 ?auto_10583 ) ) ( not ( = ?auto_10582 ?auto_10583 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10583 ?auto_10582 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10585 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10585 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_10585 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10586 - BLOCK
    )
    :vars
    (
      ?auto_10587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10586 ?auto_10587 ) ( CLEAR ?auto_10586 ) ( HAND-EMPTY ) ( not ( = ?auto_10586 ?auto_10587 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10586 ?auto_10587 )
      ( MAKE-1PILE ?auto_10586 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10591 - BLOCK
      ?auto_10592 - BLOCK
      ?auto_10593 - BLOCK
    )
    :vars
    (
      ?auto_10594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10594 ?auto_10593 ) ( CLEAR ?auto_10594 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10591 ) ( ON ?auto_10592 ?auto_10591 ) ( ON ?auto_10593 ?auto_10592 ) ( not ( = ?auto_10591 ?auto_10592 ) ) ( not ( = ?auto_10591 ?auto_10593 ) ) ( not ( = ?auto_10591 ?auto_10594 ) ) ( not ( = ?auto_10592 ?auto_10593 ) ) ( not ( = ?auto_10592 ?auto_10594 ) ) ( not ( = ?auto_10593 ?auto_10594 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10594 ?auto_10593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10595 - BLOCK
      ?auto_10596 - BLOCK
      ?auto_10597 - BLOCK
    )
    :vars
    (
      ?auto_10598 - BLOCK
      ?auto_10599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10598 ?auto_10597 ) ( CLEAR ?auto_10598 ) ( ON-TABLE ?auto_10595 ) ( ON ?auto_10596 ?auto_10595 ) ( ON ?auto_10597 ?auto_10596 ) ( not ( = ?auto_10595 ?auto_10596 ) ) ( not ( = ?auto_10595 ?auto_10597 ) ) ( not ( = ?auto_10595 ?auto_10598 ) ) ( not ( = ?auto_10596 ?auto_10597 ) ) ( not ( = ?auto_10596 ?auto_10598 ) ) ( not ( = ?auto_10597 ?auto_10598 ) ) ( HOLDING ?auto_10599 ) ( not ( = ?auto_10595 ?auto_10599 ) ) ( not ( = ?auto_10596 ?auto_10599 ) ) ( not ( = ?auto_10597 ?auto_10599 ) ) ( not ( = ?auto_10598 ?auto_10599 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_10599 )
      ( MAKE-3PILE ?auto_10595 ?auto_10596 ?auto_10597 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10600 - BLOCK
      ?auto_10601 - BLOCK
      ?auto_10602 - BLOCK
    )
    :vars
    (
      ?auto_10603 - BLOCK
      ?auto_10604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10603 ?auto_10602 ) ( ON-TABLE ?auto_10600 ) ( ON ?auto_10601 ?auto_10600 ) ( ON ?auto_10602 ?auto_10601 ) ( not ( = ?auto_10600 ?auto_10601 ) ) ( not ( = ?auto_10600 ?auto_10602 ) ) ( not ( = ?auto_10600 ?auto_10603 ) ) ( not ( = ?auto_10601 ?auto_10602 ) ) ( not ( = ?auto_10601 ?auto_10603 ) ) ( not ( = ?auto_10602 ?auto_10603 ) ) ( not ( = ?auto_10600 ?auto_10604 ) ) ( not ( = ?auto_10601 ?auto_10604 ) ) ( not ( = ?auto_10602 ?auto_10604 ) ) ( not ( = ?auto_10603 ?auto_10604 ) ) ( ON ?auto_10604 ?auto_10603 ) ( CLEAR ?auto_10604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10600 ?auto_10601 ?auto_10602 ?auto_10603 )
      ( MAKE-3PILE ?auto_10600 ?auto_10601 ?auto_10602 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10607 - BLOCK
      ?auto_10608 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10608 ) ( CLEAR ?auto_10607 ) ( ON-TABLE ?auto_10607 ) ( not ( = ?auto_10607 ?auto_10608 ) ) )
    :subtasks
    ( ( !STACK ?auto_10608 ?auto_10607 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10609 - BLOCK
      ?auto_10610 - BLOCK
    )
    :vars
    (
      ?auto_10611 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10609 ) ( ON-TABLE ?auto_10609 ) ( not ( = ?auto_10609 ?auto_10610 ) ) ( ON ?auto_10610 ?auto_10611 ) ( CLEAR ?auto_10610 ) ( HAND-EMPTY ) ( not ( = ?auto_10609 ?auto_10611 ) ) ( not ( = ?auto_10610 ?auto_10611 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10610 ?auto_10611 )
      ( MAKE-2PILE ?auto_10609 ?auto_10610 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10612 - BLOCK
      ?auto_10613 - BLOCK
    )
    :vars
    (
      ?auto_10614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10612 ?auto_10613 ) ) ( ON ?auto_10613 ?auto_10614 ) ( CLEAR ?auto_10613 ) ( not ( = ?auto_10612 ?auto_10614 ) ) ( not ( = ?auto_10613 ?auto_10614 ) ) ( HOLDING ?auto_10612 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10612 )
      ( MAKE-2PILE ?auto_10612 ?auto_10613 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10615 - BLOCK
      ?auto_10616 - BLOCK
    )
    :vars
    (
      ?auto_10617 - BLOCK
      ?auto_10618 - BLOCK
      ?auto_10619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10615 ?auto_10616 ) ) ( ON ?auto_10616 ?auto_10617 ) ( not ( = ?auto_10615 ?auto_10617 ) ) ( not ( = ?auto_10616 ?auto_10617 ) ) ( ON ?auto_10615 ?auto_10616 ) ( CLEAR ?auto_10615 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10618 ) ( ON ?auto_10619 ?auto_10618 ) ( ON ?auto_10617 ?auto_10619 ) ( not ( = ?auto_10618 ?auto_10619 ) ) ( not ( = ?auto_10618 ?auto_10617 ) ) ( not ( = ?auto_10618 ?auto_10616 ) ) ( not ( = ?auto_10618 ?auto_10615 ) ) ( not ( = ?auto_10619 ?auto_10617 ) ) ( not ( = ?auto_10619 ?auto_10616 ) ) ( not ( = ?auto_10619 ?auto_10615 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10618 ?auto_10619 ?auto_10617 ?auto_10616 )
      ( MAKE-2PILE ?auto_10615 ?auto_10616 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10622 - BLOCK
      ?auto_10623 - BLOCK
    )
    :vars
    (
      ?auto_10624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10624 ?auto_10623 ) ( CLEAR ?auto_10624 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10622 ) ( ON ?auto_10623 ?auto_10622 ) ( not ( = ?auto_10622 ?auto_10623 ) ) ( not ( = ?auto_10622 ?auto_10624 ) ) ( not ( = ?auto_10623 ?auto_10624 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10624 ?auto_10623 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10625 - BLOCK
      ?auto_10626 - BLOCK
    )
    :vars
    (
      ?auto_10627 - BLOCK
      ?auto_10628 - BLOCK
      ?auto_10629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10627 ?auto_10626 ) ( CLEAR ?auto_10627 ) ( ON-TABLE ?auto_10625 ) ( ON ?auto_10626 ?auto_10625 ) ( not ( = ?auto_10625 ?auto_10626 ) ) ( not ( = ?auto_10625 ?auto_10627 ) ) ( not ( = ?auto_10626 ?auto_10627 ) ) ( HOLDING ?auto_10628 ) ( CLEAR ?auto_10629 ) ( not ( = ?auto_10625 ?auto_10628 ) ) ( not ( = ?auto_10625 ?auto_10629 ) ) ( not ( = ?auto_10626 ?auto_10628 ) ) ( not ( = ?auto_10626 ?auto_10629 ) ) ( not ( = ?auto_10627 ?auto_10628 ) ) ( not ( = ?auto_10627 ?auto_10629 ) ) ( not ( = ?auto_10628 ?auto_10629 ) ) )
    :subtasks
    ( ( !STACK ?auto_10628 ?auto_10629 )
      ( MAKE-2PILE ?auto_10625 ?auto_10626 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10630 - BLOCK
      ?auto_10631 - BLOCK
    )
    :vars
    (
      ?auto_10633 - BLOCK
      ?auto_10632 - BLOCK
      ?auto_10634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10633 ?auto_10631 ) ( ON-TABLE ?auto_10630 ) ( ON ?auto_10631 ?auto_10630 ) ( not ( = ?auto_10630 ?auto_10631 ) ) ( not ( = ?auto_10630 ?auto_10633 ) ) ( not ( = ?auto_10631 ?auto_10633 ) ) ( CLEAR ?auto_10632 ) ( not ( = ?auto_10630 ?auto_10634 ) ) ( not ( = ?auto_10630 ?auto_10632 ) ) ( not ( = ?auto_10631 ?auto_10634 ) ) ( not ( = ?auto_10631 ?auto_10632 ) ) ( not ( = ?auto_10633 ?auto_10634 ) ) ( not ( = ?auto_10633 ?auto_10632 ) ) ( not ( = ?auto_10634 ?auto_10632 ) ) ( ON ?auto_10634 ?auto_10633 ) ( CLEAR ?auto_10634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10630 ?auto_10631 ?auto_10633 )
      ( MAKE-2PILE ?auto_10630 ?auto_10631 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10635 - BLOCK
      ?auto_10636 - BLOCK
    )
    :vars
    (
      ?auto_10637 - BLOCK
      ?auto_10639 - BLOCK
      ?auto_10638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10637 ?auto_10636 ) ( ON-TABLE ?auto_10635 ) ( ON ?auto_10636 ?auto_10635 ) ( not ( = ?auto_10635 ?auto_10636 ) ) ( not ( = ?auto_10635 ?auto_10637 ) ) ( not ( = ?auto_10636 ?auto_10637 ) ) ( not ( = ?auto_10635 ?auto_10639 ) ) ( not ( = ?auto_10635 ?auto_10638 ) ) ( not ( = ?auto_10636 ?auto_10639 ) ) ( not ( = ?auto_10636 ?auto_10638 ) ) ( not ( = ?auto_10637 ?auto_10639 ) ) ( not ( = ?auto_10637 ?auto_10638 ) ) ( not ( = ?auto_10639 ?auto_10638 ) ) ( ON ?auto_10639 ?auto_10637 ) ( CLEAR ?auto_10639 ) ( HOLDING ?auto_10638 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10638 )
      ( MAKE-2PILE ?auto_10635 ?auto_10636 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10640 - BLOCK
      ?auto_10641 - BLOCK
    )
    :vars
    (
      ?auto_10642 - BLOCK
      ?auto_10643 - BLOCK
      ?auto_10644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10642 ?auto_10641 ) ( ON-TABLE ?auto_10640 ) ( ON ?auto_10641 ?auto_10640 ) ( not ( = ?auto_10640 ?auto_10641 ) ) ( not ( = ?auto_10640 ?auto_10642 ) ) ( not ( = ?auto_10641 ?auto_10642 ) ) ( not ( = ?auto_10640 ?auto_10643 ) ) ( not ( = ?auto_10640 ?auto_10644 ) ) ( not ( = ?auto_10641 ?auto_10643 ) ) ( not ( = ?auto_10641 ?auto_10644 ) ) ( not ( = ?auto_10642 ?auto_10643 ) ) ( not ( = ?auto_10642 ?auto_10644 ) ) ( not ( = ?auto_10643 ?auto_10644 ) ) ( ON ?auto_10643 ?auto_10642 ) ( ON ?auto_10644 ?auto_10643 ) ( CLEAR ?auto_10644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10640 ?auto_10641 ?auto_10642 ?auto_10643 )
      ( MAKE-2PILE ?auto_10640 ?auto_10641 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10648 - BLOCK
      ?auto_10649 - BLOCK
      ?auto_10650 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10650 ) ( CLEAR ?auto_10649 ) ( ON-TABLE ?auto_10648 ) ( ON ?auto_10649 ?auto_10648 ) ( not ( = ?auto_10648 ?auto_10649 ) ) ( not ( = ?auto_10648 ?auto_10650 ) ) ( not ( = ?auto_10649 ?auto_10650 ) ) )
    :subtasks
    ( ( !STACK ?auto_10650 ?auto_10649 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10651 - BLOCK
      ?auto_10652 - BLOCK
      ?auto_10653 - BLOCK
    )
    :vars
    (
      ?auto_10654 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10652 ) ( ON-TABLE ?auto_10651 ) ( ON ?auto_10652 ?auto_10651 ) ( not ( = ?auto_10651 ?auto_10652 ) ) ( not ( = ?auto_10651 ?auto_10653 ) ) ( not ( = ?auto_10652 ?auto_10653 ) ) ( ON ?auto_10653 ?auto_10654 ) ( CLEAR ?auto_10653 ) ( HAND-EMPTY ) ( not ( = ?auto_10651 ?auto_10654 ) ) ( not ( = ?auto_10652 ?auto_10654 ) ) ( not ( = ?auto_10653 ?auto_10654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10653 ?auto_10654 )
      ( MAKE-3PILE ?auto_10651 ?auto_10652 ?auto_10653 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10655 - BLOCK
      ?auto_10656 - BLOCK
      ?auto_10657 - BLOCK
    )
    :vars
    (
      ?auto_10658 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10655 ) ( not ( = ?auto_10655 ?auto_10656 ) ) ( not ( = ?auto_10655 ?auto_10657 ) ) ( not ( = ?auto_10656 ?auto_10657 ) ) ( ON ?auto_10657 ?auto_10658 ) ( CLEAR ?auto_10657 ) ( not ( = ?auto_10655 ?auto_10658 ) ) ( not ( = ?auto_10656 ?auto_10658 ) ) ( not ( = ?auto_10657 ?auto_10658 ) ) ( HOLDING ?auto_10656 ) ( CLEAR ?auto_10655 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10655 ?auto_10656 )
      ( MAKE-3PILE ?auto_10655 ?auto_10656 ?auto_10657 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10659 - BLOCK
      ?auto_10660 - BLOCK
      ?auto_10661 - BLOCK
    )
    :vars
    (
      ?auto_10662 - BLOCK
      ?auto_10663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10659 ) ( not ( = ?auto_10659 ?auto_10660 ) ) ( not ( = ?auto_10659 ?auto_10661 ) ) ( not ( = ?auto_10660 ?auto_10661 ) ) ( ON ?auto_10661 ?auto_10662 ) ( not ( = ?auto_10659 ?auto_10662 ) ) ( not ( = ?auto_10660 ?auto_10662 ) ) ( not ( = ?auto_10661 ?auto_10662 ) ) ( CLEAR ?auto_10659 ) ( ON ?auto_10660 ?auto_10661 ) ( CLEAR ?auto_10660 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10663 ) ( ON ?auto_10662 ?auto_10663 ) ( not ( = ?auto_10663 ?auto_10662 ) ) ( not ( = ?auto_10663 ?auto_10661 ) ) ( not ( = ?auto_10663 ?auto_10660 ) ) ( not ( = ?auto_10659 ?auto_10663 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10663 ?auto_10662 ?auto_10661 )
      ( MAKE-3PILE ?auto_10659 ?auto_10660 ?auto_10661 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10664 - BLOCK
      ?auto_10665 - BLOCK
      ?auto_10666 - BLOCK
    )
    :vars
    (
      ?auto_10668 - BLOCK
      ?auto_10667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10664 ?auto_10665 ) ) ( not ( = ?auto_10664 ?auto_10666 ) ) ( not ( = ?auto_10665 ?auto_10666 ) ) ( ON ?auto_10666 ?auto_10668 ) ( not ( = ?auto_10664 ?auto_10668 ) ) ( not ( = ?auto_10665 ?auto_10668 ) ) ( not ( = ?auto_10666 ?auto_10668 ) ) ( ON ?auto_10665 ?auto_10666 ) ( CLEAR ?auto_10665 ) ( ON-TABLE ?auto_10667 ) ( ON ?auto_10668 ?auto_10667 ) ( not ( = ?auto_10667 ?auto_10668 ) ) ( not ( = ?auto_10667 ?auto_10666 ) ) ( not ( = ?auto_10667 ?auto_10665 ) ) ( not ( = ?auto_10664 ?auto_10667 ) ) ( HOLDING ?auto_10664 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10664 )
      ( MAKE-3PILE ?auto_10664 ?auto_10665 ?auto_10666 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10669 - BLOCK
      ?auto_10670 - BLOCK
      ?auto_10671 - BLOCK
    )
    :vars
    (
      ?auto_10672 - BLOCK
      ?auto_10673 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10669 ?auto_10670 ) ) ( not ( = ?auto_10669 ?auto_10671 ) ) ( not ( = ?auto_10670 ?auto_10671 ) ) ( ON ?auto_10671 ?auto_10672 ) ( not ( = ?auto_10669 ?auto_10672 ) ) ( not ( = ?auto_10670 ?auto_10672 ) ) ( not ( = ?auto_10671 ?auto_10672 ) ) ( ON ?auto_10670 ?auto_10671 ) ( ON-TABLE ?auto_10673 ) ( ON ?auto_10672 ?auto_10673 ) ( not ( = ?auto_10673 ?auto_10672 ) ) ( not ( = ?auto_10673 ?auto_10671 ) ) ( not ( = ?auto_10673 ?auto_10670 ) ) ( not ( = ?auto_10669 ?auto_10673 ) ) ( ON ?auto_10669 ?auto_10670 ) ( CLEAR ?auto_10669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10673 ?auto_10672 ?auto_10671 ?auto_10670 )
      ( MAKE-3PILE ?auto_10669 ?auto_10670 ?auto_10671 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10675 - BLOCK
    )
    :vars
    (
      ?auto_10676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10676 ?auto_10675 ) ( CLEAR ?auto_10676 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10675 ) ( not ( = ?auto_10675 ?auto_10676 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10676 ?auto_10675 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10677 - BLOCK
    )
    :vars
    (
      ?auto_10678 - BLOCK
      ?auto_10679 - BLOCK
      ?auto_10680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10678 ?auto_10677 ) ( CLEAR ?auto_10678 ) ( ON-TABLE ?auto_10677 ) ( not ( = ?auto_10677 ?auto_10678 ) ) ( HOLDING ?auto_10679 ) ( CLEAR ?auto_10680 ) ( not ( = ?auto_10677 ?auto_10679 ) ) ( not ( = ?auto_10677 ?auto_10680 ) ) ( not ( = ?auto_10678 ?auto_10679 ) ) ( not ( = ?auto_10678 ?auto_10680 ) ) ( not ( = ?auto_10679 ?auto_10680 ) ) )
    :subtasks
    ( ( !STACK ?auto_10679 ?auto_10680 )
      ( MAKE-1PILE ?auto_10677 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10681 - BLOCK
    )
    :vars
    (
      ?auto_10684 - BLOCK
      ?auto_10682 - BLOCK
      ?auto_10683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10684 ?auto_10681 ) ( ON-TABLE ?auto_10681 ) ( not ( = ?auto_10681 ?auto_10684 ) ) ( CLEAR ?auto_10682 ) ( not ( = ?auto_10681 ?auto_10683 ) ) ( not ( = ?auto_10681 ?auto_10682 ) ) ( not ( = ?auto_10684 ?auto_10683 ) ) ( not ( = ?auto_10684 ?auto_10682 ) ) ( not ( = ?auto_10683 ?auto_10682 ) ) ( ON ?auto_10683 ?auto_10684 ) ( CLEAR ?auto_10683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10681 ?auto_10684 )
      ( MAKE-1PILE ?auto_10681 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10685 - BLOCK
    )
    :vars
    (
      ?auto_10686 - BLOCK
      ?auto_10687 - BLOCK
      ?auto_10688 - BLOCK
      ?auto_10689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10686 ?auto_10685 ) ( ON-TABLE ?auto_10685 ) ( not ( = ?auto_10685 ?auto_10686 ) ) ( not ( = ?auto_10685 ?auto_10687 ) ) ( not ( = ?auto_10685 ?auto_10688 ) ) ( not ( = ?auto_10686 ?auto_10687 ) ) ( not ( = ?auto_10686 ?auto_10688 ) ) ( not ( = ?auto_10687 ?auto_10688 ) ) ( ON ?auto_10687 ?auto_10686 ) ( CLEAR ?auto_10687 ) ( HOLDING ?auto_10688 ) ( CLEAR ?auto_10689 ) ( ON-TABLE ?auto_10689 ) ( not ( = ?auto_10689 ?auto_10688 ) ) ( not ( = ?auto_10685 ?auto_10689 ) ) ( not ( = ?auto_10686 ?auto_10689 ) ) ( not ( = ?auto_10687 ?auto_10689 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10689 ?auto_10688 )
      ( MAKE-1PILE ?auto_10685 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10690 - BLOCK
    )
    :vars
    (
      ?auto_10692 - BLOCK
      ?auto_10694 - BLOCK
      ?auto_10691 - BLOCK
      ?auto_10693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10692 ?auto_10690 ) ( ON-TABLE ?auto_10690 ) ( not ( = ?auto_10690 ?auto_10692 ) ) ( not ( = ?auto_10690 ?auto_10694 ) ) ( not ( = ?auto_10690 ?auto_10691 ) ) ( not ( = ?auto_10692 ?auto_10694 ) ) ( not ( = ?auto_10692 ?auto_10691 ) ) ( not ( = ?auto_10694 ?auto_10691 ) ) ( ON ?auto_10694 ?auto_10692 ) ( CLEAR ?auto_10693 ) ( ON-TABLE ?auto_10693 ) ( not ( = ?auto_10693 ?auto_10691 ) ) ( not ( = ?auto_10690 ?auto_10693 ) ) ( not ( = ?auto_10692 ?auto_10693 ) ) ( not ( = ?auto_10694 ?auto_10693 ) ) ( ON ?auto_10691 ?auto_10694 ) ( CLEAR ?auto_10691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10690 ?auto_10692 ?auto_10694 )
      ( MAKE-1PILE ?auto_10690 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10695 - BLOCK
    )
    :vars
    (
      ?auto_10698 - BLOCK
      ?auto_10699 - BLOCK
      ?auto_10697 - BLOCK
      ?auto_10696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10698 ?auto_10695 ) ( ON-TABLE ?auto_10695 ) ( not ( = ?auto_10695 ?auto_10698 ) ) ( not ( = ?auto_10695 ?auto_10699 ) ) ( not ( = ?auto_10695 ?auto_10697 ) ) ( not ( = ?auto_10698 ?auto_10699 ) ) ( not ( = ?auto_10698 ?auto_10697 ) ) ( not ( = ?auto_10699 ?auto_10697 ) ) ( ON ?auto_10699 ?auto_10698 ) ( not ( = ?auto_10696 ?auto_10697 ) ) ( not ( = ?auto_10695 ?auto_10696 ) ) ( not ( = ?auto_10698 ?auto_10696 ) ) ( not ( = ?auto_10699 ?auto_10696 ) ) ( ON ?auto_10697 ?auto_10699 ) ( CLEAR ?auto_10697 ) ( HOLDING ?auto_10696 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10696 )
      ( MAKE-1PILE ?auto_10695 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10700 - BLOCK
    )
    :vars
    (
      ?auto_10702 - BLOCK
      ?auto_10704 - BLOCK
      ?auto_10701 - BLOCK
      ?auto_10703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10702 ?auto_10700 ) ( ON-TABLE ?auto_10700 ) ( not ( = ?auto_10700 ?auto_10702 ) ) ( not ( = ?auto_10700 ?auto_10704 ) ) ( not ( = ?auto_10700 ?auto_10701 ) ) ( not ( = ?auto_10702 ?auto_10704 ) ) ( not ( = ?auto_10702 ?auto_10701 ) ) ( not ( = ?auto_10704 ?auto_10701 ) ) ( ON ?auto_10704 ?auto_10702 ) ( not ( = ?auto_10703 ?auto_10701 ) ) ( not ( = ?auto_10700 ?auto_10703 ) ) ( not ( = ?auto_10702 ?auto_10703 ) ) ( not ( = ?auto_10704 ?auto_10703 ) ) ( ON ?auto_10701 ?auto_10704 ) ( ON ?auto_10703 ?auto_10701 ) ( CLEAR ?auto_10703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10700 ?auto_10702 ?auto_10704 ?auto_10701 )
      ( MAKE-1PILE ?auto_10700 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10709 - BLOCK
      ?auto_10710 - BLOCK
      ?auto_10711 - BLOCK
      ?auto_10712 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10712 ) ( CLEAR ?auto_10711 ) ( ON-TABLE ?auto_10709 ) ( ON ?auto_10710 ?auto_10709 ) ( ON ?auto_10711 ?auto_10710 ) ( not ( = ?auto_10709 ?auto_10710 ) ) ( not ( = ?auto_10709 ?auto_10711 ) ) ( not ( = ?auto_10709 ?auto_10712 ) ) ( not ( = ?auto_10710 ?auto_10711 ) ) ( not ( = ?auto_10710 ?auto_10712 ) ) ( not ( = ?auto_10711 ?auto_10712 ) ) )
    :subtasks
    ( ( !STACK ?auto_10712 ?auto_10711 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10713 - BLOCK
      ?auto_10714 - BLOCK
      ?auto_10715 - BLOCK
      ?auto_10716 - BLOCK
    )
    :vars
    (
      ?auto_10717 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10715 ) ( ON-TABLE ?auto_10713 ) ( ON ?auto_10714 ?auto_10713 ) ( ON ?auto_10715 ?auto_10714 ) ( not ( = ?auto_10713 ?auto_10714 ) ) ( not ( = ?auto_10713 ?auto_10715 ) ) ( not ( = ?auto_10713 ?auto_10716 ) ) ( not ( = ?auto_10714 ?auto_10715 ) ) ( not ( = ?auto_10714 ?auto_10716 ) ) ( not ( = ?auto_10715 ?auto_10716 ) ) ( ON ?auto_10716 ?auto_10717 ) ( CLEAR ?auto_10716 ) ( HAND-EMPTY ) ( not ( = ?auto_10713 ?auto_10717 ) ) ( not ( = ?auto_10714 ?auto_10717 ) ) ( not ( = ?auto_10715 ?auto_10717 ) ) ( not ( = ?auto_10716 ?auto_10717 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10716 ?auto_10717 )
      ( MAKE-4PILE ?auto_10713 ?auto_10714 ?auto_10715 ?auto_10716 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10718 - BLOCK
      ?auto_10719 - BLOCK
      ?auto_10720 - BLOCK
      ?auto_10721 - BLOCK
    )
    :vars
    (
      ?auto_10722 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10718 ) ( ON ?auto_10719 ?auto_10718 ) ( not ( = ?auto_10718 ?auto_10719 ) ) ( not ( = ?auto_10718 ?auto_10720 ) ) ( not ( = ?auto_10718 ?auto_10721 ) ) ( not ( = ?auto_10719 ?auto_10720 ) ) ( not ( = ?auto_10719 ?auto_10721 ) ) ( not ( = ?auto_10720 ?auto_10721 ) ) ( ON ?auto_10721 ?auto_10722 ) ( CLEAR ?auto_10721 ) ( not ( = ?auto_10718 ?auto_10722 ) ) ( not ( = ?auto_10719 ?auto_10722 ) ) ( not ( = ?auto_10720 ?auto_10722 ) ) ( not ( = ?auto_10721 ?auto_10722 ) ) ( HOLDING ?auto_10720 ) ( CLEAR ?auto_10719 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10718 ?auto_10719 ?auto_10720 )
      ( MAKE-4PILE ?auto_10718 ?auto_10719 ?auto_10720 ?auto_10721 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10723 - BLOCK
      ?auto_10724 - BLOCK
      ?auto_10725 - BLOCK
      ?auto_10726 - BLOCK
    )
    :vars
    (
      ?auto_10727 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10723 ) ( ON ?auto_10724 ?auto_10723 ) ( not ( = ?auto_10723 ?auto_10724 ) ) ( not ( = ?auto_10723 ?auto_10725 ) ) ( not ( = ?auto_10723 ?auto_10726 ) ) ( not ( = ?auto_10724 ?auto_10725 ) ) ( not ( = ?auto_10724 ?auto_10726 ) ) ( not ( = ?auto_10725 ?auto_10726 ) ) ( ON ?auto_10726 ?auto_10727 ) ( not ( = ?auto_10723 ?auto_10727 ) ) ( not ( = ?auto_10724 ?auto_10727 ) ) ( not ( = ?auto_10725 ?auto_10727 ) ) ( not ( = ?auto_10726 ?auto_10727 ) ) ( CLEAR ?auto_10724 ) ( ON ?auto_10725 ?auto_10726 ) ( CLEAR ?auto_10725 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10727 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10727 ?auto_10726 )
      ( MAKE-4PILE ?auto_10723 ?auto_10724 ?auto_10725 ?auto_10726 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10728 - BLOCK
      ?auto_10729 - BLOCK
      ?auto_10730 - BLOCK
      ?auto_10731 - BLOCK
    )
    :vars
    (
      ?auto_10732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10728 ) ( not ( = ?auto_10728 ?auto_10729 ) ) ( not ( = ?auto_10728 ?auto_10730 ) ) ( not ( = ?auto_10728 ?auto_10731 ) ) ( not ( = ?auto_10729 ?auto_10730 ) ) ( not ( = ?auto_10729 ?auto_10731 ) ) ( not ( = ?auto_10730 ?auto_10731 ) ) ( ON ?auto_10731 ?auto_10732 ) ( not ( = ?auto_10728 ?auto_10732 ) ) ( not ( = ?auto_10729 ?auto_10732 ) ) ( not ( = ?auto_10730 ?auto_10732 ) ) ( not ( = ?auto_10731 ?auto_10732 ) ) ( ON ?auto_10730 ?auto_10731 ) ( CLEAR ?auto_10730 ) ( ON-TABLE ?auto_10732 ) ( HOLDING ?auto_10729 ) ( CLEAR ?auto_10728 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10728 ?auto_10729 )
      ( MAKE-4PILE ?auto_10728 ?auto_10729 ?auto_10730 ?auto_10731 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10733 - BLOCK
      ?auto_10734 - BLOCK
      ?auto_10735 - BLOCK
      ?auto_10736 - BLOCK
    )
    :vars
    (
      ?auto_10737 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10733 ) ( not ( = ?auto_10733 ?auto_10734 ) ) ( not ( = ?auto_10733 ?auto_10735 ) ) ( not ( = ?auto_10733 ?auto_10736 ) ) ( not ( = ?auto_10734 ?auto_10735 ) ) ( not ( = ?auto_10734 ?auto_10736 ) ) ( not ( = ?auto_10735 ?auto_10736 ) ) ( ON ?auto_10736 ?auto_10737 ) ( not ( = ?auto_10733 ?auto_10737 ) ) ( not ( = ?auto_10734 ?auto_10737 ) ) ( not ( = ?auto_10735 ?auto_10737 ) ) ( not ( = ?auto_10736 ?auto_10737 ) ) ( ON ?auto_10735 ?auto_10736 ) ( ON-TABLE ?auto_10737 ) ( CLEAR ?auto_10733 ) ( ON ?auto_10734 ?auto_10735 ) ( CLEAR ?auto_10734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10737 ?auto_10736 ?auto_10735 )
      ( MAKE-4PILE ?auto_10733 ?auto_10734 ?auto_10735 ?auto_10736 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10738 - BLOCK
      ?auto_10739 - BLOCK
      ?auto_10740 - BLOCK
      ?auto_10741 - BLOCK
    )
    :vars
    (
      ?auto_10742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10738 ?auto_10739 ) ) ( not ( = ?auto_10738 ?auto_10740 ) ) ( not ( = ?auto_10738 ?auto_10741 ) ) ( not ( = ?auto_10739 ?auto_10740 ) ) ( not ( = ?auto_10739 ?auto_10741 ) ) ( not ( = ?auto_10740 ?auto_10741 ) ) ( ON ?auto_10741 ?auto_10742 ) ( not ( = ?auto_10738 ?auto_10742 ) ) ( not ( = ?auto_10739 ?auto_10742 ) ) ( not ( = ?auto_10740 ?auto_10742 ) ) ( not ( = ?auto_10741 ?auto_10742 ) ) ( ON ?auto_10740 ?auto_10741 ) ( ON-TABLE ?auto_10742 ) ( ON ?auto_10739 ?auto_10740 ) ( CLEAR ?auto_10739 ) ( HOLDING ?auto_10738 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10738 )
      ( MAKE-4PILE ?auto_10738 ?auto_10739 ?auto_10740 ?auto_10741 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10743 - BLOCK
      ?auto_10744 - BLOCK
      ?auto_10745 - BLOCK
      ?auto_10746 - BLOCK
    )
    :vars
    (
      ?auto_10747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10743 ?auto_10744 ) ) ( not ( = ?auto_10743 ?auto_10745 ) ) ( not ( = ?auto_10743 ?auto_10746 ) ) ( not ( = ?auto_10744 ?auto_10745 ) ) ( not ( = ?auto_10744 ?auto_10746 ) ) ( not ( = ?auto_10745 ?auto_10746 ) ) ( ON ?auto_10746 ?auto_10747 ) ( not ( = ?auto_10743 ?auto_10747 ) ) ( not ( = ?auto_10744 ?auto_10747 ) ) ( not ( = ?auto_10745 ?auto_10747 ) ) ( not ( = ?auto_10746 ?auto_10747 ) ) ( ON ?auto_10745 ?auto_10746 ) ( ON-TABLE ?auto_10747 ) ( ON ?auto_10744 ?auto_10745 ) ( ON ?auto_10743 ?auto_10744 ) ( CLEAR ?auto_10743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10747 ?auto_10746 ?auto_10745 ?auto_10744 )
      ( MAKE-4PILE ?auto_10743 ?auto_10744 ?auto_10745 ?auto_10746 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10751 - BLOCK
      ?auto_10752 - BLOCK
      ?auto_10753 - BLOCK
    )
    :vars
    (
      ?auto_10754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10754 ?auto_10753 ) ( CLEAR ?auto_10754 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10751 ) ( ON ?auto_10752 ?auto_10751 ) ( ON ?auto_10753 ?auto_10752 ) ( not ( = ?auto_10751 ?auto_10752 ) ) ( not ( = ?auto_10751 ?auto_10753 ) ) ( not ( = ?auto_10751 ?auto_10754 ) ) ( not ( = ?auto_10752 ?auto_10753 ) ) ( not ( = ?auto_10752 ?auto_10754 ) ) ( not ( = ?auto_10753 ?auto_10754 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10754 ?auto_10753 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10764 - BLOCK
      ?auto_10765 - BLOCK
      ?auto_10766 - BLOCK
    )
    :vars
    (
      ?auto_10767 - BLOCK
      ?auto_10768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10764 ) ( ON ?auto_10765 ?auto_10764 ) ( not ( = ?auto_10764 ?auto_10765 ) ) ( not ( = ?auto_10764 ?auto_10766 ) ) ( not ( = ?auto_10764 ?auto_10767 ) ) ( not ( = ?auto_10765 ?auto_10766 ) ) ( not ( = ?auto_10765 ?auto_10767 ) ) ( not ( = ?auto_10766 ?auto_10767 ) ) ( ON ?auto_10767 ?auto_10768 ) ( CLEAR ?auto_10767 ) ( not ( = ?auto_10764 ?auto_10768 ) ) ( not ( = ?auto_10765 ?auto_10768 ) ) ( not ( = ?auto_10766 ?auto_10768 ) ) ( not ( = ?auto_10767 ?auto_10768 ) ) ( HOLDING ?auto_10766 ) ( CLEAR ?auto_10765 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10764 ?auto_10765 ?auto_10766 ?auto_10767 )
      ( MAKE-3PILE ?auto_10764 ?auto_10765 ?auto_10766 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10769 - BLOCK
      ?auto_10770 - BLOCK
      ?auto_10771 - BLOCK
    )
    :vars
    (
      ?auto_10773 - BLOCK
      ?auto_10772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10769 ) ( ON ?auto_10770 ?auto_10769 ) ( not ( = ?auto_10769 ?auto_10770 ) ) ( not ( = ?auto_10769 ?auto_10771 ) ) ( not ( = ?auto_10769 ?auto_10773 ) ) ( not ( = ?auto_10770 ?auto_10771 ) ) ( not ( = ?auto_10770 ?auto_10773 ) ) ( not ( = ?auto_10771 ?auto_10773 ) ) ( ON ?auto_10773 ?auto_10772 ) ( not ( = ?auto_10769 ?auto_10772 ) ) ( not ( = ?auto_10770 ?auto_10772 ) ) ( not ( = ?auto_10771 ?auto_10772 ) ) ( not ( = ?auto_10773 ?auto_10772 ) ) ( CLEAR ?auto_10770 ) ( ON ?auto_10771 ?auto_10773 ) ( CLEAR ?auto_10771 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10772 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10772 ?auto_10773 )
      ( MAKE-3PILE ?auto_10769 ?auto_10770 ?auto_10771 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10774 - BLOCK
      ?auto_10775 - BLOCK
      ?auto_10776 - BLOCK
    )
    :vars
    (
      ?auto_10777 - BLOCK
      ?auto_10778 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10774 ) ( not ( = ?auto_10774 ?auto_10775 ) ) ( not ( = ?auto_10774 ?auto_10776 ) ) ( not ( = ?auto_10774 ?auto_10777 ) ) ( not ( = ?auto_10775 ?auto_10776 ) ) ( not ( = ?auto_10775 ?auto_10777 ) ) ( not ( = ?auto_10776 ?auto_10777 ) ) ( ON ?auto_10777 ?auto_10778 ) ( not ( = ?auto_10774 ?auto_10778 ) ) ( not ( = ?auto_10775 ?auto_10778 ) ) ( not ( = ?auto_10776 ?auto_10778 ) ) ( not ( = ?auto_10777 ?auto_10778 ) ) ( ON ?auto_10776 ?auto_10777 ) ( CLEAR ?auto_10776 ) ( ON-TABLE ?auto_10778 ) ( HOLDING ?auto_10775 ) ( CLEAR ?auto_10774 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10774 ?auto_10775 )
      ( MAKE-3PILE ?auto_10774 ?auto_10775 ?auto_10776 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10779 - BLOCK
      ?auto_10780 - BLOCK
      ?auto_10781 - BLOCK
    )
    :vars
    (
      ?auto_10782 - BLOCK
      ?auto_10783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10779 ) ( not ( = ?auto_10779 ?auto_10780 ) ) ( not ( = ?auto_10779 ?auto_10781 ) ) ( not ( = ?auto_10779 ?auto_10782 ) ) ( not ( = ?auto_10780 ?auto_10781 ) ) ( not ( = ?auto_10780 ?auto_10782 ) ) ( not ( = ?auto_10781 ?auto_10782 ) ) ( ON ?auto_10782 ?auto_10783 ) ( not ( = ?auto_10779 ?auto_10783 ) ) ( not ( = ?auto_10780 ?auto_10783 ) ) ( not ( = ?auto_10781 ?auto_10783 ) ) ( not ( = ?auto_10782 ?auto_10783 ) ) ( ON ?auto_10781 ?auto_10782 ) ( ON-TABLE ?auto_10783 ) ( CLEAR ?auto_10779 ) ( ON ?auto_10780 ?auto_10781 ) ( CLEAR ?auto_10780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10783 ?auto_10782 ?auto_10781 )
      ( MAKE-3PILE ?auto_10779 ?auto_10780 ?auto_10781 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10784 - BLOCK
      ?auto_10785 - BLOCK
      ?auto_10786 - BLOCK
    )
    :vars
    (
      ?auto_10788 - BLOCK
      ?auto_10787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10784 ?auto_10785 ) ) ( not ( = ?auto_10784 ?auto_10786 ) ) ( not ( = ?auto_10784 ?auto_10788 ) ) ( not ( = ?auto_10785 ?auto_10786 ) ) ( not ( = ?auto_10785 ?auto_10788 ) ) ( not ( = ?auto_10786 ?auto_10788 ) ) ( ON ?auto_10788 ?auto_10787 ) ( not ( = ?auto_10784 ?auto_10787 ) ) ( not ( = ?auto_10785 ?auto_10787 ) ) ( not ( = ?auto_10786 ?auto_10787 ) ) ( not ( = ?auto_10788 ?auto_10787 ) ) ( ON ?auto_10786 ?auto_10788 ) ( ON-TABLE ?auto_10787 ) ( ON ?auto_10785 ?auto_10786 ) ( CLEAR ?auto_10785 ) ( HOLDING ?auto_10784 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10784 )
      ( MAKE-3PILE ?auto_10784 ?auto_10785 ?auto_10786 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10789 - BLOCK
      ?auto_10790 - BLOCK
      ?auto_10791 - BLOCK
    )
    :vars
    (
      ?auto_10792 - BLOCK
      ?auto_10793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10789 ?auto_10790 ) ) ( not ( = ?auto_10789 ?auto_10791 ) ) ( not ( = ?auto_10789 ?auto_10792 ) ) ( not ( = ?auto_10790 ?auto_10791 ) ) ( not ( = ?auto_10790 ?auto_10792 ) ) ( not ( = ?auto_10791 ?auto_10792 ) ) ( ON ?auto_10792 ?auto_10793 ) ( not ( = ?auto_10789 ?auto_10793 ) ) ( not ( = ?auto_10790 ?auto_10793 ) ) ( not ( = ?auto_10791 ?auto_10793 ) ) ( not ( = ?auto_10792 ?auto_10793 ) ) ( ON ?auto_10791 ?auto_10792 ) ( ON-TABLE ?auto_10793 ) ( ON ?auto_10790 ?auto_10791 ) ( ON ?auto_10789 ?auto_10790 ) ( CLEAR ?auto_10789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10793 ?auto_10792 ?auto_10791 ?auto_10790 )
      ( MAKE-3PILE ?auto_10789 ?auto_10790 ?auto_10791 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10795 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10795 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_10795 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10796 - BLOCK
    )
    :vars
    (
      ?auto_10797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10796 ?auto_10797 ) ( CLEAR ?auto_10796 ) ( HAND-EMPTY ) ( not ( = ?auto_10796 ?auto_10797 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10796 ?auto_10797 )
      ( MAKE-1PILE ?auto_10796 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10798 - BLOCK
    )
    :vars
    (
      ?auto_10799 - BLOCK
      ?auto_10801 - BLOCK
      ?auto_10800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10798 ?auto_10799 ) ) ( HOLDING ?auto_10798 ) ( CLEAR ?auto_10799 ) ( ON-TABLE ?auto_10801 ) ( ON ?auto_10800 ?auto_10801 ) ( ON ?auto_10799 ?auto_10800 ) ( not ( = ?auto_10801 ?auto_10800 ) ) ( not ( = ?auto_10801 ?auto_10799 ) ) ( not ( = ?auto_10801 ?auto_10798 ) ) ( not ( = ?auto_10800 ?auto_10799 ) ) ( not ( = ?auto_10800 ?auto_10798 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10801 ?auto_10800 ?auto_10799 ?auto_10798 )
      ( MAKE-1PILE ?auto_10798 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10802 - BLOCK
    )
    :vars
    (
      ?auto_10804 - BLOCK
      ?auto_10805 - BLOCK
      ?auto_10803 - BLOCK
      ?auto_10806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10802 ?auto_10804 ) ) ( CLEAR ?auto_10804 ) ( ON-TABLE ?auto_10805 ) ( ON ?auto_10803 ?auto_10805 ) ( ON ?auto_10804 ?auto_10803 ) ( not ( = ?auto_10805 ?auto_10803 ) ) ( not ( = ?auto_10805 ?auto_10804 ) ) ( not ( = ?auto_10805 ?auto_10802 ) ) ( not ( = ?auto_10803 ?auto_10804 ) ) ( not ( = ?auto_10803 ?auto_10802 ) ) ( ON ?auto_10802 ?auto_10806 ) ( CLEAR ?auto_10802 ) ( HAND-EMPTY ) ( not ( = ?auto_10802 ?auto_10806 ) ) ( not ( = ?auto_10804 ?auto_10806 ) ) ( not ( = ?auto_10805 ?auto_10806 ) ) ( not ( = ?auto_10803 ?auto_10806 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10802 ?auto_10806 )
      ( MAKE-1PILE ?auto_10802 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10807 - BLOCK
    )
    :vars
    (
      ?auto_10811 - BLOCK
      ?auto_10809 - BLOCK
      ?auto_10810 - BLOCK
      ?auto_10808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10807 ?auto_10811 ) ) ( ON-TABLE ?auto_10809 ) ( ON ?auto_10810 ?auto_10809 ) ( not ( = ?auto_10809 ?auto_10810 ) ) ( not ( = ?auto_10809 ?auto_10811 ) ) ( not ( = ?auto_10809 ?auto_10807 ) ) ( not ( = ?auto_10810 ?auto_10811 ) ) ( not ( = ?auto_10810 ?auto_10807 ) ) ( ON ?auto_10807 ?auto_10808 ) ( CLEAR ?auto_10807 ) ( not ( = ?auto_10807 ?auto_10808 ) ) ( not ( = ?auto_10811 ?auto_10808 ) ) ( not ( = ?auto_10809 ?auto_10808 ) ) ( not ( = ?auto_10810 ?auto_10808 ) ) ( HOLDING ?auto_10811 ) ( CLEAR ?auto_10810 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10809 ?auto_10810 ?auto_10811 )
      ( MAKE-1PILE ?auto_10807 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10812 - BLOCK
    )
    :vars
    (
      ?auto_10813 - BLOCK
      ?auto_10815 - BLOCK
      ?auto_10816 - BLOCK
      ?auto_10814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10812 ?auto_10813 ) ) ( ON-TABLE ?auto_10815 ) ( ON ?auto_10816 ?auto_10815 ) ( not ( = ?auto_10815 ?auto_10816 ) ) ( not ( = ?auto_10815 ?auto_10813 ) ) ( not ( = ?auto_10815 ?auto_10812 ) ) ( not ( = ?auto_10816 ?auto_10813 ) ) ( not ( = ?auto_10816 ?auto_10812 ) ) ( ON ?auto_10812 ?auto_10814 ) ( not ( = ?auto_10812 ?auto_10814 ) ) ( not ( = ?auto_10813 ?auto_10814 ) ) ( not ( = ?auto_10815 ?auto_10814 ) ) ( not ( = ?auto_10816 ?auto_10814 ) ) ( CLEAR ?auto_10816 ) ( ON ?auto_10813 ?auto_10812 ) ( CLEAR ?auto_10813 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10814 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10814 ?auto_10812 )
      ( MAKE-1PILE ?auto_10812 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10817 - BLOCK
    )
    :vars
    (
      ?auto_10821 - BLOCK
      ?auto_10819 - BLOCK
      ?auto_10820 - BLOCK
      ?auto_10818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10817 ?auto_10821 ) ) ( ON-TABLE ?auto_10819 ) ( not ( = ?auto_10819 ?auto_10820 ) ) ( not ( = ?auto_10819 ?auto_10821 ) ) ( not ( = ?auto_10819 ?auto_10817 ) ) ( not ( = ?auto_10820 ?auto_10821 ) ) ( not ( = ?auto_10820 ?auto_10817 ) ) ( ON ?auto_10817 ?auto_10818 ) ( not ( = ?auto_10817 ?auto_10818 ) ) ( not ( = ?auto_10821 ?auto_10818 ) ) ( not ( = ?auto_10819 ?auto_10818 ) ) ( not ( = ?auto_10820 ?auto_10818 ) ) ( ON ?auto_10821 ?auto_10817 ) ( CLEAR ?auto_10821 ) ( ON-TABLE ?auto_10818 ) ( HOLDING ?auto_10820 ) ( CLEAR ?auto_10819 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10819 ?auto_10820 )
      ( MAKE-1PILE ?auto_10817 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10822 - BLOCK
    )
    :vars
    (
      ?auto_10826 - BLOCK
      ?auto_10823 - BLOCK
      ?auto_10825 - BLOCK
      ?auto_10824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10822 ?auto_10826 ) ) ( ON-TABLE ?auto_10823 ) ( not ( = ?auto_10823 ?auto_10825 ) ) ( not ( = ?auto_10823 ?auto_10826 ) ) ( not ( = ?auto_10823 ?auto_10822 ) ) ( not ( = ?auto_10825 ?auto_10826 ) ) ( not ( = ?auto_10825 ?auto_10822 ) ) ( ON ?auto_10822 ?auto_10824 ) ( not ( = ?auto_10822 ?auto_10824 ) ) ( not ( = ?auto_10826 ?auto_10824 ) ) ( not ( = ?auto_10823 ?auto_10824 ) ) ( not ( = ?auto_10825 ?auto_10824 ) ) ( ON ?auto_10826 ?auto_10822 ) ( ON-TABLE ?auto_10824 ) ( CLEAR ?auto_10823 ) ( ON ?auto_10825 ?auto_10826 ) ( CLEAR ?auto_10825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10824 ?auto_10822 ?auto_10826 )
      ( MAKE-1PILE ?auto_10822 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10827 - BLOCK
    )
    :vars
    (
      ?auto_10829 - BLOCK
      ?auto_10828 - BLOCK
      ?auto_10830 - BLOCK
      ?auto_10831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10827 ?auto_10829 ) ) ( not ( = ?auto_10828 ?auto_10830 ) ) ( not ( = ?auto_10828 ?auto_10829 ) ) ( not ( = ?auto_10828 ?auto_10827 ) ) ( not ( = ?auto_10830 ?auto_10829 ) ) ( not ( = ?auto_10830 ?auto_10827 ) ) ( ON ?auto_10827 ?auto_10831 ) ( not ( = ?auto_10827 ?auto_10831 ) ) ( not ( = ?auto_10829 ?auto_10831 ) ) ( not ( = ?auto_10828 ?auto_10831 ) ) ( not ( = ?auto_10830 ?auto_10831 ) ) ( ON ?auto_10829 ?auto_10827 ) ( ON-TABLE ?auto_10831 ) ( ON ?auto_10830 ?auto_10829 ) ( CLEAR ?auto_10830 ) ( HOLDING ?auto_10828 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10828 )
      ( MAKE-1PILE ?auto_10827 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10832 - BLOCK
    )
    :vars
    (
      ?auto_10835 - BLOCK
      ?auto_10836 - BLOCK
      ?auto_10834 - BLOCK
      ?auto_10833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10832 ?auto_10835 ) ) ( not ( = ?auto_10836 ?auto_10834 ) ) ( not ( = ?auto_10836 ?auto_10835 ) ) ( not ( = ?auto_10836 ?auto_10832 ) ) ( not ( = ?auto_10834 ?auto_10835 ) ) ( not ( = ?auto_10834 ?auto_10832 ) ) ( ON ?auto_10832 ?auto_10833 ) ( not ( = ?auto_10832 ?auto_10833 ) ) ( not ( = ?auto_10835 ?auto_10833 ) ) ( not ( = ?auto_10836 ?auto_10833 ) ) ( not ( = ?auto_10834 ?auto_10833 ) ) ( ON ?auto_10835 ?auto_10832 ) ( ON-TABLE ?auto_10833 ) ( ON ?auto_10834 ?auto_10835 ) ( ON ?auto_10836 ?auto_10834 ) ( CLEAR ?auto_10836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10833 ?auto_10832 ?auto_10835 ?auto_10834 )
      ( MAKE-1PILE ?auto_10832 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10839 - BLOCK
      ?auto_10840 - BLOCK
    )
    :vars
    (
      ?auto_10841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10841 ?auto_10840 ) ( CLEAR ?auto_10841 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10839 ) ( ON ?auto_10840 ?auto_10839 ) ( not ( = ?auto_10839 ?auto_10840 ) ) ( not ( = ?auto_10839 ?auto_10841 ) ) ( not ( = ?auto_10840 ?auto_10841 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10841 ?auto_10840 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10842 - BLOCK
      ?auto_10843 - BLOCK
    )
    :vars
    (
      ?auto_10844 - BLOCK
      ?auto_10845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10844 ?auto_10843 ) ( CLEAR ?auto_10844 ) ( ON-TABLE ?auto_10842 ) ( ON ?auto_10843 ?auto_10842 ) ( not ( = ?auto_10842 ?auto_10843 ) ) ( not ( = ?auto_10842 ?auto_10844 ) ) ( not ( = ?auto_10843 ?auto_10844 ) ) ( HOLDING ?auto_10845 ) ( not ( = ?auto_10842 ?auto_10845 ) ) ( not ( = ?auto_10843 ?auto_10845 ) ) ( not ( = ?auto_10844 ?auto_10845 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_10845 )
      ( MAKE-2PILE ?auto_10842 ?auto_10843 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10846 - BLOCK
      ?auto_10847 - BLOCK
    )
    :vars
    (
      ?auto_10848 - BLOCK
      ?auto_10849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10848 ?auto_10847 ) ( ON-TABLE ?auto_10846 ) ( ON ?auto_10847 ?auto_10846 ) ( not ( = ?auto_10846 ?auto_10847 ) ) ( not ( = ?auto_10846 ?auto_10848 ) ) ( not ( = ?auto_10847 ?auto_10848 ) ) ( not ( = ?auto_10846 ?auto_10849 ) ) ( not ( = ?auto_10847 ?auto_10849 ) ) ( not ( = ?auto_10848 ?auto_10849 ) ) ( ON ?auto_10849 ?auto_10848 ) ( CLEAR ?auto_10849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10846 ?auto_10847 ?auto_10848 )
      ( MAKE-2PILE ?auto_10846 ?auto_10847 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10850 - BLOCK
      ?auto_10851 - BLOCK
    )
    :vars
    (
      ?auto_10852 - BLOCK
      ?auto_10853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10852 ?auto_10851 ) ( ON-TABLE ?auto_10850 ) ( ON ?auto_10851 ?auto_10850 ) ( not ( = ?auto_10850 ?auto_10851 ) ) ( not ( = ?auto_10850 ?auto_10852 ) ) ( not ( = ?auto_10851 ?auto_10852 ) ) ( not ( = ?auto_10850 ?auto_10853 ) ) ( not ( = ?auto_10851 ?auto_10853 ) ) ( not ( = ?auto_10852 ?auto_10853 ) ) ( HOLDING ?auto_10853 ) ( CLEAR ?auto_10852 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10850 ?auto_10851 ?auto_10852 ?auto_10853 )
      ( MAKE-2PILE ?auto_10850 ?auto_10851 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10854 - BLOCK
      ?auto_10855 - BLOCK
    )
    :vars
    (
      ?auto_10857 - BLOCK
      ?auto_10856 - BLOCK
      ?auto_10858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10857 ?auto_10855 ) ( ON-TABLE ?auto_10854 ) ( ON ?auto_10855 ?auto_10854 ) ( not ( = ?auto_10854 ?auto_10855 ) ) ( not ( = ?auto_10854 ?auto_10857 ) ) ( not ( = ?auto_10855 ?auto_10857 ) ) ( not ( = ?auto_10854 ?auto_10856 ) ) ( not ( = ?auto_10855 ?auto_10856 ) ) ( not ( = ?auto_10857 ?auto_10856 ) ) ( CLEAR ?auto_10857 ) ( ON ?auto_10856 ?auto_10858 ) ( CLEAR ?auto_10856 ) ( HAND-EMPTY ) ( not ( = ?auto_10854 ?auto_10858 ) ) ( not ( = ?auto_10855 ?auto_10858 ) ) ( not ( = ?auto_10857 ?auto_10858 ) ) ( not ( = ?auto_10856 ?auto_10858 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10856 ?auto_10858 )
      ( MAKE-2PILE ?auto_10854 ?auto_10855 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10869 - BLOCK
      ?auto_10870 - BLOCK
    )
    :vars
    (
      ?auto_10873 - BLOCK
      ?auto_10872 - BLOCK
      ?auto_10871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10869 ) ( not ( = ?auto_10869 ?auto_10870 ) ) ( not ( = ?auto_10869 ?auto_10873 ) ) ( not ( = ?auto_10870 ?auto_10873 ) ) ( not ( = ?auto_10869 ?auto_10872 ) ) ( not ( = ?auto_10870 ?auto_10872 ) ) ( not ( = ?auto_10873 ?auto_10872 ) ) ( ON ?auto_10872 ?auto_10871 ) ( not ( = ?auto_10869 ?auto_10871 ) ) ( not ( = ?auto_10870 ?auto_10871 ) ) ( not ( = ?auto_10873 ?auto_10871 ) ) ( not ( = ?auto_10872 ?auto_10871 ) ) ( ON ?auto_10873 ?auto_10872 ) ( CLEAR ?auto_10873 ) ( HOLDING ?auto_10870 ) ( CLEAR ?auto_10869 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10869 ?auto_10870 ?auto_10873 )
      ( MAKE-2PILE ?auto_10869 ?auto_10870 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10874 - BLOCK
      ?auto_10875 - BLOCK
    )
    :vars
    (
      ?auto_10878 - BLOCK
      ?auto_10877 - BLOCK
      ?auto_10876 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10874 ) ( not ( = ?auto_10874 ?auto_10875 ) ) ( not ( = ?auto_10874 ?auto_10878 ) ) ( not ( = ?auto_10875 ?auto_10878 ) ) ( not ( = ?auto_10874 ?auto_10877 ) ) ( not ( = ?auto_10875 ?auto_10877 ) ) ( not ( = ?auto_10878 ?auto_10877 ) ) ( ON ?auto_10877 ?auto_10876 ) ( not ( = ?auto_10874 ?auto_10876 ) ) ( not ( = ?auto_10875 ?auto_10876 ) ) ( not ( = ?auto_10878 ?auto_10876 ) ) ( not ( = ?auto_10877 ?auto_10876 ) ) ( ON ?auto_10878 ?auto_10877 ) ( CLEAR ?auto_10874 ) ( ON ?auto_10875 ?auto_10878 ) ( CLEAR ?auto_10875 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10876 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10876 ?auto_10877 ?auto_10878 )
      ( MAKE-2PILE ?auto_10874 ?auto_10875 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10879 - BLOCK
      ?auto_10880 - BLOCK
    )
    :vars
    (
      ?auto_10883 - BLOCK
      ?auto_10881 - BLOCK
      ?auto_10882 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10879 ?auto_10880 ) ) ( not ( = ?auto_10879 ?auto_10883 ) ) ( not ( = ?auto_10880 ?auto_10883 ) ) ( not ( = ?auto_10879 ?auto_10881 ) ) ( not ( = ?auto_10880 ?auto_10881 ) ) ( not ( = ?auto_10883 ?auto_10881 ) ) ( ON ?auto_10881 ?auto_10882 ) ( not ( = ?auto_10879 ?auto_10882 ) ) ( not ( = ?auto_10880 ?auto_10882 ) ) ( not ( = ?auto_10883 ?auto_10882 ) ) ( not ( = ?auto_10881 ?auto_10882 ) ) ( ON ?auto_10883 ?auto_10881 ) ( ON ?auto_10880 ?auto_10883 ) ( CLEAR ?auto_10880 ) ( ON-TABLE ?auto_10882 ) ( HOLDING ?auto_10879 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10879 )
      ( MAKE-2PILE ?auto_10879 ?auto_10880 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10884 - BLOCK
      ?auto_10885 - BLOCK
    )
    :vars
    (
      ?auto_10886 - BLOCK
      ?auto_10887 - BLOCK
      ?auto_10888 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10884 ?auto_10885 ) ) ( not ( = ?auto_10884 ?auto_10886 ) ) ( not ( = ?auto_10885 ?auto_10886 ) ) ( not ( = ?auto_10884 ?auto_10887 ) ) ( not ( = ?auto_10885 ?auto_10887 ) ) ( not ( = ?auto_10886 ?auto_10887 ) ) ( ON ?auto_10887 ?auto_10888 ) ( not ( = ?auto_10884 ?auto_10888 ) ) ( not ( = ?auto_10885 ?auto_10888 ) ) ( not ( = ?auto_10886 ?auto_10888 ) ) ( not ( = ?auto_10887 ?auto_10888 ) ) ( ON ?auto_10886 ?auto_10887 ) ( ON ?auto_10885 ?auto_10886 ) ( ON-TABLE ?auto_10888 ) ( ON ?auto_10884 ?auto_10885 ) ( CLEAR ?auto_10884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10888 ?auto_10887 ?auto_10886 ?auto_10885 )
      ( MAKE-2PILE ?auto_10884 ?auto_10885 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10891 - BLOCK
      ?auto_10892 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10892 ) ( CLEAR ?auto_10891 ) ( ON-TABLE ?auto_10891 ) ( not ( = ?auto_10891 ?auto_10892 ) ) )
    :subtasks
    ( ( !STACK ?auto_10892 ?auto_10891 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10893 - BLOCK
      ?auto_10894 - BLOCK
    )
    :vars
    (
      ?auto_10895 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10893 ) ( ON-TABLE ?auto_10893 ) ( not ( = ?auto_10893 ?auto_10894 ) ) ( ON ?auto_10894 ?auto_10895 ) ( CLEAR ?auto_10894 ) ( HAND-EMPTY ) ( not ( = ?auto_10893 ?auto_10895 ) ) ( not ( = ?auto_10894 ?auto_10895 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10894 ?auto_10895 )
      ( MAKE-2PILE ?auto_10893 ?auto_10894 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10896 - BLOCK
      ?auto_10897 - BLOCK
    )
    :vars
    (
      ?auto_10898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10896 ?auto_10897 ) ) ( ON ?auto_10897 ?auto_10898 ) ( CLEAR ?auto_10897 ) ( not ( = ?auto_10896 ?auto_10898 ) ) ( not ( = ?auto_10897 ?auto_10898 ) ) ( HOLDING ?auto_10896 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10896 )
      ( MAKE-2PILE ?auto_10896 ?auto_10897 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10899 - BLOCK
      ?auto_10900 - BLOCK
    )
    :vars
    (
      ?auto_10901 - BLOCK
      ?auto_10902 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10899 ?auto_10900 ) ) ( ON ?auto_10900 ?auto_10901 ) ( not ( = ?auto_10899 ?auto_10901 ) ) ( not ( = ?auto_10900 ?auto_10901 ) ) ( ON ?auto_10899 ?auto_10900 ) ( CLEAR ?auto_10899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10902 ) ( ON ?auto_10901 ?auto_10902 ) ( not ( = ?auto_10902 ?auto_10901 ) ) ( not ( = ?auto_10902 ?auto_10900 ) ) ( not ( = ?auto_10902 ?auto_10899 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10902 ?auto_10901 ?auto_10900 )
      ( MAKE-2PILE ?auto_10899 ?auto_10900 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10903 - BLOCK
      ?auto_10904 - BLOCK
    )
    :vars
    (
      ?auto_10905 - BLOCK
      ?auto_10906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10903 ?auto_10904 ) ) ( ON ?auto_10904 ?auto_10905 ) ( not ( = ?auto_10903 ?auto_10905 ) ) ( not ( = ?auto_10904 ?auto_10905 ) ) ( ON-TABLE ?auto_10906 ) ( ON ?auto_10905 ?auto_10906 ) ( not ( = ?auto_10906 ?auto_10905 ) ) ( not ( = ?auto_10906 ?auto_10904 ) ) ( not ( = ?auto_10906 ?auto_10903 ) ) ( HOLDING ?auto_10903 ) ( CLEAR ?auto_10904 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10906 ?auto_10905 ?auto_10904 ?auto_10903 )
      ( MAKE-2PILE ?auto_10903 ?auto_10904 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10907 - BLOCK
      ?auto_10908 - BLOCK
    )
    :vars
    (
      ?auto_10909 - BLOCK
      ?auto_10910 - BLOCK
      ?auto_10911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10907 ?auto_10908 ) ) ( ON ?auto_10908 ?auto_10909 ) ( not ( = ?auto_10907 ?auto_10909 ) ) ( not ( = ?auto_10908 ?auto_10909 ) ) ( ON-TABLE ?auto_10910 ) ( ON ?auto_10909 ?auto_10910 ) ( not ( = ?auto_10910 ?auto_10909 ) ) ( not ( = ?auto_10910 ?auto_10908 ) ) ( not ( = ?auto_10910 ?auto_10907 ) ) ( CLEAR ?auto_10908 ) ( ON ?auto_10907 ?auto_10911 ) ( CLEAR ?auto_10907 ) ( HAND-EMPTY ) ( not ( = ?auto_10907 ?auto_10911 ) ) ( not ( = ?auto_10908 ?auto_10911 ) ) ( not ( = ?auto_10909 ?auto_10911 ) ) ( not ( = ?auto_10910 ?auto_10911 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10907 ?auto_10911 )
      ( MAKE-2PILE ?auto_10907 ?auto_10908 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10912 - BLOCK
      ?auto_10913 - BLOCK
    )
    :vars
    (
      ?auto_10915 - BLOCK
      ?auto_10916 - BLOCK
      ?auto_10914 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10912 ?auto_10913 ) ) ( not ( = ?auto_10912 ?auto_10915 ) ) ( not ( = ?auto_10913 ?auto_10915 ) ) ( ON-TABLE ?auto_10916 ) ( ON ?auto_10915 ?auto_10916 ) ( not ( = ?auto_10916 ?auto_10915 ) ) ( not ( = ?auto_10916 ?auto_10913 ) ) ( not ( = ?auto_10916 ?auto_10912 ) ) ( ON ?auto_10912 ?auto_10914 ) ( CLEAR ?auto_10912 ) ( not ( = ?auto_10912 ?auto_10914 ) ) ( not ( = ?auto_10913 ?auto_10914 ) ) ( not ( = ?auto_10915 ?auto_10914 ) ) ( not ( = ?auto_10916 ?auto_10914 ) ) ( HOLDING ?auto_10913 ) ( CLEAR ?auto_10915 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10916 ?auto_10915 ?auto_10913 )
      ( MAKE-2PILE ?auto_10912 ?auto_10913 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10917 - BLOCK
      ?auto_10918 - BLOCK
    )
    :vars
    (
      ?auto_10921 - BLOCK
      ?auto_10919 - BLOCK
      ?auto_10920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10917 ?auto_10918 ) ) ( not ( = ?auto_10917 ?auto_10921 ) ) ( not ( = ?auto_10918 ?auto_10921 ) ) ( ON-TABLE ?auto_10919 ) ( ON ?auto_10921 ?auto_10919 ) ( not ( = ?auto_10919 ?auto_10921 ) ) ( not ( = ?auto_10919 ?auto_10918 ) ) ( not ( = ?auto_10919 ?auto_10917 ) ) ( ON ?auto_10917 ?auto_10920 ) ( not ( = ?auto_10917 ?auto_10920 ) ) ( not ( = ?auto_10918 ?auto_10920 ) ) ( not ( = ?auto_10921 ?auto_10920 ) ) ( not ( = ?auto_10919 ?auto_10920 ) ) ( CLEAR ?auto_10921 ) ( ON ?auto_10918 ?auto_10917 ) ( CLEAR ?auto_10918 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10920 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10920 ?auto_10917 )
      ( MAKE-2PILE ?auto_10917 ?auto_10918 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10922 - BLOCK
      ?auto_10923 - BLOCK
    )
    :vars
    (
      ?auto_10925 - BLOCK
      ?auto_10924 - BLOCK
      ?auto_10926 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10922 ?auto_10923 ) ) ( not ( = ?auto_10922 ?auto_10925 ) ) ( not ( = ?auto_10923 ?auto_10925 ) ) ( ON-TABLE ?auto_10924 ) ( not ( = ?auto_10924 ?auto_10925 ) ) ( not ( = ?auto_10924 ?auto_10923 ) ) ( not ( = ?auto_10924 ?auto_10922 ) ) ( ON ?auto_10922 ?auto_10926 ) ( not ( = ?auto_10922 ?auto_10926 ) ) ( not ( = ?auto_10923 ?auto_10926 ) ) ( not ( = ?auto_10925 ?auto_10926 ) ) ( not ( = ?auto_10924 ?auto_10926 ) ) ( ON ?auto_10923 ?auto_10922 ) ( CLEAR ?auto_10923 ) ( ON-TABLE ?auto_10926 ) ( HOLDING ?auto_10925 ) ( CLEAR ?auto_10924 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10924 ?auto_10925 )
      ( MAKE-2PILE ?auto_10922 ?auto_10923 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10927 - BLOCK
      ?auto_10928 - BLOCK
    )
    :vars
    (
      ?auto_10930 - BLOCK
      ?auto_10929 - BLOCK
      ?auto_10931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10927 ?auto_10928 ) ) ( not ( = ?auto_10927 ?auto_10930 ) ) ( not ( = ?auto_10928 ?auto_10930 ) ) ( ON-TABLE ?auto_10929 ) ( not ( = ?auto_10929 ?auto_10930 ) ) ( not ( = ?auto_10929 ?auto_10928 ) ) ( not ( = ?auto_10929 ?auto_10927 ) ) ( ON ?auto_10927 ?auto_10931 ) ( not ( = ?auto_10927 ?auto_10931 ) ) ( not ( = ?auto_10928 ?auto_10931 ) ) ( not ( = ?auto_10930 ?auto_10931 ) ) ( not ( = ?auto_10929 ?auto_10931 ) ) ( ON ?auto_10928 ?auto_10927 ) ( ON-TABLE ?auto_10931 ) ( CLEAR ?auto_10929 ) ( ON ?auto_10930 ?auto_10928 ) ( CLEAR ?auto_10930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10931 ?auto_10927 ?auto_10928 )
      ( MAKE-2PILE ?auto_10927 ?auto_10928 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10932 - BLOCK
      ?auto_10933 - BLOCK
    )
    :vars
    (
      ?auto_10934 - BLOCK
      ?auto_10936 - BLOCK
      ?auto_10935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10932 ?auto_10933 ) ) ( not ( = ?auto_10932 ?auto_10934 ) ) ( not ( = ?auto_10933 ?auto_10934 ) ) ( not ( = ?auto_10936 ?auto_10934 ) ) ( not ( = ?auto_10936 ?auto_10933 ) ) ( not ( = ?auto_10936 ?auto_10932 ) ) ( ON ?auto_10932 ?auto_10935 ) ( not ( = ?auto_10932 ?auto_10935 ) ) ( not ( = ?auto_10933 ?auto_10935 ) ) ( not ( = ?auto_10934 ?auto_10935 ) ) ( not ( = ?auto_10936 ?auto_10935 ) ) ( ON ?auto_10933 ?auto_10932 ) ( ON-TABLE ?auto_10935 ) ( ON ?auto_10934 ?auto_10933 ) ( CLEAR ?auto_10934 ) ( HOLDING ?auto_10936 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10936 )
      ( MAKE-2PILE ?auto_10932 ?auto_10933 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10937 - BLOCK
      ?auto_10938 - BLOCK
    )
    :vars
    (
      ?auto_10940 - BLOCK
      ?auto_10941 - BLOCK
      ?auto_10939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10937 ?auto_10938 ) ) ( not ( = ?auto_10937 ?auto_10940 ) ) ( not ( = ?auto_10938 ?auto_10940 ) ) ( not ( = ?auto_10941 ?auto_10940 ) ) ( not ( = ?auto_10941 ?auto_10938 ) ) ( not ( = ?auto_10941 ?auto_10937 ) ) ( ON ?auto_10937 ?auto_10939 ) ( not ( = ?auto_10937 ?auto_10939 ) ) ( not ( = ?auto_10938 ?auto_10939 ) ) ( not ( = ?auto_10940 ?auto_10939 ) ) ( not ( = ?auto_10941 ?auto_10939 ) ) ( ON ?auto_10938 ?auto_10937 ) ( ON-TABLE ?auto_10939 ) ( ON ?auto_10940 ?auto_10938 ) ( ON ?auto_10941 ?auto_10940 ) ( CLEAR ?auto_10941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10939 ?auto_10937 ?auto_10938 ?auto_10940 )
      ( MAKE-2PILE ?auto_10937 ?auto_10938 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10943 - BLOCK
    )
    :vars
    (
      ?auto_10944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10944 ?auto_10943 ) ( CLEAR ?auto_10944 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10943 ) ( not ( = ?auto_10943 ?auto_10944 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10944 ?auto_10943 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10945 - BLOCK
    )
    :vars
    (
      ?auto_10946 - BLOCK
      ?auto_10947 - BLOCK
      ?auto_10948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10946 ?auto_10945 ) ( CLEAR ?auto_10946 ) ( ON-TABLE ?auto_10945 ) ( not ( = ?auto_10945 ?auto_10946 ) ) ( HOLDING ?auto_10947 ) ( CLEAR ?auto_10948 ) ( not ( = ?auto_10945 ?auto_10947 ) ) ( not ( = ?auto_10945 ?auto_10948 ) ) ( not ( = ?auto_10946 ?auto_10947 ) ) ( not ( = ?auto_10946 ?auto_10948 ) ) ( not ( = ?auto_10947 ?auto_10948 ) ) )
    :subtasks
    ( ( !STACK ?auto_10947 ?auto_10948 )
      ( MAKE-1PILE ?auto_10945 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10949 - BLOCK
    )
    :vars
    (
      ?auto_10951 - BLOCK
      ?auto_10950 - BLOCK
      ?auto_10952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10951 ?auto_10949 ) ( ON-TABLE ?auto_10949 ) ( not ( = ?auto_10949 ?auto_10951 ) ) ( CLEAR ?auto_10950 ) ( not ( = ?auto_10949 ?auto_10952 ) ) ( not ( = ?auto_10949 ?auto_10950 ) ) ( not ( = ?auto_10951 ?auto_10952 ) ) ( not ( = ?auto_10951 ?auto_10950 ) ) ( not ( = ?auto_10952 ?auto_10950 ) ) ( ON ?auto_10952 ?auto_10951 ) ( CLEAR ?auto_10952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10949 ?auto_10951 )
      ( MAKE-1PILE ?auto_10949 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10953 - BLOCK
    )
    :vars
    (
      ?auto_10954 - BLOCK
      ?auto_10955 - BLOCK
      ?auto_10956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10954 ?auto_10953 ) ( ON-TABLE ?auto_10953 ) ( not ( = ?auto_10953 ?auto_10954 ) ) ( not ( = ?auto_10953 ?auto_10955 ) ) ( not ( = ?auto_10953 ?auto_10956 ) ) ( not ( = ?auto_10954 ?auto_10955 ) ) ( not ( = ?auto_10954 ?auto_10956 ) ) ( not ( = ?auto_10955 ?auto_10956 ) ) ( ON ?auto_10955 ?auto_10954 ) ( CLEAR ?auto_10955 ) ( HOLDING ?auto_10956 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10956 )
      ( MAKE-1PILE ?auto_10953 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10957 - BLOCK
    )
    :vars
    (
      ?auto_10960 - BLOCK
      ?auto_10958 - BLOCK
      ?auto_10959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10960 ?auto_10957 ) ( ON-TABLE ?auto_10957 ) ( not ( = ?auto_10957 ?auto_10960 ) ) ( not ( = ?auto_10957 ?auto_10958 ) ) ( not ( = ?auto_10957 ?auto_10959 ) ) ( not ( = ?auto_10960 ?auto_10958 ) ) ( not ( = ?auto_10960 ?auto_10959 ) ) ( not ( = ?auto_10958 ?auto_10959 ) ) ( ON ?auto_10958 ?auto_10960 ) ( ON ?auto_10959 ?auto_10958 ) ( CLEAR ?auto_10959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10957 ?auto_10960 ?auto_10958 )
      ( MAKE-1PILE ?auto_10957 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10961 - BLOCK
    )
    :vars
    (
      ?auto_10964 - BLOCK
      ?auto_10963 - BLOCK
      ?auto_10962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10964 ?auto_10961 ) ( ON-TABLE ?auto_10961 ) ( not ( = ?auto_10961 ?auto_10964 ) ) ( not ( = ?auto_10961 ?auto_10963 ) ) ( not ( = ?auto_10961 ?auto_10962 ) ) ( not ( = ?auto_10964 ?auto_10963 ) ) ( not ( = ?auto_10964 ?auto_10962 ) ) ( not ( = ?auto_10963 ?auto_10962 ) ) ( ON ?auto_10963 ?auto_10964 ) ( HOLDING ?auto_10962 ) ( CLEAR ?auto_10963 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10961 ?auto_10964 ?auto_10963 ?auto_10962 )
      ( MAKE-1PILE ?auto_10961 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10965 - BLOCK
    )
    :vars
    (
      ?auto_10966 - BLOCK
      ?auto_10967 - BLOCK
      ?auto_10968 - BLOCK
      ?auto_10969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10966 ?auto_10965 ) ( ON-TABLE ?auto_10965 ) ( not ( = ?auto_10965 ?auto_10966 ) ) ( not ( = ?auto_10965 ?auto_10967 ) ) ( not ( = ?auto_10965 ?auto_10968 ) ) ( not ( = ?auto_10966 ?auto_10967 ) ) ( not ( = ?auto_10966 ?auto_10968 ) ) ( not ( = ?auto_10967 ?auto_10968 ) ) ( ON ?auto_10967 ?auto_10966 ) ( CLEAR ?auto_10967 ) ( ON ?auto_10968 ?auto_10969 ) ( CLEAR ?auto_10968 ) ( HAND-EMPTY ) ( not ( = ?auto_10965 ?auto_10969 ) ) ( not ( = ?auto_10966 ?auto_10969 ) ) ( not ( = ?auto_10967 ?auto_10969 ) ) ( not ( = ?auto_10968 ?auto_10969 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10968 ?auto_10969 )
      ( MAKE-1PILE ?auto_10965 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10970 - BLOCK
    )
    :vars
    (
      ?auto_10972 - BLOCK
      ?auto_10973 - BLOCK
      ?auto_10974 - BLOCK
      ?auto_10971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10972 ?auto_10970 ) ( ON-TABLE ?auto_10970 ) ( not ( = ?auto_10970 ?auto_10972 ) ) ( not ( = ?auto_10970 ?auto_10973 ) ) ( not ( = ?auto_10970 ?auto_10974 ) ) ( not ( = ?auto_10972 ?auto_10973 ) ) ( not ( = ?auto_10972 ?auto_10974 ) ) ( not ( = ?auto_10973 ?auto_10974 ) ) ( ON ?auto_10974 ?auto_10971 ) ( CLEAR ?auto_10974 ) ( not ( = ?auto_10970 ?auto_10971 ) ) ( not ( = ?auto_10972 ?auto_10971 ) ) ( not ( = ?auto_10973 ?auto_10971 ) ) ( not ( = ?auto_10974 ?auto_10971 ) ) ( HOLDING ?auto_10973 ) ( CLEAR ?auto_10972 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10970 ?auto_10972 ?auto_10973 )
      ( MAKE-1PILE ?auto_10970 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10975 - BLOCK
    )
    :vars
    (
      ?auto_10979 - BLOCK
      ?auto_10976 - BLOCK
      ?auto_10978 - BLOCK
      ?auto_10977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10979 ?auto_10975 ) ( ON-TABLE ?auto_10975 ) ( not ( = ?auto_10975 ?auto_10979 ) ) ( not ( = ?auto_10975 ?auto_10976 ) ) ( not ( = ?auto_10975 ?auto_10978 ) ) ( not ( = ?auto_10979 ?auto_10976 ) ) ( not ( = ?auto_10979 ?auto_10978 ) ) ( not ( = ?auto_10976 ?auto_10978 ) ) ( ON ?auto_10978 ?auto_10977 ) ( not ( = ?auto_10975 ?auto_10977 ) ) ( not ( = ?auto_10979 ?auto_10977 ) ) ( not ( = ?auto_10976 ?auto_10977 ) ) ( not ( = ?auto_10978 ?auto_10977 ) ) ( CLEAR ?auto_10979 ) ( ON ?auto_10976 ?auto_10978 ) ( CLEAR ?auto_10976 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10977 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10977 ?auto_10978 )
      ( MAKE-1PILE ?auto_10975 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10990 - BLOCK
    )
    :vars
    (
      ?auto_10993 - BLOCK
      ?auto_10991 - BLOCK
      ?auto_10994 - BLOCK
      ?auto_10992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10990 ?auto_10993 ) ) ( not ( = ?auto_10990 ?auto_10991 ) ) ( not ( = ?auto_10990 ?auto_10994 ) ) ( not ( = ?auto_10993 ?auto_10991 ) ) ( not ( = ?auto_10993 ?auto_10994 ) ) ( not ( = ?auto_10991 ?auto_10994 ) ) ( ON ?auto_10994 ?auto_10992 ) ( not ( = ?auto_10990 ?auto_10992 ) ) ( not ( = ?auto_10993 ?auto_10992 ) ) ( not ( = ?auto_10991 ?auto_10992 ) ) ( not ( = ?auto_10994 ?auto_10992 ) ) ( ON ?auto_10991 ?auto_10994 ) ( ON-TABLE ?auto_10992 ) ( ON ?auto_10993 ?auto_10991 ) ( CLEAR ?auto_10993 ) ( HOLDING ?auto_10990 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10990 ?auto_10993 )
      ( MAKE-1PILE ?auto_10990 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10995 - BLOCK
    )
    :vars
    (
      ?auto_10997 - BLOCK
      ?auto_10999 - BLOCK
      ?auto_10998 - BLOCK
      ?auto_10996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10995 ?auto_10997 ) ) ( not ( = ?auto_10995 ?auto_10999 ) ) ( not ( = ?auto_10995 ?auto_10998 ) ) ( not ( = ?auto_10997 ?auto_10999 ) ) ( not ( = ?auto_10997 ?auto_10998 ) ) ( not ( = ?auto_10999 ?auto_10998 ) ) ( ON ?auto_10998 ?auto_10996 ) ( not ( = ?auto_10995 ?auto_10996 ) ) ( not ( = ?auto_10997 ?auto_10996 ) ) ( not ( = ?auto_10999 ?auto_10996 ) ) ( not ( = ?auto_10998 ?auto_10996 ) ) ( ON ?auto_10999 ?auto_10998 ) ( ON-TABLE ?auto_10996 ) ( ON ?auto_10997 ?auto_10999 ) ( ON ?auto_10995 ?auto_10997 ) ( CLEAR ?auto_10995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10996 ?auto_10998 ?auto_10999 ?auto_10997 )
      ( MAKE-1PILE ?auto_10995 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11003 - BLOCK
      ?auto_11004 - BLOCK
      ?auto_11005 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11005 ) ( CLEAR ?auto_11004 ) ( ON-TABLE ?auto_11003 ) ( ON ?auto_11004 ?auto_11003 ) ( not ( = ?auto_11003 ?auto_11004 ) ) ( not ( = ?auto_11003 ?auto_11005 ) ) ( not ( = ?auto_11004 ?auto_11005 ) ) )
    :subtasks
    ( ( !STACK ?auto_11005 ?auto_11004 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11006 - BLOCK
      ?auto_11007 - BLOCK
      ?auto_11008 - BLOCK
    )
    :vars
    (
      ?auto_11009 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11007 ) ( ON-TABLE ?auto_11006 ) ( ON ?auto_11007 ?auto_11006 ) ( not ( = ?auto_11006 ?auto_11007 ) ) ( not ( = ?auto_11006 ?auto_11008 ) ) ( not ( = ?auto_11007 ?auto_11008 ) ) ( ON ?auto_11008 ?auto_11009 ) ( CLEAR ?auto_11008 ) ( HAND-EMPTY ) ( not ( = ?auto_11006 ?auto_11009 ) ) ( not ( = ?auto_11007 ?auto_11009 ) ) ( not ( = ?auto_11008 ?auto_11009 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11008 ?auto_11009 )
      ( MAKE-3PILE ?auto_11006 ?auto_11007 ?auto_11008 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11010 - BLOCK
      ?auto_11011 - BLOCK
      ?auto_11012 - BLOCK
    )
    :vars
    (
      ?auto_11013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11010 ) ( not ( = ?auto_11010 ?auto_11011 ) ) ( not ( = ?auto_11010 ?auto_11012 ) ) ( not ( = ?auto_11011 ?auto_11012 ) ) ( ON ?auto_11012 ?auto_11013 ) ( CLEAR ?auto_11012 ) ( not ( = ?auto_11010 ?auto_11013 ) ) ( not ( = ?auto_11011 ?auto_11013 ) ) ( not ( = ?auto_11012 ?auto_11013 ) ) ( HOLDING ?auto_11011 ) ( CLEAR ?auto_11010 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11010 ?auto_11011 )
      ( MAKE-3PILE ?auto_11010 ?auto_11011 ?auto_11012 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11014 - BLOCK
      ?auto_11015 - BLOCK
      ?auto_11016 - BLOCK
    )
    :vars
    (
      ?auto_11017 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11014 ) ( not ( = ?auto_11014 ?auto_11015 ) ) ( not ( = ?auto_11014 ?auto_11016 ) ) ( not ( = ?auto_11015 ?auto_11016 ) ) ( ON ?auto_11016 ?auto_11017 ) ( not ( = ?auto_11014 ?auto_11017 ) ) ( not ( = ?auto_11015 ?auto_11017 ) ) ( not ( = ?auto_11016 ?auto_11017 ) ) ( CLEAR ?auto_11014 ) ( ON ?auto_11015 ?auto_11016 ) ( CLEAR ?auto_11015 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11017 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11017 ?auto_11016 )
      ( MAKE-3PILE ?auto_11014 ?auto_11015 ?auto_11016 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11018 - BLOCK
      ?auto_11019 - BLOCK
      ?auto_11020 - BLOCK
    )
    :vars
    (
      ?auto_11021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11018 ?auto_11019 ) ) ( not ( = ?auto_11018 ?auto_11020 ) ) ( not ( = ?auto_11019 ?auto_11020 ) ) ( ON ?auto_11020 ?auto_11021 ) ( not ( = ?auto_11018 ?auto_11021 ) ) ( not ( = ?auto_11019 ?auto_11021 ) ) ( not ( = ?auto_11020 ?auto_11021 ) ) ( ON ?auto_11019 ?auto_11020 ) ( CLEAR ?auto_11019 ) ( ON-TABLE ?auto_11021 ) ( HOLDING ?auto_11018 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11018 )
      ( MAKE-3PILE ?auto_11018 ?auto_11019 ?auto_11020 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11022 - BLOCK
      ?auto_11023 - BLOCK
      ?auto_11024 - BLOCK
    )
    :vars
    (
      ?auto_11025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11022 ?auto_11023 ) ) ( not ( = ?auto_11022 ?auto_11024 ) ) ( not ( = ?auto_11023 ?auto_11024 ) ) ( ON ?auto_11024 ?auto_11025 ) ( not ( = ?auto_11022 ?auto_11025 ) ) ( not ( = ?auto_11023 ?auto_11025 ) ) ( not ( = ?auto_11024 ?auto_11025 ) ) ( ON ?auto_11023 ?auto_11024 ) ( ON-TABLE ?auto_11025 ) ( ON ?auto_11022 ?auto_11023 ) ( CLEAR ?auto_11022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11025 ?auto_11024 ?auto_11023 )
      ( MAKE-3PILE ?auto_11022 ?auto_11023 ?auto_11024 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11026 - BLOCK
      ?auto_11027 - BLOCK
      ?auto_11028 - BLOCK
    )
    :vars
    (
      ?auto_11029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11026 ?auto_11027 ) ) ( not ( = ?auto_11026 ?auto_11028 ) ) ( not ( = ?auto_11027 ?auto_11028 ) ) ( ON ?auto_11028 ?auto_11029 ) ( not ( = ?auto_11026 ?auto_11029 ) ) ( not ( = ?auto_11027 ?auto_11029 ) ) ( not ( = ?auto_11028 ?auto_11029 ) ) ( ON ?auto_11027 ?auto_11028 ) ( ON-TABLE ?auto_11029 ) ( HOLDING ?auto_11026 ) ( CLEAR ?auto_11027 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11029 ?auto_11028 ?auto_11027 ?auto_11026 )
      ( MAKE-3PILE ?auto_11026 ?auto_11027 ?auto_11028 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11030 - BLOCK
      ?auto_11031 - BLOCK
      ?auto_11032 - BLOCK
    )
    :vars
    (
      ?auto_11033 - BLOCK
      ?auto_11034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11030 ?auto_11031 ) ) ( not ( = ?auto_11030 ?auto_11032 ) ) ( not ( = ?auto_11031 ?auto_11032 ) ) ( ON ?auto_11032 ?auto_11033 ) ( not ( = ?auto_11030 ?auto_11033 ) ) ( not ( = ?auto_11031 ?auto_11033 ) ) ( not ( = ?auto_11032 ?auto_11033 ) ) ( ON ?auto_11031 ?auto_11032 ) ( ON-TABLE ?auto_11033 ) ( CLEAR ?auto_11031 ) ( ON ?auto_11030 ?auto_11034 ) ( CLEAR ?auto_11030 ) ( HAND-EMPTY ) ( not ( = ?auto_11030 ?auto_11034 ) ) ( not ( = ?auto_11031 ?auto_11034 ) ) ( not ( = ?auto_11032 ?auto_11034 ) ) ( not ( = ?auto_11033 ?auto_11034 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11030 ?auto_11034 )
      ( MAKE-3PILE ?auto_11030 ?auto_11031 ?auto_11032 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11035 - BLOCK
      ?auto_11036 - BLOCK
      ?auto_11037 - BLOCK
    )
    :vars
    (
      ?auto_11039 - BLOCK
      ?auto_11038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11035 ?auto_11036 ) ) ( not ( = ?auto_11035 ?auto_11037 ) ) ( not ( = ?auto_11036 ?auto_11037 ) ) ( ON ?auto_11037 ?auto_11039 ) ( not ( = ?auto_11035 ?auto_11039 ) ) ( not ( = ?auto_11036 ?auto_11039 ) ) ( not ( = ?auto_11037 ?auto_11039 ) ) ( ON-TABLE ?auto_11039 ) ( ON ?auto_11035 ?auto_11038 ) ( CLEAR ?auto_11035 ) ( not ( = ?auto_11035 ?auto_11038 ) ) ( not ( = ?auto_11036 ?auto_11038 ) ) ( not ( = ?auto_11037 ?auto_11038 ) ) ( not ( = ?auto_11039 ?auto_11038 ) ) ( HOLDING ?auto_11036 ) ( CLEAR ?auto_11037 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11039 ?auto_11037 ?auto_11036 )
      ( MAKE-3PILE ?auto_11035 ?auto_11036 ?auto_11037 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11040 - BLOCK
      ?auto_11041 - BLOCK
      ?auto_11042 - BLOCK
    )
    :vars
    (
      ?auto_11043 - BLOCK
      ?auto_11044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11040 ?auto_11041 ) ) ( not ( = ?auto_11040 ?auto_11042 ) ) ( not ( = ?auto_11041 ?auto_11042 ) ) ( ON ?auto_11042 ?auto_11043 ) ( not ( = ?auto_11040 ?auto_11043 ) ) ( not ( = ?auto_11041 ?auto_11043 ) ) ( not ( = ?auto_11042 ?auto_11043 ) ) ( ON-TABLE ?auto_11043 ) ( ON ?auto_11040 ?auto_11044 ) ( not ( = ?auto_11040 ?auto_11044 ) ) ( not ( = ?auto_11041 ?auto_11044 ) ) ( not ( = ?auto_11042 ?auto_11044 ) ) ( not ( = ?auto_11043 ?auto_11044 ) ) ( CLEAR ?auto_11042 ) ( ON ?auto_11041 ?auto_11040 ) ( CLEAR ?auto_11041 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11044 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11044 ?auto_11040 )
      ( MAKE-3PILE ?auto_11040 ?auto_11041 ?auto_11042 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11045 - BLOCK
      ?auto_11046 - BLOCK
      ?auto_11047 - BLOCK
    )
    :vars
    (
      ?auto_11048 - BLOCK
      ?auto_11049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11045 ?auto_11046 ) ) ( not ( = ?auto_11045 ?auto_11047 ) ) ( not ( = ?auto_11046 ?auto_11047 ) ) ( not ( = ?auto_11045 ?auto_11048 ) ) ( not ( = ?auto_11046 ?auto_11048 ) ) ( not ( = ?auto_11047 ?auto_11048 ) ) ( ON-TABLE ?auto_11048 ) ( ON ?auto_11045 ?auto_11049 ) ( not ( = ?auto_11045 ?auto_11049 ) ) ( not ( = ?auto_11046 ?auto_11049 ) ) ( not ( = ?auto_11047 ?auto_11049 ) ) ( not ( = ?auto_11048 ?auto_11049 ) ) ( ON ?auto_11046 ?auto_11045 ) ( CLEAR ?auto_11046 ) ( ON-TABLE ?auto_11049 ) ( HOLDING ?auto_11047 ) ( CLEAR ?auto_11048 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11048 ?auto_11047 )
      ( MAKE-3PILE ?auto_11045 ?auto_11046 ?auto_11047 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11050 - BLOCK
      ?auto_11051 - BLOCK
      ?auto_11052 - BLOCK
    )
    :vars
    (
      ?auto_11054 - BLOCK
      ?auto_11053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11050 ?auto_11051 ) ) ( not ( = ?auto_11050 ?auto_11052 ) ) ( not ( = ?auto_11051 ?auto_11052 ) ) ( not ( = ?auto_11050 ?auto_11054 ) ) ( not ( = ?auto_11051 ?auto_11054 ) ) ( not ( = ?auto_11052 ?auto_11054 ) ) ( ON-TABLE ?auto_11054 ) ( ON ?auto_11050 ?auto_11053 ) ( not ( = ?auto_11050 ?auto_11053 ) ) ( not ( = ?auto_11051 ?auto_11053 ) ) ( not ( = ?auto_11052 ?auto_11053 ) ) ( not ( = ?auto_11054 ?auto_11053 ) ) ( ON ?auto_11051 ?auto_11050 ) ( ON-TABLE ?auto_11053 ) ( CLEAR ?auto_11054 ) ( ON ?auto_11052 ?auto_11051 ) ( CLEAR ?auto_11052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11053 ?auto_11050 ?auto_11051 )
      ( MAKE-3PILE ?auto_11050 ?auto_11051 ?auto_11052 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11055 - BLOCK
      ?auto_11056 - BLOCK
      ?auto_11057 - BLOCK
    )
    :vars
    (
      ?auto_11058 - BLOCK
      ?auto_11059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11055 ?auto_11056 ) ) ( not ( = ?auto_11055 ?auto_11057 ) ) ( not ( = ?auto_11056 ?auto_11057 ) ) ( not ( = ?auto_11055 ?auto_11058 ) ) ( not ( = ?auto_11056 ?auto_11058 ) ) ( not ( = ?auto_11057 ?auto_11058 ) ) ( ON ?auto_11055 ?auto_11059 ) ( not ( = ?auto_11055 ?auto_11059 ) ) ( not ( = ?auto_11056 ?auto_11059 ) ) ( not ( = ?auto_11057 ?auto_11059 ) ) ( not ( = ?auto_11058 ?auto_11059 ) ) ( ON ?auto_11056 ?auto_11055 ) ( ON-TABLE ?auto_11059 ) ( ON ?auto_11057 ?auto_11056 ) ( CLEAR ?auto_11057 ) ( HOLDING ?auto_11058 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11058 )
      ( MAKE-3PILE ?auto_11055 ?auto_11056 ?auto_11057 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11060 - BLOCK
      ?auto_11061 - BLOCK
      ?auto_11062 - BLOCK
    )
    :vars
    (
      ?auto_11063 - BLOCK
      ?auto_11064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11060 ?auto_11061 ) ) ( not ( = ?auto_11060 ?auto_11062 ) ) ( not ( = ?auto_11061 ?auto_11062 ) ) ( not ( = ?auto_11060 ?auto_11063 ) ) ( not ( = ?auto_11061 ?auto_11063 ) ) ( not ( = ?auto_11062 ?auto_11063 ) ) ( ON ?auto_11060 ?auto_11064 ) ( not ( = ?auto_11060 ?auto_11064 ) ) ( not ( = ?auto_11061 ?auto_11064 ) ) ( not ( = ?auto_11062 ?auto_11064 ) ) ( not ( = ?auto_11063 ?auto_11064 ) ) ( ON ?auto_11061 ?auto_11060 ) ( ON-TABLE ?auto_11064 ) ( ON ?auto_11062 ?auto_11061 ) ( ON ?auto_11063 ?auto_11062 ) ( CLEAR ?auto_11063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11064 ?auto_11060 ?auto_11061 ?auto_11062 )
      ( MAKE-3PILE ?auto_11060 ?auto_11061 ?auto_11062 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11069 - BLOCK
      ?auto_11070 - BLOCK
      ?auto_11071 - BLOCK
      ?auto_11072 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11072 ) ( CLEAR ?auto_11071 ) ( ON-TABLE ?auto_11069 ) ( ON ?auto_11070 ?auto_11069 ) ( ON ?auto_11071 ?auto_11070 ) ( not ( = ?auto_11069 ?auto_11070 ) ) ( not ( = ?auto_11069 ?auto_11071 ) ) ( not ( = ?auto_11069 ?auto_11072 ) ) ( not ( = ?auto_11070 ?auto_11071 ) ) ( not ( = ?auto_11070 ?auto_11072 ) ) ( not ( = ?auto_11071 ?auto_11072 ) ) )
    :subtasks
    ( ( !STACK ?auto_11072 ?auto_11071 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11073 - BLOCK
      ?auto_11074 - BLOCK
      ?auto_11075 - BLOCK
      ?auto_11076 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11075 ) ( ON-TABLE ?auto_11073 ) ( ON ?auto_11074 ?auto_11073 ) ( ON ?auto_11075 ?auto_11074 ) ( not ( = ?auto_11073 ?auto_11074 ) ) ( not ( = ?auto_11073 ?auto_11075 ) ) ( not ( = ?auto_11073 ?auto_11076 ) ) ( not ( = ?auto_11074 ?auto_11075 ) ) ( not ( = ?auto_11074 ?auto_11076 ) ) ( not ( = ?auto_11075 ?auto_11076 ) ) ( ON-TABLE ?auto_11076 ) ( CLEAR ?auto_11076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_11076 )
      ( MAKE-4PILE ?auto_11073 ?auto_11074 ?auto_11075 ?auto_11076 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11077 - BLOCK
      ?auto_11078 - BLOCK
      ?auto_11079 - BLOCK
      ?auto_11080 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11077 ) ( ON ?auto_11078 ?auto_11077 ) ( not ( = ?auto_11077 ?auto_11078 ) ) ( not ( = ?auto_11077 ?auto_11079 ) ) ( not ( = ?auto_11077 ?auto_11080 ) ) ( not ( = ?auto_11078 ?auto_11079 ) ) ( not ( = ?auto_11078 ?auto_11080 ) ) ( not ( = ?auto_11079 ?auto_11080 ) ) ( ON-TABLE ?auto_11080 ) ( CLEAR ?auto_11080 ) ( HOLDING ?auto_11079 ) ( CLEAR ?auto_11078 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11077 ?auto_11078 ?auto_11079 )
      ( MAKE-4PILE ?auto_11077 ?auto_11078 ?auto_11079 ?auto_11080 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11081 - BLOCK
      ?auto_11082 - BLOCK
      ?auto_11083 - BLOCK
      ?auto_11084 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11081 ) ( ON ?auto_11082 ?auto_11081 ) ( not ( = ?auto_11081 ?auto_11082 ) ) ( not ( = ?auto_11081 ?auto_11083 ) ) ( not ( = ?auto_11081 ?auto_11084 ) ) ( not ( = ?auto_11082 ?auto_11083 ) ) ( not ( = ?auto_11082 ?auto_11084 ) ) ( not ( = ?auto_11083 ?auto_11084 ) ) ( ON-TABLE ?auto_11084 ) ( CLEAR ?auto_11082 ) ( ON ?auto_11083 ?auto_11084 ) ( CLEAR ?auto_11083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11084 )
      ( MAKE-4PILE ?auto_11081 ?auto_11082 ?auto_11083 ?auto_11084 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11085 - BLOCK
      ?auto_11086 - BLOCK
      ?auto_11087 - BLOCK
      ?auto_11088 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11085 ) ( not ( = ?auto_11085 ?auto_11086 ) ) ( not ( = ?auto_11085 ?auto_11087 ) ) ( not ( = ?auto_11085 ?auto_11088 ) ) ( not ( = ?auto_11086 ?auto_11087 ) ) ( not ( = ?auto_11086 ?auto_11088 ) ) ( not ( = ?auto_11087 ?auto_11088 ) ) ( ON-TABLE ?auto_11088 ) ( ON ?auto_11087 ?auto_11088 ) ( CLEAR ?auto_11087 ) ( HOLDING ?auto_11086 ) ( CLEAR ?auto_11085 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11085 ?auto_11086 )
      ( MAKE-4PILE ?auto_11085 ?auto_11086 ?auto_11087 ?auto_11088 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11089 - BLOCK
      ?auto_11090 - BLOCK
      ?auto_11091 - BLOCK
      ?auto_11092 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11089 ) ( not ( = ?auto_11089 ?auto_11090 ) ) ( not ( = ?auto_11089 ?auto_11091 ) ) ( not ( = ?auto_11089 ?auto_11092 ) ) ( not ( = ?auto_11090 ?auto_11091 ) ) ( not ( = ?auto_11090 ?auto_11092 ) ) ( not ( = ?auto_11091 ?auto_11092 ) ) ( ON-TABLE ?auto_11092 ) ( ON ?auto_11091 ?auto_11092 ) ( CLEAR ?auto_11089 ) ( ON ?auto_11090 ?auto_11091 ) ( CLEAR ?auto_11090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11092 ?auto_11091 )
      ( MAKE-4PILE ?auto_11089 ?auto_11090 ?auto_11091 ?auto_11092 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11093 - BLOCK
      ?auto_11094 - BLOCK
      ?auto_11095 - BLOCK
      ?auto_11096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11093 ?auto_11094 ) ) ( not ( = ?auto_11093 ?auto_11095 ) ) ( not ( = ?auto_11093 ?auto_11096 ) ) ( not ( = ?auto_11094 ?auto_11095 ) ) ( not ( = ?auto_11094 ?auto_11096 ) ) ( not ( = ?auto_11095 ?auto_11096 ) ) ( ON-TABLE ?auto_11096 ) ( ON ?auto_11095 ?auto_11096 ) ( ON ?auto_11094 ?auto_11095 ) ( CLEAR ?auto_11094 ) ( HOLDING ?auto_11093 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11093 )
      ( MAKE-4PILE ?auto_11093 ?auto_11094 ?auto_11095 ?auto_11096 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11097 - BLOCK
      ?auto_11098 - BLOCK
      ?auto_11099 - BLOCK
      ?auto_11100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11097 ?auto_11098 ) ) ( not ( = ?auto_11097 ?auto_11099 ) ) ( not ( = ?auto_11097 ?auto_11100 ) ) ( not ( = ?auto_11098 ?auto_11099 ) ) ( not ( = ?auto_11098 ?auto_11100 ) ) ( not ( = ?auto_11099 ?auto_11100 ) ) ( ON-TABLE ?auto_11100 ) ( ON ?auto_11099 ?auto_11100 ) ( ON ?auto_11098 ?auto_11099 ) ( ON ?auto_11097 ?auto_11098 ) ( CLEAR ?auto_11097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11100 ?auto_11099 ?auto_11098 )
      ( MAKE-4PILE ?auto_11097 ?auto_11098 ?auto_11099 ?auto_11100 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11101 - BLOCK
      ?auto_11102 - BLOCK
      ?auto_11103 - BLOCK
      ?auto_11104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11101 ?auto_11102 ) ) ( not ( = ?auto_11101 ?auto_11103 ) ) ( not ( = ?auto_11101 ?auto_11104 ) ) ( not ( = ?auto_11102 ?auto_11103 ) ) ( not ( = ?auto_11102 ?auto_11104 ) ) ( not ( = ?auto_11103 ?auto_11104 ) ) ( ON-TABLE ?auto_11104 ) ( ON ?auto_11103 ?auto_11104 ) ( ON ?auto_11102 ?auto_11103 ) ( HOLDING ?auto_11101 ) ( CLEAR ?auto_11102 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11104 ?auto_11103 ?auto_11102 ?auto_11101 )
      ( MAKE-4PILE ?auto_11101 ?auto_11102 ?auto_11103 ?auto_11104 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11105 - BLOCK
      ?auto_11106 - BLOCK
      ?auto_11107 - BLOCK
      ?auto_11108 - BLOCK
    )
    :vars
    (
      ?auto_11109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11105 ?auto_11106 ) ) ( not ( = ?auto_11105 ?auto_11107 ) ) ( not ( = ?auto_11105 ?auto_11108 ) ) ( not ( = ?auto_11106 ?auto_11107 ) ) ( not ( = ?auto_11106 ?auto_11108 ) ) ( not ( = ?auto_11107 ?auto_11108 ) ) ( ON-TABLE ?auto_11108 ) ( ON ?auto_11107 ?auto_11108 ) ( ON ?auto_11106 ?auto_11107 ) ( CLEAR ?auto_11106 ) ( ON ?auto_11105 ?auto_11109 ) ( CLEAR ?auto_11105 ) ( HAND-EMPTY ) ( not ( = ?auto_11105 ?auto_11109 ) ) ( not ( = ?auto_11106 ?auto_11109 ) ) ( not ( = ?auto_11107 ?auto_11109 ) ) ( not ( = ?auto_11108 ?auto_11109 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11105 ?auto_11109 )
      ( MAKE-4PILE ?auto_11105 ?auto_11106 ?auto_11107 ?auto_11108 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11110 - BLOCK
      ?auto_11111 - BLOCK
      ?auto_11112 - BLOCK
      ?auto_11113 - BLOCK
    )
    :vars
    (
      ?auto_11114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11110 ?auto_11111 ) ) ( not ( = ?auto_11110 ?auto_11112 ) ) ( not ( = ?auto_11110 ?auto_11113 ) ) ( not ( = ?auto_11111 ?auto_11112 ) ) ( not ( = ?auto_11111 ?auto_11113 ) ) ( not ( = ?auto_11112 ?auto_11113 ) ) ( ON-TABLE ?auto_11113 ) ( ON ?auto_11112 ?auto_11113 ) ( ON ?auto_11110 ?auto_11114 ) ( CLEAR ?auto_11110 ) ( not ( = ?auto_11110 ?auto_11114 ) ) ( not ( = ?auto_11111 ?auto_11114 ) ) ( not ( = ?auto_11112 ?auto_11114 ) ) ( not ( = ?auto_11113 ?auto_11114 ) ) ( HOLDING ?auto_11111 ) ( CLEAR ?auto_11112 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11113 ?auto_11112 ?auto_11111 )
      ( MAKE-4PILE ?auto_11110 ?auto_11111 ?auto_11112 ?auto_11113 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11115 - BLOCK
      ?auto_11116 - BLOCK
      ?auto_11117 - BLOCK
      ?auto_11118 - BLOCK
    )
    :vars
    (
      ?auto_11119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11115 ?auto_11116 ) ) ( not ( = ?auto_11115 ?auto_11117 ) ) ( not ( = ?auto_11115 ?auto_11118 ) ) ( not ( = ?auto_11116 ?auto_11117 ) ) ( not ( = ?auto_11116 ?auto_11118 ) ) ( not ( = ?auto_11117 ?auto_11118 ) ) ( ON-TABLE ?auto_11118 ) ( ON ?auto_11117 ?auto_11118 ) ( ON ?auto_11115 ?auto_11119 ) ( not ( = ?auto_11115 ?auto_11119 ) ) ( not ( = ?auto_11116 ?auto_11119 ) ) ( not ( = ?auto_11117 ?auto_11119 ) ) ( not ( = ?auto_11118 ?auto_11119 ) ) ( CLEAR ?auto_11117 ) ( ON ?auto_11116 ?auto_11115 ) ( CLEAR ?auto_11116 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11119 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11119 ?auto_11115 )
      ( MAKE-4PILE ?auto_11115 ?auto_11116 ?auto_11117 ?auto_11118 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11120 - BLOCK
      ?auto_11121 - BLOCK
      ?auto_11122 - BLOCK
      ?auto_11123 - BLOCK
    )
    :vars
    (
      ?auto_11124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11120 ?auto_11121 ) ) ( not ( = ?auto_11120 ?auto_11122 ) ) ( not ( = ?auto_11120 ?auto_11123 ) ) ( not ( = ?auto_11121 ?auto_11122 ) ) ( not ( = ?auto_11121 ?auto_11123 ) ) ( not ( = ?auto_11122 ?auto_11123 ) ) ( ON-TABLE ?auto_11123 ) ( ON ?auto_11120 ?auto_11124 ) ( not ( = ?auto_11120 ?auto_11124 ) ) ( not ( = ?auto_11121 ?auto_11124 ) ) ( not ( = ?auto_11122 ?auto_11124 ) ) ( not ( = ?auto_11123 ?auto_11124 ) ) ( ON ?auto_11121 ?auto_11120 ) ( CLEAR ?auto_11121 ) ( ON-TABLE ?auto_11124 ) ( HOLDING ?auto_11122 ) ( CLEAR ?auto_11123 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11123 ?auto_11122 )
      ( MAKE-4PILE ?auto_11120 ?auto_11121 ?auto_11122 ?auto_11123 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11125 - BLOCK
      ?auto_11126 - BLOCK
      ?auto_11127 - BLOCK
      ?auto_11128 - BLOCK
    )
    :vars
    (
      ?auto_11129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11125 ?auto_11126 ) ) ( not ( = ?auto_11125 ?auto_11127 ) ) ( not ( = ?auto_11125 ?auto_11128 ) ) ( not ( = ?auto_11126 ?auto_11127 ) ) ( not ( = ?auto_11126 ?auto_11128 ) ) ( not ( = ?auto_11127 ?auto_11128 ) ) ( ON-TABLE ?auto_11128 ) ( ON ?auto_11125 ?auto_11129 ) ( not ( = ?auto_11125 ?auto_11129 ) ) ( not ( = ?auto_11126 ?auto_11129 ) ) ( not ( = ?auto_11127 ?auto_11129 ) ) ( not ( = ?auto_11128 ?auto_11129 ) ) ( ON ?auto_11126 ?auto_11125 ) ( ON-TABLE ?auto_11129 ) ( CLEAR ?auto_11128 ) ( ON ?auto_11127 ?auto_11126 ) ( CLEAR ?auto_11127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11129 ?auto_11125 ?auto_11126 )
      ( MAKE-4PILE ?auto_11125 ?auto_11126 ?auto_11127 ?auto_11128 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11130 - BLOCK
      ?auto_11131 - BLOCK
      ?auto_11132 - BLOCK
      ?auto_11133 - BLOCK
    )
    :vars
    (
      ?auto_11134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11130 ?auto_11131 ) ) ( not ( = ?auto_11130 ?auto_11132 ) ) ( not ( = ?auto_11130 ?auto_11133 ) ) ( not ( = ?auto_11131 ?auto_11132 ) ) ( not ( = ?auto_11131 ?auto_11133 ) ) ( not ( = ?auto_11132 ?auto_11133 ) ) ( ON ?auto_11130 ?auto_11134 ) ( not ( = ?auto_11130 ?auto_11134 ) ) ( not ( = ?auto_11131 ?auto_11134 ) ) ( not ( = ?auto_11132 ?auto_11134 ) ) ( not ( = ?auto_11133 ?auto_11134 ) ) ( ON ?auto_11131 ?auto_11130 ) ( ON-TABLE ?auto_11134 ) ( ON ?auto_11132 ?auto_11131 ) ( CLEAR ?auto_11132 ) ( HOLDING ?auto_11133 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11133 )
      ( MAKE-4PILE ?auto_11130 ?auto_11131 ?auto_11132 ?auto_11133 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11135 - BLOCK
      ?auto_11136 - BLOCK
      ?auto_11137 - BLOCK
      ?auto_11138 - BLOCK
    )
    :vars
    (
      ?auto_11139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11135 ?auto_11136 ) ) ( not ( = ?auto_11135 ?auto_11137 ) ) ( not ( = ?auto_11135 ?auto_11138 ) ) ( not ( = ?auto_11136 ?auto_11137 ) ) ( not ( = ?auto_11136 ?auto_11138 ) ) ( not ( = ?auto_11137 ?auto_11138 ) ) ( ON ?auto_11135 ?auto_11139 ) ( not ( = ?auto_11135 ?auto_11139 ) ) ( not ( = ?auto_11136 ?auto_11139 ) ) ( not ( = ?auto_11137 ?auto_11139 ) ) ( not ( = ?auto_11138 ?auto_11139 ) ) ( ON ?auto_11136 ?auto_11135 ) ( ON-TABLE ?auto_11139 ) ( ON ?auto_11137 ?auto_11136 ) ( ON ?auto_11138 ?auto_11137 ) ( CLEAR ?auto_11138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11139 ?auto_11135 ?auto_11136 ?auto_11137 )
      ( MAKE-4PILE ?auto_11135 ?auto_11136 ?auto_11137 ?auto_11138 ) )
  )

)

