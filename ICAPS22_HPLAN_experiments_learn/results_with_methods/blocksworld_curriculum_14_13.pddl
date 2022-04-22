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
      ?auto_330626 - BLOCK
    )
    :vars
    (
      ?auto_330627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330626 ?auto_330627 ) ( CLEAR ?auto_330626 ) ( HAND-EMPTY ) ( not ( = ?auto_330626 ?auto_330627 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_330626 ?auto_330627 )
      ( !PUTDOWN ?auto_330626 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_330629 - BLOCK
    )
    :vars
    (
      ?auto_330630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330629 ?auto_330630 ) ( CLEAR ?auto_330629 ) ( HAND-EMPTY ) ( not ( = ?auto_330629 ?auto_330630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_330629 ?auto_330630 )
      ( !PUTDOWN ?auto_330629 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_330633 - BLOCK
      ?auto_330634 - BLOCK
    )
    :vars
    (
      ?auto_330635 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_330633 ) ( ON ?auto_330634 ?auto_330635 ) ( CLEAR ?auto_330634 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_330633 ) ( not ( = ?auto_330633 ?auto_330634 ) ) ( not ( = ?auto_330633 ?auto_330635 ) ) ( not ( = ?auto_330634 ?auto_330635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_330634 ?auto_330635 )
      ( !STACK ?auto_330634 ?auto_330633 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_330638 - BLOCK
      ?auto_330639 - BLOCK
    )
    :vars
    (
      ?auto_330640 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_330638 ) ( ON ?auto_330639 ?auto_330640 ) ( CLEAR ?auto_330639 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_330638 ) ( not ( = ?auto_330638 ?auto_330639 ) ) ( not ( = ?auto_330638 ?auto_330640 ) ) ( not ( = ?auto_330639 ?auto_330640 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_330639 ?auto_330640 )
      ( !STACK ?auto_330639 ?auto_330638 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_330643 - BLOCK
      ?auto_330644 - BLOCK
    )
    :vars
    (
      ?auto_330645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330644 ?auto_330645 ) ( not ( = ?auto_330643 ?auto_330644 ) ) ( not ( = ?auto_330643 ?auto_330645 ) ) ( not ( = ?auto_330644 ?auto_330645 ) ) ( ON ?auto_330643 ?auto_330644 ) ( CLEAR ?auto_330643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_330643 )
      ( MAKE-2PILE ?auto_330643 ?auto_330644 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_330648 - BLOCK
      ?auto_330649 - BLOCK
    )
    :vars
    (
      ?auto_330650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330649 ?auto_330650 ) ( not ( = ?auto_330648 ?auto_330649 ) ) ( not ( = ?auto_330648 ?auto_330650 ) ) ( not ( = ?auto_330649 ?auto_330650 ) ) ( ON ?auto_330648 ?auto_330649 ) ( CLEAR ?auto_330648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_330648 )
      ( MAKE-2PILE ?auto_330648 ?auto_330649 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_330654 - BLOCK
      ?auto_330655 - BLOCK
      ?auto_330656 - BLOCK
    )
    :vars
    (
      ?auto_330657 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_330655 ) ( ON ?auto_330656 ?auto_330657 ) ( CLEAR ?auto_330656 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_330654 ) ( ON ?auto_330655 ?auto_330654 ) ( not ( = ?auto_330654 ?auto_330655 ) ) ( not ( = ?auto_330654 ?auto_330656 ) ) ( not ( = ?auto_330654 ?auto_330657 ) ) ( not ( = ?auto_330655 ?auto_330656 ) ) ( not ( = ?auto_330655 ?auto_330657 ) ) ( not ( = ?auto_330656 ?auto_330657 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_330656 ?auto_330657 )
      ( !STACK ?auto_330656 ?auto_330655 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_330661 - BLOCK
      ?auto_330662 - BLOCK
      ?auto_330663 - BLOCK
    )
    :vars
    (
      ?auto_330664 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_330662 ) ( ON ?auto_330663 ?auto_330664 ) ( CLEAR ?auto_330663 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_330661 ) ( ON ?auto_330662 ?auto_330661 ) ( not ( = ?auto_330661 ?auto_330662 ) ) ( not ( = ?auto_330661 ?auto_330663 ) ) ( not ( = ?auto_330661 ?auto_330664 ) ) ( not ( = ?auto_330662 ?auto_330663 ) ) ( not ( = ?auto_330662 ?auto_330664 ) ) ( not ( = ?auto_330663 ?auto_330664 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_330663 ?auto_330664 )
      ( !STACK ?auto_330663 ?auto_330662 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_330668 - BLOCK
      ?auto_330669 - BLOCK
      ?auto_330670 - BLOCK
    )
    :vars
    (
      ?auto_330671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330670 ?auto_330671 ) ( ON-TABLE ?auto_330668 ) ( not ( = ?auto_330668 ?auto_330669 ) ) ( not ( = ?auto_330668 ?auto_330670 ) ) ( not ( = ?auto_330668 ?auto_330671 ) ) ( not ( = ?auto_330669 ?auto_330670 ) ) ( not ( = ?auto_330669 ?auto_330671 ) ) ( not ( = ?auto_330670 ?auto_330671 ) ) ( CLEAR ?auto_330668 ) ( ON ?auto_330669 ?auto_330670 ) ( CLEAR ?auto_330669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_330668 ?auto_330669 )
      ( MAKE-3PILE ?auto_330668 ?auto_330669 ?auto_330670 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_330675 - BLOCK
      ?auto_330676 - BLOCK
      ?auto_330677 - BLOCK
    )
    :vars
    (
      ?auto_330678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330677 ?auto_330678 ) ( ON-TABLE ?auto_330675 ) ( not ( = ?auto_330675 ?auto_330676 ) ) ( not ( = ?auto_330675 ?auto_330677 ) ) ( not ( = ?auto_330675 ?auto_330678 ) ) ( not ( = ?auto_330676 ?auto_330677 ) ) ( not ( = ?auto_330676 ?auto_330678 ) ) ( not ( = ?auto_330677 ?auto_330678 ) ) ( CLEAR ?auto_330675 ) ( ON ?auto_330676 ?auto_330677 ) ( CLEAR ?auto_330676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_330675 ?auto_330676 )
      ( MAKE-3PILE ?auto_330675 ?auto_330676 ?auto_330677 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_330682 - BLOCK
      ?auto_330683 - BLOCK
      ?auto_330684 - BLOCK
    )
    :vars
    (
      ?auto_330685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330684 ?auto_330685 ) ( not ( = ?auto_330682 ?auto_330683 ) ) ( not ( = ?auto_330682 ?auto_330684 ) ) ( not ( = ?auto_330682 ?auto_330685 ) ) ( not ( = ?auto_330683 ?auto_330684 ) ) ( not ( = ?auto_330683 ?auto_330685 ) ) ( not ( = ?auto_330684 ?auto_330685 ) ) ( ON ?auto_330683 ?auto_330684 ) ( ON ?auto_330682 ?auto_330683 ) ( CLEAR ?auto_330682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_330682 )
      ( MAKE-3PILE ?auto_330682 ?auto_330683 ?auto_330684 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_330689 - BLOCK
      ?auto_330690 - BLOCK
      ?auto_330691 - BLOCK
    )
    :vars
    (
      ?auto_330692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330691 ?auto_330692 ) ( not ( = ?auto_330689 ?auto_330690 ) ) ( not ( = ?auto_330689 ?auto_330691 ) ) ( not ( = ?auto_330689 ?auto_330692 ) ) ( not ( = ?auto_330690 ?auto_330691 ) ) ( not ( = ?auto_330690 ?auto_330692 ) ) ( not ( = ?auto_330691 ?auto_330692 ) ) ( ON ?auto_330690 ?auto_330691 ) ( ON ?auto_330689 ?auto_330690 ) ( CLEAR ?auto_330689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_330689 )
      ( MAKE-3PILE ?auto_330689 ?auto_330690 ?auto_330691 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_330697 - BLOCK
      ?auto_330698 - BLOCK
      ?auto_330699 - BLOCK
      ?auto_330700 - BLOCK
    )
    :vars
    (
      ?auto_330701 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_330699 ) ( ON ?auto_330700 ?auto_330701 ) ( CLEAR ?auto_330700 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_330697 ) ( ON ?auto_330698 ?auto_330697 ) ( ON ?auto_330699 ?auto_330698 ) ( not ( = ?auto_330697 ?auto_330698 ) ) ( not ( = ?auto_330697 ?auto_330699 ) ) ( not ( = ?auto_330697 ?auto_330700 ) ) ( not ( = ?auto_330697 ?auto_330701 ) ) ( not ( = ?auto_330698 ?auto_330699 ) ) ( not ( = ?auto_330698 ?auto_330700 ) ) ( not ( = ?auto_330698 ?auto_330701 ) ) ( not ( = ?auto_330699 ?auto_330700 ) ) ( not ( = ?auto_330699 ?auto_330701 ) ) ( not ( = ?auto_330700 ?auto_330701 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_330700 ?auto_330701 )
      ( !STACK ?auto_330700 ?auto_330699 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_330706 - BLOCK
      ?auto_330707 - BLOCK
      ?auto_330708 - BLOCK
      ?auto_330709 - BLOCK
    )
    :vars
    (
      ?auto_330710 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_330708 ) ( ON ?auto_330709 ?auto_330710 ) ( CLEAR ?auto_330709 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_330706 ) ( ON ?auto_330707 ?auto_330706 ) ( ON ?auto_330708 ?auto_330707 ) ( not ( = ?auto_330706 ?auto_330707 ) ) ( not ( = ?auto_330706 ?auto_330708 ) ) ( not ( = ?auto_330706 ?auto_330709 ) ) ( not ( = ?auto_330706 ?auto_330710 ) ) ( not ( = ?auto_330707 ?auto_330708 ) ) ( not ( = ?auto_330707 ?auto_330709 ) ) ( not ( = ?auto_330707 ?auto_330710 ) ) ( not ( = ?auto_330708 ?auto_330709 ) ) ( not ( = ?auto_330708 ?auto_330710 ) ) ( not ( = ?auto_330709 ?auto_330710 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_330709 ?auto_330710 )
      ( !STACK ?auto_330709 ?auto_330708 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_330715 - BLOCK
      ?auto_330716 - BLOCK
      ?auto_330717 - BLOCK
      ?auto_330718 - BLOCK
    )
    :vars
    (
      ?auto_330719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330718 ?auto_330719 ) ( ON-TABLE ?auto_330715 ) ( ON ?auto_330716 ?auto_330715 ) ( not ( = ?auto_330715 ?auto_330716 ) ) ( not ( = ?auto_330715 ?auto_330717 ) ) ( not ( = ?auto_330715 ?auto_330718 ) ) ( not ( = ?auto_330715 ?auto_330719 ) ) ( not ( = ?auto_330716 ?auto_330717 ) ) ( not ( = ?auto_330716 ?auto_330718 ) ) ( not ( = ?auto_330716 ?auto_330719 ) ) ( not ( = ?auto_330717 ?auto_330718 ) ) ( not ( = ?auto_330717 ?auto_330719 ) ) ( not ( = ?auto_330718 ?auto_330719 ) ) ( CLEAR ?auto_330716 ) ( ON ?auto_330717 ?auto_330718 ) ( CLEAR ?auto_330717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_330715 ?auto_330716 ?auto_330717 )
      ( MAKE-4PILE ?auto_330715 ?auto_330716 ?auto_330717 ?auto_330718 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_330724 - BLOCK
      ?auto_330725 - BLOCK
      ?auto_330726 - BLOCK
      ?auto_330727 - BLOCK
    )
    :vars
    (
      ?auto_330728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330727 ?auto_330728 ) ( ON-TABLE ?auto_330724 ) ( ON ?auto_330725 ?auto_330724 ) ( not ( = ?auto_330724 ?auto_330725 ) ) ( not ( = ?auto_330724 ?auto_330726 ) ) ( not ( = ?auto_330724 ?auto_330727 ) ) ( not ( = ?auto_330724 ?auto_330728 ) ) ( not ( = ?auto_330725 ?auto_330726 ) ) ( not ( = ?auto_330725 ?auto_330727 ) ) ( not ( = ?auto_330725 ?auto_330728 ) ) ( not ( = ?auto_330726 ?auto_330727 ) ) ( not ( = ?auto_330726 ?auto_330728 ) ) ( not ( = ?auto_330727 ?auto_330728 ) ) ( CLEAR ?auto_330725 ) ( ON ?auto_330726 ?auto_330727 ) ( CLEAR ?auto_330726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_330724 ?auto_330725 ?auto_330726 )
      ( MAKE-4PILE ?auto_330724 ?auto_330725 ?auto_330726 ?auto_330727 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_330733 - BLOCK
      ?auto_330734 - BLOCK
      ?auto_330735 - BLOCK
      ?auto_330736 - BLOCK
    )
    :vars
    (
      ?auto_330737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330736 ?auto_330737 ) ( ON-TABLE ?auto_330733 ) ( not ( = ?auto_330733 ?auto_330734 ) ) ( not ( = ?auto_330733 ?auto_330735 ) ) ( not ( = ?auto_330733 ?auto_330736 ) ) ( not ( = ?auto_330733 ?auto_330737 ) ) ( not ( = ?auto_330734 ?auto_330735 ) ) ( not ( = ?auto_330734 ?auto_330736 ) ) ( not ( = ?auto_330734 ?auto_330737 ) ) ( not ( = ?auto_330735 ?auto_330736 ) ) ( not ( = ?auto_330735 ?auto_330737 ) ) ( not ( = ?auto_330736 ?auto_330737 ) ) ( ON ?auto_330735 ?auto_330736 ) ( CLEAR ?auto_330733 ) ( ON ?auto_330734 ?auto_330735 ) ( CLEAR ?auto_330734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_330733 ?auto_330734 )
      ( MAKE-4PILE ?auto_330733 ?auto_330734 ?auto_330735 ?auto_330736 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_330742 - BLOCK
      ?auto_330743 - BLOCK
      ?auto_330744 - BLOCK
      ?auto_330745 - BLOCK
    )
    :vars
    (
      ?auto_330746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330745 ?auto_330746 ) ( ON-TABLE ?auto_330742 ) ( not ( = ?auto_330742 ?auto_330743 ) ) ( not ( = ?auto_330742 ?auto_330744 ) ) ( not ( = ?auto_330742 ?auto_330745 ) ) ( not ( = ?auto_330742 ?auto_330746 ) ) ( not ( = ?auto_330743 ?auto_330744 ) ) ( not ( = ?auto_330743 ?auto_330745 ) ) ( not ( = ?auto_330743 ?auto_330746 ) ) ( not ( = ?auto_330744 ?auto_330745 ) ) ( not ( = ?auto_330744 ?auto_330746 ) ) ( not ( = ?auto_330745 ?auto_330746 ) ) ( ON ?auto_330744 ?auto_330745 ) ( CLEAR ?auto_330742 ) ( ON ?auto_330743 ?auto_330744 ) ( CLEAR ?auto_330743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_330742 ?auto_330743 )
      ( MAKE-4PILE ?auto_330742 ?auto_330743 ?auto_330744 ?auto_330745 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_330751 - BLOCK
      ?auto_330752 - BLOCK
      ?auto_330753 - BLOCK
      ?auto_330754 - BLOCK
    )
    :vars
    (
      ?auto_330755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330754 ?auto_330755 ) ( not ( = ?auto_330751 ?auto_330752 ) ) ( not ( = ?auto_330751 ?auto_330753 ) ) ( not ( = ?auto_330751 ?auto_330754 ) ) ( not ( = ?auto_330751 ?auto_330755 ) ) ( not ( = ?auto_330752 ?auto_330753 ) ) ( not ( = ?auto_330752 ?auto_330754 ) ) ( not ( = ?auto_330752 ?auto_330755 ) ) ( not ( = ?auto_330753 ?auto_330754 ) ) ( not ( = ?auto_330753 ?auto_330755 ) ) ( not ( = ?auto_330754 ?auto_330755 ) ) ( ON ?auto_330753 ?auto_330754 ) ( ON ?auto_330752 ?auto_330753 ) ( ON ?auto_330751 ?auto_330752 ) ( CLEAR ?auto_330751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_330751 )
      ( MAKE-4PILE ?auto_330751 ?auto_330752 ?auto_330753 ?auto_330754 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_330760 - BLOCK
      ?auto_330761 - BLOCK
      ?auto_330762 - BLOCK
      ?auto_330763 - BLOCK
    )
    :vars
    (
      ?auto_330764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330763 ?auto_330764 ) ( not ( = ?auto_330760 ?auto_330761 ) ) ( not ( = ?auto_330760 ?auto_330762 ) ) ( not ( = ?auto_330760 ?auto_330763 ) ) ( not ( = ?auto_330760 ?auto_330764 ) ) ( not ( = ?auto_330761 ?auto_330762 ) ) ( not ( = ?auto_330761 ?auto_330763 ) ) ( not ( = ?auto_330761 ?auto_330764 ) ) ( not ( = ?auto_330762 ?auto_330763 ) ) ( not ( = ?auto_330762 ?auto_330764 ) ) ( not ( = ?auto_330763 ?auto_330764 ) ) ( ON ?auto_330762 ?auto_330763 ) ( ON ?auto_330761 ?auto_330762 ) ( ON ?auto_330760 ?auto_330761 ) ( CLEAR ?auto_330760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_330760 )
      ( MAKE-4PILE ?auto_330760 ?auto_330761 ?auto_330762 ?auto_330763 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_330770 - BLOCK
      ?auto_330771 - BLOCK
      ?auto_330772 - BLOCK
      ?auto_330773 - BLOCK
      ?auto_330774 - BLOCK
    )
    :vars
    (
      ?auto_330775 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_330773 ) ( ON ?auto_330774 ?auto_330775 ) ( CLEAR ?auto_330774 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_330770 ) ( ON ?auto_330771 ?auto_330770 ) ( ON ?auto_330772 ?auto_330771 ) ( ON ?auto_330773 ?auto_330772 ) ( not ( = ?auto_330770 ?auto_330771 ) ) ( not ( = ?auto_330770 ?auto_330772 ) ) ( not ( = ?auto_330770 ?auto_330773 ) ) ( not ( = ?auto_330770 ?auto_330774 ) ) ( not ( = ?auto_330770 ?auto_330775 ) ) ( not ( = ?auto_330771 ?auto_330772 ) ) ( not ( = ?auto_330771 ?auto_330773 ) ) ( not ( = ?auto_330771 ?auto_330774 ) ) ( not ( = ?auto_330771 ?auto_330775 ) ) ( not ( = ?auto_330772 ?auto_330773 ) ) ( not ( = ?auto_330772 ?auto_330774 ) ) ( not ( = ?auto_330772 ?auto_330775 ) ) ( not ( = ?auto_330773 ?auto_330774 ) ) ( not ( = ?auto_330773 ?auto_330775 ) ) ( not ( = ?auto_330774 ?auto_330775 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_330774 ?auto_330775 )
      ( !STACK ?auto_330774 ?auto_330773 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_330781 - BLOCK
      ?auto_330782 - BLOCK
      ?auto_330783 - BLOCK
      ?auto_330784 - BLOCK
      ?auto_330785 - BLOCK
    )
    :vars
    (
      ?auto_330786 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_330784 ) ( ON ?auto_330785 ?auto_330786 ) ( CLEAR ?auto_330785 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_330781 ) ( ON ?auto_330782 ?auto_330781 ) ( ON ?auto_330783 ?auto_330782 ) ( ON ?auto_330784 ?auto_330783 ) ( not ( = ?auto_330781 ?auto_330782 ) ) ( not ( = ?auto_330781 ?auto_330783 ) ) ( not ( = ?auto_330781 ?auto_330784 ) ) ( not ( = ?auto_330781 ?auto_330785 ) ) ( not ( = ?auto_330781 ?auto_330786 ) ) ( not ( = ?auto_330782 ?auto_330783 ) ) ( not ( = ?auto_330782 ?auto_330784 ) ) ( not ( = ?auto_330782 ?auto_330785 ) ) ( not ( = ?auto_330782 ?auto_330786 ) ) ( not ( = ?auto_330783 ?auto_330784 ) ) ( not ( = ?auto_330783 ?auto_330785 ) ) ( not ( = ?auto_330783 ?auto_330786 ) ) ( not ( = ?auto_330784 ?auto_330785 ) ) ( not ( = ?auto_330784 ?auto_330786 ) ) ( not ( = ?auto_330785 ?auto_330786 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_330785 ?auto_330786 )
      ( !STACK ?auto_330785 ?auto_330784 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_330792 - BLOCK
      ?auto_330793 - BLOCK
      ?auto_330794 - BLOCK
      ?auto_330795 - BLOCK
      ?auto_330796 - BLOCK
    )
    :vars
    (
      ?auto_330797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330796 ?auto_330797 ) ( ON-TABLE ?auto_330792 ) ( ON ?auto_330793 ?auto_330792 ) ( ON ?auto_330794 ?auto_330793 ) ( not ( = ?auto_330792 ?auto_330793 ) ) ( not ( = ?auto_330792 ?auto_330794 ) ) ( not ( = ?auto_330792 ?auto_330795 ) ) ( not ( = ?auto_330792 ?auto_330796 ) ) ( not ( = ?auto_330792 ?auto_330797 ) ) ( not ( = ?auto_330793 ?auto_330794 ) ) ( not ( = ?auto_330793 ?auto_330795 ) ) ( not ( = ?auto_330793 ?auto_330796 ) ) ( not ( = ?auto_330793 ?auto_330797 ) ) ( not ( = ?auto_330794 ?auto_330795 ) ) ( not ( = ?auto_330794 ?auto_330796 ) ) ( not ( = ?auto_330794 ?auto_330797 ) ) ( not ( = ?auto_330795 ?auto_330796 ) ) ( not ( = ?auto_330795 ?auto_330797 ) ) ( not ( = ?auto_330796 ?auto_330797 ) ) ( CLEAR ?auto_330794 ) ( ON ?auto_330795 ?auto_330796 ) ( CLEAR ?auto_330795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_330792 ?auto_330793 ?auto_330794 ?auto_330795 )
      ( MAKE-5PILE ?auto_330792 ?auto_330793 ?auto_330794 ?auto_330795 ?auto_330796 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_330803 - BLOCK
      ?auto_330804 - BLOCK
      ?auto_330805 - BLOCK
      ?auto_330806 - BLOCK
      ?auto_330807 - BLOCK
    )
    :vars
    (
      ?auto_330808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330807 ?auto_330808 ) ( ON-TABLE ?auto_330803 ) ( ON ?auto_330804 ?auto_330803 ) ( ON ?auto_330805 ?auto_330804 ) ( not ( = ?auto_330803 ?auto_330804 ) ) ( not ( = ?auto_330803 ?auto_330805 ) ) ( not ( = ?auto_330803 ?auto_330806 ) ) ( not ( = ?auto_330803 ?auto_330807 ) ) ( not ( = ?auto_330803 ?auto_330808 ) ) ( not ( = ?auto_330804 ?auto_330805 ) ) ( not ( = ?auto_330804 ?auto_330806 ) ) ( not ( = ?auto_330804 ?auto_330807 ) ) ( not ( = ?auto_330804 ?auto_330808 ) ) ( not ( = ?auto_330805 ?auto_330806 ) ) ( not ( = ?auto_330805 ?auto_330807 ) ) ( not ( = ?auto_330805 ?auto_330808 ) ) ( not ( = ?auto_330806 ?auto_330807 ) ) ( not ( = ?auto_330806 ?auto_330808 ) ) ( not ( = ?auto_330807 ?auto_330808 ) ) ( CLEAR ?auto_330805 ) ( ON ?auto_330806 ?auto_330807 ) ( CLEAR ?auto_330806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_330803 ?auto_330804 ?auto_330805 ?auto_330806 )
      ( MAKE-5PILE ?auto_330803 ?auto_330804 ?auto_330805 ?auto_330806 ?auto_330807 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_330814 - BLOCK
      ?auto_330815 - BLOCK
      ?auto_330816 - BLOCK
      ?auto_330817 - BLOCK
      ?auto_330818 - BLOCK
    )
    :vars
    (
      ?auto_330819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330818 ?auto_330819 ) ( ON-TABLE ?auto_330814 ) ( ON ?auto_330815 ?auto_330814 ) ( not ( = ?auto_330814 ?auto_330815 ) ) ( not ( = ?auto_330814 ?auto_330816 ) ) ( not ( = ?auto_330814 ?auto_330817 ) ) ( not ( = ?auto_330814 ?auto_330818 ) ) ( not ( = ?auto_330814 ?auto_330819 ) ) ( not ( = ?auto_330815 ?auto_330816 ) ) ( not ( = ?auto_330815 ?auto_330817 ) ) ( not ( = ?auto_330815 ?auto_330818 ) ) ( not ( = ?auto_330815 ?auto_330819 ) ) ( not ( = ?auto_330816 ?auto_330817 ) ) ( not ( = ?auto_330816 ?auto_330818 ) ) ( not ( = ?auto_330816 ?auto_330819 ) ) ( not ( = ?auto_330817 ?auto_330818 ) ) ( not ( = ?auto_330817 ?auto_330819 ) ) ( not ( = ?auto_330818 ?auto_330819 ) ) ( ON ?auto_330817 ?auto_330818 ) ( CLEAR ?auto_330815 ) ( ON ?auto_330816 ?auto_330817 ) ( CLEAR ?auto_330816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_330814 ?auto_330815 ?auto_330816 )
      ( MAKE-5PILE ?auto_330814 ?auto_330815 ?auto_330816 ?auto_330817 ?auto_330818 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_330825 - BLOCK
      ?auto_330826 - BLOCK
      ?auto_330827 - BLOCK
      ?auto_330828 - BLOCK
      ?auto_330829 - BLOCK
    )
    :vars
    (
      ?auto_330830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330829 ?auto_330830 ) ( ON-TABLE ?auto_330825 ) ( ON ?auto_330826 ?auto_330825 ) ( not ( = ?auto_330825 ?auto_330826 ) ) ( not ( = ?auto_330825 ?auto_330827 ) ) ( not ( = ?auto_330825 ?auto_330828 ) ) ( not ( = ?auto_330825 ?auto_330829 ) ) ( not ( = ?auto_330825 ?auto_330830 ) ) ( not ( = ?auto_330826 ?auto_330827 ) ) ( not ( = ?auto_330826 ?auto_330828 ) ) ( not ( = ?auto_330826 ?auto_330829 ) ) ( not ( = ?auto_330826 ?auto_330830 ) ) ( not ( = ?auto_330827 ?auto_330828 ) ) ( not ( = ?auto_330827 ?auto_330829 ) ) ( not ( = ?auto_330827 ?auto_330830 ) ) ( not ( = ?auto_330828 ?auto_330829 ) ) ( not ( = ?auto_330828 ?auto_330830 ) ) ( not ( = ?auto_330829 ?auto_330830 ) ) ( ON ?auto_330828 ?auto_330829 ) ( CLEAR ?auto_330826 ) ( ON ?auto_330827 ?auto_330828 ) ( CLEAR ?auto_330827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_330825 ?auto_330826 ?auto_330827 )
      ( MAKE-5PILE ?auto_330825 ?auto_330826 ?auto_330827 ?auto_330828 ?auto_330829 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_330836 - BLOCK
      ?auto_330837 - BLOCK
      ?auto_330838 - BLOCK
      ?auto_330839 - BLOCK
      ?auto_330840 - BLOCK
    )
    :vars
    (
      ?auto_330841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330840 ?auto_330841 ) ( ON-TABLE ?auto_330836 ) ( not ( = ?auto_330836 ?auto_330837 ) ) ( not ( = ?auto_330836 ?auto_330838 ) ) ( not ( = ?auto_330836 ?auto_330839 ) ) ( not ( = ?auto_330836 ?auto_330840 ) ) ( not ( = ?auto_330836 ?auto_330841 ) ) ( not ( = ?auto_330837 ?auto_330838 ) ) ( not ( = ?auto_330837 ?auto_330839 ) ) ( not ( = ?auto_330837 ?auto_330840 ) ) ( not ( = ?auto_330837 ?auto_330841 ) ) ( not ( = ?auto_330838 ?auto_330839 ) ) ( not ( = ?auto_330838 ?auto_330840 ) ) ( not ( = ?auto_330838 ?auto_330841 ) ) ( not ( = ?auto_330839 ?auto_330840 ) ) ( not ( = ?auto_330839 ?auto_330841 ) ) ( not ( = ?auto_330840 ?auto_330841 ) ) ( ON ?auto_330839 ?auto_330840 ) ( ON ?auto_330838 ?auto_330839 ) ( CLEAR ?auto_330836 ) ( ON ?auto_330837 ?auto_330838 ) ( CLEAR ?auto_330837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_330836 ?auto_330837 )
      ( MAKE-5PILE ?auto_330836 ?auto_330837 ?auto_330838 ?auto_330839 ?auto_330840 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_330847 - BLOCK
      ?auto_330848 - BLOCK
      ?auto_330849 - BLOCK
      ?auto_330850 - BLOCK
      ?auto_330851 - BLOCK
    )
    :vars
    (
      ?auto_330852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330851 ?auto_330852 ) ( ON-TABLE ?auto_330847 ) ( not ( = ?auto_330847 ?auto_330848 ) ) ( not ( = ?auto_330847 ?auto_330849 ) ) ( not ( = ?auto_330847 ?auto_330850 ) ) ( not ( = ?auto_330847 ?auto_330851 ) ) ( not ( = ?auto_330847 ?auto_330852 ) ) ( not ( = ?auto_330848 ?auto_330849 ) ) ( not ( = ?auto_330848 ?auto_330850 ) ) ( not ( = ?auto_330848 ?auto_330851 ) ) ( not ( = ?auto_330848 ?auto_330852 ) ) ( not ( = ?auto_330849 ?auto_330850 ) ) ( not ( = ?auto_330849 ?auto_330851 ) ) ( not ( = ?auto_330849 ?auto_330852 ) ) ( not ( = ?auto_330850 ?auto_330851 ) ) ( not ( = ?auto_330850 ?auto_330852 ) ) ( not ( = ?auto_330851 ?auto_330852 ) ) ( ON ?auto_330850 ?auto_330851 ) ( ON ?auto_330849 ?auto_330850 ) ( CLEAR ?auto_330847 ) ( ON ?auto_330848 ?auto_330849 ) ( CLEAR ?auto_330848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_330847 ?auto_330848 )
      ( MAKE-5PILE ?auto_330847 ?auto_330848 ?auto_330849 ?auto_330850 ?auto_330851 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_330858 - BLOCK
      ?auto_330859 - BLOCK
      ?auto_330860 - BLOCK
      ?auto_330861 - BLOCK
      ?auto_330862 - BLOCK
    )
    :vars
    (
      ?auto_330863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330862 ?auto_330863 ) ( not ( = ?auto_330858 ?auto_330859 ) ) ( not ( = ?auto_330858 ?auto_330860 ) ) ( not ( = ?auto_330858 ?auto_330861 ) ) ( not ( = ?auto_330858 ?auto_330862 ) ) ( not ( = ?auto_330858 ?auto_330863 ) ) ( not ( = ?auto_330859 ?auto_330860 ) ) ( not ( = ?auto_330859 ?auto_330861 ) ) ( not ( = ?auto_330859 ?auto_330862 ) ) ( not ( = ?auto_330859 ?auto_330863 ) ) ( not ( = ?auto_330860 ?auto_330861 ) ) ( not ( = ?auto_330860 ?auto_330862 ) ) ( not ( = ?auto_330860 ?auto_330863 ) ) ( not ( = ?auto_330861 ?auto_330862 ) ) ( not ( = ?auto_330861 ?auto_330863 ) ) ( not ( = ?auto_330862 ?auto_330863 ) ) ( ON ?auto_330861 ?auto_330862 ) ( ON ?auto_330860 ?auto_330861 ) ( ON ?auto_330859 ?auto_330860 ) ( ON ?auto_330858 ?auto_330859 ) ( CLEAR ?auto_330858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_330858 )
      ( MAKE-5PILE ?auto_330858 ?auto_330859 ?auto_330860 ?auto_330861 ?auto_330862 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_330869 - BLOCK
      ?auto_330870 - BLOCK
      ?auto_330871 - BLOCK
      ?auto_330872 - BLOCK
      ?auto_330873 - BLOCK
    )
    :vars
    (
      ?auto_330874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330873 ?auto_330874 ) ( not ( = ?auto_330869 ?auto_330870 ) ) ( not ( = ?auto_330869 ?auto_330871 ) ) ( not ( = ?auto_330869 ?auto_330872 ) ) ( not ( = ?auto_330869 ?auto_330873 ) ) ( not ( = ?auto_330869 ?auto_330874 ) ) ( not ( = ?auto_330870 ?auto_330871 ) ) ( not ( = ?auto_330870 ?auto_330872 ) ) ( not ( = ?auto_330870 ?auto_330873 ) ) ( not ( = ?auto_330870 ?auto_330874 ) ) ( not ( = ?auto_330871 ?auto_330872 ) ) ( not ( = ?auto_330871 ?auto_330873 ) ) ( not ( = ?auto_330871 ?auto_330874 ) ) ( not ( = ?auto_330872 ?auto_330873 ) ) ( not ( = ?auto_330872 ?auto_330874 ) ) ( not ( = ?auto_330873 ?auto_330874 ) ) ( ON ?auto_330872 ?auto_330873 ) ( ON ?auto_330871 ?auto_330872 ) ( ON ?auto_330870 ?auto_330871 ) ( ON ?auto_330869 ?auto_330870 ) ( CLEAR ?auto_330869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_330869 )
      ( MAKE-5PILE ?auto_330869 ?auto_330870 ?auto_330871 ?auto_330872 ?auto_330873 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_330881 - BLOCK
      ?auto_330882 - BLOCK
      ?auto_330883 - BLOCK
      ?auto_330884 - BLOCK
      ?auto_330885 - BLOCK
      ?auto_330886 - BLOCK
    )
    :vars
    (
      ?auto_330887 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_330885 ) ( ON ?auto_330886 ?auto_330887 ) ( CLEAR ?auto_330886 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_330881 ) ( ON ?auto_330882 ?auto_330881 ) ( ON ?auto_330883 ?auto_330882 ) ( ON ?auto_330884 ?auto_330883 ) ( ON ?auto_330885 ?auto_330884 ) ( not ( = ?auto_330881 ?auto_330882 ) ) ( not ( = ?auto_330881 ?auto_330883 ) ) ( not ( = ?auto_330881 ?auto_330884 ) ) ( not ( = ?auto_330881 ?auto_330885 ) ) ( not ( = ?auto_330881 ?auto_330886 ) ) ( not ( = ?auto_330881 ?auto_330887 ) ) ( not ( = ?auto_330882 ?auto_330883 ) ) ( not ( = ?auto_330882 ?auto_330884 ) ) ( not ( = ?auto_330882 ?auto_330885 ) ) ( not ( = ?auto_330882 ?auto_330886 ) ) ( not ( = ?auto_330882 ?auto_330887 ) ) ( not ( = ?auto_330883 ?auto_330884 ) ) ( not ( = ?auto_330883 ?auto_330885 ) ) ( not ( = ?auto_330883 ?auto_330886 ) ) ( not ( = ?auto_330883 ?auto_330887 ) ) ( not ( = ?auto_330884 ?auto_330885 ) ) ( not ( = ?auto_330884 ?auto_330886 ) ) ( not ( = ?auto_330884 ?auto_330887 ) ) ( not ( = ?auto_330885 ?auto_330886 ) ) ( not ( = ?auto_330885 ?auto_330887 ) ) ( not ( = ?auto_330886 ?auto_330887 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_330886 ?auto_330887 )
      ( !STACK ?auto_330886 ?auto_330885 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_330894 - BLOCK
      ?auto_330895 - BLOCK
      ?auto_330896 - BLOCK
      ?auto_330897 - BLOCK
      ?auto_330898 - BLOCK
      ?auto_330899 - BLOCK
    )
    :vars
    (
      ?auto_330900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_330898 ) ( ON ?auto_330899 ?auto_330900 ) ( CLEAR ?auto_330899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_330894 ) ( ON ?auto_330895 ?auto_330894 ) ( ON ?auto_330896 ?auto_330895 ) ( ON ?auto_330897 ?auto_330896 ) ( ON ?auto_330898 ?auto_330897 ) ( not ( = ?auto_330894 ?auto_330895 ) ) ( not ( = ?auto_330894 ?auto_330896 ) ) ( not ( = ?auto_330894 ?auto_330897 ) ) ( not ( = ?auto_330894 ?auto_330898 ) ) ( not ( = ?auto_330894 ?auto_330899 ) ) ( not ( = ?auto_330894 ?auto_330900 ) ) ( not ( = ?auto_330895 ?auto_330896 ) ) ( not ( = ?auto_330895 ?auto_330897 ) ) ( not ( = ?auto_330895 ?auto_330898 ) ) ( not ( = ?auto_330895 ?auto_330899 ) ) ( not ( = ?auto_330895 ?auto_330900 ) ) ( not ( = ?auto_330896 ?auto_330897 ) ) ( not ( = ?auto_330896 ?auto_330898 ) ) ( not ( = ?auto_330896 ?auto_330899 ) ) ( not ( = ?auto_330896 ?auto_330900 ) ) ( not ( = ?auto_330897 ?auto_330898 ) ) ( not ( = ?auto_330897 ?auto_330899 ) ) ( not ( = ?auto_330897 ?auto_330900 ) ) ( not ( = ?auto_330898 ?auto_330899 ) ) ( not ( = ?auto_330898 ?auto_330900 ) ) ( not ( = ?auto_330899 ?auto_330900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_330899 ?auto_330900 )
      ( !STACK ?auto_330899 ?auto_330898 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_330907 - BLOCK
      ?auto_330908 - BLOCK
      ?auto_330909 - BLOCK
      ?auto_330910 - BLOCK
      ?auto_330911 - BLOCK
      ?auto_330912 - BLOCK
    )
    :vars
    (
      ?auto_330913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330912 ?auto_330913 ) ( ON-TABLE ?auto_330907 ) ( ON ?auto_330908 ?auto_330907 ) ( ON ?auto_330909 ?auto_330908 ) ( ON ?auto_330910 ?auto_330909 ) ( not ( = ?auto_330907 ?auto_330908 ) ) ( not ( = ?auto_330907 ?auto_330909 ) ) ( not ( = ?auto_330907 ?auto_330910 ) ) ( not ( = ?auto_330907 ?auto_330911 ) ) ( not ( = ?auto_330907 ?auto_330912 ) ) ( not ( = ?auto_330907 ?auto_330913 ) ) ( not ( = ?auto_330908 ?auto_330909 ) ) ( not ( = ?auto_330908 ?auto_330910 ) ) ( not ( = ?auto_330908 ?auto_330911 ) ) ( not ( = ?auto_330908 ?auto_330912 ) ) ( not ( = ?auto_330908 ?auto_330913 ) ) ( not ( = ?auto_330909 ?auto_330910 ) ) ( not ( = ?auto_330909 ?auto_330911 ) ) ( not ( = ?auto_330909 ?auto_330912 ) ) ( not ( = ?auto_330909 ?auto_330913 ) ) ( not ( = ?auto_330910 ?auto_330911 ) ) ( not ( = ?auto_330910 ?auto_330912 ) ) ( not ( = ?auto_330910 ?auto_330913 ) ) ( not ( = ?auto_330911 ?auto_330912 ) ) ( not ( = ?auto_330911 ?auto_330913 ) ) ( not ( = ?auto_330912 ?auto_330913 ) ) ( CLEAR ?auto_330910 ) ( ON ?auto_330911 ?auto_330912 ) ( CLEAR ?auto_330911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_330907 ?auto_330908 ?auto_330909 ?auto_330910 ?auto_330911 )
      ( MAKE-6PILE ?auto_330907 ?auto_330908 ?auto_330909 ?auto_330910 ?auto_330911 ?auto_330912 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_330920 - BLOCK
      ?auto_330921 - BLOCK
      ?auto_330922 - BLOCK
      ?auto_330923 - BLOCK
      ?auto_330924 - BLOCK
      ?auto_330925 - BLOCK
    )
    :vars
    (
      ?auto_330926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330925 ?auto_330926 ) ( ON-TABLE ?auto_330920 ) ( ON ?auto_330921 ?auto_330920 ) ( ON ?auto_330922 ?auto_330921 ) ( ON ?auto_330923 ?auto_330922 ) ( not ( = ?auto_330920 ?auto_330921 ) ) ( not ( = ?auto_330920 ?auto_330922 ) ) ( not ( = ?auto_330920 ?auto_330923 ) ) ( not ( = ?auto_330920 ?auto_330924 ) ) ( not ( = ?auto_330920 ?auto_330925 ) ) ( not ( = ?auto_330920 ?auto_330926 ) ) ( not ( = ?auto_330921 ?auto_330922 ) ) ( not ( = ?auto_330921 ?auto_330923 ) ) ( not ( = ?auto_330921 ?auto_330924 ) ) ( not ( = ?auto_330921 ?auto_330925 ) ) ( not ( = ?auto_330921 ?auto_330926 ) ) ( not ( = ?auto_330922 ?auto_330923 ) ) ( not ( = ?auto_330922 ?auto_330924 ) ) ( not ( = ?auto_330922 ?auto_330925 ) ) ( not ( = ?auto_330922 ?auto_330926 ) ) ( not ( = ?auto_330923 ?auto_330924 ) ) ( not ( = ?auto_330923 ?auto_330925 ) ) ( not ( = ?auto_330923 ?auto_330926 ) ) ( not ( = ?auto_330924 ?auto_330925 ) ) ( not ( = ?auto_330924 ?auto_330926 ) ) ( not ( = ?auto_330925 ?auto_330926 ) ) ( CLEAR ?auto_330923 ) ( ON ?auto_330924 ?auto_330925 ) ( CLEAR ?auto_330924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_330920 ?auto_330921 ?auto_330922 ?auto_330923 ?auto_330924 )
      ( MAKE-6PILE ?auto_330920 ?auto_330921 ?auto_330922 ?auto_330923 ?auto_330924 ?auto_330925 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_330933 - BLOCK
      ?auto_330934 - BLOCK
      ?auto_330935 - BLOCK
      ?auto_330936 - BLOCK
      ?auto_330937 - BLOCK
      ?auto_330938 - BLOCK
    )
    :vars
    (
      ?auto_330939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330938 ?auto_330939 ) ( ON-TABLE ?auto_330933 ) ( ON ?auto_330934 ?auto_330933 ) ( ON ?auto_330935 ?auto_330934 ) ( not ( = ?auto_330933 ?auto_330934 ) ) ( not ( = ?auto_330933 ?auto_330935 ) ) ( not ( = ?auto_330933 ?auto_330936 ) ) ( not ( = ?auto_330933 ?auto_330937 ) ) ( not ( = ?auto_330933 ?auto_330938 ) ) ( not ( = ?auto_330933 ?auto_330939 ) ) ( not ( = ?auto_330934 ?auto_330935 ) ) ( not ( = ?auto_330934 ?auto_330936 ) ) ( not ( = ?auto_330934 ?auto_330937 ) ) ( not ( = ?auto_330934 ?auto_330938 ) ) ( not ( = ?auto_330934 ?auto_330939 ) ) ( not ( = ?auto_330935 ?auto_330936 ) ) ( not ( = ?auto_330935 ?auto_330937 ) ) ( not ( = ?auto_330935 ?auto_330938 ) ) ( not ( = ?auto_330935 ?auto_330939 ) ) ( not ( = ?auto_330936 ?auto_330937 ) ) ( not ( = ?auto_330936 ?auto_330938 ) ) ( not ( = ?auto_330936 ?auto_330939 ) ) ( not ( = ?auto_330937 ?auto_330938 ) ) ( not ( = ?auto_330937 ?auto_330939 ) ) ( not ( = ?auto_330938 ?auto_330939 ) ) ( ON ?auto_330937 ?auto_330938 ) ( CLEAR ?auto_330935 ) ( ON ?auto_330936 ?auto_330937 ) ( CLEAR ?auto_330936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_330933 ?auto_330934 ?auto_330935 ?auto_330936 )
      ( MAKE-6PILE ?auto_330933 ?auto_330934 ?auto_330935 ?auto_330936 ?auto_330937 ?auto_330938 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_330946 - BLOCK
      ?auto_330947 - BLOCK
      ?auto_330948 - BLOCK
      ?auto_330949 - BLOCK
      ?auto_330950 - BLOCK
      ?auto_330951 - BLOCK
    )
    :vars
    (
      ?auto_330952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330951 ?auto_330952 ) ( ON-TABLE ?auto_330946 ) ( ON ?auto_330947 ?auto_330946 ) ( ON ?auto_330948 ?auto_330947 ) ( not ( = ?auto_330946 ?auto_330947 ) ) ( not ( = ?auto_330946 ?auto_330948 ) ) ( not ( = ?auto_330946 ?auto_330949 ) ) ( not ( = ?auto_330946 ?auto_330950 ) ) ( not ( = ?auto_330946 ?auto_330951 ) ) ( not ( = ?auto_330946 ?auto_330952 ) ) ( not ( = ?auto_330947 ?auto_330948 ) ) ( not ( = ?auto_330947 ?auto_330949 ) ) ( not ( = ?auto_330947 ?auto_330950 ) ) ( not ( = ?auto_330947 ?auto_330951 ) ) ( not ( = ?auto_330947 ?auto_330952 ) ) ( not ( = ?auto_330948 ?auto_330949 ) ) ( not ( = ?auto_330948 ?auto_330950 ) ) ( not ( = ?auto_330948 ?auto_330951 ) ) ( not ( = ?auto_330948 ?auto_330952 ) ) ( not ( = ?auto_330949 ?auto_330950 ) ) ( not ( = ?auto_330949 ?auto_330951 ) ) ( not ( = ?auto_330949 ?auto_330952 ) ) ( not ( = ?auto_330950 ?auto_330951 ) ) ( not ( = ?auto_330950 ?auto_330952 ) ) ( not ( = ?auto_330951 ?auto_330952 ) ) ( ON ?auto_330950 ?auto_330951 ) ( CLEAR ?auto_330948 ) ( ON ?auto_330949 ?auto_330950 ) ( CLEAR ?auto_330949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_330946 ?auto_330947 ?auto_330948 ?auto_330949 )
      ( MAKE-6PILE ?auto_330946 ?auto_330947 ?auto_330948 ?auto_330949 ?auto_330950 ?auto_330951 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_330959 - BLOCK
      ?auto_330960 - BLOCK
      ?auto_330961 - BLOCK
      ?auto_330962 - BLOCK
      ?auto_330963 - BLOCK
      ?auto_330964 - BLOCK
    )
    :vars
    (
      ?auto_330965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330964 ?auto_330965 ) ( ON-TABLE ?auto_330959 ) ( ON ?auto_330960 ?auto_330959 ) ( not ( = ?auto_330959 ?auto_330960 ) ) ( not ( = ?auto_330959 ?auto_330961 ) ) ( not ( = ?auto_330959 ?auto_330962 ) ) ( not ( = ?auto_330959 ?auto_330963 ) ) ( not ( = ?auto_330959 ?auto_330964 ) ) ( not ( = ?auto_330959 ?auto_330965 ) ) ( not ( = ?auto_330960 ?auto_330961 ) ) ( not ( = ?auto_330960 ?auto_330962 ) ) ( not ( = ?auto_330960 ?auto_330963 ) ) ( not ( = ?auto_330960 ?auto_330964 ) ) ( not ( = ?auto_330960 ?auto_330965 ) ) ( not ( = ?auto_330961 ?auto_330962 ) ) ( not ( = ?auto_330961 ?auto_330963 ) ) ( not ( = ?auto_330961 ?auto_330964 ) ) ( not ( = ?auto_330961 ?auto_330965 ) ) ( not ( = ?auto_330962 ?auto_330963 ) ) ( not ( = ?auto_330962 ?auto_330964 ) ) ( not ( = ?auto_330962 ?auto_330965 ) ) ( not ( = ?auto_330963 ?auto_330964 ) ) ( not ( = ?auto_330963 ?auto_330965 ) ) ( not ( = ?auto_330964 ?auto_330965 ) ) ( ON ?auto_330963 ?auto_330964 ) ( ON ?auto_330962 ?auto_330963 ) ( CLEAR ?auto_330960 ) ( ON ?auto_330961 ?auto_330962 ) ( CLEAR ?auto_330961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_330959 ?auto_330960 ?auto_330961 )
      ( MAKE-6PILE ?auto_330959 ?auto_330960 ?auto_330961 ?auto_330962 ?auto_330963 ?auto_330964 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_330972 - BLOCK
      ?auto_330973 - BLOCK
      ?auto_330974 - BLOCK
      ?auto_330975 - BLOCK
      ?auto_330976 - BLOCK
      ?auto_330977 - BLOCK
    )
    :vars
    (
      ?auto_330978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330977 ?auto_330978 ) ( ON-TABLE ?auto_330972 ) ( ON ?auto_330973 ?auto_330972 ) ( not ( = ?auto_330972 ?auto_330973 ) ) ( not ( = ?auto_330972 ?auto_330974 ) ) ( not ( = ?auto_330972 ?auto_330975 ) ) ( not ( = ?auto_330972 ?auto_330976 ) ) ( not ( = ?auto_330972 ?auto_330977 ) ) ( not ( = ?auto_330972 ?auto_330978 ) ) ( not ( = ?auto_330973 ?auto_330974 ) ) ( not ( = ?auto_330973 ?auto_330975 ) ) ( not ( = ?auto_330973 ?auto_330976 ) ) ( not ( = ?auto_330973 ?auto_330977 ) ) ( not ( = ?auto_330973 ?auto_330978 ) ) ( not ( = ?auto_330974 ?auto_330975 ) ) ( not ( = ?auto_330974 ?auto_330976 ) ) ( not ( = ?auto_330974 ?auto_330977 ) ) ( not ( = ?auto_330974 ?auto_330978 ) ) ( not ( = ?auto_330975 ?auto_330976 ) ) ( not ( = ?auto_330975 ?auto_330977 ) ) ( not ( = ?auto_330975 ?auto_330978 ) ) ( not ( = ?auto_330976 ?auto_330977 ) ) ( not ( = ?auto_330976 ?auto_330978 ) ) ( not ( = ?auto_330977 ?auto_330978 ) ) ( ON ?auto_330976 ?auto_330977 ) ( ON ?auto_330975 ?auto_330976 ) ( CLEAR ?auto_330973 ) ( ON ?auto_330974 ?auto_330975 ) ( CLEAR ?auto_330974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_330972 ?auto_330973 ?auto_330974 )
      ( MAKE-6PILE ?auto_330972 ?auto_330973 ?auto_330974 ?auto_330975 ?auto_330976 ?auto_330977 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_330985 - BLOCK
      ?auto_330986 - BLOCK
      ?auto_330987 - BLOCK
      ?auto_330988 - BLOCK
      ?auto_330989 - BLOCK
      ?auto_330990 - BLOCK
    )
    :vars
    (
      ?auto_330991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330990 ?auto_330991 ) ( ON-TABLE ?auto_330985 ) ( not ( = ?auto_330985 ?auto_330986 ) ) ( not ( = ?auto_330985 ?auto_330987 ) ) ( not ( = ?auto_330985 ?auto_330988 ) ) ( not ( = ?auto_330985 ?auto_330989 ) ) ( not ( = ?auto_330985 ?auto_330990 ) ) ( not ( = ?auto_330985 ?auto_330991 ) ) ( not ( = ?auto_330986 ?auto_330987 ) ) ( not ( = ?auto_330986 ?auto_330988 ) ) ( not ( = ?auto_330986 ?auto_330989 ) ) ( not ( = ?auto_330986 ?auto_330990 ) ) ( not ( = ?auto_330986 ?auto_330991 ) ) ( not ( = ?auto_330987 ?auto_330988 ) ) ( not ( = ?auto_330987 ?auto_330989 ) ) ( not ( = ?auto_330987 ?auto_330990 ) ) ( not ( = ?auto_330987 ?auto_330991 ) ) ( not ( = ?auto_330988 ?auto_330989 ) ) ( not ( = ?auto_330988 ?auto_330990 ) ) ( not ( = ?auto_330988 ?auto_330991 ) ) ( not ( = ?auto_330989 ?auto_330990 ) ) ( not ( = ?auto_330989 ?auto_330991 ) ) ( not ( = ?auto_330990 ?auto_330991 ) ) ( ON ?auto_330989 ?auto_330990 ) ( ON ?auto_330988 ?auto_330989 ) ( ON ?auto_330987 ?auto_330988 ) ( CLEAR ?auto_330985 ) ( ON ?auto_330986 ?auto_330987 ) ( CLEAR ?auto_330986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_330985 ?auto_330986 )
      ( MAKE-6PILE ?auto_330985 ?auto_330986 ?auto_330987 ?auto_330988 ?auto_330989 ?auto_330990 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_330998 - BLOCK
      ?auto_330999 - BLOCK
      ?auto_331000 - BLOCK
      ?auto_331001 - BLOCK
      ?auto_331002 - BLOCK
      ?auto_331003 - BLOCK
    )
    :vars
    (
      ?auto_331004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331003 ?auto_331004 ) ( ON-TABLE ?auto_330998 ) ( not ( = ?auto_330998 ?auto_330999 ) ) ( not ( = ?auto_330998 ?auto_331000 ) ) ( not ( = ?auto_330998 ?auto_331001 ) ) ( not ( = ?auto_330998 ?auto_331002 ) ) ( not ( = ?auto_330998 ?auto_331003 ) ) ( not ( = ?auto_330998 ?auto_331004 ) ) ( not ( = ?auto_330999 ?auto_331000 ) ) ( not ( = ?auto_330999 ?auto_331001 ) ) ( not ( = ?auto_330999 ?auto_331002 ) ) ( not ( = ?auto_330999 ?auto_331003 ) ) ( not ( = ?auto_330999 ?auto_331004 ) ) ( not ( = ?auto_331000 ?auto_331001 ) ) ( not ( = ?auto_331000 ?auto_331002 ) ) ( not ( = ?auto_331000 ?auto_331003 ) ) ( not ( = ?auto_331000 ?auto_331004 ) ) ( not ( = ?auto_331001 ?auto_331002 ) ) ( not ( = ?auto_331001 ?auto_331003 ) ) ( not ( = ?auto_331001 ?auto_331004 ) ) ( not ( = ?auto_331002 ?auto_331003 ) ) ( not ( = ?auto_331002 ?auto_331004 ) ) ( not ( = ?auto_331003 ?auto_331004 ) ) ( ON ?auto_331002 ?auto_331003 ) ( ON ?auto_331001 ?auto_331002 ) ( ON ?auto_331000 ?auto_331001 ) ( CLEAR ?auto_330998 ) ( ON ?auto_330999 ?auto_331000 ) ( CLEAR ?auto_330999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_330998 ?auto_330999 )
      ( MAKE-6PILE ?auto_330998 ?auto_330999 ?auto_331000 ?auto_331001 ?auto_331002 ?auto_331003 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_331011 - BLOCK
      ?auto_331012 - BLOCK
      ?auto_331013 - BLOCK
      ?auto_331014 - BLOCK
      ?auto_331015 - BLOCK
      ?auto_331016 - BLOCK
    )
    :vars
    (
      ?auto_331017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331016 ?auto_331017 ) ( not ( = ?auto_331011 ?auto_331012 ) ) ( not ( = ?auto_331011 ?auto_331013 ) ) ( not ( = ?auto_331011 ?auto_331014 ) ) ( not ( = ?auto_331011 ?auto_331015 ) ) ( not ( = ?auto_331011 ?auto_331016 ) ) ( not ( = ?auto_331011 ?auto_331017 ) ) ( not ( = ?auto_331012 ?auto_331013 ) ) ( not ( = ?auto_331012 ?auto_331014 ) ) ( not ( = ?auto_331012 ?auto_331015 ) ) ( not ( = ?auto_331012 ?auto_331016 ) ) ( not ( = ?auto_331012 ?auto_331017 ) ) ( not ( = ?auto_331013 ?auto_331014 ) ) ( not ( = ?auto_331013 ?auto_331015 ) ) ( not ( = ?auto_331013 ?auto_331016 ) ) ( not ( = ?auto_331013 ?auto_331017 ) ) ( not ( = ?auto_331014 ?auto_331015 ) ) ( not ( = ?auto_331014 ?auto_331016 ) ) ( not ( = ?auto_331014 ?auto_331017 ) ) ( not ( = ?auto_331015 ?auto_331016 ) ) ( not ( = ?auto_331015 ?auto_331017 ) ) ( not ( = ?auto_331016 ?auto_331017 ) ) ( ON ?auto_331015 ?auto_331016 ) ( ON ?auto_331014 ?auto_331015 ) ( ON ?auto_331013 ?auto_331014 ) ( ON ?auto_331012 ?auto_331013 ) ( ON ?auto_331011 ?auto_331012 ) ( CLEAR ?auto_331011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_331011 )
      ( MAKE-6PILE ?auto_331011 ?auto_331012 ?auto_331013 ?auto_331014 ?auto_331015 ?auto_331016 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_331024 - BLOCK
      ?auto_331025 - BLOCK
      ?auto_331026 - BLOCK
      ?auto_331027 - BLOCK
      ?auto_331028 - BLOCK
      ?auto_331029 - BLOCK
    )
    :vars
    (
      ?auto_331030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331029 ?auto_331030 ) ( not ( = ?auto_331024 ?auto_331025 ) ) ( not ( = ?auto_331024 ?auto_331026 ) ) ( not ( = ?auto_331024 ?auto_331027 ) ) ( not ( = ?auto_331024 ?auto_331028 ) ) ( not ( = ?auto_331024 ?auto_331029 ) ) ( not ( = ?auto_331024 ?auto_331030 ) ) ( not ( = ?auto_331025 ?auto_331026 ) ) ( not ( = ?auto_331025 ?auto_331027 ) ) ( not ( = ?auto_331025 ?auto_331028 ) ) ( not ( = ?auto_331025 ?auto_331029 ) ) ( not ( = ?auto_331025 ?auto_331030 ) ) ( not ( = ?auto_331026 ?auto_331027 ) ) ( not ( = ?auto_331026 ?auto_331028 ) ) ( not ( = ?auto_331026 ?auto_331029 ) ) ( not ( = ?auto_331026 ?auto_331030 ) ) ( not ( = ?auto_331027 ?auto_331028 ) ) ( not ( = ?auto_331027 ?auto_331029 ) ) ( not ( = ?auto_331027 ?auto_331030 ) ) ( not ( = ?auto_331028 ?auto_331029 ) ) ( not ( = ?auto_331028 ?auto_331030 ) ) ( not ( = ?auto_331029 ?auto_331030 ) ) ( ON ?auto_331028 ?auto_331029 ) ( ON ?auto_331027 ?auto_331028 ) ( ON ?auto_331026 ?auto_331027 ) ( ON ?auto_331025 ?auto_331026 ) ( ON ?auto_331024 ?auto_331025 ) ( CLEAR ?auto_331024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_331024 )
      ( MAKE-6PILE ?auto_331024 ?auto_331025 ?auto_331026 ?auto_331027 ?auto_331028 ?auto_331029 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_331038 - BLOCK
      ?auto_331039 - BLOCK
      ?auto_331040 - BLOCK
      ?auto_331041 - BLOCK
      ?auto_331042 - BLOCK
      ?auto_331043 - BLOCK
      ?auto_331044 - BLOCK
    )
    :vars
    (
      ?auto_331045 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_331043 ) ( ON ?auto_331044 ?auto_331045 ) ( CLEAR ?auto_331044 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_331038 ) ( ON ?auto_331039 ?auto_331038 ) ( ON ?auto_331040 ?auto_331039 ) ( ON ?auto_331041 ?auto_331040 ) ( ON ?auto_331042 ?auto_331041 ) ( ON ?auto_331043 ?auto_331042 ) ( not ( = ?auto_331038 ?auto_331039 ) ) ( not ( = ?auto_331038 ?auto_331040 ) ) ( not ( = ?auto_331038 ?auto_331041 ) ) ( not ( = ?auto_331038 ?auto_331042 ) ) ( not ( = ?auto_331038 ?auto_331043 ) ) ( not ( = ?auto_331038 ?auto_331044 ) ) ( not ( = ?auto_331038 ?auto_331045 ) ) ( not ( = ?auto_331039 ?auto_331040 ) ) ( not ( = ?auto_331039 ?auto_331041 ) ) ( not ( = ?auto_331039 ?auto_331042 ) ) ( not ( = ?auto_331039 ?auto_331043 ) ) ( not ( = ?auto_331039 ?auto_331044 ) ) ( not ( = ?auto_331039 ?auto_331045 ) ) ( not ( = ?auto_331040 ?auto_331041 ) ) ( not ( = ?auto_331040 ?auto_331042 ) ) ( not ( = ?auto_331040 ?auto_331043 ) ) ( not ( = ?auto_331040 ?auto_331044 ) ) ( not ( = ?auto_331040 ?auto_331045 ) ) ( not ( = ?auto_331041 ?auto_331042 ) ) ( not ( = ?auto_331041 ?auto_331043 ) ) ( not ( = ?auto_331041 ?auto_331044 ) ) ( not ( = ?auto_331041 ?auto_331045 ) ) ( not ( = ?auto_331042 ?auto_331043 ) ) ( not ( = ?auto_331042 ?auto_331044 ) ) ( not ( = ?auto_331042 ?auto_331045 ) ) ( not ( = ?auto_331043 ?auto_331044 ) ) ( not ( = ?auto_331043 ?auto_331045 ) ) ( not ( = ?auto_331044 ?auto_331045 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_331044 ?auto_331045 )
      ( !STACK ?auto_331044 ?auto_331043 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_331053 - BLOCK
      ?auto_331054 - BLOCK
      ?auto_331055 - BLOCK
      ?auto_331056 - BLOCK
      ?auto_331057 - BLOCK
      ?auto_331058 - BLOCK
      ?auto_331059 - BLOCK
    )
    :vars
    (
      ?auto_331060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_331058 ) ( ON ?auto_331059 ?auto_331060 ) ( CLEAR ?auto_331059 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_331053 ) ( ON ?auto_331054 ?auto_331053 ) ( ON ?auto_331055 ?auto_331054 ) ( ON ?auto_331056 ?auto_331055 ) ( ON ?auto_331057 ?auto_331056 ) ( ON ?auto_331058 ?auto_331057 ) ( not ( = ?auto_331053 ?auto_331054 ) ) ( not ( = ?auto_331053 ?auto_331055 ) ) ( not ( = ?auto_331053 ?auto_331056 ) ) ( not ( = ?auto_331053 ?auto_331057 ) ) ( not ( = ?auto_331053 ?auto_331058 ) ) ( not ( = ?auto_331053 ?auto_331059 ) ) ( not ( = ?auto_331053 ?auto_331060 ) ) ( not ( = ?auto_331054 ?auto_331055 ) ) ( not ( = ?auto_331054 ?auto_331056 ) ) ( not ( = ?auto_331054 ?auto_331057 ) ) ( not ( = ?auto_331054 ?auto_331058 ) ) ( not ( = ?auto_331054 ?auto_331059 ) ) ( not ( = ?auto_331054 ?auto_331060 ) ) ( not ( = ?auto_331055 ?auto_331056 ) ) ( not ( = ?auto_331055 ?auto_331057 ) ) ( not ( = ?auto_331055 ?auto_331058 ) ) ( not ( = ?auto_331055 ?auto_331059 ) ) ( not ( = ?auto_331055 ?auto_331060 ) ) ( not ( = ?auto_331056 ?auto_331057 ) ) ( not ( = ?auto_331056 ?auto_331058 ) ) ( not ( = ?auto_331056 ?auto_331059 ) ) ( not ( = ?auto_331056 ?auto_331060 ) ) ( not ( = ?auto_331057 ?auto_331058 ) ) ( not ( = ?auto_331057 ?auto_331059 ) ) ( not ( = ?auto_331057 ?auto_331060 ) ) ( not ( = ?auto_331058 ?auto_331059 ) ) ( not ( = ?auto_331058 ?auto_331060 ) ) ( not ( = ?auto_331059 ?auto_331060 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_331059 ?auto_331060 )
      ( !STACK ?auto_331059 ?auto_331058 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_331068 - BLOCK
      ?auto_331069 - BLOCK
      ?auto_331070 - BLOCK
      ?auto_331071 - BLOCK
      ?auto_331072 - BLOCK
      ?auto_331073 - BLOCK
      ?auto_331074 - BLOCK
    )
    :vars
    (
      ?auto_331075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331074 ?auto_331075 ) ( ON-TABLE ?auto_331068 ) ( ON ?auto_331069 ?auto_331068 ) ( ON ?auto_331070 ?auto_331069 ) ( ON ?auto_331071 ?auto_331070 ) ( ON ?auto_331072 ?auto_331071 ) ( not ( = ?auto_331068 ?auto_331069 ) ) ( not ( = ?auto_331068 ?auto_331070 ) ) ( not ( = ?auto_331068 ?auto_331071 ) ) ( not ( = ?auto_331068 ?auto_331072 ) ) ( not ( = ?auto_331068 ?auto_331073 ) ) ( not ( = ?auto_331068 ?auto_331074 ) ) ( not ( = ?auto_331068 ?auto_331075 ) ) ( not ( = ?auto_331069 ?auto_331070 ) ) ( not ( = ?auto_331069 ?auto_331071 ) ) ( not ( = ?auto_331069 ?auto_331072 ) ) ( not ( = ?auto_331069 ?auto_331073 ) ) ( not ( = ?auto_331069 ?auto_331074 ) ) ( not ( = ?auto_331069 ?auto_331075 ) ) ( not ( = ?auto_331070 ?auto_331071 ) ) ( not ( = ?auto_331070 ?auto_331072 ) ) ( not ( = ?auto_331070 ?auto_331073 ) ) ( not ( = ?auto_331070 ?auto_331074 ) ) ( not ( = ?auto_331070 ?auto_331075 ) ) ( not ( = ?auto_331071 ?auto_331072 ) ) ( not ( = ?auto_331071 ?auto_331073 ) ) ( not ( = ?auto_331071 ?auto_331074 ) ) ( not ( = ?auto_331071 ?auto_331075 ) ) ( not ( = ?auto_331072 ?auto_331073 ) ) ( not ( = ?auto_331072 ?auto_331074 ) ) ( not ( = ?auto_331072 ?auto_331075 ) ) ( not ( = ?auto_331073 ?auto_331074 ) ) ( not ( = ?auto_331073 ?auto_331075 ) ) ( not ( = ?auto_331074 ?auto_331075 ) ) ( CLEAR ?auto_331072 ) ( ON ?auto_331073 ?auto_331074 ) ( CLEAR ?auto_331073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_331068 ?auto_331069 ?auto_331070 ?auto_331071 ?auto_331072 ?auto_331073 )
      ( MAKE-7PILE ?auto_331068 ?auto_331069 ?auto_331070 ?auto_331071 ?auto_331072 ?auto_331073 ?auto_331074 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_331083 - BLOCK
      ?auto_331084 - BLOCK
      ?auto_331085 - BLOCK
      ?auto_331086 - BLOCK
      ?auto_331087 - BLOCK
      ?auto_331088 - BLOCK
      ?auto_331089 - BLOCK
    )
    :vars
    (
      ?auto_331090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331089 ?auto_331090 ) ( ON-TABLE ?auto_331083 ) ( ON ?auto_331084 ?auto_331083 ) ( ON ?auto_331085 ?auto_331084 ) ( ON ?auto_331086 ?auto_331085 ) ( ON ?auto_331087 ?auto_331086 ) ( not ( = ?auto_331083 ?auto_331084 ) ) ( not ( = ?auto_331083 ?auto_331085 ) ) ( not ( = ?auto_331083 ?auto_331086 ) ) ( not ( = ?auto_331083 ?auto_331087 ) ) ( not ( = ?auto_331083 ?auto_331088 ) ) ( not ( = ?auto_331083 ?auto_331089 ) ) ( not ( = ?auto_331083 ?auto_331090 ) ) ( not ( = ?auto_331084 ?auto_331085 ) ) ( not ( = ?auto_331084 ?auto_331086 ) ) ( not ( = ?auto_331084 ?auto_331087 ) ) ( not ( = ?auto_331084 ?auto_331088 ) ) ( not ( = ?auto_331084 ?auto_331089 ) ) ( not ( = ?auto_331084 ?auto_331090 ) ) ( not ( = ?auto_331085 ?auto_331086 ) ) ( not ( = ?auto_331085 ?auto_331087 ) ) ( not ( = ?auto_331085 ?auto_331088 ) ) ( not ( = ?auto_331085 ?auto_331089 ) ) ( not ( = ?auto_331085 ?auto_331090 ) ) ( not ( = ?auto_331086 ?auto_331087 ) ) ( not ( = ?auto_331086 ?auto_331088 ) ) ( not ( = ?auto_331086 ?auto_331089 ) ) ( not ( = ?auto_331086 ?auto_331090 ) ) ( not ( = ?auto_331087 ?auto_331088 ) ) ( not ( = ?auto_331087 ?auto_331089 ) ) ( not ( = ?auto_331087 ?auto_331090 ) ) ( not ( = ?auto_331088 ?auto_331089 ) ) ( not ( = ?auto_331088 ?auto_331090 ) ) ( not ( = ?auto_331089 ?auto_331090 ) ) ( CLEAR ?auto_331087 ) ( ON ?auto_331088 ?auto_331089 ) ( CLEAR ?auto_331088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_331083 ?auto_331084 ?auto_331085 ?auto_331086 ?auto_331087 ?auto_331088 )
      ( MAKE-7PILE ?auto_331083 ?auto_331084 ?auto_331085 ?auto_331086 ?auto_331087 ?auto_331088 ?auto_331089 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_331098 - BLOCK
      ?auto_331099 - BLOCK
      ?auto_331100 - BLOCK
      ?auto_331101 - BLOCK
      ?auto_331102 - BLOCK
      ?auto_331103 - BLOCK
      ?auto_331104 - BLOCK
    )
    :vars
    (
      ?auto_331105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331104 ?auto_331105 ) ( ON-TABLE ?auto_331098 ) ( ON ?auto_331099 ?auto_331098 ) ( ON ?auto_331100 ?auto_331099 ) ( ON ?auto_331101 ?auto_331100 ) ( not ( = ?auto_331098 ?auto_331099 ) ) ( not ( = ?auto_331098 ?auto_331100 ) ) ( not ( = ?auto_331098 ?auto_331101 ) ) ( not ( = ?auto_331098 ?auto_331102 ) ) ( not ( = ?auto_331098 ?auto_331103 ) ) ( not ( = ?auto_331098 ?auto_331104 ) ) ( not ( = ?auto_331098 ?auto_331105 ) ) ( not ( = ?auto_331099 ?auto_331100 ) ) ( not ( = ?auto_331099 ?auto_331101 ) ) ( not ( = ?auto_331099 ?auto_331102 ) ) ( not ( = ?auto_331099 ?auto_331103 ) ) ( not ( = ?auto_331099 ?auto_331104 ) ) ( not ( = ?auto_331099 ?auto_331105 ) ) ( not ( = ?auto_331100 ?auto_331101 ) ) ( not ( = ?auto_331100 ?auto_331102 ) ) ( not ( = ?auto_331100 ?auto_331103 ) ) ( not ( = ?auto_331100 ?auto_331104 ) ) ( not ( = ?auto_331100 ?auto_331105 ) ) ( not ( = ?auto_331101 ?auto_331102 ) ) ( not ( = ?auto_331101 ?auto_331103 ) ) ( not ( = ?auto_331101 ?auto_331104 ) ) ( not ( = ?auto_331101 ?auto_331105 ) ) ( not ( = ?auto_331102 ?auto_331103 ) ) ( not ( = ?auto_331102 ?auto_331104 ) ) ( not ( = ?auto_331102 ?auto_331105 ) ) ( not ( = ?auto_331103 ?auto_331104 ) ) ( not ( = ?auto_331103 ?auto_331105 ) ) ( not ( = ?auto_331104 ?auto_331105 ) ) ( ON ?auto_331103 ?auto_331104 ) ( CLEAR ?auto_331101 ) ( ON ?auto_331102 ?auto_331103 ) ( CLEAR ?auto_331102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_331098 ?auto_331099 ?auto_331100 ?auto_331101 ?auto_331102 )
      ( MAKE-7PILE ?auto_331098 ?auto_331099 ?auto_331100 ?auto_331101 ?auto_331102 ?auto_331103 ?auto_331104 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_331113 - BLOCK
      ?auto_331114 - BLOCK
      ?auto_331115 - BLOCK
      ?auto_331116 - BLOCK
      ?auto_331117 - BLOCK
      ?auto_331118 - BLOCK
      ?auto_331119 - BLOCK
    )
    :vars
    (
      ?auto_331120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331119 ?auto_331120 ) ( ON-TABLE ?auto_331113 ) ( ON ?auto_331114 ?auto_331113 ) ( ON ?auto_331115 ?auto_331114 ) ( ON ?auto_331116 ?auto_331115 ) ( not ( = ?auto_331113 ?auto_331114 ) ) ( not ( = ?auto_331113 ?auto_331115 ) ) ( not ( = ?auto_331113 ?auto_331116 ) ) ( not ( = ?auto_331113 ?auto_331117 ) ) ( not ( = ?auto_331113 ?auto_331118 ) ) ( not ( = ?auto_331113 ?auto_331119 ) ) ( not ( = ?auto_331113 ?auto_331120 ) ) ( not ( = ?auto_331114 ?auto_331115 ) ) ( not ( = ?auto_331114 ?auto_331116 ) ) ( not ( = ?auto_331114 ?auto_331117 ) ) ( not ( = ?auto_331114 ?auto_331118 ) ) ( not ( = ?auto_331114 ?auto_331119 ) ) ( not ( = ?auto_331114 ?auto_331120 ) ) ( not ( = ?auto_331115 ?auto_331116 ) ) ( not ( = ?auto_331115 ?auto_331117 ) ) ( not ( = ?auto_331115 ?auto_331118 ) ) ( not ( = ?auto_331115 ?auto_331119 ) ) ( not ( = ?auto_331115 ?auto_331120 ) ) ( not ( = ?auto_331116 ?auto_331117 ) ) ( not ( = ?auto_331116 ?auto_331118 ) ) ( not ( = ?auto_331116 ?auto_331119 ) ) ( not ( = ?auto_331116 ?auto_331120 ) ) ( not ( = ?auto_331117 ?auto_331118 ) ) ( not ( = ?auto_331117 ?auto_331119 ) ) ( not ( = ?auto_331117 ?auto_331120 ) ) ( not ( = ?auto_331118 ?auto_331119 ) ) ( not ( = ?auto_331118 ?auto_331120 ) ) ( not ( = ?auto_331119 ?auto_331120 ) ) ( ON ?auto_331118 ?auto_331119 ) ( CLEAR ?auto_331116 ) ( ON ?auto_331117 ?auto_331118 ) ( CLEAR ?auto_331117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_331113 ?auto_331114 ?auto_331115 ?auto_331116 ?auto_331117 )
      ( MAKE-7PILE ?auto_331113 ?auto_331114 ?auto_331115 ?auto_331116 ?auto_331117 ?auto_331118 ?auto_331119 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_331128 - BLOCK
      ?auto_331129 - BLOCK
      ?auto_331130 - BLOCK
      ?auto_331131 - BLOCK
      ?auto_331132 - BLOCK
      ?auto_331133 - BLOCK
      ?auto_331134 - BLOCK
    )
    :vars
    (
      ?auto_331135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331134 ?auto_331135 ) ( ON-TABLE ?auto_331128 ) ( ON ?auto_331129 ?auto_331128 ) ( ON ?auto_331130 ?auto_331129 ) ( not ( = ?auto_331128 ?auto_331129 ) ) ( not ( = ?auto_331128 ?auto_331130 ) ) ( not ( = ?auto_331128 ?auto_331131 ) ) ( not ( = ?auto_331128 ?auto_331132 ) ) ( not ( = ?auto_331128 ?auto_331133 ) ) ( not ( = ?auto_331128 ?auto_331134 ) ) ( not ( = ?auto_331128 ?auto_331135 ) ) ( not ( = ?auto_331129 ?auto_331130 ) ) ( not ( = ?auto_331129 ?auto_331131 ) ) ( not ( = ?auto_331129 ?auto_331132 ) ) ( not ( = ?auto_331129 ?auto_331133 ) ) ( not ( = ?auto_331129 ?auto_331134 ) ) ( not ( = ?auto_331129 ?auto_331135 ) ) ( not ( = ?auto_331130 ?auto_331131 ) ) ( not ( = ?auto_331130 ?auto_331132 ) ) ( not ( = ?auto_331130 ?auto_331133 ) ) ( not ( = ?auto_331130 ?auto_331134 ) ) ( not ( = ?auto_331130 ?auto_331135 ) ) ( not ( = ?auto_331131 ?auto_331132 ) ) ( not ( = ?auto_331131 ?auto_331133 ) ) ( not ( = ?auto_331131 ?auto_331134 ) ) ( not ( = ?auto_331131 ?auto_331135 ) ) ( not ( = ?auto_331132 ?auto_331133 ) ) ( not ( = ?auto_331132 ?auto_331134 ) ) ( not ( = ?auto_331132 ?auto_331135 ) ) ( not ( = ?auto_331133 ?auto_331134 ) ) ( not ( = ?auto_331133 ?auto_331135 ) ) ( not ( = ?auto_331134 ?auto_331135 ) ) ( ON ?auto_331133 ?auto_331134 ) ( ON ?auto_331132 ?auto_331133 ) ( CLEAR ?auto_331130 ) ( ON ?auto_331131 ?auto_331132 ) ( CLEAR ?auto_331131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_331128 ?auto_331129 ?auto_331130 ?auto_331131 )
      ( MAKE-7PILE ?auto_331128 ?auto_331129 ?auto_331130 ?auto_331131 ?auto_331132 ?auto_331133 ?auto_331134 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_331143 - BLOCK
      ?auto_331144 - BLOCK
      ?auto_331145 - BLOCK
      ?auto_331146 - BLOCK
      ?auto_331147 - BLOCK
      ?auto_331148 - BLOCK
      ?auto_331149 - BLOCK
    )
    :vars
    (
      ?auto_331150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331149 ?auto_331150 ) ( ON-TABLE ?auto_331143 ) ( ON ?auto_331144 ?auto_331143 ) ( ON ?auto_331145 ?auto_331144 ) ( not ( = ?auto_331143 ?auto_331144 ) ) ( not ( = ?auto_331143 ?auto_331145 ) ) ( not ( = ?auto_331143 ?auto_331146 ) ) ( not ( = ?auto_331143 ?auto_331147 ) ) ( not ( = ?auto_331143 ?auto_331148 ) ) ( not ( = ?auto_331143 ?auto_331149 ) ) ( not ( = ?auto_331143 ?auto_331150 ) ) ( not ( = ?auto_331144 ?auto_331145 ) ) ( not ( = ?auto_331144 ?auto_331146 ) ) ( not ( = ?auto_331144 ?auto_331147 ) ) ( not ( = ?auto_331144 ?auto_331148 ) ) ( not ( = ?auto_331144 ?auto_331149 ) ) ( not ( = ?auto_331144 ?auto_331150 ) ) ( not ( = ?auto_331145 ?auto_331146 ) ) ( not ( = ?auto_331145 ?auto_331147 ) ) ( not ( = ?auto_331145 ?auto_331148 ) ) ( not ( = ?auto_331145 ?auto_331149 ) ) ( not ( = ?auto_331145 ?auto_331150 ) ) ( not ( = ?auto_331146 ?auto_331147 ) ) ( not ( = ?auto_331146 ?auto_331148 ) ) ( not ( = ?auto_331146 ?auto_331149 ) ) ( not ( = ?auto_331146 ?auto_331150 ) ) ( not ( = ?auto_331147 ?auto_331148 ) ) ( not ( = ?auto_331147 ?auto_331149 ) ) ( not ( = ?auto_331147 ?auto_331150 ) ) ( not ( = ?auto_331148 ?auto_331149 ) ) ( not ( = ?auto_331148 ?auto_331150 ) ) ( not ( = ?auto_331149 ?auto_331150 ) ) ( ON ?auto_331148 ?auto_331149 ) ( ON ?auto_331147 ?auto_331148 ) ( CLEAR ?auto_331145 ) ( ON ?auto_331146 ?auto_331147 ) ( CLEAR ?auto_331146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_331143 ?auto_331144 ?auto_331145 ?auto_331146 )
      ( MAKE-7PILE ?auto_331143 ?auto_331144 ?auto_331145 ?auto_331146 ?auto_331147 ?auto_331148 ?auto_331149 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_331158 - BLOCK
      ?auto_331159 - BLOCK
      ?auto_331160 - BLOCK
      ?auto_331161 - BLOCK
      ?auto_331162 - BLOCK
      ?auto_331163 - BLOCK
      ?auto_331164 - BLOCK
    )
    :vars
    (
      ?auto_331165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331164 ?auto_331165 ) ( ON-TABLE ?auto_331158 ) ( ON ?auto_331159 ?auto_331158 ) ( not ( = ?auto_331158 ?auto_331159 ) ) ( not ( = ?auto_331158 ?auto_331160 ) ) ( not ( = ?auto_331158 ?auto_331161 ) ) ( not ( = ?auto_331158 ?auto_331162 ) ) ( not ( = ?auto_331158 ?auto_331163 ) ) ( not ( = ?auto_331158 ?auto_331164 ) ) ( not ( = ?auto_331158 ?auto_331165 ) ) ( not ( = ?auto_331159 ?auto_331160 ) ) ( not ( = ?auto_331159 ?auto_331161 ) ) ( not ( = ?auto_331159 ?auto_331162 ) ) ( not ( = ?auto_331159 ?auto_331163 ) ) ( not ( = ?auto_331159 ?auto_331164 ) ) ( not ( = ?auto_331159 ?auto_331165 ) ) ( not ( = ?auto_331160 ?auto_331161 ) ) ( not ( = ?auto_331160 ?auto_331162 ) ) ( not ( = ?auto_331160 ?auto_331163 ) ) ( not ( = ?auto_331160 ?auto_331164 ) ) ( not ( = ?auto_331160 ?auto_331165 ) ) ( not ( = ?auto_331161 ?auto_331162 ) ) ( not ( = ?auto_331161 ?auto_331163 ) ) ( not ( = ?auto_331161 ?auto_331164 ) ) ( not ( = ?auto_331161 ?auto_331165 ) ) ( not ( = ?auto_331162 ?auto_331163 ) ) ( not ( = ?auto_331162 ?auto_331164 ) ) ( not ( = ?auto_331162 ?auto_331165 ) ) ( not ( = ?auto_331163 ?auto_331164 ) ) ( not ( = ?auto_331163 ?auto_331165 ) ) ( not ( = ?auto_331164 ?auto_331165 ) ) ( ON ?auto_331163 ?auto_331164 ) ( ON ?auto_331162 ?auto_331163 ) ( ON ?auto_331161 ?auto_331162 ) ( CLEAR ?auto_331159 ) ( ON ?auto_331160 ?auto_331161 ) ( CLEAR ?auto_331160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_331158 ?auto_331159 ?auto_331160 )
      ( MAKE-7PILE ?auto_331158 ?auto_331159 ?auto_331160 ?auto_331161 ?auto_331162 ?auto_331163 ?auto_331164 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_331173 - BLOCK
      ?auto_331174 - BLOCK
      ?auto_331175 - BLOCK
      ?auto_331176 - BLOCK
      ?auto_331177 - BLOCK
      ?auto_331178 - BLOCK
      ?auto_331179 - BLOCK
    )
    :vars
    (
      ?auto_331180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331179 ?auto_331180 ) ( ON-TABLE ?auto_331173 ) ( ON ?auto_331174 ?auto_331173 ) ( not ( = ?auto_331173 ?auto_331174 ) ) ( not ( = ?auto_331173 ?auto_331175 ) ) ( not ( = ?auto_331173 ?auto_331176 ) ) ( not ( = ?auto_331173 ?auto_331177 ) ) ( not ( = ?auto_331173 ?auto_331178 ) ) ( not ( = ?auto_331173 ?auto_331179 ) ) ( not ( = ?auto_331173 ?auto_331180 ) ) ( not ( = ?auto_331174 ?auto_331175 ) ) ( not ( = ?auto_331174 ?auto_331176 ) ) ( not ( = ?auto_331174 ?auto_331177 ) ) ( not ( = ?auto_331174 ?auto_331178 ) ) ( not ( = ?auto_331174 ?auto_331179 ) ) ( not ( = ?auto_331174 ?auto_331180 ) ) ( not ( = ?auto_331175 ?auto_331176 ) ) ( not ( = ?auto_331175 ?auto_331177 ) ) ( not ( = ?auto_331175 ?auto_331178 ) ) ( not ( = ?auto_331175 ?auto_331179 ) ) ( not ( = ?auto_331175 ?auto_331180 ) ) ( not ( = ?auto_331176 ?auto_331177 ) ) ( not ( = ?auto_331176 ?auto_331178 ) ) ( not ( = ?auto_331176 ?auto_331179 ) ) ( not ( = ?auto_331176 ?auto_331180 ) ) ( not ( = ?auto_331177 ?auto_331178 ) ) ( not ( = ?auto_331177 ?auto_331179 ) ) ( not ( = ?auto_331177 ?auto_331180 ) ) ( not ( = ?auto_331178 ?auto_331179 ) ) ( not ( = ?auto_331178 ?auto_331180 ) ) ( not ( = ?auto_331179 ?auto_331180 ) ) ( ON ?auto_331178 ?auto_331179 ) ( ON ?auto_331177 ?auto_331178 ) ( ON ?auto_331176 ?auto_331177 ) ( CLEAR ?auto_331174 ) ( ON ?auto_331175 ?auto_331176 ) ( CLEAR ?auto_331175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_331173 ?auto_331174 ?auto_331175 )
      ( MAKE-7PILE ?auto_331173 ?auto_331174 ?auto_331175 ?auto_331176 ?auto_331177 ?auto_331178 ?auto_331179 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_331188 - BLOCK
      ?auto_331189 - BLOCK
      ?auto_331190 - BLOCK
      ?auto_331191 - BLOCK
      ?auto_331192 - BLOCK
      ?auto_331193 - BLOCK
      ?auto_331194 - BLOCK
    )
    :vars
    (
      ?auto_331195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331194 ?auto_331195 ) ( ON-TABLE ?auto_331188 ) ( not ( = ?auto_331188 ?auto_331189 ) ) ( not ( = ?auto_331188 ?auto_331190 ) ) ( not ( = ?auto_331188 ?auto_331191 ) ) ( not ( = ?auto_331188 ?auto_331192 ) ) ( not ( = ?auto_331188 ?auto_331193 ) ) ( not ( = ?auto_331188 ?auto_331194 ) ) ( not ( = ?auto_331188 ?auto_331195 ) ) ( not ( = ?auto_331189 ?auto_331190 ) ) ( not ( = ?auto_331189 ?auto_331191 ) ) ( not ( = ?auto_331189 ?auto_331192 ) ) ( not ( = ?auto_331189 ?auto_331193 ) ) ( not ( = ?auto_331189 ?auto_331194 ) ) ( not ( = ?auto_331189 ?auto_331195 ) ) ( not ( = ?auto_331190 ?auto_331191 ) ) ( not ( = ?auto_331190 ?auto_331192 ) ) ( not ( = ?auto_331190 ?auto_331193 ) ) ( not ( = ?auto_331190 ?auto_331194 ) ) ( not ( = ?auto_331190 ?auto_331195 ) ) ( not ( = ?auto_331191 ?auto_331192 ) ) ( not ( = ?auto_331191 ?auto_331193 ) ) ( not ( = ?auto_331191 ?auto_331194 ) ) ( not ( = ?auto_331191 ?auto_331195 ) ) ( not ( = ?auto_331192 ?auto_331193 ) ) ( not ( = ?auto_331192 ?auto_331194 ) ) ( not ( = ?auto_331192 ?auto_331195 ) ) ( not ( = ?auto_331193 ?auto_331194 ) ) ( not ( = ?auto_331193 ?auto_331195 ) ) ( not ( = ?auto_331194 ?auto_331195 ) ) ( ON ?auto_331193 ?auto_331194 ) ( ON ?auto_331192 ?auto_331193 ) ( ON ?auto_331191 ?auto_331192 ) ( ON ?auto_331190 ?auto_331191 ) ( CLEAR ?auto_331188 ) ( ON ?auto_331189 ?auto_331190 ) ( CLEAR ?auto_331189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_331188 ?auto_331189 )
      ( MAKE-7PILE ?auto_331188 ?auto_331189 ?auto_331190 ?auto_331191 ?auto_331192 ?auto_331193 ?auto_331194 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_331203 - BLOCK
      ?auto_331204 - BLOCK
      ?auto_331205 - BLOCK
      ?auto_331206 - BLOCK
      ?auto_331207 - BLOCK
      ?auto_331208 - BLOCK
      ?auto_331209 - BLOCK
    )
    :vars
    (
      ?auto_331210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331209 ?auto_331210 ) ( ON-TABLE ?auto_331203 ) ( not ( = ?auto_331203 ?auto_331204 ) ) ( not ( = ?auto_331203 ?auto_331205 ) ) ( not ( = ?auto_331203 ?auto_331206 ) ) ( not ( = ?auto_331203 ?auto_331207 ) ) ( not ( = ?auto_331203 ?auto_331208 ) ) ( not ( = ?auto_331203 ?auto_331209 ) ) ( not ( = ?auto_331203 ?auto_331210 ) ) ( not ( = ?auto_331204 ?auto_331205 ) ) ( not ( = ?auto_331204 ?auto_331206 ) ) ( not ( = ?auto_331204 ?auto_331207 ) ) ( not ( = ?auto_331204 ?auto_331208 ) ) ( not ( = ?auto_331204 ?auto_331209 ) ) ( not ( = ?auto_331204 ?auto_331210 ) ) ( not ( = ?auto_331205 ?auto_331206 ) ) ( not ( = ?auto_331205 ?auto_331207 ) ) ( not ( = ?auto_331205 ?auto_331208 ) ) ( not ( = ?auto_331205 ?auto_331209 ) ) ( not ( = ?auto_331205 ?auto_331210 ) ) ( not ( = ?auto_331206 ?auto_331207 ) ) ( not ( = ?auto_331206 ?auto_331208 ) ) ( not ( = ?auto_331206 ?auto_331209 ) ) ( not ( = ?auto_331206 ?auto_331210 ) ) ( not ( = ?auto_331207 ?auto_331208 ) ) ( not ( = ?auto_331207 ?auto_331209 ) ) ( not ( = ?auto_331207 ?auto_331210 ) ) ( not ( = ?auto_331208 ?auto_331209 ) ) ( not ( = ?auto_331208 ?auto_331210 ) ) ( not ( = ?auto_331209 ?auto_331210 ) ) ( ON ?auto_331208 ?auto_331209 ) ( ON ?auto_331207 ?auto_331208 ) ( ON ?auto_331206 ?auto_331207 ) ( ON ?auto_331205 ?auto_331206 ) ( CLEAR ?auto_331203 ) ( ON ?auto_331204 ?auto_331205 ) ( CLEAR ?auto_331204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_331203 ?auto_331204 )
      ( MAKE-7PILE ?auto_331203 ?auto_331204 ?auto_331205 ?auto_331206 ?auto_331207 ?auto_331208 ?auto_331209 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_331218 - BLOCK
      ?auto_331219 - BLOCK
      ?auto_331220 - BLOCK
      ?auto_331221 - BLOCK
      ?auto_331222 - BLOCK
      ?auto_331223 - BLOCK
      ?auto_331224 - BLOCK
    )
    :vars
    (
      ?auto_331225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331224 ?auto_331225 ) ( not ( = ?auto_331218 ?auto_331219 ) ) ( not ( = ?auto_331218 ?auto_331220 ) ) ( not ( = ?auto_331218 ?auto_331221 ) ) ( not ( = ?auto_331218 ?auto_331222 ) ) ( not ( = ?auto_331218 ?auto_331223 ) ) ( not ( = ?auto_331218 ?auto_331224 ) ) ( not ( = ?auto_331218 ?auto_331225 ) ) ( not ( = ?auto_331219 ?auto_331220 ) ) ( not ( = ?auto_331219 ?auto_331221 ) ) ( not ( = ?auto_331219 ?auto_331222 ) ) ( not ( = ?auto_331219 ?auto_331223 ) ) ( not ( = ?auto_331219 ?auto_331224 ) ) ( not ( = ?auto_331219 ?auto_331225 ) ) ( not ( = ?auto_331220 ?auto_331221 ) ) ( not ( = ?auto_331220 ?auto_331222 ) ) ( not ( = ?auto_331220 ?auto_331223 ) ) ( not ( = ?auto_331220 ?auto_331224 ) ) ( not ( = ?auto_331220 ?auto_331225 ) ) ( not ( = ?auto_331221 ?auto_331222 ) ) ( not ( = ?auto_331221 ?auto_331223 ) ) ( not ( = ?auto_331221 ?auto_331224 ) ) ( not ( = ?auto_331221 ?auto_331225 ) ) ( not ( = ?auto_331222 ?auto_331223 ) ) ( not ( = ?auto_331222 ?auto_331224 ) ) ( not ( = ?auto_331222 ?auto_331225 ) ) ( not ( = ?auto_331223 ?auto_331224 ) ) ( not ( = ?auto_331223 ?auto_331225 ) ) ( not ( = ?auto_331224 ?auto_331225 ) ) ( ON ?auto_331223 ?auto_331224 ) ( ON ?auto_331222 ?auto_331223 ) ( ON ?auto_331221 ?auto_331222 ) ( ON ?auto_331220 ?auto_331221 ) ( ON ?auto_331219 ?auto_331220 ) ( ON ?auto_331218 ?auto_331219 ) ( CLEAR ?auto_331218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_331218 )
      ( MAKE-7PILE ?auto_331218 ?auto_331219 ?auto_331220 ?auto_331221 ?auto_331222 ?auto_331223 ?auto_331224 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_331233 - BLOCK
      ?auto_331234 - BLOCK
      ?auto_331235 - BLOCK
      ?auto_331236 - BLOCK
      ?auto_331237 - BLOCK
      ?auto_331238 - BLOCK
      ?auto_331239 - BLOCK
    )
    :vars
    (
      ?auto_331240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331239 ?auto_331240 ) ( not ( = ?auto_331233 ?auto_331234 ) ) ( not ( = ?auto_331233 ?auto_331235 ) ) ( not ( = ?auto_331233 ?auto_331236 ) ) ( not ( = ?auto_331233 ?auto_331237 ) ) ( not ( = ?auto_331233 ?auto_331238 ) ) ( not ( = ?auto_331233 ?auto_331239 ) ) ( not ( = ?auto_331233 ?auto_331240 ) ) ( not ( = ?auto_331234 ?auto_331235 ) ) ( not ( = ?auto_331234 ?auto_331236 ) ) ( not ( = ?auto_331234 ?auto_331237 ) ) ( not ( = ?auto_331234 ?auto_331238 ) ) ( not ( = ?auto_331234 ?auto_331239 ) ) ( not ( = ?auto_331234 ?auto_331240 ) ) ( not ( = ?auto_331235 ?auto_331236 ) ) ( not ( = ?auto_331235 ?auto_331237 ) ) ( not ( = ?auto_331235 ?auto_331238 ) ) ( not ( = ?auto_331235 ?auto_331239 ) ) ( not ( = ?auto_331235 ?auto_331240 ) ) ( not ( = ?auto_331236 ?auto_331237 ) ) ( not ( = ?auto_331236 ?auto_331238 ) ) ( not ( = ?auto_331236 ?auto_331239 ) ) ( not ( = ?auto_331236 ?auto_331240 ) ) ( not ( = ?auto_331237 ?auto_331238 ) ) ( not ( = ?auto_331237 ?auto_331239 ) ) ( not ( = ?auto_331237 ?auto_331240 ) ) ( not ( = ?auto_331238 ?auto_331239 ) ) ( not ( = ?auto_331238 ?auto_331240 ) ) ( not ( = ?auto_331239 ?auto_331240 ) ) ( ON ?auto_331238 ?auto_331239 ) ( ON ?auto_331237 ?auto_331238 ) ( ON ?auto_331236 ?auto_331237 ) ( ON ?auto_331235 ?auto_331236 ) ( ON ?auto_331234 ?auto_331235 ) ( ON ?auto_331233 ?auto_331234 ) ( CLEAR ?auto_331233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_331233 )
      ( MAKE-7PILE ?auto_331233 ?auto_331234 ?auto_331235 ?auto_331236 ?auto_331237 ?auto_331238 ?auto_331239 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_331249 - BLOCK
      ?auto_331250 - BLOCK
      ?auto_331251 - BLOCK
      ?auto_331252 - BLOCK
      ?auto_331253 - BLOCK
      ?auto_331254 - BLOCK
      ?auto_331255 - BLOCK
      ?auto_331256 - BLOCK
    )
    :vars
    (
      ?auto_331257 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_331255 ) ( ON ?auto_331256 ?auto_331257 ) ( CLEAR ?auto_331256 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_331249 ) ( ON ?auto_331250 ?auto_331249 ) ( ON ?auto_331251 ?auto_331250 ) ( ON ?auto_331252 ?auto_331251 ) ( ON ?auto_331253 ?auto_331252 ) ( ON ?auto_331254 ?auto_331253 ) ( ON ?auto_331255 ?auto_331254 ) ( not ( = ?auto_331249 ?auto_331250 ) ) ( not ( = ?auto_331249 ?auto_331251 ) ) ( not ( = ?auto_331249 ?auto_331252 ) ) ( not ( = ?auto_331249 ?auto_331253 ) ) ( not ( = ?auto_331249 ?auto_331254 ) ) ( not ( = ?auto_331249 ?auto_331255 ) ) ( not ( = ?auto_331249 ?auto_331256 ) ) ( not ( = ?auto_331249 ?auto_331257 ) ) ( not ( = ?auto_331250 ?auto_331251 ) ) ( not ( = ?auto_331250 ?auto_331252 ) ) ( not ( = ?auto_331250 ?auto_331253 ) ) ( not ( = ?auto_331250 ?auto_331254 ) ) ( not ( = ?auto_331250 ?auto_331255 ) ) ( not ( = ?auto_331250 ?auto_331256 ) ) ( not ( = ?auto_331250 ?auto_331257 ) ) ( not ( = ?auto_331251 ?auto_331252 ) ) ( not ( = ?auto_331251 ?auto_331253 ) ) ( not ( = ?auto_331251 ?auto_331254 ) ) ( not ( = ?auto_331251 ?auto_331255 ) ) ( not ( = ?auto_331251 ?auto_331256 ) ) ( not ( = ?auto_331251 ?auto_331257 ) ) ( not ( = ?auto_331252 ?auto_331253 ) ) ( not ( = ?auto_331252 ?auto_331254 ) ) ( not ( = ?auto_331252 ?auto_331255 ) ) ( not ( = ?auto_331252 ?auto_331256 ) ) ( not ( = ?auto_331252 ?auto_331257 ) ) ( not ( = ?auto_331253 ?auto_331254 ) ) ( not ( = ?auto_331253 ?auto_331255 ) ) ( not ( = ?auto_331253 ?auto_331256 ) ) ( not ( = ?auto_331253 ?auto_331257 ) ) ( not ( = ?auto_331254 ?auto_331255 ) ) ( not ( = ?auto_331254 ?auto_331256 ) ) ( not ( = ?auto_331254 ?auto_331257 ) ) ( not ( = ?auto_331255 ?auto_331256 ) ) ( not ( = ?auto_331255 ?auto_331257 ) ) ( not ( = ?auto_331256 ?auto_331257 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_331256 ?auto_331257 )
      ( !STACK ?auto_331256 ?auto_331255 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_331266 - BLOCK
      ?auto_331267 - BLOCK
      ?auto_331268 - BLOCK
      ?auto_331269 - BLOCK
      ?auto_331270 - BLOCK
      ?auto_331271 - BLOCK
      ?auto_331272 - BLOCK
      ?auto_331273 - BLOCK
    )
    :vars
    (
      ?auto_331274 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_331272 ) ( ON ?auto_331273 ?auto_331274 ) ( CLEAR ?auto_331273 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_331266 ) ( ON ?auto_331267 ?auto_331266 ) ( ON ?auto_331268 ?auto_331267 ) ( ON ?auto_331269 ?auto_331268 ) ( ON ?auto_331270 ?auto_331269 ) ( ON ?auto_331271 ?auto_331270 ) ( ON ?auto_331272 ?auto_331271 ) ( not ( = ?auto_331266 ?auto_331267 ) ) ( not ( = ?auto_331266 ?auto_331268 ) ) ( not ( = ?auto_331266 ?auto_331269 ) ) ( not ( = ?auto_331266 ?auto_331270 ) ) ( not ( = ?auto_331266 ?auto_331271 ) ) ( not ( = ?auto_331266 ?auto_331272 ) ) ( not ( = ?auto_331266 ?auto_331273 ) ) ( not ( = ?auto_331266 ?auto_331274 ) ) ( not ( = ?auto_331267 ?auto_331268 ) ) ( not ( = ?auto_331267 ?auto_331269 ) ) ( not ( = ?auto_331267 ?auto_331270 ) ) ( not ( = ?auto_331267 ?auto_331271 ) ) ( not ( = ?auto_331267 ?auto_331272 ) ) ( not ( = ?auto_331267 ?auto_331273 ) ) ( not ( = ?auto_331267 ?auto_331274 ) ) ( not ( = ?auto_331268 ?auto_331269 ) ) ( not ( = ?auto_331268 ?auto_331270 ) ) ( not ( = ?auto_331268 ?auto_331271 ) ) ( not ( = ?auto_331268 ?auto_331272 ) ) ( not ( = ?auto_331268 ?auto_331273 ) ) ( not ( = ?auto_331268 ?auto_331274 ) ) ( not ( = ?auto_331269 ?auto_331270 ) ) ( not ( = ?auto_331269 ?auto_331271 ) ) ( not ( = ?auto_331269 ?auto_331272 ) ) ( not ( = ?auto_331269 ?auto_331273 ) ) ( not ( = ?auto_331269 ?auto_331274 ) ) ( not ( = ?auto_331270 ?auto_331271 ) ) ( not ( = ?auto_331270 ?auto_331272 ) ) ( not ( = ?auto_331270 ?auto_331273 ) ) ( not ( = ?auto_331270 ?auto_331274 ) ) ( not ( = ?auto_331271 ?auto_331272 ) ) ( not ( = ?auto_331271 ?auto_331273 ) ) ( not ( = ?auto_331271 ?auto_331274 ) ) ( not ( = ?auto_331272 ?auto_331273 ) ) ( not ( = ?auto_331272 ?auto_331274 ) ) ( not ( = ?auto_331273 ?auto_331274 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_331273 ?auto_331274 )
      ( !STACK ?auto_331273 ?auto_331272 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_331283 - BLOCK
      ?auto_331284 - BLOCK
      ?auto_331285 - BLOCK
      ?auto_331286 - BLOCK
      ?auto_331287 - BLOCK
      ?auto_331288 - BLOCK
      ?auto_331289 - BLOCK
      ?auto_331290 - BLOCK
    )
    :vars
    (
      ?auto_331291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331290 ?auto_331291 ) ( ON-TABLE ?auto_331283 ) ( ON ?auto_331284 ?auto_331283 ) ( ON ?auto_331285 ?auto_331284 ) ( ON ?auto_331286 ?auto_331285 ) ( ON ?auto_331287 ?auto_331286 ) ( ON ?auto_331288 ?auto_331287 ) ( not ( = ?auto_331283 ?auto_331284 ) ) ( not ( = ?auto_331283 ?auto_331285 ) ) ( not ( = ?auto_331283 ?auto_331286 ) ) ( not ( = ?auto_331283 ?auto_331287 ) ) ( not ( = ?auto_331283 ?auto_331288 ) ) ( not ( = ?auto_331283 ?auto_331289 ) ) ( not ( = ?auto_331283 ?auto_331290 ) ) ( not ( = ?auto_331283 ?auto_331291 ) ) ( not ( = ?auto_331284 ?auto_331285 ) ) ( not ( = ?auto_331284 ?auto_331286 ) ) ( not ( = ?auto_331284 ?auto_331287 ) ) ( not ( = ?auto_331284 ?auto_331288 ) ) ( not ( = ?auto_331284 ?auto_331289 ) ) ( not ( = ?auto_331284 ?auto_331290 ) ) ( not ( = ?auto_331284 ?auto_331291 ) ) ( not ( = ?auto_331285 ?auto_331286 ) ) ( not ( = ?auto_331285 ?auto_331287 ) ) ( not ( = ?auto_331285 ?auto_331288 ) ) ( not ( = ?auto_331285 ?auto_331289 ) ) ( not ( = ?auto_331285 ?auto_331290 ) ) ( not ( = ?auto_331285 ?auto_331291 ) ) ( not ( = ?auto_331286 ?auto_331287 ) ) ( not ( = ?auto_331286 ?auto_331288 ) ) ( not ( = ?auto_331286 ?auto_331289 ) ) ( not ( = ?auto_331286 ?auto_331290 ) ) ( not ( = ?auto_331286 ?auto_331291 ) ) ( not ( = ?auto_331287 ?auto_331288 ) ) ( not ( = ?auto_331287 ?auto_331289 ) ) ( not ( = ?auto_331287 ?auto_331290 ) ) ( not ( = ?auto_331287 ?auto_331291 ) ) ( not ( = ?auto_331288 ?auto_331289 ) ) ( not ( = ?auto_331288 ?auto_331290 ) ) ( not ( = ?auto_331288 ?auto_331291 ) ) ( not ( = ?auto_331289 ?auto_331290 ) ) ( not ( = ?auto_331289 ?auto_331291 ) ) ( not ( = ?auto_331290 ?auto_331291 ) ) ( CLEAR ?auto_331288 ) ( ON ?auto_331289 ?auto_331290 ) ( CLEAR ?auto_331289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_331283 ?auto_331284 ?auto_331285 ?auto_331286 ?auto_331287 ?auto_331288 ?auto_331289 )
      ( MAKE-8PILE ?auto_331283 ?auto_331284 ?auto_331285 ?auto_331286 ?auto_331287 ?auto_331288 ?auto_331289 ?auto_331290 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_331300 - BLOCK
      ?auto_331301 - BLOCK
      ?auto_331302 - BLOCK
      ?auto_331303 - BLOCK
      ?auto_331304 - BLOCK
      ?auto_331305 - BLOCK
      ?auto_331306 - BLOCK
      ?auto_331307 - BLOCK
    )
    :vars
    (
      ?auto_331308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331307 ?auto_331308 ) ( ON-TABLE ?auto_331300 ) ( ON ?auto_331301 ?auto_331300 ) ( ON ?auto_331302 ?auto_331301 ) ( ON ?auto_331303 ?auto_331302 ) ( ON ?auto_331304 ?auto_331303 ) ( ON ?auto_331305 ?auto_331304 ) ( not ( = ?auto_331300 ?auto_331301 ) ) ( not ( = ?auto_331300 ?auto_331302 ) ) ( not ( = ?auto_331300 ?auto_331303 ) ) ( not ( = ?auto_331300 ?auto_331304 ) ) ( not ( = ?auto_331300 ?auto_331305 ) ) ( not ( = ?auto_331300 ?auto_331306 ) ) ( not ( = ?auto_331300 ?auto_331307 ) ) ( not ( = ?auto_331300 ?auto_331308 ) ) ( not ( = ?auto_331301 ?auto_331302 ) ) ( not ( = ?auto_331301 ?auto_331303 ) ) ( not ( = ?auto_331301 ?auto_331304 ) ) ( not ( = ?auto_331301 ?auto_331305 ) ) ( not ( = ?auto_331301 ?auto_331306 ) ) ( not ( = ?auto_331301 ?auto_331307 ) ) ( not ( = ?auto_331301 ?auto_331308 ) ) ( not ( = ?auto_331302 ?auto_331303 ) ) ( not ( = ?auto_331302 ?auto_331304 ) ) ( not ( = ?auto_331302 ?auto_331305 ) ) ( not ( = ?auto_331302 ?auto_331306 ) ) ( not ( = ?auto_331302 ?auto_331307 ) ) ( not ( = ?auto_331302 ?auto_331308 ) ) ( not ( = ?auto_331303 ?auto_331304 ) ) ( not ( = ?auto_331303 ?auto_331305 ) ) ( not ( = ?auto_331303 ?auto_331306 ) ) ( not ( = ?auto_331303 ?auto_331307 ) ) ( not ( = ?auto_331303 ?auto_331308 ) ) ( not ( = ?auto_331304 ?auto_331305 ) ) ( not ( = ?auto_331304 ?auto_331306 ) ) ( not ( = ?auto_331304 ?auto_331307 ) ) ( not ( = ?auto_331304 ?auto_331308 ) ) ( not ( = ?auto_331305 ?auto_331306 ) ) ( not ( = ?auto_331305 ?auto_331307 ) ) ( not ( = ?auto_331305 ?auto_331308 ) ) ( not ( = ?auto_331306 ?auto_331307 ) ) ( not ( = ?auto_331306 ?auto_331308 ) ) ( not ( = ?auto_331307 ?auto_331308 ) ) ( CLEAR ?auto_331305 ) ( ON ?auto_331306 ?auto_331307 ) ( CLEAR ?auto_331306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_331300 ?auto_331301 ?auto_331302 ?auto_331303 ?auto_331304 ?auto_331305 ?auto_331306 )
      ( MAKE-8PILE ?auto_331300 ?auto_331301 ?auto_331302 ?auto_331303 ?auto_331304 ?auto_331305 ?auto_331306 ?auto_331307 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_331317 - BLOCK
      ?auto_331318 - BLOCK
      ?auto_331319 - BLOCK
      ?auto_331320 - BLOCK
      ?auto_331321 - BLOCK
      ?auto_331322 - BLOCK
      ?auto_331323 - BLOCK
      ?auto_331324 - BLOCK
    )
    :vars
    (
      ?auto_331325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331324 ?auto_331325 ) ( ON-TABLE ?auto_331317 ) ( ON ?auto_331318 ?auto_331317 ) ( ON ?auto_331319 ?auto_331318 ) ( ON ?auto_331320 ?auto_331319 ) ( ON ?auto_331321 ?auto_331320 ) ( not ( = ?auto_331317 ?auto_331318 ) ) ( not ( = ?auto_331317 ?auto_331319 ) ) ( not ( = ?auto_331317 ?auto_331320 ) ) ( not ( = ?auto_331317 ?auto_331321 ) ) ( not ( = ?auto_331317 ?auto_331322 ) ) ( not ( = ?auto_331317 ?auto_331323 ) ) ( not ( = ?auto_331317 ?auto_331324 ) ) ( not ( = ?auto_331317 ?auto_331325 ) ) ( not ( = ?auto_331318 ?auto_331319 ) ) ( not ( = ?auto_331318 ?auto_331320 ) ) ( not ( = ?auto_331318 ?auto_331321 ) ) ( not ( = ?auto_331318 ?auto_331322 ) ) ( not ( = ?auto_331318 ?auto_331323 ) ) ( not ( = ?auto_331318 ?auto_331324 ) ) ( not ( = ?auto_331318 ?auto_331325 ) ) ( not ( = ?auto_331319 ?auto_331320 ) ) ( not ( = ?auto_331319 ?auto_331321 ) ) ( not ( = ?auto_331319 ?auto_331322 ) ) ( not ( = ?auto_331319 ?auto_331323 ) ) ( not ( = ?auto_331319 ?auto_331324 ) ) ( not ( = ?auto_331319 ?auto_331325 ) ) ( not ( = ?auto_331320 ?auto_331321 ) ) ( not ( = ?auto_331320 ?auto_331322 ) ) ( not ( = ?auto_331320 ?auto_331323 ) ) ( not ( = ?auto_331320 ?auto_331324 ) ) ( not ( = ?auto_331320 ?auto_331325 ) ) ( not ( = ?auto_331321 ?auto_331322 ) ) ( not ( = ?auto_331321 ?auto_331323 ) ) ( not ( = ?auto_331321 ?auto_331324 ) ) ( not ( = ?auto_331321 ?auto_331325 ) ) ( not ( = ?auto_331322 ?auto_331323 ) ) ( not ( = ?auto_331322 ?auto_331324 ) ) ( not ( = ?auto_331322 ?auto_331325 ) ) ( not ( = ?auto_331323 ?auto_331324 ) ) ( not ( = ?auto_331323 ?auto_331325 ) ) ( not ( = ?auto_331324 ?auto_331325 ) ) ( ON ?auto_331323 ?auto_331324 ) ( CLEAR ?auto_331321 ) ( ON ?auto_331322 ?auto_331323 ) ( CLEAR ?auto_331322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_331317 ?auto_331318 ?auto_331319 ?auto_331320 ?auto_331321 ?auto_331322 )
      ( MAKE-8PILE ?auto_331317 ?auto_331318 ?auto_331319 ?auto_331320 ?auto_331321 ?auto_331322 ?auto_331323 ?auto_331324 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_331334 - BLOCK
      ?auto_331335 - BLOCK
      ?auto_331336 - BLOCK
      ?auto_331337 - BLOCK
      ?auto_331338 - BLOCK
      ?auto_331339 - BLOCK
      ?auto_331340 - BLOCK
      ?auto_331341 - BLOCK
    )
    :vars
    (
      ?auto_331342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331341 ?auto_331342 ) ( ON-TABLE ?auto_331334 ) ( ON ?auto_331335 ?auto_331334 ) ( ON ?auto_331336 ?auto_331335 ) ( ON ?auto_331337 ?auto_331336 ) ( ON ?auto_331338 ?auto_331337 ) ( not ( = ?auto_331334 ?auto_331335 ) ) ( not ( = ?auto_331334 ?auto_331336 ) ) ( not ( = ?auto_331334 ?auto_331337 ) ) ( not ( = ?auto_331334 ?auto_331338 ) ) ( not ( = ?auto_331334 ?auto_331339 ) ) ( not ( = ?auto_331334 ?auto_331340 ) ) ( not ( = ?auto_331334 ?auto_331341 ) ) ( not ( = ?auto_331334 ?auto_331342 ) ) ( not ( = ?auto_331335 ?auto_331336 ) ) ( not ( = ?auto_331335 ?auto_331337 ) ) ( not ( = ?auto_331335 ?auto_331338 ) ) ( not ( = ?auto_331335 ?auto_331339 ) ) ( not ( = ?auto_331335 ?auto_331340 ) ) ( not ( = ?auto_331335 ?auto_331341 ) ) ( not ( = ?auto_331335 ?auto_331342 ) ) ( not ( = ?auto_331336 ?auto_331337 ) ) ( not ( = ?auto_331336 ?auto_331338 ) ) ( not ( = ?auto_331336 ?auto_331339 ) ) ( not ( = ?auto_331336 ?auto_331340 ) ) ( not ( = ?auto_331336 ?auto_331341 ) ) ( not ( = ?auto_331336 ?auto_331342 ) ) ( not ( = ?auto_331337 ?auto_331338 ) ) ( not ( = ?auto_331337 ?auto_331339 ) ) ( not ( = ?auto_331337 ?auto_331340 ) ) ( not ( = ?auto_331337 ?auto_331341 ) ) ( not ( = ?auto_331337 ?auto_331342 ) ) ( not ( = ?auto_331338 ?auto_331339 ) ) ( not ( = ?auto_331338 ?auto_331340 ) ) ( not ( = ?auto_331338 ?auto_331341 ) ) ( not ( = ?auto_331338 ?auto_331342 ) ) ( not ( = ?auto_331339 ?auto_331340 ) ) ( not ( = ?auto_331339 ?auto_331341 ) ) ( not ( = ?auto_331339 ?auto_331342 ) ) ( not ( = ?auto_331340 ?auto_331341 ) ) ( not ( = ?auto_331340 ?auto_331342 ) ) ( not ( = ?auto_331341 ?auto_331342 ) ) ( ON ?auto_331340 ?auto_331341 ) ( CLEAR ?auto_331338 ) ( ON ?auto_331339 ?auto_331340 ) ( CLEAR ?auto_331339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_331334 ?auto_331335 ?auto_331336 ?auto_331337 ?auto_331338 ?auto_331339 )
      ( MAKE-8PILE ?auto_331334 ?auto_331335 ?auto_331336 ?auto_331337 ?auto_331338 ?auto_331339 ?auto_331340 ?auto_331341 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_331351 - BLOCK
      ?auto_331352 - BLOCK
      ?auto_331353 - BLOCK
      ?auto_331354 - BLOCK
      ?auto_331355 - BLOCK
      ?auto_331356 - BLOCK
      ?auto_331357 - BLOCK
      ?auto_331358 - BLOCK
    )
    :vars
    (
      ?auto_331359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331358 ?auto_331359 ) ( ON-TABLE ?auto_331351 ) ( ON ?auto_331352 ?auto_331351 ) ( ON ?auto_331353 ?auto_331352 ) ( ON ?auto_331354 ?auto_331353 ) ( not ( = ?auto_331351 ?auto_331352 ) ) ( not ( = ?auto_331351 ?auto_331353 ) ) ( not ( = ?auto_331351 ?auto_331354 ) ) ( not ( = ?auto_331351 ?auto_331355 ) ) ( not ( = ?auto_331351 ?auto_331356 ) ) ( not ( = ?auto_331351 ?auto_331357 ) ) ( not ( = ?auto_331351 ?auto_331358 ) ) ( not ( = ?auto_331351 ?auto_331359 ) ) ( not ( = ?auto_331352 ?auto_331353 ) ) ( not ( = ?auto_331352 ?auto_331354 ) ) ( not ( = ?auto_331352 ?auto_331355 ) ) ( not ( = ?auto_331352 ?auto_331356 ) ) ( not ( = ?auto_331352 ?auto_331357 ) ) ( not ( = ?auto_331352 ?auto_331358 ) ) ( not ( = ?auto_331352 ?auto_331359 ) ) ( not ( = ?auto_331353 ?auto_331354 ) ) ( not ( = ?auto_331353 ?auto_331355 ) ) ( not ( = ?auto_331353 ?auto_331356 ) ) ( not ( = ?auto_331353 ?auto_331357 ) ) ( not ( = ?auto_331353 ?auto_331358 ) ) ( not ( = ?auto_331353 ?auto_331359 ) ) ( not ( = ?auto_331354 ?auto_331355 ) ) ( not ( = ?auto_331354 ?auto_331356 ) ) ( not ( = ?auto_331354 ?auto_331357 ) ) ( not ( = ?auto_331354 ?auto_331358 ) ) ( not ( = ?auto_331354 ?auto_331359 ) ) ( not ( = ?auto_331355 ?auto_331356 ) ) ( not ( = ?auto_331355 ?auto_331357 ) ) ( not ( = ?auto_331355 ?auto_331358 ) ) ( not ( = ?auto_331355 ?auto_331359 ) ) ( not ( = ?auto_331356 ?auto_331357 ) ) ( not ( = ?auto_331356 ?auto_331358 ) ) ( not ( = ?auto_331356 ?auto_331359 ) ) ( not ( = ?auto_331357 ?auto_331358 ) ) ( not ( = ?auto_331357 ?auto_331359 ) ) ( not ( = ?auto_331358 ?auto_331359 ) ) ( ON ?auto_331357 ?auto_331358 ) ( ON ?auto_331356 ?auto_331357 ) ( CLEAR ?auto_331354 ) ( ON ?auto_331355 ?auto_331356 ) ( CLEAR ?auto_331355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_331351 ?auto_331352 ?auto_331353 ?auto_331354 ?auto_331355 )
      ( MAKE-8PILE ?auto_331351 ?auto_331352 ?auto_331353 ?auto_331354 ?auto_331355 ?auto_331356 ?auto_331357 ?auto_331358 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_331368 - BLOCK
      ?auto_331369 - BLOCK
      ?auto_331370 - BLOCK
      ?auto_331371 - BLOCK
      ?auto_331372 - BLOCK
      ?auto_331373 - BLOCK
      ?auto_331374 - BLOCK
      ?auto_331375 - BLOCK
    )
    :vars
    (
      ?auto_331376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331375 ?auto_331376 ) ( ON-TABLE ?auto_331368 ) ( ON ?auto_331369 ?auto_331368 ) ( ON ?auto_331370 ?auto_331369 ) ( ON ?auto_331371 ?auto_331370 ) ( not ( = ?auto_331368 ?auto_331369 ) ) ( not ( = ?auto_331368 ?auto_331370 ) ) ( not ( = ?auto_331368 ?auto_331371 ) ) ( not ( = ?auto_331368 ?auto_331372 ) ) ( not ( = ?auto_331368 ?auto_331373 ) ) ( not ( = ?auto_331368 ?auto_331374 ) ) ( not ( = ?auto_331368 ?auto_331375 ) ) ( not ( = ?auto_331368 ?auto_331376 ) ) ( not ( = ?auto_331369 ?auto_331370 ) ) ( not ( = ?auto_331369 ?auto_331371 ) ) ( not ( = ?auto_331369 ?auto_331372 ) ) ( not ( = ?auto_331369 ?auto_331373 ) ) ( not ( = ?auto_331369 ?auto_331374 ) ) ( not ( = ?auto_331369 ?auto_331375 ) ) ( not ( = ?auto_331369 ?auto_331376 ) ) ( not ( = ?auto_331370 ?auto_331371 ) ) ( not ( = ?auto_331370 ?auto_331372 ) ) ( not ( = ?auto_331370 ?auto_331373 ) ) ( not ( = ?auto_331370 ?auto_331374 ) ) ( not ( = ?auto_331370 ?auto_331375 ) ) ( not ( = ?auto_331370 ?auto_331376 ) ) ( not ( = ?auto_331371 ?auto_331372 ) ) ( not ( = ?auto_331371 ?auto_331373 ) ) ( not ( = ?auto_331371 ?auto_331374 ) ) ( not ( = ?auto_331371 ?auto_331375 ) ) ( not ( = ?auto_331371 ?auto_331376 ) ) ( not ( = ?auto_331372 ?auto_331373 ) ) ( not ( = ?auto_331372 ?auto_331374 ) ) ( not ( = ?auto_331372 ?auto_331375 ) ) ( not ( = ?auto_331372 ?auto_331376 ) ) ( not ( = ?auto_331373 ?auto_331374 ) ) ( not ( = ?auto_331373 ?auto_331375 ) ) ( not ( = ?auto_331373 ?auto_331376 ) ) ( not ( = ?auto_331374 ?auto_331375 ) ) ( not ( = ?auto_331374 ?auto_331376 ) ) ( not ( = ?auto_331375 ?auto_331376 ) ) ( ON ?auto_331374 ?auto_331375 ) ( ON ?auto_331373 ?auto_331374 ) ( CLEAR ?auto_331371 ) ( ON ?auto_331372 ?auto_331373 ) ( CLEAR ?auto_331372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_331368 ?auto_331369 ?auto_331370 ?auto_331371 ?auto_331372 )
      ( MAKE-8PILE ?auto_331368 ?auto_331369 ?auto_331370 ?auto_331371 ?auto_331372 ?auto_331373 ?auto_331374 ?auto_331375 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_331385 - BLOCK
      ?auto_331386 - BLOCK
      ?auto_331387 - BLOCK
      ?auto_331388 - BLOCK
      ?auto_331389 - BLOCK
      ?auto_331390 - BLOCK
      ?auto_331391 - BLOCK
      ?auto_331392 - BLOCK
    )
    :vars
    (
      ?auto_331393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331392 ?auto_331393 ) ( ON-TABLE ?auto_331385 ) ( ON ?auto_331386 ?auto_331385 ) ( ON ?auto_331387 ?auto_331386 ) ( not ( = ?auto_331385 ?auto_331386 ) ) ( not ( = ?auto_331385 ?auto_331387 ) ) ( not ( = ?auto_331385 ?auto_331388 ) ) ( not ( = ?auto_331385 ?auto_331389 ) ) ( not ( = ?auto_331385 ?auto_331390 ) ) ( not ( = ?auto_331385 ?auto_331391 ) ) ( not ( = ?auto_331385 ?auto_331392 ) ) ( not ( = ?auto_331385 ?auto_331393 ) ) ( not ( = ?auto_331386 ?auto_331387 ) ) ( not ( = ?auto_331386 ?auto_331388 ) ) ( not ( = ?auto_331386 ?auto_331389 ) ) ( not ( = ?auto_331386 ?auto_331390 ) ) ( not ( = ?auto_331386 ?auto_331391 ) ) ( not ( = ?auto_331386 ?auto_331392 ) ) ( not ( = ?auto_331386 ?auto_331393 ) ) ( not ( = ?auto_331387 ?auto_331388 ) ) ( not ( = ?auto_331387 ?auto_331389 ) ) ( not ( = ?auto_331387 ?auto_331390 ) ) ( not ( = ?auto_331387 ?auto_331391 ) ) ( not ( = ?auto_331387 ?auto_331392 ) ) ( not ( = ?auto_331387 ?auto_331393 ) ) ( not ( = ?auto_331388 ?auto_331389 ) ) ( not ( = ?auto_331388 ?auto_331390 ) ) ( not ( = ?auto_331388 ?auto_331391 ) ) ( not ( = ?auto_331388 ?auto_331392 ) ) ( not ( = ?auto_331388 ?auto_331393 ) ) ( not ( = ?auto_331389 ?auto_331390 ) ) ( not ( = ?auto_331389 ?auto_331391 ) ) ( not ( = ?auto_331389 ?auto_331392 ) ) ( not ( = ?auto_331389 ?auto_331393 ) ) ( not ( = ?auto_331390 ?auto_331391 ) ) ( not ( = ?auto_331390 ?auto_331392 ) ) ( not ( = ?auto_331390 ?auto_331393 ) ) ( not ( = ?auto_331391 ?auto_331392 ) ) ( not ( = ?auto_331391 ?auto_331393 ) ) ( not ( = ?auto_331392 ?auto_331393 ) ) ( ON ?auto_331391 ?auto_331392 ) ( ON ?auto_331390 ?auto_331391 ) ( ON ?auto_331389 ?auto_331390 ) ( CLEAR ?auto_331387 ) ( ON ?auto_331388 ?auto_331389 ) ( CLEAR ?auto_331388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_331385 ?auto_331386 ?auto_331387 ?auto_331388 )
      ( MAKE-8PILE ?auto_331385 ?auto_331386 ?auto_331387 ?auto_331388 ?auto_331389 ?auto_331390 ?auto_331391 ?auto_331392 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_331402 - BLOCK
      ?auto_331403 - BLOCK
      ?auto_331404 - BLOCK
      ?auto_331405 - BLOCK
      ?auto_331406 - BLOCK
      ?auto_331407 - BLOCK
      ?auto_331408 - BLOCK
      ?auto_331409 - BLOCK
    )
    :vars
    (
      ?auto_331410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331409 ?auto_331410 ) ( ON-TABLE ?auto_331402 ) ( ON ?auto_331403 ?auto_331402 ) ( ON ?auto_331404 ?auto_331403 ) ( not ( = ?auto_331402 ?auto_331403 ) ) ( not ( = ?auto_331402 ?auto_331404 ) ) ( not ( = ?auto_331402 ?auto_331405 ) ) ( not ( = ?auto_331402 ?auto_331406 ) ) ( not ( = ?auto_331402 ?auto_331407 ) ) ( not ( = ?auto_331402 ?auto_331408 ) ) ( not ( = ?auto_331402 ?auto_331409 ) ) ( not ( = ?auto_331402 ?auto_331410 ) ) ( not ( = ?auto_331403 ?auto_331404 ) ) ( not ( = ?auto_331403 ?auto_331405 ) ) ( not ( = ?auto_331403 ?auto_331406 ) ) ( not ( = ?auto_331403 ?auto_331407 ) ) ( not ( = ?auto_331403 ?auto_331408 ) ) ( not ( = ?auto_331403 ?auto_331409 ) ) ( not ( = ?auto_331403 ?auto_331410 ) ) ( not ( = ?auto_331404 ?auto_331405 ) ) ( not ( = ?auto_331404 ?auto_331406 ) ) ( not ( = ?auto_331404 ?auto_331407 ) ) ( not ( = ?auto_331404 ?auto_331408 ) ) ( not ( = ?auto_331404 ?auto_331409 ) ) ( not ( = ?auto_331404 ?auto_331410 ) ) ( not ( = ?auto_331405 ?auto_331406 ) ) ( not ( = ?auto_331405 ?auto_331407 ) ) ( not ( = ?auto_331405 ?auto_331408 ) ) ( not ( = ?auto_331405 ?auto_331409 ) ) ( not ( = ?auto_331405 ?auto_331410 ) ) ( not ( = ?auto_331406 ?auto_331407 ) ) ( not ( = ?auto_331406 ?auto_331408 ) ) ( not ( = ?auto_331406 ?auto_331409 ) ) ( not ( = ?auto_331406 ?auto_331410 ) ) ( not ( = ?auto_331407 ?auto_331408 ) ) ( not ( = ?auto_331407 ?auto_331409 ) ) ( not ( = ?auto_331407 ?auto_331410 ) ) ( not ( = ?auto_331408 ?auto_331409 ) ) ( not ( = ?auto_331408 ?auto_331410 ) ) ( not ( = ?auto_331409 ?auto_331410 ) ) ( ON ?auto_331408 ?auto_331409 ) ( ON ?auto_331407 ?auto_331408 ) ( ON ?auto_331406 ?auto_331407 ) ( CLEAR ?auto_331404 ) ( ON ?auto_331405 ?auto_331406 ) ( CLEAR ?auto_331405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_331402 ?auto_331403 ?auto_331404 ?auto_331405 )
      ( MAKE-8PILE ?auto_331402 ?auto_331403 ?auto_331404 ?auto_331405 ?auto_331406 ?auto_331407 ?auto_331408 ?auto_331409 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_331419 - BLOCK
      ?auto_331420 - BLOCK
      ?auto_331421 - BLOCK
      ?auto_331422 - BLOCK
      ?auto_331423 - BLOCK
      ?auto_331424 - BLOCK
      ?auto_331425 - BLOCK
      ?auto_331426 - BLOCK
    )
    :vars
    (
      ?auto_331427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331426 ?auto_331427 ) ( ON-TABLE ?auto_331419 ) ( ON ?auto_331420 ?auto_331419 ) ( not ( = ?auto_331419 ?auto_331420 ) ) ( not ( = ?auto_331419 ?auto_331421 ) ) ( not ( = ?auto_331419 ?auto_331422 ) ) ( not ( = ?auto_331419 ?auto_331423 ) ) ( not ( = ?auto_331419 ?auto_331424 ) ) ( not ( = ?auto_331419 ?auto_331425 ) ) ( not ( = ?auto_331419 ?auto_331426 ) ) ( not ( = ?auto_331419 ?auto_331427 ) ) ( not ( = ?auto_331420 ?auto_331421 ) ) ( not ( = ?auto_331420 ?auto_331422 ) ) ( not ( = ?auto_331420 ?auto_331423 ) ) ( not ( = ?auto_331420 ?auto_331424 ) ) ( not ( = ?auto_331420 ?auto_331425 ) ) ( not ( = ?auto_331420 ?auto_331426 ) ) ( not ( = ?auto_331420 ?auto_331427 ) ) ( not ( = ?auto_331421 ?auto_331422 ) ) ( not ( = ?auto_331421 ?auto_331423 ) ) ( not ( = ?auto_331421 ?auto_331424 ) ) ( not ( = ?auto_331421 ?auto_331425 ) ) ( not ( = ?auto_331421 ?auto_331426 ) ) ( not ( = ?auto_331421 ?auto_331427 ) ) ( not ( = ?auto_331422 ?auto_331423 ) ) ( not ( = ?auto_331422 ?auto_331424 ) ) ( not ( = ?auto_331422 ?auto_331425 ) ) ( not ( = ?auto_331422 ?auto_331426 ) ) ( not ( = ?auto_331422 ?auto_331427 ) ) ( not ( = ?auto_331423 ?auto_331424 ) ) ( not ( = ?auto_331423 ?auto_331425 ) ) ( not ( = ?auto_331423 ?auto_331426 ) ) ( not ( = ?auto_331423 ?auto_331427 ) ) ( not ( = ?auto_331424 ?auto_331425 ) ) ( not ( = ?auto_331424 ?auto_331426 ) ) ( not ( = ?auto_331424 ?auto_331427 ) ) ( not ( = ?auto_331425 ?auto_331426 ) ) ( not ( = ?auto_331425 ?auto_331427 ) ) ( not ( = ?auto_331426 ?auto_331427 ) ) ( ON ?auto_331425 ?auto_331426 ) ( ON ?auto_331424 ?auto_331425 ) ( ON ?auto_331423 ?auto_331424 ) ( ON ?auto_331422 ?auto_331423 ) ( CLEAR ?auto_331420 ) ( ON ?auto_331421 ?auto_331422 ) ( CLEAR ?auto_331421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_331419 ?auto_331420 ?auto_331421 )
      ( MAKE-8PILE ?auto_331419 ?auto_331420 ?auto_331421 ?auto_331422 ?auto_331423 ?auto_331424 ?auto_331425 ?auto_331426 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_331436 - BLOCK
      ?auto_331437 - BLOCK
      ?auto_331438 - BLOCK
      ?auto_331439 - BLOCK
      ?auto_331440 - BLOCK
      ?auto_331441 - BLOCK
      ?auto_331442 - BLOCK
      ?auto_331443 - BLOCK
    )
    :vars
    (
      ?auto_331444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331443 ?auto_331444 ) ( ON-TABLE ?auto_331436 ) ( ON ?auto_331437 ?auto_331436 ) ( not ( = ?auto_331436 ?auto_331437 ) ) ( not ( = ?auto_331436 ?auto_331438 ) ) ( not ( = ?auto_331436 ?auto_331439 ) ) ( not ( = ?auto_331436 ?auto_331440 ) ) ( not ( = ?auto_331436 ?auto_331441 ) ) ( not ( = ?auto_331436 ?auto_331442 ) ) ( not ( = ?auto_331436 ?auto_331443 ) ) ( not ( = ?auto_331436 ?auto_331444 ) ) ( not ( = ?auto_331437 ?auto_331438 ) ) ( not ( = ?auto_331437 ?auto_331439 ) ) ( not ( = ?auto_331437 ?auto_331440 ) ) ( not ( = ?auto_331437 ?auto_331441 ) ) ( not ( = ?auto_331437 ?auto_331442 ) ) ( not ( = ?auto_331437 ?auto_331443 ) ) ( not ( = ?auto_331437 ?auto_331444 ) ) ( not ( = ?auto_331438 ?auto_331439 ) ) ( not ( = ?auto_331438 ?auto_331440 ) ) ( not ( = ?auto_331438 ?auto_331441 ) ) ( not ( = ?auto_331438 ?auto_331442 ) ) ( not ( = ?auto_331438 ?auto_331443 ) ) ( not ( = ?auto_331438 ?auto_331444 ) ) ( not ( = ?auto_331439 ?auto_331440 ) ) ( not ( = ?auto_331439 ?auto_331441 ) ) ( not ( = ?auto_331439 ?auto_331442 ) ) ( not ( = ?auto_331439 ?auto_331443 ) ) ( not ( = ?auto_331439 ?auto_331444 ) ) ( not ( = ?auto_331440 ?auto_331441 ) ) ( not ( = ?auto_331440 ?auto_331442 ) ) ( not ( = ?auto_331440 ?auto_331443 ) ) ( not ( = ?auto_331440 ?auto_331444 ) ) ( not ( = ?auto_331441 ?auto_331442 ) ) ( not ( = ?auto_331441 ?auto_331443 ) ) ( not ( = ?auto_331441 ?auto_331444 ) ) ( not ( = ?auto_331442 ?auto_331443 ) ) ( not ( = ?auto_331442 ?auto_331444 ) ) ( not ( = ?auto_331443 ?auto_331444 ) ) ( ON ?auto_331442 ?auto_331443 ) ( ON ?auto_331441 ?auto_331442 ) ( ON ?auto_331440 ?auto_331441 ) ( ON ?auto_331439 ?auto_331440 ) ( CLEAR ?auto_331437 ) ( ON ?auto_331438 ?auto_331439 ) ( CLEAR ?auto_331438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_331436 ?auto_331437 ?auto_331438 )
      ( MAKE-8PILE ?auto_331436 ?auto_331437 ?auto_331438 ?auto_331439 ?auto_331440 ?auto_331441 ?auto_331442 ?auto_331443 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_331453 - BLOCK
      ?auto_331454 - BLOCK
      ?auto_331455 - BLOCK
      ?auto_331456 - BLOCK
      ?auto_331457 - BLOCK
      ?auto_331458 - BLOCK
      ?auto_331459 - BLOCK
      ?auto_331460 - BLOCK
    )
    :vars
    (
      ?auto_331461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331460 ?auto_331461 ) ( ON-TABLE ?auto_331453 ) ( not ( = ?auto_331453 ?auto_331454 ) ) ( not ( = ?auto_331453 ?auto_331455 ) ) ( not ( = ?auto_331453 ?auto_331456 ) ) ( not ( = ?auto_331453 ?auto_331457 ) ) ( not ( = ?auto_331453 ?auto_331458 ) ) ( not ( = ?auto_331453 ?auto_331459 ) ) ( not ( = ?auto_331453 ?auto_331460 ) ) ( not ( = ?auto_331453 ?auto_331461 ) ) ( not ( = ?auto_331454 ?auto_331455 ) ) ( not ( = ?auto_331454 ?auto_331456 ) ) ( not ( = ?auto_331454 ?auto_331457 ) ) ( not ( = ?auto_331454 ?auto_331458 ) ) ( not ( = ?auto_331454 ?auto_331459 ) ) ( not ( = ?auto_331454 ?auto_331460 ) ) ( not ( = ?auto_331454 ?auto_331461 ) ) ( not ( = ?auto_331455 ?auto_331456 ) ) ( not ( = ?auto_331455 ?auto_331457 ) ) ( not ( = ?auto_331455 ?auto_331458 ) ) ( not ( = ?auto_331455 ?auto_331459 ) ) ( not ( = ?auto_331455 ?auto_331460 ) ) ( not ( = ?auto_331455 ?auto_331461 ) ) ( not ( = ?auto_331456 ?auto_331457 ) ) ( not ( = ?auto_331456 ?auto_331458 ) ) ( not ( = ?auto_331456 ?auto_331459 ) ) ( not ( = ?auto_331456 ?auto_331460 ) ) ( not ( = ?auto_331456 ?auto_331461 ) ) ( not ( = ?auto_331457 ?auto_331458 ) ) ( not ( = ?auto_331457 ?auto_331459 ) ) ( not ( = ?auto_331457 ?auto_331460 ) ) ( not ( = ?auto_331457 ?auto_331461 ) ) ( not ( = ?auto_331458 ?auto_331459 ) ) ( not ( = ?auto_331458 ?auto_331460 ) ) ( not ( = ?auto_331458 ?auto_331461 ) ) ( not ( = ?auto_331459 ?auto_331460 ) ) ( not ( = ?auto_331459 ?auto_331461 ) ) ( not ( = ?auto_331460 ?auto_331461 ) ) ( ON ?auto_331459 ?auto_331460 ) ( ON ?auto_331458 ?auto_331459 ) ( ON ?auto_331457 ?auto_331458 ) ( ON ?auto_331456 ?auto_331457 ) ( ON ?auto_331455 ?auto_331456 ) ( CLEAR ?auto_331453 ) ( ON ?auto_331454 ?auto_331455 ) ( CLEAR ?auto_331454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_331453 ?auto_331454 )
      ( MAKE-8PILE ?auto_331453 ?auto_331454 ?auto_331455 ?auto_331456 ?auto_331457 ?auto_331458 ?auto_331459 ?auto_331460 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_331470 - BLOCK
      ?auto_331471 - BLOCK
      ?auto_331472 - BLOCK
      ?auto_331473 - BLOCK
      ?auto_331474 - BLOCK
      ?auto_331475 - BLOCK
      ?auto_331476 - BLOCK
      ?auto_331477 - BLOCK
    )
    :vars
    (
      ?auto_331478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331477 ?auto_331478 ) ( ON-TABLE ?auto_331470 ) ( not ( = ?auto_331470 ?auto_331471 ) ) ( not ( = ?auto_331470 ?auto_331472 ) ) ( not ( = ?auto_331470 ?auto_331473 ) ) ( not ( = ?auto_331470 ?auto_331474 ) ) ( not ( = ?auto_331470 ?auto_331475 ) ) ( not ( = ?auto_331470 ?auto_331476 ) ) ( not ( = ?auto_331470 ?auto_331477 ) ) ( not ( = ?auto_331470 ?auto_331478 ) ) ( not ( = ?auto_331471 ?auto_331472 ) ) ( not ( = ?auto_331471 ?auto_331473 ) ) ( not ( = ?auto_331471 ?auto_331474 ) ) ( not ( = ?auto_331471 ?auto_331475 ) ) ( not ( = ?auto_331471 ?auto_331476 ) ) ( not ( = ?auto_331471 ?auto_331477 ) ) ( not ( = ?auto_331471 ?auto_331478 ) ) ( not ( = ?auto_331472 ?auto_331473 ) ) ( not ( = ?auto_331472 ?auto_331474 ) ) ( not ( = ?auto_331472 ?auto_331475 ) ) ( not ( = ?auto_331472 ?auto_331476 ) ) ( not ( = ?auto_331472 ?auto_331477 ) ) ( not ( = ?auto_331472 ?auto_331478 ) ) ( not ( = ?auto_331473 ?auto_331474 ) ) ( not ( = ?auto_331473 ?auto_331475 ) ) ( not ( = ?auto_331473 ?auto_331476 ) ) ( not ( = ?auto_331473 ?auto_331477 ) ) ( not ( = ?auto_331473 ?auto_331478 ) ) ( not ( = ?auto_331474 ?auto_331475 ) ) ( not ( = ?auto_331474 ?auto_331476 ) ) ( not ( = ?auto_331474 ?auto_331477 ) ) ( not ( = ?auto_331474 ?auto_331478 ) ) ( not ( = ?auto_331475 ?auto_331476 ) ) ( not ( = ?auto_331475 ?auto_331477 ) ) ( not ( = ?auto_331475 ?auto_331478 ) ) ( not ( = ?auto_331476 ?auto_331477 ) ) ( not ( = ?auto_331476 ?auto_331478 ) ) ( not ( = ?auto_331477 ?auto_331478 ) ) ( ON ?auto_331476 ?auto_331477 ) ( ON ?auto_331475 ?auto_331476 ) ( ON ?auto_331474 ?auto_331475 ) ( ON ?auto_331473 ?auto_331474 ) ( ON ?auto_331472 ?auto_331473 ) ( CLEAR ?auto_331470 ) ( ON ?auto_331471 ?auto_331472 ) ( CLEAR ?auto_331471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_331470 ?auto_331471 )
      ( MAKE-8PILE ?auto_331470 ?auto_331471 ?auto_331472 ?auto_331473 ?auto_331474 ?auto_331475 ?auto_331476 ?auto_331477 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_331487 - BLOCK
      ?auto_331488 - BLOCK
      ?auto_331489 - BLOCK
      ?auto_331490 - BLOCK
      ?auto_331491 - BLOCK
      ?auto_331492 - BLOCK
      ?auto_331493 - BLOCK
      ?auto_331494 - BLOCK
    )
    :vars
    (
      ?auto_331495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331494 ?auto_331495 ) ( not ( = ?auto_331487 ?auto_331488 ) ) ( not ( = ?auto_331487 ?auto_331489 ) ) ( not ( = ?auto_331487 ?auto_331490 ) ) ( not ( = ?auto_331487 ?auto_331491 ) ) ( not ( = ?auto_331487 ?auto_331492 ) ) ( not ( = ?auto_331487 ?auto_331493 ) ) ( not ( = ?auto_331487 ?auto_331494 ) ) ( not ( = ?auto_331487 ?auto_331495 ) ) ( not ( = ?auto_331488 ?auto_331489 ) ) ( not ( = ?auto_331488 ?auto_331490 ) ) ( not ( = ?auto_331488 ?auto_331491 ) ) ( not ( = ?auto_331488 ?auto_331492 ) ) ( not ( = ?auto_331488 ?auto_331493 ) ) ( not ( = ?auto_331488 ?auto_331494 ) ) ( not ( = ?auto_331488 ?auto_331495 ) ) ( not ( = ?auto_331489 ?auto_331490 ) ) ( not ( = ?auto_331489 ?auto_331491 ) ) ( not ( = ?auto_331489 ?auto_331492 ) ) ( not ( = ?auto_331489 ?auto_331493 ) ) ( not ( = ?auto_331489 ?auto_331494 ) ) ( not ( = ?auto_331489 ?auto_331495 ) ) ( not ( = ?auto_331490 ?auto_331491 ) ) ( not ( = ?auto_331490 ?auto_331492 ) ) ( not ( = ?auto_331490 ?auto_331493 ) ) ( not ( = ?auto_331490 ?auto_331494 ) ) ( not ( = ?auto_331490 ?auto_331495 ) ) ( not ( = ?auto_331491 ?auto_331492 ) ) ( not ( = ?auto_331491 ?auto_331493 ) ) ( not ( = ?auto_331491 ?auto_331494 ) ) ( not ( = ?auto_331491 ?auto_331495 ) ) ( not ( = ?auto_331492 ?auto_331493 ) ) ( not ( = ?auto_331492 ?auto_331494 ) ) ( not ( = ?auto_331492 ?auto_331495 ) ) ( not ( = ?auto_331493 ?auto_331494 ) ) ( not ( = ?auto_331493 ?auto_331495 ) ) ( not ( = ?auto_331494 ?auto_331495 ) ) ( ON ?auto_331493 ?auto_331494 ) ( ON ?auto_331492 ?auto_331493 ) ( ON ?auto_331491 ?auto_331492 ) ( ON ?auto_331490 ?auto_331491 ) ( ON ?auto_331489 ?auto_331490 ) ( ON ?auto_331488 ?auto_331489 ) ( ON ?auto_331487 ?auto_331488 ) ( CLEAR ?auto_331487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_331487 )
      ( MAKE-8PILE ?auto_331487 ?auto_331488 ?auto_331489 ?auto_331490 ?auto_331491 ?auto_331492 ?auto_331493 ?auto_331494 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_331504 - BLOCK
      ?auto_331505 - BLOCK
      ?auto_331506 - BLOCK
      ?auto_331507 - BLOCK
      ?auto_331508 - BLOCK
      ?auto_331509 - BLOCK
      ?auto_331510 - BLOCK
      ?auto_331511 - BLOCK
    )
    :vars
    (
      ?auto_331512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331511 ?auto_331512 ) ( not ( = ?auto_331504 ?auto_331505 ) ) ( not ( = ?auto_331504 ?auto_331506 ) ) ( not ( = ?auto_331504 ?auto_331507 ) ) ( not ( = ?auto_331504 ?auto_331508 ) ) ( not ( = ?auto_331504 ?auto_331509 ) ) ( not ( = ?auto_331504 ?auto_331510 ) ) ( not ( = ?auto_331504 ?auto_331511 ) ) ( not ( = ?auto_331504 ?auto_331512 ) ) ( not ( = ?auto_331505 ?auto_331506 ) ) ( not ( = ?auto_331505 ?auto_331507 ) ) ( not ( = ?auto_331505 ?auto_331508 ) ) ( not ( = ?auto_331505 ?auto_331509 ) ) ( not ( = ?auto_331505 ?auto_331510 ) ) ( not ( = ?auto_331505 ?auto_331511 ) ) ( not ( = ?auto_331505 ?auto_331512 ) ) ( not ( = ?auto_331506 ?auto_331507 ) ) ( not ( = ?auto_331506 ?auto_331508 ) ) ( not ( = ?auto_331506 ?auto_331509 ) ) ( not ( = ?auto_331506 ?auto_331510 ) ) ( not ( = ?auto_331506 ?auto_331511 ) ) ( not ( = ?auto_331506 ?auto_331512 ) ) ( not ( = ?auto_331507 ?auto_331508 ) ) ( not ( = ?auto_331507 ?auto_331509 ) ) ( not ( = ?auto_331507 ?auto_331510 ) ) ( not ( = ?auto_331507 ?auto_331511 ) ) ( not ( = ?auto_331507 ?auto_331512 ) ) ( not ( = ?auto_331508 ?auto_331509 ) ) ( not ( = ?auto_331508 ?auto_331510 ) ) ( not ( = ?auto_331508 ?auto_331511 ) ) ( not ( = ?auto_331508 ?auto_331512 ) ) ( not ( = ?auto_331509 ?auto_331510 ) ) ( not ( = ?auto_331509 ?auto_331511 ) ) ( not ( = ?auto_331509 ?auto_331512 ) ) ( not ( = ?auto_331510 ?auto_331511 ) ) ( not ( = ?auto_331510 ?auto_331512 ) ) ( not ( = ?auto_331511 ?auto_331512 ) ) ( ON ?auto_331510 ?auto_331511 ) ( ON ?auto_331509 ?auto_331510 ) ( ON ?auto_331508 ?auto_331509 ) ( ON ?auto_331507 ?auto_331508 ) ( ON ?auto_331506 ?auto_331507 ) ( ON ?auto_331505 ?auto_331506 ) ( ON ?auto_331504 ?auto_331505 ) ( CLEAR ?auto_331504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_331504 )
      ( MAKE-8PILE ?auto_331504 ?auto_331505 ?auto_331506 ?auto_331507 ?auto_331508 ?auto_331509 ?auto_331510 ?auto_331511 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331522 - BLOCK
      ?auto_331523 - BLOCK
      ?auto_331524 - BLOCK
      ?auto_331525 - BLOCK
      ?auto_331526 - BLOCK
      ?auto_331527 - BLOCK
      ?auto_331528 - BLOCK
      ?auto_331529 - BLOCK
      ?auto_331530 - BLOCK
    )
    :vars
    (
      ?auto_331531 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_331529 ) ( ON ?auto_331530 ?auto_331531 ) ( CLEAR ?auto_331530 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_331522 ) ( ON ?auto_331523 ?auto_331522 ) ( ON ?auto_331524 ?auto_331523 ) ( ON ?auto_331525 ?auto_331524 ) ( ON ?auto_331526 ?auto_331525 ) ( ON ?auto_331527 ?auto_331526 ) ( ON ?auto_331528 ?auto_331527 ) ( ON ?auto_331529 ?auto_331528 ) ( not ( = ?auto_331522 ?auto_331523 ) ) ( not ( = ?auto_331522 ?auto_331524 ) ) ( not ( = ?auto_331522 ?auto_331525 ) ) ( not ( = ?auto_331522 ?auto_331526 ) ) ( not ( = ?auto_331522 ?auto_331527 ) ) ( not ( = ?auto_331522 ?auto_331528 ) ) ( not ( = ?auto_331522 ?auto_331529 ) ) ( not ( = ?auto_331522 ?auto_331530 ) ) ( not ( = ?auto_331522 ?auto_331531 ) ) ( not ( = ?auto_331523 ?auto_331524 ) ) ( not ( = ?auto_331523 ?auto_331525 ) ) ( not ( = ?auto_331523 ?auto_331526 ) ) ( not ( = ?auto_331523 ?auto_331527 ) ) ( not ( = ?auto_331523 ?auto_331528 ) ) ( not ( = ?auto_331523 ?auto_331529 ) ) ( not ( = ?auto_331523 ?auto_331530 ) ) ( not ( = ?auto_331523 ?auto_331531 ) ) ( not ( = ?auto_331524 ?auto_331525 ) ) ( not ( = ?auto_331524 ?auto_331526 ) ) ( not ( = ?auto_331524 ?auto_331527 ) ) ( not ( = ?auto_331524 ?auto_331528 ) ) ( not ( = ?auto_331524 ?auto_331529 ) ) ( not ( = ?auto_331524 ?auto_331530 ) ) ( not ( = ?auto_331524 ?auto_331531 ) ) ( not ( = ?auto_331525 ?auto_331526 ) ) ( not ( = ?auto_331525 ?auto_331527 ) ) ( not ( = ?auto_331525 ?auto_331528 ) ) ( not ( = ?auto_331525 ?auto_331529 ) ) ( not ( = ?auto_331525 ?auto_331530 ) ) ( not ( = ?auto_331525 ?auto_331531 ) ) ( not ( = ?auto_331526 ?auto_331527 ) ) ( not ( = ?auto_331526 ?auto_331528 ) ) ( not ( = ?auto_331526 ?auto_331529 ) ) ( not ( = ?auto_331526 ?auto_331530 ) ) ( not ( = ?auto_331526 ?auto_331531 ) ) ( not ( = ?auto_331527 ?auto_331528 ) ) ( not ( = ?auto_331527 ?auto_331529 ) ) ( not ( = ?auto_331527 ?auto_331530 ) ) ( not ( = ?auto_331527 ?auto_331531 ) ) ( not ( = ?auto_331528 ?auto_331529 ) ) ( not ( = ?auto_331528 ?auto_331530 ) ) ( not ( = ?auto_331528 ?auto_331531 ) ) ( not ( = ?auto_331529 ?auto_331530 ) ) ( not ( = ?auto_331529 ?auto_331531 ) ) ( not ( = ?auto_331530 ?auto_331531 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_331530 ?auto_331531 )
      ( !STACK ?auto_331530 ?auto_331529 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331541 - BLOCK
      ?auto_331542 - BLOCK
      ?auto_331543 - BLOCK
      ?auto_331544 - BLOCK
      ?auto_331545 - BLOCK
      ?auto_331546 - BLOCK
      ?auto_331547 - BLOCK
      ?auto_331548 - BLOCK
      ?auto_331549 - BLOCK
    )
    :vars
    (
      ?auto_331550 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_331548 ) ( ON ?auto_331549 ?auto_331550 ) ( CLEAR ?auto_331549 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_331541 ) ( ON ?auto_331542 ?auto_331541 ) ( ON ?auto_331543 ?auto_331542 ) ( ON ?auto_331544 ?auto_331543 ) ( ON ?auto_331545 ?auto_331544 ) ( ON ?auto_331546 ?auto_331545 ) ( ON ?auto_331547 ?auto_331546 ) ( ON ?auto_331548 ?auto_331547 ) ( not ( = ?auto_331541 ?auto_331542 ) ) ( not ( = ?auto_331541 ?auto_331543 ) ) ( not ( = ?auto_331541 ?auto_331544 ) ) ( not ( = ?auto_331541 ?auto_331545 ) ) ( not ( = ?auto_331541 ?auto_331546 ) ) ( not ( = ?auto_331541 ?auto_331547 ) ) ( not ( = ?auto_331541 ?auto_331548 ) ) ( not ( = ?auto_331541 ?auto_331549 ) ) ( not ( = ?auto_331541 ?auto_331550 ) ) ( not ( = ?auto_331542 ?auto_331543 ) ) ( not ( = ?auto_331542 ?auto_331544 ) ) ( not ( = ?auto_331542 ?auto_331545 ) ) ( not ( = ?auto_331542 ?auto_331546 ) ) ( not ( = ?auto_331542 ?auto_331547 ) ) ( not ( = ?auto_331542 ?auto_331548 ) ) ( not ( = ?auto_331542 ?auto_331549 ) ) ( not ( = ?auto_331542 ?auto_331550 ) ) ( not ( = ?auto_331543 ?auto_331544 ) ) ( not ( = ?auto_331543 ?auto_331545 ) ) ( not ( = ?auto_331543 ?auto_331546 ) ) ( not ( = ?auto_331543 ?auto_331547 ) ) ( not ( = ?auto_331543 ?auto_331548 ) ) ( not ( = ?auto_331543 ?auto_331549 ) ) ( not ( = ?auto_331543 ?auto_331550 ) ) ( not ( = ?auto_331544 ?auto_331545 ) ) ( not ( = ?auto_331544 ?auto_331546 ) ) ( not ( = ?auto_331544 ?auto_331547 ) ) ( not ( = ?auto_331544 ?auto_331548 ) ) ( not ( = ?auto_331544 ?auto_331549 ) ) ( not ( = ?auto_331544 ?auto_331550 ) ) ( not ( = ?auto_331545 ?auto_331546 ) ) ( not ( = ?auto_331545 ?auto_331547 ) ) ( not ( = ?auto_331545 ?auto_331548 ) ) ( not ( = ?auto_331545 ?auto_331549 ) ) ( not ( = ?auto_331545 ?auto_331550 ) ) ( not ( = ?auto_331546 ?auto_331547 ) ) ( not ( = ?auto_331546 ?auto_331548 ) ) ( not ( = ?auto_331546 ?auto_331549 ) ) ( not ( = ?auto_331546 ?auto_331550 ) ) ( not ( = ?auto_331547 ?auto_331548 ) ) ( not ( = ?auto_331547 ?auto_331549 ) ) ( not ( = ?auto_331547 ?auto_331550 ) ) ( not ( = ?auto_331548 ?auto_331549 ) ) ( not ( = ?auto_331548 ?auto_331550 ) ) ( not ( = ?auto_331549 ?auto_331550 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_331549 ?auto_331550 )
      ( !STACK ?auto_331549 ?auto_331548 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331560 - BLOCK
      ?auto_331561 - BLOCK
      ?auto_331562 - BLOCK
      ?auto_331563 - BLOCK
      ?auto_331564 - BLOCK
      ?auto_331565 - BLOCK
      ?auto_331566 - BLOCK
      ?auto_331567 - BLOCK
      ?auto_331568 - BLOCK
    )
    :vars
    (
      ?auto_331569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331568 ?auto_331569 ) ( ON-TABLE ?auto_331560 ) ( ON ?auto_331561 ?auto_331560 ) ( ON ?auto_331562 ?auto_331561 ) ( ON ?auto_331563 ?auto_331562 ) ( ON ?auto_331564 ?auto_331563 ) ( ON ?auto_331565 ?auto_331564 ) ( ON ?auto_331566 ?auto_331565 ) ( not ( = ?auto_331560 ?auto_331561 ) ) ( not ( = ?auto_331560 ?auto_331562 ) ) ( not ( = ?auto_331560 ?auto_331563 ) ) ( not ( = ?auto_331560 ?auto_331564 ) ) ( not ( = ?auto_331560 ?auto_331565 ) ) ( not ( = ?auto_331560 ?auto_331566 ) ) ( not ( = ?auto_331560 ?auto_331567 ) ) ( not ( = ?auto_331560 ?auto_331568 ) ) ( not ( = ?auto_331560 ?auto_331569 ) ) ( not ( = ?auto_331561 ?auto_331562 ) ) ( not ( = ?auto_331561 ?auto_331563 ) ) ( not ( = ?auto_331561 ?auto_331564 ) ) ( not ( = ?auto_331561 ?auto_331565 ) ) ( not ( = ?auto_331561 ?auto_331566 ) ) ( not ( = ?auto_331561 ?auto_331567 ) ) ( not ( = ?auto_331561 ?auto_331568 ) ) ( not ( = ?auto_331561 ?auto_331569 ) ) ( not ( = ?auto_331562 ?auto_331563 ) ) ( not ( = ?auto_331562 ?auto_331564 ) ) ( not ( = ?auto_331562 ?auto_331565 ) ) ( not ( = ?auto_331562 ?auto_331566 ) ) ( not ( = ?auto_331562 ?auto_331567 ) ) ( not ( = ?auto_331562 ?auto_331568 ) ) ( not ( = ?auto_331562 ?auto_331569 ) ) ( not ( = ?auto_331563 ?auto_331564 ) ) ( not ( = ?auto_331563 ?auto_331565 ) ) ( not ( = ?auto_331563 ?auto_331566 ) ) ( not ( = ?auto_331563 ?auto_331567 ) ) ( not ( = ?auto_331563 ?auto_331568 ) ) ( not ( = ?auto_331563 ?auto_331569 ) ) ( not ( = ?auto_331564 ?auto_331565 ) ) ( not ( = ?auto_331564 ?auto_331566 ) ) ( not ( = ?auto_331564 ?auto_331567 ) ) ( not ( = ?auto_331564 ?auto_331568 ) ) ( not ( = ?auto_331564 ?auto_331569 ) ) ( not ( = ?auto_331565 ?auto_331566 ) ) ( not ( = ?auto_331565 ?auto_331567 ) ) ( not ( = ?auto_331565 ?auto_331568 ) ) ( not ( = ?auto_331565 ?auto_331569 ) ) ( not ( = ?auto_331566 ?auto_331567 ) ) ( not ( = ?auto_331566 ?auto_331568 ) ) ( not ( = ?auto_331566 ?auto_331569 ) ) ( not ( = ?auto_331567 ?auto_331568 ) ) ( not ( = ?auto_331567 ?auto_331569 ) ) ( not ( = ?auto_331568 ?auto_331569 ) ) ( CLEAR ?auto_331566 ) ( ON ?auto_331567 ?auto_331568 ) ( CLEAR ?auto_331567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_331560 ?auto_331561 ?auto_331562 ?auto_331563 ?auto_331564 ?auto_331565 ?auto_331566 ?auto_331567 )
      ( MAKE-9PILE ?auto_331560 ?auto_331561 ?auto_331562 ?auto_331563 ?auto_331564 ?auto_331565 ?auto_331566 ?auto_331567 ?auto_331568 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331579 - BLOCK
      ?auto_331580 - BLOCK
      ?auto_331581 - BLOCK
      ?auto_331582 - BLOCK
      ?auto_331583 - BLOCK
      ?auto_331584 - BLOCK
      ?auto_331585 - BLOCK
      ?auto_331586 - BLOCK
      ?auto_331587 - BLOCK
    )
    :vars
    (
      ?auto_331588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331587 ?auto_331588 ) ( ON-TABLE ?auto_331579 ) ( ON ?auto_331580 ?auto_331579 ) ( ON ?auto_331581 ?auto_331580 ) ( ON ?auto_331582 ?auto_331581 ) ( ON ?auto_331583 ?auto_331582 ) ( ON ?auto_331584 ?auto_331583 ) ( ON ?auto_331585 ?auto_331584 ) ( not ( = ?auto_331579 ?auto_331580 ) ) ( not ( = ?auto_331579 ?auto_331581 ) ) ( not ( = ?auto_331579 ?auto_331582 ) ) ( not ( = ?auto_331579 ?auto_331583 ) ) ( not ( = ?auto_331579 ?auto_331584 ) ) ( not ( = ?auto_331579 ?auto_331585 ) ) ( not ( = ?auto_331579 ?auto_331586 ) ) ( not ( = ?auto_331579 ?auto_331587 ) ) ( not ( = ?auto_331579 ?auto_331588 ) ) ( not ( = ?auto_331580 ?auto_331581 ) ) ( not ( = ?auto_331580 ?auto_331582 ) ) ( not ( = ?auto_331580 ?auto_331583 ) ) ( not ( = ?auto_331580 ?auto_331584 ) ) ( not ( = ?auto_331580 ?auto_331585 ) ) ( not ( = ?auto_331580 ?auto_331586 ) ) ( not ( = ?auto_331580 ?auto_331587 ) ) ( not ( = ?auto_331580 ?auto_331588 ) ) ( not ( = ?auto_331581 ?auto_331582 ) ) ( not ( = ?auto_331581 ?auto_331583 ) ) ( not ( = ?auto_331581 ?auto_331584 ) ) ( not ( = ?auto_331581 ?auto_331585 ) ) ( not ( = ?auto_331581 ?auto_331586 ) ) ( not ( = ?auto_331581 ?auto_331587 ) ) ( not ( = ?auto_331581 ?auto_331588 ) ) ( not ( = ?auto_331582 ?auto_331583 ) ) ( not ( = ?auto_331582 ?auto_331584 ) ) ( not ( = ?auto_331582 ?auto_331585 ) ) ( not ( = ?auto_331582 ?auto_331586 ) ) ( not ( = ?auto_331582 ?auto_331587 ) ) ( not ( = ?auto_331582 ?auto_331588 ) ) ( not ( = ?auto_331583 ?auto_331584 ) ) ( not ( = ?auto_331583 ?auto_331585 ) ) ( not ( = ?auto_331583 ?auto_331586 ) ) ( not ( = ?auto_331583 ?auto_331587 ) ) ( not ( = ?auto_331583 ?auto_331588 ) ) ( not ( = ?auto_331584 ?auto_331585 ) ) ( not ( = ?auto_331584 ?auto_331586 ) ) ( not ( = ?auto_331584 ?auto_331587 ) ) ( not ( = ?auto_331584 ?auto_331588 ) ) ( not ( = ?auto_331585 ?auto_331586 ) ) ( not ( = ?auto_331585 ?auto_331587 ) ) ( not ( = ?auto_331585 ?auto_331588 ) ) ( not ( = ?auto_331586 ?auto_331587 ) ) ( not ( = ?auto_331586 ?auto_331588 ) ) ( not ( = ?auto_331587 ?auto_331588 ) ) ( CLEAR ?auto_331585 ) ( ON ?auto_331586 ?auto_331587 ) ( CLEAR ?auto_331586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_331579 ?auto_331580 ?auto_331581 ?auto_331582 ?auto_331583 ?auto_331584 ?auto_331585 ?auto_331586 )
      ( MAKE-9PILE ?auto_331579 ?auto_331580 ?auto_331581 ?auto_331582 ?auto_331583 ?auto_331584 ?auto_331585 ?auto_331586 ?auto_331587 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331598 - BLOCK
      ?auto_331599 - BLOCK
      ?auto_331600 - BLOCK
      ?auto_331601 - BLOCK
      ?auto_331602 - BLOCK
      ?auto_331603 - BLOCK
      ?auto_331604 - BLOCK
      ?auto_331605 - BLOCK
      ?auto_331606 - BLOCK
    )
    :vars
    (
      ?auto_331607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331606 ?auto_331607 ) ( ON-TABLE ?auto_331598 ) ( ON ?auto_331599 ?auto_331598 ) ( ON ?auto_331600 ?auto_331599 ) ( ON ?auto_331601 ?auto_331600 ) ( ON ?auto_331602 ?auto_331601 ) ( ON ?auto_331603 ?auto_331602 ) ( not ( = ?auto_331598 ?auto_331599 ) ) ( not ( = ?auto_331598 ?auto_331600 ) ) ( not ( = ?auto_331598 ?auto_331601 ) ) ( not ( = ?auto_331598 ?auto_331602 ) ) ( not ( = ?auto_331598 ?auto_331603 ) ) ( not ( = ?auto_331598 ?auto_331604 ) ) ( not ( = ?auto_331598 ?auto_331605 ) ) ( not ( = ?auto_331598 ?auto_331606 ) ) ( not ( = ?auto_331598 ?auto_331607 ) ) ( not ( = ?auto_331599 ?auto_331600 ) ) ( not ( = ?auto_331599 ?auto_331601 ) ) ( not ( = ?auto_331599 ?auto_331602 ) ) ( not ( = ?auto_331599 ?auto_331603 ) ) ( not ( = ?auto_331599 ?auto_331604 ) ) ( not ( = ?auto_331599 ?auto_331605 ) ) ( not ( = ?auto_331599 ?auto_331606 ) ) ( not ( = ?auto_331599 ?auto_331607 ) ) ( not ( = ?auto_331600 ?auto_331601 ) ) ( not ( = ?auto_331600 ?auto_331602 ) ) ( not ( = ?auto_331600 ?auto_331603 ) ) ( not ( = ?auto_331600 ?auto_331604 ) ) ( not ( = ?auto_331600 ?auto_331605 ) ) ( not ( = ?auto_331600 ?auto_331606 ) ) ( not ( = ?auto_331600 ?auto_331607 ) ) ( not ( = ?auto_331601 ?auto_331602 ) ) ( not ( = ?auto_331601 ?auto_331603 ) ) ( not ( = ?auto_331601 ?auto_331604 ) ) ( not ( = ?auto_331601 ?auto_331605 ) ) ( not ( = ?auto_331601 ?auto_331606 ) ) ( not ( = ?auto_331601 ?auto_331607 ) ) ( not ( = ?auto_331602 ?auto_331603 ) ) ( not ( = ?auto_331602 ?auto_331604 ) ) ( not ( = ?auto_331602 ?auto_331605 ) ) ( not ( = ?auto_331602 ?auto_331606 ) ) ( not ( = ?auto_331602 ?auto_331607 ) ) ( not ( = ?auto_331603 ?auto_331604 ) ) ( not ( = ?auto_331603 ?auto_331605 ) ) ( not ( = ?auto_331603 ?auto_331606 ) ) ( not ( = ?auto_331603 ?auto_331607 ) ) ( not ( = ?auto_331604 ?auto_331605 ) ) ( not ( = ?auto_331604 ?auto_331606 ) ) ( not ( = ?auto_331604 ?auto_331607 ) ) ( not ( = ?auto_331605 ?auto_331606 ) ) ( not ( = ?auto_331605 ?auto_331607 ) ) ( not ( = ?auto_331606 ?auto_331607 ) ) ( ON ?auto_331605 ?auto_331606 ) ( CLEAR ?auto_331603 ) ( ON ?auto_331604 ?auto_331605 ) ( CLEAR ?auto_331604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_331598 ?auto_331599 ?auto_331600 ?auto_331601 ?auto_331602 ?auto_331603 ?auto_331604 )
      ( MAKE-9PILE ?auto_331598 ?auto_331599 ?auto_331600 ?auto_331601 ?auto_331602 ?auto_331603 ?auto_331604 ?auto_331605 ?auto_331606 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331617 - BLOCK
      ?auto_331618 - BLOCK
      ?auto_331619 - BLOCK
      ?auto_331620 - BLOCK
      ?auto_331621 - BLOCK
      ?auto_331622 - BLOCK
      ?auto_331623 - BLOCK
      ?auto_331624 - BLOCK
      ?auto_331625 - BLOCK
    )
    :vars
    (
      ?auto_331626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331625 ?auto_331626 ) ( ON-TABLE ?auto_331617 ) ( ON ?auto_331618 ?auto_331617 ) ( ON ?auto_331619 ?auto_331618 ) ( ON ?auto_331620 ?auto_331619 ) ( ON ?auto_331621 ?auto_331620 ) ( ON ?auto_331622 ?auto_331621 ) ( not ( = ?auto_331617 ?auto_331618 ) ) ( not ( = ?auto_331617 ?auto_331619 ) ) ( not ( = ?auto_331617 ?auto_331620 ) ) ( not ( = ?auto_331617 ?auto_331621 ) ) ( not ( = ?auto_331617 ?auto_331622 ) ) ( not ( = ?auto_331617 ?auto_331623 ) ) ( not ( = ?auto_331617 ?auto_331624 ) ) ( not ( = ?auto_331617 ?auto_331625 ) ) ( not ( = ?auto_331617 ?auto_331626 ) ) ( not ( = ?auto_331618 ?auto_331619 ) ) ( not ( = ?auto_331618 ?auto_331620 ) ) ( not ( = ?auto_331618 ?auto_331621 ) ) ( not ( = ?auto_331618 ?auto_331622 ) ) ( not ( = ?auto_331618 ?auto_331623 ) ) ( not ( = ?auto_331618 ?auto_331624 ) ) ( not ( = ?auto_331618 ?auto_331625 ) ) ( not ( = ?auto_331618 ?auto_331626 ) ) ( not ( = ?auto_331619 ?auto_331620 ) ) ( not ( = ?auto_331619 ?auto_331621 ) ) ( not ( = ?auto_331619 ?auto_331622 ) ) ( not ( = ?auto_331619 ?auto_331623 ) ) ( not ( = ?auto_331619 ?auto_331624 ) ) ( not ( = ?auto_331619 ?auto_331625 ) ) ( not ( = ?auto_331619 ?auto_331626 ) ) ( not ( = ?auto_331620 ?auto_331621 ) ) ( not ( = ?auto_331620 ?auto_331622 ) ) ( not ( = ?auto_331620 ?auto_331623 ) ) ( not ( = ?auto_331620 ?auto_331624 ) ) ( not ( = ?auto_331620 ?auto_331625 ) ) ( not ( = ?auto_331620 ?auto_331626 ) ) ( not ( = ?auto_331621 ?auto_331622 ) ) ( not ( = ?auto_331621 ?auto_331623 ) ) ( not ( = ?auto_331621 ?auto_331624 ) ) ( not ( = ?auto_331621 ?auto_331625 ) ) ( not ( = ?auto_331621 ?auto_331626 ) ) ( not ( = ?auto_331622 ?auto_331623 ) ) ( not ( = ?auto_331622 ?auto_331624 ) ) ( not ( = ?auto_331622 ?auto_331625 ) ) ( not ( = ?auto_331622 ?auto_331626 ) ) ( not ( = ?auto_331623 ?auto_331624 ) ) ( not ( = ?auto_331623 ?auto_331625 ) ) ( not ( = ?auto_331623 ?auto_331626 ) ) ( not ( = ?auto_331624 ?auto_331625 ) ) ( not ( = ?auto_331624 ?auto_331626 ) ) ( not ( = ?auto_331625 ?auto_331626 ) ) ( ON ?auto_331624 ?auto_331625 ) ( CLEAR ?auto_331622 ) ( ON ?auto_331623 ?auto_331624 ) ( CLEAR ?auto_331623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_331617 ?auto_331618 ?auto_331619 ?auto_331620 ?auto_331621 ?auto_331622 ?auto_331623 )
      ( MAKE-9PILE ?auto_331617 ?auto_331618 ?auto_331619 ?auto_331620 ?auto_331621 ?auto_331622 ?auto_331623 ?auto_331624 ?auto_331625 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331636 - BLOCK
      ?auto_331637 - BLOCK
      ?auto_331638 - BLOCK
      ?auto_331639 - BLOCK
      ?auto_331640 - BLOCK
      ?auto_331641 - BLOCK
      ?auto_331642 - BLOCK
      ?auto_331643 - BLOCK
      ?auto_331644 - BLOCK
    )
    :vars
    (
      ?auto_331645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331644 ?auto_331645 ) ( ON-TABLE ?auto_331636 ) ( ON ?auto_331637 ?auto_331636 ) ( ON ?auto_331638 ?auto_331637 ) ( ON ?auto_331639 ?auto_331638 ) ( ON ?auto_331640 ?auto_331639 ) ( not ( = ?auto_331636 ?auto_331637 ) ) ( not ( = ?auto_331636 ?auto_331638 ) ) ( not ( = ?auto_331636 ?auto_331639 ) ) ( not ( = ?auto_331636 ?auto_331640 ) ) ( not ( = ?auto_331636 ?auto_331641 ) ) ( not ( = ?auto_331636 ?auto_331642 ) ) ( not ( = ?auto_331636 ?auto_331643 ) ) ( not ( = ?auto_331636 ?auto_331644 ) ) ( not ( = ?auto_331636 ?auto_331645 ) ) ( not ( = ?auto_331637 ?auto_331638 ) ) ( not ( = ?auto_331637 ?auto_331639 ) ) ( not ( = ?auto_331637 ?auto_331640 ) ) ( not ( = ?auto_331637 ?auto_331641 ) ) ( not ( = ?auto_331637 ?auto_331642 ) ) ( not ( = ?auto_331637 ?auto_331643 ) ) ( not ( = ?auto_331637 ?auto_331644 ) ) ( not ( = ?auto_331637 ?auto_331645 ) ) ( not ( = ?auto_331638 ?auto_331639 ) ) ( not ( = ?auto_331638 ?auto_331640 ) ) ( not ( = ?auto_331638 ?auto_331641 ) ) ( not ( = ?auto_331638 ?auto_331642 ) ) ( not ( = ?auto_331638 ?auto_331643 ) ) ( not ( = ?auto_331638 ?auto_331644 ) ) ( not ( = ?auto_331638 ?auto_331645 ) ) ( not ( = ?auto_331639 ?auto_331640 ) ) ( not ( = ?auto_331639 ?auto_331641 ) ) ( not ( = ?auto_331639 ?auto_331642 ) ) ( not ( = ?auto_331639 ?auto_331643 ) ) ( not ( = ?auto_331639 ?auto_331644 ) ) ( not ( = ?auto_331639 ?auto_331645 ) ) ( not ( = ?auto_331640 ?auto_331641 ) ) ( not ( = ?auto_331640 ?auto_331642 ) ) ( not ( = ?auto_331640 ?auto_331643 ) ) ( not ( = ?auto_331640 ?auto_331644 ) ) ( not ( = ?auto_331640 ?auto_331645 ) ) ( not ( = ?auto_331641 ?auto_331642 ) ) ( not ( = ?auto_331641 ?auto_331643 ) ) ( not ( = ?auto_331641 ?auto_331644 ) ) ( not ( = ?auto_331641 ?auto_331645 ) ) ( not ( = ?auto_331642 ?auto_331643 ) ) ( not ( = ?auto_331642 ?auto_331644 ) ) ( not ( = ?auto_331642 ?auto_331645 ) ) ( not ( = ?auto_331643 ?auto_331644 ) ) ( not ( = ?auto_331643 ?auto_331645 ) ) ( not ( = ?auto_331644 ?auto_331645 ) ) ( ON ?auto_331643 ?auto_331644 ) ( ON ?auto_331642 ?auto_331643 ) ( CLEAR ?auto_331640 ) ( ON ?auto_331641 ?auto_331642 ) ( CLEAR ?auto_331641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_331636 ?auto_331637 ?auto_331638 ?auto_331639 ?auto_331640 ?auto_331641 )
      ( MAKE-9PILE ?auto_331636 ?auto_331637 ?auto_331638 ?auto_331639 ?auto_331640 ?auto_331641 ?auto_331642 ?auto_331643 ?auto_331644 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331655 - BLOCK
      ?auto_331656 - BLOCK
      ?auto_331657 - BLOCK
      ?auto_331658 - BLOCK
      ?auto_331659 - BLOCK
      ?auto_331660 - BLOCK
      ?auto_331661 - BLOCK
      ?auto_331662 - BLOCK
      ?auto_331663 - BLOCK
    )
    :vars
    (
      ?auto_331664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331663 ?auto_331664 ) ( ON-TABLE ?auto_331655 ) ( ON ?auto_331656 ?auto_331655 ) ( ON ?auto_331657 ?auto_331656 ) ( ON ?auto_331658 ?auto_331657 ) ( ON ?auto_331659 ?auto_331658 ) ( not ( = ?auto_331655 ?auto_331656 ) ) ( not ( = ?auto_331655 ?auto_331657 ) ) ( not ( = ?auto_331655 ?auto_331658 ) ) ( not ( = ?auto_331655 ?auto_331659 ) ) ( not ( = ?auto_331655 ?auto_331660 ) ) ( not ( = ?auto_331655 ?auto_331661 ) ) ( not ( = ?auto_331655 ?auto_331662 ) ) ( not ( = ?auto_331655 ?auto_331663 ) ) ( not ( = ?auto_331655 ?auto_331664 ) ) ( not ( = ?auto_331656 ?auto_331657 ) ) ( not ( = ?auto_331656 ?auto_331658 ) ) ( not ( = ?auto_331656 ?auto_331659 ) ) ( not ( = ?auto_331656 ?auto_331660 ) ) ( not ( = ?auto_331656 ?auto_331661 ) ) ( not ( = ?auto_331656 ?auto_331662 ) ) ( not ( = ?auto_331656 ?auto_331663 ) ) ( not ( = ?auto_331656 ?auto_331664 ) ) ( not ( = ?auto_331657 ?auto_331658 ) ) ( not ( = ?auto_331657 ?auto_331659 ) ) ( not ( = ?auto_331657 ?auto_331660 ) ) ( not ( = ?auto_331657 ?auto_331661 ) ) ( not ( = ?auto_331657 ?auto_331662 ) ) ( not ( = ?auto_331657 ?auto_331663 ) ) ( not ( = ?auto_331657 ?auto_331664 ) ) ( not ( = ?auto_331658 ?auto_331659 ) ) ( not ( = ?auto_331658 ?auto_331660 ) ) ( not ( = ?auto_331658 ?auto_331661 ) ) ( not ( = ?auto_331658 ?auto_331662 ) ) ( not ( = ?auto_331658 ?auto_331663 ) ) ( not ( = ?auto_331658 ?auto_331664 ) ) ( not ( = ?auto_331659 ?auto_331660 ) ) ( not ( = ?auto_331659 ?auto_331661 ) ) ( not ( = ?auto_331659 ?auto_331662 ) ) ( not ( = ?auto_331659 ?auto_331663 ) ) ( not ( = ?auto_331659 ?auto_331664 ) ) ( not ( = ?auto_331660 ?auto_331661 ) ) ( not ( = ?auto_331660 ?auto_331662 ) ) ( not ( = ?auto_331660 ?auto_331663 ) ) ( not ( = ?auto_331660 ?auto_331664 ) ) ( not ( = ?auto_331661 ?auto_331662 ) ) ( not ( = ?auto_331661 ?auto_331663 ) ) ( not ( = ?auto_331661 ?auto_331664 ) ) ( not ( = ?auto_331662 ?auto_331663 ) ) ( not ( = ?auto_331662 ?auto_331664 ) ) ( not ( = ?auto_331663 ?auto_331664 ) ) ( ON ?auto_331662 ?auto_331663 ) ( ON ?auto_331661 ?auto_331662 ) ( CLEAR ?auto_331659 ) ( ON ?auto_331660 ?auto_331661 ) ( CLEAR ?auto_331660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_331655 ?auto_331656 ?auto_331657 ?auto_331658 ?auto_331659 ?auto_331660 )
      ( MAKE-9PILE ?auto_331655 ?auto_331656 ?auto_331657 ?auto_331658 ?auto_331659 ?auto_331660 ?auto_331661 ?auto_331662 ?auto_331663 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331674 - BLOCK
      ?auto_331675 - BLOCK
      ?auto_331676 - BLOCK
      ?auto_331677 - BLOCK
      ?auto_331678 - BLOCK
      ?auto_331679 - BLOCK
      ?auto_331680 - BLOCK
      ?auto_331681 - BLOCK
      ?auto_331682 - BLOCK
    )
    :vars
    (
      ?auto_331683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331682 ?auto_331683 ) ( ON-TABLE ?auto_331674 ) ( ON ?auto_331675 ?auto_331674 ) ( ON ?auto_331676 ?auto_331675 ) ( ON ?auto_331677 ?auto_331676 ) ( not ( = ?auto_331674 ?auto_331675 ) ) ( not ( = ?auto_331674 ?auto_331676 ) ) ( not ( = ?auto_331674 ?auto_331677 ) ) ( not ( = ?auto_331674 ?auto_331678 ) ) ( not ( = ?auto_331674 ?auto_331679 ) ) ( not ( = ?auto_331674 ?auto_331680 ) ) ( not ( = ?auto_331674 ?auto_331681 ) ) ( not ( = ?auto_331674 ?auto_331682 ) ) ( not ( = ?auto_331674 ?auto_331683 ) ) ( not ( = ?auto_331675 ?auto_331676 ) ) ( not ( = ?auto_331675 ?auto_331677 ) ) ( not ( = ?auto_331675 ?auto_331678 ) ) ( not ( = ?auto_331675 ?auto_331679 ) ) ( not ( = ?auto_331675 ?auto_331680 ) ) ( not ( = ?auto_331675 ?auto_331681 ) ) ( not ( = ?auto_331675 ?auto_331682 ) ) ( not ( = ?auto_331675 ?auto_331683 ) ) ( not ( = ?auto_331676 ?auto_331677 ) ) ( not ( = ?auto_331676 ?auto_331678 ) ) ( not ( = ?auto_331676 ?auto_331679 ) ) ( not ( = ?auto_331676 ?auto_331680 ) ) ( not ( = ?auto_331676 ?auto_331681 ) ) ( not ( = ?auto_331676 ?auto_331682 ) ) ( not ( = ?auto_331676 ?auto_331683 ) ) ( not ( = ?auto_331677 ?auto_331678 ) ) ( not ( = ?auto_331677 ?auto_331679 ) ) ( not ( = ?auto_331677 ?auto_331680 ) ) ( not ( = ?auto_331677 ?auto_331681 ) ) ( not ( = ?auto_331677 ?auto_331682 ) ) ( not ( = ?auto_331677 ?auto_331683 ) ) ( not ( = ?auto_331678 ?auto_331679 ) ) ( not ( = ?auto_331678 ?auto_331680 ) ) ( not ( = ?auto_331678 ?auto_331681 ) ) ( not ( = ?auto_331678 ?auto_331682 ) ) ( not ( = ?auto_331678 ?auto_331683 ) ) ( not ( = ?auto_331679 ?auto_331680 ) ) ( not ( = ?auto_331679 ?auto_331681 ) ) ( not ( = ?auto_331679 ?auto_331682 ) ) ( not ( = ?auto_331679 ?auto_331683 ) ) ( not ( = ?auto_331680 ?auto_331681 ) ) ( not ( = ?auto_331680 ?auto_331682 ) ) ( not ( = ?auto_331680 ?auto_331683 ) ) ( not ( = ?auto_331681 ?auto_331682 ) ) ( not ( = ?auto_331681 ?auto_331683 ) ) ( not ( = ?auto_331682 ?auto_331683 ) ) ( ON ?auto_331681 ?auto_331682 ) ( ON ?auto_331680 ?auto_331681 ) ( ON ?auto_331679 ?auto_331680 ) ( CLEAR ?auto_331677 ) ( ON ?auto_331678 ?auto_331679 ) ( CLEAR ?auto_331678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_331674 ?auto_331675 ?auto_331676 ?auto_331677 ?auto_331678 )
      ( MAKE-9PILE ?auto_331674 ?auto_331675 ?auto_331676 ?auto_331677 ?auto_331678 ?auto_331679 ?auto_331680 ?auto_331681 ?auto_331682 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331693 - BLOCK
      ?auto_331694 - BLOCK
      ?auto_331695 - BLOCK
      ?auto_331696 - BLOCK
      ?auto_331697 - BLOCK
      ?auto_331698 - BLOCK
      ?auto_331699 - BLOCK
      ?auto_331700 - BLOCK
      ?auto_331701 - BLOCK
    )
    :vars
    (
      ?auto_331702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331701 ?auto_331702 ) ( ON-TABLE ?auto_331693 ) ( ON ?auto_331694 ?auto_331693 ) ( ON ?auto_331695 ?auto_331694 ) ( ON ?auto_331696 ?auto_331695 ) ( not ( = ?auto_331693 ?auto_331694 ) ) ( not ( = ?auto_331693 ?auto_331695 ) ) ( not ( = ?auto_331693 ?auto_331696 ) ) ( not ( = ?auto_331693 ?auto_331697 ) ) ( not ( = ?auto_331693 ?auto_331698 ) ) ( not ( = ?auto_331693 ?auto_331699 ) ) ( not ( = ?auto_331693 ?auto_331700 ) ) ( not ( = ?auto_331693 ?auto_331701 ) ) ( not ( = ?auto_331693 ?auto_331702 ) ) ( not ( = ?auto_331694 ?auto_331695 ) ) ( not ( = ?auto_331694 ?auto_331696 ) ) ( not ( = ?auto_331694 ?auto_331697 ) ) ( not ( = ?auto_331694 ?auto_331698 ) ) ( not ( = ?auto_331694 ?auto_331699 ) ) ( not ( = ?auto_331694 ?auto_331700 ) ) ( not ( = ?auto_331694 ?auto_331701 ) ) ( not ( = ?auto_331694 ?auto_331702 ) ) ( not ( = ?auto_331695 ?auto_331696 ) ) ( not ( = ?auto_331695 ?auto_331697 ) ) ( not ( = ?auto_331695 ?auto_331698 ) ) ( not ( = ?auto_331695 ?auto_331699 ) ) ( not ( = ?auto_331695 ?auto_331700 ) ) ( not ( = ?auto_331695 ?auto_331701 ) ) ( not ( = ?auto_331695 ?auto_331702 ) ) ( not ( = ?auto_331696 ?auto_331697 ) ) ( not ( = ?auto_331696 ?auto_331698 ) ) ( not ( = ?auto_331696 ?auto_331699 ) ) ( not ( = ?auto_331696 ?auto_331700 ) ) ( not ( = ?auto_331696 ?auto_331701 ) ) ( not ( = ?auto_331696 ?auto_331702 ) ) ( not ( = ?auto_331697 ?auto_331698 ) ) ( not ( = ?auto_331697 ?auto_331699 ) ) ( not ( = ?auto_331697 ?auto_331700 ) ) ( not ( = ?auto_331697 ?auto_331701 ) ) ( not ( = ?auto_331697 ?auto_331702 ) ) ( not ( = ?auto_331698 ?auto_331699 ) ) ( not ( = ?auto_331698 ?auto_331700 ) ) ( not ( = ?auto_331698 ?auto_331701 ) ) ( not ( = ?auto_331698 ?auto_331702 ) ) ( not ( = ?auto_331699 ?auto_331700 ) ) ( not ( = ?auto_331699 ?auto_331701 ) ) ( not ( = ?auto_331699 ?auto_331702 ) ) ( not ( = ?auto_331700 ?auto_331701 ) ) ( not ( = ?auto_331700 ?auto_331702 ) ) ( not ( = ?auto_331701 ?auto_331702 ) ) ( ON ?auto_331700 ?auto_331701 ) ( ON ?auto_331699 ?auto_331700 ) ( ON ?auto_331698 ?auto_331699 ) ( CLEAR ?auto_331696 ) ( ON ?auto_331697 ?auto_331698 ) ( CLEAR ?auto_331697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_331693 ?auto_331694 ?auto_331695 ?auto_331696 ?auto_331697 )
      ( MAKE-9PILE ?auto_331693 ?auto_331694 ?auto_331695 ?auto_331696 ?auto_331697 ?auto_331698 ?auto_331699 ?auto_331700 ?auto_331701 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331712 - BLOCK
      ?auto_331713 - BLOCK
      ?auto_331714 - BLOCK
      ?auto_331715 - BLOCK
      ?auto_331716 - BLOCK
      ?auto_331717 - BLOCK
      ?auto_331718 - BLOCK
      ?auto_331719 - BLOCK
      ?auto_331720 - BLOCK
    )
    :vars
    (
      ?auto_331721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331720 ?auto_331721 ) ( ON-TABLE ?auto_331712 ) ( ON ?auto_331713 ?auto_331712 ) ( ON ?auto_331714 ?auto_331713 ) ( not ( = ?auto_331712 ?auto_331713 ) ) ( not ( = ?auto_331712 ?auto_331714 ) ) ( not ( = ?auto_331712 ?auto_331715 ) ) ( not ( = ?auto_331712 ?auto_331716 ) ) ( not ( = ?auto_331712 ?auto_331717 ) ) ( not ( = ?auto_331712 ?auto_331718 ) ) ( not ( = ?auto_331712 ?auto_331719 ) ) ( not ( = ?auto_331712 ?auto_331720 ) ) ( not ( = ?auto_331712 ?auto_331721 ) ) ( not ( = ?auto_331713 ?auto_331714 ) ) ( not ( = ?auto_331713 ?auto_331715 ) ) ( not ( = ?auto_331713 ?auto_331716 ) ) ( not ( = ?auto_331713 ?auto_331717 ) ) ( not ( = ?auto_331713 ?auto_331718 ) ) ( not ( = ?auto_331713 ?auto_331719 ) ) ( not ( = ?auto_331713 ?auto_331720 ) ) ( not ( = ?auto_331713 ?auto_331721 ) ) ( not ( = ?auto_331714 ?auto_331715 ) ) ( not ( = ?auto_331714 ?auto_331716 ) ) ( not ( = ?auto_331714 ?auto_331717 ) ) ( not ( = ?auto_331714 ?auto_331718 ) ) ( not ( = ?auto_331714 ?auto_331719 ) ) ( not ( = ?auto_331714 ?auto_331720 ) ) ( not ( = ?auto_331714 ?auto_331721 ) ) ( not ( = ?auto_331715 ?auto_331716 ) ) ( not ( = ?auto_331715 ?auto_331717 ) ) ( not ( = ?auto_331715 ?auto_331718 ) ) ( not ( = ?auto_331715 ?auto_331719 ) ) ( not ( = ?auto_331715 ?auto_331720 ) ) ( not ( = ?auto_331715 ?auto_331721 ) ) ( not ( = ?auto_331716 ?auto_331717 ) ) ( not ( = ?auto_331716 ?auto_331718 ) ) ( not ( = ?auto_331716 ?auto_331719 ) ) ( not ( = ?auto_331716 ?auto_331720 ) ) ( not ( = ?auto_331716 ?auto_331721 ) ) ( not ( = ?auto_331717 ?auto_331718 ) ) ( not ( = ?auto_331717 ?auto_331719 ) ) ( not ( = ?auto_331717 ?auto_331720 ) ) ( not ( = ?auto_331717 ?auto_331721 ) ) ( not ( = ?auto_331718 ?auto_331719 ) ) ( not ( = ?auto_331718 ?auto_331720 ) ) ( not ( = ?auto_331718 ?auto_331721 ) ) ( not ( = ?auto_331719 ?auto_331720 ) ) ( not ( = ?auto_331719 ?auto_331721 ) ) ( not ( = ?auto_331720 ?auto_331721 ) ) ( ON ?auto_331719 ?auto_331720 ) ( ON ?auto_331718 ?auto_331719 ) ( ON ?auto_331717 ?auto_331718 ) ( ON ?auto_331716 ?auto_331717 ) ( CLEAR ?auto_331714 ) ( ON ?auto_331715 ?auto_331716 ) ( CLEAR ?auto_331715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_331712 ?auto_331713 ?auto_331714 ?auto_331715 )
      ( MAKE-9PILE ?auto_331712 ?auto_331713 ?auto_331714 ?auto_331715 ?auto_331716 ?auto_331717 ?auto_331718 ?auto_331719 ?auto_331720 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331731 - BLOCK
      ?auto_331732 - BLOCK
      ?auto_331733 - BLOCK
      ?auto_331734 - BLOCK
      ?auto_331735 - BLOCK
      ?auto_331736 - BLOCK
      ?auto_331737 - BLOCK
      ?auto_331738 - BLOCK
      ?auto_331739 - BLOCK
    )
    :vars
    (
      ?auto_331740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331739 ?auto_331740 ) ( ON-TABLE ?auto_331731 ) ( ON ?auto_331732 ?auto_331731 ) ( ON ?auto_331733 ?auto_331732 ) ( not ( = ?auto_331731 ?auto_331732 ) ) ( not ( = ?auto_331731 ?auto_331733 ) ) ( not ( = ?auto_331731 ?auto_331734 ) ) ( not ( = ?auto_331731 ?auto_331735 ) ) ( not ( = ?auto_331731 ?auto_331736 ) ) ( not ( = ?auto_331731 ?auto_331737 ) ) ( not ( = ?auto_331731 ?auto_331738 ) ) ( not ( = ?auto_331731 ?auto_331739 ) ) ( not ( = ?auto_331731 ?auto_331740 ) ) ( not ( = ?auto_331732 ?auto_331733 ) ) ( not ( = ?auto_331732 ?auto_331734 ) ) ( not ( = ?auto_331732 ?auto_331735 ) ) ( not ( = ?auto_331732 ?auto_331736 ) ) ( not ( = ?auto_331732 ?auto_331737 ) ) ( not ( = ?auto_331732 ?auto_331738 ) ) ( not ( = ?auto_331732 ?auto_331739 ) ) ( not ( = ?auto_331732 ?auto_331740 ) ) ( not ( = ?auto_331733 ?auto_331734 ) ) ( not ( = ?auto_331733 ?auto_331735 ) ) ( not ( = ?auto_331733 ?auto_331736 ) ) ( not ( = ?auto_331733 ?auto_331737 ) ) ( not ( = ?auto_331733 ?auto_331738 ) ) ( not ( = ?auto_331733 ?auto_331739 ) ) ( not ( = ?auto_331733 ?auto_331740 ) ) ( not ( = ?auto_331734 ?auto_331735 ) ) ( not ( = ?auto_331734 ?auto_331736 ) ) ( not ( = ?auto_331734 ?auto_331737 ) ) ( not ( = ?auto_331734 ?auto_331738 ) ) ( not ( = ?auto_331734 ?auto_331739 ) ) ( not ( = ?auto_331734 ?auto_331740 ) ) ( not ( = ?auto_331735 ?auto_331736 ) ) ( not ( = ?auto_331735 ?auto_331737 ) ) ( not ( = ?auto_331735 ?auto_331738 ) ) ( not ( = ?auto_331735 ?auto_331739 ) ) ( not ( = ?auto_331735 ?auto_331740 ) ) ( not ( = ?auto_331736 ?auto_331737 ) ) ( not ( = ?auto_331736 ?auto_331738 ) ) ( not ( = ?auto_331736 ?auto_331739 ) ) ( not ( = ?auto_331736 ?auto_331740 ) ) ( not ( = ?auto_331737 ?auto_331738 ) ) ( not ( = ?auto_331737 ?auto_331739 ) ) ( not ( = ?auto_331737 ?auto_331740 ) ) ( not ( = ?auto_331738 ?auto_331739 ) ) ( not ( = ?auto_331738 ?auto_331740 ) ) ( not ( = ?auto_331739 ?auto_331740 ) ) ( ON ?auto_331738 ?auto_331739 ) ( ON ?auto_331737 ?auto_331738 ) ( ON ?auto_331736 ?auto_331737 ) ( ON ?auto_331735 ?auto_331736 ) ( CLEAR ?auto_331733 ) ( ON ?auto_331734 ?auto_331735 ) ( CLEAR ?auto_331734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_331731 ?auto_331732 ?auto_331733 ?auto_331734 )
      ( MAKE-9PILE ?auto_331731 ?auto_331732 ?auto_331733 ?auto_331734 ?auto_331735 ?auto_331736 ?auto_331737 ?auto_331738 ?auto_331739 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331750 - BLOCK
      ?auto_331751 - BLOCK
      ?auto_331752 - BLOCK
      ?auto_331753 - BLOCK
      ?auto_331754 - BLOCK
      ?auto_331755 - BLOCK
      ?auto_331756 - BLOCK
      ?auto_331757 - BLOCK
      ?auto_331758 - BLOCK
    )
    :vars
    (
      ?auto_331759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331758 ?auto_331759 ) ( ON-TABLE ?auto_331750 ) ( ON ?auto_331751 ?auto_331750 ) ( not ( = ?auto_331750 ?auto_331751 ) ) ( not ( = ?auto_331750 ?auto_331752 ) ) ( not ( = ?auto_331750 ?auto_331753 ) ) ( not ( = ?auto_331750 ?auto_331754 ) ) ( not ( = ?auto_331750 ?auto_331755 ) ) ( not ( = ?auto_331750 ?auto_331756 ) ) ( not ( = ?auto_331750 ?auto_331757 ) ) ( not ( = ?auto_331750 ?auto_331758 ) ) ( not ( = ?auto_331750 ?auto_331759 ) ) ( not ( = ?auto_331751 ?auto_331752 ) ) ( not ( = ?auto_331751 ?auto_331753 ) ) ( not ( = ?auto_331751 ?auto_331754 ) ) ( not ( = ?auto_331751 ?auto_331755 ) ) ( not ( = ?auto_331751 ?auto_331756 ) ) ( not ( = ?auto_331751 ?auto_331757 ) ) ( not ( = ?auto_331751 ?auto_331758 ) ) ( not ( = ?auto_331751 ?auto_331759 ) ) ( not ( = ?auto_331752 ?auto_331753 ) ) ( not ( = ?auto_331752 ?auto_331754 ) ) ( not ( = ?auto_331752 ?auto_331755 ) ) ( not ( = ?auto_331752 ?auto_331756 ) ) ( not ( = ?auto_331752 ?auto_331757 ) ) ( not ( = ?auto_331752 ?auto_331758 ) ) ( not ( = ?auto_331752 ?auto_331759 ) ) ( not ( = ?auto_331753 ?auto_331754 ) ) ( not ( = ?auto_331753 ?auto_331755 ) ) ( not ( = ?auto_331753 ?auto_331756 ) ) ( not ( = ?auto_331753 ?auto_331757 ) ) ( not ( = ?auto_331753 ?auto_331758 ) ) ( not ( = ?auto_331753 ?auto_331759 ) ) ( not ( = ?auto_331754 ?auto_331755 ) ) ( not ( = ?auto_331754 ?auto_331756 ) ) ( not ( = ?auto_331754 ?auto_331757 ) ) ( not ( = ?auto_331754 ?auto_331758 ) ) ( not ( = ?auto_331754 ?auto_331759 ) ) ( not ( = ?auto_331755 ?auto_331756 ) ) ( not ( = ?auto_331755 ?auto_331757 ) ) ( not ( = ?auto_331755 ?auto_331758 ) ) ( not ( = ?auto_331755 ?auto_331759 ) ) ( not ( = ?auto_331756 ?auto_331757 ) ) ( not ( = ?auto_331756 ?auto_331758 ) ) ( not ( = ?auto_331756 ?auto_331759 ) ) ( not ( = ?auto_331757 ?auto_331758 ) ) ( not ( = ?auto_331757 ?auto_331759 ) ) ( not ( = ?auto_331758 ?auto_331759 ) ) ( ON ?auto_331757 ?auto_331758 ) ( ON ?auto_331756 ?auto_331757 ) ( ON ?auto_331755 ?auto_331756 ) ( ON ?auto_331754 ?auto_331755 ) ( ON ?auto_331753 ?auto_331754 ) ( CLEAR ?auto_331751 ) ( ON ?auto_331752 ?auto_331753 ) ( CLEAR ?auto_331752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_331750 ?auto_331751 ?auto_331752 )
      ( MAKE-9PILE ?auto_331750 ?auto_331751 ?auto_331752 ?auto_331753 ?auto_331754 ?auto_331755 ?auto_331756 ?auto_331757 ?auto_331758 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331769 - BLOCK
      ?auto_331770 - BLOCK
      ?auto_331771 - BLOCK
      ?auto_331772 - BLOCK
      ?auto_331773 - BLOCK
      ?auto_331774 - BLOCK
      ?auto_331775 - BLOCK
      ?auto_331776 - BLOCK
      ?auto_331777 - BLOCK
    )
    :vars
    (
      ?auto_331778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331777 ?auto_331778 ) ( ON-TABLE ?auto_331769 ) ( ON ?auto_331770 ?auto_331769 ) ( not ( = ?auto_331769 ?auto_331770 ) ) ( not ( = ?auto_331769 ?auto_331771 ) ) ( not ( = ?auto_331769 ?auto_331772 ) ) ( not ( = ?auto_331769 ?auto_331773 ) ) ( not ( = ?auto_331769 ?auto_331774 ) ) ( not ( = ?auto_331769 ?auto_331775 ) ) ( not ( = ?auto_331769 ?auto_331776 ) ) ( not ( = ?auto_331769 ?auto_331777 ) ) ( not ( = ?auto_331769 ?auto_331778 ) ) ( not ( = ?auto_331770 ?auto_331771 ) ) ( not ( = ?auto_331770 ?auto_331772 ) ) ( not ( = ?auto_331770 ?auto_331773 ) ) ( not ( = ?auto_331770 ?auto_331774 ) ) ( not ( = ?auto_331770 ?auto_331775 ) ) ( not ( = ?auto_331770 ?auto_331776 ) ) ( not ( = ?auto_331770 ?auto_331777 ) ) ( not ( = ?auto_331770 ?auto_331778 ) ) ( not ( = ?auto_331771 ?auto_331772 ) ) ( not ( = ?auto_331771 ?auto_331773 ) ) ( not ( = ?auto_331771 ?auto_331774 ) ) ( not ( = ?auto_331771 ?auto_331775 ) ) ( not ( = ?auto_331771 ?auto_331776 ) ) ( not ( = ?auto_331771 ?auto_331777 ) ) ( not ( = ?auto_331771 ?auto_331778 ) ) ( not ( = ?auto_331772 ?auto_331773 ) ) ( not ( = ?auto_331772 ?auto_331774 ) ) ( not ( = ?auto_331772 ?auto_331775 ) ) ( not ( = ?auto_331772 ?auto_331776 ) ) ( not ( = ?auto_331772 ?auto_331777 ) ) ( not ( = ?auto_331772 ?auto_331778 ) ) ( not ( = ?auto_331773 ?auto_331774 ) ) ( not ( = ?auto_331773 ?auto_331775 ) ) ( not ( = ?auto_331773 ?auto_331776 ) ) ( not ( = ?auto_331773 ?auto_331777 ) ) ( not ( = ?auto_331773 ?auto_331778 ) ) ( not ( = ?auto_331774 ?auto_331775 ) ) ( not ( = ?auto_331774 ?auto_331776 ) ) ( not ( = ?auto_331774 ?auto_331777 ) ) ( not ( = ?auto_331774 ?auto_331778 ) ) ( not ( = ?auto_331775 ?auto_331776 ) ) ( not ( = ?auto_331775 ?auto_331777 ) ) ( not ( = ?auto_331775 ?auto_331778 ) ) ( not ( = ?auto_331776 ?auto_331777 ) ) ( not ( = ?auto_331776 ?auto_331778 ) ) ( not ( = ?auto_331777 ?auto_331778 ) ) ( ON ?auto_331776 ?auto_331777 ) ( ON ?auto_331775 ?auto_331776 ) ( ON ?auto_331774 ?auto_331775 ) ( ON ?auto_331773 ?auto_331774 ) ( ON ?auto_331772 ?auto_331773 ) ( CLEAR ?auto_331770 ) ( ON ?auto_331771 ?auto_331772 ) ( CLEAR ?auto_331771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_331769 ?auto_331770 ?auto_331771 )
      ( MAKE-9PILE ?auto_331769 ?auto_331770 ?auto_331771 ?auto_331772 ?auto_331773 ?auto_331774 ?auto_331775 ?auto_331776 ?auto_331777 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331788 - BLOCK
      ?auto_331789 - BLOCK
      ?auto_331790 - BLOCK
      ?auto_331791 - BLOCK
      ?auto_331792 - BLOCK
      ?auto_331793 - BLOCK
      ?auto_331794 - BLOCK
      ?auto_331795 - BLOCK
      ?auto_331796 - BLOCK
    )
    :vars
    (
      ?auto_331797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331796 ?auto_331797 ) ( ON-TABLE ?auto_331788 ) ( not ( = ?auto_331788 ?auto_331789 ) ) ( not ( = ?auto_331788 ?auto_331790 ) ) ( not ( = ?auto_331788 ?auto_331791 ) ) ( not ( = ?auto_331788 ?auto_331792 ) ) ( not ( = ?auto_331788 ?auto_331793 ) ) ( not ( = ?auto_331788 ?auto_331794 ) ) ( not ( = ?auto_331788 ?auto_331795 ) ) ( not ( = ?auto_331788 ?auto_331796 ) ) ( not ( = ?auto_331788 ?auto_331797 ) ) ( not ( = ?auto_331789 ?auto_331790 ) ) ( not ( = ?auto_331789 ?auto_331791 ) ) ( not ( = ?auto_331789 ?auto_331792 ) ) ( not ( = ?auto_331789 ?auto_331793 ) ) ( not ( = ?auto_331789 ?auto_331794 ) ) ( not ( = ?auto_331789 ?auto_331795 ) ) ( not ( = ?auto_331789 ?auto_331796 ) ) ( not ( = ?auto_331789 ?auto_331797 ) ) ( not ( = ?auto_331790 ?auto_331791 ) ) ( not ( = ?auto_331790 ?auto_331792 ) ) ( not ( = ?auto_331790 ?auto_331793 ) ) ( not ( = ?auto_331790 ?auto_331794 ) ) ( not ( = ?auto_331790 ?auto_331795 ) ) ( not ( = ?auto_331790 ?auto_331796 ) ) ( not ( = ?auto_331790 ?auto_331797 ) ) ( not ( = ?auto_331791 ?auto_331792 ) ) ( not ( = ?auto_331791 ?auto_331793 ) ) ( not ( = ?auto_331791 ?auto_331794 ) ) ( not ( = ?auto_331791 ?auto_331795 ) ) ( not ( = ?auto_331791 ?auto_331796 ) ) ( not ( = ?auto_331791 ?auto_331797 ) ) ( not ( = ?auto_331792 ?auto_331793 ) ) ( not ( = ?auto_331792 ?auto_331794 ) ) ( not ( = ?auto_331792 ?auto_331795 ) ) ( not ( = ?auto_331792 ?auto_331796 ) ) ( not ( = ?auto_331792 ?auto_331797 ) ) ( not ( = ?auto_331793 ?auto_331794 ) ) ( not ( = ?auto_331793 ?auto_331795 ) ) ( not ( = ?auto_331793 ?auto_331796 ) ) ( not ( = ?auto_331793 ?auto_331797 ) ) ( not ( = ?auto_331794 ?auto_331795 ) ) ( not ( = ?auto_331794 ?auto_331796 ) ) ( not ( = ?auto_331794 ?auto_331797 ) ) ( not ( = ?auto_331795 ?auto_331796 ) ) ( not ( = ?auto_331795 ?auto_331797 ) ) ( not ( = ?auto_331796 ?auto_331797 ) ) ( ON ?auto_331795 ?auto_331796 ) ( ON ?auto_331794 ?auto_331795 ) ( ON ?auto_331793 ?auto_331794 ) ( ON ?auto_331792 ?auto_331793 ) ( ON ?auto_331791 ?auto_331792 ) ( ON ?auto_331790 ?auto_331791 ) ( CLEAR ?auto_331788 ) ( ON ?auto_331789 ?auto_331790 ) ( CLEAR ?auto_331789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_331788 ?auto_331789 )
      ( MAKE-9PILE ?auto_331788 ?auto_331789 ?auto_331790 ?auto_331791 ?auto_331792 ?auto_331793 ?auto_331794 ?auto_331795 ?auto_331796 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331807 - BLOCK
      ?auto_331808 - BLOCK
      ?auto_331809 - BLOCK
      ?auto_331810 - BLOCK
      ?auto_331811 - BLOCK
      ?auto_331812 - BLOCK
      ?auto_331813 - BLOCK
      ?auto_331814 - BLOCK
      ?auto_331815 - BLOCK
    )
    :vars
    (
      ?auto_331816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331815 ?auto_331816 ) ( ON-TABLE ?auto_331807 ) ( not ( = ?auto_331807 ?auto_331808 ) ) ( not ( = ?auto_331807 ?auto_331809 ) ) ( not ( = ?auto_331807 ?auto_331810 ) ) ( not ( = ?auto_331807 ?auto_331811 ) ) ( not ( = ?auto_331807 ?auto_331812 ) ) ( not ( = ?auto_331807 ?auto_331813 ) ) ( not ( = ?auto_331807 ?auto_331814 ) ) ( not ( = ?auto_331807 ?auto_331815 ) ) ( not ( = ?auto_331807 ?auto_331816 ) ) ( not ( = ?auto_331808 ?auto_331809 ) ) ( not ( = ?auto_331808 ?auto_331810 ) ) ( not ( = ?auto_331808 ?auto_331811 ) ) ( not ( = ?auto_331808 ?auto_331812 ) ) ( not ( = ?auto_331808 ?auto_331813 ) ) ( not ( = ?auto_331808 ?auto_331814 ) ) ( not ( = ?auto_331808 ?auto_331815 ) ) ( not ( = ?auto_331808 ?auto_331816 ) ) ( not ( = ?auto_331809 ?auto_331810 ) ) ( not ( = ?auto_331809 ?auto_331811 ) ) ( not ( = ?auto_331809 ?auto_331812 ) ) ( not ( = ?auto_331809 ?auto_331813 ) ) ( not ( = ?auto_331809 ?auto_331814 ) ) ( not ( = ?auto_331809 ?auto_331815 ) ) ( not ( = ?auto_331809 ?auto_331816 ) ) ( not ( = ?auto_331810 ?auto_331811 ) ) ( not ( = ?auto_331810 ?auto_331812 ) ) ( not ( = ?auto_331810 ?auto_331813 ) ) ( not ( = ?auto_331810 ?auto_331814 ) ) ( not ( = ?auto_331810 ?auto_331815 ) ) ( not ( = ?auto_331810 ?auto_331816 ) ) ( not ( = ?auto_331811 ?auto_331812 ) ) ( not ( = ?auto_331811 ?auto_331813 ) ) ( not ( = ?auto_331811 ?auto_331814 ) ) ( not ( = ?auto_331811 ?auto_331815 ) ) ( not ( = ?auto_331811 ?auto_331816 ) ) ( not ( = ?auto_331812 ?auto_331813 ) ) ( not ( = ?auto_331812 ?auto_331814 ) ) ( not ( = ?auto_331812 ?auto_331815 ) ) ( not ( = ?auto_331812 ?auto_331816 ) ) ( not ( = ?auto_331813 ?auto_331814 ) ) ( not ( = ?auto_331813 ?auto_331815 ) ) ( not ( = ?auto_331813 ?auto_331816 ) ) ( not ( = ?auto_331814 ?auto_331815 ) ) ( not ( = ?auto_331814 ?auto_331816 ) ) ( not ( = ?auto_331815 ?auto_331816 ) ) ( ON ?auto_331814 ?auto_331815 ) ( ON ?auto_331813 ?auto_331814 ) ( ON ?auto_331812 ?auto_331813 ) ( ON ?auto_331811 ?auto_331812 ) ( ON ?auto_331810 ?auto_331811 ) ( ON ?auto_331809 ?auto_331810 ) ( CLEAR ?auto_331807 ) ( ON ?auto_331808 ?auto_331809 ) ( CLEAR ?auto_331808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_331807 ?auto_331808 )
      ( MAKE-9PILE ?auto_331807 ?auto_331808 ?auto_331809 ?auto_331810 ?auto_331811 ?auto_331812 ?auto_331813 ?auto_331814 ?auto_331815 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331826 - BLOCK
      ?auto_331827 - BLOCK
      ?auto_331828 - BLOCK
      ?auto_331829 - BLOCK
      ?auto_331830 - BLOCK
      ?auto_331831 - BLOCK
      ?auto_331832 - BLOCK
      ?auto_331833 - BLOCK
      ?auto_331834 - BLOCK
    )
    :vars
    (
      ?auto_331835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331834 ?auto_331835 ) ( not ( = ?auto_331826 ?auto_331827 ) ) ( not ( = ?auto_331826 ?auto_331828 ) ) ( not ( = ?auto_331826 ?auto_331829 ) ) ( not ( = ?auto_331826 ?auto_331830 ) ) ( not ( = ?auto_331826 ?auto_331831 ) ) ( not ( = ?auto_331826 ?auto_331832 ) ) ( not ( = ?auto_331826 ?auto_331833 ) ) ( not ( = ?auto_331826 ?auto_331834 ) ) ( not ( = ?auto_331826 ?auto_331835 ) ) ( not ( = ?auto_331827 ?auto_331828 ) ) ( not ( = ?auto_331827 ?auto_331829 ) ) ( not ( = ?auto_331827 ?auto_331830 ) ) ( not ( = ?auto_331827 ?auto_331831 ) ) ( not ( = ?auto_331827 ?auto_331832 ) ) ( not ( = ?auto_331827 ?auto_331833 ) ) ( not ( = ?auto_331827 ?auto_331834 ) ) ( not ( = ?auto_331827 ?auto_331835 ) ) ( not ( = ?auto_331828 ?auto_331829 ) ) ( not ( = ?auto_331828 ?auto_331830 ) ) ( not ( = ?auto_331828 ?auto_331831 ) ) ( not ( = ?auto_331828 ?auto_331832 ) ) ( not ( = ?auto_331828 ?auto_331833 ) ) ( not ( = ?auto_331828 ?auto_331834 ) ) ( not ( = ?auto_331828 ?auto_331835 ) ) ( not ( = ?auto_331829 ?auto_331830 ) ) ( not ( = ?auto_331829 ?auto_331831 ) ) ( not ( = ?auto_331829 ?auto_331832 ) ) ( not ( = ?auto_331829 ?auto_331833 ) ) ( not ( = ?auto_331829 ?auto_331834 ) ) ( not ( = ?auto_331829 ?auto_331835 ) ) ( not ( = ?auto_331830 ?auto_331831 ) ) ( not ( = ?auto_331830 ?auto_331832 ) ) ( not ( = ?auto_331830 ?auto_331833 ) ) ( not ( = ?auto_331830 ?auto_331834 ) ) ( not ( = ?auto_331830 ?auto_331835 ) ) ( not ( = ?auto_331831 ?auto_331832 ) ) ( not ( = ?auto_331831 ?auto_331833 ) ) ( not ( = ?auto_331831 ?auto_331834 ) ) ( not ( = ?auto_331831 ?auto_331835 ) ) ( not ( = ?auto_331832 ?auto_331833 ) ) ( not ( = ?auto_331832 ?auto_331834 ) ) ( not ( = ?auto_331832 ?auto_331835 ) ) ( not ( = ?auto_331833 ?auto_331834 ) ) ( not ( = ?auto_331833 ?auto_331835 ) ) ( not ( = ?auto_331834 ?auto_331835 ) ) ( ON ?auto_331833 ?auto_331834 ) ( ON ?auto_331832 ?auto_331833 ) ( ON ?auto_331831 ?auto_331832 ) ( ON ?auto_331830 ?auto_331831 ) ( ON ?auto_331829 ?auto_331830 ) ( ON ?auto_331828 ?auto_331829 ) ( ON ?auto_331827 ?auto_331828 ) ( ON ?auto_331826 ?auto_331827 ) ( CLEAR ?auto_331826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_331826 )
      ( MAKE-9PILE ?auto_331826 ?auto_331827 ?auto_331828 ?auto_331829 ?auto_331830 ?auto_331831 ?auto_331832 ?auto_331833 ?auto_331834 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_331845 - BLOCK
      ?auto_331846 - BLOCK
      ?auto_331847 - BLOCK
      ?auto_331848 - BLOCK
      ?auto_331849 - BLOCK
      ?auto_331850 - BLOCK
      ?auto_331851 - BLOCK
      ?auto_331852 - BLOCK
      ?auto_331853 - BLOCK
    )
    :vars
    (
      ?auto_331854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331853 ?auto_331854 ) ( not ( = ?auto_331845 ?auto_331846 ) ) ( not ( = ?auto_331845 ?auto_331847 ) ) ( not ( = ?auto_331845 ?auto_331848 ) ) ( not ( = ?auto_331845 ?auto_331849 ) ) ( not ( = ?auto_331845 ?auto_331850 ) ) ( not ( = ?auto_331845 ?auto_331851 ) ) ( not ( = ?auto_331845 ?auto_331852 ) ) ( not ( = ?auto_331845 ?auto_331853 ) ) ( not ( = ?auto_331845 ?auto_331854 ) ) ( not ( = ?auto_331846 ?auto_331847 ) ) ( not ( = ?auto_331846 ?auto_331848 ) ) ( not ( = ?auto_331846 ?auto_331849 ) ) ( not ( = ?auto_331846 ?auto_331850 ) ) ( not ( = ?auto_331846 ?auto_331851 ) ) ( not ( = ?auto_331846 ?auto_331852 ) ) ( not ( = ?auto_331846 ?auto_331853 ) ) ( not ( = ?auto_331846 ?auto_331854 ) ) ( not ( = ?auto_331847 ?auto_331848 ) ) ( not ( = ?auto_331847 ?auto_331849 ) ) ( not ( = ?auto_331847 ?auto_331850 ) ) ( not ( = ?auto_331847 ?auto_331851 ) ) ( not ( = ?auto_331847 ?auto_331852 ) ) ( not ( = ?auto_331847 ?auto_331853 ) ) ( not ( = ?auto_331847 ?auto_331854 ) ) ( not ( = ?auto_331848 ?auto_331849 ) ) ( not ( = ?auto_331848 ?auto_331850 ) ) ( not ( = ?auto_331848 ?auto_331851 ) ) ( not ( = ?auto_331848 ?auto_331852 ) ) ( not ( = ?auto_331848 ?auto_331853 ) ) ( not ( = ?auto_331848 ?auto_331854 ) ) ( not ( = ?auto_331849 ?auto_331850 ) ) ( not ( = ?auto_331849 ?auto_331851 ) ) ( not ( = ?auto_331849 ?auto_331852 ) ) ( not ( = ?auto_331849 ?auto_331853 ) ) ( not ( = ?auto_331849 ?auto_331854 ) ) ( not ( = ?auto_331850 ?auto_331851 ) ) ( not ( = ?auto_331850 ?auto_331852 ) ) ( not ( = ?auto_331850 ?auto_331853 ) ) ( not ( = ?auto_331850 ?auto_331854 ) ) ( not ( = ?auto_331851 ?auto_331852 ) ) ( not ( = ?auto_331851 ?auto_331853 ) ) ( not ( = ?auto_331851 ?auto_331854 ) ) ( not ( = ?auto_331852 ?auto_331853 ) ) ( not ( = ?auto_331852 ?auto_331854 ) ) ( not ( = ?auto_331853 ?auto_331854 ) ) ( ON ?auto_331852 ?auto_331853 ) ( ON ?auto_331851 ?auto_331852 ) ( ON ?auto_331850 ?auto_331851 ) ( ON ?auto_331849 ?auto_331850 ) ( ON ?auto_331848 ?auto_331849 ) ( ON ?auto_331847 ?auto_331848 ) ( ON ?auto_331846 ?auto_331847 ) ( ON ?auto_331845 ?auto_331846 ) ( CLEAR ?auto_331845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_331845 )
      ( MAKE-9PILE ?auto_331845 ?auto_331846 ?auto_331847 ?auto_331848 ?auto_331849 ?auto_331850 ?auto_331851 ?auto_331852 ?auto_331853 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_331865 - BLOCK
      ?auto_331866 - BLOCK
      ?auto_331867 - BLOCK
      ?auto_331868 - BLOCK
      ?auto_331869 - BLOCK
      ?auto_331870 - BLOCK
      ?auto_331871 - BLOCK
      ?auto_331872 - BLOCK
      ?auto_331873 - BLOCK
      ?auto_331874 - BLOCK
    )
    :vars
    (
      ?auto_331875 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_331873 ) ( ON ?auto_331874 ?auto_331875 ) ( CLEAR ?auto_331874 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_331865 ) ( ON ?auto_331866 ?auto_331865 ) ( ON ?auto_331867 ?auto_331866 ) ( ON ?auto_331868 ?auto_331867 ) ( ON ?auto_331869 ?auto_331868 ) ( ON ?auto_331870 ?auto_331869 ) ( ON ?auto_331871 ?auto_331870 ) ( ON ?auto_331872 ?auto_331871 ) ( ON ?auto_331873 ?auto_331872 ) ( not ( = ?auto_331865 ?auto_331866 ) ) ( not ( = ?auto_331865 ?auto_331867 ) ) ( not ( = ?auto_331865 ?auto_331868 ) ) ( not ( = ?auto_331865 ?auto_331869 ) ) ( not ( = ?auto_331865 ?auto_331870 ) ) ( not ( = ?auto_331865 ?auto_331871 ) ) ( not ( = ?auto_331865 ?auto_331872 ) ) ( not ( = ?auto_331865 ?auto_331873 ) ) ( not ( = ?auto_331865 ?auto_331874 ) ) ( not ( = ?auto_331865 ?auto_331875 ) ) ( not ( = ?auto_331866 ?auto_331867 ) ) ( not ( = ?auto_331866 ?auto_331868 ) ) ( not ( = ?auto_331866 ?auto_331869 ) ) ( not ( = ?auto_331866 ?auto_331870 ) ) ( not ( = ?auto_331866 ?auto_331871 ) ) ( not ( = ?auto_331866 ?auto_331872 ) ) ( not ( = ?auto_331866 ?auto_331873 ) ) ( not ( = ?auto_331866 ?auto_331874 ) ) ( not ( = ?auto_331866 ?auto_331875 ) ) ( not ( = ?auto_331867 ?auto_331868 ) ) ( not ( = ?auto_331867 ?auto_331869 ) ) ( not ( = ?auto_331867 ?auto_331870 ) ) ( not ( = ?auto_331867 ?auto_331871 ) ) ( not ( = ?auto_331867 ?auto_331872 ) ) ( not ( = ?auto_331867 ?auto_331873 ) ) ( not ( = ?auto_331867 ?auto_331874 ) ) ( not ( = ?auto_331867 ?auto_331875 ) ) ( not ( = ?auto_331868 ?auto_331869 ) ) ( not ( = ?auto_331868 ?auto_331870 ) ) ( not ( = ?auto_331868 ?auto_331871 ) ) ( not ( = ?auto_331868 ?auto_331872 ) ) ( not ( = ?auto_331868 ?auto_331873 ) ) ( not ( = ?auto_331868 ?auto_331874 ) ) ( not ( = ?auto_331868 ?auto_331875 ) ) ( not ( = ?auto_331869 ?auto_331870 ) ) ( not ( = ?auto_331869 ?auto_331871 ) ) ( not ( = ?auto_331869 ?auto_331872 ) ) ( not ( = ?auto_331869 ?auto_331873 ) ) ( not ( = ?auto_331869 ?auto_331874 ) ) ( not ( = ?auto_331869 ?auto_331875 ) ) ( not ( = ?auto_331870 ?auto_331871 ) ) ( not ( = ?auto_331870 ?auto_331872 ) ) ( not ( = ?auto_331870 ?auto_331873 ) ) ( not ( = ?auto_331870 ?auto_331874 ) ) ( not ( = ?auto_331870 ?auto_331875 ) ) ( not ( = ?auto_331871 ?auto_331872 ) ) ( not ( = ?auto_331871 ?auto_331873 ) ) ( not ( = ?auto_331871 ?auto_331874 ) ) ( not ( = ?auto_331871 ?auto_331875 ) ) ( not ( = ?auto_331872 ?auto_331873 ) ) ( not ( = ?auto_331872 ?auto_331874 ) ) ( not ( = ?auto_331872 ?auto_331875 ) ) ( not ( = ?auto_331873 ?auto_331874 ) ) ( not ( = ?auto_331873 ?auto_331875 ) ) ( not ( = ?auto_331874 ?auto_331875 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_331874 ?auto_331875 )
      ( !STACK ?auto_331874 ?auto_331873 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_331886 - BLOCK
      ?auto_331887 - BLOCK
      ?auto_331888 - BLOCK
      ?auto_331889 - BLOCK
      ?auto_331890 - BLOCK
      ?auto_331891 - BLOCK
      ?auto_331892 - BLOCK
      ?auto_331893 - BLOCK
      ?auto_331894 - BLOCK
      ?auto_331895 - BLOCK
    )
    :vars
    (
      ?auto_331896 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_331894 ) ( ON ?auto_331895 ?auto_331896 ) ( CLEAR ?auto_331895 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_331886 ) ( ON ?auto_331887 ?auto_331886 ) ( ON ?auto_331888 ?auto_331887 ) ( ON ?auto_331889 ?auto_331888 ) ( ON ?auto_331890 ?auto_331889 ) ( ON ?auto_331891 ?auto_331890 ) ( ON ?auto_331892 ?auto_331891 ) ( ON ?auto_331893 ?auto_331892 ) ( ON ?auto_331894 ?auto_331893 ) ( not ( = ?auto_331886 ?auto_331887 ) ) ( not ( = ?auto_331886 ?auto_331888 ) ) ( not ( = ?auto_331886 ?auto_331889 ) ) ( not ( = ?auto_331886 ?auto_331890 ) ) ( not ( = ?auto_331886 ?auto_331891 ) ) ( not ( = ?auto_331886 ?auto_331892 ) ) ( not ( = ?auto_331886 ?auto_331893 ) ) ( not ( = ?auto_331886 ?auto_331894 ) ) ( not ( = ?auto_331886 ?auto_331895 ) ) ( not ( = ?auto_331886 ?auto_331896 ) ) ( not ( = ?auto_331887 ?auto_331888 ) ) ( not ( = ?auto_331887 ?auto_331889 ) ) ( not ( = ?auto_331887 ?auto_331890 ) ) ( not ( = ?auto_331887 ?auto_331891 ) ) ( not ( = ?auto_331887 ?auto_331892 ) ) ( not ( = ?auto_331887 ?auto_331893 ) ) ( not ( = ?auto_331887 ?auto_331894 ) ) ( not ( = ?auto_331887 ?auto_331895 ) ) ( not ( = ?auto_331887 ?auto_331896 ) ) ( not ( = ?auto_331888 ?auto_331889 ) ) ( not ( = ?auto_331888 ?auto_331890 ) ) ( not ( = ?auto_331888 ?auto_331891 ) ) ( not ( = ?auto_331888 ?auto_331892 ) ) ( not ( = ?auto_331888 ?auto_331893 ) ) ( not ( = ?auto_331888 ?auto_331894 ) ) ( not ( = ?auto_331888 ?auto_331895 ) ) ( not ( = ?auto_331888 ?auto_331896 ) ) ( not ( = ?auto_331889 ?auto_331890 ) ) ( not ( = ?auto_331889 ?auto_331891 ) ) ( not ( = ?auto_331889 ?auto_331892 ) ) ( not ( = ?auto_331889 ?auto_331893 ) ) ( not ( = ?auto_331889 ?auto_331894 ) ) ( not ( = ?auto_331889 ?auto_331895 ) ) ( not ( = ?auto_331889 ?auto_331896 ) ) ( not ( = ?auto_331890 ?auto_331891 ) ) ( not ( = ?auto_331890 ?auto_331892 ) ) ( not ( = ?auto_331890 ?auto_331893 ) ) ( not ( = ?auto_331890 ?auto_331894 ) ) ( not ( = ?auto_331890 ?auto_331895 ) ) ( not ( = ?auto_331890 ?auto_331896 ) ) ( not ( = ?auto_331891 ?auto_331892 ) ) ( not ( = ?auto_331891 ?auto_331893 ) ) ( not ( = ?auto_331891 ?auto_331894 ) ) ( not ( = ?auto_331891 ?auto_331895 ) ) ( not ( = ?auto_331891 ?auto_331896 ) ) ( not ( = ?auto_331892 ?auto_331893 ) ) ( not ( = ?auto_331892 ?auto_331894 ) ) ( not ( = ?auto_331892 ?auto_331895 ) ) ( not ( = ?auto_331892 ?auto_331896 ) ) ( not ( = ?auto_331893 ?auto_331894 ) ) ( not ( = ?auto_331893 ?auto_331895 ) ) ( not ( = ?auto_331893 ?auto_331896 ) ) ( not ( = ?auto_331894 ?auto_331895 ) ) ( not ( = ?auto_331894 ?auto_331896 ) ) ( not ( = ?auto_331895 ?auto_331896 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_331895 ?auto_331896 )
      ( !STACK ?auto_331895 ?auto_331894 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_331907 - BLOCK
      ?auto_331908 - BLOCK
      ?auto_331909 - BLOCK
      ?auto_331910 - BLOCK
      ?auto_331911 - BLOCK
      ?auto_331912 - BLOCK
      ?auto_331913 - BLOCK
      ?auto_331914 - BLOCK
      ?auto_331915 - BLOCK
      ?auto_331916 - BLOCK
    )
    :vars
    (
      ?auto_331917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331916 ?auto_331917 ) ( ON-TABLE ?auto_331907 ) ( ON ?auto_331908 ?auto_331907 ) ( ON ?auto_331909 ?auto_331908 ) ( ON ?auto_331910 ?auto_331909 ) ( ON ?auto_331911 ?auto_331910 ) ( ON ?auto_331912 ?auto_331911 ) ( ON ?auto_331913 ?auto_331912 ) ( ON ?auto_331914 ?auto_331913 ) ( not ( = ?auto_331907 ?auto_331908 ) ) ( not ( = ?auto_331907 ?auto_331909 ) ) ( not ( = ?auto_331907 ?auto_331910 ) ) ( not ( = ?auto_331907 ?auto_331911 ) ) ( not ( = ?auto_331907 ?auto_331912 ) ) ( not ( = ?auto_331907 ?auto_331913 ) ) ( not ( = ?auto_331907 ?auto_331914 ) ) ( not ( = ?auto_331907 ?auto_331915 ) ) ( not ( = ?auto_331907 ?auto_331916 ) ) ( not ( = ?auto_331907 ?auto_331917 ) ) ( not ( = ?auto_331908 ?auto_331909 ) ) ( not ( = ?auto_331908 ?auto_331910 ) ) ( not ( = ?auto_331908 ?auto_331911 ) ) ( not ( = ?auto_331908 ?auto_331912 ) ) ( not ( = ?auto_331908 ?auto_331913 ) ) ( not ( = ?auto_331908 ?auto_331914 ) ) ( not ( = ?auto_331908 ?auto_331915 ) ) ( not ( = ?auto_331908 ?auto_331916 ) ) ( not ( = ?auto_331908 ?auto_331917 ) ) ( not ( = ?auto_331909 ?auto_331910 ) ) ( not ( = ?auto_331909 ?auto_331911 ) ) ( not ( = ?auto_331909 ?auto_331912 ) ) ( not ( = ?auto_331909 ?auto_331913 ) ) ( not ( = ?auto_331909 ?auto_331914 ) ) ( not ( = ?auto_331909 ?auto_331915 ) ) ( not ( = ?auto_331909 ?auto_331916 ) ) ( not ( = ?auto_331909 ?auto_331917 ) ) ( not ( = ?auto_331910 ?auto_331911 ) ) ( not ( = ?auto_331910 ?auto_331912 ) ) ( not ( = ?auto_331910 ?auto_331913 ) ) ( not ( = ?auto_331910 ?auto_331914 ) ) ( not ( = ?auto_331910 ?auto_331915 ) ) ( not ( = ?auto_331910 ?auto_331916 ) ) ( not ( = ?auto_331910 ?auto_331917 ) ) ( not ( = ?auto_331911 ?auto_331912 ) ) ( not ( = ?auto_331911 ?auto_331913 ) ) ( not ( = ?auto_331911 ?auto_331914 ) ) ( not ( = ?auto_331911 ?auto_331915 ) ) ( not ( = ?auto_331911 ?auto_331916 ) ) ( not ( = ?auto_331911 ?auto_331917 ) ) ( not ( = ?auto_331912 ?auto_331913 ) ) ( not ( = ?auto_331912 ?auto_331914 ) ) ( not ( = ?auto_331912 ?auto_331915 ) ) ( not ( = ?auto_331912 ?auto_331916 ) ) ( not ( = ?auto_331912 ?auto_331917 ) ) ( not ( = ?auto_331913 ?auto_331914 ) ) ( not ( = ?auto_331913 ?auto_331915 ) ) ( not ( = ?auto_331913 ?auto_331916 ) ) ( not ( = ?auto_331913 ?auto_331917 ) ) ( not ( = ?auto_331914 ?auto_331915 ) ) ( not ( = ?auto_331914 ?auto_331916 ) ) ( not ( = ?auto_331914 ?auto_331917 ) ) ( not ( = ?auto_331915 ?auto_331916 ) ) ( not ( = ?auto_331915 ?auto_331917 ) ) ( not ( = ?auto_331916 ?auto_331917 ) ) ( CLEAR ?auto_331914 ) ( ON ?auto_331915 ?auto_331916 ) ( CLEAR ?auto_331915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_331907 ?auto_331908 ?auto_331909 ?auto_331910 ?auto_331911 ?auto_331912 ?auto_331913 ?auto_331914 ?auto_331915 )
      ( MAKE-10PILE ?auto_331907 ?auto_331908 ?auto_331909 ?auto_331910 ?auto_331911 ?auto_331912 ?auto_331913 ?auto_331914 ?auto_331915 ?auto_331916 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_331928 - BLOCK
      ?auto_331929 - BLOCK
      ?auto_331930 - BLOCK
      ?auto_331931 - BLOCK
      ?auto_331932 - BLOCK
      ?auto_331933 - BLOCK
      ?auto_331934 - BLOCK
      ?auto_331935 - BLOCK
      ?auto_331936 - BLOCK
      ?auto_331937 - BLOCK
    )
    :vars
    (
      ?auto_331938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331937 ?auto_331938 ) ( ON-TABLE ?auto_331928 ) ( ON ?auto_331929 ?auto_331928 ) ( ON ?auto_331930 ?auto_331929 ) ( ON ?auto_331931 ?auto_331930 ) ( ON ?auto_331932 ?auto_331931 ) ( ON ?auto_331933 ?auto_331932 ) ( ON ?auto_331934 ?auto_331933 ) ( ON ?auto_331935 ?auto_331934 ) ( not ( = ?auto_331928 ?auto_331929 ) ) ( not ( = ?auto_331928 ?auto_331930 ) ) ( not ( = ?auto_331928 ?auto_331931 ) ) ( not ( = ?auto_331928 ?auto_331932 ) ) ( not ( = ?auto_331928 ?auto_331933 ) ) ( not ( = ?auto_331928 ?auto_331934 ) ) ( not ( = ?auto_331928 ?auto_331935 ) ) ( not ( = ?auto_331928 ?auto_331936 ) ) ( not ( = ?auto_331928 ?auto_331937 ) ) ( not ( = ?auto_331928 ?auto_331938 ) ) ( not ( = ?auto_331929 ?auto_331930 ) ) ( not ( = ?auto_331929 ?auto_331931 ) ) ( not ( = ?auto_331929 ?auto_331932 ) ) ( not ( = ?auto_331929 ?auto_331933 ) ) ( not ( = ?auto_331929 ?auto_331934 ) ) ( not ( = ?auto_331929 ?auto_331935 ) ) ( not ( = ?auto_331929 ?auto_331936 ) ) ( not ( = ?auto_331929 ?auto_331937 ) ) ( not ( = ?auto_331929 ?auto_331938 ) ) ( not ( = ?auto_331930 ?auto_331931 ) ) ( not ( = ?auto_331930 ?auto_331932 ) ) ( not ( = ?auto_331930 ?auto_331933 ) ) ( not ( = ?auto_331930 ?auto_331934 ) ) ( not ( = ?auto_331930 ?auto_331935 ) ) ( not ( = ?auto_331930 ?auto_331936 ) ) ( not ( = ?auto_331930 ?auto_331937 ) ) ( not ( = ?auto_331930 ?auto_331938 ) ) ( not ( = ?auto_331931 ?auto_331932 ) ) ( not ( = ?auto_331931 ?auto_331933 ) ) ( not ( = ?auto_331931 ?auto_331934 ) ) ( not ( = ?auto_331931 ?auto_331935 ) ) ( not ( = ?auto_331931 ?auto_331936 ) ) ( not ( = ?auto_331931 ?auto_331937 ) ) ( not ( = ?auto_331931 ?auto_331938 ) ) ( not ( = ?auto_331932 ?auto_331933 ) ) ( not ( = ?auto_331932 ?auto_331934 ) ) ( not ( = ?auto_331932 ?auto_331935 ) ) ( not ( = ?auto_331932 ?auto_331936 ) ) ( not ( = ?auto_331932 ?auto_331937 ) ) ( not ( = ?auto_331932 ?auto_331938 ) ) ( not ( = ?auto_331933 ?auto_331934 ) ) ( not ( = ?auto_331933 ?auto_331935 ) ) ( not ( = ?auto_331933 ?auto_331936 ) ) ( not ( = ?auto_331933 ?auto_331937 ) ) ( not ( = ?auto_331933 ?auto_331938 ) ) ( not ( = ?auto_331934 ?auto_331935 ) ) ( not ( = ?auto_331934 ?auto_331936 ) ) ( not ( = ?auto_331934 ?auto_331937 ) ) ( not ( = ?auto_331934 ?auto_331938 ) ) ( not ( = ?auto_331935 ?auto_331936 ) ) ( not ( = ?auto_331935 ?auto_331937 ) ) ( not ( = ?auto_331935 ?auto_331938 ) ) ( not ( = ?auto_331936 ?auto_331937 ) ) ( not ( = ?auto_331936 ?auto_331938 ) ) ( not ( = ?auto_331937 ?auto_331938 ) ) ( CLEAR ?auto_331935 ) ( ON ?auto_331936 ?auto_331937 ) ( CLEAR ?auto_331936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_331928 ?auto_331929 ?auto_331930 ?auto_331931 ?auto_331932 ?auto_331933 ?auto_331934 ?auto_331935 ?auto_331936 )
      ( MAKE-10PILE ?auto_331928 ?auto_331929 ?auto_331930 ?auto_331931 ?auto_331932 ?auto_331933 ?auto_331934 ?auto_331935 ?auto_331936 ?auto_331937 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_331949 - BLOCK
      ?auto_331950 - BLOCK
      ?auto_331951 - BLOCK
      ?auto_331952 - BLOCK
      ?auto_331953 - BLOCK
      ?auto_331954 - BLOCK
      ?auto_331955 - BLOCK
      ?auto_331956 - BLOCK
      ?auto_331957 - BLOCK
      ?auto_331958 - BLOCK
    )
    :vars
    (
      ?auto_331959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331958 ?auto_331959 ) ( ON-TABLE ?auto_331949 ) ( ON ?auto_331950 ?auto_331949 ) ( ON ?auto_331951 ?auto_331950 ) ( ON ?auto_331952 ?auto_331951 ) ( ON ?auto_331953 ?auto_331952 ) ( ON ?auto_331954 ?auto_331953 ) ( ON ?auto_331955 ?auto_331954 ) ( not ( = ?auto_331949 ?auto_331950 ) ) ( not ( = ?auto_331949 ?auto_331951 ) ) ( not ( = ?auto_331949 ?auto_331952 ) ) ( not ( = ?auto_331949 ?auto_331953 ) ) ( not ( = ?auto_331949 ?auto_331954 ) ) ( not ( = ?auto_331949 ?auto_331955 ) ) ( not ( = ?auto_331949 ?auto_331956 ) ) ( not ( = ?auto_331949 ?auto_331957 ) ) ( not ( = ?auto_331949 ?auto_331958 ) ) ( not ( = ?auto_331949 ?auto_331959 ) ) ( not ( = ?auto_331950 ?auto_331951 ) ) ( not ( = ?auto_331950 ?auto_331952 ) ) ( not ( = ?auto_331950 ?auto_331953 ) ) ( not ( = ?auto_331950 ?auto_331954 ) ) ( not ( = ?auto_331950 ?auto_331955 ) ) ( not ( = ?auto_331950 ?auto_331956 ) ) ( not ( = ?auto_331950 ?auto_331957 ) ) ( not ( = ?auto_331950 ?auto_331958 ) ) ( not ( = ?auto_331950 ?auto_331959 ) ) ( not ( = ?auto_331951 ?auto_331952 ) ) ( not ( = ?auto_331951 ?auto_331953 ) ) ( not ( = ?auto_331951 ?auto_331954 ) ) ( not ( = ?auto_331951 ?auto_331955 ) ) ( not ( = ?auto_331951 ?auto_331956 ) ) ( not ( = ?auto_331951 ?auto_331957 ) ) ( not ( = ?auto_331951 ?auto_331958 ) ) ( not ( = ?auto_331951 ?auto_331959 ) ) ( not ( = ?auto_331952 ?auto_331953 ) ) ( not ( = ?auto_331952 ?auto_331954 ) ) ( not ( = ?auto_331952 ?auto_331955 ) ) ( not ( = ?auto_331952 ?auto_331956 ) ) ( not ( = ?auto_331952 ?auto_331957 ) ) ( not ( = ?auto_331952 ?auto_331958 ) ) ( not ( = ?auto_331952 ?auto_331959 ) ) ( not ( = ?auto_331953 ?auto_331954 ) ) ( not ( = ?auto_331953 ?auto_331955 ) ) ( not ( = ?auto_331953 ?auto_331956 ) ) ( not ( = ?auto_331953 ?auto_331957 ) ) ( not ( = ?auto_331953 ?auto_331958 ) ) ( not ( = ?auto_331953 ?auto_331959 ) ) ( not ( = ?auto_331954 ?auto_331955 ) ) ( not ( = ?auto_331954 ?auto_331956 ) ) ( not ( = ?auto_331954 ?auto_331957 ) ) ( not ( = ?auto_331954 ?auto_331958 ) ) ( not ( = ?auto_331954 ?auto_331959 ) ) ( not ( = ?auto_331955 ?auto_331956 ) ) ( not ( = ?auto_331955 ?auto_331957 ) ) ( not ( = ?auto_331955 ?auto_331958 ) ) ( not ( = ?auto_331955 ?auto_331959 ) ) ( not ( = ?auto_331956 ?auto_331957 ) ) ( not ( = ?auto_331956 ?auto_331958 ) ) ( not ( = ?auto_331956 ?auto_331959 ) ) ( not ( = ?auto_331957 ?auto_331958 ) ) ( not ( = ?auto_331957 ?auto_331959 ) ) ( not ( = ?auto_331958 ?auto_331959 ) ) ( ON ?auto_331957 ?auto_331958 ) ( CLEAR ?auto_331955 ) ( ON ?auto_331956 ?auto_331957 ) ( CLEAR ?auto_331956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_331949 ?auto_331950 ?auto_331951 ?auto_331952 ?auto_331953 ?auto_331954 ?auto_331955 ?auto_331956 )
      ( MAKE-10PILE ?auto_331949 ?auto_331950 ?auto_331951 ?auto_331952 ?auto_331953 ?auto_331954 ?auto_331955 ?auto_331956 ?auto_331957 ?auto_331958 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_331970 - BLOCK
      ?auto_331971 - BLOCK
      ?auto_331972 - BLOCK
      ?auto_331973 - BLOCK
      ?auto_331974 - BLOCK
      ?auto_331975 - BLOCK
      ?auto_331976 - BLOCK
      ?auto_331977 - BLOCK
      ?auto_331978 - BLOCK
      ?auto_331979 - BLOCK
    )
    :vars
    (
      ?auto_331980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331979 ?auto_331980 ) ( ON-TABLE ?auto_331970 ) ( ON ?auto_331971 ?auto_331970 ) ( ON ?auto_331972 ?auto_331971 ) ( ON ?auto_331973 ?auto_331972 ) ( ON ?auto_331974 ?auto_331973 ) ( ON ?auto_331975 ?auto_331974 ) ( ON ?auto_331976 ?auto_331975 ) ( not ( = ?auto_331970 ?auto_331971 ) ) ( not ( = ?auto_331970 ?auto_331972 ) ) ( not ( = ?auto_331970 ?auto_331973 ) ) ( not ( = ?auto_331970 ?auto_331974 ) ) ( not ( = ?auto_331970 ?auto_331975 ) ) ( not ( = ?auto_331970 ?auto_331976 ) ) ( not ( = ?auto_331970 ?auto_331977 ) ) ( not ( = ?auto_331970 ?auto_331978 ) ) ( not ( = ?auto_331970 ?auto_331979 ) ) ( not ( = ?auto_331970 ?auto_331980 ) ) ( not ( = ?auto_331971 ?auto_331972 ) ) ( not ( = ?auto_331971 ?auto_331973 ) ) ( not ( = ?auto_331971 ?auto_331974 ) ) ( not ( = ?auto_331971 ?auto_331975 ) ) ( not ( = ?auto_331971 ?auto_331976 ) ) ( not ( = ?auto_331971 ?auto_331977 ) ) ( not ( = ?auto_331971 ?auto_331978 ) ) ( not ( = ?auto_331971 ?auto_331979 ) ) ( not ( = ?auto_331971 ?auto_331980 ) ) ( not ( = ?auto_331972 ?auto_331973 ) ) ( not ( = ?auto_331972 ?auto_331974 ) ) ( not ( = ?auto_331972 ?auto_331975 ) ) ( not ( = ?auto_331972 ?auto_331976 ) ) ( not ( = ?auto_331972 ?auto_331977 ) ) ( not ( = ?auto_331972 ?auto_331978 ) ) ( not ( = ?auto_331972 ?auto_331979 ) ) ( not ( = ?auto_331972 ?auto_331980 ) ) ( not ( = ?auto_331973 ?auto_331974 ) ) ( not ( = ?auto_331973 ?auto_331975 ) ) ( not ( = ?auto_331973 ?auto_331976 ) ) ( not ( = ?auto_331973 ?auto_331977 ) ) ( not ( = ?auto_331973 ?auto_331978 ) ) ( not ( = ?auto_331973 ?auto_331979 ) ) ( not ( = ?auto_331973 ?auto_331980 ) ) ( not ( = ?auto_331974 ?auto_331975 ) ) ( not ( = ?auto_331974 ?auto_331976 ) ) ( not ( = ?auto_331974 ?auto_331977 ) ) ( not ( = ?auto_331974 ?auto_331978 ) ) ( not ( = ?auto_331974 ?auto_331979 ) ) ( not ( = ?auto_331974 ?auto_331980 ) ) ( not ( = ?auto_331975 ?auto_331976 ) ) ( not ( = ?auto_331975 ?auto_331977 ) ) ( not ( = ?auto_331975 ?auto_331978 ) ) ( not ( = ?auto_331975 ?auto_331979 ) ) ( not ( = ?auto_331975 ?auto_331980 ) ) ( not ( = ?auto_331976 ?auto_331977 ) ) ( not ( = ?auto_331976 ?auto_331978 ) ) ( not ( = ?auto_331976 ?auto_331979 ) ) ( not ( = ?auto_331976 ?auto_331980 ) ) ( not ( = ?auto_331977 ?auto_331978 ) ) ( not ( = ?auto_331977 ?auto_331979 ) ) ( not ( = ?auto_331977 ?auto_331980 ) ) ( not ( = ?auto_331978 ?auto_331979 ) ) ( not ( = ?auto_331978 ?auto_331980 ) ) ( not ( = ?auto_331979 ?auto_331980 ) ) ( ON ?auto_331978 ?auto_331979 ) ( CLEAR ?auto_331976 ) ( ON ?auto_331977 ?auto_331978 ) ( CLEAR ?auto_331977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_331970 ?auto_331971 ?auto_331972 ?auto_331973 ?auto_331974 ?auto_331975 ?auto_331976 ?auto_331977 )
      ( MAKE-10PILE ?auto_331970 ?auto_331971 ?auto_331972 ?auto_331973 ?auto_331974 ?auto_331975 ?auto_331976 ?auto_331977 ?auto_331978 ?auto_331979 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_331991 - BLOCK
      ?auto_331992 - BLOCK
      ?auto_331993 - BLOCK
      ?auto_331994 - BLOCK
      ?auto_331995 - BLOCK
      ?auto_331996 - BLOCK
      ?auto_331997 - BLOCK
      ?auto_331998 - BLOCK
      ?auto_331999 - BLOCK
      ?auto_332000 - BLOCK
    )
    :vars
    (
      ?auto_332001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332000 ?auto_332001 ) ( ON-TABLE ?auto_331991 ) ( ON ?auto_331992 ?auto_331991 ) ( ON ?auto_331993 ?auto_331992 ) ( ON ?auto_331994 ?auto_331993 ) ( ON ?auto_331995 ?auto_331994 ) ( ON ?auto_331996 ?auto_331995 ) ( not ( = ?auto_331991 ?auto_331992 ) ) ( not ( = ?auto_331991 ?auto_331993 ) ) ( not ( = ?auto_331991 ?auto_331994 ) ) ( not ( = ?auto_331991 ?auto_331995 ) ) ( not ( = ?auto_331991 ?auto_331996 ) ) ( not ( = ?auto_331991 ?auto_331997 ) ) ( not ( = ?auto_331991 ?auto_331998 ) ) ( not ( = ?auto_331991 ?auto_331999 ) ) ( not ( = ?auto_331991 ?auto_332000 ) ) ( not ( = ?auto_331991 ?auto_332001 ) ) ( not ( = ?auto_331992 ?auto_331993 ) ) ( not ( = ?auto_331992 ?auto_331994 ) ) ( not ( = ?auto_331992 ?auto_331995 ) ) ( not ( = ?auto_331992 ?auto_331996 ) ) ( not ( = ?auto_331992 ?auto_331997 ) ) ( not ( = ?auto_331992 ?auto_331998 ) ) ( not ( = ?auto_331992 ?auto_331999 ) ) ( not ( = ?auto_331992 ?auto_332000 ) ) ( not ( = ?auto_331992 ?auto_332001 ) ) ( not ( = ?auto_331993 ?auto_331994 ) ) ( not ( = ?auto_331993 ?auto_331995 ) ) ( not ( = ?auto_331993 ?auto_331996 ) ) ( not ( = ?auto_331993 ?auto_331997 ) ) ( not ( = ?auto_331993 ?auto_331998 ) ) ( not ( = ?auto_331993 ?auto_331999 ) ) ( not ( = ?auto_331993 ?auto_332000 ) ) ( not ( = ?auto_331993 ?auto_332001 ) ) ( not ( = ?auto_331994 ?auto_331995 ) ) ( not ( = ?auto_331994 ?auto_331996 ) ) ( not ( = ?auto_331994 ?auto_331997 ) ) ( not ( = ?auto_331994 ?auto_331998 ) ) ( not ( = ?auto_331994 ?auto_331999 ) ) ( not ( = ?auto_331994 ?auto_332000 ) ) ( not ( = ?auto_331994 ?auto_332001 ) ) ( not ( = ?auto_331995 ?auto_331996 ) ) ( not ( = ?auto_331995 ?auto_331997 ) ) ( not ( = ?auto_331995 ?auto_331998 ) ) ( not ( = ?auto_331995 ?auto_331999 ) ) ( not ( = ?auto_331995 ?auto_332000 ) ) ( not ( = ?auto_331995 ?auto_332001 ) ) ( not ( = ?auto_331996 ?auto_331997 ) ) ( not ( = ?auto_331996 ?auto_331998 ) ) ( not ( = ?auto_331996 ?auto_331999 ) ) ( not ( = ?auto_331996 ?auto_332000 ) ) ( not ( = ?auto_331996 ?auto_332001 ) ) ( not ( = ?auto_331997 ?auto_331998 ) ) ( not ( = ?auto_331997 ?auto_331999 ) ) ( not ( = ?auto_331997 ?auto_332000 ) ) ( not ( = ?auto_331997 ?auto_332001 ) ) ( not ( = ?auto_331998 ?auto_331999 ) ) ( not ( = ?auto_331998 ?auto_332000 ) ) ( not ( = ?auto_331998 ?auto_332001 ) ) ( not ( = ?auto_331999 ?auto_332000 ) ) ( not ( = ?auto_331999 ?auto_332001 ) ) ( not ( = ?auto_332000 ?auto_332001 ) ) ( ON ?auto_331999 ?auto_332000 ) ( ON ?auto_331998 ?auto_331999 ) ( CLEAR ?auto_331996 ) ( ON ?auto_331997 ?auto_331998 ) ( CLEAR ?auto_331997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_331991 ?auto_331992 ?auto_331993 ?auto_331994 ?auto_331995 ?auto_331996 ?auto_331997 )
      ( MAKE-10PILE ?auto_331991 ?auto_331992 ?auto_331993 ?auto_331994 ?auto_331995 ?auto_331996 ?auto_331997 ?auto_331998 ?auto_331999 ?auto_332000 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_332012 - BLOCK
      ?auto_332013 - BLOCK
      ?auto_332014 - BLOCK
      ?auto_332015 - BLOCK
      ?auto_332016 - BLOCK
      ?auto_332017 - BLOCK
      ?auto_332018 - BLOCK
      ?auto_332019 - BLOCK
      ?auto_332020 - BLOCK
      ?auto_332021 - BLOCK
    )
    :vars
    (
      ?auto_332022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332021 ?auto_332022 ) ( ON-TABLE ?auto_332012 ) ( ON ?auto_332013 ?auto_332012 ) ( ON ?auto_332014 ?auto_332013 ) ( ON ?auto_332015 ?auto_332014 ) ( ON ?auto_332016 ?auto_332015 ) ( ON ?auto_332017 ?auto_332016 ) ( not ( = ?auto_332012 ?auto_332013 ) ) ( not ( = ?auto_332012 ?auto_332014 ) ) ( not ( = ?auto_332012 ?auto_332015 ) ) ( not ( = ?auto_332012 ?auto_332016 ) ) ( not ( = ?auto_332012 ?auto_332017 ) ) ( not ( = ?auto_332012 ?auto_332018 ) ) ( not ( = ?auto_332012 ?auto_332019 ) ) ( not ( = ?auto_332012 ?auto_332020 ) ) ( not ( = ?auto_332012 ?auto_332021 ) ) ( not ( = ?auto_332012 ?auto_332022 ) ) ( not ( = ?auto_332013 ?auto_332014 ) ) ( not ( = ?auto_332013 ?auto_332015 ) ) ( not ( = ?auto_332013 ?auto_332016 ) ) ( not ( = ?auto_332013 ?auto_332017 ) ) ( not ( = ?auto_332013 ?auto_332018 ) ) ( not ( = ?auto_332013 ?auto_332019 ) ) ( not ( = ?auto_332013 ?auto_332020 ) ) ( not ( = ?auto_332013 ?auto_332021 ) ) ( not ( = ?auto_332013 ?auto_332022 ) ) ( not ( = ?auto_332014 ?auto_332015 ) ) ( not ( = ?auto_332014 ?auto_332016 ) ) ( not ( = ?auto_332014 ?auto_332017 ) ) ( not ( = ?auto_332014 ?auto_332018 ) ) ( not ( = ?auto_332014 ?auto_332019 ) ) ( not ( = ?auto_332014 ?auto_332020 ) ) ( not ( = ?auto_332014 ?auto_332021 ) ) ( not ( = ?auto_332014 ?auto_332022 ) ) ( not ( = ?auto_332015 ?auto_332016 ) ) ( not ( = ?auto_332015 ?auto_332017 ) ) ( not ( = ?auto_332015 ?auto_332018 ) ) ( not ( = ?auto_332015 ?auto_332019 ) ) ( not ( = ?auto_332015 ?auto_332020 ) ) ( not ( = ?auto_332015 ?auto_332021 ) ) ( not ( = ?auto_332015 ?auto_332022 ) ) ( not ( = ?auto_332016 ?auto_332017 ) ) ( not ( = ?auto_332016 ?auto_332018 ) ) ( not ( = ?auto_332016 ?auto_332019 ) ) ( not ( = ?auto_332016 ?auto_332020 ) ) ( not ( = ?auto_332016 ?auto_332021 ) ) ( not ( = ?auto_332016 ?auto_332022 ) ) ( not ( = ?auto_332017 ?auto_332018 ) ) ( not ( = ?auto_332017 ?auto_332019 ) ) ( not ( = ?auto_332017 ?auto_332020 ) ) ( not ( = ?auto_332017 ?auto_332021 ) ) ( not ( = ?auto_332017 ?auto_332022 ) ) ( not ( = ?auto_332018 ?auto_332019 ) ) ( not ( = ?auto_332018 ?auto_332020 ) ) ( not ( = ?auto_332018 ?auto_332021 ) ) ( not ( = ?auto_332018 ?auto_332022 ) ) ( not ( = ?auto_332019 ?auto_332020 ) ) ( not ( = ?auto_332019 ?auto_332021 ) ) ( not ( = ?auto_332019 ?auto_332022 ) ) ( not ( = ?auto_332020 ?auto_332021 ) ) ( not ( = ?auto_332020 ?auto_332022 ) ) ( not ( = ?auto_332021 ?auto_332022 ) ) ( ON ?auto_332020 ?auto_332021 ) ( ON ?auto_332019 ?auto_332020 ) ( CLEAR ?auto_332017 ) ( ON ?auto_332018 ?auto_332019 ) ( CLEAR ?auto_332018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_332012 ?auto_332013 ?auto_332014 ?auto_332015 ?auto_332016 ?auto_332017 ?auto_332018 )
      ( MAKE-10PILE ?auto_332012 ?auto_332013 ?auto_332014 ?auto_332015 ?auto_332016 ?auto_332017 ?auto_332018 ?auto_332019 ?auto_332020 ?auto_332021 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_332033 - BLOCK
      ?auto_332034 - BLOCK
      ?auto_332035 - BLOCK
      ?auto_332036 - BLOCK
      ?auto_332037 - BLOCK
      ?auto_332038 - BLOCK
      ?auto_332039 - BLOCK
      ?auto_332040 - BLOCK
      ?auto_332041 - BLOCK
      ?auto_332042 - BLOCK
    )
    :vars
    (
      ?auto_332043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332042 ?auto_332043 ) ( ON-TABLE ?auto_332033 ) ( ON ?auto_332034 ?auto_332033 ) ( ON ?auto_332035 ?auto_332034 ) ( ON ?auto_332036 ?auto_332035 ) ( ON ?auto_332037 ?auto_332036 ) ( not ( = ?auto_332033 ?auto_332034 ) ) ( not ( = ?auto_332033 ?auto_332035 ) ) ( not ( = ?auto_332033 ?auto_332036 ) ) ( not ( = ?auto_332033 ?auto_332037 ) ) ( not ( = ?auto_332033 ?auto_332038 ) ) ( not ( = ?auto_332033 ?auto_332039 ) ) ( not ( = ?auto_332033 ?auto_332040 ) ) ( not ( = ?auto_332033 ?auto_332041 ) ) ( not ( = ?auto_332033 ?auto_332042 ) ) ( not ( = ?auto_332033 ?auto_332043 ) ) ( not ( = ?auto_332034 ?auto_332035 ) ) ( not ( = ?auto_332034 ?auto_332036 ) ) ( not ( = ?auto_332034 ?auto_332037 ) ) ( not ( = ?auto_332034 ?auto_332038 ) ) ( not ( = ?auto_332034 ?auto_332039 ) ) ( not ( = ?auto_332034 ?auto_332040 ) ) ( not ( = ?auto_332034 ?auto_332041 ) ) ( not ( = ?auto_332034 ?auto_332042 ) ) ( not ( = ?auto_332034 ?auto_332043 ) ) ( not ( = ?auto_332035 ?auto_332036 ) ) ( not ( = ?auto_332035 ?auto_332037 ) ) ( not ( = ?auto_332035 ?auto_332038 ) ) ( not ( = ?auto_332035 ?auto_332039 ) ) ( not ( = ?auto_332035 ?auto_332040 ) ) ( not ( = ?auto_332035 ?auto_332041 ) ) ( not ( = ?auto_332035 ?auto_332042 ) ) ( not ( = ?auto_332035 ?auto_332043 ) ) ( not ( = ?auto_332036 ?auto_332037 ) ) ( not ( = ?auto_332036 ?auto_332038 ) ) ( not ( = ?auto_332036 ?auto_332039 ) ) ( not ( = ?auto_332036 ?auto_332040 ) ) ( not ( = ?auto_332036 ?auto_332041 ) ) ( not ( = ?auto_332036 ?auto_332042 ) ) ( not ( = ?auto_332036 ?auto_332043 ) ) ( not ( = ?auto_332037 ?auto_332038 ) ) ( not ( = ?auto_332037 ?auto_332039 ) ) ( not ( = ?auto_332037 ?auto_332040 ) ) ( not ( = ?auto_332037 ?auto_332041 ) ) ( not ( = ?auto_332037 ?auto_332042 ) ) ( not ( = ?auto_332037 ?auto_332043 ) ) ( not ( = ?auto_332038 ?auto_332039 ) ) ( not ( = ?auto_332038 ?auto_332040 ) ) ( not ( = ?auto_332038 ?auto_332041 ) ) ( not ( = ?auto_332038 ?auto_332042 ) ) ( not ( = ?auto_332038 ?auto_332043 ) ) ( not ( = ?auto_332039 ?auto_332040 ) ) ( not ( = ?auto_332039 ?auto_332041 ) ) ( not ( = ?auto_332039 ?auto_332042 ) ) ( not ( = ?auto_332039 ?auto_332043 ) ) ( not ( = ?auto_332040 ?auto_332041 ) ) ( not ( = ?auto_332040 ?auto_332042 ) ) ( not ( = ?auto_332040 ?auto_332043 ) ) ( not ( = ?auto_332041 ?auto_332042 ) ) ( not ( = ?auto_332041 ?auto_332043 ) ) ( not ( = ?auto_332042 ?auto_332043 ) ) ( ON ?auto_332041 ?auto_332042 ) ( ON ?auto_332040 ?auto_332041 ) ( ON ?auto_332039 ?auto_332040 ) ( CLEAR ?auto_332037 ) ( ON ?auto_332038 ?auto_332039 ) ( CLEAR ?auto_332038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_332033 ?auto_332034 ?auto_332035 ?auto_332036 ?auto_332037 ?auto_332038 )
      ( MAKE-10PILE ?auto_332033 ?auto_332034 ?auto_332035 ?auto_332036 ?auto_332037 ?auto_332038 ?auto_332039 ?auto_332040 ?auto_332041 ?auto_332042 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_332054 - BLOCK
      ?auto_332055 - BLOCK
      ?auto_332056 - BLOCK
      ?auto_332057 - BLOCK
      ?auto_332058 - BLOCK
      ?auto_332059 - BLOCK
      ?auto_332060 - BLOCK
      ?auto_332061 - BLOCK
      ?auto_332062 - BLOCK
      ?auto_332063 - BLOCK
    )
    :vars
    (
      ?auto_332064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332063 ?auto_332064 ) ( ON-TABLE ?auto_332054 ) ( ON ?auto_332055 ?auto_332054 ) ( ON ?auto_332056 ?auto_332055 ) ( ON ?auto_332057 ?auto_332056 ) ( ON ?auto_332058 ?auto_332057 ) ( not ( = ?auto_332054 ?auto_332055 ) ) ( not ( = ?auto_332054 ?auto_332056 ) ) ( not ( = ?auto_332054 ?auto_332057 ) ) ( not ( = ?auto_332054 ?auto_332058 ) ) ( not ( = ?auto_332054 ?auto_332059 ) ) ( not ( = ?auto_332054 ?auto_332060 ) ) ( not ( = ?auto_332054 ?auto_332061 ) ) ( not ( = ?auto_332054 ?auto_332062 ) ) ( not ( = ?auto_332054 ?auto_332063 ) ) ( not ( = ?auto_332054 ?auto_332064 ) ) ( not ( = ?auto_332055 ?auto_332056 ) ) ( not ( = ?auto_332055 ?auto_332057 ) ) ( not ( = ?auto_332055 ?auto_332058 ) ) ( not ( = ?auto_332055 ?auto_332059 ) ) ( not ( = ?auto_332055 ?auto_332060 ) ) ( not ( = ?auto_332055 ?auto_332061 ) ) ( not ( = ?auto_332055 ?auto_332062 ) ) ( not ( = ?auto_332055 ?auto_332063 ) ) ( not ( = ?auto_332055 ?auto_332064 ) ) ( not ( = ?auto_332056 ?auto_332057 ) ) ( not ( = ?auto_332056 ?auto_332058 ) ) ( not ( = ?auto_332056 ?auto_332059 ) ) ( not ( = ?auto_332056 ?auto_332060 ) ) ( not ( = ?auto_332056 ?auto_332061 ) ) ( not ( = ?auto_332056 ?auto_332062 ) ) ( not ( = ?auto_332056 ?auto_332063 ) ) ( not ( = ?auto_332056 ?auto_332064 ) ) ( not ( = ?auto_332057 ?auto_332058 ) ) ( not ( = ?auto_332057 ?auto_332059 ) ) ( not ( = ?auto_332057 ?auto_332060 ) ) ( not ( = ?auto_332057 ?auto_332061 ) ) ( not ( = ?auto_332057 ?auto_332062 ) ) ( not ( = ?auto_332057 ?auto_332063 ) ) ( not ( = ?auto_332057 ?auto_332064 ) ) ( not ( = ?auto_332058 ?auto_332059 ) ) ( not ( = ?auto_332058 ?auto_332060 ) ) ( not ( = ?auto_332058 ?auto_332061 ) ) ( not ( = ?auto_332058 ?auto_332062 ) ) ( not ( = ?auto_332058 ?auto_332063 ) ) ( not ( = ?auto_332058 ?auto_332064 ) ) ( not ( = ?auto_332059 ?auto_332060 ) ) ( not ( = ?auto_332059 ?auto_332061 ) ) ( not ( = ?auto_332059 ?auto_332062 ) ) ( not ( = ?auto_332059 ?auto_332063 ) ) ( not ( = ?auto_332059 ?auto_332064 ) ) ( not ( = ?auto_332060 ?auto_332061 ) ) ( not ( = ?auto_332060 ?auto_332062 ) ) ( not ( = ?auto_332060 ?auto_332063 ) ) ( not ( = ?auto_332060 ?auto_332064 ) ) ( not ( = ?auto_332061 ?auto_332062 ) ) ( not ( = ?auto_332061 ?auto_332063 ) ) ( not ( = ?auto_332061 ?auto_332064 ) ) ( not ( = ?auto_332062 ?auto_332063 ) ) ( not ( = ?auto_332062 ?auto_332064 ) ) ( not ( = ?auto_332063 ?auto_332064 ) ) ( ON ?auto_332062 ?auto_332063 ) ( ON ?auto_332061 ?auto_332062 ) ( ON ?auto_332060 ?auto_332061 ) ( CLEAR ?auto_332058 ) ( ON ?auto_332059 ?auto_332060 ) ( CLEAR ?auto_332059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_332054 ?auto_332055 ?auto_332056 ?auto_332057 ?auto_332058 ?auto_332059 )
      ( MAKE-10PILE ?auto_332054 ?auto_332055 ?auto_332056 ?auto_332057 ?auto_332058 ?auto_332059 ?auto_332060 ?auto_332061 ?auto_332062 ?auto_332063 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_332075 - BLOCK
      ?auto_332076 - BLOCK
      ?auto_332077 - BLOCK
      ?auto_332078 - BLOCK
      ?auto_332079 - BLOCK
      ?auto_332080 - BLOCK
      ?auto_332081 - BLOCK
      ?auto_332082 - BLOCK
      ?auto_332083 - BLOCK
      ?auto_332084 - BLOCK
    )
    :vars
    (
      ?auto_332085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332084 ?auto_332085 ) ( ON-TABLE ?auto_332075 ) ( ON ?auto_332076 ?auto_332075 ) ( ON ?auto_332077 ?auto_332076 ) ( ON ?auto_332078 ?auto_332077 ) ( not ( = ?auto_332075 ?auto_332076 ) ) ( not ( = ?auto_332075 ?auto_332077 ) ) ( not ( = ?auto_332075 ?auto_332078 ) ) ( not ( = ?auto_332075 ?auto_332079 ) ) ( not ( = ?auto_332075 ?auto_332080 ) ) ( not ( = ?auto_332075 ?auto_332081 ) ) ( not ( = ?auto_332075 ?auto_332082 ) ) ( not ( = ?auto_332075 ?auto_332083 ) ) ( not ( = ?auto_332075 ?auto_332084 ) ) ( not ( = ?auto_332075 ?auto_332085 ) ) ( not ( = ?auto_332076 ?auto_332077 ) ) ( not ( = ?auto_332076 ?auto_332078 ) ) ( not ( = ?auto_332076 ?auto_332079 ) ) ( not ( = ?auto_332076 ?auto_332080 ) ) ( not ( = ?auto_332076 ?auto_332081 ) ) ( not ( = ?auto_332076 ?auto_332082 ) ) ( not ( = ?auto_332076 ?auto_332083 ) ) ( not ( = ?auto_332076 ?auto_332084 ) ) ( not ( = ?auto_332076 ?auto_332085 ) ) ( not ( = ?auto_332077 ?auto_332078 ) ) ( not ( = ?auto_332077 ?auto_332079 ) ) ( not ( = ?auto_332077 ?auto_332080 ) ) ( not ( = ?auto_332077 ?auto_332081 ) ) ( not ( = ?auto_332077 ?auto_332082 ) ) ( not ( = ?auto_332077 ?auto_332083 ) ) ( not ( = ?auto_332077 ?auto_332084 ) ) ( not ( = ?auto_332077 ?auto_332085 ) ) ( not ( = ?auto_332078 ?auto_332079 ) ) ( not ( = ?auto_332078 ?auto_332080 ) ) ( not ( = ?auto_332078 ?auto_332081 ) ) ( not ( = ?auto_332078 ?auto_332082 ) ) ( not ( = ?auto_332078 ?auto_332083 ) ) ( not ( = ?auto_332078 ?auto_332084 ) ) ( not ( = ?auto_332078 ?auto_332085 ) ) ( not ( = ?auto_332079 ?auto_332080 ) ) ( not ( = ?auto_332079 ?auto_332081 ) ) ( not ( = ?auto_332079 ?auto_332082 ) ) ( not ( = ?auto_332079 ?auto_332083 ) ) ( not ( = ?auto_332079 ?auto_332084 ) ) ( not ( = ?auto_332079 ?auto_332085 ) ) ( not ( = ?auto_332080 ?auto_332081 ) ) ( not ( = ?auto_332080 ?auto_332082 ) ) ( not ( = ?auto_332080 ?auto_332083 ) ) ( not ( = ?auto_332080 ?auto_332084 ) ) ( not ( = ?auto_332080 ?auto_332085 ) ) ( not ( = ?auto_332081 ?auto_332082 ) ) ( not ( = ?auto_332081 ?auto_332083 ) ) ( not ( = ?auto_332081 ?auto_332084 ) ) ( not ( = ?auto_332081 ?auto_332085 ) ) ( not ( = ?auto_332082 ?auto_332083 ) ) ( not ( = ?auto_332082 ?auto_332084 ) ) ( not ( = ?auto_332082 ?auto_332085 ) ) ( not ( = ?auto_332083 ?auto_332084 ) ) ( not ( = ?auto_332083 ?auto_332085 ) ) ( not ( = ?auto_332084 ?auto_332085 ) ) ( ON ?auto_332083 ?auto_332084 ) ( ON ?auto_332082 ?auto_332083 ) ( ON ?auto_332081 ?auto_332082 ) ( ON ?auto_332080 ?auto_332081 ) ( CLEAR ?auto_332078 ) ( ON ?auto_332079 ?auto_332080 ) ( CLEAR ?auto_332079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_332075 ?auto_332076 ?auto_332077 ?auto_332078 ?auto_332079 )
      ( MAKE-10PILE ?auto_332075 ?auto_332076 ?auto_332077 ?auto_332078 ?auto_332079 ?auto_332080 ?auto_332081 ?auto_332082 ?auto_332083 ?auto_332084 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_332096 - BLOCK
      ?auto_332097 - BLOCK
      ?auto_332098 - BLOCK
      ?auto_332099 - BLOCK
      ?auto_332100 - BLOCK
      ?auto_332101 - BLOCK
      ?auto_332102 - BLOCK
      ?auto_332103 - BLOCK
      ?auto_332104 - BLOCK
      ?auto_332105 - BLOCK
    )
    :vars
    (
      ?auto_332106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332105 ?auto_332106 ) ( ON-TABLE ?auto_332096 ) ( ON ?auto_332097 ?auto_332096 ) ( ON ?auto_332098 ?auto_332097 ) ( ON ?auto_332099 ?auto_332098 ) ( not ( = ?auto_332096 ?auto_332097 ) ) ( not ( = ?auto_332096 ?auto_332098 ) ) ( not ( = ?auto_332096 ?auto_332099 ) ) ( not ( = ?auto_332096 ?auto_332100 ) ) ( not ( = ?auto_332096 ?auto_332101 ) ) ( not ( = ?auto_332096 ?auto_332102 ) ) ( not ( = ?auto_332096 ?auto_332103 ) ) ( not ( = ?auto_332096 ?auto_332104 ) ) ( not ( = ?auto_332096 ?auto_332105 ) ) ( not ( = ?auto_332096 ?auto_332106 ) ) ( not ( = ?auto_332097 ?auto_332098 ) ) ( not ( = ?auto_332097 ?auto_332099 ) ) ( not ( = ?auto_332097 ?auto_332100 ) ) ( not ( = ?auto_332097 ?auto_332101 ) ) ( not ( = ?auto_332097 ?auto_332102 ) ) ( not ( = ?auto_332097 ?auto_332103 ) ) ( not ( = ?auto_332097 ?auto_332104 ) ) ( not ( = ?auto_332097 ?auto_332105 ) ) ( not ( = ?auto_332097 ?auto_332106 ) ) ( not ( = ?auto_332098 ?auto_332099 ) ) ( not ( = ?auto_332098 ?auto_332100 ) ) ( not ( = ?auto_332098 ?auto_332101 ) ) ( not ( = ?auto_332098 ?auto_332102 ) ) ( not ( = ?auto_332098 ?auto_332103 ) ) ( not ( = ?auto_332098 ?auto_332104 ) ) ( not ( = ?auto_332098 ?auto_332105 ) ) ( not ( = ?auto_332098 ?auto_332106 ) ) ( not ( = ?auto_332099 ?auto_332100 ) ) ( not ( = ?auto_332099 ?auto_332101 ) ) ( not ( = ?auto_332099 ?auto_332102 ) ) ( not ( = ?auto_332099 ?auto_332103 ) ) ( not ( = ?auto_332099 ?auto_332104 ) ) ( not ( = ?auto_332099 ?auto_332105 ) ) ( not ( = ?auto_332099 ?auto_332106 ) ) ( not ( = ?auto_332100 ?auto_332101 ) ) ( not ( = ?auto_332100 ?auto_332102 ) ) ( not ( = ?auto_332100 ?auto_332103 ) ) ( not ( = ?auto_332100 ?auto_332104 ) ) ( not ( = ?auto_332100 ?auto_332105 ) ) ( not ( = ?auto_332100 ?auto_332106 ) ) ( not ( = ?auto_332101 ?auto_332102 ) ) ( not ( = ?auto_332101 ?auto_332103 ) ) ( not ( = ?auto_332101 ?auto_332104 ) ) ( not ( = ?auto_332101 ?auto_332105 ) ) ( not ( = ?auto_332101 ?auto_332106 ) ) ( not ( = ?auto_332102 ?auto_332103 ) ) ( not ( = ?auto_332102 ?auto_332104 ) ) ( not ( = ?auto_332102 ?auto_332105 ) ) ( not ( = ?auto_332102 ?auto_332106 ) ) ( not ( = ?auto_332103 ?auto_332104 ) ) ( not ( = ?auto_332103 ?auto_332105 ) ) ( not ( = ?auto_332103 ?auto_332106 ) ) ( not ( = ?auto_332104 ?auto_332105 ) ) ( not ( = ?auto_332104 ?auto_332106 ) ) ( not ( = ?auto_332105 ?auto_332106 ) ) ( ON ?auto_332104 ?auto_332105 ) ( ON ?auto_332103 ?auto_332104 ) ( ON ?auto_332102 ?auto_332103 ) ( ON ?auto_332101 ?auto_332102 ) ( CLEAR ?auto_332099 ) ( ON ?auto_332100 ?auto_332101 ) ( CLEAR ?auto_332100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_332096 ?auto_332097 ?auto_332098 ?auto_332099 ?auto_332100 )
      ( MAKE-10PILE ?auto_332096 ?auto_332097 ?auto_332098 ?auto_332099 ?auto_332100 ?auto_332101 ?auto_332102 ?auto_332103 ?auto_332104 ?auto_332105 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_332117 - BLOCK
      ?auto_332118 - BLOCK
      ?auto_332119 - BLOCK
      ?auto_332120 - BLOCK
      ?auto_332121 - BLOCK
      ?auto_332122 - BLOCK
      ?auto_332123 - BLOCK
      ?auto_332124 - BLOCK
      ?auto_332125 - BLOCK
      ?auto_332126 - BLOCK
    )
    :vars
    (
      ?auto_332127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332126 ?auto_332127 ) ( ON-TABLE ?auto_332117 ) ( ON ?auto_332118 ?auto_332117 ) ( ON ?auto_332119 ?auto_332118 ) ( not ( = ?auto_332117 ?auto_332118 ) ) ( not ( = ?auto_332117 ?auto_332119 ) ) ( not ( = ?auto_332117 ?auto_332120 ) ) ( not ( = ?auto_332117 ?auto_332121 ) ) ( not ( = ?auto_332117 ?auto_332122 ) ) ( not ( = ?auto_332117 ?auto_332123 ) ) ( not ( = ?auto_332117 ?auto_332124 ) ) ( not ( = ?auto_332117 ?auto_332125 ) ) ( not ( = ?auto_332117 ?auto_332126 ) ) ( not ( = ?auto_332117 ?auto_332127 ) ) ( not ( = ?auto_332118 ?auto_332119 ) ) ( not ( = ?auto_332118 ?auto_332120 ) ) ( not ( = ?auto_332118 ?auto_332121 ) ) ( not ( = ?auto_332118 ?auto_332122 ) ) ( not ( = ?auto_332118 ?auto_332123 ) ) ( not ( = ?auto_332118 ?auto_332124 ) ) ( not ( = ?auto_332118 ?auto_332125 ) ) ( not ( = ?auto_332118 ?auto_332126 ) ) ( not ( = ?auto_332118 ?auto_332127 ) ) ( not ( = ?auto_332119 ?auto_332120 ) ) ( not ( = ?auto_332119 ?auto_332121 ) ) ( not ( = ?auto_332119 ?auto_332122 ) ) ( not ( = ?auto_332119 ?auto_332123 ) ) ( not ( = ?auto_332119 ?auto_332124 ) ) ( not ( = ?auto_332119 ?auto_332125 ) ) ( not ( = ?auto_332119 ?auto_332126 ) ) ( not ( = ?auto_332119 ?auto_332127 ) ) ( not ( = ?auto_332120 ?auto_332121 ) ) ( not ( = ?auto_332120 ?auto_332122 ) ) ( not ( = ?auto_332120 ?auto_332123 ) ) ( not ( = ?auto_332120 ?auto_332124 ) ) ( not ( = ?auto_332120 ?auto_332125 ) ) ( not ( = ?auto_332120 ?auto_332126 ) ) ( not ( = ?auto_332120 ?auto_332127 ) ) ( not ( = ?auto_332121 ?auto_332122 ) ) ( not ( = ?auto_332121 ?auto_332123 ) ) ( not ( = ?auto_332121 ?auto_332124 ) ) ( not ( = ?auto_332121 ?auto_332125 ) ) ( not ( = ?auto_332121 ?auto_332126 ) ) ( not ( = ?auto_332121 ?auto_332127 ) ) ( not ( = ?auto_332122 ?auto_332123 ) ) ( not ( = ?auto_332122 ?auto_332124 ) ) ( not ( = ?auto_332122 ?auto_332125 ) ) ( not ( = ?auto_332122 ?auto_332126 ) ) ( not ( = ?auto_332122 ?auto_332127 ) ) ( not ( = ?auto_332123 ?auto_332124 ) ) ( not ( = ?auto_332123 ?auto_332125 ) ) ( not ( = ?auto_332123 ?auto_332126 ) ) ( not ( = ?auto_332123 ?auto_332127 ) ) ( not ( = ?auto_332124 ?auto_332125 ) ) ( not ( = ?auto_332124 ?auto_332126 ) ) ( not ( = ?auto_332124 ?auto_332127 ) ) ( not ( = ?auto_332125 ?auto_332126 ) ) ( not ( = ?auto_332125 ?auto_332127 ) ) ( not ( = ?auto_332126 ?auto_332127 ) ) ( ON ?auto_332125 ?auto_332126 ) ( ON ?auto_332124 ?auto_332125 ) ( ON ?auto_332123 ?auto_332124 ) ( ON ?auto_332122 ?auto_332123 ) ( ON ?auto_332121 ?auto_332122 ) ( CLEAR ?auto_332119 ) ( ON ?auto_332120 ?auto_332121 ) ( CLEAR ?auto_332120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_332117 ?auto_332118 ?auto_332119 ?auto_332120 )
      ( MAKE-10PILE ?auto_332117 ?auto_332118 ?auto_332119 ?auto_332120 ?auto_332121 ?auto_332122 ?auto_332123 ?auto_332124 ?auto_332125 ?auto_332126 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_332138 - BLOCK
      ?auto_332139 - BLOCK
      ?auto_332140 - BLOCK
      ?auto_332141 - BLOCK
      ?auto_332142 - BLOCK
      ?auto_332143 - BLOCK
      ?auto_332144 - BLOCK
      ?auto_332145 - BLOCK
      ?auto_332146 - BLOCK
      ?auto_332147 - BLOCK
    )
    :vars
    (
      ?auto_332148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332147 ?auto_332148 ) ( ON-TABLE ?auto_332138 ) ( ON ?auto_332139 ?auto_332138 ) ( ON ?auto_332140 ?auto_332139 ) ( not ( = ?auto_332138 ?auto_332139 ) ) ( not ( = ?auto_332138 ?auto_332140 ) ) ( not ( = ?auto_332138 ?auto_332141 ) ) ( not ( = ?auto_332138 ?auto_332142 ) ) ( not ( = ?auto_332138 ?auto_332143 ) ) ( not ( = ?auto_332138 ?auto_332144 ) ) ( not ( = ?auto_332138 ?auto_332145 ) ) ( not ( = ?auto_332138 ?auto_332146 ) ) ( not ( = ?auto_332138 ?auto_332147 ) ) ( not ( = ?auto_332138 ?auto_332148 ) ) ( not ( = ?auto_332139 ?auto_332140 ) ) ( not ( = ?auto_332139 ?auto_332141 ) ) ( not ( = ?auto_332139 ?auto_332142 ) ) ( not ( = ?auto_332139 ?auto_332143 ) ) ( not ( = ?auto_332139 ?auto_332144 ) ) ( not ( = ?auto_332139 ?auto_332145 ) ) ( not ( = ?auto_332139 ?auto_332146 ) ) ( not ( = ?auto_332139 ?auto_332147 ) ) ( not ( = ?auto_332139 ?auto_332148 ) ) ( not ( = ?auto_332140 ?auto_332141 ) ) ( not ( = ?auto_332140 ?auto_332142 ) ) ( not ( = ?auto_332140 ?auto_332143 ) ) ( not ( = ?auto_332140 ?auto_332144 ) ) ( not ( = ?auto_332140 ?auto_332145 ) ) ( not ( = ?auto_332140 ?auto_332146 ) ) ( not ( = ?auto_332140 ?auto_332147 ) ) ( not ( = ?auto_332140 ?auto_332148 ) ) ( not ( = ?auto_332141 ?auto_332142 ) ) ( not ( = ?auto_332141 ?auto_332143 ) ) ( not ( = ?auto_332141 ?auto_332144 ) ) ( not ( = ?auto_332141 ?auto_332145 ) ) ( not ( = ?auto_332141 ?auto_332146 ) ) ( not ( = ?auto_332141 ?auto_332147 ) ) ( not ( = ?auto_332141 ?auto_332148 ) ) ( not ( = ?auto_332142 ?auto_332143 ) ) ( not ( = ?auto_332142 ?auto_332144 ) ) ( not ( = ?auto_332142 ?auto_332145 ) ) ( not ( = ?auto_332142 ?auto_332146 ) ) ( not ( = ?auto_332142 ?auto_332147 ) ) ( not ( = ?auto_332142 ?auto_332148 ) ) ( not ( = ?auto_332143 ?auto_332144 ) ) ( not ( = ?auto_332143 ?auto_332145 ) ) ( not ( = ?auto_332143 ?auto_332146 ) ) ( not ( = ?auto_332143 ?auto_332147 ) ) ( not ( = ?auto_332143 ?auto_332148 ) ) ( not ( = ?auto_332144 ?auto_332145 ) ) ( not ( = ?auto_332144 ?auto_332146 ) ) ( not ( = ?auto_332144 ?auto_332147 ) ) ( not ( = ?auto_332144 ?auto_332148 ) ) ( not ( = ?auto_332145 ?auto_332146 ) ) ( not ( = ?auto_332145 ?auto_332147 ) ) ( not ( = ?auto_332145 ?auto_332148 ) ) ( not ( = ?auto_332146 ?auto_332147 ) ) ( not ( = ?auto_332146 ?auto_332148 ) ) ( not ( = ?auto_332147 ?auto_332148 ) ) ( ON ?auto_332146 ?auto_332147 ) ( ON ?auto_332145 ?auto_332146 ) ( ON ?auto_332144 ?auto_332145 ) ( ON ?auto_332143 ?auto_332144 ) ( ON ?auto_332142 ?auto_332143 ) ( CLEAR ?auto_332140 ) ( ON ?auto_332141 ?auto_332142 ) ( CLEAR ?auto_332141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_332138 ?auto_332139 ?auto_332140 ?auto_332141 )
      ( MAKE-10PILE ?auto_332138 ?auto_332139 ?auto_332140 ?auto_332141 ?auto_332142 ?auto_332143 ?auto_332144 ?auto_332145 ?auto_332146 ?auto_332147 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_332159 - BLOCK
      ?auto_332160 - BLOCK
      ?auto_332161 - BLOCK
      ?auto_332162 - BLOCK
      ?auto_332163 - BLOCK
      ?auto_332164 - BLOCK
      ?auto_332165 - BLOCK
      ?auto_332166 - BLOCK
      ?auto_332167 - BLOCK
      ?auto_332168 - BLOCK
    )
    :vars
    (
      ?auto_332169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332168 ?auto_332169 ) ( ON-TABLE ?auto_332159 ) ( ON ?auto_332160 ?auto_332159 ) ( not ( = ?auto_332159 ?auto_332160 ) ) ( not ( = ?auto_332159 ?auto_332161 ) ) ( not ( = ?auto_332159 ?auto_332162 ) ) ( not ( = ?auto_332159 ?auto_332163 ) ) ( not ( = ?auto_332159 ?auto_332164 ) ) ( not ( = ?auto_332159 ?auto_332165 ) ) ( not ( = ?auto_332159 ?auto_332166 ) ) ( not ( = ?auto_332159 ?auto_332167 ) ) ( not ( = ?auto_332159 ?auto_332168 ) ) ( not ( = ?auto_332159 ?auto_332169 ) ) ( not ( = ?auto_332160 ?auto_332161 ) ) ( not ( = ?auto_332160 ?auto_332162 ) ) ( not ( = ?auto_332160 ?auto_332163 ) ) ( not ( = ?auto_332160 ?auto_332164 ) ) ( not ( = ?auto_332160 ?auto_332165 ) ) ( not ( = ?auto_332160 ?auto_332166 ) ) ( not ( = ?auto_332160 ?auto_332167 ) ) ( not ( = ?auto_332160 ?auto_332168 ) ) ( not ( = ?auto_332160 ?auto_332169 ) ) ( not ( = ?auto_332161 ?auto_332162 ) ) ( not ( = ?auto_332161 ?auto_332163 ) ) ( not ( = ?auto_332161 ?auto_332164 ) ) ( not ( = ?auto_332161 ?auto_332165 ) ) ( not ( = ?auto_332161 ?auto_332166 ) ) ( not ( = ?auto_332161 ?auto_332167 ) ) ( not ( = ?auto_332161 ?auto_332168 ) ) ( not ( = ?auto_332161 ?auto_332169 ) ) ( not ( = ?auto_332162 ?auto_332163 ) ) ( not ( = ?auto_332162 ?auto_332164 ) ) ( not ( = ?auto_332162 ?auto_332165 ) ) ( not ( = ?auto_332162 ?auto_332166 ) ) ( not ( = ?auto_332162 ?auto_332167 ) ) ( not ( = ?auto_332162 ?auto_332168 ) ) ( not ( = ?auto_332162 ?auto_332169 ) ) ( not ( = ?auto_332163 ?auto_332164 ) ) ( not ( = ?auto_332163 ?auto_332165 ) ) ( not ( = ?auto_332163 ?auto_332166 ) ) ( not ( = ?auto_332163 ?auto_332167 ) ) ( not ( = ?auto_332163 ?auto_332168 ) ) ( not ( = ?auto_332163 ?auto_332169 ) ) ( not ( = ?auto_332164 ?auto_332165 ) ) ( not ( = ?auto_332164 ?auto_332166 ) ) ( not ( = ?auto_332164 ?auto_332167 ) ) ( not ( = ?auto_332164 ?auto_332168 ) ) ( not ( = ?auto_332164 ?auto_332169 ) ) ( not ( = ?auto_332165 ?auto_332166 ) ) ( not ( = ?auto_332165 ?auto_332167 ) ) ( not ( = ?auto_332165 ?auto_332168 ) ) ( not ( = ?auto_332165 ?auto_332169 ) ) ( not ( = ?auto_332166 ?auto_332167 ) ) ( not ( = ?auto_332166 ?auto_332168 ) ) ( not ( = ?auto_332166 ?auto_332169 ) ) ( not ( = ?auto_332167 ?auto_332168 ) ) ( not ( = ?auto_332167 ?auto_332169 ) ) ( not ( = ?auto_332168 ?auto_332169 ) ) ( ON ?auto_332167 ?auto_332168 ) ( ON ?auto_332166 ?auto_332167 ) ( ON ?auto_332165 ?auto_332166 ) ( ON ?auto_332164 ?auto_332165 ) ( ON ?auto_332163 ?auto_332164 ) ( ON ?auto_332162 ?auto_332163 ) ( CLEAR ?auto_332160 ) ( ON ?auto_332161 ?auto_332162 ) ( CLEAR ?auto_332161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_332159 ?auto_332160 ?auto_332161 )
      ( MAKE-10PILE ?auto_332159 ?auto_332160 ?auto_332161 ?auto_332162 ?auto_332163 ?auto_332164 ?auto_332165 ?auto_332166 ?auto_332167 ?auto_332168 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_332180 - BLOCK
      ?auto_332181 - BLOCK
      ?auto_332182 - BLOCK
      ?auto_332183 - BLOCK
      ?auto_332184 - BLOCK
      ?auto_332185 - BLOCK
      ?auto_332186 - BLOCK
      ?auto_332187 - BLOCK
      ?auto_332188 - BLOCK
      ?auto_332189 - BLOCK
    )
    :vars
    (
      ?auto_332190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332189 ?auto_332190 ) ( ON-TABLE ?auto_332180 ) ( ON ?auto_332181 ?auto_332180 ) ( not ( = ?auto_332180 ?auto_332181 ) ) ( not ( = ?auto_332180 ?auto_332182 ) ) ( not ( = ?auto_332180 ?auto_332183 ) ) ( not ( = ?auto_332180 ?auto_332184 ) ) ( not ( = ?auto_332180 ?auto_332185 ) ) ( not ( = ?auto_332180 ?auto_332186 ) ) ( not ( = ?auto_332180 ?auto_332187 ) ) ( not ( = ?auto_332180 ?auto_332188 ) ) ( not ( = ?auto_332180 ?auto_332189 ) ) ( not ( = ?auto_332180 ?auto_332190 ) ) ( not ( = ?auto_332181 ?auto_332182 ) ) ( not ( = ?auto_332181 ?auto_332183 ) ) ( not ( = ?auto_332181 ?auto_332184 ) ) ( not ( = ?auto_332181 ?auto_332185 ) ) ( not ( = ?auto_332181 ?auto_332186 ) ) ( not ( = ?auto_332181 ?auto_332187 ) ) ( not ( = ?auto_332181 ?auto_332188 ) ) ( not ( = ?auto_332181 ?auto_332189 ) ) ( not ( = ?auto_332181 ?auto_332190 ) ) ( not ( = ?auto_332182 ?auto_332183 ) ) ( not ( = ?auto_332182 ?auto_332184 ) ) ( not ( = ?auto_332182 ?auto_332185 ) ) ( not ( = ?auto_332182 ?auto_332186 ) ) ( not ( = ?auto_332182 ?auto_332187 ) ) ( not ( = ?auto_332182 ?auto_332188 ) ) ( not ( = ?auto_332182 ?auto_332189 ) ) ( not ( = ?auto_332182 ?auto_332190 ) ) ( not ( = ?auto_332183 ?auto_332184 ) ) ( not ( = ?auto_332183 ?auto_332185 ) ) ( not ( = ?auto_332183 ?auto_332186 ) ) ( not ( = ?auto_332183 ?auto_332187 ) ) ( not ( = ?auto_332183 ?auto_332188 ) ) ( not ( = ?auto_332183 ?auto_332189 ) ) ( not ( = ?auto_332183 ?auto_332190 ) ) ( not ( = ?auto_332184 ?auto_332185 ) ) ( not ( = ?auto_332184 ?auto_332186 ) ) ( not ( = ?auto_332184 ?auto_332187 ) ) ( not ( = ?auto_332184 ?auto_332188 ) ) ( not ( = ?auto_332184 ?auto_332189 ) ) ( not ( = ?auto_332184 ?auto_332190 ) ) ( not ( = ?auto_332185 ?auto_332186 ) ) ( not ( = ?auto_332185 ?auto_332187 ) ) ( not ( = ?auto_332185 ?auto_332188 ) ) ( not ( = ?auto_332185 ?auto_332189 ) ) ( not ( = ?auto_332185 ?auto_332190 ) ) ( not ( = ?auto_332186 ?auto_332187 ) ) ( not ( = ?auto_332186 ?auto_332188 ) ) ( not ( = ?auto_332186 ?auto_332189 ) ) ( not ( = ?auto_332186 ?auto_332190 ) ) ( not ( = ?auto_332187 ?auto_332188 ) ) ( not ( = ?auto_332187 ?auto_332189 ) ) ( not ( = ?auto_332187 ?auto_332190 ) ) ( not ( = ?auto_332188 ?auto_332189 ) ) ( not ( = ?auto_332188 ?auto_332190 ) ) ( not ( = ?auto_332189 ?auto_332190 ) ) ( ON ?auto_332188 ?auto_332189 ) ( ON ?auto_332187 ?auto_332188 ) ( ON ?auto_332186 ?auto_332187 ) ( ON ?auto_332185 ?auto_332186 ) ( ON ?auto_332184 ?auto_332185 ) ( ON ?auto_332183 ?auto_332184 ) ( CLEAR ?auto_332181 ) ( ON ?auto_332182 ?auto_332183 ) ( CLEAR ?auto_332182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_332180 ?auto_332181 ?auto_332182 )
      ( MAKE-10PILE ?auto_332180 ?auto_332181 ?auto_332182 ?auto_332183 ?auto_332184 ?auto_332185 ?auto_332186 ?auto_332187 ?auto_332188 ?auto_332189 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_332201 - BLOCK
      ?auto_332202 - BLOCK
      ?auto_332203 - BLOCK
      ?auto_332204 - BLOCK
      ?auto_332205 - BLOCK
      ?auto_332206 - BLOCK
      ?auto_332207 - BLOCK
      ?auto_332208 - BLOCK
      ?auto_332209 - BLOCK
      ?auto_332210 - BLOCK
    )
    :vars
    (
      ?auto_332211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332210 ?auto_332211 ) ( ON-TABLE ?auto_332201 ) ( not ( = ?auto_332201 ?auto_332202 ) ) ( not ( = ?auto_332201 ?auto_332203 ) ) ( not ( = ?auto_332201 ?auto_332204 ) ) ( not ( = ?auto_332201 ?auto_332205 ) ) ( not ( = ?auto_332201 ?auto_332206 ) ) ( not ( = ?auto_332201 ?auto_332207 ) ) ( not ( = ?auto_332201 ?auto_332208 ) ) ( not ( = ?auto_332201 ?auto_332209 ) ) ( not ( = ?auto_332201 ?auto_332210 ) ) ( not ( = ?auto_332201 ?auto_332211 ) ) ( not ( = ?auto_332202 ?auto_332203 ) ) ( not ( = ?auto_332202 ?auto_332204 ) ) ( not ( = ?auto_332202 ?auto_332205 ) ) ( not ( = ?auto_332202 ?auto_332206 ) ) ( not ( = ?auto_332202 ?auto_332207 ) ) ( not ( = ?auto_332202 ?auto_332208 ) ) ( not ( = ?auto_332202 ?auto_332209 ) ) ( not ( = ?auto_332202 ?auto_332210 ) ) ( not ( = ?auto_332202 ?auto_332211 ) ) ( not ( = ?auto_332203 ?auto_332204 ) ) ( not ( = ?auto_332203 ?auto_332205 ) ) ( not ( = ?auto_332203 ?auto_332206 ) ) ( not ( = ?auto_332203 ?auto_332207 ) ) ( not ( = ?auto_332203 ?auto_332208 ) ) ( not ( = ?auto_332203 ?auto_332209 ) ) ( not ( = ?auto_332203 ?auto_332210 ) ) ( not ( = ?auto_332203 ?auto_332211 ) ) ( not ( = ?auto_332204 ?auto_332205 ) ) ( not ( = ?auto_332204 ?auto_332206 ) ) ( not ( = ?auto_332204 ?auto_332207 ) ) ( not ( = ?auto_332204 ?auto_332208 ) ) ( not ( = ?auto_332204 ?auto_332209 ) ) ( not ( = ?auto_332204 ?auto_332210 ) ) ( not ( = ?auto_332204 ?auto_332211 ) ) ( not ( = ?auto_332205 ?auto_332206 ) ) ( not ( = ?auto_332205 ?auto_332207 ) ) ( not ( = ?auto_332205 ?auto_332208 ) ) ( not ( = ?auto_332205 ?auto_332209 ) ) ( not ( = ?auto_332205 ?auto_332210 ) ) ( not ( = ?auto_332205 ?auto_332211 ) ) ( not ( = ?auto_332206 ?auto_332207 ) ) ( not ( = ?auto_332206 ?auto_332208 ) ) ( not ( = ?auto_332206 ?auto_332209 ) ) ( not ( = ?auto_332206 ?auto_332210 ) ) ( not ( = ?auto_332206 ?auto_332211 ) ) ( not ( = ?auto_332207 ?auto_332208 ) ) ( not ( = ?auto_332207 ?auto_332209 ) ) ( not ( = ?auto_332207 ?auto_332210 ) ) ( not ( = ?auto_332207 ?auto_332211 ) ) ( not ( = ?auto_332208 ?auto_332209 ) ) ( not ( = ?auto_332208 ?auto_332210 ) ) ( not ( = ?auto_332208 ?auto_332211 ) ) ( not ( = ?auto_332209 ?auto_332210 ) ) ( not ( = ?auto_332209 ?auto_332211 ) ) ( not ( = ?auto_332210 ?auto_332211 ) ) ( ON ?auto_332209 ?auto_332210 ) ( ON ?auto_332208 ?auto_332209 ) ( ON ?auto_332207 ?auto_332208 ) ( ON ?auto_332206 ?auto_332207 ) ( ON ?auto_332205 ?auto_332206 ) ( ON ?auto_332204 ?auto_332205 ) ( ON ?auto_332203 ?auto_332204 ) ( CLEAR ?auto_332201 ) ( ON ?auto_332202 ?auto_332203 ) ( CLEAR ?auto_332202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_332201 ?auto_332202 )
      ( MAKE-10PILE ?auto_332201 ?auto_332202 ?auto_332203 ?auto_332204 ?auto_332205 ?auto_332206 ?auto_332207 ?auto_332208 ?auto_332209 ?auto_332210 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_332222 - BLOCK
      ?auto_332223 - BLOCK
      ?auto_332224 - BLOCK
      ?auto_332225 - BLOCK
      ?auto_332226 - BLOCK
      ?auto_332227 - BLOCK
      ?auto_332228 - BLOCK
      ?auto_332229 - BLOCK
      ?auto_332230 - BLOCK
      ?auto_332231 - BLOCK
    )
    :vars
    (
      ?auto_332232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332231 ?auto_332232 ) ( ON-TABLE ?auto_332222 ) ( not ( = ?auto_332222 ?auto_332223 ) ) ( not ( = ?auto_332222 ?auto_332224 ) ) ( not ( = ?auto_332222 ?auto_332225 ) ) ( not ( = ?auto_332222 ?auto_332226 ) ) ( not ( = ?auto_332222 ?auto_332227 ) ) ( not ( = ?auto_332222 ?auto_332228 ) ) ( not ( = ?auto_332222 ?auto_332229 ) ) ( not ( = ?auto_332222 ?auto_332230 ) ) ( not ( = ?auto_332222 ?auto_332231 ) ) ( not ( = ?auto_332222 ?auto_332232 ) ) ( not ( = ?auto_332223 ?auto_332224 ) ) ( not ( = ?auto_332223 ?auto_332225 ) ) ( not ( = ?auto_332223 ?auto_332226 ) ) ( not ( = ?auto_332223 ?auto_332227 ) ) ( not ( = ?auto_332223 ?auto_332228 ) ) ( not ( = ?auto_332223 ?auto_332229 ) ) ( not ( = ?auto_332223 ?auto_332230 ) ) ( not ( = ?auto_332223 ?auto_332231 ) ) ( not ( = ?auto_332223 ?auto_332232 ) ) ( not ( = ?auto_332224 ?auto_332225 ) ) ( not ( = ?auto_332224 ?auto_332226 ) ) ( not ( = ?auto_332224 ?auto_332227 ) ) ( not ( = ?auto_332224 ?auto_332228 ) ) ( not ( = ?auto_332224 ?auto_332229 ) ) ( not ( = ?auto_332224 ?auto_332230 ) ) ( not ( = ?auto_332224 ?auto_332231 ) ) ( not ( = ?auto_332224 ?auto_332232 ) ) ( not ( = ?auto_332225 ?auto_332226 ) ) ( not ( = ?auto_332225 ?auto_332227 ) ) ( not ( = ?auto_332225 ?auto_332228 ) ) ( not ( = ?auto_332225 ?auto_332229 ) ) ( not ( = ?auto_332225 ?auto_332230 ) ) ( not ( = ?auto_332225 ?auto_332231 ) ) ( not ( = ?auto_332225 ?auto_332232 ) ) ( not ( = ?auto_332226 ?auto_332227 ) ) ( not ( = ?auto_332226 ?auto_332228 ) ) ( not ( = ?auto_332226 ?auto_332229 ) ) ( not ( = ?auto_332226 ?auto_332230 ) ) ( not ( = ?auto_332226 ?auto_332231 ) ) ( not ( = ?auto_332226 ?auto_332232 ) ) ( not ( = ?auto_332227 ?auto_332228 ) ) ( not ( = ?auto_332227 ?auto_332229 ) ) ( not ( = ?auto_332227 ?auto_332230 ) ) ( not ( = ?auto_332227 ?auto_332231 ) ) ( not ( = ?auto_332227 ?auto_332232 ) ) ( not ( = ?auto_332228 ?auto_332229 ) ) ( not ( = ?auto_332228 ?auto_332230 ) ) ( not ( = ?auto_332228 ?auto_332231 ) ) ( not ( = ?auto_332228 ?auto_332232 ) ) ( not ( = ?auto_332229 ?auto_332230 ) ) ( not ( = ?auto_332229 ?auto_332231 ) ) ( not ( = ?auto_332229 ?auto_332232 ) ) ( not ( = ?auto_332230 ?auto_332231 ) ) ( not ( = ?auto_332230 ?auto_332232 ) ) ( not ( = ?auto_332231 ?auto_332232 ) ) ( ON ?auto_332230 ?auto_332231 ) ( ON ?auto_332229 ?auto_332230 ) ( ON ?auto_332228 ?auto_332229 ) ( ON ?auto_332227 ?auto_332228 ) ( ON ?auto_332226 ?auto_332227 ) ( ON ?auto_332225 ?auto_332226 ) ( ON ?auto_332224 ?auto_332225 ) ( CLEAR ?auto_332222 ) ( ON ?auto_332223 ?auto_332224 ) ( CLEAR ?auto_332223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_332222 ?auto_332223 )
      ( MAKE-10PILE ?auto_332222 ?auto_332223 ?auto_332224 ?auto_332225 ?auto_332226 ?auto_332227 ?auto_332228 ?auto_332229 ?auto_332230 ?auto_332231 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_332243 - BLOCK
      ?auto_332244 - BLOCK
      ?auto_332245 - BLOCK
      ?auto_332246 - BLOCK
      ?auto_332247 - BLOCK
      ?auto_332248 - BLOCK
      ?auto_332249 - BLOCK
      ?auto_332250 - BLOCK
      ?auto_332251 - BLOCK
      ?auto_332252 - BLOCK
    )
    :vars
    (
      ?auto_332253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332252 ?auto_332253 ) ( not ( = ?auto_332243 ?auto_332244 ) ) ( not ( = ?auto_332243 ?auto_332245 ) ) ( not ( = ?auto_332243 ?auto_332246 ) ) ( not ( = ?auto_332243 ?auto_332247 ) ) ( not ( = ?auto_332243 ?auto_332248 ) ) ( not ( = ?auto_332243 ?auto_332249 ) ) ( not ( = ?auto_332243 ?auto_332250 ) ) ( not ( = ?auto_332243 ?auto_332251 ) ) ( not ( = ?auto_332243 ?auto_332252 ) ) ( not ( = ?auto_332243 ?auto_332253 ) ) ( not ( = ?auto_332244 ?auto_332245 ) ) ( not ( = ?auto_332244 ?auto_332246 ) ) ( not ( = ?auto_332244 ?auto_332247 ) ) ( not ( = ?auto_332244 ?auto_332248 ) ) ( not ( = ?auto_332244 ?auto_332249 ) ) ( not ( = ?auto_332244 ?auto_332250 ) ) ( not ( = ?auto_332244 ?auto_332251 ) ) ( not ( = ?auto_332244 ?auto_332252 ) ) ( not ( = ?auto_332244 ?auto_332253 ) ) ( not ( = ?auto_332245 ?auto_332246 ) ) ( not ( = ?auto_332245 ?auto_332247 ) ) ( not ( = ?auto_332245 ?auto_332248 ) ) ( not ( = ?auto_332245 ?auto_332249 ) ) ( not ( = ?auto_332245 ?auto_332250 ) ) ( not ( = ?auto_332245 ?auto_332251 ) ) ( not ( = ?auto_332245 ?auto_332252 ) ) ( not ( = ?auto_332245 ?auto_332253 ) ) ( not ( = ?auto_332246 ?auto_332247 ) ) ( not ( = ?auto_332246 ?auto_332248 ) ) ( not ( = ?auto_332246 ?auto_332249 ) ) ( not ( = ?auto_332246 ?auto_332250 ) ) ( not ( = ?auto_332246 ?auto_332251 ) ) ( not ( = ?auto_332246 ?auto_332252 ) ) ( not ( = ?auto_332246 ?auto_332253 ) ) ( not ( = ?auto_332247 ?auto_332248 ) ) ( not ( = ?auto_332247 ?auto_332249 ) ) ( not ( = ?auto_332247 ?auto_332250 ) ) ( not ( = ?auto_332247 ?auto_332251 ) ) ( not ( = ?auto_332247 ?auto_332252 ) ) ( not ( = ?auto_332247 ?auto_332253 ) ) ( not ( = ?auto_332248 ?auto_332249 ) ) ( not ( = ?auto_332248 ?auto_332250 ) ) ( not ( = ?auto_332248 ?auto_332251 ) ) ( not ( = ?auto_332248 ?auto_332252 ) ) ( not ( = ?auto_332248 ?auto_332253 ) ) ( not ( = ?auto_332249 ?auto_332250 ) ) ( not ( = ?auto_332249 ?auto_332251 ) ) ( not ( = ?auto_332249 ?auto_332252 ) ) ( not ( = ?auto_332249 ?auto_332253 ) ) ( not ( = ?auto_332250 ?auto_332251 ) ) ( not ( = ?auto_332250 ?auto_332252 ) ) ( not ( = ?auto_332250 ?auto_332253 ) ) ( not ( = ?auto_332251 ?auto_332252 ) ) ( not ( = ?auto_332251 ?auto_332253 ) ) ( not ( = ?auto_332252 ?auto_332253 ) ) ( ON ?auto_332251 ?auto_332252 ) ( ON ?auto_332250 ?auto_332251 ) ( ON ?auto_332249 ?auto_332250 ) ( ON ?auto_332248 ?auto_332249 ) ( ON ?auto_332247 ?auto_332248 ) ( ON ?auto_332246 ?auto_332247 ) ( ON ?auto_332245 ?auto_332246 ) ( ON ?auto_332244 ?auto_332245 ) ( ON ?auto_332243 ?auto_332244 ) ( CLEAR ?auto_332243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_332243 )
      ( MAKE-10PILE ?auto_332243 ?auto_332244 ?auto_332245 ?auto_332246 ?auto_332247 ?auto_332248 ?auto_332249 ?auto_332250 ?auto_332251 ?auto_332252 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_332264 - BLOCK
      ?auto_332265 - BLOCK
      ?auto_332266 - BLOCK
      ?auto_332267 - BLOCK
      ?auto_332268 - BLOCK
      ?auto_332269 - BLOCK
      ?auto_332270 - BLOCK
      ?auto_332271 - BLOCK
      ?auto_332272 - BLOCK
      ?auto_332273 - BLOCK
    )
    :vars
    (
      ?auto_332274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332273 ?auto_332274 ) ( not ( = ?auto_332264 ?auto_332265 ) ) ( not ( = ?auto_332264 ?auto_332266 ) ) ( not ( = ?auto_332264 ?auto_332267 ) ) ( not ( = ?auto_332264 ?auto_332268 ) ) ( not ( = ?auto_332264 ?auto_332269 ) ) ( not ( = ?auto_332264 ?auto_332270 ) ) ( not ( = ?auto_332264 ?auto_332271 ) ) ( not ( = ?auto_332264 ?auto_332272 ) ) ( not ( = ?auto_332264 ?auto_332273 ) ) ( not ( = ?auto_332264 ?auto_332274 ) ) ( not ( = ?auto_332265 ?auto_332266 ) ) ( not ( = ?auto_332265 ?auto_332267 ) ) ( not ( = ?auto_332265 ?auto_332268 ) ) ( not ( = ?auto_332265 ?auto_332269 ) ) ( not ( = ?auto_332265 ?auto_332270 ) ) ( not ( = ?auto_332265 ?auto_332271 ) ) ( not ( = ?auto_332265 ?auto_332272 ) ) ( not ( = ?auto_332265 ?auto_332273 ) ) ( not ( = ?auto_332265 ?auto_332274 ) ) ( not ( = ?auto_332266 ?auto_332267 ) ) ( not ( = ?auto_332266 ?auto_332268 ) ) ( not ( = ?auto_332266 ?auto_332269 ) ) ( not ( = ?auto_332266 ?auto_332270 ) ) ( not ( = ?auto_332266 ?auto_332271 ) ) ( not ( = ?auto_332266 ?auto_332272 ) ) ( not ( = ?auto_332266 ?auto_332273 ) ) ( not ( = ?auto_332266 ?auto_332274 ) ) ( not ( = ?auto_332267 ?auto_332268 ) ) ( not ( = ?auto_332267 ?auto_332269 ) ) ( not ( = ?auto_332267 ?auto_332270 ) ) ( not ( = ?auto_332267 ?auto_332271 ) ) ( not ( = ?auto_332267 ?auto_332272 ) ) ( not ( = ?auto_332267 ?auto_332273 ) ) ( not ( = ?auto_332267 ?auto_332274 ) ) ( not ( = ?auto_332268 ?auto_332269 ) ) ( not ( = ?auto_332268 ?auto_332270 ) ) ( not ( = ?auto_332268 ?auto_332271 ) ) ( not ( = ?auto_332268 ?auto_332272 ) ) ( not ( = ?auto_332268 ?auto_332273 ) ) ( not ( = ?auto_332268 ?auto_332274 ) ) ( not ( = ?auto_332269 ?auto_332270 ) ) ( not ( = ?auto_332269 ?auto_332271 ) ) ( not ( = ?auto_332269 ?auto_332272 ) ) ( not ( = ?auto_332269 ?auto_332273 ) ) ( not ( = ?auto_332269 ?auto_332274 ) ) ( not ( = ?auto_332270 ?auto_332271 ) ) ( not ( = ?auto_332270 ?auto_332272 ) ) ( not ( = ?auto_332270 ?auto_332273 ) ) ( not ( = ?auto_332270 ?auto_332274 ) ) ( not ( = ?auto_332271 ?auto_332272 ) ) ( not ( = ?auto_332271 ?auto_332273 ) ) ( not ( = ?auto_332271 ?auto_332274 ) ) ( not ( = ?auto_332272 ?auto_332273 ) ) ( not ( = ?auto_332272 ?auto_332274 ) ) ( not ( = ?auto_332273 ?auto_332274 ) ) ( ON ?auto_332272 ?auto_332273 ) ( ON ?auto_332271 ?auto_332272 ) ( ON ?auto_332270 ?auto_332271 ) ( ON ?auto_332269 ?auto_332270 ) ( ON ?auto_332268 ?auto_332269 ) ( ON ?auto_332267 ?auto_332268 ) ( ON ?auto_332266 ?auto_332267 ) ( ON ?auto_332265 ?auto_332266 ) ( ON ?auto_332264 ?auto_332265 ) ( CLEAR ?auto_332264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_332264 )
      ( MAKE-10PILE ?auto_332264 ?auto_332265 ?auto_332266 ?auto_332267 ?auto_332268 ?auto_332269 ?auto_332270 ?auto_332271 ?auto_332272 ?auto_332273 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332286 - BLOCK
      ?auto_332287 - BLOCK
      ?auto_332288 - BLOCK
      ?auto_332289 - BLOCK
      ?auto_332290 - BLOCK
      ?auto_332291 - BLOCK
      ?auto_332292 - BLOCK
      ?auto_332293 - BLOCK
      ?auto_332294 - BLOCK
      ?auto_332295 - BLOCK
      ?auto_332296 - BLOCK
    )
    :vars
    (
      ?auto_332297 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_332295 ) ( ON ?auto_332296 ?auto_332297 ) ( CLEAR ?auto_332296 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_332286 ) ( ON ?auto_332287 ?auto_332286 ) ( ON ?auto_332288 ?auto_332287 ) ( ON ?auto_332289 ?auto_332288 ) ( ON ?auto_332290 ?auto_332289 ) ( ON ?auto_332291 ?auto_332290 ) ( ON ?auto_332292 ?auto_332291 ) ( ON ?auto_332293 ?auto_332292 ) ( ON ?auto_332294 ?auto_332293 ) ( ON ?auto_332295 ?auto_332294 ) ( not ( = ?auto_332286 ?auto_332287 ) ) ( not ( = ?auto_332286 ?auto_332288 ) ) ( not ( = ?auto_332286 ?auto_332289 ) ) ( not ( = ?auto_332286 ?auto_332290 ) ) ( not ( = ?auto_332286 ?auto_332291 ) ) ( not ( = ?auto_332286 ?auto_332292 ) ) ( not ( = ?auto_332286 ?auto_332293 ) ) ( not ( = ?auto_332286 ?auto_332294 ) ) ( not ( = ?auto_332286 ?auto_332295 ) ) ( not ( = ?auto_332286 ?auto_332296 ) ) ( not ( = ?auto_332286 ?auto_332297 ) ) ( not ( = ?auto_332287 ?auto_332288 ) ) ( not ( = ?auto_332287 ?auto_332289 ) ) ( not ( = ?auto_332287 ?auto_332290 ) ) ( not ( = ?auto_332287 ?auto_332291 ) ) ( not ( = ?auto_332287 ?auto_332292 ) ) ( not ( = ?auto_332287 ?auto_332293 ) ) ( not ( = ?auto_332287 ?auto_332294 ) ) ( not ( = ?auto_332287 ?auto_332295 ) ) ( not ( = ?auto_332287 ?auto_332296 ) ) ( not ( = ?auto_332287 ?auto_332297 ) ) ( not ( = ?auto_332288 ?auto_332289 ) ) ( not ( = ?auto_332288 ?auto_332290 ) ) ( not ( = ?auto_332288 ?auto_332291 ) ) ( not ( = ?auto_332288 ?auto_332292 ) ) ( not ( = ?auto_332288 ?auto_332293 ) ) ( not ( = ?auto_332288 ?auto_332294 ) ) ( not ( = ?auto_332288 ?auto_332295 ) ) ( not ( = ?auto_332288 ?auto_332296 ) ) ( not ( = ?auto_332288 ?auto_332297 ) ) ( not ( = ?auto_332289 ?auto_332290 ) ) ( not ( = ?auto_332289 ?auto_332291 ) ) ( not ( = ?auto_332289 ?auto_332292 ) ) ( not ( = ?auto_332289 ?auto_332293 ) ) ( not ( = ?auto_332289 ?auto_332294 ) ) ( not ( = ?auto_332289 ?auto_332295 ) ) ( not ( = ?auto_332289 ?auto_332296 ) ) ( not ( = ?auto_332289 ?auto_332297 ) ) ( not ( = ?auto_332290 ?auto_332291 ) ) ( not ( = ?auto_332290 ?auto_332292 ) ) ( not ( = ?auto_332290 ?auto_332293 ) ) ( not ( = ?auto_332290 ?auto_332294 ) ) ( not ( = ?auto_332290 ?auto_332295 ) ) ( not ( = ?auto_332290 ?auto_332296 ) ) ( not ( = ?auto_332290 ?auto_332297 ) ) ( not ( = ?auto_332291 ?auto_332292 ) ) ( not ( = ?auto_332291 ?auto_332293 ) ) ( not ( = ?auto_332291 ?auto_332294 ) ) ( not ( = ?auto_332291 ?auto_332295 ) ) ( not ( = ?auto_332291 ?auto_332296 ) ) ( not ( = ?auto_332291 ?auto_332297 ) ) ( not ( = ?auto_332292 ?auto_332293 ) ) ( not ( = ?auto_332292 ?auto_332294 ) ) ( not ( = ?auto_332292 ?auto_332295 ) ) ( not ( = ?auto_332292 ?auto_332296 ) ) ( not ( = ?auto_332292 ?auto_332297 ) ) ( not ( = ?auto_332293 ?auto_332294 ) ) ( not ( = ?auto_332293 ?auto_332295 ) ) ( not ( = ?auto_332293 ?auto_332296 ) ) ( not ( = ?auto_332293 ?auto_332297 ) ) ( not ( = ?auto_332294 ?auto_332295 ) ) ( not ( = ?auto_332294 ?auto_332296 ) ) ( not ( = ?auto_332294 ?auto_332297 ) ) ( not ( = ?auto_332295 ?auto_332296 ) ) ( not ( = ?auto_332295 ?auto_332297 ) ) ( not ( = ?auto_332296 ?auto_332297 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_332296 ?auto_332297 )
      ( !STACK ?auto_332296 ?auto_332295 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332309 - BLOCK
      ?auto_332310 - BLOCK
      ?auto_332311 - BLOCK
      ?auto_332312 - BLOCK
      ?auto_332313 - BLOCK
      ?auto_332314 - BLOCK
      ?auto_332315 - BLOCK
      ?auto_332316 - BLOCK
      ?auto_332317 - BLOCK
      ?auto_332318 - BLOCK
      ?auto_332319 - BLOCK
    )
    :vars
    (
      ?auto_332320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_332318 ) ( ON ?auto_332319 ?auto_332320 ) ( CLEAR ?auto_332319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_332309 ) ( ON ?auto_332310 ?auto_332309 ) ( ON ?auto_332311 ?auto_332310 ) ( ON ?auto_332312 ?auto_332311 ) ( ON ?auto_332313 ?auto_332312 ) ( ON ?auto_332314 ?auto_332313 ) ( ON ?auto_332315 ?auto_332314 ) ( ON ?auto_332316 ?auto_332315 ) ( ON ?auto_332317 ?auto_332316 ) ( ON ?auto_332318 ?auto_332317 ) ( not ( = ?auto_332309 ?auto_332310 ) ) ( not ( = ?auto_332309 ?auto_332311 ) ) ( not ( = ?auto_332309 ?auto_332312 ) ) ( not ( = ?auto_332309 ?auto_332313 ) ) ( not ( = ?auto_332309 ?auto_332314 ) ) ( not ( = ?auto_332309 ?auto_332315 ) ) ( not ( = ?auto_332309 ?auto_332316 ) ) ( not ( = ?auto_332309 ?auto_332317 ) ) ( not ( = ?auto_332309 ?auto_332318 ) ) ( not ( = ?auto_332309 ?auto_332319 ) ) ( not ( = ?auto_332309 ?auto_332320 ) ) ( not ( = ?auto_332310 ?auto_332311 ) ) ( not ( = ?auto_332310 ?auto_332312 ) ) ( not ( = ?auto_332310 ?auto_332313 ) ) ( not ( = ?auto_332310 ?auto_332314 ) ) ( not ( = ?auto_332310 ?auto_332315 ) ) ( not ( = ?auto_332310 ?auto_332316 ) ) ( not ( = ?auto_332310 ?auto_332317 ) ) ( not ( = ?auto_332310 ?auto_332318 ) ) ( not ( = ?auto_332310 ?auto_332319 ) ) ( not ( = ?auto_332310 ?auto_332320 ) ) ( not ( = ?auto_332311 ?auto_332312 ) ) ( not ( = ?auto_332311 ?auto_332313 ) ) ( not ( = ?auto_332311 ?auto_332314 ) ) ( not ( = ?auto_332311 ?auto_332315 ) ) ( not ( = ?auto_332311 ?auto_332316 ) ) ( not ( = ?auto_332311 ?auto_332317 ) ) ( not ( = ?auto_332311 ?auto_332318 ) ) ( not ( = ?auto_332311 ?auto_332319 ) ) ( not ( = ?auto_332311 ?auto_332320 ) ) ( not ( = ?auto_332312 ?auto_332313 ) ) ( not ( = ?auto_332312 ?auto_332314 ) ) ( not ( = ?auto_332312 ?auto_332315 ) ) ( not ( = ?auto_332312 ?auto_332316 ) ) ( not ( = ?auto_332312 ?auto_332317 ) ) ( not ( = ?auto_332312 ?auto_332318 ) ) ( not ( = ?auto_332312 ?auto_332319 ) ) ( not ( = ?auto_332312 ?auto_332320 ) ) ( not ( = ?auto_332313 ?auto_332314 ) ) ( not ( = ?auto_332313 ?auto_332315 ) ) ( not ( = ?auto_332313 ?auto_332316 ) ) ( not ( = ?auto_332313 ?auto_332317 ) ) ( not ( = ?auto_332313 ?auto_332318 ) ) ( not ( = ?auto_332313 ?auto_332319 ) ) ( not ( = ?auto_332313 ?auto_332320 ) ) ( not ( = ?auto_332314 ?auto_332315 ) ) ( not ( = ?auto_332314 ?auto_332316 ) ) ( not ( = ?auto_332314 ?auto_332317 ) ) ( not ( = ?auto_332314 ?auto_332318 ) ) ( not ( = ?auto_332314 ?auto_332319 ) ) ( not ( = ?auto_332314 ?auto_332320 ) ) ( not ( = ?auto_332315 ?auto_332316 ) ) ( not ( = ?auto_332315 ?auto_332317 ) ) ( not ( = ?auto_332315 ?auto_332318 ) ) ( not ( = ?auto_332315 ?auto_332319 ) ) ( not ( = ?auto_332315 ?auto_332320 ) ) ( not ( = ?auto_332316 ?auto_332317 ) ) ( not ( = ?auto_332316 ?auto_332318 ) ) ( not ( = ?auto_332316 ?auto_332319 ) ) ( not ( = ?auto_332316 ?auto_332320 ) ) ( not ( = ?auto_332317 ?auto_332318 ) ) ( not ( = ?auto_332317 ?auto_332319 ) ) ( not ( = ?auto_332317 ?auto_332320 ) ) ( not ( = ?auto_332318 ?auto_332319 ) ) ( not ( = ?auto_332318 ?auto_332320 ) ) ( not ( = ?auto_332319 ?auto_332320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_332319 ?auto_332320 )
      ( !STACK ?auto_332319 ?auto_332318 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332332 - BLOCK
      ?auto_332333 - BLOCK
      ?auto_332334 - BLOCK
      ?auto_332335 - BLOCK
      ?auto_332336 - BLOCK
      ?auto_332337 - BLOCK
      ?auto_332338 - BLOCK
      ?auto_332339 - BLOCK
      ?auto_332340 - BLOCK
      ?auto_332341 - BLOCK
      ?auto_332342 - BLOCK
    )
    :vars
    (
      ?auto_332343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332342 ?auto_332343 ) ( ON-TABLE ?auto_332332 ) ( ON ?auto_332333 ?auto_332332 ) ( ON ?auto_332334 ?auto_332333 ) ( ON ?auto_332335 ?auto_332334 ) ( ON ?auto_332336 ?auto_332335 ) ( ON ?auto_332337 ?auto_332336 ) ( ON ?auto_332338 ?auto_332337 ) ( ON ?auto_332339 ?auto_332338 ) ( ON ?auto_332340 ?auto_332339 ) ( not ( = ?auto_332332 ?auto_332333 ) ) ( not ( = ?auto_332332 ?auto_332334 ) ) ( not ( = ?auto_332332 ?auto_332335 ) ) ( not ( = ?auto_332332 ?auto_332336 ) ) ( not ( = ?auto_332332 ?auto_332337 ) ) ( not ( = ?auto_332332 ?auto_332338 ) ) ( not ( = ?auto_332332 ?auto_332339 ) ) ( not ( = ?auto_332332 ?auto_332340 ) ) ( not ( = ?auto_332332 ?auto_332341 ) ) ( not ( = ?auto_332332 ?auto_332342 ) ) ( not ( = ?auto_332332 ?auto_332343 ) ) ( not ( = ?auto_332333 ?auto_332334 ) ) ( not ( = ?auto_332333 ?auto_332335 ) ) ( not ( = ?auto_332333 ?auto_332336 ) ) ( not ( = ?auto_332333 ?auto_332337 ) ) ( not ( = ?auto_332333 ?auto_332338 ) ) ( not ( = ?auto_332333 ?auto_332339 ) ) ( not ( = ?auto_332333 ?auto_332340 ) ) ( not ( = ?auto_332333 ?auto_332341 ) ) ( not ( = ?auto_332333 ?auto_332342 ) ) ( not ( = ?auto_332333 ?auto_332343 ) ) ( not ( = ?auto_332334 ?auto_332335 ) ) ( not ( = ?auto_332334 ?auto_332336 ) ) ( not ( = ?auto_332334 ?auto_332337 ) ) ( not ( = ?auto_332334 ?auto_332338 ) ) ( not ( = ?auto_332334 ?auto_332339 ) ) ( not ( = ?auto_332334 ?auto_332340 ) ) ( not ( = ?auto_332334 ?auto_332341 ) ) ( not ( = ?auto_332334 ?auto_332342 ) ) ( not ( = ?auto_332334 ?auto_332343 ) ) ( not ( = ?auto_332335 ?auto_332336 ) ) ( not ( = ?auto_332335 ?auto_332337 ) ) ( not ( = ?auto_332335 ?auto_332338 ) ) ( not ( = ?auto_332335 ?auto_332339 ) ) ( not ( = ?auto_332335 ?auto_332340 ) ) ( not ( = ?auto_332335 ?auto_332341 ) ) ( not ( = ?auto_332335 ?auto_332342 ) ) ( not ( = ?auto_332335 ?auto_332343 ) ) ( not ( = ?auto_332336 ?auto_332337 ) ) ( not ( = ?auto_332336 ?auto_332338 ) ) ( not ( = ?auto_332336 ?auto_332339 ) ) ( not ( = ?auto_332336 ?auto_332340 ) ) ( not ( = ?auto_332336 ?auto_332341 ) ) ( not ( = ?auto_332336 ?auto_332342 ) ) ( not ( = ?auto_332336 ?auto_332343 ) ) ( not ( = ?auto_332337 ?auto_332338 ) ) ( not ( = ?auto_332337 ?auto_332339 ) ) ( not ( = ?auto_332337 ?auto_332340 ) ) ( not ( = ?auto_332337 ?auto_332341 ) ) ( not ( = ?auto_332337 ?auto_332342 ) ) ( not ( = ?auto_332337 ?auto_332343 ) ) ( not ( = ?auto_332338 ?auto_332339 ) ) ( not ( = ?auto_332338 ?auto_332340 ) ) ( not ( = ?auto_332338 ?auto_332341 ) ) ( not ( = ?auto_332338 ?auto_332342 ) ) ( not ( = ?auto_332338 ?auto_332343 ) ) ( not ( = ?auto_332339 ?auto_332340 ) ) ( not ( = ?auto_332339 ?auto_332341 ) ) ( not ( = ?auto_332339 ?auto_332342 ) ) ( not ( = ?auto_332339 ?auto_332343 ) ) ( not ( = ?auto_332340 ?auto_332341 ) ) ( not ( = ?auto_332340 ?auto_332342 ) ) ( not ( = ?auto_332340 ?auto_332343 ) ) ( not ( = ?auto_332341 ?auto_332342 ) ) ( not ( = ?auto_332341 ?auto_332343 ) ) ( not ( = ?auto_332342 ?auto_332343 ) ) ( CLEAR ?auto_332340 ) ( ON ?auto_332341 ?auto_332342 ) ( CLEAR ?auto_332341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_332332 ?auto_332333 ?auto_332334 ?auto_332335 ?auto_332336 ?auto_332337 ?auto_332338 ?auto_332339 ?auto_332340 ?auto_332341 )
      ( MAKE-11PILE ?auto_332332 ?auto_332333 ?auto_332334 ?auto_332335 ?auto_332336 ?auto_332337 ?auto_332338 ?auto_332339 ?auto_332340 ?auto_332341 ?auto_332342 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332355 - BLOCK
      ?auto_332356 - BLOCK
      ?auto_332357 - BLOCK
      ?auto_332358 - BLOCK
      ?auto_332359 - BLOCK
      ?auto_332360 - BLOCK
      ?auto_332361 - BLOCK
      ?auto_332362 - BLOCK
      ?auto_332363 - BLOCK
      ?auto_332364 - BLOCK
      ?auto_332365 - BLOCK
    )
    :vars
    (
      ?auto_332366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332365 ?auto_332366 ) ( ON-TABLE ?auto_332355 ) ( ON ?auto_332356 ?auto_332355 ) ( ON ?auto_332357 ?auto_332356 ) ( ON ?auto_332358 ?auto_332357 ) ( ON ?auto_332359 ?auto_332358 ) ( ON ?auto_332360 ?auto_332359 ) ( ON ?auto_332361 ?auto_332360 ) ( ON ?auto_332362 ?auto_332361 ) ( ON ?auto_332363 ?auto_332362 ) ( not ( = ?auto_332355 ?auto_332356 ) ) ( not ( = ?auto_332355 ?auto_332357 ) ) ( not ( = ?auto_332355 ?auto_332358 ) ) ( not ( = ?auto_332355 ?auto_332359 ) ) ( not ( = ?auto_332355 ?auto_332360 ) ) ( not ( = ?auto_332355 ?auto_332361 ) ) ( not ( = ?auto_332355 ?auto_332362 ) ) ( not ( = ?auto_332355 ?auto_332363 ) ) ( not ( = ?auto_332355 ?auto_332364 ) ) ( not ( = ?auto_332355 ?auto_332365 ) ) ( not ( = ?auto_332355 ?auto_332366 ) ) ( not ( = ?auto_332356 ?auto_332357 ) ) ( not ( = ?auto_332356 ?auto_332358 ) ) ( not ( = ?auto_332356 ?auto_332359 ) ) ( not ( = ?auto_332356 ?auto_332360 ) ) ( not ( = ?auto_332356 ?auto_332361 ) ) ( not ( = ?auto_332356 ?auto_332362 ) ) ( not ( = ?auto_332356 ?auto_332363 ) ) ( not ( = ?auto_332356 ?auto_332364 ) ) ( not ( = ?auto_332356 ?auto_332365 ) ) ( not ( = ?auto_332356 ?auto_332366 ) ) ( not ( = ?auto_332357 ?auto_332358 ) ) ( not ( = ?auto_332357 ?auto_332359 ) ) ( not ( = ?auto_332357 ?auto_332360 ) ) ( not ( = ?auto_332357 ?auto_332361 ) ) ( not ( = ?auto_332357 ?auto_332362 ) ) ( not ( = ?auto_332357 ?auto_332363 ) ) ( not ( = ?auto_332357 ?auto_332364 ) ) ( not ( = ?auto_332357 ?auto_332365 ) ) ( not ( = ?auto_332357 ?auto_332366 ) ) ( not ( = ?auto_332358 ?auto_332359 ) ) ( not ( = ?auto_332358 ?auto_332360 ) ) ( not ( = ?auto_332358 ?auto_332361 ) ) ( not ( = ?auto_332358 ?auto_332362 ) ) ( not ( = ?auto_332358 ?auto_332363 ) ) ( not ( = ?auto_332358 ?auto_332364 ) ) ( not ( = ?auto_332358 ?auto_332365 ) ) ( not ( = ?auto_332358 ?auto_332366 ) ) ( not ( = ?auto_332359 ?auto_332360 ) ) ( not ( = ?auto_332359 ?auto_332361 ) ) ( not ( = ?auto_332359 ?auto_332362 ) ) ( not ( = ?auto_332359 ?auto_332363 ) ) ( not ( = ?auto_332359 ?auto_332364 ) ) ( not ( = ?auto_332359 ?auto_332365 ) ) ( not ( = ?auto_332359 ?auto_332366 ) ) ( not ( = ?auto_332360 ?auto_332361 ) ) ( not ( = ?auto_332360 ?auto_332362 ) ) ( not ( = ?auto_332360 ?auto_332363 ) ) ( not ( = ?auto_332360 ?auto_332364 ) ) ( not ( = ?auto_332360 ?auto_332365 ) ) ( not ( = ?auto_332360 ?auto_332366 ) ) ( not ( = ?auto_332361 ?auto_332362 ) ) ( not ( = ?auto_332361 ?auto_332363 ) ) ( not ( = ?auto_332361 ?auto_332364 ) ) ( not ( = ?auto_332361 ?auto_332365 ) ) ( not ( = ?auto_332361 ?auto_332366 ) ) ( not ( = ?auto_332362 ?auto_332363 ) ) ( not ( = ?auto_332362 ?auto_332364 ) ) ( not ( = ?auto_332362 ?auto_332365 ) ) ( not ( = ?auto_332362 ?auto_332366 ) ) ( not ( = ?auto_332363 ?auto_332364 ) ) ( not ( = ?auto_332363 ?auto_332365 ) ) ( not ( = ?auto_332363 ?auto_332366 ) ) ( not ( = ?auto_332364 ?auto_332365 ) ) ( not ( = ?auto_332364 ?auto_332366 ) ) ( not ( = ?auto_332365 ?auto_332366 ) ) ( CLEAR ?auto_332363 ) ( ON ?auto_332364 ?auto_332365 ) ( CLEAR ?auto_332364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_332355 ?auto_332356 ?auto_332357 ?auto_332358 ?auto_332359 ?auto_332360 ?auto_332361 ?auto_332362 ?auto_332363 ?auto_332364 )
      ( MAKE-11PILE ?auto_332355 ?auto_332356 ?auto_332357 ?auto_332358 ?auto_332359 ?auto_332360 ?auto_332361 ?auto_332362 ?auto_332363 ?auto_332364 ?auto_332365 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332378 - BLOCK
      ?auto_332379 - BLOCK
      ?auto_332380 - BLOCK
      ?auto_332381 - BLOCK
      ?auto_332382 - BLOCK
      ?auto_332383 - BLOCK
      ?auto_332384 - BLOCK
      ?auto_332385 - BLOCK
      ?auto_332386 - BLOCK
      ?auto_332387 - BLOCK
      ?auto_332388 - BLOCK
    )
    :vars
    (
      ?auto_332389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332388 ?auto_332389 ) ( ON-TABLE ?auto_332378 ) ( ON ?auto_332379 ?auto_332378 ) ( ON ?auto_332380 ?auto_332379 ) ( ON ?auto_332381 ?auto_332380 ) ( ON ?auto_332382 ?auto_332381 ) ( ON ?auto_332383 ?auto_332382 ) ( ON ?auto_332384 ?auto_332383 ) ( ON ?auto_332385 ?auto_332384 ) ( not ( = ?auto_332378 ?auto_332379 ) ) ( not ( = ?auto_332378 ?auto_332380 ) ) ( not ( = ?auto_332378 ?auto_332381 ) ) ( not ( = ?auto_332378 ?auto_332382 ) ) ( not ( = ?auto_332378 ?auto_332383 ) ) ( not ( = ?auto_332378 ?auto_332384 ) ) ( not ( = ?auto_332378 ?auto_332385 ) ) ( not ( = ?auto_332378 ?auto_332386 ) ) ( not ( = ?auto_332378 ?auto_332387 ) ) ( not ( = ?auto_332378 ?auto_332388 ) ) ( not ( = ?auto_332378 ?auto_332389 ) ) ( not ( = ?auto_332379 ?auto_332380 ) ) ( not ( = ?auto_332379 ?auto_332381 ) ) ( not ( = ?auto_332379 ?auto_332382 ) ) ( not ( = ?auto_332379 ?auto_332383 ) ) ( not ( = ?auto_332379 ?auto_332384 ) ) ( not ( = ?auto_332379 ?auto_332385 ) ) ( not ( = ?auto_332379 ?auto_332386 ) ) ( not ( = ?auto_332379 ?auto_332387 ) ) ( not ( = ?auto_332379 ?auto_332388 ) ) ( not ( = ?auto_332379 ?auto_332389 ) ) ( not ( = ?auto_332380 ?auto_332381 ) ) ( not ( = ?auto_332380 ?auto_332382 ) ) ( not ( = ?auto_332380 ?auto_332383 ) ) ( not ( = ?auto_332380 ?auto_332384 ) ) ( not ( = ?auto_332380 ?auto_332385 ) ) ( not ( = ?auto_332380 ?auto_332386 ) ) ( not ( = ?auto_332380 ?auto_332387 ) ) ( not ( = ?auto_332380 ?auto_332388 ) ) ( not ( = ?auto_332380 ?auto_332389 ) ) ( not ( = ?auto_332381 ?auto_332382 ) ) ( not ( = ?auto_332381 ?auto_332383 ) ) ( not ( = ?auto_332381 ?auto_332384 ) ) ( not ( = ?auto_332381 ?auto_332385 ) ) ( not ( = ?auto_332381 ?auto_332386 ) ) ( not ( = ?auto_332381 ?auto_332387 ) ) ( not ( = ?auto_332381 ?auto_332388 ) ) ( not ( = ?auto_332381 ?auto_332389 ) ) ( not ( = ?auto_332382 ?auto_332383 ) ) ( not ( = ?auto_332382 ?auto_332384 ) ) ( not ( = ?auto_332382 ?auto_332385 ) ) ( not ( = ?auto_332382 ?auto_332386 ) ) ( not ( = ?auto_332382 ?auto_332387 ) ) ( not ( = ?auto_332382 ?auto_332388 ) ) ( not ( = ?auto_332382 ?auto_332389 ) ) ( not ( = ?auto_332383 ?auto_332384 ) ) ( not ( = ?auto_332383 ?auto_332385 ) ) ( not ( = ?auto_332383 ?auto_332386 ) ) ( not ( = ?auto_332383 ?auto_332387 ) ) ( not ( = ?auto_332383 ?auto_332388 ) ) ( not ( = ?auto_332383 ?auto_332389 ) ) ( not ( = ?auto_332384 ?auto_332385 ) ) ( not ( = ?auto_332384 ?auto_332386 ) ) ( not ( = ?auto_332384 ?auto_332387 ) ) ( not ( = ?auto_332384 ?auto_332388 ) ) ( not ( = ?auto_332384 ?auto_332389 ) ) ( not ( = ?auto_332385 ?auto_332386 ) ) ( not ( = ?auto_332385 ?auto_332387 ) ) ( not ( = ?auto_332385 ?auto_332388 ) ) ( not ( = ?auto_332385 ?auto_332389 ) ) ( not ( = ?auto_332386 ?auto_332387 ) ) ( not ( = ?auto_332386 ?auto_332388 ) ) ( not ( = ?auto_332386 ?auto_332389 ) ) ( not ( = ?auto_332387 ?auto_332388 ) ) ( not ( = ?auto_332387 ?auto_332389 ) ) ( not ( = ?auto_332388 ?auto_332389 ) ) ( ON ?auto_332387 ?auto_332388 ) ( CLEAR ?auto_332385 ) ( ON ?auto_332386 ?auto_332387 ) ( CLEAR ?auto_332386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_332378 ?auto_332379 ?auto_332380 ?auto_332381 ?auto_332382 ?auto_332383 ?auto_332384 ?auto_332385 ?auto_332386 )
      ( MAKE-11PILE ?auto_332378 ?auto_332379 ?auto_332380 ?auto_332381 ?auto_332382 ?auto_332383 ?auto_332384 ?auto_332385 ?auto_332386 ?auto_332387 ?auto_332388 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332401 - BLOCK
      ?auto_332402 - BLOCK
      ?auto_332403 - BLOCK
      ?auto_332404 - BLOCK
      ?auto_332405 - BLOCK
      ?auto_332406 - BLOCK
      ?auto_332407 - BLOCK
      ?auto_332408 - BLOCK
      ?auto_332409 - BLOCK
      ?auto_332410 - BLOCK
      ?auto_332411 - BLOCK
    )
    :vars
    (
      ?auto_332412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332411 ?auto_332412 ) ( ON-TABLE ?auto_332401 ) ( ON ?auto_332402 ?auto_332401 ) ( ON ?auto_332403 ?auto_332402 ) ( ON ?auto_332404 ?auto_332403 ) ( ON ?auto_332405 ?auto_332404 ) ( ON ?auto_332406 ?auto_332405 ) ( ON ?auto_332407 ?auto_332406 ) ( ON ?auto_332408 ?auto_332407 ) ( not ( = ?auto_332401 ?auto_332402 ) ) ( not ( = ?auto_332401 ?auto_332403 ) ) ( not ( = ?auto_332401 ?auto_332404 ) ) ( not ( = ?auto_332401 ?auto_332405 ) ) ( not ( = ?auto_332401 ?auto_332406 ) ) ( not ( = ?auto_332401 ?auto_332407 ) ) ( not ( = ?auto_332401 ?auto_332408 ) ) ( not ( = ?auto_332401 ?auto_332409 ) ) ( not ( = ?auto_332401 ?auto_332410 ) ) ( not ( = ?auto_332401 ?auto_332411 ) ) ( not ( = ?auto_332401 ?auto_332412 ) ) ( not ( = ?auto_332402 ?auto_332403 ) ) ( not ( = ?auto_332402 ?auto_332404 ) ) ( not ( = ?auto_332402 ?auto_332405 ) ) ( not ( = ?auto_332402 ?auto_332406 ) ) ( not ( = ?auto_332402 ?auto_332407 ) ) ( not ( = ?auto_332402 ?auto_332408 ) ) ( not ( = ?auto_332402 ?auto_332409 ) ) ( not ( = ?auto_332402 ?auto_332410 ) ) ( not ( = ?auto_332402 ?auto_332411 ) ) ( not ( = ?auto_332402 ?auto_332412 ) ) ( not ( = ?auto_332403 ?auto_332404 ) ) ( not ( = ?auto_332403 ?auto_332405 ) ) ( not ( = ?auto_332403 ?auto_332406 ) ) ( not ( = ?auto_332403 ?auto_332407 ) ) ( not ( = ?auto_332403 ?auto_332408 ) ) ( not ( = ?auto_332403 ?auto_332409 ) ) ( not ( = ?auto_332403 ?auto_332410 ) ) ( not ( = ?auto_332403 ?auto_332411 ) ) ( not ( = ?auto_332403 ?auto_332412 ) ) ( not ( = ?auto_332404 ?auto_332405 ) ) ( not ( = ?auto_332404 ?auto_332406 ) ) ( not ( = ?auto_332404 ?auto_332407 ) ) ( not ( = ?auto_332404 ?auto_332408 ) ) ( not ( = ?auto_332404 ?auto_332409 ) ) ( not ( = ?auto_332404 ?auto_332410 ) ) ( not ( = ?auto_332404 ?auto_332411 ) ) ( not ( = ?auto_332404 ?auto_332412 ) ) ( not ( = ?auto_332405 ?auto_332406 ) ) ( not ( = ?auto_332405 ?auto_332407 ) ) ( not ( = ?auto_332405 ?auto_332408 ) ) ( not ( = ?auto_332405 ?auto_332409 ) ) ( not ( = ?auto_332405 ?auto_332410 ) ) ( not ( = ?auto_332405 ?auto_332411 ) ) ( not ( = ?auto_332405 ?auto_332412 ) ) ( not ( = ?auto_332406 ?auto_332407 ) ) ( not ( = ?auto_332406 ?auto_332408 ) ) ( not ( = ?auto_332406 ?auto_332409 ) ) ( not ( = ?auto_332406 ?auto_332410 ) ) ( not ( = ?auto_332406 ?auto_332411 ) ) ( not ( = ?auto_332406 ?auto_332412 ) ) ( not ( = ?auto_332407 ?auto_332408 ) ) ( not ( = ?auto_332407 ?auto_332409 ) ) ( not ( = ?auto_332407 ?auto_332410 ) ) ( not ( = ?auto_332407 ?auto_332411 ) ) ( not ( = ?auto_332407 ?auto_332412 ) ) ( not ( = ?auto_332408 ?auto_332409 ) ) ( not ( = ?auto_332408 ?auto_332410 ) ) ( not ( = ?auto_332408 ?auto_332411 ) ) ( not ( = ?auto_332408 ?auto_332412 ) ) ( not ( = ?auto_332409 ?auto_332410 ) ) ( not ( = ?auto_332409 ?auto_332411 ) ) ( not ( = ?auto_332409 ?auto_332412 ) ) ( not ( = ?auto_332410 ?auto_332411 ) ) ( not ( = ?auto_332410 ?auto_332412 ) ) ( not ( = ?auto_332411 ?auto_332412 ) ) ( ON ?auto_332410 ?auto_332411 ) ( CLEAR ?auto_332408 ) ( ON ?auto_332409 ?auto_332410 ) ( CLEAR ?auto_332409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_332401 ?auto_332402 ?auto_332403 ?auto_332404 ?auto_332405 ?auto_332406 ?auto_332407 ?auto_332408 ?auto_332409 )
      ( MAKE-11PILE ?auto_332401 ?auto_332402 ?auto_332403 ?auto_332404 ?auto_332405 ?auto_332406 ?auto_332407 ?auto_332408 ?auto_332409 ?auto_332410 ?auto_332411 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332424 - BLOCK
      ?auto_332425 - BLOCK
      ?auto_332426 - BLOCK
      ?auto_332427 - BLOCK
      ?auto_332428 - BLOCK
      ?auto_332429 - BLOCK
      ?auto_332430 - BLOCK
      ?auto_332431 - BLOCK
      ?auto_332432 - BLOCK
      ?auto_332433 - BLOCK
      ?auto_332434 - BLOCK
    )
    :vars
    (
      ?auto_332435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332434 ?auto_332435 ) ( ON-TABLE ?auto_332424 ) ( ON ?auto_332425 ?auto_332424 ) ( ON ?auto_332426 ?auto_332425 ) ( ON ?auto_332427 ?auto_332426 ) ( ON ?auto_332428 ?auto_332427 ) ( ON ?auto_332429 ?auto_332428 ) ( ON ?auto_332430 ?auto_332429 ) ( not ( = ?auto_332424 ?auto_332425 ) ) ( not ( = ?auto_332424 ?auto_332426 ) ) ( not ( = ?auto_332424 ?auto_332427 ) ) ( not ( = ?auto_332424 ?auto_332428 ) ) ( not ( = ?auto_332424 ?auto_332429 ) ) ( not ( = ?auto_332424 ?auto_332430 ) ) ( not ( = ?auto_332424 ?auto_332431 ) ) ( not ( = ?auto_332424 ?auto_332432 ) ) ( not ( = ?auto_332424 ?auto_332433 ) ) ( not ( = ?auto_332424 ?auto_332434 ) ) ( not ( = ?auto_332424 ?auto_332435 ) ) ( not ( = ?auto_332425 ?auto_332426 ) ) ( not ( = ?auto_332425 ?auto_332427 ) ) ( not ( = ?auto_332425 ?auto_332428 ) ) ( not ( = ?auto_332425 ?auto_332429 ) ) ( not ( = ?auto_332425 ?auto_332430 ) ) ( not ( = ?auto_332425 ?auto_332431 ) ) ( not ( = ?auto_332425 ?auto_332432 ) ) ( not ( = ?auto_332425 ?auto_332433 ) ) ( not ( = ?auto_332425 ?auto_332434 ) ) ( not ( = ?auto_332425 ?auto_332435 ) ) ( not ( = ?auto_332426 ?auto_332427 ) ) ( not ( = ?auto_332426 ?auto_332428 ) ) ( not ( = ?auto_332426 ?auto_332429 ) ) ( not ( = ?auto_332426 ?auto_332430 ) ) ( not ( = ?auto_332426 ?auto_332431 ) ) ( not ( = ?auto_332426 ?auto_332432 ) ) ( not ( = ?auto_332426 ?auto_332433 ) ) ( not ( = ?auto_332426 ?auto_332434 ) ) ( not ( = ?auto_332426 ?auto_332435 ) ) ( not ( = ?auto_332427 ?auto_332428 ) ) ( not ( = ?auto_332427 ?auto_332429 ) ) ( not ( = ?auto_332427 ?auto_332430 ) ) ( not ( = ?auto_332427 ?auto_332431 ) ) ( not ( = ?auto_332427 ?auto_332432 ) ) ( not ( = ?auto_332427 ?auto_332433 ) ) ( not ( = ?auto_332427 ?auto_332434 ) ) ( not ( = ?auto_332427 ?auto_332435 ) ) ( not ( = ?auto_332428 ?auto_332429 ) ) ( not ( = ?auto_332428 ?auto_332430 ) ) ( not ( = ?auto_332428 ?auto_332431 ) ) ( not ( = ?auto_332428 ?auto_332432 ) ) ( not ( = ?auto_332428 ?auto_332433 ) ) ( not ( = ?auto_332428 ?auto_332434 ) ) ( not ( = ?auto_332428 ?auto_332435 ) ) ( not ( = ?auto_332429 ?auto_332430 ) ) ( not ( = ?auto_332429 ?auto_332431 ) ) ( not ( = ?auto_332429 ?auto_332432 ) ) ( not ( = ?auto_332429 ?auto_332433 ) ) ( not ( = ?auto_332429 ?auto_332434 ) ) ( not ( = ?auto_332429 ?auto_332435 ) ) ( not ( = ?auto_332430 ?auto_332431 ) ) ( not ( = ?auto_332430 ?auto_332432 ) ) ( not ( = ?auto_332430 ?auto_332433 ) ) ( not ( = ?auto_332430 ?auto_332434 ) ) ( not ( = ?auto_332430 ?auto_332435 ) ) ( not ( = ?auto_332431 ?auto_332432 ) ) ( not ( = ?auto_332431 ?auto_332433 ) ) ( not ( = ?auto_332431 ?auto_332434 ) ) ( not ( = ?auto_332431 ?auto_332435 ) ) ( not ( = ?auto_332432 ?auto_332433 ) ) ( not ( = ?auto_332432 ?auto_332434 ) ) ( not ( = ?auto_332432 ?auto_332435 ) ) ( not ( = ?auto_332433 ?auto_332434 ) ) ( not ( = ?auto_332433 ?auto_332435 ) ) ( not ( = ?auto_332434 ?auto_332435 ) ) ( ON ?auto_332433 ?auto_332434 ) ( ON ?auto_332432 ?auto_332433 ) ( CLEAR ?auto_332430 ) ( ON ?auto_332431 ?auto_332432 ) ( CLEAR ?auto_332431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_332424 ?auto_332425 ?auto_332426 ?auto_332427 ?auto_332428 ?auto_332429 ?auto_332430 ?auto_332431 )
      ( MAKE-11PILE ?auto_332424 ?auto_332425 ?auto_332426 ?auto_332427 ?auto_332428 ?auto_332429 ?auto_332430 ?auto_332431 ?auto_332432 ?auto_332433 ?auto_332434 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332447 - BLOCK
      ?auto_332448 - BLOCK
      ?auto_332449 - BLOCK
      ?auto_332450 - BLOCK
      ?auto_332451 - BLOCK
      ?auto_332452 - BLOCK
      ?auto_332453 - BLOCK
      ?auto_332454 - BLOCK
      ?auto_332455 - BLOCK
      ?auto_332456 - BLOCK
      ?auto_332457 - BLOCK
    )
    :vars
    (
      ?auto_332458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332457 ?auto_332458 ) ( ON-TABLE ?auto_332447 ) ( ON ?auto_332448 ?auto_332447 ) ( ON ?auto_332449 ?auto_332448 ) ( ON ?auto_332450 ?auto_332449 ) ( ON ?auto_332451 ?auto_332450 ) ( ON ?auto_332452 ?auto_332451 ) ( ON ?auto_332453 ?auto_332452 ) ( not ( = ?auto_332447 ?auto_332448 ) ) ( not ( = ?auto_332447 ?auto_332449 ) ) ( not ( = ?auto_332447 ?auto_332450 ) ) ( not ( = ?auto_332447 ?auto_332451 ) ) ( not ( = ?auto_332447 ?auto_332452 ) ) ( not ( = ?auto_332447 ?auto_332453 ) ) ( not ( = ?auto_332447 ?auto_332454 ) ) ( not ( = ?auto_332447 ?auto_332455 ) ) ( not ( = ?auto_332447 ?auto_332456 ) ) ( not ( = ?auto_332447 ?auto_332457 ) ) ( not ( = ?auto_332447 ?auto_332458 ) ) ( not ( = ?auto_332448 ?auto_332449 ) ) ( not ( = ?auto_332448 ?auto_332450 ) ) ( not ( = ?auto_332448 ?auto_332451 ) ) ( not ( = ?auto_332448 ?auto_332452 ) ) ( not ( = ?auto_332448 ?auto_332453 ) ) ( not ( = ?auto_332448 ?auto_332454 ) ) ( not ( = ?auto_332448 ?auto_332455 ) ) ( not ( = ?auto_332448 ?auto_332456 ) ) ( not ( = ?auto_332448 ?auto_332457 ) ) ( not ( = ?auto_332448 ?auto_332458 ) ) ( not ( = ?auto_332449 ?auto_332450 ) ) ( not ( = ?auto_332449 ?auto_332451 ) ) ( not ( = ?auto_332449 ?auto_332452 ) ) ( not ( = ?auto_332449 ?auto_332453 ) ) ( not ( = ?auto_332449 ?auto_332454 ) ) ( not ( = ?auto_332449 ?auto_332455 ) ) ( not ( = ?auto_332449 ?auto_332456 ) ) ( not ( = ?auto_332449 ?auto_332457 ) ) ( not ( = ?auto_332449 ?auto_332458 ) ) ( not ( = ?auto_332450 ?auto_332451 ) ) ( not ( = ?auto_332450 ?auto_332452 ) ) ( not ( = ?auto_332450 ?auto_332453 ) ) ( not ( = ?auto_332450 ?auto_332454 ) ) ( not ( = ?auto_332450 ?auto_332455 ) ) ( not ( = ?auto_332450 ?auto_332456 ) ) ( not ( = ?auto_332450 ?auto_332457 ) ) ( not ( = ?auto_332450 ?auto_332458 ) ) ( not ( = ?auto_332451 ?auto_332452 ) ) ( not ( = ?auto_332451 ?auto_332453 ) ) ( not ( = ?auto_332451 ?auto_332454 ) ) ( not ( = ?auto_332451 ?auto_332455 ) ) ( not ( = ?auto_332451 ?auto_332456 ) ) ( not ( = ?auto_332451 ?auto_332457 ) ) ( not ( = ?auto_332451 ?auto_332458 ) ) ( not ( = ?auto_332452 ?auto_332453 ) ) ( not ( = ?auto_332452 ?auto_332454 ) ) ( not ( = ?auto_332452 ?auto_332455 ) ) ( not ( = ?auto_332452 ?auto_332456 ) ) ( not ( = ?auto_332452 ?auto_332457 ) ) ( not ( = ?auto_332452 ?auto_332458 ) ) ( not ( = ?auto_332453 ?auto_332454 ) ) ( not ( = ?auto_332453 ?auto_332455 ) ) ( not ( = ?auto_332453 ?auto_332456 ) ) ( not ( = ?auto_332453 ?auto_332457 ) ) ( not ( = ?auto_332453 ?auto_332458 ) ) ( not ( = ?auto_332454 ?auto_332455 ) ) ( not ( = ?auto_332454 ?auto_332456 ) ) ( not ( = ?auto_332454 ?auto_332457 ) ) ( not ( = ?auto_332454 ?auto_332458 ) ) ( not ( = ?auto_332455 ?auto_332456 ) ) ( not ( = ?auto_332455 ?auto_332457 ) ) ( not ( = ?auto_332455 ?auto_332458 ) ) ( not ( = ?auto_332456 ?auto_332457 ) ) ( not ( = ?auto_332456 ?auto_332458 ) ) ( not ( = ?auto_332457 ?auto_332458 ) ) ( ON ?auto_332456 ?auto_332457 ) ( ON ?auto_332455 ?auto_332456 ) ( CLEAR ?auto_332453 ) ( ON ?auto_332454 ?auto_332455 ) ( CLEAR ?auto_332454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_332447 ?auto_332448 ?auto_332449 ?auto_332450 ?auto_332451 ?auto_332452 ?auto_332453 ?auto_332454 )
      ( MAKE-11PILE ?auto_332447 ?auto_332448 ?auto_332449 ?auto_332450 ?auto_332451 ?auto_332452 ?auto_332453 ?auto_332454 ?auto_332455 ?auto_332456 ?auto_332457 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332470 - BLOCK
      ?auto_332471 - BLOCK
      ?auto_332472 - BLOCK
      ?auto_332473 - BLOCK
      ?auto_332474 - BLOCK
      ?auto_332475 - BLOCK
      ?auto_332476 - BLOCK
      ?auto_332477 - BLOCK
      ?auto_332478 - BLOCK
      ?auto_332479 - BLOCK
      ?auto_332480 - BLOCK
    )
    :vars
    (
      ?auto_332481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332480 ?auto_332481 ) ( ON-TABLE ?auto_332470 ) ( ON ?auto_332471 ?auto_332470 ) ( ON ?auto_332472 ?auto_332471 ) ( ON ?auto_332473 ?auto_332472 ) ( ON ?auto_332474 ?auto_332473 ) ( ON ?auto_332475 ?auto_332474 ) ( not ( = ?auto_332470 ?auto_332471 ) ) ( not ( = ?auto_332470 ?auto_332472 ) ) ( not ( = ?auto_332470 ?auto_332473 ) ) ( not ( = ?auto_332470 ?auto_332474 ) ) ( not ( = ?auto_332470 ?auto_332475 ) ) ( not ( = ?auto_332470 ?auto_332476 ) ) ( not ( = ?auto_332470 ?auto_332477 ) ) ( not ( = ?auto_332470 ?auto_332478 ) ) ( not ( = ?auto_332470 ?auto_332479 ) ) ( not ( = ?auto_332470 ?auto_332480 ) ) ( not ( = ?auto_332470 ?auto_332481 ) ) ( not ( = ?auto_332471 ?auto_332472 ) ) ( not ( = ?auto_332471 ?auto_332473 ) ) ( not ( = ?auto_332471 ?auto_332474 ) ) ( not ( = ?auto_332471 ?auto_332475 ) ) ( not ( = ?auto_332471 ?auto_332476 ) ) ( not ( = ?auto_332471 ?auto_332477 ) ) ( not ( = ?auto_332471 ?auto_332478 ) ) ( not ( = ?auto_332471 ?auto_332479 ) ) ( not ( = ?auto_332471 ?auto_332480 ) ) ( not ( = ?auto_332471 ?auto_332481 ) ) ( not ( = ?auto_332472 ?auto_332473 ) ) ( not ( = ?auto_332472 ?auto_332474 ) ) ( not ( = ?auto_332472 ?auto_332475 ) ) ( not ( = ?auto_332472 ?auto_332476 ) ) ( not ( = ?auto_332472 ?auto_332477 ) ) ( not ( = ?auto_332472 ?auto_332478 ) ) ( not ( = ?auto_332472 ?auto_332479 ) ) ( not ( = ?auto_332472 ?auto_332480 ) ) ( not ( = ?auto_332472 ?auto_332481 ) ) ( not ( = ?auto_332473 ?auto_332474 ) ) ( not ( = ?auto_332473 ?auto_332475 ) ) ( not ( = ?auto_332473 ?auto_332476 ) ) ( not ( = ?auto_332473 ?auto_332477 ) ) ( not ( = ?auto_332473 ?auto_332478 ) ) ( not ( = ?auto_332473 ?auto_332479 ) ) ( not ( = ?auto_332473 ?auto_332480 ) ) ( not ( = ?auto_332473 ?auto_332481 ) ) ( not ( = ?auto_332474 ?auto_332475 ) ) ( not ( = ?auto_332474 ?auto_332476 ) ) ( not ( = ?auto_332474 ?auto_332477 ) ) ( not ( = ?auto_332474 ?auto_332478 ) ) ( not ( = ?auto_332474 ?auto_332479 ) ) ( not ( = ?auto_332474 ?auto_332480 ) ) ( not ( = ?auto_332474 ?auto_332481 ) ) ( not ( = ?auto_332475 ?auto_332476 ) ) ( not ( = ?auto_332475 ?auto_332477 ) ) ( not ( = ?auto_332475 ?auto_332478 ) ) ( not ( = ?auto_332475 ?auto_332479 ) ) ( not ( = ?auto_332475 ?auto_332480 ) ) ( not ( = ?auto_332475 ?auto_332481 ) ) ( not ( = ?auto_332476 ?auto_332477 ) ) ( not ( = ?auto_332476 ?auto_332478 ) ) ( not ( = ?auto_332476 ?auto_332479 ) ) ( not ( = ?auto_332476 ?auto_332480 ) ) ( not ( = ?auto_332476 ?auto_332481 ) ) ( not ( = ?auto_332477 ?auto_332478 ) ) ( not ( = ?auto_332477 ?auto_332479 ) ) ( not ( = ?auto_332477 ?auto_332480 ) ) ( not ( = ?auto_332477 ?auto_332481 ) ) ( not ( = ?auto_332478 ?auto_332479 ) ) ( not ( = ?auto_332478 ?auto_332480 ) ) ( not ( = ?auto_332478 ?auto_332481 ) ) ( not ( = ?auto_332479 ?auto_332480 ) ) ( not ( = ?auto_332479 ?auto_332481 ) ) ( not ( = ?auto_332480 ?auto_332481 ) ) ( ON ?auto_332479 ?auto_332480 ) ( ON ?auto_332478 ?auto_332479 ) ( ON ?auto_332477 ?auto_332478 ) ( CLEAR ?auto_332475 ) ( ON ?auto_332476 ?auto_332477 ) ( CLEAR ?auto_332476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_332470 ?auto_332471 ?auto_332472 ?auto_332473 ?auto_332474 ?auto_332475 ?auto_332476 )
      ( MAKE-11PILE ?auto_332470 ?auto_332471 ?auto_332472 ?auto_332473 ?auto_332474 ?auto_332475 ?auto_332476 ?auto_332477 ?auto_332478 ?auto_332479 ?auto_332480 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332493 - BLOCK
      ?auto_332494 - BLOCK
      ?auto_332495 - BLOCK
      ?auto_332496 - BLOCK
      ?auto_332497 - BLOCK
      ?auto_332498 - BLOCK
      ?auto_332499 - BLOCK
      ?auto_332500 - BLOCK
      ?auto_332501 - BLOCK
      ?auto_332502 - BLOCK
      ?auto_332503 - BLOCK
    )
    :vars
    (
      ?auto_332504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332503 ?auto_332504 ) ( ON-TABLE ?auto_332493 ) ( ON ?auto_332494 ?auto_332493 ) ( ON ?auto_332495 ?auto_332494 ) ( ON ?auto_332496 ?auto_332495 ) ( ON ?auto_332497 ?auto_332496 ) ( ON ?auto_332498 ?auto_332497 ) ( not ( = ?auto_332493 ?auto_332494 ) ) ( not ( = ?auto_332493 ?auto_332495 ) ) ( not ( = ?auto_332493 ?auto_332496 ) ) ( not ( = ?auto_332493 ?auto_332497 ) ) ( not ( = ?auto_332493 ?auto_332498 ) ) ( not ( = ?auto_332493 ?auto_332499 ) ) ( not ( = ?auto_332493 ?auto_332500 ) ) ( not ( = ?auto_332493 ?auto_332501 ) ) ( not ( = ?auto_332493 ?auto_332502 ) ) ( not ( = ?auto_332493 ?auto_332503 ) ) ( not ( = ?auto_332493 ?auto_332504 ) ) ( not ( = ?auto_332494 ?auto_332495 ) ) ( not ( = ?auto_332494 ?auto_332496 ) ) ( not ( = ?auto_332494 ?auto_332497 ) ) ( not ( = ?auto_332494 ?auto_332498 ) ) ( not ( = ?auto_332494 ?auto_332499 ) ) ( not ( = ?auto_332494 ?auto_332500 ) ) ( not ( = ?auto_332494 ?auto_332501 ) ) ( not ( = ?auto_332494 ?auto_332502 ) ) ( not ( = ?auto_332494 ?auto_332503 ) ) ( not ( = ?auto_332494 ?auto_332504 ) ) ( not ( = ?auto_332495 ?auto_332496 ) ) ( not ( = ?auto_332495 ?auto_332497 ) ) ( not ( = ?auto_332495 ?auto_332498 ) ) ( not ( = ?auto_332495 ?auto_332499 ) ) ( not ( = ?auto_332495 ?auto_332500 ) ) ( not ( = ?auto_332495 ?auto_332501 ) ) ( not ( = ?auto_332495 ?auto_332502 ) ) ( not ( = ?auto_332495 ?auto_332503 ) ) ( not ( = ?auto_332495 ?auto_332504 ) ) ( not ( = ?auto_332496 ?auto_332497 ) ) ( not ( = ?auto_332496 ?auto_332498 ) ) ( not ( = ?auto_332496 ?auto_332499 ) ) ( not ( = ?auto_332496 ?auto_332500 ) ) ( not ( = ?auto_332496 ?auto_332501 ) ) ( not ( = ?auto_332496 ?auto_332502 ) ) ( not ( = ?auto_332496 ?auto_332503 ) ) ( not ( = ?auto_332496 ?auto_332504 ) ) ( not ( = ?auto_332497 ?auto_332498 ) ) ( not ( = ?auto_332497 ?auto_332499 ) ) ( not ( = ?auto_332497 ?auto_332500 ) ) ( not ( = ?auto_332497 ?auto_332501 ) ) ( not ( = ?auto_332497 ?auto_332502 ) ) ( not ( = ?auto_332497 ?auto_332503 ) ) ( not ( = ?auto_332497 ?auto_332504 ) ) ( not ( = ?auto_332498 ?auto_332499 ) ) ( not ( = ?auto_332498 ?auto_332500 ) ) ( not ( = ?auto_332498 ?auto_332501 ) ) ( not ( = ?auto_332498 ?auto_332502 ) ) ( not ( = ?auto_332498 ?auto_332503 ) ) ( not ( = ?auto_332498 ?auto_332504 ) ) ( not ( = ?auto_332499 ?auto_332500 ) ) ( not ( = ?auto_332499 ?auto_332501 ) ) ( not ( = ?auto_332499 ?auto_332502 ) ) ( not ( = ?auto_332499 ?auto_332503 ) ) ( not ( = ?auto_332499 ?auto_332504 ) ) ( not ( = ?auto_332500 ?auto_332501 ) ) ( not ( = ?auto_332500 ?auto_332502 ) ) ( not ( = ?auto_332500 ?auto_332503 ) ) ( not ( = ?auto_332500 ?auto_332504 ) ) ( not ( = ?auto_332501 ?auto_332502 ) ) ( not ( = ?auto_332501 ?auto_332503 ) ) ( not ( = ?auto_332501 ?auto_332504 ) ) ( not ( = ?auto_332502 ?auto_332503 ) ) ( not ( = ?auto_332502 ?auto_332504 ) ) ( not ( = ?auto_332503 ?auto_332504 ) ) ( ON ?auto_332502 ?auto_332503 ) ( ON ?auto_332501 ?auto_332502 ) ( ON ?auto_332500 ?auto_332501 ) ( CLEAR ?auto_332498 ) ( ON ?auto_332499 ?auto_332500 ) ( CLEAR ?auto_332499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_332493 ?auto_332494 ?auto_332495 ?auto_332496 ?auto_332497 ?auto_332498 ?auto_332499 )
      ( MAKE-11PILE ?auto_332493 ?auto_332494 ?auto_332495 ?auto_332496 ?auto_332497 ?auto_332498 ?auto_332499 ?auto_332500 ?auto_332501 ?auto_332502 ?auto_332503 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332516 - BLOCK
      ?auto_332517 - BLOCK
      ?auto_332518 - BLOCK
      ?auto_332519 - BLOCK
      ?auto_332520 - BLOCK
      ?auto_332521 - BLOCK
      ?auto_332522 - BLOCK
      ?auto_332523 - BLOCK
      ?auto_332524 - BLOCK
      ?auto_332525 - BLOCK
      ?auto_332526 - BLOCK
    )
    :vars
    (
      ?auto_332527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332526 ?auto_332527 ) ( ON-TABLE ?auto_332516 ) ( ON ?auto_332517 ?auto_332516 ) ( ON ?auto_332518 ?auto_332517 ) ( ON ?auto_332519 ?auto_332518 ) ( ON ?auto_332520 ?auto_332519 ) ( not ( = ?auto_332516 ?auto_332517 ) ) ( not ( = ?auto_332516 ?auto_332518 ) ) ( not ( = ?auto_332516 ?auto_332519 ) ) ( not ( = ?auto_332516 ?auto_332520 ) ) ( not ( = ?auto_332516 ?auto_332521 ) ) ( not ( = ?auto_332516 ?auto_332522 ) ) ( not ( = ?auto_332516 ?auto_332523 ) ) ( not ( = ?auto_332516 ?auto_332524 ) ) ( not ( = ?auto_332516 ?auto_332525 ) ) ( not ( = ?auto_332516 ?auto_332526 ) ) ( not ( = ?auto_332516 ?auto_332527 ) ) ( not ( = ?auto_332517 ?auto_332518 ) ) ( not ( = ?auto_332517 ?auto_332519 ) ) ( not ( = ?auto_332517 ?auto_332520 ) ) ( not ( = ?auto_332517 ?auto_332521 ) ) ( not ( = ?auto_332517 ?auto_332522 ) ) ( not ( = ?auto_332517 ?auto_332523 ) ) ( not ( = ?auto_332517 ?auto_332524 ) ) ( not ( = ?auto_332517 ?auto_332525 ) ) ( not ( = ?auto_332517 ?auto_332526 ) ) ( not ( = ?auto_332517 ?auto_332527 ) ) ( not ( = ?auto_332518 ?auto_332519 ) ) ( not ( = ?auto_332518 ?auto_332520 ) ) ( not ( = ?auto_332518 ?auto_332521 ) ) ( not ( = ?auto_332518 ?auto_332522 ) ) ( not ( = ?auto_332518 ?auto_332523 ) ) ( not ( = ?auto_332518 ?auto_332524 ) ) ( not ( = ?auto_332518 ?auto_332525 ) ) ( not ( = ?auto_332518 ?auto_332526 ) ) ( not ( = ?auto_332518 ?auto_332527 ) ) ( not ( = ?auto_332519 ?auto_332520 ) ) ( not ( = ?auto_332519 ?auto_332521 ) ) ( not ( = ?auto_332519 ?auto_332522 ) ) ( not ( = ?auto_332519 ?auto_332523 ) ) ( not ( = ?auto_332519 ?auto_332524 ) ) ( not ( = ?auto_332519 ?auto_332525 ) ) ( not ( = ?auto_332519 ?auto_332526 ) ) ( not ( = ?auto_332519 ?auto_332527 ) ) ( not ( = ?auto_332520 ?auto_332521 ) ) ( not ( = ?auto_332520 ?auto_332522 ) ) ( not ( = ?auto_332520 ?auto_332523 ) ) ( not ( = ?auto_332520 ?auto_332524 ) ) ( not ( = ?auto_332520 ?auto_332525 ) ) ( not ( = ?auto_332520 ?auto_332526 ) ) ( not ( = ?auto_332520 ?auto_332527 ) ) ( not ( = ?auto_332521 ?auto_332522 ) ) ( not ( = ?auto_332521 ?auto_332523 ) ) ( not ( = ?auto_332521 ?auto_332524 ) ) ( not ( = ?auto_332521 ?auto_332525 ) ) ( not ( = ?auto_332521 ?auto_332526 ) ) ( not ( = ?auto_332521 ?auto_332527 ) ) ( not ( = ?auto_332522 ?auto_332523 ) ) ( not ( = ?auto_332522 ?auto_332524 ) ) ( not ( = ?auto_332522 ?auto_332525 ) ) ( not ( = ?auto_332522 ?auto_332526 ) ) ( not ( = ?auto_332522 ?auto_332527 ) ) ( not ( = ?auto_332523 ?auto_332524 ) ) ( not ( = ?auto_332523 ?auto_332525 ) ) ( not ( = ?auto_332523 ?auto_332526 ) ) ( not ( = ?auto_332523 ?auto_332527 ) ) ( not ( = ?auto_332524 ?auto_332525 ) ) ( not ( = ?auto_332524 ?auto_332526 ) ) ( not ( = ?auto_332524 ?auto_332527 ) ) ( not ( = ?auto_332525 ?auto_332526 ) ) ( not ( = ?auto_332525 ?auto_332527 ) ) ( not ( = ?auto_332526 ?auto_332527 ) ) ( ON ?auto_332525 ?auto_332526 ) ( ON ?auto_332524 ?auto_332525 ) ( ON ?auto_332523 ?auto_332524 ) ( ON ?auto_332522 ?auto_332523 ) ( CLEAR ?auto_332520 ) ( ON ?auto_332521 ?auto_332522 ) ( CLEAR ?auto_332521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_332516 ?auto_332517 ?auto_332518 ?auto_332519 ?auto_332520 ?auto_332521 )
      ( MAKE-11PILE ?auto_332516 ?auto_332517 ?auto_332518 ?auto_332519 ?auto_332520 ?auto_332521 ?auto_332522 ?auto_332523 ?auto_332524 ?auto_332525 ?auto_332526 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332539 - BLOCK
      ?auto_332540 - BLOCK
      ?auto_332541 - BLOCK
      ?auto_332542 - BLOCK
      ?auto_332543 - BLOCK
      ?auto_332544 - BLOCK
      ?auto_332545 - BLOCK
      ?auto_332546 - BLOCK
      ?auto_332547 - BLOCK
      ?auto_332548 - BLOCK
      ?auto_332549 - BLOCK
    )
    :vars
    (
      ?auto_332550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332549 ?auto_332550 ) ( ON-TABLE ?auto_332539 ) ( ON ?auto_332540 ?auto_332539 ) ( ON ?auto_332541 ?auto_332540 ) ( ON ?auto_332542 ?auto_332541 ) ( ON ?auto_332543 ?auto_332542 ) ( not ( = ?auto_332539 ?auto_332540 ) ) ( not ( = ?auto_332539 ?auto_332541 ) ) ( not ( = ?auto_332539 ?auto_332542 ) ) ( not ( = ?auto_332539 ?auto_332543 ) ) ( not ( = ?auto_332539 ?auto_332544 ) ) ( not ( = ?auto_332539 ?auto_332545 ) ) ( not ( = ?auto_332539 ?auto_332546 ) ) ( not ( = ?auto_332539 ?auto_332547 ) ) ( not ( = ?auto_332539 ?auto_332548 ) ) ( not ( = ?auto_332539 ?auto_332549 ) ) ( not ( = ?auto_332539 ?auto_332550 ) ) ( not ( = ?auto_332540 ?auto_332541 ) ) ( not ( = ?auto_332540 ?auto_332542 ) ) ( not ( = ?auto_332540 ?auto_332543 ) ) ( not ( = ?auto_332540 ?auto_332544 ) ) ( not ( = ?auto_332540 ?auto_332545 ) ) ( not ( = ?auto_332540 ?auto_332546 ) ) ( not ( = ?auto_332540 ?auto_332547 ) ) ( not ( = ?auto_332540 ?auto_332548 ) ) ( not ( = ?auto_332540 ?auto_332549 ) ) ( not ( = ?auto_332540 ?auto_332550 ) ) ( not ( = ?auto_332541 ?auto_332542 ) ) ( not ( = ?auto_332541 ?auto_332543 ) ) ( not ( = ?auto_332541 ?auto_332544 ) ) ( not ( = ?auto_332541 ?auto_332545 ) ) ( not ( = ?auto_332541 ?auto_332546 ) ) ( not ( = ?auto_332541 ?auto_332547 ) ) ( not ( = ?auto_332541 ?auto_332548 ) ) ( not ( = ?auto_332541 ?auto_332549 ) ) ( not ( = ?auto_332541 ?auto_332550 ) ) ( not ( = ?auto_332542 ?auto_332543 ) ) ( not ( = ?auto_332542 ?auto_332544 ) ) ( not ( = ?auto_332542 ?auto_332545 ) ) ( not ( = ?auto_332542 ?auto_332546 ) ) ( not ( = ?auto_332542 ?auto_332547 ) ) ( not ( = ?auto_332542 ?auto_332548 ) ) ( not ( = ?auto_332542 ?auto_332549 ) ) ( not ( = ?auto_332542 ?auto_332550 ) ) ( not ( = ?auto_332543 ?auto_332544 ) ) ( not ( = ?auto_332543 ?auto_332545 ) ) ( not ( = ?auto_332543 ?auto_332546 ) ) ( not ( = ?auto_332543 ?auto_332547 ) ) ( not ( = ?auto_332543 ?auto_332548 ) ) ( not ( = ?auto_332543 ?auto_332549 ) ) ( not ( = ?auto_332543 ?auto_332550 ) ) ( not ( = ?auto_332544 ?auto_332545 ) ) ( not ( = ?auto_332544 ?auto_332546 ) ) ( not ( = ?auto_332544 ?auto_332547 ) ) ( not ( = ?auto_332544 ?auto_332548 ) ) ( not ( = ?auto_332544 ?auto_332549 ) ) ( not ( = ?auto_332544 ?auto_332550 ) ) ( not ( = ?auto_332545 ?auto_332546 ) ) ( not ( = ?auto_332545 ?auto_332547 ) ) ( not ( = ?auto_332545 ?auto_332548 ) ) ( not ( = ?auto_332545 ?auto_332549 ) ) ( not ( = ?auto_332545 ?auto_332550 ) ) ( not ( = ?auto_332546 ?auto_332547 ) ) ( not ( = ?auto_332546 ?auto_332548 ) ) ( not ( = ?auto_332546 ?auto_332549 ) ) ( not ( = ?auto_332546 ?auto_332550 ) ) ( not ( = ?auto_332547 ?auto_332548 ) ) ( not ( = ?auto_332547 ?auto_332549 ) ) ( not ( = ?auto_332547 ?auto_332550 ) ) ( not ( = ?auto_332548 ?auto_332549 ) ) ( not ( = ?auto_332548 ?auto_332550 ) ) ( not ( = ?auto_332549 ?auto_332550 ) ) ( ON ?auto_332548 ?auto_332549 ) ( ON ?auto_332547 ?auto_332548 ) ( ON ?auto_332546 ?auto_332547 ) ( ON ?auto_332545 ?auto_332546 ) ( CLEAR ?auto_332543 ) ( ON ?auto_332544 ?auto_332545 ) ( CLEAR ?auto_332544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_332539 ?auto_332540 ?auto_332541 ?auto_332542 ?auto_332543 ?auto_332544 )
      ( MAKE-11PILE ?auto_332539 ?auto_332540 ?auto_332541 ?auto_332542 ?auto_332543 ?auto_332544 ?auto_332545 ?auto_332546 ?auto_332547 ?auto_332548 ?auto_332549 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332562 - BLOCK
      ?auto_332563 - BLOCK
      ?auto_332564 - BLOCK
      ?auto_332565 - BLOCK
      ?auto_332566 - BLOCK
      ?auto_332567 - BLOCK
      ?auto_332568 - BLOCK
      ?auto_332569 - BLOCK
      ?auto_332570 - BLOCK
      ?auto_332571 - BLOCK
      ?auto_332572 - BLOCK
    )
    :vars
    (
      ?auto_332573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332572 ?auto_332573 ) ( ON-TABLE ?auto_332562 ) ( ON ?auto_332563 ?auto_332562 ) ( ON ?auto_332564 ?auto_332563 ) ( ON ?auto_332565 ?auto_332564 ) ( not ( = ?auto_332562 ?auto_332563 ) ) ( not ( = ?auto_332562 ?auto_332564 ) ) ( not ( = ?auto_332562 ?auto_332565 ) ) ( not ( = ?auto_332562 ?auto_332566 ) ) ( not ( = ?auto_332562 ?auto_332567 ) ) ( not ( = ?auto_332562 ?auto_332568 ) ) ( not ( = ?auto_332562 ?auto_332569 ) ) ( not ( = ?auto_332562 ?auto_332570 ) ) ( not ( = ?auto_332562 ?auto_332571 ) ) ( not ( = ?auto_332562 ?auto_332572 ) ) ( not ( = ?auto_332562 ?auto_332573 ) ) ( not ( = ?auto_332563 ?auto_332564 ) ) ( not ( = ?auto_332563 ?auto_332565 ) ) ( not ( = ?auto_332563 ?auto_332566 ) ) ( not ( = ?auto_332563 ?auto_332567 ) ) ( not ( = ?auto_332563 ?auto_332568 ) ) ( not ( = ?auto_332563 ?auto_332569 ) ) ( not ( = ?auto_332563 ?auto_332570 ) ) ( not ( = ?auto_332563 ?auto_332571 ) ) ( not ( = ?auto_332563 ?auto_332572 ) ) ( not ( = ?auto_332563 ?auto_332573 ) ) ( not ( = ?auto_332564 ?auto_332565 ) ) ( not ( = ?auto_332564 ?auto_332566 ) ) ( not ( = ?auto_332564 ?auto_332567 ) ) ( not ( = ?auto_332564 ?auto_332568 ) ) ( not ( = ?auto_332564 ?auto_332569 ) ) ( not ( = ?auto_332564 ?auto_332570 ) ) ( not ( = ?auto_332564 ?auto_332571 ) ) ( not ( = ?auto_332564 ?auto_332572 ) ) ( not ( = ?auto_332564 ?auto_332573 ) ) ( not ( = ?auto_332565 ?auto_332566 ) ) ( not ( = ?auto_332565 ?auto_332567 ) ) ( not ( = ?auto_332565 ?auto_332568 ) ) ( not ( = ?auto_332565 ?auto_332569 ) ) ( not ( = ?auto_332565 ?auto_332570 ) ) ( not ( = ?auto_332565 ?auto_332571 ) ) ( not ( = ?auto_332565 ?auto_332572 ) ) ( not ( = ?auto_332565 ?auto_332573 ) ) ( not ( = ?auto_332566 ?auto_332567 ) ) ( not ( = ?auto_332566 ?auto_332568 ) ) ( not ( = ?auto_332566 ?auto_332569 ) ) ( not ( = ?auto_332566 ?auto_332570 ) ) ( not ( = ?auto_332566 ?auto_332571 ) ) ( not ( = ?auto_332566 ?auto_332572 ) ) ( not ( = ?auto_332566 ?auto_332573 ) ) ( not ( = ?auto_332567 ?auto_332568 ) ) ( not ( = ?auto_332567 ?auto_332569 ) ) ( not ( = ?auto_332567 ?auto_332570 ) ) ( not ( = ?auto_332567 ?auto_332571 ) ) ( not ( = ?auto_332567 ?auto_332572 ) ) ( not ( = ?auto_332567 ?auto_332573 ) ) ( not ( = ?auto_332568 ?auto_332569 ) ) ( not ( = ?auto_332568 ?auto_332570 ) ) ( not ( = ?auto_332568 ?auto_332571 ) ) ( not ( = ?auto_332568 ?auto_332572 ) ) ( not ( = ?auto_332568 ?auto_332573 ) ) ( not ( = ?auto_332569 ?auto_332570 ) ) ( not ( = ?auto_332569 ?auto_332571 ) ) ( not ( = ?auto_332569 ?auto_332572 ) ) ( not ( = ?auto_332569 ?auto_332573 ) ) ( not ( = ?auto_332570 ?auto_332571 ) ) ( not ( = ?auto_332570 ?auto_332572 ) ) ( not ( = ?auto_332570 ?auto_332573 ) ) ( not ( = ?auto_332571 ?auto_332572 ) ) ( not ( = ?auto_332571 ?auto_332573 ) ) ( not ( = ?auto_332572 ?auto_332573 ) ) ( ON ?auto_332571 ?auto_332572 ) ( ON ?auto_332570 ?auto_332571 ) ( ON ?auto_332569 ?auto_332570 ) ( ON ?auto_332568 ?auto_332569 ) ( ON ?auto_332567 ?auto_332568 ) ( CLEAR ?auto_332565 ) ( ON ?auto_332566 ?auto_332567 ) ( CLEAR ?auto_332566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_332562 ?auto_332563 ?auto_332564 ?auto_332565 ?auto_332566 )
      ( MAKE-11PILE ?auto_332562 ?auto_332563 ?auto_332564 ?auto_332565 ?auto_332566 ?auto_332567 ?auto_332568 ?auto_332569 ?auto_332570 ?auto_332571 ?auto_332572 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332585 - BLOCK
      ?auto_332586 - BLOCK
      ?auto_332587 - BLOCK
      ?auto_332588 - BLOCK
      ?auto_332589 - BLOCK
      ?auto_332590 - BLOCK
      ?auto_332591 - BLOCK
      ?auto_332592 - BLOCK
      ?auto_332593 - BLOCK
      ?auto_332594 - BLOCK
      ?auto_332595 - BLOCK
    )
    :vars
    (
      ?auto_332596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332595 ?auto_332596 ) ( ON-TABLE ?auto_332585 ) ( ON ?auto_332586 ?auto_332585 ) ( ON ?auto_332587 ?auto_332586 ) ( ON ?auto_332588 ?auto_332587 ) ( not ( = ?auto_332585 ?auto_332586 ) ) ( not ( = ?auto_332585 ?auto_332587 ) ) ( not ( = ?auto_332585 ?auto_332588 ) ) ( not ( = ?auto_332585 ?auto_332589 ) ) ( not ( = ?auto_332585 ?auto_332590 ) ) ( not ( = ?auto_332585 ?auto_332591 ) ) ( not ( = ?auto_332585 ?auto_332592 ) ) ( not ( = ?auto_332585 ?auto_332593 ) ) ( not ( = ?auto_332585 ?auto_332594 ) ) ( not ( = ?auto_332585 ?auto_332595 ) ) ( not ( = ?auto_332585 ?auto_332596 ) ) ( not ( = ?auto_332586 ?auto_332587 ) ) ( not ( = ?auto_332586 ?auto_332588 ) ) ( not ( = ?auto_332586 ?auto_332589 ) ) ( not ( = ?auto_332586 ?auto_332590 ) ) ( not ( = ?auto_332586 ?auto_332591 ) ) ( not ( = ?auto_332586 ?auto_332592 ) ) ( not ( = ?auto_332586 ?auto_332593 ) ) ( not ( = ?auto_332586 ?auto_332594 ) ) ( not ( = ?auto_332586 ?auto_332595 ) ) ( not ( = ?auto_332586 ?auto_332596 ) ) ( not ( = ?auto_332587 ?auto_332588 ) ) ( not ( = ?auto_332587 ?auto_332589 ) ) ( not ( = ?auto_332587 ?auto_332590 ) ) ( not ( = ?auto_332587 ?auto_332591 ) ) ( not ( = ?auto_332587 ?auto_332592 ) ) ( not ( = ?auto_332587 ?auto_332593 ) ) ( not ( = ?auto_332587 ?auto_332594 ) ) ( not ( = ?auto_332587 ?auto_332595 ) ) ( not ( = ?auto_332587 ?auto_332596 ) ) ( not ( = ?auto_332588 ?auto_332589 ) ) ( not ( = ?auto_332588 ?auto_332590 ) ) ( not ( = ?auto_332588 ?auto_332591 ) ) ( not ( = ?auto_332588 ?auto_332592 ) ) ( not ( = ?auto_332588 ?auto_332593 ) ) ( not ( = ?auto_332588 ?auto_332594 ) ) ( not ( = ?auto_332588 ?auto_332595 ) ) ( not ( = ?auto_332588 ?auto_332596 ) ) ( not ( = ?auto_332589 ?auto_332590 ) ) ( not ( = ?auto_332589 ?auto_332591 ) ) ( not ( = ?auto_332589 ?auto_332592 ) ) ( not ( = ?auto_332589 ?auto_332593 ) ) ( not ( = ?auto_332589 ?auto_332594 ) ) ( not ( = ?auto_332589 ?auto_332595 ) ) ( not ( = ?auto_332589 ?auto_332596 ) ) ( not ( = ?auto_332590 ?auto_332591 ) ) ( not ( = ?auto_332590 ?auto_332592 ) ) ( not ( = ?auto_332590 ?auto_332593 ) ) ( not ( = ?auto_332590 ?auto_332594 ) ) ( not ( = ?auto_332590 ?auto_332595 ) ) ( not ( = ?auto_332590 ?auto_332596 ) ) ( not ( = ?auto_332591 ?auto_332592 ) ) ( not ( = ?auto_332591 ?auto_332593 ) ) ( not ( = ?auto_332591 ?auto_332594 ) ) ( not ( = ?auto_332591 ?auto_332595 ) ) ( not ( = ?auto_332591 ?auto_332596 ) ) ( not ( = ?auto_332592 ?auto_332593 ) ) ( not ( = ?auto_332592 ?auto_332594 ) ) ( not ( = ?auto_332592 ?auto_332595 ) ) ( not ( = ?auto_332592 ?auto_332596 ) ) ( not ( = ?auto_332593 ?auto_332594 ) ) ( not ( = ?auto_332593 ?auto_332595 ) ) ( not ( = ?auto_332593 ?auto_332596 ) ) ( not ( = ?auto_332594 ?auto_332595 ) ) ( not ( = ?auto_332594 ?auto_332596 ) ) ( not ( = ?auto_332595 ?auto_332596 ) ) ( ON ?auto_332594 ?auto_332595 ) ( ON ?auto_332593 ?auto_332594 ) ( ON ?auto_332592 ?auto_332593 ) ( ON ?auto_332591 ?auto_332592 ) ( ON ?auto_332590 ?auto_332591 ) ( CLEAR ?auto_332588 ) ( ON ?auto_332589 ?auto_332590 ) ( CLEAR ?auto_332589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_332585 ?auto_332586 ?auto_332587 ?auto_332588 ?auto_332589 )
      ( MAKE-11PILE ?auto_332585 ?auto_332586 ?auto_332587 ?auto_332588 ?auto_332589 ?auto_332590 ?auto_332591 ?auto_332592 ?auto_332593 ?auto_332594 ?auto_332595 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332608 - BLOCK
      ?auto_332609 - BLOCK
      ?auto_332610 - BLOCK
      ?auto_332611 - BLOCK
      ?auto_332612 - BLOCK
      ?auto_332613 - BLOCK
      ?auto_332614 - BLOCK
      ?auto_332615 - BLOCK
      ?auto_332616 - BLOCK
      ?auto_332617 - BLOCK
      ?auto_332618 - BLOCK
    )
    :vars
    (
      ?auto_332619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332618 ?auto_332619 ) ( ON-TABLE ?auto_332608 ) ( ON ?auto_332609 ?auto_332608 ) ( ON ?auto_332610 ?auto_332609 ) ( not ( = ?auto_332608 ?auto_332609 ) ) ( not ( = ?auto_332608 ?auto_332610 ) ) ( not ( = ?auto_332608 ?auto_332611 ) ) ( not ( = ?auto_332608 ?auto_332612 ) ) ( not ( = ?auto_332608 ?auto_332613 ) ) ( not ( = ?auto_332608 ?auto_332614 ) ) ( not ( = ?auto_332608 ?auto_332615 ) ) ( not ( = ?auto_332608 ?auto_332616 ) ) ( not ( = ?auto_332608 ?auto_332617 ) ) ( not ( = ?auto_332608 ?auto_332618 ) ) ( not ( = ?auto_332608 ?auto_332619 ) ) ( not ( = ?auto_332609 ?auto_332610 ) ) ( not ( = ?auto_332609 ?auto_332611 ) ) ( not ( = ?auto_332609 ?auto_332612 ) ) ( not ( = ?auto_332609 ?auto_332613 ) ) ( not ( = ?auto_332609 ?auto_332614 ) ) ( not ( = ?auto_332609 ?auto_332615 ) ) ( not ( = ?auto_332609 ?auto_332616 ) ) ( not ( = ?auto_332609 ?auto_332617 ) ) ( not ( = ?auto_332609 ?auto_332618 ) ) ( not ( = ?auto_332609 ?auto_332619 ) ) ( not ( = ?auto_332610 ?auto_332611 ) ) ( not ( = ?auto_332610 ?auto_332612 ) ) ( not ( = ?auto_332610 ?auto_332613 ) ) ( not ( = ?auto_332610 ?auto_332614 ) ) ( not ( = ?auto_332610 ?auto_332615 ) ) ( not ( = ?auto_332610 ?auto_332616 ) ) ( not ( = ?auto_332610 ?auto_332617 ) ) ( not ( = ?auto_332610 ?auto_332618 ) ) ( not ( = ?auto_332610 ?auto_332619 ) ) ( not ( = ?auto_332611 ?auto_332612 ) ) ( not ( = ?auto_332611 ?auto_332613 ) ) ( not ( = ?auto_332611 ?auto_332614 ) ) ( not ( = ?auto_332611 ?auto_332615 ) ) ( not ( = ?auto_332611 ?auto_332616 ) ) ( not ( = ?auto_332611 ?auto_332617 ) ) ( not ( = ?auto_332611 ?auto_332618 ) ) ( not ( = ?auto_332611 ?auto_332619 ) ) ( not ( = ?auto_332612 ?auto_332613 ) ) ( not ( = ?auto_332612 ?auto_332614 ) ) ( not ( = ?auto_332612 ?auto_332615 ) ) ( not ( = ?auto_332612 ?auto_332616 ) ) ( not ( = ?auto_332612 ?auto_332617 ) ) ( not ( = ?auto_332612 ?auto_332618 ) ) ( not ( = ?auto_332612 ?auto_332619 ) ) ( not ( = ?auto_332613 ?auto_332614 ) ) ( not ( = ?auto_332613 ?auto_332615 ) ) ( not ( = ?auto_332613 ?auto_332616 ) ) ( not ( = ?auto_332613 ?auto_332617 ) ) ( not ( = ?auto_332613 ?auto_332618 ) ) ( not ( = ?auto_332613 ?auto_332619 ) ) ( not ( = ?auto_332614 ?auto_332615 ) ) ( not ( = ?auto_332614 ?auto_332616 ) ) ( not ( = ?auto_332614 ?auto_332617 ) ) ( not ( = ?auto_332614 ?auto_332618 ) ) ( not ( = ?auto_332614 ?auto_332619 ) ) ( not ( = ?auto_332615 ?auto_332616 ) ) ( not ( = ?auto_332615 ?auto_332617 ) ) ( not ( = ?auto_332615 ?auto_332618 ) ) ( not ( = ?auto_332615 ?auto_332619 ) ) ( not ( = ?auto_332616 ?auto_332617 ) ) ( not ( = ?auto_332616 ?auto_332618 ) ) ( not ( = ?auto_332616 ?auto_332619 ) ) ( not ( = ?auto_332617 ?auto_332618 ) ) ( not ( = ?auto_332617 ?auto_332619 ) ) ( not ( = ?auto_332618 ?auto_332619 ) ) ( ON ?auto_332617 ?auto_332618 ) ( ON ?auto_332616 ?auto_332617 ) ( ON ?auto_332615 ?auto_332616 ) ( ON ?auto_332614 ?auto_332615 ) ( ON ?auto_332613 ?auto_332614 ) ( ON ?auto_332612 ?auto_332613 ) ( CLEAR ?auto_332610 ) ( ON ?auto_332611 ?auto_332612 ) ( CLEAR ?auto_332611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_332608 ?auto_332609 ?auto_332610 ?auto_332611 )
      ( MAKE-11PILE ?auto_332608 ?auto_332609 ?auto_332610 ?auto_332611 ?auto_332612 ?auto_332613 ?auto_332614 ?auto_332615 ?auto_332616 ?auto_332617 ?auto_332618 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332631 - BLOCK
      ?auto_332632 - BLOCK
      ?auto_332633 - BLOCK
      ?auto_332634 - BLOCK
      ?auto_332635 - BLOCK
      ?auto_332636 - BLOCK
      ?auto_332637 - BLOCK
      ?auto_332638 - BLOCK
      ?auto_332639 - BLOCK
      ?auto_332640 - BLOCK
      ?auto_332641 - BLOCK
    )
    :vars
    (
      ?auto_332642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332641 ?auto_332642 ) ( ON-TABLE ?auto_332631 ) ( ON ?auto_332632 ?auto_332631 ) ( ON ?auto_332633 ?auto_332632 ) ( not ( = ?auto_332631 ?auto_332632 ) ) ( not ( = ?auto_332631 ?auto_332633 ) ) ( not ( = ?auto_332631 ?auto_332634 ) ) ( not ( = ?auto_332631 ?auto_332635 ) ) ( not ( = ?auto_332631 ?auto_332636 ) ) ( not ( = ?auto_332631 ?auto_332637 ) ) ( not ( = ?auto_332631 ?auto_332638 ) ) ( not ( = ?auto_332631 ?auto_332639 ) ) ( not ( = ?auto_332631 ?auto_332640 ) ) ( not ( = ?auto_332631 ?auto_332641 ) ) ( not ( = ?auto_332631 ?auto_332642 ) ) ( not ( = ?auto_332632 ?auto_332633 ) ) ( not ( = ?auto_332632 ?auto_332634 ) ) ( not ( = ?auto_332632 ?auto_332635 ) ) ( not ( = ?auto_332632 ?auto_332636 ) ) ( not ( = ?auto_332632 ?auto_332637 ) ) ( not ( = ?auto_332632 ?auto_332638 ) ) ( not ( = ?auto_332632 ?auto_332639 ) ) ( not ( = ?auto_332632 ?auto_332640 ) ) ( not ( = ?auto_332632 ?auto_332641 ) ) ( not ( = ?auto_332632 ?auto_332642 ) ) ( not ( = ?auto_332633 ?auto_332634 ) ) ( not ( = ?auto_332633 ?auto_332635 ) ) ( not ( = ?auto_332633 ?auto_332636 ) ) ( not ( = ?auto_332633 ?auto_332637 ) ) ( not ( = ?auto_332633 ?auto_332638 ) ) ( not ( = ?auto_332633 ?auto_332639 ) ) ( not ( = ?auto_332633 ?auto_332640 ) ) ( not ( = ?auto_332633 ?auto_332641 ) ) ( not ( = ?auto_332633 ?auto_332642 ) ) ( not ( = ?auto_332634 ?auto_332635 ) ) ( not ( = ?auto_332634 ?auto_332636 ) ) ( not ( = ?auto_332634 ?auto_332637 ) ) ( not ( = ?auto_332634 ?auto_332638 ) ) ( not ( = ?auto_332634 ?auto_332639 ) ) ( not ( = ?auto_332634 ?auto_332640 ) ) ( not ( = ?auto_332634 ?auto_332641 ) ) ( not ( = ?auto_332634 ?auto_332642 ) ) ( not ( = ?auto_332635 ?auto_332636 ) ) ( not ( = ?auto_332635 ?auto_332637 ) ) ( not ( = ?auto_332635 ?auto_332638 ) ) ( not ( = ?auto_332635 ?auto_332639 ) ) ( not ( = ?auto_332635 ?auto_332640 ) ) ( not ( = ?auto_332635 ?auto_332641 ) ) ( not ( = ?auto_332635 ?auto_332642 ) ) ( not ( = ?auto_332636 ?auto_332637 ) ) ( not ( = ?auto_332636 ?auto_332638 ) ) ( not ( = ?auto_332636 ?auto_332639 ) ) ( not ( = ?auto_332636 ?auto_332640 ) ) ( not ( = ?auto_332636 ?auto_332641 ) ) ( not ( = ?auto_332636 ?auto_332642 ) ) ( not ( = ?auto_332637 ?auto_332638 ) ) ( not ( = ?auto_332637 ?auto_332639 ) ) ( not ( = ?auto_332637 ?auto_332640 ) ) ( not ( = ?auto_332637 ?auto_332641 ) ) ( not ( = ?auto_332637 ?auto_332642 ) ) ( not ( = ?auto_332638 ?auto_332639 ) ) ( not ( = ?auto_332638 ?auto_332640 ) ) ( not ( = ?auto_332638 ?auto_332641 ) ) ( not ( = ?auto_332638 ?auto_332642 ) ) ( not ( = ?auto_332639 ?auto_332640 ) ) ( not ( = ?auto_332639 ?auto_332641 ) ) ( not ( = ?auto_332639 ?auto_332642 ) ) ( not ( = ?auto_332640 ?auto_332641 ) ) ( not ( = ?auto_332640 ?auto_332642 ) ) ( not ( = ?auto_332641 ?auto_332642 ) ) ( ON ?auto_332640 ?auto_332641 ) ( ON ?auto_332639 ?auto_332640 ) ( ON ?auto_332638 ?auto_332639 ) ( ON ?auto_332637 ?auto_332638 ) ( ON ?auto_332636 ?auto_332637 ) ( ON ?auto_332635 ?auto_332636 ) ( CLEAR ?auto_332633 ) ( ON ?auto_332634 ?auto_332635 ) ( CLEAR ?auto_332634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_332631 ?auto_332632 ?auto_332633 ?auto_332634 )
      ( MAKE-11PILE ?auto_332631 ?auto_332632 ?auto_332633 ?auto_332634 ?auto_332635 ?auto_332636 ?auto_332637 ?auto_332638 ?auto_332639 ?auto_332640 ?auto_332641 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332654 - BLOCK
      ?auto_332655 - BLOCK
      ?auto_332656 - BLOCK
      ?auto_332657 - BLOCK
      ?auto_332658 - BLOCK
      ?auto_332659 - BLOCK
      ?auto_332660 - BLOCK
      ?auto_332661 - BLOCK
      ?auto_332662 - BLOCK
      ?auto_332663 - BLOCK
      ?auto_332664 - BLOCK
    )
    :vars
    (
      ?auto_332665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332664 ?auto_332665 ) ( ON-TABLE ?auto_332654 ) ( ON ?auto_332655 ?auto_332654 ) ( not ( = ?auto_332654 ?auto_332655 ) ) ( not ( = ?auto_332654 ?auto_332656 ) ) ( not ( = ?auto_332654 ?auto_332657 ) ) ( not ( = ?auto_332654 ?auto_332658 ) ) ( not ( = ?auto_332654 ?auto_332659 ) ) ( not ( = ?auto_332654 ?auto_332660 ) ) ( not ( = ?auto_332654 ?auto_332661 ) ) ( not ( = ?auto_332654 ?auto_332662 ) ) ( not ( = ?auto_332654 ?auto_332663 ) ) ( not ( = ?auto_332654 ?auto_332664 ) ) ( not ( = ?auto_332654 ?auto_332665 ) ) ( not ( = ?auto_332655 ?auto_332656 ) ) ( not ( = ?auto_332655 ?auto_332657 ) ) ( not ( = ?auto_332655 ?auto_332658 ) ) ( not ( = ?auto_332655 ?auto_332659 ) ) ( not ( = ?auto_332655 ?auto_332660 ) ) ( not ( = ?auto_332655 ?auto_332661 ) ) ( not ( = ?auto_332655 ?auto_332662 ) ) ( not ( = ?auto_332655 ?auto_332663 ) ) ( not ( = ?auto_332655 ?auto_332664 ) ) ( not ( = ?auto_332655 ?auto_332665 ) ) ( not ( = ?auto_332656 ?auto_332657 ) ) ( not ( = ?auto_332656 ?auto_332658 ) ) ( not ( = ?auto_332656 ?auto_332659 ) ) ( not ( = ?auto_332656 ?auto_332660 ) ) ( not ( = ?auto_332656 ?auto_332661 ) ) ( not ( = ?auto_332656 ?auto_332662 ) ) ( not ( = ?auto_332656 ?auto_332663 ) ) ( not ( = ?auto_332656 ?auto_332664 ) ) ( not ( = ?auto_332656 ?auto_332665 ) ) ( not ( = ?auto_332657 ?auto_332658 ) ) ( not ( = ?auto_332657 ?auto_332659 ) ) ( not ( = ?auto_332657 ?auto_332660 ) ) ( not ( = ?auto_332657 ?auto_332661 ) ) ( not ( = ?auto_332657 ?auto_332662 ) ) ( not ( = ?auto_332657 ?auto_332663 ) ) ( not ( = ?auto_332657 ?auto_332664 ) ) ( not ( = ?auto_332657 ?auto_332665 ) ) ( not ( = ?auto_332658 ?auto_332659 ) ) ( not ( = ?auto_332658 ?auto_332660 ) ) ( not ( = ?auto_332658 ?auto_332661 ) ) ( not ( = ?auto_332658 ?auto_332662 ) ) ( not ( = ?auto_332658 ?auto_332663 ) ) ( not ( = ?auto_332658 ?auto_332664 ) ) ( not ( = ?auto_332658 ?auto_332665 ) ) ( not ( = ?auto_332659 ?auto_332660 ) ) ( not ( = ?auto_332659 ?auto_332661 ) ) ( not ( = ?auto_332659 ?auto_332662 ) ) ( not ( = ?auto_332659 ?auto_332663 ) ) ( not ( = ?auto_332659 ?auto_332664 ) ) ( not ( = ?auto_332659 ?auto_332665 ) ) ( not ( = ?auto_332660 ?auto_332661 ) ) ( not ( = ?auto_332660 ?auto_332662 ) ) ( not ( = ?auto_332660 ?auto_332663 ) ) ( not ( = ?auto_332660 ?auto_332664 ) ) ( not ( = ?auto_332660 ?auto_332665 ) ) ( not ( = ?auto_332661 ?auto_332662 ) ) ( not ( = ?auto_332661 ?auto_332663 ) ) ( not ( = ?auto_332661 ?auto_332664 ) ) ( not ( = ?auto_332661 ?auto_332665 ) ) ( not ( = ?auto_332662 ?auto_332663 ) ) ( not ( = ?auto_332662 ?auto_332664 ) ) ( not ( = ?auto_332662 ?auto_332665 ) ) ( not ( = ?auto_332663 ?auto_332664 ) ) ( not ( = ?auto_332663 ?auto_332665 ) ) ( not ( = ?auto_332664 ?auto_332665 ) ) ( ON ?auto_332663 ?auto_332664 ) ( ON ?auto_332662 ?auto_332663 ) ( ON ?auto_332661 ?auto_332662 ) ( ON ?auto_332660 ?auto_332661 ) ( ON ?auto_332659 ?auto_332660 ) ( ON ?auto_332658 ?auto_332659 ) ( ON ?auto_332657 ?auto_332658 ) ( CLEAR ?auto_332655 ) ( ON ?auto_332656 ?auto_332657 ) ( CLEAR ?auto_332656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_332654 ?auto_332655 ?auto_332656 )
      ( MAKE-11PILE ?auto_332654 ?auto_332655 ?auto_332656 ?auto_332657 ?auto_332658 ?auto_332659 ?auto_332660 ?auto_332661 ?auto_332662 ?auto_332663 ?auto_332664 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332677 - BLOCK
      ?auto_332678 - BLOCK
      ?auto_332679 - BLOCK
      ?auto_332680 - BLOCK
      ?auto_332681 - BLOCK
      ?auto_332682 - BLOCK
      ?auto_332683 - BLOCK
      ?auto_332684 - BLOCK
      ?auto_332685 - BLOCK
      ?auto_332686 - BLOCK
      ?auto_332687 - BLOCK
    )
    :vars
    (
      ?auto_332688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332687 ?auto_332688 ) ( ON-TABLE ?auto_332677 ) ( ON ?auto_332678 ?auto_332677 ) ( not ( = ?auto_332677 ?auto_332678 ) ) ( not ( = ?auto_332677 ?auto_332679 ) ) ( not ( = ?auto_332677 ?auto_332680 ) ) ( not ( = ?auto_332677 ?auto_332681 ) ) ( not ( = ?auto_332677 ?auto_332682 ) ) ( not ( = ?auto_332677 ?auto_332683 ) ) ( not ( = ?auto_332677 ?auto_332684 ) ) ( not ( = ?auto_332677 ?auto_332685 ) ) ( not ( = ?auto_332677 ?auto_332686 ) ) ( not ( = ?auto_332677 ?auto_332687 ) ) ( not ( = ?auto_332677 ?auto_332688 ) ) ( not ( = ?auto_332678 ?auto_332679 ) ) ( not ( = ?auto_332678 ?auto_332680 ) ) ( not ( = ?auto_332678 ?auto_332681 ) ) ( not ( = ?auto_332678 ?auto_332682 ) ) ( not ( = ?auto_332678 ?auto_332683 ) ) ( not ( = ?auto_332678 ?auto_332684 ) ) ( not ( = ?auto_332678 ?auto_332685 ) ) ( not ( = ?auto_332678 ?auto_332686 ) ) ( not ( = ?auto_332678 ?auto_332687 ) ) ( not ( = ?auto_332678 ?auto_332688 ) ) ( not ( = ?auto_332679 ?auto_332680 ) ) ( not ( = ?auto_332679 ?auto_332681 ) ) ( not ( = ?auto_332679 ?auto_332682 ) ) ( not ( = ?auto_332679 ?auto_332683 ) ) ( not ( = ?auto_332679 ?auto_332684 ) ) ( not ( = ?auto_332679 ?auto_332685 ) ) ( not ( = ?auto_332679 ?auto_332686 ) ) ( not ( = ?auto_332679 ?auto_332687 ) ) ( not ( = ?auto_332679 ?auto_332688 ) ) ( not ( = ?auto_332680 ?auto_332681 ) ) ( not ( = ?auto_332680 ?auto_332682 ) ) ( not ( = ?auto_332680 ?auto_332683 ) ) ( not ( = ?auto_332680 ?auto_332684 ) ) ( not ( = ?auto_332680 ?auto_332685 ) ) ( not ( = ?auto_332680 ?auto_332686 ) ) ( not ( = ?auto_332680 ?auto_332687 ) ) ( not ( = ?auto_332680 ?auto_332688 ) ) ( not ( = ?auto_332681 ?auto_332682 ) ) ( not ( = ?auto_332681 ?auto_332683 ) ) ( not ( = ?auto_332681 ?auto_332684 ) ) ( not ( = ?auto_332681 ?auto_332685 ) ) ( not ( = ?auto_332681 ?auto_332686 ) ) ( not ( = ?auto_332681 ?auto_332687 ) ) ( not ( = ?auto_332681 ?auto_332688 ) ) ( not ( = ?auto_332682 ?auto_332683 ) ) ( not ( = ?auto_332682 ?auto_332684 ) ) ( not ( = ?auto_332682 ?auto_332685 ) ) ( not ( = ?auto_332682 ?auto_332686 ) ) ( not ( = ?auto_332682 ?auto_332687 ) ) ( not ( = ?auto_332682 ?auto_332688 ) ) ( not ( = ?auto_332683 ?auto_332684 ) ) ( not ( = ?auto_332683 ?auto_332685 ) ) ( not ( = ?auto_332683 ?auto_332686 ) ) ( not ( = ?auto_332683 ?auto_332687 ) ) ( not ( = ?auto_332683 ?auto_332688 ) ) ( not ( = ?auto_332684 ?auto_332685 ) ) ( not ( = ?auto_332684 ?auto_332686 ) ) ( not ( = ?auto_332684 ?auto_332687 ) ) ( not ( = ?auto_332684 ?auto_332688 ) ) ( not ( = ?auto_332685 ?auto_332686 ) ) ( not ( = ?auto_332685 ?auto_332687 ) ) ( not ( = ?auto_332685 ?auto_332688 ) ) ( not ( = ?auto_332686 ?auto_332687 ) ) ( not ( = ?auto_332686 ?auto_332688 ) ) ( not ( = ?auto_332687 ?auto_332688 ) ) ( ON ?auto_332686 ?auto_332687 ) ( ON ?auto_332685 ?auto_332686 ) ( ON ?auto_332684 ?auto_332685 ) ( ON ?auto_332683 ?auto_332684 ) ( ON ?auto_332682 ?auto_332683 ) ( ON ?auto_332681 ?auto_332682 ) ( ON ?auto_332680 ?auto_332681 ) ( CLEAR ?auto_332678 ) ( ON ?auto_332679 ?auto_332680 ) ( CLEAR ?auto_332679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_332677 ?auto_332678 ?auto_332679 )
      ( MAKE-11PILE ?auto_332677 ?auto_332678 ?auto_332679 ?auto_332680 ?auto_332681 ?auto_332682 ?auto_332683 ?auto_332684 ?auto_332685 ?auto_332686 ?auto_332687 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332700 - BLOCK
      ?auto_332701 - BLOCK
      ?auto_332702 - BLOCK
      ?auto_332703 - BLOCK
      ?auto_332704 - BLOCK
      ?auto_332705 - BLOCK
      ?auto_332706 - BLOCK
      ?auto_332707 - BLOCK
      ?auto_332708 - BLOCK
      ?auto_332709 - BLOCK
      ?auto_332710 - BLOCK
    )
    :vars
    (
      ?auto_332711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332710 ?auto_332711 ) ( ON-TABLE ?auto_332700 ) ( not ( = ?auto_332700 ?auto_332701 ) ) ( not ( = ?auto_332700 ?auto_332702 ) ) ( not ( = ?auto_332700 ?auto_332703 ) ) ( not ( = ?auto_332700 ?auto_332704 ) ) ( not ( = ?auto_332700 ?auto_332705 ) ) ( not ( = ?auto_332700 ?auto_332706 ) ) ( not ( = ?auto_332700 ?auto_332707 ) ) ( not ( = ?auto_332700 ?auto_332708 ) ) ( not ( = ?auto_332700 ?auto_332709 ) ) ( not ( = ?auto_332700 ?auto_332710 ) ) ( not ( = ?auto_332700 ?auto_332711 ) ) ( not ( = ?auto_332701 ?auto_332702 ) ) ( not ( = ?auto_332701 ?auto_332703 ) ) ( not ( = ?auto_332701 ?auto_332704 ) ) ( not ( = ?auto_332701 ?auto_332705 ) ) ( not ( = ?auto_332701 ?auto_332706 ) ) ( not ( = ?auto_332701 ?auto_332707 ) ) ( not ( = ?auto_332701 ?auto_332708 ) ) ( not ( = ?auto_332701 ?auto_332709 ) ) ( not ( = ?auto_332701 ?auto_332710 ) ) ( not ( = ?auto_332701 ?auto_332711 ) ) ( not ( = ?auto_332702 ?auto_332703 ) ) ( not ( = ?auto_332702 ?auto_332704 ) ) ( not ( = ?auto_332702 ?auto_332705 ) ) ( not ( = ?auto_332702 ?auto_332706 ) ) ( not ( = ?auto_332702 ?auto_332707 ) ) ( not ( = ?auto_332702 ?auto_332708 ) ) ( not ( = ?auto_332702 ?auto_332709 ) ) ( not ( = ?auto_332702 ?auto_332710 ) ) ( not ( = ?auto_332702 ?auto_332711 ) ) ( not ( = ?auto_332703 ?auto_332704 ) ) ( not ( = ?auto_332703 ?auto_332705 ) ) ( not ( = ?auto_332703 ?auto_332706 ) ) ( not ( = ?auto_332703 ?auto_332707 ) ) ( not ( = ?auto_332703 ?auto_332708 ) ) ( not ( = ?auto_332703 ?auto_332709 ) ) ( not ( = ?auto_332703 ?auto_332710 ) ) ( not ( = ?auto_332703 ?auto_332711 ) ) ( not ( = ?auto_332704 ?auto_332705 ) ) ( not ( = ?auto_332704 ?auto_332706 ) ) ( not ( = ?auto_332704 ?auto_332707 ) ) ( not ( = ?auto_332704 ?auto_332708 ) ) ( not ( = ?auto_332704 ?auto_332709 ) ) ( not ( = ?auto_332704 ?auto_332710 ) ) ( not ( = ?auto_332704 ?auto_332711 ) ) ( not ( = ?auto_332705 ?auto_332706 ) ) ( not ( = ?auto_332705 ?auto_332707 ) ) ( not ( = ?auto_332705 ?auto_332708 ) ) ( not ( = ?auto_332705 ?auto_332709 ) ) ( not ( = ?auto_332705 ?auto_332710 ) ) ( not ( = ?auto_332705 ?auto_332711 ) ) ( not ( = ?auto_332706 ?auto_332707 ) ) ( not ( = ?auto_332706 ?auto_332708 ) ) ( not ( = ?auto_332706 ?auto_332709 ) ) ( not ( = ?auto_332706 ?auto_332710 ) ) ( not ( = ?auto_332706 ?auto_332711 ) ) ( not ( = ?auto_332707 ?auto_332708 ) ) ( not ( = ?auto_332707 ?auto_332709 ) ) ( not ( = ?auto_332707 ?auto_332710 ) ) ( not ( = ?auto_332707 ?auto_332711 ) ) ( not ( = ?auto_332708 ?auto_332709 ) ) ( not ( = ?auto_332708 ?auto_332710 ) ) ( not ( = ?auto_332708 ?auto_332711 ) ) ( not ( = ?auto_332709 ?auto_332710 ) ) ( not ( = ?auto_332709 ?auto_332711 ) ) ( not ( = ?auto_332710 ?auto_332711 ) ) ( ON ?auto_332709 ?auto_332710 ) ( ON ?auto_332708 ?auto_332709 ) ( ON ?auto_332707 ?auto_332708 ) ( ON ?auto_332706 ?auto_332707 ) ( ON ?auto_332705 ?auto_332706 ) ( ON ?auto_332704 ?auto_332705 ) ( ON ?auto_332703 ?auto_332704 ) ( ON ?auto_332702 ?auto_332703 ) ( CLEAR ?auto_332700 ) ( ON ?auto_332701 ?auto_332702 ) ( CLEAR ?auto_332701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_332700 ?auto_332701 )
      ( MAKE-11PILE ?auto_332700 ?auto_332701 ?auto_332702 ?auto_332703 ?auto_332704 ?auto_332705 ?auto_332706 ?auto_332707 ?auto_332708 ?auto_332709 ?auto_332710 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332723 - BLOCK
      ?auto_332724 - BLOCK
      ?auto_332725 - BLOCK
      ?auto_332726 - BLOCK
      ?auto_332727 - BLOCK
      ?auto_332728 - BLOCK
      ?auto_332729 - BLOCK
      ?auto_332730 - BLOCK
      ?auto_332731 - BLOCK
      ?auto_332732 - BLOCK
      ?auto_332733 - BLOCK
    )
    :vars
    (
      ?auto_332734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332733 ?auto_332734 ) ( ON-TABLE ?auto_332723 ) ( not ( = ?auto_332723 ?auto_332724 ) ) ( not ( = ?auto_332723 ?auto_332725 ) ) ( not ( = ?auto_332723 ?auto_332726 ) ) ( not ( = ?auto_332723 ?auto_332727 ) ) ( not ( = ?auto_332723 ?auto_332728 ) ) ( not ( = ?auto_332723 ?auto_332729 ) ) ( not ( = ?auto_332723 ?auto_332730 ) ) ( not ( = ?auto_332723 ?auto_332731 ) ) ( not ( = ?auto_332723 ?auto_332732 ) ) ( not ( = ?auto_332723 ?auto_332733 ) ) ( not ( = ?auto_332723 ?auto_332734 ) ) ( not ( = ?auto_332724 ?auto_332725 ) ) ( not ( = ?auto_332724 ?auto_332726 ) ) ( not ( = ?auto_332724 ?auto_332727 ) ) ( not ( = ?auto_332724 ?auto_332728 ) ) ( not ( = ?auto_332724 ?auto_332729 ) ) ( not ( = ?auto_332724 ?auto_332730 ) ) ( not ( = ?auto_332724 ?auto_332731 ) ) ( not ( = ?auto_332724 ?auto_332732 ) ) ( not ( = ?auto_332724 ?auto_332733 ) ) ( not ( = ?auto_332724 ?auto_332734 ) ) ( not ( = ?auto_332725 ?auto_332726 ) ) ( not ( = ?auto_332725 ?auto_332727 ) ) ( not ( = ?auto_332725 ?auto_332728 ) ) ( not ( = ?auto_332725 ?auto_332729 ) ) ( not ( = ?auto_332725 ?auto_332730 ) ) ( not ( = ?auto_332725 ?auto_332731 ) ) ( not ( = ?auto_332725 ?auto_332732 ) ) ( not ( = ?auto_332725 ?auto_332733 ) ) ( not ( = ?auto_332725 ?auto_332734 ) ) ( not ( = ?auto_332726 ?auto_332727 ) ) ( not ( = ?auto_332726 ?auto_332728 ) ) ( not ( = ?auto_332726 ?auto_332729 ) ) ( not ( = ?auto_332726 ?auto_332730 ) ) ( not ( = ?auto_332726 ?auto_332731 ) ) ( not ( = ?auto_332726 ?auto_332732 ) ) ( not ( = ?auto_332726 ?auto_332733 ) ) ( not ( = ?auto_332726 ?auto_332734 ) ) ( not ( = ?auto_332727 ?auto_332728 ) ) ( not ( = ?auto_332727 ?auto_332729 ) ) ( not ( = ?auto_332727 ?auto_332730 ) ) ( not ( = ?auto_332727 ?auto_332731 ) ) ( not ( = ?auto_332727 ?auto_332732 ) ) ( not ( = ?auto_332727 ?auto_332733 ) ) ( not ( = ?auto_332727 ?auto_332734 ) ) ( not ( = ?auto_332728 ?auto_332729 ) ) ( not ( = ?auto_332728 ?auto_332730 ) ) ( not ( = ?auto_332728 ?auto_332731 ) ) ( not ( = ?auto_332728 ?auto_332732 ) ) ( not ( = ?auto_332728 ?auto_332733 ) ) ( not ( = ?auto_332728 ?auto_332734 ) ) ( not ( = ?auto_332729 ?auto_332730 ) ) ( not ( = ?auto_332729 ?auto_332731 ) ) ( not ( = ?auto_332729 ?auto_332732 ) ) ( not ( = ?auto_332729 ?auto_332733 ) ) ( not ( = ?auto_332729 ?auto_332734 ) ) ( not ( = ?auto_332730 ?auto_332731 ) ) ( not ( = ?auto_332730 ?auto_332732 ) ) ( not ( = ?auto_332730 ?auto_332733 ) ) ( not ( = ?auto_332730 ?auto_332734 ) ) ( not ( = ?auto_332731 ?auto_332732 ) ) ( not ( = ?auto_332731 ?auto_332733 ) ) ( not ( = ?auto_332731 ?auto_332734 ) ) ( not ( = ?auto_332732 ?auto_332733 ) ) ( not ( = ?auto_332732 ?auto_332734 ) ) ( not ( = ?auto_332733 ?auto_332734 ) ) ( ON ?auto_332732 ?auto_332733 ) ( ON ?auto_332731 ?auto_332732 ) ( ON ?auto_332730 ?auto_332731 ) ( ON ?auto_332729 ?auto_332730 ) ( ON ?auto_332728 ?auto_332729 ) ( ON ?auto_332727 ?auto_332728 ) ( ON ?auto_332726 ?auto_332727 ) ( ON ?auto_332725 ?auto_332726 ) ( CLEAR ?auto_332723 ) ( ON ?auto_332724 ?auto_332725 ) ( CLEAR ?auto_332724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_332723 ?auto_332724 )
      ( MAKE-11PILE ?auto_332723 ?auto_332724 ?auto_332725 ?auto_332726 ?auto_332727 ?auto_332728 ?auto_332729 ?auto_332730 ?auto_332731 ?auto_332732 ?auto_332733 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332746 - BLOCK
      ?auto_332747 - BLOCK
      ?auto_332748 - BLOCK
      ?auto_332749 - BLOCK
      ?auto_332750 - BLOCK
      ?auto_332751 - BLOCK
      ?auto_332752 - BLOCK
      ?auto_332753 - BLOCK
      ?auto_332754 - BLOCK
      ?auto_332755 - BLOCK
      ?auto_332756 - BLOCK
    )
    :vars
    (
      ?auto_332757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332756 ?auto_332757 ) ( not ( = ?auto_332746 ?auto_332747 ) ) ( not ( = ?auto_332746 ?auto_332748 ) ) ( not ( = ?auto_332746 ?auto_332749 ) ) ( not ( = ?auto_332746 ?auto_332750 ) ) ( not ( = ?auto_332746 ?auto_332751 ) ) ( not ( = ?auto_332746 ?auto_332752 ) ) ( not ( = ?auto_332746 ?auto_332753 ) ) ( not ( = ?auto_332746 ?auto_332754 ) ) ( not ( = ?auto_332746 ?auto_332755 ) ) ( not ( = ?auto_332746 ?auto_332756 ) ) ( not ( = ?auto_332746 ?auto_332757 ) ) ( not ( = ?auto_332747 ?auto_332748 ) ) ( not ( = ?auto_332747 ?auto_332749 ) ) ( not ( = ?auto_332747 ?auto_332750 ) ) ( not ( = ?auto_332747 ?auto_332751 ) ) ( not ( = ?auto_332747 ?auto_332752 ) ) ( not ( = ?auto_332747 ?auto_332753 ) ) ( not ( = ?auto_332747 ?auto_332754 ) ) ( not ( = ?auto_332747 ?auto_332755 ) ) ( not ( = ?auto_332747 ?auto_332756 ) ) ( not ( = ?auto_332747 ?auto_332757 ) ) ( not ( = ?auto_332748 ?auto_332749 ) ) ( not ( = ?auto_332748 ?auto_332750 ) ) ( not ( = ?auto_332748 ?auto_332751 ) ) ( not ( = ?auto_332748 ?auto_332752 ) ) ( not ( = ?auto_332748 ?auto_332753 ) ) ( not ( = ?auto_332748 ?auto_332754 ) ) ( not ( = ?auto_332748 ?auto_332755 ) ) ( not ( = ?auto_332748 ?auto_332756 ) ) ( not ( = ?auto_332748 ?auto_332757 ) ) ( not ( = ?auto_332749 ?auto_332750 ) ) ( not ( = ?auto_332749 ?auto_332751 ) ) ( not ( = ?auto_332749 ?auto_332752 ) ) ( not ( = ?auto_332749 ?auto_332753 ) ) ( not ( = ?auto_332749 ?auto_332754 ) ) ( not ( = ?auto_332749 ?auto_332755 ) ) ( not ( = ?auto_332749 ?auto_332756 ) ) ( not ( = ?auto_332749 ?auto_332757 ) ) ( not ( = ?auto_332750 ?auto_332751 ) ) ( not ( = ?auto_332750 ?auto_332752 ) ) ( not ( = ?auto_332750 ?auto_332753 ) ) ( not ( = ?auto_332750 ?auto_332754 ) ) ( not ( = ?auto_332750 ?auto_332755 ) ) ( not ( = ?auto_332750 ?auto_332756 ) ) ( not ( = ?auto_332750 ?auto_332757 ) ) ( not ( = ?auto_332751 ?auto_332752 ) ) ( not ( = ?auto_332751 ?auto_332753 ) ) ( not ( = ?auto_332751 ?auto_332754 ) ) ( not ( = ?auto_332751 ?auto_332755 ) ) ( not ( = ?auto_332751 ?auto_332756 ) ) ( not ( = ?auto_332751 ?auto_332757 ) ) ( not ( = ?auto_332752 ?auto_332753 ) ) ( not ( = ?auto_332752 ?auto_332754 ) ) ( not ( = ?auto_332752 ?auto_332755 ) ) ( not ( = ?auto_332752 ?auto_332756 ) ) ( not ( = ?auto_332752 ?auto_332757 ) ) ( not ( = ?auto_332753 ?auto_332754 ) ) ( not ( = ?auto_332753 ?auto_332755 ) ) ( not ( = ?auto_332753 ?auto_332756 ) ) ( not ( = ?auto_332753 ?auto_332757 ) ) ( not ( = ?auto_332754 ?auto_332755 ) ) ( not ( = ?auto_332754 ?auto_332756 ) ) ( not ( = ?auto_332754 ?auto_332757 ) ) ( not ( = ?auto_332755 ?auto_332756 ) ) ( not ( = ?auto_332755 ?auto_332757 ) ) ( not ( = ?auto_332756 ?auto_332757 ) ) ( ON ?auto_332755 ?auto_332756 ) ( ON ?auto_332754 ?auto_332755 ) ( ON ?auto_332753 ?auto_332754 ) ( ON ?auto_332752 ?auto_332753 ) ( ON ?auto_332751 ?auto_332752 ) ( ON ?auto_332750 ?auto_332751 ) ( ON ?auto_332749 ?auto_332750 ) ( ON ?auto_332748 ?auto_332749 ) ( ON ?auto_332747 ?auto_332748 ) ( ON ?auto_332746 ?auto_332747 ) ( CLEAR ?auto_332746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_332746 )
      ( MAKE-11PILE ?auto_332746 ?auto_332747 ?auto_332748 ?auto_332749 ?auto_332750 ?auto_332751 ?auto_332752 ?auto_332753 ?auto_332754 ?auto_332755 ?auto_332756 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_332769 - BLOCK
      ?auto_332770 - BLOCK
      ?auto_332771 - BLOCK
      ?auto_332772 - BLOCK
      ?auto_332773 - BLOCK
      ?auto_332774 - BLOCK
      ?auto_332775 - BLOCK
      ?auto_332776 - BLOCK
      ?auto_332777 - BLOCK
      ?auto_332778 - BLOCK
      ?auto_332779 - BLOCK
    )
    :vars
    (
      ?auto_332780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332779 ?auto_332780 ) ( not ( = ?auto_332769 ?auto_332770 ) ) ( not ( = ?auto_332769 ?auto_332771 ) ) ( not ( = ?auto_332769 ?auto_332772 ) ) ( not ( = ?auto_332769 ?auto_332773 ) ) ( not ( = ?auto_332769 ?auto_332774 ) ) ( not ( = ?auto_332769 ?auto_332775 ) ) ( not ( = ?auto_332769 ?auto_332776 ) ) ( not ( = ?auto_332769 ?auto_332777 ) ) ( not ( = ?auto_332769 ?auto_332778 ) ) ( not ( = ?auto_332769 ?auto_332779 ) ) ( not ( = ?auto_332769 ?auto_332780 ) ) ( not ( = ?auto_332770 ?auto_332771 ) ) ( not ( = ?auto_332770 ?auto_332772 ) ) ( not ( = ?auto_332770 ?auto_332773 ) ) ( not ( = ?auto_332770 ?auto_332774 ) ) ( not ( = ?auto_332770 ?auto_332775 ) ) ( not ( = ?auto_332770 ?auto_332776 ) ) ( not ( = ?auto_332770 ?auto_332777 ) ) ( not ( = ?auto_332770 ?auto_332778 ) ) ( not ( = ?auto_332770 ?auto_332779 ) ) ( not ( = ?auto_332770 ?auto_332780 ) ) ( not ( = ?auto_332771 ?auto_332772 ) ) ( not ( = ?auto_332771 ?auto_332773 ) ) ( not ( = ?auto_332771 ?auto_332774 ) ) ( not ( = ?auto_332771 ?auto_332775 ) ) ( not ( = ?auto_332771 ?auto_332776 ) ) ( not ( = ?auto_332771 ?auto_332777 ) ) ( not ( = ?auto_332771 ?auto_332778 ) ) ( not ( = ?auto_332771 ?auto_332779 ) ) ( not ( = ?auto_332771 ?auto_332780 ) ) ( not ( = ?auto_332772 ?auto_332773 ) ) ( not ( = ?auto_332772 ?auto_332774 ) ) ( not ( = ?auto_332772 ?auto_332775 ) ) ( not ( = ?auto_332772 ?auto_332776 ) ) ( not ( = ?auto_332772 ?auto_332777 ) ) ( not ( = ?auto_332772 ?auto_332778 ) ) ( not ( = ?auto_332772 ?auto_332779 ) ) ( not ( = ?auto_332772 ?auto_332780 ) ) ( not ( = ?auto_332773 ?auto_332774 ) ) ( not ( = ?auto_332773 ?auto_332775 ) ) ( not ( = ?auto_332773 ?auto_332776 ) ) ( not ( = ?auto_332773 ?auto_332777 ) ) ( not ( = ?auto_332773 ?auto_332778 ) ) ( not ( = ?auto_332773 ?auto_332779 ) ) ( not ( = ?auto_332773 ?auto_332780 ) ) ( not ( = ?auto_332774 ?auto_332775 ) ) ( not ( = ?auto_332774 ?auto_332776 ) ) ( not ( = ?auto_332774 ?auto_332777 ) ) ( not ( = ?auto_332774 ?auto_332778 ) ) ( not ( = ?auto_332774 ?auto_332779 ) ) ( not ( = ?auto_332774 ?auto_332780 ) ) ( not ( = ?auto_332775 ?auto_332776 ) ) ( not ( = ?auto_332775 ?auto_332777 ) ) ( not ( = ?auto_332775 ?auto_332778 ) ) ( not ( = ?auto_332775 ?auto_332779 ) ) ( not ( = ?auto_332775 ?auto_332780 ) ) ( not ( = ?auto_332776 ?auto_332777 ) ) ( not ( = ?auto_332776 ?auto_332778 ) ) ( not ( = ?auto_332776 ?auto_332779 ) ) ( not ( = ?auto_332776 ?auto_332780 ) ) ( not ( = ?auto_332777 ?auto_332778 ) ) ( not ( = ?auto_332777 ?auto_332779 ) ) ( not ( = ?auto_332777 ?auto_332780 ) ) ( not ( = ?auto_332778 ?auto_332779 ) ) ( not ( = ?auto_332778 ?auto_332780 ) ) ( not ( = ?auto_332779 ?auto_332780 ) ) ( ON ?auto_332778 ?auto_332779 ) ( ON ?auto_332777 ?auto_332778 ) ( ON ?auto_332776 ?auto_332777 ) ( ON ?auto_332775 ?auto_332776 ) ( ON ?auto_332774 ?auto_332775 ) ( ON ?auto_332773 ?auto_332774 ) ( ON ?auto_332772 ?auto_332773 ) ( ON ?auto_332771 ?auto_332772 ) ( ON ?auto_332770 ?auto_332771 ) ( ON ?auto_332769 ?auto_332770 ) ( CLEAR ?auto_332769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_332769 )
      ( MAKE-11PILE ?auto_332769 ?auto_332770 ?auto_332771 ?auto_332772 ?auto_332773 ?auto_332774 ?auto_332775 ?auto_332776 ?auto_332777 ?auto_332778 ?auto_332779 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_332793 - BLOCK
      ?auto_332794 - BLOCK
      ?auto_332795 - BLOCK
      ?auto_332796 - BLOCK
      ?auto_332797 - BLOCK
      ?auto_332798 - BLOCK
      ?auto_332799 - BLOCK
      ?auto_332800 - BLOCK
      ?auto_332801 - BLOCK
      ?auto_332802 - BLOCK
      ?auto_332803 - BLOCK
      ?auto_332804 - BLOCK
    )
    :vars
    (
      ?auto_332805 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_332803 ) ( ON ?auto_332804 ?auto_332805 ) ( CLEAR ?auto_332804 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_332793 ) ( ON ?auto_332794 ?auto_332793 ) ( ON ?auto_332795 ?auto_332794 ) ( ON ?auto_332796 ?auto_332795 ) ( ON ?auto_332797 ?auto_332796 ) ( ON ?auto_332798 ?auto_332797 ) ( ON ?auto_332799 ?auto_332798 ) ( ON ?auto_332800 ?auto_332799 ) ( ON ?auto_332801 ?auto_332800 ) ( ON ?auto_332802 ?auto_332801 ) ( ON ?auto_332803 ?auto_332802 ) ( not ( = ?auto_332793 ?auto_332794 ) ) ( not ( = ?auto_332793 ?auto_332795 ) ) ( not ( = ?auto_332793 ?auto_332796 ) ) ( not ( = ?auto_332793 ?auto_332797 ) ) ( not ( = ?auto_332793 ?auto_332798 ) ) ( not ( = ?auto_332793 ?auto_332799 ) ) ( not ( = ?auto_332793 ?auto_332800 ) ) ( not ( = ?auto_332793 ?auto_332801 ) ) ( not ( = ?auto_332793 ?auto_332802 ) ) ( not ( = ?auto_332793 ?auto_332803 ) ) ( not ( = ?auto_332793 ?auto_332804 ) ) ( not ( = ?auto_332793 ?auto_332805 ) ) ( not ( = ?auto_332794 ?auto_332795 ) ) ( not ( = ?auto_332794 ?auto_332796 ) ) ( not ( = ?auto_332794 ?auto_332797 ) ) ( not ( = ?auto_332794 ?auto_332798 ) ) ( not ( = ?auto_332794 ?auto_332799 ) ) ( not ( = ?auto_332794 ?auto_332800 ) ) ( not ( = ?auto_332794 ?auto_332801 ) ) ( not ( = ?auto_332794 ?auto_332802 ) ) ( not ( = ?auto_332794 ?auto_332803 ) ) ( not ( = ?auto_332794 ?auto_332804 ) ) ( not ( = ?auto_332794 ?auto_332805 ) ) ( not ( = ?auto_332795 ?auto_332796 ) ) ( not ( = ?auto_332795 ?auto_332797 ) ) ( not ( = ?auto_332795 ?auto_332798 ) ) ( not ( = ?auto_332795 ?auto_332799 ) ) ( not ( = ?auto_332795 ?auto_332800 ) ) ( not ( = ?auto_332795 ?auto_332801 ) ) ( not ( = ?auto_332795 ?auto_332802 ) ) ( not ( = ?auto_332795 ?auto_332803 ) ) ( not ( = ?auto_332795 ?auto_332804 ) ) ( not ( = ?auto_332795 ?auto_332805 ) ) ( not ( = ?auto_332796 ?auto_332797 ) ) ( not ( = ?auto_332796 ?auto_332798 ) ) ( not ( = ?auto_332796 ?auto_332799 ) ) ( not ( = ?auto_332796 ?auto_332800 ) ) ( not ( = ?auto_332796 ?auto_332801 ) ) ( not ( = ?auto_332796 ?auto_332802 ) ) ( not ( = ?auto_332796 ?auto_332803 ) ) ( not ( = ?auto_332796 ?auto_332804 ) ) ( not ( = ?auto_332796 ?auto_332805 ) ) ( not ( = ?auto_332797 ?auto_332798 ) ) ( not ( = ?auto_332797 ?auto_332799 ) ) ( not ( = ?auto_332797 ?auto_332800 ) ) ( not ( = ?auto_332797 ?auto_332801 ) ) ( not ( = ?auto_332797 ?auto_332802 ) ) ( not ( = ?auto_332797 ?auto_332803 ) ) ( not ( = ?auto_332797 ?auto_332804 ) ) ( not ( = ?auto_332797 ?auto_332805 ) ) ( not ( = ?auto_332798 ?auto_332799 ) ) ( not ( = ?auto_332798 ?auto_332800 ) ) ( not ( = ?auto_332798 ?auto_332801 ) ) ( not ( = ?auto_332798 ?auto_332802 ) ) ( not ( = ?auto_332798 ?auto_332803 ) ) ( not ( = ?auto_332798 ?auto_332804 ) ) ( not ( = ?auto_332798 ?auto_332805 ) ) ( not ( = ?auto_332799 ?auto_332800 ) ) ( not ( = ?auto_332799 ?auto_332801 ) ) ( not ( = ?auto_332799 ?auto_332802 ) ) ( not ( = ?auto_332799 ?auto_332803 ) ) ( not ( = ?auto_332799 ?auto_332804 ) ) ( not ( = ?auto_332799 ?auto_332805 ) ) ( not ( = ?auto_332800 ?auto_332801 ) ) ( not ( = ?auto_332800 ?auto_332802 ) ) ( not ( = ?auto_332800 ?auto_332803 ) ) ( not ( = ?auto_332800 ?auto_332804 ) ) ( not ( = ?auto_332800 ?auto_332805 ) ) ( not ( = ?auto_332801 ?auto_332802 ) ) ( not ( = ?auto_332801 ?auto_332803 ) ) ( not ( = ?auto_332801 ?auto_332804 ) ) ( not ( = ?auto_332801 ?auto_332805 ) ) ( not ( = ?auto_332802 ?auto_332803 ) ) ( not ( = ?auto_332802 ?auto_332804 ) ) ( not ( = ?auto_332802 ?auto_332805 ) ) ( not ( = ?auto_332803 ?auto_332804 ) ) ( not ( = ?auto_332803 ?auto_332805 ) ) ( not ( = ?auto_332804 ?auto_332805 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_332804 ?auto_332805 )
      ( !STACK ?auto_332804 ?auto_332803 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_332818 - BLOCK
      ?auto_332819 - BLOCK
      ?auto_332820 - BLOCK
      ?auto_332821 - BLOCK
      ?auto_332822 - BLOCK
      ?auto_332823 - BLOCK
      ?auto_332824 - BLOCK
      ?auto_332825 - BLOCK
      ?auto_332826 - BLOCK
      ?auto_332827 - BLOCK
      ?auto_332828 - BLOCK
      ?auto_332829 - BLOCK
    )
    :vars
    (
      ?auto_332830 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_332828 ) ( ON ?auto_332829 ?auto_332830 ) ( CLEAR ?auto_332829 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_332818 ) ( ON ?auto_332819 ?auto_332818 ) ( ON ?auto_332820 ?auto_332819 ) ( ON ?auto_332821 ?auto_332820 ) ( ON ?auto_332822 ?auto_332821 ) ( ON ?auto_332823 ?auto_332822 ) ( ON ?auto_332824 ?auto_332823 ) ( ON ?auto_332825 ?auto_332824 ) ( ON ?auto_332826 ?auto_332825 ) ( ON ?auto_332827 ?auto_332826 ) ( ON ?auto_332828 ?auto_332827 ) ( not ( = ?auto_332818 ?auto_332819 ) ) ( not ( = ?auto_332818 ?auto_332820 ) ) ( not ( = ?auto_332818 ?auto_332821 ) ) ( not ( = ?auto_332818 ?auto_332822 ) ) ( not ( = ?auto_332818 ?auto_332823 ) ) ( not ( = ?auto_332818 ?auto_332824 ) ) ( not ( = ?auto_332818 ?auto_332825 ) ) ( not ( = ?auto_332818 ?auto_332826 ) ) ( not ( = ?auto_332818 ?auto_332827 ) ) ( not ( = ?auto_332818 ?auto_332828 ) ) ( not ( = ?auto_332818 ?auto_332829 ) ) ( not ( = ?auto_332818 ?auto_332830 ) ) ( not ( = ?auto_332819 ?auto_332820 ) ) ( not ( = ?auto_332819 ?auto_332821 ) ) ( not ( = ?auto_332819 ?auto_332822 ) ) ( not ( = ?auto_332819 ?auto_332823 ) ) ( not ( = ?auto_332819 ?auto_332824 ) ) ( not ( = ?auto_332819 ?auto_332825 ) ) ( not ( = ?auto_332819 ?auto_332826 ) ) ( not ( = ?auto_332819 ?auto_332827 ) ) ( not ( = ?auto_332819 ?auto_332828 ) ) ( not ( = ?auto_332819 ?auto_332829 ) ) ( not ( = ?auto_332819 ?auto_332830 ) ) ( not ( = ?auto_332820 ?auto_332821 ) ) ( not ( = ?auto_332820 ?auto_332822 ) ) ( not ( = ?auto_332820 ?auto_332823 ) ) ( not ( = ?auto_332820 ?auto_332824 ) ) ( not ( = ?auto_332820 ?auto_332825 ) ) ( not ( = ?auto_332820 ?auto_332826 ) ) ( not ( = ?auto_332820 ?auto_332827 ) ) ( not ( = ?auto_332820 ?auto_332828 ) ) ( not ( = ?auto_332820 ?auto_332829 ) ) ( not ( = ?auto_332820 ?auto_332830 ) ) ( not ( = ?auto_332821 ?auto_332822 ) ) ( not ( = ?auto_332821 ?auto_332823 ) ) ( not ( = ?auto_332821 ?auto_332824 ) ) ( not ( = ?auto_332821 ?auto_332825 ) ) ( not ( = ?auto_332821 ?auto_332826 ) ) ( not ( = ?auto_332821 ?auto_332827 ) ) ( not ( = ?auto_332821 ?auto_332828 ) ) ( not ( = ?auto_332821 ?auto_332829 ) ) ( not ( = ?auto_332821 ?auto_332830 ) ) ( not ( = ?auto_332822 ?auto_332823 ) ) ( not ( = ?auto_332822 ?auto_332824 ) ) ( not ( = ?auto_332822 ?auto_332825 ) ) ( not ( = ?auto_332822 ?auto_332826 ) ) ( not ( = ?auto_332822 ?auto_332827 ) ) ( not ( = ?auto_332822 ?auto_332828 ) ) ( not ( = ?auto_332822 ?auto_332829 ) ) ( not ( = ?auto_332822 ?auto_332830 ) ) ( not ( = ?auto_332823 ?auto_332824 ) ) ( not ( = ?auto_332823 ?auto_332825 ) ) ( not ( = ?auto_332823 ?auto_332826 ) ) ( not ( = ?auto_332823 ?auto_332827 ) ) ( not ( = ?auto_332823 ?auto_332828 ) ) ( not ( = ?auto_332823 ?auto_332829 ) ) ( not ( = ?auto_332823 ?auto_332830 ) ) ( not ( = ?auto_332824 ?auto_332825 ) ) ( not ( = ?auto_332824 ?auto_332826 ) ) ( not ( = ?auto_332824 ?auto_332827 ) ) ( not ( = ?auto_332824 ?auto_332828 ) ) ( not ( = ?auto_332824 ?auto_332829 ) ) ( not ( = ?auto_332824 ?auto_332830 ) ) ( not ( = ?auto_332825 ?auto_332826 ) ) ( not ( = ?auto_332825 ?auto_332827 ) ) ( not ( = ?auto_332825 ?auto_332828 ) ) ( not ( = ?auto_332825 ?auto_332829 ) ) ( not ( = ?auto_332825 ?auto_332830 ) ) ( not ( = ?auto_332826 ?auto_332827 ) ) ( not ( = ?auto_332826 ?auto_332828 ) ) ( not ( = ?auto_332826 ?auto_332829 ) ) ( not ( = ?auto_332826 ?auto_332830 ) ) ( not ( = ?auto_332827 ?auto_332828 ) ) ( not ( = ?auto_332827 ?auto_332829 ) ) ( not ( = ?auto_332827 ?auto_332830 ) ) ( not ( = ?auto_332828 ?auto_332829 ) ) ( not ( = ?auto_332828 ?auto_332830 ) ) ( not ( = ?auto_332829 ?auto_332830 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_332829 ?auto_332830 )
      ( !STACK ?auto_332829 ?auto_332828 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_332843 - BLOCK
      ?auto_332844 - BLOCK
      ?auto_332845 - BLOCK
      ?auto_332846 - BLOCK
      ?auto_332847 - BLOCK
      ?auto_332848 - BLOCK
      ?auto_332849 - BLOCK
      ?auto_332850 - BLOCK
      ?auto_332851 - BLOCK
      ?auto_332852 - BLOCK
      ?auto_332853 - BLOCK
      ?auto_332854 - BLOCK
    )
    :vars
    (
      ?auto_332855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332854 ?auto_332855 ) ( ON-TABLE ?auto_332843 ) ( ON ?auto_332844 ?auto_332843 ) ( ON ?auto_332845 ?auto_332844 ) ( ON ?auto_332846 ?auto_332845 ) ( ON ?auto_332847 ?auto_332846 ) ( ON ?auto_332848 ?auto_332847 ) ( ON ?auto_332849 ?auto_332848 ) ( ON ?auto_332850 ?auto_332849 ) ( ON ?auto_332851 ?auto_332850 ) ( ON ?auto_332852 ?auto_332851 ) ( not ( = ?auto_332843 ?auto_332844 ) ) ( not ( = ?auto_332843 ?auto_332845 ) ) ( not ( = ?auto_332843 ?auto_332846 ) ) ( not ( = ?auto_332843 ?auto_332847 ) ) ( not ( = ?auto_332843 ?auto_332848 ) ) ( not ( = ?auto_332843 ?auto_332849 ) ) ( not ( = ?auto_332843 ?auto_332850 ) ) ( not ( = ?auto_332843 ?auto_332851 ) ) ( not ( = ?auto_332843 ?auto_332852 ) ) ( not ( = ?auto_332843 ?auto_332853 ) ) ( not ( = ?auto_332843 ?auto_332854 ) ) ( not ( = ?auto_332843 ?auto_332855 ) ) ( not ( = ?auto_332844 ?auto_332845 ) ) ( not ( = ?auto_332844 ?auto_332846 ) ) ( not ( = ?auto_332844 ?auto_332847 ) ) ( not ( = ?auto_332844 ?auto_332848 ) ) ( not ( = ?auto_332844 ?auto_332849 ) ) ( not ( = ?auto_332844 ?auto_332850 ) ) ( not ( = ?auto_332844 ?auto_332851 ) ) ( not ( = ?auto_332844 ?auto_332852 ) ) ( not ( = ?auto_332844 ?auto_332853 ) ) ( not ( = ?auto_332844 ?auto_332854 ) ) ( not ( = ?auto_332844 ?auto_332855 ) ) ( not ( = ?auto_332845 ?auto_332846 ) ) ( not ( = ?auto_332845 ?auto_332847 ) ) ( not ( = ?auto_332845 ?auto_332848 ) ) ( not ( = ?auto_332845 ?auto_332849 ) ) ( not ( = ?auto_332845 ?auto_332850 ) ) ( not ( = ?auto_332845 ?auto_332851 ) ) ( not ( = ?auto_332845 ?auto_332852 ) ) ( not ( = ?auto_332845 ?auto_332853 ) ) ( not ( = ?auto_332845 ?auto_332854 ) ) ( not ( = ?auto_332845 ?auto_332855 ) ) ( not ( = ?auto_332846 ?auto_332847 ) ) ( not ( = ?auto_332846 ?auto_332848 ) ) ( not ( = ?auto_332846 ?auto_332849 ) ) ( not ( = ?auto_332846 ?auto_332850 ) ) ( not ( = ?auto_332846 ?auto_332851 ) ) ( not ( = ?auto_332846 ?auto_332852 ) ) ( not ( = ?auto_332846 ?auto_332853 ) ) ( not ( = ?auto_332846 ?auto_332854 ) ) ( not ( = ?auto_332846 ?auto_332855 ) ) ( not ( = ?auto_332847 ?auto_332848 ) ) ( not ( = ?auto_332847 ?auto_332849 ) ) ( not ( = ?auto_332847 ?auto_332850 ) ) ( not ( = ?auto_332847 ?auto_332851 ) ) ( not ( = ?auto_332847 ?auto_332852 ) ) ( not ( = ?auto_332847 ?auto_332853 ) ) ( not ( = ?auto_332847 ?auto_332854 ) ) ( not ( = ?auto_332847 ?auto_332855 ) ) ( not ( = ?auto_332848 ?auto_332849 ) ) ( not ( = ?auto_332848 ?auto_332850 ) ) ( not ( = ?auto_332848 ?auto_332851 ) ) ( not ( = ?auto_332848 ?auto_332852 ) ) ( not ( = ?auto_332848 ?auto_332853 ) ) ( not ( = ?auto_332848 ?auto_332854 ) ) ( not ( = ?auto_332848 ?auto_332855 ) ) ( not ( = ?auto_332849 ?auto_332850 ) ) ( not ( = ?auto_332849 ?auto_332851 ) ) ( not ( = ?auto_332849 ?auto_332852 ) ) ( not ( = ?auto_332849 ?auto_332853 ) ) ( not ( = ?auto_332849 ?auto_332854 ) ) ( not ( = ?auto_332849 ?auto_332855 ) ) ( not ( = ?auto_332850 ?auto_332851 ) ) ( not ( = ?auto_332850 ?auto_332852 ) ) ( not ( = ?auto_332850 ?auto_332853 ) ) ( not ( = ?auto_332850 ?auto_332854 ) ) ( not ( = ?auto_332850 ?auto_332855 ) ) ( not ( = ?auto_332851 ?auto_332852 ) ) ( not ( = ?auto_332851 ?auto_332853 ) ) ( not ( = ?auto_332851 ?auto_332854 ) ) ( not ( = ?auto_332851 ?auto_332855 ) ) ( not ( = ?auto_332852 ?auto_332853 ) ) ( not ( = ?auto_332852 ?auto_332854 ) ) ( not ( = ?auto_332852 ?auto_332855 ) ) ( not ( = ?auto_332853 ?auto_332854 ) ) ( not ( = ?auto_332853 ?auto_332855 ) ) ( not ( = ?auto_332854 ?auto_332855 ) ) ( CLEAR ?auto_332852 ) ( ON ?auto_332853 ?auto_332854 ) ( CLEAR ?auto_332853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_332843 ?auto_332844 ?auto_332845 ?auto_332846 ?auto_332847 ?auto_332848 ?auto_332849 ?auto_332850 ?auto_332851 ?auto_332852 ?auto_332853 )
      ( MAKE-12PILE ?auto_332843 ?auto_332844 ?auto_332845 ?auto_332846 ?auto_332847 ?auto_332848 ?auto_332849 ?auto_332850 ?auto_332851 ?auto_332852 ?auto_332853 ?auto_332854 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_332868 - BLOCK
      ?auto_332869 - BLOCK
      ?auto_332870 - BLOCK
      ?auto_332871 - BLOCK
      ?auto_332872 - BLOCK
      ?auto_332873 - BLOCK
      ?auto_332874 - BLOCK
      ?auto_332875 - BLOCK
      ?auto_332876 - BLOCK
      ?auto_332877 - BLOCK
      ?auto_332878 - BLOCK
      ?auto_332879 - BLOCK
    )
    :vars
    (
      ?auto_332880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332879 ?auto_332880 ) ( ON-TABLE ?auto_332868 ) ( ON ?auto_332869 ?auto_332868 ) ( ON ?auto_332870 ?auto_332869 ) ( ON ?auto_332871 ?auto_332870 ) ( ON ?auto_332872 ?auto_332871 ) ( ON ?auto_332873 ?auto_332872 ) ( ON ?auto_332874 ?auto_332873 ) ( ON ?auto_332875 ?auto_332874 ) ( ON ?auto_332876 ?auto_332875 ) ( ON ?auto_332877 ?auto_332876 ) ( not ( = ?auto_332868 ?auto_332869 ) ) ( not ( = ?auto_332868 ?auto_332870 ) ) ( not ( = ?auto_332868 ?auto_332871 ) ) ( not ( = ?auto_332868 ?auto_332872 ) ) ( not ( = ?auto_332868 ?auto_332873 ) ) ( not ( = ?auto_332868 ?auto_332874 ) ) ( not ( = ?auto_332868 ?auto_332875 ) ) ( not ( = ?auto_332868 ?auto_332876 ) ) ( not ( = ?auto_332868 ?auto_332877 ) ) ( not ( = ?auto_332868 ?auto_332878 ) ) ( not ( = ?auto_332868 ?auto_332879 ) ) ( not ( = ?auto_332868 ?auto_332880 ) ) ( not ( = ?auto_332869 ?auto_332870 ) ) ( not ( = ?auto_332869 ?auto_332871 ) ) ( not ( = ?auto_332869 ?auto_332872 ) ) ( not ( = ?auto_332869 ?auto_332873 ) ) ( not ( = ?auto_332869 ?auto_332874 ) ) ( not ( = ?auto_332869 ?auto_332875 ) ) ( not ( = ?auto_332869 ?auto_332876 ) ) ( not ( = ?auto_332869 ?auto_332877 ) ) ( not ( = ?auto_332869 ?auto_332878 ) ) ( not ( = ?auto_332869 ?auto_332879 ) ) ( not ( = ?auto_332869 ?auto_332880 ) ) ( not ( = ?auto_332870 ?auto_332871 ) ) ( not ( = ?auto_332870 ?auto_332872 ) ) ( not ( = ?auto_332870 ?auto_332873 ) ) ( not ( = ?auto_332870 ?auto_332874 ) ) ( not ( = ?auto_332870 ?auto_332875 ) ) ( not ( = ?auto_332870 ?auto_332876 ) ) ( not ( = ?auto_332870 ?auto_332877 ) ) ( not ( = ?auto_332870 ?auto_332878 ) ) ( not ( = ?auto_332870 ?auto_332879 ) ) ( not ( = ?auto_332870 ?auto_332880 ) ) ( not ( = ?auto_332871 ?auto_332872 ) ) ( not ( = ?auto_332871 ?auto_332873 ) ) ( not ( = ?auto_332871 ?auto_332874 ) ) ( not ( = ?auto_332871 ?auto_332875 ) ) ( not ( = ?auto_332871 ?auto_332876 ) ) ( not ( = ?auto_332871 ?auto_332877 ) ) ( not ( = ?auto_332871 ?auto_332878 ) ) ( not ( = ?auto_332871 ?auto_332879 ) ) ( not ( = ?auto_332871 ?auto_332880 ) ) ( not ( = ?auto_332872 ?auto_332873 ) ) ( not ( = ?auto_332872 ?auto_332874 ) ) ( not ( = ?auto_332872 ?auto_332875 ) ) ( not ( = ?auto_332872 ?auto_332876 ) ) ( not ( = ?auto_332872 ?auto_332877 ) ) ( not ( = ?auto_332872 ?auto_332878 ) ) ( not ( = ?auto_332872 ?auto_332879 ) ) ( not ( = ?auto_332872 ?auto_332880 ) ) ( not ( = ?auto_332873 ?auto_332874 ) ) ( not ( = ?auto_332873 ?auto_332875 ) ) ( not ( = ?auto_332873 ?auto_332876 ) ) ( not ( = ?auto_332873 ?auto_332877 ) ) ( not ( = ?auto_332873 ?auto_332878 ) ) ( not ( = ?auto_332873 ?auto_332879 ) ) ( not ( = ?auto_332873 ?auto_332880 ) ) ( not ( = ?auto_332874 ?auto_332875 ) ) ( not ( = ?auto_332874 ?auto_332876 ) ) ( not ( = ?auto_332874 ?auto_332877 ) ) ( not ( = ?auto_332874 ?auto_332878 ) ) ( not ( = ?auto_332874 ?auto_332879 ) ) ( not ( = ?auto_332874 ?auto_332880 ) ) ( not ( = ?auto_332875 ?auto_332876 ) ) ( not ( = ?auto_332875 ?auto_332877 ) ) ( not ( = ?auto_332875 ?auto_332878 ) ) ( not ( = ?auto_332875 ?auto_332879 ) ) ( not ( = ?auto_332875 ?auto_332880 ) ) ( not ( = ?auto_332876 ?auto_332877 ) ) ( not ( = ?auto_332876 ?auto_332878 ) ) ( not ( = ?auto_332876 ?auto_332879 ) ) ( not ( = ?auto_332876 ?auto_332880 ) ) ( not ( = ?auto_332877 ?auto_332878 ) ) ( not ( = ?auto_332877 ?auto_332879 ) ) ( not ( = ?auto_332877 ?auto_332880 ) ) ( not ( = ?auto_332878 ?auto_332879 ) ) ( not ( = ?auto_332878 ?auto_332880 ) ) ( not ( = ?auto_332879 ?auto_332880 ) ) ( CLEAR ?auto_332877 ) ( ON ?auto_332878 ?auto_332879 ) ( CLEAR ?auto_332878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_332868 ?auto_332869 ?auto_332870 ?auto_332871 ?auto_332872 ?auto_332873 ?auto_332874 ?auto_332875 ?auto_332876 ?auto_332877 ?auto_332878 )
      ( MAKE-12PILE ?auto_332868 ?auto_332869 ?auto_332870 ?auto_332871 ?auto_332872 ?auto_332873 ?auto_332874 ?auto_332875 ?auto_332876 ?auto_332877 ?auto_332878 ?auto_332879 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_332893 - BLOCK
      ?auto_332894 - BLOCK
      ?auto_332895 - BLOCK
      ?auto_332896 - BLOCK
      ?auto_332897 - BLOCK
      ?auto_332898 - BLOCK
      ?auto_332899 - BLOCK
      ?auto_332900 - BLOCK
      ?auto_332901 - BLOCK
      ?auto_332902 - BLOCK
      ?auto_332903 - BLOCK
      ?auto_332904 - BLOCK
    )
    :vars
    (
      ?auto_332905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332904 ?auto_332905 ) ( ON-TABLE ?auto_332893 ) ( ON ?auto_332894 ?auto_332893 ) ( ON ?auto_332895 ?auto_332894 ) ( ON ?auto_332896 ?auto_332895 ) ( ON ?auto_332897 ?auto_332896 ) ( ON ?auto_332898 ?auto_332897 ) ( ON ?auto_332899 ?auto_332898 ) ( ON ?auto_332900 ?auto_332899 ) ( ON ?auto_332901 ?auto_332900 ) ( not ( = ?auto_332893 ?auto_332894 ) ) ( not ( = ?auto_332893 ?auto_332895 ) ) ( not ( = ?auto_332893 ?auto_332896 ) ) ( not ( = ?auto_332893 ?auto_332897 ) ) ( not ( = ?auto_332893 ?auto_332898 ) ) ( not ( = ?auto_332893 ?auto_332899 ) ) ( not ( = ?auto_332893 ?auto_332900 ) ) ( not ( = ?auto_332893 ?auto_332901 ) ) ( not ( = ?auto_332893 ?auto_332902 ) ) ( not ( = ?auto_332893 ?auto_332903 ) ) ( not ( = ?auto_332893 ?auto_332904 ) ) ( not ( = ?auto_332893 ?auto_332905 ) ) ( not ( = ?auto_332894 ?auto_332895 ) ) ( not ( = ?auto_332894 ?auto_332896 ) ) ( not ( = ?auto_332894 ?auto_332897 ) ) ( not ( = ?auto_332894 ?auto_332898 ) ) ( not ( = ?auto_332894 ?auto_332899 ) ) ( not ( = ?auto_332894 ?auto_332900 ) ) ( not ( = ?auto_332894 ?auto_332901 ) ) ( not ( = ?auto_332894 ?auto_332902 ) ) ( not ( = ?auto_332894 ?auto_332903 ) ) ( not ( = ?auto_332894 ?auto_332904 ) ) ( not ( = ?auto_332894 ?auto_332905 ) ) ( not ( = ?auto_332895 ?auto_332896 ) ) ( not ( = ?auto_332895 ?auto_332897 ) ) ( not ( = ?auto_332895 ?auto_332898 ) ) ( not ( = ?auto_332895 ?auto_332899 ) ) ( not ( = ?auto_332895 ?auto_332900 ) ) ( not ( = ?auto_332895 ?auto_332901 ) ) ( not ( = ?auto_332895 ?auto_332902 ) ) ( not ( = ?auto_332895 ?auto_332903 ) ) ( not ( = ?auto_332895 ?auto_332904 ) ) ( not ( = ?auto_332895 ?auto_332905 ) ) ( not ( = ?auto_332896 ?auto_332897 ) ) ( not ( = ?auto_332896 ?auto_332898 ) ) ( not ( = ?auto_332896 ?auto_332899 ) ) ( not ( = ?auto_332896 ?auto_332900 ) ) ( not ( = ?auto_332896 ?auto_332901 ) ) ( not ( = ?auto_332896 ?auto_332902 ) ) ( not ( = ?auto_332896 ?auto_332903 ) ) ( not ( = ?auto_332896 ?auto_332904 ) ) ( not ( = ?auto_332896 ?auto_332905 ) ) ( not ( = ?auto_332897 ?auto_332898 ) ) ( not ( = ?auto_332897 ?auto_332899 ) ) ( not ( = ?auto_332897 ?auto_332900 ) ) ( not ( = ?auto_332897 ?auto_332901 ) ) ( not ( = ?auto_332897 ?auto_332902 ) ) ( not ( = ?auto_332897 ?auto_332903 ) ) ( not ( = ?auto_332897 ?auto_332904 ) ) ( not ( = ?auto_332897 ?auto_332905 ) ) ( not ( = ?auto_332898 ?auto_332899 ) ) ( not ( = ?auto_332898 ?auto_332900 ) ) ( not ( = ?auto_332898 ?auto_332901 ) ) ( not ( = ?auto_332898 ?auto_332902 ) ) ( not ( = ?auto_332898 ?auto_332903 ) ) ( not ( = ?auto_332898 ?auto_332904 ) ) ( not ( = ?auto_332898 ?auto_332905 ) ) ( not ( = ?auto_332899 ?auto_332900 ) ) ( not ( = ?auto_332899 ?auto_332901 ) ) ( not ( = ?auto_332899 ?auto_332902 ) ) ( not ( = ?auto_332899 ?auto_332903 ) ) ( not ( = ?auto_332899 ?auto_332904 ) ) ( not ( = ?auto_332899 ?auto_332905 ) ) ( not ( = ?auto_332900 ?auto_332901 ) ) ( not ( = ?auto_332900 ?auto_332902 ) ) ( not ( = ?auto_332900 ?auto_332903 ) ) ( not ( = ?auto_332900 ?auto_332904 ) ) ( not ( = ?auto_332900 ?auto_332905 ) ) ( not ( = ?auto_332901 ?auto_332902 ) ) ( not ( = ?auto_332901 ?auto_332903 ) ) ( not ( = ?auto_332901 ?auto_332904 ) ) ( not ( = ?auto_332901 ?auto_332905 ) ) ( not ( = ?auto_332902 ?auto_332903 ) ) ( not ( = ?auto_332902 ?auto_332904 ) ) ( not ( = ?auto_332902 ?auto_332905 ) ) ( not ( = ?auto_332903 ?auto_332904 ) ) ( not ( = ?auto_332903 ?auto_332905 ) ) ( not ( = ?auto_332904 ?auto_332905 ) ) ( ON ?auto_332903 ?auto_332904 ) ( CLEAR ?auto_332901 ) ( ON ?auto_332902 ?auto_332903 ) ( CLEAR ?auto_332902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_332893 ?auto_332894 ?auto_332895 ?auto_332896 ?auto_332897 ?auto_332898 ?auto_332899 ?auto_332900 ?auto_332901 ?auto_332902 )
      ( MAKE-12PILE ?auto_332893 ?auto_332894 ?auto_332895 ?auto_332896 ?auto_332897 ?auto_332898 ?auto_332899 ?auto_332900 ?auto_332901 ?auto_332902 ?auto_332903 ?auto_332904 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_332918 - BLOCK
      ?auto_332919 - BLOCK
      ?auto_332920 - BLOCK
      ?auto_332921 - BLOCK
      ?auto_332922 - BLOCK
      ?auto_332923 - BLOCK
      ?auto_332924 - BLOCK
      ?auto_332925 - BLOCK
      ?auto_332926 - BLOCK
      ?auto_332927 - BLOCK
      ?auto_332928 - BLOCK
      ?auto_332929 - BLOCK
    )
    :vars
    (
      ?auto_332930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332929 ?auto_332930 ) ( ON-TABLE ?auto_332918 ) ( ON ?auto_332919 ?auto_332918 ) ( ON ?auto_332920 ?auto_332919 ) ( ON ?auto_332921 ?auto_332920 ) ( ON ?auto_332922 ?auto_332921 ) ( ON ?auto_332923 ?auto_332922 ) ( ON ?auto_332924 ?auto_332923 ) ( ON ?auto_332925 ?auto_332924 ) ( ON ?auto_332926 ?auto_332925 ) ( not ( = ?auto_332918 ?auto_332919 ) ) ( not ( = ?auto_332918 ?auto_332920 ) ) ( not ( = ?auto_332918 ?auto_332921 ) ) ( not ( = ?auto_332918 ?auto_332922 ) ) ( not ( = ?auto_332918 ?auto_332923 ) ) ( not ( = ?auto_332918 ?auto_332924 ) ) ( not ( = ?auto_332918 ?auto_332925 ) ) ( not ( = ?auto_332918 ?auto_332926 ) ) ( not ( = ?auto_332918 ?auto_332927 ) ) ( not ( = ?auto_332918 ?auto_332928 ) ) ( not ( = ?auto_332918 ?auto_332929 ) ) ( not ( = ?auto_332918 ?auto_332930 ) ) ( not ( = ?auto_332919 ?auto_332920 ) ) ( not ( = ?auto_332919 ?auto_332921 ) ) ( not ( = ?auto_332919 ?auto_332922 ) ) ( not ( = ?auto_332919 ?auto_332923 ) ) ( not ( = ?auto_332919 ?auto_332924 ) ) ( not ( = ?auto_332919 ?auto_332925 ) ) ( not ( = ?auto_332919 ?auto_332926 ) ) ( not ( = ?auto_332919 ?auto_332927 ) ) ( not ( = ?auto_332919 ?auto_332928 ) ) ( not ( = ?auto_332919 ?auto_332929 ) ) ( not ( = ?auto_332919 ?auto_332930 ) ) ( not ( = ?auto_332920 ?auto_332921 ) ) ( not ( = ?auto_332920 ?auto_332922 ) ) ( not ( = ?auto_332920 ?auto_332923 ) ) ( not ( = ?auto_332920 ?auto_332924 ) ) ( not ( = ?auto_332920 ?auto_332925 ) ) ( not ( = ?auto_332920 ?auto_332926 ) ) ( not ( = ?auto_332920 ?auto_332927 ) ) ( not ( = ?auto_332920 ?auto_332928 ) ) ( not ( = ?auto_332920 ?auto_332929 ) ) ( not ( = ?auto_332920 ?auto_332930 ) ) ( not ( = ?auto_332921 ?auto_332922 ) ) ( not ( = ?auto_332921 ?auto_332923 ) ) ( not ( = ?auto_332921 ?auto_332924 ) ) ( not ( = ?auto_332921 ?auto_332925 ) ) ( not ( = ?auto_332921 ?auto_332926 ) ) ( not ( = ?auto_332921 ?auto_332927 ) ) ( not ( = ?auto_332921 ?auto_332928 ) ) ( not ( = ?auto_332921 ?auto_332929 ) ) ( not ( = ?auto_332921 ?auto_332930 ) ) ( not ( = ?auto_332922 ?auto_332923 ) ) ( not ( = ?auto_332922 ?auto_332924 ) ) ( not ( = ?auto_332922 ?auto_332925 ) ) ( not ( = ?auto_332922 ?auto_332926 ) ) ( not ( = ?auto_332922 ?auto_332927 ) ) ( not ( = ?auto_332922 ?auto_332928 ) ) ( not ( = ?auto_332922 ?auto_332929 ) ) ( not ( = ?auto_332922 ?auto_332930 ) ) ( not ( = ?auto_332923 ?auto_332924 ) ) ( not ( = ?auto_332923 ?auto_332925 ) ) ( not ( = ?auto_332923 ?auto_332926 ) ) ( not ( = ?auto_332923 ?auto_332927 ) ) ( not ( = ?auto_332923 ?auto_332928 ) ) ( not ( = ?auto_332923 ?auto_332929 ) ) ( not ( = ?auto_332923 ?auto_332930 ) ) ( not ( = ?auto_332924 ?auto_332925 ) ) ( not ( = ?auto_332924 ?auto_332926 ) ) ( not ( = ?auto_332924 ?auto_332927 ) ) ( not ( = ?auto_332924 ?auto_332928 ) ) ( not ( = ?auto_332924 ?auto_332929 ) ) ( not ( = ?auto_332924 ?auto_332930 ) ) ( not ( = ?auto_332925 ?auto_332926 ) ) ( not ( = ?auto_332925 ?auto_332927 ) ) ( not ( = ?auto_332925 ?auto_332928 ) ) ( not ( = ?auto_332925 ?auto_332929 ) ) ( not ( = ?auto_332925 ?auto_332930 ) ) ( not ( = ?auto_332926 ?auto_332927 ) ) ( not ( = ?auto_332926 ?auto_332928 ) ) ( not ( = ?auto_332926 ?auto_332929 ) ) ( not ( = ?auto_332926 ?auto_332930 ) ) ( not ( = ?auto_332927 ?auto_332928 ) ) ( not ( = ?auto_332927 ?auto_332929 ) ) ( not ( = ?auto_332927 ?auto_332930 ) ) ( not ( = ?auto_332928 ?auto_332929 ) ) ( not ( = ?auto_332928 ?auto_332930 ) ) ( not ( = ?auto_332929 ?auto_332930 ) ) ( ON ?auto_332928 ?auto_332929 ) ( CLEAR ?auto_332926 ) ( ON ?auto_332927 ?auto_332928 ) ( CLEAR ?auto_332927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_332918 ?auto_332919 ?auto_332920 ?auto_332921 ?auto_332922 ?auto_332923 ?auto_332924 ?auto_332925 ?auto_332926 ?auto_332927 )
      ( MAKE-12PILE ?auto_332918 ?auto_332919 ?auto_332920 ?auto_332921 ?auto_332922 ?auto_332923 ?auto_332924 ?auto_332925 ?auto_332926 ?auto_332927 ?auto_332928 ?auto_332929 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_332943 - BLOCK
      ?auto_332944 - BLOCK
      ?auto_332945 - BLOCK
      ?auto_332946 - BLOCK
      ?auto_332947 - BLOCK
      ?auto_332948 - BLOCK
      ?auto_332949 - BLOCK
      ?auto_332950 - BLOCK
      ?auto_332951 - BLOCK
      ?auto_332952 - BLOCK
      ?auto_332953 - BLOCK
      ?auto_332954 - BLOCK
    )
    :vars
    (
      ?auto_332955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332954 ?auto_332955 ) ( ON-TABLE ?auto_332943 ) ( ON ?auto_332944 ?auto_332943 ) ( ON ?auto_332945 ?auto_332944 ) ( ON ?auto_332946 ?auto_332945 ) ( ON ?auto_332947 ?auto_332946 ) ( ON ?auto_332948 ?auto_332947 ) ( ON ?auto_332949 ?auto_332948 ) ( ON ?auto_332950 ?auto_332949 ) ( not ( = ?auto_332943 ?auto_332944 ) ) ( not ( = ?auto_332943 ?auto_332945 ) ) ( not ( = ?auto_332943 ?auto_332946 ) ) ( not ( = ?auto_332943 ?auto_332947 ) ) ( not ( = ?auto_332943 ?auto_332948 ) ) ( not ( = ?auto_332943 ?auto_332949 ) ) ( not ( = ?auto_332943 ?auto_332950 ) ) ( not ( = ?auto_332943 ?auto_332951 ) ) ( not ( = ?auto_332943 ?auto_332952 ) ) ( not ( = ?auto_332943 ?auto_332953 ) ) ( not ( = ?auto_332943 ?auto_332954 ) ) ( not ( = ?auto_332943 ?auto_332955 ) ) ( not ( = ?auto_332944 ?auto_332945 ) ) ( not ( = ?auto_332944 ?auto_332946 ) ) ( not ( = ?auto_332944 ?auto_332947 ) ) ( not ( = ?auto_332944 ?auto_332948 ) ) ( not ( = ?auto_332944 ?auto_332949 ) ) ( not ( = ?auto_332944 ?auto_332950 ) ) ( not ( = ?auto_332944 ?auto_332951 ) ) ( not ( = ?auto_332944 ?auto_332952 ) ) ( not ( = ?auto_332944 ?auto_332953 ) ) ( not ( = ?auto_332944 ?auto_332954 ) ) ( not ( = ?auto_332944 ?auto_332955 ) ) ( not ( = ?auto_332945 ?auto_332946 ) ) ( not ( = ?auto_332945 ?auto_332947 ) ) ( not ( = ?auto_332945 ?auto_332948 ) ) ( not ( = ?auto_332945 ?auto_332949 ) ) ( not ( = ?auto_332945 ?auto_332950 ) ) ( not ( = ?auto_332945 ?auto_332951 ) ) ( not ( = ?auto_332945 ?auto_332952 ) ) ( not ( = ?auto_332945 ?auto_332953 ) ) ( not ( = ?auto_332945 ?auto_332954 ) ) ( not ( = ?auto_332945 ?auto_332955 ) ) ( not ( = ?auto_332946 ?auto_332947 ) ) ( not ( = ?auto_332946 ?auto_332948 ) ) ( not ( = ?auto_332946 ?auto_332949 ) ) ( not ( = ?auto_332946 ?auto_332950 ) ) ( not ( = ?auto_332946 ?auto_332951 ) ) ( not ( = ?auto_332946 ?auto_332952 ) ) ( not ( = ?auto_332946 ?auto_332953 ) ) ( not ( = ?auto_332946 ?auto_332954 ) ) ( not ( = ?auto_332946 ?auto_332955 ) ) ( not ( = ?auto_332947 ?auto_332948 ) ) ( not ( = ?auto_332947 ?auto_332949 ) ) ( not ( = ?auto_332947 ?auto_332950 ) ) ( not ( = ?auto_332947 ?auto_332951 ) ) ( not ( = ?auto_332947 ?auto_332952 ) ) ( not ( = ?auto_332947 ?auto_332953 ) ) ( not ( = ?auto_332947 ?auto_332954 ) ) ( not ( = ?auto_332947 ?auto_332955 ) ) ( not ( = ?auto_332948 ?auto_332949 ) ) ( not ( = ?auto_332948 ?auto_332950 ) ) ( not ( = ?auto_332948 ?auto_332951 ) ) ( not ( = ?auto_332948 ?auto_332952 ) ) ( not ( = ?auto_332948 ?auto_332953 ) ) ( not ( = ?auto_332948 ?auto_332954 ) ) ( not ( = ?auto_332948 ?auto_332955 ) ) ( not ( = ?auto_332949 ?auto_332950 ) ) ( not ( = ?auto_332949 ?auto_332951 ) ) ( not ( = ?auto_332949 ?auto_332952 ) ) ( not ( = ?auto_332949 ?auto_332953 ) ) ( not ( = ?auto_332949 ?auto_332954 ) ) ( not ( = ?auto_332949 ?auto_332955 ) ) ( not ( = ?auto_332950 ?auto_332951 ) ) ( not ( = ?auto_332950 ?auto_332952 ) ) ( not ( = ?auto_332950 ?auto_332953 ) ) ( not ( = ?auto_332950 ?auto_332954 ) ) ( not ( = ?auto_332950 ?auto_332955 ) ) ( not ( = ?auto_332951 ?auto_332952 ) ) ( not ( = ?auto_332951 ?auto_332953 ) ) ( not ( = ?auto_332951 ?auto_332954 ) ) ( not ( = ?auto_332951 ?auto_332955 ) ) ( not ( = ?auto_332952 ?auto_332953 ) ) ( not ( = ?auto_332952 ?auto_332954 ) ) ( not ( = ?auto_332952 ?auto_332955 ) ) ( not ( = ?auto_332953 ?auto_332954 ) ) ( not ( = ?auto_332953 ?auto_332955 ) ) ( not ( = ?auto_332954 ?auto_332955 ) ) ( ON ?auto_332953 ?auto_332954 ) ( ON ?auto_332952 ?auto_332953 ) ( CLEAR ?auto_332950 ) ( ON ?auto_332951 ?auto_332952 ) ( CLEAR ?auto_332951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_332943 ?auto_332944 ?auto_332945 ?auto_332946 ?auto_332947 ?auto_332948 ?auto_332949 ?auto_332950 ?auto_332951 )
      ( MAKE-12PILE ?auto_332943 ?auto_332944 ?auto_332945 ?auto_332946 ?auto_332947 ?auto_332948 ?auto_332949 ?auto_332950 ?auto_332951 ?auto_332952 ?auto_332953 ?auto_332954 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_332968 - BLOCK
      ?auto_332969 - BLOCK
      ?auto_332970 - BLOCK
      ?auto_332971 - BLOCK
      ?auto_332972 - BLOCK
      ?auto_332973 - BLOCK
      ?auto_332974 - BLOCK
      ?auto_332975 - BLOCK
      ?auto_332976 - BLOCK
      ?auto_332977 - BLOCK
      ?auto_332978 - BLOCK
      ?auto_332979 - BLOCK
    )
    :vars
    (
      ?auto_332980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_332979 ?auto_332980 ) ( ON-TABLE ?auto_332968 ) ( ON ?auto_332969 ?auto_332968 ) ( ON ?auto_332970 ?auto_332969 ) ( ON ?auto_332971 ?auto_332970 ) ( ON ?auto_332972 ?auto_332971 ) ( ON ?auto_332973 ?auto_332972 ) ( ON ?auto_332974 ?auto_332973 ) ( ON ?auto_332975 ?auto_332974 ) ( not ( = ?auto_332968 ?auto_332969 ) ) ( not ( = ?auto_332968 ?auto_332970 ) ) ( not ( = ?auto_332968 ?auto_332971 ) ) ( not ( = ?auto_332968 ?auto_332972 ) ) ( not ( = ?auto_332968 ?auto_332973 ) ) ( not ( = ?auto_332968 ?auto_332974 ) ) ( not ( = ?auto_332968 ?auto_332975 ) ) ( not ( = ?auto_332968 ?auto_332976 ) ) ( not ( = ?auto_332968 ?auto_332977 ) ) ( not ( = ?auto_332968 ?auto_332978 ) ) ( not ( = ?auto_332968 ?auto_332979 ) ) ( not ( = ?auto_332968 ?auto_332980 ) ) ( not ( = ?auto_332969 ?auto_332970 ) ) ( not ( = ?auto_332969 ?auto_332971 ) ) ( not ( = ?auto_332969 ?auto_332972 ) ) ( not ( = ?auto_332969 ?auto_332973 ) ) ( not ( = ?auto_332969 ?auto_332974 ) ) ( not ( = ?auto_332969 ?auto_332975 ) ) ( not ( = ?auto_332969 ?auto_332976 ) ) ( not ( = ?auto_332969 ?auto_332977 ) ) ( not ( = ?auto_332969 ?auto_332978 ) ) ( not ( = ?auto_332969 ?auto_332979 ) ) ( not ( = ?auto_332969 ?auto_332980 ) ) ( not ( = ?auto_332970 ?auto_332971 ) ) ( not ( = ?auto_332970 ?auto_332972 ) ) ( not ( = ?auto_332970 ?auto_332973 ) ) ( not ( = ?auto_332970 ?auto_332974 ) ) ( not ( = ?auto_332970 ?auto_332975 ) ) ( not ( = ?auto_332970 ?auto_332976 ) ) ( not ( = ?auto_332970 ?auto_332977 ) ) ( not ( = ?auto_332970 ?auto_332978 ) ) ( not ( = ?auto_332970 ?auto_332979 ) ) ( not ( = ?auto_332970 ?auto_332980 ) ) ( not ( = ?auto_332971 ?auto_332972 ) ) ( not ( = ?auto_332971 ?auto_332973 ) ) ( not ( = ?auto_332971 ?auto_332974 ) ) ( not ( = ?auto_332971 ?auto_332975 ) ) ( not ( = ?auto_332971 ?auto_332976 ) ) ( not ( = ?auto_332971 ?auto_332977 ) ) ( not ( = ?auto_332971 ?auto_332978 ) ) ( not ( = ?auto_332971 ?auto_332979 ) ) ( not ( = ?auto_332971 ?auto_332980 ) ) ( not ( = ?auto_332972 ?auto_332973 ) ) ( not ( = ?auto_332972 ?auto_332974 ) ) ( not ( = ?auto_332972 ?auto_332975 ) ) ( not ( = ?auto_332972 ?auto_332976 ) ) ( not ( = ?auto_332972 ?auto_332977 ) ) ( not ( = ?auto_332972 ?auto_332978 ) ) ( not ( = ?auto_332972 ?auto_332979 ) ) ( not ( = ?auto_332972 ?auto_332980 ) ) ( not ( = ?auto_332973 ?auto_332974 ) ) ( not ( = ?auto_332973 ?auto_332975 ) ) ( not ( = ?auto_332973 ?auto_332976 ) ) ( not ( = ?auto_332973 ?auto_332977 ) ) ( not ( = ?auto_332973 ?auto_332978 ) ) ( not ( = ?auto_332973 ?auto_332979 ) ) ( not ( = ?auto_332973 ?auto_332980 ) ) ( not ( = ?auto_332974 ?auto_332975 ) ) ( not ( = ?auto_332974 ?auto_332976 ) ) ( not ( = ?auto_332974 ?auto_332977 ) ) ( not ( = ?auto_332974 ?auto_332978 ) ) ( not ( = ?auto_332974 ?auto_332979 ) ) ( not ( = ?auto_332974 ?auto_332980 ) ) ( not ( = ?auto_332975 ?auto_332976 ) ) ( not ( = ?auto_332975 ?auto_332977 ) ) ( not ( = ?auto_332975 ?auto_332978 ) ) ( not ( = ?auto_332975 ?auto_332979 ) ) ( not ( = ?auto_332975 ?auto_332980 ) ) ( not ( = ?auto_332976 ?auto_332977 ) ) ( not ( = ?auto_332976 ?auto_332978 ) ) ( not ( = ?auto_332976 ?auto_332979 ) ) ( not ( = ?auto_332976 ?auto_332980 ) ) ( not ( = ?auto_332977 ?auto_332978 ) ) ( not ( = ?auto_332977 ?auto_332979 ) ) ( not ( = ?auto_332977 ?auto_332980 ) ) ( not ( = ?auto_332978 ?auto_332979 ) ) ( not ( = ?auto_332978 ?auto_332980 ) ) ( not ( = ?auto_332979 ?auto_332980 ) ) ( ON ?auto_332978 ?auto_332979 ) ( ON ?auto_332977 ?auto_332978 ) ( CLEAR ?auto_332975 ) ( ON ?auto_332976 ?auto_332977 ) ( CLEAR ?auto_332976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_332968 ?auto_332969 ?auto_332970 ?auto_332971 ?auto_332972 ?auto_332973 ?auto_332974 ?auto_332975 ?auto_332976 )
      ( MAKE-12PILE ?auto_332968 ?auto_332969 ?auto_332970 ?auto_332971 ?auto_332972 ?auto_332973 ?auto_332974 ?auto_332975 ?auto_332976 ?auto_332977 ?auto_332978 ?auto_332979 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_332993 - BLOCK
      ?auto_332994 - BLOCK
      ?auto_332995 - BLOCK
      ?auto_332996 - BLOCK
      ?auto_332997 - BLOCK
      ?auto_332998 - BLOCK
      ?auto_332999 - BLOCK
      ?auto_333000 - BLOCK
      ?auto_333001 - BLOCK
      ?auto_333002 - BLOCK
      ?auto_333003 - BLOCK
      ?auto_333004 - BLOCK
    )
    :vars
    (
      ?auto_333005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333004 ?auto_333005 ) ( ON-TABLE ?auto_332993 ) ( ON ?auto_332994 ?auto_332993 ) ( ON ?auto_332995 ?auto_332994 ) ( ON ?auto_332996 ?auto_332995 ) ( ON ?auto_332997 ?auto_332996 ) ( ON ?auto_332998 ?auto_332997 ) ( ON ?auto_332999 ?auto_332998 ) ( not ( = ?auto_332993 ?auto_332994 ) ) ( not ( = ?auto_332993 ?auto_332995 ) ) ( not ( = ?auto_332993 ?auto_332996 ) ) ( not ( = ?auto_332993 ?auto_332997 ) ) ( not ( = ?auto_332993 ?auto_332998 ) ) ( not ( = ?auto_332993 ?auto_332999 ) ) ( not ( = ?auto_332993 ?auto_333000 ) ) ( not ( = ?auto_332993 ?auto_333001 ) ) ( not ( = ?auto_332993 ?auto_333002 ) ) ( not ( = ?auto_332993 ?auto_333003 ) ) ( not ( = ?auto_332993 ?auto_333004 ) ) ( not ( = ?auto_332993 ?auto_333005 ) ) ( not ( = ?auto_332994 ?auto_332995 ) ) ( not ( = ?auto_332994 ?auto_332996 ) ) ( not ( = ?auto_332994 ?auto_332997 ) ) ( not ( = ?auto_332994 ?auto_332998 ) ) ( not ( = ?auto_332994 ?auto_332999 ) ) ( not ( = ?auto_332994 ?auto_333000 ) ) ( not ( = ?auto_332994 ?auto_333001 ) ) ( not ( = ?auto_332994 ?auto_333002 ) ) ( not ( = ?auto_332994 ?auto_333003 ) ) ( not ( = ?auto_332994 ?auto_333004 ) ) ( not ( = ?auto_332994 ?auto_333005 ) ) ( not ( = ?auto_332995 ?auto_332996 ) ) ( not ( = ?auto_332995 ?auto_332997 ) ) ( not ( = ?auto_332995 ?auto_332998 ) ) ( not ( = ?auto_332995 ?auto_332999 ) ) ( not ( = ?auto_332995 ?auto_333000 ) ) ( not ( = ?auto_332995 ?auto_333001 ) ) ( not ( = ?auto_332995 ?auto_333002 ) ) ( not ( = ?auto_332995 ?auto_333003 ) ) ( not ( = ?auto_332995 ?auto_333004 ) ) ( not ( = ?auto_332995 ?auto_333005 ) ) ( not ( = ?auto_332996 ?auto_332997 ) ) ( not ( = ?auto_332996 ?auto_332998 ) ) ( not ( = ?auto_332996 ?auto_332999 ) ) ( not ( = ?auto_332996 ?auto_333000 ) ) ( not ( = ?auto_332996 ?auto_333001 ) ) ( not ( = ?auto_332996 ?auto_333002 ) ) ( not ( = ?auto_332996 ?auto_333003 ) ) ( not ( = ?auto_332996 ?auto_333004 ) ) ( not ( = ?auto_332996 ?auto_333005 ) ) ( not ( = ?auto_332997 ?auto_332998 ) ) ( not ( = ?auto_332997 ?auto_332999 ) ) ( not ( = ?auto_332997 ?auto_333000 ) ) ( not ( = ?auto_332997 ?auto_333001 ) ) ( not ( = ?auto_332997 ?auto_333002 ) ) ( not ( = ?auto_332997 ?auto_333003 ) ) ( not ( = ?auto_332997 ?auto_333004 ) ) ( not ( = ?auto_332997 ?auto_333005 ) ) ( not ( = ?auto_332998 ?auto_332999 ) ) ( not ( = ?auto_332998 ?auto_333000 ) ) ( not ( = ?auto_332998 ?auto_333001 ) ) ( not ( = ?auto_332998 ?auto_333002 ) ) ( not ( = ?auto_332998 ?auto_333003 ) ) ( not ( = ?auto_332998 ?auto_333004 ) ) ( not ( = ?auto_332998 ?auto_333005 ) ) ( not ( = ?auto_332999 ?auto_333000 ) ) ( not ( = ?auto_332999 ?auto_333001 ) ) ( not ( = ?auto_332999 ?auto_333002 ) ) ( not ( = ?auto_332999 ?auto_333003 ) ) ( not ( = ?auto_332999 ?auto_333004 ) ) ( not ( = ?auto_332999 ?auto_333005 ) ) ( not ( = ?auto_333000 ?auto_333001 ) ) ( not ( = ?auto_333000 ?auto_333002 ) ) ( not ( = ?auto_333000 ?auto_333003 ) ) ( not ( = ?auto_333000 ?auto_333004 ) ) ( not ( = ?auto_333000 ?auto_333005 ) ) ( not ( = ?auto_333001 ?auto_333002 ) ) ( not ( = ?auto_333001 ?auto_333003 ) ) ( not ( = ?auto_333001 ?auto_333004 ) ) ( not ( = ?auto_333001 ?auto_333005 ) ) ( not ( = ?auto_333002 ?auto_333003 ) ) ( not ( = ?auto_333002 ?auto_333004 ) ) ( not ( = ?auto_333002 ?auto_333005 ) ) ( not ( = ?auto_333003 ?auto_333004 ) ) ( not ( = ?auto_333003 ?auto_333005 ) ) ( not ( = ?auto_333004 ?auto_333005 ) ) ( ON ?auto_333003 ?auto_333004 ) ( ON ?auto_333002 ?auto_333003 ) ( ON ?auto_333001 ?auto_333002 ) ( CLEAR ?auto_332999 ) ( ON ?auto_333000 ?auto_333001 ) ( CLEAR ?auto_333000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_332993 ?auto_332994 ?auto_332995 ?auto_332996 ?auto_332997 ?auto_332998 ?auto_332999 ?auto_333000 )
      ( MAKE-12PILE ?auto_332993 ?auto_332994 ?auto_332995 ?auto_332996 ?auto_332997 ?auto_332998 ?auto_332999 ?auto_333000 ?auto_333001 ?auto_333002 ?auto_333003 ?auto_333004 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_333018 - BLOCK
      ?auto_333019 - BLOCK
      ?auto_333020 - BLOCK
      ?auto_333021 - BLOCK
      ?auto_333022 - BLOCK
      ?auto_333023 - BLOCK
      ?auto_333024 - BLOCK
      ?auto_333025 - BLOCK
      ?auto_333026 - BLOCK
      ?auto_333027 - BLOCK
      ?auto_333028 - BLOCK
      ?auto_333029 - BLOCK
    )
    :vars
    (
      ?auto_333030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333029 ?auto_333030 ) ( ON-TABLE ?auto_333018 ) ( ON ?auto_333019 ?auto_333018 ) ( ON ?auto_333020 ?auto_333019 ) ( ON ?auto_333021 ?auto_333020 ) ( ON ?auto_333022 ?auto_333021 ) ( ON ?auto_333023 ?auto_333022 ) ( ON ?auto_333024 ?auto_333023 ) ( not ( = ?auto_333018 ?auto_333019 ) ) ( not ( = ?auto_333018 ?auto_333020 ) ) ( not ( = ?auto_333018 ?auto_333021 ) ) ( not ( = ?auto_333018 ?auto_333022 ) ) ( not ( = ?auto_333018 ?auto_333023 ) ) ( not ( = ?auto_333018 ?auto_333024 ) ) ( not ( = ?auto_333018 ?auto_333025 ) ) ( not ( = ?auto_333018 ?auto_333026 ) ) ( not ( = ?auto_333018 ?auto_333027 ) ) ( not ( = ?auto_333018 ?auto_333028 ) ) ( not ( = ?auto_333018 ?auto_333029 ) ) ( not ( = ?auto_333018 ?auto_333030 ) ) ( not ( = ?auto_333019 ?auto_333020 ) ) ( not ( = ?auto_333019 ?auto_333021 ) ) ( not ( = ?auto_333019 ?auto_333022 ) ) ( not ( = ?auto_333019 ?auto_333023 ) ) ( not ( = ?auto_333019 ?auto_333024 ) ) ( not ( = ?auto_333019 ?auto_333025 ) ) ( not ( = ?auto_333019 ?auto_333026 ) ) ( not ( = ?auto_333019 ?auto_333027 ) ) ( not ( = ?auto_333019 ?auto_333028 ) ) ( not ( = ?auto_333019 ?auto_333029 ) ) ( not ( = ?auto_333019 ?auto_333030 ) ) ( not ( = ?auto_333020 ?auto_333021 ) ) ( not ( = ?auto_333020 ?auto_333022 ) ) ( not ( = ?auto_333020 ?auto_333023 ) ) ( not ( = ?auto_333020 ?auto_333024 ) ) ( not ( = ?auto_333020 ?auto_333025 ) ) ( not ( = ?auto_333020 ?auto_333026 ) ) ( not ( = ?auto_333020 ?auto_333027 ) ) ( not ( = ?auto_333020 ?auto_333028 ) ) ( not ( = ?auto_333020 ?auto_333029 ) ) ( not ( = ?auto_333020 ?auto_333030 ) ) ( not ( = ?auto_333021 ?auto_333022 ) ) ( not ( = ?auto_333021 ?auto_333023 ) ) ( not ( = ?auto_333021 ?auto_333024 ) ) ( not ( = ?auto_333021 ?auto_333025 ) ) ( not ( = ?auto_333021 ?auto_333026 ) ) ( not ( = ?auto_333021 ?auto_333027 ) ) ( not ( = ?auto_333021 ?auto_333028 ) ) ( not ( = ?auto_333021 ?auto_333029 ) ) ( not ( = ?auto_333021 ?auto_333030 ) ) ( not ( = ?auto_333022 ?auto_333023 ) ) ( not ( = ?auto_333022 ?auto_333024 ) ) ( not ( = ?auto_333022 ?auto_333025 ) ) ( not ( = ?auto_333022 ?auto_333026 ) ) ( not ( = ?auto_333022 ?auto_333027 ) ) ( not ( = ?auto_333022 ?auto_333028 ) ) ( not ( = ?auto_333022 ?auto_333029 ) ) ( not ( = ?auto_333022 ?auto_333030 ) ) ( not ( = ?auto_333023 ?auto_333024 ) ) ( not ( = ?auto_333023 ?auto_333025 ) ) ( not ( = ?auto_333023 ?auto_333026 ) ) ( not ( = ?auto_333023 ?auto_333027 ) ) ( not ( = ?auto_333023 ?auto_333028 ) ) ( not ( = ?auto_333023 ?auto_333029 ) ) ( not ( = ?auto_333023 ?auto_333030 ) ) ( not ( = ?auto_333024 ?auto_333025 ) ) ( not ( = ?auto_333024 ?auto_333026 ) ) ( not ( = ?auto_333024 ?auto_333027 ) ) ( not ( = ?auto_333024 ?auto_333028 ) ) ( not ( = ?auto_333024 ?auto_333029 ) ) ( not ( = ?auto_333024 ?auto_333030 ) ) ( not ( = ?auto_333025 ?auto_333026 ) ) ( not ( = ?auto_333025 ?auto_333027 ) ) ( not ( = ?auto_333025 ?auto_333028 ) ) ( not ( = ?auto_333025 ?auto_333029 ) ) ( not ( = ?auto_333025 ?auto_333030 ) ) ( not ( = ?auto_333026 ?auto_333027 ) ) ( not ( = ?auto_333026 ?auto_333028 ) ) ( not ( = ?auto_333026 ?auto_333029 ) ) ( not ( = ?auto_333026 ?auto_333030 ) ) ( not ( = ?auto_333027 ?auto_333028 ) ) ( not ( = ?auto_333027 ?auto_333029 ) ) ( not ( = ?auto_333027 ?auto_333030 ) ) ( not ( = ?auto_333028 ?auto_333029 ) ) ( not ( = ?auto_333028 ?auto_333030 ) ) ( not ( = ?auto_333029 ?auto_333030 ) ) ( ON ?auto_333028 ?auto_333029 ) ( ON ?auto_333027 ?auto_333028 ) ( ON ?auto_333026 ?auto_333027 ) ( CLEAR ?auto_333024 ) ( ON ?auto_333025 ?auto_333026 ) ( CLEAR ?auto_333025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_333018 ?auto_333019 ?auto_333020 ?auto_333021 ?auto_333022 ?auto_333023 ?auto_333024 ?auto_333025 )
      ( MAKE-12PILE ?auto_333018 ?auto_333019 ?auto_333020 ?auto_333021 ?auto_333022 ?auto_333023 ?auto_333024 ?auto_333025 ?auto_333026 ?auto_333027 ?auto_333028 ?auto_333029 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_333043 - BLOCK
      ?auto_333044 - BLOCK
      ?auto_333045 - BLOCK
      ?auto_333046 - BLOCK
      ?auto_333047 - BLOCK
      ?auto_333048 - BLOCK
      ?auto_333049 - BLOCK
      ?auto_333050 - BLOCK
      ?auto_333051 - BLOCK
      ?auto_333052 - BLOCK
      ?auto_333053 - BLOCK
      ?auto_333054 - BLOCK
    )
    :vars
    (
      ?auto_333055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333054 ?auto_333055 ) ( ON-TABLE ?auto_333043 ) ( ON ?auto_333044 ?auto_333043 ) ( ON ?auto_333045 ?auto_333044 ) ( ON ?auto_333046 ?auto_333045 ) ( ON ?auto_333047 ?auto_333046 ) ( ON ?auto_333048 ?auto_333047 ) ( not ( = ?auto_333043 ?auto_333044 ) ) ( not ( = ?auto_333043 ?auto_333045 ) ) ( not ( = ?auto_333043 ?auto_333046 ) ) ( not ( = ?auto_333043 ?auto_333047 ) ) ( not ( = ?auto_333043 ?auto_333048 ) ) ( not ( = ?auto_333043 ?auto_333049 ) ) ( not ( = ?auto_333043 ?auto_333050 ) ) ( not ( = ?auto_333043 ?auto_333051 ) ) ( not ( = ?auto_333043 ?auto_333052 ) ) ( not ( = ?auto_333043 ?auto_333053 ) ) ( not ( = ?auto_333043 ?auto_333054 ) ) ( not ( = ?auto_333043 ?auto_333055 ) ) ( not ( = ?auto_333044 ?auto_333045 ) ) ( not ( = ?auto_333044 ?auto_333046 ) ) ( not ( = ?auto_333044 ?auto_333047 ) ) ( not ( = ?auto_333044 ?auto_333048 ) ) ( not ( = ?auto_333044 ?auto_333049 ) ) ( not ( = ?auto_333044 ?auto_333050 ) ) ( not ( = ?auto_333044 ?auto_333051 ) ) ( not ( = ?auto_333044 ?auto_333052 ) ) ( not ( = ?auto_333044 ?auto_333053 ) ) ( not ( = ?auto_333044 ?auto_333054 ) ) ( not ( = ?auto_333044 ?auto_333055 ) ) ( not ( = ?auto_333045 ?auto_333046 ) ) ( not ( = ?auto_333045 ?auto_333047 ) ) ( not ( = ?auto_333045 ?auto_333048 ) ) ( not ( = ?auto_333045 ?auto_333049 ) ) ( not ( = ?auto_333045 ?auto_333050 ) ) ( not ( = ?auto_333045 ?auto_333051 ) ) ( not ( = ?auto_333045 ?auto_333052 ) ) ( not ( = ?auto_333045 ?auto_333053 ) ) ( not ( = ?auto_333045 ?auto_333054 ) ) ( not ( = ?auto_333045 ?auto_333055 ) ) ( not ( = ?auto_333046 ?auto_333047 ) ) ( not ( = ?auto_333046 ?auto_333048 ) ) ( not ( = ?auto_333046 ?auto_333049 ) ) ( not ( = ?auto_333046 ?auto_333050 ) ) ( not ( = ?auto_333046 ?auto_333051 ) ) ( not ( = ?auto_333046 ?auto_333052 ) ) ( not ( = ?auto_333046 ?auto_333053 ) ) ( not ( = ?auto_333046 ?auto_333054 ) ) ( not ( = ?auto_333046 ?auto_333055 ) ) ( not ( = ?auto_333047 ?auto_333048 ) ) ( not ( = ?auto_333047 ?auto_333049 ) ) ( not ( = ?auto_333047 ?auto_333050 ) ) ( not ( = ?auto_333047 ?auto_333051 ) ) ( not ( = ?auto_333047 ?auto_333052 ) ) ( not ( = ?auto_333047 ?auto_333053 ) ) ( not ( = ?auto_333047 ?auto_333054 ) ) ( not ( = ?auto_333047 ?auto_333055 ) ) ( not ( = ?auto_333048 ?auto_333049 ) ) ( not ( = ?auto_333048 ?auto_333050 ) ) ( not ( = ?auto_333048 ?auto_333051 ) ) ( not ( = ?auto_333048 ?auto_333052 ) ) ( not ( = ?auto_333048 ?auto_333053 ) ) ( not ( = ?auto_333048 ?auto_333054 ) ) ( not ( = ?auto_333048 ?auto_333055 ) ) ( not ( = ?auto_333049 ?auto_333050 ) ) ( not ( = ?auto_333049 ?auto_333051 ) ) ( not ( = ?auto_333049 ?auto_333052 ) ) ( not ( = ?auto_333049 ?auto_333053 ) ) ( not ( = ?auto_333049 ?auto_333054 ) ) ( not ( = ?auto_333049 ?auto_333055 ) ) ( not ( = ?auto_333050 ?auto_333051 ) ) ( not ( = ?auto_333050 ?auto_333052 ) ) ( not ( = ?auto_333050 ?auto_333053 ) ) ( not ( = ?auto_333050 ?auto_333054 ) ) ( not ( = ?auto_333050 ?auto_333055 ) ) ( not ( = ?auto_333051 ?auto_333052 ) ) ( not ( = ?auto_333051 ?auto_333053 ) ) ( not ( = ?auto_333051 ?auto_333054 ) ) ( not ( = ?auto_333051 ?auto_333055 ) ) ( not ( = ?auto_333052 ?auto_333053 ) ) ( not ( = ?auto_333052 ?auto_333054 ) ) ( not ( = ?auto_333052 ?auto_333055 ) ) ( not ( = ?auto_333053 ?auto_333054 ) ) ( not ( = ?auto_333053 ?auto_333055 ) ) ( not ( = ?auto_333054 ?auto_333055 ) ) ( ON ?auto_333053 ?auto_333054 ) ( ON ?auto_333052 ?auto_333053 ) ( ON ?auto_333051 ?auto_333052 ) ( ON ?auto_333050 ?auto_333051 ) ( CLEAR ?auto_333048 ) ( ON ?auto_333049 ?auto_333050 ) ( CLEAR ?auto_333049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_333043 ?auto_333044 ?auto_333045 ?auto_333046 ?auto_333047 ?auto_333048 ?auto_333049 )
      ( MAKE-12PILE ?auto_333043 ?auto_333044 ?auto_333045 ?auto_333046 ?auto_333047 ?auto_333048 ?auto_333049 ?auto_333050 ?auto_333051 ?auto_333052 ?auto_333053 ?auto_333054 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_333068 - BLOCK
      ?auto_333069 - BLOCK
      ?auto_333070 - BLOCK
      ?auto_333071 - BLOCK
      ?auto_333072 - BLOCK
      ?auto_333073 - BLOCK
      ?auto_333074 - BLOCK
      ?auto_333075 - BLOCK
      ?auto_333076 - BLOCK
      ?auto_333077 - BLOCK
      ?auto_333078 - BLOCK
      ?auto_333079 - BLOCK
    )
    :vars
    (
      ?auto_333080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333079 ?auto_333080 ) ( ON-TABLE ?auto_333068 ) ( ON ?auto_333069 ?auto_333068 ) ( ON ?auto_333070 ?auto_333069 ) ( ON ?auto_333071 ?auto_333070 ) ( ON ?auto_333072 ?auto_333071 ) ( ON ?auto_333073 ?auto_333072 ) ( not ( = ?auto_333068 ?auto_333069 ) ) ( not ( = ?auto_333068 ?auto_333070 ) ) ( not ( = ?auto_333068 ?auto_333071 ) ) ( not ( = ?auto_333068 ?auto_333072 ) ) ( not ( = ?auto_333068 ?auto_333073 ) ) ( not ( = ?auto_333068 ?auto_333074 ) ) ( not ( = ?auto_333068 ?auto_333075 ) ) ( not ( = ?auto_333068 ?auto_333076 ) ) ( not ( = ?auto_333068 ?auto_333077 ) ) ( not ( = ?auto_333068 ?auto_333078 ) ) ( not ( = ?auto_333068 ?auto_333079 ) ) ( not ( = ?auto_333068 ?auto_333080 ) ) ( not ( = ?auto_333069 ?auto_333070 ) ) ( not ( = ?auto_333069 ?auto_333071 ) ) ( not ( = ?auto_333069 ?auto_333072 ) ) ( not ( = ?auto_333069 ?auto_333073 ) ) ( not ( = ?auto_333069 ?auto_333074 ) ) ( not ( = ?auto_333069 ?auto_333075 ) ) ( not ( = ?auto_333069 ?auto_333076 ) ) ( not ( = ?auto_333069 ?auto_333077 ) ) ( not ( = ?auto_333069 ?auto_333078 ) ) ( not ( = ?auto_333069 ?auto_333079 ) ) ( not ( = ?auto_333069 ?auto_333080 ) ) ( not ( = ?auto_333070 ?auto_333071 ) ) ( not ( = ?auto_333070 ?auto_333072 ) ) ( not ( = ?auto_333070 ?auto_333073 ) ) ( not ( = ?auto_333070 ?auto_333074 ) ) ( not ( = ?auto_333070 ?auto_333075 ) ) ( not ( = ?auto_333070 ?auto_333076 ) ) ( not ( = ?auto_333070 ?auto_333077 ) ) ( not ( = ?auto_333070 ?auto_333078 ) ) ( not ( = ?auto_333070 ?auto_333079 ) ) ( not ( = ?auto_333070 ?auto_333080 ) ) ( not ( = ?auto_333071 ?auto_333072 ) ) ( not ( = ?auto_333071 ?auto_333073 ) ) ( not ( = ?auto_333071 ?auto_333074 ) ) ( not ( = ?auto_333071 ?auto_333075 ) ) ( not ( = ?auto_333071 ?auto_333076 ) ) ( not ( = ?auto_333071 ?auto_333077 ) ) ( not ( = ?auto_333071 ?auto_333078 ) ) ( not ( = ?auto_333071 ?auto_333079 ) ) ( not ( = ?auto_333071 ?auto_333080 ) ) ( not ( = ?auto_333072 ?auto_333073 ) ) ( not ( = ?auto_333072 ?auto_333074 ) ) ( not ( = ?auto_333072 ?auto_333075 ) ) ( not ( = ?auto_333072 ?auto_333076 ) ) ( not ( = ?auto_333072 ?auto_333077 ) ) ( not ( = ?auto_333072 ?auto_333078 ) ) ( not ( = ?auto_333072 ?auto_333079 ) ) ( not ( = ?auto_333072 ?auto_333080 ) ) ( not ( = ?auto_333073 ?auto_333074 ) ) ( not ( = ?auto_333073 ?auto_333075 ) ) ( not ( = ?auto_333073 ?auto_333076 ) ) ( not ( = ?auto_333073 ?auto_333077 ) ) ( not ( = ?auto_333073 ?auto_333078 ) ) ( not ( = ?auto_333073 ?auto_333079 ) ) ( not ( = ?auto_333073 ?auto_333080 ) ) ( not ( = ?auto_333074 ?auto_333075 ) ) ( not ( = ?auto_333074 ?auto_333076 ) ) ( not ( = ?auto_333074 ?auto_333077 ) ) ( not ( = ?auto_333074 ?auto_333078 ) ) ( not ( = ?auto_333074 ?auto_333079 ) ) ( not ( = ?auto_333074 ?auto_333080 ) ) ( not ( = ?auto_333075 ?auto_333076 ) ) ( not ( = ?auto_333075 ?auto_333077 ) ) ( not ( = ?auto_333075 ?auto_333078 ) ) ( not ( = ?auto_333075 ?auto_333079 ) ) ( not ( = ?auto_333075 ?auto_333080 ) ) ( not ( = ?auto_333076 ?auto_333077 ) ) ( not ( = ?auto_333076 ?auto_333078 ) ) ( not ( = ?auto_333076 ?auto_333079 ) ) ( not ( = ?auto_333076 ?auto_333080 ) ) ( not ( = ?auto_333077 ?auto_333078 ) ) ( not ( = ?auto_333077 ?auto_333079 ) ) ( not ( = ?auto_333077 ?auto_333080 ) ) ( not ( = ?auto_333078 ?auto_333079 ) ) ( not ( = ?auto_333078 ?auto_333080 ) ) ( not ( = ?auto_333079 ?auto_333080 ) ) ( ON ?auto_333078 ?auto_333079 ) ( ON ?auto_333077 ?auto_333078 ) ( ON ?auto_333076 ?auto_333077 ) ( ON ?auto_333075 ?auto_333076 ) ( CLEAR ?auto_333073 ) ( ON ?auto_333074 ?auto_333075 ) ( CLEAR ?auto_333074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_333068 ?auto_333069 ?auto_333070 ?auto_333071 ?auto_333072 ?auto_333073 ?auto_333074 )
      ( MAKE-12PILE ?auto_333068 ?auto_333069 ?auto_333070 ?auto_333071 ?auto_333072 ?auto_333073 ?auto_333074 ?auto_333075 ?auto_333076 ?auto_333077 ?auto_333078 ?auto_333079 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_333093 - BLOCK
      ?auto_333094 - BLOCK
      ?auto_333095 - BLOCK
      ?auto_333096 - BLOCK
      ?auto_333097 - BLOCK
      ?auto_333098 - BLOCK
      ?auto_333099 - BLOCK
      ?auto_333100 - BLOCK
      ?auto_333101 - BLOCK
      ?auto_333102 - BLOCK
      ?auto_333103 - BLOCK
      ?auto_333104 - BLOCK
    )
    :vars
    (
      ?auto_333105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333104 ?auto_333105 ) ( ON-TABLE ?auto_333093 ) ( ON ?auto_333094 ?auto_333093 ) ( ON ?auto_333095 ?auto_333094 ) ( ON ?auto_333096 ?auto_333095 ) ( ON ?auto_333097 ?auto_333096 ) ( not ( = ?auto_333093 ?auto_333094 ) ) ( not ( = ?auto_333093 ?auto_333095 ) ) ( not ( = ?auto_333093 ?auto_333096 ) ) ( not ( = ?auto_333093 ?auto_333097 ) ) ( not ( = ?auto_333093 ?auto_333098 ) ) ( not ( = ?auto_333093 ?auto_333099 ) ) ( not ( = ?auto_333093 ?auto_333100 ) ) ( not ( = ?auto_333093 ?auto_333101 ) ) ( not ( = ?auto_333093 ?auto_333102 ) ) ( not ( = ?auto_333093 ?auto_333103 ) ) ( not ( = ?auto_333093 ?auto_333104 ) ) ( not ( = ?auto_333093 ?auto_333105 ) ) ( not ( = ?auto_333094 ?auto_333095 ) ) ( not ( = ?auto_333094 ?auto_333096 ) ) ( not ( = ?auto_333094 ?auto_333097 ) ) ( not ( = ?auto_333094 ?auto_333098 ) ) ( not ( = ?auto_333094 ?auto_333099 ) ) ( not ( = ?auto_333094 ?auto_333100 ) ) ( not ( = ?auto_333094 ?auto_333101 ) ) ( not ( = ?auto_333094 ?auto_333102 ) ) ( not ( = ?auto_333094 ?auto_333103 ) ) ( not ( = ?auto_333094 ?auto_333104 ) ) ( not ( = ?auto_333094 ?auto_333105 ) ) ( not ( = ?auto_333095 ?auto_333096 ) ) ( not ( = ?auto_333095 ?auto_333097 ) ) ( not ( = ?auto_333095 ?auto_333098 ) ) ( not ( = ?auto_333095 ?auto_333099 ) ) ( not ( = ?auto_333095 ?auto_333100 ) ) ( not ( = ?auto_333095 ?auto_333101 ) ) ( not ( = ?auto_333095 ?auto_333102 ) ) ( not ( = ?auto_333095 ?auto_333103 ) ) ( not ( = ?auto_333095 ?auto_333104 ) ) ( not ( = ?auto_333095 ?auto_333105 ) ) ( not ( = ?auto_333096 ?auto_333097 ) ) ( not ( = ?auto_333096 ?auto_333098 ) ) ( not ( = ?auto_333096 ?auto_333099 ) ) ( not ( = ?auto_333096 ?auto_333100 ) ) ( not ( = ?auto_333096 ?auto_333101 ) ) ( not ( = ?auto_333096 ?auto_333102 ) ) ( not ( = ?auto_333096 ?auto_333103 ) ) ( not ( = ?auto_333096 ?auto_333104 ) ) ( not ( = ?auto_333096 ?auto_333105 ) ) ( not ( = ?auto_333097 ?auto_333098 ) ) ( not ( = ?auto_333097 ?auto_333099 ) ) ( not ( = ?auto_333097 ?auto_333100 ) ) ( not ( = ?auto_333097 ?auto_333101 ) ) ( not ( = ?auto_333097 ?auto_333102 ) ) ( not ( = ?auto_333097 ?auto_333103 ) ) ( not ( = ?auto_333097 ?auto_333104 ) ) ( not ( = ?auto_333097 ?auto_333105 ) ) ( not ( = ?auto_333098 ?auto_333099 ) ) ( not ( = ?auto_333098 ?auto_333100 ) ) ( not ( = ?auto_333098 ?auto_333101 ) ) ( not ( = ?auto_333098 ?auto_333102 ) ) ( not ( = ?auto_333098 ?auto_333103 ) ) ( not ( = ?auto_333098 ?auto_333104 ) ) ( not ( = ?auto_333098 ?auto_333105 ) ) ( not ( = ?auto_333099 ?auto_333100 ) ) ( not ( = ?auto_333099 ?auto_333101 ) ) ( not ( = ?auto_333099 ?auto_333102 ) ) ( not ( = ?auto_333099 ?auto_333103 ) ) ( not ( = ?auto_333099 ?auto_333104 ) ) ( not ( = ?auto_333099 ?auto_333105 ) ) ( not ( = ?auto_333100 ?auto_333101 ) ) ( not ( = ?auto_333100 ?auto_333102 ) ) ( not ( = ?auto_333100 ?auto_333103 ) ) ( not ( = ?auto_333100 ?auto_333104 ) ) ( not ( = ?auto_333100 ?auto_333105 ) ) ( not ( = ?auto_333101 ?auto_333102 ) ) ( not ( = ?auto_333101 ?auto_333103 ) ) ( not ( = ?auto_333101 ?auto_333104 ) ) ( not ( = ?auto_333101 ?auto_333105 ) ) ( not ( = ?auto_333102 ?auto_333103 ) ) ( not ( = ?auto_333102 ?auto_333104 ) ) ( not ( = ?auto_333102 ?auto_333105 ) ) ( not ( = ?auto_333103 ?auto_333104 ) ) ( not ( = ?auto_333103 ?auto_333105 ) ) ( not ( = ?auto_333104 ?auto_333105 ) ) ( ON ?auto_333103 ?auto_333104 ) ( ON ?auto_333102 ?auto_333103 ) ( ON ?auto_333101 ?auto_333102 ) ( ON ?auto_333100 ?auto_333101 ) ( ON ?auto_333099 ?auto_333100 ) ( CLEAR ?auto_333097 ) ( ON ?auto_333098 ?auto_333099 ) ( CLEAR ?auto_333098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_333093 ?auto_333094 ?auto_333095 ?auto_333096 ?auto_333097 ?auto_333098 )
      ( MAKE-12PILE ?auto_333093 ?auto_333094 ?auto_333095 ?auto_333096 ?auto_333097 ?auto_333098 ?auto_333099 ?auto_333100 ?auto_333101 ?auto_333102 ?auto_333103 ?auto_333104 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_333118 - BLOCK
      ?auto_333119 - BLOCK
      ?auto_333120 - BLOCK
      ?auto_333121 - BLOCK
      ?auto_333122 - BLOCK
      ?auto_333123 - BLOCK
      ?auto_333124 - BLOCK
      ?auto_333125 - BLOCK
      ?auto_333126 - BLOCK
      ?auto_333127 - BLOCK
      ?auto_333128 - BLOCK
      ?auto_333129 - BLOCK
    )
    :vars
    (
      ?auto_333130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333129 ?auto_333130 ) ( ON-TABLE ?auto_333118 ) ( ON ?auto_333119 ?auto_333118 ) ( ON ?auto_333120 ?auto_333119 ) ( ON ?auto_333121 ?auto_333120 ) ( ON ?auto_333122 ?auto_333121 ) ( not ( = ?auto_333118 ?auto_333119 ) ) ( not ( = ?auto_333118 ?auto_333120 ) ) ( not ( = ?auto_333118 ?auto_333121 ) ) ( not ( = ?auto_333118 ?auto_333122 ) ) ( not ( = ?auto_333118 ?auto_333123 ) ) ( not ( = ?auto_333118 ?auto_333124 ) ) ( not ( = ?auto_333118 ?auto_333125 ) ) ( not ( = ?auto_333118 ?auto_333126 ) ) ( not ( = ?auto_333118 ?auto_333127 ) ) ( not ( = ?auto_333118 ?auto_333128 ) ) ( not ( = ?auto_333118 ?auto_333129 ) ) ( not ( = ?auto_333118 ?auto_333130 ) ) ( not ( = ?auto_333119 ?auto_333120 ) ) ( not ( = ?auto_333119 ?auto_333121 ) ) ( not ( = ?auto_333119 ?auto_333122 ) ) ( not ( = ?auto_333119 ?auto_333123 ) ) ( not ( = ?auto_333119 ?auto_333124 ) ) ( not ( = ?auto_333119 ?auto_333125 ) ) ( not ( = ?auto_333119 ?auto_333126 ) ) ( not ( = ?auto_333119 ?auto_333127 ) ) ( not ( = ?auto_333119 ?auto_333128 ) ) ( not ( = ?auto_333119 ?auto_333129 ) ) ( not ( = ?auto_333119 ?auto_333130 ) ) ( not ( = ?auto_333120 ?auto_333121 ) ) ( not ( = ?auto_333120 ?auto_333122 ) ) ( not ( = ?auto_333120 ?auto_333123 ) ) ( not ( = ?auto_333120 ?auto_333124 ) ) ( not ( = ?auto_333120 ?auto_333125 ) ) ( not ( = ?auto_333120 ?auto_333126 ) ) ( not ( = ?auto_333120 ?auto_333127 ) ) ( not ( = ?auto_333120 ?auto_333128 ) ) ( not ( = ?auto_333120 ?auto_333129 ) ) ( not ( = ?auto_333120 ?auto_333130 ) ) ( not ( = ?auto_333121 ?auto_333122 ) ) ( not ( = ?auto_333121 ?auto_333123 ) ) ( not ( = ?auto_333121 ?auto_333124 ) ) ( not ( = ?auto_333121 ?auto_333125 ) ) ( not ( = ?auto_333121 ?auto_333126 ) ) ( not ( = ?auto_333121 ?auto_333127 ) ) ( not ( = ?auto_333121 ?auto_333128 ) ) ( not ( = ?auto_333121 ?auto_333129 ) ) ( not ( = ?auto_333121 ?auto_333130 ) ) ( not ( = ?auto_333122 ?auto_333123 ) ) ( not ( = ?auto_333122 ?auto_333124 ) ) ( not ( = ?auto_333122 ?auto_333125 ) ) ( not ( = ?auto_333122 ?auto_333126 ) ) ( not ( = ?auto_333122 ?auto_333127 ) ) ( not ( = ?auto_333122 ?auto_333128 ) ) ( not ( = ?auto_333122 ?auto_333129 ) ) ( not ( = ?auto_333122 ?auto_333130 ) ) ( not ( = ?auto_333123 ?auto_333124 ) ) ( not ( = ?auto_333123 ?auto_333125 ) ) ( not ( = ?auto_333123 ?auto_333126 ) ) ( not ( = ?auto_333123 ?auto_333127 ) ) ( not ( = ?auto_333123 ?auto_333128 ) ) ( not ( = ?auto_333123 ?auto_333129 ) ) ( not ( = ?auto_333123 ?auto_333130 ) ) ( not ( = ?auto_333124 ?auto_333125 ) ) ( not ( = ?auto_333124 ?auto_333126 ) ) ( not ( = ?auto_333124 ?auto_333127 ) ) ( not ( = ?auto_333124 ?auto_333128 ) ) ( not ( = ?auto_333124 ?auto_333129 ) ) ( not ( = ?auto_333124 ?auto_333130 ) ) ( not ( = ?auto_333125 ?auto_333126 ) ) ( not ( = ?auto_333125 ?auto_333127 ) ) ( not ( = ?auto_333125 ?auto_333128 ) ) ( not ( = ?auto_333125 ?auto_333129 ) ) ( not ( = ?auto_333125 ?auto_333130 ) ) ( not ( = ?auto_333126 ?auto_333127 ) ) ( not ( = ?auto_333126 ?auto_333128 ) ) ( not ( = ?auto_333126 ?auto_333129 ) ) ( not ( = ?auto_333126 ?auto_333130 ) ) ( not ( = ?auto_333127 ?auto_333128 ) ) ( not ( = ?auto_333127 ?auto_333129 ) ) ( not ( = ?auto_333127 ?auto_333130 ) ) ( not ( = ?auto_333128 ?auto_333129 ) ) ( not ( = ?auto_333128 ?auto_333130 ) ) ( not ( = ?auto_333129 ?auto_333130 ) ) ( ON ?auto_333128 ?auto_333129 ) ( ON ?auto_333127 ?auto_333128 ) ( ON ?auto_333126 ?auto_333127 ) ( ON ?auto_333125 ?auto_333126 ) ( ON ?auto_333124 ?auto_333125 ) ( CLEAR ?auto_333122 ) ( ON ?auto_333123 ?auto_333124 ) ( CLEAR ?auto_333123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_333118 ?auto_333119 ?auto_333120 ?auto_333121 ?auto_333122 ?auto_333123 )
      ( MAKE-12PILE ?auto_333118 ?auto_333119 ?auto_333120 ?auto_333121 ?auto_333122 ?auto_333123 ?auto_333124 ?auto_333125 ?auto_333126 ?auto_333127 ?auto_333128 ?auto_333129 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_333143 - BLOCK
      ?auto_333144 - BLOCK
      ?auto_333145 - BLOCK
      ?auto_333146 - BLOCK
      ?auto_333147 - BLOCK
      ?auto_333148 - BLOCK
      ?auto_333149 - BLOCK
      ?auto_333150 - BLOCK
      ?auto_333151 - BLOCK
      ?auto_333152 - BLOCK
      ?auto_333153 - BLOCK
      ?auto_333154 - BLOCK
    )
    :vars
    (
      ?auto_333155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333154 ?auto_333155 ) ( ON-TABLE ?auto_333143 ) ( ON ?auto_333144 ?auto_333143 ) ( ON ?auto_333145 ?auto_333144 ) ( ON ?auto_333146 ?auto_333145 ) ( not ( = ?auto_333143 ?auto_333144 ) ) ( not ( = ?auto_333143 ?auto_333145 ) ) ( not ( = ?auto_333143 ?auto_333146 ) ) ( not ( = ?auto_333143 ?auto_333147 ) ) ( not ( = ?auto_333143 ?auto_333148 ) ) ( not ( = ?auto_333143 ?auto_333149 ) ) ( not ( = ?auto_333143 ?auto_333150 ) ) ( not ( = ?auto_333143 ?auto_333151 ) ) ( not ( = ?auto_333143 ?auto_333152 ) ) ( not ( = ?auto_333143 ?auto_333153 ) ) ( not ( = ?auto_333143 ?auto_333154 ) ) ( not ( = ?auto_333143 ?auto_333155 ) ) ( not ( = ?auto_333144 ?auto_333145 ) ) ( not ( = ?auto_333144 ?auto_333146 ) ) ( not ( = ?auto_333144 ?auto_333147 ) ) ( not ( = ?auto_333144 ?auto_333148 ) ) ( not ( = ?auto_333144 ?auto_333149 ) ) ( not ( = ?auto_333144 ?auto_333150 ) ) ( not ( = ?auto_333144 ?auto_333151 ) ) ( not ( = ?auto_333144 ?auto_333152 ) ) ( not ( = ?auto_333144 ?auto_333153 ) ) ( not ( = ?auto_333144 ?auto_333154 ) ) ( not ( = ?auto_333144 ?auto_333155 ) ) ( not ( = ?auto_333145 ?auto_333146 ) ) ( not ( = ?auto_333145 ?auto_333147 ) ) ( not ( = ?auto_333145 ?auto_333148 ) ) ( not ( = ?auto_333145 ?auto_333149 ) ) ( not ( = ?auto_333145 ?auto_333150 ) ) ( not ( = ?auto_333145 ?auto_333151 ) ) ( not ( = ?auto_333145 ?auto_333152 ) ) ( not ( = ?auto_333145 ?auto_333153 ) ) ( not ( = ?auto_333145 ?auto_333154 ) ) ( not ( = ?auto_333145 ?auto_333155 ) ) ( not ( = ?auto_333146 ?auto_333147 ) ) ( not ( = ?auto_333146 ?auto_333148 ) ) ( not ( = ?auto_333146 ?auto_333149 ) ) ( not ( = ?auto_333146 ?auto_333150 ) ) ( not ( = ?auto_333146 ?auto_333151 ) ) ( not ( = ?auto_333146 ?auto_333152 ) ) ( not ( = ?auto_333146 ?auto_333153 ) ) ( not ( = ?auto_333146 ?auto_333154 ) ) ( not ( = ?auto_333146 ?auto_333155 ) ) ( not ( = ?auto_333147 ?auto_333148 ) ) ( not ( = ?auto_333147 ?auto_333149 ) ) ( not ( = ?auto_333147 ?auto_333150 ) ) ( not ( = ?auto_333147 ?auto_333151 ) ) ( not ( = ?auto_333147 ?auto_333152 ) ) ( not ( = ?auto_333147 ?auto_333153 ) ) ( not ( = ?auto_333147 ?auto_333154 ) ) ( not ( = ?auto_333147 ?auto_333155 ) ) ( not ( = ?auto_333148 ?auto_333149 ) ) ( not ( = ?auto_333148 ?auto_333150 ) ) ( not ( = ?auto_333148 ?auto_333151 ) ) ( not ( = ?auto_333148 ?auto_333152 ) ) ( not ( = ?auto_333148 ?auto_333153 ) ) ( not ( = ?auto_333148 ?auto_333154 ) ) ( not ( = ?auto_333148 ?auto_333155 ) ) ( not ( = ?auto_333149 ?auto_333150 ) ) ( not ( = ?auto_333149 ?auto_333151 ) ) ( not ( = ?auto_333149 ?auto_333152 ) ) ( not ( = ?auto_333149 ?auto_333153 ) ) ( not ( = ?auto_333149 ?auto_333154 ) ) ( not ( = ?auto_333149 ?auto_333155 ) ) ( not ( = ?auto_333150 ?auto_333151 ) ) ( not ( = ?auto_333150 ?auto_333152 ) ) ( not ( = ?auto_333150 ?auto_333153 ) ) ( not ( = ?auto_333150 ?auto_333154 ) ) ( not ( = ?auto_333150 ?auto_333155 ) ) ( not ( = ?auto_333151 ?auto_333152 ) ) ( not ( = ?auto_333151 ?auto_333153 ) ) ( not ( = ?auto_333151 ?auto_333154 ) ) ( not ( = ?auto_333151 ?auto_333155 ) ) ( not ( = ?auto_333152 ?auto_333153 ) ) ( not ( = ?auto_333152 ?auto_333154 ) ) ( not ( = ?auto_333152 ?auto_333155 ) ) ( not ( = ?auto_333153 ?auto_333154 ) ) ( not ( = ?auto_333153 ?auto_333155 ) ) ( not ( = ?auto_333154 ?auto_333155 ) ) ( ON ?auto_333153 ?auto_333154 ) ( ON ?auto_333152 ?auto_333153 ) ( ON ?auto_333151 ?auto_333152 ) ( ON ?auto_333150 ?auto_333151 ) ( ON ?auto_333149 ?auto_333150 ) ( ON ?auto_333148 ?auto_333149 ) ( CLEAR ?auto_333146 ) ( ON ?auto_333147 ?auto_333148 ) ( CLEAR ?auto_333147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_333143 ?auto_333144 ?auto_333145 ?auto_333146 ?auto_333147 )
      ( MAKE-12PILE ?auto_333143 ?auto_333144 ?auto_333145 ?auto_333146 ?auto_333147 ?auto_333148 ?auto_333149 ?auto_333150 ?auto_333151 ?auto_333152 ?auto_333153 ?auto_333154 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_333168 - BLOCK
      ?auto_333169 - BLOCK
      ?auto_333170 - BLOCK
      ?auto_333171 - BLOCK
      ?auto_333172 - BLOCK
      ?auto_333173 - BLOCK
      ?auto_333174 - BLOCK
      ?auto_333175 - BLOCK
      ?auto_333176 - BLOCK
      ?auto_333177 - BLOCK
      ?auto_333178 - BLOCK
      ?auto_333179 - BLOCK
    )
    :vars
    (
      ?auto_333180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333179 ?auto_333180 ) ( ON-TABLE ?auto_333168 ) ( ON ?auto_333169 ?auto_333168 ) ( ON ?auto_333170 ?auto_333169 ) ( ON ?auto_333171 ?auto_333170 ) ( not ( = ?auto_333168 ?auto_333169 ) ) ( not ( = ?auto_333168 ?auto_333170 ) ) ( not ( = ?auto_333168 ?auto_333171 ) ) ( not ( = ?auto_333168 ?auto_333172 ) ) ( not ( = ?auto_333168 ?auto_333173 ) ) ( not ( = ?auto_333168 ?auto_333174 ) ) ( not ( = ?auto_333168 ?auto_333175 ) ) ( not ( = ?auto_333168 ?auto_333176 ) ) ( not ( = ?auto_333168 ?auto_333177 ) ) ( not ( = ?auto_333168 ?auto_333178 ) ) ( not ( = ?auto_333168 ?auto_333179 ) ) ( not ( = ?auto_333168 ?auto_333180 ) ) ( not ( = ?auto_333169 ?auto_333170 ) ) ( not ( = ?auto_333169 ?auto_333171 ) ) ( not ( = ?auto_333169 ?auto_333172 ) ) ( not ( = ?auto_333169 ?auto_333173 ) ) ( not ( = ?auto_333169 ?auto_333174 ) ) ( not ( = ?auto_333169 ?auto_333175 ) ) ( not ( = ?auto_333169 ?auto_333176 ) ) ( not ( = ?auto_333169 ?auto_333177 ) ) ( not ( = ?auto_333169 ?auto_333178 ) ) ( not ( = ?auto_333169 ?auto_333179 ) ) ( not ( = ?auto_333169 ?auto_333180 ) ) ( not ( = ?auto_333170 ?auto_333171 ) ) ( not ( = ?auto_333170 ?auto_333172 ) ) ( not ( = ?auto_333170 ?auto_333173 ) ) ( not ( = ?auto_333170 ?auto_333174 ) ) ( not ( = ?auto_333170 ?auto_333175 ) ) ( not ( = ?auto_333170 ?auto_333176 ) ) ( not ( = ?auto_333170 ?auto_333177 ) ) ( not ( = ?auto_333170 ?auto_333178 ) ) ( not ( = ?auto_333170 ?auto_333179 ) ) ( not ( = ?auto_333170 ?auto_333180 ) ) ( not ( = ?auto_333171 ?auto_333172 ) ) ( not ( = ?auto_333171 ?auto_333173 ) ) ( not ( = ?auto_333171 ?auto_333174 ) ) ( not ( = ?auto_333171 ?auto_333175 ) ) ( not ( = ?auto_333171 ?auto_333176 ) ) ( not ( = ?auto_333171 ?auto_333177 ) ) ( not ( = ?auto_333171 ?auto_333178 ) ) ( not ( = ?auto_333171 ?auto_333179 ) ) ( not ( = ?auto_333171 ?auto_333180 ) ) ( not ( = ?auto_333172 ?auto_333173 ) ) ( not ( = ?auto_333172 ?auto_333174 ) ) ( not ( = ?auto_333172 ?auto_333175 ) ) ( not ( = ?auto_333172 ?auto_333176 ) ) ( not ( = ?auto_333172 ?auto_333177 ) ) ( not ( = ?auto_333172 ?auto_333178 ) ) ( not ( = ?auto_333172 ?auto_333179 ) ) ( not ( = ?auto_333172 ?auto_333180 ) ) ( not ( = ?auto_333173 ?auto_333174 ) ) ( not ( = ?auto_333173 ?auto_333175 ) ) ( not ( = ?auto_333173 ?auto_333176 ) ) ( not ( = ?auto_333173 ?auto_333177 ) ) ( not ( = ?auto_333173 ?auto_333178 ) ) ( not ( = ?auto_333173 ?auto_333179 ) ) ( not ( = ?auto_333173 ?auto_333180 ) ) ( not ( = ?auto_333174 ?auto_333175 ) ) ( not ( = ?auto_333174 ?auto_333176 ) ) ( not ( = ?auto_333174 ?auto_333177 ) ) ( not ( = ?auto_333174 ?auto_333178 ) ) ( not ( = ?auto_333174 ?auto_333179 ) ) ( not ( = ?auto_333174 ?auto_333180 ) ) ( not ( = ?auto_333175 ?auto_333176 ) ) ( not ( = ?auto_333175 ?auto_333177 ) ) ( not ( = ?auto_333175 ?auto_333178 ) ) ( not ( = ?auto_333175 ?auto_333179 ) ) ( not ( = ?auto_333175 ?auto_333180 ) ) ( not ( = ?auto_333176 ?auto_333177 ) ) ( not ( = ?auto_333176 ?auto_333178 ) ) ( not ( = ?auto_333176 ?auto_333179 ) ) ( not ( = ?auto_333176 ?auto_333180 ) ) ( not ( = ?auto_333177 ?auto_333178 ) ) ( not ( = ?auto_333177 ?auto_333179 ) ) ( not ( = ?auto_333177 ?auto_333180 ) ) ( not ( = ?auto_333178 ?auto_333179 ) ) ( not ( = ?auto_333178 ?auto_333180 ) ) ( not ( = ?auto_333179 ?auto_333180 ) ) ( ON ?auto_333178 ?auto_333179 ) ( ON ?auto_333177 ?auto_333178 ) ( ON ?auto_333176 ?auto_333177 ) ( ON ?auto_333175 ?auto_333176 ) ( ON ?auto_333174 ?auto_333175 ) ( ON ?auto_333173 ?auto_333174 ) ( CLEAR ?auto_333171 ) ( ON ?auto_333172 ?auto_333173 ) ( CLEAR ?auto_333172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_333168 ?auto_333169 ?auto_333170 ?auto_333171 ?auto_333172 )
      ( MAKE-12PILE ?auto_333168 ?auto_333169 ?auto_333170 ?auto_333171 ?auto_333172 ?auto_333173 ?auto_333174 ?auto_333175 ?auto_333176 ?auto_333177 ?auto_333178 ?auto_333179 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_333193 - BLOCK
      ?auto_333194 - BLOCK
      ?auto_333195 - BLOCK
      ?auto_333196 - BLOCK
      ?auto_333197 - BLOCK
      ?auto_333198 - BLOCK
      ?auto_333199 - BLOCK
      ?auto_333200 - BLOCK
      ?auto_333201 - BLOCK
      ?auto_333202 - BLOCK
      ?auto_333203 - BLOCK
      ?auto_333204 - BLOCK
    )
    :vars
    (
      ?auto_333205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333204 ?auto_333205 ) ( ON-TABLE ?auto_333193 ) ( ON ?auto_333194 ?auto_333193 ) ( ON ?auto_333195 ?auto_333194 ) ( not ( = ?auto_333193 ?auto_333194 ) ) ( not ( = ?auto_333193 ?auto_333195 ) ) ( not ( = ?auto_333193 ?auto_333196 ) ) ( not ( = ?auto_333193 ?auto_333197 ) ) ( not ( = ?auto_333193 ?auto_333198 ) ) ( not ( = ?auto_333193 ?auto_333199 ) ) ( not ( = ?auto_333193 ?auto_333200 ) ) ( not ( = ?auto_333193 ?auto_333201 ) ) ( not ( = ?auto_333193 ?auto_333202 ) ) ( not ( = ?auto_333193 ?auto_333203 ) ) ( not ( = ?auto_333193 ?auto_333204 ) ) ( not ( = ?auto_333193 ?auto_333205 ) ) ( not ( = ?auto_333194 ?auto_333195 ) ) ( not ( = ?auto_333194 ?auto_333196 ) ) ( not ( = ?auto_333194 ?auto_333197 ) ) ( not ( = ?auto_333194 ?auto_333198 ) ) ( not ( = ?auto_333194 ?auto_333199 ) ) ( not ( = ?auto_333194 ?auto_333200 ) ) ( not ( = ?auto_333194 ?auto_333201 ) ) ( not ( = ?auto_333194 ?auto_333202 ) ) ( not ( = ?auto_333194 ?auto_333203 ) ) ( not ( = ?auto_333194 ?auto_333204 ) ) ( not ( = ?auto_333194 ?auto_333205 ) ) ( not ( = ?auto_333195 ?auto_333196 ) ) ( not ( = ?auto_333195 ?auto_333197 ) ) ( not ( = ?auto_333195 ?auto_333198 ) ) ( not ( = ?auto_333195 ?auto_333199 ) ) ( not ( = ?auto_333195 ?auto_333200 ) ) ( not ( = ?auto_333195 ?auto_333201 ) ) ( not ( = ?auto_333195 ?auto_333202 ) ) ( not ( = ?auto_333195 ?auto_333203 ) ) ( not ( = ?auto_333195 ?auto_333204 ) ) ( not ( = ?auto_333195 ?auto_333205 ) ) ( not ( = ?auto_333196 ?auto_333197 ) ) ( not ( = ?auto_333196 ?auto_333198 ) ) ( not ( = ?auto_333196 ?auto_333199 ) ) ( not ( = ?auto_333196 ?auto_333200 ) ) ( not ( = ?auto_333196 ?auto_333201 ) ) ( not ( = ?auto_333196 ?auto_333202 ) ) ( not ( = ?auto_333196 ?auto_333203 ) ) ( not ( = ?auto_333196 ?auto_333204 ) ) ( not ( = ?auto_333196 ?auto_333205 ) ) ( not ( = ?auto_333197 ?auto_333198 ) ) ( not ( = ?auto_333197 ?auto_333199 ) ) ( not ( = ?auto_333197 ?auto_333200 ) ) ( not ( = ?auto_333197 ?auto_333201 ) ) ( not ( = ?auto_333197 ?auto_333202 ) ) ( not ( = ?auto_333197 ?auto_333203 ) ) ( not ( = ?auto_333197 ?auto_333204 ) ) ( not ( = ?auto_333197 ?auto_333205 ) ) ( not ( = ?auto_333198 ?auto_333199 ) ) ( not ( = ?auto_333198 ?auto_333200 ) ) ( not ( = ?auto_333198 ?auto_333201 ) ) ( not ( = ?auto_333198 ?auto_333202 ) ) ( not ( = ?auto_333198 ?auto_333203 ) ) ( not ( = ?auto_333198 ?auto_333204 ) ) ( not ( = ?auto_333198 ?auto_333205 ) ) ( not ( = ?auto_333199 ?auto_333200 ) ) ( not ( = ?auto_333199 ?auto_333201 ) ) ( not ( = ?auto_333199 ?auto_333202 ) ) ( not ( = ?auto_333199 ?auto_333203 ) ) ( not ( = ?auto_333199 ?auto_333204 ) ) ( not ( = ?auto_333199 ?auto_333205 ) ) ( not ( = ?auto_333200 ?auto_333201 ) ) ( not ( = ?auto_333200 ?auto_333202 ) ) ( not ( = ?auto_333200 ?auto_333203 ) ) ( not ( = ?auto_333200 ?auto_333204 ) ) ( not ( = ?auto_333200 ?auto_333205 ) ) ( not ( = ?auto_333201 ?auto_333202 ) ) ( not ( = ?auto_333201 ?auto_333203 ) ) ( not ( = ?auto_333201 ?auto_333204 ) ) ( not ( = ?auto_333201 ?auto_333205 ) ) ( not ( = ?auto_333202 ?auto_333203 ) ) ( not ( = ?auto_333202 ?auto_333204 ) ) ( not ( = ?auto_333202 ?auto_333205 ) ) ( not ( = ?auto_333203 ?auto_333204 ) ) ( not ( = ?auto_333203 ?auto_333205 ) ) ( not ( = ?auto_333204 ?auto_333205 ) ) ( ON ?auto_333203 ?auto_333204 ) ( ON ?auto_333202 ?auto_333203 ) ( ON ?auto_333201 ?auto_333202 ) ( ON ?auto_333200 ?auto_333201 ) ( ON ?auto_333199 ?auto_333200 ) ( ON ?auto_333198 ?auto_333199 ) ( ON ?auto_333197 ?auto_333198 ) ( CLEAR ?auto_333195 ) ( ON ?auto_333196 ?auto_333197 ) ( CLEAR ?auto_333196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_333193 ?auto_333194 ?auto_333195 ?auto_333196 )
      ( MAKE-12PILE ?auto_333193 ?auto_333194 ?auto_333195 ?auto_333196 ?auto_333197 ?auto_333198 ?auto_333199 ?auto_333200 ?auto_333201 ?auto_333202 ?auto_333203 ?auto_333204 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_333218 - BLOCK
      ?auto_333219 - BLOCK
      ?auto_333220 - BLOCK
      ?auto_333221 - BLOCK
      ?auto_333222 - BLOCK
      ?auto_333223 - BLOCK
      ?auto_333224 - BLOCK
      ?auto_333225 - BLOCK
      ?auto_333226 - BLOCK
      ?auto_333227 - BLOCK
      ?auto_333228 - BLOCK
      ?auto_333229 - BLOCK
    )
    :vars
    (
      ?auto_333230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333229 ?auto_333230 ) ( ON-TABLE ?auto_333218 ) ( ON ?auto_333219 ?auto_333218 ) ( ON ?auto_333220 ?auto_333219 ) ( not ( = ?auto_333218 ?auto_333219 ) ) ( not ( = ?auto_333218 ?auto_333220 ) ) ( not ( = ?auto_333218 ?auto_333221 ) ) ( not ( = ?auto_333218 ?auto_333222 ) ) ( not ( = ?auto_333218 ?auto_333223 ) ) ( not ( = ?auto_333218 ?auto_333224 ) ) ( not ( = ?auto_333218 ?auto_333225 ) ) ( not ( = ?auto_333218 ?auto_333226 ) ) ( not ( = ?auto_333218 ?auto_333227 ) ) ( not ( = ?auto_333218 ?auto_333228 ) ) ( not ( = ?auto_333218 ?auto_333229 ) ) ( not ( = ?auto_333218 ?auto_333230 ) ) ( not ( = ?auto_333219 ?auto_333220 ) ) ( not ( = ?auto_333219 ?auto_333221 ) ) ( not ( = ?auto_333219 ?auto_333222 ) ) ( not ( = ?auto_333219 ?auto_333223 ) ) ( not ( = ?auto_333219 ?auto_333224 ) ) ( not ( = ?auto_333219 ?auto_333225 ) ) ( not ( = ?auto_333219 ?auto_333226 ) ) ( not ( = ?auto_333219 ?auto_333227 ) ) ( not ( = ?auto_333219 ?auto_333228 ) ) ( not ( = ?auto_333219 ?auto_333229 ) ) ( not ( = ?auto_333219 ?auto_333230 ) ) ( not ( = ?auto_333220 ?auto_333221 ) ) ( not ( = ?auto_333220 ?auto_333222 ) ) ( not ( = ?auto_333220 ?auto_333223 ) ) ( not ( = ?auto_333220 ?auto_333224 ) ) ( not ( = ?auto_333220 ?auto_333225 ) ) ( not ( = ?auto_333220 ?auto_333226 ) ) ( not ( = ?auto_333220 ?auto_333227 ) ) ( not ( = ?auto_333220 ?auto_333228 ) ) ( not ( = ?auto_333220 ?auto_333229 ) ) ( not ( = ?auto_333220 ?auto_333230 ) ) ( not ( = ?auto_333221 ?auto_333222 ) ) ( not ( = ?auto_333221 ?auto_333223 ) ) ( not ( = ?auto_333221 ?auto_333224 ) ) ( not ( = ?auto_333221 ?auto_333225 ) ) ( not ( = ?auto_333221 ?auto_333226 ) ) ( not ( = ?auto_333221 ?auto_333227 ) ) ( not ( = ?auto_333221 ?auto_333228 ) ) ( not ( = ?auto_333221 ?auto_333229 ) ) ( not ( = ?auto_333221 ?auto_333230 ) ) ( not ( = ?auto_333222 ?auto_333223 ) ) ( not ( = ?auto_333222 ?auto_333224 ) ) ( not ( = ?auto_333222 ?auto_333225 ) ) ( not ( = ?auto_333222 ?auto_333226 ) ) ( not ( = ?auto_333222 ?auto_333227 ) ) ( not ( = ?auto_333222 ?auto_333228 ) ) ( not ( = ?auto_333222 ?auto_333229 ) ) ( not ( = ?auto_333222 ?auto_333230 ) ) ( not ( = ?auto_333223 ?auto_333224 ) ) ( not ( = ?auto_333223 ?auto_333225 ) ) ( not ( = ?auto_333223 ?auto_333226 ) ) ( not ( = ?auto_333223 ?auto_333227 ) ) ( not ( = ?auto_333223 ?auto_333228 ) ) ( not ( = ?auto_333223 ?auto_333229 ) ) ( not ( = ?auto_333223 ?auto_333230 ) ) ( not ( = ?auto_333224 ?auto_333225 ) ) ( not ( = ?auto_333224 ?auto_333226 ) ) ( not ( = ?auto_333224 ?auto_333227 ) ) ( not ( = ?auto_333224 ?auto_333228 ) ) ( not ( = ?auto_333224 ?auto_333229 ) ) ( not ( = ?auto_333224 ?auto_333230 ) ) ( not ( = ?auto_333225 ?auto_333226 ) ) ( not ( = ?auto_333225 ?auto_333227 ) ) ( not ( = ?auto_333225 ?auto_333228 ) ) ( not ( = ?auto_333225 ?auto_333229 ) ) ( not ( = ?auto_333225 ?auto_333230 ) ) ( not ( = ?auto_333226 ?auto_333227 ) ) ( not ( = ?auto_333226 ?auto_333228 ) ) ( not ( = ?auto_333226 ?auto_333229 ) ) ( not ( = ?auto_333226 ?auto_333230 ) ) ( not ( = ?auto_333227 ?auto_333228 ) ) ( not ( = ?auto_333227 ?auto_333229 ) ) ( not ( = ?auto_333227 ?auto_333230 ) ) ( not ( = ?auto_333228 ?auto_333229 ) ) ( not ( = ?auto_333228 ?auto_333230 ) ) ( not ( = ?auto_333229 ?auto_333230 ) ) ( ON ?auto_333228 ?auto_333229 ) ( ON ?auto_333227 ?auto_333228 ) ( ON ?auto_333226 ?auto_333227 ) ( ON ?auto_333225 ?auto_333226 ) ( ON ?auto_333224 ?auto_333225 ) ( ON ?auto_333223 ?auto_333224 ) ( ON ?auto_333222 ?auto_333223 ) ( CLEAR ?auto_333220 ) ( ON ?auto_333221 ?auto_333222 ) ( CLEAR ?auto_333221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_333218 ?auto_333219 ?auto_333220 ?auto_333221 )
      ( MAKE-12PILE ?auto_333218 ?auto_333219 ?auto_333220 ?auto_333221 ?auto_333222 ?auto_333223 ?auto_333224 ?auto_333225 ?auto_333226 ?auto_333227 ?auto_333228 ?auto_333229 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_333243 - BLOCK
      ?auto_333244 - BLOCK
      ?auto_333245 - BLOCK
      ?auto_333246 - BLOCK
      ?auto_333247 - BLOCK
      ?auto_333248 - BLOCK
      ?auto_333249 - BLOCK
      ?auto_333250 - BLOCK
      ?auto_333251 - BLOCK
      ?auto_333252 - BLOCK
      ?auto_333253 - BLOCK
      ?auto_333254 - BLOCK
    )
    :vars
    (
      ?auto_333255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333254 ?auto_333255 ) ( ON-TABLE ?auto_333243 ) ( ON ?auto_333244 ?auto_333243 ) ( not ( = ?auto_333243 ?auto_333244 ) ) ( not ( = ?auto_333243 ?auto_333245 ) ) ( not ( = ?auto_333243 ?auto_333246 ) ) ( not ( = ?auto_333243 ?auto_333247 ) ) ( not ( = ?auto_333243 ?auto_333248 ) ) ( not ( = ?auto_333243 ?auto_333249 ) ) ( not ( = ?auto_333243 ?auto_333250 ) ) ( not ( = ?auto_333243 ?auto_333251 ) ) ( not ( = ?auto_333243 ?auto_333252 ) ) ( not ( = ?auto_333243 ?auto_333253 ) ) ( not ( = ?auto_333243 ?auto_333254 ) ) ( not ( = ?auto_333243 ?auto_333255 ) ) ( not ( = ?auto_333244 ?auto_333245 ) ) ( not ( = ?auto_333244 ?auto_333246 ) ) ( not ( = ?auto_333244 ?auto_333247 ) ) ( not ( = ?auto_333244 ?auto_333248 ) ) ( not ( = ?auto_333244 ?auto_333249 ) ) ( not ( = ?auto_333244 ?auto_333250 ) ) ( not ( = ?auto_333244 ?auto_333251 ) ) ( not ( = ?auto_333244 ?auto_333252 ) ) ( not ( = ?auto_333244 ?auto_333253 ) ) ( not ( = ?auto_333244 ?auto_333254 ) ) ( not ( = ?auto_333244 ?auto_333255 ) ) ( not ( = ?auto_333245 ?auto_333246 ) ) ( not ( = ?auto_333245 ?auto_333247 ) ) ( not ( = ?auto_333245 ?auto_333248 ) ) ( not ( = ?auto_333245 ?auto_333249 ) ) ( not ( = ?auto_333245 ?auto_333250 ) ) ( not ( = ?auto_333245 ?auto_333251 ) ) ( not ( = ?auto_333245 ?auto_333252 ) ) ( not ( = ?auto_333245 ?auto_333253 ) ) ( not ( = ?auto_333245 ?auto_333254 ) ) ( not ( = ?auto_333245 ?auto_333255 ) ) ( not ( = ?auto_333246 ?auto_333247 ) ) ( not ( = ?auto_333246 ?auto_333248 ) ) ( not ( = ?auto_333246 ?auto_333249 ) ) ( not ( = ?auto_333246 ?auto_333250 ) ) ( not ( = ?auto_333246 ?auto_333251 ) ) ( not ( = ?auto_333246 ?auto_333252 ) ) ( not ( = ?auto_333246 ?auto_333253 ) ) ( not ( = ?auto_333246 ?auto_333254 ) ) ( not ( = ?auto_333246 ?auto_333255 ) ) ( not ( = ?auto_333247 ?auto_333248 ) ) ( not ( = ?auto_333247 ?auto_333249 ) ) ( not ( = ?auto_333247 ?auto_333250 ) ) ( not ( = ?auto_333247 ?auto_333251 ) ) ( not ( = ?auto_333247 ?auto_333252 ) ) ( not ( = ?auto_333247 ?auto_333253 ) ) ( not ( = ?auto_333247 ?auto_333254 ) ) ( not ( = ?auto_333247 ?auto_333255 ) ) ( not ( = ?auto_333248 ?auto_333249 ) ) ( not ( = ?auto_333248 ?auto_333250 ) ) ( not ( = ?auto_333248 ?auto_333251 ) ) ( not ( = ?auto_333248 ?auto_333252 ) ) ( not ( = ?auto_333248 ?auto_333253 ) ) ( not ( = ?auto_333248 ?auto_333254 ) ) ( not ( = ?auto_333248 ?auto_333255 ) ) ( not ( = ?auto_333249 ?auto_333250 ) ) ( not ( = ?auto_333249 ?auto_333251 ) ) ( not ( = ?auto_333249 ?auto_333252 ) ) ( not ( = ?auto_333249 ?auto_333253 ) ) ( not ( = ?auto_333249 ?auto_333254 ) ) ( not ( = ?auto_333249 ?auto_333255 ) ) ( not ( = ?auto_333250 ?auto_333251 ) ) ( not ( = ?auto_333250 ?auto_333252 ) ) ( not ( = ?auto_333250 ?auto_333253 ) ) ( not ( = ?auto_333250 ?auto_333254 ) ) ( not ( = ?auto_333250 ?auto_333255 ) ) ( not ( = ?auto_333251 ?auto_333252 ) ) ( not ( = ?auto_333251 ?auto_333253 ) ) ( not ( = ?auto_333251 ?auto_333254 ) ) ( not ( = ?auto_333251 ?auto_333255 ) ) ( not ( = ?auto_333252 ?auto_333253 ) ) ( not ( = ?auto_333252 ?auto_333254 ) ) ( not ( = ?auto_333252 ?auto_333255 ) ) ( not ( = ?auto_333253 ?auto_333254 ) ) ( not ( = ?auto_333253 ?auto_333255 ) ) ( not ( = ?auto_333254 ?auto_333255 ) ) ( ON ?auto_333253 ?auto_333254 ) ( ON ?auto_333252 ?auto_333253 ) ( ON ?auto_333251 ?auto_333252 ) ( ON ?auto_333250 ?auto_333251 ) ( ON ?auto_333249 ?auto_333250 ) ( ON ?auto_333248 ?auto_333249 ) ( ON ?auto_333247 ?auto_333248 ) ( ON ?auto_333246 ?auto_333247 ) ( CLEAR ?auto_333244 ) ( ON ?auto_333245 ?auto_333246 ) ( CLEAR ?auto_333245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_333243 ?auto_333244 ?auto_333245 )
      ( MAKE-12PILE ?auto_333243 ?auto_333244 ?auto_333245 ?auto_333246 ?auto_333247 ?auto_333248 ?auto_333249 ?auto_333250 ?auto_333251 ?auto_333252 ?auto_333253 ?auto_333254 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_333268 - BLOCK
      ?auto_333269 - BLOCK
      ?auto_333270 - BLOCK
      ?auto_333271 - BLOCK
      ?auto_333272 - BLOCK
      ?auto_333273 - BLOCK
      ?auto_333274 - BLOCK
      ?auto_333275 - BLOCK
      ?auto_333276 - BLOCK
      ?auto_333277 - BLOCK
      ?auto_333278 - BLOCK
      ?auto_333279 - BLOCK
    )
    :vars
    (
      ?auto_333280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333279 ?auto_333280 ) ( ON-TABLE ?auto_333268 ) ( ON ?auto_333269 ?auto_333268 ) ( not ( = ?auto_333268 ?auto_333269 ) ) ( not ( = ?auto_333268 ?auto_333270 ) ) ( not ( = ?auto_333268 ?auto_333271 ) ) ( not ( = ?auto_333268 ?auto_333272 ) ) ( not ( = ?auto_333268 ?auto_333273 ) ) ( not ( = ?auto_333268 ?auto_333274 ) ) ( not ( = ?auto_333268 ?auto_333275 ) ) ( not ( = ?auto_333268 ?auto_333276 ) ) ( not ( = ?auto_333268 ?auto_333277 ) ) ( not ( = ?auto_333268 ?auto_333278 ) ) ( not ( = ?auto_333268 ?auto_333279 ) ) ( not ( = ?auto_333268 ?auto_333280 ) ) ( not ( = ?auto_333269 ?auto_333270 ) ) ( not ( = ?auto_333269 ?auto_333271 ) ) ( not ( = ?auto_333269 ?auto_333272 ) ) ( not ( = ?auto_333269 ?auto_333273 ) ) ( not ( = ?auto_333269 ?auto_333274 ) ) ( not ( = ?auto_333269 ?auto_333275 ) ) ( not ( = ?auto_333269 ?auto_333276 ) ) ( not ( = ?auto_333269 ?auto_333277 ) ) ( not ( = ?auto_333269 ?auto_333278 ) ) ( not ( = ?auto_333269 ?auto_333279 ) ) ( not ( = ?auto_333269 ?auto_333280 ) ) ( not ( = ?auto_333270 ?auto_333271 ) ) ( not ( = ?auto_333270 ?auto_333272 ) ) ( not ( = ?auto_333270 ?auto_333273 ) ) ( not ( = ?auto_333270 ?auto_333274 ) ) ( not ( = ?auto_333270 ?auto_333275 ) ) ( not ( = ?auto_333270 ?auto_333276 ) ) ( not ( = ?auto_333270 ?auto_333277 ) ) ( not ( = ?auto_333270 ?auto_333278 ) ) ( not ( = ?auto_333270 ?auto_333279 ) ) ( not ( = ?auto_333270 ?auto_333280 ) ) ( not ( = ?auto_333271 ?auto_333272 ) ) ( not ( = ?auto_333271 ?auto_333273 ) ) ( not ( = ?auto_333271 ?auto_333274 ) ) ( not ( = ?auto_333271 ?auto_333275 ) ) ( not ( = ?auto_333271 ?auto_333276 ) ) ( not ( = ?auto_333271 ?auto_333277 ) ) ( not ( = ?auto_333271 ?auto_333278 ) ) ( not ( = ?auto_333271 ?auto_333279 ) ) ( not ( = ?auto_333271 ?auto_333280 ) ) ( not ( = ?auto_333272 ?auto_333273 ) ) ( not ( = ?auto_333272 ?auto_333274 ) ) ( not ( = ?auto_333272 ?auto_333275 ) ) ( not ( = ?auto_333272 ?auto_333276 ) ) ( not ( = ?auto_333272 ?auto_333277 ) ) ( not ( = ?auto_333272 ?auto_333278 ) ) ( not ( = ?auto_333272 ?auto_333279 ) ) ( not ( = ?auto_333272 ?auto_333280 ) ) ( not ( = ?auto_333273 ?auto_333274 ) ) ( not ( = ?auto_333273 ?auto_333275 ) ) ( not ( = ?auto_333273 ?auto_333276 ) ) ( not ( = ?auto_333273 ?auto_333277 ) ) ( not ( = ?auto_333273 ?auto_333278 ) ) ( not ( = ?auto_333273 ?auto_333279 ) ) ( not ( = ?auto_333273 ?auto_333280 ) ) ( not ( = ?auto_333274 ?auto_333275 ) ) ( not ( = ?auto_333274 ?auto_333276 ) ) ( not ( = ?auto_333274 ?auto_333277 ) ) ( not ( = ?auto_333274 ?auto_333278 ) ) ( not ( = ?auto_333274 ?auto_333279 ) ) ( not ( = ?auto_333274 ?auto_333280 ) ) ( not ( = ?auto_333275 ?auto_333276 ) ) ( not ( = ?auto_333275 ?auto_333277 ) ) ( not ( = ?auto_333275 ?auto_333278 ) ) ( not ( = ?auto_333275 ?auto_333279 ) ) ( not ( = ?auto_333275 ?auto_333280 ) ) ( not ( = ?auto_333276 ?auto_333277 ) ) ( not ( = ?auto_333276 ?auto_333278 ) ) ( not ( = ?auto_333276 ?auto_333279 ) ) ( not ( = ?auto_333276 ?auto_333280 ) ) ( not ( = ?auto_333277 ?auto_333278 ) ) ( not ( = ?auto_333277 ?auto_333279 ) ) ( not ( = ?auto_333277 ?auto_333280 ) ) ( not ( = ?auto_333278 ?auto_333279 ) ) ( not ( = ?auto_333278 ?auto_333280 ) ) ( not ( = ?auto_333279 ?auto_333280 ) ) ( ON ?auto_333278 ?auto_333279 ) ( ON ?auto_333277 ?auto_333278 ) ( ON ?auto_333276 ?auto_333277 ) ( ON ?auto_333275 ?auto_333276 ) ( ON ?auto_333274 ?auto_333275 ) ( ON ?auto_333273 ?auto_333274 ) ( ON ?auto_333272 ?auto_333273 ) ( ON ?auto_333271 ?auto_333272 ) ( CLEAR ?auto_333269 ) ( ON ?auto_333270 ?auto_333271 ) ( CLEAR ?auto_333270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_333268 ?auto_333269 ?auto_333270 )
      ( MAKE-12PILE ?auto_333268 ?auto_333269 ?auto_333270 ?auto_333271 ?auto_333272 ?auto_333273 ?auto_333274 ?auto_333275 ?auto_333276 ?auto_333277 ?auto_333278 ?auto_333279 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_333293 - BLOCK
      ?auto_333294 - BLOCK
      ?auto_333295 - BLOCK
      ?auto_333296 - BLOCK
      ?auto_333297 - BLOCK
      ?auto_333298 - BLOCK
      ?auto_333299 - BLOCK
      ?auto_333300 - BLOCK
      ?auto_333301 - BLOCK
      ?auto_333302 - BLOCK
      ?auto_333303 - BLOCK
      ?auto_333304 - BLOCK
    )
    :vars
    (
      ?auto_333305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333304 ?auto_333305 ) ( ON-TABLE ?auto_333293 ) ( not ( = ?auto_333293 ?auto_333294 ) ) ( not ( = ?auto_333293 ?auto_333295 ) ) ( not ( = ?auto_333293 ?auto_333296 ) ) ( not ( = ?auto_333293 ?auto_333297 ) ) ( not ( = ?auto_333293 ?auto_333298 ) ) ( not ( = ?auto_333293 ?auto_333299 ) ) ( not ( = ?auto_333293 ?auto_333300 ) ) ( not ( = ?auto_333293 ?auto_333301 ) ) ( not ( = ?auto_333293 ?auto_333302 ) ) ( not ( = ?auto_333293 ?auto_333303 ) ) ( not ( = ?auto_333293 ?auto_333304 ) ) ( not ( = ?auto_333293 ?auto_333305 ) ) ( not ( = ?auto_333294 ?auto_333295 ) ) ( not ( = ?auto_333294 ?auto_333296 ) ) ( not ( = ?auto_333294 ?auto_333297 ) ) ( not ( = ?auto_333294 ?auto_333298 ) ) ( not ( = ?auto_333294 ?auto_333299 ) ) ( not ( = ?auto_333294 ?auto_333300 ) ) ( not ( = ?auto_333294 ?auto_333301 ) ) ( not ( = ?auto_333294 ?auto_333302 ) ) ( not ( = ?auto_333294 ?auto_333303 ) ) ( not ( = ?auto_333294 ?auto_333304 ) ) ( not ( = ?auto_333294 ?auto_333305 ) ) ( not ( = ?auto_333295 ?auto_333296 ) ) ( not ( = ?auto_333295 ?auto_333297 ) ) ( not ( = ?auto_333295 ?auto_333298 ) ) ( not ( = ?auto_333295 ?auto_333299 ) ) ( not ( = ?auto_333295 ?auto_333300 ) ) ( not ( = ?auto_333295 ?auto_333301 ) ) ( not ( = ?auto_333295 ?auto_333302 ) ) ( not ( = ?auto_333295 ?auto_333303 ) ) ( not ( = ?auto_333295 ?auto_333304 ) ) ( not ( = ?auto_333295 ?auto_333305 ) ) ( not ( = ?auto_333296 ?auto_333297 ) ) ( not ( = ?auto_333296 ?auto_333298 ) ) ( not ( = ?auto_333296 ?auto_333299 ) ) ( not ( = ?auto_333296 ?auto_333300 ) ) ( not ( = ?auto_333296 ?auto_333301 ) ) ( not ( = ?auto_333296 ?auto_333302 ) ) ( not ( = ?auto_333296 ?auto_333303 ) ) ( not ( = ?auto_333296 ?auto_333304 ) ) ( not ( = ?auto_333296 ?auto_333305 ) ) ( not ( = ?auto_333297 ?auto_333298 ) ) ( not ( = ?auto_333297 ?auto_333299 ) ) ( not ( = ?auto_333297 ?auto_333300 ) ) ( not ( = ?auto_333297 ?auto_333301 ) ) ( not ( = ?auto_333297 ?auto_333302 ) ) ( not ( = ?auto_333297 ?auto_333303 ) ) ( not ( = ?auto_333297 ?auto_333304 ) ) ( not ( = ?auto_333297 ?auto_333305 ) ) ( not ( = ?auto_333298 ?auto_333299 ) ) ( not ( = ?auto_333298 ?auto_333300 ) ) ( not ( = ?auto_333298 ?auto_333301 ) ) ( not ( = ?auto_333298 ?auto_333302 ) ) ( not ( = ?auto_333298 ?auto_333303 ) ) ( not ( = ?auto_333298 ?auto_333304 ) ) ( not ( = ?auto_333298 ?auto_333305 ) ) ( not ( = ?auto_333299 ?auto_333300 ) ) ( not ( = ?auto_333299 ?auto_333301 ) ) ( not ( = ?auto_333299 ?auto_333302 ) ) ( not ( = ?auto_333299 ?auto_333303 ) ) ( not ( = ?auto_333299 ?auto_333304 ) ) ( not ( = ?auto_333299 ?auto_333305 ) ) ( not ( = ?auto_333300 ?auto_333301 ) ) ( not ( = ?auto_333300 ?auto_333302 ) ) ( not ( = ?auto_333300 ?auto_333303 ) ) ( not ( = ?auto_333300 ?auto_333304 ) ) ( not ( = ?auto_333300 ?auto_333305 ) ) ( not ( = ?auto_333301 ?auto_333302 ) ) ( not ( = ?auto_333301 ?auto_333303 ) ) ( not ( = ?auto_333301 ?auto_333304 ) ) ( not ( = ?auto_333301 ?auto_333305 ) ) ( not ( = ?auto_333302 ?auto_333303 ) ) ( not ( = ?auto_333302 ?auto_333304 ) ) ( not ( = ?auto_333302 ?auto_333305 ) ) ( not ( = ?auto_333303 ?auto_333304 ) ) ( not ( = ?auto_333303 ?auto_333305 ) ) ( not ( = ?auto_333304 ?auto_333305 ) ) ( ON ?auto_333303 ?auto_333304 ) ( ON ?auto_333302 ?auto_333303 ) ( ON ?auto_333301 ?auto_333302 ) ( ON ?auto_333300 ?auto_333301 ) ( ON ?auto_333299 ?auto_333300 ) ( ON ?auto_333298 ?auto_333299 ) ( ON ?auto_333297 ?auto_333298 ) ( ON ?auto_333296 ?auto_333297 ) ( ON ?auto_333295 ?auto_333296 ) ( CLEAR ?auto_333293 ) ( ON ?auto_333294 ?auto_333295 ) ( CLEAR ?auto_333294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_333293 ?auto_333294 )
      ( MAKE-12PILE ?auto_333293 ?auto_333294 ?auto_333295 ?auto_333296 ?auto_333297 ?auto_333298 ?auto_333299 ?auto_333300 ?auto_333301 ?auto_333302 ?auto_333303 ?auto_333304 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_333318 - BLOCK
      ?auto_333319 - BLOCK
      ?auto_333320 - BLOCK
      ?auto_333321 - BLOCK
      ?auto_333322 - BLOCK
      ?auto_333323 - BLOCK
      ?auto_333324 - BLOCK
      ?auto_333325 - BLOCK
      ?auto_333326 - BLOCK
      ?auto_333327 - BLOCK
      ?auto_333328 - BLOCK
      ?auto_333329 - BLOCK
    )
    :vars
    (
      ?auto_333330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333329 ?auto_333330 ) ( ON-TABLE ?auto_333318 ) ( not ( = ?auto_333318 ?auto_333319 ) ) ( not ( = ?auto_333318 ?auto_333320 ) ) ( not ( = ?auto_333318 ?auto_333321 ) ) ( not ( = ?auto_333318 ?auto_333322 ) ) ( not ( = ?auto_333318 ?auto_333323 ) ) ( not ( = ?auto_333318 ?auto_333324 ) ) ( not ( = ?auto_333318 ?auto_333325 ) ) ( not ( = ?auto_333318 ?auto_333326 ) ) ( not ( = ?auto_333318 ?auto_333327 ) ) ( not ( = ?auto_333318 ?auto_333328 ) ) ( not ( = ?auto_333318 ?auto_333329 ) ) ( not ( = ?auto_333318 ?auto_333330 ) ) ( not ( = ?auto_333319 ?auto_333320 ) ) ( not ( = ?auto_333319 ?auto_333321 ) ) ( not ( = ?auto_333319 ?auto_333322 ) ) ( not ( = ?auto_333319 ?auto_333323 ) ) ( not ( = ?auto_333319 ?auto_333324 ) ) ( not ( = ?auto_333319 ?auto_333325 ) ) ( not ( = ?auto_333319 ?auto_333326 ) ) ( not ( = ?auto_333319 ?auto_333327 ) ) ( not ( = ?auto_333319 ?auto_333328 ) ) ( not ( = ?auto_333319 ?auto_333329 ) ) ( not ( = ?auto_333319 ?auto_333330 ) ) ( not ( = ?auto_333320 ?auto_333321 ) ) ( not ( = ?auto_333320 ?auto_333322 ) ) ( not ( = ?auto_333320 ?auto_333323 ) ) ( not ( = ?auto_333320 ?auto_333324 ) ) ( not ( = ?auto_333320 ?auto_333325 ) ) ( not ( = ?auto_333320 ?auto_333326 ) ) ( not ( = ?auto_333320 ?auto_333327 ) ) ( not ( = ?auto_333320 ?auto_333328 ) ) ( not ( = ?auto_333320 ?auto_333329 ) ) ( not ( = ?auto_333320 ?auto_333330 ) ) ( not ( = ?auto_333321 ?auto_333322 ) ) ( not ( = ?auto_333321 ?auto_333323 ) ) ( not ( = ?auto_333321 ?auto_333324 ) ) ( not ( = ?auto_333321 ?auto_333325 ) ) ( not ( = ?auto_333321 ?auto_333326 ) ) ( not ( = ?auto_333321 ?auto_333327 ) ) ( not ( = ?auto_333321 ?auto_333328 ) ) ( not ( = ?auto_333321 ?auto_333329 ) ) ( not ( = ?auto_333321 ?auto_333330 ) ) ( not ( = ?auto_333322 ?auto_333323 ) ) ( not ( = ?auto_333322 ?auto_333324 ) ) ( not ( = ?auto_333322 ?auto_333325 ) ) ( not ( = ?auto_333322 ?auto_333326 ) ) ( not ( = ?auto_333322 ?auto_333327 ) ) ( not ( = ?auto_333322 ?auto_333328 ) ) ( not ( = ?auto_333322 ?auto_333329 ) ) ( not ( = ?auto_333322 ?auto_333330 ) ) ( not ( = ?auto_333323 ?auto_333324 ) ) ( not ( = ?auto_333323 ?auto_333325 ) ) ( not ( = ?auto_333323 ?auto_333326 ) ) ( not ( = ?auto_333323 ?auto_333327 ) ) ( not ( = ?auto_333323 ?auto_333328 ) ) ( not ( = ?auto_333323 ?auto_333329 ) ) ( not ( = ?auto_333323 ?auto_333330 ) ) ( not ( = ?auto_333324 ?auto_333325 ) ) ( not ( = ?auto_333324 ?auto_333326 ) ) ( not ( = ?auto_333324 ?auto_333327 ) ) ( not ( = ?auto_333324 ?auto_333328 ) ) ( not ( = ?auto_333324 ?auto_333329 ) ) ( not ( = ?auto_333324 ?auto_333330 ) ) ( not ( = ?auto_333325 ?auto_333326 ) ) ( not ( = ?auto_333325 ?auto_333327 ) ) ( not ( = ?auto_333325 ?auto_333328 ) ) ( not ( = ?auto_333325 ?auto_333329 ) ) ( not ( = ?auto_333325 ?auto_333330 ) ) ( not ( = ?auto_333326 ?auto_333327 ) ) ( not ( = ?auto_333326 ?auto_333328 ) ) ( not ( = ?auto_333326 ?auto_333329 ) ) ( not ( = ?auto_333326 ?auto_333330 ) ) ( not ( = ?auto_333327 ?auto_333328 ) ) ( not ( = ?auto_333327 ?auto_333329 ) ) ( not ( = ?auto_333327 ?auto_333330 ) ) ( not ( = ?auto_333328 ?auto_333329 ) ) ( not ( = ?auto_333328 ?auto_333330 ) ) ( not ( = ?auto_333329 ?auto_333330 ) ) ( ON ?auto_333328 ?auto_333329 ) ( ON ?auto_333327 ?auto_333328 ) ( ON ?auto_333326 ?auto_333327 ) ( ON ?auto_333325 ?auto_333326 ) ( ON ?auto_333324 ?auto_333325 ) ( ON ?auto_333323 ?auto_333324 ) ( ON ?auto_333322 ?auto_333323 ) ( ON ?auto_333321 ?auto_333322 ) ( ON ?auto_333320 ?auto_333321 ) ( CLEAR ?auto_333318 ) ( ON ?auto_333319 ?auto_333320 ) ( CLEAR ?auto_333319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_333318 ?auto_333319 )
      ( MAKE-12PILE ?auto_333318 ?auto_333319 ?auto_333320 ?auto_333321 ?auto_333322 ?auto_333323 ?auto_333324 ?auto_333325 ?auto_333326 ?auto_333327 ?auto_333328 ?auto_333329 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_333343 - BLOCK
      ?auto_333344 - BLOCK
      ?auto_333345 - BLOCK
      ?auto_333346 - BLOCK
      ?auto_333347 - BLOCK
      ?auto_333348 - BLOCK
      ?auto_333349 - BLOCK
      ?auto_333350 - BLOCK
      ?auto_333351 - BLOCK
      ?auto_333352 - BLOCK
      ?auto_333353 - BLOCK
      ?auto_333354 - BLOCK
    )
    :vars
    (
      ?auto_333355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333354 ?auto_333355 ) ( not ( = ?auto_333343 ?auto_333344 ) ) ( not ( = ?auto_333343 ?auto_333345 ) ) ( not ( = ?auto_333343 ?auto_333346 ) ) ( not ( = ?auto_333343 ?auto_333347 ) ) ( not ( = ?auto_333343 ?auto_333348 ) ) ( not ( = ?auto_333343 ?auto_333349 ) ) ( not ( = ?auto_333343 ?auto_333350 ) ) ( not ( = ?auto_333343 ?auto_333351 ) ) ( not ( = ?auto_333343 ?auto_333352 ) ) ( not ( = ?auto_333343 ?auto_333353 ) ) ( not ( = ?auto_333343 ?auto_333354 ) ) ( not ( = ?auto_333343 ?auto_333355 ) ) ( not ( = ?auto_333344 ?auto_333345 ) ) ( not ( = ?auto_333344 ?auto_333346 ) ) ( not ( = ?auto_333344 ?auto_333347 ) ) ( not ( = ?auto_333344 ?auto_333348 ) ) ( not ( = ?auto_333344 ?auto_333349 ) ) ( not ( = ?auto_333344 ?auto_333350 ) ) ( not ( = ?auto_333344 ?auto_333351 ) ) ( not ( = ?auto_333344 ?auto_333352 ) ) ( not ( = ?auto_333344 ?auto_333353 ) ) ( not ( = ?auto_333344 ?auto_333354 ) ) ( not ( = ?auto_333344 ?auto_333355 ) ) ( not ( = ?auto_333345 ?auto_333346 ) ) ( not ( = ?auto_333345 ?auto_333347 ) ) ( not ( = ?auto_333345 ?auto_333348 ) ) ( not ( = ?auto_333345 ?auto_333349 ) ) ( not ( = ?auto_333345 ?auto_333350 ) ) ( not ( = ?auto_333345 ?auto_333351 ) ) ( not ( = ?auto_333345 ?auto_333352 ) ) ( not ( = ?auto_333345 ?auto_333353 ) ) ( not ( = ?auto_333345 ?auto_333354 ) ) ( not ( = ?auto_333345 ?auto_333355 ) ) ( not ( = ?auto_333346 ?auto_333347 ) ) ( not ( = ?auto_333346 ?auto_333348 ) ) ( not ( = ?auto_333346 ?auto_333349 ) ) ( not ( = ?auto_333346 ?auto_333350 ) ) ( not ( = ?auto_333346 ?auto_333351 ) ) ( not ( = ?auto_333346 ?auto_333352 ) ) ( not ( = ?auto_333346 ?auto_333353 ) ) ( not ( = ?auto_333346 ?auto_333354 ) ) ( not ( = ?auto_333346 ?auto_333355 ) ) ( not ( = ?auto_333347 ?auto_333348 ) ) ( not ( = ?auto_333347 ?auto_333349 ) ) ( not ( = ?auto_333347 ?auto_333350 ) ) ( not ( = ?auto_333347 ?auto_333351 ) ) ( not ( = ?auto_333347 ?auto_333352 ) ) ( not ( = ?auto_333347 ?auto_333353 ) ) ( not ( = ?auto_333347 ?auto_333354 ) ) ( not ( = ?auto_333347 ?auto_333355 ) ) ( not ( = ?auto_333348 ?auto_333349 ) ) ( not ( = ?auto_333348 ?auto_333350 ) ) ( not ( = ?auto_333348 ?auto_333351 ) ) ( not ( = ?auto_333348 ?auto_333352 ) ) ( not ( = ?auto_333348 ?auto_333353 ) ) ( not ( = ?auto_333348 ?auto_333354 ) ) ( not ( = ?auto_333348 ?auto_333355 ) ) ( not ( = ?auto_333349 ?auto_333350 ) ) ( not ( = ?auto_333349 ?auto_333351 ) ) ( not ( = ?auto_333349 ?auto_333352 ) ) ( not ( = ?auto_333349 ?auto_333353 ) ) ( not ( = ?auto_333349 ?auto_333354 ) ) ( not ( = ?auto_333349 ?auto_333355 ) ) ( not ( = ?auto_333350 ?auto_333351 ) ) ( not ( = ?auto_333350 ?auto_333352 ) ) ( not ( = ?auto_333350 ?auto_333353 ) ) ( not ( = ?auto_333350 ?auto_333354 ) ) ( not ( = ?auto_333350 ?auto_333355 ) ) ( not ( = ?auto_333351 ?auto_333352 ) ) ( not ( = ?auto_333351 ?auto_333353 ) ) ( not ( = ?auto_333351 ?auto_333354 ) ) ( not ( = ?auto_333351 ?auto_333355 ) ) ( not ( = ?auto_333352 ?auto_333353 ) ) ( not ( = ?auto_333352 ?auto_333354 ) ) ( not ( = ?auto_333352 ?auto_333355 ) ) ( not ( = ?auto_333353 ?auto_333354 ) ) ( not ( = ?auto_333353 ?auto_333355 ) ) ( not ( = ?auto_333354 ?auto_333355 ) ) ( ON ?auto_333353 ?auto_333354 ) ( ON ?auto_333352 ?auto_333353 ) ( ON ?auto_333351 ?auto_333352 ) ( ON ?auto_333350 ?auto_333351 ) ( ON ?auto_333349 ?auto_333350 ) ( ON ?auto_333348 ?auto_333349 ) ( ON ?auto_333347 ?auto_333348 ) ( ON ?auto_333346 ?auto_333347 ) ( ON ?auto_333345 ?auto_333346 ) ( ON ?auto_333344 ?auto_333345 ) ( ON ?auto_333343 ?auto_333344 ) ( CLEAR ?auto_333343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_333343 )
      ( MAKE-12PILE ?auto_333343 ?auto_333344 ?auto_333345 ?auto_333346 ?auto_333347 ?auto_333348 ?auto_333349 ?auto_333350 ?auto_333351 ?auto_333352 ?auto_333353 ?auto_333354 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_333368 - BLOCK
      ?auto_333369 - BLOCK
      ?auto_333370 - BLOCK
      ?auto_333371 - BLOCK
      ?auto_333372 - BLOCK
      ?auto_333373 - BLOCK
      ?auto_333374 - BLOCK
      ?auto_333375 - BLOCK
      ?auto_333376 - BLOCK
      ?auto_333377 - BLOCK
      ?auto_333378 - BLOCK
      ?auto_333379 - BLOCK
    )
    :vars
    (
      ?auto_333380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333379 ?auto_333380 ) ( not ( = ?auto_333368 ?auto_333369 ) ) ( not ( = ?auto_333368 ?auto_333370 ) ) ( not ( = ?auto_333368 ?auto_333371 ) ) ( not ( = ?auto_333368 ?auto_333372 ) ) ( not ( = ?auto_333368 ?auto_333373 ) ) ( not ( = ?auto_333368 ?auto_333374 ) ) ( not ( = ?auto_333368 ?auto_333375 ) ) ( not ( = ?auto_333368 ?auto_333376 ) ) ( not ( = ?auto_333368 ?auto_333377 ) ) ( not ( = ?auto_333368 ?auto_333378 ) ) ( not ( = ?auto_333368 ?auto_333379 ) ) ( not ( = ?auto_333368 ?auto_333380 ) ) ( not ( = ?auto_333369 ?auto_333370 ) ) ( not ( = ?auto_333369 ?auto_333371 ) ) ( not ( = ?auto_333369 ?auto_333372 ) ) ( not ( = ?auto_333369 ?auto_333373 ) ) ( not ( = ?auto_333369 ?auto_333374 ) ) ( not ( = ?auto_333369 ?auto_333375 ) ) ( not ( = ?auto_333369 ?auto_333376 ) ) ( not ( = ?auto_333369 ?auto_333377 ) ) ( not ( = ?auto_333369 ?auto_333378 ) ) ( not ( = ?auto_333369 ?auto_333379 ) ) ( not ( = ?auto_333369 ?auto_333380 ) ) ( not ( = ?auto_333370 ?auto_333371 ) ) ( not ( = ?auto_333370 ?auto_333372 ) ) ( not ( = ?auto_333370 ?auto_333373 ) ) ( not ( = ?auto_333370 ?auto_333374 ) ) ( not ( = ?auto_333370 ?auto_333375 ) ) ( not ( = ?auto_333370 ?auto_333376 ) ) ( not ( = ?auto_333370 ?auto_333377 ) ) ( not ( = ?auto_333370 ?auto_333378 ) ) ( not ( = ?auto_333370 ?auto_333379 ) ) ( not ( = ?auto_333370 ?auto_333380 ) ) ( not ( = ?auto_333371 ?auto_333372 ) ) ( not ( = ?auto_333371 ?auto_333373 ) ) ( not ( = ?auto_333371 ?auto_333374 ) ) ( not ( = ?auto_333371 ?auto_333375 ) ) ( not ( = ?auto_333371 ?auto_333376 ) ) ( not ( = ?auto_333371 ?auto_333377 ) ) ( not ( = ?auto_333371 ?auto_333378 ) ) ( not ( = ?auto_333371 ?auto_333379 ) ) ( not ( = ?auto_333371 ?auto_333380 ) ) ( not ( = ?auto_333372 ?auto_333373 ) ) ( not ( = ?auto_333372 ?auto_333374 ) ) ( not ( = ?auto_333372 ?auto_333375 ) ) ( not ( = ?auto_333372 ?auto_333376 ) ) ( not ( = ?auto_333372 ?auto_333377 ) ) ( not ( = ?auto_333372 ?auto_333378 ) ) ( not ( = ?auto_333372 ?auto_333379 ) ) ( not ( = ?auto_333372 ?auto_333380 ) ) ( not ( = ?auto_333373 ?auto_333374 ) ) ( not ( = ?auto_333373 ?auto_333375 ) ) ( not ( = ?auto_333373 ?auto_333376 ) ) ( not ( = ?auto_333373 ?auto_333377 ) ) ( not ( = ?auto_333373 ?auto_333378 ) ) ( not ( = ?auto_333373 ?auto_333379 ) ) ( not ( = ?auto_333373 ?auto_333380 ) ) ( not ( = ?auto_333374 ?auto_333375 ) ) ( not ( = ?auto_333374 ?auto_333376 ) ) ( not ( = ?auto_333374 ?auto_333377 ) ) ( not ( = ?auto_333374 ?auto_333378 ) ) ( not ( = ?auto_333374 ?auto_333379 ) ) ( not ( = ?auto_333374 ?auto_333380 ) ) ( not ( = ?auto_333375 ?auto_333376 ) ) ( not ( = ?auto_333375 ?auto_333377 ) ) ( not ( = ?auto_333375 ?auto_333378 ) ) ( not ( = ?auto_333375 ?auto_333379 ) ) ( not ( = ?auto_333375 ?auto_333380 ) ) ( not ( = ?auto_333376 ?auto_333377 ) ) ( not ( = ?auto_333376 ?auto_333378 ) ) ( not ( = ?auto_333376 ?auto_333379 ) ) ( not ( = ?auto_333376 ?auto_333380 ) ) ( not ( = ?auto_333377 ?auto_333378 ) ) ( not ( = ?auto_333377 ?auto_333379 ) ) ( not ( = ?auto_333377 ?auto_333380 ) ) ( not ( = ?auto_333378 ?auto_333379 ) ) ( not ( = ?auto_333378 ?auto_333380 ) ) ( not ( = ?auto_333379 ?auto_333380 ) ) ( ON ?auto_333378 ?auto_333379 ) ( ON ?auto_333377 ?auto_333378 ) ( ON ?auto_333376 ?auto_333377 ) ( ON ?auto_333375 ?auto_333376 ) ( ON ?auto_333374 ?auto_333375 ) ( ON ?auto_333373 ?auto_333374 ) ( ON ?auto_333372 ?auto_333373 ) ( ON ?auto_333371 ?auto_333372 ) ( ON ?auto_333370 ?auto_333371 ) ( ON ?auto_333369 ?auto_333370 ) ( ON ?auto_333368 ?auto_333369 ) ( CLEAR ?auto_333368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_333368 )
      ( MAKE-12PILE ?auto_333368 ?auto_333369 ?auto_333370 ?auto_333371 ?auto_333372 ?auto_333373 ?auto_333374 ?auto_333375 ?auto_333376 ?auto_333377 ?auto_333378 ?auto_333379 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333394 - BLOCK
      ?auto_333395 - BLOCK
      ?auto_333396 - BLOCK
      ?auto_333397 - BLOCK
      ?auto_333398 - BLOCK
      ?auto_333399 - BLOCK
      ?auto_333400 - BLOCK
      ?auto_333401 - BLOCK
      ?auto_333402 - BLOCK
      ?auto_333403 - BLOCK
      ?auto_333404 - BLOCK
      ?auto_333405 - BLOCK
      ?auto_333406 - BLOCK
    )
    :vars
    (
      ?auto_333407 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_333405 ) ( ON ?auto_333406 ?auto_333407 ) ( CLEAR ?auto_333406 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_333394 ) ( ON ?auto_333395 ?auto_333394 ) ( ON ?auto_333396 ?auto_333395 ) ( ON ?auto_333397 ?auto_333396 ) ( ON ?auto_333398 ?auto_333397 ) ( ON ?auto_333399 ?auto_333398 ) ( ON ?auto_333400 ?auto_333399 ) ( ON ?auto_333401 ?auto_333400 ) ( ON ?auto_333402 ?auto_333401 ) ( ON ?auto_333403 ?auto_333402 ) ( ON ?auto_333404 ?auto_333403 ) ( ON ?auto_333405 ?auto_333404 ) ( not ( = ?auto_333394 ?auto_333395 ) ) ( not ( = ?auto_333394 ?auto_333396 ) ) ( not ( = ?auto_333394 ?auto_333397 ) ) ( not ( = ?auto_333394 ?auto_333398 ) ) ( not ( = ?auto_333394 ?auto_333399 ) ) ( not ( = ?auto_333394 ?auto_333400 ) ) ( not ( = ?auto_333394 ?auto_333401 ) ) ( not ( = ?auto_333394 ?auto_333402 ) ) ( not ( = ?auto_333394 ?auto_333403 ) ) ( not ( = ?auto_333394 ?auto_333404 ) ) ( not ( = ?auto_333394 ?auto_333405 ) ) ( not ( = ?auto_333394 ?auto_333406 ) ) ( not ( = ?auto_333394 ?auto_333407 ) ) ( not ( = ?auto_333395 ?auto_333396 ) ) ( not ( = ?auto_333395 ?auto_333397 ) ) ( not ( = ?auto_333395 ?auto_333398 ) ) ( not ( = ?auto_333395 ?auto_333399 ) ) ( not ( = ?auto_333395 ?auto_333400 ) ) ( not ( = ?auto_333395 ?auto_333401 ) ) ( not ( = ?auto_333395 ?auto_333402 ) ) ( not ( = ?auto_333395 ?auto_333403 ) ) ( not ( = ?auto_333395 ?auto_333404 ) ) ( not ( = ?auto_333395 ?auto_333405 ) ) ( not ( = ?auto_333395 ?auto_333406 ) ) ( not ( = ?auto_333395 ?auto_333407 ) ) ( not ( = ?auto_333396 ?auto_333397 ) ) ( not ( = ?auto_333396 ?auto_333398 ) ) ( not ( = ?auto_333396 ?auto_333399 ) ) ( not ( = ?auto_333396 ?auto_333400 ) ) ( not ( = ?auto_333396 ?auto_333401 ) ) ( not ( = ?auto_333396 ?auto_333402 ) ) ( not ( = ?auto_333396 ?auto_333403 ) ) ( not ( = ?auto_333396 ?auto_333404 ) ) ( not ( = ?auto_333396 ?auto_333405 ) ) ( not ( = ?auto_333396 ?auto_333406 ) ) ( not ( = ?auto_333396 ?auto_333407 ) ) ( not ( = ?auto_333397 ?auto_333398 ) ) ( not ( = ?auto_333397 ?auto_333399 ) ) ( not ( = ?auto_333397 ?auto_333400 ) ) ( not ( = ?auto_333397 ?auto_333401 ) ) ( not ( = ?auto_333397 ?auto_333402 ) ) ( not ( = ?auto_333397 ?auto_333403 ) ) ( not ( = ?auto_333397 ?auto_333404 ) ) ( not ( = ?auto_333397 ?auto_333405 ) ) ( not ( = ?auto_333397 ?auto_333406 ) ) ( not ( = ?auto_333397 ?auto_333407 ) ) ( not ( = ?auto_333398 ?auto_333399 ) ) ( not ( = ?auto_333398 ?auto_333400 ) ) ( not ( = ?auto_333398 ?auto_333401 ) ) ( not ( = ?auto_333398 ?auto_333402 ) ) ( not ( = ?auto_333398 ?auto_333403 ) ) ( not ( = ?auto_333398 ?auto_333404 ) ) ( not ( = ?auto_333398 ?auto_333405 ) ) ( not ( = ?auto_333398 ?auto_333406 ) ) ( not ( = ?auto_333398 ?auto_333407 ) ) ( not ( = ?auto_333399 ?auto_333400 ) ) ( not ( = ?auto_333399 ?auto_333401 ) ) ( not ( = ?auto_333399 ?auto_333402 ) ) ( not ( = ?auto_333399 ?auto_333403 ) ) ( not ( = ?auto_333399 ?auto_333404 ) ) ( not ( = ?auto_333399 ?auto_333405 ) ) ( not ( = ?auto_333399 ?auto_333406 ) ) ( not ( = ?auto_333399 ?auto_333407 ) ) ( not ( = ?auto_333400 ?auto_333401 ) ) ( not ( = ?auto_333400 ?auto_333402 ) ) ( not ( = ?auto_333400 ?auto_333403 ) ) ( not ( = ?auto_333400 ?auto_333404 ) ) ( not ( = ?auto_333400 ?auto_333405 ) ) ( not ( = ?auto_333400 ?auto_333406 ) ) ( not ( = ?auto_333400 ?auto_333407 ) ) ( not ( = ?auto_333401 ?auto_333402 ) ) ( not ( = ?auto_333401 ?auto_333403 ) ) ( not ( = ?auto_333401 ?auto_333404 ) ) ( not ( = ?auto_333401 ?auto_333405 ) ) ( not ( = ?auto_333401 ?auto_333406 ) ) ( not ( = ?auto_333401 ?auto_333407 ) ) ( not ( = ?auto_333402 ?auto_333403 ) ) ( not ( = ?auto_333402 ?auto_333404 ) ) ( not ( = ?auto_333402 ?auto_333405 ) ) ( not ( = ?auto_333402 ?auto_333406 ) ) ( not ( = ?auto_333402 ?auto_333407 ) ) ( not ( = ?auto_333403 ?auto_333404 ) ) ( not ( = ?auto_333403 ?auto_333405 ) ) ( not ( = ?auto_333403 ?auto_333406 ) ) ( not ( = ?auto_333403 ?auto_333407 ) ) ( not ( = ?auto_333404 ?auto_333405 ) ) ( not ( = ?auto_333404 ?auto_333406 ) ) ( not ( = ?auto_333404 ?auto_333407 ) ) ( not ( = ?auto_333405 ?auto_333406 ) ) ( not ( = ?auto_333405 ?auto_333407 ) ) ( not ( = ?auto_333406 ?auto_333407 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_333406 ?auto_333407 )
      ( !STACK ?auto_333406 ?auto_333405 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333421 - BLOCK
      ?auto_333422 - BLOCK
      ?auto_333423 - BLOCK
      ?auto_333424 - BLOCK
      ?auto_333425 - BLOCK
      ?auto_333426 - BLOCK
      ?auto_333427 - BLOCK
      ?auto_333428 - BLOCK
      ?auto_333429 - BLOCK
      ?auto_333430 - BLOCK
      ?auto_333431 - BLOCK
      ?auto_333432 - BLOCK
      ?auto_333433 - BLOCK
    )
    :vars
    (
      ?auto_333434 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_333432 ) ( ON ?auto_333433 ?auto_333434 ) ( CLEAR ?auto_333433 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_333421 ) ( ON ?auto_333422 ?auto_333421 ) ( ON ?auto_333423 ?auto_333422 ) ( ON ?auto_333424 ?auto_333423 ) ( ON ?auto_333425 ?auto_333424 ) ( ON ?auto_333426 ?auto_333425 ) ( ON ?auto_333427 ?auto_333426 ) ( ON ?auto_333428 ?auto_333427 ) ( ON ?auto_333429 ?auto_333428 ) ( ON ?auto_333430 ?auto_333429 ) ( ON ?auto_333431 ?auto_333430 ) ( ON ?auto_333432 ?auto_333431 ) ( not ( = ?auto_333421 ?auto_333422 ) ) ( not ( = ?auto_333421 ?auto_333423 ) ) ( not ( = ?auto_333421 ?auto_333424 ) ) ( not ( = ?auto_333421 ?auto_333425 ) ) ( not ( = ?auto_333421 ?auto_333426 ) ) ( not ( = ?auto_333421 ?auto_333427 ) ) ( not ( = ?auto_333421 ?auto_333428 ) ) ( not ( = ?auto_333421 ?auto_333429 ) ) ( not ( = ?auto_333421 ?auto_333430 ) ) ( not ( = ?auto_333421 ?auto_333431 ) ) ( not ( = ?auto_333421 ?auto_333432 ) ) ( not ( = ?auto_333421 ?auto_333433 ) ) ( not ( = ?auto_333421 ?auto_333434 ) ) ( not ( = ?auto_333422 ?auto_333423 ) ) ( not ( = ?auto_333422 ?auto_333424 ) ) ( not ( = ?auto_333422 ?auto_333425 ) ) ( not ( = ?auto_333422 ?auto_333426 ) ) ( not ( = ?auto_333422 ?auto_333427 ) ) ( not ( = ?auto_333422 ?auto_333428 ) ) ( not ( = ?auto_333422 ?auto_333429 ) ) ( not ( = ?auto_333422 ?auto_333430 ) ) ( not ( = ?auto_333422 ?auto_333431 ) ) ( not ( = ?auto_333422 ?auto_333432 ) ) ( not ( = ?auto_333422 ?auto_333433 ) ) ( not ( = ?auto_333422 ?auto_333434 ) ) ( not ( = ?auto_333423 ?auto_333424 ) ) ( not ( = ?auto_333423 ?auto_333425 ) ) ( not ( = ?auto_333423 ?auto_333426 ) ) ( not ( = ?auto_333423 ?auto_333427 ) ) ( not ( = ?auto_333423 ?auto_333428 ) ) ( not ( = ?auto_333423 ?auto_333429 ) ) ( not ( = ?auto_333423 ?auto_333430 ) ) ( not ( = ?auto_333423 ?auto_333431 ) ) ( not ( = ?auto_333423 ?auto_333432 ) ) ( not ( = ?auto_333423 ?auto_333433 ) ) ( not ( = ?auto_333423 ?auto_333434 ) ) ( not ( = ?auto_333424 ?auto_333425 ) ) ( not ( = ?auto_333424 ?auto_333426 ) ) ( not ( = ?auto_333424 ?auto_333427 ) ) ( not ( = ?auto_333424 ?auto_333428 ) ) ( not ( = ?auto_333424 ?auto_333429 ) ) ( not ( = ?auto_333424 ?auto_333430 ) ) ( not ( = ?auto_333424 ?auto_333431 ) ) ( not ( = ?auto_333424 ?auto_333432 ) ) ( not ( = ?auto_333424 ?auto_333433 ) ) ( not ( = ?auto_333424 ?auto_333434 ) ) ( not ( = ?auto_333425 ?auto_333426 ) ) ( not ( = ?auto_333425 ?auto_333427 ) ) ( not ( = ?auto_333425 ?auto_333428 ) ) ( not ( = ?auto_333425 ?auto_333429 ) ) ( not ( = ?auto_333425 ?auto_333430 ) ) ( not ( = ?auto_333425 ?auto_333431 ) ) ( not ( = ?auto_333425 ?auto_333432 ) ) ( not ( = ?auto_333425 ?auto_333433 ) ) ( not ( = ?auto_333425 ?auto_333434 ) ) ( not ( = ?auto_333426 ?auto_333427 ) ) ( not ( = ?auto_333426 ?auto_333428 ) ) ( not ( = ?auto_333426 ?auto_333429 ) ) ( not ( = ?auto_333426 ?auto_333430 ) ) ( not ( = ?auto_333426 ?auto_333431 ) ) ( not ( = ?auto_333426 ?auto_333432 ) ) ( not ( = ?auto_333426 ?auto_333433 ) ) ( not ( = ?auto_333426 ?auto_333434 ) ) ( not ( = ?auto_333427 ?auto_333428 ) ) ( not ( = ?auto_333427 ?auto_333429 ) ) ( not ( = ?auto_333427 ?auto_333430 ) ) ( not ( = ?auto_333427 ?auto_333431 ) ) ( not ( = ?auto_333427 ?auto_333432 ) ) ( not ( = ?auto_333427 ?auto_333433 ) ) ( not ( = ?auto_333427 ?auto_333434 ) ) ( not ( = ?auto_333428 ?auto_333429 ) ) ( not ( = ?auto_333428 ?auto_333430 ) ) ( not ( = ?auto_333428 ?auto_333431 ) ) ( not ( = ?auto_333428 ?auto_333432 ) ) ( not ( = ?auto_333428 ?auto_333433 ) ) ( not ( = ?auto_333428 ?auto_333434 ) ) ( not ( = ?auto_333429 ?auto_333430 ) ) ( not ( = ?auto_333429 ?auto_333431 ) ) ( not ( = ?auto_333429 ?auto_333432 ) ) ( not ( = ?auto_333429 ?auto_333433 ) ) ( not ( = ?auto_333429 ?auto_333434 ) ) ( not ( = ?auto_333430 ?auto_333431 ) ) ( not ( = ?auto_333430 ?auto_333432 ) ) ( not ( = ?auto_333430 ?auto_333433 ) ) ( not ( = ?auto_333430 ?auto_333434 ) ) ( not ( = ?auto_333431 ?auto_333432 ) ) ( not ( = ?auto_333431 ?auto_333433 ) ) ( not ( = ?auto_333431 ?auto_333434 ) ) ( not ( = ?auto_333432 ?auto_333433 ) ) ( not ( = ?auto_333432 ?auto_333434 ) ) ( not ( = ?auto_333433 ?auto_333434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_333433 ?auto_333434 )
      ( !STACK ?auto_333433 ?auto_333432 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333448 - BLOCK
      ?auto_333449 - BLOCK
      ?auto_333450 - BLOCK
      ?auto_333451 - BLOCK
      ?auto_333452 - BLOCK
      ?auto_333453 - BLOCK
      ?auto_333454 - BLOCK
      ?auto_333455 - BLOCK
      ?auto_333456 - BLOCK
      ?auto_333457 - BLOCK
      ?auto_333458 - BLOCK
      ?auto_333459 - BLOCK
      ?auto_333460 - BLOCK
    )
    :vars
    (
      ?auto_333461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333460 ?auto_333461 ) ( ON-TABLE ?auto_333448 ) ( ON ?auto_333449 ?auto_333448 ) ( ON ?auto_333450 ?auto_333449 ) ( ON ?auto_333451 ?auto_333450 ) ( ON ?auto_333452 ?auto_333451 ) ( ON ?auto_333453 ?auto_333452 ) ( ON ?auto_333454 ?auto_333453 ) ( ON ?auto_333455 ?auto_333454 ) ( ON ?auto_333456 ?auto_333455 ) ( ON ?auto_333457 ?auto_333456 ) ( ON ?auto_333458 ?auto_333457 ) ( not ( = ?auto_333448 ?auto_333449 ) ) ( not ( = ?auto_333448 ?auto_333450 ) ) ( not ( = ?auto_333448 ?auto_333451 ) ) ( not ( = ?auto_333448 ?auto_333452 ) ) ( not ( = ?auto_333448 ?auto_333453 ) ) ( not ( = ?auto_333448 ?auto_333454 ) ) ( not ( = ?auto_333448 ?auto_333455 ) ) ( not ( = ?auto_333448 ?auto_333456 ) ) ( not ( = ?auto_333448 ?auto_333457 ) ) ( not ( = ?auto_333448 ?auto_333458 ) ) ( not ( = ?auto_333448 ?auto_333459 ) ) ( not ( = ?auto_333448 ?auto_333460 ) ) ( not ( = ?auto_333448 ?auto_333461 ) ) ( not ( = ?auto_333449 ?auto_333450 ) ) ( not ( = ?auto_333449 ?auto_333451 ) ) ( not ( = ?auto_333449 ?auto_333452 ) ) ( not ( = ?auto_333449 ?auto_333453 ) ) ( not ( = ?auto_333449 ?auto_333454 ) ) ( not ( = ?auto_333449 ?auto_333455 ) ) ( not ( = ?auto_333449 ?auto_333456 ) ) ( not ( = ?auto_333449 ?auto_333457 ) ) ( not ( = ?auto_333449 ?auto_333458 ) ) ( not ( = ?auto_333449 ?auto_333459 ) ) ( not ( = ?auto_333449 ?auto_333460 ) ) ( not ( = ?auto_333449 ?auto_333461 ) ) ( not ( = ?auto_333450 ?auto_333451 ) ) ( not ( = ?auto_333450 ?auto_333452 ) ) ( not ( = ?auto_333450 ?auto_333453 ) ) ( not ( = ?auto_333450 ?auto_333454 ) ) ( not ( = ?auto_333450 ?auto_333455 ) ) ( not ( = ?auto_333450 ?auto_333456 ) ) ( not ( = ?auto_333450 ?auto_333457 ) ) ( not ( = ?auto_333450 ?auto_333458 ) ) ( not ( = ?auto_333450 ?auto_333459 ) ) ( not ( = ?auto_333450 ?auto_333460 ) ) ( not ( = ?auto_333450 ?auto_333461 ) ) ( not ( = ?auto_333451 ?auto_333452 ) ) ( not ( = ?auto_333451 ?auto_333453 ) ) ( not ( = ?auto_333451 ?auto_333454 ) ) ( not ( = ?auto_333451 ?auto_333455 ) ) ( not ( = ?auto_333451 ?auto_333456 ) ) ( not ( = ?auto_333451 ?auto_333457 ) ) ( not ( = ?auto_333451 ?auto_333458 ) ) ( not ( = ?auto_333451 ?auto_333459 ) ) ( not ( = ?auto_333451 ?auto_333460 ) ) ( not ( = ?auto_333451 ?auto_333461 ) ) ( not ( = ?auto_333452 ?auto_333453 ) ) ( not ( = ?auto_333452 ?auto_333454 ) ) ( not ( = ?auto_333452 ?auto_333455 ) ) ( not ( = ?auto_333452 ?auto_333456 ) ) ( not ( = ?auto_333452 ?auto_333457 ) ) ( not ( = ?auto_333452 ?auto_333458 ) ) ( not ( = ?auto_333452 ?auto_333459 ) ) ( not ( = ?auto_333452 ?auto_333460 ) ) ( not ( = ?auto_333452 ?auto_333461 ) ) ( not ( = ?auto_333453 ?auto_333454 ) ) ( not ( = ?auto_333453 ?auto_333455 ) ) ( not ( = ?auto_333453 ?auto_333456 ) ) ( not ( = ?auto_333453 ?auto_333457 ) ) ( not ( = ?auto_333453 ?auto_333458 ) ) ( not ( = ?auto_333453 ?auto_333459 ) ) ( not ( = ?auto_333453 ?auto_333460 ) ) ( not ( = ?auto_333453 ?auto_333461 ) ) ( not ( = ?auto_333454 ?auto_333455 ) ) ( not ( = ?auto_333454 ?auto_333456 ) ) ( not ( = ?auto_333454 ?auto_333457 ) ) ( not ( = ?auto_333454 ?auto_333458 ) ) ( not ( = ?auto_333454 ?auto_333459 ) ) ( not ( = ?auto_333454 ?auto_333460 ) ) ( not ( = ?auto_333454 ?auto_333461 ) ) ( not ( = ?auto_333455 ?auto_333456 ) ) ( not ( = ?auto_333455 ?auto_333457 ) ) ( not ( = ?auto_333455 ?auto_333458 ) ) ( not ( = ?auto_333455 ?auto_333459 ) ) ( not ( = ?auto_333455 ?auto_333460 ) ) ( not ( = ?auto_333455 ?auto_333461 ) ) ( not ( = ?auto_333456 ?auto_333457 ) ) ( not ( = ?auto_333456 ?auto_333458 ) ) ( not ( = ?auto_333456 ?auto_333459 ) ) ( not ( = ?auto_333456 ?auto_333460 ) ) ( not ( = ?auto_333456 ?auto_333461 ) ) ( not ( = ?auto_333457 ?auto_333458 ) ) ( not ( = ?auto_333457 ?auto_333459 ) ) ( not ( = ?auto_333457 ?auto_333460 ) ) ( not ( = ?auto_333457 ?auto_333461 ) ) ( not ( = ?auto_333458 ?auto_333459 ) ) ( not ( = ?auto_333458 ?auto_333460 ) ) ( not ( = ?auto_333458 ?auto_333461 ) ) ( not ( = ?auto_333459 ?auto_333460 ) ) ( not ( = ?auto_333459 ?auto_333461 ) ) ( not ( = ?auto_333460 ?auto_333461 ) ) ( CLEAR ?auto_333458 ) ( ON ?auto_333459 ?auto_333460 ) ( CLEAR ?auto_333459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_333448 ?auto_333449 ?auto_333450 ?auto_333451 ?auto_333452 ?auto_333453 ?auto_333454 ?auto_333455 ?auto_333456 ?auto_333457 ?auto_333458 ?auto_333459 )
      ( MAKE-13PILE ?auto_333448 ?auto_333449 ?auto_333450 ?auto_333451 ?auto_333452 ?auto_333453 ?auto_333454 ?auto_333455 ?auto_333456 ?auto_333457 ?auto_333458 ?auto_333459 ?auto_333460 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333475 - BLOCK
      ?auto_333476 - BLOCK
      ?auto_333477 - BLOCK
      ?auto_333478 - BLOCK
      ?auto_333479 - BLOCK
      ?auto_333480 - BLOCK
      ?auto_333481 - BLOCK
      ?auto_333482 - BLOCK
      ?auto_333483 - BLOCK
      ?auto_333484 - BLOCK
      ?auto_333485 - BLOCK
      ?auto_333486 - BLOCK
      ?auto_333487 - BLOCK
    )
    :vars
    (
      ?auto_333488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333487 ?auto_333488 ) ( ON-TABLE ?auto_333475 ) ( ON ?auto_333476 ?auto_333475 ) ( ON ?auto_333477 ?auto_333476 ) ( ON ?auto_333478 ?auto_333477 ) ( ON ?auto_333479 ?auto_333478 ) ( ON ?auto_333480 ?auto_333479 ) ( ON ?auto_333481 ?auto_333480 ) ( ON ?auto_333482 ?auto_333481 ) ( ON ?auto_333483 ?auto_333482 ) ( ON ?auto_333484 ?auto_333483 ) ( ON ?auto_333485 ?auto_333484 ) ( not ( = ?auto_333475 ?auto_333476 ) ) ( not ( = ?auto_333475 ?auto_333477 ) ) ( not ( = ?auto_333475 ?auto_333478 ) ) ( not ( = ?auto_333475 ?auto_333479 ) ) ( not ( = ?auto_333475 ?auto_333480 ) ) ( not ( = ?auto_333475 ?auto_333481 ) ) ( not ( = ?auto_333475 ?auto_333482 ) ) ( not ( = ?auto_333475 ?auto_333483 ) ) ( not ( = ?auto_333475 ?auto_333484 ) ) ( not ( = ?auto_333475 ?auto_333485 ) ) ( not ( = ?auto_333475 ?auto_333486 ) ) ( not ( = ?auto_333475 ?auto_333487 ) ) ( not ( = ?auto_333475 ?auto_333488 ) ) ( not ( = ?auto_333476 ?auto_333477 ) ) ( not ( = ?auto_333476 ?auto_333478 ) ) ( not ( = ?auto_333476 ?auto_333479 ) ) ( not ( = ?auto_333476 ?auto_333480 ) ) ( not ( = ?auto_333476 ?auto_333481 ) ) ( not ( = ?auto_333476 ?auto_333482 ) ) ( not ( = ?auto_333476 ?auto_333483 ) ) ( not ( = ?auto_333476 ?auto_333484 ) ) ( not ( = ?auto_333476 ?auto_333485 ) ) ( not ( = ?auto_333476 ?auto_333486 ) ) ( not ( = ?auto_333476 ?auto_333487 ) ) ( not ( = ?auto_333476 ?auto_333488 ) ) ( not ( = ?auto_333477 ?auto_333478 ) ) ( not ( = ?auto_333477 ?auto_333479 ) ) ( not ( = ?auto_333477 ?auto_333480 ) ) ( not ( = ?auto_333477 ?auto_333481 ) ) ( not ( = ?auto_333477 ?auto_333482 ) ) ( not ( = ?auto_333477 ?auto_333483 ) ) ( not ( = ?auto_333477 ?auto_333484 ) ) ( not ( = ?auto_333477 ?auto_333485 ) ) ( not ( = ?auto_333477 ?auto_333486 ) ) ( not ( = ?auto_333477 ?auto_333487 ) ) ( not ( = ?auto_333477 ?auto_333488 ) ) ( not ( = ?auto_333478 ?auto_333479 ) ) ( not ( = ?auto_333478 ?auto_333480 ) ) ( not ( = ?auto_333478 ?auto_333481 ) ) ( not ( = ?auto_333478 ?auto_333482 ) ) ( not ( = ?auto_333478 ?auto_333483 ) ) ( not ( = ?auto_333478 ?auto_333484 ) ) ( not ( = ?auto_333478 ?auto_333485 ) ) ( not ( = ?auto_333478 ?auto_333486 ) ) ( not ( = ?auto_333478 ?auto_333487 ) ) ( not ( = ?auto_333478 ?auto_333488 ) ) ( not ( = ?auto_333479 ?auto_333480 ) ) ( not ( = ?auto_333479 ?auto_333481 ) ) ( not ( = ?auto_333479 ?auto_333482 ) ) ( not ( = ?auto_333479 ?auto_333483 ) ) ( not ( = ?auto_333479 ?auto_333484 ) ) ( not ( = ?auto_333479 ?auto_333485 ) ) ( not ( = ?auto_333479 ?auto_333486 ) ) ( not ( = ?auto_333479 ?auto_333487 ) ) ( not ( = ?auto_333479 ?auto_333488 ) ) ( not ( = ?auto_333480 ?auto_333481 ) ) ( not ( = ?auto_333480 ?auto_333482 ) ) ( not ( = ?auto_333480 ?auto_333483 ) ) ( not ( = ?auto_333480 ?auto_333484 ) ) ( not ( = ?auto_333480 ?auto_333485 ) ) ( not ( = ?auto_333480 ?auto_333486 ) ) ( not ( = ?auto_333480 ?auto_333487 ) ) ( not ( = ?auto_333480 ?auto_333488 ) ) ( not ( = ?auto_333481 ?auto_333482 ) ) ( not ( = ?auto_333481 ?auto_333483 ) ) ( not ( = ?auto_333481 ?auto_333484 ) ) ( not ( = ?auto_333481 ?auto_333485 ) ) ( not ( = ?auto_333481 ?auto_333486 ) ) ( not ( = ?auto_333481 ?auto_333487 ) ) ( not ( = ?auto_333481 ?auto_333488 ) ) ( not ( = ?auto_333482 ?auto_333483 ) ) ( not ( = ?auto_333482 ?auto_333484 ) ) ( not ( = ?auto_333482 ?auto_333485 ) ) ( not ( = ?auto_333482 ?auto_333486 ) ) ( not ( = ?auto_333482 ?auto_333487 ) ) ( not ( = ?auto_333482 ?auto_333488 ) ) ( not ( = ?auto_333483 ?auto_333484 ) ) ( not ( = ?auto_333483 ?auto_333485 ) ) ( not ( = ?auto_333483 ?auto_333486 ) ) ( not ( = ?auto_333483 ?auto_333487 ) ) ( not ( = ?auto_333483 ?auto_333488 ) ) ( not ( = ?auto_333484 ?auto_333485 ) ) ( not ( = ?auto_333484 ?auto_333486 ) ) ( not ( = ?auto_333484 ?auto_333487 ) ) ( not ( = ?auto_333484 ?auto_333488 ) ) ( not ( = ?auto_333485 ?auto_333486 ) ) ( not ( = ?auto_333485 ?auto_333487 ) ) ( not ( = ?auto_333485 ?auto_333488 ) ) ( not ( = ?auto_333486 ?auto_333487 ) ) ( not ( = ?auto_333486 ?auto_333488 ) ) ( not ( = ?auto_333487 ?auto_333488 ) ) ( CLEAR ?auto_333485 ) ( ON ?auto_333486 ?auto_333487 ) ( CLEAR ?auto_333486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_333475 ?auto_333476 ?auto_333477 ?auto_333478 ?auto_333479 ?auto_333480 ?auto_333481 ?auto_333482 ?auto_333483 ?auto_333484 ?auto_333485 ?auto_333486 )
      ( MAKE-13PILE ?auto_333475 ?auto_333476 ?auto_333477 ?auto_333478 ?auto_333479 ?auto_333480 ?auto_333481 ?auto_333482 ?auto_333483 ?auto_333484 ?auto_333485 ?auto_333486 ?auto_333487 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333502 - BLOCK
      ?auto_333503 - BLOCK
      ?auto_333504 - BLOCK
      ?auto_333505 - BLOCK
      ?auto_333506 - BLOCK
      ?auto_333507 - BLOCK
      ?auto_333508 - BLOCK
      ?auto_333509 - BLOCK
      ?auto_333510 - BLOCK
      ?auto_333511 - BLOCK
      ?auto_333512 - BLOCK
      ?auto_333513 - BLOCK
      ?auto_333514 - BLOCK
    )
    :vars
    (
      ?auto_333515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333514 ?auto_333515 ) ( ON-TABLE ?auto_333502 ) ( ON ?auto_333503 ?auto_333502 ) ( ON ?auto_333504 ?auto_333503 ) ( ON ?auto_333505 ?auto_333504 ) ( ON ?auto_333506 ?auto_333505 ) ( ON ?auto_333507 ?auto_333506 ) ( ON ?auto_333508 ?auto_333507 ) ( ON ?auto_333509 ?auto_333508 ) ( ON ?auto_333510 ?auto_333509 ) ( ON ?auto_333511 ?auto_333510 ) ( not ( = ?auto_333502 ?auto_333503 ) ) ( not ( = ?auto_333502 ?auto_333504 ) ) ( not ( = ?auto_333502 ?auto_333505 ) ) ( not ( = ?auto_333502 ?auto_333506 ) ) ( not ( = ?auto_333502 ?auto_333507 ) ) ( not ( = ?auto_333502 ?auto_333508 ) ) ( not ( = ?auto_333502 ?auto_333509 ) ) ( not ( = ?auto_333502 ?auto_333510 ) ) ( not ( = ?auto_333502 ?auto_333511 ) ) ( not ( = ?auto_333502 ?auto_333512 ) ) ( not ( = ?auto_333502 ?auto_333513 ) ) ( not ( = ?auto_333502 ?auto_333514 ) ) ( not ( = ?auto_333502 ?auto_333515 ) ) ( not ( = ?auto_333503 ?auto_333504 ) ) ( not ( = ?auto_333503 ?auto_333505 ) ) ( not ( = ?auto_333503 ?auto_333506 ) ) ( not ( = ?auto_333503 ?auto_333507 ) ) ( not ( = ?auto_333503 ?auto_333508 ) ) ( not ( = ?auto_333503 ?auto_333509 ) ) ( not ( = ?auto_333503 ?auto_333510 ) ) ( not ( = ?auto_333503 ?auto_333511 ) ) ( not ( = ?auto_333503 ?auto_333512 ) ) ( not ( = ?auto_333503 ?auto_333513 ) ) ( not ( = ?auto_333503 ?auto_333514 ) ) ( not ( = ?auto_333503 ?auto_333515 ) ) ( not ( = ?auto_333504 ?auto_333505 ) ) ( not ( = ?auto_333504 ?auto_333506 ) ) ( not ( = ?auto_333504 ?auto_333507 ) ) ( not ( = ?auto_333504 ?auto_333508 ) ) ( not ( = ?auto_333504 ?auto_333509 ) ) ( not ( = ?auto_333504 ?auto_333510 ) ) ( not ( = ?auto_333504 ?auto_333511 ) ) ( not ( = ?auto_333504 ?auto_333512 ) ) ( not ( = ?auto_333504 ?auto_333513 ) ) ( not ( = ?auto_333504 ?auto_333514 ) ) ( not ( = ?auto_333504 ?auto_333515 ) ) ( not ( = ?auto_333505 ?auto_333506 ) ) ( not ( = ?auto_333505 ?auto_333507 ) ) ( not ( = ?auto_333505 ?auto_333508 ) ) ( not ( = ?auto_333505 ?auto_333509 ) ) ( not ( = ?auto_333505 ?auto_333510 ) ) ( not ( = ?auto_333505 ?auto_333511 ) ) ( not ( = ?auto_333505 ?auto_333512 ) ) ( not ( = ?auto_333505 ?auto_333513 ) ) ( not ( = ?auto_333505 ?auto_333514 ) ) ( not ( = ?auto_333505 ?auto_333515 ) ) ( not ( = ?auto_333506 ?auto_333507 ) ) ( not ( = ?auto_333506 ?auto_333508 ) ) ( not ( = ?auto_333506 ?auto_333509 ) ) ( not ( = ?auto_333506 ?auto_333510 ) ) ( not ( = ?auto_333506 ?auto_333511 ) ) ( not ( = ?auto_333506 ?auto_333512 ) ) ( not ( = ?auto_333506 ?auto_333513 ) ) ( not ( = ?auto_333506 ?auto_333514 ) ) ( not ( = ?auto_333506 ?auto_333515 ) ) ( not ( = ?auto_333507 ?auto_333508 ) ) ( not ( = ?auto_333507 ?auto_333509 ) ) ( not ( = ?auto_333507 ?auto_333510 ) ) ( not ( = ?auto_333507 ?auto_333511 ) ) ( not ( = ?auto_333507 ?auto_333512 ) ) ( not ( = ?auto_333507 ?auto_333513 ) ) ( not ( = ?auto_333507 ?auto_333514 ) ) ( not ( = ?auto_333507 ?auto_333515 ) ) ( not ( = ?auto_333508 ?auto_333509 ) ) ( not ( = ?auto_333508 ?auto_333510 ) ) ( not ( = ?auto_333508 ?auto_333511 ) ) ( not ( = ?auto_333508 ?auto_333512 ) ) ( not ( = ?auto_333508 ?auto_333513 ) ) ( not ( = ?auto_333508 ?auto_333514 ) ) ( not ( = ?auto_333508 ?auto_333515 ) ) ( not ( = ?auto_333509 ?auto_333510 ) ) ( not ( = ?auto_333509 ?auto_333511 ) ) ( not ( = ?auto_333509 ?auto_333512 ) ) ( not ( = ?auto_333509 ?auto_333513 ) ) ( not ( = ?auto_333509 ?auto_333514 ) ) ( not ( = ?auto_333509 ?auto_333515 ) ) ( not ( = ?auto_333510 ?auto_333511 ) ) ( not ( = ?auto_333510 ?auto_333512 ) ) ( not ( = ?auto_333510 ?auto_333513 ) ) ( not ( = ?auto_333510 ?auto_333514 ) ) ( not ( = ?auto_333510 ?auto_333515 ) ) ( not ( = ?auto_333511 ?auto_333512 ) ) ( not ( = ?auto_333511 ?auto_333513 ) ) ( not ( = ?auto_333511 ?auto_333514 ) ) ( not ( = ?auto_333511 ?auto_333515 ) ) ( not ( = ?auto_333512 ?auto_333513 ) ) ( not ( = ?auto_333512 ?auto_333514 ) ) ( not ( = ?auto_333512 ?auto_333515 ) ) ( not ( = ?auto_333513 ?auto_333514 ) ) ( not ( = ?auto_333513 ?auto_333515 ) ) ( not ( = ?auto_333514 ?auto_333515 ) ) ( ON ?auto_333513 ?auto_333514 ) ( CLEAR ?auto_333511 ) ( ON ?auto_333512 ?auto_333513 ) ( CLEAR ?auto_333512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_333502 ?auto_333503 ?auto_333504 ?auto_333505 ?auto_333506 ?auto_333507 ?auto_333508 ?auto_333509 ?auto_333510 ?auto_333511 ?auto_333512 )
      ( MAKE-13PILE ?auto_333502 ?auto_333503 ?auto_333504 ?auto_333505 ?auto_333506 ?auto_333507 ?auto_333508 ?auto_333509 ?auto_333510 ?auto_333511 ?auto_333512 ?auto_333513 ?auto_333514 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333529 - BLOCK
      ?auto_333530 - BLOCK
      ?auto_333531 - BLOCK
      ?auto_333532 - BLOCK
      ?auto_333533 - BLOCK
      ?auto_333534 - BLOCK
      ?auto_333535 - BLOCK
      ?auto_333536 - BLOCK
      ?auto_333537 - BLOCK
      ?auto_333538 - BLOCK
      ?auto_333539 - BLOCK
      ?auto_333540 - BLOCK
      ?auto_333541 - BLOCK
    )
    :vars
    (
      ?auto_333542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333541 ?auto_333542 ) ( ON-TABLE ?auto_333529 ) ( ON ?auto_333530 ?auto_333529 ) ( ON ?auto_333531 ?auto_333530 ) ( ON ?auto_333532 ?auto_333531 ) ( ON ?auto_333533 ?auto_333532 ) ( ON ?auto_333534 ?auto_333533 ) ( ON ?auto_333535 ?auto_333534 ) ( ON ?auto_333536 ?auto_333535 ) ( ON ?auto_333537 ?auto_333536 ) ( ON ?auto_333538 ?auto_333537 ) ( not ( = ?auto_333529 ?auto_333530 ) ) ( not ( = ?auto_333529 ?auto_333531 ) ) ( not ( = ?auto_333529 ?auto_333532 ) ) ( not ( = ?auto_333529 ?auto_333533 ) ) ( not ( = ?auto_333529 ?auto_333534 ) ) ( not ( = ?auto_333529 ?auto_333535 ) ) ( not ( = ?auto_333529 ?auto_333536 ) ) ( not ( = ?auto_333529 ?auto_333537 ) ) ( not ( = ?auto_333529 ?auto_333538 ) ) ( not ( = ?auto_333529 ?auto_333539 ) ) ( not ( = ?auto_333529 ?auto_333540 ) ) ( not ( = ?auto_333529 ?auto_333541 ) ) ( not ( = ?auto_333529 ?auto_333542 ) ) ( not ( = ?auto_333530 ?auto_333531 ) ) ( not ( = ?auto_333530 ?auto_333532 ) ) ( not ( = ?auto_333530 ?auto_333533 ) ) ( not ( = ?auto_333530 ?auto_333534 ) ) ( not ( = ?auto_333530 ?auto_333535 ) ) ( not ( = ?auto_333530 ?auto_333536 ) ) ( not ( = ?auto_333530 ?auto_333537 ) ) ( not ( = ?auto_333530 ?auto_333538 ) ) ( not ( = ?auto_333530 ?auto_333539 ) ) ( not ( = ?auto_333530 ?auto_333540 ) ) ( not ( = ?auto_333530 ?auto_333541 ) ) ( not ( = ?auto_333530 ?auto_333542 ) ) ( not ( = ?auto_333531 ?auto_333532 ) ) ( not ( = ?auto_333531 ?auto_333533 ) ) ( not ( = ?auto_333531 ?auto_333534 ) ) ( not ( = ?auto_333531 ?auto_333535 ) ) ( not ( = ?auto_333531 ?auto_333536 ) ) ( not ( = ?auto_333531 ?auto_333537 ) ) ( not ( = ?auto_333531 ?auto_333538 ) ) ( not ( = ?auto_333531 ?auto_333539 ) ) ( not ( = ?auto_333531 ?auto_333540 ) ) ( not ( = ?auto_333531 ?auto_333541 ) ) ( not ( = ?auto_333531 ?auto_333542 ) ) ( not ( = ?auto_333532 ?auto_333533 ) ) ( not ( = ?auto_333532 ?auto_333534 ) ) ( not ( = ?auto_333532 ?auto_333535 ) ) ( not ( = ?auto_333532 ?auto_333536 ) ) ( not ( = ?auto_333532 ?auto_333537 ) ) ( not ( = ?auto_333532 ?auto_333538 ) ) ( not ( = ?auto_333532 ?auto_333539 ) ) ( not ( = ?auto_333532 ?auto_333540 ) ) ( not ( = ?auto_333532 ?auto_333541 ) ) ( not ( = ?auto_333532 ?auto_333542 ) ) ( not ( = ?auto_333533 ?auto_333534 ) ) ( not ( = ?auto_333533 ?auto_333535 ) ) ( not ( = ?auto_333533 ?auto_333536 ) ) ( not ( = ?auto_333533 ?auto_333537 ) ) ( not ( = ?auto_333533 ?auto_333538 ) ) ( not ( = ?auto_333533 ?auto_333539 ) ) ( not ( = ?auto_333533 ?auto_333540 ) ) ( not ( = ?auto_333533 ?auto_333541 ) ) ( not ( = ?auto_333533 ?auto_333542 ) ) ( not ( = ?auto_333534 ?auto_333535 ) ) ( not ( = ?auto_333534 ?auto_333536 ) ) ( not ( = ?auto_333534 ?auto_333537 ) ) ( not ( = ?auto_333534 ?auto_333538 ) ) ( not ( = ?auto_333534 ?auto_333539 ) ) ( not ( = ?auto_333534 ?auto_333540 ) ) ( not ( = ?auto_333534 ?auto_333541 ) ) ( not ( = ?auto_333534 ?auto_333542 ) ) ( not ( = ?auto_333535 ?auto_333536 ) ) ( not ( = ?auto_333535 ?auto_333537 ) ) ( not ( = ?auto_333535 ?auto_333538 ) ) ( not ( = ?auto_333535 ?auto_333539 ) ) ( not ( = ?auto_333535 ?auto_333540 ) ) ( not ( = ?auto_333535 ?auto_333541 ) ) ( not ( = ?auto_333535 ?auto_333542 ) ) ( not ( = ?auto_333536 ?auto_333537 ) ) ( not ( = ?auto_333536 ?auto_333538 ) ) ( not ( = ?auto_333536 ?auto_333539 ) ) ( not ( = ?auto_333536 ?auto_333540 ) ) ( not ( = ?auto_333536 ?auto_333541 ) ) ( not ( = ?auto_333536 ?auto_333542 ) ) ( not ( = ?auto_333537 ?auto_333538 ) ) ( not ( = ?auto_333537 ?auto_333539 ) ) ( not ( = ?auto_333537 ?auto_333540 ) ) ( not ( = ?auto_333537 ?auto_333541 ) ) ( not ( = ?auto_333537 ?auto_333542 ) ) ( not ( = ?auto_333538 ?auto_333539 ) ) ( not ( = ?auto_333538 ?auto_333540 ) ) ( not ( = ?auto_333538 ?auto_333541 ) ) ( not ( = ?auto_333538 ?auto_333542 ) ) ( not ( = ?auto_333539 ?auto_333540 ) ) ( not ( = ?auto_333539 ?auto_333541 ) ) ( not ( = ?auto_333539 ?auto_333542 ) ) ( not ( = ?auto_333540 ?auto_333541 ) ) ( not ( = ?auto_333540 ?auto_333542 ) ) ( not ( = ?auto_333541 ?auto_333542 ) ) ( ON ?auto_333540 ?auto_333541 ) ( CLEAR ?auto_333538 ) ( ON ?auto_333539 ?auto_333540 ) ( CLEAR ?auto_333539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_333529 ?auto_333530 ?auto_333531 ?auto_333532 ?auto_333533 ?auto_333534 ?auto_333535 ?auto_333536 ?auto_333537 ?auto_333538 ?auto_333539 )
      ( MAKE-13PILE ?auto_333529 ?auto_333530 ?auto_333531 ?auto_333532 ?auto_333533 ?auto_333534 ?auto_333535 ?auto_333536 ?auto_333537 ?auto_333538 ?auto_333539 ?auto_333540 ?auto_333541 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333556 - BLOCK
      ?auto_333557 - BLOCK
      ?auto_333558 - BLOCK
      ?auto_333559 - BLOCK
      ?auto_333560 - BLOCK
      ?auto_333561 - BLOCK
      ?auto_333562 - BLOCK
      ?auto_333563 - BLOCK
      ?auto_333564 - BLOCK
      ?auto_333565 - BLOCK
      ?auto_333566 - BLOCK
      ?auto_333567 - BLOCK
      ?auto_333568 - BLOCK
    )
    :vars
    (
      ?auto_333569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333568 ?auto_333569 ) ( ON-TABLE ?auto_333556 ) ( ON ?auto_333557 ?auto_333556 ) ( ON ?auto_333558 ?auto_333557 ) ( ON ?auto_333559 ?auto_333558 ) ( ON ?auto_333560 ?auto_333559 ) ( ON ?auto_333561 ?auto_333560 ) ( ON ?auto_333562 ?auto_333561 ) ( ON ?auto_333563 ?auto_333562 ) ( ON ?auto_333564 ?auto_333563 ) ( not ( = ?auto_333556 ?auto_333557 ) ) ( not ( = ?auto_333556 ?auto_333558 ) ) ( not ( = ?auto_333556 ?auto_333559 ) ) ( not ( = ?auto_333556 ?auto_333560 ) ) ( not ( = ?auto_333556 ?auto_333561 ) ) ( not ( = ?auto_333556 ?auto_333562 ) ) ( not ( = ?auto_333556 ?auto_333563 ) ) ( not ( = ?auto_333556 ?auto_333564 ) ) ( not ( = ?auto_333556 ?auto_333565 ) ) ( not ( = ?auto_333556 ?auto_333566 ) ) ( not ( = ?auto_333556 ?auto_333567 ) ) ( not ( = ?auto_333556 ?auto_333568 ) ) ( not ( = ?auto_333556 ?auto_333569 ) ) ( not ( = ?auto_333557 ?auto_333558 ) ) ( not ( = ?auto_333557 ?auto_333559 ) ) ( not ( = ?auto_333557 ?auto_333560 ) ) ( not ( = ?auto_333557 ?auto_333561 ) ) ( not ( = ?auto_333557 ?auto_333562 ) ) ( not ( = ?auto_333557 ?auto_333563 ) ) ( not ( = ?auto_333557 ?auto_333564 ) ) ( not ( = ?auto_333557 ?auto_333565 ) ) ( not ( = ?auto_333557 ?auto_333566 ) ) ( not ( = ?auto_333557 ?auto_333567 ) ) ( not ( = ?auto_333557 ?auto_333568 ) ) ( not ( = ?auto_333557 ?auto_333569 ) ) ( not ( = ?auto_333558 ?auto_333559 ) ) ( not ( = ?auto_333558 ?auto_333560 ) ) ( not ( = ?auto_333558 ?auto_333561 ) ) ( not ( = ?auto_333558 ?auto_333562 ) ) ( not ( = ?auto_333558 ?auto_333563 ) ) ( not ( = ?auto_333558 ?auto_333564 ) ) ( not ( = ?auto_333558 ?auto_333565 ) ) ( not ( = ?auto_333558 ?auto_333566 ) ) ( not ( = ?auto_333558 ?auto_333567 ) ) ( not ( = ?auto_333558 ?auto_333568 ) ) ( not ( = ?auto_333558 ?auto_333569 ) ) ( not ( = ?auto_333559 ?auto_333560 ) ) ( not ( = ?auto_333559 ?auto_333561 ) ) ( not ( = ?auto_333559 ?auto_333562 ) ) ( not ( = ?auto_333559 ?auto_333563 ) ) ( not ( = ?auto_333559 ?auto_333564 ) ) ( not ( = ?auto_333559 ?auto_333565 ) ) ( not ( = ?auto_333559 ?auto_333566 ) ) ( not ( = ?auto_333559 ?auto_333567 ) ) ( not ( = ?auto_333559 ?auto_333568 ) ) ( not ( = ?auto_333559 ?auto_333569 ) ) ( not ( = ?auto_333560 ?auto_333561 ) ) ( not ( = ?auto_333560 ?auto_333562 ) ) ( not ( = ?auto_333560 ?auto_333563 ) ) ( not ( = ?auto_333560 ?auto_333564 ) ) ( not ( = ?auto_333560 ?auto_333565 ) ) ( not ( = ?auto_333560 ?auto_333566 ) ) ( not ( = ?auto_333560 ?auto_333567 ) ) ( not ( = ?auto_333560 ?auto_333568 ) ) ( not ( = ?auto_333560 ?auto_333569 ) ) ( not ( = ?auto_333561 ?auto_333562 ) ) ( not ( = ?auto_333561 ?auto_333563 ) ) ( not ( = ?auto_333561 ?auto_333564 ) ) ( not ( = ?auto_333561 ?auto_333565 ) ) ( not ( = ?auto_333561 ?auto_333566 ) ) ( not ( = ?auto_333561 ?auto_333567 ) ) ( not ( = ?auto_333561 ?auto_333568 ) ) ( not ( = ?auto_333561 ?auto_333569 ) ) ( not ( = ?auto_333562 ?auto_333563 ) ) ( not ( = ?auto_333562 ?auto_333564 ) ) ( not ( = ?auto_333562 ?auto_333565 ) ) ( not ( = ?auto_333562 ?auto_333566 ) ) ( not ( = ?auto_333562 ?auto_333567 ) ) ( not ( = ?auto_333562 ?auto_333568 ) ) ( not ( = ?auto_333562 ?auto_333569 ) ) ( not ( = ?auto_333563 ?auto_333564 ) ) ( not ( = ?auto_333563 ?auto_333565 ) ) ( not ( = ?auto_333563 ?auto_333566 ) ) ( not ( = ?auto_333563 ?auto_333567 ) ) ( not ( = ?auto_333563 ?auto_333568 ) ) ( not ( = ?auto_333563 ?auto_333569 ) ) ( not ( = ?auto_333564 ?auto_333565 ) ) ( not ( = ?auto_333564 ?auto_333566 ) ) ( not ( = ?auto_333564 ?auto_333567 ) ) ( not ( = ?auto_333564 ?auto_333568 ) ) ( not ( = ?auto_333564 ?auto_333569 ) ) ( not ( = ?auto_333565 ?auto_333566 ) ) ( not ( = ?auto_333565 ?auto_333567 ) ) ( not ( = ?auto_333565 ?auto_333568 ) ) ( not ( = ?auto_333565 ?auto_333569 ) ) ( not ( = ?auto_333566 ?auto_333567 ) ) ( not ( = ?auto_333566 ?auto_333568 ) ) ( not ( = ?auto_333566 ?auto_333569 ) ) ( not ( = ?auto_333567 ?auto_333568 ) ) ( not ( = ?auto_333567 ?auto_333569 ) ) ( not ( = ?auto_333568 ?auto_333569 ) ) ( ON ?auto_333567 ?auto_333568 ) ( ON ?auto_333566 ?auto_333567 ) ( CLEAR ?auto_333564 ) ( ON ?auto_333565 ?auto_333566 ) ( CLEAR ?auto_333565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_333556 ?auto_333557 ?auto_333558 ?auto_333559 ?auto_333560 ?auto_333561 ?auto_333562 ?auto_333563 ?auto_333564 ?auto_333565 )
      ( MAKE-13PILE ?auto_333556 ?auto_333557 ?auto_333558 ?auto_333559 ?auto_333560 ?auto_333561 ?auto_333562 ?auto_333563 ?auto_333564 ?auto_333565 ?auto_333566 ?auto_333567 ?auto_333568 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333583 - BLOCK
      ?auto_333584 - BLOCK
      ?auto_333585 - BLOCK
      ?auto_333586 - BLOCK
      ?auto_333587 - BLOCK
      ?auto_333588 - BLOCK
      ?auto_333589 - BLOCK
      ?auto_333590 - BLOCK
      ?auto_333591 - BLOCK
      ?auto_333592 - BLOCK
      ?auto_333593 - BLOCK
      ?auto_333594 - BLOCK
      ?auto_333595 - BLOCK
    )
    :vars
    (
      ?auto_333596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333595 ?auto_333596 ) ( ON-TABLE ?auto_333583 ) ( ON ?auto_333584 ?auto_333583 ) ( ON ?auto_333585 ?auto_333584 ) ( ON ?auto_333586 ?auto_333585 ) ( ON ?auto_333587 ?auto_333586 ) ( ON ?auto_333588 ?auto_333587 ) ( ON ?auto_333589 ?auto_333588 ) ( ON ?auto_333590 ?auto_333589 ) ( ON ?auto_333591 ?auto_333590 ) ( not ( = ?auto_333583 ?auto_333584 ) ) ( not ( = ?auto_333583 ?auto_333585 ) ) ( not ( = ?auto_333583 ?auto_333586 ) ) ( not ( = ?auto_333583 ?auto_333587 ) ) ( not ( = ?auto_333583 ?auto_333588 ) ) ( not ( = ?auto_333583 ?auto_333589 ) ) ( not ( = ?auto_333583 ?auto_333590 ) ) ( not ( = ?auto_333583 ?auto_333591 ) ) ( not ( = ?auto_333583 ?auto_333592 ) ) ( not ( = ?auto_333583 ?auto_333593 ) ) ( not ( = ?auto_333583 ?auto_333594 ) ) ( not ( = ?auto_333583 ?auto_333595 ) ) ( not ( = ?auto_333583 ?auto_333596 ) ) ( not ( = ?auto_333584 ?auto_333585 ) ) ( not ( = ?auto_333584 ?auto_333586 ) ) ( not ( = ?auto_333584 ?auto_333587 ) ) ( not ( = ?auto_333584 ?auto_333588 ) ) ( not ( = ?auto_333584 ?auto_333589 ) ) ( not ( = ?auto_333584 ?auto_333590 ) ) ( not ( = ?auto_333584 ?auto_333591 ) ) ( not ( = ?auto_333584 ?auto_333592 ) ) ( not ( = ?auto_333584 ?auto_333593 ) ) ( not ( = ?auto_333584 ?auto_333594 ) ) ( not ( = ?auto_333584 ?auto_333595 ) ) ( not ( = ?auto_333584 ?auto_333596 ) ) ( not ( = ?auto_333585 ?auto_333586 ) ) ( not ( = ?auto_333585 ?auto_333587 ) ) ( not ( = ?auto_333585 ?auto_333588 ) ) ( not ( = ?auto_333585 ?auto_333589 ) ) ( not ( = ?auto_333585 ?auto_333590 ) ) ( not ( = ?auto_333585 ?auto_333591 ) ) ( not ( = ?auto_333585 ?auto_333592 ) ) ( not ( = ?auto_333585 ?auto_333593 ) ) ( not ( = ?auto_333585 ?auto_333594 ) ) ( not ( = ?auto_333585 ?auto_333595 ) ) ( not ( = ?auto_333585 ?auto_333596 ) ) ( not ( = ?auto_333586 ?auto_333587 ) ) ( not ( = ?auto_333586 ?auto_333588 ) ) ( not ( = ?auto_333586 ?auto_333589 ) ) ( not ( = ?auto_333586 ?auto_333590 ) ) ( not ( = ?auto_333586 ?auto_333591 ) ) ( not ( = ?auto_333586 ?auto_333592 ) ) ( not ( = ?auto_333586 ?auto_333593 ) ) ( not ( = ?auto_333586 ?auto_333594 ) ) ( not ( = ?auto_333586 ?auto_333595 ) ) ( not ( = ?auto_333586 ?auto_333596 ) ) ( not ( = ?auto_333587 ?auto_333588 ) ) ( not ( = ?auto_333587 ?auto_333589 ) ) ( not ( = ?auto_333587 ?auto_333590 ) ) ( not ( = ?auto_333587 ?auto_333591 ) ) ( not ( = ?auto_333587 ?auto_333592 ) ) ( not ( = ?auto_333587 ?auto_333593 ) ) ( not ( = ?auto_333587 ?auto_333594 ) ) ( not ( = ?auto_333587 ?auto_333595 ) ) ( not ( = ?auto_333587 ?auto_333596 ) ) ( not ( = ?auto_333588 ?auto_333589 ) ) ( not ( = ?auto_333588 ?auto_333590 ) ) ( not ( = ?auto_333588 ?auto_333591 ) ) ( not ( = ?auto_333588 ?auto_333592 ) ) ( not ( = ?auto_333588 ?auto_333593 ) ) ( not ( = ?auto_333588 ?auto_333594 ) ) ( not ( = ?auto_333588 ?auto_333595 ) ) ( not ( = ?auto_333588 ?auto_333596 ) ) ( not ( = ?auto_333589 ?auto_333590 ) ) ( not ( = ?auto_333589 ?auto_333591 ) ) ( not ( = ?auto_333589 ?auto_333592 ) ) ( not ( = ?auto_333589 ?auto_333593 ) ) ( not ( = ?auto_333589 ?auto_333594 ) ) ( not ( = ?auto_333589 ?auto_333595 ) ) ( not ( = ?auto_333589 ?auto_333596 ) ) ( not ( = ?auto_333590 ?auto_333591 ) ) ( not ( = ?auto_333590 ?auto_333592 ) ) ( not ( = ?auto_333590 ?auto_333593 ) ) ( not ( = ?auto_333590 ?auto_333594 ) ) ( not ( = ?auto_333590 ?auto_333595 ) ) ( not ( = ?auto_333590 ?auto_333596 ) ) ( not ( = ?auto_333591 ?auto_333592 ) ) ( not ( = ?auto_333591 ?auto_333593 ) ) ( not ( = ?auto_333591 ?auto_333594 ) ) ( not ( = ?auto_333591 ?auto_333595 ) ) ( not ( = ?auto_333591 ?auto_333596 ) ) ( not ( = ?auto_333592 ?auto_333593 ) ) ( not ( = ?auto_333592 ?auto_333594 ) ) ( not ( = ?auto_333592 ?auto_333595 ) ) ( not ( = ?auto_333592 ?auto_333596 ) ) ( not ( = ?auto_333593 ?auto_333594 ) ) ( not ( = ?auto_333593 ?auto_333595 ) ) ( not ( = ?auto_333593 ?auto_333596 ) ) ( not ( = ?auto_333594 ?auto_333595 ) ) ( not ( = ?auto_333594 ?auto_333596 ) ) ( not ( = ?auto_333595 ?auto_333596 ) ) ( ON ?auto_333594 ?auto_333595 ) ( ON ?auto_333593 ?auto_333594 ) ( CLEAR ?auto_333591 ) ( ON ?auto_333592 ?auto_333593 ) ( CLEAR ?auto_333592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_333583 ?auto_333584 ?auto_333585 ?auto_333586 ?auto_333587 ?auto_333588 ?auto_333589 ?auto_333590 ?auto_333591 ?auto_333592 )
      ( MAKE-13PILE ?auto_333583 ?auto_333584 ?auto_333585 ?auto_333586 ?auto_333587 ?auto_333588 ?auto_333589 ?auto_333590 ?auto_333591 ?auto_333592 ?auto_333593 ?auto_333594 ?auto_333595 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333610 - BLOCK
      ?auto_333611 - BLOCK
      ?auto_333612 - BLOCK
      ?auto_333613 - BLOCK
      ?auto_333614 - BLOCK
      ?auto_333615 - BLOCK
      ?auto_333616 - BLOCK
      ?auto_333617 - BLOCK
      ?auto_333618 - BLOCK
      ?auto_333619 - BLOCK
      ?auto_333620 - BLOCK
      ?auto_333621 - BLOCK
      ?auto_333622 - BLOCK
    )
    :vars
    (
      ?auto_333623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333622 ?auto_333623 ) ( ON-TABLE ?auto_333610 ) ( ON ?auto_333611 ?auto_333610 ) ( ON ?auto_333612 ?auto_333611 ) ( ON ?auto_333613 ?auto_333612 ) ( ON ?auto_333614 ?auto_333613 ) ( ON ?auto_333615 ?auto_333614 ) ( ON ?auto_333616 ?auto_333615 ) ( ON ?auto_333617 ?auto_333616 ) ( not ( = ?auto_333610 ?auto_333611 ) ) ( not ( = ?auto_333610 ?auto_333612 ) ) ( not ( = ?auto_333610 ?auto_333613 ) ) ( not ( = ?auto_333610 ?auto_333614 ) ) ( not ( = ?auto_333610 ?auto_333615 ) ) ( not ( = ?auto_333610 ?auto_333616 ) ) ( not ( = ?auto_333610 ?auto_333617 ) ) ( not ( = ?auto_333610 ?auto_333618 ) ) ( not ( = ?auto_333610 ?auto_333619 ) ) ( not ( = ?auto_333610 ?auto_333620 ) ) ( not ( = ?auto_333610 ?auto_333621 ) ) ( not ( = ?auto_333610 ?auto_333622 ) ) ( not ( = ?auto_333610 ?auto_333623 ) ) ( not ( = ?auto_333611 ?auto_333612 ) ) ( not ( = ?auto_333611 ?auto_333613 ) ) ( not ( = ?auto_333611 ?auto_333614 ) ) ( not ( = ?auto_333611 ?auto_333615 ) ) ( not ( = ?auto_333611 ?auto_333616 ) ) ( not ( = ?auto_333611 ?auto_333617 ) ) ( not ( = ?auto_333611 ?auto_333618 ) ) ( not ( = ?auto_333611 ?auto_333619 ) ) ( not ( = ?auto_333611 ?auto_333620 ) ) ( not ( = ?auto_333611 ?auto_333621 ) ) ( not ( = ?auto_333611 ?auto_333622 ) ) ( not ( = ?auto_333611 ?auto_333623 ) ) ( not ( = ?auto_333612 ?auto_333613 ) ) ( not ( = ?auto_333612 ?auto_333614 ) ) ( not ( = ?auto_333612 ?auto_333615 ) ) ( not ( = ?auto_333612 ?auto_333616 ) ) ( not ( = ?auto_333612 ?auto_333617 ) ) ( not ( = ?auto_333612 ?auto_333618 ) ) ( not ( = ?auto_333612 ?auto_333619 ) ) ( not ( = ?auto_333612 ?auto_333620 ) ) ( not ( = ?auto_333612 ?auto_333621 ) ) ( not ( = ?auto_333612 ?auto_333622 ) ) ( not ( = ?auto_333612 ?auto_333623 ) ) ( not ( = ?auto_333613 ?auto_333614 ) ) ( not ( = ?auto_333613 ?auto_333615 ) ) ( not ( = ?auto_333613 ?auto_333616 ) ) ( not ( = ?auto_333613 ?auto_333617 ) ) ( not ( = ?auto_333613 ?auto_333618 ) ) ( not ( = ?auto_333613 ?auto_333619 ) ) ( not ( = ?auto_333613 ?auto_333620 ) ) ( not ( = ?auto_333613 ?auto_333621 ) ) ( not ( = ?auto_333613 ?auto_333622 ) ) ( not ( = ?auto_333613 ?auto_333623 ) ) ( not ( = ?auto_333614 ?auto_333615 ) ) ( not ( = ?auto_333614 ?auto_333616 ) ) ( not ( = ?auto_333614 ?auto_333617 ) ) ( not ( = ?auto_333614 ?auto_333618 ) ) ( not ( = ?auto_333614 ?auto_333619 ) ) ( not ( = ?auto_333614 ?auto_333620 ) ) ( not ( = ?auto_333614 ?auto_333621 ) ) ( not ( = ?auto_333614 ?auto_333622 ) ) ( not ( = ?auto_333614 ?auto_333623 ) ) ( not ( = ?auto_333615 ?auto_333616 ) ) ( not ( = ?auto_333615 ?auto_333617 ) ) ( not ( = ?auto_333615 ?auto_333618 ) ) ( not ( = ?auto_333615 ?auto_333619 ) ) ( not ( = ?auto_333615 ?auto_333620 ) ) ( not ( = ?auto_333615 ?auto_333621 ) ) ( not ( = ?auto_333615 ?auto_333622 ) ) ( not ( = ?auto_333615 ?auto_333623 ) ) ( not ( = ?auto_333616 ?auto_333617 ) ) ( not ( = ?auto_333616 ?auto_333618 ) ) ( not ( = ?auto_333616 ?auto_333619 ) ) ( not ( = ?auto_333616 ?auto_333620 ) ) ( not ( = ?auto_333616 ?auto_333621 ) ) ( not ( = ?auto_333616 ?auto_333622 ) ) ( not ( = ?auto_333616 ?auto_333623 ) ) ( not ( = ?auto_333617 ?auto_333618 ) ) ( not ( = ?auto_333617 ?auto_333619 ) ) ( not ( = ?auto_333617 ?auto_333620 ) ) ( not ( = ?auto_333617 ?auto_333621 ) ) ( not ( = ?auto_333617 ?auto_333622 ) ) ( not ( = ?auto_333617 ?auto_333623 ) ) ( not ( = ?auto_333618 ?auto_333619 ) ) ( not ( = ?auto_333618 ?auto_333620 ) ) ( not ( = ?auto_333618 ?auto_333621 ) ) ( not ( = ?auto_333618 ?auto_333622 ) ) ( not ( = ?auto_333618 ?auto_333623 ) ) ( not ( = ?auto_333619 ?auto_333620 ) ) ( not ( = ?auto_333619 ?auto_333621 ) ) ( not ( = ?auto_333619 ?auto_333622 ) ) ( not ( = ?auto_333619 ?auto_333623 ) ) ( not ( = ?auto_333620 ?auto_333621 ) ) ( not ( = ?auto_333620 ?auto_333622 ) ) ( not ( = ?auto_333620 ?auto_333623 ) ) ( not ( = ?auto_333621 ?auto_333622 ) ) ( not ( = ?auto_333621 ?auto_333623 ) ) ( not ( = ?auto_333622 ?auto_333623 ) ) ( ON ?auto_333621 ?auto_333622 ) ( ON ?auto_333620 ?auto_333621 ) ( ON ?auto_333619 ?auto_333620 ) ( CLEAR ?auto_333617 ) ( ON ?auto_333618 ?auto_333619 ) ( CLEAR ?auto_333618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_333610 ?auto_333611 ?auto_333612 ?auto_333613 ?auto_333614 ?auto_333615 ?auto_333616 ?auto_333617 ?auto_333618 )
      ( MAKE-13PILE ?auto_333610 ?auto_333611 ?auto_333612 ?auto_333613 ?auto_333614 ?auto_333615 ?auto_333616 ?auto_333617 ?auto_333618 ?auto_333619 ?auto_333620 ?auto_333621 ?auto_333622 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333637 - BLOCK
      ?auto_333638 - BLOCK
      ?auto_333639 - BLOCK
      ?auto_333640 - BLOCK
      ?auto_333641 - BLOCK
      ?auto_333642 - BLOCK
      ?auto_333643 - BLOCK
      ?auto_333644 - BLOCK
      ?auto_333645 - BLOCK
      ?auto_333646 - BLOCK
      ?auto_333647 - BLOCK
      ?auto_333648 - BLOCK
      ?auto_333649 - BLOCK
    )
    :vars
    (
      ?auto_333650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333649 ?auto_333650 ) ( ON-TABLE ?auto_333637 ) ( ON ?auto_333638 ?auto_333637 ) ( ON ?auto_333639 ?auto_333638 ) ( ON ?auto_333640 ?auto_333639 ) ( ON ?auto_333641 ?auto_333640 ) ( ON ?auto_333642 ?auto_333641 ) ( ON ?auto_333643 ?auto_333642 ) ( ON ?auto_333644 ?auto_333643 ) ( not ( = ?auto_333637 ?auto_333638 ) ) ( not ( = ?auto_333637 ?auto_333639 ) ) ( not ( = ?auto_333637 ?auto_333640 ) ) ( not ( = ?auto_333637 ?auto_333641 ) ) ( not ( = ?auto_333637 ?auto_333642 ) ) ( not ( = ?auto_333637 ?auto_333643 ) ) ( not ( = ?auto_333637 ?auto_333644 ) ) ( not ( = ?auto_333637 ?auto_333645 ) ) ( not ( = ?auto_333637 ?auto_333646 ) ) ( not ( = ?auto_333637 ?auto_333647 ) ) ( not ( = ?auto_333637 ?auto_333648 ) ) ( not ( = ?auto_333637 ?auto_333649 ) ) ( not ( = ?auto_333637 ?auto_333650 ) ) ( not ( = ?auto_333638 ?auto_333639 ) ) ( not ( = ?auto_333638 ?auto_333640 ) ) ( not ( = ?auto_333638 ?auto_333641 ) ) ( not ( = ?auto_333638 ?auto_333642 ) ) ( not ( = ?auto_333638 ?auto_333643 ) ) ( not ( = ?auto_333638 ?auto_333644 ) ) ( not ( = ?auto_333638 ?auto_333645 ) ) ( not ( = ?auto_333638 ?auto_333646 ) ) ( not ( = ?auto_333638 ?auto_333647 ) ) ( not ( = ?auto_333638 ?auto_333648 ) ) ( not ( = ?auto_333638 ?auto_333649 ) ) ( not ( = ?auto_333638 ?auto_333650 ) ) ( not ( = ?auto_333639 ?auto_333640 ) ) ( not ( = ?auto_333639 ?auto_333641 ) ) ( not ( = ?auto_333639 ?auto_333642 ) ) ( not ( = ?auto_333639 ?auto_333643 ) ) ( not ( = ?auto_333639 ?auto_333644 ) ) ( not ( = ?auto_333639 ?auto_333645 ) ) ( not ( = ?auto_333639 ?auto_333646 ) ) ( not ( = ?auto_333639 ?auto_333647 ) ) ( not ( = ?auto_333639 ?auto_333648 ) ) ( not ( = ?auto_333639 ?auto_333649 ) ) ( not ( = ?auto_333639 ?auto_333650 ) ) ( not ( = ?auto_333640 ?auto_333641 ) ) ( not ( = ?auto_333640 ?auto_333642 ) ) ( not ( = ?auto_333640 ?auto_333643 ) ) ( not ( = ?auto_333640 ?auto_333644 ) ) ( not ( = ?auto_333640 ?auto_333645 ) ) ( not ( = ?auto_333640 ?auto_333646 ) ) ( not ( = ?auto_333640 ?auto_333647 ) ) ( not ( = ?auto_333640 ?auto_333648 ) ) ( not ( = ?auto_333640 ?auto_333649 ) ) ( not ( = ?auto_333640 ?auto_333650 ) ) ( not ( = ?auto_333641 ?auto_333642 ) ) ( not ( = ?auto_333641 ?auto_333643 ) ) ( not ( = ?auto_333641 ?auto_333644 ) ) ( not ( = ?auto_333641 ?auto_333645 ) ) ( not ( = ?auto_333641 ?auto_333646 ) ) ( not ( = ?auto_333641 ?auto_333647 ) ) ( not ( = ?auto_333641 ?auto_333648 ) ) ( not ( = ?auto_333641 ?auto_333649 ) ) ( not ( = ?auto_333641 ?auto_333650 ) ) ( not ( = ?auto_333642 ?auto_333643 ) ) ( not ( = ?auto_333642 ?auto_333644 ) ) ( not ( = ?auto_333642 ?auto_333645 ) ) ( not ( = ?auto_333642 ?auto_333646 ) ) ( not ( = ?auto_333642 ?auto_333647 ) ) ( not ( = ?auto_333642 ?auto_333648 ) ) ( not ( = ?auto_333642 ?auto_333649 ) ) ( not ( = ?auto_333642 ?auto_333650 ) ) ( not ( = ?auto_333643 ?auto_333644 ) ) ( not ( = ?auto_333643 ?auto_333645 ) ) ( not ( = ?auto_333643 ?auto_333646 ) ) ( not ( = ?auto_333643 ?auto_333647 ) ) ( not ( = ?auto_333643 ?auto_333648 ) ) ( not ( = ?auto_333643 ?auto_333649 ) ) ( not ( = ?auto_333643 ?auto_333650 ) ) ( not ( = ?auto_333644 ?auto_333645 ) ) ( not ( = ?auto_333644 ?auto_333646 ) ) ( not ( = ?auto_333644 ?auto_333647 ) ) ( not ( = ?auto_333644 ?auto_333648 ) ) ( not ( = ?auto_333644 ?auto_333649 ) ) ( not ( = ?auto_333644 ?auto_333650 ) ) ( not ( = ?auto_333645 ?auto_333646 ) ) ( not ( = ?auto_333645 ?auto_333647 ) ) ( not ( = ?auto_333645 ?auto_333648 ) ) ( not ( = ?auto_333645 ?auto_333649 ) ) ( not ( = ?auto_333645 ?auto_333650 ) ) ( not ( = ?auto_333646 ?auto_333647 ) ) ( not ( = ?auto_333646 ?auto_333648 ) ) ( not ( = ?auto_333646 ?auto_333649 ) ) ( not ( = ?auto_333646 ?auto_333650 ) ) ( not ( = ?auto_333647 ?auto_333648 ) ) ( not ( = ?auto_333647 ?auto_333649 ) ) ( not ( = ?auto_333647 ?auto_333650 ) ) ( not ( = ?auto_333648 ?auto_333649 ) ) ( not ( = ?auto_333648 ?auto_333650 ) ) ( not ( = ?auto_333649 ?auto_333650 ) ) ( ON ?auto_333648 ?auto_333649 ) ( ON ?auto_333647 ?auto_333648 ) ( ON ?auto_333646 ?auto_333647 ) ( CLEAR ?auto_333644 ) ( ON ?auto_333645 ?auto_333646 ) ( CLEAR ?auto_333645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_333637 ?auto_333638 ?auto_333639 ?auto_333640 ?auto_333641 ?auto_333642 ?auto_333643 ?auto_333644 ?auto_333645 )
      ( MAKE-13PILE ?auto_333637 ?auto_333638 ?auto_333639 ?auto_333640 ?auto_333641 ?auto_333642 ?auto_333643 ?auto_333644 ?auto_333645 ?auto_333646 ?auto_333647 ?auto_333648 ?auto_333649 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333664 - BLOCK
      ?auto_333665 - BLOCK
      ?auto_333666 - BLOCK
      ?auto_333667 - BLOCK
      ?auto_333668 - BLOCK
      ?auto_333669 - BLOCK
      ?auto_333670 - BLOCK
      ?auto_333671 - BLOCK
      ?auto_333672 - BLOCK
      ?auto_333673 - BLOCK
      ?auto_333674 - BLOCK
      ?auto_333675 - BLOCK
      ?auto_333676 - BLOCK
    )
    :vars
    (
      ?auto_333677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333676 ?auto_333677 ) ( ON-TABLE ?auto_333664 ) ( ON ?auto_333665 ?auto_333664 ) ( ON ?auto_333666 ?auto_333665 ) ( ON ?auto_333667 ?auto_333666 ) ( ON ?auto_333668 ?auto_333667 ) ( ON ?auto_333669 ?auto_333668 ) ( ON ?auto_333670 ?auto_333669 ) ( not ( = ?auto_333664 ?auto_333665 ) ) ( not ( = ?auto_333664 ?auto_333666 ) ) ( not ( = ?auto_333664 ?auto_333667 ) ) ( not ( = ?auto_333664 ?auto_333668 ) ) ( not ( = ?auto_333664 ?auto_333669 ) ) ( not ( = ?auto_333664 ?auto_333670 ) ) ( not ( = ?auto_333664 ?auto_333671 ) ) ( not ( = ?auto_333664 ?auto_333672 ) ) ( not ( = ?auto_333664 ?auto_333673 ) ) ( not ( = ?auto_333664 ?auto_333674 ) ) ( not ( = ?auto_333664 ?auto_333675 ) ) ( not ( = ?auto_333664 ?auto_333676 ) ) ( not ( = ?auto_333664 ?auto_333677 ) ) ( not ( = ?auto_333665 ?auto_333666 ) ) ( not ( = ?auto_333665 ?auto_333667 ) ) ( not ( = ?auto_333665 ?auto_333668 ) ) ( not ( = ?auto_333665 ?auto_333669 ) ) ( not ( = ?auto_333665 ?auto_333670 ) ) ( not ( = ?auto_333665 ?auto_333671 ) ) ( not ( = ?auto_333665 ?auto_333672 ) ) ( not ( = ?auto_333665 ?auto_333673 ) ) ( not ( = ?auto_333665 ?auto_333674 ) ) ( not ( = ?auto_333665 ?auto_333675 ) ) ( not ( = ?auto_333665 ?auto_333676 ) ) ( not ( = ?auto_333665 ?auto_333677 ) ) ( not ( = ?auto_333666 ?auto_333667 ) ) ( not ( = ?auto_333666 ?auto_333668 ) ) ( not ( = ?auto_333666 ?auto_333669 ) ) ( not ( = ?auto_333666 ?auto_333670 ) ) ( not ( = ?auto_333666 ?auto_333671 ) ) ( not ( = ?auto_333666 ?auto_333672 ) ) ( not ( = ?auto_333666 ?auto_333673 ) ) ( not ( = ?auto_333666 ?auto_333674 ) ) ( not ( = ?auto_333666 ?auto_333675 ) ) ( not ( = ?auto_333666 ?auto_333676 ) ) ( not ( = ?auto_333666 ?auto_333677 ) ) ( not ( = ?auto_333667 ?auto_333668 ) ) ( not ( = ?auto_333667 ?auto_333669 ) ) ( not ( = ?auto_333667 ?auto_333670 ) ) ( not ( = ?auto_333667 ?auto_333671 ) ) ( not ( = ?auto_333667 ?auto_333672 ) ) ( not ( = ?auto_333667 ?auto_333673 ) ) ( not ( = ?auto_333667 ?auto_333674 ) ) ( not ( = ?auto_333667 ?auto_333675 ) ) ( not ( = ?auto_333667 ?auto_333676 ) ) ( not ( = ?auto_333667 ?auto_333677 ) ) ( not ( = ?auto_333668 ?auto_333669 ) ) ( not ( = ?auto_333668 ?auto_333670 ) ) ( not ( = ?auto_333668 ?auto_333671 ) ) ( not ( = ?auto_333668 ?auto_333672 ) ) ( not ( = ?auto_333668 ?auto_333673 ) ) ( not ( = ?auto_333668 ?auto_333674 ) ) ( not ( = ?auto_333668 ?auto_333675 ) ) ( not ( = ?auto_333668 ?auto_333676 ) ) ( not ( = ?auto_333668 ?auto_333677 ) ) ( not ( = ?auto_333669 ?auto_333670 ) ) ( not ( = ?auto_333669 ?auto_333671 ) ) ( not ( = ?auto_333669 ?auto_333672 ) ) ( not ( = ?auto_333669 ?auto_333673 ) ) ( not ( = ?auto_333669 ?auto_333674 ) ) ( not ( = ?auto_333669 ?auto_333675 ) ) ( not ( = ?auto_333669 ?auto_333676 ) ) ( not ( = ?auto_333669 ?auto_333677 ) ) ( not ( = ?auto_333670 ?auto_333671 ) ) ( not ( = ?auto_333670 ?auto_333672 ) ) ( not ( = ?auto_333670 ?auto_333673 ) ) ( not ( = ?auto_333670 ?auto_333674 ) ) ( not ( = ?auto_333670 ?auto_333675 ) ) ( not ( = ?auto_333670 ?auto_333676 ) ) ( not ( = ?auto_333670 ?auto_333677 ) ) ( not ( = ?auto_333671 ?auto_333672 ) ) ( not ( = ?auto_333671 ?auto_333673 ) ) ( not ( = ?auto_333671 ?auto_333674 ) ) ( not ( = ?auto_333671 ?auto_333675 ) ) ( not ( = ?auto_333671 ?auto_333676 ) ) ( not ( = ?auto_333671 ?auto_333677 ) ) ( not ( = ?auto_333672 ?auto_333673 ) ) ( not ( = ?auto_333672 ?auto_333674 ) ) ( not ( = ?auto_333672 ?auto_333675 ) ) ( not ( = ?auto_333672 ?auto_333676 ) ) ( not ( = ?auto_333672 ?auto_333677 ) ) ( not ( = ?auto_333673 ?auto_333674 ) ) ( not ( = ?auto_333673 ?auto_333675 ) ) ( not ( = ?auto_333673 ?auto_333676 ) ) ( not ( = ?auto_333673 ?auto_333677 ) ) ( not ( = ?auto_333674 ?auto_333675 ) ) ( not ( = ?auto_333674 ?auto_333676 ) ) ( not ( = ?auto_333674 ?auto_333677 ) ) ( not ( = ?auto_333675 ?auto_333676 ) ) ( not ( = ?auto_333675 ?auto_333677 ) ) ( not ( = ?auto_333676 ?auto_333677 ) ) ( ON ?auto_333675 ?auto_333676 ) ( ON ?auto_333674 ?auto_333675 ) ( ON ?auto_333673 ?auto_333674 ) ( ON ?auto_333672 ?auto_333673 ) ( CLEAR ?auto_333670 ) ( ON ?auto_333671 ?auto_333672 ) ( CLEAR ?auto_333671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_333664 ?auto_333665 ?auto_333666 ?auto_333667 ?auto_333668 ?auto_333669 ?auto_333670 ?auto_333671 )
      ( MAKE-13PILE ?auto_333664 ?auto_333665 ?auto_333666 ?auto_333667 ?auto_333668 ?auto_333669 ?auto_333670 ?auto_333671 ?auto_333672 ?auto_333673 ?auto_333674 ?auto_333675 ?auto_333676 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333691 - BLOCK
      ?auto_333692 - BLOCK
      ?auto_333693 - BLOCK
      ?auto_333694 - BLOCK
      ?auto_333695 - BLOCK
      ?auto_333696 - BLOCK
      ?auto_333697 - BLOCK
      ?auto_333698 - BLOCK
      ?auto_333699 - BLOCK
      ?auto_333700 - BLOCK
      ?auto_333701 - BLOCK
      ?auto_333702 - BLOCK
      ?auto_333703 - BLOCK
    )
    :vars
    (
      ?auto_333704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333703 ?auto_333704 ) ( ON-TABLE ?auto_333691 ) ( ON ?auto_333692 ?auto_333691 ) ( ON ?auto_333693 ?auto_333692 ) ( ON ?auto_333694 ?auto_333693 ) ( ON ?auto_333695 ?auto_333694 ) ( ON ?auto_333696 ?auto_333695 ) ( ON ?auto_333697 ?auto_333696 ) ( not ( = ?auto_333691 ?auto_333692 ) ) ( not ( = ?auto_333691 ?auto_333693 ) ) ( not ( = ?auto_333691 ?auto_333694 ) ) ( not ( = ?auto_333691 ?auto_333695 ) ) ( not ( = ?auto_333691 ?auto_333696 ) ) ( not ( = ?auto_333691 ?auto_333697 ) ) ( not ( = ?auto_333691 ?auto_333698 ) ) ( not ( = ?auto_333691 ?auto_333699 ) ) ( not ( = ?auto_333691 ?auto_333700 ) ) ( not ( = ?auto_333691 ?auto_333701 ) ) ( not ( = ?auto_333691 ?auto_333702 ) ) ( not ( = ?auto_333691 ?auto_333703 ) ) ( not ( = ?auto_333691 ?auto_333704 ) ) ( not ( = ?auto_333692 ?auto_333693 ) ) ( not ( = ?auto_333692 ?auto_333694 ) ) ( not ( = ?auto_333692 ?auto_333695 ) ) ( not ( = ?auto_333692 ?auto_333696 ) ) ( not ( = ?auto_333692 ?auto_333697 ) ) ( not ( = ?auto_333692 ?auto_333698 ) ) ( not ( = ?auto_333692 ?auto_333699 ) ) ( not ( = ?auto_333692 ?auto_333700 ) ) ( not ( = ?auto_333692 ?auto_333701 ) ) ( not ( = ?auto_333692 ?auto_333702 ) ) ( not ( = ?auto_333692 ?auto_333703 ) ) ( not ( = ?auto_333692 ?auto_333704 ) ) ( not ( = ?auto_333693 ?auto_333694 ) ) ( not ( = ?auto_333693 ?auto_333695 ) ) ( not ( = ?auto_333693 ?auto_333696 ) ) ( not ( = ?auto_333693 ?auto_333697 ) ) ( not ( = ?auto_333693 ?auto_333698 ) ) ( not ( = ?auto_333693 ?auto_333699 ) ) ( not ( = ?auto_333693 ?auto_333700 ) ) ( not ( = ?auto_333693 ?auto_333701 ) ) ( not ( = ?auto_333693 ?auto_333702 ) ) ( not ( = ?auto_333693 ?auto_333703 ) ) ( not ( = ?auto_333693 ?auto_333704 ) ) ( not ( = ?auto_333694 ?auto_333695 ) ) ( not ( = ?auto_333694 ?auto_333696 ) ) ( not ( = ?auto_333694 ?auto_333697 ) ) ( not ( = ?auto_333694 ?auto_333698 ) ) ( not ( = ?auto_333694 ?auto_333699 ) ) ( not ( = ?auto_333694 ?auto_333700 ) ) ( not ( = ?auto_333694 ?auto_333701 ) ) ( not ( = ?auto_333694 ?auto_333702 ) ) ( not ( = ?auto_333694 ?auto_333703 ) ) ( not ( = ?auto_333694 ?auto_333704 ) ) ( not ( = ?auto_333695 ?auto_333696 ) ) ( not ( = ?auto_333695 ?auto_333697 ) ) ( not ( = ?auto_333695 ?auto_333698 ) ) ( not ( = ?auto_333695 ?auto_333699 ) ) ( not ( = ?auto_333695 ?auto_333700 ) ) ( not ( = ?auto_333695 ?auto_333701 ) ) ( not ( = ?auto_333695 ?auto_333702 ) ) ( not ( = ?auto_333695 ?auto_333703 ) ) ( not ( = ?auto_333695 ?auto_333704 ) ) ( not ( = ?auto_333696 ?auto_333697 ) ) ( not ( = ?auto_333696 ?auto_333698 ) ) ( not ( = ?auto_333696 ?auto_333699 ) ) ( not ( = ?auto_333696 ?auto_333700 ) ) ( not ( = ?auto_333696 ?auto_333701 ) ) ( not ( = ?auto_333696 ?auto_333702 ) ) ( not ( = ?auto_333696 ?auto_333703 ) ) ( not ( = ?auto_333696 ?auto_333704 ) ) ( not ( = ?auto_333697 ?auto_333698 ) ) ( not ( = ?auto_333697 ?auto_333699 ) ) ( not ( = ?auto_333697 ?auto_333700 ) ) ( not ( = ?auto_333697 ?auto_333701 ) ) ( not ( = ?auto_333697 ?auto_333702 ) ) ( not ( = ?auto_333697 ?auto_333703 ) ) ( not ( = ?auto_333697 ?auto_333704 ) ) ( not ( = ?auto_333698 ?auto_333699 ) ) ( not ( = ?auto_333698 ?auto_333700 ) ) ( not ( = ?auto_333698 ?auto_333701 ) ) ( not ( = ?auto_333698 ?auto_333702 ) ) ( not ( = ?auto_333698 ?auto_333703 ) ) ( not ( = ?auto_333698 ?auto_333704 ) ) ( not ( = ?auto_333699 ?auto_333700 ) ) ( not ( = ?auto_333699 ?auto_333701 ) ) ( not ( = ?auto_333699 ?auto_333702 ) ) ( not ( = ?auto_333699 ?auto_333703 ) ) ( not ( = ?auto_333699 ?auto_333704 ) ) ( not ( = ?auto_333700 ?auto_333701 ) ) ( not ( = ?auto_333700 ?auto_333702 ) ) ( not ( = ?auto_333700 ?auto_333703 ) ) ( not ( = ?auto_333700 ?auto_333704 ) ) ( not ( = ?auto_333701 ?auto_333702 ) ) ( not ( = ?auto_333701 ?auto_333703 ) ) ( not ( = ?auto_333701 ?auto_333704 ) ) ( not ( = ?auto_333702 ?auto_333703 ) ) ( not ( = ?auto_333702 ?auto_333704 ) ) ( not ( = ?auto_333703 ?auto_333704 ) ) ( ON ?auto_333702 ?auto_333703 ) ( ON ?auto_333701 ?auto_333702 ) ( ON ?auto_333700 ?auto_333701 ) ( ON ?auto_333699 ?auto_333700 ) ( CLEAR ?auto_333697 ) ( ON ?auto_333698 ?auto_333699 ) ( CLEAR ?auto_333698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_333691 ?auto_333692 ?auto_333693 ?auto_333694 ?auto_333695 ?auto_333696 ?auto_333697 ?auto_333698 )
      ( MAKE-13PILE ?auto_333691 ?auto_333692 ?auto_333693 ?auto_333694 ?auto_333695 ?auto_333696 ?auto_333697 ?auto_333698 ?auto_333699 ?auto_333700 ?auto_333701 ?auto_333702 ?auto_333703 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333718 - BLOCK
      ?auto_333719 - BLOCK
      ?auto_333720 - BLOCK
      ?auto_333721 - BLOCK
      ?auto_333722 - BLOCK
      ?auto_333723 - BLOCK
      ?auto_333724 - BLOCK
      ?auto_333725 - BLOCK
      ?auto_333726 - BLOCK
      ?auto_333727 - BLOCK
      ?auto_333728 - BLOCK
      ?auto_333729 - BLOCK
      ?auto_333730 - BLOCK
    )
    :vars
    (
      ?auto_333731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333730 ?auto_333731 ) ( ON-TABLE ?auto_333718 ) ( ON ?auto_333719 ?auto_333718 ) ( ON ?auto_333720 ?auto_333719 ) ( ON ?auto_333721 ?auto_333720 ) ( ON ?auto_333722 ?auto_333721 ) ( ON ?auto_333723 ?auto_333722 ) ( not ( = ?auto_333718 ?auto_333719 ) ) ( not ( = ?auto_333718 ?auto_333720 ) ) ( not ( = ?auto_333718 ?auto_333721 ) ) ( not ( = ?auto_333718 ?auto_333722 ) ) ( not ( = ?auto_333718 ?auto_333723 ) ) ( not ( = ?auto_333718 ?auto_333724 ) ) ( not ( = ?auto_333718 ?auto_333725 ) ) ( not ( = ?auto_333718 ?auto_333726 ) ) ( not ( = ?auto_333718 ?auto_333727 ) ) ( not ( = ?auto_333718 ?auto_333728 ) ) ( not ( = ?auto_333718 ?auto_333729 ) ) ( not ( = ?auto_333718 ?auto_333730 ) ) ( not ( = ?auto_333718 ?auto_333731 ) ) ( not ( = ?auto_333719 ?auto_333720 ) ) ( not ( = ?auto_333719 ?auto_333721 ) ) ( not ( = ?auto_333719 ?auto_333722 ) ) ( not ( = ?auto_333719 ?auto_333723 ) ) ( not ( = ?auto_333719 ?auto_333724 ) ) ( not ( = ?auto_333719 ?auto_333725 ) ) ( not ( = ?auto_333719 ?auto_333726 ) ) ( not ( = ?auto_333719 ?auto_333727 ) ) ( not ( = ?auto_333719 ?auto_333728 ) ) ( not ( = ?auto_333719 ?auto_333729 ) ) ( not ( = ?auto_333719 ?auto_333730 ) ) ( not ( = ?auto_333719 ?auto_333731 ) ) ( not ( = ?auto_333720 ?auto_333721 ) ) ( not ( = ?auto_333720 ?auto_333722 ) ) ( not ( = ?auto_333720 ?auto_333723 ) ) ( not ( = ?auto_333720 ?auto_333724 ) ) ( not ( = ?auto_333720 ?auto_333725 ) ) ( not ( = ?auto_333720 ?auto_333726 ) ) ( not ( = ?auto_333720 ?auto_333727 ) ) ( not ( = ?auto_333720 ?auto_333728 ) ) ( not ( = ?auto_333720 ?auto_333729 ) ) ( not ( = ?auto_333720 ?auto_333730 ) ) ( not ( = ?auto_333720 ?auto_333731 ) ) ( not ( = ?auto_333721 ?auto_333722 ) ) ( not ( = ?auto_333721 ?auto_333723 ) ) ( not ( = ?auto_333721 ?auto_333724 ) ) ( not ( = ?auto_333721 ?auto_333725 ) ) ( not ( = ?auto_333721 ?auto_333726 ) ) ( not ( = ?auto_333721 ?auto_333727 ) ) ( not ( = ?auto_333721 ?auto_333728 ) ) ( not ( = ?auto_333721 ?auto_333729 ) ) ( not ( = ?auto_333721 ?auto_333730 ) ) ( not ( = ?auto_333721 ?auto_333731 ) ) ( not ( = ?auto_333722 ?auto_333723 ) ) ( not ( = ?auto_333722 ?auto_333724 ) ) ( not ( = ?auto_333722 ?auto_333725 ) ) ( not ( = ?auto_333722 ?auto_333726 ) ) ( not ( = ?auto_333722 ?auto_333727 ) ) ( not ( = ?auto_333722 ?auto_333728 ) ) ( not ( = ?auto_333722 ?auto_333729 ) ) ( not ( = ?auto_333722 ?auto_333730 ) ) ( not ( = ?auto_333722 ?auto_333731 ) ) ( not ( = ?auto_333723 ?auto_333724 ) ) ( not ( = ?auto_333723 ?auto_333725 ) ) ( not ( = ?auto_333723 ?auto_333726 ) ) ( not ( = ?auto_333723 ?auto_333727 ) ) ( not ( = ?auto_333723 ?auto_333728 ) ) ( not ( = ?auto_333723 ?auto_333729 ) ) ( not ( = ?auto_333723 ?auto_333730 ) ) ( not ( = ?auto_333723 ?auto_333731 ) ) ( not ( = ?auto_333724 ?auto_333725 ) ) ( not ( = ?auto_333724 ?auto_333726 ) ) ( not ( = ?auto_333724 ?auto_333727 ) ) ( not ( = ?auto_333724 ?auto_333728 ) ) ( not ( = ?auto_333724 ?auto_333729 ) ) ( not ( = ?auto_333724 ?auto_333730 ) ) ( not ( = ?auto_333724 ?auto_333731 ) ) ( not ( = ?auto_333725 ?auto_333726 ) ) ( not ( = ?auto_333725 ?auto_333727 ) ) ( not ( = ?auto_333725 ?auto_333728 ) ) ( not ( = ?auto_333725 ?auto_333729 ) ) ( not ( = ?auto_333725 ?auto_333730 ) ) ( not ( = ?auto_333725 ?auto_333731 ) ) ( not ( = ?auto_333726 ?auto_333727 ) ) ( not ( = ?auto_333726 ?auto_333728 ) ) ( not ( = ?auto_333726 ?auto_333729 ) ) ( not ( = ?auto_333726 ?auto_333730 ) ) ( not ( = ?auto_333726 ?auto_333731 ) ) ( not ( = ?auto_333727 ?auto_333728 ) ) ( not ( = ?auto_333727 ?auto_333729 ) ) ( not ( = ?auto_333727 ?auto_333730 ) ) ( not ( = ?auto_333727 ?auto_333731 ) ) ( not ( = ?auto_333728 ?auto_333729 ) ) ( not ( = ?auto_333728 ?auto_333730 ) ) ( not ( = ?auto_333728 ?auto_333731 ) ) ( not ( = ?auto_333729 ?auto_333730 ) ) ( not ( = ?auto_333729 ?auto_333731 ) ) ( not ( = ?auto_333730 ?auto_333731 ) ) ( ON ?auto_333729 ?auto_333730 ) ( ON ?auto_333728 ?auto_333729 ) ( ON ?auto_333727 ?auto_333728 ) ( ON ?auto_333726 ?auto_333727 ) ( ON ?auto_333725 ?auto_333726 ) ( CLEAR ?auto_333723 ) ( ON ?auto_333724 ?auto_333725 ) ( CLEAR ?auto_333724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_333718 ?auto_333719 ?auto_333720 ?auto_333721 ?auto_333722 ?auto_333723 ?auto_333724 )
      ( MAKE-13PILE ?auto_333718 ?auto_333719 ?auto_333720 ?auto_333721 ?auto_333722 ?auto_333723 ?auto_333724 ?auto_333725 ?auto_333726 ?auto_333727 ?auto_333728 ?auto_333729 ?auto_333730 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333745 - BLOCK
      ?auto_333746 - BLOCK
      ?auto_333747 - BLOCK
      ?auto_333748 - BLOCK
      ?auto_333749 - BLOCK
      ?auto_333750 - BLOCK
      ?auto_333751 - BLOCK
      ?auto_333752 - BLOCK
      ?auto_333753 - BLOCK
      ?auto_333754 - BLOCK
      ?auto_333755 - BLOCK
      ?auto_333756 - BLOCK
      ?auto_333757 - BLOCK
    )
    :vars
    (
      ?auto_333758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333757 ?auto_333758 ) ( ON-TABLE ?auto_333745 ) ( ON ?auto_333746 ?auto_333745 ) ( ON ?auto_333747 ?auto_333746 ) ( ON ?auto_333748 ?auto_333747 ) ( ON ?auto_333749 ?auto_333748 ) ( ON ?auto_333750 ?auto_333749 ) ( not ( = ?auto_333745 ?auto_333746 ) ) ( not ( = ?auto_333745 ?auto_333747 ) ) ( not ( = ?auto_333745 ?auto_333748 ) ) ( not ( = ?auto_333745 ?auto_333749 ) ) ( not ( = ?auto_333745 ?auto_333750 ) ) ( not ( = ?auto_333745 ?auto_333751 ) ) ( not ( = ?auto_333745 ?auto_333752 ) ) ( not ( = ?auto_333745 ?auto_333753 ) ) ( not ( = ?auto_333745 ?auto_333754 ) ) ( not ( = ?auto_333745 ?auto_333755 ) ) ( not ( = ?auto_333745 ?auto_333756 ) ) ( not ( = ?auto_333745 ?auto_333757 ) ) ( not ( = ?auto_333745 ?auto_333758 ) ) ( not ( = ?auto_333746 ?auto_333747 ) ) ( not ( = ?auto_333746 ?auto_333748 ) ) ( not ( = ?auto_333746 ?auto_333749 ) ) ( not ( = ?auto_333746 ?auto_333750 ) ) ( not ( = ?auto_333746 ?auto_333751 ) ) ( not ( = ?auto_333746 ?auto_333752 ) ) ( not ( = ?auto_333746 ?auto_333753 ) ) ( not ( = ?auto_333746 ?auto_333754 ) ) ( not ( = ?auto_333746 ?auto_333755 ) ) ( not ( = ?auto_333746 ?auto_333756 ) ) ( not ( = ?auto_333746 ?auto_333757 ) ) ( not ( = ?auto_333746 ?auto_333758 ) ) ( not ( = ?auto_333747 ?auto_333748 ) ) ( not ( = ?auto_333747 ?auto_333749 ) ) ( not ( = ?auto_333747 ?auto_333750 ) ) ( not ( = ?auto_333747 ?auto_333751 ) ) ( not ( = ?auto_333747 ?auto_333752 ) ) ( not ( = ?auto_333747 ?auto_333753 ) ) ( not ( = ?auto_333747 ?auto_333754 ) ) ( not ( = ?auto_333747 ?auto_333755 ) ) ( not ( = ?auto_333747 ?auto_333756 ) ) ( not ( = ?auto_333747 ?auto_333757 ) ) ( not ( = ?auto_333747 ?auto_333758 ) ) ( not ( = ?auto_333748 ?auto_333749 ) ) ( not ( = ?auto_333748 ?auto_333750 ) ) ( not ( = ?auto_333748 ?auto_333751 ) ) ( not ( = ?auto_333748 ?auto_333752 ) ) ( not ( = ?auto_333748 ?auto_333753 ) ) ( not ( = ?auto_333748 ?auto_333754 ) ) ( not ( = ?auto_333748 ?auto_333755 ) ) ( not ( = ?auto_333748 ?auto_333756 ) ) ( not ( = ?auto_333748 ?auto_333757 ) ) ( not ( = ?auto_333748 ?auto_333758 ) ) ( not ( = ?auto_333749 ?auto_333750 ) ) ( not ( = ?auto_333749 ?auto_333751 ) ) ( not ( = ?auto_333749 ?auto_333752 ) ) ( not ( = ?auto_333749 ?auto_333753 ) ) ( not ( = ?auto_333749 ?auto_333754 ) ) ( not ( = ?auto_333749 ?auto_333755 ) ) ( not ( = ?auto_333749 ?auto_333756 ) ) ( not ( = ?auto_333749 ?auto_333757 ) ) ( not ( = ?auto_333749 ?auto_333758 ) ) ( not ( = ?auto_333750 ?auto_333751 ) ) ( not ( = ?auto_333750 ?auto_333752 ) ) ( not ( = ?auto_333750 ?auto_333753 ) ) ( not ( = ?auto_333750 ?auto_333754 ) ) ( not ( = ?auto_333750 ?auto_333755 ) ) ( not ( = ?auto_333750 ?auto_333756 ) ) ( not ( = ?auto_333750 ?auto_333757 ) ) ( not ( = ?auto_333750 ?auto_333758 ) ) ( not ( = ?auto_333751 ?auto_333752 ) ) ( not ( = ?auto_333751 ?auto_333753 ) ) ( not ( = ?auto_333751 ?auto_333754 ) ) ( not ( = ?auto_333751 ?auto_333755 ) ) ( not ( = ?auto_333751 ?auto_333756 ) ) ( not ( = ?auto_333751 ?auto_333757 ) ) ( not ( = ?auto_333751 ?auto_333758 ) ) ( not ( = ?auto_333752 ?auto_333753 ) ) ( not ( = ?auto_333752 ?auto_333754 ) ) ( not ( = ?auto_333752 ?auto_333755 ) ) ( not ( = ?auto_333752 ?auto_333756 ) ) ( not ( = ?auto_333752 ?auto_333757 ) ) ( not ( = ?auto_333752 ?auto_333758 ) ) ( not ( = ?auto_333753 ?auto_333754 ) ) ( not ( = ?auto_333753 ?auto_333755 ) ) ( not ( = ?auto_333753 ?auto_333756 ) ) ( not ( = ?auto_333753 ?auto_333757 ) ) ( not ( = ?auto_333753 ?auto_333758 ) ) ( not ( = ?auto_333754 ?auto_333755 ) ) ( not ( = ?auto_333754 ?auto_333756 ) ) ( not ( = ?auto_333754 ?auto_333757 ) ) ( not ( = ?auto_333754 ?auto_333758 ) ) ( not ( = ?auto_333755 ?auto_333756 ) ) ( not ( = ?auto_333755 ?auto_333757 ) ) ( not ( = ?auto_333755 ?auto_333758 ) ) ( not ( = ?auto_333756 ?auto_333757 ) ) ( not ( = ?auto_333756 ?auto_333758 ) ) ( not ( = ?auto_333757 ?auto_333758 ) ) ( ON ?auto_333756 ?auto_333757 ) ( ON ?auto_333755 ?auto_333756 ) ( ON ?auto_333754 ?auto_333755 ) ( ON ?auto_333753 ?auto_333754 ) ( ON ?auto_333752 ?auto_333753 ) ( CLEAR ?auto_333750 ) ( ON ?auto_333751 ?auto_333752 ) ( CLEAR ?auto_333751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_333745 ?auto_333746 ?auto_333747 ?auto_333748 ?auto_333749 ?auto_333750 ?auto_333751 )
      ( MAKE-13PILE ?auto_333745 ?auto_333746 ?auto_333747 ?auto_333748 ?auto_333749 ?auto_333750 ?auto_333751 ?auto_333752 ?auto_333753 ?auto_333754 ?auto_333755 ?auto_333756 ?auto_333757 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333772 - BLOCK
      ?auto_333773 - BLOCK
      ?auto_333774 - BLOCK
      ?auto_333775 - BLOCK
      ?auto_333776 - BLOCK
      ?auto_333777 - BLOCK
      ?auto_333778 - BLOCK
      ?auto_333779 - BLOCK
      ?auto_333780 - BLOCK
      ?auto_333781 - BLOCK
      ?auto_333782 - BLOCK
      ?auto_333783 - BLOCK
      ?auto_333784 - BLOCK
    )
    :vars
    (
      ?auto_333785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333784 ?auto_333785 ) ( ON-TABLE ?auto_333772 ) ( ON ?auto_333773 ?auto_333772 ) ( ON ?auto_333774 ?auto_333773 ) ( ON ?auto_333775 ?auto_333774 ) ( ON ?auto_333776 ?auto_333775 ) ( not ( = ?auto_333772 ?auto_333773 ) ) ( not ( = ?auto_333772 ?auto_333774 ) ) ( not ( = ?auto_333772 ?auto_333775 ) ) ( not ( = ?auto_333772 ?auto_333776 ) ) ( not ( = ?auto_333772 ?auto_333777 ) ) ( not ( = ?auto_333772 ?auto_333778 ) ) ( not ( = ?auto_333772 ?auto_333779 ) ) ( not ( = ?auto_333772 ?auto_333780 ) ) ( not ( = ?auto_333772 ?auto_333781 ) ) ( not ( = ?auto_333772 ?auto_333782 ) ) ( not ( = ?auto_333772 ?auto_333783 ) ) ( not ( = ?auto_333772 ?auto_333784 ) ) ( not ( = ?auto_333772 ?auto_333785 ) ) ( not ( = ?auto_333773 ?auto_333774 ) ) ( not ( = ?auto_333773 ?auto_333775 ) ) ( not ( = ?auto_333773 ?auto_333776 ) ) ( not ( = ?auto_333773 ?auto_333777 ) ) ( not ( = ?auto_333773 ?auto_333778 ) ) ( not ( = ?auto_333773 ?auto_333779 ) ) ( not ( = ?auto_333773 ?auto_333780 ) ) ( not ( = ?auto_333773 ?auto_333781 ) ) ( not ( = ?auto_333773 ?auto_333782 ) ) ( not ( = ?auto_333773 ?auto_333783 ) ) ( not ( = ?auto_333773 ?auto_333784 ) ) ( not ( = ?auto_333773 ?auto_333785 ) ) ( not ( = ?auto_333774 ?auto_333775 ) ) ( not ( = ?auto_333774 ?auto_333776 ) ) ( not ( = ?auto_333774 ?auto_333777 ) ) ( not ( = ?auto_333774 ?auto_333778 ) ) ( not ( = ?auto_333774 ?auto_333779 ) ) ( not ( = ?auto_333774 ?auto_333780 ) ) ( not ( = ?auto_333774 ?auto_333781 ) ) ( not ( = ?auto_333774 ?auto_333782 ) ) ( not ( = ?auto_333774 ?auto_333783 ) ) ( not ( = ?auto_333774 ?auto_333784 ) ) ( not ( = ?auto_333774 ?auto_333785 ) ) ( not ( = ?auto_333775 ?auto_333776 ) ) ( not ( = ?auto_333775 ?auto_333777 ) ) ( not ( = ?auto_333775 ?auto_333778 ) ) ( not ( = ?auto_333775 ?auto_333779 ) ) ( not ( = ?auto_333775 ?auto_333780 ) ) ( not ( = ?auto_333775 ?auto_333781 ) ) ( not ( = ?auto_333775 ?auto_333782 ) ) ( not ( = ?auto_333775 ?auto_333783 ) ) ( not ( = ?auto_333775 ?auto_333784 ) ) ( not ( = ?auto_333775 ?auto_333785 ) ) ( not ( = ?auto_333776 ?auto_333777 ) ) ( not ( = ?auto_333776 ?auto_333778 ) ) ( not ( = ?auto_333776 ?auto_333779 ) ) ( not ( = ?auto_333776 ?auto_333780 ) ) ( not ( = ?auto_333776 ?auto_333781 ) ) ( not ( = ?auto_333776 ?auto_333782 ) ) ( not ( = ?auto_333776 ?auto_333783 ) ) ( not ( = ?auto_333776 ?auto_333784 ) ) ( not ( = ?auto_333776 ?auto_333785 ) ) ( not ( = ?auto_333777 ?auto_333778 ) ) ( not ( = ?auto_333777 ?auto_333779 ) ) ( not ( = ?auto_333777 ?auto_333780 ) ) ( not ( = ?auto_333777 ?auto_333781 ) ) ( not ( = ?auto_333777 ?auto_333782 ) ) ( not ( = ?auto_333777 ?auto_333783 ) ) ( not ( = ?auto_333777 ?auto_333784 ) ) ( not ( = ?auto_333777 ?auto_333785 ) ) ( not ( = ?auto_333778 ?auto_333779 ) ) ( not ( = ?auto_333778 ?auto_333780 ) ) ( not ( = ?auto_333778 ?auto_333781 ) ) ( not ( = ?auto_333778 ?auto_333782 ) ) ( not ( = ?auto_333778 ?auto_333783 ) ) ( not ( = ?auto_333778 ?auto_333784 ) ) ( not ( = ?auto_333778 ?auto_333785 ) ) ( not ( = ?auto_333779 ?auto_333780 ) ) ( not ( = ?auto_333779 ?auto_333781 ) ) ( not ( = ?auto_333779 ?auto_333782 ) ) ( not ( = ?auto_333779 ?auto_333783 ) ) ( not ( = ?auto_333779 ?auto_333784 ) ) ( not ( = ?auto_333779 ?auto_333785 ) ) ( not ( = ?auto_333780 ?auto_333781 ) ) ( not ( = ?auto_333780 ?auto_333782 ) ) ( not ( = ?auto_333780 ?auto_333783 ) ) ( not ( = ?auto_333780 ?auto_333784 ) ) ( not ( = ?auto_333780 ?auto_333785 ) ) ( not ( = ?auto_333781 ?auto_333782 ) ) ( not ( = ?auto_333781 ?auto_333783 ) ) ( not ( = ?auto_333781 ?auto_333784 ) ) ( not ( = ?auto_333781 ?auto_333785 ) ) ( not ( = ?auto_333782 ?auto_333783 ) ) ( not ( = ?auto_333782 ?auto_333784 ) ) ( not ( = ?auto_333782 ?auto_333785 ) ) ( not ( = ?auto_333783 ?auto_333784 ) ) ( not ( = ?auto_333783 ?auto_333785 ) ) ( not ( = ?auto_333784 ?auto_333785 ) ) ( ON ?auto_333783 ?auto_333784 ) ( ON ?auto_333782 ?auto_333783 ) ( ON ?auto_333781 ?auto_333782 ) ( ON ?auto_333780 ?auto_333781 ) ( ON ?auto_333779 ?auto_333780 ) ( ON ?auto_333778 ?auto_333779 ) ( CLEAR ?auto_333776 ) ( ON ?auto_333777 ?auto_333778 ) ( CLEAR ?auto_333777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_333772 ?auto_333773 ?auto_333774 ?auto_333775 ?auto_333776 ?auto_333777 )
      ( MAKE-13PILE ?auto_333772 ?auto_333773 ?auto_333774 ?auto_333775 ?auto_333776 ?auto_333777 ?auto_333778 ?auto_333779 ?auto_333780 ?auto_333781 ?auto_333782 ?auto_333783 ?auto_333784 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333799 - BLOCK
      ?auto_333800 - BLOCK
      ?auto_333801 - BLOCK
      ?auto_333802 - BLOCK
      ?auto_333803 - BLOCK
      ?auto_333804 - BLOCK
      ?auto_333805 - BLOCK
      ?auto_333806 - BLOCK
      ?auto_333807 - BLOCK
      ?auto_333808 - BLOCK
      ?auto_333809 - BLOCK
      ?auto_333810 - BLOCK
      ?auto_333811 - BLOCK
    )
    :vars
    (
      ?auto_333812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333811 ?auto_333812 ) ( ON-TABLE ?auto_333799 ) ( ON ?auto_333800 ?auto_333799 ) ( ON ?auto_333801 ?auto_333800 ) ( ON ?auto_333802 ?auto_333801 ) ( ON ?auto_333803 ?auto_333802 ) ( not ( = ?auto_333799 ?auto_333800 ) ) ( not ( = ?auto_333799 ?auto_333801 ) ) ( not ( = ?auto_333799 ?auto_333802 ) ) ( not ( = ?auto_333799 ?auto_333803 ) ) ( not ( = ?auto_333799 ?auto_333804 ) ) ( not ( = ?auto_333799 ?auto_333805 ) ) ( not ( = ?auto_333799 ?auto_333806 ) ) ( not ( = ?auto_333799 ?auto_333807 ) ) ( not ( = ?auto_333799 ?auto_333808 ) ) ( not ( = ?auto_333799 ?auto_333809 ) ) ( not ( = ?auto_333799 ?auto_333810 ) ) ( not ( = ?auto_333799 ?auto_333811 ) ) ( not ( = ?auto_333799 ?auto_333812 ) ) ( not ( = ?auto_333800 ?auto_333801 ) ) ( not ( = ?auto_333800 ?auto_333802 ) ) ( not ( = ?auto_333800 ?auto_333803 ) ) ( not ( = ?auto_333800 ?auto_333804 ) ) ( not ( = ?auto_333800 ?auto_333805 ) ) ( not ( = ?auto_333800 ?auto_333806 ) ) ( not ( = ?auto_333800 ?auto_333807 ) ) ( not ( = ?auto_333800 ?auto_333808 ) ) ( not ( = ?auto_333800 ?auto_333809 ) ) ( not ( = ?auto_333800 ?auto_333810 ) ) ( not ( = ?auto_333800 ?auto_333811 ) ) ( not ( = ?auto_333800 ?auto_333812 ) ) ( not ( = ?auto_333801 ?auto_333802 ) ) ( not ( = ?auto_333801 ?auto_333803 ) ) ( not ( = ?auto_333801 ?auto_333804 ) ) ( not ( = ?auto_333801 ?auto_333805 ) ) ( not ( = ?auto_333801 ?auto_333806 ) ) ( not ( = ?auto_333801 ?auto_333807 ) ) ( not ( = ?auto_333801 ?auto_333808 ) ) ( not ( = ?auto_333801 ?auto_333809 ) ) ( not ( = ?auto_333801 ?auto_333810 ) ) ( not ( = ?auto_333801 ?auto_333811 ) ) ( not ( = ?auto_333801 ?auto_333812 ) ) ( not ( = ?auto_333802 ?auto_333803 ) ) ( not ( = ?auto_333802 ?auto_333804 ) ) ( not ( = ?auto_333802 ?auto_333805 ) ) ( not ( = ?auto_333802 ?auto_333806 ) ) ( not ( = ?auto_333802 ?auto_333807 ) ) ( not ( = ?auto_333802 ?auto_333808 ) ) ( not ( = ?auto_333802 ?auto_333809 ) ) ( not ( = ?auto_333802 ?auto_333810 ) ) ( not ( = ?auto_333802 ?auto_333811 ) ) ( not ( = ?auto_333802 ?auto_333812 ) ) ( not ( = ?auto_333803 ?auto_333804 ) ) ( not ( = ?auto_333803 ?auto_333805 ) ) ( not ( = ?auto_333803 ?auto_333806 ) ) ( not ( = ?auto_333803 ?auto_333807 ) ) ( not ( = ?auto_333803 ?auto_333808 ) ) ( not ( = ?auto_333803 ?auto_333809 ) ) ( not ( = ?auto_333803 ?auto_333810 ) ) ( not ( = ?auto_333803 ?auto_333811 ) ) ( not ( = ?auto_333803 ?auto_333812 ) ) ( not ( = ?auto_333804 ?auto_333805 ) ) ( not ( = ?auto_333804 ?auto_333806 ) ) ( not ( = ?auto_333804 ?auto_333807 ) ) ( not ( = ?auto_333804 ?auto_333808 ) ) ( not ( = ?auto_333804 ?auto_333809 ) ) ( not ( = ?auto_333804 ?auto_333810 ) ) ( not ( = ?auto_333804 ?auto_333811 ) ) ( not ( = ?auto_333804 ?auto_333812 ) ) ( not ( = ?auto_333805 ?auto_333806 ) ) ( not ( = ?auto_333805 ?auto_333807 ) ) ( not ( = ?auto_333805 ?auto_333808 ) ) ( not ( = ?auto_333805 ?auto_333809 ) ) ( not ( = ?auto_333805 ?auto_333810 ) ) ( not ( = ?auto_333805 ?auto_333811 ) ) ( not ( = ?auto_333805 ?auto_333812 ) ) ( not ( = ?auto_333806 ?auto_333807 ) ) ( not ( = ?auto_333806 ?auto_333808 ) ) ( not ( = ?auto_333806 ?auto_333809 ) ) ( not ( = ?auto_333806 ?auto_333810 ) ) ( not ( = ?auto_333806 ?auto_333811 ) ) ( not ( = ?auto_333806 ?auto_333812 ) ) ( not ( = ?auto_333807 ?auto_333808 ) ) ( not ( = ?auto_333807 ?auto_333809 ) ) ( not ( = ?auto_333807 ?auto_333810 ) ) ( not ( = ?auto_333807 ?auto_333811 ) ) ( not ( = ?auto_333807 ?auto_333812 ) ) ( not ( = ?auto_333808 ?auto_333809 ) ) ( not ( = ?auto_333808 ?auto_333810 ) ) ( not ( = ?auto_333808 ?auto_333811 ) ) ( not ( = ?auto_333808 ?auto_333812 ) ) ( not ( = ?auto_333809 ?auto_333810 ) ) ( not ( = ?auto_333809 ?auto_333811 ) ) ( not ( = ?auto_333809 ?auto_333812 ) ) ( not ( = ?auto_333810 ?auto_333811 ) ) ( not ( = ?auto_333810 ?auto_333812 ) ) ( not ( = ?auto_333811 ?auto_333812 ) ) ( ON ?auto_333810 ?auto_333811 ) ( ON ?auto_333809 ?auto_333810 ) ( ON ?auto_333808 ?auto_333809 ) ( ON ?auto_333807 ?auto_333808 ) ( ON ?auto_333806 ?auto_333807 ) ( ON ?auto_333805 ?auto_333806 ) ( CLEAR ?auto_333803 ) ( ON ?auto_333804 ?auto_333805 ) ( CLEAR ?auto_333804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_333799 ?auto_333800 ?auto_333801 ?auto_333802 ?auto_333803 ?auto_333804 )
      ( MAKE-13PILE ?auto_333799 ?auto_333800 ?auto_333801 ?auto_333802 ?auto_333803 ?auto_333804 ?auto_333805 ?auto_333806 ?auto_333807 ?auto_333808 ?auto_333809 ?auto_333810 ?auto_333811 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333826 - BLOCK
      ?auto_333827 - BLOCK
      ?auto_333828 - BLOCK
      ?auto_333829 - BLOCK
      ?auto_333830 - BLOCK
      ?auto_333831 - BLOCK
      ?auto_333832 - BLOCK
      ?auto_333833 - BLOCK
      ?auto_333834 - BLOCK
      ?auto_333835 - BLOCK
      ?auto_333836 - BLOCK
      ?auto_333837 - BLOCK
      ?auto_333838 - BLOCK
    )
    :vars
    (
      ?auto_333839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333838 ?auto_333839 ) ( ON-TABLE ?auto_333826 ) ( ON ?auto_333827 ?auto_333826 ) ( ON ?auto_333828 ?auto_333827 ) ( ON ?auto_333829 ?auto_333828 ) ( not ( = ?auto_333826 ?auto_333827 ) ) ( not ( = ?auto_333826 ?auto_333828 ) ) ( not ( = ?auto_333826 ?auto_333829 ) ) ( not ( = ?auto_333826 ?auto_333830 ) ) ( not ( = ?auto_333826 ?auto_333831 ) ) ( not ( = ?auto_333826 ?auto_333832 ) ) ( not ( = ?auto_333826 ?auto_333833 ) ) ( not ( = ?auto_333826 ?auto_333834 ) ) ( not ( = ?auto_333826 ?auto_333835 ) ) ( not ( = ?auto_333826 ?auto_333836 ) ) ( not ( = ?auto_333826 ?auto_333837 ) ) ( not ( = ?auto_333826 ?auto_333838 ) ) ( not ( = ?auto_333826 ?auto_333839 ) ) ( not ( = ?auto_333827 ?auto_333828 ) ) ( not ( = ?auto_333827 ?auto_333829 ) ) ( not ( = ?auto_333827 ?auto_333830 ) ) ( not ( = ?auto_333827 ?auto_333831 ) ) ( not ( = ?auto_333827 ?auto_333832 ) ) ( not ( = ?auto_333827 ?auto_333833 ) ) ( not ( = ?auto_333827 ?auto_333834 ) ) ( not ( = ?auto_333827 ?auto_333835 ) ) ( not ( = ?auto_333827 ?auto_333836 ) ) ( not ( = ?auto_333827 ?auto_333837 ) ) ( not ( = ?auto_333827 ?auto_333838 ) ) ( not ( = ?auto_333827 ?auto_333839 ) ) ( not ( = ?auto_333828 ?auto_333829 ) ) ( not ( = ?auto_333828 ?auto_333830 ) ) ( not ( = ?auto_333828 ?auto_333831 ) ) ( not ( = ?auto_333828 ?auto_333832 ) ) ( not ( = ?auto_333828 ?auto_333833 ) ) ( not ( = ?auto_333828 ?auto_333834 ) ) ( not ( = ?auto_333828 ?auto_333835 ) ) ( not ( = ?auto_333828 ?auto_333836 ) ) ( not ( = ?auto_333828 ?auto_333837 ) ) ( not ( = ?auto_333828 ?auto_333838 ) ) ( not ( = ?auto_333828 ?auto_333839 ) ) ( not ( = ?auto_333829 ?auto_333830 ) ) ( not ( = ?auto_333829 ?auto_333831 ) ) ( not ( = ?auto_333829 ?auto_333832 ) ) ( not ( = ?auto_333829 ?auto_333833 ) ) ( not ( = ?auto_333829 ?auto_333834 ) ) ( not ( = ?auto_333829 ?auto_333835 ) ) ( not ( = ?auto_333829 ?auto_333836 ) ) ( not ( = ?auto_333829 ?auto_333837 ) ) ( not ( = ?auto_333829 ?auto_333838 ) ) ( not ( = ?auto_333829 ?auto_333839 ) ) ( not ( = ?auto_333830 ?auto_333831 ) ) ( not ( = ?auto_333830 ?auto_333832 ) ) ( not ( = ?auto_333830 ?auto_333833 ) ) ( not ( = ?auto_333830 ?auto_333834 ) ) ( not ( = ?auto_333830 ?auto_333835 ) ) ( not ( = ?auto_333830 ?auto_333836 ) ) ( not ( = ?auto_333830 ?auto_333837 ) ) ( not ( = ?auto_333830 ?auto_333838 ) ) ( not ( = ?auto_333830 ?auto_333839 ) ) ( not ( = ?auto_333831 ?auto_333832 ) ) ( not ( = ?auto_333831 ?auto_333833 ) ) ( not ( = ?auto_333831 ?auto_333834 ) ) ( not ( = ?auto_333831 ?auto_333835 ) ) ( not ( = ?auto_333831 ?auto_333836 ) ) ( not ( = ?auto_333831 ?auto_333837 ) ) ( not ( = ?auto_333831 ?auto_333838 ) ) ( not ( = ?auto_333831 ?auto_333839 ) ) ( not ( = ?auto_333832 ?auto_333833 ) ) ( not ( = ?auto_333832 ?auto_333834 ) ) ( not ( = ?auto_333832 ?auto_333835 ) ) ( not ( = ?auto_333832 ?auto_333836 ) ) ( not ( = ?auto_333832 ?auto_333837 ) ) ( not ( = ?auto_333832 ?auto_333838 ) ) ( not ( = ?auto_333832 ?auto_333839 ) ) ( not ( = ?auto_333833 ?auto_333834 ) ) ( not ( = ?auto_333833 ?auto_333835 ) ) ( not ( = ?auto_333833 ?auto_333836 ) ) ( not ( = ?auto_333833 ?auto_333837 ) ) ( not ( = ?auto_333833 ?auto_333838 ) ) ( not ( = ?auto_333833 ?auto_333839 ) ) ( not ( = ?auto_333834 ?auto_333835 ) ) ( not ( = ?auto_333834 ?auto_333836 ) ) ( not ( = ?auto_333834 ?auto_333837 ) ) ( not ( = ?auto_333834 ?auto_333838 ) ) ( not ( = ?auto_333834 ?auto_333839 ) ) ( not ( = ?auto_333835 ?auto_333836 ) ) ( not ( = ?auto_333835 ?auto_333837 ) ) ( not ( = ?auto_333835 ?auto_333838 ) ) ( not ( = ?auto_333835 ?auto_333839 ) ) ( not ( = ?auto_333836 ?auto_333837 ) ) ( not ( = ?auto_333836 ?auto_333838 ) ) ( not ( = ?auto_333836 ?auto_333839 ) ) ( not ( = ?auto_333837 ?auto_333838 ) ) ( not ( = ?auto_333837 ?auto_333839 ) ) ( not ( = ?auto_333838 ?auto_333839 ) ) ( ON ?auto_333837 ?auto_333838 ) ( ON ?auto_333836 ?auto_333837 ) ( ON ?auto_333835 ?auto_333836 ) ( ON ?auto_333834 ?auto_333835 ) ( ON ?auto_333833 ?auto_333834 ) ( ON ?auto_333832 ?auto_333833 ) ( ON ?auto_333831 ?auto_333832 ) ( CLEAR ?auto_333829 ) ( ON ?auto_333830 ?auto_333831 ) ( CLEAR ?auto_333830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_333826 ?auto_333827 ?auto_333828 ?auto_333829 ?auto_333830 )
      ( MAKE-13PILE ?auto_333826 ?auto_333827 ?auto_333828 ?auto_333829 ?auto_333830 ?auto_333831 ?auto_333832 ?auto_333833 ?auto_333834 ?auto_333835 ?auto_333836 ?auto_333837 ?auto_333838 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333853 - BLOCK
      ?auto_333854 - BLOCK
      ?auto_333855 - BLOCK
      ?auto_333856 - BLOCK
      ?auto_333857 - BLOCK
      ?auto_333858 - BLOCK
      ?auto_333859 - BLOCK
      ?auto_333860 - BLOCK
      ?auto_333861 - BLOCK
      ?auto_333862 - BLOCK
      ?auto_333863 - BLOCK
      ?auto_333864 - BLOCK
      ?auto_333865 - BLOCK
    )
    :vars
    (
      ?auto_333866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333865 ?auto_333866 ) ( ON-TABLE ?auto_333853 ) ( ON ?auto_333854 ?auto_333853 ) ( ON ?auto_333855 ?auto_333854 ) ( ON ?auto_333856 ?auto_333855 ) ( not ( = ?auto_333853 ?auto_333854 ) ) ( not ( = ?auto_333853 ?auto_333855 ) ) ( not ( = ?auto_333853 ?auto_333856 ) ) ( not ( = ?auto_333853 ?auto_333857 ) ) ( not ( = ?auto_333853 ?auto_333858 ) ) ( not ( = ?auto_333853 ?auto_333859 ) ) ( not ( = ?auto_333853 ?auto_333860 ) ) ( not ( = ?auto_333853 ?auto_333861 ) ) ( not ( = ?auto_333853 ?auto_333862 ) ) ( not ( = ?auto_333853 ?auto_333863 ) ) ( not ( = ?auto_333853 ?auto_333864 ) ) ( not ( = ?auto_333853 ?auto_333865 ) ) ( not ( = ?auto_333853 ?auto_333866 ) ) ( not ( = ?auto_333854 ?auto_333855 ) ) ( not ( = ?auto_333854 ?auto_333856 ) ) ( not ( = ?auto_333854 ?auto_333857 ) ) ( not ( = ?auto_333854 ?auto_333858 ) ) ( not ( = ?auto_333854 ?auto_333859 ) ) ( not ( = ?auto_333854 ?auto_333860 ) ) ( not ( = ?auto_333854 ?auto_333861 ) ) ( not ( = ?auto_333854 ?auto_333862 ) ) ( not ( = ?auto_333854 ?auto_333863 ) ) ( not ( = ?auto_333854 ?auto_333864 ) ) ( not ( = ?auto_333854 ?auto_333865 ) ) ( not ( = ?auto_333854 ?auto_333866 ) ) ( not ( = ?auto_333855 ?auto_333856 ) ) ( not ( = ?auto_333855 ?auto_333857 ) ) ( not ( = ?auto_333855 ?auto_333858 ) ) ( not ( = ?auto_333855 ?auto_333859 ) ) ( not ( = ?auto_333855 ?auto_333860 ) ) ( not ( = ?auto_333855 ?auto_333861 ) ) ( not ( = ?auto_333855 ?auto_333862 ) ) ( not ( = ?auto_333855 ?auto_333863 ) ) ( not ( = ?auto_333855 ?auto_333864 ) ) ( not ( = ?auto_333855 ?auto_333865 ) ) ( not ( = ?auto_333855 ?auto_333866 ) ) ( not ( = ?auto_333856 ?auto_333857 ) ) ( not ( = ?auto_333856 ?auto_333858 ) ) ( not ( = ?auto_333856 ?auto_333859 ) ) ( not ( = ?auto_333856 ?auto_333860 ) ) ( not ( = ?auto_333856 ?auto_333861 ) ) ( not ( = ?auto_333856 ?auto_333862 ) ) ( not ( = ?auto_333856 ?auto_333863 ) ) ( not ( = ?auto_333856 ?auto_333864 ) ) ( not ( = ?auto_333856 ?auto_333865 ) ) ( not ( = ?auto_333856 ?auto_333866 ) ) ( not ( = ?auto_333857 ?auto_333858 ) ) ( not ( = ?auto_333857 ?auto_333859 ) ) ( not ( = ?auto_333857 ?auto_333860 ) ) ( not ( = ?auto_333857 ?auto_333861 ) ) ( not ( = ?auto_333857 ?auto_333862 ) ) ( not ( = ?auto_333857 ?auto_333863 ) ) ( not ( = ?auto_333857 ?auto_333864 ) ) ( not ( = ?auto_333857 ?auto_333865 ) ) ( not ( = ?auto_333857 ?auto_333866 ) ) ( not ( = ?auto_333858 ?auto_333859 ) ) ( not ( = ?auto_333858 ?auto_333860 ) ) ( not ( = ?auto_333858 ?auto_333861 ) ) ( not ( = ?auto_333858 ?auto_333862 ) ) ( not ( = ?auto_333858 ?auto_333863 ) ) ( not ( = ?auto_333858 ?auto_333864 ) ) ( not ( = ?auto_333858 ?auto_333865 ) ) ( not ( = ?auto_333858 ?auto_333866 ) ) ( not ( = ?auto_333859 ?auto_333860 ) ) ( not ( = ?auto_333859 ?auto_333861 ) ) ( not ( = ?auto_333859 ?auto_333862 ) ) ( not ( = ?auto_333859 ?auto_333863 ) ) ( not ( = ?auto_333859 ?auto_333864 ) ) ( not ( = ?auto_333859 ?auto_333865 ) ) ( not ( = ?auto_333859 ?auto_333866 ) ) ( not ( = ?auto_333860 ?auto_333861 ) ) ( not ( = ?auto_333860 ?auto_333862 ) ) ( not ( = ?auto_333860 ?auto_333863 ) ) ( not ( = ?auto_333860 ?auto_333864 ) ) ( not ( = ?auto_333860 ?auto_333865 ) ) ( not ( = ?auto_333860 ?auto_333866 ) ) ( not ( = ?auto_333861 ?auto_333862 ) ) ( not ( = ?auto_333861 ?auto_333863 ) ) ( not ( = ?auto_333861 ?auto_333864 ) ) ( not ( = ?auto_333861 ?auto_333865 ) ) ( not ( = ?auto_333861 ?auto_333866 ) ) ( not ( = ?auto_333862 ?auto_333863 ) ) ( not ( = ?auto_333862 ?auto_333864 ) ) ( not ( = ?auto_333862 ?auto_333865 ) ) ( not ( = ?auto_333862 ?auto_333866 ) ) ( not ( = ?auto_333863 ?auto_333864 ) ) ( not ( = ?auto_333863 ?auto_333865 ) ) ( not ( = ?auto_333863 ?auto_333866 ) ) ( not ( = ?auto_333864 ?auto_333865 ) ) ( not ( = ?auto_333864 ?auto_333866 ) ) ( not ( = ?auto_333865 ?auto_333866 ) ) ( ON ?auto_333864 ?auto_333865 ) ( ON ?auto_333863 ?auto_333864 ) ( ON ?auto_333862 ?auto_333863 ) ( ON ?auto_333861 ?auto_333862 ) ( ON ?auto_333860 ?auto_333861 ) ( ON ?auto_333859 ?auto_333860 ) ( ON ?auto_333858 ?auto_333859 ) ( CLEAR ?auto_333856 ) ( ON ?auto_333857 ?auto_333858 ) ( CLEAR ?auto_333857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_333853 ?auto_333854 ?auto_333855 ?auto_333856 ?auto_333857 )
      ( MAKE-13PILE ?auto_333853 ?auto_333854 ?auto_333855 ?auto_333856 ?auto_333857 ?auto_333858 ?auto_333859 ?auto_333860 ?auto_333861 ?auto_333862 ?auto_333863 ?auto_333864 ?auto_333865 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333880 - BLOCK
      ?auto_333881 - BLOCK
      ?auto_333882 - BLOCK
      ?auto_333883 - BLOCK
      ?auto_333884 - BLOCK
      ?auto_333885 - BLOCK
      ?auto_333886 - BLOCK
      ?auto_333887 - BLOCK
      ?auto_333888 - BLOCK
      ?auto_333889 - BLOCK
      ?auto_333890 - BLOCK
      ?auto_333891 - BLOCK
      ?auto_333892 - BLOCK
    )
    :vars
    (
      ?auto_333893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333892 ?auto_333893 ) ( ON-TABLE ?auto_333880 ) ( ON ?auto_333881 ?auto_333880 ) ( ON ?auto_333882 ?auto_333881 ) ( not ( = ?auto_333880 ?auto_333881 ) ) ( not ( = ?auto_333880 ?auto_333882 ) ) ( not ( = ?auto_333880 ?auto_333883 ) ) ( not ( = ?auto_333880 ?auto_333884 ) ) ( not ( = ?auto_333880 ?auto_333885 ) ) ( not ( = ?auto_333880 ?auto_333886 ) ) ( not ( = ?auto_333880 ?auto_333887 ) ) ( not ( = ?auto_333880 ?auto_333888 ) ) ( not ( = ?auto_333880 ?auto_333889 ) ) ( not ( = ?auto_333880 ?auto_333890 ) ) ( not ( = ?auto_333880 ?auto_333891 ) ) ( not ( = ?auto_333880 ?auto_333892 ) ) ( not ( = ?auto_333880 ?auto_333893 ) ) ( not ( = ?auto_333881 ?auto_333882 ) ) ( not ( = ?auto_333881 ?auto_333883 ) ) ( not ( = ?auto_333881 ?auto_333884 ) ) ( not ( = ?auto_333881 ?auto_333885 ) ) ( not ( = ?auto_333881 ?auto_333886 ) ) ( not ( = ?auto_333881 ?auto_333887 ) ) ( not ( = ?auto_333881 ?auto_333888 ) ) ( not ( = ?auto_333881 ?auto_333889 ) ) ( not ( = ?auto_333881 ?auto_333890 ) ) ( not ( = ?auto_333881 ?auto_333891 ) ) ( not ( = ?auto_333881 ?auto_333892 ) ) ( not ( = ?auto_333881 ?auto_333893 ) ) ( not ( = ?auto_333882 ?auto_333883 ) ) ( not ( = ?auto_333882 ?auto_333884 ) ) ( not ( = ?auto_333882 ?auto_333885 ) ) ( not ( = ?auto_333882 ?auto_333886 ) ) ( not ( = ?auto_333882 ?auto_333887 ) ) ( not ( = ?auto_333882 ?auto_333888 ) ) ( not ( = ?auto_333882 ?auto_333889 ) ) ( not ( = ?auto_333882 ?auto_333890 ) ) ( not ( = ?auto_333882 ?auto_333891 ) ) ( not ( = ?auto_333882 ?auto_333892 ) ) ( not ( = ?auto_333882 ?auto_333893 ) ) ( not ( = ?auto_333883 ?auto_333884 ) ) ( not ( = ?auto_333883 ?auto_333885 ) ) ( not ( = ?auto_333883 ?auto_333886 ) ) ( not ( = ?auto_333883 ?auto_333887 ) ) ( not ( = ?auto_333883 ?auto_333888 ) ) ( not ( = ?auto_333883 ?auto_333889 ) ) ( not ( = ?auto_333883 ?auto_333890 ) ) ( not ( = ?auto_333883 ?auto_333891 ) ) ( not ( = ?auto_333883 ?auto_333892 ) ) ( not ( = ?auto_333883 ?auto_333893 ) ) ( not ( = ?auto_333884 ?auto_333885 ) ) ( not ( = ?auto_333884 ?auto_333886 ) ) ( not ( = ?auto_333884 ?auto_333887 ) ) ( not ( = ?auto_333884 ?auto_333888 ) ) ( not ( = ?auto_333884 ?auto_333889 ) ) ( not ( = ?auto_333884 ?auto_333890 ) ) ( not ( = ?auto_333884 ?auto_333891 ) ) ( not ( = ?auto_333884 ?auto_333892 ) ) ( not ( = ?auto_333884 ?auto_333893 ) ) ( not ( = ?auto_333885 ?auto_333886 ) ) ( not ( = ?auto_333885 ?auto_333887 ) ) ( not ( = ?auto_333885 ?auto_333888 ) ) ( not ( = ?auto_333885 ?auto_333889 ) ) ( not ( = ?auto_333885 ?auto_333890 ) ) ( not ( = ?auto_333885 ?auto_333891 ) ) ( not ( = ?auto_333885 ?auto_333892 ) ) ( not ( = ?auto_333885 ?auto_333893 ) ) ( not ( = ?auto_333886 ?auto_333887 ) ) ( not ( = ?auto_333886 ?auto_333888 ) ) ( not ( = ?auto_333886 ?auto_333889 ) ) ( not ( = ?auto_333886 ?auto_333890 ) ) ( not ( = ?auto_333886 ?auto_333891 ) ) ( not ( = ?auto_333886 ?auto_333892 ) ) ( not ( = ?auto_333886 ?auto_333893 ) ) ( not ( = ?auto_333887 ?auto_333888 ) ) ( not ( = ?auto_333887 ?auto_333889 ) ) ( not ( = ?auto_333887 ?auto_333890 ) ) ( not ( = ?auto_333887 ?auto_333891 ) ) ( not ( = ?auto_333887 ?auto_333892 ) ) ( not ( = ?auto_333887 ?auto_333893 ) ) ( not ( = ?auto_333888 ?auto_333889 ) ) ( not ( = ?auto_333888 ?auto_333890 ) ) ( not ( = ?auto_333888 ?auto_333891 ) ) ( not ( = ?auto_333888 ?auto_333892 ) ) ( not ( = ?auto_333888 ?auto_333893 ) ) ( not ( = ?auto_333889 ?auto_333890 ) ) ( not ( = ?auto_333889 ?auto_333891 ) ) ( not ( = ?auto_333889 ?auto_333892 ) ) ( not ( = ?auto_333889 ?auto_333893 ) ) ( not ( = ?auto_333890 ?auto_333891 ) ) ( not ( = ?auto_333890 ?auto_333892 ) ) ( not ( = ?auto_333890 ?auto_333893 ) ) ( not ( = ?auto_333891 ?auto_333892 ) ) ( not ( = ?auto_333891 ?auto_333893 ) ) ( not ( = ?auto_333892 ?auto_333893 ) ) ( ON ?auto_333891 ?auto_333892 ) ( ON ?auto_333890 ?auto_333891 ) ( ON ?auto_333889 ?auto_333890 ) ( ON ?auto_333888 ?auto_333889 ) ( ON ?auto_333887 ?auto_333888 ) ( ON ?auto_333886 ?auto_333887 ) ( ON ?auto_333885 ?auto_333886 ) ( ON ?auto_333884 ?auto_333885 ) ( CLEAR ?auto_333882 ) ( ON ?auto_333883 ?auto_333884 ) ( CLEAR ?auto_333883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_333880 ?auto_333881 ?auto_333882 ?auto_333883 )
      ( MAKE-13PILE ?auto_333880 ?auto_333881 ?auto_333882 ?auto_333883 ?auto_333884 ?auto_333885 ?auto_333886 ?auto_333887 ?auto_333888 ?auto_333889 ?auto_333890 ?auto_333891 ?auto_333892 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333907 - BLOCK
      ?auto_333908 - BLOCK
      ?auto_333909 - BLOCK
      ?auto_333910 - BLOCK
      ?auto_333911 - BLOCK
      ?auto_333912 - BLOCK
      ?auto_333913 - BLOCK
      ?auto_333914 - BLOCK
      ?auto_333915 - BLOCK
      ?auto_333916 - BLOCK
      ?auto_333917 - BLOCK
      ?auto_333918 - BLOCK
      ?auto_333919 - BLOCK
    )
    :vars
    (
      ?auto_333920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333919 ?auto_333920 ) ( ON-TABLE ?auto_333907 ) ( ON ?auto_333908 ?auto_333907 ) ( ON ?auto_333909 ?auto_333908 ) ( not ( = ?auto_333907 ?auto_333908 ) ) ( not ( = ?auto_333907 ?auto_333909 ) ) ( not ( = ?auto_333907 ?auto_333910 ) ) ( not ( = ?auto_333907 ?auto_333911 ) ) ( not ( = ?auto_333907 ?auto_333912 ) ) ( not ( = ?auto_333907 ?auto_333913 ) ) ( not ( = ?auto_333907 ?auto_333914 ) ) ( not ( = ?auto_333907 ?auto_333915 ) ) ( not ( = ?auto_333907 ?auto_333916 ) ) ( not ( = ?auto_333907 ?auto_333917 ) ) ( not ( = ?auto_333907 ?auto_333918 ) ) ( not ( = ?auto_333907 ?auto_333919 ) ) ( not ( = ?auto_333907 ?auto_333920 ) ) ( not ( = ?auto_333908 ?auto_333909 ) ) ( not ( = ?auto_333908 ?auto_333910 ) ) ( not ( = ?auto_333908 ?auto_333911 ) ) ( not ( = ?auto_333908 ?auto_333912 ) ) ( not ( = ?auto_333908 ?auto_333913 ) ) ( not ( = ?auto_333908 ?auto_333914 ) ) ( not ( = ?auto_333908 ?auto_333915 ) ) ( not ( = ?auto_333908 ?auto_333916 ) ) ( not ( = ?auto_333908 ?auto_333917 ) ) ( not ( = ?auto_333908 ?auto_333918 ) ) ( not ( = ?auto_333908 ?auto_333919 ) ) ( not ( = ?auto_333908 ?auto_333920 ) ) ( not ( = ?auto_333909 ?auto_333910 ) ) ( not ( = ?auto_333909 ?auto_333911 ) ) ( not ( = ?auto_333909 ?auto_333912 ) ) ( not ( = ?auto_333909 ?auto_333913 ) ) ( not ( = ?auto_333909 ?auto_333914 ) ) ( not ( = ?auto_333909 ?auto_333915 ) ) ( not ( = ?auto_333909 ?auto_333916 ) ) ( not ( = ?auto_333909 ?auto_333917 ) ) ( not ( = ?auto_333909 ?auto_333918 ) ) ( not ( = ?auto_333909 ?auto_333919 ) ) ( not ( = ?auto_333909 ?auto_333920 ) ) ( not ( = ?auto_333910 ?auto_333911 ) ) ( not ( = ?auto_333910 ?auto_333912 ) ) ( not ( = ?auto_333910 ?auto_333913 ) ) ( not ( = ?auto_333910 ?auto_333914 ) ) ( not ( = ?auto_333910 ?auto_333915 ) ) ( not ( = ?auto_333910 ?auto_333916 ) ) ( not ( = ?auto_333910 ?auto_333917 ) ) ( not ( = ?auto_333910 ?auto_333918 ) ) ( not ( = ?auto_333910 ?auto_333919 ) ) ( not ( = ?auto_333910 ?auto_333920 ) ) ( not ( = ?auto_333911 ?auto_333912 ) ) ( not ( = ?auto_333911 ?auto_333913 ) ) ( not ( = ?auto_333911 ?auto_333914 ) ) ( not ( = ?auto_333911 ?auto_333915 ) ) ( not ( = ?auto_333911 ?auto_333916 ) ) ( not ( = ?auto_333911 ?auto_333917 ) ) ( not ( = ?auto_333911 ?auto_333918 ) ) ( not ( = ?auto_333911 ?auto_333919 ) ) ( not ( = ?auto_333911 ?auto_333920 ) ) ( not ( = ?auto_333912 ?auto_333913 ) ) ( not ( = ?auto_333912 ?auto_333914 ) ) ( not ( = ?auto_333912 ?auto_333915 ) ) ( not ( = ?auto_333912 ?auto_333916 ) ) ( not ( = ?auto_333912 ?auto_333917 ) ) ( not ( = ?auto_333912 ?auto_333918 ) ) ( not ( = ?auto_333912 ?auto_333919 ) ) ( not ( = ?auto_333912 ?auto_333920 ) ) ( not ( = ?auto_333913 ?auto_333914 ) ) ( not ( = ?auto_333913 ?auto_333915 ) ) ( not ( = ?auto_333913 ?auto_333916 ) ) ( not ( = ?auto_333913 ?auto_333917 ) ) ( not ( = ?auto_333913 ?auto_333918 ) ) ( not ( = ?auto_333913 ?auto_333919 ) ) ( not ( = ?auto_333913 ?auto_333920 ) ) ( not ( = ?auto_333914 ?auto_333915 ) ) ( not ( = ?auto_333914 ?auto_333916 ) ) ( not ( = ?auto_333914 ?auto_333917 ) ) ( not ( = ?auto_333914 ?auto_333918 ) ) ( not ( = ?auto_333914 ?auto_333919 ) ) ( not ( = ?auto_333914 ?auto_333920 ) ) ( not ( = ?auto_333915 ?auto_333916 ) ) ( not ( = ?auto_333915 ?auto_333917 ) ) ( not ( = ?auto_333915 ?auto_333918 ) ) ( not ( = ?auto_333915 ?auto_333919 ) ) ( not ( = ?auto_333915 ?auto_333920 ) ) ( not ( = ?auto_333916 ?auto_333917 ) ) ( not ( = ?auto_333916 ?auto_333918 ) ) ( not ( = ?auto_333916 ?auto_333919 ) ) ( not ( = ?auto_333916 ?auto_333920 ) ) ( not ( = ?auto_333917 ?auto_333918 ) ) ( not ( = ?auto_333917 ?auto_333919 ) ) ( not ( = ?auto_333917 ?auto_333920 ) ) ( not ( = ?auto_333918 ?auto_333919 ) ) ( not ( = ?auto_333918 ?auto_333920 ) ) ( not ( = ?auto_333919 ?auto_333920 ) ) ( ON ?auto_333918 ?auto_333919 ) ( ON ?auto_333917 ?auto_333918 ) ( ON ?auto_333916 ?auto_333917 ) ( ON ?auto_333915 ?auto_333916 ) ( ON ?auto_333914 ?auto_333915 ) ( ON ?auto_333913 ?auto_333914 ) ( ON ?auto_333912 ?auto_333913 ) ( ON ?auto_333911 ?auto_333912 ) ( CLEAR ?auto_333909 ) ( ON ?auto_333910 ?auto_333911 ) ( CLEAR ?auto_333910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_333907 ?auto_333908 ?auto_333909 ?auto_333910 )
      ( MAKE-13PILE ?auto_333907 ?auto_333908 ?auto_333909 ?auto_333910 ?auto_333911 ?auto_333912 ?auto_333913 ?auto_333914 ?auto_333915 ?auto_333916 ?auto_333917 ?auto_333918 ?auto_333919 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333934 - BLOCK
      ?auto_333935 - BLOCK
      ?auto_333936 - BLOCK
      ?auto_333937 - BLOCK
      ?auto_333938 - BLOCK
      ?auto_333939 - BLOCK
      ?auto_333940 - BLOCK
      ?auto_333941 - BLOCK
      ?auto_333942 - BLOCK
      ?auto_333943 - BLOCK
      ?auto_333944 - BLOCK
      ?auto_333945 - BLOCK
      ?auto_333946 - BLOCK
    )
    :vars
    (
      ?auto_333947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333946 ?auto_333947 ) ( ON-TABLE ?auto_333934 ) ( ON ?auto_333935 ?auto_333934 ) ( not ( = ?auto_333934 ?auto_333935 ) ) ( not ( = ?auto_333934 ?auto_333936 ) ) ( not ( = ?auto_333934 ?auto_333937 ) ) ( not ( = ?auto_333934 ?auto_333938 ) ) ( not ( = ?auto_333934 ?auto_333939 ) ) ( not ( = ?auto_333934 ?auto_333940 ) ) ( not ( = ?auto_333934 ?auto_333941 ) ) ( not ( = ?auto_333934 ?auto_333942 ) ) ( not ( = ?auto_333934 ?auto_333943 ) ) ( not ( = ?auto_333934 ?auto_333944 ) ) ( not ( = ?auto_333934 ?auto_333945 ) ) ( not ( = ?auto_333934 ?auto_333946 ) ) ( not ( = ?auto_333934 ?auto_333947 ) ) ( not ( = ?auto_333935 ?auto_333936 ) ) ( not ( = ?auto_333935 ?auto_333937 ) ) ( not ( = ?auto_333935 ?auto_333938 ) ) ( not ( = ?auto_333935 ?auto_333939 ) ) ( not ( = ?auto_333935 ?auto_333940 ) ) ( not ( = ?auto_333935 ?auto_333941 ) ) ( not ( = ?auto_333935 ?auto_333942 ) ) ( not ( = ?auto_333935 ?auto_333943 ) ) ( not ( = ?auto_333935 ?auto_333944 ) ) ( not ( = ?auto_333935 ?auto_333945 ) ) ( not ( = ?auto_333935 ?auto_333946 ) ) ( not ( = ?auto_333935 ?auto_333947 ) ) ( not ( = ?auto_333936 ?auto_333937 ) ) ( not ( = ?auto_333936 ?auto_333938 ) ) ( not ( = ?auto_333936 ?auto_333939 ) ) ( not ( = ?auto_333936 ?auto_333940 ) ) ( not ( = ?auto_333936 ?auto_333941 ) ) ( not ( = ?auto_333936 ?auto_333942 ) ) ( not ( = ?auto_333936 ?auto_333943 ) ) ( not ( = ?auto_333936 ?auto_333944 ) ) ( not ( = ?auto_333936 ?auto_333945 ) ) ( not ( = ?auto_333936 ?auto_333946 ) ) ( not ( = ?auto_333936 ?auto_333947 ) ) ( not ( = ?auto_333937 ?auto_333938 ) ) ( not ( = ?auto_333937 ?auto_333939 ) ) ( not ( = ?auto_333937 ?auto_333940 ) ) ( not ( = ?auto_333937 ?auto_333941 ) ) ( not ( = ?auto_333937 ?auto_333942 ) ) ( not ( = ?auto_333937 ?auto_333943 ) ) ( not ( = ?auto_333937 ?auto_333944 ) ) ( not ( = ?auto_333937 ?auto_333945 ) ) ( not ( = ?auto_333937 ?auto_333946 ) ) ( not ( = ?auto_333937 ?auto_333947 ) ) ( not ( = ?auto_333938 ?auto_333939 ) ) ( not ( = ?auto_333938 ?auto_333940 ) ) ( not ( = ?auto_333938 ?auto_333941 ) ) ( not ( = ?auto_333938 ?auto_333942 ) ) ( not ( = ?auto_333938 ?auto_333943 ) ) ( not ( = ?auto_333938 ?auto_333944 ) ) ( not ( = ?auto_333938 ?auto_333945 ) ) ( not ( = ?auto_333938 ?auto_333946 ) ) ( not ( = ?auto_333938 ?auto_333947 ) ) ( not ( = ?auto_333939 ?auto_333940 ) ) ( not ( = ?auto_333939 ?auto_333941 ) ) ( not ( = ?auto_333939 ?auto_333942 ) ) ( not ( = ?auto_333939 ?auto_333943 ) ) ( not ( = ?auto_333939 ?auto_333944 ) ) ( not ( = ?auto_333939 ?auto_333945 ) ) ( not ( = ?auto_333939 ?auto_333946 ) ) ( not ( = ?auto_333939 ?auto_333947 ) ) ( not ( = ?auto_333940 ?auto_333941 ) ) ( not ( = ?auto_333940 ?auto_333942 ) ) ( not ( = ?auto_333940 ?auto_333943 ) ) ( not ( = ?auto_333940 ?auto_333944 ) ) ( not ( = ?auto_333940 ?auto_333945 ) ) ( not ( = ?auto_333940 ?auto_333946 ) ) ( not ( = ?auto_333940 ?auto_333947 ) ) ( not ( = ?auto_333941 ?auto_333942 ) ) ( not ( = ?auto_333941 ?auto_333943 ) ) ( not ( = ?auto_333941 ?auto_333944 ) ) ( not ( = ?auto_333941 ?auto_333945 ) ) ( not ( = ?auto_333941 ?auto_333946 ) ) ( not ( = ?auto_333941 ?auto_333947 ) ) ( not ( = ?auto_333942 ?auto_333943 ) ) ( not ( = ?auto_333942 ?auto_333944 ) ) ( not ( = ?auto_333942 ?auto_333945 ) ) ( not ( = ?auto_333942 ?auto_333946 ) ) ( not ( = ?auto_333942 ?auto_333947 ) ) ( not ( = ?auto_333943 ?auto_333944 ) ) ( not ( = ?auto_333943 ?auto_333945 ) ) ( not ( = ?auto_333943 ?auto_333946 ) ) ( not ( = ?auto_333943 ?auto_333947 ) ) ( not ( = ?auto_333944 ?auto_333945 ) ) ( not ( = ?auto_333944 ?auto_333946 ) ) ( not ( = ?auto_333944 ?auto_333947 ) ) ( not ( = ?auto_333945 ?auto_333946 ) ) ( not ( = ?auto_333945 ?auto_333947 ) ) ( not ( = ?auto_333946 ?auto_333947 ) ) ( ON ?auto_333945 ?auto_333946 ) ( ON ?auto_333944 ?auto_333945 ) ( ON ?auto_333943 ?auto_333944 ) ( ON ?auto_333942 ?auto_333943 ) ( ON ?auto_333941 ?auto_333942 ) ( ON ?auto_333940 ?auto_333941 ) ( ON ?auto_333939 ?auto_333940 ) ( ON ?auto_333938 ?auto_333939 ) ( ON ?auto_333937 ?auto_333938 ) ( CLEAR ?auto_333935 ) ( ON ?auto_333936 ?auto_333937 ) ( CLEAR ?auto_333936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_333934 ?auto_333935 ?auto_333936 )
      ( MAKE-13PILE ?auto_333934 ?auto_333935 ?auto_333936 ?auto_333937 ?auto_333938 ?auto_333939 ?auto_333940 ?auto_333941 ?auto_333942 ?auto_333943 ?auto_333944 ?auto_333945 ?auto_333946 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333961 - BLOCK
      ?auto_333962 - BLOCK
      ?auto_333963 - BLOCK
      ?auto_333964 - BLOCK
      ?auto_333965 - BLOCK
      ?auto_333966 - BLOCK
      ?auto_333967 - BLOCK
      ?auto_333968 - BLOCK
      ?auto_333969 - BLOCK
      ?auto_333970 - BLOCK
      ?auto_333971 - BLOCK
      ?auto_333972 - BLOCK
      ?auto_333973 - BLOCK
    )
    :vars
    (
      ?auto_333974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_333973 ?auto_333974 ) ( ON-TABLE ?auto_333961 ) ( ON ?auto_333962 ?auto_333961 ) ( not ( = ?auto_333961 ?auto_333962 ) ) ( not ( = ?auto_333961 ?auto_333963 ) ) ( not ( = ?auto_333961 ?auto_333964 ) ) ( not ( = ?auto_333961 ?auto_333965 ) ) ( not ( = ?auto_333961 ?auto_333966 ) ) ( not ( = ?auto_333961 ?auto_333967 ) ) ( not ( = ?auto_333961 ?auto_333968 ) ) ( not ( = ?auto_333961 ?auto_333969 ) ) ( not ( = ?auto_333961 ?auto_333970 ) ) ( not ( = ?auto_333961 ?auto_333971 ) ) ( not ( = ?auto_333961 ?auto_333972 ) ) ( not ( = ?auto_333961 ?auto_333973 ) ) ( not ( = ?auto_333961 ?auto_333974 ) ) ( not ( = ?auto_333962 ?auto_333963 ) ) ( not ( = ?auto_333962 ?auto_333964 ) ) ( not ( = ?auto_333962 ?auto_333965 ) ) ( not ( = ?auto_333962 ?auto_333966 ) ) ( not ( = ?auto_333962 ?auto_333967 ) ) ( not ( = ?auto_333962 ?auto_333968 ) ) ( not ( = ?auto_333962 ?auto_333969 ) ) ( not ( = ?auto_333962 ?auto_333970 ) ) ( not ( = ?auto_333962 ?auto_333971 ) ) ( not ( = ?auto_333962 ?auto_333972 ) ) ( not ( = ?auto_333962 ?auto_333973 ) ) ( not ( = ?auto_333962 ?auto_333974 ) ) ( not ( = ?auto_333963 ?auto_333964 ) ) ( not ( = ?auto_333963 ?auto_333965 ) ) ( not ( = ?auto_333963 ?auto_333966 ) ) ( not ( = ?auto_333963 ?auto_333967 ) ) ( not ( = ?auto_333963 ?auto_333968 ) ) ( not ( = ?auto_333963 ?auto_333969 ) ) ( not ( = ?auto_333963 ?auto_333970 ) ) ( not ( = ?auto_333963 ?auto_333971 ) ) ( not ( = ?auto_333963 ?auto_333972 ) ) ( not ( = ?auto_333963 ?auto_333973 ) ) ( not ( = ?auto_333963 ?auto_333974 ) ) ( not ( = ?auto_333964 ?auto_333965 ) ) ( not ( = ?auto_333964 ?auto_333966 ) ) ( not ( = ?auto_333964 ?auto_333967 ) ) ( not ( = ?auto_333964 ?auto_333968 ) ) ( not ( = ?auto_333964 ?auto_333969 ) ) ( not ( = ?auto_333964 ?auto_333970 ) ) ( not ( = ?auto_333964 ?auto_333971 ) ) ( not ( = ?auto_333964 ?auto_333972 ) ) ( not ( = ?auto_333964 ?auto_333973 ) ) ( not ( = ?auto_333964 ?auto_333974 ) ) ( not ( = ?auto_333965 ?auto_333966 ) ) ( not ( = ?auto_333965 ?auto_333967 ) ) ( not ( = ?auto_333965 ?auto_333968 ) ) ( not ( = ?auto_333965 ?auto_333969 ) ) ( not ( = ?auto_333965 ?auto_333970 ) ) ( not ( = ?auto_333965 ?auto_333971 ) ) ( not ( = ?auto_333965 ?auto_333972 ) ) ( not ( = ?auto_333965 ?auto_333973 ) ) ( not ( = ?auto_333965 ?auto_333974 ) ) ( not ( = ?auto_333966 ?auto_333967 ) ) ( not ( = ?auto_333966 ?auto_333968 ) ) ( not ( = ?auto_333966 ?auto_333969 ) ) ( not ( = ?auto_333966 ?auto_333970 ) ) ( not ( = ?auto_333966 ?auto_333971 ) ) ( not ( = ?auto_333966 ?auto_333972 ) ) ( not ( = ?auto_333966 ?auto_333973 ) ) ( not ( = ?auto_333966 ?auto_333974 ) ) ( not ( = ?auto_333967 ?auto_333968 ) ) ( not ( = ?auto_333967 ?auto_333969 ) ) ( not ( = ?auto_333967 ?auto_333970 ) ) ( not ( = ?auto_333967 ?auto_333971 ) ) ( not ( = ?auto_333967 ?auto_333972 ) ) ( not ( = ?auto_333967 ?auto_333973 ) ) ( not ( = ?auto_333967 ?auto_333974 ) ) ( not ( = ?auto_333968 ?auto_333969 ) ) ( not ( = ?auto_333968 ?auto_333970 ) ) ( not ( = ?auto_333968 ?auto_333971 ) ) ( not ( = ?auto_333968 ?auto_333972 ) ) ( not ( = ?auto_333968 ?auto_333973 ) ) ( not ( = ?auto_333968 ?auto_333974 ) ) ( not ( = ?auto_333969 ?auto_333970 ) ) ( not ( = ?auto_333969 ?auto_333971 ) ) ( not ( = ?auto_333969 ?auto_333972 ) ) ( not ( = ?auto_333969 ?auto_333973 ) ) ( not ( = ?auto_333969 ?auto_333974 ) ) ( not ( = ?auto_333970 ?auto_333971 ) ) ( not ( = ?auto_333970 ?auto_333972 ) ) ( not ( = ?auto_333970 ?auto_333973 ) ) ( not ( = ?auto_333970 ?auto_333974 ) ) ( not ( = ?auto_333971 ?auto_333972 ) ) ( not ( = ?auto_333971 ?auto_333973 ) ) ( not ( = ?auto_333971 ?auto_333974 ) ) ( not ( = ?auto_333972 ?auto_333973 ) ) ( not ( = ?auto_333972 ?auto_333974 ) ) ( not ( = ?auto_333973 ?auto_333974 ) ) ( ON ?auto_333972 ?auto_333973 ) ( ON ?auto_333971 ?auto_333972 ) ( ON ?auto_333970 ?auto_333971 ) ( ON ?auto_333969 ?auto_333970 ) ( ON ?auto_333968 ?auto_333969 ) ( ON ?auto_333967 ?auto_333968 ) ( ON ?auto_333966 ?auto_333967 ) ( ON ?auto_333965 ?auto_333966 ) ( ON ?auto_333964 ?auto_333965 ) ( CLEAR ?auto_333962 ) ( ON ?auto_333963 ?auto_333964 ) ( CLEAR ?auto_333963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_333961 ?auto_333962 ?auto_333963 )
      ( MAKE-13PILE ?auto_333961 ?auto_333962 ?auto_333963 ?auto_333964 ?auto_333965 ?auto_333966 ?auto_333967 ?auto_333968 ?auto_333969 ?auto_333970 ?auto_333971 ?auto_333972 ?auto_333973 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_333988 - BLOCK
      ?auto_333989 - BLOCK
      ?auto_333990 - BLOCK
      ?auto_333991 - BLOCK
      ?auto_333992 - BLOCK
      ?auto_333993 - BLOCK
      ?auto_333994 - BLOCK
      ?auto_333995 - BLOCK
      ?auto_333996 - BLOCK
      ?auto_333997 - BLOCK
      ?auto_333998 - BLOCK
      ?auto_333999 - BLOCK
      ?auto_334000 - BLOCK
    )
    :vars
    (
      ?auto_334001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334000 ?auto_334001 ) ( ON-TABLE ?auto_333988 ) ( not ( = ?auto_333988 ?auto_333989 ) ) ( not ( = ?auto_333988 ?auto_333990 ) ) ( not ( = ?auto_333988 ?auto_333991 ) ) ( not ( = ?auto_333988 ?auto_333992 ) ) ( not ( = ?auto_333988 ?auto_333993 ) ) ( not ( = ?auto_333988 ?auto_333994 ) ) ( not ( = ?auto_333988 ?auto_333995 ) ) ( not ( = ?auto_333988 ?auto_333996 ) ) ( not ( = ?auto_333988 ?auto_333997 ) ) ( not ( = ?auto_333988 ?auto_333998 ) ) ( not ( = ?auto_333988 ?auto_333999 ) ) ( not ( = ?auto_333988 ?auto_334000 ) ) ( not ( = ?auto_333988 ?auto_334001 ) ) ( not ( = ?auto_333989 ?auto_333990 ) ) ( not ( = ?auto_333989 ?auto_333991 ) ) ( not ( = ?auto_333989 ?auto_333992 ) ) ( not ( = ?auto_333989 ?auto_333993 ) ) ( not ( = ?auto_333989 ?auto_333994 ) ) ( not ( = ?auto_333989 ?auto_333995 ) ) ( not ( = ?auto_333989 ?auto_333996 ) ) ( not ( = ?auto_333989 ?auto_333997 ) ) ( not ( = ?auto_333989 ?auto_333998 ) ) ( not ( = ?auto_333989 ?auto_333999 ) ) ( not ( = ?auto_333989 ?auto_334000 ) ) ( not ( = ?auto_333989 ?auto_334001 ) ) ( not ( = ?auto_333990 ?auto_333991 ) ) ( not ( = ?auto_333990 ?auto_333992 ) ) ( not ( = ?auto_333990 ?auto_333993 ) ) ( not ( = ?auto_333990 ?auto_333994 ) ) ( not ( = ?auto_333990 ?auto_333995 ) ) ( not ( = ?auto_333990 ?auto_333996 ) ) ( not ( = ?auto_333990 ?auto_333997 ) ) ( not ( = ?auto_333990 ?auto_333998 ) ) ( not ( = ?auto_333990 ?auto_333999 ) ) ( not ( = ?auto_333990 ?auto_334000 ) ) ( not ( = ?auto_333990 ?auto_334001 ) ) ( not ( = ?auto_333991 ?auto_333992 ) ) ( not ( = ?auto_333991 ?auto_333993 ) ) ( not ( = ?auto_333991 ?auto_333994 ) ) ( not ( = ?auto_333991 ?auto_333995 ) ) ( not ( = ?auto_333991 ?auto_333996 ) ) ( not ( = ?auto_333991 ?auto_333997 ) ) ( not ( = ?auto_333991 ?auto_333998 ) ) ( not ( = ?auto_333991 ?auto_333999 ) ) ( not ( = ?auto_333991 ?auto_334000 ) ) ( not ( = ?auto_333991 ?auto_334001 ) ) ( not ( = ?auto_333992 ?auto_333993 ) ) ( not ( = ?auto_333992 ?auto_333994 ) ) ( not ( = ?auto_333992 ?auto_333995 ) ) ( not ( = ?auto_333992 ?auto_333996 ) ) ( not ( = ?auto_333992 ?auto_333997 ) ) ( not ( = ?auto_333992 ?auto_333998 ) ) ( not ( = ?auto_333992 ?auto_333999 ) ) ( not ( = ?auto_333992 ?auto_334000 ) ) ( not ( = ?auto_333992 ?auto_334001 ) ) ( not ( = ?auto_333993 ?auto_333994 ) ) ( not ( = ?auto_333993 ?auto_333995 ) ) ( not ( = ?auto_333993 ?auto_333996 ) ) ( not ( = ?auto_333993 ?auto_333997 ) ) ( not ( = ?auto_333993 ?auto_333998 ) ) ( not ( = ?auto_333993 ?auto_333999 ) ) ( not ( = ?auto_333993 ?auto_334000 ) ) ( not ( = ?auto_333993 ?auto_334001 ) ) ( not ( = ?auto_333994 ?auto_333995 ) ) ( not ( = ?auto_333994 ?auto_333996 ) ) ( not ( = ?auto_333994 ?auto_333997 ) ) ( not ( = ?auto_333994 ?auto_333998 ) ) ( not ( = ?auto_333994 ?auto_333999 ) ) ( not ( = ?auto_333994 ?auto_334000 ) ) ( not ( = ?auto_333994 ?auto_334001 ) ) ( not ( = ?auto_333995 ?auto_333996 ) ) ( not ( = ?auto_333995 ?auto_333997 ) ) ( not ( = ?auto_333995 ?auto_333998 ) ) ( not ( = ?auto_333995 ?auto_333999 ) ) ( not ( = ?auto_333995 ?auto_334000 ) ) ( not ( = ?auto_333995 ?auto_334001 ) ) ( not ( = ?auto_333996 ?auto_333997 ) ) ( not ( = ?auto_333996 ?auto_333998 ) ) ( not ( = ?auto_333996 ?auto_333999 ) ) ( not ( = ?auto_333996 ?auto_334000 ) ) ( not ( = ?auto_333996 ?auto_334001 ) ) ( not ( = ?auto_333997 ?auto_333998 ) ) ( not ( = ?auto_333997 ?auto_333999 ) ) ( not ( = ?auto_333997 ?auto_334000 ) ) ( not ( = ?auto_333997 ?auto_334001 ) ) ( not ( = ?auto_333998 ?auto_333999 ) ) ( not ( = ?auto_333998 ?auto_334000 ) ) ( not ( = ?auto_333998 ?auto_334001 ) ) ( not ( = ?auto_333999 ?auto_334000 ) ) ( not ( = ?auto_333999 ?auto_334001 ) ) ( not ( = ?auto_334000 ?auto_334001 ) ) ( ON ?auto_333999 ?auto_334000 ) ( ON ?auto_333998 ?auto_333999 ) ( ON ?auto_333997 ?auto_333998 ) ( ON ?auto_333996 ?auto_333997 ) ( ON ?auto_333995 ?auto_333996 ) ( ON ?auto_333994 ?auto_333995 ) ( ON ?auto_333993 ?auto_333994 ) ( ON ?auto_333992 ?auto_333993 ) ( ON ?auto_333991 ?auto_333992 ) ( ON ?auto_333990 ?auto_333991 ) ( CLEAR ?auto_333988 ) ( ON ?auto_333989 ?auto_333990 ) ( CLEAR ?auto_333989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_333988 ?auto_333989 )
      ( MAKE-13PILE ?auto_333988 ?auto_333989 ?auto_333990 ?auto_333991 ?auto_333992 ?auto_333993 ?auto_333994 ?auto_333995 ?auto_333996 ?auto_333997 ?auto_333998 ?auto_333999 ?auto_334000 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_334015 - BLOCK
      ?auto_334016 - BLOCK
      ?auto_334017 - BLOCK
      ?auto_334018 - BLOCK
      ?auto_334019 - BLOCK
      ?auto_334020 - BLOCK
      ?auto_334021 - BLOCK
      ?auto_334022 - BLOCK
      ?auto_334023 - BLOCK
      ?auto_334024 - BLOCK
      ?auto_334025 - BLOCK
      ?auto_334026 - BLOCK
      ?auto_334027 - BLOCK
    )
    :vars
    (
      ?auto_334028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334027 ?auto_334028 ) ( ON-TABLE ?auto_334015 ) ( not ( = ?auto_334015 ?auto_334016 ) ) ( not ( = ?auto_334015 ?auto_334017 ) ) ( not ( = ?auto_334015 ?auto_334018 ) ) ( not ( = ?auto_334015 ?auto_334019 ) ) ( not ( = ?auto_334015 ?auto_334020 ) ) ( not ( = ?auto_334015 ?auto_334021 ) ) ( not ( = ?auto_334015 ?auto_334022 ) ) ( not ( = ?auto_334015 ?auto_334023 ) ) ( not ( = ?auto_334015 ?auto_334024 ) ) ( not ( = ?auto_334015 ?auto_334025 ) ) ( not ( = ?auto_334015 ?auto_334026 ) ) ( not ( = ?auto_334015 ?auto_334027 ) ) ( not ( = ?auto_334015 ?auto_334028 ) ) ( not ( = ?auto_334016 ?auto_334017 ) ) ( not ( = ?auto_334016 ?auto_334018 ) ) ( not ( = ?auto_334016 ?auto_334019 ) ) ( not ( = ?auto_334016 ?auto_334020 ) ) ( not ( = ?auto_334016 ?auto_334021 ) ) ( not ( = ?auto_334016 ?auto_334022 ) ) ( not ( = ?auto_334016 ?auto_334023 ) ) ( not ( = ?auto_334016 ?auto_334024 ) ) ( not ( = ?auto_334016 ?auto_334025 ) ) ( not ( = ?auto_334016 ?auto_334026 ) ) ( not ( = ?auto_334016 ?auto_334027 ) ) ( not ( = ?auto_334016 ?auto_334028 ) ) ( not ( = ?auto_334017 ?auto_334018 ) ) ( not ( = ?auto_334017 ?auto_334019 ) ) ( not ( = ?auto_334017 ?auto_334020 ) ) ( not ( = ?auto_334017 ?auto_334021 ) ) ( not ( = ?auto_334017 ?auto_334022 ) ) ( not ( = ?auto_334017 ?auto_334023 ) ) ( not ( = ?auto_334017 ?auto_334024 ) ) ( not ( = ?auto_334017 ?auto_334025 ) ) ( not ( = ?auto_334017 ?auto_334026 ) ) ( not ( = ?auto_334017 ?auto_334027 ) ) ( not ( = ?auto_334017 ?auto_334028 ) ) ( not ( = ?auto_334018 ?auto_334019 ) ) ( not ( = ?auto_334018 ?auto_334020 ) ) ( not ( = ?auto_334018 ?auto_334021 ) ) ( not ( = ?auto_334018 ?auto_334022 ) ) ( not ( = ?auto_334018 ?auto_334023 ) ) ( not ( = ?auto_334018 ?auto_334024 ) ) ( not ( = ?auto_334018 ?auto_334025 ) ) ( not ( = ?auto_334018 ?auto_334026 ) ) ( not ( = ?auto_334018 ?auto_334027 ) ) ( not ( = ?auto_334018 ?auto_334028 ) ) ( not ( = ?auto_334019 ?auto_334020 ) ) ( not ( = ?auto_334019 ?auto_334021 ) ) ( not ( = ?auto_334019 ?auto_334022 ) ) ( not ( = ?auto_334019 ?auto_334023 ) ) ( not ( = ?auto_334019 ?auto_334024 ) ) ( not ( = ?auto_334019 ?auto_334025 ) ) ( not ( = ?auto_334019 ?auto_334026 ) ) ( not ( = ?auto_334019 ?auto_334027 ) ) ( not ( = ?auto_334019 ?auto_334028 ) ) ( not ( = ?auto_334020 ?auto_334021 ) ) ( not ( = ?auto_334020 ?auto_334022 ) ) ( not ( = ?auto_334020 ?auto_334023 ) ) ( not ( = ?auto_334020 ?auto_334024 ) ) ( not ( = ?auto_334020 ?auto_334025 ) ) ( not ( = ?auto_334020 ?auto_334026 ) ) ( not ( = ?auto_334020 ?auto_334027 ) ) ( not ( = ?auto_334020 ?auto_334028 ) ) ( not ( = ?auto_334021 ?auto_334022 ) ) ( not ( = ?auto_334021 ?auto_334023 ) ) ( not ( = ?auto_334021 ?auto_334024 ) ) ( not ( = ?auto_334021 ?auto_334025 ) ) ( not ( = ?auto_334021 ?auto_334026 ) ) ( not ( = ?auto_334021 ?auto_334027 ) ) ( not ( = ?auto_334021 ?auto_334028 ) ) ( not ( = ?auto_334022 ?auto_334023 ) ) ( not ( = ?auto_334022 ?auto_334024 ) ) ( not ( = ?auto_334022 ?auto_334025 ) ) ( not ( = ?auto_334022 ?auto_334026 ) ) ( not ( = ?auto_334022 ?auto_334027 ) ) ( not ( = ?auto_334022 ?auto_334028 ) ) ( not ( = ?auto_334023 ?auto_334024 ) ) ( not ( = ?auto_334023 ?auto_334025 ) ) ( not ( = ?auto_334023 ?auto_334026 ) ) ( not ( = ?auto_334023 ?auto_334027 ) ) ( not ( = ?auto_334023 ?auto_334028 ) ) ( not ( = ?auto_334024 ?auto_334025 ) ) ( not ( = ?auto_334024 ?auto_334026 ) ) ( not ( = ?auto_334024 ?auto_334027 ) ) ( not ( = ?auto_334024 ?auto_334028 ) ) ( not ( = ?auto_334025 ?auto_334026 ) ) ( not ( = ?auto_334025 ?auto_334027 ) ) ( not ( = ?auto_334025 ?auto_334028 ) ) ( not ( = ?auto_334026 ?auto_334027 ) ) ( not ( = ?auto_334026 ?auto_334028 ) ) ( not ( = ?auto_334027 ?auto_334028 ) ) ( ON ?auto_334026 ?auto_334027 ) ( ON ?auto_334025 ?auto_334026 ) ( ON ?auto_334024 ?auto_334025 ) ( ON ?auto_334023 ?auto_334024 ) ( ON ?auto_334022 ?auto_334023 ) ( ON ?auto_334021 ?auto_334022 ) ( ON ?auto_334020 ?auto_334021 ) ( ON ?auto_334019 ?auto_334020 ) ( ON ?auto_334018 ?auto_334019 ) ( ON ?auto_334017 ?auto_334018 ) ( CLEAR ?auto_334015 ) ( ON ?auto_334016 ?auto_334017 ) ( CLEAR ?auto_334016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_334015 ?auto_334016 )
      ( MAKE-13PILE ?auto_334015 ?auto_334016 ?auto_334017 ?auto_334018 ?auto_334019 ?auto_334020 ?auto_334021 ?auto_334022 ?auto_334023 ?auto_334024 ?auto_334025 ?auto_334026 ?auto_334027 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_334042 - BLOCK
      ?auto_334043 - BLOCK
      ?auto_334044 - BLOCK
      ?auto_334045 - BLOCK
      ?auto_334046 - BLOCK
      ?auto_334047 - BLOCK
      ?auto_334048 - BLOCK
      ?auto_334049 - BLOCK
      ?auto_334050 - BLOCK
      ?auto_334051 - BLOCK
      ?auto_334052 - BLOCK
      ?auto_334053 - BLOCK
      ?auto_334054 - BLOCK
    )
    :vars
    (
      ?auto_334055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334054 ?auto_334055 ) ( not ( = ?auto_334042 ?auto_334043 ) ) ( not ( = ?auto_334042 ?auto_334044 ) ) ( not ( = ?auto_334042 ?auto_334045 ) ) ( not ( = ?auto_334042 ?auto_334046 ) ) ( not ( = ?auto_334042 ?auto_334047 ) ) ( not ( = ?auto_334042 ?auto_334048 ) ) ( not ( = ?auto_334042 ?auto_334049 ) ) ( not ( = ?auto_334042 ?auto_334050 ) ) ( not ( = ?auto_334042 ?auto_334051 ) ) ( not ( = ?auto_334042 ?auto_334052 ) ) ( not ( = ?auto_334042 ?auto_334053 ) ) ( not ( = ?auto_334042 ?auto_334054 ) ) ( not ( = ?auto_334042 ?auto_334055 ) ) ( not ( = ?auto_334043 ?auto_334044 ) ) ( not ( = ?auto_334043 ?auto_334045 ) ) ( not ( = ?auto_334043 ?auto_334046 ) ) ( not ( = ?auto_334043 ?auto_334047 ) ) ( not ( = ?auto_334043 ?auto_334048 ) ) ( not ( = ?auto_334043 ?auto_334049 ) ) ( not ( = ?auto_334043 ?auto_334050 ) ) ( not ( = ?auto_334043 ?auto_334051 ) ) ( not ( = ?auto_334043 ?auto_334052 ) ) ( not ( = ?auto_334043 ?auto_334053 ) ) ( not ( = ?auto_334043 ?auto_334054 ) ) ( not ( = ?auto_334043 ?auto_334055 ) ) ( not ( = ?auto_334044 ?auto_334045 ) ) ( not ( = ?auto_334044 ?auto_334046 ) ) ( not ( = ?auto_334044 ?auto_334047 ) ) ( not ( = ?auto_334044 ?auto_334048 ) ) ( not ( = ?auto_334044 ?auto_334049 ) ) ( not ( = ?auto_334044 ?auto_334050 ) ) ( not ( = ?auto_334044 ?auto_334051 ) ) ( not ( = ?auto_334044 ?auto_334052 ) ) ( not ( = ?auto_334044 ?auto_334053 ) ) ( not ( = ?auto_334044 ?auto_334054 ) ) ( not ( = ?auto_334044 ?auto_334055 ) ) ( not ( = ?auto_334045 ?auto_334046 ) ) ( not ( = ?auto_334045 ?auto_334047 ) ) ( not ( = ?auto_334045 ?auto_334048 ) ) ( not ( = ?auto_334045 ?auto_334049 ) ) ( not ( = ?auto_334045 ?auto_334050 ) ) ( not ( = ?auto_334045 ?auto_334051 ) ) ( not ( = ?auto_334045 ?auto_334052 ) ) ( not ( = ?auto_334045 ?auto_334053 ) ) ( not ( = ?auto_334045 ?auto_334054 ) ) ( not ( = ?auto_334045 ?auto_334055 ) ) ( not ( = ?auto_334046 ?auto_334047 ) ) ( not ( = ?auto_334046 ?auto_334048 ) ) ( not ( = ?auto_334046 ?auto_334049 ) ) ( not ( = ?auto_334046 ?auto_334050 ) ) ( not ( = ?auto_334046 ?auto_334051 ) ) ( not ( = ?auto_334046 ?auto_334052 ) ) ( not ( = ?auto_334046 ?auto_334053 ) ) ( not ( = ?auto_334046 ?auto_334054 ) ) ( not ( = ?auto_334046 ?auto_334055 ) ) ( not ( = ?auto_334047 ?auto_334048 ) ) ( not ( = ?auto_334047 ?auto_334049 ) ) ( not ( = ?auto_334047 ?auto_334050 ) ) ( not ( = ?auto_334047 ?auto_334051 ) ) ( not ( = ?auto_334047 ?auto_334052 ) ) ( not ( = ?auto_334047 ?auto_334053 ) ) ( not ( = ?auto_334047 ?auto_334054 ) ) ( not ( = ?auto_334047 ?auto_334055 ) ) ( not ( = ?auto_334048 ?auto_334049 ) ) ( not ( = ?auto_334048 ?auto_334050 ) ) ( not ( = ?auto_334048 ?auto_334051 ) ) ( not ( = ?auto_334048 ?auto_334052 ) ) ( not ( = ?auto_334048 ?auto_334053 ) ) ( not ( = ?auto_334048 ?auto_334054 ) ) ( not ( = ?auto_334048 ?auto_334055 ) ) ( not ( = ?auto_334049 ?auto_334050 ) ) ( not ( = ?auto_334049 ?auto_334051 ) ) ( not ( = ?auto_334049 ?auto_334052 ) ) ( not ( = ?auto_334049 ?auto_334053 ) ) ( not ( = ?auto_334049 ?auto_334054 ) ) ( not ( = ?auto_334049 ?auto_334055 ) ) ( not ( = ?auto_334050 ?auto_334051 ) ) ( not ( = ?auto_334050 ?auto_334052 ) ) ( not ( = ?auto_334050 ?auto_334053 ) ) ( not ( = ?auto_334050 ?auto_334054 ) ) ( not ( = ?auto_334050 ?auto_334055 ) ) ( not ( = ?auto_334051 ?auto_334052 ) ) ( not ( = ?auto_334051 ?auto_334053 ) ) ( not ( = ?auto_334051 ?auto_334054 ) ) ( not ( = ?auto_334051 ?auto_334055 ) ) ( not ( = ?auto_334052 ?auto_334053 ) ) ( not ( = ?auto_334052 ?auto_334054 ) ) ( not ( = ?auto_334052 ?auto_334055 ) ) ( not ( = ?auto_334053 ?auto_334054 ) ) ( not ( = ?auto_334053 ?auto_334055 ) ) ( not ( = ?auto_334054 ?auto_334055 ) ) ( ON ?auto_334053 ?auto_334054 ) ( ON ?auto_334052 ?auto_334053 ) ( ON ?auto_334051 ?auto_334052 ) ( ON ?auto_334050 ?auto_334051 ) ( ON ?auto_334049 ?auto_334050 ) ( ON ?auto_334048 ?auto_334049 ) ( ON ?auto_334047 ?auto_334048 ) ( ON ?auto_334046 ?auto_334047 ) ( ON ?auto_334045 ?auto_334046 ) ( ON ?auto_334044 ?auto_334045 ) ( ON ?auto_334043 ?auto_334044 ) ( ON ?auto_334042 ?auto_334043 ) ( CLEAR ?auto_334042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_334042 )
      ( MAKE-13PILE ?auto_334042 ?auto_334043 ?auto_334044 ?auto_334045 ?auto_334046 ?auto_334047 ?auto_334048 ?auto_334049 ?auto_334050 ?auto_334051 ?auto_334052 ?auto_334053 ?auto_334054 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_334069 - BLOCK
      ?auto_334070 - BLOCK
      ?auto_334071 - BLOCK
      ?auto_334072 - BLOCK
      ?auto_334073 - BLOCK
      ?auto_334074 - BLOCK
      ?auto_334075 - BLOCK
      ?auto_334076 - BLOCK
      ?auto_334077 - BLOCK
      ?auto_334078 - BLOCK
      ?auto_334079 - BLOCK
      ?auto_334080 - BLOCK
      ?auto_334081 - BLOCK
    )
    :vars
    (
      ?auto_334082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334081 ?auto_334082 ) ( not ( = ?auto_334069 ?auto_334070 ) ) ( not ( = ?auto_334069 ?auto_334071 ) ) ( not ( = ?auto_334069 ?auto_334072 ) ) ( not ( = ?auto_334069 ?auto_334073 ) ) ( not ( = ?auto_334069 ?auto_334074 ) ) ( not ( = ?auto_334069 ?auto_334075 ) ) ( not ( = ?auto_334069 ?auto_334076 ) ) ( not ( = ?auto_334069 ?auto_334077 ) ) ( not ( = ?auto_334069 ?auto_334078 ) ) ( not ( = ?auto_334069 ?auto_334079 ) ) ( not ( = ?auto_334069 ?auto_334080 ) ) ( not ( = ?auto_334069 ?auto_334081 ) ) ( not ( = ?auto_334069 ?auto_334082 ) ) ( not ( = ?auto_334070 ?auto_334071 ) ) ( not ( = ?auto_334070 ?auto_334072 ) ) ( not ( = ?auto_334070 ?auto_334073 ) ) ( not ( = ?auto_334070 ?auto_334074 ) ) ( not ( = ?auto_334070 ?auto_334075 ) ) ( not ( = ?auto_334070 ?auto_334076 ) ) ( not ( = ?auto_334070 ?auto_334077 ) ) ( not ( = ?auto_334070 ?auto_334078 ) ) ( not ( = ?auto_334070 ?auto_334079 ) ) ( not ( = ?auto_334070 ?auto_334080 ) ) ( not ( = ?auto_334070 ?auto_334081 ) ) ( not ( = ?auto_334070 ?auto_334082 ) ) ( not ( = ?auto_334071 ?auto_334072 ) ) ( not ( = ?auto_334071 ?auto_334073 ) ) ( not ( = ?auto_334071 ?auto_334074 ) ) ( not ( = ?auto_334071 ?auto_334075 ) ) ( not ( = ?auto_334071 ?auto_334076 ) ) ( not ( = ?auto_334071 ?auto_334077 ) ) ( not ( = ?auto_334071 ?auto_334078 ) ) ( not ( = ?auto_334071 ?auto_334079 ) ) ( not ( = ?auto_334071 ?auto_334080 ) ) ( not ( = ?auto_334071 ?auto_334081 ) ) ( not ( = ?auto_334071 ?auto_334082 ) ) ( not ( = ?auto_334072 ?auto_334073 ) ) ( not ( = ?auto_334072 ?auto_334074 ) ) ( not ( = ?auto_334072 ?auto_334075 ) ) ( not ( = ?auto_334072 ?auto_334076 ) ) ( not ( = ?auto_334072 ?auto_334077 ) ) ( not ( = ?auto_334072 ?auto_334078 ) ) ( not ( = ?auto_334072 ?auto_334079 ) ) ( not ( = ?auto_334072 ?auto_334080 ) ) ( not ( = ?auto_334072 ?auto_334081 ) ) ( not ( = ?auto_334072 ?auto_334082 ) ) ( not ( = ?auto_334073 ?auto_334074 ) ) ( not ( = ?auto_334073 ?auto_334075 ) ) ( not ( = ?auto_334073 ?auto_334076 ) ) ( not ( = ?auto_334073 ?auto_334077 ) ) ( not ( = ?auto_334073 ?auto_334078 ) ) ( not ( = ?auto_334073 ?auto_334079 ) ) ( not ( = ?auto_334073 ?auto_334080 ) ) ( not ( = ?auto_334073 ?auto_334081 ) ) ( not ( = ?auto_334073 ?auto_334082 ) ) ( not ( = ?auto_334074 ?auto_334075 ) ) ( not ( = ?auto_334074 ?auto_334076 ) ) ( not ( = ?auto_334074 ?auto_334077 ) ) ( not ( = ?auto_334074 ?auto_334078 ) ) ( not ( = ?auto_334074 ?auto_334079 ) ) ( not ( = ?auto_334074 ?auto_334080 ) ) ( not ( = ?auto_334074 ?auto_334081 ) ) ( not ( = ?auto_334074 ?auto_334082 ) ) ( not ( = ?auto_334075 ?auto_334076 ) ) ( not ( = ?auto_334075 ?auto_334077 ) ) ( not ( = ?auto_334075 ?auto_334078 ) ) ( not ( = ?auto_334075 ?auto_334079 ) ) ( not ( = ?auto_334075 ?auto_334080 ) ) ( not ( = ?auto_334075 ?auto_334081 ) ) ( not ( = ?auto_334075 ?auto_334082 ) ) ( not ( = ?auto_334076 ?auto_334077 ) ) ( not ( = ?auto_334076 ?auto_334078 ) ) ( not ( = ?auto_334076 ?auto_334079 ) ) ( not ( = ?auto_334076 ?auto_334080 ) ) ( not ( = ?auto_334076 ?auto_334081 ) ) ( not ( = ?auto_334076 ?auto_334082 ) ) ( not ( = ?auto_334077 ?auto_334078 ) ) ( not ( = ?auto_334077 ?auto_334079 ) ) ( not ( = ?auto_334077 ?auto_334080 ) ) ( not ( = ?auto_334077 ?auto_334081 ) ) ( not ( = ?auto_334077 ?auto_334082 ) ) ( not ( = ?auto_334078 ?auto_334079 ) ) ( not ( = ?auto_334078 ?auto_334080 ) ) ( not ( = ?auto_334078 ?auto_334081 ) ) ( not ( = ?auto_334078 ?auto_334082 ) ) ( not ( = ?auto_334079 ?auto_334080 ) ) ( not ( = ?auto_334079 ?auto_334081 ) ) ( not ( = ?auto_334079 ?auto_334082 ) ) ( not ( = ?auto_334080 ?auto_334081 ) ) ( not ( = ?auto_334080 ?auto_334082 ) ) ( not ( = ?auto_334081 ?auto_334082 ) ) ( ON ?auto_334080 ?auto_334081 ) ( ON ?auto_334079 ?auto_334080 ) ( ON ?auto_334078 ?auto_334079 ) ( ON ?auto_334077 ?auto_334078 ) ( ON ?auto_334076 ?auto_334077 ) ( ON ?auto_334075 ?auto_334076 ) ( ON ?auto_334074 ?auto_334075 ) ( ON ?auto_334073 ?auto_334074 ) ( ON ?auto_334072 ?auto_334073 ) ( ON ?auto_334071 ?auto_334072 ) ( ON ?auto_334070 ?auto_334071 ) ( ON ?auto_334069 ?auto_334070 ) ( CLEAR ?auto_334069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_334069 )
      ( MAKE-13PILE ?auto_334069 ?auto_334070 ?auto_334071 ?auto_334072 ?auto_334073 ?auto_334074 ?auto_334075 ?auto_334076 ?auto_334077 ?auto_334078 ?auto_334079 ?auto_334080 ?auto_334081 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334097 - BLOCK
      ?auto_334098 - BLOCK
      ?auto_334099 - BLOCK
      ?auto_334100 - BLOCK
      ?auto_334101 - BLOCK
      ?auto_334102 - BLOCK
      ?auto_334103 - BLOCK
      ?auto_334104 - BLOCK
      ?auto_334105 - BLOCK
      ?auto_334106 - BLOCK
      ?auto_334107 - BLOCK
      ?auto_334108 - BLOCK
      ?auto_334109 - BLOCK
      ?auto_334110 - BLOCK
    )
    :vars
    (
      ?auto_334111 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_334109 ) ( ON ?auto_334110 ?auto_334111 ) ( CLEAR ?auto_334110 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_334097 ) ( ON ?auto_334098 ?auto_334097 ) ( ON ?auto_334099 ?auto_334098 ) ( ON ?auto_334100 ?auto_334099 ) ( ON ?auto_334101 ?auto_334100 ) ( ON ?auto_334102 ?auto_334101 ) ( ON ?auto_334103 ?auto_334102 ) ( ON ?auto_334104 ?auto_334103 ) ( ON ?auto_334105 ?auto_334104 ) ( ON ?auto_334106 ?auto_334105 ) ( ON ?auto_334107 ?auto_334106 ) ( ON ?auto_334108 ?auto_334107 ) ( ON ?auto_334109 ?auto_334108 ) ( not ( = ?auto_334097 ?auto_334098 ) ) ( not ( = ?auto_334097 ?auto_334099 ) ) ( not ( = ?auto_334097 ?auto_334100 ) ) ( not ( = ?auto_334097 ?auto_334101 ) ) ( not ( = ?auto_334097 ?auto_334102 ) ) ( not ( = ?auto_334097 ?auto_334103 ) ) ( not ( = ?auto_334097 ?auto_334104 ) ) ( not ( = ?auto_334097 ?auto_334105 ) ) ( not ( = ?auto_334097 ?auto_334106 ) ) ( not ( = ?auto_334097 ?auto_334107 ) ) ( not ( = ?auto_334097 ?auto_334108 ) ) ( not ( = ?auto_334097 ?auto_334109 ) ) ( not ( = ?auto_334097 ?auto_334110 ) ) ( not ( = ?auto_334097 ?auto_334111 ) ) ( not ( = ?auto_334098 ?auto_334099 ) ) ( not ( = ?auto_334098 ?auto_334100 ) ) ( not ( = ?auto_334098 ?auto_334101 ) ) ( not ( = ?auto_334098 ?auto_334102 ) ) ( not ( = ?auto_334098 ?auto_334103 ) ) ( not ( = ?auto_334098 ?auto_334104 ) ) ( not ( = ?auto_334098 ?auto_334105 ) ) ( not ( = ?auto_334098 ?auto_334106 ) ) ( not ( = ?auto_334098 ?auto_334107 ) ) ( not ( = ?auto_334098 ?auto_334108 ) ) ( not ( = ?auto_334098 ?auto_334109 ) ) ( not ( = ?auto_334098 ?auto_334110 ) ) ( not ( = ?auto_334098 ?auto_334111 ) ) ( not ( = ?auto_334099 ?auto_334100 ) ) ( not ( = ?auto_334099 ?auto_334101 ) ) ( not ( = ?auto_334099 ?auto_334102 ) ) ( not ( = ?auto_334099 ?auto_334103 ) ) ( not ( = ?auto_334099 ?auto_334104 ) ) ( not ( = ?auto_334099 ?auto_334105 ) ) ( not ( = ?auto_334099 ?auto_334106 ) ) ( not ( = ?auto_334099 ?auto_334107 ) ) ( not ( = ?auto_334099 ?auto_334108 ) ) ( not ( = ?auto_334099 ?auto_334109 ) ) ( not ( = ?auto_334099 ?auto_334110 ) ) ( not ( = ?auto_334099 ?auto_334111 ) ) ( not ( = ?auto_334100 ?auto_334101 ) ) ( not ( = ?auto_334100 ?auto_334102 ) ) ( not ( = ?auto_334100 ?auto_334103 ) ) ( not ( = ?auto_334100 ?auto_334104 ) ) ( not ( = ?auto_334100 ?auto_334105 ) ) ( not ( = ?auto_334100 ?auto_334106 ) ) ( not ( = ?auto_334100 ?auto_334107 ) ) ( not ( = ?auto_334100 ?auto_334108 ) ) ( not ( = ?auto_334100 ?auto_334109 ) ) ( not ( = ?auto_334100 ?auto_334110 ) ) ( not ( = ?auto_334100 ?auto_334111 ) ) ( not ( = ?auto_334101 ?auto_334102 ) ) ( not ( = ?auto_334101 ?auto_334103 ) ) ( not ( = ?auto_334101 ?auto_334104 ) ) ( not ( = ?auto_334101 ?auto_334105 ) ) ( not ( = ?auto_334101 ?auto_334106 ) ) ( not ( = ?auto_334101 ?auto_334107 ) ) ( not ( = ?auto_334101 ?auto_334108 ) ) ( not ( = ?auto_334101 ?auto_334109 ) ) ( not ( = ?auto_334101 ?auto_334110 ) ) ( not ( = ?auto_334101 ?auto_334111 ) ) ( not ( = ?auto_334102 ?auto_334103 ) ) ( not ( = ?auto_334102 ?auto_334104 ) ) ( not ( = ?auto_334102 ?auto_334105 ) ) ( not ( = ?auto_334102 ?auto_334106 ) ) ( not ( = ?auto_334102 ?auto_334107 ) ) ( not ( = ?auto_334102 ?auto_334108 ) ) ( not ( = ?auto_334102 ?auto_334109 ) ) ( not ( = ?auto_334102 ?auto_334110 ) ) ( not ( = ?auto_334102 ?auto_334111 ) ) ( not ( = ?auto_334103 ?auto_334104 ) ) ( not ( = ?auto_334103 ?auto_334105 ) ) ( not ( = ?auto_334103 ?auto_334106 ) ) ( not ( = ?auto_334103 ?auto_334107 ) ) ( not ( = ?auto_334103 ?auto_334108 ) ) ( not ( = ?auto_334103 ?auto_334109 ) ) ( not ( = ?auto_334103 ?auto_334110 ) ) ( not ( = ?auto_334103 ?auto_334111 ) ) ( not ( = ?auto_334104 ?auto_334105 ) ) ( not ( = ?auto_334104 ?auto_334106 ) ) ( not ( = ?auto_334104 ?auto_334107 ) ) ( not ( = ?auto_334104 ?auto_334108 ) ) ( not ( = ?auto_334104 ?auto_334109 ) ) ( not ( = ?auto_334104 ?auto_334110 ) ) ( not ( = ?auto_334104 ?auto_334111 ) ) ( not ( = ?auto_334105 ?auto_334106 ) ) ( not ( = ?auto_334105 ?auto_334107 ) ) ( not ( = ?auto_334105 ?auto_334108 ) ) ( not ( = ?auto_334105 ?auto_334109 ) ) ( not ( = ?auto_334105 ?auto_334110 ) ) ( not ( = ?auto_334105 ?auto_334111 ) ) ( not ( = ?auto_334106 ?auto_334107 ) ) ( not ( = ?auto_334106 ?auto_334108 ) ) ( not ( = ?auto_334106 ?auto_334109 ) ) ( not ( = ?auto_334106 ?auto_334110 ) ) ( not ( = ?auto_334106 ?auto_334111 ) ) ( not ( = ?auto_334107 ?auto_334108 ) ) ( not ( = ?auto_334107 ?auto_334109 ) ) ( not ( = ?auto_334107 ?auto_334110 ) ) ( not ( = ?auto_334107 ?auto_334111 ) ) ( not ( = ?auto_334108 ?auto_334109 ) ) ( not ( = ?auto_334108 ?auto_334110 ) ) ( not ( = ?auto_334108 ?auto_334111 ) ) ( not ( = ?auto_334109 ?auto_334110 ) ) ( not ( = ?auto_334109 ?auto_334111 ) ) ( not ( = ?auto_334110 ?auto_334111 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_334110 ?auto_334111 )
      ( !STACK ?auto_334110 ?auto_334109 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334126 - BLOCK
      ?auto_334127 - BLOCK
      ?auto_334128 - BLOCK
      ?auto_334129 - BLOCK
      ?auto_334130 - BLOCK
      ?auto_334131 - BLOCK
      ?auto_334132 - BLOCK
      ?auto_334133 - BLOCK
      ?auto_334134 - BLOCK
      ?auto_334135 - BLOCK
      ?auto_334136 - BLOCK
      ?auto_334137 - BLOCK
      ?auto_334138 - BLOCK
      ?auto_334139 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_334138 ) ( ON-TABLE ?auto_334139 ) ( CLEAR ?auto_334139 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_334126 ) ( ON ?auto_334127 ?auto_334126 ) ( ON ?auto_334128 ?auto_334127 ) ( ON ?auto_334129 ?auto_334128 ) ( ON ?auto_334130 ?auto_334129 ) ( ON ?auto_334131 ?auto_334130 ) ( ON ?auto_334132 ?auto_334131 ) ( ON ?auto_334133 ?auto_334132 ) ( ON ?auto_334134 ?auto_334133 ) ( ON ?auto_334135 ?auto_334134 ) ( ON ?auto_334136 ?auto_334135 ) ( ON ?auto_334137 ?auto_334136 ) ( ON ?auto_334138 ?auto_334137 ) ( not ( = ?auto_334126 ?auto_334127 ) ) ( not ( = ?auto_334126 ?auto_334128 ) ) ( not ( = ?auto_334126 ?auto_334129 ) ) ( not ( = ?auto_334126 ?auto_334130 ) ) ( not ( = ?auto_334126 ?auto_334131 ) ) ( not ( = ?auto_334126 ?auto_334132 ) ) ( not ( = ?auto_334126 ?auto_334133 ) ) ( not ( = ?auto_334126 ?auto_334134 ) ) ( not ( = ?auto_334126 ?auto_334135 ) ) ( not ( = ?auto_334126 ?auto_334136 ) ) ( not ( = ?auto_334126 ?auto_334137 ) ) ( not ( = ?auto_334126 ?auto_334138 ) ) ( not ( = ?auto_334126 ?auto_334139 ) ) ( not ( = ?auto_334127 ?auto_334128 ) ) ( not ( = ?auto_334127 ?auto_334129 ) ) ( not ( = ?auto_334127 ?auto_334130 ) ) ( not ( = ?auto_334127 ?auto_334131 ) ) ( not ( = ?auto_334127 ?auto_334132 ) ) ( not ( = ?auto_334127 ?auto_334133 ) ) ( not ( = ?auto_334127 ?auto_334134 ) ) ( not ( = ?auto_334127 ?auto_334135 ) ) ( not ( = ?auto_334127 ?auto_334136 ) ) ( not ( = ?auto_334127 ?auto_334137 ) ) ( not ( = ?auto_334127 ?auto_334138 ) ) ( not ( = ?auto_334127 ?auto_334139 ) ) ( not ( = ?auto_334128 ?auto_334129 ) ) ( not ( = ?auto_334128 ?auto_334130 ) ) ( not ( = ?auto_334128 ?auto_334131 ) ) ( not ( = ?auto_334128 ?auto_334132 ) ) ( not ( = ?auto_334128 ?auto_334133 ) ) ( not ( = ?auto_334128 ?auto_334134 ) ) ( not ( = ?auto_334128 ?auto_334135 ) ) ( not ( = ?auto_334128 ?auto_334136 ) ) ( not ( = ?auto_334128 ?auto_334137 ) ) ( not ( = ?auto_334128 ?auto_334138 ) ) ( not ( = ?auto_334128 ?auto_334139 ) ) ( not ( = ?auto_334129 ?auto_334130 ) ) ( not ( = ?auto_334129 ?auto_334131 ) ) ( not ( = ?auto_334129 ?auto_334132 ) ) ( not ( = ?auto_334129 ?auto_334133 ) ) ( not ( = ?auto_334129 ?auto_334134 ) ) ( not ( = ?auto_334129 ?auto_334135 ) ) ( not ( = ?auto_334129 ?auto_334136 ) ) ( not ( = ?auto_334129 ?auto_334137 ) ) ( not ( = ?auto_334129 ?auto_334138 ) ) ( not ( = ?auto_334129 ?auto_334139 ) ) ( not ( = ?auto_334130 ?auto_334131 ) ) ( not ( = ?auto_334130 ?auto_334132 ) ) ( not ( = ?auto_334130 ?auto_334133 ) ) ( not ( = ?auto_334130 ?auto_334134 ) ) ( not ( = ?auto_334130 ?auto_334135 ) ) ( not ( = ?auto_334130 ?auto_334136 ) ) ( not ( = ?auto_334130 ?auto_334137 ) ) ( not ( = ?auto_334130 ?auto_334138 ) ) ( not ( = ?auto_334130 ?auto_334139 ) ) ( not ( = ?auto_334131 ?auto_334132 ) ) ( not ( = ?auto_334131 ?auto_334133 ) ) ( not ( = ?auto_334131 ?auto_334134 ) ) ( not ( = ?auto_334131 ?auto_334135 ) ) ( not ( = ?auto_334131 ?auto_334136 ) ) ( not ( = ?auto_334131 ?auto_334137 ) ) ( not ( = ?auto_334131 ?auto_334138 ) ) ( not ( = ?auto_334131 ?auto_334139 ) ) ( not ( = ?auto_334132 ?auto_334133 ) ) ( not ( = ?auto_334132 ?auto_334134 ) ) ( not ( = ?auto_334132 ?auto_334135 ) ) ( not ( = ?auto_334132 ?auto_334136 ) ) ( not ( = ?auto_334132 ?auto_334137 ) ) ( not ( = ?auto_334132 ?auto_334138 ) ) ( not ( = ?auto_334132 ?auto_334139 ) ) ( not ( = ?auto_334133 ?auto_334134 ) ) ( not ( = ?auto_334133 ?auto_334135 ) ) ( not ( = ?auto_334133 ?auto_334136 ) ) ( not ( = ?auto_334133 ?auto_334137 ) ) ( not ( = ?auto_334133 ?auto_334138 ) ) ( not ( = ?auto_334133 ?auto_334139 ) ) ( not ( = ?auto_334134 ?auto_334135 ) ) ( not ( = ?auto_334134 ?auto_334136 ) ) ( not ( = ?auto_334134 ?auto_334137 ) ) ( not ( = ?auto_334134 ?auto_334138 ) ) ( not ( = ?auto_334134 ?auto_334139 ) ) ( not ( = ?auto_334135 ?auto_334136 ) ) ( not ( = ?auto_334135 ?auto_334137 ) ) ( not ( = ?auto_334135 ?auto_334138 ) ) ( not ( = ?auto_334135 ?auto_334139 ) ) ( not ( = ?auto_334136 ?auto_334137 ) ) ( not ( = ?auto_334136 ?auto_334138 ) ) ( not ( = ?auto_334136 ?auto_334139 ) ) ( not ( = ?auto_334137 ?auto_334138 ) ) ( not ( = ?auto_334137 ?auto_334139 ) ) ( not ( = ?auto_334138 ?auto_334139 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_334139 )
      ( !STACK ?auto_334139 ?auto_334138 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334154 - BLOCK
      ?auto_334155 - BLOCK
      ?auto_334156 - BLOCK
      ?auto_334157 - BLOCK
      ?auto_334158 - BLOCK
      ?auto_334159 - BLOCK
      ?auto_334160 - BLOCK
      ?auto_334161 - BLOCK
      ?auto_334162 - BLOCK
      ?auto_334163 - BLOCK
      ?auto_334164 - BLOCK
      ?auto_334165 - BLOCK
      ?auto_334166 - BLOCK
      ?auto_334167 - BLOCK
    )
    :vars
    (
      ?auto_334168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334167 ?auto_334168 ) ( ON-TABLE ?auto_334154 ) ( ON ?auto_334155 ?auto_334154 ) ( ON ?auto_334156 ?auto_334155 ) ( ON ?auto_334157 ?auto_334156 ) ( ON ?auto_334158 ?auto_334157 ) ( ON ?auto_334159 ?auto_334158 ) ( ON ?auto_334160 ?auto_334159 ) ( ON ?auto_334161 ?auto_334160 ) ( ON ?auto_334162 ?auto_334161 ) ( ON ?auto_334163 ?auto_334162 ) ( ON ?auto_334164 ?auto_334163 ) ( ON ?auto_334165 ?auto_334164 ) ( not ( = ?auto_334154 ?auto_334155 ) ) ( not ( = ?auto_334154 ?auto_334156 ) ) ( not ( = ?auto_334154 ?auto_334157 ) ) ( not ( = ?auto_334154 ?auto_334158 ) ) ( not ( = ?auto_334154 ?auto_334159 ) ) ( not ( = ?auto_334154 ?auto_334160 ) ) ( not ( = ?auto_334154 ?auto_334161 ) ) ( not ( = ?auto_334154 ?auto_334162 ) ) ( not ( = ?auto_334154 ?auto_334163 ) ) ( not ( = ?auto_334154 ?auto_334164 ) ) ( not ( = ?auto_334154 ?auto_334165 ) ) ( not ( = ?auto_334154 ?auto_334166 ) ) ( not ( = ?auto_334154 ?auto_334167 ) ) ( not ( = ?auto_334154 ?auto_334168 ) ) ( not ( = ?auto_334155 ?auto_334156 ) ) ( not ( = ?auto_334155 ?auto_334157 ) ) ( not ( = ?auto_334155 ?auto_334158 ) ) ( not ( = ?auto_334155 ?auto_334159 ) ) ( not ( = ?auto_334155 ?auto_334160 ) ) ( not ( = ?auto_334155 ?auto_334161 ) ) ( not ( = ?auto_334155 ?auto_334162 ) ) ( not ( = ?auto_334155 ?auto_334163 ) ) ( not ( = ?auto_334155 ?auto_334164 ) ) ( not ( = ?auto_334155 ?auto_334165 ) ) ( not ( = ?auto_334155 ?auto_334166 ) ) ( not ( = ?auto_334155 ?auto_334167 ) ) ( not ( = ?auto_334155 ?auto_334168 ) ) ( not ( = ?auto_334156 ?auto_334157 ) ) ( not ( = ?auto_334156 ?auto_334158 ) ) ( not ( = ?auto_334156 ?auto_334159 ) ) ( not ( = ?auto_334156 ?auto_334160 ) ) ( not ( = ?auto_334156 ?auto_334161 ) ) ( not ( = ?auto_334156 ?auto_334162 ) ) ( not ( = ?auto_334156 ?auto_334163 ) ) ( not ( = ?auto_334156 ?auto_334164 ) ) ( not ( = ?auto_334156 ?auto_334165 ) ) ( not ( = ?auto_334156 ?auto_334166 ) ) ( not ( = ?auto_334156 ?auto_334167 ) ) ( not ( = ?auto_334156 ?auto_334168 ) ) ( not ( = ?auto_334157 ?auto_334158 ) ) ( not ( = ?auto_334157 ?auto_334159 ) ) ( not ( = ?auto_334157 ?auto_334160 ) ) ( not ( = ?auto_334157 ?auto_334161 ) ) ( not ( = ?auto_334157 ?auto_334162 ) ) ( not ( = ?auto_334157 ?auto_334163 ) ) ( not ( = ?auto_334157 ?auto_334164 ) ) ( not ( = ?auto_334157 ?auto_334165 ) ) ( not ( = ?auto_334157 ?auto_334166 ) ) ( not ( = ?auto_334157 ?auto_334167 ) ) ( not ( = ?auto_334157 ?auto_334168 ) ) ( not ( = ?auto_334158 ?auto_334159 ) ) ( not ( = ?auto_334158 ?auto_334160 ) ) ( not ( = ?auto_334158 ?auto_334161 ) ) ( not ( = ?auto_334158 ?auto_334162 ) ) ( not ( = ?auto_334158 ?auto_334163 ) ) ( not ( = ?auto_334158 ?auto_334164 ) ) ( not ( = ?auto_334158 ?auto_334165 ) ) ( not ( = ?auto_334158 ?auto_334166 ) ) ( not ( = ?auto_334158 ?auto_334167 ) ) ( not ( = ?auto_334158 ?auto_334168 ) ) ( not ( = ?auto_334159 ?auto_334160 ) ) ( not ( = ?auto_334159 ?auto_334161 ) ) ( not ( = ?auto_334159 ?auto_334162 ) ) ( not ( = ?auto_334159 ?auto_334163 ) ) ( not ( = ?auto_334159 ?auto_334164 ) ) ( not ( = ?auto_334159 ?auto_334165 ) ) ( not ( = ?auto_334159 ?auto_334166 ) ) ( not ( = ?auto_334159 ?auto_334167 ) ) ( not ( = ?auto_334159 ?auto_334168 ) ) ( not ( = ?auto_334160 ?auto_334161 ) ) ( not ( = ?auto_334160 ?auto_334162 ) ) ( not ( = ?auto_334160 ?auto_334163 ) ) ( not ( = ?auto_334160 ?auto_334164 ) ) ( not ( = ?auto_334160 ?auto_334165 ) ) ( not ( = ?auto_334160 ?auto_334166 ) ) ( not ( = ?auto_334160 ?auto_334167 ) ) ( not ( = ?auto_334160 ?auto_334168 ) ) ( not ( = ?auto_334161 ?auto_334162 ) ) ( not ( = ?auto_334161 ?auto_334163 ) ) ( not ( = ?auto_334161 ?auto_334164 ) ) ( not ( = ?auto_334161 ?auto_334165 ) ) ( not ( = ?auto_334161 ?auto_334166 ) ) ( not ( = ?auto_334161 ?auto_334167 ) ) ( not ( = ?auto_334161 ?auto_334168 ) ) ( not ( = ?auto_334162 ?auto_334163 ) ) ( not ( = ?auto_334162 ?auto_334164 ) ) ( not ( = ?auto_334162 ?auto_334165 ) ) ( not ( = ?auto_334162 ?auto_334166 ) ) ( not ( = ?auto_334162 ?auto_334167 ) ) ( not ( = ?auto_334162 ?auto_334168 ) ) ( not ( = ?auto_334163 ?auto_334164 ) ) ( not ( = ?auto_334163 ?auto_334165 ) ) ( not ( = ?auto_334163 ?auto_334166 ) ) ( not ( = ?auto_334163 ?auto_334167 ) ) ( not ( = ?auto_334163 ?auto_334168 ) ) ( not ( = ?auto_334164 ?auto_334165 ) ) ( not ( = ?auto_334164 ?auto_334166 ) ) ( not ( = ?auto_334164 ?auto_334167 ) ) ( not ( = ?auto_334164 ?auto_334168 ) ) ( not ( = ?auto_334165 ?auto_334166 ) ) ( not ( = ?auto_334165 ?auto_334167 ) ) ( not ( = ?auto_334165 ?auto_334168 ) ) ( not ( = ?auto_334166 ?auto_334167 ) ) ( not ( = ?auto_334166 ?auto_334168 ) ) ( not ( = ?auto_334167 ?auto_334168 ) ) ( CLEAR ?auto_334165 ) ( ON ?auto_334166 ?auto_334167 ) ( CLEAR ?auto_334166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_334154 ?auto_334155 ?auto_334156 ?auto_334157 ?auto_334158 ?auto_334159 ?auto_334160 ?auto_334161 ?auto_334162 ?auto_334163 ?auto_334164 ?auto_334165 ?auto_334166 )
      ( MAKE-14PILE ?auto_334154 ?auto_334155 ?auto_334156 ?auto_334157 ?auto_334158 ?auto_334159 ?auto_334160 ?auto_334161 ?auto_334162 ?auto_334163 ?auto_334164 ?auto_334165 ?auto_334166 ?auto_334167 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334183 - BLOCK
      ?auto_334184 - BLOCK
      ?auto_334185 - BLOCK
      ?auto_334186 - BLOCK
      ?auto_334187 - BLOCK
      ?auto_334188 - BLOCK
      ?auto_334189 - BLOCK
      ?auto_334190 - BLOCK
      ?auto_334191 - BLOCK
      ?auto_334192 - BLOCK
      ?auto_334193 - BLOCK
      ?auto_334194 - BLOCK
      ?auto_334195 - BLOCK
      ?auto_334196 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_334196 ) ( ON-TABLE ?auto_334183 ) ( ON ?auto_334184 ?auto_334183 ) ( ON ?auto_334185 ?auto_334184 ) ( ON ?auto_334186 ?auto_334185 ) ( ON ?auto_334187 ?auto_334186 ) ( ON ?auto_334188 ?auto_334187 ) ( ON ?auto_334189 ?auto_334188 ) ( ON ?auto_334190 ?auto_334189 ) ( ON ?auto_334191 ?auto_334190 ) ( ON ?auto_334192 ?auto_334191 ) ( ON ?auto_334193 ?auto_334192 ) ( ON ?auto_334194 ?auto_334193 ) ( not ( = ?auto_334183 ?auto_334184 ) ) ( not ( = ?auto_334183 ?auto_334185 ) ) ( not ( = ?auto_334183 ?auto_334186 ) ) ( not ( = ?auto_334183 ?auto_334187 ) ) ( not ( = ?auto_334183 ?auto_334188 ) ) ( not ( = ?auto_334183 ?auto_334189 ) ) ( not ( = ?auto_334183 ?auto_334190 ) ) ( not ( = ?auto_334183 ?auto_334191 ) ) ( not ( = ?auto_334183 ?auto_334192 ) ) ( not ( = ?auto_334183 ?auto_334193 ) ) ( not ( = ?auto_334183 ?auto_334194 ) ) ( not ( = ?auto_334183 ?auto_334195 ) ) ( not ( = ?auto_334183 ?auto_334196 ) ) ( not ( = ?auto_334184 ?auto_334185 ) ) ( not ( = ?auto_334184 ?auto_334186 ) ) ( not ( = ?auto_334184 ?auto_334187 ) ) ( not ( = ?auto_334184 ?auto_334188 ) ) ( not ( = ?auto_334184 ?auto_334189 ) ) ( not ( = ?auto_334184 ?auto_334190 ) ) ( not ( = ?auto_334184 ?auto_334191 ) ) ( not ( = ?auto_334184 ?auto_334192 ) ) ( not ( = ?auto_334184 ?auto_334193 ) ) ( not ( = ?auto_334184 ?auto_334194 ) ) ( not ( = ?auto_334184 ?auto_334195 ) ) ( not ( = ?auto_334184 ?auto_334196 ) ) ( not ( = ?auto_334185 ?auto_334186 ) ) ( not ( = ?auto_334185 ?auto_334187 ) ) ( not ( = ?auto_334185 ?auto_334188 ) ) ( not ( = ?auto_334185 ?auto_334189 ) ) ( not ( = ?auto_334185 ?auto_334190 ) ) ( not ( = ?auto_334185 ?auto_334191 ) ) ( not ( = ?auto_334185 ?auto_334192 ) ) ( not ( = ?auto_334185 ?auto_334193 ) ) ( not ( = ?auto_334185 ?auto_334194 ) ) ( not ( = ?auto_334185 ?auto_334195 ) ) ( not ( = ?auto_334185 ?auto_334196 ) ) ( not ( = ?auto_334186 ?auto_334187 ) ) ( not ( = ?auto_334186 ?auto_334188 ) ) ( not ( = ?auto_334186 ?auto_334189 ) ) ( not ( = ?auto_334186 ?auto_334190 ) ) ( not ( = ?auto_334186 ?auto_334191 ) ) ( not ( = ?auto_334186 ?auto_334192 ) ) ( not ( = ?auto_334186 ?auto_334193 ) ) ( not ( = ?auto_334186 ?auto_334194 ) ) ( not ( = ?auto_334186 ?auto_334195 ) ) ( not ( = ?auto_334186 ?auto_334196 ) ) ( not ( = ?auto_334187 ?auto_334188 ) ) ( not ( = ?auto_334187 ?auto_334189 ) ) ( not ( = ?auto_334187 ?auto_334190 ) ) ( not ( = ?auto_334187 ?auto_334191 ) ) ( not ( = ?auto_334187 ?auto_334192 ) ) ( not ( = ?auto_334187 ?auto_334193 ) ) ( not ( = ?auto_334187 ?auto_334194 ) ) ( not ( = ?auto_334187 ?auto_334195 ) ) ( not ( = ?auto_334187 ?auto_334196 ) ) ( not ( = ?auto_334188 ?auto_334189 ) ) ( not ( = ?auto_334188 ?auto_334190 ) ) ( not ( = ?auto_334188 ?auto_334191 ) ) ( not ( = ?auto_334188 ?auto_334192 ) ) ( not ( = ?auto_334188 ?auto_334193 ) ) ( not ( = ?auto_334188 ?auto_334194 ) ) ( not ( = ?auto_334188 ?auto_334195 ) ) ( not ( = ?auto_334188 ?auto_334196 ) ) ( not ( = ?auto_334189 ?auto_334190 ) ) ( not ( = ?auto_334189 ?auto_334191 ) ) ( not ( = ?auto_334189 ?auto_334192 ) ) ( not ( = ?auto_334189 ?auto_334193 ) ) ( not ( = ?auto_334189 ?auto_334194 ) ) ( not ( = ?auto_334189 ?auto_334195 ) ) ( not ( = ?auto_334189 ?auto_334196 ) ) ( not ( = ?auto_334190 ?auto_334191 ) ) ( not ( = ?auto_334190 ?auto_334192 ) ) ( not ( = ?auto_334190 ?auto_334193 ) ) ( not ( = ?auto_334190 ?auto_334194 ) ) ( not ( = ?auto_334190 ?auto_334195 ) ) ( not ( = ?auto_334190 ?auto_334196 ) ) ( not ( = ?auto_334191 ?auto_334192 ) ) ( not ( = ?auto_334191 ?auto_334193 ) ) ( not ( = ?auto_334191 ?auto_334194 ) ) ( not ( = ?auto_334191 ?auto_334195 ) ) ( not ( = ?auto_334191 ?auto_334196 ) ) ( not ( = ?auto_334192 ?auto_334193 ) ) ( not ( = ?auto_334192 ?auto_334194 ) ) ( not ( = ?auto_334192 ?auto_334195 ) ) ( not ( = ?auto_334192 ?auto_334196 ) ) ( not ( = ?auto_334193 ?auto_334194 ) ) ( not ( = ?auto_334193 ?auto_334195 ) ) ( not ( = ?auto_334193 ?auto_334196 ) ) ( not ( = ?auto_334194 ?auto_334195 ) ) ( not ( = ?auto_334194 ?auto_334196 ) ) ( not ( = ?auto_334195 ?auto_334196 ) ) ( CLEAR ?auto_334194 ) ( ON ?auto_334195 ?auto_334196 ) ( CLEAR ?auto_334195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_334183 ?auto_334184 ?auto_334185 ?auto_334186 ?auto_334187 ?auto_334188 ?auto_334189 ?auto_334190 ?auto_334191 ?auto_334192 ?auto_334193 ?auto_334194 ?auto_334195 )
      ( MAKE-14PILE ?auto_334183 ?auto_334184 ?auto_334185 ?auto_334186 ?auto_334187 ?auto_334188 ?auto_334189 ?auto_334190 ?auto_334191 ?auto_334192 ?auto_334193 ?auto_334194 ?auto_334195 ?auto_334196 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334211 - BLOCK
      ?auto_334212 - BLOCK
      ?auto_334213 - BLOCK
      ?auto_334214 - BLOCK
      ?auto_334215 - BLOCK
      ?auto_334216 - BLOCK
      ?auto_334217 - BLOCK
      ?auto_334218 - BLOCK
      ?auto_334219 - BLOCK
      ?auto_334220 - BLOCK
      ?auto_334221 - BLOCK
      ?auto_334222 - BLOCK
      ?auto_334223 - BLOCK
      ?auto_334224 - BLOCK
    )
    :vars
    (
      ?auto_334225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334224 ?auto_334225 ) ( ON-TABLE ?auto_334211 ) ( ON ?auto_334212 ?auto_334211 ) ( ON ?auto_334213 ?auto_334212 ) ( ON ?auto_334214 ?auto_334213 ) ( ON ?auto_334215 ?auto_334214 ) ( ON ?auto_334216 ?auto_334215 ) ( ON ?auto_334217 ?auto_334216 ) ( ON ?auto_334218 ?auto_334217 ) ( ON ?auto_334219 ?auto_334218 ) ( ON ?auto_334220 ?auto_334219 ) ( ON ?auto_334221 ?auto_334220 ) ( not ( = ?auto_334211 ?auto_334212 ) ) ( not ( = ?auto_334211 ?auto_334213 ) ) ( not ( = ?auto_334211 ?auto_334214 ) ) ( not ( = ?auto_334211 ?auto_334215 ) ) ( not ( = ?auto_334211 ?auto_334216 ) ) ( not ( = ?auto_334211 ?auto_334217 ) ) ( not ( = ?auto_334211 ?auto_334218 ) ) ( not ( = ?auto_334211 ?auto_334219 ) ) ( not ( = ?auto_334211 ?auto_334220 ) ) ( not ( = ?auto_334211 ?auto_334221 ) ) ( not ( = ?auto_334211 ?auto_334222 ) ) ( not ( = ?auto_334211 ?auto_334223 ) ) ( not ( = ?auto_334211 ?auto_334224 ) ) ( not ( = ?auto_334211 ?auto_334225 ) ) ( not ( = ?auto_334212 ?auto_334213 ) ) ( not ( = ?auto_334212 ?auto_334214 ) ) ( not ( = ?auto_334212 ?auto_334215 ) ) ( not ( = ?auto_334212 ?auto_334216 ) ) ( not ( = ?auto_334212 ?auto_334217 ) ) ( not ( = ?auto_334212 ?auto_334218 ) ) ( not ( = ?auto_334212 ?auto_334219 ) ) ( not ( = ?auto_334212 ?auto_334220 ) ) ( not ( = ?auto_334212 ?auto_334221 ) ) ( not ( = ?auto_334212 ?auto_334222 ) ) ( not ( = ?auto_334212 ?auto_334223 ) ) ( not ( = ?auto_334212 ?auto_334224 ) ) ( not ( = ?auto_334212 ?auto_334225 ) ) ( not ( = ?auto_334213 ?auto_334214 ) ) ( not ( = ?auto_334213 ?auto_334215 ) ) ( not ( = ?auto_334213 ?auto_334216 ) ) ( not ( = ?auto_334213 ?auto_334217 ) ) ( not ( = ?auto_334213 ?auto_334218 ) ) ( not ( = ?auto_334213 ?auto_334219 ) ) ( not ( = ?auto_334213 ?auto_334220 ) ) ( not ( = ?auto_334213 ?auto_334221 ) ) ( not ( = ?auto_334213 ?auto_334222 ) ) ( not ( = ?auto_334213 ?auto_334223 ) ) ( not ( = ?auto_334213 ?auto_334224 ) ) ( not ( = ?auto_334213 ?auto_334225 ) ) ( not ( = ?auto_334214 ?auto_334215 ) ) ( not ( = ?auto_334214 ?auto_334216 ) ) ( not ( = ?auto_334214 ?auto_334217 ) ) ( not ( = ?auto_334214 ?auto_334218 ) ) ( not ( = ?auto_334214 ?auto_334219 ) ) ( not ( = ?auto_334214 ?auto_334220 ) ) ( not ( = ?auto_334214 ?auto_334221 ) ) ( not ( = ?auto_334214 ?auto_334222 ) ) ( not ( = ?auto_334214 ?auto_334223 ) ) ( not ( = ?auto_334214 ?auto_334224 ) ) ( not ( = ?auto_334214 ?auto_334225 ) ) ( not ( = ?auto_334215 ?auto_334216 ) ) ( not ( = ?auto_334215 ?auto_334217 ) ) ( not ( = ?auto_334215 ?auto_334218 ) ) ( not ( = ?auto_334215 ?auto_334219 ) ) ( not ( = ?auto_334215 ?auto_334220 ) ) ( not ( = ?auto_334215 ?auto_334221 ) ) ( not ( = ?auto_334215 ?auto_334222 ) ) ( not ( = ?auto_334215 ?auto_334223 ) ) ( not ( = ?auto_334215 ?auto_334224 ) ) ( not ( = ?auto_334215 ?auto_334225 ) ) ( not ( = ?auto_334216 ?auto_334217 ) ) ( not ( = ?auto_334216 ?auto_334218 ) ) ( not ( = ?auto_334216 ?auto_334219 ) ) ( not ( = ?auto_334216 ?auto_334220 ) ) ( not ( = ?auto_334216 ?auto_334221 ) ) ( not ( = ?auto_334216 ?auto_334222 ) ) ( not ( = ?auto_334216 ?auto_334223 ) ) ( not ( = ?auto_334216 ?auto_334224 ) ) ( not ( = ?auto_334216 ?auto_334225 ) ) ( not ( = ?auto_334217 ?auto_334218 ) ) ( not ( = ?auto_334217 ?auto_334219 ) ) ( not ( = ?auto_334217 ?auto_334220 ) ) ( not ( = ?auto_334217 ?auto_334221 ) ) ( not ( = ?auto_334217 ?auto_334222 ) ) ( not ( = ?auto_334217 ?auto_334223 ) ) ( not ( = ?auto_334217 ?auto_334224 ) ) ( not ( = ?auto_334217 ?auto_334225 ) ) ( not ( = ?auto_334218 ?auto_334219 ) ) ( not ( = ?auto_334218 ?auto_334220 ) ) ( not ( = ?auto_334218 ?auto_334221 ) ) ( not ( = ?auto_334218 ?auto_334222 ) ) ( not ( = ?auto_334218 ?auto_334223 ) ) ( not ( = ?auto_334218 ?auto_334224 ) ) ( not ( = ?auto_334218 ?auto_334225 ) ) ( not ( = ?auto_334219 ?auto_334220 ) ) ( not ( = ?auto_334219 ?auto_334221 ) ) ( not ( = ?auto_334219 ?auto_334222 ) ) ( not ( = ?auto_334219 ?auto_334223 ) ) ( not ( = ?auto_334219 ?auto_334224 ) ) ( not ( = ?auto_334219 ?auto_334225 ) ) ( not ( = ?auto_334220 ?auto_334221 ) ) ( not ( = ?auto_334220 ?auto_334222 ) ) ( not ( = ?auto_334220 ?auto_334223 ) ) ( not ( = ?auto_334220 ?auto_334224 ) ) ( not ( = ?auto_334220 ?auto_334225 ) ) ( not ( = ?auto_334221 ?auto_334222 ) ) ( not ( = ?auto_334221 ?auto_334223 ) ) ( not ( = ?auto_334221 ?auto_334224 ) ) ( not ( = ?auto_334221 ?auto_334225 ) ) ( not ( = ?auto_334222 ?auto_334223 ) ) ( not ( = ?auto_334222 ?auto_334224 ) ) ( not ( = ?auto_334222 ?auto_334225 ) ) ( not ( = ?auto_334223 ?auto_334224 ) ) ( not ( = ?auto_334223 ?auto_334225 ) ) ( not ( = ?auto_334224 ?auto_334225 ) ) ( ON ?auto_334223 ?auto_334224 ) ( CLEAR ?auto_334221 ) ( ON ?auto_334222 ?auto_334223 ) ( CLEAR ?auto_334222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_334211 ?auto_334212 ?auto_334213 ?auto_334214 ?auto_334215 ?auto_334216 ?auto_334217 ?auto_334218 ?auto_334219 ?auto_334220 ?auto_334221 ?auto_334222 )
      ( MAKE-14PILE ?auto_334211 ?auto_334212 ?auto_334213 ?auto_334214 ?auto_334215 ?auto_334216 ?auto_334217 ?auto_334218 ?auto_334219 ?auto_334220 ?auto_334221 ?auto_334222 ?auto_334223 ?auto_334224 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334240 - BLOCK
      ?auto_334241 - BLOCK
      ?auto_334242 - BLOCK
      ?auto_334243 - BLOCK
      ?auto_334244 - BLOCK
      ?auto_334245 - BLOCK
      ?auto_334246 - BLOCK
      ?auto_334247 - BLOCK
      ?auto_334248 - BLOCK
      ?auto_334249 - BLOCK
      ?auto_334250 - BLOCK
      ?auto_334251 - BLOCK
      ?auto_334252 - BLOCK
      ?auto_334253 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_334253 ) ( ON-TABLE ?auto_334240 ) ( ON ?auto_334241 ?auto_334240 ) ( ON ?auto_334242 ?auto_334241 ) ( ON ?auto_334243 ?auto_334242 ) ( ON ?auto_334244 ?auto_334243 ) ( ON ?auto_334245 ?auto_334244 ) ( ON ?auto_334246 ?auto_334245 ) ( ON ?auto_334247 ?auto_334246 ) ( ON ?auto_334248 ?auto_334247 ) ( ON ?auto_334249 ?auto_334248 ) ( ON ?auto_334250 ?auto_334249 ) ( not ( = ?auto_334240 ?auto_334241 ) ) ( not ( = ?auto_334240 ?auto_334242 ) ) ( not ( = ?auto_334240 ?auto_334243 ) ) ( not ( = ?auto_334240 ?auto_334244 ) ) ( not ( = ?auto_334240 ?auto_334245 ) ) ( not ( = ?auto_334240 ?auto_334246 ) ) ( not ( = ?auto_334240 ?auto_334247 ) ) ( not ( = ?auto_334240 ?auto_334248 ) ) ( not ( = ?auto_334240 ?auto_334249 ) ) ( not ( = ?auto_334240 ?auto_334250 ) ) ( not ( = ?auto_334240 ?auto_334251 ) ) ( not ( = ?auto_334240 ?auto_334252 ) ) ( not ( = ?auto_334240 ?auto_334253 ) ) ( not ( = ?auto_334241 ?auto_334242 ) ) ( not ( = ?auto_334241 ?auto_334243 ) ) ( not ( = ?auto_334241 ?auto_334244 ) ) ( not ( = ?auto_334241 ?auto_334245 ) ) ( not ( = ?auto_334241 ?auto_334246 ) ) ( not ( = ?auto_334241 ?auto_334247 ) ) ( not ( = ?auto_334241 ?auto_334248 ) ) ( not ( = ?auto_334241 ?auto_334249 ) ) ( not ( = ?auto_334241 ?auto_334250 ) ) ( not ( = ?auto_334241 ?auto_334251 ) ) ( not ( = ?auto_334241 ?auto_334252 ) ) ( not ( = ?auto_334241 ?auto_334253 ) ) ( not ( = ?auto_334242 ?auto_334243 ) ) ( not ( = ?auto_334242 ?auto_334244 ) ) ( not ( = ?auto_334242 ?auto_334245 ) ) ( not ( = ?auto_334242 ?auto_334246 ) ) ( not ( = ?auto_334242 ?auto_334247 ) ) ( not ( = ?auto_334242 ?auto_334248 ) ) ( not ( = ?auto_334242 ?auto_334249 ) ) ( not ( = ?auto_334242 ?auto_334250 ) ) ( not ( = ?auto_334242 ?auto_334251 ) ) ( not ( = ?auto_334242 ?auto_334252 ) ) ( not ( = ?auto_334242 ?auto_334253 ) ) ( not ( = ?auto_334243 ?auto_334244 ) ) ( not ( = ?auto_334243 ?auto_334245 ) ) ( not ( = ?auto_334243 ?auto_334246 ) ) ( not ( = ?auto_334243 ?auto_334247 ) ) ( not ( = ?auto_334243 ?auto_334248 ) ) ( not ( = ?auto_334243 ?auto_334249 ) ) ( not ( = ?auto_334243 ?auto_334250 ) ) ( not ( = ?auto_334243 ?auto_334251 ) ) ( not ( = ?auto_334243 ?auto_334252 ) ) ( not ( = ?auto_334243 ?auto_334253 ) ) ( not ( = ?auto_334244 ?auto_334245 ) ) ( not ( = ?auto_334244 ?auto_334246 ) ) ( not ( = ?auto_334244 ?auto_334247 ) ) ( not ( = ?auto_334244 ?auto_334248 ) ) ( not ( = ?auto_334244 ?auto_334249 ) ) ( not ( = ?auto_334244 ?auto_334250 ) ) ( not ( = ?auto_334244 ?auto_334251 ) ) ( not ( = ?auto_334244 ?auto_334252 ) ) ( not ( = ?auto_334244 ?auto_334253 ) ) ( not ( = ?auto_334245 ?auto_334246 ) ) ( not ( = ?auto_334245 ?auto_334247 ) ) ( not ( = ?auto_334245 ?auto_334248 ) ) ( not ( = ?auto_334245 ?auto_334249 ) ) ( not ( = ?auto_334245 ?auto_334250 ) ) ( not ( = ?auto_334245 ?auto_334251 ) ) ( not ( = ?auto_334245 ?auto_334252 ) ) ( not ( = ?auto_334245 ?auto_334253 ) ) ( not ( = ?auto_334246 ?auto_334247 ) ) ( not ( = ?auto_334246 ?auto_334248 ) ) ( not ( = ?auto_334246 ?auto_334249 ) ) ( not ( = ?auto_334246 ?auto_334250 ) ) ( not ( = ?auto_334246 ?auto_334251 ) ) ( not ( = ?auto_334246 ?auto_334252 ) ) ( not ( = ?auto_334246 ?auto_334253 ) ) ( not ( = ?auto_334247 ?auto_334248 ) ) ( not ( = ?auto_334247 ?auto_334249 ) ) ( not ( = ?auto_334247 ?auto_334250 ) ) ( not ( = ?auto_334247 ?auto_334251 ) ) ( not ( = ?auto_334247 ?auto_334252 ) ) ( not ( = ?auto_334247 ?auto_334253 ) ) ( not ( = ?auto_334248 ?auto_334249 ) ) ( not ( = ?auto_334248 ?auto_334250 ) ) ( not ( = ?auto_334248 ?auto_334251 ) ) ( not ( = ?auto_334248 ?auto_334252 ) ) ( not ( = ?auto_334248 ?auto_334253 ) ) ( not ( = ?auto_334249 ?auto_334250 ) ) ( not ( = ?auto_334249 ?auto_334251 ) ) ( not ( = ?auto_334249 ?auto_334252 ) ) ( not ( = ?auto_334249 ?auto_334253 ) ) ( not ( = ?auto_334250 ?auto_334251 ) ) ( not ( = ?auto_334250 ?auto_334252 ) ) ( not ( = ?auto_334250 ?auto_334253 ) ) ( not ( = ?auto_334251 ?auto_334252 ) ) ( not ( = ?auto_334251 ?auto_334253 ) ) ( not ( = ?auto_334252 ?auto_334253 ) ) ( ON ?auto_334252 ?auto_334253 ) ( CLEAR ?auto_334250 ) ( ON ?auto_334251 ?auto_334252 ) ( CLEAR ?auto_334251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_334240 ?auto_334241 ?auto_334242 ?auto_334243 ?auto_334244 ?auto_334245 ?auto_334246 ?auto_334247 ?auto_334248 ?auto_334249 ?auto_334250 ?auto_334251 )
      ( MAKE-14PILE ?auto_334240 ?auto_334241 ?auto_334242 ?auto_334243 ?auto_334244 ?auto_334245 ?auto_334246 ?auto_334247 ?auto_334248 ?auto_334249 ?auto_334250 ?auto_334251 ?auto_334252 ?auto_334253 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334268 - BLOCK
      ?auto_334269 - BLOCK
      ?auto_334270 - BLOCK
      ?auto_334271 - BLOCK
      ?auto_334272 - BLOCK
      ?auto_334273 - BLOCK
      ?auto_334274 - BLOCK
      ?auto_334275 - BLOCK
      ?auto_334276 - BLOCK
      ?auto_334277 - BLOCK
      ?auto_334278 - BLOCK
      ?auto_334279 - BLOCK
      ?auto_334280 - BLOCK
      ?auto_334281 - BLOCK
    )
    :vars
    (
      ?auto_334282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334281 ?auto_334282 ) ( ON-TABLE ?auto_334268 ) ( ON ?auto_334269 ?auto_334268 ) ( ON ?auto_334270 ?auto_334269 ) ( ON ?auto_334271 ?auto_334270 ) ( ON ?auto_334272 ?auto_334271 ) ( ON ?auto_334273 ?auto_334272 ) ( ON ?auto_334274 ?auto_334273 ) ( ON ?auto_334275 ?auto_334274 ) ( ON ?auto_334276 ?auto_334275 ) ( ON ?auto_334277 ?auto_334276 ) ( not ( = ?auto_334268 ?auto_334269 ) ) ( not ( = ?auto_334268 ?auto_334270 ) ) ( not ( = ?auto_334268 ?auto_334271 ) ) ( not ( = ?auto_334268 ?auto_334272 ) ) ( not ( = ?auto_334268 ?auto_334273 ) ) ( not ( = ?auto_334268 ?auto_334274 ) ) ( not ( = ?auto_334268 ?auto_334275 ) ) ( not ( = ?auto_334268 ?auto_334276 ) ) ( not ( = ?auto_334268 ?auto_334277 ) ) ( not ( = ?auto_334268 ?auto_334278 ) ) ( not ( = ?auto_334268 ?auto_334279 ) ) ( not ( = ?auto_334268 ?auto_334280 ) ) ( not ( = ?auto_334268 ?auto_334281 ) ) ( not ( = ?auto_334268 ?auto_334282 ) ) ( not ( = ?auto_334269 ?auto_334270 ) ) ( not ( = ?auto_334269 ?auto_334271 ) ) ( not ( = ?auto_334269 ?auto_334272 ) ) ( not ( = ?auto_334269 ?auto_334273 ) ) ( not ( = ?auto_334269 ?auto_334274 ) ) ( not ( = ?auto_334269 ?auto_334275 ) ) ( not ( = ?auto_334269 ?auto_334276 ) ) ( not ( = ?auto_334269 ?auto_334277 ) ) ( not ( = ?auto_334269 ?auto_334278 ) ) ( not ( = ?auto_334269 ?auto_334279 ) ) ( not ( = ?auto_334269 ?auto_334280 ) ) ( not ( = ?auto_334269 ?auto_334281 ) ) ( not ( = ?auto_334269 ?auto_334282 ) ) ( not ( = ?auto_334270 ?auto_334271 ) ) ( not ( = ?auto_334270 ?auto_334272 ) ) ( not ( = ?auto_334270 ?auto_334273 ) ) ( not ( = ?auto_334270 ?auto_334274 ) ) ( not ( = ?auto_334270 ?auto_334275 ) ) ( not ( = ?auto_334270 ?auto_334276 ) ) ( not ( = ?auto_334270 ?auto_334277 ) ) ( not ( = ?auto_334270 ?auto_334278 ) ) ( not ( = ?auto_334270 ?auto_334279 ) ) ( not ( = ?auto_334270 ?auto_334280 ) ) ( not ( = ?auto_334270 ?auto_334281 ) ) ( not ( = ?auto_334270 ?auto_334282 ) ) ( not ( = ?auto_334271 ?auto_334272 ) ) ( not ( = ?auto_334271 ?auto_334273 ) ) ( not ( = ?auto_334271 ?auto_334274 ) ) ( not ( = ?auto_334271 ?auto_334275 ) ) ( not ( = ?auto_334271 ?auto_334276 ) ) ( not ( = ?auto_334271 ?auto_334277 ) ) ( not ( = ?auto_334271 ?auto_334278 ) ) ( not ( = ?auto_334271 ?auto_334279 ) ) ( not ( = ?auto_334271 ?auto_334280 ) ) ( not ( = ?auto_334271 ?auto_334281 ) ) ( not ( = ?auto_334271 ?auto_334282 ) ) ( not ( = ?auto_334272 ?auto_334273 ) ) ( not ( = ?auto_334272 ?auto_334274 ) ) ( not ( = ?auto_334272 ?auto_334275 ) ) ( not ( = ?auto_334272 ?auto_334276 ) ) ( not ( = ?auto_334272 ?auto_334277 ) ) ( not ( = ?auto_334272 ?auto_334278 ) ) ( not ( = ?auto_334272 ?auto_334279 ) ) ( not ( = ?auto_334272 ?auto_334280 ) ) ( not ( = ?auto_334272 ?auto_334281 ) ) ( not ( = ?auto_334272 ?auto_334282 ) ) ( not ( = ?auto_334273 ?auto_334274 ) ) ( not ( = ?auto_334273 ?auto_334275 ) ) ( not ( = ?auto_334273 ?auto_334276 ) ) ( not ( = ?auto_334273 ?auto_334277 ) ) ( not ( = ?auto_334273 ?auto_334278 ) ) ( not ( = ?auto_334273 ?auto_334279 ) ) ( not ( = ?auto_334273 ?auto_334280 ) ) ( not ( = ?auto_334273 ?auto_334281 ) ) ( not ( = ?auto_334273 ?auto_334282 ) ) ( not ( = ?auto_334274 ?auto_334275 ) ) ( not ( = ?auto_334274 ?auto_334276 ) ) ( not ( = ?auto_334274 ?auto_334277 ) ) ( not ( = ?auto_334274 ?auto_334278 ) ) ( not ( = ?auto_334274 ?auto_334279 ) ) ( not ( = ?auto_334274 ?auto_334280 ) ) ( not ( = ?auto_334274 ?auto_334281 ) ) ( not ( = ?auto_334274 ?auto_334282 ) ) ( not ( = ?auto_334275 ?auto_334276 ) ) ( not ( = ?auto_334275 ?auto_334277 ) ) ( not ( = ?auto_334275 ?auto_334278 ) ) ( not ( = ?auto_334275 ?auto_334279 ) ) ( not ( = ?auto_334275 ?auto_334280 ) ) ( not ( = ?auto_334275 ?auto_334281 ) ) ( not ( = ?auto_334275 ?auto_334282 ) ) ( not ( = ?auto_334276 ?auto_334277 ) ) ( not ( = ?auto_334276 ?auto_334278 ) ) ( not ( = ?auto_334276 ?auto_334279 ) ) ( not ( = ?auto_334276 ?auto_334280 ) ) ( not ( = ?auto_334276 ?auto_334281 ) ) ( not ( = ?auto_334276 ?auto_334282 ) ) ( not ( = ?auto_334277 ?auto_334278 ) ) ( not ( = ?auto_334277 ?auto_334279 ) ) ( not ( = ?auto_334277 ?auto_334280 ) ) ( not ( = ?auto_334277 ?auto_334281 ) ) ( not ( = ?auto_334277 ?auto_334282 ) ) ( not ( = ?auto_334278 ?auto_334279 ) ) ( not ( = ?auto_334278 ?auto_334280 ) ) ( not ( = ?auto_334278 ?auto_334281 ) ) ( not ( = ?auto_334278 ?auto_334282 ) ) ( not ( = ?auto_334279 ?auto_334280 ) ) ( not ( = ?auto_334279 ?auto_334281 ) ) ( not ( = ?auto_334279 ?auto_334282 ) ) ( not ( = ?auto_334280 ?auto_334281 ) ) ( not ( = ?auto_334280 ?auto_334282 ) ) ( not ( = ?auto_334281 ?auto_334282 ) ) ( ON ?auto_334280 ?auto_334281 ) ( ON ?auto_334279 ?auto_334280 ) ( CLEAR ?auto_334277 ) ( ON ?auto_334278 ?auto_334279 ) ( CLEAR ?auto_334278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_334268 ?auto_334269 ?auto_334270 ?auto_334271 ?auto_334272 ?auto_334273 ?auto_334274 ?auto_334275 ?auto_334276 ?auto_334277 ?auto_334278 )
      ( MAKE-14PILE ?auto_334268 ?auto_334269 ?auto_334270 ?auto_334271 ?auto_334272 ?auto_334273 ?auto_334274 ?auto_334275 ?auto_334276 ?auto_334277 ?auto_334278 ?auto_334279 ?auto_334280 ?auto_334281 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334297 - BLOCK
      ?auto_334298 - BLOCK
      ?auto_334299 - BLOCK
      ?auto_334300 - BLOCK
      ?auto_334301 - BLOCK
      ?auto_334302 - BLOCK
      ?auto_334303 - BLOCK
      ?auto_334304 - BLOCK
      ?auto_334305 - BLOCK
      ?auto_334306 - BLOCK
      ?auto_334307 - BLOCK
      ?auto_334308 - BLOCK
      ?auto_334309 - BLOCK
      ?auto_334310 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_334310 ) ( ON-TABLE ?auto_334297 ) ( ON ?auto_334298 ?auto_334297 ) ( ON ?auto_334299 ?auto_334298 ) ( ON ?auto_334300 ?auto_334299 ) ( ON ?auto_334301 ?auto_334300 ) ( ON ?auto_334302 ?auto_334301 ) ( ON ?auto_334303 ?auto_334302 ) ( ON ?auto_334304 ?auto_334303 ) ( ON ?auto_334305 ?auto_334304 ) ( ON ?auto_334306 ?auto_334305 ) ( not ( = ?auto_334297 ?auto_334298 ) ) ( not ( = ?auto_334297 ?auto_334299 ) ) ( not ( = ?auto_334297 ?auto_334300 ) ) ( not ( = ?auto_334297 ?auto_334301 ) ) ( not ( = ?auto_334297 ?auto_334302 ) ) ( not ( = ?auto_334297 ?auto_334303 ) ) ( not ( = ?auto_334297 ?auto_334304 ) ) ( not ( = ?auto_334297 ?auto_334305 ) ) ( not ( = ?auto_334297 ?auto_334306 ) ) ( not ( = ?auto_334297 ?auto_334307 ) ) ( not ( = ?auto_334297 ?auto_334308 ) ) ( not ( = ?auto_334297 ?auto_334309 ) ) ( not ( = ?auto_334297 ?auto_334310 ) ) ( not ( = ?auto_334298 ?auto_334299 ) ) ( not ( = ?auto_334298 ?auto_334300 ) ) ( not ( = ?auto_334298 ?auto_334301 ) ) ( not ( = ?auto_334298 ?auto_334302 ) ) ( not ( = ?auto_334298 ?auto_334303 ) ) ( not ( = ?auto_334298 ?auto_334304 ) ) ( not ( = ?auto_334298 ?auto_334305 ) ) ( not ( = ?auto_334298 ?auto_334306 ) ) ( not ( = ?auto_334298 ?auto_334307 ) ) ( not ( = ?auto_334298 ?auto_334308 ) ) ( not ( = ?auto_334298 ?auto_334309 ) ) ( not ( = ?auto_334298 ?auto_334310 ) ) ( not ( = ?auto_334299 ?auto_334300 ) ) ( not ( = ?auto_334299 ?auto_334301 ) ) ( not ( = ?auto_334299 ?auto_334302 ) ) ( not ( = ?auto_334299 ?auto_334303 ) ) ( not ( = ?auto_334299 ?auto_334304 ) ) ( not ( = ?auto_334299 ?auto_334305 ) ) ( not ( = ?auto_334299 ?auto_334306 ) ) ( not ( = ?auto_334299 ?auto_334307 ) ) ( not ( = ?auto_334299 ?auto_334308 ) ) ( not ( = ?auto_334299 ?auto_334309 ) ) ( not ( = ?auto_334299 ?auto_334310 ) ) ( not ( = ?auto_334300 ?auto_334301 ) ) ( not ( = ?auto_334300 ?auto_334302 ) ) ( not ( = ?auto_334300 ?auto_334303 ) ) ( not ( = ?auto_334300 ?auto_334304 ) ) ( not ( = ?auto_334300 ?auto_334305 ) ) ( not ( = ?auto_334300 ?auto_334306 ) ) ( not ( = ?auto_334300 ?auto_334307 ) ) ( not ( = ?auto_334300 ?auto_334308 ) ) ( not ( = ?auto_334300 ?auto_334309 ) ) ( not ( = ?auto_334300 ?auto_334310 ) ) ( not ( = ?auto_334301 ?auto_334302 ) ) ( not ( = ?auto_334301 ?auto_334303 ) ) ( not ( = ?auto_334301 ?auto_334304 ) ) ( not ( = ?auto_334301 ?auto_334305 ) ) ( not ( = ?auto_334301 ?auto_334306 ) ) ( not ( = ?auto_334301 ?auto_334307 ) ) ( not ( = ?auto_334301 ?auto_334308 ) ) ( not ( = ?auto_334301 ?auto_334309 ) ) ( not ( = ?auto_334301 ?auto_334310 ) ) ( not ( = ?auto_334302 ?auto_334303 ) ) ( not ( = ?auto_334302 ?auto_334304 ) ) ( not ( = ?auto_334302 ?auto_334305 ) ) ( not ( = ?auto_334302 ?auto_334306 ) ) ( not ( = ?auto_334302 ?auto_334307 ) ) ( not ( = ?auto_334302 ?auto_334308 ) ) ( not ( = ?auto_334302 ?auto_334309 ) ) ( not ( = ?auto_334302 ?auto_334310 ) ) ( not ( = ?auto_334303 ?auto_334304 ) ) ( not ( = ?auto_334303 ?auto_334305 ) ) ( not ( = ?auto_334303 ?auto_334306 ) ) ( not ( = ?auto_334303 ?auto_334307 ) ) ( not ( = ?auto_334303 ?auto_334308 ) ) ( not ( = ?auto_334303 ?auto_334309 ) ) ( not ( = ?auto_334303 ?auto_334310 ) ) ( not ( = ?auto_334304 ?auto_334305 ) ) ( not ( = ?auto_334304 ?auto_334306 ) ) ( not ( = ?auto_334304 ?auto_334307 ) ) ( not ( = ?auto_334304 ?auto_334308 ) ) ( not ( = ?auto_334304 ?auto_334309 ) ) ( not ( = ?auto_334304 ?auto_334310 ) ) ( not ( = ?auto_334305 ?auto_334306 ) ) ( not ( = ?auto_334305 ?auto_334307 ) ) ( not ( = ?auto_334305 ?auto_334308 ) ) ( not ( = ?auto_334305 ?auto_334309 ) ) ( not ( = ?auto_334305 ?auto_334310 ) ) ( not ( = ?auto_334306 ?auto_334307 ) ) ( not ( = ?auto_334306 ?auto_334308 ) ) ( not ( = ?auto_334306 ?auto_334309 ) ) ( not ( = ?auto_334306 ?auto_334310 ) ) ( not ( = ?auto_334307 ?auto_334308 ) ) ( not ( = ?auto_334307 ?auto_334309 ) ) ( not ( = ?auto_334307 ?auto_334310 ) ) ( not ( = ?auto_334308 ?auto_334309 ) ) ( not ( = ?auto_334308 ?auto_334310 ) ) ( not ( = ?auto_334309 ?auto_334310 ) ) ( ON ?auto_334309 ?auto_334310 ) ( ON ?auto_334308 ?auto_334309 ) ( CLEAR ?auto_334306 ) ( ON ?auto_334307 ?auto_334308 ) ( CLEAR ?auto_334307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_334297 ?auto_334298 ?auto_334299 ?auto_334300 ?auto_334301 ?auto_334302 ?auto_334303 ?auto_334304 ?auto_334305 ?auto_334306 ?auto_334307 )
      ( MAKE-14PILE ?auto_334297 ?auto_334298 ?auto_334299 ?auto_334300 ?auto_334301 ?auto_334302 ?auto_334303 ?auto_334304 ?auto_334305 ?auto_334306 ?auto_334307 ?auto_334308 ?auto_334309 ?auto_334310 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334325 - BLOCK
      ?auto_334326 - BLOCK
      ?auto_334327 - BLOCK
      ?auto_334328 - BLOCK
      ?auto_334329 - BLOCK
      ?auto_334330 - BLOCK
      ?auto_334331 - BLOCK
      ?auto_334332 - BLOCK
      ?auto_334333 - BLOCK
      ?auto_334334 - BLOCK
      ?auto_334335 - BLOCK
      ?auto_334336 - BLOCK
      ?auto_334337 - BLOCK
      ?auto_334338 - BLOCK
    )
    :vars
    (
      ?auto_334339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334338 ?auto_334339 ) ( ON-TABLE ?auto_334325 ) ( ON ?auto_334326 ?auto_334325 ) ( ON ?auto_334327 ?auto_334326 ) ( ON ?auto_334328 ?auto_334327 ) ( ON ?auto_334329 ?auto_334328 ) ( ON ?auto_334330 ?auto_334329 ) ( ON ?auto_334331 ?auto_334330 ) ( ON ?auto_334332 ?auto_334331 ) ( ON ?auto_334333 ?auto_334332 ) ( not ( = ?auto_334325 ?auto_334326 ) ) ( not ( = ?auto_334325 ?auto_334327 ) ) ( not ( = ?auto_334325 ?auto_334328 ) ) ( not ( = ?auto_334325 ?auto_334329 ) ) ( not ( = ?auto_334325 ?auto_334330 ) ) ( not ( = ?auto_334325 ?auto_334331 ) ) ( not ( = ?auto_334325 ?auto_334332 ) ) ( not ( = ?auto_334325 ?auto_334333 ) ) ( not ( = ?auto_334325 ?auto_334334 ) ) ( not ( = ?auto_334325 ?auto_334335 ) ) ( not ( = ?auto_334325 ?auto_334336 ) ) ( not ( = ?auto_334325 ?auto_334337 ) ) ( not ( = ?auto_334325 ?auto_334338 ) ) ( not ( = ?auto_334325 ?auto_334339 ) ) ( not ( = ?auto_334326 ?auto_334327 ) ) ( not ( = ?auto_334326 ?auto_334328 ) ) ( not ( = ?auto_334326 ?auto_334329 ) ) ( not ( = ?auto_334326 ?auto_334330 ) ) ( not ( = ?auto_334326 ?auto_334331 ) ) ( not ( = ?auto_334326 ?auto_334332 ) ) ( not ( = ?auto_334326 ?auto_334333 ) ) ( not ( = ?auto_334326 ?auto_334334 ) ) ( not ( = ?auto_334326 ?auto_334335 ) ) ( not ( = ?auto_334326 ?auto_334336 ) ) ( not ( = ?auto_334326 ?auto_334337 ) ) ( not ( = ?auto_334326 ?auto_334338 ) ) ( not ( = ?auto_334326 ?auto_334339 ) ) ( not ( = ?auto_334327 ?auto_334328 ) ) ( not ( = ?auto_334327 ?auto_334329 ) ) ( not ( = ?auto_334327 ?auto_334330 ) ) ( not ( = ?auto_334327 ?auto_334331 ) ) ( not ( = ?auto_334327 ?auto_334332 ) ) ( not ( = ?auto_334327 ?auto_334333 ) ) ( not ( = ?auto_334327 ?auto_334334 ) ) ( not ( = ?auto_334327 ?auto_334335 ) ) ( not ( = ?auto_334327 ?auto_334336 ) ) ( not ( = ?auto_334327 ?auto_334337 ) ) ( not ( = ?auto_334327 ?auto_334338 ) ) ( not ( = ?auto_334327 ?auto_334339 ) ) ( not ( = ?auto_334328 ?auto_334329 ) ) ( not ( = ?auto_334328 ?auto_334330 ) ) ( not ( = ?auto_334328 ?auto_334331 ) ) ( not ( = ?auto_334328 ?auto_334332 ) ) ( not ( = ?auto_334328 ?auto_334333 ) ) ( not ( = ?auto_334328 ?auto_334334 ) ) ( not ( = ?auto_334328 ?auto_334335 ) ) ( not ( = ?auto_334328 ?auto_334336 ) ) ( not ( = ?auto_334328 ?auto_334337 ) ) ( not ( = ?auto_334328 ?auto_334338 ) ) ( not ( = ?auto_334328 ?auto_334339 ) ) ( not ( = ?auto_334329 ?auto_334330 ) ) ( not ( = ?auto_334329 ?auto_334331 ) ) ( not ( = ?auto_334329 ?auto_334332 ) ) ( not ( = ?auto_334329 ?auto_334333 ) ) ( not ( = ?auto_334329 ?auto_334334 ) ) ( not ( = ?auto_334329 ?auto_334335 ) ) ( not ( = ?auto_334329 ?auto_334336 ) ) ( not ( = ?auto_334329 ?auto_334337 ) ) ( not ( = ?auto_334329 ?auto_334338 ) ) ( not ( = ?auto_334329 ?auto_334339 ) ) ( not ( = ?auto_334330 ?auto_334331 ) ) ( not ( = ?auto_334330 ?auto_334332 ) ) ( not ( = ?auto_334330 ?auto_334333 ) ) ( not ( = ?auto_334330 ?auto_334334 ) ) ( not ( = ?auto_334330 ?auto_334335 ) ) ( not ( = ?auto_334330 ?auto_334336 ) ) ( not ( = ?auto_334330 ?auto_334337 ) ) ( not ( = ?auto_334330 ?auto_334338 ) ) ( not ( = ?auto_334330 ?auto_334339 ) ) ( not ( = ?auto_334331 ?auto_334332 ) ) ( not ( = ?auto_334331 ?auto_334333 ) ) ( not ( = ?auto_334331 ?auto_334334 ) ) ( not ( = ?auto_334331 ?auto_334335 ) ) ( not ( = ?auto_334331 ?auto_334336 ) ) ( not ( = ?auto_334331 ?auto_334337 ) ) ( not ( = ?auto_334331 ?auto_334338 ) ) ( not ( = ?auto_334331 ?auto_334339 ) ) ( not ( = ?auto_334332 ?auto_334333 ) ) ( not ( = ?auto_334332 ?auto_334334 ) ) ( not ( = ?auto_334332 ?auto_334335 ) ) ( not ( = ?auto_334332 ?auto_334336 ) ) ( not ( = ?auto_334332 ?auto_334337 ) ) ( not ( = ?auto_334332 ?auto_334338 ) ) ( not ( = ?auto_334332 ?auto_334339 ) ) ( not ( = ?auto_334333 ?auto_334334 ) ) ( not ( = ?auto_334333 ?auto_334335 ) ) ( not ( = ?auto_334333 ?auto_334336 ) ) ( not ( = ?auto_334333 ?auto_334337 ) ) ( not ( = ?auto_334333 ?auto_334338 ) ) ( not ( = ?auto_334333 ?auto_334339 ) ) ( not ( = ?auto_334334 ?auto_334335 ) ) ( not ( = ?auto_334334 ?auto_334336 ) ) ( not ( = ?auto_334334 ?auto_334337 ) ) ( not ( = ?auto_334334 ?auto_334338 ) ) ( not ( = ?auto_334334 ?auto_334339 ) ) ( not ( = ?auto_334335 ?auto_334336 ) ) ( not ( = ?auto_334335 ?auto_334337 ) ) ( not ( = ?auto_334335 ?auto_334338 ) ) ( not ( = ?auto_334335 ?auto_334339 ) ) ( not ( = ?auto_334336 ?auto_334337 ) ) ( not ( = ?auto_334336 ?auto_334338 ) ) ( not ( = ?auto_334336 ?auto_334339 ) ) ( not ( = ?auto_334337 ?auto_334338 ) ) ( not ( = ?auto_334337 ?auto_334339 ) ) ( not ( = ?auto_334338 ?auto_334339 ) ) ( ON ?auto_334337 ?auto_334338 ) ( ON ?auto_334336 ?auto_334337 ) ( ON ?auto_334335 ?auto_334336 ) ( CLEAR ?auto_334333 ) ( ON ?auto_334334 ?auto_334335 ) ( CLEAR ?auto_334334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_334325 ?auto_334326 ?auto_334327 ?auto_334328 ?auto_334329 ?auto_334330 ?auto_334331 ?auto_334332 ?auto_334333 ?auto_334334 )
      ( MAKE-14PILE ?auto_334325 ?auto_334326 ?auto_334327 ?auto_334328 ?auto_334329 ?auto_334330 ?auto_334331 ?auto_334332 ?auto_334333 ?auto_334334 ?auto_334335 ?auto_334336 ?auto_334337 ?auto_334338 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334354 - BLOCK
      ?auto_334355 - BLOCK
      ?auto_334356 - BLOCK
      ?auto_334357 - BLOCK
      ?auto_334358 - BLOCK
      ?auto_334359 - BLOCK
      ?auto_334360 - BLOCK
      ?auto_334361 - BLOCK
      ?auto_334362 - BLOCK
      ?auto_334363 - BLOCK
      ?auto_334364 - BLOCK
      ?auto_334365 - BLOCK
      ?auto_334366 - BLOCK
      ?auto_334367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_334367 ) ( ON-TABLE ?auto_334354 ) ( ON ?auto_334355 ?auto_334354 ) ( ON ?auto_334356 ?auto_334355 ) ( ON ?auto_334357 ?auto_334356 ) ( ON ?auto_334358 ?auto_334357 ) ( ON ?auto_334359 ?auto_334358 ) ( ON ?auto_334360 ?auto_334359 ) ( ON ?auto_334361 ?auto_334360 ) ( ON ?auto_334362 ?auto_334361 ) ( not ( = ?auto_334354 ?auto_334355 ) ) ( not ( = ?auto_334354 ?auto_334356 ) ) ( not ( = ?auto_334354 ?auto_334357 ) ) ( not ( = ?auto_334354 ?auto_334358 ) ) ( not ( = ?auto_334354 ?auto_334359 ) ) ( not ( = ?auto_334354 ?auto_334360 ) ) ( not ( = ?auto_334354 ?auto_334361 ) ) ( not ( = ?auto_334354 ?auto_334362 ) ) ( not ( = ?auto_334354 ?auto_334363 ) ) ( not ( = ?auto_334354 ?auto_334364 ) ) ( not ( = ?auto_334354 ?auto_334365 ) ) ( not ( = ?auto_334354 ?auto_334366 ) ) ( not ( = ?auto_334354 ?auto_334367 ) ) ( not ( = ?auto_334355 ?auto_334356 ) ) ( not ( = ?auto_334355 ?auto_334357 ) ) ( not ( = ?auto_334355 ?auto_334358 ) ) ( not ( = ?auto_334355 ?auto_334359 ) ) ( not ( = ?auto_334355 ?auto_334360 ) ) ( not ( = ?auto_334355 ?auto_334361 ) ) ( not ( = ?auto_334355 ?auto_334362 ) ) ( not ( = ?auto_334355 ?auto_334363 ) ) ( not ( = ?auto_334355 ?auto_334364 ) ) ( not ( = ?auto_334355 ?auto_334365 ) ) ( not ( = ?auto_334355 ?auto_334366 ) ) ( not ( = ?auto_334355 ?auto_334367 ) ) ( not ( = ?auto_334356 ?auto_334357 ) ) ( not ( = ?auto_334356 ?auto_334358 ) ) ( not ( = ?auto_334356 ?auto_334359 ) ) ( not ( = ?auto_334356 ?auto_334360 ) ) ( not ( = ?auto_334356 ?auto_334361 ) ) ( not ( = ?auto_334356 ?auto_334362 ) ) ( not ( = ?auto_334356 ?auto_334363 ) ) ( not ( = ?auto_334356 ?auto_334364 ) ) ( not ( = ?auto_334356 ?auto_334365 ) ) ( not ( = ?auto_334356 ?auto_334366 ) ) ( not ( = ?auto_334356 ?auto_334367 ) ) ( not ( = ?auto_334357 ?auto_334358 ) ) ( not ( = ?auto_334357 ?auto_334359 ) ) ( not ( = ?auto_334357 ?auto_334360 ) ) ( not ( = ?auto_334357 ?auto_334361 ) ) ( not ( = ?auto_334357 ?auto_334362 ) ) ( not ( = ?auto_334357 ?auto_334363 ) ) ( not ( = ?auto_334357 ?auto_334364 ) ) ( not ( = ?auto_334357 ?auto_334365 ) ) ( not ( = ?auto_334357 ?auto_334366 ) ) ( not ( = ?auto_334357 ?auto_334367 ) ) ( not ( = ?auto_334358 ?auto_334359 ) ) ( not ( = ?auto_334358 ?auto_334360 ) ) ( not ( = ?auto_334358 ?auto_334361 ) ) ( not ( = ?auto_334358 ?auto_334362 ) ) ( not ( = ?auto_334358 ?auto_334363 ) ) ( not ( = ?auto_334358 ?auto_334364 ) ) ( not ( = ?auto_334358 ?auto_334365 ) ) ( not ( = ?auto_334358 ?auto_334366 ) ) ( not ( = ?auto_334358 ?auto_334367 ) ) ( not ( = ?auto_334359 ?auto_334360 ) ) ( not ( = ?auto_334359 ?auto_334361 ) ) ( not ( = ?auto_334359 ?auto_334362 ) ) ( not ( = ?auto_334359 ?auto_334363 ) ) ( not ( = ?auto_334359 ?auto_334364 ) ) ( not ( = ?auto_334359 ?auto_334365 ) ) ( not ( = ?auto_334359 ?auto_334366 ) ) ( not ( = ?auto_334359 ?auto_334367 ) ) ( not ( = ?auto_334360 ?auto_334361 ) ) ( not ( = ?auto_334360 ?auto_334362 ) ) ( not ( = ?auto_334360 ?auto_334363 ) ) ( not ( = ?auto_334360 ?auto_334364 ) ) ( not ( = ?auto_334360 ?auto_334365 ) ) ( not ( = ?auto_334360 ?auto_334366 ) ) ( not ( = ?auto_334360 ?auto_334367 ) ) ( not ( = ?auto_334361 ?auto_334362 ) ) ( not ( = ?auto_334361 ?auto_334363 ) ) ( not ( = ?auto_334361 ?auto_334364 ) ) ( not ( = ?auto_334361 ?auto_334365 ) ) ( not ( = ?auto_334361 ?auto_334366 ) ) ( not ( = ?auto_334361 ?auto_334367 ) ) ( not ( = ?auto_334362 ?auto_334363 ) ) ( not ( = ?auto_334362 ?auto_334364 ) ) ( not ( = ?auto_334362 ?auto_334365 ) ) ( not ( = ?auto_334362 ?auto_334366 ) ) ( not ( = ?auto_334362 ?auto_334367 ) ) ( not ( = ?auto_334363 ?auto_334364 ) ) ( not ( = ?auto_334363 ?auto_334365 ) ) ( not ( = ?auto_334363 ?auto_334366 ) ) ( not ( = ?auto_334363 ?auto_334367 ) ) ( not ( = ?auto_334364 ?auto_334365 ) ) ( not ( = ?auto_334364 ?auto_334366 ) ) ( not ( = ?auto_334364 ?auto_334367 ) ) ( not ( = ?auto_334365 ?auto_334366 ) ) ( not ( = ?auto_334365 ?auto_334367 ) ) ( not ( = ?auto_334366 ?auto_334367 ) ) ( ON ?auto_334366 ?auto_334367 ) ( ON ?auto_334365 ?auto_334366 ) ( ON ?auto_334364 ?auto_334365 ) ( CLEAR ?auto_334362 ) ( ON ?auto_334363 ?auto_334364 ) ( CLEAR ?auto_334363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_334354 ?auto_334355 ?auto_334356 ?auto_334357 ?auto_334358 ?auto_334359 ?auto_334360 ?auto_334361 ?auto_334362 ?auto_334363 )
      ( MAKE-14PILE ?auto_334354 ?auto_334355 ?auto_334356 ?auto_334357 ?auto_334358 ?auto_334359 ?auto_334360 ?auto_334361 ?auto_334362 ?auto_334363 ?auto_334364 ?auto_334365 ?auto_334366 ?auto_334367 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334382 - BLOCK
      ?auto_334383 - BLOCK
      ?auto_334384 - BLOCK
      ?auto_334385 - BLOCK
      ?auto_334386 - BLOCK
      ?auto_334387 - BLOCK
      ?auto_334388 - BLOCK
      ?auto_334389 - BLOCK
      ?auto_334390 - BLOCK
      ?auto_334391 - BLOCK
      ?auto_334392 - BLOCK
      ?auto_334393 - BLOCK
      ?auto_334394 - BLOCK
      ?auto_334395 - BLOCK
    )
    :vars
    (
      ?auto_334396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334395 ?auto_334396 ) ( ON-TABLE ?auto_334382 ) ( ON ?auto_334383 ?auto_334382 ) ( ON ?auto_334384 ?auto_334383 ) ( ON ?auto_334385 ?auto_334384 ) ( ON ?auto_334386 ?auto_334385 ) ( ON ?auto_334387 ?auto_334386 ) ( ON ?auto_334388 ?auto_334387 ) ( ON ?auto_334389 ?auto_334388 ) ( not ( = ?auto_334382 ?auto_334383 ) ) ( not ( = ?auto_334382 ?auto_334384 ) ) ( not ( = ?auto_334382 ?auto_334385 ) ) ( not ( = ?auto_334382 ?auto_334386 ) ) ( not ( = ?auto_334382 ?auto_334387 ) ) ( not ( = ?auto_334382 ?auto_334388 ) ) ( not ( = ?auto_334382 ?auto_334389 ) ) ( not ( = ?auto_334382 ?auto_334390 ) ) ( not ( = ?auto_334382 ?auto_334391 ) ) ( not ( = ?auto_334382 ?auto_334392 ) ) ( not ( = ?auto_334382 ?auto_334393 ) ) ( not ( = ?auto_334382 ?auto_334394 ) ) ( not ( = ?auto_334382 ?auto_334395 ) ) ( not ( = ?auto_334382 ?auto_334396 ) ) ( not ( = ?auto_334383 ?auto_334384 ) ) ( not ( = ?auto_334383 ?auto_334385 ) ) ( not ( = ?auto_334383 ?auto_334386 ) ) ( not ( = ?auto_334383 ?auto_334387 ) ) ( not ( = ?auto_334383 ?auto_334388 ) ) ( not ( = ?auto_334383 ?auto_334389 ) ) ( not ( = ?auto_334383 ?auto_334390 ) ) ( not ( = ?auto_334383 ?auto_334391 ) ) ( not ( = ?auto_334383 ?auto_334392 ) ) ( not ( = ?auto_334383 ?auto_334393 ) ) ( not ( = ?auto_334383 ?auto_334394 ) ) ( not ( = ?auto_334383 ?auto_334395 ) ) ( not ( = ?auto_334383 ?auto_334396 ) ) ( not ( = ?auto_334384 ?auto_334385 ) ) ( not ( = ?auto_334384 ?auto_334386 ) ) ( not ( = ?auto_334384 ?auto_334387 ) ) ( not ( = ?auto_334384 ?auto_334388 ) ) ( not ( = ?auto_334384 ?auto_334389 ) ) ( not ( = ?auto_334384 ?auto_334390 ) ) ( not ( = ?auto_334384 ?auto_334391 ) ) ( not ( = ?auto_334384 ?auto_334392 ) ) ( not ( = ?auto_334384 ?auto_334393 ) ) ( not ( = ?auto_334384 ?auto_334394 ) ) ( not ( = ?auto_334384 ?auto_334395 ) ) ( not ( = ?auto_334384 ?auto_334396 ) ) ( not ( = ?auto_334385 ?auto_334386 ) ) ( not ( = ?auto_334385 ?auto_334387 ) ) ( not ( = ?auto_334385 ?auto_334388 ) ) ( not ( = ?auto_334385 ?auto_334389 ) ) ( not ( = ?auto_334385 ?auto_334390 ) ) ( not ( = ?auto_334385 ?auto_334391 ) ) ( not ( = ?auto_334385 ?auto_334392 ) ) ( not ( = ?auto_334385 ?auto_334393 ) ) ( not ( = ?auto_334385 ?auto_334394 ) ) ( not ( = ?auto_334385 ?auto_334395 ) ) ( not ( = ?auto_334385 ?auto_334396 ) ) ( not ( = ?auto_334386 ?auto_334387 ) ) ( not ( = ?auto_334386 ?auto_334388 ) ) ( not ( = ?auto_334386 ?auto_334389 ) ) ( not ( = ?auto_334386 ?auto_334390 ) ) ( not ( = ?auto_334386 ?auto_334391 ) ) ( not ( = ?auto_334386 ?auto_334392 ) ) ( not ( = ?auto_334386 ?auto_334393 ) ) ( not ( = ?auto_334386 ?auto_334394 ) ) ( not ( = ?auto_334386 ?auto_334395 ) ) ( not ( = ?auto_334386 ?auto_334396 ) ) ( not ( = ?auto_334387 ?auto_334388 ) ) ( not ( = ?auto_334387 ?auto_334389 ) ) ( not ( = ?auto_334387 ?auto_334390 ) ) ( not ( = ?auto_334387 ?auto_334391 ) ) ( not ( = ?auto_334387 ?auto_334392 ) ) ( not ( = ?auto_334387 ?auto_334393 ) ) ( not ( = ?auto_334387 ?auto_334394 ) ) ( not ( = ?auto_334387 ?auto_334395 ) ) ( not ( = ?auto_334387 ?auto_334396 ) ) ( not ( = ?auto_334388 ?auto_334389 ) ) ( not ( = ?auto_334388 ?auto_334390 ) ) ( not ( = ?auto_334388 ?auto_334391 ) ) ( not ( = ?auto_334388 ?auto_334392 ) ) ( not ( = ?auto_334388 ?auto_334393 ) ) ( not ( = ?auto_334388 ?auto_334394 ) ) ( not ( = ?auto_334388 ?auto_334395 ) ) ( not ( = ?auto_334388 ?auto_334396 ) ) ( not ( = ?auto_334389 ?auto_334390 ) ) ( not ( = ?auto_334389 ?auto_334391 ) ) ( not ( = ?auto_334389 ?auto_334392 ) ) ( not ( = ?auto_334389 ?auto_334393 ) ) ( not ( = ?auto_334389 ?auto_334394 ) ) ( not ( = ?auto_334389 ?auto_334395 ) ) ( not ( = ?auto_334389 ?auto_334396 ) ) ( not ( = ?auto_334390 ?auto_334391 ) ) ( not ( = ?auto_334390 ?auto_334392 ) ) ( not ( = ?auto_334390 ?auto_334393 ) ) ( not ( = ?auto_334390 ?auto_334394 ) ) ( not ( = ?auto_334390 ?auto_334395 ) ) ( not ( = ?auto_334390 ?auto_334396 ) ) ( not ( = ?auto_334391 ?auto_334392 ) ) ( not ( = ?auto_334391 ?auto_334393 ) ) ( not ( = ?auto_334391 ?auto_334394 ) ) ( not ( = ?auto_334391 ?auto_334395 ) ) ( not ( = ?auto_334391 ?auto_334396 ) ) ( not ( = ?auto_334392 ?auto_334393 ) ) ( not ( = ?auto_334392 ?auto_334394 ) ) ( not ( = ?auto_334392 ?auto_334395 ) ) ( not ( = ?auto_334392 ?auto_334396 ) ) ( not ( = ?auto_334393 ?auto_334394 ) ) ( not ( = ?auto_334393 ?auto_334395 ) ) ( not ( = ?auto_334393 ?auto_334396 ) ) ( not ( = ?auto_334394 ?auto_334395 ) ) ( not ( = ?auto_334394 ?auto_334396 ) ) ( not ( = ?auto_334395 ?auto_334396 ) ) ( ON ?auto_334394 ?auto_334395 ) ( ON ?auto_334393 ?auto_334394 ) ( ON ?auto_334392 ?auto_334393 ) ( ON ?auto_334391 ?auto_334392 ) ( CLEAR ?auto_334389 ) ( ON ?auto_334390 ?auto_334391 ) ( CLEAR ?auto_334390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_334382 ?auto_334383 ?auto_334384 ?auto_334385 ?auto_334386 ?auto_334387 ?auto_334388 ?auto_334389 ?auto_334390 )
      ( MAKE-14PILE ?auto_334382 ?auto_334383 ?auto_334384 ?auto_334385 ?auto_334386 ?auto_334387 ?auto_334388 ?auto_334389 ?auto_334390 ?auto_334391 ?auto_334392 ?auto_334393 ?auto_334394 ?auto_334395 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334411 - BLOCK
      ?auto_334412 - BLOCK
      ?auto_334413 - BLOCK
      ?auto_334414 - BLOCK
      ?auto_334415 - BLOCK
      ?auto_334416 - BLOCK
      ?auto_334417 - BLOCK
      ?auto_334418 - BLOCK
      ?auto_334419 - BLOCK
      ?auto_334420 - BLOCK
      ?auto_334421 - BLOCK
      ?auto_334422 - BLOCK
      ?auto_334423 - BLOCK
      ?auto_334424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_334424 ) ( ON-TABLE ?auto_334411 ) ( ON ?auto_334412 ?auto_334411 ) ( ON ?auto_334413 ?auto_334412 ) ( ON ?auto_334414 ?auto_334413 ) ( ON ?auto_334415 ?auto_334414 ) ( ON ?auto_334416 ?auto_334415 ) ( ON ?auto_334417 ?auto_334416 ) ( ON ?auto_334418 ?auto_334417 ) ( not ( = ?auto_334411 ?auto_334412 ) ) ( not ( = ?auto_334411 ?auto_334413 ) ) ( not ( = ?auto_334411 ?auto_334414 ) ) ( not ( = ?auto_334411 ?auto_334415 ) ) ( not ( = ?auto_334411 ?auto_334416 ) ) ( not ( = ?auto_334411 ?auto_334417 ) ) ( not ( = ?auto_334411 ?auto_334418 ) ) ( not ( = ?auto_334411 ?auto_334419 ) ) ( not ( = ?auto_334411 ?auto_334420 ) ) ( not ( = ?auto_334411 ?auto_334421 ) ) ( not ( = ?auto_334411 ?auto_334422 ) ) ( not ( = ?auto_334411 ?auto_334423 ) ) ( not ( = ?auto_334411 ?auto_334424 ) ) ( not ( = ?auto_334412 ?auto_334413 ) ) ( not ( = ?auto_334412 ?auto_334414 ) ) ( not ( = ?auto_334412 ?auto_334415 ) ) ( not ( = ?auto_334412 ?auto_334416 ) ) ( not ( = ?auto_334412 ?auto_334417 ) ) ( not ( = ?auto_334412 ?auto_334418 ) ) ( not ( = ?auto_334412 ?auto_334419 ) ) ( not ( = ?auto_334412 ?auto_334420 ) ) ( not ( = ?auto_334412 ?auto_334421 ) ) ( not ( = ?auto_334412 ?auto_334422 ) ) ( not ( = ?auto_334412 ?auto_334423 ) ) ( not ( = ?auto_334412 ?auto_334424 ) ) ( not ( = ?auto_334413 ?auto_334414 ) ) ( not ( = ?auto_334413 ?auto_334415 ) ) ( not ( = ?auto_334413 ?auto_334416 ) ) ( not ( = ?auto_334413 ?auto_334417 ) ) ( not ( = ?auto_334413 ?auto_334418 ) ) ( not ( = ?auto_334413 ?auto_334419 ) ) ( not ( = ?auto_334413 ?auto_334420 ) ) ( not ( = ?auto_334413 ?auto_334421 ) ) ( not ( = ?auto_334413 ?auto_334422 ) ) ( not ( = ?auto_334413 ?auto_334423 ) ) ( not ( = ?auto_334413 ?auto_334424 ) ) ( not ( = ?auto_334414 ?auto_334415 ) ) ( not ( = ?auto_334414 ?auto_334416 ) ) ( not ( = ?auto_334414 ?auto_334417 ) ) ( not ( = ?auto_334414 ?auto_334418 ) ) ( not ( = ?auto_334414 ?auto_334419 ) ) ( not ( = ?auto_334414 ?auto_334420 ) ) ( not ( = ?auto_334414 ?auto_334421 ) ) ( not ( = ?auto_334414 ?auto_334422 ) ) ( not ( = ?auto_334414 ?auto_334423 ) ) ( not ( = ?auto_334414 ?auto_334424 ) ) ( not ( = ?auto_334415 ?auto_334416 ) ) ( not ( = ?auto_334415 ?auto_334417 ) ) ( not ( = ?auto_334415 ?auto_334418 ) ) ( not ( = ?auto_334415 ?auto_334419 ) ) ( not ( = ?auto_334415 ?auto_334420 ) ) ( not ( = ?auto_334415 ?auto_334421 ) ) ( not ( = ?auto_334415 ?auto_334422 ) ) ( not ( = ?auto_334415 ?auto_334423 ) ) ( not ( = ?auto_334415 ?auto_334424 ) ) ( not ( = ?auto_334416 ?auto_334417 ) ) ( not ( = ?auto_334416 ?auto_334418 ) ) ( not ( = ?auto_334416 ?auto_334419 ) ) ( not ( = ?auto_334416 ?auto_334420 ) ) ( not ( = ?auto_334416 ?auto_334421 ) ) ( not ( = ?auto_334416 ?auto_334422 ) ) ( not ( = ?auto_334416 ?auto_334423 ) ) ( not ( = ?auto_334416 ?auto_334424 ) ) ( not ( = ?auto_334417 ?auto_334418 ) ) ( not ( = ?auto_334417 ?auto_334419 ) ) ( not ( = ?auto_334417 ?auto_334420 ) ) ( not ( = ?auto_334417 ?auto_334421 ) ) ( not ( = ?auto_334417 ?auto_334422 ) ) ( not ( = ?auto_334417 ?auto_334423 ) ) ( not ( = ?auto_334417 ?auto_334424 ) ) ( not ( = ?auto_334418 ?auto_334419 ) ) ( not ( = ?auto_334418 ?auto_334420 ) ) ( not ( = ?auto_334418 ?auto_334421 ) ) ( not ( = ?auto_334418 ?auto_334422 ) ) ( not ( = ?auto_334418 ?auto_334423 ) ) ( not ( = ?auto_334418 ?auto_334424 ) ) ( not ( = ?auto_334419 ?auto_334420 ) ) ( not ( = ?auto_334419 ?auto_334421 ) ) ( not ( = ?auto_334419 ?auto_334422 ) ) ( not ( = ?auto_334419 ?auto_334423 ) ) ( not ( = ?auto_334419 ?auto_334424 ) ) ( not ( = ?auto_334420 ?auto_334421 ) ) ( not ( = ?auto_334420 ?auto_334422 ) ) ( not ( = ?auto_334420 ?auto_334423 ) ) ( not ( = ?auto_334420 ?auto_334424 ) ) ( not ( = ?auto_334421 ?auto_334422 ) ) ( not ( = ?auto_334421 ?auto_334423 ) ) ( not ( = ?auto_334421 ?auto_334424 ) ) ( not ( = ?auto_334422 ?auto_334423 ) ) ( not ( = ?auto_334422 ?auto_334424 ) ) ( not ( = ?auto_334423 ?auto_334424 ) ) ( ON ?auto_334423 ?auto_334424 ) ( ON ?auto_334422 ?auto_334423 ) ( ON ?auto_334421 ?auto_334422 ) ( ON ?auto_334420 ?auto_334421 ) ( CLEAR ?auto_334418 ) ( ON ?auto_334419 ?auto_334420 ) ( CLEAR ?auto_334419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_334411 ?auto_334412 ?auto_334413 ?auto_334414 ?auto_334415 ?auto_334416 ?auto_334417 ?auto_334418 ?auto_334419 )
      ( MAKE-14PILE ?auto_334411 ?auto_334412 ?auto_334413 ?auto_334414 ?auto_334415 ?auto_334416 ?auto_334417 ?auto_334418 ?auto_334419 ?auto_334420 ?auto_334421 ?auto_334422 ?auto_334423 ?auto_334424 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334439 - BLOCK
      ?auto_334440 - BLOCK
      ?auto_334441 - BLOCK
      ?auto_334442 - BLOCK
      ?auto_334443 - BLOCK
      ?auto_334444 - BLOCK
      ?auto_334445 - BLOCK
      ?auto_334446 - BLOCK
      ?auto_334447 - BLOCK
      ?auto_334448 - BLOCK
      ?auto_334449 - BLOCK
      ?auto_334450 - BLOCK
      ?auto_334451 - BLOCK
      ?auto_334452 - BLOCK
    )
    :vars
    (
      ?auto_334453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334452 ?auto_334453 ) ( ON-TABLE ?auto_334439 ) ( ON ?auto_334440 ?auto_334439 ) ( ON ?auto_334441 ?auto_334440 ) ( ON ?auto_334442 ?auto_334441 ) ( ON ?auto_334443 ?auto_334442 ) ( ON ?auto_334444 ?auto_334443 ) ( ON ?auto_334445 ?auto_334444 ) ( not ( = ?auto_334439 ?auto_334440 ) ) ( not ( = ?auto_334439 ?auto_334441 ) ) ( not ( = ?auto_334439 ?auto_334442 ) ) ( not ( = ?auto_334439 ?auto_334443 ) ) ( not ( = ?auto_334439 ?auto_334444 ) ) ( not ( = ?auto_334439 ?auto_334445 ) ) ( not ( = ?auto_334439 ?auto_334446 ) ) ( not ( = ?auto_334439 ?auto_334447 ) ) ( not ( = ?auto_334439 ?auto_334448 ) ) ( not ( = ?auto_334439 ?auto_334449 ) ) ( not ( = ?auto_334439 ?auto_334450 ) ) ( not ( = ?auto_334439 ?auto_334451 ) ) ( not ( = ?auto_334439 ?auto_334452 ) ) ( not ( = ?auto_334439 ?auto_334453 ) ) ( not ( = ?auto_334440 ?auto_334441 ) ) ( not ( = ?auto_334440 ?auto_334442 ) ) ( not ( = ?auto_334440 ?auto_334443 ) ) ( not ( = ?auto_334440 ?auto_334444 ) ) ( not ( = ?auto_334440 ?auto_334445 ) ) ( not ( = ?auto_334440 ?auto_334446 ) ) ( not ( = ?auto_334440 ?auto_334447 ) ) ( not ( = ?auto_334440 ?auto_334448 ) ) ( not ( = ?auto_334440 ?auto_334449 ) ) ( not ( = ?auto_334440 ?auto_334450 ) ) ( not ( = ?auto_334440 ?auto_334451 ) ) ( not ( = ?auto_334440 ?auto_334452 ) ) ( not ( = ?auto_334440 ?auto_334453 ) ) ( not ( = ?auto_334441 ?auto_334442 ) ) ( not ( = ?auto_334441 ?auto_334443 ) ) ( not ( = ?auto_334441 ?auto_334444 ) ) ( not ( = ?auto_334441 ?auto_334445 ) ) ( not ( = ?auto_334441 ?auto_334446 ) ) ( not ( = ?auto_334441 ?auto_334447 ) ) ( not ( = ?auto_334441 ?auto_334448 ) ) ( not ( = ?auto_334441 ?auto_334449 ) ) ( not ( = ?auto_334441 ?auto_334450 ) ) ( not ( = ?auto_334441 ?auto_334451 ) ) ( not ( = ?auto_334441 ?auto_334452 ) ) ( not ( = ?auto_334441 ?auto_334453 ) ) ( not ( = ?auto_334442 ?auto_334443 ) ) ( not ( = ?auto_334442 ?auto_334444 ) ) ( not ( = ?auto_334442 ?auto_334445 ) ) ( not ( = ?auto_334442 ?auto_334446 ) ) ( not ( = ?auto_334442 ?auto_334447 ) ) ( not ( = ?auto_334442 ?auto_334448 ) ) ( not ( = ?auto_334442 ?auto_334449 ) ) ( not ( = ?auto_334442 ?auto_334450 ) ) ( not ( = ?auto_334442 ?auto_334451 ) ) ( not ( = ?auto_334442 ?auto_334452 ) ) ( not ( = ?auto_334442 ?auto_334453 ) ) ( not ( = ?auto_334443 ?auto_334444 ) ) ( not ( = ?auto_334443 ?auto_334445 ) ) ( not ( = ?auto_334443 ?auto_334446 ) ) ( not ( = ?auto_334443 ?auto_334447 ) ) ( not ( = ?auto_334443 ?auto_334448 ) ) ( not ( = ?auto_334443 ?auto_334449 ) ) ( not ( = ?auto_334443 ?auto_334450 ) ) ( not ( = ?auto_334443 ?auto_334451 ) ) ( not ( = ?auto_334443 ?auto_334452 ) ) ( not ( = ?auto_334443 ?auto_334453 ) ) ( not ( = ?auto_334444 ?auto_334445 ) ) ( not ( = ?auto_334444 ?auto_334446 ) ) ( not ( = ?auto_334444 ?auto_334447 ) ) ( not ( = ?auto_334444 ?auto_334448 ) ) ( not ( = ?auto_334444 ?auto_334449 ) ) ( not ( = ?auto_334444 ?auto_334450 ) ) ( not ( = ?auto_334444 ?auto_334451 ) ) ( not ( = ?auto_334444 ?auto_334452 ) ) ( not ( = ?auto_334444 ?auto_334453 ) ) ( not ( = ?auto_334445 ?auto_334446 ) ) ( not ( = ?auto_334445 ?auto_334447 ) ) ( not ( = ?auto_334445 ?auto_334448 ) ) ( not ( = ?auto_334445 ?auto_334449 ) ) ( not ( = ?auto_334445 ?auto_334450 ) ) ( not ( = ?auto_334445 ?auto_334451 ) ) ( not ( = ?auto_334445 ?auto_334452 ) ) ( not ( = ?auto_334445 ?auto_334453 ) ) ( not ( = ?auto_334446 ?auto_334447 ) ) ( not ( = ?auto_334446 ?auto_334448 ) ) ( not ( = ?auto_334446 ?auto_334449 ) ) ( not ( = ?auto_334446 ?auto_334450 ) ) ( not ( = ?auto_334446 ?auto_334451 ) ) ( not ( = ?auto_334446 ?auto_334452 ) ) ( not ( = ?auto_334446 ?auto_334453 ) ) ( not ( = ?auto_334447 ?auto_334448 ) ) ( not ( = ?auto_334447 ?auto_334449 ) ) ( not ( = ?auto_334447 ?auto_334450 ) ) ( not ( = ?auto_334447 ?auto_334451 ) ) ( not ( = ?auto_334447 ?auto_334452 ) ) ( not ( = ?auto_334447 ?auto_334453 ) ) ( not ( = ?auto_334448 ?auto_334449 ) ) ( not ( = ?auto_334448 ?auto_334450 ) ) ( not ( = ?auto_334448 ?auto_334451 ) ) ( not ( = ?auto_334448 ?auto_334452 ) ) ( not ( = ?auto_334448 ?auto_334453 ) ) ( not ( = ?auto_334449 ?auto_334450 ) ) ( not ( = ?auto_334449 ?auto_334451 ) ) ( not ( = ?auto_334449 ?auto_334452 ) ) ( not ( = ?auto_334449 ?auto_334453 ) ) ( not ( = ?auto_334450 ?auto_334451 ) ) ( not ( = ?auto_334450 ?auto_334452 ) ) ( not ( = ?auto_334450 ?auto_334453 ) ) ( not ( = ?auto_334451 ?auto_334452 ) ) ( not ( = ?auto_334451 ?auto_334453 ) ) ( not ( = ?auto_334452 ?auto_334453 ) ) ( ON ?auto_334451 ?auto_334452 ) ( ON ?auto_334450 ?auto_334451 ) ( ON ?auto_334449 ?auto_334450 ) ( ON ?auto_334448 ?auto_334449 ) ( ON ?auto_334447 ?auto_334448 ) ( CLEAR ?auto_334445 ) ( ON ?auto_334446 ?auto_334447 ) ( CLEAR ?auto_334446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_334439 ?auto_334440 ?auto_334441 ?auto_334442 ?auto_334443 ?auto_334444 ?auto_334445 ?auto_334446 )
      ( MAKE-14PILE ?auto_334439 ?auto_334440 ?auto_334441 ?auto_334442 ?auto_334443 ?auto_334444 ?auto_334445 ?auto_334446 ?auto_334447 ?auto_334448 ?auto_334449 ?auto_334450 ?auto_334451 ?auto_334452 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334468 - BLOCK
      ?auto_334469 - BLOCK
      ?auto_334470 - BLOCK
      ?auto_334471 - BLOCK
      ?auto_334472 - BLOCK
      ?auto_334473 - BLOCK
      ?auto_334474 - BLOCK
      ?auto_334475 - BLOCK
      ?auto_334476 - BLOCK
      ?auto_334477 - BLOCK
      ?auto_334478 - BLOCK
      ?auto_334479 - BLOCK
      ?auto_334480 - BLOCK
      ?auto_334481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_334481 ) ( ON-TABLE ?auto_334468 ) ( ON ?auto_334469 ?auto_334468 ) ( ON ?auto_334470 ?auto_334469 ) ( ON ?auto_334471 ?auto_334470 ) ( ON ?auto_334472 ?auto_334471 ) ( ON ?auto_334473 ?auto_334472 ) ( ON ?auto_334474 ?auto_334473 ) ( not ( = ?auto_334468 ?auto_334469 ) ) ( not ( = ?auto_334468 ?auto_334470 ) ) ( not ( = ?auto_334468 ?auto_334471 ) ) ( not ( = ?auto_334468 ?auto_334472 ) ) ( not ( = ?auto_334468 ?auto_334473 ) ) ( not ( = ?auto_334468 ?auto_334474 ) ) ( not ( = ?auto_334468 ?auto_334475 ) ) ( not ( = ?auto_334468 ?auto_334476 ) ) ( not ( = ?auto_334468 ?auto_334477 ) ) ( not ( = ?auto_334468 ?auto_334478 ) ) ( not ( = ?auto_334468 ?auto_334479 ) ) ( not ( = ?auto_334468 ?auto_334480 ) ) ( not ( = ?auto_334468 ?auto_334481 ) ) ( not ( = ?auto_334469 ?auto_334470 ) ) ( not ( = ?auto_334469 ?auto_334471 ) ) ( not ( = ?auto_334469 ?auto_334472 ) ) ( not ( = ?auto_334469 ?auto_334473 ) ) ( not ( = ?auto_334469 ?auto_334474 ) ) ( not ( = ?auto_334469 ?auto_334475 ) ) ( not ( = ?auto_334469 ?auto_334476 ) ) ( not ( = ?auto_334469 ?auto_334477 ) ) ( not ( = ?auto_334469 ?auto_334478 ) ) ( not ( = ?auto_334469 ?auto_334479 ) ) ( not ( = ?auto_334469 ?auto_334480 ) ) ( not ( = ?auto_334469 ?auto_334481 ) ) ( not ( = ?auto_334470 ?auto_334471 ) ) ( not ( = ?auto_334470 ?auto_334472 ) ) ( not ( = ?auto_334470 ?auto_334473 ) ) ( not ( = ?auto_334470 ?auto_334474 ) ) ( not ( = ?auto_334470 ?auto_334475 ) ) ( not ( = ?auto_334470 ?auto_334476 ) ) ( not ( = ?auto_334470 ?auto_334477 ) ) ( not ( = ?auto_334470 ?auto_334478 ) ) ( not ( = ?auto_334470 ?auto_334479 ) ) ( not ( = ?auto_334470 ?auto_334480 ) ) ( not ( = ?auto_334470 ?auto_334481 ) ) ( not ( = ?auto_334471 ?auto_334472 ) ) ( not ( = ?auto_334471 ?auto_334473 ) ) ( not ( = ?auto_334471 ?auto_334474 ) ) ( not ( = ?auto_334471 ?auto_334475 ) ) ( not ( = ?auto_334471 ?auto_334476 ) ) ( not ( = ?auto_334471 ?auto_334477 ) ) ( not ( = ?auto_334471 ?auto_334478 ) ) ( not ( = ?auto_334471 ?auto_334479 ) ) ( not ( = ?auto_334471 ?auto_334480 ) ) ( not ( = ?auto_334471 ?auto_334481 ) ) ( not ( = ?auto_334472 ?auto_334473 ) ) ( not ( = ?auto_334472 ?auto_334474 ) ) ( not ( = ?auto_334472 ?auto_334475 ) ) ( not ( = ?auto_334472 ?auto_334476 ) ) ( not ( = ?auto_334472 ?auto_334477 ) ) ( not ( = ?auto_334472 ?auto_334478 ) ) ( not ( = ?auto_334472 ?auto_334479 ) ) ( not ( = ?auto_334472 ?auto_334480 ) ) ( not ( = ?auto_334472 ?auto_334481 ) ) ( not ( = ?auto_334473 ?auto_334474 ) ) ( not ( = ?auto_334473 ?auto_334475 ) ) ( not ( = ?auto_334473 ?auto_334476 ) ) ( not ( = ?auto_334473 ?auto_334477 ) ) ( not ( = ?auto_334473 ?auto_334478 ) ) ( not ( = ?auto_334473 ?auto_334479 ) ) ( not ( = ?auto_334473 ?auto_334480 ) ) ( not ( = ?auto_334473 ?auto_334481 ) ) ( not ( = ?auto_334474 ?auto_334475 ) ) ( not ( = ?auto_334474 ?auto_334476 ) ) ( not ( = ?auto_334474 ?auto_334477 ) ) ( not ( = ?auto_334474 ?auto_334478 ) ) ( not ( = ?auto_334474 ?auto_334479 ) ) ( not ( = ?auto_334474 ?auto_334480 ) ) ( not ( = ?auto_334474 ?auto_334481 ) ) ( not ( = ?auto_334475 ?auto_334476 ) ) ( not ( = ?auto_334475 ?auto_334477 ) ) ( not ( = ?auto_334475 ?auto_334478 ) ) ( not ( = ?auto_334475 ?auto_334479 ) ) ( not ( = ?auto_334475 ?auto_334480 ) ) ( not ( = ?auto_334475 ?auto_334481 ) ) ( not ( = ?auto_334476 ?auto_334477 ) ) ( not ( = ?auto_334476 ?auto_334478 ) ) ( not ( = ?auto_334476 ?auto_334479 ) ) ( not ( = ?auto_334476 ?auto_334480 ) ) ( not ( = ?auto_334476 ?auto_334481 ) ) ( not ( = ?auto_334477 ?auto_334478 ) ) ( not ( = ?auto_334477 ?auto_334479 ) ) ( not ( = ?auto_334477 ?auto_334480 ) ) ( not ( = ?auto_334477 ?auto_334481 ) ) ( not ( = ?auto_334478 ?auto_334479 ) ) ( not ( = ?auto_334478 ?auto_334480 ) ) ( not ( = ?auto_334478 ?auto_334481 ) ) ( not ( = ?auto_334479 ?auto_334480 ) ) ( not ( = ?auto_334479 ?auto_334481 ) ) ( not ( = ?auto_334480 ?auto_334481 ) ) ( ON ?auto_334480 ?auto_334481 ) ( ON ?auto_334479 ?auto_334480 ) ( ON ?auto_334478 ?auto_334479 ) ( ON ?auto_334477 ?auto_334478 ) ( ON ?auto_334476 ?auto_334477 ) ( CLEAR ?auto_334474 ) ( ON ?auto_334475 ?auto_334476 ) ( CLEAR ?auto_334475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_334468 ?auto_334469 ?auto_334470 ?auto_334471 ?auto_334472 ?auto_334473 ?auto_334474 ?auto_334475 )
      ( MAKE-14PILE ?auto_334468 ?auto_334469 ?auto_334470 ?auto_334471 ?auto_334472 ?auto_334473 ?auto_334474 ?auto_334475 ?auto_334476 ?auto_334477 ?auto_334478 ?auto_334479 ?auto_334480 ?auto_334481 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334496 - BLOCK
      ?auto_334497 - BLOCK
      ?auto_334498 - BLOCK
      ?auto_334499 - BLOCK
      ?auto_334500 - BLOCK
      ?auto_334501 - BLOCK
      ?auto_334502 - BLOCK
      ?auto_334503 - BLOCK
      ?auto_334504 - BLOCK
      ?auto_334505 - BLOCK
      ?auto_334506 - BLOCK
      ?auto_334507 - BLOCK
      ?auto_334508 - BLOCK
      ?auto_334509 - BLOCK
    )
    :vars
    (
      ?auto_334510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334509 ?auto_334510 ) ( ON-TABLE ?auto_334496 ) ( ON ?auto_334497 ?auto_334496 ) ( ON ?auto_334498 ?auto_334497 ) ( ON ?auto_334499 ?auto_334498 ) ( ON ?auto_334500 ?auto_334499 ) ( ON ?auto_334501 ?auto_334500 ) ( not ( = ?auto_334496 ?auto_334497 ) ) ( not ( = ?auto_334496 ?auto_334498 ) ) ( not ( = ?auto_334496 ?auto_334499 ) ) ( not ( = ?auto_334496 ?auto_334500 ) ) ( not ( = ?auto_334496 ?auto_334501 ) ) ( not ( = ?auto_334496 ?auto_334502 ) ) ( not ( = ?auto_334496 ?auto_334503 ) ) ( not ( = ?auto_334496 ?auto_334504 ) ) ( not ( = ?auto_334496 ?auto_334505 ) ) ( not ( = ?auto_334496 ?auto_334506 ) ) ( not ( = ?auto_334496 ?auto_334507 ) ) ( not ( = ?auto_334496 ?auto_334508 ) ) ( not ( = ?auto_334496 ?auto_334509 ) ) ( not ( = ?auto_334496 ?auto_334510 ) ) ( not ( = ?auto_334497 ?auto_334498 ) ) ( not ( = ?auto_334497 ?auto_334499 ) ) ( not ( = ?auto_334497 ?auto_334500 ) ) ( not ( = ?auto_334497 ?auto_334501 ) ) ( not ( = ?auto_334497 ?auto_334502 ) ) ( not ( = ?auto_334497 ?auto_334503 ) ) ( not ( = ?auto_334497 ?auto_334504 ) ) ( not ( = ?auto_334497 ?auto_334505 ) ) ( not ( = ?auto_334497 ?auto_334506 ) ) ( not ( = ?auto_334497 ?auto_334507 ) ) ( not ( = ?auto_334497 ?auto_334508 ) ) ( not ( = ?auto_334497 ?auto_334509 ) ) ( not ( = ?auto_334497 ?auto_334510 ) ) ( not ( = ?auto_334498 ?auto_334499 ) ) ( not ( = ?auto_334498 ?auto_334500 ) ) ( not ( = ?auto_334498 ?auto_334501 ) ) ( not ( = ?auto_334498 ?auto_334502 ) ) ( not ( = ?auto_334498 ?auto_334503 ) ) ( not ( = ?auto_334498 ?auto_334504 ) ) ( not ( = ?auto_334498 ?auto_334505 ) ) ( not ( = ?auto_334498 ?auto_334506 ) ) ( not ( = ?auto_334498 ?auto_334507 ) ) ( not ( = ?auto_334498 ?auto_334508 ) ) ( not ( = ?auto_334498 ?auto_334509 ) ) ( not ( = ?auto_334498 ?auto_334510 ) ) ( not ( = ?auto_334499 ?auto_334500 ) ) ( not ( = ?auto_334499 ?auto_334501 ) ) ( not ( = ?auto_334499 ?auto_334502 ) ) ( not ( = ?auto_334499 ?auto_334503 ) ) ( not ( = ?auto_334499 ?auto_334504 ) ) ( not ( = ?auto_334499 ?auto_334505 ) ) ( not ( = ?auto_334499 ?auto_334506 ) ) ( not ( = ?auto_334499 ?auto_334507 ) ) ( not ( = ?auto_334499 ?auto_334508 ) ) ( not ( = ?auto_334499 ?auto_334509 ) ) ( not ( = ?auto_334499 ?auto_334510 ) ) ( not ( = ?auto_334500 ?auto_334501 ) ) ( not ( = ?auto_334500 ?auto_334502 ) ) ( not ( = ?auto_334500 ?auto_334503 ) ) ( not ( = ?auto_334500 ?auto_334504 ) ) ( not ( = ?auto_334500 ?auto_334505 ) ) ( not ( = ?auto_334500 ?auto_334506 ) ) ( not ( = ?auto_334500 ?auto_334507 ) ) ( not ( = ?auto_334500 ?auto_334508 ) ) ( not ( = ?auto_334500 ?auto_334509 ) ) ( not ( = ?auto_334500 ?auto_334510 ) ) ( not ( = ?auto_334501 ?auto_334502 ) ) ( not ( = ?auto_334501 ?auto_334503 ) ) ( not ( = ?auto_334501 ?auto_334504 ) ) ( not ( = ?auto_334501 ?auto_334505 ) ) ( not ( = ?auto_334501 ?auto_334506 ) ) ( not ( = ?auto_334501 ?auto_334507 ) ) ( not ( = ?auto_334501 ?auto_334508 ) ) ( not ( = ?auto_334501 ?auto_334509 ) ) ( not ( = ?auto_334501 ?auto_334510 ) ) ( not ( = ?auto_334502 ?auto_334503 ) ) ( not ( = ?auto_334502 ?auto_334504 ) ) ( not ( = ?auto_334502 ?auto_334505 ) ) ( not ( = ?auto_334502 ?auto_334506 ) ) ( not ( = ?auto_334502 ?auto_334507 ) ) ( not ( = ?auto_334502 ?auto_334508 ) ) ( not ( = ?auto_334502 ?auto_334509 ) ) ( not ( = ?auto_334502 ?auto_334510 ) ) ( not ( = ?auto_334503 ?auto_334504 ) ) ( not ( = ?auto_334503 ?auto_334505 ) ) ( not ( = ?auto_334503 ?auto_334506 ) ) ( not ( = ?auto_334503 ?auto_334507 ) ) ( not ( = ?auto_334503 ?auto_334508 ) ) ( not ( = ?auto_334503 ?auto_334509 ) ) ( not ( = ?auto_334503 ?auto_334510 ) ) ( not ( = ?auto_334504 ?auto_334505 ) ) ( not ( = ?auto_334504 ?auto_334506 ) ) ( not ( = ?auto_334504 ?auto_334507 ) ) ( not ( = ?auto_334504 ?auto_334508 ) ) ( not ( = ?auto_334504 ?auto_334509 ) ) ( not ( = ?auto_334504 ?auto_334510 ) ) ( not ( = ?auto_334505 ?auto_334506 ) ) ( not ( = ?auto_334505 ?auto_334507 ) ) ( not ( = ?auto_334505 ?auto_334508 ) ) ( not ( = ?auto_334505 ?auto_334509 ) ) ( not ( = ?auto_334505 ?auto_334510 ) ) ( not ( = ?auto_334506 ?auto_334507 ) ) ( not ( = ?auto_334506 ?auto_334508 ) ) ( not ( = ?auto_334506 ?auto_334509 ) ) ( not ( = ?auto_334506 ?auto_334510 ) ) ( not ( = ?auto_334507 ?auto_334508 ) ) ( not ( = ?auto_334507 ?auto_334509 ) ) ( not ( = ?auto_334507 ?auto_334510 ) ) ( not ( = ?auto_334508 ?auto_334509 ) ) ( not ( = ?auto_334508 ?auto_334510 ) ) ( not ( = ?auto_334509 ?auto_334510 ) ) ( ON ?auto_334508 ?auto_334509 ) ( ON ?auto_334507 ?auto_334508 ) ( ON ?auto_334506 ?auto_334507 ) ( ON ?auto_334505 ?auto_334506 ) ( ON ?auto_334504 ?auto_334505 ) ( ON ?auto_334503 ?auto_334504 ) ( CLEAR ?auto_334501 ) ( ON ?auto_334502 ?auto_334503 ) ( CLEAR ?auto_334502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_334496 ?auto_334497 ?auto_334498 ?auto_334499 ?auto_334500 ?auto_334501 ?auto_334502 )
      ( MAKE-14PILE ?auto_334496 ?auto_334497 ?auto_334498 ?auto_334499 ?auto_334500 ?auto_334501 ?auto_334502 ?auto_334503 ?auto_334504 ?auto_334505 ?auto_334506 ?auto_334507 ?auto_334508 ?auto_334509 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334525 - BLOCK
      ?auto_334526 - BLOCK
      ?auto_334527 - BLOCK
      ?auto_334528 - BLOCK
      ?auto_334529 - BLOCK
      ?auto_334530 - BLOCK
      ?auto_334531 - BLOCK
      ?auto_334532 - BLOCK
      ?auto_334533 - BLOCK
      ?auto_334534 - BLOCK
      ?auto_334535 - BLOCK
      ?auto_334536 - BLOCK
      ?auto_334537 - BLOCK
      ?auto_334538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_334538 ) ( ON-TABLE ?auto_334525 ) ( ON ?auto_334526 ?auto_334525 ) ( ON ?auto_334527 ?auto_334526 ) ( ON ?auto_334528 ?auto_334527 ) ( ON ?auto_334529 ?auto_334528 ) ( ON ?auto_334530 ?auto_334529 ) ( not ( = ?auto_334525 ?auto_334526 ) ) ( not ( = ?auto_334525 ?auto_334527 ) ) ( not ( = ?auto_334525 ?auto_334528 ) ) ( not ( = ?auto_334525 ?auto_334529 ) ) ( not ( = ?auto_334525 ?auto_334530 ) ) ( not ( = ?auto_334525 ?auto_334531 ) ) ( not ( = ?auto_334525 ?auto_334532 ) ) ( not ( = ?auto_334525 ?auto_334533 ) ) ( not ( = ?auto_334525 ?auto_334534 ) ) ( not ( = ?auto_334525 ?auto_334535 ) ) ( not ( = ?auto_334525 ?auto_334536 ) ) ( not ( = ?auto_334525 ?auto_334537 ) ) ( not ( = ?auto_334525 ?auto_334538 ) ) ( not ( = ?auto_334526 ?auto_334527 ) ) ( not ( = ?auto_334526 ?auto_334528 ) ) ( not ( = ?auto_334526 ?auto_334529 ) ) ( not ( = ?auto_334526 ?auto_334530 ) ) ( not ( = ?auto_334526 ?auto_334531 ) ) ( not ( = ?auto_334526 ?auto_334532 ) ) ( not ( = ?auto_334526 ?auto_334533 ) ) ( not ( = ?auto_334526 ?auto_334534 ) ) ( not ( = ?auto_334526 ?auto_334535 ) ) ( not ( = ?auto_334526 ?auto_334536 ) ) ( not ( = ?auto_334526 ?auto_334537 ) ) ( not ( = ?auto_334526 ?auto_334538 ) ) ( not ( = ?auto_334527 ?auto_334528 ) ) ( not ( = ?auto_334527 ?auto_334529 ) ) ( not ( = ?auto_334527 ?auto_334530 ) ) ( not ( = ?auto_334527 ?auto_334531 ) ) ( not ( = ?auto_334527 ?auto_334532 ) ) ( not ( = ?auto_334527 ?auto_334533 ) ) ( not ( = ?auto_334527 ?auto_334534 ) ) ( not ( = ?auto_334527 ?auto_334535 ) ) ( not ( = ?auto_334527 ?auto_334536 ) ) ( not ( = ?auto_334527 ?auto_334537 ) ) ( not ( = ?auto_334527 ?auto_334538 ) ) ( not ( = ?auto_334528 ?auto_334529 ) ) ( not ( = ?auto_334528 ?auto_334530 ) ) ( not ( = ?auto_334528 ?auto_334531 ) ) ( not ( = ?auto_334528 ?auto_334532 ) ) ( not ( = ?auto_334528 ?auto_334533 ) ) ( not ( = ?auto_334528 ?auto_334534 ) ) ( not ( = ?auto_334528 ?auto_334535 ) ) ( not ( = ?auto_334528 ?auto_334536 ) ) ( not ( = ?auto_334528 ?auto_334537 ) ) ( not ( = ?auto_334528 ?auto_334538 ) ) ( not ( = ?auto_334529 ?auto_334530 ) ) ( not ( = ?auto_334529 ?auto_334531 ) ) ( not ( = ?auto_334529 ?auto_334532 ) ) ( not ( = ?auto_334529 ?auto_334533 ) ) ( not ( = ?auto_334529 ?auto_334534 ) ) ( not ( = ?auto_334529 ?auto_334535 ) ) ( not ( = ?auto_334529 ?auto_334536 ) ) ( not ( = ?auto_334529 ?auto_334537 ) ) ( not ( = ?auto_334529 ?auto_334538 ) ) ( not ( = ?auto_334530 ?auto_334531 ) ) ( not ( = ?auto_334530 ?auto_334532 ) ) ( not ( = ?auto_334530 ?auto_334533 ) ) ( not ( = ?auto_334530 ?auto_334534 ) ) ( not ( = ?auto_334530 ?auto_334535 ) ) ( not ( = ?auto_334530 ?auto_334536 ) ) ( not ( = ?auto_334530 ?auto_334537 ) ) ( not ( = ?auto_334530 ?auto_334538 ) ) ( not ( = ?auto_334531 ?auto_334532 ) ) ( not ( = ?auto_334531 ?auto_334533 ) ) ( not ( = ?auto_334531 ?auto_334534 ) ) ( not ( = ?auto_334531 ?auto_334535 ) ) ( not ( = ?auto_334531 ?auto_334536 ) ) ( not ( = ?auto_334531 ?auto_334537 ) ) ( not ( = ?auto_334531 ?auto_334538 ) ) ( not ( = ?auto_334532 ?auto_334533 ) ) ( not ( = ?auto_334532 ?auto_334534 ) ) ( not ( = ?auto_334532 ?auto_334535 ) ) ( not ( = ?auto_334532 ?auto_334536 ) ) ( not ( = ?auto_334532 ?auto_334537 ) ) ( not ( = ?auto_334532 ?auto_334538 ) ) ( not ( = ?auto_334533 ?auto_334534 ) ) ( not ( = ?auto_334533 ?auto_334535 ) ) ( not ( = ?auto_334533 ?auto_334536 ) ) ( not ( = ?auto_334533 ?auto_334537 ) ) ( not ( = ?auto_334533 ?auto_334538 ) ) ( not ( = ?auto_334534 ?auto_334535 ) ) ( not ( = ?auto_334534 ?auto_334536 ) ) ( not ( = ?auto_334534 ?auto_334537 ) ) ( not ( = ?auto_334534 ?auto_334538 ) ) ( not ( = ?auto_334535 ?auto_334536 ) ) ( not ( = ?auto_334535 ?auto_334537 ) ) ( not ( = ?auto_334535 ?auto_334538 ) ) ( not ( = ?auto_334536 ?auto_334537 ) ) ( not ( = ?auto_334536 ?auto_334538 ) ) ( not ( = ?auto_334537 ?auto_334538 ) ) ( ON ?auto_334537 ?auto_334538 ) ( ON ?auto_334536 ?auto_334537 ) ( ON ?auto_334535 ?auto_334536 ) ( ON ?auto_334534 ?auto_334535 ) ( ON ?auto_334533 ?auto_334534 ) ( ON ?auto_334532 ?auto_334533 ) ( CLEAR ?auto_334530 ) ( ON ?auto_334531 ?auto_334532 ) ( CLEAR ?auto_334531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_334525 ?auto_334526 ?auto_334527 ?auto_334528 ?auto_334529 ?auto_334530 ?auto_334531 )
      ( MAKE-14PILE ?auto_334525 ?auto_334526 ?auto_334527 ?auto_334528 ?auto_334529 ?auto_334530 ?auto_334531 ?auto_334532 ?auto_334533 ?auto_334534 ?auto_334535 ?auto_334536 ?auto_334537 ?auto_334538 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334553 - BLOCK
      ?auto_334554 - BLOCK
      ?auto_334555 - BLOCK
      ?auto_334556 - BLOCK
      ?auto_334557 - BLOCK
      ?auto_334558 - BLOCK
      ?auto_334559 - BLOCK
      ?auto_334560 - BLOCK
      ?auto_334561 - BLOCK
      ?auto_334562 - BLOCK
      ?auto_334563 - BLOCK
      ?auto_334564 - BLOCK
      ?auto_334565 - BLOCK
      ?auto_334566 - BLOCK
    )
    :vars
    (
      ?auto_334567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334566 ?auto_334567 ) ( ON-TABLE ?auto_334553 ) ( ON ?auto_334554 ?auto_334553 ) ( ON ?auto_334555 ?auto_334554 ) ( ON ?auto_334556 ?auto_334555 ) ( ON ?auto_334557 ?auto_334556 ) ( not ( = ?auto_334553 ?auto_334554 ) ) ( not ( = ?auto_334553 ?auto_334555 ) ) ( not ( = ?auto_334553 ?auto_334556 ) ) ( not ( = ?auto_334553 ?auto_334557 ) ) ( not ( = ?auto_334553 ?auto_334558 ) ) ( not ( = ?auto_334553 ?auto_334559 ) ) ( not ( = ?auto_334553 ?auto_334560 ) ) ( not ( = ?auto_334553 ?auto_334561 ) ) ( not ( = ?auto_334553 ?auto_334562 ) ) ( not ( = ?auto_334553 ?auto_334563 ) ) ( not ( = ?auto_334553 ?auto_334564 ) ) ( not ( = ?auto_334553 ?auto_334565 ) ) ( not ( = ?auto_334553 ?auto_334566 ) ) ( not ( = ?auto_334553 ?auto_334567 ) ) ( not ( = ?auto_334554 ?auto_334555 ) ) ( not ( = ?auto_334554 ?auto_334556 ) ) ( not ( = ?auto_334554 ?auto_334557 ) ) ( not ( = ?auto_334554 ?auto_334558 ) ) ( not ( = ?auto_334554 ?auto_334559 ) ) ( not ( = ?auto_334554 ?auto_334560 ) ) ( not ( = ?auto_334554 ?auto_334561 ) ) ( not ( = ?auto_334554 ?auto_334562 ) ) ( not ( = ?auto_334554 ?auto_334563 ) ) ( not ( = ?auto_334554 ?auto_334564 ) ) ( not ( = ?auto_334554 ?auto_334565 ) ) ( not ( = ?auto_334554 ?auto_334566 ) ) ( not ( = ?auto_334554 ?auto_334567 ) ) ( not ( = ?auto_334555 ?auto_334556 ) ) ( not ( = ?auto_334555 ?auto_334557 ) ) ( not ( = ?auto_334555 ?auto_334558 ) ) ( not ( = ?auto_334555 ?auto_334559 ) ) ( not ( = ?auto_334555 ?auto_334560 ) ) ( not ( = ?auto_334555 ?auto_334561 ) ) ( not ( = ?auto_334555 ?auto_334562 ) ) ( not ( = ?auto_334555 ?auto_334563 ) ) ( not ( = ?auto_334555 ?auto_334564 ) ) ( not ( = ?auto_334555 ?auto_334565 ) ) ( not ( = ?auto_334555 ?auto_334566 ) ) ( not ( = ?auto_334555 ?auto_334567 ) ) ( not ( = ?auto_334556 ?auto_334557 ) ) ( not ( = ?auto_334556 ?auto_334558 ) ) ( not ( = ?auto_334556 ?auto_334559 ) ) ( not ( = ?auto_334556 ?auto_334560 ) ) ( not ( = ?auto_334556 ?auto_334561 ) ) ( not ( = ?auto_334556 ?auto_334562 ) ) ( not ( = ?auto_334556 ?auto_334563 ) ) ( not ( = ?auto_334556 ?auto_334564 ) ) ( not ( = ?auto_334556 ?auto_334565 ) ) ( not ( = ?auto_334556 ?auto_334566 ) ) ( not ( = ?auto_334556 ?auto_334567 ) ) ( not ( = ?auto_334557 ?auto_334558 ) ) ( not ( = ?auto_334557 ?auto_334559 ) ) ( not ( = ?auto_334557 ?auto_334560 ) ) ( not ( = ?auto_334557 ?auto_334561 ) ) ( not ( = ?auto_334557 ?auto_334562 ) ) ( not ( = ?auto_334557 ?auto_334563 ) ) ( not ( = ?auto_334557 ?auto_334564 ) ) ( not ( = ?auto_334557 ?auto_334565 ) ) ( not ( = ?auto_334557 ?auto_334566 ) ) ( not ( = ?auto_334557 ?auto_334567 ) ) ( not ( = ?auto_334558 ?auto_334559 ) ) ( not ( = ?auto_334558 ?auto_334560 ) ) ( not ( = ?auto_334558 ?auto_334561 ) ) ( not ( = ?auto_334558 ?auto_334562 ) ) ( not ( = ?auto_334558 ?auto_334563 ) ) ( not ( = ?auto_334558 ?auto_334564 ) ) ( not ( = ?auto_334558 ?auto_334565 ) ) ( not ( = ?auto_334558 ?auto_334566 ) ) ( not ( = ?auto_334558 ?auto_334567 ) ) ( not ( = ?auto_334559 ?auto_334560 ) ) ( not ( = ?auto_334559 ?auto_334561 ) ) ( not ( = ?auto_334559 ?auto_334562 ) ) ( not ( = ?auto_334559 ?auto_334563 ) ) ( not ( = ?auto_334559 ?auto_334564 ) ) ( not ( = ?auto_334559 ?auto_334565 ) ) ( not ( = ?auto_334559 ?auto_334566 ) ) ( not ( = ?auto_334559 ?auto_334567 ) ) ( not ( = ?auto_334560 ?auto_334561 ) ) ( not ( = ?auto_334560 ?auto_334562 ) ) ( not ( = ?auto_334560 ?auto_334563 ) ) ( not ( = ?auto_334560 ?auto_334564 ) ) ( not ( = ?auto_334560 ?auto_334565 ) ) ( not ( = ?auto_334560 ?auto_334566 ) ) ( not ( = ?auto_334560 ?auto_334567 ) ) ( not ( = ?auto_334561 ?auto_334562 ) ) ( not ( = ?auto_334561 ?auto_334563 ) ) ( not ( = ?auto_334561 ?auto_334564 ) ) ( not ( = ?auto_334561 ?auto_334565 ) ) ( not ( = ?auto_334561 ?auto_334566 ) ) ( not ( = ?auto_334561 ?auto_334567 ) ) ( not ( = ?auto_334562 ?auto_334563 ) ) ( not ( = ?auto_334562 ?auto_334564 ) ) ( not ( = ?auto_334562 ?auto_334565 ) ) ( not ( = ?auto_334562 ?auto_334566 ) ) ( not ( = ?auto_334562 ?auto_334567 ) ) ( not ( = ?auto_334563 ?auto_334564 ) ) ( not ( = ?auto_334563 ?auto_334565 ) ) ( not ( = ?auto_334563 ?auto_334566 ) ) ( not ( = ?auto_334563 ?auto_334567 ) ) ( not ( = ?auto_334564 ?auto_334565 ) ) ( not ( = ?auto_334564 ?auto_334566 ) ) ( not ( = ?auto_334564 ?auto_334567 ) ) ( not ( = ?auto_334565 ?auto_334566 ) ) ( not ( = ?auto_334565 ?auto_334567 ) ) ( not ( = ?auto_334566 ?auto_334567 ) ) ( ON ?auto_334565 ?auto_334566 ) ( ON ?auto_334564 ?auto_334565 ) ( ON ?auto_334563 ?auto_334564 ) ( ON ?auto_334562 ?auto_334563 ) ( ON ?auto_334561 ?auto_334562 ) ( ON ?auto_334560 ?auto_334561 ) ( ON ?auto_334559 ?auto_334560 ) ( CLEAR ?auto_334557 ) ( ON ?auto_334558 ?auto_334559 ) ( CLEAR ?auto_334558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_334553 ?auto_334554 ?auto_334555 ?auto_334556 ?auto_334557 ?auto_334558 )
      ( MAKE-14PILE ?auto_334553 ?auto_334554 ?auto_334555 ?auto_334556 ?auto_334557 ?auto_334558 ?auto_334559 ?auto_334560 ?auto_334561 ?auto_334562 ?auto_334563 ?auto_334564 ?auto_334565 ?auto_334566 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334582 - BLOCK
      ?auto_334583 - BLOCK
      ?auto_334584 - BLOCK
      ?auto_334585 - BLOCK
      ?auto_334586 - BLOCK
      ?auto_334587 - BLOCK
      ?auto_334588 - BLOCK
      ?auto_334589 - BLOCK
      ?auto_334590 - BLOCK
      ?auto_334591 - BLOCK
      ?auto_334592 - BLOCK
      ?auto_334593 - BLOCK
      ?auto_334594 - BLOCK
      ?auto_334595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_334595 ) ( ON-TABLE ?auto_334582 ) ( ON ?auto_334583 ?auto_334582 ) ( ON ?auto_334584 ?auto_334583 ) ( ON ?auto_334585 ?auto_334584 ) ( ON ?auto_334586 ?auto_334585 ) ( not ( = ?auto_334582 ?auto_334583 ) ) ( not ( = ?auto_334582 ?auto_334584 ) ) ( not ( = ?auto_334582 ?auto_334585 ) ) ( not ( = ?auto_334582 ?auto_334586 ) ) ( not ( = ?auto_334582 ?auto_334587 ) ) ( not ( = ?auto_334582 ?auto_334588 ) ) ( not ( = ?auto_334582 ?auto_334589 ) ) ( not ( = ?auto_334582 ?auto_334590 ) ) ( not ( = ?auto_334582 ?auto_334591 ) ) ( not ( = ?auto_334582 ?auto_334592 ) ) ( not ( = ?auto_334582 ?auto_334593 ) ) ( not ( = ?auto_334582 ?auto_334594 ) ) ( not ( = ?auto_334582 ?auto_334595 ) ) ( not ( = ?auto_334583 ?auto_334584 ) ) ( not ( = ?auto_334583 ?auto_334585 ) ) ( not ( = ?auto_334583 ?auto_334586 ) ) ( not ( = ?auto_334583 ?auto_334587 ) ) ( not ( = ?auto_334583 ?auto_334588 ) ) ( not ( = ?auto_334583 ?auto_334589 ) ) ( not ( = ?auto_334583 ?auto_334590 ) ) ( not ( = ?auto_334583 ?auto_334591 ) ) ( not ( = ?auto_334583 ?auto_334592 ) ) ( not ( = ?auto_334583 ?auto_334593 ) ) ( not ( = ?auto_334583 ?auto_334594 ) ) ( not ( = ?auto_334583 ?auto_334595 ) ) ( not ( = ?auto_334584 ?auto_334585 ) ) ( not ( = ?auto_334584 ?auto_334586 ) ) ( not ( = ?auto_334584 ?auto_334587 ) ) ( not ( = ?auto_334584 ?auto_334588 ) ) ( not ( = ?auto_334584 ?auto_334589 ) ) ( not ( = ?auto_334584 ?auto_334590 ) ) ( not ( = ?auto_334584 ?auto_334591 ) ) ( not ( = ?auto_334584 ?auto_334592 ) ) ( not ( = ?auto_334584 ?auto_334593 ) ) ( not ( = ?auto_334584 ?auto_334594 ) ) ( not ( = ?auto_334584 ?auto_334595 ) ) ( not ( = ?auto_334585 ?auto_334586 ) ) ( not ( = ?auto_334585 ?auto_334587 ) ) ( not ( = ?auto_334585 ?auto_334588 ) ) ( not ( = ?auto_334585 ?auto_334589 ) ) ( not ( = ?auto_334585 ?auto_334590 ) ) ( not ( = ?auto_334585 ?auto_334591 ) ) ( not ( = ?auto_334585 ?auto_334592 ) ) ( not ( = ?auto_334585 ?auto_334593 ) ) ( not ( = ?auto_334585 ?auto_334594 ) ) ( not ( = ?auto_334585 ?auto_334595 ) ) ( not ( = ?auto_334586 ?auto_334587 ) ) ( not ( = ?auto_334586 ?auto_334588 ) ) ( not ( = ?auto_334586 ?auto_334589 ) ) ( not ( = ?auto_334586 ?auto_334590 ) ) ( not ( = ?auto_334586 ?auto_334591 ) ) ( not ( = ?auto_334586 ?auto_334592 ) ) ( not ( = ?auto_334586 ?auto_334593 ) ) ( not ( = ?auto_334586 ?auto_334594 ) ) ( not ( = ?auto_334586 ?auto_334595 ) ) ( not ( = ?auto_334587 ?auto_334588 ) ) ( not ( = ?auto_334587 ?auto_334589 ) ) ( not ( = ?auto_334587 ?auto_334590 ) ) ( not ( = ?auto_334587 ?auto_334591 ) ) ( not ( = ?auto_334587 ?auto_334592 ) ) ( not ( = ?auto_334587 ?auto_334593 ) ) ( not ( = ?auto_334587 ?auto_334594 ) ) ( not ( = ?auto_334587 ?auto_334595 ) ) ( not ( = ?auto_334588 ?auto_334589 ) ) ( not ( = ?auto_334588 ?auto_334590 ) ) ( not ( = ?auto_334588 ?auto_334591 ) ) ( not ( = ?auto_334588 ?auto_334592 ) ) ( not ( = ?auto_334588 ?auto_334593 ) ) ( not ( = ?auto_334588 ?auto_334594 ) ) ( not ( = ?auto_334588 ?auto_334595 ) ) ( not ( = ?auto_334589 ?auto_334590 ) ) ( not ( = ?auto_334589 ?auto_334591 ) ) ( not ( = ?auto_334589 ?auto_334592 ) ) ( not ( = ?auto_334589 ?auto_334593 ) ) ( not ( = ?auto_334589 ?auto_334594 ) ) ( not ( = ?auto_334589 ?auto_334595 ) ) ( not ( = ?auto_334590 ?auto_334591 ) ) ( not ( = ?auto_334590 ?auto_334592 ) ) ( not ( = ?auto_334590 ?auto_334593 ) ) ( not ( = ?auto_334590 ?auto_334594 ) ) ( not ( = ?auto_334590 ?auto_334595 ) ) ( not ( = ?auto_334591 ?auto_334592 ) ) ( not ( = ?auto_334591 ?auto_334593 ) ) ( not ( = ?auto_334591 ?auto_334594 ) ) ( not ( = ?auto_334591 ?auto_334595 ) ) ( not ( = ?auto_334592 ?auto_334593 ) ) ( not ( = ?auto_334592 ?auto_334594 ) ) ( not ( = ?auto_334592 ?auto_334595 ) ) ( not ( = ?auto_334593 ?auto_334594 ) ) ( not ( = ?auto_334593 ?auto_334595 ) ) ( not ( = ?auto_334594 ?auto_334595 ) ) ( ON ?auto_334594 ?auto_334595 ) ( ON ?auto_334593 ?auto_334594 ) ( ON ?auto_334592 ?auto_334593 ) ( ON ?auto_334591 ?auto_334592 ) ( ON ?auto_334590 ?auto_334591 ) ( ON ?auto_334589 ?auto_334590 ) ( ON ?auto_334588 ?auto_334589 ) ( CLEAR ?auto_334586 ) ( ON ?auto_334587 ?auto_334588 ) ( CLEAR ?auto_334587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_334582 ?auto_334583 ?auto_334584 ?auto_334585 ?auto_334586 ?auto_334587 )
      ( MAKE-14PILE ?auto_334582 ?auto_334583 ?auto_334584 ?auto_334585 ?auto_334586 ?auto_334587 ?auto_334588 ?auto_334589 ?auto_334590 ?auto_334591 ?auto_334592 ?auto_334593 ?auto_334594 ?auto_334595 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334610 - BLOCK
      ?auto_334611 - BLOCK
      ?auto_334612 - BLOCK
      ?auto_334613 - BLOCK
      ?auto_334614 - BLOCK
      ?auto_334615 - BLOCK
      ?auto_334616 - BLOCK
      ?auto_334617 - BLOCK
      ?auto_334618 - BLOCK
      ?auto_334619 - BLOCK
      ?auto_334620 - BLOCK
      ?auto_334621 - BLOCK
      ?auto_334622 - BLOCK
      ?auto_334623 - BLOCK
    )
    :vars
    (
      ?auto_334624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334623 ?auto_334624 ) ( ON-TABLE ?auto_334610 ) ( ON ?auto_334611 ?auto_334610 ) ( ON ?auto_334612 ?auto_334611 ) ( ON ?auto_334613 ?auto_334612 ) ( not ( = ?auto_334610 ?auto_334611 ) ) ( not ( = ?auto_334610 ?auto_334612 ) ) ( not ( = ?auto_334610 ?auto_334613 ) ) ( not ( = ?auto_334610 ?auto_334614 ) ) ( not ( = ?auto_334610 ?auto_334615 ) ) ( not ( = ?auto_334610 ?auto_334616 ) ) ( not ( = ?auto_334610 ?auto_334617 ) ) ( not ( = ?auto_334610 ?auto_334618 ) ) ( not ( = ?auto_334610 ?auto_334619 ) ) ( not ( = ?auto_334610 ?auto_334620 ) ) ( not ( = ?auto_334610 ?auto_334621 ) ) ( not ( = ?auto_334610 ?auto_334622 ) ) ( not ( = ?auto_334610 ?auto_334623 ) ) ( not ( = ?auto_334610 ?auto_334624 ) ) ( not ( = ?auto_334611 ?auto_334612 ) ) ( not ( = ?auto_334611 ?auto_334613 ) ) ( not ( = ?auto_334611 ?auto_334614 ) ) ( not ( = ?auto_334611 ?auto_334615 ) ) ( not ( = ?auto_334611 ?auto_334616 ) ) ( not ( = ?auto_334611 ?auto_334617 ) ) ( not ( = ?auto_334611 ?auto_334618 ) ) ( not ( = ?auto_334611 ?auto_334619 ) ) ( not ( = ?auto_334611 ?auto_334620 ) ) ( not ( = ?auto_334611 ?auto_334621 ) ) ( not ( = ?auto_334611 ?auto_334622 ) ) ( not ( = ?auto_334611 ?auto_334623 ) ) ( not ( = ?auto_334611 ?auto_334624 ) ) ( not ( = ?auto_334612 ?auto_334613 ) ) ( not ( = ?auto_334612 ?auto_334614 ) ) ( not ( = ?auto_334612 ?auto_334615 ) ) ( not ( = ?auto_334612 ?auto_334616 ) ) ( not ( = ?auto_334612 ?auto_334617 ) ) ( not ( = ?auto_334612 ?auto_334618 ) ) ( not ( = ?auto_334612 ?auto_334619 ) ) ( not ( = ?auto_334612 ?auto_334620 ) ) ( not ( = ?auto_334612 ?auto_334621 ) ) ( not ( = ?auto_334612 ?auto_334622 ) ) ( not ( = ?auto_334612 ?auto_334623 ) ) ( not ( = ?auto_334612 ?auto_334624 ) ) ( not ( = ?auto_334613 ?auto_334614 ) ) ( not ( = ?auto_334613 ?auto_334615 ) ) ( not ( = ?auto_334613 ?auto_334616 ) ) ( not ( = ?auto_334613 ?auto_334617 ) ) ( not ( = ?auto_334613 ?auto_334618 ) ) ( not ( = ?auto_334613 ?auto_334619 ) ) ( not ( = ?auto_334613 ?auto_334620 ) ) ( not ( = ?auto_334613 ?auto_334621 ) ) ( not ( = ?auto_334613 ?auto_334622 ) ) ( not ( = ?auto_334613 ?auto_334623 ) ) ( not ( = ?auto_334613 ?auto_334624 ) ) ( not ( = ?auto_334614 ?auto_334615 ) ) ( not ( = ?auto_334614 ?auto_334616 ) ) ( not ( = ?auto_334614 ?auto_334617 ) ) ( not ( = ?auto_334614 ?auto_334618 ) ) ( not ( = ?auto_334614 ?auto_334619 ) ) ( not ( = ?auto_334614 ?auto_334620 ) ) ( not ( = ?auto_334614 ?auto_334621 ) ) ( not ( = ?auto_334614 ?auto_334622 ) ) ( not ( = ?auto_334614 ?auto_334623 ) ) ( not ( = ?auto_334614 ?auto_334624 ) ) ( not ( = ?auto_334615 ?auto_334616 ) ) ( not ( = ?auto_334615 ?auto_334617 ) ) ( not ( = ?auto_334615 ?auto_334618 ) ) ( not ( = ?auto_334615 ?auto_334619 ) ) ( not ( = ?auto_334615 ?auto_334620 ) ) ( not ( = ?auto_334615 ?auto_334621 ) ) ( not ( = ?auto_334615 ?auto_334622 ) ) ( not ( = ?auto_334615 ?auto_334623 ) ) ( not ( = ?auto_334615 ?auto_334624 ) ) ( not ( = ?auto_334616 ?auto_334617 ) ) ( not ( = ?auto_334616 ?auto_334618 ) ) ( not ( = ?auto_334616 ?auto_334619 ) ) ( not ( = ?auto_334616 ?auto_334620 ) ) ( not ( = ?auto_334616 ?auto_334621 ) ) ( not ( = ?auto_334616 ?auto_334622 ) ) ( not ( = ?auto_334616 ?auto_334623 ) ) ( not ( = ?auto_334616 ?auto_334624 ) ) ( not ( = ?auto_334617 ?auto_334618 ) ) ( not ( = ?auto_334617 ?auto_334619 ) ) ( not ( = ?auto_334617 ?auto_334620 ) ) ( not ( = ?auto_334617 ?auto_334621 ) ) ( not ( = ?auto_334617 ?auto_334622 ) ) ( not ( = ?auto_334617 ?auto_334623 ) ) ( not ( = ?auto_334617 ?auto_334624 ) ) ( not ( = ?auto_334618 ?auto_334619 ) ) ( not ( = ?auto_334618 ?auto_334620 ) ) ( not ( = ?auto_334618 ?auto_334621 ) ) ( not ( = ?auto_334618 ?auto_334622 ) ) ( not ( = ?auto_334618 ?auto_334623 ) ) ( not ( = ?auto_334618 ?auto_334624 ) ) ( not ( = ?auto_334619 ?auto_334620 ) ) ( not ( = ?auto_334619 ?auto_334621 ) ) ( not ( = ?auto_334619 ?auto_334622 ) ) ( not ( = ?auto_334619 ?auto_334623 ) ) ( not ( = ?auto_334619 ?auto_334624 ) ) ( not ( = ?auto_334620 ?auto_334621 ) ) ( not ( = ?auto_334620 ?auto_334622 ) ) ( not ( = ?auto_334620 ?auto_334623 ) ) ( not ( = ?auto_334620 ?auto_334624 ) ) ( not ( = ?auto_334621 ?auto_334622 ) ) ( not ( = ?auto_334621 ?auto_334623 ) ) ( not ( = ?auto_334621 ?auto_334624 ) ) ( not ( = ?auto_334622 ?auto_334623 ) ) ( not ( = ?auto_334622 ?auto_334624 ) ) ( not ( = ?auto_334623 ?auto_334624 ) ) ( ON ?auto_334622 ?auto_334623 ) ( ON ?auto_334621 ?auto_334622 ) ( ON ?auto_334620 ?auto_334621 ) ( ON ?auto_334619 ?auto_334620 ) ( ON ?auto_334618 ?auto_334619 ) ( ON ?auto_334617 ?auto_334618 ) ( ON ?auto_334616 ?auto_334617 ) ( ON ?auto_334615 ?auto_334616 ) ( CLEAR ?auto_334613 ) ( ON ?auto_334614 ?auto_334615 ) ( CLEAR ?auto_334614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_334610 ?auto_334611 ?auto_334612 ?auto_334613 ?auto_334614 )
      ( MAKE-14PILE ?auto_334610 ?auto_334611 ?auto_334612 ?auto_334613 ?auto_334614 ?auto_334615 ?auto_334616 ?auto_334617 ?auto_334618 ?auto_334619 ?auto_334620 ?auto_334621 ?auto_334622 ?auto_334623 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334639 - BLOCK
      ?auto_334640 - BLOCK
      ?auto_334641 - BLOCK
      ?auto_334642 - BLOCK
      ?auto_334643 - BLOCK
      ?auto_334644 - BLOCK
      ?auto_334645 - BLOCK
      ?auto_334646 - BLOCK
      ?auto_334647 - BLOCK
      ?auto_334648 - BLOCK
      ?auto_334649 - BLOCK
      ?auto_334650 - BLOCK
      ?auto_334651 - BLOCK
      ?auto_334652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_334652 ) ( ON-TABLE ?auto_334639 ) ( ON ?auto_334640 ?auto_334639 ) ( ON ?auto_334641 ?auto_334640 ) ( ON ?auto_334642 ?auto_334641 ) ( not ( = ?auto_334639 ?auto_334640 ) ) ( not ( = ?auto_334639 ?auto_334641 ) ) ( not ( = ?auto_334639 ?auto_334642 ) ) ( not ( = ?auto_334639 ?auto_334643 ) ) ( not ( = ?auto_334639 ?auto_334644 ) ) ( not ( = ?auto_334639 ?auto_334645 ) ) ( not ( = ?auto_334639 ?auto_334646 ) ) ( not ( = ?auto_334639 ?auto_334647 ) ) ( not ( = ?auto_334639 ?auto_334648 ) ) ( not ( = ?auto_334639 ?auto_334649 ) ) ( not ( = ?auto_334639 ?auto_334650 ) ) ( not ( = ?auto_334639 ?auto_334651 ) ) ( not ( = ?auto_334639 ?auto_334652 ) ) ( not ( = ?auto_334640 ?auto_334641 ) ) ( not ( = ?auto_334640 ?auto_334642 ) ) ( not ( = ?auto_334640 ?auto_334643 ) ) ( not ( = ?auto_334640 ?auto_334644 ) ) ( not ( = ?auto_334640 ?auto_334645 ) ) ( not ( = ?auto_334640 ?auto_334646 ) ) ( not ( = ?auto_334640 ?auto_334647 ) ) ( not ( = ?auto_334640 ?auto_334648 ) ) ( not ( = ?auto_334640 ?auto_334649 ) ) ( not ( = ?auto_334640 ?auto_334650 ) ) ( not ( = ?auto_334640 ?auto_334651 ) ) ( not ( = ?auto_334640 ?auto_334652 ) ) ( not ( = ?auto_334641 ?auto_334642 ) ) ( not ( = ?auto_334641 ?auto_334643 ) ) ( not ( = ?auto_334641 ?auto_334644 ) ) ( not ( = ?auto_334641 ?auto_334645 ) ) ( not ( = ?auto_334641 ?auto_334646 ) ) ( not ( = ?auto_334641 ?auto_334647 ) ) ( not ( = ?auto_334641 ?auto_334648 ) ) ( not ( = ?auto_334641 ?auto_334649 ) ) ( not ( = ?auto_334641 ?auto_334650 ) ) ( not ( = ?auto_334641 ?auto_334651 ) ) ( not ( = ?auto_334641 ?auto_334652 ) ) ( not ( = ?auto_334642 ?auto_334643 ) ) ( not ( = ?auto_334642 ?auto_334644 ) ) ( not ( = ?auto_334642 ?auto_334645 ) ) ( not ( = ?auto_334642 ?auto_334646 ) ) ( not ( = ?auto_334642 ?auto_334647 ) ) ( not ( = ?auto_334642 ?auto_334648 ) ) ( not ( = ?auto_334642 ?auto_334649 ) ) ( not ( = ?auto_334642 ?auto_334650 ) ) ( not ( = ?auto_334642 ?auto_334651 ) ) ( not ( = ?auto_334642 ?auto_334652 ) ) ( not ( = ?auto_334643 ?auto_334644 ) ) ( not ( = ?auto_334643 ?auto_334645 ) ) ( not ( = ?auto_334643 ?auto_334646 ) ) ( not ( = ?auto_334643 ?auto_334647 ) ) ( not ( = ?auto_334643 ?auto_334648 ) ) ( not ( = ?auto_334643 ?auto_334649 ) ) ( not ( = ?auto_334643 ?auto_334650 ) ) ( not ( = ?auto_334643 ?auto_334651 ) ) ( not ( = ?auto_334643 ?auto_334652 ) ) ( not ( = ?auto_334644 ?auto_334645 ) ) ( not ( = ?auto_334644 ?auto_334646 ) ) ( not ( = ?auto_334644 ?auto_334647 ) ) ( not ( = ?auto_334644 ?auto_334648 ) ) ( not ( = ?auto_334644 ?auto_334649 ) ) ( not ( = ?auto_334644 ?auto_334650 ) ) ( not ( = ?auto_334644 ?auto_334651 ) ) ( not ( = ?auto_334644 ?auto_334652 ) ) ( not ( = ?auto_334645 ?auto_334646 ) ) ( not ( = ?auto_334645 ?auto_334647 ) ) ( not ( = ?auto_334645 ?auto_334648 ) ) ( not ( = ?auto_334645 ?auto_334649 ) ) ( not ( = ?auto_334645 ?auto_334650 ) ) ( not ( = ?auto_334645 ?auto_334651 ) ) ( not ( = ?auto_334645 ?auto_334652 ) ) ( not ( = ?auto_334646 ?auto_334647 ) ) ( not ( = ?auto_334646 ?auto_334648 ) ) ( not ( = ?auto_334646 ?auto_334649 ) ) ( not ( = ?auto_334646 ?auto_334650 ) ) ( not ( = ?auto_334646 ?auto_334651 ) ) ( not ( = ?auto_334646 ?auto_334652 ) ) ( not ( = ?auto_334647 ?auto_334648 ) ) ( not ( = ?auto_334647 ?auto_334649 ) ) ( not ( = ?auto_334647 ?auto_334650 ) ) ( not ( = ?auto_334647 ?auto_334651 ) ) ( not ( = ?auto_334647 ?auto_334652 ) ) ( not ( = ?auto_334648 ?auto_334649 ) ) ( not ( = ?auto_334648 ?auto_334650 ) ) ( not ( = ?auto_334648 ?auto_334651 ) ) ( not ( = ?auto_334648 ?auto_334652 ) ) ( not ( = ?auto_334649 ?auto_334650 ) ) ( not ( = ?auto_334649 ?auto_334651 ) ) ( not ( = ?auto_334649 ?auto_334652 ) ) ( not ( = ?auto_334650 ?auto_334651 ) ) ( not ( = ?auto_334650 ?auto_334652 ) ) ( not ( = ?auto_334651 ?auto_334652 ) ) ( ON ?auto_334651 ?auto_334652 ) ( ON ?auto_334650 ?auto_334651 ) ( ON ?auto_334649 ?auto_334650 ) ( ON ?auto_334648 ?auto_334649 ) ( ON ?auto_334647 ?auto_334648 ) ( ON ?auto_334646 ?auto_334647 ) ( ON ?auto_334645 ?auto_334646 ) ( ON ?auto_334644 ?auto_334645 ) ( CLEAR ?auto_334642 ) ( ON ?auto_334643 ?auto_334644 ) ( CLEAR ?auto_334643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_334639 ?auto_334640 ?auto_334641 ?auto_334642 ?auto_334643 )
      ( MAKE-14PILE ?auto_334639 ?auto_334640 ?auto_334641 ?auto_334642 ?auto_334643 ?auto_334644 ?auto_334645 ?auto_334646 ?auto_334647 ?auto_334648 ?auto_334649 ?auto_334650 ?auto_334651 ?auto_334652 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334667 - BLOCK
      ?auto_334668 - BLOCK
      ?auto_334669 - BLOCK
      ?auto_334670 - BLOCK
      ?auto_334671 - BLOCK
      ?auto_334672 - BLOCK
      ?auto_334673 - BLOCK
      ?auto_334674 - BLOCK
      ?auto_334675 - BLOCK
      ?auto_334676 - BLOCK
      ?auto_334677 - BLOCK
      ?auto_334678 - BLOCK
      ?auto_334679 - BLOCK
      ?auto_334680 - BLOCK
    )
    :vars
    (
      ?auto_334681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334680 ?auto_334681 ) ( ON-TABLE ?auto_334667 ) ( ON ?auto_334668 ?auto_334667 ) ( ON ?auto_334669 ?auto_334668 ) ( not ( = ?auto_334667 ?auto_334668 ) ) ( not ( = ?auto_334667 ?auto_334669 ) ) ( not ( = ?auto_334667 ?auto_334670 ) ) ( not ( = ?auto_334667 ?auto_334671 ) ) ( not ( = ?auto_334667 ?auto_334672 ) ) ( not ( = ?auto_334667 ?auto_334673 ) ) ( not ( = ?auto_334667 ?auto_334674 ) ) ( not ( = ?auto_334667 ?auto_334675 ) ) ( not ( = ?auto_334667 ?auto_334676 ) ) ( not ( = ?auto_334667 ?auto_334677 ) ) ( not ( = ?auto_334667 ?auto_334678 ) ) ( not ( = ?auto_334667 ?auto_334679 ) ) ( not ( = ?auto_334667 ?auto_334680 ) ) ( not ( = ?auto_334667 ?auto_334681 ) ) ( not ( = ?auto_334668 ?auto_334669 ) ) ( not ( = ?auto_334668 ?auto_334670 ) ) ( not ( = ?auto_334668 ?auto_334671 ) ) ( not ( = ?auto_334668 ?auto_334672 ) ) ( not ( = ?auto_334668 ?auto_334673 ) ) ( not ( = ?auto_334668 ?auto_334674 ) ) ( not ( = ?auto_334668 ?auto_334675 ) ) ( not ( = ?auto_334668 ?auto_334676 ) ) ( not ( = ?auto_334668 ?auto_334677 ) ) ( not ( = ?auto_334668 ?auto_334678 ) ) ( not ( = ?auto_334668 ?auto_334679 ) ) ( not ( = ?auto_334668 ?auto_334680 ) ) ( not ( = ?auto_334668 ?auto_334681 ) ) ( not ( = ?auto_334669 ?auto_334670 ) ) ( not ( = ?auto_334669 ?auto_334671 ) ) ( not ( = ?auto_334669 ?auto_334672 ) ) ( not ( = ?auto_334669 ?auto_334673 ) ) ( not ( = ?auto_334669 ?auto_334674 ) ) ( not ( = ?auto_334669 ?auto_334675 ) ) ( not ( = ?auto_334669 ?auto_334676 ) ) ( not ( = ?auto_334669 ?auto_334677 ) ) ( not ( = ?auto_334669 ?auto_334678 ) ) ( not ( = ?auto_334669 ?auto_334679 ) ) ( not ( = ?auto_334669 ?auto_334680 ) ) ( not ( = ?auto_334669 ?auto_334681 ) ) ( not ( = ?auto_334670 ?auto_334671 ) ) ( not ( = ?auto_334670 ?auto_334672 ) ) ( not ( = ?auto_334670 ?auto_334673 ) ) ( not ( = ?auto_334670 ?auto_334674 ) ) ( not ( = ?auto_334670 ?auto_334675 ) ) ( not ( = ?auto_334670 ?auto_334676 ) ) ( not ( = ?auto_334670 ?auto_334677 ) ) ( not ( = ?auto_334670 ?auto_334678 ) ) ( not ( = ?auto_334670 ?auto_334679 ) ) ( not ( = ?auto_334670 ?auto_334680 ) ) ( not ( = ?auto_334670 ?auto_334681 ) ) ( not ( = ?auto_334671 ?auto_334672 ) ) ( not ( = ?auto_334671 ?auto_334673 ) ) ( not ( = ?auto_334671 ?auto_334674 ) ) ( not ( = ?auto_334671 ?auto_334675 ) ) ( not ( = ?auto_334671 ?auto_334676 ) ) ( not ( = ?auto_334671 ?auto_334677 ) ) ( not ( = ?auto_334671 ?auto_334678 ) ) ( not ( = ?auto_334671 ?auto_334679 ) ) ( not ( = ?auto_334671 ?auto_334680 ) ) ( not ( = ?auto_334671 ?auto_334681 ) ) ( not ( = ?auto_334672 ?auto_334673 ) ) ( not ( = ?auto_334672 ?auto_334674 ) ) ( not ( = ?auto_334672 ?auto_334675 ) ) ( not ( = ?auto_334672 ?auto_334676 ) ) ( not ( = ?auto_334672 ?auto_334677 ) ) ( not ( = ?auto_334672 ?auto_334678 ) ) ( not ( = ?auto_334672 ?auto_334679 ) ) ( not ( = ?auto_334672 ?auto_334680 ) ) ( not ( = ?auto_334672 ?auto_334681 ) ) ( not ( = ?auto_334673 ?auto_334674 ) ) ( not ( = ?auto_334673 ?auto_334675 ) ) ( not ( = ?auto_334673 ?auto_334676 ) ) ( not ( = ?auto_334673 ?auto_334677 ) ) ( not ( = ?auto_334673 ?auto_334678 ) ) ( not ( = ?auto_334673 ?auto_334679 ) ) ( not ( = ?auto_334673 ?auto_334680 ) ) ( not ( = ?auto_334673 ?auto_334681 ) ) ( not ( = ?auto_334674 ?auto_334675 ) ) ( not ( = ?auto_334674 ?auto_334676 ) ) ( not ( = ?auto_334674 ?auto_334677 ) ) ( not ( = ?auto_334674 ?auto_334678 ) ) ( not ( = ?auto_334674 ?auto_334679 ) ) ( not ( = ?auto_334674 ?auto_334680 ) ) ( not ( = ?auto_334674 ?auto_334681 ) ) ( not ( = ?auto_334675 ?auto_334676 ) ) ( not ( = ?auto_334675 ?auto_334677 ) ) ( not ( = ?auto_334675 ?auto_334678 ) ) ( not ( = ?auto_334675 ?auto_334679 ) ) ( not ( = ?auto_334675 ?auto_334680 ) ) ( not ( = ?auto_334675 ?auto_334681 ) ) ( not ( = ?auto_334676 ?auto_334677 ) ) ( not ( = ?auto_334676 ?auto_334678 ) ) ( not ( = ?auto_334676 ?auto_334679 ) ) ( not ( = ?auto_334676 ?auto_334680 ) ) ( not ( = ?auto_334676 ?auto_334681 ) ) ( not ( = ?auto_334677 ?auto_334678 ) ) ( not ( = ?auto_334677 ?auto_334679 ) ) ( not ( = ?auto_334677 ?auto_334680 ) ) ( not ( = ?auto_334677 ?auto_334681 ) ) ( not ( = ?auto_334678 ?auto_334679 ) ) ( not ( = ?auto_334678 ?auto_334680 ) ) ( not ( = ?auto_334678 ?auto_334681 ) ) ( not ( = ?auto_334679 ?auto_334680 ) ) ( not ( = ?auto_334679 ?auto_334681 ) ) ( not ( = ?auto_334680 ?auto_334681 ) ) ( ON ?auto_334679 ?auto_334680 ) ( ON ?auto_334678 ?auto_334679 ) ( ON ?auto_334677 ?auto_334678 ) ( ON ?auto_334676 ?auto_334677 ) ( ON ?auto_334675 ?auto_334676 ) ( ON ?auto_334674 ?auto_334675 ) ( ON ?auto_334673 ?auto_334674 ) ( ON ?auto_334672 ?auto_334673 ) ( ON ?auto_334671 ?auto_334672 ) ( CLEAR ?auto_334669 ) ( ON ?auto_334670 ?auto_334671 ) ( CLEAR ?auto_334670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_334667 ?auto_334668 ?auto_334669 ?auto_334670 )
      ( MAKE-14PILE ?auto_334667 ?auto_334668 ?auto_334669 ?auto_334670 ?auto_334671 ?auto_334672 ?auto_334673 ?auto_334674 ?auto_334675 ?auto_334676 ?auto_334677 ?auto_334678 ?auto_334679 ?auto_334680 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334696 - BLOCK
      ?auto_334697 - BLOCK
      ?auto_334698 - BLOCK
      ?auto_334699 - BLOCK
      ?auto_334700 - BLOCK
      ?auto_334701 - BLOCK
      ?auto_334702 - BLOCK
      ?auto_334703 - BLOCK
      ?auto_334704 - BLOCK
      ?auto_334705 - BLOCK
      ?auto_334706 - BLOCK
      ?auto_334707 - BLOCK
      ?auto_334708 - BLOCK
      ?auto_334709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_334709 ) ( ON-TABLE ?auto_334696 ) ( ON ?auto_334697 ?auto_334696 ) ( ON ?auto_334698 ?auto_334697 ) ( not ( = ?auto_334696 ?auto_334697 ) ) ( not ( = ?auto_334696 ?auto_334698 ) ) ( not ( = ?auto_334696 ?auto_334699 ) ) ( not ( = ?auto_334696 ?auto_334700 ) ) ( not ( = ?auto_334696 ?auto_334701 ) ) ( not ( = ?auto_334696 ?auto_334702 ) ) ( not ( = ?auto_334696 ?auto_334703 ) ) ( not ( = ?auto_334696 ?auto_334704 ) ) ( not ( = ?auto_334696 ?auto_334705 ) ) ( not ( = ?auto_334696 ?auto_334706 ) ) ( not ( = ?auto_334696 ?auto_334707 ) ) ( not ( = ?auto_334696 ?auto_334708 ) ) ( not ( = ?auto_334696 ?auto_334709 ) ) ( not ( = ?auto_334697 ?auto_334698 ) ) ( not ( = ?auto_334697 ?auto_334699 ) ) ( not ( = ?auto_334697 ?auto_334700 ) ) ( not ( = ?auto_334697 ?auto_334701 ) ) ( not ( = ?auto_334697 ?auto_334702 ) ) ( not ( = ?auto_334697 ?auto_334703 ) ) ( not ( = ?auto_334697 ?auto_334704 ) ) ( not ( = ?auto_334697 ?auto_334705 ) ) ( not ( = ?auto_334697 ?auto_334706 ) ) ( not ( = ?auto_334697 ?auto_334707 ) ) ( not ( = ?auto_334697 ?auto_334708 ) ) ( not ( = ?auto_334697 ?auto_334709 ) ) ( not ( = ?auto_334698 ?auto_334699 ) ) ( not ( = ?auto_334698 ?auto_334700 ) ) ( not ( = ?auto_334698 ?auto_334701 ) ) ( not ( = ?auto_334698 ?auto_334702 ) ) ( not ( = ?auto_334698 ?auto_334703 ) ) ( not ( = ?auto_334698 ?auto_334704 ) ) ( not ( = ?auto_334698 ?auto_334705 ) ) ( not ( = ?auto_334698 ?auto_334706 ) ) ( not ( = ?auto_334698 ?auto_334707 ) ) ( not ( = ?auto_334698 ?auto_334708 ) ) ( not ( = ?auto_334698 ?auto_334709 ) ) ( not ( = ?auto_334699 ?auto_334700 ) ) ( not ( = ?auto_334699 ?auto_334701 ) ) ( not ( = ?auto_334699 ?auto_334702 ) ) ( not ( = ?auto_334699 ?auto_334703 ) ) ( not ( = ?auto_334699 ?auto_334704 ) ) ( not ( = ?auto_334699 ?auto_334705 ) ) ( not ( = ?auto_334699 ?auto_334706 ) ) ( not ( = ?auto_334699 ?auto_334707 ) ) ( not ( = ?auto_334699 ?auto_334708 ) ) ( not ( = ?auto_334699 ?auto_334709 ) ) ( not ( = ?auto_334700 ?auto_334701 ) ) ( not ( = ?auto_334700 ?auto_334702 ) ) ( not ( = ?auto_334700 ?auto_334703 ) ) ( not ( = ?auto_334700 ?auto_334704 ) ) ( not ( = ?auto_334700 ?auto_334705 ) ) ( not ( = ?auto_334700 ?auto_334706 ) ) ( not ( = ?auto_334700 ?auto_334707 ) ) ( not ( = ?auto_334700 ?auto_334708 ) ) ( not ( = ?auto_334700 ?auto_334709 ) ) ( not ( = ?auto_334701 ?auto_334702 ) ) ( not ( = ?auto_334701 ?auto_334703 ) ) ( not ( = ?auto_334701 ?auto_334704 ) ) ( not ( = ?auto_334701 ?auto_334705 ) ) ( not ( = ?auto_334701 ?auto_334706 ) ) ( not ( = ?auto_334701 ?auto_334707 ) ) ( not ( = ?auto_334701 ?auto_334708 ) ) ( not ( = ?auto_334701 ?auto_334709 ) ) ( not ( = ?auto_334702 ?auto_334703 ) ) ( not ( = ?auto_334702 ?auto_334704 ) ) ( not ( = ?auto_334702 ?auto_334705 ) ) ( not ( = ?auto_334702 ?auto_334706 ) ) ( not ( = ?auto_334702 ?auto_334707 ) ) ( not ( = ?auto_334702 ?auto_334708 ) ) ( not ( = ?auto_334702 ?auto_334709 ) ) ( not ( = ?auto_334703 ?auto_334704 ) ) ( not ( = ?auto_334703 ?auto_334705 ) ) ( not ( = ?auto_334703 ?auto_334706 ) ) ( not ( = ?auto_334703 ?auto_334707 ) ) ( not ( = ?auto_334703 ?auto_334708 ) ) ( not ( = ?auto_334703 ?auto_334709 ) ) ( not ( = ?auto_334704 ?auto_334705 ) ) ( not ( = ?auto_334704 ?auto_334706 ) ) ( not ( = ?auto_334704 ?auto_334707 ) ) ( not ( = ?auto_334704 ?auto_334708 ) ) ( not ( = ?auto_334704 ?auto_334709 ) ) ( not ( = ?auto_334705 ?auto_334706 ) ) ( not ( = ?auto_334705 ?auto_334707 ) ) ( not ( = ?auto_334705 ?auto_334708 ) ) ( not ( = ?auto_334705 ?auto_334709 ) ) ( not ( = ?auto_334706 ?auto_334707 ) ) ( not ( = ?auto_334706 ?auto_334708 ) ) ( not ( = ?auto_334706 ?auto_334709 ) ) ( not ( = ?auto_334707 ?auto_334708 ) ) ( not ( = ?auto_334707 ?auto_334709 ) ) ( not ( = ?auto_334708 ?auto_334709 ) ) ( ON ?auto_334708 ?auto_334709 ) ( ON ?auto_334707 ?auto_334708 ) ( ON ?auto_334706 ?auto_334707 ) ( ON ?auto_334705 ?auto_334706 ) ( ON ?auto_334704 ?auto_334705 ) ( ON ?auto_334703 ?auto_334704 ) ( ON ?auto_334702 ?auto_334703 ) ( ON ?auto_334701 ?auto_334702 ) ( ON ?auto_334700 ?auto_334701 ) ( CLEAR ?auto_334698 ) ( ON ?auto_334699 ?auto_334700 ) ( CLEAR ?auto_334699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_334696 ?auto_334697 ?auto_334698 ?auto_334699 )
      ( MAKE-14PILE ?auto_334696 ?auto_334697 ?auto_334698 ?auto_334699 ?auto_334700 ?auto_334701 ?auto_334702 ?auto_334703 ?auto_334704 ?auto_334705 ?auto_334706 ?auto_334707 ?auto_334708 ?auto_334709 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334724 - BLOCK
      ?auto_334725 - BLOCK
      ?auto_334726 - BLOCK
      ?auto_334727 - BLOCK
      ?auto_334728 - BLOCK
      ?auto_334729 - BLOCK
      ?auto_334730 - BLOCK
      ?auto_334731 - BLOCK
      ?auto_334732 - BLOCK
      ?auto_334733 - BLOCK
      ?auto_334734 - BLOCK
      ?auto_334735 - BLOCK
      ?auto_334736 - BLOCK
      ?auto_334737 - BLOCK
    )
    :vars
    (
      ?auto_334738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334737 ?auto_334738 ) ( ON-TABLE ?auto_334724 ) ( ON ?auto_334725 ?auto_334724 ) ( not ( = ?auto_334724 ?auto_334725 ) ) ( not ( = ?auto_334724 ?auto_334726 ) ) ( not ( = ?auto_334724 ?auto_334727 ) ) ( not ( = ?auto_334724 ?auto_334728 ) ) ( not ( = ?auto_334724 ?auto_334729 ) ) ( not ( = ?auto_334724 ?auto_334730 ) ) ( not ( = ?auto_334724 ?auto_334731 ) ) ( not ( = ?auto_334724 ?auto_334732 ) ) ( not ( = ?auto_334724 ?auto_334733 ) ) ( not ( = ?auto_334724 ?auto_334734 ) ) ( not ( = ?auto_334724 ?auto_334735 ) ) ( not ( = ?auto_334724 ?auto_334736 ) ) ( not ( = ?auto_334724 ?auto_334737 ) ) ( not ( = ?auto_334724 ?auto_334738 ) ) ( not ( = ?auto_334725 ?auto_334726 ) ) ( not ( = ?auto_334725 ?auto_334727 ) ) ( not ( = ?auto_334725 ?auto_334728 ) ) ( not ( = ?auto_334725 ?auto_334729 ) ) ( not ( = ?auto_334725 ?auto_334730 ) ) ( not ( = ?auto_334725 ?auto_334731 ) ) ( not ( = ?auto_334725 ?auto_334732 ) ) ( not ( = ?auto_334725 ?auto_334733 ) ) ( not ( = ?auto_334725 ?auto_334734 ) ) ( not ( = ?auto_334725 ?auto_334735 ) ) ( not ( = ?auto_334725 ?auto_334736 ) ) ( not ( = ?auto_334725 ?auto_334737 ) ) ( not ( = ?auto_334725 ?auto_334738 ) ) ( not ( = ?auto_334726 ?auto_334727 ) ) ( not ( = ?auto_334726 ?auto_334728 ) ) ( not ( = ?auto_334726 ?auto_334729 ) ) ( not ( = ?auto_334726 ?auto_334730 ) ) ( not ( = ?auto_334726 ?auto_334731 ) ) ( not ( = ?auto_334726 ?auto_334732 ) ) ( not ( = ?auto_334726 ?auto_334733 ) ) ( not ( = ?auto_334726 ?auto_334734 ) ) ( not ( = ?auto_334726 ?auto_334735 ) ) ( not ( = ?auto_334726 ?auto_334736 ) ) ( not ( = ?auto_334726 ?auto_334737 ) ) ( not ( = ?auto_334726 ?auto_334738 ) ) ( not ( = ?auto_334727 ?auto_334728 ) ) ( not ( = ?auto_334727 ?auto_334729 ) ) ( not ( = ?auto_334727 ?auto_334730 ) ) ( not ( = ?auto_334727 ?auto_334731 ) ) ( not ( = ?auto_334727 ?auto_334732 ) ) ( not ( = ?auto_334727 ?auto_334733 ) ) ( not ( = ?auto_334727 ?auto_334734 ) ) ( not ( = ?auto_334727 ?auto_334735 ) ) ( not ( = ?auto_334727 ?auto_334736 ) ) ( not ( = ?auto_334727 ?auto_334737 ) ) ( not ( = ?auto_334727 ?auto_334738 ) ) ( not ( = ?auto_334728 ?auto_334729 ) ) ( not ( = ?auto_334728 ?auto_334730 ) ) ( not ( = ?auto_334728 ?auto_334731 ) ) ( not ( = ?auto_334728 ?auto_334732 ) ) ( not ( = ?auto_334728 ?auto_334733 ) ) ( not ( = ?auto_334728 ?auto_334734 ) ) ( not ( = ?auto_334728 ?auto_334735 ) ) ( not ( = ?auto_334728 ?auto_334736 ) ) ( not ( = ?auto_334728 ?auto_334737 ) ) ( not ( = ?auto_334728 ?auto_334738 ) ) ( not ( = ?auto_334729 ?auto_334730 ) ) ( not ( = ?auto_334729 ?auto_334731 ) ) ( not ( = ?auto_334729 ?auto_334732 ) ) ( not ( = ?auto_334729 ?auto_334733 ) ) ( not ( = ?auto_334729 ?auto_334734 ) ) ( not ( = ?auto_334729 ?auto_334735 ) ) ( not ( = ?auto_334729 ?auto_334736 ) ) ( not ( = ?auto_334729 ?auto_334737 ) ) ( not ( = ?auto_334729 ?auto_334738 ) ) ( not ( = ?auto_334730 ?auto_334731 ) ) ( not ( = ?auto_334730 ?auto_334732 ) ) ( not ( = ?auto_334730 ?auto_334733 ) ) ( not ( = ?auto_334730 ?auto_334734 ) ) ( not ( = ?auto_334730 ?auto_334735 ) ) ( not ( = ?auto_334730 ?auto_334736 ) ) ( not ( = ?auto_334730 ?auto_334737 ) ) ( not ( = ?auto_334730 ?auto_334738 ) ) ( not ( = ?auto_334731 ?auto_334732 ) ) ( not ( = ?auto_334731 ?auto_334733 ) ) ( not ( = ?auto_334731 ?auto_334734 ) ) ( not ( = ?auto_334731 ?auto_334735 ) ) ( not ( = ?auto_334731 ?auto_334736 ) ) ( not ( = ?auto_334731 ?auto_334737 ) ) ( not ( = ?auto_334731 ?auto_334738 ) ) ( not ( = ?auto_334732 ?auto_334733 ) ) ( not ( = ?auto_334732 ?auto_334734 ) ) ( not ( = ?auto_334732 ?auto_334735 ) ) ( not ( = ?auto_334732 ?auto_334736 ) ) ( not ( = ?auto_334732 ?auto_334737 ) ) ( not ( = ?auto_334732 ?auto_334738 ) ) ( not ( = ?auto_334733 ?auto_334734 ) ) ( not ( = ?auto_334733 ?auto_334735 ) ) ( not ( = ?auto_334733 ?auto_334736 ) ) ( not ( = ?auto_334733 ?auto_334737 ) ) ( not ( = ?auto_334733 ?auto_334738 ) ) ( not ( = ?auto_334734 ?auto_334735 ) ) ( not ( = ?auto_334734 ?auto_334736 ) ) ( not ( = ?auto_334734 ?auto_334737 ) ) ( not ( = ?auto_334734 ?auto_334738 ) ) ( not ( = ?auto_334735 ?auto_334736 ) ) ( not ( = ?auto_334735 ?auto_334737 ) ) ( not ( = ?auto_334735 ?auto_334738 ) ) ( not ( = ?auto_334736 ?auto_334737 ) ) ( not ( = ?auto_334736 ?auto_334738 ) ) ( not ( = ?auto_334737 ?auto_334738 ) ) ( ON ?auto_334736 ?auto_334737 ) ( ON ?auto_334735 ?auto_334736 ) ( ON ?auto_334734 ?auto_334735 ) ( ON ?auto_334733 ?auto_334734 ) ( ON ?auto_334732 ?auto_334733 ) ( ON ?auto_334731 ?auto_334732 ) ( ON ?auto_334730 ?auto_334731 ) ( ON ?auto_334729 ?auto_334730 ) ( ON ?auto_334728 ?auto_334729 ) ( ON ?auto_334727 ?auto_334728 ) ( CLEAR ?auto_334725 ) ( ON ?auto_334726 ?auto_334727 ) ( CLEAR ?auto_334726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_334724 ?auto_334725 ?auto_334726 )
      ( MAKE-14PILE ?auto_334724 ?auto_334725 ?auto_334726 ?auto_334727 ?auto_334728 ?auto_334729 ?auto_334730 ?auto_334731 ?auto_334732 ?auto_334733 ?auto_334734 ?auto_334735 ?auto_334736 ?auto_334737 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334753 - BLOCK
      ?auto_334754 - BLOCK
      ?auto_334755 - BLOCK
      ?auto_334756 - BLOCK
      ?auto_334757 - BLOCK
      ?auto_334758 - BLOCK
      ?auto_334759 - BLOCK
      ?auto_334760 - BLOCK
      ?auto_334761 - BLOCK
      ?auto_334762 - BLOCK
      ?auto_334763 - BLOCK
      ?auto_334764 - BLOCK
      ?auto_334765 - BLOCK
      ?auto_334766 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_334766 ) ( ON-TABLE ?auto_334753 ) ( ON ?auto_334754 ?auto_334753 ) ( not ( = ?auto_334753 ?auto_334754 ) ) ( not ( = ?auto_334753 ?auto_334755 ) ) ( not ( = ?auto_334753 ?auto_334756 ) ) ( not ( = ?auto_334753 ?auto_334757 ) ) ( not ( = ?auto_334753 ?auto_334758 ) ) ( not ( = ?auto_334753 ?auto_334759 ) ) ( not ( = ?auto_334753 ?auto_334760 ) ) ( not ( = ?auto_334753 ?auto_334761 ) ) ( not ( = ?auto_334753 ?auto_334762 ) ) ( not ( = ?auto_334753 ?auto_334763 ) ) ( not ( = ?auto_334753 ?auto_334764 ) ) ( not ( = ?auto_334753 ?auto_334765 ) ) ( not ( = ?auto_334753 ?auto_334766 ) ) ( not ( = ?auto_334754 ?auto_334755 ) ) ( not ( = ?auto_334754 ?auto_334756 ) ) ( not ( = ?auto_334754 ?auto_334757 ) ) ( not ( = ?auto_334754 ?auto_334758 ) ) ( not ( = ?auto_334754 ?auto_334759 ) ) ( not ( = ?auto_334754 ?auto_334760 ) ) ( not ( = ?auto_334754 ?auto_334761 ) ) ( not ( = ?auto_334754 ?auto_334762 ) ) ( not ( = ?auto_334754 ?auto_334763 ) ) ( not ( = ?auto_334754 ?auto_334764 ) ) ( not ( = ?auto_334754 ?auto_334765 ) ) ( not ( = ?auto_334754 ?auto_334766 ) ) ( not ( = ?auto_334755 ?auto_334756 ) ) ( not ( = ?auto_334755 ?auto_334757 ) ) ( not ( = ?auto_334755 ?auto_334758 ) ) ( not ( = ?auto_334755 ?auto_334759 ) ) ( not ( = ?auto_334755 ?auto_334760 ) ) ( not ( = ?auto_334755 ?auto_334761 ) ) ( not ( = ?auto_334755 ?auto_334762 ) ) ( not ( = ?auto_334755 ?auto_334763 ) ) ( not ( = ?auto_334755 ?auto_334764 ) ) ( not ( = ?auto_334755 ?auto_334765 ) ) ( not ( = ?auto_334755 ?auto_334766 ) ) ( not ( = ?auto_334756 ?auto_334757 ) ) ( not ( = ?auto_334756 ?auto_334758 ) ) ( not ( = ?auto_334756 ?auto_334759 ) ) ( not ( = ?auto_334756 ?auto_334760 ) ) ( not ( = ?auto_334756 ?auto_334761 ) ) ( not ( = ?auto_334756 ?auto_334762 ) ) ( not ( = ?auto_334756 ?auto_334763 ) ) ( not ( = ?auto_334756 ?auto_334764 ) ) ( not ( = ?auto_334756 ?auto_334765 ) ) ( not ( = ?auto_334756 ?auto_334766 ) ) ( not ( = ?auto_334757 ?auto_334758 ) ) ( not ( = ?auto_334757 ?auto_334759 ) ) ( not ( = ?auto_334757 ?auto_334760 ) ) ( not ( = ?auto_334757 ?auto_334761 ) ) ( not ( = ?auto_334757 ?auto_334762 ) ) ( not ( = ?auto_334757 ?auto_334763 ) ) ( not ( = ?auto_334757 ?auto_334764 ) ) ( not ( = ?auto_334757 ?auto_334765 ) ) ( not ( = ?auto_334757 ?auto_334766 ) ) ( not ( = ?auto_334758 ?auto_334759 ) ) ( not ( = ?auto_334758 ?auto_334760 ) ) ( not ( = ?auto_334758 ?auto_334761 ) ) ( not ( = ?auto_334758 ?auto_334762 ) ) ( not ( = ?auto_334758 ?auto_334763 ) ) ( not ( = ?auto_334758 ?auto_334764 ) ) ( not ( = ?auto_334758 ?auto_334765 ) ) ( not ( = ?auto_334758 ?auto_334766 ) ) ( not ( = ?auto_334759 ?auto_334760 ) ) ( not ( = ?auto_334759 ?auto_334761 ) ) ( not ( = ?auto_334759 ?auto_334762 ) ) ( not ( = ?auto_334759 ?auto_334763 ) ) ( not ( = ?auto_334759 ?auto_334764 ) ) ( not ( = ?auto_334759 ?auto_334765 ) ) ( not ( = ?auto_334759 ?auto_334766 ) ) ( not ( = ?auto_334760 ?auto_334761 ) ) ( not ( = ?auto_334760 ?auto_334762 ) ) ( not ( = ?auto_334760 ?auto_334763 ) ) ( not ( = ?auto_334760 ?auto_334764 ) ) ( not ( = ?auto_334760 ?auto_334765 ) ) ( not ( = ?auto_334760 ?auto_334766 ) ) ( not ( = ?auto_334761 ?auto_334762 ) ) ( not ( = ?auto_334761 ?auto_334763 ) ) ( not ( = ?auto_334761 ?auto_334764 ) ) ( not ( = ?auto_334761 ?auto_334765 ) ) ( not ( = ?auto_334761 ?auto_334766 ) ) ( not ( = ?auto_334762 ?auto_334763 ) ) ( not ( = ?auto_334762 ?auto_334764 ) ) ( not ( = ?auto_334762 ?auto_334765 ) ) ( not ( = ?auto_334762 ?auto_334766 ) ) ( not ( = ?auto_334763 ?auto_334764 ) ) ( not ( = ?auto_334763 ?auto_334765 ) ) ( not ( = ?auto_334763 ?auto_334766 ) ) ( not ( = ?auto_334764 ?auto_334765 ) ) ( not ( = ?auto_334764 ?auto_334766 ) ) ( not ( = ?auto_334765 ?auto_334766 ) ) ( ON ?auto_334765 ?auto_334766 ) ( ON ?auto_334764 ?auto_334765 ) ( ON ?auto_334763 ?auto_334764 ) ( ON ?auto_334762 ?auto_334763 ) ( ON ?auto_334761 ?auto_334762 ) ( ON ?auto_334760 ?auto_334761 ) ( ON ?auto_334759 ?auto_334760 ) ( ON ?auto_334758 ?auto_334759 ) ( ON ?auto_334757 ?auto_334758 ) ( ON ?auto_334756 ?auto_334757 ) ( CLEAR ?auto_334754 ) ( ON ?auto_334755 ?auto_334756 ) ( CLEAR ?auto_334755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_334753 ?auto_334754 ?auto_334755 )
      ( MAKE-14PILE ?auto_334753 ?auto_334754 ?auto_334755 ?auto_334756 ?auto_334757 ?auto_334758 ?auto_334759 ?auto_334760 ?auto_334761 ?auto_334762 ?auto_334763 ?auto_334764 ?auto_334765 ?auto_334766 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334781 - BLOCK
      ?auto_334782 - BLOCK
      ?auto_334783 - BLOCK
      ?auto_334784 - BLOCK
      ?auto_334785 - BLOCK
      ?auto_334786 - BLOCK
      ?auto_334787 - BLOCK
      ?auto_334788 - BLOCK
      ?auto_334789 - BLOCK
      ?auto_334790 - BLOCK
      ?auto_334791 - BLOCK
      ?auto_334792 - BLOCK
      ?auto_334793 - BLOCK
      ?auto_334794 - BLOCK
    )
    :vars
    (
      ?auto_334795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334794 ?auto_334795 ) ( ON-TABLE ?auto_334781 ) ( not ( = ?auto_334781 ?auto_334782 ) ) ( not ( = ?auto_334781 ?auto_334783 ) ) ( not ( = ?auto_334781 ?auto_334784 ) ) ( not ( = ?auto_334781 ?auto_334785 ) ) ( not ( = ?auto_334781 ?auto_334786 ) ) ( not ( = ?auto_334781 ?auto_334787 ) ) ( not ( = ?auto_334781 ?auto_334788 ) ) ( not ( = ?auto_334781 ?auto_334789 ) ) ( not ( = ?auto_334781 ?auto_334790 ) ) ( not ( = ?auto_334781 ?auto_334791 ) ) ( not ( = ?auto_334781 ?auto_334792 ) ) ( not ( = ?auto_334781 ?auto_334793 ) ) ( not ( = ?auto_334781 ?auto_334794 ) ) ( not ( = ?auto_334781 ?auto_334795 ) ) ( not ( = ?auto_334782 ?auto_334783 ) ) ( not ( = ?auto_334782 ?auto_334784 ) ) ( not ( = ?auto_334782 ?auto_334785 ) ) ( not ( = ?auto_334782 ?auto_334786 ) ) ( not ( = ?auto_334782 ?auto_334787 ) ) ( not ( = ?auto_334782 ?auto_334788 ) ) ( not ( = ?auto_334782 ?auto_334789 ) ) ( not ( = ?auto_334782 ?auto_334790 ) ) ( not ( = ?auto_334782 ?auto_334791 ) ) ( not ( = ?auto_334782 ?auto_334792 ) ) ( not ( = ?auto_334782 ?auto_334793 ) ) ( not ( = ?auto_334782 ?auto_334794 ) ) ( not ( = ?auto_334782 ?auto_334795 ) ) ( not ( = ?auto_334783 ?auto_334784 ) ) ( not ( = ?auto_334783 ?auto_334785 ) ) ( not ( = ?auto_334783 ?auto_334786 ) ) ( not ( = ?auto_334783 ?auto_334787 ) ) ( not ( = ?auto_334783 ?auto_334788 ) ) ( not ( = ?auto_334783 ?auto_334789 ) ) ( not ( = ?auto_334783 ?auto_334790 ) ) ( not ( = ?auto_334783 ?auto_334791 ) ) ( not ( = ?auto_334783 ?auto_334792 ) ) ( not ( = ?auto_334783 ?auto_334793 ) ) ( not ( = ?auto_334783 ?auto_334794 ) ) ( not ( = ?auto_334783 ?auto_334795 ) ) ( not ( = ?auto_334784 ?auto_334785 ) ) ( not ( = ?auto_334784 ?auto_334786 ) ) ( not ( = ?auto_334784 ?auto_334787 ) ) ( not ( = ?auto_334784 ?auto_334788 ) ) ( not ( = ?auto_334784 ?auto_334789 ) ) ( not ( = ?auto_334784 ?auto_334790 ) ) ( not ( = ?auto_334784 ?auto_334791 ) ) ( not ( = ?auto_334784 ?auto_334792 ) ) ( not ( = ?auto_334784 ?auto_334793 ) ) ( not ( = ?auto_334784 ?auto_334794 ) ) ( not ( = ?auto_334784 ?auto_334795 ) ) ( not ( = ?auto_334785 ?auto_334786 ) ) ( not ( = ?auto_334785 ?auto_334787 ) ) ( not ( = ?auto_334785 ?auto_334788 ) ) ( not ( = ?auto_334785 ?auto_334789 ) ) ( not ( = ?auto_334785 ?auto_334790 ) ) ( not ( = ?auto_334785 ?auto_334791 ) ) ( not ( = ?auto_334785 ?auto_334792 ) ) ( not ( = ?auto_334785 ?auto_334793 ) ) ( not ( = ?auto_334785 ?auto_334794 ) ) ( not ( = ?auto_334785 ?auto_334795 ) ) ( not ( = ?auto_334786 ?auto_334787 ) ) ( not ( = ?auto_334786 ?auto_334788 ) ) ( not ( = ?auto_334786 ?auto_334789 ) ) ( not ( = ?auto_334786 ?auto_334790 ) ) ( not ( = ?auto_334786 ?auto_334791 ) ) ( not ( = ?auto_334786 ?auto_334792 ) ) ( not ( = ?auto_334786 ?auto_334793 ) ) ( not ( = ?auto_334786 ?auto_334794 ) ) ( not ( = ?auto_334786 ?auto_334795 ) ) ( not ( = ?auto_334787 ?auto_334788 ) ) ( not ( = ?auto_334787 ?auto_334789 ) ) ( not ( = ?auto_334787 ?auto_334790 ) ) ( not ( = ?auto_334787 ?auto_334791 ) ) ( not ( = ?auto_334787 ?auto_334792 ) ) ( not ( = ?auto_334787 ?auto_334793 ) ) ( not ( = ?auto_334787 ?auto_334794 ) ) ( not ( = ?auto_334787 ?auto_334795 ) ) ( not ( = ?auto_334788 ?auto_334789 ) ) ( not ( = ?auto_334788 ?auto_334790 ) ) ( not ( = ?auto_334788 ?auto_334791 ) ) ( not ( = ?auto_334788 ?auto_334792 ) ) ( not ( = ?auto_334788 ?auto_334793 ) ) ( not ( = ?auto_334788 ?auto_334794 ) ) ( not ( = ?auto_334788 ?auto_334795 ) ) ( not ( = ?auto_334789 ?auto_334790 ) ) ( not ( = ?auto_334789 ?auto_334791 ) ) ( not ( = ?auto_334789 ?auto_334792 ) ) ( not ( = ?auto_334789 ?auto_334793 ) ) ( not ( = ?auto_334789 ?auto_334794 ) ) ( not ( = ?auto_334789 ?auto_334795 ) ) ( not ( = ?auto_334790 ?auto_334791 ) ) ( not ( = ?auto_334790 ?auto_334792 ) ) ( not ( = ?auto_334790 ?auto_334793 ) ) ( not ( = ?auto_334790 ?auto_334794 ) ) ( not ( = ?auto_334790 ?auto_334795 ) ) ( not ( = ?auto_334791 ?auto_334792 ) ) ( not ( = ?auto_334791 ?auto_334793 ) ) ( not ( = ?auto_334791 ?auto_334794 ) ) ( not ( = ?auto_334791 ?auto_334795 ) ) ( not ( = ?auto_334792 ?auto_334793 ) ) ( not ( = ?auto_334792 ?auto_334794 ) ) ( not ( = ?auto_334792 ?auto_334795 ) ) ( not ( = ?auto_334793 ?auto_334794 ) ) ( not ( = ?auto_334793 ?auto_334795 ) ) ( not ( = ?auto_334794 ?auto_334795 ) ) ( ON ?auto_334793 ?auto_334794 ) ( ON ?auto_334792 ?auto_334793 ) ( ON ?auto_334791 ?auto_334792 ) ( ON ?auto_334790 ?auto_334791 ) ( ON ?auto_334789 ?auto_334790 ) ( ON ?auto_334788 ?auto_334789 ) ( ON ?auto_334787 ?auto_334788 ) ( ON ?auto_334786 ?auto_334787 ) ( ON ?auto_334785 ?auto_334786 ) ( ON ?auto_334784 ?auto_334785 ) ( ON ?auto_334783 ?auto_334784 ) ( CLEAR ?auto_334781 ) ( ON ?auto_334782 ?auto_334783 ) ( CLEAR ?auto_334782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_334781 ?auto_334782 )
      ( MAKE-14PILE ?auto_334781 ?auto_334782 ?auto_334783 ?auto_334784 ?auto_334785 ?auto_334786 ?auto_334787 ?auto_334788 ?auto_334789 ?auto_334790 ?auto_334791 ?auto_334792 ?auto_334793 ?auto_334794 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334810 - BLOCK
      ?auto_334811 - BLOCK
      ?auto_334812 - BLOCK
      ?auto_334813 - BLOCK
      ?auto_334814 - BLOCK
      ?auto_334815 - BLOCK
      ?auto_334816 - BLOCK
      ?auto_334817 - BLOCK
      ?auto_334818 - BLOCK
      ?auto_334819 - BLOCK
      ?auto_334820 - BLOCK
      ?auto_334821 - BLOCK
      ?auto_334822 - BLOCK
      ?auto_334823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_334823 ) ( ON-TABLE ?auto_334810 ) ( not ( = ?auto_334810 ?auto_334811 ) ) ( not ( = ?auto_334810 ?auto_334812 ) ) ( not ( = ?auto_334810 ?auto_334813 ) ) ( not ( = ?auto_334810 ?auto_334814 ) ) ( not ( = ?auto_334810 ?auto_334815 ) ) ( not ( = ?auto_334810 ?auto_334816 ) ) ( not ( = ?auto_334810 ?auto_334817 ) ) ( not ( = ?auto_334810 ?auto_334818 ) ) ( not ( = ?auto_334810 ?auto_334819 ) ) ( not ( = ?auto_334810 ?auto_334820 ) ) ( not ( = ?auto_334810 ?auto_334821 ) ) ( not ( = ?auto_334810 ?auto_334822 ) ) ( not ( = ?auto_334810 ?auto_334823 ) ) ( not ( = ?auto_334811 ?auto_334812 ) ) ( not ( = ?auto_334811 ?auto_334813 ) ) ( not ( = ?auto_334811 ?auto_334814 ) ) ( not ( = ?auto_334811 ?auto_334815 ) ) ( not ( = ?auto_334811 ?auto_334816 ) ) ( not ( = ?auto_334811 ?auto_334817 ) ) ( not ( = ?auto_334811 ?auto_334818 ) ) ( not ( = ?auto_334811 ?auto_334819 ) ) ( not ( = ?auto_334811 ?auto_334820 ) ) ( not ( = ?auto_334811 ?auto_334821 ) ) ( not ( = ?auto_334811 ?auto_334822 ) ) ( not ( = ?auto_334811 ?auto_334823 ) ) ( not ( = ?auto_334812 ?auto_334813 ) ) ( not ( = ?auto_334812 ?auto_334814 ) ) ( not ( = ?auto_334812 ?auto_334815 ) ) ( not ( = ?auto_334812 ?auto_334816 ) ) ( not ( = ?auto_334812 ?auto_334817 ) ) ( not ( = ?auto_334812 ?auto_334818 ) ) ( not ( = ?auto_334812 ?auto_334819 ) ) ( not ( = ?auto_334812 ?auto_334820 ) ) ( not ( = ?auto_334812 ?auto_334821 ) ) ( not ( = ?auto_334812 ?auto_334822 ) ) ( not ( = ?auto_334812 ?auto_334823 ) ) ( not ( = ?auto_334813 ?auto_334814 ) ) ( not ( = ?auto_334813 ?auto_334815 ) ) ( not ( = ?auto_334813 ?auto_334816 ) ) ( not ( = ?auto_334813 ?auto_334817 ) ) ( not ( = ?auto_334813 ?auto_334818 ) ) ( not ( = ?auto_334813 ?auto_334819 ) ) ( not ( = ?auto_334813 ?auto_334820 ) ) ( not ( = ?auto_334813 ?auto_334821 ) ) ( not ( = ?auto_334813 ?auto_334822 ) ) ( not ( = ?auto_334813 ?auto_334823 ) ) ( not ( = ?auto_334814 ?auto_334815 ) ) ( not ( = ?auto_334814 ?auto_334816 ) ) ( not ( = ?auto_334814 ?auto_334817 ) ) ( not ( = ?auto_334814 ?auto_334818 ) ) ( not ( = ?auto_334814 ?auto_334819 ) ) ( not ( = ?auto_334814 ?auto_334820 ) ) ( not ( = ?auto_334814 ?auto_334821 ) ) ( not ( = ?auto_334814 ?auto_334822 ) ) ( not ( = ?auto_334814 ?auto_334823 ) ) ( not ( = ?auto_334815 ?auto_334816 ) ) ( not ( = ?auto_334815 ?auto_334817 ) ) ( not ( = ?auto_334815 ?auto_334818 ) ) ( not ( = ?auto_334815 ?auto_334819 ) ) ( not ( = ?auto_334815 ?auto_334820 ) ) ( not ( = ?auto_334815 ?auto_334821 ) ) ( not ( = ?auto_334815 ?auto_334822 ) ) ( not ( = ?auto_334815 ?auto_334823 ) ) ( not ( = ?auto_334816 ?auto_334817 ) ) ( not ( = ?auto_334816 ?auto_334818 ) ) ( not ( = ?auto_334816 ?auto_334819 ) ) ( not ( = ?auto_334816 ?auto_334820 ) ) ( not ( = ?auto_334816 ?auto_334821 ) ) ( not ( = ?auto_334816 ?auto_334822 ) ) ( not ( = ?auto_334816 ?auto_334823 ) ) ( not ( = ?auto_334817 ?auto_334818 ) ) ( not ( = ?auto_334817 ?auto_334819 ) ) ( not ( = ?auto_334817 ?auto_334820 ) ) ( not ( = ?auto_334817 ?auto_334821 ) ) ( not ( = ?auto_334817 ?auto_334822 ) ) ( not ( = ?auto_334817 ?auto_334823 ) ) ( not ( = ?auto_334818 ?auto_334819 ) ) ( not ( = ?auto_334818 ?auto_334820 ) ) ( not ( = ?auto_334818 ?auto_334821 ) ) ( not ( = ?auto_334818 ?auto_334822 ) ) ( not ( = ?auto_334818 ?auto_334823 ) ) ( not ( = ?auto_334819 ?auto_334820 ) ) ( not ( = ?auto_334819 ?auto_334821 ) ) ( not ( = ?auto_334819 ?auto_334822 ) ) ( not ( = ?auto_334819 ?auto_334823 ) ) ( not ( = ?auto_334820 ?auto_334821 ) ) ( not ( = ?auto_334820 ?auto_334822 ) ) ( not ( = ?auto_334820 ?auto_334823 ) ) ( not ( = ?auto_334821 ?auto_334822 ) ) ( not ( = ?auto_334821 ?auto_334823 ) ) ( not ( = ?auto_334822 ?auto_334823 ) ) ( ON ?auto_334822 ?auto_334823 ) ( ON ?auto_334821 ?auto_334822 ) ( ON ?auto_334820 ?auto_334821 ) ( ON ?auto_334819 ?auto_334820 ) ( ON ?auto_334818 ?auto_334819 ) ( ON ?auto_334817 ?auto_334818 ) ( ON ?auto_334816 ?auto_334817 ) ( ON ?auto_334815 ?auto_334816 ) ( ON ?auto_334814 ?auto_334815 ) ( ON ?auto_334813 ?auto_334814 ) ( ON ?auto_334812 ?auto_334813 ) ( CLEAR ?auto_334810 ) ( ON ?auto_334811 ?auto_334812 ) ( CLEAR ?auto_334811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_334810 ?auto_334811 )
      ( MAKE-14PILE ?auto_334810 ?auto_334811 ?auto_334812 ?auto_334813 ?auto_334814 ?auto_334815 ?auto_334816 ?auto_334817 ?auto_334818 ?auto_334819 ?auto_334820 ?auto_334821 ?auto_334822 ?auto_334823 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334838 - BLOCK
      ?auto_334839 - BLOCK
      ?auto_334840 - BLOCK
      ?auto_334841 - BLOCK
      ?auto_334842 - BLOCK
      ?auto_334843 - BLOCK
      ?auto_334844 - BLOCK
      ?auto_334845 - BLOCK
      ?auto_334846 - BLOCK
      ?auto_334847 - BLOCK
      ?auto_334848 - BLOCK
      ?auto_334849 - BLOCK
      ?auto_334850 - BLOCK
      ?auto_334851 - BLOCK
    )
    :vars
    (
      ?auto_334852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334851 ?auto_334852 ) ( not ( = ?auto_334838 ?auto_334839 ) ) ( not ( = ?auto_334838 ?auto_334840 ) ) ( not ( = ?auto_334838 ?auto_334841 ) ) ( not ( = ?auto_334838 ?auto_334842 ) ) ( not ( = ?auto_334838 ?auto_334843 ) ) ( not ( = ?auto_334838 ?auto_334844 ) ) ( not ( = ?auto_334838 ?auto_334845 ) ) ( not ( = ?auto_334838 ?auto_334846 ) ) ( not ( = ?auto_334838 ?auto_334847 ) ) ( not ( = ?auto_334838 ?auto_334848 ) ) ( not ( = ?auto_334838 ?auto_334849 ) ) ( not ( = ?auto_334838 ?auto_334850 ) ) ( not ( = ?auto_334838 ?auto_334851 ) ) ( not ( = ?auto_334838 ?auto_334852 ) ) ( not ( = ?auto_334839 ?auto_334840 ) ) ( not ( = ?auto_334839 ?auto_334841 ) ) ( not ( = ?auto_334839 ?auto_334842 ) ) ( not ( = ?auto_334839 ?auto_334843 ) ) ( not ( = ?auto_334839 ?auto_334844 ) ) ( not ( = ?auto_334839 ?auto_334845 ) ) ( not ( = ?auto_334839 ?auto_334846 ) ) ( not ( = ?auto_334839 ?auto_334847 ) ) ( not ( = ?auto_334839 ?auto_334848 ) ) ( not ( = ?auto_334839 ?auto_334849 ) ) ( not ( = ?auto_334839 ?auto_334850 ) ) ( not ( = ?auto_334839 ?auto_334851 ) ) ( not ( = ?auto_334839 ?auto_334852 ) ) ( not ( = ?auto_334840 ?auto_334841 ) ) ( not ( = ?auto_334840 ?auto_334842 ) ) ( not ( = ?auto_334840 ?auto_334843 ) ) ( not ( = ?auto_334840 ?auto_334844 ) ) ( not ( = ?auto_334840 ?auto_334845 ) ) ( not ( = ?auto_334840 ?auto_334846 ) ) ( not ( = ?auto_334840 ?auto_334847 ) ) ( not ( = ?auto_334840 ?auto_334848 ) ) ( not ( = ?auto_334840 ?auto_334849 ) ) ( not ( = ?auto_334840 ?auto_334850 ) ) ( not ( = ?auto_334840 ?auto_334851 ) ) ( not ( = ?auto_334840 ?auto_334852 ) ) ( not ( = ?auto_334841 ?auto_334842 ) ) ( not ( = ?auto_334841 ?auto_334843 ) ) ( not ( = ?auto_334841 ?auto_334844 ) ) ( not ( = ?auto_334841 ?auto_334845 ) ) ( not ( = ?auto_334841 ?auto_334846 ) ) ( not ( = ?auto_334841 ?auto_334847 ) ) ( not ( = ?auto_334841 ?auto_334848 ) ) ( not ( = ?auto_334841 ?auto_334849 ) ) ( not ( = ?auto_334841 ?auto_334850 ) ) ( not ( = ?auto_334841 ?auto_334851 ) ) ( not ( = ?auto_334841 ?auto_334852 ) ) ( not ( = ?auto_334842 ?auto_334843 ) ) ( not ( = ?auto_334842 ?auto_334844 ) ) ( not ( = ?auto_334842 ?auto_334845 ) ) ( not ( = ?auto_334842 ?auto_334846 ) ) ( not ( = ?auto_334842 ?auto_334847 ) ) ( not ( = ?auto_334842 ?auto_334848 ) ) ( not ( = ?auto_334842 ?auto_334849 ) ) ( not ( = ?auto_334842 ?auto_334850 ) ) ( not ( = ?auto_334842 ?auto_334851 ) ) ( not ( = ?auto_334842 ?auto_334852 ) ) ( not ( = ?auto_334843 ?auto_334844 ) ) ( not ( = ?auto_334843 ?auto_334845 ) ) ( not ( = ?auto_334843 ?auto_334846 ) ) ( not ( = ?auto_334843 ?auto_334847 ) ) ( not ( = ?auto_334843 ?auto_334848 ) ) ( not ( = ?auto_334843 ?auto_334849 ) ) ( not ( = ?auto_334843 ?auto_334850 ) ) ( not ( = ?auto_334843 ?auto_334851 ) ) ( not ( = ?auto_334843 ?auto_334852 ) ) ( not ( = ?auto_334844 ?auto_334845 ) ) ( not ( = ?auto_334844 ?auto_334846 ) ) ( not ( = ?auto_334844 ?auto_334847 ) ) ( not ( = ?auto_334844 ?auto_334848 ) ) ( not ( = ?auto_334844 ?auto_334849 ) ) ( not ( = ?auto_334844 ?auto_334850 ) ) ( not ( = ?auto_334844 ?auto_334851 ) ) ( not ( = ?auto_334844 ?auto_334852 ) ) ( not ( = ?auto_334845 ?auto_334846 ) ) ( not ( = ?auto_334845 ?auto_334847 ) ) ( not ( = ?auto_334845 ?auto_334848 ) ) ( not ( = ?auto_334845 ?auto_334849 ) ) ( not ( = ?auto_334845 ?auto_334850 ) ) ( not ( = ?auto_334845 ?auto_334851 ) ) ( not ( = ?auto_334845 ?auto_334852 ) ) ( not ( = ?auto_334846 ?auto_334847 ) ) ( not ( = ?auto_334846 ?auto_334848 ) ) ( not ( = ?auto_334846 ?auto_334849 ) ) ( not ( = ?auto_334846 ?auto_334850 ) ) ( not ( = ?auto_334846 ?auto_334851 ) ) ( not ( = ?auto_334846 ?auto_334852 ) ) ( not ( = ?auto_334847 ?auto_334848 ) ) ( not ( = ?auto_334847 ?auto_334849 ) ) ( not ( = ?auto_334847 ?auto_334850 ) ) ( not ( = ?auto_334847 ?auto_334851 ) ) ( not ( = ?auto_334847 ?auto_334852 ) ) ( not ( = ?auto_334848 ?auto_334849 ) ) ( not ( = ?auto_334848 ?auto_334850 ) ) ( not ( = ?auto_334848 ?auto_334851 ) ) ( not ( = ?auto_334848 ?auto_334852 ) ) ( not ( = ?auto_334849 ?auto_334850 ) ) ( not ( = ?auto_334849 ?auto_334851 ) ) ( not ( = ?auto_334849 ?auto_334852 ) ) ( not ( = ?auto_334850 ?auto_334851 ) ) ( not ( = ?auto_334850 ?auto_334852 ) ) ( not ( = ?auto_334851 ?auto_334852 ) ) ( ON ?auto_334850 ?auto_334851 ) ( ON ?auto_334849 ?auto_334850 ) ( ON ?auto_334848 ?auto_334849 ) ( ON ?auto_334847 ?auto_334848 ) ( ON ?auto_334846 ?auto_334847 ) ( ON ?auto_334845 ?auto_334846 ) ( ON ?auto_334844 ?auto_334845 ) ( ON ?auto_334843 ?auto_334844 ) ( ON ?auto_334842 ?auto_334843 ) ( ON ?auto_334841 ?auto_334842 ) ( ON ?auto_334840 ?auto_334841 ) ( ON ?auto_334839 ?auto_334840 ) ( ON ?auto_334838 ?auto_334839 ) ( CLEAR ?auto_334838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_334838 )
      ( MAKE-14PILE ?auto_334838 ?auto_334839 ?auto_334840 ?auto_334841 ?auto_334842 ?auto_334843 ?auto_334844 ?auto_334845 ?auto_334846 ?auto_334847 ?auto_334848 ?auto_334849 ?auto_334850 ?auto_334851 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334867 - BLOCK
      ?auto_334868 - BLOCK
      ?auto_334869 - BLOCK
      ?auto_334870 - BLOCK
      ?auto_334871 - BLOCK
      ?auto_334872 - BLOCK
      ?auto_334873 - BLOCK
      ?auto_334874 - BLOCK
      ?auto_334875 - BLOCK
      ?auto_334876 - BLOCK
      ?auto_334877 - BLOCK
      ?auto_334878 - BLOCK
      ?auto_334879 - BLOCK
      ?auto_334880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_334880 ) ( not ( = ?auto_334867 ?auto_334868 ) ) ( not ( = ?auto_334867 ?auto_334869 ) ) ( not ( = ?auto_334867 ?auto_334870 ) ) ( not ( = ?auto_334867 ?auto_334871 ) ) ( not ( = ?auto_334867 ?auto_334872 ) ) ( not ( = ?auto_334867 ?auto_334873 ) ) ( not ( = ?auto_334867 ?auto_334874 ) ) ( not ( = ?auto_334867 ?auto_334875 ) ) ( not ( = ?auto_334867 ?auto_334876 ) ) ( not ( = ?auto_334867 ?auto_334877 ) ) ( not ( = ?auto_334867 ?auto_334878 ) ) ( not ( = ?auto_334867 ?auto_334879 ) ) ( not ( = ?auto_334867 ?auto_334880 ) ) ( not ( = ?auto_334868 ?auto_334869 ) ) ( not ( = ?auto_334868 ?auto_334870 ) ) ( not ( = ?auto_334868 ?auto_334871 ) ) ( not ( = ?auto_334868 ?auto_334872 ) ) ( not ( = ?auto_334868 ?auto_334873 ) ) ( not ( = ?auto_334868 ?auto_334874 ) ) ( not ( = ?auto_334868 ?auto_334875 ) ) ( not ( = ?auto_334868 ?auto_334876 ) ) ( not ( = ?auto_334868 ?auto_334877 ) ) ( not ( = ?auto_334868 ?auto_334878 ) ) ( not ( = ?auto_334868 ?auto_334879 ) ) ( not ( = ?auto_334868 ?auto_334880 ) ) ( not ( = ?auto_334869 ?auto_334870 ) ) ( not ( = ?auto_334869 ?auto_334871 ) ) ( not ( = ?auto_334869 ?auto_334872 ) ) ( not ( = ?auto_334869 ?auto_334873 ) ) ( not ( = ?auto_334869 ?auto_334874 ) ) ( not ( = ?auto_334869 ?auto_334875 ) ) ( not ( = ?auto_334869 ?auto_334876 ) ) ( not ( = ?auto_334869 ?auto_334877 ) ) ( not ( = ?auto_334869 ?auto_334878 ) ) ( not ( = ?auto_334869 ?auto_334879 ) ) ( not ( = ?auto_334869 ?auto_334880 ) ) ( not ( = ?auto_334870 ?auto_334871 ) ) ( not ( = ?auto_334870 ?auto_334872 ) ) ( not ( = ?auto_334870 ?auto_334873 ) ) ( not ( = ?auto_334870 ?auto_334874 ) ) ( not ( = ?auto_334870 ?auto_334875 ) ) ( not ( = ?auto_334870 ?auto_334876 ) ) ( not ( = ?auto_334870 ?auto_334877 ) ) ( not ( = ?auto_334870 ?auto_334878 ) ) ( not ( = ?auto_334870 ?auto_334879 ) ) ( not ( = ?auto_334870 ?auto_334880 ) ) ( not ( = ?auto_334871 ?auto_334872 ) ) ( not ( = ?auto_334871 ?auto_334873 ) ) ( not ( = ?auto_334871 ?auto_334874 ) ) ( not ( = ?auto_334871 ?auto_334875 ) ) ( not ( = ?auto_334871 ?auto_334876 ) ) ( not ( = ?auto_334871 ?auto_334877 ) ) ( not ( = ?auto_334871 ?auto_334878 ) ) ( not ( = ?auto_334871 ?auto_334879 ) ) ( not ( = ?auto_334871 ?auto_334880 ) ) ( not ( = ?auto_334872 ?auto_334873 ) ) ( not ( = ?auto_334872 ?auto_334874 ) ) ( not ( = ?auto_334872 ?auto_334875 ) ) ( not ( = ?auto_334872 ?auto_334876 ) ) ( not ( = ?auto_334872 ?auto_334877 ) ) ( not ( = ?auto_334872 ?auto_334878 ) ) ( not ( = ?auto_334872 ?auto_334879 ) ) ( not ( = ?auto_334872 ?auto_334880 ) ) ( not ( = ?auto_334873 ?auto_334874 ) ) ( not ( = ?auto_334873 ?auto_334875 ) ) ( not ( = ?auto_334873 ?auto_334876 ) ) ( not ( = ?auto_334873 ?auto_334877 ) ) ( not ( = ?auto_334873 ?auto_334878 ) ) ( not ( = ?auto_334873 ?auto_334879 ) ) ( not ( = ?auto_334873 ?auto_334880 ) ) ( not ( = ?auto_334874 ?auto_334875 ) ) ( not ( = ?auto_334874 ?auto_334876 ) ) ( not ( = ?auto_334874 ?auto_334877 ) ) ( not ( = ?auto_334874 ?auto_334878 ) ) ( not ( = ?auto_334874 ?auto_334879 ) ) ( not ( = ?auto_334874 ?auto_334880 ) ) ( not ( = ?auto_334875 ?auto_334876 ) ) ( not ( = ?auto_334875 ?auto_334877 ) ) ( not ( = ?auto_334875 ?auto_334878 ) ) ( not ( = ?auto_334875 ?auto_334879 ) ) ( not ( = ?auto_334875 ?auto_334880 ) ) ( not ( = ?auto_334876 ?auto_334877 ) ) ( not ( = ?auto_334876 ?auto_334878 ) ) ( not ( = ?auto_334876 ?auto_334879 ) ) ( not ( = ?auto_334876 ?auto_334880 ) ) ( not ( = ?auto_334877 ?auto_334878 ) ) ( not ( = ?auto_334877 ?auto_334879 ) ) ( not ( = ?auto_334877 ?auto_334880 ) ) ( not ( = ?auto_334878 ?auto_334879 ) ) ( not ( = ?auto_334878 ?auto_334880 ) ) ( not ( = ?auto_334879 ?auto_334880 ) ) ( ON ?auto_334879 ?auto_334880 ) ( ON ?auto_334878 ?auto_334879 ) ( ON ?auto_334877 ?auto_334878 ) ( ON ?auto_334876 ?auto_334877 ) ( ON ?auto_334875 ?auto_334876 ) ( ON ?auto_334874 ?auto_334875 ) ( ON ?auto_334873 ?auto_334874 ) ( ON ?auto_334872 ?auto_334873 ) ( ON ?auto_334871 ?auto_334872 ) ( ON ?auto_334870 ?auto_334871 ) ( ON ?auto_334869 ?auto_334870 ) ( ON ?auto_334868 ?auto_334869 ) ( ON ?auto_334867 ?auto_334868 ) ( CLEAR ?auto_334867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_334867 )
      ( MAKE-14PILE ?auto_334867 ?auto_334868 ?auto_334869 ?auto_334870 ?auto_334871 ?auto_334872 ?auto_334873 ?auto_334874 ?auto_334875 ?auto_334876 ?auto_334877 ?auto_334878 ?auto_334879 ?auto_334880 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_334895 - BLOCK
      ?auto_334896 - BLOCK
      ?auto_334897 - BLOCK
      ?auto_334898 - BLOCK
      ?auto_334899 - BLOCK
      ?auto_334900 - BLOCK
      ?auto_334901 - BLOCK
      ?auto_334902 - BLOCK
      ?auto_334903 - BLOCK
      ?auto_334904 - BLOCK
      ?auto_334905 - BLOCK
      ?auto_334906 - BLOCK
      ?auto_334907 - BLOCK
      ?auto_334908 - BLOCK
    )
    :vars
    (
      ?auto_334909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_334895 ?auto_334896 ) ) ( not ( = ?auto_334895 ?auto_334897 ) ) ( not ( = ?auto_334895 ?auto_334898 ) ) ( not ( = ?auto_334895 ?auto_334899 ) ) ( not ( = ?auto_334895 ?auto_334900 ) ) ( not ( = ?auto_334895 ?auto_334901 ) ) ( not ( = ?auto_334895 ?auto_334902 ) ) ( not ( = ?auto_334895 ?auto_334903 ) ) ( not ( = ?auto_334895 ?auto_334904 ) ) ( not ( = ?auto_334895 ?auto_334905 ) ) ( not ( = ?auto_334895 ?auto_334906 ) ) ( not ( = ?auto_334895 ?auto_334907 ) ) ( not ( = ?auto_334895 ?auto_334908 ) ) ( not ( = ?auto_334896 ?auto_334897 ) ) ( not ( = ?auto_334896 ?auto_334898 ) ) ( not ( = ?auto_334896 ?auto_334899 ) ) ( not ( = ?auto_334896 ?auto_334900 ) ) ( not ( = ?auto_334896 ?auto_334901 ) ) ( not ( = ?auto_334896 ?auto_334902 ) ) ( not ( = ?auto_334896 ?auto_334903 ) ) ( not ( = ?auto_334896 ?auto_334904 ) ) ( not ( = ?auto_334896 ?auto_334905 ) ) ( not ( = ?auto_334896 ?auto_334906 ) ) ( not ( = ?auto_334896 ?auto_334907 ) ) ( not ( = ?auto_334896 ?auto_334908 ) ) ( not ( = ?auto_334897 ?auto_334898 ) ) ( not ( = ?auto_334897 ?auto_334899 ) ) ( not ( = ?auto_334897 ?auto_334900 ) ) ( not ( = ?auto_334897 ?auto_334901 ) ) ( not ( = ?auto_334897 ?auto_334902 ) ) ( not ( = ?auto_334897 ?auto_334903 ) ) ( not ( = ?auto_334897 ?auto_334904 ) ) ( not ( = ?auto_334897 ?auto_334905 ) ) ( not ( = ?auto_334897 ?auto_334906 ) ) ( not ( = ?auto_334897 ?auto_334907 ) ) ( not ( = ?auto_334897 ?auto_334908 ) ) ( not ( = ?auto_334898 ?auto_334899 ) ) ( not ( = ?auto_334898 ?auto_334900 ) ) ( not ( = ?auto_334898 ?auto_334901 ) ) ( not ( = ?auto_334898 ?auto_334902 ) ) ( not ( = ?auto_334898 ?auto_334903 ) ) ( not ( = ?auto_334898 ?auto_334904 ) ) ( not ( = ?auto_334898 ?auto_334905 ) ) ( not ( = ?auto_334898 ?auto_334906 ) ) ( not ( = ?auto_334898 ?auto_334907 ) ) ( not ( = ?auto_334898 ?auto_334908 ) ) ( not ( = ?auto_334899 ?auto_334900 ) ) ( not ( = ?auto_334899 ?auto_334901 ) ) ( not ( = ?auto_334899 ?auto_334902 ) ) ( not ( = ?auto_334899 ?auto_334903 ) ) ( not ( = ?auto_334899 ?auto_334904 ) ) ( not ( = ?auto_334899 ?auto_334905 ) ) ( not ( = ?auto_334899 ?auto_334906 ) ) ( not ( = ?auto_334899 ?auto_334907 ) ) ( not ( = ?auto_334899 ?auto_334908 ) ) ( not ( = ?auto_334900 ?auto_334901 ) ) ( not ( = ?auto_334900 ?auto_334902 ) ) ( not ( = ?auto_334900 ?auto_334903 ) ) ( not ( = ?auto_334900 ?auto_334904 ) ) ( not ( = ?auto_334900 ?auto_334905 ) ) ( not ( = ?auto_334900 ?auto_334906 ) ) ( not ( = ?auto_334900 ?auto_334907 ) ) ( not ( = ?auto_334900 ?auto_334908 ) ) ( not ( = ?auto_334901 ?auto_334902 ) ) ( not ( = ?auto_334901 ?auto_334903 ) ) ( not ( = ?auto_334901 ?auto_334904 ) ) ( not ( = ?auto_334901 ?auto_334905 ) ) ( not ( = ?auto_334901 ?auto_334906 ) ) ( not ( = ?auto_334901 ?auto_334907 ) ) ( not ( = ?auto_334901 ?auto_334908 ) ) ( not ( = ?auto_334902 ?auto_334903 ) ) ( not ( = ?auto_334902 ?auto_334904 ) ) ( not ( = ?auto_334902 ?auto_334905 ) ) ( not ( = ?auto_334902 ?auto_334906 ) ) ( not ( = ?auto_334902 ?auto_334907 ) ) ( not ( = ?auto_334902 ?auto_334908 ) ) ( not ( = ?auto_334903 ?auto_334904 ) ) ( not ( = ?auto_334903 ?auto_334905 ) ) ( not ( = ?auto_334903 ?auto_334906 ) ) ( not ( = ?auto_334903 ?auto_334907 ) ) ( not ( = ?auto_334903 ?auto_334908 ) ) ( not ( = ?auto_334904 ?auto_334905 ) ) ( not ( = ?auto_334904 ?auto_334906 ) ) ( not ( = ?auto_334904 ?auto_334907 ) ) ( not ( = ?auto_334904 ?auto_334908 ) ) ( not ( = ?auto_334905 ?auto_334906 ) ) ( not ( = ?auto_334905 ?auto_334907 ) ) ( not ( = ?auto_334905 ?auto_334908 ) ) ( not ( = ?auto_334906 ?auto_334907 ) ) ( not ( = ?auto_334906 ?auto_334908 ) ) ( not ( = ?auto_334907 ?auto_334908 ) ) ( ON ?auto_334895 ?auto_334909 ) ( not ( = ?auto_334908 ?auto_334909 ) ) ( not ( = ?auto_334907 ?auto_334909 ) ) ( not ( = ?auto_334906 ?auto_334909 ) ) ( not ( = ?auto_334905 ?auto_334909 ) ) ( not ( = ?auto_334904 ?auto_334909 ) ) ( not ( = ?auto_334903 ?auto_334909 ) ) ( not ( = ?auto_334902 ?auto_334909 ) ) ( not ( = ?auto_334901 ?auto_334909 ) ) ( not ( = ?auto_334900 ?auto_334909 ) ) ( not ( = ?auto_334899 ?auto_334909 ) ) ( not ( = ?auto_334898 ?auto_334909 ) ) ( not ( = ?auto_334897 ?auto_334909 ) ) ( not ( = ?auto_334896 ?auto_334909 ) ) ( not ( = ?auto_334895 ?auto_334909 ) ) ( ON ?auto_334896 ?auto_334895 ) ( ON ?auto_334897 ?auto_334896 ) ( ON ?auto_334898 ?auto_334897 ) ( ON ?auto_334899 ?auto_334898 ) ( ON ?auto_334900 ?auto_334899 ) ( ON ?auto_334901 ?auto_334900 ) ( ON ?auto_334902 ?auto_334901 ) ( ON ?auto_334903 ?auto_334902 ) ( ON ?auto_334904 ?auto_334903 ) ( ON ?auto_334905 ?auto_334904 ) ( ON ?auto_334906 ?auto_334905 ) ( ON ?auto_334907 ?auto_334906 ) ( ON ?auto_334908 ?auto_334907 ) ( CLEAR ?auto_334908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_334908 ?auto_334907 ?auto_334906 ?auto_334905 ?auto_334904 ?auto_334903 ?auto_334902 ?auto_334901 ?auto_334900 ?auto_334899 ?auto_334898 ?auto_334897 ?auto_334896 ?auto_334895 )
      ( MAKE-14PILE ?auto_334895 ?auto_334896 ?auto_334897 ?auto_334898 ?auto_334899 ?auto_334900 ?auto_334901 ?auto_334902 ?auto_334903 ?auto_334904 ?auto_334905 ?auto_334906 ?auto_334907 ?auto_334908 ) )
  )

)

