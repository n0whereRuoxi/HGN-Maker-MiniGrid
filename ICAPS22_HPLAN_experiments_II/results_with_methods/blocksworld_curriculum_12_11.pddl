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
      ?auto_180560 - BLOCK
    )
    :vars
    (
      ?auto_180561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180560 ?auto_180561 ) ( CLEAR ?auto_180560 ) ( HAND-EMPTY ) ( not ( = ?auto_180560 ?auto_180561 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180560 ?auto_180561 )
      ( !PUTDOWN ?auto_180560 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_180563 - BLOCK
    )
    :vars
    (
      ?auto_180564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180563 ?auto_180564 ) ( CLEAR ?auto_180563 ) ( HAND-EMPTY ) ( not ( = ?auto_180563 ?auto_180564 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180563 ?auto_180564 )
      ( !PUTDOWN ?auto_180563 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180567 - BLOCK
      ?auto_180568 - BLOCK
    )
    :vars
    (
      ?auto_180569 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180567 ) ( ON ?auto_180568 ?auto_180569 ) ( CLEAR ?auto_180568 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180567 ) ( not ( = ?auto_180567 ?auto_180568 ) ) ( not ( = ?auto_180567 ?auto_180569 ) ) ( not ( = ?auto_180568 ?auto_180569 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180568 ?auto_180569 )
      ( !STACK ?auto_180568 ?auto_180567 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180572 - BLOCK
      ?auto_180573 - BLOCK
    )
    :vars
    (
      ?auto_180574 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180572 ) ( ON ?auto_180573 ?auto_180574 ) ( CLEAR ?auto_180573 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180572 ) ( not ( = ?auto_180572 ?auto_180573 ) ) ( not ( = ?auto_180572 ?auto_180574 ) ) ( not ( = ?auto_180573 ?auto_180574 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180573 ?auto_180574 )
      ( !STACK ?auto_180573 ?auto_180572 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180577 - BLOCK
      ?auto_180578 - BLOCK
    )
    :vars
    (
      ?auto_180579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180578 ?auto_180579 ) ( not ( = ?auto_180577 ?auto_180578 ) ) ( not ( = ?auto_180577 ?auto_180579 ) ) ( not ( = ?auto_180578 ?auto_180579 ) ) ( ON ?auto_180577 ?auto_180578 ) ( CLEAR ?auto_180577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180577 )
      ( MAKE-2PILE ?auto_180577 ?auto_180578 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_180582 - BLOCK
      ?auto_180583 - BLOCK
    )
    :vars
    (
      ?auto_180584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180583 ?auto_180584 ) ( not ( = ?auto_180582 ?auto_180583 ) ) ( not ( = ?auto_180582 ?auto_180584 ) ) ( not ( = ?auto_180583 ?auto_180584 ) ) ( ON ?auto_180582 ?auto_180583 ) ( CLEAR ?auto_180582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180582 )
      ( MAKE-2PILE ?auto_180582 ?auto_180583 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_180588 - BLOCK
      ?auto_180589 - BLOCK
      ?auto_180590 - BLOCK
    )
    :vars
    (
      ?auto_180591 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180589 ) ( ON ?auto_180590 ?auto_180591 ) ( CLEAR ?auto_180590 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180588 ) ( ON ?auto_180589 ?auto_180588 ) ( not ( = ?auto_180588 ?auto_180589 ) ) ( not ( = ?auto_180588 ?auto_180590 ) ) ( not ( = ?auto_180588 ?auto_180591 ) ) ( not ( = ?auto_180589 ?auto_180590 ) ) ( not ( = ?auto_180589 ?auto_180591 ) ) ( not ( = ?auto_180590 ?auto_180591 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180590 ?auto_180591 )
      ( !STACK ?auto_180590 ?auto_180589 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_180595 - BLOCK
      ?auto_180596 - BLOCK
      ?auto_180597 - BLOCK
    )
    :vars
    (
      ?auto_180598 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180596 ) ( ON ?auto_180597 ?auto_180598 ) ( CLEAR ?auto_180597 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180595 ) ( ON ?auto_180596 ?auto_180595 ) ( not ( = ?auto_180595 ?auto_180596 ) ) ( not ( = ?auto_180595 ?auto_180597 ) ) ( not ( = ?auto_180595 ?auto_180598 ) ) ( not ( = ?auto_180596 ?auto_180597 ) ) ( not ( = ?auto_180596 ?auto_180598 ) ) ( not ( = ?auto_180597 ?auto_180598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180597 ?auto_180598 )
      ( !STACK ?auto_180597 ?auto_180596 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_180602 - BLOCK
      ?auto_180603 - BLOCK
      ?auto_180604 - BLOCK
    )
    :vars
    (
      ?auto_180605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180604 ?auto_180605 ) ( ON-TABLE ?auto_180602 ) ( not ( = ?auto_180602 ?auto_180603 ) ) ( not ( = ?auto_180602 ?auto_180604 ) ) ( not ( = ?auto_180602 ?auto_180605 ) ) ( not ( = ?auto_180603 ?auto_180604 ) ) ( not ( = ?auto_180603 ?auto_180605 ) ) ( not ( = ?auto_180604 ?auto_180605 ) ) ( CLEAR ?auto_180602 ) ( ON ?auto_180603 ?auto_180604 ) ( CLEAR ?auto_180603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180602 ?auto_180603 )
      ( MAKE-3PILE ?auto_180602 ?auto_180603 ?auto_180604 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_180609 - BLOCK
      ?auto_180610 - BLOCK
      ?auto_180611 - BLOCK
    )
    :vars
    (
      ?auto_180612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180611 ?auto_180612 ) ( ON-TABLE ?auto_180609 ) ( not ( = ?auto_180609 ?auto_180610 ) ) ( not ( = ?auto_180609 ?auto_180611 ) ) ( not ( = ?auto_180609 ?auto_180612 ) ) ( not ( = ?auto_180610 ?auto_180611 ) ) ( not ( = ?auto_180610 ?auto_180612 ) ) ( not ( = ?auto_180611 ?auto_180612 ) ) ( CLEAR ?auto_180609 ) ( ON ?auto_180610 ?auto_180611 ) ( CLEAR ?auto_180610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180609 ?auto_180610 )
      ( MAKE-3PILE ?auto_180609 ?auto_180610 ?auto_180611 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_180616 - BLOCK
      ?auto_180617 - BLOCK
      ?auto_180618 - BLOCK
    )
    :vars
    (
      ?auto_180619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180618 ?auto_180619 ) ( not ( = ?auto_180616 ?auto_180617 ) ) ( not ( = ?auto_180616 ?auto_180618 ) ) ( not ( = ?auto_180616 ?auto_180619 ) ) ( not ( = ?auto_180617 ?auto_180618 ) ) ( not ( = ?auto_180617 ?auto_180619 ) ) ( not ( = ?auto_180618 ?auto_180619 ) ) ( ON ?auto_180617 ?auto_180618 ) ( ON ?auto_180616 ?auto_180617 ) ( CLEAR ?auto_180616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180616 )
      ( MAKE-3PILE ?auto_180616 ?auto_180617 ?auto_180618 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_180623 - BLOCK
      ?auto_180624 - BLOCK
      ?auto_180625 - BLOCK
    )
    :vars
    (
      ?auto_180626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180625 ?auto_180626 ) ( not ( = ?auto_180623 ?auto_180624 ) ) ( not ( = ?auto_180623 ?auto_180625 ) ) ( not ( = ?auto_180623 ?auto_180626 ) ) ( not ( = ?auto_180624 ?auto_180625 ) ) ( not ( = ?auto_180624 ?auto_180626 ) ) ( not ( = ?auto_180625 ?auto_180626 ) ) ( ON ?auto_180624 ?auto_180625 ) ( ON ?auto_180623 ?auto_180624 ) ( CLEAR ?auto_180623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180623 )
      ( MAKE-3PILE ?auto_180623 ?auto_180624 ?auto_180625 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180631 - BLOCK
      ?auto_180632 - BLOCK
      ?auto_180633 - BLOCK
      ?auto_180634 - BLOCK
    )
    :vars
    (
      ?auto_180635 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180633 ) ( ON ?auto_180634 ?auto_180635 ) ( CLEAR ?auto_180634 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180631 ) ( ON ?auto_180632 ?auto_180631 ) ( ON ?auto_180633 ?auto_180632 ) ( not ( = ?auto_180631 ?auto_180632 ) ) ( not ( = ?auto_180631 ?auto_180633 ) ) ( not ( = ?auto_180631 ?auto_180634 ) ) ( not ( = ?auto_180631 ?auto_180635 ) ) ( not ( = ?auto_180632 ?auto_180633 ) ) ( not ( = ?auto_180632 ?auto_180634 ) ) ( not ( = ?auto_180632 ?auto_180635 ) ) ( not ( = ?auto_180633 ?auto_180634 ) ) ( not ( = ?auto_180633 ?auto_180635 ) ) ( not ( = ?auto_180634 ?auto_180635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180634 ?auto_180635 )
      ( !STACK ?auto_180634 ?auto_180633 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180640 - BLOCK
      ?auto_180641 - BLOCK
      ?auto_180642 - BLOCK
      ?auto_180643 - BLOCK
    )
    :vars
    (
      ?auto_180644 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180642 ) ( ON ?auto_180643 ?auto_180644 ) ( CLEAR ?auto_180643 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180640 ) ( ON ?auto_180641 ?auto_180640 ) ( ON ?auto_180642 ?auto_180641 ) ( not ( = ?auto_180640 ?auto_180641 ) ) ( not ( = ?auto_180640 ?auto_180642 ) ) ( not ( = ?auto_180640 ?auto_180643 ) ) ( not ( = ?auto_180640 ?auto_180644 ) ) ( not ( = ?auto_180641 ?auto_180642 ) ) ( not ( = ?auto_180641 ?auto_180643 ) ) ( not ( = ?auto_180641 ?auto_180644 ) ) ( not ( = ?auto_180642 ?auto_180643 ) ) ( not ( = ?auto_180642 ?auto_180644 ) ) ( not ( = ?auto_180643 ?auto_180644 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180643 ?auto_180644 )
      ( !STACK ?auto_180643 ?auto_180642 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180649 - BLOCK
      ?auto_180650 - BLOCK
      ?auto_180651 - BLOCK
      ?auto_180652 - BLOCK
    )
    :vars
    (
      ?auto_180653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180652 ?auto_180653 ) ( ON-TABLE ?auto_180649 ) ( ON ?auto_180650 ?auto_180649 ) ( not ( = ?auto_180649 ?auto_180650 ) ) ( not ( = ?auto_180649 ?auto_180651 ) ) ( not ( = ?auto_180649 ?auto_180652 ) ) ( not ( = ?auto_180649 ?auto_180653 ) ) ( not ( = ?auto_180650 ?auto_180651 ) ) ( not ( = ?auto_180650 ?auto_180652 ) ) ( not ( = ?auto_180650 ?auto_180653 ) ) ( not ( = ?auto_180651 ?auto_180652 ) ) ( not ( = ?auto_180651 ?auto_180653 ) ) ( not ( = ?auto_180652 ?auto_180653 ) ) ( CLEAR ?auto_180650 ) ( ON ?auto_180651 ?auto_180652 ) ( CLEAR ?auto_180651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180649 ?auto_180650 ?auto_180651 )
      ( MAKE-4PILE ?auto_180649 ?auto_180650 ?auto_180651 ?auto_180652 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180658 - BLOCK
      ?auto_180659 - BLOCK
      ?auto_180660 - BLOCK
      ?auto_180661 - BLOCK
    )
    :vars
    (
      ?auto_180662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180661 ?auto_180662 ) ( ON-TABLE ?auto_180658 ) ( ON ?auto_180659 ?auto_180658 ) ( not ( = ?auto_180658 ?auto_180659 ) ) ( not ( = ?auto_180658 ?auto_180660 ) ) ( not ( = ?auto_180658 ?auto_180661 ) ) ( not ( = ?auto_180658 ?auto_180662 ) ) ( not ( = ?auto_180659 ?auto_180660 ) ) ( not ( = ?auto_180659 ?auto_180661 ) ) ( not ( = ?auto_180659 ?auto_180662 ) ) ( not ( = ?auto_180660 ?auto_180661 ) ) ( not ( = ?auto_180660 ?auto_180662 ) ) ( not ( = ?auto_180661 ?auto_180662 ) ) ( CLEAR ?auto_180659 ) ( ON ?auto_180660 ?auto_180661 ) ( CLEAR ?auto_180660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180658 ?auto_180659 ?auto_180660 )
      ( MAKE-4PILE ?auto_180658 ?auto_180659 ?auto_180660 ?auto_180661 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180667 - BLOCK
      ?auto_180668 - BLOCK
      ?auto_180669 - BLOCK
      ?auto_180670 - BLOCK
    )
    :vars
    (
      ?auto_180671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180670 ?auto_180671 ) ( ON-TABLE ?auto_180667 ) ( not ( = ?auto_180667 ?auto_180668 ) ) ( not ( = ?auto_180667 ?auto_180669 ) ) ( not ( = ?auto_180667 ?auto_180670 ) ) ( not ( = ?auto_180667 ?auto_180671 ) ) ( not ( = ?auto_180668 ?auto_180669 ) ) ( not ( = ?auto_180668 ?auto_180670 ) ) ( not ( = ?auto_180668 ?auto_180671 ) ) ( not ( = ?auto_180669 ?auto_180670 ) ) ( not ( = ?auto_180669 ?auto_180671 ) ) ( not ( = ?auto_180670 ?auto_180671 ) ) ( ON ?auto_180669 ?auto_180670 ) ( CLEAR ?auto_180667 ) ( ON ?auto_180668 ?auto_180669 ) ( CLEAR ?auto_180668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180667 ?auto_180668 )
      ( MAKE-4PILE ?auto_180667 ?auto_180668 ?auto_180669 ?auto_180670 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180676 - BLOCK
      ?auto_180677 - BLOCK
      ?auto_180678 - BLOCK
      ?auto_180679 - BLOCK
    )
    :vars
    (
      ?auto_180680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180679 ?auto_180680 ) ( ON-TABLE ?auto_180676 ) ( not ( = ?auto_180676 ?auto_180677 ) ) ( not ( = ?auto_180676 ?auto_180678 ) ) ( not ( = ?auto_180676 ?auto_180679 ) ) ( not ( = ?auto_180676 ?auto_180680 ) ) ( not ( = ?auto_180677 ?auto_180678 ) ) ( not ( = ?auto_180677 ?auto_180679 ) ) ( not ( = ?auto_180677 ?auto_180680 ) ) ( not ( = ?auto_180678 ?auto_180679 ) ) ( not ( = ?auto_180678 ?auto_180680 ) ) ( not ( = ?auto_180679 ?auto_180680 ) ) ( ON ?auto_180678 ?auto_180679 ) ( CLEAR ?auto_180676 ) ( ON ?auto_180677 ?auto_180678 ) ( CLEAR ?auto_180677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180676 ?auto_180677 )
      ( MAKE-4PILE ?auto_180676 ?auto_180677 ?auto_180678 ?auto_180679 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180685 - BLOCK
      ?auto_180686 - BLOCK
      ?auto_180687 - BLOCK
      ?auto_180688 - BLOCK
    )
    :vars
    (
      ?auto_180689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180688 ?auto_180689 ) ( not ( = ?auto_180685 ?auto_180686 ) ) ( not ( = ?auto_180685 ?auto_180687 ) ) ( not ( = ?auto_180685 ?auto_180688 ) ) ( not ( = ?auto_180685 ?auto_180689 ) ) ( not ( = ?auto_180686 ?auto_180687 ) ) ( not ( = ?auto_180686 ?auto_180688 ) ) ( not ( = ?auto_180686 ?auto_180689 ) ) ( not ( = ?auto_180687 ?auto_180688 ) ) ( not ( = ?auto_180687 ?auto_180689 ) ) ( not ( = ?auto_180688 ?auto_180689 ) ) ( ON ?auto_180687 ?auto_180688 ) ( ON ?auto_180686 ?auto_180687 ) ( ON ?auto_180685 ?auto_180686 ) ( CLEAR ?auto_180685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180685 )
      ( MAKE-4PILE ?auto_180685 ?auto_180686 ?auto_180687 ?auto_180688 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_180694 - BLOCK
      ?auto_180695 - BLOCK
      ?auto_180696 - BLOCK
      ?auto_180697 - BLOCK
    )
    :vars
    (
      ?auto_180698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180697 ?auto_180698 ) ( not ( = ?auto_180694 ?auto_180695 ) ) ( not ( = ?auto_180694 ?auto_180696 ) ) ( not ( = ?auto_180694 ?auto_180697 ) ) ( not ( = ?auto_180694 ?auto_180698 ) ) ( not ( = ?auto_180695 ?auto_180696 ) ) ( not ( = ?auto_180695 ?auto_180697 ) ) ( not ( = ?auto_180695 ?auto_180698 ) ) ( not ( = ?auto_180696 ?auto_180697 ) ) ( not ( = ?auto_180696 ?auto_180698 ) ) ( not ( = ?auto_180697 ?auto_180698 ) ) ( ON ?auto_180696 ?auto_180697 ) ( ON ?auto_180695 ?auto_180696 ) ( ON ?auto_180694 ?auto_180695 ) ( CLEAR ?auto_180694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180694 )
      ( MAKE-4PILE ?auto_180694 ?auto_180695 ?auto_180696 ?auto_180697 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_180704 - BLOCK
      ?auto_180705 - BLOCK
      ?auto_180706 - BLOCK
      ?auto_180707 - BLOCK
      ?auto_180708 - BLOCK
    )
    :vars
    (
      ?auto_180709 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180707 ) ( ON ?auto_180708 ?auto_180709 ) ( CLEAR ?auto_180708 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180704 ) ( ON ?auto_180705 ?auto_180704 ) ( ON ?auto_180706 ?auto_180705 ) ( ON ?auto_180707 ?auto_180706 ) ( not ( = ?auto_180704 ?auto_180705 ) ) ( not ( = ?auto_180704 ?auto_180706 ) ) ( not ( = ?auto_180704 ?auto_180707 ) ) ( not ( = ?auto_180704 ?auto_180708 ) ) ( not ( = ?auto_180704 ?auto_180709 ) ) ( not ( = ?auto_180705 ?auto_180706 ) ) ( not ( = ?auto_180705 ?auto_180707 ) ) ( not ( = ?auto_180705 ?auto_180708 ) ) ( not ( = ?auto_180705 ?auto_180709 ) ) ( not ( = ?auto_180706 ?auto_180707 ) ) ( not ( = ?auto_180706 ?auto_180708 ) ) ( not ( = ?auto_180706 ?auto_180709 ) ) ( not ( = ?auto_180707 ?auto_180708 ) ) ( not ( = ?auto_180707 ?auto_180709 ) ) ( not ( = ?auto_180708 ?auto_180709 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180708 ?auto_180709 )
      ( !STACK ?auto_180708 ?auto_180707 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_180715 - BLOCK
      ?auto_180716 - BLOCK
      ?auto_180717 - BLOCK
      ?auto_180718 - BLOCK
      ?auto_180719 - BLOCK
    )
    :vars
    (
      ?auto_180720 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180718 ) ( ON ?auto_180719 ?auto_180720 ) ( CLEAR ?auto_180719 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180715 ) ( ON ?auto_180716 ?auto_180715 ) ( ON ?auto_180717 ?auto_180716 ) ( ON ?auto_180718 ?auto_180717 ) ( not ( = ?auto_180715 ?auto_180716 ) ) ( not ( = ?auto_180715 ?auto_180717 ) ) ( not ( = ?auto_180715 ?auto_180718 ) ) ( not ( = ?auto_180715 ?auto_180719 ) ) ( not ( = ?auto_180715 ?auto_180720 ) ) ( not ( = ?auto_180716 ?auto_180717 ) ) ( not ( = ?auto_180716 ?auto_180718 ) ) ( not ( = ?auto_180716 ?auto_180719 ) ) ( not ( = ?auto_180716 ?auto_180720 ) ) ( not ( = ?auto_180717 ?auto_180718 ) ) ( not ( = ?auto_180717 ?auto_180719 ) ) ( not ( = ?auto_180717 ?auto_180720 ) ) ( not ( = ?auto_180718 ?auto_180719 ) ) ( not ( = ?auto_180718 ?auto_180720 ) ) ( not ( = ?auto_180719 ?auto_180720 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180719 ?auto_180720 )
      ( !STACK ?auto_180719 ?auto_180718 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_180726 - BLOCK
      ?auto_180727 - BLOCK
      ?auto_180728 - BLOCK
      ?auto_180729 - BLOCK
      ?auto_180730 - BLOCK
    )
    :vars
    (
      ?auto_180731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180730 ?auto_180731 ) ( ON-TABLE ?auto_180726 ) ( ON ?auto_180727 ?auto_180726 ) ( ON ?auto_180728 ?auto_180727 ) ( not ( = ?auto_180726 ?auto_180727 ) ) ( not ( = ?auto_180726 ?auto_180728 ) ) ( not ( = ?auto_180726 ?auto_180729 ) ) ( not ( = ?auto_180726 ?auto_180730 ) ) ( not ( = ?auto_180726 ?auto_180731 ) ) ( not ( = ?auto_180727 ?auto_180728 ) ) ( not ( = ?auto_180727 ?auto_180729 ) ) ( not ( = ?auto_180727 ?auto_180730 ) ) ( not ( = ?auto_180727 ?auto_180731 ) ) ( not ( = ?auto_180728 ?auto_180729 ) ) ( not ( = ?auto_180728 ?auto_180730 ) ) ( not ( = ?auto_180728 ?auto_180731 ) ) ( not ( = ?auto_180729 ?auto_180730 ) ) ( not ( = ?auto_180729 ?auto_180731 ) ) ( not ( = ?auto_180730 ?auto_180731 ) ) ( CLEAR ?auto_180728 ) ( ON ?auto_180729 ?auto_180730 ) ( CLEAR ?auto_180729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180726 ?auto_180727 ?auto_180728 ?auto_180729 )
      ( MAKE-5PILE ?auto_180726 ?auto_180727 ?auto_180728 ?auto_180729 ?auto_180730 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_180737 - BLOCK
      ?auto_180738 - BLOCK
      ?auto_180739 - BLOCK
      ?auto_180740 - BLOCK
      ?auto_180741 - BLOCK
    )
    :vars
    (
      ?auto_180742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180741 ?auto_180742 ) ( ON-TABLE ?auto_180737 ) ( ON ?auto_180738 ?auto_180737 ) ( ON ?auto_180739 ?auto_180738 ) ( not ( = ?auto_180737 ?auto_180738 ) ) ( not ( = ?auto_180737 ?auto_180739 ) ) ( not ( = ?auto_180737 ?auto_180740 ) ) ( not ( = ?auto_180737 ?auto_180741 ) ) ( not ( = ?auto_180737 ?auto_180742 ) ) ( not ( = ?auto_180738 ?auto_180739 ) ) ( not ( = ?auto_180738 ?auto_180740 ) ) ( not ( = ?auto_180738 ?auto_180741 ) ) ( not ( = ?auto_180738 ?auto_180742 ) ) ( not ( = ?auto_180739 ?auto_180740 ) ) ( not ( = ?auto_180739 ?auto_180741 ) ) ( not ( = ?auto_180739 ?auto_180742 ) ) ( not ( = ?auto_180740 ?auto_180741 ) ) ( not ( = ?auto_180740 ?auto_180742 ) ) ( not ( = ?auto_180741 ?auto_180742 ) ) ( CLEAR ?auto_180739 ) ( ON ?auto_180740 ?auto_180741 ) ( CLEAR ?auto_180740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180737 ?auto_180738 ?auto_180739 ?auto_180740 )
      ( MAKE-5PILE ?auto_180737 ?auto_180738 ?auto_180739 ?auto_180740 ?auto_180741 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_180748 - BLOCK
      ?auto_180749 - BLOCK
      ?auto_180750 - BLOCK
      ?auto_180751 - BLOCK
      ?auto_180752 - BLOCK
    )
    :vars
    (
      ?auto_180753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180752 ?auto_180753 ) ( ON-TABLE ?auto_180748 ) ( ON ?auto_180749 ?auto_180748 ) ( not ( = ?auto_180748 ?auto_180749 ) ) ( not ( = ?auto_180748 ?auto_180750 ) ) ( not ( = ?auto_180748 ?auto_180751 ) ) ( not ( = ?auto_180748 ?auto_180752 ) ) ( not ( = ?auto_180748 ?auto_180753 ) ) ( not ( = ?auto_180749 ?auto_180750 ) ) ( not ( = ?auto_180749 ?auto_180751 ) ) ( not ( = ?auto_180749 ?auto_180752 ) ) ( not ( = ?auto_180749 ?auto_180753 ) ) ( not ( = ?auto_180750 ?auto_180751 ) ) ( not ( = ?auto_180750 ?auto_180752 ) ) ( not ( = ?auto_180750 ?auto_180753 ) ) ( not ( = ?auto_180751 ?auto_180752 ) ) ( not ( = ?auto_180751 ?auto_180753 ) ) ( not ( = ?auto_180752 ?auto_180753 ) ) ( ON ?auto_180751 ?auto_180752 ) ( CLEAR ?auto_180749 ) ( ON ?auto_180750 ?auto_180751 ) ( CLEAR ?auto_180750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180748 ?auto_180749 ?auto_180750 )
      ( MAKE-5PILE ?auto_180748 ?auto_180749 ?auto_180750 ?auto_180751 ?auto_180752 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_180759 - BLOCK
      ?auto_180760 - BLOCK
      ?auto_180761 - BLOCK
      ?auto_180762 - BLOCK
      ?auto_180763 - BLOCK
    )
    :vars
    (
      ?auto_180764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180763 ?auto_180764 ) ( ON-TABLE ?auto_180759 ) ( ON ?auto_180760 ?auto_180759 ) ( not ( = ?auto_180759 ?auto_180760 ) ) ( not ( = ?auto_180759 ?auto_180761 ) ) ( not ( = ?auto_180759 ?auto_180762 ) ) ( not ( = ?auto_180759 ?auto_180763 ) ) ( not ( = ?auto_180759 ?auto_180764 ) ) ( not ( = ?auto_180760 ?auto_180761 ) ) ( not ( = ?auto_180760 ?auto_180762 ) ) ( not ( = ?auto_180760 ?auto_180763 ) ) ( not ( = ?auto_180760 ?auto_180764 ) ) ( not ( = ?auto_180761 ?auto_180762 ) ) ( not ( = ?auto_180761 ?auto_180763 ) ) ( not ( = ?auto_180761 ?auto_180764 ) ) ( not ( = ?auto_180762 ?auto_180763 ) ) ( not ( = ?auto_180762 ?auto_180764 ) ) ( not ( = ?auto_180763 ?auto_180764 ) ) ( ON ?auto_180762 ?auto_180763 ) ( CLEAR ?auto_180760 ) ( ON ?auto_180761 ?auto_180762 ) ( CLEAR ?auto_180761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180759 ?auto_180760 ?auto_180761 )
      ( MAKE-5PILE ?auto_180759 ?auto_180760 ?auto_180761 ?auto_180762 ?auto_180763 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_180770 - BLOCK
      ?auto_180771 - BLOCK
      ?auto_180772 - BLOCK
      ?auto_180773 - BLOCK
      ?auto_180774 - BLOCK
    )
    :vars
    (
      ?auto_180775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180774 ?auto_180775 ) ( ON-TABLE ?auto_180770 ) ( not ( = ?auto_180770 ?auto_180771 ) ) ( not ( = ?auto_180770 ?auto_180772 ) ) ( not ( = ?auto_180770 ?auto_180773 ) ) ( not ( = ?auto_180770 ?auto_180774 ) ) ( not ( = ?auto_180770 ?auto_180775 ) ) ( not ( = ?auto_180771 ?auto_180772 ) ) ( not ( = ?auto_180771 ?auto_180773 ) ) ( not ( = ?auto_180771 ?auto_180774 ) ) ( not ( = ?auto_180771 ?auto_180775 ) ) ( not ( = ?auto_180772 ?auto_180773 ) ) ( not ( = ?auto_180772 ?auto_180774 ) ) ( not ( = ?auto_180772 ?auto_180775 ) ) ( not ( = ?auto_180773 ?auto_180774 ) ) ( not ( = ?auto_180773 ?auto_180775 ) ) ( not ( = ?auto_180774 ?auto_180775 ) ) ( ON ?auto_180773 ?auto_180774 ) ( ON ?auto_180772 ?auto_180773 ) ( CLEAR ?auto_180770 ) ( ON ?auto_180771 ?auto_180772 ) ( CLEAR ?auto_180771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180770 ?auto_180771 )
      ( MAKE-5PILE ?auto_180770 ?auto_180771 ?auto_180772 ?auto_180773 ?auto_180774 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_180781 - BLOCK
      ?auto_180782 - BLOCK
      ?auto_180783 - BLOCK
      ?auto_180784 - BLOCK
      ?auto_180785 - BLOCK
    )
    :vars
    (
      ?auto_180786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180785 ?auto_180786 ) ( ON-TABLE ?auto_180781 ) ( not ( = ?auto_180781 ?auto_180782 ) ) ( not ( = ?auto_180781 ?auto_180783 ) ) ( not ( = ?auto_180781 ?auto_180784 ) ) ( not ( = ?auto_180781 ?auto_180785 ) ) ( not ( = ?auto_180781 ?auto_180786 ) ) ( not ( = ?auto_180782 ?auto_180783 ) ) ( not ( = ?auto_180782 ?auto_180784 ) ) ( not ( = ?auto_180782 ?auto_180785 ) ) ( not ( = ?auto_180782 ?auto_180786 ) ) ( not ( = ?auto_180783 ?auto_180784 ) ) ( not ( = ?auto_180783 ?auto_180785 ) ) ( not ( = ?auto_180783 ?auto_180786 ) ) ( not ( = ?auto_180784 ?auto_180785 ) ) ( not ( = ?auto_180784 ?auto_180786 ) ) ( not ( = ?auto_180785 ?auto_180786 ) ) ( ON ?auto_180784 ?auto_180785 ) ( ON ?auto_180783 ?auto_180784 ) ( CLEAR ?auto_180781 ) ( ON ?auto_180782 ?auto_180783 ) ( CLEAR ?auto_180782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180781 ?auto_180782 )
      ( MAKE-5PILE ?auto_180781 ?auto_180782 ?auto_180783 ?auto_180784 ?auto_180785 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_180792 - BLOCK
      ?auto_180793 - BLOCK
      ?auto_180794 - BLOCK
      ?auto_180795 - BLOCK
      ?auto_180796 - BLOCK
    )
    :vars
    (
      ?auto_180797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180796 ?auto_180797 ) ( not ( = ?auto_180792 ?auto_180793 ) ) ( not ( = ?auto_180792 ?auto_180794 ) ) ( not ( = ?auto_180792 ?auto_180795 ) ) ( not ( = ?auto_180792 ?auto_180796 ) ) ( not ( = ?auto_180792 ?auto_180797 ) ) ( not ( = ?auto_180793 ?auto_180794 ) ) ( not ( = ?auto_180793 ?auto_180795 ) ) ( not ( = ?auto_180793 ?auto_180796 ) ) ( not ( = ?auto_180793 ?auto_180797 ) ) ( not ( = ?auto_180794 ?auto_180795 ) ) ( not ( = ?auto_180794 ?auto_180796 ) ) ( not ( = ?auto_180794 ?auto_180797 ) ) ( not ( = ?auto_180795 ?auto_180796 ) ) ( not ( = ?auto_180795 ?auto_180797 ) ) ( not ( = ?auto_180796 ?auto_180797 ) ) ( ON ?auto_180795 ?auto_180796 ) ( ON ?auto_180794 ?auto_180795 ) ( ON ?auto_180793 ?auto_180794 ) ( ON ?auto_180792 ?auto_180793 ) ( CLEAR ?auto_180792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180792 )
      ( MAKE-5PILE ?auto_180792 ?auto_180793 ?auto_180794 ?auto_180795 ?auto_180796 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_180803 - BLOCK
      ?auto_180804 - BLOCK
      ?auto_180805 - BLOCK
      ?auto_180806 - BLOCK
      ?auto_180807 - BLOCK
    )
    :vars
    (
      ?auto_180808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180807 ?auto_180808 ) ( not ( = ?auto_180803 ?auto_180804 ) ) ( not ( = ?auto_180803 ?auto_180805 ) ) ( not ( = ?auto_180803 ?auto_180806 ) ) ( not ( = ?auto_180803 ?auto_180807 ) ) ( not ( = ?auto_180803 ?auto_180808 ) ) ( not ( = ?auto_180804 ?auto_180805 ) ) ( not ( = ?auto_180804 ?auto_180806 ) ) ( not ( = ?auto_180804 ?auto_180807 ) ) ( not ( = ?auto_180804 ?auto_180808 ) ) ( not ( = ?auto_180805 ?auto_180806 ) ) ( not ( = ?auto_180805 ?auto_180807 ) ) ( not ( = ?auto_180805 ?auto_180808 ) ) ( not ( = ?auto_180806 ?auto_180807 ) ) ( not ( = ?auto_180806 ?auto_180808 ) ) ( not ( = ?auto_180807 ?auto_180808 ) ) ( ON ?auto_180806 ?auto_180807 ) ( ON ?auto_180805 ?auto_180806 ) ( ON ?auto_180804 ?auto_180805 ) ( ON ?auto_180803 ?auto_180804 ) ( CLEAR ?auto_180803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180803 )
      ( MAKE-5PILE ?auto_180803 ?auto_180804 ?auto_180805 ?auto_180806 ?auto_180807 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180815 - BLOCK
      ?auto_180816 - BLOCK
      ?auto_180817 - BLOCK
      ?auto_180818 - BLOCK
      ?auto_180819 - BLOCK
      ?auto_180820 - BLOCK
    )
    :vars
    (
      ?auto_180821 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180819 ) ( ON ?auto_180820 ?auto_180821 ) ( CLEAR ?auto_180820 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180815 ) ( ON ?auto_180816 ?auto_180815 ) ( ON ?auto_180817 ?auto_180816 ) ( ON ?auto_180818 ?auto_180817 ) ( ON ?auto_180819 ?auto_180818 ) ( not ( = ?auto_180815 ?auto_180816 ) ) ( not ( = ?auto_180815 ?auto_180817 ) ) ( not ( = ?auto_180815 ?auto_180818 ) ) ( not ( = ?auto_180815 ?auto_180819 ) ) ( not ( = ?auto_180815 ?auto_180820 ) ) ( not ( = ?auto_180815 ?auto_180821 ) ) ( not ( = ?auto_180816 ?auto_180817 ) ) ( not ( = ?auto_180816 ?auto_180818 ) ) ( not ( = ?auto_180816 ?auto_180819 ) ) ( not ( = ?auto_180816 ?auto_180820 ) ) ( not ( = ?auto_180816 ?auto_180821 ) ) ( not ( = ?auto_180817 ?auto_180818 ) ) ( not ( = ?auto_180817 ?auto_180819 ) ) ( not ( = ?auto_180817 ?auto_180820 ) ) ( not ( = ?auto_180817 ?auto_180821 ) ) ( not ( = ?auto_180818 ?auto_180819 ) ) ( not ( = ?auto_180818 ?auto_180820 ) ) ( not ( = ?auto_180818 ?auto_180821 ) ) ( not ( = ?auto_180819 ?auto_180820 ) ) ( not ( = ?auto_180819 ?auto_180821 ) ) ( not ( = ?auto_180820 ?auto_180821 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180820 ?auto_180821 )
      ( !STACK ?auto_180820 ?auto_180819 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180828 - BLOCK
      ?auto_180829 - BLOCK
      ?auto_180830 - BLOCK
      ?auto_180831 - BLOCK
      ?auto_180832 - BLOCK
      ?auto_180833 - BLOCK
    )
    :vars
    (
      ?auto_180834 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180832 ) ( ON ?auto_180833 ?auto_180834 ) ( CLEAR ?auto_180833 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180828 ) ( ON ?auto_180829 ?auto_180828 ) ( ON ?auto_180830 ?auto_180829 ) ( ON ?auto_180831 ?auto_180830 ) ( ON ?auto_180832 ?auto_180831 ) ( not ( = ?auto_180828 ?auto_180829 ) ) ( not ( = ?auto_180828 ?auto_180830 ) ) ( not ( = ?auto_180828 ?auto_180831 ) ) ( not ( = ?auto_180828 ?auto_180832 ) ) ( not ( = ?auto_180828 ?auto_180833 ) ) ( not ( = ?auto_180828 ?auto_180834 ) ) ( not ( = ?auto_180829 ?auto_180830 ) ) ( not ( = ?auto_180829 ?auto_180831 ) ) ( not ( = ?auto_180829 ?auto_180832 ) ) ( not ( = ?auto_180829 ?auto_180833 ) ) ( not ( = ?auto_180829 ?auto_180834 ) ) ( not ( = ?auto_180830 ?auto_180831 ) ) ( not ( = ?auto_180830 ?auto_180832 ) ) ( not ( = ?auto_180830 ?auto_180833 ) ) ( not ( = ?auto_180830 ?auto_180834 ) ) ( not ( = ?auto_180831 ?auto_180832 ) ) ( not ( = ?auto_180831 ?auto_180833 ) ) ( not ( = ?auto_180831 ?auto_180834 ) ) ( not ( = ?auto_180832 ?auto_180833 ) ) ( not ( = ?auto_180832 ?auto_180834 ) ) ( not ( = ?auto_180833 ?auto_180834 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180833 ?auto_180834 )
      ( !STACK ?auto_180833 ?auto_180832 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180841 - BLOCK
      ?auto_180842 - BLOCK
      ?auto_180843 - BLOCK
      ?auto_180844 - BLOCK
      ?auto_180845 - BLOCK
      ?auto_180846 - BLOCK
    )
    :vars
    (
      ?auto_180847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180846 ?auto_180847 ) ( ON-TABLE ?auto_180841 ) ( ON ?auto_180842 ?auto_180841 ) ( ON ?auto_180843 ?auto_180842 ) ( ON ?auto_180844 ?auto_180843 ) ( not ( = ?auto_180841 ?auto_180842 ) ) ( not ( = ?auto_180841 ?auto_180843 ) ) ( not ( = ?auto_180841 ?auto_180844 ) ) ( not ( = ?auto_180841 ?auto_180845 ) ) ( not ( = ?auto_180841 ?auto_180846 ) ) ( not ( = ?auto_180841 ?auto_180847 ) ) ( not ( = ?auto_180842 ?auto_180843 ) ) ( not ( = ?auto_180842 ?auto_180844 ) ) ( not ( = ?auto_180842 ?auto_180845 ) ) ( not ( = ?auto_180842 ?auto_180846 ) ) ( not ( = ?auto_180842 ?auto_180847 ) ) ( not ( = ?auto_180843 ?auto_180844 ) ) ( not ( = ?auto_180843 ?auto_180845 ) ) ( not ( = ?auto_180843 ?auto_180846 ) ) ( not ( = ?auto_180843 ?auto_180847 ) ) ( not ( = ?auto_180844 ?auto_180845 ) ) ( not ( = ?auto_180844 ?auto_180846 ) ) ( not ( = ?auto_180844 ?auto_180847 ) ) ( not ( = ?auto_180845 ?auto_180846 ) ) ( not ( = ?auto_180845 ?auto_180847 ) ) ( not ( = ?auto_180846 ?auto_180847 ) ) ( CLEAR ?auto_180844 ) ( ON ?auto_180845 ?auto_180846 ) ( CLEAR ?auto_180845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180841 ?auto_180842 ?auto_180843 ?auto_180844 ?auto_180845 )
      ( MAKE-6PILE ?auto_180841 ?auto_180842 ?auto_180843 ?auto_180844 ?auto_180845 ?auto_180846 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180854 - BLOCK
      ?auto_180855 - BLOCK
      ?auto_180856 - BLOCK
      ?auto_180857 - BLOCK
      ?auto_180858 - BLOCK
      ?auto_180859 - BLOCK
    )
    :vars
    (
      ?auto_180860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180859 ?auto_180860 ) ( ON-TABLE ?auto_180854 ) ( ON ?auto_180855 ?auto_180854 ) ( ON ?auto_180856 ?auto_180855 ) ( ON ?auto_180857 ?auto_180856 ) ( not ( = ?auto_180854 ?auto_180855 ) ) ( not ( = ?auto_180854 ?auto_180856 ) ) ( not ( = ?auto_180854 ?auto_180857 ) ) ( not ( = ?auto_180854 ?auto_180858 ) ) ( not ( = ?auto_180854 ?auto_180859 ) ) ( not ( = ?auto_180854 ?auto_180860 ) ) ( not ( = ?auto_180855 ?auto_180856 ) ) ( not ( = ?auto_180855 ?auto_180857 ) ) ( not ( = ?auto_180855 ?auto_180858 ) ) ( not ( = ?auto_180855 ?auto_180859 ) ) ( not ( = ?auto_180855 ?auto_180860 ) ) ( not ( = ?auto_180856 ?auto_180857 ) ) ( not ( = ?auto_180856 ?auto_180858 ) ) ( not ( = ?auto_180856 ?auto_180859 ) ) ( not ( = ?auto_180856 ?auto_180860 ) ) ( not ( = ?auto_180857 ?auto_180858 ) ) ( not ( = ?auto_180857 ?auto_180859 ) ) ( not ( = ?auto_180857 ?auto_180860 ) ) ( not ( = ?auto_180858 ?auto_180859 ) ) ( not ( = ?auto_180858 ?auto_180860 ) ) ( not ( = ?auto_180859 ?auto_180860 ) ) ( CLEAR ?auto_180857 ) ( ON ?auto_180858 ?auto_180859 ) ( CLEAR ?auto_180858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_180854 ?auto_180855 ?auto_180856 ?auto_180857 ?auto_180858 )
      ( MAKE-6PILE ?auto_180854 ?auto_180855 ?auto_180856 ?auto_180857 ?auto_180858 ?auto_180859 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180867 - BLOCK
      ?auto_180868 - BLOCK
      ?auto_180869 - BLOCK
      ?auto_180870 - BLOCK
      ?auto_180871 - BLOCK
      ?auto_180872 - BLOCK
    )
    :vars
    (
      ?auto_180873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180872 ?auto_180873 ) ( ON-TABLE ?auto_180867 ) ( ON ?auto_180868 ?auto_180867 ) ( ON ?auto_180869 ?auto_180868 ) ( not ( = ?auto_180867 ?auto_180868 ) ) ( not ( = ?auto_180867 ?auto_180869 ) ) ( not ( = ?auto_180867 ?auto_180870 ) ) ( not ( = ?auto_180867 ?auto_180871 ) ) ( not ( = ?auto_180867 ?auto_180872 ) ) ( not ( = ?auto_180867 ?auto_180873 ) ) ( not ( = ?auto_180868 ?auto_180869 ) ) ( not ( = ?auto_180868 ?auto_180870 ) ) ( not ( = ?auto_180868 ?auto_180871 ) ) ( not ( = ?auto_180868 ?auto_180872 ) ) ( not ( = ?auto_180868 ?auto_180873 ) ) ( not ( = ?auto_180869 ?auto_180870 ) ) ( not ( = ?auto_180869 ?auto_180871 ) ) ( not ( = ?auto_180869 ?auto_180872 ) ) ( not ( = ?auto_180869 ?auto_180873 ) ) ( not ( = ?auto_180870 ?auto_180871 ) ) ( not ( = ?auto_180870 ?auto_180872 ) ) ( not ( = ?auto_180870 ?auto_180873 ) ) ( not ( = ?auto_180871 ?auto_180872 ) ) ( not ( = ?auto_180871 ?auto_180873 ) ) ( not ( = ?auto_180872 ?auto_180873 ) ) ( ON ?auto_180871 ?auto_180872 ) ( CLEAR ?auto_180869 ) ( ON ?auto_180870 ?auto_180871 ) ( CLEAR ?auto_180870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180867 ?auto_180868 ?auto_180869 ?auto_180870 )
      ( MAKE-6PILE ?auto_180867 ?auto_180868 ?auto_180869 ?auto_180870 ?auto_180871 ?auto_180872 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180880 - BLOCK
      ?auto_180881 - BLOCK
      ?auto_180882 - BLOCK
      ?auto_180883 - BLOCK
      ?auto_180884 - BLOCK
      ?auto_180885 - BLOCK
    )
    :vars
    (
      ?auto_180886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180885 ?auto_180886 ) ( ON-TABLE ?auto_180880 ) ( ON ?auto_180881 ?auto_180880 ) ( ON ?auto_180882 ?auto_180881 ) ( not ( = ?auto_180880 ?auto_180881 ) ) ( not ( = ?auto_180880 ?auto_180882 ) ) ( not ( = ?auto_180880 ?auto_180883 ) ) ( not ( = ?auto_180880 ?auto_180884 ) ) ( not ( = ?auto_180880 ?auto_180885 ) ) ( not ( = ?auto_180880 ?auto_180886 ) ) ( not ( = ?auto_180881 ?auto_180882 ) ) ( not ( = ?auto_180881 ?auto_180883 ) ) ( not ( = ?auto_180881 ?auto_180884 ) ) ( not ( = ?auto_180881 ?auto_180885 ) ) ( not ( = ?auto_180881 ?auto_180886 ) ) ( not ( = ?auto_180882 ?auto_180883 ) ) ( not ( = ?auto_180882 ?auto_180884 ) ) ( not ( = ?auto_180882 ?auto_180885 ) ) ( not ( = ?auto_180882 ?auto_180886 ) ) ( not ( = ?auto_180883 ?auto_180884 ) ) ( not ( = ?auto_180883 ?auto_180885 ) ) ( not ( = ?auto_180883 ?auto_180886 ) ) ( not ( = ?auto_180884 ?auto_180885 ) ) ( not ( = ?auto_180884 ?auto_180886 ) ) ( not ( = ?auto_180885 ?auto_180886 ) ) ( ON ?auto_180884 ?auto_180885 ) ( CLEAR ?auto_180882 ) ( ON ?auto_180883 ?auto_180884 ) ( CLEAR ?auto_180883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_180880 ?auto_180881 ?auto_180882 ?auto_180883 )
      ( MAKE-6PILE ?auto_180880 ?auto_180881 ?auto_180882 ?auto_180883 ?auto_180884 ?auto_180885 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180893 - BLOCK
      ?auto_180894 - BLOCK
      ?auto_180895 - BLOCK
      ?auto_180896 - BLOCK
      ?auto_180897 - BLOCK
      ?auto_180898 - BLOCK
    )
    :vars
    (
      ?auto_180899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180898 ?auto_180899 ) ( ON-TABLE ?auto_180893 ) ( ON ?auto_180894 ?auto_180893 ) ( not ( = ?auto_180893 ?auto_180894 ) ) ( not ( = ?auto_180893 ?auto_180895 ) ) ( not ( = ?auto_180893 ?auto_180896 ) ) ( not ( = ?auto_180893 ?auto_180897 ) ) ( not ( = ?auto_180893 ?auto_180898 ) ) ( not ( = ?auto_180893 ?auto_180899 ) ) ( not ( = ?auto_180894 ?auto_180895 ) ) ( not ( = ?auto_180894 ?auto_180896 ) ) ( not ( = ?auto_180894 ?auto_180897 ) ) ( not ( = ?auto_180894 ?auto_180898 ) ) ( not ( = ?auto_180894 ?auto_180899 ) ) ( not ( = ?auto_180895 ?auto_180896 ) ) ( not ( = ?auto_180895 ?auto_180897 ) ) ( not ( = ?auto_180895 ?auto_180898 ) ) ( not ( = ?auto_180895 ?auto_180899 ) ) ( not ( = ?auto_180896 ?auto_180897 ) ) ( not ( = ?auto_180896 ?auto_180898 ) ) ( not ( = ?auto_180896 ?auto_180899 ) ) ( not ( = ?auto_180897 ?auto_180898 ) ) ( not ( = ?auto_180897 ?auto_180899 ) ) ( not ( = ?auto_180898 ?auto_180899 ) ) ( ON ?auto_180897 ?auto_180898 ) ( ON ?auto_180896 ?auto_180897 ) ( CLEAR ?auto_180894 ) ( ON ?auto_180895 ?auto_180896 ) ( CLEAR ?auto_180895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180893 ?auto_180894 ?auto_180895 )
      ( MAKE-6PILE ?auto_180893 ?auto_180894 ?auto_180895 ?auto_180896 ?auto_180897 ?auto_180898 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180906 - BLOCK
      ?auto_180907 - BLOCK
      ?auto_180908 - BLOCK
      ?auto_180909 - BLOCK
      ?auto_180910 - BLOCK
      ?auto_180911 - BLOCK
    )
    :vars
    (
      ?auto_180912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180911 ?auto_180912 ) ( ON-TABLE ?auto_180906 ) ( ON ?auto_180907 ?auto_180906 ) ( not ( = ?auto_180906 ?auto_180907 ) ) ( not ( = ?auto_180906 ?auto_180908 ) ) ( not ( = ?auto_180906 ?auto_180909 ) ) ( not ( = ?auto_180906 ?auto_180910 ) ) ( not ( = ?auto_180906 ?auto_180911 ) ) ( not ( = ?auto_180906 ?auto_180912 ) ) ( not ( = ?auto_180907 ?auto_180908 ) ) ( not ( = ?auto_180907 ?auto_180909 ) ) ( not ( = ?auto_180907 ?auto_180910 ) ) ( not ( = ?auto_180907 ?auto_180911 ) ) ( not ( = ?auto_180907 ?auto_180912 ) ) ( not ( = ?auto_180908 ?auto_180909 ) ) ( not ( = ?auto_180908 ?auto_180910 ) ) ( not ( = ?auto_180908 ?auto_180911 ) ) ( not ( = ?auto_180908 ?auto_180912 ) ) ( not ( = ?auto_180909 ?auto_180910 ) ) ( not ( = ?auto_180909 ?auto_180911 ) ) ( not ( = ?auto_180909 ?auto_180912 ) ) ( not ( = ?auto_180910 ?auto_180911 ) ) ( not ( = ?auto_180910 ?auto_180912 ) ) ( not ( = ?auto_180911 ?auto_180912 ) ) ( ON ?auto_180910 ?auto_180911 ) ( ON ?auto_180909 ?auto_180910 ) ( CLEAR ?auto_180907 ) ( ON ?auto_180908 ?auto_180909 ) ( CLEAR ?auto_180908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_180906 ?auto_180907 ?auto_180908 )
      ( MAKE-6PILE ?auto_180906 ?auto_180907 ?auto_180908 ?auto_180909 ?auto_180910 ?auto_180911 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180919 - BLOCK
      ?auto_180920 - BLOCK
      ?auto_180921 - BLOCK
      ?auto_180922 - BLOCK
      ?auto_180923 - BLOCK
      ?auto_180924 - BLOCK
    )
    :vars
    (
      ?auto_180925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180924 ?auto_180925 ) ( ON-TABLE ?auto_180919 ) ( not ( = ?auto_180919 ?auto_180920 ) ) ( not ( = ?auto_180919 ?auto_180921 ) ) ( not ( = ?auto_180919 ?auto_180922 ) ) ( not ( = ?auto_180919 ?auto_180923 ) ) ( not ( = ?auto_180919 ?auto_180924 ) ) ( not ( = ?auto_180919 ?auto_180925 ) ) ( not ( = ?auto_180920 ?auto_180921 ) ) ( not ( = ?auto_180920 ?auto_180922 ) ) ( not ( = ?auto_180920 ?auto_180923 ) ) ( not ( = ?auto_180920 ?auto_180924 ) ) ( not ( = ?auto_180920 ?auto_180925 ) ) ( not ( = ?auto_180921 ?auto_180922 ) ) ( not ( = ?auto_180921 ?auto_180923 ) ) ( not ( = ?auto_180921 ?auto_180924 ) ) ( not ( = ?auto_180921 ?auto_180925 ) ) ( not ( = ?auto_180922 ?auto_180923 ) ) ( not ( = ?auto_180922 ?auto_180924 ) ) ( not ( = ?auto_180922 ?auto_180925 ) ) ( not ( = ?auto_180923 ?auto_180924 ) ) ( not ( = ?auto_180923 ?auto_180925 ) ) ( not ( = ?auto_180924 ?auto_180925 ) ) ( ON ?auto_180923 ?auto_180924 ) ( ON ?auto_180922 ?auto_180923 ) ( ON ?auto_180921 ?auto_180922 ) ( CLEAR ?auto_180919 ) ( ON ?auto_180920 ?auto_180921 ) ( CLEAR ?auto_180920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180919 ?auto_180920 )
      ( MAKE-6PILE ?auto_180919 ?auto_180920 ?auto_180921 ?auto_180922 ?auto_180923 ?auto_180924 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180932 - BLOCK
      ?auto_180933 - BLOCK
      ?auto_180934 - BLOCK
      ?auto_180935 - BLOCK
      ?auto_180936 - BLOCK
      ?auto_180937 - BLOCK
    )
    :vars
    (
      ?auto_180938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180937 ?auto_180938 ) ( ON-TABLE ?auto_180932 ) ( not ( = ?auto_180932 ?auto_180933 ) ) ( not ( = ?auto_180932 ?auto_180934 ) ) ( not ( = ?auto_180932 ?auto_180935 ) ) ( not ( = ?auto_180932 ?auto_180936 ) ) ( not ( = ?auto_180932 ?auto_180937 ) ) ( not ( = ?auto_180932 ?auto_180938 ) ) ( not ( = ?auto_180933 ?auto_180934 ) ) ( not ( = ?auto_180933 ?auto_180935 ) ) ( not ( = ?auto_180933 ?auto_180936 ) ) ( not ( = ?auto_180933 ?auto_180937 ) ) ( not ( = ?auto_180933 ?auto_180938 ) ) ( not ( = ?auto_180934 ?auto_180935 ) ) ( not ( = ?auto_180934 ?auto_180936 ) ) ( not ( = ?auto_180934 ?auto_180937 ) ) ( not ( = ?auto_180934 ?auto_180938 ) ) ( not ( = ?auto_180935 ?auto_180936 ) ) ( not ( = ?auto_180935 ?auto_180937 ) ) ( not ( = ?auto_180935 ?auto_180938 ) ) ( not ( = ?auto_180936 ?auto_180937 ) ) ( not ( = ?auto_180936 ?auto_180938 ) ) ( not ( = ?auto_180937 ?auto_180938 ) ) ( ON ?auto_180936 ?auto_180937 ) ( ON ?auto_180935 ?auto_180936 ) ( ON ?auto_180934 ?auto_180935 ) ( CLEAR ?auto_180932 ) ( ON ?auto_180933 ?auto_180934 ) ( CLEAR ?auto_180933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_180932 ?auto_180933 )
      ( MAKE-6PILE ?auto_180932 ?auto_180933 ?auto_180934 ?auto_180935 ?auto_180936 ?auto_180937 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180945 - BLOCK
      ?auto_180946 - BLOCK
      ?auto_180947 - BLOCK
      ?auto_180948 - BLOCK
      ?auto_180949 - BLOCK
      ?auto_180950 - BLOCK
    )
    :vars
    (
      ?auto_180951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180950 ?auto_180951 ) ( not ( = ?auto_180945 ?auto_180946 ) ) ( not ( = ?auto_180945 ?auto_180947 ) ) ( not ( = ?auto_180945 ?auto_180948 ) ) ( not ( = ?auto_180945 ?auto_180949 ) ) ( not ( = ?auto_180945 ?auto_180950 ) ) ( not ( = ?auto_180945 ?auto_180951 ) ) ( not ( = ?auto_180946 ?auto_180947 ) ) ( not ( = ?auto_180946 ?auto_180948 ) ) ( not ( = ?auto_180946 ?auto_180949 ) ) ( not ( = ?auto_180946 ?auto_180950 ) ) ( not ( = ?auto_180946 ?auto_180951 ) ) ( not ( = ?auto_180947 ?auto_180948 ) ) ( not ( = ?auto_180947 ?auto_180949 ) ) ( not ( = ?auto_180947 ?auto_180950 ) ) ( not ( = ?auto_180947 ?auto_180951 ) ) ( not ( = ?auto_180948 ?auto_180949 ) ) ( not ( = ?auto_180948 ?auto_180950 ) ) ( not ( = ?auto_180948 ?auto_180951 ) ) ( not ( = ?auto_180949 ?auto_180950 ) ) ( not ( = ?auto_180949 ?auto_180951 ) ) ( not ( = ?auto_180950 ?auto_180951 ) ) ( ON ?auto_180949 ?auto_180950 ) ( ON ?auto_180948 ?auto_180949 ) ( ON ?auto_180947 ?auto_180948 ) ( ON ?auto_180946 ?auto_180947 ) ( ON ?auto_180945 ?auto_180946 ) ( CLEAR ?auto_180945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180945 )
      ( MAKE-6PILE ?auto_180945 ?auto_180946 ?auto_180947 ?auto_180948 ?auto_180949 ?auto_180950 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_180958 - BLOCK
      ?auto_180959 - BLOCK
      ?auto_180960 - BLOCK
      ?auto_180961 - BLOCK
      ?auto_180962 - BLOCK
      ?auto_180963 - BLOCK
    )
    :vars
    (
      ?auto_180964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_180963 ?auto_180964 ) ( not ( = ?auto_180958 ?auto_180959 ) ) ( not ( = ?auto_180958 ?auto_180960 ) ) ( not ( = ?auto_180958 ?auto_180961 ) ) ( not ( = ?auto_180958 ?auto_180962 ) ) ( not ( = ?auto_180958 ?auto_180963 ) ) ( not ( = ?auto_180958 ?auto_180964 ) ) ( not ( = ?auto_180959 ?auto_180960 ) ) ( not ( = ?auto_180959 ?auto_180961 ) ) ( not ( = ?auto_180959 ?auto_180962 ) ) ( not ( = ?auto_180959 ?auto_180963 ) ) ( not ( = ?auto_180959 ?auto_180964 ) ) ( not ( = ?auto_180960 ?auto_180961 ) ) ( not ( = ?auto_180960 ?auto_180962 ) ) ( not ( = ?auto_180960 ?auto_180963 ) ) ( not ( = ?auto_180960 ?auto_180964 ) ) ( not ( = ?auto_180961 ?auto_180962 ) ) ( not ( = ?auto_180961 ?auto_180963 ) ) ( not ( = ?auto_180961 ?auto_180964 ) ) ( not ( = ?auto_180962 ?auto_180963 ) ) ( not ( = ?auto_180962 ?auto_180964 ) ) ( not ( = ?auto_180963 ?auto_180964 ) ) ( ON ?auto_180962 ?auto_180963 ) ( ON ?auto_180961 ?auto_180962 ) ( ON ?auto_180960 ?auto_180961 ) ( ON ?auto_180959 ?auto_180960 ) ( ON ?auto_180958 ?auto_180959 ) ( CLEAR ?auto_180958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_180958 )
      ( MAKE-6PILE ?auto_180958 ?auto_180959 ?auto_180960 ?auto_180961 ?auto_180962 ?auto_180963 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180972 - BLOCK
      ?auto_180973 - BLOCK
      ?auto_180974 - BLOCK
      ?auto_180975 - BLOCK
      ?auto_180976 - BLOCK
      ?auto_180977 - BLOCK
      ?auto_180978 - BLOCK
    )
    :vars
    (
      ?auto_180979 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180977 ) ( ON ?auto_180978 ?auto_180979 ) ( CLEAR ?auto_180978 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180972 ) ( ON ?auto_180973 ?auto_180972 ) ( ON ?auto_180974 ?auto_180973 ) ( ON ?auto_180975 ?auto_180974 ) ( ON ?auto_180976 ?auto_180975 ) ( ON ?auto_180977 ?auto_180976 ) ( not ( = ?auto_180972 ?auto_180973 ) ) ( not ( = ?auto_180972 ?auto_180974 ) ) ( not ( = ?auto_180972 ?auto_180975 ) ) ( not ( = ?auto_180972 ?auto_180976 ) ) ( not ( = ?auto_180972 ?auto_180977 ) ) ( not ( = ?auto_180972 ?auto_180978 ) ) ( not ( = ?auto_180972 ?auto_180979 ) ) ( not ( = ?auto_180973 ?auto_180974 ) ) ( not ( = ?auto_180973 ?auto_180975 ) ) ( not ( = ?auto_180973 ?auto_180976 ) ) ( not ( = ?auto_180973 ?auto_180977 ) ) ( not ( = ?auto_180973 ?auto_180978 ) ) ( not ( = ?auto_180973 ?auto_180979 ) ) ( not ( = ?auto_180974 ?auto_180975 ) ) ( not ( = ?auto_180974 ?auto_180976 ) ) ( not ( = ?auto_180974 ?auto_180977 ) ) ( not ( = ?auto_180974 ?auto_180978 ) ) ( not ( = ?auto_180974 ?auto_180979 ) ) ( not ( = ?auto_180975 ?auto_180976 ) ) ( not ( = ?auto_180975 ?auto_180977 ) ) ( not ( = ?auto_180975 ?auto_180978 ) ) ( not ( = ?auto_180975 ?auto_180979 ) ) ( not ( = ?auto_180976 ?auto_180977 ) ) ( not ( = ?auto_180976 ?auto_180978 ) ) ( not ( = ?auto_180976 ?auto_180979 ) ) ( not ( = ?auto_180977 ?auto_180978 ) ) ( not ( = ?auto_180977 ?auto_180979 ) ) ( not ( = ?auto_180978 ?auto_180979 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180978 ?auto_180979 )
      ( !STACK ?auto_180978 ?auto_180977 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_180987 - BLOCK
      ?auto_180988 - BLOCK
      ?auto_180989 - BLOCK
      ?auto_180990 - BLOCK
      ?auto_180991 - BLOCK
      ?auto_180992 - BLOCK
      ?auto_180993 - BLOCK
    )
    :vars
    (
      ?auto_180994 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_180992 ) ( ON ?auto_180993 ?auto_180994 ) ( CLEAR ?auto_180993 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_180987 ) ( ON ?auto_180988 ?auto_180987 ) ( ON ?auto_180989 ?auto_180988 ) ( ON ?auto_180990 ?auto_180989 ) ( ON ?auto_180991 ?auto_180990 ) ( ON ?auto_180992 ?auto_180991 ) ( not ( = ?auto_180987 ?auto_180988 ) ) ( not ( = ?auto_180987 ?auto_180989 ) ) ( not ( = ?auto_180987 ?auto_180990 ) ) ( not ( = ?auto_180987 ?auto_180991 ) ) ( not ( = ?auto_180987 ?auto_180992 ) ) ( not ( = ?auto_180987 ?auto_180993 ) ) ( not ( = ?auto_180987 ?auto_180994 ) ) ( not ( = ?auto_180988 ?auto_180989 ) ) ( not ( = ?auto_180988 ?auto_180990 ) ) ( not ( = ?auto_180988 ?auto_180991 ) ) ( not ( = ?auto_180988 ?auto_180992 ) ) ( not ( = ?auto_180988 ?auto_180993 ) ) ( not ( = ?auto_180988 ?auto_180994 ) ) ( not ( = ?auto_180989 ?auto_180990 ) ) ( not ( = ?auto_180989 ?auto_180991 ) ) ( not ( = ?auto_180989 ?auto_180992 ) ) ( not ( = ?auto_180989 ?auto_180993 ) ) ( not ( = ?auto_180989 ?auto_180994 ) ) ( not ( = ?auto_180990 ?auto_180991 ) ) ( not ( = ?auto_180990 ?auto_180992 ) ) ( not ( = ?auto_180990 ?auto_180993 ) ) ( not ( = ?auto_180990 ?auto_180994 ) ) ( not ( = ?auto_180991 ?auto_180992 ) ) ( not ( = ?auto_180991 ?auto_180993 ) ) ( not ( = ?auto_180991 ?auto_180994 ) ) ( not ( = ?auto_180992 ?auto_180993 ) ) ( not ( = ?auto_180992 ?auto_180994 ) ) ( not ( = ?auto_180993 ?auto_180994 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_180993 ?auto_180994 )
      ( !STACK ?auto_180993 ?auto_180992 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181002 - BLOCK
      ?auto_181003 - BLOCK
      ?auto_181004 - BLOCK
      ?auto_181005 - BLOCK
      ?auto_181006 - BLOCK
      ?auto_181007 - BLOCK
      ?auto_181008 - BLOCK
    )
    :vars
    (
      ?auto_181009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181008 ?auto_181009 ) ( ON-TABLE ?auto_181002 ) ( ON ?auto_181003 ?auto_181002 ) ( ON ?auto_181004 ?auto_181003 ) ( ON ?auto_181005 ?auto_181004 ) ( ON ?auto_181006 ?auto_181005 ) ( not ( = ?auto_181002 ?auto_181003 ) ) ( not ( = ?auto_181002 ?auto_181004 ) ) ( not ( = ?auto_181002 ?auto_181005 ) ) ( not ( = ?auto_181002 ?auto_181006 ) ) ( not ( = ?auto_181002 ?auto_181007 ) ) ( not ( = ?auto_181002 ?auto_181008 ) ) ( not ( = ?auto_181002 ?auto_181009 ) ) ( not ( = ?auto_181003 ?auto_181004 ) ) ( not ( = ?auto_181003 ?auto_181005 ) ) ( not ( = ?auto_181003 ?auto_181006 ) ) ( not ( = ?auto_181003 ?auto_181007 ) ) ( not ( = ?auto_181003 ?auto_181008 ) ) ( not ( = ?auto_181003 ?auto_181009 ) ) ( not ( = ?auto_181004 ?auto_181005 ) ) ( not ( = ?auto_181004 ?auto_181006 ) ) ( not ( = ?auto_181004 ?auto_181007 ) ) ( not ( = ?auto_181004 ?auto_181008 ) ) ( not ( = ?auto_181004 ?auto_181009 ) ) ( not ( = ?auto_181005 ?auto_181006 ) ) ( not ( = ?auto_181005 ?auto_181007 ) ) ( not ( = ?auto_181005 ?auto_181008 ) ) ( not ( = ?auto_181005 ?auto_181009 ) ) ( not ( = ?auto_181006 ?auto_181007 ) ) ( not ( = ?auto_181006 ?auto_181008 ) ) ( not ( = ?auto_181006 ?auto_181009 ) ) ( not ( = ?auto_181007 ?auto_181008 ) ) ( not ( = ?auto_181007 ?auto_181009 ) ) ( not ( = ?auto_181008 ?auto_181009 ) ) ( CLEAR ?auto_181006 ) ( ON ?auto_181007 ?auto_181008 ) ( CLEAR ?auto_181007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181002 ?auto_181003 ?auto_181004 ?auto_181005 ?auto_181006 ?auto_181007 )
      ( MAKE-7PILE ?auto_181002 ?auto_181003 ?auto_181004 ?auto_181005 ?auto_181006 ?auto_181007 ?auto_181008 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181017 - BLOCK
      ?auto_181018 - BLOCK
      ?auto_181019 - BLOCK
      ?auto_181020 - BLOCK
      ?auto_181021 - BLOCK
      ?auto_181022 - BLOCK
      ?auto_181023 - BLOCK
    )
    :vars
    (
      ?auto_181024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181023 ?auto_181024 ) ( ON-TABLE ?auto_181017 ) ( ON ?auto_181018 ?auto_181017 ) ( ON ?auto_181019 ?auto_181018 ) ( ON ?auto_181020 ?auto_181019 ) ( ON ?auto_181021 ?auto_181020 ) ( not ( = ?auto_181017 ?auto_181018 ) ) ( not ( = ?auto_181017 ?auto_181019 ) ) ( not ( = ?auto_181017 ?auto_181020 ) ) ( not ( = ?auto_181017 ?auto_181021 ) ) ( not ( = ?auto_181017 ?auto_181022 ) ) ( not ( = ?auto_181017 ?auto_181023 ) ) ( not ( = ?auto_181017 ?auto_181024 ) ) ( not ( = ?auto_181018 ?auto_181019 ) ) ( not ( = ?auto_181018 ?auto_181020 ) ) ( not ( = ?auto_181018 ?auto_181021 ) ) ( not ( = ?auto_181018 ?auto_181022 ) ) ( not ( = ?auto_181018 ?auto_181023 ) ) ( not ( = ?auto_181018 ?auto_181024 ) ) ( not ( = ?auto_181019 ?auto_181020 ) ) ( not ( = ?auto_181019 ?auto_181021 ) ) ( not ( = ?auto_181019 ?auto_181022 ) ) ( not ( = ?auto_181019 ?auto_181023 ) ) ( not ( = ?auto_181019 ?auto_181024 ) ) ( not ( = ?auto_181020 ?auto_181021 ) ) ( not ( = ?auto_181020 ?auto_181022 ) ) ( not ( = ?auto_181020 ?auto_181023 ) ) ( not ( = ?auto_181020 ?auto_181024 ) ) ( not ( = ?auto_181021 ?auto_181022 ) ) ( not ( = ?auto_181021 ?auto_181023 ) ) ( not ( = ?auto_181021 ?auto_181024 ) ) ( not ( = ?auto_181022 ?auto_181023 ) ) ( not ( = ?auto_181022 ?auto_181024 ) ) ( not ( = ?auto_181023 ?auto_181024 ) ) ( CLEAR ?auto_181021 ) ( ON ?auto_181022 ?auto_181023 ) ( CLEAR ?auto_181022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181017 ?auto_181018 ?auto_181019 ?auto_181020 ?auto_181021 ?auto_181022 )
      ( MAKE-7PILE ?auto_181017 ?auto_181018 ?auto_181019 ?auto_181020 ?auto_181021 ?auto_181022 ?auto_181023 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181032 - BLOCK
      ?auto_181033 - BLOCK
      ?auto_181034 - BLOCK
      ?auto_181035 - BLOCK
      ?auto_181036 - BLOCK
      ?auto_181037 - BLOCK
      ?auto_181038 - BLOCK
    )
    :vars
    (
      ?auto_181039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181038 ?auto_181039 ) ( ON-TABLE ?auto_181032 ) ( ON ?auto_181033 ?auto_181032 ) ( ON ?auto_181034 ?auto_181033 ) ( ON ?auto_181035 ?auto_181034 ) ( not ( = ?auto_181032 ?auto_181033 ) ) ( not ( = ?auto_181032 ?auto_181034 ) ) ( not ( = ?auto_181032 ?auto_181035 ) ) ( not ( = ?auto_181032 ?auto_181036 ) ) ( not ( = ?auto_181032 ?auto_181037 ) ) ( not ( = ?auto_181032 ?auto_181038 ) ) ( not ( = ?auto_181032 ?auto_181039 ) ) ( not ( = ?auto_181033 ?auto_181034 ) ) ( not ( = ?auto_181033 ?auto_181035 ) ) ( not ( = ?auto_181033 ?auto_181036 ) ) ( not ( = ?auto_181033 ?auto_181037 ) ) ( not ( = ?auto_181033 ?auto_181038 ) ) ( not ( = ?auto_181033 ?auto_181039 ) ) ( not ( = ?auto_181034 ?auto_181035 ) ) ( not ( = ?auto_181034 ?auto_181036 ) ) ( not ( = ?auto_181034 ?auto_181037 ) ) ( not ( = ?auto_181034 ?auto_181038 ) ) ( not ( = ?auto_181034 ?auto_181039 ) ) ( not ( = ?auto_181035 ?auto_181036 ) ) ( not ( = ?auto_181035 ?auto_181037 ) ) ( not ( = ?auto_181035 ?auto_181038 ) ) ( not ( = ?auto_181035 ?auto_181039 ) ) ( not ( = ?auto_181036 ?auto_181037 ) ) ( not ( = ?auto_181036 ?auto_181038 ) ) ( not ( = ?auto_181036 ?auto_181039 ) ) ( not ( = ?auto_181037 ?auto_181038 ) ) ( not ( = ?auto_181037 ?auto_181039 ) ) ( not ( = ?auto_181038 ?auto_181039 ) ) ( ON ?auto_181037 ?auto_181038 ) ( CLEAR ?auto_181035 ) ( ON ?auto_181036 ?auto_181037 ) ( CLEAR ?auto_181036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181032 ?auto_181033 ?auto_181034 ?auto_181035 ?auto_181036 )
      ( MAKE-7PILE ?auto_181032 ?auto_181033 ?auto_181034 ?auto_181035 ?auto_181036 ?auto_181037 ?auto_181038 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181047 - BLOCK
      ?auto_181048 - BLOCK
      ?auto_181049 - BLOCK
      ?auto_181050 - BLOCK
      ?auto_181051 - BLOCK
      ?auto_181052 - BLOCK
      ?auto_181053 - BLOCK
    )
    :vars
    (
      ?auto_181054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181053 ?auto_181054 ) ( ON-TABLE ?auto_181047 ) ( ON ?auto_181048 ?auto_181047 ) ( ON ?auto_181049 ?auto_181048 ) ( ON ?auto_181050 ?auto_181049 ) ( not ( = ?auto_181047 ?auto_181048 ) ) ( not ( = ?auto_181047 ?auto_181049 ) ) ( not ( = ?auto_181047 ?auto_181050 ) ) ( not ( = ?auto_181047 ?auto_181051 ) ) ( not ( = ?auto_181047 ?auto_181052 ) ) ( not ( = ?auto_181047 ?auto_181053 ) ) ( not ( = ?auto_181047 ?auto_181054 ) ) ( not ( = ?auto_181048 ?auto_181049 ) ) ( not ( = ?auto_181048 ?auto_181050 ) ) ( not ( = ?auto_181048 ?auto_181051 ) ) ( not ( = ?auto_181048 ?auto_181052 ) ) ( not ( = ?auto_181048 ?auto_181053 ) ) ( not ( = ?auto_181048 ?auto_181054 ) ) ( not ( = ?auto_181049 ?auto_181050 ) ) ( not ( = ?auto_181049 ?auto_181051 ) ) ( not ( = ?auto_181049 ?auto_181052 ) ) ( not ( = ?auto_181049 ?auto_181053 ) ) ( not ( = ?auto_181049 ?auto_181054 ) ) ( not ( = ?auto_181050 ?auto_181051 ) ) ( not ( = ?auto_181050 ?auto_181052 ) ) ( not ( = ?auto_181050 ?auto_181053 ) ) ( not ( = ?auto_181050 ?auto_181054 ) ) ( not ( = ?auto_181051 ?auto_181052 ) ) ( not ( = ?auto_181051 ?auto_181053 ) ) ( not ( = ?auto_181051 ?auto_181054 ) ) ( not ( = ?auto_181052 ?auto_181053 ) ) ( not ( = ?auto_181052 ?auto_181054 ) ) ( not ( = ?auto_181053 ?auto_181054 ) ) ( ON ?auto_181052 ?auto_181053 ) ( CLEAR ?auto_181050 ) ( ON ?auto_181051 ?auto_181052 ) ( CLEAR ?auto_181051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181047 ?auto_181048 ?auto_181049 ?auto_181050 ?auto_181051 )
      ( MAKE-7PILE ?auto_181047 ?auto_181048 ?auto_181049 ?auto_181050 ?auto_181051 ?auto_181052 ?auto_181053 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181062 - BLOCK
      ?auto_181063 - BLOCK
      ?auto_181064 - BLOCK
      ?auto_181065 - BLOCK
      ?auto_181066 - BLOCK
      ?auto_181067 - BLOCK
      ?auto_181068 - BLOCK
    )
    :vars
    (
      ?auto_181069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181068 ?auto_181069 ) ( ON-TABLE ?auto_181062 ) ( ON ?auto_181063 ?auto_181062 ) ( ON ?auto_181064 ?auto_181063 ) ( not ( = ?auto_181062 ?auto_181063 ) ) ( not ( = ?auto_181062 ?auto_181064 ) ) ( not ( = ?auto_181062 ?auto_181065 ) ) ( not ( = ?auto_181062 ?auto_181066 ) ) ( not ( = ?auto_181062 ?auto_181067 ) ) ( not ( = ?auto_181062 ?auto_181068 ) ) ( not ( = ?auto_181062 ?auto_181069 ) ) ( not ( = ?auto_181063 ?auto_181064 ) ) ( not ( = ?auto_181063 ?auto_181065 ) ) ( not ( = ?auto_181063 ?auto_181066 ) ) ( not ( = ?auto_181063 ?auto_181067 ) ) ( not ( = ?auto_181063 ?auto_181068 ) ) ( not ( = ?auto_181063 ?auto_181069 ) ) ( not ( = ?auto_181064 ?auto_181065 ) ) ( not ( = ?auto_181064 ?auto_181066 ) ) ( not ( = ?auto_181064 ?auto_181067 ) ) ( not ( = ?auto_181064 ?auto_181068 ) ) ( not ( = ?auto_181064 ?auto_181069 ) ) ( not ( = ?auto_181065 ?auto_181066 ) ) ( not ( = ?auto_181065 ?auto_181067 ) ) ( not ( = ?auto_181065 ?auto_181068 ) ) ( not ( = ?auto_181065 ?auto_181069 ) ) ( not ( = ?auto_181066 ?auto_181067 ) ) ( not ( = ?auto_181066 ?auto_181068 ) ) ( not ( = ?auto_181066 ?auto_181069 ) ) ( not ( = ?auto_181067 ?auto_181068 ) ) ( not ( = ?auto_181067 ?auto_181069 ) ) ( not ( = ?auto_181068 ?auto_181069 ) ) ( ON ?auto_181067 ?auto_181068 ) ( ON ?auto_181066 ?auto_181067 ) ( CLEAR ?auto_181064 ) ( ON ?auto_181065 ?auto_181066 ) ( CLEAR ?auto_181065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181062 ?auto_181063 ?auto_181064 ?auto_181065 )
      ( MAKE-7PILE ?auto_181062 ?auto_181063 ?auto_181064 ?auto_181065 ?auto_181066 ?auto_181067 ?auto_181068 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181077 - BLOCK
      ?auto_181078 - BLOCK
      ?auto_181079 - BLOCK
      ?auto_181080 - BLOCK
      ?auto_181081 - BLOCK
      ?auto_181082 - BLOCK
      ?auto_181083 - BLOCK
    )
    :vars
    (
      ?auto_181084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181083 ?auto_181084 ) ( ON-TABLE ?auto_181077 ) ( ON ?auto_181078 ?auto_181077 ) ( ON ?auto_181079 ?auto_181078 ) ( not ( = ?auto_181077 ?auto_181078 ) ) ( not ( = ?auto_181077 ?auto_181079 ) ) ( not ( = ?auto_181077 ?auto_181080 ) ) ( not ( = ?auto_181077 ?auto_181081 ) ) ( not ( = ?auto_181077 ?auto_181082 ) ) ( not ( = ?auto_181077 ?auto_181083 ) ) ( not ( = ?auto_181077 ?auto_181084 ) ) ( not ( = ?auto_181078 ?auto_181079 ) ) ( not ( = ?auto_181078 ?auto_181080 ) ) ( not ( = ?auto_181078 ?auto_181081 ) ) ( not ( = ?auto_181078 ?auto_181082 ) ) ( not ( = ?auto_181078 ?auto_181083 ) ) ( not ( = ?auto_181078 ?auto_181084 ) ) ( not ( = ?auto_181079 ?auto_181080 ) ) ( not ( = ?auto_181079 ?auto_181081 ) ) ( not ( = ?auto_181079 ?auto_181082 ) ) ( not ( = ?auto_181079 ?auto_181083 ) ) ( not ( = ?auto_181079 ?auto_181084 ) ) ( not ( = ?auto_181080 ?auto_181081 ) ) ( not ( = ?auto_181080 ?auto_181082 ) ) ( not ( = ?auto_181080 ?auto_181083 ) ) ( not ( = ?auto_181080 ?auto_181084 ) ) ( not ( = ?auto_181081 ?auto_181082 ) ) ( not ( = ?auto_181081 ?auto_181083 ) ) ( not ( = ?auto_181081 ?auto_181084 ) ) ( not ( = ?auto_181082 ?auto_181083 ) ) ( not ( = ?auto_181082 ?auto_181084 ) ) ( not ( = ?auto_181083 ?auto_181084 ) ) ( ON ?auto_181082 ?auto_181083 ) ( ON ?auto_181081 ?auto_181082 ) ( CLEAR ?auto_181079 ) ( ON ?auto_181080 ?auto_181081 ) ( CLEAR ?auto_181080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181077 ?auto_181078 ?auto_181079 ?auto_181080 )
      ( MAKE-7PILE ?auto_181077 ?auto_181078 ?auto_181079 ?auto_181080 ?auto_181081 ?auto_181082 ?auto_181083 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181092 - BLOCK
      ?auto_181093 - BLOCK
      ?auto_181094 - BLOCK
      ?auto_181095 - BLOCK
      ?auto_181096 - BLOCK
      ?auto_181097 - BLOCK
      ?auto_181098 - BLOCK
    )
    :vars
    (
      ?auto_181099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181098 ?auto_181099 ) ( ON-TABLE ?auto_181092 ) ( ON ?auto_181093 ?auto_181092 ) ( not ( = ?auto_181092 ?auto_181093 ) ) ( not ( = ?auto_181092 ?auto_181094 ) ) ( not ( = ?auto_181092 ?auto_181095 ) ) ( not ( = ?auto_181092 ?auto_181096 ) ) ( not ( = ?auto_181092 ?auto_181097 ) ) ( not ( = ?auto_181092 ?auto_181098 ) ) ( not ( = ?auto_181092 ?auto_181099 ) ) ( not ( = ?auto_181093 ?auto_181094 ) ) ( not ( = ?auto_181093 ?auto_181095 ) ) ( not ( = ?auto_181093 ?auto_181096 ) ) ( not ( = ?auto_181093 ?auto_181097 ) ) ( not ( = ?auto_181093 ?auto_181098 ) ) ( not ( = ?auto_181093 ?auto_181099 ) ) ( not ( = ?auto_181094 ?auto_181095 ) ) ( not ( = ?auto_181094 ?auto_181096 ) ) ( not ( = ?auto_181094 ?auto_181097 ) ) ( not ( = ?auto_181094 ?auto_181098 ) ) ( not ( = ?auto_181094 ?auto_181099 ) ) ( not ( = ?auto_181095 ?auto_181096 ) ) ( not ( = ?auto_181095 ?auto_181097 ) ) ( not ( = ?auto_181095 ?auto_181098 ) ) ( not ( = ?auto_181095 ?auto_181099 ) ) ( not ( = ?auto_181096 ?auto_181097 ) ) ( not ( = ?auto_181096 ?auto_181098 ) ) ( not ( = ?auto_181096 ?auto_181099 ) ) ( not ( = ?auto_181097 ?auto_181098 ) ) ( not ( = ?auto_181097 ?auto_181099 ) ) ( not ( = ?auto_181098 ?auto_181099 ) ) ( ON ?auto_181097 ?auto_181098 ) ( ON ?auto_181096 ?auto_181097 ) ( ON ?auto_181095 ?auto_181096 ) ( CLEAR ?auto_181093 ) ( ON ?auto_181094 ?auto_181095 ) ( CLEAR ?auto_181094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181092 ?auto_181093 ?auto_181094 )
      ( MAKE-7PILE ?auto_181092 ?auto_181093 ?auto_181094 ?auto_181095 ?auto_181096 ?auto_181097 ?auto_181098 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181107 - BLOCK
      ?auto_181108 - BLOCK
      ?auto_181109 - BLOCK
      ?auto_181110 - BLOCK
      ?auto_181111 - BLOCK
      ?auto_181112 - BLOCK
      ?auto_181113 - BLOCK
    )
    :vars
    (
      ?auto_181114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181113 ?auto_181114 ) ( ON-TABLE ?auto_181107 ) ( ON ?auto_181108 ?auto_181107 ) ( not ( = ?auto_181107 ?auto_181108 ) ) ( not ( = ?auto_181107 ?auto_181109 ) ) ( not ( = ?auto_181107 ?auto_181110 ) ) ( not ( = ?auto_181107 ?auto_181111 ) ) ( not ( = ?auto_181107 ?auto_181112 ) ) ( not ( = ?auto_181107 ?auto_181113 ) ) ( not ( = ?auto_181107 ?auto_181114 ) ) ( not ( = ?auto_181108 ?auto_181109 ) ) ( not ( = ?auto_181108 ?auto_181110 ) ) ( not ( = ?auto_181108 ?auto_181111 ) ) ( not ( = ?auto_181108 ?auto_181112 ) ) ( not ( = ?auto_181108 ?auto_181113 ) ) ( not ( = ?auto_181108 ?auto_181114 ) ) ( not ( = ?auto_181109 ?auto_181110 ) ) ( not ( = ?auto_181109 ?auto_181111 ) ) ( not ( = ?auto_181109 ?auto_181112 ) ) ( not ( = ?auto_181109 ?auto_181113 ) ) ( not ( = ?auto_181109 ?auto_181114 ) ) ( not ( = ?auto_181110 ?auto_181111 ) ) ( not ( = ?auto_181110 ?auto_181112 ) ) ( not ( = ?auto_181110 ?auto_181113 ) ) ( not ( = ?auto_181110 ?auto_181114 ) ) ( not ( = ?auto_181111 ?auto_181112 ) ) ( not ( = ?auto_181111 ?auto_181113 ) ) ( not ( = ?auto_181111 ?auto_181114 ) ) ( not ( = ?auto_181112 ?auto_181113 ) ) ( not ( = ?auto_181112 ?auto_181114 ) ) ( not ( = ?auto_181113 ?auto_181114 ) ) ( ON ?auto_181112 ?auto_181113 ) ( ON ?auto_181111 ?auto_181112 ) ( ON ?auto_181110 ?auto_181111 ) ( CLEAR ?auto_181108 ) ( ON ?auto_181109 ?auto_181110 ) ( CLEAR ?auto_181109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181107 ?auto_181108 ?auto_181109 )
      ( MAKE-7PILE ?auto_181107 ?auto_181108 ?auto_181109 ?auto_181110 ?auto_181111 ?auto_181112 ?auto_181113 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181122 - BLOCK
      ?auto_181123 - BLOCK
      ?auto_181124 - BLOCK
      ?auto_181125 - BLOCK
      ?auto_181126 - BLOCK
      ?auto_181127 - BLOCK
      ?auto_181128 - BLOCK
    )
    :vars
    (
      ?auto_181129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181128 ?auto_181129 ) ( ON-TABLE ?auto_181122 ) ( not ( = ?auto_181122 ?auto_181123 ) ) ( not ( = ?auto_181122 ?auto_181124 ) ) ( not ( = ?auto_181122 ?auto_181125 ) ) ( not ( = ?auto_181122 ?auto_181126 ) ) ( not ( = ?auto_181122 ?auto_181127 ) ) ( not ( = ?auto_181122 ?auto_181128 ) ) ( not ( = ?auto_181122 ?auto_181129 ) ) ( not ( = ?auto_181123 ?auto_181124 ) ) ( not ( = ?auto_181123 ?auto_181125 ) ) ( not ( = ?auto_181123 ?auto_181126 ) ) ( not ( = ?auto_181123 ?auto_181127 ) ) ( not ( = ?auto_181123 ?auto_181128 ) ) ( not ( = ?auto_181123 ?auto_181129 ) ) ( not ( = ?auto_181124 ?auto_181125 ) ) ( not ( = ?auto_181124 ?auto_181126 ) ) ( not ( = ?auto_181124 ?auto_181127 ) ) ( not ( = ?auto_181124 ?auto_181128 ) ) ( not ( = ?auto_181124 ?auto_181129 ) ) ( not ( = ?auto_181125 ?auto_181126 ) ) ( not ( = ?auto_181125 ?auto_181127 ) ) ( not ( = ?auto_181125 ?auto_181128 ) ) ( not ( = ?auto_181125 ?auto_181129 ) ) ( not ( = ?auto_181126 ?auto_181127 ) ) ( not ( = ?auto_181126 ?auto_181128 ) ) ( not ( = ?auto_181126 ?auto_181129 ) ) ( not ( = ?auto_181127 ?auto_181128 ) ) ( not ( = ?auto_181127 ?auto_181129 ) ) ( not ( = ?auto_181128 ?auto_181129 ) ) ( ON ?auto_181127 ?auto_181128 ) ( ON ?auto_181126 ?auto_181127 ) ( ON ?auto_181125 ?auto_181126 ) ( ON ?auto_181124 ?auto_181125 ) ( CLEAR ?auto_181122 ) ( ON ?auto_181123 ?auto_181124 ) ( CLEAR ?auto_181123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181122 ?auto_181123 )
      ( MAKE-7PILE ?auto_181122 ?auto_181123 ?auto_181124 ?auto_181125 ?auto_181126 ?auto_181127 ?auto_181128 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181137 - BLOCK
      ?auto_181138 - BLOCK
      ?auto_181139 - BLOCK
      ?auto_181140 - BLOCK
      ?auto_181141 - BLOCK
      ?auto_181142 - BLOCK
      ?auto_181143 - BLOCK
    )
    :vars
    (
      ?auto_181144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181143 ?auto_181144 ) ( ON-TABLE ?auto_181137 ) ( not ( = ?auto_181137 ?auto_181138 ) ) ( not ( = ?auto_181137 ?auto_181139 ) ) ( not ( = ?auto_181137 ?auto_181140 ) ) ( not ( = ?auto_181137 ?auto_181141 ) ) ( not ( = ?auto_181137 ?auto_181142 ) ) ( not ( = ?auto_181137 ?auto_181143 ) ) ( not ( = ?auto_181137 ?auto_181144 ) ) ( not ( = ?auto_181138 ?auto_181139 ) ) ( not ( = ?auto_181138 ?auto_181140 ) ) ( not ( = ?auto_181138 ?auto_181141 ) ) ( not ( = ?auto_181138 ?auto_181142 ) ) ( not ( = ?auto_181138 ?auto_181143 ) ) ( not ( = ?auto_181138 ?auto_181144 ) ) ( not ( = ?auto_181139 ?auto_181140 ) ) ( not ( = ?auto_181139 ?auto_181141 ) ) ( not ( = ?auto_181139 ?auto_181142 ) ) ( not ( = ?auto_181139 ?auto_181143 ) ) ( not ( = ?auto_181139 ?auto_181144 ) ) ( not ( = ?auto_181140 ?auto_181141 ) ) ( not ( = ?auto_181140 ?auto_181142 ) ) ( not ( = ?auto_181140 ?auto_181143 ) ) ( not ( = ?auto_181140 ?auto_181144 ) ) ( not ( = ?auto_181141 ?auto_181142 ) ) ( not ( = ?auto_181141 ?auto_181143 ) ) ( not ( = ?auto_181141 ?auto_181144 ) ) ( not ( = ?auto_181142 ?auto_181143 ) ) ( not ( = ?auto_181142 ?auto_181144 ) ) ( not ( = ?auto_181143 ?auto_181144 ) ) ( ON ?auto_181142 ?auto_181143 ) ( ON ?auto_181141 ?auto_181142 ) ( ON ?auto_181140 ?auto_181141 ) ( ON ?auto_181139 ?auto_181140 ) ( CLEAR ?auto_181137 ) ( ON ?auto_181138 ?auto_181139 ) ( CLEAR ?auto_181138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181137 ?auto_181138 )
      ( MAKE-7PILE ?auto_181137 ?auto_181138 ?auto_181139 ?auto_181140 ?auto_181141 ?auto_181142 ?auto_181143 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181152 - BLOCK
      ?auto_181153 - BLOCK
      ?auto_181154 - BLOCK
      ?auto_181155 - BLOCK
      ?auto_181156 - BLOCK
      ?auto_181157 - BLOCK
      ?auto_181158 - BLOCK
    )
    :vars
    (
      ?auto_181159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181158 ?auto_181159 ) ( not ( = ?auto_181152 ?auto_181153 ) ) ( not ( = ?auto_181152 ?auto_181154 ) ) ( not ( = ?auto_181152 ?auto_181155 ) ) ( not ( = ?auto_181152 ?auto_181156 ) ) ( not ( = ?auto_181152 ?auto_181157 ) ) ( not ( = ?auto_181152 ?auto_181158 ) ) ( not ( = ?auto_181152 ?auto_181159 ) ) ( not ( = ?auto_181153 ?auto_181154 ) ) ( not ( = ?auto_181153 ?auto_181155 ) ) ( not ( = ?auto_181153 ?auto_181156 ) ) ( not ( = ?auto_181153 ?auto_181157 ) ) ( not ( = ?auto_181153 ?auto_181158 ) ) ( not ( = ?auto_181153 ?auto_181159 ) ) ( not ( = ?auto_181154 ?auto_181155 ) ) ( not ( = ?auto_181154 ?auto_181156 ) ) ( not ( = ?auto_181154 ?auto_181157 ) ) ( not ( = ?auto_181154 ?auto_181158 ) ) ( not ( = ?auto_181154 ?auto_181159 ) ) ( not ( = ?auto_181155 ?auto_181156 ) ) ( not ( = ?auto_181155 ?auto_181157 ) ) ( not ( = ?auto_181155 ?auto_181158 ) ) ( not ( = ?auto_181155 ?auto_181159 ) ) ( not ( = ?auto_181156 ?auto_181157 ) ) ( not ( = ?auto_181156 ?auto_181158 ) ) ( not ( = ?auto_181156 ?auto_181159 ) ) ( not ( = ?auto_181157 ?auto_181158 ) ) ( not ( = ?auto_181157 ?auto_181159 ) ) ( not ( = ?auto_181158 ?auto_181159 ) ) ( ON ?auto_181157 ?auto_181158 ) ( ON ?auto_181156 ?auto_181157 ) ( ON ?auto_181155 ?auto_181156 ) ( ON ?auto_181154 ?auto_181155 ) ( ON ?auto_181153 ?auto_181154 ) ( ON ?auto_181152 ?auto_181153 ) ( CLEAR ?auto_181152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181152 )
      ( MAKE-7PILE ?auto_181152 ?auto_181153 ?auto_181154 ?auto_181155 ?auto_181156 ?auto_181157 ?auto_181158 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_181167 - BLOCK
      ?auto_181168 - BLOCK
      ?auto_181169 - BLOCK
      ?auto_181170 - BLOCK
      ?auto_181171 - BLOCK
      ?auto_181172 - BLOCK
      ?auto_181173 - BLOCK
    )
    :vars
    (
      ?auto_181174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181173 ?auto_181174 ) ( not ( = ?auto_181167 ?auto_181168 ) ) ( not ( = ?auto_181167 ?auto_181169 ) ) ( not ( = ?auto_181167 ?auto_181170 ) ) ( not ( = ?auto_181167 ?auto_181171 ) ) ( not ( = ?auto_181167 ?auto_181172 ) ) ( not ( = ?auto_181167 ?auto_181173 ) ) ( not ( = ?auto_181167 ?auto_181174 ) ) ( not ( = ?auto_181168 ?auto_181169 ) ) ( not ( = ?auto_181168 ?auto_181170 ) ) ( not ( = ?auto_181168 ?auto_181171 ) ) ( not ( = ?auto_181168 ?auto_181172 ) ) ( not ( = ?auto_181168 ?auto_181173 ) ) ( not ( = ?auto_181168 ?auto_181174 ) ) ( not ( = ?auto_181169 ?auto_181170 ) ) ( not ( = ?auto_181169 ?auto_181171 ) ) ( not ( = ?auto_181169 ?auto_181172 ) ) ( not ( = ?auto_181169 ?auto_181173 ) ) ( not ( = ?auto_181169 ?auto_181174 ) ) ( not ( = ?auto_181170 ?auto_181171 ) ) ( not ( = ?auto_181170 ?auto_181172 ) ) ( not ( = ?auto_181170 ?auto_181173 ) ) ( not ( = ?auto_181170 ?auto_181174 ) ) ( not ( = ?auto_181171 ?auto_181172 ) ) ( not ( = ?auto_181171 ?auto_181173 ) ) ( not ( = ?auto_181171 ?auto_181174 ) ) ( not ( = ?auto_181172 ?auto_181173 ) ) ( not ( = ?auto_181172 ?auto_181174 ) ) ( not ( = ?auto_181173 ?auto_181174 ) ) ( ON ?auto_181172 ?auto_181173 ) ( ON ?auto_181171 ?auto_181172 ) ( ON ?auto_181170 ?auto_181171 ) ( ON ?auto_181169 ?auto_181170 ) ( ON ?auto_181168 ?auto_181169 ) ( ON ?auto_181167 ?auto_181168 ) ( CLEAR ?auto_181167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181167 )
      ( MAKE-7PILE ?auto_181167 ?auto_181168 ?auto_181169 ?auto_181170 ?auto_181171 ?auto_181172 ?auto_181173 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181183 - BLOCK
      ?auto_181184 - BLOCK
      ?auto_181185 - BLOCK
      ?auto_181186 - BLOCK
      ?auto_181187 - BLOCK
      ?auto_181188 - BLOCK
      ?auto_181189 - BLOCK
      ?auto_181190 - BLOCK
    )
    :vars
    (
      ?auto_181191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_181189 ) ( ON ?auto_181190 ?auto_181191 ) ( CLEAR ?auto_181190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181183 ) ( ON ?auto_181184 ?auto_181183 ) ( ON ?auto_181185 ?auto_181184 ) ( ON ?auto_181186 ?auto_181185 ) ( ON ?auto_181187 ?auto_181186 ) ( ON ?auto_181188 ?auto_181187 ) ( ON ?auto_181189 ?auto_181188 ) ( not ( = ?auto_181183 ?auto_181184 ) ) ( not ( = ?auto_181183 ?auto_181185 ) ) ( not ( = ?auto_181183 ?auto_181186 ) ) ( not ( = ?auto_181183 ?auto_181187 ) ) ( not ( = ?auto_181183 ?auto_181188 ) ) ( not ( = ?auto_181183 ?auto_181189 ) ) ( not ( = ?auto_181183 ?auto_181190 ) ) ( not ( = ?auto_181183 ?auto_181191 ) ) ( not ( = ?auto_181184 ?auto_181185 ) ) ( not ( = ?auto_181184 ?auto_181186 ) ) ( not ( = ?auto_181184 ?auto_181187 ) ) ( not ( = ?auto_181184 ?auto_181188 ) ) ( not ( = ?auto_181184 ?auto_181189 ) ) ( not ( = ?auto_181184 ?auto_181190 ) ) ( not ( = ?auto_181184 ?auto_181191 ) ) ( not ( = ?auto_181185 ?auto_181186 ) ) ( not ( = ?auto_181185 ?auto_181187 ) ) ( not ( = ?auto_181185 ?auto_181188 ) ) ( not ( = ?auto_181185 ?auto_181189 ) ) ( not ( = ?auto_181185 ?auto_181190 ) ) ( not ( = ?auto_181185 ?auto_181191 ) ) ( not ( = ?auto_181186 ?auto_181187 ) ) ( not ( = ?auto_181186 ?auto_181188 ) ) ( not ( = ?auto_181186 ?auto_181189 ) ) ( not ( = ?auto_181186 ?auto_181190 ) ) ( not ( = ?auto_181186 ?auto_181191 ) ) ( not ( = ?auto_181187 ?auto_181188 ) ) ( not ( = ?auto_181187 ?auto_181189 ) ) ( not ( = ?auto_181187 ?auto_181190 ) ) ( not ( = ?auto_181187 ?auto_181191 ) ) ( not ( = ?auto_181188 ?auto_181189 ) ) ( not ( = ?auto_181188 ?auto_181190 ) ) ( not ( = ?auto_181188 ?auto_181191 ) ) ( not ( = ?auto_181189 ?auto_181190 ) ) ( not ( = ?auto_181189 ?auto_181191 ) ) ( not ( = ?auto_181190 ?auto_181191 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181190 ?auto_181191 )
      ( !STACK ?auto_181190 ?auto_181189 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181200 - BLOCK
      ?auto_181201 - BLOCK
      ?auto_181202 - BLOCK
      ?auto_181203 - BLOCK
      ?auto_181204 - BLOCK
      ?auto_181205 - BLOCK
      ?auto_181206 - BLOCK
      ?auto_181207 - BLOCK
    )
    :vars
    (
      ?auto_181208 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_181206 ) ( ON ?auto_181207 ?auto_181208 ) ( CLEAR ?auto_181207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181200 ) ( ON ?auto_181201 ?auto_181200 ) ( ON ?auto_181202 ?auto_181201 ) ( ON ?auto_181203 ?auto_181202 ) ( ON ?auto_181204 ?auto_181203 ) ( ON ?auto_181205 ?auto_181204 ) ( ON ?auto_181206 ?auto_181205 ) ( not ( = ?auto_181200 ?auto_181201 ) ) ( not ( = ?auto_181200 ?auto_181202 ) ) ( not ( = ?auto_181200 ?auto_181203 ) ) ( not ( = ?auto_181200 ?auto_181204 ) ) ( not ( = ?auto_181200 ?auto_181205 ) ) ( not ( = ?auto_181200 ?auto_181206 ) ) ( not ( = ?auto_181200 ?auto_181207 ) ) ( not ( = ?auto_181200 ?auto_181208 ) ) ( not ( = ?auto_181201 ?auto_181202 ) ) ( not ( = ?auto_181201 ?auto_181203 ) ) ( not ( = ?auto_181201 ?auto_181204 ) ) ( not ( = ?auto_181201 ?auto_181205 ) ) ( not ( = ?auto_181201 ?auto_181206 ) ) ( not ( = ?auto_181201 ?auto_181207 ) ) ( not ( = ?auto_181201 ?auto_181208 ) ) ( not ( = ?auto_181202 ?auto_181203 ) ) ( not ( = ?auto_181202 ?auto_181204 ) ) ( not ( = ?auto_181202 ?auto_181205 ) ) ( not ( = ?auto_181202 ?auto_181206 ) ) ( not ( = ?auto_181202 ?auto_181207 ) ) ( not ( = ?auto_181202 ?auto_181208 ) ) ( not ( = ?auto_181203 ?auto_181204 ) ) ( not ( = ?auto_181203 ?auto_181205 ) ) ( not ( = ?auto_181203 ?auto_181206 ) ) ( not ( = ?auto_181203 ?auto_181207 ) ) ( not ( = ?auto_181203 ?auto_181208 ) ) ( not ( = ?auto_181204 ?auto_181205 ) ) ( not ( = ?auto_181204 ?auto_181206 ) ) ( not ( = ?auto_181204 ?auto_181207 ) ) ( not ( = ?auto_181204 ?auto_181208 ) ) ( not ( = ?auto_181205 ?auto_181206 ) ) ( not ( = ?auto_181205 ?auto_181207 ) ) ( not ( = ?auto_181205 ?auto_181208 ) ) ( not ( = ?auto_181206 ?auto_181207 ) ) ( not ( = ?auto_181206 ?auto_181208 ) ) ( not ( = ?auto_181207 ?auto_181208 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181207 ?auto_181208 )
      ( !STACK ?auto_181207 ?auto_181206 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181217 - BLOCK
      ?auto_181218 - BLOCK
      ?auto_181219 - BLOCK
      ?auto_181220 - BLOCK
      ?auto_181221 - BLOCK
      ?auto_181222 - BLOCK
      ?auto_181223 - BLOCK
      ?auto_181224 - BLOCK
    )
    :vars
    (
      ?auto_181225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181224 ?auto_181225 ) ( ON-TABLE ?auto_181217 ) ( ON ?auto_181218 ?auto_181217 ) ( ON ?auto_181219 ?auto_181218 ) ( ON ?auto_181220 ?auto_181219 ) ( ON ?auto_181221 ?auto_181220 ) ( ON ?auto_181222 ?auto_181221 ) ( not ( = ?auto_181217 ?auto_181218 ) ) ( not ( = ?auto_181217 ?auto_181219 ) ) ( not ( = ?auto_181217 ?auto_181220 ) ) ( not ( = ?auto_181217 ?auto_181221 ) ) ( not ( = ?auto_181217 ?auto_181222 ) ) ( not ( = ?auto_181217 ?auto_181223 ) ) ( not ( = ?auto_181217 ?auto_181224 ) ) ( not ( = ?auto_181217 ?auto_181225 ) ) ( not ( = ?auto_181218 ?auto_181219 ) ) ( not ( = ?auto_181218 ?auto_181220 ) ) ( not ( = ?auto_181218 ?auto_181221 ) ) ( not ( = ?auto_181218 ?auto_181222 ) ) ( not ( = ?auto_181218 ?auto_181223 ) ) ( not ( = ?auto_181218 ?auto_181224 ) ) ( not ( = ?auto_181218 ?auto_181225 ) ) ( not ( = ?auto_181219 ?auto_181220 ) ) ( not ( = ?auto_181219 ?auto_181221 ) ) ( not ( = ?auto_181219 ?auto_181222 ) ) ( not ( = ?auto_181219 ?auto_181223 ) ) ( not ( = ?auto_181219 ?auto_181224 ) ) ( not ( = ?auto_181219 ?auto_181225 ) ) ( not ( = ?auto_181220 ?auto_181221 ) ) ( not ( = ?auto_181220 ?auto_181222 ) ) ( not ( = ?auto_181220 ?auto_181223 ) ) ( not ( = ?auto_181220 ?auto_181224 ) ) ( not ( = ?auto_181220 ?auto_181225 ) ) ( not ( = ?auto_181221 ?auto_181222 ) ) ( not ( = ?auto_181221 ?auto_181223 ) ) ( not ( = ?auto_181221 ?auto_181224 ) ) ( not ( = ?auto_181221 ?auto_181225 ) ) ( not ( = ?auto_181222 ?auto_181223 ) ) ( not ( = ?auto_181222 ?auto_181224 ) ) ( not ( = ?auto_181222 ?auto_181225 ) ) ( not ( = ?auto_181223 ?auto_181224 ) ) ( not ( = ?auto_181223 ?auto_181225 ) ) ( not ( = ?auto_181224 ?auto_181225 ) ) ( CLEAR ?auto_181222 ) ( ON ?auto_181223 ?auto_181224 ) ( CLEAR ?auto_181223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181217 ?auto_181218 ?auto_181219 ?auto_181220 ?auto_181221 ?auto_181222 ?auto_181223 )
      ( MAKE-8PILE ?auto_181217 ?auto_181218 ?auto_181219 ?auto_181220 ?auto_181221 ?auto_181222 ?auto_181223 ?auto_181224 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181234 - BLOCK
      ?auto_181235 - BLOCK
      ?auto_181236 - BLOCK
      ?auto_181237 - BLOCK
      ?auto_181238 - BLOCK
      ?auto_181239 - BLOCK
      ?auto_181240 - BLOCK
      ?auto_181241 - BLOCK
    )
    :vars
    (
      ?auto_181242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181241 ?auto_181242 ) ( ON-TABLE ?auto_181234 ) ( ON ?auto_181235 ?auto_181234 ) ( ON ?auto_181236 ?auto_181235 ) ( ON ?auto_181237 ?auto_181236 ) ( ON ?auto_181238 ?auto_181237 ) ( ON ?auto_181239 ?auto_181238 ) ( not ( = ?auto_181234 ?auto_181235 ) ) ( not ( = ?auto_181234 ?auto_181236 ) ) ( not ( = ?auto_181234 ?auto_181237 ) ) ( not ( = ?auto_181234 ?auto_181238 ) ) ( not ( = ?auto_181234 ?auto_181239 ) ) ( not ( = ?auto_181234 ?auto_181240 ) ) ( not ( = ?auto_181234 ?auto_181241 ) ) ( not ( = ?auto_181234 ?auto_181242 ) ) ( not ( = ?auto_181235 ?auto_181236 ) ) ( not ( = ?auto_181235 ?auto_181237 ) ) ( not ( = ?auto_181235 ?auto_181238 ) ) ( not ( = ?auto_181235 ?auto_181239 ) ) ( not ( = ?auto_181235 ?auto_181240 ) ) ( not ( = ?auto_181235 ?auto_181241 ) ) ( not ( = ?auto_181235 ?auto_181242 ) ) ( not ( = ?auto_181236 ?auto_181237 ) ) ( not ( = ?auto_181236 ?auto_181238 ) ) ( not ( = ?auto_181236 ?auto_181239 ) ) ( not ( = ?auto_181236 ?auto_181240 ) ) ( not ( = ?auto_181236 ?auto_181241 ) ) ( not ( = ?auto_181236 ?auto_181242 ) ) ( not ( = ?auto_181237 ?auto_181238 ) ) ( not ( = ?auto_181237 ?auto_181239 ) ) ( not ( = ?auto_181237 ?auto_181240 ) ) ( not ( = ?auto_181237 ?auto_181241 ) ) ( not ( = ?auto_181237 ?auto_181242 ) ) ( not ( = ?auto_181238 ?auto_181239 ) ) ( not ( = ?auto_181238 ?auto_181240 ) ) ( not ( = ?auto_181238 ?auto_181241 ) ) ( not ( = ?auto_181238 ?auto_181242 ) ) ( not ( = ?auto_181239 ?auto_181240 ) ) ( not ( = ?auto_181239 ?auto_181241 ) ) ( not ( = ?auto_181239 ?auto_181242 ) ) ( not ( = ?auto_181240 ?auto_181241 ) ) ( not ( = ?auto_181240 ?auto_181242 ) ) ( not ( = ?auto_181241 ?auto_181242 ) ) ( CLEAR ?auto_181239 ) ( ON ?auto_181240 ?auto_181241 ) ( CLEAR ?auto_181240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181234 ?auto_181235 ?auto_181236 ?auto_181237 ?auto_181238 ?auto_181239 ?auto_181240 )
      ( MAKE-8PILE ?auto_181234 ?auto_181235 ?auto_181236 ?auto_181237 ?auto_181238 ?auto_181239 ?auto_181240 ?auto_181241 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181251 - BLOCK
      ?auto_181252 - BLOCK
      ?auto_181253 - BLOCK
      ?auto_181254 - BLOCK
      ?auto_181255 - BLOCK
      ?auto_181256 - BLOCK
      ?auto_181257 - BLOCK
      ?auto_181258 - BLOCK
    )
    :vars
    (
      ?auto_181259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181258 ?auto_181259 ) ( ON-TABLE ?auto_181251 ) ( ON ?auto_181252 ?auto_181251 ) ( ON ?auto_181253 ?auto_181252 ) ( ON ?auto_181254 ?auto_181253 ) ( ON ?auto_181255 ?auto_181254 ) ( not ( = ?auto_181251 ?auto_181252 ) ) ( not ( = ?auto_181251 ?auto_181253 ) ) ( not ( = ?auto_181251 ?auto_181254 ) ) ( not ( = ?auto_181251 ?auto_181255 ) ) ( not ( = ?auto_181251 ?auto_181256 ) ) ( not ( = ?auto_181251 ?auto_181257 ) ) ( not ( = ?auto_181251 ?auto_181258 ) ) ( not ( = ?auto_181251 ?auto_181259 ) ) ( not ( = ?auto_181252 ?auto_181253 ) ) ( not ( = ?auto_181252 ?auto_181254 ) ) ( not ( = ?auto_181252 ?auto_181255 ) ) ( not ( = ?auto_181252 ?auto_181256 ) ) ( not ( = ?auto_181252 ?auto_181257 ) ) ( not ( = ?auto_181252 ?auto_181258 ) ) ( not ( = ?auto_181252 ?auto_181259 ) ) ( not ( = ?auto_181253 ?auto_181254 ) ) ( not ( = ?auto_181253 ?auto_181255 ) ) ( not ( = ?auto_181253 ?auto_181256 ) ) ( not ( = ?auto_181253 ?auto_181257 ) ) ( not ( = ?auto_181253 ?auto_181258 ) ) ( not ( = ?auto_181253 ?auto_181259 ) ) ( not ( = ?auto_181254 ?auto_181255 ) ) ( not ( = ?auto_181254 ?auto_181256 ) ) ( not ( = ?auto_181254 ?auto_181257 ) ) ( not ( = ?auto_181254 ?auto_181258 ) ) ( not ( = ?auto_181254 ?auto_181259 ) ) ( not ( = ?auto_181255 ?auto_181256 ) ) ( not ( = ?auto_181255 ?auto_181257 ) ) ( not ( = ?auto_181255 ?auto_181258 ) ) ( not ( = ?auto_181255 ?auto_181259 ) ) ( not ( = ?auto_181256 ?auto_181257 ) ) ( not ( = ?auto_181256 ?auto_181258 ) ) ( not ( = ?auto_181256 ?auto_181259 ) ) ( not ( = ?auto_181257 ?auto_181258 ) ) ( not ( = ?auto_181257 ?auto_181259 ) ) ( not ( = ?auto_181258 ?auto_181259 ) ) ( ON ?auto_181257 ?auto_181258 ) ( CLEAR ?auto_181255 ) ( ON ?auto_181256 ?auto_181257 ) ( CLEAR ?auto_181256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181251 ?auto_181252 ?auto_181253 ?auto_181254 ?auto_181255 ?auto_181256 )
      ( MAKE-8PILE ?auto_181251 ?auto_181252 ?auto_181253 ?auto_181254 ?auto_181255 ?auto_181256 ?auto_181257 ?auto_181258 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181268 - BLOCK
      ?auto_181269 - BLOCK
      ?auto_181270 - BLOCK
      ?auto_181271 - BLOCK
      ?auto_181272 - BLOCK
      ?auto_181273 - BLOCK
      ?auto_181274 - BLOCK
      ?auto_181275 - BLOCK
    )
    :vars
    (
      ?auto_181276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181275 ?auto_181276 ) ( ON-TABLE ?auto_181268 ) ( ON ?auto_181269 ?auto_181268 ) ( ON ?auto_181270 ?auto_181269 ) ( ON ?auto_181271 ?auto_181270 ) ( ON ?auto_181272 ?auto_181271 ) ( not ( = ?auto_181268 ?auto_181269 ) ) ( not ( = ?auto_181268 ?auto_181270 ) ) ( not ( = ?auto_181268 ?auto_181271 ) ) ( not ( = ?auto_181268 ?auto_181272 ) ) ( not ( = ?auto_181268 ?auto_181273 ) ) ( not ( = ?auto_181268 ?auto_181274 ) ) ( not ( = ?auto_181268 ?auto_181275 ) ) ( not ( = ?auto_181268 ?auto_181276 ) ) ( not ( = ?auto_181269 ?auto_181270 ) ) ( not ( = ?auto_181269 ?auto_181271 ) ) ( not ( = ?auto_181269 ?auto_181272 ) ) ( not ( = ?auto_181269 ?auto_181273 ) ) ( not ( = ?auto_181269 ?auto_181274 ) ) ( not ( = ?auto_181269 ?auto_181275 ) ) ( not ( = ?auto_181269 ?auto_181276 ) ) ( not ( = ?auto_181270 ?auto_181271 ) ) ( not ( = ?auto_181270 ?auto_181272 ) ) ( not ( = ?auto_181270 ?auto_181273 ) ) ( not ( = ?auto_181270 ?auto_181274 ) ) ( not ( = ?auto_181270 ?auto_181275 ) ) ( not ( = ?auto_181270 ?auto_181276 ) ) ( not ( = ?auto_181271 ?auto_181272 ) ) ( not ( = ?auto_181271 ?auto_181273 ) ) ( not ( = ?auto_181271 ?auto_181274 ) ) ( not ( = ?auto_181271 ?auto_181275 ) ) ( not ( = ?auto_181271 ?auto_181276 ) ) ( not ( = ?auto_181272 ?auto_181273 ) ) ( not ( = ?auto_181272 ?auto_181274 ) ) ( not ( = ?auto_181272 ?auto_181275 ) ) ( not ( = ?auto_181272 ?auto_181276 ) ) ( not ( = ?auto_181273 ?auto_181274 ) ) ( not ( = ?auto_181273 ?auto_181275 ) ) ( not ( = ?auto_181273 ?auto_181276 ) ) ( not ( = ?auto_181274 ?auto_181275 ) ) ( not ( = ?auto_181274 ?auto_181276 ) ) ( not ( = ?auto_181275 ?auto_181276 ) ) ( ON ?auto_181274 ?auto_181275 ) ( CLEAR ?auto_181272 ) ( ON ?auto_181273 ?auto_181274 ) ( CLEAR ?auto_181273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181268 ?auto_181269 ?auto_181270 ?auto_181271 ?auto_181272 ?auto_181273 )
      ( MAKE-8PILE ?auto_181268 ?auto_181269 ?auto_181270 ?auto_181271 ?auto_181272 ?auto_181273 ?auto_181274 ?auto_181275 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181285 - BLOCK
      ?auto_181286 - BLOCK
      ?auto_181287 - BLOCK
      ?auto_181288 - BLOCK
      ?auto_181289 - BLOCK
      ?auto_181290 - BLOCK
      ?auto_181291 - BLOCK
      ?auto_181292 - BLOCK
    )
    :vars
    (
      ?auto_181293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181292 ?auto_181293 ) ( ON-TABLE ?auto_181285 ) ( ON ?auto_181286 ?auto_181285 ) ( ON ?auto_181287 ?auto_181286 ) ( ON ?auto_181288 ?auto_181287 ) ( not ( = ?auto_181285 ?auto_181286 ) ) ( not ( = ?auto_181285 ?auto_181287 ) ) ( not ( = ?auto_181285 ?auto_181288 ) ) ( not ( = ?auto_181285 ?auto_181289 ) ) ( not ( = ?auto_181285 ?auto_181290 ) ) ( not ( = ?auto_181285 ?auto_181291 ) ) ( not ( = ?auto_181285 ?auto_181292 ) ) ( not ( = ?auto_181285 ?auto_181293 ) ) ( not ( = ?auto_181286 ?auto_181287 ) ) ( not ( = ?auto_181286 ?auto_181288 ) ) ( not ( = ?auto_181286 ?auto_181289 ) ) ( not ( = ?auto_181286 ?auto_181290 ) ) ( not ( = ?auto_181286 ?auto_181291 ) ) ( not ( = ?auto_181286 ?auto_181292 ) ) ( not ( = ?auto_181286 ?auto_181293 ) ) ( not ( = ?auto_181287 ?auto_181288 ) ) ( not ( = ?auto_181287 ?auto_181289 ) ) ( not ( = ?auto_181287 ?auto_181290 ) ) ( not ( = ?auto_181287 ?auto_181291 ) ) ( not ( = ?auto_181287 ?auto_181292 ) ) ( not ( = ?auto_181287 ?auto_181293 ) ) ( not ( = ?auto_181288 ?auto_181289 ) ) ( not ( = ?auto_181288 ?auto_181290 ) ) ( not ( = ?auto_181288 ?auto_181291 ) ) ( not ( = ?auto_181288 ?auto_181292 ) ) ( not ( = ?auto_181288 ?auto_181293 ) ) ( not ( = ?auto_181289 ?auto_181290 ) ) ( not ( = ?auto_181289 ?auto_181291 ) ) ( not ( = ?auto_181289 ?auto_181292 ) ) ( not ( = ?auto_181289 ?auto_181293 ) ) ( not ( = ?auto_181290 ?auto_181291 ) ) ( not ( = ?auto_181290 ?auto_181292 ) ) ( not ( = ?auto_181290 ?auto_181293 ) ) ( not ( = ?auto_181291 ?auto_181292 ) ) ( not ( = ?auto_181291 ?auto_181293 ) ) ( not ( = ?auto_181292 ?auto_181293 ) ) ( ON ?auto_181291 ?auto_181292 ) ( ON ?auto_181290 ?auto_181291 ) ( CLEAR ?auto_181288 ) ( ON ?auto_181289 ?auto_181290 ) ( CLEAR ?auto_181289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181285 ?auto_181286 ?auto_181287 ?auto_181288 ?auto_181289 )
      ( MAKE-8PILE ?auto_181285 ?auto_181286 ?auto_181287 ?auto_181288 ?auto_181289 ?auto_181290 ?auto_181291 ?auto_181292 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181302 - BLOCK
      ?auto_181303 - BLOCK
      ?auto_181304 - BLOCK
      ?auto_181305 - BLOCK
      ?auto_181306 - BLOCK
      ?auto_181307 - BLOCK
      ?auto_181308 - BLOCK
      ?auto_181309 - BLOCK
    )
    :vars
    (
      ?auto_181310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181309 ?auto_181310 ) ( ON-TABLE ?auto_181302 ) ( ON ?auto_181303 ?auto_181302 ) ( ON ?auto_181304 ?auto_181303 ) ( ON ?auto_181305 ?auto_181304 ) ( not ( = ?auto_181302 ?auto_181303 ) ) ( not ( = ?auto_181302 ?auto_181304 ) ) ( not ( = ?auto_181302 ?auto_181305 ) ) ( not ( = ?auto_181302 ?auto_181306 ) ) ( not ( = ?auto_181302 ?auto_181307 ) ) ( not ( = ?auto_181302 ?auto_181308 ) ) ( not ( = ?auto_181302 ?auto_181309 ) ) ( not ( = ?auto_181302 ?auto_181310 ) ) ( not ( = ?auto_181303 ?auto_181304 ) ) ( not ( = ?auto_181303 ?auto_181305 ) ) ( not ( = ?auto_181303 ?auto_181306 ) ) ( not ( = ?auto_181303 ?auto_181307 ) ) ( not ( = ?auto_181303 ?auto_181308 ) ) ( not ( = ?auto_181303 ?auto_181309 ) ) ( not ( = ?auto_181303 ?auto_181310 ) ) ( not ( = ?auto_181304 ?auto_181305 ) ) ( not ( = ?auto_181304 ?auto_181306 ) ) ( not ( = ?auto_181304 ?auto_181307 ) ) ( not ( = ?auto_181304 ?auto_181308 ) ) ( not ( = ?auto_181304 ?auto_181309 ) ) ( not ( = ?auto_181304 ?auto_181310 ) ) ( not ( = ?auto_181305 ?auto_181306 ) ) ( not ( = ?auto_181305 ?auto_181307 ) ) ( not ( = ?auto_181305 ?auto_181308 ) ) ( not ( = ?auto_181305 ?auto_181309 ) ) ( not ( = ?auto_181305 ?auto_181310 ) ) ( not ( = ?auto_181306 ?auto_181307 ) ) ( not ( = ?auto_181306 ?auto_181308 ) ) ( not ( = ?auto_181306 ?auto_181309 ) ) ( not ( = ?auto_181306 ?auto_181310 ) ) ( not ( = ?auto_181307 ?auto_181308 ) ) ( not ( = ?auto_181307 ?auto_181309 ) ) ( not ( = ?auto_181307 ?auto_181310 ) ) ( not ( = ?auto_181308 ?auto_181309 ) ) ( not ( = ?auto_181308 ?auto_181310 ) ) ( not ( = ?auto_181309 ?auto_181310 ) ) ( ON ?auto_181308 ?auto_181309 ) ( ON ?auto_181307 ?auto_181308 ) ( CLEAR ?auto_181305 ) ( ON ?auto_181306 ?auto_181307 ) ( CLEAR ?auto_181306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181302 ?auto_181303 ?auto_181304 ?auto_181305 ?auto_181306 )
      ( MAKE-8PILE ?auto_181302 ?auto_181303 ?auto_181304 ?auto_181305 ?auto_181306 ?auto_181307 ?auto_181308 ?auto_181309 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181319 - BLOCK
      ?auto_181320 - BLOCK
      ?auto_181321 - BLOCK
      ?auto_181322 - BLOCK
      ?auto_181323 - BLOCK
      ?auto_181324 - BLOCK
      ?auto_181325 - BLOCK
      ?auto_181326 - BLOCK
    )
    :vars
    (
      ?auto_181327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181326 ?auto_181327 ) ( ON-TABLE ?auto_181319 ) ( ON ?auto_181320 ?auto_181319 ) ( ON ?auto_181321 ?auto_181320 ) ( not ( = ?auto_181319 ?auto_181320 ) ) ( not ( = ?auto_181319 ?auto_181321 ) ) ( not ( = ?auto_181319 ?auto_181322 ) ) ( not ( = ?auto_181319 ?auto_181323 ) ) ( not ( = ?auto_181319 ?auto_181324 ) ) ( not ( = ?auto_181319 ?auto_181325 ) ) ( not ( = ?auto_181319 ?auto_181326 ) ) ( not ( = ?auto_181319 ?auto_181327 ) ) ( not ( = ?auto_181320 ?auto_181321 ) ) ( not ( = ?auto_181320 ?auto_181322 ) ) ( not ( = ?auto_181320 ?auto_181323 ) ) ( not ( = ?auto_181320 ?auto_181324 ) ) ( not ( = ?auto_181320 ?auto_181325 ) ) ( not ( = ?auto_181320 ?auto_181326 ) ) ( not ( = ?auto_181320 ?auto_181327 ) ) ( not ( = ?auto_181321 ?auto_181322 ) ) ( not ( = ?auto_181321 ?auto_181323 ) ) ( not ( = ?auto_181321 ?auto_181324 ) ) ( not ( = ?auto_181321 ?auto_181325 ) ) ( not ( = ?auto_181321 ?auto_181326 ) ) ( not ( = ?auto_181321 ?auto_181327 ) ) ( not ( = ?auto_181322 ?auto_181323 ) ) ( not ( = ?auto_181322 ?auto_181324 ) ) ( not ( = ?auto_181322 ?auto_181325 ) ) ( not ( = ?auto_181322 ?auto_181326 ) ) ( not ( = ?auto_181322 ?auto_181327 ) ) ( not ( = ?auto_181323 ?auto_181324 ) ) ( not ( = ?auto_181323 ?auto_181325 ) ) ( not ( = ?auto_181323 ?auto_181326 ) ) ( not ( = ?auto_181323 ?auto_181327 ) ) ( not ( = ?auto_181324 ?auto_181325 ) ) ( not ( = ?auto_181324 ?auto_181326 ) ) ( not ( = ?auto_181324 ?auto_181327 ) ) ( not ( = ?auto_181325 ?auto_181326 ) ) ( not ( = ?auto_181325 ?auto_181327 ) ) ( not ( = ?auto_181326 ?auto_181327 ) ) ( ON ?auto_181325 ?auto_181326 ) ( ON ?auto_181324 ?auto_181325 ) ( ON ?auto_181323 ?auto_181324 ) ( CLEAR ?auto_181321 ) ( ON ?auto_181322 ?auto_181323 ) ( CLEAR ?auto_181322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181319 ?auto_181320 ?auto_181321 ?auto_181322 )
      ( MAKE-8PILE ?auto_181319 ?auto_181320 ?auto_181321 ?auto_181322 ?auto_181323 ?auto_181324 ?auto_181325 ?auto_181326 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181336 - BLOCK
      ?auto_181337 - BLOCK
      ?auto_181338 - BLOCK
      ?auto_181339 - BLOCK
      ?auto_181340 - BLOCK
      ?auto_181341 - BLOCK
      ?auto_181342 - BLOCK
      ?auto_181343 - BLOCK
    )
    :vars
    (
      ?auto_181344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181343 ?auto_181344 ) ( ON-TABLE ?auto_181336 ) ( ON ?auto_181337 ?auto_181336 ) ( ON ?auto_181338 ?auto_181337 ) ( not ( = ?auto_181336 ?auto_181337 ) ) ( not ( = ?auto_181336 ?auto_181338 ) ) ( not ( = ?auto_181336 ?auto_181339 ) ) ( not ( = ?auto_181336 ?auto_181340 ) ) ( not ( = ?auto_181336 ?auto_181341 ) ) ( not ( = ?auto_181336 ?auto_181342 ) ) ( not ( = ?auto_181336 ?auto_181343 ) ) ( not ( = ?auto_181336 ?auto_181344 ) ) ( not ( = ?auto_181337 ?auto_181338 ) ) ( not ( = ?auto_181337 ?auto_181339 ) ) ( not ( = ?auto_181337 ?auto_181340 ) ) ( not ( = ?auto_181337 ?auto_181341 ) ) ( not ( = ?auto_181337 ?auto_181342 ) ) ( not ( = ?auto_181337 ?auto_181343 ) ) ( not ( = ?auto_181337 ?auto_181344 ) ) ( not ( = ?auto_181338 ?auto_181339 ) ) ( not ( = ?auto_181338 ?auto_181340 ) ) ( not ( = ?auto_181338 ?auto_181341 ) ) ( not ( = ?auto_181338 ?auto_181342 ) ) ( not ( = ?auto_181338 ?auto_181343 ) ) ( not ( = ?auto_181338 ?auto_181344 ) ) ( not ( = ?auto_181339 ?auto_181340 ) ) ( not ( = ?auto_181339 ?auto_181341 ) ) ( not ( = ?auto_181339 ?auto_181342 ) ) ( not ( = ?auto_181339 ?auto_181343 ) ) ( not ( = ?auto_181339 ?auto_181344 ) ) ( not ( = ?auto_181340 ?auto_181341 ) ) ( not ( = ?auto_181340 ?auto_181342 ) ) ( not ( = ?auto_181340 ?auto_181343 ) ) ( not ( = ?auto_181340 ?auto_181344 ) ) ( not ( = ?auto_181341 ?auto_181342 ) ) ( not ( = ?auto_181341 ?auto_181343 ) ) ( not ( = ?auto_181341 ?auto_181344 ) ) ( not ( = ?auto_181342 ?auto_181343 ) ) ( not ( = ?auto_181342 ?auto_181344 ) ) ( not ( = ?auto_181343 ?auto_181344 ) ) ( ON ?auto_181342 ?auto_181343 ) ( ON ?auto_181341 ?auto_181342 ) ( ON ?auto_181340 ?auto_181341 ) ( CLEAR ?auto_181338 ) ( ON ?auto_181339 ?auto_181340 ) ( CLEAR ?auto_181339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181336 ?auto_181337 ?auto_181338 ?auto_181339 )
      ( MAKE-8PILE ?auto_181336 ?auto_181337 ?auto_181338 ?auto_181339 ?auto_181340 ?auto_181341 ?auto_181342 ?auto_181343 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181353 - BLOCK
      ?auto_181354 - BLOCK
      ?auto_181355 - BLOCK
      ?auto_181356 - BLOCK
      ?auto_181357 - BLOCK
      ?auto_181358 - BLOCK
      ?auto_181359 - BLOCK
      ?auto_181360 - BLOCK
    )
    :vars
    (
      ?auto_181361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181360 ?auto_181361 ) ( ON-TABLE ?auto_181353 ) ( ON ?auto_181354 ?auto_181353 ) ( not ( = ?auto_181353 ?auto_181354 ) ) ( not ( = ?auto_181353 ?auto_181355 ) ) ( not ( = ?auto_181353 ?auto_181356 ) ) ( not ( = ?auto_181353 ?auto_181357 ) ) ( not ( = ?auto_181353 ?auto_181358 ) ) ( not ( = ?auto_181353 ?auto_181359 ) ) ( not ( = ?auto_181353 ?auto_181360 ) ) ( not ( = ?auto_181353 ?auto_181361 ) ) ( not ( = ?auto_181354 ?auto_181355 ) ) ( not ( = ?auto_181354 ?auto_181356 ) ) ( not ( = ?auto_181354 ?auto_181357 ) ) ( not ( = ?auto_181354 ?auto_181358 ) ) ( not ( = ?auto_181354 ?auto_181359 ) ) ( not ( = ?auto_181354 ?auto_181360 ) ) ( not ( = ?auto_181354 ?auto_181361 ) ) ( not ( = ?auto_181355 ?auto_181356 ) ) ( not ( = ?auto_181355 ?auto_181357 ) ) ( not ( = ?auto_181355 ?auto_181358 ) ) ( not ( = ?auto_181355 ?auto_181359 ) ) ( not ( = ?auto_181355 ?auto_181360 ) ) ( not ( = ?auto_181355 ?auto_181361 ) ) ( not ( = ?auto_181356 ?auto_181357 ) ) ( not ( = ?auto_181356 ?auto_181358 ) ) ( not ( = ?auto_181356 ?auto_181359 ) ) ( not ( = ?auto_181356 ?auto_181360 ) ) ( not ( = ?auto_181356 ?auto_181361 ) ) ( not ( = ?auto_181357 ?auto_181358 ) ) ( not ( = ?auto_181357 ?auto_181359 ) ) ( not ( = ?auto_181357 ?auto_181360 ) ) ( not ( = ?auto_181357 ?auto_181361 ) ) ( not ( = ?auto_181358 ?auto_181359 ) ) ( not ( = ?auto_181358 ?auto_181360 ) ) ( not ( = ?auto_181358 ?auto_181361 ) ) ( not ( = ?auto_181359 ?auto_181360 ) ) ( not ( = ?auto_181359 ?auto_181361 ) ) ( not ( = ?auto_181360 ?auto_181361 ) ) ( ON ?auto_181359 ?auto_181360 ) ( ON ?auto_181358 ?auto_181359 ) ( ON ?auto_181357 ?auto_181358 ) ( ON ?auto_181356 ?auto_181357 ) ( CLEAR ?auto_181354 ) ( ON ?auto_181355 ?auto_181356 ) ( CLEAR ?auto_181355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181353 ?auto_181354 ?auto_181355 )
      ( MAKE-8PILE ?auto_181353 ?auto_181354 ?auto_181355 ?auto_181356 ?auto_181357 ?auto_181358 ?auto_181359 ?auto_181360 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181370 - BLOCK
      ?auto_181371 - BLOCK
      ?auto_181372 - BLOCK
      ?auto_181373 - BLOCK
      ?auto_181374 - BLOCK
      ?auto_181375 - BLOCK
      ?auto_181376 - BLOCK
      ?auto_181377 - BLOCK
    )
    :vars
    (
      ?auto_181378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181377 ?auto_181378 ) ( ON-TABLE ?auto_181370 ) ( ON ?auto_181371 ?auto_181370 ) ( not ( = ?auto_181370 ?auto_181371 ) ) ( not ( = ?auto_181370 ?auto_181372 ) ) ( not ( = ?auto_181370 ?auto_181373 ) ) ( not ( = ?auto_181370 ?auto_181374 ) ) ( not ( = ?auto_181370 ?auto_181375 ) ) ( not ( = ?auto_181370 ?auto_181376 ) ) ( not ( = ?auto_181370 ?auto_181377 ) ) ( not ( = ?auto_181370 ?auto_181378 ) ) ( not ( = ?auto_181371 ?auto_181372 ) ) ( not ( = ?auto_181371 ?auto_181373 ) ) ( not ( = ?auto_181371 ?auto_181374 ) ) ( not ( = ?auto_181371 ?auto_181375 ) ) ( not ( = ?auto_181371 ?auto_181376 ) ) ( not ( = ?auto_181371 ?auto_181377 ) ) ( not ( = ?auto_181371 ?auto_181378 ) ) ( not ( = ?auto_181372 ?auto_181373 ) ) ( not ( = ?auto_181372 ?auto_181374 ) ) ( not ( = ?auto_181372 ?auto_181375 ) ) ( not ( = ?auto_181372 ?auto_181376 ) ) ( not ( = ?auto_181372 ?auto_181377 ) ) ( not ( = ?auto_181372 ?auto_181378 ) ) ( not ( = ?auto_181373 ?auto_181374 ) ) ( not ( = ?auto_181373 ?auto_181375 ) ) ( not ( = ?auto_181373 ?auto_181376 ) ) ( not ( = ?auto_181373 ?auto_181377 ) ) ( not ( = ?auto_181373 ?auto_181378 ) ) ( not ( = ?auto_181374 ?auto_181375 ) ) ( not ( = ?auto_181374 ?auto_181376 ) ) ( not ( = ?auto_181374 ?auto_181377 ) ) ( not ( = ?auto_181374 ?auto_181378 ) ) ( not ( = ?auto_181375 ?auto_181376 ) ) ( not ( = ?auto_181375 ?auto_181377 ) ) ( not ( = ?auto_181375 ?auto_181378 ) ) ( not ( = ?auto_181376 ?auto_181377 ) ) ( not ( = ?auto_181376 ?auto_181378 ) ) ( not ( = ?auto_181377 ?auto_181378 ) ) ( ON ?auto_181376 ?auto_181377 ) ( ON ?auto_181375 ?auto_181376 ) ( ON ?auto_181374 ?auto_181375 ) ( ON ?auto_181373 ?auto_181374 ) ( CLEAR ?auto_181371 ) ( ON ?auto_181372 ?auto_181373 ) ( CLEAR ?auto_181372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181370 ?auto_181371 ?auto_181372 )
      ( MAKE-8PILE ?auto_181370 ?auto_181371 ?auto_181372 ?auto_181373 ?auto_181374 ?auto_181375 ?auto_181376 ?auto_181377 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181387 - BLOCK
      ?auto_181388 - BLOCK
      ?auto_181389 - BLOCK
      ?auto_181390 - BLOCK
      ?auto_181391 - BLOCK
      ?auto_181392 - BLOCK
      ?auto_181393 - BLOCK
      ?auto_181394 - BLOCK
    )
    :vars
    (
      ?auto_181395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181394 ?auto_181395 ) ( ON-TABLE ?auto_181387 ) ( not ( = ?auto_181387 ?auto_181388 ) ) ( not ( = ?auto_181387 ?auto_181389 ) ) ( not ( = ?auto_181387 ?auto_181390 ) ) ( not ( = ?auto_181387 ?auto_181391 ) ) ( not ( = ?auto_181387 ?auto_181392 ) ) ( not ( = ?auto_181387 ?auto_181393 ) ) ( not ( = ?auto_181387 ?auto_181394 ) ) ( not ( = ?auto_181387 ?auto_181395 ) ) ( not ( = ?auto_181388 ?auto_181389 ) ) ( not ( = ?auto_181388 ?auto_181390 ) ) ( not ( = ?auto_181388 ?auto_181391 ) ) ( not ( = ?auto_181388 ?auto_181392 ) ) ( not ( = ?auto_181388 ?auto_181393 ) ) ( not ( = ?auto_181388 ?auto_181394 ) ) ( not ( = ?auto_181388 ?auto_181395 ) ) ( not ( = ?auto_181389 ?auto_181390 ) ) ( not ( = ?auto_181389 ?auto_181391 ) ) ( not ( = ?auto_181389 ?auto_181392 ) ) ( not ( = ?auto_181389 ?auto_181393 ) ) ( not ( = ?auto_181389 ?auto_181394 ) ) ( not ( = ?auto_181389 ?auto_181395 ) ) ( not ( = ?auto_181390 ?auto_181391 ) ) ( not ( = ?auto_181390 ?auto_181392 ) ) ( not ( = ?auto_181390 ?auto_181393 ) ) ( not ( = ?auto_181390 ?auto_181394 ) ) ( not ( = ?auto_181390 ?auto_181395 ) ) ( not ( = ?auto_181391 ?auto_181392 ) ) ( not ( = ?auto_181391 ?auto_181393 ) ) ( not ( = ?auto_181391 ?auto_181394 ) ) ( not ( = ?auto_181391 ?auto_181395 ) ) ( not ( = ?auto_181392 ?auto_181393 ) ) ( not ( = ?auto_181392 ?auto_181394 ) ) ( not ( = ?auto_181392 ?auto_181395 ) ) ( not ( = ?auto_181393 ?auto_181394 ) ) ( not ( = ?auto_181393 ?auto_181395 ) ) ( not ( = ?auto_181394 ?auto_181395 ) ) ( ON ?auto_181393 ?auto_181394 ) ( ON ?auto_181392 ?auto_181393 ) ( ON ?auto_181391 ?auto_181392 ) ( ON ?auto_181390 ?auto_181391 ) ( ON ?auto_181389 ?auto_181390 ) ( CLEAR ?auto_181387 ) ( ON ?auto_181388 ?auto_181389 ) ( CLEAR ?auto_181388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181387 ?auto_181388 )
      ( MAKE-8PILE ?auto_181387 ?auto_181388 ?auto_181389 ?auto_181390 ?auto_181391 ?auto_181392 ?auto_181393 ?auto_181394 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181404 - BLOCK
      ?auto_181405 - BLOCK
      ?auto_181406 - BLOCK
      ?auto_181407 - BLOCK
      ?auto_181408 - BLOCK
      ?auto_181409 - BLOCK
      ?auto_181410 - BLOCK
      ?auto_181411 - BLOCK
    )
    :vars
    (
      ?auto_181412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181411 ?auto_181412 ) ( ON-TABLE ?auto_181404 ) ( not ( = ?auto_181404 ?auto_181405 ) ) ( not ( = ?auto_181404 ?auto_181406 ) ) ( not ( = ?auto_181404 ?auto_181407 ) ) ( not ( = ?auto_181404 ?auto_181408 ) ) ( not ( = ?auto_181404 ?auto_181409 ) ) ( not ( = ?auto_181404 ?auto_181410 ) ) ( not ( = ?auto_181404 ?auto_181411 ) ) ( not ( = ?auto_181404 ?auto_181412 ) ) ( not ( = ?auto_181405 ?auto_181406 ) ) ( not ( = ?auto_181405 ?auto_181407 ) ) ( not ( = ?auto_181405 ?auto_181408 ) ) ( not ( = ?auto_181405 ?auto_181409 ) ) ( not ( = ?auto_181405 ?auto_181410 ) ) ( not ( = ?auto_181405 ?auto_181411 ) ) ( not ( = ?auto_181405 ?auto_181412 ) ) ( not ( = ?auto_181406 ?auto_181407 ) ) ( not ( = ?auto_181406 ?auto_181408 ) ) ( not ( = ?auto_181406 ?auto_181409 ) ) ( not ( = ?auto_181406 ?auto_181410 ) ) ( not ( = ?auto_181406 ?auto_181411 ) ) ( not ( = ?auto_181406 ?auto_181412 ) ) ( not ( = ?auto_181407 ?auto_181408 ) ) ( not ( = ?auto_181407 ?auto_181409 ) ) ( not ( = ?auto_181407 ?auto_181410 ) ) ( not ( = ?auto_181407 ?auto_181411 ) ) ( not ( = ?auto_181407 ?auto_181412 ) ) ( not ( = ?auto_181408 ?auto_181409 ) ) ( not ( = ?auto_181408 ?auto_181410 ) ) ( not ( = ?auto_181408 ?auto_181411 ) ) ( not ( = ?auto_181408 ?auto_181412 ) ) ( not ( = ?auto_181409 ?auto_181410 ) ) ( not ( = ?auto_181409 ?auto_181411 ) ) ( not ( = ?auto_181409 ?auto_181412 ) ) ( not ( = ?auto_181410 ?auto_181411 ) ) ( not ( = ?auto_181410 ?auto_181412 ) ) ( not ( = ?auto_181411 ?auto_181412 ) ) ( ON ?auto_181410 ?auto_181411 ) ( ON ?auto_181409 ?auto_181410 ) ( ON ?auto_181408 ?auto_181409 ) ( ON ?auto_181407 ?auto_181408 ) ( ON ?auto_181406 ?auto_181407 ) ( CLEAR ?auto_181404 ) ( ON ?auto_181405 ?auto_181406 ) ( CLEAR ?auto_181405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181404 ?auto_181405 )
      ( MAKE-8PILE ?auto_181404 ?auto_181405 ?auto_181406 ?auto_181407 ?auto_181408 ?auto_181409 ?auto_181410 ?auto_181411 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181421 - BLOCK
      ?auto_181422 - BLOCK
      ?auto_181423 - BLOCK
      ?auto_181424 - BLOCK
      ?auto_181425 - BLOCK
      ?auto_181426 - BLOCK
      ?auto_181427 - BLOCK
      ?auto_181428 - BLOCK
    )
    :vars
    (
      ?auto_181429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181428 ?auto_181429 ) ( not ( = ?auto_181421 ?auto_181422 ) ) ( not ( = ?auto_181421 ?auto_181423 ) ) ( not ( = ?auto_181421 ?auto_181424 ) ) ( not ( = ?auto_181421 ?auto_181425 ) ) ( not ( = ?auto_181421 ?auto_181426 ) ) ( not ( = ?auto_181421 ?auto_181427 ) ) ( not ( = ?auto_181421 ?auto_181428 ) ) ( not ( = ?auto_181421 ?auto_181429 ) ) ( not ( = ?auto_181422 ?auto_181423 ) ) ( not ( = ?auto_181422 ?auto_181424 ) ) ( not ( = ?auto_181422 ?auto_181425 ) ) ( not ( = ?auto_181422 ?auto_181426 ) ) ( not ( = ?auto_181422 ?auto_181427 ) ) ( not ( = ?auto_181422 ?auto_181428 ) ) ( not ( = ?auto_181422 ?auto_181429 ) ) ( not ( = ?auto_181423 ?auto_181424 ) ) ( not ( = ?auto_181423 ?auto_181425 ) ) ( not ( = ?auto_181423 ?auto_181426 ) ) ( not ( = ?auto_181423 ?auto_181427 ) ) ( not ( = ?auto_181423 ?auto_181428 ) ) ( not ( = ?auto_181423 ?auto_181429 ) ) ( not ( = ?auto_181424 ?auto_181425 ) ) ( not ( = ?auto_181424 ?auto_181426 ) ) ( not ( = ?auto_181424 ?auto_181427 ) ) ( not ( = ?auto_181424 ?auto_181428 ) ) ( not ( = ?auto_181424 ?auto_181429 ) ) ( not ( = ?auto_181425 ?auto_181426 ) ) ( not ( = ?auto_181425 ?auto_181427 ) ) ( not ( = ?auto_181425 ?auto_181428 ) ) ( not ( = ?auto_181425 ?auto_181429 ) ) ( not ( = ?auto_181426 ?auto_181427 ) ) ( not ( = ?auto_181426 ?auto_181428 ) ) ( not ( = ?auto_181426 ?auto_181429 ) ) ( not ( = ?auto_181427 ?auto_181428 ) ) ( not ( = ?auto_181427 ?auto_181429 ) ) ( not ( = ?auto_181428 ?auto_181429 ) ) ( ON ?auto_181427 ?auto_181428 ) ( ON ?auto_181426 ?auto_181427 ) ( ON ?auto_181425 ?auto_181426 ) ( ON ?auto_181424 ?auto_181425 ) ( ON ?auto_181423 ?auto_181424 ) ( ON ?auto_181422 ?auto_181423 ) ( ON ?auto_181421 ?auto_181422 ) ( CLEAR ?auto_181421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181421 )
      ( MAKE-8PILE ?auto_181421 ?auto_181422 ?auto_181423 ?auto_181424 ?auto_181425 ?auto_181426 ?auto_181427 ?auto_181428 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_181438 - BLOCK
      ?auto_181439 - BLOCK
      ?auto_181440 - BLOCK
      ?auto_181441 - BLOCK
      ?auto_181442 - BLOCK
      ?auto_181443 - BLOCK
      ?auto_181444 - BLOCK
      ?auto_181445 - BLOCK
    )
    :vars
    (
      ?auto_181446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181445 ?auto_181446 ) ( not ( = ?auto_181438 ?auto_181439 ) ) ( not ( = ?auto_181438 ?auto_181440 ) ) ( not ( = ?auto_181438 ?auto_181441 ) ) ( not ( = ?auto_181438 ?auto_181442 ) ) ( not ( = ?auto_181438 ?auto_181443 ) ) ( not ( = ?auto_181438 ?auto_181444 ) ) ( not ( = ?auto_181438 ?auto_181445 ) ) ( not ( = ?auto_181438 ?auto_181446 ) ) ( not ( = ?auto_181439 ?auto_181440 ) ) ( not ( = ?auto_181439 ?auto_181441 ) ) ( not ( = ?auto_181439 ?auto_181442 ) ) ( not ( = ?auto_181439 ?auto_181443 ) ) ( not ( = ?auto_181439 ?auto_181444 ) ) ( not ( = ?auto_181439 ?auto_181445 ) ) ( not ( = ?auto_181439 ?auto_181446 ) ) ( not ( = ?auto_181440 ?auto_181441 ) ) ( not ( = ?auto_181440 ?auto_181442 ) ) ( not ( = ?auto_181440 ?auto_181443 ) ) ( not ( = ?auto_181440 ?auto_181444 ) ) ( not ( = ?auto_181440 ?auto_181445 ) ) ( not ( = ?auto_181440 ?auto_181446 ) ) ( not ( = ?auto_181441 ?auto_181442 ) ) ( not ( = ?auto_181441 ?auto_181443 ) ) ( not ( = ?auto_181441 ?auto_181444 ) ) ( not ( = ?auto_181441 ?auto_181445 ) ) ( not ( = ?auto_181441 ?auto_181446 ) ) ( not ( = ?auto_181442 ?auto_181443 ) ) ( not ( = ?auto_181442 ?auto_181444 ) ) ( not ( = ?auto_181442 ?auto_181445 ) ) ( not ( = ?auto_181442 ?auto_181446 ) ) ( not ( = ?auto_181443 ?auto_181444 ) ) ( not ( = ?auto_181443 ?auto_181445 ) ) ( not ( = ?auto_181443 ?auto_181446 ) ) ( not ( = ?auto_181444 ?auto_181445 ) ) ( not ( = ?auto_181444 ?auto_181446 ) ) ( not ( = ?auto_181445 ?auto_181446 ) ) ( ON ?auto_181444 ?auto_181445 ) ( ON ?auto_181443 ?auto_181444 ) ( ON ?auto_181442 ?auto_181443 ) ( ON ?auto_181441 ?auto_181442 ) ( ON ?auto_181440 ?auto_181441 ) ( ON ?auto_181439 ?auto_181440 ) ( ON ?auto_181438 ?auto_181439 ) ( CLEAR ?auto_181438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181438 )
      ( MAKE-8PILE ?auto_181438 ?auto_181439 ?auto_181440 ?auto_181441 ?auto_181442 ?auto_181443 ?auto_181444 ?auto_181445 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181456 - BLOCK
      ?auto_181457 - BLOCK
      ?auto_181458 - BLOCK
      ?auto_181459 - BLOCK
      ?auto_181460 - BLOCK
      ?auto_181461 - BLOCK
      ?auto_181462 - BLOCK
      ?auto_181463 - BLOCK
      ?auto_181464 - BLOCK
    )
    :vars
    (
      ?auto_181465 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_181463 ) ( ON ?auto_181464 ?auto_181465 ) ( CLEAR ?auto_181464 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181456 ) ( ON ?auto_181457 ?auto_181456 ) ( ON ?auto_181458 ?auto_181457 ) ( ON ?auto_181459 ?auto_181458 ) ( ON ?auto_181460 ?auto_181459 ) ( ON ?auto_181461 ?auto_181460 ) ( ON ?auto_181462 ?auto_181461 ) ( ON ?auto_181463 ?auto_181462 ) ( not ( = ?auto_181456 ?auto_181457 ) ) ( not ( = ?auto_181456 ?auto_181458 ) ) ( not ( = ?auto_181456 ?auto_181459 ) ) ( not ( = ?auto_181456 ?auto_181460 ) ) ( not ( = ?auto_181456 ?auto_181461 ) ) ( not ( = ?auto_181456 ?auto_181462 ) ) ( not ( = ?auto_181456 ?auto_181463 ) ) ( not ( = ?auto_181456 ?auto_181464 ) ) ( not ( = ?auto_181456 ?auto_181465 ) ) ( not ( = ?auto_181457 ?auto_181458 ) ) ( not ( = ?auto_181457 ?auto_181459 ) ) ( not ( = ?auto_181457 ?auto_181460 ) ) ( not ( = ?auto_181457 ?auto_181461 ) ) ( not ( = ?auto_181457 ?auto_181462 ) ) ( not ( = ?auto_181457 ?auto_181463 ) ) ( not ( = ?auto_181457 ?auto_181464 ) ) ( not ( = ?auto_181457 ?auto_181465 ) ) ( not ( = ?auto_181458 ?auto_181459 ) ) ( not ( = ?auto_181458 ?auto_181460 ) ) ( not ( = ?auto_181458 ?auto_181461 ) ) ( not ( = ?auto_181458 ?auto_181462 ) ) ( not ( = ?auto_181458 ?auto_181463 ) ) ( not ( = ?auto_181458 ?auto_181464 ) ) ( not ( = ?auto_181458 ?auto_181465 ) ) ( not ( = ?auto_181459 ?auto_181460 ) ) ( not ( = ?auto_181459 ?auto_181461 ) ) ( not ( = ?auto_181459 ?auto_181462 ) ) ( not ( = ?auto_181459 ?auto_181463 ) ) ( not ( = ?auto_181459 ?auto_181464 ) ) ( not ( = ?auto_181459 ?auto_181465 ) ) ( not ( = ?auto_181460 ?auto_181461 ) ) ( not ( = ?auto_181460 ?auto_181462 ) ) ( not ( = ?auto_181460 ?auto_181463 ) ) ( not ( = ?auto_181460 ?auto_181464 ) ) ( not ( = ?auto_181460 ?auto_181465 ) ) ( not ( = ?auto_181461 ?auto_181462 ) ) ( not ( = ?auto_181461 ?auto_181463 ) ) ( not ( = ?auto_181461 ?auto_181464 ) ) ( not ( = ?auto_181461 ?auto_181465 ) ) ( not ( = ?auto_181462 ?auto_181463 ) ) ( not ( = ?auto_181462 ?auto_181464 ) ) ( not ( = ?auto_181462 ?auto_181465 ) ) ( not ( = ?auto_181463 ?auto_181464 ) ) ( not ( = ?auto_181463 ?auto_181465 ) ) ( not ( = ?auto_181464 ?auto_181465 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181464 ?auto_181465 )
      ( !STACK ?auto_181464 ?auto_181463 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181475 - BLOCK
      ?auto_181476 - BLOCK
      ?auto_181477 - BLOCK
      ?auto_181478 - BLOCK
      ?auto_181479 - BLOCK
      ?auto_181480 - BLOCK
      ?auto_181481 - BLOCK
      ?auto_181482 - BLOCK
      ?auto_181483 - BLOCK
    )
    :vars
    (
      ?auto_181484 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_181482 ) ( ON ?auto_181483 ?auto_181484 ) ( CLEAR ?auto_181483 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181475 ) ( ON ?auto_181476 ?auto_181475 ) ( ON ?auto_181477 ?auto_181476 ) ( ON ?auto_181478 ?auto_181477 ) ( ON ?auto_181479 ?auto_181478 ) ( ON ?auto_181480 ?auto_181479 ) ( ON ?auto_181481 ?auto_181480 ) ( ON ?auto_181482 ?auto_181481 ) ( not ( = ?auto_181475 ?auto_181476 ) ) ( not ( = ?auto_181475 ?auto_181477 ) ) ( not ( = ?auto_181475 ?auto_181478 ) ) ( not ( = ?auto_181475 ?auto_181479 ) ) ( not ( = ?auto_181475 ?auto_181480 ) ) ( not ( = ?auto_181475 ?auto_181481 ) ) ( not ( = ?auto_181475 ?auto_181482 ) ) ( not ( = ?auto_181475 ?auto_181483 ) ) ( not ( = ?auto_181475 ?auto_181484 ) ) ( not ( = ?auto_181476 ?auto_181477 ) ) ( not ( = ?auto_181476 ?auto_181478 ) ) ( not ( = ?auto_181476 ?auto_181479 ) ) ( not ( = ?auto_181476 ?auto_181480 ) ) ( not ( = ?auto_181476 ?auto_181481 ) ) ( not ( = ?auto_181476 ?auto_181482 ) ) ( not ( = ?auto_181476 ?auto_181483 ) ) ( not ( = ?auto_181476 ?auto_181484 ) ) ( not ( = ?auto_181477 ?auto_181478 ) ) ( not ( = ?auto_181477 ?auto_181479 ) ) ( not ( = ?auto_181477 ?auto_181480 ) ) ( not ( = ?auto_181477 ?auto_181481 ) ) ( not ( = ?auto_181477 ?auto_181482 ) ) ( not ( = ?auto_181477 ?auto_181483 ) ) ( not ( = ?auto_181477 ?auto_181484 ) ) ( not ( = ?auto_181478 ?auto_181479 ) ) ( not ( = ?auto_181478 ?auto_181480 ) ) ( not ( = ?auto_181478 ?auto_181481 ) ) ( not ( = ?auto_181478 ?auto_181482 ) ) ( not ( = ?auto_181478 ?auto_181483 ) ) ( not ( = ?auto_181478 ?auto_181484 ) ) ( not ( = ?auto_181479 ?auto_181480 ) ) ( not ( = ?auto_181479 ?auto_181481 ) ) ( not ( = ?auto_181479 ?auto_181482 ) ) ( not ( = ?auto_181479 ?auto_181483 ) ) ( not ( = ?auto_181479 ?auto_181484 ) ) ( not ( = ?auto_181480 ?auto_181481 ) ) ( not ( = ?auto_181480 ?auto_181482 ) ) ( not ( = ?auto_181480 ?auto_181483 ) ) ( not ( = ?auto_181480 ?auto_181484 ) ) ( not ( = ?auto_181481 ?auto_181482 ) ) ( not ( = ?auto_181481 ?auto_181483 ) ) ( not ( = ?auto_181481 ?auto_181484 ) ) ( not ( = ?auto_181482 ?auto_181483 ) ) ( not ( = ?auto_181482 ?auto_181484 ) ) ( not ( = ?auto_181483 ?auto_181484 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181483 ?auto_181484 )
      ( !STACK ?auto_181483 ?auto_181482 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181494 - BLOCK
      ?auto_181495 - BLOCK
      ?auto_181496 - BLOCK
      ?auto_181497 - BLOCK
      ?auto_181498 - BLOCK
      ?auto_181499 - BLOCK
      ?auto_181500 - BLOCK
      ?auto_181501 - BLOCK
      ?auto_181502 - BLOCK
    )
    :vars
    (
      ?auto_181503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181502 ?auto_181503 ) ( ON-TABLE ?auto_181494 ) ( ON ?auto_181495 ?auto_181494 ) ( ON ?auto_181496 ?auto_181495 ) ( ON ?auto_181497 ?auto_181496 ) ( ON ?auto_181498 ?auto_181497 ) ( ON ?auto_181499 ?auto_181498 ) ( ON ?auto_181500 ?auto_181499 ) ( not ( = ?auto_181494 ?auto_181495 ) ) ( not ( = ?auto_181494 ?auto_181496 ) ) ( not ( = ?auto_181494 ?auto_181497 ) ) ( not ( = ?auto_181494 ?auto_181498 ) ) ( not ( = ?auto_181494 ?auto_181499 ) ) ( not ( = ?auto_181494 ?auto_181500 ) ) ( not ( = ?auto_181494 ?auto_181501 ) ) ( not ( = ?auto_181494 ?auto_181502 ) ) ( not ( = ?auto_181494 ?auto_181503 ) ) ( not ( = ?auto_181495 ?auto_181496 ) ) ( not ( = ?auto_181495 ?auto_181497 ) ) ( not ( = ?auto_181495 ?auto_181498 ) ) ( not ( = ?auto_181495 ?auto_181499 ) ) ( not ( = ?auto_181495 ?auto_181500 ) ) ( not ( = ?auto_181495 ?auto_181501 ) ) ( not ( = ?auto_181495 ?auto_181502 ) ) ( not ( = ?auto_181495 ?auto_181503 ) ) ( not ( = ?auto_181496 ?auto_181497 ) ) ( not ( = ?auto_181496 ?auto_181498 ) ) ( not ( = ?auto_181496 ?auto_181499 ) ) ( not ( = ?auto_181496 ?auto_181500 ) ) ( not ( = ?auto_181496 ?auto_181501 ) ) ( not ( = ?auto_181496 ?auto_181502 ) ) ( not ( = ?auto_181496 ?auto_181503 ) ) ( not ( = ?auto_181497 ?auto_181498 ) ) ( not ( = ?auto_181497 ?auto_181499 ) ) ( not ( = ?auto_181497 ?auto_181500 ) ) ( not ( = ?auto_181497 ?auto_181501 ) ) ( not ( = ?auto_181497 ?auto_181502 ) ) ( not ( = ?auto_181497 ?auto_181503 ) ) ( not ( = ?auto_181498 ?auto_181499 ) ) ( not ( = ?auto_181498 ?auto_181500 ) ) ( not ( = ?auto_181498 ?auto_181501 ) ) ( not ( = ?auto_181498 ?auto_181502 ) ) ( not ( = ?auto_181498 ?auto_181503 ) ) ( not ( = ?auto_181499 ?auto_181500 ) ) ( not ( = ?auto_181499 ?auto_181501 ) ) ( not ( = ?auto_181499 ?auto_181502 ) ) ( not ( = ?auto_181499 ?auto_181503 ) ) ( not ( = ?auto_181500 ?auto_181501 ) ) ( not ( = ?auto_181500 ?auto_181502 ) ) ( not ( = ?auto_181500 ?auto_181503 ) ) ( not ( = ?auto_181501 ?auto_181502 ) ) ( not ( = ?auto_181501 ?auto_181503 ) ) ( not ( = ?auto_181502 ?auto_181503 ) ) ( CLEAR ?auto_181500 ) ( ON ?auto_181501 ?auto_181502 ) ( CLEAR ?auto_181501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181494 ?auto_181495 ?auto_181496 ?auto_181497 ?auto_181498 ?auto_181499 ?auto_181500 ?auto_181501 )
      ( MAKE-9PILE ?auto_181494 ?auto_181495 ?auto_181496 ?auto_181497 ?auto_181498 ?auto_181499 ?auto_181500 ?auto_181501 ?auto_181502 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181513 - BLOCK
      ?auto_181514 - BLOCK
      ?auto_181515 - BLOCK
      ?auto_181516 - BLOCK
      ?auto_181517 - BLOCK
      ?auto_181518 - BLOCK
      ?auto_181519 - BLOCK
      ?auto_181520 - BLOCK
      ?auto_181521 - BLOCK
    )
    :vars
    (
      ?auto_181522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181521 ?auto_181522 ) ( ON-TABLE ?auto_181513 ) ( ON ?auto_181514 ?auto_181513 ) ( ON ?auto_181515 ?auto_181514 ) ( ON ?auto_181516 ?auto_181515 ) ( ON ?auto_181517 ?auto_181516 ) ( ON ?auto_181518 ?auto_181517 ) ( ON ?auto_181519 ?auto_181518 ) ( not ( = ?auto_181513 ?auto_181514 ) ) ( not ( = ?auto_181513 ?auto_181515 ) ) ( not ( = ?auto_181513 ?auto_181516 ) ) ( not ( = ?auto_181513 ?auto_181517 ) ) ( not ( = ?auto_181513 ?auto_181518 ) ) ( not ( = ?auto_181513 ?auto_181519 ) ) ( not ( = ?auto_181513 ?auto_181520 ) ) ( not ( = ?auto_181513 ?auto_181521 ) ) ( not ( = ?auto_181513 ?auto_181522 ) ) ( not ( = ?auto_181514 ?auto_181515 ) ) ( not ( = ?auto_181514 ?auto_181516 ) ) ( not ( = ?auto_181514 ?auto_181517 ) ) ( not ( = ?auto_181514 ?auto_181518 ) ) ( not ( = ?auto_181514 ?auto_181519 ) ) ( not ( = ?auto_181514 ?auto_181520 ) ) ( not ( = ?auto_181514 ?auto_181521 ) ) ( not ( = ?auto_181514 ?auto_181522 ) ) ( not ( = ?auto_181515 ?auto_181516 ) ) ( not ( = ?auto_181515 ?auto_181517 ) ) ( not ( = ?auto_181515 ?auto_181518 ) ) ( not ( = ?auto_181515 ?auto_181519 ) ) ( not ( = ?auto_181515 ?auto_181520 ) ) ( not ( = ?auto_181515 ?auto_181521 ) ) ( not ( = ?auto_181515 ?auto_181522 ) ) ( not ( = ?auto_181516 ?auto_181517 ) ) ( not ( = ?auto_181516 ?auto_181518 ) ) ( not ( = ?auto_181516 ?auto_181519 ) ) ( not ( = ?auto_181516 ?auto_181520 ) ) ( not ( = ?auto_181516 ?auto_181521 ) ) ( not ( = ?auto_181516 ?auto_181522 ) ) ( not ( = ?auto_181517 ?auto_181518 ) ) ( not ( = ?auto_181517 ?auto_181519 ) ) ( not ( = ?auto_181517 ?auto_181520 ) ) ( not ( = ?auto_181517 ?auto_181521 ) ) ( not ( = ?auto_181517 ?auto_181522 ) ) ( not ( = ?auto_181518 ?auto_181519 ) ) ( not ( = ?auto_181518 ?auto_181520 ) ) ( not ( = ?auto_181518 ?auto_181521 ) ) ( not ( = ?auto_181518 ?auto_181522 ) ) ( not ( = ?auto_181519 ?auto_181520 ) ) ( not ( = ?auto_181519 ?auto_181521 ) ) ( not ( = ?auto_181519 ?auto_181522 ) ) ( not ( = ?auto_181520 ?auto_181521 ) ) ( not ( = ?auto_181520 ?auto_181522 ) ) ( not ( = ?auto_181521 ?auto_181522 ) ) ( CLEAR ?auto_181519 ) ( ON ?auto_181520 ?auto_181521 ) ( CLEAR ?auto_181520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181513 ?auto_181514 ?auto_181515 ?auto_181516 ?auto_181517 ?auto_181518 ?auto_181519 ?auto_181520 )
      ( MAKE-9PILE ?auto_181513 ?auto_181514 ?auto_181515 ?auto_181516 ?auto_181517 ?auto_181518 ?auto_181519 ?auto_181520 ?auto_181521 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181532 - BLOCK
      ?auto_181533 - BLOCK
      ?auto_181534 - BLOCK
      ?auto_181535 - BLOCK
      ?auto_181536 - BLOCK
      ?auto_181537 - BLOCK
      ?auto_181538 - BLOCK
      ?auto_181539 - BLOCK
      ?auto_181540 - BLOCK
    )
    :vars
    (
      ?auto_181541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181540 ?auto_181541 ) ( ON-TABLE ?auto_181532 ) ( ON ?auto_181533 ?auto_181532 ) ( ON ?auto_181534 ?auto_181533 ) ( ON ?auto_181535 ?auto_181534 ) ( ON ?auto_181536 ?auto_181535 ) ( ON ?auto_181537 ?auto_181536 ) ( not ( = ?auto_181532 ?auto_181533 ) ) ( not ( = ?auto_181532 ?auto_181534 ) ) ( not ( = ?auto_181532 ?auto_181535 ) ) ( not ( = ?auto_181532 ?auto_181536 ) ) ( not ( = ?auto_181532 ?auto_181537 ) ) ( not ( = ?auto_181532 ?auto_181538 ) ) ( not ( = ?auto_181532 ?auto_181539 ) ) ( not ( = ?auto_181532 ?auto_181540 ) ) ( not ( = ?auto_181532 ?auto_181541 ) ) ( not ( = ?auto_181533 ?auto_181534 ) ) ( not ( = ?auto_181533 ?auto_181535 ) ) ( not ( = ?auto_181533 ?auto_181536 ) ) ( not ( = ?auto_181533 ?auto_181537 ) ) ( not ( = ?auto_181533 ?auto_181538 ) ) ( not ( = ?auto_181533 ?auto_181539 ) ) ( not ( = ?auto_181533 ?auto_181540 ) ) ( not ( = ?auto_181533 ?auto_181541 ) ) ( not ( = ?auto_181534 ?auto_181535 ) ) ( not ( = ?auto_181534 ?auto_181536 ) ) ( not ( = ?auto_181534 ?auto_181537 ) ) ( not ( = ?auto_181534 ?auto_181538 ) ) ( not ( = ?auto_181534 ?auto_181539 ) ) ( not ( = ?auto_181534 ?auto_181540 ) ) ( not ( = ?auto_181534 ?auto_181541 ) ) ( not ( = ?auto_181535 ?auto_181536 ) ) ( not ( = ?auto_181535 ?auto_181537 ) ) ( not ( = ?auto_181535 ?auto_181538 ) ) ( not ( = ?auto_181535 ?auto_181539 ) ) ( not ( = ?auto_181535 ?auto_181540 ) ) ( not ( = ?auto_181535 ?auto_181541 ) ) ( not ( = ?auto_181536 ?auto_181537 ) ) ( not ( = ?auto_181536 ?auto_181538 ) ) ( not ( = ?auto_181536 ?auto_181539 ) ) ( not ( = ?auto_181536 ?auto_181540 ) ) ( not ( = ?auto_181536 ?auto_181541 ) ) ( not ( = ?auto_181537 ?auto_181538 ) ) ( not ( = ?auto_181537 ?auto_181539 ) ) ( not ( = ?auto_181537 ?auto_181540 ) ) ( not ( = ?auto_181537 ?auto_181541 ) ) ( not ( = ?auto_181538 ?auto_181539 ) ) ( not ( = ?auto_181538 ?auto_181540 ) ) ( not ( = ?auto_181538 ?auto_181541 ) ) ( not ( = ?auto_181539 ?auto_181540 ) ) ( not ( = ?auto_181539 ?auto_181541 ) ) ( not ( = ?auto_181540 ?auto_181541 ) ) ( ON ?auto_181539 ?auto_181540 ) ( CLEAR ?auto_181537 ) ( ON ?auto_181538 ?auto_181539 ) ( CLEAR ?auto_181538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181532 ?auto_181533 ?auto_181534 ?auto_181535 ?auto_181536 ?auto_181537 ?auto_181538 )
      ( MAKE-9PILE ?auto_181532 ?auto_181533 ?auto_181534 ?auto_181535 ?auto_181536 ?auto_181537 ?auto_181538 ?auto_181539 ?auto_181540 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181551 - BLOCK
      ?auto_181552 - BLOCK
      ?auto_181553 - BLOCK
      ?auto_181554 - BLOCK
      ?auto_181555 - BLOCK
      ?auto_181556 - BLOCK
      ?auto_181557 - BLOCK
      ?auto_181558 - BLOCK
      ?auto_181559 - BLOCK
    )
    :vars
    (
      ?auto_181560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181559 ?auto_181560 ) ( ON-TABLE ?auto_181551 ) ( ON ?auto_181552 ?auto_181551 ) ( ON ?auto_181553 ?auto_181552 ) ( ON ?auto_181554 ?auto_181553 ) ( ON ?auto_181555 ?auto_181554 ) ( ON ?auto_181556 ?auto_181555 ) ( not ( = ?auto_181551 ?auto_181552 ) ) ( not ( = ?auto_181551 ?auto_181553 ) ) ( not ( = ?auto_181551 ?auto_181554 ) ) ( not ( = ?auto_181551 ?auto_181555 ) ) ( not ( = ?auto_181551 ?auto_181556 ) ) ( not ( = ?auto_181551 ?auto_181557 ) ) ( not ( = ?auto_181551 ?auto_181558 ) ) ( not ( = ?auto_181551 ?auto_181559 ) ) ( not ( = ?auto_181551 ?auto_181560 ) ) ( not ( = ?auto_181552 ?auto_181553 ) ) ( not ( = ?auto_181552 ?auto_181554 ) ) ( not ( = ?auto_181552 ?auto_181555 ) ) ( not ( = ?auto_181552 ?auto_181556 ) ) ( not ( = ?auto_181552 ?auto_181557 ) ) ( not ( = ?auto_181552 ?auto_181558 ) ) ( not ( = ?auto_181552 ?auto_181559 ) ) ( not ( = ?auto_181552 ?auto_181560 ) ) ( not ( = ?auto_181553 ?auto_181554 ) ) ( not ( = ?auto_181553 ?auto_181555 ) ) ( not ( = ?auto_181553 ?auto_181556 ) ) ( not ( = ?auto_181553 ?auto_181557 ) ) ( not ( = ?auto_181553 ?auto_181558 ) ) ( not ( = ?auto_181553 ?auto_181559 ) ) ( not ( = ?auto_181553 ?auto_181560 ) ) ( not ( = ?auto_181554 ?auto_181555 ) ) ( not ( = ?auto_181554 ?auto_181556 ) ) ( not ( = ?auto_181554 ?auto_181557 ) ) ( not ( = ?auto_181554 ?auto_181558 ) ) ( not ( = ?auto_181554 ?auto_181559 ) ) ( not ( = ?auto_181554 ?auto_181560 ) ) ( not ( = ?auto_181555 ?auto_181556 ) ) ( not ( = ?auto_181555 ?auto_181557 ) ) ( not ( = ?auto_181555 ?auto_181558 ) ) ( not ( = ?auto_181555 ?auto_181559 ) ) ( not ( = ?auto_181555 ?auto_181560 ) ) ( not ( = ?auto_181556 ?auto_181557 ) ) ( not ( = ?auto_181556 ?auto_181558 ) ) ( not ( = ?auto_181556 ?auto_181559 ) ) ( not ( = ?auto_181556 ?auto_181560 ) ) ( not ( = ?auto_181557 ?auto_181558 ) ) ( not ( = ?auto_181557 ?auto_181559 ) ) ( not ( = ?auto_181557 ?auto_181560 ) ) ( not ( = ?auto_181558 ?auto_181559 ) ) ( not ( = ?auto_181558 ?auto_181560 ) ) ( not ( = ?auto_181559 ?auto_181560 ) ) ( ON ?auto_181558 ?auto_181559 ) ( CLEAR ?auto_181556 ) ( ON ?auto_181557 ?auto_181558 ) ( CLEAR ?auto_181557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181551 ?auto_181552 ?auto_181553 ?auto_181554 ?auto_181555 ?auto_181556 ?auto_181557 )
      ( MAKE-9PILE ?auto_181551 ?auto_181552 ?auto_181553 ?auto_181554 ?auto_181555 ?auto_181556 ?auto_181557 ?auto_181558 ?auto_181559 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181570 - BLOCK
      ?auto_181571 - BLOCK
      ?auto_181572 - BLOCK
      ?auto_181573 - BLOCK
      ?auto_181574 - BLOCK
      ?auto_181575 - BLOCK
      ?auto_181576 - BLOCK
      ?auto_181577 - BLOCK
      ?auto_181578 - BLOCK
    )
    :vars
    (
      ?auto_181579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181578 ?auto_181579 ) ( ON-TABLE ?auto_181570 ) ( ON ?auto_181571 ?auto_181570 ) ( ON ?auto_181572 ?auto_181571 ) ( ON ?auto_181573 ?auto_181572 ) ( ON ?auto_181574 ?auto_181573 ) ( not ( = ?auto_181570 ?auto_181571 ) ) ( not ( = ?auto_181570 ?auto_181572 ) ) ( not ( = ?auto_181570 ?auto_181573 ) ) ( not ( = ?auto_181570 ?auto_181574 ) ) ( not ( = ?auto_181570 ?auto_181575 ) ) ( not ( = ?auto_181570 ?auto_181576 ) ) ( not ( = ?auto_181570 ?auto_181577 ) ) ( not ( = ?auto_181570 ?auto_181578 ) ) ( not ( = ?auto_181570 ?auto_181579 ) ) ( not ( = ?auto_181571 ?auto_181572 ) ) ( not ( = ?auto_181571 ?auto_181573 ) ) ( not ( = ?auto_181571 ?auto_181574 ) ) ( not ( = ?auto_181571 ?auto_181575 ) ) ( not ( = ?auto_181571 ?auto_181576 ) ) ( not ( = ?auto_181571 ?auto_181577 ) ) ( not ( = ?auto_181571 ?auto_181578 ) ) ( not ( = ?auto_181571 ?auto_181579 ) ) ( not ( = ?auto_181572 ?auto_181573 ) ) ( not ( = ?auto_181572 ?auto_181574 ) ) ( not ( = ?auto_181572 ?auto_181575 ) ) ( not ( = ?auto_181572 ?auto_181576 ) ) ( not ( = ?auto_181572 ?auto_181577 ) ) ( not ( = ?auto_181572 ?auto_181578 ) ) ( not ( = ?auto_181572 ?auto_181579 ) ) ( not ( = ?auto_181573 ?auto_181574 ) ) ( not ( = ?auto_181573 ?auto_181575 ) ) ( not ( = ?auto_181573 ?auto_181576 ) ) ( not ( = ?auto_181573 ?auto_181577 ) ) ( not ( = ?auto_181573 ?auto_181578 ) ) ( not ( = ?auto_181573 ?auto_181579 ) ) ( not ( = ?auto_181574 ?auto_181575 ) ) ( not ( = ?auto_181574 ?auto_181576 ) ) ( not ( = ?auto_181574 ?auto_181577 ) ) ( not ( = ?auto_181574 ?auto_181578 ) ) ( not ( = ?auto_181574 ?auto_181579 ) ) ( not ( = ?auto_181575 ?auto_181576 ) ) ( not ( = ?auto_181575 ?auto_181577 ) ) ( not ( = ?auto_181575 ?auto_181578 ) ) ( not ( = ?auto_181575 ?auto_181579 ) ) ( not ( = ?auto_181576 ?auto_181577 ) ) ( not ( = ?auto_181576 ?auto_181578 ) ) ( not ( = ?auto_181576 ?auto_181579 ) ) ( not ( = ?auto_181577 ?auto_181578 ) ) ( not ( = ?auto_181577 ?auto_181579 ) ) ( not ( = ?auto_181578 ?auto_181579 ) ) ( ON ?auto_181577 ?auto_181578 ) ( ON ?auto_181576 ?auto_181577 ) ( CLEAR ?auto_181574 ) ( ON ?auto_181575 ?auto_181576 ) ( CLEAR ?auto_181575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181570 ?auto_181571 ?auto_181572 ?auto_181573 ?auto_181574 ?auto_181575 )
      ( MAKE-9PILE ?auto_181570 ?auto_181571 ?auto_181572 ?auto_181573 ?auto_181574 ?auto_181575 ?auto_181576 ?auto_181577 ?auto_181578 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181589 - BLOCK
      ?auto_181590 - BLOCK
      ?auto_181591 - BLOCK
      ?auto_181592 - BLOCK
      ?auto_181593 - BLOCK
      ?auto_181594 - BLOCK
      ?auto_181595 - BLOCK
      ?auto_181596 - BLOCK
      ?auto_181597 - BLOCK
    )
    :vars
    (
      ?auto_181598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181597 ?auto_181598 ) ( ON-TABLE ?auto_181589 ) ( ON ?auto_181590 ?auto_181589 ) ( ON ?auto_181591 ?auto_181590 ) ( ON ?auto_181592 ?auto_181591 ) ( ON ?auto_181593 ?auto_181592 ) ( not ( = ?auto_181589 ?auto_181590 ) ) ( not ( = ?auto_181589 ?auto_181591 ) ) ( not ( = ?auto_181589 ?auto_181592 ) ) ( not ( = ?auto_181589 ?auto_181593 ) ) ( not ( = ?auto_181589 ?auto_181594 ) ) ( not ( = ?auto_181589 ?auto_181595 ) ) ( not ( = ?auto_181589 ?auto_181596 ) ) ( not ( = ?auto_181589 ?auto_181597 ) ) ( not ( = ?auto_181589 ?auto_181598 ) ) ( not ( = ?auto_181590 ?auto_181591 ) ) ( not ( = ?auto_181590 ?auto_181592 ) ) ( not ( = ?auto_181590 ?auto_181593 ) ) ( not ( = ?auto_181590 ?auto_181594 ) ) ( not ( = ?auto_181590 ?auto_181595 ) ) ( not ( = ?auto_181590 ?auto_181596 ) ) ( not ( = ?auto_181590 ?auto_181597 ) ) ( not ( = ?auto_181590 ?auto_181598 ) ) ( not ( = ?auto_181591 ?auto_181592 ) ) ( not ( = ?auto_181591 ?auto_181593 ) ) ( not ( = ?auto_181591 ?auto_181594 ) ) ( not ( = ?auto_181591 ?auto_181595 ) ) ( not ( = ?auto_181591 ?auto_181596 ) ) ( not ( = ?auto_181591 ?auto_181597 ) ) ( not ( = ?auto_181591 ?auto_181598 ) ) ( not ( = ?auto_181592 ?auto_181593 ) ) ( not ( = ?auto_181592 ?auto_181594 ) ) ( not ( = ?auto_181592 ?auto_181595 ) ) ( not ( = ?auto_181592 ?auto_181596 ) ) ( not ( = ?auto_181592 ?auto_181597 ) ) ( not ( = ?auto_181592 ?auto_181598 ) ) ( not ( = ?auto_181593 ?auto_181594 ) ) ( not ( = ?auto_181593 ?auto_181595 ) ) ( not ( = ?auto_181593 ?auto_181596 ) ) ( not ( = ?auto_181593 ?auto_181597 ) ) ( not ( = ?auto_181593 ?auto_181598 ) ) ( not ( = ?auto_181594 ?auto_181595 ) ) ( not ( = ?auto_181594 ?auto_181596 ) ) ( not ( = ?auto_181594 ?auto_181597 ) ) ( not ( = ?auto_181594 ?auto_181598 ) ) ( not ( = ?auto_181595 ?auto_181596 ) ) ( not ( = ?auto_181595 ?auto_181597 ) ) ( not ( = ?auto_181595 ?auto_181598 ) ) ( not ( = ?auto_181596 ?auto_181597 ) ) ( not ( = ?auto_181596 ?auto_181598 ) ) ( not ( = ?auto_181597 ?auto_181598 ) ) ( ON ?auto_181596 ?auto_181597 ) ( ON ?auto_181595 ?auto_181596 ) ( CLEAR ?auto_181593 ) ( ON ?auto_181594 ?auto_181595 ) ( CLEAR ?auto_181594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181589 ?auto_181590 ?auto_181591 ?auto_181592 ?auto_181593 ?auto_181594 )
      ( MAKE-9PILE ?auto_181589 ?auto_181590 ?auto_181591 ?auto_181592 ?auto_181593 ?auto_181594 ?auto_181595 ?auto_181596 ?auto_181597 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181608 - BLOCK
      ?auto_181609 - BLOCK
      ?auto_181610 - BLOCK
      ?auto_181611 - BLOCK
      ?auto_181612 - BLOCK
      ?auto_181613 - BLOCK
      ?auto_181614 - BLOCK
      ?auto_181615 - BLOCK
      ?auto_181616 - BLOCK
    )
    :vars
    (
      ?auto_181617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181616 ?auto_181617 ) ( ON-TABLE ?auto_181608 ) ( ON ?auto_181609 ?auto_181608 ) ( ON ?auto_181610 ?auto_181609 ) ( ON ?auto_181611 ?auto_181610 ) ( not ( = ?auto_181608 ?auto_181609 ) ) ( not ( = ?auto_181608 ?auto_181610 ) ) ( not ( = ?auto_181608 ?auto_181611 ) ) ( not ( = ?auto_181608 ?auto_181612 ) ) ( not ( = ?auto_181608 ?auto_181613 ) ) ( not ( = ?auto_181608 ?auto_181614 ) ) ( not ( = ?auto_181608 ?auto_181615 ) ) ( not ( = ?auto_181608 ?auto_181616 ) ) ( not ( = ?auto_181608 ?auto_181617 ) ) ( not ( = ?auto_181609 ?auto_181610 ) ) ( not ( = ?auto_181609 ?auto_181611 ) ) ( not ( = ?auto_181609 ?auto_181612 ) ) ( not ( = ?auto_181609 ?auto_181613 ) ) ( not ( = ?auto_181609 ?auto_181614 ) ) ( not ( = ?auto_181609 ?auto_181615 ) ) ( not ( = ?auto_181609 ?auto_181616 ) ) ( not ( = ?auto_181609 ?auto_181617 ) ) ( not ( = ?auto_181610 ?auto_181611 ) ) ( not ( = ?auto_181610 ?auto_181612 ) ) ( not ( = ?auto_181610 ?auto_181613 ) ) ( not ( = ?auto_181610 ?auto_181614 ) ) ( not ( = ?auto_181610 ?auto_181615 ) ) ( not ( = ?auto_181610 ?auto_181616 ) ) ( not ( = ?auto_181610 ?auto_181617 ) ) ( not ( = ?auto_181611 ?auto_181612 ) ) ( not ( = ?auto_181611 ?auto_181613 ) ) ( not ( = ?auto_181611 ?auto_181614 ) ) ( not ( = ?auto_181611 ?auto_181615 ) ) ( not ( = ?auto_181611 ?auto_181616 ) ) ( not ( = ?auto_181611 ?auto_181617 ) ) ( not ( = ?auto_181612 ?auto_181613 ) ) ( not ( = ?auto_181612 ?auto_181614 ) ) ( not ( = ?auto_181612 ?auto_181615 ) ) ( not ( = ?auto_181612 ?auto_181616 ) ) ( not ( = ?auto_181612 ?auto_181617 ) ) ( not ( = ?auto_181613 ?auto_181614 ) ) ( not ( = ?auto_181613 ?auto_181615 ) ) ( not ( = ?auto_181613 ?auto_181616 ) ) ( not ( = ?auto_181613 ?auto_181617 ) ) ( not ( = ?auto_181614 ?auto_181615 ) ) ( not ( = ?auto_181614 ?auto_181616 ) ) ( not ( = ?auto_181614 ?auto_181617 ) ) ( not ( = ?auto_181615 ?auto_181616 ) ) ( not ( = ?auto_181615 ?auto_181617 ) ) ( not ( = ?auto_181616 ?auto_181617 ) ) ( ON ?auto_181615 ?auto_181616 ) ( ON ?auto_181614 ?auto_181615 ) ( ON ?auto_181613 ?auto_181614 ) ( CLEAR ?auto_181611 ) ( ON ?auto_181612 ?auto_181613 ) ( CLEAR ?auto_181612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181608 ?auto_181609 ?auto_181610 ?auto_181611 ?auto_181612 )
      ( MAKE-9PILE ?auto_181608 ?auto_181609 ?auto_181610 ?auto_181611 ?auto_181612 ?auto_181613 ?auto_181614 ?auto_181615 ?auto_181616 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181627 - BLOCK
      ?auto_181628 - BLOCK
      ?auto_181629 - BLOCK
      ?auto_181630 - BLOCK
      ?auto_181631 - BLOCK
      ?auto_181632 - BLOCK
      ?auto_181633 - BLOCK
      ?auto_181634 - BLOCK
      ?auto_181635 - BLOCK
    )
    :vars
    (
      ?auto_181636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181635 ?auto_181636 ) ( ON-TABLE ?auto_181627 ) ( ON ?auto_181628 ?auto_181627 ) ( ON ?auto_181629 ?auto_181628 ) ( ON ?auto_181630 ?auto_181629 ) ( not ( = ?auto_181627 ?auto_181628 ) ) ( not ( = ?auto_181627 ?auto_181629 ) ) ( not ( = ?auto_181627 ?auto_181630 ) ) ( not ( = ?auto_181627 ?auto_181631 ) ) ( not ( = ?auto_181627 ?auto_181632 ) ) ( not ( = ?auto_181627 ?auto_181633 ) ) ( not ( = ?auto_181627 ?auto_181634 ) ) ( not ( = ?auto_181627 ?auto_181635 ) ) ( not ( = ?auto_181627 ?auto_181636 ) ) ( not ( = ?auto_181628 ?auto_181629 ) ) ( not ( = ?auto_181628 ?auto_181630 ) ) ( not ( = ?auto_181628 ?auto_181631 ) ) ( not ( = ?auto_181628 ?auto_181632 ) ) ( not ( = ?auto_181628 ?auto_181633 ) ) ( not ( = ?auto_181628 ?auto_181634 ) ) ( not ( = ?auto_181628 ?auto_181635 ) ) ( not ( = ?auto_181628 ?auto_181636 ) ) ( not ( = ?auto_181629 ?auto_181630 ) ) ( not ( = ?auto_181629 ?auto_181631 ) ) ( not ( = ?auto_181629 ?auto_181632 ) ) ( not ( = ?auto_181629 ?auto_181633 ) ) ( not ( = ?auto_181629 ?auto_181634 ) ) ( not ( = ?auto_181629 ?auto_181635 ) ) ( not ( = ?auto_181629 ?auto_181636 ) ) ( not ( = ?auto_181630 ?auto_181631 ) ) ( not ( = ?auto_181630 ?auto_181632 ) ) ( not ( = ?auto_181630 ?auto_181633 ) ) ( not ( = ?auto_181630 ?auto_181634 ) ) ( not ( = ?auto_181630 ?auto_181635 ) ) ( not ( = ?auto_181630 ?auto_181636 ) ) ( not ( = ?auto_181631 ?auto_181632 ) ) ( not ( = ?auto_181631 ?auto_181633 ) ) ( not ( = ?auto_181631 ?auto_181634 ) ) ( not ( = ?auto_181631 ?auto_181635 ) ) ( not ( = ?auto_181631 ?auto_181636 ) ) ( not ( = ?auto_181632 ?auto_181633 ) ) ( not ( = ?auto_181632 ?auto_181634 ) ) ( not ( = ?auto_181632 ?auto_181635 ) ) ( not ( = ?auto_181632 ?auto_181636 ) ) ( not ( = ?auto_181633 ?auto_181634 ) ) ( not ( = ?auto_181633 ?auto_181635 ) ) ( not ( = ?auto_181633 ?auto_181636 ) ) ( not ( = ?auto_181634 ?auto_181635 ) ) ( not ( = ?auto_181634 ?auto_181636 ) ) ( not ( = ?auto_181635 ?auto_181636 ) ) ( ON ?auto_181634 ?auto_181635 ) ( ON ?auto_181633 ?auto_181634 ) ( ON ?auto_181632 ?auto_181633 ) ( CLEAR ?auto_181630 ) ( ON ?auto_181631 ?auto_181632 ) ( CLEAR ?auto_181631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_181627 ?auto_181628 ?auto_181629 ?auto_181630 ?auto_181631 )
      ( MAKE-9PILE ?auto_181627 ?auto_181628 ?auto_181629 ?auto_181630 ?auto_181631 ?auto_181632 ?auto_181633 ?auto_181634 ?auto_181635 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181646 - BLOCK
      ?auto_181647 - BLOCK
      ?auto_181648 - BLOCK
      ?auto_181649 - BLOCK
      ?auto_181650 - BLOCK
      ?auto_181651 - BLOCK
      ?auto_181652 - BLOCK
      ?auto_181653 - BLOCK
      ?auto_181654 - BLOCK
    )
    :vars
    (
      ?auto_181655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181654 ?auto_181655 ) ( ON-TABLE ?auto_181646 ) ( ON ?auto_181647 ?auto_181646 ) ( ON ?auto_181648 ?auto_181647 ) ( not ( = ?auto_181646 ?auto_181647 ) ) ( not ( = ?auto_181646 ?auto_181648 ) ) ( not ( = ?auto_181646 ?auto_181649 ) ) ( not ( = ?auto_181646 ?auto_181650 ) ) ( not ( = ?auto_181646 ?auto_181651 ) ) ( not ( = ?auto_181646 ?auto_181652 ) ) ( not ( = ?auto_181646 ?auto_181653 ) ) ( not ( = ?auto_181646 ?auto_181654 ) ) ( not ( = ?auto_181646 ?auto_181655 ) ) ( not ( = ?auto_181647 ?auto_181648 ) ) ( not ( = ?auto_181647 ?auto_181649 ) ) ( not ( = ?auto_181647 ?auto_181650 ) ) ( not ( = ?auto_181647 ?auto_181651 ) ) ( not ( = ?auto_181647 ?auto_181652 ) ) ( not ( = ?auto_181647 ?auto_181653 ) ) ( not ( = ?auto_181647 ?auto_181654 ) ) ( not ( = ?auto_181647 ?auto_181655 ) ) ( not ( = ?auto_181648 ?auto_181649 ) ) ( not ( = ?auto_181648 ?auto_181650 ) ) ( not ( = ?auto_181648 ?auto_181651 ) ) ( not ( = ?auto_181648 ?auto_181652 ) ) ( not ( = ?auto_181648 ?auto_181653 ) ) ( not ( = ?auto_181648 ?auto_181654 ) ) ( not ( = ?auto_181648 ?auto_181655 ) ) ( not ( = ?auto_181649 ?auto_181650 ) ) ( not ( = ?auto_181649 ?auto_181651 ) ) ( not ( = ?auto_181649 ?auto_181652 ) ) ( not ( = ?auto_181649 ?auto_181653 ) ) ( not ( = ?auto_181649 ?auto_181654 ) ) ( not ( = ?auto_181649 ?auto_181655 ) ) ( not ( = ?auto_181650 ?auto_181651 ) ) ( not ( = ?auto_181650 ?auto_181652 ) ) ( not ( = ?auto_181650 ?auto_181653 ) ) ( not ( = ?auto_181650 ?auto_181654 ) ) ( not ( = ?auto_181650 ?auto_181655 ) ) ( not ( = ?auto_181651 ?auto_181652 ) ) ( not ( = ?auto_181651 ?auto_181653 ) ) ( not ( = ?auto_181651 ?auto_181654 ) ) ( not ( = ?auto_181651 ?auto_181655 ) ) ( not ( = ?auto_181652 ?auto_181653 ) ) ( not ( = ?auto_181652 ?auto_181654 ) ) ( not ( = ?auto_181652 ?auto_181655 ) ) ( not ( = ?auto_181653 ?auto_181654 ) ) ( not ( = ?auto_181653 ?auto_181655 ) ) ( not ( = ?auto_181654 ?auto_181655 ) ) ( ON ?auto_181653 ?auto_181654 ) ( ON ?auto_181652 ?auto_181653 ) ( ON ?auto_181651 ?auto_181652 ) ( ON ?auto_181650 ?auto_181651 ) ( CLEAR ?auto_181648 ) ( ON ?auto_181649 ?auto_181650 ) ( CLEAR ?auto_181649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181646 ?auto_181647 ?auto_181648 ?auto_181649 )
      ( MAKE-9PILE ?auto_181646 ?auto_181647 ?auto_181648 ?auto_181649 ?auto_181650 ?auto_181651 ?auto_181652 ?auto_181653 ?auto_181654 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181665 - BLOCK
      ?auto_181666 - BLOCK
      ?auto_181667 - BLOCK
      ?auto_181668 - BLOCK
      ?auto_181669 - BLOCK
      ?auto_181670 - BLOCK
      ?auto_181671 - BLOCK
      ?auto_181672 - BLOCK
      ?auto_181673 - BLOCK
    )
    :vars
    (
      ?auto_181674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181673 ?auto_181674 ) ( ON-TABLE ?auto_181665 ) ( ON ?auto_181666 ?auto_181665 ) ( ON ?auto_181667 ?auto_181666 ) ( not ( = ?auto_181665 ?auto_181666 ) ) ( not ( = ?auto_181665 ?auto_181667 ) ) ( not ( = ?auto_181665 ?auto_181668 ) ) ( not ( = ?auto_181665 ?auto_181669 ) ) ( not ( = ?auto_181665 ?auto_181670 ) ) ( not ( = ?auto_181665 ?auto_181671 ) ) ( not ( = ?auto_181665 ?auto_181672 ) ) ( not ( = ?auto_181665 ?auto_181673 ) ) ( not ( = ?auto_181665 ?auto_181674 ) ) ( not ( = ?auto_181666 ?auto_181667 ) ) ( not ( = ?auto_181666 ?auto_181668 ) ) ( not ( = ?auto_181666 ?auto_181669 ) ) ( not ( = ?auto_181666 ?auto_181670 ) ) ( not ( = ?auto_181666 ?auto_181671 ) ) ( not ( = ?auto_181666 ?auto_181672 ) ) ( not ( = ?auto_181666 ?auto_181673 ) ) ( not ( = ?auto_181666 ?auto_181674 ) ) ( not ( = ?auto_181667 ?auto_181668 ) ) ( not ( = ?auto_181667 ?auto_181669 ) ) ( not ( = ?auto_181667 ?auto_181670 ) ) ( not ( = ?auto_181667 ?auto_181671 ) ) ( not ( = ?auto_181667 ?auto_181672 ) ) ( not ( = ?auto_181667 ?auto_181673 ) ) ( not ( = ?auto_181667 ?auto_181674 ) ) ( not ( = ?auto_181668 ?auto_181669 ) ) ( not ( = ?auto_181668 ?auto_181670 ) ) ( not ( = ?auto_181668 ?auto_181671 ) ) ( not ( = ?auto_181668 ?auto_181672 ) ) ( not ( = ?auto_181668 ?auto_181673 ) ) ( not ( = ?auto_181668 ?auto_181674 ) ) ( not ( = ?auto_181669 ?auto_181670 ) ) ( not ( = ?auto_181669 ?auto_181671 ) ) ( not ( = ?auto_181669 ?auto_181672 ) ) ( not ( = ?auto_181669 ?auto_181673 ) ) ( not ( = ?auto_181669 ?auto_181674 ) ) ( not ( = ?auto_181670 ?auto_181671 ) ) ( not ( = ?auto_181670 ?auto_181672 ) ) ( not ( = ?auto_181670 ?auto_181673 ) ) ( not ( = ?auto_181670 ?auto_181674 ) ) ( not ( = ?auto_181671 ?auto_181672 ) ) ( not ( = ?auto_181671 ?auto_181673 ) ) ( not ( = ?auto_181671 ?auto_181674 ) ) ( not ( = ?auto_181672 ?auto_181673 ) ) ( not ( = ?auto_181672 ?auto_181674 ) ) ( not ( = ?auto_181673 ?auto_181674 ) ) ( ON ?auto_181672 ?auto_181673 ) ( ON ?auto_181671 ?auto_181672 ) ( ON ?auto_181670 ?auto_181671 ) ( ON ?auto_181669 ?auto_181670 ) ( CLEAR ?auto_181667 ) ( ON ?auto_181668 ?auto_181669 ) ( CLEAR ?auto_181668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_181665 ?auto_181666 ?auto_181667 ?auto_181668 )
      ( MAKE-9PILE ?auto_181665 ?auto_181666 ?auto_181667 ?auto_181668 ?auto_181669 ?auto_181670 ?auto_181671 ?auto_181672 ?auto_181673 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181684 - BLOCK
      ?auto_181685 - BLOCK
      ?auto_181686 - BLOCK
      ?auto_181687 - BLOCK
      ?auto_181688 - BLOCK
      ?auto_181689 - BLOCK
      ?auto_181690 - BLOCK
      ?auto_181691 - BLOCK
      ?auto_181692 - BLOCK
    )
    :vars
    (
      ?auto_181693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181692 ?auto_181693 ) ( ON-TABLE ?auto_181684 ) ( ON ?auto_181685 ?auto_181684 ) ( not ( = ?auto_181684 ?auto_181685 ) ) ( not ( = ?auto_181684 ?auto_181686 ) ) ( not ( = ?auto_181684 ?auto_181687 ) ) ( not ( = ?auto_181684 ?auto_181688 ) ) ( not ( = ?auto_181684 ?auto_181689 ) ) ( not ( = ?auto_181684 ?auto_181690 ) ) ( not ( = ?auto_181684 ?auto_181691 ) ) ( not ( = ?auto_181684 ?auto_181692 ) ) ( not ( = ?auto_181684 ?auto_181693 ) ) ( not ( = ?auto_181685 ?auto_181686 ) ) ( not ( = ?auto_181685 ?auto_181687 ) ) ( not ( = ?auto_181685 ?auto_181688 ) ) ( not ( = ?auto_181685 ?auto_181689 ) ) ( not ( = ?auto_181685 ?auto_181690 ) ) ( not ( = ?auto_181685 ?auto_181691 ) ) ( not ( = ?auto_181685 ?auto_181692 ) ) ( not ( = ?auto_181685 ?auto_181693 ) ) ( not ( = ?auto_181686 ?auto_181687 ) ) ( not ( = ?auto_181686 ?auto_181688 ) ) ( not ( = ?auto_181686 ?auto_181689 ) ) ( not ( = ?auto_181686 ?auto_181690 ) ) ( not ( = ?auto_181686 ?auto_181691 ) ) ( not ( = ?auto_181686 ?auto_181692 ) ) ( not ( = ?auto_181686 ?auto_181693 ) ) ( not ( = ?auto_181687 ?auto_181688 ) ) ( not ( = ?auto_181687 ?auto_181689 ) ) ( not ( = ?auto_181687 ?auto_181690 ) ) ( not ( = ?auto_181687 ?auto_181691 ) ) ( not ( = ?auto_181687 ?auto_181692 ) ) ( not ( = ?auto_181687 ?auto_181693 ) ) ( not ( = ?auto_181688 ?auto_181689 ) ) ( not ( = ?auto_181688 ?auto_181690 ) ) ( not ( = ?auto_181688 ?auto_181691 ) ) ( not ( = ?auto_181688 ?auto_181692 ) ) ( not ( = ?auto_181688 ?auto_181693 ) ) ( not ( = ?auto_181689 ?auto_181690 ) ) ( not ( = ?auto_181689 ?auto_181691 ) ) ( not ( = ?auto_181689 ?auto_181692 ) ) ( not ( = ?auto_181689 ?auto_181693 ) ) ( not ( = ?auto_181690 ?auto_181691 ) ) ( not ( = ?auto_181690 ?auto_181692 ) ) ( not ( = ?auto_181690 ?auto_181693 ) ) ( not ( = ?auto_181691 ?auto_181692 ) ) ( not ( = ?auto_181691 ?auto_181693 ) ) ( not ( = ?auto_181692 ?auto_181693 ) ) ( ON ?auto_181691 ?auto_181692 ) ( ON ?auto_181690 ?auto_181691 ) ( ON ?auto_181689 ?auto_181690 ) ( ON ?auto_181688 ?auto_181689 ) ( ON ?auto_181687 ?auto_181688 ) ( CLEAR ?auto_181685 ) ( ON ?auto_181686 ?auto_181687 ) ( CLEAR ?auto_181686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181684 ?auto_181685 ?auto_181686 )
      ( MAKE-9PILE ?auto_181684 ?auto_181685 ?auto_181686 ?auto_181687 ?auto_181688 ?auto_181689 ?auto_181690 ?auto_181691 ?auto_181692 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181703 - BLOCK
      ?auto_181704 - BLOCK
      ?auto_181705 - BLOCK
      ?auto_181706 - BLOCK
      ?auto_181707 - BLOCK
      ?auto_181708 - BLOCK
      ?auto_181709 - BLOCK
      ?auto_181710 - BLOCK
      ?auto_181711 - BLOCK
    )
    :vars
    (
      ?auto_181712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181711 ?auto_181712 ) ( ON-TABLE ?auto_181703 ) ( ON ?auto_181704 ?auto_181703 ) ( not ( = ?auto_181703 ?auto_181704 ) ) ( not ( = ?auto_181703 ?auto_181705 ) ) ( not ( = ?auto_181703 ?auto_181706 ) ) ( not ( = ?auto_181703 ?auto_181707 ) ) ( not ( = ?auto_181703 ?auto_181708 ) ) ( not ( = ?auto_181703 ?auto_181709 ) ) ( not ( = ?auto_181703 ?auto_181710 ) ) ( not ( = ?auto_181703 ?auto_181711 ) ) ( not ( = ?auto_181703 ?auto_181712 ) ) ( not ( = ?auto_181704 ?auto_181705 ) ) ( not ( = ?auto_181704 ?auto_181706 ) ) ( not ( = ?auto_181704 ?auto_181707 ) ) ( not ( = ?auto_181704 ?auto_181708 ) ) ( not ( = ?auto_181704 ?auto_181709 ) ) ( not ( = ?auto_181704 ?auto_181710 ) ) ( not ( = ?auto_181704 ?auto_181711 ) ) ( not ( = ?auto_181704 ?auto_181712 ) ) ( not ( = ?auto_181705 ?auto_181706 ) ) ( not ( = ?auto_181705 ?auto_181707 ) ) ( not ( = ?auto_181705 ?auto_181708 ) ) ( not ( = ?auto_181705 ?auto_181709 ) ) ( not ( = ?auto_181705 ?auto_181710 ) ) ( not ( = ?auto_181705 ?auto_181711 ) ) ( not ( = ?auto_181705 ?auto_181712 ) ) ( not ( = ?auto_181706 ?auto_181707 ) ) ( not ( = ?auto_181706 ?auto_181708 ) ) ( not ( = ?auto_181706 ?auto_181709 ) ) ( not ( = ?auto_181706 ?auto_181710 ) ) ( not ( = ?auto_181706 ?auto_181711 ) ) ( not ( = ?auto_181706 ?auto_181712 ) ) ( not ( = ?auto_181707 ?auto_181708 ) ) ( not ( = ?auto_181707 ?auto_181709 ) ) ( not ( = ?auto_181707 ?auto_181710 ) ) ( not ( = ?auto_181707 ?auto_181711 ) ) ( not ( = ?auto_181707 ?auto_181712 ) ) ( not ( = ?auto_181708 ?auto_181709 ) ) ( not ( = ?auto_181708 ?auto_181710 ) ) ( not ( = ?auto_181708 ?auto_181711 ) ) ( not ( = ?auto_181708 ?auto_181712 ) ) ( not ( = ?auto_181709 ?auto_181710 ) ) ( not ( = ?auto_181709 ?auto_181711 ) ) ( not ( = ?auto_181709 ?auto_181712 ) ) ( not ( = ?auto_181710 ?auto_181711 ) ) ( not ( = ?auto_181710 ?auto_181712 ) ) ( not ( = ?auto_181711 ?auto_181712 ) ) ( ON ?auto_181710 ?auto_181711 ) ( ON ?auto_181709 ?auto_181710 ) ( ON ?auto_181708 ?auto_181709 ) ( ON ?auto_181707 ?auto_181708 ) ( ON ?auto_181706 ?auto_181707 ) ( CLEAR ?auto_181704 ) ( ON ?auto_181705 ?auto_181706 ) ( CLEAR ?auto_181705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_181703 ?auto_181704 ?auto_181705 )
      ( MAKE-9PILE ?auto_181703 ?auto_181704 ?auto_181705 ?auto_181706 ?auto_181707 ?auto_181708 ?auto_181709 ?auto_181710 ?auto_181711 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181722 - BLOCK
      ?auto_181723 - BLOCK
      ?auto_181724 - BLOCK
      ?auto_181725 - BLOCK
      ?auto_181726 - BLOCK
      ?auto_181727 - BLOCK
      ?auto_181728 - BLOCK
      ?auto_181729 - BLOCK
      ?auto_181730 - BLOCK
    )
    :vars
    (
      ?auto_181731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181730 ?auto_181731 ) ( ON-TABLE ?auto_181722 ) ( not ( = ?auto_181722 ?auto_181723 ) ) ( not ( = ?auto_181722 ?auto_181724 ) ) ( not ( = ?auto_181722 ?auto_181725 ) ) ( not ( = ?auto_181722 ?auto_181726 ) ) ( not ( = ?auto_181722 ?auto_181727 ) ) ( not ( = ?auto_181722 ?auto_181728 ) ) ( not ( = ?auto_181722 ?auto_181729 ) ) ( not ( = ?auto_181722 ?auto_181730 ) ) ( not ( = ?auto_181722 ?auto_181731 ) ) ( not ( = ?auto_181723 ?auto_181724 ) ) ( not ( = ?auto_181723 ?auto_181725 ) ) ( not ( = ?auto_181723 ?auto_181726 ) ) ( not ( = ?auto_181723 ?auto_181727 ) ) ( not ( = ?auto_181723 ?auto_181728 ) ) ( not ( = ?auto_181723 ?auto_181729 ) ) ( not ( = ?auto_181723 ?auto_181730 ) ) ( not ( = ?auto_181723 ?auto_181731 ) ) ( not ( = ?auto_181724 ?auto_181725 ) ) ( not ( = ?auto_181724 ?auto_181726 ) ) ( not ( = ?auto_181724 ?auto_181727 ) ) ( not ( = ?auto_181724 ?auto_181728 ) ) ( not ( = ?auto_181724 ?auto_181729 ) ) ( not ( = ?auto_181724 ?auto_181730 ) ) ( not ( = ?auto_181724 ?auto_181731 ) ) ( not ( = ?auto_181725 ?auto_181726 ) ) ( not ( = ?auto_181725 ?auto_181727 ) ) ( not ( = ?auto_181725 ?auto_181728 ) ) ( not ( = ?auto_181725 ?auto_181729 ) ) ( not ( = ?auto_181725 ?auto_181730 ) ) ( not ( = ?auto_181725 ?auto_181731 ) ) ( not ( = ?auto_181726 ?auto_181727 ) ) ( not ( = ?auto_181726 ?auto_181728 ) ) ( not ( = ?auto_181726 ?auto_181729 ) ) ( not ( = ?auto_181726 ?auto_181730 ) ) ( not ( = ?auto_181726 ?auto_181731 ) ) ( not ( = ?auto_181727 ?auto_181728 ) ) ( not ( = ?auto_181727 ?auto_181729 ) ) ( not ( = ?auto_181727 ?auto_181730 ) ) ( not ( = ?auto_181727 ?auto_181731 ) ) ( not ( = ?auto_181728 ?auto_181729 ) ) ( not ( = ?auto_181728 ?auto_181730 ) ) ( not ( = ?auto_181728 ?auto_181731 ) ) ( not ( = ?auto_181729 ?auto_181730 ) ) ( not ( = ?auto_181729 ?auto_181731 ) ) ( not ( = ?auto_181730 ?auto_181731 ) ) ( ON ?auto_181729 ?auto_181730 ) ( ON ?auto_181728 ?auto_181729 ) ( ON ?auto_181727 ?auto_181728 ) ( ON ?auto_181726 ?auto_181727 ) ( ON ?auto_181725 ?auto_181726 ) ( ON ?auto_181724 ?auto_181725 ) ( CLEAR ?auto_181722 ) ( ON ?auto_181723 ?auto_181724 ) ( CLEAR ?auto_181723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181722 ?auto_181723 )
      ( MAKE-9PILE ?auto_181722 ?auto_181723 ?auto_181724 ?auto_181725 ?auto_181726 ?auto_181727 ?auto_181728 ?auto_181729 ?auto_181730 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181741 - BLOCK
      ?auto_181742 - BLOCK
      ?auto_181743 - BLOCK
      ?auto_181744 - BLOCK
      ?auto_181745 - BLOCK
      ?auto_181746 - BLOCK
      ?auto_181747 - BLOCK
      ?auto_181748 - BLOCK
      ?auto_181749 - BLOCK
    )
    :vars
    (
      ?auto_181750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181749 ?auto_181750 ) ( ON-TABLE ?auto_181741 ) ( not ( = ?auto_181741 ?auto_181742 ) ) ( not ( = ?auto_181741 ?auto_181743 ) ) ( not ( = ?auto_181741 ?auto_181744 ) ) ( not ( = ?auto_181741 ?auto_181745 ) ) ( not ( = ?auto_181741 ?auto_181746 ) ) ( not ( = ?auto_181741 ?auto_181747 ) ) ( not ( = ?auto_181741 ?auto_181748 ) ) ( not ( = ?auto_181741 ?auto_181749 ) ) ( not ( = ?auto_181741 ?auto_181750 ) ) ( not ( = ?auto_181742 ?auto_181743 ) ) ( not ( = ?auto_181742 ?auto_181744 ) ) ( not ( = ?auto_181742 ?auto_181745 ) ) ( not ( = ?auto_181742 ?auto_181746 ) ) ( not ( = ?auto_181742 ?auto_181747 ) ) ( not ( = ?auto_181742 ?auto_181748 ) ) ( not ( = ?auto_181742 ?auto_181749 ) ) ( not ( = ?auto_181742 ?auto_181750 ) ) ( not ( = ?auto_181743 ?auto_181744 ) ) ( not ( = ?auto_181743 ?auto_181745 ) ) ( not ( = ?auto_181743 ?auto_181746 ) ) ( not ( = ?auto_181743 ?auto_181747 ) ) ( not ( = ?auto_181743 ?auto_181748 ) ) ( not ( = ?auto_181743 ?auto_181749 ) ) ( not ( = ?auto_181743 ?auto_181750 ) ) ( not ( = ?auto_181744 ?auto_181745 ) ) ( not ( = ?auto_181744 ?auto_181746 ) ) ( not ( = ?auto_181744 ?auto_181747 ) ) ( not ( = ?auto_181744 ?auto_181748 ) ) ( not ( = ?auto_181744 ?auto_181749 ) ) ( not ( = ?auto_181744 ?auto_181750 ) ) ( not ( = ?auto_181745 ?auto_181746 ) ) ( not ( = ?auto_181745 ?auto_181747 ) ) ( not ( = ?auto_181745 ?auto_181748 ) ) ( not ( = ?auto_181745 ?auto_181749 ) ) ( not ( = ?auto_181745 ?auto_181750 ) ) ( not ( = ?auto_181746 ?auto_181747 ) ) ( not ( = ?auto_181746 ?auto_181748 ) ) ( not ( = ?auto_181746 ?auto_181749 ) ) ( not ( = ?auto_181746 ?auto_181750 ) ) ( not ( = ?auto_181747 ?auto_181748 ) ) ( not ( = ?auto_181747 ?auto_181749 ) ) ( not ( = ?auto_181747 ?auto_181750 ) ) ( not ( = ?auto_181748 ?auto_181749 ) ) ( not ( = ?auto_181748 ?auto_181750 ) ) ( not ( = ?auto_181749 ?auto_181750 ) ) ( ON ?auto_181748 ?auto_181749 ) ( ON ?auto_181747 ?auto_181748 ) ( ON ?auto_181746 ?auto_181747 ) ( ON ?auto_181745 ?auto_181746 ) ( ON ?auto_181744 ?auto_181745 ) ( ON ?auto_181743 ?auto_181744 ) ( CLEAR ?auto_181741 ) ( ON ?auto_181742 ?auto_181743 ) ( CLEAR ?auto_181742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_181741 ?auto_181742 )
      ( MAKE-9PILE ?auto_181741 ?auto_181742 ?auto_181743 ?auto_181744 ?auto_181745 ?auto_181746 ?auto_181747 ?auto_181748 ?auto_181749 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181760 - BLOCK
      ?auto_181761 - BLOCK
      ?auto_181762 - BLOCK
      ?auto_181763 - BLOCK
      ?auto_181764 - BLOCK
      ?auto_181765 - BLOCK
      ?auto_181766 - BLOCK
      ?auto_181767 - BLOCK
      ?auto_181768 - BLOCK
    )
    :vars
    (
      ?auto_181769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181768 ?auto_181769 ) ( not ( = ?auto_181760 ?auto_181761 ) ) ( not ( = ?auto_181760 ?auto_181762 ) ) ( not ( = ?auto_181760 ?auto_181763 ) ) ( not ( = ?auto_181760 ?auto_181764 ) ) ( not ( = ?auto_181760 ?auto_181765 ) ) ( not ( = ?auto_181760 ?auto_181766 ) ) ( not ( = ?auto_181760 ?auto_181767 ) ) ( not ( = ?auto_181760 ?auto_181768 ) ) ( not ( = ?auto_181760 ?auto_181769 ) ) ( not ( = ?auto_181761 ?auto_181762 ) ) ( not ( = ?auto_181761 ?auto_181763 ) ) ( not ( = ?auto_181761 ?auto_181764 ) ) ( not ( = ?auto_181761 ?auto_181765 ) ) ( not ( = ?auto_181761 ?auto_181766 ) ) ( not ( = ?auto_181761 ?auto_181767 ) ) ( not ( = ?auto_181761 ?auto_181768 ) ) ( not ( = ?auto_181761 ?auto_181769 ) ) ( not ( = ?auto_181762 ?auto_181763 ) ) ( not ( = ?auto_181762 ?auto_181764 ) ) ( not ( = ?auto_181762 ?auto_181765 ) ) ( not ( = ?auto_181762 ?auto_181766 ) ) ( not ( = ?auto_181762 ?auto_181767 ) ) ( not ( = ?auto_181762 ?auto_181768 ) ) ( not ( = ?auto_181762 ?auto_181769 ) ) ( not ( = ?auto_181763 ?auto_181764 ) ) ( not ( = ?auto_181763 ?auto_181765 ) ) ( not ( = ?auto_181763 ?auto_181766 ) ) ( not ( = ?auto_181763 ?auto_181767 ) ) ( not ( = ?auto_181763 ?auto_181768 ) ) ( not ( = ?auto_181763 ?auto_181769 ) ) ( not ( = ?auto_181764 ?auto_181765 ) ) ( not ( = ?auto_181764 ?auto_181766 ) ) ( not ( = ?auto_181764 ?auto_181767 ) ) ( not ( = ?auto_181764 ?auto_181768 ) ) ( not ( = ?auto_181764 ?auto_181769 ) ) ( not ( = ?auto_181765 ?auto_181766 ) ) ( not ( = ?auto_181765 ?auto_181767 ) ) ( not ( = ?auto_181765 ?auto_181768 ) ) ( not ( = ?auto_181765 ?auto_181769 ) ) ( not ( = ?auto_181766 ?auto_181767 ) ) ( not ( = ?auto_181766 ?auto_181768 ) ) ( not ( = ?auto_181766 ?auto_181769 ) ) ( not ( = ?auto_181767 ?auto_181768 ) ) ( not ( = ?auto_181767 ?auto_181769 ) ) ( not ( = ?auto_181768 ?auto_181769 ) ) ( ON ?auto_181767 ?auto_181768 ) ( ON ?auto_181766 ?auto_181767 ) ( ON ?auto_181765 ?auto_181766 ) ( ON ?auto_181764 ?auto_181765 ) ( ON ?auto_181763 ?auto_181764 ) ( ON ?auto_181762 ?auto_181763 ) ( ON ?auto_181761 ?auto_181762 ) ( ON ?auto_181760 ?auto_181761 ) ( CLEAR ?auto_181760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181760 )
      ( MAKE-9PILE ?auto_181760 ?auto_181761 ?auto_181762 ?auto_181763 ?auto_181764 ?auto_181765 ?auto_181766 ?auto_181767 ?auto_181768 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_181779 - BLOCK
      ?auto_181780 - BLOCK
      ?auto_181781 - BLOCK
      ?auto_181782 - BLOCK
      ?auto_181783 - BLOCK
      ?auto_181784 - BLOCK
      ?auto_181785 - BLOCK
      ?auto_181786 - BLOCK
      ?auto_181787 - BLOCK
    )
    :vars
    (
      ?auto_181788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181787 ?auto_181788 ) ( not ( = ?auto_181779 ?auto_181780 ) ) ( not ( = ?auto_181779 ?auto_181781 ) ) ( not ( = ?auto_181779 ?auto_181782 ) ) ( not ( = ?auto_181779 ?auto_181783 ) ) ( not ( = ?auto_181779 ?auto_181784 ) ) ( not ( = ?auto_181779 ?auto_181785 ) ) ( not ( = ?auto_181779 ?auto_181786 ) ) ( not ( = ?auto_181779 ?auto_181787 ) ) ( not ( = ?auto_181779 ?auto_181788 ) ) ( not ( = ?auto_181780 ?auto_181781 ) ) ( not ( = ?auto_181780 ?auto_181782 ) ) ( not ( = ?auto_181780 ?auto_181783 ) ) ( not ( = ?auto_181780 ?auto_181784 ) ) ( not ( = ?auto_181780 ?auto_181785 ) ) ( not ( = ?auto_181780 ?auto_181786 ) ) ( not ( = ?auto_181780 ?auto_181787 ) ) ( not ( = ?auto_181780 ?auto_181788 ) ) ( not ( = ?auto_181781 ?auto_181782 ) ) ( not ( = ?auto_181781 ?auto_181783 ) ) ( not ( = ?auto_181781 ?auto_181784 ) ) ( not ( = ?auto_181781 ?auto_181785 ) ) ( not ( = ?auto_181781 ?auto_181786 ) ) ( not ( = ?auto_181781 ?auto_181787 ) ) ( not ( = ?auto_181781 ?auto_181788 ) ) ( not ( = ?auto_181782 ?auto_181783 ) ) ( not ( = ?auto_181782 ?auto_181784 ) ) ( not ( = ?auto_181782 ?auto_181785 ) ) ( not ( = ?auto_181782 ?auto_181786 ) ) ( not ( = ?auto_181782 ?auto_181787 ) ) ( not ( = ?auto_181782 ?auto_181788 ) ) ( not ( = ?auto_181783 ?auto_181784 ) ) ( not ( = ?auto_181783 ?auto_181785 ) ) ( not ( = ?auto_181783 ?auto_181786 ) ) ( not ( = ?auto_181783 ?auto_181787 ) ) ( not ( = ?auto_181783 ?auto_181788 ) ) ( not ( = ?auto_181784 ?auto_181785 ) ) ( not ( = ?auto_181784 ?auto_181786 ) ) ( not ( = ?auto_181784 ?auto_181787 ) ) ( not ( = ?auto_181784 ?auto_181788 ) ) ( not ( = ?auto_181785 ?auto_181786 ) ) ( not ( = ?auto_181785 ?auto_181787 ) ) ( not ( = ?auto_181785 ?auto_181788 ) ) ( not ( = ?auto_181786 ?auto_181787 ) ) ( not ( = ?auto_181786 ?auto_181788 ) ) ( not ( = ?auto_181787 ?auto_181788 ) ) ( ON ?auto_181786 ?auto_181787 ) ( ON ?auto_181785 ?auto_181786 ) ( ON ?auto_181784 ?auto_181785 ) ( ON ?auto_181783 ?auto_181784 ) ( ON ?auto_181782 ?auto_181783 ) ( ON ?auto_181781 ?auto_181782 ) ( ON ?auto_181780 ?auto_181781 ) ( ON ?auto_181779 ?auto_181780 ) ( CLEAR ?auto_181779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_181779 )
      ( MAKE-9PILE ?auto_181779 ?auto_181780 ?auto_181781 ?auto_181782 ?auto_181783 ?auto_181784 ?auto_181785 ?auto_181786 ?auto_181787 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_181799 - BLOCK
      ?auto_181800 - BLOCK
      ?auto_181801 - BLOCK
      ?auto_181802 - BLOCK
      ?auto_181803 - BLOCK
      ?auto_181804 - BLOCK
      ?auto_181805 - BLOCK
      ?auto_181806 - BLOCK
      ?auto_181807 - BLOCK
      ?auto_181808 - BLOCK
    )
    :vars
    (
      ?auto_181809 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_181807 ) ( ON ?auto_181808 ?auto_181809 ) ( CLEAR ?auto_181808 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181799 ) ( ON ?auto_181800 ?auto_181799 ) ( ON ?auto_181801 ?auto_181800 ) ( ON ?auto_181802 ?auto_181801 ) ( ON ?auto_181803 ?auto_181802 ) ( ON ?auto_181804 ?auto_181803 ) ( ON ?auto_181805 ?auto_181804 ) ( ON ?auto_181806 ?auto_181805 ) ( ON ?auto_181807 ?auto_181806 ) ( not ( = ?auto_181799 ?auto_181800 ) ) ( not ( = ?auto_181799 ?auto_181801 ) ) ( not ( = ?auto_181799 ?auto_181802 ) ) ( not ( = ?auto_181799 ?auto_181803 ) ) ( not ( = ?auto_181799 ?auto_181804 ) ) ( not ( = ?auto_181799 ?auto_181805 ) ) ( not ( = ?auto_181799 ?auto_181806 ) ) ( not ( = ?auto_181799 ?auto_181807 ) ) ( not ( = ?auto_181799 ?auto_181808 ) ) ( not ( = ?auto_181799 ?auto_181809 ) ) ( not ( = ?auto_181800 ?auto_181801 ) ) ( not ( = ?auto_181800 ?auto_181802 ) ) ( not ( = ?auto_181800 ?auto_181803 ) ) ( not ( = ?auto_181800 ?auto_181804 ) ) ( not ( = ?auto_181800 ?auto_181805 ) ) ( not ( = ?auto_181800 ?auto_181806 ) ) ( not ( = ?auto_181800 ?auto_181807 ) ) ( not ( = ?auto_181800 ?auto_181808 ) ) ( not ( = ?auto_181800 ?auto_181809 ) ) ( not ( = ?auto_181801 ?auto_181802 ) ) ( not ( = ?auto_181801 ?auto_181803 ) ) ( not ( = ?auto_181801 ?auto_181804 ) ) ( not ( = ?auto_181801 ?auto_181805 ) ) ( not ( = ?auto_181801 ?auto_181806 ) ) ( not ( = ?auto_181801 ?auto_181807 ) ) ( not ( = ?auto_181801 ?auto_181808 ) ) ( not ( = ?auto_181801 ?auto_181809 ) ) ( not ( = ?auto_181802 ?auto_181803 ) ) ( not ( = ?auto_181802 ?auto_181804 ) ) ( not ( = ?auto_181802 ?auto_181805 ) ) ( not ( = ?auto_181802 ?auto_181806 ) ) ( not ( = ?auto_181802 ?auto_181807 ) ) ( not ( = ?auto_181802 ?auto_181808 ) ) ( not ( = ?auto_181802 ?auto_181809 ) ) ( not ( = ?auto_181803 ?auto_181804 ) ) ( not ( = ?auto_181803 ?auto_181805 ) ) ( not ( = ?auto_181803 ?auto_181806 ) ) ( not ( = ?auto_181803 ?auto_181807 ) ) ( not ( = ?auto_181803 ?auto_181808 ) ) ( not ( = ?auto_181803 ?auto_181809 ) ) ( not ( = ?auto_181804 ?auto_181805 ) ) ( not ( = ?auto_181804 ?auto_181806 ) ) ( not ( = ?auto_181804 ?auto_181807 ) ) ( not ( = ?auto_181804 ?auto_181808 ) ) ( not ( = ?auto_181804 ?auto_181809 ) ) ( not ( = ?auto_181805 ?auto_181806 ) ) ( not ( = ?auto_181805 ?auto_181807 ) ) ( not ( = ?auto_181805 ?auto_181808 ) ) ( not ( = ?auto_181805 ?auto_181809 ) ) ( not ( = ?auto_181806 ?auto_181807 ) ) ( not ( = ?auto_181806 ?auto_181808 ) ) ( not ( = ?auto_181806 ?auto_181809 ) ) ( not ( = ?auto_181807 ?auto_181808 ) ) ( not ( = ?auto_181807 ?auto_181809 ) ) ( not ( = ?auto_181808 ?auto_181809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181808 ?auto_181809 )
      ( !STACK ?auto_181808 ?auto_181807 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_181820 - BLOCK
      ?auto_181821 - BLOCK
      ?auto_181822 - BLOCK
      ?auto_181823 - BLOCK
      ?auto_181824 - BLOCK
      ?auto_181825 - BLOCK
      ?auto_181826 - BLOCK
      ?auto_181827 - BLOCK
      ?auto_181828 - BLOCK
      ?auto_181829 - BLOCK
    )
    :vars
    (
      ?auto_181830 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_181828 ) ( ON ?auto_181829 ?auto_181830 ) ( CLEAR ?auto_181829 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_181820 ) ( ON ?auto_181821 ?auto_181820 ) ( ON ?auto_181822 ?auto_181821 ) ( ON ?auto_181823 ?auto_181822 ) ( ON ?auto_181824 ?auto_181823 ) ( ON ?auto_181825 ?auto_181824 ) ( ON ?auto_181826 ?auto_181825 ) ( ON ?auto_181827 ?auto_181826 ) ( ON ?auto_181828 ?auto_181827 ) ( not ( = ?auto_181820 ?auto_181821 ) ) ( not ( = ?auto_181820 ?auto_181822 ) ) ( not ( = ?auto_181820 ?auto_181823 ) ) ( not ( = ?auto_181820 ?auto_181824 ) ) ( not ( = ?auto_181820 ?auto_181825 ) ) ( not ( = ?auto_181820 ?auto_181826 ) ) ( not ( = ?auto_181820 ?auto_181827 ) ) ( not ( = ?auto_181820 ?auto_181828 ) ) ( not ( = ?auto_181820 ?auto_181829 ) ) ( not ( = ?auto_181820 ?auto_181830 ) ) ( not ( = ?auto_181821 ?auto_181822 ) ) ( not ( = ?auto_181821 ?auto_181823 ) ) ( not ( = ?auto_181821 ?auto_181824 ) ) ( not ( = ?auto_181821 ?auto_181825 ) ) ( not ( = ?auto_181821 ?auto_181826 ) ) ( not ( = ?auto_181821 ?auto_181827 ) ) ( not ( = ?auto_181821 ?auto_181828 ) ) ( not ( = ?auto_181821 ?auto_181829 ) ) ( not ( = ?auto_181821 ?auto_181830 ) ) ( not ( = ?auto_181822 ?auto_181823 ) ) ( not ( = ?auto_181822 ?auto_181824 ) ) ( not ( = ?auto_181822 ?auto_181825 ) ) ( not ( = ?auto_181822 ?auto_181826 ) ) ( not ( = ?auto_181822 ?auto_181827 ) ) ( not ( = ?auto_181822 ?auto_181828 ) ) ( not ( = ?auto_181822 ?auto_181829 ) ) ( not ( = ?auto_181822 ?auto_181830 ) ) ( not ( = ?auto_181823 ?auto_181824 ) ) ( not ( = ?auto_181823 ?auto_181825 ) ) ( not ( = ?auto_181823 ?auto_181826 ) ) ( not ( = ?auto_181823 ?auto_181827 ) ) ( not ( = ?auto_181823 ?auto_181828 ) ) ( not ( = ?auto_181823 ?auto_181829 ) ) ( not ( = ?auto_181823 ?auto_181830 ) ) ( not ( = ?auto_181824 ?auto_181825 ) ) ( not ( = ?auto_181824 ?auto_181826 ) ) ( not ( = ?auto_181824 ?auto_181827 ) ) ( not ( = ?auto_181824 ?auto_181828 ) ) ( not ( = ?auto_181824 ?auto_181829 ) ) ( not ( = ?auto_181824 ?auto_181830 ) ) ( not ( = ?auto_181825 ?auto_181826 ) ) ( not ( = ?auto_181825 ?auto_181827 ) ) ( not ( = ?auto_181825 ?auto_181828 ) ) ( not ( = ?auto_181825 ?auto_181829 ) ) ( not ( = ?auto_181825 ?auto_181830 ) ) ( not ( = ?auto_181826 ?auto_181827 ) ) ( not ( = ?auto_181826 ?auto_181828 ) ) ( not ( = ?auto_181826 ?auto_181829 ) ) ( not ( = ?auto_181826 ?auto_181830 ) ) ( not ( = ?auto_181827 ?auto_181828 ) ) ( not ( = ?auto_181827 ?auto_181829 ) ) ( not ( = ?auto_181827 ?auto_181830 ) ) ( not ( = ?auto_181828 ?auto_181829 ) ) ( not ( = ?auto_181828 ?auto_181830 ) ) ( not ( = ?auto_181829 ?auto_181830 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_181829 ?auto_181830 )
      ( !STACK ?auto_181829 ?auto_181828 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_181841 - BLOCK
      ?auto_181842 - BLOCK
      ?auto_181843 - BLOCK
      ?auto_181844 - BLOCK
      ?auto_181845 - BLOCK
      ?auto_181846 - BLOCK
      ?auto_181847 - BLOCK
      ?auto_181848 - BLOCK
      ?auto_181849 - BLOCK
      ?auto_181850 - BLOCK
    )
    :vars
    (
      ?auto_181851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181850 ?auto_181851 ) ( ON-TABLE ?auto_181841 ) ( ON ?auto_181842 ?auto_181841 ) ( ON ?auto_181843 ?auto_181842 ) ( ON ?auto_181844 ?auto_181843 ) ( ON ?auto_181845 ?auto_181844 ) ( ON ?auto_181846 ?auto_181845 ) ( ON ?auto_181847 ?auto_181846 ) ( ON ?auto_181848 ?auto_181847 ) ( not ( = ?auto_181841 ?auto_181842 ) ) ( not ( = ?auto_181841 ?auto_181843 ) ) ( not ( = ?auto_181841 ?auto_181844 ) ) ( not ( = ?auto_181841 ?auto_181845 ) ) ( not ( = ?auto_181841 ?auto_181846 ) ) ( not ( = ?auto_181841 ?auto_181847 ) ) ( not ( = ?auto_181841 ?auto_181848 ) ) ( not ( = ?auto_181841 ?auto_181849 ) ) ( not ( = ?auto_181841 ?auto_181850 ) ) ( not ( = ?auto_181841 ?auto_181851 ) ) ( not ( = ?auto_181842 ?auto_181843 ) ) ( not ( = ?auto_181842 ?auto_181844 ) ) ( not ( = ?auto_181842 ?auto_181845 ) ) ( not ( = ?auto_181842 ?auto_181846 ) ) ( not ( = ?auto_181842 ?auto_181847 ) ) ( not ( = ?auto_181842 ?auto_181848 ) ) ( not ( = ?auto_181842 ?auto_181849 ) ) ( not ( = ?auto_181842 ?auto_181850 ) ) ( not ( = ?auto_181842 ?auto_181851 ) ) ( not ( = ?auto_181843 ?auto_181844 ) ) ( not ( = ?auto_181843 ?auto_181845 ) ) ( not ( = ?auto_181843 ?auto_181846 ) ) ( not ( = ?auto_181843 ?auto_181847 ) ) ( not ( = ?auto_181843 ?auto_181848 ) ) ( not ( = ?auto_181843 ?auto_181849 ) ) ( not ( = ?auto_181843 ?auto_181850 ) ) ( not ( = ?auto_181843 ?auto_181851 ) ) ( not ( = ?auto_181844 ?auto_181845 ) ) ( not ( = ?auto_181844 ?auto_181846 ) ) ( not ( = ?auto_181844 ?auto_181847 ) ) ( not ( = ?auto_181844 ?auto_181848 ) ) ( not ( = ?auto_181844 ?auto_181849 ) ) ( not ( = ?auto_181844 ?auto_181850 ) ) ( not ( = ?auto_181844 ?auto_181851 ) ) ( not ( = ?auto_181845 ?auto_181846 ) ) ( not ( = ?auto_181845 ?auto_181847 ) ) ( not ( = ?auto_181845 ?auto_181848 ) ) ( not ( = ?auto_181845 ?auto_181849 ) ) ( not ( = ?auto_181845 ?auto_181850 ) ) ( not ( = ?auto_181845 ?auto_181851 ) ) ( not ( = ?auto_181846 ?auto_181847 ) ) ( not ( = ?auto_181846 ?auto_181848 ) ) ( not ( = ?auto_181846 ?auto_181849 ) ) ( not ( = ?auto_181846 ?auto_181850 ) ) ( not ( = ?auto_181846 ?auto_181851 ) ) ( not ( = ?auto_181847 ?auto_181848 ) ) ( not ( = ?auto_181847 ?auto_181849 ) ) ( not ( = ?auto_181847 ?auto_181850 ) ) ( not ( = ?auto_181847 ?auto_181851 ) ) ( not ( = ?auto_181848 ?auto_181849 ) ) ( not ( = ?auto_181848 ?auto_181850 ) ) ( not ( = ?auto_181848 ?auto_181851 ) ) ( not ( = ?auto_181849 ?auto_181850 ) ) ( not ( = ?auto_181849 ?auto_181851 ) ) ( not ( = ?auto_181850 ?auto_181851 ) ) ( CLEAR ?auto_181848 ) ( ON ?auto_181849 ?auto_181850 ) ( CLEAR ?auto_181849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_181841 ?auto_181842 ?auto_181843 ?auto_181844 ?auto_181845 ?auto_181846 ?auto_181847 ?auto_181848 ?auto_181849 )
      ( MAKE-10PILE ?auto_181841 ?auto_181842 ?auto_181843 ?auto_181844 ?auto_181845 ?auto_181846 ?auto_181847 ?auto_181848 ?auto_181849 ?auto_181850 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_181862 - BLOCK
      ?auto_181863 - BLOCK
      ?auto_181864 - BLOCK
      ?auto_181865 - BLOCK
      ?auto_181866 - BLOCK
      ?auto_181867 - BLOCK
      ?auto_181868 - BLOCK
      ?auto_181869 - BLOCK
      ?auto_181870 - BLOCK
      ?auto_181871 - BLOCK
    )
    :vars
    (
      ?auto_181872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181871 ?auto_181872 ) ( ON-TABLE ?auto_181862 ) ( ON ?auto_181863 ?auto_181862 ) ( ON ?auto_181864 ?auto_181863 ) ( ON ?auto_181865 ?auto_181864 ) ( ON ?auto_181866 ?auto_181865 ) ( ON ?auto_181867 ?auto_181866 ) ( ON ?auto_181868 ?auto_181867 ) ( ON ?auto_181869 ?auto_181868 ) ( not ( = ?auto_181862 ?auto_181863 ) ) ( not ( = ?auto_181862 ?auto_181864 ) ) ( not ( = ?auto_181862 ?auto_181865 ) ) ( not ( = ?auto_181862 ?auto_181866 ) ) ( not ( = ?auto_181862 ?auto_181867 ) ) ( not ( = ?auto_181862 ?auto_181868 ) ) ( not ( = ?auto_181862 ?auto_181869 ) ) ( not ( = ?auto_181862 ?auto_181870 ) ) ( not ( = ?auto_181862 ?auto_181871 ) ) ( not ( = ?auto_181862 ?auto_181872 ) ) ( not ( = ?auto_181863 ?auto_181864 ) ) ( not ( = ?auto_181863 ?auto_181865 ) ) ( not ( = ?auto_181863 ?auto_181866 ) ) ( not ( = ?auto_181863 ?auto_181867 ) ) ( not ( = ?auto_181863 ?auto_181868 ) ) ( not ( = ?auto_181863 ?auto_181869 ) ) ( not ( = ?auto_181863 ?auto_181870 ) ) ( not ( = ?auto_181863 ?auto_181871 ) ) ( not ( = ?auto_181863 ?auto_181872 ) ) ( not ( = ?auto_181864 ?auto_181865 ) ) ( not ( = ?auto_181864 ?auto_181866 ) ) ( not ( = ?auto_181864 ?auto_181867 ) ) ( not ( = ?auto_181864 ?auto_181868 ) ) ( not ( = ?auto_181864 ?auto_181869 ) ) ( not ( = ?auto_181864 ?auto_181870 ) ) ( not ( = ?auto_181864 ?auto_181871 ) ) ( not ( = ?auto_181864 ?auto_181872 ) ) ( not ( = ?auto_181865 ?auto_181866 ) ) ( not ( = ?auto_181865 ?auto_181867 ) ) ( not ( = ?auto_181865 ?auto_181868 ) ) ( not ( = ?auto_181865 ?auto_181869 ) ) ( not ( = ?auto_181865 ?auto_181870 ) ) ( not ( = ?auto_181865 ?auto_181871 ) ) ( not ( = ?auto_181865 ?auto_181872 ) ) ( not ( = ?auto_181866 ?auto_181867 ) ) ( not ( = ?auto_181866 ?auto_181868 ) ) ( not ( = ?auto_181866 ?auto_181869 ) ) ( not ( = ?auto_181866 ?auto_181870 ) ) ( not ( = ?auto_181866 ?auto_181871 ) ) ( not ( = ?auto_181866 ?auto_181872 ) ) ( not ( = ?auto_181867 ?auto_181868 ) ) ( not ( = ?auto_181867 ?auto_181869 ) ) ( not ( = ?auto_181867 ?auto_181870 ) ) ( not ( = ?auto_181867 ?auto_181871 ) ) ( not ( = ?auto_181867 ?auto_181872 ) ) ( not ( = ?auto_181868 ?auto_181869 ) ) ( not ( = ?auto_181868 ?auto_181870 ) ) ( not ( = ?auto_181868 ?auto_181871 ) ) ( not ( = ?auto_181868 ?auto_181872 ) ) ( not ( = ?auto_181869 ?auto_181870 ) ) ( not ( = ?auto_181869 ?auto_181871 ) ) ( not ( = ?auto_181869 ?auto_181872 ) ) ( not ( = ?auto_181870 ?auto_181871 ) ) ( not ( = ?auto_181870 ?auto_181872 ) ) ( not ( = ?auto_181871 ?auto_181872 ) ) ( CLEAR ?auto_181869 ) ( ON ?auto_181870 ?auto_181871 ) ( CLEAR ?auto_181870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_181862 ?auto_181863 ?auto_181864 ?auto_181865 ?auto_181866 ?auto_181867 ?auto_181868 ?auto_181869 ?auto_181870 )
      ( MAKE-10PILE ?auto_181862 ?auto_181863 ?auto_181864 ?auto_181865 ?auto_181866 ?auto_181867 ?auto_181868 ?auto_181869 ?auto_181870 ?auto_181871 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_181883 - BLOCK
      ?auto_181884 - BLOCK
      ?auto_181885 - BLOCK
      ?auto_181886 - BLOCK
      ?auto_181887 - BLOCK
      ?auto_181888 - BLOCK
      ?auto_181889 - BLOCK
      ?auto_181890 - BLOCK
      ?auto_181891 - BLOCK
      ?auto_181892 - BLOCK
    )
    :vars
    (
      ?auto_181893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181892 ?auto_181893 ) ( ON-TABLE ?auto_181883 ) ( ON ?auto_181884 ?auto_181883 ) ( ON ?auto_181885 ?auto_181884 ) ( ON ?auto_181886 ?auto_181885 ) ( ON ?auto_181887 ?auto_181886 ) ( ON ?auto_181888 ?auto_181887 ) ( ON ?auto_181889 ?auto_181888 ) ( not ( = ?auto_181883 ?auto_181884 ) ) ( not ( = ?auto_181883 ?auto_181885 ) ) ( not ( = ?auto_181883 ?auto_181886 ) ) ( not ( = ?auto_181883 ?auto_181887 ) ) ( not ( = ?auto_181883 ?auto_181888 ) ) ( not ( = ?auto_181883 ?auto_181889 ) ) ( not ( = ?auto_181883 ?auto_181890 ) ) ( not ( = ?auto_181883 ?auto_181891 ) ) ( not ( = ?auto_181883 ?auto_181892 ) ) ( not ( = ?auto_181883 ?auto_181893 ) ) ( not ( = ?auto_181884 ?auto_181885 ) ) ( not ( = ?auto_181884 ?auto_181886 ) ) ( not ( = ?auto_181884 ?auto_181887 ) ) ( not ( = ?auto_181884 ?auto_181888 ) ) ( not ( = ?auto_181884 ?auto_181889 ) ) ( not ( = ?auto_181884 ?auto_181890 ) ) ( not ( = ?auto_181884 ?auto_181891 ) ) ( not ( = ?auto_181884 ?auto_181892 ) ) ( not ( = ?auto_181884 ?auto_181893 ) ) ( not ( = ?auto_181885 ?auto_181886 ) ) ( not ( = ?auto_181885 ?auto_181887 ) ) ( not ( = ?auto_181885 ?auto_181888 ) ) ( not ( = ?auto_181885 ?auto_181889 ) ) ( not ( = ?auto_181885 ?auto_181890 ) ) ( not ( = ?auto_181885 ?auto_181891 ) ) ( not ( = ?auto_181885 ?auto_181892 ) ) ( not ( = ?auto_181885 ?auto_181893 ) ) ( not ( = ?auto_181886 ?auto_181887 ) ) ( not ( = ?auto_181886 ?auto_181888 ) ) ( not ( = ?auto_181886 ?auto_181889 ) ) ( not ( = ?auto_181886 ?auto_181890 ) ) ( not ( = ?auto_181886 ?auto_181891 ) ) ( not ( = ?auto_181886 ?auto_181892 ) ) ( not ( = ?auto_181886 ?auto_181893 ) ) ( not ( = ?auto_181887 ?auto_181888 ) ) ( not ( = ?auto_181887 ?auto_181889 ) ) ( not ( = ?auto_181887 ?auto_181890 ) ) ( not ( = ?auto_181887 ?auto_181891 ) ) ( not ( = ?auto_181887 ?auto_181892 ) ) ( not ( = ?auto_181887 ?auto_181893 ) ) ( not ( = ?auto_181888 ?auto_181889 ) ) ( not ( = ?auto_181888 ?auto_181890 ) ) ( not ( = ?auto_181888 ?auto_181891 ) ) ( not ( = ?auto_181888 ?auto_181892 ) ) ( not ( = ?auto_181888 ?auto_181893 ) ) ( not ( = ?auto_181889 ?auto_181890 ) ) ( not ( = ?auto_181889 ?auto_181891 ) ) ( not ( = ?auto_181889 ?auto_181892 ) ) ( not ( = ?auto_181889 ?auto_181893 ) ) ( not ( = ?auto_181890 ?auto_181891 ) ) ( not ( = ?auto_181890 ?auto_181892 ) ) ( not ( = ?auto_181890 ?auto_181893 ) ) ( not ( = ?auto_181891 ?auto_181892 ) ) ( not ( = ?auto_181891 ?auto_181893 ) ) ( not ( = ?auto_181892 ?auto_181893 ) ) ( ON ?auto_181891 ?auto_181892 ) ( CLEAR ?auto_181889 ) ( ON ?auto_181890 ?auto_181891 ) ( CLEAR ?auto_181890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181883 ?auto_181884 ?auto_181885 ?auto_181886 ?auto_181887 ?auto_181888 ?auto_181889 ?auto_181890 )
      ( MAKE-10PILE ?auto_181883 ?auto_181884 ?auto_181885 ?auto_181886 ?auto_181887 ?auto_181888 ?auto_181889 ?auto_181890 ?auto_181891 ?auto_181892 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_181904 - BLOCK
      ?auto_181905 - BLOCK
      ?auto_181906 - BLOCK
      ?auto_181907 - BLOCK
      ?auto_181908 - BLOCK
      ?auto_181909 - BLOCK
      ?auto_181910 - BLOCK
      ?auto_181911 - BLOCK
      ?auto_181912 - BLOCK
      ?auto_181913 - BLOCK
    )
    :vars
    (
      ?auto_181914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181913 ?auto_181914 ) ( ON-TABLE ?auto_181904 ) ( ON ?auto_181905 ?auto_181904 ) ( ON ?auto_181906 ?auto_181905 ) ( ON ?auto_181907 ?auto_181906 ) ( ON ?auto_181908 ?auto_181907 ) ( ON ?auto_181909 ?auto_181908 ) ( ON ?auto_181910 ?auto_181909 ) ( not ( = ?auto_181904 ?auto_181905 ) ) ( not ( = ?auto_181904 ?auto_181906 ) ) ( not ( = ?auto_181904 ?auto_181907 ) ) ( not ( = ?auto_181904 ?auto_181908 ) ) ( not ( = ?auto_181904 ?auto_181909 ) ) ( not ( = ?auto_181904 ?auto_181910 ) ) ( not ( = ?auto_181904 ?auto_181911 ) ) ( not ( = ?auto_181904 ?auto_181912 ) ) ( not ( = ?auto_181904 ?auto_181913 ) ) ( not ( = ?auto_181904 ?auto_181914 ) ) ( not ( = ?auto_181905 ?auto_181906 ) ) ( not ( = ?auto_181905 ?auto_181907 ) ) ( not ( = ?auto_181905 ?auto_181908 ) ) ( not ( = ?auto_181905 ?auto_181909 ) ) ( not ( = ?auto_181905 ?auto_181910 ) ) ( not ( = ?auto_181905 ?auto_181911 ) ) ( not ( = ?auto_181905 ?auto_181912 ) ) ( not ( = ?auto_181905 ?auto_181913 ) ) ( not ( = ?auto_181905 ?auto_181914 ) ) ( not ( = ?auto_181906 ?auto_181907 ) ) ( not ( = ?auto_181906 ?auto_181908 ) ) ( not ( = ?auto_181906 ?auto_181909 ) ) ( not ( = ?auto_181906 ?auto_181910 ) ) ( not ( = ?auto_181906 ?auto_181911 ) ) ( not ( = ?auto_181906 ?auto_181912 ) ) ( not ( = ?auto_181906 ?auto_181913 ) ) ( not ( = ?auto_181906 ?auto_181914 ) ) ( not ( = ?auto_181907 ?auto_181908 ) ) ( not ( = ?auto_181907 ?auto_181909 ) ) ( not ( = ?auto_181907 ?auto_181910 ) ) ( not ( = ?auto_181907 ?auto_181911 ) ) ( not ( = ?auto_181907 ?auto_181912 ) ) ( not ( = ?auto_181907 ?auto_181913 ) ) ( not ( = ?auto_181907 ?auto_181914 ) ) ( not ( = ?auto_181908 ?auto_181909 ) ) ( not ( = ?auto_181908 ?auto_181910 ) ) ( not ( = ?auto_181908 ?auto_181911 ) ) ( not ( = ?auto_181908 ?auto_181912 ) ) ( not ( = ?auto_181908 ?auto_181913 ) ) ( not ( = ?auto_181908 ?auto_181914 ) ) ( not ( = ?auto_181909 ?auto_181910 ) ) ( not ( = ?auto_181909 ?auto_181911 ) ) ( not ( = ?auto_181909 ?auto_181912 ) ) ( not ( = ?auto_181909 ?auto_181913 ) ) ( not ( = ?auto_181909 ?auto_181914 ) ) ( not ( = ?auto_181910 ?auto_181911 ) ) ( not ( = ?auto_181910 ?auto_181912 ) ) ( not ( = ?auto_181910 ?auto_181913 ) ) ( not ( = ?auto_181910 ?auto_181914 ) ) ( not ( = ?auto_181911 ?auto_181912 ) ) ( not ( = ?auto_181911 ?auto_181913 ) ) ( not ( = ?auto_181911 ?auto_181914 ) ) ( not ( = ?auto_181912 ?auto_181913 ) ) ( not ( = ?auto_181912 ?auto_181914 ) ) ( not ( = ?auto_181913 ?auto_181914 ) ) ( ON ?auto_181912 ?auto_181913 ) ( CLEAR ?auto_181910 ) ( ON ?auto_181911 ?auto_181912 ) ( CLEAR ?auto_181911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_181904 ?auto_181905 ?auto_181906 ?auto_181907 ?auto_181908 ?auto_181909 ?auto_181910 ?auto_181911 )
      ( MAKE-10PILE ?auto_181904 ?auto_181905 ?auto_181906 ?auto_181907 ?auto_181908 ?auto_181909 ?auto_181910 ?auto_181911 ?auto_181912 ?auto_181913 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_181925 - BLOCK
      ?auto_181926 - BLOCK
      ?auto_181927 - BLOCK
      ?auto_181928 - BLOCK
      ?auto_181929 - BLOCK
      ?auto_181930 - BLOCK
      ?auto_181931 - BLOCK
      ?auto_181932 - BLOCK
      ?auto_181933 - BLOCK
      ?auto_181934 - BLOCK
    )
    :vars
    (
      ?auto_181935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181934 ?auto_181935 ) ( ON-TABLE ?auto_181925 ) ( ON ?auto_181926 ?auto_181925 ) ( ON ?auto_181927 ?auto_181926 ) ( ON ?auto_181928 ?auto_181927 ) ( ON ?auto_181929 ?auto_181928 ) ( ON ?auto_181930 ?auto_181929 ) ( not ( = ?auto_181925 ?auto_181926 ) ) ( not ( = ?auto_181925 ?auto_181927 ) ) ( not ( = ?auto_181925 ?auto_181928 ) ) ( not ( = ?auto_181925 ?auto_181929 ) ) ( not ( = ?auto_181925 ?auto_181930 ) ) ( not ( = ?auto_181925 ?auto_181931 ) ) ( not ( = ?auto_181925 ?auto_181932 ) ) ( not ( = ?auto_181925 ?auto_181933 ) ) ( not ( = ?auto_181925 ?auto_181934 ) ) ( not ( = ?auto_181925 ?auto_181935 ) ) ( not ( = ?auto_181926 ?auto_181927 ) ) ( not ( = ?auto_181926 ?auto_181928 ) ) ( not ( = ?auto_181926 ?auto_181929 ) ) ( not ( = ?auto_181926 ?auto_181930 ) ) ( not ( = ?auto_181926 ?auto_181931 ) ) ( not ( = ?auto_181926 ?auto_181932 ) ) ( not ( = ?auto_181926 ?auto_181933 ) ) ( not ( = ?auto_181926 ?auto_181934 ) ) ( not ( = ?auto_181926 ?auto_181935 ) ) ( not ( = ?auto_181927 ?auto_181928 ) ) ( not ( = ?auto_181927 ?auto_181929 ) ) ( not ( = ?auto_181927 ?auto_181930 ) ) ( not ( = ?auto_181927 ?auto_181931 ) ) ( not ( = ?auto_181927 ?auto_181932 ) ) ( not ( = ?auto_181927 ?auto_181933 ) ) ( not ( = ?auto_181927 ?auto_181934 ) ) ( not ( = ?auto_181927 ?auto_181935 ) ) ( not ( = ?auto_181928 ?auto_181929 ) ) ( not ( = ?auto_181928 ?auto_181930 ) ) ( not ( = ?auto_181928 ?auto_181931 ) ) ( not ( = ?auto_181928 ?auto_181932 ) ) ( not ( = ?auto_181928 ?auto_181933 ) ) ( not ( = ?auto_181928 ?auto_181934 ) ) ( not ( = ?auto_181928 ?auto_181935 ) ) ( not ( = ?auto_181929 ?auto_181930 ) ) ( not ( = ?auto_181929 ?auto_181931 ) ) ( not ( = ?auto_181929 ?auto_181932 ) ) ( not ( = ?auto_181929 ?auto_181933 ) ) ( not ( = ?auto_181929 ?auto_181934 ) ) ( not ( = ?auto_181929 ?auto_181935 ) ) ( not ( = ?auto_181930 ?auto_181931 ) ) ( not ( = ?auto_181930 ?auto_181932 ) ) ( not ( = ?auto_181930 ?auto_181933 ) ) ( not ( = ?auto_181930 ?auto_181934 ) ) ( not ( = ?auto_181930 ?auto_181935 ) ) ( not ( = ?auto_181931 ?auto_181932 ) ) ( not ( = ?auto_181931 ?auto_181933 ) ) ( not ( = ?auto_181931 ?auto_181934 ) ) ( not ( = ?auto_181931 ?auto_181935 ) ) ( not ( = ?auto_181932 ?auto_181933 ) ) ( not ( = ?auto_181932 ?auto_181934 ) ) ( not ( = ?auto_181932 ?auto_181935 ) ) ( not ( = ?auto_181933 ?auto_181934 ) ) ( not ( = ?auto_181933 ?auto_181935 ) ) ( not ( = ?auto_181934 ?auto_181935 ) ) ( ON ?auto_181933 ?auto_181934 ) ( ON ?auto_181932 ?auto_181933 ) ( CLEAR ?auto_181930 ) ( ON ?auto_181931 ?auto_181932 ) ( CLEAR ?auto_181931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181925 ?auto_181926 ?auto_181927 ?auto_181928 ?auto_181929 ?auto_181930 ?auto_181931 )
      ( MAKE-10PILE ?auto_181925 ?auto_181926 ?auto_181927 ?auto_181928 ?auto_181929 ?auto_181930 ?auto_181931 ?auto_181932 ?auto_181933 ?auto_181934 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_181946 - BLOCK
      ?auto_181947 - BLOCK
      ?auto_181948 - BLOCK
      ?auto_181949 - BLOCK
      ?auto_181950 - BLOCK
      ?auto_181951 - BLOCK
      ?auto_181952 - BLOCK
      ?auto_181953 - BLOCK
      ?auto_181954 - BLOCK
      ?auto_181955 - BLOCK
    )
    :vars
    (
      ?auto_181956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181955 ?auto_181956 ) ( ON-TABLE ?auto_181946 ) ( ON ?auto_181947 ?auto_181946 ) ( ON ?auto_181948 ?auto_181947 ) ( ON ?auto_181949 ?auto_181948 ) ( ON ?auto_181950 ?auto_181949 ) ( ON ?auto_181951 ?auto_181950 ) ( not ( = ?auto_181946 ?auto_181947 ) ) ( not ( = ?auto_181946 ?auto_181948 ) ) ( not ( = ?auto_181946 ?auto_181949 ) ) ( not ( = ?auto_181946 ?auto_181950 ) ) ( not ( = ?auto_181946 ?auto_181951 ) ) ( not ( = ?auto_181946 ?auto_181952 ) ) ( not ( = ?auto_181946 ?auto_181953 ) ) ( not ( = ?auto_181946 ?auto_181954 ) ) ( not ( = ?auto_181946 ?auto_181955 ) ) ( not ( = ?auto_181946 ?auto_181956 ) ) ( not ( = ?auto_181947 ?auto_181948 ) ) ( not ( = ?auto_181947 ?auto_181949 ) ) ( not ( = ?auto_181947 ?auto_181950 ) ) ( not ( = ?auto_181947 ?auto_181951 ) ) ( not ( = ?auto_181947 ?auto_181952 ) ) ( not ( = ?auto_181947 ?auto_181953 ) ) ( not ( = ?auto_181947 ?auto_181954 ) ) ( not ( = ?auto_181947 ?auto_181955 ) ) ( not ( = ?auto_181947 ?auto_181956 ) ) ( not ( = ?auto_181948 ?auto_181949 ) ) ( not ( = ?auto_181948 ?auto_181950 ) ) ( not ( = ?auto_181948 ?auto_181951 ) ) ( not ( = ?auto_181948 ?auto_181952 ) ) ( not ( = ?auto_181948 ?auto_181953 ) ) ( not ( = ?auto_181948 ?auto_181954 ) ) ( not ( = ?auto_181948 ?auto_181955 ) ) ( not ( = ?auto_181948 ?auto_181956 ) ) ( not ( = ?auto_181949 ?auto_181950 ) ) ( not ( = ?auto_181949 ?auto_181951 ) ) ( not ( = ?auto_181949 ?auto_181952 ) ) ( not ( = ?auto_181949 ?auto_181953 ) ) ( not ( = ?auto_181949 ?auto_181954 ) ) ( not ( = ?auto_181949 ?auto_181955 ) ) ( not ( = ?auto_181949 ?auto_181956 ) ) ( not ( = ?auto_181950 ?auto_181951 ) ) ( not ( = ?auto_181950 ?auto_181952 ) ) ( not ( = ?auto_181950 ?auto_181953 ) ) ( not ( = ?auto_181950 ?auto_181954 ) ) ( not ( = ?auto_181950 ?auto_181955 ) ) ( not ( = ?auto_181950 ?auto_181956 ) ) ( not ( = ?auto_181951 ?auto_181952 ) ) ( not ( = ?auto_181951 ?auto_181953 ) ) ( not ( = ?auto_181951 ?auto_181954 ) ) ( not ( = ?auto_181951 ?auto_181955 ) ) ( not ( = ?auto_181951 ?auto_181956 ) ) ( not ( = ?auto_181952 ?auto_181953 ) ) ( not ( = ?auto_181952 ?auto_181954 ) ) ( not ( = ?auto_181952 ?auto_181955 ) ) ( not ( = ?auto_181952 ?auto_181956 ) ) ( not ( = ?auto_181953 ?auto_181954 ) ) ( not ( = ?auto_181953 ?auto_181955 ) ) ( not ( = ?auto_181953 ?auto_181956 ) ) ( not ( = ?auto_181954 ?auto_181955 ) ) ( not ( = ?auto_181954 ?auto_181956 ) ) ( not ( = ?auto_181955 ?auto_181956 ) ) ( ON ?auto_181954 ?auto_181955 ) ( ON ?auto_181953 ?auto_181954 ) ( CLEAR ?auto_181951 ) ( ON ?auto_181952 ?auto_181953 ) ( CLEAR ?auto_181952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_181946 ?auto_181947 ?auto_181948 ?auto_181949 ?auto_181950 ?auto_181951 ?auto_181952 )
      ( MAKE-10PILE ?auto_181946 ?auto_181947 ?auto_181948 ?auto_181949 ?auto_181950 ?auto_181951 ?auto_181952 ?auto_181953 ?auto_181954 ?auto_181955 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_181967 - BLOCK
      ?auto_181968 - BLOCK
      ?auto_181969 - BLOCK
      ?auto_181970 - BLOCK
      ?auto_181971 - BLOCK
      ?auto_181972 - BLOCK
      ?auto_181973 - BLOCK
      ?auto_181974 - BLOCK
      ?auto_181975 - BLOCK
      ?auto_181976 - BLOCK
    )
    :vars
    (
      ?auto_181977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181976 ?auto_181977 ) ( ON-TABLE ?auto_181967 ) ( ON ?auto_181968 ?auto_181967 ) ( ON ?auto_181969 ?auto_181968 ) ( ON ?auto_181970 ?auto_181969 ) ( ON ?auto_181971 ?auto_181970 ) ( not ( = ?auto_181967 ?auto_181968 ) ) ( not ( = ?auto_181967 ?auto_181969 ) ) ( not ( = ?auto_181967 ?auto_181970 ) ) ( not ( = ?auto_181967 ?auto_181971 ) ) ( not ( = ?auto_181967 ?auto_181972 ) ) ( not ( = ?auto_181967 ?auto_181973 ) ) ( not ( = ?auto_181967 ?auto_181974 ) ) ( not ( = ?auto_181967 ?auto_181975 ) ) ( not ( = ?auto_181967 ?auto_181976 ) ) ( not ( = ?auto_181967 ?auto_181977 ) ) ( not ( = ?auto_181968 ?auto_181969 ) ) ( not ( = ?auto_181968 ?auto_181970 ) ) ( not ( = ?auto_181968 ?auto_181971 ) ) ( not ( = ?auto_181968 ?auto_181972 ) ) ( not ( = ?auto_181968 ?auto_181973 ) ) ( not ( = ?auto_181968 ?auto_181974 ) ) ( not ( = ?auto_181968 ?auto_181975 ) ) ( not ( = ?auto_181968 ?auto_181976 ) ) ( not ( = ?auto_181968 ?auto_181977 ) ) ( not ( = ?auto_181969 ?auto_181970 ) ) ( not ( = ?auto_181969 ?auto_181971 ) ) ( not ( = ?auto_181969 ?auto_181972 ) ) ( not ( = ?auto_181969 ?auto_181973 ) ) ( not ( = ?auto_181969 ?auto_181974 ) ) ( not ( = ?auto_181969 ?auto_181975 ) ) ( not ( = ?auto_181969 ?auto_181976 ) ) ( not ( = ?auto_181969 ?auto_181977 ) ) ( not ( = ?auto_181970 ?auto_181971 ) ) ( not ( = ?auto_181970 ?auto_181972 ) ) ( not ( = ?auto_181970 ?auto_181973 ) ) ( not ( = ?auto_181970 ?auto_181974 ) ) ( not ( = ?auto_181970 ?auto_181975 ) ) ( not ( = ?auto_181970 ?auto_181976 ) ) ( not ( = ?auto_181970 ?auto_181977 ) ) ( not ( = ?auto_181971 ?auto_181972 ) ) ( not ( = ?auto_181971 ?auto_181973 ) ) ( not ( = ?auto_181971 ?auto_181974 ) ) ( not ( = ?auto_181971 ?auto_181975 ) ) ( not ( = ?auto_181971 ?auto_181976 ) ) ( not ( = ?auto_181971 ?auto_181977 ) ) ( not ( = ?auto_181972 ?auto_181973 ) ) ( not ( = ?auto_181972 ?auto_181974 ) ) ( not ( = ?auto_181972 ?auto_181975 ) ) ( not ( = ?auto_181972 ?auto_181976 ) ) ( not ( = ?auto_181972 ?auto_181977 ) ) ( not ( = ?auto_181973 ?auto_181974 ) ) ( not ( = ?auto_181973 ?auto_181975 ) ) ( not ( = ?auto_181973 ?auto_181976 ) ) ( not ( = ?auto_181973 ?auto_181977 ) ) ( not ( = ?auto_181974 ?auto_181975 ) ) ( not ( = ?auto_181974 ?auto_181976 ) ) ( not ( = ?auto_181974 ?auto_181977 ) ) ( not ( = ?auto_181975 ?auto_181976 ) ) ( not ( = ?auto_181975 ?auto_181977 ) ) ( not ( = ?auto_181976 ?auto_181977 ) ) ( ON ?auto_181975 ?auto_181976 ) ( ON ?auto_181974 ?auto_181975 ) ( ON ?auto_181973 ?auto_181974 ) ( CLEAR ?auto_181971 ) ( ON ?auto_181972 ?auto_181973 ) ( CLEAR ?auto_181972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181967 ?auto_181968 ?auto_181969 ?auto_181970 ?auto_181971 ?auto_181972 )
      ( MAKE-10PILE ?auto_181967 ?auto_181968 ?auto_181969 ?auto_181970 ?auto_181971 ?auto_181972 ?auto_181973 ?auto_181974 ?auto_181975 ?auto_181976 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_181988 - BLOCK
      ?auto_181989 - BLOCK
      ?auto_181990 - BLOCK
      ?auto_181991 - BLOCK
      ?auto_181992 - BLOCK
      ?auto_181993 - BLOCK
      ?auto_181994 - BLOCK
      ?auto_181995 - BLOCK
      ?auto_181996 - BLOCK
      ?auto_181997 - BLOCK
    )
    :vars
    (
      ?auto_181998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_181997 ?auto_181998 ) ( ON-TABLE ?auto_181988 ) ( ON ?auto_181989 ?auto_181988 ) ( ON ?auto_181990 ?auto_181989 ) ( ON ?auto_181991 ?auto_181990 ) ( ON ?auto_181992 ?auto_181991 ) ( not ( = ?auto_181988 ?auto_181989 ) ) ( not ( = ?auto_181988 ?auto_181990 ) ) ( not ( = ?auto_181988 ?auto_181991 ) ) ( not ( = ?auto_181988 ?auto_181992 ) ) ( not ( = ?auto_181988 ?auto_181993 ) ) ( not ( = ?auto_181988 ?auto_181994 ) ) ( not ( = ?auto_181988 ?auto_181995 ) ) ( not ( = ?auto_181988 ?auto_181996 ) ) ( not ( = ?auto_181988 ?auto_181997 ) ) ( not ( = ?auto_181988 ?auto_181998 ) ) ( not ( = ?auto_181989 ?auto_181990 ) ) ( not ( = ?auto_181989 ?auto_181991 ) ) ( not ( = ?auto_181989 ?auto_181992 ) ) ( not ( = ?auto_181989 ?auto_181993 ) ) ( not ( = ?auto_181989 ?auto_181994 ) ) ( not ( = ?auto_181989 ?auto_181995 ) ) ( not ( = ?auto_181989 ?auto_181996 ) ) ( not ( = ?auto_181989 ?auto_181997 ) ) ( not ( = ?auto_181989 ?auto_181998 ) ) ( not ( = ?auto_181990 ?auto_181991 ) ) ( not ( = ?auto_181990 ?auto_181992 ) ) ( not ( = ?auto_181990 ?auto_181993 ) ) ( not ( = ?auto_181990 ?auto_181994 ) ) ( not ( = ?auto_181990 ?auto_181995 ) ) ( not ( = ?auto_181990 ?auto_181996 ) ) ( not ( = ?auto_181990 ?auto_181997 ) ) ( not ( = ?auto_181990 ?auto_181998 ) ) ( not ( = ?auto_181991 ?auto_181992 ) ) ( not ( = ?auto_181991 ?auto_181993 ) ) ( not ( = ?auto_181991 ?auto_181994 ) ) ( not ( = ?auto_181991 ?auto_181995 ) ) ( not ( = ?auto_181991 ?auto_181996 ) ) ( not ( = ?auto_181991 ?auto_181997 ) ) ( not ( = ?auto_181991 ?auto_181998 ) ) ( not ( = ?auto_181992 ?auto_181993 ) ) ( not ( = ?auto_181992 ?auto_181994 ) ) ( not ( = ?auto_181992 ?auto_181995 ) ) ( not ( = ?auto_181992 ?auto_181996 ) ) ( not ( = ?auto_181992 ?auto_181997 ) ) ( not ( = ?auto_181992 ?auto_181998 ) ) ( not ( = ?auto_181993 ?auto_181994 ) ) ( not ( = ?auto_181993 ?auto_181995 ) ) ( not ( = ?auto_181993 ?auto_181996 ) ) ( not ( = ?auto_181993 ?auto_181997 ) ) ( not ( = ?auto_181993 ?auto_181998 ) ) ( not ( = ?auto_181994 ?auto_181995 ) ) ( not ( = ?auto_181994 ?auto_181996 ) ) ( not ( = ?auto_181994 ?auto_181997 ) ) ( not ( = ?auto_181994 ?auto_181998 ) ) ( not ( = ?auto_181995 ?auto_181996 ) ) ( not ( = ?auto_181995 ?auto_181997 ) ) ( not ( = ?auto_181995 ?auto_181998 ) ) ( not ( = ?auto_181996 ?auto_181997 ) ) ( not ( = ?auto_181996 ?auto_181998 ) ) ( not ( = ?auto_181997 ?auto_181998 ) ) ( ON ?auto_181996 ?auto_181997 ) ( ON ?auto_181995 ?auto_181996 ) ( ON ?auto_181994 ?auto_181995 ) ( CLEAR ?auto_181992 ) ( ON ?auto_181993 ?auto_181994 ) ( CLEAR ?auto_181993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_181988 ?auto_181989 ?auto_181990 ?auto_181991 ?auto_181992 ?auto_181993 )
      ( MAKE-10PILE ?auto_181988 ?auto_181989 ?auto_181990 ?auto_181991 ?auto_181992 ?auto_181993 ?auto_181994 ?auto_181995 ?auto_181996 ?auto_181997 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_182009 - BLOCK
      ?auto_182010 - BLOCK
      ?auto_182011 - BLOCK
      ?auto_182012 - BLOCK
      ?auto_182013 - BLOCK
      ?auto_182014 - BLOCK
      ?auto_182015 - BLOCK
      ?auto_182016 - BLOCK
      ?auto_182017 - BLOCK
      ?auto_182018 - BLOCK
    )
    :vars
    (
      ?auto_182019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182018 ?auto_182019 ) ( ON-TABLE ?auto_182009 ) ( ON ?auto_182010 ?auto_182009 ) ( ON ?auto_182011 ?auto_182010 ) ( ON ?auto_182012 ?auto_182011 ) ( not ( = ?auto_182009 ?auto_182010 ) ) ( not ( = ?auto_182009 ?auto_182011 ) ) ( not ( = ?auto_182009 ?auto_182012 ) ) ( not ( = ?auto_182009 ?auto_182013 ) ) ( not ( = ?auto_182009 ?auto_182014 ) ) ( not ( = ?auto_182009 ?auto_182015 ) ) ( not ( = ?auto_182009 ?auto_182016 ) ) ( not ( = ?auto_182009 ?auto_182017 ) ) ( not ( = ?auto_182009 ?auto_182018 ) ) ( not ( = ?auto_182009 ?auto_182019 ) ) ( not ( = ?auto_182010 ?auto_182011 ) ) ( not ( = ?auto_182010 ?auto_182012 ) ) ( not ( = ?auto_182010 ?auto_182013 ) ) ( not ( = ?auto_182010 ?auto_182014 ) ) ( not ( = ?auto_182010 ?auto_182015 ) ) ( not ( = ?auto_182010 ?auto_182016 ) ) ( not ( = ?auto_182010 ?auto_182017 ) ) ( not ( = ?auto_182010 ?auto_182018 ) ) ( not ( = ?auto_182010 ?auto_182019 ) ) ( not ( = ?auto_182011 ?auto_182012 ) ) ( not ( = ?auto_182011 ?auto_182013 ) ) ( not ( = ?auto_182011 ?auto_182014 ) ) ( not ( = ?auto_182011 ?auto_182015 ) ) ( not ( = ?auto_182011 ?auto_182016 ) ) ( not ( = ?auto_182011 ?auto_182017 ) ) ( not ( = ?auto_182011 ?auto_182018 ) ) ( not ( = ?auto_182011 ?auto_182019 ) ) ( not ( = ?auto_182012 ?auto_182013 ) ) ( not ( = ?auto_182012 ?auto_182014 ) ) ( not ( = ?auto_182012 ?auto_182015 ) ) ( not ( = ?auto_182012 ?auto_182016 ) ) ( not ( = ?auto_182012 ?auto_182017 ) ) ( not ( = ?auto_182012 ?auto_182018 ) ) ( not ( = ?auto_182012 ?auto_182019 ) ) ( not ( = ?auto_182013 ?auto_182014 ) ) ( not ( = ?auto_182013 ?auto_182015 ) ) ( not ( = ?auto_182013 ?auto_182016 ) ) ( not ( = ?auto_182013 ?auto_182017 ) ) ( not ( = ?auto_182013 ?auto_182018 ) ) ( not ( = ?auto_182013 ?auto_182019 ) ) ( not ( = ?auto_182014 ?auto_182015 ) ) ( not ( = ?auto_182014 ?auto_182016 ) ) ( not ( = ?auto_182014 ?auto_182017 ) ) ( not ( = ?auto_182014 ?auto_182018 ) ) ( not ( = ?auto_182014 ?auto_182019 ) ) ( not ( = ?auto_182015 ?auto_182016 ) ) ( not ( = ?auto_182015 ?auto_182017 ) ) ( not ( = ?auto_182015 ?auto_182018 ) ) ( not ( = ?auto_182015 ?auto_182019 ) ) ( not ( = ?auto_182016 ?auto_182017 ) ) ( not ( = ?auto_182016 ?auto_182018 ) ) ( not ( = ?auto_182016 ?auto_182019 ) ) ( not ( = ?auto_182017 ?auto_182018 ) ) ( not ( = ?auto_182017 ?auto_182019 ) ) ( not ( = ?auto_182018 ?auto_182019 ) ) ( ON ?auto_182017 ?auto_182018 ) ( ON ?auto_182016 ?auto_182017 ) ( ON ?auto_182015 ?auto_182016 ) ( ON ?auto_182014 ?auto_182015 ) ( CLEAR ?auto_182012 ) ( ON ?auto_182013 ?auto_182014 ) ( CLEAR ?auto_182013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182009 ?auto_182010 ?auto_182011 ?auto_182012 ?auto_182013 )
      ( MAKE-10PILE ?auto_182009 ?auto_182010 ?auto_182011 ?auto_182012 ?auto_182013 ?auto_182014 ?auto_182015 ?auto_182016 ?auto_182017 ?auto_182018 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_182030 - BLOCK
      ?auto_182031 - BLOCK
      ?auto_182032 - BLOCK
      ?auto_182033 - BLOCK
      ?auto_182034 - BLOCK
      ?auto_182035 - BLOCK
      ?auto_182036 - BLOCK
      ?auto_182037 - BLOCK
      ?auto_182038 - BLOCK
      ?auto_182039 - BLOCK
    )
    :vars
    (
      ?auto_182040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182039 ?auto_182040 ) ( ON-TABLE ?auto_182030 ) ( ON ?auto_182031 ?auto_182030 ) ( ON ?auto_182032 ?auto_182031 ) ( ON ?auto_182033 ?auto_182032 ) ( not ( = ?auto_182030 ?auto_182031 ) ) ( not ( = ?auto_182030 ?auto_182032 ) ) ( not ( = ?auto_182030 ?auto_182033 ) ) ( not ( = ?auto_182030 ?auto_182034 ) ) ( not ( = ?auto_182030 ?auto_182035 ) ) ( not ( = ?auto_182030 ?auto_182036 ) ) ( not ( = ?auto_182030 ?auto_182037 ) ) ( not ( = ?auto_182030 ?auto_182038 ) ) ( not ( = ?auto_182030 ?auto_182039 ) ) ( not ( = ?auto_182030 ?auto_182040 ) ) ( not ( = ?auto_182031 ?auto_182032 ) ) ( not ( = ?auto_182031 ?auto_182033 ) ) ( not ( = ?auto_182031 ?auto_182034 ) ) ( not ( = ?auto_182031 ?auto_182035 ) ) ( not ( = ?auto_182031 ?auto_182036 ) ) ( not ( = ?auto_182031 ?auto_182037 ) ) ( not ( = ?auto_182031 ?auto_182038 ) ) ( not ( = ?auto_182031 ?auto_182039 ) ) ( not ( = ?auto_182031 ?auto_182040 ) ) ( not ( = ?auto_182032 ?auto_182033 ) ) ( not ( = ?auto_182032 ?auto_182034 ) ) ( not ( = ?auto_182032 ?auto_182035 ) ) ( not ( = ?auto_182032 ?auto_182036 ) ) ( not ( = ?auto_182032 ?auto_182037 ) ) ( not ( = ?auto_182032 ?auto_182038 ) ) ( not ( = ?auto_182032 ?auto_182039 ) ) ( not ( = ?auto_182032 ?auto_182040 ) ) ( not ( = ?auto_182033 ?auto_182034 ) ) ( not ( = ?auto_182033 ?auto_182035 ) ) ( not ( = ?auto_182033 ?auto_182036 ) ) ( not ( = ?auto_182033 ?auto_182037 ) ) ( not ( = ?auto_182033 ?auto_182038 ) ) ( not ( = ?auto_182033 ?auto_182039 ) ) ( not ( = ?auto_182033 ?auto_182040 ) ) ( not ( = ?auto_182034 ?auto_182035 ) ) ( not ( = ?auto_182034 ?auto_182036 ) ) ( not ( = ?auto_182034 ?auto_182037 ) ) ( not ( = ?auto_182034 ?auto_182038 ) ) ( not ( = ?auto_182034 ?auto_182039 ) ) ( not ( = ?auto_182034 ?auto_182040 ) ) ( not ( = ?auto_182035 ?auto_182036 ) ) ( not ( = ?auto_182035 ?auto_182037 ) ) ( not ( = ?auto_182035 ?auto_182038 ) ) ( not ( = ?auto_182035 ?auto_182039 ) ) ( not ( = ?auto_182035 ?auto_182040 ) ) ( not ( = ?auto_182036 ?auto_182037 ) ) ( not ( = ?auto_182036 ?auto_182038 ) ) ( not ( = ?auto_182036 ?auto_182039 ) ) ( not ( = ?auto_182036 ?auto_182040 ) ) ( not ( = ?auto_182037 ?auto_182038 ) ) ( not ( = ?auto_182037 ?auto_182039 ) ) ( not ( = ?auto_182037 ?auto_182040 ) ) ( not ( = ?auto_182038 ?auto_182039 ) ) ( not ( = ?auto_182038 ?auto_182040 ) ) ( not ( = ?auto_182039 ?auto_182040 ) ) ( ON ?auto_182038 ?auto_182039 ) ( ON ?auto_182037 ?auto_182038 ) ( ON ?auto_182036 ?auto_182037 ) ( ON ?auto_182035 ?auto_182036 ) ( CLEAR ?auto_182033 ) ( ON ?auto_182034 ?auto_182035 ) ( CLEAR ?auto_182034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182030 ?auto_182031 ?auto_182032 ?auto_182033 ?auto_182034 )
      ( MAKE-10PILE ?auto_182030 ?auto_182031 ?auto_182032 ?auto_182033 ?auto_182034 ?auto_182035 ?auto_182036 ?auto_182037 ?auto_182038 ?auto_182039 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_182051 - BLOCK
      ?auto_182052 - BLOCK
      ?auto_182053 - BLOCK
      ?auto_182054 - BLOCK
      ?auto_182055 - BLOCK
      ?auto_182056 - BLOCK
      ?auto_182057 - BLOCK
      ?auto_182058 - BLOCK
      ?auto_182059 - BLOCK
      ?auto_182060 - BLOCK
    )
    :vars
    (
      ?auto_182061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182060 ?auto_182061 ) ( ON-TABLE ?auto_182051 ) ( ON ?auto_182052 ?auto_182051 ) ( ON ?auto_182053 ?auto_182052 ) ( not ( = ?auto_182051 ?auto_182052 ) ) ( not ( = ?auto_182051 ?auto_182053 ) ) ( not ( = ?auto_182051 ?auto_182054 ) ) ( not ( = ?auto_182051 ?auto_182055 ) ) ( not ( = ?auto_182051 ?auto_182056 ) ) ( not ( = ?auto_182051 ?auto_182057 ) ) ( not ( = ?auto_182051 ?auto_182058 ) ) ( not ( = ?auto_182051 ?auto_182059 ) ) ( not ( = ?auto_182051 ?auto_182060 ) ) ( not ( = ?auto_182051 ?auto_182061 ) ) ( not ( = ?auto_182052 ?auto_182053 ) ) ( not ( = ?auto_182052 ?auto_182054 ) ) ( not ( = ?auto_182052 ?auto_182055 ) ) ( not ( = ?auto_182052 ?auto_182056 ) ) ( not ( = ?auto_182052 ?auto_182057 ) ) ( not ( = ?auto_182052 ?auto_182058 ) ) ( not ( = ?auto_182052 ?auto_182059 ) ) ( not ( = ?auto_182052 ?auto_182060 ) ) ( not ( = ?auto_182052 ?auto_182061 ) ) ( not ( = ?auto_182053 ?auto_182054 ) ) ( not ( = ?auto_182053 ?auto_182055 ) ) ( not ( = ?auto_182053 ?auto_182056 ) ) ( not ( = ?auto_182053 ?auto_182057 ) ) ( not ( = ?auto_182053 ?auto_182058 ) ) ( not ( = ?auto_182053 ?auto_182059 ) ) ( not ( = ?auto_182053 ?auto_182060 ) ) ( not ( = ?auto_182053 ?auto_182061 ) ) ( not ( = ?auto_182054 ?auto_182055 ) ) ( not ( = ?auto_182054 ?auto_182056 ) ) ( not ( = ?auto_182054 ?auto_182057 ) ) ( not ( = ?auto_182054 ?auto_182058 ) ) ( not ( = ?auto_182054 ?auto_182059 ) ) ( not ( = ?auto_182054 ?auto_182060 ) ) ( not ( = ?auto_182054 ?auto_182061 ) ) ( not ( = ?auto_182055 ?auto_182056 ) ) ( not ( = ?auto_182055 ?auto_182057 ) ) ( not ( = ?auto_182055 ?auto_182058 ) ) ( not ( = ?auto_182055 ?auto_182059 ) ) ( not ( = ?auto_182055 ?auto_182060 ) ) ( not ( = ?auto_182055 ?auto_182061 ) ) ( not ( = ?auto_182056 ?auto_182057 ) ) ( not ( = ?auto_182056 ?auto_182058 ) ) ( not ( = ?auto_182056 ?auto_182059 ) ) ( not ( = ?auto_182056 ?auto_182060 ) ) ( not ( = ?auto_182056 ?auto_182061 ) ) ( not ( = ?auto_182057 ?auto_182058 ) ) ( not ( = ?auto_182057 ?auto_182059 ) ) ( not ( = ?auto_182057 ?auto_182060 ) ) ( not ( = ?auto_182057 ?auto_182061 ) ) ( not ( = ?auto_182058 ?auto_182059 ) ) ( not ( = ?auto_182058 ?auto_182060 ) ) ( not ( = ?auto_182058 ?auto_182061 ) ) ( not ( = ?auto_182059 ?auto_182060 ) ) ( not ( = ?auto_182059 ?auto_182061 ) ) ( not ( = ?auto_182060 ?auto_182061 ) ) ( ON ?auto_182059 ?auto_182060 ) ( ON ?auto_182058 ?auto_182059 ) ( ON ?auto_182057 ?auto_182058 ) ( ON ?auto_182056 ?auto_182057 ) ( ON ?auto_182055 ?auto_182056 ) ( CLEAR ?auto_182053 ) ( ON ?auto_182054 ?auto_182055 ) ( CLEAR ?auto_182054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182051 ?auto_182052 ?auto_182053 ?auto_182054 )
      ( MAKE-10PILE ?auto_182051 ?auto_182052 ?auto_182053 ?auto_182054 ?auto_182055 ?auto_182056 ?auto_182057 ?auto_182058 ?auto_182059 ?auto_182060 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_182072 - BLOCK
      ?auto_182073 - BLOCK
      ?auto_182074 - BLOCK
      ?auto_182075 - BLOCK
      ?auto_182076 - BLOCK
      ?auto_182077 - BLOCK
      ?auto_182078 - BLOCK
      ?auto_182079 - BLOCK
      ?auto_182080 - BLOCK
      ?auto_182081 - BLOCK
    )
    :vars
    (
      ?auto_182082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182081 ?auto_182082 ) ( ON-TABLE ?auto_182072 ) ( ON ?auto_182073 ?auto_182072 ) ( ON ?auto_182074 ?auto_182073 ) ( not ( = ?auto_182072 ?auto_182073 ) ) ( not ( = ?auto_182072 ?auto_182074 ) ) ( not ( = ?auto_182072 ?auto_182075 ) ) ( not ( = ?auto_182072 ?auto_182076 ) ) ( not ( = ?auto_182072 ?auto_182077 ) ) ( not ( = ?auto_182072 ?auto_182078 ) ) ( not ( = ?auto_182072 ?auto_182079 ) ) ( not ( = ?auto_182072 ?auto_182080 ) ) ( not ( = ?auto_182072 ?auto_182081 ) ) ( not ( = ?auto_182072 ?auto_182082 ) ) ( not ( = ?auto_182073 ?auto_182074 ) ) ( not ( = ?auto_182073 ?auto_182075 ) ) ( not ( = ?auto_182073 ?auto_182076 ) ) ( not ( = ?auto_182073 ?auto_182077 ) ) ( not ( = ?auto_182073 ?auto_182078 ) ) ( not ( = ?auto_182073 ?auto_182079 ) ) ( not ( = ?auto_182073 ?auto_182080 ) ) ( not ( = ?auto_182073 ?auto_182081 ) ) ( not ( = ?auto_182073 ?auto_182082 ) ) ( not ( = ?auto_182074 ?auto_182075 ) ) ( not ( = ?auto_182074 ?auto_182076 ) ) ( not ( = ?auto_182074 ?auto_182077 ) ) ( not ( = ?auto_182074 ?auto_182078 ) ) ( not ( = ?auto_182074 ?auto_182079 ) ) ( not ( = ?auto_182074 ?auto_182080 ) ) ( not ( = ?auto_182074 ?auto_182081 ) ) ( not ( = ?auto_182074 ?auto_182082 ) ) ( not ( = ?auto_182075 ?auto_182076 ) ) ( not ( = ?auto_182075 ?auto_182077 ) ) ( not ( = ?auto_182075 ?auto_182078 ) ) ( not ( = ?auto_182075 ?auto_182079 ) ) ( not ( = ?auto_182075 ?auto_182080 ) ) ( not ( = ?auto_182075 ?auto_182081 ) ) ( not ( = ?auto_182075 ?auto_182082 ) ) ( not ( = ?auto_182076 ?auto_182077 ) ) ( not ( = ?auto_182076 ?auto_182078 ) ) ( not ( = ?auto_182076 ?auto_182079 ) ) ( not ( = ?auto_182076 ?auto_182080 ) ) ( not ( = ?auto_182076 ?auto_182081 ) ) ( not ( = ?auto_182076 ?auto_182082 ) ) ( not ( = ?auto_182077 ?auto_182078 ) ) ( not ( = ?auto_182077 ?auto_182079 ) ) ( not ( = ?auto_182077 ?auto_182080 ) ) ( not ( = ?auto_182077 ?auto_182081 ) ) ( not ( = ?auto_182077 ?auto_182082 ) ) ( not ( = ?auto_182078 ?auto_182079 ) ) ( not ( = ?auto_182078 ?auto_182080 ) ) ( not ( = ?auto_182078 ?auto_182081 ) ) ( not ( = ?auto_182078 ?auto_182082 ) ) ( not ( = ?auto_182079 ?auto_182080 ) ) ( not ( = ?auto_182079 ?auto_182081 ) ) ( not ( = ?auto_182079 ?auto_182082 ) ) ( not ( = ?auto_182080 ?auto_182081 ) ) ( not ( = ?auto_182080 ?auto_182082 ) ) ( not ( = ?auto_182081 ?auto_182082 ) ) ( ON ?auto_182080 ?auto_182081 ) ( ON ?auto_182079 ?auto_182080 ) ( ON ?auto_182078 ?auto_182079 ) ( ON ?auto_182077 ?auto_182078 ) ( ON ?auto_182076 ?auto_182077 ) ( CLEAR ?auto_182074 ) ( ON ?auto_182075 ?auto_182076 ) ( CLEAR ?auto_182075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182072 ?auto_182073 ?auto_182074 ?auto_182075 )
      ( MAKE-10PILE ?auto_182072 ?auto_182073 ?auto_182074 ?auto_182075 ?auto_182076 ?auto_182077 ?auto_182078 ?auto_182079 ?auto_182080 ?auto_182081 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_182093 - BLOCK
      ?auto_182094 - BLOCK
      ?auto_182095 - BLOCK
      ?auto_182096 - BLOCK
      ?auto_182097 - BLOCK
      ?auto_182098 - BLOCK
      ?auto_182099 - BLOCK
      ?auto_182100 - BLOCK
      ?auto_182101 - BLOCK
      ?auto_182102 - BLOCK
    )
    :vars
    (
      ?auto_182103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182102 ?auto_182103 ) ( ON-TABLE ?auto_182093 ) ( ON ?auto_182094 ?auto_182093 ) ( not ( = ?auto_182093 ?auto_182094 ) ) ( not ( = ?auto_182093 ?auto_182095 ) ) ( not ( = ?auto_182093 ?auto_182096 ) ) ( not ( = ?auto_182093 ?auto_182097 ) ) ( not ( = ?auto_182093 ?auto_182098 ) ) ( not ( = ?auto_182093 ?auto_182099 ) ) ( not ( = ?auto_182093 ?auto_182100 ) ) ( not ( = ?auto_182093 ?auto_182101 ) ) ( not ( = ?auto_182093 ?auto_182102 ) ) ( not ( = ?auto_182093 ?auto_182103 ) ) ( not ( = ?auto_182094 ?auto_182095 ) ) ( not ( = ?auto_182094 ?auto_182096 ) ) ( not ( = ?auto_182094 ?auto_182097 ) ) ( not ( = ?auto_182094 ?auto_182098 ) ) ( not ( = ?auto_182094 ?auto_182099 ) ) ( not ( = ?auto_182094 ?auto_182100 ) ) ( not ( = ?auto_182094 ?auto_182101 ) ) ( not ( = ?auto_182094 ?auto_182102 ) ) ( not ( = ?auto_182094 ?auto_182103 ) ) ( not ( = ?auto_182095 ?auto_182096 ) ) ( not ( = ?auto_182095 ?auto_182097 ) ) ( not ( = ?auto_182095 ?auto_182098 ) ) ( not ( = ?auto_182095 ?auto_182099 ) ) ( not ( = ?auto_182095 ?auto_182100 ) ) ( not ( = ?auto_182095 ?auto_182101 ) ) ( not ( = ?auto_182095 ?auto_182102 ) ) ( not ( = ?auto_182095 ?auto_182103 ) ) ( not ( = ?auto_182096 ?auto_182097 ) ) ( not ( = ?auto_182096 ?auto_182098 ) ) ( not ( = ?auto_182096 ?auto_182099 ) ) ( not ( = ?auto_182096 ?auto_182100 ) ) ( not ( = ?auto_182096 ?auto_182101 ) ) ( not ( = ?auto_182096 ?auto_182102 ) ) ( not ( = ?auto_182096 ?auto_182103 ) ) ( not ( = ?auto_182097 ?auto_182098 ) ) ( not ( = ?auto_182097 ?auto_182099 ) ) ( not ( = ?auto_182097 ?auto_182100 ) ) ( not ( = ?auto_182097 ?auto_182101 ) ) ( not ( = ?auto_182097 ?auto_182102 ) ) ( not ( = ?auto_182097 ?auto_182103 ) ) ( not ( = ?auto_182098 ?auto_182099 ) ) ( not ( = ?auto_182098 ?auto_182100 ) ) ( not ( = ?auto_182098 ?auto_182101 ) ) ( not ( = ?auto_182098 ?auto_182102 ) ) ( not ( = ?auto_182098 ?auto_182103 ) ) ( not ( = ?auto_182099 ?auto_182100 ) ) ( not ( = ?auto_182099 ?auto_182101 ) ) ( not ( = ?auto_182099 ?auto_182102 ) ) ( not ( = ?auto_182099 ?auto_182103 ) ) ( not ( = ?auto_182100 ?auto_182101 ) ) ( not ( = ?auto_182100 ?auto_182102 ) ) ( not ( = ?auto_182100 ?auto_182103 ) ) ( not ( = ?auto_182101 ?auto_182102 ) ) ( not ( = ?auto_182101 ?auto_182103 ) ) ( not ( = ?auto_182102 ?auto_182103 ) ) ( ON ?auto_182101 ?auto_182102 ) ( ON ?auto_182100 ?auto_182101 ) ( ON ?auto_182099 ?auto_182100 ) ( ON ?auto_182098 ?auto_182099 ) ( ON ?auto_182097 ?auto_182098 ) ( ON ?auto_182096 ?auto_182097 ) ( CLEAR ?auto_182094 ) ( ON ?auto_182095 ?auto_182096 ) ( CLEAR ?auto_182095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182093 ?auto_182094 ?auto_182095 )
      ( MAKE-10PILE ?auto_182093 ?auto_182094 ?auto_182095 ?auto_182096 ?auto_182097 ?auto_182098 ?auto_182099 ?auto_182100 ?auto_182101 ?auto_182102 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_182114 - BLOCK
      ?auto_182115 - BLOCK
      ?auto_182116 - BLOCK
      ?auto_182117 - BLOCK
      ?auto_182118 - BLOCK
      ?auto_182119 - BLOCK
      ?auto_182120 - BLOCK
      ?auto_182121 - BLOCK
      ?auto_182122 - BLOCK
      ?auto_182123 - BLOCK
    )
    :vars
    (
      ?auto_182124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182123 ?auto_182124 ) ( ON-TABLE ?auto_182114 ) ( ON ?auto_182115 ?auto_182114 ) ( not ( = ?auto_182114 ?auto_182115 ) ) ( not ( = ?auto_182114 ?auto_182116 ) ) ( not ( = ?auto_182114 ?auto_182117 ) ) ( not ( = ?auto_182114 ?auto_182118 ) ) ( not ( = ?auto_182114 ?auto_182119 ) ) ( not ( = ?auto_182114 ?auto_182120 ) ) ( not ( = ?auto_182114 ?auto_182121 ) ) ( not ( = ?auto_182114 ?auto_182122 ) ) ( not ( = ?auto_182114 ?auto_182123 ) ) ( not ( = ?auto_182114 ?auto_182124 ) ) ( not ( = ?auto_182115 ?auto_182116 ) ) ( not ( = ?auto_182115 ?auto_182117 ) ) ( not ( = ?auto_182115 ?auto_182118 ) ) ( not ( = ?auto_182115 ?auto_182119 ) ) ( not ( = ?auto_182115 ?auto_182120 ) ) ( not ( = ?auto_182115 ?auto_182121 ) ) ( not ( = ?auto_182115 ?auto_182122 ) ) ( not ( = ?auto_182115 ?auto_182123 ) ) ( not ( = ?auto_182115 ?auto_182124 ) ) ( not ( = ?auto_182116 ?auto_182117 ) ) ( not ( = ?auto_182116 ?auto_182118 ) ) ( not ( = ?auto_182116 ?auto_182119 ) ) ( not ( = ?auto_182116 ?auto_182120 ) ) ( not ( = ?auto_182116 ?auto_182121 ) ) ( not ( = ?auto_182116 ?auto_182122 ) ) ( not ( = ?auto_182116 ?auto_182123 ) ) ( not ( = ?auto_182116 ?auto_182124 ) ) ( not ( = ?auto_182117 ?auto_182118 ) ) ( not ( = ?auto_182117 ?auto_182119 ) ) ( not ( = ?auto_182117 ?auto_182120 ) ) ( not ( = ?auto_182117 ?auto_182121 ) ) ( not ( = ?auto_182117 ?auto_182122 ) ) ( not ( = ?auto_182117 ?auto_182123 ) ) ( not ( = ?auto_182117 ?auto_182124 ) ) ( not ( = ?auto_182118 ?auto_182119 ) ) ( not ( = ?auto_182118 ?auto_182120 ) ) ( not ( = ?auto_182118 ?auto_182121 ) ) ( not ( = ?auto_182118 ?auto_182122 ) ) ( not ( = ?auto_182118 ?auto_182123 ) ) ( not ( = ?auto_182118 ?auto_182124 ) ) ( not ( = ?auto_182119 ?auto_182120 ) ) ( not ( = ?auto_182119 ?auto_182121 ) ) ( not ( = ?auto_182119 ?auto_182122 ) ) ( not ( = ?auto_182119 ?auto_182123 ) ) ( not ( = ?auto_182119 ?auto_182124 ) ) ( not ( = ?auto_182120 ?auto_182121 ) ) ( not ( = ?auto_182120 ?auto_182122 ) ) ( not ( = ?auto_182120 ?auto_182123 ) ) ( not ( = ?auto_182120 ?auto_182124 ) ) ( not ( = ?auto_182121 ?auto_182122 ) ) ( not ( = ?auto_182121 ?auto_182123 ) ) ( not ( = ?auto_182121 ?auto_182124 ) ) ( not ( = ?auto_182122 ?auto_182123 ) ) ( not ( = ?auto_182122 ?auto_182124 ) ) ( not ( = ?auto_182123 ?auto_182124 ) ) ( ON ?auto_182122 ?auto_182123 ) ( ON ?auto_182121 ?auto_182122 ) ( ON ?auto_182120 ?auto_182121 ) ( ON ?auto_182119 ?auto_182120 ) ( ON ?auto_182118 ?auto_182119 ) ( ON ?auto_182117 ?auto_182118 ) ( CLEAR ?auto_182115 ) ( ON ?auto_182116 ?auto_182117 ) ( CLEAR ?auto_182116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182114 ?auto_182115 ?auto_182116 )
      ( MAKE-10PILE ?auto_182114 ?auto_182115 ?auto_182116 ?auto_182117 ?auto_182118 ?auto_182119 ?auto_182120 ?auto_182121 ?auto_182122 ?auto_182123 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_182135 - BLOCK
      ?auto_182136 - BLOCK
      ?auto_182137 - BLOCK
      ?auto_182138 - BLOCK
      ?auto_182139 - BLOCK
      ?auto_182140 - BLOCK
      ?auto_182141 - BLOCK
      ?auto_182142 - BLOCK
      ?auto_182143 - BLOCK
      ?auto_182144 - BLOCK
    )
    :vars
    (
      ?auto_182145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182144 ?auto_182145 ) ( ON-TABLE ?auto_182135 ) ( not ( = ?auto_182135 ?auto_182136 ) ) ( not ( = ?auto_182135 ?auto_182137 ) ) ( not ( = ?auto_182135 ?auto_182138 ) ) ( not ( = ?auto_182135 ?auto_182139 ) ) ( not ( = ?auto_182135 ?auto_182140 ) ) ( not ( = ?auto_182135 ?auto_182141 ) ) ( not ( = ?auto_182135 ?auto_182142 ) ) ( not ( = ?auto_182135 ?auto_182143 ) ) ( not ( = ?auto_182135 ?auto_182144 ) ) ( not ( = ?auto_182135 ?auto_182145 ) ) ( not ( = ?auto_182136 ?auto_182137 ) ) ( not ( = ?auto_182136 ?auto_182138 ) ) ( not ( = ?auto_182136 ?auto_182139 ) ) ( not ( = ?auto_182136 ?auto_182140 ) ) ( not ( = ?auto_182136 ?auto_182141 ) ) ( not ( = ?auto_182136 ?auto_182142 ) ) ( not ( = ?auto_182136 ?auto_182143 ) ) ( not ( = ?auto_182136 ?auto_182144 ) ) ( not ( = ?auto_182136 ?auto_182145 ) ) ( not ( = ?auto_182137 ?auto_182138 ) ) ( not ( = ?auto_182137 ?auto_182139 ) ) ( not ( = ?auto_182137 ?auto_182140 ) ) ( not ( = ?auto_182137 ?auto_182141 ) ) ( not ( = ?auto_182137 ?auto_182142 ) ) ( not ( = ?auto_182137 ?auto_182143 ) ) ( not ( = ?auto_182137 ?auto_182144 ) ) ( not ( = ?auto_182137 ?auto_182145 ) ) ( not ( = ?auto_182138 ?auto_182139 ) ) ( not ( = ?auto_182138 ?auto_182140 ) ) ( not ( = ?auto_182138 ?auto_182141 ) ) ( not ( = ?auto_182138 ?auto_182142 ) ) ( not ( = ?auto_182138 ?auto_182143 ) ) ( not ( = ?auto_182138 ?auto_182144 ) ) ( not ( = ?auto_182138 ?auto_182145 ) ) ( not ( = ?auto_182139 ?auto_182140 ) ) ( not ( = ?auto_182139 ?auto_182141 ) ) ( not ( = ?auto_182139 ?auto_182142 ) ) ( not ( = ?auto_182139 ?auto_182143 ) ) ( not ( = ?auto_182139 ?auto_182144 ) ) ( not ( = ?auto_182139 ?auto_182145 ) ) ( not ( = ?auto_182140 ?auto_182141 ) ) ( not ( = ?auto_182140 ?auto_182142 ) ) ( not ( = ?auto_182140 ?auto_182143 ) ) ( not ( = ?auto_182140 ?auto_182144 ) ) ( not ( = ?auto_182140 ?auto_182145 ) ) ( not ( = ?auto_182141 ?auto_182142 ) ) ( not ( = ?auto_182141 ?auto_182143 ) ) ( not ( = ?auto_182141 ?auto_182144 ) ) ( not ( = ?auto_182141 ?auto_182145 ) ) ( not ( = ?auto_182142 ?auto_182143 ) ) ( not ( = ?auto_182142 ?auto_182144 ) ) ( not ( = ?auto_182142 ?auto_182145 ) ) ( not ( = ?auto_182143 ?auto_182144 ) ) ( not ( = ?auto_182143 ?auto_182145 ) ) ( not ( = ?auto_182144 ?auto_182145 ) ) ( ON ?auto_182143 ?auto_182144 ) ( ON ?auto_182142 ?auto_182143 ) ( ON ?auto_182141 ?auto_182142 ) ( ON ?auto_182140 ?auto_182141 ) ( ON ?auto_182139 ?auto_182140 ) ( ON ?auto_182138 ?auto_182139 ) ( ON ?auto_182137 ?auto_182138 ) ( CLEAR ?auto_182135 ) ( ON ?auto_182136 ?auto_182137 ) ( CLEAR ?auto_182136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182135 ?auto_182136 )
      ( MAKE-10PILE ?auto_182135 ?auto_182136 ?auto_182137 ?auto_182138 ?auto_182139 ?auto_182140 ?auto_182141 ?auto_182142 ?auto_182143 ?auto_182144 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_182156 - BLOCK
      ?auto_182157 - BLOCK
      ?auto_182158 - BLOCK
      ?auto_182159 - BLOCK
      ?auto_182160 - BLOCK
      ?auto_182161 - BLOCK
      ?auto_182162 - BLOCK
      ?auto_182163 - BLOCK
      ?auto_182164 - BLOCK
      ?auto_182165 - BLOCK
    )
    :vars
    (
      ?auto_182166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182165 ?auto_182166 ) ( ON-TABLE ?auto_182156 ) ( not ( = ?auto_182156 ?auto_182157 ) ) ( not ( = ?auto_182156 ?auto_182158 ) ) ( not ( = ?auto_182156 ?auto_182159 ) ) ( not ( = ?auto_182156 ?auto_182160 ) ) ( not ( = ?auto_182156 ?auto_182161 ) ) ( not ( = ?auto_182156 ?auto_182162 ) ) ( not ( = ?auto_182156 ?auto_182163 ) ) ( not ( = ?auto_182156 ?auto_182164 ) ) ( not ( = ?auto_182156 ?auto_182165 ) ) ( not ( = ?auto_182156 ?auto_182166 ) ) ( not ( = ?auto_182157 ?auto_182158 ) ) ( not ( = ?auto_182157 ?auto_182159 ) ) ( not ( = ?auto_182157 ?auto_182160 ) ) ( not ( = ?auto_182157 ?auto_182161 ) ) ( not ( = ?auto_182157 ?auto_182162 ) ) ( not ( = ?auto_182157 ?auto_182163 ) ) ( not ( = ?auto_182157 ?auto_182164 ) ) ( not ( = ?auto_182157 ?auto_182165 ) ) ( not ( = ?auto_182157 ?auto_182166 ) ) ( not ( = ?auto_182158 ?auto_182159 ) ) ( not ( = ?auto_182158 ?auto_182160 ) ) ( not ( = ?auto_182158 ?auto_182161 ) ) ( not ( = ?auto_182158 ?auto_182162 ) ) ( not ( = ?auto_182158 ?auto_182163 ) ) ( not ( = ?auto_182158 ?auto_182164 ) ) ( not ( = ?auto_182158 ?auto_182165 ) ) ( not ( = ?auto_182158 ?auto_182166 ) ) ( not ( = ?auto_182159 ?auto_182160 ) ) ( not ( = ?auto_182159 ?auto_182161 ) ) ( not ( = ?auto_182159 ?auto_182162 ) ) ( not ( = ?auto_182159 ?auto_182163 ) ) ( not ( = ?auto_182159 ?auto_182164 ) ) ( not ( = ?auto_182159 ?auto_182165 ) ) ( not ( = ?auto_182159 ?auto_182166 ) ) ( not ( = ?auto_182160 ?auto_182161 ) ) ( not ( = ?auto_182160 ?auto_182162 ) ) ( not ( = ?auto_182160 ?auto_182163 ) ) ( not ( = ?auto_182160 ?auto_182164 ) ) ( not ( = ?auto_182160 ?auto_182165 ) ) ( not ( = ?auto_182160 ?auto_182166 ) ) ( not ( = ?auto_182161 ?auto_182162 ) ) ( not ( = ?auto_182161 ?auto_182163 ) ) ( not ( = ?auto_182161 ?auto_182164 ) ) ( not ( = ?auto_182161 ?auto_182165 ) ) ( not ( = ?auto_182161 ?auto_182166 ) ) ( not ( = ?auto_182162 ?auto_182163 ) ) ( not ( = ?auto_182162 ?auto_182164 ) ) ( not ( = ?auto_182162 ?auto_182165 ) ) ( not ( = ?auto_182162 ?auto_182166 ) ) ( not ( = ?auto_182163 ?auto_182164 ) ) ( not ( = ?auto_182163 ?auto_182165 ) ) ( not ( = ?auto_182163 ?auto_182166 ) ) ( not ( = ?auto_182164 ?auto_182165 ) ) ( not ( = ?auto_182164 ?auto_182166 ) ) ( not ( = ?auto_182165 ?auto_182166 ) ) ( ON ?auto_182164 ?auto_182165 ) ( ON ?auto_182163 ?auto_182164 ) ( ON ?auto_182162 ?auto_182163 ) ( ON ?auto_182161 ?auto_182162 ) ( ON ?auto_182160 ?auto_182161 ) ( ON ?auto_182159 ?auto_182160 ) ( ON ?auto_182158 ?auto_182159 ) ( CLEAR ?auto_182156 ) ( ON ?auto_182157 ?auto_182158 ) ( CLEAR ?auto_182157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182156 ?auto_182157 )
      ( MAKE-10PILE ?auto_182156 ?auto_182157 ?auto_182158 ?auto_182159 ?auto_182160 ?auto_182161 ?auto_182162 ?auto_182163 ?auto_182164 ?auto_182165 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_182177 - BLOCK
      ?auto_182178 - BLOCK
      ?auto_182179 - BLOCK
      ?auto_182180 - BLOCK
      ?auto_182181 - BLOCK
      ?auto_182182 - BLOCK
      ?auto_182183 - BLOCK
      ?auto_182184 - BLOCK
      ?auto_182185 - BLOCK
      ?auto_182186 - BLOCK
    )
    :vars
    (
      ?auto_182187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182186 ?auto_182187 ) ( not ( = ?auto_182177 ?auto_182178 ) ) ( not ( = ?auto_182177 ?auto_182179 ) ) ( not ( = ?auto_182177 ?auto_182180 ) ) ( not ( = ?auto_182177 ?auto_182181 ) ) ( not ( = ?auto_182177 ?auto_182182 ) ) ( not ( = ?auto_182177 ?auto_182183 ) ) ( not ( = ?auto_182177 ?auto_182184 ) ) ( not ( = ?auto_182177 ?auto_182185 ) ) ( not ( = ?auto_182177 ?auto_182186 ) ) ( not ( = ?auto_182177 ?auto_182187 ) ) ( not ( = ?auto_182178 ?auto_182179 ) ) ( not ( = ?auto_182178 ?auto_182180 ) ) ( not ( = ?auto_182178 ?auto_182181 ) ) ( not ( = ?auto_182178 ?auto_182182 ) ) ( not ( = ?auto_182178 ?auto_182183 ) ) ( not ( = ?auto_182178 ?auto_182184 ) ) ( not ( = ?auto_182178 ?auto_182185 ) ) ( not ( = ?auto_182178 ?auto_182186 ) ) ( not ( = ?auto_182178 ?auto_182187 ) ) ( not ( = ?auto_182179 ?auto_182180 ) ) ( not ( = ?auto_182179 ?auto_182181 ) ) ( not ( = ?auto_182179 ?auto_182182 ) ) ( not ( = ?auto_182179 ?auto_182183 ) ) ( not ( = ?auto_182179 ?auto_182184 ) ) ( not ( = ?auto_182179 ?auto_182185 ) ) ( not ( = ?auto_182179 ?auto_182186 ) ) ( not ( = ?auto_182179 ?auto_182187 ) ) ( not ( = ?auto_182180 ?auto_182181 ) ) ( not ( = ?auto_182180 ?auto_182182 ) ) ( not ( = ?auto_182180 ?auto_182183 ) ) ( not ( = ?auto_182180 ?auto_182184 ) ) ( not ( = ?auto_182180 ?auto_182185 ) ) ( not ( = ?auto_182180 ?auto_182186 ) ) ( not ( = ?auto_182180 ?auto_182187 ) ) ( not ( = ?auto_182181 ?auto_182182 ) ) ( not ( = ?auto_182181 ?auto_182183 ) ) ( not ( = ?auto_182181 ?auto_182184 ) ) ( not ( = ?auto_182181 ?auto_182185 ) ) ( not ( = ?auto_182181 ?auto_182186 ) ) ( not ( = ?auto_182181 ?auto_182187 ) ) ( not ( = ?auto_182182 ?auto_182183 ) ) ( not ( = ?auto_182182 ?auto_182184 ) ) ( not ( = ?auto_182182 ?auto_182185 ) ) ( not ( = ?auto_182182 ?auto_182186 ) ) ( not ( = ?auto_182182 ?auto_182187 ) ) ( not ( = ?auto_182183 ?auto_182184 ) ) ( not ( = ?auto_182183 ?auto_182185 ) ) ( not ( = ?auto_182183 ?auto_182186 ) ) ( not ( = ?auto_182183 ?auto_182187 ) ) ( not ( = ?auto_182184 ?auto_182185 ) ) ( not ( = ?auto_182184 ?auto_182186 ) ) ( not ( = ?auto_182184 ?auto_182187 ) ) ( not ( = ?auto_182185 ?auto_182186 ) ) ( not ( = ?auto_182185 ?auto_182187 ) ) ( not ( = ?auto_182186 ?auto_182187 ) ) ( ON ?auto_182185 ?auto_182186 ) ( ON ?auto_182184 ?auto_182185 ) ( ON ?auto_182183 ?auto_182184 ) ( ON ?auto_182182 ?auto_182183 ) ( ON ?auto_182181 ?auto_182182 ) ( ON ?auto_182180 ?auto_182181 ) ( ON ?auto_182179 ?auto_182180 ) ( ON ?auto_182178 ?auto_182179 ) ( ON ?auto_182177 ?auto_182178 ) ( CLEAR ?auto_182177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182177 )
      ( MAKE-10PILE ?auto_182177 ?auto_182178 ?auto_182179 ?auto_182180 ?auto_182181 ?auto_182182 ?auto_182183 ?auto_182184 ?auto_182185 ?auto_182186 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_182198 - BLOCK
      ?auto_182199 - BLOCK
      ?auto_182200 - BLOCK
      ?auto_182201 - BLOCK
      ?auto_182202 - BLOCK
      ?auto_182203 - BLOCK
      ?auto_182204 - BLOCK
      ?auto_182205 - BLOCK
      ?auto_182206 - BLOCK
      ?auto_182207 - BLOCK
    )
    :vars
    (
      ?auto_182208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182207 ?auto_182208 ) ( not ( = ?auto_182198 ?auto_182199 ) ) ( not ( = ?auto_182198 ?auto_182200 ) ) ( not ( = ?auto_182198 ?auto_182201 ) ) ( not ( = ?auto_182198 ?auto_182202 ) ) ( not ( = ?auto_182198 ?auto_182203 ) ) ( not ( = ?auto_182198 ?auto_182204 ) ) ( not ( = ?auto_182198 ?auto_182205 ) ) ( not ( = ?auto_182198 ?auto_182206 ) ) ( not ( = ?auto_182198 ?auto_182207 ) ) ( not ( = ?auto_182198 ?auto_182208 ) ) ( not ( = ?auto_182199 ?auto_182200 ) ) ( not ( = ?auto_182199 ?auto_182201 ) ) ( not ( = ?auto_182199 ?auto_182202 ) ) ( not ( = ?auto_182199 ?auto_182203 ) ) ( not ( = ?auto_182199 ?auto_182204 ) ) ( not ( = ?auto_182199 ?auto_182205 ) ) ( not ( = ?auto_182199 ?auto_182206 ) ) ( not ( = ?auto_182199 ?auto_182207 ) ) ( not ( = ?auto_182199 ?auto_182208 ) ) ( not ( = ?auto_182200 ?auto_182201 ) ) ( not ( = ?auto_182200 ?auto_182202 ) ) ( not ( = ?auto_182200 ?auto_182203 ) ) ( not ( = ?auto_182200 ?auto_182204 ) ) ( not ( = ?auto_182200 ?auto_182205 ) ) ( not ( = ?auto_182200 ?auto_182206 ) ) ( not ( = ?auto_182200 ?auto_182207 ) ) ( not ( = ?auto_182200 ?auto_182208 ) ) ( not ( = ?auto_182201 ?auto_182202 ) ) ( not ( = ?auto_182201 ?auto_182203 ) ) ( not ( = ?auto_182201 ?auto_182204 ) ) ( not ( = ?auto_182201 ?auto_182205 ) ) ( not ( = ?auto_182201 ?auto_182206 ) ) ( not ( = ?auto_182201 ?auto_182207 ) ) ( not ( = ?auto_182201 ?auto_182208 ) ) ( not ( = ?auto_182202 ?auto_182203 ) ) ( not ( = ?auto_182202 ?auto_182204 ) ) ( not ( = ?auto_182202 ?auto_182205 ) ) ( not ( = ?auto_182202 ?auto_182206 ) ) ( not ( = ?auto_182202 ?auto_182207 ) ) ( not ( = ?auto_182202 ?auto_182208 ) ) ( not ( = ?auto_182203 ?auto_182204 ) ) ( not ( = ?auto_182203 ?auto_182205 ) ) ( not ( = ?auto_182203 ?auto_182206 ) ) ( not ( = ?auto_182203 ?auto_182207 ) ) ( not ( = ?auto_182203 ?auto_182208 ) ) ( not ( = ?auto_182204 ?auto_182205 ) ) ( not ( = ?auto_182204 ?auto_182206 ) ) ( not ( = ?auto_182204 ?auto_182207 ) ) ( not ( = ?auto_182204 ?auto_182208 ) ) ( not ( = ?auto_182205 ?auto_182206 ) ) ( not ( = ?auto_182205 ?auto_182207 ) ) ( not ( = ?auto_182205 ?auto_182208 ) ) ( not ( = ?auto_182206 ?auto_182207 ) ) ( not ( = ?auto_182206 ?auto_182208 ) ) ( not ( = ?auto_182207 ?auto_182208 ) ) ( ON ?auto_182206 ?auto_182207 ) ( ON ?auto_182205 ?auto_182206 ) ( ON ?auto_182204 ?auto_182205 ) ( ON ?auto_182203 ?auto_182204 ) ( ON ?auto_182202 ?auto_182203 ) ( ON ?auto_182201 ?auto_182202 ) ( ON ?auto_182200 ?auto_182201 ) ( ON ?auto_182199 ?auto_182200 ) ( ON ?auto_182198 ?auto_182199 ) ( CLEAR ?auto_182198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182198 )
      ( MAKE-10PILE ?auto_182198 ?auto_182199 ?auto_182200 ?auto_182201 ?auto_182202 ?auto_182203 ?auto_182204 ?auto_182205 ?auto_182206 ?auto_182207 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182220 - BLOCK
      ?auto_182221 - BLOCK
      ?auto_182222 - BLOCK
      ?auto_182223 - BLOCK
      ?auto_182224 - BLOCK
      ?auto_182225 - BLOCK
      ?auto_182226 - BLOCK
      ?auto_182227 - BLOCK
      ?auto_182228 - BLOCK
      ?auto_182229 - BLOCK
      ?auto_182230 - BLOCK
    )
    :vars
    (
      ?auto_182231 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_182229 ) ( ON ?auto_182230 ?auto_182231 ) ( CLEAR ?auto_182230 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182220 ) ( ON ?auto_182221 ?auto_182220 ) ( ON ?auto_182222 ?auto_182221 ) ( ON ?auto_182223 ?auto_182222 ) ( ON ?auto_182224 ?auto_182223 ) ( ON ?auto_182225 ?auto_182224 ) ( ON ?auto_182226 ?auto_182225 ) ( ON ?auto_182227 ?auto_182226 ) ( ON ?auto_182228 ?auto_182227 ) ( ON ?auto_182229 ?auto_182228 ) ( not ( = ?auto_182220 ?auto_182221 ) ) ( not ( = ?auto_182220 ?auto_182222 ) ) ( not ( = ?auto_182220 ?auto_182223 ) ) ( not ( = ?auto_182220 ?auto_182224 ) ) ( not ( = ?auto_182220 ?auto_182225 ) ) ( not ( = ?auto_182220 ?auto_182226 ) ) ( not ( = ?auto_182220 ?auto_182227 ) ) ( not ( = ?auto_182220 ?auto_182228 ) ) ( not ( = ?auto_182220 ?auto_182229 ) ) ( not ( = ?auto_182220 ?auto_182230 ) ) ( not ( = ?auto_182220 ?auto_182231 ) ) ( not ( = ?auto_182221 ?auto_182222 ) ) ( not ( = ?auto_182221 ?auto_182223 ) ) ( not ( = ?auto_182221 ?auto_182224 ) ) ( not ( = ?auto_182221 ?auto_182225 ) ) ( not ( = ?auto_182221 ?auto_182226 ) ) ( not ( = ?auto_182221 ?auto_182227 ) ) ( not ( = ?auto_182221 ?auto_182228 ) ) ( not ( = ?auto_182221 ?auto_182229 ) ) ( not ( = ?auto_182221 ?auto_182230 ) ) ( not ( = ?auto_182221 ?auto_182231 ) ) ( not ( = ?auto_182222 ?auto_182223 ) ) ( not ( = ?auto_182222 ?auto_182224 ) ) ( not ( = ?auto_182222 ?auto_182225 ) ) ( not ( = ?auto_182222 ?auto_182226 ) ) ( not ( = ?auto_182222 ?auto_182227 ) ) ( not ( = ?auto_182222 ?auto_182228 ) ) ( not ( = ?auto_182222 ?auto_182229 ) ) ( not ( = ?auto_182222 ?auto_182230 ) ) ( not ( = ?auto_182222 ?auto_182231 ) ) ( not ( = ?auto_182223 ?auto_182224 ) ) ( not ( = ?auto_182223 ?auto_182225 ) ) ( not ( = ?auto_182223 ?auto_182226 ) ) ( not ( = ?auto_182223 ?auto_182227 ) ) ( not ( = ?auto_182223 ?auto_182228 ) ) ( not ( = ?auto_182223 ?auto_182229 ) ) ( not ( = ?auto_182223 ?auto_182230 ) ) ( not ( = ?auto_182223 ?auto_182231 ) ) ( not ( = ?auto_182224 ?auto_182225 ) ) ( not ( = ?auto_182224 ?auto_182226 ) ) ( not ( = ?auto_182224 ?auto_182227 ) ) ( not ( = ?auto_182224 ?auto_182228 ) ) ( not ( = ?auto_182224 ?auto_182229 ) ) ( not ( = ?auto_182224 ?auto_182230 ) ) ( not ( = ?auto_182224 ?auto_182231 ) ) ( not ( = ?auto_182225 ?auto_182226 ) ) ( not ( = ?auto_182225 ?auto_182227 ) ) ( not ( = ?auto_182225 ?auto_182228 ) ) ( not ( = ?auto_182225 ?auto_182229 ) ) ( not ( = ?auto_182225 ?auto_182230 ) ) ( not ( = ?auto_182225 ?auto_182231 ) ) ( not ( = ?auto_182226 ?auto_182227 ) ) ( not ( = ?auto_182226 ?auto_182228 ) ) ( not ( = ?auto_182226 ?auto_182229 ) ) ( not ( = ?auto_182226 ?auto_182230 ) ) ( not ( = ?auto_182226 ?auto_182231 ) ) ( not ( = ?auto_182227 ?auto_182228 ) ) ( not ( = ?auto_182227 ?auto_182229 ) ) ( not ( = ?auto_182227 ?auto_182230 ) ) ( not ( = ?auto_182227 ?auto_182231 ) ) ( not ( = ?auto_182228 ?auto_182229 ) ) ( not ( = ?auto_182228 ?auto_182230 ) ) ( not ( = ?auto_182228 ?auto_182231 ) ) ( not ( = ?auto_182229 ?auto_182230 ) ) ( not ( = ?auto_182229 ?auto_182231 ) ) ( not ( = ?auto_182230 ?auto_182231 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_182230 ?auto_182231 )
      ( !STACK ?auto_182230 ?auto_182229 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182243 - BLOCK
      ?auto_182244 - BLOCK
      ?auto_182245 - BLOCK
      ?auto_182246 - BLOCK
      ?auto_182247 - BLOCK
      ?auto_182248 - BLOCK
      ?auto_182249 - BLOCK
      ?auto_182250 - BLOCK
      ?auto_182251 - BLOCK
      ?auto_182252 - BLOCK
      ?auto_182253 - BLOCK
    )
    :vars
    (
      ?auto_182254 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_182252 ) ( ON ?auto_182253 ?auto_182254 ) ( CLEAR ?auto_182253 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182243 ) ( ON ?auto_182244 ?auto_182243 ) ( ON ?auto_182245 ?auto_182244 ) ( ON ?auto_182246 ?auto_182245 ) ( ON ?auto_182247 ?auto_182246 ) ( ON ?auto_182248 ?auto_182247 ) ( ON ?auto_182249 ?auto_182248 ) ( ON ?auto_182250 ?auto_182249 ) ( ON ?auto_182251 ?auto_182250 ) ( ON ?auto_182252 ?auto_182251 ) ( not ( = ?auto_182243 ?auto_182244 ) ) ( not ( = ?auto_182243 ?auto_182245 ) ) ( not ( = ?auto_182243 ?auto_182246 ) ) ( not ( = ?auto_182243 ?auto_182247 ) ) ( not ( = ?auto_182243 ?auto_182248 ) ) ( not ( = ?auto_182243 ?auto_182249 ) ) ( not ( = ?auto_182243 ?auto_182250 ) ) ( not ( = ?auto_182243 ?auto_182251 ) ) ( not ( = ?auto_182243 ?auto_182252 ) ) ( not ( = ?auto_182243 ?auto_182253 ) ) ( not ( = ?auto_182243 ?auto_182254 ) ) ( not ( = ?auto_182244 ?auto_182245 ) ) ( not ( = ?auto_182244 ?auto_182246 ) ) ( not ( = ?auto_182244 ?auto_182247 ) ) ( not ( = ?auto_182244 ?auto_182248 ) ) ( not ( = ?auto_182244 ?auto_182249 ) ) ( not ( = ?auto_182244 ?auto_182250 ) ) ( not ( = ?auto_182244 ?auto_182251 ) ) ( not ( = ?auto_182244 ?auto_182252 ) ) ( not ( = ?auto_182244 ?auto_182253 ) ) ( not ( = ?auto_182244 ?auto_182254 ) ) ( not ( = ?auto_182245 ?auto_182246 ) ) ( not ( = ?auto_182245 ?auto_182247 ) ) ( not ( = ?auto_182245 ?auto_182248 ) ) ( not ( = ?auto_182245 ?auto_182249 ) ) ( not ( = ?auto_182245 ?auto_182250 ) ) ( not ( = ?auto_182245 ?auto_182251 ) ) ( not ( = ?auto_182245 ?auto_182252 ) ) ( not ( = ?auto_182245 ?auto_182253 ) ) ( not ( = ?auto_182245 ?auto_182254 ) ) ( not ( = ?auto_182246 ?auto_182247 ) ) ( not ( = ?auto_182246 ?auto_182248 ) ) ( not ( = ?auto_182246 ?auto_182249 ) ) ( not ( = ?auto_182246 ?auto_182250 ) ) ( not ( = ?auto_182246 ?auto_182251 ) ) ( not ( = ?auto_182246 ?auto_182252 ) ) ( not ( = ?auto_182246 ?auto_182253 ) ) ( not ( = ?auto_182246 ?auto_182254 ) ) ( not ( = ?auto_182247 ?auto_182248 ) ) ( not ( = ?auto_182247 ?auto_182249 ) ) ( not ( = ?auto_182247 ?auto_182250 ) ) ( not ( = ?auto_182247 ?auto_182251 ) ) ( not ( = ?auto_182247 ?auto_182252 ) ) ( not ( = ?auto_182247 ?auto_182253 ) ) ( not ( = ?auto_182247 ?auto_182254 ) ) ( not ( = ?auto_182248 ?auto_182249 ) ) ( not ( = ?auto_182248 ?auto_182250 ) ) ( not ( = ?auto_182248 ?auto_182251 ) ) ( not ( = ?auto_182248 ?auto_182252 ) ) ( not ( = ?auto_182248 ?auto_182253 ) ) ( not ( = ?auto_182248 ?auto_182254 ) ) ( not ( = ?auto_182249 ?auto_182250 ) ) ( not ( = ?auto_182249 ?auto_182251 ) ) ( not ( = ?auto_182249 ?auto_182252 ) ) ( not ( = ?auto_182249 ?auto_182253 ) ) ( not ( = ?auto_182249 ?auto_182254 ) ) ( not ( = ?auto_182250 ?auto_182251 ) ) ( not ( = ?auto_182250 ?auto_182252 ) ) ( not ( = ?auto_182250 ?auto_182253 ) ) ( not ( = ?auto_182250 ?auto_182254 ) ) ( not ( = ?auto_182251 ?auto_182252 ) ) ( not ( = ?auto_182251 ?auto_182253 ) ) ( not ( = ?auto_182251 ?auto_182254 ) ) ( not ( = ?auto_182252 ?auto_182253 ) ) ( not ( = ?auto_182252 ?auto_182254 ) ) ( not ( = ?auto_182253 ?auto_182254 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_182253 ?auto_182254 )
      ( !STACK ?auto_182253 ?auto_182252 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182266 - BLOCK
      ?auto_182267 - BLOCK
      ?auto_182268 - BLOCK
      ?auto_182269 - BLOCK
      ?auto_182270 - BLOCK
      ?auto_182271 - BLOCK
      ?auto_182272 - BLOCK
      ?auto_182273 - BLOCK
      ?auto_182274 - BLOCK
      ?auto_182275 - BLOCK
      ?auto_182276 - BLOCK
    )
    :vars
    (
      ?auto_182277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182276 ?auto_182277 ) ( ON-TABLE ?auto_182266 ) ( ON ?auto_182267 ?auto_182266 ) ( ON ?auto_182268 ?auto_182267 ) ( ON ?auto_182269 ?auto_182268 ) ( ON ?auto_182270 ?auto_182269 ) ( ON ?auto_182271 ?auto_182270 ) ( ON ?auto_182272 ?auto_182271 ) ( ON ?auto_182273 ?auto_182272 ) ( ON ?auto_182274 ?auto_182273 ) ( not ( = ?auto_182266 ?auto_182267 ) ) ( not ( = ?auto_182266 ?auto_182268 ) ) ( not ( = ?auto_182266 ?auto_182269 ) ) ( not ( = ?auto_182266 ?auto_182270 ) ) ( not ( = ?auto_182266 ?auto_182271 ) ) ( not ( = ?auto_182266 ?auto_182272 ) ) ( not ( = ?auto_182266 ?auto_182273 ) ) ( not ( = ?auto_182266 ?auto_182274 ) ) ( not ( = ?auto_182266 ?auto_182275 ) ) ( not ( = ?auto_182266 ?auto_182276 ) ) ( not ( = ?auto_182266 ?auto_182277 ) ) ( not ( = ?auto_182267 ?auto_182268 ) ) ( not ( = ?auto_182267 ?auto_182269 ) ) ( not ( = ?auto_182267 ?auto_182270 ) ) ( not ( = ?auto_182267 ?auto_182271 ) ) ( not ( = ?auto_182267 ?auto_182272 ) ) ( not ( = ?auto_182267 ?auto_182273 ) ) ( not ( = ?auto_182267 ?auto_182274 ) ) ( not ( = ?auto_182267 ?auto_182275 ) ) ( not ( = ?auto_182267 ?auto_182276 ) ) ( not ( = ?auto_182267 ?auto_182277 ) ) ( not ( = ?auto_182268 ?auto_182269 ) ) ( not ( = ?auto_182268 ?auto_182270 ) ) ( not ( = ?auto_182268 ?auto_182271 ) ) ( not ( = ?auto_182268 ?auto_182272 ) ) ( not ( = ?auto_182268 ?auto_182273 ) ) ( not ( = ?auto_182268 ?auto_182274 ) ) ( not ( = ?auto_182268 ?auto_182275 ) ) ( not ( = ?auto_182268 ?auto_182276 ) ) ( not ( = ?auto_182268 ?auto_182277 ) ) ( not ( = ?auto_182269 ?auto_182270 ) ) ( not ( = ?auto_182269 ?auto_182271 ) ) ( not ( = ?auto_182269 ?auto_182272 ) ) ( not ( = ?auto_182269 ?auto_182273 ) ) ( not ( = ?auto_182269 ?auto_182274 ) ) ( not ( = ?auto_182269 ?auto_182275 ) ) ( not ( = ?auto_182269 ?auto_182276 ) ) ( not ( = ?auto_182269 ?auto_182277 ) ) ( not ( = ?auto_182270 ?auto_182271 ) ) ( not ( = ?auto_182270 ?auto_182272 ) ) ( not ( = ?auto_182270 ?auto_182273 ) ) ( not ( = ?auto_182270 ?auto_182274 ) ) ( not ( = ?auto_182270 ?auto_182275 ) ) ( not ( = ?auto_182270 ?auto_182276 ) ) ( not ( = ?auto_182270 ?auto_182277 ) ) ( not ( = ?auto_182271 ?auto_182272 ) ) ( not ( = ?auto_182271 ?auto_182273 ) ) ( not ( = ?auto_182271 ?auto_182274 ) ) ( not ( = ?auto_182271 ?auto_182275 ) ) ( not ( = ?auto_182271 ?auto_182276 ) ) ( not ( = ?auto_182271 ?auto_182277 ) ) ( not ( = ?auto_182272 ?auto_182273 ) ) ( not ( = ?auto_182272 ?auto_182274 ) ) ( not ( = ?auto_182272 ?auto_182275 ) ) ( not ( = ?auto_182272 ?auto_182276 ) ) ( not ( = ?auto_182272 ?auto_182277 ) ) ( not ( = ?auto_182273 ?auto_182274 ) ) ( not ( = ?auto_182273 ?auto_182275 ) ) ( not ( = ?auto_182273 ?auto_182276 ) ) ( not ( = ?auto_182273 ?auto_182277 ) ) ( not ( = ?auto_182274 ?auto_182275 ) ) ( not ( = ?auto_182274 ?auto_182276 ) ) ( not ( = ?auto_182274 ?auto_182277 ) ) ( not ( = ?auto_182275 ?auto_182276 ) ) ( not ( = ?auto_182275 ?auto_182277 ) ) ( not ( = ?auto_182276 ?auto_182277 ) ) ( CLEAR ?auto_182274 ) ( ON ?auto_182275 ?auto_182276 ) ( CLEAR ?auto_182275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_182266 ?auto_182267 ?auto_182268 ?auto_182269 ?auto_182270 ?auto_182271 ?auto_182272 ?auto_182273 ?auto_182274 ?auto_182275 )
      ( MAKE-11PILE ?auto_182266 ?auto_182267 ?auto_182268 ?auto_182269 ?auto_182270 ?auto_182271 ?auto_182272 ?auto_182273 ?auto_182274 ?auto_182275 ?auto_182276 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182289 - BLOCK
      ?auto_182290 - BLOCK
      ?auto_182291 - BLOCK
      ?auto_182292 - BLOCK
      ?auto_182293 - BLOCK
      ?auto_182294 - BLOCK
      ?auto_182295 - BLOCK
      ?auto_182296 - BLOCK
      ?auto_182297 - BLOCK
      ?auto_182298 - BLOCK
      ?auto_182299 - BLOCK
    )
    :vars
    (
      ?auto_182300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182299 ?auto_182300 ) ( ON-TABLE ?auto_182289 ) ( ON ?auto_182290 ?auto_182289 ) ( ON ?auto_182291 ?auto_182290 ) ( ON ?auto_182292 ?auto_182291 ) ( ON ?auto_182293 ?auto_182292 ) ( ON ?auto_182294 ?auto_182293 ) ( ON ?auto_182295 ?auto_182294 ) ( ON ?auto_182296 ?auto_182295 ) ( ON ?auto_182297 ?auto_182296 ) ( not ( = ?auto_182289 ?auto_182290 ) ) ( not ( = ?auto_182289 ?auto_182291 ) ) ( not ( = ?auto_182289 ?auto_182292 ) ) ( not ( = ?auto_182289 ?auto_182293 ) ) ( not ( = ?auto_182289 ?auto_182294 ) ) ( not ( = ?auto_182289 ?auto_182295 ) ) ( not ( = ?auto_182289 ?auto_182296 ) ) ( not ( = ?auto_182289 ?auto_182297 ) ) ( not ( = ?auto_182289 ?auto_182298 ) ) ( not ( = ?auto_182289 ?auto_182299 ) ) ( not ( = ?auto_182289 ?auto_182300 ) ) ( not ( = ?auto_182290 ?auto_182291 ) ) ( not ( = ?auto_182290 ?auto_182292 ) ) ( not ( = ?auto_182290 ?auto_182293 ) ) ( not ( = ?auto_182290 ?auto_182294 ) ) ( not ( = ?auto_182290 ?auto_182295 ) ) ( not ( = ?auto_182290 ?auto_182296 ) ) ( not ( = ?auto_182290 ?auto_182297 ) ) ( not ( = ?auto_182290 ?auto_182298 ) ) ( not ( = ?auto_182290 ?auto_182299 ) ) ( not ( = ?auto_182290 ?auto_182300 ) ) ( not ( = ?auto_182291 ?auto_182292 ) ) ( not ( = ?auto_182291 ?auto_182293 ) ) ( not ( = ?auto_182291 ?auto_182294 ) ) ( not ( = ?auto_182291 ?auto_182295 ) ) ( not ( = ?auto_182291 ?auto_182296 ) ) ( not ( = ?auto_182291 ?auto_182297 ) ) ( not ( = ?auto_182291 ?auto_182298 ) ) ( not ( = ?auto_182291 ?auto_182299 ) ) ( not ( = ?auto_182291 ?auto_182300 ) ) ( not ( = ?auto_182292 ?auto_182293 ) ) ( not ( = ?auto_182292 ?auto_182294 ) ) ( not ( = ?auto_182292 ?auto_182295 ) ) ( not ( = ?auto_182292 ?auto_182296 ) ) ( not ( = ?auto_182292 ?auto_182297 ) ) ( not ( = ?auto_182292 ?auto_182298 ) ) ( not ( = ?auto_182292 ?auto_182299 ) ) ( not ( = ?auto_182292 ?auto_182300 ) ) ( not ( = ?auto_182293 ?auto_182294 ) ) ( not ( = ?auto_182293 ?auto_182295 ) ) ( not ( = ?auto_182293 ?auto_182296 ) ) ( not ( = ?auto_182293 ?auto_182297 ) ) ( not ( = ?auto_182293 ?auto_182298 ) ) ( not ( = ?auto_182293 ?auto_182299 ) ) ( not ( = ?auto_182293 ?auto_182300 ) ) ( not ( = ?auto_182294 ?auto_182295 ) ) ( not ( = ?auto_182294 ?auto_182296 ) ) ( not ( = ?auto_182294 ?auto_182297 ) ) ( not ( = ?auto_182294 ?auto_182298 ) ) ( not ( = ?auto_182294 ?auto_182299 ) ) ( not ( = ?auto_182294 ?auto_182300 ) ) ( not ( = ?auto_182295 ?auto_182296 ) ) ( not ( = ?auto_182295 ?auto_182297 ) ) ( not ( = ?auto_182295 ?auto_182298 ) ) ( not ( = ?auto_182295 ?auto_182299 ) ) ( not ( = ?auto_182295 ?auto_182300 ) ) ( not ( = ?auto_182296 ?auto_182297 ) ) ( not ( = ?auto_182296 ?auto_182298 ) ) ( not ( = ?auto_182296 ?auto_182299 ) ) ( not ( = ?auto_182296 ?auto_182300 ) ) ( not ( = ?auto_182297 ?auto_182298 ) ) ( not ( = ?auto_182297 ?auto_182299 ) ) ( not ( = ?auto_182297 ?auto_182300 ) ) ( not ( = ?auto_182298 ?auto_182299 ) ) ( not ( = ?auto_182298 ?auto_182300 ) ) ( not ( = ?auto_182299 ?auto_182300 ) ) ( CLEAR ?auto_182297 ) ( ON ?auto_182298 ?auto_182299 ) ( CLEAR ?auto_182298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_182289 ?auto_182290 ?auto_182291 ?auto_182292 ?auto_182293 ?auto_182294 ?auto_182295 ?auto_182296 ?auto_182297 ?auto_182298 )
      ( MAKE-11PILE ?auto_182289 ?auto_182290 ?auto_182291 ?auto_182292 ?auto_182293 ?auto_182294 ?auto_182295 ?auto_182296 ?auto_182297 ?auto_182298 ?auto_182299 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182312 - BLOCK
      ?auto_182313 - BLOCK
      ?auto_182314 - BLOCK
      ?auto_182315 - BLOCK
      ?auto_182316 - BLOCK
      ?auto_182317 - BLOCK
      ?auto_182318 - BLOCK
      ?auto_182319 - BLOCK
      ?auto_182320 - BLOCK
      ?auto_182321 - BLOCK
      ?auto_182322 - BLOCK
    )
    :vars
    (
      ?auto_182323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182322 ?auto_182323 ) ( ON-TABLE ?auto_182312 ) ( ON ?auto_182313 ?auto_182312 ) ( ON ?auto_182314 ?auto_182313 ) ( ON ?auto_182315 ?auto_182314 ) ( ON ?auto_182316 ?auto_182315 ) ( ON ?auto_182317 ?auto_182316 ) ( ON ?auto_182318 ?auto_182317 ) ( ON ?auto_182319 ?auto_182318 ) ( not ( = ?auto_182312 ?auto_182313 ) ) ( not ( = ?auto_182312 ?auto_182314 ) ) ( not ( = ?auto_182312 ?auto_182315 ) ) ( not ( = ?auto_182312 ?auto_182316 ) ) ( not ( = ?auto_182312 ?auto_182317 ) ) ( not ( = ?auto_182312 ?auto_182318 ) ) ( not ( = ?auto_182312 ?auto_182319 ) ) ( not ( = ?auto_182312 ?auto_182320 ) ) ( not ( = ?auto_182312 ?auto_182321 ) ) ( not ( = ?auto_182312 ?auto_182322 ) ) ( not ( = ?auto_182312 ?auto_182323 ) ) ( not ( = ?auto_182313 ?auto_182314 ) ) ( not ( = ?auto_182313 ?auto_182315 ) ) ( not ( = ?auto_182313 ?auto_182316 ) ) ( not ( = ?auto_182313 ?auto_182317 ) ) ( not ( = ?auto_182313 ?auto_182318 ) ) ( not ( = ?auto_182313 ?auto_182319 ) ) ( not ( = ?auto_182313 ?auto_182320 ) ) ( not ( = ?auto_182313 ?auto_182321 ) ) ( not ( = ?auto_182313 ?auto_182322 ) ) ( not ( = ?auto_182313 ?auto_182323 ) ) ( not ( = ?auto_182314 ?auto_182315 ) ) ( not ( = ?auto_182314 ?auto_182316 ) ) ( not ( = ?auto_182314 ?auto_182317 ) ) ( not ( = ?auto_182314 ?auto_182318 ) ) ( not ( = ?auto_182314 ?auto_182319 ) ) ( not ( = ?auto_182314 ?auto_182320 ) ) ( not ( = ?auto_182314 ?auto_182321 ) ) ( not ( = ?auto_182314 ?auto_182322 ) ) ( not ( = ?auto_182314 ?auto_182323 ) ) ( not ( = ?auto_182315 ?auto_182316 ) ) ( not ( = ?auto_182315 ?auto_182317 ) ) ( not ( = ?auto_182315 ?auto_182318 ) ) ( not ( = ?auto_182315 ?auto_182319 ) ) ( not ( = ?auto_182315 ?auto_182320 ) ) ( not ( = ?auto_182315 ?auto_182321 ) ) ( not ( = ?auto_182315 ?auto_182322 ) ) ( not ( = ?auto_182315 ?auto_182323 ) ) ( not ( = ?auto_182316 ?auto_182317 ) ) ( not ( = ?auto_182316 ?auto_182318 ) ) ( not ( = ?auto_182316 ?auto_182319 ) ) ( not ( = ?auto_182316 ?auto_182320 ) ) ( not ( = ?auto_182316 ?auto_182321 ) ) ( not ( = ?auto_182316 ?auto_182322 ) ) ( not ( = ?auto_182316 ?auto_182323 ) ) ( not ( = ?auto_182317 ?auto_182318 ) ) ( not ( = ?auto_182317 ?auto_182319 ) ) ( not ( = ?auto_182317 ?auto_182320 ) ) ( not ( = ?auto_182317 ?auto_182321 ) ) ( not ( = ?auto_182317 ?auto_182322 ) ) ( not ( = ?auto_182317 ?auto_182323 ) ) ( not ( = ?auto_182318 ?auto_182319 ) ) ( not ( = ?auto_182318 ?auto_182320 ) ) ( not ( = ?auto_182318 ?auto_182321 ) ) ( not ( = ?auto_182318 ?auto_182322 ) ) ( not ( = ?auto_182318 ?auto_182323 ) ) ( not ( = ?auto_182319 ?auto_182320 ) ) ( not ( = ?auto_182319 ?auto_182321 ) ) ( not ( = ?auto_182319 ?auto_182322 ) ) ( not ( = ?auto_182319 ?auto_182323 ) ) ( not ( = ?auto_182320 ?auto_182321 ) ) ( not ( = ?auto_182320 ?auto_182322 ) ) ( not ( = ?auto_182320 ?auto_182323 ) ) ( not ( = ?auto_182321 ?auto_182322 ) ) ( not ( = ?auto_182321 ?auto_182323 ) ) ( not ( = ?auto_182322 ?auto_182323 ) ) ( ON ?auto_182321 ?auto_182322 ) ( CLEAR ?auto_182319 ) ( ON ?auto_182320 ?auto_182321 ) ( CLEAR ?auto_182320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_182312 ?auto_182313 ?auto_182314 ?auto_182315 ?auto_182316 ?auto_182317 ?auto_182318 ?auto_182319 ?auto_182320 )
      ( MAKE-11PILE ?auto_182312 ?auto_182313 ?auto_182314 ?auto_182315 ?auto_182316 ?auto_182317 ?auto_182318 ?auto_182319 ?auto_182320 ?auto_182321 ?auto_182322 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182335 - BLOCK
      ?auto_182336 - BLOCK
      ?auto_182337 - BLOCK
      ?auto_182338 - BLOCK
      ?auto_182339 - BLOCK
      ?auto_182340 - BLOCK
      ?auto_182341 - BLOCK
      ?auto_182342 - BLOCK
      ?auto_182343 - BLOCK
      ?auto_182344 - BLOCK
      ?auto_182345 - BLOCK
    )
    :vars
    (
      ?auto_182346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182345 ?auto_182346 ) ( ON-TABLE ?auto_182335 ) ( ON ?auto_182336 ?auto_182335 ) ( ON ?auto_182337 ?auto_182336 ) ( ON ?auto_182338 ?auto_182337 ) ( ON ?auto_182339 ?auto_182338 ) ( ON ?auto_182340 ?auto_182339 ) ( ON ?auto_182341 ?auto_182340 ) ( ON ?auto_182342 ?auto_182341 ) ( not ( = ?auto_182335 ?auto_182336 ) ) ( not ( = ?auto_182335 ?auto_182337 ) ) ( not ( = ?auto_182335 ?auto_182338 ) ) ( not ( = ?auto_182335 ?auto_182339 ) ) ( not ( = ?auto_182335 ?auto_182340 ) ) ( not ( = ?auto_182335 ?auto_182341 ) ) ( not ( = ?auto_182335 ?auto_182342 ) ) ( not ( = ?auto_182335 ?auto_182343 ) ) ( not ( = ?auto_182335 ?auto_182344 ) ) ( not ( = ?auto_182335 ?auto_182345 ) ) ( not ( = ?auto_182335 ?auto_182346 ) ) ( not ( = ?auto_182336 ?auto_182337 ) ) ( not ( = ?auto_182336 ?auto_182338 ) ) ( not ( = ?auto_182336 ?auto_182339 ) ) ( not ( = ?auto_182336 ?auto_182340 ) ) ( not ( = ?auto_182336 ?auto_182341 ) ) ( not ( = ?auto_182336 ?auto_182342 ) ) ( not ( = ?auto_182336 ?auto_182343 ) ) ( not ( = ?auto_182336 ?auto_182344 ) ) ( not ( = ?auto_182336 ?auto_182345 ) ) ( not ( = ?auto_182336 ?auto_182346 ) ) ( not ( = ?auto_182337 ?auto_182338 ) ) ( not ( = ?auto_182337 ?auto_182339 ) ) ( not ( = ?auto_182337 ?auto_182340 ) ) ( not ( = ?auto_182337 ?auto_182341 ) ) ( not ( = ?auto_182337 ?auto_182342 ) ) ( not ( = ?auto_182337 ?auto_182343 ) ) ( not ( = ?auto_182337 ?auto_182344 ) ) ( not ( = ?auto_182337 ?auto_182345 ) ) ( not ( = ?auto_182337 ?auto_182346 ) ) ( not ( = ?auto_182338 ?auto_182339 ) ) ( not ( = ?auto_182338 ?auto_182340 ) ) ( not ( = ?auto_182338 ?auto_182341 ) ) ( not ( = ?auto_182338 ?auto_182342 ) ) ( not ( = ?auto_182338 ?auto_182343 ) ) ( not ( = ?auto_182338 ?auto_182344 ) ) ( not ( = ?auto_182338 ?auto_182345 ) ) ( not ( = ?auto_182338 ?auto_182346 ) ) ( not ( = ?auto_182339 ?auto_182340 ) ) ( not ( = ?auto_182339 ?auto_182341 ) ) ( not ( = ?auto_182339 ?auto_182342 ) ) ( not ( = ?auto_182339 ?auto_182343 ) ) ( not ( = ?auto_182339 ?auto_182344 ) ) ( not ( = ?auto_182339 ?auto_182345 ) ) ( not ( = ?auto_182339 ?auto_182346 ) ) ( not ( = ?auto_182340 ?auto_182341 ) ) ( not ( = ?auto_182340 ?auto_182342 ) ) ( not ( = ?auto_182340 ?auto_182343 ) ) ( not ( = ?auto_182340 ?auto_182344 ) ) ( not ( = ?auto_182340 ?auto_182345 ) ) ( not ( = ?auto_182340 ?auto_182346 ) ) ( not ( = ?auto_182341 ?auto_182342 ) ) ( not ( = ?auto_182341 ?auto_182343 ) ) ( not ( = ?auto_182341 ?auto_182344 ) ) ( not ( = ?auto_182341 ?auto_182345 ) ) ( not ( = ?auto_182341 ?auto_182346 ) ) ( not ( = ?auto_182342 ?auto_182343 ) ) ( not ( = ?auto_182342 ?auto_182344 ) ) ( not ( = ?auto_182342 ?auto_182345 ) ) ( not ( = ?auto_182342 ?auto_182346 ) ) ( not ( = ?auto_182343 ?auto_182344 ) ) ( not ( = ?auto_182343 ?auto_182345 ) ) ( not ( = ?auto_182343 ?auto_182346 ) ) ( not ( = ?auto_182344 ?auto_182345 ) ) ( not ( = ?auto_182344 ?auto_182346 ) ) ( not ( = ?auto_182345 ?auto_182346 ) ) ( ON ?auto_182344 ?auto_182345 ) ( CLEAR ?auto_182342 ) ( ON ?auto_182343 ?auto_182344 ) ( CLEAR ?auto_182343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_182335 ?auto_182336 ?auto_182337 ?auto_182338 ?auto_182339 ?auto_182340 ?auto_182341 ?auto_182342 ?auto_182343 )
      ( MAKE-11PILE ?auto_182335 ?auto_182336 ?auto_182337 ?auto_182338 ?auto_182339 ?auto_182340 ?auto_182341 ?auto_182342 ?auto_182343 ?auto_182344 ?auto_182345 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182358 - BLOCK
      ?auto_182359 - BLOCK
      ?auto_182360 - BLOCK
      ?auto_182361 - BLOCK
      ?auto_182362 - BLOCK
      ?auto_182363 - BLOCK
      ?auto_182364 - BLOCK
      ?auto_182365 - BLOCK
      ?auto_182366 - BLOCK
      ?auto_182367 - BLOCK
      ?auto_182368 - BLOCK
    )
    :vars
    (
      ?auto_182369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182368 ?auto_182369 ) ( ON-TABLE ?auto_182358 ) ( ON ?auto_182359 ?auto_182358 ) ( ON ?auto_182360 ?auto_182359 ) ( ON ?auto_182361 ?auto_182360 ) ( ON ?auto_182362 ?auto_182361 ) ( ON ?auto_182363 ?auto_182362 ) ( ON ?auto_182364 ?auto_182363 ) ( not ( = ?auto_182358 ?auto_182359 ) ) ( not ( = ?auto_182358 ?auto_182360 ) ) ( not ( = ?auto_182358 ?auto_182361 ) ) ( not ( = ?auto_182358 ?auto_182362 ) ) ( not ( = ?auto_182358 ?auto_182363 ) ) ( not ( = ?auto_182358 ?auto_182364 ) ) ( not ( = ?auto_182358 ?auto_182365 ) ) ( not ( = ?auto_182358 ?auto_182366 ) ) ( not ( = ?auto_182358 ?auto_182367 ) ) ( not ( = ?auto_182358 ?auto_182368 ) ) ( not ( = ?auto_182358 ?auto_182369 ) ) ( not ( = ?auto_182359 ?auto_182360 ) ) ( not ( = ?auto_182359 ?auto_182361 ) ) ( not ( = ?auto_182359 ?auto_182362 ) ) ( not ( = ?auto_182359 ?auto_182363 ) ) ( not ( = ?auto_182359 ?auto_182364 ) ) ( not ( = ?auto_182359 ?auto_182365 ) ) ( not ( = ?auto_182359 ?auto_182366 ) ) ( not ( = ?auto_182359 ?auto_182367 ) ) ( not ( = ?auto_182359 ?auto_182368 ) ) ( not ( = ?auto_182359 ?auto_182369 ) ) ( not ( = ?auto_182360 ?auto_182361 ) ) ( not ( = ?auto_182360 ?auto_182362 ) ) ( not ( = ?auto_182360 ?auto_182363 ) ) ( not ( = ?auto_182360 ?auto_182364 ) ) ( not ( = ?auto_182360 ?auto_182365 ) ) ( not ( = ?auto_182360 ?auto_182366 ) ) ( not ( = ?auto_182360 ?auto_182367 ) ) ( not ( = ?auto_182360 ?auto_182368 ) ) ( not ( = ?auto_182360 ?auto_182369 ) ) ( not ( = ?auto_182361 ?auto_182362 ) ) ( not ( = ?auto_182361 ?auto_182363 ) ) ( not ( = ?auto_182361 ?auto_182364 ) ) ( not ( = ?auto_182361 ?auto_182365 ) ) ( not ( = ?auto_182361 ?auto_182366 ) ) ( not ( = ?auto_182361 ?auto_182367 ) ) ( not ( = ?auto_182361 ?auto_182368 ) ) ( not ( = ?auto_182361 ?auto_182369 ) ) ( not ( = ?auto_182362 ?auto_182363 ) ) ( not ( = ?auto_182362 ?auto_182364 ) ) ( not ( = ?auto_182362 ?auto_182365 ) ) ( not ( = ?auto_182362 ?auto_182366 ) ) ( not ( = ?auto_182362 ?auto_182367 ) ) ( not ( = ?auto_182362 ?auto_182368 ) ) ( not ( = ?auto_182362 ?auto_182369 ) ) ( not ( = ?auto_182363 ?auto_182364 ) ) ( not ( = ?auto_182363 ?auto_182365 ) ) ( not ( = ?auto_182363 ?auto_182366 ) ) ( not ( = ?auto_182363 ?auto_182367 ) ) ( not ( = ?auto_182363 ?auto_182368 ) ) ( not ( = ?auto_182363 ?auto_182369 ) ) ( not ( = ?auto_182364 ?auto_182365 ) ) ( not ( = ?auto_182364 ?auto_182366 ) ) ( not ( = ?auto_182364 ?auto_182367 ) ) ( not ( = ?auto_182364 ?auto_182368 ) ) ( not ( = ?auto_182364 ?auto_182369 ) ) ( not ( = ?auto_182365 ?auto_182366 ) ) ( not ( = ?auto_182365 ?auto_182367 ) ) ( not ( = ?auto_182365 ?auto_182368 ) ) ( not ( = ?auto_182365 ?auto_182369 ) ) ( not ( = ?auto_182366 ?auto_182367 ) ) ( not ( = ?auto_182366 ?auto_182368 ) ) ( not ( = ?auto_182366 ?auto_182369 ) ) ( not ( = ?auto_182367 ?auto_182368 ) ) ( not ( = ?auto_182367 ?auto_182369 ) ) ( not ( = ?auto_182368 ?auto_182369 ) ) ( ON ?auto_182367 ?auto_182368 ) ( ON ?auto_182366 ?auto_182367 ) ( CLEAR ?auto_182364 ) ( ON ?auto_182365 ?auto_182366 ) ( CLEAR ?auto_182365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_182358 ?auto_182359 ?auto_182360 ?auto_182361 ?auto_182362 ?auto_182363 ?auto_182364 ?auto_182365 )
      ( MAKE-11PILE ?auto_182358 ?auto_182359 ?auto_182360 ?auto_182361 ?auto_182362 ?auto_182363 ?auto_182364 ?auto_182365 ?auto_182366 ?auto_182367 ?auto_182368 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182381 - BLOCK
      ?auto_182382 - BLOCK
      ?auto_182383 - BLOCK
      ?auto_182384 - BLOCK
      ?auto_182385 - BLOCK
      ?auto_182386 - BLOCK
      ?auto_182387 - BLOCK
      ?auto_182388 - BLOCK
      ?auto_182389 - BLOCK
      ?auto_182390 - BLOCK
      ?auto_182391 - BLOCK
    )
    :vars
    (
      ?auto_182392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182391 ?auto_182392 ) ( ON-TABLE ?auto_182381 ) ( ON ?auto_182382 ?auto_182381 ) ( ON ?auto_182383 ?auto_182382 ) ( ON ?auto_182384 ?auto_182383 ) ( ON ?auto_182385 ?auto_182384 ) ( ON ?auto_182386 ?auto_182385 ) ( ON ?auto_182387 ?auto_182386 ) ( not ( = ?auto_182381 ?auto_182382 ) ) ( not ( = ?auto_182381 ?auto_182383 ) ) ( not ( = ?auto_182381 ?auto_182384 ) ) ( not ( = ?auto_182381 ?auto_182385 ) ) ( not ( = ?auto_182381 ?auto_182386 ) ) ( not ( = ?auto_182381 ?auto_182387 ) ) ( not ( = ?auto_182381 ?auto_182388 ) ) ( not ( = ?auto_182381 ?auto_182389 ) ) ( not ( = ?auto_182381 ?auto_182390 ) ) ( not ( = ?auto_182381 ?auto_182391 ) ) ( not ( = ?auto_182381 ?auto_182392 ) ) ( not ( = ?auto_182382 ?auto_182383 ) ) ( not ( = ?auto_182382 ?auto_182384 ) ) ( not ( = ?auto_182382 ?auto_182385 ) ) ( not ( = ?auto_182382 ?auto_182386 ) ) ( not ( = ?auto_182382 ?auto_182387 ) ) ( not ( = ?auto_182382 ?auto_182388 ) ) ( not ( = ?auto_182382 ?auto_182389 ) ) ( not ( = ?auto_182382 ?auto_182390 ) ) ( not ( = ?auto_182382 ?auto_182391 ) ) ( not ( = ?auto_182382 ?auto_182392 ) ) ( not ( = ?auto_182383 ?auto_182384 ) ) ( not ( = ?auto_182383 ?auto_182385 ) ) ( not ( = ?auto_182383 ?auto_182386 ) ) ( not ( = ?auto_182383 ?auto_182387 ) ) ( not ( = ?auto_182383 ?auto_182388 ) ) ( not ( = ?auto_182383 ?auto_182389 ) ) ( not ( = ?auto_182383 ?auto_182390 ) ) ( not ( = ?auto_182383 ?auto_182391 ) ) ( not ( = ?auto_182383 ?auto_182392 ) ) ( not ( = ?auto_182384 ?auto_182385 ) ) ( not ( = ?auto_182384 ?auto_182386 ) ) ( not ( = ?auto_182384 ?auto_182387 ) ) ( not ( = ?auto_182384 ?auto_182388 ) ) ( not ( = ?auto_182384 ?auto_182389 ) ) ( not ( = ?auto_182384 ?auto_182390 ) ) ( not ( = ?auto_182384 ?auto_182391 ) ) ( not ( = ?auto_182384 ?auto_182392 ) ) ( not ( = ?auto_182385 ?auto_182386 ) ) ( not ( = ?auto_182385 ?auto_182387 ) ) ( not ( = ?auto_182385 ?auto_182388 ) ) ( not ( = ?auto_182385 ?auto_182389 ) ) ( not ( = ?auto_182385 ?auto_182390 ) ) ( not ( = ?auto_182385 ?auto_182391 ) ) ( not ( = ?auto_182385 ?auto_182392 ) ) ( not ( = ?auto_182386 ?auto_182387 ) ) ( not ( = ?auto_182386 ?auto_182388 ) ) ( not ( = ?auto_182386 ?auto_182389 ) ) ( not ( = ?auto_182386 ?auto_182390 ) ) ( not ( = ?auto_182386 ?auto_182391 ) ) ( not ( = ?auto_182386 ?auto_182392 ) ) ( not ( = ?auto_182387 ?auto_182388 ) ) ( not ( = ?auto_182387 ?auto_182389 ) ) ( not ( = ?auto_182387 ?auto_182390 ) ) ( not ( = ?auto_182387 ?auto_182391 ) ) ( not ( = ?auto_182387 ?auto_182392 ) ) ( not ( = ?auto_182388 ?auto_182389 ) ) ( not ( = ?auto_182388 ?auto_182390 ) ) ( not ( = ?auto_182388 ?auto_182391 ) ) ( not ( = ?auto_182388 ?auto_182392 ) ) ( not ( = ?auto_182389 ?auto_182390 ) ) ( not ( = ?auto_182389 ?auto_182391 ) ) ( not ( = ?auto_182389 ?auto_182392 ) ) ( not ( = ?auto_182390 ?auto_182391 ) ) ( not ( = ?auto_182390 ?auto_182392 ) ) ( not ( = ?auto_182391 ?auto_182392 ) ) ( ON ?auto_182390 ?auto_182391 ) ( ON ?auto_182389 ?auto_182390 ) ( CLEAR ?auto_182387 ) ( ON ?auto_182388 ?auto_182389 ) ( CLEAR ?auto_182388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_182381 ?auto_182382 ?auto_182383 ?auto_182384 ?auto_182385 ?auto_182386 ?auto_182387 ?auto_182388 )
      ( MAKE-11PILE ?auto_182381 ?auto_182382 ?auto_182383 ?auto_182384 ?auto_182385 ?auto_182386 ?auto_182387 ?auto_182388 ?auto_182389 ?auto_182390 ?auto_182391 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182404 - BLOCK
      ?auto_182405 - BLOCK
      ?auto_182406 - BLOCK
      ?auto_182407 - BLOCK
      ?auto_182408 - BLOCK
      ?auto_182409 - BLOCK
      ?auto_182410 - BLOCK
      ?auto_182411 - BLOCK
      ?auto_182412 - BLOCK
      ?auto_182413 - BLOCK
      ?auto_182414 - BLOCK
    )
    :vars
    (
      ?auto_182415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182414 ?auto_182415 ) ( ON-TABLE ?auto_182404 ) ( ON ?auto_182405 ?auto_182404 ) ( ON ?auto_182406 ?auto_182405 ) ( ON ?auto_182407 ?auto_182406 ) ( ON ?auto_182408 ?auto_182407 ) ( ON ?auto_182409 ?auto_182408 ) ( not ( = ?auto_182404 ?auto_182405 ) ) ( not ( = ?auto_182404 ?auto_182406 ) ) ( not ( = ?auto_182404 ?auto_182407 ) ) ( not ( = ?auto_182404 ?auto_182408 ) ) ( not ( = ?auto_182404 ?auto_182409 ) ) ( not ( = ?auto_182404 ?auto_182410 ) ) ( not ( = ?auto_182404 ?auto_182411 ) ) ( not ( = ?auto_182404 ?auto_182412 ) ) ( not ( = ?auto_182404 ?auto_182413 ) ) ( not ( = ?auto_182404 ?auto_182414 ) ) ( not ( = ?auto_182404 ?auto_182415 ) ) ( not ( = ?auto_182405 ?auto_182406 ) ) ( not ( = ?auto_182405 ?auto_182407 ) ) ( not ( = ?auto_182405 ?auto_182408 ) ) ( not ( = ?auto_182405 ?auto_182409 ) ) ( not ( = ?auto_182405 ?auto_182410 ) ) ( not ( = ?auto_182405 ?auto_182411 ) ) ( not ( = ?auto_182405 ?auto_182412 ) ) ( not ( = ?auto_182405 ?auto_182413 ) ) ( not ( = ?auto_182405 ?auto_182414 ) ) ( not ( = ?auto_182405 ?auto_182415 ) ) ( not ( = ?auto_182406 ?auto_182407 ) ) ( not ( = ?auto_182406 ?auto_182408 ) ) ( not ( = ?auto_182406 ?auto_182409 ) ) ( not ( = ?auto_182406 ?auto_182410 ) ) ( not ( = ?auto_182406 ?auto_182411 ) ) ( not ( = ?auto_182406 ?auto_182412 ) ) ( not ( = ?auto_182406 ?auto_182413 ) ) ( not ( = ?auto_182406 ?auto_182414 ) ) ( not ( = ?auto_182406 ?auto_182415 ) ) ( not ( = ?auto_182407 ?auto_182408 ) ) ( not ( = ?auto_182407 ?auto_182409 ) ) ( not ( = ?auto_182407 ?auto_182410 ) ) ( not ( = ?auto_182407 ?auto_182411 ) ) ( not ( = ?auto_182407 ?auto_182412 ) ) ( not ( = ?auto_182407 ?auto_182413 ) ) ( not ( = ?auto_182407 ?auto_182414 ) ) ( not ( = ?auto_182407 ?auto_182415 ) ) ( not ( = ?auto_182408 ?auto_182409 ) ) ( not ( = ?auto_182408 ?auto_182410 ) ) ( not ( = ?auto_182408 ?auto_182411 ) ) ( not ( = ?auto_182408 ?auto_182412 ) ) ( not ( = ?auto_182408 ?auto_182413 ) ) ( not ( = ?auto_182408 ?auto_182414 ) ) ( not ( = ?auto_182408 ?auto_182415 ) ) ( not ( = ?auto_182409 ?auto_182410 ) ) ( not ( = ?auto_182409 ?auto_182411 ) ) ( not ( = ?auto_182409 ?auto_182412 ) ) ( not ( = ?auto_182409 ?auto_182413 ) ) ( not ( = ?auto_182409 ?auto_182414 ) ) ( not ( = ?auto_182409 ?auto_182415 ) ) ( not ( = ?auto_182410 ?auto_182411 ) ) ( not ( = ?auto_182410 ?auto_182412 ) ) ( not ( = ?auto_182410 ?auto_182413 ) ) ( not ( = ?auto_182410 ?auto_182414 ) ) ( not ( = ?auto_182410 ?auto_182415 ) ) ( not ( = ?auto_182411 ?auto_182412 ) ) ( not ( = ?auto_182411 ?auto_182413 ) ) ( not ( = ?auto_182411 ?auto_182414 ) ) ( not ( = ?auto_182411 ?auto_182415 ) ) ( not ( = ?auto_182412 ?auto_182413 ) ) ( not ( = ?auto_182412 ?auto_182414 ) ) ( not ( = ?auto_182412 ?auto_182415 ) ) ( not ( = ?auto_182413 ?auto_182414 ) ) ( not ( = ?auto_182413 ?auto_182415 ) ) ( not ( = ?auto_182414 ?auto_182415 ) ) ( ON ?auto_182413 ?auto_182414 ) ( ON ?auto_182412 ?auto_182413 ) ( ON ?auto_182411 ?auto_182412 ) ( CLEAR ?auto_182409 ) ( ON ?auto_182410 ?auto_182411 ) ( CLEAR ?auto_182410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182404 ?auto_182405 ?auto_182406 ?auto_182407 ?auto_182408 ?auto_182409 ?auto_182410 )
      ( MAKE-11PILE ?auto_182404 ?auto_182405 ?auto_182406 ?auto_182407 ?auto_182408 ?auto_182409 ?auto_182410 ?auto_182411 ?auto_182412 ?auto_182413 ?auto_182414 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182427 - BLOCK
      ?auto_182428 - BLOCK
      ?auto_182429 - BLOCK
      ?auto_182430 - BLOCK
      ?auto_182431 - BLOCK
      ?auto_182432 - BLOCK
      ?auto_182433 - BLOCK
      ?auto_182434 - BLOCK
      ?auto_182435 - BLOCK
      ?auto_182436 - BLOCK
      ?auto_182437 - BLOCK
    )
    :vars
    (
      ?auto_182438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182437 ?auto_182438 ) ( ON-TABLE ?auto_182427 ) ( ON ?auto_182428 ?auto_182427 ) ( ON ?auto_182429 ?auto_182428 ) ( ON ?auto_182430 ?auto_182429 ) ( ON ?auto_182431 ?auto_182430 ) ( ON ?auto_182432 ?auto_182431 ) ( not ( = ?auto_182427 ?auto_182428 ) ) ( not ( = ?auto_182427 ?auto_182429 ) ) ( not ( = ?auto_182427 ?auto_182430 ) ) ( not ( = ?auto_182427 ?auto_182431 ) ) ( not ( = ?auto_182427 ?auto_182432 ) ) ( not ( = ?auto_182427 ?auto_182433 ) ) ( not ( = ?auto_182427 ?auto_182434 ) ) ( not ( = ?auto_182427 ?auto_182435 ) ) ( not ( = ?auto_182427 ?auto_182436 ) ) ( not ( = ?auto_182427 ?auto_182437 ) ) ( not ( = ?auto_182427 ?auto_182438 ) ) ( not ( = ?auto_182428 ?auto_182429 ) ) ( not ( = ?auto_182428 ?auto_182430 ) ) ( not ( = ?auto_182428 ?auto_182431 ) ) ( not ( = ?auto_182428 ?auto_182432 ) ) ( not ( = ?auto_182428 ?auto_182433 ) ) ( not ( = ?auto_182428 ?auto_182434 ) ) ( not ( = ?auto_182428 ?auto_182435 ) ) ( not ( = ?auto_182428 ?auto_182436 ) ) ( not ( = ?auto_182428 ?auto_182437 ) ) ( not ( = ?auto_182428 ?auto_182438 ) ) ( not ( = ?auto_182429 ?auto_182430 ) ) ( not ( = ?auto_182429 ?auto_182431 ) ) ( not ( = ?auto_182429 ?auto_182432 ) ) ( not ( = ?auto_182429 ?auto_182433 ) ) ( not ( = ?auto_182429 ?auto_182434 ) ) ( not ( = ?auto_182429 ?auto_182435 ) ) ( not ( = ?auto_182429 ?auto_182436 ) ) ( not ( = ?auto_182429 ?auto_182437 ) ) ( not ( = ?auto_182429 ?auto_182438 ) ) ( not ( = ?auto_182430 ?auto_182431 ) ) ( not ( = ?auto_182430 ?auto_182432 ) ) ( not ( = ?auto_182430 ?auto_182433 ) ) ( not ( = ?auto_182430 ?auto_182434 ) ) ( not ( = ?auto_182430 ?auto_182435 ) ) ( not ( = ?auto_182430 ?auto_182436 ) ) ( not ( = ?auto_182430 ?auto_182437 ) ) ( not ( = ?auto_182430 ?auto_182438 ) ) ( not ( = ?auto_182431 ?auto_182432 ) ) ( not ( = ?auto_182431 ?auto_182433 ) ) ( not ( = ?auto_182431 ?auto_182434 ) ) ( not ( = ?auto_182431 ?auto_182435 ) ) ( not ( = ?auto_182431 ?auto_182436 ) ) ( not ( = ?auto_182431 ?auto_182437 ) ) ( not ( = ?auto_182431 ?auto_182438 ) ) ( not ( = ?auto_182432 ?auto_182433 ) ) ( not ( = ?auto_182432 ?auto_182434 ) ) ( not ( = ?auto_182432 ?auto_182435 ) ) ( not ( = ?auto_182432 ?auto_182436 ) ) ( not ( = ?auto_182432 ?auto_182437 ) ) ( not ( = ?auto_182432 ?auto_182438 ) ) ( not ( = ?auto_182433 ?auto_182434 ) ) ( not ( = ?auto_182433 ?auto_182435 ) ) ( not ( = ?auto_182433 ?auto_182436 ) ) ( not ( = ?auto_182433 ?auto_182437 ) ) ( not ( = ?auto_182433 ?auto_182438 ) ) ( not ( = ?auto_182434 ?auto_182435 ) ) ( not ( = ?auto_182434 ?auto_182436 ) ) ( not ( = ?auto_182434 ?auto_182437 ) ) ( not ( = ?auto_182434 ?auto_182438 ) ) ( not ( = ?auto_182435 ?auto_182436 ) ) ( not ( = ?auto_182435 ?auto_182437 ) ) ( not ( = ?auto_182435 ?auto_182438 ) ) ( not ( = ?auto_182436 ?auto_182437 ) ) ( not ( = ?auto_182436 ?auto_182438 ) ) ( not ( = ?auto_182437 ?auto_182438 ) ) ( ON ?auto_182436 ?auto_182437 ) ( ON ?auto_182435 ?auto_182436 ) ( ON ?auto_182434 ?auto_182435 ) ( CLEAR ?auto_182432 ) ( ON ?auto_182433 ?auto_182434 ) ( CLEAR ?auto_182433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182427 ?auto_182428 ?auto_182429 ?auto_182430 ?auto_182431 ?auto_182432 ?auto_182433 )
      ( MAKE-11PILE ?auto_182427 ?auto_182428 ?auto_182429 ?auto_182430 ?auto_182431 ?auto_182432 ?auto_182433 ?auto_182434 ?auto_182435 ?auto_182436 ?auto_182437 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182450 - BLOCK
      ?auto_182451 - BLOCK
      ?auto_182452 - BLOCK
      ?auto_182453 - BLOCK
      ?auto_182454 - BLOCK
      ?auto_182455 - BLOCK
      ?auto_182456 - BLOCK
      ?auto_182457 - BLOCK
      ?auto_182458 - BLOCK
      ?auto_182459 - BLOCK
      ?auto_182460 - BLOCK
    )
    :vars
    (
      ?auto_182461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182460 ?auto_182461 ) ( ON-TABLE ?auto_182450 ) ( ON ?auto_182451 ?auto_182450 ) ( ON ?auto_182452 ?auto_182451 ) ( ON ?auto_182453 ?auto_182452 ) ( ON ?auto_182454 ?auto_182453 ) ( not ( = ?auto_182450 ?auto_182451 ) ) ( not ( = ?auto_182450 ?auto_182452 ) ) ( not ( = ?auto_182450 ?auto_182453 ) ) ( not ( = ?auto_182450 ?auto_182454 ) ) ( not ( = ?auto_182450 ?auto_182455 ) ) ( not ( = ?auto_182450 ?auto_182456 ) ) ( not ( = ?auto_182450 ?auto_182457 ) ) ( not ( = ?auto_182450 ?auto_182458 ) ) ( not ( = ?auto_182450 ?auto_182459 ) ) ( not ( = ?auto_182450 ?auto_182460 ) ) ( not ( = ?auto_182450 ?auto_182461 ) ) ( not ( = ?auto_182451 ?auto_182452 ) ) ( not ( = ?auto_182451 ?auto_182453 ) ) ( not ( = ?auto_182451 ?auto_182454 ) ) ( not ( = ?auto_182451 ?auto_182455 ) ) ( not ( = ?auto_182451 ?auto_182456 ) ) ( not ( = ?auto_182451 ?auto_182457 ) ) ( not ( = ?auto_182451 ?auto_182458 ) ) ( not ( = ?auto_182451 ?auto_182459 ) ) ( not ( = ?auto_182451 ?auto_182460 ) ) ( not ( = ?auto_182451 ?auto_182461 ) ) ( not ( = ?auto_182452 ?auto_182453 ) ) ( not ( = ?auto_182452 ?auto_182454 ) ) ( not ( = ?auto_182452 ?auto_182455 ) ) ( not ( = ?auto_182452 ?auto_182456 ) ) ( not ( = ?auto_182452 ?auto_182457 ) ) ( not ( = ?auto_182452 ?auto_182458 ) ) ( not ( = ?auto_182452 ?auto_182459 ) ) ( not ( = ?auto_182452 ?auto_182460 ) ) ( not ( = ?auto_182452 ?auto_182461 ) ) ( not ( = ?auto_182453 ?auto_182454 ) ) ( not ( = ?auto_182453 ?auto_182455 ) ) ( not ( = ?auto_182453 ?auto_182456 ) ) ( not ( = ?auto_182453 ?auto_182457 ) ) ( not ( = ?auto_182453 ?auto_182458 ) ) ( not ( = ?auto_182453 ?auto_182459 ) ) ( not ( = ?auto_182453 ?auto_182460 ) ) ( not ( = ?auto_182453 ?auto_182461 ) ) ( not ( = ?auto_182454 ?auto_182455 ) ) ( not ( = ?auto_182454 ?auto_182456 ) ) ( not ( = ?auto_182454 ?auto_182457 ) ) ( not ( = ?auto_182454 ?auto_182458 ) ) ( not ( = ?auto_182454 ?auto_182459 ) ) ( not ( = ?auto_182454 ?auto_182460 ) ) ( not ( = ?auto_182454 ?auto_182461 ) ) ( not ( = ?auto_182455 ?auto_182456 ) ) ( not ( = ?auto_182455 ?auto_182457 ) ) ( not ( = ?auto_182455 ?auto_182458 ) ) ( not ( = ?auto_182455 ?auto_182459 ) ) ( not ( = ?auto_182455 ?auto_182460 ) ) ( not ( = ?auto_182455 ?auto_182461 ) ) ( not ( = ?auto_182456 ?auto_182457 ) ) ( not ( = ?auto_182456 ?auto_182458 ) ) ( not ( = ?auto_182456 ?auto_182459 ) ) ( not ( = ?auto_182456 ?auto_182460 ) ) ( not ( = ?auto_182456 ?auto_182461 ) ) ( not ( = ?auto_182457 ?auto_182458 ) ) ( not ( = ?auto_182457 ?auto_182459 ) ) ( not ( = ?auto_182457 ?auto_182460 ) ) ( not ( = ?auto_182457 ?auto_182461 ) ) ( not ( = ?auto_182458 ?auto_182459 ) ) ( not ( = ?auto_182458 ?auto_182460 ) ) ( not ( = ?auto_182458 ?auto_182461 ) ) ( not ( = ?auto_182459 ?auto_182460 ) ) ( not ( = ?auto_182459 ?auto_182461 ) ) ( not ( = ?auto_182460 ?auto_182461 ) ) ( ON ?auto_182459 ?auto_182460 ) ( ON ?auto_182458 ?auto_182459 ) ( ON ?auto_182457 ?auto_182458 ) ( ON ?auto_182456 ?auto_182457 ) ( CLEAR ?auto_182454 ) ( ON ?auto_182455 ?auto_182456 ) ( CLEAR ?auto_182455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182450 ?auto_182451 ?auto_182452 ?auto_182453 ?auto_182454 ?auto_182455 )
      ( MAKE-11PILE ?auto_182450 ?auto_182451 ?auto_182452 ?auto_182453 ?auto_182454 ?auto_182455 ?auto_182456 ?auto_182457 ?auto_182458 ?auto_182459 ?auto_182460 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182473 - BLOCK
      ?auto_182474 - BLOCK
      ?auto_182475 - BLOCK
      ?auto_182476 - BLOCK
      ?auto_182477 - BLOCK
      ?auto_182478 - BLOCK
      ?auto_182479 - BLOCK
      ?auto_182480 - BLOCK
      ?auto_182481 - BLOCK
      ?auto_182482 - BLOCK
      ?auto_182483 - BLOCK
    )
    :vars
    (
      ?auto_182484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182483 ?auto_182484 ) ( ON-TABLE ?auto_182473 ) ( ON ?auto_182474 ?auto_182473 ) ( ON ?auto_182475 ?auto_182474 ) ( ON ?auto_182476 ?auto_182475 ) ( ON ?auto_182477 ?auto_182476 ) ( not ( = ?auto_182473 ?auto_182474 ) ) ( not ( = ?auto_182473 ?auto_182475 ) ) ( not ( = ?auto_182473 ?auto_182476 ) ) ( not ( = ?auto_182473 ?auto_182477 ) ) ( not ( = ?auto_182473 ?auto_182478 ) ) ( not ( = ?auto_182473 ?auto_182479 ) ) ( not ( = ?auto_182473 ?auto_182480 ) ) ( not ( = ?auto_182473 ?auto_182481 ) ) ( not ( = ?auto_182473 ?auto_182482 ) ) ( not ( = ?auto_182473 ?auto_182483 ) ) ( not ( = ?auto_182473 ?auto_182484 ) ) ( not ( = ?auto_182474 ?auto_182475 ) ) ( not ( = ?auto_182474 ?auto_182476 ) ) ( not ( = ?auto_182474 ?auto_182477 ) ) ( not ( = ?auto_182474 ?auto_182478 ) ) ( not ( = ?auto_182474 ?auto_182479 ) ) ( not ( = ?auto_182474 ?auto_182480 ) ) ( not ( = ?auto_182474 ?auto_182481 ) ) ( not ( = ?auto_182474 ?auto_182482 ) ) ( not ( = ?auto_182474 ?auto_182483 ) ) ( not ( = ?auto_182474 ?auto_182484 ) ) ( not ( = ?auto_182475 ?auto_182476 ) ) ( not ( = ?auto_182475 ?auto_182477 ) ) ( not ( = ?auto_182475 ?auto_182478 ) ) ( not ( = ?auto_182475 ?auto_182479 ) ) ( not ( = ?auto_182475 ?auto_182480 ) ) ( not ( = ?auto_182475 ?auto_182481 ) ) ( not ( = ?auto_182475 ?auto_182482 ) ) ( not ( = ?auto_182475 ?auto_182483 ) ) ( not ( = ?auto_182475 ?auto_182484 ) ) ( not ( = ?auto_182476 ?auto_182477 ) ) ( not ( = ?auto_182476 ?auto_182478 ) ) ( not ( = ?auto_182476 ?auto_182479 ) ) ( not ( = ?auto_182476 ?auto_182480 ) ) ( not ( = ?auto_182476 ?auto_182481 ) ) ( not ( = ?auto_182476 ?auto_182482 ) ) ( not ( = ?auto_182476 ?auto_182483 ) ) ( not ( = ?auto_182476 ?auto_182484 ) ) ( not ( = ?auto_182477 ?auto_182478 ) ) ( not ( = ?auto_182477 ?auto_182479 ) ) ( not ( = ?auto_182477 ?auto_182480 ) ) ( not ( = ?auto_182477 ?auto_182481 ) ) ( not ( = ?auto_182477 ?auto_182482 ) ) ( not ( = ?auto_182477 ?auto_182483 ) ) ( not ( = ?auto_182477 ?auto_182484 ) ) ( not ( = ?auto_182478 ?auto_182479 ) ) ( not ( = ?auto_182478 ?auto_182480 ) ) ( not ( = ?auto_182478 ?auto_182481 ) ) ( not ( = ?auto_182478 ?auto_182482 ) ) ( not ( = ?auto_182478 ?auto_182483 ) ) ( not ( = ?auto_182478 ?auto_182484 ) ) ( not ( = ?auto_182479 ?auto_182480 ) ) ( not ( = ?auto_182479 ?auto_182481 ) ) ( not ( = ?auto_182479 ?auto_182482 ) ) ( not ( = ?auto_182479 ?auto_182483 ) ) ( not ( = ?auto_182479 ?auto_182484 ) ) ( not ( = ?auto_182480 ?auto_182481 ) ) ( not ( = ?auto_182480 ?auto_182482 ) ) ( not ( = ?auto_182480 ?auto_182483 ) ) ( not ( = ?auto_182480 ?auto_182484 ) ) ( not ( = ?auto_182481 ?auto_182482 ) ) ( not ( = ?auto_182481 ?auto_182483 ) ) ( not ( = ?auto_182481 ?auto_182484 ) ) ( not ( = ?auto_182482 ?auto_182483 ) ) ( not ( = ?auto_182482 ?auto_182484 ) ) ( not ( = ?auto_182483 ?auto_182484 ) ) ( ON ?auto_182482 ?auto_182483 ) ( ON ?auto_182481 ?auto_182482 ) ( ON ?auto_182480 ?auto_182481 ) ( ON ?auto_182479 ?auto_182480 ) ( CLEAR ?auto_182477 ) ( ON ?auto_182478 ?auto_182479 ) ( CLEAR ?auto_182478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_182473 ?auto_182474 ?auto_182475 ?auto_182476 ?auto_182477 ?auto_182478 )
      ( MAKE-11PILE ?auto_182473 ?auto_182474 ?auto_182475 ?auto_182476 ?auto_182477 ?auto_182478 ?auto_182479 ?auto_182480 ?auto_182481 ?auto_182482 ?auto_182483 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182496 - BLOCK
      ?auto_182497 - BLOCK
      ?auto_182498 - BLOCK
      ?auto_182499 - BLOCK
      ?auto_182500 - BLOCK
      ?auto_182501 - BLOCK
      ?auto_182502 - BLOCK
      ?auto_182503 - BLOCK
      ?auto_182504 - BLOCK
      ?auto_182505 - BLOCK
      ?auto_182506 - BLOCK
    )
    :vars
    (
      ?auto_182507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182506 ?auto_182507 ) ( ON-TABLE ?auto_182496 ) ( ON ?auto_182497 ?auto_182496 ) ( ON ?auto_182498 ?auto_182497 ) ( ON ?auto_182499 ?auto_182498 ) ( not ( = ?auto_182496 ?auto_182497 ) ) ( not ( = ?auto_182496 ?auto_182498 ) ) ( not ( = ?auto_182496 ?auto_182499 ) ) ( not ( = ?auto_182496 ?auto_182500 ) ) ( not ( = ?auto_182496 ?auto_182501 ) ) ( not ( = ?auto_182496 ?auto_182502 ) ) ( not ( = ?auto_182496 ?auto_182503 ) ) ( not ( = ?auto_182496 ?auto_182504 ) ) ( not ( = ?auto_182496 ?auto_182505 ) ) ( not ( = ?auto_182496 ?auto_182506 ) ) ( not ( = ?auto_182496 ?auto_182507 ) ) ( not ( = ?auto_182497 ?auto_182498 ) ) ( not ( = ?auto_182497 ?auto_182499 ) ) ( not ( = ?auto_182497 ?auto_182500 ) ) ( not ( = ?auto_182497 ?auto_182501 ) ) ( not ( = ?auto_182497 ?auto_182502 ) ) ( not ( = ?auto_182497 ?auto_182503 ) ) ( not ( = ?auto_182497 ?auto_182504 ) ) ( not ( = ?auto_182497 ?auto_182505 ) ) ( not ( = ?auto_182497 ?auto_182506 ) ) ( not ( = ?auto_182497 ?auto_182507 ) ) ( not ( = ?auto_182498 ?auto_182499 ) ) ( not ( = ?auto_182498 ?auto_182500 ) ) ( not ( = ?auto_182498 ?auto_182501 ) ) ( not ( = ?auto_182498 ?auto_182502 ) ) ( not ( = ?auto_182498 ?auto_182503 ) ) ( not ( = ?auto_182498 ?auto_182504 ) ) ( not ( = ?auto_182498 ?auto_182505 ) ) ( not ( = ?auto_182498 ?auto_182506 ) ) ( not ( = ?auto_182498 ?auto_182507 ) ) ( not ( = ?auto_182499 ?auto_182500 ) ) ( not ( = ?auto_182499 ?auto_182501 ) ) ( not ( = ?auto_182499 ?auto_182502 ) ) ( not ( = ?auto_182499 ?auto_182503 ) ) ( not ( = ?auto_182499 ?auto_182504 ) ) ( not ( = ?auto_182499 ?auto_182505 ) ) ( not ( = ?auto_182499 ?auto_182506 ) ) ( not ( = ?auto_182499 ?auto_182507 ) ) ( not ( = ?auto_182500 ?auto_182501 ) ) ( not ( = ?auto_182500 ?auto_182502 ) ) ( not ( = ?auto_182500 ?auto_182503 ) ) ( not ( = ?auto_182500 ?auto_182504 ) ) ( not ( = ?auto_182500 ?auto_182505 ) ) ( not ( = ?auto_182500 ?auto_182506 ) ) ( not ( = ?auto_182500 ?auto_182507 ) ) ( not ( = ?auto_182501 ?auto_182502 ) ) ( not ( = ?auto_182501 ?auto_182503 ) ) ( not ( = ?auto_182501 ?auto_182504 ) ) ( not ( = ?auto_182501 ?auto_182505 ) ) ( not ( = ?auto_182501 ?auto_182506 ) ) ( not ( = ?auto_182501 ?auto_182507 ) ) ( not ( = ?auto_182502 ?auto_182503 ) ) ( not ( = ?auto_182502 ?auto_182504 ) ) ( not ( = ?auto_182502 ?auto_182505 ) ) ( not ( = ?auto_182502 ?auto_182506 ) ) ( not ( = ?auto_182502 ?auto_182507 ) ) ( not ( = ?auto_182503 ?auto_182504 ) ) ( not ( = ?auto_182503 ?auto_182505 ) ) ( not ( = ?auto_182503 ?auto_182506 ) ) ( not ( = ?auto_182503 ?auto_182507 ) ) ( not ( = ?auto_182504 ?auto_182505 ) ) ( not ( = ?auto_182504 ?auto_182506 ) ) ( not ( = ?auto_182504 ?auto_182507 ) ) ( not ( = ?auto_182505 ?auto_182506 ) ) ( not ( = ?auto_182505 ?auto_182507 ) ) ( not ( = ?auto_182506 ?auto_182507 ) ) ( ON ?auto_182505 ?auto_182506 ) ( ON ?auto_182504 ?auto_182505 ) ( ON ?auto_182503 ?auto_182504 ) ( ON ?auto_182502 ?auto_182503 ) ( ON ?auto_182501 ?auto_182502 ) ( CLEAR ?auto_182499 ) ( ON ?auto_182500 ?auto_182501 ) ( CLEAR ?auto_182500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182496 ?auto_182497 ?auto_182498 ?auto_182499 ?auto_182500 )
      ( MAKE-11PILE ?auto_182496 ?auto_182497 ?auto_182498 ?auto_182499 ?auto_182500 ?auto_182501 ?auto_182502 ?auto_182503 ?auto_182504 ?auto_182505 ?auto_182506 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182519 - BLOCK
      ?auto_182520 - BLOCK
      ?auto_182521 - BLOCK
      ?auto_182522 - BLOCK
      ?auto_182523 - BLOCK
      ?auto_182524 - BLOCK
      ?auto_182525 - BLOCK
      ?auto_182526 - BLOCK
      ?auto_182527 - BLOCK
      ?auto_182528 - BLOCK
      ?auto_182529 - BLOCK
    )
    :vars
    (
      ?auto_182530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182529 ?auto_182530 ) ( ON-TABLE ?auto_182519 ) ( ON ?auto_182520 ?auto_182519 ) ( ON ?auto_182521 ?auto_182520 ) ( ON ?auto_182522 ?auto_182521 ) ( not ( = ?auto_182519 ?auto_182520 ) ) ( not ( = ?auto_182519 ?auto_182521 ) ) ( not ( = ?auto_182519 ?auto_182522 ) ) ( not ( = ?auto_182519 ?auto_182523 ) ) ( not ( = ?auto_182519 ?auto_182524 ) ) ( not ( = ?auto_182519 ?auto_182525 ) ) ( not ( = ?auto_182519 ?auto_182526 ) ) ( not ( = ?auto_182519 ?auto_182527 ) ) ( not ( = ?auto_182519 ?auto_182528 ) ) ( not ( = ?auto_182519 ?auto_182529 ) ) ( not ( = ?auto_182519 ?auto_182530 ) ) ( not ( = ?auto_182520 ?auto_182521 ) ) ( not ( = ?auto_182520 ?auto_182522 ) ) ( not ( = ?auto_182520 ?auto_182523 ) ) ( not ( = ?auto_182520 ?auto_182524 ) ) ( not ( = ?auto_182520 ?auto_182525 ) ) ( not ( = ?auto_182520 ?auto_182526 ) ) ( not ( = ?auto_182520 ?auto_182527 ) ) ( not ( = ?auto_182520 ?auto_182528 ) ) ( not ( = ?auto_182520 ?auto_182529 ) ) ( not ( = ?auto_182520 ?auto_182530 ) ) ( not ( = ?auto_182521 ?auto_182522 ) ) ( not ( = ?auto_182521 ?auto_182523 ) ) ( not ( = ?auto_182521 ?auto_182524 ) ) ( not ( = ?auto_182521 ?auto_182525 ) ) ( not ( = ?auto_182521 ?auto_182526 ) ) ( not ( = ?auto_182521 ?auto_182527 ) ) ( not ( = ?auto_182521 ?auto_182528 ) ) ( not ( = ?auto_182521 ?auto_182529 ) ) ( not ( = ?auto_182521 ?auto_182530 ) ) ( not ( = ?auto_182522 ?auto_182523 ) ) ( not ( = ?auto_182522 ?auto_182524 ) ) ( not ( = ?auto_182522 ?auto_182525 ) ) ( not ( = ?auto_182522 ?auto_182526 ) ) ( not ( = ?auto_182522 ?auto_182527 ) ) ( not ( = ?auto_182522 ?auto_182528 ) ) ( not ( = ?auto_182522 ?auto_182529 ) ) ( not ( = ?auto_182522 ?auto_182530 ) ) ( not ( = ?auto_182523 ?auto_182524 ) ) ( not ( = ?auto_182523 ?auto_182525 ) ) ( not ( = ?auto_182523 ?auto_182526 ) ) ( not ( = ?auto_182523 ?auto_182527 ) ) ( not ( = ?auto_182523 ?auto_182528 ) ) ( not ( = ?auto_182523 ?auto_182529 ) ) ( not ( = ?auto_182523 ?auto_182530 ) ) ( not ( = ?auto_182524 ?auto_182525 ) ) ( not ( = ?auto_182524 ?auto_182526 ) ) ( not ( = ?auto_182524 ?auto_182527 ) ) ( not ( = ?auto_182524 ?auto_182528 ) ) ( not ( = ?auto_182524 ?auto_182529 ) ) ( not ( = ?auto_182524 ?auto_182530 ) ) ( not ( = ?auto_182525 ?auto_182526 ) ) ( not ( = ?auto_182525 ?auto_182527 ) ) ( not ( = ?auto_182525 ?auto_182528 ) ) ( not ( = ?auto_182525 ?auto_182529 ) ) ( not ( = ?auto_182525 ?auto_182530 ) ) ( not ( = ?auto_182526 ?auto_182527 ) ) ( not ( = ?auto_182526 ?auto_182528 ) ) ( not ( = ?auto_182526 ?auto_182529 ) ) ( not ( = ?auto_182526 ?auto_182530 ) ) ( not ( = ?auto_182527 ?auto_182528 ) ) ( not ( = ?auto_182527 ?auto_182529 ) ) ( not ( = ?auto_182527 ?auto_182530 ) ) ( not ( = ?auto_182528 ?auto_182529 ) ) ( not ( = ?auto_182528 ?auto_182530 ) ) ( not ( = ?auto_182529 ?auto_182530 ) ) ( ON ?auto_182528 ?auto_182529 ) ( ON ?auto_182527 ?auto_182528 ) ( ON ?auto_182526 ?auto_182527 ) ( ON ?auto_182525 ?auto_182526 ) ( ON ?auto_182524 ?auto_182525 ) ( CLEAR ?auto_182522 ) ( ON ?auto_182523 ?auto_182524 ) ( CLEAR ?auto_182523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_182519 ?auto_182520 ?auto_182521 ?auto_182522 ?auto_182523 )
      ( MAKE-11PILE ?auto_182519 ?auto_182520 ?auto_182521 ?auto_182522 ?auto_182523 ?auto_182524 ?auto_182525 ?auto_182526 ?auto_182527 ?auto_182528 ?auto_182529 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182542 - BLOCK
      ?auto_182543 - BLOCK
      ?auto_182544 - BLOCK
      ?auto_182545 - BLOCK
      ?auto_182546 - BLOCK
      ?auto_182547 - BLOCK
      ?auto_182548 - BLOCK
      ?auto_182549 - BLOCK
      ?auto_182550 - BLOCK
      ?auto_182551 - BLOCK
      ?auto_182552 - BLOCK
    )
    :vars
    (
      ?auto_182553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182552 ?auto_182553 ) ( ON-TABLE ?auto_182542 ) ( ON ?auto_182543 ?auto_182542 ) ( ON ?auto_182544 ?auto_182543 ) ( not ( = ?auto_182542 ?auto_182543 ) ) ( not ( = ?auto_182542 ?auto_182544 ) ) ( not ( = ?auto_182542 ?auto_182545 ) ) ( not ( = ?auto_182542 ?auto_182546 ) ) ( not ( = ?auto_182542 ?auto_182547 ) ) ( not ( = ?auto_182542 ?auto_182548 ) ) ( not ( = ?auto_182542 ?auto_182549 ) ) ( not ( = ?auto_182542 ?auto_182550 ) ) ( not ( = ?auto_182542 ?auto_182551 ) ) ( not ( = ?auto_182542 ?auto_182552 ) ) ( not ( = ?auto_182542 ?auto_182553 ) ) ( not ( = ?auto_182543 ?auto_182544 ) ) ( not ( = ?auto_182543 ?auto_182545 ) ) ( not ( = ?auto_182543 ?auto_182546 ) ) ( not ( = ?auto_182543 ?auto_182547 ) ) ( not ( = ?auto_182543 ?auto_182548 ) ) ( not ( = ?auto_182543 ?auto_182549 ) ) ( not ( = ?auto_182543 ?auto_182550 ) ) ( not ( = ?auto_182543 ?auto_182551 ) ) ( not ( = ?auto_182543 ?auto_182552 ) ) ( not ( = ?auto_182543 ?auto_182553 ) ) ( not ( = ?auto_182544 ?auto_182545 ) ) ( not ( = ?auto_182544 ?auto_182546 ) ) ( not ( = ?auto_182544 ?auto_182547 ) ) ( not ( = ?auto_182544 ?auto_182548 ) ) ( not ( = ?auto_182544 ?auto_182549 ) ) ( not ( = ?auto_182544 ?auto_182550 ) ) ( not ( = ?auto_182544 ?auto_182551 ) ) ( not ( = ?auto_182544 ?auto_182552 ) ) ( not ( = ?auto_182544 ?auto_182553 ) ) ( not ( = ?auto_182545 ?auto_182546 ) ) ( not ( = ?auto_182545 ?auto_182547 ) ) ( not ( = ?auto_182545 ?auto_182548 ) ) ( not ( = ?auto_182545 ?auto_182549 ) ) ( not ( = ?auto_182545 ?auto_182550 ) ) ( not ( = ?auto_182545 ?auto_182551 ) ) ( not ( = ?auto_182545 ?auto_182552 ) ) ( not ( = ?auto_182545 ?auto_182553 ) ) ( not ( = ?auto_182546 ?auto_182547 ) ) ( not ( = ?auto_182546 ?auto_182548 ) ) ( not ( = ?auto_182546 ?auto_182549 ) ) ( not ( = ?auto_182546 ?auto_182550 ) ) ( not ( = ?auto_182546 ?auto_182551 ) ) ( not ( = ?auto_182546 ?auto_182552 ) ) ( not ( = ?auto_182546 ?auto_182553 ) ) ( not ( = ?auto_182547 ?auto_182548 ) ) ( not ( = ?auto_182547 ?auto_182549 ) ) ( not ( = ?auto_182547 ?auto_182550 ) ) ( not ( = ?auto_182547 ?auto_182551 ) ) ( not ( = ?auto_182547 ?auto_182552 ) ) ( not ( = ?auto_182547 ?auto_182553 ) ) ( not ( = ?auto_182548 ?auto_182549 ) ) ( not ( = ?auto_182548 ?auto_182550 ) ) ( not ( = ?auto_182548 ?auto_182551 ) ) ( not ( = ?auto_182548 ?auto_182552 ) ) ( not ( = ?auto_182548 ?auto_182553 ) ) ( not ( = ?auto_182549 ?auto_182550 ) ) ( not ( = ?auto_182549 ?auto_182551 ) ) ( not ( = ?auto_182549 ?auto_182552 ) ) ( not ( = ?auto_182549 ?auto_182553 ) ) ( not ( = ?auto_182550 ?auto_182551 ) ) ( not ( = ?auto_182550 ?auto_182552 ) ) ( not ( = ?auto_182550 ?auto_182553 ) ) ( not ( = ?auto_182551 ?auto_182552 ) ) ( not ( = ?auto_182551 ?auto_182553 ) ) ( not ( = ?auto_182552 ?auto_182553 ) ) ( ON ?auto_182551 ?auto_182552 ) ( ON ?auto_182550 ?auto_182551 ) ( ON ?auto_182549 ?auto_182550 ) ( ON ?auto_182548 ?auto_182549 ) ( ON ?auto_182547 ?auto_182548 ) ( ON ?auto_182546 ?auto_182547 ) ( CLEAR ?auto_182544 ) ( ON ?auto_182545 ?auto_182546 ) ( CLEAR ?auto_182545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182542 ?auto_182543 ?auto_182544 ?auto_182545 )
      ( MAKE-11PILE ?auto_182542 ?auto_182543 ?auto_182544 ?auto_182545 ?auto_182546 ?auto_182547 ?auto_182548 ?auto_182549 ?auto_182550 ?auto_182551 ?auto_182552 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182565 - BLOCK
      ?auto_182566 - BLOCK
      ?auto_182567 - BLOCK
      ?auto_182568 - BLOCK
      ?auto_182569 - BLOCK
      ?auto_182570 - BLOCK
      ?auto_182571 - BLOCK
      ?auto_182572 - BLOCK
      ?auto_182573 - BLOCK
      ?auto_182574 - BLOCK
      ?auto_182575 - BLOCK
    )
    :vars
    (
      ?auto_182576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182575 ?auto_182576 ) ( ON-TABLE ?auto_182565 ) ( ON ?auto_182566 ?auto_182565 ) ( ON ?auto_182567 ?auto_182566 ) ( not ( = ?auto_182565 ?auto_182566 ) ) ( not ( = ?auto_182565 ?auto_182567 ) ) ( not ( = ?auto_182565 ?auto_182568 ) ) ( not ( = ?auto_182565 ?auto_182569 ) ) ( not ( = ?auto_182565 ?auto_182570 ) ) ( not ( = ?auto_182565 ?auto_182571 ) ) ( not ( = ?auto_182565 ?auto_182572 ) ) ( not ( = ?auto_182565 ?auto_182573 ) ) ( not ( = ?auto_182565 ?auto_182574 ) ) ( not ( = ?auto_182565 ?auto_182575 ) ) ( not ( = ?auto_182565 ?auto_182576 ) ) ( not ( = ?auto_182566 ?auto_182567 ) ) ( not ( = ?auto_182566 ?auto_182568 ) ) ( not ( = ?auto_182566 ?auto_182569 ) ) ( not ( = ?auto_182566 ?auto_182570 ) ) ( not ( = ?auto_182566 ?auto_182571 ) ) ( not ( = ?auto_182566 ?auto_182572 ) ) ( not ( = ?auto_182566 ?auto_182573 ) ) ( not ( = ?auto_182566 ?auto_182574 ) ) ( not ( = ?auto_182566 ?auto_182575 ) ) ( not ( = ?auto_182566 ?auto_182576 ) ) ( not ( = ?auto_182567 ?auto_182568 ) ) ( not ( = ?auto_182567 ?auto_182569 ) ) ( not ( = ?auto_182567 ?auto_182570 ) ) ( not ( = ?auto_182567 ?auto_182571 ) ) ( not ( = ?auto_182567 ?auto_182572 ) ) ( not ( = ?auto_182567 ?auto_182573 ) ) ( not ( = ?auto_182567 ?auto_182574 ) ) ( not ( = ?auto_182567 ?auto_182575 ) ) ( not ( = ?auto_182567 ?auto_182576 ) ) ( not ( = ?auto_182568 ?auto_182569 ) ) ( not ( = ?auto_182568 ?auto_182570 ) ) ( not ( = ?auto_182568 ?auto_182571 ) ) ( not ( = ?auto_182568 ?auto_182572 ) ) ( not ( = ?auto_182568 ?auto_182573 ) ) ( not ( = ?auto_182568 ?auto_182574 ) ) ( not ( = ?auto_182568 ?auto_182575 ) ) ( not ( = ?auto_182568 ?auto_182576 ) ) ( not ( = ?auto_182569 ?auto_182570 ) ) ( not ( = ?auto_182569 ?auto_182571 ) ) ( not ( = ?auto_182569 ?auto_182572 ) ) ( not ( = ?auto_182569 ?auto_182573 ) ) ( not ( = ?auto_182569 ?auto_182574 ) ) ( not ( = ?auto_182569 ?auto_182575 ) ) ( not ( = ?auto_182569 ?auto_182576 ) ) ( not ( = ?auto_182570 ?auto_182571 ) ) ( not ( = ?auto_182570 ?auto_182572 ) ) ( not ( = ?auto_182570 ?auto_182573 ) ) ( not ( = ?auto_182570 ?auto_182574 ) ) ( not ( = ?auto_182570 ?auto_182575 ) ) ( not ( = ?auto_182570 ?auto_182576 ) ) ( not ( = ?auto_182571 ?auto_182572 ) ) ( not ( = ?auto_182571 ?auto_182573 ) ) ( not ( = ?auto_182571 ?auto_182574 ) ) ( not ( = ?auto_182571 ?auto_182575 ) ) ( not ( = ?auto_182571 ?auto_182576 ) ) ( not ( = ?auto_182572 ?auto_182573 ) ) ( not ( = ?auto_182572 ?auto_182574 ) ) ( not ( = ?auto_182572 ?auto_182575 ) ) ( not ( = ?auto_182572 ?auto_182576 ) ) ( not ( = ?auto_182573 ?auto_182574 ) ) ( not ( = ?auto_182573 ?auto_182575 ) ) ( not ( = ?auto_182573 ?auto_182576 ) ) ( not ( = ?auto_182574 ?auto_182575 ) ) ( not ( = ?auto_182574 ?auto_182576 ) ) ( not ( = ?auto_182575 ?auto_182576 ) ) ( ON ?auto_182574 ?auto_182575 ) ( ON ?auto_182573 ?auto_182574 ) ( ON ?auto_182572 ?auto_182573 ) ( ON ?auto_182571 ?auto_182572 ) ( ON ?auto_182570 ?auto_182571 ) ( ON ?auto_182569 ?auto_182570 ) ( CLEAR ?auto_182567 ) ( ON ?auto_182568 ?auto_182569 ) ( CLEAR ?auto_182568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_182565 ?auto_182566 ?auto_182567 ?auto_182568 )
      ( MAKE-11PILE ?auto_182565 ?auto_182566 ?auto_182567 ?auto_182568 ?auto_182569 ?auto_182570 ?auto_182571 ?auto_182572 ?auto_182573 ?auto_182574 ?auto_182575 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182588 - BLOCK
      ?auto_182589 - BLOCK
      ?auto_182590 - BLOCK
      ?auto_182591 - BLOCK
      ?auto_182592 - BLOCK
      ?auto_182593 - BLOCK
      ?auto_182594 - BLOCK
      ?auto_182595 - BLOCK
      ?auto_182596 - BLOCK
      ?auto_182597 - BLOCK
      ?auto_182598 - BLOCK
    )
    :vars
    (
      ?auto_182599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182598 ?auto_182599 ) ( ON-TABLE ?auto_182588 ) ( ON ?auto_182589 ?auto_182588 ) ( not ( = ?auto_182588 ?auto_182589 ) ) ( not ( = ?auto_182588 ?auto_182590 ) ) ( not ( = ?auto_182588 ?auto_182591 ) ) ( not ( = ?auto_182588 ?auto_182592 ) ) ( not ( = ?auto_182588 ?auto_182593 ) ) ( not ( = ?auto_182588 ?auto_182594 ) ) ( not ( = ?auto_182588 ?auto_182595 ) ) ( not ( = ?auto_182588 ?auto_182596 ) ) ( not ( = ?auto_182588 ?auto_182597 ) ) ( not ( = ?auto_182588 ?auto_182598 ) ) ( not ( = ?auto_182588 ?auto_182599 ) ) ( not ( = ?auto_182589 ?auto_182590 ) ) ( not ( = ?auto_182589 ?auto_182591 ) ) ( not ( = ?auto_182589 ?auto_182592 ) ) ( not ( = ?auto_182589 ?auto_182593 ) ) ( not ( = ?auto_182589 ?auto_182594 ) ) ( not ( = ?auto_182589 ?auto_182595 ) ) ( not ( = ?auto_182589 ?auto_182596 ) ) ( not ( = ?auto_182589 ?auto_182597 ) ) ( not ( = ?auto_182589 ?auto_182598 ) ) ( not ( = ?auto_182589 ?auto_182599 ) ) ( not ( = ?auto_182590 ?auto_182591 ) ) ( not ( = ?auto_182590 ?auto_182592 ) ) ( not ( = ?auto_182590 ?auto_182593 ) ) ( not ( = ?auto_182590 ?auto_182594 ) ) ( not ( = ?auto_182590 ?auto_182595 ) ) ( not ( = ?auto_182590 ?auto_182596 ) ) ( not ( = ?auto_182590 ?auto_182597 ) ) ( not ( = ?auto_182590 ?auto_182598 ) ) ( not ( = ?auto_182590 ?auto_182599 ) ) ( not ( = ?auto_182591 ?auto_182592 ) ) ( not ( = ?auto_182591 ?auto_182593 ) ) ( not ( = ?auto_182591 ?auto_182594 ) ) ( not ( = ?auto_182591 ?auto_182595 ) ) ( not ( = ?auto_182591 ?auto_182596 ) ) ( not ( = ?auto_182591 ?auto_182597 ) ) ( not ( = ?auto_182591 ?auto_182598 ) ) ( not ( = ?auto_182591 ?auto_182599 ) ) ( not ( = ?auto_182592 ?auto_182593 ) ) ( not ( = ?auto_182592 ?auto_182594 ) ) ( not ( = ?auto_182592 ?auto_182595 ) ) ( not ( = ?auto_182592 ?auto_182596 ) ) ( not ( = ?auto_182592 ?auto_182597 ) ) ( not ( = ?auto_182592 ?auto_182598 ) ) ( not ( = ?auto_182592 ?auto_182599 ) ) ( not ( = ?auto_182593 ?auto_182594 ) ) ( not ( = ?auto_182593 ?auto_182595 ) ) ( not ( = ?auto_182593 ?auto_182596 ) ) ( not ( = ?auto_182593 ?auto_182597 ) ) ( not ( = ?auto_182593 ?auto_182598 ) ) ( not ( = ?auto_182593 ?auto_182599 ) ) ( not ( = ?auto_182594 ?auto_182595 ) ) ( not ( = ?auto_182594 ?auto_182596 ) ) ( not ( = ?auto_182594 ?auto_182597 ) ) ( not ( = ?auto_182594 ?auto_182598 ) ) ( not ( = ?auto_182594 ?auto_182599 ) ) ( not ( = ?auto_182595 ?auto_182596 ) ) ( not ( = ?auto_182595 ?auto_182597 ) ) ( not ( = ?auto_182595 ?auto_182598 ) ) ( not ( = ?auto_182595 ?auto_182599 ) ) ( not ( = ?auto_182596 ?auto_182597 ) ) ( not ( = ?auto_182596 ?auto_182598 ) ) ( not ( = ?auto_182596 ?auto_182599 ) ) ( not ( = ?auto_182597 ?auto_182598 ) ) ( not ( = ?auto_182597 ?auto_182599 ) ) ( not ( = ?auto_182598 ?auto_182599 ) ) ( ON ?auto_182597 ?auto_182598 ) ( ON ?auto_182596 ?auto_182597 ) ( ON ?auto_182595 ?auto_182596 ) ( ON ?auto_182594 ?auto_182595 ) ( ON ?auto_182593 ?auto_182594 ) ( ON ?auto_182592 ?auto_182593 ) ( ON ?auto_182591 ?auto_182592 ) ( CLEAR ?auto_182589 ) ( ON ?auto_182590 ?auto_182591 ) ( CLEAR ?auto_182590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182588 ?auto_182589 ?auto_182590 )
      ( MAKE-11PILE ?auto_182588 ?auto_182589 ?auto_182590 ?auto_182591 ?auto_182592 ?auto_182593 ?auto_182594 ?auto_182595 ?auto_182596 ?auto_182597 ?auto_182598 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182611 - BLOCK
      ?auto_182612 - BLOCK
      ?auto_182613 - BLOCK
      ?auto_182614 - BLOCK
      ?auto_182615 - BLOCK
      ?auto_182616 - BLOCK
      ?auto_182617 - BLOCK
      ?auto_182618 - BLOCK
      ?auto_182619 - BLOCK
      ?auto_182620 - BLOCK
      ?auto_182621 - BLOCK
    )
    :vars
    (
      ?auto_182622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182621 ?auto_182622 ) ( ON-TABLE ?auto_182611 ) ( ON ?auto_182612 ?auto_182611 ) ( not ( = ?auto_182611 ?auto_182612 ) ) ( not ( = ?auto_182611 ?auto_182613 ) ) ( not ( = ?auto_182611 ?auto_182614 ) ) ( not ( = ?auto_182611 ?auto_182615 ) ) ( not ( = ?auto_182611 ?auto_182616 ) ) ( not ( = ?auto_182611 ?auto_182617 ) ) ( not ( = ?auto_182611 ?auto_182618 ) ) ( not ( = ?auto_182611 ?auto_182619 ) ) ( not ( = ?auto_182611 ?auto_182620 ) ) ( not ( = ?auto_182611 ?auto_182621 ) ) ( not ( = ?auto_182611 ?auto_182622 ) ) ( not ( = ?auto_182612 ?auto_182613 ) ) ( not ( = ?auto_182612 ?auto_182614 ) ) ( not ( = ?auto_182612 ?auto_182615 ) ) ( not ( = ?auto_182612 ?auto_182616 ) ) ( not ( = ?auto_182612 ?auto_182617 ) ) ( not ( = ?auto_182612 ?auto_182618 ) ) ( not ( = ?auto_182612 ?auto_182619 ) ) ( not ( = ?auto_182612 ?auto_182620 ) ) ( not ( = ?auto_182612 ?auto_182621 ) ) ( not ( = ?auto_182612 ?auto_182622 ) ) ( not ( = ?auto_182613 ?auto_182614 ) ) ( not ( = ?auto_182613 ?auto_182615 ) ) ( not ( = ?auto_182613 ?auto_182616 ) ) ( not ( = ?auto_182613 ?auto_182617 ) ) ( not ( = ?auto_182613 ?auto_182618 ) ) ( not ( = ?auto_182613 ?auto_182619 ) ) ( not ( = ?auto_182613 ?auto_182620 ) ) ( not ( = ?auto_182613 ?auto_182621 ) ) ( not ( = ?auto_182613 ?auto_182622 ) ) ( not ( = ?auto_182614 ?auto_182615 ) ) ( not ( = ?auto_182614 ?auto_182616 ) ) ( not ( = ?auto_182614 ?auto_182617 ) ) ( not ( = ?auto_182614 ?auto_182618 ) ) ( not ( = ?auto_182614 ?auto_182619 ) ) ( not ( = ?auto_182614 ?auto_182620 ) ) ( not ( = ?auto_182614 ?auto_182621 ) ) ( not ( = ?auto_182614 ?auto_182622 ) ) ( not ( = ?auto_182615 ?auto_182616 ) ) ( not ( = ?auto_182615 ?auto_182617 ) ) ( not ( = ?auto_182615 ?auto_182618 ) ) ( not ( = ?auto_182615 ?auto_182619 ) ) ( not ( = ?auto_182615 ?auto_182620 ) ) ( not ( = ?auto_182615 ?auto_182621 ) ) ( not ( = ?auto_182615 ?auto_182622 ) ) ( not ( = ?auto_182616 ?auto_182617 ) ) ( not ( = ?auto_182616 ?auto_182618 ) ) ( not ( = ?auto_182616 ?auto_182619 ) ) ( not ( = ?auto_182616 ?auto_182620 ) ) ( not ( = ?auto_182616 ?auto_182621 ) ) ( not ( = ?auto_182616 ?auto_182622 ) ) ( not ( = ?auto_182617 ?auto_182618 ) ) ( not ( = ?auto_182617 ?auto_182619 ) ) ( not ( = ?auto_182617 ?auto_182620 ) ) ( not ( = ?auto_182617 ?auto_182621 ) ) ( not ( = ?auto_182617 ?auto_182622 ) ) ( not ( = ?auto_182618 ?auto_182619 ) ) ( not ( = ?auto_182618 ?auto_182620 ) ) ( not ( = ?auto_182618 ?auto_182621 ) ) ( not ( = ?auto_182618 ?auto_182622 ) ) ( not ( = ?auto_182619 ?auto_182620 ) ) ( not ( = ?auto_182619 ?auto_182621 ) ) ( not ( = ?auto_182619 ?auto_182622 ) ) ( not ( = ?auto_182620 ?auto_182621 ) ) ( not ( = ?auto_182620 ?auto_182622 ) ) ( not ( = ?auto_182621 ?auto_182622 ) ) ( ON ?auto_182620 ?auto_182621 ) ( ON ?auto_182619 ?auto_182620 ) ( ON ?auto_182618 ?auto_182619 ) ( ON ?auto_182617 ?auto_182618 ) ( ON ?auto_182616 ?auto_182617 ) ( ON ?auto_182615 ?auto_182616 ) ( ON ?auto_182614 ?auto_182615 ) ( CLEAR ?auto_182612 ) ( ON ?auto_182613 ?auto_182614 ) ( CLEAR ?auto_182613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_182611 ?auto_182612 ?auto_182613 )
      ( MAKE-11PILE ?auto_182611 ?auto_182612 ?auto_182613 ?auto_182614 ?auto_182615 ?auto_182616 ?auto_182617 ?auto_182618 ?auto_182619 ?auto_182620 ?auto_182621 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182634 - BLOCK
      ?auto_182635 - BLOCK
      ?auto_182636 - BLOCK
      ?auto_182637 - BLOCK
      ?auto_182638 - BLOCK
      ?auto_182639 - BLOCK
      ?auto_182640 - BLOCK
      ?auto_182641 - BLOCK
      ?auto_182642 - BLOCK
      ?auto_182643 - BLOCK
      ?auto_182644 - BLOCK
    )
    :vars
    (
      ?auto_182645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182644 ?auto_182645 ) ( ON-TABLE ?auto_182634 ) ( not ( = ?auto_182634 ?auto_182635 ) ) ( not ( = ?auto_182634 ?auto_182636 ) ) ( not ( = ?auto_182634 ?auto_182637 ) ) ( not ( = ?auto_182634 ?auto_182638 ) ) ( not ( = ?auto_182634 ?auto_182639 ) ) ( not ( = ?auto_182634 ?auto_182640 ) ) ( not ( = ?auto_182634 ?auto_182641 ) ) ( not ( = ?auto_182634 ?auto_182642 ) ) ( not ( = ?auto_182634 ?auto_182643 ) ) ( not ( = ?auto_182634 ?auto_182644 ) ) ( not ( = ?auto_182634 ?auto_182645 ) ) ( not ( = ?auto_182635 ?auto_182636 ) ) ( not ( = ?auto_182635 ?auto_182637 ) ) ( not ( = ?auto_182635 ?auto_182638 ) ) ( not ( = ?auto_182635 ?auto_182639 ) ) ( not ( = ?auto_182635 ?auto_182640 ) ) ( not ( = ?auto_182635 ?auto_182641 ) ) ( not ( = ?auto_182635 ?auto_182642 ) ) ( not ( = ?auto_182635 ?auto_182643 ) ) ( not ( = ?auto_182635 ?auto_182644 ) ) ( not ( = ?auto_182635 ?auto_182645 ) ) ( not ( = ?auto_182636 ?auto_182637 ) ) ( not ( = ?auto_182636 ?auto_182638 ) ) ( not ( = ?auto_182636 ?auto_182639 ) ) ( not ( = ?auto_182636 ?auto_182640 ) ) ( not ( = ?auto_182636 ?auto_182641 ) ) ( not ( = ?auto_182636 ?auto_182642 ) ) ( not ( = ?auto_182636 ?auto_182643 ) ) ( not ( = ?auto_182636 ?auto_182644 ) ) ( not ( = ?auto_182636 ?auto_182645 ) ) ( not ( = ?auto_182637 ?auto_182638 ) ) ( not ( = ?auto_182637 ?auto_182639 ) ) ( not ( = ?auto_182637 ?auto_182640 ) ) ( not ( = ?auto_182637 ?auto_182641 ) ) ( not ( = ?auto_182637 ?auto_182642 ) ) ( not ( = ?auto_182637 ?auto_182643 ) ) ( not ( = ?auto_182637 ?auto_182644 ) ) ( not ( = ?auto_182637 ?auto_182645 ) ) ( not ( = ?auto_182638 ?auto_182639 ) ) ( not ( = ?auto_182638 ?auto_182640 ) ) ( not ( = ?auto_182638 ?auto_182641 ) ) ( not ( = ?auto_182638 ?auto_182642 ) ) ( not ( = ?auto_182638 ?auto_182643 ) ) ( not ( = ?auto_182638 ?auto_182644 ) ) ( not ( = ?auto_182638 ?auto_182645 ) ) ( not ( = ?auto_182639 ?auto_182640 ) ) ( not ( = ?auto_182639 ?auto_182641 ) ) ( not ( = ?auto_182639 ?auto_182642 ) ) ( not ( = ?auto_182639 ?auto_182643 ) ) ( not ( = ?auto_182639 ?auto_182644 ) ) ( not ( = ?auto_182639 ?auto_182645 ) ) ( not ( = ?auto_182640 ?auto_182641 ) ) ( not ( = ?auto_182640 ?auto_182642 ) ) ( not ( = ?auto_182640 ?auto_182643 ) ) ( not ( = ?auto_182640 ?auto_182644 ) ) ( not ( = ?auto_182640 ?auto_182645 ) ) ( not ( = ?auto_182641 ?auto_182642 ) ) ( not ( = ?auto_182641 ?auto_182643 ) ) ( not ( = ?auto_182641 ?auto_182644 ) ) ( not ( = ?auto_182641 ?auto_182645 ) ) ( not ( = ?auto_182642 ?auto_182643 ) ) ( not ( = ?auto_182642 ?auto_182644 ) ) ( not ( = ?auto_182642 ?auto_182645 ) ) ( not ( = ?auto_182643 ?auto_182644 ) ) ( not ( = ?auto_182643 ?auto_182645 ) ) ( not ( = ?auto_182644 ?auto_182645 ) ) ( ON ?auto_182643 ?auto_182644 ) ( ON ?auto_182642 ?auto_182643 ) ( ON ?auto_182641 ?auto_182642 ) ( ON ?auto_182640 ?auto_182641 ) ( ON ?auto_182639 ?auto_182640 ) ( ON ?auto_182638 ?auto_182639 ) ( ON ?auto_182637 ?auto_182638 ) ( ON ?auto_182636 ?auto_182637 ) ( CLEAR ?auto_182634 ) ( ON ?auto_182635 ?auto_182636 ) ( CLEAR ?auto_182635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182634 ?auto_182635 )
      ( MAKE-11PILE ?auto_182634 ?auto_182635 ?auto_182636 ?auto_182637 ?auto_182638 ?auto_182639 ?auto_182640 ?auto_182641 ?auto_182642 ?auto_182643 ?auto_182644 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182657 - BLOCK
      ?auto_182658 - BLOCK
      ?auto_182659 - BLOCK
      ?auto_182660 - BLOCK
      ?auto_182661 - BLOCK
      ?auto_182662 - BLOCK
      ?auto_182663 - BLOCK
      ?auto_182664 - BLOCK
      ?auto_182665 - BLOCK
      ?auto_182666 - BLOCK
      ?auto_182667 - BLOCK
    )
    :vars
    (
      ?auto_182668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182667 ?auto_182668 ) ( ON-TABLE ?auto_182657 ) ( not ( = ?auto_182657 ?auto_182658 ) ) ( not ( = ?auto_182657 ?auto_182659 ) ) ( not ( = ?auto_182657 ?auto_182660 ) ) ( not ( = ?auto_182657 ?auto_182661 ) ) ( not ( = ?auto_182657 ?auto_182662 ) ) ( not ( = ?auto_182657 ?auto_182663 ) ) ( not ( = ?auto_182657 ?auto_182664 ) ) ( not ( = ?auto_182657 ?auto_182665 ) ) ( not ( = ?auto_182657 ?auto_182666 ) ) ( not ( = ?auto_182657 ?auto_182667 ) ) ( not ( = ?auto_182657 ?auto_182668 ) ) ( not ( = ?auto_182658 ?auto_182659 ) ) ( not ( = ?auto_182658 ?auto_182660 ) ) ( not ( = ?auto_182658 ?auto_182661 ) ) ( not ( = ?auto_182658 ?auto_182662 ) ) ( not ( = ?auto_182658 ?auto_182663 ) ) ( not ( = ?auto_182658 ?auto_182664 ) ) ( not ( = ?auto_182658 ?auto_182665 ) ) ( not ( = ?auto_182658 ?auto_182666 ) ) ( not ( = ?auto_182658 ?auto_182667 ) ) ( not ( = ?auto_182658 ?auto_182668 ) ) ( not ( = ?auto_182659 ?auto_182660 ) ) ( not ( = ?auto_182659 ?auto_182661 ) ) ( not ( = ?auto_182659 ?auto_182662 ) ) ( not ( = ?auto_182659 ?auto_182663 ) ) ( not ( = ?auto_182659 ?auto_182664 ) ) ( not ( = ?auto_182659 ?auto_182665 ) ) ( not ( = ?auto_182659 ?auto_182666 ) ) ( not ( = ?auto_182659 ?auto_182667 ) ) ( not ( = ?auto_182659 ?auto_182668 ) ) ( not ( = ?auto_182660 ?auto_182661 ) ) ( not ( = ?auto_182660 ?auto_182662 ) ) ( not ( = ?auto_182660 ?auto_182663 ) ) ( not ( = ?auto_182660 ?auto_182664 ) ) ( not ( = ?auto_182660 ?auto_182665 ) ) ( not ( = ?auto_182660 ?auto_182666 ) ) ( not ( = ?auto_182660 ?auto_182667 ) ) ( not ( = ?auto_182660 ?auto_182668 ) ) ( not ( = ?auto_182661 ?auto_182662 ) ) ( not ( = ?auto_182661 ?auto_182663 ) ) ( not ( = ?auto_182661 ?auto_182664 ) ) ( not ( = ?auto_182661 ?auto_182665 ) ) ( not ( = ?auto_182661 ?auto_182666 ) ) ( not ( = ?auto_182661 ?auto_182667 ) ) ( not ( = ?auto_182661 ?auto_182668 ) ) ( not ( = ?auto_182662 ?auto_182663 ) ) ( not ( = ?auto_182662 ?auto_182664 ) ) ( not ( = ?auto_182662 ?auto_182665 ) ) ( not ( = ?auto_182662 ?auto_182666 ) ) ( not ( = ?auto_182662 ?auto_182667 ) ) ( not ( = ?auto_182662 ?auto_182668 ) ) ( not ( = ?auto_182663 ?auto_182664 ) ) ( not ( = ?auto_182663 ?auto_182665 ) ) ( not ( = ?auto_182663 ?auto_182666 ) ) ( not ( = ?auto_182663 ?auto_182667 ) ) ( not ( = ?auto_182663 ?auto_182668 ) ) ( not ( = ?auto_182664 ?auto_182665 ) ) ( not ( = ?auto_182664 ?auto_182666 ) ) ( not ( = ?auto_182664 ?auto_182667 ) ) ( not ( = ?auto_182664 ?auto_182668 ) ) ( not ( = ?auto_182665 ?auto_182666 ) ) ( not ( = ?auto_182665 ?auto_182667 ) ) ( not ( = ?auto_182665 ?auto_182668 ) ) ( not ( = ?auto_182666 ?auto_182667 ) ) ( not ( = ?auto_182666 ?auto_182668 ) ) ( not ( = ?auto_182667 ?auto_182668 ) ) ( ON ?auto_182666 ?auto_182667 ) ( ON ?auto_182665 ?auto_182666 ) ( ON ?auto_182664 ?auto_182665 ) ( ON ?auto_182663 ?auto_182664 ) ( ON ?auto_182662 ?auto_182663 ) ( ON ?auto_182661 ?auto_182662 ) ( ON ?auto_182660 ?auto_182661 ) ( ON ?auto_182659 ?auto_182660 ) ( CLEAR ?auto_182657 ) ( ON ?auto_182658 ?auto_182659 ) ( CLEAR ?auto_182658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_182657 ?auto_182658 )
      ( MAKE-11PILE ?auto_182657 ?auto_182658 ?auto_182659 ?auto_182660 ?auto_182661 ?auto_182662 ?auto_182663 ?auto_182664 ?auto_182665 ?auto_182666 ?auto_182667 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182680 - BLOCK
      ?auto_182681 - BLOCK
      ?auto_182682 - BLOCK
      ?auto_182683 - BLOCK
      ?auto_182684 - BLOCK
      ?auto_182685 - BLOCK
      ?auto_182686 - BLOCK
      ?auto_182687 - BLOCK
      ?auto_182688 - BLOCK
      ?auto_182689 - BLOCK
      ?auto_182690 - BLOCK
    )
    :vars
    (
      ?auto_182691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182690 ?auto_182691 ) ( not ( = ?auto_182680 ?auto_182681 ) ) ( not ( = ?auto_182680 ?auto_182682 ) ) ( not ( = ?auto_182680 ?auto_182683 ) ) ( not ( = ?auto_182680 ?auto_182684 ) ) ( not ( = ?auto_182680 ?auto_182685 ) ) ( not ( = ?auto_182680 ?auto_182686 ) ) ( not ( = ?auto_182680 ?auto_182687 ) ) ( not ( = ?auto_182680 ?auto_182688 ) ) ( not ( = ?auto_182680 ?auto_182689 ) ) ( not ( = ?auto_182680 ?auto_182690 ) ) ( not ( = ?auto_182680 ?auto_182691 ) ) ( not ( = ?auto_182681 ?auto_182682 ) ) ( not ( = ?auto_182681 ?auto_182683 ) ) ( not ( = ?auto_182681 ?auto_182684 ) ) ( not ( = ?auto_182681 ?auto_182685 ) ) ( not ( = ?auto_182681 ?auto_182686 ) ) ( not ( = ?auto_182681 ?auto_182687 ) ) ( not ( = ?auto_182681 ?auto_182688 ) ) ( not ( = ?auto_182681 ?auto_182689 ) ) ( not ( = ?auto_182681 ?auto_182690 ) ) ( not ( = ?auto_182681 ?auto_182691 ) ) ( not ( = ?auto_182682 ?auto_182683 ) ) ( not ( = ?auto_182682 ?auto_182684 ) ) ( not ( = ?auto_182682 ?auto_182685 ) ) ( not ( = ?auto_182682 ?auto_182686 ) ) ( not ( = ?auto_182682 ?auto_182687 ) ) ( not ( = ?auto_182682 ?auto_182688 ) ) ( not ( = ?auto_182682 ?auto_182689 ) ) ( not ( = ?auto_182682 ?auto_182690 ) ) ( not ( = ?auto_182682 ?auto_182691 ) ) ( not ( = ?auto_182683 ?auto_182684 ) ) ( not ( = ?auto_182683 ?auto_182685 ) ) ( not ( = ?auto_182683 ?auto_182686 ) ) ( not ( = ?auto_182683 ?auto_182687 ) ) ( not ( = ?auto_182683 ?auto_182688 ) ) ( not ( = ?auto_182683 ?auto_182689 ) ) ( not ( = ?auto_182683 ?auto_182690 ) ) ( not ( = ?auto_182683 ?auto_182691 ) ) ( not ( = ?auto_182684 ?auto_182685 ) ) ( not ( = ?auto_182684 ?auto_182686 ) ) ( not ( = ?auto_182684 ?auto_182687 ) ) ( not ( = ?auto_182684 ?auto_182688 ) ) ( not ( = ?auto_182684 ?auto_182689 ) ) ( not ( = ?auto_182684 ?auto_182690 ) ) ( not ( = ?auto_182684 ?auto_182691 ) ) ( not ( = ?auto_182685 ?auto_182686 ) ) ( not ( = ?auto_182685 ?auto_182687 ) ) ( not ( = ?auto_182685 ?auto_182688 ) ) ( not ( = ?auto_182685 ?auto_182689 ) ) ( not ( = ?auto_182685 ?auto_182690 ) ) ( not ( = ?auto_182685 ?auto_182691 ) ) ( not ( = ?auto_182686 ?auto_182687 ) ) ( not ( = ?auto_182686 ?auto_182688 ) ) ( not ( = ?auto_182686 ?auto_182689 ) ) ( not ( = ?auto_182686 ?auto_182690 ) ) ( not ( = ?auto_182686 ?auto_182691 ) ) ( not ( = ?auto_182687 ?auto_182688 ) ) ( not ( = ?auto_182687 ?auto_182689 ) ) ( not ( = ?auto_182687 ?auto_182690 ) ) ( not ( = ?auto_182687 ?auto_182691 ) ) ( not ( = ?auto_182688 ?auto_182689 ) ) ( not ( = ?auto_182688 ?auto_182690 ) ) ( not ( = ?auto_182688 ?auto_182691 ) ) ( not ( = ?auto_182689 ?auto_182690 ) ) ( not ( = ?auto_182689 ?auto_182691 ) ) ( not ( = ?auto_182690 ?auto_182691 ) ) ( ON ?auto_182689 ?auto_182690 ) ( ON ?auto_182688 ?auto_182689 ) ( ON ?auto_182687 ?auto_182688 ) ( ON ?auto_182686 ?auto_182687 ) ( ON ?auto_182685 ?auto_182686 ) ( ON ?auto_182684 ?auto_182685 ) ( ON ?auto_182683 ?auto_182684 ) ( ON ?auto_182682 ?auto_182683 ) ( ON ?auto_182681 ?auto_182682 ) ( ON ?auto_182680 ?auto_182681 ) ( CLEAR ?auto_182680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182680 )
      ( MAKE-11PILE ?auto_182680 ?auto_182681 ?auto_182682 ?auto_182683 ?auto_182684 ?auto_182685 ?auto_182686 ?auto_182687 ?auto_182688 ?auto_182689 ?auto_182690 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_182703 - BLOCK
      ?auto_182704 - BLOCK
      ?auto_182705 - BLOCK
      ?auto_182706 - BLOCK
      ?auto_182707 - BLOCK
      ?auto_182708 - BLOCK
      ?auto_182709 - BLOCK
      ?auto_182710 - BLOCK
      ?auto_182711 - BLOCK
      ?auto_182712 - BLOCK
      ?auto_182713 - BLOCK
    )
    :vars
    (
      ?auto_182714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182713 ?auto_182714 ) ( not ( = ?auto_182703 ?auto_182704 ) ) ( not ( = ?auto_182703 ?auto_182705 ) ) ( not ( = ?auto_182703 ?auto_182706 ) ) ( not ( = ?auto_182703 ?auto_182707 ) ) ( not ( = ?auto_182703 ?auto_182708 ) ) ( not ( = ?auto_182703 ?auto_182709 ) ) ( not ( = ?auto_182703 ?auto_182710 ) ) ( not ( = ?auto_182703 ?auto_182711 ) ) ( not ( = ?auto_182703 ?auto_182712 ) ) ( not ( = ?auto_182703 ?auto_182713 ) ) ( not ( = ?auto_182703 ?auto_182714 ) ) ( not ( = ?auto_182704 ?auto_182705 ) ) ( not ( = ?auto_182704 ?auto_182706 ) ) ( not ( = ?auto_182704 ?auto_182707 ) ) ( not ( = ?auto_182704 ?auto_182708 ) ) ( not ( = ?auto_182704 ?auto_182709 ) ) ( not ( = ?auto_182704 ?auto_182710 ) ) ( not ( = ?auto_182704 ?auto_182711 ) ) ( not ( = ?auto_182704 ?auto_182712 ) ) ( not ( = ?auto_182704 ?auto_182713 ) ) ( not ( = ?auto_182704 ?auto_182714 ) ) ( not ( = ?auto_182705 ?auto_182706 ) ) ( not ( = ?auto_182705 ?auto_182707 ) ) ( not ( = ?auto_182705 ?auto_182708 ) ) ( not ( = ?auto_182705 ?auto_182709 ) ) ( not ( = ?auto_182705 ?auto_182710 ) ) ( not ( = ?auto_182705 ?auto_182711 ) ) ( not ( = ?auto_182705 ?auto_182712 ) ) ( not ( = ?auto_182705 ?auto_182713 ) ) ( not ( = ?auto_182705 ?auto_182714 ) ) ( not ( = ?auto_182706 ?auto_182707 ) ) ( not ( = ?auto_182706 ?auto_182708 ) ) ( not ( = ?auto_182706 ?auto_182709 ) ) ( not ( = ?auto_182706 ?auto_182710 ) ) ( not ( = ?auto_182706 ?auto_182711 ) ) ( not ( = ?auto_182706 ?auto_182712 ) ) ( not ( = ?auto_182706 ?auto_182713 ) ) ( not ( = ?auto_182706 ?auto_182714 ) ) ( not ( = ?auto_182707 ?auto_182708 ) ) ( not ( = ?auto_182707 ?auto_182709 ) ) ( not ( = ?auto_182707 ?auto_182710 ) ) ( not ( = ?auto_182707 ?auto_182711 ) ) ( not ( = ?auto_182707 ?auto_182712 ) ) ( not ( = ?auto_182707 ?auto_182713 ) ) ( not ( = ?auto_182707 ?auto_182714 ) ) ( not ( = ?auto_182708 ?auto_182709 ) ) ( not ( = ?auto_182708 ?auto_182710 ) ) ( not ( = ?auto_182708 ?auto_182711 ) ) ( not ( = ?auto_182708 ?auto_182712 ) ) ( not ( = ?auto_182708 ?auto_182713 ) ) ( not ( = ?auto_182708 ?auto_182714 ) ) ( not ( = ?auto_182709 ?auto_182710 ) ) ( not ( = ?auto_182709 ?auto_182711 ) ) ( not ( = ?auto_182709 ?auto_182712 ) ) ( not ( = ?auto_182709 ?auto_182713 ) ) ( not ( = ?auto_182709 ?auto_182714 ) ) ( not ( = ?auto_182710 ?auto_182711 ) ) ( not ( = ?auto_182710 ?auto_182712 ) ) ( not ( = ?auto_182710 ?auto_182713 ) ) ( not ( = ?auto_182710 ?auto_182714 ) ) ( not ( = ?auto_182711 ?auto_182712 ) ) ( not ( = ?auto_182711 ?auto_182713 ) ) ( not ( = ?auto_182711 ?auto_182714 ) ) ( not ( = ?auto_182712 ?auto_182713 ) ) ( not ( = ?auto_182712 ?auto_182714 ) ) ( not ( = ?auto_182713 ?auto_182714 ) ) ( ON ?auto_182712 ?auto_182713 ) ( ON ?auto_182711 ?auto_182712 ) ( ON ?auto_182710 ?auto_182711 ) ( ON ?auto_182709 ?auto_182710 ) ( ON ?auto_182708 ?auto_182709 ) ( ON ?auto_182707 ?auto_182708 ) ( ON ?auto_182706 ?auto_182707 ) ( ON ?auto_182705 ?auto_182706 ) ( ON ?auto_182704 ?auto_182705 ) ( ON ?auto_182703 ?auto_182704 ) ( CLEAR ?auto_182703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_182703 )
      ( MAKE-11PILE ?auto_182703 ?auto_182704 ?auto_182705 ?auto_182706 ?auto_182707 ?auto_182708 ?auto_182709 ?auto_182710 ?auto_182711 ?auto_182712 ?auto_182713 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_182727 - BLOCK
      ?auto_182728 - BLOCK
      ?auto_182729 - BLOCK
      ?auto_182730 - BLOCK
      ?auto_182731 - BLOCK
      ?auto_182732 - BLOCK
      ?auto_182733 - BLOCK
      ?auto_182734 - BLOCK
      ?auto_182735 - BLOCK
      ?auto_182736 - BLOCK
      ?auto_182737 - BLOCK
      ?auto_182738 - BLOCK
    )
    :vars
    (
      ?auto_182739 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_182737 ) ( ON ?auto_182738 ?auto_182739 ) ( CLEAR ?auto_182738 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182727 ) ( ON ?auto_182728 ?auto_182727 ) ( ON ?auto_182729 ?auto_182728 ) ( ON ?auto_182730 ?auto_182729 ) ( ON ?auto_182731 ?auto_182730 ) ( ON ?auto_182732 ?auto_182731 ) ( ON ?auto_182733 ?auto_182732 ) ( ON ?auto_182734 ?auto_182733 ) ( ON ?auto_182735 ?auto_182734 ) ( ON ?auto_182736 ?auto_182735 ) ( ON ?auto_182737 ?auto_182736 ) ( not ( = ?auto_182727 ?auto_182728 ) ) ( not ( = ?auto_182727 ?auto_182729 ) ) ( not ( = ?auto_182727 ?auto_182730 ) ) ( not ( = ?auto_182727 ?auto_182731 ) ) ( not ( = ?auto_182727 ?auto_182732 ) ) ( not ( = ?auto_182727 ?auto_182733 ) ) ( not ( = ?auto_182727 ?auto_182734 ) ) ( not ( = ?auto_182727 ?auto_182735 ) ) ( not ( = ?auto_182727 ?auto_182736 ) ) ( not ( = ?auto_182727 ?auto_182737 ) ) ( not ( = ?auto_182727 ?auto_182738 ) ) ( not ( = ?auto_182727 ?auto_182739 ) ) ( not ( = ?auto_182728 ?auto_182729 ) ) ( not ( = ?auto_182728 ?auto_182730 ) ) ( not ( = ?auto_182728 ?auto_182731 ) ) ( not ( = ?auto_182728 ?auto_182732 ) ) ( not ( = ?auto_182728 ?auto_182733 ) ) ( not ( = ?auto_182728 ?auto_182734 ) ) ( not ( = ?auto_182728 ?auto_182735 ) ) ( not ( = ?auto_182728 ?auto_182736 ) ) ( not ( = ?auto_182728 ?auto_182737 ) ) ( not ( = ?auto_182728 ?auto_182738 ) ) ( not ( = ?auto_182728 ?auto_182739 ) ) ( not ( = ?auto_182729 ?auto_182730 ) ) ( not ( = ?auto_182729 ?auto_182731 ) ) ( not ( = ?auto_182729 ?auto_182732 ) ) ( not ( = ?auto_182729 ?auto_182733 ) ) ( not ( = ?auto_182729 ?auto_182734 ) ) ( not ( = ?auto_182729 ?auto_182735 ) ) ( not ( = ?auto_182729 ?auto_182736 ) ) ( not ( = ?auto_182729 ?auto_182737 ) ) ( not ( = ?auto_182729 ?auto_182738 ) ) ( not ( = ?auto_182729 ?auto_182739 ) ) ( not ( = ?auto_182730 ?auto_182731 ) ) ( not ( = ?auto_182730 ?auto_182732 ) ) ( not ( = ?auto_182730 ?auto_182733 ) ) ( not ( = ?auto_182730 ?auto_182734 ) ) ( not ( = ?auto_182730 ?auto_182735 ) ) ( not ( = ?auto_182730 ?auto_182736 ) ) ( not ( = ?auto_182730 ?auto_182737 ) ) ( not ( = ?auto_182730 ?auto_182738 ) ) ( not ( = ?auto_182730 ?auto_182739 ) ) ( not ( = ?auto_182731 ?auto_182732 ) ) ( not ( = ?auto_182731 ?auto_182733 ) ) ( not ( = ?auto_182731 ?auto_182734 ) ) ( not ( = ?auto_182731 ?auto_182735 ) ) ( not ( = ?auto_182731 ?auto_182736 ) ) ( not ( = ?auto_182731 ?auto_182737 ) ) ( not ( = ?auto_182731 ?auto_182738 ) ) ( not ( = ?auto_182731 ?auto_182739 ) ) ( not ( = ?auto_182732 ?auto_182733 ) ) ( not ( = ?auto_182732 ?auto_182734 ) ) ( not ( = ?auto_182732 ?auto_182735 ) ) ( not ( = ?auto_182732 ?auto_182736 ) ) ( not ( = ?auto_182732 ?auto_182737 ) ) ( not ( = ?auto_182732 ?auto_182738 ) ) ( not ( = ?auto_182732 ?auto_182739 ) ) ( not ( = ?auto_182733 ?auto_182734 ) ) ( not ( = ?auto_182733 ?auto_182735 ) ) ( not ( = ?auto_182733 ?auto_182736 ) ) ( not ( = ?auto_182733 ?auto_182737 ) ) ( not ( = ?auto_182733 ?auto_182738 ) ) ( not ( = ?auto_182733 ?auto_182739 ) ) ( not ( = ?auto_182734 ?auto_182735 ) ) ( not ( = ?auto_182734 ?auto_182736 ) ) ( not ( = ?auto_182734 ?auto_182737 ) ) ( not ( = ?auto_182734 ?auto_182738 ) ) ( not ( = ?auto_182734 ?auto_182739 ) ) ( not ( = ?auto_182735 ?auto_182736 ) ) ( not ( = ?auto_182735 ?auto_182737 ) ) ( not ( = ?auto_182735 ?auto_182738 ) ) ( not ( = ?auto_182735 ?auto_182739 ) ) ( not ( = ?auto_182736 ?auto_182737 ) ) ( not ( = ?auto_182736 ?auto_182738 ) ) ( not ( = ?auto_182736 ?auto_182739 ) ) ( not ( = ?auto_182737 ?auto_182738 ) ) ( not ( = ?auto_182737 ?auto_182739 ) ) ( not ( = ?auto_182738 ?auto_182739 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_182738 ?auto_182739 )
      ( !STACK ?auto_182738 ?auto_182737 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_182752 - BLOCK
      ?auto_182753 - BLOCK
      ?auto_182754 - BLOCK
      ?auto_182755 - BLOCK
      ?auto_182756 - BLOCK
      ?auto_182757 - BLOCK
      ?auto_182758 - BLOCK
      ?auto_182759 - BLOCK
      ?auto_182760 - BLOCK
      ?auto_182761 - BLOCK
      ?auto_182762 - BLOCK
      ?auto_182763 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_182762 ) ( ON-TABLE ?auto_182763 ) ( CLEAR ?auto_182763 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_182752 ) ( ON ?auto_182753 ?auto_182752 ) ( ON ?auto_182754 ?auto_182753 ) ( ON ?auto_182755 ?auto_182754 ) ( ON ?auto_182756 ?auto_182755 ) ( ON ?auto_182757 ?auto_182756 ) ( ON ?auto_182758 ?auto_182757 ) ( ON ?auto_182759 ?auto_182758 ) ( ON ?auto_182760 ?auto_182759 ) ( ON ?auto_182761 ?auto_182760 ) ( ON ?auto_182762 ?auto_182761 ) ( not ( = ?auto_182752 ?auto_182753 ) ) ( not ( = ?auto_182752 ?auto_182754 ) ) ( not ( = ?auto_182752 ?auto_182755 ) ) ( not ( = ?auto_182752 ?auto_182756 ) ) ( not ( = ?auto_182752 ?auto_182757 ) ) ( not ( = ?auto_182752 ?auto_182758 ) ) ( not ( = ?auto_182752 ?auto_182759 ) ) ( not ( = ?auto_182752 ?auto_182760 ) ) ( not ( = ?auto_182752 ?auto_182761 ) ) ( not ( = ?auto_182752 ?auto_182762 ) ) ( not ( = ?auto_182752 ?auto_182763 ) ) ( not ( = ?auto_182753 ?auto_182754 ) ) ( not ( = ?auto_182753 ?auto_182755 ) ) ( not ( = ?auto_182753 ?auto_182756 ) ) ( not ( = ?auto_182753 ?auto_182757 ) ) ( not ( = ?auto_182753 ?auto_182758 ) ) ( not ( = ?auto_182753 ?auto_182759 ) ) ( not ( = ?auto_182753 ?auto_182760 ) ) ( not ( = ?auto_182753 ?auto_182761 ) ) ( not ( = ?auto_182753 ?auto_182762 ) ) ( not ( = ?auto_182753 ?auto_182763 ) ) ( not ( = ?auto_182754 ?auto_182755 ) ) ( not ( = ?auto_182754 ?auto_182756 ) ) ( not ( = ?auto_182754 ?auto_182757 ) ) ( not ( = ?auto_182754 ?auto_182758 ) ) ( not ( = ?auto_182754 ?auto_182759 ) ) ( not ( = ?auto_182754 ?auto_182760 ) ) ( not ( = ?auto_182754 ?auto_182761 ) ) ( not ( = ?auto_182754 ?auto_182762 ) ) ( not ( = ?auto_182754 ?auto_182763 ) ) ( not ( = ?auto_182755 ?auto_182756 ) ) ( not ( = ?auto_182755 ?auto_182757 ) ) ( not ( = ?auto_182755 ?auto_182758 ) ) ( not ( = ?auto_182755 ?auto_182759 ) ) ( not ( = ?auto_182755 ?auto_182760 ) ) ( not ( = ?auto_182755 ?auto_182761 ) ) ( not ( = ?auto_182755 ?auto_182762 ) ) ( not ( = ?auto_182755 ?auto_182763 ) ) ( not ( = ?auto_182756 ?auto_182757 ) ) ( not ( = ?auto_182756 ?auto_182758 ) ) ( not ( = ?auto_182756 ?auto_182759 ) ) ( not ( = ?auto_182756 ?auto_182760 ) ) ( not ( = ?auto_182756 ?auto_182761 ) ) ( not ( = ?auto_182756 ?auto_182762 ) ) ( not ( = ?auto_182756 ?auto_182763 ) ) ( not ( = ?auto_182757 ?auto_182758 ) ) ( not ( = ?auto_182757 ?auto_182759 ) ) ( not ( = ?auto_182757 ?auto_182760 ) ) ( not ( = ?auto_182757 ?auto_182761 ) ) ( not ( = ?auto_182757 ?auto_182762 ) ) ( not ( = ?auto_182757 ?auto_182763 ) ) ( not ( = ?auto_182758 ?auto_182759 ) ) ( not ( = ?auto_182758 ?auto_182760 ) ) ( not ( = ?auto_182758 ?auto_182761 ) ) ( not ( = ?auto_182758 ?auto_182762 ) ) ( not ( = ?auto_182758 ?auto_182763 ) ) ( not ( = ?auto_182759 ?auto_182760 ) ) ( not ( = ?auto_182759 ?auto_182761 ) ) ( not ( = ?auto_182759 ?auto_182762 ) ) ( not ( = ?auto_182759 ?auto_182763 ) ) ( not ( = ?auto_182760 ?auto_182761 ) ) ( not ( = ?auto_182760 ?auto_182762 ) ) ( not ( = ?auto_182760 ?auto_182763 ) ) ( not ( = ?auto_182761 ?auto_182762 ) ) ( not ( = ?auto_182761 ?auto_182763 ) ) ( not ( = ?auto_182762 ?auto_182763 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_182763 )
      ( !STACK ?auto_182763 ?auto_182762 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_182776 - BLOCK
      ?auto_182777 - BLOCK
      ?auto_182778 - BLOCK
      ?auto_182779 - BLOCK
      ?auto_182780 - BLOCK
      ?auto_182781 - BLOCK
      ?auto_182782 - BLOCK
      ?auto_182783 - BLOCK
      ?auto_182784 - BLOCK
      ?auto_182785 - BLOCK
      ?auto_182786 - BLOCK
      ?auto_182787 - BLOCK
    )
    :vars
    (
      ?auto_182788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182787 ?auto_182788 ) ( ON-TABLE ?auto_182776 ) ( ON ?auto_182777 ?auto_182776 ) ( ON ?auto_182778 ?auto_182777 ) ( ON ?auto_182779 ?auto_182778 ) ( ON ?auto_182780 ?auto_182779 ) ( ON ?auto_182781 ?auto_182780 ) ( ON ?auto_182782 ?auto_182781 ) ( ON ?auto_182783 ?auto_182782 ) ( ON ?auto_182784 ?auto_182783 ) ( ON ?auto_182785 ?auto_182784 ) ( not ( = ?auto_182776 ?auto_182777 ) ) ( not ( = ?auto_182776 ?auto_182778 ) ) ( not ( = ?auto_182776 ?auto_182779 ) ) ( not ( = ?auto_182776 ?auto_182780 ) ) ( not ( = ?auto_182776 ?auto_182781 ) ) ( not ( = ?auto_182776 ?auto_182782 ) ) ( not ( = ?auto_182776 ?auto_182783 ) ) ( not ( = ?auto_182776 ?auto_182784 ) ) ( not ( = ?auto_182776 ?auto_182785 ) ) ( not ( = ?auto_182776 ?auto_182786 ) ) ( not ( = ?auto_182776 ?auto_182787 ) ) ( not ( = ?auto_182776 ?auto_182788 ) ) ( not ( = ?auto_182777 ?auto_182778 ) ) ( not ( = ?auto_182777 ?auto_182779 ) ) ( not ( = ?auto_182777 ?auto_182780 ) ) ( not ( = ?auto_182777 ?auto_182781 ) ) ( not ( = ?auto_182777 ?auto_182782 ) ) ( not ( = ?auto_182777 ?auto_182783 ) ) ( not ( = ?auto_182777 ?auto_182784 ) ) ( not ( = ?auto_182777 ?auto_182785 ) ) ( not ( = ?auto_182777 ?auto_182786 ) ) ( not ( = ?auto_182777 ?auto_182787 ) ) ( not ( = ?auto_182777 ?auto_182788 ) ) ( not ( = ?auto_182778 ?auto_182779 ) ) ( not ( = ?auto_182778 ?auto_182780 ) ) ( not ( = ?auto_182778 ?auto_182781 ) ) ( not ( = ?auto_182778 ?auto_182782 ) ) ( not ( = ?auto_182778 ?auto_182783 ) ) ( not ( = ?auto_182778 ?auto_182784 ) ) ( not ( = ?auto_182778 ?auto_182785 ) ) ( not ( = ?auto_182778 ?auto_182786 ) ) ( not ( = ?auto_182778 ?auto_182787 ) ) ( not ( = ?auto_182778 ?auto_182788 ) ) ( not ( = ?auto_182779 ?auto_182780 ) ) ( not ( = ?auto_182779 ?auto_182781 ) ) ( not ( = ?auto_182779 ?auto_182782 ) ) ( not ( = ?auto_182779 ?auto_182783 ) ) ( not ( = ?auto_182779 ?auto_182784 ) ) ( not ( = ?auto_182779 ?auto_182785 ) ) ( not ( = ?auto_182779 ?auto_182786 ) ) ( not ( = ?auto_182779 ?auto_182787 ) ) ( not ( = ?auto_182779 ?auto_182788 ) ) ( not ( = ?auto_182780 ?auto_182781 ) ) ( not ( = ?auto_182780 ?auto_182782 ) ) ( not ( = ?auto_182780 ?auto_182783 ) ) ( not ( = ?auto_182780 ?auto_182784 ) ) ( not ( = ?auto_182780 ?auto_182785 ) ) ( not ( = ?auto_182780 ?auto_182786 ) ) ( not ( = ?auto_182780 ?auto_182787 ) ) ( not ( = ?auto_182780 ?auto_182788 ) ) ( not ( = ?auto_182781 ?auto_182782 ) ) ( not ( = ?auto_182781 ?auto_182783 ) ) ( not ( = ?auto_182781 ?auto_182784 ) ) ( not ( = ?auto_182781 ?auto_182785 ) ) ( not ( = ?auto_182781 ?auto_182786 ) ) ( not ( = ?auto_182781 ?auto_182787 ) ) ( not ( = ?auto_182781 ?auto_182788 ) ) ( not ( = ?auto_182782 ?auto_182783 ) ) ( not ( = ?auto_182782 ?auto_182784 ) ) ( not ( = ?auto_182782 ?auto_182785 ) ) ( not ( = ?auto_182782 ?auto_182786 ) ) ( not ( = ?auto_182782 ?auto_182787 ) ) ( not ( = ?auto_182782 ?auto_182788 ) ) ( not ( = ?auto_182783 ?auto_182784 ) ) ( not ( = ?auto_182783 ?auto_182785 ) ) ( not ( = ?auto_182783 ?auto_182786 ) ) ( not ( = ?auto_182783 ?auto_182787 ) ) ( not ( = ?auto_182783 ?auto_182788 ) ) ( not ( = ?auto_182784 ?auto_182785 ) ) ( not ( = ?auto_182784 ?auto_182786 ) ) ( not ( = ?auto_182784 ?auto_182787 ) ) ( not ( = ?auto_182784 ?auto_182788 ) ) ( not ( = ?auto_182785 ?auto_182786 ) ) ( not ( = ?auto_182785 ?auto_182787 ) ) ( not ( = ?auto_182785 ?auto_182788 ) ) ( not ( = ?auto_182786 ?auto_182787 ) ) ( not ( = ?auto_182786 ?auto_182788 ) ) ( not ( = ?auto_182787 ?auto_182788 ) ) ( CLEAR ?auto_182785 ) ( ON ?auto_182786 ?auto_182787 ) ( CLEAR ?auto_182786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_182776 ?auto_182777 ?auto_182778 ?auto_182779 ?auto_182780 ?auto_182781 ?auto_182782 ?auto_182783 ?auto_182784 ?auto_182785 ?auto_182786 )
      ( MAKE-12PILE ?auto_182776 ?auto_182777 ?auto_182778 ?auto_182779 ?auto_182780 ?auto_182781 ?auto_182782 ?auto_182783 ?auto_182784 ?auto_182785 ?auto_182786 ?auto_182787 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_182801 - BLOCK
      ?auto_182802 - BLOCK
      ?auto_182803 - BLOCK
      ?auto_182804 - BLOCK
      ?auto_182805 - BLOCK
      ?auto_182806 - BLOCK
      ?auto_182807 - BLOCK
      ?auto_182808 - BLOCK
      ?auto_182809 - BLOCK
      ?auto_182810 - BLOCK
      ?auto_182811 - BLOCK
      ?auto_182812 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182812 ) ( ON-TABLE ?auto_182801 ) ( ON ?auto_182802 ?auto_182801 ) ( ON ?auto_182803 ?auto_182802 ) ( ON ?auto_182804 ?auto_182803 ) ( ON ?auto_182805 ?auto_182804 ) ( ON ?auto_182806 ?auto_182805 ) ( ON ?auto_182807 ?auto_182806 ) ( ON ?auto_182808 ?auto_182807 ) ( ON ?auto_182809 ?auto_182808 ) ( ON ?auto_182810 ?auto_182809 ) ( not ( = ?auto_182801 ?auto_182802 ) ) ( not ( = ?auto_182801 ?auto_182803 ) ) ( not ( = ?auto_182801 ?auto_182804 ) ) ( not ( = ?auto_182801 ?auto_182805 ) ) ( not ( = ?auto_182801 ?auto_182806 ) ) ( not ( = ?auto_182801 ?auto_182807 ) ) ( not ( = ?auto_182801 ?auto_182808 ) ) ( not ( = ?auto_182801 ?auto_182809 ) ) ( not ( = ?auto_182801 ?auto_182810 ) ) ( not ( = ?auto_182801 ?auto_182811 ) ) ( not ( = ?auto_182801 ?auto_182812 ) ) ( not ( = ?auto_182802 ?auto_182803 ) ) ( not ( = ?auto_182802 ?auto_182804 ) ) ( not ( = ?auto_182802 ?auto_182805 ) ) ( not ( = ?auto_182802 ?auto_182806 ) ) ( not ( = ?auto_182802 ?auto_182807 ) ) ( not ( = ?auto_182802 ?auto_182808 ) ) ( not ( = ?auto_182802 ?auto_182809 ) ) ( not ( = ?auto_182802 ?auto_182810 ) ) ( not ( = ?auto_182802 ?auto_182811 ) ) ( not ( = ?auto_182802 ?auto_182812 ) ) ( not ( = ?auto_182803 ?auto_182804 ) ) ( not ( = ?auto_182803 ?auto_182805 ) ) ( not ( = ?auto_182803 ?auto_182806 ) ) ( not ( = ?auto_182803 ?auto_182807 ) ) ( not ( = ?auto_182803 ?auto_182808 ) ) ( not ( = ?auto_182803 ?auto_182809 ) ) ( not ( = ?auto_182803 ?auto_182810 ) ) ( not ( = ?auto_182803 ?auto_182811 ) ) ( not ( = ?auto_182803 ?auto_182812 ) ) ( not ( = ?auto_182804 ?auto_182805 ) ) ( not ( = ?auto_182804 ?auto_182806 ) ) ( not ( = ?auto_182804 ?auto_182807 ) ) ( not ( = ?auto_182804 ?auto_182808 ) ) ( not ( = ?auto_182804 ?auto_182809 ) ) ( not ( = ?auto_182804 ?auto_182810 ) ) ( not ( = ?auto_182804 ?auto_182811 ) ) ( not ( = ?auto_182804 ?auto_182812 ) ) ( not ( = ?auto_182805 ?auto_182806 ) ) ( not ( = ?auto_182805 ?auto_182807 ) ) ( not ( = ?auto_182805 ?auto_182808 ) ) ( not ( = ?auto_182805 ?auto_182809 ) ) ( not ( = ?auto_182805 ?auto_182810 ) ) ( not ( = ?auto_182805 ?auto_182811 ) ) ( not ( = ?auto_182805 ?auto_182812 ) ) ( not ( = ?auto_182806 ?auto_182807 ) ) ( not ( = ?auto_182806 ?auto_182808 ) ) ( not ( = ?auto_182806 ?auto_182809 ) ) ( not ( = ?auto_182806 ?auto_182810 ) ) ( not ( = ?auto_182806 ?auto_182811 ) ) ( not ( = ?auto_182806 ?auto_182812 ) ) ( not ( = ?auto_182807 ?auto_182808 ) ) ( not ( = ?auto_182807 ?auto_182809 ) ) ( not ( = ?auto_182807 ?auto_182810 ) ) ( not ( = ?auto_182807 ?auto_182811 ) ) ( not ( = ?auto_182807 ?auto_182812 ) ) ( not ( = ?auto_182808 ?auto_182809 ) ) ( not ( = ?auto_182808 ?auto_182810 ) ) ( not ( = ?auto_182808 ?auto_182811 ) ) ( not ( = ?auto_182808 ?auto_182812 ) ) ( not ( = ?auto_182809 ?auto_182810 ) ) ( not ( = ?auto_182809 ?auto_182811 ) ) ( not ( = ?auto_182809 ?auto_182812 ) ) ( not ( = ?auto_182810 ?auto_182811 ) ) ( not ( = ?auto_182810 ?auto_182812 ) ) ( not ( = ?auto_182811 ?auto_182812 ) ) ( CLEAR ?auto_182810 ) ( ON ?auto_182811 ?auto_182812 ) ( CLEAR ?auto_182811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_182801 ?auto_182802 ?auto_182803 ?auto_182804 ?auto_182805 ?auto_182806 ?auto_182807 ?auto_182808 ?auto_182809 ?auto_182810 ?auto_182811 )
      ( MAKE-12PILE ?auto_182801 ?auto_182802 ?auto_182803 ?auto_182804 ?auto_182805 ?auto_182806 ?auto_182807 ?auto_182808 ?auto_182809 ?auto_182810 ?auto_182811 ?auto_182812 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_182825 - BLOCK
      ?auto_182826 - BLOCK
      ?auto_182827 - BLOCK
      ?auto_182828 - BLOCK
      ?auto_182829 - BLOCK
      ?auto_182830 - BLOCK
      ?auto_182831 - BLOCK
      ?auto_182832 - BLOCK
      ?auto_182833 - BLOCK
      ?auto_182834 - BLOCK
      ?auto_182835 - BLOCK
      ?auto_182836 - BLOCK
    )
    :vars
    (
      ?auto_182837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182836 ?auto_182837 ) ( ON-TABLE ?auto_182825 ) ( ON ?auto_182826 ?auto_182825 ) ( ON ?auto_182827 ?auto_182826 ) ( ON ?auto_182828 ?auto_182827 ) ( ON ?auto_182829 ?auto_182828 ) ( ON ?auto_182830 ?auto_182829 ) ( ON ?auto_182831 ?auto_182830 ) ( ON ?auto_182832 ?auto_182831 ) ( ON ?auto_182833 ?auto_182832 ) ( not ( = ?auto_182825 ?auto_182826 ) ) ( not ( = ?auto_182825 ?auto_182827 ) ) ( not ( = ?auto_182825 ?auto_182828 ) ) ( not ( = ?auto_182825 ?auto_182829 ) ) ( not ( = ?auto_182825 ?auto_182830 ) ) ( not ( = ?auto_182825 ?auto_182831 ) ) ( not ( = ?auto_182825 ?auto_182832 ) ) ( not ( = ?auto_182825 ?auto_182833 ) ) ( not ( = ?auto_182825 ?auto_182834 ) ) ( not ( = ?auto_182825 ?auto_182835 ) ) ( not ( = ?auto_182825 ?auto_182836 ) ) ( not ( = ?auto_182825 ?auto_182837 ) ) ( not ( = ?auto_182826 ?auto_182827 ) ) ( not ( = ?auto_182826 ?auto_182828 ) ) ( not ( = ?auto_182826 ?auto_182829 ) ) ( not ( = ?auto_182826 ?auto_182830 ) ) ( not ( = ?auto_182826 ?auto_182831 ) ) ( not ( = ?auto_182826 ?auto_182832 ) ) ( not ( = ?auto_182826 ?auto_182833 ) ) ( not ( = ?auto_182826 ?auto_182834 ) ) ( not ( = ?auto_182826 ?auto_182835 ) ) ( not ( = ?auto_182826 ?auto_182836 ) ) ( not ( = ?auto_182826 ?auto_182837 ) ) ( not ( = ?auto_182827 ?auto_182828 ) ) ( not ( = ?auto_182827 ?auto_182829 ) ) ( not ( = ?auto_182827 ?auto_182830 ) ) ( not ( = ?auto_182827 ?auto_182831 ) ) ( not ( = ?auto_182827 ?auto_182832 ) ) ( not ( = ?auto_182827 ?auto_182833 ) ) ( not ( = ?auto_182827 ?auto_182834 ) ) ( not ( = ?auto_182827 ?auto_182835 ) ) ( not ( = ?auto_182827 ?auto_182836 ) ) ( not ( = ?auto_182827 ?auto_182837 ) ) ( not ( = ?auto_182828 ?auto_182829 ) ) ( not ( = ?auto_182828 ?auto_182830 ) ) ( not ( = ?auto_182828 ?auto_182831 ) ) ( not ( = ?auto_182828 ?auto_182832 ) ) ( not ( = ?auto_182828 ?auto_182833 ) ) ( not ( = ?auto_182828 ?auto_182834 ) ) ( not ( = ?auto_182828 ?auto_182835 ) ) ( not ( = ?auto_182828 ?auto_182836 ) ) ( not ( = ?auto_182828 ?auto_182837 ) ) ( not ( = ?auto_182829 ?auto_182830 ) ) ( not ( = ?auto_182829 ?auto_182831 ) ) ( not ( = ?auto_182829 ?auto_182832 ) ) ( not ( = ?auto_182829 ?auto_182833 ) ) ( not ( = ?auto_182829 ?auto_182834 ) ) ( not ( = ?auto_182829 ?auto_182835 ) ) ( not ( = ?auto_182829 ?auto_182836 ) ) ( not ( = ?auto_182829 ?auto_182837 ) ) ( not ( = ?auto_182830 ?auto_182831 ) ) ( not ( = ?auto_182830 ?auto_182832 ) ) ( not ( = ?auto_182830 ?auto_182833 ) ) ( not ( = ?auto_182830 ?auto_182834 ) ) ( not ( = ?auto_182830 ?auto_182835 ) ) ( not ( = ?auto_182830 ?auto_182836 ) ) ( not ( = ?auto_182830 ?auto_182837 ) ) ( not ( = ?auto_182831 ?auto_182832 ) ) ( not ( = ?auto_182831 ?auto_182833 ) ) ( not ( = ?auto_182831 ?auto_182834 ) ) ( not ( = ?auto_182831 ?auto_182835 ) ) ( not ( = ?auto_182831 ?auto_182836 ) ) ( not ( = ?auto_182831 ?auto_182837 ) ) ( not ( = ?auto_182832 ?auto_182833 ) ) ( not ( = ?auto_182832 ?auto_182834 ) ) ( not ( = ?auto_182832 ?auto_182835 ) ) ( not ( = ?auto_182832 ?auto_182836 ) ) ( not ( = ?auto_182832 ?auto_182837 ) ) ( not ( = ?auto_182833 ?auto_182834 ) ) ( not ( = ?auto_182833 ?auto_182835 ) ) ( not ( = ?auto_182833 ?auto_182836 ) ) ( not ( = ?auto_182833 ?auto_182837 ) ) ( not ( = ?auto_182834 ?auto_182835 ) ) ( not ( = ?auto_182834 ?auto_182836 ) ) ( not ( = ?auto_182834 ?auto_182837 ) ) ( not ( = ?auto_182835 ?auto_182836 ) ) ( not ( = ?auto_182835 ?auto_182837 ) ) ( not ( = ?auto_182836 ?auto_182837 ) ) ( ON ?auto_182835 ?auto_182836 ) ( CLEAR ?auto_182833 ) ( ON ?auto_182834 ?auto_182835 ) ( CLEAR ?auto_182834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_182825 ?auto_182826 ?auto_182827 ?auto_182828 ?auto_182829 ?auto_182830 ?auto_182831 ?auto_182832 ?auto_182833 ?auto_182834 )
      ( MAKE-12PILE ?auto_182825 ?auto_182826 ?auto_182827 ?auto_182828 ?auto_182829 ?auto_182830 ?auto_182831 ?auto_182832 ?auto_182833 ?auto_182834 ?auto_182835 ?auto_182836 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_182850 - BLOCK
      ?auto_182851 - BLOCK
      ?auto_182852 - BLOCK
      ?auto_182853 - BLOCK
      ?auto_182854 - BLOCK
      ?auto_182855 - BLOCK
      ?auto_182856 - BLOCK
      ?auto_182857 - BLOCK
      ?auto_182858 - BLOCK
      ?auto_182859 - BLOCK
      ?auto_182860 - BLOCK
      ?auto_182861 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182861 ) ( ON-TABLE ?auto_182850 ) ( ON ?auto_182851 ?auto_182850 ) ( ON ?auto_182852 ?auto_182851 ) ( ON ?auto_182853 ?auto_182852 ) ( ON ?auto_182854 ?auto_182853 ) ( ON ?auto_182855 ?auto_182854 ) ( ON ?auto_182856 ?auto_182855 ) ( ON ?auto_182857 ?auto_182856 ) ( ON ?auto_182858 ?auto_182857 ) ( not ( = ?auto_182850 ?auto_182851 ) ) ( not ( = ?auto_182850 ?auto_182852 ) ) ( not ( = ?auto_182850 ?auto_182853 ) ) ( not ( = ?auto_182850 ?auto_182854 ) ) ( not ( = ?auto_182850 ?auto_182855 ) ) ( not ( = ?auto_182850 ?auto_182856 ) ) ( not ( = ?auto_182850 ?auto_182857 ) ) ( not ( = ?auto_182850 ?auto_182858 ) ) ( not ( = ?auto_182850 ?auto_182859 ) ) ( not ( = ?auto_182850 ?auto_182860 ) ) ( not ( = ?auto_182850 ?auto_182861 ) ) ( not ( = ?auto_182851 ?auto_182852 ) ) ( not ( = ?auto_182851 ?auto_182853 ) ) ( not ( = ?auto_182851 ?auto_182854 ) ) ( not ( = ?auto_182851 ?auto_182855 ) ) ( not ( = ?auto_182851 ?auto_182856 ) ) ( not ( = ?auto_182851 ?auto_182857 ) ) ( not ( = ?auto_182851 ?auto_182858 ) ) ( not ( = ?auto_182851 ?auto_182859 ) ) ( not ( = ?auto_182851 ?auto_182860 ) ) ( not ( = ?auto_182851 ?auto_182861 ) ) ( not ( = ?auto_182852 ?auto_182853 ) ) ( not ( = ?auto_182852 ?auto_182854 ) ) ( not ( = ?auto_182852 ?auto_182855 ) ) ( not ( = ?auto_182852 ?auto_182856 ) ) ( not ( = ?auto_182852 ?auto_182857 ) ) ( not ( = ?auto_182852 ?auto_182858 ) ) ( not ( = ?auto_182852 ?auto_182859 ) ) ( not ( = ?auto_182852 ?auto_182860 ) ) ( not ( = ?auto_182852 ?auto_182861 ) ) ( not ( = ?auto_182853 ?auto_182854 ) ) ( not ( = ?auto_182853 ?auto_182855 ) ) ( not ( = ?auto_182853 ?auto_182856 ) ) ( not ( = ?auto_182853 ?auto_182857 ) ) ( not ( = ?auto_182853 ?auto_182858 ) ) ( not ( = ?auto_182853 ?auto_182859 ) ) ( not ( = ?auto_182853 ?auto_182860 ) ) ( not ( = ?auto_182853 ?auto_182861 ) ) ( not ( = ?auto_182854 ?auto_182855 ) ) ( not ( = ?auto_182854 ?auto_182856 ) ) ( not ( = ?auto_182854 ?auto_182857 ) ) ( not ( = ?auto_182854 ?auto_182858 ) ) ( not ( = ?auto_182854 ?auto_182859 ) ) ( not ( = ?auto_182854 ?auto_182860 ) ) ( not ( = ?auto_182854 ?auto_182861 ) ) ( not ( = ?auto_182855 ?auto_182856 ) ) ( not ( = ?auto_182855 ?auto_182857 ) ) ( not ( = ?auto_182855 ?auto_182858 ) ) ( not ( = ?auto_182855 ?auto_182859 ) ) ( not ( = ?auto_182855 ?auto_182860 ) ) ( not ( = ?auto_182855 ?auto_182861 ) ) ( not ( = ?auto_182856 ?auto_182857 ) ) ( not ( = ?auto_182856 ?auto_182858 ) ) ( not ( = ?auto_182856 ?auto_182859 ) ) ( not ( = ?auto_182856 ?auto_182860 ) ) ( not ( = ?auto_182856 ?auto_182861 ) ) ( not ( = ?auto_182857 ?auto_182858 ) ) ( not ( = ?auto_182857 ?auto_182859 ) ) ( not ( = ?auto_182857 ?auto_182860 ) ) ( not ( = ?auto_182857 ?auto_182861 ) ) ( not ( = ?auto_182858 ?auto_182859 ) ) ( not ( = ?auto_182858 ?auto_182860 ) ) ( not ( = ?auto_182858 ?auto_182861 ) ) ( not ( = ?auto_182859 ?auto_182860 ) ) ( not ( = ?auto_182859 ?auto_182861 ) ) ( not ( = ?auto_182860 ?auto_182861 ) ) ( ON ?auto_182860 ?auto_182861 ) ( CLEAR ?auto_182858 ) ( ON ?auto_182859 ?auto_182860 ) ( CLEAR ?auto_182859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_182850 ?auto_182851 ?auto_182852 ?auto_182853 ?auto_182854 ?auto_182855 ?auto_182856 ?auto_182857 ?auto_182858 ?auto_182859 )
      ( MAKE-12PILE ?auto_182850 ?auto_182851 ?auto_182852 ?auto_182853 ?auto_182854 ?auto_182855 ?auto_182856 ?auto_182857 ?auto_182858 ?auto_182859 ?auto_182860 ?auto_182861 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_182874 - BLOCK
      ?auto_182875 - BLOCK
      ?auto_182876 - BLOCK
      ?auto_182877 - BLOCK
      ?auto_182878 - BLOCK
      ?auto_182879 - BLOCK
      ?auto_182880 - BLOCK
      ?auto_182881 - BLOCK
      ?auto_182882 - BLOCK
      ?auto_182883 - BLOCK
      ?auto_182884 - BLOCK
      ?auto_182885 - BLOCK
    )
    :vars
    (
      ?auto_182886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182885 ?auto_182886 ) ( ON-TABLE ?auto_182874 ) ( ON ?auto_182875 ?auto_182874 ) ( ON ?auto_182876 ?auto_182875 ) ( ON ?auto_182877 ?auto_182876 ) ( ON ?auto_182878 ?auto_182877 ) ( ON ?auto_182879 ?auto_182878 ) ( ON ?auto_182880 ?auto_182879 ) ( ON ?auto_182881 ?auto_182880 ) ( not ( = ?auto_182874 ?auto_182875 ) ) ( not ( = ?auto_182874 ?auto_182876 ) ) ( not ( = ?auto_182874 ?auto_182877 ) ) ( not ( = ?auto_182874 ?auto_182878 ) ) ( not ( = ?auto_182874 ?auto_182879 ) ) ( not ( = ?auto_182874 ?auto_182880 ) ) ( not ( = ?auto_182874 ?auto_182881 ) ) ( not ( = ?auto_182874 ?auto_182882 ) ) ( not ( = ?auto_182874 ?auto_182883 ) ) ( not ( = ?auto_182874 ?auto_182884 ) ) ( not ( = ?auto_182874 ?auto_182885 ) ) ( not ( = ?auto_182874 ?auto_182886 ) ) ( not ( = ?auto_182875 ?auto_182876 ) ) ( not ( = ?auto_182875 ?auto_182877 ) ) ( not ( = ?auto_182875 ?auto_182878 ) ) ( not ( = ?auto_182875 ?auto_182879 ) ) ( not ( = ?auto_182875 ?auto_182880 ) ) ( not ( = ?auto_182875 ?auto_182881 ) ) ( not ( = ?auto_182875 ?auto_182882 ) ) ( not ( = ?auto_182875 ?auto_182883 ) ) ( not ( = ?auto_182875 ?auto_182884 ) ) ( not ( = ?auto_182875 ?auto_182885 ) ) ( not ( = ?auto_182875 ?auto_182886 ) ) ( not ( = ?auto_182876 ?auto_182877 ) ) ( not ( = ?auto_182876 ?auto_182878 ) ) ( not ( = ?auto_182876 ?auto_182879 ) ) ( not ( = ?auto_182876 ?auto_182880 ) ) ( not ( = ?auto_182876 ?auto_182881 ) ) ( not ( = ?auto_182876 ?auto_182882 ) ) ( not ( = ?auto_182876 ?auto_182883 ) ) ( not ( = ?auto_182876 ?auto_182884 ) ) ( not ( = ?auto_182876 ?auto_182885 ) ) ( not ( = ?auto_182876 ?auto_182886 ) ) ( not ( = ?auto_182877 ?auto_182878 ) ) ( not ( = ?auto_182877 ?auto_182879 ) ) ( not ( = ?auto_182877 ?auto_182880 ) ) ( not ( = ?auto_182877 ?auto_182881 ) ) ( not ( = ?auto_182877 ?auto_182882 ) ) ( not ( = ?auto_182877 ?auto_182883 ) ) ( not ( = ?auto_182877 ?auto_182884 ) ) ( not ( = ?auto_182877 ?auto_182885 ) ) ( not ( = ?auto_182877 ?auto_182886 ) ) ( not ( = ?auto_182878 ?auto_182879 ) ) ( not ( = ?auto_182878 ?auto_182880 ) ) ( not ( = ?auto_182878 ?auto_182881 ) ) ( not ( = ?auto_182878 ?auto_182882 ) ) ( not ( = ?auto_182878 ?auto_182883 ) ) ( not ( = ?auto_182878 ?auto_182884 ) ) ( not ( = ?auto_182878 ?auto_182885 ) ) ( not ( = ?auto_182878 ?auto_182886 ) ) ( not ( = ?auto_182879 ?auto_182880 ) ) ( not ( = ?auto_182879 ?auto_182881 ) ) ( not ( = ?auto_182879 ?auto_182882 ) ) ( not ( = ?auto_182879 ?auto_182883 ) ) ( not ( = ?auto_182879 ?auto_182884 ) ) ( not ( = ?auto_182879 ?auto_182885 ) ) ( not ( = ?auto_182879 ?auto_182886 ) ) ( not ( = ?auto_182880 ?auto_182881 ) ) ( not ( = ?auto_182880 ?auto_182882 ) ) ( not ( = ?auto_182880 ?auto_182883 ) ) ( not ( = ?auto_182880 ?auto_182884 ) ) ( not ( = ?auto_182880 ?auto_182885 ) ) ( not ( = ?auto_182880 ?auto_182886 ) ) ( not ( = ?auto_182881 ?auto_182882 ) ) ( not ( = ?auto_182881 ?auto_182883 ) ) ( not ( = ?auto_182881 ?auto_182884 ) ) ( not ( = ?auto_182881 ?auto_182885 ) ) ( not ( = ?auto_182881 ?auto_182886 ) ) ( not ( = ?auto_182882 ?auto_182883 ) ) ( not ( = ?auto_182882 ?auto_182884 ) ) ( not ( = ?auto_182882 ?auto_182885 ) ) ( not ( = ?auto_182882 ?auto_182886 ) ) ( not ( = ?auto_182883 ?auto_182884 ) ) ( not ( = ?auto_182883 ?auto_182885 ) ) ( not ( = ?auto_182883 ?auto_182886 ) ) ( not ( = ?auto_182884 ?auto_182885 ) ) ( not ( = ?auto_182884 ?auto_182886 ) ) ( not ( = ?auto_182885 ?auto_182886 ) ) ( ON ?auto_182884 ?auto_182885 ) ( ON ?auto_182883 ?auto_182884 ) ( CLEAR ?auto_182881 ) ( ON ?auto_182882 ?auto_182883 ) ( CLEAR ?auto_182882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_182874 ?auto_182875 ?auto_182876 ?auto_182877 ?auto_182878 ?auto_182879 ?auto_182880 ?auto_182881 ?auto_182882 )
      ( MAKE-12PILE ?auto_182874 ?auto_182875 ?auto_182876 ?auto_182877 ?auto_182878 ?auto_182879 ?auto_182880 ?auto_182881 ?auto_182882 ?auto_182883 ?auto_182884 ?auto_182885 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_182899 - BLOCK
      ?auto_182900 - BLOCK
      ?auto_182901 - BLOCK
      ?auto_182902 - BLOCK
      ?auto_182903 - BLOCK
      ?auto_182904 - BLOCK
      ?auto_182905 - BLOCK
      ?auto_182906 - BLOCK
      ?auto_182907 - BLOCK
      ?auto_182908 - BLOCK
      ?auto_182909 - BLOCK
      ?auto_182910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182910 ) ( ON-TABLE ?auto_182899 ) ( ON ?auto_182900 ?auto_182899 ) ( ON ?auto_182901 ?auto_182900 ) ( ON ?auto_182902 ?auto_182901 ) ( ON ?auto_182903 ?auto_182902 ) ( ON ?auto_182904 ?auto_182903 ) ( ON ?auto_182905 ?auto_182904 ) ( ON ?auto_182906 ?auto_182905 ) ( not ( = ?auto_182899 ?auto_182900 ) ) ( not ( = ?auto_182899 ?auto_182901 ) ) ( not ( = ?auto_182899 ?auto_182902 ) ) ( not ( = ?auto_182899 ?auto_182903 ) ) ( not ( = ?auto_182899 ?auto_182904 ) ) ( not ( = ?auto_182899 ?auto_182905 ) ) ( not ( = ?auto_182899 ?auto_182906 ) ) ( not ( = ?auto_182899 ?auto_182907 ) ) ( not ( = ?auto_182899 ?auto_182908 ) ) ( not ( = ?auto_182899 ?auto_182909 ) ) ( not ( = ?auto_182899 ?auto_182910 ) ) ( not ( = ?auto_182900 ?auto_182901 ) ) ( not ( = ?auto_182900 ?auto_182902 ) ) ( not ( = ?auto_182900 ?auto_182903 ) ) ( not ( = ?auto_182900 ?auto_182904 ) ) ( not ( = ?auto_182900 ?auto_182905 ) ) ( not ( = ?auto_182900 ?auto_182906 ) ) ( not ( = ?auto_182900 ?auto_182907 ) ) ( not ( = ?auto_182900 ?auto_182908 ) ) ( not ( = ?auto_182900 ?auto_182909 ) ) ( not ( = ?auto_182900 ?auto_182910 ) ) ( not ( = ?auto_182901 ?auto_182902 ) ) ( not ( = ?auto_182901 ?auto_182903 ) ) ( not ( = ?auto_182901 ?auto_182904 ) ) ( not ( = ?auto_182901 ?auto_182905 ) ) ( not ( = ?auto_182901 ?auto_182906 ) ) ( not ( = ?auto_182901 ?auto_182907 ) ) ( not ( = ?auto_182901 ?auto_182908 ) ) ( not ( = ?auto_182901 ?auto_182909 ) ) ( not ( = ?auto_182901 ?auto_182910 ) ) ( not ( = ?auto_182902 ?auto_182903 ) ) ( not ( = ?auto_182902 ?auto_182904 ) ) ( not ( = ?auto_182902 ?auto_182905 ) ) ( not ( = ?auto_182902 ?auto_182906 ) ) ( not ( = ?auto_182902 ?auto_182907 ) ) ( not ( = ?auto_182902 ?auto_182908 ) ) ( not ( = ?auto_182902 ?auto_182909 ) ) ( not ( = ?auto_182902 ?auto_182910 ) ) ( not ( = ?auto_182903 ?auto_182904 ) ) ( not ( = ?auto_182903 ?auto_182905 ) ) ( not ( = ?auto_182903 ?auto_182906 ) ) ( not ( = ?auto_182903 ?auto_182907 ) ) ( not ( = ?auto_182903 ?auto_182908 ) ) ( not ( = ?auto_182903 ?auto_182909 ) ) ( not ( = ?auto_182903 ?auto_182910 ) ) ( not ( = ?auto_182904 ?auto_182905 ) ) ( not ( = ?auto_182904 ?auto_182906 ) ) ( not ( = ?auto_182904 ?auto_182907 ) ) ( not ( = ?auto_182904 ?auto_182908 ) ) ( not ( = ?auto_182904 ?auto_182909 ) ) ( not ( = ?auto_182904 ?auto_182910 ) ) ( not ( = ?auto_182905 ?auto_182906 ) ) ( not ( = ?auto_182905 ?auto_182907 ) ) ( not ( = ?auto_182905 ?auto_182908 ) ) ( not ( = ?auto_182905 ?auto_182909 ) ) ( not ( = ?auto_182905 ?auto_182910 ) ) ( not ( = ?auto_182906 ?auto_182907 ) ) ( not ( = ?auto_182906 ?auto_182908 ) ) ( not ( = ?auto_182906 ?auto_182909 ) ) ( not ( = ?auto_182906 ?auto_182910 ) ) ( not ( = ?auto_182907 ?auto_182908 ) ) ( not ( = ?auto_182907 ?auto_182909 ) ) ( not ( = ?auto_182907 ?auto_182910 ) ) ( not ( = ?auto_182908 ?auto_182909 ) ) ( not ( = ?auto_182908 ?auto_182910 ) ) ( not ( = ?auto_182909 ?auto_182910 ) ) ( ON ?auto_182909 ?auto_182910 ) ( ON ?auto_182908 ?auto_182909 ) ( CLEAR ?auto_182906 ) ( ON ?auto_182907 ?auto_182908 ) ( CLEAR ?auto_182907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_182899 ?auto_182900 ?auto_182901 ?auto_182902 ?auto_182903 ?auto_182904 ?auto_182905 ?auto_182906 ?auto_182907 )
      ( MAKE-12PILE ?auto_182899 ?auto_182900 ?auto_182901 ?auto_182902 ?auto_182903 ?auto_182904 ?auto_182905 ?auto_182906 ?auto_182907 ?auto_182908 ?auto_182909 ?auto_182910 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_182923 - BLOCK
      ?auto_182924 - BLOCK
      ?auto_182925 - BLOCK
      ?auto_182926 - BLOCK
      ?auto_182927 - BLOCK
      ?auto_182928 - BLOCK
      ?auto_182929 - BLOCK
      ?auto_182930 - BLOCK
      ?auto_182931 - BLOCK
      ?auto_182932 - BLOCK
      ?auto_182933 - BLOCK
      ?auto_182934 - BLOCK
    )
    :vars
    (
      ?auto_182935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182934 ?auto_182935 ) ( ON-TABLE ?auto_182923 ) ( ON ?auto_182924 ?auto_182923 ) ( ON ?auto_182925 ?auto_182924 ) ( ON ?auto_182926 ?auto_182925 ) ( ON ?auto_182927 ?auto_182926 ) ( ON ?auto_182928 ?auto_182927 ) ( ON ?auto_182929 ?auto_182928 ) ( not ( = ?auto_182923 ?auto_182924 ) ) ( not ( = ?auto_182923 ?auto_182925 ) ) ( not ( = ?auto_182923 ?auto_182926 ) ) ( not ( = ?auto_182923 ?auto_182927 ) ) ( not ( = ?auto_182923 ?auto_182928 ) ) ( not ( = ?auto_182923 ?auto_182929 ) ) ( not ( = ?auto_182923 ?auto_182930 ) ) ( not ( = ?auto_182923 ?auto_182931 ) ) ( not ( = ?auto_182923 ?auto_182932 ) ) ( not ( = ?auto_182923 ?auto_182933 ) ) ( not ( = ?auto_182923 ?auto_182934 ) ) ( not ( = ?auto_182923 ?auto_182935 ) ) ( not ( = ?auto_182924 ?auto_182925 ) ) ( not ( = ?auto_182924 ?auto_182926 ) ) ( not ( = ?auto_182924 ?auto_182927 ) ) ( not ( = ?auto_182924 ?auto_182928 ) ) ( not ( = ?auto_182924 ?auto_182929 ) ) ( not ( = ?auto_182924 ?auto_182930 ) ) ( not ( = ?auto_182924 ?auto_182931 ) ) ( not ( = ?auto_182924 ?auto_182932 ) ) ( not ( = ?auto_182924 ?auto_182933 ) ) ( not ( = ?auto_182924 ?auto_182934 ) ) ( not ( = ?auto_182924 ?auto_182935 ) ) ( not ( = ?auto_182925 ?auto_182926 ) ) ( not ( = ?auto_182925 ?auto_182927 ) ) ( not ( = ?auto_182925 ?auto_182928 ) ) ( not ( = ?auto_182925 ?auto_182929 ) ) ( not ( = ?auto_182925 ?auto_182930 ) ) ( not ( = ?auto_182925 ?auto_182931 ) ) ( not ( = ?auto_182925 ?auto_182932 ) ) ( not ( = ?auto_182925 ?auto_182933 ) ) ( not ( = ?auto_182925 ?auto_182934 ) ) ( not ( = ?auto_182925 ?auto_182935 ) ) ( not ( = ?auto_182926 ?auto_182927 ) ) ( not ( = ?auto_182926 ?auto_182928 ) ) ( not ( = ?auto_182926 ?auto_182929 ) ) ( not ( = ?auto_182926 ?auto_182930 ) ) ( not ( = ?auto_182926 ?auto_182931 ) ) ( not ( = ?auto_182926 ?auto_182932 ) ) ( not ( = ?auto_182926 ?auto_182933 ) ) ( not ( = ?auto_182926 ?auto_182934 ) ) ( not ( = ?auto_182926 ?auto_182935 ) ) ( not ( = ?auto_182927 ?auto_182928 ) ) ( not ( = ?auto_182927 ?auto_182929 ) ) ( not ( = ?auto_182927 ?auto_182930 ) ) ( not ( = ?auto_182927 ?auto_182931 ) ) ( not ( = ?auto_182927 ?auto_182932 ) ) ( not ( = ?auto_182927 ?auto_182933 ) ) ( not ( = ?auto_182927 ?auto_182934 ) ) ( not ( = ?auto_182927 ?auto_182935 ) ) ( not ( = ?auto_182928 ?auto_182929 ) ) ( not ( = ?auto_182928 ?auto_182930 ) ) ( not ( = ?auto_182928 ?auto_182931 ) ) ( not ( = ?auto_182928 ?auto_182932 ) ) ( not ( = ?auto_182928 ?auto_182933 ) ) ( not ( = ?auto_182928 ?auto_182934 ) ) ( not ( = ?auto_182928 ?auto_182935 ) ) ( not ( = ?auto_182929 ?auto_182930 ) ) ( not ( = ?auto_182929 ?auto_182931 ) ) ( not ( = ?auto_182929 ?auto_182932 ) ) ( not ( = ?auto_182929 ?auto_182933 ) ) ( not ( = ?auto_182929 ?auto_182934 ) ) ( not ( = ?auto_182929 ?auto_182935 ) ) ( not ( = ?auto_182930 ?auto_182931 ) ) ( not ( = ?auto_182930 ?auto_182932 ) ) ( not ( = ?auto_182930 ?auto_182933 ) ) ( not ( = ?auto_182930 ?auto_182934 ) ) ( not ( = ?auto_182930 ?auto_182935 ) ) ( not ( = ?auto_182931 ?auto_182932 ) ) ( not ( = ?auto_182931 ?auto_182933 ) ) ( not ( = ?auto_182931 ?auto_182934 ) ) ( not ( = ?auto_182931 ?auto_182935 ) ) ( not ( = ?auto_182932 ?auto_182933 ) ) ( not ( = ?auto_182932 ?auto_182934 ) ) ( not ( = ?auto_182932 ?auto_182935 ) ) ( not ( = ?auto_182933 ?auto_182934 ) ) ( not ( = ?auto_182933 ?auto_182935 ) ) ( not ( = ?auto_182934 ?auto_182935 ) ) ( ON ?auto_182933 ?auto_182934 ) ( ON ?auto_182932 ?auto_182933 ) ( ON ?auto_182931 ?auto_182932 ) ( CLEAR ?auto_182929 ) ( ON ?auto_182930 ?auto_182931 ) ( CLEAR ?auto_182930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_182923 ?auto_182924 ?auto_182925 ?auto_182926 ?auto_182927 ?auto_182928 ?auto_182929 ?auto_182930 )
      ( MAKE-12PILE ?auto_182923 ?auto_182924 ?auto_182925 ?auto_182926 ?auto_182927 ?auto_182928 ?auto_182929 ?auto_182930 ?auto_182931 ?auto_182932 ?auto_182933 ?auto_182934 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_182948 - BLOCK
      ?auto_182949 - BLOCK
      ?auto_182950 - BLOCK
      ?auto_182951 - BLOCK
      ?auto_182952 - BLOCK
      ?auto_182953 - BLOCK
      ?auto_182954 - BLOCK
      ?auto_182955 - BLOCK
      ?auto_182956 - BLOCK
      ?auto_182957 - BLOCK
      ?auto_182958 - BLOCK
      ?auto_182959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_182959 ) ( ON-TABLE ?auto_182948 ) ( ON ?auto_182949 ?auto_182948 ) ( ON ?auto_182950 ?auto_182949 ) ( ON ?auto_182951 ?auto_182950 ) ( ON ?auto_182952 ?auto_182951 ) ( ON ?auto_182953 ?auto_182952 ) ( ON ?auto_182954 ?auto_182953 ) ( not ( = ?auto_182948 ?auto_182949 ) ) ( not ( = ?auto_182948 ?auto_182950 ) ) ( not ( = ?auto_182948 ?auto_182951 ) ) ( not ( = ?auto_182948 ?auto_182952 ) ) ( not ( = ?auto_182948 ?auto_182953 ) ) ( not ( = ?auto_182948 ?auto_182954 ) ) ( not ( = ?auto_182948 ?auto_182955 ) ) ( not ( = ?auto_182948 ?auto_182956 ) ) ( not ( = ?auto_182948 ?auto_182957 ) ) ( not ( = ?auto_182948 ?auto_182958 ) ) ( not ( = ?auto_182948 ?auto_182959 ) ) ( not ( = ?auto_182949 ?auto_182950 ) ) ( not ( = ?auto_182949 ?auto_182951 ) ) ( not ( = ?auto_182949 ?auto_182952 ) ) ( not ( = ?auto_182949 ?auto_182953 ) ) ( not ( = ?auto_182949 ?auto_182954 ) ) ( not ( = ?auto_182949 ?auto_182955 ) ) ( not ( = ?auto_182949 ?auto_182956 ) ) ( not ( = ?auto_182949 ?auto_182957 ) ) ( not ( = ?auto_182949 ?auto_182958 ) ) ( not ( = ?auto_182949 ?auto_182959 ) ) ( not ( = ?auto_182950 ?auto_182951 ) ) ( not ( = ?auto_182950 ?auto_182952 ) ) ( not ( = ?auto_182950 ?auto_182953 ) ) ( not ( = ?auto_182950 ?auto_182954 ) ) ( not ( = ?auto_182950 ?auto_182955 ) ) ( not ( = ?auto_182950 ?auto_182956 ) ) ( not ( = ?auto_182950 ?auto_182957 ) ) ( not ( = ?auto_182950 ?auto_182958 ) ) ( not ( = ?auto_182950 ?auto_182959 ) ) ( not ( = ?auto_182951 ?auto_182952 ) ) ( not ( = ?auto_182951 ?auto_182953 ) ) ( not ( = ?auto_182951 ?auto_182954 ) ) ( not ( = ?auto_182951 ?auto_182955 ) ) ( not ( = ?auto_182951 ?auto_182956 ) ) ( not ( = ?auto_182951 ?auto_182957 ) ) ( not ( = ?auto_182951 ?auto_182958 ) ) ( not ( = ?auto_182951 ?auto_182959 ) ) ( not ( = ?auto_182952 ?auto_182953 ) ) ( not ( = ?auto_182952 ?auto_182954 ) ) ( not ( = ?auto_182952 ?auto_182955 ) ) ( not ( = ?auto_182952 ?auto_182956 ) ) ( not ( = ?auto_182952 ?auto_182957 ) ) ( not ( = ?auto_182952 ?auto_182958 ) ) ( not ( = ?auto_182952 ?auto_182959 ) ) ( not ( = ?auto_182953 ?auto_182954 ) ) ( not ( = ?auto_182953 ?auto_182955 ) ) ( not ( = ?auto_182953 ?auto_182956 ) ) ( not ( = ?auto_182953 ?auto_182957 ) ) ( not ( = ?auto_182953 ?auto_182958 ) ) ( not ( = ?auto_182953 ?auto_182959 ) ) ( not ( = ?auto_182954 ?auto_182955 ) ) ( not ( = ?auto_182954 ?auto_182956 ) ) ( not ( = ?auto_182954 ?auto_182957 ) ) ( not ( = ?auto_182954 ?auto_182958 ) ) ( not ( = ?auto_182954 ?auto_182959 ) ) ( not ( = ?auto_182955 ?auto_182956 ) ) ( not ( = ?auto_182955 ?auto_182957 ) ) ( not ( = ?auto_182955 ?auto_182958 ) ) ( not ( = ?auto_182955 ?auto_182959 ) ) ( not ( = ?auto_182956 ?auto_182957 ) ) ( not ( = ?auto_182956 ?auto_182958 ) ) ( not ( = ?auto_182956 ?auto_182959 ) ) ( not ( = ?auto_182957 ?auto_182958 ) ) ( not ( = ?auto_182957 ?auto_182959 ) ) ( not ( = ?auto_182958 ?auto_182959 ) ) ( ON ?auto_182958 ?auto_182959 ) ( ON ?auto_182957 ?auto_182958 ) ( ON ?auto_182956 ?auto_182957 ) ( CLEAR ?auto_182954 ) ( ON ?auto_182955 ?auto_182956 ) ( CLEAR ?auto_182955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_182948 ?auto_182949 ?auto_182950 ?auto_182951 ?auto_182952 ?auto_182953 ?auto_182954 ?auto_182955 )
      ( MAKE-12PILE ?auto_182948 ?auto_182949 ?auto_182950 ?auto_182951 ?auto_182952 ?auto_182953 ?auto_182954 ?auto_182955 ?auto_182956 ?auto_182957 ?auto_182958 ?auto_182959 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_182972 - BLOCK
      ?auto_182973 - BLOCK
      ?auto_182974 - BLOCK
      ?auto_182975 - BLOCK
      ?auto_182976 - BLOCK
      ?auto_182977 - BLOCK
      ?auto_182978 - BLOCK
      ?auto_182979 - BLOCK
      ?auto_182980 - BLOCK
      ?auto_182981 - BLOCK
      ?auto_182982 - BLOCK
      ?auto_182983 - BLOCK
    )
    :vars
    (
      ?auto_182984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_182983 ?auto_182984 ) ( ON-TABLE ?auto_182972 ) ( ON ?auto_182973 ?auto_182972 ) ( ON ?auto_182974 ?auto_182973 ) ( ON ?auto_182975 ?auto_182974 ) ( ON ?auto_182976 ?auto_182975 ) ( ON ?auto_182977 ?auto_182976 ) ( not ( = ?auto_182972 ?auto_182973 ) ) ( not ( = ?auto_182972 ?auto_182974 ) ) ( not ( = ?auto_182972 ?auto_182975 ) ) ( not ( = ?auto_182972 ?auto_182976 ) ) ( not ( = ?auto_182972 ?auto_182977 ) ) ( not ( = ?auto_182972 ?auto_182978 ) ) ( not ( = ?auto_182972 ?auto_182979 ) ) ( not ( = ?auto_182972 ?auto_182980 ) ) ( not ( = ?auto_182972 ?auto_182981 ) ) ( not ( = ?auto_182972 ?auto_182982 ) ) ( not ( = ?auto_182972 ?auto_182983 ) ) ( not ( = ?auto_182972 ?auto_182984 ) ) ( not ( = ?auto_182973 ?auto_182974 ) ) ( not ( = ?auto_182973 ?auto_182975 ) ) ( not ( = ?auto_182973 ?auto_182976 ) ) ( not ( = ?auto_182973 ?auto_182977 ) ) ( not ( = ?auto_182973 ?auto_182978 ) ) ( not ( = ?auto_182973 ?auto_182979 ) ) ( not ( = ?auto_182973 ?auto_182980 ) ) ( not ( = ?auto_182973 ?auto_182981 ) ) ( not ( = ?auto_182973 ?auto_182982 ) ) ( not ( = ?auto_182973 ?auto_182983 ) ) ( not ( = ?auto_182973 ?auto_182984 ) ) ( not ( = ?auto_182974 ?auto_182975 ) ) ( not ( = ?auto_182974 ?auto_182976 ) ) ( not ( = ?auto_182974 ?auto_182977 ) ) ( not ( = ?auto_182974 ?auto_182978 ) ) ( not ( = ?auto_182974 ?auto_182979 ) ) ( not ( = ?auto_182974 ?auto_182980 ) ) ( not ( = ?auto_182974 ?auto_182981 ) ) ( not ( = ?auto_182974 ?auto_182982 ) ) ( not ( = ?auto_182974 ?auto_182983 ) ) ( not ( = ?auto_182974 ?auto_182984 ) ) ( not ( = ?auto_182975 ?auto_182976 ) ) ( not ( = ?auto_182975 ?auto_182977 ) ) ( not ( = ?auto_182975 ?auto_182978 ) ) ( not ( = ?auto_182975 ?auto_182979 ) ) ( not ( = ?auto_182975 ?auto_182980 ) ) ( not ( = ?auto_182975 ?auto_182981 ) ) ( not ( = ?auto_182975 ?auto_182982 ) ) ( not ( = ?auto_182975 ?auto_182983 ) ) ( not ( = ?auto_182975 ?auto_182984 ) ) ( not ( = ?auto_182976 ?auto_182977 ) ) ( not ( = ?auto_182976 ?auto_182978 ) ) ( not ( = ?auto_182976 ?auto_182979 ) ) ( not ( = ?auto_182976 ?auto_182980 ) ) ( not ( = ?auto_182976 ?auto_182981 ) ) ( not ( = ?auto_182976 ?auto_182982 ) ) ( not ( = ?auto_182976 ?auto_182983 ) ) ( not ( = ?auto_182976 ?auto_182984 ) ) ( not ( = ?auto_182977 ?auto_182978 ) ) ( not ( = ?auto_182977 ?auto_182979 ) ) ( not ( = ?auto_182977 ?auto_182980 ) ) ( not ( = ?auto_182977 ?auto_182981 ) ) ( not ( = ?auto_182977 ?auto_182982 ) ) ( not ( = ?auto_182977 ?auto_182983 ) ) ( not ( = ?auto_182977 ?auto_182984 ) ) ( not ( = ?auto_182978 ?auto_182979 ) ) ( not ( = ?auto_182978 ?auto_182980 ) ) ( not ( = ?auto_182978 ?auto_182981 ) ) ( not ( = ?auto_182978 ?auto_182982 ) ) ( not ( = ?auto_182978 ?auto_182983 ) ) ( not ( = ?auto_182978 ?auto_182984 ) ) ( not ( = ?auto_182979 ?auto_182980 ) ) ( not ( = ?auto_182979 ?auto_182981 ) ) ( not ( = ?auto_182979 ?auto_182982 ) ) ( not ( = ?auto_182979 ?auto_182983 ) ) ( not ( = ?auto_182979 ?auto_182984 ) ) ( not ( = ?auto_182980 ?auto_182981 ) ) ( not ( = ?auto_182980 ?auto_182982 ) ) ( not ( = ?auto_182980 ?auto_182983 ) ) ( not ( = ?auto_182980 ?auto_182984 ) ) ( not ( = ?auto_182981 ?auto_182982 ) ) ( not ( = ?auto_182981 ?auto_182983 ) ) ( not ( = ?auto_182981 ?auto_182984 ) ) ( not ( = ?auto_182982 ?auto_182983 ) ) ( not ( = ?auto_182982 ?auto_182984 ) ) ( not ( = ?auto_182983 ?auto_182984 ) ) ( ON ?auto_182982 ?auto_182983 ) ( ON ?auto_182981 ?auto_182982 ) ( ON ?auto_182980 ?auto_182981 ) ( ON ?auto_182979 ?auto_182980 ) ( CLEAR ?auto_182977 ) ( ON ?auto_182978 ?auto_182979 ) ( CLEAR ?auto_182978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182972 ?auto_182973 ?auto_182974 ?auto_182975 ?auto_182976 ?auto_182977 ?auto_182978 )
      ( MAKE-12PILE ?auto_182972 ?auto_182973 ?auto_182974 ?auto_182975 ?auto_182976 ?auto_182977 ?auto_182978 ?auto_182979 ?auto_182980 ?auto_182981 ?auto_182982 ?auto_182983 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_182997 - BLOCK
      ?auto_182998 - BLOCK
      ?auto_182999 - BLOCK
      ?auto_183000 - BLOCK
      ?auto_183001 - BLOCK
      ?auto_183002 - BLOCK
      ?auto_183003 - BLOCK
      ?auto_183004 - BLOCK
      ?auto_183005 - BLOCK
      ?auto_183006 - BLOCK
      ?auto_183007 - BLOCK
      ?auto_183008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183008 ) ( ON-TABLE ?auto_182997 ) ( ON ?auto_182998 ?auto_182997 ) ( ON ?auto_182999 ?auto_182998 ) ( ON ?auto_183000 ?auto_182999 ) ( ON ?auto_183001 ?auto_183000 ) ( ON ?auto_183002 ?auto_183001 ) ( not ( = ?auto_182997 ?auto_182998 ) ) ( not ( = ?auto_182997 ?auto_182999 ) ) ( not ( = ?auto_182997 ?auto_183000 ) ) ( not ( = ?auto_182997 ?auto_183001 ) ) ( not ( = ?auto_182997 ?auto_183002 ) ) ( not ( = ?auto_182997 ?auto_183003 ) ) ( not ( = ?auto_182997 ?auto_183004 ) ) ( not ( = ?auto_182997 ?auto_183005 ) ) ( not ( = ?auto_182997 ?auto_183006 ) ) ( not ( = ?auto_182997 ?auto_183007 ) ) ( not ( = ?auto_182997 ?auto_183008 ) ) ( not ( = ?auto_182998 ?auto_182999 ) ) ( not ( = ?auto_182998 ?auto_183000 ) ) ( not ( = ?auto_182998 ?auto_183001 ) ) ( not ( = ?auto_182998 ?auto_183002 ) ) ( not ( = ?auto_182998 ?auto_183003 ) ) ( not ( = ?auto_182998 ?auto_183004 ) ) ( not ( = ?auto_182998 ?auto_183005 ) ) ( not ( = ?auto_182998 ?auto_183006 ) ) ( not ( = ?auto_182998 ?auto_183007 ) ) ( not ( = ?auto_182998 ?auto_183008 ) ) ( not ( = ?auto_182999 ?auto_183000 ) ) ( not ( = ?auto_182999 ?auto_183001 ) ) ( not ( = ?auto_182999 ?auto_183002 ) ) ( not ( = ?auto_182999 ?auto_183003 ) ) ( not ( = ?auto_182999 ?auto_183004 ) ) ( not ( = ?auto_182999 ?auto_183005 ) ) ( not ( = ?auto_182999 ?auto_183006 ) ) ( not ( = ?auto_182999 ?auto_183007 ) ) ( not ( = ?auto_182999 ?auto_183008 ) ) ( not ( = ?auto_183000 ?auto_183001 ) ) ( not ( = ?auto_183000 ?auto_183002 ) ) ( not ( = ?auto_183000 ?auto_183003 ) ) ( not ( = ?auto_183000 ?auto_183004 ) ) ( not ( = ?auto_183000 ?auto_183005 ) ) ( not ( = ?auto_183000 ?auto_183006 ) ) ( not ( = ?auto_183000 ?auto_183007 ) ) ( not ( = ?auto_183000 ?auto_183008 ) ) ( not ( = ?auto_183001 ?auto_183002 ) ) ( not ( = ?auto_183001 ?auto_183003 ) ) ( not ( = ?auto_183001 ?auto_183004 ) ) ( not ( = ?auto_183001 ?auto_183005 ) ) ( not ( = ?auto_183001 ?auto_183006 ) ) ( not ( = ?auto_183001 ?auto_183007 ) ) ( not ( = ?auto_183001 ?auto_183008 ) ) ( not ( = ?auto_183002 ?auto_183003 ) ) ( not ( = ?auto_183002 ?auto_183004 ) ) ( not ( = ?auto_183002 ?auto_183005 ) ) ( not ( = ?auto_183002 ?auto_183006 ) ) ( not ( = ?auto_183002 ?auto_183007 ) ) ( not ( = ?auto_183002 ?auto_183008 ) ) ( not ( = ?auto_183003 ?auto_183004 ) ) ( not ( = ?auto_183003 ?auto_183005 ) ) ( not ( = ?auto_183003 ?auto_183006 ) ) ( not ( = ?auto_183003 ?auto_183007 ) ) ( not ( = ?auto_183003 ?auto_183008 ) ) ( not ( = ?auto_183004 ?auto_183005 ) ) ( not ( = ?auto_183004 ?auto_183006 ) ) ( not ( = ?auto_183004 ?auto_183007 ) ) ( not ( = ?auto_183004 ?auto_183008 ) ) ( not ( = ?auto_183005 ?auto_183006 ) ) ( not ( = ?auto_183005 ?auto_183007 ) ) ( not ( = ?auto_183005 ?auto_183008 ) ) ( not ( = ?auto_183006 ?auto_183007 ) ) ( not ( = ?auto_183006 ?auto_183008 ) ) ( not ( = ?auto_183007 ?auto_183008 ) ) ( ON ?auto_183007 ?auto_183008 ) ( ON ?auto_183006 ?auto_183007 ) ( ON ?auto_183005 ?auto_183006 ) ( ON ?auto_183004 ?auto_183005 ) ( CLEAR ?auto_183002 ) ( ON ?auto_183003 ?auto_183004 ) ( CLEAR ?auto_183003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_182997 ?auto_182998 ?auto_182999 ?auto_183000 ?auto_183001 ?auto_183002 ?auto_183003 )
      ( MAKE-12PILE ?auto_182997 ?auto_182998 ?auto_182999 ?auto_183000 ?auto_183001 ?auto_183002 ?auto_183003 ?auto_183004 ?auto_183005 ?auto_183006 ?auto_183007 ?auto_183008 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_183021 - BLOCK
      ?auto_183022 - BLOCK
      ?auto_183023 - BLOCK
      ?auto_183024 - BLOCK
      ?auto_183025 - BLOCK
      ?auto_183026 - BLOCK
      ?auto_183027 - BLOCK
      ?auto_183028 - BLOCK
      ?auto_183029 - BLOCK
      ?auto_183030 - BLOCK
      ?auto_183031 - BLOCK
      ?auto_183032 - BLOCK
    )
    :vars
    (
      ?auto_183033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183032 ?auto_183033 ) ( ON-TABLE ?auto_183021 ) ( ON ?auto_183022 ?auto_183021 ) ( ON ?auto_183023 ?auto_183022 ) ( ON ?auto_183024 ?auto_183023 ) ( ON ?auto_183025 ?auto_183024 ) ( not ( = ?auto_183021 ?auto_183022 ) ) ( not ( = ?auto_183021 ?auto_183023 ) ) ( not ( = ?auto_183021 ?auto_183024 ) ) ( not ( = ?auto_183021 ?auto_183025 ) ) ( not ( = ?auto_183021 ?auto_183026 ) ) ( not ( = ?auto_183021 ?auto_183027 ) ) ( not ( = ?auto_183021 ?auto_183028 ) ) ( not ( = ?auto_183021 ?auto_183029 ) ) ( not ( = ?auto_183021 ?auto_183030 ) ) ( not ( = ?auto_183021 ?auto_183031 ) ) ( not ( = ?auto_183021 ?auto_183032 ) ) ( not ( = ?auto_183021 ?auto_183033 ) ) ( not ( = ?auto_183022 ?auto_183023 ) ) ( not ( = ?auto_183022 ?auto_183024 ) ) ( not ( = ?auto_183022 ?auto_183025 ) ) ( not ( = ?auto_183022 ?auto_183026 ) ) ( not ( = ?auto_183022 ?auto_183027 ) ) ( not ( = ?auto_183022 ?auto_183028 ) ) ( not ( = ?auto_183022 ?auto_183029 ) ) ( not ( = ?auto_183022 ?auto_183030 ) ) ( not ( = ?auto_183022 ?auto_183031 ) ) ( not ( = ?auto_183022 ?auto_183032 ) ) ( not ( = ?auto_183022 ?auto_183033 ) ) ( not ( = ?auto_183023 ?auto_183024 ) ) ( not ( = ?auto_183023 ?auto_183025 ) ) ( not ( = ?auto_183023 ?auto_183026 ) ) ( not ( = ?auto_183023 ?auto_183027 ) ) ( not ( = ?auto_183023 ?auto_183028 ) ) ( not ( = ?auto_183023 ?auto_183029 ) ) ( not ( = ?auto_183023 ?auto_183030 ) ) ( not ( = ?auto_183023 ?auto_183031 ) ) ( not ( = ?auto_183023 ?auto_183032 ) ) ( not ( = ?auto_183023 ?auto_183033 ) ) ( not ( = ?auto_183024 ?auto_183025 ) ) ( not ( = ?auto_183024 ?auto_183026 ) ) ( not ( = ?auto_183024 ?auto_183027 ) ) ( not ( = ?auto_183024 ?auto_183028 ) ) ( not ( = ?auto_183024 ?auto_183029 ) ) ( not ( = ?auto_183024 ?auto_183030 ) ) ( not ( = ?auto_183024 ?auto_183031 ) ) ( not ( = ?auto_183024 ?auto_183032 ) ) ( not ( = ?auto_183024 ?auto_183033 ) ) ( not ( = ?auto_183025 ?auto_183026 ) ) ( not ( = ?auto_183025 ?auto_183027 ) ) ( not ( = ?auto_183025 ?auto_183028 ) ) ( not ( = ?auto_183025 ?auto_183029 ) ) ( not ( = ?auto_183025 ?auto_183030 ) ) ( not ( = ?auto_183025 ?auto_183031 ) ) ( not ( = ?auto_183025 ?auto_183032 ) ) ( not ( = ?auto_183025 ?auto_183033 ) ) ( not ( = ?auto_183026 ?auto_183027 ) ) ( not ( = ?auto_183026 ?auto_183028 ) ) ( not ( = ?auto_183026 ?auto_183029 ) ) ( not ( = ?auto_183026 ?auto_183030 ) ) ( not ( = ?auto_183026 ?auto_183031 ) ) ( not ( = ?auto_183026 ?auto_183032 ) ) ( not ( = ?auto_183026 ?auto_183033 ) ) ( not ( = ?auto_183027 ?auto_183028 ) ) ( not ( = ?auto_183027 ?auto_183029 ) ) ( not ( = ?auto_183027 ?auto_183030 ) ) ( not ( = ?auto_183027 ?auto_183031 ) ) ( not ( = ?auto_183027 ?auto_183032 ) ) ( not ( = ?auto_183027 ?auto_183033 ) ) ( not ( = ?auto_183028 ?auto_183029 ) ) ( not ( = ?auto_183028 ?auto_183030 ) ) ( not ( = ?auto_183028 ?auto_183031 ) ) ( not ( = ?auto_183028 ?auto_183032 ) ) ( not ( = ?auto_183028 ?auto_183033 ) ) ( not ( = ?auto_183029 ?auto_183030 ) ) ( not ( = ?auto_183029 ?auto_183031 ) ) ( not ( = ?auto_183029 ?auto_183032 ) ) ( not ( = ?auto_183029 ?auto_183033 ) ) ( not ( = ?auto_183030 ?auto_183031 ) ) ( not ( = ?auto_183030 ?auto_183032 ) ) ( not ( = ?auto_183030 ?auto_183033 ) ) ( not ( = ?auto_183031 ?auto_183032 ) ) ( not ( = ?auto_183031 ?auto_183033 ) ) ( not ( = ?auto_183032 ?auto_183033 ) ) ( ON ?auto_183031 ?auto_183032 ) ( ON ?auto_183030 ?auto_183031 ) ( ON ?auto_183029 ?auto_183030 ) ( ON ?auto_183028 ?auto_183029 ) ( ON ?auto_183027 ?auto_183028 ) ( CLEAR ?auto_183025 ) ( ON ?auto_183026 ?auto_183027 ) ( CLEAR ?auto_183026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183021 ?auto_183022 ?auto_183023 ?auto_183024 ?auto_183025 ?auto_183026 )
      ( MAKE-12PILE ?auto_183021 ?auto_183022 ?auto_183023 ?auto_183024 ?auto_183025 ?auto_183026 ?auto_183027 ?auto_183028 ?auto_183029 ?auto_183030 ?auto_183031 ?auto_183032 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_183046 - BLOCK
      ?auto_183047 - BLOCK
      ?auto_183048 - BLOCK
      ?auto_183049 - BLOCK
      ?auto_183050 - BLOCK
      ?auto_183051 - BLOCK
      ?auto_183052 - BLOCK
      ?auto_183053 - BLOCK
      ?auto_183054 - BLOCK
      ?auto_183055 - BLOCK
      ?auto_183056 - BLOCK
      ?auto_183057 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183057 ) ( ON-TABLE ?auto_183046 ) ( ON ?auto_183047 ?auto_183046 ) ( ON ?auto_183048 ?auto_183047 ) ( ON ?auto_183049 ?auto_183048 ) ( ON ?auto_183050 ?auto_183049 ) ( not ( = ?auto_183046 ?auto_183047 ) ) ( not ( = ?auto_183046 ?auto_183048 ) ) ( not ( = ?auto_183046 ?auto_183049 ) ) ( not ( = ?auto_183046 ?auto_183050 ) ) ( not ( = ?auto_183046 ?auto_183051 ) ) ( not ( = ?auto_183046 ?auto_183052 ) ) ( not ( = ?auto_183046 ?auto_183053 ) ) ( not ( = ?auto_183046 ?auto_183054 ) ) ( not ( = ?auto_183046 ?auto_183055 ) ) ( not ( = ?auto_183046 ?auto_183056 ) ) ( not ( = ?auto_183046 ?auto_183057 ) ) ( not ( = ?auto_183047 ?auto_183048 ) ) ( not ( = ?auto_183047 ?auto_183049 ) ) ( not ( = ?auto_183047 ?auto_183050 ) ) ( not ( = ?auto_183047 ?auto_183051 ) ) ( not ( = ?auto_183047 ?auto_183052 ) ) ( not ( = ?auto_183047 ?auto_183053 ) ) ( not ( = ?auto_183047 ?auto_183054 ) ) ( not ( = ?auto_183047 ?auto_183055 ) ) ( not ( = ?auto_183047 ?auto_183056 ) ) ( not ( = ?auto_183047 ?auto_183057 ) ) ( not ( = ?auto_183048 ?auto_183049 ) ) ( not ( = ?auto_183048 ?auto_183050 ) ) ( not ( = ?auto_183048 ?auto_183051 ) ) ( not ( = ?auto_183048 ?auto_183052 ) ) ( not ( = ?auto_183048 ?auto_183053 ) ) ( not ( = ?auto_183048 ?auto_183054 ) ) ( not ( = ?auto_183048 ?auto_183055 ) ) ( not ( = ?auto_183048 ?auto_183056 ) ) ( not ( = ?auto_183048 ?auto_183057 ) ) ( not ( = ?auto_183049 ?auto_183050 ) ) ( not ( = ?auto_183049 ?auto_183051 ) ) ( not ( = ?auto_183049 ?auto_183052 ) ) ( not ( = ?auto_183049 ?auto_183053 ) ) ( not ( = ?auto_183049 ?auto_183054 ) ) ( not ( = ?auto_183049 ?auto_183055 ) ) ( not ( = ?auto_183049 ?auto_183056 ) ) ( not ( = ?auto_183049 ?auto_183057 ) ) ( not ( = ?auto_183050 ?auto_183051 ) ) ( not ( = ?auto_183050 ?auto_183052 ) ) ( not ( = ?auto_183050 ?auto_183053 ) ) ( not ( = ?auto_183050 ?auto_183054 ) ) ( not ( = ?auto_183050 ?auto_183055 ) ) ( not ( = ?auto_183050 ?auto_183056 ) ) ( not ( = ?auto_183050 ?auto_183057 ) ) ( not ( = ?auto_183051 ?auto_183052 ) ) ( not ( = ?auto_183051 ?auto_183053 ) ) ( not ( = ?auto_183051 ?auto_183054 ) ) ( not ( = ?auto_183051 ?auto_183055 ) ) ( not ( = ?auto_183051 ?auto_183056 ) ) ( not ( = ?auto_183051 ?auto_183057 ) ) ( not ( = ?auto_183052 ?auto_183053 ) ) ( not ( = ?auto_183052 ?auto_183054 ) ) ( not ( = ?auto_183052 ?auto_183055 ) ) ( not ( = ?auto_183052 ?auto_183056 ) ) ( not ( = ?auto_183052 ?auto_183057 ) ) ( not ( = ?auto_183053 ?auto_183054 ) ) ( not ( = ?auto_183053 ?auto_183055 ) ) ( not ( = ?auto_183053 ?auto_183056 ) ) ( not ( = ?auto_183053 ?auto_183057 ) ) ( not ( = ?auto_183054 ?auto_183055 ) ) ( not ( = ?auto_183054 ?auto_183056 ) ) ( not ( = ?auto_183054 ?auto_183057 ) ) ( not ( = ?auto_183055 ?auto_183056 ) ) ( not ( = ?auto_183055 ?auto_183057 ) ) ( not ( = ?auto_183056 ?auto_183057 ) ) ( ON ?auto_183056 ?auto_183057 ) ( ON ?auto_183055 ?auto_183056 ) ( ON ?auto_183054 ?auto_183055 ) ( ON ?auto_183053 ?auto_183054 ) ( ON ?auto_183052 ?auto_183053 ) ( CLEAR ?auto_183050 ) ( ON ?auto_183051 ?auto_183052 ) ( CLEAR ?auto_183051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183046 ?auto_183047 ?auto_183048 ?auto_183049 ?auto_183050 ?auto_183051 )
      ( MAKE-12PILE ?auto_183046 ?auto_183047 ?auto_183048 ?auto_183049 ?auto_183050 ?auto_183051 ?auto_183052 ?auto_183053 ?auto_183054 ?auto_183055 ?auto_183056 ?auto_183057 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_183070 - BLOCK
      ?auto_183071 - BLOCK
      ?auto_183072 - BLOCK
      ?auto_183073 - BLOCK
      ?auto_183074 - BLOCK
      ?auto_183075 - BLOCK
      ?auto_183076 - BLOCK
      ?auto_183077 - BLOCK
      ?auto_183078 - BLOCK
      ?auto_183079 - BLOCK
      ?auto_183080 - BLOCK
      ?auto_183081 - BLOCK
    )
    :vars
    (
      ?auto_183082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183081 ?auto_183082 ) ( ON-TABLE ?auto_183070 ) ( ON ?auto_183071 ?auto_183070 ) ( ON ?auto_183072 ?auto_183071 ) ( ON ?auto_183073 ?auto_183072 ) ( not ( = ?auto_183070 ?auto_183071 ) ) ( not ( = ?auto_183070 ?auto_183072 ) ) ( not ( = ?auto_183070 ?auto_183073 ) ) ( not ( = ?auto_183070 ?auto_183074 ) ) ( not ( = ?auto_183070 ?auto_183075 ) ) ( not ( = ?auto_183070 ?auto_183076 ) ) ( not ( = ?auto_183070 ?auto_183077 ) ) ( not ( = ?auto_183070 ?auto_183078 ) ) ( not ( = ?auto_183070 ?auto_183079 ) ) ( not ( = ?auto_183070 ?auto_183080 ) ) ( not ( = ?auto_183070 ?auto_183081 ) ) ( not ( = ?auto_183070 ?auto_183082 ) ) ( not ( = ?auto_183071 ?auto_183072 ) ) ( not ( = ?auto_183071 ?auto_183073 ) ) ( not ( = ?auto_183071 ?auto_183074 ) ) ( not ( = ?auto_183071 ?auto_183075 ) ) ( not ( = ?auto_183071 ?auto_183076 ) ) ( not ( = ?auto_183071 ?auto_183077 ) ) ( not ( = ?auto_183071 ?auto_183078 ) ) ( not ( = ?auto_183071 ?auto_183079 ) ) ( not ( = ?auto_183071 ?auto_183080 ) ) ( not ( = ?auto_183071 ?auto_183081 ) ) ( not ( = ?auto_183071 ?auto_183082 ) ) ( not ( = ?auto_183072 ?auto_183073 ) ) ( not ( = ?auto_183072 ?auto_183074 ) ) ( not ( = ?auto_183072 ?auto_183075 ) ) ( not ( = ?auto_183072 ?auto_183076 ) ) ( not ( = ?auto_183072 ?auto_183077 ) ) ( not ( = ?auto_183072 ?auto_183078 ) ) ( not ( = ?auto_183072 ?auto_183079 ) ) ( not ( = ?auto_183072 ?auto_183080 ) ) ( not ( = ?auto_183072 ?auto_183081 ) ) ( not ( = ?auto_183072 ?auto_183082 ) ) ( not ( = ?auto_183073 ?auto_183074 ) ) ( not ( = ?auto_183073 ?auto_183075 ) ) ( not ( = ?auto_183073 ?auto_183076 ) ) ( not ( = ?auto_183073 ?auto_183077 ) ) ( not ( = ?auto_183073 ?auto_183078 ) ) ( not ( = ?auto_183073 ?auto_183079 ) ) ( not ( = ?auto_183073 ?auto_183080 ) ) ( not ( = ?auto_183073 ?auto_183081 ) ) ( not ( = ?auto_183073 ?auto_183082 ) ) ( not ( = ?auto_183074 ?auto_183075 ) ) ( not ( = ?auto_183074 ?auto_183076 ) ) ( not ( = ?auto_183074 ?auto_183077 ) ) ( not ( = ?auto_183074 ?auto_183078 ) ) ( not ( = ?auto_183074 ?auto_183079 ) ) ( not ( = ?auto_183074 ?auto_183080 ) ) ( not ( = ?auto_183074 ?auto_183081 ) ) ( not ( = ?auto_183074 ?auto_183082 ) ) ( not ( = ?auto_183075 ?auto_183076 ) ) ( not ( = ?auto_183075 ?auto_183077 ) ) ( not ( = ?auto_183075 ?auto_183078 ) ) ( not ( = ?auto_183075 ?auto_183079 ) ) ( not ( = ?auto_183075 ?auto_183080 ) ) ( not ( = ?auto_183075 ?auto_183081 ) ) ( not ( = ?auto_183075 ?auto_183082 ) ) ( not ( = ?auto_183076 ?auto_183077 ) ) ( not ( = ?auto_183076 ?auto_183078 ) ) ( not ( = ?auto_183076 ?auto_183079 ) ) ( not ( = ?auto_183076 ?auto_183080 ) ) ( not ( = ?auto_183076 ?auto_183081 ) ) ( not ( = ?auto_183076 ?auto_183082 ) ) ( not ( = ?auto_183077 ?auto_183078 ) ) ( not ( = ?auto_183077 ?auto_183079 ) ) ( not ( = ?auto_183077 ?auto_183080 ) ) ( not ( = ?auto_183077 ?auto_183081 ) ) ( not ( = ?auto_183077 ?auto_183082 ) ) ( not ( = ?auto_183078 ?auto_183079 ) ) ( not ( = ?auto_183078 ?auto_183080 ) ) ( not ( = ?auto_183078 ?auto_183081 ) ) ( not ( = ?auto_183078 ?auto_183082 ) ) ( not ( = ?auto_183079 ?auto_183080 ) ) ( not ( = ?auto_183079 ?auto_183081 ) ) ( not ( = ?auto_183079 ?auto_183082 ) ) ( not ( = ?auto_183080 ?auto_183081 ) ) ( not ( = ?auto_183080 ?auto_183082 ) ) ( not ( = ?auto_183081 ?auto_183082 ) ) ( ON ?auto_183080 ?auto_183081 ) ( ON ?auto_183079 ?auto_183080 ) ( ON ?auto_183078 ?auto_183079 ) ( ON ?auto_183077 ?auto_183078 ) ( ON ?auto_183076 ?auto_183077 ) ( ON ?auto_183075 ?auto_183076 ) ( CLEAR ?auto_183073 ) ( ON ?auto_183074 ?auto_183075 ) ( CLEAR ?auto_183074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183070 ?auto_183071 ?auto_183072 ?auto_183073 ?auto_183074 )
      ( MAKE-12PILE ?auto_183070 ?auto_183071 ?auto_183072 ?auto_183073 ?auto_183074 ?auto_183075 ?auto_183076 ?auto_183077 ?auto_183078 ?auto_183079 ?auto_183080 ?auto_183081 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_183095 - BLOCK
      ?auto_183096 - BLOCK
      ?auto_183097 - BLOCK
      ?auto_183098 - BLOCK
      ?auto_183099 - BLOCK
      ?auto_183100 - BLOCK
      ?auto_183101 - BLOCK
      ?auto_183102 - BLOCK
      ?auto_183103 - BLOCK
      ?auto_183104 - BLOCK
      ?auto_183105 - BLOCK
      ?auto_183106 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183106 ) ( ON-TABLE ?auto_183095 ) ( ON ?auto_183096 ?auto_183095 ) ( ON ?auto_183097 ?auto_183096 ) ( ON ?auto_183098 ?auto_183097 ) ( not ( = ?auto_183095 ?auto_183096 ) ) ( not ( = ?auto_183095 ?auto_183097 ) ) ( not ( = ?auto_183095 ?auto_183098 ) ) ( not ( = ?auto_183095 ?auto_183099 ) ) ( not ( = ?auto_183095 ?auto_183100 ) ) ( not ( = ?auto_183095 ?auto_183101 ) ) ( not ( = ?auto_183095 ?auto_183102 ) ) ( not ( = ?auto_183095 ?auto_183103 ) ) ( not ( = ?auto_183095 ?auto_183104 ) ) ( not ( = ?auto_183095 ?auto_183105 ) ) ( not ( = ?auto_183095 ?auto_183106 ) ) ( not ( = ?auto_183096 ?auto_183097 ) ) ( not ( = ?auto_183096 ?auto_183098 ) ) ( not ( = ?auto_183096 ?auto_183099 ) ) ( not ( = ?auto_183096 ?auto_183100 ) ) ( not ( = ?auto_183096 ?auto_183101 ) ) ( not ( = ?auto_183096 ?auto_183102 ) ) ( not ( = ?auto_183096 ?auto_183103 ) ) ( not ( = ?auto_183096 ?auto_183104 ) ) ( not ( = ?auto_183096 ?auto_183105 ) ) ( not ( = ?auto_183096 ?auto_183106 ) ) ( not ( = ?auto_183097 ?auto_183098 ) ) ( not ( = ?auto_183097 ?auto_183099 ) ) ( not ( = ?auto_183097 ?auto_183100 ) ) ( not ( = ?auto_183097 ?auto_183101 ) ) ( not ( = ?auto_183097 ?auto_183102 ) ) ( not ( = ?auto_183097 ?auto_183103 ) ) ( not ( = ?auto_183097 ?auto_183104 ) ) ( not ( = ?auto_183097 ?auto_183105 ) ) ( not ( = ?auto_183097 ?auto_183106 ) ) ( not ( = ?auto_183098 ?auto_183099 ) ) ( not ( = ?auto_183098 ?auto_183100 ) ) ( not ( = ?auto_183098 ?auto_183101 ) ) ( not ( = ?auto_183098 ?auto_183102 ) ) ( not ( = ?auto_183098 ?auto_183103 ) ) ( not ( = ?auto_183098 ?auto_183104 ) ) ( not ( = ?auto_183098 ?auto_183105 ) ) ( not ( = ?auto_183098 ?auto_183106 ) ) ( not ( = ?auto_183099 ?auto_183100 ) ) ( not ( = ?auto_183099 ?auto_183101 ) ) ( not ( = ?auto_183099 ?auto_183102 ) ) ( not ( = ?auto_183099 ?auto_183103 ) ) ( not ( = ?auto_183099 ?auto_183104 ) ) ( not ( = ?auto_183099 ?auto_183105 ) ) ( not ( = ?auto_183099 ?auto_183106 ) ) ( not ( = ?auto_183100 ?auto_183101 ) ) ( not ( = ?auto_183100 ?auto_183102 ) ) ( not ( = ?auto_183100 ?auto_183103 ) ) ( not ( = ?auto_183100 ?auto_183104 ) ) ( not ( = ?auto_183100 ?auto_183105 ) ) ( not ( = ?auto_183100 ?auto_183106 ) ) ( not ( = ?auto_183101 ?auto_183102 ) ) ( not ( = ?auto_183101 ?auto_183103 ) ) ( not ( = ?auto_183101 ?auto_183104 ) ) ( not ( = ?auto_183101 ?auto_183105 ) ) ( not ( = ?auto_183101 ?auto_183106 ) ) ( not ( = ?auto_183102 ?auto_183103 ) ) ( not ( = ?auto_183102 ?auto_183104 ) ) ( not ( = ?auto_183102 ?auto_183105 ) ) ( not ( = ?auto_183102 ?auto_183106 ) ) ( not ( = ?auto_183103 ?auto_183104 ) ) ( not ( = ?auto_183103 ?auto_183105 ) ) ( not ( = ?auto_183103 ?auto_183106 ) ) ( not ( = ?auto_183104 ?auto_183105 ) ) ( not ( = ?auto_183104 ?auto_183106 ) ) ( not ( = ?auto_183105 ?auto_183106 ) ) ( ON ?auto_183105 ?auto_183106 ) ( ON ?auto_183104 ?auto_183105 ) ( ON ?auto_183103 ?auto_183104 ) ( ON ?auto_183102 ?auto_183103 ) ( ON ?auto_183101 ?auto_183102 ) ( ON ?auto_183100 ?auto_183101 ) ( CLEAR ?auto_183098 ) ( ON ?auto_183099 ?auto_183100 ) ( CLEAR ?auto_183099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183095 ?auto_183096 ?auto_183097 ?auto_183098 ?auto_183099 )
      ( MAKE-12PILE ?auto_183095 ?auto_183096 ?auto_183097 ?auto_183098 ?auto_183099 ?auto_183100 ?auto_183101 ?auto_183102 ?auto_183103 ?auto_183104 ?auto_183105 ?auto_183106 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_183119 - BLOCK
      ?auto_183120 - BLOCK
      ?auto_183121 - BLOCK
      ?auto_183122 - BLOCK
      ?auto_183123 - BLOCK
      ?auto_183124 - BLOCK
      ?auto_183125 - BLOCK
      ?auto_183126 - BLOCK
      ?auto_183127 - BLOCK
      ?auto_183128 - BLOCK
      ?auto_183129 - BLOCK
      ?auto_183130 - BLOCK
    )
    :vars
    (
      ?auto_183131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183130 ?auto_183131 ) ( ON-TABLE ?auto_183119 ) ( ON ?auto_183120 ?auto_183119 ) ( ON ?auto_183121 ?auto_183120 ) ( not ( = ?auto_183119 ?auto_183120 ) ) ( not ( = ?auto_183119 ?auto_183121 ) ) ( not ( = ?auto_183119 ?auto_183122 ) ) ( not ( = ?auto_183119 ?auto_183123 ) ) ( not ( = ?auto_183119 ?auto_183124 ) ) ( not ( = ?auto_183119 ?auto_183125 ) ) ( not ( = ?auto_183119 ?auto_183126 ) ) ( not ( = ?auto_183119 ?auto_183127 ) ) ( not ( = ?auto_183119 ?auto_183128 ) ) ( not ( = ?auto_183119 ?auto_183129 ) ) ( not ( = ?auto_183119 ?auto_183130 ) ) ( not ( = ?auto_183119 ?auto_183131 ) ) ( not ( = ?auto_183120 ?auto_183121 ) ) ( not ( = ?auto_183120 ?auto_183122 ) ) ( not ( = ?auto_183120 ?auto_183123 ) ) ( not ( = ?auto_183120 ?auto_183124 ) ) ( not ( = ?auto_183120 ?auto_183125 ) ) ( not ( = ?auto_183120 ?auto_183126 ) ) ( not ( = ?auto_183120 ?auto_183127 ) ) ( not ( = ?auto_183120 ?auto_183128 ) ) ( not ( = ?auto_183120 ?auto_183129 ) ) ( not ( = ?auto_183120 ?auto_183130 ) ) ( not ( = ?auto_183120 ?auto_183131 ) ) ( not ( = ?auto_183121 ?auto_183122 ) ) ( not ( = ?auto_183121 ?auto_183123 ) ) ( not ( = ?auto_183121 ?auto_183124 ) ) ( not ( = ?auto_183121 ?auto_183125 ) ) ( not ( = ?auto_183121 ?auto_183126 ) ) ( not ( = ?auto_183121 ?auto_183127 ) ) ( not ( = ?auto_183121 ?auto_183128 ) ) ( not ( = ?auto_183121 ?auto_183129 ) ) ( not ( = ?auto_183121 ?auto_183130 ) ) ( not ( = ?auto_183121 ?auto_183131 ) ) ( not ( = ?auto_183122 ?auto_183123 ) ) ( not ( = ?auto_183122 ?auto_183124 ) ) ( not ( = ?auto_183122 ?auto_183125 ) ) ( not ( = ?auto_183122 ?auto_183126 ) ) ( not ( = ?auto_183122 ?auto_183127 ) ) ( not ( = ?auto_183122 ?auto_183128 ) ) ( not ( = ?auto_183122 ?auto_183129 ) ) ( not ( = ?auto_183122 ?auto_183130 ) ) ( not ( = ?auto_183122 ?auto_183131 ) ) ( not ( = ?auto_183123 ?auto_183124 ) ) ( not ( = ?auto_183123 ?auto_183125 ) ) ( not ( = ?auto_183123 ?auto_183126 ) ) ( not ( = ?auto_183123 ?auto_183127 ) ) ( not ( = ?auto_183123 ?auto_183128 ) ) ( not ( = ?auto_183123 ?auto_183129 ) ) ( not ( = ?auto_183123 ?auto_183130 ) ) ( not ( = ?auto_183123 ?auto_183131 ) ) ( not ( = ?auto_183124 ?auto_183125 ) ) ( not ( = ?auto_183124 ?auto_183126 ) ) ( not ( = ?auto_183124 ?auto_183127 ) ) ( not ( = ?auto_183124 ?auto_183128 ) ) ( not ( = ?auto_183124 ?auto_183129 ) ) ( not ( = ?auto_183124 ?auto_183130 ) ) ( not ( = ?auto_183124 ?auto_183131 ) ) ( not ( = ?auto_183125 ?auto_183126 ) ) ( not ( = ?auto_183125 ?auto_183127 ) ) ( not ( = ?auto_183125 ?auto_183128 ) ) ( not ( = ?auto_183125 ?auto_183129 ) ) ( not ( = ?auto_183125 ?auto_183130 ) ) ( not ( = ?auto_183125 ?auto_183131 ) ) ( not ( = ?auto_183126 ?auto_183127 ) ) ( not ( = ?auto_183126 ?auto_183128 ) ) ( not ( = ?auto_183126 ?auto_183129 ) ) ( not ( = ?auto_183126 ?auto_183130 ) ) ( not ( = ?auto_183126 ?auto_183131 ) ) ( not ( = ?auto_183127 ?auto_183128 ) ) ( not ( = ?auto_183127 ?auto_183129 ) ) ( not ( = ?auto_183127 ?auto_183130 ) ) ( not ( = ?auto_183127 ?auto_183131 ) ) ( not ( = ?auto_183128 ?auto_183129 ) ) ( not ( = ?auto_183128 ?auto_183130 ) ) ( not ( = ?auto_183128 ?auto_183131 ) ) ( not ( = ?auto_183129 ?auto_183130 ) ) ( not ( = ?auto_183129 ?auto_183131 ) ) ( not ( = ?auto_183130 ?auto_183131 ) ) ( ON ?auto_183129 ?auto_183130 ) ( ON ?auto_183128 ?auto_183129 ) ( ON ?auto_183127 ?auto_183128 ) ( ON ?auto_183126 ?auto_183127 ) ( ON ?auto_183125 ?auto_183126 ) ( ON ?auto_183124 ?auto_183125 ) ( ON ?auto_183123 ?auto_183124 ) ( CLEAR ?auto_183121 ) ( ON ?auto_183122 ?auto_183123 ) ( CLEAR ?auto_183122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183119 ?auto_183120 ?auto_183121 ?auto_183122 )
      ( MAKE-12PILE ?auto_183119 ?auto_183120 ?auto_183121 ?auto_183122 ?auto_183123 ?auto_183124 ?auto_183125 ?auto_183126 ?auto_183127 ?auto_183128 ?auto_183129 ?auto_183130 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_183144 - BLOCK
      ?auto_183145 - BLOCK
      ?auto_183146 - BLOCK
      ?auto_183147 - BLOCK
      ?auto_183148 - BLOCK
      ?auto_183149 - BLOCK
      ?auto_183150 - BLOCK
      ?auto_183151 - BLOCK
      ?auto_183152 - BLOCK
      ?auto_183153 - BLOCK
      ?auto_183154 - BLOCK
      ?auto_183155 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183155 ) ( ON-TABLE ?auto_183144 ) ( ON ?auto_183145 ?auto_183144 ) ( ON ?auto_183146 ?auto_183145 ) ( not ( = ?auto_183144 ?auto_183145 ) ) ( not ( = ?auto_183144 ?auto_183146 ) ) ( not ( = ?auto_183144 ?auto_183147 ) ) ( not ( = ?auto_183144 ?auto_183148 ) ) ( not ( = ?auto_183144 ?auto_183149 ) ) ( not ( = ?auto_183144 ?auto_183150 ) ) ( not ( = ?auto_183144 ?auto_183151 ) ) ( not ( = ?auto_183144 ?auto_183152 ) ) ( not ( = ?auto_183144 ?auto_183153 ) ) ( not ( = ?auto_183144 ?auto_183154 ) ) ( not ( = ?auto_183144 ?auto_183155 ) ) ( not ( = ?auto_183145 ?auto_183146 ) ) ( not ( = ?auto_183145 ?auto_183147 ) ) ( not ( = ?auto_183145 ?auto_183148 ) ) ( not ( = ?auto_183145 ?auto_183149 ) ) ( not ( = ?auto_183145 ?auto_183150 ) ) ( not ( = ?auto_183145 ?auto_183151 ) ) ( not ( = ?auto_183145 ?auto_183152 ) ) ( not ( = ?auto_183145 ?auto_183153 ) ) ( not ( = ?auto_183145 ?auto_183154 ) ) ( not ( = ?auto_183145 ?auto_183155 ) ) ( not ( = ?auto_183146 ?auto_183147 ) ) ( not ( = ?auto_183146 ?auto_183148 ) ) ( not ( = ?auto_183146 ?auto_183149 ) ) ( not ( = ?auto_183146 ?auto_183150 ) ) ( not ( = ?auto_183146 ?auto_183151 ) ) ( not ( = ?auto_183146 ?auto_183152 ) ) ( not ( = ?auto_183146 ?auto_183153 ) ) ( not ( = ?auto_183146 ?auto_183154 ) ) ( not ( = ?auto_183146 ?auto_183155 ) ) ( not ( = ?auto_183147 ?auto_183148 ) ) ( not ( = ?auto_183147 ?auto_183149 ) ) ( not ( = ?auto_183147 ?auto_183150 ) ) ( not ( = ?auto_183147 ?auto_183151 ) ) ( not ( = ?auto_183147 ?auto_183152 ) ) ( not ( = ?auto_183147 ?auto_183153 ) ) ( not ( = ?auto_183147 ?auto_183154 ) ) ( not ( = ?auto_183147 ?auto_183155 ) ) ( not ( = ?auto_183148 ?auto_183149 ) ) ( not ( = ?auto_183148 ?auto_183150 ) ) ( not ( = ?auto_183148 ?auto_183151 ) ) ( not ( = ?auto_183148 ?auto_183152 ) ) ( not ( = ?auto_183148 ?auto_183153 ) ) ( not ( = ?auto_183148 ?auto_183154 ) ) ( not ( = ?auto_183148 ?auto_183155 ) ) ( not ( = ?auto_183149 ?auto_183150 ) ) ( not ( = ?auto_183149 ?auto_183151 ) ) ( not ( = ?auto_183149 ?auto_183152 ) ) ( not ( = ?auto_183149 ?auto_183153 ) ) ( not ( = ?auto_183149 ?auto_183154 ) ) ( not ( = ?auto_183149 ?auto_183155 ) ) ( not ( = ?auto_183150 ?auto_183151 ) ) ( not ( = ?auto_183150 ?auto_183152 ) ) ( not ( = ?auto_183150 ?auto_183153 ) ) ( not ( = ?auto_183150 ?auto_183154 ) ) ( not ( = ?auto_183150 ?auto_183155 ) ) ( not ( = ?auto_183151 ?auto_183152 ) ) ( not ( = ?auto_183151 ?auto_183153 ) ) ( not ( = ?auto_183151 ?auto_183154 ) ) ( not ( = ?auto_183151 ?auto_183155 ) ) ( not ( = ?auto_183152 ?auto_183153 ) ) ( not ( = ?auto_183152 ?auto_183154 ) ) ( not ( = ?auto_183152 ?auto_183155 ) ) ( not ( = ?auto_183153 ?auto_183154 ) ) ( not ( = ?auto_183153 ?auto_183155 ) ) ( not ( = ?auto_183154 ?auto_183155 ) ) ( ON ?auto_183154 ?auto_183155 ) ( ON ?auto_183153 ?auto_183154 ) ( ON ?auto_183152 ?auto_183153 ) ( ON ?auto_183151 ?auto_183152 ) ( ON ?auto_183150 ?auto_183151 ) ( ON ?auto_183149 ?auto_183150 ) ( ON ?auto_183148 ?auto_183149 ) ( CLEAR ?auto_183146 ) ( ON ?auto_183147 ?auto_183148 ) ( CLEAR ?auto_183147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183144 ?auto_183145 ?auto_183146 ?auto_183147 )
      ( MAKE-12PILE ?auto_183144 ?auto_183145 ?auto_183146 ?auto_183147 ?auto_183148 ?auto_183149 ?auto_183150 ?auto_183151 ?auto_183152 ?auto_183153 ?auto_183154 ?auto_183155 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_183168 - BLOCK
      ?auto_183169 - BLOCK
      ?auto_183170 - BLOCK
      ?auto_183171 - BLOCK
      ?auto_183172 - BLOCK
      ?auto_183173 - BLOCK
      ?auto_183174 - BLOCK
      ?auto_183175 - BLOCK
      ?auto_183176 - BLOCK
      ?auto_183177 - BLOCK
      ?auto_183178 - BLOCK
      ?auto_183179 - BLOCK
    )
    :vars
    (
      ?auto_183180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183179 ?auto_183180 ) ( ON-TABLE ?auto_183168 ) ( ON ?auto_183169 ?auto_183168 ) ( not ( = ?auto_183168 ?auto_183169 ) ) ( not ( = ?auto_183168 ?auto_183170 ) ) ( not ( = ?auto_183168 ?auto_183171 ) ) ( not ( = ?auto_183168 ?auto_183172 ) ) ( not ( = ?auto_183168 ?auto_183173 ) ) ( not ( = ?auto_183168 ?auto_183174 ) ) ( not ( = ?auto_183168 ?auto_183175 ) ) ( not ( = ?auto_183168 ?auto_183176 ) ) ( not ( = ?auto_183168 ?auto_183177 ) ) ( not ( = ?auto_183168 ?auto_183178 ) ) ( not ( = ?auto_183168 ?auto_183179 ) ) ( not ( = ?auto_183168 ?auto_183180 ) ) ( not ( = ?auto_183169 ?auto_183170 ) ) ( not ( = ?auto_183169 ?auto_183171 ) ) ( not ( = ?auto_183169 ?auto_183172 ) ) ( not ( = ?auto_183169 ?auto_183173 ) ) ( not ( = ?auto_183169 ?auto_183174 ) ) ( not ( = ?auto_183169 ?auto_183175 ) ) ( not ( = ?auto_183169 ?auto_183176 ) ) ( not ( = ?auto_183169 ?auto_183177 ) ) ( not ( = ?auto_183169 ?auto_183178 ) ) ( not ( = ?auto_183169 ?auto_183179 ) ) ( not ( = ?auto_183169 ?auto_183180 ) ) ( not ( = ?auto_183170 ?auto_183171 ) ) ( not ( = ?auto_183170 ?auto_183172 ) ) ( not ( = ?auto_183170 ?auto_183173 ) ) ( not ( = ?auto_183170 ?auto_183174 ) ) ( not ( = ?auto_183170 ?auto_183175 ) ) ( not ( = ?auto_183170 ?auto_183176 ) ) ( not ( = ?auto_183170 ?auto_183177 ) ) ( not ( = ?auto_183170 ?auto_183178 ) ) ( not ( = ?auto_183170 ?auto_183179 ) ) ( not ( = ?auto_183170 ?auto_183180 ) ) ( not ( = ?auto_183171 ?auto_183172 ) ) ( not ( = ?auto_183171 ?auto_183173 ) ) ( not ( = ?auto_183171 ?auto_183174 ) ) ( not ( = ?auto_183171 ?auto_183175 ) ) ( not ( = ?auto_183171 ?auto_183176 ) ) ( not ( = ?auto_183171 ?auto_183177 ) ) ( not ( = ?auto_183171 ?auto_183178 ) ) ( not ( = ?auto_183171 ?auto_183179 ) ) ( not ( = ?auto_183171 ?auto_183180 ) ) ( not ( = ?auto_183172 ?auto_183173 ) ) ( not ( = ?auto_183172 ?auto_183174 ) ) ( not ( = ?auto_183172 ?auto_183175 ) ) ( not ( = ?auto_183172 ?auto_183176 ) ) ( not ( = ?auto_183172 ?auto_183177 ) ) ( not ( = ?auto_183172 ?auto_183178 ) ) ( not ( = ?auto_183172 ?auto_183179 ) ) ( not ( = ?auto_183172 ?auto_183180 ) ) ( not ( = ?auto_183173 ?auto_183174 ) ) ( not ( = ?auto_183173 ?auto_183175 ) ) ( not ( = ?auto_183173 ?auto_183176 ) ) ( not ( = ?auto_183173 ?auto_183177 ) ) ( not ( = ?auto_183173 ?auto_183178 ) ) ( not ( = ?auto_183173 ?auto_183179 ) ) ( not ( = ?auto_183173 ?auto_183180 ) ) ( not ( = ?auto_183174 ?auto_183175 ) ) ( not ( = ?auto_183174 ?auto_183176 ) ) ( not ( = ?auto_183174 ?auto_183177 ) ) ( not ( = ?auto_183174 ?auto_183178 ) ) ( not ( = ?auto_183174 ?auto_183179 ) ) ( not ( = ?auto_183174 ?auto_183180 ) ) ( not ( = ?auto_183175 ?auto_183176 ) ) ( not ( = ?auto_183175 ?auto_183177 ) ) ( not ( = ?auto_183175 ?auto_183178 ) ) ( not ( = ?auto_183175 ?auto_183179 ) ) ( not ( = ?auto_183175 ?auto_183180 ) ) ( not ( = ?auto_183176 ?auto_183177 ) ) ( not ( = ?auto_183176 ?auto_183178 ) ) ( not ( = ?auto_183176 ?auto_183179 ) ) ( not ( = ?auto_183176 ?auto_183180 ) ) ( not ( = ?auto_183177 ?auto_183178 ) ) ( not ( = ?auto_183177 ?auto_183179 ) ) ( not ( = ?auto_183177 ?auto_183180 ) ) ( not ( = ?auto_183178 ?auto_183179 ) ) ( not ( = ?auto_183178 ?auto_183180 ) ) ( not ( = ?auto_183179 ?auto_183180 ) ) ( ON ?auto_183178 ?auto_183179 ) ( ON ?auto_183177 ?auto_183178 ) ( ON ?auto_183176 ?auto_183177 ) ( ON ?auto_183175 ?auto_183176 ) ( ON ?auto_183174 ?auto_183175 ) ( ON ?auto_183173 ?auto_183174 ) ( ON ?auto_183172 ?auto_183173 ) ( ON ?auto_183171 ?auto_183172 ) ( CLEAR ?auto_183169 ) ( ON ?auto_183170 ?auto_183171 ) ( CLEAR ?auto_183170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183168 ?auto_183169 ?auto_183170 )
      ( MAKE-12PILE ?auto_183168 ?auto_183169 ?auto_183170 ?auto_183171 ?auto_183172 ?auto_183173 ?auto_183174 ?auto_183175 ?auto_183176 ?auto_183177 ?auto_183178 ?auto_183179 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_183193 - BLOCK
      ?auto_183194 - BLOCK
      ?auto_183195 - BLOCK
      ?auto_183196 - BLOCK
      ?auto_183197 - BLOCK
      ?auto_183198 - BLOCK
      ?auto_183199 - BLOCK
      ?auto_183200 - BLOCK
      ?auto_183201 - BLOCK
      ?auto_183202 - BLOCK
      ?auto_183203 - BLOCK
      ?auto_183204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183204 ) ( ON-TABLE ?auto_183193 ) ( ON ?auto_183194 ?auto_183193 ) ( not ( = ?auto_183193 ?auto_183194 ) ) ( not ( = ?auto_183193 ?auto_183195 ) ) ( not ( = ?auto_183193 ?auto_183196 ) ) ( not ( = ?auto_183193 ?auto_183197 ) ) ( not ( = ?auto_183193 ?auto_183198 ) ) ( not ( = ?auto_183193 ?auto_183199 ) ) ( not ( = ?auto_183193 ?auto_183200 ) ) ( not ( = ?auto_183193 ?auto_183201 ) ) ( not ( = ?auto_183193 ?auto_183202 ) ) ( not ( = ?auto_183193 ?auto_183203 ) ) ( not ( = ?auto_183193 ?auto_183204 ) ) ( not ( = ?auto_183194 ?auto_183195 ) ) ( not ( = ?auto_183194 ?auto_183196 ) ) ( not ( = ?auto_183194 ?auto_183197 ) ) ( not ( = ?auto_183194 ?auto_183198 ) ) ( not ( = ?auto_183194 ?auto_183199 ) ) ( not ( = ?auto_183194 ?auto_183200 ) ) ( not ( = ?auto_183194 ?auto_183201 ) ) ( not ( = ?auto_183194 ?auto_183202 ) ) ( not ( = ?auto_183194 ?auto_183203 ) ) ( not ( = ?auto_183194 ?auto_183204 ) ) ( not ( = ?auto_183195 ?auto_183196 ) ) ( not ( = ?auto_183195 ?auto_183197 ) ) ( not ( = ?auto_183195 ?auto_183198 ) ) ( not ( = ?auto_183195 ?auto_183199 ) ) ( not ( = ?auto_183195 ?auto_183200 ) ) ( not ( = ?auto_183195 ?auto_183201 ) ) ( not ( = ?auto_183195 ?auto_183202 ) ) ( not ( = ?auto_183195 ?auto_183203 ) ) ( not ( = ?auto_183195 ?auto_183204 ) ) ( not ( = ?auto_183196 ?auto_183197 ) ) ( not ( = ?auto_183196 ?auto_183198 ) ) ( not ( = ?auto_183196 ?auto_183199 ) ) ( not ( = ?auto_183196 ?auto_183200 ) ) ( not ( = ?auto_183196 ?auto_183201 ) ) ( not ( = ?auto_183196 ?auto_183202 ) ) ( not ( = ?auto_183196 ?auto_183203 ) ) ( not ( = ?auto_183196 ?auto_183204 ) ) ( not ( = ?auto_183197 ?auto_183198 ) ) ( not ( = ?auto_183197 ?auto_183199 ) ) ( not ( = ?auto_183197 ?auto_183200 ) ) ( not ( = ?auto_183197 ?auto_183201 ) ) ( not ( = ?auto_183197 ?auto_183202 ) ) ( not ( = ?auto_183197 ?auto_183203 ) ) ( not ( = ?auto_183197 ?auto_183204 ) ) ( not ( = ?auto_183198 ?auto_183199 ) ) ( not ( = ?auto_183198 ?auto_183200 ) ) ( not ( = ?auto_183198 ?auto_183201 ) ) ( not ( = ?auto_183198 ?auto_183202 ) ) ( not ( = ?auto_183198 ?auto_183203 ) ) ( not ( = ?auto_183198 ?auto_183204 ) ) ( not ( = ?auto_183199 ?auto_183200 ) ) ( not ( = ?auto_183199 ?auto_183201 ) ) ( not ( = ?auto_183199 ?auto_183202 ) ) ( not ( = ?auto_183199 ?auto_183203 ) ) ( not ( = ?auto_183199 ?auto_183204 ) ) ( not ( = ?auto_183200 ?auto_183201 ) ) ( not ( = ?auto_183200 ?auto_183202 ) ) ( not ( = ?auto_183200 ?auto_183203 ) ) ( not ( = ?auto_183200 ?auto_183204 ) ) ( not ( = ?auto_183201 ?auto_183202 ) ) ( not ( = ?auto_183201 ?auto_183203 ) ) ( not ( = ?auto_183201 ?auto_183204 ) ) ( not ( = ?auto_183202 ?auto_183203 ) ) ( not ( = ?auto_183202 ?auto_183204 ) ) ( not ( = ?auto_183203 ?auto_183204 ) ) ( ON ?auto_183203 ?auto_183204 ) ( ON ?auto_183202 ?auto_183203 ) ( ON ?auto_183201 ?auto_183202 ) ( ON ?auto_183200 ?auto_183201 ) ( ON ?auto_183199 ?auto_183200 ) ( ON ?auto_183198 ?auto_183199 ) ( ON ?auto_183197 ?auto_183198 ) ( ON ?auto_183196 ?auto_183197 ) ( CLEAR ?auto_183194 ) ( ON ?auto_183195 ?auto_183196 ) ( CLEAR ?auto_183195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183193 ?auto_183194 ?auto_183195 )
      ( MAKE-12PILE ?auto_183193 ?auto_183194 ?auto_183195 ?auto_183196 ?auto_183197 ?auto_183198 ?auto_183199 ?auto_183200 ?auto_183201 ?auto_183202 ?auto_183203 ?auto_183204 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_183217 - BLOCK
      ?auto_183218 - BLOCK
      ?auto_183219 - BLOCK
      ?auto_183220 - BLOCK
      ?auto_183221 - BLOCK
      ?auto_183222 - BLOCK
      ?auto_183223 - BLOCK
      ?auto_183224 - BLOCK
      ?auto_183225 - BLOCK
      ?auto_183226 - BLOCK
      ?auto_183227 - BLOCK
      ?auto_183228 - BLOCK
    )
    :vars
    (
      ?auto_183229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183228 ?auto_183229 ) ( ON-TABLE ?auto_183217 ) ( not ( = ?auto_183217 ?auto_183218 ) ) ( not ( = ?auto_183217 ?auto_183219 ) ) ( not ( = ?auto_183217 ?auto_183220 ) ) ( not ( = ?auto_183217 ?auto_183221 ) ) ( not ( = ?auto_183217 ?auto_183222 ) ) ( not ( = ?auto_183217 ?auto_183223 ) ) ( not ( = ?auto_183217 ?auto_183224 ) ) ( not ( = ?auto_183217 ?auto_183225 ) ) ( not ( = ?auto_183217 ?auto_183226 ) ) ( not ( = ?auto_183217 ?auto_183227 ) ) ( not ( = ?auto_183217 ?auto_183228 ) ) ( not ( = ?auto_183217 ?auto_183229 ) ) ( not ( = ?auto_183218 ?auto_183219 ) ) ( not ( = ?auto_183218 ?auto_183220 ) ) ( not ( = ?auto_183218 ?auto_183221 ) ) ( not ( = ?auto_183218 ?auto_183222 ) ) ( not ( = ?auto_183218 ?auto_183223 ) ) ( not ( = ?auto_183218 ?auto_183224 ) ) ( not ( = ?auto_183218 ?auto_183225 ) ) ( not ( = ?auto_183218 ?auto_183226 ) ) ( not ( = ?auto_183218 ?auto_183227 ) ) ( not ( = ?auto_183218 ?auto_183228 ) ) ( not ( = ?auto_183218 ?auto_183229 ) ) ( not ( = ?auto_183219 ?auto_183220 ) ) ( not ( = ?auto_183219 ?auto_183221 ) ) ( not ( = ?auto_183219 ?auto_183222 ) ) ( not ( = ?auto_183219 ?auto_183223 ) ) ( not ( = ?auto_183219 ?auto_183224 ) ) ( not ( = ?auto_183219 ?auto_183225 ) ) ( not ( = ?auto_183219 ?auto_183226 ) ) ( not ( = ?auto_183219 ?auto_183227 ) ) ( not ( = ?auto_183219 ?auto_183228 ) ) ( not ( = ?auto_183219 ?auto_183229 ) ) ( not ( = ?auto_183220 ?auto_183221 ) ) ( not ( = ?auto_183220 ?auto_183222 ) ) ( not ( = ?auto_183220 ?auto_183223 ) ) ( not ( = ?auto_183220 ?auto_183224 ) ) ( not ( = ?auto_183220 ?auto_183225 ) ) ( not ( = ?auto_183220 ?auto_183226 ) ) ( not ( = ?auto_183220 ?auto_183227 ) ) ( not ( = ?auto_183220 ?auto_183228 ) ) ( not ( = ?auto_183220 ?auto_183229 ) ) ( not ( = ?auto_183221 ?auto_183222 ) ) ( not ( = ?auto_183221 ?auto_183223 ) ) ( not ( = ?auto_183221 ?auto_183224 ) ) ( not ( = ?auto_183221 ?auto_183225 ) ) ( not ( = ?auto_183221 ?auto_183226 ) ) ( not ( = ?auto_183221 ?auto_183227 ) ) ( not ( = ?auto_183221 ?auto_183228 ) ) ( not ( = ?auto_183221 ?auto_183229 ) ) ( not ( = ?auto_183222 ?auto_183223 ) ) ( not ( = ?auto_183222 ?auto_183224 ) ) ( not ( = ?auto_183222 ?auto_183225 ) ) ( not ( = ?auto_183222 ?auto_183226 ) ) ( not ( = ?auto_183222 ?auto_183227 ) ) ( not ( = ?auto_183222 ?auto_183228 ) ) ( not ( = ?auto_183222 ?auto_183229 ) ) ( not ( = ?auto_183223 ?auto_183224 ) ) ( not ( = ?auto_183223 ?auto_183225 ) ) ( not ( = ?auto_183223 ?auto_183226 ) ) ( not ( = ?auto_183223 ?auto_183227 ) ) ( not ( = ?auto_183223 ?auto_183228 ) ) ( not ( = ?auto_183223 ?auto_183229 ) ) ( not ( = ?auto_183224 ?auto_183225 ) ) ( not ( = ?auto_183224 ?auto_183226 ) ) ( not ( = ?auto_183224 ?auto_183227 ) ) ( not ( = ?auto_183224 ?auto_183228 ) ) ( not ( = ?auto_183224 ?auto_183229 ) ) ( not ( = ?auto_183225 ?auto_183226 ) ) ( not ( = ?auto_183225 ?auto_183227 ) ) ( not ( = ?auto_183225 ?auto_183228 ) ) ( not ( = ?auto_183225 ?auto_183229 ) ) ( not ( = ?auto_183226 ?auto_183227 ) ) ( not ( = ?auto_183226 ?auto_183228 ) ) ( not ( = ?auto_183226 ?auto_183229 ) ) ( not ( = ?auto_183227 ?auto_183228 ) ) ( not ( = ?auto_183227 ?auto_183229 ) ) ( not ( = ?auto_183228 ?auto_183229 ) ) ( ON ?auto_183227 ?auto_183228 ) ( ON ?auto_183226 ?auto_183227 ) ( ON ?auto_183225 ?auto_183226 ) ( ON ?auto_183224 ?auto_183225 ) ( ON ?auto_183223 ?auto_183224 ) ( ON ?auto_183222 ?auto_183223 ) ( ON ?auto_183221 ?auto_183222 ) ( ON ?auto_183220 ?auto_183221 ) ( ON ?auto_183219 ?auto_183220 ) ( CLEAR ?auto_183217 ) ( ON ?auto_183218 ?auto_183219 ) ( CLEAR ?auto_183218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183217 ?auto_183218 )
      ( MAKE-12PILE ?auto_183217 ?auto_183218 ?auto_183219 ?auto_183220 ?auto_183221 ?auto_183222 ?auto_183223 ?auto_183224 ?auto_183225 ?auto_183226 ?auto_183227 ?auto_183228 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_183242 - BLOCK
      ?auto_183243 - BLOCK
      ?auto_183244 - BLOCK
      ?auto_183245 - BLOCK
      ?auto_183246 - BLOCK
      ?auto_183247 - BLOCK
      ?auto_183248 - BLOCK
      ?auto_183249 - BLOCK
      ?auto_183250 - BLOCK
      ?auto_183251 - BLOCK
      ?auto_183252 - BLOCK
      ?auto_183253 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183253 ) ( ON-TABLE ?auto_183242 ) ( not ( = ?auto_183242 ?auto_183243 ) ) ( not ( = ?auto_183242 ?auto_183244 ) ) ( not ( = ?auto_183242 ?auto_183245 ) ) ( not ( = ?auto_183242 ?auto_183246 ) ) ( not ( = ?auto_183242 ?auto_183247 ) ) ( not ( = ?auto_183242 ?auto_183248 ) ) ( not ( = ?auto_183242 ?auto_183249 ) ) ( not ( = ?auto_183242 ?auto_183250 ) ) ( not ( = ?auto_183242 ?auto_183251 ) ) ( not ( = ?auto_183242 ?auto_183252 ) ) ( not ( = ?auto_183242 ?auto_183253 ) ) ( not ( = ?auto_183243 ?auto_183244 ) ) ( not ( = ?auto_183243 ?auto_183245 ) ) ( not ( = ?auto_183243 ?auto_183246 ) ) ( not ( = ?auto_183243 ?auto_183247 ) ) ( not ( = ?auto_183243 ?auto_183248 ) ) ( not ( = ?auto_183243 ?auto_183249 ) ) ( not ( = ?auto_183243 ?auto_183250 ) ) ( not ( = ?auto_183243 ?auto_183251 ) ) ( not ( = ?auto_183243 ?auto_183252 ) ) ( not ( = ?auto_183243 ?auto_183253 ) ) ( not ( = ?auto_183244 ?auto_183245 ) ) ( not ( = ?auto_183244 ?auto_183246 ) ) ( not ( = ?auto_183244 ?auto_183247 ) ) ( not ( = ?auto_183244 ?auto_183248 ) ) ( not ( = ?auto_183244 ?auto_183249 ) ) ( not ( = ?auto_183244 ?auto_183250 ) ) ( not ( = ?auto_183244 ?auto_183251 ) ) ( not ( = ?auto_183244 ?auto_183252 ) ) ( not ( = ?auto_183244 ?auto_183253 ) ) ( not ( = ?auto_183245 ?auto_183246 ) ) ( not ( = ?auto_183245 ?auto_183247 ) ) ( not ( = ?auto_183245 ?auto_183248 ) ) ( not ( = ?auto_183245 ?auto_183249 ) ) ( not ( = ?auto_183245 ?auto_183250 ) ) ( not ( = ?auto_183245 ?auto_183251 ) ) ( not ( = ?auto_183245 ?auto_183252 ) ) ( not ( = ?auto_183245 ?auto_183253 ) ) ( not ( = ?auto_183246 ?auto_183247 ) ) ( not ( = ?auto_183246 ?auto_183248 ) ) ( not ( = ?auto_183246 ?auto_183249 ) ) ( not ( = ?auto_183246 ?auto_183250 ) ) ( not ( = ?auto_183246 ?auto_183251 ) ) ( not ( = ?auto_183246 ?auto_183252 ) ) ( not ( = ?auto_183246 ?auto_183253 ) ) ( not ( = ?auto_183247 ?auto_183248 ) ) ( not ( = ?auto_183247 ?auto_183249 ) ) ( not ( = ?auto_183247 ?auto_183250 ) ) ( not ( = ?auto_183247 ?auto_183251 ) ) ( not ( = ?auto_183247 ?auto_183252 ) ) ( not ( = ?auto_183247 ?auto_183253 ) ) ( not ( = ?auto_183248 ?auto_183249 ) ) ( not ( = ?auto_183248 ?auto_183250 ) ) ( not ( = ?auto_183248 ?auto_183251 ) ) ( not ( = ?auto_183248 ?auto_183252 ) ) ( not ( = ?auto_183248 ?auto_183253 ) ) ( not ( = ?auto_183249 ?auto_183250 ) ) ( not ( = ?auto_183249 ?auto_183251 ) ) ( not ( = ?auto_183249 ?auto_183252 ) ) ( not ( = ?auto_183249 ?auto_183253 ) ) ( not ( = ?auto_183250 ?auto_183251 ) ) ( not ( = ?auto_183250 ?auto_183252 ) ) ( not ( = ?auto_183250 ?auto_183253 ) ) ( not ( = ?auto_183251 ?auto_183252 ) ) ( not ( = ?auto_183251 ?auto_183253 ) ) ( not ( = ?auto_183252 ?auto_183253 ) ) ( ON ?auto_183252 ?auto_183253 ) ( ON ?auto_183251 ?auto_183252 ) ( ON ?auto_183250 ?auto_183251 ) ( ON ?auto_183249 ?auto_183250 ) ( ON ?auto_183248 ?auto_183249 ) ( ON ?auto_183247 ?auto_183248 ) ( ON ?auto_183246 ?auto_183247 ) ( ON ?auto_183245 ?auto_183246 ) ( ON ?auto_183244 ?auto_183245 ) ( CLEAR ?auto_183242 ) ( ON ?auto_183243 ?auto_183244 ) ( CLEAR ?auto_183243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183242 ?auto_183243 )
      ( MAKE-12PILE ?auto_183242 ?auto_183243 ?auto_183244 ?auto_183245 ?auto_183246 ?auto_183247 ?auto_183248 ?auto_183249 ?auto_183250 ?auto_183251 ?auto_183252 ?auto_183253 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_183266 - BLOCK
      ?auto_183267 - BLOCK
      ?auto_183268 - BLOCK
      ?auto_183269 - BLOCK
      ?auto_183270 - BLOCK
      ?auto_183271 - BLOCK
      ?auto_183272 - BLOCK
      ?auto_183273 - BLOCK
      ?auto_183274 - BLOCK
      ?auto_183275 - BLOCK
      ?auto_183276 - BLOCK
      ?auto_183277 - BLOCK
    )
    :vars
    (
      ?auto_183278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183277 ?auto_183278 ) ( not ( = ?auto_183266 ?auto_183267 ) ) ( not ( = ?auto_183266 ?auto_183268 ) ) ( not ( = ?auto_183266 ?auto_183269 ) ) ( not ( = ?auto_183266 ?auto_183270 ) ) ( not ( = ?auto_183266 ?auto_183271 ) ) ( not ( = ?auto_183266 ?auto_183272 ) ) ( not ( = ?auto_183266 ?auto_183273 ) ) ( not ( = ?auto_183266 ?auto_183274 ) ) ( not ( = ?auto_183266 ?auto_183275 ) ) ( not ( = ?auto_183266 ?auto_183276 ) ) ( not ( = ?auto_183266 ?auto_183277 ) ) ( not ( = ?auto_183266 ?auto_183278 ) ) ( not ( = ?auto_183267 ?auto_183268 ) ) ( not ( = ?auto_183267 ?auto_183269 ) ) ( not ( = ?auto_183267 ?auto_183270 ) ) ( not ( = ?auto_183267 ?auto_183271 ) ) ( not ( = ?auto_183267 ?auto_183272 ) ) ( not ( = ?auto_183267 ?auto_183273 ) ) ( not ( = ?auto_183267 ?auto_183274 ) ) ( not ( = ?auto_183267 ?auto_183275 ) ) ( not ( = ?auto_183267 ?auto_183276 ) ) ( not ( = ?auto_183267 ?auto_183277 ) ) ( not ( = ?auto_183267 ?auto_183278 ) ) ( not ( = ?auto_183268 ?auto_183269 ) ) ( not ( = ?auto_183268 ?auto_183270 ) ) ( not ( = ?auto_183268 ?auto_183271 ) ) ( not ( = ?auto_183268 ?auto_183272 ) ) ( not ( = ?auto_183268 ?auto_183273 ) ) ( not ( = ?auto_183268 ?auto_183274 ) ) ( not ( = ?auto_183268 ?auto_183275 ) ) ( not ( = ?auto_183268 ?auto_183276 ) ) ( not ( = ?auto_183268 ?auto_183277 ) ) ( not ( = ?auto_183268 ?auto_183278 ) ) ( not ( = ?auto_183269 ?auto_183270 ) ) ( not ( = ?auto_183269 ?auto_183271 ) ) ( not ( = ?auto_183269 ?auto_183272 ) ) ( not ( = ?auto_183269 ?auto_183273 ) ) ( not ( = ?auto_183269 ?auto_183274 ) ) ( not ( = ?auto_183269 ?auto_183275 ) ) ( not ( = ?auto_183269 ?auto_183276 ) ) ( not ( = ?auto_183269 ?auto_183277 ) ) ( not ( = ?auto_183269 ?auto_183278 ) ) ( not ( = ?auto_183270 ?auto_183271 ) ) ( not ( = ?auto_183270 ?auto_183272 ) ) ( not ( = ?auto_183270 ?auto_183273 ) ) ( not ( = ?auto_183270 ?auto_183274 ) ) ( not ( = ?auto_183270 ?auto_183275 ) ) ( not ( = ?auto_183270 ?auto_183276 ) ) ( not ( = ?auto_183270 ?auto_183277 ) ) ( not ( = ?auto_183270 ?auto_183278 ) ) ( not ( = ?auto_183271 ?auto_183272 ) ) ( not ( = ?auto_183271 ?auto_183273 ) ) ( not ( = ?auto_183271 ?auto_183274 ) ) ( not ( = ?auto_183271 ?auto_183275 ) ) ( not ( = ?auto_183271 ?auto_183276 ) ) ( not ( = ?auto_183271 ?auto_183277 ) ) ( not ( = ?auto_183271 ?auto_183278 ) ) ( not ( = ?auto_183272 ?auto_183273 ) ) ( not ( = ?auto_183272 ?auto_183274 ) ) ( not ( = ?auto_183272 ?auto_183275 ) ) ( not ( = ?auto_183272 ?auto_183276 ) ) ( not ( = ?auto_183272 ?auto_183277 ) ) ( not ( = ?auto_183272 ?auto_183278 ) ) ( not ( = ?auto_183273 ?auto_183274 ) ) ( not ( = ?auto_183273 ?auto_183275 ) ) ( not ( = ?auto_183273 ?auto_183276 ) ) ( not ( = ?auto_183273 ?auto_183277 ) ) ( not ( = ?auto_183273 ?auto_183278 ) ) ( not ( = ?auto_183274 ?auto_183275 ) ) ( not ( = ?auto_183274 ?auto_183276 ) ) ( not ( = ?auto_183274 ?auto_183277 ) ) ( not ( = ?auto_183274 ?auto_183278 ) ) ( not ( = ?auto_183275 ?auto_183276 ) ) ( not ( = ?auto_183275 ?auto_183277 ) ) ( not ( = ?auto_183275 ?auto_183278 ) ) ( not ( = ?auto_183276 ?auto_183277 ) ) ( not ( = ?auto_183276 ?auto_183278 ) ) ( not ( = ?auto_183277 ?auto_183278 ) ) ( ON ?auto_183276 ?auto_183277 ) ( ON ?auto_183275 ?auto_183276 ) ( ON ?auto_183274 ?auto_183275 ) ( ON ?auto_183273 ?auto_183274 ) ( ON ?auto_183272 ?auto_183273 ) ( ON ?auto_183271 ?auto_183272 ) ( ON ?auto_183270 ?auto_183271 ) ( ON ?auto_183269 ?auto_183270 ) ( ON ?auto_183268 ?auto_183269 ) ( ON ?auto_183267 ?auto_183268 ) ( ON ?auto_183266 ?auto_183267 ) ( CLEAR ?auto_183266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183266 )
      ( MAKE-12PILE ?auto_183266 ?auto_183267 ?auto_183268 ?auto_183269 ?auto_183270 ?auto_183271 ?auto_183272 ?auto_183273 ?auto_183274 ?auto_183275 ?auto_183276 ?auto_183277 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_183291 - BLOCK
      ?auto_183292 - BLOCK
      ?auto_183293 - BLOCK
      ?auto_183294 - BLOCK
      ?auto_183295 - BLOCK
      ?auto_183296 - BLOCK
      ?auto_183297 - BLOCK
      ?auto_183298 - BLOCK
      ?auto_183299 - BLOCK
      ?auto_183300 - BLOCK
      ?auto_183301 - BLOCK
      ?auto_183302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183302 ) ( not ( = ?auto_183291 ?auto_183292 ) ) ( not ( = ?auto_183291 ?auto_183293 ) ) ( not ( = ?auto_183291 ?auto_183294 ) ) ( not ( = ?auto_183291 ?auto_183295 ) ) ( not ( = ?auto_183291 ?auto_183296 ) ) ( not ( = ?auto_183291 ?auto_183297 ) ) ( not ( = ?auto_183291 ?auto_183298 ) ) ( not ( = ?auto_183291 ?auto_183299 ) ) ( not ( = ?auto_183291 ?auto_183300 ) ) ( not ( = ?auto_183291 ?auto_183301 ) ) ( not ( = ?auto_183291 ?auto_183302 ) ) ( not ( = ?auto_183292 ?auto_183293 ) ) ( not ( = ?auto_183292 ?auto_183294 ) ) ( not ( = ?auto_183292 ?auto_183295 ) ) ( not ( = ?auto_183292 ?auto_183296 ) ) ( not ( = ?auto_183292 ?auto_183297 ) ) ( not ( = ?auto_183292 ?auto_183298 ) ) ( not ( = ?auto_183292 ?auto_183299 ) ) ( not ( = ?auto_183292 ?auto_183300 ) ) ( not ( = ?auto_183292 ?auto_183301 ) ) ( not ( = ?auto_183292 ?auto_183302 ) ) ( not ( = ?auto_183293 ?auto_183294 ) ) ( not ( = ?auto_183293 ?auto_183295 ) ) ( not ( = ?auto_183293 ?auto_183296 ) ) ( not ( = ?auto_183293 ?auto_183297 ) ) ( not ( = ?auto_183293 ?auto_183298 ) ) ( not ( = ?auto_183293 ?auto_183299 ) ) ( not ( = ?auto_183293 ?auto_183300 ) ) ( not ( = ?auto_183293 ?auto_183301 ) ) ( not ( = ?auto_183293 ?auto_183302 ) ) ( not ( = ?auto_183294 ?auto_183295 ) ) ( not ( = ?auto_183294 ?auto_183296 ) ) ( not ( = ?auto_183294 ?auto_183297 ) ) ( not ( = ?auto_183294 ?auto_183298 ) ) ( not ( = ?auto_183294 ?auto_183299 ) ) ( not ( = ?auto_183294 ?auto_183300 ) ) ( not ( = ?auto_183294 ?auto_183301 ) ) ( not ( = ?auto_183294 ?auto_183302 ) ) ( not ( = ?auto_183295 ?auto_183296 ) ) ( not ( = ?auto_183295 ?auto_183297 ) ) ( not ( = ?auto_183295 ?auto_183298 ) ) ( not ( = ?auto_183295 ?auto_183299 ) ) ( not ( = ?auto_183295 ?auto_183300 ) ) ( not ( = ?auto_183295 ?auto_183301 ) ) ( not ( = ?auto_183295 ?auto_183302 ) ) ( not ( = ?auto_183296 ?auto_183297 ) ) ( not ( = ?auto_183296 ?auto_183298 ) ) ( not ( = ?auto_183296 ?auto_183299 ) ) ( not ( = ?auto_183296 ?auto_183300 ) ) ( not ( = ?auto_183296 ?auto_183301 ) ) ( not ( = ?auto_183296 ?auto_183302 ) ) ( not ( = ?auto_183297 ?auto_183298 ) ) ( not ( = ?auto_183297 ?auto_183299 ) ) ( not ( = ?auto_183297 ?auto_183300 ) ) ( not ( = ?auto_183297 ?auto_183301 ) ) ( not ( = ?auto_183297 ?auto_183302 ) ) ( not ( = ?auto_183298 ?auto_183299 ) ) ( not ( = ?auto_183298 ?auto_183300 ) ) ( not ( = ?auto_183298 ?auto_183301 ) ) ( not ( = ?auto_183298 ?auto_183302 ) ) ( not ( = ?auto_183299 ?auto_183300 ) ) ( not ( = ?auto_183299 ?auto_183301 ) ) ( not ( = ?auto_183299 ?auto_183302 ) ) ( not ( = ?auto_183300 ?auto_183301 ) ) ( not ( = ?auto_183300 ?auto_183302 ) ) ( not ( = ?auto_183301 ?auto_183302 ) ) ( ON ?auto_183301 ?auto_183302 ) ( ON ?auto_183300 ?auto_183301 ) ( ON ?auto_183299 ?auto_183300 ) ( ON ?auto_183298 ?auto_183299 ) ( ON ?auto_183297 ?auto_183298 ) ( ON ?auto_183296 ?auto_183297 ) ( ON ?auto_183295 ?auto_183296 ) ( ON ?auto_183294 ?auto_183295 ) ( ON ?auto_183293 ?auto_183294 ) ( ON ?auto_183292 ?auto_183293 ) ( ON ?auto_183291 ?auto_183292 ) ( CLEAR ?auto_183291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183291 )
      ( MAKE-12PILE ?auto_183291 ?auto_183292 ?auto_183293 ?auto_183294 ?auto_183295 ?auto_183296 ?auto_183297 ?auto_183298 ?auto_183299 ?auto_183300 ?auto_183301 ?auto_183302 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_183315 - BLOCK
      ?auto_183316 - BLOCK
      ?auto_183317 - BLOCK
      ?auto_183318 - BLOCK
      ?auto_183319 - BLOCK
      ?auto_183320 - BLOCK
      ?auto_183321 - BLOCK
      ?auto_183322 - BLOCK
      ?auto_183323 - BLOCK
      ?auto_183324 - BLOCK
      ?auto_183325 - BLOCK
      ?auto_183326 - BLOCK
    )
    :vars
    (
      ?auto_183327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183315 ?auto_183316 ) ) ( not ( = ?auto_183315 ?auto_183317 ) ) ( not ( = ?auto_183315 ?auto_183318 ) ) ( not ( = ?auto_183315 ?auto_183319 ) ) ( not ( = ?auto_183315 ?auto_183320 ) ) ( not ( = ?auto_183315 ?auto_183321 ) ) ( not ( = ?auto_183315 ?auto_183322 ) ) ( not ( = ?auto_183315 ?auto_183323 ) ) ( not ( = ?auto_183315 ?auto_183324 ) ) ( not ( = ?auto_183315 ?auto_183325 ) ) ( not ( = ?auto_183315 ?auto_183326 ) ) ( not ( = ?auto_183316 ?auto_183317 ) ) ( not ( = ?auto_183316 ?auto_183318 ) ) ( not ( = ?auto_183316 ?auto_183319 ) ) ( not ( = ?auto_183316 ?auto_183320 ) ) ( not ( = ?auto_183316 ?auto_183321 ) ) ( not ( = ?auto_183316 ?auto_183322 ) ) ( not ( = ?auto_183316 ?auto_183323 ) ) ( not ( = ?auto_183316 ?auto_183324 ) ) ( not ( = ?auto_183316 ?auto_183325 ) ) ( not ( = ?auto_183316 ?auto_183326 ) ) ( not ( = ?auto_183317 ?auto_183318 ) ) ( not ( = ?auto_183317 ?auto_183319 ) ) ( not ( = ?auto_183317 ?auto_183320 ) ) ( not ( = ?auto_183317 ?auto_183321 ) ) ( not ( = ?auto_183317 ?auto_183322 ) ) ( not ( = ?auto_183317 ?auto_183323 ) ) ( not ( = ?auto_183317 ?auto_183324 ) ) ( not ( = ?auto_183317 ?auto_183325 ) ) ( not ( = ?auto_183317 ?auto_183326 ) ) ( not ( = ?auto_183318 ?auto_183319 ) ) ( not ( = ?auto_183318 ?auto_183320 ) ) ( not ( = ?auto_183318 ?auto_183321 ) ) ( not ( = ?auto_183318 ?auto_183322 ) ) ( not ( = ?auto_183318 ?auto_183323 ) ) ( not ( = ?auto_183318 ?auto_183324 ) ) ( not ( = ?auto_183318 ?auto_183325 ) ) ( not ( = ?auto_183318 ?auto_183326 ) ) ( not ( = ?auto_183319 ?auto_183320 ) ) ( not ( = ?auto_183319 ?auto_183321 ) ) ( not ( = ?auto_183319 ?auto_183322 ) ) ( not ( = ?auto_183319 ?auto_183323 ) ) ( not ( = ?auto_183319 ?auto_183324 ) ) ( not ( = ?auto_183319 ?auto_183325 ) ) ( not ( = ?auto_183319 ?auto_183326 ) ) ( not ( = ?auto_183320 ?auto_183321 ) ) ( not ( = ?auto_183320 ?auto_183322 ) ) ( not ( = ?auto_183320 ?auto_183323 ) ) ( not ( = ?auto_183320 ?auto_183324 ) ) ( not ( = ?auto_183320 ?auto_183325 ) ) ( not ( = ?auto_183320 ?auto_183326 ) ) ( not ( = ?auto_183321 ?auto_183322 ) ) ( not ( = ?auto_183321 ?auto_183323 ) ) ( not ( = ?auto_183321 ?auto_183324 ) ) ( not ( = ?auto_183321 ?auto_183325 ) ) ( not ( = ?auto_183321 ?auto_183326 ) ) ( not ( = ?auto_183322 ?auto_183323 ) ) ( not ( = ?auto_183322 ?auto_183324 ) ) ( not ( = ?auto_183322 ?auto_183325 ) ) ( not ( = ?auto_183322 ?auto_183326 ) ) ( not ( = ?auto_183323 ?auto_183324 ) ) ( not ( = ?auto_183323 ?auto_183325 ) ) ( not ( = ?auto_183323 ?auto_183326 ) ) ( not ( = ?auto_183324 ?auto_183325 ) ) ( not ( = ?auto_183324 ?auto_183326 ) ) ( not ( = ?auto_183325 ?auto_183326 ) ) ( ON ?auto_183315 ?auto_183327 ) ( not ( = ?auto_183326 ?auto_183327 ) ) ( not ( = ?auto_183325 ?auto_183327 ) ) ( not ( = ?auto_183324 ?auto_183327 ) ) ( not ( = ?auto_183323 ?auto_183327 ) ) ( not ( = ?auto_183322 ?auto_183327 ) ) ( not ( = ?auto_183321 ?auto_183327 ) ) ( not ( = ?auto_183320 ?auto_183327 ) ) ( not ( = ?auto_183319 ?auto_183327 ) ) ( not ( = ?auto_183318 ?auto_183327 ) ) ( not ( = ?auto_183317 ?auto_183327 ) ) ( not ( = ?auto_183316 ?auto_183327 ) ) ( not ( = ?auto_183315 ?auto_183327 ) ) ( ON ?auto_183316 ?auto_183315 ) ( ON ?auto_183317 ?auto_183316 ) ( ON ?auto_183318 ?auto_183317 ) ( ON ?auto_183319 ?auto_183318 ) ( ON ?auto_183320 ?auto_183319 ) ( ON ?auto_183321 ?auto_183320 ) ( ON ?auto_183322 ?auto_183321 ) ( ON ?auto_183323 ?auto_183322 ) ( ON ?auto_183324 ?auto_183323 ) ( ON ?auto_183325 ?auto_183324 ) ( ON ?auto_183326 ?auto_183325 ) ( CLEAR ?auto_183326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_183326 ?auto_183325 ?auto_183324 ?auto_183323 ?auto_183322 ?auto_183321 ?auto_183320 ?auto_183319 ?auto_183318 ?auto_183317 ?auto_183316 ?auto_183315 )
      ( MAKE-12PILE ?auto_183315 ?auto_183316 ?auto_183317 ?auto_183318 ?auto_183319 ?auto_183320 ?auto_183321 ?auto_183322 ?auto_183323 ?auto_183324 ?auto_183325 ?auto_183326 ) )
  )

)

