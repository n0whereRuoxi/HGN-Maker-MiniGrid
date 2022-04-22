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
      ?auto_19549 - BLOCK
    )
    :vars
    (
      ?auto_19550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19549 ?auto_19550 ) ( CLEAR ?auto_19549 ) ( HAND-EMPTY ) ( not ( = ?auto_19549 ?auto_19550 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19549 ?auto_19550 )
      ( !PUTDOWN ?auto_19549 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19552 - BLOCK
    )
    :vars
    (
      ?auto_19553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19552 ?auto_19553 ) ( CLEAR ?auto_19552 ) ( HAND-EMPTY ) ( not ( = ?auto_19552 ?auto_19553 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19552 ?auto_19553 )
      ( !PUTDOWN ?auto_19552 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19556 - BLOCK
      ?auto_19557 - BLOCK
    )
    :vars
    (
      ?auto_19558 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19556 ) ( ON ?auto_19557 ?auto_19558 ) ( CLEAR ?auto_19557 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19556 ) ( not ( = ?auto_19556 ?auto_19557 ) ) ( not ( = ?auto_19556 ?auto_19558 ) ) ( not ( = ?auto_19557 ?auto_19558 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19557 ?auto_19558 )
      ( !STACK ?auto_19557 ?auto_19556 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19561 - BLOCK
      ?auto_19562 - BLOCK
    )
    :vars
    (
      ?auto_19563 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19561 ) ( ON ?auto_19562 ?auto_19563 ) ( CLEAR ?auto_19562 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19561 ) ( not ( = ?auto_19561 ?auto_19562 ) ) ( not ( = ?auto_19561 ?auto_19563 ) ) ( not ( = ?auto_19562 ?auto_19563 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19562 ?auto_19563 )
      ( !STACK ?auto_19562 ?auto_19561 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19566 - BLOCK
      ?auto_19567 - BLOCK
    )
    :vars
    (
      ?auto_19568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19567 ?auto_19568 ) ( not ( = ?auto_19566 ?auto_19567 ) ) ( not ( = ?auto_19566 ?auto_19568 ) ) ( not ( = ?auto_19567 ?auto_19568 ) ) ( ON ?auto_19566 ?auto_19567 ) ( CLEAR ?auto_19566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19566 )
      ( MAKE-2PILE ?auto_19566 ?auto_19567 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19571 - BLOCK
      ?auto_19572 - BLOCK
    )
    :vars
    (
      ?auto_19573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19572 ?auto_19573 ) ( not ( = ?auto_19571 ?auto_19572 ) ) ( not ( = ?auto_19571 ?auto_19573 ) ) ( not ( = ?auto_19572 ?auto_19573 ) ) ( ON ?auto_19571 ?auto_19572 ) ( CLEAR ?auto_19571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19571 )
      ( MAKE-2PILE ?auto_19571 ?auto_19572 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19577 - BLOCK
      ?auto_19578 - BLOCK
      ?auto_19579 - BLOCK
    )
    :vars
    (
      ?auto_19580 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19578 ) ( ON ?auto_19579 ?auto_19580 ) ( CLEAR ?auto_19579 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19577 ) ( ON ?auto_19578 ?auto_19577 ) ( not ( = ?auto_19577 ?auto_19578 ) ) ( not ( = ?auto_19577 ?auto_19579 ) ) ( not ( = ?auto_19577 ?auto_19580 ) ) ( not ( = ?auto_19578 ?auto_19579 ) ) ( not ( = ?auto_19578 ?auto_19580 ) ) ( not ( = ?auto_19579 ?auto_19580 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19579 ?auto_19580 )
      ( !STACK ?auto_19579 ?auto_19578 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19584 - BLOCK
      ?auto_19585 - BLOCK
      ?auto_19586 - BLOCK
    )
    :vars
    (
      ?auto_19587 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19585 ) ( ON ?auto_19586 ?auto_19587 ) ( CLEAR ?auto_19586 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19584 ) ( ON ?auto_19585 ?auto_19584 ) ( not ( = ?auto_19584 ?auto_19585 ) ) ( not ( = ?auto_19584 ?auto_19586 ) ) ( not ( = ?auto_19584 ?auto_19587 ) ) ( not ( = ?auto_19585 ?auto_19586 ) ) ( not ( = ?auto_19585 ?auto_19587 ) ) ( not ( = ?auto_19586 ?auto_19587 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19586 ?auto_19587 )
      ( !STACK ?auto_19586 ?auto_19585 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19591 - BLOCK
      ?auto_19592 - BLOCK
      ?auto_19593 - BLOCK
    )
    :vars
    (
      ?auto_19594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19593 ?auto_19594 ) ( ON-TABLE ?auto_19591 ) ( not ( = ?auto_19591 ?auto_19592 ) ) ( not ( = ?auto_19591 ?auto_19593 ) ) ( not ( = ?auto_19591 ?auto_19594 ) ) ( not ( = ?auto_19592 ?auto_19593 ) ) ( not ( = ?auto_19592 ?auto_19594 ) ) ( not ( = ?auto_19593 ?auto_19594 ) ) ( CLEAR ?auto_19591 ) ( ON ?auto_19592 ?auto_19593 ) ( CLEAR ?auto_19592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19591 ?auto_19592 )
      ( MAKE-3PILE ?auto_19591 ?auto_19592 ?auto_19593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19598 - BLOCK
      ?auto_19599 - BLOCK
      ?auto_19600 - BLOCK
    )
    :vars
    (
      ?auto_19601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19600 ?auto_19601 ) ( ON-TABLE ?auto_19598 ) ( not ( = ?auto_19598 ?auto_19599 ) ) ( not ( = ?auto_19598 ?auto_19600 ) ) ( not ( = ?auto_19598 ?auto_19601 ) ) ( not ( = ?auto_19599 ?auto_19600 ) ) ( not ( = ?auto_19599 ?auto_19601 ) ) ( not ( = ?auto_19600 ?auto_19601 ) ) ( CLEAR ?auto_19598 ) ( ON ?auto_19599 ?auto_19600 ) ( CLEAR ?auto_19599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19598 ?auto_19599 )
      ( MAKE-3PILE ?auto_19598 ?auto_19599 ?auto_19600 ) )
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
    )
    :precondition
    ( and ( ON ?auto_19607 ?auto_19608 ) ( not ( = ?auto_19605 ?auto_19606 ) ) ( not ( = ?auto_19605 ?auto_19607 ) ) ( not ( = ?auto_19605 ?auto_19608 ) ) ( not ( = ?auto_19606 ?auto_19607 ) ) ( not ( = ?auto_19606 ?auto_19608 ) ) ( not ( = ?auto_19607 ?auto_19608 ) ) ( ON ?auto_19606 ?auto_19607 ) ( ON ?auto_19605 ?auto_19606 ) ( CLEAR ?auto_19605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19605 )
      ( MAKE-3PILE ?auto_19605 ?auto_19606 ?auto_19607 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19612 - BLOCK
      ?auto_19613 - BLOCK
      ?auto_19614 - BLOCK
    )
    :vars
    (
      ?auto_19615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19614 ?auto_19615 ) ( not ( = ?auto_19612 ?auto_19613 ) ) ( not ( = ?auto_19612 ?auto_19614 ) ) ( not ( = ?auto_19612 ?auto_19615 ) ) ( not ( = ?auto_19613 ?auto_19614 ) ) ( not ( = ?auto_19613 ?auto_19615 ) ) ( not ( = ?auto_19614 ?auto_19615 ) ) ( ON ?auto_19613 ?auto_19614 ) ( ON ?auto_19612 ?auto_19613 ) ( CLEAR ?auto_19612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19612 )
      ( MAKE-3PILE ?auto_19612 ?auto_19613 ?auto_19614 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19620 - BLOCK
      ?auto_19621 - BLOCK
      ?auto_19622 - BLOCK
      ?auto_19623 - BLOCK
    )
    :vars
    (
      ?auto_19624 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19622 ) ( ON ?auto_19623 ?auto_19624 ) ( CLEAR ?auto_19623 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19620 ) ( ON ?auto_19621 ?auto_19620 ) ( ON ?auto_19622 ?auto_19621 ) ( not ( = ?auto_19620 ?auto_19621 ) ) ( not ( = ?auto_19620 ?auto_19622 ) ) ( not ( = ?auto_19620 ?auto_19623 ) ) ( not ( = ?auto_19620 ?auto_19624 ) ) ( not ( = ?auto_19621 ?auto_19622 ) ) ( not ( = ?auto_19621 ?auto_19623 ) ) ( not ( = ?auto_19621 ?auto_19624 ) ) ( not ( = ?auto_19622 ?auto_19623 ) ) ( not ( = ?auto_19622 ?auto_19624 ) ) ( not ( = ?auto_19623 ?auto_19624 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19623 ?auto_19624 )
      ( !STACK ?auto_19623 ?auto_19622 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19629 - BLOCK
      ?auto_19630 - BLOCK
      ?auto_19631 - BLOCK
      ?auto_19632 - BLOCK
    )
    :vars
    (
      ?auto_19633 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19631 ) ( ON ?auto_19632 ?auto_19633 ) ( CLEAR ?auto_19632 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19629 ) ( ON ?auto_19630 ?auto_19629 ) ( ON ?auto_19631 ?auto_19630 ) ( not ( = ?auto_19629 ?auto_19630 ) ) ( not ( = ?auto_19629 ?auto_19631 ) ) ( not ( = ?auto_19629 ?auto_19632 ) ) ( not ( = ?auto_19629 ?auto_19633 ) ) ( not ( = ?auto_19630 ?auto_19631 ) ) ( not ( = ?auto_19630 ?auto_19632 ) ) ( not ( = ?auto_19630 ?auto_19633 ) ) ( not ( = ?auto_19631 ?auto_19632 ) ) ( not ( = ?auto_19631 ?auto_19633 ) ) ( not ( = ?auto_19632 ?auto_19633 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19632 ?auto_19633 )
      ( !STACK ?auto_19632 ?auto_19631 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19638 - BLOCK
      ?auto_19639 - BLOCK
      ?auto_19640 - BLOCK
      ?auto_19641 - BLOCK
    )
    :vars
    (
      ?auto_19642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19641 ?auto_19642 ) ( ON-TABLE ?auto_19638 ) ( ON ?auto_19639 ?auto_19638 ) ( not ( = ?auto_19638 ?auto_19639 ) ) ( not ( = ?auto_19638 ?auto_19640 ) ) ( not ( = ?auto_19638 ?auto_19641 ) ) ( not ( = ?auto_19638 ?auto_19642 ) ) ( not ( = ?auto_19639 ?auto_19640 ) ) ( not ( = ?auto_19639 ?auto_19641 ) ) ( not ( = ?auto_19639 ?auto_19642 ) ) ( not ( = ?auto_19640 ?auto_19641 ) ) ( not ( = ?auto_19640 ?auto_19642 ) ) ( not ( = ?auto_19641 ?auto_19642 ) ) ( CLEAR ?auto_19639 ) ( ON ?auto_19640 ?auto_19641 ) ( CLEAR ?auto_19640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19638 ?auto_19639 ?auto_19640 )
      ( MAKE-4PILE ?auto_19638 ?auto_19639 ?auto_19640 ?auto_19641 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19647 - BLOCK
      ?auto_19648 - BLOCK
      ?auto_19649 - BLOCK
      ?auto_19650 - BLOCK
    )
    :vars
    (
      ?auto_19651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19650 ?auto_19651 ) ( ON-TABLE ?auto_19647 ) ( ON ?auto_19648 ?auto_19647 ) ( not ( = ?auto_19647 ?auto_19648 ) ) ( not ( = ?auto_19647 ?auto_19649 ) ) ( not ( = ?auto_19647 ?auto_19650 ) ) ( not ( = ?auto_19647 ?auto_19651 ) ) ( not ( = ?auto_19648 ?auto_19649 ) ) ( not ( = ?auto_19648 ?auto_19650 ) ) ( not ( = ?auto_19648 ?auto_19651 ) ) ( not ( = ?auto_19649 ?auto_19650 ) ) ( not ( = ?auto_19649 ?auto_19651 ) ) ( not ( = ?auto_19650 ?auto_19651 ) ) ( CLEAR ?auto_19648 ) ( ON ?auto_19649 ?auto_19650 ) ( CLEAR ?auto_19649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19647 ?auto_19648 ?auto_19649 )
      ( MAKE-4PILE ?auto_19647 ?auto_19648 ?auto_19649 ?auto_19650 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19656 - BLOCK
      ?auto_19657 - BLOCK
      ?auto_19658 - BLOCK
      ?auto_19659 - BLOCK
    )
    :vars
    (
      ?auto_19660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19659 ?auto_19660 ) ( ON-TABLE ?auto_19656 ) ( not ( = ?auto_19656 ?auto_19657 ) ) ( not ( = ?auto_19656 ?auto_19658 ) ) ( not ( = ?auto_19656 ?auto_19659 ) ) ( not ( = ?auto_19656 ?auto_19660 ) ) ( not ( = ?auto_19657 ?auto_19658 ) ) ( not ( = ?auto_19657 ?auto_19659 ) ) ( not ( = ?auto_19657 ?auto_19660 ) ) ( not ( = ?auto_19658 ?auto_19659 ) ) ( not ( = ?auto_19658 ?auto_19660 ) ) ( not ( = ?auto_19659 ?auto_19660 ) ) ( ON ?auto_19658 ?auto_19659 ) ( CLEAR ?auto_19656 ) ( ON ?auto_19657 ?auto_19658 ) ( CLEAR ?auto_19657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19656 ?auto_19657 )
      ( MAKE-4PILE ?auto_19656 ?auto_19657 ?auto_19658 ?auto_19659 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19665 - BLOCK
      ?auto_19666 - BLOCK
      ?auto_19667 - BLOCK
      ?auto_19668 - BLOCK
    )
    :vars
    (
      ?auto_19669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19668 ?auto_19669 ) ( ON-TABLE ?auto_19665 ) ( not ( = ?auto_19665 ?auto_19666 ) ) ( not ( = ?auto_19665 ?auto_19667 ) ) ( not ( = ?auto_19665 ?auto_19668 ) ) ( not ( = ?auto_19665 ?auto_19669 ) ) ( not ( = ?auto_19666 ?auto_19667 ) ) ( not ( = ?auto_19666 ?auto_19668 ) ) ( not ( = ?auto_19666 ?auto_19669 ) ) ( not ( = ?auto_19667 ?auto_19668 ) ) ( not ( = ?auto_19667 ?auto_19669 ) ) ( not ( = ?auto_19668 ?auto_19669 ) ) ( ON ?auto_19667 ?auto_19668 ) ( CLEAR ?auto_19665 ) ( ON ?auto_19666 ?auto_19667 ) ( CLEAR ?auto_19666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19665 ?auto_19666 )
      ( MAKE-4PILE ?auto_19665 ?auto_19666 ?auto_19667 ?auto_19668 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19674 - BLOCK
      ?auto_19675 - BLOCK
      ?auto_19676 - BLOCK
      ?auto_19677 - BLOCK
    )
    :vars
    (
      ?auto_19678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19677 ?auto_19678 ) ( not ( = ?auto_19674 ?auto_19675 ) ) ( not ( = ?auto_19674 ?auto_19676 ) ) ( not ( = ?auto_19674 ?auto_19677 ) ) ( not ( = ?auto_19674 ?auto_19678 ) ) ( not ( = ?auto_19675 ?auto_19676 ) ) ( not ( = ?auto_19675 ?auto_19677 ) ) ( not ( = ?auto_19675 ?auto_19678 ) ) ( not ( = ?auto_19676 ?auto_19677 ) ) ( not ( = ?auto_19676 ?auto_19678 ) ) ( not ( = ?auto_19677 ?auto_19678 ) ) ( ON ?auto_19676 ?auto_19677 ) ( ON ?auto_19675 ?auto_19676 ) ( ON ?auto_19674 ?auto_19675 ) ( CLEAR ?auto_19674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19674 )
      ( MAKE-4PILE ?auto_19674 ?auto_19675 ?auto_19676 ?auto_19677 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19683 - BLOCK
      ?auto_19684 - BLOCK
      ?auto_19685 - BLOCK
      ?auto_19686 - BLOCK
    )
    :vars
    (
      ?auto_19687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19686 ?auto_19687 ) ( not ( = ?auto_19683 ?auto_19684 ) ) ( not ( = ?auto_19683 ?auto_19685 ) ) ( not ( = ?auto_19683 ?auto_19686 ) ) ( not ( = ?auto_19683 ?auto_19687 ) ) ( not ( = ?auto_19684 ?auto_19685 ) ) ( not ( = ?auto_19684 ?auto_19686 ) ) ( not ( = ?auto_19684 ?auto_19687 ) ) ( not ( = ?auto_19685 ?auto_19686 ) ) ( not ( = ?auto_19685 ?auto_19687 ) ) ( not ( = ?auto_19686 ?auto_19687 ) ) ( ON ?auto_19685 ?auto_19686 ) ( ON ?auto_19684 ?auto_19685 ) ( ON ?auto_19683 ?auto_19684 ) ( CLEAR ?auto_19683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19683 )
      ( MAKE-4PILE ?auto_19683 ?auto_19684 ?auto_19685 ?auto_19686 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19693 - BLOCK
      ?auto_19694 - BLOCK
      ?auto_19695 - BLOCK
      ?auto_19696 - BLOCK
      ?auto_19697 - BLOCK
    )
    :vars
    (
      ?auto_19698 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19696 ) ( ON ?auto_19697 ?auto_19698 ) ( CLEAR ?auto_19697 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19693 ) ( ON ?auto_19694 ?auto_19693 ) ( ON ?auto_19695 ?auto_19694 ) ( ON ?auto_19696 ?auto_19695 ) ( not ( = ?auto_19693 ?auto_19694 ) ) ( not ( = ?auto_19693 ?auto_19695 ) ) ( not ( = ?auto_19693 ?auto_19696 ) ) ( not ( = ?auto_19693 ?auto_19697 ) ) ( not ( = ?auto_19693 ?auto_19698 ) ) ( not ( = ?auto_19694 ?auto_19695 ) ) ( not ( = ?auto_19694 ?auto_19696 ) ) ( not ( = ?auto_19694 ?auto_19697 ) ) ( not ( = ?auto_19694 ?auto_19698 ) ) ( not ( = ?auto_19695 ?auto_19696 ) ) ( not ( = ?auto_19695 ?auto_19697 ) ) ( not ( = ?auto_19695 ?auto_19698 ) ) ( not ( = ?auto_19696 ?auto_19697 ) ) ( not ( = ?auto_19696 ?auto_19698 ) ) ( not ( = ?auto_19697 ?auto_19698 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19697 ?auto_19698 )
      ( !STACK ?auto_19697 ?auto_19696 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19704 - BLOCK
      ?auto_19705 - BLOCK
      ?auto_19706 - BLOCK
      ?auto_19707 - BLOCK
      ?auto_19708 - BLOCK
    )
    :vars
    (
      ?auto_19709 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19707 ) ( ON ?auto_19708 ?auto_19709 ) ( CLEAR ?auto_19708 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19704 ) ( ON ?auto_19705 ?auto_19704 ) ( ON ?auto_19706 ?auto_19705 ) ( ON ?auto_19707 ?auto_19706 ) ( not ( = ?auto_19704 ?auto_19705 ) ) ( not ( = ?auto_19704 ?auto_19706 ) ) ( not ( = ?auto_19704 ?auto_19707 ) ) ( not ( = ?auto_19704 ?auto_19708 ) ) ( not ( = ?auto_19704 ?auto_19709 ) ) ( not ( = ?auto_19705 ?auto_19706 ) ) ( not ( = ?auto_19705 ?auto_19707 ) ) ( not ( = ?auto_19705 ?auto_19708 ) ) ( not ( = ?auto_19705 ?auto_19709 ) ) ( not ( = ?auto_19706 ?auto_19707 ) ) ( not ( = ?auto_19706 ?auto_19708 ) ) ( not ( = ?auto_19706 ?auto_19709 ) ) ( not ( = ?auto_19707 ?auto_19708 ) ) ( not ( = ?auto_19707 ?auto_19709 ) ) ( not ( = ?auto_19708 ?auto_19709 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19708 ?auto_19709 )
      ( !STACK ?auto_19708 ?auto_19707 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19715 - BLOCK
      ?auto_19716 - BLOCK
      ?auto_19717 - BLOCK
      ?auto_19718 - BLOCK
      ?auto_19719 - BLOCK
    )
    :vars
    (
      ?auto_19720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19719 ?auto_19720 ) ( ON-TABLE ?auto_19715 ) ( ON ?auto_19716 ?auto_19715 ) ( ON ?auto_19717 ?auto_19716 ) ( not ( = ?auto_19715 ?auto_19716 ) ) ( not ( = ?auto_19715 ?auto_19717 ) ) ( not ( = ?auto_19715 ?auto_19718 ) ) ( not ( = ?auto_19715 ?auto_19719 ) ) ( not ( = ?auto_19715 ?auto_19720 ) ) ( not ( = ?auto_19716 ?auto_19717 ) ) ( not ( = ?auto_19716 ?auto_19718 ) ) ( not ( = ?auto_19716 ?auto_19719 ) ) ( not ( = ?auto_19716 ?auto_19720 ) ) ( not ( = ?auto_19717 ?auto_19718 ) ) ( not ( = ?auto_19717 ?auto_19719 ) ) ( not ( = ?auto_19717 ?auto_19720 ) ) ( not ( = ?auto_19718 ?auto_19719 ) ) ( not ( = ?auto_19718 ?auto_19720 ) ) ( not ( = ?auto_19719 ?auto_19720 ) ) ( CLEAR ?auto_19717 ) ( ON ?auto_19718 ?auto_19719 ) ( CLEAR ?auto_19718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19715 ?auto_19716 ?auto_19717 ?auto_19718 )
      ( MAKE-5PILE ?auto_19715 ?auto_19716 ?auto_19717 ?auto_19718 ?auto_19719 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19726 - BLOCK
      ?auto_19727 - BLOCK
      ?auto_19728 - BLOCK
      ?auto_19729 - BLOCK
      ?auto_19730 - BLOCK
    )
    :vars
    (
      ?auto_19731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19730 ?auto_19731 ) ( ON-TABLE ?auto_19726 ) ( ON ?auto_19727 ?auto_19726 ) ( ON ?auto_19728 ?auto_19727 ) ( not ( = ?auto_19726 ?auto_19727 ) ) ( not ( = ?auto_19726 ?auto_19728 ) ) ( not ( = ?auto_19726 ?auto_19729 ) ) ( not ( = ?auto_19726 ?auto_19730 ) ) ( not ( = ?auto_19726 ?auto_19731 ) ) ( not ( = ?auto_19727 ?auto_19728 ) ) ( not ( = ?auto_19727 ?auto_19729 ) ) ( not ( = ?auto_19727 ?auto_19730 ) ) ( not ( = ?auto_19727 ?auto_19731 ) ) ( not ( = ?auto_19728 ?auto_19729 ) ) ( not ( = ?auto_19728 ?auto_19730 ) ) ( not ( = ?auto_19728 ?auto_19731 ) ) ( not ( = ?auto_19729 ?auto_19730 ) ) ( not ( = ?auto_19729 ?auto_19731 ) ) ( not ( = ?auto_19730 ?auto_19731 ) ) ( CLEAR ?auto_19728 ) ( ON ?auto_19729 ?auto_19730 ) ( CLEAR ?auto_19729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19726 ?auto_19727 ?auto_19728 ?auto_19729 )
      ( MAKE-5PILE ?auto_19726 ?auto_19727 ?auto_19728 ?auto_19729 ?auto_19730 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19737 - BLOCK
      ?auto_19738 - BLOCK
      ?auto_19739 - BLOCK
      ?auto_19740 - BLOCK
      ?auto_19741 - BLOCK
    )
    :vars
    (
      ?auto_19742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19741 ?auto_19742 ) ( ON-TABLE ?auto_19737 ) ( ON ?auto_19738 ?auto_19737 ) ( not ( = ?auto_19737 ?auto_19738 ) ) ( not ( = ?auto_19737 ?auto_19739 ) ) ( not ( = ?auto_19737 ?auto_19740 ) ) ( not ( = ?auto_19737 ?auto_19741 ) ) ( not ( = ?auto_19737 ?auto_19742 ) ) ( not ( = ?auto_19738 ?auto_19739 ) ) ( not ( = ?auto_19738 ?auto_19740 ) ) ( not ( = ?auto_19738 ?auto_19741 ) ) ( not ( = ?auto_19738 ?auto_19742 ) ) ( not ( = ?auto_19739 ?auto_19740 ) ) ( not ( = ?auto_19739 ?auto_19741 ) ) ( not ( = ?auto_19739 ?auto_19742 ) ) ( not ( = ?auto_19740 ?auto_19741 ) ) ( not ( = ?auto_19740 ?auto_19742 ) ) ( not ( = ?auto_19741 ?auto_19742 ) ) ( ON ?auto_19740 ?auto_19741 ) ( CLEAR ?auto_19738 ) ( ON ?auto_19739 ?auto_19740 ) ( CLEAR ?auto_19739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19737 ?auto_19738 ?auto_19739 )
      ( MAKE-5PILE ?auto_19737 ?auto_19738 ?auto_19739 ?auto_19740 ?auto_19741 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19748 - BLOCK
      ?auto_19749 - BLOCK
      ?auto_19750 - BLOCK
      ?auto_19751 - BLOCK
      ?auto_19752 - BLOCK
    )
    :vars
    (
      ?auto_19753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19752 ?auto_19753 ) ( ON-TABLE ?auto_19748 ) ( ON ?auto_19749 ?auto_19748 ) ( not ( = ?auto_19748 ?auto_19749 ) ) ( not ( = ?auto_19748 ?auto_19750 ) ) ( not ( = ?auto_19748 ?auto_19751 ) ) ( not ( = ?auto_19748 ?auto_19752 ) ) ( not ( = ?auto_19748 ?auto_19753 ) ) ( not ( = ?auto_19749 ?auto_19750 ) ) ( not ( = ?auto_19749 ?auto_19751 ) ) ( not ( = ?auto_19749 ?auto_19752 ) ) ( not ( = ?auto_19749 ?auto_19753 ) ) ( not ( = ?auto_19750 ?auto_19751 ) ) ( not ( = ?auto_19750 ?auto_19752 ) ) ( not ( = ?auto_19750 ?auto_19753 ) ) ( not ( = ?auto_19751 ?auto_19752 ) ) ( not ( = ?auto_19751 ?auto_19753 ) ) ( not ( = ?auto_19752 ?auto_19753 ) ) ( ON ?auto_19751 ?auto_19752 ) ( CLEAR ?auto_19749 ) ( ON ?auto_19750 ?auto_19751 ) ( CLEAR ?auto_19750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19748 ?auto_19749 ?auto_19750 )
      ( MAKE-5PILE ?auto_19748 ?auto_19749 ?auto_19750 ?auto_19751 ?auto_19752 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19759 - BLOCK
      ?auto_19760 - BLOCK
      ?auto_19761 - BLOCK
      ?auto_19762 - BLOCK
      ?auto_19763 - BLOCK
    )
    :vars
    (
      ?auto_19764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19763 ?auto_19764 ) ( ON-TABLE ?auto_19759 ) ( not ( = ?auto_19759 ?auto_19760 ) ) ( not ( = ?auto_19759 ?auto_19761 ) ) ( not ( = ?auto_19759 ?auto_19762 ) ) ( not ( = ?auto_19759 ?auto_19763 ) ) ( not ( = ?auto_19759 ?auto_19764 ) ) ( not ( = ?auto_19760 ?auto_19761 ) ) ( not ( = ?auto_19760 ?auto_19762 ) ) ( not ( = ?auto_19760 ?auto_19763 ) ) ( not ( = ?auto_19760 ?auto_19764 ) ) ( not ( = ?auto_19761 ?auto_19762 ) ) ( not ( = ?auto_19761 ?auto_19763 ) ) ( not ( = ?auto_19761 ?auto_19764 ) ) ( not ( = ?auto_19762 ?auto_19763 ) ) ( not ( = ?auto_19762 ?auto_19764 ) ) ( not ( = ?auto_19763 ?auto_19764 ) ) ( ON ?auto_19762 ?auto_19763 ) ( ON ?auto_19761 ?auto_19762 ) ( CLEAR ?auto_19759 ) ( ON ?auto_19760 ?auto_19761 ) ( CLEAR ?auto_19760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19759 ?auto_19760 )
      ( MAKE-5PILE ?auto_19759 ?auto_19760 ?auto_19761 ?auto_19762 ?auto_19763 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19770 - BLOCK
      ?auto_19771 - BLOCK
      ?auto_19772 - BLOCK
      ?auto_19773 - BLOCK
      ?auto_19774 - BLOCK
    )
    :vars
    (
      ?auto_19775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19774 ?auto_19775 ) ( ON-TABLE ?auto_19770 ) ( not ( = ?auto_19770 ?auto_19771 ) ) ( not ( = ?auto_19770 ?auto_19772 ) ) ( not ( = ?auto_19770 ?auto_19773 ) ) ( not ( = ?auto_19770 ?auto_19774 ) ) ( not ( = ?auto_19770 ?auto_19775 ) ) ( not ( = ?auto_19771 ?auto_19772 ) ) ( not ( = ?auto_19771 ?auto_19773 ) ) ( not ( = ?auto_19771 ?auto_19774 ) ) ( not ( = ?auto_19771 ?auto_19775 ) ) ( not ( = ?auto_19772 ?auto_19773 ) ) ( not ( = ?auto_19772 ?auto_19774 ) ) ( not ( = ?auto_19772 ?auto_19775 ) ) ( not ( = ?auto_19773 ?auto_19774 ) ) ( not ( = ?auto_19773 ?auto_19775 ) ) ( not ( = ?auto_19774 ?auto_19775 ) ) ( ON ?auto_19773 ?auto_19774 ) ( ON ?auto_19772 ?auto_19773 ) ( CLEAR ?auto_19770 ) ( ON ?auto_19771 ?auto_19772 ) ( CLEAR ?auto_19771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19770 ?auto_19771 )
      ( MAKE-5PILE ?auto_19770 ?auto_19771 ?auto_19772 ?auto_19773 ?auto_19774 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19781 - BLOCK
      ?auto_19782 - BLOCK
      ?auto_19783 - BLOCK
      ?auto_19784 - BLOCK
      ?auto_19785 - BLOCK
    )
    :vars
    (
      ?auto_19786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19785 ?auto_19786 ) ( not ( = ?auto_19781 ?auto_19782 ) ) ( not ( = ?auto_19781 ?auto_19783 ) ) ( not ( = ?auto_19781 ?auto_19784 ) ) ( not ( = ?auto_19781 ?auto_19785 ) ) ( not ( = ?auto_19781 ?auto_19786 ) ) ( not ( = ?auto_19782 ?auto_19783 ) ) ( not ( = ?auto_19782 ?auto_19784 ) ) ( not ( = ?auto_19782 ?auto_19785 ) ) ( not ( = ?auto_19782 ?auto_19786 ) ) ( not ( = ?auto_19783 ?auto_19784 ) ) ( not ( = ?auto_19783 ?auto_19785 ) ) ( not ( = ?auto_19783 ?auto_19786 ) ) ( not ( = ?auto_19784 ?auto_19785 ) ) ( not ( = ?auto_19784 ?auto_19786 ) ) ( not ( = ?auto_19785 ?auto_19786 ) ) ( ON ?auto_19784 ?auto_19785 ) ( ON ?auto_19783 ?auto_19784 ) ( ON ?auto_19782 ?auto_19783 ) ( ON ?auto_19781 ?auto_19782 ) ( CLEAR ?auto_19781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19781 )
      ( MAKE-5PILE ?auto_19781 ?auto_19782 ?auto_19783 ?auto_19784 ?auto_19785 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19792 - BLOCK
      ?auto_19793 - BLOCK
      ?auto_19794 - BLOCK
      ?auto_19795 - BLOCK
      ?auto_19796 - BLOCK
    )
    :vars
    (
      ?auto_19797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19796 ?auto_19797 ) ( not ( = ?auto_19792 ?auto_19793 ) ) ( not ( = ?auto_19792 ?auto_19794 ) ) ( not ( = ?auto_19792 ?auto_19795 ) ) ( not ( = ?auto_19792 ?auto_19796 ) ) ( not ( = ?auto_19792 ?auto_19797 ) ) ( not ( = ?auto_19793 ?auto_19794 ) ) ( not ( = ?auto_19793 ?auto_19795 ) ) ( not ( = ?auto_19793 ?auto_19796 ) ) ( not ( = ?auto_19793 ?auto_19797 ) ) ( not ( = ?auto_19794 ?auto_19795 ) ) ( not ( = ?auto_19794 ?auto_19796 ) ) ( not ( = ?auto_19794 ?auto_19797 ) ) ( not ( = ?auto_19795 ?auto_19796 ) ) ( not ( = ?auto_19795 ?auto_19797 ) ) ( not ( = ?auto_19796 ?auto_19797 ) ) ( ON ?auto_19795 ?auto_19796 ) ( ON ?auto_19794 ?auto_19795 ) ( ON ?auto_19793 ?auto_19794 ) ( ON ?auto_19792 ?auto_19793 ) ( CLEAR ?auto_19792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19792 )
      ( MAKE-5PILE ?auto_19792 ?auto_19793 ?auto_19794 ?auto_19795 ?auto_19796 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19804 - BLOCK
      ?auto_19805 - BLOCK
      ?auto_19806 - BLOCK
      ?auto_19807 - BLOCK
      ?auto_19808 - BLOCK
      ?auto_19809 - BLOCK
    )
    :vars
    (
      ?auto_19810 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19808 ) ( ON ?auto_19809 ?auto_19810 ) ( CLEAR ?auto_19809 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19804 ) ( ON ?auto_19805 ?auto_19804 ) ( ON ?auto_19806 ?auto_19805 ) ( ON ?auto_19807 ?auto_19806 ) ( ON ?auto_19808 ?auto_19807 ) ( not ( = ?auto_19804 ?auto_19805 ) ) ( not ( = ?auto_19804 ?auto_19806 ) ) ( not ( = ?auto_19804 ?auto_19807 ) ) ( not ( = ?auto_19804 ?auto_19808 ) ) ( not ( = ?auto_19804 ?auto_19809 ) ) ( not ( = ?auto_19804 ?auto_19810 ) ) ( not ( = ?auto_19805 ?auto_19806 ) ) ( not ( = ?auto_19805 ?auto_19807 ) ) ( not ( = ?auto_19805 ?auto_19808 ) ) ( not ( = ?auto_19805 ?auto_19809 ) ) ( not ( = ?auto_19805 ?auto_19810 ) ) ( not ( = ?auto_19806 ?auto_19807 ) ) ( not ( = ?auto_19806 ?auto_19808 ) ) ( not ( = ?auto_19806 ?auto_19809 ) ) ( not ( = ?auto_19806 ?auto_19810 ) ) ( not ( = ?auto_19807 ?auto_19808 ) ) ( not ( = ?auto_19807 ?auto_19809 ) ) ( not ( = ?auto_19807 ?auto_19810 ) ) ( not ( = ?auto_19808 ?auto_19809 ) ) ( not ( = ?auto_19808 ?auto_19810 ) ) ( not ( = ?auto_19809 ?auto_19810 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19809 ?auto_19810 )
      ( !STACK ?auto_19809 ?auto_19808 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19817 - BLOCK
      ?auto_19818 - BLOCK
      ?auto_19819 - BLOCK
      ?auto_19820 - BLOCK
      ?auto_19821 - BLOCK
      ?auto_19822 - BLOCK
    )
    :vars
    (
      ?auto_19823 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19821 ) ( ON ?auto_19822 ?auto_19823 ) ( CLEAR ?auto_19822 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19817 ) ( ON ?auto_19818 ?auto_19817 ) ( ON ?auto_19819 ?auto_19818 ) ( ON ?auto_19820 ?auto_19819 ) ( ON ?auto_19821 ?auto_19820 ) ( not ( = ?auto_19817 ?auto_19818 ) ) ( not ( = ?auto_19817 ?auto_19819 ) ) ( not ( = ?auto_19817 ?auto_19820 ) ) ( not ( = ?auto_19817 ?auto_19821 ) ) ( not ( = ?auto_19817 ?auto_19822 ) ) ( not ( = ?auto_19817 ?auto_19823 ) ) ( not ( = ?auto_19818 ?auto_19819 ) ) ( not ( = ?auto_19818 ?auto_19820 ) ) ( not ( = ?auto_19818 ?auto_19821 ) ) ( not ( = ?auto_19818 ?auto_19822 ) ) ( not ( = ?auto_19818 ?auto_19823 ) ) ( not ( = ?auto_19819 ?auto_19820 ) ) ( not ( = ?auto_19819 ?auto_19821 ) ) ( not ( = ?auto_19819 ?auto_19822 ) ) ( not ( = ?auto_19819 ?auto_19823 ) ) ( not ( = ?auto_19820 ?auto_19821 ) ) ( not ( = ?auto_19820 ?auto_19822 ) ) ( not ( = ?auto_19820 ?auto_19823 ) ) ( not ( = ?auto_19821 ?auto_19822 ) ) ( not ( = ?auto_19821 ?auto_19823 ) ) ( not ( = ?auto_19822 ?auto_19823 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19822 ?auto_19823 )
      ( !STACK ?auto_19822 ?auto_19821 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19830 - BLOCK
      ?auto_19831 - BLOCK
      ?auto_19832 - BLOCK
      ?auto_19833 - BLOCK
      ?auto_19834 - BLOCK
      ?auto_19835 - BLOCK
    )
    :vars
    (
      ?auto_19836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19835 ?auto_19836 ) ( ON-TABLE ?auto_19830 ) ( ON ?auto_19831 ?auto_19830 ) ( ON ?auto_19832 ?auto_19831 ) ( ON ?auto_19833 ?auto_19832 ) ( not ( = ?auto_19830 ?auto_19831 ) ) ( not ( = ?auto_19830 ?auto_19832 ) ) ( not ( = ?auto_19830 ?auto_19833 ) ) ( not ( = ?auto_19830 ?auto_19834 ) ) ( not ( = ?auto_19830 ?auto_19835 ) ) ( not ( = ?auto_19830 ?auto_19836 ) ) ( not ( = ?auto_19831 ?auto_19832 ) ) ( not ( = ?auto_19831 ?auto_19833 ) ) ( not ( = ?auto_19831 ?auto_19834 ) ) ( not ( = ?auto_19831 ?auto_19835 ) ) ( not ( = ?auto_19831 ?auto_19836 ) ) ( not ( = ?auto_19832 ?auto_19833 ) ) ( not ( = ?auto_19832 ?auto_19834 ) ) ( not ( = ?auto_19832 ?auto_19835 ) ) ( not ( = ?auto_19832 ?auto_19836 ) ) ( not ( = ?auto_19833 ?auto_19834 ) ) ( not ( = ?auto_19833 ?auto_19835 ) ) ( not ( = ?auto_19833 ?auto_19836 ) ) ( not ( = ?auto_19834 ?auto_19835 ) ) ( not ( = ?auto_19834 ?auto_19836 ) ) ( not ( = ?auto_19835 ?auto_19836 ) ) ( CLEAR ?auto_19833 ) ( ON ?auto_19834 ?auto_19835 ) ( CLEAR ?auto_19834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19830 ?auto_19831 ?auto_19832 ?auto_19833 ?auto_19834 )
      ( MAKE-6PILE ?auto_19830 ?auto_19831 ?auto_19832 ?auto_19833 ?auto_19834 ?auto_19835 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19843 - BLOCK
      ?auto_19844 - BLOCK
      ?auto_19845 - BLOCK
      ?auto_19846 - BLOCK
      ?auto_19847 - BLOCK
      ?auto_19848 - BLOCK
    )
    :vars
    (
      ?auto_19849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19848 ?auto_19849 ) ( ON-TABLE ?auto_19843 ) ( ON ?auto_19844 ?auto_19843 ) ( ON ?auto_19845 ?auto_19844 ) ( ON ?auto_19846 ?auto_19845 ) ( not ( = ?auto_19843 ?auto_19844 ) ) ( not ( = ?auto_19843 ?auto_19845 ) ) ( not ( = ?auto_19843 ?auto_19846 ) ) ( not ( = ?auto_19843 ?auto_19847 ) ) ( not ( = ?auto_19843 ?auto_19848 ) ) ( not ( = ?auto_19843 ?auto_19849 ) ) ( not ( = ?auto_19844 ?auto_19845 ) ) ( not ( = ?auto_19844 ?auto_19846 ) ) ( not ( = ?auto_19844 ?auto_19847 ) ) ( not ( = ?auto_19844 ?auto_19848 ) ) ( not ( = ?auto_19844 ?auto_19849 ) ) ( not ( = ?auto_19845 ?auto_19846 ) ) ( not ( = ?auto_19845 ?auto_19847 ) ) ( not ( = ?auto_19845 ?auto_19848 ) ) ( not ( = ?auto_19845 ?auto_19849 ) ) ( not ( = ?auto_19846 ?auto_19847 ) ) ( not ( = ?auto_19846 ?auto_19848 ) ) ( not ( = ?auto_19846 ?auto_19849 ) ) ( not ( = ?auto_19847 ?auto_19848 ) ) ( not ( = ?auto_19847 ?auto_19849 ) ) ( not ( = ?auto_19848 ?auto_19849 ) ) ( CLEAR ?auto_19846 ) ( ON ?auto_19847 ?auto_19848 ) ( CLEAR ?auto_19847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19843 ?auto_19844 ?auto_19845 ?auto_19846 ?auto_19847 )
      ( MAKE-6PILE ?auto_19843 ?auto_19844 ?auto_19845 ?auto_19846 ?auto_19847 ?auto_19848 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19856 - BLOCK
      ?auto_19857 - BLOCK
      ?auto_19858 - BLOCK
      ?auto_19859 - BLOCK
      ?auto_19860 - BLOCK
      ?auto_19861 - BLOCK
    )
    :vars
    (
      ?auto_19862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19861 ?auto_19862 ) ( ON-TABLE ?auto_19856 ) ( ON ?auto_19857 ?auto_19856 ) ( ON ?auto_19858 ?auto_19857 ) ( not ( = ?auto_19856 ?auto_19857 ) ) ( not ( = ?auto_19856 ?auto_19858 ) ) ( not ( = ?auto_19856 ?auto_19859 ) ) ( not ( = ?auto_19856 ?auto_19860 ) ) ( not ( = ?auto_19856 ?auto_19861 ) ) ( not ( = ?auto_19856 ?auto_19862 ) ) ( not ( = ?auto_19857 ?auto_19858 ) ) ( not ( = ?auto_19857 ?auto_19859 ) ) ( not ( = ?auto_19857 ?auto_19860 ) ) ( not ( = ?auto_19857 ?auto_19861 ) ) ( not ( = ?auto_19857 ?auto_19862 ) ) ( not ( = ?auto_19858 ?auto_19859 ) ) ( not ( = ?auto_19858 ?auto_19860 ) ) ( not ( = ?auto_19858 ?auto_19861 ) ) ( not ( = ?auto_19858 ?auto_19862 ) ) ( not ( = ?auto_19859 ?auto_19860 ) ) ( not ( = ?auto_19859 ?auto_19861 ) ) ( not ( = ?auto_19859 ?auto_19862 ) ) ( not ( = ?auto_19860 ?auto_19861 ) ) ( not ( = ?auto_19860 ?auto_19862 ) ) ( not ( = ?auto_19861 ?auto_19862 ) ) ( ON ?auto_19860 ?auto_19861 ) ( CLEAR ?auto_19858 ) ( ON ?auto_19859 ?auto_19860 ) ( CLEAR ?auto_19859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19856 ?auto_19857 ?auto_19858 ?auto_19859 )
      ( MAKE-6PILE ?auto_19856 ?auto_19857 ?auto_19858 ?auto_19859 ?auto_19860 ?auto_19861 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19869 - BLOCK
      ?auto_19870 - BLOCK
      ?auto_19871 - BLOCK
      ?auto_19872 - BLOCK
      ?auto_19873 - BLOCK
      ?auto_19874 - BLOCK
    )
    :vars
    (
      ?auto_19875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19874 ?auto_19875 ) ( ON-TABLE ?auto_19869 ) ( ON ?auto_19870 ?auto_19869 ) ( ON ?auto_19871 ?auto_19870 ) ( not ( = ?auto_19869 ?auto_19870 ) ) ( not ( = ?auto_19869 ?auto_19871 ) ) ( not ( = ?auto_19869 ?auto_19872 ) ) ( not ( = ?auto_19869 ?auto_19873 ) ) ( not ( = ?auto_19869 ?auto_19874 ) ) ( not ( = ?auto_19869 ?auto_19875 ) ) ( not ( = ?auto_19870 ?auto_19871 ) ) ( not ( = ?auto_19870 ?auto_19872 ) ) ( not ( = ?auto_19870 ?auto_19873 ) ) ( not ( = ?auto_19870 ?auto_19874 ) ) ( not ( = ?auto_19870 ?auto_19875 ) ) ( not ( = ?auto_19871 ?auto_19872 ) ) ( not ( = ?auto_19871 ?auto_19873 ) ) ( not ( = ?auto_19871 ?auto_19874 ) ) ( not ( = ?auto_19871 ?auto_19875 ) ) ( not ( = ?auto_19872 ?auto_19873 ) ) ( not ( = ?auto_19872 ?auto_19874 ) ) ( not ( = ?auto_19872 ?auto_19875 ) ) ( not ( = ?auto_19873 ?auto_19874 ) ) ( not ( = ?auto_19873 ?auto_19875 ) ) ( not ( = ?auto_19874 ?auto_19875 ) ) ( ON ?auto_19873 ?auto_19874 ) ( CLEAR ?auto_19871 ) ( ON ?auto_19872 ?auto_19873 ) ( CLEAR ?auto_19872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19869 ?auto_19870 ?auto_19871 ?auto_19872 )
      ( MAKE-6PILE ?auto_19869 ?auto_19870 ?auto_19871 ?auto_19872 ?auto_19873 ?auto_19874 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19882 - BLOCK
      ?auto_19883 - BLOCK
      ?auto_19884 - BLOCK
      ?auto_19885 - BLOCK
      ?auto_19886 - BLOCK
      ?auto_19887 - BLOCK
    )
    :vars
    (
      ?auto_19888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19887 ?auto_19888 ) ( ON-TABLE ?auto_19882 ) ( ON ?auto_19883 ?auto_19882 ) ( not ( = ?auto_19882 ?auto_19883 ) ) ( not ( = ?auto_19882 ?auto_19884 ) ) ( not ( = ?auto_19882 ?auto_19885 ) ) ( not ( = ?auto_19882 ?auto_19886 ) ) ( not ( = ?auto_19882 ?auto_19887 ) ) ( not ( = ?auto_19882 ?auto_19888 ) ) ( not ( = ?auto_19883 ?auto_19884 ) ) ( not ( = ?auto_19883 ?auto_19885 ) ) ( not ( = ?auto_19883 ?auto_19886 ) ) ( not ( = ?auto_19883 ?auto_19887 ) ) ( not ( = ?auto_19883 ?auto_19888 ) ) ( not ( = ?auto_19884 ?auto_19885 ) ) ( not ( = ?auto_19884 ?auto_19886 ) ) ( not ( = ?auto_19884 ?auto_19887 ) ) ( not ( = ?auto_19884 ?auto_19888 ) ) ( not ( = ?auto_19885 ?auto_19886 ) ) ( not ( = ?auto_19885 ?auto_19887 ) ) ( not ( = ?auto_19885 ?auto_19888 ) ) ( not ( = ?auto_19886 ?auto_19887 ) ) ( not ( = ?auto_19886 ?auto_19888 ) ) ( not ( = ?auto_19887 ?auto_19888 ) ) ( ON ?auto_19886 ?auto_19887 ) ( ON ?auto_19885 ?auto_19886 ) ( CLEAR ?auto_19883 ) ( ON ?auto_19884 ?auto_19885 ) ( CLEAR ?auto_19884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19882 ?auto_19883 ?auto_19884 )
      ( MAKE-6PILE ?auto_19882 ?auto_19883 ?auto_19884 ?auto_19885 ?auto_19886 ?auto_19887 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19895 - BLOCK
      ?auto_19896 - BLOCK
      ?auto_19897 - BLOCK
      ?auto_19898 - BLOCK
      ?auto_19899 - BLOCK
      ?auto_19900 - BLOCK
    )
    :vars
    (
      ?auto_19901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19900 ?auto_19901 ) ( ON-TABLE ?auto_19895 ) ( ON ?auto_19896 ?auto_19895 ) ( not ( = ?auto_19895 ?auto_19896 ) ) ( not ( = ?auto_19895 ?auto_19897 ) ) ( not ( = ?auto_19895 ?auto_19898 ) ) ( not ( = ?auto_19895 ?auto_19899 ) ) ( not ( = ?auto_19895 ?auto_19900 ) ) ( not ( = ?auto_19895 ?auto_19901 ) ) ( not ( = ?auto_19896 ?auto_19897 ) ) ( not ( = ?auto_19896 ?auto_19898 ) ) ( not ( = ?auto_19896 ?auto_19899 ) ) ( not ( = ?auto_19896 ?auto_19900 ) ) ( not ( = ?auto_19896 ?auto_19901 ) ) ( not ( = ?auto_19897 ?auto_19898 ) ) ( not ( = ?auto_19897 ?auto_19899 ) ) ( not ( = ?auto_19897 ?auto_19900 ) ) ( not ( = ?auto_19897 ?auto_19901 ) ) ( not ( = ?auto_19898 ?auto_19899 ) ) ( not ( = ?auto_19898 ?auto_19900 ) ) ( not ( = ?auto_19898 ?auto_19901 ) ) ( not ( = ?auto_19899 ?auto_19900 ) ) ( not ( = ?auto_19899 ?auto_19901 ) ) ( not ( = ?auto_19900 ?auto_19901 ) ) ( ON ?auto_19899 ?auto_19900 ) ( ON ?auto_19898 ?auto_19899 ) ( CLEAR ?auto_19896 ) ( ON ?auto_19897 ?auto_19898 ) ( CLEAR ?auto_19897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19895 ?auto_19896 ?auto_19897 )
      ( MAKE-6PILE ?auto_19895 ?auto_19896 ?auto_19897 ?auto_19898 ?auto_19899 ?auto_19900 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19908 - BLOCK
      ?auto_19909 - BLOCK
      ?auto_19910 - BLOCK
      ?auto_19911 - BLOCK
      ?auto_19912 - BLOCK
      ?auto_19913 - BLOCK
    )
    :vars
    (
      ?auto_19914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19913 ?auto_19914 ) ( ON-TABLE ?auto_19908 ) ( not ( = ?auto_19908 ?auto_19909 ) ) ( not ( = ?auto_19908 ?auto_19910 ) ) ( not ( = ?auto_19908 ?auto_19911 ) ) ( not ( = ?auto_19908 ?auto_19912 ) ) ( not ( = ?auto_19908 ?auto_19913 ) ) ( not ( = ?auto_19908 ?auto_19914 ) ) ( not ( = ?auto_19909 ?auto_19910 ) ) ( not ( = ?auto_19909 ?auto_19911 ) ) ( not ( = ?auto_19909 ?auto_19912 ) ) ( not ( = ?auto_19909 ?auto_19913 ) ) ( not ( = ?auto_19909 ?auto_19914 ) ) ( not ( = ?auto_19910 ?auto_19911 ) ) ( not ( = ?auto_19910 ?auto_19912 ) ) ( not ( = ?auto_19910 ?auto_19913 ) ) ( not ( = ?auto_19910 ?auto_19914 ) ) ( not ( = ?auto_19911 ?auto_19912 ) ) ( not ( = ?auto_19911 ?auto_19913 ) ) ( not ( = ?auto_19911 ?auto_19914 ) ) ( not ( = ?auto_19912 ?auto_19913 ) ) ( not ( = ?auto_19912 ?auto_19914 ) ) ( not ( = ?auto_19913 ?auto_19914 ) ) ( ON ?auto_19912 ?auto_19913 ) ( ON ?auto_19911 ?auto_19912 ) ( ON ?auto_19910 ?auto_19911 ) ( CLEAR ?auto_19908 ) ( ON ?auto_19909 ?auto_19910 ) ( CLEAR ?auto_19909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19908 ?auto_19909 )
      ( MAKE-6PILE ?auto_19908 ?auto_19909 ?auto_19910 ?auto_19911 ?auto_19912 ?auto_19913 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19921 - BLOCK
      ?auto_19922 - BLOCK
      ?auto_19923 - BLOCK
      ?auto_19924 - BLOCK
      ?auto_19925 - BLOCK
      ?auto_19926 - BLOCK
    )
    :vars
    (
      ?auto_19927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19926 ?auto_19927 ) ( ON-TABLE ?auto_19921 ) ( not ( = ?auto_19921 ?auto_19922 ) ) ( not ( = ?auto_19921 ?auto_19923 ) ) ( not ( = ?auto_19921 ?auto_19924 ) ) ( not ( = ?auto_19921 ?auto_19925 ) ) ( not ( = ?auto_19921 ?auto_19926 ) ) ( not ( = ?auto_19921 ?auto_19927 ) ) ( not ( = ?auto_19922 ?auto_19923 ) ) ( not ( = ?auto_19922 ?auto_19924 ) ) ( not ( = ?auto_19922 ?auto_19925 ) ) ( not ( = ?auto_19922 ?auto_19926 ) ) ( not ( = ?auto_19922 ?auto_19927 ) ) ( not ( = ?auto_19923 ?auto_19924 ) ) ( not ( = ?auto_19923 ?auto_19925 ) ) ( not ( = ?auto_19923 ?auto_19926 ) ) ( not ( = ?auto_19923 ?auto_19927 ) ) ( not ( = ?auto_19924 ?auto_19925 ) ) ( not ( = ?auto_19924 ?auto_19926 ) ) ( not ( = ?auto_19924 ?auto_19927 ) ) ( not ( = ?auto_19925 ?auto_19926 ) ) ( not ( = ?auto_19925 ?auto_19927 ) ) ( not ( = ?auto_19926 ?auto_19927 ) ) ( ON ?auto_19925 ?auto_19926 ) ( ON ?auto_19924 ?auto_19925 ) ( ON ?auto_19923 ?auto_19924 ) ( CLEAR ?auto_19921 ) ( ON ?auto_19922 ?auto_19923 ) ( CLEAR ?auto_19922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19921 ?auto_19922 )
      ( MAKE-6PILE ?auto_19921 ?auto_19922 ?auto_19923 ?auto_19924 ?auto_19925 ?auto_19926 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19934 - BLOCK
      ?auto_19935 - BLOCK
      ?auto_19936 - BLOCK
      ?auto_19937 - BLOCK
      ?auto_19938 - BLOCK
      ?auto_19939 - BLOCK
    )
    :vars
    (
      ?auto_19940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19939 ?auto_19940 ) ( not ( = ?auto_19934 ?auto_19935 ) ) ( not ( = ?auto_19934 ?auto_19936 ) ) ( not ( = ?auto_19934 ?auto_19937 ) ) ( not ( = ?auto_19934 ?auto_19938 ) ) ( not ( = ?auto_19934 ?auto_19939 ) ) ( not ( = ?auto_19934 ?auto_19940 ) ) ( not ( = ?auto_19935 ?auto_19936 ) ) ( not ( = ?auto_19935 ?auto_19937 ) ) ( not ( = ?auto_19935 ?auto_19938 ) ) ( not ( = ?auto_19935 ?auto_19939 ) ) ( not ( = ?auto_19935 ?auto_19940 ) ) ( not ( = ?auto_19936 ?auto_19937 ) ) ( not ( = ?auto_19936 ?auto_19938 ) ) ( not ( = ?auto_19936 ?auto_19939 ) ) ( not ( = ?auto_19936 ?auto_19940 ) ) ( not ( = ?auto_19937 ?auto_19938 ) ) ( not ( = ?auto_19937 ?auto_19939 ) ) ( not ( = ?auto_19937 ?auto_19940 ) ) ( not ( = ?auto_19938 ?auto_19939 ) ) ( not ( = ?auto_19938 ?auto_19940 ) ) ( not ( = ?auto_19939 ?auto_19940 ) ) ( ON ?auto_19938 ?auto_19939 ) ( ON ?auto_19937 ?auto_19938 ) ( ON ?auto_19936 ?auto_19937 ) ( ON ?auto_19935 ?auto_19936 ) ( ON ?auto_19934 ?auto_19935 ) ( CLEAR ?auto_19934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19934 )
      ( MAKE-6PILE ?auto_19934 ?auto_19935 ?auto_19936 ?auto_19937 ?auto_19938 ?auto_19939 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19947 - BLOCK
      ?auto_19948 - BLOCK
      ?auto_19949 - BLOCK
      ?auto_19950 - BLOCK
      ?auto_19951 - BLOCK
      ?auto_19952 - BLOCK
    )
    :vars
    (
      ?auto_19953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19952 ?auto_19953 ) ( not ( = ?auto_19947 ?auto_19948 ) ) ( not ( = ?auto_19947 ?auto_19949 ) ) ( not ( = ?auto_19947 ?auto_19950 ) ) ( not ( = ?auto_19947 ?auto_19951 ) ) ( not ( = ?auto_19947 ?auto_19952 ) ) ( not ( = ?auto_19947 ?auto_19953 ) ) ( not ( = ?auto_19948 ?auto_19949 ) ) ( not ( = ?auto_19948 ?auto_19950 ) ) ( not ( = ?auto_19948 ?auto_19951 ) ) ( not ( = ?auto_19948 ?auto_19952 ) ) ( not ( = ?auto_19948 ?auto_19953 ) ) ( not ( = ?auto_19949 ?auto_19950 ) ) ( not ( = ?auto_19949 ?auto_19951 ) ) ( not ( = ?auto_19949 ?auto_19952 ) ) ( not ( = ?auto_19949 ?auto_19953 ) ) ( not ( = ?auto_19950 ?auto_19951 ) ) ( not ( = ?auto_19950 ?auto_19952 ) ) ( not ( = ?auto_19950 ?auto_19953 ) ) ( not ( = ?auto_19951 ?auto_19952 ) ) ( not ( = ?auto_19951 ?auto_19953 ) ) ( not ( = ?auto_19952 ?auto_19953 ) ) ( ON ?auto_19951 ?auto_19952 ) ( ON ?auto_19950 ?auto_19951 ) ( ON ?auto_19949 ?auto_19950 ) ( ON ?auto_19948 ?auto_19949 ) ( ON ?auto_19947 ?auto_19948 ) ( CLEAR ?auto_19947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19947 )
      ( MAKE-6PILE ?auto_19947 ?auto_19948 ?auto_19949 ?auto_19950 ?auto_19951 ?auto_19952 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19961 - BLOCK
      ?auto_19962 - BLOCK
      ?auto_19963 - BLOCK
      ?auto_19964 - BLOCK
      ?auto_19965 - BLOCK
      ?auto_19966 - BLOCK
      ?auto_19967 - BLOCK
    )
    :vars
    (
      ?auto_19968 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19966 ) ( ON ?auto_19967 ?auto_19968 ) ( CLEAR ?auto_19967 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19961 ) ( ON ?auto_19962 ?auto_19961 ) ( ON ?auto_19963 ?auto_19962 ) ( ON ?auto_19964 ?auto_19963 ) ( ON ?auto_19965 ?auto_19964 ) ( ON ?auto_19966 ?auto_19965 ) ( not ( = ?auto_19961 ?auto_19962 ) ) ( not ( = ?auto_19961 ?auto_19963 ) ) ( not ( = ?auto_19961 ?auto_19964 ) ) ( not ( = ?auto_19961 ?auto_19965 ) ) ( not ( = ?auto_19961 ?auto_19966 ) ) ( not ( = ?auto_19961 ?auto_19967 ) ) ( not ( = ?auto_19961 ?auto_19968 ) ) ( not ( = ?auto_19962 ?auto_19963 ) ) ( not ( = ?auto_19962 ?auto_19964 ) ) ( not ( = ?auto_19962 ?auto_19965 ) ) ( not ( = ?auto_19962 ?auto_19966 ) ) ( not ( = ?auto_19962 ?auto_19967 ) ) ( not ( = ?auto_19962 ?auto_19968 ) ) ( not ( = ?auto_19963 ?auto_19964 ) ) ( not ( = ?auto_19963 ?auto_19965 ) ) ( not ( = ?auto_19963 ?auto_19966 ) ) ( not ( = ?auto_19963 ?auto_19967 ) ) ( not ( = ?auto_19963 ?auto_19968 ) ) ( not ( = ?auto_19964 ?auto_19965 ) ) ( not ( = ?auto_19964 ?auto_19966 ) ) ( not ( = ?auto_19964 ?auto_19967 ) ) ( not ( = ?auto_19964 ?auto_19968 ) ) ( not ( = ?auto_19965 ?auto_19966 ) ) ( not ( = ?auto_19965 ?auto_19967 ) ) ( not ( = ?auto_19965 ?auto_19968 ) ) ( not ( = ?auto_19966 ?auto_19967 ) ) ( not ( = ?auto_19966 ?auto_19968 ) ) ( not ( = ?auto_19967 ?auto_19968 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19967 ?auto_19968 )
      ( !STACK ?auto_19967 ?auto_19966 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19976 - BLOCK
      ?auto_19977 - BLOCK
      ?auto_19978 - BLOCK
      ?auto_19979 - BLOCK
      ?auto_19980 - BLOCK
      ?auto_19981 - BLOCK
      ?auto_19982 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19981 ) ( ON-TABLE ?auto_19982 ) ( CLEAR ?auto_19982 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19976 ) ( ON ?auto_19977 ?auto_19976 ) ( ON ?auto_19978 ?auto_19977 ) ( ON ?auto_19979 ?auto_19978 ) ( ON ?auto_19980 ?auto_19979 ) ( ON ?auto_19981 ?auto_19980 ) ( not ( = ?auto_19976 ?auto_19977 ) ) ( not ( = ?auto_19976 ?auto_19978 ) ) ( not ( = ?auto_19976 ?auto_19979 ) ) ( not ( = ?auto_19976 ?auto_19980 ) ) ( not ( = ?auto_19976 ?auto_19981 ) ) ( not ( = ?auto_19976 ?auto_19982 ) ) ( not ( = ?auto_19977 ?auto_19978 ) ) ( not ( = ?auto_19977 ?auto_19979 ) ) ( not ( = ?auto_19977 ?auto_19980 ) ) ( not ( = ?auto_19977 ?auto_19981 ) ) ( not ( = ?auto_19977 ?auto_19982 ) ) ( not ( = ?auto_19978 ?auto_19979 ) ) ( not ( = ?auto_19978 ?auto_19980 ) ) ( not ( = ?auto_19978 ?auto_19981 ) ) ( not ( = ?auto_19978 ?auto_19982 ) ) ( not ( = ?auto_19979 ?auto_19980 ) ) ( not ( = ?auto_19979 ?auto_19981 ) ) ( not ( = ?auto_19979 ?auto_19982 ) ) ( not ( = ?auto_19980 ?auto_19981 ) ) ( not ( = ?auto_19980 ?auto_19982 ) ) ( not ( = ?auto_19981 ?auto_19982 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_19982 )
      ( !STACK ?auto_19982 ?auto_19981 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19990 - BLOCK
      ?auto_19991 - BLOCK
      ?auto_19992 - BLOCK
      ?auto_19993 - BLOCK
      ?auto_19994 - BLOCK
      ?auto_19995 - BLOCK
      ?auto_19996 - BLOCK
    )
    :vars
    (
      ?auto_19997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19996 ?auto_19997 ) ( ON-TABLE ?auto_19990 ) ( ON ?auto_19991 ?auto_19990 ) ( ON ?auto_19992 ?auto_19991 ) ( ON ?auto_19993 ?auto_19992 ) ( ON ?auto_19994 ?auto_19993 ) ( not ( = ?auto_19990 ?auto_19991 ) ) ( not ( = ?auto_19990 ?auto_19992 ) ) ( not ( = ?auto_19990 ?auto_19993 ) ) ( not ( = ?auto_19990 ?auto_19994 ) ) ( not ( = ?auto_19990 ?auto_19995 ) ) ( not ( = ?auto_19990 ?auto_19996 ) ) ( not ( = ?auto_19990 ?auto_19997 ) ) ( not ( = ?auto_19991 ?auto_19992 ) ) ( not ( = ?auto_19991 ?auto_19993 ) ) ( not ( = ?auto_19991 ?auto_19994 ) ) ( not ( = ?auto_19991 ?auto_19995 ) ) ( not ( = ?auto_19991 ?auto_19996 ) ) ( not ( = ?auto_19991 ?auto_19997 ) ) ( not ( = ?auto_19992 ?auto_19993 ) ) ( not ( = ?auto_19992 ?auto_19994 ) ) ( not ( = ?auto_19992 ?auto_19995 ) ) ( not ( = ?auto_19992 ?auto_19996 ) ) ( not ( = ?auto_19992 ?auto_19997 ) ) ( not ( = ?auto_19993 ?auto_19994 ) ) ( not ( = ?auto_19993 ?auto_19995 ) ) ( not ( = ?auto_19993 ?auto_19996 ) ) ( not ( = ?auto_19993 ?auto_19997 ) ) ( not ( = ?auto_19994 ?auto_19995 ) ) ( not ( = ?auto_19994 ?auto_19996 ) ) ( not ( = ?auto_19994 ?auto_19997 ) ) ( not ( = ?auto_19995 ?auto_19996 ) ) ( not ( = ?auto_19995 ?auto_19997 ) ) ( not ( = ?auto_19996 ?auto_19997 ) ) ( CLEAR ?auto_19994 ) ( ON ?auto_19995 ?auto_19996 ) ( CLEAR ?auto_19995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_19990 ?auto_19991 ?auto_19992 ?auto_19993 ?auto_19994 ?auto_19995 )
      ( MAKE-7PILE ?auto_19990 ?auto_19991 ?auto_19992 ?auto_19993 ?auto_19994 ?auto_19995 ?auto_19996 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20005 - BLOCK
      ?auto_20006 - BLOCK
      ?auto_20007 - BLOCK
      ?auto_20008 - BLOCK
      ?auto_20009 - BLOCK
      ?auto_20010 - BLOCK
      ?auto_20011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20011 ) ( ON-TABLE ?auto_20005 ) ( ON ?auto_20006 ?auto_20005 ) ( ON ?auto_20007 ?auto_20006 ) ( ON ?auto_20008 ?auto_20007 ) ( ON ?auto_20009 ?auto_20008 ) ( not ( = ?auto_20005 ?auto_20006 ) ) ( not ( = ?auto_20005 ?auto_20007 ) ) ( not ( = ?auto_20005 ?auto_20008 ) ) ( not ( = ?auto_20005 ?auto_20009 ) ) ( not ( = ?auto_20005 ?auto_20010 ) ) ( not ( = ?auto_20005 ?auto_20011 ) ) ( not ( = ?auto_20006 ?auto_20007 ) ) ( not ( = ?auto_20006 ?auto_20008 ) ) ( not ( = ?auto_20006 ?auto_20009 ) ) ( not ( = ?auto_20006 ?auto_20010 ) ) ( not ( = ?auto_20006 ?auto_20011 ) ) ( not ( = ?auto_20007 ?auto_20008 ) ) ( not ( = ?auto_20007 ?auto_20009 ) ) ( not ( = ?auto_20007 ?auto_20010 ) ) ( not ( = ?auto_20007 ?auto_20011 ) ) ( not ( = ?auto_20008 ?auto_20009 ) ) ( not ( = ?auto_20008 ?auto_20010 ) ) ( not ( = ?auto_20008 ?auto_20011 ) ) ( not ( = ?auto_20009 ?auto_20010 ) ) ( not ( = ?auto_20009 ?auto_20011 ) ) ( not ( = ?auto_20010 ?auto_20011 ) ) ( CLEAR ?auto_20009 ) ( ON ?auto_20010 ?auto_20011 ) ( CLEAR ?auto_20010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_20005 ?auto_20006 ?auto_20007 ?auto_20008 ?auto_20009 ?auto_20010 )
      ( MAKE-7PILE ?auto_20005 ?auto_20006 ?auto_20007 ?auto_20008 ?auto_20009 ?auto_20010 ?auto_20011 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20019 - BLOCK
      ?auto_20020 - BLOCK
      ?auto_20021 - BLOCK
      ?auto_20022 - BLOCK
      ?auto_20023 - BLOCK
      ?auto_20024 - BLOCK
      ?auto_20025 - BLOCK
    )
    :vars
    (
      ?auto_20026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20025 ?auto_20026 ) ( ON-TABLE ?auto_20019 ) ( ON ?auto_20020 ?auto_20019 ) ( ON ?auto_20021 ?auto_20020 ) ( ON ?auto_20022 ?auto_20021 ) ( not ( = ?auto_20019 ?auto_20020 ) ) ( not ( = ?auto_20019 ?auto_20021 ) ) ( not ( = ?auto_20019 ?auto_20022 ) ) ( not ( = ?auto_20019 ?auto_20023 ) ) ( not ( = ?auto_20019 ?auto_20024 ) ) ( not ( = ?auto_20019 ?auto_20025 ) ) ( not ( = ?auto_20019 ?auto_20026 ) ) ( not ( = ?auto_20020 ?auto_20021 ) ) ( not ( = ?auto_20020 ?auto_20022 ) ) ( not ( = ?auto_20020 ?auto_20023 ) ) ( not ( = ?auto_20020 ?auto_20024 ) ) ( not ( = ?auto_20020 ?auto_20025 ) ) ( not ( = ?auto_20020 ?auto_20026 ) ) ( not ( = ?auto_20021 ?auto_20022 ) ) ( not ( = ?auto_20021 ?auto_20023 ) ) ( not ( = ?auto_20021 ?auto_20024 ) ) ( not ( = ?auto_20021 ?auto_20025 ) ) ( not ( = ?auto_20021 ?auto_20026 ) ) ( not ( = ?auto_20022 ?auto_20023 ) ) ( not ( = ?auto_20022 ?auto_20024 ) ) ( not ( = ?auto_20022 ?auto_20025 ) ) ( not ( = ?auto_20022 ?auto_20026 ) ) ( not ( = ?auto_20023 ?auto_20024 ) ) ( not ( = ?auto_20023 ?auto_20025 ) ) ( not ( = ?auto_20023 ?auto_20026 ) ) ( not ( = ?auto_20024 ?auto_20025 ) ) ( not ( = ?auto_20024 ?auto_20026 ) ) ( not ( = ?auto_20025 ?auto_20026 ) ) ( ON ?auto_20024 ?auto_20025 ) ( CLEAR ?auto_20022 ) ( ON ?auto_20023 ?auto_20024 ) ( CLEAR ?auto_20023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20019 ?auto_20020 ?auto_20021 ?auto_20022 ?auto_20023 )
      ( MAKE-7PILE ?auto_20019 ?auto_20020 ?auto_20021 ?auto_20022 ?auto_20023 ?auto_20024 ?auto_20025 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20034 - BLOCK
      ?auto_20035 - BLOCK
      ?auto_20036 - BLOCK
      ?auto_20037 - BLOCK
      ?auto_20038 - BLOCK
      ?auto_20039 - BLOCK
      ?auto_20040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20040 ) ( ON-TABLE ?auto_20034 ) ( ON ?auto_20035 ?auto_20034 ) ( ON ?auto_20036 ?auto_20035 ) ( ON ?auto_20037 ?auto_20036 ) ( not ( = ?auto_20034 ?auto_20035 ) ) ( not ( = ?auto_20034 ?auto_20036 ) ) ( not ( = ?auto_20034 ?auto_20037 ) ) ( not ( = ?auto_20034 ?auto_20038 ) ) ( not ( = ?auto_20034 ?auto_20039 ) ) ( not ( = ?auto_20034 ?auto_20040 ) ) ( not ( = ?auto_20035 ?auto_20036 ) ) ( not ( = ?auto_20035 ?auto_20037 ) ) ( not ( = ?auto_20035 ?auto_20038 ) ) ( not ( = ?auto_20035 ?auto_20039 ) ) ( not ( = ?auto_20035 ?auto_20040 ) ) ( not ( = ?auto_20036 ?auto_20037 ) ) ( not ( = ?auto_20036 ?auto_20038 ) ) ( not ( = ?auto_20036 ?auto_20039 ) ) ( not ( = ?auto_20036 ?auto_20040 ) ) ( not ( = ?auto_20037 ?auto_20038 ) ) ( not ( = ?auto_20037 ?auto_20039 ) ) ( not ( = ?auto_20037 ?auto_20040 ) ) ( not ( = ?auto_20038 ?auto_20039 ) ) ( not ( = ?auto_20038 ?auto_20040 ) ) ( not ( = ?auto_20039 ?auto_20040 ) ) ( ON ?auto_20039 ?auto_20040 ) ( CLEAR ?auto_20037 ) ( ON ?auto_20038 ?auto_20039 ) ( CLEAR ?auto_20038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20034 ?auto_20035 ?auto_20036 ?auto_20037 ?auto_20038 )
      ( MAKE-7PILE ?auto_20034 ?auto_20035 ?auto_20036 ?auto_20037 ?auto_20038 ?auto_20039 ?auto_20040 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20048 - BLOCK
      ?auto_20049 - BLOCK
      ?auto_20050 - BLOCK
      ?auto_20051 - BLOCK
      ?auto_20052 - BLOCK
      ?auto_20053 - BLOCK
      ?auto_20054 - BLOCK
    )
    :vars
    (
      ?auto_20055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20054 ?auto_20055 ) ( ON-TABLE ?auto_20048 ) ( ON ?auto_20049 ?auto_20048 ) ( ON ?auto_20050 ?auto_20049 ) ( not ( = ?auto_20048 ?auto_20049 ) ) ( not ( = ?auto_20048 ?auto_20050 ) ) ( not ( = ?auto_20048 ?auto_20051 ) ) ( not ( = ?auto_20048 ?auto_20052 ) ) ( not ( = ?auto_20048 ?auto_20053 ) ) ( not ( = ?auto_20048 ?auto_20054 ) ) ( not ( = ?auto_20048 ?auto_20055 ) ) ( not ( = ?auto_20049 ?auto_20050 ) ) ( not ( = ?auto_20049 ?auto_20051 ) ) ( not ( = ?auto_20049 ?auto_20052 ) ) ( not ( = ?auto_20049 ?auto_20053 ) ) ( not ( = ?auto_20049 ?auto_20054 ) ) ( not ( = ?auto_20049 ?auto_20055 ) ) ( not ( = ?auto_20050 ?auto_20051 ) ) ( not ( = ?auto_20050 ?auto_20052 ) ) ( not ( = ?auto_20050 ?auto_20053 ) ) ( not ( = ?auto_20050 ?auto_20054 ) ) ( not ( = ?auto_20050 ?auto_20055 ) ) ( not ( = ?auto_20051 ?auto_20052 ) ) ( not ( = ?auto_20051 ?auto_20053 ) ) ( not ( = ?auto_20051 ?auto_20054 ) ) ( not ( = ?auto_20051 ?auto_20055 ) ) ( not ( = ?auto_20052 ?auto_20053 ) ) ( not ( = ?auto_20052 ?auto_20054 ) ) ( not ( = ?auto_20052 ?auto_20055 ) ) ( not ( = ?auto_20053 ?auto_20054 ) ) ( not ( = ?auto_20053 ?auto_20055 ) ) ( not ( = ?auto_20054 ?auto_20055 ) ) ( ON ?auto_20053 ?auto_20054 ) ( ON ?auto_20052 ?auto_20053 ) ( CLEAR ?auto_20050 ) ( ON ?auto_20051 ?auto_20052 ) ( CLEAR ?auto_20051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20048 ?auto_20049 ?auto_20050 ?auto_20051 )
      ( MAKE-7PILE ?auto_20048 ?auto_20049 ?auto_20050 ?auto_20051 ?auto_20052 ?auto_20053 ?auto_20054 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20063 - BLOCK
      ?auto_20064 - BLOCK
      ?auto_20065 - BLOCK
      ?auto_20066 - BLOCK
      ?auto_20067 - BLOCK
      ?auto_20068 - BLOCK
      ?auto_20069 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20069 ) ( ON-TABLE ?auto_20063 ) ( ON ?auto_20064 ?auto_20063 ) ( ON ?auto_20065 ?auto_20064 ) ( not ( = ?auto_20063 ?auto_20064 ) ) ( not ( = ?auto_20063 ?auto_20065 ) ) ( not ( = ?auto_20063 ?auto_20066 ) ) ( not ( = ?auto_20063 ?auto_20067 ) ) ( not ( = ?auto_20063 ?auto_20068 ) ) ( not ( = ?auto_20063 ?auto_20069 ) ) ( not ( = ?auto_20064 ?auto_20065 ) ) ( not ( = ?auto_20064 ?auto_20066 ) ) ( not ( = ?auto_20064 ?auto_20067 ) ) ( not ( = ?auto_20064 ?auto_20068 ) ) ( not ( = ?auto_20064 ?auto_20069 ) ) ( not ( = ?auto_20065 ?auto_20066 ) ) ( not ( = ?auto_20065 ?auto_20067 ) ) ( not ( = ?auto_20065 ?auto_20068 ) ) ( not ( = ?auto_20065 ?auto_20069 ) ) ( not ( = ?auto_20066 ?auto_20067 ) ) ( not ( = ?auto_20066 ?auto_20068 ) ) ( not ( = ?auto_20066 ?auto_20069 ) ) ( not ( = ?auto_20067 ?auto_20068 ) ) ( not ( = ?auto_20067 ?auto_20069 ) ) ( not ( = ?auto_20068 ?auto_20069 ) ) ( ON ?auto_20068 ?auto_20069 ) ( ON ?auto_20067 ?auto_20068 ) ( CLEAR ?auto_20065 ) ( ON ?auto_20066 ?auto_20067 ) ( CLEAR ?auto_20066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20063 ?auto_20064 ?auto_20065 ?auto_20066 )
      ( MAKE-7PILE ?auto_20063 ?auto_20064 ?auto_20065 ?auto_20066 ?auto_20067 ?auto_20068 ?auto_20069 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20077 - BLOCK
      ?auto_20078 - BLOCK
      ?auto_20079 - BLOCK
      ?auto_20080 - BLOCK
      ?auto_20081 - BLOCK
      ?auto_20082 - BLOCK
      ?auto_20083 - BLOCK
    )
    :vars
    (
      ?auto_20084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20083 ?auto_20084 ) ( ON-TABLE ?auto_20077 ) ( ON ?auto_20078 ?auto_20077 ) ( not ( = ?auto_20077 ?auto_20078 ) ) ( not ( = ?auto_20077 ?auto_20079 ) ) ( not ( = ?auto_20077 ?auto_20080 ) ) ( not ( = ?auto_20077 ?auto_20081 ) ) ( not ( = ?auto_20077 ?auto_20082 ) ) ( not ( = ?auto_20077 ?auto_20083 ) ) ( not ( = ?auto_20077 ?auto_20084 ) ) ( not ( = ?auto_20078 ?auto_20079 ) ) ( not ( = ?auto_20078 ?auto_20080 ) ) ( not ( = ?auto_20078 ?auto_20081 ) ) ( not ( = ?auto_20078 ?auto_20082 ) ) ( not ( = ?auto_20078 ?auto_20083 ) ) ( not ( = ?auto_20078 ?auto_20084 ) ) ( not ( = ?auto_20079 ?auto_20080 ) ) ( not ( = ?auto_20079 ?auto_20081 ) ) ( not ( = ?auto_20079 ?auto_20082 ) ) ( not ( = ?auto_20079 ?auto_20083 ) ) ( not ( = ?auto_20079 ?auto_20084 ) ) ( not ( = ?auto_20080 ?auto_20081 ) ) ( not ( = ?auto_20080 ?auto_20082 ) ) ( not ( = ?auto_20080 ?auto_20083 ) ) ( not ( = ?auto_20080 ?auto_20084 ) ) ( not ( = ?auto_20081 ?auto_20082 ) ) ( not ( = ?auto_20081 ?auto_20083 ) ) ( not ( = ?auto_20081 ?auto_20084 ) ) ( not ( = ?auto_20082 ?auto_20083 ) ) ( not ( = ?auto_20082 ?auto_20084 ) ) ( not ( = ?auto_20083 ?auto_20084 ) ) ( ON ?auto_20082 ?auto_20083 ) ( ON ?auto_20081 ?auto_20082 ) ( ON ?auto_20080 ?auto_20081 ) ( CLEAR ?auto_20078 ) ( ON ?auto_20079 ?auto_20080 ) ( CLEAR ?auto_20079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20077 ?auto_20078 ?auto_20079 )
      ( MAKE-7PILE ?auto_20077 ?auto_20078 ?auto_20079 ?auto_20080 ?auto_20081 ?auto_20082 ?auto_20083 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20092 - BLOCK
      ?auto_20093 - BLOCK
      ?auto_20094 - BLOCK
      ?auto_20095 - BLOCK
      ?auto_20096 - BLOCK
      ?auto_20097 - BLOCK
      ?auto_20098 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20098 ) ( ON-TABLE ?auto_20092 ) ( ON ?auto_20093 ?auto_20092 ) ( not ( = ?auto_20092 ?auto_20093 ) ) ( not ( = ?auto_20092 ?auto_20094 ) ) ( not ( = ?auto_20092 ?auto_20095 ) ) ( not ( = ?auto_20092 ?auto_20096 ) ) ( not ( = ?auto_20092 ?auto_20097 ) ) ( not ( = ?auto_20092 ?auto_20098 ) ) ( not ( = ?auto_20093 ?auto_20094 ) ) ( not ( = ?auto_20093 ?auto_20095 ) ) ( not ( = ?auto_20093 ?auto_20096 ) ) ( not ( = ?auto_20093 ?auto_20097 ) ) ( not ( = ?auto_20093 ?auto_20098 ) ) ( not ( = ?auto_20094 ?auto_20095 ) ) ( not ( = ?auto_20094 ?auto_20096 ) ) ( not ( = ?auto_20094 ?auto_20097 ) ) ( not ( = ?auto_20094 ?auto_20098 ) ) ( not ( = ?auto_20095 ?auto_20096 ) ) ( not ( = ?auto_20095 ?auto_20097 ) ) ( not ( = ?auto_20095 ?auto_20098 ) ) ( not ( = ?auto_20096 ?auto_20097 ) ) ( not ( = ?auto_20096 ?auto_20098 ) ) ( not ( = ?auto_20097 ?auto_20098 ) ) ( ON ?auto_20097 ?auto_20098 ) ( ON ?auto_20096 ?auto_20097 ) ( ON ?auto_20095 ?auto_20096 ) ( CLEAR ?auto_20093 ) ( ON ?auto_20094 ?auto_20095 ) ( CLEAR ?auto_20094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20092 ?auto_20093 ?auto_20094 )
      ( MAKE-7PILE ?auto_20092 ?auto_20093 ?auto_20094 ?auto_20095 ?auto_20096 ?auto_20097 ?auto_20098 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20106 - BLOCK
      ?auto_20107 - BLOCK
      ?auto_20108 - BLOCK
      ?auto_20109 - BLOCK
      ?auto_20110 - BLOCK
      ?auto_20111 - BLOCK
      ?auto_20112 - BLOCK
    )
    :vars
    (
      ?auto_20113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20112 ?auto_20113 ) ( ON-TABLE ?auto_20106 ) ( not ( = ?auto_20106 ?auto_20107 ) ) ( not ( = ?auto_20106 ?auto_20108 ) ) ( not ( = ?auto_20106 ?auto_20109 ) ) ( not ( = ?auto_20106 ?auto_20110 ) ) ( not ( = ?auto_20106 ?auto_20111 ) ) ( not ( = ?auto_20106 ?auto_20112 ) ) ( not ( = ?auto_20106 ?auto_20113 ) ) ( not ( = ?auto_20107 ?auto_20108 ) ) ( not ( = ?auto_20107 ?auto_20109 ) ) ( not ( = ?auto_20107 ?auto_20110 ) ) ( not ( = ?auto_20107 ?auto_20111 ) ) ( not ( = ?auto_20107 ?auto_20112 ) ) ( not ( = ?auto_20107 ?auto_20113 ) ) ( not ( = ?auto_20108 ?auto_20109 ) ) ( not ( = ?auto_20108 ?auto_20110 ) ) ( not ( = ?auto_20108 ?auto_20111 ) ) ( not ( = ?auto_20108 ?auto_20112 ) ) ( not ( = ?auto_20108 ?auto_20113 ) ) ( not ( = ?auto_20109 ?auto_20110 ) ) ( not ( = ?auto_20109 ?auto_20111 ) ) ( not ( = ?auto_20109 ?auto_20112 ) ) ( not ( = ?auto_20109 ?auto_20113 ) ) ( not ( = ?auto_20110 ?auto_20111 ) ) ( not ( = ?auto_20110 ?auto_20112 ) ) ( not ( = ?auto_20110 ?auto_20113 ) ) ( not ( = ?auto_20111 ?auto_20112 ) ) ( not ( = ?auto_20111 ?auto_20113 ) ) ( not ( = ?auto_20112 ?auto_20113 ) ) ( ON ?auto_20111 ?auto_20112 ) ( ON ?auto_20110 ?auto_20111 ) ( ON ?auto_20109 ?auto_20110 ) ( ON ?auto_20108 ?auto_20109 ) ( CLEAR ?auto_20106 ) ( ON ?auto_20107 ?auto_20108 ) ( CLEAR ?auto_20107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20106 ?auto_20107 )
      ( MAKE-7PILE ?auto_20106 ?auto_20107 ?auto_20108 ?auto_20109 ?auto_20110 ?auto_20111 ?auto_20112 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20121 - BLOCK
      ?auto_20122 - BLOCK
      ?auto_20123 - BLOCK
      ?auto_20124 - BLOCK
      ?auto_20125 - BLOCK
      ?auto_20126 - BLOCK
      ?auto_20127 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20127 ) ( ON-TABLE ?auto_20121 ) ( not ( = ?auto_20121 ?auto_20122 ) ) ( not ( = ?auto_20121 ?auto_20123 ) ) ( not ( = ?auto_20121 ?auto_20124 ) ) ( not ( = ?auto_20121 ?auto_20125 ) ) ( not ( = ?auto_20121 ?auto_20126 ) ) ( not ( = ?auto_20121 ?auto_20127 ) ) ( not ( = ?auto_20122 ?auto_20123 ) ) ( not ( = ?auto_20122 ?auto_20124 ) ) ( not ( = ?auto_20122 ?auto_20125 ) ) ( not ( = ?auto_20122 ?auto_20126 ) ) ( not ( = ?auto_20122 ?auto_20127 ) ) ( not ( = ?auto_20123 ?auto_20124 ) ) ( not ( = ?auto_20123 ?auto_20125 ) ) ( not ( = ?auto_20123 ?auto_20126 ) ) ( not ( = ?auto_20123 ?auto_20127 ) ) ( not ( = ?auto_20124 ?auto_20125 ) ) ( not ( = ?auto_20124 ?auto_20126 ) ) ( not ( = ?auto_20124 ?auto_20127 ) ) ( not ( = ?auto_20125 ?auto_20126 ) ) ( not ( = ?auto_20125 ?auto_20127 ) ) ( not ( = ?auto_20126 ?auto_20127 ) ) ( ON ?auto_20126 ?auto_20127 ) ( ON ?auto_20125 ?auto_20126 ) ( ON ?auto_20124 ?auto_20125 ) ( ON ?auto_20123 ?auto_20124 ) ( CLEAR ?auto_20121 ) ( ON ?auto_20122 ?auto_20123 ) ( CLEAR ?auto_20122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20121 ?auto_20122 )
      ( MAKE-7PILE ?auto_20121 ?auto_20122 ?auto_20123 ?auto_20124 ?auto_20125 ?auto_20126 ?auto_20127 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20135 - BLOCK
      ?auto_20136 - BLOCK
      ?auto_20137 - BLOCK
      ?auto_20138 - BLOCK
      ?auto_20139 - BLOCK
      ?auto_20140 - BLOCK
      ?auto_20141 - BLOCK
    )
    :vars
    (
      ?auto_20142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20141 ?auto_20142 ) ( not ( = ?auto_20135 ?auto_20136 ) ) ( not ( = ?auto_20135 ?auto_20137 ) ) ( not ( = ?auto_20135 ?auto_20138 ) ) ( not ( = ?auto_20135 ?auto_20139 ) ) ( not ( = ?auto_20135 ?auto_20140 ) ) ( not ( = ?auto_20135 ?auto_20141 ) ) ( not ( = ?auto_20135 ?auto_20142 ) ) ( not ( = ?auto_20136 ?auto_20137 ) ) ( not ( = ?auto_20136 ?auto_20138 ) ) ( not ( = ?auto_20136 ?auto_20139 ) ) ( not ( = ?auto_20136 ?auto_20140 ) ) ( not ( = ?auto_20136 ?auto_20141 ) ) ( not ( = ?auto_20136 ?auto_20142 ) ) ( not ( = ?auto_20137 ?auto_20138 ) ) ( not ( = ?auto_20137 ?auto_20139 ) ) ( not ( = ?auto_20137 ?auto_20140 ) ) ( not ( = ?auto_20137 ?auto_20141 ) ) ( not ( = ?auto_20137 ?auto_20142 ) ) ( not ( = ?auto_20138 ?auto_20139 ) ) ( not ( = ?auto_20138 ?auto_20140 ) ) ( not ( = ?auto_20138 ?auto_20141 ) ) ( not ( = ?auto_20138 ?auto_20142 ) ) ( not ( = ?auto_20139 ?auto_20140 ) ) ( not ( = ?auto_20139 ?auto_20141 ) ) ( not ( = ?auto_20139 ?auto_20142 ) ) ( not ( = ?auto_20140 ?auto_20141 ) ) ( not ( = ?auto_20140 ?auto_20142 ) ) ( not ( = ?auto_20141 ?auto_20142 ) ) ( ON ?auto_20140 ?auto_20141 ) ( ON ?auto_20139 ?auto_20140 ) ( ON ?auto_20138 ?auto_20139 ) ( ON ?auto_20137 ?auto_20138 ) ( ON ?auto_20136 ?auto_20137 ) ( ON ?auto_20135 ?auto_20136 ) ( CLEAR ?auto_20135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20135 )
      ( MAKE-7PILE ?auto_20135 ?auto_20136 ?auto_20137 ?auto_20138 ?auto_20139 ?auto_20140 ?auto_20141 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20150 - BLOCK
      ?auto_20151 - BLOCK
      ?auto_20152 - BLOCK
      ?auto_20153 - BLOCK
      ?auto_20154 - BLOCK
      ?auto_20155 - BLOCK
      ?auto_20156 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20156 ) ( not ( = ?auto_20150 ?auto_20151 ) ) ( not ( = ?auto_20150 ?auto_20152 ) ) ( not ( = ?auto_20150 ?auto_20153 ) ) ( not ( = ?auto_20150 ?auto_20154 ) ) ( not ( = ?auto_20150 ?auto_20155 ) ) ( not ( = ?auto_20150 ?auto_20156 ) ) ( not ( = ?auto_20151 ?auto_20152 ) ) ( not ( = ?auto_20151 ?auto_20153 ) ) ( not ( = ?auto_20151 ?auto_20154 ) ) ( not ( = ?auto_20151 ?auto_20155 ) ) ( not ( = ?auto_20151 ?auto_20156 ) ) ( not ( = ?auto_20152 ?auto_20153 ) ) ( not ( = ?auto_20152 ?auto_20154 ) ) ( not ( = ?auto_20152 ?auto_20155 ) ) ( not ( = ?auto_20152 ?auto_20156 ) ) ( not ( = ?auto_20153 ?auto_20154 ) ) ( not ( = ?auto_20153 ?auto_20155 ) ) ( not ( = ?auto_20153 ?auto_20156 ) ) ( not ( = ?auto_20154 ?auto_20155 ) ) ( not ( = ?auto_20154 ?auto_20156 ) ) ( not ( = ?auto_20155 ?auto_20156 ) ) ( ON ?auto_20155 ?auto_20156 ) ( ON ?auto_20154 ?auto_20155 ) ( ON ?auto_20153 ?auto_20154 ) ( ON ?auto_20152 ?auto_20153 ) ( ON ?auto_20151 ?auto_20152 ) ( ON ?auto_20150 ?auto_20151 ) ( CLEAR ?auto_20150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20150 )
      ( MAKE-7PILE ?auto_20150 ?auto_20151 ?auto_20152 ?auto_20153 ?auto_20154 ?auto_20155 ?auto_20156 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_20164 - BLOCK
      ?auto_20165 - BLOCK
      ?auto_20166 - BLOCK
      ?auto_20167 - BLOCK
      ?auto_20168 - BLOCK
      ?auto_20169 - BLOCK
      ?auto_20170 - BLOCK
    )
    :vars
    (
      ?auto_20171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20164 ?auto_20165 ) ) ( not ( = ?auto_20164 ?auto_20166 ) ) ( not ( = ?auto_20164 ?auto_20167 ) ) ( not ( = ?auto_20164 ?auto_20168 ) ) ( not ( = ?auto_20164 ?auto_20169 ) ) ( not ( = ?auto_20164 ?auto_20170 ) ) ( not ( = ?auto_20165 ?auto_20166 ) ) ( not ( = ?auto_20165 ?auto_20167 ) ) ( not ( = ?auto_20165 ?auto_20168 ) ) ( not ( = ?auto_20165 ?auto_20169 ) ) ( not ( = ?auto_20165 ?auto_20170 ) ) ( not ( = ?auto_20166 ?auto_20167 ) ) ( not ( = ?auto_20166 ?auto_20168 ) ) ( not ( = ?auto_20166 ?auto_20169 ) ) ( not ( = ?auto_20166 ?auto_20170 ) ) ( not ( = ?auto_20167 ?auto_20168 ) ) ( not ( = ?auto_20167 ?auto_20169 ) ) ( not ( = ?auto_20167 ?auto_20170 ) ) ( not ( = ?auto_20168 ?auto_20169 ) ) ( not ( = ?auto_20168 ?auto_20170 ) ) ( not ( = ?auto_20169 ?auto_20170 ) ) ( ON ?auto_20164 ?auto_20171 ) ( not ( = ?auto_20170 ?auto_20171 ) ) ( not ( = ?auto_20169 ?auto_20171 ) ) ( not ( = ?auto_20168 ?auto_20171 ) ) ( not ( = ?auto_20167 ?auto_20171 ) ) ( not ( = ?auto_20166 ?auto_20171 ) ) ( not ( = ?auto_20165 ?auto_20171 ) ) ( not ( = ?auto_20164 ?auto_20171 ) ) ( ON ?auto_20165 ?auto_20164 ) ( ON ?auto_20166 ?auto_20165 ) ( ON ?auto_20167 ?auto_20166 ) ( ON ?auto_20168 ?auto_20167 ) ( ON ?auto_20169 ?auto_20168 ) ( ON ?auto_20170 ?auto_20169 ) ( CLEAR ?auto_20170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_20170 ?auto_20169 ?auto_20168 ?auto_20167 ?auto_20166 ?auto_20165 ?auto_20164 )
      ( MAKE-7PILE ?auto_20164 ?auto_20165 ?auto_20166 ?auto_20167 ?auto_20168 ?auto_20169 ?auto_20170 ) )
  )

)
