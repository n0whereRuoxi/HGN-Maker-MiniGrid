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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61655 - BLOCK
      ?auto_61656 - BLOCK
      ?auto_61657 - BLOCK
      ?auto_61658 - BLOCK
      ?auto_61659 - BLOCK
      ?auto_61660 - BLOCK
    )
    :vars
    (
      ?auto_61661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61661 ?auto_61660 ) ( CLEAR ?auto_61661 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61655 ) ( ON ?auto_61656 ?auto_61655 ) ( ON ?auto_61657 ?auto_61656 ) ( ON ?auto_61658 ?auto_61657 ) ( ON ?auto_61659 ?auto_61658 ) ( ON ?auto_61660 ?auto_61659 ) ( not ( = ?auto_61655 ?auto_61656 ) ) ( not ( = ?auto_61655 ?auto_61657 ) ) ( not ( = ?auto_61655 ?auto_61658 ) ) ( not ( = ?auto_61655 ?auto_61659 ) ) ( not ( = ?auto_61655 ?auto_61660 ) ) ( not ( = ?auto_61655 ?auto_61661 ) ) ( not ( = ?auto_61656 ?auto_61657 ) ) ( not ( = ?auto_61656 ?auto_61658 ) ) ( not ( = ?auto_61656 ?auto_61659 ) ) ( not ( = ?auto_61656 ?auto_61660 ) ) ( not ( = ?auto_61656 ?auto_61661 ) ) ( not ( = ?auto_61657 ?auto_61658 ) ) ( not ( = ?auto_61657 ?auto_61659 ) ) ( not ( = ?auto_61657 ?auto_61660 ) ) ( not ( = ?auto_61657 ?auto_61661 ) ) ( not ( = ?auto_61658 ?auto_61659 ) ) ( not ( = ?auto_61658 ?auto_61660 ) ) ( not ( = ?auto_61658 ?auto_61661 ) ) ( not ( = ?auto_61659 ?auto_61660 ) ) ( not ( = ?auto_61659 ?auto_61661 ) ) ( not ( = ?auto_61660 ?auto_61661 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61661 ?auto_61660 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61663 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_61663 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_61663 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61664 - BLOCK
    )
    :vars
    (
      ?auto_61665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61664 ?auto_61665 ) ( CLEAR ?auto_61664 ) ( HAND-EMPTY ) ( not ( = ?auto_61664 ?auto_61665 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61664 ?auto_61665 )
      ( MAKE-1PILE ?auto_61664 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61671 - BLOCK
      ?auto_61672 - BLOCK
      ?auto_61673 - BLOCK
      ?auto_61674 - BLOCK
      ?auto_61675 - BLOCK
    )
    :vars
    (
      ?auto_61676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61676 ?auto_61675 ) ( CLEAR ?auto_61676 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61671 ) ( ON ?auto_61672 ?auto_61671 ) ( ON ?auto_61673 ?auto_61672 ) ( ON ?auto_61674 ?auto_61673 ) ( ON ?auto_61675 ?auto_61674 ) ( not ( = ?auto_61671 ?auto_61672 ) ) ( not ( = ?auto_61671 ?auto_61673 ) ) ( not ( = ?auto_61671 ?auto_61674 ) ) ( not ( = ?auto_61671 ?auto_61675 ) ) ( not ( = ?auto_61671 ?auto_61676 ) ) ( not ( = ?auto_61672 ?auto_61673 ) ) ( not ( = ?auto_61672 ?auto_61674 ) ) ( not ( = ?auto_61672 ?auto_61675 ) ) ( not ( = ?auto_61672 ?auto_61676 ) ) ( not ( = ?auto_61673 ?auto_61674 ) ) ( not ( = ?auto_61673 ?auto_61675 ) ) ( not ( = ?auto_61673 ?auto_61676 ) ) ( not ( = ?auto_61674 ?auto_61675 ) ) ( not ( = ?auto_61674 ?auto_61676 ) ) ( not ( = ?auto_61675 ?auto_61676 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61676 ?auto_61675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61677 - BLOCK
      ?auto_61678 - BLOCK
      ?auto_61679 - BLOCK
      ?auto_61680 - BLOCK
      ?auto_61681 - BLOCK
    )
    :vars
    (
      ?auto_61682 - BLOCK
      ?auto_61683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61682 ?auto_61681 ) ( CLEAR ?auto_61682 ) ( ON-TABLE ?auto_61677 ) ( ON ?auto_61678 ?auto_61677 ) ( ON ?auto_61679 ?auto_61678 ) ( ON ?auto_61680 ?auto_61679 ) ( ON ?auto_61681 ?auto_61680 ) ( not ( = ?auto_61677 ?auto_61678 ) ) ( not ( = ?auto_61677 ?auto_61679 ) ) ( not ( = ?auto_61677 ?auto_61680 ) ) ( not ( = ?auto_61677 ?auto_61681 ) ) ( not ( = ?auto_61677 ?auto_61682 ) ) ( not ( = ?auto_61678 ?auto_61679 ) ) ( not ( = ?auto_61678 ?auto_61680 ) ) ( not ( = ?auto_61678 ?auto_61681 ) ) ( not ( = ?auto_61678 ?auto_61682 ) ) ( not ( = ?auto_61679 ?auto_61680 ) ) ( not ( = ?auto_61679 ?auto_61681 ) ) ( not ( = ?auto_61679 ?auto_61682 ) ) ( not ( = ?auto_61680 ?auto_61681 ) ) ( not ( = ?auto_61680 ?auto_61682 ) ) ( not ( = ?auto_61681 ?auto_61682 ) ) ( HOLDING ?auto_61683 ) ( not ( = ?auto_61677 ?auto_61683 ) ) ( not ( = ?auto_61678 ?auto_61683 ) ) ( not ( = ?auto_61679 ?auto_61683 ) ) ( not ( = ?auto_61680 ?auto_61683 ) ) ( not ( = ?auto_61681 ?auto_61683 ) ) ( not ( = ?auto_61682 ?auto_61683 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_61683 )
      ( MAKE-5PILE ?auto_61677 ?auto_61678 ?auto_61679 ?auto_61680 ?auto_61681 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61684 - BLOCK
      ?auto_61685 - BLOCK
      ?auto_61686 - BLOCK
      ?auto_61687 - BLOCK
      ?auto_61688 - BLOCK
    )
    :vars
    (
      ?auto_61690 - BLOCK
      ?auto_61689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61690 ?auto_61688 ) ( ON-TABLE ?auto_61684 ) ( ON ?auto_61685 ?auto_61684 ) ( ON ?auto_61686 ?auto_61685 ) ( ON ?auto_61687 ?auto_61686 ) ( ON ?auto_61688 ?auto_61687 ) ( not ( = ?auto_61684 ?auto_61685 ) ) ( not ( = ?auto_61684 ?auto_61686 ) ) ( not ( = ?auto_61684 ?auto_61687 ) ) ( not ( = ?auto_61684 ?auto_61688 ) ) ( not ( = ?auto_61684 ?auto_61690 ) ) ( not ( = ?auto_61685 ?auto_61686 ) ) ( not ( = ?auto_61685 ?auto_61687 ) ) ( not ( = ?auto_61685 ?auto_61688 ) ) ( not ( = ?auto_61685 ?auto_61690 ) ) ( not ( = ?auto_61686 ?auto_61687 ) ) ( not ( = ?auto_61686 ?auto_61688 ) ) ( not ( = ?auto_61686 ?auto_61690 ) ) ( not ( = ?auto_61687 ?auto_61688 ) ) ( not ( = ?auto_61687 ?auto_61690 ) ) ( not ( = ?auto_61688 ?auto_61690 ) ) ( not ( = ?auto_61684 ?auto_61689 ) ) ( not ( = ?auto_61685 ?auto_61689 ) ) ( not ( = ?auto_61686 ?auto_61689 ) ) ( not ( = ?auto_61687 ?auto_61689 ) ) ( not ( = ?auto_61688 ?auto_61689 ) ) ( not ( = ?auto_61690 ?auto_61689 ) ) ( ON ?auto_61689 ?auto_61690 ) ( CLEAR ?auto_61689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61684 ?auto_61685 ?auto_61686 ?auto_61687 ?auto_61688 ?auto_61690 )
      ( MAKE-5PILE ?auto_61684 ?auto_61685 ?auto_61686 ?auto_61687 ?auto_61688 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61693 - BLOCK
      ?auto_61694 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_61694 ) ( CLEAR ?auto_61693 ) ( ON-TABLE ?auto_61693 ) ( not ( = ?auto_61693 ?auto_61694 ) ) )
    :subtasks
    ( ( !STACK ?auto_61694 ?auto_61693 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61695 - BLOCK
      ?auto_61696 - BLOCK
    )
    :vars
    (
      ?auto_61697 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61695 ) ( ON-TABLE ?auto_61695 ) ( not ( = ?auto_61695 ?auto_61696 ) ) ( ON ?auto_61696 ?auto_61697 ) ( CLEAR ?auto_61696 ) ( HAND-EMPTY ) ( not ( = ?auto_61695 ?auto_61697 ) ) ( not ( = ?auto_61696 ?auto_61697 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61696 ?auto_61697 )
      ( MAKE-2PILE ?auto_61695 ?auto_61696 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61698 - BLOCK
      ?auto_61699 - BLOCK
    )
    :vars
    (
      ?auto_61700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61698 ?auto_61699 ) ) ( ON ?auto_61699 ?auto_61700 ) ( CLEAR ?auto_61699 ) ( not ( = ?auto_61698 ?auto_61700 ) ) ( not ( = ?auto_61699 ?auto_61700 ) ) ( HOLDING ?auto_61698 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61698 )
      ( MAKE-2PILE ?auto_61698 ?auto_61699 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61701 - BLOCK
      ?auto_61702 - BLOCK
    )
    :vars
    (
      ?auto_61703 - BLOCK
      ?auto_61706 - BLOCK
      ?auto_61707 - BLOCK
      ?auto_61705 - BLOCK
      ?auto_61704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61701 ?auto_61702 ) ) ( ON ?auto_61702 ?auto_61703 ) ( not ( = ?auto_61701 ?auto_61703 ) ) ( not ( = ?auto_61702 ?auto_61703 ) ) ( ON ?auto_61701 ?auto_61702 ) ( CLEAR ?auto_61701 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61706 ) ( ON ?auto_61707 ?auto_61706 ) ( ON ?auto_61705 ?auto_61707 ) ( ON ?auto_61704 ?auto_61705 ) ( ON ?auto_61703 ?auto_61704 ) ( not ( = ?auto_61706 ?auto_61707 ) ) ( not ( = ?auto_61706 ?auto_61705 ) ) ( not ( = ?auto_61706 ?auto_61704 ) ) ( not ( = ?auto_61706 ?auto_61703 ) ) ( not ( = ?auto_61706 ?auto_61702 ) ) ( not ( = ?auto_61706 ?auto_61701 ) ) ( not ( = ?auto_61707 ?auto_61705 ) ) ( not ( = ?auto_61707 ?auto_61704 ) ) ( not ( = ?auto_61707 ?auto_61703 ) ) ( not ( = ?auto_61707 ?auto_61702 ) ) ( not ( = ?auto_61707 ?auto_61701 ) ) ( not ( = ?auto_61705 ?auto_61704 ) ) ( not ( = ?auto_61705 ?auto_61703 ) ) ( not ( = ?auto_61705 ?auto_61702 ) ) ( not ( = ?auto_61705 ?auto_61701 ) ) ( not ( = ?auto_61704 ?auto_61703 ) ) ( not ( = ?auto_61704 ?auto_61702 ) ) ( not ( = ?auto_61704 ?auto_61701 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61706 ?auto_61707 ?auto_61705 ?auto_61704 ?auto_61703 ?auto_61702 )
      ( MAKE-2PILE ?auto_61701 ?auto_61702 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61712 - BLOCK
      ?auto_61713 - BLOCK
      ?auto_61714 - BLOCK
      ?auto_61715 - BLOCK
    )
    :vars
    (
      ?auto_61716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61716 ?auto_61715 ) ( CLEAR ?auto_61716 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61712 ) ( ON ?auto_61713 ?auto_61712 ) ( ON ?auto_61714 ?auto_61713 ) ( ON ?auto_61715 ?auto_61714 ) ( not ( = ?auto_61712 ?auto_61713 ) ) ( not ( = ?auto_61712 ?auto_61714 ) ) ( not ( = ?auto_61712 ?auto_61715 ) ) ( not ( = ?auto_61712 ?auto_61716 ) ) ( not ( = ?auto_61713 ?auto_61714 ) ) ( not ( = ?auto_61713 ?auto_61715 ) ) ( not ( = ?auto_61713 ?auto_61716 ) ) ( not ( = ?auto_61714 ?auto_61715 ) ) ( not ( = ?auto_61714 ?auto_61716 ) ) ( not ( = ?auto_61715 ?auto_61716 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61716 ?auto_61715 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61717 - BLOCK
      ?auto_61718 - BLOCK
      ?auto_61719 - BLOCK
      ?auto_61720 - BLOCK
    )
    :vars
    (
      ?auto_61721 - BLOCK
      ?auto_61722 - BLOCK
      ?auto_61723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61721 ?auto_61720 ) ( CLEAR ?auto_61721 ) ( ON-TABLE ?auto_61717 ) ( ON ?auto_61718 ?auto_61717 ) ( ON ?auto_61719 ?auto_61718 ) ( ON ?auto_61720 ?auto_61719 ) ( not ( = ?auto_61717 ?auto_61718 ) ) ( not ( = ?auto_61717 ?auto_61719 ) ) ( not ( = ?auto_61717 ?auto_61720 ) ) ( not ( = ?auto_61717 ?auto_61721 ) ) ( not ( = ?auto_61718 ?auto_61719 ) ) ( not ( = ?auto_61718 ?auto_61720 ) ) ( not ( = ?auto_61718 ?auto_61721 ) ) ( not ( = ?auto_61719 ?auto_61720 ) ) ( not ( = ?auto_61719 ?auto_61721 ) ) ( not ( = ?auto_61720 ?auto_61721 ) ) ( HOLDING ?auto_61722 ) ( CLEAR ?auto_61723 ) ( not ( = ?auto_61717 ?auto_61722 ) ) ( not ( = ?auto_61717 ?auto_61723 ) ) ( not ( = ?auto_61718 ?auto_61722 ) ) ( not ( = ?auto_61718 ?auto_61723 ) ) ( not ( = ?auto_61719 ?auto_61722 ) ) ( not ( = ?auto_61719 ?auto_61723 ) ) ( not ( = ?auto_61720 ?auto_61722 ) ) ( not ( = ?auto_61720 ?auto_61723 ) ) ( not ( = ?auto_61721 ?auto_61722 ) ) ( not ( = ?auto_61721 ?auto_61723 ) ) ( not ( = ?auto_61722 ?auto_61723 ) ) )
    :subtasks
    ( ( !STACK ?auto_61722 ?auto_61723 )
      ( MAKE-4PILE ?auto_61717 ?auto_61718 ?auto_61719 ?auto_61720 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62323 - BLOCK
      ?auto_62324 - BLOCK
      ?auto_62325 - BLOCK
      ?auto_62326 - BLOCK
    )
    :vars
    (
      ?auto_62327 - BLOCK
      ?auto_62328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62327 ?auto_62326 ) ( ON-TABLE ?auto_62323 ) ( ON ?auto_62324 ?auto_62323 ) ( ON ?auto_62325 ?auto_62324 ) ( ON ?auto_62326 ?auto_62325 ) ( not ( = ?auto_62323 ?auto_62324 ) ) ( not ( = ?auto_62323 ?auto_62325 ) ) ( not ( = ?auto_62323 ?auto_62326 ) ) ( not ( = ?auto_62323 ?auto_62327 ) ) ( not ( = ?auto_62324 ?auto_62325 ) ) ( not ( = ?auto_62324 ?auto_62326 ) ) ( not ( = ?auto_62324 ?auto_62327 ) ) ( not ( = ?auto_62325 ?auto_62326 ) ) ( not ( = ?auto_62325 ?auto_62327 ) ) ( not ( = ?auto_62326 ?auto_62327 ) ) ( not ( = ?auto_62323 ?auto_62328 ) ) ( not ( = ?auto_62324 ?auto_62328 ) ) ( not ( = ?auto_62325 ?auto_62328 ) ) ( not ( = ?auto_62326 ?auto_62328 ) ) ( not ( = ?auto_62327 ?auto_62328 ) ) ( ON ?auto_62328 ?auto_62327 ) ( CLEAR ?auto_62328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62323 ?auto_62324 ?auto_62325 ?auto_62326 ?auto_62327 )
      ( MAKE-4PILE ?auto_62323 ?auto_62324 ?auto_62325 ?auto_62326 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61731 - BLOCK
      ?auto_61732 - BLOCK
      ?auto_61733 - BLOCK
      ?auto_61734 - BLOCK
    )
    :vars
    (
      ?auto_61735 - BLOCK
      ?auto_61737 - BLOCK
      ?auto_61736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61735 ?auto_61734 ) ( ON-TABLE ?auto_61731 ) ( ON ?auto_61732 ?auto_61731 ) ( ON ?auto_61733 ?auto_61732 ) ( ON ?auto_61734 ?auto_61733 ) ( not ( = ?auto_61731 ?auto_61732 ) ) ( not ( = ?auto_61731 ?auto_61733 ) ) ( not ( = ?auto_61731 ?auto_61734 ) ) ( not ( = ?auto_61731 ?auto_61735 ) ) ( not ( = ?auto_61732 ?auto_61733 ) ) ( not ( = ?auto_61732 ?auto_61734 ) ) ( not ( = ?auto_61732 ?auto_61735 ) ) ( not ( = ?auto_61733 ?auto_61734 ) ) ( not ( = ?auto_61733 ?auto_61735 ) ) ( not ( = ?auto_61734 ?auto_61735 ) ) ( not ( = ?auto_61731 ?auto_61737 ) ) ( not ( = ?auto_61731 ?auto_61736 ) ) ( not ( = ?auto_61732 ?auto_61737 ) ) ( not ( = ?auto_61732 ?auto_61736 ) ) ( not ( = ?auto_61733 ?auto_61737 ) ) ( not ( = ?auto_61733 ?auto_61736 ) ) ( not ( = ?auto_61734 ?auto_61737 ) ) ( not ( = ?auto_61734 ?auto_61736 ) ) ( not ( = ?auto_61735 ?auto_61737 ) ) ( not ( = ?auto_61735 ?auto_61736 ) ) ( not ( = ?auto_61737 ?auto_61736 ) ) ( ON ?auto_61737 ?auto_61735 ) ( CLEAR ?auto_61737 ) ( HOLDING ?auto_61736 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61736 )
      ( MAKE-4PILE ?auto_61731 ?auto_61732 ?auto_61733 ?auto_61734 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61738 - BLOCK
      ?auto_61739 - BLOCK
      ?auto_61740 - BLOCK
      ?auto_61741 - BLOCK
    )
    :vars
    (
      ?auto_61744 - BLOCK
      ?auto_61742 - BLOCK
      ?auto_61743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61744 ?auto_61741 ) ( ON-TABLE ?auto_61738 ) ( ON ?auto_61739 ?auto_61738 ) ( ON ?auto_61740 ?auto_61739 ) ( ON ?auto_61741 ?auto_61740 ) ( not ( = ?auto_61738 ?auto_61739 ) ) ( not ( = ?auto_61738 ?auto_61740 ) ) ( not ( = ?auto_61738 ?auto_61741 ) ) ( not ( = ?auto_61738 ?auto_61744 ) ) ( not ( = ?auto_61739 ?auto_61740 ) ) ( not ( = ?auto_61739 ?auto_61741 ) ) ( not ( = ?auto_61739 ?auto_61744 ) ) ( not ( = ?auto_61740 ?auto_61741 ) ) ( not ( = ?auto_61740 ?auto_61744 ) ) ( not ( = ?auto_61741 ?auto_61744 ) ) ( not ( = ?auto_61738 ?auto_61742 ) ) ( not ( = ?auto_61738 ?auto_61743 ) ) ( not ( = ?auto_61739 ?auto_61742 ) ) ( not ( = ?auto_61739 ?auto_61743 ) ) ( not ( = ?auto_61740 ?auto_61742 ) ) ( not ( = ?auto_61740 ?auto_61743 ) ) ( not ( = ?auto_61741 ?auto_61742 ) ) ( not ( = ?auto_61741 ?auto_61743 ) ) ( not ( = ?auto_61744 ?auto_61742 ) ) ( not ( = ?auto_61744 ?auto_61743 ) ) ( not ( = ?auto_61742 ?auto_61743 ) ) ( ON ?auto_61742 ?auto_61744 ) ( ON ?auto_61743 ?auto_61742 ) ( CLEAR ?auto_61743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61738 ?auto_61739 ?auto_61740 ?auto_61741 ?auto_61744 ?auto_61742 )
      ( MAKE-4PILE ?auto_61738 ?auto_61739 ?auto_61740 ?auto_61741 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61748 - BLOCK
      ?auto_61749 - BLOCK
      ?auto_61750 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_61750 ) ( CLEAR ?auto_61749 ) ( ON-TABLE ?auto_61748 ) ( ON ?auto_61749 ?auto_61748 ) ( not ( = ?auto_61748 ?auto_61749 ) ) ( not ( = ?auto_61748 ?auto_61750 ) ) ( not ( = ?auto_61749 ?auto_61750 ) ) )
    :subtasks
    ( ( !STACK ?auto_61750 ?auto_61749 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61751 - BLOCK
      ?auto_61752 - BLOCK
      ?auto_61753 - BLOCK
    )
    :vars
    (
      ?auto_61754 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61752 ) ( ON-TABLE ?auto_61751 ) ( ON ?auto_61752 ?auto_61751 ) ( not ( = ?auto_61751 ?auto_61752 ) ) ( not ( = ?auto_61751 ?auto_61753 ) ) ( not ( = ?auto_61752 ?auto_61753 ) ) ( ON ?auto_61753 ?auto_61754 ) ( CLEAR ?auto_61753 ) ( HAND-EMPTY ) ( not ( = ?auto_61751 ?auto_61754 ) ) ( not ( = ?auto_61752 ?auto_61754 ) ) ( not ( = ?auto_61753 ?auto_61754 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61753 ?auto_61754 )
      ( MAKE-3PILE ?auto_61751 ?auto_61752 ?auto_61753 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61755 - BLOCK
      ?auto_61756 - BLOCK
      ?auto_61757 - BLOCK
    )
    :vars
    (
      ?auto_61758 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61755 ) ( not ( = ?auto_61755 ?auto_61756 ) ) ( not ( = ?auto_61755 ?auto_61757 ) ) ( not ( = ?auto_61756 ?auto_61757 ) ) ( ON ?auto_61757 ?auto_61758 ) ( CLEAR ?auto_61757 ) ( not ( = ?auto_61755 ?auto_61758 ) ) ( not ( = ?auto_61756 ?auto_61758 ) ) ( not ( = ?auto_61757 ?auto_61758 ) ) ( HOLDING ?auto_61756 ) ( CLEAR ?auto_61755 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61755 ?auto_61756 )
      ( MAKE-3PILE ?auto_61755 ?auto_61756 ?auto_61757 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61759 - BLOCK
      ?auto_61760 - BLOCK
      ?auto_61761 - BLOCK
    )
    :vars
    (
      ?auto_61762 - BLOCK
      ?auto_61764 - BLOCK
      ?auto_61763 - BLOCK
      ?auto_61765 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61759 ) ( not ( = ?auto_61759 ?auto_61760 ) ) ( not ( = ?auto_61759 ?auto_61761 ) ) ( not ( = ?auto_61760 ?auto_61761 ) ) ( ON ?auto_61761 ?auto_61762 ) ( not ( = ?auto_61759 ?auto_61762 ) ) ( not ( = ?auto_61760 ?auto_61762 ) ) ( not ( = ?auto_61761 ?auto_61762 ) ) ( CLEAR ?auto_61759 ) ( ON ?auto_61760 ?auto_61761 ) ( CLEAR ?auto_61760 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61764 ) ( ON ?auto_61763 ?auto_61764 ) ( ON ?auto_61765 ?auto_61763 ) ( ON ?auto_61762 ?auto_61765 ) ( not ( = ?auto_61764 ?auto_61763 ) ) ( not ( = ?auto_61764 ?auto_61765 ) ) ( not ( = ?auto_61764 ?auto_61762 ) ) ( not ( = ?auto_61764 ?auto_61761 ) ) ( not ( = ?auto_61764 ?auto_61760 ) ) ( not ( = ?auto_61763 ?auto_61765 ) ) ( not ( = ?auto_61763 ?auto_61762 ) ) ( not ( = ?auto_61763 ?auto_61761 ) ) ( not ( = ?auto_61763 ?auto_61760 ) ) ( not ( = ?auto_61765 ?auto_61762 ) ) ( not ( = ?auto_61765 ?auto_61761 ) ) ( not ( = ?auto_61765 ?auto_61760 ) ) ( not ( = ?auto_61759 ?auto_61764 ) ) ( not ( = ?auto_61759 ?auto_61763 ) ) ( not ( = ?auto_61759 ?auto_61765 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61764 ?auto_61763 ?auto_61765 ?auto_61762 ?auto_61761 )
      ( MAKE-3PILE ?auto_61759 ?auto_61760 ?auto_61761 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61766 - BLOCK
      ?auto_61767 - BLOCK
      ?auto_61768 - BLOCK
    )
    :vars
    (
      ?auto_61772 - BLOCK
      ?auto_61771 - BLOCK
      ?auto_61769 - BLOCK
      ?auto_61770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61766 ?auto_61767 ) ) ( not ( = ?auto_61766 ?auto_61768 ) ) ( not ( = ?auto_61767 ?auto_61768 ) ) ( ON ?auto_61768 ?auto_61772 ) ( not ( = ?auto_61766 ?auto_61772 ) ) ( not ( = ?auto_61767 ?auto_61772 ) ) ( not ( = ?auto_61768 ?auto_61772 ) ) ( ON ?auto_61767 ?auto_61768 ) ( CLEAR ?auto_61767 ) ( ON-TABLE ?auto_61771 ) ( ON ?auto_61769 ?auto_61771 ) ( ON ?auto_61770 ?auto_61769 ) ( ON ?auto_61772 ?auto_61770 ) ( not ( = ?auto_61771 ?auto_61769 ) ) ( not ( = ?auto_61771 ?auto_61770 ) ) ( not ( = ?auto_61771 ?auto_61772 ) ) ( not ( = ?auto_61771 ?auto_61768 ) ) ( not ( = ?auto_61771 ?auto_61767 ) ) ( not ( = ?auto_61769 ?auto_61770 ) ) ( not ( = ?auto_61769 ?auto_61772 ) ) ( not ( = ?auto_61769 ?auto_61768 ) ) ( not ( = ?auto_61769 ?auto_61767 ) ) ( not ( = ?auto_61770 ?auto_61772 ) ) ( not ( = ?auto_61770 ?auto_61768 ) ) ( not ( = ?auto_61770 ?auto_61767 ) ) ( not ( = ?auto_61766 ?auto_61771 ) ) ( not ( = ?auto_61766 ?auto_61769 ) ) ( not ( = ?auto_61766 ?auto_61770 ) ) ( HOLDING ?auto_61766 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61766 )
      ( MAKE-3PILE ?auto_61766 ?auto_61767 ?auto_61768 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61773 - BLOCK
      ?auto_61774 - BLOCK
      ?auto_61775 - BLOCK
    )
    :vars
    (
      ?auto_61777 - BLOCK
      ?auto_61776 - BLOCK
      ?auto_61779 - BLOCK
      ?auto_61778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61773 ?auto_61774 ) ) ( not ( = ?auto_61773 ?auto_61775 ) ) ( not ( = ?auto_61774 ?auto_61775 ) ) ( ON ?auto_61775 ?auto_61777 ) ( not ( = ?auto_61773 ?auto_61777 ) ) ( not ( = ?auto_61774 ?auto_61777 ) ) ( not ( = ?auto_61775 ?auto_61777 ) ) ( ON ?auto_61774 ?auto_61775 ) ( ON-TABLE ?auto_61776 ) ( ON ?auto_61779 ?auto_61776 ) ( ON ?auto_61778 ?auto_61779 ) ( ON ?auto_61777 ?auto_61778 ) ( not ( = ?auto_61776 ?auto_61779 ) ) ( not ( = ?auto_61776 ?auto_61778 ) ) ( not ( = ?auto_61776 ?auto_61777 ) ) ( not ( = ?auto_61776 ?auto_61775 ) ) ( not ( = ?auto_61776 ?auto_61774 ) ) ( not ( = ?auto_61779 ?auto_61778 ) ) ( not ( = ?auto_61779 ?auto_61777 ) ) ( not ( = ?auto_61779 ?auto_61775 ) ) ( not ( = ?auto_61779 ?auto_61774 ) ) ( not ( = ?auto_61778 ?auto_61777 ) ) ( not ( = ?auto_61778 ?auto_61775 ) ) ( not ( = ?auto_61778 ?auto_61774 ) ) ( not ( = ?auto_61773 ?auto_61776 ) ) ( not ( = ?auto_61773 ?auto_61779 ) ) ( not ( = ?auto_61773 ?auto_61778 ) ) ( ON ?auto_61773 ?auto_61774 ) ( CLEAR ?auto_61773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61776 ?auto_61779 ?auto_61778 ?auto_61777 ?auto_61775 ?auto_61774 )
      ( MAKE-3PILE ?auto_61773 ?auto_61774 ?auto_61775 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61783 - BLOCK
      ?auto_61784 - BLOCK
      ?auto_61785 - BLOCK
    )
    :vars
    (
      ?auto_61786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61786 ?auto_61785 ) ( CLEAR ?auto_61786 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61783 ) ( ON ?auto_61784 ?auto_61783 ) ( ON ?auto_61785 ?auto_61784 ) ( not ( = ?auto_61783 ?auto_61784 ) ) ( not ( = ?auto_61783 ?auto_61785 ) ) ( not ( = ?auto_61783 ?auto_61786 ) ) ( not ( = ?auto_61784 ?auto_61785 ) ) ( not ( = ?auto_61784 ?auto_61786 ) ) ( not ( = ?auto_61785 ?auto_61786 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61786 ?auto_61785 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61787 - BLOCK
      ?auto_61788 - BLOCK
      ?auto_61789 - BLOCK
    )
    :vars
    (
      ?auto_61790 - BLOCK
      ?auto_61791 - BLOCK
      ?auto_61792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61790 ?auto_61789 ) ( CLEAR ?auto_61790 ) ( ON-TABLE ?auto_61787 ) ( ON ?auto_61788 ?auto_61787 ) ( ON ?auto_61789 ?auto_61788 ) ( not ( = ?auto_61787 ?auto_61788 ) ) ( not ( = ?auto_61787 ?auto_61789 ) ) ( not ( = ?auto_61787 ?auto_61790 ) ) ( not ( = ?auto_61788 ?auto_61789 ) ) ( not ( = ?auto_61788 ?auto_61790 ) ) ( not ( = ?auto_61789 ?auto_61790 ) ) ( HOLDING ?auto_61791 ) ( CLEAR ?auto_61792 ) ( not ( = ?auto_61787 ?auto_61791 ) ) ( not ( = ?auto_61787 ?auto_61792 ) ) ( not ( = ?auto_61788 ?auto_61791 ) ) ( not ( = ?auto_61788 ?auto_61792 ) ) ( not ( = ?auto_61789 ?auto_61791 ) ) ( not ( = ?auto_61789 ?auto_61792 ) ) ( not ( = ?auto_61790 ?auto_61791 ) ) ( not ( = ?auto_61790 ?auto_61792 ) ) ( not ( = ?auto_61791 ?auto_61792 ) ) )
    :subtasks
    ( ( !STACK ?auto_61791 ?auto_61792 )
      ( MAKE-3PILE ?auto_61787 ?auto_61788 ?auto_61789 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61793 - BLOCK
      ?auto_61794 - BLOCK
      ?auto_61795 - BLOCK
    )
    :vars
    (
      ?auto_61796 - BLOCK
      ?auto_61798 - BLOCK
      ?auto_61797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61796 ?auto_61795 ) ( ON-TABLE ?auto_61793 ) ( ON ?auto_61794 ?auto_61793 ) ( ON ?auto_61795 ?auto_61794 ) ( not ( = ?auto_61793 ?auto_61794 ) ) ( not ( = ?auto_61793 ?auto_61795 ) ) ( not ( = ?auto_61793 ?auto_61796 ) ) ( not ( = ?auto_61794 ?auto_61795 ) ) ( not ( = ?auto_61794 ?auto_61796 ) ) ( not ( = ?auto_61795 ?auto_61796 ) ) ( CLEAR ?auto_61798 ) ( not ( = ?auto_61793 ?auto_61797 ) ) ( not ( = ?auto_61793 ?auto_61798 ) ) ( not ( = ?auto_61794 ?auto_61797 ) ) ( not ( = ?auto_61794 ?auto_61798 ) ) ( not ( = ?auto_61795 ?auto_61797 ) ) ( not ( = ?auto_61795 ?auto_61798 ) ) ( not ( = ?auto_61796 ?auto_61797 ) ) ( not ( = ?auto_61796 ?auto_61798 ) ) ( not ( = ?auto_61797 ?auto_61798 ) ) ( ON ?auto_61797 ?auto_61796 ) ( CLEAR ?auto_61797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61793 ?auto_61794 ?auto_61795 ?auto_61796 )
      ( MAKE-3PILE ?auto_61793 ?auto_61794 ?auto_61795 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61799 - BLOCK
      ?auto_61800 - BLOCK
      ?auto_61801 - BLOCK
    )
    :vars
    (
      ?auto_61802 - BLOCK
      ?auto_61804 - BLOCK
      ?auto_61803 - BLOCK
      ?auto_61805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61802 ?auto_61801 ) ( ON-TABLE ?auto_61799 ) ( ON ?auto_61800 ?auto_61799 ) ( ON ?auto_61801 ?auto_61800 ) ( not ( = ?auto_61799 ?auto_61800 ) ) ( not ( = ?auto_61799 ?auto_61801 ) ) ( not ( = ?auto_61799 ?auto_61802 ) ) ( not ( = ?auto_61800 ?auto_61801 ) ) ( not ( = ?auto_61800 ?auto_61802 ) ) ( not ( = ?auto_61801 ?auto_61802 ) ) ( not ( = ?auto_61799 ?auto_61804 ) ) ( not ( = ?auto_61799 ?auto_61803 ) ) ( not ( = ?auto_61800 ?auto_61804 ) ) ( not ( = ?auto_61800 ?auto_61803 ) ) ( not ( = ?auto_61801 ?auto_61804 ) ) ( not ( = ?auto_61801 ?auto_61803 ) ) ( not ( = ?auto_61802 ?auto_61804 ) ) ( not ( = ?auto_61802 ?auto_61803 ) ) ( not ( = ?auto_61804 ?auto_61803 ) ) ( ON ?auto_61804 ?auto_61802 ) ( CLEAR ?auto_61804 ) ( HOLDING ?auto_61803 ) ( CLEAR ?auto_61805 ) ( ON-TABLE ?auto_61805 ) ( not ( = ?auto_61805 ?auto_61803 ) ) ( not ( = ?auto_61799 ?auto_61805 ) ) ( not ( = ?auto_61800 ?auto_61805 ) ) ( not ( = ?auto_61801 ?auto_61805 ) ) ( not ( = ?auto_61802 ?auto_61805 ) ) ( not ( = ?auto_61804 ?auto_61805 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61805 ?auto_61803 )
      ( MAKE-3PILE ?auto_61799 ?auto_61800 ?auto_61801 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62497 - BLOCK
      ?auto_62498 - BLOCK
      ?auto_62499 - BLOCK
    )
    :vars
    (
      ?auto_62500 - BLOCK
      ?auto_62502 - BLOCK
      ?auto_62501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62500 ?auto_62499 ) ( ON-TABLE ?auto_62497 ) ( ON ?auto_62498 ?auto_62497 ) ( ON ?auto_62499 ?auto_62498 ) ( not ( = ?auto_62497 ?auto_62498 ) ) ( not ( = ?auto_62497 ?auto_62499 ) ) ( not ( = ?auto_62497 ?auto_62500 ) ) ( not ( = ?auto_62498 ?auto_62499 ) ) ( not ( = ?auto_62498 ?auto_62500 ) ) ( not ( = ?auto_62499 ?auto_62500 ) ) ( not ( = ?auto_62497 ?auto_62502 ) ) ( not ( = ?auto_62497 ?auto_62501 ) ) ( not ( = ?auto_62498 ?auto_62502 ) ) ( not ( = ?auto_62498 ?auto_62501 ) ) ( not ( = ?auto_62499 ?auto_62502 ) ) ( not ( = ?auto_62499 ?auto_62501 ) ) ( not ( = ?auto_62500 ?auto_62502 ) ) ( not ( = ?auto_62500 ?auto_62501 ) ) ( not ( = ?auto_62502 ?auto_62501 ) ) ( ON ?auto_62502 ?auto_62500 ) ( ON ?auto_62501 ?auto_62502 ) ( CLEAR ?auto_62501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62497 ?auto_62498 ?auto_62499 ?auto_62500 ?auto_62502 )
      ( MAKE-3PILE ?auto_62497 ?auto_62498 ?auto_62499 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61813 - BLOCK
      ?auto_61814 - BLOCK
      ?auto_61815 - BLOCK
    )
    :vars
    (
      ?auto_61817 - BLOCK
      ?auto_61818 - BLOCK
      ?auto_61816 - BLOCK
      ?auto_61819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61817 ?auto_61815 ) ( ON-TABLE ?auto_61813 ) ( ON ?auto_61814 ?auto_61813 ) ( ON ?auto_61815 ?auto_61814 ) ( not ( = ?auto_61813 ?auto_61814 ) ) ( not ( = ?auto_61813 ?auto_61815 ) ) ( not ( = ?auto_61813 ?auto_61817 ) ) ( not ( = ?auto_61814 ?auto_61815 ) ) ( not ( = ?auto_61814 ?auto_61817 ) ) ( not ( = ?auto_61815 ?auto_61817 ) ) ( not ( = ?auto_61813 ?auto_61818 ) ) ( not ( = ?auto_61813 ?auto_61816 ) ) ( not ( = ?auto_61814 ?auto_61818 ) ) ( not ( = ?auto_61814 ?auto_61816 ) ) ( not ( = ?auto_61815 ?auto_61818 ) ) ( not ( = ?auto_61815 ?auto_61816 ) ) ( not ( = ?auto_61817 ?auto_61818 ) ) ( not ( = ?auto_61817 ?auto_61816 ) ) ( not ( = ?auto_61818 ?auto_61816 ) ) ( ON ?auto_61818 ?auto_61817 ) ( not ( = ?auto_61819 ?auto_61816 ) ) ( not ( = ?auto_61813 ?auto_61819 ) ) ( not ( = ?auto_61814 ?auto_61819 ) ) ( not ( = ?auto_61815 ?auto_61819 ) ) ( not ( = ?auto_61817 ?auto_61819 ) ) ( not ( = ?auto_61818 ?auto_61819 ) ) ( ON ?auto_61816 ?auto_61818 ) ( CLEAR ?auto_61816 ) ( HOLDING ?auto_61819 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61819 )
      ( MAKE-3PILE ?auto_61813 ?auto_61814 ?auto_61815 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61820 - BLOCK
      ?auto_61821 - BLOCK
      ?auto_61822 - BLOCK
    )
    :vars
    (
      ?auto_61825 - BLOCK
      ?auto_61823 - BLOCK
      ?auto_61824 - BLOCK
      ?auto_61826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61825 ?auto_61822 ) ( ON-TABLE ?auto_61820 ) ( ON ?auto_61821 ?auto_61820 ) ( ON ?auto_61822 ?auto_61821 ) ( not ( = ?auto_61820 ?auto_61821 ) ) ( not ( = ?auto_61820 ?auto_61822 ) ) ( not ( = ?auto_61820 ?auto_61825 ) ) ( not ( = ?auto_61821 ?auto_61822 ) ) ( not ( = ?auto_61821 ?auto_61825 ) ) ( not ( = ?auto_61822 ?auto_61825 ) ) ( not ( = ?auto_61820 ?auto_61823 ) ) ( not ( = ?auto_61820 ?auto_61824 ) ) ( not ( = ?auto_61821 ?auto_61823 ) ) ( not ( = ?auto_61821 ?auto_61824 ) ) ( not ( = ?auto_61822 ?auto_61823 ) ) ( not ( = ?auto_61822 ?auto_61824 ) ) ( not ( = ?auto_61825 ?auto_61823 ) ) ( not ( = ?auto_61825 ?auto_61824 ) ) ( not ( = ?auto_61823 ?auto_61824 ) ) ( ON ?auto_61823 ?auto_61825 ) ( not ( = ?auto_61826 ?auto_61824 ) ) ( not ( = ?auto_61820 ?auto_61826 ) ) ( not ( = ?auto_61821 ?auto_61826 ) ) ( not ( = ?auto_61822 ?auto_61826 ) ) ( not ( = ?auto_61825 ?auto_61826 ) ) ( not ( = ?auto_61823 ?auto_61826 ) ) ( ON ?auto_61824 ?auto_61823 ) ( ON ?auto_61826 ?auto_61824 ) ( CLEAR ?auto_61826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61820 ?auto_61821 ?auto_61822 ?auto_61825 ?auto_61823 ?auto_61824 )
      ( MAKE-3PILE ?auto_61820 ?auto_61821 ?auto_61822 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61831 - BLOCK
      ?auto_61832 - BLOCK
      ?auto_61833 - BLOCK
      ?auto_61834 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_61834 ) ( CLEAR ?auto_61833 ) ( ON-TABLE ?auto_61831 ) ( ON ?auto_61832 ?auto_61831 ) ( ON ?auto_61833 ?auto_61832 ) ( not ( = ?auto_61831 ?auto_61832 ) ) ( not ( = ?auto_61831 ?auto_61833 ) ) ( not ( = ?auto_61831 ?auto_61834 ) ) ( not ( = ?auto_61832 ?auto_61833 ) ) ( not ( = ?auto_61832 ?auto_61834 ) ) ( not ( = ?auto_61833 ?auto_61834 ) ) )
    :subtasks
    ( ( !STACK ?auto_61834 ?auto_61833 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61835 - BLOCK
      ?auto_61836 - BLOCK
      ?auto_61837 - BLOCK
      ?auto_61838 - BLOCK
    )
    :vars
    (
      ?auto_61839 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61837 ) ( ON-TABLE ?auto_61835 ) ( ON ?auto_61836 ?auto_61835 ) ( ON ?auto_61837 ?auto_61836 ) ( not ( = ?auto_61835 ?auto_61836 ) ) ( not ( = ?auto_61835 ?auto_61837 ) ) ( not ( = ?auto_61835 ?auto_61838 ) ) ( not ( = ?auto_61836 ?auto_61837 ) ) ( not ( = ?auto_61836 ?auto_61838 ) ) ( not ( = ?auto_61837 ?auto_61838 ) ) ( ON ?auto_61838 ?auto_61839 ) ( CLEAR ?auto_61838 ) ( HAND-EMPTY ) ( not ( = ?auto_61835 ?auto_61839 ) ) ( not ( = ?auto_61836 ?auto_61839 ) ) ( not ( = ?auto_61837 ?auto_61839 ) ) ( not ( = ?auto_61838 ?auto_61839 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61838 ?auto_61839 )
      ( MAKE-4PILE ?auto_61835 ?auto_61836 ?auto_61837 ?auto_61838 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61840 - BLOCK
      ?auto_61841 - BLOCK
      ?auto_61842 - BLOCK
      ?auto_61843 - BLOCK
    )
    :vars
    (
      ?auto_61844 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61840 ) ( ON ?auto_61841 ?auto_61840 ) ( not ( = ?auto_61840 ?auto_61841 ) ) ( not ( = ?auto_61840 ?auto_61842 ) ) ( not ( = ?auto_61840 ?auto_61843 ) ) ( not ( = ?auto_61841 ?auto_61842 ) ) ( not ( = ?auto_61841 ?auto_61843 ) ) ( not ( = ?auto_61842 ?auto_61843 ) ) ( ON ?auto_61843 ?auto_61844 ) ( CLEAR ?auto_61843 ) ( not ( = ?auto_61840 ?auto_61844 ) ) ( not ( = ?auto_61841 ?auto_61844 ) ) ( not ( = ?auto_61842 ?auto_61844 ) ) ( not ( = ?auto_61843 ?auto_61844 ) ) ( HOLDING ?auto_61842 ) ( CLEAR ?auto_61841 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61840 ?auto_61841 ?auto_61842 )
      ( MAKE-4PILE ?auto_61840 ?auto_61841 ?auto_61842 ?auto_61843 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61845 - BLOCK
      ?auto_61846 - BLOCK
      ?auto_61847 - BLOCK
      ?auto_61848 - BLOCK
    )
    :vars
    (
      ?auto_61849 - BLOCK
      ?auto_61851 - BLOCK
      ?auto_61850 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61845 ) ( ON ?auto_61846 ?auto_61845 ) ( not ( = ?auto_61845 ?auto_61846 ) ) ( not ( = ?auto_61845 ?auto_61847 ) ) ( not ( = ?auto_61845 ?auto_61848 ) ) ( not ( = ?auto_61846 ?auto_61847 ) ) ( not ( = ?auto_61846 ?auto_61848 ) ) ( not ( = ?auto_61847 ?auto_61848 ) ) ( ON ?auto_61848 ?auto_61849 ) ( not ( = ?auto_61845 ?auto_61849 ) ) ( not ( = ?auto_61846 ?auto_61849 ) ) ( not ( = ?auto_61847 ?auto_61849 ) ) ( not ( = ?auto_61848 ?auto_61849 ) ) ( CLEAR ?auto_61846 ) ( ON ?auto_61847 ?auto_61848 ) ( CLEAR ?auto_61847 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61851 ) ( ON ?auto_61850 ?auto_61851 ) ( ON ?auto_61849 ?auto_61850 ) ( not ( = ?auto_61851 ?auto_61850 ) ) ( not ( = ?auto_61851 ?auto_61849 ) ) ( not ( = ?auto_61851 ?auto_61848 ) ) ( not ( = ?auto_61851 ?auto_61847 ) ) ( not ( = ?auto_61850 ?auto_61849 ) ) ( not ( = ?auto_61850 ?auto_61848 ) ) ( not ( = ?auto_61850 ?auto_61847 ) ) ( not ( = ?auto_61845 ?auto_61851 ) ) ( not ( = ?auto_61845 ?auto_61850 ) ) ( not ( = ?auto_61846 ?auto_61851 ) ) ( not ( = ?auto_61846 ?auto_61850 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61851 ?auto_61850 ?auto_61849 ?auto_61848 )
      ( MAKE-4PILE ?auto_61845 ?auto_61846 ?auto_61847 ?auto_61848 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61852 - BLOCK
      ?auto_61853 - BLOCK
      ?auto_61854 - BLOCK
      ?auto_61855 - BLOCK
    )
    :vars
    (
      ?auto_61857 - BLOCK
      ?auto_61856 - BLOCK
      ?auto_61858 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61852 ) ( not ( = ?auto_61852 ?auto_61853 ) ) ( not ( = ?auto_61852 ?auto_61854 ) ) ( not ( = ?auto_61852 ?auto_61855 ) ) ( not ( = ?auto_61853 ?auto_61854 ) ) ( not ( = ?auto_61853 ?auto_61855 ) ) ( not ( = ?auto_61854 ?auto_61855 ) ) ( ON ?auto_61855 ?auto_61857 ) ( not ( = ?auto_61852 ?auto_61857 ) ) ( not ( = ?auto_61853 ?auto_61857 ) ) ( not ( = ?auto_61854 ?auto_61857 ) ) ( not ( = ?auto_61855 ?auto_61857 ) ) ( ON ?auto_61854 ?auto_61855 ) ( CLEAR ?auto_61854 ) ( ON-TABLE ?auto_61856 ) ( ON ?auto_61858 ?auto_61856 ) ( ON ?auto_61857 ?auto_61858 ) ( not ( = ?auto_61856 ?auto_61858 ) ) ( not ( = ?auto_61856 ?auto_61857 ) ) ( not ( = ?auto_61856 ?auto_61855 ) ) ( not ( = ?auto_61856 ?auto_61854 ) ) ( not ( = ?auto_61858 ?auto_61857 ) ) ( not ( = ?auto_61858 ?auto_61855 ) ) ( not ( = ?auto_61858 ?auto_61854 ) ) ( not ( = ?auto_61852 ?auto_61856 ) ) ( not ( = ?auto_61852 ?auto_61858 ) ) ( not ( = ?auto_61853 ?auto_61856 ) ) ( not ( = ?auto_61853 ?auto_61858 ) ) ( HOLDING ?auto_61853 ) ( CLEAR ?auto_61852 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61852 ?auto_61853 )
      ( MAKE-4PILE ?auto_61852 ?auto_61853 ?auto_61854 ?auto_61855 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61859 - BLOCK
      ?auto_61860 - BLOCK
      ?auto_61861 - BLOCK
      ?auto_61862 - BLOCK
    )
    :vars
    (
      ?auto_61863 - BLOCK
      ?auto_61865 - BLOCK
      ?auto_61864 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61859 ) ( not ( = ?auto_61859 ?auto_61860 ) ) ( not ( = ?auto_61859 ?auto_61861 ) ) ( not ( = ?auto_61859 ?auto_61862 ) ) ( not ( = ?auto_61860 ?auto_61861 ) ) ( not ( = ?auto_61860 ?auto_61862 ) ) ( not ( = ?auto_61861 ?auto_61862 ) ) ( ON ?auto_61862 ?auto_61863 ) ( not ( = ?auto_61859 ?auto_61863 ) ) ( not ( = ?auto_61860 ?auto_61863 ) ) ( not ( = ?auto_61861 ?auto_61863 ) ) ( not ( = ?auto_61862 ?auto_61863 ) ) ( ON ?auto_61861 ?auto_61862 ) ( ON-TABLE ?auto_61865 ) ( ON ?auto_61864 ?auto_61865 ) ( ON ?auto_61863 ?auto_61864 ) ( not ( = ?auto_61865 ?auto_61864 ) ) ( not ( = ?auto_61865 ?auto_61863 ) ) ( not ( = ?auto_61865 ?auto_61862 ) ) ( not ( = ?auto_61865 ?auto_61861 ) ) ( not ( = ?auto_61864 ?auto_61863 ) ) ( not ( = ?auto_61864 ?auto_61862 ) ) ( not ( = ?auto_61864 ?auto_61861 ) ) ( not ( = ?auto_61859 ?auto_61865 ) ) ( not ( = ?auto_61859 ?auto_61864 ) ) ( not ( = ?auto_61860 ?auto_61865 ) ) ( not ( = ?auto_61860 ?auto_61864 ) ) ( CLEAR ?auto_61859 ) ( ON ?auto_61860 ?auto_61861 ) ( CLEAR ?auto_61860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61865 ?auto_61864 ?auto_61863 ?auto_61862 ?auto_61861 )
      ( MAKE-4PILE ?auto_61859 ?auto_61860 ?auto_61861 ?auto_61862 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61866 - BLOCK
      ?auto_61867 - BLOCK
      ?auto_61868 - BLOCK
      ?auto_61869 - BLOCK
    )
    :vars
    (
      ?auto_61870 - BLOCK
      ?auto_61871 - BLOCK
      ?auto_61872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61866 ?auto_61867 ) ) ( not ( = ?auto_61866 ?auto_61868 ) ) ( not ( = ?auto_61866 ?auto_61869 ) ) ( not ( = ?auto_61867 ?auto_61868 ) ) ( not ( = ?auto_61867 ?auto_61869 ) ) ( not ( = ?auto_61868 ?auto_61869 ) ) ( ON ?auto_61869 ?auto_61870 ) ( not ( = ?auto_61866 ?auto_61870 ) ) ( not ( = ?auto_61867 ?auto_61870 ) ) ( not ( = ?auto_61868 ?auto_61870 ) ) ( not ( = ?auto_61869 ?auto_61870 ) ) ( ON ?auto_61868 ?auto_61869 ) ( ON-TABLE ?auto_61871 ) ( ON ?auto_61872 ?auto_61871 ) ( ON ?auto_61870 ?auto_61872 ) ( not ( = ?auto_61871 ?auto_61872 ) ) ( not ( = ?auto_61871 ?auto_61870 ) ) ( not ( = ?auto_61871 ?auto_61869 ) ) ( not ( = ?auto_61871 ?auto_61868 ) ) ( not ( = ?auto_61872 ?auto_61870 ) ) ( not ( = ?auto_61872 ?auto_61869 ) ) ( not ( = ?auto_61872 ?auto_61868 ) ) ( not ( = ?auto_61866 ?auto_61871 ) ) ( not ( = ?auto_61866 ?auto_61872 ) ) ( not ( = ?auto_61867 ?auto_61871 ) ) ( not ( = ?auto_61867 ?auto_61872 ) ) ( ON ?auto_61867 ?auto_61868 ) ( CLEAR ?auto_61867 ) ( HOLDING ?auto_61866 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61866 )
      ( MAKE-4PILE ?auto_61866 ?auto_61867 ?auto_61868 ?auto_61869 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61873 - BLOCK
      ?auto_61874 - BLOCK
      ?auto_61875 - BLOCK
      ?auto_61876 - BLOCK
    )
    :vars
    (
      ?auto_61877 - BLOCK
      ?auto_61878 - BLOCK
      ?auto_61879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61873 ?auto_61874 ) ) ( not ( = ?auto_61873 ?auto_61875 ) ) ( not ( = ?auto_61873 ?auto_61876 ) ) ( not ( = ?auto_61874 ?auto_61875 ) ) ( not ( = ?auto_61874 ?auto_61876 ) ) ( not ( = ?auto_61875 ?auto_61876 ) ) ( ON ?auto_61876 ?auto_61877 ) ( not ( = ?auto_61873 ?auto_61877 ) ) ( not ( = ?auto_61874 ?auto_61877 ) ) ( not ( = ?auto_61875 ?auto_61877 ) ) ( not ( = ?auto_61876 ?auto_61877 ) ) ( ON ?auto_61875 ?auto_61876 ) ( ON-TABLE ?auto_61878 ) ( ON ?auto_61879 ?auto_61878 ) ( ON ?auto_61877 ?auto_61879 ) ( not ( = ?auto_61878 ?auto_61879 ) ) ( not ( = ?auto_61878 ?auto_61877 ) ) ( not ( = ?auto_61878 ?auto_61876 ) ) ( not ( = ?auto_61878 ?auto_61875 ) ) ( not ( = ?auto_61879 ?auto_61877 ) ) ( not ( = ?auto_61879 ?auto_61876 ) ) ( not ( = ?auto_61879 ?auto_61875 ) ) ( not ( = ?auto_61873 ?auto_61878 ) ) ( not ( = ?auto_61873 ?auto_61879 ) ) ( not ( = ?auto_61874 ?auto_61878 ) ) ( not ( = ?auto_61874 ?auto_61879 ) ) ( ON ?auto_61874 ?auto_61875 ) ( ON ?auto_61873 ?auto_61874 ) ( CLEAR ?auto_61873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61878 ?auto_61879 ?auto_61877 ?auto_61876 ?auto_61875 ?auto_61874 )
      ( MAKE-4PILE ?auto_61873 ?auto_61874 ?auto_61875 ?auto_61876 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61882 - BLOCK
      ?auto_61883 - BLOCK
    )
    :vars
    (
      ?auto_61884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61884 ?auto_61883 ) ( CLEAR ?auto_61884 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61882 ) ( ON ?auto_61883 ?auto_61882 ) ( not ( = ?auto_61882 ?auto_61883 ) ) ( not ( = ?auto_61882 ?auto_61884 ) ) ( not ( = ?auto_61883 ?auto_61884 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61884 ?auto_61883 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61885 - BLOCK
      ?auto_61886 - BLOCK
    )
    :vars
    (
      ?auto_61887 - BLOCK
      ?auto_61888 - BLOCK
      ?auto_61889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61887 ?auto_61886 ) ( CLEAR ?auto_61887 ) ( ON-TABLE ?auto_61885 ) ( ON ?auto_61886 ?auto_61885 ) ( not ( = ?auto_61885 ?auto_61886 ) ) ( not ( = ?auto_61885 ?auto_61887 ) ) ( not ( = ?auto_61886 ?auto_61887 ) ) ( HOLDING ?auto_61888 ) ( CLEAR ?auto_61889 ) ( not ( = ?auto_61885 ?auto_61888 ) ) ( not ( = ?auto_61885 ?auto_61889 ) ) ( not ( = ?auto_61886 ?auto_61888 ) ) ( not ( = ?auto_61886 ?auto_61889 ) ) ( not ( = ?auto_61887 ?auto_61888 ) ) ( not ( = ?auto_61887 ?auto_61889 ) ) ( not ( = ?auto_61888 ?auto_61889 ) ) )
    :subtasks
    ( ( !STACK ?auto_61888 ?auto_61889 )
      ( MAKE-2PILE ?auto_61885 ?auto_61886 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61890 - BLOCK
      ?auto_61891 - BLOCK
    )
    :vars
    (
      ?auto_61892 - BLOCK
      ?auto_61893 - BLOCK
      ?auto_61894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61892 ?auto_61891 ) ( ON-TABLE ?auto_61890 ) ( ON ?auto_61891 ?auto_61890 ) ( not ( = ?auto_61890 ?auto_61891 ) ) ( not ( = ?auto_61890 ?auto_61892 ) ) ( not ( = ?auto_61891 ?auto_61892 ) ) ( CLEAR ?auto_61893 ) ( not ( = ?auto_61890 ?auto_61894 ) ) ( not ( = ?auto_61890 ?auto_61893 ) ) ( not ( = ?auto_61891 ?auto_61894 ) ) ( not ( = ?auto_61891 ?auto_61893 ) ) ( not ( = ?auto_61892 ?auto_61894 ) ) ( not ( = ?auto_61892 ?auto_61893 ) ) ( not ( = ?auto_61894 ?auto_61893 ) ) ( ON ?auto_61894 ?auto_61892 ) ( CLEAR ?auto_61894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61890 ?auto_61891 ?auto_61892 )
      ( MAKE-2PILE ?auto_61890 ?auto_61891 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61895 - BLOCK
      ?auto_61896 - BLOCK
    )
    :vars
    (
      ?auto_61899 - BLOCK
      ?auto_61898 - BLOCK
      ?auto_61897 - BLOCK
      ?auto_61900 - BLOCK
      ?auto_61901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61899 ?auto_61896 ) ( ON-TABLE ?auto_61895 ) ( ON ?auto_61896 ?auto_61895 ) ( not ( = ?auto_61895 ?auto_61896 ) ) ( not ( = ?auto_61895 ?auto_61899 ) ) ( not ( = ?auto_61896 ?auto_61899 ) ) ( not ( = ?auto_61895 ?auto_61898 ) ) ( not ( = ?auto_61895 ?auto_61897 ) ) ( not ( = ?auto_61896 ?auto_61898 ) ) ( not ( = ?auto_61896 ?auto_61897 ) ) ( not ( = ?auto_61899 ?auto_61898 ) ) ( not ( = ?auto_61899 ?auto_61897 ) ) ( not ( = ?auto_61898 ?auto_61897 ) ) ( ON ?auto_61898 ?auto_61899 ) ( CLEAR ?auto_61898 ) ( HOLDING ?auto_61897 ) ( CLEAR ?auto_61900 ) ( ON-TABLE ?auto_61901 ) ( ON ?auto_61900 ?auto_61901 ) ( not ( = ?auto_61901 ?auto_61900 ) ) ( not ( = ?auto_61901 ?auto_61897 ) ) ( not ( = ?auto_61900 ?auto_61897 ) ) ( not ( = ?auto_61895 ?auto_61900 ) ) ( not ( = ?auto_61895 ?auto_61901 ) ) ( not ( = ?auto_61896 ?auto_61900 ) ) ( not ( = ?auto_61896 ?auto_61901 ) ) ( not ( = ?auto_61899 ?auto_61900 ) ) ( not ( = ?auto_61899 ?auto_61901 ) ) ( not ( = ?auto_61898 ?auto_61900 ) ) ( not ( = ?auto_61898 ?auto_61901 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61901 ?auto_61900 ?auto_61897 )
      ( MAKE-2PILE ?auto_61895 ?auto_61896 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61902 - BLOCK
      ?auto_61903 - BLOCK
    )
    :vars
    (
      ?auto_61905 - BLOCK
      ?auto_61908 - BLOCK
      ?auto_61907 - BLOCK
      ?auto_61904 - BLOCK
      ?auto_61906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61905 ?auto_61903 ) ( ON-TABLE ?auto_61902 ) ( ON ?auto_61903 ?auto_61902 ) ( not ( = ?auto_61902 ?auto_61903 ) ) ( not ( = ?auto_61902 ?auto_61905 ) ) ( not ( = ?auto_61903 ?auto_61905 ) ) ( not ( = ?auto_61902 ?auto_61908 ) ) ( not ( = ?auto_61902 ?auto_61907 ) ) ( not ( = ?auto_61903 ?auto_61908 ) ) ( not ( = ?auto_61903 ?auto_61907 ) ) ( not ( = ?auto_61905 ?auto_61908 ) ) ( not ( = ?auto_61905 ?auto_61907 ) ) ( not ( = ?auto_61908 ?auto_61907 ) ) ( ON ?auto_61908 ?auto_61905 ) ( CLEAR ?auto_61904 ) ( ON-TABLE ?auto_61906 ) ( ON ?auto_61904 ?auto_61906 ) ( not ( = ?auto_61906 ?auto_61904 ) ) ( not ( = ?auto_61906 ?auto_61907 ) ) ( not ( = ?auto_61904 ?auto_61907 ) ) ( not ( = ?auto_61902 ?auto_61904 ) ) ( not ( = ?auto_61902 ?auto_61906 ) ) ( not ( = ?auto_61903 ?auto_61904 ) ) ( not ( = ?auto_61903 ?auto_61906 ) ) ( not ( = ?auto_61905 ?auto_61904 ) ) ( not ( = ?auto_61905 ?auto_61906 ) ) ( not ( = ?auto_61908 ?auto_61904 ) ) ( not ( = ?auto_61908 ?auto_61906 ) ) ( ON ?auto_61907 ?auto_61908 ) ( CLEAR ?auto_61907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61902 ?auto_61903 ?auto_61905 ?auto_61908 )
      ( MAKE-2PILE ?auto_61902 ?auto_61903 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61909 - BLOCK
      ?auto_61910 - BLOCK
    )
    :vars
    (
      ?auto_61913 - BLOCK
      ?auto_61911 - BLOCK
      ?auto_61914 - BLOCK
      ?auto_61915 - BLOCK
      ?auto_61912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61913 ?auto_61910 ) ( ON-TABLE ?auto_61909 ) ( ON ?auto_61910 ?auto_61909 ) ( not ( = ?auto_61909 ?auto_61910 ) ) ( not ( = ?auto_61909 ?auto_61913 ) ) ( not ( = ?auto_61910 ?auto_61913 ) ) ( not ( = ?auto_61909 ?auto_61911 ) ) ( not ( = ?auto_61909 ?auto_61914 ) ) ( not ( = ?auto_61910 ?auto_61911 ) ) ( not ( = ?auto_61910 ?auto_61914 ) ) ( not ( = ?auto_61913 ?auto_61911 ) ) ( not ( = ?auto_61913 ?auto_61914 ) ) ( not ( = ?auto_61911 ?auto_61914 ) ) ( ON ?auto_61911 ?auto_61913 ) ( ON-TABLE ?auto_61915 ) ( not ( = ?auto_61915 ?auto_61912 ) ) ( not ( = ?auto_61915 ?auto_61914 ) ) ( not ( = ?auto_61912 ?auto_61914 ) ) ( not ( = ?auto_61909 ?auto_61912 ) ) ( not ( = ?auto_61909 ?auto_61915 ) ) ( not ( = ?auto_61910 ?auto_61912 ) ) ( not ( = ?auto_61910 ?auto_61915 ) ) ( not ( = ?auto_61913 ?auto_61912 ) ) ( not ( = ?auto_61913 ?auto_61915 ) ) ( not ( = ?auto_61911 ?auto_61912 ) ) ( not ( = ?auto_61911 ?auto_61915 ) ) ( ON ?auto_61914 ?auto_61911 ) ( CLEAR ?auto_61914 ) ( HOLDING ?auto_61912 ) ( CLEAR ?auto_61915 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61915 ?auto_61912 )
      ( MAKE-2PILE ?auto_61909 ?auto_61910 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62687 - BLOCK
      ?auto_62688 - BLOCK
    )
    :vars
    (
      ?auto_62691 - BLOCK
      ?auto_62690 - BLOCK
      ?auto_62689 - BLOCK
      ?auto_62692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62691 ?auto_62688 ) ( ON-TABLE ?auto_62687 ) ( ON ?auto_62688 ?auto_62687 ) ( not ( = ?auto_62687 ?auto_62688 ) ) ( not ( = ?auto_62687 ?auto_62691 ) ) ( not ( = ?auto_62688 ?auto_62691 ) ) ( not ( = ?auto_62687 ?auto_62690 ) ) ( not ( = ?auto_62687 ?auto_62689 ) ) ( not ( = ?auto_62688 ?auto_62690 ) ) ( not ( = ?auto_62688 ?auto_62689 ) ) ( not ( = ?auto_62691 ?auto_62690 ) ) ( not ( = ?auto_62691 ?auto_62689 ) ) ( not ( = ?auto_62690 ?auto_62689 ) ) ( ON ?auto_62690 ?auto_62691 ) ( not ( = ?auto_62692 ?auto_62689 ) ) ( not ( = ?auto_62687 ?auto_62692 ) ) ( not ( = ?auto_62688 ?auto_62692 ) ) ( not ( = ?auto_62691 ?auto_62692 ) ) ( not ( = ?auto_62690 ?auto_62692 ) ) ( ON ?auto_62689 ?auto_62690 ) ( ON ?auto_62692 ?auto_62689 ) ( CLEAR ?auto_62692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62687 ?auto_62688 ?auto_62691 ?auto_62690 ?auto_62689 )
      ( MAKE-2PILE ?auto_62687 ?auto_62688 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61923 - BLOCK
      ?auto_61924 - BLOCK
    )
    :vars
    (
      ?auto_61929 - BLOCK
      ?auto_61928 - BLOCK
      ?auto_61925 - BLOCK
      ?auto_61927 - BLOCK
      ?auto_61926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61929 ?auto_61924 ) ( ON-TABLE ?auto_61923 ) ( ON ?auto_61924 ?auto_61923 ) ( not ( = ?auto_61923 ?auto_61924 ) ) ( not ( = ?auto_61923 ?auto_61929 ) ) ( not ( = ?auto_61924 ?auto_61929 ) ) ( not ( = ?auto_61923 ?auto_61928 ) ) ( not ( = ?auto_61923 ?auto_61925 ) ) ( not ( = ?auto_61924 ?auto_61928 ) ) ( not ( = ?auto_61924 ?auto_61925 ) ) ( not ( = ?auto_61929 ?auto_61928 ) ) ( not ( = ?auto_61929 ?auto_61925 ) ) ( not ( = ?auto_61928 ?auto_61925 ) ) ( ON ?auto_61928 ?auto_61929 ) ( not ( = ?auto_61927 ?auto_61926 ) ) ( not ( = ?auto_61927 ?auto_61925 ) ) ( not ( = ?auto_61926 ?auto_61925 ) ) ( not ( = ?auto_61923 ?auto_61926 ) ) ( not ( = ?auto_61923 ?auto_61927 ) ) ( not ( = ?auto_61924 ?auto_61926 ) ) ( not ( = ?auto_61924 ?auto_61927 ) ) ( not ( = ?auto_61929 ?auto_61926 ) ) ( not ( = ?auto_61929 ?auto_61927 ) ) ( not ( = ?auto_61928 ?auto_61926 ) ) ( not ( = ?auto_61928 ?auto_61927 ) ) ( ON ?auto_61925 ?auto_61928 ) ( ON ?auto_61926 ?auto_61925 ) ( CLEAR ?auto_61926 ) ( HOLDING ?auto_61927 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61927 )
      ( MAKE-2PILE ?auto_61923 ?auto_61924 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61930 - BLOCK
      ?auto_61931 - BLOCK
    )
    :vars
    (
      ?auto_61932 - BLOCK
      ?auto_61935 - BLOCK
      ?auto_61936 - BLOCK
      ?auto_61934 - BLOCK
      ?auto_61933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61932 ?auto_61931 ) ( ON-TABLE ?auto_61930 ) ( ON ?auto_61931 ?auto_61930 ) ( not ( = ?auto_61930 ?auto_61931 ) ) ( not ( = ?auto_61930 ?auto_61932 ) ) ( not ( = ?auto_61931 ?auto_61932 ) ) ( not ( = ?auto_61930 ?auto_61935 ) ) ( not ( = ?auto_61930 ?auto_61936 ) ) ( not ( = ?auto_61931 ?auto_61935 ) ) ( not ( = ?auto_61931 ?auto_61936 ) ) ( not ( = ?auto_61932 ?auto_61935 ) ) ( not ( = ?auto_61932 ?auto_61936 ) ) ( not ( = ?auto_61935 ?auto_61936 ) ) ( ON ?auto_61935 ?auto_61932 ) ( not ( = ?auto_61934 ?auto_61933 ) ) ( not ( = ?auto_61934 ?auto_61936 ) ) ( not ( = ?auto_61933 ?auto_61936 ) ) ( not ( = ?auto_61930 ?auto_61933 ) ) ( not ( = ?auto_61930 ?auto_61934 ) ) ( not ( = ?auto_61931 ?auto_61933 ) ) ( not ( = ?auto_61931 ?auto_61934 ) ) ( not ( = ?auto_61932 ?auto_61933 ) ) ( not ( = ?auto_61932 ?auto_61934 ) ) ( not ( = ?auto_61935 ?auto_61933 ) ) ( not ( = ?auto_61935 ?auto_61934 ) ) ( ON ?auto_61936 ?auto_61935 ) ( ON ?auto_61933 ?auto_61936 ) ( ON ?auto_61934 ?auto_61933 ) ( CLEAR ?auto_61934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61930 ?auto_61931 ?auto_61932 ?auto_61935 ?auto_61936 ?auto_61933 )
      ( MAKE-2PILE ?auto_61930 ?auto_61931 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61942 - BLOCK
      ?auto_61943 - BLOCK
      ?auto_61944 - BLOCK
      ?auto_61945 - BLOCK
      ?auto_61946 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_61946 ) ( CLEAR ?auto_61945 ) ( ON-TABLE ?auto_61942 ) ( ON ?auto_61943 ?auto_61942 ) ( ON ?auto_61944 ?auto_61943 ) ( ON ?auto_61945 ?auto_61944 ) ( not ( = ?auto_61942 ?auto_61943 ) ) ( not ( = ?auto_61942 ?auto_61944 ) ) ( not ( = ?auto_61942 ?auto_61945 ) ) ( not ( = ?auto_61942 ?auto_61946 ) ) ( not ( = ?auto_61943 ?auto_61944 ) ) ( not ( = ?auto_61943 ?auto_61945 ) ) ( not ( = ?auto_61943 ?auto_61946 ) ) ( not ( = ?auto_61944 ?auto_61945 ) ) ( not ( = ?auto_61944 ?auto_61946 ) ) ( not ( = ?auto_61945 ?auto_61946 ) ) )
    :subtasks
    ( ( !STACK ?auto_61946 ?auto_61945 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61947 - BLOCK
      ?auto_61948 - BLOCK
      ?auto_61949 - BLOCK
      ?auto_61950 - BLOCK
      ?auto_61951 - BLOCK
    )
    :vars
    (
      ?auto_61952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61950 ) ( ON-TABLE ?auto_61947 ) ( ON ?auto_61948 ?auto_61947 ) ( ON ?auto_61949 ?auto_61948 ) ( ON ?auto_61950 ?auto_61949 ) ( not ( = ?auto_61947 ?auto_61948 ) ) ( not ( = ?auto_61947 ?auto_61949 ) ) ( not ( = ?auto_61947 ?auto_61950 ) ) ( not ( = ?auto_61947 ?auto_61951 ) ) ( not ( = ?auto_61948 ?auto_61949 ) ) ( not ( = ?auto_61948 ?auto_61950 ) ) ( not ( = ?auto_61948 ?auto_61951 ) ) ( not ( = ?auto_61949 ?auto_61950 ) ) ( not ( = ?auto_61949 ?auto_61951 ) ) ( not ( = ?auto_61950 ?auto_61951 ) ) ( ON ?auto_61951 ?auto_61952 ) ( CLEAR ?auto_61951 ) ( HAND-EMPTY ) ( not ( = ?auto_61947 ?auto_61952 ) ) ( not ( = ?auto_61948 ?auto_61952 ) ) ( not ( = ?auto_61949 ?auto_61952 ) ) ( not ( = ?auto_61950 ?auto_61952 ) ) ( not ( = ?auto_61951 ?auto_61952 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61951 ?auto_61952 )
      ( MAKE-5PILE ?auto_61947 ?auto_61948 ?auto_61949 ?auto_61950 ?auto_61951 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61953 - BLOCK
      ?auto_61954 - BLOCK
      ?auto_61955 - BLOCK
      ?auto_61956 - BLOCK
      ?auto_61957 - BLOCK
    )
    :vars
    (
      ?auto_61958 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61953 ) ( ON ?auto_61954 ?auto_61953 ) ( ON ?auto_61955 ?auto_61954 ) ( not ( = ?auto_61953 ?auto_61954 ) ) ( not ( = ?auto_61953 ?auto_61955 ) ) ( not ( = ?auto_61953 ?auto_61956 ) ) ( not ( = ?auto_61953 ?auto_61957 ) ) ( not ( = ?auto_61954 ?auto_61955 ) ) ( not ( = ?auto_61954 ?auto_61956 ) ) ( not ( = ?auto_61954 ?auto_61957 ) ) ( not ( = ?auto_61955 ?auto_61956 ) ) ( not ( = ?auto_61955 ?auto_61957 ) ) ( not ( = ?auto_61956 ?auto_61957 ) ) ( ON ?auto_61957 ?auto_61958 ) ( CLEAR ?auto_61957 ) ( not ( = ?auto_61953 ?auto_61958 ) ) ( not ( = ?auto_61954 ?auto_61958 ) ) ( not ( = ?auto_61955 ?auto_61958 ) ) ( not ( = ?auto_61956 ?auto_61958 ) ) ( not ( = ?auto_61957 ?auto_61958 ) ) ( HOLDING ?auto_61956 ) ( CLEAR ?auto_61955 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61953 ?auto_61954 ?auto_61955 ?auto_61956 )
      ( MAKE-5PILE ?auto_61953 ?auto_61954 ?auto_61955 ?auto_61956 ?auto_61957 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61959 - BLOCK
      ?auto_61960 - BLOCK
      ?auto_61961 - BLOCK
      ?auto_61962 - BLOCK
      ?auto_61963 - BLOCK
    )
    :vars
    (
      ?auto_61964 - BLOCK
      ?auto_61965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61959 ) ( ON ?auto_61960 ?auto_61959 ) ( ON ?auto_61961 ?auto_61960 ) ( not ( = ?auto_61959 ?auto_61960 ) ) ( not ( = ?auto_61959 ?auto_61961 ) ) ( not ( = ?auto_61959 ?auto_61962 ) ) ( not ( = ?auto_61959 ?auto_61963 ) ) ( not ( = ?auto_61960 ?auto_61961 ) ) ( not ( = ?auto_61960 ?auto_61962 ) ) ( not ( = ?auto_61960 ?auto_61963 ) ) ( not ( = ?auto_61961 ?auto_61962 ) ) ( not ( = ?auto_61961 ?auto_61963 ) ) ( not ( = ?auto_61962 ?auto_61963 ) ) ( ON ?auto_61963 ?auto_61964 ) ( not ( = ?auto_61959 ?auto_61964 ) ) ( not ( = ?auto_61960 ?auto_61964 ) ) ( not ( = ?auto_61961 ?auto_61964 ) ) ( not ( = ?auto_61962 ?auto_61964 ) ) ( not ( = ?auto_61963 ?auto_61964 ) ) ( CLEAR ?auto_61961 ) ( ON ?auto_61962 ?auto_61963 ) ( CLEAR ?auto_61962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61965 ) ( ON ?auto_61964 ?auto_61965 ) ( not ( = ?auto_61965 ?auto_61964 ) ) ( not ( = ?auto_61965 ?auto_61963 ) ) ( not ( = ?auto_61965 ?auto_61962 ) ) ( not ( = ?auto_61959 ?auto_61965 ) ) ( not ( = ?auto_61960 ?auto_61965 ) ) ( not ( = ?auto_61961 ?auto_61965 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61965 ?auto_61964 ?auto_61963 )
      ( MAKE-5PILE ?auto_61959 ?auto_61960 ?auto_61961 ?auto_61962 ?auto_61963 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61966 - BLOCK
      ?auto_61967 - BLOCK
      ?auto_61968 - BLOCK
      ?auto_61969 - BLOCK
      ?auto_61970 - BLOCK
    )
    :vars
    (
      ?auto_61972 - BLOCK
      ?auto_61971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61966 ) ( ON ?auto_61967 ?auto_61966 ) ( not ( = ?auto_61966 ?auto_61967 ) ) ( not ( = ?auto_61966 ?auto_61968 ) ) ( not ( = ?auto_61966 ?auto_61969 ) ) ( not ( = ?auto_61966 ?auto_61970 ) ) ( not ( = ?auto_61967 ?auto_61968 ) ) ( not ( = ?auto_61967 ?auto_61969 ) ) ( not ( = ?auto_61967 ?auto_61970 ) ) ( not ( = ?auto_61968 ?auto_61969 ) ) ( not ( = ?auto_61968 ?auto_61970 ) ) ( not ( = ?auto_61969 ?auto_61970 ) ) ( ON ?auto_61970 ?auto_61972 ) ( not ( = ?auto_61966 ?auto_61972 ) ) ( not ( = ?auto_61967 ?auto_61972 ) ) ( not ( = ?auto_61968 ?auto_61972 ) ) ( not ( = ?auto_61969 ?auto_61972 ) ) ( not ( = ?auto_61970 ?auto_61972 ) ) ( ON ?auto_61969 ?auto_61970 ) ( CLEAR ?auto_61969 ) ( ON-TABLE ?auto_61971 ) ( ON ?auto_61972 ?auto_61971 ) ( not ( = ?auto_61971 ?auto_61972 ) ) ( not ( = ?auto_61971 ?auto_61970 ) ) ( not ( = ?auto_61971 ?auto_61969 ) ) ( not ( = ?auto_61966 ?auto_61971 ) ) ( not ( = ?auto_61967 ?auto_61971 ) ) ( not ( = ?auto_61968 ?auto_61971 ) ) ( HOLDING ?auto_61968 ) ( CLEAR ?auto_61967 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61966 ?auto_61967 ?auto_61968 )
      ( MAKE-5PILE ?auto_61966 ?auto_61967 ?auto_61968 ?auto_61969 ?auto_61970 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61973 - BLOCK
      ?auto_61974 - BLOCK
      ?auto_61975 - BLOCK
      ?auto_61976 - BLOCK
      ?auto_61977 - BLOCK
    )
    :vars
    (
      ?auto_61979 - BLOCK
      ?auto_61978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61973 ) ( ON ?auto_61974 ?auto_61973 ) ( not ( = ?auto_61973 ?auto_61974 ) ) ( not ( = ?auto_61973 ?auto_61975 ) ) ( not ( = ?auto_61973 ?auto_61976 ) ) ( not ( = ?auto_61973 ?auto_61977 ) ) ( not ( = ?auto_61974 ?auto_61975 ) ) ( not ( = ?auto_61974 ?auto_61976 ) ) ( not ( = ?auto_61974 ?auto_61977 ) ) ( not ( = ?auto_61975 ?auto_61976 ) ) ( not ( = ?auto_61975 ?auto_61977 ) ) ( not ( = ?auto_61976 ?auto_61977 ) ) ( ON ?auto_61977 ?auto_61979 ) ( not ( = ?auto_61973 ?auto_61979 ) ) ( not ( = ?auto_61974 ?auto_61979 ) ) ( not ( = ?auto_61975 ?auto_61979 ) ) ( not ( = ?auto_61976 ?auto_61979 ) ) ( not ( = ?auto_61977 ?auto_61979 ) ) ( ON ?auto_61976 ?auto_61977 ) ( ON-TABLE ?auto_61978 ) ( ON ?auto_61979 ?auto_61978 ) ( not ( = ?auto_61978 ?auto_61979 ) ) ( not ( = ?auto_61978 ?auto_61977 ) ) ( not ( = ?auto_61978 ?auto_61976 ) ) ( not ( = ?auto_61973 ?auto_61978 ) ) ( not ( = ?auto_61974 ?auto_61978 ) ) ( not ( = ?auto_61975 ?auto_61978 ) ) ( CLEAR ?auto_61974 ) ( ON ?auto_61975 ?auto_61976 ) ( CLEAR ?auto_61975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61978 ?auto_61979 ?auto_61977 ?auto_61976 )
      ( MAKE-5PILE ?auto_61973 ?auto_61974 ?auto_61975 ?auto_61976 ?auto_61977 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61980 - BLOCK
      ?auto_61981 - BLOCK
      ?auto_61982 - BLOCK
      ?auto_61983 - BLOCK
      ?auto_61984 - BLOCK
    )
    :vars
    (
      ?auto_61986 - BLOCK
      ?auto_61985 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61980 ) ( not ( = ?auto_61980 ?auto_61981 ) ) ( not ( = ?auto_61980 ?auto_61982 ) ) ( not ( = ?auto_61980 ?auto_61983 ) ) ( not ( = ?auto_61980 ?auto_61984 ) ) ( not ( = ?auto_61981 ?auto_61982 ) ) ( not ( = ?auto_61981 ?auto_61983 ) ) ( not ( = ?auto_61981 ?auto_61984 ) ) ( not ( = ?auto_61982 ?auto_61983 ) ) ( not ( = ?auto_61982 ?auto_61984 ) ) ( not ( = ?auto_61983 ?auto_61984 ) ) ( ON ?auto_61984 ?auto_61986 ) ( not ( = ?auto_61980 ?auto_61986 ) ) ( not ( = ?auto_61981 ?auto_61986 ) ) ( not ( = ?auto_61982 ?auto_61986 ) ) ( not ( = ?auto_61983 ?auto_61986 ) ) ( not ( = ?auto_61984 ?auto_61986 ) ) ( ON ?auto_61983 ?auto_61984 ) ( ON-TABLE ?auto_61985 ) ( ON ?auto_61986 ?auto_61985 ) ( not ( = ?auto_61985 ?auto_61986 ) ) ( not ( = ?auto_61985 ?auto_61984 ) ) ( not ( = ?auto_61985 ?auto_61983 ) ) ( not ( = ?auto_61980 ?auto_61985 ) ) ( not ( = ?auto_61981 ?auto_61985 ) ) ( not ( = ?auto_61982 ?auto_61985 ) ) ( ON ?auto_61982 ?auto_61983 ) ( CLEAR ?auto_61982 ) ( HOLDING ?auto_61981 ) ( CLEAR ?auto_61980 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61980 ?auto_61981 )
      ( MAKE-5PILE ?auto_61980 ?auto_61981 ?auto_61982 ?auto_61983 ?auto_61984 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61987 - BLOCK
      ?auto_61988 - BLOCK
      ?auto_61989 - BLOCK
      ?auto_61990 - BLOCK
      ?auto_61991 - BLOCK
    )
    :vars
    (
      ?auto_61992 - BLOCK
      ?auto_61993 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61987 ) ( not ( = ?auto_61987 ?auto_61988 ) ) ( not ( = ?auto_61987 ?auto_61989 ) ) ( not ( = ?auto_61987 ?auto_61990 ) ) ( not ( = ?auto_61987 ?auto_61991 ) ) ( not ( = ?auto_61988 ?auto_61989 ) ) ( not ( = ?auto_61988 ?auto_61990 ) ) ( not ( = ?auto_61988 ?auto_61991 ) ) ( not ( = ?auto_61989 ?auto_61990 ) ) ( not ( = ?auto_61989 ?auto_61991 ) ) ( not ( = ?auto_61990 ?auto_61991 ) ) ( ON ?auto_61991 ?auto_61992 ) ( not ( = ?auto_61987 ?auto_61992 ) ) ( not ( = ?auto_61988 ?auto_61992 ) ) ( not ( = ?auto_61989 ?auto_61992 ) ) ( not ( = ?auto_61990 ?auto_61992 ) ) ( not ( = ?auto_61991 ?auto_61992 ) ) ( ON ?auto_61990 ?auto_61991 ) ( ON-TABLE ?auto_61993 ) ( ON ?auto_61992 ?auto_61993 ) ( not ( = ?auto_61993 ?auto_61992 ) ) ( not ( = ?auto_61993 ?auto_61991 ) ) ( not ( = ?auto_61993 ?auto_61990 ) ) ( not ( = ?auto_61987 ?auto_61993 ) ) ( not ( = ?auto_61988 ?auto_61993 ) ) ( not ( = ?auto_61989 ?auto_61993 ) ) ( ON ?auto_61989 ?auto_61990 ) ( CLEAR ?auto_61987 ) ( ON ?auto_61988 ?auto_61989 ) ( CLEAR ?auto_61988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61993 ?auto_61992 ?auto_61991 ?auto_61990 ?auto_61989 )
      ( MAKE-5PILE ?auto_61987 ?auto_61988 ?auto_61989 ?auto_61990 ?auto_61991 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61994 - BLOCK
      ?auto_61995 - BLOCK
      ?auto_61996 - BLOCK
      ?auto_61997 - BLOCK
      ?auto_61998 - BLOCK
    )
    :vars
    (
      ?auto_62000 - BLOCK
      ?auto_61999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61994 ?auto_61995 ) ) ( not ( = ?auto_61994 ?auto_61996 ) ) ( not ( = ?auto_61994 ?auto_61997 ) ) ( not ( = ?auto_61994 ?auto_61998 ) ) ( not ( = ?auto_61995 ?auto_61996 ) ) ( not ( = ?auto_61995 ?auto_61997 ) ) ( not ( = ?auto_61995 ?auto_61998 ) ) ( not ( = ?auto_61996 ?auto_61997 ) ) ( not ( = ?auto_61996 ?auto_61998 ) ) ( not ( = ?auto_61997 ?auto_61998 ) ) ( ON ?auto_61998 ?auto_62000 ) ( not ( = ?auto_61994 ?auto_62000 ) ) ( not ( = ?auto_61995 ?auto_62000 ) ) ( not ( = ?auto_61996 ?auto_62000 ) ) ( not ( = ?auto_61997 ?auto_62000 ) ) ( not ( = ?auto_61998 ?auto_62000 ) ) ( ON ?auto_61997 ?auto_61998 ) ( ON-TABLE ?auto_61999 ) ( ON ?auto_62000 ?auto_61999 ) ( not ( = ?auto_61999 ?auto_62000 ) ) ( not ( = ?auto_61999 ?auto_61998 ) ) ( not ( = ?auto_61999 ?auto_61997 ) ) ( not ( = ?auto_61994 ?auto_61999 ) ) ( not ( = ?auto_61995 ?auto_61999 ) ) ( not ( = ?auto_61996 ?auto_61999 ) ) ( ON ?auto_61996 ?auto_61997 ) ( ON ?auto_61995 ?auto_61996 ) ( CLEAR ?auto_61995 ) ( HOLDING ?auto_61994 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61994 )
      ( MAKE-5PILE ?auto_61994 ?auto_61995 ?auto_61996 ?auto_61997 ?auto_61998 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62001 - BLOCK
      ?auto_62002 - BLOCK
      ?auto_62003 - BLOCK
      ?auto_62004 - BLOCK
      ?auto_62005 - BLOCK
    )
    :vars
    (
      ?auto_62007 - BLOCK
      ?auto_62006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62001 ?auto_62002 ) ) ( not ( = ?auto_62001 ?auto_62003 ) ) ( not ( = ?auto_62001 ?auto_62004 ) ) ( not ( = ?auto_62001 ?auto_62005 ) ) ( not ( = ?auto_62002 ?auto_62003 ) ) ( not ( = ?auto_62002 ?auto_62004 ) ) ( not ( = ?auto_62002 ?auto_62005 ) ) ( not ( = ?auto_62003 ?auto_62004 ) ) ( not ( = ?auto_62003 ?auto_62005 ) ) ( not ( = ?auto_62004 ?auto_62005 ) ) ( ON ?auto_62005 ?auto_62007 ) ( not ( = ?auto_62001 ?auto_62007 ) ) ( not ( = ?auto_62002 ?auto_62007 ) ) ( not ( = ?auto_62003 ?auto_62007 ) ) ( not ( = ?auto_62004 ?auto_62007 ) ) ( not ( = ?auto_62005 ?auto_62007 ) ) ( ON ?auto_62004 ?auto_62005 ) ( ON-TABLE ?auto_62006 ) ( ON ?auto_62007 ?auto_62006 ) ( not ( = ?auto_62006 ?auto_62007 ) ) ( not ( = ?auto_62006 ?auto_62005 ) ) ( not ( = ?auto_62006 ?auto_62004 ) ) ( not ( = ?auto_62001 ?auto_62006 ) ) ( not ( = ?auto_62002 ?auto_62006 ) ) ( not ( = ?auto_62003 ?auto_62006 ) ) ( ON ?auto_62003 ?auto_62004 ) ( ON ?auto_62002 ?auto_62003 ) ( ON ?auto_62001 ?auto_62002 ) ( CLEAR ?auto_62001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62006 ?auto_62007 ?auto_62005 ?auto_62004 ?auto_62003 ?auto_62002 )
      ( MAKE-5PILE ?auto_62001 ?auto_62002 ?auto_62003 ?auto_62004 ?auto_62005 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62009 - BLOCK
    )
    :vars
    (
      ?auto_62010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62010 ?auto_62009 ) ( CLEAR ?auto_62010 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62009 ) ( not ( = ?auto_62009 ?auto_62010 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62010 ?auto_62009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62011 - BLOCK
    )
    :vars
    (
      ?auto_62012 - BLOCK
      ?auto_62013 - BLOCK
      ?auto_62014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62012 ?auto_62011 ) ( CLEAR ?auto_62012 ) ( ON-TABLE ?auto_62011 ) ( not ( = ?auto_62011 ?auto_62012 ) ) ( HOLDING ?auto_62013 ) ( CLEAR ?auto_62014 ) ( not ( = ?auto_62011 ?auto_62013 ) ) ( not ( = ?auto_62011 ?auto_62014 ) ) ( not ( = ?auto_62012 ?auto_62013 ) ) ( not ( = ?auto_62012 ?auto_62014 ) ) ( not ( = ?auto_62013 ?auto_62014 ) ) )
    :subtasks
    ( ( !STACK ?auto_62013 ?auto_62014 )
      ( MAKE-1PILE ?auto_62011 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62015 - BLOCK
    )
    :vars
    (
      ?auto_62017 - BLOCK
      ?auto_62018 - BLOCK
      ?auto_62016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62017 ?auto_62015 ) ( ON-TABLE ?auto_62015 ) ( not ( = ?auto_62015 ?auto_62017 ) ) ( CLEAR ?auto_62018 ) ( not ( = ?auto_62015 ?auto_62016 ) ) ( not ( = ?auto_62015 ?auto_62018 ) ) ( not ( = ?auto_62017 ?auto_62016 ) ) ( not ( = ?auto_62017 ?auto_62018 ) ) ( not ( = ?auto_62016 ?auto_62018 ) ) ( ON ?auto_62016 ?auto_62017 ) ( CLEAR ?auto_62016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62015 ?auto_62017 )
      ( MAKE-1PILE ?auto_62015 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62019 - BLOCK
    )
    :vars
    (
      ?auto_62022 - BLOCK
      ?auto_62021 - BLOCK
      ?auto_62020 - BLOCK
      ?auto_62024 - BLOCK
      ?auto_62023 - BLOCK
      ?auto_62025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62022 ?auto_62019 ) ( ON-TABLE ?auto_62019 ) ( not ( = ?auto_62019 ?auto_62022 ) ) ( not ( = ?auto_62019 ?auto_62021 ) ) ( not ( = ?auto_62019 ?auto_62020 ) ) ( not ( = ?auto_62022 ?auto_62021 ) ) ( not ( = ?auto_62022 ?auto_62020 ) ) ( not ( = ?auto_62021 ?auto_62020 ) ) ( ON ?auto_62021 ?auto_62022 ) ( CLEAR ?auto_62021 ) ( HOLDING ?auto_62020 ) ( CLEAR ?auto_62024 ) ( ON-TABLE ?auto_62023 ) ( ON ?auto_62025 ?auto_62023 ) ( ON ?auto_62024 ?auto_62025 ) ( not ( = ?auto_62023 ?auto_62025 ) ) ( not ( = ?auto_62023 ?auto_62024 ) ) ( not ( = ?auto_62023 ?auto_62020 ) ) ( not ( = ?auto_62025 ?auto_62024 ) ) ( not ( = ?auto_62025 ?auto_62020 ) ) ( not ( = ?auto_62024 ?auto_62020 ) ) ( not ( = ?auto_62019 ?auto_62024 ) ) ( not ( = ?auto_62019 ?auto_62023 ) ) ( not ( = ?auto_62019 ?auto_62025 ) ) ( not ( = ?auto_62022 ?auto_62024 ) ) ( not ( = ?auto_62022 ?auto_62023 ) ) ( not ( = ?auto_62022 ?auto_62025 ) ) ( not ( = ?auto_62021 ?auto_62024 ) ) ( not ( = ?auto_62021 ?auto_62023 ) ) ( not ( = ?auto_62021 ?auto_62025 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62023 ?auto_62025 ?auto_62024 ?auto_62020 )
      ( MAKE-1PILE ?auto_62019 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62026 - BLOCK
    )
    :vars
    (
      ?auto_62027 - BLOCK
      ?auto_62032 - BLOCK
      ?auto_62029 - BLOCK
      ?auto_62030 - BLOCK
      ?auto_62028 - BLOCK
      ?auto_62031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62027 ?auto_62026 ) ( ON-TABLE ?auto_62026 ) ( not ( = ?auto_62026 ?auto_62027 ) ) ( not ( = ?auto_62026 ?auto_62032 ) ) ( not ( = ?auto_62026 ?auto_62029 ) ) ( not ( = ?auto_62027 ?auto_62032 ) ) ( not ( = ?auto_62027 ?auto_62029 ) ) ( not ( = ?auto_62032 ?auto_62029 ) ) ( ON ?auto_62032 ?auto_62027 ) ( CLEAR ?auto_62030 ) ( ON-TABLE ?auto_62028 ) ( ON ?auto_62031 ?auto_62028 ) ( ON ?auto_62030 ?auto_62031 ) ( not ( = ?auto_62028 ?auto_62031 ) ) ( not ( = ?auto_62028 ?auto_62030 ) ) ( not ( = ?auto_62028 ?auto_62029 ) ) ( not ( = ?auto_62031 ?auto_62030 ) ) ( not ( = ?auto_62031 ?auto_62029 ) ) ( not ( = ?auto_62030 ?auto_62029 ) ) ( not ( = ?auto_62026 ?auto_62030 ) ) ( not ( = ?auto_62026 ?auto_62028 ) ) ( not ( = ?auto_62026 ?auto_62031 ) ) ( not ( = ?auto_62027 ?auto_62030 ) ) ( not ( = ?auto_62027 ?auto_62028 ) ) ( not ( = ?auto_62027 ?auto_62031 ) ) ( not ( = ?auto_62032 ?auto_62030 ) ) ( not ( = ?auto_62032 ?auto_62028 ) ) ( not ( = ?auto_62032 ?auto_62031 ) ) ( ON ?auto_62029 ?auto_62032 ) ( CLEAR ?auto_62029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62026 ?auto_62027 ?auto_62032 )
      ( MAKE-1PILE ?auto_62026 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62033 - BLOCK
    )
    :vars
    (
      ?auto_62039 - BLOCK
      ?auto_62038 - BLOCK
      ?auto_62036 - BLOCK
      ?auto_62034 - BLOCK
      ?auto_62037 - BLOCK
      ?auto_62035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62039 ?auto_62033 ) ( ON-TABLE ?auto_62033 ) ( not ( = ?auto_62033 ?auto_62039 ) ) ( not ( = ?auto_62033 ?auto_62038 ) ) ( not ( = ?auto_62033 ?auto_62036 ) ) ( not ( = ?auto_62039 ?auto_62038 ) ) ( not ( = ?auto_62039 ?auto_62036 ) ) ( not ( = ?auto_62038 ?auto_62036 ) ) ( ON ?auto_62038 ?auto_62039 ) ( ON-TABLE ?auto_62034 ) ( ON ?auto_62037 ?auto_62034 ) ( not ( = ?auto_62034 ?auto_62037 ) ) ( not ( = ?auto_62034 ?auto_62035 ) ) ( not ( = ?auto_62034 ?auto_62036 ) ) ( not ( = ?auto_62037 ?auto_62035 ) ) ( not ( = ?auto_62037 ?auto_62036 ) ) ( not ( = ?auto_62035 ?auto_62036 ) ) ( not ( = ?auto_62033 ?auto_62035 ) ) ( not ( = ?auto_62033 ?auto_62034 ) ) ( not ( = ?auto_62033 ?auto_62037 ) ) ( not ( = ?auto_62039 ?auto_62035 ) ) ( not ( = ?auto_62039 ?auto_62034 ) ) ( not ( = ?auto_62039 ?auto_62037 ) ) ( not ( = ?auto_62038 ?auto_62035 ) ) ( not ( = ?auto_62038 ?auto_62034 ) ) ( not ( = ?auto_62038 ?auto_62037 ) ) ( ON ?auto_62036 ?auto_62038 ) ( CLEAR ?auto_62036 ) ( HOLDING ?auto_62035 ) ( CLEAR ?auto_62037 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62034 ?auto_62037 ?auto_62035 )
      ( MAKE-1PILE ?auto_62033 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62040 - BLOCK
    )
    :vars
    (
      ?auto_62043 - BLOCK
      ?auto_62041 - BLOCK
      ?auto_62044 - BLOCK
      ?auto_62046 - BLOCK
      ?auto_62042 - BLOCK
      ?auto_62045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62043 ?auto_62040 ) ( ON-TABLE ?auto_62040 ) ( not ( = ?auto_62040 ?auto_62043 ) ) ( not ( = ?auto_62040 ?auto_62041 ) ) ( not ( = ?auto_62040 ?auto_62044 ) ) ( not ( = ?auto_62043 ?auto_62041 ) ) ( not ( = ?auto_62043 ?auto_62044 ) ) ( not ( = ?auto_62041 ?auto_62044 ) ) ( ON ?auto_62041 ?auto_62043 ) ( ON-TABLE ?auto_62046 ) ( ON ?auto_62042 ?auto_62046 ) ( not ( = ?auto_62046 ?auto_62042 ) ) ( not ( = ?auto_62046 ?auto_62045 ) ) ( not ( = ?auto_62046 ?auto_62044 ) ) ( not ( = ?auto_62042 ?auto_62045 ) ) ( not ( = ?auto_62042 ?auto_62044 ) ) ( not ( = ?auto_62045 ?auto_62044 ) ) ( not ( = ?auto_62040 ?auto_62045 ) ) ( not ( = ?auto_62040 ?auto_62046 ) ) ( not ( = ?auto_62040 ?auto_62042 ) ) ( not ( = ?auto_62043 ?auto_62045 ) ) ( not ( = ?auto_62043 ?auto_62046 ) ) ( not ( = ?auto_62043 ?auto_62042 ) ) ( not ( = ?auto_62041 ?auto_62045 ) ) ( not ( = ?auto_62041 ?auto_62046 ) ) ( not ( = ?auto_62041 ?auto_62042 ) ) ( ON ?auto_62044 ?auto_62041 ) ( CLEAR ?auto_62042 ) ( ON ?auto_62045 ?auto_62044 ) ( CLEAR ?auto_62045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62040 ?auto_62043 ?auto_62041 ?auto_62044 )
      ( MAKE-1PILE ?auto_62040 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62047 - BLOCK
    )
    :vars
    (
      ?auto_62050 - BLOCK
      ?auto_62051 - BLOCK
      ?auto_62052 - BLOCK
      ?auto_62048 - BLOCK
      ?auto_62049 - BLOCK
      ?auto_62053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62050 ?auto_62047 ) ( ON-TABLE ?auto_62047 ) ( not ( = ?auto_62047 ?auto_62050 ) ) ( not ( = ?auto_62047 ?auto_62051 ) ) ( not ( = ?auto_62047 ?auto_62052 ) ) ( not ( = ?auto_62050 ?auto_62051 ) ) ( not ( = ?auto_62050 ?auto_62052 ) ) ( not ( = ?auto_62051 ?auto_62052 ) ) ( ON ?auto_62051 ?auto_62050 ) ( ON-TABLE ?auto_62048 ) ( not ( = ?auto_62048 ?auto_62049 ) ) ( not ( = ?auto_62048 ?auto_62053 ) ) ( not ( = ?auto_62048 ?auto_62052 ) ) ( not ( = ?auto_62049 ?auto_62053 ) ) ( not ( = ?auto_62049 ?auto_62052 ) ) ( not ( = ?auto_62053 ?auto_62052 ) ) ( not ( = ?auto_62047 ?auto_62053 ) ) ( not ( = ?auto_62047 ?auto_62048 ) ) ( not ( = ?auto_62047 ?auto_62049 ) ) ( not ( = ?auto_62050 ?auto_62053 ) ) ( not ( = ?auto_62050 ?auto_62048 ) ) ( not ( = ?auto_62050 ?auto_62049 ) ) ( not ( = ?auto_62051 ?auto_62053 ) ) ( not ( = ?auto_62051 ?auto_62048 ) ) ( not ( = ?auto_62051 ?auto_62049 ) ) ( ON ?auto_62052 ?auto_62051 ) ( ON ?auto_62053 ?auto_62052 ) ( CLEAR ?auto_62053 ) ( HOLDING ?auto_62049 ) ( CLEAR ?auto_62048 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62048 ?auto_62049 )
      ( MAKE-1PILE ?auto_62047 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62900 - BLOCK
    )
    :vars
    (
      ?auto_62905 - BLOCK
      ?auto_62901 - BLOCK
      ?auto_62902 - BLOCK
      ?auto_62903 - BLOCK
      ?auto_62904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62905 ?auto_62900 ) ( ON-TABLE ?auto_62900 ) ( not ( = ?auto_62900 ?auto_62905 ) ) ( not ( = ?auto_62900 ?auto_62901 ) ) ( not ( = ?auto_62900 ?auto_62902 ) ) ( not ( = ?auto_62905 ?auto_62901 ) ) ( not ( = ?auto_62905 ?auto_62902 ) ) ( not ( = ?auto_62901 ?auto_62902 ) ) ( ON ?auto_62901 ?auto_62905 ) ( not ( = ?auto_62903 ?auto_62904 ) ) ( not ( = ?auto_62903 ?auto_62902 ) ) ( not ( = ?auto_62904 ?auto_62902 ) ) ( not ( = ?auto_62900 ?auto_62904 ) ) ( not ( = ?auto_62900 ?auto_62903 ) ) ( not ( = ?auto_62905 ?auto_62904 ) ) ( not ( = ?auto_62905 ?auto_62903 ) ) ( not ( = ?auto_62901 ?auto_62904 ) ) ( not ( = ?auto_62901 ?auto_62903 ) ) ( ON ?auto_62902 ?auto_62901 ) ( ON ?auto_62904 ?auto_62902 ) ( ON ?auto_62903 ?auto_62904 ) ( CLEAR ?auto_62903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62900 ?auto_62905 ?auto_62901 ?auto_62902 ?auto_62904 )
      ( MAKE-1PILE ?auto_62900 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62061 - BLOCK
    )
    :vars
    (
      ?auto_62062 - BLOCK
      ?auto_62064 - BLOCK
      ?auto_62065 - BLOCK
      ?auto_62063 - BLOCK
      ?auto_62066 - BLOCK
      ?auto_62067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62062 ?auto_62061 ) ( ON-TABLE ?auto_62061 ) ( not ( = ?auto_62061 ?auto_62062 ) ) ( not ( = ?auto_62061 ?auto_62064 ) ) ( not ( = ?auto_62061 ?auto_62065 ) ) ( not ( = ?auto_62062 ?auto_62064 ) ) ( not ( = ?auto_62062 ?auto_62065 ) ) ( not ( = ?auto_62064 ?auto_62065 ) ) ( ON ?auto_62064 ?auto_62062 ) ( not ( = ?auto_62063 ?auto_62066 ) ) ( not ( = ?auto_62063 ?auto_62067 ) ) ( not ( = ?auto_62063 ?auto_62065 ) ) ( not ( = ?auto_62066 ?auto_62067 ) ) ( not ( = ?auto_62066 ?auto_62065 ) ) ( not ( = ?auto_62067 ?auto_62065 ) ) ( not ( = ?auto_62061 ?auto_62067 ) ) ( not ( = ?auto_62061 ?auto_62063 ) ) ( not ( = ?auto_62061 ?auto_62066 ) ) ( not ( = ?auto_62062 ?auto_62067 ) ) ( not ( = ?auto_62062 ?auto_62063 ) ) ( not ( = ?auto_62062 ?auto_62066 ) ) ( not ( = ?auto_62064 ?auto_62067 ) ) ( not ( = ?auto_62064 ?auto_62063 ) ) ( not ( = ?auto_62064 ?auto_62066 ) ) ( ON ?auto_62065 ?auto_62064 ) ( ON ?auto_62067 ?auto_62065 ) ( ON ?auto_62066 ?auto_62067 ) ( CLEAR ?auto_62066 ) ( HOLDING ?auto_62063 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62063 )
      ( MAKE-1PILE ?auto_62061 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62068 - BLOCK
    )
    :vars
    (
      ?auto_62074 - BLOCK
      ?auto_62073 - BLOCK
      ?auto_62071 - BLOCK
      ?auto_62069 - BLOCK
      ?auto_62070 - BLOCK
      ?auto_62072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62074 ?auto_62068 ) ( ON-TABLE ?auto_62068 ) ( not ( = ?auto_62068 ?auto_62074 ) ) ( not ( = ?auto_62068 ?auto_62073 ) ) ( not ( = ?auto_62068 ?auto_62071 ) ) ( not ( = ?auto_62074 ?auto_62073 ) ) ( not ( = ?auto_62074 ?auto_62071 ) ) ( not ( = ?auto_62073 ?auto_62071 ) ) ( ON ?auto_62073 ?auto_62074 ) ( not ( = ?auto_62069 ?auto_62070 ) ) ( not ( = ?auto_62069 ?auto_62072 ) ) ( not ( = ?auto_62069 ?auto_62071 ) ) ( not ( = ?auto_62070 ?auto_62072 ) ) ( not ( = ?auto_62070 ?auto_62071 ) ) ( not ( = ?auto_62072 ?auto_62071 ) ) ( not ( = ?auto_62068 ?auto_62072 ) ) ( not ( = ?auto_62068 ?auto_62069 ) ) ( not ( = ?auto_62068 ?auto_62070 ) ) ( not ( = ?auto_62074 ?auto_62072 ) ) ( not ( = ?auto_62074 ?auto_62069 ) ) ( not ( = ?auto_62074 ?auto_62070 ) ) ( not ( = ?auto_62073 ?auto_62072 ) ) ( not ( = ?auto_62073 ?auto_62069 ) ) ( not ( = ?auto_62073 ?auto_62070 ) ) ( ON ?auto_62071 ?auto_62073 ) ( ON ?auto_62072 ?auto_62071 ) ( ON ?auto_62070 ?auto_62072 ) ( ON ?auto_62069 ?auto_62070 ) ( CLEAR ?auto_62069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62068 ?auto_62074 ?auto_62073 ?auto_62071 ?auto_62072 ?auto_62070 )
      ( MAKE-1PILE ?auto_62068 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62081 - BLOCK
      ?auto_62082 - BLOCK
      ?auto_62083 - BLOCK
      ?auto_62084 - BLOCK
      ?auto_62085 - BLOCK
      ?auto_62086 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_62086 ) ( CLEAR ?auto_62085 ) ( ON-TABLE ?auto_62081 ) ( ON ?auto_62082 ?auto_62081 ) ( ON ?auto_62083 ?auto_62082 ) ( ON ?auto_62084 ?auto_62083 ) ( ON ?auto_62085 ?auto_62084 ) ( not ( = ?auto_62081 ?auto_62082 ) ) ( not ( = ?auto_62081 ?auto_62083 ) ) ( not ( = ?auto_62081 ?auto_62084 ) ) ( not ( = ?auto_62081 ?auto_62085 ) ) ( not ( = ?auto_62081 ?auto_62086 ) ) ( not ( = ?auto_62082 ?auto_62083 ) ) ( not ( = ?auto_62082 ?auto_62084 ) ) ( not ( = ?auto_62082 ?auto_62085 ) ) ( not ( = ?auto_62082 ?auto_62086 ) ) ( not ( = ?auto_62083 ?auto_62084 ) ) ( not ( = ?auto_62083 ?auto_62085 ) ) ( not ( = ?auto_62083 ?auto_62086 ) ) ( not ( = ?auto_62084 ?auto_62085 ) ) ( not ( = ?auto_62084 ?auto_62086 ) ) ( not ( = ?auto_62085 ?auto_62086 ) ) )
    :subtasks
    ( ( !STACK ?auto_62086 ?auto_62085 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62087 - BLOCK
      ?auto_62088 - BLOCK
      ?auto_62089 - BLOCK
      ?auto_62090 - BLOCK
      ?auto_62091 - BLOCK
      ?auto_62092 - BLOCK
    )
    :vars
    (
      ?auto_62093 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62091 ) ( ON-TABLE ?auto_62087 ) ( ON ?auto_62088 ?auto_62087 ) ( ON ?auto_62089 ?auto_62088 ) ( ON ?auto_62090 ?auto_62089 ) ( ON ?auto_62091 ?auto_62090 ) ( not ( = ?auto_62087 ?auto_62088 ) ) ( not ( = ?auto_62087 ?auto_62089 ) ) ( not ( = ?auto_62087 ?auto_62090 ) ) ( not ( = ?auto_62087 ?auto_62091 ) ) ( not ( = ?auto_62087 ?auto_62092 ) ) ( not ( = ?auto_62088 ?auto_62089 ) ) ( not ( = ?auto_62088 ?auto_62090 ) ) ( not ( = ?auto_62088 ?auto_62091 ) ) ( not ( = ?auto_62088 ?auto_62092 ) ) ( not ( = ?auto_62089 ?auto_62090 ) ) ( not ( = ?auto_62089 ?auto_62091 ) ) ( not ( = ?auto_62089 ?auto_62092 ) ) ( not ( = ?auto_62090 ?auto_62091 ) ) ( not ( = ?auto_62090 ?auto_62092 ) ) ( not ( = ?auto_62091 ?auto_62092 ) ) ( ON ?auto_62092 ?auto_62093 ) ( CLEAR ?auto_62092 ) ( HAND-EMPTY ) ( not ( = ?auto_62087 ?auto_62093 ) ) ( not ( = ?auto_62088 ?auto_62093 ) ) ( not ( = ?auto_62089 ?auto_62093 ) ) ( not ( = ?auto_62090 ?auto_62093 ) ) ( not ( = ?auto_62091 ?auto_62093 ) ) ( not ( = ?auto_62092 ?auto_62093 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62092 ?auto_62093 )
      ( MAKE-6PILE ?auto_62087 ?auto_62088 ?auto_62089 ?auto_62090 ?auto_62091 ?auto_62092 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62094 - BLOCK
      ?auto_62095 - BLOCK
      ?auto_62096 - BLOCK
      ?auto_62097 - BLOCK
      ?auto_62098 - BLOCK
      ?auto_62099 - BLOCK
    )
    :vars
    (
      ?auto_62100 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62094 ) ( ON ?auto_62095 ?auto_62094 ) ( ON ?auto_62096 ?auto_62095 ) ( ON ?auto_62097 ?auto_62096 ) ( not ( = ?auto_62094 ?auto_62095 ) ) ( not ( = ?auto_62094 ?auto_62096 ) ) ( not ( = ?auto_62094 ?auto_62097 ) ) ( not ( = ?auto_62094 ?auto_62098 ) ) ( not ( = ?auto_62094 ?auto_62099 ) ) ( not ( = ?auto_62095 ?auto_62096 ) ) ( not ( = ?auto_62095 ?auto_62097 ) ) ( not ( = ?auto_62095 ?auto_62098 ) ) ( not ( = ?auto_62095 ?auto_62099 ) ) ( not ( = ?auto_62096 ?auto_62097 ) ) ( not ( = ?auto_62096 ?auto_62098 ) ) ( not ( = ?auto_62096 ?auto_62099 ) ) ( not ( = ?auto_62097 ?auto_62098 ) ) ( not ( = ?auto_62097 ?auto_62099 ) ) ( not ( = ?auto_62098 ?auto_62099 ) ) ( ON ?auto_62099 ?auto_62100 ) ( CLEAR ?auto_62099 ) ( not ( = ?auto_62094 ?auto_62100 ) ) ( not ( = ?auto_62095 ?auto_62100 ) ) ( not ( = ?auto_62096 ?auto_62100 ) ) ( not ( = ?auto_62097 ?auto_62100 ) ) ( not ( = ?auto_62098 ?auto_62100 ) ) ( not ( = ?auto_62099 ?auto_62100 ) ) ( HOLDING ?auto_62098 ) ( CLEAR ?auto_62097 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62094 ?auto_62095 ?auto_62096 ?auto_62097 ?auto_62098 )
      ( MAKE-6PILE ?auto_62094 ?auto_62095 ?auto_62096 ?auto_62097 ?auto_62098 ?auto_62099 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62101 - BLOCK
      ?auto_62102 - BLOCK
      ?auto_62103 - BLOCK
      ?auto_62104 - BLOCK
      ?auto_62105 - BLOCK
      ?auto_62106 - BLOCK
    )
    :vars
    (
      ?auto_62107 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62101 ) ( ON ?auto_62102 ?auto_62101 ) ( ON ?auto_62103 ?auto_62102 ) ( ON ?auto_62104 ?auto_62103 ) ( not ( = ?auto_62101 ?auto_62102 ) ) ( not ( = ?auto_62101 ?auto_62103 ) ) ( not ( = ?auto_62101 ?auto_62104 ) ) ( not ( = ?auto_62101 ?auto_62105 ) ) ( not ( = ?auto_62101 ?auto_62106 ) ) ( not ( = ?auto_62102 ?auto_62103 ) ) ( not ( = ?auto_62102 ?auto_62104 ) ) ( not ( = ?auto_62102 ?auto_62105 ) ) ( not ( = ?auto_62102 ?auto_62106 ) ) ( not ( = ?auto_62103 ?auto_62104 ) ) ( not ( = ?auto_62103 ?auto_62105 ) ) ( not ( = ?auto_62103 ?auto_62106 ) ) ( not ( = ?auto_62104 ?auto_62105 ) ) ( not ( = ?auto_62104 ?auto_62106 ) ) ( not ( = ?auto_62105 ?auto_62106 ) ) ( ON ?auto_62106 ?auto_62107 ) ( not ( = ?auto_62101 ?auto_62107 ) ) ( not ( = ?auto_62102 ?auto_62107 ) ) ( not ( = ?auto_62103 ?auto_62107 ) ) ( not ( = ?auto_62104 ?auto_62107 ) ) ( not ( = ?auto_62105 ?auto_62107 ) ) ( not ( = ?auto_62106 ?auto_62107 ) ) ( CLEAR ?auto_62104 ) ( ON ?auto_62105 ?auto_62106 ) ( CLEAR ?auto_62105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62107 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62107 ?auto_62106 )
      ( MAKE-6PILE ?auto_62101 ?auto_62102 ?auto_62103 ?auto_62104 ?auto_62105 ?auto_62106 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62108 - BLOCK
      ?auto_62109 - BLOCK
      ?auto_62110 - BLOCK
      ?auto_62111 - BLOCK
      ?auto_62112 - BLOCK
      ?auto_62113 - BLOCK
    )
    :vars
    (
      ?auto_62114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62108 ) ( ON ?auto_62109 ?auto_62108 ) ( ON ?auto_62110 ?auto_62109 ) ( not ( = ?auto_62108 ?auto_62109 ) ) ( not ( = ?auto_62108 ?auto_62110 ) ) ( not ( = ?auto_62108 ?auto_62111 ) ) ( not ( = ?auto_62108 ?auto_62112 ) ) ( not ( = ?auto_62108 ?auto_62113 ) ) ( not ( = ?auto_62109 ?auto_62110 ) ) ( not ( = ?auto_62109 ?auto_62111 ) ) ( not ( = ?auto_62109 ?auto_62112 ) ) ( not ( = ?auto_62109 ?auto_62113 ) ) ( not ( = ?auto_62110 ?auto_62111 ) ) ( not ( = ?auto_62110 ?auto_62112 ) ) ( not ( = ?auto_62110 ?auto_62113 ) ) ( not ( = ?auto_62111 ?auto_62112 ) ) ( not ( = ?auto_62111 ?auto_62113 ) ) ( not ( = ?auto_62112 ?auto_62113 ) ) ( ON ?auto_62113 ?auto_62114 ) ( not ( = ?auto_62108 ?auto_62114 ) ) ( not ( = ?auto_62109 ?auto_62114 ) ) ( not ( = ?auto_62110 ?auto_62114 ) ) ( not ( = ?auto_62111 ?auto_62114 ) ) ( not ( = ?auto_62112 ?auto_62114 ) ) ( not ( = ?auto_62113 ?auto_62114 ) ) ( ON ?auto_62112 ?auto_62113 ) ( CLEAR ?auto_62112 ) ( ON-TABLE ?auto_62114 ) ( HOLDING ?auto_62111 ) ( CLEAR ?auto_62110 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62108 ?auto_62109 ?auto_62110 ?auto_62111 )
      ( MAKE-6PILE ?auto_62108 ?auto_62109 ?auto_62110 ?auto_62111 ?auto_62112 ?auto_62113 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62115 - BLOCK
      ?auto_62116 - BLOCK
      ?auto_62117 - BLOCK
      ?auto_62118 - BLOCK
      ?auto_62119 - BLOCK
      ?auto_62120 - BLOCK
    )
    :vars
    (
      ?auto_62121 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62115 ) ( ON ?auto_62116 ?auto_62115 ) ( ON ?auto_62117 ?auto_62116 ) ( not ( = ?auto_62115 ?auto_62116 ) ) ( not ( = ?auto_62115 ?auto_62117 ) ) ( not ( = ?auto_62115 ?auto_62118 ) ) ( not ( = ?auto_62115 ?auto_62119 ) ) ( not ( = ?auto_62115 ?auto_62120 ) ) ( not ( = ?auto_62116 ?auto_62117 ) ) ( not ( = ?auto_62116 ?auto_62118 ) ) ( not ( = ?auto_62116 ?auto_62119 ) ) ( not ( = ?auto_62116 ?auto_62120 ) ) ( not ( = ?auto_62117 ?auto_62118 ) ) ( not ( = ?auto_62117 ?auto_62119 ) ) ( not ( = ?auto_62117 ?auto_62120 ) ) ( not ( = ?auto_62118 ?auto_62119 ) ) ( not ( = ?auto_62118 ?auto_62120 ) ) ( not ( = ?auto_62119 ?auto_62120 ) ) ( ON ?auto_62120 ?auto_62121 ) ( not ( = ?auto_62115 ?auto_62121 ) ) ( not ( = ?auto_62116 ?auto_62121 ) ) ( not ( = ?auto_62117 ?auto_62121 ) ) ( not ( = ?auto_62118 ?auto_62121 ) ) ( not ( = ?auto_62119 ?auto_62121 ) ) ( not ( = ?auto_62120 ?auto_62121 ) ) ( ON ?auto_62119 ?auto_62120 ) ( ON-TABLE ?auto_62121 ) ( CLEAR ?auto_62117 ) ( ON ?auto_62118 ?auto_62119 ) ( CLEAR ?auto_62118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62121 ?auto_62120 ?auto_62119 )
      ( MAKE-6PILE ?auto_62115 ?auto_62116 ?auto_62117 ?auto_62118 ?auto_62119 ?auto_62120 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62122 - BLOCK
      ?auto_62123 - BLOCK
      ?auto_62124 - BLOCK
      ?auto_62125 - BLOCK
      ?auto_62126 - BLOCK
      ?auto_62127 - BLOCK
    )
    :vars
    (
      ?auto_62128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62122 ) ( ON ?auto_62123 ?auto_62122 ) ( not ( = ?auto_62122 ?auto_62123 ) ) ( not ( = ?auto_62122 ?auto_62124 ) ) ( not ( = ?auto_62122 ?auto_62125 ) ) ( not ( = ?auto_62122 ?auto_62126 ) ) ( not ( = ?auto_62122 ?auto_62127 ) ) ( not ( = ?auto_62123 ?auto_62124 ) ) ( not ( = ?auto_62123 ?auto_62125 ) ) ( not ( = ?auto_62123 ?auto_62126 ) ) ( not ( = ?auto_62123 ?auto_62127 ) ) ( not ( = ?auto_62124 ?auto_62125 ) ) ( not ( = ?auto_62124 ?auto_62126 ) ) ( not ( = ?auto_62124 ?auto_62127 ) ) ( not ( = ?auto_62125 ?auto_62126 ) ) ( not ( = ?auto_62125 ?auto_62127 ) ) ( not ( = ?auto_62126 ?auto_62127 ) ) ( ON ?auto_62127 ?auto_62128 ) ( not ( = ?auto_62122 ?auto_62128 ) ) ( not ( = ?auto_62123 ?auto_62128 ) ) ( not ( = ?auto_62124 ?auto_62128 ) ) ( not ( = ?auto_62125 ?auto_62128 ) ) ( not ( = ?auto_62126 ?auto_62128 ) ) ( not ( = ?auto_62127 ?auto_62128 ) ) ( ON ?auto_62126 ?auto_62127 ) ( ON-TABLE ?auto_62128 ) ( ON ?auto_62125 ?auto_62126 ) ( CLEAR ?auto_62125 ) ( HOLDING ?auto_62124 ) ( CLEAR ?auto_62123 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62122 ?auto_62123 ?auto_62124 )
      ( MAKE-6PILE ?auto_62122 ?auto_62123 ?auto_62124 ?auto_62125 ?auto_62126 ?auto_62127 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62129 - BLOCK
      ?auto_62130 - BLOCK
      ?auto_62131 - BLOCK
      ?auto_62132 - BLOCK
      ?auto_62133 - BLOCK
      ?auto_62134 - BLOCK
    )
    :vars
    (
      ?auto_62135 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62129 ) ( ON ?auto_62130 ?auto_62129 ) ( not ( = ?auto_62129 ?auto_62130 ) ) ( not ( = ?auto_62129 ?auto_62131 ) ) ( not ( = ?auto_62129 ?auto_62132 ) ) ( not ( = ?auto_62129 ?auto_62133 ) ) ( not ( = ?auto_62129 ?auto_62134 ) ) ( not ( = ?auto_62130 ?auto_62131 ) ) ( not ( = ?auto_62130 ?auto_62132 ) ) ( not ( = ?auto_62130 ?auto_62133 ) ) ( not ( = ?auto_62130 ?auto_62134 ) ) ( not ( = ?auto_62131 ?auto_62132 ) ) ( not ( = ?auto_62131 ?auto_62133 ) ) ( not ( = ?auto_62131 ?auto_62134 ) ) ( not ( = ?auto_62132 ?auto_62133 ) ) ( not ( = ?auto_62132 ?auto_62134 ) ) ( not ( = ?auto_62133 ?auto_62134 ) ) ( ON ?auto_62134 ?auto_62135 ) ( not ( = ?auto_62129 ?auto_62135 ) ) ( not ( = ?auto_62130 ?auto_62135 ) ) ( not ( = ?auto_62131 ?auto_62135 ) ) ( not ( = ?auto_62132 ?auto_62135 ) ) ( not ( = ?auto_62133 ?auto_62135 ) ) ( not ( = ?auto_62134 ?auto_62135 ) ) ( ON ?auto_62133 ?auto_62134 ) ( ON-TABLE ?auto_62135 ) ( ON ?auto_62132 ?auto_62133 ) ( CLEAR ?auto_62130 ) ( ON ?auto_62131 ?auto_62132 ) ( CLEAR ?auto_62131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62135 ?auto_62134 ?auto_62133 ?auto_62132 )
      ( MAKE-6PILE ?auto_62129 ?auto_62130 ?auto_62131 ?auto_62132 ?auto_62133 ?auto_62134 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62136 - BLOCK
      ?auto_62137 - BLOCK
      ?auto_62138 - BLOCK
      ?auto_62139 - BLOCK
      ?auto_62140 - BLOCK
      ?auto_62141 - BLOCK
    )
    :vars
    (
      ?auto_62142 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62136 ) ( not ( = ?auto_62136 ?auto_62137 ) ) ( not ( = ?auto_62136 ?auto_62138 ) ) ( not ( = ?auto_62136 ?auto_62139 ) ) ( not ( = ?auto_62136 ?auto_62140 ) ) ( not ( = ?auto_62136 ?auto_62141 ) ) ( not ( = ?auto_62137 ?auto_62138 ) ) ( not ( = ?auto_62137 ?auto_62139 ) ) ( not ( = ?auto_62137 ?auto_62140 ) ) ( not ( = ?auto_62137 ?auto_62141 ) ) ( not ( = ?auto_62138 ?auto_62139 ) ) ( not ( = ?auto_62138 ?auto_62140 ) ) ( not ( = ?auto_62138 ?auto_62141 ) ) ( not ( = ?auto_62139 ?auto_62140 ) ) ( not ( = ?auto_62139 ?auto_62141 ) ) ( not ( = ?auto_62140 ?auto_62141 ) ) ( ON ?auto_62141 ?auto_62142 ) ( not ( = ?auto_62136 ?auto_62142 ) ) ( not ( = ?auto_62137 ?auto_62142 ) ) ( not ( = ?auto_62138 ?auto_62142 ) ) ( not ( = ?auto_62139 ?auto_62142 ) ) ( not ( = ?auto_62140 ?auto_62142 ) ) ( not ( = ?auto_62141 ?auto_62142 ) ) ( ON ?auto_62140 ?auto_62141 ) ( ON-TABLE ?auto_62142 ) ( ON ?auto_62139 ?auto_62140 ) ( ON ?auto_62138 ?auto_62139 ) ( CLEAR ?auto_62138 ) ( HOLDING ?auto_62137 ) ( CLEAR ?auto_62136 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62136 ?auto_62137 )
      ( MAKE-6PILE ?auto_62136 ?auto_62137 ?auto_62138 ?auto_62139 ?auto_62140 ?auto_62141 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62143 - BLOCK
      ?auto_62144 - BLOCK
      ?auto_62145 - BLOCK
      ?auto_62146 - BLOCK
      ?auto_62147 - BLOCK
      ?auto_62148 - BLOCK
    )
    :vars
    (
      ?auto_62149 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62143 ) ( not ( = ?auto_62143 ?auto_62144 ) ) ( not ( = ?auto_62143 ?auto_62145 ) ) ( not ( = ?auto_62143 ?auto_62146 ) ) ( not ( = ?auto_62143 ?auto_62147 ) ) ( not ( = ?auto_62143 ?auto_62148 ) ) ( not ( = ?auto_62144 ?auto_62145 ) ) ( not ( = ?auto_62144 ?auto_62146 ) ) ( not ( = ?auto_62144 ?auto_62147 ) ) ( not ( = ?auto_62144 ?auto_62148 ) ) ( not ( = ?auto_62145 ?auto_62146 ) ) ( not ( = ?auto_62145 ?auto_62147 ) ) ( not ( = ?auto_62145 ?auto_62148 ) ) ( not ( = ?auto_62146 ?auto_62147 ) ) ( not ( = ?auto_62146 ?auto_62148 ) ) ( not ( = ?auto_62147 ?auto_62148 ) ) ( ON ?auto_62148 ?auto_62149 ) ( not ( = ?auto_62143 ?auto_62149 ) ) ( not ( = ?auto_62144 ?auto_62149 ) ) ( not ( = ?auto_62145 ?auto_62149 ) ) ( not ( = ?auto_62146 ?auto_62149 ) ) ( not ( = ?auto_62147 ?auto_62149 ) ) ( not ( = ?auto_62148 ?auto_62149 ) ) ( ON ?auto_62147 ?auto_62148 ) ( ON-TABLE ?auto_62149 ) ( ON ?auto_62146 ?auto_62147 ) ( ON ?auto_62145 ?auto_62146 ) ( CLEAR ?auto_62143 ) ( ON ?auto_62144 ?auto_62145 ) ( CLEAR ?auto_62144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62149 ?auto_62148 ?auto_62147 ?auto_62146 ?auto_62145 )
      ( MAKE-6PILE ?auto_62143 ?auto_62144 ?auto_62145 ?auto_62146 ?auto_62147 ?auto_62148 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62150 - BLOCK
      ?auto_62151 - BLOCK
      ?auto_62152 - BLOCK
      ?auto_62153 - BLOCK
      ?auto_62154 - BLOCK
      ?auto_62155 - BLOCK
    )
    :vars
    (
      ?auto_62156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62150 ?auto_62151 ) ) ( not ( = ?auto_62150 ?auto_62152 ) ) ( not ( = ?auto_62150 ?auto_62153 ) ) ( not ( = ?auto_62150 ?auto_62154 ) ) ( not ( = ?auto_62150 ?auto_62155 ) ) ( not ( = ?auto_62151 ?auto_62152 ) ) ( not ( = ?auto_62151 ?auto_62153 ) ) ( not ( = ?auto_62151 ?auto_62154 ) ) ( not ( = ?auto_62151 ?auto_62155 ) ) ( not ( = ?auto_62152 ?auto_62153 ) ) ( not ( = ?auto_62152 ?auto_62154 ) ) ( not ( = ?auto_62152 ?auto_62155 ) ) ( not ( = ?auto_62153 ?auto_62154 ) ) ( not ( = ?auto_62153 ?auto_62155 ) ) ( not ( = ?auto_62154 ?auto_62155 ) ) ( ON ?auto_62155 ?auto_62156 ) ( not ( = ?auto_62150 ?auto_62156 ) ) ( not ( = ?auto_62151 ?auto_62156 ) ) ( not ( = ?auto_62152 ?auto_62156 ) ) ( not ( = ?auto_62153 ?auto_62156 ) ) ( not ( = ?auto_62154 ?auto_62156 ) ) ( not ( = ?auto_62155 ?auto_62156 ) ) ( ON ?auto_62154 ?auto_62155 ) ( ON-TABLE ?auto_62156 ) ( ON ?auto_62153 ?auto_62154 ) ( ON ?auto_62152 ?auto_62153 ) ( ON ?auto_62151 ?auto_62152 ) ( CLEAR ?auto_62151 ) ( HOLDING ?auto_62150 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62150 )
      ( MAKE-6PILE ?auto_62150 ?auto_62151 ?auto_62152 ?auto_62153 ?auto_62154 ?auto_62155 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62157 - BLOCK
      ?auto_62158 - BLOCK
      ?auto_62159 - BLOCK
      ?auto_62160 - BLOCK
      ?auto_62161 - BLOCK
      ?auto_62162 - BLOCK
    )
    :vars
    (
      ?auto_62163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62157 ?auto_62158 ) ) ( not ( = ?auto_62157 ?auto_62159 ) ) ( not ( = ?auto_62157 ?auto_62160 ) ) ( not ( = ?auto_62157 ?auto_62161 ) ) ( not ( = ?auto_62157 ?auto_62162 ) ) ( not ( = ?auto_62158 ?auto_62159 ) ) ( not ( = ?auto_62158 ?auto_62160 ) ) ( not ( = ?auto_62158 ?auto_62161 ) ) ( not ( = ?auto_62158 ?auto_62162 ) ) ( not ( = ?auto_62159 ?auto_62160 ) ) ( not ( = ?auto_62159 ?auto_62161 ) ) ( not ( = ?auto_62159 ?auto_62162 ) ) ( not ( = ?auto_62160 ?auto_62161 ) ) ( not ( = ?auto_62160 ?auto_62162 ) ) ( not ( = ?auto_62161 ?auto_62162 ) ) ( ON ?auto_62162 ?auto_62163 ) ( not ( = ?auto_62157 ?auto_62163 ) ) ( not ( = ?auto_62158 ?auto_62163 ) ) ( not ( = ?auto_62159 ?auto_62163 ) ) ( not ( = ?auto_62160 ?auto_62163 ) ) ( not ( = ?auto_62161 ?auto_62163 ) ) ( not ( = ?auto_62162 ?auto_62163 ) ) ( ON ?auto_62161 ?auto_62162 ) ( ON-TABLE ?auto_62163 ) ( ON ?auto_62160 ?auto_62161 ) ( ON ?auto_62159 ?auto_62160 ) ( ON ?auto_62158 ?auto_62159 ) ( ON ?auto_62157 ?auto_62158 ) ( CLEAR ?auto_62157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62163 ?auto_62162 ?auto_62161 ?auto_62160 ?auto_62159 ?auto_62158 )
      ( MAKE-6PILE ?auto_62157 ?auto_62158 ?auto_62159 ?auto_62160 ?auto_62161 ?auto_62162 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62244 - BLOCK
    )
    :vars
    (
      ?auto_62245 - BLOCK
      ?auto_62246 - BLOCK
      ?auto_62247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62244 ?auto_62245 ) ( CLEAR ?auto_62244 ) ( not ( = ?auto_62244 ?auto_62245 ) ) ( HOLDING ?auto_62246 ) ( CLEAR ?auto_62247 ) ( not ( = ?auto_62244 ?auto_62246 ) ) ( not ( = ?auto_62244 ?auto_62247 ) ) ( not ( = ?auto_62245 ?auto_62246 ) ) ( not ( = ?auto_62245 ?auto_62247 ) ) ( not ( = ?auto_62246 ?auto_62247 ) ) )
    :subtasks
    ( ( !STACK ?auto_62246 ?auto_62247 )
      ( MAKE-1PILE ?auto_62244 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62248 - BLOCK
    )
    :vars
    (
      ?auto_62251 - BLOCK
      ?auto_62250 - BLOCK
      ?auto_62249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62248 ?auto_62251 ) ( not ( = ?auto_62248 ?auto_62251 ) ) ( CLEAR ?auto_62250 ) ( not ( = ?auto_62248 ?auto_62249 ) ) ( not ( = ?auto_62248 ?auto_62250 ) ) ( not ( = ?auto_62251 ?auto_62249 ) ) ( not ( = ?auto_62251 ?auto_62250 ) ) ( not ( = ?auto_62249 ?auto_62250 ) ) ( ON ?auto_62249 ?auto_62248 ) ( CLEAR ?auto_62249 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62251 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62251 ?auto_62248 )
      ( MAKE-1PILE ?auto_62248 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62252 - BLOCK
    )
    :vars
    (
      ?auto_62254 - BLOCK
      ?auto_62253 - BLOCK
      ?auto_62255 - BLOCK
      ?auto_62257 - BLOCK
      ?auto_62256 - BLOCK
      ?auto_62258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62252 ?auto_62254 ) ( not ( = ?auto_62252 ?auto_62254 ) ) ( not ( = ?auto_62252 ?auto_62253 ) ) ( not ( = ?auto_62252 ?auto_62255 ) ) ( not ( = ?auto_62254 ?auto_62253 ) ) ( not ( = ?auto_62254 ?auto_62255 ) ) ( not ( = ?auto_62253 ?auto_62255 ) ) ( ON ?auto_62253 ?auto_62252 ) ( CLEAR ?auto_62253 ) ( ON-TABLE ?auto_62254 ) ( HOLDING ?auto_62255 ) ( CLEAR ?auto_62257 ) ( ON-TABLE ?auto_62256 ) ( ON ?auto_62258 ?auto_62256 ) ( ON ?auto_62257 ?auto_62258 ) ( not ( = ?auto_62256 ?auto_62258 ) ) ( not ( = ?auto_62256 ?auto_62257 ) ) ( not ( = ?auto_62256 ?auto_62255 ) ) ( not ( = ?auto_62258 ?auto_62257 ) ) ( not ( = ?auto_62258 ?auto_62255 ) ) ( not ( = ?auto_62257 ?auto_62255 ) ) ( not ( = ?auto_62252 ?auto_62257 ) ) ( not ( = ?auto_62252 ?auto_62256 ) ) ( not ( = ?auto_62252 ?auto_62258 ) ) ( not ( = ?auto_62254 ?auto_62257 ) ) ( not ( = ?auto_62254 ?auto_62256 ) ) ( not ( = ?auto_62254 ?auto_62258 ) ) ( not ( = ?auto_62253 ?auto_62257 ) ) ( not ( = ?auto_62253 ?auto_62256 ) ) ( not ( = ?auto_62253 ?auto_62258 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62256 ?auto_62258 ?auto_62257 ?auto_62255 )
      ( MAKE-1PILE ?auto_62252 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62259 - BLOCK
    )
    :vars
    (
      ?auto_62261 - BLOCK
      ?auto_62264 - BLOCK
      ?auto_62260 - BLOCK
      ?auto_62265 - BLOCK
      ?auto_62262 - BLOCK
      ?auto_62263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62259 ?auto_62261 ) ( not ( = ?auto_62259 ?auto_62261 ) ) ( not ( = ?auto_62259 ?auto_62264 ) ) ( not ( = ?auto_62259 ?auto_62260 ) ) ( not ( = ?auto_62261 ?auto_62264 ) ) ( not ( = ?auto_62261 ?auto_62260 ) ) ( not ( = ?auto_62264 ?auto_62260 ) ) ( ON ?auto_62264 ?auto_62259 ) ( ON-TABLE ?auto_62261 ) ( CLEAR ?auto_62265 ) ( ON-TABLE ?auto_62262 ) ( ON ?auto_62263 ?auto_62262 ) ( ON ?auto_62265 ?auto_62263 ) ( not ( = ?auto_62262 ?auto_62263 ) ) ( not ( = ?auto_62262 ?auto_62265 ) ) ( not ( = ?auto_62262 ?auto_62260 ) ) ( not ( = ?auto_62263 ?auto_62265 ) ) ( not ( = ?auto_62263 ?auto_62260 ) ) ( not ( = ?auto_62265 ?auto_62260 ) ) ( not ( = ?auto_62259 ?auto_62265 ) ) ( not ( = ?auto_62259 ?auto_62262 ) ) ( not ( = ?auto_62259 ?auto_62263 ) ) ( not ( = ?auto_62261 ?auto_62265 ) ) ( not ( = ?auto_62261 ?auto_62262 ) ) ( not ( = ?auto_62261 ?auto_62263 ) ) ( not ( = ?auto_62264 ?auto_62265 ) ) ( not ( = ?auto_62264 ?auto_62262 ) ) ( not ( = ?auto_62264 ?auto_62263 ) ) ( ON ?auto_62260 ?auto_62264 ) ( CLEAR ?auto_62260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62261 ?auto_62259 ?auto_62264 )
      ( MAKE-1PILE ?auto_62259 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62266 - BLOCK
    )
    :vars
    (
      ?auto_62270 - BLOCK
      ?auto_62271 - BLOCK
      ?auto_62267 - BLOCK
      ?auto_62269 - BLOCK
      ?auto_62272 - BLOCK
      ?auto_62268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62266 ?auto_62270 ) ( not ( = ?auto_62266 ?auto_62270 ) ) ( not ( = ?auto_62266 ?auto_62271 ) ) ( not ( = ?auto_62266 ?auto_62267 ) ) ( not ( = ?auto_62270 ?auto_62271 ) ) ( not ( = ?auto_62270 ?auto_62267 ) ) ( not ( = ?auto_62271 ?auto_62267 ) ) ( ON ?auto_62271 ?auto_62266 ) ( ON-TABLE ?auto_62270 ) ( ON-TABLE ?auto_62269 ) ( ON ?auto_62272 ?auto_62269 ) ( not ( = ?auto_62269 ?auto_62272 ) ) ( not ( = ?auto_62269 ?auto_62268 ) ) ( not ( = ?auto_62269 ?auto_62267 ) ) ( not ( = ?auto_62272 ?auto_62268 ) ) ( not ( = ?auto_62272 ?auto_62267 ) ) ( not ( = ?auto_62268 ?auto_62267 ) ) ( not ( = ?auto_62266 ?auto_62268 ) ) ( not ( = ?auto_62266 ?auto_62269 ) ) ( not ( = ?auto_62266 ?auto_62272 ) ) ( not ( = ?auto_62270 ?auto_62268 ) ) ( not ( = ?auto_62270 ?auto_62269 ) ) ( not ( = ?auto_62270 ?auto_62272 ) ) ( not ( = ?auto_62271 ?auto_62268 ) ) ( not ( = ?auto_62271 ?auto_62269 ) ) ( not ( = ?auto_62271 ?auto_62272 ) ) ( ON ?auto_62267 ?auto_62271 ) ( CLEAR ?auto_62267 ) ( HOLDING ?auto_62268 ) ( CLEAR ?auto_62272 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62269 ?auto_62272 ?auto_62268 )
      ( MAKE-1PILE ?auto_62266 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62273 - BLOCK
    )
    :vars
    (
      ?auto_62278 - BLOCK
      ?auto_62277 - BLOCK
      ?auto_62275 - BLOCK
      ?auto_62279 - BLOCK
      ?auto_62276 - BLOCK
      ?auto_62274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62273 ?auto_62278 ) ( not ( = ?auto_62273 ?auto_62278 ) ) ( not ( = ?auto_62273 ?auto_62277 ) ) ( not ( = ?auto_62273 ?auto_62275 ) ) ( not ( = ?auto_62278 ?auto_62277 ) ) ( not ( = ?auto_62278 ?auto_62275 ) ) ( not ( = ?auto_62277 ?auto_62275 ) ) ( ON ?auto_62277 ?auto_62273 ) ( ON-TABLE ?auto_62278 ) ( ON-TABLE ?auto_62279 ) ( ON ?auto_62276 ?auto_62279 ) ( not ( = ?auto_62279 ?auto_62276 ) ) ( not ( = ?auto_62279 ?auto_62274 ) ) ( not ( = ?auto_62279 ?auto_62275 ) ) ( not ( = ?auto_62276 ?auto_62274 ) ) ( not ( = ?auto_62276 ?auto_62275 ) ) ( not ( = ?auto_62274 ?auto_62275 ) ) ( not ( = ?auto_62273 ?auto_62274 ) ) ( not ( = ?auto_62273 ?auto_62279 ) ) ( not ( = ?auto_62273 ?auto_62276 ) ) ( not ( = ?auto_62278 ?auto_62274 ) ) ( not ( = ?auto_62278 ?auto_62279 ) ) ( not ( = ?auto_62278 ?auto_62276 ) ) ( not ( = ?auto_62277 ?auto_62274 ) ) ( not ( = ?auto_62277 ?auto_62279 ) ) ( not ( = ?auto_62277 ?auto_62276 ) ) ( ON ?auto_62275 ?auto_62277 ) ( CLEAR ?auto_62276 ) ( ON ?auto_62274 ?auto_62275 ) ( CLEAR ?auto_62274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62278 ?auto_62273 ?auto_62277 ?auto_62275 )
      ( MAKE-1PILE ?auto_62273 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62280 - BLOCK
    )
    :vars
    (
      ?auto_62282 - BLOCK
      ?auto_62286 - BLOCK
      ?auto_62283 - BLOCK
      ?auto_62285 - BLOCK
      ?auto_62281 - BLOCK
      ?auto_62284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62280 ?auto_62282 ) ( not ( = ?auto_62280 ?auto_62282 ) ) ( not ( = ?auto_62280 ?auto_62286 ) ) ( not ( = ?auto_62280 ?auto_62283 ) ) ( not ( = ?auto_62282 ?auto_62286 ) ) ( not ( = ?auto_62282 ?auto_62283 ) ) ( not ( = ?auto_62286 ?auto_62283 ) ) ( ON ?auto_62286 ?auto_62280 ) ( ON-TABLE ?auto_62282 ) ( ON-TABLE ?auto_62285 ) ( not ( = ?auto_62285 ?auto_62281 ) ) ( not ( = ?auto_62285 ?auto_62284 ) ) ( not ( = ?auto_62285 ?auto_62283 ) ) ( not ( = ?auto_62281 ?auto_62284 ) ) ( not ( = ?auto_62281 ?auto_62283 ) ) ( not ( = ?auto_62284 ?auto_62283 ) ) ( not ( = ?auto_62280 ?auto_62284 ) ) ( not ( = ?auto_62280 ?auto_62285 ) ) ( not ( = ?auto_62280 ?auto_62281 ) ) ( not ( = ?auto_62282 ?auto_62284 ) ) ( not ( = ?auto_62282 ?auto_62285 ) ) ( not ( = ?auto_62282 ?auto_62281 ) ) ( not ( = ?auto_62286 ?auto_62284 ) ) ( not ( = ?auto_62286 ?auto_62285 ) ) ( not ( = ?auto_62286 ?auto_62281 ) ) ( ON ?auto_62283 ?auto_62286 ) ( ON ?auto_62284 ?auto_62283 ) ( CLEAR ?auto_62284 ) ( HOLDING ?auto_62281 ) ( CLEAR ?auto_62285 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62285 ?auto_62281 )
      ( MAKE-1PILE ?auto_62280 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62287 - BLOCK
    )
    :vars
    (
      ?auto_62292 - BLOCK
      ?auto_62293 - BLOCK
      ?auto_62288 - BLOCK
      ?auto_62290 - BLOCK
      ?auto_62291 - BLOCK
      ?auto_62289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62287 ?auto_62292 ) ( not ( = ?auto_62287 ?auto_62292 ) ) ( not ( = ?auto_62287 ?auto_62293 ) ) ( not ( = ?auto_62287 ?auto_62288 ) ) ( not ( = ?auto_62292 ?auto_62293 ) ) ( not ( = ?auto_62292 ?auto_62288 ) ) ( not ( = ?auto_62293 ?auto_62288 ) ) ( ON ?auto_62293 ?auto_62287 ) ( ON-TABLE ?auto_62292 ) ( ON-TABLE ?auto_62290 ) ( not ( = ?auto_62290 ?auto_62291 ) ) ( not ( = ?auto_62290 ?auto_62289 ) ) ( not ( = ?auto_62290 ?auto_62288 ) ) ( not ( = ?auto_62291 ?auto_62289 ) ) ( not ( = ?auto_62291 ?auto_62288 ) ) ( not ( = ?auto_62289 ?auto_62288 ) ) ( not ( = ?auto_62287 ?auto_62289 ) ) ( not ( = ?auto_62287 ?auto_62290 ) ) ( not ( = ?auto_62287 ?auto_62291 ) ) ( not ( = ?auto_62292 ?auto_62289 ) ) ( not ( = ?auto_62292 ?auto_62290 ) ) ( not ( = ?auto_62292 ?auto_62291 ) ) ( not ( = ?auto_62293 ?auto_62289 ) ) ( not ( = ?auto_62293 ?auto_62290 ) ) ( not ( = ?auto_62293 ?auto_62291 ) ) ( ON ?auto_62288 ?auto_62293 ) ( ON ?auto_62289 ?auto_62288 ) ( CLEAR ?auto_62290 ) ( ON ?auto_62291 ?auto_62289 ) ( CLEAR ?auto_62291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62292 ?auto_62287 ?auto_62293 ?auto_62288 ?auto_62289 )
      ( MAKE-1PILE ?auto_62287 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62294 - BLOCK
    )
    :vars
    (
      ?auto_62299 - BLOCK
      ?auto_62300 - BLOCK
      ?auto_62296 - BLOCK
      ?auto_62298 - BLOCK
      ?auto_62297 - BLOCK
      ?auto_62295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62294 ?auto_62299 ) ( not ( = ?auto_62294 ?auto_62299 ) ) ( not ( = ?auto_62294 ?auto_62300 ) ) ( not ( = ?auto_62294 ?auto_62296 ) ) ( not ( = ?auto_62299 ?auto_62300 ) ) ( not ( = ?auto_62299 ?auto_62296 ) ) ( not ( = ?auto_62300 ?auto_62296 ) ) ( ON ?auto_62300 ?auto_62294 ) ( ON-TABLE ?auto_62299 ) ( not ( = ?auto_62298 ?auto_62297 ) ) ( not ( = ?auto_62298 ?auto_62295 ) ) ( not ( = ?auto_62298 ?auto_62296 ) ) ( not ( = ?auto_62297 ?auto_62295 ) ) ( not ( = ?auto_62297 ?auto_62296 ) ) ( not ( = ?auto_62295 ?auto_62296 ) ) ( not ( = ?auto_62294 ?auto_62295 ) ) ( not ( = ?auto_62294 ?auto_62298 ) ) ( not ( = ?auto_62294 ?auto_62297 ) ) ( not ( = ?auto_62299 ?auto_62295 ) ) ( not ( = ?auto_62299 ?auto_62298 ) ) ( not ( = ?auto_62299 ?auto_62297 ) ) ( not ( = ?auto_62300 ?auto_62295 ) ) ( not ( = ?auto_62300 ?auto_62298 ) ) ( not ( = ?auto_62300 ?auto_62297 ) ) ( ON ?auto_62296 ?auto_62300 ) ( ON ?auto_62295 ?auto_62296 ) ( ON ?auto_62297 ?auto_62295 ) ( CLEAR ?auto_62297 ) ( HOLDING ?auto_62298 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62298 )
      ( MAKE-1PILE ?auto_62294 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62301 - BLOCK
    )
    :vars
    (
      ?auto_62303 - BLOCK
      ?auto_62305 - BLOCK
      ?auto_62306 - BLOCK
      ?auto_62304 - BLOCK
      ?auto_62307 - BLOCK
      ?auto_62302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62301 ?auto_62303 ) ( not ( = ?auto_62301 ?auto_62303 ) ) ( not ( = ?auto_62301 ?auto_62305 ) ) ( not ( = ?auto_62301 ?auto_62306 ) ) ( not ( = ?auto_62303 ?auto_62305 ) ) ( not ( = ?auto_62303 ?auto_62306 ) ) ( not ( = ?auto_62305 ?auto_62306 ) ) ( ON ?auto_62305 ?auto_62301 ) ( ON-TABLE ?auto_62303 ) ( not ( = ?auto_62304 ?auto_62307 ) ) ( not ( = ?auto_62304 ?auto_62302 ) ) ( not ( = ?auto_62304 ?auto_62306 ) ) ( not ( = ?auto_62307 ?auto_62302 ) ) ( not ( = ?auto_62307 ?auto_62306 ) ) ( not ( = ?auto_62302 ?auto_62306 ) ) ( not ( = ?auto_62301 ?auto_62302 ) ) ( not ( = ?auto_62301 ?auto_62304 ) ) ( not ( = ?auto_62301 ?auto_62307 ) ) ( not ( = ?auto_62303 ?auto_62302 ) ) ( not ( = ?auto_62303 ?auto_62304 ) ) ( not ( = ?auto_62303 ?auto_62307 ) ) ( not ( = ?auto_62305 ?auto_62302 ) ) ( not ( = ?auto_62305 ?auto_62304 ) ) ( not ( = ?auto_62305 ?auto_62307 ) ) ( ON ?auto_62306 ?auto_62305 ) ( ON ?auto_62302 ?auto_62306 ) ( ON ?auto_62307 ?auto_62302 ) ( ON ?auto_62304 ?auto_62307 ) ( CLEAR ?auto_62304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62303 ?auto_62301 ?auto_62305 ?auto_62306 ?auto_62302 ?auto_62307 )
      ( MAKE-1PILE ?auto_62301 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62317 - BLOCK
      ?auto_62318 - BLOCK
      ?auto_62319 - BLOCK
      ?auto_62320 - BLOCK
    )
    :vars
    (
      ?auto_62321 - BLOCK
      ?auto_62322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62321 ?auto_62320 ) ( CLEAR ?auto_62321 ) ( ON-TABLE ?auto_62317 ) ( ON ?auto_62318 ?auto_62317 ) ( ON ?auto_62319 ?auto_62318 ) ( ON ?auto_62320 ?auto_62319 ) ( not ( = ?auto_62317 ?auto_62318 ) ) ( not ( = ?auto_62317 ?auto_62319 ) ) ( not ( = ?auto_62317 ?auto_62320 ) ) ( not ( = ?auto_62317 ?auto_62321 ) ) ( not ( = ?auto_62318 ?auto_62319 ) ) ( not ( = ?auto_62318 ?auto_62320 ) ) ( not ( = ?auto_62318 ?auto_62321 ) ) ( not ( = ?auto_62319 ?auto_62320 ) ) ( not ( = ?auto_62319 ?auto_62321 ) ) ( not ( = ?auto_62320 ?auto_62321 ) ) ( HOLDING ?auto_62322 ) ( not ( = ?auto_62317 ?auto_62322 ) ) ( not ( = ?auto_62318 ?auto_62322 ) ) ( not ( = ?auto_62319 ?auto_62322 ) ) ( not ( = ?auto_62320 ?auto_62322 ) ) ( not ( = ?auto_62321 ?auto_62322 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_62322 )
      ( MAKE-4PILE ?auto_62317 ?auto_62318 ?auto_62319 ?auto_62320 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62390 - BLOCK
      ?auto_62391 - BLOCK
    )
    :vars
    (
      ?auto_62392 - BLOCK
      ?auto_62393 - BLOCK
      ?auto_62395 - BLOCK
      ?auto_62394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62390 ?auto_62391 ) ) ( ON ?auto_62391 ?auto_62392 ) ( not ( = ?auto_62390 ?auto_62392 ) ) ( not ( = ?auto_62391 ?auto_62392 ) ) ( ON ?auto_62390 ?auto_62391 ) ( CLEAR ?auto_62390 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62393 ) ( ON ?auto_62395 ?auto_62393 ) ( ON ?auto_62394 ?auto_62395 ) ( ON ?auto_62392 ?auto_62394 ) ( not ( = ?auto_62393 ?auto_62395 ) ) ( not ( = ?auto_62393 ?auto_62394 ) ) ( not ( = ?auto_62393 ?auto_62392 ) ) ( not ( = ?auto_62393 ?auto_62391 ) ) ( not ( = ?auto_62393 ?auto_62390 ) ) ( not ( = ?auto_62395 ?auto_62394 ) ) ( not ( = ?auto_62395 ?auto_62392 ) ) ( not ( = ?auto_62395 ?auto_62391 ) ) ( not ( = ?auto_62395 ?auto_62390 ) ) ( not ( = ?auto_62394 ?auto_62392 ) ) ( not ( = ?auto_62394 ?auto_62391 ) ) ( not ( = ?auto_62394 ?auto_62390 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62393 ?auto_62395 ?auto_62394 ?auto_62392 ?auto_62391 )
      ( MAKE-2PILE ?auto_62390 ?auto_62391 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62398 - BLOCK
      ?auto_62399 - BLOCK
    )
    :vars
    (
      ?auto_62400 - BLOCK
      ?auto_62401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62398 ?auto_62399 ) ) ( ON ?auto_62399 ?auto_62400 ) ( CLEAR ?auto_62399 ) ( not ( = ?auto_62398 ?auto_62400 ) ) ( not ( = ?auto_62399 ?auto_62400 ) ) ( ON ?auto_62398 ?auto_62401 ) ( CLEAR ?auto_62398 ) ( HAND-EMPTY ) ( not ( = ?auto_62398 ?auto_62401 ) ) ( not ( = ?auto_62399 ?auto_62401 ) ) ( not ( = ?auto_62400 ?auto_62401 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62398 ?auto_62401 )
      ( MAKE-2PILE ?auto_62398 ?auto_62399 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62402 - BLOCK
      ?auto_62403 - BLOCK
    )
    :vars
    (
      ?auto_62404 - BLOCK
      ?auto_62405 - BLOCK
      ?auto_62408 - BLOCK
      ?auto_62406 - BLOCK
      ?auto_62407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62402 ?auto_62403 ) ) ( not ( = ?auto_62402 ?auto_62404 ) ) ( not ( = ?auto_62403 ?auto_62404 ) ) ( ON ?auto_62402 ?auto_62405 ) ( CLEAR ?auto_62402 ) ( not ( = ?auto_62402 ?auto_62405 ) ) ( not ( = ?auto_62403 ?auto_62405 ) ) ( not ( = ?auto_62404 ?auto_62405 ) ) ( HOLDING ?auto_62403 ) ( CLEAR ?auto_62404 ) ( ON-TABLE ?auto_62408 ) ( ON ?auto_62406 ?auto_62408 ) ( ON ?auto_62407 ?auto_62406 ) ( ON ?auto_62404 ?auto_62407 ) ( not ( = ?auto_62408 ?auto_62406 ) ) ( not ( = ?auto_62408 ?auto_62407 ) ) ( not ( = ?auto_62408 ?auto_62404 ) ) ( not ( = ?auto_62408 ?auto_62403 ) ) ( not ( = ?auto_62406 ?auto_62407 ) ) ( not ( = ?auto_62406 ?auto_62404 ) ) ( not ( = ?auto_62406 ?auto_62403 ) ) ( not ( = ?auto_62407 ?auto_62404 ) ) ( not ( = ?auto_62407 ?auto_62403 ) ) ( not ( = ?auto_62402 ?auto_62408 ) ) ( not ( = ?auto_62402 ?auto_62406 ) ) ( not ( = ?auto_62402 ?auto_62407 ) ) ( not ( = ?auto_62405 ?auto_62408 ) ) ( not ( = ?auto_62405 ?auto_62406 ) ) ( not ( = ?auto_62405 ?auto_62407 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62408 ?auto_62406 ?auto_62407 ?auto_62404 ?auto_62403 )
      ( MAKE-2PILE ?auto_62402 ?auto_62403 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62409 - BLOCK
      ?auto_62410 - BLOCK
    )
    :vars
    (
      ?auto_62413 - BLOCK
      ?auto_62414 - BLOCK
      ?auto_62411 - BLOCK
      ?auto_62415 - BLOCK
      ?auto_62412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62409 ?auto_62410 ) ) ( not ( = ?auto_62409 ?auto_62413 ) ) ( not ( = ?auto_62410 ?auto_62413 ) ) ( ON ?auto_62409 ?auto_62414 ) ( not ( = ?auto_62409 ?auto_62414 ) ) ( not ( = ?auto_62410 ?auto_62414 ) ) ( not ( = ?auto_62413 ?auto_62414 ) ) ( CLEAR ?auto_62413 ) ( ON-TABLE ?auto_62411 ) ( ON ?auto_62415 ?auto_62411 ) ( ON ?auto_62412 ?auto_62415 ) ( ON ?auto_62413 ?auto_62412 ) ( not ( = ?auto_62411 ?auto_62415 ) ) ( not ( = ?auto_62411 ?auto_62412 ) ) ( not ( = ?auto_62411 ?auto_62413 ) ) ( not ( = ?auto_62411 ?auto_62410 ) ) ( not ( = ?auto_62415 ?auto_62412 ) ) ( not ( = ?auto_62415 ?auto_62413 ) ) ( not ( = ?auto_62415 ?auto_62410 ) ) ( not ( = ?auto_62412 ?auto_62413 ) ) ( not ( = ?auto_62412 ?auto_62410 ) ) ( not ( = ?auto_62409 ?auto_62411 ) ) ( not ( = ?auto_62409 ?auto_62415 ) ) ( not ( = ?auto_62409 ?auto_62412 ) ) ( not ( = ?auto_62414 ?auto_62411 ) ) ( not ( = ?auto_62414 ?auto_62415 ) ) ( not ( = ?auto_62414 ?auto_62412 ) ) ( ON ?auto_62410 ?auto_62409 ) ( CLEAR ?auto_62410 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62414 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62414 ?auto_62409 )
      ( MAKE-2PILE ?auto_62409 ?auto_62410 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62416 - BLOCK
      ?auto_62417 - BLOCK
    )
    :vars
    (
      ?auto_62419 - BLOCK
      ?auto_62420 - BLOCK
      ?auto_62421 - BLOCK
      ?auto_62422 - BLOCK
      ?auto_62418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62416 ?auto_62417 ) ) ( not ( = ?auto_62416 ?auto_62419 ) ) ( not ( = ?auto_62417 ?auto_62419 ) ) ( ON ?auto_62416 ?auto_62420 ) ( not ( = ?auto_62416 ?auto_62420 ) ) ( not ( = ?auto_62417 ?auto_62420 ) ) ( not ( = ?auto_62419 ?auto_62420 ) ) ( ON-TABLE ?auto_62421 ) ( ON ?auto_62422 ?auto_62421 ) ( ON ?auto_62418 ?auto_62422 ) ( not ( = ?auto_62421 ?auto_62422 ) ) ( not ( = ?auto_62421 ?auto_62418 ) ) ( not ( = ?auto_62421 ?auto_62419 ) ) ( not ( = ?auto_62421 ?auto_62417 ) ) ( not ( = ?auto_62422 ?auto_62418 ) ) ( not ( = ?auto_62422 ?auto_62419 ) ) ( not ( = ?auto_62422 ?auto_62417 ) ) ( not ( = ?auto_62418 ?auto_62419 ) ) ( not ( = ?auto_62418 ?auto_62417 ) ) ( not ( = ?auto_62416 ?auto_62421 ) ) ( not ( = ?auto_62416 ?auto_62422 ) ) ( not ( = ?auto_62416 ?auto_62418 ) ) ( not ( = ?auto_62420 ?auto_62421 ) ) ( not ( = ?auto_62420 ?auto_62422 ) ) ( not ( = ?auto_62420 ?auto_62418 ) ) ( ON ?auto_62417 ?auto_62416 ) ( CLEAR ?auto_62417 ) ( ON-TABLE ?auto_62420 ) ( HOLDING ?auto_62419 ) ( CLEAR ?auto_62418 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62421 ?auto_62422 ?auto_62418 ?auto_62419 )
      ( MAKE-2PILE ?auto_62416 ?auto_62417 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62423 - BLOCK
      ?auto_62424 - BLOCK
    )
    :vars
    (
      ?auto_62425 - BLOCK
      ?auto_62427 - BLOCK
      ?auto_62429 - BLOCK
      ?auto_62428 - BLOCK
      ?auto_62426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62423 ?auto_62424 ) ) ( not ( = ?auto_62423 ?auto_62425 ) ) ( not ( = ?auto_62424 ?auto_62425 ) ) ( ON ?auto_62423 ?auto_62427 ) ( not ( = ?auto_62423 ?auto_62427 ) ) ( not ( = ?auto_62424 ?auto_62427 ) ) ( not ( = ?auto_62425 ?auto_62427 ) ) ( ON-TABLE ?auto_62429 ) ( ON ?auto_62428 ?auto_62429 ) ( ON ?auto_62426 ?auto_62428 ) ( not ( = ?auto_62429 ?auto_62428 ) ) ( not ( = ?auto_62429 ?auto_62426 ) ) ( not ( = ?auto_62429 ?auto_62425 ) ) ( not ( = ?auto_62429 ?auto_62424 ) ) ( not ( = ?auto_62428 ?auto_62426 ) ) ( not ( = ?auto_62428 ?auto_62425 ) ) ( not ( = ?auto_62428 ?auto_62424 ) ) ( not ( = ?auto_62426 ?auto_62425 ) ) ( not ( = ?auto_62426 ?auto_62424 ) ) ( not ( = ?auto_62423 ?auto_62429 ) ) ( not ( = ?auto_62423 ?auto_62428 ) ) ( not ( = ?auto_62423 ?auto_62426 ) ) ( not ( = ?auto_62427 ?auto_62429 ) ) ( not ( = ?auto_62427 ?auto_62428 ) ) ( not ( = ?auto_62427 ?auto_62426 ) ) ( ON ?auto_62424 ?auto_62423 ) ( ON-TABLE ?auto_62427 ) ( CLEAR ?auto_62426 ) ( ON ?auto_62425 ?auto_62424 ) ( CLEAR ?auto_62425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62427 ?auto_62423 ?auto_62424 )
      ( MAKE-2PILE ?auto_62423 ?auto_62424 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62430 - BLOCK
      ?auto_62431 - BLOCK
    )
    :vars
    (
      ?auto_62435 - BLOCK
      ?auto_62436 - BLOCK
      ?auto_62434 - BLOCK
      ?auto_62433 - BLOCK
      ?auto_62432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62430 ?auto_62431 ) ) ( not ( = ?auto_62430 ?auto_62435 ) ) ( not ( = ?auto_62431 ?auto_62435 ) ) ( ON ?auto_62430 ?auto_62436 ) ( not ( = ?auto_62430 ?auto_62436 ) ) ( not ( = ?auto_62431 ?auto_62436 ) ) ( not ( = ?auto_62435 ?auto_62436 ) ) ( ON-TABLE ?auto_62434 ) ( ON ?auto_62433 ?auto_62434 ) ( not ( = ?auto_62434 ?auto_62433 ) ) ( not ( = ?auto_62434 ?auto_62432 ) ) ( not ( = ?auto_62434 ?auto_62435 ) ) ( not ( = ?auto_62434 ?auto_62431 ) ) ( not ( = ?auto_62433 ?auto_62432 ) ) ( not ( = ?auto_62433 ?auto_62435 ) ) ( not ( = ?auto_62433 ?auto_62431 ) ) ( not ( = ?auto_62432 ?auto_62435 ) ) ( not ( = ?auto_62432 ?auto_62431 ) ) ( not ( = ?auto_62430 ?auto_62434 ) ) ( not ( = ?auto_62430 ?auto_62433 ) ) ( not ( = ?auto_62430 ?auto_62432 ) ) ( not ( = ?auto_62436 ?auto_62434 ) ) ( not ( = ?auto_62436 ?auto_62433 ) ) ( not ( = ?auto_62436 ?auto_62432 ) ) ( ON ?auto_62431 ?auto_62430 ) ( ON-TABLE ?auto_62436 ) ( ON ?auto_62435 ?auto_62431 ) ( CLEAR ?auto_62435 ) ( HOLDING ?auto_62432 ) ( CLEAR ?auto_62433 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62434 ?auto_62433 ?auto_62432 )
      ( MAKE-2PILE ?auto_62430 ?auto_62431 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62437 - BLOCK
      ?auto_62438 - BLOCK
    )
    :vars
    (
      ?auto_62442 - BLOCK
      ?auto_62441 - BLOCK
      ?auto_62439 - BLOCK
      ?auto_62443 - BLOCK
      ?auto_62440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62437 ?auto_62438 ) ) ( not ( = ?auto_62437 ?auto_62442 ) ) ( not ( = ?auto_62438 ?auto_62442 ) ) ( ON ?auto_62437 ?auto_62441 ) ( not ( = ?auto_62437 ?auto_62441 ) ) ( not ( = ?auto_62438 ?auto_62441 ) ) ( not ( = ?auto_62442 ?auto_62441 ) ) ( ON-TABLE ?auto_62439 ) ( ON ?auto_62443 ?auto_62439 ) ( not ( = ?auto_62439 ?auto_62443 ) ) ( not ( = ?auto_62439 ?auto_62440 ) ) ( not ( = ?auto_62439 ?auto_62442 ) ) ( not ( = ?auto_62439 ?auto_62438 ) ) ( not ( = ?auto_62443 ?auto_62440 ) ) ( not ( = ?auto_62443 ?auto_62442 ) ) ( not ( = ?auto_62443 ?auto_62438 ) ) ( not ( = ?auto_62440 ?auto_62442 ) ) ( not ( = ?auto_62440 ?auto_62438 ) ) ( not ( = ?auto_62437 ?auto_62439 ) ) ( not ( = ?auto_62437 ?auto_62443 ) ) ( not ( = ?auto_62437 ?auto_62440 ) ) ( not ( = ?auto_62441 ?auto_62439 ) ) ( not ( = ?auto_62441 ?auto_62443 ) ) ( not ( = ?auto_62441 ?auto_62440 ) ) ( ON ?auto_62438 ?auto_62437 ) ( ON-TABLE ?auto_62441 ) ( ON ?auto_62442 ?auto_62438 ) ( CLEAR ?auto_62443 ) ( ON ?auto_62440 ?auto_62442 ) ( CLEAR ?auto_62440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62441 ?auto_62437 ?auto_62438 ?auto_62442 )
      ( MAKE-2PILE ?auto_62437 ?auto_62438 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62444 - BLOCK
      ?auto_62445 - BLOCK
    )
    :vars
    (
      ?auto_62448 - BLOCK
      ?auto_62447 - BLOCK
      ?auto_62446 - BLOCK
      ?auto_62449 - BLOCK
      ?auto_62450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62444 ?auto_62445 ) ) ( not ( = ?auto_62444 ?auto_62448 ) ) ( not ( = ?auto_62445 ?auto_62448 ) ) ( ON ?auto_62444 ?auto_62447 ) ( not ( = ?auto_62444 ?auto_62447 ) ) ( not ( = ?auto_62445 ?auto_62447 ) ) ( not ( = ?auto_62448 ?auto_62447 ) ) ( ON-TABLE ?auto_62446 ) ( not ( = ?auto_62446 ?auto_62449 ) ) ( not ( = ?auto_62446 ?auto_62450 ) ) ( not ( = ?auto_62446 ?auto_62448 ) ) ( not ( = ?auto_62446 ?auto_62445 ) ) ( not ( = ?auto_62449 ?auto_62450 ) ) ( not ( = ?auto_62449 ?auto_62448 ) ) ( not ( = ?auto_62449 ?auto_62445 ) ) ( not ( = ?auto_62450 ?auto_62448 ) ) ( not ( = ?auto_62450 ?auto_62445 ) ) ( not ( = ?auto_62444 ?auto_62446 ) ) ( not ( = ?auto_62444 ?auto_62449 ) ) ( not ( = ?auto_62444 ?auto_62450 ) ) ( not ( = ?auto_62447 ?auto_62446 ) ) ( not ( = ?auto_62447 ?auto_62449 ) ) ( not ( = ?auto_62447 ?auto_62450 ) ) ( ON ?auto_62445 ?auto_62444 ) ( ON-TABLE ?auto_62447 ) ( ON ?auto_62448 ?auto_62445 ) ( ON ?auto_62450 ?auto_62448 ) ( CLEAR ?auto_62450 ) ( HOLDING ?auto_62449 ) ( CLEAR ?auto_62446 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62446 ?auto_62449 )
      ( MAKE-2PILE ?auto_62444 ?auto_62445 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62451 - BLOCK
      ?auto_62452 - BLOCK
    )
    :vars
    (
      ?auto_62454 - BLOCK
      ?auto_62453 - BLOCK
      ?auto_62455 - BLOCK
      ?auto_62457 - BLOCK
      ?auto_62456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62451 ?auto_62452 ) ) ( not ( = ?auto_62451 ?auto_62454 ) ) ( not ( = ?auto_62452 ?auto_62454 ) ) ( ON ?auto_62451 ?auto_62453 ) ( not ( = ?auto_62451 ?auto_62453 ) ) ( not ( = ?auto_62452 ?auto_62453 ) ) ( not ( = ?auto_62454 ?auto_62453 ) ) ( ON-TABLE ?auto_62455 ) ( not ( = ?auto_62455 ?auto_62457 ) ) ( not ( = ?auto_62455 ?auto_62456 ) ) ( not ( = ?auto_62455 ?auto_62454 ) ) ( not ( = ?auto_62455 ?auto_62452 ) ) ( not ( = ?auto_62457 ?auto_62456 ) ) ( not ( = ?auto_62457 ?auto_62454 ) ) ( not ( = ?auto_62457 ?auto_62452 ) ) ( not ( = ?auto_62456 ?auto_62454 ) ) ( not ( = ?auto_62456 ?auto_62452 ) ) ( not ( = ?auto_62451 ?auto_62455 ) ) ( not ( = ?auto_62451 ?auto_62457 ) ) ( not ( = ?auto_62451 ?auto_62456 ) ) ( not ( = ?auto_62453 ?auto_62455 ) ) ( not ( = ?auto_62453 ?auto_62457 ) ) ( not ( = ?auto_62453 ?auto_62456 ) ) ( ON ?auto_62452 ?auto_62451 ) ( ON-TABLE ?auto_62453 ) ( ON ?auto_62454 ?auto_62452 ) ( ON ?auto_62456 ?auto_62454 ) ( CLEAR ?auto_62455 ) ( ON ?auto_62457 ?auto_62456 ) ( CLEAR ?auto_62457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62453 ?auto_62451 ?auto_62452 ?auto_62454 ?auto_62456 )
      ( MAKE-2PILE ?auto_62451 ?auto_62452 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62458 - BLOCK
      ?auto_62459 - BLOCK
    )
    :vars
    (
      ?auto_62462 - BLOCK
      ?auto_62463 - BLOCK
      ?auto_62464 - BLOCK
      ?auto_62461 - BLOCK
      ?auto_62460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62458 ?auto_62459 ) ) ( not ( = ?auto_62458 ?auto_62462 ) ) ( not ( = ?auto_62459 ?auto_62462 ) ) ( ON ?auto_62458 ?auto_62463 ) ( not ( = ?auto_62458 ?auto_62463 ) ) ( not ( = ?auto_62459 ?auto_62463 ) ) ( not ( = ?auto_62462 ?auto_62463 ) ) ( not ( = ?auto_62464 ?auto_62461 ) ) ( not ( = ?auto_62464 ?auto_62460 ) ) ( not ( = ?auto_62464 ?auto_62462 ) ) ( not ( = ?auto_62464 ?auto_62459 ) ) ( not ( = ?auto_62461 ?auto_62460 ) ) ( not ( = ?auto_62461 ?auto_62462 ) ) ( not ( = ?auto_62461 ?auto_62459 ) ) ( not ( = ?auto_62460 ?auto_62462 ) ) ( not ( = ?auto_62460 ?auto_62459 ) ) ( not ( = ?auto_62458 ?auto_62464 ) ) ( not ( = ?auto_62458 ?auto_62461 ) ) ( not ( = ?auto_62458 ?auto_62460 ) ) ( not ( = ?auto_62463 ?auto_62464 ) ) ( not ( = ?auto_62463 ?auto_62461 ) ) ( not ( = ?auto_62463 ?auto_62460 ) ) ( ON ?auto_62459 ?auto_62458 ) ( ON-TABLE ?auto_62463 ) ( ON ?auto_62462 ?auto_62459 ) ( ON ?auto_62460 ?auto_62462 ) ( ON ?auto_62461 ?auto_62460 ) ( CLEAR ?auto_62461 ) ( HOLDING ?auto_62464 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62464 )
      ( MAKE-2PILE ?auto_62458 ?auto_62459 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62465 - BLOCK
      ?auto_62466 - BLOCK
    )
    :vars
    (
      ?auto_62469 - BLOCK
      ?auto_62467 - BLOCK
      ?auto_62470 - BLOCK
      ?auto_62471 - BLOCK
      ?auto_62468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62465 ?auto_62466 ) ) ( not ( = ?auto_62465 ?auto_62469 ) ) ( not ( = ?auto_62466 ?auto_62469 ) ) ( ON ?auto_62465 ?auto_62467 ) ( not ( = ?auto_62465 ?auto_62467 ) ) ( not ( = ?auto_62466 ?auto_62467 ) ) ( not ( = ?auto_62469 ?auto_62467 ) ) ( not ( = ?auto_62470 ?auto_62471 ) ) ( not ( = ?auto_62470 ?auto_62468 ) ) ( not ( = ?auto_62470 ?auto_62469 ) ) ( not ( = ?auto_62470 ?auto_62466 ) ) ( not ( = ?auto_62471 ?auto_62468 ) ) ( not ( = ?auto_62471 ?auto_62469 ) ) ( not ( = ?auto_62471 ?auto_62466 ) ) ( not ( = ?auto_62468 ?auto_62469 ) ) ( not ( = ?auto_62468 ?auto_62466 ) ) ( not ( = ?auto_62465 ?auto_62470 ) ) ( not ( = ?auto_62465 ?auto_62471 ) ) ( not ( = ?auto_62465 ?auto_62468 ) ) ( not ( = ?auto_62467 ?auto_62470 ) ) ( not ( = ?auto_62467 ?auto_62471 ) ) ( not ( = ?auto_62467 ?auto_62468 ) ) ( ON ?auto_62466 ?auto_62465 ) ( ON-TABLE ?auto_62467 ) ( ON ?auto_62469 ?auto_62466 ) ( ON ?auto_62468 ?auto_62469 ) ( ON ?auto_62471 ?auto_62468 ) ( ON ?auto_62470 ?auto_62471 ) ( CLEAR ?auto_62470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62467 ?auto_62465 ?auto_62466 ?auto_62469 ?auto_62468 ?auto_62471 )
      ( MAKE-2PILE ?auto_62465 ?auto_62466 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62491 - BLOCK
      ?auto_62492 - BLOCK
      ?auto_62493 - BLOCK
    )
    :vars
    (
      ?auto_62496 - BLOCK
      ?auto_62495 - BLOCK
      ?auto_62494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62496 ?auto_62493 ) ( ON-TABLE ?auto_62491 ) ( ON ?auto_62492 ?auto_62491 ) ( ON ?auto_62493 ?auto_62492 ) ( not ( = ?auto_62491 ?auto_62492 ) ) ( not ( = ?auto_62491 ?auto_62493 ) ) ( not ( = ?auto_62491 ?auto_62496 ) ) ( not ( = ?auto_62492 ?auto_62493 ) ) ( not ( = ?auto_62492 ?auto_62496 ) ) ( not ( = ?auto_62493 ?auto_62496 ) ) ( not ( = ?auto_62491 ?auto_62495 ) ) ( not ( = ?auto_62491 ?auto_62494 ) ) ( not ( = ?auto_62492 ?auto_62495 ) ) ( not ( = ?auto_62492 ?auto_62494 ) ) ( not ( = ?auto_62493 ?auto_62495 ) ) ( not ( = ?auto_62493 ?auto_62494 ) ) ( not ( = ?auto_62496 ?auto_62495 ) ) ( not ( = ?auto_62496 ?auto_62494 ) ) ( not ( = ?auto_62495 ?auto_62494 ) ) ( ON ?auto_62495 ?auto_62496 ) ( CLEAR ?auto_62495 ) ( HOLDING ?auto_62494 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62494 )
      ( MAKE-3PILE ?auto_62491 ?auto_62492 ?auto_62493 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62556 - BLOCK
      ?auto_62557 - BLOCK
      ?auto_62558 - BLOCK
    )
    :vars
    (
      ?auto_62559 - BLOCK
      ?auto_62561 - BLOCK
      ?auto_62560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62556 ) ( not ( = ?auto_62556 ?auto_62557 ) ) ( not ( = ?auto_62556 ?auto_62558 ) ) ( not ( = ?auto_62557 ?auto_62558 ) ) ( ON ?auto_62558 ?auto_62559 ) ( not ( = ?auto_62556 ?auto_62559 ) ) ( not ( = ?auto_62557 ?auto_62559 ) ) ( not ( = ?auto_62558 ?auto_62559 ) ) ( CLEAR ?auto_62556 ) ( ON ?auto_62557 ?auto_62558 ) ( CLEAR ?auto_62557 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62561 ) ( ON ?auto_62560 ?auto_62561 ) ( ON ?auto_62559 ?auto_62560 ) ( not ( = ?auto_62561 ?auto_62560 ) ) ( not ( = ?auto_62561 ?auto_62559 ) ) ( not ( = ?auto_62561 ?auto_62558 ) ) ( not ( = ?auto_62561 ?auto_62557 ) ) ( not ( = ?auto_62560 ?auto_62559 ) ) ( not ( = ?auto_62560 ?auto_62558 ) ) ( not ( = ?auto_62560 ?auto_62557 ) ) ( not ( = ?auto_62556 ?auto_62561 ) ) ( not ( = ?auto_62556 ?auto_62560 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62561 ?auto_62560 ?auto_62559 ?auto_62558 )
      ( MAKE-3PILE ?auto_62556 ?auto_62557 ?auto_62558 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62562 - BLOCK
      ?auto_62563 - BLOCK
      ?auto_62564 - BLOCK
    )
    :vars
    (
      ?auto_62566 - BLOCK
      ?auto_62567 - BLOCK
      ?auto_62565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62562 ?auto_62563 ) ) ( not ( = ?auto_62562 ?auto_62564 ) ) ( not ( = ?auto_62563 ?auto_62564 ) ) ( ON ?auto_62564 ?auto_62566 ) ( not ( = ?auto_62562 ?auto_62566 ) ) ( not ( = ?auto_62563 ?auto_62566 ) ) ( not ( = ?auto_62564 ?auto_62566 ) ) ( ON ?auto_62563 ?auto_62564 ) ( CLEAR ?auto_62563 ) ( ON-TABLE ?auto_62567 ) ( ON ?auto_62565 ?auto_62567 ) ( ON ?auto_62566 ?auto_62565 ) ( not ( = ?auto_62567 ?auto_62565 ) ) ( not ( = ?auto_62567 ?auto_62566 ) ) ( not ( = ?auto_62567 ?auto_62564 ) ) ( not ( = ?auto_62567 ?auto_62563 ) ) ( not ( = ?auto_62565 ?auto_62566 ) ) ( not ( = ?auto_62565 ?auto_62564 ) ) ( not ( = ?auto_62565 ?auto_62563 ) ) ( not ( = ?auto_62562 ?auto_62567 ) ) ( not ( = ?auto_62562 ?auto_62565 ) ) ( HOLDING ?auto_62562 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62562 )
      ( MAKE-3PILE ?auto_62562 ?auto_62563 ?auto_62564 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62568 - BLOCK
      ?auto_62569 - BLOCK
      ?auto_62570 - BLOCK
    )
    :vars
    (
      ?auto_62573 - BLOCK
      ?auto_62571 - BLOCK
      ?auto_62572 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62568 ?auto_62569 ) ) ( not ( = ?auto_62568 ?auto_62570 ) ) ( not ( = ?auto_62569 ?auto_62570 ) ) ( ON ?auto_62570 ?auto_62573 ) ( not ( = ?auto_62568 ?auto_62573 ) ) ( not ( = ?auto_62569 ?auto_62573 ) ) ( not ( = ?auto_62570 ?auto_62573 ) ) ( ON ?auto_62569 ?auto_62570 ) ( ON-TABLE ?auto_62571 ) ( ON ?auto_62572 ?auto_62571 ) ( ON ?auto_62573 ?auto_62572 ) ( not ( = ?auto_62571 ?auto_62572 ) ) ( not ( = ?auto_62571 ?auto_62573 ) ) ( not ( = ?auto_62571 ?auto_62570 ) ) ( not ( = ?auto_62571 ?auto_62569 ) ) ( not ( = ?auto_62572 ?auto_62573 ) ) ( not ( = ?auto_62572 ?auto_62570 ) ) ( not ( = ?auto_62572 ?auto_62569 ) ) ( not ( = ?auto_62568 ?auto_62571 ) ) ( not ( = ?auto_62568 ?auto_62572 ) ) ( ON ?auto_62568 ?auto_62569 ) ( CLEAR ?auto_62568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62571 ?auto_62572 ?auto_62573 ?auto_62570 ?auto_62569 )
      ( MAKE-3PILE ?auto_62568 ?auto_62569 ?auto_62570 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62577 - BLOCK
      ?auto_62578 - BLOCK
      ?auto_62579 - BLOCK
    )
    :vars
    (
      ?auto_62581 - BLOCK
      ?auto_62582 - BLOCK
      ?auto_62580 - BLOCK
      ?auto_62583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62577 ?auto_62578 ) ) ( not ( = ?auto_62577 ?auto_62579 ) ) ( not ( = ?auto_62578 ?auto_62579 ) ) ( ON ?auto_62579 ?auto_62581 ) ( not ( = ?auto_62577 ?auto_62581 ) ) ( not ( = ?auto_62578 ?auto_62581 ) ) ( not ( = ?auto_62579 ?auto_62581 ) ) ( ON ?auto_62578 ?auto_62579 ) ( CLEAR ?auto_62578 ) ( ON-TABLE ?auto_62582 ) ( ON ?auto_62580 ?auto_62582 ) ( ON ?auto_62581 ?auto_62580 ) ( not ( = ?auto_62582 ?auto_62580 ) ) ( not ( = ?auto_62582 ?auto_62581 ) ) ( not ( = ?auto_62582 ?auto_62579 ) ) ( not ( = ?auto_62582 ?auto_62578 ) ) ( not ( = ?auto_62580 ?auto_62581 ) ) ( not ( = ?auto_62580 ?auto_62579 ) ) ( not ( = ?auto_62580 ?auto_62578 ) ) ( not ( = ?auto_62577 ?auto_62582 ) ) ( not ( = ?auto_62577 ?auto_62580 ) ) ( ON ?auto_62577 ?auto_62583 ) ( CLEAR ?auto_62577 ) ( HAND-EMPTY ) ( not ( = ?auto_62577 ?auto_62583 ) ) ( not ( = ?auto_62578 ?auto_62583 ) ) ( not ( = ?auto_62579 ?auto_62583 ) ) ( not ( = ?auto_62581 ?auto_62583 ) ) ( not ( = ?auto_62582 ?auto_62583 ) ) ( not ( = ?auto_62580 ?auto_62583 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62577 ?auto_62583 )
      ( MAKE-3PILE ?auto_62577 ?auto_62578 ?auto_62579 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62584 - BLOCK
      ?auto_62585 - BLOCK
      ?auto_62586 - BLOCK
    )
    :vars
    (
      ?auto_62588 - BLOCK
      ?auto_62587 - BLOCK
      ?auto_62589 - BLOCK
      ?auto_62590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62584 ?auto_62585 ) ) ( not ( = ?auto_62584 ?auto_62586 ) ) ( not ( = ?auto_62585 ?auto_62586 ) ) ( ON ?auto_62586 ?auto_62588 ) ( not ( = ?auto_62584 ?auto_62588 ) ) ( not ( = ?auto_62585 ?auto_62588 ) ) ( not ( = ?auto_62586 ?auto_62588 ) ) ( ON-TABLE ?auto_62587 ) ( ON ?auto_62589 ?auto_62587 ) ( ON ?auto_62588 ?auto_62589 ) ( not ( = ?auto_62587 ?auto_62589 ) ) ( not ( = ?auto_62587 ?auto_62588 ) ) ( not ( = ?auto_62587 ?auto_62586 ) ) ( not ( = ?auto_62587 ?auto_62585 ) ) ( not ( = ?auto_62589 ?auto_62588 ) ) ( not ( = ?auto_62589 ?auto_62586 ) ) ( not ( = ?auto_62589 ?auto_62585 ) ) ( not ( = ?auto_62584 ?auto_62587 ) ) ( not ( = ?auto_62584 ?auto_62589 ) ) ( ON ?auto_62584 ?auto_62590 ) ( CLEAR ?auto_62584 ) ( not ( = ?auto_62584 ?auto_62590 ) ) ( not ( = ?auto_62585 ?auto_62590 ) ) ( not ( = ?auto_62586 ?auto_62590 ) ) ( not ( = ?auto_62588 ?auto_62590 ) ) ( not ( = ?auto_62587 ?auto_62590 ) ) ( not ( = ?auto_62589 ?auto_62590 ) ) ( HOLDING ?auto_62585 ) ( CLEAR ?auto_62586 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62587 ?auto_62589 ?auto_62588 ?auto_62586 ?auto_62585 )
      ( MAKE-3PILE ?auto_62584 ?auto_62585 ?auto_62586 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62591 - BLOCK
      ?auto_62592 - BLOCK
      ?auto_62593 - BLOCK
    )
    :vars
    (
      ?auto_62596 - BLOCK
      ?auto_62595 - BLOCK
      ?auto_62594 - BLOCK
      ?auto_62597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62591 ?auto_62592 ) ) ( not ( = ?auto_62591 ?auto_62593 ) ) ( not ( = ?auto_62592 ?auto_62593 ) ) ( ON ?auto_62593 ?auto_62596 ) ( not ( = ?auto_62591 ?auto_62596 ) ) ( not ( = ?auto_62592 ?auto_62596 ) ) ( not ( = ?auto_62593 ?auto_62596 ) ) ( ON-TABLE ?auto_62595 ) ( ON ?auto_62594 ?auto_62595 ) ( ON ?auto_62596 ?auto_62594 ) ( not ( = ?auto_62595 ?auto_62594 ) ) ( not ( = ?auto_62595 ?auto_62596 ) ) ( not ( = ?auto_62595 ?auto_62593 ) ) ( not ( = ?auto_62595 ?auto_62592 ) ) ( not ( = ?auto_62594 ?auto_62596 ) ) ( not ( = ?auto_62594 ?auto_62593 ) ) ( not ( = ?auto_62594 ?auto_62592 ) ) ( not ( = ?auto_62591 ?auto_62595 ) ) ( not ( = ?auto_62591 ?auto_62594 ) ) ( ON ?auto_62591 ?auto_62597 ) ( not ( = ?auto_62591 ?auto_62597 ) ) ( not ( = ?auto_62592 ?auto_62597 ) ) ( not ( = ?auto_62593 ?auto_62597 ) ) ( not ( = ?auto_62596 ?auto_62597 ) ) ( not ( = ?auto_62595 ?auto_62597 ) ) ( not ( = ?auto_62594 ?auto_62597 ) ) ( CLEAR ?auto_62593 ) ( ON ?auto_62592 ?auto_62591 ) ( CLEAR ?auto_62592 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62597 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62597 ?auto_62591 )
      ( MAKE-3PILE ?auto_62591 ?auto_62592 ?auto_62593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62598 - BLOCK
      ?auto_62599 - BLOCK
      ?auto_62600 - BLOCK
    )
    :vars
    (
      ?auto_62603 - BLOCK
      ?auto_62602 - BLOCK
      ?auto_62604 - BLOCK
      ?auto_62601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62598 ?auto_62599 ) ) ( not ( = ?auto_62598 ?auto_62600 ) ) ( not ( = ?auto_62599 ?auto_62600 ) ) ( not ( = ?auto_62598 ?auto_62603 ) ) ( not ( = ?auto_62599 ?auto_62603 ) ) ( not ( = ?auto_62600 ?auto_62603 ) ) ( ON-TABLE ?auto_62602 ) ( ON ?auto_62604 ?auto_62602 ) ( ON ?auto_62603 ?auto_62604 ) ( not ( = ?auto_62602 ?auto_62604 ) ) ( not ( = ?auto_62602 ?auto_62603 ) ) ( not ( = ?auto_62602 ?auto_62600 ) ) ( not ( = ?auto_62602 ?auto_62599 ) ) ( not ( = ?auto_62604 ?auto_62603 ) ) ( not ( = ?auto_62604 ?auto_62600 ) ) ( not ( = ?auto_62604 ?auto_62599 ) ) ( not ( = ?auto_62598 ?auto_62602 ) ) ( not ( = ?auto_62598 ?auto_62604 ) ) ( ON ?auto_62598 ?auto_62601 ) ( not ( = ?auto_62598 ?auto_62601 ) ) ( not ( = ?auto_62599 ?auto_62601 ) ) ( not ( = ?auto_62600 ?auto_62601 ) ) ( not ( = ?auto_62603 ?auto_62601 ) ) ( not ( = ?auto_62602 ?auto_62601 ) ) ( not ( = ?auto_62604 ?auto_62601 ) ) ( ON ?auto_62599 ?auto_62598 ) ( CLEAR ?auto_62599 ) ( ON-TABLE ?auto_62601 ) ( HOLDING ?auto_62600 ) ( CLEAR ?auto_62603 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62602 ?auto_62604 ?auto_62603 ?auto_62600 )
      ( MAKE-3PILE ?auto_62598 ?auto_62599 ?auto_62600 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62605 - BLOCK
      ?auto_62606 - BLOCK
      ?auto_62607 - BLOCK
    )
    :vars
    (
      ?auto_62611 - BLOCK
      ?auto_62608 - BLOCK
      ?auto_62610 - BLOCK
      ?auto_62609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62605 ?auto_62606 ) ) ( not ( = ?auto_62605 ?auto_62607 ) ) ( not ( = ?auto_62606 ?auto_62607 ) ) ( not ( = ?auto_62605 ?auto_62611 ) ) ( not ( = ?auto_62606 ?auto_62611 ) ) ( not ( = ?auto_62607 ?auto_62611 ) ) ( ON-TABLE ?auto_62608 ) ( ON ?auto_62610 ?auto_62608 ) ( ON ?auto_62611 ?auto_62610 ) ( not ( = ?auto_62608 ?auto_62610 ) ) ( not ( = ?auto_62608 ?auto_62611 ) ) ( not ( = ?auto_62608 ?auto_62607 ) ) ( not ( = ?auto_62608 ?auto_62606 ) ) ( not ( = ?auto_62610 ?auto_62611 ) ) ( not ( = ?auto_62610 ?auto_62607 ) ) ( not ( = ?auto_62610 ?auto_62606 ) ) ( not ( = ?auto_62605 ?auto_62608 ) ) ( not ( = ?auto_62605 ?auto_62610 ) ) ( ON ?auto_62605 ?auto_62609 ) ( not ( = ?auto_62605 ?auto_62609 ) ) ( not ( = ?auto_62606 ?auto_62609 ) ) ( not ( = ?auto_62607 ?auto_62609 ) ) ( not ( = ?auto_62611 ?auto_62609 ) ) ( not ( = ?auto_62608 ?auto_62609 ) ) ( not ( = ?auto_62610 ?auto_62609 ) ) ( ON ?auto_62606 ?auto_62605 ) ( ON-TABLE ?auto_62609 ) ( CLEAR ?auto_62611 ) ( ON ?auto_62607 ?auto_62606 ) ( CLEAR ?auto_62607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62609 ?auto_62605 ?auto_62606 )
      ( MAKE-3PILE ?auto_62605 ?auto_62606 ?auto_62607 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62612 - BLOCK
      ?auto_62613 - BLOCK
      ?auto_62614 - BLOCK
    )
    :vars
    (
      ?auto_62616 - BLOCK
      ?auto_62615 - BLOCK
      ?auto_62617 - BLOCK
      ?auto_62618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62612 ?auto_62613 ) ) ( not ( = ?auto_62612 ?auto_62614 ) ) ( not ( = ?auto_62613 ?auto_62614 ) ) ( not ( = ?auto_62612 ?auto_62616 ) ) ( not ( = ?auto_62613 ?auto_62616 ) ) ( not ( = ?auto_62614 ?auto_62616 ) ) ( ON-TABLE ?auto_62615 ) ( ON ?auto_62617 ?auto_62615 ) ( not ( = ?auto_62615 ?auto_62617 ) ) ( not ( = ?auto_62615 ?auto_62616 ) ) ( not ( = ?auto_62615 ?auto_62614 ) ) ( not ( = ?auto_62615 ?auto_62613 ) ) ( not ( = ?auto_62617 ?auto_62616 ) ) ( not ( = ?auto_62617 ?auto_62614 ) ) ( not ( = ?auto_62617 ?auto_62613 ) ) ( not ( = ?auto_62612 ?auto_62615 ) ) ( not ( = ?auto_62612 ?auto_62617 ) ) ( ON ?auto_62612 ?auto_62618 ) ( not ( = ?auto_62612 ?auto_62618 ) ) ( not ( = ?auto_62613 ?auto_62618 ) ) ( not ( = ?auto_62614 ?auto_62618 ) ) ( not ( = ?auto_62616 ?auto_62618 ) ) ( not ( = ?auto_62615 ?auto_62618 ) ) ( not ( = ?auto_62617 ?auto_62618 ) ) ( ON ?auto_62613 ?auto_62612 ) ( ON-TABLE ?auto_62618 ) ( ON ?auto_62614 ?auto_62613 ) ( CLEAR ?auto_62614 ) ( HOLDING ?auto_62616 ) ( CLEAR ?auto_62617 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62615 ?auto_62617 ?auto_62616 )
      ( MAKE-3PILE ?auto_62612 ?auto_62613 ?auto_62614 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62619 - BLOCK
      ?auto_62620 - BLOCK
      ?auto_62621 - BLOCK
    )
    :vars
    (
      ?auto_62625 - BLOCK
      ?auto_62622 - BLOCK
      ?auto_62624 - BLOCK
      ?auto_62623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62619 ?auto_62620 ) ) ( not ( = ?auto_62619 ?auto_62621 ) ) ( not ( = ?auto_62620 ?auto_62621 ) ) ( not ( = ?auto_62619 ?auto_62625 ) ) ( not ( = ?auto_62620 ?auto_62625 ) ) ( not ( = ?auto_62621 ?auto_62625 ) ) ( ON-TABLE ?auto_62622 ) ( ON ?auto_62624 ?auto_62622 ) ( not ( = ?auto_62622 ?auto_62624 ) ) ( not ( = ?auto_62622 ?auto_62625 ) ) ( not ( = ?auto_62622 ?auto_62621 ) ) ( not ( = ?auto_62622 ?auto_62620 ) ) ( not ( = ?auto_62624 ?auto_62625 ) ) ( not ( = ?auto_62624 ?auto_62621 ) ) ( not ( = ?auto_62624 ?auto_62620 ) ) ( not ( = ?auto_62619 ?auto_62622 ) ) ( not ( = ?auto_62619 ?auto_62624 ) ) ( ON ?auto_62619 ?auto_62623 ) ( not ( = ?auto_62619 ?auto_62623 ) ) ( not ( = ?auto_62620 ?auto_62623 ) ) ( not ( = ?auto_62621 ?auto_62623 ) ) ( not ( = ?auto_62625 ?auto_62623 ) ) ( not ( = ?auto_62622 ?auto_62623 ) ) ( not ( = ?auto_62624 ?auto_62623 ) ) ( ON ?auto_62620 ?auto_62619 ) ( ON-TABLE ?auto_62623 ) ( ON ?auto_62621 ?auto_62620 ) ( CLEAR ?auto_62624 ) ( ON ?auto_62625 ?auto_62621 ) ( CLEAR ?auto_62625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62623 ?auto_62619 ?auto_62620 ?auto_62621 )
      ( MAKE-3PILE ?auto_62619 ?auto_62620 ?auto_62621 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62626 - BLOCK
      ?auto_62627 - BLOCK
      ?auto_62628 - BLOCK
    )
    :vars
    (
      ?auto_62631 - BLOCK
      ?auto_62629 - BLOCK
      ?auto_62630 - BLOCK
      ?auto_62632 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62626 ?auto_62627 ) ) ( not ( = ?auto_62626 ?auto_62628 ) ) ( not ( = ?auto_62627 ?auto_62628 ) ) ( not ( = ?auto_62626 ?auto_62631 ) ) ( not ( = ?auto_62627 ?auto_62631 ) ) ( not ( = ?auto_62628 ?auto_62631 ) ) ( ON-TABLE ?auto_62629 ) ( not ( = ?auto_62629 ?auto_62630 ) ) ( not ( = ?auto_62629 ?auto_62631 ) ) ( not ( = ?auto_62629 ?auto_62628 ) ) ( not ( = ?auto_62629 ?auto_62627 ) ) ( not ( = ?auto_62630 ?auto_62631 ) ) ( not ( = ?auto_62630 ?auto_62628 ) ) ( not ( = ?auto_62630 ?auto_62627 ) ) ( not ( = ?auto_62626 ?auto_62629 ) ) ( not ( = ?auto_62626 ?auto_62630 ) ) ( ON ?auto_62626 ?auto_62632 ) ( not ( = ?auto_62626 ?auto_62632 ) ) ( not ( = ?auto_62627 ?auto_62632 ) ) ( not ( = ?auto_62628 ?auto_62632 ) ) ( not ( = ?auto_62631 ?auto_62632 ) ) ( not ( = ?auto_62629 ?auto_62632 ) ) ( not ( = ?auto_62630 ?auto_62632 ) ) ( ON ?auto_62627 ?auto_62626 ) ( ON-TABLE ?auto_62632 ) ( ON ?auto_62628 ?auto_62627 ) ( ON ?auto_62631 ?auto_62628 ) ( CLEAR ?auto_62631 ) ( HOLDING ?auto_62630 ) ( CLEAR ?auto_62629 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62629 ?auto_62630 )
      ( MAKE-3PILE ?auto_62626 ?auto_62627 ?auto_62628 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62633 - BLOCK
      ?auto_62634 - BLOCK
      ?auto_62635 - BLOCK
    )
    :vars
    (
      ?auto_62636 - BLOCK
      ?auto_62639 - BLOCK
      ?auto_62637 - BLOCK
      ?auto_62638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62633 ?auto_62634 ) ) ( not ( = ?auto_62633 ?auto_62635 ) ) ( not ( = ?auto_62634 ?auto_62635 ) ) ( not ( = ?auto_62633 ?auto_62636 ) ) ( not ( = ?auto_62634 ?auto_62636 ) ) ( not ( = ?auto_62635 ?auto_62636 ) ) ( ON-TABLE ?auto_62639 ) ( not ( = ?auto_62639 ?auto_62637 ) ) ( not ( = ?auto_62639 ?auto_62636 ) ) ( not ( = ?auto_62639 ?auto_62635 ) ) ( not ( = ?auto_62639 ?auto_62634 ) ) ( not ( = ?auto_62637 ?auto_62636 ) ) ( not ( = ?auto_62637 ?auto_62635 ) ) ( not ( = ?auto_62637 ?auto_62634 ) ) ( not ( = ?auto_62633 ?auto_62639 ) ) ( not ( = ?auto_62633 ?auto_62637 ) ) ( ON ?auto_62633 ?auto_62638 ) ( not ( = ?auto_62633 ?auto_62638 ) ) ( not ( = ?auto_62634 ?auto_62638 ) ) ( not ( = ?auto_62635 ?auto_62638 ) ) ( not ( = ?auto_62636 ?auto_62638 ) ) ( not ( = ?auto_62639 ?auto_62638 ) ) ( not ( = ?auto_62637 ?auto_62638 ) ) ( ON ?auto_62634 ?auto_62633 ) ( ON-TABLE ?auto_62638 ) ( ON ?auto_62635 ?auto_62634 ) ( ON ?auto_62636 ?auto_62635 ) ( CLEAR ?auto_62639 ) ( ON ?auto_62637 ?auto_62636 ) ( CLEAR ?auto_62637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62638 ?auto_62633 ?auto_62634 ?auto_62635 ?auto_62636 )
      ( MAKE-3PILE ?auto_62633 ?auto_62634 ?auto_62635 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62640 - BLOCK
      ?auto_62641 - BLOCK
      ?auto_62642 - BLOCK
    )
    :vars
    (
      ?auto_62644 - BLOCK
      ?auto_62643 - BLOCK
      ?auto_62645 - BLOCK
      ?auto_62646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62640 ?auto_62641 ) ) ( not ( = ?auto_62640 ?auto_62642 ) ) ( not ( = ?auto_62641 ?auto_62642 ) ) ( not ( = ?auto_62640 ?auto_62644 ) ) ( not ( = ?auto_62641 ?auto_62644 ) ) ( not ( = ?auto_62642 ?auto_62644 ) ) ( not ( = ?auto_62643 ?auto_62645 ) ) ( not ( = ?auto_62643 ?auto_62644 ) ) ( not ( = ?auto_62643 ?auto_62642 ) ) ( not ( = ?auto_62643 ?auto_62641 ) ) ( not ( = ?auto_62645 ?auto_62644 ) ) ( not ( = ?auto_62645 ?auto_62642 ) ) ( not ( = ?auto_62645 ?auto_62641 ) ) ( not ( = ?auto_62640 ?auto_62643 ) ) ( not ( = ?auto_62640 ?auto_62645 ) ) ( ON ?auto_62640 ?auto_62646 ) ( not ( = ?auto_62640 ?auto_62646 ) ) ( not ( = ?auto_62641 ?auto_62646 ) ) ( not ( = ?auto_62642 ?auto_62646 ) ) ( not ( = ?auto_62644 ?auto_62646 ) ) ( not ( = ?auto_62643 ?auto_62646 ) ) ( not ( = ?auto_62645 ?auto_62646 ) ) ( ON ?auto_62641 ?auto_62640 ) ( ON-TABLE ?auto_62646 ) ( ON ?auto_62642 ?auto_62641 ) ( ON ?auto_62644 ?auto_62642 ) ( ON ?auto_62645 ?auto_62644 ) ( CLEAR ?auto_62645 ) ( HOLDING ?auto_62643 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62643 )
      ( MAKE-3PILE ?auto_62640 ?auto_62641 ?auto_62642 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62647 - BLOCK
      ?auto_62648 - BLOCK
      ?auto_62649 - BLOCK
    )
    :vars
    (
      ?auto_62653 - BLOCK
      ?auto_62652 - BLOCK
      ?auto_62650 - BLOCK
      ?auto_62651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62647 ?auto_62648 ) ) ( not ( = ?auto_62647 ?auto_62649 ) ) ( not ( = ?auto_62648 ?auto_62649 ) ) ( not ( = ?auto_62647 ?auto_62653 ) ) ( not ( = ?auto_62648 ?auto_62653 ) ) ( not ( = ?auto_62649 ?auto_62653 ) ) ( not ( = ?auto_62652 ?auto_62650 ) ) ( not ( = ?auto_62652 ?auto_62653 ) ) ( not ( = ?auto_62652 ?auto_62649 ) ) ( not ( = ?auto_62652 ?auto_62648 ) ) ( not ( = ?auto_62650 ?auto_62653 ) ) ( not ( = ?auto_62650 ?auto_62649 ) ) ( not ( = ?auto_62650 ?auto_62648 ) ) ( not ( = ?auto_62647 ?auto_62652 ) ) ( not ( = ?auto_62647 ?auto_62650 ) ) ( ON ?auto_62647 ?auto_62651 ) ( not ( = ?auto_62647 ?auto_62651 ) ) ( not ( = ?auto_62648 ?auto_62651 ) ) ( not ( = ?auto_62649 ?auto_62651 ) ) ( not ( = ?auto_62653 ?auto_62651 ) ) ( not ( = ?auto_62652 ?auto_62651 ) ) ( not ( = ?auto_62650 ?auto_62651 ) ) ( ON ?auto_62648 ?auto_62647 ) ( ON-TABLE ?auto_62651 ) ( ON ?auto_62649 ?auto_62648 ) ( ON ?auto_62653 ?auto_62649 ) ( ON ?auto_62650 ?auto_62653 ) ( ON ?auto_62652 ?auto_62650 ) ( CLEAR ?auto_62652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62651 ?auto_62647 ?auto_62648 ?auto_62649 ?auto_62653 ?auto_62650 )
      ( MAKE-3PILE ?auto_62647 ?auto_62648 ?auto_62649 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62669 - BLOCK
      ?auto_62670 - BLOCK
    )
    :vars
    (
      ?auto_62672 - BLOCK
      ?auto_62671 - BLOCK
      ?auto_62673 - BLOCK
      ?auto_62674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62672 ?auto_62670 ) ( ON-TABLE ?auto_62669 ) ( ON ?auto_62670 ?auto_62669 ) ( not ( = ?auto_62669 ?auto_62670 ) ) ( not ( = ?auto_62669 ?auto_62672 ) ) ( not ( = ?auto_62670 ?auto_62672 ) ) ( not ( = ?auto_62669 ?auto_62671 ) ) ( not ( = ?auto_62669 ?auto_62673 ) ) ( not ( = ?auto_62670 ?auto_62671 ) ) ( not ( = ?auto_62670 ?auto_62673 ) ) ( not ( = ?auto_62672 ?auto_62671 ) ) ( not ( = ?auto_62672 ?auto_62673 ) ) ( not ( = ?auto_62671 ?auto_62673 ) ) ( ON ?auto_62671 ?auto_62672 ) ( CLEAR ?auto_62671 ) ( HOLDING ?auto_62673 ) ( CLEAR ?auto_62674 ) ( ON-TABLE ?auto_62674 ) ( not ( = ?auto_62674 ?auto_62673 ) ) ( not ( = ?auto_62669 ?auto_62674 ) ) ( not ( = ?auto_62670 ?auto_62674 ) ) ( not ( = ?auto_62672 ?auto_62674 ) ) ( not ( = ?auto_62671 ?auto_62674 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62674 ?auto_62673 )
      ( MAKE-2PILE ?auto_62669 ?auto_62670 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62675 - BLOCK
      ?auto_62676 - BLOCK
    )
    :vars
    (
      ?auto_62680 - BLOCK
      ?auto_62677 - BLOCK
      ?auto_62679 - BLOCK
      ?auto_62678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62680 ?auto_62676 ) ( ON-TABLE ?auto_62675 ) ( ON ?auto_62676 ?auto_62675 ) ( not ( = ?auto_62675 ?auto_62676 ) ) ( not ( = ?auto_62675 ?auto_62680 ) ) ( not ( = ?auto_62676 ?auto_62680 ) ) ( not ( = ?auto_62675 ?auto_62677 ) ) ( not ( = ?auto_62675 ?auto_62679 ) ) ( not ( = ?auto_62676 ?auto_62677 ) ) ( not ( = ?auto_62676 ?auto_62679 ) ) ( not ( = ?auto_62680 ?auto_62677 ) ) ( not ( = ?auto_62680 ?auto_62679 ) ) ( not ( = ?auto_62677 ?auto_62679 ) ) ( ON ?auto_62677 ?auto_62680 ) ( CLEAR ?auto_62678 ) ( ON-TABLE ?auto_62678 ) ( not ( = ?auto_62678 ?auto_62679 ) ) ( not ( = ?auto_62675 ?auto_62678 ) ) ( not ( = ?auto_62676 ?auto_62678 ) ) ( not ( = ?auto_62680 ?auto_62678 ) ) ( not ( = ?auto_62677 ?auto_62678 ) ) ( ON ?auto_62679 ?auto_62677 ) ( CLEAR ?auto_62679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62675 ?auto_62676 ?auto_62680 ?auto_62677 )
      ( MAKE-2PILE ?auto_62675 ?auto_62676 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62681 - BLOCK
      ?auto_62682 - BLOCK
    )
    :vars
    (
      ?auto_62686 - BLOCK
      ?auto_62683 - BLOCK
      ?auto_62684 - BLOCK
      ?auto_62685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62686 ?auto_62682 ) ( ON-TABLE ?auto_62681 ) ( ON ?auto_62682 ?auto_62681 ) ( not ( = ?auto_62681 ?auto_62682 ) ) ( not ( = ?auto_62681 ?auto_62686 ) ) ( not ( = ?auto_62682 ?auto_62686 ) ) ( not ( = ?auto_62681 ?auto_62683 ) ) ( not ( = ?auto_62681 ?auto_62684 ) ) ( not ( = ?auto_62682 ?auto_62683 ) ) ( not ( = ?auto_62682 ?auto_62684 ) ) ( not ( = ?auto_62686 ?auto_62683 ) ) ( not ( = ?auto_62686 ?auto_62684 ) ) ( not ( = ?auto_62683 ?auto_62684 ) ) ( ON ?auto_62683 ?auto_62686 ) ( not ( = ?auto_62685 ?auto_62684 ) ) ( not ( = ?auto_62681 ?auto_62685 ) ) ( not ( = ?auto_62682 ?auto_62685 ) ) ( not ( = ?auto_62686 ?auto_62685 ) ) ( not ( = ?auto_62683 ?auto_62685 ) ) ( ON ?auto_62684 ?auto_62683 ) ( CLEAR ?auto_62684 ) ( HOLDING ?auto_62685 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62685 )
      ( MAKE-2PILE ?auto_62681 ?auto_62682 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62695 - BLOCK
      ?auto_62696 - BLOCK
    )
    :vars
    (
      ?auto_62699 - BLOCK
      ?auto_62697 - BLOCK
      ?auto_62700 - BLOCK
      ?auto_62698 - BLOCK
      ?auto_62701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62699 ?auto_62696 ) ( ON-TABLE ?auto_62695 ) ( ON ?auto_62696 ?auto_62695 ) ( not ( = ?auto_62695 ?auto_62696 ) ) ( not ( = ?auto_62695 ?auto_62699 ) ) ( not ( = ?auto_62696 ?auto_62699 ) ) ( not ( = ?auto_62695 ?auto_62697 ) ) ( not ( = ?auto_62695 ?auto_62700 ) ) ( not ( = ?auto_62696 ?auto_62697 ) ) ( not ( = ?auto_62696 ?auto_62700 ) ) ( not ( = ?auto_62699 ?auto_62697 ) ) ( not ( = ?auto_62699 ?auto_62700 ) ) ( not ( = ?auto_62697 ?auto_62700 ) ) ( ON ?auto_62697 ?auto_62699 ) ( not ( = ?auto_62698 ?auto_62700 ) ) ( not ( = ?auto_62695 ?auto_62698 ) ) ( not ( = ?auto_62696 ?auto_62698 ) ) ( not ( = ?auto_62699 ?auto_62698 ) ) ( not ( = ?auto_62697 ?auto_62698 ) ) ( ON ?auto_62700 ?auto_62697 ) ( CLEAR ?auto_62700 ) ( ON ?auto_62698 ?auto_62701 ) ( CLEAR ?auto_62698 ) ( HAND-EMPTY ) ( not ( = ?auto_62695 ?auto_62701 ) ) ( not ( = ?auto_62696 ?auto_62701 ) ) ( not ( = ?auto_62699 ?auto_62701 ) ) ( not ( = ?auto_62697 ?auto_62701 ) ) ( not ( = ?auto_62700 ?auto_62701 ) ) ( not ( = ?auto_62698 ?auto_62701 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62698 ?auto_62701 )
      ( MAKE-2PILE ?auto_62695 ?auto_62696 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62702 - BLOCK
      ?auto_62703 - BLOCK
    )
    :vars
    (
      ?auto_62708 - BLOCK
      ?auto_62706 - BLOCK
      ?auto_62707 - BLOCK
      ?auto_62705 - BLOCK
      ?auto_62704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62708 ?auto_62703 ) ( ON-TABLE ?auto_62702 ) ( ON ?auto_62703 ?auto_62702 ) ( not ( = ?auto_62702 ?auto_62703 ) ) ( not ( = ?auto_62702 ?auto_62708 ) ) ( not ( = ?auto_62703 ?auto_62708 ) ) ( not ( = ?auto_62702 ?auto_62706 ) ) ( not ( = ?auto_62702 ?auto_62707 ) ) ( not ( = ?auto_62703 ?auto_62706 ) ) ( not ( = ?auto_62703 ?auto_62707 ) ) ( not ( = ?auto_62708 ?auto_62706 ) ) ( not ( = ?auto_62708 ?auto_62707 ) ) ( not ( = ?auto_62706 ?auto_62707 ) ) ( ON ?auto_62706 ?auto_62708 ) ( not ( = ?auto_62705 ?auto_62707 ) ) ( not ( = ?auto_62702 ?auto_62705 ) ) ( not ( = ?auto_62703 ?auto_62705 ) ) ( not ( = ?auto_62708 ?auto_62705 ) ) ( not ( = ?auto_62706 ?auto_62705 ) ) ( ON ?auto_62705 ?auto_62704 ) ( CLEAR ?auto_62705 ) ( not ( = ?auto_62702 ?auto_62704 ) ) ( not ( = ?auto_62703 ?auto_62704 ) ) ( not ( = ?auto_62708 ?auto_62704 ) ) ( not ( = ?auto_62706 ?auto_62704 ) ) ( not ( = ?auto_62707 ?auto_62704 ) ) ( not ( = ?auto_62705 ?auto_62704 ) ) ( HOLDING ?auto_62707 ) ( CLEAR ?auto_62706 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62702 ?auto_62703 ?auto_62708 ?auto_62706 ?auto_62707 )
      ( MAKE-2PILE ?auto_62702 ?auto_62703 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62748 - BLOCK
      ?auto_62749 - BLOCK
      ?auto_62750 - BLOCK
      ?auto_62751 - BLOCK
    )
    :vars
    (
      ?auto_62752 - BLOCK
      ?auto_62753 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62748 ) ( ON ?auto_62749 ?auto_62748 ) ( not ( = ?auto_62748 ?auto_62749 ) ) ( not ( = ?auto_62748 ?auto_62750 ) ) ( not ( = ?auto_62748 ?auto_62751 ) ) ( not ( = ?auto_62749 ?auto_62750 ) ) ( not ( = ?auto_62749 ?auto_62751 ) ) ( not ( = ?auto_62750 ?auto_62751 ) ) ( ON ?auto_62751 ?auto_62752 ) ( not ( = ?auto_62748 ?auto_62752 ) ) ( not ( = ?auto_62749 ?auto_62752 ) ) ( not ( = ?auto_62750 ?auto_62752 ) ) ( not ( = ?auto_62751 ?auto_62752 ) ) ( CLEAR ?auto_62749 ) ( ON ?auto_62750 ?auto_62751 ) ( CLEAR ?auto_62750 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62753 ) ( ON ?auto_62752 ?auto_62753 ) ( not ( = ?auto_62753 ?auto_62752 ) ) ( not ( = ?auto_62753 ?auto_62751 ) ) ( not ( = ?auto_62753 ?auto_62750 ) ) ( not ( = ?auto_62748 ?auto_62753 ) ) ( not ( = ?auto_62749 ?auto_62753 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62753 ?auto_62752 ?auto_62751 )
      ( MAKE-4PILE ?auto_62748 ?auto_62749 ?auto_62750 ?auto_62751 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62754 - BLOCK
      ?auto_62755 - BLOCK
      ?auto_62756 - BLOCK
      ?auto_62757 - BLOCK
    )
    :vars
    (
      ?auto_62759 - BLOCK
      ?auto_62758 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62754 ) ( not ( = ?auto_62754 ?auto_62755 ) ) ( not ( = ?auto_62754 ?auto_62756 ) ) ( not ( = ?auto_62754 ?auto_62757 ) ) ( not ( = ?auto_62755 ?auto_62756 ) ) ( not ( = ?auto_62755 ?auto_62757 ) ) ( not ( = ?auto_62756 ?auto_62757 ) ) ( ON ?auto_62757 ?auto_62759 ) ( not ( = ?auto_62754 ?auto_62759 ) ) ( not ( = ?auto_62755 ?auto_62759 ) ) ( not ( = ?auto_62756 ?auto_62759 ) ) ( not ( = ?auto_62757 ?auto_62759 ) ) ( ON ?auto_62756 ?auto_62757 ) ( CLEAR ?auto_62756 ) ( ON-TABLE ?auto_62758 ) ( ON ?auto_62759 ?auto_62758 ) ( not ( = ?auto_62758 ?auto_62759 ) ) ( not ( = ?auto_62758 ?auto_62757 ) ) ( not ( = ?auto_62758 ?auto_62756 ) ) ( not ( = ?auto_62754 ?auto_62758 ) ) ( not ( = ?auto_62755 ?auto_62758 ) ) ( HOLDING ?auto_62755 ) ( CLEAR ?auto_62754 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62754 ?auto_62755 )
      ( MAKE-4PILE ?auto_62754 ?auto_62755 ?auto_62756 ?auto_62757 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62760 - BLOCK
      ?auto_62761 - BLOCK
      ?auto_62762 - BLOCK
      ?auto_62763 - BLOCK
    )
    :vars
    (
      ?auto_62765 - BLOCK
      ?auto_62764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62760 ) ( not ( = ?auto_62760 ?auto_62761 ) ) ( not ( = ?auto_62760 ?auto_62762 ) ) ( not ( = ?auto_62760 ?auto_62763 ) ) ( not ( = ?auto_62761 ?auto_62762 ) ) ( not ( = ?auto_62761 ?auto_62763 ) ) ( not ( = ?auto_62762 ?auto_62763 ) ) ( ON ?auto_62763 ?auto_62765 ) ( not ( = ?auto_62760 ?auto_62765 ) ) ( not ( = ?auto_62761 ?auto_62765 ) ) ( not ( = ?auto_62762 ?auto_62765 ) ) ( not ( = ?auto_62763 ?auto_62765 ) ) ( ON ?auto_62762 ?auto_62763 ) ( ON-TABLE ?auto_62764 ) ( ON ?auto_62765 ?auto_62764 ) ( not ( = ?auto_62764 ?auto_62765 ) ) ( not ( = ?auto_62764 ?auto_62763 ) ) ( not ( = ?auto_62764 ?auto_62762 ) ) ( not ( = ?auto_62760 ?auto_62764 ) ) ( not ( = ?auto_62761 ?auto_62764 ) ) ( CLEAR ?auto_62760 ) ( ON ?auto_62761 ?auto_62762 ) ( CLEAR ?auto_62761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62764 ?auto_62765 ?auto_62763 ?auto_62762 )
      ( MAKE-4PILE ?auto_62760 ?auto_62761 ?auto_62762 ?auto_62763 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62766 - BLOCK
      ?auto_62767 - BLOCK
      ?auto_62768 - BLOCK
      ?auto_62769 - BLOCK
    )
    :vars
    (
      ?auto_62771 - BLOCK
      ?auto_62770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62766 ?auto_62767 ) ) ( not ( = ?auto_62766 ?auto_62768 ) ) ( not ( = ?auto_62766 ?auto_62769 ) ) ( not ( = ?auto_62767 ?auto_62768 ) ) ( not ( = ?auto_62767 ?auto_62769 ) ) ( not ( = ?auto_62768 ?auto_62769 ) ) ( ON ?auto_62769 ?auto_62771 ) ( not ( = ?auto_62766 ?auto_62771 ) ) ( not ( = ?auto_62767 ?auto_62771 ) ) ( not ( = ?auto_62768 ?auto_62771 ) ) ( not ( = ?auto_62769 ?auto_62771 ) ) ( ON ?auto_62768 ?auto_62769 ) ( ON-TABLE ?auto_62770 ) ( ON ?auto_62771 ?auto_62770 ) ( not ( = ?auto_62770 ?auto_62771 ) ) ( not ( = ?auto_62770 ?auto_62769 ) ) ( not ( = ?auto_62770 ?auto_62768 ) ) ( not ( = ?auto_62766 ?auto_62770 ) ) ( not ( = ?auto_62767 ?auto_62770 ) ) ( ON ?auto_62767 ?auto_62768 ) ( CLEAR ?auto_62767 ) ( HOLDING ?auto_62766 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62766 )
      ( MAKE-4PILE ?auto_62766 ?auto_62767 ?auto_62768 ?auto_62769 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62772 - BLOCK
      ?auto_62773 - BLOCK
      ?auto_62774 - BLOCK
      ?auto_62775 - BLOCK
    )
    :vars
    (
      ?auto_62776 - BLOCK
      ?auto_62777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62772 ?auto_62773 ) ) ( not ( = ?auto_62772 ?auto_62774 ) ) ( not ( = ?auto_62772 ?auto_62775 ) ) ( not ( = ?auto_62773 ?auto_62774 ) ) ( not ( = ?auto_62773 ?auto_62775 ) ) ( not ( = ?auto_62774 ?auto_62775 ) ) ( ON ?auto_62775 ?auto_62776 ) ( not ( = ?auto_62772 ?auto_62776 ) ) ( not ( = ?auto_62773 ?auto_62776 ) ) ( not ( = ?auto_62774 ?auto_62776 ) ) ( not ( = ?auto_62775 ?auto_62776 ) ) ( ON ?auto_62774 ?auto_62775 ) ( ON-TABLE ?auto_62777 ) ( ON ?auto_62776 ?auto_62777 ) ( not ( = ?auto_62777 ?auto_62776 ) ) ( not ( = ?auto_62777 ?auto_62775 ) ) ( not ( = ?auto_62777 ?auto_62774 ) ) ( not ( = ?auto_62772 ?auto_62777 ) ) ( not ( = ?auto_62773 ?auto_62777 ) ) ( ON ?auto_62773 ?auto_62774 ) ( ON ?auto_62772 ?auto_62773 ) ( CLEAR ?auto_62772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62777 ?auto_62776 ?auto_62775 ?auto_62774 ?auto_62773 )
      ( MAKE-4PILE ?auto_62772 ?auto_62773 ?auto_62774 ?auto_62775 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62782 - BLOCK
      ?auto_62783 - BLOCK
      ?auto_62784 - BLOCK
      ?auto_62785 - BLOCK
    )
    :vars
    (
      ?auto_62786 - BLOCK
      ?auto_62787 - BLOCK
      ?auto_62788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62782 ?auto_62783 ) ) ( not ( = ?auto_62782 ?auto_62784 ) ) ( not ( = ?auto_62782 ?auto_62785 ) ) ( not ( = ?auto_62783 ?auto_62784 ) ) ( not ( = ?auto_62783 ?auto_62785 ) ) ( not ( = ?auto_62784 ?auto_62785 ) ) ( ON ?auto_62785 ?auto_62786 ) ( not ( = ?auto_62782 ?auto_62786 ) ) ( not ( = ?auto_62783 ?auto_62786 ) ) ( not ( = ?auto_62784 ?auto_62786 ) ) ( not ( = ?auto_62785 ?auto_62786 ) ) ( ON ?auto_62784 ?auto_62785 ) ( ON-TABLE ?auto_62787 ) ( ON ?auto_62786 ?auto_62787 ) ( not ( = ?auto_62787 ?auto_62786 ) ) ( not ( = ?auto_62787 ?auto_62785 ) ) ( not ( = ?auto_62787 ?auto_62784 ) ) ( not ( = ?auto_62782 ?auto_62787 ) ) ( not ( = ?auto_62783 ?auto_62787 ) ) ( ON ?auto_62783 ?auto_62784 ) ( CLEAR ?auto_62783 ) ( ON ?auto_62782 ?auto_62788 ) ( CLEAR ?auto_62782 ) ( HAND-EMPTY ) ( not ( = ?auto_62782 ?auto_62788 ) ) ( not ( = ?auto_62783 ?auto_62788 ) ) ( not ( = ?auto_62784 ?auto_62788 ) ) ( not ( = ?auto_62785 ?auto_62788 ) ) ( not ( = ?auto_62786 ?auto_62788 ) ) ( not ( = ?auto_62787 ?auto_62788 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62782 ?auto_62788 )
      ( MAKE-4PILE ?auto_62782 ?auto_62783 ?auto_62784 ?auto_62785 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62789 - BLOCK
      ?auto_62790 - BLOCK
      ?auto_62791 - BLOCK
      ?auto_62792 - BLOCK
    )
    :vars
    (
      ?auto_62795 - BLOCK
      ?auto_62793 - BLOCK
      ?auto_62794 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62789 ?auto_62790 ) ) ( not ( = ?auto_62789 ?auto_62791 ) ) ( not ( = ?auto_62789 ?auto_62792 ) ) ( not ( = ?auto_62790 ?auto_62791 ) ) ( not ( = ?auto_62790 ?auto_62792 ) ) ( not ( = ?auto_62791 ?auto_62792 ) ) ( ON ?auto_62792 ?auto_62795 ) ( not ( = ?auto_62789 ?auto_62795 ) ) ( not ( = ?auto_62790 ?auto_62795 ) ) ( not ( = ?auto_62791 ?auto_62795 ) ) ( not ( = ?auto_62792 ?auto_62795 ) ) ( ON ?auto_62791 ?auto_62792 ) ( ON-TABLE ?auto_62793 ) ( ON ?auto_62795 ?auto_62793 ) ( not ( = ?auto_62793 ?auto_62795 ) ) ( not ( = ?auto_62793 ?auto_62792 ) ) ( not ( = ?auto_62793 ?auto_62791 ) ) ( not ( = ?auto_62789 ?auto_62793 ) ) ( not ( = ?auto_62790 ?auto_62793 ) ) ( ON ?auto_62789 ?auto_62794 ) ( CLEAR ?auto_62789 ) ( not ( = ?auto_62789 ?auto_62794 ) ) ( not ( = ?auto_62790 ?auto_62794 ) ) ( not ( = ?auto_62791 ?auto_62794 ) ) ( not ( = ?auto_62792 ?auto_62794 ) ) ( not ( = ?auto_62795 ?auto_62794 ) ) ( not ( = ?auto_62793 ?auto_62794 ) ) ( HOLDING ?auto_62790 ) ( CLEAR ?auto_62791 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62793 ?auto_62795 ?auto_62792 ?auto_62791 ?auto_62790 )
      ( MAKE-4PILE ?auto_62789 ?auto_62790 ?auto_62791 ?auto_62792 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62796 - BLOCK
      ?auto_62797 - BLOCK
      ?auto_62798 - BLOCK
      ?auto_62799 - BLOCK
    )
    :vars
    (
      ?auto_62801 - BLOCK
      ?auto_62800 - BLOCK
      ?auto_62802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62796 ?auto_62797 ) ) ( not ( = ?auto_62796 ?auto_62798 ) ) ( not ( = ?auto_62796 ?auto_62799 ) ) ( not ( = ?auto_62797 ?auto_62798 ) ) ( not ( = ?auto_62797 ?auto_62799 ) ) ( not ( = ?auto_62798 ?auto_62799 ) ) ( ON ?auto_62799 ?auto_62801 ) ( not ( = ?auto_62796 ?auto_62801 ) ) ( not ( = ?auto_62797 ?auto_62801 ) ) ( not ( = ?auto_62798 ?auto_62801 ) ) ( not ( = ?auto_62799 ?auto_62801 ) ) ( ON ?auto_62798 ?auto_62799 ) ( ON-TABLE ?auto_62800 ) ( ON ?auto_62801 ?auto_62800 ) ( not ( = ?auto_62800 ?auto_62801 ) ) ( not ( = ?auto_62800 ?auto_62799 ) ) ( not ( = ?auto_62800 ?auto_62798 ) ) ( not ( = ?auto_62796 ?auto_62800 ) ) ( not ( = ?auto_62797 ?auto_62800 ) ) ( ON ?auto_62796 ?auto_62802 ) ( not ( = ?auto_62796 ?auto_62802 ) ) ( not ( = ?auto_62797 ?auto_62802 ) ) ( not ( = ?auto_62798 ?auto_62802 ) ) ( not ( = ?auto_62799 ?auto_62802 ) ) ( not ( = ?auto_62801 ?auto_62802 ) ) ( not ( = ?auto_62800 ?auto_62802 ) ) ( CLEAR ?auto_62798 ) ( ON ?auto_62797 ?auto_62796 ) ( CLEAR ?auto_62797 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62802 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62802 ?auto_62796 )
      ( MAKE-4PILE ?auto_62796 ?auto_62797 ?auto_62798 ?auto_62799 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62803 - BLOCK
      ?auto_62804 - BLOCK
      ?auto_62805 - BLOCK
      ?auto_62806 - BLOCK
    )
    :vars
    (
      ?auto_62809 - BLOCK
      ?auto_62808 - BLOCK
      ?auto_62807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62803 ?auto_62804 ) ) ( not ( = ?auto_62803 ?auto_62805 ) ) ( not ( = ?auto_62803 ?auto_62806 ) ) ( not ( = ?auto_62804 ?auto_62805 ) ) ( not ( = ?auto_62804 ?auto_62806 ) ) ( not ( = ?auto_62805 ?auto_62806 ) ) ( ON ?auto_62806 ?auto_62809 ) ( not ( = ?auto_62803 ?auto_62809 ) ) ( not ( = ?auto_62804 ?auto_62809 ) ) ( not ( = ?auto_62805 ?auto_62809 ) ) ( not ( = ?auto_62806 ?auto_62809 ) ) ( ON-TABLE ?auto_62808 ) ( ON ?auto_62809 ?auto_62808 ) ( not ( = ?auto_62808 ?auto_62809 ) ) ( not ( = ?auto_62808 ?auto_62806 ) ) ( not ( = ?auto_62808 ?auto_62805 ) ) ( not ( = ?auto_62803 ?auto_62808 ) ) ( not ( = ?auto_62804 ?auto_62808 ) ) ( ON ?auto_62803 ?auto_62807 ) ( not ( = ?auto_62803 ?auto_62807 ) ) ( not ( = ?auto_62804 ?auto_62807 ) ) ( not ( = ?auto_62805 ?auto_62807 ) ) ( not ( = ?auto_62806 ?auto_62807 ) ) ( not ( = ?auto_62809 ?auto_62807 ) ) ( not ( = ?auto_62808 ?auto_62807 ) ) ( ON ?auto_62804 ?auto_62803 ) ( CLEAR ?auto_62804 ) ( ON-TABLE ?auto_62807 ) ( HOLDING ?auto_62805 ) ( CLEAR ?auto_62806 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62808 ?auto_62809 ?auto_62806 ?auto_62805 )
      ( MAKE-4PILE ?auto_62803 ?auto_62804 ?auto_62805 ?auto_62806 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62810 - BLOCK
      ?auto_62811 - BLOCK
      ?auto_62812 - BLOCK
      ?auto_62813 - BLOCK
    )
    :vars
    (
      ?auto_62816 - BLOCK
      ?auto_62814 - BLOCK
      ?auto_62815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62810 ?auto_62811 ) ) ( not ( = ?auto_62810 ?auto_62812 ) ) ( not ( = ?auto_62810 ?auto_62813 ) ) ( not ( = ?auto_62811 ?auto_62812 ) ) ( not ( = ?auto_62811 ?auto_62813 ) ) ( not ( = ?auto_62812 ?auto_62813 ) ) ( ON ?auto_62813 ?auto_62816 ) ( not ( = ?auto_62810 ?auto_62816 ) ) ( not ( = ?auto_62811 ?auto_62816 ) ) ( not ( = ?auto_62812 ?auto_62816 ) ) ( not ( = ?auto_62813 ?auto_62816 ) ) ( ON-TABLE ?auto_62814 ) ( ON ?auto_62816 ?auto_62814 ) ( not ( = ?auto_62814 ?auto_62816 ) ) ( not ( = ?auto_62814 ?auto_62813 ) ) ( not ( = ?auto_62814 ?auto_62812 ) ) ( not ( = ?auto_62810 ?auto_62814 ) ) ( not ( = ?auto_62811 ?auto_62814 ) ) ( ON ?auto_62810 ?auto_62815 ) ( not ( = ?auto_62810 ?auto_62815 ) ) ( not ( = ?auto_62811 ?auto_62815 ) ) ( not ( = ?auto_62812 ?auto_62815 ) ) ( not ( = ?auto_62813 ?auto_62815 ) ) ( not ( = ?auto_62816 ?auto_62815 ) ) ( not ( = ?auto_62814 ?auto_62815 ) ) ( ON ?auto_62811 ?auto_62810 ) ( ON-TABLE ?auto_62815 ) ( CLEAR ?auto_62813 ) ( ON ?auto_62812 ?auto_62811 ) ( CLEAR ?auto_62812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62815 ?auto_62810 ?auto_62811 )
      ( MAKE-4PILE ?auto_62810 ?auto_62811 ?auto_62812 ?auto_62813 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62817 - BLOCK
      ?auto_62818 - BLOCK
      ?auto_62819 - BLOCK
      ?auto_62820 - BLOCK
    )
    :vars
    (
      ?auto_62823 - BLOCK
      ?auto_62821 - BLOCK
      ?auto_62822 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62817 ?auto_62818 ) ) ( not ( = ?auto_62817 ?auto_62819 ) ) ( not ( = ?auto_62817 ?auto_62820 ) ) ( not ( = ?auto_62818 ?auto_62819 ) ) ( not ( = ?auto_62818 ?auto_62820 ) ) ( not ( = ?auto_62819 ?auto_62820 ) ) ( not ( = ?auto_62817 ?auto_62823 ) ) ( not ( = ?auto_62818 ?auto_62823 ) ) ( not ( = ?auto_62819 ?auto_62823 ) ) ( not ( = ?auto_62820 ?auto_62823 ) ) ( ON-TABLE ?auto_62821 ) ( ON ?auto_62823 ?auto_62821 ) ( not ( = ?auto_62821 ?auto_62823 ) ) ( not ( = ?auto_62821 ?auto_62820 ) ) ( not ( = ?auto_62821 ?auto_62819 ) ) ( not ( = ?auto_62817 ?auto_62821 ) ) ( not ( = ?auto_62818 ?auto_62821 ) ) ( ON ?auto_62817 ?auto_62822 ) ( not ( = ?auto_62817 ?auto_62822 ) ) ( not ( = ?auto_62818 ?auto_62822 ) ) ( not ( = ?auto_62819 ?auto_62822 ) ) ( not ( = ?auto_62820 ?auto_62822 ) ) ( not ( = ?auto_62823 ?auto_62822 ) ) ( not ( = ?auto_62821 ?auto_62822 ) ) ( ON ?auto_62818 ?auto_62817 ) ( ON-TABLE ?auto_62822 ) ( ON ?auto_62819 ?auto_62818 ) ( CLEAR ?auto_62819 ) ( HOLDING ?auto_62820 ) ( CLEAR ?auto_62823 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62821 ?auto_62823 ?auto_62820 )
      ( MAKE-4PILE ?auto_62817 ?auto_62818 ?auto_62819 ?auto_62820 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62824 - BLOCK
      ?auto_62825 - BLOCK
      ?auto_62826 - BLOCK
      ?auto_62827 - BLOCK
    )
    :vars
    (
      ?auto_62829 - BLOCK
      ?auto_62828 - BLOCK
      ?auto_62830 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62824 ?auto_62825 ) ) ( not ( = ?auto_62824 ?auto_62826 ) ) ( not ( = ?auto_62824 ?auto_62827 ) ) ( not ( = ?auto_62825 ?auto_62826 ) ) ( not ( = ?auto_62825 ?auto_62827 ) ) ( not ( = ?auto_62826 ?auto_62827 ) ) ( not ( = ?auto_62824 ?auto_62829 ) ) ( not ( = ?auto_62825 ?auto_62829 ) ) ( not ( = ?auto_62826 ?auto_62829 ) ) ( not ( = ?auto_62827 ?auto_62829 ) ) ( ON-TABLE ?auto_62828 ) ( ON ?auto_62829 ?auto_62828 ) ( not ( = ?auto_62828 ?auto_62829 ) ) ( not ( = ?auto_62828 ?auto_62827 ) ) ( not ( = ?auto_62828 ?auto_62826 ) ) ( not ( = ?auto_62824 ?auto_62828 ) ) ( not ( = ?auto_62825 ?auto_62828 ) ) ( ON ?auto_62824 ?auto_62830 ) ( not ( = ?auto_62824 ?auto_62830 ) ) ( not ( = ?auto_62825 ?auto_62830 ) ) ( not ( = ?auto_62826 ?auto_62830 ) ) ( not ( = ?auto_62827 ?auto_62830 ) ) ( not ( = ?auto_62829 ?auto_62830 ) ) ( not ( = ?auto_62828 ?auto_62830 ) ) ( ON ?auto_62825 ?auto_62824 ) ( ON-TABLE ?auto_62830 ) ( ON ?auto_62826 ?auto_62825 ) ( CLEAR ?auto_62829 ) ( ON ?auto_62827 ?auto_62826 ) ( CLEAR ?auto_62827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62830 ?auto_62824 ?auto_62825 ?auto_62826 )
      ( MAKE-4PILE ?auto_62824 ?auto_62825 ?auto_62826 ?auto_62827 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62831 - BLOCK
      ?auto_62832 - BLOCK
      ?auto_62833 - BLOCK
      ?auto_62834 - BLOCK
    )
    :vars
    (
      ?auto_62837 - BLOCK
      ?auto_62835 - BLOCK
      ?auto_62836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62831 ?auto_62832 ) ) ( not ( = ?auto_62831 ?auto_62833 ) ) ( not ( = ?auto_62831 ?auto_62834 ) ) ( not ( = ?auto_62832 ?auto_62833 ) ) ( not ( = ?auto_62832 ?auto_62834 ) ) ( not ( = ?auto_62833 ?auto_62834 ) ) ( not ( = ?auto_62831 ?auto_62837 ) ) ( not ( = ?auto_62832 ?auto_62837 ) ) ( not ( = ?auto_62833 ?auto_62837 ) ) ( not ( = ?auto_62834 ?auto_62837 ) ) ( ON-TABLE ?auto_62835 ) ( not ( = ?auto_62835 ?auto_62837 ) ) ( not ( = ?auto_62835 ?auto_62834 ) ) ( not ( = ?auto_62835 ?auto_62833 ) ) ( not ( = ?auto_62831 ?auto_62835 ) ) ( not ( = ?auto_62832 ?auto_62835 ) ) ( ON ?auto_62831 ?auto_62836 ) ( not ( = ?auto_62831 ?auto_62836 ) ) ( not ( = ?auto_62832 ?auto_62836 ) ) ( not ( = ?auto_62833 ?auto_62836 ) ) ( not ( = ?auto_62834 ?auto_62836 ) ) ( not ( = ?auto_62837 ?auto_62836 ) ) ( not ( = ?auto_62835 ?auto_62836 ) ) ( ON ?auto_62832 ?auto_62831 ) ( ON-TABLE ?auto_62836 ) ( ON ?auto_62833 ?auto_62832 ) ( ON ?auto_62834 ?auto_62833 ) ( CLEAR ?auto_62834 ) ( HOLDING ?auto_62837 ) ( CLEAR ?auto_62835 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62835 ?auto_62837 )
      ( MAKE-4PILE ?auto_62831 ?auto_62832 ?auto_62833 ?auto_62834 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62838 - BLOCK
      ?auto_62839 - BLOCK
      ?auto_62840 - BLOCK
      ?auto_62841 - BLOCK
    )
    :vars
    (
      ?auto_62843 - BLOCK
      ?auto_62842 - BLOCK
      ?auto_62844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62838 ?auto_62839 ) ) ( not ( = ?auto_62838 ?auto_62840 ) ) ( not ( = ?auto_62838 ?auto_62841 ) ) ( not ( = ?auto_62839 ?auto_62840 ) ) ( not ( = ?auto_62839 ?auto_62841 ) ) ( not ( = ?auto_62840 ?auto_62841 ) ) ( not ( = ?auto_62838 ?auto_62843 ) ) ( not ( = ?auto_62839 ?auto_62843 ) ) ( not ( = ?auto_62840 ?auto_62843 ) ) ( not ( = ?auto_62841 ?auto_62843 ) ) ( ON-TABLE ?auto_62842 ) ( not ( = ?auto_62842 ?auto_62843 ) ) ( not ( = ?auto_62842 ?auto_62841 ) ) ( not ( = ?auto_62842 ?auto_62840 ) ) ( not ( = ?auto_62838 ?auto_62842 ) ) ( not ( = ?auto_62839 ?auto_62842 ) ) ( ON ?auto_62838 ?auto_62844 ) ( not ( = ?auto_62838 ?auto_62844 ) ) ( not ( = ?auto_62839 ?auto_62844 ) ) ( not ( = ?auto_62840 ?auto_62844 ) ) ( not ( = ?auto_62841 ?auto_62844 ) ) ( not ( = ?auto_62843 ?auto_62844 ) ) ( not ( = ?auto_62842 ?auto_62844 ) ) ( ON ?auto_62839 ?auto_62838 ) ( ON-TABLE ?auto_62844 ) ( ON ?auto_62840 ?auto_62839 ) ( ON ?auto_62841 ?auto_62840 ) ( CLEAR ?auto_62842 ) ( ON ?auto_62843 ?auto_62841 ) ( CLEAR ?auto_62843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62844 ?auto_62838 ?auto_62839 ?auto_62840 ?auto_62841 )
      ( MAKE-4PILE ?auto_62838 ?auto_62839 ?auto_62840 ?auto_62841 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62845 - BLOCK
      ?auto_62846 - BLOCK
      ?auto_62847 - BLOCK
      ?auto_62848 - BLOCK
    )
    :vars
    (
      ?auto_62849 - BLOCK
      ?auto_62850 - BLOCK
      ?auto_62851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62845 ?auto_62846 ) ) ( not ( = ?auto_62845 ?auto_62847 ) ) ( not ( = ?auto_62845 ?auto_62848 ) ) ( not ( = ?auto_62846 ?auto_62847 ) ) ( not ( = ?auto_62846 ?auto_62848 ) ) ( not ( = ?auto_62847 ?auto_62848 ) ) ( not ( = ?auto_62845 ?auto_62849 ) ) ( not ( = ?auto_62846 ?auto_62849 ) ) ( not ( = ?auto_62847 ?auto_62849 ) ) ( not ( = ?auto_62848 ?auto_62849 ) ) ( not ( = ?auto_62850 ?auto_62849 ) ) ( not ( = ?auto_62850 ?auto_62848 ) ) ( not ( = ?auto_62850 ?auto_62847 ) ) ( not ( = ?auto_62845 ?auto_62850 ) ) ( not ( = ?auto_62846 ?auto_62850 ) ) ( ON ?auto_62845 ?auto_62851 ) ( not ( = ?auto_62845 ?auto_62851 ) ) ( not ( = ?auto_62846 ?auto_62851 ) ) ( not ( = ?auto_62847 ?auto_62851 ) ) ( not ( = ?auto_62848 ?auto_62851 ) ) ( not ( = ?auto_62849 ?auto_62851 ) ) ( not ( = ?auto_62850 ?auto_62851 ) ) ( ON ?auto_62846 ?auto_62845 ) ( ON-TABLE ?auto_62851 ) ( ON ?auto_62847 ?auto_62846 ) ( ON ?auto_62848 ?auto_62847 ) ( ON ?auto_62849 ?auto_62848 ) ( CLEAR ?auto_62849 ) ( HOLDING ?auto_62850 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62850 )
      ( MAKE-4PILE ?auto_62845 ?auto_62846 ?auto_62847 ?auto_62848 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62852 - BLOCK
      ?auto_62853 - BLOCK
      ?auto_62854 - BLOCK
      ?auto_62855 - BLOCK
    )
    :vars
    (
      ?auto_62857 - BLOCK
      ?auto_62856 - BLOCK
      ?auto_62858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62852 ?auto_62853 ) ) ( not ( = ?auto_62852 ?auto_62854 ) ) ( not ( = ?auto_62852 ?auto_62855 ) ) ( not ( = ?auto_62853 ?auto_62854 ) ) ( not ( = ?auto_62853 ?auto_62855 ) ) ( not ( = ?auto_62854 ?auto_62855 ) ) ( not ( = ?auto_62852 ?auto_62857 ) ) ( not ( = ?auto_62853 ?auto_62857 ) ) ( not ( = ?auto_62854 ?auto_62857 ) ) ( not ( = ?auto_62855 ?auto_62857 ) ) ( not ( = ?auto_62856 ?auto_62857 ) ) ( not ( = ?auto_62856 ?auto_62855 ) ) ( not ( = ?auto_62856 ?auto_62854 ) ) ( not ( = ?auto_62852 ?auto_62856 ) ) ( not ( = ?auto_62853 ?auto_62856 ) ) ( ON ?auto_62852 ?auto_62858 ) ( not ( = ?auto_62852 ?auto_62858 ) ) ( not ( = ?auto_62853 ?auto_62858 ) ) ( not ( = ?auto_62854 ?auto_62858 ) ) ( not ( = ?auto_62855 ?auto_62858 ) ) ( not ( = ?auto_62857 ?auto_62858 ) ) ( not ( = ?auto_62856 ?auto_62858 ) ) ( ON ?auto_62853 ?auto_62852 ) ( ON-TABLE ?auto_62858 ) ( ON ?auto_62854 ?auto_62853 ) ( ON ?auto_62855 ?auto_62854 ) ( ON ?auto_62857 ?auto_62855 ) ( ON ?auto_62856 ?auto_62857 ) ( CLEAR ?auto_62856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62858 ?auto_62852 ?auto_62853 ?auto_62854 ?auto_62855 ?auto_62857 )
      ( MAKE-4PILE ?auto_62852 ?auto_62853 ?auto_62854 ?auto_62855 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62870 - BLOCK
    )
    :vars
    (
      ?auto_62872 - BLOCK
      ?auto_62871 - BLOCK
      ?auto_62873 - BLOCK
      ?auto_62875 - BLOCK
      ?auto_62874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62872 ?auto_62870 ) ( ON-TABLE ?auto_62870 ) ( not ( = ?auto_62870 ?auto_62872 ) ) ( not ( = ?auto_62870 ?auto_62871 ) ) ( not ( = ?auto_62870 ?auto_62873 ) ) ( not ( = ?auto_62872 ?auto_62871 ) ) ( not ( = ?auto_62872 ?auto_62873 ) ) ( not ( = ?auto_62871 ?auto_62873 ) ) ( ON ?auto_62871 ?auto_62872 ) ( CLEAR ?auto_62871 ) ( HOLDING ?auto_62873 ) ( CLEAR ?auto_62875 ) ( ON-TABLE ?auto_62874 ) ( ON ?auto_62875 ?auto_62874 ) ( not ( = ?auto_62874 ?auto_62875 ) ) ( not ( = ?auto_62874 ?auto_62873 ) ) ( not ( = ?auto_62875 ?auto_62873 ) ) ( not ( = ?auto_62870 ?auto_62875 ) ) ( not ( = ?auto_62870 ?auto_62874 ) ) ( not ( = ?auto_62872 ?auto_62875 ) ) ( not ( = ?auto_62872 ?auto_62874 ) ) ( not ( = ?auto_62871 ?auto_62875 ) ) ( not ( = ?auto_62871 ?auto_62874 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62874 ?auto_62875 ?auto_62873 )
      ( MAKE-1PILE ?auto_62870 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62876 - BLOCK
    )
    :vars
    (
      ?auto_62881 - BLOCK
      ?auto_62877 - BLOCK
      ?auto_62878 - BLOCK
      ?auto_62880 - BLOCK
      ?auto_62879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62881 ?auto_62876 ) ( ON-TABLE ?auto_62876 ) ( not ( = ?auto_62876 ?auto_62881 ) ) ( not ( = ?auto_62876 ?auto_62877 ) ) ( not ( = ?auto_62876 ?auto_62878 ) ) ( not ( = ?auto_62881 ?auto_62877 ) ) ( not ( = ?auto_62881 ?auto_62878 ) ) ( not ( = ?auto_62877 ?auto_62878 ) ) ( ON ?auto_62877 ?auto_62881 ) ( CLEAR ?auto_62880 ) ( ON-TABLE ?auto_62879 ) ( ON ?auto_62880 ?auto_62879 ) ( not ( = ?auto_62879 ?auto_62880 ) ) ( not ( = ?auto_62879 ?auto_62878 ) ) ( not ( = ?auto_62880 ?auto_62878 ) ) ( not ( = ?auto_62876 ?auto_62880 ) ) ( not ( = ?auto_62876 ?auto_62879 ) ) ( not ( = ?auto_62881 ?auto_62880 ) ) ( not ( = ?auto_62881 ?auto_62879 ) ) ( not ( = ?auto_62877 ?auto_62880 ) ) ( not ( = ?auto_62877 ?auto_62879 ) ) ( ON ?auto_62878 ?auto_62877 ) ( CLEAR ?auto_62878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62876 ?auto_62881 ?auto_62877 )
      ( MAKE-1PILE ?auto_62876 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62882 - BLOCK
    )
    :vars
    (
      ?auto_62883 - BLOCK
      ?auto_62887 - BLOCK
      ?auto_62886 - BLOCK
      ?auto_62884 - BLOCK
      ?auto_62885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62883 ?auto_62882 ) ( ON-TABLE ?auto_62882 ) ( not ( = ?auto_62882 ?auto_62883 ) ) ( not ( = ?auto_62882 ?auto_62887 ) ) ( not ( = ?auto_62882 ?auto_62886 ) ) ( not ( = ?auto_62883 ?auto_62887 ) ) ( not ( = ?auto_62883 ?auto_62886 ) ) ( not ( = ?auto_62887 ?auto_62886 ) ) ( ON ?auto_62887 ?auto_62883 ) ( ON-TABLE ?auto_62884 ) ( not ( = ?auto_62884 ?auto_62885 ) ) ( not ( = ?auto_62884 ?auto_62886 ) ) ( not ( = ?auto_62885 ?auto_62886 ) ) ( not ( = ?auto_62882 ?auto_62885 ) ) ( not ( = ?auto_62882 ?auto_62884 ) ) ( not ( = ?auto_62883 ?auto_62885 ) ) ( not ( = ?auto_62883 ?auto_62884 ) ) ( not ( = ?auto_62887 ?auto_62885 ) ) ( not ( = ?auto_62887 ?auto_62884 ) ) ( ON ?auto_62886 ?auto_62887 ) ( CLEAR ?auto_62886 ) ( HOLDING ?auto_62885 ) ( CLEAR ?auto_62884 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62884 ?auto_62885 )
      ( MAKE-1PILE ?auto_62882 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62888 - BLOCK
    )
    :vars
    (
      ?auto_62893 - BLOCK
      ?auto_62892 - BLOCK
      ?auto_62889 - BLOCK
      ?auto_62891 - BLOCK
      ?auto_62890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62893 ?auto_62888 ) ( ON-TABLE ?auto_62888 ) ( not ( = ?auto_62888 ?auto_62893 ) ) ( not ( = ?auto_62888 ?auto_62892 ) ) ( not ( = ?auto_62888 ?auto_62889 ) ) ( not ( = ?auto_62893 ?auto_62892 ) ) ( not ( = ?auto_62893 ?auto_62889 ) ) ( not ( = ?auto_62892 ?auto_62889 ) ) ( ON ?auto_62892 ?auto_62893 ) ( ON-TABLE ?auto_62891 ) ( not ( = ?auto_62891 ?auto_62890 ) ) ( not ( = ?auto_62891 ?auto_62889 ) ) ( not ( = ?auto_62890 ?auto_62889 ) ) ( not ( = ?auto_62888 ?auto_62890 ) ) ( not ( = ?auto_62888 ?auto_62891 ) ) ( not ( = ?auto_62893 ?auto_62890 ) ) ( not ( = ?auto_62893 ?auto_62891 ) ) ( not ( = ?auto_62892 ?auto_62890 ) ) ( not ( = ?auto_62892 ?auto_62891 ) ) ( ON ?auto_62889 ?auto_62892 ) ( CLEAR ?auto_62891 ) ( ON ?auto_62890 ?auto_62889 ) ( CLEAR ?auto_62890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62888 ?auto_62893 ?auto_62892 ?auto_62889 )
      ( MAKE-1PILE ?auto_62888 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62894 - BLOCK
    )
    :vars
    (
      ?auto_62895 - BLOCK
      ?auto_62897 - BLOCK
      ?auto_62896 - BLOCK
      ?auto_62898 - BLOCK
      ?auto_62899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62895 ?auto_62894 ) ( ON-TABLE ?auto_62894 ) ( not ( = ?auto_62894 ?auto_62895 ) ) ( not ( = ?auto_62894 ?auto_62897 ) ) ( not ( = ?auto_62894 ?auto_62896 ) ) ( not ( = ?auto_62895 ?auto_62897 ) ) ( not ( = ?auto_62895 ?auto_62896 ) ) ( not ( = ?auto_62897 ?auto_62896 ) ) ( ON ?auto_62897 ?auto_62895 ) ( not ( = ?auto_62898 ?auto_62899 ) ) ( not ( = ?auto_62898 ?auto_62896 ) ) ( not ( = ?auto_62899 ?auto_62896 ) ) ( not ( = ?auto_62894 ?auto_62899 ) ) ( not ( = ?auto_62894 ?auto_62898 ) ) ( not ( = ?auto_62895 ?auto_62899 ) ) ( not ( = ?auto_62895 ?auto_62898 ) ) ( not ( = ?auto_62897 ?auto_62899 ) ) ( not ( = ?auto_62897 ?auto_62898 ) ) ( ON ?auto_62896 ?auto_62897 ) ( ON ?auto_62899 ?auto_62896 ) ( CLEAR ?auto_62899 ) ( HOLDING ?auto_62898 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62898 )
      ( MAKE-1PILE ?auto_62894 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62907 - BLOCK
    )
    :vars
    (
      ?auto_62909 - BLOCK
      ?auto_62908 - BLOCK
      ?auto_62911 - BLOCK
      ?auto_62912 - BLOCK
      ?auto_62910 - BLOCK
      ?auto_62913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62909 ?auto_62907 ) ( ON-TABLE ?auto_62907 ) ( not ( = ?auto_62907 ?auto_62909 ) ) ( not ( = ?auto_62907 ?auto_62908 ) ) ( not ( = ?auto_62907 ?auto_62911 ) ) ( not ( = ?auto_62909 ?auto_62908 ) ) ( not ( = ?auto_62909 ?auto_62911 ) ) ( not ( = ?auto_62908 ?auto_62911 ) ) ( ON ?auto_62908 ?auto_62909 ) ( not ( = ?auto_62912 ?auto_62910 ) ) ( not ( = ?auto_62912 ?auto_62911 ) ) ( not ( = ?auto_62910 ?auto_62911 ) ) ( not ( = ?auto_62907 ?auto_62910 ) ) ( not ( = ?auto_62907 ?auto_62912 ) ) ( not ( = ?auto_62909 ?auto_62910 ) ) ( not ( = ?auto_62909 ?auto_62912 ) ) ( not ( = ?auto_62908 ?auto_62910 ) ) ( not ( = ?auto_62908 ?auto_62912 ) ) ( ON ?auto_62911 ?auto_62908 ) ( ON ?auto_62910 ?auto_62911 ) ( CLEAR ?auto_62910 ) ( ON ?auto_62912 ?auto_62913 ) ( CLEAR ?auto_62912 ) ( HAND-EMPTY ) ( not ( = ?auto_62907 ?auto_62913 ) ) ( not ( = ?auto_62909 ?auto_62913 ) ) ( not ( = ?auto_62908 ?auto_62913 ) ) ( not ( = ?auto_62911 ?auto_62913 ) ) ( not ( = ?auto_62912 ?auto_62913 ) ) ( not ( = ?auto_62910 ?auto_62913 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62912 ?auto_62913 )
      ( MAKE-1PILE ?auto_62907 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62914 - BLOCK
    )
    :vars
    (
      ?auto_62919 - BLOCK
      ?auto_62917 - BLOCK
      ?auto_62920 - BLOCK
      ?auto_62916 - BLOCK
      ?auto_62918 - BLOCK
      ?auto_62915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62919 ?auto_62914 ) ( ON-TABLE ?auto_62914 ) ( not ( = ?auto_62914 ?auto_62919 ) ) ( not ( = ?auto_62914 ?auto_62917 ) ) ( not ( = ?auto_62914 ?auto_62920 ) ) ( not ( = ?auto_62919 ?auto_62917 ) ) ( not ( = ?auto_62919 ?auto_62920 ) ) ( not ( = ?auto_62917 ?auto_62920 ) ) ( ON ?auto_62917 ?auto_62919 ) ( not ( = ?auto_62916 ?auto_62918 ) ) ( not ( = ?auto_62916 ?auto_62920 ) ) ( not ( = ?auto_62918 ?auto_62920 ) ) ( not ( = ?auto_62914 ?auto_62918 ) ) ( not ( = ?auto_62914 ?auto_62916 ) ) ( not ( = ?auto_62919 ?auto_62918 ) ) ( not ( = ?auto_62919 ?auto_62916 ) ) ( not ( = ?auto_62917 ?auto_62918 ) ) ( not ( = ?auto_62917 ?auto_62916 ) ) ( ON ?auto_62920 ?auto_62917 ) ( ON ?auto_62916 ?auto_62915 ) ( CLEAR ?auto_62916 ) ( not ( = ?auto_62914 ?auto_62915 ) ) ( not ( = ?auto_62919 ?auto_62915 ) ) ( not ( = ?auto_62917 ?auto_62915 ) ) ( not ( = ?auto_62920 ?auto_62915 ) ) ( not ( = ?auto_62916 ?auto_62915 ) ) ( not ( = ?auto_62918 ?auto_62915 ) ) ( HOLDING ?auto_62918 ) ( CLEAR ?auto_62920 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62914 ?auto_62919 ?auto_62917 ?auto_62920 ?auto_62918 )
      ( MAKE-1PILE ?auto_62914 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62921 - BLOCK
    )
    :vars
    (
      ?auto_62926 - BLOCK
      ?auto_62927 - BLOCK
      ?auto_62924 - BLOCK
      ?auto_62923 - BLOCK
      ?auto_62922 - BLOCK
      ?auto_62925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62926 ?auto_62921 ) ( ON-TABLE ?auto_62921 ) ( not ( = ?auto_62921 ?auto_62926 ) ) ( not ( = ?auto_62921 ?auto_62927 ) ) ( not ( = ?auto_62921 ?auto_62924 ) ) ( not ( = ?auto_62926 ?auto_62927 ) ) ( not ( = ?auto_62926 ?auto_62924 ) ) ( not ( = ?auto_62927 ?auto_62924 ) ) ( ON ?auto_62927 ?auto_62926 ) ( not ( = ?auto_62923 ?auto_62922 ) ) ( not ( = ?auto_62923 ?auto_62924 ) ) ( not ( = ?auto_62922 ?auto_62924 ) ) ( not ( = ?auto_62921 ?auto_62922 ) ) ( not ( = ?auto_62921 ?auto_62923 ) ) ( not ( = ?auto_62926 ?auto_62922 ) ) ( not ( = ?auto_62926 ?auto_62923 ) ) ( not ( = ?auto_62927 ?auto_62922 ) ) ( not ( = ?auto_62927 ?auto_62923 ) ) ( ON ?auto_62924 ?auto_62927 ) ( ON ?auto_62923 ?auto_62925 ) ( not ( = ?auto_62921 ?auto_62925 ) ) ( not ( = ?auto_62926 ?auto_62925 ) ) ( not ( = ?auto_62927 ?auto_62925 ) ) ( not ( = ?auto_62924 ?auto_62925 ) ) ( not ( = ?auto_62923 ?auto_62925 ) ) ( not ( = ?auto_62922 ?auto_62925 ) ) ( CLEAR ?auto_62924 ) ( ON ?auto_62922 ?auto_62923 ) ( CLEAR ?auto_62922 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62925 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62925 ?auto_62923 )
      ( MAKE-1PILE ?auto_62921 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62961 - BLOCK
      ?auto_62962 - BLOCK
      ?auto_62963 - BLOCK
      ?auto_62964 - BLOCK
      ?auto_62965 - BLOCK
    )
    :vars
    (
      ?auto_62966 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62961 ) ( ON ?auto_62962 ?auto_62961 ) ( ON ?auto_62963 ?auto_62962 ) ( not ( = ?auto_62961 ?auto_62962 ) ) ( not ( = ?auto_62961 ?auto_62963 ) ) ( not ( = ?auto_62961 ?auto_62964 ) ) ( not ( = ?auto_62961 ?auto_62965 ) ) ( not ( = ?auto_62962 ?auto_62963 ) ) ( not ( = ?auto_62962 ?auto_62964 ) ) ( not ( = ?auto_62962 ?auto_62965 ) ) ( not ( = ?auto_62963 ?auto_62964 ) ) ( not ( = ?auto_62963 ?auto_62965 ) ) ( not ( = ?auto_62964 ?auto_62965 ) ) ( ON ?auto_62965 ?auto_62966 ) ( not ( = ?auto_62961 ?auto_62966 ) ) ( not ( = ?auto_62962 ?auto_62966 ) ) ( not ( = ?auto_62963 ?auto_62966 ) ) ( not ( = ?auto_62964 ?auto_62966 ) ) ( not ( = ?auto_62965 ?auto_62966 ) ) ( CLEAR ?auto_62963 ) ( ON ?auto_62964 ?auto_62965 ) ( CLEAR ?auto_62964 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62966 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62966 ?auto_62965 )
      ( MAKE-5PILE ?auto_62961 ?auto_62962 ?auto_62963 ?auto_62964 ?auto_62965 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62967 - BLOCK
      ?auto_62968 - BLOCK
      ?auto_62969 - BLOCK
      ?auto_62970 - BLOCK
      ?auto_62971 - BLOCK
    )
    :vars
    (
      ?auto_62972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62967 ) ( ON ?auto_62968 ?auto_62967 ) ( not ( = ?auto_62967 ?auto_62968 ) ) ( not ( = ?auto_62967 ?auto_62969 ) ) ( not ( = ?auto_62967 ?auto_62970 ) ) ( not ( = ?auto_62967 ?auto_62971 ) ) ( not ( = ?auto_62968 ?auto_62969 ) ) ( not ( = ?auto_62968 ?auto_62970 ) ) ( not ( = ?auto_62968 ?auto_62971 ) ) ( not ( = ?auto_62969 ?auto_62970 ) ) ( not ( = ?auto_62969 ?auto_62971 ) ) ( not ( = ?auto_62970 ?auto_62971 ) ) ( ON ?auto_62971 ?auto_62972 ) ( not ( = ?auto_62967 ?auto_62972 ) ) ( not ( = ?auto_62968 ?auto_62972 ) ) ( not ( = ?auto_62969 ?auto_62972 ) ) ( not ( = ?auto_62970 ?auto_62972 ) ) ( not ( = ?auto_62971 ?auto_62972 ) ) ( ON ?auto_62970 ?auto_62971 ) ( CLEAR ?auto_62970 ) ( ON-TABLE ?auto_62972 ) ( HOLDING ?auto_62969 ) ( CLEAR ?auto_62968 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62967 ?auto_62968 ?auto_62969 )
      ( MAKE-5PILE ?auto_62967 ?auto_62968 ?auto_62969 ?auto_62970 ?auto_62971 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62973 - BLOCK
      ?auto_62974 - BLOCK
      ?auto_62975 - BLOCK
      ?auto_62976 - BLOCK
      ?auto_62977 - BLOCK
    )
    :vars
    (
      ?auto_62978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62973 ) ( ON ?auto_62974 ?auto_62973 ) ( not ( = ?auto_62973 ?auto_62974 ) ) ( not ( = ?auto_62973 ?auto_62975 ) ) ( not ( = ?auto_62973 ?auto_62976 ) ) ( not ( = ?auto_62973 ?auto_62977 ) ) ( not ( = ?auto_62974 ?auto_62975 ) ) ( not ( = ?auto_62974 ?auto_62976 ) ) ( not ( = ?auto_62974 ?auto_62977 ) ) ( not ( = ?auto_62975 ?auto_62976 ) ) ( not ( = ?auto_62975 ?auto_62977 ) ) ( not ( = ?auto_62976 ?auto_62977 ) ) ( ON ?auto_62977 ?auto_62978 ) ( not ( = ?auto_62973 ?auto_62978 ) ) ( not ( = ?auto_62974 ?auto_62978 ) ) ( not ( = ?auto_62975 ?auto_62978 ) ) ( not ( = ?auto_62976 ?auto_62978 ) ) ( not ( = ?auto_62977 ?auto_62978 ) ) ( ON ?auto_62976 ?auto_62977 ) ( ON-TABLE ?auto_62978 ) ( CLEAR ?auto_62974 ) ( ON ?auto_62975 ?auto_62976 ) ( CLEAR ?auto_62975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62978 ?auto_62977 ?auto_62976 )
      ( MAKE-5PILE ?auto_62973 ?auto_62974 ?auto_62975 ?auto_62976 ?auto_62977 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62979 - BLOCK
      ?auto_62980 - BLOCK
      ?auto_62981 - BLOCK
      ?auto_62982 - BLOCK
      ?auto_62983 - BLOCK
    )
    :vars
    (
      ?auto_62984 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62979 ) ( not ( = ?auto_62979 ?auto_62980 ) ) ( not ( = ?auto_62979 ?auto_62981 ) ) ( not ( = ?auto_62979 ?auto_62982 ) ) ( not ( = ?auto_62979 ?auto_62983 ) ) ( not ( = ?auto_62980 ?auto_62981 ) ) ( not ( = ?auto_62980 ?auto_62982 ) ) ( not ( = ?auto_62980 ?auto_62983 ) ) ( not ( = ?auto_62981 ?auto_62982 ) ) ( not ( = ?auto_62981 ?auto_62983 ) ) ( not ( = ?auto_62982 ?auto_62983 ) ) ( ON ?auto_62983 ?auto_62984 ) ( not ( = ?auto_62979 ?auto_62984 ) ) ( not ( = ?auto_62980 ?auto_62984 ) ) ( not ( = ?auto_62981 ?auto_62984 ) ) ( not ( = ?auto_62982 ?auto_62984 ) ) ( not ( = ?auto_62983 ?auto_62984 ) ) ( ON ?auto_62982 ?auto_62983 ) ( ON-TABLE ?auto_62984 ) ( ON ?auto_62981 ?auto_62982 ) ( CLEAR ?auto_62981 ) ( HOLDING ?auto_62980 ) ( CLEAR ?auto_62979 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62979 ?auto_62980 )
      ( MAKE-5PILE ?auto_62979 ?auto_62980 ?auto_62981 ?auto_62982 ?auto_62983 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62985 - BLOCK
      ?auto_62986 - BLOCK
      ?auto_62987 - BLOCK
      ?auto_62988 - BLOCK
      ?auto_62989 - BLOCK
    )
    :vars
    (
      ?auto_62990 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62985 ) ( not ( = ?auto_62985 ?auto_62986 ) ) ( not ( = ?auto_62985 ?auto_62987 ) ) ( not ( = ?auto_62985 ?auto_62988 ) ) ( not ( = ?auto_62985 ?auto_62989 ) ) ( not ( = ?auto_62986 ?auto_62987 ) ) ( not ( = ?auto_62986 ?auto_62988 ) ) ( not ( = ?auto_62986 ?auto_62989 ) ) ( not ( = ?auto_62987 ?auto_62988 ) ) ( not ( = ?auto_62987 ?auto_62989 ) ) ( not ( = ?auto_62988 ?auto_62989 ) ) ( ON ?auto_62989 ?auto_62990 ) ( not ( = ?auto_62985 ?auto_62990 ) ) ( not ( = ?auto_62986 ?auto_62990 ) ) ( not ( = ?auto_62987 ?auto_62990 ) ) ( not ( = ?auto_62988 ?auto_62990 ) ) ( not ( = ?auto_62989 ?auto_62990 ) ) ( ON ?auto_62988 ?auto_62989 ) ( ON-TABLE ?auto_62990 ) ( ON ?auto_62987 ?auto_62988 ) ( CLEAR ?auto_62985 ) ( ON ?auto_62986 ?auto_62987 ) ( CLEAR ?auto_62986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62990 ?auto_62989 ?auto_62988 ?auto_62987 )
      ( MAKE-5PILE ?auto_62985 ?auto_62986 ?auto_62987 ?auto_62988 ?auto_62989 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62991 - BLOCK
      ?auto_62992 - BLOCK
      ?auto_62993 - BLOCK
      ?auto_62994 - BLOCK
      ?auto_62995 - BLOCK
    )
    :vars
    (
      ?auto_62996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62991 ?auto_62992 ) ) ( not ( = ?auto_62991 ?auto_62993 ) ) ( not ( = ?auto_62991 ?auto_62994 ) ) ( not ( = ?auto_62991 ?auto_62995 ) ) ( not ( = ?auto_62992 ?auto_62993 ) ) ( not ( = ?auto_62992 ?auto_62994 ) ) ( not ( = ?auto_62992 ?auto_62995 ) ) ( not ( = ?auto_62993 ?auto_62994 ) ) ( not ( = ?auto_62993 ?auto_62995 ) ) ( not ( = ?auto_62994 ?auto_62995 ) ) ( ON ?auto_62995 ?auto_62996 ) ( not ( = ?auto_62991 ?auto_62996 ) ) ( not ( = ?auto_62992 ?auto_62996 ) ) ( not ( = ?auto_62993 ?auto_62996 ) ) ( not ( = ?auto_62994 ?auto_62996 ) ) ( not ( = ?auto_62995 ?auto_62996 ) ) ( ON ?auto_62994 ?auto_62995 ) ( ON-TABLE ?auto_62996 ) ( ON ?auto_62993 ?auto_62994 ) ( ON ?auto_62992 ?auto_62993 ) ( CLEAR ?auto_62992 ) ( HOLDING ?auto_62991 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62991 )
      ( MAKE-5PILE ?auto_62991 ?auto_62992 ?auto_62993 ?auto_62994 ?auto_62995 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62997 - BLOCK
      ?auto_62998 - BLOCK
      ?auto_62999 - BLOCK
      ?auto_63000 - BLOCK
      ?auto_63001 - BLOCK
    )
    :vars
    (
      ?auto_63002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62997 ?auto_62998 ) ) ( not ( = ?auto_62997 ?auto_62999 ) ) ( not ( = ?auto_62997 ?auto_63000 ) ) ( not ( = ?auto_62997 ?auto_63001 ) ) ( not ( = ?auto_62998 ?auto_62999 ) ) ( not ( = ?auto_62998 ?auto_63000 ) ) ( not ( = ?auto_62998 ?auto_63001 ) ) ( not ( = ?auto_62999 ?auto_63000 ) ) ( not ( = ?auto_62999 ?auto_63001 ) ) ( not ( = ?auto_63000 ?auto_63001 ) ) ( ON ?auto_63001 ?auto_63002 ) ( not ( = ?auto_62997 ?auto_63002 ) ) ( not ( = ?auto_62998 ?auto_63002 ) ) ( not ( = ?auto_62999 ?auto_63002 ) ) ( not ( = ?auto_63000 ?auto_63002 ) ) ( not ( = ?auto_63001 ?auto_63002 ) ) ( ON ?auto_63000 ?auto_63001 ) ( ON-TABLE ?auto_63002 ) ( ON ?auto_62999 ?auto_63000 ) ( ON ?auto_62998 ?auto_62999 ) ( ON ?auto_62997 ?auto_62998 ) ( CLEAR ?auto_62997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63002 ?auto_63001 ?auto_63000 ?auto_62999 ?auto_62998 )
      ( MAKE-5PILE ?auto_62997 ?auto_62998 ?auto_62999 ?auto_63000 ?auto_63001 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63008 - BLOCK
      ?auto_63009 - BLOCK
      ?auto_63010 - BLOCK
      ?auto_63011 - BLOCK
      ?auto_63012 - BLOCK
    )
    :vars
    (
      ?auto_63013 - BLOCK
      ?auto_63014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63008 ?auto_63009 ) ) ( not ( = ?auto_63008 ?auto_63010 ) ) ( not ( = ?auto_63008 ?auto_63011 ) ) ( not ( = ?auto_63008 ?auto_63012 ) ) ( not ( = ?auto_63009 ?auto_63010 ) ) ( not ( = ?auto_63009 ?auto_63011 ) ) ( not ( = ?auto_63009 ?auto_63012 ) ) ( not ( = ?auto_63010 ?auto_63011 ) ) ( not ( = ?auto_63010 ?auto_63012 ) ) ( not ( = ?auto_63011 ?auto_63012 ) ) ( ON ?auto_63012 ?auto_63013 ) ( not ( = ?auto_63008 ?auto_63013 ) ) ( not ( = ?auto_63009 ?auto_63013 ) ) ( not ( = ?auto_63010 ?auto_63013 ) ) ( not ( = ?auto_63011 ?auto_63013 ) ) ( not ( = ?auto_63012 ?auto_63013 ) ) ( ON ?auto_63011 ?auto_63012 ) ( ON-TABLE ?auto_63013 ) ( ON ?auto_63010 ?auto_63011 ) ( ON ?auto_63009 ?auto_63010 ) ( CLEAR ?auto_63009 ) ( ON ?auto_63008 ?auto_63014 ) ( CLEAR ?auto_63008 ) ( HAND-EMPTY ) ( not ( = ?auto_63008 ?auto_63014 ) ) ( not ( = ?auto_63009 ?auto_63014 ) ) ( not ( = ?auto_63010 ?auto_63014 ) ) ( not ( = ?auto_63011 ?auto_63014 ) ) ( not ( = ?auto_63012 ?auto_63014 ) ) ( not ( = ?auto_63013 ?auto_63014 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63008 ?auto_63014 )
      ( MAKE-5PILE ?auto_63008 ?auto_63009 ?auto_63010 ?auto_63011 ?auto_63012 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63015 - BLOCK
      ?auto_63016 - BLOCK
      ?auto_63017 - BLOCK
      ?auto_63018 - BLOCK
      ?auto_63019 - BLOCK
    )
    :vars
    (
      ?auto_63021 - BLOCK
      ?auto_63020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63015 ?auto_63016 ) ) ( not ( = ?auto_63015 ?auto_63017 ) ) ( not ( = ?auto_63015 ?auto_63018 ) ) ( not ( = ?auto_63015 ?auto_63019 ) ) ( not ( = ?auto_63016 ?auto_63017 ) ) ( not ( = ?auto_63016 ?auto_63018 ) ) ( not ( = ?auto_63016 ?auto_63019 ) ) ( not ( = ?auto_63017 ?auto_63018 ) ) ( not ( = ?auto_63017 ?auto_63019 ) ) ( not ( = ?auto_63018 ?auto_63019 ) ) ( ON ?auto_63019 ?auto_63021 ) ( not ( = ?auto_63015 ?auto_63021 ) ) ( not ( = ?auto_63016 ?auto_63021 ) ) ( not ( = ?auto_63017 ?auto_63021 ) ) ( not ( = ?auto_63018 ?auto_63021 ) ) ( not ( = ?auto_63019 ?auto_63021 ) ) ( ON ?auto_63018 ?auto_63019 ) ( ON-TABLE ?auto_63021 ) ( ON ?auto_63017 ?auto_63018 ) ( ON ?auto_63015 ?auto_63020 ) ( CLEAR ?auto_63015 ) ( not ( = ?auto_63015 ?auto_63020 ) ) ( not ( = ?auto_63016 ?auto_63020 ) ) ( not ( = ?auto_63017 ?auto_63020 ) ) ( not ( = ?auto_63018 ?auto_63020 ) ) ( not ( = ?auto_63019 ?auto_63020 ) ) ( not ( = ?auto_63021 ?auto_63020 ) ) ( HOLDING ?auto_63016 ) ( CLEAR ?auto_63017 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63021 ?auto_63019 ?auto_63018 ?auto_63017 ?auto_63016 )
      ( MAKE-5PILE ?auto_63015 ?auto_63016 ?auto_63017 ?auto_63018 ?auto_63019 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63022 - BLOCK
      ?auto_63023 - BLOCK
      ?auto_63024 - BLOCK
      ?auto_63025 - BLOCK
      ?auto_63026 - BLOCK
    )
    :vars
    (
      ?auto_63027 - BLOCK
      ?auto_63028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63022 ?auto_63023 ) ) ( not ( = ?auto_63022 ?auto_63024 ) ) ( not ( = ?auto_63022 ?auto_63025 ) ) ( not ( = ?auto_63022 ?auto_63026 ) ) ( not ( = ?auto_63023 ?auto_63024 ) ) ( not ( = ?auto_63023 ?auto_63025 ) ) ( not ( = ?auto_63023 ?auto_63026 ) ) ( not ( = ?auto_63024 ?auto_63025 ) ) ( not ( = ?auto_63024 ?auto_63026 ) ) ( not ( = ?auto_63025 ?auto_63026 ) ) ( ON ?auto_63026 ?auto_63027 ) ( not ( = ?auto_63022 ?auto_63027 ) ) ( not ( = ?auto_63023 ?auto_63027 ) ) ( not ( = ?auto_63024 ?auto_63027 ) ) ( not ( = ?auto_63025 ?auto_63027 ) ) ( not ( = ?auto_63026 ?auto_63027 ) ) ( ON ?auto_63025 ?auto_63026 ) ( ON-TABLE ?auto_63027 ) ( ON ?auto_63024 ?auto_63025 ) ( ON ?auto_63022 ?auto_63028 ) ( not ( = ?auto_63022 ?auto_63028 ) ) ( not ( = ?auto_63023 ?auto_63028 ) ) ( not ( = ?auto_63024 ?auto_63028 ) ) ( not ( = ?auto_63025 ?auto_63028 ) ) ( not ( = ?auto_63026 ?auto_63028 ) ) ( not ( = ?auto_63027 ?auto_63028 ) ) ( CLEAR ?auto_63024 ) ( ON ?auto_63023 ?auto_63022 ) ( CLEAR ?auto_63023 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63028 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63028 ?auto_63022 )
      ( MAKE-5PILE ?auto_63022 ?auto_63023 ?auto_63024 ?auto_63025 ?auto_63026 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63029 - BLOCK
      ?auto_63030 - BLOCK
      ?auto_63031 - BLOCK
      ?auto_63032 - BLOCK
      ?auto_63033 - BLOCK
    )
    :vars
    (
      ?auto_63035 - BLOCK
      ?auto_63034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63029 ?auto_63030 ) ) ( not ( = ?auto_63029 ?auto_63031 ) ) ( not ( = ?auto_63029 ?auto_63032 ) ) ( not ( = ?auto_63029 ?auto_63033 ) ) ( not ( = ?auto_63030 ?auto_63031 ) ) ( not ( = ?auto_63030 ?auto_63032 ) ) ( not ( = ?auto_63030 ?auto_63033 ) ) ( not ( = ?auto_63031 ?auto_63032 ) ) ( not ( = ?auto_63031 ?auto_63033 ) ) ( not ( = ?auto_63032 ?auto_63033 ) ) ( ON ?auto_63033 ?auto_63035 ) ( not ( = ?auto_63029 ?auto_63035 ) ) ( not ( = ?auto_63030 ?auto_63035 ) ) ( not ( = ?auto_63031 ?auto_63035 ) ) ( not ( = ?auto_63032 ?auto_63035 ) ) ( not ( = ?auto_63033 ?auto_63035 ) ) ( ON ?auto_63032 ?auto_63033 ) ( ON-TABLE ?auto_63035 ) ( ON ?auto_63029 ?auto_63034 ) ( not ( = ?auto_63029 ?auto_63034 ) ) ( not ( = ?auto_63030 ?auto_63034 ) ) ( not ( = ?auto_63031 ?auto_63034 ) ) ( not ( = ?auto_63032 ?auto_63034 ) ) ( not ( = ?auto_63033 ?auto_63034 ) ) ( not ( = ?auto_63035 ?auto_63034 ) ) ( ON ?auto_63030 ?auto_63029 ) ( CLEAR ?auto_63030 ) ( ON-TABLE ?auto_63034 ) ( HOLDING ?auto_63031 ) ( CLEAR ?auto_63032 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63035 ?auto_63033 ?auto_63032 ?auto_63031 )
      ( MAKE-5PILE ?auto_63029 ?auto_63030 ?auto_63031 ?auto_63032 ?auto_63033 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63036 - BLOCK
      ?auto_63037 - BLOCK
      ?auto_63038 - BLOCK
      ?auto_63039 - BLOCK
      ?auto_63040 - BLOCK
    )
    :vars
    (
      ?auto_63041 - BLOCK
      ?auto_63042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63036 ?auto_63037 ) ) ( not ( = ?auto_63036 ?auto_63038 ) ) ( not ( = ?auto_63036 ?auto_63039 ) ) ( not ( = ?auto_63036 ?auto_63040 ) ) ( not ( = ?auto_63037 ?auto_63038 ) ) ( not ( = ?auto_63037 ?auto_63039 ) ) ( not ( = ?auto_63037 ?auto_63040 ) ) ( not ( = ?auto_63038 ?auto_63039 ) ) ( not ( = ?auto_63038 ?auto_63040 ) ) ( not ( = ?auto_63039 ?auto_63040 ) ) ( ON ?auto_63040 ?auto_63041 ) ( not ( = ?auto_63036 ?auto_63041 ) ) ( not ( = ?auto_63037 ?auto_63041 ) ) ( not ( = ?auto_63038 ?auto_63041 ) ) ( not ( = ?auto_63039 ?auto_63041 ) ) ( not ( = ?auto_63040 ?auto_63041 ) ) ( ON ?auto_63039 ?auto_63040 ) ( ON-TABLE ?auto_63041 ) ( ON ?auto_63036 ?auto_63042 ) ( not ( = ?auto_63036 ?auto_63042 ) ) ( not ( = ?auto_63037 ?auto_63042 ) ) ( not ( = ?auto_63038 ?auto_63042 ) ) ( not ( = ?auto_63039 ?auto_63042 ) ) ( not ( = ?auto_63040 ?auto_63042 ) ) ( not ( = ?auto_63041 ?auto_63042 ) ) ( ON ?auto_63037 ?auto_63036 ) ( ON-TABLE ?auto_63042 ) ( CLEAR ?auto_63039 ) ( ON ?auto_63038 ?auto_63037 ) ( CLEAR ?auto_63038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63042 ?auto_63036 ?auto_63037 )
      ( MAKE-5PILE ?auto_63036 ?auto_63037 ?auto_63038 ?auto_63039 ?auto_63040 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63043 - BLOCK
      ?auto_63044 - BLOCK
      ?auto_63045 - BLOCK
      ?auto_63046 - BLOCK
      ?auto_63047 - BLOCK
    )
    :vars
    (
      ?auto_63049 - BLOCK
      ?auto_63048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63043 ?auto_63044 ) ) ( not ( = ?auto_63043 ?auto_63045 ) ) ( not ( = ?auto_63043 ?auto_63046 ) ) ( not ( = ?auto_63043 ?auto_63047 ) ) ( not ( = ?auto_63044 ?auto_63045 ) ) ( not ( = ?auto_63044 ?auto_63046 ) ) ( not ( = ?auto_63044 ?auto_63047 ) ) ( not ( = ?auto_63045 ?auto_63046 ) ) ( not ( = ?auto_63045 ?auto_63047 ) ) ( not ( = ?auto_63046 ?auto_63047 ) ) ( ON ?auto_63047 ?auto_63049 ) ( not ( = ?auto_63043 ?auto_63049 ) ) ( not ( = ?auto_63044 ?auto_63049 ) ) ( not ( = ?auto_63045 ?auto_63049 ) ) ( not ( = ?auto_63046 ?auto_63049 ) ) ( not ( = ?auto_63047 ?auto_63049 ) ) ( ON-TABLE ?auto_63049 ) ( ON ?auto_63043 ?auto_63048 ) ( not ( = ?auto_63043 ?auto_63048 ) ) ( not ( = ?auto_63044 ?auto_63048 ) ) ( not ( = ?auto_63045 ?auto_63048 ) ) ( not ( = ?auto_63046 ?auto_63048 ) ) ( not ( = ?auto_63047 ?auto_63048 ) ) ( not ( = ?auto_63049 ?auto_63048 ) ) ( ON ?auto_63044 ?auto_63043 ) ( ON-TABLE ?auto_63048 ) ( ON ?auto_63045 ?auto_63044 ) ( CLEAR ?auto_63045 ) ( HOLDING ?auto_63046 ) ( CLEAR ?auto_63047 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63049 ?auto_63047 ?auto_63046 )
      ( MAKE-5PILE ?auto_63043 ?auto_63044 ?auto_63045 ?auto_63046 ?auto_63047 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63050 - BLOCK
      ?auto_63051 - BLOCK
      ?auto_63052 - BLOCK
      ?auto_63053 - BLOCK
      ?auto_63054 - BLOCK
    )
    :vars
    (
      ?auto_63056 - BLOCK
      ?auto_63055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63050 ?auto_63051 ) ) ( not ( = ?auto_63050 ?auto_63052 ) ) ( not ( = ?auto_63050 ?auto_63053 ) ) ( not ( = ?auto_63050 ?auto_63054 ) ) ( not ( = ?auto_63051 ?auto_63052 ) ) ( not ( = ?auto_63051 ?auto_63053 ) ) ( not ( = ?auto_63051 ?auto_63054 ) ) ( not ( = ?auto_63052 ?auto_63053 ) ) ( not ( = ?auto_63052 ?auto_63054 ) ) ( not ( = ?auto_63053 ?auto_63054 ) ) ( ON ?auto_63054 ?auto_63056 ) ( not ( = ?auto_63050 ?auto_63056 ) ) ( not ( = ?auto_63051 ?auto_63056 ) ) ( not ( = ?auto_63052 ?auto_63056 ) ) ( not ( = ?auto_63053 ?auto_63056 ) ) ( not ( = ?auto_63054 ?auto_63056 ) ) ( ON-TABLE ?auto_63056 ) ( ON ?auto_63050 ?auto_63055 ) ( not ( = ?auto_63050 ?auto_63055 ) ) ( not ( = ?auto_63051 ?auto_63055 ) ) ( not ( = ?auto_63052 ?auto_63055 ) ) ( not ( = ?auto_63053 ?auto_63055 ) ) ( not ( = ?auto_63054 ?auto_63055 ) ) ( not ( = ?auto_63056 ?auto_63055 ) ) ( ON ?auto_63051 ?auto_63050 ) ( ON-TABLE ?auto_63055 ) ( ON ?auto_63052 ?auto_63051 ) ( CLEAR ?auto_63054 ) ( ON ?auto_63053 ?auto_63052 ) ( CLEAR ?auto_63053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63055 ?auto_63050 ?auto_63051 ?auto_63052 )
      ( MAKE-5PILE ?auto_63050 ?auto_63051 ?auto_63052 ?auto_63053 ?auto_63054 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63057 - BLOCK
      ?auto_63058 - BLOCK
      ?auto_63059 - BLOCK
      ?auto_63060 - BLOCK
      ?auto_63061 - BLOCK
    )
    :vars
    (
      ?auto_63063 - BLOCK
      ?auto_63062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63057 ?auto_63058 ) ) ( not ( = ?auto_63057 ?auto_63059 ) ) ( not ( = ?auto_63057 ?auto_63060 ) ) ( not ( = ?auto_63057 ?auto_63061 ) ) ( not ( = ?auto_63058 ?auto_63059 ) ) ( not ( = ?auto_63058 ?auto_63060 ) ) ( not ( = ?auto_63058 ?auto_63061 ) ) ( not ( = ?auto_63059 ?auto_63060 ) ) ( not ( = ?auto_63059 ?auto_63061 ) ) ( not ( = ?auto_63060 ?auto_63061 ) ) ( not ( = ?auto_63057 ?auto_63063 ) ) ( not ( = ?auto_63058 ?auto_63063 ) ) ( not ( = ?auto_63059 ?auto_63063 ) ) ( not ( = ?auto_63060 ?auto_63063 ) ) ( not ( = ?auto_63061 ?auto_63063 ) ) ( ON-TABLE ?auto_63063 ) ( ON ?auto_63057 ?auto_63062 ) ( not ( = ?auto_63057 ?auto_63062 ) ) ( not ( = ?auto_63058 ?auto_63062 ) ) ( not ( = ?auto_63059 ?auto_63062 ) ) ( not ( = ?auto_63060 ?auto_63062 ) ) ( not ( = ?auto_63061 ?auto_63062 ) ) ( not ( = ?auto_63063 ?auto_63062 ) ) ( ON ?auto_63058 ?auto_63057 ) ( ON-TABLE ?auto_63062 ) ( ON ?auto_63059 ?auto_63058 ) ( ON ?auto_63060 ?auto_63059 ) ( CLEAR ?auto_63060 ) ( HOLDING ?auto_63061 ) ( CLEAR ?auto_63063 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63063 ?auto_63061 )
      ( MAKE-5PILE ?auto_63057 ?auto_63058 ?auto_63059 ?auto_63060 ?auto_63061 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63064 - BLOCK
      ?auto_63065 - BLOCK
      ?auto_63066 - BLOCK
      ?auto_63067 - BLOCK
      ?auto_63068 - BLOCK
    )
    :vars
    (
      ?auto_63069 - BLOCK
      ?auto_63070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63064 ?auto_63065 ) ) ( not ( = ?auto_63064 ?auto_63066 ) ) ( not ( = ?auto_63064 ?auto_63067 ) ) ( not ( = ?auto_63064 ?auto_63068 ) ) ( not ( = ?auto_63065 ?auto_63066 ) ) ( not ( = ?auto_63065 ?auto_63067 ) ) ( not ( = ?auto_63065 ?auto_63068 ) ) ( not ( = ?auto_63066 ?auto_63067 ) ) ( not ( = ?auto_63066 ?auto_63068 ) ) ( not ( = ?auto_63067 ?auto_63068 ) ) ( not ( = ?auto_63064 ?auto_63069 ) ) ( not ( = ?auto_63065 ?auto_63069 ) ) ( not ( = ?auto_63066 ?auto_63069 ) ) ( not ( = ?auto_63067 ?auto_63069 ) ) ( not ( = ?auto_63068 ?auto_63069 ) ) ( ON-TABLE ?auto_63069 ) ( ON ?auto_63064 ?auto_63070 ) ( not ( = ?auto_63064 ?auto_63070 ) ) ( not ( = ?auto_63065 ?auto_63070 ) ) ( not ( = ?auto_63066 ?auto_63070 ) ) ( not ( = ?auto_63067 ?auto_63070 ) ) ( not ( = ?auto_63068 ?auto_63070 ) ) ( not ( = ?auto_63069 ?auto_63070 ) ) ( ON ?auto_63065 ?auto_63064 ) ( ON-TABLE ?auto_63070 ) ( ON ?auto_63066 ?auto_63065 ) ( ON ?auto_63067 ?auto_63066 ) ( CLEAR ?auto_63069 ) ( ON ?auto_63068 ?auto_63067 ) ( CLEAR ?auto_63068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63070 ?auto_63064 ?auto_63065 ?auto_63066 ?auto_63067 )
      ( MAKE-5PILE ?auto_63064 ?auto_63065 ?auto_63066 ?auto_63067 ?auto_63068 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63071 - BLOCK
      ?auto_63072 - BLOCK
      ?auto_63073 - BLOCK
      ?auto_63074 - BLOCK
      ?auto_63075 - BLOCK
    )
    :vars
    (
      ?auto_63076 - BLOCK
      ?auto_63077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63071 ?auto_63072 ) ) ( not ( = ?auto_63071 ?auto_63073 ) ) ( not ( = ?auto_63071 ?auto_63074 ) ) ( not ( = ?auto_63071 ?auto_63075 ) ) ( not ( = ?auto_63072 ?auto_63073 ) ) ( not ( = ?auto_63072 ?auto_63074 ) ) ( not ( = ?auto_63072 ?auto_63075 ) ) ( not ( = ?auto_63073 ?auto_63074 ) ) ( not ( = ?auto_63073 ?auto_63075 ) ) ( not ( = ?auto_63074 ?auto_63075 ) ) ( not ( = ?auto_63071 ?auto_63076 ) ) ( not ( = ?auto_63072 ?auto_63076 ) ) ( not ( = ?auto_63073 ?auto_63076 ) ) ( not ( = ?auto_63074 ?auto_63076 ) ) ( not ( = ?auto_63075 ?auto_63076 ) ) ( ON ?auto_63071 ?auto_63077 ) ( not ( = ?auto_63071 ?auto_63077 ) ) ( not ( = ?auto_63072 ?auto_63077 ) ) ( not ( = ?auto_63073 ?auto_63077 ) ) ( not ( = ?auto_63074 ?auto_63077 ) ) ( not ( = ?auto_63075 ?auto_63077 ) ) ( not ( = ?auto_63076 ?auto_63077 ) ) ( ON ?auto_63072 ?auto_63071 ) ( ON-TABLE ?auto_63077 ) ( ON ?auto_63073 ?auto_63072 ) ( ON ?auto_63074 ?auto_63073 ) ( ON ?auto_63075 ?auto_63074 ) ( CLEAR ?auto_63075 ) ( HOLDING ?auto_63076 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63076 )
      ( MAKE-5PILE ?auto_63071 ?auto_63072 ?auto_63073 ?auto_63074 ?auto_63075 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63078 - BLOCK
      ?auto_63079 - BLOCK
      ?auto_63080 - BLOCK
      ?auto_63081 - BLOCK
      ?auto_63082 - BLOCK
    )
    :vars
    (
      ?auto_63083 - BLOCK
      ?auto_63084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63078 ?auto_63079 ) ) ( not ( = ?auto_63078 ?auto_63080 ) ) ( not ( = ?auto_63078 ?auto_63081 ) ) ( not ( = ?auto_63078 ?auto_63082 ) ) ( not ( = ?auto_63079 ?auto_63080 ) ) ( not ( = ?auto_63079 ?auto_63081 ) ) ( not ( = ?auto_63079 ?auto_63082 ) ) ( not ( = ?auto_63080 ?auto_63081 ) ) ( not ( = ?auto_63080 ?auto_63082 ) ) ( not ( = ?auto_63081 ?auto_63082 ) ) ( not ( = ?auto_63078 ?auto_63083 ) ) ( not ( = ?auto_63079 ?auto_63083 ) ) ( not ( = ?auto_63080 ?auto_63083 ) ) ( not ( = ?auto_63081 ?auto_63083 ) ) ( not ( = ?auto_63082 ?auto_63083 ) ) ( ON ?auto_63078 ?auto_63084 ) ( not ( = ?auto_63078 ?auto_63084 ) ) ( not ( = ?auto_63079 ?auto_63084 ) ) ( not ( = ?auto_63080 ?auto_63084 ) ) ( not ( = ?auto_63081 ?auto_63084 ) ) ( not ( = ?auto_63082 ?auto_63084 ) ) ( not ( = ?auto_63083 ?auto_63084 ) ) ( ON ?auto_63079 ?auto_63078 ) ( ON-TABLE ?auto_63084 ) ( ON ?auto_63080 ?auto_63079 ) ( ON ?auto_63081 ?auto_63080 ) ( ON ?auto_63082 ?auto_63081 ) ( ON ?auto_63083 ?auto_63082 ) ( CLEAR ?auto_63083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63084 ?auto_63078 ?auto_63079 ?auto_63080 ?auto_63081 ?auto_63082 )
      ( MAKE-5PILE ?auto_63078 ?auto_63079 ?auto_63080 ?auto_63081 ?auto_63082 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63097 - BLOCK
      ?auto_63098 - BLOCK
      ?auto_63099 - BLOCK
      ?auto_63100 - BLOCK
      ?auto_63101 - BLOCK
      ?auto_63102 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63101 ) ( ON-TABLE ?auto_63097 ) ( ON ?auto_63098 ?auto_63097 ) ( ON ?auto_63099 ?auto_63098 ) ( ON ?auto_63100 ?auto_63099 ) ( ON ?auto_63101 ?auto_63100 ) ( not ( = ?auto_63097 ?auto_63098 ) ) ( not ( = ?auto_63097 ?auto_63099 ) ) ( not ( = ?auto_63097 ?auto_63100 ) ) ( not ( = ?auto_63097 ?auto_63101 ) ) ( not ( = ?auto_63097 ?auto_63102 ) ) ( not ( = ?auto_63098 ?auto_63099 ) ) ( not ( = ?auto_63098 ?auto_63100 ) ) ( not ( = ?auto_63098 ?auto_63101 ) ) ( not ( = ?auto_63098 ?auto_63102 ) ) ( not ( = ?auto_63099 ?auto_63100 ) ) ( not ( = ?auto_63099 ?auto_63101 ) ) ( not ( = ?auto_63099 ?auto_63102 ) ) ( not ( = ?auto_63100 ?auto_63101 ) ) ( not ( = ?auto_63100 ?auto_63102 ) ) ( not ( = ?auto_63101 ?auto_63102 ) ) ( ON-TABLE ?auto_63102 ) ( CLEAR ?auto_63102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_63102 )
      ( MAKE-6PILE ?auto_63097 ?auto_63098 ?auto_63099 ?auto_63100 ?auto_63101 ?auto_63102 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63103 - BLOCK
      ?auto_63104 - BLOCK
      ?auto_63105 - BLOCK
      ?auto_63106 - BLOCK
      ?auto_63107 - BLOCK
      ?auto_63108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63103 ) ( ON ?auto_63104 ?auto_63103 ) ( ON ?auto_63105 ?auto_63104 ) ( ON ?auto_63106 ?auto_63105 ) ( not ( = ?auto_63103 ?auto_63104 ) ) ( not ( = ?auto_63103 ?auto_63105 ) ) ( not ( = ?auto_63103 ?auto_63106 ) ) ( not ( = ?auto_63103 ?auto_63107 ) ) ( not ( = ?auto_63103 ?auto_63108 ) ) ( not ( = ?auto_63104 ?auto_63105 ) ) ( not ( = ?auto_63104 ?auto_63106 ) ) ( not ( = ?auto_63104 ?auto_63107 ) ) ( not ( = ?auto_63104 ?auto_63108 ) ) ( not ( = ?auto_63105 ?auto_63106 ) ) ( not ( = ?auto_63105 ?auto_63107 ) ) ( not ( = ?auto_63105 ?auto_63108 ) ) ( not ( = ?auto_63106 ?auto_63107 ) ) ( not ( = ?auto_63106 ?auto_63108 ) ) ( not ( = ?auto_63107 ?auto_63108 ) ) ( ON-TABLE ?auto_63108 ) ( CLEAR ?auto_63108 ) ( HOLDING ?auto_63107 ) ( CLEAR ?auto_63106 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63103 ?auto_63104 ?auto_63105 ?auto_63106 ?auto_63107 )
      ( MAKE-6PILE ?auto_63103 ?auto_63104 ?auto_63105 ?auto_63106 ?auto_63107 ?auto_63108 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63109 - BLOCK
      ?auto_63110 - BLOCK
      ?auto_63111 - BLOCK
      ?auto_63112 - BLOCK
      ?auto_63113 - BLOCK
      ?auto_63114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63109 ) ( ON ?auto_63110 ?auto_63109 ) ( ON ?auto_63111 ?auto_63110 ) ( ON ?auto_63112 ?auto_63111 ) ( not ( = ?auto_63109 ?auto_63110 ) ) ( not ( = ?auto_63109 ?auto_63111 ) ) ( not ( = ?auto_63109 ?auto_63112 ) ) ( not ( = ?auto_63109 ?auto_63113 ) ) ( not ( = ?auto_63109 ?auto_63114 ) ) ( not ( = ?auto_63110 ?auto_63111 ) ) ( not ( = ?auto_63110 ?auto_63112 ) ) ( not ( = ?auto_63110 ?auto_63113 ) ) ( not ( = ?auto_63110 ?auto_63114 ) ) ( not ( = ?auto_63111 ?auto_63112 ) ) ( not ( = ?auto_63111 ?auto_63113 ) ) ( not ( = ?auto_63111 ?auto_63114 ) ) ( not ( = ?auto_63112 ?auto_63113 ) ) ( not ( = ?auto_63112 ?auto_63114 ) ) ( not ( = ?auto_63113 ?auto_63114 ) ) ( ON-TABLE ?auto_63114 ) ( CLEAR ?auto_63112 ) ( ON ?auto_63113 ?auto_63114 ) ( CLEAR ?auto_63113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63114 )
      ( MAKE-6PILE ?auto_63109 ?auto_63110 ?auto_63111 ?auto_63112 ?auto_63113 ?auto_63114 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63115 - BLOCK
      ?auto_63116 - BLOCK
      ?auto_63117 - BLOCK
      ?auto_63118 - BLOCK
      ?auto_63119 - BLOCK
      ?auto_63120 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63115 ) ( ON ?auto_63116 ?auto_63115 ) ( ON ?auto_63117 ?auto_63116 ) ( not ( = ?auto_63115 ?auto_63116 ) ) ( not ( = ?auto_63115 ?auto_63117 ) ) ( not ( = ?auto_63115 ?auto_63118 ) ) ( not ( = ?auto_63115 ?auto_63119 ) ) ( not ( = ?auto_63115 ?auto_63120 ) ) ( not ( = ?auto_63116 ?auto_63117 ) ) ( not ( = ?auto_63116 ?auto_63118 ) ) ( not ( = ?auto_63116 ?auto_63119 ) ) ( not ( = ?auto_63116 ?auto_63120 ) ) ( not ( = ?auto_63117 ?auto_63118 ) ) ( not ( = ?auto_63117 ?auto_63119 ) ) ( not ( = ?auto_63117 ?auto_63120 ) ) ( not ( = ?auto_63118 ?auto_63119 ) ) ( not ( = ?auto_63118 ?auto_63120 ) ) ( not ( = ?auto_63119 ?auto_63120 ) ) ( ON-TABLE ?auto_63120 ) ( ON ?auto_63119 ?auto_63120 ) ( CLEAR ?auto_63119 ) ( HOLDING ?auto_63118 ) ( CLEAR ?auto_63117 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63115 ?auto_63116 ?auto_63117 ?auto_63118 )
      ( MAKE-6PILE ?auto_63115 ?auto_63116 ?auto_63117 ?auto_63118 ?auto_63119 ?auto_63120 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63121 - BLOCK
      ?auto_63122 - BLOCK
      ?auto_63123 - BLOCK
      ?auto_63124 - BLOCK
      ?auto_63125 - BLOCK
      ?auto_63126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63121 ) ( ON ?auto_63122 ?auto_63121 ) ( ON ?auto_63123 ?auto_63122 ) ( not ( = ?auto_63121 ?auto_63122 ) ) ( not ( = ?auto_63121 ?auto_63123 ) ) ( not ( = ?auto_63121 ?auto_63124 ) ) ( not ( = ?auto_63121 ?auto_63125 ) ) ( not ( = ?auto_63121 ?auto_63126 ) ) ( not ( = ?auto_63122 ?auto_63123 ) ) ( not ( = ?auto_63122 ?auto_63124 ) ) ( not ( = ?auto_63122 ?auto_63125 ) ) ( not ( = ?auto_63122 ?auto_63126 ) ) ( not ( = ?auto_63123 ?auto_63124 ) ) ( not ( = ?auto_63123 ?auto_63125 ) ) ( not ( = ?auto_63123 ?auto_63126 ) ) ( not ( = ?auto_63124 ?auto_63125 ) ) ( not ( = ?auto_63124 ?auto_63126 ) ) ( not ( = ?auto_63125 ?auto_63126 ) ) ( ON-TABLE ?auto_63126 ) ( ON ?auto_63125 ?auto_63126 ) ( CLEAR ?auto_63123 ) ( ON ?auto_63124 ?auto_63125 ) ( CLEAR ?auto_63124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63126 ?auto_63125 )
      ( MAKE-6PILE ?auto_63121 ?auto_63122 ?auto_63123 ?auto_63124 ?auto_63125 ?auto_63126 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63127 - BLOCK
      ?auto_63128 - BLOCK
      ?auto_63129 - BLOCK
      ?auto_63130 - BLOCK
      ?auto_63131 - BLOCK
      ?auto_63132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63127 ) ( ON ?auto_63128 ?auto_63127 ) ( not ( = ?auto_63127 ?auto_63128 ) ) ( not ( = ?auto_63127 ?auto_63129 ) ) ( not ( = ?auto_63127 ?auto_63130 ) ) ( not ( = ?auto_63127 ?auto_63131 ) ) ( not ( = ?auto_63127 ?auto_63132 ) ) ( not ( = ?auto_63128 ?auto_63129 ) ) ( not ( = ?auto_63128 ?auto_63130 ) ) ( not ( = ?auto_63128 ?auto_63131 ) ) ( not ( = ?auto_63128 ?auto_63132 ) ) ( not ( = ?auto_63129 ?auto_63130 ) ) ( not ( = ?auto_63129 ?auto_63131 ) ) ( not ( = ?auto_63129 ?auto_63132 ) ) ( not ( = ?auto_63130 ?auto_63131 ) ) ( not ( = ?auto_63130 ?auto_63132 ) ) ( not ( = ?auto_63131 ?auto_63132 ) ) ( ON-TABLE ?auto_63132 ) ( ON ?auto_63131 ?auto_63132 ) ( ON ?auto_63130 ?auto_63131 ) ( CLEAR ?auto_63130 ) ( HOLDING ?auto_63129 ) ( CLEAR ?auto_63128 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63127 ?auto_63128 ?auto_63129 )
      ( MAKE-6PILE ?auto_63127 ?auto_63128 ?auto_63129 ?auto_63130 ?auto_63131 ?auto_63132 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63133 - BLOCK
      ?auto_63134 - BLOCK
      ?auto_63135 - BLOCK
      ?auto_63136 - BLOCK
      ?auto_63137 - BLOCK
      ?auto_63138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63133 ) ( ON ?auto_63134 ?auto_63133 ) ( not ( = ?auto_63133 ?auto_63134 ) ) ( not ( = ?auto_63133 ?auto_63135 ) ) ( not ( = ?auto_63133 ?auto_63136 ) ) ( not ( = ?auto_63133 ?auto_63137 ) ) ( not ( = ?auto_63133 ?auto_63138 ) ) ( not ( = ?auto_63134 ?auto_63135 ) ) ( not ( = ?auto_63134 ?auto_63136 ) ) ( not ( = ?auto_63134 ?auto_63137 ) ) ( not ( = ?auto_63134 ?auto_63138 ) ) ( not ( = ?auto_63135 ?auto_63136 ) ) ( not ( = ?auto_63135 ?auto_63137 ) ) ( not ( = ?auto_63135 ?auto_63138 ) ) ( not ( = ?auto_63136 ?auto_63137 ) ) ( not ( = ?auto_63136 ?auto_63138 ) ) ( not ( = ?auto_63137 ?auto_63138 ) ) ( ON-TABLE ?auto_63138 ) ( ON ?auto_63137 ?auto_63138 ) ( ON ?auto_63136 ?auto_63137 ) ( CLEAR ?auto_63134 ) ( ON ?auto_63135 ?auto_63136 ) ( CLEAR ?auto_63135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63138 ?auto_63137 ?auto_63136 )
      ( MAKE-6PILE ?auto_63133 ?auto_63134 ?auto_63135 ?auto_63136 ?auto_63137 ?auto_63138 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63139 - BLOCK
      ?auto_63140 - BLOCK
      ?auto_63141 - BLOCK
      ?auto_63142 - BLOCK
      ?auto_63143 - BLOCK
      ?auto_63144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63139 ) ( not ( = ?auto_63139 ?auto_63140 ) ) ( not ( = ?auto_63139 ?auto_63141 ) ) ( not ( = ?auto_63139 ?auto_63142 ) ) ( not ( = ?auto_63139 ?auto_63143 ) ) ( not ( = ?auto_63139 ?auto_63144 ) ) ( not ( = ?auto_63140 ?auto_63141 ) ) ( not ( = ?auto_63140 ?auto_63142 ) ) ( not ( = ?auto_63140 ?auto_63143 ) ) ( not ( = ?auto_63140 ?auto_63144 ) ) ( not ( = ?auto_63141 ?auto_63142 ) ) ( not ( = ?auto_63141 ?auto_63143 ) ) ( not ( = ?auto_63141 ?auto_63144 ) ) ( not ( = ?auto_63142 ?auto_63143 ) ) ( not ( = ?auto_63142 ?auto_63144 ) ) ( not ( = ?auto_63143 ?auto_63144 ) ) ( ON-TABLE ?auto_63144 ) ( ON ?auto_63143 ?auto_63144 ) ( ON ?auto_63142 ?auto_63143 ) ( ON ?auto_63141 ?auto_63142 ) ( CLEAR ?auto_63141 ) ( HOLDING ?auto_63140 ) ( CLEAR ?auto_63139 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63139 ?auto_63140 )
      ( MAKE-6PILE ?auto_63139 ?auto_63140 ?auto_63141 ?auto_63142 ?auto_63143 ?auto_63144 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63145 - BLOCK
      ?auto_63146 - BLOCK
      ?auto_63147 - BLOCK
      ?auto_63148 - BLOCK
      ?auto_63149 - BLOCK
      ?auto_63150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63145 ) ( not ( = ?auto_63145 ?auto_63146 ) ) ( not ( = ?auto_63145 ?auto_63147 ) ) ( not ( = ?auto_63145 ?auto_63148 ) ) ( not ( = ?auto_63145 ?auto_63149 ) ) ( not ( = ?auto_63145 ?auto_63150 ) ) ( not ( = ?auto_63146 ?auto_63147 ) ) ( not ( = ?auto_63146 ?auto_63148 ) ) ( not ( = ?auto_63146 ?auto_63149 ) ) ( not ( = ?auto_63146 ?auto_63150 ) ) ( not ( = ?auto_63147 ?auto_63148 ) ) ( not ( = ?auto_63147 ?auto_63149 ) ) ( not ( = ?auto_63147 ?auto_63150 ) ) ( not ( = ?auto_63148 ?auto_63149 ) ) ( not ( = ?auto_63148 ?auto_63150 ) ) ( not ( = ?auto_63149 ?auto_63150 ) ) ( ON-TABLE ?auto_63150 ) ( ON ?auto_63149 ?auto_63150 ) ( ON ?auto_63148 ?auto_63149 ) ( ON ?auto_63147 ?auto_63148 ) ( CLEAR ?auto_63145 ) ( ON ?auto_63146 ?auto_63147 ) ( CLEAR ?auto_63146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63150 ?auto_63149 ?auto_63148 ?auto_63147 )
      ( MAKE-6PILE ?auto_63145 ?auto_63146 ?auto_63147 ?auto_63148 ?auto_63149 ?auto_63150 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63151 - BLOCK
      ?auto_63152 - BLOCK
      ?auto_63153 - BLOCK
      ?auto_63154 - BLOCK
      ?auto_63155 - BLOCK
      ?auto_63156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63151 ?auto_63152 ) ) ( not ( = ?auto_63151 ?auto_63153 ) ) ( not ( = ?auto_63151 ?auto_63154 ) ) ( not ( = ?auto_63151 ?auto_63155 ) ) ( not ( = ?auto_63151 ?auto_63156 ) ) ( not ( = ?auto_63152 ?auto_63153 ) ) ( not ( = ?auto_63152 ?auto_63154 ) ) ( not ( = ?auto_63152 ?auto_63155 ) ) ( not ( = ?auto_63152 ?auto_63156 ) ) ( not ( = ?auto_63153 ?auto_63154 ) ) ( not ( = ?auto_63153 ?auto_63155 ) ) ( not ( = ?auto_63153 ?auto_63156 ) ) ( not ( = ?auto_63154 ?auto_63155 ) ) ( not ( = ?auto_63154 ?auto_63156 ) ) ( not ( = ?auto_63155 ?auto_63156 ) ) ( ON-TABLE ?auto_63156 ) ( ON ?auto_63155 ?auto_63156 ) ( ON ?auto_63154 ?auto_63155 ) ( ON ?auto_63153 ?auto_63154 ) ( ON ?auto_63152 ?auto_63153 ) ( CLEAR ?auto_63152 ) ( HOLDING ?auto_63151 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63151 )
      ( MAKE-6PILE ?auto_63151 ?auto_63152 ?auto_63153 ?auto_63154 ?auto_63155 ?auto_63156 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63157 - BLOCK
      ?auto_63158 - BLOCK
      ?auto_63159 - BLOCK
      ?auto_63160 - BLOCK
      ?auto_63161 - BLOCK
      ?auto_63162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63157 ?auto_63158 ) ) ( not ( = ?auto_63157 ?auto_63159 ) ) ( not ( = ?auto_63157 ?auto_63160 ) ) ( not ( = ?auto_63157 ?auto_63161 ) ) ( not ( = ?auto_63157 ?auto_63162 ) ) ( not ( = ?auto_63158 ?auto_63159 ) ) ( not ( = ?auto_63158 ?auto_63160 ) ) ( not ( = ?auto_63158 ?auto_63161 ) ) ( not ( = ?auto_63158 ?auto_63162 ) ) ( not ( = ?auto_63159 ?auto_63160 ) ) ( not ( = ?auto_63159 ?auto_63161 ) ) ( not ( = ?auto_63159 ?auto_63162 ) ) ( not ( = ?auto_63160 ?auto_63161 ) ) ( not ( = ?auto_63160 ?auto_63162 ) ) ( not ( = ?auto_63161 ?auto_63162 ) ) ( ON-TABLE ?auto_63162 ) ( ON ?auto_63161 ?auto_63162 ) ( ON ?auto_63160 ?auto_63161 ) ( ON ?auto_63159 ?auto_63160 ) ( ON ?auto_63158 ?auto_63159 ) ( ON ?auto_63157 ?auto_63158 ) ( CLEAR ?auto_63157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63162 ?auto_63161 ?auto_63160 ?auto_63159 ?auto_63158 )
      ( MAKE-6PILE ?auto_63157 ?auto_63158 ?auto_63159 ?auto_63160 ?auto_63161 ?auto_63162 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63169 - BLOCK
      ?auto_63170 - BLOCK
      ?auto_63171 - BLOCK
      ?auto_63172 - BLOCK
      ?auto_63173 - BLOCK
      ?auto_63174 - BLOCK
    )
    :vars
    (
      ?auto_63175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63169 ?auto_63170 ) ) ( not ( = ?auto_63169 ?auto_63171 ) ) ( not ( = ?auto_63169 ?auto_63172 ) ) ( not ( = ?auto_63169 ?auto_63173 ) ) ( not ( = ?auto_63169 ?auto_63174 ) ) ( not ( = ?auto_63170 ?auto_63171 ) ) ( not ( = ?auto_63170 ?auto_63172 ) ) ( not ( = ?auto_63170 ?auto_63173 ) ) ( not ( = ?auto_63170 ?auto_63174 ) ) ( not ( = ?auto_63171 ?auto_63172 ) ) ( not ( = ?auto_63171 ?auto_63173 ) ) ( not ( = ?auto_63171 ?auto_63174 ) ) ( not ( = ?auto_63172 ?auto_63173 ) ) ( not ( = ?auto_63172 ?auto_63174 ) ) ( not ( = ?auto_63173 ?auto_63174 ) ) ( ON-TABLE ?auto_63174 ) ( ON ?auto_63173 ?auto_63174 ) ( ON ?auto_63172 ?auto_63173 ) ( ON ?auto_63171 ?auto_63172 ) ( ON ?auto_63170 ?auto_63171 ) ( CLEAR ?auto_63170 ) ( ON ?auto_63169 ?auto_63175 ) ( CLEAR ?auto_63169 ) ( HAND-EMPTY ) ( not ( = ?auto_63169 ?auto_63175 ) ) ( not ( = ?auto_63170 ?auto_63175 ) ) ( not ( = ?auto_63171 ?auto_63175 ) ) ( not ( = ?auto_63172 ?auto_63175 ) ) ( not ( = ?auto_63173 ?auto_63175 ) ) ( not ( = ?auto_63174 ?auto_63175 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63169 ?auto_63175 )
      ( MAKE-6PILE ?auto_63169 ?auto_63170 ?auto_63171 ?auto_63172 ?auto_63173 ?auto_63174 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63176 - BLOCK
      ?auto_63177 - BLOCK
      ?auto_63178 - BLOCK
      ?auto_63179 - BLOCK
      ?auto_63180 - BLOCK
      ?auto_63181 - BLOCK
    )
    :vars
    (
      ?auto_63182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63176 ?auto_63177 ) ) ( not ( = ?auto_63176 ?auto_63178 ) ) ( not ( = ?auto_63176 ?auto_63179 ) ) ( not ( = ?auto_63176 ?auto_63180 ) ) ( not ( = ?auto_63176 ?auto_63181 ) ) ( not ( = ?auto_63177 ?auto_63178 ) ) ( not ( = ?auto_63177 ?auto_63179 ) ) ( not ( = ?auto_63177 ?auto_63180 ) ) ( not ( = ?auto_63177 ?auto_63181 ) ) ( not ( = ?auto_63178 ?auto_63179 ) ) ( not ( = ?auto_63178 ?auto_63180 ) ) ( not ( = ?auto_63178 ?auto_63181 ) ) ( not ( = ?auto_63179 ?auto_63180 ) ) ( not ( = ?auto_63179 ?auto_63181 ) ) ( not ( = ?auto_63180 ?auto_63181 ) ) ( ON-TABLE ?auto_63181 ) ( ON ?auto_63180 ?auto_63181 ) ( ON ?auto_63179 ?auto_63180 ) ( ON ?auto_63178 ?auto_63179 ) ( ON ?auto_63176 ?auto_63182 ) ( CLEAR ?auto_63176 ) ( not ( = ?auto_63176 ?auto_63182 ) ) ( not ( = ?auto_63177 ?auto_63182 ) ) ( not ( = ?auto_63178 ?auto_63182 ) ) ( not ( = ?auto_63179 ?auto_63182 ) ) ( not ( = ?auto_63180 ?auto_63182 ) ) ( not ( = ?auto_63181 ?auto_63182 ) ) ( HOLDING ?auto_63177 ) ( CLEAR ?auto_63178 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63181 ?auto_63180 ?auto_63179 ?auto_63178 ?auto_63177 )
      ( MAKE-6PILE ?auto_63176 ?auto_63177 ?auto_63178 ?auto_63179 ?auto_63180 ?auto_63181 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63183 - BLOCK
      ?auto_63184 - BLOCK
      ?auto_63185 - BLOCK
      ?auto_63186 - BLOCK
      ?auto_63187 - BLOCK
      ?auto_63188 - BLOCK
    )
    :vars
    (
      ?auto_63189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63183 ?auto_63184 ) ) ( not ( = ?auto_63183 ?auto_63185 ) ) ( not ( = ?auto_63183 ?auto_63186 ) ) ( not ( = ?auto_63183 ?auto_63187 ) ) ( not ( = ?auto_63183 ?auto_63188 ) ) ( not ( = ?auto_63184 ?auto_63185 ) ) ( not ( = ?auto_63184 ?auto_63186 ) ) ( not ( = ?auto_63184 ?auto_63187 ) ) ( not ( = ?auto_63184 ?auto_63188 ) ) ( not ( = ?auto_63185 ?auto_63186 ) ) ( not ( = ?auto_63185 ?auto_63187 ) ) ( not ( = ?auto_63185 ?auto_63188 ) ) ( not ( = ?auto_63186 ?auto_63187 ) ) ( not ( = ?auto_63186 ?auto_63188 ) ) ( not ( = ?auto_63187 ?auto_63188 ) ) ( ON-TABLE ?auto_63188 ) ( ON ?auto_63187 ?auto_63188 ) ( ON ?auto_63186 ?auto_63187 ) ( ON ?auto_63185 ?auto_63186 ) ( ON ?auto_63183 ?auto_63189 ) ( not ( = ?auto_63183 ?auto_63189 ) ) ( not ( = ?auto_63184 ?auto_63189 ) ) ( not ( = ?auto_63185 ?auto_63189 ) ) ( not ( = ?auto_63186 ?auto_63189 ) ) ( not ( = ?auto_63187 ?auto_63189 ) ) ( not ( = ?auto_63188 ?auto_63189 ) ) ( CLEAR ?auto_63185 ) ( ON ?auto_63184 ?auto_63183 ) ( CLEAR ?auto_63184 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63189 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63189 ?auto_63183 )
      ( MAKE-6PILE ?auto_63183 ?auto_63184 ?auto_63185 ?auto_63186 ?auto_63187 ?auto_63188 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63190 - BLOCK
      ?auto_63191 - BLOCK
      ?auto_63192 - BLOCK
      ?auto_63193 - BLOCK
      ?auto_63194 - BLOCK
      ?auto_63195 - BLOCK
    )
    :vars
    (
      ?auto_63196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63190 ?auto_63191 ) ) ( not ( = ?auto_63190 ?auto_63192 ) ) ( not ( = ?auto_63190 ?auto_63193 ) ) ( not ( = ?auto_63190 ?auto_63194 ) ) ( not ( = ?auto_63190 ?auto_63195 ) ) ( not ( = ?auto_63191 ?auto_63192 ) ) ( not ( = ?auto_63191 ?auto_63193 ) ) ( not ( = ?auto_63191 ?auto_63194 ) ) ( not ( = ?auto_63191 ?auto_63195 ) ) ( not ( = ?auto_63192 ?auto_63193 ) ) ( not ( = ?auto_63192 ?auto_63194 ) ) ( not ( = ?auto_63192 ?auto_63195 ) ) ( not ( = ?auto_63193 ?auto_63194 ) ) ( not ( = ?auto_63193 ?auto_63195 ) ) ( not ( = ?auto_63194 ?auto_63195 ) ) ( ON-TABLE ?auto_63195 ) ( ON ?auto_63194 ?auto_63195 ) ( ON ?auto_63193 ?auto_63194 ) ( ON ?auto_63190 ?auto_63196 ) ( not ( = ?auto_63190 ?auto_63196 ) ) ( not ( = ?auto_63191 ?auto_63196 ) ) ( not ( = ?auto_63192 ?auto_63196 ) ) ( not ( = ?auto_63193 ?auto_63196 ) ) ( not ( = ?auto_63194 ?auto_63196 ) ) ( not ( = ?auto_63195 ?auto_63196 ) ) ( ON ?auto_63191 ?auto_63190 ) ( CLEAR ?auto_63191 ) ( ON-TABLE ?auto_63196 ) ( HOLDING ?auto_63192 ) ( CLEAR ?auto_63193 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63195 ?auto_63194 ?auto_63193 ?auto_63192 )
      ( MAKE-6PILE ?auto_63190 ?auto_63191 ?auto_63192 ?auto_63193 ?auto_63194 ?auto_63195 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63197 - BLOCK
      ?auto_63198 - BLOCK
      ?auto_63199 - BLOCK
      ?auto_63200 - BLOCK
      ?auto_63201 - BLOCK
      ?auto_63202 - BLOCK
    )
    :vars
    (
      ?auto_63203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63197 ?auto_63198 ) ) ( not ( = ?auto_63197 ?auto_63199 ) ) ( not ( = ?auto_63197 ?auto_63200 ) ) ( not ( = ?auto_63197 ?auto_63201 ) ) ( not ( = ?auto_63197 ?auto_63202 ) ) ( not ( = ?auto_63198 ?auto_63199 ) ) ( not ( = ?auto_63198 ?auto_63200 ) ) ( not ( = ?auto_63198 ?auto_63201 ) ) ( not ( = ?auto_63198 ?auto_63202 ) ) ( not ( = ?auto_63199 ?auto_63200 ) ) ( not ( = ?auto_63199 ?auto_63201 ) ) ( not ( = ?auto_63199 ?auto_63202 ) ) ( not ( = ?auto_63200 ?auto_63201 ) ) ( not ( = ?auto_63200 ?auto_63202 ) ) ( not ( = ?auto_63201 ?auto_63202 ) ) ( ON-TABLE ?auto_63202 ) ( ON ?auto_63201 ?auto_63202 ) ( ON ?auto_63200 ?auto_63201 ) ( ON ?auto_63197 ?auto_63203 ) ( not ( = ?auto_63197 ?auto_63203 ) ) ( not ( = ?auto_63198 ?auto_63203 ) ) ( not ( = ?auto_63199 ?auto_63203 ) ) ( not ( = ?auto_63200 ?auto_63203 ) ) ( not ( = ?auto_63201 ?auto_63203 ) ) ( not ( = ?auto_63202 ?auto_63203 ) ) ( ON ?auto_63198 ?auto_63197 ) ( ON-TABLE ?auto_63203 ) ( CLEAR ?auto_63200 ) ( ON ?auto_63199 ?auto_63198 ) ( CLEAR ?auto_63199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63203 ?auto_63197 ?auto_63198 )
      ( MAKE-6PILE ?auto_63197 ?auto_63198 ?auto_63199 ?auto_63200 ?auto_63201 ?auto_63202 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63204 - BLOCK
      ?auto_63205 - BLOCK
      ?auto_63206 - BLOCK
      ?auto_63207 - BLOCK
      ?auto_63208 - BLOCK
      ?auto_63209 - BLOCK
    )
    :vars
    (
      ?auto_63210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63204 ?auto_63205 ) ) ( not ( = ?auto_63204 ?auto_63206 ) ) ( not ( = ?auto_63204 ?auto_63207 ) ) ( not ( = ?auto_63204 ?auto_63208 ) ) ( not ( = ?auto_63204 ?auto_63209 ) ) ( not ( = ?auto_63205 ?auto_63206 ) ) ( not ( = ?auto_63205 ?auto_63207 ) ) ( not ( = ?auto_63205 ?auto_63208 ) ) ( not ( = ?auto_63205 ?auto_63209 ) ) ( not ( = ?auto_63206 ?auto_63207 ) ) ( not ( = ?auto_63206 ?auto_63208 ) ) ( not ( = ?auto_63206 ?auto_63209 ) ) ( not ( = ?auto_63207 ?auto_63208 ) ) ( not ( = ?auto_63207 ?auto_63209 ) ) ( not ( = ?auto_63208 ?auto_63209 ) ) ( ON-TABLE ?auto_63209 ) ( ON ?auto_63208 ?auto_63209 ) ( ON ?auto_63204 ?auto_63210 ) ( not ( = ?auto_63204 ?auto_63210 ) ) ( not ( = ?auto_63205 ?auto_63210 ) ) ( not ( = ?auto_63206 ?auto_63210 ) ) ( not ( = ?auto_63207 ?auto_63210 ) ) ( not ( = ?auto_63208 ?auto_63210 ) ) ( not ( = ?auto_63209 ?auto_63210 ) ) ( ON ?auto_63205 ?auto_63204 ) ( ON-TABLE ?auto_63210 ) ( ON ?auto_63206 ?auto_63205 ) ( CLEAR ?auto_63206 ) ( HOLDING ?auto_63207 ) ( CLEAR ?auto_63208 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63209 ?auto_63208 ?auto_63207 )
      ( MAKE-6PILE ?auto_63204 ?auto_63205 ?auto_63206 ?auto_63207 ?auto_63208 ?auto_63209 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63211 - BLOCK
      ?auto_63212 - BLOCK
      ?auto_63213 - BLOCK
      ?auto_63214 - BLOCK
      ?auto_63215 - BLOCK
      ?auto_63216 - BLOCK
    )
    :vars
    (
      ?auto_63217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63211 ?auto_63212 ) ) ( not ( = ?auto_63211 ?auto_63213 ) ) ( not ( = ?auto_63211 ?auto_63214 ) ) ( not ( = ?auto_63211 ?auto_63215 ) ) ( not ( = ?auto_63211 ?auto_63216 ) ) ( not ( = ?auto_63212 ?auto_63213 ) ) ( not ( = ?auto_63212 ?auto_63214 ) ) ( not ( = ?auto_63212 ?auto_63215 ) ) ( not ( = ?auto_63212 ?auto_63216 ) ) ( not ( = ?auto_63213 ?auto_63214 ) ) ( not ( = ?auto_63213 ?auto_63215 ) ) ( not ( = ?auto_63213 ?auto_63216 ) ) ( not ( = ?auto_63214 ?auto_63215 ) ) ( not ( = ?auto_63214 ?auto_63216 ) ) ( not ( = ?auto_63215 ?auto_63216 ) ) ( ON-TABLE ?auto_63216 ) ( ON ?auto_63215 ?auto_63216 ) ( ON ?auto_63211 ?auto_63217 ) ( not ( = ?auto_63211 ?auto_63217 ) ) ( not ( = ?auto_63212 ?auto_63217 ) ) ( not ( = ?auto_63213 ?auto_63217 ) ) ( not ( = ?auto_63214 ?auto_63217 ) ) ( not ( = ?auto_63215 ?auto_63217 ) ) ( not ( = ?auto_63216 ?auto_63217 ) ) ( ON ?auto_63212 ?auto_63211 ) ( ON-TABLE ?auto_63217 ) ( ON ?auto_63213 ?auto_63212 ) ( CLEAR ?auto_63215 ) ( ON ?auto_63214 ?auto_63213 ) ( CLEAR ?auto_63214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63217 ?auto_63211 ?auto_63212 ?auto_63213 )
      ( MAKE-6PILE ?auto_63211 ?auto_63212 ?auto_63213 ?auto_63214 ?auto_63215 ?auto_63216 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63218 - BLOCK
      ?auto_63219 - BLOCK
      ?auto_63220 - BLOCK
      ?auto_63221 - BLOCK
      ?auto_63222 - BLOCK
      ?auto_63223 - BLOCK
    )
    :vars
    (
      ?auto_63224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63218 ?auto_63219 ) ) ( not ( = ?auto_63218 ?auto_63220 ) ) ( not ( = ?auto_63218 ?auto_63221 ) ) ( not ( = ?auto_63218 ?auto_63222 ) ) ( not ( = ?auto_63218 ?auto_63223 ) ) ( not ( = ?auto_63219 ?auto_63220 ) ) ( not ( = ?auto_63219 ?auto_63221 ) ) ( not ( = ?auto_63219 ?auto_63222 ) ) ( not ( = ?auto_63219 ?auto_63223 ) ) ( not ( = ?auto_63220 ?auto_63221 ) ) ( not ( = ?auto_63220 ?auto_63222 ) ) ( not ( = ?auto_63220 ?auto_63223 ) ) ( not ( = ?auto_63221 ?auto_63222 ) ) ( not ( = ?auto_63221 ?auto_63223 ) ) ( not ( = ?auto_63222 ?auto_63223 ) ) ( ON-TABLE ?auto_63223 ) ( ON ?auto_63218 ?auto_63224 ) ( not ( = ?auto_63218 ?auto_63224 ) ) ( not ( = ?auto_63219 ?auto_63224 ) ) ( not ( = ?auto_63220 ?auto_63224 ) ) ( not ( = ?auto_63221 ?auto_63224 ) ) ( not ( = ?auto_63222 ?auto_63224 ) ) ( not ( = ?auto_63223 ?auto_63224 ) ) ( ON ?auto_63219 ?auto_63218 ) ( ON-TABLE ?auto_63224 ) ( ON ?auto_63220 ?auto_63219 ) ( ON ?auto_63221 ?auto_63220 ) ( CLEAR ?auto_63221 ) ( HOLDING ?auto_63222 ) ( CLEAR ?auto_63223 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63223 ?auto_63222 )
      ( MAKE-6PILE ?auto_63218 ?auto_63219 ?auto_63220 ?auto_63221 ?auto_63222 ?auto_63223 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63225 - BLOCK
      ?auto_63226 - BLOCK
      ?auto_63227 - BLOCK
      ?auto_63228 - BLOCK
      ?auto_63229 - BLOCK
      ?auto_63230 - BLOCK
    )
    :vars
    (
      ?auto_63231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63225 ?auto_63226 ) ) ( not ( = ?auto_63225 ?auto_63227 ) ) ( not ( = ?auto_63225 ?auto_63228 ) ) ( not ( = ?auto_63225 ?auto_63229 ) ) ( not ( = ?auto_63225 ?auto_63230 ) ) ( not ( = ?auto_63226 ?auto_63227 ) ) ( not ( = ?auto_63226 ?auto_63228 ) ) ( not ( = ?auto_63226 ?auto_63229 ) ) ( not ( = ?auto_63226 ?auto_63230 ) ) ( not ( = ?auto_63227 ?auto_63228 ) ) ( not ( = ?auto_63227 ?auto_63229 ) ) ( not ( = ?auto_63227 ?auto_63230 ) ) ( not ( = ?auto_63228 ?auto_63229 ) ) ( not ( = ?auto_63228 ?auto_63230 ) ) ( not ( = ?auto_63229 ?auto_63230 ) ) ( ON-TABLE ?auto_63230 ) ( ON ?auto_63225 ?auto_63231 ) ( not ( = ?auto_63225 ?auto_63231 ) ) ( not ( = ?auto_63226 ?auto_63231 ) ) ( not ( = ?auto_63227 ?auto_63231 ) ) ( not ( = ?auto_63228 ?auto_63231 ) ) ( not ( = ?auto_63229 ?auto_63231 ) ) ( not ( = ?auto_63230 ?auto_63231 ) ) ( ON ?auto_63226 ?auto_63225 ) ( ON-TABLE ?auto_63231 ) ( ON ?auto_63227 ?auto_63226 ) ( ON ?auto_63228 ?auto_63227 ) ( CLEAR ?auto_63230 ) ( ON ?auto_63229 ?auto_63228 ) ( CLEAR ?auto_63229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63231 ?auto_63225 ?auto_63226 ?auto_63227 ?auto_63228 )
      ( MAKE-6PILE ?auto_63225 ?auto_63226 ?auto_63227 ?auto_63228 ?auto_63229 ?auto_63230 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63232 - BLOCK
      ?auto_63233 - BLOCK
      ?auto_63234 - BLOCK
      ?auto_63235 - BLOCK
      ?auto_63236 - BLOCK
      ?auto_63237 - BLOCK
    )
    :vars
    (
      ?auto_63238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63232 ?auto_63233 ) ) ( not ( = ?auto_63232 ?auto_63234 ) ) ( not ( = ?auto_63232 ?auto_63235 ) ) ( not ( = ?auto_63232 ?auto_63236 ) ) ( not ( = ?auto_63232 ?auto_63237 ) ) ( not ( = ?auto_63233 ?auto_63234 ) ) ( not ( = ?auto_63233 ?auto_63235 ) ) ( not ( = ?auto_63233 ?auto_63236 ) ) ( not ( = ?auto_63233 ?auto_63237 ) ) ( not ( = ?auto_63234 ?auto_63235 ) ) ( not ( = ?auto_63234 ?auto_63236 ) ) ( not ( = ?auto_63234 ?auto_63237 ) ) ( not ( = ?auto_63235 ?auto_63236 ) ) ( not ( = ?auto_63235 ?auto_63237 ) ) ( not ( = ?auto_63236 ?auto_63237 ) ) ( ON ?auto_63232 ?auto_63238 ) ( not ( = ?auto_63232 ?auto_63238 ) ) ( not ( = ?auto_63233 ?auto_63238 ) ) ( not ( = ?auto_63234 ?auto_63238 ) ) ( not ( = ?auto_63235 ?auto_63238 ) ) ( not ( = ?auto_63236 ?auto_63238 ) ) ( not ( = ?auto_63237 ?auto_63238 ) ) ( ON ?auto_63233 ?auto_63232 ) ( ON-TABLE ?auto_63238 ) ( ON ?auto_63234 ?auto_63233 ) ( ON ?auto_63235 ?auto_63234 ) ( ON ?auto_63236 ?auto_63235 ) ( CLEAR ?auto_63236 ) ( HOLDING ?auto_63237 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63237 )
      ( MAKE-6PILE ?auto_63232 ?auto_63233 ?auto_63234 ?auto_63235 ?auto_63236 ?auto_63237 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63239 - BLOCK
      ?auto_63240 - BLOCK
      ?auto_63241 - BLOCK
      ?auto_63242 - BLOCK
      ?auto_63243 - BLOCK
      ?auto_63244 - BLOCK
    )
    :vars
    (
      ?auto_63245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63239 ?auto_63240 ) ) ( not ( = ?auto_63239 ?auto_63241 ) ) ( not ( = ?auto_63239 ?auto_63242 ) ) ( not ( = ?auto_63239 ?auto_63243 ) ) ( not ( = ?auto_63239 ?auto_63244 ) ) ( not ( = ?auto_63240 ?auto_63241 ) ) ( not ( = ?auto_63240 ?auto_63242 ) ) ( not ( = ?auto_63240 ?auto_63243 ) ) ( not ( = ?auto_63240 ?auto_63244 ) ) ( not ( = ?auto_63241 ?auto_63242 ) ) ( not ( = ?auto_63241 ?auto_63243 ) ) ( not ( = ?auto_63241 ?auto_63244 ) ) ( not ( = ?auto_63242 ?auto_63243 ) ) ( not ( = ?auto_63242 ?auto_63244 ) ) ( not ( = ?auto_63243 ?auto_63244 ) ) ( ON ?auto_63239 ?auto_63245 ) ( not ( = ?auto_63239 ?auto_63245 ) ) ( not ( = ?auto_63240 ?auto_63245 ) ) ( not ( = ?auto_63241 ?auto_63245 ) ) ( not ( = ?auto_63242 ?auto_63245 ) ) ( not ( = ?auto_63243 ?auto_63245 ) ) ( not ( = ?auto_63244 ?auto_63245 ) ) ( ON ?auto_63240 ?auto_63239 ) ( ON-TABLE ?auto_63245 ) ( ON ?auto_63241 ?auto_63240 ) ( ON ?auto_63242 ?auto_63241 ) ( ON ?auto_63243 ?auto_63242 ) ( ON ?auto_63244 ?auto_63243 ) ( CLEAR ?auto_63244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63245 ?auto_63239 ?auto_63240 ?auto_63241 ?auto_63242 ?auto_63243 )
      ( MAKE-6PILE ?auto_63239 ?auto_63240 ?auto_63241 ?auto_63242 ?auto_63243 ?auto_63244 ) )
  )

)

