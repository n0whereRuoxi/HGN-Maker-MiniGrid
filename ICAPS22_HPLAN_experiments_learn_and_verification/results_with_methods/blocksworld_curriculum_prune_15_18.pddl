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
      ?auto_454509 - BLOCK
    )
    :vars
    (
      ?auto_454510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454509 ?auto_454510 ) ( CLEAR ?auto_454509 ) ( HAND-EMPTY ) ( not ( = ?auto_454509 ?auto_454510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_454509 ?auto_454510 )
      ( !PUTDOWN ?auto_454509 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_454516 - BLOCK
      ?auto_454517 - BLOCK
    )
    :vars
    (
      ?auto_454518 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_454516 ) ( ON ?auto_454517 ?auto_454518 ) ( CLEAR ?auto_454517 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_454516 ) ( not ( = ?auto_454516 ?auto_454517 ) ) ( not ( = ?auto_454516 ?auto_454518 ) ) ( not ( = ?auto_454517 ?auto_454518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_454517 ?auto_454518 )
      ( !STACK ?auto_454517 ?auto_454516 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_454526 - BLOCK
      ?auto_454527 - BLOCK
    )
    :vars
    (
      ?auto_454528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454527 ?auto_454528 ) ( not ( = ?auto_454526 ?auto_454527 ) ) ( not ( = ?auto_454526 ?auto_454528 ) ) ( not ( = ?auto_454527 ?auto_454528 ) ) ( ON ?auto_454526 ?auto_454527 ) ( CLEAR ?auto_454526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_454526 )
      ( MAKE-2PILE ?auto_454526 ?auto_454527 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_454537 - BLOCK
      ?auto_454538 - BLOCK
      ?auto_454539 - BLOCK
    )
    :vars
    (
      ?auto_454540 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_454538 ) ( ON ?auto_454539 ?auto_454540 ) ( CLEAR ?auto_454539 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_454537 ) ( ON ?auto_454538 ?auto_454537 ) ( not ( = ?auto_454537 ?auto_454538 ) ) ( not ( = ?auto_454537 ?auto_454539 ) ) ( not ( = ?auto_454537 ?auto_454540 ) ) ( not ( = ?auto_454538 ?auto_454539 ) ) ( not ( = ?auto_454538 ?auto_454540 ) ) ( not ( = ?auto_454539 ?auto_454540 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_454539 ?auto_454540 )
      ( !STACK ?auto_454539 ?auto_454538 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_454551 - BLOCK
      ?auto_454552 - BLOCK
      ?auto_454553 - BLOCK
    )
    :vars
    (
      ?auto_454554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454553 ?auto_454554 ) ( ON-TABLE ?auto_454551 ) ( not ( = ?auto_454551 ?auto_454552 ) ) ( not ( = ?auto_454551 ?auto_454553 ) ) ( not ( = ?auto_454551 ?auto_454554 ) ) ( not ( = ?auto_454552 ?auto_454553 ) ) ( not ( = ?auto_454552 ?auto_454554 ) ) ( not ( = ?auto_454553 ?auto_454554 ) ) ( CLEAR ?auto_454551 ) ( ON ?auto_454552 ?auto_454553 ) ( CLEAR ?auto_454552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_454551 ?auto_454552 )
      ( MAKE-3PILE ?auto_454551 ?auto_454552 ?auto_454553 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_454565 - BLOCK
      ?auto_454566 - BLOCK
      ?auto_454567 - BLOCK
    )
    :vars
    (
      ?auto_454568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454567 ?auto_454568 ) ( not ( = ?auto_454565 ?auto_454566 ) ) ( not ( = ?auto_454565 ?auto_454567 ) ) ( not ( = ?auto_454565 ?auto_454568 ) ) ( not ( = ?auto_454566 ?auto_454567 ) ) ( not ( = ?auto_454566 ?auto_454568 ) ) ( not ( = ?auto_454567 ?auto_454568 ) ) ( ON ?auto_454566 ?auto_454567 ) ( ON ?auto_454565 ?auto_454566 ) ( CLEAR ?auto_454565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_454565 )
      ( MAKE-3PILE ?auto_454565 ?auto_454566 ?auto_454567 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_454580 - BLOCK
      ?auto_454581 - BLOCK
      ?auto_454582 - BLOCK
      ?auto_454583 - BLOCK
    )
    :vars
    (
      ?auto_454584 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_454582 ) ( ON ?auto_454583 ?auto_454584 ) ( CLEAR ?auto_454583 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_454580 ) ( ON ?auto_454581 ?auto_454580 ) ( ON ?auto_454582 ?auto_454581 ) ( not ( = ?auto_454580 ?auto_454581 ) ) ( not ( = ?auto_454580 ?auto_454582 ) ) ( not ( = ?auto_454580 ?auto_454583 ) ) ( not ( = ?auto_454580 ?auto_454584 ) ) ( not ( = ?auto_454581 ?auto_454582 ) ) ( not ( = ?auto_454581 ?auto_454583 ) ) ( not ( = ?auto_454581 ?auto_454584 ) ) ( not ( = ?auto_454582 ?auto_454583 ) ) ( not ( = ?auto_454582 ?auto_454584 ) ) ( not ( = ?auto_454583 ?auto_454584 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_454583 ?auto_454584 )
      ( !STACK ?auto_454583 ?auto_454582 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_454598 - BLOCK
      ?auto_454599 - BLOCK
      ?auto_454600 - BLOCK
      ?auto_454601 - BLOCK
    )
    :vars
    (
      ?auto_454602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454601 ?auto_454602 ) ( ON-TABLE ?auto_454598 ) ( ON ?auto_454599 ?auto_454598 ) ( not ( = ?auto_454598 ?auto_454599 ) ) ( not ( = ?auto_454598 ?auto_454600 ) ) ( not ( = ?auto_454598 ?auto_454601 ) ) ( not ( = ?auto_454598 ?auto_454602 ) ) ( not ( = ?auto_454599 ?auto_454600 ) ) ( not ( = ?auto_454599 ?auto_454601 ) ) ( not ( = ?auto_454599 ?auto_454602 ) ) ( not ( = ?auto_454600 ?auto_454601 ) ) ( not ( = ?auto_454600 ?auto_454602 ) ) ( not ( = ?auto_454601 ?auto_454602 ) ) ( CLEAR ?auto_454599 ) ( ON ?auto_454600 ?auto_454601 ) ( CLEAR ?auto_454600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_454598 ?auto_454599 ?auto_454600 )
      ( MAKE-4PILE ?auto_454598 ?auto_454599 ?auto_454600 ?auto_454601 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_454616 - BLOCK
      ?auto_454617 - BLOCK
      ?auto_454618 - BLOCK
      ?auto_454619 - BLOCK
    )
    :vars
    (
      ?auto_454620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454619 ?auto_454620 ) ( ON-TABLE ?auto_454616 ) ( not ( = ?auto_454616 ?auto_454617 ) ) ( not ( = ?auto_454616 ?auto_454618 ) ) ( not ( = ?auto_454616 ?auto_454619 ) ) ( not ( = ?auto_454616 ?auto_454620 ) ) ( not ( = ?auto_454617 ?auto_454618 ) ) ( not ( = ?auto_454617 ?auto_454619 ) ) ( not ( = ?auto_454617 ?auto_454620 ) ) ( not ( = ?auto_454618 ?auto_454619 ) ) ( not ( = ?auto_454618 ?auto_454620 ) ) ( not ( = ?auto_454619 ?auto_454620 ) ) ( ON ?auto_454618 ?auto_454619 ) ( CLEAR ?auto_454616 ) ( ON ?auto_454617 ?auto_454618 ) ( CLEAR ?auto_454617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_454616 ?auto_454617 )
      ( MAKE-4PILE ?auto_454616 ?auto_454617 ?auto_454618 ?auto_454619 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_454634 - BLOCK
      ?auto_454635 - BLOCK
      ?auto_454636 - BLOCK
      ?auto_454637 - BLOCK
    )
    :vars
    (
      ?auto_454638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454637 ?auto_454638 ) ( not ( = ?auto_454634 ?auto_454635 ) ) ( not ( = ?auto_454634 ?auto_454636 ) ) ( not ( = ?auto_454634 ?auto_454637 ) ) ( not ( = ?auto_454634 ?auto_454638 ) ) ( not ( = ?auto_454635 ?auto_454636 ) ) ( not ( = ?auto_454635 ?auto_454637 ) ) ( not ( = ?auto_454635 ?auto_454638 ) ) ( not ( = ?auto_454636 ?auto_454637 ) ) ( not ( = ?auto_454636 ?auto_454638 ) ) ( not ( = ?auto_454637 ?auto_454638 ) ) ( ON ?auto_454636 ?auto_454637 ) ( ON ?auto_454635 ?auto_454636 ) ( ON ?auto_454634 ?auto_454635 ) ( CLEAR ?auto_454634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_454634 )
      ( MAKE-4PILE ?auto_454634 ?auto_454635 ?auto_454636 ?auto_454637 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_454653 - BLOCK
      ?auto_454654 - BLOCK
      ?auto_454655 - BLOCK
      ?auto_454656 - BLOCK
      ?auto_454657 - BLOCK
    )
    :vars
    (
      ?auto_454658 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_454656 ) ( ON ?auto_454657 ?auto_454658 ) ( CLEAR ?auto_454657 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_454653 ) ( ON ?auto_454654 ?auto_454653 ) ( ON ?auto_454655 ?auto_454654 ) ( ON ?auto_454656 ?auto_454655 ) ( not ( = ?auto_454653 ?auto_454654 ) ) ( not ( = ?auto_454653 ?auto_454655 ) ) ( not ( = ?auto_454653 ?auto_454656 ) ) ( not ( = ?auto_454653 ?auto_454657 ) ) ( not ( = ?auto_454653 ?auto_454658 ) ) ( not ( = ?auto_454654 ?auto_454655 ) ) ( not ( = ?auto_454654 ?auto_454656 ) ) ( not ( = ?auto_454654 ?auto_454657 ) ) ( not ( = ?auto_454654 ?auto_454658 ) ) ( not ( = ?auto_454655 ?auto_454656 ) ) ( not ( = ?auto_454655 ?auto_454657 ) ) ( not ( = ?auto_454655 ?auto_454658 ) ) ( not ( = ?auto_454656 ?auto_454657 ) ) ( not ( = ?auto_454656 ?auto_454658 ) ) ( not ( = ?auto_454657 ?auto_454658 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_454657 ?auto_454658 )
      ( !STACK ?auto_454657 ?auto_454656 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_454675 - BLOCK
      ?auto_454676 - BLOCK
      ?auto_454677 - BLOCK
      ?auto_454678 - BLOCK
      ?auto_454679 - BLOCK
    )
    :vars
    (
      ?auto_454680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454679 ?auto_454680 ) ( ON-TABLE ?auto_454675 ) ( ON ?auto_454676 ?auto_454675 ) ( ON ?auto_454677 ?auto_454676 ) ( not ( = ?auto_454675 ?auto_454676 ) ) ( not ( = ?auto_454675 ?auto_454677 ) ) ( not ( = ?auto_454675 ?auto_454678 ) ) ( not ( = ?auto_454675 ?auto_454679 ) ) ( not ( = ?auto_454675 ?auto_454680 ) ) ( not ( = ?auto_454676 ?auto_454677 ) ) ( not ( = ?auto_454676 ?auto_454678 ) ) ( not ( = ?auto_454676 ?auto_454679 ) ) ( not ( = ?auto_454676 ?auto_454680 ) ) ( not ( = ?auto_454677 ?auto_454678 ) ) ( not ( = ?auto_454677 ?auto_454679 ) ) ( not ( = ?auto_454677 ?auto_454680 ) ) ( not ( = ?auto_454678 ?auto_454679 ) ) ( not ( = ?auto_454678 ?auto_454680 ) ) ( not ( = ?auto_454679 ?auto_454680 ) ) ( CLEAR ?auto_454677 ) ( ON ?auto_454678 ?auto_454679 ) ( CLEAR ?auto_454678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_454675 ?auto_454676 ?auto_454677 ?auto_454678 )
      ( MAKE-5PILE ?auto_454675 ?auto_454676 ?auto_454677 ?auto_454678 ?auto_454679 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_454697 - BLOCK
      ?auto_454698 - BLOCK
      ?auto_454699 - BLOCK
      ?auto_454700 - BLOCK
      ?auto_454701 - BLOCK
    )
    :vars
    (
      ?auto_454702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454701 ?auto_454702 ) ( ON-TABLE ?auto_454697 ) ( ON ?auto_454698 ?auto_454697 ) ( not ( = ?auto_454697 ?auto_454698 ) ) ( not ( = ?auto_454697 ?auto_454699 ) ) ( not ( = ?auto_454697 ?auto_454700 ) ) ( not ( = ?auto_454697 ?auto_454701 ) ) ( not ( = ?auto_454697 ?auto_454702 ) ) ( not ( = ?auto_454698 ?auto_454699 ) ) ( not ( = ?auto_454698 ?auto_454700 ) ) ( not ( = ?auto_454698 ?auto_454701 ) ) ( not ( = ?auto_454698 ?auto_454702 ) ) ( not ( = ?auto_454699 ?auto_454700 ) ) ( not ( = ?auto_454699 ?auto_454701 ) ) ( not ( = ?auto_454699 ?auto_454702 ) ) ( not ( = ?auto_454700 ?auto_454701 ) ) ( not ( = ?auto_454700 ?auto_454702 ) ) ( not ( = ?auto_454701 ?auto_454702 ) ) ( ON ?auto_454700 ?auto_454701 ) ( CLEAR ?auto_454698 ) ( ON ?auto_454699 ?auto_454700 ) ( CLEAR ?auto_454699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_454697 ?auto_454698 ?auto_454699 )
      ( MAKE-5PILE ?auto_454697 ?auto_454698 ?auto_454699 ?auto_454700 ?auto_454701 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_454719 - BLOCK
      ?auto_454720 - BLOCK
      ?auto_454721 - BLOCK
      ?auto_454722 - BLOCK
      ?auto_454723 - BLOCK
    )
    :vars
    (
      ?auto_454724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454723 ?auto_454724 ) ( ON-TABLE ?auto_454719 ) ( not ( = ?auto_454719 ?auto_454720 ) ) ( not ( = ?auto_454719 ?auto_454721 ) ) ( not ( = ?auto_454719 ?auto_454722 ) ) ( not ( = ?auto_454719 ?auto_454723 ) ) ( not ( = ?auto_454719 ?auto_454724 ) ) ( not ( = ?auto_454720 ?auto_454721 ) ) ( not ( = ?auto_454720 ?auto_454722 ) ) ( not ( = ?auto_454720 ?auto_454723 ) ) ( not ( = ?auto_454720 ?auto_454724 ) ) ( not ( = ?auto_454721 ?auto_454722 ) ) ( not ( = ?auto_454721 ?auto_454723 ) ) ( not ( = ?auto_454721 ?auto_454724 ) ) ( not ( = ?auto_454722 ?auto_454723 ) ) ( not ( = ?auto_454722 ?auto_454724 ) ) ( not ( = ?auto_454723 ?auto_454724 ) ) ( ON ?auto_454722 ?auto_454723 ) ( ON ?auto_454721 ?auto_454722 ) ( CLEAR ?auto_454719 ) ( ON ?auto_454720 ?auto_454721 ) ( CLEAR ?auto_454720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_454719 ?auto_454720 )
      ( MAKE-5PILE ?auto_454719 ?auto_454720 ?auto_454721 ?auto_454722 ?auto_454723 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_454741 - BLOCK
      ?auto_454742 - BLOCK
      ?auto_454743 - BLOCK
      ?auto_454744 - BLOCK
      ?auto_454745 - BLOCK
    )
    :vars
    (
      ?auto_454746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454745 ?auto_454746 ) ( not ( = ?auto_454741 ?auto_454742 ) ) ( not ( = ?auto_454741 ?auto_454743 ) ) ( not ( = ?auto_454741 ?auto_454744 ) ) ( not ( = ?auto_454741 ?auto_454745 ) ) ( not ( = ?auto_454741 ?auto_454746 ) ) ( not ( = ?auto_454742 ?auto_454743 ) ) ( not ( = ?auto_454742 ?auto_454744 ) ) ( not ( = ?auto_454742 ?auto_454745 ) ) ( not ( = ?auto_454742 ?auto_454746 ) ) ( not ( = ?auto_454743 ?auto_454744 ) ) ( not ( = ?auto_454743 ?auto_454745 ) ) ( not ( = ?auto_454743 ?auto_454746 ) ) ( not ( = ?auto_454744 ?auto_454745 ) ) ( not ( = ?auto_454744 ?auto_454746 ) ) ( not ( = ?auto_454745 ?auto_454746 ) ) ( ON ?auto_454744 ?auto_454745 ) ( ON ?auto_454743 ?auto_454744 ) ( ON ?auto_454742 ?auto_454743 ) ( ON ?auto_454741 ?auto_454742 ) ( CLEAR ?auto_454741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_454741 )
      ( MAKE-5PILE ?auto_454741 ?auto_454742 ?auto_454743 ?auto_454744 ?auto_454745 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_454764 - BLOCK
      ?auto_454765 - BLOCK
      ?auto_454766 - BLOCK
      ?auto_454767 - BLOCK
      ?auto_454768 - BLOCK
      ?auto_454769 - BLOCK
    )
    :vars
    (
      ?auto_454770 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_454768 ) ( ON ?auto_454769 ?auto_454770 ) ( CLEAR ?auto_454769 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_454764 ) ( ON ?auto_454765 ?auto_454764 ) ( ON ?auto_454766 ?auto_454765 ) ( ON ?auto_454767 ?auto_454766 ) ( ON ?auto_454768 ?auto_454767 ) ( not ( = ?auto_454764 ?auto_454765 ) ) ( not ( = ?auto_454764 ?auto_454766 ) ) ( not ( = ?auto_454764 ?auto_454767 ) ) ( not ( = ?auto_454764 ?auto_454768 ) ) ( not ( = ?auto_454764 ?auto_454769 ) ) ( not ( = ?auto_454764 ?auto_454770 ) ) ( not ( = ?auto_454765 ?auto_454766 ) ) ( not ( = ?auto_454765 ?auto_454767 ) ) ( not ( = ?auto_454765 ?auto_454768 ) ) ( not ( = ?auto_454765 ?auto_454769 ) ) ( not ( = ?auto_454765 ?auto_454770 ) ) ( not ( = ?auto_454766 ?auto_454767 ) ) ( not ( = ?auto_454766 ?auto_454768 ) ) ( not ( = ?auto_454766 ?auto_454769 ) ) ( not ( = ?auto_454766 ?auto_454770 ) ) ( not ( = ?auto_454767 ?auto_454768 ) ) ( not ( = ?auto_454767 ?auto_454769 ) ) ( not ( = ?auto_454767 ?auto_454770 ) ) ( not ( = ?auto_454768 ?auto_454769 ) ) ( not ( = ?auto_454768 ?auto_454770 ) ) ( not ( = ?auto_454769 ?auto_454770 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_454769 ?auto_454770 )
      ( !STACK ?auto_454769 ?auto_454768 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_454790 - BLOCK
      ?auto_454791 - BLOCK
      ?auto_454792 - BLOCK
      ?auto_454793 - BLOCK
      ?auto_454794 - BLOCK
      ?auto_454795 - BLOCK
    )
    :vars
    (
      ?auto_454796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454795 ?auto_454796 ) ( ON-TABLE ?auto_454790 ) ( ON ?auto_454791 ?auto_454790 ) ( ON ?auto_454792 ?auto_454791 ) ( ON ?auto_454793 ?auto_454792 ) ( not ( = ?auto_454790 ?auto_454791 ) ) ( not ( = ?auto_454790 ?auto_454792 ) ) ( not ( = ?auto_454790 ?auto_454793 ) ) ( not ( = ?auto_454790 ?auto_454794 ) ) ( not ( = ?auto_454790 ?auto_454795 ) ) ( not ( = ?auto_454790 ?auto_454796 ) ) ( not ( = ?auto_454791 ?auto_454792 ) ) ( not ( = ?auto_454791 ?auto_454793 ) ) ( not ( = ?auto_454791 ?auto_454794 ) ) ( not ( = ?auto_454791 ?auto_454795 ) ) ( not ( = ?auto_454791 ?auto_454796 ) ) ( not ( = ?auto_454792 ?auto_454793 ) ) ( not ( = ?auto_454792 ?auto_454794 ) ) ( not ( = ?auto_454792 ?auto_454795 ) ) ( not ( = ?auto_454792 ?auto_454796 ) ) ( not ( = ?auto_454793 ?auto_454794 ) ) ( not ( = ?auto_454793 ?auto_454795 ) ) ( not ( = ?auto_454793 ?auto_454796 ) ) ( not ( = ?auto_454794 ?auto_454795 ) ) ( not ( = ?auto_454794 ?auto_454796 ) ) ( not ( = ?auto_454795 ?auto_454796 ) ) ( CLEAR ?auto_454793 ) ( ON ?auto_454794 ?auto_454795 ) ( CLEAR ?auto_454794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_454790 ?auto_454791 ?auto_454792 ?auto_454793 ?auto_454794 )
      ( MAKE-6PILE ?auto_454790 ?auto_454791 ?auto_454792 ?auto_454793 ?auto_454794 ?auto_454795 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_454816 - BLOCK
      ?auto_454817 - BLOCK
      ?auto_454818 - BLOCK
      ?auto_454819 - BLOCK
      ?auto_454820 - BLOCK
      ?auto_454821 - BLOCK
    )
    :vars
    (
      ?auto_454822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454821 ?auto_454822 ) ( ON-TABLE ?auto_454816 ) ( ON ?auto_454817 ?auto_454816 ) ( ON ?auto_454818 ?auto_454817 ) ( not ( = ?auto_454816 ?auto_454817 ) ) ( not ( = ?auto_454816 ?auto_454818 ) ) ( not ( = ?auto_454816 ?auto_454819 ) ) ( not ( = ?auto_454816 ?auto_454820 ) ) ( not ( = ?auto_454816 ?auto_454821 ) ) ( not ( = ?auto_454816 ?auto_454822 ) ) ( not ( = ?auto_454817 ?auto_454818 ) ) ( not ( = ?auto_454817 ?auto_454819 ) ) ( not ( = ?auto_454817 ?auto_454820 ) ) ( not ( = ?auto_454817 ?auto_454821 ) ) ( not ( = ?auto_454817 ?auto_454822 ) ) ( not ( = ?auto_454818 ?auto_454819 ) ) ( not ( = ?auto_454818 ?auto_454820 ) ) ( not ( = ?auto_454818 ?auto_454821 ) ) ( not ( = ?auto_454818 ?auto_454822 ) ) ( not ( = ?auto_454819 ?auto_454820 ) ) ( not ( = ?auto_454819 ?auto_454821 ) ) ( not ( = ?auto_454819 ?auto_454822 ) ) ( not ( = ?auto_454820 ?auto_454821 ) ) ( not ( = ?auto_454820 ?auto_454822 ) ) ( not ( = ?auto_454821 ?auto_454822 ) ) ( ON ?auto_454820 ?auto_454821 ) ( CLEAR ?auto_454818 ) ( ON ?auto_454819 ?auto_454820 ) ( CLEAR ?auto_454819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_454816 ?auto_454817 ?auto_454818 ?auto_454819 )
      ( MAKE-6PILE ?auto_454816 ?auto_454817 ?auto_454818 ?auto_454819 ?auto_454820 ?auto_454821 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_454842 - BLOCK
      ?auto_454843 - BLOCK
      ?auto_454844 - BLOCK
      ?auto_454845 - BLOCK
      ?auto_454846 - BLOCK
      ?auto_454847 - BLOCK
    )
    :vars
    (
      ?auto_454848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454847 ?auto_454848 ) ( ON-TABLE ?auto_454842 ) ( ON ?auto_454843 ?auto_454842 ) ( not ( = ?auto_454842 ?auto_454843 ) ) ( not ( = ?auto_454842 ?auto_454844 ) ) ( not ( = ?auto_454842 ?auto_454845 ) ) ( not ( = ?auto_454842 ?auto_454846 ) ) ( not ( = ?auto_454842 ?auto_454847 ) ) ( not ( = ?auto_454842 ?auto_454848 ) ) ( not ( = ?auto_454843 ?auto_454844 ) ) ( not ( = ?auto_454843 ?auto_454845 ) ) ( not ( = ?auto_454843 ?auto_454846 ) ) ( not ( = ?auto_454843 ?auto_454847 ) ) ( not ( = ?auto_454843 ?auto_454848 ) ) ( not ( = ?auto_454844 ?auto_454845 ) ) ( not ( = ?auto_454844 ?auto_454846 ) ) ( not ( = ?auto_454844 ?auto_454847 ) ) ( not ( = ?auto_454844 ?auto_454848 ) ) ( not ( = ?auto_454845 ?auto_454846 ) ) ( not ( = ?auto_454845 ?auto_454847 ) ) ( not ( = ?auto_454845 ?auto_454848 ) ) ( not ( = ?auto_454846 ?auto_454847 ) ) ( not ( = ?auto_454846 ?auto_454848 ) ) ( not ( = ?auto_454847 ?auto_454848 ) ) ( ON ?auto_454846 ?auto_454847 ) ( ON ?auto_454845 ?auto_454846 ) ( CLEAR ?auto_454843 ) ( ON ?auto_454844 ?auto_454845 ) ( CLEAR ?auto_454844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_454842 ?auto_454843 ?auto_454844 )
      ( MAKE-6PILE ?auto_454842 ?auto_454843 ?auto_454844 ?auto_454845 ?auto_454846 ?auto_454847 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_454868 - BLOCK
      ?auto_454869 - BLOCK
      ?auto_454870 - BLOCK
      ?auto_454871 - BLOCK
      ?auto_454872 - BLOCK
      ?auto_454873 - BLOCK
    )
    :vars
    (
      ?auto_454874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454873 ?auto_454874 ) ( ON-TABLE ?auto_454868 ) ( not ( = ?auto_454868 ?auto_454869 ) ) ( not ( = ?auto_454868 ?auto_454870 ) ) ( not ( = ?auto_454868 ?auto_454871 ) ) ( not ( = ?auto_454868 ?auto_454872 ) ) ( not ( = ?auto_454868 ?auto_454873 ) ) ( not ( = ?auto_454868 ?auto_454874 ) ) ( not ( = ?auto_454869 ?auto_454870 ) ) ( not ( = ?auto_454869 ?auto_454871 ) ) ( not ( = ?auto_454869 ?auto_454872 ) ) ( not ( = ?auto_454869 ?auto_454873 ) ) ( not ( = ?auto_454869 ?auto_454874 ) ) ( not ( = ?auto_454870 ?auto_454871 ) ) ( not ( = ?auto_454870 ?auto_454872 ) ) ( not ( = ?auto_454870 ?auto_454873 ) ) ( not ( = ?auto_454870 ?auto_454874 ) ) ( not ( = ?auto_454871 ?auto_454872 ) ) ( not ( = ?auto_454871 ?auto_454873 ) ) ( not ( = ?auto_454871 ?auto_454874 ) ) ( not ( = ?auto_454872 ?auto_454873 ) ) ( not ( = ?auto_454872 ?auto_454874 ) ) ( not ( = ?auto_454873 ?auto_454874 ) ) ( ON ?auto_454872 ?auto_454873 ) ( ON ?auto_454871 ?auto_454872 ) ( ON ?auto_454870 ?auto_454871 ) ( CLEAR ?auto_454868 ) ( ON ?auto_454869 ?auto_454870 ) ( CLEAR ?auto_454869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_454868 ?auto_454869 )
      ( MAKE-6PILE ?auto_454868 ?auto_454869 ?auto_454870 ?auto_454871 ?auto_454872 ?auto_454873 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_454894 - BLOCK
      ?auto_454895 - BLOCK
      ?auto_454896 - BLOCK
      ?auto_454897 - BLOCK
      ?auto_454898 - BLOCK
      ?auto_454899 - BLOCK
    )
    :vars
    (
      ?auto_454900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454899 ?auto_454900 ) ( not ( = ?auto_454894 ?auto_454895 ) ) ( not ( = ?auto_454894 ?auto_454896 ) ) ( not ( = ?auto_454894 ?auto_454897 ) ) ( not ( = ?auto_454894 ?auto_454898 ) ) ( not ( = ?auto_454894 ?auto_454899 ) ) ( not ( = ?auto_454894 ?auto_454900 ) ) ( not ( = ?auto_454895 ?auto_454896 ) ) ( not ( = ?auto_454895 ?auto_454897 ) ) ( not ( = ?auto_454895 ?auto_454898 ) ) ( not ( = ?auto_454895 ?auto_454899 ) ) ( not ( = ?auto_454895 ?auto_454900 ) ) ( not ( = ?auto_454896 ?auto_454897 ) ) ( not ( = ?auto_454896 ?auto_454898 ) ) ( not ( = ?auto_454896 ?auto_454899 ) ) ( not ( = ?auto_454896 ?auto_454900 ) ) ( not ( = ?auto_454897 ?auto_454898 ) ) ( not ( = ?auto_454897 ?auto_454899 ) ) ( not ( = ?auto_454897 ?auto_454900 ) ) ( not ( = ?auto_454898 ?auto_454899 ) ) ( not ( = ?auto_454898 ?auto_454900 ) ) ( not ( = ?auto_454899 ?auto_454900 ) ) ( ON ?auto_454898 ?auto_454899 ) ( ON ?auto_454897 ?auto_454898 ) ( ON ?auto_454896 ?auto_454897 ) ( ON ?auto_454895 ?auto_454896 ) ( ON ?auto_454894 ?auto_454895 ) ( CLEAR ?auto_454894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_454894 )
      ( MAKE-6PILE ?auto_454894 ?auto_454895 ?auto_454896 ?auto_454897 ?auto_454898 ?auto_454899 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_454921 - BLOCK
      ?auto_454922 - BLOCK
      ?auto_454923 - BLOCK
      ?auto_454924 - BLOCK
      ?auto_454925 - BLOCK
      ?auto_454926 - BLOCK
      ?auto_454927 - BLOCK
    )
    :vars
    (
      ?auto_454928 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_454926 ) ( ON ?auto_454927 ?auto_454928 ) ( CLEAR ?auto_454927 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_454921 ) ( ON ?auto_454922 ?auto_454921 ) ( ON ?auto_454923 ?auto_454922 ) ( ON ?auto_454924 ?auto_454923 ) ( ON ?auto_454925 ?auto_454924 ) ( ON ?auto_454926 ?auto_454925 ) ( not ( = ?auto_454921 ?auto_454922 ) ) ( not ( = ?auto_454921 ?auto_454923 ) ) ( not ( = ?auto_454921 ?auto_454924 ) ) ( not ( = ?auto_454921 ?auto_454925 ) ) ( not ( = ?auto_454921 ?auto_454926 ) ) ( not ( = ?auto_454921 ?auto_454927 ) ) ( not ( = ?auto_454921 ?auto_454928 ) ) ( not ( = ?auto_454922 ?auto_454923 ) ) ( not ( = ?auto_454922 ?auto_454924 ) ) ( not ( = ?auto_454922 ?auto_454925 ) ) ( not ( = ?auto_454922 ?auto_454926 ) ) ( not ( = ?auto_454922 ?auto_454927 ) ) ( not ( = ?auto_454922 ?auto_454928 ) ) ( not ( = ?auto_454923 ?auto_454924 ) ) ( not ( = ?auto_454923 ?auto_454925 ) ) ( not ( = ?auto_454923 ?auto_454926 ) ) ( not ( = ?auto_454923 ?auto_454927 ) ) ( not ( = ?auto_454923 ?auto_454928 ) ) ( not ( = ?auto_454924 ?auto_454925 ) ) ( not ( = ?auto_454924 ?auto_454926 ) ) ( not ( = ?auto_454924 ?auto_454927 ) ) ( not ( = ?auto_454924 ?auto_454928 ) ) ( not ( = ?auto_454925 ?auto_454926 ) ) ( not ( = ?auto_454925 ?auto_454927 ) ) ( not ( = ?auto_454925 ?auto_454928 ) ) ( not ( = ?auto_454926 ?auto_454927 ) ) ( not ( = ?auto_454926 ?auto_454928 ) ) ( not ( = ?auto_454927 ?auto_454928 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_454927 ?auto_454928 )
      ( !STACK ?auto_454927 ?auto_454926 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_454951 - BLOCK
      ?auto_454952 - BLOCK
      ?auto_454953 - BLOCK
      ?auto_454954 - BLOCK
      ?auto_454955 - BLOCK
      ?auto_454956 - BLOCK
      ?auto_454957 - BLOCK
    )
    :vars
    (
      ?auto_454958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454957 ?auto_454958 ) ( ON-TABLE ?auto_454951 ) ( ON ?auto_454952 ?auto_454951 ) ( ON ?auto_454953 ?auto_454952 ) ( ON ?auto_454954 ?auto_454953 ) ( ON ?auto_454955 ?auto_454954 ) ( not ( = ?auto_454951 ?auto_454952 ) ) ( not ( = ?auto_454951 ?auto_454953 ) ) ( not ( = ?auto_454951 ?auto_454954 ) ) ( not ( = ?auto_454951 ?auto_454955 ) ) ( not ( = ?auto_454951 ?auto_454956 ) ) ( not ( = ?auto_454951 ?auto_454957 ) ) ( not ( = ?auto_454951 ?auto_454958 ) ) ( not ( = ?auto_454952 ?auto_454953 ) ) ( not ( = ?auto_454952 ?auto_454954 ) ) ( not ( = ?auto_454952 ?auto_454955 ) ) ( not ( = ?auto_454952 ?auto_454956 ) ) ( not ( = ?auto_454952 ?auto_454957 ) ) ( not ( = ?auto_454952 ?auto_454958 ) ) ( not ( = ?auto_454953 ?auto_454954 ) ) ( not ( = ?auto_454953 ?auto_454955 ) ) ( not ( = ?auto_454953 ?auto_454956 ) ) ( not ( = ?auto_454953 ?auto_454957 ) ) ( not ( = ?auto_454953 ?auto_454958 ) ) ( not ( = ?auto_454954 ?auto_454955 ) ) ( not ( = ?auto_454954 ?auto_454956 ) ) ( not ( = ?auto_454954 ?auto_454957 ) ) ( not ( = ?auto_454954 ?auto_454958 ) ) ( not ( = ?auto_454955 ?auto_454956 ) ) ( not ( = ?auto_454955 ?auto_454957 ) ) ( not ( = ?auto_454955 ?auto_454958 ) ) ( not ( = ?auto_454956 ?auto_454957 ) ) ( not ( = ?auto_454956 ?auto_454958 ) ) ( not ( = ?auto_454957 ?auto_454958 ) ) ( CLEAR ?auto_454955 ) ( ON ?auto_454956 ?auto_454957 ) ( CLEAR ?auto_454956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_454951 ?auto_454952 ?auto_454953 ?auto_454954 ?auto_454955 ?auto_454956 )
      ( MAKE-7PILE ?auto_454951 ?auto_454952 ?auto_454953 ?auto_454954 ?auto_454955 ?auto_454956 ?auto_454957 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_454981 - BLOCK
      ?auto_454982 - BLOCK
      ?auto_454983 - BLOCK
      ?auto_454984 - BLOCK
      ?auto_454985 - BLOCK
      ?auto_454986 - BLOCK
      ?auto_454987 - BLOCK
    )
    :vars
    (
      ?auto_454988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454987 ?auto_454988 ) ( ON-TABLE ?auto_454981 ) ( ON ?auto_454982 ?auto_454981 ) ( ON ?auto_454983 ?auto_454982 ) ( ON ?auto_454984 ?auto_454983 ) ( not ( = ?auto_454981 ?auto_454982 ) ) ( not ( = ?auto_454981 ?auto_454983 ) ) ( not ( = ?auto_454981 ?auto_454984 ) ) ( not ( = ?auto_454981 ?auto_454985 ) ) ( not ( = ?auto_454981 ?auto_454986 ) ) ( not ( = ?auto_454981 ?auto_454987 ) ) ( not ( = ?auto_454981 ?auto_454988 ) ) ( not ( = ?auto_454982 ?auto_454983 ) ) ( not ( = ?auto_454982 ?auto_454984 ) ) ( not ( = ?auto_454982 ?auto_454985 ) ) ( not ( = ?auto_454982 ?auto_454986 ) ) ( not ( = ?auto_454982 ?auto_454987 ) ) ( not ( = ?auto_454982 ?auto_454988 ) ) ( not ( = ?auto_454983 ?auto_454984 ) ) ( not ( = ?auto_454983 ?auto_454985 ) ) ( not ( = ?auto_454983 ?auto_454986 ) ) ( not ( = ?auto_454983 ?auto_454987 ) ) ( not ( = ?auto_454983 ?auto_454988 ) ) ( not ( = ?auto_454984 ?auto_454985 ) ) ( not ( = ?auto_454984 ?auto_454986 ) ) ( not ( = ?auto_454984 ?auto_454987 ) ) ( not ( = ?auto_454984 ?auto_454988 ) ) ( not ( = ?auto_454985 ?auto_454986 ) ) ( not ( = ?auto_454985 ?auto_454987 ) ) ( not ( = ?auto_454985 ?auto_454988 ) ) ( not ( = ?auto_454986 ?auto_454987 ) ) ( not ( = ?auto_454986 ?auto_454988 ) ) ( not ( = ?auto_454987 ?auto_454988 ) ) ( ON ?auto_454986 ?auto_454987 ) ( CLEAR ?auto_454984 ) ( ON ?auto_454985 ?auto_454986 ) ( CLEAR ?auto_454985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_454981 ?auto_454982 ?auto_454983 ?auto_454984 ?auto_454985 )
      ( MAKE-7PILE ?auto_454981 ?auto_454982 ?auto_454983 ?auto_454984 ?auto_454985 ?auto_454986 ?auto_454987 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_455011 - BLOCK
      ?auto_455012 - BLOCK
      ?auto_455013 - BLOCK
      ?auto_455014 - BLOCK
      ?auto_455015 - BLOCK
      ?auto_455016 - BLOCK
      ?auto_455017 - BLOCK
    )
    :vars
    (
      ?auto_455018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455017 ?auto_455018 ) ( ON-TABLE ?auto_455011 ) ( ON ?auto_455012 ?auto_455011 ) ( ON ?auto_455013 ?auto_455012 ) ( not ( = ?auto_455011 ?auto_455012 ) ) ( not ( = ?auto_455011 ?auto_455013 ) ) ( not ( = ?auto_455011 ?auto_455014 ) ) ( not ( = ?auto_455011 ?auto_455015 ) ) ( not ( = ?auto_455011 ?auto_455016 ) ) ( not ( = ?auto_455011 ?auto_455017 ) ) ( not ( = ?auto_455011 ?auto_455018 ) ) ( not ( = ?auto_455012 ?auto_455013 ) ) ( not ( = ?auto_455012 ?auto_455014 ) ) ( not ( = ?auto_455012 ?auto_455015 ) ) ( not ( = ?auto_455012 ?auto_455016 ) ) ( not ( = ?auto_455012 ?auto_455017 ) ) ( not ( = ?auto_455012 ?auto_455018 ) ) ( not ( = ?auto_455013 ?auto_455014 ) ) ( not ( = ?auto_455013 ?auto_455015 ) ) ( not ( = ?auto_455013 ?auto_455016 ) ) ( not ( = ?auto_455013 ?auto_455017 ) ) ( not ( = ?auto_455013 ?auto_455018 ) ) ( not ( = ?auto_455014 ?auto_455015 ) ) ( not ( = ?auto_455014 ?auto_455016 ) ) ( not ( = ?auto_455014 ?auto_455017 ) ) ( not ( = ?auto_455014 ?auto_455018 ) ) ( not ( = ?auto_455015 ?auto_455016 ) ) ( not ( = ?auto_455015 ?auto_455017 ) ) ( not ( = ?auto_455015 ?auto_455018 ) ) ( not ( = ?auto_455016 ?auto_455017 ) ) ( not ( = ?auto_455016 ?auto_455018 ) ) ( not ( = ?auto_455017 ?auto_455018 ) ) ( ON ?auto_455016 ?auto_455017 ) ( ON ?auto_455015 ?auto_455016 ) ( CLEAR ?auto_455013 ) ( ON ?auto_455014 ?auto_455015 ) ( CLEAR ?auto_455014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_455011 ?auto_455012 ?auto_455013 ?auto_455014 )
      ( MAKE-7PILE ?auto_455011 ?auto_455012 ?auto_455013 ?auto_455014 ?auto_455015 ?auto_455016 ?auto_455017 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_455041 - BLOCK
      ?auto_455042 - BLOCK
      ?auto_455043 - BLOCK
      ?auto_455044 - BLOCK
      ?auto_455045 - BLOCK
      ?auto_455046 - BLOCK
      ?auto_455047 - BLOCK
    )
    :vars
    (
      ?auto_455048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455047 ?auto_455048 ) ( ON-TABLE ?auto_455041 ) ( ON ?auto_455042 ?auto_455041 ) ( not ( = ?auto_455041 ?auto_455042 ) ) ( not ( = ?auto_455041 ?auto_455043 ) ) ( not ( = ?auto_455041 ?auto_455044 ) ) ( not ( = ?auto_455041 ?auto_455045 ) ) ( not ( = ?auto_455041 ?auto_455046 ) ) ( not ( = ?auto_455041 ?auto_455047 ) ) ( not ( = ?auto_455041 ?auto_455048 ) ) ( not ( = ?auto_455042 ?auto_455043 ) ) ( not ( = ?auto_455042 ?auto_455044 ) ) ( not ( = ?auto_455042 ?auto_455045 ) ) ( not ( = ?auto_455042 ?auto_455046 ) ) ( not ( = ?auto_455042 ?auto_455047 ) ) ( not ( = ?auto_455042 ?auto_455048 ) ) ( not ( = ?auto_455043 ?auto_455044 ) ) ( not ( = ?auto_455043 ?auto_455045 ) ) ( not ( = ?auto_455043 ?auto_455046 ) ) ( not ( = ?auto_455043 ?auto_455047 ) ) ( not ( = ?auto_455043 ?auto_455048 ) ) ( not ( = ?auto_455044 ?auto_455045 ) ) ( not ( = ?auto_455044 ?auto_455046 ) ) ( not ( = ?auto_455044 ?auto_455047 ) ) ( not ( = ?auto_455044 ?auto_455048 ) ) ( not ( = ?auto_455045 ?auto_455046 ) ) ( not ( = ?auto_455045 ?auto_455047 ) ) ( not ( = ?auto_455045 ?auto_455048 ) ) ( not ( = ?auto_455046 ?auto_455047 ) ) ( not ( = ?auto_455046 ?auto_455048 ) ) ( not ( = ?auto_455047 ?auto_455048 ) ) ( ON ?auto_455046 ?auto_455047 ) ( ON ?auto_455045 ?auto_455046 ) ( ON ?auto_455044 ?auto_455045 ) ( CLEAR ?auto_455042 ) ( ON ?auto_455043 ?auto_455044 ) ( CLEAR ?auto_455043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_455041 ?auto_455042 ?auto_455043 )
      ( MAKE-7PILE ?auto_455041 ?auto_455042 ?auto_455043 ?auto_455044 ?auto_455045 ?auto_455046 ?auto_455047 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_455071 - BLOCK
      ?auto_455072 - BLOCK
      ?auto_455073 - BLOCK
      ?auto_455074 - BLOCK
      ?auto_455075 - BLOCK
      ?auto_455076 - BLOCK
      ?auto_455077 - BLOCK
    )
    :vars
    (
      ?auto_455078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455077 ?auto_455078 ) ( ON-TABLE ?auto_455071 ) ( not ( = ?auto_455071 ?auto_455072 ) ) ( not ( = ?auto_455071 ?auto_455073 ) ) ( not ( = ?auto_455071 ?auto_455074 ) ) ( not ( = ?auto_455071 ?auto_455075 ) ) ( not ( = ?auto_455071 ?auto_455076 ) ) ( not ( = ?auto_455071 ?auto_455077 ) ) ( not ( = ?auto_455071 ?auto_455078 ) ) ( not ( = ?auto_455072 ?auto_455073 ) ) ( not ( = ?auto_455072 ?auto_455074 ) ) ( not ( = ?auto_455072 ?auto_455075 ) ) ( not ( = ?auto_455072 ?auto_455076 ) ) ( not ( = ?auto_455072 ?auto_455077 ) ) ( not ( = ?auto_455072 ?auto_455078 ) ) ( not ( = ?auto_455073 ?auto_455074 ) ) ( not ( = ?auto_455073 ?auto_455075 ) ) ( not ( = ?auto_455073 ?auto_455076 ) ) ( not ( = ?auto_455073 ?auto_455077 ) ) ( not ( = ?auto_455073 ?auto_455078 ) ) ( not ( = ?auto_455074 ?auto_455075 ) ) ( not ( = ?auto_455074 ?auto_455076 ) ) ( not ( = ?auto_455074 ?auto_455077 ) ) ( not ( = ?auto_455074 ?auto_455078 ) ) ( not ( = ?auto_455075 ?auto_455076 ) ) ( not ( = ?auto_455075 ?auto_455077 ) ) ( not ( = ?auto_455075 ?auto_455078 ) ) ( not ( = ?auto_455076 ?auto_455077 ) ) ( not ( = ?auto_455076 ?auto_455078 ) ) ( not ( = ?auto_455077 ?auto_455078 ) ) ( ON ?auto_455076 ?auto_455077 ) ( ON ?auto_455075 ?auto_455076 ) ( ON ?auto_455074 ?auto_455075 ) ( ON ?auto_455073 ?auto_455074 ) ( CLEAR ?auto_455071 ) ( ON ?auto_455072 ?auto_455073 ) ( CLEAR ?auto_455072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_455071 ?auto_455072 )
      ( MAKE-7PILE ?auto_455071 ?auto_455072 ?auto_455073 ?auto_455074 ?auto_455075 ?auto_455076 ?auto_455077 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_455101 - BLOCK
      ?auto_455102 - BLOCK
      ?auto_455103 - BLOCK
      ?auto_455104 - BLOCK
      ?auto_455105 - BLOCK
      ?auto_455106 - BLOCK
      ?auto_455107 - BLOCK
    )
    :vars
    (
      ?auto_455108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455107 ?auto_455108 ) ( not ( = ?auto_455101 ?auto_455102 ) ) ( not ( = ?auto_455101 ?auto_455103 ) ) ( not ( = ?auto_455101 ?auto_455104 ) ) ( not ( = ?auto_455101 ?auto_455105 ) ) ( not ( = ?auto_455101 ?auto_455106 ) ) ( not ( = ?auto_455101 ?auto_455107 ) ) ( not ( = ?auto_455101 ?auto_455108 ) ) ( not ( = ?auto_455102 ?auto_455103 ) ) ( not ( = ?auto_455102 ?auto_455104 ) ) ( not ( = ?auto_455102 ?auto_455105 ) ) ( not ( = ?auto_455102 ?auto_455106 ) ) ( not ( = ?auto_455102 ?auto_455107 ) ) ( not ( = ?auto_455102 ?auto_455108 ) ) ( not ( = ?auto_455103 ?auto_455104 ) ) ( not ( = ?auto_455103 ?auto_455105 ) ) ( not ( = ?auto_455103 ?auto_455106 ) ) ( not ( = ?auto_455103 ?auto_455107 ) ) ( not ( = ?auto_455103 ?auto_455108 ) ) ( not ( = ?auto_455104 ?auto_455105 ) ) ( not ( = ?auto_455104 ?auto_455106 ) ) ( not ( = ?auto_455104 ?auto_455107 ) ) ( not ( = ?auto_455104 ?auto_455108 ) ) ( not ( = ?auto_455105 ?auto_455106 ) ) ( not ( = ?auto_455105 ?auto_455107 ) ) ( not ( = ?auto_455105 ?auto_455108 ) ) ( not ( = ?auto_455106 ?auto_455107 ) ) ( not ( = ?auto_455106 ?auto_455108 ) ) ( not ( = ?auto_455107 ?auto_455108 ) ) ( ON ?auto_455106 ?auto_455107 ) ( ON ?auto_455105 ?auto_455106 ) ( ON ?auto_455104 ?auto_455105 ) ( ON ?auto_455103 ?auto_455104 ) ( ON ?auto_455102 ?auto_455103 ) ( ON ?auto_455101 ?auto_455102 ) ( CLEAR ?auto_455101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_455101 )
      ( MAKE-7PILE ?auto_455101 ?auto_455102 ?auto_455103 ?auto_455104 ?auto_455105 ?auto_455106 ?auto_455107 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_455132 - BLOCK
      ?auto_455133 - BLOCK
      ?auto_455134 - BLOCK
      ?auto_455135 - BLOCK
      ?auto_455136 - BLOCK
      ?auto_455137 - BLOCK
      ?auto_455138 - BLOCK
      ?auto_455139 - BLOCK
    )
    :vars
    (
      ?auto_455140 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_455138 ) ( ON ?auto_455139 ?auto_455140 ) ( CLEAR ?auto_455139 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_455132 ) ( ON ?auto_455133 ?auto_455132 ) ( ON ?auto_455134 ?auto_455133 ) ( ON ?auto_455135 ?auto_455134 ) ( ON ?auto_455136 ?auto_455135 ) ( ON ?auto_455137 ?auto_455136 ) ( ON ?auto_455138 ?auto_455137 ) ( not ( = ?auto_455132 ?auto_455133 ) ) ( not ( = ?auto_455132 ?auto_455134 ) ) ( not ( = ?auto_455132 ?auto_455135 ) ) ( not ( = ?auto_455132 ?auto_455136 ) ) ( not ( = ?auto_455132 ?auto_455137 ) ) ( not ( = ?auto_455132 ?auto_455138 ) ) ( not ( = ?auto_455132 ?auto_455139 ) ) ( not ( = ?auto_455132 ?auto_455140 ) ) ( not ( = ?auto_455133 ?auto_455134 ) ) ( not ( = ?auto_455133 ?auto_455135 ) ) ( not ( = ?auto_455133 ?auto_455136 ) ) ( not ( = ?auto_455133 ?auto_455137 ) ) ( not ( = ?auto_455133 ?auto_455138 ) ) ( not ( = ?auto_455133 ?auto_455139 ) ) ( not ( = ?auto_455133 ?auto_455140 ) ) ( not ( = ?auto_455134 ?auto_455135 ) ) ( not ( = ?auto_455134 ?auto_455136 ) ) ( not ( = ?auto_455134 ?auto_455137 ) ) ( not ( = ?auto_455134 ?auto_455138 ) ) ( not ( = ?auto_455134 ?auto_455139 ) ) ( not ( = ?auto_455134 ?auto_455140 ) ) ( not ( = ?auto_455135 ?auto_455136 ) ) ( not ( = ?auto_455135 ?auto_455137 ) ) ( not ( = ?auto_455135 ?auto_455138 ) ) ( not ( = ?auto_455135 ?auto_455139 ) ) ( not ( = ?auto_455135 ?auto_455140 ) ) ( not ( = ?auto_455136 ?auto_455137 ) ) ( not ( = ?auto_455136 ?auto_455138 ) ) ( not ( = ?auto_455136 ?auto_455139 ) ) ( not ( = ?auto_455136 ?auto_455140 ) ) ( not ( = ?auto_455137 ?auto_455138 ) ) ( not ( = ?auto_455137 ?auto_455139 ) ) ( not ( = ?auto_455137 ?auto_455140 ) ) ( not ( = ?auto_455138 ?auto_455139 ) ) ( not ( = ?auto_455138 ?auto_455140 ) ) ( not ( = ?auto_455139 ?auto_455140 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_455139 ?auto_455140 )
      ( !STACK ?auto_455139 ?auto_455138 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_455166 - BLOCK
      ?auto_455167 - BLOCK
      ?auto_455168 - BLOCK
      ?auto_455169 - BLOCK
      ?auto_455170 - BLOCK
      ?auto_455171 - BLOCK
      ?auto_455172 - BLOCK
      ?auto_455173 - BLOCK
    )
    :vars
    (
      ?auto_455174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455173 ?auto_455174 ) ( ON-TABLE ?auto_455166 ) ( ON ?auto_455167 ?auto_455166 ) ( ON ?auto_455168 ?auto_455167 ) ( ON ?auto_455169 ?auto_455168 ) ( ON ?auto_455170 ?auto_455169 ) ( ON ?auto_455171 ?auto_455170 ) ( not ( = ?auto_455166 ?auto_455167 ) ) ( not ( = ?auto_455166 ?auto_455168 ) ) ( not ( = ?auto_455166 ?auto_455169 ) ) ( not ( = ?auto_455166 ?auto_455170 ) ) ( not ( = ?auto_455166 ?auto_455171 ) ) ( not ( = ?auto_455166 ?auto_455172 ) ) ( not ( = ?auto_455166 ?auto_455173 ) ) ( not ( = ?auto_455166 ?auto_455174 ) ) ( not ( = ?auto_455167 ?auto_455168 ) ) ( not ( = ?auto_455167 ?auto_455169 ) ) ( not ( = ?auto_455167 ?auto_455170 ) ) ( not ( = ?auto_455167 ?auto_455171 ) ) ( not ( = ?auto_455167 ?auto_455172 ) ) ( not ( = ?auto_455167 ?auto_455173 ) ) ( not ( = ?auto_455167 ?auto_455174 ) ) ( not ( = ?auto_455168 ?auto_455169 ) ) ( not ( = ?auto_455168 ?auto_455170 ) ) ( not ( = ?auto_455168 ?auto_455171 ) ) ( not ( = ?auto_455168 ?auto_455172 ) ) ( not ( = ?auto_455168 ?auto_455173 ) ) ( not ( = ?auto_455168 ?auto_455174 ) ) ( not ( = ?auto_455169 ?auto_455170 ) ) ( not ( = ?auto_455169 ?auto_455171 ) ) ( not ( = ?auto_455169 ?auto_455172 ) ) ( not ( = ?auto_455169 ?auto_455173 ) ) ( not ( = ?auto_455169 ?auto_455174 ) ) ( not ( = ?auto_455170 ?auto_455171 ) ) ( not ( = ?auto_455170 ?auto_455172 ) ) ( not ( = ?auto_455170 ?auto_455173 ) ) ( not ( = ?auto_455170 ?auto_455174 ) ) ( not ( = ?auto_455171 ?auto_455172 ) ) ( not ( = ?auto_455171 ?auto_455173 ) ) ( not ( = ?auto_455171 ?auto_455174 ) ) ( not ( = ?auto_455172 ?auto_455173 ) ) ( not ( = ?auto_455172 ?auto_455174 ) ) ( not ( = ?auto_455173 ?auto_455174 ) ) ( CLEAR ?auto_455171 ) ( ON ?auto_455172 ?auto_455173 ) ( CLEAR ?auto_455172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_455166 ?auto_455167 ?auto_455168 ?auto_455169 ?auto_455170 ?auto_455171 ?auto_455172 )
      ( MAKE-8PILE ?auto_455166 ?auto_455167 ?auto_455168 ?auto_455169 ?auto_455170 ?auto_455171 ?auto_455172 ?auto_455173 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_455200 - BLOCK
      ?auto_455201 - BLOCK
      ?auto_455202 - BLOCK
      ?auto_455203 - BLOCK
      ?auto_455204 - BLOCK
      ?auto_455205 - BLOCK
      ?auto_455206 - BLOCK
      ?auto_455207 - BLOCK
    )
    :vars
    (
      ?auto_455208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455207 ?auto_455208 ) ( ON-TABLE ?auto_455200 ) ( ON ?auto_455201 ?auto_455200 ) ( ON ?auto_455202 ?auto_455201 ) ( ON ?auto_455203 ?auto_455202 ) ( ON ?auto_455204 ?auto_455203 ) ( not ( = ?auto_455200 ?auto_455201 ) ) ( not ( = ?auto_455200 ?auto_455202 ) ) ( not ( = ?auto_455200 ?auto_455203 ) ) ( not ( = ?auto_455200 ?auto_455204 ) ) ( not ( = ?auto_455200 ?auto_455205 ) ) ( not ( = ?auto_455200 ?auto_455206 ) ) ( not ( = ?auto_455200 ?auto_455207 ) ) ( not ( = ?auto_455200 ?auto_455208 ) ) ( not ( = ?auto_455201 ?auto_455202 ) ) ( not ( = ?auto_455201 ?auto_455203 ) ) ( not ( = ?auto_455201 ?auto_455204 ) ) ( not ( = ?auto_455201 ?auto_455205 ) ) ( not ( = ?auto_455201 ?auto_455206 ) ) ( not ( = ?auto_455201 ?auto_455207 ) ) ( not ( = ?auto_455201 ?auto_455208 ) ) ( not ( = ?auto_455202 ?auto_455203 ) ) ( not ( = ?auto_455202 ?auto_455204 ) ) ( not ( = ?auto_455202 ?auto_455205 ) ) ( not ( = ?auto_455202 ?auto_455206 ) ) ( not ( = ?auto_455202 ?auto_455207 ) ) ( not ( = ?auto_455202 ?auto_455208 ) ) ( not ( = ?auto_455203 ?auto_455204 ) ) ( not ( = ?auto_455203 ?auto_455205 ) ) ( not ( = ?auto_455203 ?auto_455206 ) ) ( not ( = ?auto_455203 ?auto_455207 ) ) ( not ( = ?auto_455203 ?auto_455208 ) ) ( not ( = ?auto_455204 ?auto_455205 ) ) ( not ( = ?auto_455204 ?auto_455206 ) ) ( not ( = ?auto_455204 ?auto_455207 ) ) ( not ( = ?auto_455204 ?auto_455208 ) ) ( not ( = ?auto_455205 ?auto_455206 ) ) ( not ( = ?auto_455205 ?auto_455207 ) ) ( not ( = ?auto_455205 ?auto_455208 ) ) ( not ( = ?auto_455206 ?auto_455207 ) ) ( not ( = ?auto_455206 ?auto_455208 ) ) ( not ( = ?auto_455207 ?auto_455208 ) ) ( ON ?auto_455206 ?auto_455207 ) ( CLEAR ?auto_455204 ) ( ON ?auto_455205 ?auto_455206 ) ( CLEAR ?auto_455205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_455200 ?auto_455201 ?auto_455202 ?auto_455203 ?auto_455204 ?auto_455205 )
      ( MAKE-8PILE ?auto_455200 ?auto_455201 ?auto_455202 ?auto_455203 ?auto_455204 ?auto_455205 ?auto_455206 ?auto_455207 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_455234 - BLOCK
      ?auto_455235 - BLOCK
      ?auto_455236 - BLOCK
      ?auto_455237 - BLOCK
      ?auto_455238 - BLOCK
      ?auto_455239 - BLOCK
      ?auto_455240 - BLOCK
      ?auto_455241 - BLOCK
    )
    :vars
    (
      ?auto_455242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455241 ?auto_455242 ) ( ON-TABLE ?auto_455234 ) ( ON ?auto_455235 ?auto_455234 ) ( ON ?auto_455236 ?auto_455235 ) ( ON ?auto_455237 ?auto_455236 ) ( not ( = ?auto_455234 ?auto_455235 ) ) ( not ( = ?auto_455234 ?auto_455236 ) ) ( not ( = ?auto_455234 ?auto_455237 ) ) ( not ( = ?auto_455234 ?auto_455238 ) ) ( not ( = ?auto_455234 ?auto_455239 ) ) ( not ( = ?auto_455234 ?auto_455240 ) ) ( not ( = ?auto_455234 ?auto_455241 ) ) ( not ( = ?auto_455234 ?auto_455242 ) ) ( not ( = ?auto_455235 ?auto_455236 ) ) ( not ( = ?auto_455235 ?auto_455237 ) ) ( not ( = ?auto_455235 ?auto_455238 ) ) ( not ( = ?auto_455235 ?auto_455239 ) ) ( not ( = ?auto_455235 ?auto_455240 ) ) ( not ( = ?auto_455235 ?auto_455241 ) ) ( not ( = ?auto_455235 ?auto_455242 ) ) ( not ( = ?auto_455236 ?auto_455237 ) ) ( not ( = ?auto_455236 ?auto_455238 ) ) ( not ( = ?auto_455236 ?auto_455239 ) ) ( not ( = ?auto_455236 ?auto_455240 ) ) ( not ( = ?auto_455236 ?auto_455241 ) ) ( not ( = ?auto_455236 ?auto_455242 ) ) ( not ( = ?auto_455237 ?auto_455238 ) ) ( not ( = ?auto_455237 ?auto_455239 ) ) ( not ( = ?auto_455237 ?auto_455240 ) ) ( not ( = ?auto_455237 ?auto_455241 ) ) ( not ( = ?auto_455237 ?auto_455242 ) ) ( not ( = ?auto_455238 ?auto_455239 ) ) ( not ( = ?auto_455238 ?auto_455240 ) ) ( not ( = ?auto_455238 ?auto_455241 ) ) ( not ( = ?auto_455238 ?auto_455242 ) ) ( not ( = ?auto_455239 ?auto_455240 ) ) ( not ( = ?auto_455239 ?auto_455241 ) ) ( not ( = ?auto_455239 ?auto_455242 ) ) ( not ( = ?auto_455240 ?auto_455241 ) ) ( not ( = ?auto_455240 ?auto_455242 ) ) ( not ( = ?auto_455241 ?auto_455242 ) ) ( ON ?auto_455240 ?auto_455241 ) ( ON ?auto_455239 ?auto_455240 ) ( CLEAR ?auto_455237 ) ( ON ?auto_455238 ?auto_455239 ) ( CLEAR ?auto_455238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_455234 ?auto_455235 ?auto_455236 ?auto_455237 ?auto_455238 )
      ( MAKE-8PILE ?auto_455234 ?auto_455235 ?auto_455236 ?auto_455237 ?auto_455238 ?auto_455239 ?auto_455240 ?auto_455241 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_455268 - BLOCK
      ?auto_455269 - BLOCK
      ?auto_455270 - BLOCK
      ?auto_455271 - BLOCK
      ?auto_455272 - BLOCK
      ?auto_455273 - BLOCK
      ?auto_455274 - BLOCK
      ?auto_455275 - BLOCK
    )
    :vars
    (
      ?auto_455276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455275 ?auto_455276 ) ( ON-TABLE ?auto_455268 ) ( ON ?auto_455269 ?auto_455268 ) ( ON ?auto_455270 ?auto_455269 ) ( not ( = ?auto_455268 ?auto_455269 ) ) ( not ( = ?auto_455268 ?auto_455270 ) ) ( not ( = ?auto_455268 ?auto_455271 ) ) ( not ( = ?auto_455268 ?auto_455272 ) ) ( not ( = ?auto_455268 ?auto_455273 ) ) ( not ( = ?auto_455268 ?auto_455274 ) ) ( not ( = ?auto_455268 ?auto_455275 ) ) ( not ( = ?auto_455268 ?auto_455276 ) ) ( not ( = ?auto_455269 ?auto_455270 ) ) ( not ( = ?auto_455269 ?auto_455271 ) ) ( not ( = ?auto_455269 ?auto_455272 ) ) ( not ( = ?auto_455269 ?auto_455273 ) ) ( not ( = ?auto_455269 ?auto_455274 ) ) ( not ( = ?auto_455269 ?auto_455275 ) ) ( not ( = ?auto_455269 ?auto_455276 ) ) ( not ( = ?auto_455270 ?auto_455271 ) ) ( not ( = ?auto_455270 ?auto_455272 ) ) ( not ( = ?auto_455270 ?auto_455273 ) ) ( not ( = ?auto_455270 ?auto_455274 ) ) ( not ( = ?auto_455270 ?auto_455275 ) ) ( not ( = ?auto_455270 ?auto_455276 ) ) ( not ( = ?auto_455271 ?auto_455272 ) ) ( not ( = ?auto_455271 ?auto_455273 ) ) ( not ( = ?auto_455271 ?auto_455274 ) ) ( not ( = ?auto_455271 ?auto_455275 ) ) ( not ( = ?auto_455271 ?auto_455276 ) ) ( not ( = ?auto_455272 ?auto_455273 ) ) ( not ( = ?auto_455272 ?auto_455274 ) ) ( not ( = ?auto_455272 ?auto_455275 ) ) ( not ( = ?auto_455272 ?auto_455276 ) ) ( not ( = ?auto_455273 ?auto_455274 ) ) ( not ( = ?auto_455273 ?auto_455275 ) ) ( not ( = ?auto_455273 ?auto_455276 ) ) ( not ( = ?auto_455274 ?auto_455275 ) ) ( not ( = ?auto_455274 ?auto_455276 ) ) ( not ( = ?auto_455275 ?auto_455276 ) ) ( ON ?auto_455274 ?auto_455275 ) ( ON ?auto_455273 ?auto_455274 ) ( ON ?auto_455272 ?auto_455273 ) ( CLEAR ?auto_455270 ) ( ON ?auto_455271 ?auto_455272 ) ( CLEAR ?auto_455271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_455268 ?auto_455269 ?auto_455270 ?auto_455271 )
      ( MAKE-8PILE ?auto_455268 ?auto_455269 ?auto_455270 ?auto_455271 ?auto_455272 ?auto_455273 ?auto_455274 ?auto_455275 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_455302 - BLOCK
      ?auto_455303 - BLOCK
      ?auto_455304 - BLOCK
      ?auto_455305 - BLOCK
      ?auto_455306 - BLOCK
      ?auto_455307 - BLOCK
      ?auto_455308 - BLOCK
      ?auto_455309 - BLOCK
    )
    :vars
    (
      ?auto_455310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455309 ?auto_455310 ) ( ON-TABLE ?auto_455302 ) ( ON ?auto_455303 ?auto_455302 ) ( not ( = ?auto_455302 ?auto_455303 ) ) ( not ( = ?auto_455302 ?auto_455304 ) ) ( not ( = ?auto_455302 ?auto_455305 ) ) ( not ( = ?auto_455302 ?auto_455306 ) ) ( not ( = ?auto_455302 ?auto_455307 ) ) ( not ( = ?auto_455302 ?auto_455308 ) ) ( not ( = ?auto_455302 ?auto_455309 ) ) ( not ( = ?auto_455302 ?auto_455310 ) ) ( not ( = ?auto_455303 ?auto_455304 ) ) ( not ( = ?auto_455303 ?auto_455305 ) ) ( not ( = ?auto_455303 ?auto_455306 ) ) ( not ( = ?auto_455303 ?auto_455307 ) ) ( not ( = ?auto_455303 ?auto_455308 ) ) ( not ( = ?auto_455303 ?auto_455309 ) ) ( not ( = ?auto_455303 ?auto_455310 ) ) ( not ( = ?auto_455304 ?auto_455305 ) ) ( not ( = ?auto_455304 ?auto_455306 ) ) ( not ( = ?auto_455304 ?auto_455307 ) ) ( not ( = ?auto_455304 ?auto_455308 ) ) ( not ( = ?auto_455304 ?auto_455309 ) ) ( not ( = ?auto_455304 ?auto_455310 ) ) ( not ( = ?auto_455305 ?auto_455306 ) ) ( not ( = ?auto_455305 ?auto_455307 ) ) ( not ( = ?auto_455305 ?auto_455308 ) ) ( not ( = ?auto_455305 ?auto_455309 ) ) ( not ( = ?auto_455305 ?auto_455310 ) ) ( not ( = ?auto_455306 ?auto_455307 ) ) ( not ( = ?auto_455306 ?auto_455308 ) ) ( not ( = ?auto_455306 ?auto_455309 ) ) ( not ( = ?auto_455306 ?auto_455310 ) ) ( not ( = ?auto_455307 ?auto_455308 ) ) ( not ( = ?auto_455307 ?auto_455309 ) ) ( not ( = ?auto_455307 ?auto_455310 ) ) ( not ( = ?auto_455308 ?auto_455309 ) ) ( not ( = ?auto_455308 ?auto_455310 ) ) ( not ( = ?auto_455309 ?auto_455310 ) ) ( ON ?auto_455308 ?auto_455309 ) ( ON ?auto_455307 ?auto_455308 ) ( ON ?auto_455306 ?auto_455307 ) ( ON ?auto_455305 ?auto_455306 ) ( CLEAR ?auto_455303 ) ( ON ?auto_455304 ?auto_455305 ) ( CLEAR ?auto_455304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_455302 ?auto_455303 ?auto_455304 )
      ( MAKE-8PILE ?auto_455302 ?auto_455303 ?auto_455304 ?auto_455305 ?auto_455306 ?auto_455307 ?auto_455308 ?auto_455309 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_455336 - BLOCK
      ?auto_455337 - BLOCK
      ?auto_455338 - BLOCK
      ?auto_455339 - BLOCK
      ?auto_455340 - BLOCK
      ?auto_455341 - BLOCK
      ?auto_455342 - BLOCK
      ?auto_455343 - BLOCK
    )
    :vars
    (
      ?auto_455344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455343 ?auto_455344 ) ( ON-TABLE ?auto_455336 ) ( not ( = ?auto_455336 ?auto_455337 ) ) ( not ( = ?auto_455336 ?auto_455338 ) ) ( not ( = ?auto_455336 ?auto_455339 ) ) ( not ( = ?auto_455336 ?auto_455340 ) ) ( not ( = ?auto_455336 ?auto_455341 ) ) ( not ( = ?auto_455336 ?auto_455342 ) ) ( not ( = ?auto_455336 ?auto_455343 ) ) ( not ( = ?auto_455336 ?auto_455344 ) ) ( not ( = ?auto_455337 ?auto_455338 ) ) ( not ( = ?auto_455337 ?auto_455339 ) ) ( not ( = ?auto_455337 ?auto_455340 ) ) ( not ( = ?auto_455337 ?auto_455341 ) ) ( not ( = ?auto_455337 ?auto_455342 ) ) ( not ( = ?auto_455337 ?auto_455343 ) ) ( not ( = ?auto_455337 ?auto_455344 ) ) ( not ( = ?auto_455338 ?auto_455339 ) ) ( not ( = ?auto_455338 ?auto_455340 ) ) ( not ( = ?auto_455338 ?auto_455341 ) ) ( not ( = ?auto_455338 ?auto_455342 ) ) ( not ( = ?auto_455338 ?auto_455343 ) ) ( not ( = ?auto_455338 ?auto_455344 ) ) ( not ( = ?auto_455339 ?auto_455340 ) ) ( not ( = ?auto_455339 ?auto_455341 ) ) ( not ( = ?auto_455339 ?auto_455342 ) ) ( not ( = ?auto_455339 ?auto_455343 ) ) ( not ( = ?auto_455339 ?auto_455344 ) ) ( not ( = ?auto_455340 ?auto_455341 ) ) ( not ( = ?auto_455340 ?auto_455342 ) ) ( not ( = ?auto_455340 ?auto_455343 ) ) ( not ( = ?auto_455340 ?auto_455344 ) ) ( not ( = ?auto_455341 ?auto_455342 ) ) ( not ( = ?auto_455341 ?auto_455343 ) ) ( not ( = ?auto_455341 ?auto_455344 ) ) ( not ( = ?auto_455342 ?auto_455343 ) ) ( not ( = ?auto_455342 ?auto_455344 ) ) ( not ( = ?auto_455343 ?auto_455344 ) ) ( ON ?auto_455342 ?auto_455343 ) ( ON ?auto_455341 ?auto_455342 ) ( ON ?auto_455340 ?auto_455341 ) ( ON ?auto_455339 ?auto_455340 ) ( ON ?auto_455338 ?auto_455339 ) ( CLEAR ?auto_455336 ) ( ON ?auto_455337 ?auto_455338 ) ( CLEAR ?auto_455337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_455336 ?auto_455337 )
      ( MAKE-8PILE ?auto_455336 ?auto_455337 ?auto_455338 ?auto_455339 ?auto_455340 ?auto_455341 ?auto_455342 ?auto_455343 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_455370 - BLOCK
      ?auto_455371 - BLOCK
      ?auto_455372 - BLOCK
      ?auto_455373 - BLOCK
      ?auto_455374 - BLOCK
      ?auto_455375 - BLOCK
      ?auto_455376 - BLOCK
      ?auto_455377 - BLOCK
    )
    :vars
    (
      ?auto_455378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455377 ?auto_455378 ) ( not ( = ?auto_455370 ?auto_455371 ) ) ( not ( = ?auto_455370 ?auto_455372 ) ) ( not ( = ?auto_455370 ?auto_455373 ) ) ( not ( = ?auto_455370 ?auto_455374 ) ) ( not ( = ?auto_455370 ?auto_455375 ) ) ( not ( = ?auto_455370 ?auto_455376 ) ) ( not ( = ?auto_455370 ?auto_455377 ) ) ( not ( = ?auto_455370 ?auto_455378 ) ) ( not ( = ?auto_455371 ?auto_455372 ) ) ( not ( = ?auto_455371 ?auto_455373 ) ) ( not ( = ?auto_455371 ?auto_455374 ) ) ( not ( = ?auto_455371 ?auto_455375 ) ) ( not ( = ?auto_455371 ?auto_455376 ) ) ( not ( = ?auto_455371 ?auto_455377 ) ) ( not ( = ?auto_455371 ?auto_455378 ) ) ( not ( = ?auto_455372 ?auto_455373 ) ) ( not ( = ?auto_455372 ?auto_455374 ) ) ( not ( = ?auto_455372 ?auto_455375 ) ) ( not ( = ?auto_455372 ?auto_455376 ) ) ( not ( = ?auto_455372 ?auto_455377 ) ) ( not ( = ?auto_455372 ?auto_455378 ) ) ( not ( = ?auto_455373 ?auto_455374 ) ) ( not ( = ?auto_455373 ?auto_455375 ) ) ( not ( = ?auto_455373 ?auto_455376 ) ) ( not ( = ?auto_455373 ?auto_455377 ) ) ( not ( = ?auto_455373 ?auto_455378 ) ) ( not ( = ?auto_455374 ?auto_455375 ) ) ( not ( = ?auto_455374 ?auto_455376 ) ) ( not ( = ?auto_455374 ?auto_455377 ) ) ( not ( = ?auto_455374 ?auto_455378 ) ) ( not ( = ?auto_455375 ?auto_455376 ) ) ( not ( = ?auto_455375 ?auto_455377 ) ) ( not ( = ?auto_455375 ?auto_455378 ) ) ( not ( = ?auto_455376 ?auto_455377 ) ) ( not ( = ?auto_455376 ?auto_455378 ) ) ( not ( = ?auto_455377 ?auto_455378 ) ) ( ON ?auto_455376 ?auto_455377 ) ( ON ?auto_455375 ?auto_455376 ) ( ON ?auto_455374 ?auto_455375 ) ( ON ?auto_455373 ?auto_455374 ) ( ON ?auto_455372 ?auto_455373 ) ( ON ?auto_455371 ?auto_455372 ) ( ON ?auto_455370 ?auto_455371 ) ( CLEAR ?auto_455370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_455370 )
      ( MAKE-8PILE ?auto_455370 ?auto_455371 ?auto_455372 ?auto_455373 ?auto_455374 ?auto_455375 ?auto_455376 ?auto_455377 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_455405 - BLOCK
      ?auto_455406 - BLOCK
      ?auto_455407 - BLOCK
      ?auto_455408 - BLOCK
      ?auto_455409 - BLOCK
      ?auto_455410 - BLOCK
      ?auto_455411 - BLOCK
      ?auto_455412 - BLOCK
      ?auto_455413 - BLOCK
    )
    :vars
    (
      ?auto_455414 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_455412 ) ( ON ?auto_455413 ?auto_455414 ) ( CLEAR ?auto_455413 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_455405 ) ( ON ?auto_455406 ?auto_455405 ) ( ON ?auto_455407 ?auto_455406 ) ( ON ?auto_455408 ?auto_455407 ) ( ON ?auto_455409 ?auto_455408 ) ( ON ?auto_455410 ?auto_455409 ) ( ON ?auto_455411 ?auto_455410 ) ( ON ?auto_455412 ?auto_455411 ) ( not ( = ?auto_455405 ?auto_455406 ) ) ( not ( = ?auto_455405 ?auto_455407 ) ) ( not ( = ?auto_455405 ?auto_455408 ) ) ( not ( = ?auto_455405 ?auto_455409 ) ) ( not ( = ?auto_455405 ?auto_455410 ) ) ( not ( = ?auto_455405 ?auto_455411 ) ) ( not ( = ?auto_455405 ?auto_455412 ) ) ( not ( = ?auto_455405 ?auto_455413 ) ) ( not ( = ?auto_455405 ?auto_455414 ) ) ( not ( = ?auto_455406 ?auto_455407 ) ) ( not ( = ?auto_455406 ?auto_455408 ) ) ( not ( = ?auto_455406 ?auto_455409 ) ) ( not ( = ?auto_455406 ?auto_455410 ) ) ( not ( = ?auto_455406 ?auto_455411 ) ) ( not ( = ?auto_455406 ?auto_455412 ) ) ( not ( = ?auto_455406 ?auto_455413 ) ) ( not ( = ?auto_455406 ?auto_455414 ) ) ( not ( = ?auto_455407 ?auto_455408 ) ) ( not ( = ?auto_455407 ?auto_455409 ) ) ( not ( = ?auto_455407 ?auto_455410 ) ) ( not ( = ?auto_455407 ?auto_455411 ) ) ( not ( = ?auto_455407 ?auto_455412 ) ) ( not ( = ?auto_455407 ?auto_455413 ) ) ( not ( = ?auto_455407 ?auto_455414 ) ) ( not ( = ?auto_455408 ?auto_455409 ) ) ( not ( = ?auto_455408 ?auto_455410 ) ) ( not ( = ?auto_455408 ?auto_455411 ) ) ( not ( = ?auto_455408 ?auto_455412 ) ) ( not ( = ?auto_455408 ?auto_455413 ) ) ( not ( = ?auto_455408 ?auto_455414 ) ) ( not ( = ?auto_455409 ?auto_455410 ) ) ( not ( = ?auto_455409 ?auto_455411 ) ) ( not ( = ?auto_455409 ?auto_455412 ) ) ( not ( = ?auto_455409 ?auto_455413 ) ) ( not ( = ?auto_455409 ?auto_455414 ) ) ( not ( = ?auto_455410 ?auto_455411 ) ) ( not ( = ?auto_455410 ?auto_455412 ) ) ( not ( = ?auto_455410 ?auto_455413 ) ) ( not ( = ?auto_455410 ?auto_455414 ) ) ( not ( = ?auto_455411 ?auto_455412 ) ) ( not ( = ?auto_455411 ?auto_455413 ) ) ( not ( = ?auto_455411 ?auto_455414 ) ) ( not ( = ?auto_455412 ?auto_455413 ) ) ( not ( = ?auto_455412 ?auto_455414 ) ) ( not ( = ?auto_455413 ?auto_455414 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_455413 ?auto_455414 )
      ( !STACK ?auto_455413 ?auto_455412 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_455443 - BLOCK
      ?auto_455444 - BLOCK
      ?auto_455445 - BLOCK
      ?auto_455446 - BLOCK
      ?auto_455447 - BLOCK
      ?auto_455448 - BLOCK
      ?auto_455449 - BLOCK
      ?auto_455450 - BLOCK
      ?auto_455451 - BLOCK
    )
    :vars
    (
      ?auto_455452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455451 ?auto_455452 ) ( ON-TABLE ?auto_455443 ) ( ON ?auto_455444 ?auto_455443 ) ( ON ?auto_455445 ?auto_455444 ) ( ON ?auto_455446 ?auto_455445 ) ( ON ?auto_455447 ?auto_455446 ) ( ON ?auto_455448 ?auto_455447 ) ( ON ?auto_455449 ?auto_455448 ) ( not ( = ?auto_455443 ?auto_455444 ) ) ( not ( = ?auto_455443 ?auto_455445 ) ) ( not ( = ?auto_455443 ?auto_455446 ) ) ( not ( = ?auto_455443 ?auto_455447 ) ) ( not ( = ?auto_455443 ?auto_455448 ) ) ( not ( = ?auto_455443 ?auto_455449 ) ) ( not ( = ?auto_455443 ?auto_455450 ) ) ( not ( = ?auto_455443 ?auto_455451 ) ) ( not ( = ?auto_455443 ?auto_455452 ) ) ( not ( = ?auto_455444 ?auto_455445 ) ) ( not ( = ?auto_455444 ?auto_455446 ) ) ( not ( = ?auto_455444 ?auto_455447 ) ) ( not ( = ?auto_455444 ?auto_455448 ) ) ( not ( = ?auto_455444 ?auto_455449 ) ) ( not ( = ?auto_455444 ?auto_455450 ) ) ( not ( = ?auto_455444 ?auto_455451 ) ) ( not ( = ?auto_455444 ?auto_455452 ) ) ( not ( = ?auto_455445 ?auto_455446 ) ) ( not ( = ?auto_455445 ?auto_455447 ) ) ( not ( = ?auto_455445 ?auto_455448 ) ) ( not ( = ?auto_455445 ?auto_455449 ) ) ( not ( = ?auto_455445 ?auto_455450 ) ) ( not ( = ?auto_455445 ?auto_455451 ) ) ( not ( = ?auto_455445 ?auto_455452 ) ) ( not ( = ?auto_455446 ?auto_455447 ) ) ( not ( = ?auto_455446 ?auto_455448 ) ) ( not ( = ?auto_455446 ?auto_455449 ) ) ( not ( = ?auto_455446 ?auto_455450 ) ) ( not ( = ?auto_455446 ?auto_455451 ) ) ( not ( = ?auto_455446 ?auto_455452 ) ) ( not ( = ?auto_455447 ?auto_455448 ) ) ( not ( = ?auto_455447 ?auto_455449 ) ) ( not ( = ?auto_455447 ?auto_455450 ) ) ( not ( = ?auto_455447 ?auto_455451 ) ) ( not ( = ?auto_455447 ?auto_455452 ) ) ( not ( = ?auto_455448 ?auto_455449 ) ) ( not ( = ?auto_455448 ?auto_455450 ) ) ( not ( = ?auto_455448 ?auto_455451 ) ) ( not ( = ?auto_455448 ?auto_455452 ) ) ( not ( = ?auto_455449 ?auto_455450 ) ) ( not ( = ?auto_455449 ?auto_455451 ) ) ( not ( = ?auto_455449 ?auto_455452 ) ) ( not ( = ?auto_455450 ?auto_455451 ) ) ( not ( = ?auto_455450 ?auto_455452 ) ) ( not ( = ?auto_455451 ?auto_455452 ) ) ( CLEAR ?auto_455449 ) ( ON ?auto_455450 ?auto_455451 ) ( CLEAR ?auto_455450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_455443 ?auto_455444 ?auto_455445 ?auto_455446 ?auto_455447 ?auto_455448 ?auto_455449 ?auto_455450 )
      ( MAKE-9PILE ?auto_455443 ?auto_455444 ?auto_455445 ?auto_455446 ?auto_455447 ?auto_455448 ?auto_455449 ?auto_455450 ?auto_455451 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_455481 - BLOCK
      ?auto_455482 - BLOCK
      ?auto_455483 - BLOCK
      ?auto_455484 - BLOCK
      ?auto_455485 - BLOCK
      ?auto_455486 - BLOCK
      ?auto_455487 - BLOCK
      ?auto_455488 - BLOCK
      ?auto_455489 - BLOCK
    )
    :vars
    (
      ?auto_455490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455489 ?auto_455490 ) ( ON-TABLE ?auto_455481 ) ( ON ?auto_455482 ?auto_455481 ) ( ON ?auto_455483 ?auto_455482 ) ( ON ?auto_455484 ?auto_455483 ) ( ON ?auto_455485 ?auto_455484 ) ( ON ?auto_455486 ?auto_455485 ) ( not ( = ?auto_455481 ?auto_455482 ) ) ( not ( = ?auto_455481 ?auto_455483 ) ) ( not ( = ?auto_455481 ?auto_455484 ) ) ( not ( = ?auto_455481 ?auto_455485 ) ) ( not ( = ?auto_455481 ?auto_455486 ) ) ( not ( = ?auto_455481 ?auto_455487 ) ) ( not ( = ?auto_455481 ?auto_455488 ) ) ( not ( = ?auto_455481 ?auto_455489 ) ) ( not ( = ?auto_455481 ?auto_455490 ) ) ( not ( = ?auto_455482 ?auto_455483 ) ) ( not ( = ?auto_455482 ?auto_455484 ) ) ( not ( = ?auto_455482 ?auto_455485 ) ) ( not ( = ?auto_455482 ?auto_455486 ) ) ( not ( = ?auto_455482 ?auto_455487 ) ) ( not ( = ?auto_455482 ?auto_455488 ) ) ( not ( = ?auto_455482 ?auto_455489 ) ) ( not ( = ?auto_455482 ?auto_455490 ) ) ( not ( = ?auto_455483 ?auto_455484 ) ) ( not ( = ?auto_455483 ?auto_455485 ) ) ( not ( = ?auto_455483 ?auto_455486 ) ) ( not ( = ?auto_455483 ?auto_455487 ) ) ( not ( = ?auto_455483 ?auto_455488 ) ) ( not ( = ?auto_455483 ?auto_455489 ) ) ( not ( = ?auto_455483 ?auto_455490 ) ) ( not ( = ?auto_455484 ?auto_455485 ) ) ( not ( = ?auto_455484 ?auto_455486 ) ) ( not ( = ?auto_455484 ?auto_455487 ) ) ( not ( = ?auto_455484 ?auto_455488 ) ) ( not ( = ?auto_455484 ?auto_455489 ) ) ( not ( = ?auto_455484 ?auto_455490 ) ) ( not ( = ?auto_455485 ?auto_455486 ) ) ( not ( = ?auto_455485 ?auto_455487 ) ) ( not ( = ?auto_455485 ?auto_455488 ) ) ( not ( = ?auto_455485 ?auto_455489 ) ) ( not ( = ?auto_455485 ?auto_455490 ) ) ( not ( = ?auto_455486 ?auto_455487 ) ) ( not ( = ?auto_455486 ?auto_455488 ) ) ( not ( = ?auto_455486 ?auto_455489 ) ) ( not ( = ?auto_455486 ?auto_455490 ) ) ( not ( = ?auto_455487 ?auto_455488 ) ) ( not ( = ?auto_455487 ?auto_455489 ) ) ( not ( = ?auto_455487 ?auto_455490 ) ) ( not ( = ?auto_455488 ?auto_455489 ) ) ( not ( = ?auto_455488 ?auto_455490 ) ) ( not ( = ?auto_455489 ?auto_455490 ) ) ( ON ?auto_455488 ?auto_455489 ) ( CLEAR ?auto_455486 ) ( ON ?auto_455487 ?auto_455488 ) ( CLEAR ?auto_455487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_455481 ?auto_455482 ?auto_455483 ?auto_455484 ?auto_455485 ?auto_455486 ?auto_455487 )
      ( MAKE-9PILE ?auto_455481 ?auto_455482 ?auto_455483 ?auto_455484 ?auto_455485 ?auto_455486 ?auto_455487 ?auto_455488 ?auto_455489 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_455519 - BLOCK
      ?auto_455520 - BLOCK
      ?auto_455521 - BLOCK
      ?auto_455522 - BLOCK
      ?auto_455523 - BLOCK
      ?auto_455524 - BLOCK
      ?auto_455525 - BLOCK
      ?auto_455526 - BLOCK
      ?auto_455527 - BLOCK
    )
    :vars
    (
      ?auto_455528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455527 ?auto_455528 ) ( ON-TABLE ?auto_455519 ) ( ON ?auto_455520 ?auto_455519 ) ( ON ?auto_455521 ?auto_455520 ) ( ON ?auto_455522 ?auto_455521 ) ( ON ?auto_455523 ?auto_455522 ) ( not ( = ?auto_455519 ?auto_455520 ) ) ( not ( = ?auto_455519 ?auto_455521 ) ) ( not ( = ?auto_455519 ?auto_455522 ) ) ( not ( = ?auto_455519 ?auto_455523 ) ) ( not ( = ?auto_455519 ?auto_455524 ) ) ( not ( = ?auto_455519 ?auto_455525 ) ) ( not ( = ?auto_455519 ?auto_455526 ) ) ( not ( = ?auto_455519 ?auto_455527 ) ) ( not ( = ?auto_455519 ?auto_455528 ) ) ( not ( = ?auto_455520 ?auto_455521 ) ) ( not ( = ?auto_455520 ?auto_455522 ) ) ( not ( = ?auto_455520 ?auto_455523 ) ) ( not ( = ?auto_455520 ?auto_455524 ) ) ( not ( = ?auto_455520 ?auto_455525 ) ) ( not ( = ?auto_455520 ?auto_455526 ) ) ( not ( = ?auto_455520 ?auto_455527 ) ) ( not ( = ?auto_455520 ?auto_455528 ) ) ( not ( = ?auto_455521 ?auto_455522 ) ) ( not ( = ?auto_455521 ?auto_455523 ) ) ( not ( = ?auto_455521 ?auto_455524 ) ) ( not ( = ?auto_455521 ?auto_455525 ) ) ( not ( = ?auto_455521 ?auto_455526 ) ) ( not ( = ?auto_455521 ?auto_455527 ) ) ( not ( = ?auto_455521 ?auto_455528 ) ) ( not ( = ?auto_455522 ?auto_455523 ) ) ( not ( = ?auto_455522 ?auto_455524 ) ) ( not ( = ?auto_455522 ?auto_455525 ) ) ( not ( = ?auto_455522 ?auto_455526 ) ) ( not ( = ?auto_455522 ?auto_455527 ) ) ( not ( = ?auto_455522 ?auto_455528 ) ) ( not ( = ?auto_455523 ?auto_455524 ) ) ( not ( = ?auto_455523 ?auto_455525 ) ) ( not ( = ?auto_455523 ?auto_455526 ) ) ( not ( = ?auto_455523 ?auto_455527 ) ) ( not ( = ?auto_455523 ?auto_455528 ) ) ( not ( = ?auto_455524 ?auto_455525 ) ) ( not ( = ?auto_455524 ?auto_455526 ) ) ( not ( = ?auto_455524 ?auto_455527 ) ) ( not ( = ?auto_455524 ?auto_455528 ) ) ( not ( = ?auto_455525 ?auto_455526 ) ) ( not ( = ?auto_455525 ?auto_455527 ) ) ( not ( = ?auto_455525 ?auto_455528 ) ) ( not ( = ?auto_455526 ?auto_455527 ) ) ( not ( = ?auto_455526 ?auto_455528 ) ) ( not ( = ?auto_455527 ?auto_455528 ) ) ( ON ?auto_455526 ?auto_455527 ) ( ON ?auto_455525 ?auto_455526 ) ( CLEAR ?auto_455523 ) ( ON ?auto_455524 ?auto_455525 ) ( CLEAR ?auto_455524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_455519 ?auto_455520 ?auto_455521 ?auto_455522 ?auto_455523 ?auto_455524 )
      ( MAKE-9PILE ?auto_455519 ?auto_455520 ?auto_455521 ?auto_455522 ?auto_455523 ?auto_455524 ?auto_455525 ?auto_455526 ?auto_455527 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_455557 - BLOCK
      ?auto_455558 - BLOCK
      ?auto_455559 - BLOCK
      ?auto_455560 - BLOCK
      ?auto_455561 - BLOCK
      ?auto_455562 - BLOCK
      ?auto_455563 - BLOCK
      ?auto_455564 - BLOCK
      ?auto_455565 - BLOCK
    )
    :vars
    (
      ?auto_455566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455565 ?auto_455566 ) ( ON-TABLE ?auto_455557 ) ( ON ?auto_455558 ?auto_455557 ) ( ON ?auto_455559 ?auto_455558 ) ( ON ?auto_455560 ?auto_455559 ) ( not ( = ?auto_455557 ?auto_455558 ) ) ( not ( = ?auto_455557 ?auto_455559 ) ) ( not ( = ?auto_455557 ?auto_455560 ) ) ( not ( = ?auto_455557 ?auto_455561 ) ) ( not ( = ?auto_455557 ?auto_455562 ) ) ( not ( = ?auto_455557 ?auto_455563 ) ) ( not ( = ?auto_455557 ?auto_455564 ) ) ( not ( = ?auto_455557 ?auto_455565 ) ) ( not ( = ?auto_455557 ?auto_455566 ) ) ( not ( = ?auto_455558 ?auto_455559 ) ) ( not ( = ?auto_455558 ?auto_455560 ) ) ( not ( = ?auto_455558 ?auto_455561 ) ) ( not ( = ?auto_455558 ?auto_455562 ) ) ( not ( = ?auto_455558 ?auto_455563 ) ) ( not ( = ?auto_455558 ?auto_455564 ) ) ( not ( = ?auto_455558 ?auto_455565 ) ) ( not ( = ?auto_455558 ?auto_455566 ) ) ( not ( = ?auto_455559 ?auto_455560 ) ) ( not ( = ?auto_455559 ?auto_455561 ) ) ( not ( = ?auto_455559 ?auto_455562 ) ) ( not ( = ?auto_455559 ?auto_455563 ) ) ( not ( = ?auto_455559 ?auto_455564 ) ) ( not ( = ?auto_455559 ?auto_455565 ) ) ( not ( = ?auto_455559 ?auto_455566 ) ) ( not ( = ?auto_455560 ?auto_455561 ) ) ( not ( = ?auto_455560 ?auto_455562 ) ) ( not ( = ?auto_455560 ?auto_455563 ) ) ( not ( = ?auto_455560 ?auto_455564 ) ) ( not ( = ?auto_455560 ?auto_455565 ) ) ( not ( = ?auto_455560 ?auto_455566 ) ) ( not ( = ?auto_455561 ?auto_455562 ) ) ( not ( = ?auto_455561 ?auto_455563 ) ) ( not ( = ?auto_455561 ?auto_455564 ) ) ( not ( = ?auto_455561 ?auto_455565 ) ) ( not ( = ?auto_455561 ?auto_455566 ) ) ( not ( = ?auto_455562 ?auto_455563 ) ) ( not ( = ?auto_455562 ?auto_455564 ) ) ( not ( = ?auto_455562 ?auto_455565 ) ) ( not ( = ?auto_455562 ?auto_455566 ) ) ( not ( = ?auto_455563 ?auto_455564 ) ) ( not ( = ?auto_455563 ?auto_455565 ) ) ( not ( = ?auto_455563 ?auto_455566 ) ) ( not ( = ?auto_455564 ?auto_455565 ) ) ( not ( = ?auto_455564 ?auto_455566 ) ) ( not ( = ?auto_455565 ?auto_455566 ) ) ( ON ?auto_455564 ?auto_455565 ) ( ON ?auto_455563 ?auto_455564 ) ( ON ?auto_455562 ?auto_455563 ) ( CLEAR ?auto_455560 ) ( ON ?auto_455561 ?auto_455562 ) ( CLEAR ?auto_455561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_455557 ?auto_455558 ?auto_455559 ?auto_455560 ?auto_455561 )
      ( MAKE-9PILE ?auto_455557 ?auto_455558 ?auto_455559 ?auto_455560 ?auto_455561 ?auto_455562 ?auto_455563 ?auto_455564 ?auto_455565 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_455595 - BLOCK
      ?auto_455596 - BLOCK
      ?auto_455597 - BLOCK
      ?auto_455598 - BLOCK
      ?auto_455599 - BLOCK
      ?auto_455600 - BLOCK
      ?auto_455601 - BLOCK
      ?auto_455602 - BLOCK
      ?auto_455603 - BLOCK
    )
    :vars
    (
      ?auto_455604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455603 ?auto_455604 ) ( ON-TABLE ?auto_455595 ) ( ON ?auto_455596 ?auto_455595 ) ( ON ?auto_455597 ?auto_455596 ) ( not ( = ?auto_455595 ?auto_455596 ) ) ( not ( = ?auto_455595 ?auto_455597 ) ) ( not ( = ?auto_455595 ?auto_455598 ) ) ( not ( = ?auto_455595 ?auto_455599 ) ) ( not ( = ?auto_455595 ?auto_455600 ) ) ( not ( = ?auto_455595 ?auto_455601 ) ) ( not ( = ?auto_455595 ?auto_455602 ) ) ( not ( = ?auto_455595 ?auto_455603 ) ) ( not ( = ?auto_455595 ?auto_455604 ) ) ( not ( = ?auto_455596 ?auto_455597 ) ) ( not ( = ?auto_455596 ?auto_455598 ) ) ( not ( = ?auto_455596 ?auto_455599 ) ) ( not ( = ?auto_455596 ?auto_455600 ) ) ( not ( = ?auto_455596 ?auto_455601 ) ) ( not ( = ?auto_455596 ?auto_455602 ) ) ( not ( = ?auto_455596 ?auto_455603 ) ) ( not ( = ?auto_455596 ?auto_455604 ) ) ( not ( = ?auto_455597 ?auto_455598 ) ) ( not ( = ?auto_455597 ?auto_455599 ) ) ( not ( = ?auto_455597 ?auto_455600 ) ) ( not ( = ?auto_455597 ?auto_455601 ) ) ( not ( = ?auto_455597 ?auto_455602 ) ) ( not ( = ?auto_455597 ?auto_455603 ) ) ( not ( = ?auto_455597 ?auto_455604 ) ) ( not ( = ?auto_455598 ?auto_455599 ) ) ( not ( = ?auto_455598 ?auto_455600 ) ) ( not ( = ?auto_455598 ?auto_455601 ) ) ( not ( = ?auto_455598 ?auto_455602 ) ) ( not ( = ?auto_455598 ?auto_455603 ) ) ( not ( = ?auto_455598 ?auto_455604 ) ) ( not ( = ?auto_455599 ?auto_455600 ) ) ( not ( = ?auto_455599 ?auto_455601 ) ) ( not ( = ?auto_455599 ?auto_455602 ) ) ( not ( = ?auto_455599 ?auto_455603 ) ) ( not ( = ?auto_455599 ?auto_455604 ) ) ( not ( = ?auto_455600 ?auto_455601 ) ) ( not ( = ?auto_455600 ?auto_455602 ) ) ( not ( = ?auto_455600 ?auto_455603 ) ) ( not ( = ?auto_455600 ?auto_455604 ) ) ( not ( = ?auto_455601 ?auto_455602 ) ) ( not ( = ?auto_455601 ?auto_455603 ) ) ( not ( = ?auto_455601 ?auto_455604 ) ) ( not ( = ?auto_455602 ?auto_455603 ) ) ( not ( = ?auto_455602 ?auto_455604 ) ) ( not ( = ?auto_455603 ?auto_455604 ) ) ( ON ?auto_455602 ?auto_455603 ) ( ON ?auto_455601 ?auto_455602 ) ( ON ?auto_455600 ?auto_455601 ) ( ON ?auto_455599 ?auto_455600 ) ( CLEAR ?auto_455597 ) ( ON ?auto_455598 ?auto_455599 ) ( CLEAR ?auto_455598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_455595 ?auto_455596 ?auto_455597 ?auto_455598 )
      ( MAKE-9PILE ?auto_455595 ?auto_455596 ?auto_455597 ?auto_455598 ?auto_455599 ?auto_455600 ?auto_455601 ?auto_455602 ?auto_455603 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_455633 - BLOCK
      ?auto_455634 - BLOCK
      ?auto_455635 - BLOCK
      ?auto_455636 - BLOCK
      ?auto_455637 - BLOCK
      ?auto_455638 - BLOCK
      ?auto_455639 - BLOCK
      ?auto_455640 - BLOCK
      ?auto_455641 - BLOCK
    )
    :vars
    (
      ?auto_455642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455641 ?auto_455642 ) ( ON-TABLE ?auto_455633 ) ( ON ?auto_455634 ?auto_455633 ) ( not ( = ?auto_455633 ?auto_455634 ) ) ( not ( = ?auto_455633 ?auto_455635 ) ) ( not ( = ?auto_455633 ?auto_455636 ) ) ( not ( = ?auto_455633 ?auto_455637 ) ) ( not ( = ?auto_455633 ?auto_455638 ) ) ( not ( = ?auto_455633 ?auto_455639 ) ) ( not ( = ?auto_455633 ?auto_455640 ) ) ( not ( = ?auto_455633 ?auto_455641 ) ) ( not ( = ?auto_455633 ?auto_455642 ) ) ( not ( = ?auto_455634 ?auto_455635 ) ) ( not ( = ?auto_455634 ?auto_455636 ) ) ( not ( = ?auto_455634 ?auto_455637 ) ) ( not ( = ?auto_455634 ?auto_455638 ) ) ( not ( = ?auto_455634 ?auto_455639 ) ) ( not ( = ?auto_455634 ?auto_455640 ) ) ( not ( = ?auto_455634 ?auto_455641 ) ) ( not ( = ?auto_455634 ?auto_455642 ) ) ( not ( = ?auto_455635 ?auto_455636 ) ) ( not ( = ?auto_455635 ?auto_455637 ) ) ( not ( = ?auto_455635 ?auto_455638 ) ) ( not ( = ?auto_455635 ?auto_455639 ) ) ( not ( = ?auto_455635 ?auto_455640 ) ) ( not ( = ?auto_455635 ?auto_455641 ) ) ( not ( = ?auto_455635 ?auto_455642 ) ) ( not ( = ?auto_455636 ?auto_455637 ) ) ( not ( = ?auto_455636 ?auto_455638 ) ) ( not ( = ?auto_455636 ?auto_455639 ) ) ( not ( = ?auto_455636 ?auto_455640 ) ) ( not ( = ?auto_455636 ?auto_455641 ) ) ( not ( = ?auto_455636 ?auto_455642 ) ) ( not ( = ?auto_455637 ?auto_455638 ) ) ( not ( = ?auto_455637 ?auto_455639 ) ) ( not ( = ?auto_455637 ?auto_455640 ) ) ( not ( = ?auto_455637 ?auto_455641 ) ) ( not ( = ?auto_455637 ?auto_455642 ) ) ( not ( = ?auto_455638 ?auto_455639 ) ) ( not ( = ?auto_455638 ?auto_455640 ) ) ( not ( = ?auto_455638 ?auto_455641 ) ) ( not ( = ?auto_455638 ?auto_455642 ) ) ( not ( = ?auto_455639 ?auto_455640 ) ) ( not ( = ?auto_455639 ?auto_455641 ) ) ( not ( = ?auto_455639 ?auto_455642 ) ) ( not ( = ?auto_455640 ?auto_455641 ) ) ( not ( = ?auto_455640 ?auto_455642 ) ) ( not ( = ?auto_455641 ?auto_455642 ) ) ( ON ?auto_455640 ?auto_455641 ) ( ON ?auto_455639 ?auto_455640 ) ( ON ?auto_455638 ?auto_455639 ) ( ON ?auto_455637 ?auto_455638 ) ( ON ?auto_455636 ?auto_455637 ) ( CLEAR ?auto_455634 ) ( ON ?auto_455635 ?auto_455636 ) ( CLEAR ?auto_455635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_455633 ?auto_455634 ?auto_455635 )
      ( MAKE-9PILE ?auto_455633 ?auto_455634 ?auto_455635 ?auto_455636 ?auto_455637 ?auto_455638 ?auto_455639 ?auto_455640 ?auto_455641 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_455671 - BLOCK
      ?auto_455672 - BLOCK
      ?auto_455673 - BLOCK
      ?auto_455674 - BLOCK
      ?auto_455675 - BLOCK
      ?auto_455676 - BLOCK
      ?auto_455677 - BLOCK
      ?auto_455678 - BLOCK
      ?auto_455679 - BLOCK
    )
    :vars
    (
      ?auto_455680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455679 ?auto_455680 ) ( ON-TABLE ?auto_455671 ) ( not ( = ?auto_455671 ?auto_455672 ) ) ( not ( = ?auto_455671 ?auto_455673 ) ) ( not ( = ?auto_455671 ?auto_455674 ) ) ( not ( = ?auto_455671 ?auto_455675 ) ) ( not ( = ?auto_455671 ?auto_455676 ) ) ( not ( = ?auto_455671 ?auto_455677 ) ) ( not ( = ?auto_455671 ?auto_455678 ) ) ( not ( = ?auto_455671 ?auto_455679 ) ) ( not ( = ?auto_455671 ?auto_455680 ) ) ( not ( = ?auto_455672 ?auto_455673 ) ) ( not ( = ?auto_455672 ?auto_455674 ) ) ( not ( = ?auto_455672 ?auto_455675 ) ) ( not ( = ?auto_455672 ?auto_455676 ) ) ( not ( = ?auto_455672 ?auto_455677 ) ) ( not ( = ?auto_455672 ?auto_455678 ) ) ( not ( = ?auto_455672 ?auto_455679 ) ) ( not ( = ?auto_455672 ?auto_455680 ) ) ( not ( = ?auto_455673 ?auto_455674 ) ) ( not ( = ?auto_455673 ?auto_455675 ) ) ( not ( = ?auto_455673 ?auto_455676 ) ) ( not ( = ?auto_455673 ?auto_455677 ) ) ( not ( = ?auto_455673 ?auto_455678 ) ) ( not ( = ?auto_455673 ?auto_455679 ) ) ( not ( = ?auto_455673 ?auto_455680 ) ) ( not ( = ?auto_455674 ?auto_455675 ) ) ( not ( = ?auto_455674 ?auto_455676 ) ) ( not ( = ?auto_455674 ?auto_455677 ) ) ( not ( = ?auto_455674 ?auto_455678 ) ) ( not ( = ?auto_455674 ?auto_455679 ) ) ( not ( = ?auto_455674 ?auto_455680 ) ) ( not ( = ?auto_455675 ?auto_455676 ) ) ( not ( = ?auto_455675 ?auto_455677 ) ) ( not ( = ?auto_455675 ?auto_455678 ) ) ( not ( = ?auto_455675 ?auto_455679 ) ) ( not ( = ?auto_455675 ?auto_455680 ) ) ( not ( = ?auto_455676 ?auto_455677 ) ) ( not ( = ?auto_455676 ?auto_455678 ) ) ( not ( = ?auto_455676 ?auto_455679 ) ) ( not ( = ?auto_455676 ?auto_455680 ) ) ( not ( = ?auto_455677 ?auto_455678 ) ) ( not ( = ?auto_455677 ?auto_455679 ) ) ( not ( = ?auto_455677 ?auto_455680 ) ) ( not ( = ?auto_455678 ?auto_455679 ) ) ( not ( = ?auto_455678 ?auto_455680 ) ) ( not ( = ?auto_455679 ?auto_455680 ) ) ( ON ?auto_455678 ?auto_455679 ) ( ON ?auto_455677 ?auto_455678 ) ( ON ?auto_455676 ?auto_455677 ) ( ON ?auto_455675 ?auto_455676 ) ( ON ?auto_455674 ?auto_455675 ) ( ON ?auto_455673 ?auto_455674 ) ( CLEAR ?auto_455671 ) ( ON ?auto_455672 ?auto_455673 ) ( CLEAR ?auto_455672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_455671 ?auto_455672 )
      ( MAKE-9PILE ?auto_455671 ?auto_455672 ?auto_455673 ?auto_455674 ?auto_455675 ?auto_455676 ?auto_455677 ?auto_455678 ?auto_455679 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_455709 - BLOCK
      ?auto_455710 - BLOCK
      ?auto_455711 - BLOCK
      ?auto_455712 - BLOCK
      ?auto_455713 - BLOCK
      ?auto_455714 - BLOCK
      ?auto_455715 - BLOCK
      ?auto_455716 - BLOCK
      ?auto_455717 - BLOCK
    )
    :vars
    (
      ?auto_455718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455717 ?auto_455718 ) ( not ( = ?auto_455709 ?auto_455710 ) ) ( not ( = ?auto_455709 ?auto_455711 ) ) ( not ( = ?auto_455709 ?auto_455712 ) ) ( not ( = ?auto_455709 ?auto_455713 ) ) ( not ( = ?auto_455709 ?auto_455714 ) ) ( not ( = ?auto_455709 ?auto_455715 ) ) ( not ( = ?auto_455709 ?auto_455716 ) ) ( not ( = ?auto_455709 ?auto_455717 ) ) ( not ( = ?auto_455709 ?auto_455718 ) ) ( not ( = ?auto_455710 ?auto_455711 ) ) ( not ( = ?auto_455710 ?auto_455712 ) ) ( not ( = ?auto_455710 ?auto_455713 ) ) ( not ( = ?auto_455710 ?auto_455714 ) ) ( not ( = ?auto_455710 ?auto_455715 ) ) ( not ( = ?auto_455710 ?auto_455716 ) ) ( not ( = ?auto_455710 ?auto_455717 ) ) ( not ( = ?auto_455710 ?auto_455718 ) ) ( not ( = ?auto_455711 ?auto_455712 ) ) ( not ( = ?auto_455711 ?auto_455713 ) ) ( not ( = ?auto_455711 ?auto_455714 ) ) ( not ( = ?auto_455711 ?auto_455715 ) ) ( not ( = ?auto_455711 ?auto_455716 ) ) ( not ( = ?auto_455711 ?auto_455717 ) ) ( not ( = ?auto_455711 ?auto_455718 ) ) ( not ( = ?auto_455712 ?auto_455713 ) ) ( not ( = ?auto_455712 ?auto_455714 ) ) ( not ( = ?auto_455712 ?auto_455715 ) ) ( not ( = ?auto_455712 ?auto_455716 ) ) ( not ( = ?auto_455712 ?auto_455717 ) ) ( not ( = ?auto_455712 ?auto_455718 ) ) ( not ( = ?auto_455713 ?auto_455714 ) ) ( not ( = ?auto_455713 ?auto_455715 ) ) ( not ( = ?auto_455713 ?auto_455716 ) ) ( not ( = ?auto_455713 ?auto_455717 ) ) ( not ( = ?auto_455713 ?auto_455718 ) ) ( not ( = ?auto_455714 ?auto_455715 ) ) ( not ( = ?auto_455714 ?auto_455716 ) ) ( not ( = ?auto_455714 ?auto_455717 ) ) ( not ( = ?auto_455714 ?auto_455718 ) ) ( not ( = ?auto_455715 ?auto_455716 ) ) ( not ( = ?auto_455715 ?auto_455717 ) ) ( not ( = ?auto_455715 ?auto_455718 ) ) ( not ( = ?auto_455716 ?auto_455717 ) ) ( not ( = ?auto_455716 ?auto_455718 ) ) ( not ( = ?auto_455717 ?auto_455718 ) ) ( ON ?auto_455716 ?auto_455717 ) ( ON ?auto_455715 ?auto_455716 ) ( ON ?auto_455714 ?auto_455715 ) ( ON ?auto_455713 ?auto_455714 ) ( ON ?auto_455712 ?auto_455713 ) ( ON ?auto_455711 ?auto_455712 ) ( ON ?auto_455710 ?auto_455711 ) ( ON ?auto_455709 ?auto_455710 ) ( CLEAR ?auto_455709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_455709 )
      ( MAKE-9PILE ?auto_455709 ?auto_455710 ?auto_455711 ?auto_455712 ?auto_455713 ?auto_455714 ?auto_455715 ?auto_455716 ?auto_455717 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_455748 - BLOCK
      ?auto_455749 - BLOCK
      ?auto_455750 - BLOCK
      ?auto_455751 - BLOCK
      ?auto_455752 - BLOCK
      ?auto_455753 - BLOCK
      ?auto_455754 - BLOCK
      ?auto_455755 - BLOCK
      ?auto_455756 - BLOCK
      ?auto_455757 - BLOCK
    )
    :vars
    (
      ?auto_455758 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_455756 ) ( ON ?auto_455757 ?auto_455758 ) ( CLEAR ?auto_455757 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_455748 ) ( ON ?auto_455749 ?auto_455748 ) ( ON ?auto_455750 ?auto_455749 ) ( ON ?auto_455751 ?auto_455750 ) ( ON ?auto_455752 ?auto_455751 ) ( ON ?auto_455753 ?auto_455752 ) ( ON ?auto_455754 ?auto_455753 ) ( ON ?auto_455755 ?auto_455754 ) ( ON ?auto_455756 ?auto_455755 ) ( not ( = ?auto_455748 ?auto_455749 ) ) ( not ( = ?auto_455748 ?auto_455750 ) ) ( not ( = ?auto_455748 ?auto_455751 ) ) ( not ( = ?auto_455748 ?auto_455752 ) ) ( not ( = ?auto_455748 ?auto_455753 ) ) ( not ( = ?auto_455748 ?auto_455754 ) ) ( not ( = ?auto_455748 ?auto_455755 ) ) ( not ( = ?auto_455748 ?auto_455756 ) ) ( not ( = ?auto_455748 ?auto_455757 ) ) ( not ( = ?auto_455748 ?auto_455758 ) ) ( not ( = ?auto_455749 ?auto_455750 ) ) ( not ( = ?auto_455749 ?auto_455751 ) ) ( not ( = ?auto_455749 ?auto_455752 ) ) ( not ( = ?auto_455749 ?auto_455753 ) ) ( not ( = ?auto_455749 ?auto_455754 ) ) ( not ( = ?auto_455749 ?auto_455755 ) ) ( not ( = ?auto_455749 ?auto_455756 ) ) ( not ( = ?auto_455749 ?auto_455757 ) ) ( not ( = ?auto_455749 ?auto_455758 ) ) ( not ( = ?auto_455750 ?auto_455751 ) ) ( not ( = ?auto_455750 ?auto_455752 ) ) ( not ( = ?auto_455750 ?auto_455753 ) ) ( not ( = ?auto_455750 ?auto_455754 ) ) ( not ( = ?auto_455750 ?auto_455755 ) ) ( not ( = ?auto_455750 ?auto_455756 ) ) ( not ( = ?auto_455750 ?auto_455757 ) ) ( not ( = ?auto_455750 ?auto_455758 ) ) ( not ( = ?auto_455751 ?auto_455752 ) ) ( not ( = ?auto_455751 ?auto_455753 ) ) ( not ( = ?auto_455751 ?auto_455754 ) ) ( not ( = ?auto_455751 ?auto_455755 ) ) ( not ( = ?auto_455751 ?auto_455756 ) ) ( not ( = ?auto_455751 ?auto_455757 ) ) ( not ( = ?auto_455751 ?auto_455758 ) ) ( not ( = ?auto_455752 ?auto_455753 ) ) ( not ( = ?auto_455752 ?auto_455754 ) ) ( not ( = ?auto_455752 ?auto_455755 ) ) ( not ( = ?auto_455752 ?auto_455756 ) ) ( not ( = ?auto_455752 ?auto_455757 ) ) ( not ( = ?auto_455752 ?auto_455758 ) ) ( not ( = ?auto_455753 ?auto_455754 ) ) ( not ( = ?auto_455753 ?auto_455755 ) ) ( not ( = ?auto_455753 ?auto_455756 ) ) ( not ( = ?auto_455753 ?auto_455757 ) ) ( not ( = ?auto_455753 ?auto_455758 ) ) ( not ( = ?auto_455754 ?auto_455755 ) ) ( not ( = ?auto_455754 ?auto_455756 ) ) ( not ( = ?auto_455754 ?auto_455757 ) ) ( not ( = ?auto_455754 ?auto_455758 ) ) ( not ( = ?auto_455755 ?auto_455756 ) ) ( not ( = ?auto_455755 ?auto_455757 ) ) ( not ( = ?auto_455755 ?auto_455758 ) ) ( not ( = ?auto_455756 ?auto_455757 ) ) ( not ( = ?auto_455756 ?auto_455758 ) ) ( not ( = ?auto_455757 ?auto_455758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_455757 ?auto_455758 )
      ( !STACK ?auto_455757 ?auto_455756 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_455790 - BLOCK
      ?auto_455791 - BLOCK
      ?auto_455792 - BLOCK
      ?auto_455793 - BLOCK
      ?auto_455794 - BLOCK
      ?auto_455795 - BLOCK
      ?auto_455796 - BLOCK
      ?auto_455797 - BLOCK
      ?auto_455798 - BLOCK
      ?auto_455799 - BLOCK
    )
    :vars
    (
      ?auto_455800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455799 ?auto_455800 ) ( ON-TABLE ?auto_455790 ) ( ON ?auto_455791 ?auto_455790 ) ( ON ?auto_455792 ?auto_455791 ) ( ON ?auto_455793 ?auto_455792 ) ( ON ?auto_455794 ?auto_455793 ) ( ON ?auto_455795 ?auto_455794 ) ( ON ?auto_455796 ?auto_455795 ) ( ON ?auto_455797 ?auto_455796 ) ( not ( = ?auto_455790 ?auto_455791 ) ) ( not ( = ?auto_455790 ?auto_455792 ) ) ( not ( = ?auto_455790 ?auto_455793 ) ) ( not ( = ?auto_455790 ?auto_455794 ) ) ( not ( = ?auto_455790 ?auto_455795 ) ) ( not ( = ?auto_455790 ?auto_455796 ) ) ( not ( = ?auto_455790 ?auto_455797 ) ) ( not ( = ?auto_455790 ?auto_455798 ) ) ( not ( = ?auto_455790 ?auto_455799 ) ) ( not ( = ?auto_455790 ?auto_455800 ) ) ( not ( = ?auto_455791 ?auto_455792 ) ) ( not ( = ?auto_455791 ?auto_455793 ) ) ( not ( = ?auto_455791 ?auto_455794 ) ) ( not ( = ?auto_455791 ?auto_455795 ) ) ( not ( = ?auto_455791 ?auto_455796 ) ) ( not ( = ?auto_455791 ?auto_455797 ) ) ( not ( = ?auto_455791 ?auto_455798 ) ) ( not ( = ?auto_455791 ?auto_455799 ) ) ( not ( = ?auto_455791 ?auto_455800 ) ) ( not ( = ?auto_455792 ?auto_455793 ) ) ( not ( = ?auto_455792 ?auto_455794 ) ) ( not ( = ?auto_455792 ?auto_455795 ) ) ( not ( = ?auto_455792 ?auto_455796 ) ) ( not ( = ?auto_455792 ?auto_455797 ) ) ( not ( = ?auto_455792 ?auto_455798 ) ) ( not ( = ?auto_455792 ?auto_455799 ) ) ( not ( = ?auto_455792 ?auto_455800 ) ) ( not ( = ?auto_455793 ?auto_455794 ) ) ( not ( = ?auto_455793 ?auto_455795 ) ) ( not ( = ?auto_455793 ?auto_455796 ) ) ( not ( = ?auto_455793 ?auto_455797 ) ) ( not ( = ?auto_455793 ?auto_455798 ) ) ( not ( = ?auto_455793 ?auto_455799 ) ) ( not ( = ?auto_455793 ?auto_455800 ) ) ( not ( = ?auto_455794 ?auto_455795 ) ) ( not ( = ?auto_455794 ?auto_455796 ) ) ( not ( = ?auto_455794 ?auto_455797 ) ) ( not ( = ?auto_455794 ?auto_455798 ) ) ( not ( = ?auto_455794 ?auto_455799 ) ) ( not ( = ?auto_455794 ?auto_455800 ) ) ( not ( = ?auto_455795 ?auto_455796 ) ) ( not ( = ?auto_455795 ?auto_455797 ) ) ( not ( = ?auto_455795 ?auto_455798 ) ) ( not ( = ?auto_455795 ?auto_455799 ) ) ( not ( = ?auto_455795 ?auto_455800 ) ) ( not ( = ?auto_455796 ?auto_455797 ) ) ( not ( = ?auto_455796 ?auto_455798 ) ) ( not ( = ?auto_455796 ?auto_455799 ) ) ( not ( = ?auto_455796 ?auto_455800 ) ) ( not ( = ?auto_455797 ?auto_455798 ) ) ( not ( = ?auto_455797 ?auto_455799 ) ) ( not ( = ?auto_455797 ?auto_455800 ) ) ( not ( = ?auto_455798 ?auto_455799 ) ) ( not ( = ?auto_455798 ?auto_455800 ) ) ( not ( = ?auto_455799 ?auto_455800 ) ) ( CLEAR ?auto_455797 ) ( ON ?auto_455798 ?auto_455799 ) ( CLEAR ?auto_455798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_455790 ?auto_455791 ?auto_455792 ?auto_455793 ?auto_455794 ?auto_455795 ?auto_455796 ?auto_455797 ?auto_455798 )
      ( MAKE-10PILE ?auto_455790 ?auto_455791 ?auto_455792 ?auto_455793 ?auto_455794 ?auto_455795 ?auto_455796 ?auto_455797 ?auto_455798 ?auto_455799 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_455832 - BLOCK
      ?auto_455833 - BLOCK
      ?auto_455834 - BLOCK
      ?auto_455835 - BLOCK
      ?auto_455836 - BLOCK
      ?auto_455837 - BLOCK
      ?auto_455838 - BLOCK
      ?auto_455839 - BLOCK
      ?auto_455840 - BLOCK
      ?auto_455841 - BLOCK
    )
    :vars
    (
      ?auto_455842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455841 ?auto_455842 ) ( ON-TABLE ?auto_455832 ) ( ON ?auto_455833 ?auto_455832 ) ( ON ?auto_455834 ?auto_455833 ) ( ON ?auto_455835 ?auto_455834 ) ( ON ?auto_455836 ?auto_455835 ) ( ON ?auto_455837 ?auto_455836 ) ( ON ?auto_455838 ?auto_455837 ) ( not ( = ?auto_455832 ?auto_455833 ) ) ( not ( = ?auto_455832 ?auto_455834 ) ) ( not ( = ?auto_455832 ?auto_455835 ) ) ( not ( = ?auto_455832 ?auto_455836 ) ) ( not ( = ?auto_455832 ?auto_455837 ) ) ( not ( = ?auto_455832 ?auto_455838 ) ) ( not ( = ?auto_455832 ?auto_455839 ) ) ( not ( = ?auto_455832 ?auto_455840 ) ) ( not ( = ?auto_455832 ?auto_455841 ) ) ( not ( = ?auto_455832 ?auto_455842 ) ) ( not ( = ?auto_455833 ?auto_455834 ) ) ( not ( = ?auto_455833 ?auto_455835 ) ) ( not ( = ?auto_455833 ?auto_455836 ) ) ( not ( = ?auto_455833 ?auto_455837 ) ) ( not ( = ?auto_455833 ?auto_455838 ) ) ( not ( = ?auto_455833 ?auto_455839 ) ) ( not ( = ?auto_455833 ?auto_455840 ) ) ( not ( = ?auto_455833 ?auto_455841 ) ) ( not ( = ?auto_455833 ?auto_455842 ) ) ( not ( = ?auto_455834 ?auto_455835 ) ) ( not ( = ?auto_455834 ?auto_455836 ) ) ( not ( = ?auto_455834 ?auto_455837 ) ) ( not ( = ?auto_455834 ?auto_455838 ) ) ( not ( = ?auto_455834 ?auto_455839 ) ) ( not ( = ?auto_455834 ?auto_455840 ) ) ( not ( = ?auto_455834 ?auto_455841 ) ) ( not ( = ?auto_455834 ?auto_455842 ) ) ( not ( = ?auto_455835 ?auto_455836 ) ) ( not ( = ?auto_455835 ?auto_455837 ) ) ( not ( = ?auto_455835 ?auto_455838 ) ) ( not ( = ?auto_455835 ?auto_455839 ) ) ( not ( = ?auto_455835 ?auto_455840 ) ) ( not ( = ?auto_455835 ?auto_455841 ) ) ( not ( = ?auto_455835 ?auto_455842 ) ) ( not ( = ?auto_455836 ?auto_455837 ) ) ( not ( = ?auto_455836 ?auto_455838 ) ) ( not ( = ?auto_455836 ?auto_455839 ) ) ( not ( = ?auto_455836 ?auto_455840 ) ) ( not ( = ?auto_455836 ?auto_455841 ) ) ( not ( = ?auto_455836 ?auto_455842 ) ) ( not ( = ?auto_455837 ?auto_455838 ) ) ( not ( = ?auto_455837 ?auto_455839 ) ) ( not ( = ?auto_455837 ?auto_455840 ) ) ( not ( = ?auto_455837 ?auto_455841 ) ) ( not ( = ?auto_455837 ?auto_455842 ) ) ( not ( = ?auto_455838 ?auto_455839 ) ) ( not ( = ?auto_455838 ?auto_455840 ) ) ( not ( = ?auto_455838 ?auto_455841 ) ) ( not ( = ?auto_455838 ?auto_455842 ) ) ( not ( = ?auto_455839 ?auto_455840 ) ) ( not ( = ?auto_455839 ?auto_455841 ) ) ( not ( = ?auto_455839 ?auto_455842 ) ) ( not ( = ?auto_455840 ?auto_455841 ) ) ( not ( = ?auto_455840 ?auto_455842 ) ) ( not ( = ?auto_455841 ?auto_455842 ) ) ( ON ?auto_455840 ?auto_455841 ) ( CLEAR ?auto_455838 ) ( ON ?auto_455839 ?auto_455840 ) ( CLEAR ?auto_455839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_455832 ?auto_455833 ?auto_455834 ?auto_455835 ?auto_455836 ?auto_455837 ?auto_455838 ?auto_455839 )
      ( MAKE-10PILE ?auto_455832 ?auto_455833 ?auto_455834 ?auto_455835 ?auto_455836 ?auto_455837 ?auto_455838 ?auto_455839 ?auto_455840 ?auto_455841 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_455874 - BLOCK
      ?auto_455875 - BLOCK
      ?auto_455876 - BLOCK
      ?auto_455877 - BLOCK
      ?auto_455878 - BLOCK
      ?auto_455879 - BLOCK
      ?auto_455880 - BLOCK
      ?auto_455881 - BLOCK
      ?auto_455882 - BLOCK
      ?auto_455883 - BLOCK
    )
    :vars
    (
      ?auto_455884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455883 ?auto_455884 ) ( ON-TABLE ?auto_455874 ) ( ON ?auto_455875 ?auto_455874 ) ( ON ?auto_455876 ?auto_455875 ) ( ON ?auto_455877 ?auto_455876 ) ( ON ?auto_455878 ?auto_455877 ) ( ON ?auto_455879 ?auto_455878 ) ( not ( = ?auto_455874 ?auto_455875 ) ) ( not ( = ?auto_455874 ?auto_455876 ) ) ( not ( = ?auto_455874 ?auto_455877 ) ) ( not ( = ?auto_455874 ?auto_455878 ) ) ( not ( = ?auto_455874 ?auto_455879 ) ) ( not ( = ?auto_455874 ?auto_455880 ) ) ( not ( = ?auto_455874 ?auto_455881 ) ) ( not ( = ?auto_455874 ?auto_455882 ) ) ( not ( = ?auto_455874 ?auto_455883 ) ) ( not ( = ?auto_455874 ?auto_455884 ) ) ( not ( = ?auto_455875 ?auto_455876 ) ) ( not ( = ?auto_455875 ?auto_455877 ) ) ( not ( = ?auto_455875 ?auto_455878 ) ) ( not ( = ?auto_455875 ?auto_455879 ) ) ( not ( = ?auto_455875 ?auto_455880 ) ) ( not ( = ?auto_455875 ?auto_455881 ) ) ( not ( = ?auto_455875 ?auto_455882 ) ) ( not ( = ?auto_455875 ?auto_455883 ) ) ( not ( = ?auto_455875 ?auto_455884 ) ) ( not ( = ?auto_455876 ?auto_455877 ) ) ( not ( = ?auto_455876 ?auto_455878 ) ) ( not ( = ?auto_455876 ?auto_455879 ) ) ( not ( = ?auto_455876 ?auto_455880 ) ) ( not ( = ?auto_455876 ?auto_455881 ) ) ( not ( = ?auto_455876 ?auto_455882 ) ) ( not ( = ?auto_455876 ?auto_455883 ) ) ( not ( = ?auto_455876 ?auto_455884 ) ) ( not ( = ?auto_455877 ?auto_455878 ) ) ( not ( = ?auto_455877 ?auto_455879 ) ) ( not ( = ?auto_455877 ?auto_455880 ) ) ( not ( = ?auto_455877 ?auto_455881 ) ) ( not ( = ?auto_455877 ?auto_455882 ) ) ( not ( = ?auto_455877 ?auto_455883 ) ) ( not ( = ?auto_455877 ?auto_455884 ) ) ( not ( = ?auto_455878 ?auto_455879 ) ) ( not ( = ?auto_455878 ?auto_455880 ) ) ( not ( = ?auto_455878 ?auto_455881 ) ) ( not ( = ?auto_455878 ?auto_455882 ) ) ( not ( = ?auto_455878 ?auto_455883 ) ) ( not ( = ?auto_455878 ?auto_455884 ) ) ( not ( = ?auto_455879 ?auto_455880 ) ) ( not ( = ?auto_455879 ?auto_455881 ) ) ( not ( = ?auto_455879 ?auto_455882 ) ) ( not ( = ?auto_455879 ?auto_455883 ) ) ( not ( = ?auto_455879 ?auto_455884 ) ) ( not ( = ?auto_455880 ?auto_455881 ) ) ( not ( = ?auto_455880 ?auto_455882 ) ) ( not ( = ?auto_455880 ?auto_455883 ) ) ( not ( = ?auto_455880 ?auto_455884 ) ) ( not ( = ?auto_455881 ?auto_455882 ) ) ( not ( = ?auto_455881 ?auto_455883 ) ) ( not ( = ?auto_455881 ?auto_455884 ) ) ( not ( = ?auto_455882 ?auto_455883 ) ) ( not ( = ?auto_455882 ?auto_455884 ) ) ( not ( = ?auto_455883 ?auto_455884 ) ) ( ON ?auto_455882 ?auto_455883 ) ( ON ?auto_455881 ?auto_455882 ) ( CLEAR ?auto_455879 ) ( ON ?auto_455880 ?auto_455881 ) ( CLEAR ?auto_455880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_455874 ?auto_455875 ?auto_455876 ?auto_455877 ?auto_455878 ?auto_455879 ?auto_455880 )
      ( MAKE-10PILE ?auto_455874 ?auto_455875 ?auto_455876 ?auto_455877 ?auto_455878 ?auto_455879 ?auto_455880 ?auto_455881 ?auto_455882 ?auto_455883 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_455916 - BLOCK
      ?auto_455917 - BLOCK
      ?auto_455918 - BLOCK
      ?auto_455919 - BLOCK
      ?auto_455920 - BLOCK
      ?auto_455921 - BLOCK
      ?auto_455922 - BLOCK
      ?auto_455923 - BLOCK
      ?auto_455924 - BLOCK
      ?auto_455925 - BLOCK
    )
    :vars
    (
      ?auto_455926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455925 ?auto_455926 ) ( ON-TABLE ?auto_455916 ) ( ON ?auto_455917 ?auto_455916 ) ( ON ?auto_455918 ?auto_455917 ) ( ON ?auto_455919 ?auto_455918 ) ( ON ?auto_455920 ?auto_455919 ) ( not ( = ?auto_455916 ?auto_455917 ) ) ( not ( = ?auto_455916 ?auto_455918 ) ) ( not ( = ?auto_455916 ?auto_455919 ) ) ( not ( = ?auto_455916 ?auto_455920 ) ) ( not ( = ?auto_455916 ?auto_455921 ) ) ( not ( = ?auto_455916 ?auto_455922 ) ) ( not ( = ?auto_455916 ?auto_455923 ) ) ( not ( = ?auto_455916 ?auto_455924 ) ) ( not ( = ?auto_455916 ?auto_455925 ) ) ( not ( = ?auto_455916 ?auto_455926 ) ) ( not ( = ?auto_455917 ?auto_455918 ) ) ( not ( = ?auto_455917 ?auto_455919 ) ) ( not ( = ?auto_455917 ?auto_455920 ) ) ( not ( = ?auto_455917 ?auto_455921 ) ) ( not ( = ?auto_455917 ?auto_455922 ) ) ( not ( = ?auto_455917 ?auto_455923 ) ) ( not ( = ?auto_455917 ?auto_455924 ) ) ( not ( = ?auto_455917 ?auto_455925 ) ) ( not ( = ?auto_455917 ?auto_455926 ) ) ( not ( = ?auto_455918 ?auto_455919 ) ) ( not ( = ?auto_455918 ?auto_455920 ) ) ( not ( = ?auto_455918 ?auto_455921 ) ) ( not ( = ?auto_455918 ?auto_455922 ) ) ( not ( = ?auto_455918 ?auto_455923 ) ) ( not ( = ?auto_455918 ?auto_455924 ) ) ( not ( = ?auto_455918 ?auto_455925 ) ) ( not ( = ?auto_455918 ?auto_455926 ) ) ( not ( = ?auto_455919 ?auto_455920 ) ) ( not ( = ?auto_455919 ?auto_455921 ) ) ( not ( = ?auto_455919 ?auto_455922 ) ) ( not ( = ?auto_455919 ?auto_455923 ) ) ( not ( = ?auto_455919 ?auto_455924 ) ) ( not ( = ?auto_455919 ?auto_455925 ) ) ( not ( = ?auto_455919 ?auto_455926 ) ) ( not ( = ?auto_455920 ?auto_455921 ) ) ( not ( = ?auto_455920 ?auto_455922 ) ) ( not ( = ?auto_455920 ?auto_455923 ) ) ( not ( = ?auto_455920 ?auto_455924 ) ) ( not ( = ?auto_455920 ?auto_455925 ) ) ( not ( = ?auto_455920 ?auto_455926 ) ) ( not ( = ?auto_455921 ?auto_455922 ) ) ( not ( = ?auto_455921 ?auto_455923 ) ) ( not ( = ?auto_455921 ?auto_455924 ) ) ( not ( = ?auto_455921 ?auto_455925 ) ) ( not ( = ?auto_455921 ?auto_455926 ) ) ( not ( = ?auto_455922 ?auto_455923 ) ) ( not ( = ?auto_455922 ?auto_455924 ) ) ( not ( = ?auto_455922 ?auto_455925 ) ) ( not ( = ?auto_455922 ?auto_455926 ) ) ( not ( = ?auto_455923 ?auto_455924 ) ) ( not ( = ?auto_455923 ?auto_455925 ) ) ( not ( = ?auto_455923 ?auto_455926 ) ) ( not ( = ?auto_455924 ?auto_455925 ) ) ( not ( = ?auto_455924 ?auto_455926 ) ) ( not ( = ?auto_455925 ?auto_455926 ) ) ( ON ?auto_455924 ?auto_455925 ) ( ON ?auto_455923 ?auto_455924 ) ( ON ?auto_455922 ?auto_455923 ) ( CLEAR ?auto_455920 ) ( ON ?auto_455921 ?auto_455922 ) ( CLEAR ?auto_455921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_455916 ?auto_455917 ?auto_455918 ?auto_455919 ?auto_455920 ?auto_455921 )
      ( MAKE-10PILE ?auto_455916 ?auto_455917 ?auto_455918 ?auto_455919 ?auto_455920 ?auto_455921 ?auto_455922 ?auto_455923 ?auto_455924 ?auto_455925 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_455958 - BLOCK
      ?auto_455959 - BLOCK
      ?auto_455960 - BLOCK
      ?auto_455961 - BLOCK
      ?auto_455962 - BLOCK
      ?auto_455963 - BLOCK
      ?auto_455964 - BLOCK
      ?auto_455965 - BLOCK
      ?auto_455966 - BLOCK
      ?auto_455967 - BLOCK
    )
    :vars
    (
      ?auto_455968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_455967 ?auto_455968 ) ( ON-TABLE ?auto_455958 ) ( ON ?auto_455959 ?auto_455958 ) ( ON ?auto_455960 ?auto_455959 ) ( ON ?auto_455961 ?auto_455960 ) ( not ( = ?auto_455958 ?auto_455959 ) ) ( not ( = ?auto_455958 ?auto_455960 ) ) ( not ( = ?auto_455958 ?auto_455961 ) ) ( not ( = ?auto_455958 ?auto_455962 ) ) ( not ( = ?auto_455958 ?auto_455963 ) ) ( not ( = ?auto_455958 ?auto_455964 ) ) ( not ( = ?auto_455958 ?auto_455965 ) ) ( not ( = ?auto_455958 ?auto_455966 ) ) ( not ( = ?auto_455958 ?auto_455967 ) ) ( not ( = ?auto_455958 ?auto_455968 ) ) ( not ( = ?auto_455959 ?auto_455960 ) ) ( not ( = ?auto_455959 ?auto_455961 ) ) ( not ( = ?auto_455959 ?auto_455962 ) ) ( not ( = ?auto_455959 ?auto_455963 ) ) ( not ( = ?auto_455959 ?auto_455964 ) ) ( not ( = ?auto_455959 ?auto_455965 ) ) ( not ( = ?auto_455959 ?auto_455966 ) ) ( not ( = ?auto_455959 ?auto_455967 ) ) ( not ( = ?auto_455959 ?auto_455968 ) ) ( not ( = ?auto_455960 ?auto_455961 ) ) ( not ( = ?auto_455960 ?auto_455962 ) ) ( not ( = ?auto_455960 ?auto_455963 ) ) ( not ( = ?auto_455960 ?auto_455964 ) ) ( not ( = ?auto_455960 ?auto_455965 ) ) ( not ( = ?auto_455960 ?auto_455966 ) ) ( not ( = ?auto_455960 ?auto_455967 ) ) ( not ( = ?auto_455960 ?auto_455968 ) ) ( not ( = ?auto_455961 ?auto_455962 ) ) ( not ( = ?auto_455961 ?auto_455963 ) ) ( not ( = ?auto_455961 ?auto_455964 ) ) ( not ( = ?auto_455961 ?auto_455965 ) ) ( not ( = ?auto_455961 ?auto_455966 ) ) ( not ( = ?auto_455961 ?auto_455967 ) ) ( not ( = ?auto_455961 ?auto_455968 ) ) ( not ( = ?auto_455962 ?auto_455963 ) ) ( not ( = ?auto_455962 ?auto_455964 ) ) ( not ( = ?auto_455962 ?auto_455965 ) ) ( not ( = ?auto_455962 ?auto_455966 ) ) ( not ( = ?auto_455962 ?auto_455967 ) ) ( not ( = ?auto_455962 ?auto_455968 ) ) ( not ( = ?auto_455963 ?auto_455964 ) ) ( not ( = ?auto_455963 ?auto_455965 ) ) ( not ( = ?auto_455963 ?auto_455966 ) ) ( not ( = ?auto_455963 ?auto_455967 ) ) ( not ( = ?auto_455963 ?auto_455968 ) ) ( not ( = ?auto_455964 ?auto_455965 ) ) ( not ( = ?auto_455964 ?auto_455966 ) ) ( not ( = ?auto_455964 ?auto_455967 ) ) ( not ( = ?auto_455964 ?auto_455968 ) ) ( not ( = ?auto_455965 ?auto_455966 ) ) ( not ( = ?auto_455965 ?auto_455967 ) ) ( not ( = ?auto_455965 ?auto_455968 ) ) ( not ( = ?auto_455966 ?auto_455967 ) ) ( not ( = ?auto_455966 ?auto_455968 ) ) ( not ( = ?auto_455967 ?auto_455968 ) ) ( ON ?auto_455966 ?auto_455967 ) ( ON ?auto_455965 ?auto_455966 ) ( ON ?auto_455964 ?auto_455965 ) ( ON ?auto_455963 ?auto_455964 ) ( CLEAR ?auto_455961 ) ( ON ?auto_455962 ?auto_455963 ) ( CLEAR ?auto_455962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_455958 ?auto_455959 ?auto_455960 ?auto_455961 ?auto_455962 )
      ( MAKE-10PILE ?auto_455958 ?auto_455959 ?auto_455960 ?auto_455961 ?auto_455962 ?auto_455963 ?auto_455964 ?auto_455965 ?auto_455966 ?auto_455967 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_456000 - BLOCK
      ?auto_456001 - BLOCK
      ?auto_456002 - BLOCK
      ?auto_456003 - BLOCK
      ?auto_456004 - BLOCK
      ?auto_456005 - BLOCK
      ?auto_456006 - BLOCK
      ?auto_456007 - BLOCK
      ?auto_456008 - BLOCK
      ?auto_456009 - BLOCK
    )
    :vars
    (
      ?auto_456010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456009 ?auto_456010 ) ( ON-TABLE ?auto_456000 ) ( ON ?auto_456001 ?auto_456000 ) ( ON ?auto_456002 ?auto_456001 ) ( not ( = ?auto_456000 ?auto_456001 ) ) ( not ( = ?auto_456000 ?auto_456002 ) ) ( not ( = ?auto_456000 ?auto_456003 ) ) ( not ( = ?auto_456000 ?auto_456004 ) ) ( not ( = ?auto_456000 ?auto_456005 ) ) ( not ( = ?auto_456000 ?auto_456006 ) ) ( not ( = ?auto_456000 ?auto_456007 ) ) ( not ( = ?auto_456000 ?auto_456008 ) ) ( not ( = ?auto_456000 ?auto_456009 ) ) ( not ( = ?auto_456000 ?auto_456010 ) ) ( not ( = ?auto_456001 ?auto_456002 ) ) ( not ( = ?auto_456001 ?auto_456003 ) ) ( not ( = ?auto_456001 ?auto_456004 ) ) ( not ( = ?auto_456001 ?auto_456005 ) ) ( not ( = ?auto_456001 ?auto_456006 ) ) ( not ( = ?auto_456001 ?auto_456007 ) ) ( not ( = ?auto_456001 ?auto_456008 ) ) ( not ( = ?auto_456001 ?auto_456009 ) ) ( not ( = ?auto_456001 ?auto_456010 ) ) ( not ( = ?auto_456002 ?auto_456003 ) ) ( not ( = ?auto_456002 ?auto_456004 ) ) ( not ( = ?auto_456002 ?auto_456005 ) ) ( not ( = ?auto_456002 ?auto_456006 ) ) ( not ( = ?auto_456002 ?auto_456007 ) ) ( not ( = ?auto_456002 ?auto_456008 ) ) ( not ( = ?auto_456002 ?auto_456009 ) ) ( not ( = ?auto_456002 ?auto_456010 ) ) ( not ( = ?auto_456003 ?auto_456004 ) ) ( not ( = ?auto_456003 ?auto_456005 ) ) ( not ( = ?auto_456003 ?auto_456006 ) ) ( not ( = ?auto_456003 ?auto_456007 ) ) ( not ( = ?auto_456003 ?auto_456008 ) ) ( not ( = ?auto_456003 ?auto_456009 ) ) ( not ( = ?auto_456003 ?auto_456010 ) ) ( not ( = ?auto_456004 ?auto_456005 ) ) ( not ( = ?auto_456004 ?auto_456006 ) ) ( not ( = ?auto_456004 ?auto_456007 ) ) ( not ( = ?auto_456004 ?auto_456008 ) ) ( not ( = ?auto_456004 ?auto_456009 ) ) ( not ( = ?auto_456004 ?auto_456010 ) ) ( not ( = ?auto_456005 ?auto_456006 ) ) ( not ( = ?auto_456005 ?auto_456007 ) ) ( not ( = ?auto_456005 ?auto_456008 ) ) ( not ( = ?auto_456005 ?auto_456009 ) ) ( not ( = ?auto_456005 ?auto_456010 ) ) ( not ( = ?auto_456006 ?auto_456007 ) ) ( not ( = ?auto_456006 ?auto_456008 ) ) ( not ( = ?auto_456006 ?auto_456009 ) ) ( not ( = ?auto_456006 ?auto_456010 ) ) ( not ( = ?auto_456007 ?auto_456008 ) ) ( not ( = ?auto_456007 ?auto_456009 ) ) ( not ( = ?auto_456007 ?auto_456010 ) ) ( not ( = ?auto_456008 ?auto_456009 ) ) ( not ( = ?auto_456008 ?auto_456010 ) ) ( not ( = ?auto_456009 ?auto_456010 ) ) ( ON ?auto_456008 ?auto_456009 ) ( ON ?auto_456007 ?auto_456008 ) ( ON ?auto_456006 ?auto_456007 ) ( ON ?auto_456005 ?auto_456006 ) ( ON ?auto_456004 ?auto_456005 ) ( CLEAR ?auto_456002 ) ( ON ?auto_456003 ?auto_456004 ) ( CLEAR ?auto_456003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_456000 ?auto_456001 ?auto_456002 ?auto_456003 )
      ( MAKE-10PILE ?auto_456000 ?auto_456001 ?auto_456002 ?auto_456003 ?auto_456004 ?auto_456005 ?auto_456006 ?auto_456007 ?auto_456008 ?auto_456009 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_456042 - BLOCK
      ?auto_456043 - BLOCK
      ?auto_456044 - BLOCK
      ?auto_456045 - BLOCK
      ?auto_456046 - BLOCK
      ?auto_456047 - BLOCK
      ?auto_456048 - BLOCK
      ?auto_456049 - BLOCK
      ?auto_456050 - BLOCK
      ?auto_456051 - BLOCK
    )
    :vars
    (
      ?auto_456052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456051 ?auto_456052 ) ( ON-TABLE ?auto_456042 ) ( ON ?auto_456043 ?auto_456042 ) ( not ( = ?auto_456042 ?auto_456043 ) ) ( not ( = ?auto_456042 ?auto_456044 ) ) ( not ( = ?auto_456042 ?auto_456045 ) ) ( not ( = ?auto_456042 ?auto_456046 ) ) ( not ( = ?auto_456042 ?auto_456047 ) ) ( not ( = ?auto_456042 ?auto_456048 ) ) ( not ( = ?auto_456042 ?auto_456049 ) ) ( not ( = ?auto_456042 ?auto_456050 ) ) ( not ( = ?auto_456042 ?auto_456051 ) ) ( not ( = ?auto_456042 ?auto_456052 ) ) ( not ( = ?auto_456043 ?auto_456044 ) ) ( not ( = ?auto_456043 ?auto_456045 ) ) ( not ( = ?auto_456043 ?auto_456046 ) ) ( not ( = ?auto_456043 ?auto_456047 ) ) ( not ( = ?auto_456043 ?auto_456048 ) ) ( not ( = ?auto_456043 ?auto_456049 ) ) ( not ( = ?auto_456043 ?auto_456050 ) ) ( not ( = ?auto_456043 ?auto_456051 ) ) ( not ( = ?auto_456043 ?auto_456052 ) ) ( not ( = ?auto_456044 ?auto_456045 ) ) ( not ( = ?auto_456044 ?auto_456046 ) ) ( not ( = ?auto_456044 ?auto_456047 ) ) ( not ( = ?auto_456044 ?auto_456048 ) ) ( not ( = ?auto_456044 ?auto_456049 ) ) ( not ( = ?auto_456044 ?auto_456050 ) ) ( not ( = ?auto_456044 ?auto_456051 ) ) ( not ( = ?auto_456044 ?auto_456052 ) ) ( not ( = ?auto_456045 ?auto_456046 ) ) ( not ( = ?auto_456045 ?auto_456047 ) ) ( not ( = ?auto_456045 ?auto_456048 ) ) ( not ( = ?auto_456045 ?auto_456049 ) ) ( not ( = ?auto_456045 ?auto_456050 ) ) ( not ( = ?auto_456045 ?auto_456051 ) ) ( not ( = ?auto_456045 ?auto_456052 ) ) ( not ( = ?auto_456046 ?auto_456047 ) ) ( not ( = ?auto_456046 ?auto_456048 ) ) ( not ( = ?auto_456046 ?auto_456049 ) ) ( not ( = ?auto_456046 ?auto_456050 ) ) ( not ( = ?auto_456046 ?auto_456051 ) ) ( not ( = ?auto_456046 ?auto_456052 ) ) ( not ( = ?auto_456047 ?auto_456048 ) ) ( not ( = ?auto_456047 ?auto_456049 ) ) ( not ( = ?auto_456047 ?auto_456050 ) ) ( not ( = ?auto_456047 ?auto_456051 ) ) ( not ( = ?auto_456047 ?auto_456052 ) ) ( not ( = ?auto_456048 ?auto_456049 ) ) ( not ( = ?auto_456048 ?auto_456050 ) ) ( not ( = ?auto_456048 ?auto_456051 ) ) ( not ( = ?auto_456048 ?auto_456052 ) ) ( not ( = ?auto_456049 ?auto_456050 ) ) ( not ( = ?auto_456049 ?auto_456051 ) ) ( not ( = ?auto_456049 ?auto_456052 ) ) ( not ( = ?auto_456050 ?auto_456051 ) ) ( not ( = ?auto_456050 ?auto_456052 ) ) ( not ( = ?auto_456051 ?auto_456052 ) ) ( ON ?auto_456050 ?auto_456051 ) ( ON ?auto_456049 ?auto_456050 ) ( ON ?auto_456048 ?auto_456049 ) ( ON ?auto_456047 ?auto_456048 ) ( ON ?auto_456046 ?auto_456047 ) ( ON ?auto_456045 ?auto_456046 ) ( CLEAR ?auto_456043 ) ( ON ?auto_456044 ?auto_456045 ) ( CLEAR ?auto_456044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_456042 ?auto_456043 ?auto_456044 )
      ( MAKE-10PILE ?auto_456042 ?auto_456043 ?auto_456044 ?auto_456045 ?auto_456046 ?auto_456047 ?auto_456048 ?auto_456049 ?auto_456050 ?auto_456051 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_456084 - BLOCK
      ?auto_456085 - BLOCK
      ?auto_456086 - BLOCK
      ?auto_456087 - BLOCK
      ?auto_456088 - BLOCK
      ?auto_456089 - BLOCK
      ?auto_456090 - BLOCK
      ?auto_456091 - BLOCK
      ?auto_456092 - BLOCK
      ?auto_456093 - BLOCK
    )
    :vars
    (
      ?auto_456094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456093 ?auto_456094 ) ( ON-TABLE ?auto_456084 ) ( not ( = ?auto_456084 ?auto_456085 ) ) ( not ( = ?auto_456084 ?auto_456086 ) ) ( not ( = ?auto_456084 ?auto_456087 ) ) ( not ( = ?auto_456084 ?auto_456088 ) ) ( not ( = ?auto_456084 ?auto_456089 ) ) ( not ( = ?auto_456084 ?auto_456090 ) ) ( not ( = ?auto_456084 ?auto_456091 ) ) ( not ( = ?auto_456084 ?auto_456092 ) ) ( not ( = ?auto_456084 ?auto_456093 ) ) ( not ( = ?auto_456084 ?auto_456094 ) ) ( not ( = ?auto_456085 ?auto_456086 ) ) ( not ( = ?auto_456085 ?auto_456087 ) ) ( not ( = ?auto_456085 ?auto_456088 ) ) ( not ( = ?auto_456085 ?auto_456089 ) ) ( not ( = ?auto_456085 ?auto_456090 ) ) ( not ( = ?auto_456085 ?auto_456091 ) ) ( not ( = ?auto_456085 ?auto_456092 ) ) ( not ( = ?auto_456085 ?auto_456093 ) ) ( not ( = ?auto_456085 ?auto_456094 ) ) ( not ( = ?auto_456086 ?auto_456087 ) ) ( not ( = ?auto_456086 ?auto_456088 ) ) ( not ( = ?auto_456086 ?auto_456089 ) ) ( not ( = ?auto_456086 ?auto_456090 ) ) ( not ( = ?auto_456086 ?auto_456091 ) ) ( not ( = ?auto_456086 ?auto_456092 ) ) ( not ( = ?auto_456086 ?auto_456093 ) ) ( not ( = ?auto_456086 ?auto_456094 ) ) ( not ( = ?auto_456087 ?auto_456088 ) ) ( not ( = ?auto_456087 ?auto_456089 ) ) ( not ( = ?auto_456087 ?auto_456090 ) ) ( not ( = ?auto_456087 ?auto_456091 ) ) ( not ( = ?auto_456087 ?auto_456092 ) ) ( not ( = ?auto_456087 ?auto_456093 ) ) ( not ( = ?auto_456087 ?auto_456094 ) ) ( not ( = ?auto_456088 ?auto_456089 ) ) ( not ( = ?auto_456088 ?auto_456090 ) ) ( not ( = ?auto_456088 ?auto_456091 ) ) ( not ( = ?auto_456088 ?auto_456092 ) ) ( not ( = ?auto_456088 ?auto_456093 ) ) ( not ( = ?auto_456088 ?auto_456094 ) ) ( not ( = ?auto_456089 ?auto_456090 ) ) ( not ( = ?auto_456089 ?auto_456091 ) ) ( not ( = ?auto_456089 ?auto_456092 ) ) ( not ( = ?auto_456089 ?auto_456093 ) ) ( not ( = ?auto_456089 ?auto_456094 ) ) ( not ( = ?auto_456090 ?auto_456091 ) ) ( not ( = ?auto_456090 ?auto_456092 ) ) ( not ( = ?auto_456090 ?auto_456093 ) ) ( not ( = ?auto_456090 ?auto_456094 ) ) ( not ( = ?auto_456091 ?auto_456092 ) ) ( not ( = ?auto_456091 ?auto_456093 ) ) ( not ( = ?auto_456091 ?auto_456094 ) ) ( not ( = ?auto_456092 ?auto_456093 ) ) ( not ( = ?auto_456092 ?auto_456094 ) ) ( not ( = ?auto_456093 ?auto_456094 ) ) ( ON ?auto_456092 ?auto_456093 ) ( ON ?auto_456091 ?auto_456092 ) ( ON ?auto_456090 ?auto_456091 ) ( ON ?auto_456089 ?auto_456090 ) ( ON ?auto_456088 ?auto_456089 ) ( ON ?auto_456087 ?auto_456088 ) ( ON ?auto_456086 ?auto_456087 ) ( CLEAR ?auto_456084 ) ( ON ?auto_456085 ?auto_456086 ) ( CLEAR ?auto_456085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_456084 ?auto_456085 )
      ( MAKE-10PILE ?auto_456084 ?auto_456085 ?auto_456086 ?auto_456087 ?auto_456088 ?auto_456089 ?auto_456090 ?auto_456091 ?auto_456092 ?auto_456093 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_456126 - BLOCK
      ?auto_456127 - BLOCK
      ?auto_456128 - BLOCK
      ?auto_456129 - BLOCK
      ?auto_456130 - BLOCK
      ?auto_456131 - BLOCK
      ?auto_456132 - BLOCK
      ?auto_456133 - BLOCK
      ?auto_456134 - BLOCK
      ?auto_456135 - BLOCK
    )
    :vars
    (
      ?auto_456136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456135 ?auto_456136 ) ( not ( = ?auto_456126 ?auto_456127 ) ) ( not ( = ?auto_456126 ?auto_456128 ) ) ( not ( = ?auto_456126 ?auto_456129 ) ) ( not ( = ?auto_456126 ?auto_456130 ) ) ( not ( = ?auto_456126 ?auto_456131 ) ) ( not ( = ?auto_456126 ?auto_456132 ) ) ( not ( = ?auto_456126 ?auto_456133 ) ) ( not ( = ?auto_456126 ?auto_456134 ) ) ( not ( = ?auto_456126 ?auto_456135 ) ) ( not ( = ?auto_456126 ?auto_456136 ) ) ( not ( = ?auto_456127 ?auto_456128 ) ) ( not ( = ?auto_456127 ?auto_456129 ) ) ( not ( = ?auto_456127 ?auto_456130 ) ) ( not ( = ?auto_456127 ?auto_456131 ) ) ( not ( = ?auto_456127 ?auto_456132 ) ) ( not ( = ?auto_456127 ?auto_456133 ) ) ( not ( = ?auto_456127 ?auto_456134 ) ) ( not ( = ?auto_456127 ?auto_456135 ) ) ( not ( = ?auto_456127 ?auto_456136 ) ) ( not ( = ?auto_456128 ?auto_456129 ) ) ( not ( = ?auto_456128 ?auto_456130 ) ) ( not ( = ?auto_456128 ?auto_456131 ) ) ( not ( = ?auto_456128 ?auto_456132 ) ) ( not ( = ?auto_456128 ?auto_456133 ) ) ( not ( = ?auto_456128 ?auto_456134 ) ) ( not ( = ?auto_456128 ?auto_456135 ) ) ( not ( = ?auto_456128 ?auto_456136 ) ) ( not ( = ?auto_456129 ?auto_456130 ) ) ( not ( = ?auto_456129 ?auto_456131 ) ) ( not ( = ?auto_456129 ?auto_456132 ) ) ( not ( = ?auto_456129 ?auto_456133 ) ) ( not ( = ?auto_456129 ?auto_456134 ) ) ( not ( = ?auto_456129 ?auto_456135 ) ) ( not ( = ?auto_456129 ?auto_456136 ) ) ( not ( = ?auto_456130 ?auto_456131 ) ) ( not ( = ?auto_456130 ?auto_456132 ) ) ( not ( = ?auto_456130 ?auto_456133 ) ) ( not ( = ?auto_456130 ?auto_456134 ) ) ( not ( = ?auto_456130 ?auto_456135 ) ) ( not ( = ?auto_456130 ?auto_456136 ) ) ( not ( = ?auto_456131 ?auto_456132 ) ) ( not ( = ?auto_456131 ?auto_456133 ) ) ( not ( = ?auto_456131 ?auto_456134 ) ) ( not ( = ?auto_456131 ?auto_456135 ) ) ( not ( = ?auto_456131 ?auto_456136 ) ) ( not ( = ?auto_456132 ?auto_456133 ) ) ( not ( = ?auto_456132 ?auto_456134 ) ) ( not ( = ?auto_456132 ?auto_456135 ) ) ( not ( = ?auto_456132 ?auto_456136 ) ) ( not ( = ?auto_456133 ?auto_456134 ) ) ( not ( = ?auto_456133 ?auto_456135 ) ) ( not ( = ?auto_456133 ?auto_456136 ) ) ( not ( = ?auto_456134 ?auto_456135 ) ) ( not ( = ?auto_456134 ?auto_456136 ) ) ( not ( = ?auto_456135 ?auto_456136 ) ) ( ON ?auto_456134 ?auto_456135 ) ( ON ?auto_456133 ?auto_456134 ) ( ON ?auto_456132 ?auto_456133 ) ( ON ?auto_456131 ?auto_456132 ) ( ON ?auto_456130 ?auto_456131 ) ( ON ?auto_456129 ?auto_456130 ) ( ON ?auto_456128 ?auto_456129 ) ( ON ?auto_456127 ?auto_456128 ) ( ON ?auto_456126 ?auto_456127 ) ( CLEAR ?auto_456126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_456126 )
      ( MAKE-10PILE ?auto_456126 ?auto_456127 ?auto_456128 ?auto_456129 ?auto_456130 ?auto_456131 ?auto_456132 ?auto_456133 ?auto_456134 ?auto_456135 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_456169 - BLOCK
      ?auto_456170 - BLOCK
      ?auto_456171 - BLOCK
      ?auto_456172 - BLOCK
      ?auto_456173 - BLOCK
      ?auto_456174 - BLOCK
      ?auto_456175 - BLOCK
      ?auto_456176 - BLOCK
      ?auto_456177 - BLOCK
      ?auto_456178 - BLOCK
      ?auto_456179 - BLOCK
    )
    :vars
    (
      ?auto_456180 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_456178 ) ( ON ?auto_456179 ?auto_456180 ) ( CLEAR ?auto_456179 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_456169 ) ( ON ?auto_456170 ?auto_456169 ) ( ON ?auto_456171 ?auto_456170 ) ( ON ?auto_456172 ?auto_456171 ) ( ON ?auto_456173 ?auto_456172 ) ( ON ?auto_456174 ?auto_456173 ) ( ON ?auto_456175 ?auto_456174 ) ( ON ?auto_456176 ?auto_456175 ) ( ON ?auto_456177 ?auto_456176 ) ( ON ?auto_456178 ?auto_456177 ) ( not ( = ?auto_456169 ?auto_456170 ) ) ( not ( = ?auto_456169 ?auto_456171 ) ) ( not ( = ?auto_456169 ?auto_456172 ) ) ( not ( = ?auto_456169 ?auto_456173 ) ) ( not ( = ?auto_456169 ?auto_456174 ) ) ( not ( = ?auto_456169 ?auto_456175 ) ) ( not ( = ?auto_456169 ?auto_456176 ) ) ( not ( = ?auto_456169 ?auto_456177 ) ) ( not ( = ?auto_456169 ?auto_456178 ) ) ( not ( = ?auto_456169 ?auto_456179 ) ) ( not ( = ?auto_456169 ?auto_456180 ) ) ( not ( = ?auto_456170 ?auto_456171 ) ) ( not ( = ?auto_456170 ?auto_456172 ) ) ( not ( = ?auto_456170 ?auto_456173 ) ) ( not ( = ?auto_456170 ?auto_456174 ) ) ( not ( = ?auto_456170 ?auto_456175 ) ) ( not ( = ?auto_456170 ?auto_456176 ) ) ( not ( = ?auto_456170 ?auto_456177 ) ) ( not ( = ?auto_456170 ?auto_456178 ) ) ( not ( = ?auto_456170 ?auto_456179 ) ) ( not ( = ?auto_456170 ?auto_456180 ) ) ( not ( = ?auto_456171 ?auto_456172 ) ) ( not ( = ?auto_456171 ?auto_456173 ) ) ( not ( = ?auto_456171 ?auto_456174 ) ) ( not ( = ?auto_456171 ?auto_456175 ) ) ( not ( = ?auto_456171 ?auto_456176 ) ) ( not ( = ?auto_456171 ?auto_456177 ) ) ( not ( = ?auto_456171 ?auto_456178 ) ) ( not ( = ?auto_456171 ?auto_456179 ) ) ( not ( = ?auto_456171 ?auto_456180 ) ) ( not ( = ?auto_456172 ?auto_456173 ) ) ( not ( = ?auto_456172 ?auto_456174 ) ) ( not ( = ?auto_456172 ?auto_456175 ) ) ( not ( = ?auto_456172 ?auto_456176 ) ) ( not ( = ?auto_456172 ?auto_456177 ) ) ( not ( = ?auto_456172 ?auto_456178 ) ) ( not ( = ?auto_456172 ?auto_456179 ) ) ( not ( = ?auto_456172 ?auto_456180 ) ) ( not ( = ?auto_456173 ?auto_456174 ) ) ( not ( = ?auto_456173 ?auto_456175 ) ) ( not ( = ?auto_456173 ?auto_456176 ) ) ( not ( = ?auto_456173 ?auto_456177 ) ) ( not ( = ?auto_456173 ?auto_456178 ) ) ( not ( = ?auto_456173 ?auto_456179 ) ) ( not ( = ?auto_456173 ?auto_456180 ) ) ( not ( = ?auto_456174 ?auto_456175 ) ) ( not ( = ?auto_456174 ?auto_456176 ) ) ( not ( = ?auto_456174 ?auto_456177 ) ) ( not ( = ?auto_456174 ?auto_456178 ) ) ( not ( = ?auto_456174 ?auto_456179 ) ) ( not ( = ?auto_456174 ?auto_456180 ) ) ( not ( = ?auto_456175 ?auto_456176 ) ) ( not ( = ?auto_456175 ?auto_456177 ) ) ( not ( = ?auto_456175 ?auto_456178 ) ) ( not ( = ?auto_456175 ?auto_456179 ) ) ( not ( = ?auto_456175 ?auto_456180 ) ) ( not ( = ?auto_456176 ?auto_456177 ) ) ( not ( = ?auto_456176 ?auto_456178 ) ) ( not ( = ?auto_456176 ?auto_456179 ) ) ( not ( = ?auto_456176 ?auto_456180 ) ) ( not ( = ?auto_456177 ?auto_456178 ) ) ( not ( = ?auto_456177 ?auto_456179 ) ) ( not ( = ?auto_456177 ?auto_456180 ) ) ( not ( = ?auto_456178 ?auto_456179 ) ) ( not ( = ?auto_456178 ?auto_456180 ) ) ( not ( = ?auto_456179 ?auto_456180 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_456179 ?auto_456180 )
      ( !STACK ?auto_456179 ?auto_456178 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_456215 - BLOCK
      ?auto_456216 - BLOCK
      ?auto_456217 - BLOCK
      ?auto_456218 - BLOCK
      ?auto_456219 - BLOCK
      ?auto_456220 - BLOCK
      ?auto_456221 - BLOCK
      ?auto_456222 - BLOCK
      ?auto_456223 - BLOCK
      ?auto_456224 - BLOCK
      ?auto_456225 - BLOCK
    )
    :vars
    (
      ?auto_456226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456225 ?auto_456226 ) ( ON-TABLE ?auto_456215 ) ( ON ?auto_456216 ?auto_456215 ) ( ON ?auto_456217 ?auto_456216 ) ( ON ?auto_456218 ?auto_456217 ) ( ON ?auto_456219 ?auto_456218 ) ( ON ?auto_456220 ?auto_456219 ) ( ON ?auto_456221 ?auto_456220 ) ( ON ?auto_456222 ?auto_456221 ) ( ON ?auto_456223 ?auto_456222 ) ( not ( = ?auto_456215 ?auto_456216 ) ) ( not ( = ?auto_456215 ?auto_456217 ) ) ( not ( = ?auto_456215 ?auto_456218 ) ) ( not ( = ?auto_456215 ?auto_456219 ) ) ( not ( = ?auto_456215 ?auto_456220 ) ) ( not ( = ?auto_456215 ?auto_456221 ) ) ( not ( = ?auto_456215 ?auto_456222 ) ) ( not ( = ?auto_456215 ?auto_456223 ) ) ( not ( = ?auto_456215 ?auto_456224 ) ) ( not ( = ?auto_456215 ?auto_456225 ) ) ( not ( = ?auto_456215 ?auto_456226 ) ) ( not ( = ?auto_456216 ?auto_456217 ) ) ( not ( = ?auto_456216 ?auto_456218 ) ) ( not ( = ?auto_456216 ?auto_456219 ) ) ( not ( = ?auto_456216 ?auto_456220 ) ) ( not ( = ?auto_456216 ?auto_456221 ) ) ( not ( = ?auto_456216 ?auto_456222 ) ) ( not ( = ?auto_456216 ?auto_456223 ) ) ( not ( = ?auto_456216 ?auto_456224 ) ) ( not ( = ?auto_456216 ?auto_456225 ) ) ( not ( = ?auto_456216 ?auto_456226 ) ) ( not ( = ?auto_456217 ?auto_456218 ) ) ( not ( = ?auto_456217 ?auto_456219 ) ) ( not ( = ?auto_456217 ?auto_456220 ) ) ( not ( = ?auto_456217 ?auto_456221 ) ) ( not ( = ?auto_456217 ?auto_456222 ) ) ( not ( = ?auto_456217 ?auto_456223 ) ) ( not ( = ?auto_456217 ?auto_456224 ) ) ( not ( = ?auto_456217 ?auto_456225 ) ) ( not ( = ?auto_456217 ?auto_456226 ) ) ( not ( = ?auto_456218 ?auto_456219 ) ) ( not ( = ?auto_456218 ?auto_456220 ) ) ( not ( = ?auto_456218 ?auto_456221 ) ) ( not ( = ?auto_456218 ?auto_456222 ) ) ( not ( = ?auto_456218 ?auto_456223 ) ) ( not ( = ?auto_456218 ?auto_456224 ) ) ( not ( = ?auto_456218 ?auto_456225 ) ) ( not ( = ?auto_456218 ?auto_456226 ) ) ( not ( = ?auto_456219 ?auto_456220 ) ) ( not ( = ?auto_456219 ?auto_456221 ) ) ( not ( = ?auto_456219 ?auto_456222 ) ) ( not ( = ?auto_456219 ?auto_456223 ) ) ( not ( = ?auto_456219 ?auto_456224 ) ) ( not ( = ?auto_456219 ?auto_456225 ) ) ( not ( = ?auto_456219 ?auto_456226 ) ) ( not ( = ?auto_456220 ?auto_456221 ) ) ( not ( = ?auto_456220 ?auto_456222 ) ) ( not ( = ?auto_456220 ?auto_456223 ) ) ( not ( = ?auto_456220 ?auto_456224 ) ) ( not ( = ?auto_456220 ?auto_456225 ) ) ( not ( = ?auto_456220 ?auto_456226 ) ) ( not ( = ?auto_456221 ?auto_456222 ) ) ( not ( = ?auto_456221 ?auto_456223 ) ) ( not ( = ?auto_456221 ?auto_456224 ) ) ( not ( = ?auto_456221 ?auto_456225 ) ) ( not ( = ?auto_456221 ?auto_456226 ) ) ( not ( = ?auto_456222 ?auto_456223 ) ) ( not ( = ?auto_456222 ?auto_456224 ) ) ( not ( = ?auto_456222 ?auto_456225 ) ) ( not ( = ?auto_456222 ?auto_456226 ) ) ( not ( = ?auto_456223 ?auto_456224 ) ) ( not ( = ?auto_456223 ?auto_456225 ) ) ( not ( = ?auto_456223 ?auto_456226 ) ) ( not ( = ?auto_456224 ?auto_456225 ) ) ( not ( = ?auto_456224 ?auto_456226 ) ) ( not ( = ?auto_456225 ?auto_456226 ) ) ( CLEAR ?auto_456223 ) ( ON ?auto_456224 ?auto_456225 ) ( CLEAR ?auto_456224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_456215 ?auto_456216 ?auto_456217 ?auto_456218 ?auto_456219 ?auto_456220 ?auto_456221 ?auto_456222 ?auto_456223 ?auto_456224 )
      ( MAKE-11PILE ?auto_456215 ?auto_456216 ?auto_456217 ?auto_456218 ?auto_456219 ?auto_456220 ?auto_456221 ?auto_456222 ?auto_456223 ?auto_456224 ?auto_456225 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_456261 - BLOCK
      ?auto_456262 - BLOCK
      ?auto_456263 - BLOCK
      ?auto_456264 - BLOCK
      ?auto_456265 - BLOCK
      ?auto_456266 - BLOCK
      ?auto_456267 - BLOCK
      ?auto_456268 - BLOCK
      ?auto_456269 - BLOCK
      ?auto_456270 - BLOCK
      ?auto_456271 - BLOCK
    )
    :vars
    (
      ?auto_456272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456271 ?auto_456272 ) ( ON-TABLE ?auto_456261 ) ( ON ?auto_456262 ?auto_456261 ) ( ON ?auto_456263 ?auto_456262 ) ( ON ?auto_456264 ?auto_456263 ) ( ON ?auto_456265 ?auto_456264 ) ( ON ?auto_456266 ?auto_456265 ) ( ON ?auto_456267 ?auto_456266 ) ( ON ?auto_456268 ?auto_456267 ) ( not ( = ?auto_456261 ?auto_456262 ) ) ( not ( = ?auto_456261 ?auto_456263 ) ) ( not ( = ?auto_456261 ?auto_456264 ) ) ( not ( = ?auto_456261 ?auto_456265 ) ) ( not ( = ?auto_456261 ?auto_456266 ) ) ( not ( = ?auto_456261 ?auto_456267 ) ) ( not ( = ?auto_456261 ?auto_456268 ) ) ( not ( = ?auto_456261 ?auto_456269 ) ) ( not ( = ?auto_456261 ?auto_456270 ) ) ( not ( = ?auto_456261 ?auto_456271 ) ) ( not ( = ?auto_456261 ?auto_456272 ) ) ( not ( = ?auto_456262 ?auto_456263 ) ) ( not ( = ?auto_456262 ?auto_456264 ) ) ( not ( = ?auto_456262 ?auto_456265 ) ) ( not ( = ?auto_456262 ?auto_456266 ) ) ( not ( = ?auto_456262 ?auto_456267 ) ) ( not ( = ?auto_456262 ?auto_456268 ) ) ( not ( = ?auto_456262 ?auto_456269 ) ) ( not ( = ?auto_456262 ?auto_456270 ) ) ( not ( = ?auto_456262 ?auto_456271 ) ) ( not ( = ?auto_456262 ?auto_456272 ) ) ( not ( = ?auto_456263 ?auto_456264 ) ) ( not ( = ?auto_456263 ?auto_456265 ) ) ( not ( = ?auto_456263 ?auto_456266 ) ) ( not ( = ?auto_456263 ?auto_456267 ) ) ( not ( = ?auto_456263 ?auto_456268 ) ) ( not ( = ?auto_456263 ?auto_456269 ) ) ( not ( = ?auto_456263 ?auto_456270 ) ) ( not ( = ?auto_456263 ?auto_456271 ) ) ( not ( = ?auto_456263 ?auto_456272 ) ) ( not ( = ?auto_456264 ?auto_456265 ) ) ( not ( = ?auto_456264 ?auto_456266 ) ) ( not ( = ?auto_456264 ?auto_456267 ) ) ( not ( = ?auto_456264 ?auto_456268 ) ) ( not ( = ?auto_456264 ?auto_456269 ) ) ( not ( = ?auto_456264 ?auto_456270 ) ) ( not ( = ?auto_456264 ?auto_456271 ) ) ( not ( = ?auto_456264 ?auto_456272 ) ) ( not ( = ?auto_456265 ?auto_456266 ) ) ( not ( = ?auto_456265 ?auto_456267 ) ) ( not ( = ?auto_456265 ?auto_456268 ) ) ( not ( = ?auto_456265 ?auto_456269 ) ) ( not ( = ?auto_456265 ?auto_456270 ) ) ( not ( = ?auto_456265 ?auto_456271 ) ) ( not ( = ?auto_456265 ?auto_456272 ) ) ( not ( = ?auto_456266 ?auto_456267 ) ) ( not ( = ?auto_456266 ?auto_456268 ) ) ( not ( = ?auto_456266 ?auto_456269 ) ) ( not ( = ?auto_456266 ?auto_456270 ) ) ( not ( = ?auto_456266 ?auto_456271 ) ) ( not ( = ?auto_456266 ?auto_456272 ) ) ( not ( = ?auto_456267 ?auto_456268 ) ) ( not ( = ?auto_456267 ?auto_456269 ) ) ( not ( = ?auto_456267 ?auto_456270 ) ) ( not ( = ?auto_456267 ?auto_456271 ) ) ( not ( = ?auto_456267 ?auto_456272 ) ) ( not ( = ?auto_456268 ?auto_456269 ) ) ( not ( = ?auto_456268 ?auto_456270 ) ) ( not ( = ?auto_456268 ?auto_456271 ) ) ( not ( = ?auto_456268 ?auto_456272 ) ) ( not ( = ?auto_456269 ?auto_456270 ) ) ( not ( = ?auto_456269 ?auto_456271 ) ) ( not ( = ?auto_456269 ?auto_456272 ) ) ( not ( = ?auto_456270 ?auto_456271 ) ) ( not ( = ?auto_456270 ?auto_456272 ) ) ( not ( = ?auto_456271 ?auto_456272 ) ) ( ON ?auto_456270 ?auto_456271 ) ( CLEAR ?auto_456268 ) ( ON ?auto_456269 ?auto_456270 ) ( CLEAR ?auto_456269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_456261 ?auto_456262 ?auto_456263 ?auto_456264 ?auto_456265 ?auto_456266 ?auto_456267 ?auto_456268 ?auto_456269 )
      ( MAKE-11PILE ?auto_456261 ?auto_456262 ?auto_456263 ?auto_456264 ?auto_456265 ?auto_456266 ?auto_456267 ?auto_456268 ?auto_456269 ?auto_456270 ?auto_456271 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_456307 - BLOCK
      ?auto_456308 - BLOCK
      ?auto_456309 - BLOCK
      ?auto_456310 - BLOCK
      ?auto_456311 - BLOCK
      ?auto_456312 - BLOCK
      ?auto_456313 - BLOCK
      ?auto_456314 - BLOCK
      ?auto_456315 - BLOCK
      ?auto_456316 - BLOCK
      ?auto_456317 - BLOCK
    )
    :vars
    (
      ?auto_456318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456317 ?auto_456318 ) ( ON-TABLE ?auto_456307 ) ( ON ?auto_456308 ?auto_456307 ) ( ON ?auto_456309 ?auto_456308 ) ( ON ?auto_456310 ?auto_456309 ) ( ON ?auto_456311 ?auto_456310 ) ( ON ?auto_456312 ?auto_456311 ) ( ON ?auto_456313 ?auto_456312 ) ( not ( = ?auto_456307 ?auto_456308 ) ) ( not ( = ?auto_456307 ?auto_456309 ) ) ( not ( = ?auto_456307 ?auto_456310 ) ) ( not ( = ?auto_456307 ?auto_456311 ) ) ( not ( = ?auto_456307 ?auto_456312 ) ) ( not ( = ?auto_456307 ?auto_456313 ) ) ( not ( = ?auto_456307 ?auto_456314 ) ) ( not ( = ?auto_456307 ?auto_456315 ) ) ( not ( = ?auto_456307 ?auto_456316 ) ) ( not ( = ?auto_456307 ?auto_456317 ) ) ( not ( = ?auto_456307 ?auto_456318 ) ) ( not ( = ?auto_456308 ?auto_456309 ) ) ( not ( = ?auto_456308 ?auto_456310 ) ) ( not ( = ?auto_456308 ?auto_456311 ) ) ( not ( = ?auto_456308 ?auto_456312 ) ) ( not ( = ?auto_456308 ?auto_456313 ) ) ( not ( = ?auto_456308 ?auto_456314 ) ) ( not ( = ?auto_456308 ?auto_456315 ) ) ( not ( = ?auto_456308 ?auto_456316 ) ) ( not ( = ?auto_456308 ?auto_456317 ) ) ( not ( = ?auto_456308 ?auto_456318 ) ) ( not ( = ?auto_456309 ?auto_456310 ) ) ( not ( = ?auto_456309 ?auto_456311 ) ) ( not ( = ?auto_456309 ?auto_456312 ) ) ( not ( = ?auto_456309 ?auto_456313 ) ) ( not ( = ?auto_456309 ?auto_456314 ) ) ( not ( = ?auto_456309 ?auto_456315 ) ) ( not ( = ?auto_456309 ?auto_456316 ) ) ( not ( = ?auto_456309 ?auto_456317 ) ) ( not ( = ?auto_456309 ?auto_456318 ) ) ( not ( = ?auto_456310 ?auto_456311 ) ) ( not ( = ?auto_456310 ?auto_456312 ) ) ( not ( = ?auto_456310 ?auto_456313 ) ) ( not ( = ?auto_456310 ?auto_456314 ) ) ( not ( = ?auto_456310 ?auto_456315 ) ) ( not ( = ?auto_456310 ?auto_456316 ) ) ( not ( = ?auto_456310 ?auto_456317 ) ) ( not ( = ?auto_456310 ?auto_456318 ) ) ( not ( = ?auto_456311 ?auto_456312 ) ) ( not ( = ?auto_456311 ?auto_456313 ) ) ( not ( = ?auto_456311 ?auto_456314 ) ) ( not ( = ?auto_456311 ?auto_456315 ) ) ( not ( = ?auto_456311 ?auto_456316 ) ) ( not ( = ?auto_456311 ?auto_456317 ) ) ( not ( = ?auto_456311 ?auto_456318 ) ) ( not ( = ?auto_456312 ?auto_456313 ) ) ( not ( = ?auto_456312 ?auto_456314 ) ) ( not ( = ?auto_456312 ?auto_456315 ) ) ( not ( = ?auto_456312 ?auto_456316 ) ) ( not ( = ?auto_456312 ?auto_456317 ) ) ( not ( = ?auto_456312 ?auto_456318 ) ) ( not ( = ?auto_456313 ?auto_456314 ) ) ( not ( = ?auto_456313 ?auto_456315 ) ) ( not ( = ?auto_456313 ?auto_456316 ) ) ( not ( = ?auto_456313 ?auto_456317 ) ) ( not ( = ?auto_456313 ?auto_456318 ) ) ( not ( = ?auto_456314 ?auto_456315 ) ) ( not ( = ?auto_456314 ?auto_456316 ) ) ( not ( = ?auto_456314 ?auto_456317 ) ) ( not ( = ?auto_456314 ?auto_456318 ) ) ( not ( = ?auto_456315 ?auto_456316 ) ) ( not ( = ?auto_456315 ?auto_456317 ) ) ( not ( = ?auto_456315 ?auto_456318 ) ) ( not ( = ?auto_456316 ?auto_456317 ) ) ( not ( = ?auto_456316 ?auto_456318 ) ) ( not ( = ?auto_456317 ?auto_456318 ) ) ( ON ?auto_456316 ?auto_456317 ) ( ON ?auto_456315 ?auto_456316 ) ( CLEAR ?auto_456313 ) ( ON ?auto_456314 ?auto_456315 ) ( CLEAR ?auto_456314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_456307 ?auto_456308 ?auto_456309 ?auto_456310 ?auto_456311 ?auto_456312 ?auto_456313 ?auto_456314 )
      ( MAKE-11PILE ?auto_456307 ?auto_456308 ?auto_456309 ?auto_456310 ?auto_456311 ?auto_456312 ?auto_456313 ?auto_456314 ?auto_456315 ?auto_456316 ?auto_456317 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_456353 - BLOCK
      ?auto_456354 - BLOCK
      ?auto_456355 - BLOCK
      ?auto_456356 - BLOCK
      ?auto_456357 - BLOCK
      ?auto_456358 - BLOCK
      ?auto_456359 - BLOCK
      ?auto_456360 - BLOCK
      ?auto_456361 - BLOCK
      ?auto_456362 - BLOCK
      ?auto_456363 - BLOCK
    )
    :vars
    (
      ?auto_456364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456363 ?auto_456364 ) ( ON-TABLE ?auto_456353 ) ( ON ?auto_456354 ?auto_456353 ) ( ON ?auto_456355 ?auto_456354 ) ( ON ?auto_456356 ?auto_456355 ) ( ON ?auto_456357 ?auto_456356 ) ( ON ?auto_456358 ?auto_456357 ) ( not ( = ?auto_456353 ?auto_456354 ) ) ( not ( = ?auto_456353 ?auto_456355 ) ) ( not ( = ?auto_456353 ?auto_456356 ) ) ( not ( = ?auto_456353 ?auto_456357 ) ) ( not ( = ?auto_456353 ?auto_456358 ) ) ( not ( = ?auto_456353 ?auto_456359 ) ) ( not ( = ?auto_456353 ?auto_456360 ) ) ( not ( = ?auto_456353 ?auto_456361 ) ) ( not ( = ?auto_456353 ?auto_456362 ) ) ( not ( = ?auto_456353 ?auto_456363 ) ) ( not ( = ?auto_456353 ?auto_456364 ) ) ( not ( = ?auto_456354 ?auto_456355 ) ) ( not ( = ?auto_456354 ?auto_456356 ) ) ( not ( = ?auto_456354 ?auto_456357 ) ) ( not ( = ?auto_456354 ?auto_456358 ) ) ( not ( = ?auto_456354 ?auto_456359 ) ) ( not ( = ?auto_456354 ?auto_456360 ) ) ( not ( = ?auto_456354 ?auto_456361 ) ) ( not ( = ?auto_456354 ?auto_456362 ) ) ( not ( = ?auto_456354 ?auto_456363 ) ) ( not ( = ?auto_456354 ?auto_456364 ) ) ( not ( = ?auto_456355 ?auto_456356 ) ) ( not ( = ?auto_456355 ?auto_456357 ) ) ( not ( = ?auto_456355 ?auto_456358 ) ) ( not ( = ?auto_456355 ?auto_456359 ) ) ( not ( = ?auto_456355 ?auto_456360 ) ) ( not ( = ?auto_456355 ?auto_456361 ) ) ( not ( = ?auto_456355 ?auto_456362 ) ) ( not ( = ?auto_456355 ?auto_456363 ) ) ( not ( = ?auto_456355 ?auto_456364 ) ) ( not ( = ?auto_456356 ?auto_456357 ) ) ( not ( = ?auto_456356 ?auto_456358 ) ) ( not ( = ?auto_456356 ?auto_456359 ) ) ( not ( = ?auto_456356 ?auto_456360 ) ) ( not ( = ?auto_456356 ?auto_456361 ) ) ( not ( = ?auto_456356 ?auto_456362 ) ) ( not ( = ?auto_456356 ?auto_456363 ) ) ( not ( = ?auto_456356 ?auto_456364 ) ) ( not ( = ?auto_456357 ?auto_456358 ) ) ( not ( = ?auto_456357 ?auto_456359 ) ) ( not ( = ?auto_456357 ?auto_456360 ) ) ( not ( = ?auto_456357 ?auto_456361 ) ) ( not ( = ?auto_456357 ?auto_456362 ) ) ( not ( = ?auto_456357 ?auto_456363 ) ) ( not ( = ?auto_456357 ?auto_456364 ) ) ( not ( = ?auto_456358 ?auto_456359 ) ) ( not ( = ?auto_456358 ?auto_456360 ) ) ( not ( = ?auto_456358 ?auto_456361 ) ) ( not ( = ?auto_456358 ?auto_456362 ) ) ( not ( = ?auto_456358 ?auto_456363 ) ) ( not ( = ?auto_456358 ?auto_456364 ) ) ( not ( = ?auto_456359 ?auto_456360 ) ) ( not ( = ?auto_456359 ?auto_456361 ) ) ( not ( = ?auto_456359 ?auto_456362 ) ) ( not ( = ?auto_456359 ?auto_456363 ) ) ( not ( = ?auto_456359 ?auto_456364 ) ) ( not ( = ?auto_456360 ?auto_456361 ) ) ( not ( = ?auto_456360 ?auto_456362 ) ) ( not ( = ?auto_456360 ?auto_456363 ) ) ( not ( = ?auto_456360 ?auto_456364 ) ) ( not ( = ?auto_456361 ?auto_456362 ) ) ( not ( = ?auto_456361 ?auto_456363 ) ) ( not ( = ?auto_456361 ?auto_456364 ) ) ( not ( = ?auto_456362 ?auto_456363 ) ) ( not ( = ?auto_456362 ?auto_456364 ) ) ( not ( = ?auto_456363 ?auto_456364 ) ) ( ON ?auto_456362 ?auto_456363 ) ( ON ?auto_456361 ?auto_456362 ) ( ON ?auto_456360 ?auto_456361 ) ( CLEAR ?auto_456358 ) ( ON ?auto_456359 ?auto_456360 ) ( CLEAR ?auto_456359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_456353 ?auto_456354 ?auto_456355 ?auto_456356 ?auto_456357 ?auto_456358 ?auto_456359 )
      ( MAKE-11PILE ?auto_456353 ?auto_456354 ?auto_456355 ?auto_456356 ?auto_456357 ?auto_456358 ?auto_456359 ?auto_456360 ?auto_456361 ?auto_456362 ?auto_456363 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_456399 - BLOCK
      ?auto_456400 - BLOCK
      ?auto_456401 - BLOCK
      ?auto_456402 - BLOCK
      ?auto_456403 - BLOCK
      ?auto_456404 - BLOCK
      ?auto_456405 - BLOCK
      ?auto_456406 - BLOCK
      ?auto_456407 - BLOCK
      ?auto_456408 - BLOCK
      ?auto_456409 - BLOCK
    )
    :vars
    (
      ?auto_456410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456409 ?auto_456410 ) ( ON-TABLE ?auto_456399 ) ( ON ?auto_456400 ?auto_456399 ) ( ON ?auto_456401 ?auto_456400 ) ( ON ?auto_456402 ?auto_456401 ) ( ON ?auto_456403 ?auto_456402 ) ( not ( = ?auto_456399 ?auto_456400 ) ) ( not ( = ?auto_456399 ?auto_456401 ) ) ( not ( = ?auto_456399 ?auto_456402 ) ) ( not ( = ?auto_456399 ?auto_456403 ) ) ( not ( = ?auto_456399 ?auto_456404 ) ) ( not ( = ?auto_456399 ?auto_456405 ) ) ( not ( = ?auto_456399 ?auto_456406 ) ) ( not ( = ?auto_456399 ?auto_456407 ) ) ( not ( = ?auto_456399 ?auto_456408 ) ) ( not ( = ?auto_456399 ?auto_456409 ) ) ( not ( = ?auto_456399 ?auto_456410 ) ) ( not ( = ?auto_456400 ?auto_456401 ) ) ( not ( = ?auto_456400 ?auto_456402 ) ) ( not ( = ?auto_456400 ?auto_456403 ) ) ( not ( = ?auto_456400 ?auto_456404 ) ) ( not ( = ?auto_456400 ?auto_456405 ) ) ( not ( = ?auto_456400 ?auto_456406 ) ) ( not ( = ?auto_456400 ?auto_456407 ) ) ( not ( = ?auto_456400 ?auto_456408 ) ) ( not ( = ?auto_456400 ?auto_456409 ) ) ( not ( = ?auto_456400 ?auto_456410 ) ) ( not ( = ?auto_456401 ?auto_456402 ) ) ( not ( = ?auto_456401 ?auto_456403 ) ) ( not ( = ?auto_456401 ?auto_456404 ) ) ( not ( = ?auto_456401 ?auto_456405 ) ) ( not ( = ?auto_456401 ?auto_456406 ) ) ( not ( = ?auto_456401 ?auto_456407 ) ) ( not ( = ?auto_456401 ?auto_456408 ) ) ( not ( = ?auto_456401 ?auto_456409 ) ) ( not ( = ?auto_456401 ?auto_456410 ) ) ( not ( = ?auto_456402 ?auto_456403 ) ) ( not ( = ?auto_456402 ?auto_456404 ) ) ( not ( = ?auto_456402 ?auto_456405 ) ) ( not ( = ?auto_456402 ?auto_456406 ) ) ( not ( = ?auto_456402 ?auto_456407 ) ) ( not ( = ?auto_456402 ?auto_456408 ) ) ( not ( = ?auto_456402 ?auto_456409 ) ) ( not ( = ?auto_456402 ?auto_456410 ) ) ( not ( = ?auto_456403 ?auto_456404 ) ) ( not ( = ?auto_456403 ?auto_456405 ) ) ( not ( = ?auto_456403 ?auto_456406 ) ) ( not ( = ?auto_456403 ?auto_456407 ) ) ( not ( = ?auto_456403 ?auto_456408 ) ) ( not ( = ?auto_456403 ?auto_456409 ) ) ( not ( = ?auto_456403 ?auto_456410 ) ) ( not ( = ?auto_456404 ?auto_456405 ) ) ( not ( = ?auto_456404 ?auto_456406 ) ) ( not ( = ?auto_456404 ?auto_456407 ) ) ( not ( = ?auto_456404 ?auto_456408 ) ) ( not ( = ?auto_456404 ?auto_456409 ) ) ( not ( = ?auto_456404 ?auto_456410 ) ) ( not ( = ?auto_456405 ?auto_456406 ) ) ( not ( = ?auto_456405 ?auto_456407 ) ) ( not ( = ?auto_456405 ?auto_456408 ) ) ( not ( = ?auto_456405 ?auto_456409 ) ) ( not ( = ?auto_456405 ?auto_456410 ) ) ( not ( = ?auto_456406 ?auto_456407 ) ) ( not ( = ?auto_456406 ?auto_456408 ) ) ( not ( = ?auto_456406 ?auto_456409 ) ) ( not ( = ?auto_456406 ?auto_456410 ) ) ( not ( = ?auto_456407 ?auto_456408 ) ) ( not ( = ?auto_456407 ?auto_456409 ) ) ( not ( = ?auto_456407 ?auto_456410 ) ) ( not ( = ?auto_456408 ?auto_456409 ) ) ( not ( = ?auto_456408 ?auto_456410 ) ) ( not ( = ?auto_456409 ?auto_456410 ) ) ( ON ?auto_456408 ?auto_456409 ) ( ON ?auto_456407 ?auto_456408 ) ( ON ?auto_456406 ?auto_456407 ) ( ON ?auto_456405 ?auto_456406 ) ( CLEAR ?auto_456403 ) ( ON ?auto_456404 ?auto_456405 ) ( CLEAR ?auto_456404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_456399 ?auto_456400 ?auto_456401 ?auto_456402 ?auto_456403 ?auto_456404 )
      ( MAKE-11PILE ?auto_456399 ?auto_456400 ?auto_456401 ?auto_456402 ?auto_456403 ?auto_456404 ?auto_456405 ?auto_456406 ?auto_456407 ?auto_456408 ?auto_456409 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_456445 - BLOCK
      ?auto_456446 - BLOCK
      ?auto_456447 - BLOCK
      ?auto_456448 - BLOCK
      ?auto_456449 - BLOCK
      ?auto_456450 - BLOCK
      ?auto_456451 - BLOCK
      ?auto_456452 - BLOCK
      ?auto_456453 - BLOCK
      ?auto_456454 - BLOCK
      ?auto_456455 - BLOCK
    )
    :vars
    (
      ?auto_456456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456455 ?auto_456456 ) ( ON-TABLE ?auto_456445 ) ( ON ?auto_456446 ?auto_456445 ) ( ON ?auto_456447 ?auto_456446 ) ( ON ?auto_456448 ?auto_456447 ) ( not ( = ?auto_456445 ?auto_456446 ) ) ( not ( = ?auto_456445 ?auto_456447 ) ) ( not ( = ?auto_456445 ?auto_456448 ) ) ( not ( = ?auto_456445 ?auto_456449 ) ) ( not ( = ?auto_456445 ?auto_456450 ) ) ( not ( = ?auto_456445 ?auto_456451 ) ) ( not ( = ?auto_456445 ?auto_456452 ) ) ( not ( = ?auto_456445 ?auto_456453 ) ) ( not ( = ?auto_456445 ?auto_456454 ) ) ( not ( = ?auto_456445 ?auto_456455 ) ) ( not ( = ?auto_456445 ?auto_456456 ) ) ( not ( = ?auto_456446 ?auto_456447 ) ) ( not ( = ?auto_456446 ?auto_456448 ) ) ( not ( = ?auto_456446 ?auto_456449 ) ) ( not ( = ?auto_456446 ?auto_456450 ) ) ( not ( = ?auto_456446 ?auto_456451 ) ) ( not ( = ?auto_456446 ?auto_456452 ) ) ( not ( = ?auto_456446 ?auto_456453 ) ) ( not ( = ?auto_456446 ?auto_456454 ) ) ( not ( = ?auto_456446 ?auto_456455 ) ) ( not ( = ?auto_456446 ?auto_456456 ) ) ( not ( = ?auto_456447 ?auto_456448 ) ) ( not ( = ?auto_456447 ?auto_456449 ) ) ( not ( = ?auto_456447 ?auto_456450 ) ) ( not ( = ?auto_456447 ?auto_456451 ) ) ( not ( = ?auto_456447 ?auto_456452 ) ) ( not ( = ?auto_456447 ?auto_456453 ) ) ( not ( = ?auto_456447 ?auto_456454 ) ) ( not ( = ?auto_456447 ?auto_456455 ) ) ( not ( = ?auto_456447 ?auto_456456 ) ) ( not ( = ?auto_456448 ?auto_456449 ) ) ( not ( = ?auto_456448 ?auto_456450 ) ) ( not ( = ?auto_456448 ?auto_456451 ) ) ( not ( = ?auto_456448 ?auto_456452 ) ) ( not ( = ?auto_456448 ?auto_456453 ) ) ( not ( = ?auto_456448 ?auto_456454 ) ) ( not ( = ?auto_456448 ?auto_456455 ) ) ( not ( = ?auto_456448 ?auto_456456 ) ) ( not ( = ?auto_456449 ?auto_456450 ) ) ( not ( = ?auto_456449 ?auto_456451 ) ) ( not ( = ?auto_456449 ?auto_456452 ) ) ( not ( = ?auto_456449 ?auto_456453 ) ) ( not ( = ?auto_456449 ?auto_456454 ) ) ( not ( = ?auto_456449 ?auto_456455 ) ) ( not ( = ?auto_456449 ?auto_456456 ) ) ( not ( = ?auto_456450 ?auto_456451 ) ) ( not ( = ?auto_456450 ?auto_456452 ) ) ( not ( = ?auto_456450 ?auto_456453 ) ) ( not ( = ?auto_456450 ?auto_456454 ) ) ( not ( = ?auto_456450 ?auto_456455 ) ) ( not ( = ?auto_456450 ?auto_456456 ) ) ( not ( = ?auto_456451 ?auto_456452 ) ) ( not ( = ?auto_456451 ?auto_456453 ) ) ( not ( = ?auto_456451 ?auto_456454 ) ) ( not ( = ?auto_456451 ?auto_456455 ) ) ( not ( = ?auto_456451 ?auto_456456 ) ) ( not ( = ?auto_456452 ?auto_456453 ) ) ( not ( = ?auto_456452 ?auto_456454 ) ) ( not ( = ?auto_456452 ?auto_456455 ) ) ( not ( = ?auto_456452 ?auto_456456 ) ) ( not ( = ?auto_456453 ?auto_456454 ) ) ( not ( = ?auto_456453 ?auto_456455 ) ) ( not ( = ?auto_456453 ?auto_456456 ) ) ( not ( = ?auto_456454 ?auto_456455 ) ) ( not ( = ?auto_456454 ?auto_456456 ) ) ( not ( = ?auto_456455 ?auto_456456 ) ) ( ON ?auto_456454 ?auto_456455 ) ( ON ?auto_456453 ?auto_456454 ) ( ON ?auto_456452 ?auto_456453 ) ( ON ?auto_456451 ?auto_456452 ) ( ON ?auto_456450 ?auto_456451 ) ( CLEAR ?auto_456448 ) ( ON ?auto_456449 ?auto_456450 ) ( CLEAR ?auto_456449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_456445 ?auto_456446 ?auto_456447 ?auto_456448 ?auto_456449 )
      ( MAKE-11PILE ?auto_456445 ?auto_456446 ?auto_456447 ?auto_456448 ?auto_456449 ?auto_456450 ?auto_456451 ?auto_456452 ?auto_456453 ?auto_456454 ?auto_456455 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_456491 - BLOCK
      ?auto_456492 - BLOCK
      ?auto_456493 - BLOCK
      ?auto_456494 - BLOCK
      ?auto_456495 - BLOCK
      ?auto_456496 - BLOCK
      ?auto_456497 - BLOCK
      ?auto_456498 - BLOCK
      ?auto_456499 - BLOCK
      ?auto_456500 - BLOCK
      ?auto_456501 - BLOCK
    )
    :vars
    (
      ?auto_456502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456501 ?auto_456502 ) ( ON-TABLE ?auto_456491 ) ( ON ?auto_456492 ?auto_456491 ) ( ON ?auto_456493 ?auto_456492 ) ( not ( = ?auto_456491 ?auto_456492 ) ) ( not ( = ?auto_456491 ?auto_456493 ) ) ( not ( = ?auto_456491 ?auto_456494 ) ) ( not ( = ?auto_456491 ?auto_456495 ) ) ( not ( = ?auto_456491 ?auto_456496 ) ) ( not ( = ?auto_456491 ?auto_456497 ) ) ( not ( = ?auto_456491 ?auto_456498 ) ) ( not ( = ?auto_456491 ?auto_456499 ) ) ( not ( = ?auto_456491 ?auto_456500 ) ) ( not ( = ?auto_456491 ?auto_456501 ) ) ( not ( = ?auto_456491 ?auto_456502 ) ) ( not ( = ?auto_456492 ?auto_456493 ) ) ( not ( = ?auto_456492 ?auto_456494 ) ) ( not ( = ?auto_456492 ?auto_456495 ) ) ( not ( = ?auto_456492 ?auto_456496 ) ) ( not ( = ?auto_456492 ?auto_456497 ) ) ( not ( = ?auto_456492 ?auto_456498 ) ) ( not ( = ?auto_456492 ?auto_456499 ) ) ( not ( = ?auto_456492 ?auto_456500 ) ) ( not ( = ?auto_456492 ?auto_456501 ) ) ( not ( = ?auto_456492 ?auto_456502 ) ) ( not ( = ?auto_456493 ?auto_456494 ) ) ( not ( = ?auto_456493 ?auto_456495 ) ) ( not ( = ?auto_456493 ?auto_456496 ) ) ( not ( = ?auto_456493 ?auto_456497 ) ) ( not ( = ?auto_456493 ?auto_456498 ) ) ( not ( = ?auto_456493 ?auto_456499 ) ) ( not ( = ?auto_456493 ?auto_456500 ) ) ( not ( = ?auto_456493 ?auto_456501 ) ) ( not ( = ?auto_456493 ?auto_456502 ) ) ( not ( = ?auto_456494 ?auto_456495 ) ) ( not ( = ?auto_456494 ?auto_456496 ) ) ( not ( = ?auto_456494 ?auto_456497 ) ) ( not ( = ?auto_456494 ?auto_456498 ) ) ( not ( = ?auto_456494 ?auto_456499 ) ) ( not ( = ?auto_456494 ?auto_456500 ) ) ( not ( = ?auto_456494 ?auto_456501 ) ) ( not ( = ?auto_456494 ?auto_456502 ) ) ( not ( = ?auto_456495 ?auto_456496 ) ) ( not ( = ?auto_456495 ?auto_456497 ) ) ( not ( = ?auto_456495 ?auto_456498 ) ) ( not ( = ?auto_456495 ?auto_456499 ) ) ( not ( = ?auto_456495 ?auto_456500 ) ) ( not ( = ?auto_456495 ?auto_456501 ) ) ( not ( = ?auto_456495 ?auto_456502 ) ) ( not ( = ?auto_456496 ?auto_456497 ) ) ( not ( = ?auto_456496 ?auto_456498 ) ) ( not ( = ?auto_456496 ?auto_456499 ) ) ( not ( = ?auto_456496 ?auto_456500 ) ) ( not ( = ?auto_456496 ?auto_456501 ) ) ( not ( = ?auto_456496 ?auto_456502 ) ) ( not ( = ?auto_456497 ?auto_456498 ) ) ( not ( = ?auto_456497 ?auto_456499 ) ) ( not ( = ?auto_456497 ?auto_456500 ) ) ( not ( = ?auto_456497 ?auto_456501 ) ) ( not ( = ?auto_456497 ?auto_456502 ) ) ( not ( = ?auto_456498 ?auto_456499 ) ) ( not ( = ?auto_456498 ?auto_456500 ) ) ( not ( = ?auto_456498 ?auto_456501 ) ) ( not ( = ?auto_456498 ?auto_456502 ) ) ( not ( = ?auto_456499 ?auto_456500 ) ) ( not ( = ?auto_456499 ?auto_456501 ) ) ( not ( = ?auto_456499 ?auto_456502 ) ) ( not ( = ?auto_456500 ?auto_456501 ) ) ( not ( = ?auto_456500 ?auto_456502 ) ) ( not ( = ?auto_456501 ?auto_456502 ) ) ( ON ?auto_456500 ?auto_456501 ) ( ON ?auto_456499 ?auto_456500 ) ( ON ?auto_456498 ?auto_456499 ) ( ON ?auto_456497 ?auto_456498 ) ( ON ?auto_456496 ?auto_456497 ) ( ON ?auto_456495 ?auto_456496 ) ( CLEAR ?auto_456493 ) ( ON ?auto_456494 ?auto_456495 ) ( CLEAR ?auto_456494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_456491 ?auto_456492 ?auto_456493 ?auto_456494 )
      ( MAKE-11PILE ?auto_456491 ?auto_456492 ?auto_456493 ?auto_456494 ?auto_456495 ?auto_456496 ?auto_456497 ?auto_456498 ?auto_456499 ?auto_456500 ?auto_456501 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_456537 - BLOCK
      ?auto_456538 - BLOCK
      ?auto_456539 - BLOCK
      ?auto_456540 - BLOCK
      ?auto_456541 - BLOCK
      ?auto_456542 - BLOCK
      ?auto_456543 - BLOCK
      ?auto_456544 - BLOCK
      ?auto_456545 - BLOCK
      ?auto_456546 - BLOCK
      ?auto_456547 - BLOCK
    )
    :vars
    (
      ?auto_456548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456547 ?auto_456548 ) ( ON-TABLE ?auto_456537 ) ( ON ?auto_456538 ?auto_456537 ) ( not ( = ?auto_456537 ?auto_456538 ) ) ( not ( = ?auto_456537 ?auto_456539 ) ) ( not ( = ?auto_456537 ?auto_456540 ) ) ( not ( = ?auto_456537 ?auto_456541 ) ) ( not ( = ?auto_456537 ?auto_456542 ) ) ( not ( = ?auto_456537 ?auto_456543 ) ) ( not ( = ?auto_456537 ?auto_456544 ) ) ( not ( = ?auto_456537 ?auto_456545 ) ) ( not ( = ?auto_456537 ?auto_456546 ) ) ( not ( = ?auto_456537 ?auto_456547 ) ) ( not ( = ?auto_456537 ?auto_456548 ) ) ( not ( = ?auto_456538 ?auto_456539 ) ) ( not ( = ?auto_456538 ?auto_456540 ) ) ( not ( = ?auto_456538 ?auto_456541 ) ) ( not ( = ?auto_456538 ?auto_456542 ) ) ( not ( = ?auto_456538 ?auto_456543 ) ) ( not ( = ?auto_456538 ?auto_456544 ) ) ( not ( = ?auto_456538 ?auto_456545 ) ) ( not ( = ?auto_456538 ?auto_456546 ) ) ( not ( = ?auto_456538 ?auto_456547 ) ) ( not ( = ?auto_456538 ?auto_456548 ) ) ( not ( = ?auto_456539 ?auto_456540 ) ) ( not ( = ?auto_456539 ?auto_456541 ) ) ( not ( = ?auto_456539 ?auto_456542 ) ) ( not ( = ?auto_456539 ?auto_456543 ) ) ( not ( = ?auto_456539 ?auto_456544 ) ) ( not ( = ?auto_456539 ?auto_456545 ) ) ( not ( = ?auto_456539 ?auto_456546 ) ) ( not ( = ?auto_456539 ?auto_456547 ) ) ( not ( = ?auto_456539 ?auto_456548 ) ) ( not ( = ?auto_456540 ?auto_456541 ) ) ( not ( = ?auto_456540 ?auto_456542 ) ) ( not ( = ?auto_456540 ?auto_456543 ) ) ( not ( = ?auto_456540 ?auto_456544 ) ) ( not ( = ?auto_456540 ?auto_456545 ) ) ( not ( = ?auto_456540 ?auto_456546 ) ) ( not ( = ?auto_456540 ?auto_456547 ) ) ( not ( = ?auto_456540 ?auto_456548 ) ) ( not ( = ?auto_456541 ?auto_456542 ) ) ( not ( = ?auto_456541 ?auto_456543 ) ) ( not ( = ?auto_456541 ?auto_456544 ) ) ( not ( = ?auto_456541 ?auto_456545 ) ) ( not ( = ?auto_456541 ?auto_456546 ) ) ( not ( = ?auto_456541 ?auto_456547 ) ) ( not ( = ?auto_456541 ?auto_456548 ) ) ( not ( = ?auto_456542 ?auto_456543 ) ) ( not ( = ?auto_456542 ?auto_456544 ) ) ( not ( = ?auto_456542 ?auto_456545 ) ) ( not ( = ?auto_456542 ?auto_456546 ) ) ( not ( = ?auto_456542 ?auto_456547 ) ) ( not ( = ?auto_456542 ?auto_456548 ) ) ( not ( = ?auto_456543 ?auto_456544 ) ) ( not ( = ?auto_456543 ?auto_456545 ) ) ( not ( = ?auto_456543 ?auto_456546 ) ) ( not ( = ?auto_456543 ?auto_456547 ) ) ( not ( = ?auto_456543 ?auto_456548 ) ) ( not ( = ?auto_456544 ?auto_456545 ) ) ( not ( = ?auto_456544 ?auto_456546 ) ) ( not ( = ?auto_456544 ?auto_456547 ) ) ( not ( = ?auto_456544 ?auto_456548 ) ) ( not ( = ?auto_456545 ?auto_456546 ) ) ( not ( = ?auto_456545 ?auto_456547 ) ) ( not ( = ?auto_456545 ?auto_456548 ) ) ( not ( = ?auto_456546 ?auto_456547 ) ) ( not ( = ?auto_456546 ?auto_456548 ) ) ( not ( = ?auto_456547 ?auto_456548 ) ) ( ON ?auto_456546 ?auto_456547 ) ( ON ?auto_456545 ?auto_456546 ) ( ON ?auto_456544 ?auto_456545 ) ( ON ?auto_456543 ?auto_456544 ) ( ON ?auto_456542 ?auto_456543 ) ( ON ?auto_456541 ?auto_456542 ) ( ON ?auto_456540 ?auto_456541 ) ( CLEAR ?auto_456538 ) ( ON ?auto_456539 ?auto_456540 ) ( CLEAR ?auto_456539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_456537 ?auto_456538 ?auto_456539 )
      ( MAKE-11PILE ?auto_456537 ?auto_456538 ?auto_456539 ?auto_456540 ?auto_456541 ?auto_456542 ?auto_456543 ?auto_456544 ?auto_456545 ?auto_456546 ?auto_456547 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_456583 - BLOCK
      ?auto_456584 - BLOCK
      ?auto_456585 - BLOCK
      ?auto_456586 - BLOCK
      ?auto_456587 - BLOCK
      ?auto_456588 - BLOCK
      ?auto_456589 - BLOCK
      ?auto_456590 - BLOCK
      ?auto_456591 - BLOCK
      ?auto_456592 - BLOCK
      ?auto_456593 - BLOCK
    )
    :vars
    (
      ?auto_456594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456593 ?auto_456594 ) ( ON-TABLE ?auto_456583 ) ( not ( = ?auto_456583 ?auto_456584 ) ) ( not ( = ?auto_456583 ?auto_456585 ) ) ( not ( = ?auto_456583 ?auto_456586 ) ) ( not ( = ?auto_456583 ?auto_456587 ) ) ( not ( = ?auto_456583 ?auto_456588 ) ) ( not ( = ?auto_456583 ?auto_456589 ) ) ( not ( = ?auto_456583 ?auto_456590 ) ) ( not ( = ?auto_456583 ?auto_456591 ) ) ( not ( = ?auto_456583 ?auto_456592 ) ) ( not ( = ?auto_456583 ?auto_456593 ) ) ( not ( = ?auto_456583 ?auto_456594 ) ) ( not ( = ?auto_456584 ?auto_456585 ) ) ( not ( = ?auto_456584 ?auto_456586 ) ) ( not ( = ?auto_456584 ?auto_456587 ) ) ( not ( = ?auto_456584 ?auto_456588 ) ) ( not ( = ?auto_456584 ?auto_456589 ) ) ( not ( = ?auto_456584 ?auto_456590 ) ) ( not ( = ?auto_456584 ?auto_456591 ) ) ( not ( = ?auto_456584 ?auto_456592 ) ) ( not ( = ?auto_456584 ?auto_456593 ) ) ( not ( = ?auto_456584 ?auto_456594 ) ) ( not ( = ?auto_456585 ?auto_456586 ) ) ( not ( = ?auto_456585 ?auto_456587 ) ) ( not ( = ?auto_456585 ?auto_456588 ) ) ( not ( = ?auto_456585 ?auto_456589 ) ) ( not ( = ?auto_456585 ?auto_456590 ) ) ( not ( = ?auto_456585 ?auto_456591 ) ) ( not ( = ?auto_456585 ?auto_456592 ) ) ( not ( = ?auto_456585 ?auto_456593 ) ) ( not ( = ?auto_456585 ?auto_456594 ) ) ( not ( = ?auto_456586 ?auto_456587 ) ) ( not ( = ?auto_456586 ?auto_456588 ) ) ( not ( = ?auto_456586 ?auto_456589 ) ) ( not ( = ?auto_456586 ?auto_456590 ) ) ( not ( = ?auto_456586 ?auto_456591 ) ) ( not ( = ?auto_456586 ?auto_456592 ) ) ( not ( = ?auto_456586 ?auto_456593 ) ) ( not ( = ?auto_456586 ?auto_456594 ) ) ( not ( = ?auto_456587 ?auto_456588 ) ) ( not ( = ?auto_456587 ?auto_456589 ) ) ( not ( = ?auto_456587 ?auto_456590 ) ) ( not ( = ?auto_456587 ?auto_456591 ) ) ( not ( = ?auto_456587 ?auto_456592 ) ) ( not ( = ?auto_456587 ?auto_456593 ) ) ( not ( = ?auto_456587 ?auto_456594 ) ) ( not ( = ?auto_456588 ?auto_456589 ) ) ( not ( = ?auto_456588 ?auto_456590 ) ) ( not ( = ?auto_456588 ?auto_456591 ) ) ( not ( = ?auto_456588 ?auto_456592 ) ) ( not ( = ?auto_456588 ?auto_456593 ) ) ( not ( = ?auto_456588 ?auto_456594 ) ) ( not ( = ?auto_456589 ?auto_456590 ) ) ( not ( = ?auto_456589 ?auto_456591 ) ) ( not ( = ?auto_456589 ?auto_456592 ) ) ( not ( = ?auto_456589 ?auto_456593 ) ) ( not ( = ?auto_456589 ?auto_456594 ) ) ( not ( = ?auto_456590 ?auto_456591 ) ) ( not ( = ?auto_456590 ?auto_456592 ) ) ( not ( = ?auto_456590 ?auto_456593 ) ) ( not ( = ?auto_456590 ?auto_456594 ) ) ( not ( = ?auto_456591 ?auto_456592 ) ) ( not ( = ?auto_456591 ?auto_456593 ) ) ( not ( = ?auto_456591 ?auto_456594 ) ) ( not ( = ?auto_456592 ?auto_456593 ) ) ( not ( = ?auto_456592 ?auto_456594 ) ) ( not ( = ?auto_456593 ?auto_456594 ) ) ( ON ?auto_456592 ?auto_456593 ) ( ON ?auto_456591 ?auto_456592 ) ( ON ?auto_456590 ?auto_456591 ) ( ON ?auto_456589 ?auto_456590 ) ( ON ?auto_456588 ?auto_456589 ) ( ON ?auto_456587 ?auto_456588 ) ( ON ?auto_456586 ?auto_456587 ) ( ON ?auto_456585 ?auto_456586 ) ( CLEAR ?auto_456583 ) ( ON ?auto_456584 ?auto_456585 ) ( CLEAR ?auto_456584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_456583 ?auto_456584 )
      ( MAKE-11PILE ?auto_456583 ?auto_456584 ?auto_456585 ?auto_456586 ?auto_456587 ?auto_456588 ?auto_456589 ?auto_456590 ?auto_456591 ?auto_456592 ?auto_456593 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_456629 - BLOCK
      ?auto_456630 - BLOCK
      ?auto_456631 - BLOCK
      ?auto_456632 - BLOCK
      ?auto_456633 - BLOCK
      ?auto_456634 - BLOCK
      ?auto_456635 - BLOCK
      ?auto_456636 - BLOCK
      ?auto_456637 - BLOCK
      ?auto_456638 - BLOCK
      ?auto_456639 - BLOCK
    )
    :vars
    (
      ?auto_456640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456639 ?auto_456640 ) ( not ( = ?auto_456629 ?auto_456630 ) ) ( not ( = ?auto_456629 ?auto_456631 ) ) ( not ( = ?auto_456629 ?auto_456632 ) ) ( not ( = ?auto_456629 ?auto_456633 ) ) ( not ( = ?auto_456629 ?auto_456634 ) ) ( not ( = ?auto_456629 ?auto_456635 ) ) ( not ( = ?auto_456629 ?auto_456636 ) ) ( not ( = ?auto_456629 ?auto_456637 ) ) ( not ( = ?auto_456629 ?auto_456638 ) ) ( not ( = ?auto_456629 ?auto_456639 ) ) ( not ( = ?auto_456629 ?auto_456640 ) ) ( not ( = ?auto_456630 ?auto_456631 ) ) ( not ( = ?auto_456630 ?auto_456632 ) ) ( not ( = ?auto_456630 ?auto_456633 ) ) ( not ( = ?auto_456630 ?auto_456634 ) ) ( not ( = ?auto_456630 ?auto_456635 ) ) ( not ( = ?auto_456630 ?auto_456636 ) ) ( not ( = ?auto_456630 ?auto_456637 ) ) ( not ( = ?auto_456630 ?auto_456638 ) ) ( not ( = ?auto_456630 ?auto_456639 ) ) ( not ( = ?auto_456630 ?auto_456640 ) ) ( not ( = ?auto_456631 ?auto_456632 ) ) ( not ( = ?auto_456631 ?auto_456633 ) ) ( not ( = ?auto_456631 ?auto_456634 ) ) ( not ( = ?auto_456631 ?auto_456635 ) ) ( not ( = ?auto_456631 ?auto_456636 ) ) ( not ( = ?auto_456631 ?auto_456637 ) ) ( not ( = ?auto_456631 ?auto_456638 ) ) ( not ( = ?auto_456631 ?auto_456639 ) ) ( not ( = ?auto_456631 ?auto_456640 ) ) ( not ( = ?auto_456632 ?auto_456633 ) ) ( not ( = ?auto_456632 ?auto_456634 ) ) ( not ( = ?auto_456632 ?auto_456635 ) ) ( not ( = ?auto_456632 ?auto_456636 ) ) ( not ( = ?auto_456632 ?auto_456637 ) ) ( not ( = ?auto_456632 ?auto_456638 ) ) ( not ( = ?auto_456632 ?auto_456639 ) ) ( not ( = ?auto_456632 ?auto_456640 ) ) ( not ( = ?auto_456633 ?auto_456634 ) ) ( not ( = ?auto_456633 ?auto_456635 ) ) ( not ( = ?auto_456633 ?auto_456636 ) ) ( not ( = ?auto_456633 ?auto_456637 ) ) ( not ( = ?auto_456633 ?auto_456638 ) ) ( not ( = ?auto_456633 ?auto_456639 ) ) ( not ( = ?auto_456633 ?auto_456640 ) ) ( not ( = ?auto_456634 ?auto_456635 ) ) ( not ( = ?auto_456634 ?auto_456636 ) ) ( not ( = ?auto_456634 ?auto_456637 ) ) ( not ( = ?auto_456634 ?auto_456638 ) ) ( not ( = ?auto_456634 ?auto_456639 ) ) ( not ( = ?auto_456634 ?auto_456640 ) ) ( not ( = ?auto_456635 ?auto_456636 ) ) ( not ( = ?auto_456635 ?auto_456637 ) ) ( not ( = ?auto_456635 ?auto_456638 ) ) ( not ( = ?auto_456635 ?auto_456639 ) ) ( not ( = ?auto_456635 ?auto_456640 ) ) ( not ( = ?auto_456636 ?auto_456637 ) ) ( not ( = ?auto_456636 ?auto_456638 ) ) ( not ( = ?auto_456636 ?auto_456639 ) ) ( not ( = ?auto_456636 ?auto_456640 ) ) ( not ( = ?auto_456637 ?auto_456638 ) ) ( not ( = ?auto_456637 ?auto_456639 ) ) ( not ( = ?auto_456637 ?auto_456640 ) ) ( not ( = ?auto_456638 ?auto_456639 ) ) ( not ( = ?auto_456638 ?auto_456640 ) ) ( not ( = ?auto_456639 ?auto_456640 ) ) ( ON ?auto_456638 ?auto_456639 ) ( ON ?auto_456637 ?auto_456638 ) ( ON ?auto_456636 ?auto_456637 ) ( ON ?auto_456635 ?auto_456636 ) ( ON ?auto_456634 ?auto_456635 ) ( ON ?auto_456633 ?auto_456634 ) ( ON ?auto_456632 ?auto_456633 ) ( ON ?auto_456631 ?auto_456632 ) ( ON ?auto_456630 ?auto_456631 ) ( ON ?auto_456629 ?auto_456630 ) ( CLEAR ?auto_456629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_456629 )
      ( MAKE-11PILE ?auto_456629 ?auto_456630 ?auto_456631 ?auto_456632 ?auto_456633 ?auto_456634 ?auto_456635 ?auto_456636 ?auto_456637 ?auto_456638 ?auto_456639 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_456676 - BLOCK
      ?auto_456677 - BLOCK
      ?auto_456678 - BLOCK
      ?auto_456679 - BLOCK
      ?auto_456680 - BLOCK
      ?auto_456681 - BLOCK
      ?auto_456682 - BLOCK
      ?auto_456683 - BLOCK
      ?auto_456684 - BLOCK
      ?auto_456685 - BLOCK
      ?auto_456686 - BLOCK
      ?auto_456687 - BLOCK
    )
    :vars
    (
      ?auto_456688 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_456686 ) ( ON ?auto_456687 ?auto_456688 ) ( CLEAR ?auto_456687 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_456676 ) ( ON ?auto_456677 ?auto_456676 ) ( ON ?auto_456678 ?auto_456677 ) ( ON ?auto_456679 ?auto_456678 ) ( ON ?auto_456680 ?auto_456679 ) ( ON ?auto_456681 ?auto_456680 ) ( ON ?auto_456682 ?auto_456681 ) ( ON ?auto_456683 ?auto_456682 ) ( ON ?auto_456684 ?auto_456683 ) ( ON ?auto_456685 ?auto_456684 ) ( ON ?auto_456686 ?auto_456685 ) ( not ( = ?auto_456676 ?auto_456677 ) ) ( not ( = ?auto_456676 ?auto_456678 ) ) ( not ( = ?auto_456676 ?auto_456679 ) ) ( not ( = ?auto_456676 ?auto_456680 ) ) ( not ( = ?auto_456676 ?auto_456681 ) ) ( not ( = ?auto_456676 ?auto_456682 ) ) ( not ( = ?auto_456676 ?auto_456683 ) ) ( not ( = ?auto_456676 ?auto_456684 ) ) ( not ( = ?auto_456676 ?auto_456685 ) ) ( not ( = ?auto_456676 ?auto_456686 ) ) ( not ( = ?auto_456676 ?auto_456687 ) ) ( not ( = ?auto_456676 ?auto_456688 ) ) ( not ( = ?auto_456677 ?auto_456678 ) ) ( not ( = ?auto_456677 ?auto_456679 ) ) ( not ( = ?auto_456677 ?auto_456680 ) ) ( not ( = ?auto_456677 ?auto_456681 ) ) ( not ( = ?auto_456677 ?auto_456682 ) ) ( not ( = ?auto_456677 ?auto_456683 ) ) ( not ( = ?auto_456677 ?auto_456684 ) ) ( not ( = ?auto_456677 ?auto_456685 ) ) ( not ( = ?auto_456677 ?auto_456686 ) ) ( not ( = ?auto_456677 ?auto_456687 ) ) ( not ( = ?auto_456677 ?auto_456688 ) ) ( not ( = ?auto_456678 ?auto_456679 ) ) ( not ( = ?auto_456678 ?auto_456680 ) ) ( not ( = ?auto_456678 ?auto_456681 ) ) ( not ( = ?auto_456678 ?auto_456682 ) ) ( not ( = ?auto_456678 ?auto_456683 ) ) ( not ( = ?auto_456678 ?auto_456684 ) ) ( not ( = ?auto_456678 ?auto_456685 ) ) ( not ( = ?auto_456678 ?auto_456686 ) ) ( not ( = ?auto_456678 ?auto_456687 ) ) ( not ( = ?auto_456678 ?auto_456688 ) ) ( not ( = ?auto_456679 ?auto_456680 ) ) ( not ( = ?auto_456679 ?auto_456681 ) ) ( not ( = ?auto_456679 ?auto_456682 ) ) ( not ( = ?auto_456679 ?auto_456683 ) ) ( not ( = ?auto_456679 ?auto_456684 ) ) ( not ( = ?auto_456679 ?auto_456685 ) ) ( not ( = ?auto_456679 ?auto_456686 ) ) ( not ( = ?auto_456679 ?auto_456687 ) ) ( not ( = ?auto_456679 ?auto_456688 ) ) ( not ( = ?auto_456680 ?auto_456681 ) ) ( not ( = ?auto_456680 ?auto_456682 ) ) ( not ( = ?auto_456680 ?auto_456683 ) ) ( not ( = ?auto_456680 ?auto_456684 ) ) ( not ( = ?auto_456680 ?auto_456685 ) ) ( not ( = ?auto_456680 ?auto_456686 ) ) ( not ( = ?auto_456680 ?auto_456687 ) ) ( not ( = ?auto_456680 ?auto_456688 ) ) ( not ( = ?auto_456681 ?auto_456682 ) ) ( not ( = ?auto_456681 ?auto_456683 ) ) ( not ( = ?auto_456681 ?auto_456684 ) ) ( not ( = ?auto_456681 ?auto_456685 ) ) ( not ( = ?auto_456681 ?auto_456686 ) ) ( not ( = ?auto_456681 ?auto_456687 ) ) ( not ( = ?auto_456681 ?auto_456688 ) ) ( not ( = ?auto_456682 ?auto_456683 ) ) ( not ( = ?auto_456682 ?auto_456684 ) ) ( not ( = ?auto_456682 ?auto_456685 ) ) ( not ( = ?auto_456682 ?auto_456686 ) ) ( not ( = ?auto_456682 ?auto_456687 ) ) ( not ( = ?auto_456682 ?auto_456688 ) ) ( not ( = ?auto_456683 ?auto_456684 ) ) ( not ( = ?auto_456683 ?auto_456685 ) ) ( not ( = ?auto_456683 ?auto_456686 ) ) ( not ( = ?auto_456683 ?auto_456687 ) ) ( not ( = ?auto_456683 ?auto_456688 ) ) ( not ( = ?auto_456684 ?auto_456685 ) ) ( not ( = ?auto_456684 ?auto_456686 ) ) ( not ( = ?auto_456684 ?auto_456687 ) ) ( not ( = ?auto_456684 ?auto_456688 ) ) ( not ( = ?auto_456685 ?auto_456686 ) ) ( not ( = ?auto_456685 ?auto_456687 ) ) ( not ( = ?auto_456685 ?auto_456688 ) ) ( not ( = ?auto_456686 ?auto_456687 ) ) ( not ( = ?auto_456686 ?auto_456688 ) ) ( not ( = ?auto_456687 ?auto_456688 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_456687 ?auto_456688 )
      ( !STACK ?auto_456687 ?auto_456686 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_456726 - BLOCK
      ?auto_456727 - BLOCK
      ?auto_456728 - BLOCK
      ?auto_456729 - BLOCK
      ?auto_456730 - BLOCK
      ?auto_456731 - BLOCK
      ?auto_456732 - BLOCK
      ?auto_456733 - BLOCK
      ?auto_456734 - BLOCK
      ?auto_456735 - BLOCK
      ?auto_456736 - BLOCK
      ?auto_456737 - BLOCK
    )
    :vars
    (
      ?auto_456738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456737 ?auto_456738 ) ( ON-TABLE ?auto_456726 ) ( ON ?auto_456727 ?auto_456726 ) ( ON ?auto_456728 ?auto_456727 ) ( ON ?auto_456729 ?auto_456728 ) ( ON ?auto_456730 ?auto_456729 ) ( ON ?auto_456731 ?auto_456730 ) ( ON ?auto_456732 ?auto_456731 ) ( ON ?auto_456733 ?auto_456732 ) ( ON ?auto_456734 ?auto_456733 ) ( ON ?auto_456735 ?auto_456734 ) ( not ( = ?auto_456726 ?auto_456727 ) ) ( not ( = ?auto_456726 ?auto_456728 ) ) ( not ( = ?auto_456726 ?auto_456729 ) ) ( not ( = ?auto_456726 ?auto_456730 ) ) ( not ( = ?auto_456726 ?auto_456731 ) ) ( not ( = ?auto_456726 ?auto_456732 ) ) ( not ( = ?auto_456726 ?auto_456733 ) ) ( not ( = ?auto_456726 ?auto_456734 ) ) ( not ( = ?auto_456726 ?auto_456735 ) ) ( not ( = ?auto_456726 ?auto_456736 ) ) ( not ( = ?auto_456726 ?auto_456737 ) ) ( not ( = ?auto_456726 ?auto_456738 ) ) ( not ( = ?auto_456727 ?auto_456728 ) ) ( not ( = ?auto_456727 ?auto_456729 ) ) ( not ( = ?auto_456727 ?auto_456730 ) ) ( not ( = ?auto_456727 ?auto_456731 ) ) ( not ( = ?auto_456727 ?auto_456732 ) ) ( not ( = ?auto_456727 ?auto_456733 ) ) ( not ( = ?auto_456727 ?auto_456734 ) ) ( not ( = ?auto_456727 ?auto_456735 ) ) ( not ( = ?auto_456727 ?auto_456736 ) ) ( not ( = ?auto_456727 ?auto_456737 ) ) ( not ( = ?auto_456727 ?auto_456738 ) ) ( not ( = ?auto_456728 ?auto_456729 ) ) ( not ( = ?auto_456728 ?auto_456730 ) ) ( not ( = ?auto_456728 ?auto_456731 ) ) ( not ( = ?auto_456728 ?auto_456732 ) ) ( not ( = ?auto_456728 ?auto_456733 ) ) ( not ( = ?auto_456728 ?auto_456734 ) ) ( not ( = ?auto_456728 ?auto_456735 ) ) ( not ( = ?auto_456728 ?auto_456736 ) ) ( not ( = ?auto_456728 ?auto_456737 ) ) ( not ( = ?auto_456728 ?auto_456738 ) ) ( not ( = ?auto_456729 ?auto_456730 ) ) ( not ( = ?auto_456729 ?auto_456731 ) ) ( not ( = ?auto_456729 ?auto_456732 ) ) ( not ( = ?auto_456729 ?auto_456733 ) ) ( not ( = ?auto_456729 ?auto_456734 ) ) ( not ( = ?auto_456729 ?auto_456735 ) ) ( not ( = ?auto_456729 ?auto_456736 ) ) ( not ( = ?auto_456729 ?auto_456737 ) ) ( not ( = ?auto_456729 ?auto_456738 ) ) ( not ( = ?auto_456730 ?auto_456731 ) ) ( not ( = ?auto_456730 ?auto_456732 ) ) ( not ( = ?auto_456730 ?auto_456733 ) ) ( not ( = ?auto_456730 ?auto_456734 ) ) ( not ( = ?auto_456730 ?auto_456735 ) ) ( not ( = ?auto_456730 ?auto_456736 ) ) ( not ( = ?auto_456730 ?auto_456737 ) ) ( not ( = ?auto_456730 ?auto_456738 ) ) ( not ( = ?auto_456731 ?auto_456732 ) ) ( not ( = ?auto_456731 ?auto_456733 ) ) ( not ( = ?auto_456731 ?auto_456734 ) ) ( not ( = ?auto_456731 ?auto_456735 ) ) ( not ( = ?auto_456731 ?auto_456736 ) ) ( not ( = ?auto_456731 ?auto_456737 ) ) ( not ( = ?auto_456731 ?auto_456738 ) ) ( not ( = ?auto_456732 ?auto_456733 ) ) ( not ( = ?auto_456732 ?auto_456734 ) ) ( not ( = ?auto_456732 ?auto_456735 ) ) ( not ( = ?auto_456732 ?auto_456736 ) ) ( not ( = ?auto_456732 ?auto_456737 ) ) ( not ( = ?auto_456732 ?auto_456738 ) ) ( not ( = ?auto_456733 ?auto_456734 ) ) ( not ( = ?auto_456733 ?auto_456735 ) ) ( not ( = ?auto_456733 ?auto_456736 ) ) ( not ( = ?auto_456733 ?auto_456737 ) ) ( not ( = ?auto_456733 ?auto_456738 ) ) ( not ( = ?auto_456734 ?auto_456735 ) ) ( not ( = ?auto_456734 ?auto_456736 ) ) ( not ( = ?auto_456734 ?auto_456737 ) ) ( not ( = ?auto_456734 ?auto_456738 ) ) ( not ( = ?auto_456735 ?auto_456736 ) ) ( not ( = ?auto_456735 ?auto_456737 ) ) ( not ( = ?auto_456735 ?auto_456738 ) ) ( not ( = ?auto_456736 ?auto_456737 ) ) ( not ( = ?auto_456736 ?auto_456738 ) ) ( not ( = ?auto_456737 ?auto_456738 ) ) ( CLEAR ?auto_456735 ) ( ON ?auto_456736 ?auto_456737 ) ( CLEAR ?auto_456736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_456726 ?auto_456727 ?auto_456728 ?auto_456729 ?auto_456730 ?auto_456731 ?auto_456732 ?auto_456733 ?auto_456734 ?auto_456735 ?auto_456736 )
      ( MAKE-12PILE ?auto_456726 ?auto_456727 ?auto_456728 ?auto_456729 ?auto_456730 ?auto_456731 ?auto_456732 ?auto_456733 ?auto_456734 ?auto_456735 ?auto_456736 ?auto_456737 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_456776 - BLOCK
      ?auto_456777 - BLOCK
      ?auto_456778 - BLOCK
      ?auto_456779 - BLOCK
      ?auto_456780 - BLOCK
      ?auto_456781 - BLOCK
      ?auto_456782 - BLOCK
      ?auto_456783 - BLOCK
      ?auto_456784 - BLOCK
      ?auto_456785 - BLOCK
      ?auto_456786 - BLOCK
      ?auto_456787 - BLOCK
    )
    :vars
    (
      ?auto_456788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456787 ?auto_456788 ) ( ON-TABLE ?auto_456776 ) ( ON ?auto_456777 ?auto_456776 ) ( ON ?auto_456778 ?auto_456777 ) ( ON ?auto_456779 ?auto_456778 ) ( ON ?auto_456780 ?auto_456779 ) ( ON ?auto_456781 ?auto_456780 ) ( ON ?auto_456782 ?auto_456781 ) ( ON ?auto_456783 ?auto_456782 ) ( ON ?auto_456784 ?auto_456783 ) ( not ( = ?auto_456776 ?auto_456777 ) ) ( not ( = ?auto_456776 ?auto_456778 ) ) ( not ( = ?auto_456776 ?auto_456779 ) ) ( not ( = ?auto_456776 ?auto_456780 ) ) ( not ( = ?auto_456776 ?auto_456781 ) ) ( not ( = ?auto_456776 ?auto_456782 ) ) ( not ( = ?auto_456776 ?auto_456783 ) ) ( not ( = ?auto_456776 ?auto_456784 ) ) ( not ( = ?auto_456776 ?auto_456785 ) ) ( not ( = ?auto_456776 ?auto_456786 ) ) ( not ( = ?auto_456776 ?auto_456787 ) ) ( not ( = ?auto_456776 ?auto_456788 ) ) ( not ( = ?auto_456777 ?auto_456778 ) ) ( not ( = ?auto_456777 ?auto_456779 ) ) ( not ( = ?auto_456777 ?auto_456780 ) ) ( not ( = ?auto_456777 ?auto_456781 ) ) ( not ( = ?auto_456777 ?auto_456782 ) ) ( not ( = ?auto_456777 ?auto_456783 ) ) ( not ( = ?auto_456777 ?auto_456784 ) ) ( not ( = ?auto_456777 ?auto_456785 ) ) ( not ( = ?auto_456777 ?auto_456786 ) ) ( not ( = ?auto_456777 ?auto_456787 ) ) ( not ( = ?auto_456777 ?auto_456788 ) ) ( not ( = ?auto_456778 ?auto_456779 ) ) ( not ( = ?auto_456778 ?auto_456780 ) ) ( not ( = ?auto_456778 ?auto_456781 ) ) ( not ( = ?auto_456778 ?auto_456782 ) ) ( not ( = ?auto_456778 ?auto_456783 ) ) ( not ( = ?auto_456778 ?auto_456784 ) ) ( not ( = ?auto_456778 ?auto_456785 ) ) ( not ( = ?auto_456778 ?auto_456786 ) ) ( not ( = ?auto_456778 ?auto_456787 ) ) ( not ( = ?auto_456778 ?auto_456788 ) ) ( not ( = ?auto_456779 ?auto_456780 ) ) ( not ( = ?auto_456779 ?auto_456781 ) ) ( not ( = ?auto_456779 ?auto_456782 ) ) ( not ( = ?auto_456779 ?auto_456783 ) ) ( not ( = ?auto_456779 ?auto_456784 ) ) ( not ( = ?auto_456779 ?auto_456785 ) ) ( not ( = ?auto_456779 ?auto_456786 ) ) ( not ( = ?auto_456779 ?auto_456787 ) ) ( not ( = ?auto_456779 ?auto_456788 ) ) ( not ( = ?auto_456780 ?auto_456781 ) ) ( not ( = ?auto_456780 ?auto_456782 ) ) ( not ( = ?auto_456780 ?auto_456783 ) ) ( not ( = ?auto_456780 ?auto_456784 ) ) ( not ( = ?auto_456780 ?auto_456785 ) ) ( not ( = ?auto_456780 ?auto_456786 ) ) ( not ( = ?auto_456780 ?auto_456787 ) ) ( not ( = ?auto_456780 ?auto_456788 ) ) ( not ( = ?auto_456781 ?auto_456782 ) ) ( not ( = ?auto_456781 ?auto_456783 ) ) ( not ( = ?auto_456781 ?auto_456784 ) ) ( not ( = ?auto_456781 ?auto_456785 ) ) ( not ( = ?auto_456781 ?auto_456786 ) ) ( not ( = ?auto_456781 ?auto_456787 ) ) ( not ( = ?auto_456781 ?auto_456788 ) ) ( not ( = ?auto_456782 ?auto_456783 ) ) ( not ( = ?auto_456782 ?auto_456784 ) ) ( not ( = ?auto_456782 ?auto_456785 ) ) ( not ( = ?auto_456782 ?auto_456786 ) ) ( not ( = ?auto_456782 ?auto_456787 ) ) ( not ( = ?auto_456782 ?auto_456788 ) ) ( not ( = ?auto_456783 ?auto_456784 ) ) ( not ( = ?auto_456783 ?auto_456785 ) ) ( not ( = ?auto_456783 ?auto_456786 ) ) ( not ( = ?auto_456783 ?auto_456787 ) ) ( not ( = ?auto_456783 ?auto_456788 ) ) ( not ( = ?auto_456784 ?auto_456785 ) ) ( not ( = ?auto_456784 ?auto_456786 ) ) ( not ( = ?auto_456784 ?auto_456787 ) ) ( not ( = ?auto_456784 ?auto_456788 ) ) ( not ( = ?auto_456785 ?auto_456786 ) ) ( not ( = ?auto_456785 ?auto_456787 ) ) ( not ( = ?auto_456785 ?auto_456788 ) ) ( not ( = ?auto_456786 ?auto_456787 ) ) ( not ( = ?auto_456786 ?auto_456788 ) ) ( not ( = ?auto_456787 ?auto_456788 ) ) ( ON ?auto_456786 ?auto_456787 ) ( CLEAR ?auto_456784 ) ( ON ?auto_456785 ?auto_456786 ) ( CLEAR ?auto_456785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_456776 ?auto_456777 ?auto_456778 ?auto_456779 ?auto_456780 ?auto_456781 ?auto_456782 ?auto_456783 ?auto_456784 ?auto_456785 )
      ( MAKE-12PILE ?auto_456776 ?auto_456777 ?auto_456778 ?auto_456779 ?auto_456780 ?auto_456781 ?auto_456782 ?auto_456783 ?auto_456784 ?auto_456785 ?auto_456786 ?auto_456787 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_456826 - BLOCK
      ?auto_456827 - BLOCK
      ?auto_456828 - BLOCK
      ?auto_456829 - BLOCK
      ?auto_456830 - BLOCK
      ?auto_456831 - BLOCK
      ?auto_456832 - BLOCK
      ?auto_456833 - BLOCK
      ?auto_456834 - BLOCK
      ?auto_456835 - BLOCK
      ?auto_456836 - BLOCK
      ?auto_456837 - BLOCK
    )
    :vars
    (
      ?auto_456838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456837 ?auto_456838 ) ( ON-TABLE ?auto_456826 ) ( ON ?auto_456827 ?auto_456826 ) ( ON ?auto_456828 ?auto_456827 ) ( ON ?auto_456829 ?auto_456828 ) ( ON ?auto_456830 ?auto_456829 ) ( ON ?auto_456831 ?auto_456830 ) ( ON ?auto_456832 ?auto_456831 ) ( ON ?auto_456833 ?auto_456832 ) ( not ( = ?auto_456826 ?auto_456827 ) ) ( not ( = ?auto_456826 ?auto_456828 ) ) ( not ( = ?auto_456826 ?auto_456829 ) ) ( not ( = ?auto_456826 ?auto_456830 ) ) ( not ( = ?auto_456826 ?auto_456831 ) ) ( not ( = ?auto_456826 ?auto_456832 ) ) ( not ( = ?auto_456826 ?auto_456833 ) ) ( not ( = ?auto_456826 ?auto_456834 ) ) ( not ( = ?auto_456826 ?auto_456835 ) ) ( not ( = ?auto_456826 ?auto_456836 ) ) ( not ( = ?auto_456826 ?auto_456837 ) ) ( not ( = ?auto_456826 ?auto_456838 ) ) ( not ( = ?auto_456827 ?auto_456828 ) ) ( not ( = ?auto_456827 ?auto_456829 ) ) ( not ( = ?auto_456827 ?auto_456830 ) ) ( not ( = ?auto_456827 ?auto_456831 ) ) ( not ( = ?auto_456827 ?auto_456832 ) ) ( not ( = ?auto_456827 ?auto_456833 ) ) ( not ( = ?auto_456827 ?auto_456834 ) ) ( not ( = ?auto_456827 ?auto_456835 ) ) ( not ( = ?auto_456827 ?auto_456836 ) ) ( not ( = ?auto_456827 ?auto_456837 ) ) ( not ( = ?auto_456827 ?auto_456838 ) ) ( not ( = ?auto_456828 ?auto_456829 ) ) ( not ( = ?auto_456828 ?auto_456830 ) ) ( not ( = ?auto_456828 ?auto_456831 ) ) ( not ( = ?auto_456828 ?auto_456832 ) ) ( not ( = ?auto_456828 ?auto_456833 ) ) ( not ( = ?auto_456828 ?auto_456834 ) ) ( not ( = ?auto_456828 ?auto_456835 ) ) ( not ( = ?auto_456828 ?auto_456836 ) ) ( not ( = ?auto_456828 ?auto_456837 ) ) ( not ( = ?auto_456828 ?auto_456838 ) ) ( not ( = ?auto_456829 ?auto_456830 ) ) ( not ( = ?auto_456829 ?auto_456831 ) ) ( not ( = ?auto_456829 ?auto_456832 ) ) ( not ( = ?auto_456829 ?auto_456833 ) ) ( not ( = ?auto_456829 ?auto_456834 ) ) ( not ( = ?auto_456829 ?auto_456835 ) ) ( not ( = ?auto_456829 ?auto_456836 ) ) ( not ( = ?auto_456829 ?auto_456837 ) ) ( not ( = ?auto_456829 ?auto_456838 ) ) ( not ( = ?auto_456830 ?auto_456831 ) ) ( not ( = ?auto_456830 ?auto_456832 ) ) ( not ( = ?auto_456830 ?auto_456833 ) ) ( not ( = ?auto_456830 ?auto_456834 ) ) ( not ( = ?auto_456830 ?auto_456835 ) ) ( not ( = ?auto_456830 ?auto_456836 ) ) ( not ( = ?auto_456830 ?auto_456837 ) ) ( not ( = ?auto_456830 ?auto_456838 ) ) ( not ( = ?auto_456831 ?auto_456832 ) ) ( not ( = ?auto_456831 ?auto_456833 ) ) ( not ( = ?auto_456831 ?auto_456834 ) ) ( not ( = ?auto_456831 ?auto_456835 ) ) ( not ( = ?auto_456831 ?auto_456836 ) ) ( not ( = ?auto_456831 ?auto_456837 ) ) ( not ( = ?auto_456831 ?auto_456838 ) ) ( not ( = ?auto_456832 ?auto_456833 ) ) ( not ( = ?auto_456832 ?auto_456834 ) ) ( not ( = ?auto_456832 ?auto_456835 ) ) ( not ( = ?auto_456832 ?auto_456836 ) ) ( not ( = ?auto_456832 ?auto_456837 ) ) ( not ( = ?auto_456832 ?auto_456838 ) ) ( not ( = ?auto_456833 ?auto_456834 ) ) ( not ( = ?auto_456833 ?auto_456835 ) ) ( not ( = ?auto_456833 ?auto_456836 ) ) ( not ( = ?auto_456833 ?auto_456837 ) ) ( not ( = ?auto_456833 ?auto_456838 ) ) ( not ( = ?auto_456834 ?auto_456835 ) ) ( not ( = ?auto_456834 ?auto_456836 ) ) ( not ( = ?auto_456834 ?auto_456837 ) ) ( not ( = ?auto_456834 ?auto_456838 ) ) ( not ( = ?auto_456835 ?auto_456836 ) ) ( not ( = ?auto_456835 ?auto_456837 ) ) ( not ( = ?auto_456835 ?auto_456838 ) ) ( not ( = ?auto_456836 ?auto_456837 ) ) ( not ( = ?auto_456836 ?auto_456838 ) ) ( not ( = ?auto_456837 ?auto_456838 ) ) ( ON ?auto_456836 ?auto_456837 ) ( ON ?auto_456835 ?auto_456836 ) ( CLEAR ?auto_456833 ) ( ON ?auto_456834 ?auto_456835 ) ( CLEAR ?auto_456834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_456826 ?auto_456827 ?auto_456828 ?auto_456829 ?auto_456830 ?auto_456831 ?auto_456832 ?auto_456833 ?auto_456834 )
      ( MAKE-12PILE ?auto_456826 ?auto_456827 ?auto_456828 ?auto_456829 ?auto_456830 ?auto_456831 ?auto_456832 ?auto_456833 ?auto_456834 ?auto_456835 ?auto_456836 ?auto_456837 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_456876 - BLOCK
      ?auto_456877 - BLOCK
      ?auto_456878 - BLOCK
      ?auto_456879 - BLOCK
      ?auto_456880 - BLOCK
      ?auto_456881 - BLOCK
      ?auto_456882 - BLOCK
      ?auto_456883 - BLOCK
      ?auto_456884 - BLOCK
      ?auto_456885 - BLOCK
      ?auto_456886 - BLOCK
      ?auto_456887 - BLOCK
    )
    :vars
    (
      ?auto_456888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456887 ?auto_456888 ) ( ON-TABLE ?auto_456876 ) ( ON ?auto_456877 ?auto_456876 ) ( ON ?auto_456878 ?auto_456877 ) ( ON ?auto_456879 ?auto_456878 ) ( ON ?auto_456880 ?auto_456879 ) ( ON ?auto_456881 ?auto_456880 ) ( ON ?auto_456882 ?auto_456881 ) ( not ( = ?auto_456876 ?auto_456877 ) ) ( not ( = ?auto_456876 ?auto_456878 ) ) ( not ( = ?auto_456876 ?auto_456879 ) ) ( not ( = ?auto_456876 ?auto_456880 ) ) ( not ( = ?auto_456876 ?auto_456881 ) ) ( not ( = ?auto_456876 ?auto_456882 ) ) ( not ( = ?auto_456876 ?auto_456883 ) ) ( not ( = ?auto_456876 ?auto_456884 ) ) ( not ( = ?auto_456876 ?auto_456885 ) ) ( not ( = ?auto_456876 ?auto_456886 ) ) ( not ( = ?auto_456876 ?auto_456887 ) ) ( not ( = ?auto_456876 ?auto_456888 ) ) ( not ( = ?auto_456877 ?auto_456878 ) ) ( not ( = ?auto_456877 ?auto_456879 ) ) ( not ( = ?auto_456877 ?auto_456880 ) ) ( not ( = ?auto_456877 ?auto_456881 ) ) ( not ( = ?auto_456877 ?auto_456882 ) ) ( not ( = ?auto_456877 ?auto_456883 ) ) ( not ( = ?auto_456877 ?auto_456884 ) ) ( not ( = ?auto_456877 ?auto_456885 ) ) ( not ( = ?auto_456877 ?auto_456886 ) ) ( not ( = ?auto_456877 ?auto_456887 ) ) ( not ( = ?auto_456877 ?auto_456888 ) ) ( not ( = ?auto_456878 ?auto_456879 ) ) ( not ( = ?auto_456878 ?auto_456880 ) ) ( not ( = ?auto_456878 ?auto_456881 ) ) ( not ( = ?auto_456878 ?auto_456882 ) ) ( not ( = ?auto_456878 ?auto_456883 ) ) ( not ( = ?auto_456878 ?auto_456884 ) ) ( not ( = ?auto_456878 ?auto_456885 ) ) ( not ( = ?auto_456878 ?auto_456886 ) ) ( not ( = ?auto_456878 ?auto_456887 ) ) ( not ( = ?auto_456878 ?auto_456888 ) ) ( not ( = ?auto_456879 ?auto_456880 ) ) ( not ( = ?auto_456879 ?auto_456881 ) ) ( not ( = ?auto_456879 ?auto_456882 ) ) ( not ( = ?auto_456879 ?auto_456883 ) ) ( not ( = ?auto_456879 ?auto_456884 ) ) ( not ( = ?auto_456879 ?auto_456885 ) ) ( not ( = ?auto_456879 ?auto_456886 ) ) ( not ( = ?auto_456879 ?auto_456887 ) ) ( not ( = ?auto_456879 ?auto_456888 ) ) ( not ( = ?auto_456880 ?auto_456881 ) ) ( not ( = ?auto_456880 ?auto_456882 ) ) ( not ( = ?auto_456880 ?auto_456883 ) ) ( not ( = ?auto_456880 ?auto_456884 ) ) ( not ( = ?auto_456880 ?auto_456885 ) ) ( not ( = ?auto_456880 ?auto_456886 ) ) ( not ( = ?auto_456880 ?auto_456887 ) ) ( not ( = ?auto_456880 ?auto_456888 ) ) ( not ( = ?auto_456881 ?auto_456882 ) ) ( not ( = ?auto_456881 ?auto_456883 ) ) ( not ( = ?auto_456881 ?auto_456884 ) ) ( not ( = ?auto_456881 ?auto_456885 ) ) ( not ( = ?auto_456881 ?auto_456886 ) ) ( not ( = ?auto_456881 ?auto_456887 ) ) ( not ( = ?auto_456881 ?auto_456888 ) ) ( not ( = ?auto_456882 ?auto_456883 ) ) ( not ( = ?auto_456882 ?auto_456884 ) ) ( not ( = ?auto_456882 ?auto_456885 ) ) ( not ( = ?auto_456882 ?auto_456886 ) ) ( not ( = ?auto_456882 ?auto_456887 ) ) ( not ( = ?auto_456882 ?auto_456888 ) ) ( not ( = ?auto_456883 ?auto_456884 ) ) ( not ( = ?auto_456883 ?auto_456885 ) ) ( not ( = ?auto_456883 ?auto_456886 ) ) ( not ( = ?auto_456883 ?auto_456887 ) ) ( not ( = ?auto_456883 ?auto_456888 ) ) ( not ( = ?auto_456884 ?auto_456885 ) ) ( not ( = ?auto_456884 ?auto_456886 ) ) ( not ( = ?auto_456884 ?auto_456887 ) ) ( not ( = ?auto_456884 ?auto_456888 ) ) ( not ( = ?auto_456885 ?auto_456886 ) ) ( not ( = ?auto_456885 ?auto_456887 ) ) ( not ( = ?auto_456885 ?auto_456888 ) ) ( not ( = ?auto_456886 ?auto_456887 ) ) ( not ( = ?auto_456886 ?auto_456888 ) ) ( not ( = ?auto_456887 ?auto_456888 ) ) ( ON ?auto_456886 ?auto_456887 ) ( ON ?auto_456885 ?auto_456886 ) ( ON ?auto_456884 ?auto_456885 ) ( CLEAR ?auto_456882 ) ( ON ?auto_456883 ?auto_456884 ) ( CLEAR ?auto_456883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_456876 ?auto_456877 ?auto_456878 ?auto_456879 ?auto_456880 ?auto_456881 ?auto_456882 ?auto_456883 )
      ( MAKE-12PILE ?auto_456876 ?auto_456877 ?auto_456878 ?auto_456879 ?auto_456880 ?auto_456881 ?auto_456882 ?auto_456883 ?auto_456884 ?auto_456885 ?auto_456886 ?auto_456887 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_456926 - BLOCK
      ?auto_456927 - BLOCK
      ?auto_456928 - BLOCK
      ?auto_456929 - BLOCK
      ?auto_456930 - BLOCK
      ?auto_456931 - BLOCK
      ?auto_456932 - BLOCK
      ?auto_456933 - BLOCK
      ?auto_456934 - BLOCK
      ?auto_456935 - BLOCK
      ?auto_456936 - BLOCK
      ?auto_456937 - BLOCK
    )
    :vars
    (
      ?auto_456938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456937 ?auto_456938 ) ( ON-TABLE ?auto_456926 ) ( ON ?auto_456927 ?auto_456926 ) ( ON ?auto_456928 ?auto_456927 ) ( ON ?auto_456929 ?auto_456928 ) ( ON ?auto_456930 ?auto_456929 ) ( ON ?auto_456931 ?auto_456930 ) ( not ( = ?auto_456926 ?auto_456927 ) ) ( not ( = ?auto_456926 ?auto_456928 ) ) ( not ( = ?auto_456926 ?auto_456929 ) ) ( not ( = ?auto_456926 ?auto_456930 ) ) ( not ( = ?auto_456926 ?auto_456931 ) ) ( not ( = ?auto_456926 ?auto_456932 ) ) ( not ( = ?auto_456926 ?auto_456933 ) ) ( not ( = ?auto_456926 ?auto_456934 ) ) ( not ( = ?auto_456926 ?auto_456935 ) ) ( not ( = ?auto_456926 ?auto_456936 ) ) ( not ( = ?auto_456926 ?auto_456937 ) ) ( not ( = ?auto_456926 ?auto_456938 ) ) ( not ( = ?auto_456927 ?auto_456928 ) ) ( not ( = ?auto_456927 ?auto_456929 ) ) ( not ( = ?auto_456927 ?auto_456930 ) ) ( not ( = ?auto_456927 ?auto_456931 ) ) ( not ( = ?auto_456927 ?auto_456932 ) ) ( not ( = ?auto_456927 ?auto_456933 ) ) ( not ( = ?auto_456927 ?auto_456934 ) ) ( not ( = ?auto_456927 ?auto_456935 ) ) ( not ( = ?auto_456927 ?auto_456936 ) ) ( not ( = ?auto_456927 ?auto_456937 ) ) ( not ( = ?auto_456927 ?auto_456938 ) ) ( not ( = ?auto_456928 ?auto_456929 ) ) ( not ( = ?auto_456928 ?auto_456930 ) ) ( not ( = ?auto_456928 ?auto_456931 ) ) ( not ( = ?auto_456928 ?auto_456932 ) ) ( not ( = ?auto_456928 ?auto_456933 ) ) ( not ( = ?auto_456928 ?auto_456934 ) ) ( not ( = ?auto_456928 ?auto_456935 ) ) ( not ( = ?auto_456928 ?auto_456936 ) ) ( not ( = ?auto_456928 ?auto_456937 ) ) ( not ( = ?auto_456928 ?auto_456938 ) ) ( not ( = ?auto_456929 ?auto_456930 ) ) ( not ( = ?auto_456929 ?auto_456931 ) ) ( not ( = ?auto_456929 ?auto_456932 ) ) ( not ( = ?auto_456929 ?auto_456933 ) ) ( not ( = ?auto_456929 ?auto_456934 ) ) ( not ( = ?auto_456929 ?auto_456935 ) ) ( not ( = ?auto_456929 ?auto_456936 ) ) ( not ( = ?auto_456929 ?auto_456937 ) ) ( not ( = ?auto_456929 ?auto_456938 ) ) ( not ( = ?auto_456930 ?auto_456931 ) ) ( not ( = ?auto_456930 ?auto_456932 ) ) ( not ( = ?auto_456930 ?auto_456933 ) ) ( not ( = ?auto_456930 ?auto_456934 ) ) ( not ( = ?auto_456930 ?auto_456935 ) ) ( not ( = ?auto_456930 ?auto_456936 ) ) ( not ( = ?auto_456930 ?auto_456937 ) ) ( not ( = ?auto_456930 ?auto_456938 ) ) ( not ( = ?auto_456931 ?auto_456932 ) ) ( not ( = ?auto_456931 ?auto_456933 ) ) ( not ( = ?auto_456931 ?auto_456934 ) ) ( not ( = ?auto_456931 ?auto_456935 ) ) ( not ( = ?auto_456931 ?auto_456936 ) ) ( not ( = ?auto_456931 ?auto_456937 ) ) ( not ( = ?auto_456931 ?auto_456938 ) ) ( not ( = ?auto_456932 ?auto_456933 ) ) ( not ( = ?auto_456932 ?auto_456934 ) ) ( not ( = ?auto_456932 ?auto_456935 ) ) ( not ( = ?auto_456932 ?auto_456936 ) ) ( not ( = ?auto_456932 ?auto_456937 ) ) ( not ( = ?auto_456932 ?auto_456938 ) ) ( not ( = ?auto_456933 ?auto_456934 ) ) ( not ( = ?auto_456933 ?auto_456935 ) ) ( not ( = ?auto_456933 ?auto_456936 ) ) ( not ( = ?auto_456933 ?auto_456937 ) ) ( not ( = ?auto_456933 ?auto_456938 ) ) ( not ( = ?auto_456934 ?auto_456935 ) ) ( not ( = ?auto_456934 ?auto_456936 ) ) ( not ( = ?auto_456934 ?auto_456937 ) ) ( not ( = ?auto_456934 ?auto_456938 ) ) ( not ( = ?auto_456935 ?auto_456936 ) ) ( not ( = ?auto_456935 ?auto_456937 ) ) ( not ( = ?auto_456935 ?auto_456938 ) ) ( not ( = ?auto_456936 ?auto_456937 ) ) ( not ( = ?auto_456936 ?auto_456938 ) ) ( not ( = ?auto_456937 ?auto_456938 ) ) ( ON ?auto_456936 ?auto_456937 ) ( ON ?auto_456935 ?auto_456936 ) ( ON ?auto_456934 ?auto_456935 ) ( ON ?auto_456933 ?auto_456934 ) ( CLEAR ?auto_456931 ) ( ON ?auto_456932 ?auto_456933 ) ( CLEAR ?auto_456932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_456926 ?auto_456927 ?auto_456928 ?auto_456929 ?auto_456930 ?auto_456931 ?auto_456932 )
      ( MAKE-12PILE ?auto_456926 ?auto_456927 ?auto_456928 ?auto_456929 ?auto_456930 ?auto_456931 ?auto_456932 ?auto_456933 ?auto_456934 ?auto_456935 ?auto_456936 ?auto_456937 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_456976 - BLOCK
      ?auto_456977 - BLOCK
      ?auto_456978 - BLOCK
      ?auto_456979 - BLOCK
      ?auto_456980 - BLOCK
      ?auto_456981 - BLOCK
      ?auto_456982 - BLOCK
      ?auto_456983 - BLOCK
      ?auto_456984 - BLOCK
      ?auto_456985 - BLOCK
      ?auto_456986 - BLOCK
      ?auto_456987 - BLOCK
    )
    :vars
    (
      ?auto_456988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_456987 ?auto_456988 ) ( ON-TABLE ?auto_456976 ) ( ON ?auto_456977 ?auto_456976 ) ( ON ?auto_456978 ?auto_456977 ) ( ON ?auto_456979 ?auto_456978 ) ( ON ?auto_456980 ?auto_456979 ) ( not ( = ?auto_456976 ?auto_456977 ) ) ( not ( = ?auto_456976 ?auto_456978 ) ) ( not ( = ?auto_456976 ?auto_456979 ) ) ( not ( = ?auto_456976 ?auto_456980 ) ) ( not ( = ?auto_456976 ?auto_456981 ) ) ( not ( = ?auto_456976 ?auto_456982 ) ) ( not ( = ?auto_456976 ?auto_456983 ) ) ( not ( = ?auto_456976 ?auto_456984 ) ) ( not ( = ?auto_456976 ?auto_456985 ) ) ( not ( = ?auto_456976 ?auto_456986 ) ) ( not ( = ?auto_456976 ?auto_456987 ) ) ( not ( = ?auto_456976 ?auto_456988 ) ) ( not ( = ?auto_456977 ?auto_456978 ) ) ( not ( = ?auto_456977 ?auto_456979 ) ) ( not ( = ?auto_456977 ?auto_456980 ) ) ( not ( = ?auto_456977 ?auto_456981 ) ) ( not ( = ?auto_456977 ?auto_456982 ) ) ( not ( = ?auto_456977 ?auto_456983 ) ) ( not ( = ?auto_456977 ?auto_456984 ) ) ( not ( = ?auto_456977 ?auto_456985 ) ) ( not ( = ?auto_456977 ?auto_456986 ) ) ( not ( = ?auto_456977 ?auto_456987 ) ) ( not ( = ?auto_456977 ?auto_456988 ) ) ( not ( = ?auto_456978 ?auto_456979 ) ) ( not ( = ?auto_456978 ?auto_456980 ) ) ( not ( = ?auto_456978 ?auto_456981 ) ) ( not ( = ?auto_456978 ?auto_456982 ) ) ( not ( = ?auto_456978 ?auto_456983 ) ) ( not ( = ?auto_456978 ?auto_456984 ) ) ( not ( = ?auto_456978 ?auto_456985 ) ) ( not ( = ?auto_456978 ?auto_456986 ) ) ( not ( = ?auto_456978 ?auto_456987 ) ) ( not ( = ?auto_456978 ?auto_456988 ) ) ( not ( = ?auto_456979 ?auto_456980 ) ) ( not ( = ?auto_456979 ?auto_456981 ) ) ( not ( = ?auto_456979 ?auto_456982 ) ) ( not ( = ?auto_456979 ?auto_456983 ) ) ( not ( = ?auto_456979 ?auto_456984 ) ) ( not ( = ?auto_456979 ?auto_456985 ) ) ( not ( = ?auto_456979 ?auto_456986 ) ) ( not ( = ?auto_456979 ?auto_456987 ) ) ( not ( = ?auto_456979 ?auto_456988 ) ) ( not ( = ?auto_456980 ?auto_456981 ) ) ( not ( = ?auto_456980 ?auto_456982 ) ) ( not ( = ?auto_456980 ?auto_456983 ) ) ( not ( = ?auto_456980 ?auto_456984 ) ) ( not ( = ?auto_456980 ?auto_456985 ) ) ( not ( = ?auto_456980 ?auto_456986 ) ) ( not ( = ?auto_456980 ?auto_456987 ) ) ( not ( = ?auto_456980 ?auto_456988 ) ) ( not ( = ?auto_456981 ?auto_456982 ) ) ( not ( = ?auto_456981 ?auto_456983 ) ) ( not ( = ?auto_456981 ?auto_456984 ) ) ( not ( = ?auto_456981 ?auto_456985 ) ) ( not ( = ?auto_456981 ?auto_456986 ) ) ( not ( = ?auto_456981 ?auto_456987 ) ) ( not ( = ?auto_456981 ?auto_456988 ) ) ( not ( = ?auto_456982 ?auto_456983 ) ) ( not ( = ?auto_456982 ?auto_456984 ) ) ( not ( = ?auto_456982 ?auto_456985 ) ) ( not ( = ?auto_456982 ?auto_456986 ) ) ( not ( = ?auto_456982 ?auto_456987 ) ) ( not ( = ?auto_456982 ?auto_456988 ) ) ( not ( = ?auto_456983 ?auto_456984 ) ) ( not ( = ?auto_456983 ?auto_456985 ) ) ( not ( = ?auto_456983 ?auto_456986 ) ) ( not ( = ?auto_456983 ?auto_456987 ) ) ( not ( = ?auto_456983 ?auto_456988 ) ) ( not ( = ?auto_456984 ?auto_456985 ) ) ( not ( = ?auto_456984 ?auto_456986 ) ) ( not ( = ?auto_456984 ?auto_456987 ) ) ( not ( = ?auto_456984 ?auto_456988 ) ) ( not ( = ?auto_456985 ?auto_456986 ) ) ( not ( = ?auto_456985 ?auto_456987 ) ) ( not ( = ?auto_456985 ?auto_456988 ) ) ( not ( = ?auto_456986 ?auto_456987 ) ) ( not ( = ?auto_456986 ?auto_456988 ) ) ( not ( = ?auto_456987 ?auto_456988 ) ) ( ON ?auto_456986 ?auto_456987 ) ( ON ?auto_456985 ?auto_456986 ) ( ON ?auto_456984 ?auto_456985 ) ( ON ?auto_456983 ?auto_456984 ) ( ON ?auto_456982 ?auto_456983 ) ( CLEAR ?auto_456980 ) ( ON ?auto_456981 ?auto_456982 ) ( CLEAR ?auto_456981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_456976 ?auto_456977 ?auto_456978 ?auto_456979 ?auto_456980 ?auto_456981 )
      ( MAKE-12PILE ?auto_456976 ?auto_456977 ?auto_456978 ?auto_456979 ?auto_456980 ?auto_456981 ?auto_456982 ?auto_456983 ?auto_456984 ?auto_456985 ?auto_456986 ?auto_456987 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_457026 - BLOCK
      ?auto_457027 - BLOCK
      ?auto_457028 - BLOCK
      ?auto_457029 - BLOCK
      ?auto_457030 - BLOCK
      ?auto_457031 - BLOCK
      ?auto_457032 - BLOCK
      ?auto_457033 - BLOCK
      ?auto_457034 - BLOCK
      ?auto_457035 - BLOCK
      ?auto_457036 - BLOCK
      ?auto_457037 - BLOCK
    )
    :vars
    (
      ?auto_457038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_457037 ?auto_457038 ) ( ON-TABLE ?auto_457026 ) ( ON ?auto_457027 ?auto_457026 ) ( ON ?auto_457028 ?auto_457027 ) ( ON ?auto_457029 ?auto_457028 ) ( not ( = ?auto_457026 ?auto_457027 ) ) ( not ( = ?auto_457026 ?auto_457028 ) ) ( not ( = ?auto_457026 ?auto_457029 ) ) ( not ( = ?auto_457026 ?auto_457030 ) ) ( not ( = ?auto_457026 ?auto_457031 ) ) ( not ( = ?auto_457026 ?auto_457032 ) ) ( not ( = ?auto_457026 ?auto_457033 ) ) ( not ( = ?auto_457026 ?auto_457034 ) ) ( not ( = ?auto_457026 ?auto_457035 ) ) ( not ( = ?auto_457026 ?auto_457036 ) ) ( not ( = ?auto_457026 ?auto_457037 ) ) ( not ( = ?auto_457026 ?auto_457038 ) ) ( not ( = ?auto_457027 ?auto_457028 ) ) ( not ( = ?auto_457027 ?auto_457029 ) ) ( not ( = ?auto_457027 ?auto_457030 ) ) ( not ( = ?auto_457027 ?auto_457031 ) ) ( not ( = ?auto_457027 ?auto_457032 ) ) ( not ( = ?auto_457027 ?auto_457033 ) ) ( not ( = ?auto_457027 ?auto_457034 ) ) ( not ( = ?auto_457027 ?auto_457035 ) ) ( not ( = ?auto_457027 ?auto_457036 ) ) ( not ( = ?auto_457027 ?auto_457037 ) ) ( not ( = ?auto_457027 ?auto_457038 ) ) ( not ( = ?auto_457028 ?auto_457029 ) ) ( not ( = ?auto_457028 ?auto_457030 ) ) ( not ( = ?auto_457028 ?auto_457031 ) ) ( not ( = ?auto_457028 ?auto_457032 ) ) ( not ( = ?auto_457028 ?auto_457033 ) ) ( not ( = ?auto_457028 ?auto_457034 ) ) ( not ( = ?auto_457028 ?auto_457035 ) ) ( not ( = ?auto_457028 ?auto_457036 ) ) ( not ( = ?auto_457028 ?auto_457037 ) ) ( not ( = ?auto_457028 ?auto_457038 ) ) ( not ( = ?auto_457029 ?auto_457030 ) ) ( not ( = ?auto_457029 ?auto_457031 ) ) ( not ( = ?auto_457029 ?auto_457032 ) ) ( not ( = ?auto_457029 ?auto_457033 ) ) ( not ( = ?auto_457029 ?auto_457034 ) ) ( not ( = ?auto_457029 ?auto_457035 ) ) ( not ( = ?auto_457029 ?auto_457036 ) ) ( not ( = ?auto_457029 ?auto_457037 ) ) ( not ( = ?auto_457029 ?auto_457038 ) ) ( not ( = ?auto_457030 ?auto_457031 ) ) ( not ( = ?auto_457030 ?auto_457032 ) ) ( not ( = ?auto_457030 ?auto_457033 ) ) ( not ( = ?auto_457030 ?auto_457034 ) ) ( not ( = ?auto_457030 ?auto_457035 ) ) ( not ( = ?auto_457030 ?auto_457036 ) ) ( not ( = ?auto_457030 ?auto_457037 ) ) ( not ( = ?auto_457030 ?auto_457038 ) ) ( not ( = ?auto_457031 ?auto_457032 ) ) ( not ( = ?auto_457031 ?auto_457033 ) ) ( not ( = ?auto_457031 ?auto_457034 ) ) ( not ( = ?auto_457031 ?auto_457035 ) ) ( not ( = ?auto_457031 ?auto_457036 ) ) ( not ( = ?auto_457031 ?auto_457037 ) ) ( not ( = ?auto_457031 ?auto_457038 ) ) ( not ( = ?auto_457032 ?auto_457033 ) ) ( not ( = ?auto_457032 ?auto_457034 ) ) ( not ( = ?auto_457032 ?auto_457035 ) ) ( not ( = ?auto_457032 ?auto_457036 ) ) ( not ( = ?auto_457032 ?auto_457037 ) ) ( not ( = ?auto_457032 ?auto_457038 ) ) ( not ( = ?auto_457033 ?auto_457034 ) ) ( not ( = ?auto_457033 ?auto_457035 ) ) ( not ( = ?auto_457033 ?auto_457036 ) ) ( not ( = ?auto_457033 ?auto_457037 ) ) ( not ( = ?auto_457033 ?auto_457038 ) ) ( not ( = ?auto_457034 ?auto_457035 ) ) ( not ( = ?auto_457034 ?auto_457036 ) ) ( not ( = ?auto_457034 ?auto_457037 ) ) ( not ( = ?auto_457034 ?auto_457038 ) ) ( not ( = ?auto_457035 ?auto_457036 ) ) ( not ( = ?auto_457035 ?auto_457037 ) ) ( not ( = ?auto_457035 ?auto_457038 ) ) ( not ( = ?auto_457036 ?auto_457037 ) ) ( not ( = ?auto_457036 ?auto_457038 ) ) ( not ( = ?auto_457037 ?auto_457038 ) ) ( ON ?auto_457036 ?auto_457037 ) ( ON ?auto_457035 ?auto_457036 ) ( ON ?auto_457034 ?auto_457035 ) ( ON ?auto_457033 ?auto_457034 ) ( ON ?auto_457032 ?auto_457033 ) ( ON ?auto_457031 ?auto_457032 ) ( CLEAR ?auto_457029 ) ( ON ?auto_457030 ?auto_457031 ) ( CLEAR ?auto_457030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_457026 ?auto_457027 ?auto_457028 ?auto_457029 ?auto_457030 )
      ( MAKE-12PILE ?auto_457026 ?auto_457027 ?auto_457028 ?auto_457029 ?auto_457030 ?auto_457031 ?auto_457032 ?auto_457033 ?auto_457034 ?auto_457035 ?auto_457036 ?auto_457037 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_457076 - BLOCK
      ?auto_457077 - BLOCK
      ?auto_457078 - BLOCK
      ?auto_457079 - BLOCK
      ?auto_457080 - BLOCK
      ?auto_457081 - BLOCK
      ?auto_457082 - BLOCK
      ?auto_457083 - BLOCK
      ?auto_457084 - BLOCK
      ?auto_457085 - BLOCK
      ?auto_457086 - BLOCK
      ?auto_457087 - BLOCK
    )
    :vars
    (
      ?auto_457088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_457087 ?auto_457088 ) ( ON-TABLE ?auto_457076 ) ( ON ?auto_457077 ?auto_457076 ) ( ON ?auto_457078 ?auto_457077 ) ( not ( = ?auto_457076 ?auto_457077 ) ) ( not ( = ?auto_457076 ?auto_457078 ) ) ( not ( = ?auto_457076 ?auto_457079 ) ) ( not ( = ?auto_457076 ?auto_457080 ) ) ( not ( = ?auto_457076 ?auto_457081 ) ) ( not ( = ?auto_457076 ?auto_457082 ) ) ( not ( = ?auto_457076 ?auto_457083 ) ) ( not ( = ?auto_457076 ?auto_457084 ) ) ( not ( = ?auto_457076 ?auto_457085 ) ) ( not ( = ?auto_457076 ?auto_457086 ) ) ( not ( = ?auto_457076 ?auto_457087 ) ) ( not ( = ?auto_457076 ?auto_457088 ) ) ( not ( = ?auto_457077 ?auto_457078 ) ) ( not ( = ?auto_457077 ?auto_457079 ) ) ( not ( = ?auto_457077 ?auto_457080 ) ) ( not ( = ?auto_457077 ?auto_457081 ) ) ( not ( = ?auto_457077 ?auto_457082 ) ) ( not ( = ?auto_457077 ?auto_457083 ) ) ( not ( = ?auto_457077 ?auto_457084 ) ) ( not ( = ?auto_457077 ?auto_457085 ) ) ( not ( = ?auto_457077 ?auto_457086 ) ) ( not ( = ?auto_457077 ?auto_457087 ) ) ( not ( = ?auto_457077 ?auto_457088 ) ) ( not ( = ?auto_457078 ?auto_457079 ) ) ( not ( = ?auto_457078 ?auto_457080 ) ) ( not ( = ?auto_457078 ?auto_457081 ) ) ( not ( = ?auto_457078 ?auto_457082 ) ) ( not ( = ?auto_457078 ?auto_457083 ) ) ( not ( = ?auto_457078 ?auto_457084 ) ) ( not ( = ?auto_457078 ?auto_457085 ) ) ( not ( = ?auto_457078 ?auto_457086 ) ) ( not ( = ?auto_457078 ?auto_457087 ) ) ( not ( = ?auto_457078 ?auto_457088 ) ) ( not ( = ?auto_457079 ?auto_457080 ) ) ( not ( = ?auto_457079 ?auto_457081 ) ) ( not ( = ?auto_457079 ?auto_457082 ) ) ( not ( = ?auto_457079 ?auto_457083 ) ) ( not ( = ?auto_457079 ?auto_457084 ) ) ( not ( = ?auto_457079 ?auto_457085 ) ) ( not ( = ?auto_457079 ?auto_457086 ) ) ( not ( = ?auto_457079 ?auto_457087 ) ) ( not ( = ?auto_457079 ?auto_457088 ) ) ( not ( = ?auto_457080 ?auto_457081 ) ) ( not ( = ?auto_457080 ?auto_457082 ) ) ( not ( = ?auto_457080 ?auto_457083 ) ) ( not ( = ?auto_457080 ?auto_457084 ) ) ( not ( = ?auto_457080 ?auto_457085 ) ) ( not ( = ?auto_457080 ?auto_457086 ) ) ( not ( = ?auto_457080 ?auto_457087 ) ) ( not ( = ?auto_457080 ?auto_457088 ) ) ( not ( = ?auto_457081 ?auto_457082 ) ) ( not ( = ?auto_457081 ?auto_457083 ) ) ( not ( = ?auto_457081 ?auto_457084 ) ) ( not ( = ?auto_457081 ?auto_457085 ) ) ( not ( = ?auto_457081 ?auto_457086 ) ) ( not ( = ?auto_457081 ?auto_457087 ) ) ( not ( = ?auto_457081 ?auto_457088 ) ) ( not ( = ?auto_457082 ?auto_457083 ) ) ( not ( = ?auto_457082 ?auto_457084 ) ) ( not ( = ?auto_457082 ?auto_457085 ) ) ( not ( = ?auto_457082 ?auto_457086 ) ) ( not ( = ?auto_457082 ?auto_457087 ) ) ( not ( = ?auto_457082 ?auto_457088 ) ) ( not ( = ?auto_457083 ?auto_457084 ) ) ( not ( = ?auto_457083 ?auto_457085 ) ) ( not ( = ?auto_457083 ?auto_457086 ) ) ( not ( = ?auto_457083 ?auto_457087 ) ) ( not ( = ?auto_457083 ?auto_457088 ) ) ( not ( = ?auto_457084 ?auto_457085 ) ) ( not ( = ?auto_457084 ?auto_457086 ) ) ( not ( = ?auto_457084 ?auto_457087 ) ) ( not ( = ?auto_457084 ?auto_457088 ) ) ( not ( = ?auto_457085 ?auto_457086 ) ) ( not ( = ?auto_457085 ?auto_457087 ) ) ( not ( = ?auto_457085 ?auto_457088 ) ) ( not ( = ?auto_457086 ?auto_457087 ) ) ( not ( = ?auto_457086 ?auto_457088 ) ) ( not ( = ?auto_457087 ?auto_457088 ) ) ( ON ?auto_457086 ?auto_457087 ) ( ON ?auto_457085 ?auto_457086 ) ( ON ?auto_457084 ?auto_457085 ) ( ON ?auto_457083 ?auto_457084 ) ( ON ?auto_457082 ?auto_457083 ) ( ON ?auto_457081 ?auto_457082 ) ( ON ?auto_457080 ?auto_457081 ) ( CLEAR ?auto_457078 ) ( ON ?auto_457079 ?auto_457080 ) ( CLEAR ?auto_457079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_457076 ?auto_457077 ?auto_457078 ?auto_457079 )
      ( MAKE-12PILE ?auto_457076 ?auto_457077 ?auto_457078 ?auto_457079 ?auto_457080 ?auto_457081 ?auto_457082 ?auto_457083 ?auto_457084 ?auto_457085 ?auto_457086 ?auto_457087 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_457126 - BLOCK
      ?auto_457127 - BLOCK
      ?auto_457128 - BLOCK
      ?auto_457129 - BLOCK
      ?auto_457130 - BLOCK
      ?auto_457131 - BLOCK
      ?auto_457132 - BLOCK
      ?auto_457133 - BLOCK
      ?auto_457134 - BLOCK
      ?auto_457135 - BLOCK
      ?auto_457136 - BLOCK
      ?auto_457137 - BLOCK
    )
    :vars
    (
      ?auto_457138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_457137 ?auto_457138 ) ( ON-TABLE ?auto_457126 ) ( ON ?auto_457127 ?auto_457126 ) ( not ( = ?auto_457126 ?auto_457127 ) ) ( not ( = ?auto_457126 ?auto_457128 ) ) ( not ( = ?auto_457126 ?auto_457129 ) ) ( not ( = ?auto_457126 ?auto_457130 ) ) ( not ( = ?auto_457126 ?auto_457131 ) ) ( not ( = ?auto_457126 ?auto_457132 ) ) ( not ( = ?auto_457126 ?auto_457133 ) ) ( not ( = ?auto_457126 ?auto_457134 ) ) ( not ( = ?auto_457126 ?auto_457135 ) ) ( not ( = ?auto_457126 ?auto_457136 ) ) ( not ( = ?auto_457126 ?auto_457137 ) ) ( not ( = ?auto_457126 ?auto_457138 ) ) ( not ( = ?auto_457127 ?auto_457128 ) ) ( not ( = ?auto_457127 ?auto_457129 ) ) ( not ( = ?auto_457127 ?auto_457130 ) ) ( not ( = ?auto_457127 ?auto_457131 ) ) ( not ( = ?auto_457127 ?auto_457132 ) ) ( not ( = ?auto_457127 ?auto_457133 ) ) ( not ( = ?auto_457127 ?auto_457134 ) ) ( not ( = ?auto_457127 ?auto_457135 ) ) ( not ( = ?auto_457127 ?auto_457136 ) ) ( not ( = ?auto_457127 ?auto_457137 ) ) ( not ( = ?auto_457127 ?auto_457138 ) ) ( not ( = ?auto_457128 ?auto_457129 ) ) ( not ( = ?auto_457128 ?auto_457130 ) ) ( not ( = ?auto_457128 ?auto_457131 ) ) ( not ( = ?auto_457128 ?auto_457132 ) ) ( not ( = ?auto_457128 ?auto_457133 ) ) ( not ( = ?auto_457128 ?auto_457134 ) ) ( not ( = ?auto_457128 ?auto_457135 ) ) ( not ( = ?auto_457128 ?auto_457136 ) ) ( not ( = ?auto_457128 ?auto_457137 ) ) ( not ( = ?auto_457128 ?auto_457138 ) ) ( not ( = ?auto_457129 ?auto_457130 ) ) ( not ( = ?auto_457129 ?auto_457131 ) ) ( not ( = ?auto_457129 ?auto_457132 ) ) ( not ( = ?auto_457129 ?auto_457133 ) ) ( not ( = ?auto_457129 ?auto_457134 ) ) ( not ( = ?auto_457129 ?auto_457135 ) ) ( not ( = ?auto_457129 ?auto_457136 ) ) ( not ( = ?auto_457129 ?auto_457137 ) ) ( not ( = ?auto_457129 ?auto_457138 ) ) ( not ( = ?auto_457130 ?auto_457131 ) ) ( not ( = ?auto_457130 ?auto_457132 ) ) ( not ( = ?auto_457130 ?auto_457133 ) ) ( not ( = ?auto_457130 ?auto_457134 ) ) ( not ( = ?auto_457130 ?auto_457135 ) ) ( not ( = ?auto_457130 ?auto_457136 ) ) ( not ( = ?auto_457130 ?auto_457137 ) ) ( not ( = ?auto_457130 ?auto_457138 ) ) ( not ( = ?auto_457131 ?auto_457132 ) ) ( not ( = ?auto_457131 ?auto_457133 ) ) ( not ( = ?auto_457131 ?auto_457134 ) ) ( not ( = ?auto_457131 ?auto_457135 ) ) ( not ( = ?auto_457131 ?auto_457136 ) ) ( not ( = ?auto_457131 ?auto_457137 ) ) ( not ( = ?auto_457131 ?auto_457138 ) ) ( not ( = ?auto_457132 ?auto_457133 ) ) ( not ( = ?auto_457132 ?auto_457134 ) ) ( not ( = ?auto_457132 ?auto_457135 ) ) ( not ( = ?auto_457132 ?auto_457136 ) ) ( not ( = ?auto_457132 ?auto_457137 ) ) ( not ( = ?auto_457132 ?auto_457138 ) ) ( not ( = ?auto_457133 ?auto_457134 ) ) ( not ( = ?auto_457133 ?auto_457135 ) ) ( not ( = ?auto_457133 ?auto_457136 ) ) ( not ( = ?auto_457133 ?auto_457137 ) ) ( not ( = ?auto_457133 ?auto_457138 ) ) ( not ( = ?auto_457134 ?auto_457135 ) ) ( not ( = ?auto_457134 ?auto_457136 ) ) ( not ( = ?auto_457134 ?auto_457137 ) ) ( not ( = ?auto_457134 ?auto_457138 ) ) ( not ( = ?auto_457135 ?auto_457136 ) ) ( not ( = ?auto_457135 ?auto_457137 ) ) ( not ( = ?auto_457135 ?auto_457138 ) ) ( not ( = ?auto_457136 ?auto_457137 ) ) ( not ( = ?auto_457136 ?auto_457138 ) ) ( not ( = ?auto_457137 ?auto_457138 ) ) ( ON ?auto_457136 ?auto_457137 ) ( ON ?auto_457135 ?auto_457136 ) ( ON ?auto_457134 ?auto_457135 ) ( ON ?auto_457133 ?auto_457134 ) ( ON ?auto_457132 ?auto_457133 ) ( ON ?auto_457131 ?auto_457132 ) ( ON ?auto_457130 ?auto_457131 ) ( ON ?auto_457129 ?auto_457130 ) ( CLEAR ?auto_457127 ) ( ON ?auto_457128 ?auto_457129 ) ( CLEAR ?auto_457128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_457126 ?auto_457127 ?auto_457128 )
      ( MAKE-12PILE ?auto_457126 ?auto_457127 ?auto_457128 ?auto_457129 ?auto_457130 ?auto_457131 ?auto_457132 ?auto_457133 ?auto_457134 ?auto_457135 ?auto_457136 ?auto_457137 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_457176 - BLOCK
      ?auto_457177 - BLOCK
      ?auto_457178 - BLOCK
      ?auto_457179 - BLOCK
      ?auto_457180 - BLOCK
      ?auto_457181 - BLOCK
      ?auto_457182 - BLOCK
      ?auto_457183 - BLOCK
      ?auto_457184 - BLOCK
      ?auto_457185 - BLOCK
      ?auto_457186 - BLOCK
      ?auto_457187 - BLOCK
    )
    :vars
    (
      ?auto_457188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_457187 ?auto_457188 ) ( ON-TABLE ?auto_457176 ) ( not ( = ?auto_457176 ?auto_457177 ) ) ( not ( = ?auto_457176 ?auto_457178 ) ) ( not ( = ?auto_457176 ?auto_457179 ) ) ( not ( = ?auto_457176 ?auto_457180 ) ) ( not ( = ?auto_457176 ?auto_457181 ) ) ( not ( = ?auto_457176 ?auto_457182 ) ) ( not ( = ?auto_457176 ?auto_457183 ) ) ( not ( = ?auto_457176 ?auto_457184 ) ) ( not ( = ?auto_457176 ?auto_457185 ) ) ( not ( = ?auto_457176 ?auto_457186 ) ) ( not ( = ?auto_457176 ?auto_457187 ) ) ( not ( = ?auto_457176 ?auto_457188 ) ) ( not ( = ?auto_457177 ?auto_457178 ) ) ( not ( = ?auto_457177 ?auto_457179 ) ) ( not ( = ?auto_457177 ?auto_457180 ) ) ( not ( = ?auto_457177 ?auto_457181 ) ) ( not ( = ?auto_457177 ?auto_457182 ) ) ( not ( = ?auto_457177 ?auto_457183 ) ) ( not ( = ?auto_457177 ?auto_457184 ) ) ( not ( = ?auto_457177 ?auto_457185 ) ) ( not ( = ?auto_457177 ?auto_457186 ) ) ( not ( = ?auto_457177 ?auto_457187 ) ) ( not ( = ?auto_457177 ?auto_457188 ) ) ( not ( = ?auto_457178 ?auto_457179 ) ) ( not ( = ?auto_457178 ?auto_457180 ) ) ( not ( = ?auto_457178 ?auto_457181 ) ) ( not ( = ?auto_457178 ?auto_457182 ) ) ( not ( = ?auto_457178 ?auto_457183 ) ) ( not ( = ?auto_457178 ?auto_457184 ) ) ( not ( = ?auto_457178 ?auto_457185 ) ) ( not ( = ?auto_457178 ?auto_457186 ) ) ( not ( = ?auto_457178 ?auto_457187 ) ) ( not ( = ?auto_457178 ?auto_457188 ) ) ( not ( = ?auto_457179 ?auto_457180 ) ) ( not ( = ?auto_457179 ?auto_457181 ) ) ( not ( = ?auto_457179 ?auto_457182 ) ) ( not ( = ?auto_457179 ?auto_457183 ) ) ( not ( = ?auto_457179 ?auto_457184 ) ) ( not ( = ?auto_457179 ?auto_457185 ) ) ( not ( = ?auto_457179 ?auto_457186 ) ) ( not ( = ?auto_457179 ?auto_457187 ) ) ( not ( = ?auto_457179 ?auto_457188 ) ) ( not ( = ?auto_457180 ?auto_457181 ) ) ( not ( = ?auto_457180 ?auto_457182 ) ) ( not ( = ?auto_457180 ?auto_457183 ) ) ( not ( = ?auto_457180 ?auto_457184 ) ) ( not ( = ?auto_457180 ?auto_457185 ) ) ( not ( = ?auto_457180 ?auto_457186 ) ) ( not ( = ?auto_457180 ?auto_457187 ) ) ( not ( = ?auto_457180 ?auto_457188 ) ) ( not ( = ?auto_457181 ?auto_457182 ) ) ( not ( = ?auto_457181 ?auto_457183 ) ) ( not ( = ?auto_457181 ?auto_457184 ) ) ( not ( = ?auto_457181 ?auto_457185 ) ) ( not ( = ?auto_457181 ?auto_457186 ) ) ( not ( = ?auto_457181 ?auto_457187 ) ) ( not ( = ?auto_457181 ?auto_457188 ) ) ( not ( = ?auto_457182 ?auto_457183 ) ) ( not ( = ?auto_457182 ?auto_457184 ) ) ( not ( = ?auto_457182 ?auto_457185 ) ) ( not ( = ?auto_457182 ?auto_457186 ) ) ( not ( = ?auto_457182 ?auto_457187 ) ) ( not ( = ?auto_457182 ?auto_457188 ) ) ( not ( = ?auto_457183 ?auto_457184 ) ) ( not ( = ?auto_457183 ?auto_457185 ) ) ( not ( = ?auto_457183 ?auto_457186 ) ) ( not ( = ?auto_457183 ?auto_457187 ) ) ( not ( = ?auto_457183 ?auto_457188 ) ) ( not ( = ?auto_457184 ?auto_457185 ) ) ( not ( = ?auto_457184 ?auto_457186 ) ) ( not ( = ?auto_457184 ?auto_457187 ) ) ( not ( = ?auto_457184 ?auto_457188 ) ) ( not ( = ?auto_457185 ?auto_457186 ) ) ( not ( = ?auto_457185 ?auto_457187 ) ) ( not ( = ?auto_457185 ?auto_457188 ) ) ( not ( = ?auto_457186 ?auto_457187 ) ) ( not ( = ?auto_457186 ?auto_457188 ) ) ( not ( = ?auto_457187 ?auto_457188 ) ) ( ON ?auto_457186 ?auto_457187 ) ( ON ?auto_457185 ?auto_457186 ) ( ON ?auto_457184 ?auto_457185 ) ( ON ?auto_457183 ?auto_457184 ) ( ON ?auto_457182 ?auto_457183 ) ( ON ?auto_457181 ?auto_457182 ) ( ON ?auto_457180 ?auto_457181 ) ( ON ?auto_457179 ?auto_457180 ) ( ON ?auto_457178 ?auto_457179 ) ( CLEAR ?auto_457176 ) ( ON ?auto_457177 ?auto_457178 ) ( CLEAR ?auto_457177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_457176 ?auto_457177 )
      ( MAKE-12PILE ?auto_457176 ?auto_457177 ?auto_457178 ?auto_457179 ?auto_457180 ?auto_457181 ?auto_457182 ?auto_457183 ?auto_457184 ?auto_457185 ?auto_457186 ?auto_457187 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_457226 - BLOCK
      ?auto_457227 - BLOCK
      ?auto_457228 - BLOCK
      ?auto_457229 - BLOCK
      ?auto_457230 - BLOCK
      ?auto_457231 - BLOCK
      ?auto_457232 - BLOCK
      ?auto_457233 - BLOCK
      ?auto_457234 - BLOCK
      ?auto_457235 - BLOCK
      ?auto_457236 - BLOCK
      ?auto_457237 - BLOCK
    )
    :vars
    (
      ?auto_457238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_457237 ?auto_457238 ) ( not ( = ?auto_457226 ?auto_457227 ) ) ( not ( = ?auto_457226 ?auto_457228 ) ) ( not ( = ?auto_457226 ?auto_457229 ) ) ( not ( = ?auto_457226 ?auto_457230 ) ) ( not ( = ?auto_457226 ?auto_457231 ) ) ( not ( = ?auto_457226 ?auto_457232 ) ) ( not ( = ?auto_457226 ?auto_457233 ) ) ( not ( = ?auto_457226 ?auto_457234 ) ) ( not ( = ?auto_457226 ?auto_457235 ) ) ( not ( = ?auto_457226 ?auto_457236 ) ) ( not ( = ?auto_457226 ?auto_457237 ) ) ( not ( = ?auto_457226 ?auto_457238 ) ) ( not ( = ?auto_457227 ?auto_457228 ) ) ( not ( = ?auto_457227 ?auto_457229 ) ) ( not ( = ?auto_457227 ?auto_457230 ) ) ( not ( = ?auto_457227 ?auto_457231 ) ) ( not ( = ?auto_457227 ?auto_457232 ) ) ( not ( = ?auto_457227 ?auto_457233 ) ) ( not ( = ?auto_457227 ?auto_457234 ) ) ( not ( = ?auto_457227 ?auto_457235 ) ) ( not ( = ?auto_457227 ?auto_457236 ) ) ( not ( = ?auto_457227 ?auto_457237 ) ) ( not ( = ?auto_457227 ?auto_457238 ) ) ( not ( = ?auto_457228 ?auto_457229 ) ) ( not ( = ?auto_457228 ?auto_457230 ) ) ( not ( = ?auto_457228 ?auto_457231 ) ) ( not ( = ?auto_457228 ?auto_457232 ) ) ( not ( = ?auto_457228 ?auto_457233 ) ) ( not ( = ?auto_457228 ?auto_457234 ) ) ( not ( = ?auto_457228 ?auto_457235 ) ) ( not ( = ?auto_457228 ?auto_457236 ) ) ( not ( = ?auto_457228 ?auto_457237 ) ) ( not ( = ?auto_457228 ?auto_457238 ) ) ( not ( = ?auto_457229 ?auto_457230 ) ) ( not ( = ?auto_457229 ?auto_457231 ) ) ( not ( = ?auto_457229 ?auto_457232 ) ) ( not ( = ?auto_457229 ?auto_457233 ) ) ( not ( = ?auto_457229 ?auto_457234 ) ) ( not ( = ?auto_457229 ?auto_457235 ) ) ( not ( = ?auto_457229 ?auto_457236 ) ) ( not ( = ?auto_457229 ?auto_457237 ) ) ( not ( = ?auto_457229 ?auto_457238 ) ) ( not ( = ?auto_457230 ?auto_457231 ) ) ( not ( = ?auto_457230 ?auto_457232 ) ) ( not ( = ?auto_457230 ?auto_457233 ) ) ( not ( = ?auto_457230 ?auto_457234 ) ) ( not ( = ?auto_457230 ?auto_457235 ) ) ( not ( = ?auto_457230 ?auto_457236 ) ) ( not ( = ?auto_457230 ?auto_457237 ) ) ( not ( = ?auto_457230 ?auto_457238 ) ) ( not ( = ?auto_457231 ?auto_457232 ) ) ( not ( = ?auto_457231 ?auto_457233 ) ) ( not ( = ?auto_457231 ?auto_457234 ) ) ( not ( = ?auto_457231 ?auto_457235 ) ) ( not ( = ?auto_457231 ?auto_457236 ) ) ( not ( = ?auto_457231 ?auto_457237 ) ) ( not ( = ?auto_457231 ?auto_457238 ) ) ( not ( = ?auto_457232 ?auto_457233 ) ) ( not ( = ?auto_457232 ?auto_457234 ) ) ( not ( = ?auto_457232 ?auto_457235 ) ) ( not ( = ?auto_457232 ?auto_457236 ) ) ( not ( = ?auto_457232 ?auto_457237 ) ) ( not ( = ?auto_457232 ?auto_457238 ) ) ( not ( = ?auto_457233 ?auto_457234 ) ) ( not ( = ?auto_457233 ?auto_457235 ) ) ( not ( = ?auto_457233 ?auto_457236 ) ) ( not ( = ?auto_457233 ?auto_457237 ) ) ( not ( = ?auto_457233 ?auto_457238 ) ) ( not ( = ?auto_457234 ?auto_457235 ) ) ( not ( = ?auto_457234 ?auto_457236 ) ) ( not ( = ?auto_457234 ?auto_457237 ) ) ( not ( = ?auto_457234 ?auto_457238 ) ) ( not ( = ?auto_457235 ?auto_457236 ) ) ( not ( = ?auto_457235 ?auto_457237 ) ) ( not ( = ?auto_457235 ?auto_457238 ) ) ( not ( = ?auto_457236 ?auto_457237 ) ) ( not ( = ?auto_457236 ?auto_457238 ) ) ( not ( = ?auto_457237 ?auto_457238 ) ) ( ON ?auto_457236 ?auto_457237 ) ( ON ?auto_457235 ?auto_457236 ) ( ON ?auto_457234 ?auto_457235 ) ( ON ?auto_457233 ?auto_457234 ) ( ON ?auto_457232 ?auto_457233 ) ( ON ?auto_457231 ?auto_457232 ) ( ON ?auto_457230 ?auto_457231 ) ( ON ?auto_457229 ?auto_457230 ) ( ON ?auto_457228 ?auto_457229 ) ( ON ?auto_457227 ?auto_457228 ) ( ON ?auto_457226 ?auto_457227 ) ( CLEAR ?auto_457226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_457226 )
      ( MAKE-12PILE ?auto_457226 ?auto_457227 ?auto_457228 ?auto_457229 ?auto_457230 ?auto_457231 ?auto_457232 ?auto_457233 ?auto_457234 ?auto_457235 ?auto_457236 ?auto_457237 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_457277 - BLOCK
      ?auto_457278 - BLOCK
      ?auto_457279 - BLOCK
      ?auto_457280 - BLOCK
      ?auto_457281 - BLOCK
      ?auto_457282 - BLOCK
      ?auto_457283 - BLOCK
      ?auto_457284 - BLOCK
      ?auto_457285 - BLOCK
      ?auto_457286 - BLOCK
      ?auto_457287 - BLOCK
      ?auto_457288 - BLOCK
      ?auto_457289 - BLOCK
    )
    :vars
    (
      ?auto_457290 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_457288 ) ( ON ?auto_457289 ?auto_457290 ) ( CLEAR ?auto_457289 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_457277 ) ( ON ?auto_457278 ?auto_457277 ) ( ON ?auto_457279 ?auto_457278 ) ( ON ?auto_457280 ?auto_457279 ) ( ON ?auto_457281 ?auto_457280 ) ( ON ?auto_457282 ?auto_457281 ) ( ON ?auto_457283 ?auto_457282 ) ( ON ?auto_457284 ?auto_457283 ) ( ON ?auto_457285 ?auto_457284 ) ( ON ?auto_457286 ?auto_457285 ) ( ON ?auto_457287 ?auto_457286 ) ( ON ?auto_457288 ?auto_457287 ) ( not ( = ?auto_457277 ?auto_457278 ) ) ( not ( = ?auto_457277 ?auto_457279 ) ) ( not ( = ?auto_457277 ?auto_457280 ) ) ( not ( = ?auto_457277 ?auto_457281 ) ) ( not ( = ?auto_457277 ?auto_457282 ) ) ( not ( = ?auto_457277 ?auto_457283 ) ) ( not ( = ?auto_457277 ?auto_457284 ) ) ( not ( = ?auto_457277 ?auto_457285 ) ) ( not ( = ?auto_457277 ?auto_457286 ) ) ( not ( = ?auto_457277 ?auto_457287 ) ) ( not ( = ?auto_457277 ?auto_457288 ) ) ( not ( = ?auto_457277 ?auto_457289 ) ) ( not ( = ?auto_457277 ?auto_457290 ) ) ( not ( = ?auto_457278 ?auto_457279 ) ) ( not ( = ?auto_457278 ?auto_457280 ) ) ( not ( = ?auto_457278 ?auto_457281 ) ) ( not ( = ?auto_457278 ?auto_457282 ) ) ( not ( = ?auto_457278 ?auto_457283 ) ) ( not ( = ?auto_457278 ?auto_457284 ) ) ( not ( = ?auto_457278 ?auto_457285 ) ) ( not ( = ?auto_457278 ?auto_457286 ) ) ( not ( = ?auto_457278 ?auto_457287 ) ) ( not ( = ?auto_457278 ?auto_457288 ) ) ( not ( = ?auto_457278 ?auto_457289 ) ) ( not ( = ?auto_457278 ?auto_457290 ) ) ( not ( = ?auto_457279 ?auto_457280 ) ) ( not ( = ?auto_457279 ?auto_457281 ) ) ( not ( = ?auto_457279 ?auto_457282 ) ) ( not ( = ?auto_457279 ?auto_457283 ) ) ( not ( = ?auto_457279 ?auto_457284 ) ) ( not ( = ?auto_457279 ?auto_457285 ) ) ( not ( = ?auto_457279 ?auto_457286 ) ) ( not ( = ?auto_457279 ?auto_457287 ) ) ( not ( = ?auto_457279 ?auto_457288 ) ) ( not ( = ?auto_457279 ?auto_457289 ) ) ( not ( = ?auto_457279 ?auto_457290 ) ) ( not ( = ?auto_457280 ?auto_457281 ) ) ( not ( = ?auto_457280 ?auto_457282 ) ) ( not ( = ?auto_457280 ?auto_457283 ) ) ( not ( = ?auto_457280 ?auto_457284 ) ) ( not ( = ?auto_457280 ?auto_457285 ) ) ( not ( = ?auto_457280 ?auto_457286 ) ) ( not ( = ?auto_457280 ?auto_457287 ) ) ( not ( = ?auto_457280 ?auto_457288 ) ) ( not ( = ?auto_457280 ?auto_457289 ) ) ( not ( = ?auto_457280 ?auto_457290 ) ) ( not ( = ?auto_457281 ?auto_457282 ) ) ( not ( = ?auto_457281 ?auto_457283 ) ) ( not ( = ?auto_457281 ?auto_457284 ) ) ( not ( = ?auto_457281 ?auto_457285 ) ) ( not ( = ?auto_457281 ?auto_457286 ) ) ( not ( = ?auto_457281 ?auto_457287 ) ) ( not ( = ?auto_457281 ?auto_457288 ) ) ( not ( = ?auto_457281 ?auto_457289 ) ) ( not ( = ?auto_457281 ?auto_457290 ) ) ( not ( = ?auto_457282 ?auto_457283 ) ) ( not ( = ?auto_457282 ?auto_457284 ) ) ( not ( = ?auto_457282 ?auto_457285 ) ) ( not ( = ?auto_457282 ?auto_457286 ) ) ( not ( = ?auto_457282 ?auto_457287 ) ) ( not ( = ?auto_457282 ?auto_457288 ) ) ( not ( = ?auto_457282 ?auto_457289 ) ) ( not ( = ?auto_457282 ?auto_457290 ) ) ( not ( = ?auto_457283 ?auto_457284 ) ) ( not ( = ?auto_457283 ?auto_457285 ) ) ( not ( = ?auto_457283 ?auto_457286 ) ) ( not ( = ?auto_457283 ?auto_457287 ) ) ( not ( = ?auto_457283 ?auto_457288 ) ) ( not ( = ?auto_457283 ?auto_457289 ) ) ( not ( = ?auto_457283 ?auto_457290 ) ) ( not ( = ?auto_457284 ?auto_457285 ) ) ( not ( = ?auto_457284 ?auto_457286 ) ) ( not ( = ?auto_457284 ?auto_457287 ) ) ( not ( = ?auto_457284 ?auto_457288 ) ) ( not ( = ?auto_457284 ?auto_457289 ) ) ( not ( = ?auto_457284 ?auto_457290 ) ) ( not ( = ?auto_457285 ?auto_457286 ) ) ( not ( = ?auto_457285 ?auto_457287 ) ) ( not ( = ?auto_457285 ?auto_457288 ) ) ( not ( = ?auto_457285 ?auto_457289 ) ) ( not ( = ?auto_457285 ?auto_457290 ) ) ( not ( = ?auto_457286 ?auto_457287 ) ) ( not ( = ?auto_457286 ?auto_457288 ) ) ( not ( = ?auto_457286 ?auto_457289 ) ) ( not ( = ?auto_457286 ?auto_457290 ) ) ( not ( = ?auto_457287 ?auto_457288 ) ) ( not ( = ?auto_457287 ?auto_457289 ) ) ( not ( = ?auto_457287 ?auto_457290 ) ) ( not ( = ?auto_457288 ?auto_457289 ) ) ( not ( = ?auto_457288 ?auto_457290 ) ) ( not ( = ?auto_457289 ?auto_457290 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_457289 ?auto_457290 )
      ( !STACK ?auto_457289 ?auto_457288 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_457331 - BLOCK
      ?auto_457332 - BLOCK
      ?auto_457333 - BLOCK
      ?auto_457334 - BLOCK
      ?auto_457335 - BLOCK
      ?auto_457336 - BLOCK
      ?auto_457337 - BLOCK
      ?auto_457338 - BLOCK
      ?auto_457339 - BLOCK
      ?auto_457340 - BLOCK
      ?auto_457341 - BLOCK
      ?auto_457342 - BLOCK
      ?auto_457343 - BLOCK
    )
    :vars
    (
      ?auto_457344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_457343 ?auto_457344 ) ( ON-TABLE ?auto_457331 ) ( ON ?auto_457332 ?auto_457331 ) ( ON ?auto_457333 ?auto_457332 ) ( ON ?auto_457334 ?auto_457333 ) ( ON ?auto_457335 ?auto_457334 ) ( ON ?auto_457336 ?auto_457335 ) ( ON ?auto_457337 ?auto_457336 ) ( ON ?auto_457338 ?auto_457337 ) ( ON ?auto_457339 ?auto_457338 ) ( ON ?auto_457340 ?auto_457339 ) ( ON ?auto_457341 ?auto_457340 ) ( not ( = ?auto_457331 ?auto_457332 ) ) ( not ( = ?auto_457331 ?auto_457333 ) ) ( not ( = ?auto_457331 ?auto_457334 ) ) ( not ( = ?auto_457331 ?auto_457335 ) ) ( not ( = ?auto_457331 ?auto_457336 ) ) ( not ( = ?auto_457331 ?auto_457337 ) ) ( not ( = ?auto_457331 ?auto_457338 ) ) ( not ( = ?auto_457331 ?auto_457339 ) ) ( not ( = ?auto_457331 ?auto_457340 ) ) ( not ( = ?auto_457331 ?auto_457341 ) ) ( not ( = ?auto_457331 ?auto_457342 ) ) ( not ( = ?auto_457331 ?auto_457343 ) ) ( not ( = ?auto_457331 ?auto_457344 ) ) ( not ( = ?auto_457332 ?auto_457333 ) ) ( not ( = ?auto_457332 ?auto_457334 ) ) ( not ( = ?auto_457332 ?auto_457335 ) ) ( not ( = ?auto_457332 ?auto_457336 ) ) ( not ( = ?auto_457332 ?auto_457337 ) ) ( not ( = ?auto_457332 ?auto_457338 ) ) ( not ( = ?auto_457332 ?auto_457339 ) ) ( not ( = ?auto_457332 ?auto_457340 ) ) ( not ( = ?auto_457332 ?auto_457341 ) ) ( not ( = ?auto_457332 ?auto_457342 ) ) ( not ( = ?auto_457332 ?auto_457343 ) ) ( not ( = ?auto_457332 ?auto_457344 ) ) ( not ( = ?auto_457333 ?auto_457334 ) ) ( not ( = ?auto_457333 ?auto_457335 ) ) ( not ( = ?auto_457333 ?auto_457336 ) ) ( not ( = ?auto_457333 ?auto_457337 ) ) ( not ( = ?auto_457333 ?auto_457338 ) ) ( not ( = ?auto_457333 ?auto_457339 ) ) ( not ( = ?auto_457333 ?auto_457340 ) ) ( not ( = ?auto_457333 ?auto_457341 ) ) ( not ( = ?auto_457333 ?auto_457342 ) ) ( not ( = ?auto_457333 ?auto_457343 ) ) ( not ( = ?auto_457333 ?auto_457344 ) ) ( not ( = ?auto_457334 ?auto_457335 ) ) ( not ( = ?auto_457334 ?auto_457336 ) ) ( not ( = ?auto_457334 ?auto_457337 ) ) ( not ( = ?auto_457334 ?auto_457338 ) ) ( not ( = ?auto_457334 ?auto_457339 ) ) ( not ( = ?auto_457334 ?auto_457340 ) ) ( not ( = ?auto_457334 ?auto_457341 ) ) ( not ( = ?auto_457334 ?auto_457342 ) ) ( not ( = ?auto_457334 ?auto_457343 ) ) ( not ( = ?auto_457334 ?auto_457344 ) ) ( not ( = ?auto_457335 ?auto_457336 ) ) ( not ( = ?auto_457335 ?auto_457337 ) ) ( not ( = ?auto_457335 ?auto_457338 ) ) ( not ( = ?auto_457335 ?auto_457339 ) ) ( not ( = ?auto_457335 ?auto_457340 ) ) ( not ( = ?auto_457335 ?auto_457341 ) ) ( not ( = ?auto_457335 ?auto_457342 ) ) ( not ( = ?auto_457335 ?auto_457343 ) ) ( not ( = ?auto_457335 ?auto_457344 ) ) ( not ( = ?auto_457336 ?auto_457337 ) ) ( not ( = ?auto_457336 ?auto_457338 ) ) ( not ( = ?auto_457336 ?auto_457339 ) ) ( not ( = ?auto_457336 ?auto_457340 ) ) ( not ( = ?auto_457336 ?auto_457341 ) ) ( not ( = ?auto_457336 ?auto_457342 ) ) ( not ( = ?auto_457336 ?auto_457343 ) ) ( not ( = ?auto_457336 ?auto_457344 ) ) ( not ( = ?auto_457337 ?auto_457338 ) ) ( not ( = ?auto_457337 ?auto_457339 ) ) ( not ( = ?auto_457337 ?auto_457340 ) ) ( not ( = ?auto_457337 ?auto_457341 ) ) ( not ( = ?auto_457337 ?auto_457342 ) ) ( not ( = ?auto_457337 ?auto_457343 ) ) ( not ( = ?auto_457337 ?auto_457344 ) ) ( not ( = ?auto_457338 ?auto_457339 ) ) ( not ( = ?auto_457338 ?auto_457340 ) ) ( not ( = ?auto_457338 ?auto_457341 ) ) ( not ( = ?auto_457338 ?auto_457342 ) ) ( not ( = ?auto_457338 ?auto_457343 ) ) ( not ( = ?auto_457338 ?auto_457344 ) ) ( not ( = ?auto_457339 ?auto_457340 ) ) ( not ( = ?auto_457339 ?auto_457341 ) ) ( not ( = ?auto_457339 ?auto_457342 ) ) ( not ( = ?auto_457339 ?auto_457343 ) ) ( not ( = ?auto_457339 ?auto_457344 ) ) ( not ( = ?auto_457340 ?auto_457341 ) ) ( not ( = ?auto_457340 ?auto_457342 ) ) ( not ( = ?auto_457340 ?auto_457343 ) ) ( not ( = ?auto_457340 ?auto_457344 ) ) ( not ( = ?auto_457341 ?auto_457342 ) ) ( not ( = ?auto_457341 ?auto_457343 ) ) ( not ( = ?auto_457341 ?auto_457344 ) ) ( not ( = ?auto_457342 ?auto_457343 ) ) ( not ( = ?auto_457342 ?auto_457344 ) ) ( not ( = ?auto_457343 ?auto_457344 ) ) ( CLEAR ?auto_457341 ) ( ON ?auto_457342 ?auto_457343 ) ( CLEAR ?auto_457342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_457331 ?auto_457332 ?auto_457333 ?auto_457334 ?auto_457335 ?auto_457336 ?auto_457337 ?auto_457338 ?auto_457339 ?auto_457340 ?auto_457341 ?auto_457342 )
      ( MAKE-13PILE ?auto_457331 ?auto_457332 ?auto_457333 ?auto_457334 ?auto_457335 ?auto_457336 ?auto_457337 ?auto_457338 ?auto_457339 ?auto_457340 ?auto_457341 ?auto_457342 ?auto_457343 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_457385 - BLOCK
      ?auto_457386 - BLOCK
      ?auto_457387 - BLOCK
      ?auto_457388 - BLOCK
      ?auto_457389 - BLOCK
      ?auto_457390 - BLOCK
      ?auto_457391 - BLOCK
      ?auto_457392 - BLOCK
      ?auto_457393 - BLOCK
      ?auto_457394 - BLOCK
      ?auto_457395 - BLOCK
      ?auto_457396 - BLOCK
      ?auto_457397 - BLOCK
    )
    :vars
    (
      ?auto_457398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_457397 ?auto_457398 ) ( ON-TABLE ?auto_457385 ) ( ON ?auto_457386 ?auto_457385 ) ( ON ?auto_457387 ?auto_457386 ) ( ON ?auto_457388 ?auto_457387 ) ( ON ?auto_457389 ?auto_457388 ) ( ON ?auto_457390 ?auto_457389 ) ( ON ?auto_457391 ?auto_457390 ) ( ON ?auto_457392 ?auto_457391 ) ( ON ?auto_457393 ?auto_457392 ) ( ON ?auto_457394 ?auto_457393 ) ( not ( = ?auto_457385 ?auto_457386 ) ) ( not ( = ?auto_457385 ?auto_457387 ) ) ( not ( = ?auto_457385 ?auto_457388 ) ) ( not ( = ?auto_457385 ?auto_457389 ) ) ( not ( = ?auto_457385 ?auto_457390 ) ) ( not ( = ?auto_457385 ?auto_457391 ) ) ( not ( = ?auto_457385 ?auto_457392 ) ) ( not ( = ?auto_457385 ?auto_457393 ) ) ( not ( = ?auto_457385 ?auto_457394 ) ) ( not ( = ?auto_457385 ?auto_457395 ) ) ( not ( = ?auto_457385 ?auto_457396 ) ) ( not ( = ?auto_457385 ?auto_457397 ) ) ( not ( = ?auto_457385 ?auto_457398 ) ) ( not ( = ?auto_457386 ?auto_457387 ) ) ( not ( = ?auto_457386 ?auto_457388 ) ) ( not ( = ?auto_457386 ?auto_457389 ) ) ( not ( = ?auto_457386 ?auto_457390 ) ) ( not ( = ?auto_457386 ?auto_457391 ) ) ( not ( = ?auto_457386 ?auto_457392 ) ) ( not ( = ?auto_457386 ?auto_457393 ) ) ( not ( = ?auto_457386 ?auto_457394 ) ) ( not ( = ?auto_457386 ?auto_457395 ) ) ( not ( = ?auto_457386 ?auto_457396 ) ) ( not ( = ?auto_457386 ?auto_457397 ) ) ( not ( = ?auto_457386 ?auto_457398 ) ) ( not ( = ?auto_457387 ?auto_457388 ) ) ( not ( = ?auto_457387 ?auto_457389 ) ) ( not ( = ?auto_457387 ?auto_457390 ) ) ( not ( = ?auto_457387 ?auto_457391 ) ) ( not ( = ?auto_457387 ?auto_457392 ) ) ( not ( = ?auto_457387 ?auto_457393 ) ) ( not ( = ?auto_457387 ?auto_457394 ) ) ( not ( = ?auto_457387 ?auto_457395 ) ) ( not ( = ?auto_457387 ?auto_457396 ) ) ( not ( = ?auto_457387 ?auto_457397 ) ) ( not ( = ?auto_457387 ?auto_457398 ) ) ( not ( = ?auto_457388 ?auto_457389 ) ) ( not ( = ?auto_457388 ?auto_457390 ) ) ( not ( = ?auto_457388 ?auto_457391 ) ) ( not ( = ?auto_457388 ?auto_457392 ) ) ( not ( = ?auto_457388 ?auto_457393 ) ) ( not ( = ?auto_457388 ?auto_457394 ) ) ( not ( = ?auto_457388 ?auto_457395 ) ) ( not ( = ?auto_457388 ?auto_457396 ) ) ( not ( = ?auto_457388 ?auto_457397 ) ) ( not ( = ?auto_457388 ?auto_457398 ) ) ( not ( = ?auto_457389 ?auto_457390 ) ) ( not ( = ?auto_457389 ?auto_457391 ) ) ( not ( = ?auto_457389 ?auto_457392 ) ) ( not ( = ?auto_457389 ?auto_457393 ) ) ( not ( = ?auto_457389 ?auto_457394 ) ) ( not ( = ?auto_457389 ?auto_457395 ) ) ( not ( = ?auto_457389 ?auto_457396 ) ) ( not ( = ?auto_457389 ?auto_457397 ) ) ( not ( = ?auto_457389 ?auto_457398 ) ) ( not ( = ?auto_457390 ?auto_457391 ) ) ( not ( = ?auto_457390 ?auto_457392 ) ) ( not ( = ?auto_457390 ?auto_457393 ) ) ( not ( = ?auto_457390 ?auto_457394 ) ) ( not ( = ?auto_457390 ?auto_457395 ) ) ( not ( = ?auto_457390 ?auto_457396 ) ) ( not ( = ?auto_457390 ?auto_457397 ) ) ( not ( = ?auto_457390 ?auto_457398 ) ) ( not ( = ?auto_457391 ?auto_457392 ) ) ( not ( = ?auto_457391 ?auto_457393 ) ) ( not ( = ?auto_457391 ?auto_457394 ) ) ( not ( = ?auto_457391 ?auto_457395 ) ) ( not ( = ?auto_457391 ?auto_457396 ) ) ( not ( = ?auto_457391 ?auto_457397 ) ) ( not ( = ?auto_457391 ?auto_457398 ) ) ( not ( = ?auto_457392 ?auto_457393 ) ) ( not ( = ?auto_457392 ?auto_457394 ) ) ( not ( = ?auto_457392 ?auto_457395 ) ) ( not ( = ?auto_457392 ?auto_457396 ) ) ( not ( = ?auto_457392 ?auto_457397 ) ) ( not ( = ?auto_457392 ?auto_457398 ) ) ( not ( = ?auto_457393 ?auto_457394 ) ) ( not ( = ?auto_457393 ?auto_457395 ) ) ( not ( = ?auto_457393 ?auto_457396 ) ) ( not ( = ?auto_457393 ?auto_457397 ) ) ( not ( = ?auto_457393 ?auto_457398 ) ) ( not ( = ?auto_457394 ?auto_457395 ) ) ( not ( = ?auto_457394 ?auto_457396 ) ) ( not ( = ?auto_457394 ?auto_457397 ) ) ( not ( = ?auto_457394 ?auto_457398 ) ) ( not ( = ?auto_457395 ?auto_457396 ) ) ( not ( = ?auto_457395 ?auto_457397 ) ) ( not ( = ?auto_457395 ?auto_457398 ) ) ( not ( = ?auto_457396 ?auto_457397 ) ) ( not ( = ?auto_457396 ?auto_457398 ) ) ( not ( = ?auto_457397 ?auto_457398 ) ) ( ON ?auto_457396 ?auto_457397 ) ( CLEAR ?auto_457394 ) ( ON ?auto_457395 ?auto_457396 ) ( CLEAR ?auto_457395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_457385 ?auto_457386 ?auto_457387 ?auto_457388 ?auto_457389 ?auto_457390 ?auto_457391 ?auto_457392 ?auto_457393 ?auto_457394 ?auto_457395 )
      ( MAKE-13PILE ?auto_457385 ?auto_457386 ?auto_457387 ?auto_457388 ?auto_457389 ?auto_457390 ?auto_457391 ?auto_457392 ?auto_457393 ?auto_457394 ?auto_457395 ?auto_457396 ?auto_457397 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_457439 - BLOCK
      ?auto_457440 - BLOCK
      ?auto_457441 - BLOCK
      ?auto_457442 - BLOCK
      ?auto_457443 - BLOCK
      ?auto_457444 - BLOCK
      ?auto_457445 - BLOCK
      ?auto_457446 - BLOCK
      ?auto_457447 - BLOCK
      ?auto_457448 - BLOCK
      ?auto_457449 - BLOCK
      ?auto_457450 - BLOCK
      ?auto_457451 - BLOCK
    )
    :vars
    (
      ?auto_457452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_457451 ?auto_457452 ) ( ON-TABLE ?auto_457439 ) ( ON ?auto_457440 ?auto_457439 ) ( ON ?auto_457441 ?auto_457440 ) ( ON ?auto_457442 ?auto_457441 ) ( ON ?auto_457443 ?auto_457442 ) ( ON ?auto_457444 ?auto_457443 ) ( ON ?auto_457445 ?auto_457444 ) ( ON ?auto_457446 ?auto_457445 ) ( ON ?auto_457447 ?auto_457446 ) ( not ( = ?auto_457439 ?auto_457440 ) ) ( not ( = ?auto_457439 ?auto_457441 ) ) ( not ( = ?auto_457439 ?auto_457442 ) ) ( not ( = ?auto_457439 ?auto_457443 ) ) ( not ( = ?auto_457439 ?auto_457444 ) ) ( not ( = ?auto_457439 ?auto_457445 ) ) ( not ( = ?auto_457439 ?auto_457446 ) ) ( not ( = ?auto_457439 ?auto_457447 ) ) ( not ( = ?auto_457439 ?auto_457448 ) ) ( not ( = ?auto_457439 ?auto_457449 ) ) ( not ( = ?auto_457439 ?auto_457450 ) ) ( not ( = ?auto_457439 ?auto_457451 ) ) ( not ( = ?auto_457439 ?auto_457452 ) ) ( not ( = ?auto_457440 ?auto_457441 ) ) ( not ( = ?auto_457440 ?auto_457442 ) ) ( not ( = ?auto_457440 ?auto_457443 ) ) ( not ( = ?auto_457440 ?auto_457444 ) ) ( not ( = ?auto_457440 ?auto_457445 ) ) ( not ( = ?auto_457440 ?auto_457446 ) ) ( not ( = ?auto_457440 ?auto_457447 ) ) ( not ( = ?auto_457440 ?auto_457448 ) ) ( not ( = ?auto_457440 ?auto_457449 ) ) ( not ( = ?auto_457440 ?auto_457450 ) ) ( not ( = ?auto_457440 ?auto_457451 ) ) ( not ( = ?auto_457440 ?auto_457452 ) ) ( not ( = ?auto_457441 ?auto_457442 ) ) ( not ( = ?auto_457441 ?auto_457443 ) ) ( not ( = ?auto_457441 ?auto_457444 ) ) ( not ( = ?auto_457441 ?auto_457445 ) ) ( not ( = ?auto_457441 ?auto_457446 ) ) ( not ( = ?auto_457441 ?auto_457447 ) ) ( not ( = ?auto_457441 ?auto_457448 ) ) ( not ( = ?auto_457441 ?auto_457449 ) ) ( not ( = ?auto_457441 ?auto_457450 ) ) ( not ( = ?auto_457441 ?auto_457451 ) ) ( not ( = ?auto_457441 ?auto_457452 ) ) ( not ( = ?auto_457442 ?auto_457443 ) ) ( not ( = ?auto_457442 ?auto_457444 ) ) ( not ( = ?auto_457442 ?auto_457445 ) ) ( not ( = ?auto_457442 ?auto_457446 ) ) ( not ( = ?auto_457442 ?auto_457447 ) ) ( not ( = ?auto_457442 ?auto_457448 ) ) ( not ( = ?auto_457442 ?auto_457449 ) ) ( not ( = ?auto_457442 ?auto_457450 ) ) ( not ( = ?auto_457442 ?auto_457451 ) ) ( not ( = ?auto_457442 ?auto_457452 ) ) ( not ( = ?auto_457443 ?auto_457444 ) ) ( not ( = ?auto_457443 ?auto_457445 ) ) ( not ( = ?auto_457443 ?auto_457446 ) ) ( not ( = ?auto_457443 ?auto_457447 ) ) ( not ( = ?auto_457443 ?auto_457448 ) ) ( not ( = ?auto_457443 ?auto_457449 ) ) ( not ( = ?auto_457443 ?auto_457450 ) ) ( not ( = ?auto_457443 ?auto_457451 ) ) ( not ( = ?auto_457443 ?auto_457452 ) ) ( not ( = ?auto_457444 ?auto_457445 ) ) ( not ( = ?auto_457444 ?auto_457446 ) ) ( not ( = ?auto_457444 ?auto_457447 ) ) ( not ( = ?auto_457444 ?auto_457448 ) ) ( not ( = ?auto_457444 ?auto_457449 ) ) ( not ( = ?auto_457444 ?auto_457450 ) ) ( not ( = ?auto_457444 ?auto_457451 ) ) ( not ( = ?auto_457444 ?auto_457452 ) ) ( not ( = ?auto_457445 ?auto_457446 ) ) ( not ( = ?auto_457445 ?auto_457447 ) ) ( not ( = ?auto_457445 ?auto_457448 ) ) ( not ( = ?auto_457445 ?auto_457449 ) ) ( not ( = ?auto_457445 ?auto_457450 ) ) ( not ( = ?auto_457445 ?auto_457451 ) ) ( not ( = ?auto_457445 ?auto_457452 ) ) ( not ( = ?auto_457446 ?auto_457447 ) ) ( not ( = ?auto_457446 ?auto_457448 ) ) ( not ( = ?auto_457446 ?auto_457449 ) ) ( not ( = ?auto_457446 ?auto_457450 ) ) ( not ( = ?auto_457446 ?auto_457451 ) ) ( not ( = ?auto_457446 ?auto_457452 ) ) ( not ( = ?auto_457447 ?auto_457448 ) ) ( not ( = ?auto_457447 ?auto_457449 ) ) ( not ( = ?auto_457447 ?auto_457450 ) ) ( not ( = ?auto_457447 ?auto_457451 ) ) ( not ( = ?auto_457447 ?auto_457452 ) ) ( not ( = ?auto_457448 ?auto_457449 ) ) ( not ( = ?auto_457448 ?auto_457450 ) ) ( not ( = ?auto_457448 ?auto_457451 ) ) ( not ( = ?auto_457448 ?auto_457452 ) ) ( not ( = ?auto_457449 ?auto_457450 ) ) ( not ( = ?auto_457449 ?auto_457451 ) ) ( not ( = ?auto_457449 ?auto_457452 ) ) ( not ( = ?auto_457450 ?auto_457451 ) ) ( not ( = ?auto_457450 ?auto_457452 ) ) ( not ( = ?auto_457451 ?auto_457452 ) ) ( ON ?auto_457450 ?auto_457451 ) ( ON ?auto_457449 ?auto_457450 ) ( CLEAR ?auto_457447 ) ( ON ?auto_457448 ?auto_457449 ) ( CLEAR ?auto_457448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_457439 ?auto_457440 ?auto_457441 ?auto_457442 ?auto_457443 ?auto_457444 ?auto_457445 ?auto_457446 ?auto_457447 ?auto_457448 )
      ( MAKE-13PILE ?auto_457439 ?auto_457440 ?auto_457441 ?auto_457442 ?auto_457443 ?auto_457444 ?auto_457445 ?auto_457446 ?auto_457447 ?auto_457448 ?auto_457449 ?auto_457450 ?auto_457451 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_457493 - BLOCK
      ?auto_457494 - BLOCK
      ?auto_457495 - BLOCK
      ?auto_457496 - BLOCK
      ?auto_457497 - BLOCK
      ?auto_457498 - BLOCK
      ?auto_457499 - BLOCK
      ?auto_457500 - BLOCK
      ?auto_457501 - BLOCK
      ?auto_457502 - BLOCK
      ?auto_457503 - BLOCK
      ?auto_457504 - BLOCK
      ?auto_457505 - BLOCK
    )
    :vars
    (
      ?auto_457506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_457505 ?auto_457506 ) ( ON-TABLE ?auto_457493 ) ( ON ?auto_457494 ?auto_457493 ) ( ON ?auto_457495 ?auto_457494 ) ( ON ?auto_457496 ?auto_457495 ) ( ON ?auto_457497 ?auto_457496 ) ( ON ?auto_457498 ?auto_457497 ) ( ON ?auto_457499 ?auto_457498 ) ( ON ?auto_457500 ?auto_457499 ) ( not ( = ?auto_457493 ?auto_457494 ) ) ( not ( = ?auto_457493 ?auto_457495 ) ) ( not ( = ?auto_457493 ?auto_457496 ) ) ( not ( = ?auto_457493 ?auto_457497 ) ) ( not ( = ?auto_457493 ?auto_457498 ) ) ( not ( = ?auto_457493 ?auto_457499 ) ) ( not ( = ?auto_457493 ?auto_457500 ) ) ( not ( = ?auto_457493 ?auto_457501 ) ) ( not ( = ?auto_457493 ?auto_457502 ) ) ( not ( = ?auto_457493 ?auto_457503 ) ) ( not ( = ?auto_457493 ?auto_457504 ) ) ( not ( = ?auto_457493 ?auto_457505 ) ) ( not ( = ?auto_457493 ?auto_457506 ) ) ( not ( = ?auto_457494 ?auto_457495 ) ) ( not ( = ?auto_457494 ?auto_457496 ) ) ( not ( = ?auto_457494 ?auto_457497 ) ) ( not ( = ?auto_457494 ?auto_457498 ) ) ( not ( = ?auto_457494 ?auto_457499 ) ) ( not ( = ?auto_457494 ?auto_457500 ) ) ( not ( = ?auto_457494 ?auto_457501 ) ) ( not ( = ?auto_457494 ?auto_457502 ) ) ( not ( = ?auto_457494 ?auto_457503 ) ) ( not ( = ?auto_457494 ?auto_457504 ) ) ( not ( = ?auto_457494 ?auto_457505 ) ) ( not ( = ?auto_457494 ?auto_457506 ) ) ( not ( = ?auto_457495 ?auto_457496 ) ) ( not ( = ?auto_457495 ?auto_457497 ) ) ( not ( = ?auto_457495 ?auto_457498 ) ) ( not ( = ?auto_457495 ?auto_457499 ) ) ( not ( = ?auto_457495 ?auto_457500 ) ) ( not ( = ?auto_457495 ?auto_457501 ) ) ( not ( = ?auto_457495 ?auto_457502 ) ) ( not ( = ?auto_457495 ?auto_457503 ) ) ( not ( = ?auto_457495 ?auto_457504 ) ) ( not ( = ?auto_457495 ?auto_457505 ) ) ( not ( = ?auto_457495 ?auto_457506 ) ) ( not ( = ?auto_457496 ?auto_457497 ) ) ( not ( = ?auto_457496 ?auto_457498 ) ) ( not ( = ?auto_457496 ?auto_457499 ) ) ( not ( = ?auto_457496 ?auto_457500 ) ) ( not ( = ?auto_457496 ?auto_457501 ) ) ( not ( = ?auto_457496 ?auto_457502 ) ) ( not ( = ?auto_457496 ?auto_457503 ) ) ( not ( = ?auto_457496 ?auto_457504 ) ) ( not ( = ?auto_457496 ?auto_457505 ) ) ( not ( = ?auto_457496 ?auto_457506 ) ) ( not ( = ?auto_457497 ?auto_457498 ) ) ( not ( = ?auto_457497 ?auto_457499 ) ) ( not ( = ?auto_457497 ?auto_457500 ) ) ( not ( = ?auto_457497 ?auto_457501 ) ) ( not ( = ?auto_457497 ?auto_457502 ) ) ( not ( = ?auto_457497 ?auto_457503 ) ) ( not ( = ?auto_457497 ?auto_457504 ) ) ( not ( = ?auto_457497 ?auto_457505 ) ) ( not ( = ?auto_457497 ?auto_457506 ) ) ( not ( = ?auto_457498 ?auto_457499 ) ) ( not ( = ?auto_457498 ?auto_457500 ) ) ( not ( = ?auto_457498 ?auto_457501 ) ) ( not ( = ?auto_457498 ?auto_457502 ) ) ( not ( = ?auto_457498 ?auto_457503 ) ) ( not ( = ?auto_457498 ?auto_457504 ) ) ( not ( = ?auto_457498 ?auto_457505 ) ) ( not ( = ?auto_457498 ?auto_457506 ) ) ( not ( = ?auto_457499 ?auto_457500 ) ) ( not ( = ?auto_457499 ?auto_457501 ) ) ( not ( = ?auto_457499 ?auto_457502 ) ) ( not ( = ?auto_457499 ?auto_457503 ) ) ( not ( = ?auto_457499 ?auto_457504 ) ) ( not ( = ?auto_457499 ?auto_457505 ) ) ( not ( = ?auto_457499 ?auto_457506 ) ) ( not ( = ?auto_457500 ?auto_457501 ) ) ( not ( = ?auto_457500 ?auto_457502 ) ) ( not ( = ?auto_457500 ?auto_457503 ) ) ( not ( = ?auto_457500 ?auto_457504 ) ) ( not ( = ?auto_457500 ?auto_457505 ) ) ( not ( = ?auto_457500 ?auto_457506 ) ) ( not ( = ?auto_457501 ?auto_457502 ) ) ( not ( = ?auto_457501 ?auto_457503 ) ) ( not ( = ?auto_457501 ?auto_457504 ) ) ( not ( = ?auto_457501 ?auto_457505 ) ) ( not ( = ?auto_457501 ?auto_457506 ) ) ( not ( = ?auto_457502 ?auto_457503 ) ) ( not ( = ?auto_457502 ?auto_457504 ) ) ( not ( = ?auto_457502 ?auto_457505 ) ) ( not ( = ?auto_457502 ?auto_457506 ) ) ( not ( = ?auto_457503 ?auto_457504 ) ) ( not ( = ?auto_457503 ?auto_457505 ) ) ( not ( = ?auto_457503 ?auto_457506 ) ) ( not ( = ?auto_457504 ?auto_457505 ) ) ( not ( = ?auto_457504 ?auto_457506 ) ) ( not ( = ?auto_457505 ?auto_457506 ) ) ( ON ?auto_457504 ?auto_457505 ) ( ON ?auto_457503 ?auto_457504 ) ( ON ?auto_457502 ?auto_457503 ) ( CLEAR ?auto_457500 ) ( ON ?auto_457501 ?auto_457502 ) ( CLEAR ?auto_457501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_457493 ?auto_457494 ?auto_457495 ?auto_457496 ?auto_457497 ?auto_457498 ?auto_457499 ?auto_457500 ?auto_457501 )
      ( MAKE-13PILE ?auto_457493 ?auto_457494 ?auto_457495 ?auto_457496 ?auto_457497 ?auto_457498 ?auto_457499 ?auto_457500 ?auto_457501 ?auto_457502 ?auto_457503 ?auto_457504 ?auto_457505 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_457547 - BLOCK
      ?auto_457548 - BLOCK
      ?auto_457549 - BLOCK
      ?auto_457550 - BLOCK
      ?auto_457551 - BLOCK
      ?auto_457552 - BLOCK
      ?auto_457553 - BLOCK
      ?auto_457554 - BLOCK
      ?auto_457555 - BLOCK
      ?auto_457556 - BLOCK
      ?auto_457557 - BLOCK
      ?auto_457558 - BLOCK
      ?auto_457559 - BLOCK
    )
    :vars
    (
      ?auto_457560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_457559 ?auto_457560 ) ( ON-TABLE ?auto_457547 ) ( ON ?auto_457548 ?auto_457547 ) ( ON ?auto_457549 ?auto_457548 ) ( ON ?auto_457550 ?auto_457549 ) ( ON ?auto_457551 ?auto_457550 ) ( ON ?auto_457552 ?auto_457551 ) ( ON ?auto_457553 ?auto_457552 ) ( not ( = ?auto_457547 ?auto_457548 ) ) ( not ( = ?auto_457547 ?auto_457549 ) ) ( not ( = ?auto_457547 ?auto_457550 ) ) ( not ( = ?auto_457547 ?auto_457551 ) ) ( not ( = ?auto_457547 ?auto_457552 ) ) ( not ( = ?auto_457547 ?auto_457553 ) ) ( not ( = ?auto_457547 ?auto_457554 ) ) ( not ( = ?auto_457547 ?auto_457555 ) ) ( not ( = ?auto_457547 ?auto_457556 ) ) ( not ( = ?auto_457547 ?auto_457557 ) ) ( not ( = ?auto_457547 ?auto_457558 ) ) ( not ( = ?auto_457547 ?auto_457559 ) ) ( not ( = ?auto_457547 ?auto_457560 ) ) ( not ( = ?auto_457548 ?auto_457549 ) ) ( not ( = ?auto_457548 ?auto_457550 ) ) ( not ( = ?auto_457548 ?auto_457551 ) ) ( not ( = ?auto_457548 ?auto_457552 ) ) ( not ( = ?auto_457548 ?auto_457553 ) ) ( not ( = ?auto_457548 ?auto_457554 ) ) ( not ( = ?auto_457548 ?auto_457555 ) ) ( not ( = ?auto_457548 ?auto_457556 ) ) ( not ( = ?auto_457548 ?auto_457557 ) ) ( not ( = ?auto_457548 ?auto_457558 ) ) ( not ( = ?auto_457548 ?auto_457559 ) ) ( not ( = ?auto_457548 ?auto_457560 ) ) ( not ( = ?auto_457549 ?auto_457550 ) ) ( not ( = ?auto_457549 ?auto_457551 ) ) ( not ( = ?auto_457549 ?auto_457552 ) ) ( not ( = ?auto_457549 ?auto_457553 ) ) ( not ( = ?auto_457549 ?auto_457554 ) ) ( not ( = ?auto_457549 ?auto_457555 ) ) ( not ( = ?auto_457549 ?auto_457556 ) ) ( not ( = ?auto_457549 ?auto_457557 ) ) ( not ( = ?auto_457549 ?auto_457558 ) ) ( not ( = ?auto_457549 ?auto_457559 ) ) ( not ( = ?auto_457549 ?auto_457560 ) ) ( not ( = ?auto_457550 ?auto_457551 ) ) ( not ( = ?auto_457550 ?auto_457552 ) ) ( not ( = ?auto_457550 ?auto_457553 ) ) ( not ( = ?auto_457550 ?auto_457554 ) ) ( not ( = ?auto_457550 ?auto_457555 ) ) ( not ( = ?auto_457550 ?auto_457556 ) ) ( not ( = ?auto_457550 ?auto_457557 ) ) ( not ( = ?auto_457550 ?auto_457558 ) ) ( not ( = ?auto_457550 ?auto_457559 ) ) ( not ( = ?auto_457550 ?auto_457560 ) ) ( not ( = ?auto_457551 ?auto_457552 ) ) ( not ( = ?auto_457551 ?auto_457553 ) ) ( not ( = ?auto_457551 ?auto_457554 ) ) ( not ( = ?auto_457551 ?auto_457555 ) ) ( not ( = ?auto_457551 ?auto_457556 ) ) ( not ( = ?auto_457551 ?auto_457557 ) ) ( not ( = ?auto_457551 ?auto_457558 ) ) ( not ( = ?auto_457551 ?auto_457559 ) ) ( not ( = ?auto_457551 ?auto_457560 ) ) ( not ( = ?auto_457552 ?auto_457553 ) ) ( not ( = ?auto_457552 ?auto_457554 ) ) ( not ( = ?auto_457552 ?auto_457555 ) ) ( not ( = ?auto_457552 ?auto_457556 ) ) ( not ( = ?auto_457552 ?auto_457557 ) ) ( not ( = ?auto_457552 ?auto_457558 ) ) ( not ( = ?auto_457552 ?auto_457559 ) ) ( not ( = ?auto_457552 ?auto_457560 ) ) ( not ( = ?auto_457553 ?auto_457554 ) ) ( not ( = ?auto_457553 ?auto_457555 ) ) ( not ( = ?auto_457553 ?auto_457556 ) ) ( not ( = ?auto_457553 ?auto_457557 ) ) ( not ( = ?auto_457553 ?auto_457558 ) ) ( not ( = ?auto_457553 ?auto_457559 ) ) ( not ( = ?auto_457553 ?auto_457560 ) ) ( not ( = ?auto_457554 ?auto_457555 ) ) ( not ( = ?auto_457554 ?auto_457556 ) ) ( not ( = ?auto_457554 ?auto_457557 ) ) ( not ( = ?auto_457554 ?auto_457558 ) ) ( not ( = ?auto_457554 ?auto_457559 ) ) ( not ( = ?auto_457554 ?auto_457560 ) ) ( not ( = ?auto_457555 ?auto_457556 ) ) ( not ( = ?auto_457555 ?auto_457557 ) ) ( not ( = ?auto_457555 ?auto_457558 ) ) ( not ( = ?auto_457555 ?auto_457559 ) ) ( not ( = ?auto_457555 ?auto_457560 ) ) ( not ( = ?auto_457556 ?auto_457557 ) ) ( not ( = ?auto_457556 ?auto_457558 ) ) ( not ( = ?auto_457556 ?auto_457559 ) ) ( not ( = ?auto_457556 ?auto_457560 ) ) ( not ( = ?auto_457557 ?auto_457558 ) ) ( not ( = ?auto_457557 ?auto_457559 ) ) ( not ( = ?auto_457557 ?auto_457560 ) ) ( not ( = ?auto_457558 ?auto_457559 ) ) ( not ( = ?auto_457558 ?auto_457560 ) ) ( not ( = ?auto_457559 ?auto_457560 ) ) ( ON ?auto_457558 ?auto_457559 ) ( ON ?auto_457557 ?auto_457558 ) ( ON ?auto_457556 ?auto_457557 ) ( ON ?auto_457555 ?auto_457556 ) ( CLEAR ?auto_457553 ) ( ON ?auto_457554 ?auto_457555 ) ( CLEAR ?auto_457554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_457547 ?auto_457548 ?auto_457549 ?auto_457550 ?auto_457551 ?auto_457552 ?auto_457553 ?auto_457554 )
      ( MAKE-13PILE ?auto_457547 ?auto_457548 ?auto_457549 ?auto_457550 ?auto_457551 ?auto_457552 ?auto_457553 ?auto_457554 ?auto_457555 ?auto_457556 ?auto_457557 ?auto_457558 ?auto_457559 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_457601 - BLOCK
      ?auto_457602 - BLOCK
      ?auto_457603 - BLOCK
      ?auto_457604 - BLOCK
      ?auto_457605 - BLOCK
      ?auto_457606 - BLOCK
      ?auto_457607 - BLOCK
      ?auto_457608 - BLOCK
      ?auto_457609 - BLOCK
      ?auto_457610 - BLOCK
      ?auto_457611 - BLOCK
      ?auto_457612 - BLOCK
      ?auto_457613 - BLOCK
    )
    :vars
    (
      ?auto_457614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_457613 ?auto_457614 ) ( ON-TABLE ?auto_457601 ) ( ON ?auto_457602 ?auto_457601 ) ( ON ?auto_457603 ?auto_457602 ) ( ON ?auto_457604 ?auto_457603 ) ( ON ?auto_457605 ?auto_457604 ) ( ON ?auto_457606 ?auto_457605 ) ( not ( = ?auto_457601 ?auto_457602 ) ) ( not ( = ?auto_457601 ?auto_457603 ) ) ( not ( = ?auto_457601 ?auto_457604 ) ) ( not ( = ?auto_457601 ?auto_457605 ) ) ( not ( = ?auto_457601 ?auto_457606 ) ) ( not ( = ?auto_457601 ?auto_457607 ) ) ( not ( = ?auto_457601 ?auto_457608 ) ) ( not ( = ?auto_457601 ?auto_457609 ) ) ( not ( = ?auto_457601 ?auto_457610 ) ) ( not ( = ?auto_457601 ?auto_457611 ) ) ( not ( = ?auto_457601 ?auto_457612 ) ) ( not ( = ?auto_457601 ?auto_457613 ) ) ( not ( = ?auto_457601 ?auto_457614 ) ) ( not ( = ?auto_457602 ?auto_457603 ) ) ( not ( = ?auto_457602 ?auto_457604 ) ) ( not ( = ?auto_457602 ?auto_457605 ) ) ( not ( = ?auto_457602 ?auto_457606 ) ) ( not ( = ?auto_457602 ?auto_457607 ) ) ( not ( = ?auto_457602 ?auto_457608 ) ) ( not ( = ?auto_457602 ?auto_457609 ) ) ( not ( = ?auto_457602 ?auto_457610 ) ) ( not ( = ?auto_457602 ?auto_457611 ) ) ( not ( = ?auto_457602 ?auto_457612 ) ) ( not ( = ?auto_457602 ?auto_457613 ) ) ( not ( = ?auto_457602 ?auto_457614 ) ) ( not ( = ?auto_457603 ?auto_457604 ) ) ( not ( = ?auto_457603 ?auto_457605 ) ) ( not ( = ?auto_457603 ?auto_457606 ) ) ( not ( = ?auto_457603 ?auto_457607 ) ) ( not ( = ?auto_457603 ?auto_457608 ) ) ( not ( = ?auto_457603 ?auto_457609 ) ) ( not ( = ?auto_457603 ?auto_457610 ) ) ( not ( = ?auto_457603 ?auto_457611 ) ) ( not ( = ?auto_457603 ?auto_457612 ) ) ( not ( = ?auto_457603 ?auto_457613 ) ) ( not ( = ?auto_457603 ?auto_457614 ) ) ( not ( = ?auto_457604 ?auto_457605 ) ) ( not ( = ?auto_457604 ?auto_457606 ) ) ( not ( = ?auto_457604 ?auto_457607 ) ) ( not ( = ?auto_457604 ?auto_457608 ) ) ( not ( = ?auto_457604 ?auto_457609 ) ) ( not ( = ?auto_457604 ?auto_457610 ) ) ( not ( = ?auto_457604 ?auto_457611 ) ) ( not ( = ?auto_457604 ?auto_457612 ) ) ( not ( = ?auto_457604 ?auto_457613 ) ) ( not ( = ?auto_457604 ?auto_457614 ) ) ( not ( = ?auto_457605 ?auto_457606 ) ) ( not ( = ?auto_457605 ?auto_457607 ) ) ( not ( = ?auto_457605 ?auto_457608 ) ) ( not ( = ?auto_457605 ?auto_457609 ) ) ( not ( = ?auto_457605 ?auto_457610 ) ) ( not ( = ?auto_457605 ?auto_457611 ) ) ( not ( = ?auto_457605 ?auto_457612 ) ) ( not ( = ?auto_457605 ?auto_457613 ) ) ( not ( = ?auto_457605 ?auto_457614 ) ) ( not ( = ?auto_457606 ?auto_457607 ) ) ( not ( = ?auto_457606 ?auto_457608 ) ) ( not ( = ?auto_457606 ?auto_457609 ) ) ( not ( = ?auto_457606 ?auto_457610 ) ) ( not ( = ?auto_457606 ?auto_457611 ) ) ( not ( = ?auto_457606 ?auto_457612 ) ) ( not ( = ?auto_457606 ?auto_457613 ) ) ( not ( = ?auto_457606 ?auto_457614 ) ) ( not ( = ?auto_457607 ?auto_457608 ) ) ( not ( = ?auto_457607 ?auto_457609 ) ) ( not ( = ?auto_457607 ?auto_457610 ) ) ( not ( = ?auto_457607 ?auto_457611 ) ) ( not ( = ?auto_457607 ?auto_457612 ) ) ( not ( = ?auto_457607 ?auto_457613 ) ) ( not ( = ?auto_457607 ?auto_457614 ) ) ( not ( = ?auto_457608 ?auto_457609 ) ) ( not ( = ?auto_457608 ?auto_457610 ) ) ( not ( = ?auto_457608 ?auto_457611 ) ) ( not ( = ?auto_457608 ?auto_457612 ) ) ( not ( = ?auto_457608 ?auto_457613 ) ) ( not ( = ?auto_457608 ?auto_457614 ) ) ( not ( = ?auto_457609 ?auto_457610 ) ) ( not ( = ?auto_457609 ?auto_457611 ) ) ( not ( = ?auto_457609 ?auto_457612 ) ) ( not ( = ?auto_457609 ?auto_457613 ) ) ( not ( = ?auto_457609 ?auto_457614 ) ) ( not ( = ?auto_457610 ?auto_457611 ) ) ( not ( = ?auto_457610 ?auto_457612 ) ) ( not ( = ?auto_457610 ?auto_457613 ) ) ( not ( = ?auto_457610 ?auto_457614 ) ) ( not ( = ?auto_457611 ?auto_457612 ) ) ( not ( = ?auto_457611 ?auto_457613 ) ) ( not ( = ?auto_457611 ?auto_457614 ) ) ( not ( = ?auto_457612 ?auto_457613 ) ) ( not ( = ?auto_457612 ?auto_457614 ) ) ( not ( = ?auto_457613 ?auto_457614 ) ) ( ON ?auto_457612 ?auto_457613 ) ( ON ?auto_457611 ?auto_457612 ) ( ON ?auto_457610 ?auto_457611 ) ( ON ?auto_457609 ?auto_457610 ) ( ON ?auto_457608 ?auto_457609 ) ( CLEAR ?auto_457606 ) ( ON ?auto_457607 ?auto_457608 ) ( CLEAR ?auto_457607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_457601 ?auto_457602 ?auto_457603 ?auto_457604 ?auto_457605 ?auto_457606 ?auto_457607 )
      ( MAKE-13PILE ?auto_457601 ?auto_457602 ?auto_457603 ?auto_457604 ?auto_457605 ?auto_457606 ?auto_457607 ?auto_457608 ?auto_457609 ?auto_457610 ?auto_457611 ?auto_457612 ?auto_457613 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_457655 - BLOCK
      ?auto_457656 - BLOCK
      ?auto_457657 - BLOCK
      ?auto_457658 - BLOCK
      ?auto_457659 - BLOCK
      ?auto_457660 - BLOCK
      ?auto_457661 - BLOCK
      ?auto_457662 - BLOCK
      ?auto_457663 - BLOCK
      ?auto_457664 - BLOCK
      ?auto_457665 - BLOCK
      ?auto_457666 - BLOCK
      ?auto_457667 - BLOCK
    )
    :vars
    (
      ?auto_457668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_457667 ?auto_457668 ) ( ON-TABLE ?auto_457655 ) ( ON ?auto_457656 ?auto_457655 ) ( ON ?auto_457657 ?auto_457656 ) ( ON ?auto_457658 ?auto_457657 ) ( ON ?auto_457659 ?auto_457658 ) ( not ( = ?auto_457655 ?auto_457656 ) ) ( not ( = ?auto_457655 ?auto_457657 ) ) ( not ( = ?auto_457655 ?auto_457658 ) ) ( not ( = ?auto_457655 ?auto_457659 ) ) ( not ( = ?auto_457655 ?auto_457660 ) ) ( not ( = ?auto_457655 ?auto_457661 ) ) ( not ( = ?auto_457655 ?auto_457662 ) ) ( not ( = ?auto_457655 ?auto_457663 ) ) ( not ( = ?auto_457655 ?auto_457664 ) ) ( not ( = ?auto_457655 ?auto_457665 ) ) ( not ( = ?auto_457655 ?auto_457666 ) ) ( not ( = ?auto_457655 ?auto_457667 ) ) ( not ( = ?auto_457655 ?auto_457668 ) ) ( not ( = ?auto_457656 ?auto_457657 ) ) ( not ( = ?auto_457656 ?auto_457658 ) ) ( not ( = ?auto_457656 ?auto_457659 ) ) ( not ( = ?auto_457656 ?auto_457660 ) ) ( not ( = ?auto_457656 ?auto_457661 ) ) ( not ( = ?auto_457656 ?auto_457662 ) ) ( not ( = ?auto_457656 ?auto_457663 ) ) ( not ( = ?auto_457656 ?auto_457664 ) ) ( not ( = ?auto_457656 ?auto_457665 ) ) ( not ( = ?auto_457656 ?auto_457666 ) ) ( not ( = ?auto_457656 ?auto_457667 ) ) ( not ( = ?auto_457656 ?auto_457668 ) ) ( not ( = ?auto_457657 ?auto_457658 ) ) ( not ( = ?auto_457657 ?auto_457659 ) ) ( not ( = ?auto_457657 ?auto_457660 ) ) ( not ( = ?auto_457657 ?auto_457661 ) ) ( not ( = ?auto_457657 ?auto_457662 ) ) ( not ( = ?auto_457657 ?auto_457663 ) ) ( not ( = ?auto_457657 ?auto_457664 ) ) ( not ( = ?auto_457657 ?auto_457665 ) ) ( not ( = ?auto_457657 ?auto_457666 ) ) ( not ( = ?auto_457657 ?auto_457667 ) ) ( not ( = ?auto_457657 ?auto_457668 ) ) ( not ( = ?auto_457658 ?auto_457659 ) ) ( not ( = ?auto_457658 ?auto_457660 ) ) ( not ( = ?auto_457658 ?auto_457661 ) ) ( not ( = ?auto_457658 ?auto_457662 ) ) ( not ( = ?auto_457658 ?auto_457663 ) ) ( not ( = ?auto_457658 ?auto_457664 ) ) ( not ( = ?auto_457658 ?auto_457665 ) ) ( not ( = ?auto_457658 ?auto_457666 ) ) ( not ( = ?auto_457658 ?auto_457667 ) ) ( not ( = ?auto_457658 ?auto_457668 ) ) ( not ( = ?auto_457659 ?auto_457660 ) ) ( not ( = ?auto_457659 ?auto_457661 ) ) ( not ( = ?auto_457659 ?auto_457662 ) ) ( not ( = ?auto_457659 ?auto_457663 ) ) ( not ( = ?auto_457659 ?auto_457664 ) ) ( not ( = ?auto_457659 ?auto_457665 ) ) ( not ( = ?auto_457659 ?auto_457666 ) ) ( not ( = ?auto_457659 ?auto_457667 ) ) ( not ( = ?auto_457659 ?auto_457668 ) ) ( not ( = ?auto_457660 ?auto_457661 ) ) ( not ( = ?auto_457660 ?auto_457662 ) ) ( not ( = ?auto_457660 ?auto_457663 ) ) ( not ( = ?auto_457660 ?auto_457664 ) ) ( not ( = ?auto_457660 ?auto_457665 ) ) ( not ( = ?auto_457660 ?auto_457666 ) ) ( not ( = ?auto_457660 ?auto_457667 ) ) ( not ( = ?auto_457660 ?auto_457668 ) ) ( not ( = ?auto_457661 ?auto_457662 ) ) ( not ( = ?auto_457661 ?auto_457663 ) ) ( not ( = ?auto_457661 ?auto_457664 ) ) ( not ( = ?auto_457661 ?auto_457665 ) ) ( not ( = ?auto_457661 ?auto_457666 ) ) ( not ( = ?auto_457661 ?auto_457667 ) ) ( not ( = ?auto_457661 ?auto_457668 ) ) ( not ( = ?auto_457662 ?auto_457663 ) ) ( not ( = ?auto_457662 ?auto_457664 ) ) ( not ( = ?auto_457662 ?auto_457665 ) ) ( not ( = ?auto_457662 ?auto_457666 ) ) ( not ( = ?auto_457662 ?auto_457667 ) ) ( not ( = ?auto_457662 ?auto_457668 ) ) ( not ( = ?auto_457663 ?auto_457664 ) ) ( not ( = ?auto_457663 ?auto_457665 ) ) ( not ( = ?auto_457663 ?auto_457666 ) ) ( not ( = ?auto_457663 ?auto_457667 ) ) ( not ( = ?auto_457663 ?auto_457668 ) ) ( not ( = ?auto_457664 ?auto_457665 ) ) ( not ( = ?auto_457664 ?auto_457666 ) ) ( not ( = ?auto_457664 ?auto_457667 ) ) ( not ( = ?auto_457664 ?auto_457668 ) ) ( not ( = ?auto_457665 ?auto_457666 ) ) ( not ( = ?auto_457665 ?auto_457667 ) ) ( not ( = ?auto_457665 ?auto_457668 ) ) ( not ( = ?auto_457666 ?auto_457667 ) ) ( not ( = ?auto_457666 ?auto_457668 ) ) ( not ( = ?auto_457667 ?auto_457668 ) ) ( ON ?auto_457666 ?auto_457667 ) ( ON ?auto_457665 ?auto_457666 ) ( ON ?auto_457664 ?auto_457665 ) ( ON ?auto_457663 ?auto_457664 ) ( ON ?auto_457662 ?auto_457663 ) ( ON ?auto_457661 ?auto_457662 ) ( CLEAR ?auto_457659 ) ( ON ?auto_457660 ?auto_457661 ) ( CLEAR ?auto_457660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_457655 ?auto_457656 ?auto_457657 ?auto_457658 ?auto_457659 ?auto_457660 )
      ( MAKE-13PILE ?auto_457655 ?auto_457656 ?auto_457657 ?auto_457658 ?auto_457659 ?auto_457660 ?auto_457661 ?auto_457662 ?auto_457663 ?auto_457664 ?auto_457665 ?auto_457666 ?auto_457667 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_457709 - BLOCK
      ?auto_457710 - BLOCK
      ?auto_457711 - BLOCK
      ?auto_457712 - BLOCK
      ?auto_457713 - BLOCK
      ?auto_457714 - BLOCK
      ?auto_457715 - BLOCK
      ?auto_457716 - BLOCK
      ?auto_457717 - BLOCK
      ?auto_457718 - BLOCK
      ?auto_457719 - BLOCK
      ?auto_457720 - BLOCK
      ?auto_457721 - BLOCK
    )
    :vars
    (
      ?auto_457722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_457721 ?auto_457722 ) ( ON-TABLE ?auto_457709 ) ( ON ?auto_457710 ?auto_457709 ) ( ON ?auto_457711 ?auto_457710 ) ( ON ?auto_457712 ?auto_457711 ) ( not ( = ?auto_457709 ?auto_457710 ) ) ( not ( = ?auto_457709 ?auto_457711 ) ) ( not ( = ?auto_457709 ?auto_457712 ) ) ( not ( = ?auto_457709 ?auto_457713 ) ) ( not ( = ?auto_457709 ?auto_457714 ) ) ( not ( = ?auto_457709 ?auto_457715 ) ) ( not ( = ?auto_457709 ?auto_457716 ) ) ( not ( = ?auto_457709 ?auto_457717 ) ) ( not ( = ?auto_457709 ?auto_457718 ) ) ( not ( = ?auto_457709 ?auto_457719 ) ) ( not ( = ?auto_457709 ?auto_457720 ) ) ( not ( = ?auto_457709 ?auto_457721 ) ) ( not ( = ?auto_457709 ?auto_457722 ) ) ( not ( = ?auto_457710 ?auto_457711 ) ) ( not ( = ?auto_457710 ?auto_457712 ) ) ( not ( = ?auto_457710 ?auto_457713 ) ) ( not ( = ?auto_457710 ?auto_457714 ) ) ( not ( = ?auto_457710 ?auto_457715 ) ) ( not ( = ?auto_457710 ?auto_457716 ) ) ( not ( = ?auto_457710 ?auto_457717 ) ) ( not ( = ?auto_457710 ?auto_457718 ) ) ( not ( = ?auto_457710 ?auto_457719 ) ) ( not ( = ?auto_457710 ?auto_457720 ) ) ( not ( = ?auto_457710 ?auto_457721 ) ) ( not ( = ?auto_457710 ?auto_457722 ) ) ( not ( = ?auto_457711 ?auto_457712 ) ) ( not ( = ?auto_457711 ?auto_457713 ) ) ( not ( = ?auto_457711 ?auto_457714 ) ) ( not ( = ?auto_457711 ?auto_457715 ) ) ( not ( = ?auto_457711 ?auto_457716 ) ) ( not ( = ?auto_457711 ?auto_457717 ) ) ( not ( = ?auto_457711 ?auto_457718 ) ) ( not ( = ?auto_457711 ?auto_457719 ) ) ( not ( = ?auto_457711 ?auto_457720 ) ) ( not ( = ?auto_457711 ?auto_457721 ) ) ( not ( = ?auto_457711 ?auto_457722 ) ) ( not ( = ?auto_457712 ?auto_457713 ) ) ( not ( = ?auto_457712 ?auto_457714 ) ) ( not ( = ?auto_457712 ?auto_457715 ) ) ( not ( = ?auto_457712 ?auto_457716 ) ) ( not ( = ?auto_457712 ?auto_457717 ) ) ( not ( = ?auto_457712 ?auto_457718 ) ) ( not ( = ?auto_457712 ?auto_457719 ) ) ( not ( = ?auto_457712 ?auto_457720 ) ) ( not ( = ?auto_457712 ?auto_457721 ) ) ( not ( = ?auto_457712 ?auto_457722 ) ) ( not ( = ?auto_457713 ?auto_457714 ) ) ( not ( = ?auto_457713 ?auto_457715 ) ) ( not ( = ?auto_457713 ?auto_457716 ) ) ( not ( = ?auto_457713 ?auto_457717 ) ) ( not ( = ?auto_457713 ?auto_457718 ) ) ( not ( = ?auto_457713 ?auto_457719 ) ) ( not ( = ?auto_457713 ?auto_457720 ) ) ( not ( = ?auto_457713 ?auto_457721 ) ) ( not ( = ?auto_457713 ?auto_457722 ) ) ( not ( = ?auto_457714 ?auto_457715 ) ) ( not ( = ?auto_457714 ?auto_457716 ) ) ( not ( = ?auto_457714 ?auto_457717 ) ) ( not ( = ?auto_457714 ?auto_457718 ) ) ( not ( = ?auto_457714 ?auto_457719 ) ) ( not ( = ?auto_457714 ?auto_457720 ) ) ( not ( = ?auto_457714 ?auto_457721 ) ) ( not ( = ?auto_457714 ?auto_457722 ) ) ( not ( = ?auto_457715 ?auto_457716 ) ) ( not ( = ?auto_457715 ?auto_457717 ) ) ( not ( = ?auto_457715 ?auto_457718 ) ) ( not ( = ?auto_457715 ?auto_457719 ) ) ( not ( = ?auto_457715 ?auto_457720 ) ) ( not ( = ?auto_457715 ?auto_457721 ) ) ( not ( = ?auto_457715 ?auto_457722 ) ) ( not ( = ?auto_457716 ?auto_457717 ) ) ( not ( = ?auto_457716 ?auto_457718 ) ) ( not ( = ?auto_457716 ?auto_457719 ) ) ( not ( = ?auto_457716 ?auto_457720 ) ) ( not ( = ?auto_457716 ?auto_457721 ) ) ( not ( = ?auto_457716 ?auto_457722 ) ) ( not ( = ?auto_457717 ?auto_457718 ) ) ( not ( = ?auto_457717 ?auto_457719 ) ) ( not ( = ?auto_457717 ?auto_457720 ) ) ( not ( = ?auto_457717 ?auto_457721 ) ) ( not ( = ?auto_457717 ?auto_457722 ) ) ( not ( = ?auto_457718 ?auto_457719 ) ) ( not ( = ?auto_457718 ?auto_457720 ) ) ( not ( = ?auto_457718 ?auto_457721 ) ) ( not ( = ?auto_457718 ?auto_457722 ) ) ( not ( = ?auto_457719 ?auto_457720 ) ) ( not ( = ?auto_457719 ?auto_457721 ) ) ( not ( = ?auto_457719 ?auto_457722 ) ) ( not ( = ?auto_457720 ?auto_457721 ) ) ( not ( = ?auto_457720 ?auto_457722 ) ) ( not ( = ?auto_457721 ?auto_457722 ) ) ( ON ?auto_457720 ?auto_457721 ) ( ON ?auto_457719 ?auto_457720 ) ( ON ?auto_457718 ?auto_457719 ) ( ON ?auto_457717 ?auto_457718 ) ( ON ?auto_457716 ?auto_457717 ) ( ON ?auto_457715 ?auto_457716 ) ( ON ?auto_457714 ?auto_457715 ) ( CLEAR ?auto_457712 ) ( ON ?auto_457713 ?auto_457714 ) ( CLEAR ?auto_457713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_457709 ?auto_457710 ?auto_457711 ?auto_457712 ?auto_457713 )
      ( MAKE-13PILE ?auto_457709 ?auto_457710 ?auto_457711 ?auto_457712 ?auto_457713 ?auto_457714 ?auto_457715 ?auto_457716 ?auto_457717 ?auto_457718 ?auto_457719 ?auto_457720 ?auto_457721 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_457763 - BLOCK
      ?auto_457764 - BLOCK
      ?auto_457765 - BLOCK
      ?auto_457766 - BLOCK
      ?auto_457767 - BLOCK
      ?auto_457768 - BLOCK
      ?auto_457769 - BLOCK
      ?auto_457770 - BLOCK
      ?auto_457771 - BLOCK
      ?auto_457772 - BLOCK
      ?auto_457773 - BLOCK
      ?auto_457774 - BLOCK
      ?auto_457775 - BLOCK
    )
    :vars
    (
      ?auto_457776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_457775 ?auto_457776 ) ( ON-TABLE ?auto_457763 ) ( ON ?auto_457764 ?auto_457763 ) ( ON ?auto_457765 ?auto_457764 ) ( not ( = ?auto_457763 ?auto_457764 ) ) ( not ( = ?auto_457763 ?auto_457765 ) ) ( not ( = ?auto_457763 ?auto_457766 ) ) ( not ( = ?auto_457763 ?auto_457767 ) ) ( not ( = ?auto_457763 ?auto_457768 ) ) ( not ( = ?auto_457763 ?auto_457769 ) ) ( not ( = ?auto_457763 ?auto_457770 ) ) ( not ( = ?auto_457763 ?auto_457771 ) ) ( not ( = ?auto_457763 ?auto_457772 ) ) ( not ( = ?auto_457763 ?auto_457773 ) ) ( not ( = ?auto_457763 ?auto_457774 ) ) ( not ( = ?auto_457763 ?auto_457775 ) ) ( not ( = ?auto_457763 ?auto_457776 ) ) ( not ( = ?auto_457764 ?auto_457765 ) ) ( not ( = ?auto_457764 ?auto_457766 ) ) ( not ( = ?auto_457764 ?auto_457767 ) ) ( not ( = ?auto_457764 ?auto_457768 ) ) ( not ( = ?auto_457764 ?auto_457769 ) ) ( not ( = ?auto_457764 ?auto_457770 ) ) ( not ( = ?auto_457764 ?auto_457771 ) ) ( not ( = ?auto_457764 ?auto_457772 ) ) ( not ( = ?auto_457764 ?auto_457773 ) ) ( not ( = ?auto_457764 ?auto_457774 ) ) ( not ( = ?auto_457764 ?auto_457775 ) ) ( not ( = ?auto_457764 ?auto_457776 ) ) ( not ( = ?auto_457765 ?auto_457766 ) ) ( not ( = ?auto_457765 ?auto_457767 ) ) ( not ( = ?auto_457765 ?auto_457768 ) ) ( not ( = ?auto_457765 ?auto_457769 ) ) ( not ( = ?auto_457765 ?auto_457770 ) ) ( not ( = ?auto_457765 ?auto_457771 ) ) ( not ( = ?auto_457765 ?auto_457772 ) ) ( not ( = ?auto_457765 ?auto_457773 ) ) ( not ( = ?auto_457765 ?auto_457774 ) ) ( not ( = ?auto_457765 ?auto_457775 ) ) ( not ( = ?auto_457765 ?auto_457776 ) ) ( not ( = ?auto_457766 ?auto_457767 ) ) ( not ( = ?auto_457766 ?auto_457768 ) ) ( not ( = ?auto_457766 ?auto_457769 ) ) ( not ( = ?auto_457766 ?auto_457770 ) ) ( not ( = ?auto_457766 ?auto_457771 ) ) ( not ( = ?auto_457766 ?auto_457772 ) ) ( not ( = ?auto_457766 ?auto_457773 ) ) ( not ( = ?auto_457766 ?auto_457774 ) ) ( not ( = ?auto_457766 ?auto_457775 ) ) ( not ( = ?auto_457766 ?auto_457776 ) ) ( not ( = ?auto_457767 ?auto_457768 ) ) ( not ( = ?auto_457767 ?auto_457769 ) ) ( not ( = ?auto_457767 ?auto_457770 ) ) ( not ( = ?auto_457767 ?auto_457771 ) ) ( not ( = ?auto_457767 ?auto_457772 ) ) ( not ( = ?auto_457767 ?auto_457773 ) ) ( not ( = ?auto_457767 ?auto_457774 ) ) ( not ( = ?auto_457767 ?auto_457775 ) ) ( not ( = ?auto_457767 ?auto_457776 ) ) ( not ( = ?auto_457768 ?auto_457769 ) ) ( not ( = ?auto_457768 ?auto_457770 ) ) ( not ( = ?auto_457768 ?auto_457771 ) ) ( not ( = ?auto_457768 ?auto_457772 ) ) ( not ( = ?auto_457768 ?auto_457773 ) ) ( not ( = ?auto_457768 ?auto_457774 ) ) ( not ( = ?auto_457768 ?auto_457775 ) ) ( not ( = ?auto_457768 ?auto_457776 ) ) ( not ( = ?auto_457769 ?auto_457770 ) ) ( not ( = ?auto_457769 ?auto_457771 ) ) ( not ( = ?auto_457769 ?auto_457772 ) ) ( not ( = ?auto_457769 ?auto_457773 ) ) ( not ( = ?auto_457769 ?auto_457774 ) ) ( not ( = ?auto_457769 ?auto_457775 ) ) ( not ( = ?auto_457769 ?auto_457776 ) ) ( not ( = ?auto_457770 ?auto_457771 ) ) ( not ( = ?auto_457770 ?auto_457772 ) ) ( not ( = ?auto_457770 ?auto_457773 ) ) ( not ( = ?auto_457770 ?auto_457774 ) ) ( not ( = ?auto_457770 ?auto_457775 ) ) ( not ( = ?auto_457770 ?auto_457776 ) ) ( not ( = ?auto_457771 ?auto_457772 ) ) ( not ( = ?auto_457771 ?auto_457773 ) ) ( not ( = ?auto_457771 ?auto_457774 ) ) ( not ( = ?auto_457771 ?auto_457775 ) ) ( not ( = ?auto_457771 ?auto_457776 ) ) ( not ( = ?auto_457772 ?auto_457773 ) ) ( not ( = ?auto_457772 ?auto_457774 ) ) ( not ( = ?auto_457772 ?auto_457775 ) ) ( not ( = ?auto_457772 ?auto_457776 ) ) ( not ( = ?auto_457773 ?auto_457774 ) ) ( not ( = ?auto_457773 ?auto_457775 ) ) ( not ( = ?auto_457773 ?auto_457776 ) ) ( not ( = ?auto_457774 ?auto_457775 ) ) ( not ( = ?auto_457774 ?auto_457776 ) ) ( not ( = ?auto_457775 ?auto_457776 ) ) ( ON ?auto_457774 ?auto_457775 ) ( ON ?auto_457773 ?auto_457774 ) ( ON ?auto_457772 ?auto_457773 ) ( ON ?auto_457771 ?auto_457772 ) ( ON ?auto_457770 ?auto_457771 ) ( ON ?auto_457769 ?auto_457770 ) ( ON ?auto_457768 ?auto_457769 ) ( ON ?auto_457767 ?auto_457768 ) ( CLEAR ?auto_457765 ) ( ON ?auto_457766 ?auto_457767 ) ( CLEAR ?auto_457766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_457763 ?auto_457764 ?auto_457765 ?auto_457766 )
      ( MAKE-13PILE ?auto_457763 ?auto_457764 ?auto_457765 ?auto_457766 ?auto_457767 ?auto_457768 ?auto_457769 ?auto_457770 ?auto_457771 ?auto_457772 ?auto_457773 ?auto_457774 ?auto_457775 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_457817 - BLOCK
      ?auto_457818 - BLOCK
      ?auto_457819 - BLOCK
      ?auto_457820 - BLOCK
      ?auto_457821 - BLOCK
      ?auto_457822 - BLOCK
      ?auto_457823 - BLOCK
      ?auto_457824 - BLOCK
      ?auto_457825 - BLOCK
      ?auto_457826 - BLOCK
      ?auto_457827 - BLOCK
      ?auto_457828 - BLOCK
      ?auto_457829 - BLOCK
    )
    :vars
    (
      ?auto_457830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_457829 ?auto_457830 ) ( ON-TABLE ?auto_457817 ) ( ON ?auto_457818 ?auto_457817 ) ( not ( = ?auto_457817 ?auto_457818 ) ) ( not ( = ?auto_457817 ?auto_457819 ) ) ( not ( = ?auto_457817 ?auto_457820 ) ) ( not ( = ?auto_457817 ?auto_457821 ) ) ( not ( = ?auto_457817 ?auto_457822 ) ) ( not ( = ?auto_457817 ?auto_457823 ) ) ( not ( = ?auto_457817 ?auto_457824 ) ) ( not ( = ?auto_457817 ?auto_457825 ) ) ( not ( = ?auto_457817 ?auto_457826 ) ) ( not ( = ?auto_457817 ?auto_457827 ) ) ( not ( = ?auto_457817 ?auto_457828 ) ) ( not ( = ?auto_457817 ?auto_457829 ) ) ( not ( = ?auto_457817 ?auto_457830 ) ) ( not ( = ?auto_457818 ?auto_457819 ) ) ( not ( = ?auto_457818 ?auto_457820 ) ) ( not ( = ?auto_457818 ?auto_457821 ) ) ( not ( = ?auto_457818 ?auto_457822 ) ) ( not ( = ?auto_457818 ?auto_457823 ) ) ( not ( = ?auto_457818 ?auto_457824 ) ) ( not ( = ?auto_457818 ?auto_457825 ) ) ( not ( = ?auto_457818 ?auto_457826 ) ) ( not ( = ?auto_457818 ?auto_457827 ) ) ( not ( = ?auto_457818 ?auto_457828 ) ) ( not ( = ?auto_457818 ?auto_457829 ) ) ( not ( = ?auto_457818 ?auto_457830 ) ) ( not ( = ?auto_457819 ?auto_457820 ) ) ( not ( = ?auto_457819 ?auto_457821 ) ) ( not ( = ?auto_457819 ?auto_457822 ) ) ( not ( = ?auto_457819 ?auto_457823 ) ) ( not ( = ?auto_457819 ?auto_457824 ) ) ( not ( = ?auto_457819 ?auto_457825 ) ) ( not ( = ?auto_457819 ?auto_457826 ) ) ( not ( = ?auto_457819 ?auto_457827 ) ) ( not ( = ?auto_457819 ?auto_457828 ) ) ( not ( = ?auto_457819 ?auto_457829 ) ) ( not ( = ?auto_457819 ?auto_457830 ) ) ( not ( = ?auto_457820 ?auto_457821 ) ) ( not ( = ?auto_457820 ?auto_457822 ) ) ( not ( = ?auto_457820 ?auto_457823 ) ) ( not ( = ?auto_457820 ?auto_457824 ) ) ( not ( = ?auto_457820 ?auto_457825 ) ) ( not ( = ?auto_457820 ?auto_457826 ) ) ( not ( = ?auto_457820 ?auto_457827 ) ) ( not ( = ?auto_457820 ?auto_457828 ) ) ( not ( = ?auto_457820 ?auto_457829 ) ) ( not ( = ?auto_457820 ?auto_457830 ) ) ( not ( = ?auto_457821 ?auto_457822 ) ) ( not ( = ?auto_457821 ?auto_457823 ) ) ( not ( = ?auto_457821 ?auto_457824 ) ) ( not ( = ?auto_457821 ?auto_457825 ) ) ( not ( = ?auto_457821 ?auto_457826 ) ) ( not ( = ?auto_457821 ?auto_457827 ) ) ( not ( = ?auto_457821 ?auto_457828 ) ) ( not ( = ?auto_457821 ?auto_457829 ) ) ( not ( = ?auto_457821 ?auto_457830 ) ) ( not ( = ?auto_457822 ?auto_457823 ) ) ( not ( = ?auto_457822 ?auto_457824 ) ) ( not ( = ?auto_457822 ?auto_457825 ) ) ( not ( = ?auto_457822 ?auto_457826 ) ) ( not ( = ?auto_457822 ?auto_457827 ) ) ( not ( = ?auto_457822 ?auto_457828 ) ) ( not ( = ?auto_457822 ?auto_457829 ) ) ( not ( = ?auto_457822 ?auto_457830 ) ) ( not ( = ?auto_457823 ?auto_457824 ) ) ( not ( = ?auto_457823 ?auto_457825 ) ) ( not ( = ?auto_457823 ?auto_457826 ) ) ( not ( = ?auto_457823 ?auto_457827 ) ) ( not ( = ?auto_457823 ?auto_457828 ) ) ( not ( = ?auto_457823 ?auto_457829 ) ) ( not ( = ?auto_457823 ?auto_457830 ) ) ( not ( = ?auto_457824 ?auto_457825 ) ) ( not ( = ?auto_457824 ?auto_457826 ) ) ( not ( = ?auto_457824 ?auto_457827 ) ) ( not ( = ?auto_457824 ?auto_457828 ) ) ( not ( = ?auto_457824 ?auto_457829 ) ) ( not ( = ?auto_457824 ?auto_457830 ) ) ( not ( = ?auto_457825 ?auto_457826 ) ) ( not ( = ?auto_457825 ?auto_457827 ) ) ( not ( = ?auto_457825 ?auto_457828 ) ) ( not ( = ?auto_457825 ?auto_457829 ) ) ( not ( = ?auto_457825 ?auto_457830 ) ) ( not ( = ?auto_457826 ?auto_457827 ) ) ( not ( = ?auto_457826 ?auto_457828 ) ) ( not ( = ?auto_457826 ?auto_457829 ) ) ( not ( = ?auto_457826 ?auto_457830 ) ) ( not ( = ?auto_457827 ?auto_457828 ) ) ( not ( = ?auto_457827 ?auto_457829 ) ) ( not ( = ?auto_457827 ?auto_457830 ) ) ( not ( = ?auto_457828 ?auto_457829 ) ) ( not ( = ?auto_457828 ?auto_457830 ) ) ( not ( = ?auto_457829 ?auto_457830 ) ) ( ON ?auto_457828 ?auto_457829 ) ( ON ?auto_457827 ?auto_457828 ) ( ON ?auto_457826 ?auto_457827 ) ( ON ?auto_457825 ?auto_457826 ) ( ON ?auto_457824 ?auto_457825 ) ( ON ?auto_457823 ?auto_457824 ) ( ON ?auto_457822 ?auto_457823 ) ( ON ?auto_457821 ?auto_457822 ) ( ON ?auto_457820 ?auto_457821 ) ( CLEAR ?auto_457818 ) ( ON ?auto_457819 ?auto_457820 ) ( CLEAR ?auto_457819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_457817 ?auto_457818 ?auto_457819 )
      ( MAKE-13PILE ?auto_457817 ?auto_457818 ?auto_457819 ?auto_457820 ?auto_457821 ?auto_457822 ?auto_457823 ?auto_457824 ?auto_457825 ?auto_457826 ?auto_457827 ?auto_457828 ?auto_457829 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_457871 - BLOCK
      ?auto_457872 - BLOCK
      ?auto_457873 - BLOCK
      ?auto_457874 - BLOCK
      ?auto_457875 - BLOCK
      ?auto_457876 - BLOCK
      ?auto_457877 - BLOCK
      ?auto_457878 - BLOCK
      ?auto_457879 - BLOCK
      ?auto_457880 - BLOCK
      ?auto_457881 - BLOCK
      ?auto_457882 - BLOCK
      ?auto_457883 - BLOCK
    )
    :vars
    (
      ?auto_457884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_457883 ?auto_457884 ) ( ON-TABLE ?auto_457871 ) ( not ( = ?auto_457871 ?auto_457872 ) ) ( not ( = ?auto_457871 ?auto_457873 ) ) ( not ( = ?auto_457871 ?auto_457874 ) ) ( not ( = ?auto_457871 ?auto_457875 ) ) ( not ( = ?auto_457871 ?auto_457876 ) ) ( not ( = ?auto_457871 ?auto_457877 ) ) ( not ( = ?auto_457871 ?auto_457878 ) ) ( not ( = ?auto_457871 ?auto_457879 ) ) ( not ( = ?auto_457871 ?auto_457880 ) ) ( not ( = ?auto_457871 ?auto_457881 ) ) ( not ( = ?auto_457871 ?auto_457882 ) ) ( not ( = ?auto_457871 ?auto_457883 ) ) ( not ( = ?auto_457871 ?auto_457884 ) ) ( not ( = ?auto_457872 ?auto_457873 ) ) ( not ( = ?auto_457872 ?auto_457874 ) ) ( not ( = ?auto_457872 ?auto_457875 ) ) ( not ( = ?auto_457872 ?auto_457876 ) ) ( not ( = ?auto_457872 ?auto_457877 ) ) ( not ( = ?auto_457872 ?auto_457878 ) ) ( not ( = ?auto_457872 ?auto_457879 ) ) ( not ( = ?auto_457872 ?auto_457880 ) ) ( not ( = ?auto_457872 ?auto_457881 ) ) ( not ( = ?auto_457872 ?auto_457882 ) ) ( not ( = ?auto_457872 ?auto_457883 ) ) ( not ( = ?auto_457872 ?auto_457884 ) ) ( not ( = ?auto_457873 ?auto_457874 ) ) ( not ( = ?auto_457873 ?auto_457875 ) ) ( not ( = ?auto_457873 ?auto_457876 ) ) ( not ( = ?auto_457873 ?auto_457877 ) ) ( not ( = ?auto_457873 ?auto_457878 ) ) ( not ( = ?auto_457873 ?auto_457879 ) ) ( not ( = ?auto_457873 ?auto_457880 ) ) ( not ( = ?auto_457873 ?auto_457881 ) ) ( not ( = ?auto_457873 ?auto_457882 ) ) ( not ( = ?auto_457873 ?auto_457883 ) ) ( not ( = ?auto_457873 ?auto_457884 ) ) ( not ( = ?auto_457874 ?auto_457875 ) ) ( not ( = ?auto_457874 ?auto_457876 ) ) ( not ( = ?auto_457874 ?auto_457877 ) ) ( not ( = ?auto_457874 ?auto_457878 ) ) ( not ( = ?auto_457874 ?auto_457879 ) ) ( not ( = ?auto_457874 ?auto_457880 ) ) ( not ( = ?auto_457874 ?auto_457881 ) ) ( not ( = ?auto_457874 ?auto_457882 ) ) ( not ( = ?auto_457874 ?auto_457883 ) ) ( not ( = ?auto_457874 ?auto_457884 ) ) ( not ( = ?auto_457875 ?auto_457876 ) ) ( not ( = ?auto_457875 ?auto_457877 ) ) ( not ( = ?auto_457875 ?auto_457878 ) ) ( not ( = ?auto_457875 ?auto_457879 ) ) ( not ( = ?auto_457875 ?auto_457880 ) ) ( not ( = ?auto_457875 ?auto_457881 ) ) ( not ( = ?auto_457875 ?auto_457882 ) ) ( not ( = ?auto_457875 ?auto_457883 ) ) ( not ( = ?auto_457875 ?auto_457884 ) ) ( not ( = ?auto_457876 ?auto_457877 ) ) ( not ( = ?auto_457876 ?auto_457878 ) ) ( not ( = ?auto_457876 ?auto_457879 ) ) ( not ( = ?auto_457876 ?auto_457880 ) ) ( not ( = ?auto_457876 ?auto_457881 ) ) ( not ( = ?auto_457876 ?auto_457882 ) ) ( not ( = ?auto_457876 ?auto_457883 ) ) ( not ( = ?auto_457876 ?auto_457884 ) ) ( not ( = ?auto_457877 ?auto_457878 ) ) ( not ( = ?auto_457877 ?auto_457879 ) ) ( not ( = ?auto_457877 ?auto_457880 ) ) ( not ( = ?auto_457877 ?auto_457881 ) ) ( not ( = ?auto_457877 ?auto_457882 ) ) ( not ( = ?auto_457877 ?auto_457883 ) ) ( not ( = ?auto_457877 ?auto_457884 ) ) ( not ( = ?auto_457878 ?auto_457879 ) ) ( not ( = ?auto_457878 ?auto_457880 ) ) ( not ( = ?auto_457878 ?auto_457881 ) ) ( not ( = ?auto_457878 ?auto_457882 ) ) ( not ( = ?auto_457878 ?auto_457883 ) ) ( not ( = ?auto_457878 ?auto_457884 ) ) ( not ( = ?auto_457879 ?auto_457880 ) ) ( not ( = ?auto_457879 ?auto_457881 ) ) ( not ( = ?auto_457879 ?auto_457882 ) ) ( not ( = ?auto_457879 ?auto_457883 ) ) ( not ( = ?auto_457879 ?auto_457884 ) ) ( not ( = ?auto_457880 ?auto_457881 ) ) ( not ( = ?auto_457880 ?auto_457882 ) ) ( not ( = ?auto_457880 ?auto_457883 ) ) ( not ( = ?auto_457880 ?auto_457884 ) ) ( not ( = ?auto_457881 ?auto_457882 ) ) ( not ( = ?auto_457881 ?auto_457883 ) ) ( not ( = ?auto_457881 ?auto_457884 ) ) ( not ( = ?auto_457882 ?auto_457883 ) ) ( not ( = ?auto_457882 ?auto_457884 ) ) ( not ( = ?auto_457883 ?auto_457884 ) ) ( ON ?auto_457882 ?auto_457883 ) ( ON ?auto_457881 ?auto_457882 ) ( ON ?auto_457880 ?auto_457881 ) ( ON ?auto_457879 ?auto_457880 ) ( ON ?auto_457878 ?auto_457879 ) ( ON ?auto_457877 ?auto_457878 ) ( ON ?auto_457876 ?auto_457877 ) ( ON ?auto_457875 ?auto_457876 ) ( ON ?auto_457874 ?auto_457875 ) ( ON ?auto_457873 ?auto_457874 ) ( CLEAR ?auto_457871 ) ( ON ?auto_457872 ?auto_457873 ) ( CLEAR ?auto_457872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_457871 ?auto_457872 )
      ( MAKE-13PILE ?auto_457871 ?auto_457872 ?auto_457873 ?auto_457874 ?auto_457875 ?auto_457876 ?auto_457877 ?auto_457878 ?auto_457879 ?auto_457880 ?auto_457881 ?auto_457882 ?auto_457883 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_457925 - BLOCK
      ?auto_457926 - BLOCK
      ?auto_457927 - BLOCK
      ?auto_457928 - BLOCK
      ?auto_457929 - BLOCK
      ?auto_457930 - BLOCK
      ?auto_457931 - BLOCK
      ?auto_457932 - BLOCK
      ?auto_457933 - BLOCK
      ?auto_457934 - BLOCK
      ?auto_457935 - BLOCK
      ?auto_457936 - BLOCK
      ?auto_457937 - BLOCK
    )
    :vars
    (
      ?auto_457938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_457937 ?auto_457938 ) ( not ( = ?auto_457925 ?auto_457926 ) ) ( not ( = ?auto_457925 ?auto_457927 ) ) ( not ( = ?auto_457925 ?auto_457928 ) ) ( not ( = ?auto_457925 ?auto_457929 ) ) ( not ( = ?auto_457925 ?auto_457930 ) ) ( not ( = ?auto_457925 ?auto_457931 ) ) ( not ( = ?auto_457925 ?auto_457932 ) ) ( not ( = ?auto_457925 ?auto_457933 ) ) ( not ( = ?auto_457925 ?auto_457934 ) ) ( not ( = ?auto_457925 ?auto_457935 ) ) ( not ( = ?auto_457925 ?auto_457936 ) ) ( not ( = ?auto_457925 ?auto_457937 ) ) ( not ( = ?auto_457925 ?auto_457938 ) ) ( not ( = ?auto_457926 ?auto_457927 ) ) ( not ( = ?auto_457926 ?auto_457928 ) ) ( not ( = ?auto_457926 ?auto_457929 ) ) ( not ( = ?auto_457926 ?auto_457930 ) ) ( not ( = ?auto_457926 ?auto_457931 ) ) ( not ( = ?auto_457926 ?auto_457932 ) ) ( not ( = ?auto_457926 ?auto_457933 ) ) ( not ( = ?auto_457926 ?auto_457934 ) ) ( not ( = ?auto_457926 ?auto_457935 ) ) ( not ( = ?auto_457926 ?auto_457936 ) ) ( not ( = ?auto_457926 ?auto_457937 ) ) ( not ( = ?auto_457926 ?auto_457938 ) ) ( not ( = ?auto_457927 ?auto_457928 ) ) ( not ( = ?auto_457927 ?auto_457929 ) ) ( not ( = ?auto_457927 ?auto_457930 ) ) ( not ( = ?auto_457927 ?auto_457931 ) ) ( not ( = ?auto_457927 ?auto_457932 ) ) ( not ( = ?auto_457927 ?auto_457933 ) ) ( not ( = ?auto_457927 ?auto_457934 ) ) ( not ( = ?auto_457927 ?auto_457935 ) ) ( not ( = ?auto_457927 ?auto_457936 ) ) ( not ( = ?auto_457927 ?auto_457937 ) ) ( not ( = ?auto_457927 ?auto_457938 ) ) ( not ( = ?auto_457928 ?auto_457929 ) ) ( not ( = ?auto_457928 ?auto_457930 ) ) ( not ( = ?auto_457928 ?auto_457931 ) ) ( not ( = ?auto_457928 ?auto_457932 ) ) ( not ( = ?auto_457928 ?auto_457933 ) ) ( not ( = ?auto_457928 ?auto_457934 ) ) ( not ( = ?auto_457928 ?auto_457935 ) ) ( not ( = ?auto_457928 ?auto_457936 ) ) ( not ( = ?auto_457928 ?auto_457937 ) ) ( not ( = ?auto_457928 ?auto_457938 ) ) ( not ( = ?auto_457929 ?auto_457930 ) ) ( not ( = ?auto_457929 ?auto_457931 ) ) ( not ( = ?auto_457929 ?auto_457932 ) ) ( not ( = ?auto_457929 ?auto_457933 ) ) ( not ( = ?auto_457929 ?auto_457934 ) ) ( not ( = ?auto_457929 ?auto_457935 ) ) ( not ( = ?auto_457929 ?auto_457936 ) ) ( not ( = ?auto_457929 ?auto_457937 ) ) ( not ( = ?auto_457929 ?auto_457938 ) ) ( not ( = ?auto_457930 ?auto_457931 ) ) ( not ( = ?auto_457930 ?auto_457932 ) ) ( not ( = ?auto_457930 ?auto_457933 ) ) ( not ( = ?auto_457930 ?auto_457934 ) ) ( not ( = ?auto_457930 ?auto_457935 ) ) ( not ( = ?auto_457930 ?auto_457936 ) ) ( not ( = ?auto_457930 ?auto_457937 ) ) ( not ( = ?auto_457930 ?auto_457938 ) ) ( not ( = ?auto_457931 ?auto_457932 ) ) ( not ( = ?auto_457931 ?auto_457933 ) ) ( not ( = ?auto_457931 ?auto_457934 ) ) ( not ( = ?auto_457931 ?auto_457935 ) ) ( not ( = ?auto_457931 ?auto_457936 ) ) ( not ( = ?auto_457931 ?auto_457937 ) ) ( not ( = ?auto_457931 ?auto_457938 ) ) ( not ( = ?auto_457932 ?auto_457933 ) ) ( not ( = ?auto_457932 ?auto_457934 ) ) ( not ( = ?auto_457932 ?auto_457935 ) ) ( not ( = ?auto_457932 ?auto_457936 ) ) ( not ( = ?auto_457932 ?auto_457937 ) ) ( not ( = ?auto_457932 ?auto_457938 ) ) ( not ( = ?auto_457933 ?auto_457934 ) ) ( not ( = ?auto_457933 ?auto_457935 ) ) ( not ( = ?auto_457933 ?auto_457936 ) ) ( not ( = ?auto_457933 ?auto_457937 ) ) ( not ( = ?auto_457933 ?auto_457938 ) ) ( not ( = ?auto_457934 ?auto_457935 ) ) ( not ( = ?auto_457934 ?auto_457936 ) ) ( not ( = ?auto_457934 ?auto_457937 ) ) ( not ( = ?auto_457934 ?auto_457938 ) ) ( not ( = ?auto_457935 ?auto_457936 ) ) ( not ( = ?auto_457935 ?auto_457937 ) ) ( not ( = ?auto_457935 ?auto_457938 ) ) ( not ( = ?auto_457936 ?auto_457937 ) ) ( not ( = ?auto_457936 ?auto_457938 ) ) ( not ( = ?auto_457937 ?auto_457938 ) ) ( ON ?auto_457936 ?auto_457937 ) ( ON ?auto_457935 ?auto_457936 ) ( ON ?auto_457934 ?auto_457935 ) ( ON ?auto_457933 ?auto_457934 ) ( ON ?auto_457932 ?auto_457933 ) ( ON ?auto_457931 ?auto_457932 ) ( ON ?auto_457930 ?auto_457931 ) ( ON ?auto_457929 ?auto_457930 ) ( ON ?auto_457928 ?auto_457929 ) ( ON ?auto_457927 ?auto_457928 ) ( ON ?auto_457926 ?auto_457927 ) ( ON ?auto_457925 ?auto_457926 ) ( CLEAR ?auto_457925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_457925 )
      ( MAKE-13PILE ?auto_457925 ?auto_457926 ?auto_457927 ?auto_457928 ?auto_457929 ?auto_457930 ?auto_457931 ?auto_457932 ?auto_457933 ?auto_457934 ?auto_457935 ?auto_457936 ?auto_457937 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_457980 - BLOCK
      ?auto_457981 - BLOCK
      ?auto_457982 - BLOCK
      ?auto_457983 - BLOCK
      ?auto_457984 - BLOCK
      ?auto_457985 - BLOCK
      ?auto_457986 - BLOCK
      ?auto_457987 - BLOCK
      ?auto_457988 - BLOCK
      ?auto_457989 - BLOCK
      ?auto_457990 - BLOCK
      ?auto_457991 - BLOCK
      ?auto_457992 - BLOCK
      ?auto_457993 - BLOCK
    )
    :vars
    (
      ?auto_457994 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_457992 ) ( ON ?auto_457993 ?auto_457994 ) ( CLEAR ?auto_457993 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_457980 ) ( ON ?auto_457981 ?auto_457980 ) ( ON ?auto_457982 ?auto_457981 ) ( ON ?auto_457983 ?auto_457982 ) ( ON ?auto_457984 ?auto_457983 ) ( ON ?auto_457985 ?auto_457984 ) ( ON ?auto_457986 ?auto_457985 ) ( ON ?auto_457987 ?auto_457986 ) ( ON ?auto_457988 ?auto_457987 ) ( ON ?auto_457989 ?auto_457988 ) ( ON ?auto_457990 ?auto_457989 ) ( ON ?auto_457991 ?auto_457990 ) ( ON ?auto_457992 ?auto_457991 ) ( not ( = ?auto_457980 ?auto_457981 ) ) ( not ( = ?auto_457980 ?auto_457982 ) ) ( not ( = ?auto_457980 ?auto_457983 ) ) ( not ( = ?auto_457980 ?auto_457984 ) ) ( not ( = ?auto_457980 ?auto_457985 ) ) ( not ( = ?auto_457980 ?auto_457986 ) ) ( not ( = ?auto_457980 ?auto_457987 ) ) ( not ( = ?auto_457980 ?auto_457988 ) ) ( not ( = ?auto_457980 ?auto_457989 ) ) ( not ( = ?auto_457980 ?auto_457990 ) ) ( not ( = ?auto_457980 ?auto_457991 ) ) ( not ( = ?auto_457980 ?auto_457992 ) ) ( not ( = ?auto_457980 ?auto_457993 ) ) ( not ( = ?auto_457980 ?auto_457994 ) ) ( not ( = ?auto_457981 ?auto_457982 ) ) ( not ( = ?auto_457981 ?auto_457983 ) ) ( not ( = ?auto_457981 ?auto_457984 ) ) ( not ( = ?auto_457981 ?auto_457985 ) ) ( not ( = ?auto_457981 ?auto_457986 ) ) ( not ( = ?auto_457981 ?auto_457987 ) ) ( not ( = ?auto_457981 ?auto_457988 ) ) ( not ( = ?auto_457981 ?auto_457989 ) ) ( not ( = ?auto_457981 ?auto_457990 ) ) ( not ( = ?auto_457981 ?auto_457991 ) ) ( not ( = ?auto_457981 ?auto_457992 ) ) ( not ( = ?auto_457981 ?auto_457993 ) ) ( not ( = ?auto_457981 ?auto_457994 ) ) ( not ( = ?auto_457982 ?auto_457983 ) ) ( not ( = ?auto_457982 ?auto_457984 ) ) ( not ( = ?auto_457982 ?auto_457985 ) ) ( not ( = ?auto_457982 ?auto_457986 ) ) ( not ( = ?auto_457982 ?auto_457987 ) ) ( not ( = ?auto_457982 ?auto_457988 ) ) ( not ( = ?auto_457982 ?auto_457989 ) ) ( not ( = ?auto_457982 ?auto_457990 ) ) ( not ( = ?auto_457982 ?auto_457991 ) ) ( not ( = ?auto_457982 ?auto_457992 ) ) ( not ( = ?auto_457982 ?auto_457993 ) ) ( not ( = ?auto_457982 ?auto_457994 ) ) ( not ( = ?auto_457983 ?auto_457984 ) ) ( not ( = ?auto_457983 ?auto_457985 ) ) ( not ( = ?auto_457983 ?auto_457986 ) ) ( not ( = ?auto_457983 ?auto_457987 ) ) ( not ( = ?auto_457983 ?auto_457988 ) ) ( not ( = ?auto_457983 ?auto_457989 ) ) ( not ( = ?auto_457983 ?auto_457990 ) ) ( not ( = ?auto_457983 ?auto_457991 ) ) ( not ( = ?auto_457983 ?auto_457992 ) ) ( not ( = ?auto_457983 ?auto_457993 ) ) ( not ( = ?auto_457983 ?auto_457994 ) ) ( not ( = ?auto_457984 ?auto_457985 ) ) ( not ( = ?auto_457984 ?auto_457986 ) ) ( not ( = ?auto_457984 ?auto_457987 ) ) ( not ( = ?auto_457984 ?auto_457988 ) ) ( not ( = ?auto_457984 ?auto_457989 ) ) ( not ( = ?auto_457984 ?auto_457990 ) ) ( not ( = ?auto_457984 ?auto_457991 ) ) ( not ( = ?auto_457984 ?auto_457992 ) ) ( not ( = ?auto_457984 ?auto_457993 ) ) ( not ( = ?auto_457984 ?auto_457994 ) ) ( not ( = ?auto_457985 ?auto_457986 ) ) ( not ( = ?auto_457985 ?auto_457987 ) ) ( not ( = ?auto_457985 ?auto_457988 ) ) ( not ( = ?auto_457985 ?auto_457989 ) ) ( not ( = ?auto_457985 ?auto_457990 ) ) ( not ( = ?auto_457985 ?auto_457991 ) ) ( not ( = ?auto_457985 ?auto_457992 ) ) ( not ( = ?auto_457985 ?auto_457993 ) ) ( not ( = ?auto_457985 ?auto_457994 ) ) ( not ( = ?auto_457986 ?auto_457987 ) ) ( not ( = ?auto_457986 ?auto_457988 ) ) ( not ( = ?auto_457986 ?auto_457989 ) ) ( not ( = ?auto_457986 ?auto_457990 ) ) ( not ( = ?auto_457986 ?auto_457991 ) ) ( not ( = ?auto_457986 ?auto_457992 ) ) ( not ( = ?auto_457986 ?auto_457993 ) ) ( not ( = ?auto_457986 ?auto_457994 ) ) ( not ( = ?auto_457987 ?auto_457988 ) ) ( not ( = ?auto_457987 ?auto_457989 ) ) ( not ( = ?auto_457987 ?auto_457990 ) ) ( not ( = ?auto_457987 ?auto_457991 ) ) ( not ( = ?auto_457987 ?auto_457992 ) ) ( not ( = ?auto_457987 ?auto_457993 ) ) ( not ( = ?auto_457987 ?auto_457994 ) ) ( not ( = ?auto_457988 ?auto_457989 ) ) ( not ( = ?auto_457988 ?auto_457990 ) ) ( not ( = ?auto_457988 ?auto_457991 ) ) ( not ( = ?auto_457988 ?auto_457992 ) ) ( not ( = ?auto_457988 ?auto_457993 ) ) ( not ( = ?auto_457988 ?auto_457994 ) ) ( not ( = ?auto_457989 ?auto_457990 ) ) ( not ( = ?auto_457989 ?auto_457991 ) ) ( not ( = ?auto_457989 ?auto_457992 ) ) ( not ( = ?auto_457989 ?auto_457993 ) ) ( not ( = ?auto_457989 ?auto_457994 ) ) ( not ( = ?auto_457990 ?auto_457991 ) ) ( not ( = ?auto_457990 ?auto_457992 ) ) ( not ( = ?auto_457990 ?auto_457993 ) ) ( not ( = ?auto_457990 ?auto_457994 ) ) ( not ( = ?auto_457991 ?auto_457992 ) ) ( not ( = ?auto_457991 ?auto_457993 ) ) ( not ( = ?auto_457991 ?auto_457994 ) ) ( not ( = ?auto_457992 ?auto_457993 ) ) ( not ( = ?auto_457992 ?auto_457994 ) ) ( not ( = ?auto_457993 ?auto_457994 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_457993 ?auto_457994 )
      ( !STACK ?auto_457993 ?auto_457992 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_458038 - BLOCK
      ?auto_458039 - BLOCK
      ?auto_458040 - BLOCK
      ?auto_458041 - BLOCK
      ?auto_458042 - BLOCK
      ?auto_458043 - BLOCK
      ?auto_458044 - BLOCK
      ?auto_458045 - BLOCK
      ?auto_458046 - BLOCK
      ?auto_458047 - BLOCK
      ?auto_458048 - BLOCK
      ?auto_458049 - BLOCK
      ?auto_458050 - BLOCK
      ?auto_458051 - BLOCK
    )
    :vars
    (
      ?auto_458052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_458051 ?auto_458052 ) ( ON-TABLE ?auto_458038 ) ( ON ?auto_458039 ?auto_458038 ) ( ON ?auto_458040 ?auto_458039 ) ( ON ?auto_458041 ?auto_458040 ) ( ON ?auto_458042 ?auto_458041 ) ( ON ?auto_458043 ?auto_458042 ) ( ON ?auto_458044 ?auto_458043 ) ( ON ?auto_458045 ?auto_458044 ) ( ON ?auto_458046 ?auto_458045 ) ( ON ?auto_458047 ?auto_458046 ) ( ON ?auto_458048 ?auto_458047 ) ( ON ?auto_458049 ?auto_458048 ) ( not ( = ?auto_458038 ?auto_458039 ) ) ( not ( = ?auto_458038 ?auto_458040 ) ) ( not ( = ?auto_458038 ?auto_458041 ) ) ( not ( = ?auto_458038 ?auto_458042 ) ) ( not ( = ?auto_458038 ?auto_458043 ) ) ( not ( = ?auto_458038 ?auto_458044 ) ) ( not ( = ?auto_458038 ?auto_458045 ) ) ( not ( = ?auto_458038 ?auto_458046 ) ) ( not ( = ?auto_458038 ?auto_458047 ) ) ( not ( = ?auto_458038 ?auto_458048 ) ) ( not ( = ?auto_458038 ?auto_458049 ) ) ( not ( = ?auto_458038 ?auto_458050 ) ) ( not ( = ?auto_458038 ?auto_458051 ) ) ( not ( = ?auto_458038 ?auto_458052 ) ) ( not ( = ?auto_458039 ?auto_458040 ) ) ( not ( = ?auto_458039 ?auto_458041 ) ) ( not ( = ?auto_458039 ?auto_458042 ) ) ( not ( = ?auto_458039 ?auto_458043 ) ) ( not ( = ?auto_458039 ?auto_458044 ) ) ( not ( = ?auto_458039 ?auto_458045 ) ) ( not ( = ?auto_458039 ?auto_458046 ) ) ( not ( = ?auto_458039 ?auto_458047 ) ) ( not ( = ?auto_458039 ?auto_458048 ) ) ( not ( = ?auto_458039 ?auto_458049 ) ) ( not ( = ?auto_458039 ?auto_458050 ) ) ( not ( = ?auto_458039 ?auto_458051 ) ) ( not ( = ?auto_458039 ?auto_458052 ) ) ( not ( = ?auto_458040 ?auto_458041 ) ) ( not ( = ?auto_458040 ?auto_458042 ) ) ( not ( = ?auto_458040 ?auto_458043 ) ) ( not ( = ?auto_458040 ?auto_458044 ) ) ( not ( = ?auto_458040 ?auto_458045 ) ) ( not ( = ?auto_458040 ?auto_458046 ) ) ( not ( = ?auto_458040 ?auto_458047 ) ) ( not ( = ?auto_458040 ?auto_458048 ) ) ( not ( = ?auto_458040 ?auto_458049 ) ) ( not ( = ?auto_458040 ?auto_458050 ) ) ( not ( = ?auto_458040 ?auto_458051 ) ) ( not ( = ?auto_458040 ?auto_458052 ) ) ( not ( = ?auto_458041 ?auto_458042 ) ) ( not ( = ?auto_458041 ?auto_458043 ) ) ( not ( = ?auto_458041 ?auto_458044 ) ) ( not ( = ?auto_458041 ?auto_458045 ) ) ( not ( = ?auto_458041 ?auto_458046 ) ) ( not ( = ?auto_458041 ?auto_458047 ) ) ( not ( = ?auto_458041 ?auto_458048 ) ) ( not ( = ?auto_458041 ?auto_458049 ) ) ( not ( = ?auto_458041 ?auto_458050 ) ) ( not ( = ?auto_458041 ?auto_458051 ) ) ( not ( = ?auto_458041 ?auto_458052 ) ) ( not ( = ?auto_458042 ?auto_458043 ) ) ( not ( = ?auto_458042 ?auto_458044 ) ) ( not ( = ?auto_458042 ?auto_458045 ) ) ( not ( = ?auto_458042 ?auto_458046 ) ) ( not ( = ?auto_458042 ?auto_458047 ) ) ( not ( = ?auto_458042 ?auto_458048 ) ) ( not ( = ?auto_458042 ?auto_458049 ) ) ( not ( = ?auto_458042 ?auto_458050 ) ) ( not ( = ?auto_458042 ?auto_458051 ) ) ( not ( = ?auto_458042 ?auto_458052 ) ) ( not ( = ?auto_458043 ?auto_458044 ) ) ( not ( = ?auto_458043 ?auto_458045 ) ) ( not ( = ?auto_458043 ?auto_458046 ) ) ( not ( = ?auto_458043 ?auto_458047 ) ) ( not ( = ?auto_458043 ?auto_458048 ) ) ( not ( = ?auto_458043 ?auto_458049 ) ) ( not ( = ?auto_458043 ?auto_458050 ) ) ( not ( = ?auto_458043 ?auto_458051 ) ) ( not ( = ?auto_458043 ?auto_458052 ) ) ( not ( = ?auto_458044 ?auto_458045 ) ) ( not ( = ?auto_458044 ?auto_458046 ) ) ( not ( = ?auto_458044 ?auto_458047 ) ) ( not ( = ?auto_458044 ?auto_458048 ) ) ( not ( = ?auto_458044 ?auto_458049 ) ) ( not ( = ?auto_458044 ?auto_458050 ) ) ( not ( = ?auto_458044 ?auto_458051 ) ) ( not ( = ?auto_458044 ?auto_458052 ) ) ( not ( = ?auto_458045 ?auto_458046 ) ) ( not ( = ?auto_458045 ?auto_458047 ) ) ( not ( = ?auto_458045 ?auto_458048 ) ) ( not ( = ?auto_458045 ?auto_458049 ) ) ( not ( = ?auto_458045 ?auto_458050 ) ) ( not ( = ?auto_458045 ?auto_458051 ) ) ( not ( = ?auto_458045 ?auto_458052 ) ) ( not ( = ?auto_458046 ?auto_458047 ) ) ( not ( = ?auto_458046 ?auto_458048 ) ) ( not ( = ?auto_458046 ?auto_458049 ) ) ( not ( = ?auto_458046 ?auto_458050 ) ) ( not ( = ?auto_458046 ?auto_458051 ) ) ( not ( = ?auto_458046 ?auto_458052 ) ) ( not ( = ?auto_458047 ?auto_458048 ) ) ( not ( = ?auto_458047 ?auto_458049 ) ) ( not ( = ?auto_458047 ?auto_458050 ) ) ( not ( = ?auto_458047 ?auto_458051 ) ) ( not ( = ?auto_458047 ?auto_458052 ) ) ( not ( = ?auto_458048 ?auto_458049 ) ) ( not ( = ?auto_458048 ?auto_458050 ) ) ( not ( = ?auto_458048 ?auto_458051 ) ) ( not ( = ?auto_458048 ?auto_458052 ) ) ( not ( = ?auto_458049 ?auto_458050 ) ) ( not ( = ?auto_458049 ?auto_458051 ) ) ( not ( = ?auto_458049 ?auto_458052 ) ) ( not ( = ?auto_458050 ?auto_458051 ) ) ( not ( = ?auto_458050 ?auto_458052 ) ) ( not ( = ?auto_458051 ?auto_458052 ) ) ( CLEAR ?auto_458049 ) ( ON ?auto_458050 ?auto_458051 ) ( CLEAR ?auto_458050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_458038 ?auto_458039 ?auto_458040 ?auto_458041 ?auto_458042 ?auto_458043 ?auto_458044 ?auto_458045 ?auto_458046 ?auto_458047 ?auto_458048 ?auto_458049 ?auto_458050 )
      ( MAKE-14PILE ?auto_458038 ?auto_458039 ?auto_458040 ?auto_458041 ?auto_458042 ?auto_458043 ?auto_458044 ?auto_458045 ?auto_458046 ?auto_458047 ?auto_458048 ?auto_458049 ?auto_458050 ?auto_458051 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_458096 - BLOCK
      ?auto_458097 - BLOCK
      ?auto_458098 - BLOCK
      ?auto_458099 - BLOCK
      ?auto_458100 - BLOCK
      ?auto_458101 - BLOCK
      ?auto_458102 - BLOCK
      ?auto_458103 - BLOCK
      ?auto_458104 - BLOCK
      ?auto_458105 - BLOCK
      ?auto_458106 - BLOCK
      ?auto_458107 - BLOCK
      ?auto_458108 - BLOCK
      ?auto_458109 - BLOCK
    )
    :vars
    (
      ?auto_458110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_458109 ?auto_458110 ) ( ON-TABLE ?auto_458096 ) ( ON ?auto_458097 ?auto_458096 ) ( ON ?auto_458098 ?auto_458097 ) ( ON ?auto_458099 ?auto_458098 ) ( ON ?auto_458100 ?auto_458099 ) ( ON ?auto_458101 ?auto_458100 ) ( ON ?auto_458102 ?auto_458101 ) ( ON ?auto_458103 ?auto_458102 ) ( ON ?auto_458104 ?auto_458103 ) ( ON ?auto_458105 ?auto_458104 ) ( ON ?auto_458106 ?auto_458105 ) ( not ( = ?auto_458096 ?auto_458097 ) ) ( not ( = ?auto_458096 ?auto_458098 ) ) ( not ( = ?auto_458096 ?auto_458099 ) ) ( not ( = ?auto_458096 ?auto_458100 ) ) ( not ( = ?auto_458096 ?auto_458101 ) ) ( not ( = ?auto_458096 ?auto_458102 ) ) ( not ( = ?auto_458096 ?auto_458103 ) ) ( not ( = ?auto_458096 ?auto_458104 ) ) ( not ( = ?auto_458096 ?auto_458105 ) ) ( not ( = ?auto_458096 ?auto_458106 ) ) ( not ( = ?auto_458096 ?auto_458107 ) ) ( not ( = ?auto_458096 ?auto_458108 ) ) ( not ( = ?auto_458096 ?auto_458109 ) ) ( not ( = ?auto_458096 ?auto_458110 ) ) ( not ( = ?auto_458097 ?auto_458098 ) ) ( not ( = ?auto_458097 ?auto_458099 ) ) ( not ( = ?auto_458097 ?auto_458100 ) ) ( not ( = ?auto_458097 ?auto_458101 ) ) ( not ( = ?auto_458097 ?auto_458102 ) ) ( not ( = ?auto_458097 ?auto_458103 ) ) ( not ( = ?auto_458097 ?auto_458104 ) ) ( not ( = ?auto_458097 ?auto_458105 ) ) ( not ( = ?auto_458097 ?auto_458106 ) ) ( not ( = ?auto_458097 ?auto_458107 ) ) ( not ( = ?auto_458097 ?auto_458108 ) ) ( not ( = ?auto_458097 ?auto_458109 ) ) ( not ( = ?auto_458097 ?auto_458110 ) ) ( not ( = ?auto_458098 ?auto_458099 ) ) ( not ( = ?auto_458098 ?auto_458100 ) ) ( not ( = ?auto_458098 ?auto_458101 ) ) ( not ( = ?auto_458098 ?auto_458102 ) ) ( not ( = ?auto_458098 ?auto_458103 ) ) ( not ( = ?auto_458098 ?auto_458104 ) ) ( not ( = ?auto_458098 ?auto_458105 ) ) ( not ( = ?auto_458098 ?auto_458106 ) ) ( not ( = ?auto_458098 ?auto_458107 ) ) ( not ( = ?auto_458098 ?auto_458108 ) ) ( not ( = ?auto_458098 ?auto_458109 ) ) ( not ( = ?auto_458098 ?auto_458110 ) ) ( not ( = ?auto_458099 ?auto_458100 ) ) ( not ( = ?auto_458099 ?auto_458101 ) ) ( not ( = ?auto_458099 ?auto_458102 ) ) ( not ( = ?auto_458099 ?auto_458103 ) ) ( not ( = ?auto_458099 ?auto_458104 ) ) ( not ( = ?auto_458099 ?auto_458105 ) ) ( not ( = ?auto_458099 ?auto_458106 ) ) ( not ( = ?auto_458099 ?auto_458107 ) ) ( not ( = ?auto_458099 ?auto_458108 ) ) ( not ( = ?auto_458099 ?auto_458109 ) ) ( not ( = ?auto_458099 ?auto_458110 ) ) ( not ( = ?auto_458100 ?auto_458101 ) ) ( not ( = ?auto_458100 ?auto_458102 ) ) ( not ( = ?auto_458100 ?auto_458103 ) ) ( not ( = ?auto_458100 ?auto_458104 ) ) ( not ( = ?auto_458100 ?auto_458105 ) ) ( not ( = ?auto_458100 ?auto_458106 ) ) ( not ( = ?auto_458100 ?auto_458107 ) ) ( not ( = ?auto_458100 ?auto_458108 ) ) ( not ( = ?auto_458100 ?auto_458109 ) ) ( not ( = ?auto_458100 ?auto_458110 ) ) ( not ( = ?auto_458101 ?auto_458102 ) ) ( not ( = ?auto_458101 ?auto_458103 ) ) ( not ( = ?auto_458101 ?auto_458104 ) ) ( not ( = ?auto_458101 ?auto_458105 ) ) ( not ( = ?auto_458101 ?auto_458106 ) ) ( not ( = ?auto_458101 ?auto_458107 ) ) ( not ( = ?auto_458101 ?auto_458108 ) ) ( not ( = ?auto_458101 ?auto_458109 ) ) ( not ( = ?auto_458101 ?auto_458110 ) ) ( not ( = ?auto_458102 ?auto_458103 ) ) ( not ( = ?auto_458102 ?auto_458104 ) ) ( not ( = ?auto_458102 ?auto_458105 ) ) ( not ( = ?auto_458102 ?auto_458106 ) ) ( not ( = ?auto_458102 ?auto_458107 ) ) ( not ( = ?auto_458102 ?auto_458108 ) ) ( not ( = ?auto_458102 ?auto_458109 ) ) ( not ( = ?auto_458102 ?auto_458110 ) ) ( not ( = ?auto_458103 ?auto_458104 ) ) ( not ( = ?auto_458103 ?auto_458105 ) ) ( not ( = ?auto_458103 ?auto_458106 ) ) ( not ( = ?auto_458103 ?auto_458107 ) ) ( not ( = ?auto_458103 ?auto_458108 ) ) ( not ( = ?auto_458103 ?auto_458109 ) ) ( not ( = ?auto_458103 ?auto_458110 ) ) ( not ( = ?auto_458104 ?auto_458105 ) ) ( not ( = ?auto_458104 ?auto_458106 ) ) ( not ( = ?auto_458104 ?auto_458107 ) ) ( not ( = ?auto_458104 ?auto_458108 ) ) ( not ( = ?auto_458104 ?auto_458109 ) ) ( not ( = ?auto_458104 ?auto_458110 ) ) ( not ( = ?auto_458105 ?auto_458106 ) ) ( not ( = ?auto_458105 ?auto_458107 ) ) ( not ( = ?auto_458105 ?auto_458108 ) ) ( not ( = ?auto_458105 ?auto_458109 ) ) ( not ( = ?auto_458105 ?auto_458110 ) ) ( not ( = ?auto_458106 ?auto_458107 ) ) ( not ( = ?auto_458106 ?auto_458108 ) ) ( not ( = ?auto_458106 ?auto_458109 ) ) ( not ( = ?auto_458106 ?auto_458110 ) ) ( not ( = ?auto_458107 ?auto_458108 ) ) ( not ( = ?auto_458107 ?auto_458109 ) ) ( not ( = ?auto_458107 ?auto_458110 ) ) ( not ( = ?auto_458108 ?auto_458109 ) ) ( not ( = ?auto_458108 ?auto_458110 ) ) ( not ( = ?auto_458109 ?auto_458110 ) ) ( ON ?auto_458108 ?auto_458109 ) ( CLEAR ?auto_458106 ) ( ON ?auto_458107 ?auto_458108 ) ( CLEAR ?auto_458107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_458096 ?auto_458097 ?auto_458098 ?auto_458099 ?auto_458100 ?auto_458101 ?auto_458102 ?auto_458103 ?auto_458104 ?auto_458105 ?auto_458106 ?auto_458107 )
      ( MAKE-14PILE ?auto_458096 ?auto_458097 ?auto_458098 ?auto_458099 ?auto_458100 ?auto_458101 ?auto_458102 ?auto_458103 ?auto_458104 ?auto_458105 ?auto_458106 ?auto_458107 ?auto_458108 ?auto_458109 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_458154 - BLOCK
      ?auto_458155 - BLOCK
      ?auto_458156 - BLOCK
      ?auto_458157 - BLOCK
      ?auto_458158 - BLOCK
      ?auto_458159 - BLOCK
      ?auto_458160 - BLOCK
      ?auto_458161 - BLOCK
      ?auto_458162 - BLOCK
      ?auto_458163 - BLOCK
      ?auto_458164 - BLOCK
      ?auto_458165 - BLOCK
      ?auto_458166 - BLOCK
      ?auto_458167 - BLOCK
    )
    :vars
    (
      ?auto_458168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_458167 ?auto_458168 ) ( ON-TABLE ?auto_458154 ) ( ON ?auto_458155 ?auto_458154 ) ( ON ?auto_458156 ?auto_458155 ) ( ON ?auto_458157 ?auto_458156 ) ( ON ?auto_458158 ?auto_458157 ) ( ON ?auto_458159 ?auto_458158 ) ( ON ?auto_458160 ?auto_458159 ) ( ON ?auto_458161 ?auto_458160 ) ( ON ?auto_458162 ?auto_458161 ) ( ON ?auto_458163 ?auto_458162 ) ( not ( = ?auto_458154 ?auto_458155 ) ) ( not ( = ?auto_458154 ?auto_458156 ) ) ( not ( = ?auto_458154 ?auto_458157 ) ) ( not ( = ?auto_458154 ?auto_458158 ) ) ( not ( = ?auto_458154 ?auto_458159 ) ) ( not ( = ?auto_458154 ?auto_458160 ) ) ( not ( = ?auto_458154 ?auto_458161 ) ) ( not ( = ?auto_458154 ?auto_458162 ) ) ( not ( = ?auto_458154 ?auto_458163 ) ) ( not ( = ?auto_458154 ?auto_458164 ) ) ( not ( = ?auto_458154 ?auto_458165 ) ) ( not ( = ?auto_458154 ?auto_458166 ) ) ( not ( = ?auto_458154 ?auto_458167 ) ) ( not ( = ?auto_458154 ?auto_458168 ) ) ( not ( = ?auto_458155 ?auto_458156 ) ) ( not ( = ?auto_458155 ?auto_458157 ) ) ( not ( = ?auto_458155 ?auto_458158 ) ) ( not ( = ?auto_458155 ?auto_458159 ) ) ( not ( = ?auto_458155 ?auto_458160 ) ) ( not ( = ?auto_458155 ?auto_458161 ) ) ( not ( = ?auto_458155 ?auto_458162 ) ) ( not ( = ?auto_458155 ?auto_458163 ) ) ( not ( = ?auto_458155 ?auto_458164 ) ) ( not ( = ?auto_458155 ?auto_458165 ) ) ( not ( = ?auto_458155 ?auto_458166 ) ) ( not ( = ?auto_458155 ?auto_458167 ) ) ( not ( = ?auto_458155 ?auto_458168 ) ) ( not ( = ?auto_458156 ?auto_458157 ) ) ( not ( = ?auto_458156 ?auto_458158 ) ) ( not ( = ?auto_458156 ?auto_458159 ) ) ( not ( = ?auto_458156 ?auto_458160 ) ) ( not ( = ?auto_458156 ?auto_458161 ) ) ( not ( = ?auto_458156 ?auto_458162 ) ) ( not ( = ?auto_458156 ?auto_458163 ) ) ( not ( = ?auto_458156 ?auto_458164 ) ) ( not ( = ?auto_458156 ?auto_458165 ) ) ( not ( = ?auto_458156 ?auto_458166 ) ) ( not ( = ?auto_458156 ?auto_458167 ) ) ( not ( = ?auto_458156 ?auto_458168 ) ) ( not ( = ?auto_458157 ?auto_458158 ) ) ( not ( = ?auto_458157 ?auto_458159 ) ) ( not ( = ?auto_458157 ?auto_458160 ) ) ( not ( = ?auto_458157 ?auto_458161 ) ) ( not ( = ?auto_458157 ?auto_458162 ) ) ( not ( = ?auto_458157 ?auto_458163 ) ) ( not ( = ?auto_458157 ?auto_458164 ) ) ( not ( = ?auto_458157 ?auto_458165 ) ) ( not ( = ?auto_458157 ?auto_458166 ) ) ( not ( = ?auto_458157 ?auto_458167 ) ) ( not ( = ?auto_458157 ?auto_458168 ) ) ( not ( = ?auto_458158 ?auto_458159 ) ) ( not ( = ?auto_458158 ?auto_458160 ) ) ( not ( = ?auto_458158 ?auto_458161 ) ) ( not ( = ?auto_458158 ?auto_458162 ) ) ( not ( = ?auto_458158 ?auto_458163 ) ) ( not ( = ?auto_458158 ?auto_458164 ) ) ( not ( = ?auto_458158 ?auto_458165 ) ) ( not ( = ?auto_458158 ?auto_458166 ) ) ( not ( = ?auto_458158 ?auto_458167 ) ) ( not ( = ?auto_458158 ?auto_458168 ) ) ( not ( = ?auto_458159 ?auto_458160 ) ) ( not ( = ?auto_458159 ?auto_458161 ) ) ( not ( = ?auto_458159 ?auto_458162 ) ) ( not ( = ?auto_458159 ?auto_458163 ) ) ( not ( = ?auto_458159 ?auto_458164 ) ) ( not ( = ?auto_458159 ?auto_458165 ) ) ( not ( = ?auto_458159 ?auto_458166 ) ) ( not ( = ?auto_458159 ?auto_458167 ) ) ( not ( = ?auto_458159 ?auto_458168 ) ) ( not ( = ?auto_458160 ?auto_458161 ) ) ( not ( = ?auto_458160 ?auto_458162 ) ) ( not ( = ?auto_458160 ?auto_458163 ) ) ( not ( = ?auto_458160 ?auto_458164 ) ) ( not ( = ?auto_458160 ?auto_458165 ) ) ( not ( = ?auto_458160 ?auto_458166 ) ) ( not ( = ?auto_458160 ?auto_458167 ) ) ( not ( = ?auto_458160 ?auto_458168 ) ) ( not ( = ?auto_458161 ?auto_458162 ) ) ( not ( = ?auto_458161 ?auto_458163 ) ) ( not ( = ?auto_458161 ?auto_458164 ) ) ( not ( = ?auto_458161 ?auto_458165 ) ) ( not ( = ?auto_458161 ?auto_458166 ) ) ( not ( = ?auto_458161 ?auto_458167 ) ) ( not ( = ?auto_458161 ?auto_458168 ) ) ( not ( = ?auto_458162 ?auto_458163 ) ) ( not ( = ?auto_458162 ?auto_458164 ) ) ( not ( = ?auto_458162 ?auto_458165 ) ) ( not ( = ?auto_458162 ?auto_458166 ) ) ( not ( = ?auto_458162 ?auto_458167 ) ) ( not ( = ?auto_458162 ?auto_458168 ) ) ( not ( = ?auto_458163 ?auto_458164 ) ) ( not ( = ?auto_458163 ?auto_458165 ) ) ( not ( = ?auto_458163 ?auto_458166 ) ) ( not ( = ?auto_458163 ?auto_458167 ) ) ( not ( = ?auto_458163 ?auto_458168 ) ) ( not ( = ?auto_458164 ?auto_458165 ) ) ( not ( = ?auto_458164 ?auto_458166 ) ) ( not ( = ?auto_458164 ?auto_458167 ) ) ( not ( = ?auto_458164 ?auto_458168 ) ) ( not ( = ?auto_458165 ?auto_458166 ) ) ( not ( = ?auto_458165 ?auto_458167 ) ) ( not ( = ?auto_458165 ?auto_458168 ) ) ( not ( = ?auto_458166 ?auto_458167 ) ) ( not ( = ?auto_458166 ?auto_458168 ) ) ( not ( = ?auto_458167 ?auto_458168 ) ) ( ON ?auto_458166 ?auto_458167 ) ( ON ?auto_458165 ?auto_458166 ) ( CLEAR ?auto_458163 ) ( ON ?auto_458164 ?auto_458165 ) ( CLEAR ?auto_458164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_458154 ?auto_458155 ?auto_458156 ?auto_458157 ?auto_458158 ?auto_458159 ?auto_458160 ?auto_458161 ?auto_458162 ?auto_458163 ?auto_458164 )
      ( MAKE-14PILE ?auto_458154 ?auto_458155 ?auto_458156 ?auto_458157 ?auto_458158 ?auto_458159 ?auto_458160 ?auto_458161 ?auto_458162 ?auto_458163 ?auto_458164 ?auto_458165 ?auto_458166 ?auto_458167 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_458212 - BLOCK
      ?auto_458213 - BLOCK
      ?auto_458214 - BLOCK
      ?auto_458215 - BLOCK
      ?auto_458216 - BLOCK
      ?auto_458217 - BLOCK
      ?auto_458218 - BLOCK
      ?auto_458219 - BLOCK
      ?auto_458220 - BLOCK
      ?auto_458221 - BLOCK
      ?auto_458222 - BLOCK
      ?auto_458223 - BLOCK
      ?auto_458224 - BLOCK
      ?auto_458225 - BLOCK
    )
    :vars
    (
      ?auto_458226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_458225 ?auto_458226 ) ( ON-TABLE ?auto_458212 ) ( ON ?auto_458213 ?auto_458212 ) ( ON ?auto_458214 ?auto_458213 ) ( ON ?auto_458215 ?auto_458214 ) ( ON ?auto_458216 ?auto_458215 ) ( ON ?auto_458217 ?auto_458216 ) ( ON ?auto_458218 ?auto_458217 ) ( ON ?auto_458219 ?auto_458218 ) ( ON ?auto_458220 ?auto_458219 ) ( not ( = ?auto_458212 ?auto_458213 ) ) ( not ( = ?auto_458212 ?auto_458214 ) ) ( not ( = ?auto_458212 ?auto_458215 ) ) ( not ( = ?auto_458212 ?auto_458216 ) ) ( not ( = ?auto_458212 ?auto_458217 ) ) ( not ( = ?auto_458212 ?auto_458218 ) ) ( not ( = ?auto_458212 ?auto_458219 ) ) ( not ( = ?auto_458212 ?auto_458220 ) ) ( not ( = ?auto_458212 ?auto_458221 ) ) ( not ( = ?auto_458212 ?auto_458222 ) ) ( not ( = ?auto_458212 ?auto_458223 ) ) ( not ( = ?auto_458212 ?auto_458224 ) ) ( not ( = ?auto_458212 ?auto_458225 ) ) ( not ( = ?auto_458212 ?auto_458226 ) ) ( not ( = ?auto_458213 ?auto_458214 ) ) ( not ( = ?auto_458213 ?auto_458215 ) ) ( not ( = ?auto_458213 ?auto_458216 ) ) ( not ( = ?auto_458213 ?auto_458217 ) ) ( not ( = ?auto_458213 ?auto_458218 ) ) ( not ( = ?auto_458213 ?auto_458219 ) ) ( not ( = ?auto_458213 ?auto_458220 ) ) ( not ( = ?auto_458213 ?auto_458221 ) ) ( not ( = ?auto_458213 ?auto_458222 ) ) ( not ( = ?auto_458213 ?auto_458223 ) ) ( not ( = ?auto_458213 ?auto_458224 ) ) ( not ( = ?auto_458213 ?auto_458225 ) ) ( not ( = ?auto_458213 ?auto_458226 ) ) ( not ( = ?auto_458214 ?auto_458215 ) ) ( not ( = ?auto_458214 ?auto_458216 ) ) ( not ( = ?auto_458214 ?auto_458217 ) ) ( not ( = ?auto_458214 ?auto_458218 ) ) ( not ( = ?auto_458214 ?auto_458219 ) ) ( not ( = ?auto_458214 ?auto_458220 ) ) ( not ( = ?auto_458214 ?auto_458221 ) ) ( not ( = ?auto_458214 ?auto_458222 ) ) ( not ( = ?auto_458214 ?auto_458223 ) ) ( not ( = ?auto_458214 ?auto_458224 ) ) ( not ( = ?auto_458214 ?auto_458225 ) ) ( not ( = ?auto_458214 ?auto_458226 ) ) ( not ( = ?auto_458215 ?auto_458216 ) ) ( not ( = ?auto_458215 ?auto_458217 ) ) ( not ( = ?auto_458215 ?auto_458218 ) ) ( not ( = ?auto_458215 ?auto_458219 ) ) ( not ( = ?auto_458215 ?auto_458220 ) ) ( not ( = ?auto_458215 ?auto_458221 ) ) ( not ( = ?auto_458215 ?auto_458222 ) ) ( not ( = ?auto_458215 ?auto_458223 ) ) ( not ( = ?auto_458215 ?auto_458224 ) ) ( not ( = ?auto_458215 ?auto_458225 ) ) ( not ( = ?auto_458215 ?auto_458226 ) ) ( not ( = ?auto_458216 ?auto_458217 ) ) ( not ( = ?auto_458216 ?auto_458218 ) ) ( not ( = ?auto_458216 ?auto_458219 ) ) ( not ( = ?auto_458216 ?auto_458220 ) ) ( not ( = ?auto_458216 ?auto_458221 ) ) ( not ( = ?auto_458216 ?auto_458222 ) ) ( not ( = ?auto_458216 ?auto_458223 ) ) ( not ( = ?auto_458216 ?auto_458224 ) ) ( not ( = ?auto_458216 ?auto_458225 ) ) ( not ( = ?auto_458216 ?auto_458226 ) ) ( not ( = ?auto_458217 ?auto_458218 ) ) ( not ( = ?auto_458217 ?auto_458219 ) ) ( not ( = ?auto_458217 ?auto_458220 ) ) ( not ( = ?auto_458217 ?auto_458221 ) ) ( not ( = ?auto_458217 ?auto_458222 ) ) ( not ( = ?auto_458217 ?auto_458223 ) ) ( not ( = ?auto_458217 ?auto_458224 ) ) ( not ( = ?auto_458217 ?auto_458225 ) ) ( not ( = ?auto_458217 ?auto_458226 ) ) ( not ( = ?auto_458218 ?auto_458219 ) ) ( not ( = ?auto_458218 ?auto_458220 ) ) ( not ( = ?auto_458218 ?auto_458221 ) ) ( not ( = ?auto_458218 ?auto_458222 ) ) ( not ( = ?auto_458218 ?auto_458223 ) ) ( not ( = ?auto_458218 ?auto_458224 ) ) ( not ( = ?auto_458218 ?auto_458225 ) ) ( not ( = ?auto_458218 ?auto_458226 ) ) ( not ( = ?auto_458219 ?auto_458220 ) ) ( not ( = ?auto_458219 ?auto_458221 ) ) ( not ( = ?auto_458219 ?auto_458222 ) ) ( not ( = ?auto_458219 ?auto_458223 ) ) ( not ( = ?auto_458219 ?auto_458224 ) ) ( not ( = ?auto_458219 ?auto_458225 ) ) ( not ( = ?auto_458219 ?auto_458226 ) ) ( not ( = ?auto_458220 ?auto_458221 ) ) ( not ( = ?auto_458220 ?auto_458222 ) ) ( not ( = ?auto_458220 ?auto_458223 ) ) ( not ( = ?auto_458220 ?auto_458224 ) ) ( not ( = ?auto_458220 ?auto_458225 ) ) ( not ( = ?auto_458220 ?auto_458226 ) ) ( not ( = ?auto_458221 ?auto_458222 ) ) ( not ( = ?auto_458221 ?auto_458223 ) ) ( not ( = ?auto_458221 ?auto_458224 ) ) ( not ( = ?auto_458221 ?auto_458225 ) ) ( not ( = ?auto_458221 ?auto_458226 ) ) ( not ( = ?auto_458222 ?auto_458223 ) ) ( not ( = ?auto_458222 ?auto_458224 ) ) ( not ( = ?auto_458222 ?auto_458225 ) ) ( not ( = ?auto_458222 ?auto_458226 ) ) ( not ( = ?auto_458223 ?auto_458224 ) ) ( not ( = ?auto_458223 ?auto_458225 ) ) ( not ( = ?auto_458223 ?auto_458226 ) ) ( not ( = ?auto_458224 ?auto_458225 ) ) ( not ( = ?auto_458224 ?auto_458226 ) ) ( not ( = ?auto_458225 ?auto_458226 ) ) ( ON ?auto_458224 ?auto_458225 ) ( ON ?auto_458223 ?auto_458224 ) ( ON ?auto_458222 ?auto_458223 ) ( CLEAR ?auto_458220 ) ( ON ?auto_458221 ?auto_458222 ) ( CLEAR ?auto_458221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_458212 ?auto_458213 ?auto_458214 ?auto_458215 ?auto_458216 ?auto_458217 ?auto_458218 ?auto_458219 ?auto_458220 ?auto_458221 )
      ( MAKE-14PILE ?auto_458212 ?auto_458213 ?auto_458214 ?auto_458215 ?auto_458216 ?auto_458217 ?auto_458218 ?auto_458219 ?auto_458220 ?auto_458221 ?auto_458222 ?auto_458223 ?auto_458224 ?auto_458225 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_458270 - BLOCK
      ?auto_458271 - BLOCK
      ?auto_458272 - BLOCK
      ?auto_458273 - BLOCK
      ?auto_458274 - BLOCK
      ?auto_458275 - BLOCK
      ?auto_458276 - BLOCK
      ?auto_458277 - BLOCK
      ?auto_458278 - BLOCK
      ?auto_458279 - BLOCK
      ?auto_458280 - BLOCK
      ?auto_458281 - BLOCK
      ?auto_458282 - BLOCK
      ?auto_458283 - BLOCK
    )
    :vars
    (
      ?auto_458284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_458283 ?auto_458284 ) ( ON-TABLE ?auto_458270 ) ( ON ?auto_458271 ?auto_458270 ) ( ON ?auto_458272 ?auto_458271 ) ( ON ?auto_458273 ?auto_458272 ) ( ON ?auto_458274 ?auto_458273 ) ( ON ?auto_458275 ?auto_458274 ) ( ON ?auto_458276 ?auto_458275 ) ( ON ?auto_458277 ?auto_458276 ) ( not ( = ?auto_458270 ?auto_458271 ) ) ( not ( = ?auto_458270 ?auto_458272 ) ) ( not ( = ?auto_458270 ?auto_458273 ) ) ( not ( = ?auto_458270 ?auto_458274 ) ) ( not ( = ?auto_458270 ?auto_458275 ) ) ( not ( = ?auto_458270 ?auto_458276 ) ) ( not ( = ?auto_458270 ?auto_458277 ) ) ( not ( = ?auto_458270 ?auto_458278 ) ) ( not ( = ?auto_458270 ?auto_458279 ) ) ( not ( = ?auto_458270 ?auto_458280 ) ) ( not ( = ?auto_458270 ?auto_458281 ) ) ( not ( = ?auto_458270 ?auto_458282 ) ) ( not ( = ?auto_458270 ?auto_458283 ) ) ( not ( = ?auto_458270 ?auto_458284 ) ) ( not ( = ?auto_458271 ?auto_458272 ) ) ( not ( = ?auto_458271 ?auto_458273 ) ) ( not ( = ?auto_458271 ?auto_458274 ) ) ( not ( = ?auto_458271 ?auto_458275 ) ) ( not ( = ?auto_458271 ?auto_458276 ) ) ( not ( = ?auto_458271 ?auto_458277 ) ) ( not ( = ?auto_458271 ?auto_458278 ) ) ( not ( = ?auto_458271 ?auto_458279 ) ) ( not ( = ?auto_458271 ?auto_458280 ) ) ( not ( = ?auto_458271 ?auto_458281 ) ) ( not ( = ?auto_458271 ?auto_458282 ) ) ( not ( = ?auto_458271 ?auto_458283 ) ) ( not ( = ?auto_458271 ?auto_458284 ) ) ( not ( = ?auto_458272 ?auto_458273 ) ) ( not ( = ?auto_458272 ?auto_458274 ) ) ( not ( = ?auto_458272 ?auto_458275 ) ) ( not ( = ?auto_458272 ?auto_458276 ) ) ( not ( = ?auto_458272 ?auto_458277 ) ) ( not ( = ?auto_458272 ?auto_458278 ) ) ( not ( = ?auto_458272 ?auto_458279 ) ) ( not ( = ?auto_458272 ?auto_458280 ) ) ( not ( = ?auto_458272 ?auto_458281 ) ) ( not ( = ?auto_458272 ?auto_458282 ) ) ( not ( = ?auto_458272 ?auto_458283 ) ) ( not ( = ?auto_458272 ?auto_458284 ) ) ( not ( = ?auto_458273 ?auto_458274 ) ) ( not ( = ?auto_458273 ?auto_458275 ) ) ( not ( = ?auto_458273 ?auto_458276 ) ) ( not ( = ?auto_458273 ?auto_458277 ) ) ( not ( = ?auto_458273 ?auto_458278 ) ) ( not ( = ?auto_458273 ?auto_458279 ) ) ( not ( = ?auto_458273 ?auto_458280 ) ) ( not ( = ?auto_458273 ?auto_458281 ) ) ( not ( = ?auto_458273 ?auto_458282 ) ) ( not ( = ?auto_458273 ?auto_458283 ) ) ( not ( = ?auto_458273 ?auto_458284 ) ) ( not ( = ?auto_458274 ?auto_458275 ) ) ( not ( = ?auto_458274 ?auto_458276 ) ) ( not ( = ?auto_458274 ?auto_458277 ) ) ( not ( = ?auto_458274 ?auto_458278 ) ) ( not ( = ?auto_458274 ?auto_458279 ) ) ( not ( = ?auto_458274 ?auto_458280 ) ) ( not ( = ?auto_458274 ?auto_458281 ) ) ( not ( = ?auto_458274 ?auto_458282 ) ) ( not ( = ?auto_458274 ?auto_458283 ) ) ( not ( = ?auto_458274 ?auto_458284 ) ) ( not ( = ?auto_458275 ?auto_458276 ) ) ( not ( = ?auto_458275 ?auto_458277 ) ) ( not ( = ?auto_458275 ?auto_458278 ) ) ( not ( = ?auto_458275 ?auto_458279 ) ) ( not ( = ?auto_458275 ?auto_458280 ) ) ( not ( = ?auto_458275 ?auto_458281 ) ) ( not ( = ?auto_458275 ?auto_458282 ) ) ( not ( = ?auto_458275 ?auto_458283 ) ) ( not ( = ?auto_458275 ?auto_458284 ) ) ( not ( = ?auto_458276 ?auto_458277 ) ) ( not ( = ?auto_458276 ?auto_458278 ) ) ( not ( = ?auto_458276 ?auto_458279 ) ) ( not ( = ?auto_458276 ?auto_458280 ) ) ( not ( = ?auto_458276 ?auto_458281 ) ) ( not ( = ?auto_458276 ?auto_458282 ) ) ( not ( = ?auto_458276 ?auto_458283 ) ) ( not ( = ?auto_458276 ?auto_458284 ) ) ( not ( = ?auto_458277 ?auto_458278 ) ) ( not ( = ?auto_458277 ?auto_458279 ) ) ( not ( = ?auto_458277 ?auto_458280 ) ) ( not ( = ?auto_458277 ?auto_458281 ) ) ( not ( = ?auto_458277 ?auto_458282 ) ) ( not ( = ?auto_458277 ?auto_458283 ) ) ( not ( = ?auto_458277 ?auto_458284 ) ) ( not ( = ?auto_458278 ?auto_458279 ) ) ( not ( = ?auto_458278 ?auto_458280 ) ) ( not ( = ?auto_458278 ?auto_458281 ) ) ( not ( = ?auto_458278 ?auto_458282 ) ) ( not ( = ?auto_458278 ?auto_458283 ) ) ( not ( = ?auto_458278 ?auto_458284 ) ) ( not ( = ?auto_458279 ?auto_458280 ) ) ( not ( = ?auto_458279 ?auto_458281 ) ) ( not ( = ?auto_458279 ?auto_458282 ) ) ( not ( = ?auto_458279 ?auto_458283 ) ) ( not ( = ?auto_458279 ?auto_458284 ) ) ( not ( = ?auto_458280 ?auto_458281 ) ) ( not ( = ?auto_458280 ?auto_458282 ) ) ( not ( = ?auto_458280 ?auto_458283 ) ) ( not ( = ?auto_458280 ?auto_458284 ) ) ( not ( = ?auto_458281 ?auto_458282 ) ) ( not ( = ?auto_458281 ?auto_458283 ) ) ( not ( = ?auto_458281 ?auto_458284 ) ) ( not ( = ?auto_458282 ?auto_458283 ) ) ( not ( = ?auto_458282 ?auto_458284 ) ) ( not ( = ?auto_458283 ?auto_458284 ) ) ( ON ?auto_458282 ?auto_458283 ) ( ON ?auto_458281 ?auto_458282 ) ( ON ?auto_458280 ?auto_458281 ) ( ON ?auto_458279 ?auto_458280 ) ( CLEAR ?auto_458277 ) ( ON ?auto_458278 ?auto_458279 ) ( CLEAR ?auto_458278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_458270 ?auto_458271 ?auto_458272 ?auto_458273 ?auto_458274 ?auto_458275 ?auto_458276 ?auto_458277 ?auto_458278 )
      ( MAKE-14PILE ?auto_458270 ?auto_458271 ?auto_458272 ?auto_458273 ?auto_458274 ?auto_458275 ?auto_458276 ?auto_458277 ?auto_458278 ?auto_458279 ?auto_458280 ?auto_458281 ?auto_458282 ?auto_458283 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_458328 - BLOCK
      ?auto_458329 - BLOCK
      ?auto_458330 - BLOCK
      ?auto_458331 - BLOCK
      ?auto_458332 - BLOCK
      ?auto_458333 - BLOCK
      ?auto_458334 - BLOCK
      ?auto_458335 - BLOCK
      ?auto_458336 - BLOCK
      ?auto_458337 - BLOCK
      ?auto_458338 - BLOCK
      ?auto_458339 - BLOCK
      ?auto_458340 - BLOCK
      ?auto_458341 - BLOCK
    )
    :vars
    (
      ?auto_458342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_458341 ?auto_458342 ) ( ON-TABLE ?auto_458328 ) ( ON ?auto_458329 ?auto_458328 ) ( ON ?auto_458330 ?auto_458329 ) ( ON ?auto_458331 ?auto_458330 ) ( ON ?auto_458332 ?auto_458331 ) ( ON ?auto_458333 ?auto_458332 ) ( ON ?auto_458334 ?auto_458333 ) ( not ( = ?auto_458328 ?auto_458329 ) ) ( not ( = ?auto_458328 ?auto_458330 ) ) ( not ( = ?auto_458328 ?auto_458331 ) ) ( not ( = ?auto_458328 ?auto_458332 ) ) ( not ( = ?auto_458328 ?auto_458333 ) ) ( not ( = ?auto_458328 ?auto_458334 ) ) ( not ( = ?auto_458328 ?auto_458335 ) ) ( not ( = ?auto_458328 ?auto_458336 ) ) ( not ( = ?auto_458328 ?auto_458337 ) ) ( not ( = ?auto_458328 ?auto_458338 ) ) ( not ( = ?auto_458328 ?auto_458339 ) ) ( not ( = ?auto_458328 ?auto_458340 ) ) ( not ( = ?auto_458328 ?auto_458341 ) ) ( not ( = ?auto_458328 ?auto_458342 ) ) ( not ( = ?auto_458329 ?auto_458330 ) ) ( not ( = ?auto_458329 ?auto_458331 ) ) ( not ( = ?auto_458329 ?auto_458332 ) ) ( not ( = ?auto_458329 ?auto_458333 ) ) ( not ( = ?auto_458329 ?auto_458334 ) ) ( not ( = ?auto_458329 ?auto_458335 ) ) ( not ( = ?auto_458329 ?auto_458336 ) ) ( not ( = ?auto_458329 ?auto_458337 ) ) ( not ( = ?auto_458329 ?auto_458338 ) ) ( not ( = ?auto_458329 ?auto_458339 ) ) ( not ( = ?auto_458329 ?auto_458340 ) ) ( not ( = ?auto_458329 ?auto_458341 ) ) ( not ( = ?auto_458329 ?auto_458342 ) ) ( not ( = ?auto_458330 ?auto_458331 ) ) ( not ( = ?auto_458330 ?auto_458332 ) ) ( not ( = ?auto_458330 ?auto_458333 ) ) ( not ( = ?auto_458330 ?auto_458334 ) ) ( not ( = ?auto_458330 ?auto_458335 ) ) ( not ( = ?auto_458330 ?auto_458336 ) ) ( not ( = ?auto_458330 ?auto_458337 ) ) ( not ( = ?auto_458330 ?auto_458338 ) ) ( not ( = ?auto_458330 ?auto_458339 ) ) ( not ( = ?auto_458330 ?auto_458340 ) ) ( not ( = ?auto_458330 ?auto_458341 ) ) ( not ( = ?auto_458330 ?auto_458342 ) ) ( not ( = ?auto_458331 ?auto_458332 ) ) ( not ( = ?auto_458331 ?auto_458333 ) ) ( not ( = ?auto_458331 ?auto_458334 ) ) ( not ( = ?auto_458331 ?auto_458335 ) ) ( not ( = ?auto_458331 ?auto_458336 ) ) ( not ( = ?auto_458331 ?auto_458337 ) ) ( not ( = ?auto_458331 ?auto_458338 ) ) ( not ( = ?auto_458331 ?auto_458339 ) ) ( not ( = ?auto_458331 ?auto_458340 ) ) ( not ( = ?auto_458331 ?auto_458341 ) ) ( not ( = ?auto_458331 ?auto_458342 ) ) ( not ( = ?auto_458332 ?auto_458333 ) ) ( not ( = ?auto_458332 ?auto_458334 ) ) ( not ( = ?auto_458332 ?auto_458335 ) ) ( not ( = ?auto_458332 ?auto_458336 ) ) ( not ( = ?auto_458332 ?auto_458337 ) ) ( not ( = ?auto_458332 ?auto_458338 ) ) ( not ( = ?auto_458332 ?auto_458339 ) ) ( not ( = ?auto_458332 ?auto_458340 ) ) ( not ( = ?auto_458332 ?auto_458341 ) ) ( not ( = ?auto_458332 ?auto_458342 ) ) ( not ( = ?auto_458333 ?auto_458334 ) ) ( not ( = ?auto_458333 ?auto_458335 ) ) ( not ( = ?auto_458333 ?auto_458336 ) ) ( not ( = ?auto_458333 ?auto_458337 ) ) ( not ( = ?auto_458333 ?auto_458338 ) ) ( not ( = ?auto_458333 ?auto_458339 ) ) ( not ( = ?auto_458333 ?auto_458340 ) ) ( not ( = ?auto_458333 ?auto_458341 ) ) ( not ( = ?auto_458333 ?auto_458342 ) ) ( not ( = ?auto_458334 ?auto_458335 ) ) ( not ( = ?auto_458334 ?auto_458336 ) ) ( not ( = ?auto_458334 ?auto_458337 ) ) ( not ( = ?auto_458334 ?auto_458338 ) ) ( not ( = ?auto_458334 ?auto_458339 ) ) ( not ( = ?auto_458334 ?auto_458340 ) ) ( not ( = ?auto_458334 ?auto_458341 ) ) ( not ( = ?auto_458334 ?auto_458342 ) ) ( not ( = ?auto_458335 ?auto_458336 ) ) ( not ( = ?auto_458335 ?auto_458337 ) ) ( not ( = ?auto_458335 ?auto_458338 ) ) ( not ( = ?auto_458335 ?auto_458339 ) ) ( not ( = ?auto_458335 ?auto_458340 ) ) ( not ( = ?auto_458335 ?auto_458341 ) ) ( not ( = ?auto_458335 ?auto_458342 ) ) ( not ( = ?auto_458336 ?auto_458337 ) ) ( not ( = ?auto_458336 ?auto_458338 ) ) ( not ( = ?auto_458336 ?auto_458339 ) ) ( not ( = ?auto_458336 ?auto_458340 ) ) ( not ( = ?auto_458336 ?auto_458341 ) ) ( not ( = ?auto_458336 ?auto_458342 ) ) ( not ( = ?auto_458337 ?auto_458338 ) ) ( not ( = ?auto_458337 ?auto_458339 ) ) ( not ( = ?auto_458337 ?auto_458340 ) ) ( not ( = ?auto_458337 ?auto_458341 ) ) ( not ( = ?auto_458337 ?auto_458342 ) ) ( not ( = ?auto_458338 ?auto_458339 ) ) ( not ( = ?auto_458338 ?auto_458340 ) ) ( not ( = ?auto_458338 ?auto_458341 ) ) ( not ( = ?auto_458338 ?auto_458342 ) ) ( not ( = ?auto_458339 ?auto_458340 ) ) ( not ( = ?auto_458339 ?auto_458341 ) ) ( not ( = ?auto_458339 ?auto_458342 ) ) ( not ( = ?auto_458340 ?auto_458341 ) ) ( not ( = ?auto_458340 ?auto_458342 ) ) ( not ( = ?auto_458341 ?auto_458342 ) ) ( ON ?auto_458340 ?auto_458341 ) ( ON ?auto_458339 ?auto_458340 ) ( ON ?auto_458338 ?auto_458339 ) ( ON ?auto_458337 ?auto_458338 ) ( ON ?auto_458336 ?auto_458337 ) ( CLEAR ?auto_458334 ) ( ON ?auto_458335 ?auto_458336 ) ( CLEAR ?auto_458335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_458328 ?auto_458329 ?auto_458330 ?auto_458331 ?auto_458332 ?auto_458333 ?auto_458334 ?auto_458335 )
      ( MAKE-14PILE ?auto_458328 ?auto_458329 ?auto_458330 ?auto_458331 ?auto_458332 ?auto_458333 ?auto_458334 ?auto_458335 ?auto_458336 ?auto_458337 ?auto_458338 ?auto_458339 ?auto_458340 ?auto_458341 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_458386 - BLOCK
      ?auto_458387 - BLOCK
      ?auto_458388 - BLOCK
      ?auto_458389 - BLOCK
      ?auto_458390 - BLOCK
      ?auto_458391 - BLOCK
      ?auto_458392 - BLOCK
      ?auto_458393 - BLOCK
      ?auto_458394 - BLOCK
      ?auto_458395 - BLOCK
      ?auto_458396 - BLOCK
      ?auto_458397 - BLOCK
      ?auto_458398 - BLOCK
      ?auto_458399 - BLOCK
    )
    :vars
    (
      ?auto_458400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_458399 ?auto_458400 ) ( ON-TABLE ?auto_458386 ) ( ON ?auto_458387 ?auto_458386 ) ( ON ?auto_458388 ?auto_458387 ) ( ON ?auto_458389 ?auto_458388 ) ( ON ?auto_458390 ?auto_458389 ) ( ON ?auto_458391 ?auto_458390 ) ( not ( = ?auto_458386 ?auto_458387 ) ) ( not ( = ?auto_458386 ?auto_458388 ) ) ( not ( = ?auto_458386 ?auto_458389 ) ) ( not ( = ?auto_458386 ?auto_458390 ) ) ( not ( = ?auto_458386 ?auto_458391 ) ) ( not ( = ?auto_458386 ?auto_458392 ) ) ( not ( = ?auto_458386 ?auto_458393 ) ) ( not ( = ?auto_458386 ?auto_458394 ) ) ( not ( = ?auto_458386 ?auto_458395 ) ) ( not ( = ?auto_458386 ?auto_458396 ) ) ( not ( = ?auto_458386 ?auto_458397 ) ) ( not ( = ?auto_458386 ?auto_458398 ) ) ( not ( = ?auto_458386 ?auto_458399 ) ) ( not ( = ?auto_458386 ?auto_458400 ) ) ( not ( = ?auto_458387 ?auto_458388 ) ) ( not ( = ?auto_458387 ?auto_458389 ) ) ( not ( = ?auto_458387 ?auto_458390 ) ) ( not ( = ?auto_458387 ?auto_458391 ) ) ( not ( = ?auto_458387 ?auto_458392 ) ) ( not ( = ?auto_458387 ?auto_458393 ) ) ( not ( = ?auto_458387 ?auto_458394 ) ) ( not ( = ?auto_458387 ?auto_458395 ) ) ( not ( = ?auto_458387 ?auto_458396 ) ) ( not ( = ?auto_458387 ?auto_458397 ) ) ( not ( = ?auto_458387 ?auto_458398 ) ) ( not ( = ?auto_458387 ?auto_458399 ) ) ( not ( = ?auto_458387 ?auto_458400 ) ) ( not ( = ?auto_458388 ?auto_458389 ) ) ( not ( = ?auto_458388 ?auto_458390 ) ) ( not ( = ?auto_458388 ?auto_458391 ) ) ( not ( = ?auto_458388 ?auto_458392 ) ) ( not ( = ?auto_458388 ?auto_458393 ) ) ( not ( = ?auto_458388 ?auto_458394 ) ) ( not ( = ?auto_458388 ?auto_458395 ) ) ( not ( = ?auto_458388 ?auto_458396 ) ) ( not ( = ?auto_458388 ?auto_458397 ) ) ( not ( = ?auto_458388 ?auto_458398 ) ) ( not ( = ?auto_458388 ?auto_458399 ) ) ( not ( = ?auto_458388 ?auto_458400 ) ) ( not ( = ?auto_458389 ?auto_458390 ) ) ( not ( = ?auto_458389 ?auto_458391 ) ) ( not ( = ?auto_458389 ?auto_458392 ) ) ( not ( = ?auto_458389 ?auto_458393 ) ) ( not ( = ?auto_458389 ?auto_458394 ) ) ( not ( = ?auto_458389 ?auto_458395 ) ) ( not ( = ?auto_458389 ?auto_458396 ) ) ( not ( = ?auto_458389 ?auto_458397 ) ) ( not ( = ?auto_458389 ?auto_458398 ) ) ( not ( = ?auto_458389 ?auto_458399 ) ) ( not ( = ?auto_458389 ?auto_458400 ) ) ( not ( = ?auto_458390 ?auto_458391 ) ) ( not ( = ?auto_458390 ?auto_458392 ) ) ( not ( = ?auto_458390 ?auto_458393 ) ) ( not ( = ?auto_458390 ?auto_458394 ) ) ( not ( = ?auto_458390 ?auto_458395 ) ) ( not ( = ?auto_458390 ?auto_458396 ) ) ( not ( = ?auto_458390 ?auto_458397 ) ) ( not ( = ?auto_458390 ?auto_458398 ) ) ( not ( = ?auto_458390 ?auto_458399 ) ) ( not ( = ?auto_458390 ?auto_458400 ) ) ( not ( = ?auto_458391 ?auto_458392 ) ) ( not ( = ?auto_458391 ?auto_458393 ) ) ( not ( = ?auto_458391 ?auto_458394 ) ) ( not ( = ?auto_458391 ?auto_458395 ) ) ( not ( = ?auto_458391 ?auto_458396 ) ) ( not ( = ?auto_458391 ?auto_458397 ) ) ( not ( = ?auto_458391 ?auto_458398 ) ) ( not ( = ?auto_458391 ?auto_458399 ) ) ( not ( = ?auto_458391 ?auto_458400 ) ) ( not ( = ?auto_458392 ?auto_458393 ) ) ( not ( = ?auto_458392 ?auto_458394 ) ) ( not ( = ?auto_458392 ?auto_458395 ) ) ( not ( = ?auto_458392 ?auto_458396 ) ) ( not ( = ?auto_458392 ?auto_458397 ) ) ( not ( = ?auto_458392 ?auto_458398 ) ) ( not ( = ?auto_458392 ?auto_458399 ) ) ( not ( = ?auto_458392 ?auto_458400 ) ) ( not ( = ?auto_458393 ?auto_458394 ) ) ( not ( = ?auto_458393 ?auto_458395 ) ) ( not ( = ?auto_458393 ?auto_458396 ) ) ( not ( = ?auto_458393 ?auto_458397 ) ) ( not ( = ?auto_458393 ?auto_458398 ) ) ( not ( = ?auto_458393 ?auto_458399 ) ) ( not ( = ?auto_458393 ?auto_458400 ) ) ( not ( = ?auto_458394 ?auto_458395 ) ) ( not ( = ?auto_458394 ?auto_458396 ) ) ( not ( = ?auto_458394 ?auto_458397 ) ) ( not ( = ?auto_458394 ?auto_458398 ) ) ( not ( = ?auto_458394 ?auto_458399 ) ) ( not ( = ?auto_458394 ?auto_458400 ) ) ( not ( = ?auto_458395 ?auto_458396 ) ) ( not ( = ?auto_458395 ?auto_458397 ) ) ( not ( = ?auto_458395 ?auto_458398 ) ) ( not ( = ?auto_458395 ?auto_458399 ) ) ( not ( = ?auto_458395 ?auto_458400 ) ) ( not ( = ?auto_458396 ?auto_458397 ) ) ( not ( = ?auto_458396 ?auto_458398 ) ) ( not ( = ?auto_458396 ?auto_458399 ) ) ( not ( = ?auto_458396 ?auto_458400 ) ) ( not ( = ?auto_458397 ?auto_458398 ) ) ( not ( = ?auto_458397 ?auto_458399 ) ) ( not ( = ?auto_458397 ?auto_458400 ) ) ( not ( = ?auto_458398 ?auto_458399 ) ) ( not ( = ?auto_458398 ?auto_458400 ) ) ( not ( = ?auto_458399 ?auto_458400 ) ) ( ON ?auto_458398 ?auto_458399 ) ( ON ?auto_458397 ?auto_458398 ) ( ON ?auto_458396 ?auto_458397 ) ( ON ?auto_458395 ?auto_458396 ) ( ON ?auto_458394 ?auto_458395 ) ( ON ?auto_458393 ?auto_458394 ) ( CLEAR ?auto_458391 ) ( ON ?auto_458392 ?auto_458393 ) ( CLEAR ?auto_458392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_458386 ?auto_458387 ?auto_458388 ?auto_458389 ?auto_458390 ?auto_458391 ?auto_458392 )
      ( MAKE-14PILE ?auto_458386 ?auto_458387 ?auto_458388 ?auto_458389 ?auto_458390 ?auto_458391 ?auto_458392 ?auto_458393 ?auto_458394 ?auto_458395 ?auto_458396 ?auto_458397 ?auto_458398 ?auto_458399 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_458444 - BLOCK
      ?auto_458445 - BLOCK
      ?auto_458446 - BLOCK
      ?auto_458447 - BLOCK
      ?auto_458448 - BLOCK
      ?auto_458449 - BLOCK
      ?auto_458450 - BLOCK
      ?auto_458451 - BLOCK
      ?auto_458452 - BLOCK
      ?auto_458453 - BLOCK
      ?auto_458454 - BLOCK
      ?auto_458455 - BLOCK
      ?auto_458456 - BLOCK
      ?auto_458457 - BLOCK
    )
    :vars
    (
      ?auto_458458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_458457 ?auto_458458 ) ( ON-TABLE ?auto_458444 ) ( ON ?auto_458445 ?auto_458444 ) ( ON ?auto_458446 ?auto_458445 ) ( ON ?auto_458447 ?auto_458446 ) ( ON ?auto_458448 ?auto_458447 ) ( not ( = ?auto_458444 ?auto_458445 ) ) ( not ( = ?auto_458444 ?auto_458446 ) ) ( not ( = ?auto_458444 ?auto_458447 ) ) ( not ( = ?auto_458444 ?auto_458448 ) ) ( not ( = ?auto_458444 ?auto_458449 ) ) ( not ( = ?auto_458444 ?auto_458450 ) ) ( not ( = ?auto_458444 ?auto_458451 ) ) ( not ( = ?auto_458444 ?auto_458452 ) ) ( not ( = ?auto_458444 ?auto_458453 ) ) ( not ( = ?auto_458444 ?auto_458454 ) ) ( not ( = ?auto_458444 ?auto_458455 ) ) ( not ( = ?auto_458444 ?auto_458456 ) ) ( not ( = ?auto_458444 ?auto_458457 ) ) ( not ( = ?auto_458444 ?auto_458458 ) ) ( not ( = ?auto_458445 ?auto_458446 ) ) ( not ( = ?auto_458445 ?auto_458447 ) ) ( not ( = ?auto_458445 ?auto_458448 ) ) ( not ( = ?auto_458445 ?auto_458449 ) ) ( not ( = ?auto_458445 ?auto_458450 ) ) ( not ( = ?auto_458445 ?auto_458451 ) ) ( not ( = ?auto_458445 ?auto_458452 ) ) ( not ( = ?auto_458445 ?auto_458453 ) ) ( not ( = ?auto_458445 ?auto_458454 ) ) ( not ( = ?auto_458445 ?auto_458455 ) ) ( not ( = ?auto_458445 ?auto_458456 ) ) ( not ( = ?auto_458445 ?auto_458457 ) ) ( not ( = ?auto_458445 ?auto_458458 ) ) ( not ( = ?auto_458446 ?auto_458447 ) ) ( not ( = ?auto_458446 ?auto_458448 ) ) ( not ( = ?auto_458446 ?auto_458449 ) ) ( not ( = ?auto_458446 ?auto_458450 ) ) ( not ( = ?auto_458446 ?auto_458451 ) ) ( not ( = ?auto_458446 ?auto_458452 ) ) ( not ( = ?auto_458446 ?auto_458453 ) ) ( not ( = ?auto_458446 ?auto_458454 ) ) ( not ( = ?auto_458446 ?auto_458455 ) ) ( not ( = ?auto_458446 ?auto_458456 ) ) ( not ( = ?auto_458446 ?auto_458457 ) ) ( not ( = ?auto_458446 ?auto_458458 ) ) ( not ( = ?auto_458447 ?auto_458448 ) ) ( not ( = ?auto_458447 ?auto_458449 ) ) ( not ( = ?auto_458447 ?auto_458450 ) ) ( not ( = ?auto_458447 ?auto_458451 ) ) ( not ( = ?auto_458447 ?auto_458452 ) ) ( not ( = ?auto_458447 ?auto_458453 ) ) ( not ( = ?auto_458447 ?auto_458454 ) ) ( not ( = ?auto_458447 ?auto_458455 ) ) ( not ( = ?auto_458447 ?auto_458456 ) ) ( not ( = ?auto_458447 ?auto_458457 ) ) ( not ( = ?auto_458447 ?auto_458458 ) ) ( not ( = ?auto_458448 ?auto_458449 ) ) ( not ( = ?auto_458448 ?auto_458450 ) ) ( not ( = ?auto_458448 ?auto_458451 ) ) ( not ( = ?auto_458448 ?auto_458452 ) ) ( not ( = ?auto_458448 ?auto_458453 ) ) ( not ( = ?auto_458448 ?auto_458454 ) ) ( not ( = ?auto_458448 ?auto_458455 ) ) ( not ( = ?auto_458448 ?auto_458456 ) ) ( not ( = ?auto_458448 ?auto_458457 ) ) ( not ( = ?auto_458448 ?auto_458458 ) ) ( not ( = ?auto_458449 ?auto_458450 ) ) ( not ( = ?auto_458449 ?auto_458451 ) ) ( not ( = ?auto_458449 ?auto_458452 ) ) ( not ( = ?auto_458449 ?auto_458453 ) ) ( not ( = ?auto_458449 ?auto_458454 ) ) ( not ( = ?auto_458449 ?auto_458455 ) ) ( not ( = ?auto_458449 ?auto_458456 ) ) ( not ( = ?auto_458449 ?auto_458457 ) ) ( not ( = ?auto_458449 ?auto_458458 ) ) ( not ( = ?auto_458450 ?auto_458451 ) ) ( not ( = ?auto_458450 ?auto_458452 ) ) ( not ( = ?auto_458450 ?auto_458453 ) ) ( not ( = ?auto_458450 ?auto_458454 ) ) ( not ( = ?auto_458450 ?auto_458455 ) ) ( not ( = ?auto_458450 ?auto_458456 ) ) ( not ( = ?auto_458450 ?auto_458457 ) ) ( not ( = ?auto_458450 ?auto_458458 ) ) ( not ( = ?auto_458451 ?auto_458452 ) ) ( not ( = ?auto_458451 ?auto_458453 ) ) ( not ( = ?auto_458451 ?auto_458454 ) ) ( not ( = ?auto_458451 ?auto_458455 ) ) ( not ( = ?auto_458451 ?auto_458456 ) ) ( not ( = ?auto_458451 ?auto_458457 ) ) ( not ( = ?auto_458451 ?auto_458458 ) ) ( not ( = ?auto_458452 ?auto_458453 ) ) ( not ( = ?auto_458452 ?auto_458454 ) ) ( not ( = ?auto_458452 ?auto_458455 ) ) ( not ( = ?auto_458452 ?auto_458456 ) ) ( not ( = ?auto_458452 ?auto_458457 ) ) ( not ( = ?auto_458452 ?auto_458458 ) ) ( not ( = ?auto_458453 ?auto_458454 ) ) ( not ( = ?auto_458453 ?auto_458455 ) ) ( not ( = ?auto_458453 ?auto_458456 ) ) ( not ( = ?auto_458453 ?auto_458457 ) ) ( not ( = ?auto_458453 ?auto_458458 ) ) ( not ( = ?auto_458454 ?auto_458455 ) ) ( not ( = ?auto_458454 ?auto_458456 ) ) ( not ( = ?auto_458454 ?auto_458457 ) ) ( not ( = ?auto_458454 ?auto_458458 ) ) ( not ( = ?auto_458455 ?auto_458456 ) ) ( not ( = ?auto_458455 ?auto_458457 ) ) ( not ( = ?auto_458455 ?auto_458458 ) ) ( not ( = ?auto_458456 ?auto_458457 ) ) ( not ( = ?auto_458456 ?auto_458458 ) ) ( not ( = ?auto_458457 ?auto_458458 ) ) ( ON ?auto_458456 ?auto_458457 ) ( ON ?auto_458455 ?auto_458456 ) ( ON ?auto_458454 ?auto_458455 ) ( ON ?auto_458453 ?auto_458454 ) ( ON ?auto_458452 ?auto_458453 ) ( ON ?auto_458451 ?auto_458452 ) ( ON ?auto_458450 ?auto_458451 ) ( CLEAR ?auto_458448 ) ( ON ?auto_458449 ?auto_458450 ) ( CLEAR ?auto_458449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_458444 ?auto_458445 ?auto_458446 ?auto_458447 ?auto_458448 ?auto_458449 )
      ( MAKE-14PILE ?auto_458444 ?auto_458445 ?auto_458446 ?auto_458447 ?auto_458448 ?auto_458449 ?auto_458450 ?auto_458451 ?auto_458452 ?auto_458453 ?auto_458454 ?auto_458455 ?auto_458456 ?auto_458457 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_458502 - BLOCK
      ?auto_458503 - BLOCK
      ?auto_458504 - BLOCK
      ?auto_458505 - BLOCK
      ?auto_458506 - BLOCK
      ?auto_458507 - BLOCK
      ?auto_458508 - BLOCK
      ?auto_458509 - BLOCK
      ?auto_458510 - BLOCK
      ?auto_458511 - BLOCK
      ?auto_458512 - BLOCK
      ?auto_458513 - BLOCK
      ?auto_458514 - BLOCK
      ?auto_458515 - BLOCK
    )
    :vars
    (
      ?auto_458516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_458515 ?auto_458516 ) ( ON-TABLE ?auto_458502 ) ( ON ?auto_458503 ?auto_458502 ) ( ON ?auto_458504 ?auto_458503 ) ( ON ?auto_458505 ?auto_458504 ) ( not ( = ?auto_458502 ?auto_458503 ) ) ( not ( = ?auto_458502 ?auto_458504 ) ) ( not ( = ?auto_458502 ?auto_458505 ) ) ( not ( = ?auto_458502 ?auto_458506 ) ) ( not ( = ?auto_458502 ?auto_458507 ) ) ( not ( = ?auto_458502 ?auto_458508 ) ) ( not ( = ?auto_458502 ?auto_458509 ) ) ( not ( = ?auto_458502 ?auto_458510 ) ) ( not ( = ?auto_458502 ?auto_458511 ) ) ( not ( = ?auto_458502 ?auto_458512 ) ) ( not ( = ?auto_458502 ?auto_458513 ) ) ( not ( = ?auto_458502 ?auto_458514 ) ) ( not ( = ?auto_458502 ?auto_458515 ) ) ( not ( = ?auto_458502 ?auto_458516 ) ) ( not ( = ?auto_458503 ?auto_458504 ) ) ( not ( = ?auto_458503 ?auto_458505 ) ) ( not ( = ?auto_458503 ?auto_458506 ) ) ( not ( = ?auto_458503 ?auto_458507 ) ) ( not ( = ?auto_458503 ?auto_458508 ) ) ( not ( = ?auto_458503 ?auto_458509 ) ) ( not ( = ?auto_458503 ?auto_458510 ) ) ( not ( = ?auto_458503 ?auto_458511 ) ) ( not ( = ?auto_458503 ?auto_458512 ) ) ( not ( = ?auto_458503 ?auto_458513 ) ) ( not ( = ?auto_458503 ?auto_458514 ) ) ( not ( = ?auto_458503 ?auto_458515 ) ) ( not ( = ?auto_458503 ?auto_458516 ) ) ( not ( = ?auto_458504 ?auto_458505 ) ) ( not ( = ?auto_458504 ?auto_458506 ) ) ( not ( = ?auto_458504 ?auto_458507 ) ) ( not ( = ?auto_458504 ?auto_458508 ) ) ( not ( = ?auto_458504 ?auto_458509 ) ) ( not ( = ?auto_458504 ?auto_458510 ) ) ( not ( = ?auto_458504 ?auto_458511 ) ) ( not ( = ?auto_458504 ?auto_458512 ) ) ( not ( = ?auto_458504 ?auto_458513 ) ) ( not ( = ?auto_458504 ?auto_458514 ) ) ( not ( = ?auto_458504 ?auto_458515 ) ) ( not ( = ?auto_458504 ?auto_458516 ) ) ( not ( = ?auto_458505 ?auto_458506 ) ) ( not ( = ?auto_458505 ?auto_458507 ) ) ( not ( = ?auto_458505 ?auto_458508 ) ) ( not ( = ?auto_458505 ?auto_458509 ) ) ( not ( = ?auto_458505 ?auto_458510 ) ) ( not ( = ?auto_458505 ?auto_458511 ) ) ( not ( = ?auto_458505 ?auto_458512 ) ) ( not ( = ?auto_458505 ?auto_458513 ) ) ( not ( = ?auto_458505 ?auto_458514 ) ) ( not ( = ?auto_458505 ?auto_458515 ) ) ( not ( = ?auto_458505 ?auto_458516 ) ) ( not ( = ?auto_458506 ?auto_458507 ) ) ( not ( = ?auto_458506 ?auto_458508 ) ) ( not ( = ?auto_458506 ?auto_458509 ) ) ( not ( = ?auto_458506 ?auto_458510 ) ) ( not ( = ?auto_458506 ?auto_458511 ) ) ( not ( = ?auto_458506 ?auto_458512 ) ) ( not ( = ?auto_458506 ?auto_458513 ) ) ( not ( = ?auto_458506 ?auto_458514 ) ) ( not ( = ?auto_458506 ?auto_458515 ) ) ( not ( = ?auto_458506 ?auto_458516 ) ) ( not ( = ?auto_458507 ?auto_458508 ) ) ( not ( = ?auto_458507 ?auto_458509 ) ) ( not ( = ?auto_458507 ?auto_458510 ) ) ( not ( = ?auto_458507 ?auto_458511 ) ) ( not ( = ?auto_458507 ?auto_458512 ) ) ( not ( = ?auto_458507 ?auto_458513 ) ) ( not ( = ?auto_458507 ?auto_458514 ) ) ( not ( = ?auto_458507 ?auto_458515 ) ) ( not ( = ?auto_458507 ?auto_458516 ) ) ( not ( = ?auto_458508 ?auto_458509 ) ) ( not ( = ?auto_458508 ?auto_458510 ) ) ( not ( = ?auto_458508 ?auto_458511 ) ) ( not ( = ?auto_458508 ?auto_458512 ) ) ( not ( = ?auto_458508 ?auto_458513 ) ) ( not ( = ?auto_458508 ?auto_458514 ) ) ( not ( = ?auto_458508 ?auto_458515 ) ) ( not ( = ?auto_458508 ?auto_458516 ) ) ( not ( = ?auto_458509 ?auto_458510 ) ) ( not ( = ?auto_458509 ?auto_458511 ) ) ( not ( = ?auto_458509 ?auto_458512 ) ) ( not ( = ?auto_458509 ?auto_458513 ) ) ( not ( = ?auto_458509 ?auto_458514 ) ) ( not ( = ?auto_458509 ?auto_458515 ) ) ( not ( = ?auto_458509 ?auto_458516 ) ) ( not ( = ?auto_458510 ?auto_458511 ) ) ( not ( = ?auto_458510 ?auto_458512 ) ) ( not ( = ?auto_458510 ?auto_458513 ) ) ( not ( = ?auto_458510 ?auto_458514 ) ) ( not ( = ?auto_458510 ?auto_458515 ) ) ( not ( = ?auto_458510 ?auto_458516 ) ) ( not ( = ?auto_458511 ?auto_458512 ) ) ( not ( = ?auto_458511 ?auto_458513 ) ) ( not ( = ?auto_458511 ?auto_458514 ) ) ( not ( = ?auto_458511 ?auto_458515 ) ) ( not ( = ?auto_458511 ?auto_458516 ) ) ( not ( = ?auto_458512 ?auto_458513 ) ) ( not ( = ?auto_458512 ?auto_458514 ) ) ( not ( = ?auto_458512 ?auto_458515 ) ) ( not ( = ?auto_458512 ?auto_458516 ) ) ( not ( = ?auto_458513 ?auto_458514 ) ) ( not ( = ?auto_458513 ?auto_458515 ) ) ( not ( = ?auto_458513 ?auto_458516 ) ) ( not ( = ?auto_458514 ?auto_458515 ) ) ( not ( = ?auto_458514 ?auto_458516 ) ) ( not ( = ?auto_458515 ?auto_458516 ) ) ( ON ?auto_458514 ?auto_458515 ) ( ON ?auto_458513 ?auto_458514 ) ( ON ?auto_458512 ?auto_458513 ) ( ON ?auto_458511 ?auto_458512 ) ( ON ?auto_458510 ?auto_458511 ) ( ON ?auto_458509 ?auto_458510 ) ( ON ?auto_458508 ?auto_458509 ) ( ON ?auto_458507 ?auto_458508 ) ( CLEAR ?auto_458505 ) ( ON ?auto_458506 ?auto_458507 ) ( CLEAR ?auto_458506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_458502 ?auto_458503 ?auto_458504 ?auto_458505 ?auto_458506 )
      ( MAKE-14PILE ?auto_458502 ?auto_458503 ?auto_458504 ?auto_458505 ?auto_458506 ?auto_458507 ?auto_458508 ?auto_458509 ?auto_458510 ?auto_458511 ?auto_458512 ?auto_458513 ?auto_458514 ?auto_458515 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_458560 - BLOCK
      ?auto_458561 - BLOCK
      ?auto_458562 - BLOCK
      ?auto_458563 - BLOCK
      ?auto_458564 - BLOCK
      ?auto_458565 - BLOCK
      ?auto_458566 - BLOCK
      ?auto_458567 - BLOCK
      ?auto_458568 - BLOCK
      ?auto_458569 - BLOCK
      ?auto_458570 - BLOCK
      ?auto_458571 - BLOCK
      ?auto_458572 - BLOCK
      ?auto_458573 - BLOCK
    )
    :vars
    (
      ?auto_458574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_458573 ?auto_458574 ) ( ON-TABLE ?auto_458560 ) ( ON ?auto_458561 ?auto_458560 ) ( ON ?auto_458562 ?auto_458561 ) ( not ( = ?auto_458560 ?auto_458561 ) ) ( not ( = ?auto_458560 ?auto_458562 ) ) ( not ( = ?auto_458560 ?auto_458563 ) ) ( not ( = ?auto_458560 ?auto_458564 ) ) ( not ( = ?auto_458560 ?auto_458565 ) ) ( not ( = ?auto_458560 ?auto_458566 ) ) ( not ( = ?auto_458560 ?auto_458567 ) ) ( not ( = ?auto_458560 ?auto_458568 ) ) ( not ( = ?auto_458560 ?auto_458569 ) ) ( not ( = ?auto_458560 ?auto_458570 ) ) ( not ( = ?auto_458560 ?auto_458571 ) ) ( not ( = ?auto_458560 ?auto_458572 ) ) ( not ( = ?auto_458560 ?auto_458573 ) ) ( not ( = ?auto_458560 ?auto_458574 ) ) ( not ( = ?auto_458561 ?auto_458562 ) ) ( not ( = ?auto_458561 ?auto_458563 ) ) ( not ( = ?auto_458561 ?auto_458564 ) ) ( not ( = ?auto_458561 ?auto_458565 ) ) ( not ( = ?auto_458561 ?auto_458566 ) ) ( not ( = ?auto_458561 ?auto_458567 ) ) ( not ( = ?auto_458561 ?auto_458568 ) ) ( not ( = ?auto_458561 ?auto_458569 ) ) ( not ( = ?auto_458561 ?auto_458570 ) ) ( not ( = ?auto_458561 ?auto_458571 ) ) ( not ( = ?auto_458561 ?auto_458572 ) ) ( not ( = ?auto_458561 ?auto_458573 ) ) ( not ( = ?auto_458561 ?auto_458574 ) ) ( not ( = ?auto_458562 ?auto_458563 ) ) ( not ( = ?auto_458562 ?auto_458564 ) ) ( not ( = ?auto_458562 ?auto_458565 ) ) ( not ( = ?auto_458562 ?auto_458566 ) ) ( not ( = ?auto_458562 ?auto_458567 ) ) ( not ( = ?auto_458562 ?auto_458568 ) ) ( not ( = ?auto_458562 ?auto_458569 ) ) ( not ( = ?auto_458562 ?auto_458570 ) ) ( not ( = ?auto_458562 ?auto_458571 ) ) ( not ( = ?auto_458562 ?auto_458572 ) ) ( not ( = ?auto_458562 ?auto_458573 ) ) ( not ( = ?auto_458562 ?auto_458574 ) ) ( not ( = ?auto_458563 ?auto_458564 ) ) ( not ( = ?auto_458563 ?auto_458565 ) ) ( not ( = ?auto_458563 ?auto_458566 ) ) ( not ( = ?auto_458563 ?auto_458567 ) ) ( not ( = ?auto_458563 ?auto_458568 ) ) ( not ( = ?auto_458563 ?auto_458569 ) ) ( not ( = ?auto_458563 ?auto_458570 ) ) ( not ( = ?auto_458563 ?auto_458571 ) ) ( not ( = ?auto_458563 ?auto_458572 ) ) ( not ( = ?auto_458563 ?auto_458573 ) ) ( not ( = ?auto_458563 ?auto_458574 ) ) ( not ( = ?auto_458564 ?auto_458565 ) ) ( not ( = ?auto_458564 ?auto_458566 ) ) ( not ( = ?auto_458564 ?auto_458567 ) ) ( not ( = ?auto_458564 ?auto_458568 ) ) ( not ( = ?auto_458564 ?auto_458569 ) ) ( not ( = ?auto_458564 ?auto_458570 ) ) ( not ( = ?auto_458564 ?auto_458571 ) ) ( not ( = ?auto_458564 ?auto_458572 ) ) ( not ( = ?auto_458564 ?auto_458573 ) ) ( not ( = ?auto_458564 ?auto_458574 ) ) ( not ( = ?auto_458565 ?auto_458566 ) ) ( not ( = ?auto_458565 ?auto_458567 ) ) ( not ( = ?auto_458565 ?auto_458568 ) ) ( not ( = ?auto_458565 ?auto_458569 ) ) ( not ( = ?auto_458565 ?auto_458570 ) ) ( not ( = ?auto_458565 ?auto_458571 ) ) ( not ( = ?auto_458565 ?auto_458572 ) ) ( not ( = ?auto_458565 ?auto_458573 ) ) ( not ( = ?auto_458565 ?auto_458574 ) ) ( not ( = ?auto_458566 ?auto_458567 ) ) ( not ( = ?auto_458566 ?auto_458568 ) ) ( not ( = ?auto_458566 ?auto_458569 ) ) ( not ( = ?auto_458566 ?auto_458570 ) ) ( not ( = ?auto_458566 ?auto_458571 ) ) ( not ( = ?auto_458566 ?auto_458572 ) ) ( not ( = ?auto_458566 ?auto_458573 ) ) ( not ( = ?auto_458566 ?auto_458574 ) ) ( not ( = ?auto_458567 ?auto_458568 ) ) ( not ( = ?auto_458567 ?auto_458569 ) ) ( not ( = ?auto_458567 ?auto_458570 ) ) ( not ( = ?auto_458567 ?auto_458571 ) ) ( not ( = ?auto_458567 ?auto_458572 ) ) ( not ( = ?auto_458567 ?auto_458573 ) ) ( not ( = ?auto_458567 ?auto_458574 ) ) ( not ( = ?auto_458568 ?auto_458569 ) ) ( not ( = ?auto_458568 ?auto_458570 ) ) ( not ( = ?auto_458568 ?auto_458571 ) ) ( not ( = ?auto_458568 ?auto_458572 ) ) ( not ( = ?auto_458568 ?auto_458573 ) ) ( not ( = ?auto_458568 ?auto_458574 ) ) ( not ( = ?auto_458569 ?auto_458570 ) ) ( not ( = ?auto_458569 ?auto_458571 ) ) ( not ( = ?auto_458569 ?auto_458572 ) ) ( not ( = ?auto_458569 ?auto_458573 ) ) ( not ( = ?auto_458569 ?auto_458574 ) ) ( not ( = ?auto_458570 ?auto_458571 ) ) ( not ( = ?auto_458570 ?auto_458572 ) ) ( not ( = ?auto_458570 ?auto_458573 ) ) ( not ( = ?auto_458570 ?auto_458574 ) ) ( not ( = ?auto_458571 ?auto_458572 ) ) ( not ( = ?auto_458571 ?auto_458573 ) ) ( not ( = ?auto_458571 ?auto_458574 ) ) ( not ( = ?auto_458572 ?auto_458573 ) ) ( not ( = ?auto_458572 ?auto_458574 ) ) ( not ( = ?auto_458573 ?auto_458574 ) ) ( ON ?auto_458572 ?auto_458573 ) ( ON ?auto_458571 ?auto_458572 ) ( ON ?auto_458570 ?auto_458571 ) ( ON ?auto_458569 ?auto_458570 ) ( ON ?auto_458568 ?auto_458569 ) ( ON ?auto_458567 ?auto_458568 ) ( ON ?auto_458566 ?auto_458567 ) ( ON ?auto_458565 ?auto_458566 ) ( ON ?auto_458564 ?auto_458565 ) ( CLEAR ?auto_458562 ) ( ON ?auto_458563 ?auto_458564 ) ( CLEAR ?auto_458563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_458560 ?auto_458561 ?auto_458562 ?auto_458563 )
      ( MAKE-14PILE ?auto_458560 ?auto_458561 ?auto_458562 ?auto_458563 ?auto_458564 ?auto_458565 ?auto_458566 ?auto_458567 ?auto_458568 ?auto_458569 ?auto_458570 ?auto_458571 ?auto_458572 ?auto_458573 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_458618 - BLOCK
      ?auto_458619 - BLOCK
      ?auto_458620 - BLOCK
      ?auto_458621 - BLOCK
      ?auto_458622 - BLOCK
      ?auto_458623 - BLOCK
      ?auto_458624 - BLOCK
      ?auto_458625 - BLOCK
      ?auto_458626 - BLOCK
      ?auto_458627 - BLOCK
      ?auto_458628 - BLOCK
      ?auto_458629 - BLOCK
      ?auto_458630 - BLOCK
      ?auto_458631 - BLOCK
    )
    :vars
    (
      ?auto_458632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_458631 ?auto_458632 ) ( ON-TABLE ?auto_458618 ) ( ON ?auto_458619 ?auto_458618 ) ( not ( = ?auto_458618 ?auto_458619 ) ) ( not ( = ?auto_458618 ?auto_458620 ) ) ( not ( = ?auto_458618 ?auto_458621 ) ) ( not ( = ?auto_458618 ?auto_458622 ) ) ( not ( = ?auto_458618 ?auto_458623 ) ) ( not ( = ?auto_458618 ?auto_458624 ) ) ( not ( = ?auto_458618 ?auto_458625 ) ) ( not ( = ?auto_458618 ?auto_458626 ) ) ( not ( = ?auto_458618 ?auto_458627 ) ) ( not ( = ?auto_458618 ?auto_458628 ) ) ( not ( = ?auto_458618 ?auto_458629 ) ) ( not ( = ?auto_458618 ?auto_458630 ) ) ( not ( = ?auto_458618 ?auto_458631 ) ) ( not ( = ?auto_458618 ?auto_458632 ) ) ( not ( = ?auto_458619 ?auto_458620 ) ) ( not ( = ?auto_458619 ?auto_458621 ) ) ( not ( = ?auto_458619 ?auto_458622 ) ) ( not ( = ?auto_458619 ?auto_458623 ) ) ( not ( = ?auto_458619 ?auto_458624 ) ) ( not ( = ?auto_458619 ?auto_458625 ) ) ( not ( = ?auto_458619 ?auto_458626 ) ) ( not ( = ?auto_458619 ?auto_458627 ) ) ( not ( = ?auto_458619 ?auto_458628 ) ) ( not ( = ?auto_458619 ?auto_458629 ) ) ( not ( = ?auto_458619 ?auto_458630 ) ) ( not ( = ?auto_458619 ?auto_458631 ) ) ( not ( = ?auto_458619 ?auto_458632 ) ) ( not ( = ?auto_458620 ?auto_458621 ) ) ( not ( = ?auto_458620 ?auto_458622 ) ) ( not ( = ?auto_458620 ?auto_458623 ) ) ( not ( = ?auto_458620 ?auto_458624 ) ) ( not ( = ?auto_458620 ?auto_458625 ) ) ( not ( = ?auto_458620 ?auto_458626 ) ) ( not ( = ?auto_458620 ?auto_458627 ) ) ( not ( = ?auto_458620 ?auto_458628 ) ) ( not ( = ?auto_458620 ?auto_458629 ) ) ( not ( = ?auto_458620 ?auto_458630 ) ) ( not ( = ?auto_458620 ?auto_458631 ) ) ( not ( = ?auto_458620 ?auto_458632 ) ) ( not ( = ?auto_458621 ?auto_458622 ) ) ( not ( = ?auto_458621 ?auto_458623 ) ) ( not ( = ?auto_458621 ?auto_458624 ) ) ( not ( = ?auto_458621 ?auto_458625 ) ) ( not ( = ?auto_458621 ?auto_458626 ) ) ( not ( = ?auto_458621 ?auto_458627 ) ) ( not ( = ?auto_458621 ?auto_458628 ) ) ( not ( = ?auto_458621 ?auto_458629 ) ) ( not ( = ?auto_458621 ?auto_458630 ) ) ( not ( = ?auto_458621 ?auto_458631 ) ) ( not ( = ?auto_458621 ?auto_458632 ) ) ( not ( = ?auto_458622 ?auto_458623 ) ) ( not ( = ?auto_458622 ?auto_458624 ) ) ( not ( = ?auto_458622 ?auto_458625 ) ) ( not ( = ?auto_458622 ?auto_458626 ) ) ( not ( = ?auto_458622 ?auto_458627 ) ) ( not ( = ?auto_458622 ?auto_458628 ) ) ( not ( = ?auto_458622 ?auto_458629 ) ) ( not ( = ?auto_458622 ?auto_458630 ) ) ( not ( = ?auto_458622 ?auto_458631 ) ) ( not ( = ?auto_458622 ?auto_458632 ) ) ( not ( = ?auto_458623 ?auto_458624 ) ) ( not ( = ?auto_458623 ?auto_458625 ) ) ( not ( = ?auto_458623 ?auto_458626 ) ) ( not ( = ?auto_458623 ?auto_458627 ) ) ( not ( = ?auto_458623 ?auto_458628 ) ) ( not ( = ?auto_458623 ?auto_458629 ) ) ( not ( = ?auto_458623 ?auto_458630 ) ) ( not ( = ?auto_458623 ?auto_458631 ) ) ( not ( = ?auto_458623 ?auto_458632 ) ) ( not ( = ?auto_458624 ?auto_458625 ) ) ( not ( = ?auto_458624 ?auto_458626 ) ) ( not ( = ?auto_458624 ?auto_458627 ) ) ( not ( = ?auto_458624 ?auto_458628 ) ) ( not ( = ?auto_458624 ?auto_458629 ) ) ( not ( = ?auto_458624 ?auto_458630 ) ) ( not ( = ?auto_458624 ?auto_458631 ) ) ( not ( = ?auto_458624 ?auto_458632 ) ) ( not ( = ?auto_458625 ?auto_458626 ) ) ( not ( = ?auto_458625 ?auto_458627 ) ) ( not ( = ?auto_458625 ?auto_458628 ) ) ( not ( = ?auto_458625 ?auto_458629 ) ) ( not ( = ?auto_458625 ?auto_458630 ) ) ( not ( = ?auto_458625 ?auto_458631 ) ) ( not ( = ?auto_458625 ?auto_458632 ) ) ( not ( = ?auto_458626 ?auto_458627 ) ) ( not ( = ?auto_458626 ?auto_458628 ) ) ( not ( = ?auto_458626 ?auto_458629 ) ) ( not ( = ?auto_458626 ?auto_458630 ) ) ( not ( = ?auto_458626 ?auto_458631 ) ) ( not ( = ?auto_458626 ?auto_458632 ) ) ( not ( = ?auto_458627 ?auto_458628 ) ) ( not ( = ?auto_458627 ?auto_458629 ) ) ( not ( = ?auto_458627 ?auto_458630 ) ) ( not ( = ?auto_458627 ?auto_458631 ) ) ( not ( = ?auto_458627 ?auto_458632 ) ) ( not ( = ?auto_458628 ?auto_458629 ) ) ( not ( = ?auto_458628 ?auto_458630 ) ) ( not ( = ?auto_458628 ?auto_458631 ) ) ( not ( = ?auto_458628 ?auto_458632 ) ) ( not ( = ?auto_458629 ?auto_458630 ) ) ( not ( = ?auto_458629 ?auto_458631 ) ) ( not ( = ?auto_458629 ?auto_458632 ) ) ( not ( = ?auto_458630 ?auto_458631 ) ) ( not ( = ?auto_458630 ?auto_458632 ) ) ( not ( = ?auto_458631 ?auto_458632 ) ) ( ON ?auto_458630 ?auto_458631 ) ( ON ?auto_458629 ?auto_458630 ) ( ON ?auto_458628 ?auto_458629 ) ( ON ?auto_458627 ?auto_458628 ) ( ON ?auto_458626 ?auto_458627 ) ( ON ?auto_458625 ?auto_458626 ) ( ON ?auto_458624 ?auto_458625 ) ( ON ?auto_458623 ?auto_458624 ) ( ON ?auto_458622 ?auto_458623 ) ( ON ?auto_458621 ?auto_458622 ) ( CLEAR ?auto_458619 ) ( ON ?auto_458620 ?auto_458621 ) ( CLEAR ?auto_458620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_458618 ?auto_458619 ?auto_458620 )
      ( MAKE-14PILE ?auto_458618 ?auto_458619 ?auto_458620 ?auto_458621 ?auto_458622 ?auto_458623 ?auto_458624 ?auto_458625 ?auto_458626 ?auto_458627 ?auto_458628 ?auto_458629 ?auto_458630 ?auto_458631 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_458676 - BLOCK
      ?auto_458677 - BLOCK
      ?auto_458678 - BLOCK
      ?auto_458679 - BLOCK
      ?auto_458680 - BLOCK
      ?auto_458681 - BLOCK
      ?auto_458682 - BLOCK
      ?auto_458683 - BLOCK
      ?auto_458684 - BLOCK
      ?auto_458685 - BLOCK
      ?auto_458686 - BLOCK
      ?auto_458687 - BLOCK
      ?auto_458688 - BLOCK
      ?auto_458689 - BLOCK
    )
    :vars
    (
      ?auto_458690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_458689 ?auto_458690 ) ( ON-TABLE ?auto_458676 ) ( not ( = ?auto_458676 ?auto_458677 ) ) ( not ( = ?auto_458676 ?auto_458678 ) ) ( not ( = ?auto_458676 ?auto_458679 ) ) ( not ( = ?auto_458676 ?auto_458680 ) ) ( not ( = ?auto_458676 ?auto_458681 ) ) ( not ( = ?auto_458676 ?auto_458682 ) ) ( not ( = ?auto_458676 ?auto_458683 ) ) ( not ( = ?auto_458676 ?auto_458684 ) ) ( not ( = ?auto_458676 ?auto_458685 ) ) ( not ( = ?auto_458676 ?auto_458686 ) ) ( not ( = ?auto_458676 ?auto_458687 ) ) ( not ( = ?auto_458676 ?auto_458688 ) ) ( not ( = ?auto_458676 ?auto_458689 ) ) ( not ( = ?auto_458676 ?auto_458690 ) ) ( not ( = ?auto_458677 ?auto_458678 ) ) ( not ( = ?auto_458677 ?auto_458679 ) ) ( not ( = ?auto_458677 ?auto_458680 ) ) ( not ( = ?auto_458677 ?auto_458681 ) ) ( not ( = ?auto_458677 ?auto_458682 ) ) ( not ( = ?auto_458677 ?auto_458683 ) ) ( not ( = ?auto_458677 ?auto_458684 ) ) ( not ( = ?auto_458677 ?auto_458685 ) ) ( not ( = ?auto_458677 ?auto_458686 ) ) ( not ( = ?auto_458677 ?auto_458687 ) ) ( not ( = ?auto_458677 ?auto_458688 ) ) ( not ( = ?auto_458677 ?auto_458689 ) ) ( not ( = ?auto_458677 ?auto_458690 ) ) ( not ( = ?auto_458678 ?auto_458679 ) ) ( not ( = ?auto_458678 ?auto_458680 ) ) ( not ( = ?auto_458678 ?auto_458681 ) ) ( not ( = ?auto_458678 ?auto_458682 ) ) ( not ( = ?auto_458678 ?auto_458683 ) ) ( not ( = ?auto_458678 ?auto_458684 ) ) ( not ( = ?auto_458678 ?auto_458685 ) ) ( not ( = ?auto_458678 ?auto_458686 ) ) ( not ( = ?auto_458678 ?auto_458687 ) ) ( not ( = ?auto_458678 ?auto_458688 ) ) ( not ( = ?auto_458678 ?auto_458689 ) ) ( not ( = ?auto_458678 ?auto_458690 ) ) ( not ( = ?auto_458679 ?auto_458680 ) ) ( not ( = ?auto_458679 ?auto_458681 ) ) ( not ( = ?auto_458679 ?auto_458682 ) ) ( not ( = ?auto_458679 ?auto_458683 ) ) ( not ( = ?auto_458679 ?auto_458684 ) ) ( not ( = ?auto_458679 ?auto_458685 ) ) ( not ( = ?auto_458679 ?auto_458686 ) ) ( not ( = ?auto_458679 ?auto_458687 ) ) ( not ( = ?auto_458679 ?auto_458688 ) ) ( not ( = ?auto_458679 ?auto_458689 ) ) ( not ( = ?auto_458679 ?auto_458690 ) ) ( not ( = ?auto_458680 ?auto_458681 ) ) ( not ( = ?auto_458680 ?auto_458682 ) ) ( not ( = ?auto_458680 ?auto_458683 ) ) ( not ( = ?auto_458680 ?auto_458684 ) ) ( not ( = ?auto_458680 ?auto_458685 ) ) ( not ( = ?auto_458680 ?auto_458686 ) ) ( not ( = ?auto_458680 ?auto_458687 ) ) ( not ( = ?auto_458680 ?auto_458688 ) ) ( not ( = ?auto_458680 ?auto_458689 ) ) ( not ( = ?auto_458680 ?auto_458690 ) ) ( not ( = ?auto_458681 ?auto_458682 ) ) ( not ( = ?auto_458681 ?auto_458683 ) ) ( not ( = ?auto_458681 ?auto_458684 ) ) ( not ( = ?auto_458681 ?auto_458685 ) ) ( not ( = ?auto_458681 ?auto_458686 ) ) ( not ( = ?auto_458681 ?auto_458687 ) ) ( not ( = ?auto_458681 ?auto_458688 ) ) ( not ( = ?auto_458681 ?auto_458689 ) ) ( not ( = ?auto_458681 ?auto_458690 ) ) ( not ( = ?auto_458682 ?auto_458683 ) ) ( not ( = ?auto_458682 ?auto_458684 ) ) ( not ( = ?auto_458682 ?auto_458685 ) ) ( not ( = ?auto_458682 ?auto_458686 ) ) ( not ( = ?auto_458682 ?auto_458687 ) ) ( not ( = ?auto_458682 ?auto_458688 ) ) ( not ( = ?auto_458682 ?auto_458689 ) ) ( not ( = ?auto_458682 ?auto_458690 ) ) ( not ( = ?auto_458683 ?auto_458684 ) ) ( not ( = ?auto_458683 ?auto_458685 ) ) ( not ( = ?auto_458683 ?auto_458686 ) ) ( not ( = ?auto_458683 ?auto_458687 ) ) ( not ( = ?auto_458683 ?auto_458688 ) ) ( not ( = ?auto_458683 ?auto_458689 ) ) ( not ( = ?auto_458683 ?auto_458690 ) ) ( not ( = ?auto_458684 ?auto_458685 ) ) ( not ( = ?auto_458684 ?auto_458686 ) ) ( not ( = ?auto_458684 ?auto_458687 ) ) ( not ( = ?auto_458684 ?auto_458688 ) ) ( not ( = ?auto_458684 ?auto_458689 ) ) ( not ( = ?auto_458684 ?auto_458690 ) ) ( not ( = ?auto_458685 ?auto_458686 ) ) ( not ( = ?auto_458685 ?auto_458687 ) ) ( not ( = ?auto_458685 ?auto_458688 ) ) ( not ( = ?auto_458685 ?auto_458689 ) ) ( not ( = ?auto_458685 ?auto_458690 ) ) ( not ( = ?auto_458686 ?auto_458687 ) ) ( not ( = ?auto_458686 ?auto_458688 ) ) ( not ( = ?auto_458686 ?auto_458689 ) ) ( not ( = ?auto_458686 ?auto_458690 ) ) ( not ( = ?auto_458687 ?auto_458688 ) ) ( not ( = ?auto_458687 ?auto_458689 ) ) ( not ( = ?auto_458687 ?auto_458690 ) ) ( not ( = ?auto_458688 ?auto_458689 ) ) ( not ( = ?auto_458688 ?auto_458690 ) ) ( not ( = ?auto_458689 ?auto_458690 ) ) ( ON ?auto_458688 ?auto_458689 ) ( ON ?auto_458687 ?auto_458688 ) ( ON ?auto_458686 ?auto_458687 ) ( ON ?auto_458685 ?auto_458686 ) ( ON ?auto_458684 ?auto_458685 ) ( ON ?auto_458683 ?auto_458684 ) ( ON ?auto_458682 ?auto_458683 ) ( ON ?auto_458681 ?auto_458682 ) ( ON ?auto_458680 ?auto_458681 ) ( ON ?auto_458679 ?auto_458680 ) ( ON ?auto_458678 ?auto_458679 ) ( CLEAR ?auto_458676 ) ( ON ?auto_458677 ?auto_458678 ) ( CLEAR ?auto_458677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_458676 ?auto_458677 )
      ( MAKE-14PILE ?auto_458676 ?auto_458677 ?auto_458678 ?auto_458679 ?auto_458680 ?auto_458681 ?auto_458682 ?auto_458683 ?auto_458684 ?auto_458685 ?auto_458686 ?auto_458687 ?auto_458688 ?auto_458689 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_458734 - BLOCK
      ?auto_458735 - BLOCK
      ?auto_458736 - BLOCK
      ?auto_458737 - BLOCK
      ?auto_458738 - BLOCK
      ?auto_458739 - BLOCK
      ?auto_458740 - BLOCK
      ?auto_458741 - BLOCK
      ?auto_458742 - BLOCK
      ?auto_458743 - BLOCK
      ?auto_458744 - BLOCK
      ?auto_458745 - BLOCK
      ?auto_458746 - BLOCK
      ?auto_458747 - BLOCK
    )
    :vars
    (
      ?auto_458748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_458747 ?auto_458748 ) ( not ( = ?auto_458734 ?auto_458735 ) ) ( not ( = ?auto_458734 ?auto_458736 ) ) ( not ( = ?auto_458734 ?auto_458737 ) ) ( not ( = ?auto_458734 ?auto_458738 ) ) ( not ( = ?auto_458734 ?auto_458739 ) ) ( not ( = ?auto_458734 ?auto_458740 ) ) ( not ( = ?auto_458734 ?auto_458741 ) ) ( not ( = ?auto_458734 ?auto_458742 ) ) ( not ( = ?auto_458734 ?auto_458743 ) ) ( not ( = ?auto_458734 ?auto_458744 ) ) ( not ( = ?auto_458734 ?auto_458745 ) ) ( not ( = ?auto_458734 ?auto_458746 ) ) ( not ( = ?auto_458734 ?auto_458747 ) ) ( not ( = ?auto_458734 ?auto_458748 ) ) ( not ( = ?auto_458735 ?auto_458736 ) ) ( not ( = ?auto_458735 ?auto_458737 ) ) ( not ( = ?auto_458735 ?auto_458738 ) ) ( not ( = ?auto_458735 ?auto_458739 ) ) ( not ( = ?auto_458735 ?auto_458740 ) ) ( not ( = ?auto_458735 ?auto_458741 ) ) ( not ( = ?auto_458735 ?auto_458742 ) ) ( not ( = ?auto_458735 ?auto_458743 ) ) ( not ( = ?auto_458735 ?auto_458744 ) ) ( not ( = ?auto_458735 ?auto_458745 ) ) ( not ( = ?auto_458735 ?auto_458746 ) ) ( not ( = ?auto_458735 ?auto_458747 ) ) ( not ( = ?auto_458735 ?auto_458748 ) ) ( not ( = ?auto_458736 ?auto_458737 ) ) ( not ( = ?auto_458736 ?auto_458738 ) ) ( not ( = ?auto_458736 ?auto_458739 ) ) ( not ( = ?auto_458736 ?auto_458740 ) ) ( not ( = ?auto_458736 ?auto_458741 ) ) ( not ( = ?auto_458736 ?auto_458742 ) ) ( not ( = ?auto_458736 ?auto_458743 ) ) ( not ( = ?auto_458736 ?auto_458744 ) ) ( not ( = ?auto_458736 ?auto_458745 ) ) ( not ( = ?auto_458736 ?auto_458746 ) ) ( not ( = ?auto_458736 ?auto_458747 ) ) ( not ( = ?auto_458736 ?auto_458748 ) ) ( not ( = ?auto_458737 ?auto_458738 ) ) ( not ( = ?auto_458737 ?auto_458739 ) ) ( not ( = ?auto_458737 ?auto_458740 ) ) ( not ( = ?auto_458737 ?auto_458741 ) ) ( not ( = ?auto_458737 ?auto_458742 ) ) ( not ( = ?auto_458737 ?auto_458743 ) ) ( not ( = ?auto_458737 ?auto_458744 ) ) ( not ( = ?auto_458737 ?auto_458745 ) ) ( not ( = ?auto_458737 ?auto_458746 ) ) ( not ( = ?auto_458737 ?auto_458747 ) ) ( not ( = ?auto_458737 ?auto_458748 ) ) ( not ( = ?auto_458738 ?auto_458739 ) ) ( not ( = ?auto_458738 ?auto_458740 ) ) ( not ( = ?auto_458738 ?auto_458741 ) ) ( not ( = ?auto_458738 ?auto_458742 ) ) ( not ( = ?auto_458738 ?auto_458743 ) ) ( not ( = ?auto_458738 ?auto_458744 ) ) ( not ( = ?auto_458738 ?auto_458745 ) ) ( not ( = ?auto_458738 ?auto_458746 ) ) ( not ( = ?auto_458738 ?auto_458747 ) ) ( not ( = ?auto_458738 ?auto_458748 ) ) ( not ( = ?auto_458739 ?auto_458740 ) ) ( not ( = ?auto_458739 ?auto_458741 ) ) ( not ( = ?auto_458739 ?auto_458742 ) ) ( not ( = ?auto_458739 ?auto_458743 ) ) ( not ( = ?auto_458739 ?auto_458744 ) ) ( not ( = ?auto_458739 ?auto_458745 ) ) ( not ( = ?auto_458739 ?auto_458746 ) ) ( not ( = ?auto_458739 ?auto_458747 ) ) ( not ( = ?auto_458739 ?auto_458748 ) ) ( not ( = ?auto_458740 ?auto_458741 ) ) ( not ( = ?auto_458740 ?auto_458742 ) ) ( not ( = ?auto_458740 ?auto_458743 ) ) ( not ( = ?auto_458740 ?auto_458744 ) ) ( not ( = ?auto_458740 ?auto_458745 ) ) ( not ( = ?auto_458740 ?auto_458746 ) ) ( not ( = ?auto_458740 ?auto_458747 ) ) ( not ( = ?auto_458740 ?auto_458748 ) ) ( not ( = ?auto_458741 ?auto_458742 ) ) ( not ( = ?auto_458741 ?auto_458743 ) ) ( not ( = ?auto_458741 ?auto_458744 ) ) ( not ( = ?auto_458741 ?auto_458745 ) ) ( not ( = ?auto_458741 ?auto_458746 ) ) ( not ( = ?auto_458741 ?auto_458747 ) ) ( not ( = ?auto_458741 ?auto_458748 ) ) ( not ( = ?auto_458742 ?auto_458743 ) ) ( not ( = ?auto_458742 ?auto_458744 ) ) ( not ( = ?auto_458742 ?auto_458745 ) ) ( not ( = ?auto_458742 ?auto_458746 ) ) ( not ( = ?auto_458742 ?auto_458747 ) ) ( not ( = ?auto_458742 ?auto_458748 ) ) ( not ( = ?auto_458743 ?auto_458744 ) ) ( not ( = ?auto_458743 ?auto_458745 ) ) ( not ( = ?auto_458743 ?auto_458746 ) ) ( not ( = ?auto_458743 ?auto_458747 ) ) ( not ( = ?auto_458743 ?auto_458748 ) ) ( not ( = ?auto_458744 ?auto_458745 ) ) ( not ( = ?auto_458744 ?auto_458746 ) ) ( not ( = ?auto_458744 ?auto_458747 ) ) ( not ( = ?auto_458744 ?auto_458748 ) ) ( not ( = ?auto_458745 ?auto_458746 ) ) ( not ( = ?auto_458745 ?auto_458747 ) ) ( not ( = ?auto_458745 ?auto_458748 ) ) ( not ( = ?auto_458746 ?auto_458747 ) ) ( not ( = ?auto_458746 ?auto_458748 ) ) ( not ( = ?auto_458747 ?auto_458748 ) ) ( ON ?auto_458746 ?auto_458747 ) ( ON ?auto_458745 ?auto_458746 ) ( ON ?auto_458744 ?auto_458745 ) ( ON ?auto_458743 ?auto_458744 ) ( ON ?auto_458742 ?auto_458743 ) ( ON ?auto_458741 ?auto_458742 ) ( ON ?auto_458740 ?auto_458741 ) ( ON ?auto_458739 ?auto_458740 ) ( ON ?auto_458738 ?auto_458739 ) ( ON ?auto_458737 ?auto_458738 ) ( ON ?auto_458736 ?auto_458737 ) ( ON ?auto_458735 ?auto_458736 ) ( ON ?auto_458734 ?auto_458735 ) ( CLEAR ?auto_458734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_458734 )
      ( MAKE-14PILE ?auto_458734 ?auto_458735 ?auto_458736 ?auto_458737 ?auto_458738 ?auto_458739 ?auto_458740 ?auto_458741 ?auto_458742 ?auto_458743 ?auto_458744 ?auto_458745 ?auto_458746 ?auto_458747 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_458793 - BLOCK
      ?auto_458794 - BLOCK
      ?auto_458795 - BLOCK
      ?auto_458796 - BLOCK
      ?auto_458797 - BLOCK
      ?auto_458798 - BLOCK
      ?auto_458799 - BLOCK
      ?auto_458800 - BLOCK
      ?auto_458801 - BLOCK
      ?auto_458802 - BLOCK
      ?auto_458803 - BLOCK
      ?auto_458804 - BLOCK
      ?auto_458805 - BLOCK
      ?auto_458806 - BLOCK
      ?auto_458807 - BLOCK
    )
    :vars
    (
      ?auto_458808 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_458806 ) ( ON ?auto_458807 ?auto_458808 ) ( CLEAR ?auto_458807 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_458793 ) ( ON ?auto_458794 ?auto_458793 ) ( ON ?auto_458795 ?auto_458794 ) ( ON ?auto_458796 ?auto_458795 ) ( ON ?auto_458797 ?auto_458796 ) ( ON ?auto_458798 ?auto_458797 ) ( ON ?auto_458799 ?auto_458798 ) ( ON ?auto_458800 ?auto_458799 ) ( ON ?auto_458801 ?auto_458800 ) ( ON ?auto_458802 ?auto_458801 ) ( ON ?auto_458803 ?auto_458802 ) ( ON ?auto_458804 ?auto_458803 ) ( ON ?auto_458805 ?auto_458804 ) ( ON ?auto_458806 ?auto_458805 ) ( not ( = ?auto_458793 ?auto_458794 ) ) ( not ( = ?auto_458793 ?auto_458795 ) ) ( not ( = ?auto_458793 ?auto_458796 ) ) ( not ( = ?auto_458793 ?auto_458797 ) ) ( not ( = ?auto_458793 ?auto_458798 ) ) ( not ( = ?auto_458793 ?auto_458799 ) ) ( not ( = ?auto_458793 ?auto_458800 ) ) ( not ( = ?auto_458793 ?auto_458801 ) ) ( not ( = ?auto_458793 ?auto_458802 ) ) ( not ( = ?auto_458793 ?auto_458803 ) ) ( not ( = ?auto_458793 ?auto_458804 ) ) ( not ( = ?auto_458793 ?auto_458805 ) ) ( not ( = ?auto_458793 ?auto_458806 ) ) ( not ( = ?auto_458793 ?auto_458807 ) ) ( not ( = ?auto_458793 ?auto_458808 ) ) ( not ( = ?auto_458794 ?auto_458795 ) ) ( not ( = ?auto_458794 ?auto_458796 ) ) ( not ( = ?auto_458794 ?auto_458797 ) ) ( not ( = ?auto_458794 ?auto_458798 ) ) ( not ( = ?auto_458794 ?auto_458799 ) ) ( not ( = ?auto_458794 ?auto_458800 ) ) ( not ( = ?auto_458794 ?auto_458801 ) ) ( not ( = ?auto_458794 ?auto_458802 ) ) ( not ( = ?auto_458794 ?auto_458803 ) ) ( not ( = ?auto_458794 ?auto_458804 ) ) ( not ( = ?auto_458794 ?auto_458805 ) ) ( not ( = ?auto_458794 ?auto_458806 ) ) ( not ( = ?auto_458794 ?auto_458807 ) ) ( not ( = ?auto_458794 ?auto_458808 ) ) ( not ( = ?auto_458795 ?auto_458796 ) ) ( not ( = ?auto_458795 ?auto_458797 ) ) ( not ( = ?auto_458795 ?auto_458798 ) ) ( not ( = ?auto_458795 ?auto_458799 ) ) ( not ( = ?auto_458795 ?auto_458800 ) ) ( not ( = ?auto_458795 ?auto_458801 ) ) ( not ( = ?auto_458795 ?auto_458802 ) ) ( not ( = ?auto_458795 ?auto_458803 ) ) ( not ( = ?auto_458795 ?auto_458804 ) ) ( not ( = ?auto_458795 ?auto_458805 ) ) ( not ( = ?auto_458795 ?auto_458806 ) ) ( not ( = ?auto_458795 ?auto_458807 ) ) ( not ( = ?auto_458795 ?auto_458808 ) ) ( not ( = ?auto_458796 ?auto_458797 ) ) ( not ( = ?auto_458796 ?auto_458798 ) ) ( not ( = ?auto_458796 ?auto_458799 ) ) ( not ( = ?auto_458796 ?auto_458800 ) ) ( not ( = ?auto_458796 ?auto_458801 ) ) ( not ( = ?auto_458796 ?auto_458802 ) ) ( not ( = ?auto_458796 ?auto_458803 ) ) ( not ( = ?auto_458796 ?auto_458804 ) ) ( not ( = ?auto_458796 ?auto_458805 ) ) ( not ( = ?auto_458796 ?auto_458806 ) ) ( not ( = ?auto_458796 ?auto_458807 ) ) ( not ( = ?auto_458796 ?auto_458808 ) ) ( not ( = ?auto_458797 ?auto_458798 ) ) ( not ( = ?auto_458797 ?auto_458799 ) ) ( not ( = ?auto_458797 ?auto_458800 ) ) ( not ( = ?auto_458797 ?auto_458801 ) ) ( not ( = ?auto_458797 ?auto_458802 ) ) ( not ( = ?auto_458797 ?auto_458803 ) ) ( not ( = ?auto_458797 ?auto_458804 ) ) ( not ( = ?auto_458797 ?auto_458805 ) ) ( not ( = ?auto_458797 ?auto_458806 ) ) ( not ( = ?auto_458797 ?auto_458807 ) ) ( not ( = ?auto_458797 ?auto_458808 ) ) ( not ( = ?auto_458798 ?auto_458799 ) ) ( not ( = ?auto_458798 ?auto_458800 ) ) ( not ( = ?auto_458798 ?auto_458801 ) ) ( not ( = ?auto_458798 ?auto_458802 ) ) ( not ( = ?auto_458798 ?auto_458803 ) ) ( not ( = ?auto_458798 ?auto_458804 ) ) ( not ( = ?auto_458798 ?auto_458805 ) ) ( not ( = ?auto_458798 ?auto_458806 ) ) ( not ( = ?auto_458798 ?auto_458807 ) ) ( not ( = ?auto_458798 ?auto_458808 ) ) ( not ( = ?auto_458799 ?auto_458800 ) ) ( not ( = ?auto_458799 ?auto_458801 ) ) ( not ( = ?auto_458799 ?auto_458802 ) ) ( not ( = ?auto_458799 ?auto_458803 ) ) ( not ( = ?auto_458799 ?auto_458804 ) ) ( not ( = ?auto_458799 ?auto_458805 ) ) ( not ( = ?auto_458799 ?auto_458806 ) ) ( not ( = ?auto_458799 ?auto_458807 ) ) ( not ( = ?auto_458799 ?auto_458808 ) ) ( not ( = ?auto_458800 ?auto_458801 ) ) ( not ( = ?auto_458800 ?auto_458802 ) ) ( not ( = ?auto_458800 ?auto_458803 ) ) ( not ( = ?auto_458800 ?auto_458804 ) ) ( not ( = ?auto_458800 ?auto_458805 ) ) ( not ( = ?auto_458800 ?auto_458806 ) ) ( not ( = ?auto_458800 ?auto_458807 ) ) ( not ( = ?auto_458800 ?auto_458808 ) ) ( not ( = ?auto_458801 ?auto_458802 ) ) ( not ( = ?auto_458801 ?auto_458803 ) ) ( not ( = ?auto_458801 ?auto_458804 ) ) ( not ( = ?auto_458801 ?auto_458805 ) ) ( not ( = ?auto_458801 ?auto_458806 ) ) ( not ( = ?auto_458801 ?auto_458807 ) ) ( not ( = ?auto_458801 ?auto_458808 ) ) ( not ( = ?auto_458802 ?auto_458803 ) ) ( not ( = ?auto_458802 ?auto_458804 ) ) ( not ( = ?auto_458802 ?auto_458805 ) ) ( not ( = ?auto_458802 ?auto_458806 ) ) ( not ( = ?auto_458802 ?auto_458807 ) ) ( not ( = ?auto_458802 ?auto_458808 ) ) ( not ( = ?auto_458803 ?auto_458804 ) ) ( not ( = ?auto_458803 ?auto_458805 ) ) ( not ( = ?auto_458803 ?auto_458806 ) ) ( not ( = ?auto_458803 ?auto_458807 ) ) ( not ( = ?auto_458803 ?auto_458808 ) ) ( not ( = ?auto_458804 ?auto_458805 ) ) ( not ( = ?auto_458804 ?auto_458806 ) ) ( not ( = ?auto_458804 ?auto_458807 ) ) ( not ( = ?auto_458804 ?auto_458808 ) ) ( not ( = ?auto_458805 ?auto_458806 ) ) ( not ( = ?auto_458805 ?auto_458807 ) ) ( not ( = ?auto_458805 ?auto_458808 ) ) ( not ( = ?auto_458806 ?auto_458807 ) ) ( not ( = ?auto_458806 ?auto_458808 ) ) ( not ( = ?auto_458807 ?auto_458808 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_458807 ?auto_458808 )
      ( !STACK ?auto_458807 ?auto_458806 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_458824 - BLOCK
      ?auto_458825 - BLOCK
      ?auto_458826 - BLOCK
      ?auto_458827 - BLOCK
      ?auto_458828 - BLOCK
      ?auto_458829 - BLOCK
      ?auto_458830 - BLOCK
      ?auto_458831 - BLOCK
      ?auto_458832 - BLOCK
      ?auto_458833 - BLOCK
      ?auto_458834 - BLOCK
      ?auto_458835 - BLOCK
      ?auto_458836 - BLOCK
      ?auto_458837 - BLOCK
      ?auto_458838 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_458837 ) ( ON-TABLE ?auto_458838 ) ( CLEAR ?auto_458838 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_458824 ) ( ON ?auto_458825 ?auto_458824 ) ( ON ?auto_458826 ?auto_458825 ) ( ON ?auto_458827 ?auto_458826 ) ( ON ?auto_458828 ?auto_458827 ) ( ON ?auto_458829 ?auto_458828 ) ( ON ?auto_458830 ?auto_458829 ) ( ON ?auto_458831 ?auto_458830 ) ( ON ?auto_458832 ?auto_458831 ) ( ON ?auto_458833 ?auto_458832 ) ( ON ?auto_458834 ?auto_458833 ) ( ON ?auto_458835 ?auto_458834 ) ( ON ?auto_458836 ?auto_458835 ) ( ON ?auto_458837 ?auto_458836 ) ( not ( = ?auto_458824 ?auto_458825 ) ) ( not ( = ?auto_458824 ?auto_458826 ) ) ( not ( = ?auto_458824 ?auto_458827 ) ) ( not ( = ?auto_458824 ?auto_458828 ) ) ( not ( = ?auto_458824 ?auto_458829 ) ) ( not ( = ?auto_458824 ?auto_458830 ) ) ( not ( = ?auto_458824 ?auto_458831 ) ) ( not ( = ?auto_458824 ?auto_458832 ) ) ( not ( = ?auto_458824 ?auto_458833 ) ) ( not ( = ?auto_458824 ?auto_458834 ) ) ( not ( = ?auto_458824 ?auto_458835 ) ) ( not ( = ?auto_458824 ?auto_458836 ) ) ( not ( = ?auto_458824 ?auto_458837 ) ) ( not ( = ?auto_458824 ?auto_458838 ) ) ( not ( = ?auto_458825 ?auto_458826 ) ) ( not ( = ?auto_458825 ?auto_458827 ) ) ( not ( = ?auto_458825 ?auto_458828 ) ) ( not ( = ?auto_458825 ?auto_458829 ) ) ( not ( = ?auto_458825 ?auto_458830 ) ) ( not ( = ?auto_458825 ?auto_458831 ) ) ( not ( = ?auto_458825 ?auto_458832 ) ) ( not ( = ?auto_458825 ?auto_458833 ) ) ( not ( = ?auto_458825 ?auto_458834 ) ) ( not ( = ?auto_458825 ?auto_458835 ) ) ( not ( = ?auto_458825 ?auto_458836 ) ) ( not ( = ?auto_458825 ?auto_458837 ) ) ( not ( = ?auto_458825 ?auto_458838 ) ) ( not ( = ?auto_458826 ?auto_458827 ) ) ( not ( = ?auto_458826 ?auto_458828 ) ) ( not ( = ?auto_458826 ?auto_458829 ) ) ( not ( = ?auto_458826 ?auto_458830 ) ) ( not ( = ?auto_458826 ?auto_458831 ) ) ( not ( = ?auto_458826 ?auto_458832 ) ) ( not ( = ?auto_458826 ?auto_458833 ) ) ( not ( = ?auto_458826 ?auto_458834 ) ) ( not ( = ?auto_458826 ?auto_458835 ) ) ( not ( = ?auto_458826 ?auto_458836 ) ) ( not ( = ?auto_458826 ?auto_458837 ) ) ( not ( = ?auto_458826 ?auto_458838 ) ) ( not ( = ?auto_458827 ?auto_458828 ) ) ( not ( = ?auto_458827 ?auto_458829 ) ) ( not ( = ?auto_458827 ?auto_458830 ) ) ( not ( = ?auto_458827 ?auto_458831 ) ) ( not ( = ?auto_458827 ?auto_458832 ) ) ( not ( = ?auto_458827 ?auto_458833 ) ) ( not ( = ?auto_458827 ?auto_458834 ) ) ( not ( = ?auto_458827 ?auto_458835 ) ) ( not ( = ?auto_458827 ?auto_458836 ) ) ( not ( = ?auto_458827 ?auto_458837 ) ) ( not ( = ?auto_458827 ?auto_458838 ) ) ( not ( = ?auto_458828 ?auto_458829 ) ) ( not ( = ?auto_458828 ?auto_458830 ) ) ( not ( = ?auto_458828 ?auto_458831 ) ) ( not ( = ?auto_458828 ?auto_458832 ) ) ( not ( = ?auto_458828 ?auto_458833 ) ) ( not ( = ?auto_458828 ?auto_458834 ) ) ( not ( = ?auto_458828 ?auto_458835 ) ) ( not ( = ?auto_458828 ?auto_458836 ) ) ( not ( = ?auto_458828 ?auto_458837 ) ) ( not ( = ?auto_458828 ?auto_458838 ) ) ( not ( = ?auto_458829 ?auto_458830 ) ) ( not ( = ?auto_458829 ?auto_458831 ) ) ( not ( = ?auto_458829 ?auto_458832 ) ) ( not ( = ?auto_458829 ?auto_458833 ) ) ( not ( = ?auto_458829 ?auto_458834 ) ) ( not ( = ?auto_458829 ?auto_458835 ) ) ( not ( = ?auto_458829 ?auto_458836 ) ) ( not ( = ?auto_458829 ?auto_458837 ) ) ( not ( = ?auto_458829 ?auto_458838 ) ) ( not ( = ?auto_458830 ?auto_458831 ) ) ( not ( = ?auto_458830 ?auto_458832 ) ) ( not ( = ?auto_458830 ?auto_458833 ) ) ( not ( = ?auto_458830 ?auto_458834 ) ) ( not ( = ?auto_458830 ?auto_458835 ) ) ( not ( = ?auto_458830 ?auto_458836 ) ) ( not ( = ?auto_458830 ?auto_458837 ) ) ( not ( = ?auto_458830 ?auto_458838 ) ) ( not ( = ?auto_458831 ?auto_458832 ) ) ( not ( = ?auto_458831 ?auto_458833 ) ) ( not ( = ?auto_458831 ?auto_458834 ) ) ( not ( = ?auto_458831 ?auto_458835 ) ) ( not ( = ?auto_458831 ?auto_458836 ) ) ( not ( = ?auto_458831 ?auto_458837 ) ) ( not ( = ?auto_458831 ?auto_458838 ) ) ( not ( = ?auto_458832 ?auto_458833 ) ) ( not ( = ?auto_458832 ?auto_458834 ) ) ( not ( = ?auto_458832 ?auto_458835 ) ) ( not ( = ?auto_458832 ?auto_458836 ) ) ( not ( = ?auto_458832 ?auto_458837 ) ) ( not ( = ?auto_458832 ?auto_458838 ) ) ( not ( = ?auto_458833 ?auto_458834 ) ) ( not ( = ?auto_458833 ?auto_458835 ) ) ( not ( = ?auto_458833 ?auto_458836 ) ) ( not ( = ?auto_458833 ?auto_458837 ) ) ( not ( = ?auto_458833 ?auto_458838 ) ) ( not ( = ?auto_458834 ?auto_458835 ) ) ( not ( = ?auto_458834 ?auto_458836 ) ) ( not ( = ?auto_458834 ?auto_458837 ) ) ( not ( = ?auto_458834 ?auto_458838 ) ) ( not ( = ?auto_458835 ?auto_458836 ) ) ( not ( = ?auto_458835 ?auto_458837 ) ) ( not ( = ?auto_458835 ?auto_458838 ) ) ( not ( = ?auto_458836 ?auto_458837 ) ) ( not ( = ?auto_458836 ?auto_458838 ) ) ( not ( = ?auto_458837 ?auto_458838 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_458838 )
      ( !STACK ?auto_458838 ?auto_458837 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_458854 - BLOCK
      ?auto_458855 - BLOCK
      ?auto_458856 - BLOCK
      ?auto_458857 - BLOCK
      ?auto_458858 - BLOCK
      ?auto_458859 - BLOCK
      ?auto_458860 - BLOCK
      ?auto_458861 - BLOCK
      ?auto_458862 - BLOCK
      ?auto_458863 - BLOCK
      ?auto_458864 - BLOCK
      ?auto_458865 - BLOCK
      ?auto_458866 - BLOCK
      ?auto_458867 - BLOCK
      ?auto_458868 - BLOCK
    )
    :vars
    (
      ?auto_458869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_458868 ?auto_458869 ) ( ON-TABLE ?auto_458854 ) ( ON ?auto_458855 ?auto_458854 ) ( ON ?auto_458856 ?auto_458855 ) ( ON ?auto_458857 ?auto_458856 ) ( ON ?auto_458858 ?auto_458857 ) ( ON ?auto_458859 ?auto_458858 ) ( ON ?auto_458860 ?auto_458859 ) ( ON ?auto_458861 ?auto_458860 ) ( ON ?auto_458862 ?auto_458861 ) ( ON ?auto_458863 ?auto_458862 ) ( ON ?auto_458864 ?auto_458863 ) ( ON ?auto_458865 ?auto_458864 ) ( ON ?auto_458866 ?auto_458865 ) ( not ( = ?auto_458854 ?auto_458855 ) ) ( not ( = ?auto_458854 ?auto_458856 ) ) ( not ( = ?auto_458854 ?auto_458857 ) ) ( not ( = ?auto_458854 ?auto_458858 ) ) ( not ( = ?auto_458854 ?auto_458859 ) ) ( not ( = ?auto_458854 ?auto_458860 ) ) ( not ( = ?auto_458854 ?auto_458861 ) ) ( not ( = ?auto_458854 ?auto_458862 ) ) ( not ( = ?auto_458854 ?auto_458863 ) ) ( not ( = ?auto_458854 ?auto_458864 ) ) ( not ( = ?auto_458854 ?auto_458865 ) ) ( not ( = ?auto_458854 ?auto_458866 ) ) ( not ( = ?auto_458854 ?auto_458867 ) ) ( not ( = ?auto_458854 ?auto_458868 ) ) ( not ( = ?auto_458854 ?auto_458869 ) ) ( not ( = ?auto_458855 ?auto_458856 ) ) ( not ( = ?auto_458855 ?auto_458857 ) ) ( not ( = ?auto_458855 ?auto_458858 ) ) ( not ( = ?auto_458855 ?auto_458859 ) ) ( not ( = ?auto_458855 ?auto_458860 ) ) ( not ( = ?auto_458855 ?auto_458861 ) ) ( not ( = ?auto_458855 ?auto_458862 ) ) ( not ( = ?auto_458855 ?auto_458863 ) ) ( not ( = ?auto_458855 ?auto_458864 ) ) ( not ( = ?auto_458855 ?auto_458865 ) ) ( not ( = ?auto_458855 ?auto_458866 ) ) ( not ( = ?auto_458855 ?auto_458867 ) ) ( not ( = ?auto_458855 ?auto_458868 ) ) ( not ( = ?auto_458855 ?auto_458869 ) ) ( not ( = ?auto_458856 ?auto_458857 ) ) ( not ( = ?auto_458856 ?auto_458858 ) ) ( not ( = ?auto_458856 ?auto_458859 ) ) ( not ( = ?auto_458856 ?auto_458860 ) ) ( not ( = ?auto_458856 ?auto_458861 ) ) ( not ( = ?auto_458856 ?auto_458862 ) ) ( not ( = ?auto_458856 ?auto_458863 ) ) ( not ( = ?auto_458856 ?auto_458864 ) ) ( not ( = ?auto_458856 ?auto_458865 ) ) ( not ( = ?auto_458856 ?auto_458866 ) ) ( not ( = ?auto_458856 ?auto_458867 ) ) ( not ( = ?auto_458856 ?auto_458868 ) ) ( not ( = ?auto_458856 ?auto_458869 ) ) ( not ( = ?auto_458857 ?auto_458858 ) ) ( not ( = ?auto_458857 ?auto_458859 ) ) ( not ( = ?auto_458857 ?auto_458860 ) ) ( not ( = ?auto_458857 ?auto_458861 ) ) ( not ( = ?auto_458857 ?auto_458862 ) ) ( not ( = ?auto_458857 ?auto_458863 ) ) ( not ( = ?auto_458857 ?auto_458864 ) ) ( not ( = ?auto_458857 ?auto_458865 ) ) ( not ( = ?auto_458857 ?auto_458866 ) ) ( not ( = ?auto_458857 ?auto_458867 ) ) ( not ( = ?auto_458857 ?auto_458868 ) ) ( not ( = ?auto_458857 ?auto_458869 ) ) ( not ( = ?auto_458858 ?auto_458859 ) ) ( not ( = ?auto_458858 ?auto_458860 ) ) ( not ( = ?auto_458858 ?auto_458861 ) ) ( not ( = ?auto_458858 ?auto_458862 ) ) ( not ( = ?auto_458858 ?auto_458863 ) ) ( not ( = ?auto_458858 ?auto_458864 ) ) ( not ( = ?auto_458858 ?auto_458865 ) ) ( not ( = ?auto_458858 ?auto_458866 ) ) ( not ( = ?auto_458858 ?auto_458867 ) ) ( not ( = ?auto_458858 ?auto_458868 ) ) ( not ( = ?auto_458858 ?auto_458869 ) ) ( not ( = ?auto_458859 ?auto_458860 ) ) ( not ( = ?auto_458859 ?auto_458861 ) ) ( not ( = ?auto_458859 ?auto_458862 ) ) ( not ( = ?auto_458859 ?auto_458863 ) ) ( not ( = ?auto_458859 ?auto_458864 ) ) ( not ( = ?auto_458859 ?auto_458865 ) ) ( not ( = ?auto_458859 ?auto_458866 ) ) ( not ( = ?auto_458859 ?auto_458867 ) ) ( not ( = ?auto_458859 ?auto_458868 ) ) ( not ( = ?auto_458859 ?auto_458869 ) ) ( not ( = ?auto_458860 ?auto_458861 ) ) ( not ( = ?auto_458860 ?auto_458862 ) ) ( not ( = ?auto_458860 ?auto_458863 ) ) ( not ( = ?auto_458860 ?auto_458864 ) ) ( not ( = ?auto_458860 ?auto_458865 ) ) ( not ( = ?auto_458860 ?auto_458866 ) ) ( not ( = ?auto_458860 ?auto_458867 ) ) ( not ( = ?auto_458860 ?auto_458868 ) ) ( not ( = ?auto_458860 ?auto_458869 ) ) ( not ( = ?auto_458861 ?auto_458862 ) ) ( not ( = ?auto_458861 ?auto_458863 ) ) ( not ( = ?auto_458861 ?auto_458864 ) ) ( not ( = ?auto_458861 ?auto_458865 ) ) ( not ( = ?auto_458861 ?auto_458866 ) ) ( not ( = ?auto_458861 ?auto_458867 ) ) ( not ( = ?auto_458861 ?auto_458868 ) ) ( not ( = ?auto_458861 ?auto_458869 ) ) ( not ( = ?auto_458862 ?auto_458863 ) ) ( not ( = ?auto_458862 ?auto_458864 ) ) ( not ( = ?auto_458862 ?auto_458865 ) ) ( not ( = ?auto_458862 ?auto_458866 ) ) ( not ( = ?auto_458862 ?auto_458867 ) ) ( not ( = ?auto_458862 ?auto_458868 ) ) ( not ( = ?auto_458862 ?auto_458869 ) ) ( not ( = ?auto_458863 ?auto_458864 ) ) ( not ( = ?auto_458863 ?auto_458865 ) ) ( not ( = ?auto_458863 ?auto_458866 ) ) ( not ( = ?auto_458863 ?auto_458867 ) ) ( not ( = ?auto_458863 ?auto_458868 ) ) ( not ( = ?auto_458863 ?auto_458869 ) ) ( not ( = ?auto_458864 ?auto_458865 ) ) ( not ( = ?auto_458864 ?auto_458866 ) ) ( not ( = ?auto_458864 ?auto_458867 ) ) ( not ( = ?auto_458864 ?auto_458868 ) ) ( not ( = ?auto_458864 ?auto_458869 ) ) ( not ( = ?auto_458865 ?auto_458866 ) ) ( not ( = ?auto_458865 ?auto_458867 ) ) ( not ( = ?auto_458865 ?auto_458868 ) ) ( not ( = ?auto_458865 ?auto_458869 ) ) ( not ( = ?auto_458866 ?auto_458867 ) ) ( not ( = ?auto_458866 ?auto_458868 ) ) ( not ( = ?auto_458866 ?auto_458869 ) ) ( not ( = ?auto_458867 ?auto_458868 ) ) ( not ( = ?auto_458867 ?auto_458869 ) ) ( not ( = ?auto_458868 ?auto_458869 ) ) ( CLEAR ?auto_458866 ) ( ON ?auto_458867 ?auto_458868 ) ( CLEAR ?auto_458867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_458854 ?auto_458855 ?auto_458856 ?auto_458857 ?auto_458858 ?auto_458859 ?auto_458860 ?auto_458861 ?auto_458862 ?auto_458863 ?auto_458864 ?auto_458865 ?auto_458866 ?auto_458867 )
      ( MAKE-15PILE ?auto_458854 ?auto_458855 ?auto_458856 ?auto_458857 ?auto_458858 ?auto_458859 ?auto_458860 ?auto_458861 ?auto_458862 ?auto_458863 ?auto_458864 ?auto_458865 ?auto_458866 ?auto_458867 ?auto_458868 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_458885 - BLOCK
      ?auto_458886 - BLOCK
      ?auto_458887 - BLOCK
      ?auto_458888 - BLOCK
      ?auto_458889 - BLOCK
      ?auto_458890 - BLOCK
      ?auto_458891 - BLOCK
      ?auto_458892 - BLOCK
      ?auto_458893 - BLOCK
      ?auto_458894 - BLOCK
      ?auto_458895 - BLOCK
      ?auto_458896 - BLOCK
      ?auto_458897 - BLOCK
      ?auto_458898 - BLOCK
      ?auto_458899 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_458899 ) ( ON-TABLE ?auto_458885 ) ( ON ?auto_458886 ?auto_458885 ) ( ON ?auto_458887 ?auto_458886 ) ( ON ?auto_458888 ?auto_458887 ) ( ON ?auto_458889 ?auto_458888 ) ( ON ?auto_458890 ?auto_458889 ) ( ON ?auto_458891 ?auto_458890 ) ( ON ?auto_458892 ?auto_458891 ) ( ON ?auto_458893 ?auto_458892 ) ( ON ?auto_458894 ?auto_458893 ) ( ON ?auto_458895 ?auto_458894 ) ( ON ?auto_458896 ?auto_458895 ) ( ON ?auto_458897 ?auto_458896 ) ( not ( = ?auto_458885 ?auto_458886 ) ) ( not ( = ?auto_458885 ?auto_458887 ) ) ( not ( = ?auto_458885 ?auto_458888 ) ) ( not ( = ?auto_458885 ?auto_458889 ) ) ( not ( = ?auto_458885 ?auto_458890 ) ) ( not ( = ?auto_458885 ?auto_458891 ) ) ( not ( = ?auto_458885 ?auto_458892 ) ) ( not ( = ?auto_458885 ?auto_458893 ) ) ( not ( = ?auto_458885 ?auto_458894 ) ) ( not ( = ?auto_458885 ?auto_458895 ) ) ( not ( = ?auto_458885 ?auto_458896 ) ) ( not ( = ?auto_458885 ?auto_458897 ) ) ( not ( = ?auto_458885 ?auto_458898 ) ) ( not ( = ?auto_458885 ?auto_458899 ) ) ( not ( = ?auto_458886 ?auto_458887 ) ) ( not ( = ?auto_458886 ?auto_458888 ) ) ( not ( = ?auto_458886 ?auto_458889 ) ) ( not ( = ?auto_458886 ?auto_458890 ) ) ( not ( = ?auto_458886 ?auto_458891 ) ) ( not ( = ?auto_458886 ?auto_458892 ) ) ( not ( = ?auto_458886 ?auto_458893 ) ) ( not ( = ?auto_458886 ?auto_458894 ) ) ( not ( = ?auto_458886 ?auto_458895 ) ) ( not ( = ?auto_458886 ?auto_458896 ) ) ( not ( = ?auto_458886 ?auto_458897 ) ) ( not ( = ?auto_458886 ?auto_458898 ) ) ( not ( = ?auto_458886 ?auto_458899 ) ) ( not ( = ?auto_458887 ?auto_458888 ) ) ( not ( = ?auto_458887 ?auto_458889 ) ) ( not ( = ?auto_458887 ?auto_458890 ) ) ( not ( = ?auto_458887 ?auto_458891 ) ) ( not ( = ?auto_458887 ?auto_458892 ) ) ( not ( = ?auto_458887 ?auto_458893 ) ) ( not ( = ?auto_458887 ?auto_458894 ) ) ( not ( = ?auto_458887 ?auto_458895 ) ) ( not ( = ?auto_458887 ?auto_458896 ) ) ( not ( = ?auto_458887 ?auto_458897 ) ) ( not ( = ?auto_458887 ?auto_458898 ) ) ( not ( = ?auto_458887 ?auto_458899 ) ) ( not ( = ?auto_458888 ?auto_458889 ) ) ( not ( = ?auto_458888 ?auto_458890 ) ) ( not ( = ?auto_458888 ?auto_458891 ) ) ( not ( = ?auto_458888 ?auto_458892 ) ) ( not ( = ?auto_458888 ?auto_458893 ) ) ( not ( = ?auto_458888 ?auto_458894 ) ) ( not ( = ?auto_458888 ?auto_458895 ) ) ( not ( = ?auto_458888 ?auto_458896 ) ) ( not ( = ?auto_458888 ?auto_458897 ) ) ( not ( = ?auto_458888 ?auto_458898 ) ) ( not ( = ?auto_458888 ?auto_458899 ) ) ( not ( = ?auto_458889 ?auto_458890 ) ) ( not ( = ?auto_458889 ?auto_458891 ) ) ( not ( = ?auto_458889 ?auto_458892 ) ) ( not ( = ?auto_458889 ?auto_458893 ) ) ( not ( = ?auto_458889 ?auto_458894 ) ) ( not ( = ?auto_458889 ?auto_458895 ) ) ( not ( = ?auto_458889 ?auto_458896 ) ) ( not ( = ?auto_458889 ?auto_458897 ) ) ( not ( = ?auto_458889 ?auto_458898 ) ) ( not ( = ?auto_458889 ?auto_458899 ) ) ( not ( = ?auto_458890 ?auto_458891 ) ) ( not ( = ?auto_458890 ?auto_458892 ) ) ( not ( = ?auto_458890 ?auto_458893 ) ) ( not ( = ?auto_458890 ?auto_458894 ) ) ( not ( = ?auto_458890 ?auto_458895 ) ) ( not ( = ?auto_458890 ?auto_458896 ) ) ( not ( = ?auto_458890 ?auto_458897 ) ) ( not ( = ?auto_458890 ?auto_458898 ) ) ( not ( = ?auto_458890 ?auto_458899 ) ) ( not ( = ?auto_458891 ?auto_458892 ) ) ( not ( = ?auto_458891 ?auto_458893 ) ) ( not ( = ?auto_458891 ?auto_458894 ) ) ( not ( = ?auto_458891 ?auto_458895 ) ) ( not ( = ?auto_458891 ?auto_458896 ) ) ( not ( = ?auto_458891 ?auto_458897 ) ) ( not ( = ?auto_458891 ?auto_458898 ) ) ( not ( = ?auto_458891 ?auto_458899 ) ) ( not ( = ?auto_458892 ?auto_458893 ) ) ( not ( = ?auto_458892 ?auto_458894 ) ) ( not ( = ?auto_458892 ?auto_458895 ) ) ( not ( = ?auto_458892 ?auto_458896 ) ) ( not ( = ?auto_458892 ?auto_458897 ) ) ( not ( = ?auto_458892 ?auto_458898 ) ) ( not ( = ?auto_458892 ?auto_458899 ) ) ( not ( = ?auto_458893 ?auto_458894 ) ) ( not ( = ?auto_458893 ?auto_458895 ) ) ( not ( = ?auto_458893 ?auto_458896 ) ) ( not ( = ?auto_458893 ?auto_458897 ) ) ( not ( = ?auto_458893 ?auto_458898 ) ) ( not ( = ?auto_458893 ?auto_458899 ) ) ( not ( = ?auto_458894 ?auto_458895 ) ) ( not ( = ?auto_458894 ?auto_458896 ) ) ( not ( = ?auto_458894 ?auto_458897 ) ) ( not ( = ?auto_458894 ?auto_458898 ) ) ( not ( = ?auto_458894 ?auto_458899 ) ) ( not ( = ?auto_458895 ?auto_458896 ) ) ( not ( = ?auto_458895 ?auto_458897 ) ) ( not ( = ?auto_458895 ?auto_458898 ) ) ( not ( = ?auto_458895 ?auto_458899 ) ) ( not ( = ?auto_458896 ?auto_458897 ) ) ( not ( = ?auto_458896 ?auto_458898 ) ) ( not ( = ?auto_458896 ?auto_458899 ) ) ( not ( = ?auto_458897 ?auto_458898 ) ) ( not ( = ?auto_458897 ?auto_458899 ) ) ( not ( = ?auto_458898 ?auto_458899 ) ) ( CLEAR ?auto_458897 ) ( ON ?auto_458898 ?auto_458899 ) ( CLEAR ?auto_458898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_458885 ?auto_458886 ?auto_458887 ?auto_458888 ?auto_458889 ?auto_458890 ?auto_458891 ?auto_458892 ?auto_458893 ?auto_458894 ?auto_458895 ?auto_458896 ?auto_458897 ?auto_458898 )
      ( MAKE-15PILE ?auto_458885 ?auto_458886 ?auto_458887 ?auto_458888 ?auto_458889 ?auto_458890 ?auto_458891 ?auto_458892 ?auto_458893 ?auto_458894 ?auto_458895 ?auto_458896 ?auto_458897 ?auto_458898 ?auto_458899 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_458915 - BLOCK
      ?auto_458916 - BLOCK
      ?auto_458917 - BLOCK
      ?auto_458918 - BLOCK
      ?auto_458919 - BLOCK
      ?auto_458920 - BLOCK
      ?auto_458921 - BLOCK
      ?auto_458922 - BLOCK
      ?auto_458923 - BLOCK
      ?auto_458924 - BLOCK
      ?auto_458925 - BLOCK
      ?auto_458926 - BLOCK
      ?auto_458927 - BLOCK
      ?auto_458928 - BLOCK
      ?auto_458929 - BLOCK
    )
    :vars
    (
      ?auto_458930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_458929 ?auto_458930 ) ( ON-TABLE ?auto_458915 ) ( ON ?auto_458916 ?auto_458915 ) ( ON ?auto_458917 ?auto_458916 ) ( ON ?auto_458918 ?auto_458917 ) ( ON ?auto_458919 ?auto_458918 ) ( ON ?auto_458920 ?auto_458919 ) ( ON ?auto_458921 ?auto_458920 ) ( ON ?auto_458922 ?auto_458921 ) ( ON ?auto_458923 ?auto_458922 ) ( ON ?auto_458924 ?auto_458923 ) ( ON ?auto_458925 ?auto_458924 ) ( ON ?auto_458926 ?auto_458925 ) ( not ( = ?auto_458915 ?auto_458916 ) ) ( not ( = ?auto_458915 ?auto_458917 ) ) ( not ( = ?auto_458915 ?auto_458918 ) ) ( not ( = ?auto_458915 ?auto_458919 ) ) ( not ( = ?auto_458915 ?auto_458920 ) ) ( not ( = ?auto_458915 ?auto_458921 ) ) ( not ( = ?auto_458915 ?auto_458922 ) ) ( not ( = ?auto_458915 ?auto_458923 ) ) ( not ( = ?auto_458915 ?auto_458924 ) ) ( not ( = ?auto_458915 ?auto_458925 ) ) ( not ( = ?auto_458915 ?auto_458926 ) ) ( not ( = ?auto_458915 ?auto_458927 ) ) ( not ( = ?auto_458915 ?auto_458928 ) ) ( not ( = ?auto_458915 ?auto_458929 ) ) ( not ( = ?auto_458915 ?auto_458930 ) ) ( not ( = ?auto_458916 ?auto_458917 ) ) ( not ( = ?auto_458916 ?auto_458918 ) ) ( not ( = ?auto_458916 ?auto_458919 ) ) ( not ( = ?auto_458916 ?auto_458920 ) ) ( not ( = ?auto_458916 ?auto_458921 ) ) ( not ( = ?auto_458916 ?auto_458922 ) ) ( not ( = ?auto_458916 ?auto_458923 ) ) ( not ( = ?auto_458916 ?auto_458924 ) ) ( not ( = ?auto_458916 ?auto_458925 ) ) ( not ( = ?auto_458916 ?auto_458926 ) ) ( not ( = ?auto_458916 ?auto_458927 ) ) ( not ( = ?auto_458916 ?auto_458928 ) ) ( not ( = ?auto_458916 ?auto_458929 ) ) ( not ( = ?auto_458916 ?auto_458930 ) ) ( not ( = ?auto_458917 ?auto_458918 ) ) ( not ( = ?auto_458917 ?auto_458919 ) ) ( not ( = ?auto_458917 ?auto_458920 ) ) ( not ( = ?auto_458917 ?auto_458921 ) ) ( not ( = ?auto_458917 ?auto_458922 ) ) ( not ( = ?auto_458917 ?auto_458923 ) ) ( not ( = ?auto_458917 ?auto_458924 ) ) ( not ( = ?auto_458917 ?auto_458925 ) ) ( not ( = ?auto_458917 ?auto_458926 ) ) ( not ( = ?auto_458917 ?auto_458927 ) ) ( not ( = ?auto_458917 ?auto_458928 ) ) ( not ( = ?auto_458917 ?auto_458929 ) ) ( not ( = ?auto_458917 ?auto_458930 ) ) ( not ( = ?auto_458918 ?auto_458919 ) ) ( not ( = ?auto_458918 ?auto_458920 ) ) ( not ( = ?auto_458918 ?auto_458921 ) ) ( not ( = ?auto_458918 ?auto_458922 ) ) ( not ( = ?auto_458918 ?auto_458923 ) ) ( not ( = ?auto_458918 ?auto_458924 ) ) ( not ( = ?auto_458918 ?auto_458925 ) ) ( not ( = ?auto_458918 ?auto_458926 ) ) ( not ( = ?auto_458918 ?auto_458927 ) ) ( not ( = ?auto_458918 ?auto_458928 ) ) ( not ( = ?auto_458918 ?auto_458929 ) ) ( not ( = ?auto_458918 ?auto_458930 ) ) ( not ( = ?auto_458919 ?auto_458920 ) ) ( not ( = ?auto_458919 ?auto_458921 ) ) ( not ( = ?auto_458919 ?auto_458922 ) ) ( not ( = ?auto_458919 ?auto_458923 ) ) ( not ( = ?auto_458919 ?auto_458924 ) ) ( not ( = ?auto_458919 ?auto_458925 ) ) ( not ( = ?auto_458919 ?auto_458926 ) ) ( not ( = ?auto_458919 ?auto_458927 ) ) ( not ( = ?auto_458919 ?auto_458928 ) ) ( not ( = ?auto_458919 ?auto_458929 ) ) ( not ( = ?auto_458919 ?auto_458930 ) ) ( not ( = ?auto_458920 ?auto_458921 ) ) ( not ( = ?auto_458920 ?auto_458922 ) ) ( not ( = ?auto_458920 ?auto_458923 ) ) ( not ( = ?auto_458920 ?auto_458924 ) ) ( not ( = ?auto_458920 ?auto_458925 ) ) ( not ( = ?auto_458920 ?auto_458926 ) ) ( not ( = ?auto_458920 ?auto_458927 ) ) ( not ( = ?auto_458920 ?auto_458928 ) ) ( not ( = ?auto_458920 ?auto_458929 ) ) ( not ( = ?auto_458920 ?auto_458930 ) ) ( not ( = ?auto_458921 ?auto_458922 ) ) ( not ( = ?auto_458921 ?auto_458923 ) ) ( not ( = ?auto_458921 ?auto_458924 ) ) ( not ( = ?auto_458921 ?auto_458925 ) ) ( not ( = ?auto_458921 ?auto_458926 ) ) ( not ( = ?auto_458921 ?auto_458927 ) ) ( not ( = ?auto_458921 ?auto_458928 ) ) ( not ( = ?auto_458921 ?auto_458929 ) ) ( not ( = ?auto_458921 ?auto_458930 ) ) ( not ( = ?auto_458922 ?auto_458923 ) ) ( not ( = ?auto_458922 ?auto_458924 ) ) ( not ( = ?auto_458922 ?auto_458925 ) ) ( not ( = ?auto_458922 ?auto_458926 ) ) ( not ( = ?auto_458922 ?auto_458927 ) ) ( not ( = ?auto_458922 ?auto_458928 ) ) ( not ( = ?auto_458922 ?auto_458929 ) ) ( not ( = ?auto_458922 ?auto_458930 ) ) ( not ( = ?auto_458923 ?auto_458924 ) ) ( not ( = ?auto_458923 ?auto_458925 ) ) ( not ( = ?auto_458923 ?auto_458926 ) ) ( not ( = ?auto_458923 ?auto_458927 ) ) ( not ( = ?auto_458923 ?auto_458928 ) ) ( not ( = ?auto_458923 ?auto_458929 ) ) ( not ( = ?auto_458923 ?auto_458930 ) ) ( not ( = ?auto_458924 ?auto_458925 ) ) ( not ( = ?auto_458924 ?auto_458926 ) ) ( not ( = ?auto_458924 ?auto_458927 ) ) ( not ( = ?auto_458924 ?auto_458928 ) ) ( not ( = ?auto_458924 ?auto_458929 ) ) ( not ( = ?auto_458924 ?auto_458930 ) ) ( not ( = ?auto_458925 ?auto_458926 ) ) ( not ( = ?auto_458925 ?auto_458927 ) ) ( not ( = ?auto_458925 ?auto_458928 ) ) ( not ( = ?auto_458925 ?auto_458929 ) ) ( not ( = ?auto_458925 ?auto_458930 ) ) ( not ( = ?auto_458926 ?auto_458927 ) ) ( not ( = ?auto_458926 ?auto_458928 ) ) ( not ( = ?auto_458926 ?auto_458929 ) ) ( not ( = ?auto_458926 ?auto_458930 ) ) ( not ( = ?auto_458927 ?auto_458928 ) ) ( not ( = ?auto_458927 ?auto_458929 ) ) ( not ( = ?auto_458927 ?auto_458930 ) ) ( not ( = ?auto_458928 ?auto_458929 ) ) ( not ( = ?auto_458928 ?auto_458930 ) ) ( not ( = ?auto_458929 ?auto_458930 ) ) ( ON ?auto_458928 ?auto_458929 ) ( CLEAR ?auto_458926 ) ( ON ?auto_458927 ?auto_458928 ) ( CLEAR ?auto_458927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_458915 ?auto_458916 ?auto_458917 ?auto_458918 ?auto_458919 ?auto_458920 ?auto_458921 ?auto_458922 ?auto_458923 ?auto_458924 ?auto_458925 ?auto_458926 ?auto_458927 )
      ( MAKE-15PILE ?auto_458915 ?auto_458916 ?auto_458917 ?auto_458918 ?auto_458919 ?auto_458920 ?auto_458921 ?auto_458922 ?auto_458923 ?auto_458924 ?auto_458925 ?auto_458926 ?auto_458927 ?auto_458928 ?auto_458929 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_458946 - BLOCK
      ?auto_458947 - BLOCK
      ?auto_458948 - BLOCK
      ?auto_458949 - BLOCK
      ?auto_458950 - BLOCK
      ?auto_458951 - BLOCK
      ?auto_458952 - BLOCK
      ?auto_458953 - BLOCK
      ?auto_458954 - BLOCK
      ?auto_458955 - BLOCK
      ?auto_458956 - BLOCK
      ?auto_458957 - BLOCK
      ?auto_458958 - BLOCK
      ?auto_458959 - BLOCK
      ?auto_458960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_458960 ) ( ON-TABLE ?auto_458946 ) ( ON ?auto_458947 ?auto_458946 ) ( ON ?auto_458948 ?auto_458947 ) ( ON ?auto_458949 ?auto_458948 ) ( ON ?auto_458950 ?auto_458949 ) ( ON ?auto_458951 ?auto_458950 ) ( ON ?auto_458952 ?auto_458951 ) ( ON ?auto_458953 ?auto_458952 ) ( ON ?auto_458954 ?auto_458953 ) ( ON ?auto_458955 ?auto_458954 ) ( ON ?auto_458956 ?auto_458955 ) ( ON ?auto_458957 ?auto_458956 ) ( not ( = ?auto_458946 ?auto_458947 ) ) ( not ( = ?auto_458946 ?auto_458948 ) ) ( not ( = ?auto_458946 ?auto_458949 ) ) ( not ( = ?auto_458946 ?auto_458950 ) ) ( not ( = ?auto_458946 ?auto_458951 ) ) ( not ( = ?auto_458946 ?auto_458952 ) ) ( not ( = ?auto_458946 ?auto_458953 ) ) ( not ( = ?auto_458946 ?auto_458954 ) ) ( not ( = ?auto_458946 ?auto_458955 ) ) ( not ( = ?auto_458946 ?auto_458956 ) ) ( not ( = ?auto_458946 ?auto_458957 ) ) ( not ( = ?auto_458946 ?auto_458958 ) ) ( not ( = ?auto_458946 ?auto_458959 ) ) ( not ( = ?auto_458946 ?auto_458960 ) ) ( not ( = ?auto_458947 ?auto_458948 ) ) ( not ( = ?auto_458947 ?auto_458949 ) ) ( not ( = ?auto_458947 ?auto_458950 ) ) ( not ( = ?auto_458947 ?auto_458951 ) ) ( not ( = ?auto_458947 ?auto_458952 ) ) ( not ( = ?auto_458947 ?auto_458953 ) ) ( not ( = ?auto_458947 ?auto_458954 ) ) ( not ( = ?auto_458947 ?auto_458955 ) ) ( not ( = ?auto_458947 ?auto_458956 ) ) ( not ( = ?auto_458947 ?auto_458957 ) ) ( not ( = ?auto_458947 ?auto_458958 ) ) ( not ( = ?auto_458947 ?auto_458959 ) ) ( not ( = ?auto_458947 ?auto_458960 ) ) ( not ( = ?auto_458948 ?auto_458949 ) ) ( not ( = ?auto_458948 ?auto_458950 ) ) ( not ( = ?auto_458948 ?auto_458951 ) ) ( not ( = ?auto_458948 ?auto_458952 ) ) ( not ( = ?auto_458948 ?auto_458953 ) ) ( not ( = ?auto_458948 ?auto_458954 ) ) ( not ( = ?auto_458948 ?auto_458955 ) ) ( not ( = ?auto_458948 ?auto_458956 ) ) ( not ( = ?auto_458948 ?auto_458957 ) ) ( not ( = ?auto_458948 ?auto_458958 ) ) ( not ( = ?auto_458948 ?auto_458959 ) ) ( not ( = ?auto_458948 ?auto_458960 ) ) ( not ( = ?auto_458949 ?auto_458950 ) ) ( not ( = ?auto_458949 ?auto_458951 ) ) ( not ( = ?auto_458949 ?auto_458952 ) ) ( not ( = ?auto_458949 ?auto_458953 ) ) ( not ( = ?auto_458949 ?auto_458954 ) ) ( not ( = ?auto_458949 ?auto_458955 ) ) ( not ( = ?auto_458949 ?auto_458956 ) ) ( not ( = ?auto_458949 ?auto_458957 ) ) ( not ( = ?auto_458949 ?auto_458958 ) ) ( not ( = ?auto_458949 ?auto_458959 ) ) ( not ( = ?auto_458949 ?auto_458960 ) ) ( not ( = ?auto_458950 ?auto_458951 ) ) ( not ( = ?auto_458950 ?auto_458952 ) ) ( not ( = ?auto_458950 ?auto_458953 ) ) ( not ( = ?auto_458950 ?auto_458954 ) ) ( not ( = ?auto_458950 ?auto_458955 ) ) ( not ( = ?auto_458950 ?auto_458956 ) ) ( not ( = ?auto_458950 ?auto_458957 ) ) ( not ( = ?auto_458950 ?auto_458958 ) ) ( not ( = ?auto_458950 ?auto_458959 ) ) ( not ( = ?auto_458950 ?auto_458960 ) ) ( not ( = ?auto_458951 ?auto_458952 ) ) ( not ( = ?auto_458951 ?auto_458953 ) ) ( not ( = ?auto_458951 ?auto_458954 ) ) ( not ( = ?auto_458951 ?auto_458955 ) ) ( not ( = ?auto_458951 ?auto_458956 ) ) ( not ( = ?auto_458951 ?auto_458957 ) ) ( not ( = ?auto_458951 ?auto_458958 ) ) ( not ( = ?auto_458951 ?auto_458959 ) ) ( not ( = ?auto_458951 ?auto_458960 ) ) ( not ( = ?auto_458952 ?auto_458953 ) ) ( not ( = ?auto_458952 ?auto_458954 ) ) ( not ( = ?auto_458952 ?auto_458955 ) ) ( not ( = ?auto_458952 ?auto_458956 ) ) ( not ( = ?auto_458952 ?auto_458957 ) ) ( not ( = ?auto_458952 ?auto_458958 ) ) ( not ( = ?auto_458952 ?auto_458959 ) ) ( not ( = ?auto_458952 ?auto_458960 ) ) ( not ( = ?auto_458953 ?auto_458954 ) ) ( not ( = ?auto_458953 ?auto_458955 ) ) ( not ( = ?auto_458953 ?auto_458956 ) ) ( not ( = ?auto_458953 ?auto_458957 ) ) ( not ( = ?auto_458953 ?auto_458958 ) ) ( not ( = ?auto_458953 ?auto_458959 ) ) ( not ( = ?auto_458953 ?auto_458960 ) ) ( not ( = ?auto_458954 ?auto_458955 ) ) ( not ( = ?auto_458954 ?auto_458956 ) ) ( not ( = ?auto_458954 ?auto_458957 ) ) ( not ( = ?auto_458954 ?auto_458958 ) ) ( not ( = ?auto_458954 ?auto_458959 ) ) ( not ( = ?auto_458954 ?auto_458960 ) ) ( not ( = ?auto_458955 ?auto_458956 ) ) ( not ( = ?auto_458955 ?auto_458957 ) ) ( not ( = ?auto_458955 ?auto_458958 ) ) ( not ( = ?auto_458955 ?auto_458959 ) ) ( not ( = ?auto_458955 ?auto_458960 ) ) ( not ( = ?auto_458956 ?auto_458957 ) ) ( not ( = ?auto_458956 ?auto_458958 ) ) ( not ( = ?auto_458956 ?auto_458959 ) ) ( not ( = ?auto_458956 ?auto_458960 ) ) ( not ( = ?auto_458957 ?auto_458958 ) ) ( not ( = ?auto_458957 ?auto_458959 ) ) ( not ( = ?auto_458957 ?auto_458960 ) ) ( not ( = ?auto_458958 ?auto_458959 ) ) ( not ( = ?auto_458958 ?auto_458960 ) ) ( not ( = ?auto_458959 ?auto_458960 ) ) ( ON ?auto_458959 ?auto_458960 ) ( CLEAR ?auto_458957 ) ( ON ?auto_458958 ?auto_458959 ) ( CLEAR ?auto_458958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_458946 ?auto_458947 ?auto_458948 ?auto_458949 ?auto_458950 ?auto_458951 ?auto_458952 ?auto_458953 ?auto_458954 ?auto_458955 ?auto_458956 ?auto_458957 ?auto_458958 )
      ( MAKE-15PILE ?auto_458946 ?auto_458947 ?auto_458948 ?auto_458949 ?auto_458950 ?auto_458951 ?auto_458952 ?auto_458953 ?auto_458954 ?auto_458955 ?auto_458956 ?auto_458957 ?auto_458958 ?auto_458959 ?auto_458960 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_458976 - BLOCK
      ?auto_458977 - BLOCK
      ?auto_458978 - BLOCK
      ?auto_458979 - BLOCK
      ?auto_458980 - BLOCK
      ?auto_458981 - BLOCK
      ?auto_458982 - BLOCK
      ?auto_458983 - BLOCK
      ?auto_458984 - BLOCK
      ?auto_458985 - BLOCK
      ?auto_458986 - BLOCK
      ?auto_458987 - BLOCK
      ?auto_458988 - BLOCK
      ?auto_458989 - BLOCK
      ?auto_458990 - BLOCK
    )
    :vars
    (
      ?auto_458991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_458990 ?auto_458991 ) ( ON-TABLE ?auto_458976 ) ( ON ?auto_458977 ?auto_458976 ) ( ON ?auto_458978 ?auto_458977 ) ( ON ?auto_458979 ?auto_458978 ) ( ON ?auto_458980 ?auto_458979 ) ( ON ?auto_458981 ?auto_458980 ) ( ON ?auto_458982 ?auto_458981 ) ( ON ?auto_458983 ?auto_458982 ) ( ON ?auto_458984 ?auto_458983 ) ( ON ?auto_458985 ?auto_458984 ) ( ON ?auto_458986 ?auto_458985 ) ( not ( = ?auto_458976 ?auto_458977 ) ) ( not ( = ?auto_458976 ?auto_458978 ) ) ( not ( = ?auto_458976 ?auto_458979 ) ) ( not ( = ?auto_458976 ?auto_458980 ) ) ( not ( = ?auto_458976 ?auto_458981 ) ) ( not ( = ?auto_458976 ?auto_458982 ) ) ( not ( = ?auto_458976 ?auto_458983 ) ) ( not ( = ?auto_458976 ?auto_458984 ) ) ( not ( = ?auto_458976 ?auto_458985 ) ) ( not ( = ?auto_458976 ?auto_458986 ) ) ( not ( = ?auto_458976 ?auto_458987 ) ) ( not ( = ?auto_458976 ?auto_458988 ) ) ( not ( = ?auto_458976 ?auto_458989 ) ) ( not ( = ?auto_458976 ?auto_458990 ) ) ( not ( = ?auto_458976 ?auto_458991 ) ) ( not ( = ?auto_458977 ?auto_458978 ) ) ( not ( = ?auto_458977 ?auto_458979 ) ) ( not ( = ?auto_458977 ?auto_458980 ) ) ( not ( = ?auto_458977 ?auto_458981 ) ) ( not ( = ?auto_458977 ?auto_458982 ) ) ( not ( = ?auto_458977 ?auto_458983 ) ) ( not ( = ?auto_458977 ?auto_458984 ) ) ( not ( = ?auto_458977 ?auto_458985 ) ) ( not ( = ?auto_458977 ?auto_458986 ) ) ( not ( = ?auto_458977 ?auto_458987 ) ) ( not ( = ?auto_458977 ?auto_458988 ) ) ( not ( = ?auto_458977 ?auto_458989 ) ) ( not ( = ?auto_458977 ?auto_458990 ) ) ( not ( = ?auto_458977 ?auto_458991 ) ) ( not ( = ?auto_458978 ?auto_458979 ) ) ( not ( = ?auto_458978 ?auto_458980 ) ) ( not ( = ?auto_458978 ?auto_458981 ) ) ( not ( = ?auto_458978 ?auto_458982 ) ) ( not ( = ?auto_458978 ?auto_458983 ) ) ( not ( = ?auto_458978 ?auto_458984 ) ) ( not ( = ?auto_458978 ?auto_458985 ) ) ( not ( = ?auto_458978 ?auto_458986 ) ) ( not ( = ?auto_458978 ?auto_458987 ) ) ( not ( = ?auto_458978 ?auto_458988 ) ) ( not ( = ?auto_458978 ?auto_458989 ) ) ( not ( = ?auto_458978 ?auto_458990 ) ) ( not ( = ?auto_458978 ?auto_458991 ) ) ( not ( = ?auto_458979 ?auto_458980 ) ) ( not ( = ?auto_458979 ?auto_458981 ) ) ( not ( = ?auto_458979 ?auto_458982 ) ) ( not ( = ?auto_458979 ?auto_458983 ) ) ( not ( = ?auto_458979 ?auto_458984 ) ) ( not ( = ?auto_458979 ?auto_458985 ) ) ( not ( = ?auto_458979 ?auto_458986 ) ) ( not ( = ?auto_458979 ?auto_458987 ) ) ( not ( = ?auto_458979 ?auto_458988 ) ) ( not ( = ?auto_458979 ?auto_458989 ) ) ( not ( = ?auto_458979 ?auto_458990 ) ) ( not ( = ?auto_458979 ?auto_458991 ) ) ( not ( = ?auto_458980 ?auto_458981 ) ) ( not ( = ?auto_458980 ?auto_458982 ) ) ( not ( = ?auto_458980 ?auto_458983 ) ) ( not ( = ?auto_458980 ?auto_458984 ) ) ( not ( = ?auto_458980 ?auto_458985 ) ) ( not ( = ?auto_458980 ?auto_458986 ) ) ( not ( = ?auto_458980 ?auto_458987 ) ) ( not ( = ?auto_458980 ?auto_458988 ) ) ( not ( = ?auto_458980 ?auto_458989 ) ) ( not ( = ?auto_458980 ?auto_458990 ) ) ( not ( = ?auto_458980 ?auto_458991 ) ) ( not ( = ?auto_458981 ?auto_458982 ) ) ( not ( = ?auto_458981 ?auto_458983 ) ) ( not ( = ?auto_458981 ?auto_458984 ) ) ( not ( = ?auto_458981 ?auto_458985 ) ) ( not ( = ?auto_458981 ?auto_458986 ) ) ( not ( = ?auto_458981 ?auto_458987 ) ) ( not ( = ?auto_458981 ?auto_458988 ) ) ( not ( = ?auto_458981 ?auto_458989 ) ) ( not ( = ?auto_458981 ?auto_458990 ) ) ( not ( = ?auto_458981 ?auto_458991 ) ) ( not ( = ?auto_458982 ?auto_458983 ) ) ( not ( = ?auto_458982 ?auto_458984 ) ) ( not ( = ?auto_458982 ?auto_458985 ) ) ( not ( = ?auto_458982 ?auto_458986 ) ) ( not ( = ?auto_458982 ?auto_458987 ) ) ( not ( = ?auto_458982 ?auto_458988 ) ) ( not ( = ?auto_458982 ?auto_458989 ) ) ( not ( = ?auto_458982 ?auto_458990 ) ) ( not ( = ?auto_458982 ?auto_458991 ) ) ( not ( = ?auto_458983 ?auto_458984 ) ) ( not ( = ?auto_458983 ?auto_458985 ) ) ( not ( = ?auto_458983 ?auto_458986 ) ) ( not ( = ?auto_458983 ?auto_458987 ) ) ( not ( = ?auto_458983 ?auto_458988 ) ) ( not ( = ?auto_458983 ?auto_458989 ) ) ( not ( = ?auto_458983 ?auto_458990 ) ) ( not ( = ?auto_458983 ?auto_458991 ) ) ( not ( = ?auto_458984 ?auto_458985 ) ) ( not ( = ?auto_458984 ?auto_458986 ) ) ( not ( = ?auto_458984 ?auto_458987 ) ) ( not ( = ?auto_458984 ?auto_458988 ) ) ( not ( = ?auto_458984 ?auto_458989 ) ) ( not ( = ?auto_458984 ?auto_458990 ) ) ( not ( = ?auto_458984 ?auto_458991 ) ) ( not ( = ?auto_458985 ?auto_458986 ) ) ( not ( = ?auto_458985 ?auto_458987 ) ) ( not ( = ?auto_458985 ?auto_458988 ) ) ( not ( = ?auto_458985 ?auto_458989 ) ) ( not ( = ?auto_458985 ?auto_458990 ) ) ( not ( = ?auto_458985 ?auto_458991 ) ) ( not ( = ?auto_458986 ?auto_458987 ) ) ( not ( = ?auto_458986 ?auto_458988 ) ) ( not ( = ?auto_458986 ?auto_458989 ) ) ( not ( = ?auto_458986 ?auto_458990 ) ) ( not ( = ?auto_458986 ?auto_458991 ) ) ( not ( = ?auto_458987 ?auto_458988 ) ) ( not ( = ?auto_458987 ?auto_458989 ) ) ( not ( = ?auto_458987 ?auto_458990 ) ) ( not ( = ?auto_458987 ?auto_458991 ) ) ( not ( = ?auto_458988 ?auto_458989 ) ) ( not ( = ?auto_458988 ?auto_458990 ) ) ( not ( = ?auto_458988 ?auto_458991 ) ) ( not ( = ?auto_458989 ?auto_458990 ) ) ( not ( = ?auto_458989 ?auto_458991 ) ) ( not ( = ?auto_458990 ?auto_458991 ) ) ( ON ?auto_458989 ?auto_458990 ) ( ON ?auto_458988 ?auto_458989 ) ( CLEAR ?auto_458986 ) ( ON ?auto_458987 ?auto_458988 ) ( CLEAR ?auto_458987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_458976 ?auto_458977 ?auto_458978 ?auto_458979 ?auto_458980 ?auto_458981 ?auto_458982 ?auto_458983 ?auto_458984 ?auto_458985 ?auto_458986 ?auto_458987 )
      ( MAKE-15PILE ?auto_458976 ?auto_458977 ?auto_458978 ?auto_458979 ?auto_458980 ?auto_458981 ?auto_458982 ?auto_458983 ?auto_458984 ?auto_458985 ?auto_458986 ?auto_458987 ?auto_458988 ?auto_458989 ?auto_458990 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459007 - BLOCK
      ?auto_459008 - BLOCK
      ?auto_459009 - BLOCK
      ?auto_459010 - BLOCK
      ?auto_459011 - BLOCK
      ?auto_459012 - BLOCK
      ?auto_459013 - BLOCK
      ?auto_459014 - BLOCK
      ?auto_459015 - BLOCK
      ?auto_459016 - BLOCK
      ?auto_459017 - BLOCK
      ?auto_459018 - BLOCK
      ?auto_459019 - BLOCK
      ?auto_459020 - BLOCK
      ?auto_459021 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_459021 ) ( ON-TABLE ?auto_459007 ) ( ON ?auto_459008 ?auto_459007 ) ( ON ?auto_459009 ?auto_459008 ) ( ON ?auto_459010 ?auto_459009 ) ( ON ?auto_459011 ?auto_459010 ) ( ON ?auto_459012 ?auto_459011 ) ( ON ?auto_459013 ?auto_459012 ) ( ON ?auto_459014 ?auto_459013 ) ( ON ?auto_459015 ?auto_459014 ) ( ON ?auto_459016 ?auto_459015 ) ( ON ?auto_459017 ?auto_459016 ) ( not ( = ?auto_459007 ?auto_459008 ) ) ( not ( = ?auto_459007 ?auto_459009 ) ) ( not ( = ?auto_459007 ?auto_459010 ) ) ( not ( = ?auto_459007 ?auto_459011 ) ) ( not ( = ?auto_459007 ?auto_459012 ) ) ( not ( = ?auto_459007 ?auto_459013 ) ) ( not ( = ?auto_459007 ?auto_459014 ) ) ( not ( = ?auto_459007 ?auto_459015 ) ) ( not ( = ?auto_459007 ?auto_459016 ) ) ( not ( = ?auto_459007 ?auto_459017 ) ) ( not ( = ?auto_459007 ?auto_459018 ) ) ( not ( = ?auto_459007 ?auto_459019 ) ) ( not ( = ?auto_459007 ?auto_459020 ) ) ( not ( = ?auto_459007 ?auto_459021 ) ) ( not ( = ?auto_459008 ?auto_459009 ) ) ( not ( = ?auto_459008 ?auto_459010 ) ) ( not ( = ?auto_459008 ?auto_459011 ) ) ( not ( = ?auto_459008 ?auto_459012 ) ) ( not ( = ?auto_459008 ?auto_459013 ) ) ( not ( = ?auto_459008 ?auto_459014 ) ) ( not ( = ?auto_459008 ?auto_459015 ) ) ( not ( = ?auto_459008 ?auto_459016 ) ) ( not ( = ?auto_459008 ?auto_459017 ) ) ( not ( = ?auto_459008 ?auto_459018 ) ) ( not ( = ?auto_459008 ?auto_459019 ) ) ( not ( = ?auto_459008 ?auto_459020 ) ) ( not ( = ?auto_459008 ?auto_459021 ) ) ( not ( = ?auto_459009 ?auto_459010 ) ) ( not ( = ?auto_459009 ?auto_459011 ) ) ( not ( = ?auto_459009 ?auto_459012 ) ) ( not ( = ?auto_459009 ?auto_459013 ) ) ( not ( = ?auto_459009 ?auto_459014 ) ) ( not ( = ?auto_459009 ?auto_459015 ) ) ( not ( = ?auto_459009 ?auto_459016 ) ) ( not ( = ?auto_459009 ?auto_459017 ) ) ( not ( = ?auto_459009 ?auto_459018 ) ) ( not ( = ?auto_459009 ?auto_459019 ) ) ( not ( = ?auto_459009 ?auto_459020 ) ) ( not ( = ?auto_459009 ?auto_459021 ) ) ( not ( = ?auto_459010 ?auto_459011 ) ) ( not ( = ?auto_459010 ?auto_459012 ) ) ( not ( = ?auto_459010 ?auto_459013 ) ) ( not ( = ?auto_459010 ?auto_459014 ) ) ( not ( = ?auto_459010 ?auto_459015 ) ) ( not ( = ?auto_459010 ?auto_459016 ) ) ( not ( = ?auto_459010 ?auto_459017 ) ) ( not ( = ?auto_459010 ?auto_459018 ) ) ( not ( = ?auto_459010 ?auto_459019 ) ) ( not ( = ?auto_459010 ?auto_459020 ) ) ( not ( = ?auto_459010 ?auto_459021 ) ) ( not ( = ?auto_459011 ?auto_459012 ) ) ( not ( = ?auto_459011 ?auto_459013 ) ) ( not ( = ?auto_459011 ?auto_459014 ) ) ( not ( = ?auto_459011 ?auto_459015 ) ) ( not ( = ?auto_459011 ?auto_459016 ) ) ( not ( = ?auto_459011 ?auto_459017 ) ) ( not ( = ?auto_459011 ?auto_459018 ) ) ( not ( = ?auto_459011 ?auto_459019 ) ) ( not ( = ?auto_459011 ?auto_459020 ) ) ( not ( = ?auto_459011 ?auto_459021 ) ) ( not ( = ?auto_459012 ?auto_459013 ) ) ( not ( = ?auto_459012 ?auto_459014 ) ) ( not ( = ?auto_459012 ?auto_459015 ) ) ( not ( = ?auto_459012 ?auto_459016 ) ) ( not ( = ?auto_459012 ?auto_459017 ) ) ( not ( = ?auto_459012 ?auto_459018 ) ) ( not ( = ?auto_459012 ?auto_459019 ) ) ( not ( = ?auto_459012 ?auto_459020 ) ) ( not ( = ?auto_459012 ?auto_459021 ) ) ( not ( = ?auto_459013 ?auto_459014 ) ) ( not ( = ?auto_459013 ?auto_459015 ) ) ( not ( = ?auto_459013 ?auto_459016 ) ) ( not ( = ?auto_459013 ?auto_459017 ) ) ( not ( = ?auto_459013 ?auto_459018 ) ) ( not ( = ?auto_459013 ?auto_459019 ) ) ( not ( = ?auto_459013 ?auto_459020 ) ) ( not ( = ?auto_459013 ?auto_459021 ) ) ( not ( = ?auto_459014 ?auto_459015 ) ) ( not ( = ?auto_459014 ?auto_459016 ) ) ( not ( = ?auto_459014 ?auto_459017 ) ) ( not ( = ?auto_459014 ?auto_459018 ) ) ( not ( = ?auto_459014 ?auto_459019 ) ) ( not ( = ?auto_459014 ?auto_459020 ) ) ( not ( = ?auto_459014 ?auto_459021 ) ) ( not ( = ?auto_459015 ?auto_459016 ) ) ( not ( = ?auto_459015 ?auto_459017 ) ) ( not ( = ?auto_459015 ?auto_459018 ) ) ( not ( = ?auto_459015 ?auto_459019 ) ) ( not ( = ?auto_459015 ?auto_459020 ) ) ( not ( = ?auto_459015 ?auto_459021 ) ) ( not ( = ?auto_459016 ?auto_459017 ) ) ( not ( = ?auto_459016 ?auto_459018 ) ) ( not ( = ?auto_459016 ?auto_459019 ) ) ( not ( = ?auto_459016 ?auto_459020 ) ) ( not ( = ?auto_459016 ?auto_459021 ) ) ( not ( = ?auto_459017 ?auto_459018 ) ) ( not ( = ?auto_459017 ?auto_459019 ) ) ( not ( = ?auto_459017 ?auto_459020 ) ) ( not ( = ?auto_459017 ?auto_459021 ) ) ( not ( = ?auto_459018 ?auto_459019 ) ) ( not ( = ?auto_459018 ?auto_459020 ) ) ( not ( = ?auto_459018 ?auto_459021 ) ) ( not ( = ?auto_459019 ?auto_459020 ) ) ( not ( = ?auto_459019 ?auto_459021 ) ) ( not ( = ?auto_459020 ?auto_459021 ) ) ( ON ?auto_459020 ?auto_459021 ) ( ON ?auto_459019 ?auto_459020 ) ( CLEAR ?auto_459017 ) ( ON ?auto_459018 ?auto_459019 ) ( CLEAR ?auto_459018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_459007 ?auto_459008 ?auto_459009 ?auto_459010 ?auto_459011 ?auto_459012 ?auto_459013 ?auto_459014 ?auto_459015 ?auto_459016 ?auto_459017 ?auto_459018 )
      ( MAKE-15PILE ?auto_459007 ?auto_459008 ?auto_459009 ?auto_459010 ?auto_459011 ?auto_459012 ?auto_459013 ?auto_459014 ?auto_459015 ?auto_459016 ?auto_459017 ?auto_459018 ?auto_459019 ?auto_459020 ?auto_459021 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459037 - BLOCK
      ?auto_459038 - BLOCK
      ?auto_459039 - BLOCK
      ?auto_459040 - BLOCK
      ?auto_459041 - BLOCK
      ?auto_459042 - BLOCK
      ?auto_459043 - BLOCK
      ?auto_459044 - BLOCK
      ?auto_459045 - BLOCK
      ?auto_459046 - BLOCK
      ?auto_459047 - BLOCK
      ?auto_459048 - BLOCK
      ?auto_459049 - BLOCK
      ?auto_459050 - BLOCK
      ?auto_459051 - BLOCK
    )
    :vars
    (
      ?auto_459052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459051 ?auto_459052 ) ( ON-TABLE ?auto_459037 ) ( ON ?auto_459038 ?auto_459037 ) ( ON ?auto_459039 ?auto_459038 ) ( ON ?auto_459040 ?auto_459039 ) ( ON ?auto_459041 ?auto_459040 ) ( ON ?auto_459042 ?auto_459041 ) ( ON ?auto_459043 ?auto_459042 ) ( ON ?auto_459044 ?auto_459043 ) ( ON ?auto_459045 ?auto_459044 ) ( ON ?auto_459046 ?auto_459045 ) ( not ( = ?auto_459037 ?auto_459038 ) ) ( not ( = ?auto_459037 ?auto_459039 ) ) ( not ( = ?auto_459037 ?auto_459040 ) ) ( not ( = ?auto_459037 ?auto_459041 ) ) ( not ( = ?auto_459037 ?auto_459042 ) ) ( not ( = ?auto_459037 ?auto_459043 ) ) ( not ( = ?auto_459037 ?auto_459044 ) ) ( not ( = ?auto_459037 ?auto_459045 ) ) ( not ( = ?auto_459037 ?auto_459046 ) ) ( not ( = ?auto_459037 ?auto_459047 ) ) ( not ( = ?auto_459037 ?auto_459048 ) ) ( not ( = ?auto_459037 ?auto_459049 ) ) ( not ( = ?auto_459037 ?auto_459050 ) ) ( not ( = ?auto_459037 ?auto_459051 ) ) ( not ( = ?auto_459037 ?auto_459052 ) ) ( not ( = ?auto_459038 ?auto_459039 ) ) ( not ( = ?auto_459038 ?auto_459040 ) ) ( not ( = ?auto_459038 ?auto_459041 ) ) ( not ( = ?auto_459038 ?auto_459042 ) ) ( not ( = ?auto_459038 ?auto_459043 ) ) ( not ( = ?auto_459038 ?auto_459044 ) ) ( not ( = ?auto_459038 ?auto_459045 ) ) ( not ( = ?auto_459038 ?auto_459046 ) ) ( not ( = ?auto_459038 ?auto_459047 ) ) ( not ( = ?auto_459038 ?auto_459048 ) ) ( not ( = ?auto_459038 ?auto_459049 ) ) ( not ( = ?auto_459038 ?auto_459050 ) ) ( not ( = ?auto_459038 ?auto_459051 ) ) ( not ( = ?auto_459038 ?auto_459052 ) ) ( not ( = ?auto_459039 ?auto_459040 ) ) ( not ( = ?auto_459039 ?auto_459041 ) ) ( not ( = ?auto_459039 ?auto_459042 ) ) ( not ( = ?auto_459039 ?auto_459043 ) ) ( not ( = ?auto_459039 ?auto_459044 ) ) ( not ( = ?auto_459039 ?auto_459045 ) ) ( not ( = ?auto_459039 ?auto_459046 ) ) ( not ( = ?auto_459039 ?auto_459047 ) ) ( not ( = ?auto_459039 ?auto_459048 ) ) ( not ( = ?auto_459039 ?auto_459049 ) ) ( not ( = ?auto_459039 ?auto_459050 ) ) ( not ( = ?auto_459039 ?auto_459051 ) ) ( not ( = ?auto_459039 ?auto_459052 ) ) ( not ( = ?auto_459040 ?auto_459041 ) ) ( not ( = ?auto_459040 ?auto_459042 ) ) ( not ( = ?auto_459040 ?auto_459043 ) ) ( not ( = ?auto_459040 ?auto_459044 ) ) ( not ( = ?auto_459040 ?auto_459045 ) ) ( not ( = ?auto_459040 ?auto_459046 ) ) ( not ( = ?auto_459040 ?auto_459047 ) ) ( not ( = ?auto_459040 ?auto_459048 ) ) ( not ( = ?auto_459040 ?auto_459049 ) ) ( not ( = ?auto_459040 ?auto_459050 ) ) ( not ( = ?auto_459040 ?auto_459051 ) ) ( not ( = ?auto_459040 ?auto_459052 ) ) ( not ( = ?auto_459041 ?auto_459042 ) ) ( not ( = ?auto_459041 ?auto_459043 ) ) ( not ( = ?auto_459041 ?auto_459044 ) ) ( not ( = ?auto_459041 ?auto_459045 ) ) ( not ( = ?auto_459041 ?auto_459046 ) ) ( not ( = ?auto_459041 ?auto_459047 ) ) ( not ( = ?auto_459041 ?auto_459048 ) ) ( not ( = ?auto_459041 ?auto_459049 ) ) ( not ( = ?auto_459041 ?auto_459050 ) ) ( not ( = ?auto_459041 ?auto_459051 ) ) ( not ( = ?auto_459041 ?auto_459052 ) ) ( not ( = ?auto_459042 ?auto_459043 ) ) ( not ( = ?auto_459042 ?auto_459044 ) ) ( not ( = ?auto_459042 ?auto_459045 ) ) ( not ( = ?auto_459042 ?auto_459046 ) ) ( not ( = ?auto_459042 ?auto_459047 ) ) ( not ( = ?auto_459042 ?auto_459048 ) ) ( not ( = ?auto_459042 ?auto_459049 ) ) ( not ( = ?auto_459042 ?auto_459050 ) ) ( not ( = ?auto_459042 ?auto_459051 ) ) ( not ( = ?auto_459042 ?auto_459052 ) ) ( not ( = ?auto_459043 ?auto_459044 ) ) ( not ( = ?auto_459043 ?auto_459045 ) ) ( not ( = ?auto_459043 ?auto_459046 ) ) ( not ( = ?auto_459043 ?auto_459047 ) ) ( not ( = ?auto_459043 ?auto_459048 ) ) ( not ( = ?auto_459043 ?auto_459049 ) ) ( not ( = ?auto_459043 ?auto_459050 ) ) ( not ( = ?auto_459043 ?auto_459051 ) ) ( not ( = ?auto_459043 ?auto_459052 ) ) ( not ( = ?auto_459044 ?auto_459045 ) ) ( not ( = ?auto_459044 ?auto_459046 ) ) ( not ( = ?auto_459044 ?auto_459047 ) ) ( not ( = ?auto_459044 ?auto_459048 ) ) ( not ( = ?auto_459044 ?auto_459049 ) ) ( not ( = ?auto_459044 ?auto_459050 ) ) ( not ( = ?auto_459044 ?auto_459051 ) ) ( not ( = ?auto_459044 ?auto_459052 ) ) ( not ( = ?auto_459045 ?auto_459046 ) ) ( not ( = ?auto_459045 ?auto_459047 ) ) ( not ( = ?auto_459045 ?auto_459048 ) ) ( not ( = ?auto_459045 ?auto_459049 ) ) ( not ( = ?auto_459045 ?auto_459050 ) ) ( not ( = ?auto_459045 ?auto_459051 ) ) ( not ( = ?auto_459045 ?auto_459052 ) ) ( not ( = ?auto_459046 ?auto_459047 ) ) ( not ( = ?auto_459046 ?auto_459048 ) ) ( not ( = ?auto_459046 ?auto_459049 ) ) ( not ( = ?auto_459046 ?auto_459050 ) ) ( not ( = ?auto_459046 ?auto_459051 ) ) ( not ( = ?auto_459046 ?auto_459052 ) ) ( not ( = ?auto_459047 ?auto_459048 ) ) ( not ( = ?auto_459047 ?auto_459049 ) ) ( not ( = ?auto_459047 ?auto_459050 ) ) ( not ( = ?auto_459047 ?auto_459051 ) ) ( not ( = ?auto_459047 ?auto_459052 ) ) ( not ( = ?auto_459048 ?auto_459049 ) ) ( not ( = ?auto_459048 ?auto_459050 ) ) ( not ( = ?auto_459048 ?auto_459051 ) ) ( not ( = ?auto_459048 ?auto_459052 ) ) ( not ( = ?auto_459049 ?auto_459050 ) ) ( not ( = ?auto_459049 ?auto_459051 ) ) ( not ( = ?auto_459049 ?auto_459052 ) ) ( not ( = ?auto_459050 ?auto_459051 ) ) ( not ( = ?auto_459050 ?auto_459052 ) ) ( not ( = ?auto_459051 ?auto_459052 ) ) ( ON ?auto_459050 ?auto_459051 ) ( ON ?auto_459049 ?auto_459050 ) ( ON ?auto_459048 ?auto_459049 ) ( CLEAR ?auto_459046 ) ( ON ?auto_459047 ?auto_459048 ) ( CLEAR ?auto_459047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_459037 ?auto_459038 ?auto_459039 ?auto_459040 ?auto_459041 ?auto_459042 ?auto_459043 ?auto_459044 ?auto_459045 ?auto_459046 ?auto_459047 )
      ( MAKE-15PILE ?auto_459037 ?auto_459038 ?auto_459039 ?auto_459040 ?auto_459041 ?auto_459042 ?auto_459043 ?auto_459044 ?auto_459045 ?auto_459046 ?auto_459047 ?auto_459048 ?auto_459049 ?auto_459050 ?auto_459051 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459068 - BLOCK
      ?auto_459069 - BLOCK
      ?auto_459070 - BLOCK
      ?auto_459071 - BLOCK
      ?auto_459072 - BLOCK
      ?auto_459073 - BLOCK
      ?auto_459074 - BLOCK
      ?auto_459075 - BLOCK
      ?auto_459076 - BLOCK
      ?auto_459077 - BLOCK
      ?auto_459078 - BLOCK
      ?auto_459079 - BLOCK
      ?auto_459080 - BLOCK
      ?auto_459081 - BLOCK
      ?auto_459082 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_459082 ) ( ON-TABLE ?auto_459068 ) ( ON ?auto_459069 ?auto_459068 ) ( ON ?auto_459070 ?auto_459069 ) ( ON ?auto_459071 ?auto_459070 ) ( ON ?auto_459072 ?auto_459071 ) ( ON ?auto_459073 ?auto_459072 ) ( ON ?auto_459074 ?auto_459073 ) ( ON ?auto_459075 ?auto_459074 ) ( ON ?auto_459076 ?auto_459075 ) ( ON ?auto_459077 ?auto_459076 ) ( not ( = ?auto_459068 ?auto_459069 ) ) ( not ( = ?auto_459068 ?auto_459070 ) ) ( not ( = ?auto_459068 ?auto_459071 ) ) ( not ( = ?auto_459068 ?auto_459072 ) ) ( not ( = ?auto_459068 ?auto_459073 ) ) ( not ( = ?auto_459068 ?auto_459074 ) ) ( not ( = ?auto_459068 ?auto_459075 ) ) ( not ( = ?auto_459068 ?auto_459076 ) ) ( not ( = ?auto_459068 ?auto_459077 ) ) ( not ( = ?auto_459068 ?auto_459078 ) ) ( not ( = ?auto_459068 ?auto_459079 ) ) ( not ( = ?auto_459068 ?auto_459080 ) ) ( not ( = ?auto_459068 ?auto_459081 ) ) ( not ( = ?auto_459068 ?auto_459082 ) ) ( not ( = ?auto_459069 ?auto_459070 ) ) ( not ( = ?auto_459069 ?auto_459071 ) ) ( not ( = ?auto_459069 ?auto_459072 ) ) ( not ( = ?auto_459069 ?auto_459073 ) ) ( not ( = ?auto_459069 ?auto_459074 ) ) ( not ( = ?auto_459069 ?auto_459075 ) ) ( not ( = ?auto_459069 ?auto_459076 ) ) ( not ( = ?auto_459069 ?auto_459077 ) ) ( not ( = ?auto_459069 ?auto_459078 ) ) ( not ( = ?auto_459069 ?auto_459079 ) ) ( not ( = ?auto_459069 ?auto_459080 ) ) ( not ( = ?auto_459069 ?auto_459081 ) ) ( not ( = ?auto_459069 ?auto_459082 ) ) ( not ( = ?auto_459070 ?auto_459071 ) ) ( not ( = ?auto_459070 ?auto_459072 ) ) ( not ( = ?auto_459070 ?auto_459073 ) ) ( not ( = ?auto_459070 ?auto_459074 ) ) ( not ( = ?auto_459070 ?auto_459075 ) ) ( not ( = ?auto_459070 ?auto_459076 ) ) ( not ( = ?auto_459070 ?auto_459077 ) ) ( not ( = ?auto_459070 ?auto_459078 ) ) ( not ( = ?auto_459070 ?auto_459079 ) ) ( not ( = ?auto_459070 ?auto_459080 ) ) ( not ( = ?auto_459070 ?auto_459081 ) ) ( not ( = ?auto_459070 ?auto_459082 ) ) ( not ( = ?auto_459071 ?auto_459072 ) ) ( not ( = ?auto_459071 ?auto_459073 ) ) ( not ( = ?auto_459071 ?auto_459074 ) ) ( not ( = ?auto_459071 ?auto_459075 ) ) ( not ( = ?auto_459071 ?auto_459076 ) ) ( not ( = ?auto_459071 ?auto_459077 ) ) ( not ( = ?auto_459071 ?auto_459078 ) ) ( not ( = ?auto_459071 ?auto_459079 ) ) ( not ( = ?auto_459071 ?auto_459080 ) ) ( not ( = ?auto_459071 ?auto_459081 ) ) ( not ( = ?auto_459071 ?auto_459082 ) ) ( not ( = ?auto_459072 ?auto_459073 ) ) ( not ( = ?auto_459072 ?auto_459074 ) ) ( not ( = ?auto_459072 ?auto_459075 ) ) ( not ( = ?auto_459072 ?auto_459076 ) ) ( not ( = ?auto_459072 ?auto_459077 ) ) ( not ( = ?auto_459072 ?auto_459078 ) ) ( not ( = ?auto_459072 ?auto_459079 ) ) ( not ( = ?auto_459072 ?auto_459080 ) ) ( not ( = ?auto_459072 ?auto_459081 ) ) ( not ( = ?auto_459072 ?auto_459082 ) ) ( not ( = ?auto_459073 ?auto_459074 ) ) ( not ( = ?auto_459073 ?auto_459075 ) ) ( not ( = ?auto_459073 ?auto_459076 ) ) ( not ( = ?auto_459073 ?auto_459077 ) ) ( not ( = ?auto_459073 ?auto_459078 ) ) ( not ( = ?auto_459073 ?auto_459079 ) ) ( not ( = ?auto_459073 ?auto_459080 ) ) ( not ( = ?auto_459073 ?auto_459081 ) ) ( not ( = ?auto_459073 ?auto_459082 ) ) ( not ( = ?auto_459074 ?auto_459075 ) ) ( not ( = ?auto_459074 ?auto_459076 ) ) ( not ( = ?auto_459074 ?auto_459077 ) ) ( not ( = ?auto_459074 ?auto_459078 ) ) ( not ( = ?auto_459074 ?auto_459079 ) ) ( not ( = ?auto_459074 ?auto_459080 ) ) ( not ( = ?auto_459074 ?auto_459081 ) ) ( not ( = ?auto_459074 ?auto_459082 ) ) ( not ( = ?auto_459075 ?auto_459076 ) ) ( not ( = ?auto_459075 ?auto_459077 ) ) ( not ( = ?auto_459075 ?auto_459078 ) ) ( not ( = ?auto_459075 ?auto_459079 ) ) ( not ( = ?auto_459075 ?auto_459080 ) ) ( not ( = ?auto_459075 ?auto_459081 ) ) ( not ( = ?auto_459075 ?auto_459082 ) ) ( not ( = ?auto_459076 ?auto_459077 ) ) ( not ( = ?auto_459076 ?auto_459078 ) ) ( not ( = ?auto_459076 ?auto_459079 ) ) ( not ( = ?auto_459076 ?auto_459080 ) ) ( not ( = ?auto_459076 ?auto_459081 ) ) ( not ( = ?auto_459076 ?auto_459082 ) ) ( not ( = ?auto_459077 ?auto_459078 ) ) ( not ( = ?auto_459077 ?auto_459079 ) ) ( not ( = ?auto_459077 ?auto_459080 ) ) ( not ( = ?auto_459077 ?auto_459081 ) ) ( not ( = ?auto_459077 ?auto_459082 ) ) ( not ( = ?auto_459078 ?auto_459079 ) ) ( not ( = ?auto_459078 ?auto_459080 ) ) ( not ( = ?auto_459078 ?auto_459081 ) ) ( not ( = ?auto_459078 ?auto_459082 ) ) ( not ( = ?auto_459079 ?auto_459080 ) ) ( not ( = ?auto_459079 ?auto_459081 ) ) ( not ( = ?auto_459079 ?auto_459082 ) ) ( not ( = ?auto_459080 ?auto_459081 ) ) ( not ( = ?auto_459080 ?auto_459082 ) ) ( not ( = ?auto_459081 ?auto_459082 ) ) ( ON ?auto_459081 ?auto_459082 ) ( ON ?auto_459080 ?auto_459081 ) ( ON ?auto_459079 ?auto_459080 ) ( CLEAR ?auto_459077 ) ( ON ?auto_459078 ?auto_459079 ) ( CLEAR ?auto_459078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_459068 ?auto_459069 ?auto_459070 ?auto_459071 ?auto_459072 ?auto_459073 ?auto_459074 ?auto_459075 ?auto_459076 ?auto_459077 ?auto_459078 )
      ( MAKE-15PILE ?auto_459068 ?auto_459069 ?auto_459070 ?auto_459071 ?auto_459072 ?auto_459073 ?auto_459074 ?auto_459075 ?auto_459076 ?auto_459077 ?auto_459078 ?auto_459079 ?auto_459080 ?auto_459081 ?auto_459082 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459098 - BLOCK
      ?auto_459099 - BLOCK
      ?auto_459100 - BLOCK
      ?auto_459101 - BLOCK
      ?auto_459102 - BLOCK
      ?auto_459103 - BLOCK
      ?auto_459104 - BLOCK
      ?auto_459105 - BLOCK
      ?auto_459106 - BLOCK
      ?auto_459107 - BLOCK
      ?auto_459108 - BLOCK
      ?auto_459109 - BLOCK
      ?auto_459110 - BLOCK
      ?auto_459111 - BLOCK
      ?auto_459112 - BLOCK
    )
    :vars
    (
      ?auto_459113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459112 ?auto_459113 ) ( ON-TABLE ?auto_459098 ) ( ON ?auto_459099 ?auto_459098 ) ( ON ?auto_459100 ?auto_459099 ) ( ON ?auto_459101 ?auto_459100 ) ( ON ?auto_459102 ?auto_459101 ) ( ON ?auto_459103 ?auto_459102 ) ( ON ?auto_459104 ?auto_459103 ) ( ON ?auto_459105 ?auto_459104 ) ( ON ?auto_459106 ?auto_459105 ) ( not ( = ?auto_459098 ?auto_459099 ) ) ( not ( = ?auto_459098 ?auto_459100 ) ) ( not ( = ?auto_459098 ?auto_459101 ) ) ( not ( = ?auto_459098 ?auto_459102 ) ) ( not ( = ?auto_459098 ?auto_459103 ) ) ( not ( = ?auto_459098 ?auto_459104 ) ) ( not ( = ?auto_459098 ?auto_459105 ) ) ( not ( = ?auto_459098 ?auto_459106 ) ) ( not ( = ?auto_459098 ?auto_459107 ) ) ( not ( = ?auto_459098 ?auto_459108 ) ) ( not ( = ?auto_459098 ?auto_459109 ) ) ( not ( = ?auto_459098 ?auto_459110 ) ) ( not ( = ?auto_459098 ?auto_459111 ) ) ( not ( = ?auto_459098 ?auto_459112 ) ) ( not ( = ?auto_459098 ?auto_459113 ) ) ( not ( = ?auto_459099 ?auto_459100 ) ) ( not ( = ?auto_459099 ?auto_459101 ) ) ( not ( = ?auto_459099 ?auto_459102 ) ) ( not ( = ?auto_459099 ?auto_459103 ) ) ( not ( = ?auto_459099 ?auto_459104 ) ) ( not ( = ?auto_459099 ?auto_459105 ) ) ( not ( = ?auto_459099 ?auto_459106 ) ) ( not ( = ?auto_459099 ?auto_459107 ) ) ( not ( = ?auto_459099 ?auto_459108 ) ) ( not ( = ?auto_459099 ?auto_459109 ) ) ( not ( = ?auto_459099 ?auto_459110 ) ) ( not ( = ?auto_459099 ?auto_459111 ) ) ( not ( = ?auto_459099 ?auto_459112 ) ) ( not ( = ?auto_459099 ?auto_459113 ) ) ( not ( = ?auto_459100 ?auto_459101 ) ) ( not ( = ?auto_459100 ?auto_459102 ) ) ( not ( = ?auto_459100 ?auto_459103 ) ) ( not ( = ?auto_459100 ?auto_459104 ) ) ( not ( = ?auto_459100 ?auto_459105 ) ) ( not ( = ?auto_459100 ?auto_459106 ) ) ( not ( = ?auto_459100 ?auto_459107 ) ) ( not ( = ?auto_459100 ?auto_459108 ) ) ( not ( = ?auto_459100 ?auto_459109 ) ) ( not ( = ?auto_459100 ?auto_459110 ) ) ( not ( = ?auto_459100 ?auto_459111 ) ) ( not ( = ?auto_459100 ?auto_459112 ) ) ( not ( = ?auto_459100 ?auto_459113 ) ) ( not ( = ?auto_459101 ?auto_459102 ) ) ( not ( = ?auto_459101 ?auto_459103 ) ) ( not ( = ?auto_459101 ?auto_459104 ) ) ( not ( = ?auto_459101 ?auto_459105 ) ) ( not ( = ?auto_459101 ?auto_459106 ) ) ( not ( = ?auto_459101 ?auto_459107 ) ) ( not ( = ?auto_459101 ?auto_459108 ) ) ( not ( = ?auto_459101 ?auto_459109 ) ) ( not ( = ?auto_459101 ?auto_459110 ) ) ( not ( = ?auto_459101 ?auto_459111 ) ) ( not ( = ?auto_459101 ?auto_459112 ) ) ( not ( = ?auto_459101 ?auto_459113 ) ) ( not ( = ?auto_459102 ?auto_459103 ) ) ( not ( = ?auto_459102 ?auto_459104 ) ) ( not ( = ?auto_459102 ?auto_459105 ) ) ( not ( = ?auto_459102 ?auto_459106 ) ) ( not ( = ?auto_459102 ?auto_459107 ) ) ( not ( = ?auto_459102 ?auto_459108 ) ) ( not ( = ?auto_459102 ?auto_459109 ) ) ( not ( = ?auto_459102 ?auto_459110 ) ) ( not ( = ?auto_459102 ?auto_459111 ) ) ( not ( = ?auto_459102 ?auto_459112 ) ) ( not ( = ?auto_459102 ?auto_459113 ) ) ( not ( = ?auto_459103 ?auto_459104 ) ) ( not ( = ?auto_459103 ?auto_459105 ) ) ( not ( = ?auto_459103 ?auto_459106 ) ) ( not ( = ?auto_459103 ?auto_459107 ) ) ( not ( = ?auto_459103 ?auto_459108 ) ) ( not ( = ?auto_459103 ?auto_459109 ) ) ( not ( = ?auto_459103 ?auto_459110 ) ) ( not ( = ?auto_459103 ?auto_459111 ) ) ( not ( = ?auto_459103 ?auto_459112 ) ) ( not ( = ?auto_459103 ?auto_459113 ) ) ( not ( = ?auto_459104 ?auto_459105 ) ) ( not ( = ?auto_459104 ?auto_459106 ) ) ( not ( = ?auto_459104 ?auto_459107 ) ) ( not ( = ?auto_459104 ?auto_459108 ) ) ( not ( = ?auto_459104 ?auto_459109 ) ) ( not ( = ?auto_459104 ?auto_459110 ) ) ( not ( = ?auto_459104 ?auto_459111 ) ) ( not ( = ?auto_459104 ?auto_459112 ) ) ( not ( = ?auto_459104 ?auto_459113 ) ) ( not ( = ?auto_459105 ?auto_459106 ) ) ( not ( = ?auto_459105 ?auto_459107 ) ) ( not ( = ?auto_459105 ?auto_459108 ) ) ( not ( = ?auto_459105 ?auto_459109 ) ) ( not ( = ?auto_459105 ?auto_459110 ) ) ( not ( = ?auto_459105 ?auto_459111 ) ) ( not ( = ?auto_459105 ?auto_459112 ) ) ( not ( = ?auto_459105 ?auto_459113 ) ) ( not ( = ?auto_459106 ?auto_459107 ) ) ( not ( = ?auto_459106 ?auto_459108 ) ) ( not ( = ?auto_459106 ?auto_459109 ) ) ( not ( = ?auto_459106 ?auto_459110 ) ) ( not ( = ?auto_459106 ?auto_459111 ) ) ( not ( = ?auto_459106 ?auto_459112 ) ) ( not ( = ?auto_459106 ?auto_459113 ) ) ( not ( = ?auto_459107 ?auto_459108 ) ) ( not ( = ?auto_459107 ?auto_459109 ) ) ( not ( = ?auto_459107 ?auto_459110 ) ) ( not ( = ?auto_459107 ?auto_459111 ) ) ( not ( = ?auto_459107 ?auto_459112 ) ) ( not ( = ?auto_459107 ?auto_459113 ) ) ( not ( = ?auto_459108 ?auto_459109 ) ) ( not ( = ?auto_459108 ?auto_459110 ) ) ( not ( = ?auto_459108 ?auto_459111 ) ) ( not ( = ?auto_459108 ?auto_459112 ) ) ( not ( = ?auto_459108 ?auto_459113 ) ) ( not ( = ?auto_459109 ?auto_459110 ) ) ( not ( = ?auto_459109 ?auto_459111 ) ) ( not ( = ?auto_459109 ?auto_459112 ) ) ( not ( = ?auto_459109 ?auto_459113 ) ) ( not ( = ?auto_459110 ?auto_459111 ) ) ( not ( = ?auto_459110 ?auto_459112 ) ) ( not ( = ?auto_459110 ?auto_459113 ) ) ( not ( = ?auto_459111 ?auto_459112 ) ) ( not ( = ?auto_459111 ?auto_459113 ) ) ( not ( = ?auto_459112 ?auto_459113 ) ) ( ON ?auto_459111 ?auto_459112 ) ( ON ?auto_459110 ?auto_459111 ) ( ON ?auto_459109 ?auto_459110 ) ( ON ?auto_459108 ?auto_459109 ) ( CLEAR ?auto_459106 ) ( ON ?auto_459107 ?auto_459108 ) ( CLEAR ?auto_459107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_459098 ?auto_459099 ?auto_459100 ?auto_459101 ?auto_459102 ?auto_459103 ?auto_459104 ?auto_459105 ?auto_459106 ?auto_459107 )
      ( MAKE-15PILE ?auto_459098 ?auto_459099 ?auto_459100 ?auto_459101 ?auto_459102 ?auto_459103 ?auto_459104 ?auto_459105 ?auto_459106 ?auto_459107 ?auto_459108 ?auto_459109 ?auto_459110 ?auto_459111 ?auto_459112 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459129 - BLOCK
      ?auto_459130 - BLOCK
      ?auto_459131 - BLOCK
      ?auto_459132 - BLOCK
      ?auto_459133 - BLOCK
      ?auto_459134 - BLOCK
      ?auto_459135 - BLOCK
      ?auto_459136 - BLOCK
      ?auto_459137 - BLOCK
      ?auto_459138 - BLOCK
      ?auto_459139 - BLOCK
      ?auto_459140 - BLOCK
      ?auto_459141 - BLOCK
      ?auto_459142 - BLOCK
      ?auto_459143 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_459143 ) ( ON-TABLE ?auto_459129 ) ( ON ?auto_459130 ?auto_459129 ) ( ON ?auto_459131 ?auto_459130 ) ( ON ?auto_459132 ?auto_459131 ) ( ON ?auto_459133 ?auto_459132 ) ( ON ?auto_459134 ?auto_459133 ) ( ON ?auto_459135 ?auto_459134 ) ( ON ?auto_459136 ?auto_459135 ) ( ON ?auto_459137 ?auto_459136 ) ( not ( = ?auto_459129 ?auto_459130 ) ) ( not ( = ?auto_459129 ?auto_459131 ) ) ( not ( = ?auto_459129 ?auto_459132 ) ) ( not ( = ?auto_459129 ?auto_459133 ) ) ( not ( = ?auto_459129 ?auto_459134 ) ) ( not ( = ?auto_459129 ?auto_459135 ) ) ( not ( = ?auto_459129 ?auto_459136 ) ) ( not ( = ?auto_459129 ?auto_459137 ) ) ( not ( = ?auto_459129 ?auto_459138 ) ) ( not ( = ?auto_459129 ?auto_459139 ) ) ( not ( = ?auto_459129 ?auto_459140 ) ) ( not ( = ?auto_459129 ?auto_459141 ) ) ( not ( = ?auto_459129 ?auto_459142 ) ) ( not ( = ?auto_459129 ?auto_459143 ) ) ( not ( = ?auto_459130 ?auto_459131 ) ) ( not ( = ?auto_459130 ?auto_459132 ) ) ( not ( = ?auto_459130 ?auto_459133 ) ) ( not ( = ?auto_459130 ?auto_459134 ) ) ( not ( = ?auto_459130 ?auto_459135 ) ) ( not ( = ?auto_459130 ?auto_459136 ) ) ( not ( = ?auto_459130 ?auto_459137 ) ) ( not ( = ?auto_459130 ?auto_459138 ) ) ( not ( = ?auto_459130 ?auto_459139 ) ) ( not ( = ?auto_459130 ?auto_459140 ) ) ( not ( = ?auto_459130 ?auto_459141 ) ) ( not ( = ?auto_459130 ?auto_459142 ) ) ( not ( = ?auto_459130 ?auto_459143 ) ) ( not ( = ?auto_459131 ?auto_459132 ) ) ( not ( = ?auto_459131 ?auto_459133 ) ) ( not ( = ?auto_459131 ?auto_459134 ) ) ( not ( = ?auto_459131 ?auto_459135 ) ) ( not ( = ?auto_459131 ?auto_459136 ) ) ( not ( = ?auto_459131 ?auto_459137 ) ) ( not ( = ?auto_459131 ?auto_459138 ) ) ( not ( = ?auto_459131 ?auto_459139 ) ) ( not ( = ?auto_459131 ?auto_459140 ) ) ( not ( = ?auto_459131 ?auto_459141 ) ) ( not ( = ?auto_459131 ?auto_459142 ) ) ( not ( = ?auto_459131 ?auto_459143 ) ) ( not ( = ?auto_459132 ?auto_459133 ) ) ( not ( = ?auto_459132 ?auto_459134 ) ) ( not ( = ?auto_459132 ?auto_459135 ) ) ( not ( = ?auto_459132 ?auto_459136 ) ) ( not ( = ?auto_459132 ?auto_459137 ) ) ( not ( = ?auto_459132 ?auto_459138 ) ) ( not ( = ?auto_459132 ?auto_459139 ) ) ( not ( = ?auto_459132 ?auto_459140 ) ) ( not ( = ?auto_459132 ?auto_459141 ) ) ( not ( = ?auto_459132 ?auto_459142 ) ) ( not ( = ?auto_459132 ?auto_459143 ) ) ( not ( = ?auto_459133 ?auto_459134 ) ) ( not ( = ?auto_459133 ?auto_459135 ) ) ( not ( = ?auto_459133 ?auto_459136 ) ) ( not ( = ?auto_459133 ?auto_459137 ) ) ( not ( = ?auto_459133 ?auto_459138 ) ) ( not ( = ?auto_459133 ?auto_459139 ) ) ( not ( = ?auto_459133 ?auto_459140 ) ) ( not ( = ?auto_459133 ?auto_459141 ) ) ( not ( = ?auto_459133 ?auto_459142 ) ) ( not ( = ?auto_459133 ?auto_459143 ) ) ( not ( = ?auto_459134 ?auto_459135 ) ) ( not ( = ?auto_459134 ?auto_459136 ) ) ( not ( = ?auto_459134 ?auto_459137 ) ) ( not ( = ?auto_459134 ?auto_459138 ) ) ( not ( = ?auto_459134 ?auto_459139 ) ) ( not ( = ?auto_459134 ?auto_459140 ) ) ( not ( = ?auto_459134 ?auto_459141 ) ) ( not ( = ?auto_459134 ?auto_459142 ) ) ( not ( = ?auto_459134 ?auto_459143 ) ) ( not ( = ?auto_459135 ?auto_459136 ) ) ( not ( = ?auto_459135 ?auto_459137 ) ) ( not ( = ?auto_459135 ?auto_459138 ) ) ( not ( = ?auto_459135 ?auto_459139 ) ) ( not ( = ?auto_459135 ?auto_459140 ) ) ( not ( = ?auto_459135 ?auto_459141 ) ) ( not ( = ?auto_459135 ?auto_459142 ) ) ( not ( = ?auto_459135 ?auto_459143 ) ) ( not ( = ?auto_459136 ?auto_459137 ) ) ( not ( = ?auto_459136 ?auto_459138 ) ) ( not ( = ?auto_459136 ?auto_459139 ) ) ( not ( = ?auto_459136 ?auto_459140 ) ) ( not ( = ?auto_459136 ?auto_459141 ) ) ( not ( = ?auto_459136 ?auto_459142 ) ) ( not ( = ?auto_459136 ?auto_459143 ) ) ( not ( = ?auto_459137 ?auto_459138 ) ) ( not ( = ?auto_459137 ?auto_459139 ) ) ( not ( = ?auto_459137 ?auto_459140 ) ) ( not ( = ?auto_459137 ?auto_459141 ) ) ( not ( = ?auto_459137 ?auto_459142 ) ) ( not ( = ?auto_459137 ?auto_459143 ) ) ( not ( = ?auto_459138 ?auto_459139 ) ) ( not ( = ?auto_459138 ?auto_459140 ) ) ( not ( = ?auto_459138 ?auto_459141 ) ) ( not ( = ?auto_459138 ?auto_459142 ) ) ( not ( = ?auto_459138 ?auto_459143 ) ) ( not ( = ?auto_459139 ?auto_459140 ) ) ( not ( = ?auto_459139 ?auto_459141 ) ) ( not ( = ?auto_459139 ?auto_459142 ) ) ( not ( = ?auto_459139 ?auto_459143 ) ) ( not ( = ?auto_459140 ?auto_459141 ) ) ( not ( = ?auto_459140 ?auto_459142 ) ) ( not ( = ?auto_459140 ?auto_459143 ) ) ( not ( = ?auto_459141 ?auto_459142 ) ) ( not ( = ?auto_459141 ?auto_459143 ) ) ( not ( = ?auto_459142 ?auto_459143 ) ) ( ON ?auto_459142 ?auto_459143 ) ( ON ?auto_459141 ?auto_459142 ) ( ON ?auto_459140 ?auto_459141 ) ( ON ?auto_459139 ?auto_459140 ) ( CLEAR ?auto_459137 ) ( ON ?auto_459138 ?auto_459139 ) ( CLEAR ?auto_459138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_459129 ?auto_459130 ?auto_459131 ?auto_459132 ?auto_459133 ?auto_459134 ?auto_459135 ?auto_459136 ?auto_459137 ?auto_459138 )
      ( MAKE-15PILE ?auto_459129 ?auto_459130 ?auto_459131 ?auto_459132 ?auto_459133 ?auto_459134 ?auto_459135 ?auto_459136 ?auto_459137 ?auto_459138 ?auto_459139 ?auto_459140 ?auto_459141 ?auto_459142 ?auto_459143 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459159 - BLOCK
      ?auto_459160 - BLOCK
      ?auto_459161 - BLOCK
      ?auto_459162 - BLOCK
      ?auto_459163 - BLOCK
      ?auto_459164 - BLOCK
      ?auto_459165 - BLOCK
      ?auto_459166 - BLOCK
      ?auto_459167 - BLOCK
      ?auto_459168 - BLOCK
      ?auto_459169 - BLOCK
      ?auto_459170 - BLOCK
      ?auto_459171 - BLOCK
      ?auto_459172 - BLOCK
      ?auto_459173 - BLOCK
    )
    :vars
    (
      ?auto_459174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459173 ?auto_459174 ) ( ON-TABLE ?auto_459159 ) ( ON ?auto_459160 ?auto_459159 ) ( ON ?auto_459161 ?auto_459160 ) ( ON ?auto_459162 ?auto_459161 ) ( ON ?auto_459163 ?auto_459162 ) ( ON ?auto_459164 ?auto_459163 ) ( ON ?auto_459165 ?auto_459164 ) ( ON ?auto_459166 ?auto_459165 ) ( not ( = ?auto_459159 ?auto_459160 ) ) ( not ( = ?auto_459159 ?auto_459161 ) ) ( not ( = ?auto_459159 ?auto_459162 ) ) ( not ( = ?auto_459159 ?auto_459163 ) ) ( not ( = ?auto_459159 ?auto_459164 ) ) ( not ( = ?auto_459159 ?auto_459165 ) ) ( not ( = ?auto_459159 ?auto_459166 ) ) ( not ( = ?auto_459159 ?auto_459167 ) ) ( not ( = ?auto_459159 ?auto_459168 ) ) ( not ( = ?auto_459159 ?auto_459169 ) ) ( not ( = ?auto_459159 ?auto_459170 ) ) ( not ( = ?auto_459159 ?auto_459171 ) ) ( not ( = ?auto_459159 ?auto_459172 ) ) ( not ( = ?auto_459159 ?auto_459173 ) ) ( not ( = ?auto_459159 ?auto_459174 ) ) ( not ( = ?auto_459160 ?auto_459161 ) ) ( not ( = ?auto_459160 ?auto_459162 ) ) ( not ( = ?auto_459160 ?auto_459163 ) ) ( not ( = ?auto_459160 ?auto_459164 ) ) ( not ( = ?auto_459160 ?auto_459165 ) ) ( not ( = ?auto_459160 ?auto_459166 ) ) ( not ( = ?auto_459160 ?auto_459167 ) ) ( not ( = ?auto_459160 ?auto_459168 ) ) ( not ( = ?auto_459160 ?auto_459169 ) ) ( not ( = ?auto_459160 ?auto_459170 ) ) ( not ( = ?auto_459160 ?auto_459171 ) ) ( not ( = ?auto_459160 ?auto_459172 ) ) ( not ( = ?auto_459160 ?auto_459173 ) ) ( not ( = ?auto_459160 ?auto_459174 ) ) ( not ( = ?auto_459161 ?auto_459162 ) ) ( not ( = ?auto_459161 ?auto_459163 ) ) ( not ( = ?auto_459161 ?auto_459164 ) ) ( not ( = ?auto_459161 ?auto_459165 ) ) ( not ( = ?auto_459161 ?auto_459166 ) ) ( not ( = ?auto_459161 ?auto_459167 ) ) ( not ( = ?auto_459161 ?auto_459168 ) ) ( not ( = ?auto_459161 ?auto_459169 ) ) ( not ( = ?auto_459161 ?auto_459170 ) ) ( not ( = ?auto_459161 ?auto_459171 ) ) ( not ( = ?auto_459161 ?auto_459172 ) ) ( not ( = ?auto_459161 ?auto_459173 ) ) ( not ( = ?auto_459161 ?auto_459174 ) ) ( not ( = ?auto_459162 ?auto_459163 ) ) ( not ( = ?auto_459162 ?auto_459164 ) ) ( not ( = ?auto_459162 ?auto_459165 ) ) ( not ( = ?auto_459162 ?auto_459166 ) ) ( not ( = ?auto_459162 ?auto_459167 ) ) ( not ( = ?auto_459162 ?auto_459168 ) ) ( not ( = ?auto_459162 ?auto_459169 ) ) ( not ( = ?auto_459162 ?auto_459170 ) ) ( not ( = ?auto_459162 ?auto_459171 ) ) ( not ( = ?auto_459162 ?auto_459172 ) ) ( not ( = ?auto_459162 ?auto_459173 ) ) ( not ( = ?auto_459162 ?auto_459174 ) ) ( not ( = ?auto_459163 ?auto_459164 ) ) ( not ( = ?auto_459163 ?auto_459165 ) ) ( not ( = ?auto_459163 ?auto_459166 ) ) ( not ( = ?auto_459163 ?auto_459167 ) ) ( not ( = ?auto_459163 ?auto_459168 ) ) ( not ( = ?auto_459163 ?auto_459169 ) ) ( not ( = ?auto_459163 ?auto_459170 ) ) ( not ( = ?auto_459163 ?auto_459171 ) ) ( not ( = ?auto_459163 ?auto_459172 ) ) ( not ( = ?auto_459163 ?auto_459173 ) ) ( not ( = ?auto_459163 ?auto_459174 ) ) ( not ( = ?auto_459164 ?auto_459165 ) ) ( not ( = ?auto_459164 ?auto_459166 ) ) ( not ( = ?auto_459164 ?auto_459167 ) ) ( not ( = ?auto_459164 ?auto_459168 ) ) ( not ( = ?auto_459164 ?auto_459169 ) ) ( not ( = ?auto_459164 ?auto_459170 ) ) ( not ( = ?auto_459164 ?auto_459171 ) ) ( not ( = ?auto_459164 ?auto_459172 ) ) ( not ( = ?auto_459164 ?auto_459173 ) ) ( not ( = ?auto_459164 ?auto_459174 ) ) ( not ( = ?auto_459165 ?auto_459166 ) ) ( not ( = ?auto_459165 ?auto_459167 ) ) ( not ( = ?auto_459165 ?auto_459168 ) ) ( not ( = ?auto_459165 ?auto_459169 ) ) ( not ( = ?auto_459165 ?auto_459170 ) ) ( not ( = ?auto_459165 ?auto_459171 ) ) ( not ( = ?auto_459165 ?auto_459172 ) ) ( not ( = ?auto_459165 ?auto_459173 ) ) ( not ( = ?auto_459165 ?auto_459174 ) ) ( not ( = ?auto_459166 ?auto_459167 ) ) ( not ( = ?auto_459166 ?auto_459168 ) ) ( not ( = ?auto_459166 ?auto_459169 ) ) ( not ( = ?auto_459166 ?auto_459170 ) ) ( not ( = ?auto_459166 ?auto_459171 ) ) ( not ( = ?auto_459166 ?auto_459172 ) ) ( not ( = ?auto_459166 ?auto_459173 ) ) ( not ( = ?auto_459166 ?auto_459174 ) ) ( not ( = ?auto_459167 ?auto_459168 ) ) ( not ( = ?auto_459167 ?auto_459169 ) ) ( not ( = ?auto_459167 ?auto_459170 ) ) ( not ( = ?auto_459167 ?auto_459171 ) ) ( not ( = ?auto_459167 ?auto_459172 ) ) ( not ( = ?auto_459167 ?auto_459173 ) ) ( not ( = ?auto_459167 ?auto_459174 ) ) ( not ( = ?auto_459168 ?auto_459169 ) ) ( not ( = ?auto_459168 ?auto_459170 ) ) ( not ( = ?auto_459168 ?auto_459171 ) ) ( not ( = ?auto_459168 ?auto_459172 ) ) ( not ( = ?auto_459168 ?auto_459173 ) ) ( not ( = ?auto_459168 ?auto_459174 ) ) ( not ( = ?auto_459169 ?auto_459170 ) ) ( not ( = ?auto_459169 ?auto_459171 ) ) ( not ( = ?auto_459169 ?auto_459172 ) ) ( not ( = ?auto_459169 ?auto_459173 ) ) ( not ( = ?auto_459169 ?auto_459174 ) ) ( not ( = ?auto_459170 ?auto_459171 ) ) ( not ( = ?auto_459170 ?auto_459172 ) ) ( not ( = ?auto_459170 ?auto_459173 ) ) ( not ( = ?auto_459170 ?auto_459174 ) ) ( not ( = ?auto_459171 ?auto_459172 ) ) ( not ( = ?auto_459171 ?auto_459173 ) ) ( not ( = ?auto_459171 ?auto_459174 ) ) ( not ( = ?auto_459172 ?auto_459173 ) ) ( not ( = ?auto_459172 ?auto_459174 ) ) ( not ( = ?auto_459173 ?auto_459174 ) ) ( ON ?auto_459172 ?auto_459173 ) ( ON ?auto_459171 ?auto_459172 ) ( ON ?auto_459170 ?auto_459171 ) ( ON ?auto_459169 ?auto_459170 ) ( ON ?auto_459168 ?auto_459169 ) ( CLEAR ?auto_459166 ) ( ON ?auto_459167 ?auto_459168 ) ( CLEAR ?auto_459167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_459159 ?auto_459160 ?auto_459161 ?auto_459162 ?auto_459163 ?auto_459164 ?auto_459165 ?auto_459166 ?auto_459167 )
      ( MAKE-15PILE ?auto_459159 ?auto_459160 ?auto_459161 ?auto_459162 ?auto_459163 ?auto_459164 ?auto_459165 ?auto_459166 ?auto_459167 ?auto_459168 ?auto_459169 ?auto_459170 ?auto_459171 ?auto_459172 ?auto_459173 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459190 - BLOCK
      ?auto_459191 - BLOCK
      ?auto_459192 - BLOCK
      ?auto_459193 - BLOCK
      ?auto_459194 - BLOCK
      ?auto_459195 - BLOCK
      ?auto_459196 - BLOCK
      ?auto_459197 - BLOCK
      ?auto_459198 - BLOCK
      ?auto_459199 - BLOCK
      ?auto_459200 - BLOCK
      ?auto_459201 - BLOCK
      ?auto_459202 - BLOCK
      ?auto_459203 - BLOCK
      ?auto_459204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_459204 ) ( ON-TABLE ?auto_459190 ) ( ON ?auto_459191 ?auto_459190 ) ( ON ?auto_459192 ?auto_459191 ) ( ON ?auto_459193 ?auto_459192 ) ( ON ?auto_459194 ?auto_459193 ) ( ON ?auto_459195 ?auto_459194 ) ( ON ?auto_459196 ?auto_459195 ) ( ON ?auto_459197 ?auto_459196 ) ( not ( = ?auto_459190 ?auto_459191 ) ) ( not ( = ?auto_459190 ?auto_459192 ) ) ( not ( = ?auto_459190 ?auto_459193 ) ) ( not ( = ?auto_459190 ?auto_459194 ) ) ( not ( = ?auto_459190 ?auto_459195 ) ) ( not ( = ?auto_459190 ?auto_459196 ) ) ( not ( = ?auto_459190 ?auto_459197 ) ) ( not ( = ?auto_459190 ?auto_459198 ) ) ( not ( = ?auto_459190 ?auto_459199 ) ) ( not ( = ?auto_459190 ?auto_459200 ) ) ( not ( = ?auto_459190 ?auto_459201 ) ) ( not ( = ?auto_459190 ?auto_459202 ) ) ( not ( = ?auto_459190 ?auto_459203 ) ) ( not ( = ?auto_459190 ?auto_459204 ) ) ( not ( = ?auto_459191 ?auto_459192 ) ) ( not ( = ?auto_459191 ?auto_459193 ) ) ( not ( = ?auto_459191 ?auto_459194 ) ) ( not ( = ?auto_459191 ?auto_459195 ) ) ( not ( = ?auto_459191 ?auto_459196 ) ) ( not ( = ?auto_459191 ?auto_459197 ) ) ( not ( = ?auto_459191 ?auto_459198 ) ) ( not ( = ?auto_459191 ?auto_459199 ) ) ( not ( = ?auto_459191 ?auto_459200 ) ) ( not ( = ?auto_459191 ?auto_459201 ) ) ( not ( = ?auto_459191 ?auto_459202 ) ) ( not ( = ?auto_459191 ?auto_459203 ) ) ( not ( = ?auto_459191 ?auto_459204 ) ) ( not ( = ?auto_459192 ?auto_459193 ) ) ( not ( = ?auto_459192 ?auto_459194 ) ) ( not ( = ?auto_459192 ?auto_459195 ) ) ( not ( = ?auto_459192 ?auto_459196 ) ) ( not ( = ?auto_459192 ?auto_459197 ) ) ( not ( = ?auto_459192 ?auto_459198 ) ) ( not ( = ?auto_459192 ?auto_459199 ) ) ( not ( = ?auto_459192 ?auto_459200 ) ) ( not ( = ?auto_459192 ?auto_459201 ) ) ( not ( = ?auto_459192 ?auto_459202 ) ) ( not ( = ?auto_459192 ?auto_459203 ) ) ( not ( = ?auto_459192 ?auto_459204 ) ) ( not ( = ?auto_459193 ?auto_459194 ) ) ( not ( = ?auto_459193 ?auto_459195 ) ) ( not ( = ?auto_459193 ?auto_459196 ) ) ( not ( = ?auto_459193 ?auto_459197 ) ) ( not ( = ?auto_459193 ?auto_459198 ) ) ( not ( = ?auto_459193 ?auto_459199 ) ) ( not ( = ?auto_459193 ?auto_459200 ) ) ( not ( = ?auto_459193 ?auto_459201 ) ) ( not ( = ?auto_459193 ?auto_459202 ) ) ( not ( = ?auto_459193 ?auto_459203 ) ) ( not ( = ?auto_459193 ?auto_459204 ) ) ( not ( = ?auto_459194 ?auto_459195 ) ) ( not ( = ?auto_459194 ?auto_459196 ) ) ( not ( = ?auto_459194 ?auto_459197 ) ) ( not ( = ?auto_459194 ?auto_459198 ) ) ( not ( = ?auto_459194 ?auto_459199 ) ) ( not ( = ?auto_459194 ?auto_459200 ) ) ( not ( = ?auto_459194 ?auto_459201 ) ) ( not ( = ?auto_459194 ?auto_459202 ) ) ( not ( = ?auto_459194 ?auto_459203 ) ) ( not ( = ?auto_459194 ?auto_459204 ) ) ( not ( = ?auto_459195 ?auto_459196 ) ) ( not ( = ?auto_459195 ?auto_459197 ) ) ( not ( = ?auto_459195 ?auto_459198 ) ) ( not ( = ?auto_459195 ?auto_459199 ) ) ( not ( = ?auto_459195 ?auto_459200 ) ) ( not ( = ?auto_459195 ?auto_459201 ) ) ( not ( = ?auto_459195 ?auto_459202 ) ) ( not ( = ?auto_459195 ?auto_459203 ) ) ( not ( = ?auto_459195 ?auto_459204 ) ) ( not ( = ?auto_459196 ?auto_459197 ) ) ( not ( = ?auto_459196 ?auto_459198 ) ) ( not ( = ?auto_459196 ?auto_459199 ) ) ( not ( = ?auto_459196 ?auto_459200 ) ) ( not ( = ?auto_459196 ?auto_459201 ) ) ( not ( = ?auto_459196 ?auto_459202 ) ) ( not ( = ?auto_459196 ?auto_459203 ) ) ( not ( = ?auto_459196 ?auto_459204 ) ) ( not ( = ?auto_459197 ?auto_459198 ) ) ( not ( = ?auto_459197 ?auto_459199 ) ) ( not ( = ?auto_459197 ?auto_459200 ) ) ( not ( = ?auto_459197 ?auto_459201 ) ) ( not ( = ?auto_459197 ?auto_459202 ) ) ( not ( = ?auto_459197 ?auto_459203 ) ) ( not ( = ?auto_459197 ?auto_459204 ) ) ( not ( = ?auto_459198 ?auto_459199 ) ) ( not ( = ?auto_459198 ?auto_459200 ) ) ( not ( = ?auto_459198 ?auto_459201 ) ) ( not ( = ?auto_459198 ?auto_459202 ) ) ( not ( = ?auto_459198 ?auto_459203 ) ) ( not ( = ?auto_459198 ?auto_459204 ) ) ( not ( = ?auto_459199 ?auto_459200 ) ) ( not ( = ?auto_459199 ?auto_459201 ) ) ( not ( = ?auto_459199 ?auto_459202 ) ) ( not ( = ?auto_459199 ?auto_459203 ) ) ( not ( = ?auto_459199 ?auto_459204 ) ) ( not ( = ?auto_459200 ?auto_459201 ) ) ( not ( = ?auto_459200 ?auto_459202 ) ) ( not ( = ?auto_459200 ?auto_459203 ) ) ( not ( = ?auto_459200 ?auto_459204 ) ) ( not ( = ?auto_459201 ?auto_459202 ) ) ( not ( = ?auto_459201 ?auto_459203 ) ) ( not ( = ?auto_459201 ?auto_459204 ) ) ( not ( = ?auto_459202 ?auto_459203 ) ) ( not ( = ?auto_459202 ?auto_459204 ) ) ( not ( = ?auto_459203 ?auto_459204 ) ) ( ON ?auto_459203 ?auto_459204 ) ( ON ?auto_459202 ?auto_459203 ) ( ON ?auto_459201 ?auto_459202 ) ( ON ?auto_459200 ?auto_459201 ) ( ON ?auto_459199 ?auto_459200 ) ( CLEAR ?auto_459197 ) ( ON ?auto_459198 ?auto_459199 ) ( CLEAR ?auto_459198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_459190 ?auto_459191 ?auto_459192 ?auto_459193 ?auto_459194 ?auto_459195 ?auto_459196 ?auto_459197 ?auto_459198 )
      ( MAKE-15PILE ?auto_459190 ?auto_459191 ?auto_459192 ?auto_459193 ?auto_459194 ?auto_459195 ?auto_459196 ?auto_459197 ?auto_459198 ?auto_459199 ?auto_459200 ?auto_459201 ?auto_459202 ?auto_459203 ?auto_459204 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459220 - BLOCK
      ?auto_459221 - BLOCK
      ?auto_459222 - BLOCK
      ?auto_459223 - BLOCK
      ?auto_459224 - BLOCK
      ?auto_459225 - BLOCK
      ?auto_459226 - BLOCK
      ?auto_459227 - BLOCK
      ?auto_459228 - BLOCK
      ?auto_459229 - BLOCK
      ?auto_459230 - BLOCK
      ?auto_459231 - BLOCK
      ?auto_459232 - BLOCK
      ?auto_459233 - BLOCK
      ?auto_459234 - BLOCK
    )
    :vars
    (
      ?auto_459235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459234 ?auto_459235 ) ( ON-TABLE ?auto_459220 ) ( ON ?auto_459221 ?auto_459220 ) ( ON ?auto_459222 ?auto_459221 ) ( ON ?auto_459223 ?auto_459222 ) ( ON ?auto_459224 ?auto_459223 ) ( ON ?auto_459225 ?auto_459224 ) ( ON ?auto_459226 ?auto_459225 ) ( not ( = ?auto_459220 ?auto_459221 ) ) ( not ( = ?auto_459220 ?auto_459222 ) ) ( not ( = ?auto_459220 ?auto_459223 ) ) ( not ( = ?auto_459220 ?auto_459224 ) ) ( not ( = ?auto_459220 ?auto_459225 ) ) ( not ( = ?auto_459220 ?auto_459226 ) ) ( not ( = ?auto_459220 ?auto_459227 ) ) ( not ( = ?auto_459220 ?auto_459228 ) ) ( not ( = ?auto_459220 ?auto_459229 ) ) ( not ( = ?auto_459220 ?auto_459230 ) ) ( not ( = ?auto_459220 ?auto_459231 ) ) ( not ( = ?auto_459220 ?auto_459232 ) ) ( not ( = ?auto_459220 ?auto_459233 ) ) ( not ( = ?auto_459220 ?auto_459234 ) ) ( not ( = ?auto_459220 ?auto_459235 ) ) ( not ( = ?auto_459221 ?auto_459222 ) ) ( not ( = ?auto_459221 ?auto_459223 ) ) ( not ( = ?auto_459221 ?auto_459224 ) ) ( not ( = ?auto_459221 ?auto_459225 ) ) ( not ( = ?auto_459221 ?auto_459226 ) ) ( not ( = ?auto_459221 ?auto_459227 ) ) ( not ( = ?auto_459221 ?auto_459228 ) ) ( not ( = ?auto_459221 ?auto_459229 ) ) ( not ( = ?auto_459221 ?auto_459230 ) ) ( not ( = ?auto_459221 ?auto_459231 ) ) ( not ( = ?auto_459221 ?auto_459232 ) ) ( not ( = ?auto_459221 ?auto_459233 ) ) ( not ( = ?auto_459221 ?auto_459234 ) ) ( not ( = ?auto_459221 ?auto_459235 ) ) ( not ( = ?auto_459222 ?auto_459223 ) ) ( not ( = ?auto_459222 ?auto_459224 ) ) ( not ( = ?auto_459222 ?auto_459225 ) ) ( not ( = ?auto_459222 ?auto_459226 ) ) ( not ( = ?auto_459222 ?auto_459227 ) ) ( not ( = ?auto_459222 ?auto_459228 ) ) ( not ( = ?auto_459222 ?auto_459229 ) ) ( not ( = ?auto_459222 ?auto_459230 ) ) ( not ( = ?auto_459222 ?auto_459231 ) ) ( not ( = ?auto_459222 ?auto_459232 ) ) ( not ( = ?auto_459222 ?auto_459233 ) ) ( not ( = ?auto_459222 ?auto_459234 ) ) ( not ( = ?auto_459222 ?auto_459235 ) ) ( not ( = ?auto_459223 ?auto_459224 ) ) ( not ( = ?auto_459223 ?auto_459225 ) ) ( not ( = ?auto_459223 ?auto_459226 ) ) ( not ( = ?auto_459223 ?auto_459227 ) ) ( not ( = ?auto_459223 ?auto_459228 ) ) ( not ( = ?auto_459223 ?auto_459229 ) ) ( not ( = ?auto_459223 ?auto_459230 ) ) ( not ( = ?auto_459223 ?auto_459231 ) ) ( not ( = ?auto_459223 ?auto_459232 ) ) ( not ( = ?auto_459223 ?auto_459233 ) ) ( not ( = ?auto_459223 ?auto_459234 ) ) ( not ( = ?auto_459223 ?auto_459235 ) ) ( not ( = ?auto_459224 ?auto_459225 ) ) ( not ( = ?auto_459224 ?auto_459226 ) ) ( not ( = ?auto_459224 ?auto_459227 ) ) ( not ( = ?auto_459224 ?auto_459228 ) ) ( not ( = ?auto_459224 ?auto_459229 ) ) ( not ( = ?auto_459224 ?auto_459230 ) ) ( not ( = ?auto_459224 ?auto_459231 ) ) ( not ( = ?auto_459224 ?auto_459232 ) ) ( not ( = ?auto_459224 ?auto_459233 ) ) ( not ( = ?auto_459224 ?auto_459234 ) ) ( not ( = ?auto_459224 ?auto_459235 ) ) ( not ( = ?auto_459225 ?auto_459226 ) ) ( not ( = ?auto_459225 ?auto_459227 ) ) ( not ( = ?auto_459225 ?auto_459228 ) ) ( not ( = ?auto_459225 ?auto_459229 ) ) ( not ( = ?auto_459225 ?auto_459230 ) ) ( not ( = ?auto_459225 ?auto_459231 ) ) ( not ( = ?auto_459225 ?auto_459232 ) ) ( not ( = ?auto_459225 ?auto_459233 ) ) ( not ( = ?auto_459225 ?auto_459234 ) ) ( not ( = ?auto_459225 ?auto_459235 ) ) ( not ( = ?auto_459226 ?auto_459227 ) ) ( not ( = ?auto_459226 ?auto_459228 ) ) ( not ( = ?auto_459226 ?auto_459229 ) ) ( not ( = ?auto_459226 ?auto_459230 ) ) ( not ( = ?auto_459226 ?auto_459231 ) ) ( not ( = ?auto_459226 ?auto_459232 ) ) ( not ( = ?auto_459226 ?auto_459233 ) ) ( not ( = ?auto_459226 ?auto_459234 ) ) ( not ( = ?auto_459226 ?auto_459235 ) ) ( not ( = ?auto_459227 ?auto_459228 ) ) ( not ( = ?auto_459227 ?auto_459229 ) ) ( not ( = ?auto_459227 ?auto_459230 ) ) ( not ( = ?auto_459227 ?auto_459231 ) ) ( not ( = ?auto_459227 ?auto_459232 ) ) ( not ( = ?auto_459227 ?auto_459233 ) ) ( not ( = ?auto_459227 ?auto_459234 ) ) ( not ( = ?auto_459227 ?auto_459235 ) ) ( not ( = ?auto_459228 ?auto_459229 ) ) ( not ( = ?auto_459228 ?auto_459230 ) ) ( not ( = ?auto_459228 ?auto_459231 ) ) ( not ( = ?auto_459228 ?auto_459232 ) ) ( not ( = ?auto_459228 ?auto_459233 ) ) ( not ( = ?auto_459228 ?auto_459234 ) ) ( not ( = ?auto_459228 ?auto_459235 ) ) ( not ( = ?auto_459229 ?auto_459230 ) ) ( not ( = ?auto_459229 ?auto_459231 ) ) ( not ( = ?auto_459229 ?auto_459232 ) ) ( not ( = ?auto_459229 ?auto_459233 ) ) ( not ( = ?auto_459229 ?auto_459234 ) ) ( not ( = ?auto_459229 ?auto_459235 ) ) ( not ( = ?auto_459230 ?auto_459231 ) ) ( not ( = ?auto_459230 ?auto_459232 ) ) ( not ( = ?auto_459230 ?auto_459233 ) ) ( not ( = ?auto_459230 ?auto_459234 ) ) ( not ( = ?auto_459230 ?auto_459235 ) ) ( not ( = ?auto_459231 ?auto_459232 ) ) ( not ( = ?auto_459231 ?auto_459233 ) ) ( not ( = ?auto_459231 ?auto_459234 ) ) ( not ( = ?auto_459231 ?auto_459235 ) ) ( not ( = ?auto_459232 ?auto_459233 ) ) ( not ( = ?auto_459232 ?auto_459234 ) ) ( not ( = ?auto_459232 ?auto_459235 ) ) ( not ( = ?auto_459233 ?auto_459234 ) ) ( not ( = ?auto_459233 ?auto_459235 ) ) ( not ( = ?auto_459234 ?auto_459235 ) ) ( ON ?auto_459233 ?auto_459234 ) ( ON ?auto_459232 ?auto_459233 ) ( ON ?auto_459231 ?auto_459232 ) ( ON ?auto_459230 ?auto_459231 ) ( ON ?auto_459229 ?auto_459230 ) ( ON ?auto_459228 ?auto_459229 ) ( CLEAR ?auto_459226 ) ( ON ?auto_459227 ?auto_459228 ) ( CLEAR ?auto_459227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_459220 ?auto_459221 ?auto_459222 ?auto_459223 ?auto_459224 ?auto_459225 ?auto_459226 ?auto_459227 )
      ( MAKE-15PILE ?auto_459220 ?auto_459221 ?auto_459222 ?auto_459223 ?auto_459224 ?auto_459225 ?auto_459226 ?auto_459227 ?auto_459228 ?auto_459229 ?auto_459230 ?auto_459231 ?auto_459232 ?auto_459233 ?auto_459234 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459251 - BLOCK
      ?auto_459252 - BLOCK
      ?auto_459253 - BLOCK
      ?auto_459254 - BLOCK
      ?auto_459255 - BLOCK
      ?auto_459256 - BLOCK
      ?auto_459257 - BLOCK
      ?auto_459258 - BLOCK
      ?auto_459259 - BLOCK
      ?auto_459260 - BLOCK
      ?auto_459261 - BLOCK
      ?auto_459262 - BLOCK
      ?auto_459263 - BLOCK
      ?auto_459264 - BLOCK
      ?auto_459265 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_459265 ) ( ON-TABLE ?auto_459251 ) ( ON ?auto_459252 ?auto_459251 ) ( ON ?auto_459253 ?auto_459252 ) ( ON ?auto_459254 ?auto_459253 ) ( ON ?auto_459255 ?auto_459254 ) ( ON ?auto_459256 ?auto_459255 ) ( ON ?auto_459257 ?auto_459256 ) ( not ( = ?auto_459251 ?auto_459252 ) ) ( not ( = ?auto_459251 ?auto_459253 ) ) ( not ( = ?auto_459251 ?auto_459254 ) ) ( not ( = ?auto_459251 ?auto_459255 ) ) ( not ( = ?auto_459251 ?auto_459256 ) ) ( not ( = ?auto_459251 ?auto_459257 ) ) ( not ( = ?auto_459251 ?auto_459258 ) ) ( not ( = ?auto_459251 ?auto_459259 ) ) ( not ( = ?auto_459251 ?auto_459260 ) ) ( not ( = ?auto_459251 ?auto_459261 ) ) ( not ( = ?auto_459251 ?auto_459262 ) ) ( not ( = ?auto_459251 ?auto_459263 ) ) ( not ( = ?auto_459251 ?auto_459264 ) ) ( not ( = ?auto_459251 ?auto_459265 ) ) ( not ( = ?auto_459252 ?auto_459253 ) ) ( not ( = ?auto_459252 ?auto_459254 ) ) ( not ( = ?auto_459252 ?auto_459255 ) ) ( not ( = ?auto_459252 ?auto_459256 ) ) ( not ( = ?auto_459252 ?auto_459257 ) ) ( not ( = ?auto_459252 ?auto_459258 ) ) ( not ( = ?auto_459252 ?auto_459259 ) ) ( not ( = ?auto_459252 ?auto_459260 ) ) ( not ( = ?auto_459252 ?auto_459261 ) ) ( not ( = ?auto_459252 ?auto_459262 ) ) ( not ( = ?auto_459252 ?auto_459263 ) ) ( not ( = ?auto_459252 ?auto_459264 ) ) ( not ( = ?auto_459252 ?auto_459265 ) ) ( not ( = ?auto_459253 ?auto_459254 ) ) ( not ( = ?auto_459253 ?auto_459255 ) ) ( not ( = ?auto_459253 ?auto_459256 ) ) ( not ( = ?auto_459253 ?auto_459257 ) ) ( not ( = ?auto_459253 ?auto_459258 ) ) ( not ( = ?auto_459253 ?auto_459259 ) ) ( not ( = ?auto_459253 ?auto_459260 ) ) ( not ( = ?auto_459253 ?auto_459261 ) ) ( not ( = ?auto_459253 ?auto_459262 ) ) ( not ( = ?auto_459253 ?auto_459263 ) ) ( not ( = ?auto_459253 ?auto_459264 ) ) ( not ( = ?auto_459253 ?auto_459265 ) ) ( not ( = ?auto_459254 ?auto_459255 ) ) ( not ( = ?auto_459254 ?auto_459256 ) ) ( not ( = ?auto_459254 ?auto_459257 ) ) ( not ( = ?auto_459254 ?auto_459258 ) ) ( not ( = ?auto_459254 ?auto_459259 ) ) ( not ( = ?auto_459254 ?auto_459260 ) ) ( not ( = ?auto_459254 ?auto_459261 ) ) ( not ( = ?auto_459254 ?auto_459262 ) ) ( not ( = ?auto_459254 ?auto_459263 ) ) ( not ( = ?auto_459254 ?auto_459264 ) ) ( not ( = ?auto_459254 ?auto_459265 ) ) ( not ( = ?auto_459255 ?auto_459256 ) ) ( not ( = ?auto_459255 ?auto_459257 ) ) ( not ( = ?auto_459255 ?auto_459258 ) ) ( not ( = ?auto_459255 ?auto_459259 ) ) ( not ( = ?auto_459255 ?auto_459260 ) ) ( not ( = ?auto_459255 ?auto_459261 ) ) ( not ( = ?auto_459255 ?auto_459262 ) ) ( not ( = ?auto_459255 ?auto_459263 ) ) ( not ( = ?auto_459255 ?auto_459264 ) ) ( not ( = ?auto_459255 ?auto_459265 ) ) ( not ( = ?auto_459256 ?auto_459257 ) ) ( not ( = ?auto_459256 ?auto_459258 ) ) ( not ( = ?auto_459256 ?auto_459259 ) ) ( not ( = ?auto_459256 ?auto_459260 ) ) ( not ( = ?auto_459256 ?auto_459261 ) ) ( not ( = ?auto_459256 ?auto_459262 ) ) ( not ( = ?auto_459256 ?auto_459263 ) ) ( not ( = ?auto_459256 ?auto_459264 ) ) ( not ( = ?auto_459256 ?auto_459265 ) ) ( not ( = ?auto_459257 ?auto_459258 ) ) ( not ( = ?auto_459257 ?auto_459259 ) ) ( not ( = ?auto_459257 ?auto_459260 ) ) ( not ( = ?auto_459257 ?auto_459261 ) ) ( not ( = ?auto_459257 ?auto_459262 ) ) ( not ( = ?auto_459257 ?auto_459263 ) ) ( not ( = ?auto_459257 ?auto_459264 ) ) ( not ( = ?auto_459257 ?auto_459265 ) ) ( not ( = ?auto_459258 ?auto_459259 ) ) ( not ( = ?auto_459258 ?auto_459260 ) ) ( not ( = ?auto_459258 ?auto_459261 ) ) ( not ( = ?auto_459258 ?auto_459262 ) ) ( not ( = ?auto_459258 ?auto_459263 ) ) ( not ( = ?auto_459258 ?auto_459264 ) ) ( not ( = ?auto_459258 ?auto_459265 ) ) ( not ( = ?auto_459259 ?auto_459260 ) ) ( not ( = ?auto_459259 ?auto_459261 ) ) ( not ( = ?auto_459259 ?auto_459262 ) ) ( not ( = ?auto_459259 ?auto_459263 ) ) ( not ( = ?auto_459259 ?auto_459264 ) ) ( not ( = ?auto_459259 ?auto_459265 ) ) ( not ( = ?auto_459260 ?auto_459261 ) ) ( not ( = ?auto_459260 ?auto_459262 ) ) ( not ( = ?auto_459260 ?auto_459263 ) ) ( not ( = ?auto_459260 ?auto_459264 ) ) ( not ( = ?auto_459260 ?auto_459265 ) ) ( not ( = ?auto_459261 ?auto_459262 ) ) ( not ( = ?auto_459261 ?auto_459263 ) ) ( not ( = ?auto_459261 ?auto_459264 ) ) ( not ( = ?auto_459261 ?auto_459265 ) ) ( not ( = ?auto_459262 ?auto_459263 ) ) ( not ( = ?auto_459262 ?auto_459264 ) ) ( not ( = ?auto_459262 ?auto_459265 ) ) ( not ( = ?auto_459263 ?auto_459264 ) ) ( not ( = ?auto_459263 ?auto_459265 ) ) ( not ( = ?auto_459264 ?auto_459265 ) ) ( ON ?auto_459264 ?auto_459265 ) ( ON ?auto_459263 ?auto_459264 ) ( ON ?auto_459262 ?auto_459263 ) ( ON ?auto_459261 ?auto_459262 ) ( ON ?auto_459260 ?auto_459261 ) ( ON ?auto_459259 ?auto_459260 ) ( CLEAR ?auto_459257 ) ( ON ?auto_459258 ?auto_459259 ) ( CLEAR ?auto_459258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_459251 ?auto_459252 ?auto_459253 ?auto_459254 ?auto_459255 ?auto_459256 ?auto_459257 ?auto_459258 )
      ( MAKE-15PILE ?auto_459251 ?auto_459252 ?auto_459253 ?auto_459254 ?auto_459255 ?auto_459256 ?auto_459257 ?auto_459258 ?auto_459259 ?auto_459260 ?auto_459261 ?auto_459262 ?auto_459263 ?auto_459264 ?auto_459265 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459281 - BLOCK
      ?auto_459282 - BLOCK
      ?auto_459283 - BLOCK
      ?auto_459284 - BLOCK
      ?auto_459285 - BLOCK
      ?auto_459286 - BLOCK
      ?auto_459287 - BLOCK
      ?auto_459288 - BLOCK
      ?auto_459289 - BLOCK
      ?auto_459290 - BLOCK
      ?auto_459291 - BLOCK
      ?auto_459292 - BLOCK
      ?auto_459293 - BLOCK
      ?auto_459294 - BLOCK
      ?auto_459295 - BLOCK
    )
    :vars
    (
      ?auto_459296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459295 ?auto_459296 ) ( ON-TABLE ?auto_459281 ) ( ON ?auto_459282 ?auto_459281 ) ( ON ?auto_459283 ?auto_459282 ) ( ON ?auto_459284 ?auto_459283 ) ( ON ?auto_459285 ?auto_459284 ) ( ON ?auto_459286 ?auto_459285 ) ( not ( = ?auto_459281 ?auto_459282 ) ) ( not ( = ?auto_459281 ?auto_459283 ) ) ( not ( = ?auto_459281 ?auto_459284 ) ) ( not ( = ?auto_459281 ?auto_459285 ) ) ( not ( = ?auto_459281 ?auto_459286 ) ) ( not ( = ?auto_459281 ?auto_459287 ) ) ( not ( = ?auto_459281 ?auto_459288 ) ) ( not ( = ?auto_459281 ?auto_459289 ) ) ( not ( = ?auto_459281 ?auto_459290 ) ) ( not ( = ?auto_459281 ?auto_459291 ) ) ( not ( = ?auto_459281 ?auto_459292 ) ) ( not ( = ?auto_459281 ?auto_459293 ) ) ( not ( = ?auto_459281 ?auto_459294 ) ) ( not ( = ?auto_459281 ?auto_459295 ) ) ( not ( = ?auto_459281 ?auto_459296 ) ) ( not ( = ?auto_459282 ?auto_459283 ) ) ( not ( = ?auto_459282 ?auto_459284 ) ) ( not ( = ?auto_459282 ?auto_459285 ) ) ( not ( = ?auto_459282 ?auto_459286 ) ) ( not ( = ?auto_459282 ?auto_459287 ) ) ( not ( = ?auto_459282 ?auto_459288 ) ) ( not ( = ?auto_459282 ?auto_459289 ) ) ( not ( = ?auto_459282 ?auto_459290 ) ) ( not ( = ?auto_459282 ?auto_459291 ) ) ( not ( = ?auto_459282 ?auto_459292 ) ) ( not ( = ?auto_459282 ?auto_459293 ) ) ( not ( = ?auto_459282 ?auto_459294 ) ) ( not ( = ?auto_459282 ?auto_459295 ) ) ( not ( = ?auto_459282 ?auto_459296 ) ) ( not ( = ?auto_459283 ?auto_459284 ) ) ( not ( = ?auto_459283 ?auto_459285 ) ) ( not ( = ?auto_459283 ?auto_459286 ) ) ( not ( = ?auto_459283 ?auto_459287 ) ) ( not ( = ?auto_459283 ?auto_459288 ) ) ( not ( = ?auto_459283 ?auto_459289 ) ) ( not ( = ?auto_459283 ?auto_459290 ) ) ( not ( = ?auto_459283 ?auto_459291 ) ) ( not ( = ?auto_459283 ?auto_459292 ) ) ( not ( = ?auto_459283 ?auto_459293 ) ) ( not ( = ?auto_459283 ?auto_459294 ) ) ( not ( = ?auto_459283 ?auto_459295 ) ) ( not ( = ?auto_459283 ?auto_459296 ) ) ( not ( = ?auto_459284 ?auto_459285 ) ) ( not ( = ?auto_459284 ?auto_459286 ) ) ( not ( = ?auto_459284 ?auto_459287 ) ) ( not ( = ?auto_459284 ?auto_459288 ) ) ( not ( = ?auto_459284 ?auto_459289 ) ) ( not ( = ?auto_459284 ?auto_459290 ) ) ( not ( = ?auto_459284 ?auto_459291 ) ) ( not ( = ?auto_459284 ?auto_459292 ) ) ( not ( = ?auto_459284 ?auto_459293 ) ) ( not ( = ?auto_459284 ?auto_459294 ) ) ( not ( = ?auto_459284 ?auto_459295 ) ) ( not ( = ?auto_459284 ?auto_459296 ) ) ( not ( = ?auto_459285 ?auto_459286 ) ) ( not ( = ?auto_459285 ?auto_459287 ) ) ( not ( = ?auto_459285 ?auto_459288 ) ) ( not ( = ?auto_459285 ?auto_459289 ) ) ( not ( = ?auto_459285 ?auto_459290 ) ) ( not ( = ?auto_459285 ?auto_459291 ) ) ( not ( = ?auto_459285 ?auto_459292 ) ) ( not ( = ?auto_459285 ?auto_459293 ) ) ( not ( = ?auto_459285 ?auto_459294 ) ) ( not ( = ?auto_459285 ?auto_459295 ) ) ( not ( = ?auto_459285 ?auto_459296 ) ) ( not ( = ?auto_459286 ?auto_459287 ) ) ( not ( = ?auto_459286 ?auto_459288 ) ) ( not ( = ?auto_459286 ?auto_459289 ) ) ( not ( = ?auto_459286 ?auto_459290 ) ) ( not ( = ?auto_459286 ?auto_459291 ) ) ( not ( = ?auto_459286 ?auto_459292 ) ) ( not ( = ?auto_459286 ?auto_459293 ) ) ( not ( = ?auto_459286 ?auto_459294 ) ) ( not ( = ?auto_459286 ?auto_459295 ) ) ( not ( = ?auto_459286 ?auto_459296 ) ) ( not ( = ?auto_459287 ?auto_459288 ) ) ( not ( = ?auto_459287 ?auto_459289 ) ) ( not ( = ?auto_459287 ?auto_459290 ) ) ( not ( = ?auto_459287 ?auto_459291 ) ) ( not ( = ?auto_459287 ?auto_459292 ) ) ( not ( = ?auto_459287 ?auto_459293 ) ) ( not ( = ?auto_459287 ?auto_459294 ) ) ( not ( = ?auto_459287 ?auto_459295 ) ) ( not ( = ?auto_459287 ?auto_459296 ) ) ( not ( = ?auto_459288 ?auto_459289 ) ) ( not ( = ?auto_459288 ?auto_459290 ) ) ( not ( = ?auto_459288 ?auto_459291 ) ) ( not ( = ?auto_459288 ?auto_459292 ) ) ( not ( = ?auto_459288 ?auto_459293 ) ) ( not ( = ?auto_459288 ?auto_459294 ) ) ( not ( = ?auto_459288 ?auto_459295 ) ) ( not ( = ?auto_459288 ?auto_459296 ) ) ( not ( = ?auto_459289 ?auto_459290 ) ) ( not ( = ?auto_459289 ?auto_459291 ) ) ( not ( = ?auto_459289 ?auto_459292 ) ) ( not ( = ?auto_459289 ?auto_459293 ) ) ( not ( = ?auto_459289 ?auto_459294 ) ) ( not ( = ?auto_459289 ?auto_459295 ) ) ( not ( = ?auto_459289 ?auto_459296 ) ) ( not ( = ?auto_459290 ?auto_459291 ) ) ( not ( = ?auto_459290 ?auto_459292 ) ) ( not ( = ?auto_459290 ?auto_459293 ) ) ( not ( = ?auto_459290 ?auto_459294 ) ) ( not ( = ?auto_459290 ?auto_459295 ) ) ( not ( = ?auto_459290 ?auto_459296 ) ) ( not ( = ?auto_459291 ?auto_459292 ) ) ( not ( = ?auto_459291 ?auto_459293 ) ) ( not ( = ?auto_459291 ?auto_459294 ) ) ( not ( = ?auto_459291 ?auto_459295 ) ) ( not ( = ?auto_459291 ?auto_459296 ) ) ( not ( = ?auto_459292 ?auto_459293 ) ) ( not ( = ?auto_459292 ?auto_459294 ) ) ( not ( = ?auto_459292 ?auto_459295 ) ) ( not ( = ?auto_459292 ?auto_459296 ) ) ( not ( = ?auto_459293 ?auto_459294 ) ) ( not ( = ?auto_459293 ?auto_459295 ) ) ( not ( = ?auto_459293 ?auto_459296 ) ) ( not ( = ?auto_459294 ?auto_459295 ) ) ( not ( = ?auto_459294 ?auto_459296 ) ) ( not ( = ?auto_459295 ?auto_459296 ) ) ( ON ?auto_459294 ?auto_459295 ) ( ON ?auto_459293 ?auto_459294 ) ( ON ?auto_459292 ?auto_459293 ) ( ON ?auto_459291 ?auto_459292 ) ( ON ?auto_459290 ?auto_459291 ) ( ON ?auto_459289 ?auto_459290 ) ( ON ?auto_459288 ?auto_459289 ) ( CLEAR ?auto_459286 ) ( ON ?auto_459287 ?auto_459288 ) ( CLEAR ?auto_459287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_459281 ?auto_459282 ?auto_459283 ?auto_459284 ?auto_459285 ?auto_459286 ?auto_459287 )
      ( MAKE-15PILE ?auto_459281 ?auto_459282 ?auto_459283 ?auto_459284 ?auto_459285 ?auto_459286 ?auto_459287 ?auto_459288 ?auto_459289 ?auto_459290 ?auto_459291 ?auto_459292 ?auto_459293 ?auto_459294 ?auto_459295 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459312 - BLOCK
      ?auto_459313 - BLOCK
      ?auto_459314 - BLOCK
      ?auto_459315 - BLOCK
      ?auto_459316 - BLOCK
      ?auto_459317 - BLOCK
      ?auto_459318 - BLOCK
      ?auto_459319 - BLOCK
      ?auto_459320 - BLOCK
      ?auto_459321 - BLOCK
      ?auto_459322 - BLOCK
      ?auto_459323 - BLOCK
      ?auto_459324 - BLOCK
      ?auto_459325 - BLOCK
      ?auto_459326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_459326 ) ( ON-TABLE ?auto_459312 ) ( ON ?auto_459313 ?auto_459312 ) ( ON ?auto_459314 ?auto_459313 ) ( ON ?auto_459315 ?auto_459314 ) ( ON ?auto_459316 ?auto_459315 ) ( ON ?auto_459317 ?auto_459316 ) ( not ( = ?auto_459312 ?auto_459313 ) ) ( not ( = ?auto_459312 ?auto_459314 ) ) ( not ( = ?auto_459312 ?auto_459315 ) ) ( not ( = ?auto_459312 ?auto_459316 ) ) ( not ( = ?auto_459312 ?auto_459317 ) ) ( not ( = ?auto_459312 ?auto_459318 ) ) ( not ( = ?auto_459312 ?auto_459319 ) ) ( not ( = ?auto_459312 ?auto_459320 ) ) ( not ( = ?auto_459312 ?auto_459321 ) ) ( not ( = ?auto_459312 ?auto_459322 ) ) ( not ( = ?auto_459312 ?auto_459323 ) ) ( not ( = ?auto_459312 ?auto_459324 ) ) ( not ( = ?auto_459312 ?auto_459325 ) ) ( not ( = ?auto_459312 ?auto_459326 ) ) ( not ( = ?auto_459313 ?auto_459314 ) ) ( not ( = ?auto_459313 ?auto_459315 ) ) ( not ( = ?auto_459313 ?auto_459316 ) ) ( not ( = ?auto_459313 ?auto_459317 ) ) ( not ( = ?auto_459313 ?auto_459318 ) ) ( not ( = ?auto_459313 ?auto_459319 ) ) ( not ( = ?auto_459313 ?auto_459320 ) ) ( not ( = ?auto_459313 ?auto_459321 ) ) ( not ( = ?auto_459313 ?auto_459322 ) ) ( not ( = ?auto_459313 ?auto_459323 ) ) ( not ( = ?auto_459313 ?auto_459324 ) ) ( not ( = ?auto_459313 ?auto_459325 ) ) ( not ( = ?auto_459313 ?auto_459326 ) ) ( not ( = ?auto_459314 ?auto_459315 ) ) ( not ( = ?auto_459314 ?auto_459316 ) ) ( not ( = ?auto_459314 ?auto_459317 ) ) ( not ( = ?auto_459314 ?auto_459318 ) ) ( not ( = ?auto_459314 ?auto_459319 ) ) ( not ( = ?auto_459314 ?auto_459320 ) ) ( not ( = ?auto_459314 ?auto_459321 ) ) ( not ( = ?auto_459314 ?auto_459322 ) ) ( not ( = ?auto_459314 ?auto_459323 ) ) ( not ( = ?auto_459314 ?auto_459324 ) ) ( not ( = ?auto_459314 ?auto_459325 ) ) ( not ( = ?auto_459314 ?auto_459326 ) ) ( not ( = ?auto_459315 ?auto_459316 ) ) ( not ( = ?auto_459315 ?auto_459317 ) ) ( not ( = ?auto_459315 ?auto_459318 ) ) ( not ( = ?auto_459315 ?auto_459319 ) ) ( not ( = ?auto_459315 ?auto_459320 ) ) ( not ( = ?auto_459315 ?auto_459321 ) ) ( not ( = ?auto_459315 ?auto_459322 ) ) ( not ( = ?auto_459315 ?auto_459323 ) ) ( not ( = ?auto_459315 ?auto_459324 ) ) ( not ( = ?auto_459315 ?auto_459325 ) ) ( not ( = ?auto_459315 ?auto_459326 ) ) ( not ( = ?auto_459316 ?auto_459317 ) ) ( not ( = ?auto_459316 ?auto_459318 ) ) ( not ( = ?auto_459316 ?auto_459319 ) ) ( not ( = ?auto_459316 ?auto_459320 ) ) ( not ( = ?auto_459316 ?auto_459321 ) ) ( not ( = ?auto_459316 ?auto_459322 ) ) ( not ( = ?auto_459316 ?auto_459323 ) ) ( not ( = ?auto_459316 ?auto_459324 ) ) ( not ( = ?auto_459316 ?auto_459325 ) ) ( not ( = ?auto_459316 ?auto_459326 ) ) ( not ( = ?auto_459317 ?auto_459318 ) ) ( not ( = ?auto_459317 ?auto_459319 ) ) ( not ( = ?auto_459317 ?auto_459320 ) ) ( not ( = ?auto_459317 ?auto_459321 ) ) ( not ( = ?auto_459317 ?auto_459322 ) ) ( not ( = ?auto_459317 ?auto_459323 ) ) ( not ( = ?auto_459317 ?auto_459324 ) ) ( not ( = ?auto_459317 ?auto_459325 ) ) ( not ( = ?auto_459317 ?auto_459326 ) ) ( not ( = ?auto_459318 ?auto_459319 ) ) ( not ( = ?auto_459318 ?auto_459320 ) ) ( not ( = ?auto_459318 ?auto_459321 ) ) ( not ( = ?auto_459318 ?auto_459322 ) ) ( not ( = ?auto_459318 ?auto_459323 ) ) ( not ( = ?auto_459318 ?auto_459324 ) ) ( not ( = ?auto_459318 ?auto_459325 ) ) ( not ( = ?auto_459318 ?auto_459326 ) ) ( not ( = ?auto_459319 ?auto_459320 ) ) ( not ( = ?auto_459319 ?auto_459321 ) ) ( not ( = ?auto_459319 ?auto_459322 ) ) ( not ( = ?auto_459319 ?auto_459323 ) ) ( not ( = ?auto_459319 ?auto_459324 ) ) ( not ( = ?auto_459319 ?auto_459325 ) ) ( not ( = ?auto_459319 ?auto_459326 ) ) ( not ( = ?auto_459320 ?auto_459321 ) ) ( not ( = ?auto_459320 ?auto_459322 ) ) ( not ( = ?auto_459320 ?auto_459323 ) ) ( not ( = ?auto_459320 ?auto_459324 ) ) ( not ( = ?auto_459320 ?auto_459325 ) ) ( not ( = ?auto_459320 ?auto_459326 ) ) ( not ( = ?auto_459321 ?auto_459322 ) ) ( not ( = ?auto_459321 ?auto_459323 ) ) ( not ( = ?auto_459321 ?auto_459324 ) ) ( not ( = ?auto_459321 ?auto_459325 ) ) ( not ( = ?auto_459321 ?auto_459326 ) ) ( not ( = ?auto_459322 ?auto_459323 ) ) ( not ( = ?auto_459322 ?auto_459324 ) ) ( not ( = ?auto_459322 ?auto_459325 ) ) ( not ( = ?auto_459322 ?auto_459326 ) ) ( not ( = ?auto_459323 ?auto_459324 ) ) ( not ( = ?auto_459323 ?auto_459325 ) ) ( not ( = ?auto_459323 ?auto_459326 ) ) ( not ( = ?auto_459324 ?auto_459325 ) ) ( not ( = ?auto_459324 ?auto_459326 ) ) ( not ( = ?auto_459325 ?auto_459326 ) ) ( ON ?auto_459325 ?auto_459326 ) ( ON ?auto_459324 ?auto_459325 ) ( ON ?auto_459323 ?auto_459324 ) ( ON ?auto_459322 ?auto_459323 ) ( ON ?auto_459321 ?auto_459322 ) ( ON ?auto_459320 ?auto_459321 ) ( ON ?auto_459319 ?auto_459320 ) ( CLEAR ?auto_459317 ) ( ON ?auto_459318 ?auto_459319 ) ( CLEAR ?auto_459318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_459312 ?auto_459313 ?auto_459314 ?auto_459315 ?auto_459316 ?auto_459317 ?auto_459318 )
      ( MAKE-15PILE ?auto_459312 ?auto_459313 ?auto_459314 ?auto_459315 ?auto_459316 ?auto_459317 ?auto_459318 ?auto_459319 ?auto_459320 ?auto_459321 ?auto_459322 ?auto_459323 ?auto_459324 ?auto_459325 ?auto_459326 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459342 - BLOCK
      ?auto_459343 - BLOCK
      ?auto_459344 - BLOCK
      ?auto_459345 - BLOCK
      ?auto_459346 - BLOCK
      ?auto_459347 - BLOCK
      ?auto_459348 - BLOCK
      ?auto_459349 - BLOCK
      ?auto_459350 - BLOCK
      ?auto_459351 - BLOCK
      ?auto_459352 - BLOCK
      ?auto_459353 - BLOCK
      ?auto_459354 - BLOCK
      ?auto_459355 - BLOCK
      ?auto_459356 - BLOCK
    )
    :vars
    (
      ?auto_459357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459356 ?auto_459357 ) ( ON-TABLE ?auto_459342 ) ( ON ?auto_459343 ?auto_459342 ) ( ON ?auto_459344 ?auto_459343 ) ( ON ?auto_459345 ?auto_459344 ) ( ON ?auto_459346 ?auto_459345 ) ( not ( = ?auto_459342 ?auto_459343 ) ) ( not ( = ?auto_459342 ?auto_459344 ) ) ( not ( = ?auto_459342 ?auto_459345 ) ) ( not ( = ?auto_459342 ?auto_459346 ) ) ( not ( = ?auto_459342 ?auto_459347 ) ) ( not ( = ?auto_459342 ?auto_459348 ) ) ( not ( = ?auto_459342 ?auto_459349 ) ) ( not ( = ?auto_459342 ?auto_459350 ) ) ( not ( = ?auto_459342 ?auto_459351 ) ) ( not ( = ?auto_459342 ?auto_459352 ) ) ( not ( = ?auto_459342 ?auto_459353 ) ) ( not ( = ?auto_459342 ?auto_459354 ) ) ( not ( = ?auto_459342 ?auto_459355 ) ) ( not ( = ?auto_459342 ?auto_459356 ) ) ( not ( = ?auto_459342 ?auto_459357 ) ) ( not ( = ?auto_459343 ?auto_459344 ) ) ( not ( = ?auto_459343 ?auto_459345 ) ) ( not ( = ?auto_459343 ?auto_459346 ) ) ( not ( = ?auto_459343 ?auto_459347 ) ) ( not ( = ?auto_459343 ?auto_459348 ) ) ( not ( = ?auto_459343 ?auto_459349 ) ) ( not ( = ?auto_459343 ?auto_459350 ) ) ( not ( = ?auto_459343 ?auto_459351 ) ) ( not ( = ?auto_459343 ?auto_459352 ) ) ( not ( = ?auto_459343 ?auto_459353 ) ) ( not ( = ?auto_459343 ?auto_459354 ) ) ( not ( = ?auto_459343 ?auto_459355 ) ) ( not ( = ?auto_459343 ?auto_459356 ) ) ( not ( = ?auto_459343 ?auto_459357 ) ) ( not ( = ?auto_459344 ?auto_459345 ) ) ( not ( = ?auto_459344 ?auto_459346 ) ) ( not ( = ?auto_459344 ?auto_459347 ) ) ( not ( = ?auto_459344 ?auto_459348 ) ) ( not ( = ?auto_459344 ?auto_459349 ) ) ( not ( = ?auto_459344 ?auto_459350 ) ) ( not ( = ?auto_459344 ?auto_459351 ) ) ( not ( = ?auto_459344 ?auto_459352 ) ) ( not ( = ?auto_459344 ?auto_459353 ) ) ( not ( = ?auto_459344 ?auto_459354 ) ) ( not ( = ?auto_459344 ?auto_459355 ) ) ( not ( = ?auto_459344 ?auto_459356 ) ) ( not ( = ?auto_459344 ?auto_459357 ) ) ( not ( = ?auto_459345 ?auto_459346 ) ) ( not ( = ?auto_459345 ?auto_459347 ) ) ( not ( = ?auto_459345 ?auto_459348 ) ) ( not ( = ?auto_459345 ?auto_459349 ) ) ( not ( = ?auto_459345 ?auto_459350 ) ) ( not ( = ?auto_459345 ?auto_459351 ) ) ( not ( = ?auto_459345 ?auto_459352 ) ) ( not ( = ?auto_459345 ?auto_459353 ) ) ( not ( = ?auto_459345 ?auto_459354 ) ) ( not ( = ?auto_459345 ?auto_459355 ) ) ( not ( = ?auto_459345 ?auto_459356 ) ) ( not ( = ?auto_459345 ?auto_459357 ) ) ( not ( = ?auto_459346 ?auto_459347 ) ) ( not ( = ?auto_459346 ?auto_459348 ) ) ( not ( = ?auto_459346 ?auto_459349 ) ) ( not ( = ?auto_459346 ?auto_459350 ) ) ( not ( = ?auto_459346 ?auto_459351 ) ) ( not ( = ?auto_459346 ?auto_459352 ) ) ( not ( = ?auto_459346 ?auto_459353 ) ) ( not ( = ?auto_459346 ?auto_459354 ) ) ( not ( = ?auto_459346 ?auto_459355 ) ) ( not ( = ?auto_459346 ?auto_459356 ) ) ( not ( = ?auto_459346 ?auto_459357 ) ) ( not ( = ?auto_459347 ?auto_459348 ) ) ( not ( = ?auto_459347 ?auto_459349 ) ) ( not ( = ?auto_459347 ?auto_459350 ) ) ( not ( = ?auto_459347 ?auto_459351 ) ) ( not ( = ?auto_459347 ?auto_459352 ) ) ( not ( = ?auto_459347 ?auto_459353 ) ) ( not ( = ?auto_459347 ?auto_459354 ) ) ( not ( = ?auto_459347 ?auto_459355 ) ) ( not ( = ?auto_459347 ?auto_459356 ) ) ( not ( = ?auto_459347 ?auto_459357 ) ) ( not ( = ?auto_459348 ?auto_459349 ) ) ( not ( = ?auto_459348 ?auto_459350 ) ) ( not ( = ?auto_459348 ?auto_459351 ) ) ( not ( = ?auto_459348 ?auto_459352 ) ) ( not ( = ?auto_459348 ?auto_459353 ) ) ( not ( = ?auto_459348 ?auto_459354 ) ) ( not ( = ?auto_459348 ?auto_459355 ) ) ( not ( = ?auto_459348 ?auto_459356 ) ) ( not ( = ?auto_459348 ?auto_459357 ) ) ( not ( = ?auto_459349 ?auto_459350 ) ) ( not ( = ?auto_459349 ?auto_459351 ) ) ( not ( = ?auto_459349 ?auto_459352 ) ) ( not ( = ?auto_459349 ?auto_459353 ) ) ( not ( = ?auto_459349 ?auto_459354 ) ) ( not ( = ?auto_459349 ?auto_459355 ) ) ( not ( = ?auto_459349 ?auto_459356 ) ) ( not ( = ?auto_459349 ?auto_459357 ) ) ( not ( = ?auto_459350 ?auto_459351 ) ) ( not ( = ?auto_459350 ?auto_459352 ) ) ( not ( = ?auto_459350 ?auto_459353 ) ) ( not ( = ?auto_459350 ?auto_459354 ) ) ( not ( = ?auto_459350 ?auto_459355 ) ) ( not ( = ?auto_459350 ?auto_459356 ) ) ( not ( = ?auto_459350 ?auto_459357 ) ) ( not ( = ?auto_459351 ?auto_459352 ) ) ( not ( = ?auto_459351 ?auto_459353 ) ) ( not ( = ?auto_459351 ?auto_459354 ) ) ( not ( = ?auto_459351 ?auto_459355 ) ) ( not ( = ?auto_459351 ?auto_459356 ) ) ( not ( = ?auto_459351 ?auto_459357 ) ) ( not ( = ?auto_459352 ?auto_459353 ) ) ( not ( = ?auto_459352 ?auto_459354 ) ) ( not ( = ?auto_459352 ?auto_459355 ) ) ( not ( = ?auto_459352 ?auto_459356 ) ) ( not ( = ?auto_459352 ?auto_459357 ) ) ( not ( = ?auto_459353 ?auto_459354 ) ) ( not ( = ?auto_459353 ?auto_459355 ) ) ( not ( = ?auto_459353 ?auto_459356 ) ) ( not ( = ?auto_459353 ?auto_459357 ) ) ( not ( = ?auto_459354 ?auto_459355 ) ) ( not ( = ?auto_459354 ?auto_459356 ) ) ( not ( = ?auto_459354 ?auto_459357 ) ) ( not ( = ?auto_459355 ?auto_459356 ) ) ( not ( = ?auto_459355 ?auto_459357 ) ) ( not ( = ?auto_459356 ?auto_459357 ) ) ( ON ?auto_459355 ?auto_459356 ) ( ON ?auto_459354 ?auto_459355 ) ( ON ?auto_459353 ?auto_459354 ) ( ON ?auto_459352 ?auto_459353 ) ( ON ?auto_459351 ?auto_459352 ) ( ON ?auto_459350 ?auto_459351 ) ( ON ?auto_459349 ?auto_459350 ) ( ON ?auto_459348 ?auto_459349 ) ( CLEAR ?auto_459346 ) ( ON ?auto_459347 ?auto_459348 ) ( CLEAR ?auto_459347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_459342 ?auto_459343 ?auto_459344 ?auto_459345 ?auto_459346 ?auto_459347 )
      ( MAKE-15PILE ?auto_459342 ?auto_459343 ?auto_459344 ?auto_459345 ?auto_459346 ?auto_459347 ?auto_459348 ?auto_459349 ?auto_459350 ?auto_459351 ?auto_459352 ?auto_459353 ?auto_459354 ?auto_459355 ?auto_459356 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459373 - BLOCK
      ?auto_459374 - BLOCK
      ?auto_459375 - BLOCK
      ?auto_459376 - BLOCK
      ?auto_459377 - BLOCK
      ?auto_459378 - BLOCK
      ?auto_459379 - BLOCK
      ?auto_459380 - BLOCK
      ?auto_459381 - BLOCK
      ?auto_459382 - BLOCK
      ?auto_459383 - BLOCK
      ?auto_459384 - BLOCK
      ?auto_459385 - BLOCK
      ?auto_459386 - BLOCK
      ?auto_459387 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_459387 ) ( ON-TABLE ?auto_459373 ) ( ON ?auto_459374 ?auto_459373 ) ( ON ?auto_459375 ?auto_459374 ) ( ON ?auto_459376 ?auto_459375 ) ( ON ?auto_459377 ?auto_459376 ) ( not ( = ?auto_459373 ?auto_459374 ) ) ( not ( = ?auto_459373 ?auto_459375 ) ) ( not ( = ?auto_459373 ?auto_459376 ) ) ( not ( = ?auto_459373 ?auto_459377 ) ) ( not ( = ?auto_459373 ?auto_459378 ) ) ( not ( = ?auto_459373 ?auto_459379 ) ) ( not ( = ?auto_459373 ?auto_459380 ) ) ( not ( = ?auto_459373 ?auto_459381 ) ) ( not ( = ?auto_459373 ?auto_459382 ) ) ( not ( = ?auto_459373 ?auto_459383 ) ) ( not ( = ?auto_459373 ?auto_459384 ) ) ( not ( = ?auto_459373 ?auto_459385 ) ) ( not ( = ?auto_459373 ?auto_459386 ) ) ( not ( = ?auto_459373 ?auto_459387 ) ) ( not ( = ?auto_459374 ?auto_459375 ) ) ( not ( = ?auto_459374 ?auto_459376 ) ) ( not ( = ?auto_459374 ?auto_459377 ) ) ( not ( = ?auto_459374 ?auto_459378 ) ) ( not ( = ?auto_459374 ?auto_459379 ) ) ( not ( = ?auto_459374 ?auto_459380 ) ) ( not ( = ?auto_459374 ?auto_459381 ) ) ( not ( = ?auto_459374 ?auto_459382 ) ) ( not ( = ?auto_459374 ?auto_459383 ) ) ( not ( = ?auto_459374 ?auto_459384 ) ) ( not ( = ?auto_459374 ?auto_459385 ) ) ( not ( = ?auto_459374 ?auto_459386 ) ) ( not ( = ?auto_459374 ?auto_459387 ) ) ( not ( = ?auto_459375 ?auto_459376 ) ) ( not ( = ?auto_459375 ?auto_459377 ) ) ( not ( = ?auto_459375 ?auto_459378 ) ) ( not ( = ?auto_459375 ?auto_459379 ) ) ( not ( = ?auto_459375 ?auto_459380 ) ) ( not ( = ?auto_459375 ?auto_459381 ) ) ( not ( = ?auto_459375 ?auto_459382 ) ) ( not ( = ?auto_459375 ?auto_459383 ) ) ( not ( = ?auto_459375 ?auto_459384 ) ) ( not ( = ?auto_459375 ?auto_459385 ) ) ( not ( = ?auto_459375 ?auto_459386 ) ) ( not ( = ?auto_459375 ?auto_459387 ) ) ( not ( = ?auto_459376 ?auto_459377 ) ) ( not ( = ?auto_459376 ?auto_459378 ) ) ( not ( = ?auto_459376 ?auto_459379 ) ) ( not ( = ?auto_459376 ?auto_459380 ) ) ( not ( = ?auto_459376 ?auto_459381 ) ) ( not ( = ?auto_459376 ?auto_459382 ) ) ( not ( = ?auto_459376 ?auto_459383 ) ) ( not ( = ?auto_459376 ?auto_459384 ) ) ( not ( = ?auto_459376 ?auto_459385 ) ) ( not ( = ?auto_459376 ?auto_459386 ) ) ( not ( = ?auto_459376 ?auto_459387 ) ) ( not ( = ?auto_459377 ?auto_459378 ) ) ( not ( = ?auto_459377 ?auto_459379 ) ) ( not ( = ?auto_459377 ?auto_459380 ) ) ( not ( = ?auto_459377 ?auto_459381 ) ) ( not ( = ?auto_459377 ?auto_459382 ) ) ( not ( = ?auto_459377 ?auto_459383 ) ) ( not ( = ?auto_459377 ?auto_459384 ) ) ( not ( = ?auto_459377 ?auto_459385 ) ) ( not ( = ?auto_459377 ?auto_459386 ) ) ( not ( = ?auto_459377 ?auto_459387 ) ) ( not ( = ?auto_459378 ?auto_459379 ) ) ( not ( = ?auto_459378 ?auto_459380 ) ) ( not ( = ?auto_459378 ?auto_459381 ) ) ( not ( = ?auto_459378 ?auto_459382 ) ) ( not ( = ?auto_459378 ?auto_459383 ) ) ( not ( = ?auto_459378 ?auto_459384 ) ) ( not ( = ?auto_459378 ?auto_459385 ) ) ( not ( = ?auto_459378 ?auto_459386 ) ) ( not ( = ?auto_459378 ?auto_459387 ) ) ( not ( = ?auto_459379 ?auto_459380 ) ) ( not ( = ?auto_459379 ?auto_459381 ) ) ( not ( = ?auto_459379 ?auto_459382 ) ) ( not ( = ?auto_459379 ?auto_459383 ) ) ( not ( = ?auto_459379 ?auto_459384 ) ) ( not ( = ?auto_459379 ?auto_459385 ) ) ( not ( = ?auto_459379 ?auto_459386 ) ) ( not ( = ?auto_459379 ?auto_459387 ) ) ( not ( = ?auto_459380 ?auto_459381 ) ) ( not ( = ?auto_459380 ?auto_459382 ) ) ( not ( = ?auto_459380 ?auto_459383 ) ) ( not ( = ?auto_459380 ?auto_459384 ) ) ( not ( = ?auto_459380 ?auto_459385 ) ) ( not ( = ?auto_459380 ?auto_459386 ) ) ( not ( = ?auto_459380 ?auto_459387 ) ) ( not ( = ?auto_459381 ?auto_459382 ) ) ( not ( = ?auto_459381 ?auto_459383 ) ) ( not ( = ?auto_459381 ?auto_459384 ) ) ( not ( = ?auto_459381 ?auto_459385 ) ) ( not ( = ?auto_459381 ?auto_459386 ) ) ( not ( = ?auto_459381 ?auto_459387 ) ) ( not ( = ?auto_459382 ?auto_459383 ) ) ( not ( = ?auto_459382 ?auto_459384 ) ) ( not ( = ?auto_459382 ?auto_459385 ) ) ( not ( = ?auto_459382 ?auto_459386 ) ) ( not ( = ?auto_459382 ?auto_459387 ) ) ( not ( = ?auto_459383 ?auto_459384 ) ) ( not ( = ?auto_459383 ?auto_459385 ) ) ( not ( = ?auto_459383 ?auto_459386 ) ) ( not ( = ?auto_459383 ?auto_459387 ) ) ( not ( = ?auto_459384 ?auto_459385 ) ) ( not ( = ?auto_459384 ?auto_459386 ) ) ( not ( = ?auto_459384 ?auto_459387 ) ) ( not ( = ?auto_459385 ?auto_459386 ) ) ( not ( = ?auto_459385 ?auto_459387 ) ) ( not ( = ?auto_459386 ?auto_459387 ) ) ( ON ?auto_459386 ?auto_459387 ) ( ON ?auto_459385 ?auto_459386 ) ( ON ?auto_459384 ?auto_459385 ) ( ON ?auto_459383 ?auto_459384 ) ( ON ?auto_459382 ?auto_459383 ) ( ON ?auto_459381 ?auto_459382 ) ( ON ?auto_459380 ?auto_459381 ) ( ON ?auto_459379 ?auto_459380 ) ( CLEAR ?auto_459377 ) ( ON ?auto_459378 ?auto_459379 ) ( CLEAR ?auto_459378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_459373 ?auto_459374 ?auto_459375 ?auto_459376 ?auto_459377 ?auto_459378 )
      ( MAKE-15PILE ?auto_459373 ?auto_459374 ?auto_459375 ?auto_459376 ?auto_459377 ?auto_459378 ?auto_459379 ?auto_459380 ?auto_459381 ?auto_459382 ?auto_459383 ?auto_459384 ?auto_459385 ?auto_459386 ?auto_459387 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459403 - BLOCK
      ?auto_459404 - BLOCK
      ?auto_459405 - BLOCK
      ?auto_459406 - BLOCK
      ?auto_459407 - BLOCK
      ?auto_459408 - BLOCK
      ?auto_459409 - BLOCK
      ?auto_459410 - BLOCK
      ?auto_459411 - BLOCK
      ?auto_459412 - BLOCK
      ?auto_459413 - BLOCK
      ?auto_459414 - BLOCK
      ?auto_459415 - BLOCK
      ?auto_459416 - BLOCK
      ?auto_459417 - BLOCK
    )
    :vars
    (
      ?auto_459418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459417 ?auto_459418 ) ( ON-TABLE ?auto_459403 ) ( ON ?auto_459404 ?auto_459403 ) ( ON ?auto_459405 ?auto_459404 ) ( ON ?auto_459406 ?auto_459405 ) ( not ( = ?auto_459403 ?auto_459404 ) ) ( not ( = ?auto_459403 ?auto_459405 ) ) ( not ( = ?auto_459403 ?auto_459406 ) ) ( not ( = ?auto_459403 ?auto_459407 ) ) ( not ( = ?auto_459403 ?auto_459408 ) ) ( not ( = ?auto_459403 ?auto_459409 ) ) ( not ( = ?auto_459403 ?auto_459410 ) ) ( not ( = ?auto_459403 ?auto_459411 ) ) ( not ( = ?auto_459403 ?auto_459412 ) ) ( not ( = ?auto_459403 ?auto_459413 ) ) ( not ( = ?auto_459403 ?auto_459414 ) ) ( not ( = ?auto_459403 ?auto_459415 ) ) ( not ( = ?auto_459403 ?auto_459416 ) ) ( not ( = ?auto_459403 ?auto_459417 ) ) ( not ( = ?auto_459403 ?auto_459418 ) ) ( not ( = ?auto_459404 ?auto_459405 ) ) ( not ( = ?auto_459404 ?auto_459406 ) ) ( not ( = ?auto_459404 ?auto_459407 ) ) ( not ( = ?auto_459404 ?auto_459408 ) ) ( not ( = ?auto_459404 ?auto_459409 ) ) ( not ( = ?auto_459404 ?auto_459410 ) ) ( not ( = ?auto_459404 ?auto_459411 ) ) ( not ( = ?auto_459404 ?auto_459412 ) ) ( not ( = ?auto_459404 ?auto_459413 ) ) ( not ( = ?auto_459404 ?auto_459414 ) ) ( not ( = ?auto_459404 ?auto_459415 ) ) ( not ( = ?auto_459404 ?auto_459416 ) ) ( not ( = ?auto_459404 ?auto_459417 ) ) ( not ( = ?auto_459404 ?auto_459418 ) ) ( not ( = ?auto_459405 ?auto_459406 ) ) ( not ( = ?auto_459405 ?auto_459407 ) ) ( not ( = ?auto_459405 ?auto_459408 ) ) ( not ( = ?auto_459405 ?auto_459409 ) ) ( not ( = ?auto_459405 ?auto_459410 ) ) ( not ( = ?auto_459405 ?auto_459411 ) ) ( not ( = ?auto_459405 ?auto_459412 ) ) ( not ( = ?auto_459405 ?auto_459413 ) ) ( not ( = ?auto_459405 ?auto_459414 ) ) ( not ( = ?auto_459405 ?auto_459415 ) ) ( not ( = ?auto_459405 ?auto_459416 ) ) ( not ( = ?auto_459405 ?auto_459417 ) ) ( not ( = ?auto_459405 ?auto_459418 ) ) ( not ( = ?auto_459406 ?auto_459407 ) ) ( not ( = ?auto_459406 ?auto_459408 ) ) ( not ( = ?auto_459406 ?auto_459409 ) ) ( not ( = ?auto_459406 ?auto_459410 ) ) ( not ( = ?auto_459406 ?auto_459411 ) ) ( not ( = ?auto_459406 ?auto_459412 ) ) ( not ( = ?auto_459406 ?auto_459413 ) ) ( not ( = ?auto_459406 ?auto_459414 ) ) ( not ( = ?auto_459406 ?auto_459415 ) ) ( not ( = ?auto_459406 ?auto_459416 ) ) ( not ( = ?auto_459406 ?auto_459417 ) ) ( not ( = ?auto_459406 ?auto_459418 ) ) ( not ( = ?auto_459407 ?auto_459408 ) ) ( not ( = ?auto_459407 ?auto_459409 ) ) ( not ( = ?auto_459407 ?auto_459410 ) ) ( not ( = ?auto_459407 ?auto_459411 ) ) ( not ( = ?auto_459407 ?auto_459412 ) ) ( not ( = ?auto_459407 ?auto_459413 ) ) ( not ( = ?auto_459407 ?auto_459414 ) ) ( not ( = ?auto_459407 ?auto_459415 ) ) ( not ( = ?auto_459407 ?auto_459416 ) ) ( not ( = ?auto_459407 ?auto_459417 ) ) ( not ( = ?auto_459407 ?auto_459418 ) ) ( not ( = ?auto_459408 ?auto_459409 ) ) ( not ( = ?auto_459408 ?auto_459410 ) ) ( not ( = ?auto_459408 ?auto_459411 ) ) ( not ( = ?auto_459408 ?auto_459412 ) ) ( not ( = ?auto_459408 ?auto_459413 ) ) ( not ( = ?auto_459408 ?auto_459414 ) ) ( not ( = ?auto_459408 ?auto_459415 ) ) ( not ( = ?auto_459408 ?auto_459416 ) ) ( not ( = ?auto_459408 ?auto_459417 ) ) ( not ( = ?auto_459408 ?auto_459418 ) ) ( not ( = ?auto_459409 ?auto_459410 ) ) ( not ( = ?auto_459409 ?auto_459411 ) ) ( not ( = ?auto_459409 ?auto_459412 ) ) ( not ( = ?auto_459409 ?auto_459413 ) ) ( not ( = ?auto_459409 ?auto_459414 ) ) ( not ( = ?auto_459409 ?auto_459415 ) ) ( not ( = ?auto_459409 ?auto_459416 ) ) ( not ( = ?auto_459409 ?auto_459417 ) ) ( not ( = ?auto_459409 ?auto_459418 ) ) ( not ( = ?auto_459410 ?auto_459411 ) ) ( not ( = ?auto_459410 ?auto_459412 ) ) ( not ( = ?auto_459410 ?auto_459413 ) ) ( not ( = ?auto_459410 ?auto_459414 ) ) ( not ( = ?auto_459410 ?auto_459415 ) ) ( not ( = ?auto_459410 ?auto_459416 ) ) ( not ( = ?auto_459410 ?auto_459417 ) ) ( not ( = ?auto_459410 ?auto_459418 ) ) ( not ( = ?auto_459411 ?auto_459412 ) ) ( not ( = ?auto_459411 ?auto_459413 ) ) ( not ( = ?auto_459411 ?auto_459414 ) ) ( not ( = ?auto_459411 ?auto_459415 ) ) ( not ( = ?auto_459411 ?auto_459416 ) ) ( not ( = ?auto_459411 ?auto_459417 ) ) ( not ( = ?auto_459411 ?auto_459418 ) ) ( not ( = ?auto_459412 ?auto_459413 ) ) ( not ( = ?auto_459412 ?auto_459414 ) ) ( not ( = ?auto_459412 ?auto_459415 ) ) ( not ( = ?auto_459412 ?auto_459416 ) ) ( not ( = ?auto_459412 ?auto_459417 ) ) ( not ( = ?auto_459412 ?auto_459418 ) ) ( not ( = ?auto_459413 ?auto_459414 ) ) ( not ( = ?auto_459413 ?auto_459415 ) ) ( not ( = ?auto_459413 ?auto_459416 ) ) ( not ( = ?auto_459413 ?auto_459417 ) ) ( not ( = ?auto_459413 ?auto_459418 ) ) ( not ( = ?auto_459414 ?auto_459415 ) ) ( not ( = ?auto_459414 ?auto_459416 ) ) ( not ( = ?auto_459414 ?auto_459417 ) ) ( not ( = ?auto_459414 ?auto_459418 ) ) ( not ( = ?auto_459415 ?auto_459416 ) ) ( not ( = ?auto_459415 ?auto_459417 ) ) ( not ( = ?auto_459415 ?auto_459418 ) ) ( not ( = ?auto_459416 ?auto_459417 ) ) ( not ( = ?auto_459416 ?auto_459418 ) ) ( not ( = ?auto_459417 ?auto_459418 ) ) ( ON ?auto_459416 ?auto_459417 ) ( ON ?auto_459415 ?auto_459416 ) ( ON ?auto_459414 ?auto_459415 ) ( ON ?auto_459413 ?auto_459414 ) ( ON ?auto_459412 ?auto_459413 ) ( ON ?auto_459411 ?auto_459412 ) ( ON ?auto_459410 ?auto_459411 ) ( ON ?auto_459409 ?auto_459410 ) ( ON ?auto_459408 ?auto_459409 ) ( CLEAR ?auto_459406 ) ( ON ?auto_459407 ?auto_459408 ) ( CLEAR ?auto_459407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_459403 ?auto_459404 ?auto_459405 ?auto_459406 ?auto_459407 )
      ( MAKE-15PILE ?auto_459403 ?auto_459404 ?auto_459405 ?auto_459406 ?auto_459407 ?auto_459408 ?auto_459409 ?auto_459410 ?auto_459411 ?auto_459412 ?auto_459413 ?auto_459414 ?auto_459415 ?auto_459416 ?auto_459417 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459434 - BLOCK
      ?auto_459435 - BLOCK
      ?auto_459436 - BLOCK
      ?auto_459437 - BLOCK
      ?auto_459438 - BLOCK
      ?auto_459439 - BLOCK
      ?auto_459440 - BLOCK
      ?auto_459441 - BLOCK
      ?auto_459442 - BLOCK
      ?auto_459443 - BLOCK
      ?auto_459444 - BLOCK
      ?auto_459445 - BLOCK
      ?auto_459446 - BLOCK
      ?auto_459447 - BLOCK
      ?auto_459448 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_459448 ) ( ON-TABLE ?auto_459434 ) ( ON ?auto_459435 ?auto_459434 ) ( ON ?auto_459436 ?auto_459435 ) ( ON ?auto_459437 ?auto_459436 ) ( not ( = ?auto_459434 ?auto_459435 ) ) ( not ( = ?auto_459434 ?auto_459436 ) ) ( not ( = ?auto_459434 ?auto_459437 ) ) ( not ( = ?auto_459434 ?auto_459438 ) ) ( not ( = ?auto_459434 ?auto_459439 ) ) ( not ( = ?auto_459434 ?auto_459440 ) ) ( not ( = ?auto_459434 ?auto_459441 ) ) ( not ( = ?auto_459434 ?auto_459442 ) ) ( not ( = ?auto_459434 ?auto_459443 ) ) ( not ( = ?auto_459434 ?auto_459444 ) ) ( not ( = ?auto_459434 ?auto_459445 ) ) ( not ( = ?auto_459434 ?auto_459446 ) ) ( not ( = ?auto_459434 ?auto_459447 ) ) ( not ( = ?auto_459434 ?auto_459448 ) ) ( not ( = ?auto_459435 ?auto_459436 ) ) ( not ( = ?auto_459435 ?auto_459437 ) ) ( not ( = ?auto_459435 ?auto_459438 ) ) ( not ( = ?auto_459435 ?auto_459439 ) ) ( not ( = ?auto_459435 ?auto_459440 ) ) ( not ( = ?auto_459435 ?auto_459441 ) ) ( not ( = ?auto_459435 ?auto_459442 ) ) ( not ( = ?auto_459435 ?auto_459443 ) ) ( not ( = ?auto_459435 ?auto_459444 ) ) ( not ( = ?auto_459435 ?auto_459445 ) ) ( not ( = ?auto_459435 ?auto_459446 ) ) ( not ( = ?auto_459435 ?auto_459447 ) ) ( not ( = ?auto_459435 ?auto_459448 ) ) ( not ( = ?auto_459436 ?auto_459437 ) ) ( not ( = ?auto_459436 ?auto_459438 ) ) ( not ( = ?auto_459436 ?auto_459439 ) ) ( not ( = ?auto_459436 ?auto_459440 ) ) ( not ( = ?auto_459436 ?auto_459441 ) ) ( not ( = ?auto_459436 ?auto_459442 ) ) ( not ( = ?auto_459436 ?auto_459443 ) ) ( not ( = ?auto_459436 ?auto_459444 ) ) ( not ( = ?auto_459436 ?auto_459445 ) ) ( not ( = ?auto_459436 ?auto_459446 ) ) ( not ( = ?auto_459436 ?auto_459447 ) ) ( not ( = ?auto_459436 ?auto_459448 ) ) ( not ( = ?auto_459437 ?auto_459438 ) ) ( not ( = ?auto_459437 ?auto_459439 ) ) ( not ( = ?auto_459437 ?auto_459440 ) ) ( not ( = ?auto_459437 ?auto_459441 ) ) ( not ( = ?auto_459437 ?auto_459442 ) ) ( not ( = ?auto_459437 ?auto_459443 ) ) ( not ( = ?auto_459437 ?auto_459444 ) ) ( not ( = ?auto_459437 ?auto_459445 ) ) ( not ( = ?auto_459437 ?auto_459446 ) ) ( not ( = ?auto_459437 ?auto_459447 ) ) ( not ( = ?auto_459437 ?auto_459448 ) ) ( not ( = ?auto_459438 ?auto_459439 ) ) ( not ( = ?auto_459438 ?auto_459440 ) ) ( not ( = ?auto_459438 ?auto_459441 ) ) ( not ( = ?auto_459438 ?auto_459442 ) ) ( not ( = ?auto_459438 ?auto_459443 ) ) ( not ( = ?auto_459438 ?auto_459444 ) ) ( not ( = ?auto_459438 ?auto_459445 ) ) ( not ( = ?auto_459438 ?auto_459446 ) ) ( not ( = ?auto_459438 ?auto_459447 ) ) ( not ( = ?auto_459438 ?auto_459448 ) ) ( not ( = ?auto_459439 ?auto_459440 ) ) ( not ( = ?auto_459439 ?auto_459441 ) ) ( not ( = ?auto_459439 ?auto_459442 ) ) ( not ( = ?auto_459439 ?auto_459443 ) ) ( not ( = ?auto_459439 ?auto_459444 ) ) ( not ( = ?auto_459439 ?auto_459445 ) ) ( not ( = ?auto_459439 ?auto_459446 ) ) ( not ( = ?auto_459439 ?auto_459447 ) ) ( not ( = ?auto_459439 ?auto_459448 ) ) ( not ( = ?auto_459440 ?auto_459441 ) ) ( not ( = ?auto_459440 ?auto_459442 ) ) ( not ( = ?auto_459440 ?auto_459443 ) ) ( not ( = ?auto_459440 ?auto_459444 ) ) ( not ( = ?auto_459440 ?auto_459445 ) ) ( not ( = ?auto_459440 ?auto_459446 ) ) ( not ( = ?auto_459440 ?auto_459447 ) ) ( not ( = ?auto_459440 ?auto_459448 ) ) ( not ( = ?auto_459441 ?auto_459442 ) ) ( not ( = ?auto_459441 ?auto_459443 ) ) ( not ( = ?auto_459441 ?auto_459444 ) ) ( not ( = ?auto_459441 ?auto_459445 ) ) ( not ( = ?auto_459441 ?auto_459446 ) ) ( not ( = ?auto_459441 ?auto_459447 ) ) ( not ( = ?auto_459441 ?auto_459448 ) ) ( not ( = ?auto_459442 ?auto_459443 ) ) ( not ( = ?auto_459442 ?auto_459444 ) ) ( not ( = ?auto_459442 ?auto_459445 ) ) ( not ( = ?auto_459442 ?auto_459446 ) ) ( not ( = ?auto_459442 ?auto_459447 ) ) ( not ( = ?auto_459442 ?auto_459448 ) ) ( not ( = ?auto_459443 ?auto_459444 ) ) ( not ( = ?auto_459443 ?auto_459445 ) ) ( not ( = ?auto_459443 ?auto_459446 ) ) ( not ( = ?auto_459443 ?auto_459447 ) ) ( not ( = ?auto_459443 ?auto_459448 ) ) ( not ( = ?auto_459444 ?auto_459445 ) ) ( not ( = ?auto_459444 ?auto_459446 ) ) ( not ( = ?auto_459444 ?auto_459447 ) ) ( not ( = ?auto_459444 ?auto_459448 ) ) ( not ( = ?auto_459445 ?auto_459446 ) ) ( not ( = ?auto_459445 ?auto_459447 ) ) ( not ( = ?auto_459445 ?auto_459448 ) ) ( not ( = ?auto_459446 ?auto_459447 ) ) ( not ( = ?auto_459446 ?auto_459448 ) ) ( not ( = ?auto_459447 ?auto_459448 ) ) ( ON ?auto_459447 ?auto_459448 ) ( ON ?auto_459446 ?auto_459447 ) ( ON ?auto_459445 ?auto_459446 ) ( ON ?auto_459444 ?auto_459445 ) ( ON ?auto_459443 ?auto_459444 ) ( ON ?auto_459442 ?auto_459443 ) ( ON ?auto_459441 ?auto_459442 ) ( ON ?auto_459440 ?auto_459441 ) ( ON ?auto_459439 ?auto_459440 ) ( CLEAR ?auto_459437 ) ( ON ?auto_459438 ?auto_459439 ) ( CLEAR ?auto_459438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_459434 ?auto_459435 ?auto_459436 ?auto_459437 ?auto_459438 )
      ( MAKE-15PILE ?auto_459434 ?auto_459435 ?auto_459436 ?auto_459437 ?auto_459438 ?auto_459439 ?auto_459440 ?auto_459441 ?auto_459442 ?auto_459443 ?auto_459444 ?auto_459445 ?auto_459446 ?auto_459447 ?auto_459448 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459464 - BLOCK
      ?auto_459465 - BLOCK
      ?auto_459466 - BLOCK
      ?auto_459467 - BLOCK
      ?auto_459468 - BLOCK
      ?auto_459469 - BLOCK
      ?auto_459470 - BLOCK
      ?auto_459471 - BLOCK
      ?auto_459472 - BLOCK
      ?auto_459473 - BLOCK
      ?auto_459474 - BLOCK
      ?auto_459475 - BLOCK
      ?auto_459476 - BLOCK
      ?auto_459477 - BLOCK
      ?auto_459478 - BLOCK
    )
    :vars
    (
      ?auto_459479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459478 ?auto_459479 ) ( ON-TABLE ?auto_459464 ) ( ON ?auto_459465 ?auto_459464 ) ( ON ?auto_459466 ?auto_459465 ) ( not ( = ?auto_459464 ?auto_459465 ) ) ( not ( = ?auto_459464 ?auto_459466 ) ) ( not ( = ?auto_459464 ?auto_459467 ) ) ( not ( = ?auto_459464 ?auto_459468 ) ) ( not ( = ?auto_459464 ?auto_459469 ) ) ( not ( = ?auto_459464 ?auto_459470 ) ) ( not ( = ?auto_459464 ?auto_459471 ) ) ( not ( = ?auto_459464 ?auto_459472 ) ) ( not ( = ?auto_459464 ?auto_459473 ) ) ( not ( = ?auto_459464 ?auto_459474 ) ) ( not ( = ?auto_459464 ?auto_459475 ) ) ( not ( = ?auto_459464 ?auto_459476 ) ) ( not ( = ?auto_459464 ?auto_459477 ) ) ( not ( = ?auto_459464 ?auto_459478 ) ) ( not ( = ?auto_459464 ?auto_459479 ) ) ( not ( = ?auto_459465 ?auto_459466 ) ) ( not ( = ?auto_459465 ?auto_459467 ) ) ( not ( = ?auto_459465 ?auto_459468 ) ) ( not ( = ?auto_459465 ?auto_459469 ) ) ( not ( = ?auto_459465 ?auto_459470 ) ) ( not ( = ?auto_459465 ?auto_459471 ) ) ( not ( = ?auto_459465 ?auto_459472 ) ) ( not ( = ?auto_459465 ?auto_459473 ) ) ( not ( = ?auto_459465 ?auto_459474 ) ) ( not ( = ?auto_459465 ?auto_459475 ) ) ( not ( = ?auto_459465 ?auto_459476 ) ) ( not ( = ?auto_459465 ?auto_459477 ) ) ( not ( = ?auto_459465 ?auto_459478 ) ) ( not ( = ?auto_459465 ?auto_459479 ) ) ( not ( = ?auto_459466 ?auto_459467 ) ) ( not ( = ?auto_459466 ?auto_459468 ) ) ( not ( = ?auto_459466 ?auto_459469 ) ) ( not ( = ?auto_459466 ?auto_459470 ) ) ( not ( = ?auto_459466 ?auto_459471 ) ) ( not ( = ?auto_459466 ?auto_459472 ) ) ( not ( = ?auto_459466 ?auto_459473 ) ) ( not ( = ?auto_459466 ?auto_459474 ) ) ( not ( = ?auto_459466 ?auto_459475 ) ) ( not ( = ?auto_459466 ?auto_459476 ) ) ( not ( = ?auto_459466 ?auto_459477 ) ) ( not ( = ?auto_459466 ?auto_459478 ) ) ( not ( = ?auto_459466 ?auto_459479 ) ) ( not ( = ?auto_459467 ?auto_459468 ) ) ( not ( = ?auto_459467 ?auto_459469 ) ) ( not ( = ?auto_459467 ?auto_459470 ) ) ( not ( = ?auto_459467 ?auto_459471 ) ) ( not ( = ?auto_459467 ?auto_459472 ) ) ( not ( = ?auto_459467 ?auto_459473 ) ) ( not ( = ?auto_459467 ?auto_459474 ) ) ( not ( = ?auto_459467 ?auto_459475 ) ) ( not ( = ?auto_459467 ?auto_459476 ) ) ( not ( = ?auto_459467 ?auto_459477 ) ) ( not ( = ?auto_459467 ?auto_459478 ) ) ( not ( = ?auto_459467 ?auto_459479 ) ) ( not ( = ?auto_459468 ?auto_459469 ) ) ( not ( = ?auto_459468 ?auto_459470 ) ) ( not ( = ?auto_459468 ?auto_459471 ) ) ( not ( = ?auto_459468 ?auto_459472 ) ) ( not ( = ?auto_459468 ?auto_459473 ) ) ( not ( = ?auto_459468 ?auto_459474 ) ) ( not ( = ?auto_459468 ?auto_459475 ) ) ( not ( = ?auto_459468 ?auto_459476 ) ) ( not ( = ?auto_459468 ?auto_459477 ) ) ( not ( = ?auto_459468 ?auto_459478 ) ) ( not ( = ?auto_459468 ?auto_459479 ) ) ( not ( = ?auto_459469 ?auto_459470 ) ) ( not ( = ?auto_459469 ?auto_459471 ) ) ( not ( = ?auto_459469 ?auto_459472 ) ) ( not ( = ?auto_459469 ?auto_459473 ) ) ( not ( = ?auto_459469 ?auto_459474 ) ) ( not ( = ?auto_459469 ?auto_459475 ) ) ( not ( = ?auto_459469 ?auto_459476 ) ) ( not ( = ?auto_459469 ?auto_459477 ) ) ( not ( = ?auto_459469 ?auto_459478 ) ) ( not ( = ?auto_459469 ?auto_459479 ) ) ( not ( = ?auto_459470 ?auto_459471 ) ) ( not ( = ?auto_459470 ?auto_459472 ) ) ( not ( = ?auto_459470 ?auto_459473 ) ) ( not ( = ?auto_459470 ?auto_459474 ) ) ( not ( = ?auto_459470 ?auto_459475 ) ) ( not ( = ?auto_459470 ?auto_459476 ) ) ( not ( = ?auto_459470 ?auto_459477 ) ) ( not ( = ?auto_459470 ?auto_459478 ) ) ( not ( = ?auto_459470 ?auto_459479 ) ) ( not ( = ?auto_459471 ?auto_459472 ) ) ( not ( = ?auto_459471 ?auto_459473 ) ) ( not ( = ?auto_459471 ?auto_459474 ) ) ( not ( = ?auto_459471 ?auto_459475 ) ) ( not ( = ?auto_459471 ?auto_459476 ) ) ( not ( = ?auto_459471 ?auto_459477 ) ) ( not ( = ?auto_459471 ?auto_459478 ) ) ( not ( = ?auto_459471 ?auto_459479 ) ) ( not ( = ?auto_459472 ?auto_459473 ) ) ( not ( = ?auto_459472 ?auto_459474 ) ) ( not ( = ?auto_459472 ?auto_459475 ) ) ( not ( = ?auto_459472 ?auto_459476 ) ) ( not ( = ?auto_459472 ?auto_459477 ) ) ( not ( = ?auto_459472 ?auto_459478 ) ) ( not ( = ?auto_459472 ?auto_459479 ) ) ( not ( = ?auto_459473 ?auto_459474 ) ) ( not ( = ?auto_459473 ?auto_459475 ) ) ( not ( = ?auto_459473 ?auto_459476 ) ) ( not ( = ?auto_459473 ?auto_459477 ) ) ( not ( = ?auto_459473 ?auto_459478 ) ) ( not ( = ?auto_459473 ?auto_459479 ) ) ( not ( = ?auto_459474 ?auto_459475 ) ) ( not ( = ?auto_459474 ?auto_459476 ) ) ( not ( = ?auto_459474 ?auto_459477 ) ) ( not ( = ?auto_459474 ?auto_459478 ) ) ( not ( = ?auto_459474 ?auto_459479 ) ) ( not ( = ?auto_459475 ?auto_459476 ) ) ( not ( = ?auto_459475 ?auto_459477 ) ) ( not ( = ?auto_459475 ?auto_459478 ) ) ( not ( = ?auto_459475 ?auto_459479 ) ) ( not ( = ?auto_459476 ?auto_459477 ) ) ( not ( = ?auto_459476 ?auto_459478 ) ) ( not ( = ?auto_459476 ?auto_459479 ) ) ( not ( = ?auto_459477 ?auto_459478 ) ) ( not ( = ?auto_459477 ?auto_459479 ) ) ( not ( = ?auto_459478 ?auto_459479 ) ) ( ON ?auto_459477 ?auto_459478 ) ( ON ?auto_459476 ?auto_459477 ) ( ON ?auto_459475 ?auto_459476 ) ( ON ?auto_459474 ?auto_459475 ) ( ON ?auto_459473 ?auto_459474 ) ( ON ?auto_459472 ?auto_459473 ) ( ON ?auto_459471 ?auto_459472 ) ( ON ?auto_459470 ?auto_459471 ) ( ON ?auto_459469 ?auto_459470 ) ( ON ?auto_459468 ?auto_459469 ) ( CLEAR ?auto_459466 ) ( ON ?auto_459467 ?auto_459468 ) ( CLEAR ?auto_459467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_459464 ?auto_459465 ?auto_459466 ?auto_459467 )
      ( MAKE-15PILE ?auto_459464 ?auto_459465 ?auto_459466 ?auto_459467 ?auto_459468 ?auto_459469 ?auto_459470 ?auto_459471 ?auto_459472 ?auto_459473 ?auto_459474 ?auto_459475 ?auto_459476 ?auto_459477 ?auto_459478 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459495 - BLOCK
      ?auto_459496 - BLOCK
      ?auto_459497 - BLOCK
      ?auto_459498 - BLOCK
      ?auto_459499 - BLOCK
      ?auto_459500 - BLOCK
      ?auto_459501 - BLOCK
      ?auto_459502 - BLOCK
      ?auto_459503 - BLOCK
      ?auto_459504 - BLOCK
      ?auto_459505 - BLOCK
      ?auto_459506 - BLOCK
      ?auto_459507 - BLOCK
      ?auto_459508 - BLOCK
      ?auto_459509 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_459509 ) ( ON-TABLE ?auto_459495 ) ( ON ?auto_459496 ?auto_459495 ) ( ON ?auto_459497 ?auto_459496 ) ( not ( = ?auto_459495 ?auto_459496 ) ) ( not ( = ?auto_459495 ?auto_459497 ) ) ( not ( = ?auto_459495 ?auto_459498 ) ) ( not ( = ?auto_459495 ?auto_459499 ) ) ( not ( = ?auto_459495 ?auto_459500 ) ) ( not ( = ?auto_459495 ?auto_459501 ) ) ( not ( = ?auto_459495 ?auto_459502 ) ) ( not ( = ?auto_459495 ?auto_459503 ) ) ( not ( = ?auto_459495 ?auto_459504 ) ) ( not ( = ?auto_459495 ?auto_459505 ) ) ( not ( = ?auto_459495 ?auto_459506 ) ) ( not ( = ?auto_459495 ?auto_459507 ) ) ( not ( = ?auto_459495 ?auto_459508 ) ) ( not ( = ?auto_459495 ?auto_459509 ) ) ( not ( = ?auto_459496 ?auto_459497 ) ) ( not ( = ?auto_459496 ?auto_459498 ) ) ( not ( = ?auto_459496 ?auto_459499 ) ) ( not ( = ?auto_459496 ?auto_459500 ) ) ( not ( = ?auto_459496 ?auto_459501 ) ) ( not ( = ?auto_459496 ?auto_459502 ) ) ( not ( = ?auto_459496 ?auto_459503 ) ) ( not ( = ?auto_459496 ?auto_459504 ) ) ( not ( = ?auto_459496 ?auto_459505 ) ) ( not ( = ?auto_459496 ?auto_459506 ) ) ( not ( = ?auto_459496 ?auto_459507 ) ) ( not ( = ?auto_459496 ?auto_459508 ) ) ( not ( = ?auto_459496 ?auto_459509 ) ) ( not ( = ?auto_459497 ?auto_459498 ) ) ( not ( = ?auto_459497 ?auto_459499 ) ) ( not ( = ?auto_459497 ?auto_459500 ) ) ( not ( = ?auto_459497 ?auto_459501 ) ) ( not ( = ?auto_459497 ?auto_459502 ) ) ( not ( = ?auto_459497 ?auto_459503 ) ) ( not ( = ?auto_459497 ?auto_459504 ) ) ( not ( = ?auto_459497 ?auto_459505 ) ) ( not ( = ?auto_459497 ?auto_459506 ) ) ( not ( = ?auto_459497 ?auto_459507 ) ) ( not ( = ?auto_459497 ?auto_459508 ) ) ( not ( = ?auto_459497 ?auto_459509 ) ) ( not ( = ?auto_459498 ?auto_459499 ) ) ( not ( = ?auto_459498 ?auto_459500 ) ) ( not ( = ?auto_459498 ?auto_459501 ) ) ( not ( = ?auto_459498 ?auto_459502 ) ) ( not ( = ?auto_459498 ?auto_459503 ) ) ( not ( = ?auto_459498 ?auto_459504 ) ) ( not ( = ?auto_459498 ?auto_459505 ) ) ( not ( = ?auto_459498 ?auto_459506 ) ) ( not ( = ?auto_459498 ?auto_459507 ) ) ( not ( = ?auto_459498 ?auto_459508 ) ) ( not ( = ?auto_459498 ?auto_459509 ) ) ( not ( = ?auto_459499 ?auto_459500 ) ) ( not ( = ?auto_459499 ?auto_459501 ) ) ( not ( = ?auto_459499 ?auto_459502 ) ) ( not ( = ?auto_459499 ?auto_459503 ) ) ( not ( = ?auto_459499 ?auto_459504 ) ) ( not ( = ?auto_459499 ?auto_459505 ) ) ( not ( = ?auto_459499 ?auto_459506 ) ) ( not ( = ?auto_459499 ?auto_459507 ) ) ( not ( = ?auto_459499 ?auto_459508 ) ) ( not ( = ?auto_459499 ?auto_459509 ) ) ( not ( = ?auto_459500 ?auto_459501 ) ) ( not ( = ?auto_459500 ?auto_459502 ) ) ( not ( = ?auto_459500 ?auto_459503 ) ) ( not ( = ?auto_459500 ?auto_459504 ) ) ( not ( = ?auto_459500 ?auto_459505 ) ) ( not ( = ?auto_459500 ?auto_459506 ) ) ( not ( = ?auto_459500 ?auto_459507 ) ) ( not ( = ?auto_459500 ?auto_459508 ) ) ( not ( = ?auto_459500 ?auto_459509 ) ) ( not ( = ?auto_459501 ?auto_459502 ) ) ( not ( = ?auto_459501 ?auto_459503 ) ) ( not ( = ?auto_459501 ?auto_459504 ) ) ( not ( = ?auto_459501 ?auto_459505 ) ) ( not ( = ?auto_459501 ?auto_459506 ) ) ( not ( = ?auto_459501 ?auto_459507 ) ) ( not ( = ?auto_459501 ?auto_459508 ) ) ( not ( = ?auto_459501 ?auto_459509 ) ) ( not ( = ?auto_459502 ?auto_459503 ) ) ( not ( = ?auto_459502 ?auto_459504 ) ) ( not ( = ?auto_459502 ?auto_459505 ) ) ( not ( = ?auto_459502 ?auto_459506 ) ) ( not ( = ?auto_459502 ?auto_459507 ) ) ( not ( = ?auto_459502 ?auto_459508 ) ) ( not ( = ?auto_459502 ?auto_459509 ) ) ( not ( = ?auto_459503 ?auto_459504 ) ) ( not ( = ?auto_459503 ?auto_459505 ) ) ( not ( = ?auto_459503 ?auto_459506 ) ) ( not ( = ?auto_459503 ?auto_459507 ) ) ( not ( = ?auto_459503 ?auto_459508 ) ) ( not ( = ?auto_459503 ?auto_459509 ) ) ( not ( = ?auto_459504 ?auto_459505 ) ) ( not ( = ?auto_459504 ?auto_459506 ) ) ( not ( = ?auto_459504 ?auto_459507 ) ) ( not ( = ?auto_459504 ?auto_459508 ) ) ( not ( = ?auto_459504 ?auto_459509 ) ) ( not ( = ?auto_459505 ?auto_459506 ) ) ( not ( = ?auto_459505 ?auto_459507 ) ) ( not ( = ?auto_459505 ?auto_459508 ) ) ( not ( = ?auto_459505 ?auto_459509 ) ) ( not ( = ?auto_459506 ?auto_459507 ) ) ( not ( = ?auto_459506 ?auto_459508 ) ) ( not ( = ?auto_459506 ?auto_459509 ) ) ( not ( = ?auto_459507 ?auto_459508 ) ) ( not ( = ?auto_459507 ?auto_459509 ) ) ( not ( = ?auto_459508 ?auto_459509 ) ) ( ON ?auto_459508 ?auto_459509 ) ( ON ?auto_459507 ?auto_459508 ) ( ON ?auto_459506 ?auto_459507 ) ( ON ?auto_459505 ?auto_459506 ) ( ON ?auto_459504 ?auto_459505 ) ( ON ?auto_459503 ?auto_459504 ) ( ON ?auto_459502 ?auto_459503 ) ( ON ?auto_459501 ?auto_459502 ) ( ON ?auto_459500 ?auto_459501 ) ( ON ?auto_459499 ?auto_459500 ) ( CLEAR ?auto_459497 ) ( ON ?auto_459498 ?auto_459499 ) ( CLEAR ?auto_459498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_459495 ?auto_459496 ?auto_459497 ?auto_459498 )
      ( MAKE-15PILE ?auto_459495 ?auto_459496 ?auto_459497 ?auto_459498 ?auto_459499 ?auto_459500 ?auto_459501 ?auto_459502 ?auto_459503 ?auto_459504 ?auto_459505 ?auto_459506 ?auto_459507 ?auto_459508 ?auto_459509 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459525 - BLOCK
      ?auto_459526 - BLOCK
      ?auto_459527 - BLOCK
      ?auto_459528 - BLOCK
      ?auto_459529 - BLOCK
      ?auto_459530 - BLOCK
      ?auto_459531 - BLOCK
      ?auto_459532 - BLOCK
      ?auto_459533 - BLOCK
      ?auto_459534 - BLOCK
      ?auto_459535 - BLOCK
      ?auto_459536 - BLOCK
      ?auto_459537 - BLOCK
      ?auto_459538 - BLOCK
      ?auto_459539 - BLOCK
    )
    :vars
    (
      ?auto_459540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459539 ?auto_459540 ) ( ON-TABLE ?auto_459525 ) ( ON ?auto_459526 ?auto_459525 ) ( not ( = ?auto_459525 ?auto_459526 ) ) ( not ( = ?auto_459525 ?auto_459527 ) ) ( not ( = ?auto_459525 ?auto_459528 ) ) ( not ( = ?auto_459525 ?auto_459529 ) ) ( not ( = ?auto_459525 ?auto_459530 ) ) ( not ( = ?auto_459525 ?auto_459531 ) ) ( not ( = ?auto_459525 ?auto_459532 ) ) ( not ( = ?auto_459525 ?auto_459533 ) ) ( not ( = ?auto_459525 ?auto_459534 ) ) ( not ( = ?auto_459525 ?auto_459535 ) ) ( not ( = ?auto_459525 ?auto_459536 ) ) ( not ( = ?auto_459525 ?auto_459537 ) ) ( not ( = ?auto_459525 ?auto_459538 ) ) ( not ( = ?auto_459525 ?auto_459539 ) ) ( not ( = ?auto_459525 ?auto_459540 ) ) ( not ( = ?auto_459526 ?auto_459527 ) ) ( not ( = ?auto_459526 ?auto_459528 ) ) ( not ( = ?auto_459526 ?auto_459529 ) ) ( not ( = ?auto_459526 ?auto_459530 ) ) ( not ( = ?auto_459526 ?auto_459531 ) ) ( not ( = ?auto_459526 ?auto_459532 ) ) ( not ( = ?auto_459526 ?auto_459533 ) ) ( not ( = ?auto_459526 ?auto_459534 ) ) ( not ( = ?auto_459526 ?auto_459535 ) ) ( not ( = ?auto_459526 ?auto_459536 ) ) ( not ( = ?auto_459526 ?auto_459537 ) ) ( not ( = ?auto_459526 ?auto_459538 ) ) ( not ( = ?auto_459526 ?auto_459539 ) ) ( not ( = ?auto_459526 ?auto_459540 ) ) ( not ( = ?auto_459527 ?auto_459528 ) ) ( not ( = ?auto_459527 ?auto_459529 ) ) ( not ( = ?auto_459527 ?auto_459530 ) ) ( not ( = ?auto_459527 ?auto_459531 ) ) ( not ( = ?auto_459527 ?auto_459532 ) ) ( not ( = ?auto_459527 ?auto_459533 ) ) ( not ( = ?auto_459527 ?auto_459534 ) ) ( not ( = ?auto_459527 ?auto_459535 ) ) ( not ( = ?auto_459527 ?auto_459536 ) ) ( not ( = ?auto_459527 ?auto_459537 ) ) ( not ( = ?auto_459527 ?auto_459538 ) ) ( not ( = ?auto_459527 ?auto_459539 ) ) ( not ( = ?auto_459527 ?auto_459540 ) ) ( not ( = ?auto_459528 ?auto_459529 ) ) ( not ( = ?auto_459528 ?auto_459530 ) ) ( not ( = ?auto_459528 ?auto_459531 ) ) ( not ( = ?auto_459528 ?auto_459532 ) ) ( not ( = ?auto_459528 ?auto_459533 ) ) ( not ( = ?auto_459528 ?auto_459534 ) ) ( not ( = ?auto_459528 ?auto_459535 ) ) ( not ( = ?auto_459528 ?auto_459536 ) ) ( not ( = ?auto_459528 ?auto_459537 ) ) ( not ( = ?auto_459528 ?auto_459538 ) ) ( not ( = ?auto_459528 ?auto_459539 ) ) ( not ( = ?auto_459528 ?auto_459540 ) ) ( not ( = ?auto_459529 ?auto_459530 ) ) ( not ( = ?auto_459529 ?auto_459531 ) ) ( not ( = ?auto_459529 ?auto_459532 ) ) ( not ( = ?auto_459529 ?auto_459533 ) ) ( not ( = ?auto_459529 ?auto_459534 ) ) ( not ( = ?auto_459529 ?auto_459535 ) ) ( not ( = ?auto_459529 ?auto_459536 ) ) ( not ( = ?auto_459529 ?auto_459537 ) ) ( not ( = ?auto_459529 ?auto_459538 ) ) ( not ( = ?auto_459529 ?auto_459539 ) ) ( not ( = ?auto_459529 ?auto_459540 ) ) ( not ( = ?auto_459530 ?auto_459531 ) ) ( not ( = ?auto_459530 ?auto_459532 ) ) ( not ( = ?auto_459530 ?auto_459533 ) ) ( not ( = ?auto_459530 ?auto_459534 ) ) ( not ( = ?auto_459530 ?auto_459535 ) ) ( not ( = ?auto_459530 ?auto_459536 ) ) ( not ( = ?auto_459530 ?auto_459537 ) ) ( not ( = ?auto_459530 ?auto_459538 ) ) ( not ( = ?auto_459530 ?auto_459539 ) ) ( not ( = ?auto_459530 ?auto_459540 ) ) ( not ( = ?auto_459531 ?auto_459532 ) ) ( not ( = ?auto_459531 ?auto_459533 ) ) ( not ( = ?auto_459531 ?auto_459534 ) ) ( not ( = ?auto_459531 ?auto_459535 ) ) ( not ( = ?auto_459531 ?auto_459536 ) ) ( not ( = ?auto_459531 ?auto_459537 ) ) ( not ( = ?auto_459531 ?auto_459538 ) ) ( not ( = ?auto_459531 ?auto_459539 ) ) ( not ( = ?auto_459531 ?auto_459540 ) ) ( not ( = ?auto_459532 ?auto_459533 ) ) ( not ( = ?auto_459532 ?auto_459534 ) ) ( not ( = ?auto_459532 ?auto_459535 ) ) ( not ( = ?auto_459532 ?auto_459536 ) ) ( not ( = ?auto_459532 ?auto_459537 ) ) ( not ( = ?auto_459532 ?auto_459538 ) ) ( not ( = ?auto_459532 ?auto_459539 ) ) ( not ( = ?auto_459532 ?auto_459540 ) ) ( not ( = ?auto_459533 ?auto_459534 ) ) ( not ( = ?auto_459533 ?auto_459535 ) ) ( not ( = ?auto_459533 ?auto_459536 ) ) ( not ( = ?auto_459533 ?auto_459537 ) ) ( not ( = ?auto_459533 ?auto_459538 ) ) ( not ( = ?auto_459533 ?auto_459539 ) ) ( not ( = ?auto_459533 ?auto_459540 ) ) ( not ( = ?auto_459534 ?auto_459535 ) ) ( not ( = ?auto_459534 ?auto_459536 ) ) ( not ( = ?auto_459534 ?auto_459537 ) ) ( not ( = ?auto_459534 ?auto_459538 ) ) ( not ( = ?auto_459534 ?auto_459539 ) ) ( not ( = ?auto_459534 ?auto_459540 ) ) ( not ( = ?auto_459535 ?auto_459536 ) ) ( not ( = ?auto_459535 ?auto_459537 ) ) ( not ( = ?auto_459535 ?auto_459538 ) ) ( not ( = ?auto_459535 ?auto_459539 ) ) ( not ( = ?auto_459535 ?auto_459540 ) ) ( not ( = ?auto_459536 ?auto_459537 ) ) ( not ( = ?auto_459536 ?auto_459538 ) ) ( not ( = ?auto_459536 ?auto_459539 ) ) ( not ( = ?auto_459536 ?auto_459540 ) ) ( not ( = ?auto_459537 ?auto_459538 ) ) ( not ( = ?auto_459537 ?auto_459539 ) ) ( not ( = ?auto_459537 ?auto_459540 ) ) ( not ( = ?auto_459538 ?auto_459539 ) ) ( not ( = ?auto_459538 ?auto_459540 ) ) ( not ( = ?auto_459539 ?auto_459540 ) ) ( ON ?auto_459538 ?auto_459539 ) ( ON ?auto_459537 ?auto_459538 ) ( ON ?auto_459536 ?auto_459537 ) ( ON ?auto_459535 ?auto_459536 ) ( ON ?auto_459534 ?auto_459535 ) ( ON ?auto_459533 ?auto_459534 ) ( ON ?auto_459532 ?auto_459533 ) ( ON ?auto_459531 ?auto_459532 ) ( ON ?auto_459530 ?auto_459531 ) ( ON ?auto_459529 ?auto_459530 ) ( ON ?auto_459528 ?auto_459529 ) ( CLEAR ?auto_459526 ) ( ON ?auto_459527 ?auto_459528 ) ( CLEAR ?auto_459527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_459525 ?auto_459526 ?auto_459527 )
      ( MAKE-15PILE ?auto_459525 ?auto_459526 ?auto_459527 ?auto_459528 ?auto_459529 ?auto_459530 ?auto_459531 ?auto_459532 ?auto_459533 ?auto_459534 ?auto_459535 ?auto_459536 ?auto_459537 ?auto_459538 ?auto_459539 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459556 - BLOCK
      ?auto_459557 - BLOCK
      ?auto_459558 - BLOCK
      ?auto_459559 - BLOCK
      ?auto_459560 - BLOCK
      ?auto_459561 - BLOCK
      ?auto_459562 - BLOCK
      ?auto_459563 - BLOCK
      ?auto_459564 - BLOCK
      ?auto_459565 - BLOCK
      ?auto_459566 - BLOCK
      ?auto_459567 - BLOCK
      ?auto_459568 - BLOCK
      ?auto_459569 - BLOCK
      ?auto_459570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_459570 ) ( ON-TABLE ?auto_459556 ) ( ON ?auto_459557 ?auto_459556 ) ( not ( = ?auto_459556 ?auto_459557 ) ) ( not ( = ?auto_459556 ?auto_459558 ) ) ( not ( = ?auto_459556 ?auto_459559 ) ) ( not ( = ?auto_459556 ?auto_459560 ) ) ( not ( = ?auto_459556 ?auto_459561 ) ) ( not ( = ?auto_459556 ?auto_459562 ) ) ( not ( = ?auto_459556 ?auto_459563 ) ) ( not ( = ?auto_459556 ?auto_459564 ) ) ( not ( = ?auto_459556 ?auto_459565 ) ) ( not ( = ?auto_459556 ?auto_459566 ) ) ( not ( = ?auto_459556 ?auto_459567 ) ) ( not ( = ?auto_459556 ?auto_459568 ) ) ( not ( = ?auto_459556 ?auto_459569 ) ) ( not ( = ?auto_459556 ?auto_459570 ) ) ( not ( = ?auto_459557 ?auto_459558 ) ) ( not ( = ?auto_459557 ?auto_459559 ) ) ( not ( = ?auto_459557 ?auto_459560 ) ) ( not ( = ?auto_459557 ?auto_459561 ) ) ( not ( = ?auto_459557 ?auto_459562 ) ) ( not ( = ?auto_459557 ?auto_459563 ) ) ( not ( = ?auto_459557 ?auto_459564 ) ) ( not ( = ?auto_459557 ?auto_459565 ) ) ( not ( = ?auto_459557 ?auto_459566 ) ) ( not ( = ?auto_459557 ?auto_459567 ) ) ( not ( = ?auto_459557 ?auto_459568 ) ) ( not ( = ?auto_459557 ?auto_459569 ) ) ( not ( = ?auto_459557 ?auto_459570 ) ) ( not ( = ?auto_459558 ?auto_459559 ) ) ( not ( = ?auto_459558 ?auto_459560 ) ) ( not ( = ?auto_459558 ?auto_459561 ) ) ( not ( = ?auto_459558 ?auto_459562 ) ) ( not ( = ?auto_459558 ?auto_459563 ) ) ( not ( = ?auto_459558 ?auto_459564 ) ) ( not ( = ?auto_459558 ?auto_459565 ) ) ( not ( = ?auto_459558 ?auto_459566 ) ) ( not ( = ?auto_459558 ?auto_459567 ) ) ( not ( = ?auto_459558 ?auto_459568 ) ) ( not ( = ?auto_459558 ?auto_459569 ) ) ( not ( = ?auto_459558 ?auto_459570 ) ) ( not ( = ?auto_459559 ?auto_459560 ) ) ( not ( = ?auto_459559 ?auto_459561 ) ) ( not ( = ?auto_459559 ?auto_459562 ) ) ( not ( = ?auto_459559 ?auto_459563 ) ) ( not ( = ?auto_459559 ?auto_459564 ) ) ( not ( = ?auto_459559 ?auto_459565 ) ) ( not ( = ?auto_459559 ?auto_459566 ) ) ( not ( = ?auto_459559 ?auto_459567 ) ) ( not ( = ?auto_459559 ?auto_459568 ) ) ( not ( = ?auto_459559 ?auto_459569 ) ) ( not ( = ?auto_459559 ?auto_459570 ) ) ( not ( = ?auto_459560 ?auto_459561 ) ) ( not ( = ?auto_459560 ?auto_459562 ) ) ( not ( = ?auto_459560 ?auto_459563 ) ) ( not ( = ?auto_459560 ?auto_459564 ) ) ( not ( = ?auto_459560 ?auto_459565 ) ) ( not ( = ?auto_459560 ?auto_459566 ) ) ( not ( = ?auto_459560 ?auto_459567 ) ) ( not ( = ?auto_459560 ?auto_459568 ) ) ( not ( = ?auto_459560 ?auto_459569 ) ) ( not ( = ?auto_459560 ?auto_459570 ) ) ( not ( = ?auto_459561 ?auto_459562 ) ) ( not ( = ?auto_459561 ?auto_459563 ) ) ( not ( = ?auto_459561 ?auto_459564 ) ) ( not ( = ?auto_459561 ?auto_459565 ) ) ( not ( = ?auto_459561 ?auto_459566 ) ) ( not ( = ?auto_459561 ?auto_459567 ) ) ( not ( = ?auto_459561 ?auto_459568 ) ) ( not ( = ?auto_459561 ?auto_459569 ) ) ( not ( = ?auto_459561 ?auto_459570 ) ) ( not ( = ?auto_459562 ?auto_459563 ) ) ( not ( = ?auto_459562 ?auto_459564 ) ) ( not ( = ?auto_459562 ?auto_459565 ) ) ( not ( = ?auto_459562 ?auto_459566 ) ) ( not ( = ?auto_459562 ?auto_459567 ) ) ( not ( = ?auto_459562 ?auto_459568 ) ) ( not ( = ?auto_459562 ?auto_459569 ) ) ( not ( = ?auto_459562 ?auto_459570 ) ) ( not ( = ?auto_459563 ?auto_459564 ) ) ( not ( = ?auto_459563 ?auto_459565 ) ) ( not ( = ?auto_459563 ?auto_459566 ) ) ( not ( = ?auto_459563 ?auto_459567 ) ) ( not ( = ?auto_459563 ?auto_459568 ) ) ( not ( = ?auto_459563 ?auto_459569 ) ) ( not ( = ?auto_459563 ?auto_459570 ) ) ( not ( = ?auto_459564 ?auto_459565 ) ) ( not ( = ?auto_459564 ?auto_459566 ) ) ( not ( = ?auto_459564 ?auto_459567 ) ) ( not ( = ?auto_459564 ?auto_459568 ) ) ( not ( = ?auto_459564 ?auto_459569 ) ) ( not ( = ?auto_459564 ?auto_459570 ) ) ( not ( = ?auto_459565 ?auto_459566 ) ) ( not ( = ?auto_459565 ?auto_459567 ) ) ( not ( = ?auto_459565 ?auto_459568 ) ) ( not ( = ?auto_459565 ?auto_459569 ) ) ( not ( = ?auto_459565 ?auto_459570 ) ) ( not ( = ?auto_459566 ?auto_459567 ) ) ( not ( = ?auto_459566 ?auto_459568 ) ) ( not ( = ?auto_459566 ?auto_459569 ) ) ( not ( = ?auto_459566 ?auto_459570 ) ) ( not ( = ?auto_459567 ?auto_459568 ) ) ( not ( = ?auto_459567 ?auto_459569 ) ) ( not ( = ?auto_459567 ?auto_459570 ) ) ( not ( = ?auto_459568 ?auto_459569 ) ) ( not ( = ?auto_459568 ?auto_459570 ) ) ( not ( = ?auto_459569 ?auto_459570 ) ) ( ON ?auto_459569 ?auto_459570 ) ( ON ?auto_459568 ?auto_459569 ) ( ON ?auto_459567 ?auto_459568 ) ( ON ?auto_459566 ?auto_459567 ) ( ON ?auto_459565 ?auto_459566 ) ( ON ?auto_459564 ?auto_459565 ) ( ON ?auto_459563 ?auto_459564 ) ( ON ?auto_459562 ?auto_459563 ) ( ON ?auto_459561 ?auto_459562 ) ( ON ?auto_459560 ?auto_459561 ) ( ON ?auto_459559 ?auto_459560 ) ( CLEAR ?auto_459557 ) ( ON ?auto_459558 ?auto_459559 ) ( CLEAR ?auto_459558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_459556 ?auto_459557 ?auto_459558 )
      ( MAKE-15PILE ?auto_459556 ?auto_459557 ?auto_459558 ?auto_459559 ?auto_459560 ?auto_459561 ?auto_459562 ?auto_459563 ?auto_459564 ?auto_459565 ?auto_459566 ?auto_459567 ?auto_459568 ?auto_459569 ?auto_459570 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459586 - BLOCK
      ?auto_459587 - BLOCK
      ?auto_459588 - BLOCK
      ?auto_459589 - BLOCK
      ?auto_459590 - BLOCK
      ?auto_459591 - BLOCK
      ?auto_459592 - BLOCK
      ?auto_459593 - BLOCK
      ?auto_459594 - BLOCK
      ?auto_459595 - BLOCK
      ?auto_459596 - BLOCK
      ?auto_459597 - BLOCK
      ?auto_459598 - BLOCK
      ?auto_459599 - BLOCK
      ?auto_459600 - BLOCK
    )
    :vars
    (
      ?auto_459601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459600 ?auto_459601 ) ( ON-TABLE ?auto_459586 ) ( not ( = ?auto_459586 ?auto_459587 ) ) ( not ( = ?auto_459586 ?auto_459588 ) ) ( not ( = ?auto_459586 ?auto_459589 ) ) ( not ( = ?auto_459586 ?auto_459590 ) ) ( not ( = ?auto_459586 ?auto_459591 ) ) ( not ( = ?auto_459586 ?auto_459592 ) ) ( not ( = ?auto_459586 ?auto_459593 ) ) ( not ( = ?auto_459586 ?auto_459594 ) ) ( not ( = ?auto_459586 ?auto_459595 ) ) ( not ( = ?auto_459586 ?auto_459596 ) ) ( not ( = ?auto_459586 ?auto_459597 ) ) ( not ( = ?auto_459586 ?auto_459598 ) ) ( not ( = ?auto_459586 ?auto_459599 ) ) ( not ( = ?auto_459586 ?auto_459600 ) ) ( not ( = ?auto_459586 ?auto_459601 ) ) ( not ( = ?auto_459587 ?auto_459588 ) ) ( not ( = ?auto_459587 ?auto_459589 ) ) ( not ( = ?auto_459587 ?auto_459590 ) ) ( not ( = ?auto_459587 ?auto_459591 ) ) ( not ( = ?auto_459587 ?auto_459592 ) ) ( not ( = ?auto_459587 ?auto_459593 ) ) ( not ( = ?auto_459587 ?auto_459594 ) ) ( not ( = ?auto_459587 ?auto_459595 ) ) ( not ( = ?auto_459587 ?auto_459596 ) ) ( not ( = ?auto_459587 ?auto_459597 ) ) ( not ( = ?auto_459587 ?auto_459598 ) ) ( not ( = ?auto_459587 ?auto_459599 ) ) ( not ( = ?auto_459587 ?auto_459600 ) ) ( not ( = ?auto_459587 ?auto_459601 ) ) ( not ( = ?auto_459588 ?auto_459589 ) ) ( not ( = ?auto_459588 ?auto_459590 ) ) ( not ( = ?auto_459588 ?auto_459591 ) ) ( not ( = ?auto_459588 ?auto_459592 ) ) ( not ( = ?auto_459588 ?auto_459593 ) ) ( not ( = ?auto_459588 ?auto_459594 ) ) ( not ( = ?auto_459588 ?auto_459595 ) ) ( not ( = ?auto_459588 ?auto_459596 ) ) ( not ( = ?auto_459588 ?auto_459597 ) ) ( not ( = ?auto_459588 ?auto_459598 ) ) ( not ( = ?auto_459588 ?auto_459599 ) ) ( not ( = ?auto_459588 ?auto_459600 ) ) ( not ( = ?auto_459588 ?auto_459601 ) ) ( not ( = ?auto_459589 ?auto_459590 ) ) ( not ( = ?auto_459589 ?auto_459591 ) ) ( not ( = ?auto_459589 ?auto_459592 ) ) ( not ( = ?auto_459589 ?auto_459593 ) ) ( not ( = ?auto_459589 ?auto_459594 ) ) ( not ( = ?auto_459589 ?auto_459595 ) ) ( not ( = ?auto_459589 ?auto_459596 ) ) ( not ( = ?auto_459589 ?auto_459597 ) ) ( not ( = ?auto_459589 ?auto_459598 ) ) ( not ( = ?auto_459589 ?auto_459599 ) ) ( not ( = ?auto_459589 ?auto_459600 ) ) ( not ( = ?auto_459589 ?auto_459601 ) ) ( not ( = ?auto_459590 ?auto_459591 ) ) ( not ( = ?auto_459590 ?auto_459592 ) ) ( not ( = ?auto_459590 ?auto_459593 ) ) ( not ( = ?auto_459590 ?auto_459594 ) ) ( not ( = ?auto_459590 ?auto_459595 ) ) ( not ( = ?auto_459590 ?auto_459596 ) ) ( not ( = ?auto_459590 ?auto_459597 ) ) ( not ( = ?auto_459590 ?auto_459598 ) ) ( not ( = ?auto_459590 ?auto_459599 ) ) ( not ( = ?auto_459590 ?auto_459600 ) ) ( not ( = ?auto_459590 ?auto_459601 ) ) ( not ( = ?auto_459591 ?auto_459592 ) ) ( not ( = ?auto_459591 ?auto_459593 ) ) ( not ( = ?auto_459591 ?auto_459594 ) ) ( not ( = ?auto_459591 ?auto_459595 ) ) ( not ( = ?auto_459591 ?auto_459596 ) ) ( not ( = ?auto_459591 ?auto_459597 ) ) ( not ( = ?auto_459591 ?auto_459598 ) ) ( not ( = ?auto_459591 ?auto_459599 ) ) ( not ( = ?auto_459591 ?auto_459600 ) ) ( not ( = ?auto_459591 ?auto_459601 ) ) ( not ( = ?auto_459592 ?auto_459593 ) ) ( not ( = ?auto_459592 ?auto_459594 ) ) ( not ( = ?auto_459592 ?auto_459595 ) ) ( not ( = ?auto_459592 ?auto_459596 ) ) ( not ( = ?auto_459592 ?auto_459597 ) ) ( not ( = ?auto_459592 ?auto_459598 ) ) ( not ( = ?auto_459592 ?auto_459599 ) ) ( not ( = ?auto_459592 ?auto_459600 ) ) ( not ( = ?auto_459592 ?auto_459601 ) ) ( not ( = ?auto_459593 ?auto_459594 ) ) ( not ( = ?auto_459593 ?auto_459595 ) ) ( not ( = ?auto_459593 ?auto_459596 ) ) ( not ( = ?auto_459593 ?auto_459597 ) ) ( not ( = ?auto_459593 ?auto_459598 ) ) ( not ( = ?auto_459593 ?auto_459599 ) ) ( not ( = ?auto_459593 ?auto_459600 ) ) ( not ( = ?auto_459593 ?auto_459601 ) ) ( not ( = ?auto_459594 ?auto_459595 ) ) ( not ( = ?auto_459594 ?auto_459596 ) ) ( not ( = ?auto_459594 ?auto_459597 ) ) ( not ( = ?auto_459594 ?auto_459598 ) ) ( not ( = ?auto_459594 ?auto_459599 ) ) ( not ( = ?auto_459594 ?auto_459600 ) ) ( not ( = ?auto_459594 ?auto_459601 ) ) ( not ( = ?auto_459595 ?auto_459596 ) ) ( not ( = ?auto_459595 ?auto_459597 ) ) ( not ( = ?auto_459595 ?auto_459598 ) ) ( not ( = ?auto_459595 ?auto_459599 ) ) ( not ( = ?auto_459595 ?auto_459600 ) ) ( not ( = ?auto_459595 ?auto_459601 ) ) ( not ( = ?auto_459596 ?auto_459597 ) ) ( not ( = ?auto_459596 ?auto_459598 ) ) ( not ( = ?auto_459596 ?auto_459599 ) ) ( not ( = ?auto_459596 ?auto_459600 ) ) ( not ( = ?auto_459596 ?auto_459601 ) ) ( not ( = ?auto_459597 ?auto_459598 ) ) ( not ( = ?auto_459597 ?auto_459599 ) ) ( not ( = ?auto_459597 ?auto_459600 ) ) ( not ( = ?auto_459597 ?auto_459601 ) ) ( not ( = ?auto_459598 ?auto_459599 ) ) ( not ( = ?auto_459598 ?auto_459600 ) ) ( not ( = ?auto_459598 ?auto_459601 ) ) ( not ( = ?auto_459599 ?auto_459600 ) ) ( not ( = ?auto_459599 ?auto_459601 ) ) ( not ( = ?auto_459600 ?auto_459601 ) ) ( ON ?auto_459599 ?auto_459600 ) ( ON ?auto_459598 ?auto_459599 ) ( ON ?auto_459597 ?auto_459598 ) ( ON ?auto_459596 ?auto_459597 ) ( ON ?auto_459595 ?auto_459596 ) ( ON ?auto_459594 ?auto_459595 ) ( ON ?auto_459593 ?auto_459594 ) ( ON ?auto_459592 ?auto_459593 ) ( ON ?auto_459591 ?auto_459592 ) ( ON ?auto_459590 ?auto_459591 ) ( ON ?auto_459589 ?auto_459590 ) ( ON ?auto_459588 ?auto_459589 ) ( CLEAR ?auto_459586 ) ( ON ?auto_459587 ?auto_459588 ) ( CLEAR ?auto_459587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_459586 ?auto_459587 )
      ( MAKE-15PILE ?auto_459586 ?auto_459587 ?auto_459588 ?auto_459589 ?auto_459590 ?auto_459591 ?auto_459592 ?auto_459593 ?auto_459594 ?auto_459595 ?auto_459596 ?auto_459597 ?auto_459598 ?auto_459599 ?auto_459600 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459617 - BLOCK
      ?auto_459618 - BLOCK
      ?auto_459619 - BLOCK
      ?auto_459620 - BLOCK
      ?auto_459621 - BLOCK
      ?auto_459622 - BLOCK
      ?auto_459623 - BLOCK
      ?auto_459624 - BLOCK
      ?auto_459625 - BLOCK
      ?auto_459626 - BLOCK
      ?auto_459627 - BLOCK
      ?auto_459628 - BLOCK
      ?auto_459629 - BLOCK
      ?auto_459630 - BLOCK
      ?auto_459631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_459631 ) ( ON-TABLE ?auto_459617 ) ( not ( = ?auto_459617 ?auto_459618 ) ) ( not ( = ?auto_459617 ?auto_459619 ) ) ( not ( = ?auto_459617 ?auto_459620 ) ) ( not ( = ?auto_459617 ?auto_459621 ) ) ( not ( = ?auto_459617 ?auto_459622 ) ) ( not ( = ?auto_459617 ?auto_459623 ) ) ( not ( = ?auto_459617 ?auto_459624 ) ) ( not ( = ?auto_459617 ?auto_459625 ) ) ( not ( = ?auto_459617 ?auto_459626 ) ) ( not ( = ?auto_459617 ?auto_459627 ) ) ( not ( = ?auto_459617 ?auto_459628 ) ) ( not ( = ?auto_459617 ?auto_459629 ) ) ( not ( = ?auto_459617 ?auto_459630 ) ) ( not ( = ?auto_459617 ?auto_459631 ) ) ( not ( = ?auto_459618 ?auto_459619 ) ) ( not ( = ?auto_459618 ?auto_459620 ) ) ( not ( = ?auto_459618 ?auto_459621 ) ) ( not ( = ?auto_459618 ?auto_459622 ) ) ( not ( = ?auto_459618 ?auto_459623 ) ) ( not ( = ?auto_459618 ?auto_459624 ) ) ( not ( = ?auto_459618 ?auto_459625 ) ) ( not ( = ?auto_459618 ?auto_459626 ) ) ( not ( = ?auto_459618 ?auto_459627 ) ) ( not ( = ?auto_459618 ?auto_459628 ) ) ( not ( = ?auto_459618 ?auto_459629 ) ) ( not ( = ?auto_459618 ?auto_459630 ) ) ( not ( = ?auto_459618 ?auto_459631 ) ) ( not ( = ?auto_459619 ?auto_459620 ) ) ( not ( = ?auto_459619 ?auto_459621 ) ) ( not ( = ?auto_459619 ?auto_459622 ) ) ( not ( = ?auto_459619 ?auto_459623 ) ) ( not ( = ?auto_459619 ?auto_459624 ) ) ( not ( = ?auto_459619 ?auto_459625 ) ) ( not ( = ?auto_459619 ?auto_459626 ) ) ( not ( = ?auto_459619 ?auto_459627 ) ) ( not ( = ?auto_459619 ?auto_459628 ) ) ( not ( = ?auto_459619 ?auto_459629 ) ) ( not ( = ?auto_459619 ?auto_459630 ) ) ( not ( = ?auto_459619 ?auto_459631 ) ) ( not ( = ?auto_459620 ?auto_459621 ) ) ( not ( = ?auto_459620 ?auto_459622 ) ) ( not ( = ?auto_459620 ?auto_459623 ) ) ( not ( = ?auto_459620 ?auto_459624 ) ) ( not ( = ?auto_459620 ?auto_459625 ) ) ( not ( = ?auto_459620 ?auto_459626 ) ) ( not ( = ?auto_459620 ?auto_459627 ) ) ( not ( = ?auto_459620 ?auto_459628 ) ) ( not ( = ?auto_459620 ?auto_459629 ) ) ( not ( = ?auto_459620 ?auto_459630 ) ) ( not ( = ?auto_459620 ?auto_459631 ) ) ( not ( = ?auto_459621 ?auto_459622 ) ) ( not ( = ?auto_459621 ?auto_459623 ) ) ( not ( = ?auto_459621 ?auto_459624 ) ) ( not ( = ?auto_459621 ?auto_459625 ) ) ( not ( = ?auto_459621 ?auto_459626 ) ) ( not ( = ?auto_459621 ?auto_459627 ) ) ( not ( = ?auto_459621 ?auto_459628 ) ) ( not ( = ?auto_459621 ?auto_459629 ) ) ( not ( = ?auto_459621 ?auto_459630 ) ) ( not ( = ?auto_459621 ?auto_459631 ) ) ( not ( = ?auto_459622 ?auto_459623 ) ) ( not ( = ?auto_459622 ?auto_459624 ) ) ( not ( = ?auto_459622 ?auto_459625 ) ) ( not ( = ?auto_459622 ?auto_459626 ) ) ( not ( = ?auto_459622 ?auto_459627 ) ) ( not ( = ?auto_459622 ?auto_459628 ) ) ( not ( = ?auto_459622 ?auto_459629 ) ) ( not ( = ?auto_459622 ?auto_459630 ) ) ( not ( = ?auto_459622 ?auto_459631 ) ) ( not ( = ?auto_459623 ?auto_459624 ) ) ( not ( = ?auto_459623 ?auto_459625 ) ) ( not ( = ?auto_459623 ?auto_459626 ) ) ( not ( = ?auto_459623 ?auto_459627 ) ) ( not ( = ?auto_459623 ?auto_459628 ) ) ( not ( = ?auto_459623 ?auto_459629 ) ) ( not ( = ?auto_459623 ?auto_459630 ) ) ( not ( = ?auto_459623 ?auto_459631 ) ) ( not ( = ?auto_459624 ?auto_459625 ) ) ( not ( = ?auto_459624 ?auto_459626 ) ) ( not ( = ?auto_459624 ?auto_459627 ) ) ( not ( = ?auto_459624 ?auto_459628 ) ) ( not ( = ?auto_459624 ?auto_459629 ) ) ( not ( = ?auto_459624 ?auto_459630 ) ) ( not ( = ?auto_459624 ?auto_459631 ) ) ( not ( = ?auto_459625 ?auto_459626 ) ) ( not ( = ?auto_459625 ?auto_459627 ) ) ( not ( = ?auto_459625 ?auto_459628 ) ) ( not ( = ?auto_459625 ?auto_459629 ) ) ( not ( = ?auto_459625 ?auto_459630 ) ) ( not ( = ?auto_459625 ?auto_459631 ) ) ( not ( = ?auto_459626 ?auto_459627 ) ) ( not ( = ?auto_459626 ?auto_459628 ) ) ( not ( = ?auto_459626 ?auto_459629 ) ) ( not ( = ?auto_459626 ?auto_459630 ) ) ( not ( = ?auto_459626 ?auto_459631 ) ) ( not ( = ?auto_459627 ?auto_459628 ) ) ( not ( = ?auto_459627 ?auto_459629 ) ) ( not ( = ?auto_459627 ?auto_459630 ) ) ( not ( = ?auto_459627 ?auto_459631 ) ) ( not ( = ?auto_459628 ?auto_459629 ) ) ( not ( = ?auto_459628 ?auto_459630 ) ) ( not ( = ?auto_459628 ?auto_459631 ) ) ( not ( = ?auto_459629 ?auto_459630 ) ) ( not ( = ?auto_459629 ?auto_459631 ) ) ( not ( = ?auto_459630 ?auto_459631 ) ) ( ON ?auto_459630 ?auto_459631 ) ( ON ?auto_459629 ?auto_459630 ) ( ON ?auto_459628 ?auto_459629 ) ( ON ?auto_459627 ?auto_459628 ) ( ON ?auto_459626 ?auto_459627 ) ( ON ?auto_459625 ?auto_459626 ) ( ON ?auto_459624 ?auto_459625 ) ( ON ?auto_459623 ?auto_459624 ) ( ON ?auto_459622 ?auto_459623 ) ( ON ?auto_459621 ?auto_459622 ) ( ON ?auto_459620 ?auto_459621 ) ( ON ?auto_459619 ?auto_459620 ) ( CLEAR ?auto_459617 ) ( ON ?auto_459618 ?auto_459619 ) ( CLEAR ?auto_459618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_459617 ?auto_459618 )
      ( MAKE-15PILE ?auto_459617 ?auto_459618 ?auto_459619 ?auto_459620 ?auto_459621 ?auto_459622 ?auto_459623 ?auto_459624 ?auto_459625 ?auto_459626 ?auto_459627 ?auto_459628 ?auto_459629 ?auto_459630 ?auto_459631 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459647 - BLOCK
      ?auto_459648 - BLOCK
      ?auto_459649 - BLOCK
      ?auto_459650 - BLOCK
      ?auto_459651 - BLOCK
      ?auto_459652 - BLOCK
      ?auto_459653 - BLOCK
      ?auto_459654 - BLOCK
      ?auto_459655 - BLOCK
      ?auto_459656 - BLOCK
      ?auto_459657 - BLOCK
      ?auto_459658 - BLOCK
      ?auto_459659 - BLOCK
      ?auto_459660 - BLOCK
      ?auto_459661 - BLOCK
    )
    :vars
    (
      ?auto_459662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_459661 ?auto_459662 ) ( not ( = ?auto_459647 ?auto_459648 ) ) ( not ( = ?auto_459647 ?auto_459649 ) ) ( not ( = ?auto_459647 ?auto_459650 ) ) ( not ( = ?auto_459647 ?auto_459651 ) ) ( not ( = ?auto_459647 ?auto_459652 ) ) ( not ( = ?auto_459647 ?auto_459653 ) ) ( not ( = ?auto_459647 ?auto_459654 ) ) ( not ( = ?auto_459647 ?auto_459655 ) ) ( not ( = ?auto_459647 ?auto_459656 ) ) ( not ( = ?auto_459647 ?auto_459657 ) ) ( not ( = ?auto_459647 ?auto_459658 ) ) ( not ( = ?auto_459647 ?auto_459659 ) ) ( not ( = ?auto_459647 ?auto_459660 ) ) ( not ( = ?auto_459647 ?auto_459661 ) ) ( not ( = ?auto_459647 ?auto_459662 ) ) ( not ( = ?auto_459648 ?auto_459649 ) ) ( not ( = ?auto_459648 ?auto_459650 ) ) ( not ( = ?auto_459648 ?auto_459651 ) ) ( not ( = ?auto_459648 ?auto_459652 ) ) ( not ( = ?auto_459648 ?auto_459653 ) ) ( not ( = ?auto_459648 ?auto_459654 ) ) ( not ( = ?auto_459648 ?auto_459655 ) ) ( not ( = ?auto_459648 ?auto_459656 ) ) ( not ( = ?auto_459648 ?auto_459657 ) ) ( not ( = ?auto_459648 ?auto_459658 ) ) ( not ( = ?auto_459648 ?auto_459659 ) ) ( not ( = ?auto_459648 ?auto_459660 ) ) ( not ( = ?auto_459648 ?auto_459661 ) ) ( not ( = ?auto_459648 ?auto_459662 ) ) ( not ( = ?auto_459649 ?auto_459650 ) ) ( not ( = ?auto_459649 ?auto_459651 ) ) ( not ( = ?auto_459649 ?auto_459652 ) ) ( not ( = ?auto_459649 ?auto_459653 ) ) ( not ( = ?auto_459649 ?auto_459654 ) ) ( not ( = ?auto_459649 ?auto_459655 ) ) ( not ( = ?auto_459649 ?auto_459656 ) ) ( not ( = ?auto_459649 ?auto_459657 ) ) ( not ( = ?auto_459649 ?auto_459658 ) ) ( not ( = ?auto_459649 ?auto_459659 ) ) ( not ( = ?auto_459649 ?auto_459660 ) ) ( not ( = ?auto_459649 ?auto_459661 ) ) ( not ( = ?auto_459649 ?auto_459662 ) ) ( not ( = ?auto_459650 ?auto_459651 ) ) ( not ( = ?auto_459650 ?auto_459652 ) ) ( not ( = ?auto_459650 ?auto_459653 ) ) ( not ( = ?auto_459650 ?auto_459654 ) ) ( not ( = ?auto_459650 ?auto_459655 ) ) ( not ( = ?auto_459650 ?auto_459656 ) ) ( not ( = ?auto_459650 ?auto_459657 ) ) ( not ( = ?auto_459650 ?auto_459658 ) ) ( not ( = ?auto_459650 ?auto_459659 ) ) ( not ( = ?auto_459650 ?auto_459660 ) ) ( not ( = ?auto_459650 ?auto_459661 ) ) ( not ( = ?auto_459650 ?auto_459662 ) ) ( not ( = ?auto_459651 ?auto_459652 ) ) ( not ( = ?auto_459651 ?auto_459653 ) ) ( not ( = ?auto_459651 ?auto_459654 ) ) ( not ( = ?auto_459651 ?auto_459655 ) ) ( not ( = ?auto_459651 ?auto_459656 ) ) ( not ( = ?auto_459651 ?auto_459657 ) ) ( not ( = ?auto_459651 ?auto_459658 ) ) ( not ( = ?auto_459651 ?auto_459659 ) ) ( not ( = ?auto_459651 ?auto_459660 ) ) ( not ( = ?auto_459651 ?auto_459661 ) ) ( not ( = ?auto_459651 ?auto_459662 ) ) ( not ( = ?auto_459652 ?auto_459653 ) ) ( not ( = ?auto_459652 ?auto_459654 ) ) ( not ( = ?auto_459652 ?auto_459655 ) ) ( not ( = ?auto_459652 ?auto_459656 ) ) ( not ( = ?auto_459652 ?auto_459657 ) ) ( not ( = ?auto_459652 ?auto_459658 ) ) ( not ( = ?auto_459652 ?auto_459659 ) ) ( not ( = ?auto_459652 ?auto_459660 ) ) ( not ( = ?auto_459652 ?auto_459661 ) ) ( not ( = ?auto_459652 ?auto_459662 ) ) ( not ( = ?auto_459653 ?auto_459654 ) ) ( not ( = ?auto_459653 ?auto_459655 ) ) ( not ( = ?auto_459653 ?auto_459656 ) ) ( not ( = ?auto_459653 ?auto_459657 ) ) ( not ( = ?auto_459653 ?auto_459658 ) ) ( not ( = ?auto_459653 ?auto_459659 ) ) ( not ( = ?auto_459653 ?auto_459660 ) ) ( not ( = ?auto_459653 ?auto_459661 ) ) ( not ( = ?auto_459653 ?auto_459662 ) ) ( not ( = ?auto_459654 ?auto_459655 ) ) ( not ( = ?auto_459654 ?auto_459656 ) ) ( not ( = ?auto_459654 ?auto_459657 ) ) ( not ( = ?auto_459654 ?auto_459658 ) ) ( not ( = ?auto_459654 ?auto_459659 ) ) ( not ( = ?auto_459654 ?auto_459660 ) ) ( not ( = ?auto_459654 ?auto_459661 ) ) ( not ( = ?auto_459654 ?auto_459662 ) ) ( not ( = ?auto_459655 ?auto_459656 ) ) ( not ( = ?auto_459655 ?auto_459657 ) ) ( not ( = ?auto_459655 ?auto_459658 ) ) ( not ( = ?auto_459655 ?auto_459659 ) ) ( not ( = ?auto_459655 ?auto_459660 ) ) ( not ( = ?auto_459655 ?auto_459661 ) ) ( not ( = ?auto_459655 ?auto_459662 ) ) ( not ( = ?auto_459656 ?auto_459657 ) ) ( not ( = ?auto_459656 ?auto_459658 ) ) ( not ( = ?auto_459656 ?auto_459659 ) ) ( not ( = ?auto_459656 ?auto_459660 ) ) ( not ( = ?auto_459656 ?auto_459661 ) ) ( not ( = ?auto_459656 ?auto_459662 ) ) ( not ( = ?auto_459657 ?auto_459658 ) ) ( not ( = ?auto_459657 ?auto_459659 ) ) ( not ( = ?auto_459657 ?auto_459660 ) ) ( not ( = ?auto_459657 ?auto_459661 ) ) ( not ( = ?auto_459657 ?auto_459662 ) ) ( not ( = ?auto_459658 ?auto_459659 ) ) ( not ( = ?auto_459658 ?auto_459660 ) ) ( not ( = ?auto_459658 ?auto_459661 ) ) ( not ( = ?auto_459658 ?auto_459662 ) ) ( not ( = ?auto_459659 ?auto_459660 ) ) ( not ( = ?auto_459659 ?auto_459661 ) ) ( not ( = ?auto_459659 ?auto_459662 ) ) ( not ( = ?auto_459660 ?auto_459661 ) ) ( not ( = ?auto_459660 ?auto_459662 ) ) ( not ( = ?auto_459661 ?auto_459662 ) ) ( ON ?auto_459660 ?auto_459661 ) ( ON ?auto_459659 ?auto_459660 ) ( ON ?auto_459658 ?auto_459659 ) ( ON ?auto_459657 ?auto_459658 ) ( ON ?auto_459656 ?auto_459657 ) ( ON ?auto_459655 ?auto_459656 ) ( ON ?auto_459654 ?auto_459655 ) ( ON ?auto_459653 ?auto_459654 ) ( ON ?auto_459652 ?auto_459653 ) ( ON ?auto_459651 ?auto_459652 ) ( ON ?auto_459650 ?auto_459651 ) ( ON ?auto_459649 ?auto_459650 ) ( ON ?auto_459648 ?auto_459649 ) ( ON ?auto_459647 ?auto_459648 ) ( CLEAR ?auto_459647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_459647 )
      ( MAKE-15PILE ?auto_459647 ?auto_459648 ?auto_459649 ?auto_459650 ?auto_459651 ?auto_459652 ?auto_459653 ?auto_459654 ?auto_459655 ?auto_459656 ?auto_459657 ?auto_459658 ?auto_459659 ?auto_459660 ?auto_459661 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459678 - BLOCK
      ?auto_459679 - BLOCK
      ?auto_459680 - BLOCK
      ?auto_459681 - BLOCK
      ?auto_459682 - BLOCK
      ?auto_459683 - BLOCK
      ?auto_459684 - BLOCK
      ?auto_459685 - BLOCK
      ?auto_459686 - BLOCK
      ?auto_459687 - BLOCK
      ?auto_459688 - BLOCK
      ?auto_459689 - BLOCK
      ?auto_459690 - BLOCK
      ?auto_459691 - BLOCK
      ?auto_459692 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_459692 ) ( not ( = ?auto_459678 ?auto_459679 ) ) ( not ( = ?auto_459678 ?auto_459680 ) ) ( not ( = ?auto_459678 ?auto_459681 ) ) ( not ( = ?auto_459678 ?auto_459682 ) ) ( not ( = ?auto_459678 ?auto_459683 ) ) ( not ( = ?auto_459678 ?auto_459684 ) ) ( not ( = ?auto_459678 ?auto_459685 ) ) ( not ( = ?auto_459678 ?auto_459686 ) ) ( not ( = ?auto_459678 ?auto_459687 ) ) ( not ( = ?auto_459678 ?auto_459688 ) ) ( not ( = ?auto_459678 ?auto_459689 ) ) ( not ( = ?auto_459678 ?auto_459690 ) ) ( not ( = ?auto_459678 ?auto_459691 ) ) ( not ( = ?auto_459678 ?auto_459692 ) ) ( not ( = ?auto_459679 ?auto_459680 ) ) ( not ( = ?auto_459679 ?auto_459681 ) ) ( not ( = ?auto_459679 ?auto_459682 ) ) ( not ( = ?auto_459679 ?auto_459683 ) ) ( not ( = ?auto_459679 ?auto_459684 ) ) ( not ( = ?auto_459679 ?auto_459685 ) ) ( not ( = ?auto_459679 ?auto_459686 ) ) ( not ( = ?auto_459679 ?auto_459687 ) ) ( not ( = ?auto_459679 ?auto_459688 ) ) ( not ( = ?auto_459679 ?auto_459689 ) ) ( not ( = ?auto_459679 ?auto_459690 ) ) ( not ( = ?auto_459679 ?auto_459691 ) ) ( not ( = ?auto_459679 ?auto_459692 ) ) ( not ( = ?auto_459680 ?auto_459681 ) ) ( not ( = ?auto_459680 ?auto_459682 ) ) ( not ( = ?auto_459680 ?auto_459683 ) ) ( not ( = ?auto_459680 ?auto_459684 ) ) ( not ( = ?auto_459680 ?auto_459685 ) ) ( not ( = ?auto_459680 ?auto_459686 ) ) ( not ( = ?auto_459680 ?auto_459687 ) ) ( not ( = ?auto_459680 ?auto_459688 ) ) ( not ( = ?auto_459680 ?auto_459689 ) ) ( not ( = ?auto_459680 ?auto_459690 ) ) ( not ( = ?auto_459680 ?auto_459691 ) ) ( not ( = ?auto_459680 ?auto_459692 ) ) ( not ( = ?auto_459681 ?auto_459682 ) ) ( not ( = ?auto_459681 ?auto_459683 ) ) ( not ( = ?auto_459681 ?auto_459684 ) ) ( not ( = ?auto_459681 ?auto_459685 ) ) ( not ( = ?auto_459681 ?auto_459686 ) ) ( not ( = ?auto_459681 ?auto_459687 ) ) ( not ( = ?auto_459681 ?auto_459688 ) ) ( not ( = ?auto_459681 ?auto_459689 ) ) ( not ( = ?auto_459681 ?auto_459690 ) ) ( not ( = ?auto_459681 ?auto_459691 ) ) ( not ( = ?auto_459681 ?auto_459692 ) ) ( not ( = ?auto_459682 ?auto_459683 ) ) ( not ( = ?auto_459682 ?auto_459684 ) ) ( not ( = ?auto_459682 ?auto_459685 ) ) ( not ( = ?auto_459682 ?auto_459686 ) ) ( not ( = ?auto_459682 ?auto_459687 ) ) ( not ( = ?auto_459682 ?auto_459688 ) ) ( not ( = ?auto_459682 ?auto_459689 ) ) ( not ( = ?auto_459682 ?auto_459690 ) ) ( not ( = ?auto_459682 ?auto_459691 ) ) ( not ( = ?auto_459682 ?auto_459692 ) ) ( not ( = ?auto_459683 ?auto_459684 ) ) ( not ( = ?auto_459683 ?auto_459685 ) ) ( not ( = ?auto_459683 ?auto_459686 ) ) ( not ( = ?auto_459683 ?auto_459687 ) ) ( not ( = ?auto_459683 ?auto_459688 ) ) ( not ( = ?auto_459683 ?auto_459689 ) ) ( not ( = ?auto_459683 ?auto_459690 ) ) ( not ( = ?auto_459683 ?auto_459691 ) ) ( not ( = ?auto_459683 ?auto_459692 ) ) ( not ( = ?auto_459684 ?auto_459685 ) ) ( not ( = ?auto_459684 ?auto_459686 ) ) ( not ( = ?auto_459684 ?auto_459687 ) ) ( not ( = ?auto_459684 ?auto_459688 ) ) ( not ( = ?auto_459684 ?auto_459689 ) ) ( not ( = ?auto_459684 ?auto_459690 ) ) ( not ( = ?auto_459684 ?auto_459691 ) ) ( not ( = ?auto_459684 ?auto_459692 ) ) ( not ( = ?auto_459685 ?auto_459686 ) ) ( not ( = ?auto_459685 ?auto_459687 ) ) ( not ( = ?auto_459685 ?auto_459688 ) ) ( not ( = ?auto_459685 ?auto_459689 ) ) ( not ( = ?auto_459685 ?auto_459690 ) ) ( not ( = ?auto_459685 ?auto_459691 ) ) ( not ( = ?auto_459685 ?auto_459692 ) ) ( not ( = ?auto_459686 ?auto_459687 ) ) ( not ( = ?auto_459686 ?auto_459688 ) ) ( not ( = ?auto_459686 ?auto_459689 ) ) ( not ( = ?auto_459686 ?auto_459690 ) ) ( not ( = ?auto_459686 ?auto_459691 ) ) ( not ( = ?auto_459686 ?auto_459692 ) ) ( not ( = ?auto_459687 ?auto_459688 ) ) ( not ( = ?auto_459687 ?auto_459689 ) ) ( not ( = ?auto_459687 ?auto_459690 ) ) ( not ( = ?auto_459687 ?auto_459691 ) ) ( not ( = ?auto_459687 ?auto_459692 ) ) ( not ( = ?auto_459688 ?auto_459689 ) ) ( not ( = ?auto_459688 ?auto_459690 ) ) ( not ( = ?auto_459688 ?auto_459691 ) ) ( not ( = ?auto_459688 ?auto_459692 ) ) ( not ( = ?auto_459689 ?auto_459690 ) ) ( not ( = ?auto_459689 ?auto_459691 ) ) ( not ( = ?auto_459689 ?auto_459692 ) ) ( not ( = ?auto_459690 ?auto_459691 ) ) ( not ( = ?auto_459690 ?auto_459692 ) ) ( not ( = ?auto_459691 ?auto_459692 ) ) ( ON ?auto_459691 ?auto_459692 ) ( ON ?auto_459690 ?auto_459691 ) ( ON ?auto_459689 ?auto_459690 ) ( ON ?auto_459688 ?auto_459689 ) ( ON ?auto_459687 ?auto_459688 ) ( ON ?auto_459686 ?auto_459687 ) ( ON ?auto_459685 ?auto_459686 ) ( ON ?auto_459684 ?auto_459685 ) ( ON ?auto_459683 ?auto_459684 ) ( ON ?auto_459682 ?auto_459683 ) ( ON ?auto_459681 ?auto_459682 ) ( ON ?auto_459680 ?auto_459681 ) ( ON ?auto_459679 ?auto_459680 ) ( ON ?auto_459678 ?auto_459679 ) ( CLEAR ?auto_459678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_459678 )
      ( MAKE-15PILE ?auto_459678 ?auto_459679 ?auto_459680 ?auto_459681 ?auto_459682 ?auto_459683 ?auto_459684 ?auto_459685 ?auto_459686 ?auto_459687 ?auto_459688 ?auto_459689 ?auto_459690 ?auto_459691 ?auto_459692 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_459708 - BLOCK
      ?auto_459709 - BLOCK
      ?auto_459710 - BLOCK
      ?auto_459711 - BLOCK
      ?auto_459712 - BLOCK
      ?auto_459713 - BLOCK
      ?auto_459714 - BLOCK
      ?auto_459715 - BLOCK
      ?auto_459716 - BLOCK
      ?auto_459717 - BLOCK
      ?auto_459718 - BLOCK
      ?auto_459719 - BLOCK
      ?auto_459720 - BLOCK
      ?auto_459721 - BLOCK
      ?auto_459722 - BLOCK
    )
    :vars
    (
      ?auto_459723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_459708 ?auto_459709 ) ) ( not ( = ?auto_459708 ?auto_459710 ) ) ( not ( = ?auto_459708 ?auto_459711 ) ) ( not ( = ?auto_459708 ?auto_459712 ) ) ( not ( = ?auto_459708 ?auto_459713 ) ) ( not ( = ?auto_459708 ?auto_459714 ) ) ( not ( = ?auto_459708 ?auto_459715 ) ) ( not ( = ?auto_459708 ?auto_459716 ) ) ( not ( = ?auto_459708 ?auto_459717 ) ) ( not ( = ?auto_459708 ?auto_459718 ) ) ( not ( = ?auto_459708 ?auto_459719 ) ) ( not ( = ?auto_459708 ?auto_459720 ) ) ( not ( = ?auto_459708 ?auto_459721 ) ) ( not ( = ?auto_459708 ?auto_459722 ) ) ( not ( = ?auto_459709 ?auto_459710 ) ) ( not ( = ?auto_459709 ?auto_459711 ) ) ( not ( = ?auto_459709 ?auto_459712 ) ) ( not ( = ?auto_459709 ?auto_459713 ) ) ( not ( = ?auto_459709 ?auto_459714 ) ) ( not ( = ?auto_459709 ?auto_459715 ) ) ( not ( = ?auto_459709 ?auto_459716 ) ) ( not ( = ?auto_459709 ?auto_459717 ) ) ( not ( = ?auto_459709 ?auto_459718 ) ) ( not ( = ?auto_459709 ?auto_459719 ) ) ( not ( = ?auto_459709 ?auto_459720 ) ) ( not ( = ?auto_459709 ?auto_459721 ) ) ( not ( = ?auto_459709 ?auto_459722 ) ) ( not ( = ?auto_459710 ?auto_459711 ) ) ( not ( = ?auto_459710 ?auto_459712 ) ) ( not ( = ?auto_459710 ?auto_459713 ) ) ( not ( = ?auto_459710 ?auto_459714 ) ) ( not ( = ?auto_459710 ?auto_459715 ) ) ( not ( = ?auto_459710 ?auto_459716 ) ) ( not ( = ?auto_459710 ?auto_459717 ) ) ( not ( = ?auto_459710 ?auto_459718 ) ) ( not ( = ?auto_459710 ?auto_459719 ) ) ( not ( = ?auto_459710 ?auto_459720 ) ) ( not ( = ?auto_459710 ?auto_459721 ) ) ( not ( = ?auto_459710 ?auto_459722 ) ) ( not ( = ?auto_459711 ?auto_459712 ) ) ( not ( = ?auto_459711 ?auto_459713 ) ) ( not ( = ?auto_459711 ?auto_459714 ) ) ( not ( = ?auto_459711 ?auto_459715 ) ) ( not ( = ?auto_459711 ?auto_459716 ) ) ( not ( = ?auto_459711 ?auto_459717 ) ) ( not ( = ?auto_459711 ?auto_459718 ) ) ( not ( = ?auto_459711 ?auto_459719 ) ) ( not ( = ?auto_459711 ?auto_459720 ) ) ( not ( = ?auto_459711 ?auto_459721 ) ) ( not ( = ?auto_459711 ?auto_459722 ) ) ( not ( = ?auto_459712 ?auto_459713 ) ) ( not ( = ?auto_459712 ?auto_459714 ) ) ( not ( = ?auto_459712 ?auto_459715 ) ) ( not ( = ?auto_459712 ?auto_459716 ) ) ( not ( = ?auto_459712 ?auto_459717 ) ) ( not ( = ?auto_459712 ?auto_459718 ) ) ( not ( = ?auto_459712 ?auto_459719 ) ) ( not ( = ?auto_459712 ?auto_459720 ) ) ( not ( = ?auto_459712 ?auto_459721 ) ) ( not ( = ?auto_459712 ?auto_459722 ) ) ( not ( = ?auto_459713 ?auto_459714 ) ) ( not ( = ?auto_459713 ?auto_459715 ) ) ( not ( = ?auto_459713 ?auto_459716 ) ) ( not ( = ?auto_459713 ?auto_459717 ) ) ( not ( = ?auto_459713 ?auto_459718 ) ) ( not ( = ?auto_459713 ?auto_459719 ) ) ( not ( = ?auto_459713 ?auto_459720 ) ) ( not ( = ?auto_459713 ?auto_459721 ) ) ( not ( = ?auto_459713 ?auto_459722 ) ) ( not ( = ?auto_459714 ?auto_459715 ) ) ( not ( = ?auto_459714 ?auto_459716 ) ) ( not ( = ?auto_459714 ?auto_459717 ) ) ( not ( = ?auto_459714 ?auto_459718 ) ) ( not ( = ?auto_459714 ?auto_459719 ) ) ( not ( = ?auto_459714 ?auto_459720 ) ) ( not ( = ?auto_459714 ?auto_459721 ) ) ( not ( = ?auto_459714 ?auto_459722 ) ) ( not ( = ?auto_459715 ?auto_459716 ) ) ( not ( = ?auto_459715 ?auto_459717 ) ) ( not ( = ?auto_459715 ?auto_459718 ) ) ( not ( = ?auto_459715 ?auto_459719 ) ) ( not ( = ?auto_459715 ?auto_459720 ) ) ( not ( = ?auto_459715 ?auto_459721 ) ) ( not ( = ?auto_459715 ?auto_459722 ) ) ( not ( = ?auto_459716 ?auto_459717 ) ) ( not ( = ?auto_459716 ?auto_459718 ) ) ( not ( = ?auto_459716 ?auto_459719 ) ) ( not ( = ?auto_459716 ?auto_459720 ) ) ( not ( = ?auto_459716 ?auto_459721 ) ) ( not ( = ?auto_459716 ?auto_459722 ) ) ( not ( = ?auto_459717 ?auto_459718 ) ) ( not ( = ?auto_459717 ?auto_459719 ) ) ( not ( = ?auto_459717 ?auto_459720 ) ) ( not ( = ?auto_459717 ?auto_459721 ) ) ( not ( = ?auto_459717 ?auto_459722 ) ) ( not ( = ?auto_459718 ?auto_459719 ) ) ( not ( = ?auto_459718 ?auto_459720 ) ) ( not ( = ?auto_459718 ?auto_459721 ) ) ( not ( = ?auto_459718 ?auto_459722 ) ) ( not ( = ?auto_459719 ?auto_459720 ) ) ( not ( = ?auto_459719 ?auto_459721 ) ) ( not ( = ?auto_459719 ?auto_459722 ) ) ( not ( = ?auto_459720 ?auto_459721 ) ) ( not ( = ?auto_459720 ?auto_459722 ) ) ( not ( = ?auto_459721 ?auto_459722 ) ) ( ON ?auto_459708 ?auto_459723 ) ( not ( = ?auto_459722 ?auto_459723 ) ) ( not ( = ?auto_459721 ?auto_459723 ) ) ( not ( = ?auto_459720 ?auto_459723 ) ) ( not ( = ?auto_459719 ?auto_459723 ) ) ( not ( = ?auto_459718 ?auto_459723 ) ) ( not ( = ?auto_459717 ?auto_459723 ) ) ( not ( = ?auto_459716 ?auto_459723 ) ) ( not ( = ?auto_459715 ?auto_459723 ) ) ( not ( = ?auto_459714 ?auto_459723 ) ) ( not ( = ?auto_459713 ?auto_459723 ) ) ( not ( = ?auto_459712 ?auto_459723 ) ) ( not ( = ?auto_459711 ?auto_459723 ) ) ( not ( = ?auto_459710 ?auto_459723 ) ) ( not ( = ?auto_459709 ?auto_459723 ) ) ( not ( = ?auto_459708 ?auto_459723 ) ) ( ON ?auto_459709 ?auto_459708 ) ( ON ?auto_459710 ?auto_459709 ) ( ON ?auto_459711 ?auto_459710 ) ( ON ?auto_459712 ?auto_459711 ) ( ON ?auto_459713 ?auto_459712 ) ( ON ?auto_459714 ?auto_459713 ) ( ON ?auto_459715 ?auto_459714 ) ( ON ?auto_459716 ?auto_459715 ) ( ON ?auto_459717 ?auto_459716 ) ( ON ?auto_459718 ?auto_459717 ) ( ON ?auto_459719 ?auto_459718 ) ( ON ?auto_459720 ?auto_459719 ) ( ON ?auto_459721 ?auto_459720 ) ( ON ?auto_459722 ?auto_459721 ) ( CLEAR ?auto_459722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_459722 ?auto_459721 ?auto_459720 ?auto_459719 ?auto_459718 ?auto_459717 ?auto_459716 ?auto_459715 ?auto_459714 ?auto_459713 ?auto_459712 ?auto_459711 ?auto_459710 ?auto_459709 ?auto_459708 )
      ( MAKE-15PILE ?auto_459708 ?auto_459709 ?auto_459710 ?auto_459711 ?auto_459712 ?auto_459713 ?auto_459714 ?auto_459715 ?auto_459716 ?auto_459717 ?auto_459718 ?auto_459719 ?auto_459720 ?auto_459721 ?auto_459722 ) )
  )

)

