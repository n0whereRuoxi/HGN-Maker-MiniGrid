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
      ?auto_31694 - BLOCK
      ?auto_31695 - BLOCK
      ?auto_31696 - BLOCK
      ?auto_31697 - BLOCK
      ?auto_31698 - BLOCK
    )
    :vars
    (
      ?auto_31699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31699 ?auto_31698 ) ( CLEAR ?auto_31699 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31694 ) ( ON ?auto_31695 ?auto_31694 ) ( ON ?auto_31696 ?auto_31695 ) ( ON ?auto_31697 ?auto_31696 ) ( ON ?auto_31698 ?auto_31697 ) ( not ( = ?auto_31694 ?auto_31695 ) ) ( not ( = ?auto_31694 ?auto_31696 ) ) ( not ( = ?auto_31694 ?auto_31697 ) ) ( not ( = ?auto_31694 ?auto_31698 ) ) ( not ( = ?auto_31694 ?auto_31699 ) ) ( not ( = ?auto_31695 ?auto_31696 ) ) ( not ( = ?auto_31695 ?auto_31697 ) ) ( not ( = ?auto_31695 ?auto_31698 ) ) ( not ( = ?auto_31695 ?auto_31699 ) ) ( not ( = ?auto_31696 ?auto_31697 ) ) ( not ( = ?auto_31696 ?auto_31698 ) ) ( not ( = ?auto_31696 ?auto_31699 ) ) ( not ( = ?auto_31697 ?auto_31698 ) ) ( not ( = ?auto_31697 ?auto_31699 ) ) ( not ( = ?auto_31698 ?auto_31699 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31699 ?auto_31698 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31701 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_31701 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_31701 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31702 - BLOCK
    )
    :vars
    (
      ?auto_31703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31702 ?auto_31703 ) ( CLEAR ?auto_31702 ) ( HAND-EMPTY ) ( not ( = ?auto_31702 ?auto_31703 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31702 ?auto_31703 )
      ( MAKE-1PILE ?auto_31702 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31708 - BLOCK
      ?auto_31709 - BLOCK
      ?auto_31710 - BLOCK
      ?auto_31711 - BLOCK
    )
    :vars
    (
      ?auto_31712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31712 ?auto_31711 ) ( CLEAR ?auto_31712 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31708 ) ( ON ?auto_31709 ?auto_31708 ) ( ON ?auto_31710 ?auto_31709 ) ( ON ?auto_31711 ?auto_31710 ) ( not ( = ?auto_31708 ?auto_31709 ) ) ( not ( = ?auto_31708 ?auto_31710 ) ) ( not ( = ?auto_31708 ?auto_31711 ) ) ( not ( = ?auto_31708 ?auto_31712 ) ) ( not ( = ?auto_31709 ?auto_31710 ) ) ( not ( = ?auto_31709 ?auto_31711 ) ) ( not ( = ?auto_31709 ?auto_31712 ) ) ( not ( = ?auto_31710 ?auto_31711 ) ) ( not ( = ?auto_31710 ?auto_31712 ) ) ( not ( = ?auto_31711 ?auto_31712 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31712 ?auto_31711 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31713 - BLOCK
      ?auto_31714 - BLOCK
      ?auto_31715 - BLOCK
      ?auto_31716 - BLOCK
    )
    :vars
    (
      ?auto_31717 - BLOCK
      ?auto_31718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31717 ?auto_31716 ) ( CLEAR ?auto_31717 ) ( ON-TABLE ?auto_31713 ) ( ON ?auto_31714 ?auto_31713 ) ( ON ?auto_31715 ?auto_31714 ) ( ON ?auto_31716 ?auto_31715 ) ( not ( = ?auto_31713 ?auto_31714 ) ) ( not ( = ?auto_31713 ?auto_31715 ) ) ( not ( = ?auto_31713 ?auto_31716 ) ) ( not ( = ?auto_31713 ?auto_31717 ) ) ( not ( = ?auto_31714 ?auto_31715 ) ) ( not ( = ?auto_31714 ?auto_31716 ) ) ( not ( = ?auto_31714 ?auto_31717 ) ) ( not ( = ?auto_31715 ?auto_31716 ) ) ( not ( = ?auto_31715 ?auto_31717 ) ) ( not ( = ?auto_31716 ?auto_31717 ) ) ( HOLDING ?auto_31718 ) ( not ( = ?auto_31713 ?auto_31718 ) ) ( not ( = ?auto_31714 ?auto_31718 ) ) ( not ( = ?auto_31715 ?auto_31718 ) ) ( not ( = ?auto_31716 ?auto_31718 ) ) ( not ( = ?auto_31717 ?auto_31718 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_31718 )
      ( MAKE-4PILE ?auto_31713 ?auto_31714 ?auto_31715 ?auto_31716 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31719 - BLOCK
      ?auto_31720 - BLOCK
      ?auto_31721 - BLOCK
      ?auto_31722 - BLOCK
    )
    :vars
    (
      ?auto_31723 - BLOCK
      ?auto_31724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31723 ?auto_31722 ) ( ON-TABLE ?auto_31719 ) ( ON ?auto_31720 ?auto_31719 ) ( ON ?auto_31721 ?auto_31720 ) ( ON ?auto_31722 ?auto_31721 ) ( not ( = ?auto_31719 ?auto_31720 ) ) ( not ( = ?auto_31719 ?auto_31721 ) ) ( not ( = ?auto_31719 ?auto_31722 ) ) ( not ( = ?auto_31719 ?auto_31723 ) ) ( not ( = ?auto_31720 ?auto_31721 ) ) ( not ( = ?auto_31720 ?auto_31722 ) ) ( not ( = ?auto_31720 ?auto_31723 ) ) ( not ( = ?auto_31721 ?auto_31722 ) ) ( not ( = ?auto_31721 ?auto_31723 ) ) ( not ( = ?auto_31722 ?auto_31723 ) ) ( not ( = ?auto_31719 ?auto_31724 ) ) ( not ( = ?auto_31720 ?auto_31724 ) ) ( not ( = ?auto_31721 ?auto_31724 ) ) ( not ( = ?auto_31722 ?auto_31724 ) ) ( not ( = ?auto_31723 ?auto_31724 ) ) ( ON ?auto_31724 ?auto_31723 ) ( CLEAR ?auto_31724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31719 ?auto_31720 ?auto_31721 ?auto_31722 ?auto_31723 )
      ( MAKE-4PILE ?auto_31719 ?auto_31720 ?auto_31721 ?auto_31722 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31727 - BLOCK
      ?auto_31728 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_31728 ) ( CLEAR ?auto_31727 ) ( ON-TABLE ?auto_31727 ) ( not ( = ?auto_31727 ?auto_31728 ) ) )
    :subtasks
    ( ( !STACK ?auto_31728 ?auto_31727 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31729 - BLOCK
      ?auto_31730 - BLOCK
    )
    :vars
    (
      ?auto_31731 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31729 ) ( ON-TABLE ?auto_31729 ) ( not ( = ?auto_31729 ?auto_31730 ) ) ( ON ?auto_31730 ?auto_31731 ) ( CLEAR ?auto_31730 ) ( HAND-EMPTY ) ( not ( = ?auto_31729 ?auto_31731 ) ) ( not ( = ?auto_31730 ?auto_31731 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31730 ?auto_31731 )
      ( MAKE-2PILE ?auto_31729 ?auto_31730 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31732 - BLOCK
      ?auto_31733 - BLOCK
    )
    :vars
    (
      ?auto_31734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31732 ?auto_31733 ) ) ( ON ?auto_31733 ?auto_31734 ) ( CLEAR ?auto_31733 ) ( not ( = ?auto_31732 ?auto_31734 ) ) ( not ( = ?auto_31733 ?auto_31734 ) ) ( HOLDING ?auto_31732 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31732 )
      ( MAKE-2PILE ?auto_31732 ?auto_31733 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31735 - BLOCK
      ?auto_31736 - BLOCK
    )
    :vars
    (
      ?auto_31737 - BLOCK
      ?auto_31738 - BLOCK
      ?auto_31739 - BLOCK
      ?auto_31740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31735 ?auto_31736 ) ) ( ON ?auto_31736 ?auto_31737 ) ( not ( = ?auto_31735 ?auto_31737 ) ) ( not ( = ?auto_31736 ?auto_31737 ) ) ( ON ?auto_31735 ?auto_31736 ) ( CLEAR ?auto_31735 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31738 ) ( ON ?auto_31739 ?auto_31738 ) ( ON ?auto_31740 ?auto_31739 ) ( ON ?auto_31737 ?auto_31740 ) ( not ( = ?auto_31738 ?auto_31739 ) ) ( not ( = ?auto_31738 ?auto_31740 ) ) ( not ( = ?auto_31738 ?auto_31737 ) ) ( not ( = ?auto_31738 ?auto_31736 ) ) ( not ( = ?auto_31738 ?auto_31735 ) ) ( not ( = ?auto_31739 ?auto_31740 ) ) ( not ( = ?auto_31739 ?auto_31737 ) ) ( not ( = ?auto_31739 ?auto_31736 ) ) ( not ( = ?auto_31739 ?auto_31735 ) ) ( not ( = ?auto_31740 ?auto_31737 ) ) ( not ( = ?auto_31740 ?auto_31736 ) ) ( not ( = ?auto_31740 ?auto_31735 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31738 ?auto_31739 ?auto_31740 ?auto_31737 ?auto_31736 )
      ( MAKE-2PILE ?auto_31735 ?auto_31736 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31744 - BLOCK
      ?auto_31745 - BLOCK
      ?auto_31746 - BLOCK
    )
    :vars
    (
      ?auto_31747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31747 ?auto_31746 ) ( CLEAR ?auto_31747 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31744 ) ( ON ?auto_31745 ?auto_31744 ) ( ON ?auto_31746 ?auto_31745 ) ( not ( = ?auto_31744 ?auto_31745 ) ) ( not ( = ?auto_31744 ?auto_31746 ) ) ( not ( = ?auto_31744 ?auto_31747 ) ) ( not ( = ?auto_31745 ?auto_31746 ) ) ( not ( = ?auto_31745 ?auto_31747 ) ) ( not ( = ?auto_31746 ?auto_31747 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31747 ?auto_31746 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31748 - BLOCK
      ?auto_31749 - BLOCK
      ?auto_31750 - BLOCK
    )
    :vars
    (
      ?auto_31751 - BLOCK
      ?auto_31752 - BLOCK
      ?auto_31753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31751 ?auto_31750 ) ( CLEAR ?auto_31751 ) ( ON-TABLE ?auto_31748 ) ( ON ?auto_31749 ?auto_31748 ) ( ON ?auto_31750 ?auto_31749 ) ( not ( = ?auto_31748 ?auto_31749 ) ) ( not ( = ?auto_31748 ?auto_31750 ) ) ( not ( = ?auto_31748 ?auto_31751 ) ) ( not ( = ?auto_31749 ?auto_31750 ) ) ( not ( = ?auto_31749 ?auto_31751 ) ) ( not ( = ?auto_31750 ?auto_31751 ) ) ( HOLDING ?auto_31752 ) ( CLEAR ?auto_31753 ) ( not ( = ?auto_31748 ?auto_31752 ) ) ( not ( = ?auto_31748 ?auto_31753 ) ) ( not ( = ?auto_31749 ?auto_31752 ) ) ( not ( = ?auto_31749 ?auto_31753 ) ) ( not ( = ?auto_31750 ?auto_31752 ) ) ( not ( = ?auto_31750 ?auto_31753 ) ) ( not ( = ?auto_31751 ?auto_31752 ) ) ( not ( = ?auto_31751 ?auto_31753 ) ) ( not ( = ?auto_31752 ?auto_31753 ) ) )
    :subtasks
    ( ( !STACK ?auto_31752 ?auto_31753 )
      ( MAKE-3PILE ?auto_31748 ?auto_31749 ?auto_31750 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32116 - BLOCK
      ?auto_32117 - BLOCK
      ?auto_32118 - BLOCK
    )
    :vars
    (
      ?auto_32120 - BLOCK
      ?auto_32119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32120 ?auto_32118 ) ( ON-TABLE ?auto_32116 ) ( ON ?auto_32117 ?auto_32116 ) ( ON ?auto_32118 ?auto_32117 ) ( not ( = ?auto_32116 ?auto_32117 ) ) ( not ( = ?auto_32116 ?auto_32118 ) ) ( not ( = ?auto_32116 ?auto_32120 ) ) ( not ( = ?auto_32117 ?auto_32118 ) ) ( not ( = ?auto_32117 ?auto_32120 ) ) ( not ( = ?auto_32118 ?auto_32120 ) ) ( not ( = ?auto_32116 ?auto_32119 ) ) ( not ( = ?auto_32117 ?auto_32119 ) ) ( not ( = ?auto_32118 ?auto_32119 ) ) ( not ( = ?auto_32120 ?auto_32119 ) ) ( ON ?auto_32119 ?auto_32120 ) ( CLEAR ?auto_32119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32116 ?auto_32117 ?auto_32118 ?auto_32120 )
      ( MAKE-3PILE ?auto_32116 ?auto_32117 ?auto_32118 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31760 - BLOCK
      ?auto_31761 - BLOCK
      ?auto_31762 - BLOCK
    )
    :vars
    (
      ?auto_31765 - BLOCK
      ?auto_31763 - BLOCK
      ?auto_31764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31765 ?auto_31762 ) ( ON-TABLE ?auto_31760 ) ( ON ?auto_31761 ?auto_31760 ) ( ON ?auto_31762 ?auto_31761 ) ( not ( = ?auto_31760 ?auto_31761 ) ) ( not ( = ?auto_31760 ?auto_31762 ) ) ( not ( = ?auto_31760 ?auto_31765 ) ) ( not ( = ?auto_31761 ?auto_31762 ) ) ( not ( = ?auto_31761 ?auto_31765 ) ) ( not ( = ?auto_31762 ?auto_31765 ) ) ( not ( = ?auto_31760 ?auto_31763 ) ) ( not ( = ?auto_31760 ?auto_31764 ) ) ( not ( = ?auto_31761 ?auto_31763 ) ) ( not ( = ?auto_31761 ?auto_31764 ) ) ( not ( = ?auto_31762 ?auto_31763 ) ) ( not ( = ?auto_31762 ?auto_31764 ) ) ( not ( = ?auto_31765 ?auto_31763 ) ) ( not ( = ?auto_31765 ?auto_31764 ) ) ( not ( = ?auto_31763 ?auto_31764 ) ) ( ON ?auto_31763 ?auto_31765 ) ( CLEAR ?auto_31763 ) ( HOLDING ?auto_31764 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31764 )
      ( MAKE-3PILE ?auto_31760 ?auto_31761 ?auto_31762 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31766 - BLOCK
      ?auto_31767 - BLOCK
      ?auto_31768 - BLOCK
    )
    :vars
    (
      ?auto_31769 - BLOCK
      ?auto_31771 - BLOCK
      ?auto_31770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31769 ?auto_31768 ) ( ON-TABLE ?auto_31766 ) ( ON ?auto_31767 ?auto_31766 ) ( ON ?auto_31768 ?auto_31767 ) ( not ( = ?auto_31766 ?auto_31767 ) ) ( not ( = ?auto_31766 ?auto_31768 ) ) ( not ( = ?auto_31766 ?auto_31769 ) ) ( not ( = ?auto_31767 ?auto_31768 ) ) ( not ( = ?auto_31767 ?auto_31769 ) ) ( not ( = ?auto_31768 ?auto_31769 ) ) ( not ( = ?auto_31766 ?auto_31771 ) ) ( not ( = ?auto_31766 ?auto_31770 ) ) ( not ( = ?auto_31767 ?auto_31771 ) ) ( not ( = ?auto_31767 ?auto_31770 ) ) ( not ( = ?auto_31768 ?auto_31771 ) ) ( not ( = ?auto_31768 ?auto_31770 ) ) ( not ( = ?auto_31769 ?auto_31771 ) ) ( not ( = ?auto_31769 ?auto_31770 ) ) ( not ( = ?auto_31771 ?auto_31770 ) ) ( ON ?auto_31771 ?auto_31769 ) ( ON ?auto_31770 ?auto_31771 ) ( CLEAR ?auto_31770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31766 ?auto_31767 ?auto_31768 ?auto_31769 ?auto_31771 )
      ( MAKE-3PILE ?auto_31766 ?auto_31767 ?auto_31768 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31775 - BLOCK
      ?auto_31776 - BLOCK
      ?auto_31777 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_31777 ) ( CLEAR ?auto_31776 ) ( ON-TABLE ?auto_31775 ) ( ON ?auto_31776 ?auto_31775 ) ( not ( = ?auto_31775 ?auto_31776 ) ) ( not ( = ?auto_31775 ?auto_31777 ) ) ( not ( = ?auto_31776 ?auto_31777 ) ) )
    :subtasks
    ( ( !STACK ?auto_31777 ?auto_31776 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31778 - BLOCK
      ?auto_31779 - BLOCK
      ?auto_31780 - BLOCK
    )
    :vars
    (
      ?auto_31781 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31779 ) ( ON-TABLE ?auto_31778 ) ( ON ?auto_31779 ?auto_31778 ) ( not ( = ?auto_31778 ?auto_31779 ) ) ( not ( = ?auto_31778 ?auto_31780 ) ) ( not ( = ?auto_31779 ?auto_31780 ) ) ( ON ?auto_31780 ?auto_31781 ) ( CLEAR ?auto_31780 ) ( HAND-EMPTY ) ( not ( = ?auto_31778 ?auto_31781 ) ) ( not ( = ?auto_31779 ?auto_31781 ) ) ( not ( = ?auto_31780 ?auto_31781 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31780 ?auto_31781 )
      ( MAKE-3PILE ?auto_31778 ?auto_31779 ?auto_31780 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31782 - BLOCK
      ?auto_31783 - BLOCK
      ?auto_31784 - BLOCK
    )
    :vars
    (
      ?auto_31785 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31782 ) ( not ( = ?auto_31782 ?auto_31783 ) ) ( not ( = ?auto_31782 ?auto_31784 ) ) ( not ( = ?auto_31783 ?auto_31784 ) ) ( ON ?auto_31784 ?auto_31785 ) ( CLEAR ?auto_31784 ) ( not ( = ?auto_31782 ?auto_31785 ) ) ( not ( = ?auto_31783 ?auto_31785 ) ) ( not ( = ?auto_31784 ?auto_31785 ) ) ( HOLDING ?auto_31783 ) ( CLEAR ?auto_31782 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31782 ?auto_31783 )
      ( MAKE-3PILE ?auto_31782 ?auto_31783 ?auto_31784 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31786 - BLOCK
      ?auto_31787 - BLOCK
      ?auto_31788 - BLOCK
    )
    :vars
    (
      ?auto_31789 - BLOCK
      ?auto_31790 - BLOCK
      ?auto_31791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31786 ) ( not ( = ?auto_31786 ?auto_31787 ) ) ( not ( = ?auto_31786 ?auto_31788 ) ) ( not ( = ?auto_31787 ?auto_31788 ) ) ( ON ?auto_31788 ?auto_31789 ) ( not ( = ?auto_31786 ?auto_31789 ) ) ( not ( = ?auto_31787 ?auto_31789 ) ) ( not ( = ?auto_31788 ?auto_31789 ) ) ( CLEAR ?auto_31786 ) ( ON ?auto_31787 ?auto_31788 ) ( CLEAR ?auto_31787 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31790 ) ( ON ?auto_31791 ?auto_31790 ) ( ON ?auto_31789 ?auto_31791 ) ( not ( = ?auto_31790 ?auto_31791 ) ) ( not ( = ?auto_31790 ?auto_31789 ) ) ( not ( = ?auto_31790 ?auto_31788 ) ) ( not ( = ?auto_31790 ?auto_31787 ) ) ( not ( = ?auto_31791 ?auto_31789 ) ) ( not ( = ?auto_31791 ?auto_31788 ) ) ( not ( = ?auto_31791 ?auto_31787 ) ) ( not ( = ?auto_31786 ?auto_31790 ) ) ( not ( = ?auto_31786 ?auto_31791 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31790 ?auto_31791 ?auto_31789 ?auto_31788 )
      ( MAKE-3PILE ?auto_31786 ?auto_31787 ?auto_31788 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31792 - BLOCK
      ?auto_31793 - BLOCK
      ?auto_31794 - BLOCK
    )
    :vars
    (
      ?auto_31795 - BLOCK
      ?auto_31796 - BLOCK
      ?auto_31797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31792 ?auto_31793 ) ) ( not ( = ?auto_31792 ?auto_31794 ) ) ( not ( = ?auto_31793 ?auto_31794 ) ) ( ON ?auto_31794 ?auto_31795 ) ( not ( = ?auto_31792 ?auto_31795 ) ) ( not ( = ?auto_31793 ?auto_31795 ) ) ( not ( = ?auto_31794 ?auto_31795 ) ) ( ON ?auto_31793 ?auto_31794 ) ( CLEAR ?auto_31793 ) ( ON-TABLE ?auto_31796 ) ( ON ?auto_31797 ?auto_31796 ) ( ON ?auto_31795 ?auto_31797 ) ( not ( = ?auto_31796 ?auto_31797 ) ) ( not ( = ?auto_31796 ?auto_31795 ) ) ( not ( = ?auto_31796 ?auto_31794 ) ) ( not ( = ?auto_31796 ?auto_31793 ) ) ( not ( = ?auto_31797 ?auto_31795 ) ) ( not ( = ?auto_31797 ?auto_31794 ) ) ( not ( = ?auto_31797 ?auto_31793 ) ) ( not ( = ?auto_31792 ?auto_31796 ) ) ( not ( = ?auto_31792 ?auto_31797 ) ) ( HOLDING ?auto_31792 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31792 )
      ( MAKE-3PILE ?auto_31792 ?auto_31793 ?auto_31794 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31798 - BLOCK
      ?auto_31799 - BLOCK
      ?auto_31800 - BLOCK
    )
    :vars
    (
      ?auto_31801 - BLOCK
      ?auto_31803 - BLOCK
      ?auto_31802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31798 ?auto_31799 ) ) ( not ( = ?auto_31798 ?auto_31800 ) ) ( not ( = ?auto_31799 ?auto_31800 ) ) ( ON ?auto_31800 ?auto_31801 ) ( not ( = ?auto_31798 ?auto_31801 ) ) ( not ( = ?auto_31799 ?auto_31801 ) ) ( not ( = ?auto_31800 ?auto_31801 ) ) ( ON ?auto_31799 ?auto_31800 ) ( ON-TABLE ?auto_31803 ) ( ON ?auto_31802 ?auto_31803 ) ( ON ?auto_31801 ?auto_31802 ) ( not ( = ?auto_31803 ?auto_31802 ) ) ( not ( = ?auto_31803 ?auto_31801 ) ) ( not ( = ?auto_31803 ?auto_31800 ) ) ( not ( = ?auto_31803 ?auto_31799 ) ) ( not ( = ?auto_31802 ?auto_31801 ) ) ( not ( = ?auto_31802 ?auto_31800 ) ) ( not ( = ?auto_31802 ?auto_31799 ) ) ( not ( = ?auto_31798 ?auto_31803 ) ) ( not ( = ?auto_31798 ?auto_31802 ) ) ( ON ?auto_31798 ?auto_31799 ) ( CLEAR ?auto_31798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31803 ?auto_31802 ?auto_31801 ?auto_31800 ?auto_31799 )
      ( MAKE-3PILE ?auto_31798 ?auto_31799 ?auto_31800 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31806 - BLOCK
      ?auto_31807 - BLOCK
    )
    :vars
    (
      ?auto_31808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31808 ?auto_31807 ) ( CLEAR ?auto_31808 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31806 ) ( ON ?auto_31807 ?auto_31806 ) ( not ( = ?auto_31806 ?auto_31807 ) ) ( not ( = ?auto_31806 ?auto_31808 ) ) ( not ( = ?auto_31807 ?auto_31808 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31808 ?auto_31807 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31809 - BLOCK
      ?auto_31810 - BLOCK
    )
    :vars
    (
      ?auto_31811 - BLOCK
      ?auto_31812 - BLOCK
      ?auto_31813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31811 ?auto_31810 ) ( CLEAR ?auto_31811 ) ( ON-TABLE ?auto_31809 ) ( ON ?auto_31810 ?auto_31809 ) ( not ( = ?auto_31809 ?auto_31810 ) ) ( not ( = ?auto_31809 ?auto_31811 ) ) ( not ( = ?auto_31810 ?auto_31811 ) ) ( HOLDING ?auto_31812 ) ( CLEAR ?auto_31813 ) ( not ( = ?auto_31809 ?auto_31812 ) ) ( not ( = ?auto_31809 ?auto_31813 ) ) ( not ( = ?auto_31810 ?auto_31812 ) ) ( not ( = ?auto_31810 ?auto_31813 ) ) ( not ( = ?auto_31811 ?auto_31812 ) ) ( not ( = ?auto_31811 ?auto_31813 ) ) ( not ( = ?auto_31812 ?auto_31813 ) ) )
    :subtasks
    ( ( !STACK ?auto_31812 ?auto_31813 )
      ( MAKE-2PILE ?auto_31809 ?auto_31810 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31814 - BLOCK
      ?auto_31815 - BLOCK
    )
    :vars
    (
      ?auto_31816 - BLOCK
      ?auto_31817 - BLOCK
      ?auto_31818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31816 ?auto_31815 ) ( ON-TABLE ?auto_31814 ) ( ON ?auto_31815 ?auto_31814 ) ( not ( = ?auto_31814 ?auto_31815 ) ) ( not ( = ?auto_31814 ?auto_31816 ) ) ( not ( = ?auto_31815 ?auto_31816 ) ) ( CLEAR ?auto_31817 ) ( not ( = ?auto_31814 ?auto_31818 ) ) ( not ( = ?auto_31814 ?auto_31817 ) ) ( not ( = ?auto_31815 ?auto_31818 ) ) ( not ( = ?auto_31815 ?auto_31817 ) ) ( not ( = ?auto_31816 ?auto_31818 ) ) ( not ( = ?auto_31816 ?auto_31817 ) ) ( not ( = ?auto_31818 ?auto_31817 ) ) ( ON ?auto_31818 ?auto_31816 ) ( CLEAR ?auto_31818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31814 ?auto_31815 ?auto_31816 )
      ( MAKE-2PILE ?auto_31814 ?auto_31815 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31819 - BLOCK
      ?auto_31820 - BLOCK
    )
    :vars
    (
      ?auto_31823 - BLOCK
      ?auto_31821 - BLOCK
      ?auto_31822 - BLOCK
      ?auto_31824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31823 ?auto_31820 ) ( ON-TABLE ?auto_31819 ) ( ON ?auto_31820 ?auto_31819 ) ( not ( = ?auto_31819 ?auto_31820 ) ) ( not ( = ?auto_31819 ?auto_31823 ) ) ( not ( = ?auto_31820 ?auto_31823 ) ) ( not ( = ?auto_31819 ?auto_31821 ) ) ( not ( = ?auto_31819 ?auto_31822 ) ) ( not ( = ?auto_31820 ?auto_31821 ) ) ( not ( = ?auto_31820 ?auto_31822 ) ) ( not ( = ?auto_31823 ?auto_31821 ) ) ( not ( = ?auto_31823 ?auto_31822 ) ) ( not ( = ?auto_31821 ?auto_31822 ) ) ( ON ?auto_31821 ?auto_31823 ) ( CLEAR ?auto_31821 ) ( HOLDING ?auto_31822 ) ( CLEAR ?auto_31824 ) ( ON-TABLE ?auto_31824 ) ( not ( = ?auto_31824 ?auto_31822 ) ) ( not ( = ?auto_31819 ?auto_31824 ) ) ( not ( = ?auto_31820 ?auto_31824 ) ) ( not ( = ?auto_31823 ?auto_31824 ) ) ( not ( = ?auto_31821 ?auto_31824 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31824 ?auto_31822 )
      ( MAKE-2PILE ?auto_31819 ?auto_31820 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32243 - BLOCK
      ?auto_32244 - BLOCK
    )
    :vars
    (
      ?auto_32245 - BLOCK
      ?auto_32247 - BLOCK
      ?auto_32246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32245 ?auto_32244 ) ( ON-TABLE ?auto_32243 ) ( ON ?auto_32244 ?auto_32243 ) ( not ( = ?auto_32243 ?auto_32244 ) ) ( not ( = ?auto_32243 ?auto_32245 ) ) ( not ( = ?auto_32244 ?auto_32245 ) ) ( not ( = ?auto_32243 ?auto_32247 ) ) ( not ( = ?auto_32243 ?auto_32246 ) ) ( not ( = ?auto_32244 ?auto_32247 ) ) ( not ( = ?auto_32244 ?auto_32246 ) ) ( not ( = ?auto_32245 ?auto_32247 ) ) ( not ( = ?auto_32245 ?auto_32246 ) ) ( not ( = ?auto_32247 ?auto_32246 ) ) ( ON ?auto_32247 ?auto_32245 ) ( ON ?auto_32246 ?auto_32247 ) ( CLEAR ?auto_32246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32243 ?auto_32244 ?auto_32245 ?auto_32247 )
      ( MAKE-2PILE ?auto_32243 ?auto_32244 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31831 - BLOCK
      ?auto_31832 - BLOCK
    )
    :vars
    (
      ?auto_31834 - BLOCK
      ?auto_31833 - BLOCK
      ?auto_31835 - BLOCK
      ?auto_31836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31834 ?auto_31832 ) ( ON-TABLE ?auto_31831 ) ( ON ?auto_31832 ?auto_31831 ) ( not ( = ?auto_31831 ?auto_31832 ) ) ( not ( = ?auto_31831 ?auto_31834 ) ) ( not ( = ?auto_31832 ?auto_31834 ) ) ( not ( = ?auto_31831 ?auto_31833 ) ) ( not ( = ?auto_31831 ?auto_31835 ) ) ( not ( = ?auto_31832 ?auto_31833 ) ) ( not ( = ?auto_31832 ?auto_31835 ) ) ( not ( = ?auto_31834 ?auto_31833 ) ) ( not ( = ?auto_31834 ?auto_31835 ) ) ( not ( = ?auto_31833 ?auto_31835 ) ) ( ON ?auto_31833 ?auto_31834 ) ( not ( = ?auto_31836 ?auto_31835 ) ) ( not ( = ?auto_31831 ?auto_31836 ) ) ( not ( = ?auto_31832 ?auto_31836 ) ) ( not ( = ?auto_31834 ?auto_31836 ) ) ( not ( = ?auto_31833 ?auto_31836 ) ) ( ON ?auto_31835 ?auto_31833 ) ( CLEAR ?auto_31835 ) ( HOLDING ?auto_31836 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31836 )
      ( MAKE-2PILE ?auto_31831 ?auto_31832 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31837 - BLOCK
      ?auto_31838 - BLOCK
    )
    :vars
    (
      ?auto_31841 - BLOCK
      ?auto_31839 - BLOCK
      ?auto_31840 - BLOCK
      ?auto_31842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31841 ?auto_31838 ) ( ON-TABLE ?auto_31837 ) ( ON ?auto_31838 ?auto_31837 ) ( not ( = ?auto_31837 ?auto_31838 ) ) ( not ( = ?auto_31837 ?auto_31841 ) ) ( not ( = ?auto_31838 ?auto_31841 ) ) ( not ( = ?auto_31837 ?auto_31839 ) ) ( not ( = ?auto_31837 ?auto_31840 ) ) ( not ( = ?auto_31838 ?auto_31839 ) ) ( not ( = ?auto_31838 ?auto_31840 ) ) ( not ( = ?auto_31841 ?auto_31839 ) ) ( not ( = ?auto_31841 ?auto_31840 ) ) ( not ( = ?auto_31839 ?auto_31840 ) ) ( ON ?auto_31839 ?auto_31841 ) ( not ( = ?auto_31842 ?auto_31840 ) ) ( not ( = ?auto_31837 ?auto_31842 ) ) ( not ( = ?auto_31838 ?auto_31842 ) ) ( not ( = ?auto_31841 ?auto_31842 ) ) ( not ( = ?auto_31839 ?auto_31842 ) ) ( ON ?auto_31840 ?auto_31839 ) ( ON ?auto_31842 ?auto_31840 ) ( CLEAR ?auto_31842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31837 ?auto_31838 ?auto_31841 ?auto_31839 ?auto_31840 )
      ( MAKE-2PILE ?auto_31837 ?auto_31838 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31847 - BLOCK
      ?auto_31848 - BLOCK
      ?auto_31849 - BLOCK
      ?auto_31850 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_31850 ) ( CLEAR ?auto_31849 ) ( ON-TABLE ?auto_31847 ) ( ON ?auto_31848 ?auto_31847 ) ( ON ?auto_31849 ?auto_31848 ) ( not ( = ?auto_31847 ?auto_31848 ) ) ( not ( = ?auto_31847 ?auto_31849 ) ) ( not ( = ?auto_31847 ?auto_31850 ) ) ( not ( = ?auto_31848 ?auto_31849 ) ) ( not ( = ?auto_31848 ?auto_31850 ) ) ( not ( = ?auto_31849 ?auto_31850 ) ) )
    :subtasks
    ( ( !STACK ?auto_31850 ?auto_31849 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31851 - BLOCK
      ?auto_31852 - BLOCK
      ?auto_31853 - BLOCK
      ?auto_31854 - BLOCK
    )
    :vars
    (
      ?auto_31855 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31853 ) ( ON-TABLE ?auto_31851 ) ( ON ?auto_31852 ?auto_31851 ) ( ON ?auto_31853 ?auto_31852 ) ( not ( = ?auto_31851 ?auto_31852 ) ) ( not ( = ?auto_31851 ?auto_31853 ) ) ( not ( = ?auto_31851 ?auto_31854 ) ) ( not ( = ?auto_31852 ?auto_31853 ) ) ( not ( = ?auto_31852 ?auto_31854 ) ) ( not ( = ?auto_31853 ?auto_31854 ) ) ( ON ?auto_31854 ?auto_31855 ) ( CLEAR ?auto_31854 ) ( HAND-EMPTY ) ( not ( = ?auto_31851 ?auto_31855 ) ) ( not ( = ?auto_31852 ?auto_31855 ) ) ( not ( = ?auto_31853 ?auto_31855 ) ) ( not ( = ?auto_31854 ?auto_31855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31854 ?auto_31855 )
      ( MAKE-4PILE ?auto_31851 ?auto_31852 ?auto_31853 ?auto_31854 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31856 - BLOCK
      ?auto_31857 - BLOCK
      ?auto_31858 - BLOCK
      ?auto_31859 - BLOCK
    )
    :vars
    (
      ?auto_31860 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31856 ) ( ON ?auto_31857 ?auto_31856 ) ( not ( = ?auto_31856 ?auto_31857 ) ) ( not ( = ?auto_31856 ?auto_31858 ) ) ( not ( = ?auto_31856 ?auto_31859 ) ) ( not ( = ?auto_31857 ?auto_31858 ) ) ( not ( = ?auto_31857 ?auto_31859 ) ) ( not ( = ?auto_31858 ?auto_31859 ) ) ( ON ?auto_31859 ?auto_31860 ) ( CLEAR ?auto_31859 ) ( not ( = ?auto_31856 ?auto_31860 ) ) ( not ( = ?auto_31857 ?auto_31860 ) ) ( not ( = ?auto_31858 ?auto_31860 ) ) ( not ( = ?auto_31859 ?auto_31860 ) ) ( HOLDING ?auto_31858 ) ( CLEAR ?auto_31857 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31856 ?auto_31857 ?auto_31858 )
      ( MAKE-4PILE ?auto_31856 ?auto_31857 ?auto_31858 ?auto_31859 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31861 - BLOCK
      ?auto_31862 - BLOCK
      ?auto_31863 - BLOCK
      ?auto_31864 - BLOCK
    )
    :vars
    (
      ?auto_31865 - BLOCK
      ?auto_31866 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31861 ) ( ON ?auto_31862 ?auto_31861 ) ( not ( = ?auto_31861 ?auto_31862 ) ) ( not ( = ?auto_31861 ?auto_31863 ) ) ( not ( = ?auto_31861 ?auto_31864 ) ) ( not ( = ?auto_31862 ?auto_31863 ) ) ( not ( = ?auto_31862 ?auto_31864 ) ) ( not ( = ?auto_31863 ?auto_31864 ) ) ( ON ?auto_31864 ?auto_31865 ) ( not ( = ?auto_31861 ?auto_31865 ) ) ( not ( = ?auto_31862 ?auto_31865 ) ) ( not ( = ?auto_31863 ?auto_31865 ) ) ( not ( = ?auto_31864 ?auto_31865 ) ) ( CLEAR ?auto_31862 ) ( ON ?auto_31863 ?auto_31864 ) ( CLEAR ?auto_31863 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31866 ) ( ON ?auto_31865 ?auto_31866 ) ( not ( = ?auto_31866 ?auto_31865 ) ) ( not ( = ?auto_31866 ?auto_31864 ) ) ( not ( = ?auto_31866 ?auto_31863 ) ) ( not ( = ?auto_31861 ?auto_31866 ) ) ( not ( = ?auto_31862 ?auto_31866 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31866 ?auto_31865 ?auto_31864 )
      ( MAKE-4PILE ?auto_31861 ?auto_31862 ?auto_31863 ?auto_31864 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31867 - BLOCK
      ?auto_31868 - BLOCK
      ?auto_31869 - BLOCK
      ?auto_31870 - BLOCK
    )
    :vars
    (
      ?auto_31871 - BLOCK
      ?auto_31872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31867 ) ( not ( = ?auto_31867 ?auto_31868 ) ) ( not ( = ?auto_31867 ?auto_31869 ) ) ( not ( = ?auto_31867 ?auto_31870 ) ) ( not ( = ?auto_31868 ?auto_31869 ) ) ( not ( = ?auto_31868 ?auto_31870 ) ) ( not ( = ?auto_31869 ?auto_31870 ) ) ( ON ?auto_31870 ?auto_31871 ) ( not ( = ?auto_31867 ?auto_31871 ) ) ( not ( = ?auto_31868 ?auto_31871 ) ) ( not ( = ?auto_31869 ?auto_31871 ) ) ( not ( = ?auto_31870 ?auto_31871 ) ) ( ON ?auto_31869 ?auto_31870 ) ( CLEAR ?auto_31869 ) ( ON-TABLE ?auto_31872 ) ( ON ?auto_31871 ?auto_31872 ) ( not ( = ?auto_31872 ?auto_31871 ) ) ( not ( = ?auto_31872 ?auto_31870 ) ) ( not ( = ?auto_31872 ?auto_31869 ) ) ( not ( = ?auto_31867 ?auto_31872 ) ) ( not ( = ?auto_31868 ?auto_31872 ) ) ( HOLDING ?auto_31868 ) ( CLEAR ?auto_31867 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31867 ?auto_31868 )
      ( MAKE-4PILE ?auto_31867 ?auto_31868 ?auto_31869 ?auto_31870 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31873 - BLOCK
      ?auto_31874 - BLOCK
      ?auto_31875 - BLOCK
      ?auto_31876 - BLOCK
    )
    :vars
    (
      ?auto_31877 - BLOCK
      ?auto_31878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31873 ) ( not ( = ?auto_31873 ?auto_31874 ) ) ( not ( = ?auto_31873 ?auto_31875 ) ) ( not ( = ?auto_31873 ?auto_31876 ) ) ( not ( = ?auto_31874 ?auto_31875 ) ) ( not ( = ?auto_31874 ?auto_31876 ) ) ( not ( = ?auto_31875 ?auto_31876 ) ) ( ON ?auto_31876 ?auto_31877 ) ( not ( = ?auto_31873 ?auto_31877 ) ) ( not ( = ?auto_31874 ?auto_31877 ) ) ( not ( = ?auto_31875 ?auto_31877 ) ) ( not ( = ?auto_31876 ?auto_31877 ) ) ( ON ?auto_31875 ?auto_31876 ) ( ON-TABLE ?auto_31878 ) ( ON ?auto_31877 ?auto_31878 ) ( not ( = ?auto_31878 ?auto_31877 ) ) ( not ( = ?auto_31878 ?auto_31876 ) ) ( not ( = ?auto_31878 ?auto_31875 ) ) ( not ( = ?auto_31873 ?auto_31878 ) ) ( not ( = ?auto_31874 ?auto_31878 ) ) ( CLEAR ?auto_31873 ) ( ON ?auto_31874 ?auto_31875 ) ( CLEAR ?auto_31874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31878 ?auto_31877 ?auto_31876 ?auto_31875 )
      ( MAKE-4PILE ?auto_31873 ?auto_31874 ?auto_31875 ?auto_31876 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31879 - BLOCK
      ?auto_31880 - BLOCK
      ?auto_31881 - BLOCK
      ?auto_31882 - BLOCK
    )
    :vars
    (
      ?auto_31883 - BLOCK
      ?auto_31884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31879 ?auto_31880 ) ) ( not ( = ?auto_31879 ?auto_31881 ) ) ( not ( = ?auto_31879 ?auto_31882 ) ) ( not ( = ?auto_31880 ?auto_31881 ) ) ( not ( = ?auto_31880 ?auto_31882 ) ) ( not ( = ?auto_31881 ?auto_31882 ) ) ( ON ?auto_31882 ?auto_31883 ) ( not ( = ?auto_31879 ?auto_31883 ) ) ( not ( = ?auto_31880 ?auto_31883 ) ) ( not ( = ?auto_31881 ?auto_31883 ) ) ( not ( = ?auto_31882 ?auto_31883 ) ) ( ON ?auto_31881 ?auto_31882 ) ( ON-TABLE ?auto_31884 ) ( ON ?auto_31883 ?auto_31884 ) ( not ( = ?auto_31884 ?auto_31883 ) ) ( not ( = ?auto_31884 ?auto_31882 ) ) ( not ( = ?auto_31884 ?auto_31881 ) ) ( not ( = ?auto_31879 ?auto_31884 ) ) ( not ( = ?auto_31880 ?auto_31884 ) ) ( ON ?auto_31880 ?auto_31881 ) ( CLEAR ?auto_31880 ) ( HOLDING ?auto_31879 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31879 )
      ( MAKE-4PILE ?auto_31879 ?auto_31880 ?auto_31881 ?auto_31882 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31885 - BLOCK
      ?auto_31886 - BLOCK
      ?auto_31887 - BLOCK
      ?auto_31888 - BLOCK
    )
    :vars
    (
      ?auto_31890 - BLOCK
      ?auto_31889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31885 ?auto_31886 ) ) ( not ( = ?auto_31885 ?auto_31887 ) ) ( not ( = ?auto_31885 ?auto_31888 ) ) ( not ( = ?auto_31886 ?auto_31887 ) ) ( not ( = ?auto_31886 ?auto_31888 ) ) ( not ( = ?auto_31887 ?auto_31888 ) ) ( ON ?auto_31888 ?auto_31890 ) ( not ( = ?auto_31885 ?auto_31890 ) ) ( not ( = ?auto_31886 ?auto_31890 ) ) ( not ( = ?auto_31887 ?auto_31890 ) ) ( not ( = ?auto_31888 ?auto_31890 ) ) ( ON ?auto_31887 ?auto_31888 ) ( ON-TABLE ?auto_31889 ) ( ON ?auto_31890 ?auto_31889 ) ( not ( = ?auto_31889 ?auto_31890 ) ) ( not ( = ?auto_31889 ?auto_31888 ) ) ( not ( = ?auto_31889 ?auto_31887 ) ) ( not ( = ?auto_31885 ?auto_31889 ) ) ( not ( = ?auto_31886 ?auto_31889 ) ) ( ON ?auto_31886 ?auto_31887 ) ( ON ?auto_31885 ?auto_31886 ) ( CLEAR ?auto_31885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31889 ?auto_31890 ?auto_31888 ?auto_31887 ?auto_31886 )
      ( MAKE-4PILE ?auto_31885 ?auto_31886 ?auto_31887 ?auto_31888 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31892 - BLOCK
    )
    :vars
    (
      ?auto_31893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31893 ?auto_31892 ) ( CLEAR ?auto_31893 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31892 ) ( not ( = ?auto_31892 ?auto_31893 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31893 ?auto_31892 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31894 - BLOCK
    )
    :vars
    (
      ?auto_31895 - BLOCK
      ?auto_31896 - BLOCK
      ?auto_31897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31895 ?auto_31894 ) ( CLEAR ?auto_31895 ) ( ON-TABLE ?auto_31894 ) ( not ( = ?auto_31894 ?auto_31895 ) ) ( HOLDING ?auto_31896 ) ( CLEAR ?auto_31897 ) ( not ( = ?auto_31894 ?auto_31896 ) ) ( not ( = ?auto_31894 ?auto_31897 ) ) ( not ( = ?auto_31895 ?auto_31896 ) ) ( not ( = ?auto_31895 ?auto_31897 ) ) ( not ( = ?auto_31896 ?auto_31897 ) ) )
    :subtasks
    ( ( !STACK ?auto_31896 ?auto_31897 )
      ( MAKE-1PILE ?auto_31894 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31898 - BLOCK
    )
    :vars
    (
      ?auto_31899 - BLOCK
      ?auto_31900 - BLOCK
      ?auto_31901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31899 ?auto_31898 ) ( ON-TABLE ?auto_31898 ) ( not ( = ?auto_31898 ?auto_31899 ) ) ( CLEAR ?auto_31900 ) ( not ( = ?auto_31898 ?auto_31901 ) ) ( not ( = ?auto_31898 ?auto_31900 ) ) ( not ( = ?auto_31899 ?auto_31901 ) ) ( not ( = ?auto_31899 ?auto_31900 ) ) ( not ( = ?auto_31901 ?auto_31900 ) ) ( ON ?auto_31901 ?auto_31899 ) ( CLEAR ?auto_31901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31898 ?auto_31899 )
      ( MAKE-1PILE ?auto_31898 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31902 - BLOCK
    )
    :vars
    (
      ?auto_31903 - BLOCK
      ?auto_31904 - BLOCK
      ?auto_31905 - BLOCK
      ?auto_31906 - BLOCK
      ?auto_31907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31903 ?auto_31902 ) ( ON-TABLE ?auto_31902 ) ( not ( = ?auto_31902 ?auto_31903 ) ) ( not ( = ?auto_31902 ?auto_31904 ) ) ( not ( = ?auto_31902 ?auto_31905 ) ) ( not ( = ?auto_31903 ?auto_31904 ) ) ( not ( = ?auto_31903 ?auto_31905 ) ) ( not ( = ?auto_31904 ?auto_31905 ) ) ( ON ?auto_31904 ?auto_31903 ) ( CLEAR ?auto_31904 ) ( HOLDING ?auto_31905 ) ( CLEAR ?auto_31906 ) ( ON-TABLE ?auto_31907 ) ( ON ?auto_31906 ?auto_31907 ) ( not ( = ?auto_31907 ?auto_31906 ) ) ( not ( = ?auto_31907 ?auto_31905 ) ) ( not ( = ?auto_31906 ?auto_31905 ) ) ( not ( = ?auto_31902 ?auto_31906 ) ) ( not ( = ?auto_31902 ?auto_31907 ) ) ( not ( = ?auto_31903 ?auto_31906 ) ) ( not ( = ?auto_31903 ?auto_31907 ) ) ( not ( = ?auto_31904 ?auto_31906 ) ) ( not ( = ?auto_31904 ?auto_31907 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31907 ?auto_31906 ?auto_31905 )
      ( MAKE-1PILE ?auto_31902 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31908 - BLOCK
    )
    :vars
    (
      ?auto_31913 - BLOCK
      ?auto_31909 - BLOCK
      ?auto_31912 - BLOCK
      ?auto_31910 - BLOCK
      ?auto_31911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31913 ?auto_31908 ) ( ON-TABLE ?auto_31908 ) ( not ( = ?auto_31908 ?auto_31913 ) ) ( not ( = ?auto_31908 ?auto_31909 ) ) ( not ( = ?auto_31908 ?auto_31912 ) ) ( not ( = ?auto_31913 ?auto_31909 ) ) ( not ( = ?auto_31913 ?auto_31912 ) ) ( not ( = ?auto_31909 ?auto_31912 ) ) ( ON ?auto_31909 ?auto_31913 ) ( CLEAR ?auto_31910 ) ( ON-TABLE ?auto_31911 ) ( ON ?auto_31910 ?auto_31911 ) ( not ( = ?auto_31911 ?auto_31910 ) ) ( not ( = ?auto_31911 ?auto_31912 ) ) ( not ( = ?auto_31910 ?auto_31912 ) ) ( not ( = ?auto_31908 ?auto_31910 ) ) ( not ( = ?auto_31908 ?auto_31911 ) ) ( not ( = ?auto_31913 ?auto_31910 ) ) ( not ( = ?auto_31913 ?auto_31911 ) ) ( not ( = ?auto_31909 ?auto_31910 ) ) ( not ( = ?auto_31909 ?auto_31911 ) ) ( ON ?auto_31912 ?auto_31909 ) ( CLEAR ?auto_31912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31908 ?auto_31913 ?auto_31909 )
      ( MAKE-1PILE ?auto_31908 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31914 - BLOCK
    )
    :vars
    (
      ?auto_31916 - BLOCK
      ?auto_31915 - BLOCK
      ?auto_31919 - BLOCK
      ?auto_31918 - BLOCK
      ?auto_31917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31916 ?auto_31914 ) ( ON-TABLE ?auto_31914 ) ( not ( = ?auto_31914 ?auto_31916 ) ) ( not ( = ?auto_31914 ?auto_31915 ) ) ( not ( = ?auto_31914 ?auto_31919 ) ) ( not ( = ?auto_31916 ?auto_31915 ) ) ( not ( = ?auto_31916 ?auto_31919 ) ) ( not ( = ?auto_31915 ?auto_31919 ) ) ( ON ?auto_31915 ?auto_31916 ) ( ON-TABLE ?auto_31918 ) ( not ( = ?auto_31918 ?auto_31917 ) ) ( not ( = ?auto_31918 ?auto_31919 ) ) ( not ( = ?auto_31917 ?auto_31919 ) ) ( not ( = ?auto_31914 ?auto_31917 ) ) ( not ( = ?auto_31914 ?auto_31918 ) ) ( not ( = ?auto_31916 ?auto_31917 ) ) ( not ( = ?auto_31916 ?auto_31918 ) ) ( not ( = ?auto_31915 ?auto_31917 ) ) ( not ( = ?auto_31915 ?auto_31918 ) ) ( ON ?auto_31919 ?auto_31915 ) ( CLEAR ?auto_31919 ) ( HOLDING ?auto_31917 ) ( CLEAR ?auto_31918 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31918 ?auto_31917 )
      ( MAKE-1PILE ?auto_31914 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32383 - BLOCK
    )
    :vars
    (
      ?auto_32385 - BLOCK
      ?auto_32384 - BLOCK
      ?auto_32386 - BLOCK
      ?auto_32387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32385 ?auto_32383 ) ( ON-TABLE ?auto_32383 ) ( not ( = ?auto_32383 ?auto_32385 ) ) ( not ( = ?auto_32383 ?auto_32384 ) ) ( not ( = ?auto_32383 ?auto_32386 ) ) ( not ( = ?auto_32385 ?auto_32384 ) ) ( not ( = ?auto_32385 ?auto_32386 ) ) ( not ( = ?auto_32384 ?auto_32386 ) ) ( ON ?auto_32384 ?auto_32385 ) ( not ( = ?auto_32387 ?auto_32386 ) ) ( not ( = ?auto_32383 ?auto_32387 ) ) ( not ( = ?auto_32385 ?auto_32387 ) ) ( not ( = ?auto_32384 ?auto_32387 ) ) ( ON ?auto_32386 ?auto_32384 ) ( ON ?auto_32387 ?auto_32386 ) ( CLEAR ?auto_32387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32383 ?auto_32385 ?auto_32384 ?auto_32386 )
      ( MAKE-1PILE ?auto_32383 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31926 - BLOCK
    )
    :vars
    (
      ?auto_31928 - BLOCK
      ?auto_31929 - BLOCK
      ?auto_31931 - BLOCK
      ?auto_31927 - BLOCK
      ?auto_31930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31928 ?auto_31926 ) ( ON-TABLE ?auto_31926 ) ( not ( = ?auto_31926 ?auto_31928 ) ) ( not ( = ?auto_31926 ?auto_31929 ) ) ( not ( = ?auto_31926 ?auto_31931 ) ) ( not ( = ?auto_31928 ?auto_31929 ) ) ( not ( = ?auto_31928 ?auto_31931 ) ) ( not ( = ?auto_31929 ?auto_31931 ) ) ( ON ?auto_31929 ?auto_31928 ) ( not ( = ?auto_31927 ?auto_31930 ) ) ( not ( = ?auto_31927 ?auto_31931 ) ) ( not ( = ?auto_31930 ?auto_31931 ) ) ( not ( = ?auto_31926 ?auto_31930 ) ) ( not ( = ?auto_31926 ?auto_31927 ) ) ( not ( = ?auto_31928 ?auto_31930 ) ) ( not ( = ?auto_31928 ?auto_31927 ) ) ( not ( = ?auto_31929 ?auto_31930 ) ) ( not ( = ?auto_31929 ?auto_31927 ) ) ( ON ?auto_31931 ?auto_31929 ) ( ON ?auto_31930 ?auto_31931 ) ( CLEAR ?auto_31930 ) ( HOLDING ?auto_31927 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31927 )
      ( MAKE-1PILE ?auto_31926 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31932 - BLOCK
    )
    :vars
    (
      ?auto_31937 - BLOCK
      ?auto_31935 - BLOCK
      ?auto_31936 - BLOCK
      ?auto_31933 - BLOCK
      ?auto_31934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31937 ?auto_31932 ) ( ON-TABLE ?auto_31932 ) ( not ( = ?auto_31932 ?auto_31937 ) ) ( not ( = ?auto_31932 ?auto_31935 ) ) ( not ( = ?auto_31932 ?auto_31936 ) ) ( not ( = ?auto_31937 ?auto_31935 ) ) ( not ( = ?auto_31937 ?auto_31936 ) ) ( not ( = ?auto_31935 ?auto_31936 ) ) ( ON ?auto_31935 ?auto_31937 ) ( not ( = ?auto_31933 ?auto_31934 ) ) ( not ( = ?auto_31933 ?auto_31936 ) ) ( not ( = ?auto_31934 ?auto_31936 ) ) ( not ( = ?auto_31932 ?auto_31934 ) ) ( not ( = ?auto_31932 ?auto_31933 ) ) ( not ( = ?auto_31937 ?auto_31934 ) ) ( not ( = ?auto_31937 ?auto_31933 ) ) ( not ( = ?auto_31935 ?auto_31934 ) ) ( not ( = ?auto_31935 ?auto_31933 ) ) ( ON ?auto_31936 ?auto_31935 ) ( ON ?auto_31934 ?auto_31936 ) ( ON ?auto_31933 ?auto_31934 ) ( CLEAR ?auto_31933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31932 ?auto_31937 ?auto_31935 ?auto_31936 ?auto_31934 )
      ( MAKE-1PILE ?auto_31932 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31943 - BLOCK
      ?auto_31944 - BLOCK
      ?auto_31945 - BLOCK
      ?auto_31946 - BLOCK
      ?auto_31947 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_31947 ) ( CLEAR ?auto_31946 ) ( ON-TABLE ?auto_31943 ) ( ON ?auto_31944 ?auto_31943 ) ( ON ?auto_31945 ?auto_31944 ) ( ON ?auto_31946 ?auto_31945 ) ( not ( = ?auto_31943 ?auto_31944 ) ) ( not ( = ?auto_31943 ?auto_31945 ) ) ( not ( = ?auto_31943 ?auto_31946 ) ) ( not ( = ?auto_31943 ?auto_31947 ) ) ( not ( = ?auto_31944 ?auto_31945 ) ) ( not ( = ?auto_31944 ?auto_31946 ) ) ( not ( = ?auto_31944 ?auto_31947 ) ) ( not ( = ?auto_31945 ?auto_31946 ) ) ( not ( = ?auto_31945 ?auto_31947 ) ) ( not ( = ?auto_31946 ?auto_31947 ) ) )
    :subtasks
    ( ( !STACK ?auto_31947 ?auto_31946 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31948 - BLOCK
      ?auto_31949 - BLOCK
      ?auto_31950 - BLOCK
      ?auto_31951 - BLOCK
      ?auto_31952 - BLOCK
    )
    :vars
    (
      ?auto_31953 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31951 ) ( ON-TABLE ?auto_31948 ) ( ON ?auto_31949 ?auto_31948 ) ( ON ?auto_31950 ?auto_31949 ) ( ON ?auto_31951 ?auto_31950 ) ( not ( = ?auto_31948 ?auto_31949 ) ) ( not ( = ?auto_31948 ?auto_31950 ) ) ( not ( = ?auto_31948 ?auto_31951 ) ) ( not ( = ?auto_31948 ?auto_31952 ) ) ( not ( = ?auto_31949 ?auto_31950 ) ) ( not ( = ?auto_31949 ?auto_31951 ) ) ( not ( = ?auto_31949 ?auto_31952 ) ) ( not ( = ?auto_31950 ?auto_31951 ) ) ( not ( = ?auto_31950 ?auto_31952 ) ) ( not ( = ?auto_31951 ?auto_31952 ) ) ( ON ?auto_31952 ?auto_31953 ) ( CLEAR ?auto_31952 ) ( HAND-EMPTY ) ( not ( = ?auto_31948 ?auto_31953 ) ) ( not ( = ?auto_31949 ?auto_31953 ) ) ( not ( = ?auto_31950 ?auto_31953 ) ) ( not ( = ?auto_31951 ?auto_31953 ) ) ( not ( = ?auto_31952 ?auto_31953 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31952 ?auto_31953 )
      ( MAKE-5PILE ?auto_31948 ?auto_31949 ?auto_31950 ?auto_31951 ?auto_31952 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31954 - BLOCK
      ?auto_31955 - BLOCK
      ?auto_31956 - BLOCK
      ?auto_31957 - BLOCK
      ?auto_31958 - BLOCK
    )
    :vars
    (
      ?auto_31959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31954 ) ( ON ?auto_31955 ?auto_31954 ) ( ON ?auto_31956 ?auto_31955 ) ( not ( = ?auto_31954 ?auto_31955 ) ) ( not ( = ?auto_31954 ?auto_31956 ) ) ( not ( = ?auto_31954 ?auto_31957 ) ) ( not ( = ?auto_31954 ?auto_31958 ) ) ( not ( = ?auto_31955 ?auto_31956 ) ) ( not ( = ?auto_31955 ?auto_31957 ) ) ( not ( = ?auto_31955 ?auto_31958 ) ) ( not ( = ?auto_31956 ?auto_31957 ) ) ( not ( = ?auto_31956 ?auto_31958 ) ) ( not ( = ?auto_31957 ?auto_31958 ) ) ( ON ?auto_31958 ?auto_31959 ) ( CLEAR ?auto_31958 ) ( not ( = ?auto_31954 ?auto_31959 ) ) ( not ( = ?auto_31955 ?auto_31959 ) ) ( not ( = ?auto_31956 ?auto_31959 ) ) ( not ( = ?auto_31957 ?auto_31959 ) ) ( not ( = ?auto_31958 ?auto_31959 ) ) ( HOLDING ?auto_31957 ) ( CLEAR ?auto_31956 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31954 ?auto_31955 ?auto_31956 ?auto_31957 )
      ( MAKE-5PILE ?auto_31954 ?auto_31955 ?auto_31956 ?auto_31957 ?auto_31958 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31960 - BLOCK
      ?auto_31961 - BLOCK
      ?auto_31962 - BLOCK
      ?auto_31963 - BLOCK
      ?auto_31964 - BLOCK
    )
    :vars
    (
      ?auto_31965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31960 ) ( ON ?auto_31961 ?auto_31960 ) ( ON ?auto_31962 ?auto_31961 ) ( not ( = ?auto_31960 ?auto_31961 ) ) ( not ( = ?auto_31960 ?auto_31962 ) ) ( not ( = ?auto_31960 ?auto_31963 ) ) ( not ( = ?auto_31960 ?auto_31964 ) ) ( not ( = ?auto_31961 ?auto_31962 ) ) ( not ( = ?auto_31961 ?auto_31963 ) ) ( not ( = ?auto_31961 ?auto_31964 ) ) ( not ( = ?auto_31962 ?auto_31963 ) ) ( not ( = ?auto_31962 ?auto_31964 ) ) ( not ( = ?auto_31963 ?auto_31964 ) ) ( ON ?auto_31964 ?auto_31965 ) ( not ( = ?auto_31960 ?auto_31965 ) ) ( not ( = ?auto_31961 ?auto_31965 ) ) ( not ( = ?auto_31962 ?auto_31965 ) ) ( not ( = ?auto_31963 ?auto_31965 ) ) ( not ( = ?auto_31964 ?auto_31965 ) ) ( CLEAR ?auto_31962 ) ( ON ?auto_31963 ?auto_31964 ) ( CLEAR ?auto_31963 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31965 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31965 ?auto_31964 )
      ( MAKE-5PILE ?auto_31960 ?auto_31961 ?auto_31962 ?auto_31963 ?auto_31964 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31966 - BLOCK
      ?auto_31967 - BLOCK
      ?auto_31968 - BLOCK
      ?auto_31969 - BLOCK
      ?auto_31970 - BLOCK
    )
    :vars
    (
      ?auto_31971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31966 ) ( ON ?auto_31967 ?auto_31966 ) ( not ( = ?auto_31966 ?auto_31967 ) ) ( not ( = ?auto_31966 ?auto_31968 ) ) ( not ( = ?auto_31966 ?auto_31969 ) ) ( not ( = ?auto_31966 ?auto_31970 ) ) ( not ( = ?auto_31967 ?auto_31968 ) ) ( not ( = ?auto_31967 ?auto_31969 ) ) ( not ( = ?auto_31967 ?auto_31970 ) ) ( not ( = ?auto_31968 ?auto_31969 ) ) ( not ( = ?auto_31968 ?auto_31970 ) ) ( not ( = ?auto_31969 ?auto_31970 ) ) ( ON ?auto_31970 ?auto_31971 ) ( not ( = ?auto_31966 ?auto_31971 ) ) ( not ( = ?auto_31967 ?auto_31971 ) ) ( not ( = ?auto_31968 ?auto_31971 ) ) ( not ( = ?auto_31969 ?auto_31971 ) ) ( not ( = ?auto_31970 ?auto_31971 ) ) ( ON ?auto_31969 ?auto_31970 ) ( CLEAR ?auto_31969 ) ( ON-TABLE ?auto_31971 ) ( HOLDING ?auto_31968 ) ( CLEAR ?auto_31967 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31966 ?auto_31967 ?auto_31968 )
      ( MAKE-5PILE ?auto_31966 ?auto_31967 ?auto_31968 ?auto_31969 ?auto_31970 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31972 - BLOCK
      ?auto_31973 - BLOCK
      ?auto_31974 - BLOCK
      ?auto_31975 - BLOCK
      ?auto_31976 - BLOCK
    )
    :vars
    (
      ?auto_31977 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31972 ) ( ON ?auto_31973 ?auto_31972 ) ( not ( = ?auto_31972 ?auto_31973 ) ) ( not ( = ?auto_31972 ?auto_31974 ) ) ( not ( = ?auto_31972 ?auto_31975 ) ) ( not ( = ?auto_31972 ?auto_31976 ) ) ( not ( = ?auto_31973 ?auto_31974 ) ) ( not ( = ?auto_31973 ?auto_31975 ) ) ( not ( = ?auto_31973 ?auto_31976 ) ) ( not ( = ?auto_31974 ?auto_31975 ) ) ( not ( = ?auto_31974 ?auto_31976 ) ) ( not ( = ?auto_31975 ?auto_31976 ) ) ( ON ?auto_31976 ?auto_31977 ) ( not ( = ?auto_31972 ?auto_31977 ) ) ( not ( = ?auto_31973 ?auto_31977 ) ) ( not ( = ?auto_31974 ?auto_31977 ) ) ( not ( = ?auto_31975 ?auto_31977 ) ) ( not ( = ?auto_31976 ?auto_31977 ) ) ( ON ?auto_31975 ?auto_31976 ) ( ON-TABLE ?auto_31977 ) ( CLEAR ?auto_31973 ) ( ON ?auto_31974 ?auto_31975 ) ( CLEAR ?auto_31974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31977 ?auto_31976 ?auto_31975 )
      ( MAKE-5PILE ?auto_31972 ?auto_31973 ?auto_31974 ?auto_31975 ?auto_31976 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31978 - BLOCK
      ?auto_31979 - BLOCK
      ?auto_31980 - BLOCK
      ?auto_31981 - BLOCK
      ?auto_31982 - BLOCK
    )
    :vars
    (
      ?auto_31983 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31978 ) ( not ( = ?auto_31978 ?auto_31979 ) ) ( not ( = ?auto_31978 ?auto_31980 ) ) ( not ( = ?auto_31978 ?auto_31981 ) ) ( not ( = ?auto_31978 ?auto_31982 ) ) ( not ( = ?auto_31979 ?auto_31980 ) ) ( not ( = ?auto_31979 ?auto_31981 ) ) ( not ( = ?auto_31979 ?auto_31982 ) ) ( not ( = ?auto_31980 ?auto_31981 ) ) ( not ( = ?auto_31980 ?auto_31982 ) ) ( not ( = ?auto_31981 ?auto_31982 ) ) ( ON ?auto_31982 ?auto_31983 ) ( not ( = ?auto_31978 ?auto_31983 ) ) ( not ( = ?auto_31979 ?auto_31983 ) ) ( not ( = ?auto_31980 ?auto_31983 ) ) ( not ( = ?auto_31981 ?auto_31983 ) ) ( not ( = ?auto_31982 ?auto_31983 ) ) ( ON ?auto_31981 ?auto_31982 ) ( ON-TABLE ?auto_31983 ) ( ON ?auto_31980 ?auto_31981 ) ( CLEAR ?auto_31980 ) ( HOLDING ?auto_31979 ) ( CLEAR ?auto_31978 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31978 ?auto_31979 )
      ( MAKE-5PILE ?auto_31978 ?auto_31979 ?auto_31980 ?auto_31981 ?auto_31982 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31984 - BLOCK
      ?auto_31985 - BLOCK
      ?auto_31986 - BLOCK
      ?auto_31987 - BLOCK
      ?auto_31988 - BLOCK
    )
    :vars
    (
      ?auto_31989 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31984 ) ( not ( = ?auto_31984 ?auto_31985 ) ) ( not ( = ?auto_31984 ?auto_31986 ) ) ( not ( = ?auto_31984 ?auto_31987 ) ) ( not ( = ?auto_31984 ?auto_31988 ) ) ( not ( = ?auto_31985 ?auto_31986 ) ) ( not ( = ?auto_31985 ?auto_31987 ) ) ( not ( = ?auto_31985 ?auto_31988 ) ) ( not ( = ?auto_31986 ?auto_31987 ) ) ( not ( = ?auto_31986 ?auto_31988 ) ) ( not ( = ?auto_31987 ?auto_31988 ) ) ( ON ?auto_31988 ?auto_31989 ) ( not ( = ?auto_31984 ?auto_31989 ) ) ( not ( = ?auto_31985 ?auto_31989 ) ) ( not ( = ?auto_31986 ?auto_31989 ) ) ( not ( = ?auto_31987 ?auto_31989 ) ) ( not ( = ?auto_31988 ?auto_31989 ) ) ( ON ?auto_31987 ?auto_31988 ) ( ON-TABLE ?auto_31989 ) ( ON ?auto_31986 ?auto_31987 ) ( CLEAR ?auto_31984 ) ( ON ?auto_31985 ?auto_31986 ) ( CLEAR ?auto_31985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31989 ?auto_31988 ?auto_31987 ?auto_31986 )
      ( MAKE-5PILE ?auto_31984 ?auto_31985 ?auto_31986 ?auto_31987 ?auto_31988 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31990 - BLOCK
      ?auto_31991 - BLOCK
      ?auto_31992 - BLOCK
      ?auto_31993 - BLOCK
      ?auto_31994 - BLOCK
    )
    :vars
    (
      ?auto_31995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31990 ?auto_31991 ) ) ( not ( = ?auto_31990 ?auto_31992 ) ) ( not ( = ?auto_31990 ?auto_31993 ) ) ( not ( = ?auto_31990 ?auto_31994 ) ) ( not ( = ?auto_31991 ?auto_31992 ) ) ( not ( = ?auto_31991 ?auto_31993 ) ) ( not ( = ?auto_31991 ?auto_31994 ) ) ( not ( = ?auto_31992 ?auto_31993 ) ) ( not ( = ?auto_31992 ?auto_31994 ) ) ( not ( = ?auto_31993 ?auto_31994 ) ) ( ON ?auto_31994 ?auto_31995 ) ( not ( = ?auto_31990 ?auto_31995 ) ) ( not ( = ?auto_31991 ?auto_31995 ) ) ( not ( = ?auto_31992 ?auto_31995 ) ) ( not ( = ?auto_31993 ?auto_31995 ) ) ( not ( = ?auto_31994 ?auto_31995 ) ) ( ON ?auto_31993 ?auto_31994 ) ( ON-TABLE ?auto_31995 ) ( ON ?auto_31992 ?auto_31993 ) ( ON ?auto_31991 ?auto_31992 ) ( CLEAR ?auto_31991 ) ( HOLDING ?auto_31990 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31990 )
      ( MAKE-5PILE ?auto_31990 ?auto_31991 ?auto_31992 ?auto_31993 ?auto_31994 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31996 - BLOCK
      ?auto_31997 - BLOCK
      ?auto_31998 - BLOCK
      ?auto_31999 - BLOCK
      ?auto_32000 - BLOCK
    )
    :vars
    (
      ?auto_32001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31996 ?auto_31997 ) ) ( not ( = ?auto_31996 ?auto_31998 ) ) ( not ( = ?auto_31996 ?auto_31999 ) ) ( not ( = ?auto_31996 ?auto_32000 ) ) ( not ( = ?auto_31997 ?auto_31998 ) ) ( not ( = ?auto_31997 ?auto_31999 ) ) ( not ( = ?auto_31997 ?auto_32000 ) ) ( not ( = ?auto_31998 ?auto_31999 ) ) ( not ( = ?auto_31998 ?auto_32000 ) ) ( not ( = ?auto_31999 ?auto_32000 ) ) ( ON ?auto_32000 ?auto_32001 ) ( not ( = ?auto_31996 ?auto_32001 ) ) ( not ( = ?auto_31997 ?auto_32001 ) ) ( not ( = ?auto_31998 ?auto_32001 ) ) ( not ( = ?auto_31999 ?auto_32001 ) ) ( not ( = ?auto_32000 ?auto_32001 ) ) ( ON ?auto_31999 ?auto_32000 ) ( ON-TABLE ?auto_32001 ) ( ON ?auto_31998 ?auto_31999 ) ( ON ?auto_31997 ?auto_31998 ) ( ON ?auto_31996 ?auto_31997 ) ( CLEAR ?auto_31996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32001 ?auto_32000 ?auto_31999 ?auto_31998 ?auto_31997 )
      ( MAKE-5PILE ?auto_31996 ?auto_31997 ?auto_31998 ?auto_31999 ?auto_32000 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32060 - BLOCK
    )
    :vars
    (
      ?auto_32061 - BLOCK
      ?auto_32062 - BLOCK
      ?auto_32063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32060 ?auto_32061 ) ( CLEAR ?auto_32060 ) ( not ( = ?auto_32060 ?auto_32061 ) ) ( HOLDING ?auto_32062 ) ( CLEAR ?auto_32063 ) ( not ( = ?auto_32060 ?auto_32062 ) ) ( not ( = ?auto_32060 ?auto_32063 ) ) ( not ( = ?auto_32061 ?auto_32062 ) ) ( not ( = ?auto_32061 ?auto_32063 ) ) ( not ( = ?auto_32062 ?auto_32063 ) ) )
    :subtasks
    ( ( !STACK ?auto_32062 ?auto_32063 )
      ( MAKE-1PILE ?auto_32060 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32064 - BLOCK
    )
    :vars
    (
      ?auto_32066 - BLOCK
      ?auto_32067 - BLOCK
      ?auto_32065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32064 ?auto_32066 ) ( not ( = ?auto_32064 ?auto_32066 ) ) ( CLEAR ?auto_32067 ) ( not ( = ?auto_32064 ?auto_32065 ) ) ( not ( = ?auto_32064 ?auto_32067 ) ) ( not ( = ?auto_32066 ?auto_32065 ) ) ( not ( = ?auto_32066 ?auto_32067 ) ) ( not ( = ?auto_32065 ?auto_32067 ) ) ( ON ?auto_32065 ?auto_32064 ) ( CLEAR ?auto_32065 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32066 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32066 ?auto_32064 )
      ( MAKE-1PILE ?auto_32064 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32068 - BLOCK
    )
    :vars
    (
      ?auto_32071 - BLOCK
      ?auto_32069 - BLOCK
      ?auto_32070 - BLOCK
      ?auto_32072 - BLOCK
      ?auto_32073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32068 ?auto_32071 ) ( not ( = ?auto_32068 ?auto_32071 ) ) ( not ( = ?auto_32068 ?auto_32069 ) ) ( not ( = ?auto_32068 ?auto_32070 ) ) ( not ( = ?auto_32071 ?auto_32069 ) ) ( not ( = ?auto_32071 ?auto_32070 ) ) ( not ( = ?auto_32069 ?auto_32070 ) ) ( ON ?auto_32069 ?auto_32068 ) ( CLEAR ?auto_32069 ) ( ON-TABLE ?auto_32071 ) ( HOLDING ?auto_32070 ) ( CLEAR ?auto_32072 ) ( ON-TABLE ?auto_32073 ) ( ON ?auto_32072 ?auto_32073 ) ( not ( = ?auto_32073 ?auto_32072 ) ) ( not ( = ?auto_32073 ?auto_32070 ) ) ( not ( = ?auto_32072 ?auto_32070 ) ) ( not ( = ?auto_32068 ?auto_32072 ) ) ( not ( = ?auto_32068 ?auto_32073 ) ) ( not ( = ?auto_32071 ?auto_32072 ) ) ( not ( = ?auto_32071 ?auto_32073 ) ) ( not ( = ?auto_32069 ?auto_32072 ) ) ( not ( = ?auto_32069 ?auto_32073 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32073 ?auto_32072 ?auto_32070 )
      ( MAKE-1PILE ?auto_32068 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32074 - BLOCK
    )
    :vars
    (
      ?auto_32077 - BLOCK
      ?auto_32076 - BLOCK
      ?auto_32075 - BLOCK
      ?auto_32078 - BLOCK
      ?auto_32079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32074 ?auto_32077 ) ( not ( = ?auto_32074 ?auto_32077 ) ) ( not ( = ?auto_32074 ?auto_32076 ) ) ( not ( = ?auto_32074 ?auto_32075 ) ) ( not ( = ?auto_32077 ?auto_32076 ) ) ( not ( = ?auto_32077 ?auto_32075 ) ) ( not ( = ?auto_32076 ?auto_32075 ) ) ( ON ?auto_32076 ?auto_32074 ) ( ON-TABLE ?auto_32077 ) ( CLEAR ?auto_32078 ) ( ON-TABLE ?auto_32079 ) ( ON ?auto_32078 ?auto_32079 ) ( not ( = ?auto_32079 ?auto_32078 ) ) ( not ( = ?auto_32079 ?auto_32075 ) ) ( not ( = ?auto_32078 ?auto_32075 ) ) ( not ( = ?auto_32074 ?auto_32078 ) ) ( not ( = ?auto_32074 ?auto_32079 ) ) ( not ( = ?auto_32077 ?auto_32078 ) ) ( not ( = ?auto_32077 ?auto_32079 ) ) ( not ( = ?auto_32076 ?auto_32078 ) ) ( not ( = ?auto_32076 ?auto_32079 ) ) ( ON ?auto_32075 ?auto_32076 ) ( CLEAR ?auto_32075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32077 ?auto_32074 ?auto_32076 )
      ( MAKE-1PILE ?auto_32074 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32080 - BLOCK
    )
    :vars
    (
      ?auto_32083 - BLOCK
      ?auto_32081 - BLOCK
      ?auto_32085 - BLOCK
      ?auto_32082 - BLOCK
      ?auto_32084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32080 ?auto_32083 ) ( not ( = ?auto_32080 ?auto_32083 ) ) ( not ( = ?auto_32080 ?auto_32081 ) ) ( not ( = ?auto_32080 ?auto_32085 ) ) ( not ( = ?auto_32083 ?auto_32081 ) ) ( not ( = ?auto_32083 ?auto_32085 ) ) ( not ( = ?auto_32081 ?auto_32085 ) ) ( ON ?auto_32081 ?auto_32080 ) ( ON-TABLE ?auto_32083 ) ( ON-TABLE ?auto_32082 ) ( not ( = ?auto_32082 ?auto_32084 ) ) ( not ( = ?auto_32082 ?auto_32085 ) ) ( not ( = ?auto_32084 ?auto_32085 ) ) ( not ( = ?auto_32080 ?auto_32084 ) ) ( not ( = ?auto_32080 ?auto_32082 ) ) ( not ( = ?auto_32083 ?auto_32084 ) ) ( not ( = ?auto_32083 ?auto_32082 ) ) ( not ( = ?auto_32081 ?auto_32084 ) ) ( not ( = ?auto_32081 ?auto_32082 ) ) ( ON ?auto_32085 ?auto_32081 ) ( CLEAR ?auto_32085 ) ( HOLDING ?auto_32084 ) ( CLEAR ?auto_32082 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32082 ?auto_32084 )
      ( MAKE-1PILE ?auto_32080 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32086 - BLOCK
    )
    :vars
    (
      ?auto_32088 - BLOCK
      ?auto_32089 - BLOCK
      ?auto_32090 - BLOCK
      ?auto_32091 - BLOCK
      ?auto_32087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32086 ?auto_32088 ) ( not ( = ?auto_32086 ?auto_32088 ) ) ( not ( = ?auto_32086 ?auto_32089 ) ) ( not ( = ?auto_32086 ?auto_32090 ) ) ( not ( = ?auto_32088 ?auto_32089 ) ) ( not ( = ?auto_32088 ?auto_32090 ) ) ( not ( = ?auto_32089 ?auto_32090 ) ) ( ON ?auto_32089 ?auto_32086 ) ( ON-TABLE ?auto_32088 ) ( ON-TABLE ?auto_32091 ) ( not ( = ?auto_32091 ?auto_32087 ) ) ( not ( = ?auto_32091 ?auto_32090 ) ) ( not ( = ?auto_32087 ?auto_32090 ) ) ( not ( = ?auto_32086 ?auto_32087 ) ) ( not ( = ?auto_32086 ?auto_32091 ) ) ( not ( = ?auto_32088 ?auto_32087 ) ) ( not ( = ?auto_32088 ?auto_32091 ) ) ( not ( = ?auto_32089 ?auto_32087 ) ) ( not ( = ?auto_32089 ?auto_32091 ) ) ( ON ?auto_32090 ?auto_32089 ) ( CLEAR ?auto_32091 ) ( ON ?auto_32087 ?auto_32090 ) ( CLEAR ?auto_32087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32088 ?auto_32086 ?auto_32089 ?auto_32090 )
      ( MAKE-1PILE ?auto_32086 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32092 - BLOCK
    )
    :vars
    (
      ?auto_32093 - BLOCK
      ?auto_32096 - BLOCK
      ?auto_32095 - BLOCK
      ?auto_32097 - BLOCK
      ?auto_32094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32092 ?auto_32093 ) ( not ( = ?auto_32092 ?auto_32093 ) ) ( not ( = ?auto_32092 ?auto_32096 ) ) ( not ( = ?auto_32092 ?auto_32095 ) ) ( not ( = ?auto_32093 ?auto_32096 ) ) ( not ( = ?auto_32093 ?auto_32095 ) ) ( not ( = ?auto_32096 ?auto_32095 ) ) ( ON ?auto_32096 ?auto_32092 ) ( ON-TABLE ?auto_32093 ) ( not ( = ?auto_32097 ?auto_32094 ) ) ( not ( = ?auto_32097 ?auto_32095 ) ) ( not ( = ?auto_32094 ?auto_32095 ) ) ( not ( = ?auto_32092 ?auto_32094 ) ) ( not ( = ?auto_32092 ?auto_32097 ) ) ( not ( = ?auto_32093 ?auto_32094 ) ) ( not ( = ?auto_32093 ?auto_32097 ) ) ( not ( = ?auto_32096 ?auto_32094 ) ) ( not ( = ?auto_32096 ?auto_32097 ) ) ( ON ?auto_32095 ?auto_32096 ) ( ON ?auto_32094 ?auto_32095 ) ( CLEAR ?auto_32094 ) ( HOLDING ?auto_32097 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32097 )
      ( MAKE-1PILE ?auto_32092 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32098 - BLOCK
    )
    :vars
    (
      ?auto_32103 - BLOCK
      ?auto_32100 - BLOCK
      ?auto_32099 - BLOCK
      ?auto_32101 - BLOCK
      ?auto_32102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32098 ?auto_32103 ) ( not ( = ?auto_32098 ?auto_32103 ) ) ( not ( = ?auto_32098 ?auto_32100 ) ) ( not ( = ?auto_32098 ?auto_32099 ) ) ( not ( = ?auto_32103 ?auto_32100 ) ) ( not ( = ?auto_32103 ?auto_32099 ) ) ( not ( = ?auto_32100 ?auto_32099 ) ) ( ON ?auto_32100 ?auto_32098 ) ( ON-TABLE ?auto_32103 ) ( not ( = ?auto_32101 ?auto_32102 ) ) ( not ( = ?auto_32101 ?auto_32099 ) ) ( not ( = ?auto_32102 ?auto_32099 ) ) ( not ( = ?auto_32098 ?auto_32102 ) ) ( not ( = ?auto_32098 ?auto_32101 ) ) ( not ( = ?auto_32103 ?auto_32102 ) ) ( not ( = ?auto_32103 ?auto_32101 ) ) ( not ( = ?auto_32100 ?auto_32102 ) ) ( not ( = ?auto_32100 ?auto_32101 ) ) ( ON ?auto_32099 ?auto_32100 ) ( ON ?auto_32102 ?auto_32099 ) ( ON ?auto_32101 ?auto_32102 ) ( CLEAR ?auto_32101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32103 ?auto_32098 ?auto_32100 ?auto_32099 ?auto_32102 )
      ( MAKE-1PILE ?auto_32098 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32111 - BLOCK
      ?auto_32112 - BLOCK
      ?auto_32113 - BLOCK
    )
    :vars
    (
      ?auto_32114 - BLOCK
      ?auto_32115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32114 ?auto_32113 ) ( CLEAR ?auto_32114 ) ( ON-TABLE ?auto_32111 ) ( ON ?auto_32112 ?auto_32111 ) ( ON ?auto_32113 ?auto_32112 ) ( not ( = ?auto_32111 ?auto_32112 ) ) ( not ( = ?auto_32111 ?auto_32113 ) ) ( not ( = ?auto_32111 ?auto_32114 ) ) ( not ( = ?auto_32112 ?auto_32113 ) ) ( not ( = ?auto_32112 ?auto_32114 ) ) ( not ( = ?auto_32113 ?auto_32114 ) ) ( HOLDING ?auto_32115 ) ( not ( = ?auto_32111 ?auto_32115 ) ) ( not ( = ?auto_32112 ?auto_32115 ) ) ( not ( = ?auto_32113 ?auto_32115 ) ) ( not ( = ?auto_32114 ?auto_32115 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_32115 )
      ( MAKE-3PILE ?auto_32111 ?auto_32112 ?auto_32113 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32164 - BLOCK
      ?auto_32165 - BLOCK
    )
    :vars
    (
      ?auto_32166 - BLOCK
      ?auto_32168 - BLOCK
      ?auto_32167 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32164 ?auto_32165 ) ) ( ON ?auto_32165 ?auto_32166 ) ( not ( = ?auto_32164 ?auto_32166 ) ) ( not ( = ?auto_32165 ?auto_32166 ) ) ( ON ?auto_32164 ?auto_32165 ) ( CLEAR ?auto_32164 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32168 ) ( ON ?auto_32167 ?auto_32168 ) ( ON ?auto_32166 ?auto_32167 ) ( not ( = ?auto_32168 ?auto_32167 ) ) ( not ( = ?auto_32168 ?auto_32166 ) ) ( not ( = ?auto_32168 ?auto_32165 ) ) ( not ( = ?auto_32168 ?auto_32164 ) ) ( not ( = ?auto_32167 ?auto_32166 ) ) ( not ( = ?auto_32167 ?auto_32165 ) ) ( not ( = ?auto_32167 ?auto_32164 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32168 ?auto_32167 ?auto_32166 ?auto_32165 )
      ( MAKE-2PILE ?auto_32164 ?auto_32165 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32171 - BLOCK
      ?auto_32172 - BLOCK
    )
    :vars
    (
      ?auto_32173 - BLOCK
      ?auto_32174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32171 ?auto_32172 ) ) ( ON ?auto_32172 ?auto_32173 ) ( CLEAR ?auto_32172 ) ( not ( = ?auto_32171 ?auto_32173 ) ) ( not ( = ?auto_32172 ?auto_32173 ) ) ( ON ?auto_32171 ?auto_32174 ) ( CLEAR ?auto_32171 ) ( HAND-EMPTY ) ( not ( = ?auto_32171 ?auto_32174 ) ) ( not ( = ?auto_32172 ?auto_32174 ) ) ( not ( = ?auto_32173 ?auto_32174 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32171 ?auto_32174 )
      ( MAKE-2PILE ?auto_32171 ?auto_32172 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32175 - BLOCK
      ?auto_32176 - BLOCK
    )
    :vars
    (
      ?auto_32178 - BLOCK
      ?auto_32177 - BLOCK
      ?auto_32180 - BLOCK
      ?auto_32179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32175 ?auto_32176 ) ) ( not ( = ?auto_32175 ?auto_32178 ) ) ( not ( = ?auto_32176 ?auto_32178 ) ) ( ON ?auto_32175 ?auto_32177 ) ( CLEAR ?auto_32175 ) ( not ( = ?auto_32175 ?auto_32177 ) ) ( not ( = ?auto_32176 ?auto_32177 ) ) ( not ( = ?auto_32178 ?auto_32177 ) ) ( HOLDING ?auto_32176 ) ( CLEAR ?auto_32178 ) ( ON-TABLE ?auto_32180 ) ( ON ?auto_32179 ?auto_32180 ) ( ON ?auto_32178 ?auto_32179 ) ( not ( = ?auto_32180 ?auto_32179 ) ) ( not ( = ?auto_32180 ?auto_32178 ) ) ( not ( = ?auto_32180 ?auto_32176 ) ) ( not ( = ?auto_32179 ?auto_32178 ) ) ( not ( = ?auto_32179 ?auto_32176 ) ) ( not ( = ?auto_32175 ?auto_32180 ) ) ( not ( = ?auto_32175 ?auto_32179 ) ) ( not ( = ?auto_32177 ?auto_32180 ) ) ( not ( = ?auto_32177 ?auto_32179 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32180 ?auto_32179 ?auto_32178 ?auto_32176 )
      ( MAKE-2PILE ?auto_32175 ?auto_32176 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32181 - BLOCK
      ?auto_32182 - BLOCK
    )
    :vars
    (
      ?auto_32184 - BLOCK
      ?auto_32186 - BLOCK
      ?auto_32185 - BLOCK
      ?auto_32183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32181 ?auto_32182 ) ) ( not ( = ?auto_32181 ?auto_32184 ) ) ( not ( = ?auto_32182 ?auto_32184 ) ) ( ON ?auto_32181 ?auto_32186 ) ( not ( = ?auto_32181 ?auto_32186 ) ) ( not ( = ?auto_32182 ?auto_32186 ) ) ( not ( = ?auto_32184 ?auto_32186 ) ) ( CLEAR ?auto_32184 ) ( ON-TABLE ?auto_32185 ) ( ON ?auto_32183 ?auto_32185 ) ( ON ?auto_32184 ?auto_32183 ) ( not ( = ?auto_32185 ?auto_32183 ) ) ( not ( = ?auto_32185 ?auto_32184 ) ) ( not ( = ?auto_32185 ?auto_32182 ) ) ( not ( = ?auto_32183 ?auto_32184 ) ) ( not ( = ?auto_32183 ?auto_32182 ) ) ( not ( = ?auto_32181 ?auto_32185 ) ) ( not ( = ?auto_32181 ?auto_32183 ) ) ( not ( = ?auto_32186 ?auto_32185 ) ) ( not ( = ?auto_32186 ?auto_32183 ) ) ( ON ?auto_32182 ?auto_32181 ) ( CLEAR ?auto_32182 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32186 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32186 ?auto_32181 )
      ( MAKE-2PILE ?auto_32181 ?auto_32182 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32187 - BLOCK
      ?auto_32188 - BLOCK
    )
    :vars
    (
      ?auto_32192 - BLOCK
      ?auto_32191 - BLOCK
      ?auto_32189 - BLOCK
      ?auto_32190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32187 ?auto_32188 ) ) ( not ( = ?auto_32187 ?auto_32192 ) ) ( not ( = ?auto_32188 ?auto_32192 ) ) ( ON ?auto_32187 ?auto_32191 ) ( not ( = ?auto_32187 ?auto_32191 ) ) ( not ( = ?auto_32188 ?auto_32191 ) ) ( not ( = ?auto_32192 ?auto_32191 ) ) ( ON-TABLE ?auto_32189 ) ( ON ?auto_32190 ?auto_32189 ) ( not ( = ?auto_32189 ?auto_32190 ) ) ( not ( = ?auto_32189 ?auto_32192 ) ) ( not ( = ?auto_32189 ?auto_32188 ) ) ( not ( = ?auto_32190 ?auto_32192 ) ) ( not ( = ?auto_32190 ?auto_32188 ) ) ( not ( = ?auto_32187 ?auto_32189 ) ) ( not ( = ?auto_32187 ?auto_32190 ) ) ( not ( = ?auto_32191 ?auto_32189 ) ) ( not ( = ?auto_32191 ?auto_32190 ) ) ( ON ?auto_32188 ?auto_32187 ) ( CLEAR ?auto_32188 ) ( ON-TABLE ?auto_32191 ) ( HOLDING ?auto_32192 ) ( CLEAR ?auto_32190 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32189 ?auto_32190 ?auto_32192 )
      ( MAKE-2PILE ?auto_32187 ?auto_32188 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32193 - BLOCK
      ?auto_32194 - BLOCK
    )
    :vars
    (
      ?auto_32195 - BLOCK
      ?auto_32197 - BLOCK
      ?auto_32198 - BLOCK
      ?auto_32196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32193 ?auto_32194 ) ) ( not ( = ?auto_32193 ?auto_32195 ) ) ( not ( = ?auto_32194 ?auto_32195 ) ) ( ON ?auto_32193 ?auto_32197 ) ( not ( = ?auto_32193 ?auto_32197 ) ) ( not ( = ?auto_32194 ?auto_32197 ) ) ( not ( = ?auto_32195 ?auto_32197 ) ) ( ON-TABLE ?auto_32198 ) ( ON ?auto_32196 ?auto_32198 ) ( not ( = ?auto_32198 ?auto_32196 ) ) ( not ( = ?auto_32198 ?auto_32195 ) ) ( not ( = ?auto_32198 ?auto_32194 ) ) ( not ( = ?auto_32196 ?auto_32195 ) ) ( not ( = ?auto_32196 ?auto_32194 ) ) ( not ( = ?auto_32193 ?auto_32198 ) ) ( not ( = ?auto_32193 ?auto_32196 ) ) ( not ( = ?auto_32197 ?auto_32198 ) ) ( not ( = ?auto_32197 ?auto_32196 ) ) ( ON ?auto_32194 ?auto_32193 ) ( ON-TABLE ?auto_32197 ) ( CLEAR ?auto_32196 ) ( ON ?auto_32195 ?auto_32194 ) ( CLEAR ?auto_32195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32197 ?auto_32193 ?auto_32194 )
      ( MAKE-2PILE ?auto_32193 ?auto_32194 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32199 - BLOCK
      ?auto_32200 - BLOCK
    )
    :vars
    (
      ?auto_32202 - BLOCK
      ?auto_32201 - BLOCK
      ?auto_32204 - BLOCK
      ?auto_32203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32199 ?auto_32200 ) ) ( not ( = ?auto_32199 ?auto_32202 ) ) ( not ( = ?auto_32200 ?auto_32202 ) ) ( ON ?auto_32199 ?auto_32201 ) ( not ( = ?auto_32199 ?auto_32201 ) ) ( not ( = ?auto_32200 ?auto_32201 ) ) ( not ( = ?auto_32202 ?auto_32201 ) ) ( ON-TABLE ?auto_32204 ) ( not ( = ?auto_32204 ?auto_32203 ) ) ( not ( = ?auto_32204 ?auto_32202 ) ) ( not ( = ?auto_32204 ?auto_32200 ) ) ( not ( = ?auto_32203 ?auto_32202 ) ) ( not ( = ?auto_32203 ?auto_32200 ) ) ( not ( = ?auto_32199 ?auto_32204 ) ) ( not ( = ?auto_32199 ?auto_32203 ) ) ( not ( = ?auto_32201 ?auto_32204 ) ) ( not ( = ?auto_32201 ?auto_32203 ) ) ( ON ?auto_32200 ?auto_32199 ) ( ON-TABLE ?auto_32201 ) ( ON ?auto_32202 ?auto_32200 ) ( CLEAR ?auto_32202 ) ( HOLDING ?auto_32203 ) ( CLEAR ?auto_32204 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32204 ?auto_32203 )
      ( MAKE-2PILE ?auto_32199 ?auto_32200 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32205 - BLOCK
      ?auto_32206 - BLOCK
    )
    :vars
    (
      ?auto_32208 - BLOCK
      ?auto_32209 - BLOCK
      ?auto_32207 - BLOCK
      ?auto_32210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32205 ?auto_32206 ) ) ( not ( = ?auto_32205 ?auto_32208 ) ) ( not ( = ?auto_32206 ?auto_32208 ) ) ( ON ?auto_32205 ?auto_32209 ) ( not ( = ?auto_32205 ?auto_32209 ) ) ( not ( = ?auto_32206 ?auto_32209 ) ) ( not ( = ?auto_32208 ?auto_32209 ) ) ( ON-TABLE ?auto_32207 ) ( not ( = ?auto_32207 ?auto_32210 ) ) ( not ( = ?auto_32207 ?auto_32208 ) ) ( not ( = ?auto_32207 ?auto_32206 ) ) ( not ( = ?auto_32210 ?auto_32208 ) ) ( not ( = ?auto_32210 ?auto_32206 ) ) ( not ( = ?auto_32205 ?auto_32207 ) ) ( not ( = ?auto_32205 ?auto_32210 ) ) ( not ( = ?auto_32209 ?auto_32207 ) ) ( not ( = ?auto_32209 ?auto_32210 ) ) ( ON ?auto_32206 ?auto_32205 ) ( ON-TABLE ?auto_32209 ) ( ON ?auto_32208 ?auto_32206 ) ( CLEAR ?auto_32207 ) ( ON ?auto_32210 ?auto_32208 ) ( CLEAR ?auto_32210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32209 ?auto_32205 ?auto_32206 ?auto_32208 )
      ( MAKE-2PILE ?auto_32205 ?auto_32206 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32211 - BLOCK
      ?auto_32212 - BLOCK
    )
    :vars
    (
      ?auto_32215 - BLOCK
      ?auto_32213 - BLOCK
      ?auto_32214 - BLOCK
      ?auto_32216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32211 ?auto_32212 ) ) ( not ( = ?auto_32211 ?auto_32215 ) ) ( not ( = ?auto_32212 ?auto_32215 ) ) ( ON ?auto_32211 ?auto_32213 ) ( not ( = ?auto_32211 ?auto_32213 ) ) ( not ( = ?auto_32212 ?auto_32213 ) ) ( not ( = ?auto_32215 ?auto_32213 ) ) ( not ( = ?auto_32214 ?auto_32216 ) ) ( not ( = ?auto_32214 ?auto_32215 ) ) ( not ( = ?auto_32214 ?auto_32212 ) ) ( not ( = ?auto_32216 ?auto_32215 ) ) ( not ( = ?auto_32216 ?auto_32212 ) ) ( not ( = ?auto_32211 ?auto_32214 ) ) ( not ( = ?auto_32211 ?auto_32216 ) ) ( not ( = ?auto_32213 ?auto_32214 ) ) ( not ( = ?auto_32213 ?auto_32216 ) ) ( ON ?auto_32212 ?auto_32211 ) ( ON-TABLE ?auto_32213 ) ( ON ?auto_32215 ?auto_32212 ) ( ON ?auto_32216 ?auto_32215 ) ( CLEAR ?auto_32216 ) ( HOLDING ?auto_32214 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32214 )
      ( MAKE-2PILE ?auto_32211 ?auto_32212 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32217 - BLOCK
      ?auto_32218 - BLOCK
    )
    :vars
    (
      ?auto_32222 - BLOCK
      ?auto_32219 - BLOCK
      ?auto_32220 - BLOCK
      ?auto_32221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32217 ?auto_32218 ) ) ( not ( = ?auto_32217 ?auto_32222 ) ) ( not ( = ?auto_32218 ?auto_32222 ) ) ( ON ?auto_32217 ?auto_32219 ) ( not ( = ?auto_32217 ?auto_32219 ) ) ( not ( = ?auto_32218 ?auto_32219 ) ) ( not ( = ?auto_32222 ?auto_32219 ) ) ( not ( = ?auto_32220 ?auto_32221 ) ) ( not ( = ?auto_32220 ?auto_32222 ) ) ( not ( = ?auto_32220 ?auto_32218 ) ) ( not ( = ?auto_32221 ?auto_32222 ) ) ( not ( = ?auto_32221 ?auto_32218 ) ) ( not ( = ?auto_32217 ?auto_32220 ) ) ( not ( = ?auto_32217 ?auto_32221 ) ) ( not ( = ?auto_32219 ?auto_32220 ) ) ( not ( = ?auto_32219 ?auto_32221 ) ) ( ON ?auto_32218 ?auto_32217 ) ( ON-TABLE ?auto_32219 ) ( ON ?auto_32222 ?auto_32218 ) ( ON ?auto_32221 ?auto_32222 ) ( ON ?auto_32220 ?auto_32221 ) ( CLEAR ?auto_32220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32219 ?auto_32217 ?auto_32218 ?auto_32222 ?auto_32221 )
      ( MAKE-2PILE ?auto_32217 ?auto_32218 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32238 - BLOCK
      ?auto_32239 - BLOCK
    )
    :vars
    (
      ?auto_32240 - BLOCK
      ?auto_32241 - BLOCK
      ?auto_32242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32240 ?auto_32239 ) ( ON-TABLE ?auto_32238 ) ( ON ?auto_32239 ?auto_32238 ) ( not ( = ?auto_32238 ?auto_32239 ) ) ( not ( = ?auto_32238 ?auto_32240 ) ) ( not ( = ?auto_32239 ?auto_32240 ) ) ( not ( = ?auto_32238 ?auto_32241 ) ) ( not ( = ?auto_32238 ?auto_32242 ) ) ( not ( = ?auto_32239 ?auto_32241 ) ) ( not ( = ?auto_32239 ?auto_32242 ) ) ( not ( = ?auto_32240 ?auto_32241 ) ) ( not ( = ?auto_32240 ?auto_32242 ) ) ( not ( = ?auto_32241 ?auto_32242 ) ) ( ON ?auto_32241 ?auto_32240 ) ( CLEAR ?auto_32241 ) ( HOLDING ?auto_32242 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32242 )
      ( MAKE-2PILE ?auto_32238 ?auto_32239 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32285 - BLOCK
      ?auto_32286 - BLOCK
      ?auto_32287 - BLOCK
    )
    :vars
    (
      ?auto_32288 - BLOCK
      ?auto_32289 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32285 ) ( not ( = ?auto_32285 ?auto_32286 ) ) ( not ( = ?auto_32285 ?auto_32287 ) ) ( not ( = ?auto_32286 ?auto_32287 ) ) ( ON ?auto_32287 ?auto_32288 ) ( not ( = ?auto_32285 ?auto_32288 ) ) ( not ( = ?auto_32286 ?auto_32288 ) ) ( not ( = ?auto_32287 ?auto_32288 ) ) ( CLEAR ?auto_32285 ) ( ON ?auto_32286 ?auto_32287 ) ( CLEAR ?auto_32286 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32289 ) ( ON ?auto_32288 ?auto_32289 ) ( not ( = ?auto_32289 ?auto_32288 ) ) ( not ( = ?auto_32289 ?auto_32287 ) ) ( not ( = ?auto_32289 ?auto_32286 ) ) ( not ( = ?auto_32285 ?auto_32289 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32289 ?auto_32288 ?auto_32287 )
      ( MAKE-3PILE ?auto_32285 ?auto_32286 ?auto_32287 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32290 - BLOCK
      ?auto_32291 - BLOCK
      ?auto_32292 - BLOCK
    )
    :vars
    (
      ?auto_32293 - BLOCK
      ?auto_32294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32290 ?auto_32291 ) ) ( not ( = ?auto_32290 ?auto_32292 ) ) ( not ( = ?auto_32291 ?auto_32292 ) ) ( ON ?auto_32292 ?auto_32293 ) ( not ( = ?auto_32290 ?auto_32293 ) ) ( not ( = ?auto_32291 ?auto_32293 ) ) ( not ( = ?auto_32292 ?auto_32293 ) ) ( ON ?auto_32291 ?auto_32292 ) ( CLEAR ?auto_32291 ) ( ON-TABLE ?auto_32294 ) ( ON ?auto_32293 ?auto_32294 ) ( not ( = ?auto_32294 ?auto_32293 ) ) ( not ( = ?auto_32294 ?auto_32292 ) ) ( not ( = ?auto_32294 ?auto_32291 ) ) ( not ( = ?auto_32290 ?auto_32294 ) ) ( HOLDING ?auto_32290 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32290 )
      ( MAKE-3PILE ?auto_32290 ?auto_32291 ?auto_32292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32295 - BLOCK
      ?auto_32296 - BLOCK
      ?auto_32297 - BLOCK
    )
    :vars
    (
      ?auto_32298 - BLOCK
      ?auto_32299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32295 ?auto_32296 ) ) ( not ( = ?auto_32295 ?auto_32297 ) ) ( not ( = ?auto_32296 ?auto_32297 ) ) ( ON ?auto_32297 ?auto_32298 ) ( not ( = ?auto_32295 ?auto_32298 ) ) ( not ( = ?auto_32296 ?auto_32298 ) ) ( not ( = ?auto_32297 ?auto_32298 ) ) ( ON ?auto_32296 ?auto_32297 ) ( ON-TABLE ?auto_32299 ) ( ON ?auto_32298 ?auto_32299 ) ( not ( = ?auto_32299 ?auto_32298 ) ) ( not ( = ?auto_32299 ?auto_32297 ) ) ( not ( = ?auto_32299 ?auto_32296 ) ) ( not ( = ?auto_32295 ?auto_32299 ) ) ( ON ?auto_32295 ?auto_32296 ) ( CLEAR ?auto_32295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32299 ?auto_32298 ?auto_32297 ?auto_32296 )
      ( MAKE-3PILE ?auto_32295 ?auto_32296 ?auto_32297 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32303 - BLOCK
      ?auto_32304 - BLOCK
      ?auto_32305 - BLOCK
    )
    :vars
    (
      ?auto_32307 - BLOCK
      ?auto_32306 - BLOCK
      ?auto_32308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32303 ?auto_32304 ) ) ( not ( = ?auto_32303 ?auto_32305 ) ) ( not ( = ?auto_32304 ?auto_32305 ) ) ( ON ?auto_32305 ?auto_32307 ) ( not ( = ?auto_32303 ?auto_32307 ) ) ( not ( = ?auto_32304 ?auto_32307 ) ) ( not ( = ?auto_32305 ?auto_32307 ) ) ( ON ?auto_32304 ?auto_32305 ) ( CLEAR ?auto_32304 ) ( ON-TABLE ?auto_32306 ) ( ON ?auto_32307 ?auto_32306 ) ( not ( = ?auto_32306 ?auto_32307 ) ) ( not ( = ?auto_32306 ?auto_32305 ) ) ( not ( = ?auto_32306 ?auto_32304 ) ) ( not ( = ?auto_32303 ?auto_32306 ) ) ( ON ?auto_32303 ?auto_32308 ) ( CLEAR ?auto_32303 ) ( HAND-EMPTY ) ( not ( = ?auto_32303 ?auto_32308 ) ) ( not ( = ?auto_32304 ?auto_32308 ) ) ( not ( = ?auto_32305 ?auto_32308 ) ) ( not ( = ?auto_32307 ?auto_32308 ) ) ( not ( = ?auto_32306 ?auto_32308 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32303 ?auto_32308 )
      ( MAKE-3PILE ?auto_32303 ?auto_32304 ?auto_32305 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32309 - BLOCK
      ?auto_32310 - BLOCK
      ?auto_32311 - BLOCK
    )
    :vars
    (
      ?auto_32312 - BLOCK
      ?auto_32313 - BLOCK
      ?auto_32314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32309 ?auto_32310 ) ) ( not ( = ?auto_32309 ?auto_32311 ) ) ( not ( = ?auto_32310 ?auto_32311 ) ) ( ON ?auto_32311 ?auto_32312 ) ( not ( = ?auto_32309 ?auto_32312 ) ) ( not ( = ?auto_32310 ?auto_32312 ) ) ( not ( = ?auto_32311 ?auto_32312 ) ) ( ON-TABLE ?auto_32313 ) ( ON ?auto_32312 ?auto_32313 ) ( not ( = ?auto_32313 ?auto_32312 ) ) ( not ( = ?auto_32313 ?auto_32311 ) ) ( not ( = ?auto_32313 ?auto_32310 ) ) ( not ( = ?auto_32309 ?auto_32313 ) ) ( ON ?auto_32309 ?auto_32314 ) ( CLEAR ?auto_32309 ) ( not ( = ?auto_32309 ?auto_32314 ) ) ( not ( = ?auto_32310 ?auto_32314 ) ) ( not ( = ?auto_32311 ?auto_32314 ) ) ( not ( = ?auto_32312 ?auto_32314 ) ) ( not ( = ?auto_32313 ?auto_32314 ) ) ( HOLDING ?auto_32310 ) ( CLEAR ?auto_32311 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32313 ?auto_32312 ?auto_32311 ?auto_32310 )
      ( MAKE-3PILE ?auto_32309 ?auto_32310 ?auto_32311 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32315 - BLOCK
      ?auto_32316 - BLOCK
      ?auto_32317 - BLOCK
    )
    :vars
    (
      ?auto_32318 - BLOCK
      ?auto_32319 - BLOCK
      ?auto_32320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32315 ?auto_32316 ) ) ( not ( = ?auto_32315 ?auto_32317 ) ) ( not ( = ?auto_32316 ?auto_32317 ) ) ( ON ?auto_32317 ?auto_32318 ) ( not ( = ?auto_32315 ?auto_32318 ) ) ( not ( = ?auto_32316 ?auto_32318 ) ) ( not ( = ?auto_32317 ?auto_32318 ) ) ( ON-TABLE ?auto_32319 ) ( ON ?auto_32318 ?auto_32319 ) ( not ( = ?auto_32319 ?auto_32318 ) ) ( not ( = ?auto_32319 ?auto_32317 ) ) ( not ( = ?auto_32319 ?auto_32316 ) ) ( not ( = ?auto_32315 ?auto_32319 ) ) ( ON ?auto_32315 ?auto_32320 ) ( not ( = ?auto_32315 ?auto_32320 ) ) ( not ( = ?auto_32316 ?auto_32320 ) ) ( not ( = ?auto_32317 ?auto_32320 ) ) ( not ( = ?auto_32318 ?auto_32320 ) ) ( not ( = ?auto_32319 ?auto_32320 ) ) ( CLEAR ?auto_32317 ) ( ON ?auto_32316 ?auto_32315 ) ( CLEAR ?auto_32316 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32320 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32320 ?auto_32315 )
      ( MAKE-3PILE ?auto_32315 ?auto_32316 ?auto_32317 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32321 - BLOCK
      ?auto_32322 - BLOCK
      ?auto_32323 - BLOCK
    )
    :vars
    (
      ?auto_32326 - BLOCK
      ?auto_32325 - BLOCK
      ?auto_32324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32321 ?auto_32322 ) ) ( not ( = ?auto_32321 ?auto_32323 ) ) ( not ( = ?auto_32322 ?auto_32323 ) ) ( not ( = ?auto_32321 ?auto_32326 ) ) ( not ( = ?auto_32322 ?auto_32326 ) ) ( not ( = ?auto_32323 ?auto_32326 ) ) ( ON-TABLE ?auto_32325 ) ( ON ?auto_32326 ?auto_32325 ) ( not ( = ?auto_32325 ?auto_32326 ) ) ( not ( = ?auto_32325 ?auto_32323 ) ) ( not ( = ?auto_32325 ?auto_32322 ) ) ( not ( = ?auto_32321 ?auto_32325 ) ) ( ON ?auto_32321 ?auto_32324 ) ( not ( = ?auto_32321 ?auto_32324 ) ) ( not ( = ?auto_32322 ?auto_32324 ) ) ( not ( = ?auto_32323 ?auto_32324 ) ) ( not ( = ?auto_32326 ?auto_32324 ) ) ( not ( = ?auto_32325 ?auto_32324 ) ) ( ON ?auto_32322 ?auto_32321 ) ( CLEAR ?auto_32322 ) ( ON-TABLE ?auto_32324 ) ( HOLDING ?auto_32323 ) ( CLEAR ?auto_32326 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32325 ?auto_32326 ?auto_32323 )
      ( MAKE-3PILE ?auto_32321 ?auto_32322 ?auto_32323 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32327 - BLOCK
      ?auto_32328 - BLOCK
      ?auto_32329 - BLOCK
    )
    :vars
    (
      ?auto_32331 - BLOCK
      ?auto_32332 - BLOCK
      ?auto_32330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32327 ?auto_32328 ) ) ( not ( = ?auto_32327 ?auto_32329 ) ) ( not ( = ?auto_32328 ?auto_32329 ) ) ( not ( = ?auto_32327 ?auto_32331 ) ) ( not ( = ?auto_32328 ?auto_32331 ) ) ( not ( = ?auto_32329 ?auto_32331 ) ) ( ON-TABLE ?auto_32332 ) ( ON ?auto_32331 ?auto_32332 ) ( not ( = ?auto_32332 ?auto_32331 ) ) ( not ( = ?auto_32332 ?auto_32329 ) ) ( not ( = ?auto_32332 ?auto_32328 ) ) ( not ( = ?auto_32327 ?auto_32332 ) ) ( ON ?auto_32327 ?auto_32330 ) ( not ( = ?auto_32327 ?auto_32330 ) ) ( not ( = ?auto_32328 ?auto_32330 ) ) ( not ( = ?auto_32329 ?auto_32330 ) ) ( not ( = ?auto_32331 ?auto_32330 ) ) ( not ( = ?auto_32332 ?auto_32330 ) ) ( ON ?auto_32328 ?auto_32327 ) ( ON-TABLE ?auto_32330 ) ( CLEAR ?auto_32331 ) ( ON ?auto_32329 ?auto_32328 ) ( CLEAR ?auto_32329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32330 ?auto_32327 ?auto_32328 )
      ( MAKE-3PILE ?auto_32327 ?auto_32328 ?auto_32329 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32333 - BLOCK
      ?auto_32334 - BLOCK
      ?auto_32335 - BLOCK
    )
    :vars
    (
      ?auto_32337 - BLOCK
      ?auto_32338 - BLOCK
      ?auto_32336 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32333 ?auto_32334 ) ) ( not ( = ?auto_32333 ?auto_32335 ) ) ( not ( = ?auto_32334 ?auto_32335 ) ) ( not ( = ?auto_32333 ?auto_32337 ) ) ( not ( = ?auto_32334 ?auto_32337 ) ) ( not ( = ?auto_32335 ?auto_32337 ) ) ( ON-TABLE ?auto_32338 ) ( not ( = ?auto_32338 ?auto_32337 ) ) ( not ( = ?auto_32338 ?auto_32335 ) ) ( not ( = ?auto_32338 ?auto_32334 ) ) ( not ( = ?auto_32333 ?auto_32338 ) ) ( ON ?auto_32333 ?auto_32336 ) ( not ( = ?auto_32333 ?auto_32336 ) ) ( not ( = ?auto_32334 ?auto_32336 ) ) ( not ( = ?auto_32335 ?auto_32336 ) ) ( not ( = ?auto_32337 ?auto_32336 ) ) ( not ( = ?auto_32338 ?auto_32336 ) ) ( ON ?auto_32334 ?auto_32333 ) ( ON-TABLE ?auto_32336 ) ( ON ?auto_32335 ?auto_32334 ) ( CLEAR ?auto_32335 ) ( HOLDING ?auto_32337 ) ( CLEAR ?auto_32338 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32338 ?auto_32337 )
      ( MAKE-3PILE ?auto_32333 ?auto_32334 ?auto_32335 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32339 - BLOCK
      ?auto_32340 - BLOCK
      ?auto_32341 - BLOCK
    )
    :vars
    (
      ?auto_32343 - BLOCK
      ?auto_32344 - BLOCK
      ?auto_32342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32339 ?auto_32340 ) ) ( not ( = ?auto_32339 ?auto_32341 ) ) ( not ( = ?auto_32340 ?auto_32341 ) ) ( not ( = ?auto_32339 ?auto_32343 ) ) ( not ( = ?auto_32340 ?auto_32343 ) ) ( not ( = ?auto_32341 ?auto_32343 ) ) ( ON-TABLE ?auto_32344 ) ( not ( = ?auto_32344 ?auto_32343 ) ) ( not ( = ?auto_32344 ?auto_32341 ) ) ( not ( = ?auto_32344 ?auto_32340 ) ) ( not ( = ?auto_32339 ?auto_32344 ) ) ( ON ?auto_32339 ?auto_32342 ) ( not ( = ?auto_32339 ?auto_32342 ) ) ( not ( = ?auto_32340 ?auto_32342 ) ) ( not ( = ?auto_32341 ?auto_32342 ) ) ( not ( = ?auto_32343 ?auto_32342 ) ) ( not ( = ?auto_32344 ?auto_32342 ) ) ( ON ?auto_32340 ?auto_32339 ) ( ON-TABLE ?auto_32342 ) ( ON ?auto_32341 ?auto_32340 ) ( CLEAR ?auto_32344 ) ( ON ?auto_32343 ?auto_32341 ) ( CLEAR ?auto_32343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32342 ?auto_32339 ?auto_32340 ?auto_32341 )
      ( MAKE-3PILE ?auto_32339 ?auto_32340 ?auto_32341 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32345 - BLOCK
      ?auto_32346 - BLOCK
      ?auto_32347 - BLOCK
    )
    :vars
    (
      ?auto_32348 - BLOCK
      ?auto_32350 - BLOCK
      ?auto_32349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32345 ?auto_32346 ) ) ( not ( = ?auto_32345 ?auto_32347 ) ) ( not ( = ?auto_32346 ?auto_32347 ) ) ( not ( = ?auto_32345 ?auto_32348 ) ) ( not ( = ?auto_32346 ?auto_32348 ) ) ( not ( = ?auto_32347 ?auto_32348 ) ) ( not ( = ?auto_32350 ?auto_32348 ) ) ( not ( = ?auto_32350 ?auto_32347 ) ) ( not ( = ?auto_32350 ?auto_32346 ) ) ( not ( = ?auto_32345 ?auto_32350 ) ) ( ON ?auto_32345 ?auto_32349 ) ( not ( = ?auto_32345 ?auto_32349 ) ) ( not ( = ?auto_32346 ?auto_32349 ) ) ( not ( = ?auto_32347 ?auto_32349 ) ) ( not ( = ?auto_32348 ?auto_32349 ) ) ( not ( = ?auto_32350 ?auto_32349 ) ) ( ON ?auto_32346 ?auto_32345 ) ( ON-TABLE ?auto_32349 ) ( ON ?auto_32347 ?auto_32346 ) ( ON ?auto_32348 ?auto_32347 ) ( CLEAR ?auto_32348 ) ( HOLDING ?auto_32350 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32350 )
      ( MAKE-3PILE ?auto_32345 ?auto_32346 ?auto_32347 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32351 - BLOCK
      ?auto_32352 - BLOCK
      ?auto_32353 - BLOCK
    )
    :vars
    (
      ?auto_32356 - BLOCK
      ?auto_32354 - BLOCK
      ?auto_32355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32351 ?auto_32352 ) ) ( not ( = ?auto_32351 ?auto_32353 ) ) ( not ( = ?auto_32352 ?auto_32353 ) ) ( not ( = ?auto_32351 ?auto_32356 ) ) ( not ( = ?auto_32352 ?auto_32356 ) ) ( not ( = ?auto_32353 ?auto_32356 ) ) ( not ( = ?auto_32354 ?auto_32356 ) ) ( not ( = ?auto_32354 ?auto_32353 ) ) ( not ( = ?auto_32354 ?auto_32352 ) ) ( not ( = ?auto_32351 ?auto_32354 ) ) ( ON ?auto_32351 ?auto_32355 ) ( not ( = ?auto_32351 ?auto_32355 ) ) ( not ( = ?auto_32352 ?auto_32355 ) ) ( not ( = ?auto_32353 ?auto_32355 ) ) ( not ( = ?auto_32356 ?auto_32355 ) ) ( not ( = ?auto_32354 ?auto_32355 ) ) ( ON ?auto_32352 ?auto_32351 ) ( ON-TABLE ?auto_32355 ) ( ON ?auto_32353 ?auto_32352 ) ( ON ?auto_32356 ?auto_32353 ) ( ON ?auto_32354 ?auto_32356 ) ( CLEAR ?auto_32354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32355 ?auto_32351 ?auto_32352 ?auto_32353 ?auto_32356 )
      ( MAKE-3PILE ?auto_32351 ?auto_32352 ?auto_32353 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32368 - BLOCK
    )
    :vars
    (
      ?auto_32371 - BLOCK
      ?auto_32370 - BLOCK
      ?auto_32369 - BLOCK
      ?auto_32372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32371 ?auto_32368 ) ( ON-TABLE ?auto_32368 ) ( not ( = ?auto_32368 ?auto_32371 ) ) ( not ( = ?auto_32368 ?auto_32370 ) ) ( not ( = ?auto_32368 ?auto_32369 ) ) ( not ( = ?auto_32371 ?auto_32370 ) ) ( not ( = ?auto_32371 ?auto_32369 ) ) ( not ( = ?auto_32370 ?auto_32369 ) ) ( ON ?auto_32370 ?auto_32371 ) ( CLEAR ?auto_32370 ) ( HOLDING ?auto_32369 ) ( CLEAR ?auto_32372 ) ( ON-TABLE ?auto_32372 ) ( not ( = ?auto_32372 ?auto_32369 ) ) ( not ( = ?auto_32368 ?auto_32372 ) ) ( not ( = ?auto_32371 ?auto_32372 ) ) ( not ( = ?auto_32370 ?auto_32372 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32372 ?auto_32369 )
      ( MAKE-1PILE ?auto_32368 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32373 - BLOCK
    )
    :vars
    (
      ?auto_32376 - BLOCK
      ?auto_32375 - BLOCK
      ?auto_32377 - BLOCK
      ?auto_32374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32376 ?auto_32373 ) ( ON-TABLE ?auto_32373 ) ( not ( = ?auto_32373 ?auto_32376 ) ) ( not ( = ?auto_32373 ?auto_32375 ) ) ( not ( = ?auto_32373 ?auto_32377 ) ) ( not ( = ?auto_32376 ?auto_32375 ) ) ( not ( = ?auto_32376 ?auto_32377 ) ) ( not ( = ?auto_32375 ?auto_32377 ) ) ( ON ?auto_32375 ?auto_32376 ) ( CLEAR ?auto_32374 ) ( ON-TABLE ?auto_32374 ) ( not ( = ?auto_32374 ?auto_32377 ) ) ( not ( = ?auto_32373 ?auto_32374 ) ) ( not ( = ?auto_32376 ?auto_32374 ) ) ( not ( = ?auto_32375 ?auto_32374 ) ) ( ON ?auto_32377 ?auto_32375 ) ( CLEAR ?auto_32377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32373 ?auto_32376 ?auto_32375 )
      ( MAKE-1PILE ?auto_32373 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32378 - BLOCK
    )
    :vars
    (
      ?auto_32381 - BLOCK
      ?auto_32379 - BLOCK
      ?auto_32382 - BLOCK
      ?auto_32380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32381 ?auto_32378 ) ( ON-TABLE ?auto_32378 ) ( not ( = ?auto_32378 ?auto_32381 ) ) ( not ( = ?auto_32378 ?auto_32379 ) ) ( not ( = ?auto_32378 ?auto_32382 ) ) ( not ( = ?auto_32381 ?auto_32379 ) ) ( not ( = ?auto_32381 ?auto_32382 ) ) ( not ( = ?auto_32379 ?auto_32382 ) ) ( ON ?auto_32379 ?auto_32381 ) ( not ( = ?auto_32380 ?auto_32382 ) ) ( not ( = ?auto_32378 ?auto_32380 ) ) ( not ( = ?auto_32381 ?auto_32380 ) ) ( not ( = ?auto_32379 ?auto_32380 ) ) ( ON ?auto_32382 ?auto_32379 ) ( CLEAR ?auto_32382 ) ( HOLDING ?auto_32380 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32380 )
      ( MAKE-1PILE ?auto_32378 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32389 - BLOCK
    )
    :vars
    (
      ?auto_32391 - BLOCK
      ?auto_32390 - BLOCK
      ?auto_32393 - BLOCK
      ?auto_32392 - BLOCK
      ?auto_32394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32391 ?auto_32389 ) ( ON-TABLE ?auto_32389 ) ( not ( = ?auto_32389 ?auto_32391 ) ) ( not ( = ?auto_32389 ?auto_32390 ) ) ( not ( = ?auto_32389 ?auto_32393 ) ) ( not ( = ?auto_32391 ?auto_32390 ) ) ( not ( = ?auto_32391 ?auto_32393 ) ) ( not ( = ?auto_32390 ?auto_32393 ) ) ( ON ?auto_32390 ?auto_32391 ) ( not ( = ?auto_32392 ?auto_32393 ) ) ( not ( = ?auto_32389 ?auto_32392 ) ) ( not ( = ?auto_32391 ?auto_32392 ) ) ( not ( = ?auto_32390 ?auto_32392 ) ) ( ON ?auto_32393 ?auto_32390 ) ( CLEAR ?auto_32393 ) ( ON ?auto_32392 ?auto_32394 ) ( CLEAR ?auto_32392 ) ( HAND-EMPTY ) ( not ( = ?auto_32389 ?auto_32394 ) ) ( not ( = ?auto_32391 ?auto_32394 ) ) ( not ( = ?auto_32390 ?auto_32394 ) ) ( not ( = ?auto_32393 ?auto_32394 ) ) ( not ( = ?auto_32392 ?auto_32394 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32392 ?auto_32394 )
      ( MAKE-1PILE ?auto_32389 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32395 - BLOCK
    )
    :vars
    (
      ?auto_32398 - BLOCK
      ?auto_32396 - BLOCK
      ?auto_32397 - BLOCK
      ?auto_32399 - BLOCK
      ?auto_32400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32398 ?auto_32395 ) ( ON-TABLE ?auto_32395 ) ( not ( = ?auto_32395 ?auto_32398 ) ) ( not ( = ?auto_32395 ?auto_32396 ) ) ( not ( = ?auto_32395 ?auto_32397 ) ) ( not ( = ?auto_32398 ?auto_32396 ) ) ( not ( = ?auto_32398 ?auto_32397 ) ) ( not ( = ?auto_32396 ?auto_32397 ) ) ( ON ?auto_32396 ?auto_32398 ) ( not ( = ?auto_32399 ?auto_32397 ) ) ( not ( = ?auto_32395 ?auto_32399 ) ) ( not ( = ?auto_32398 ?auto_32399 ) ) ( not ( = ?auto_32396 ?auto_32399 ) ) ( ON ?auto_32399 ?auto_32400 ) ( CLEAR ?auto_32399 ) ( not ( = ?auto_32395 ?auto_32400 ) ) ( not ( = ?auto_32398 ?auto_32400 ) ) ( not ( = ?auto_32396 ?auto_32400 ) ) ( not ( = ?auto_32397 ?auto_32400 ) ) ( not ( = ?auto_32399 ?auto_32400 ) ) ( HOLDING ?auto_32397 ) ( CLEAR ?auto_32396 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32395 ?auto_32398 ?auto_32396 ?auto_32397 )
      ( MAKE-1PILE ?auto_32395 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32429 - BLOCK
      ?auto_32430 - BLOCK
      ?auto_32431 - BLOCK
      ?auto_32432 - BLOCK
    )
    :vars
    (
      ?auto_32433 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32429 ) ( ON ?auto_32430 ?auto_32429 ) ( not ( = ?auto_32429 ?auto_32430 ) ) ( not ( = ?auto_32429 ?auto_32431 ) ) ( not ( = ?auto_32429 ?auto_32432 ) ) ( not ( = ?auto_32430 ?auto_32431 ) ) ( not ( = ?auto_32430 ?auto_32432 ) ) ( not ( = ?auto_32431 ?auto_32432 ) ) ( ON ?auto_32432 ?auto_32433 ) ( not ( = ?auto_32429 ?auto_32433 ) ) ( not ( = ?auto_32430 ?auto_32433 ) ) ( not ( = ?auto_32431 ?auto_32433 ) ) ( not ( = ?auto_32432 ?auto_32433 ) ) ( CLEAR ?auto_32430 ) ( ON ?auto_32431 ?auto_32432 ) ( CLEAR ?auto_32431 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32433 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32433 ?auto_32432 )
      ( MAKE-4PILE ?auto_32429 ?auto_32430 ?auto_32431 ?auto_32432 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32434 - BLOCK
      ?auto_32435 - BLOCK
      ?auto_32436 - BLOCK
      ?auto_32437 - BLOCK
    )
    :vars
    (
      ?auto_32438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32434 ) ( not ( = ?auto_32434 ?auto_32435 ) ) ( not ( = ?auto_32434 ?auto_32436 ) ) ( not ( = ?auto_32434 ?auto_32437 ) ) ( not ( = ?auto_32435 ?auto_32436 ) ) ( not ( = ?auto_32435 ?auto_32437 ) ) ( not ( = ?auto_32436 ?auto_32437 ) ) ( ON ?auto_32437 ?auto_32438 ) ( not ( = ?auto_32434 ?auto_32438 ) ) ( not ( = ?auto_32435 ?auto_32438 ) ) ( not ( = ?auto_32436 ?auto_32438 ) ) ( not ( = ?auto_32437 ?auto_32438 ) ) ( ON ?auto_32436 ?auto_32437 ) ( CLEAR ?auto_32436 ) ( ON-TABLE ?auto_32438 ) ( HOLDING ?auto_32435 ) ( CLEAR ?auto_32434 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32434 ?auto_32435 )
      ( MAKE-4PILE ?auto_32434 ?auto_32435 ?auto_32436 ?auto_32437 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32439 - BLOCK
      ?auto_32440 - BLOCK
      ?auto_32441 - BLOCK
      ?auto_32442 - BLOCK
    )
    :vars
    (
      ?auto_32443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32439 ) ( not ( = ?auto_32439 ?auto_32440 ) ) ( not ( = ?auto_32439 ?auto_32441 ) ) ( not ( = ?auto_32439 ?auto_32442 ) ) ( not ( = ?auto_32440 ?auto_32441 ) ) ( not ( = ?auto_32440 ?auto_32442 ) ) ( not ( = ?auto_32441 ?auto_32442 ) ) ( ON ?auto_32442 ?auto_32443 ) ( not ( = ?auto_32439 ?auto_32443 ) ) ( not ( = ?auto_32440 ?auto_32443 ) ) ( not ( = ?auto_32441 ?auto_32443 ) ) ( not ( = ?auto_32442 ?auto_32443 ) ) ( ON ?auto_32441 ?auto_32442 ) ( ON-TABLE ?auto_32443 ) ( CLEAR ?auto_32439 ) ( ON ?auto_32440 ?auto_32441 ) ( CLEAR ?auto_32440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32443 ?auto_32442 ?auto_32441 )
      ( MAKE-4PILE ?auto_32439 ?auto_32440 ?auto_32441 ?auto_32442 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32444 - BLOCK
      ?auto_32445 - BLOCK
      ?auto_32446 - BLOCK
      ?auto_32447 - BLOCK
    )
    :vars
    (
      ?auto_32448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32444 ?auto_32445 ) ) ( not ( = ?auto_32444 ?auto_32446 ) ) ( not ( = ?auto_32444 ?auto_32447 ) ) ( not ( = ?auto_32445 ?auto_32446 ) ) ( not ( = ?auto_32445 ?auto_32447 ) ) ( not ( = ?auto_32446 ?auto_32447 ) ) ( ON ?auto_32447 ?auto_32448 ) ( not ( = ?auto_32444 ?auto_32448 ) ) ( not ( = ?auto_32445 ?auto_32448 ) ) ( not ( = ?auto_32446 ?auto_32448 ) ) ( not ( = ?auto_32447 ?auto_32448 ) ) ( ON ?auto_32446 ?auto_32447 ) ( ON-TABLE ?auto_32448 ) ( ON ?auto_32445 ?auto_32446 ) ( CLEAR ?auto_32445 ) ( HOLDING ?auto_32444 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32444 )
      ( MAKE-4PILE ?auto_32444 ?auto_32445 ?auto_32446 ?auto_32447 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32449 - BLOCK
      ?auto_32450 - BLOCK
      ?auto_32451 - BLOCK
      ?auto_32452 - BLOCK
    )
    :vars
    (
      ?auto_32453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32449 ?auto_32450 ) ) ( not ( = ?auto_32449 ?auto_32451 ) ) ( not ( = ?auto_32449 ?auto_32452 ) ) ( not ( = ?auto_32450 ?auto_32451 ) ) ( not ( = ?auto_32450 ?auto_32452 ) ) ( not ( = ?auto_32451 ?auto_32452 ) ) ( ON ?auto_32452 ?auto_32453 ) ( not ( = ?auto_32449 ?auto_32453 ) ) ( not ( = ?auto_32450 ?auto_32453 ) ) ( not ( = ?auto_32451 ?auto_32453 ) ) ( not ( = ?auto_32452 ?auto_32453 ) ) ( ON ?auto_32451 ?auto_32452 ) ( ON-TABLE ?auto_32453 ) ( ON ?auto_32450 ?auto_32451 ) ( ON ?auto_32449 ?auto_32450 ) ( CLEAR ?auto_32449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32453 ?auto_32452 ?auto_32451 ?auto_32450 )
      ( MAKE-4PILE ?auto_32449 ?auto_32450 ?auto_32451 ?auto_32452 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32458 - BLOCK
      ?auto_32459 - BLOCK
      ?auto_32460 - BLOCK
      ?auto_32461 - BLOCK
    )
    :vars
    (
      ?auto_32462 - BLOCK
      ?auto_32463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32458 ?auto_32459 ) ) ( not ( = ?auto_32458 ?auto_32460 ) ) ( not ( = ?auto_32458 ?auto_32461 ) ) ( not ( = ?auto_32459 ?auto_32460 ) ) ( not ( = ?auto_32459 ?auto_32461 ) ) ( not ( = ?auto_32460 ?auto_32461 ) ) ( ON ?auto_32461 ?auto_32462 ) ( not ( = ?auto_32458 ?auto_32462 ) ) ( not ( = ?auto_32459 ?auto_32462 ) ) ( not ( = ?auto_32460 ?auto_32462 ) ) ( not ( = ?auto_32461 ?auto_32462 ) ) ( ON ?auto_32460 ?auto_32461 ) ( ON-TABLE ?auto_32462 ) ( ON ?auto_32459 ?auto_32460 ) ( CLEAR ?auto_32459 ) ( ON ?auto_32458 ?auto_32463 ) ( CLEAR ?auto_32458 ) ( HAND-EMPTY ) ( not ( = ?auto_32458 ?auto_32463 ) ) ( not ( = ?auto_32459 ?auto_32463 ) ) ( not ( = ?auto_32460 ?auto_32463 ) ) ( not ( = ?auto_32461 ?auto_32463 ) ) ( not ( = ?auto_32462 ?auto_32463 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32458 ?auto_32463 )
      ( MAKE-4PILE ?auto_32458 ?auto_32459 ?auto_32460 ?auto_32461 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32464 - BLOCK
      ?auto_32465 - BLOCK
      ?auto_32466 - BLOCK
      ?auto_32467 - BLOCK
    )
    :vars
    (
      ?auto_32468 - BLOCK
      ?auto_32469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32464 ?auto_32465 ) ) ( not ( = ?auto_32464 ?auto_32466 ) ) ( not ( = ?auto_32464 ?auto_32467 ) ) ( not ( = ?auto_32465 ?auto_32466 ) ) ( not ( = ?auto_32465 ?auto_32467 ) ) ( not ( = ?auto_32466 ?auto_32467 ) ) ( ON ?auto_32467 ?auto_32468 ) ( not ( = ?auto_32464 ?auto_32468 ) ) ( not ( = ?auto_32465 ?auto_32468 ) ) ( not ( = ?auto_32466 ?auto_32468 ) ) ( not ( = ?auto_32467 ?auto_32468 ) ) ( ON ?auto_32466 ?auto_32467 ) ( ON-TABLE ?auto_32468 ) ( ON ?auto_32464 ?auto_32469 ) ( CLEAR ?auto_32464 ) ( not ( = ?auto_32464 ?auto_32469 ) ) ( not ( = ?auto_32465 ?auto_32469 ) ) ( not ( = ?auto_32466 ?auto_32469 ) ) ( not ( = ?auto_32467 ?auto_32469 ) ) ( not ( = ?auto_32468 ?auto_32469 ) ) ( HOLDING ?auto_32465 ) ( CLEAR ?auto_32466 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32468 ?auto_32467 ?auto_32466 ?auto_32465 )
      ( MAKE-4PILE ?auto_32464 ?auto_32465 ?auto_32466 ?auto_32467 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32470 - BLOCK
      ?auto_32471 - BLOCK
      ?auto_32472 - BLOCK
      ?auto_32473 - BLOCK
    )
    :vars
    (
      ?auto_32475 - BLOCK
      ?auto_32474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32470 ?auto_32471 ) ) ( not ( = ?auto_32470 ?auto_32472 ) ) ( not ( = ?auto_32470 ?auto_32473 ) ) ( not ( = ?auto_32471 ?auto_32472 ) ) ( not ( = ?auto_32471 ?auto_32473 ) ) ( not ( = ?auto_32472 ?auto_32473 ) ) ( ON ?auto_32473 ?auto_32475 ) ( not ( = ?auto_32470 ?auto_32475 ) ) ( not ( = ?auto_32471 ?auto_32475 ) ) ( not ( = ?auto_32472 ?auto_32475 ) ) ( not ( = ?auto_32473 ?auto_32475 ) ) ( ON ?auto_32472 ?auto_32473 ) ( ON-TABLE ?auto_32475 ) ( ON ?auto_32470 ?auto_32474 ) ( not ( = ?auto_32470 ?auto_32474 ) ) ( not ( = ?auto_32471 ?auto_32474 ) ) ( not ( = ?auto_32472 ?auto_32474 ) ) ( not ( = ?auto_32473 ?auto_32474 ) ) ( not ( = ?auto_32475 ?auto_32474 ) ) ( CLEAR ?auto_32472 ) ( ON ?auto_32471 ?auto_32470 ) ( CLEAR ?auto_32471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32474 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32474 ?auto_32470 )
      ( MAKE-4PILE ?auto_32470 ?auto_32471 ?auto_32472 ?auto_32473 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32476 - BLOCK
      ?auto_32477 - BLOCK
      ?auto_32478 - BLOCK
      ?auto_32479 - BLOCK
    )
    :vars
    (
      ?auto_32481 - BLOCK
      ?auto_32480 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32476 ?auto_32477 ) ) ( not ( = ?auto_32476 ?auto_32478 ) ) ( not ( = ?auto_32476 ?auto_32479 ) ) ( not ( = ?auto_32477 ?auto_32478 ) ) ( not ( = ?auto_32477 ?auto_32479 ) ) ( not ( = ?auto_32478 ?auto_32479 ) ) ( ON ?auto_32479 ?auto_32481 ) ( not ( = ?auto_32476 ?auto_32481 ) ) ( not ( = ?auto_32477 ?auto_32481 ) ) ( not ( = ?auto_32478 ?auto_32481 ) ) ( not ( = ?auto_32479 ?auto_32481 ) ) ( ON-TABLE ?auto_32481 ) ( ON ?auto_32476 ?auto_32480 ) ( not ( = ?auto_32476 ?auto_32480 ) ) ( not ( = ?auto_32477 ?auto_32480 ) ) ( not ( = ?auto_32478 ?auto_32480 ) ) ( not ( = ?auto_32479 ?auto_32480 ) ) ( not ( = ?auto_32481 ?auto_32480 ) ) ( ON ?auto_32477 ?auto_32476 ) ( CLEAR ?auto_32477 ) ( ON-TABLE ?auto_32480 ) ( HOLDING ?auto_32478 ) ( CLEAR ?auto_32479 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32481 ?auto_32479 ?auto_32478 )
      ( MAKE-4PILE ?auto_32476 ?auto_32477 ?auto_32478 ?auto_32479 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32482 - BLOCK
      ?auto_32483 - BLOCK
      ?auto_32484 - BLOCK
      ?auto_32485 - BLOCK
    )
    :vars
    (
      ?auto_32486 - BLOCK
      ?auto_32487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32482 ?auto_32483 ) ) ( not ( = ?auto_32482 ?auto_32484 ) ) ( not ( = ?auto_32482 ?auto_32485 ) ) ( not ( = ?auto_32483 ?auto_32484 ) ) ( not ( = ?auto_32483 ?auto_32485 ) ) ( not ( = ?auto_32484 ?auto_32485 ) ) ( ON ?auto_32485 ?auto_32486 ) ( not ( = ?auto_32482 ?auto_32486 ) ) ( not ( = ?auto_32483 ?auto_32486 ) ) ( not ( = ?auto_32484 ?auto_32486 ) ) ( not ( = ?auto_32485 ?auto_32486 ) ) ( ON-TABLE ?auto_32486 ) ( ON ?auto_32482 ?auto_32487 ) ( not ( = ?auto_32482 ?auto_32487 ) ) ( not ( = ?auto_32483 ?auto_32487 ) ) ( not ( = ?auto_32484 ?auto_32487 ) ) ( not ( = ?auto_32485 ?auto_32487 ) ) ( not ( = ?auto_32486 ?auto_32487 ) ) ( ON ?auto_32483 ?auto_32482 ) ( ON-TABLE ?auto_32487 ) ( CLEAR ?auto_32485 ) ( ON ?auto_32484 ?auto_32483 ) ( CLEAR ?auto_32484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32487 ?auto_32482 ?auto_32483 )
      ( MAKE-4PILE ?auto_32482 ?auto_32483 ?auto_32484 ?auto_32485 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32488 - BLOCK
      ?auto_32489 - BLOCK
      ?auto_32490 - BLOCK
      ?auto_32491 - BLOCK
    )
    :vars
    (
      ?auto_32492 - BLOCK
      ?auto_32493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32488 ?auto_32489 ) ) ( not ( = ?auto_32488 ?auto_32490 ) ) ( not ( = ?auto_32488 ?auto_32491 ) ) ( not ( = ?auto_32489 ?auto_32490 ) ) ( not ( = ?auto_32489 ?auto_32491 ) ) ( not ( = ?auto_32490 ?auto_32491 ) ) ( not ( = ?auto_32488 ?auto_32492 ) ) ( not ( = ?auto_32489 ?auto_32492 ) ) ( not ( = ?auto_32490 ?auto_32492 ) ) ( not ( = ?auto_32491 ?auto_32492 ) ) ( ON-TABLE ?auto_32492 ) ( ON ?auto_32488 ?auto_32493 ) ( not ( = ?auto_32488 ?auto_32493 ) ) ( not ( = ?auto_32489 ?auto_32493 ) ) ( not ( = ?auto_32490 ?auto_32493 ) ) ( not ( = ?auto_32491 ?auto_32493 ) ) ( not ( = ?auto_32492 ?auto_32493 ) ) ( ON ?auto_32489 ?auto_32488 ) ( ON-TABLE ?auto_32493 ) ( ON ?auto_32490 ?auto_32489 ) ( CLEAR ?auto_32490 ) ( HOLDING ?auto_32491 ) ( CLEAR ?auto_32492 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32492 ?auto_32491 )
      ( MAKE-4PILE ?auto_32488 ?auto_32489 ?auto_32490 ?auto_32491 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32494 - BLOCK
      ?auto_32495 - BLOCK
      ?auto_32496 - BLOCK
      ?auto_32497 - BLOCK
    )
    :vars
    (
      ?auto_32498 - BLOCK
      ?auto_32499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32494 ?auto_32495 ) ) ( not ( = ?auto_32494 ?auto_32496 ) ) ( not ( = ?auto_32494 ?auto_32497 ) ) ( not ( = ?auto_32495 ?auto_32496 ) ) ( not ( = ?auto_32495 ?auto_32497 ) ) ( not ( = ?auto_32496 ?auto_32497 ) ) ( not ( = ?auto_32494 ?auto_32498 ) ) ( not ( = ?auto_32495 ?auto_32498 ) ) ( not ( = ?auto_32496 ?auto_32498 ) ) ( not ( = ?auto_32497 ?auto_32498 ) ) ( ON-TABLE ?auto_32498 ) ( ON ?auto_32494 ?auto_32499 ) ( not ( = ?auto_32494 ?auto_32499 ) ) ( not ( = ?auto_32495 ?auto_32499 ) ) ( not ( = ?auto_32496 ?auto_32499 ) ) ( not ( = ?auto_32497 ?auto_32499 ) ) ( not ( = ?auto_32498 ?auto_32499 ) ) ( ON ?auto_32495 ?auto_32494 ) ( ON-TABLE ?auto_32499 ) ( ON ?auto_32496 ?auto_32495 ) ( CLEAR ?auto_32498 ) ( ON ?auto_32497 ?auto_32496 ) ( CLEAR ?auto_32497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32499 ?auto_32494 ?auto_32495 ?auto_32496 )
      ( MAKE-4PILE ?auto_32494 ?auto_32495 ?auto_32496 ?auto_32497 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32500 - BLOCK
      ?auto_32501 - BLOCK
      ?auto_32502 - BLOCK
      ?auto_32503 - BLOCK
    )
    :vars
    (
      ?auto_32504 - BLOCK
      ?auto_32505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32500 ?auto_32501 ) ) ( not ( = ?auto_32500 ?auto_32502 ) ) ( not ( = ?auto_32500 ?auto_32503 ) ) ( not ( = ?auto_32501 ?auto_32502 ) ) ( not ( = ?auto_32501 ?auto_32503 ) ) ( not ( = ?auto_32502 ?auto_32503 ) ) ( not ( = ?auto_32500 ?auto_32504 ) ) ( not ( = ?auto_32501 ?auto_32504 ) ) ( not ( = ?auto_32502 ?auto_32504 ) ) ( not ( = ?auto_32503 ?auto_32504 ) ) ( ON ?auto_32500 ?auto_32505 ) ( not ( = ?auto_32500 ?auto_32505 ) ) ( not ( = ?auto_32501 ?auto_32505 ) ) ( not ( = ?auto_32502 ?auto_32505 ) ) ( not ( = ?auto_32503 ?auto_32505 ) ) ( not ( = ?auto_32504 ?auto_32505 ) ) ( ON ?auto_32501 ?auto_32500 ) ( ON-TABLE ?auto_32505 ) ( ON ?auto_32502 ?auto_32501 ) ( ON ?auto_32503 ?auto_32502 ) ( CLEAR ?auto_32503 ) ( HOLDING ?auto_32504 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32504 )
      ( MAKE-4PILE ?auto_32500 ?auto_32501 ?auto_32502 ?auto_32503 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32506 - BLOCK
      ?auto_32507 - BLOCK
      ?auto_32508 - BLOCK
      ?auto_32509 - BLOCK
    )
    :vars
    (
      ?auto_32510 - BLOCK
      ?auto_32511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32506 ?auto_32507 ) ) ( not ( = ?auto_32506 ?auto_32508 ) ) ( not ( = ?auto_32506 ?auto_32509 ) ) ( not ( = ?auto_32507 ?auto_32508 ) ) ( not ( = ?auto_32507 ?auto_32509 ) ) ( not ( = ?auto_32508 ?auto_32509 ) ) ( not ( = ?auto_32506 ?auto_32510 ) ) ( not ( = ?auto_32507 ?auto_32510 ) ) ( not ( = ?auto_32508 ?auto_32510 ) ) ( not ( = ?auto_32509 ?auto_32510 ) ) ( ON ?auto_32506 ?auto_32511 ) ( not ( = ?auto_32506 ?auto_32511 ) ) ( not ( = ?auto_32507 ?auto_32511 ) ) ( not ( = ?auto_32508 ?auto_32511 ) ) ( not ( = ?auto_32509 ?auto_32511 ) ) ( not ( = ?auto_32510 ?auto_32511 ) ) ( ON ?auto_32507 ?auto_32506 ) ( ON-TABLE ?auto_32511 ) ( ON ?auto_32508 ?auto_32507 ) ( ON ?auto_32509 ?auto_32508 ) ( ON ?auto_32510 ?auto_32509 ) ( CLEAR ?auto_32510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32511 ?auto_32506 ?auto_32507 ?auto_32508 ?auto_32509 )
      ( MAKE-4PILE ?auto_32506 ?auto_32507 ?auto_32508 ?auto_32509 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32522 - BLOCK
      ?auto_32523 - BLOCK
      ?auto_32524 - BLOCK
      ?auto_32525 - BLOCK
      ?auto_32526 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32525 ) ( ON-TABLE ?auto_32522 ) ( ON ?auto_32523 ?auto_32522 ) ( ON ?auto_32524 ?auto_32523 ) ( ON ?auto_32525 ?auto_32524 ) ( not ( = ?auto_32522 ?auto_32523 ) ) ( not ( = ?auto_32522 ?auto_32524 ) ) ( not ( = ?auto_32522 ?auto_32525 ) ) ( not ( = ?auto_32522 ?auto_32526 ) ) ( not ( = ?auto_32523 ?auto_32524 ) ) ( not ( = ?auto_32523 ?auto_32525 ) ) ( not ( = ?auto_32523 ?auto_32526 ) ) ( not ( = ?auto_32524 ?auto_32525 ) ) ( not ( = ?auto_32524 ?auto_32526 ) ) ( not ( = ?auto_32525 ?auto_32526 ) ) ( ON-TABLE ?auto_32526 ) ( CLEAR ?auto_32526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_32526 )
      ( MAKE-5PILE ?auto_32522 ?auto_32523 ?auto_32524 ?auto_32525 ?auto_32526 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32527 - BLOCK
      ?auto_32528 - BLOCK
      ?auto_32529 - BLOCK
      ?auto_32530 - BLOCK
      ?auto_32531 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32527 ) ( ON ?auto_32528 ?auto_32527 ) ( ON ?auto_32529 ?auto_32528 ) ( not ( = ?auto_32527 ?auto_32528 ) ) ( not ( = ?auto_32527 ?auto_32529 ) ) ( not ( = ?auto_32527 ?auto_32530 ) ) ( not ( = ?auto_32527 ?auto_32531 ) ) ( not ( = ?auto_32528 ?auto_32529 ) ) ( not ( = ?auto_32528 ?auto_32530 ) ) ( not ( = ?auto_32528 ?auto_32531 ) ) ( not ( = ?auto_32529 ?auto_32530 ) ) ( not ( = ?auto_32529 ?auto_32531 ) ) ( not ( = ?auto_32530 ?auto_32531 ) ) ( ON-TABLE ?auto_32531 ) ( CLEAR ?auto_32531 ) ( HOLDING ?auto_32530 ) ( CLEAR ?auto_32529 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32527 ?auto_32528 ?auto_32529 ?auto_32530 )
      ( MAKE-5PILE ?auto_32527 ?auto_32528 ?auto_32529 ?auto_32530 ?auto_32531 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32532 - BLOCK
      ?auto_32533 - BLOCK
      ?auto_32534 - BLOCK
      ?auto_32535 - BLOCK
      ?auto_32536 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32532 ) ( ON ?auto_32533 ?auto_32532 ) ( ON ?auto_32534 ?auto_32533 ) ( not ( = ?auto_32532 ?auto_32533 ) ) ( not ( = ?auto_32532 ?auto_32534 ) ) ( not ( = ?auto_32532 ?auto_32535 ) ) ( not ( = ?auto_32532 ?auto_32536 ) ) ( not ( = ?auto_32533 ?auto_32534 ) ) ( not ( = ?auto_32533 ?auto_32535 ) ) ( not ( = ?auto_32533 ?auto_32536 ) ) ( not ( = ?auto_32534 ?auto_32535 ) ) ( not ( = ?auto_32534 ?auto_32536 ) ) ( not ( = ?auto_32535 ?auto_32536 ) ) ( ON-TABLE ?auto_32536 ) ( CLEAR ?auto_32534 ) ( ON ?auto_32535 ?auto_32536 ) ( CLEAR ?auto_32535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32536 )
      ( MAKE-5PILE ?auto_32532 ?auto_32533 ?auto_32534 ?auto_32535 ?auto_32536 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32537 - BLOCK
      ?auto_32538 - BLOCK
      ?auto_32539 - BLOCK
      ?auto_32540 - BLOCK
      ?auto_32541 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32537 ) ( ON ?auto_32538 ?auto_32537 ) ( not ( = ?auto_32537 ?auto_32538 ) ) ( not ( = ?auto_32537 ?auto_32539 ) ) ( not ( = ?auto_32537 ?auto_32540 ) ) ( not ( = ?auto_32537 ?auto_32541 ) ) ( not ( = ?auto_32538 ?auto_32539 ) ) ( not ( = ?auto_32538 ?auto_32540 ) ) ( not ( = ?auto_32538 ?auto_32541 ) ) ( not ( = ?auto_32539 ?auto_32540 ) ) ( not ( = ?auto_32539 ?auto_32541 ) ) ( not ( = ?auto_32540 ?auto_32541 ) ) ( ON-TABLE ?auto_32541 ) ( ON ?auto_32540 ?auto_32541 ) ( CLEAR ?auto_32540 ) ( HOLDING ?auto_32539 ) ( CLEAR ?auto_32538 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32537 ?auto_32538 ?auto_32539 )
      ( MAKE-5PILE ?auto_32537 ?auto_32538 ?auto_32539 ?auto_32540 ?auto_32541 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32542 - BLOCK
      ?auto_32543 - BLOCK
      ?auto_32544 - BLOCK
      ?auto_32545 - BLOCK
      ?auto_32546 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32542 ) ( ON ?auto_32543 ?auto_32542 ) ( not ( = ?auto_32542 ?auto_32543 ) ) ( not ( = ?auto_32542 ?auto_32544 ) ) ( not ( = ?auto_32542 ?auto_32545 ) ) ( not ( = ?auto_32542 ?auto_32546 ) ) ( not ( = ?auto_32543 ?auto_32544 ) ) ( not ( = ?auto_32543 ?auto_32545 ) ) ( not ( = ?auto_32543 ?auto_32546 ) ) ( not ( = ?auto_32544 ?auto_32545 ) ) ( not ( = ?auto_32544 ?auto_32546 ) ) ( not ( = ?auto_32545 ?auto_32546 ) ) ( ON-TABLE ?auto_32546 ) ( ON ?auto_32545 ?auto_32546 ) ( CLEAR ?auto_32543 ) ( ON ?auto_32544 ?auto_32545 ) ( CLEAR ?auto_32544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32546 ?auto_32545 )
      ( MAKE-5PILE ?auto_32542 ?auto_32543 ?auto_32544 ?auto_32545 ?auto_32546 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32547 - BLOCK
      ?auto_32548 - BLOCK
      ?auto_32549 - BLOCK
      ?auto_32550 - BLOCK
      ?auto_32551 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32547 ) ( not ( = ?auto_32547 ?auto_32548 ) ) ( not ( = ?auto_32547 ?auto_32549 ) ) ( not ( = ?auto_32547 ?auto_32550 ) ) ( not ( = ?auto_32547 ?auto_32551 ) ) ( not ( = ?auto_32548 ?auto_32549 ) ) ( not ( = ?auto_32548 ?auto_32550 ) ) ( not ( = ?auto_32548 ?auto_32551 ) ) ( not ( = ?auto_32549 ?auto_32550 ) ) ( not ( = ?auto_32549 ?auto_32551 ) ) ( not ( = ?auto_32550 ?auto_32551 ) ) ( ON-TABLE ?auto_32551 ) ( ON ?auto_32550 ?auto_32551 ) ( ON ?auto_32549 ?auto_32550 ) ( CLEAR ?auto_32549 ) ( HOLDING ?auto_32548 ) ( CLEAR ?auto_32547 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32547 ?auto_32548 )
      ( MAKE-5PILE ?auto_32547 ?auto_32548 ?auto_32549 ?auto_32550 ?auto_32551 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32552 - BLOCK
      ?auto_32553 - BLOCK
      ?auto_32554 - BLOCK
      ?auto_32555 - BLOCK
      ?auto_32556 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32552 ) ( not ( = ?auto_32552 ?auto_32553 ) ) ( not ( = ?auto_32552 ?auto_32554 ) ) ( not ( = ?auto_32552 ?auto_32555 ) ) ( not ( = ?auto_32552 ?auto_32556 ) ) ( not ( = ?auto_32553 ?auto_32554 ) ) ( not ( = ?auto_32553 ?auto_32555 ) ) ( not ( = ?auto_32553 ?auto_32556 ) ) ( not ( = ?auto_32554 ?auto_32555 ) ) ( not ( = ?auto_32554 ?auto_32556 ) ) ( not ( = ?auto_32555 ?auto_32556 ) ) ( ON-TABLE ?auto_32556 ) ( ON ?auto_32555 ?auto_32556 ) ( ON ?auto_32554 ?auto_32555 ) ( CLEAR ?auto_32552 ) ( ON ?auto_32553 ?auto_32554 ) ( CLEAR ?auto_32553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32556 ?auto_32555 ?auto_32554 )
      ( MAKE-5PILE ?auto_32552 ?auto_32553 ?auto_32554 ?auto_32555 ?auto_32556 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32557 - BLOCK
      ?auto_32558 - BLOCK
      ?auto_32559 - BLOCK
      ?auto_32560 - BLOCK
      ?auto_32561 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32557 ?auto_32558 ) ) ( not ( = ?auto_32557 ?auto_32559 ) ) ( not ( = ?auto_32557 ?auto_32560 ) ) ( not ( = ?auto_32557 ?auto_32561 ) ) ( not ( = ?auto_32558 ?auto_32559 ) ) ( not ( = ?auto_32558 ?auto_32560 ) ) ( not ( = ?auto_32558 ?auto_32561 ) ) ( not ( = ?auto_32559 ?auto_32560 ) ) ( not ( = ?auto_32559 ?auto_32561 ) ) ( not ( = ?auto_32560 ?auto_32561 ) ) ( ON-TABLE ?auto_32561 ) ( ON ?auto_32560 ?auto_32561 ) ( ON ?auto_32559 ?auto_32560 ) ( ON ?auto_32558 ?auto_32559 ) ( CLEAR ?auto_32558 ) ( HOLDING ?auto_32557 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32557 )
      ( MAKE-5PILE ?auto_32557 ?auto_32558 ?auto_32559 ?auto_32560 ?auto_32561 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32562 - BLOCK
      ?auto_32563 - BLOCK
      ?auto_32564 - BLOCK
      ?auto_32565 - BLOCK
      ?auto_32566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32562 ?auto_32563 ) ) ( not ( = ?auto_32562 ?auto_32564 ) ) ( not ( = ?auto_32562 ?auto_32565 ) ) ( not ( = ?auto_32562 ?auto_32566 ) ) ( not ( = ?auto_32563 ?auto_32564 ) ) ( not ( = ?auto_32563 ?auto_32565 ) ) ( not ( = ?auto_32563 ?auto_32566 ) ) ( not ( = ?auto_32564 ?auto_32565 ) ) ( not ( = ?auto_32564 ?auto_32566 ) ) ( not ( = ?auto_32565 ?auto_32566 ) ) ( ON-TABLE ?auto_32566 ) ( ON ?auto_32565 ?auto_32566 ) ( ON ?auto_32564 ?auto_32565 ) ( ON ?auto_32563 ?auto_32564 ) ( ON ?auto_32562 ?auto_32563 ) ( CLEAR ?auto_32562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32566 ?auto_32565 ?auto_32564 ?auto_32563 )
      ( MAKE-5PILE ?auto_32562 ?auto_32563 ?auto_32564 ?auto_32565 ?auto_32566 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32572 - BLOCK
      ?auto_32573 - BLOCK
      ?auto_32574 - BLOCK
      ?auto_32575 - BLOCK
      ?auto_32576 - BLOCK
    )
    :vars
    (
      ?auto_32577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32572 ?auto_32573 ) ) ( not ( = ?auto_32572 ?auto_32574 ) ) ( not ( = ?auto_32572 ?auto_32575 ) ) ( not ( = ?auto_32572 ?auto_32576 ) ) ( not ( = ?auto_32573 ?auto_32574 ) ) ( not ( = ?auto_32573 ?auto_32575 ) ) ( not ( = ?auto_32573 ?auto_32576 ) ) ( not ( = ?auto_32574 ?auto_32575 ) ) ( not ( = ?auto_32574 ?auto_32576 ) ) ( not ( = ?auto_32575 ?auto_32576 ) ) ( ON-TABLE ?auto_32576 ) ( ON ?auto_32575 ?auto_32576 ) ( ON ?auto_32574 ?auto_32575 ) ( ON ?auto_32573 ?auto_32574 ) ( CLEAR ?auto_32573 ) ( ON ?auto_32572 ?auto_32577 ) ( CLEAR ?auto_32572 ) ( HAND-EMPTY ) ( not ( = ?auto_32572 ?auto_32577 ) ) ( not ( = ?auto_32573 ?auto_32577 ) ) ( not ( = ?auto_32574 ?auto_32577 ) ) ( not ( = ?auto_32575 ?auto_32577 ) ) ( not ( = ?auto_32576 ?auto_32577 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32572 ?auto_32577 )
      ( MAKE-5PILE ?auto_32572 ?auto_32573 ?auto_32574 ?auto_32575 ?auto_32576 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32578 - BLOCK
      ?auto_32579 - BLOCK
      ?auto_32580 - BLOCK
      ?auto_32581 - BLOCK
      ?auto_32582 - BLOCK
    )
    :vars
    (
      ?auto_32583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32578 ?auto_32579 ) ) ( not ( = ?auto_32578 ?auto_32580 ) ) ( not ( = ?auto_32578 ?auto_32581 ) ) ( not ( = ?auto_32578 ?auto_32582 ) ) ( not ( = ?auto_32579 ?auto_32580 ) ) ( not ( = ?auto_32579 ?auto_32581 ) ) ( not ( = ?auto_32579 ?auto_32582 ) ) ( not ( = ?auto_32580 ?auto_32581 ) ) ( not ( = ?auto_32580 ?auto_32582 ) ) ( not ( = ?auto_32581 ?auto_32582 ) ) ( ON-TABLE ?auto_32582 ) ( ON ?auto_32581 ?auto_32582 ) ( ON ?auto_32580 ?auto_32581 ) ( ON ?auto_32578 ?auto_32583 ) ( CLEAR ?auto_32578 ) ( not ( = ?auto_32578 ?auto_32583 ) ) ( not ( = ?auto_32579 ?auto_32583 ) ) ( not ( = ?auto_32580 ?auto_32583 ) ) ( not ( = ?auto_32581 ?auto_32583 ) ) ( not ( = ?auto_32582 ?auto_32583 ) ) ( HOLDING ?auto_32579 ) ( CLEAR ?auto_32580 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32582 ?auto_32581 ?auto_32580 ?auto_32579 )
      ( MAKE-5PILE ?auto_32578 ?auto_32579 ?auto_32580 ?auto_32581 ?auto_32582 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32584 - BLOCK
      ?auto_32585 - BLOCK
      ?auto_32586 - BLOCK
      ?auto_32587 - BLOCK
      ?auto_32588 - BLOCK
    )
    :vars
    (
      ?auto_32589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32584 ?auto_32585 ) ) ( not ( = ?auto_32584 ?auto_32586 ) ) ( not ( = ?auto_32584 ?auto_32587 ) ) ( not ( = ?auto_32584 ?auto_32588 ) ) ( not ( = ?auto_32585 ?auto_32586 ) ) ( not ( = ?auto_32585 ?auto_32587 ) ) ( not ( = ?auto_32585 ?auto_32588 ) ) ( not ( = ?auto_32586 ?auto_32587 ) ) ( not ( = ?auto_32586 ?auto_32588 ) ) ( not ( = ?auto_32587 ?auto_32588 ) ) ( ON-TABLE ?auto_32588 ) ( ON ?auto_32587 ?auto_32588 ) ( ON ?auto_32586 ?auto_32587 ) ( ON ?auto_32584 ?auto_32589 ) ( not ( = ?auto_32584 ?auto_32589 ) ) ( not ( = ?auto_32585 ?auto_32589 ) ) ( not ( = ?auto_32586 ?auto_32589 ) ) ( not ( = ?auto_32587 ?auto_32589 ) ) ( not ( = ?auto_32588 ?auto_32589 ) ) ( CLEAR ?auto_32586 ) ( ON ?auto_32585 ?auto_32584 ) ( CLEAR ?auto_32585 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32589 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32589 ?auto_32584 )
      ( MAKE-5PILE ?auto_32584 ?auto_32585 ?auto_32586 ?auto_32587 ?auto_32588 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32590 - BLOCK
      ?auto_32591 - BLOCK
      ?auto_32592 - BLOCK
      ?auto_32593 - BLOCK
      ?auto_32594 - BLOCK
    )
    :vars
    (
      ?auto_32595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32590 ?auto_32591 ) ) ( not ( = ?auto_32590 ?auto_32592 ) ) ( not ( = ?auto_32590 ?auto_32593 ) ) ( not ( = ?auto_32590 ?auto_32594 ) ) ( not ( = ?auto_32591 ?auto_32592 ) ) ( not ( = ?auto_32591 ?auto_32593 ) ) ( not ( = ?auto_32591 ?auto_32594 ) ) ( not ( = ?auto_32592 ?auto_32593 ) ) ( not ( = ?auto_32592 ?auto_32594 ) ) ( not ( = ?auto_32593 ?auto_32594 ) ) ( ON-TABLE ?auto_32594 ) ( ON ?auto_32593 ?auto_32594 ) ( ON ?auto_32590 ?auto_32595 ) ( not ( = ?auto_32590 ?auto_32595 ) ) ( not ( = ?auto_32591 ?auto_32595 ) ) ( not ( = ?auto_32592 ?auto_32595 ) ) ( not ( = ?auto_32593 ?auto_32595 ) ) ( not ( = ?auto_32594 ?auto_32595 ) ) ( ON ?auto_32591 ?auto_32590 ) ( CLEAR ?auto_32591 ) ( ON-TABLE ?auto_32595 ) ( HOLDING ?auto_32592 ) ( CLEAR ?auto_32593 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32594 ?auto_32593 ?auto_32592 )
      ( MAKE-5PILE ?auto_32590 ?auto_32591 ?auto_32592 ?auto_32593 ?auto_32594 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32596 - BLOCK
      ?auto_32597 - BLOCK
      ?auto_32598 - BLOCK
      ?auto_32599 - BLOCK
      ?auto_32600 - BLOCK
    )
    :vars
    (
      ?auto_32601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32596 ?auto_32597 ) ) ( not ( = ?auto_32596 ?auto_32598 ) ) ( not ( = ?auto_32596 ?auto_32599 ) ) ( not ( = ?auto_32596 ?auto_32600 ) ) ( not ( = ?auto_32597 ?auto_32598 ) ) ( not ( = ?auto_32597 ?auto_32599 ) ) ( not ( = ?auto_32597 ?auto_32600 ) ) ( not ( = ?auto_32598 ?auto_32599 ) ) ( not ( = ?auto_32598 ?auto_32600 ) ) ( not ( = ?auto_32599 ?auto_32600 ) ) ( ON-TABLE ?auto_32600 ) ( ON ?auto_32599 ?auto_32600 ) ( ON ?auto_32596 ?auto_32601 ) ( not ( = ?auto_32596 ?auto_32601 ) ) ( not ( = ?auto_32597 ?auto_32601 ) ) ( not ( = ?auto_32598 ?auto_32601 ) ) ( not ( = ?auto_32599 ?auto_32601 ) ) ( not ( = ?auto_32600 ?auto_32601 ) ) ( ON ?auto_32597 ?auto_32596 ) ( ON-TABLE ?auto_32601 ) ( CLEAR ?auto_32599 ) ( ON ?auto_32598 ?auto_32597 ) ( CLEAR ?auto_32598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32601 ?auto_32596 ?auto_32597 )
      ( MAKE-5PILE ?auto_32596 ?auto_32597 ?auto_32598 ?auto_32599 ?auto_32600 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32602 - BLOCK
      ?auto_32603 - BLOCK
      ?auto_32604 - BLOCK
      ?auto_32605 - BLOCK
      ?auto_32606 - BLOCK
    )
    :vars
    (
      ?auto_32607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32602 ?auto_32603 ) ) ( not ( = ?auto_32602 ?auto_32604 ) ) ( not ( = ?auto_32602 ?auto_32605 ) ) ( not ( = ?auto_32602 ?auto_32606 ) ) ( not ( = ?auto_32603 ?auto_32604 ) ) ( not ( = ?auto_32603 ?auto_32605 ) ) ( not ( = ?auto_32603 ?auto_32606 ) ) ( not ( = ?auto_32604 ?auto_32605 ) ) ( not ( = ?auto_32604 ?auto_32606 ) ) ( not ( = ?auto_32605 ?auto_32606 ) ) ( ON-TABLE ?auto_32606 ) ( ON ?auto_32602 ?auto_32607 ) ( not ( = ?auto_32602 ?auto_32607 ) ) ( not ( = ?auto_32603 ?auto_32607 ) ) ( not ( = ?auto_32604 ?auto_32607 ) ) ( not ( = ?auto_32605 ?auto_32607 ) ) ( not ( = ?auto_32606 ?auto_32607 ) ) ( ON ?auto_32603 ?auto_32602 ) ( ON-TABLE ?auto_32607 ) ( ON ?auto_32604 ?auto_32603 ) ( CLEAR ?auto_32604 ) ( HOLDING ?auto_32605 ) ( CLEAR ?auto_32606 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32606 ?auto_32605 )
      ( MAKE-5PILE ?auto_32602 ?auto_32603 ?auto_32604 ?auto_32605 ?auto_32606 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32608 - BLOCK
      ?auto_32609 - BLOCK
      ?auto_32610 - BLOCK
      ?auto_32611 - BLOCK
      ?auto_32612 - BLOCK
    )
    :vars
    (
      ?auto_32613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32608 ?auto_32609 ) ) ( not ( = ?auto_32608 ?auto_32610 ) ) ( not ( = ?auto_32608 ?auto_32611 ) ) ( not ( = ?auto_32608 ?auto_32612 ) ) ( not ( = ?auto_32609 ?auto_32610 ) ) ( not ( = ?auto_32609 ?auto_32611 ) ) ( not ( = ?auto_32609 ?auto_32612 ) ) ( not ( = ?auto_32610 ?auto_32611 ) ) ( not ( = ?auto_32610 ?auto_32612 ) ) ( not ( = ?auto_32611 ?auto_32612 ) ) ( ON-TABLE ?auto_32612 ) ( ON ?auto_32608 ?auto_32613 ) ( not ( = ?auto_32608 ?auto_32613 ) ) ( not ( = ?auto_32609 ?auto_32613 ) ) ( not ( = ?auto_32610 ?auto_32613 ) ) ( not ( = ?auto_32611 ?auto_32613 ) ) ( not ( = ?auto_32612 ?auto_32613 ) ) ( ON ?auto_32609 ?auto_32608 ) ( ON-TABLE ?auto_32613 ) ( ON ?auto_32610 ?auto_32609 ) ( CLEAR ?auto_32612 ) ( ON ?auto_32611 ?auto_32610 ) ( CLEAR ?auto_32611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32613 ?auto_32608 ?auto_32609 ?auto_32610 )
      ( MAKE-5PILE ?auto_32608 ?auto_32609 ?auto_32610 ?auto_32611 ?auto_32612 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32614 - BLOCK
      ?auto_32615 - BLOCK
      ?auto_32616 - BLOCK
      ?auto_32617 - BLOCK
      ?auto_32618 - BLOCK
    )
    :vars
    (
      ?auto_32619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32614 ?auto_32615 ) ) ( not ( = ?auto_32614 ?auto_32616 ) ) ( not ( = ?auto_32614 ?auto_32617 ) ) ( not ( = ?auto_32614 ?auto_32618 ) ) ( not ( = ?auto_32615 ?auto_32616 ) ) ( not ( = ?auto_32615 ?auto_32617 ) ) ( not ( = ?auto_32615 ?auto_32618 ) ) ( not ( = ?auto_32616 ?auto_32617 ) ) ( not ( = ?auto_32616 ?auto_32618 ) ) ( not ( = ?auto_32617 ?auto_32618 ) ) ( ON ?auto_32614 ?auto_32619 ) ( not ( = ?auto_32614 ?auto_32619 ) ) ( not ( = ?auto_32615 ?auto_32619 ) ) ( not ( = ?auto_32616 ?auto_32619 ) ) ( not ( = ?auto_32617 ?auto_32619 ) ) ( not ( = ?auto_32618 ?auto_32619 ) ) ( ON ?auto_32615 ?auto_32614 ) ( ON-TABLE ?auto_32619 ) ( ON ?auto_32616 ?auto_32615 ) ( ON ?auto_32617 ?auto_32616 ) ( CLEAR ?auto_32617 ) ( HOLDING ?auto_32618 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32618 )
      ( MAKE-5PILE ?auto_32614 ?auto_32615 ?auto_32616 ?auto_32617 ?auto_32618 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32620 - BLOCK
      ?auto_32621 - BLOCK
      ?auto_32622 - BLOCK
      ?auto_32623 - BLOCK
      ?auto_32624 - BLOCK
    )
    :vars
    (
      ?auto_32625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32620 ?auto_32621 ) ) ( not ( = ?auto_32620 ?auto_32622 ) ) ( not ( = ?auto_32620 ?auto_32623 ) ) ( not ( = ?auto_32620 ?auto_32624 ) ) ( not ( = ?auto_32621 ?auto_32622 ) ) ( not ( = ?auto_32621 ?auto_32623 ) ) ( not ( = ?auto_32621 ?auto_32624 ) ) ( not ( = ?auto_32622 ?auto_32623 ) ) ( not ( = ?auto_32622 ?auto_32624 ) ) ( not ( = ?auto_32623 ?auto_32624 ) ) ( ON ?auto_32620 ?auto_32625 ) ( not ( = ?auto_32620 ?auto_32625 ) ) ( not ( = ?auto_32621 ?auto_32625 ) ) ( not ( = ?auto_32622 ?auto_32625 ) ) ( not ( = ?auto_32623 ?auto_32625 ) ) ( not ( = ?auto_32624 ?auto_32625 ) ) ( ON ?auto_32621 ?auto_32620 ) ( ON-TABLE ?auto_32625 ) ( ON ?auto_32622 ?auto_32621 ) ( ON ?auto_32623 ?auto_32622 ) ( ON ?auto_32624 ?auto_32623 ) ( CLEAR ?auto_32624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32625 ?auto_32620 ?auto_32621 ?auto_32622 ?auto_32623 )
      ( MAKE-5PILE ?auto_32620 ?auto_32621 ?auto_32622 ?auto_32623 ?auto_32624 ) )
  )

)

