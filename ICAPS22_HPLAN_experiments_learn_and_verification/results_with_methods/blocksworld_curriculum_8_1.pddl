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
      ?auto_31678 - BLOCK
    )
    :vars
    (
      ?auto_31679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31678 ?auto_31679 ) ( CLEAR ?auto_31678 ) ( HAND-EMPTY ) ( not ( = ?auto_31678 ?auto_31679 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31678 ?auto_31679 )
      ( !PUTDOWN ?auto_31678 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31681 - BLOCK
    )
    :vars
    (
      ?auto_31682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31681 ?auto_31682 ) ( CLEAR ?auto_31681 ) ( HAND-EMPTY ) ( not ( = ?auto_31681 ?auto_31682 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31681 ?auto_31682 )
      ( !PUTDOWN ?auto_31681 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31685 - BLOCK
      ?auto_31686 - BLOCK
    )
    :vars
    (
      ?auto_31687 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31685 ) ( ON ?auto_31686 ?auto_31687 ) ( CLEAR ?auto_31686 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31685 ) ( not ( = ?auto_31685 ?auto_31686 ) ) ( not ( = ?auto_31685 ?auto_31687 ) ) ( not ( = ?auto_31686 ?auto_31687 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31686 ?auto_31687 )
      ( !STACK ?auto_31686 ?auto_31685 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31690 - BLOCK
      ?auto_31691 - BLOCK
    )
    :vars
    (
      ?auto_31692 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31690 ) ( ON ?auto_31691 ?auto_31692 ) ( CLEAR ?auto_31691 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31690 ) ( not ( = ?auto_31690 ?auto_31691 ) ) ( not ( = ?auto_31690 ?auto_31692 ) ) ( not ( = ?auto_31691 ?auto_31692 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31691 ?auto_31692 )
      ( !STACK ?auto_31691 ?auto_31690 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31695 - BLOCK
      ?auto_31696 - BLOCK
    )
    :vars
    (
      ?auto_31697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31696 ?auto_31697 ) ( not ( = ?auto_31695 ?auto_31696 ) ) ( not ( = ?auto_31695 ?auto_31697 ) ) ( not ( = ?auto_31696 ?auto_31697 ) ) ( ON ?auto_31695 ?auto_31696 ) ( CLEAR ?auto_31695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31695 )
      ( MAKE-2PILE ?auto_31695 ?auto_31696 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31700 - BLOCK
      ?auto_31701 - BLOCK
    )
    :vars
    (
      ?auto_31702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31701 ?auto_31702 ) ( not ( = ?auto_31700 ?auto_31701 ) ) ( not ( = ?auto_31700 ?auto_31702 ) ) ( not ( = ?auto_31701 ?auto_31702 ) ) ( ON ?auto_31700 ?auto_31701 ) ( CLEAR ?auto_31700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31700 )
      ( MAKE-2PILE ?auto_31700 ?auto_31701 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31706 - BLOCK
      ?auto_31707 - BLOCK
      ?auto_31708 - BLOCK
    )
    :vars
    (
      ?auto_31709 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31707 ) ( ON ?auto_31708 ?auto_31709 ) ( CLEAR ?auto_31708 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31706 ) ( ON ?auto_31707 ?auto_31706 ) ( not ( = ?auto_31706 ?auto_31707 ) ) ( not ( = ?auto_31706 ?auto_31708 ) ) ( not ( = ?auto_31706 ?auto_31709 ) ) ( not ( = ?auto_31707 ?auto_31708 ) ) ( not ( = ?auto_31707 ?auto_31709 ) ) ( not ( = ?auto_31708 ?auto_31709 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31708 ?auto_31709 )
      ( !STACK ?auto_31708 ?auto_31707 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31713 - BLOCK
      ?auto_31714 - BLOCK
      ?auto_31715 - BLOCK
    )
    :vars
    (
      ?auto_31716 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31714 ) ( ON ?auto_31715 ?auto_31716 ) ( CLEAR ?auto_31715 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31713 ) ( ON ?auto_31714 ?auto_31713 ) ( not ( = ?auto_31713 ?auto_31714 ) ) ( not ( = ?auto_31713 ?auto_31715 ) ) ( not ( = ?auto_31713 ?auto_31716 ) ) ( not ( = ?auto_31714 ?auto_31715 ) ) ( not ( = ?auto_31714 ?auto_31716 ) ) ( not ( = ?auto_31715 ?auto_31716 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31715 ?auto_31716 )
      ( !STACK ?auto_31715 ?auto_31714 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31720 - BLOCK
      ?auto_31721 - BLOCK
      ?auto_31722 - BLOCK
    )
    :vars
    (
      ?auto_31723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31722 ?auto_31723 ) ( ON-TABLE ?auto_31720 ) ( not ( = ?auto_31720 ?auto_31721 ) ) ( not ( = ?auto_31720 ?auto_31722 ) ) ( not ( = ?auto_31720 ?auto_31723 ) ) ( not ( = ?auto_31721 ?auto_31722 ) ) ( not ( = ?auto_31721 ?auto_31723 ) ) ( not ( = ?auto_31722 ?auto_31723 ) ) ( CLEAR ?auto_31720 ) ( ON ?auto_31721 ?auto_31722 ) ( CLEAR ?auto_31721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31720 ?auto_31721 )
      ( MAKE-3PILE ?auto_31720 ?auto_31721 ?auto_31722 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31727 - BLOCK
      ?auto_31728 - BLOCK
      ?auto_31729 - BLOCK
    )
    :vars
    (
      ?auto_31730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31729 ?auto_31730 ) ( ON-TABLE ?auto_31727 ) ( not ( = ?auto_31727 ?auto_31728 ) ) ( not ( = ?auto_31727 ?auto_31729 ) ) ( not ( = ?auto_31727 ?auto_31730 ) ) ( not ( = ?auto_31728 ?auto_31729 ) ) ( not ( = ?auto_31728 ?auto_31730 ) ) ( not ( = ?auto_31729 ?auto_31730 ) ) ( CLEAR ?auto_31727 ) ( ON ?auto_31728 ?auto_31729 ) ( CLEAR ?auto_31728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31727 ?auto_31728 )
      ( MAKE-3PILE ?auto_31727 ?auto_31728 ?auto_31729 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31734 - BLOCK
      ?auto_31735 - BLOCK
      ?auto_31736 - BLOCK
    )
    :vars
    (
      ?auto_31737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31736 ?auto_31737 ) ( not ( = ?auto_31734 ?auto_31735 ) ) ( not ( = ?auto_31734 ?auto_31736 ) ) ( not ( = ?auto_31734 ?auto_31737 ) ) ( not ( = ?auto_31735 ?auto_31736 ) ) ( not ( = ?auto_31735 ?auto_31737 ) ) ( not ( = ?auto_31736 ?auto_31737 ) ) ( ON ?auto_31735 ?auto_31736 ) ( ON ?auto_31734 ?auto_31735 ) ( CLEAR ?auto_31734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31734 )
      ( MAKE-3PILE ?auto_31734 ?auto_31735 ?auto_31736 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31741 - BLOCK
      ?auto_31742 - BLOCK
      ?auto_31743 - BLOCK
    )
    :vars
    (
      ?auto_31744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31743 ?auto_31744 ) ( not ( = ?auto_31741 ?auto_31742 ) ) ( not ( = ?auto_31741 ?auto_31743 ) ) ( not ( = ?auto_31741 ?auto_31744 ) ) ( not ( = ?auto_31742 ?auto_31743 ) ) ( not ( = ?auto_31742 ?auto_31744 ) ) ( not ( = ?auto_31743 ?auto_31744 ) ) ( ON ?auto_31742 ?auto_31743 ) ( ON ?auto_31741 ?auto_31742 ) ( CLEAR ?auto_31741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31741 )
      ( MAKE-3PILE ?auto_31741 ?auto_31742 ?auto_31743 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31749 - BLOCK
      ?auto_31750 - BLOCK
      ?auto_31751 - BLOCK
      ?auto_31752 - BLOCK
    )
    :vars
    (
      ?auto_31753 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31751 ) ( ON ?auto_31752 ?auto_31753 ) ( CLEAR ?auto_31752 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31749 ) ( ON ?auto_31750 ?auto_31749 ) ( ON ?auto_31751 ?auto_31750 ) ( not ( = ?auto_31749 ?auto_31750 ) ) ( not ( = ?auto_31749 ?auto_31751 ) ) ( not ( = ?auto_31749 ?auto_31752 ) ) ( not ( = ?auto_31749 ?auto_31753 ) ) ( not ( = ?auto_31750 ?auto_31751 ) ) ( not ( = ?auto_31750 ?auto_31752 ) ) ( not ( = ?auto_31750 ?auto_31753 ) ) ( not ( = ?auto_31751 ?auto_31752 ) ) ( not ( = ?auto_31751 ?auto_31753 ) ) ( not ( = ?auto_31752 ?auto_31753 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31752 ?auto_31753 )
      ( !STACK ?auto_31752 ?auto_31751 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31758 - BLOCK
      ?auto_31759 - BLOCK
      ?auto_31760 - BLOCK
      ?auto_31761 - BLOCK
    )
    :vars
    (
      ?auto_31762 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31760 ) ( ON ?auto_31761 ?auto_31762 ) ( CLEAR ?auto_31761 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31758 ) ( ON ?auto_31759 ?auto_31758 ) ( ON ?auto_31760 ?auto_31759 ) ( not ( = ?auto_31758 ?auto_31759 ) ) ( not ( = ?auto_31758 ?auto_31760 ) ) ( not ( = ?auto_31758 ?auto_31761 ) ) ( not ( = ?auto_31758 ?auto_31762 ) ) ( not ( = ?auto_31759 ?auto_31760 ) ) ( not ( = ?auto_31759 ?auto_31761 ) ) ( not ( = ?auto_31759 ?auto_31762 ) ) ( not ( = ?auto_31760 ?auto_31761 ) ) ( not ( = ?auto_31760 ?auto_31762 ) ) ( not ( = ?auto_31761 ?auto_31762 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31761 ?auto_31762 )
      ( !STACK ?auto_31761 ?auto_31760 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31767 - BLOCK
      ?auto_31768 - BLOCK
      ?auto_31769 - BLOCK
      ?auto_31770 - BLOCK
    )
    :vars
    (
      ?auto_31771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31770 ?auto_31771 ) ( ON-TABLE ?auto_31767 ) ( ON ?auto_31768 ?auto_31767 ) ( not ( = ?auto_31767 ?auto_31768 ) ) ( not ( = ?auto_31767 ?auto_31769 ) ) ( not ( = ?auto_31767 ?auto_31770 ) ) ( not ( = ?auto_31767 ?auto_31771 ) ) ( not ( = ?auto_31768 ?auto_31769 ) ) ( not ( = ?auto_31768 ?auto_31770 ) ) ( not ( = ?auto_31768 ?auto_31771 ) ) ( not ( = ?auto_31769 ?auto_31770 ) ) ( not ( = ?auto_31769 ?auto_31771 ) ) ( not ( = ?auto_31770 ?auto_31771 ) ) ( CLEAR ?auto_31768 ) ( ON ?auto_31769 ?auto_31770 ) ( CLEAR ?auto_31769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31767 ?auto_31768 ?auto_31769 )
      ( MAKE-4PILE ?auto_31767 ?auto_31768 ?auto_31769 ?auto_31770 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31776 - BLOCK
      ?auto_31777 - BLOCK
      ?auto_31778 - BLOCK
      ?auto_31779 - BLOCK
    )
    :vars
    (
      ?auto_31780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31779 ?auto_31780 ) ( ON-TABLE ?auto_31776 ) ( ON ?auto_31777 ?auto_31776 ) ( not ( = ?auto_31776 ?auto_31777 ) ) ( not ( = ?auto_31776 ?auto_31778 ) ) ( not ( = ?auto_31776 ?auto_31779 ) ) ( not ( = ?auto_31776 ?auto_31780 ) ) ( not ( = ?auto_31777 ?auto_31778 ) ) ( not ( = ?auto_31777 ?auto_31779 ) ) ( not ( = ?auto_31777 ?auto_31780 ) ) ( not ( = ?auto_31778 ?auto_31779 ) ) ( not ( = ?auto_31778 ?auto_31780 ) ) ( not ( = ?auto_31779 ?auto_31780 ) ) ( CLEAR ?auto_31777 ) ( ON ?auto_31778 ?auto_31779 ) ( CLEAR ?auto_31778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31776 ?auto_31777 ?auto_31778 )
      ( MAKE-4PILE ?auto_31776 ?auto_31777 ?auto_31778 ?auto_31779 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31785 - BLOCK
      ?auto_31786 - BLOCK
      ?auto_31787 - BLOCK
      ?auto_31788 - BLOCK
    )
    :vars
    (
      ?auto_31789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31788 ?auto_31789 ) ( ON-TABLE ?auto_31785 ) ( not ( = ?auto_31785 ?auto_31786 ) ) ( not ( = ?auto_31785 ?auto_31787 ) ) ( not ( = ?auto_31785 ?auto_31788 ) ) ( not ( = ?auto_31785 ?auto_31789 ) ) ( not ( = ?auto_31786 ?auto_31787 ) ) ( not ( = ?auto_31786 ?auto_31788 ) ) ( not ( = ?auto_31786 ?auto_31789 ) ) ( not ( = ?auto_31787 ?auto_31788 ) ) ( not ( = ?auto_31787 ?auto_31789 ) ) ( not ( = ?auto_31788 ?auto_31789 ) ) ( ON ?auto_31787 ?auto_31788 ) ( CLEAR ?auto_31785 ) ( ON ?auto_31786 ?auto_31787 ) ( CLEAR ?auto_31786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31785 ?auto_31786 )
      ( MAKE-4PILE ?auto_31785 ?auto_31786 ?auto_31787 ?auto_31788 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31794 - BLOCK
      ?auto_31795 - BLOCK
      ?auto_31796 - BLOCK
      ?auto_31797 - BLOCK
    )
    :vars
    (
      ?auto_31798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31797 ?auto_31798 ) ( ON-TABLE ?auto_31794 ) ( not ( = ?auto_31794 ?auto_31795 ) ) ( not ( = ?auto_31794 ?auto_31796 ) ) ( not ( = ?auto_31794 ?auto_31797 ) ) ( not ( = ?auto_31794 ?auto_31798 ) ) ( not ( = ?auto_31795 ?auto_31796 ) ) ( not ( = ?auto_31795 ?auto_31797 ) ) ( not ( = ?auto_31795 ?auto_31798 ) ) ( not ( = ?auto_31796 ?auto_31797 ) ) ( not ( = ?auto_31796 ?auto_31798 ) ) ( not ( = ?auto_31797 ?auto_31798 ) ) ( ON ?auto_31796 ?auto_31797 ) ( CLEAR ?auto_31794 ) ( ON ?auto_31795 ?auto_31796 ) ( CLEAR ?auto_31795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31794 ?auto_31795 )
      ( MAKE-4PILE ?auto_31794 ?auto_31795 ?auto_31796 ?auto_31797 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31803 - BLOCK
      ?auto_31804 - BLOCK
      ?auto_31805 - BLOCK
      ?auto_31806 - BLOCK
    )
    :vars
    (
      ?auto_31807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31806 ?auto_31807 ) ( not ( = ?auto_31803 ?auto_31804 ) ) ( not ( = ?auto_31803 ?auto_31805 ) ) ( not ( = ?auto_31803 ?auto_31806 ) ) ( not ( = ?auto_31803 ?auto_31807 ) ) ( not ( = ?auto_31804 ?auto_31805 ) ) ( not ( = ?auto_31804 ?auto_31806 ) ) ( not ( = ?auto_31804 ?auto_31807 ) ) ( not ( = ?auto_31805 ?auto_31806 ) ) ( not ( = ?auto_31805 ?auto_31807 ) ) ( not ( = ?auto_31806 ?auto_31807 ) ) ( ON ?auto_31805 ?auto_31806 ) ( ON ?auto_31804 ?auto_31805 ) ( ON ?auto_31803 ?auto_31804 ) ( CLEAR ?auto_31803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31803 )
      ( MAKE-4PILE ?auto_31803 ?auto_31804 ?auto_31805 ?auto_31806 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31812 - BLOCK
      ?auto_31813 - BLOCK
      ?auto_31814 - BLOCK
      ?auto_31815 - BLOCK
    )
    :vars
    (
      ?auto_31816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31815 ?auto_31816 ) ( not ( = ?auto_31812 ?auto_31813 ) ) ( not ( = ?auto_31812 ?auto_31814 ) ) ( not ( = ?auto_31812 ?auto_31815 ) ) ( not ( = ?auto_31812 ?auto_31816 ) ) ( not ( = ?auto_31813 ?auto_31814 ) ) ( not ( = ?auto_31813 ?auto_31815 ) ) ( not ( = ?auto_31813 ?auto_31816 ) ) ( not ( = ?auto_31814 ?auto_31815 ) ) ( not ( = ?auto_31814 ?auto_31816 ) ) ( not ( = ?auto_31815 ?auto_31816 ) ) ( ON ?auto_31814 ?auto_31815 ) ( ON ?auto_31813 ?auto_31814 ) ( ON ?auto_31812 ?auto_31813 ) ( CLEAR ?auto_31812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31812 )
      ( MAKE-4PILE ?auto_31812 ?auto_31813 ?auto_31814 ?auto_31815 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31822 - BLOCK
      ?auto_31823 - BLOCK
      ?auto_31824 - BLOCK
      ?auto_31825 - BLOCK
      ?auto_31826 - BLOCK
    )
    :vars
    (
      ?auto_31827 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31825 ) ( ON ?auto_31826 ?auto_31827 ) ( CLEAR ?auto_31826 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31822 ) ( ON ?auto_31823 ?auto_31822 ) ( ON ?auto_31824 ?auto_31823 ) ( ON ?auto_31825 ?auto_31824 ) ( not ( = ?auto_31822 ?auto_31823 ) ) ( not ( = ?auto_31822 ?auto_31824 ) ) ( not ( = ?auto_31822 ?auto_31825 ) ) ( not ( = ?auto_31822 ?auto_31826 ) ) ( not ( = ?auto_31822 ?auto_31827 ) ) ( not ( = ?auto_31823 ?auto_31824 ) ) ( not ( = ?auto_31823 ?auto_31825 ) ) ( not ( = ?auto_31823 ?auto_31826 ) ) ( not ( = ?auto_31823 ?auto_31827 ) ) ( not ( = ?auto_31824 ?auto_31825 ) ) ( not ( = ?auto_31824 ?auto_31826 ) ) ( not ( = ?auto_31824 ?auto_31827 ) ) ( not ( = ?auto_31825 ?auto_31826 ) ) ( not ( = ?auto_31825 ?auto_31827 ) ) ( not ( = ?auto_31826 ?auto_31827 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31826 ?auto_31827 )
      ( !STACK ?auto_31826 ?auto_31825 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31833 - BLOCK
      ?auto_31834 - BLOCK
      ?auto_31835 - BLOCK
      ?auto_31836 - BLOCK
      ?auto_31837 - BLOCK
    )
    :vars
    (
      ?auto_31838 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31836 ) ( ON ?auto_31837 ?auto_31838 ) ( CLEAR ?auto_31837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31833 ) ( ON ?auto_31834 ?auto_31833 ) ( ON ?auto_31835 ?auto_31834 ) ( ON ?auto_31836 ?auto_31835 ) ( not ( = ?auto_31833 ?auto_31834 ) ) ( not ( = ?auto_31833 ?auto_31835 ) ) ( not ( = ?auto_31833 ?auto_31836 ) ) ( not ( = ?auto_31833 ?auto_31837 ) ) ( not ( = ?auto_31833 ?auto_31838 ) ) ( not ( = ?auto_31834 ?auto_31835 ) ) ( not ( = ?auto_31834 ?auto_31836 ) ) ( not ( = ?auto_31834 ?auto_31837 ) ) ( not ( = ?auto_31834 ?auto_31838 ) ) ( not ( = ?auto_31835 ?auto_31836 ) ) ( not ( = ?auto_31835 ?auto_31837 ) ) ( not ( = ?auto_31835 ?auto_31838 ) ) ( not ( = ?auto_31836 ?auto_31837 ) ) ( not ( = ?auto_31836 ?auto_31838 ) ) ( not ( = ?auto_31837 ?auto_31838 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31837 ?auto_31838 )
      ( !STACK ?auto_31837 ?auto_31836 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31844 - BLOCK
      ?auto_31845 - BLOCK
      ?auto_31846 - BLOCK
      ?auto_31847 - BLOCK
      ?auto_31848 - BLOCK
    )
    :vars
    (
      ?auto_31849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31848 ?auto_31849 ) ( ON-TABLE ?auto_31844 ) ( ON ?auto_31845 ?auto_31844 ) ( ON ?auto_31846 ?auto_31845 ) ( not ( = ?auto_31844 ?auto_31845 ) ) ( not ( = ?auto_31844 ?auto_31846 ) ) ( not ( = ?auto_31844 ?auto_31847 ) ) ( not ( = ?auto_31844 ?auto_31848 ) ) ( not ( = ?auto_31844 ?auto_31849 ) ) ( not ( = ?auto_31845 ?auto_31846 ) ) ( not ( = ?auto_31845 ?auto_31847 ) ) ( not ( = ?auto_31845 ?auto_31848 ) ) ( not ( = ?auto_31845 ?auto_31849 ) ) ( not ( = ?auto_31846 ?auto_31847 ) ) ( not ( = ?auto_31846 ?auto_31848 ) ) ( not ( = ?auto_31846 ?auto_31849 ) ) ( not ( = ?auto_31847 ?auto_31848 ) ) ( not ( = ?auto_31847 ?auto_31849 ) ) ( not ( = ?auto_31848 ?auto_31849 ) ) ( CLEAR ?auto_31846 ) ( ON ?auto_31847 ?auto_31848 ) ( CLEAR ?auto_31847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31844 ?auto_31845 ?auto_31846 ?auto_31847 )
      ( MAKE-5PILE ?auto_31844 ?auto_31845 ?auto_31846 ?auto_31847 ?auto_31848 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31855 - BLOCK
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
    ( and ( ON ?auto_31859 ?auto_31860 ) ( ON-TABLE ?auto_31855 ) ( ON ?auto_31856 ?auto_31855 ) ( ON ?auto_31857 ?auto_31856 ) ( not ( = ?auto_31855 ?auto_31856 ) ) ( not ( = ?auto_31855 ?auto_31857 ) ) ( not ( = ?auto_31855 ?auto_31858 ) ) ( not ( = ?auto_31855 ?auto_31859 ) ) ( not ( = ?auto_31855 ?auto_31860 ) ) ( not ( = ?auto_31856 ?auto_31857 ) ) ( not ( = ?auto_31856 ?auto_31858 ) ) ( not ( = ?auto_31856 ?auto_31859 ) ) ( not ( = ?auto_31856 ?auto_31860 ) ) ( not ( = ?auto_31857 ?auto_31858 ) ) ( not ( = ?auto_31857 ?auto_31859 ) ) ( not ( = ?auto_31857 ?auto_31860 ) ) ( not ( = ?auto_31858 ?auto_31859 ) ) ( not ( = ?auto_31858 ?auto_31860 ) ) ( not ( = ?auto_31859 ?auto_31860 ) ) ( CLEAR ?auto_31857 ) ( ON ?auto_31858 ?auto_31859 ) ( CLEAR ?auto_31858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31855 ?auto_31856 ?auto_31857 ?auto_31858 )
      ( MAKE-5PILE ?auto_31855 ?auto_31856 ?auto_31857 ?auto_31858 ?auto_31859 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31866 - BLOCK
      ?auto_31867 - BLOCK
      ?auto_31868 - BLOCK
      ?auto_31869 - BLOCK
      ?auto_31870 - BLOCK
    )
    :vars
    (
      ?auto_31871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31870 ?auto_31871 ) ( ON-TABLE ?auto_31866 ) ( ON ?auto_31867 ?auto_31866 ) ( not ( = ?auto_31866 ?auto_31867 ) ) ( not ( = ?auto_31866 ?auto_31868 ) ) ( not ( = ?auto_31866 ?auto_31869 ) ) ( not ( = ?auto_31866 ?auto_31870 ) ) ( not ( = ?auto_31866 ?auto_31871 ) ) ( not ( = ?auto_31867 ?auto_31868 ) ) ( not ( = ?auto_31867 ?auto_31869 ) ) ( not ( = ?auto_31867 ?auto_31870 ) ) ( not ( = ?auto_31867 ?auto_31871 ) ) ( not ( = ?auto_31868 ?auto_31869 ) ) ( not ( = ?auto_31868 ?auto_31870 ) ) ( not ( = ?auto_31868 ?auto_31871 ) ) ( not ( = ?auto_31869 ?auto_31870 ) ) ( not ( = ?auto_31869 ?auto_31871 ) ) ( not ( = ?auto_31870 ?auto_31871 ) ) ( ON ?auto_31869 ?auto_31870 ) ( CLEAR ?auto_31867 ) ( ON ?auto_31868 ?auto_31869 ) ( CLEAR ?auto_31868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31866 ?auto_31867 ?auto_31868 )
      ( MAKE-5PILE ?auto_31866 ?auto_31867 ?auto_31868 ?auto_31869 ?auto_31870 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31877 - BLOCK
      ?auto_31878 - BLOCK
      ?auto_31879 - BLOCK
      ?auto_31880 - BLOCK
      ?auto_31881 - BLOCK
    )
    :vars
    (
      ?auto_31882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31881 ?auto_31882 ) ( ON-TABLE ?auto_31877 ) ( ON ?auto_31878 ?auto_31877 ) ( not ( = ?auto_31877 ?auto_31878 ) ) ( not ( = ?auto_31877 ?auto_31879 ) ) ( not ( = ?auto_31877 ?auto_31880 ) ) ( not ( = ?auto_31877 ?auto_31881 ) ) ( not ( = ?auto_31877 ?auto_31882 ) ) ( not ( = ?auto_31878 ?auto_31879 ) ) ( not ( = ?auto_31878 ?auto_31880 ) ) ( not ( = ?auto_31878 ?auto_31881 ) ) ( not ( = ?auto_31878 ?auto_31882 ) ) ( not ( = ?auto_31879 ?auto_31880 ) ) ( not ( = ?auto_31879 ?auto_31881 ) ) ( not ( = ?auto_31879 ?auto_31882 ) ) ( not ( = ?auto_31880 ?auto_31881 ) ) ( not ( = ?auto_31880 ?auto_31882 ) ) ( not ( = ?auto_31881 ?auto_31882 ) ) ( ON ?auto_31880 ?auto_31881 ) ( CLEAR ?auto_31878 ) ( ON ?auto_31879 ?auto_31880 ) ( CLEAR ?auto_31879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31877 ?auto_31878 ?auto_31879 )
      ( MAKE-5PILE ?auto_31877 ?auto_31878 ?auto_31879 ?auto_31880 ?auto_31881 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31888 - BLOCK
      ?auto_31889 - BLOCK
      ?auto_31890 - BLOCK
      ?auto_31891 - BLOCK
      ?auto_31892 - BLOCK
    )
    :vars
    (
      ?auto_31893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31892 ?auto_31893 ) ( ON-TABLE ?auto_31888 ) ( not ( = ?auto_31888 ?auto_31889 ) ) ( not ( = ?auto_31888 ?auto_31890 ) ) ( not ( = ?auto_31888 ?auto_31891 ) ) ( not ( = ?auto_31888 ?auto_31892 ) ) ( not ( = ?auto_31888 ?auto_31893 ) ) ( not ( = ?auto_31889 ?auto_31890 ) ) ( not ( = ?auto_31889 ?auto_31891 ) ) ( not ( = ?auto_31889 ?auto_31892 ) ) ( not ( = ?auto_31889 ?auto_31893 ) ) ( not ( = ?auto_31890 ?auto_31891 ) ) ( not ( = ?auto_31890 ?auto_31892 ) ) ( not ( = ?auto_31890 ?auto_31893 ) ) ( not ( = ?auto_31891 ?auto_31892 ) ) ( not ( = ?auto_31891 ?auto_31893 ) ) ( not ( = ?auto_31892 ?auto_31893 ) ) ( ON ?auto_31891 ?auto_31892 ) ( ON ?auto_31890 ?auto_31891 ) ( CLEAR ?auto_31888 ) ( ON ?auto_31889 ?auto_31890 ) ( CLEAR ?auto_31889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31888 ?auto_31889 )
      ( MAKE-5PILE ?auto_31888 ?auto_31889 ?auto_31890 ?auto_31891 ?auto_31892 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31899 - BLOCK
      ?auto_31900 - BLOCK
      ?auto_31901 - BLOCK
      ?auto_31902 - BLOCK
      ?auto_31903 - BLOCK
    )
    :vars
    (
      ?auto_31904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31903 ?auto_31904 ) ( ON-TABLE ?auto_31899 ) ( not ( = ?auto_31899 ?auto_31900 ) ) ( not ( = ?auto_31899 ?auto_31901 ) ) ( not ( = ?auto_31899 ?auto_31902 ) ) ( not ( = ?auto_31899 ?auto_31903 ) ) ( not ( = ?auto_31899 ?auto_31904 ) ) ( not ( = ?auto_31900 ?auto_31901 ) ) ( not ( = ?auto_31900 ?auto_31902 ) ) ( not ( = ?auto_31900 ?auto_31903 ) ) ( not ( = ?auto_31900 ?auto_31904 ) ) ( not ( = ?auto_31901 ?auto_31902 ) ) ( not ( = ?auto_31901 ?auto_31903 ) ) ( not ( = ?auto_31901 ?auto_31904 ) ) ( not ( = ?auto_31902 ?auto_31903 ) ) ( not ( = ?auto_31902 ?auto_31904 ) ) ( not ( = ?auto_31903 ?auto_31904 ) ) ( ON ?auto_31902 ?auto_31903 ) ( ON ?auto_31901 ?auto_31902 ) ( CLEAR ?auto_31899 ) ( ON ?auto_31900 ?auto_31901 ) ( CLEAR ?auto_31900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31899 ?auto_31900 )
      ( MAKE-5PILE ?auto_31899 ?auto_31900 ?auto_31901 ?auto_31902 ?auto_31903 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31910 - BLOCK
      ?auto_31911 - BLOCK
      ?auto_31912 - BLOCK
      ?auto_31913 - BLOCK
      ?auto_31914 - BLOCK
    )
    :vars
    (
      ?auto_31915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31914 ?auto_31915 ) ( not ( = ?auto_31910 ?auto_31911 ) ) ( not ( = ?auto_31910 ?auto_31912 ) ) ( not ( = ?auto_31910 ?auto_31913 ) ) ( not ( = ?auto_31910 ?auto_31914 ) ) ( not ( = ?auto_31910 ?auto_31915 ) ) ( not ( = ?auto_31911 ?auto_31912 ) ) ( not ( = ?auto_31911 ?auto_31913 ) ) ( not ( = ?auto_31911 ?auto_31914 ) ) ( not ( = ?auto_31911 ?auto_31915 ) ) ( not ( = ?auto_31912 ?auto_31913 ) ) ( not ( = ?auto_31912 ?auto_31914 ) ) ( not ( = ?auto_31912 ?auto_31915 ) ) ( not ( = ?auto_31913 ?auto_31914 ) ) ( not ( = ?auto_31913 ?auto_31915 ) ) ( not ( = ?auto_31914 ?auto_31915 ) ) ( ON ?auto_31913 ?auto_31914 ) ( ON ?auto_31912 ?auto_31913 ) ( ON ?auto_31911 ?auto_31912 ) ( ON ?auto_31910 ?auto_31911 ) ( CLEAR ?auto_31910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31910 )
      ( MAKE-5PILE ?auto_31910 ?auto_31911 ?auto_31912 ?auto_31913 ?auto_31914 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31921 - BLOCK
      ?auto_31922 - BLOCK
      ?auto_31923 - BLOCK
      ?auto_31924 - BLOCK
      ?auto_31925 - BLOCK
    )
    :vars
    (
      ?auto_31926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31925 ?auto_31926 ) ( not ( = ?auto_31921 ?auto_31922 ) ) ( not ( = ?auto_31921 ?auto_31923 ) ) ( not ( = ?auto_31921 ?auto_31924 ) ) ( not ( = ?auto_31921 ?auto_31925 ) ) ( not ( = ?auto_31921 ?auto_31926 ) ) ( not ( = ?auto_31922 ?auto_31923 ) ) ( not ( = ?auto_31922 ?auto_31924 ) ) ( not ( = ?auto_31922 ?auto_31925 ) ) ( not ( = ?auto_31922 ?auto_31926 ) ) ( not ( = ?auto_31923 ?auto_31924 ) ) ( not ( = ?auto_31923 ?auto_31925 ) ) ( not ( = ?auto_31923 ?auto_31926 ) ) ( not ( = ?auto_31924 ?auto_31925 ) ) ( not ( = ?auto_31924 ?auto_31926 ) ) ( not ( = ?auto_31925 ?auto_31926 ) ) ( ON ?auto_31924 ?auto_31925 ) ( ON ?auto_31923 ?auto_31924 ) ( ON ?auto_31922 ?auto_31923 ) ( ON ?auto_31921 ?auto_31922 ) ( CLEAR ?auto_31921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31921 )
      ( MAKE-5PILE ?auto_31921 ?auto_31922 ?auto_31923 ?auto_31924 ?auto_31925 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_31933 - BLOCK
      ?auto_31934 - BLOCK
      ?auto_31935 - BLOCK
      ?auto_31936 - BLOCK
      ?auto_31937 - BLOCK
      ?auto_31938 - BLOCK
    )
    :vars
    (
      ?auto_31939 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31937 ) ( ON ?auto_31938 ?auto_31939 ) ( CLEAR ?auto_31938 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31933 ) ( ON ?auto_31934 ?auto_31933 ) ( ON ?auto_31935 ?auto_31934 ) ( ON ?auto_31936 ?auto_31935 ) ( ON ?auto_31937 ?auto_31936 ) ( not ( = ?auto_31933 ?auto_31934 ) ) ( not ( = ?auto_31933 ?auto_31935 ) ) ( not ( = ?auto_31933 ?auto_31936 ) ) ( not ( = ?auto_31933 ?auto_31937 ) ) ( not ( = ?auto_31933 ?auto_31938 ) ) ( not ( = ?auto_31933 ?auto_31939 ) ) ( not ( = ?auto_31934 ?auto_31935 ) ) ( not ( = ?auto_31934 ?auto_31936 ) ) ( not ( = ?auto_31934 ?auto_31937 ) ) ( not ( = ?auto_31934 ?auto_31938 ) ) ( not ( = ?auto_31934 ?auto_31939 ) ) ( not ( = ?auto_31935 ?auto_31936 ) ) ( not ( = ?auto_31935 ?auto_31937 ) ) ( not ( = ?auto_31935 ?auto_31938 ) ) ( not ( = ?auto_31935 ?auto_31939 ) ) ( not ( = ?auto_31936 ?auto_31937 ) ) ( not ( = ?auto_31936 ?auto_31938 ) ) ( not ( = ?auto_31936 ?auto_31939 ) ) ( not ( = ?auto_31937 ?auto_31938 ) ) ( not ( = ?auto_31937 ?auto_31939 ) ) ( not ( = ?auto_31938 ?auto_31939 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31938 ?auto_31939 )
      ( !STACK ?auto_31938 ?auto_31937 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_31946 - BLOCK
      ?auto_31947 - BLOCK
      ?auto_31948 - BLOCK
      ?auto_31949 - BLOCK
      ?auto_31950 - BLOCK
      ?auto_31951 - BLOCK
    )
    :vars
    (
      ?auto_31952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31950 ) ( ON ?auto_31951 ?auto_31952 ) ( CLEAR ?auto_31951 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31946 ) ( ON ?auto_31947 ?auto_31946 ) ( ON ?auto_31948 ?auto_31947 ) ( ON ?auto_31949 ?auto_31948 ) ( ON ?auto_31950 ?auto_31949 ) ( not ( = ?auto_31946 ?auto_31947 ) ) ( not ( = ?auto_31946 ?auto_31948 ) ) ( not ( = ?auto_31946 ?auto_31949 ) ) ( not ( = ?auto_31946 ?auto_31950 ) ) ( not ( = ?auto_31946 ?auto_31951 ) ) ( not ( = ?auto_31946 ?auto_31952 ) ) ( not ( = ?auto_31947 ?auto_31948 ) ) ( not ( = ?auto_31947 ?auto_31949 ) ) ( not ( = ?auto_31947 ?auto_31950 ) ) ( not ( = ?auto_31947 ?auto_31951 ) ) ( not ( = ?auto_31947 ?auto_31952 ) ) ( not ( = ?auto_31948 ?auto_31949 ) ) ( not ( = ?auto_31948 ?auto_31950 ) ) ( not ( = ?auto_31948 ?auto_31951 ) ) ( not ( = ?auto_31948 ?auto_31952 ) ) ( not ( = ?auto_31949 ?auto_31950 ) ) ( not ( = ?auto_31949 ?auto_31951 ) ) ( not ( = ?auto_31949 ?auto_31952 ) ) ( not ( = ?auto_31950 ?auto_31951 ) ) ( not ( = ?auto_31950 ?auto_31952 ) ) ( not ( = ?auto_31951 ?auto_31952 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31951 ?auto_31952 )
      ( !STACK ?auto_31951 ?auto_31950 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_31959 - BLOCK
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
    ( and ( ON ?auto_31964 ?auto_31965 ) ( ON-TABLE ?auto_31959 ) ( ON ?auto_31960 ?auto_31959 ) ( ON ?auto_31961 ?auto_31960 ) ( ON ?auto_31962 ?auto_31961 ) ( not ( = ?auto_31959 ?auto_31960 ) ) ( not ( = ?auto_31959 ?auto_31961 ) ) ( not ( = ?auto_31959 ?auto_31962 ) ) ( not ( = ?auto_31959 ?auto_31963 ) ) ( not ( = ?auto_31959 ?auto_31964 ) ) ( not ( = ?auto_31959 ?auto_31965 ) ) ( not ( = ?auto_31960 ?auto_31961 ) ) ( not ( = ?auto_31960 ?auto_31962 ) ) ( not ( = ?auto_31960 ?auto_31963 ) ) ( not ( = ?auto_31960 ?auto_31964 ) ) ( not ( = ?auto_31960 ?auto_31965 ) ) ( not ( = ?auto_31961 ?auto_31962 ) ) ( not ( = ?auto_31961 ?auto_31963 ) ) ( not ( = ?auto_31961 ?auto_31964 ) ) ( not ( = ?auto_31961 ?auto_31965 ) ) ( not ( = ?auto_31962 ?auto_31963 ) ) ( not ( = ?auto_31962 ?auto_31964 ) ) ( not ( = ?auto_31962 ?auto_31965 ) ) ( not ( = ?auto_31963 ?auto_31964 ) ) ( not ( = ?auto_31963 ?auto_31965 ) ) ( not ( = ?auto_31964 ?auto_31965 ) ) ( CLEAR ?auto_31962 ) ( ON ?auto_31963 ?auto_31964 ) ( CLEAR ?auto_31963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31959 ?auto_31960 ?auto_31961 ?auto_31962 ?auto_31963 )
      ( MAKE-6PILE ?auto_31959 ?auto_31960 ?auto_31961 ?auto_31962 ?auto_31963 ?auto_31964 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_31972 - BLOCK
      ?auto_31973 - BLOCK
      ?auto_31974 - BLOCK
      ?auto_31975 - BLOCK
      ?auto_31976 - BLOCK
      ?auto_31977 - BLOCK
    )
    :vars
    (
      ?auto_31978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31977 ?auto_31978 ) ( ON-TABLE ?auto_31972 ) ( ON ?auto_31973 ?auto_31972 ) ( ON ?auto_31974 ?auto_31973 ) ( ON ?auto_31975 ?auto_31974 ) ( not ( = ?auto_31972 ?auto_31973 ) ) ( not ( = ?auto_31972 ?auto_31974 ) ) ( not ( = ?auto_31972 ?auto_31975 ) ) ( not ( = ?auto_31972 ?auto_31976 ) ) ( not ( = ?auto_31972 ?auto_31977 ) ) ( not ( = ?auto_31972 ?auto_31978 ) ) ( not ( = ?auto_31973 ?auto_31974 ) ) ( not ( = ?auto_31973 ?auto_31975 ) ) ( not ( = ?auto_31973 ?auto_31976 ) ) ( not ( = ?auto_31973 ?auto_31977 ) ) ( not ( = ?auto_31973 ?auto_31978 ) ) ( not ( = ?auto_31974 ?auto_31975 ) ) ( not ( = ?auto_31974 ?auto_31976 ) ) ( not ( = ?auto_31974 ?auto_31977 ) ) ( not ( = ?auto_31974 ?auto_31978 ) ) ( not ( = ?auto_31975 ?auto_31976 ) ) ( not ( = ?auto_31975 ?auto_31977 ) ) ( not ( = ?auto_31975 ?auto_31978 ) ) ( not ( = ?auto_31976 ?auto_31977 ) ) ( not ( = ?auto_31976 ?auto_31978 ) ) ( not ( = ?auto_31977 ?auto_31978 ) ) ( CLEAR ?auto_31975 ) ( ON ?auto_31976 ?auto_31977 ) ( CLEAR ?auto_31976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31972 ?auto_31973 ?auto_31974 ?auto_31975 ?auto_31976 )
      ( MAKE-6PILE ?auto_31972 ?auto_31973 ?auto_31974 ?auto_31975 ?auto_31976 ?auto_31977 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_31985 - BLOCK
      ?auto_31986 - BLOCK
      ?auto_31987 - BLOCK
      ?auto_31988 - BLOCK
      ?auto_31989 - BLOCK
      ?auto_31990 - BLOCK
    )
    :vars
    (
      ?auto_31991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31990 ?auto_31991 ) ( ON-TABLE ?auto_31985 ) ( ON ?auto_31986 ?auto_31985 ) ( ON ?auto_31987 ?auto_31986 ) ( not ( = ?auto_31985 ?auto_31986 ) ) ( not ( = ?auto_31985 ?auto_31987 ) ) ( not ( = ?auto_31985 ?auto_31988 ) ) ( not ( = ?auto_31985 ?auto_31989 ) ) ( not ( = ?auto_31985 ?auto_31990 ) ) ( not ( = ?auto_31985 ?auto_31991 ) ) ( not ( = ?auto_31986 ?auto_31987 ) ) ( not ( = ?auto_31986 ?auto_31988 ) ) ( not ( = ?auto_31986 ?auto_31989 ) ) ( not ( = ?auto_31986 ?auto_31990 ) ) ( not ( = ?auto_31986 ?auto_31991 ) ) ( not ( = ?auto_31987 ?auto_31988 ) ) ( not ( = ?auto_31987 ?auto_31989 ) ) ( not ( = ?auto_31987 ?auto_31990 ) ) ( not ( = ?auto_31987 ?auto_31991 ) ) ( not ( = ?auto_31988 ?auto_31989 ) ) ( not ( = ?auto_31988 ?auto_31990 ) ) ( not ( = ?auto_31988 ?auto_31991 ) ) ( not ( = ?auto_31989 ?auto_31990 ) ) ( not ( = ?auto_31989 ?auto_31991 ) ) ( not ( = ?auto_31990 ?auto_31991 ) ) ( ON ?auto_31989 ?auto_31990 ) ( CLEAR ?auto_31987 ) ( ON ?auto_31988 ?auto_31989 ) ( CLEAR ?auto_31988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31985 ?auto_31986 ?auto_31987 ?auto_31988 )
      ( MAKE-6PILE ?auto_31985 ?auto_31986 ?auto_31987 ?auto_31988 ?auto_31989 ?auto_31990 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_31998 - BLOCK
      ?auto_31999 - BLOCK
      ?auto_32000 - BLOCK
      ?auto_32001 - BLOCK
      ?auto_32002 - BLOCK
      ?auto_32003 - BLOCK
    )
    :vars
    (
      ?auto_32004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32003 ?auto_32004 ) ( ON-TABLE ?auto_31998 ) ( ON ?auto_31999 ?auto_31998 ) ( ON ?auto_32000 ?auto_31999 ) ( not ( = ?auto_31998 ?auto_31999 ) ) ( not ( = ?auto_31998 ?auto_32000 ) ) ( not ( = ?auto_31998 ?auto_32001 ) ) ( not ( = ?auto_31998 ?auto_32002 ) ) ( not ( = ?auto_31998 ?auto_32003 ) ) ( not ( = ?auto_31998 ?auto_32004 ) ) ( not ( = ?auto_31999 ?auto_32000 ) ) ( not ( = ?auto_31999 ?auto_32001 ) ) ( not ( = ?auto_31999 ?auto_32002 ) ) ( not ( = ?auto_31999 ?auto_32003 ) ) ( not ( = ?auto_31999 ?auto_32004 ) ) ( not ( = ?auto_32000 ?auto_32001 ) ) ( not ( = ?auto_32000 ?auto_32002 ) ) ( not ( = ?auto_32000 ?auto_32003 ) ) ( not ( = ?auto_32000 ?auto_32004 ) ) ( not ( = ?auto_32001 ?auto_32002 ) ) ( not ( = ?auto_32001 ?auto_32003 ) ) ( not ( = ?auto_32001 ?auto_32004 ) ) ( not ( = ?auto_32002 ?auto_32003 ) ) ( not ( = ?auto_32002 ?auto_32004 ) ) ( not ( = ?auto_32003 ?auto_32004 ) ) ( ON ?auto_32002 ?auto_32003 ) ( CLEAR ?auto_32000 ) ( ON ?auto_32001 ?auto_32002 ) ( CLEAR ?auto_32001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31998 ?auto_31999 ?auto_32000 ?auto_32001 )
      ( MAKE-6PILE ?auto_31998 ?auto_31999 ?auto_32000 ?auto_32001 ?auto_32002 ?auto_32003 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_32011 - BLOCK
      ?auto_32012 - BLOCK
      ?auto_32013 - BLOCK
      ?auto_32014 - BLOCK
      ?auto_32015 - BLOCK
      ?auto_32016 - BLOCK
    )
    :vars
    (
      ?auto_32017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32016 ?auto_32017 ) ( ON-TABLE ?auto_32011 ) ( ON ?auto_32012 ?auto_32011 ) ( not ( = ?auto_32011 ?auto_32012 ) ) ( not ( = ?auto_32011 ?auto_32013 ) ) ( not ( = ?auto_32011 ?auto_32014 ) ) ( not ( = ?auto_32011 ?auto_32015 ) ) ( not ( = ?auto_32011 ?auto_32016 ) ) ( not ( = ?auto_32011 ?auto_32017 ) ) ( not ( = ?auto_32012 ?auto_32013 ) ) ( not ( = ?auto_32012 ?auto_32014 ) ) ( not ( = ?auto_32012 ?auto_32015 ) ) ( not ( = ?auto_32012 ?auto_32016 ) ) ( not ( = ?auto_32012 ?auto_32017 ) ) ( not ( = ?auto_32013 ?auto_32014 ) ) ( not ( = ?auto_32013 ?auto_32015 ) ) ( not ( = ?auto_32013 ?auto_32016 ) ) ( not ( = ?auto_32013 ?auto_32017 ) ) ( not ( = ?auto_32014 ?auto_32015 ) ) ( not ( = ?auto_32014 ?auto_32016 ) ) ( not ( = ?auto_32014 ?auto_32017 ) ) ( not ( = ?auto_32015 ?auto_32016 ) ) ( not ( = ?auto_32015 ?auto_32017 ) ) ( not ( = ?auto_32016 ?auto_32017 ) ) ( ON ?auto_32015 ?auto_32016 ) ( ON ?auto_32014 ?auto_32015 ) ( CLEAR ?auto_32012 ) ( ON ?auto_32013 ?auto_32014 ) ( CLEAR ?auto_32013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32011 ?auto_32012 ?auto_32013 )
      ( MAKE-6PILE ?auto_32011 ?auto_32012 ?auto_32013 ?auto_32014 ?auto_32015 ?auto_32016 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_32024 - BLOCK
      ?auto_32025 - BLOCK
      ?auto_32026 - BLOCK
      ?auto_32027 - BLOCK
      ?auto_32028 - BLOCK
      ?auto_32029 - BLOCK
    )
    :vars
    (
      ?auto_32030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32029 ?auto_32030 ) ( ON-TABLE ?auto_32024 ) ( ON ?auto_32025 ?auto_32024 ) ( not ( = ?auto_32024 ?auto_32025 ) ) ( not ( = ?auto_32024 ?auto_32026 ) ) ( not ( = ?auto_32024 ?auto_32027 ) ) ( not ( = ?auto_32024 ?auto_32028 ) ) ( not ( = ?auto_32024 ?auto_32029 ) ) ( not ( = ?auto_32024 ?auto_32030 ) ) ( not ( = ?auto_32025 ?auto_32026 ) ) ( not ( = ?auto_32025 ?auto_32027 ) ) ( not ( = ?auto_32025 ?auto_32028 ) ) ( not ( = ?auto_32025 ?auto_32029 ) ) ( not ( = ?auto_32025 ?auto_32030 ) ) ( not ( = ?auto_32026 ?auto_32027 ) ) ( not ( = ?auto_32026 ?auto_32028 ) ) ( not ( = ?auto_32026 ?auto_32029 ) ) ( not ( = ?auto_32026 ?auto_32030 ) ) ( not ( = ?auto_32027 ?auto_32028 ) ) ( not ( = ?auto_32027 ?auto_32029 ) ) ( not ( = ?auto_32027 ?auto_32030 ) ) ( not ( = ?auto_32028 ?auto_32029 ) ) ( not ( = ?auto_32028 ?auto_32030 ) ) ( not ( = ?auto_32029 ?auto_32030 ) ) ( ON ?auto_32028 ?auto_32029 ) ( ON ?auto_32027 ?auto_32028 ) ( CLEAR ?auto_32025 ) ( ON ?auto_32026 ?auto_32027 ) ( CLEAR ?auto_32026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32024 ?auto_32025 ?auto_32026 )
      ( MAKE-6PILE ?auto_32024 ?auto_32025 ?auto_32026 ?auto_32027 ?auto_32028 ?auto_32029 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_32037 - BLOCK
      ?auto_32038 - BLOCK
      ?auto_32039 - BLOCK
      ?auto_32040 - BLOCK
      ?auto_32041 - BLOCK
      ?auto_32042 - BLOCK
    )
    :vars
    (
      ?auto_32043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32042 ?auto_32043 ) ( ON-TABLE ?auto_32037 ) ( not ( = ?auto_32037 ?auto_32038 ) ) ( not ( = ?auto_32037 ?auto_32039 ) ) ( not ( = ?auto_32037 ?auto_32040 ) ) ( not ( = ?auto_32037 ?auto_32041 ) ) ( not ( = ?auto_32037 ?auto_32042 ) ) ( not ( = ?auto_32037 ?auto_32043 ) ) ( not ( = ?auto_32038 ?auto_32039 ) ) ( not ( = ?auto_32038 ?auto_32040 ) ) ( not ( = ?auto_32038 ?auto_32041 ) ) ( not ( = ?auto_32038 ?auto_32042 ) ) ( not ( = ?auto_32038 ?auto_32043 ) ) ( not ( = ?auto_32039 ?auto_32040 ) ) ( not ( = ?auto_32039 ?auto_32041 ) ) ( not ( = ?auto_32039 ?auto_32042 ) ) ( not ( = ?auto_32039 ?auto_32043 ) ) ( not ( = ?auto_32040 ?auto_32041 ) ) ( not ( = ?auto_32040 ?auto_32042 ) ) ( not ( = ?auto_32040 ?auto_32043 ) ) ( not ( = ?auto_32041 ?auto_32042 ) ) ( not ( = ?auto_32041 ?auto_32043 ) ) ( not ( = ?auto_32042 ?auto_32043 ) ) ( ON ?auto_32041 ?auto_32042 ) ( ON ?auto_32040 ?auto_32041 ) ( ON ?auto_32039 ?auto_32040 ) ( CLEAR ?auto_32037 ) ( ON ?auto_32038 ?auto_32039 ) ( CLEAR ?auto_32038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32037 ?auto_32038 )
      ( MAKE-6PILE ?auto_32037 ?auto_32038 ?auto_32039 ?auto_32040 ?auto_32041 ?auto_32042 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_32050 - BLOCK
      ?auto_32051 - BLOCK
      ?auto_32052 - BLOCK
      ?auto_32053 - BLOCK
      ?auto_32054 - BLOCK
      ?auto_32055 - BLOCK
    )
    :vars
    (
      ?auto_32056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32055 ?auto_32056 ) ( ON-TABLE ?auto_32050 ) ( not ( = ?auto_32050 ?auto_32051 ) ) ( not ( = ?auto_32050 ?auto_32052 ) ) ( not ( = ?auto_32050 ?auto_32053 ) ) ( not ( = ?auto_32050 ?auto_32054 ) ) ( not ( = ?auto_32050 ?auto_32055 ) ) ( not ( = ?auto_32050 ?auto_32056 ) ) ( not ( = ?auto_32051 ?auto_32052 ) ) ( not ( = ?auto_32051 ?auto_32053 ) ) ( not ( = ?auto_32051 ?auto_32054 ) ) ( not ( = ?auto_32051 ?auto_32055 ) ) ( not ( = ?auto_32051 ?auto_32056 ) ) ( not ( = ?auto_32052 ?auto_32053 ) ) ( not ( = ?auto_32052 ?auto_32054 ) ) ( not ( = ?auto_32052 ?auto_32055 ) ) ( not ( = ?auto_32052 ?auto_32056 ) ) ( not ( = ?auto_32053 ?auto_32054 ) ) ( not ( = ?auto_32053 ?auto_32055 ) ) ( not ( = ?auto_32053 ?auto_32056 ) ) ( not ( = ?auto_32054 ?auto_32055 ) ) ( not ( = ?auto_32054 ?auto_32056 ) ) ( not ( = ?auto_32055 ?auto_32056 ) ) ( ON ?auto_32054 ?auto_32055 ) ( ON ?auto_32053 ?auto_32054 ) ( ON ?auto_32052 ?auto_32053 ) ( CLEAR ?auto_32050 ) ( ON ?auto_32051 ?auto_32052 ) ( CLEAR ?auto_32051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32050 ?auto_32051 )
      ( MAKE-6PILE ?auto_32050 ?auto_32051 ?auto_32052 ?auto_32053 ?auto_32054 ?auto_32055 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_32063 - BLOCK
      ?auto_32064 - BLOCK
      ?auto_32065 - BLOCK
      ?auto_32066 - BLOCK
      ?auto_32067 - BLOCK
      ?auto_32068 - BLOCK
    )
    :vars
    (
      ?auto_32069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32068 ?auto_32069 ) ( not ( = ?auto_32063 ?auto_32064 ) ) ( not ( = ?auto_32063 ?auto_32065 ) ) ( not ( = ?auto_32063 ?auto_32066 ) ) ( not ( = ?auto_32063 ?auto_32067 ) ) ( not ( = ?auto_32063 ?auto_32068 ) ) ( not ( = ?auto_32063 ?auto_32069 ) ) ( not ( = ?auto_32064 ?auto_32065 ) ) ( not ( = ?auto_32064 ?auto_32066 ) ) ( not ( = ?auto_32064 ?auto_32067 ) ) ( not ( = ?auto_32064 ?auto_32068 ) ) ( not ( = ?auto_32064 ?auto_32069 ) ) ( not ( = ?auto_32065 ?auto_32066 ) ) ( not ( = ?auto_32065 ?auto_32067 ) ) ( not ( = ?auto_32065 ?auto_32068 ) ) ( not ( = ?auto_32065 ?auto_32069 ) ) ( not ( = ?auto_32066 ?auto_32067 ) ) ( not ( = ?auto_32066 ?auto_32068 ) ) ( not ( = ?auto_32066 ?auto_32069 ) ) ( not ( = ?auto_32067 ?auto_32068 ) ) ( not ( = ?auto_32067 ?auto_32069 ) ) ( not ( = ?auto_32068 ?auto_32069 ) ) ( ON ?auto_32067 ?auto_32068 ) ( ON ?auto_32066 ?auto_32067 ) ( ON ?auto_32065 ?auto_32066 ) ( ON ?auto_32064 ?auto_32065 ) ( ON ?auto_32063 ?auto_32064 ) ( CLEAR ?auto_32063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32063 )
      ( MAKE-6PILE ?auto_32063 ?auto_32064 ?auto_32065 ?auto_32066 ?auto_32067 ?auto_32068 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_32076 - BLOCK
      ?auto_32077 - BLOCK
      ?auto_32078 - BLOCK
      ?auto_32079 - BLOCK
      ?auto_32080 - BLOCK
      ?auto_32081 - BLOCK
    )
    :vars
    (
      ?auto_32082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32081 ?auto_32082 ) ( not ( = ?auto_32076 ?auto_32077 ) ) ( not ( = ?auto_32076 ?auto_32078 ) ) ( not ( = ?auto_32076 ?auto_32079 ) ) ( not ( = ?auto_32076 ?auto_32080 ) ) ( not ( = ?auto_32076 ?auto_32081 ) ) ( not ( = ?auto_32076 ?auto_32082 ) ) ( not ( = ?auto_32077 ?auto_32078 ) ) ( not ( = ?auto_32077 ?auto_32079 ) ) ( not ( = ?auto_32077 ?auto_32080 ) ) ( not ( = ?auto_32077 ?auto_32081 ) ) ( not ( = ?auto_32077 ?auto_32082 ) ) ( not ( = ?auto_32078 ?auto_32079 ) ) ( not ( = ?auto_32078 ?auto_32080 ) ) ( not ( = ?auto_32078 ?auto_32081 ) ) ( not ( = ?auto_32078 ?auto_32082 ) ) ( not ( = ?auto_32079 ?auto_32080 ) ) ( not ( = ?auto_32079 ?auto_32081 ) ) ( not ( = ?auto_32079 ?auto_32082 ) ) ( not ( = ?auto_32080 ?auto_32081 ) ) ( not ( = ?auto_32080 ?auto_32082 ) ) ( not ( = ?auto_32081 ?auto_32082 ) ) ( ON ?auto_32080 ?auto_32081 ) ( ON ?auto_32079 ?auto_32080 ) ( ON ?auto_32078 ?auto_32079 ) ( ON ?auto_32077 ?auto_32078 ) ( ON ?auto_32076 ?auto_32077 ) ( CLEAR ?auto_32076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32076 )
      ( MAKE-6PILE ?auto_32076 ?auto_32077 ?auto_32078 ?auto_32079 ?auto_32080 ?auto_32081 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_32090 - BLOCK
      ?auto_32091 - BLOCK
      ?auto_32092 - BLOCK
      ?auto_32093 - BLOCK
      ?auto_32094 - BLOCK
      ?auto_32095 - BLOCK
      ?auto_32096 - BLOCK
    )
    :vars
    (
      ?auto_32097 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32095 ) ( ON ?auto_32096 ?auto_32097 ) ( CLEAR ?auto_32096 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32090 ) ( ON ?auto_32091 ?auto_32090 ) ( ON ?auto_32092 ?auto_32091 ) ( ON ?auto_32093 ?auto_32092 ) ( ON ?auto_32094 ?auto_32093 ) ( ON ?auto_32095 ?auto_32094 ) ( not ( = ?auto_32090 ?auto_32091 ) ) ( not ( = ?auto_32090 ?auto_32092 ) ) ( not ( = ?auto_32090 ?auto_32093 ) ) ( not ( = ?auto_32090 ?auto_32094 ) ) ( not ( = ?auto_32090 ?auto_32095 ) ) ( not ( = ?auto_32090 ?auto_32096 ) ) ( not ( = ?auto_32090 ?auto_32097 ) ) ( not ( = ?auto_32091 ?auto_32092 ) ) ( not ( = ?auto_32091 ?auto_32093 ) ) ( not ( = ?auto_32091 ?auto_32094 ) ) ( not ( = ?auto_32091 ?auto_32095 ) ) ( not ( = ?auto_32091 ?auto_32096 ) ) ( not ( = ?auto_32091 ?auto_32097 ) ) ( not ( = ?auto_32092 ?auto_32093 ) ) ( not ( = ?auto_32092 ?auto_32094 ) ) ( not ( = ?auto_32092 ?auto_32095 ) ) ( not ( = ?auto_32092 ?auto_32096 ) ) ( not ( = ?auto_32092 ?auto_32097 ) ) ( not ( = ?auto_32093 ?auto_32094 ) ) ( not ( = ?auto_32093 ?auto_32095 ) ) ( not ( = ?auto_32093 ?auto_32096 ) ) ( not ( = ?auto_32093 ?auto_32097 ) ) ( not ( = ?auto_32094 ?auto_32095 ) ) ( not ( = ?auto_32094 ?auto_32096 ) ) ( not ( = ?auto_32094 ?auto_32097 ) ) ( not ( = ?auto_32095 ?auto_32096 ) ) ( not ( = ?auto_32095 ?auto_32097 ) ) ( not ( = ?auto_32096 ?auto_32097 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32096 ?auto_32097 )
      ( !STACK ?auto_32096 ?auto_32095 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_32105 - BLOCK
      ?auto_32106 - BLOCK
      ?auto_32107 - BLOCK
      ?auto_32108 - BLOCK
      ?auto_32109 - BLOCK
      ?auto_32110 - BLOCK
      ?auto_32111 - BLOCK
    )
    :vars
    (
      ?auto_32112 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32110 ) ( ON ?auto_32111 ?auto_32112 ) ( CLEAR ?auto_32111 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32105 ) ( ON ?auto_32106 ?auto_32105 ) ( ON ?auto_32107 ?auto_32106 ) ( ON ?auto_32108 ?auto_32107 ) ( ON ?auto_32109 ?auto_32108 ) ( ON ?auto_32110 ?auto_32109 ) ( not ( = ?auto_32105 ?auto_32106 ) ) ( not ( = ?auto_32105 ?auto_32107 ) ) ( not ( = ?auto_32105 ?auto_32108 ) ) ( not ( = ?auto_32105 ?auto_32109 ) ) ( not ( = ?auto_32105 ?auto_32110 ) ) ( not ( = ?auto_32105 ?auto_32111 ) ) ( not ( = ?auto_32105 ?auto_32112 ) ) ( not ( = ?auto_32106 ?auto_32107 ) ) ( not ( = ?auto_32106 ?auto_32108 ) ) ( not ( = ?auto_32106 ?auto_32109 ) ) ( not ( = ?auto_32106 ?auto_32110 ) ) ( not ( = ?auto_32106 ?auto_32111 ) ) ( not ( = ?auto_32106 ?auto_32112 ) ) ( not ( = ?auto_32107 ?auto_32108 ) ) ( not ( = ?auto_32107 ?auto_32109 ) ) ( not ( = ?auto_32107 ?auto_32110 ) ) ( not ( = ?auto_32107 ?auto_32111 ) ) ( not ( = ?auto_32107 ?auto_32112 ) ) ( not ( = ?auto_32108 ?auto_32109 ) ) ( not ( = ?auto_32108 ?auto_32110 ) ) ( not ( = ?auto_32108 ?auto_32111 ) ) ( not ( = ?auto_32108 ?auto_32112 ) ) ( not ( = ?auto_32109 ?auto_32110 ) ) ( not ( = ?auto_32109 ?auto_32111 ) ) ( not ( = ?auto_32109 ?auto_32112 ) ) ( not ( = ?auto_32110 ?auto_32111 ) ) ( not ( = ?auto_32110 ?auto_32112 ) ) ( not ( = ?auto_32111 ?auto_32112 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32111 ?auto_32112 )
      ( !STACK ?auto_32111 ?auto_32110 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_32120 - BLOCK
      ?auto_32121 - BLOCK
      ?auto_32122 - BLOCK
      ?auto_32123 - BLOCK
      ?auto_32124 - BLOCK
      ?auto_32125 - BLOCK
      ?auto_32126 - BLOCK
    )
    :vars
    (
      ?auto_32127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32126 ?auto_32127 ) ( ON-TABLE ?auto_32120 ) ( ON ?auto_32121 ?auto_32120 ) ( ON ?auto_32122 ?auto_32121 ) ( ON ?auto_32123 ?auto_32122 ) ( ON ?auto_32124 ?auto_32123 ) ( not ( = ?auto_32120 ?auto_32121 ) ) ( not ( = ?auto_32120 ?auto_32122 ) ) ( not ( = ?auto_32120 ?auto_32123 ) ) ( not ( = ?auto_32120 ?auto_32124 ) ) ( not ( = ?auto_32120 ?auto_32125 ) ) ( not ( = ?auto_32120 ?auto_32126 ) ) ( not ( = ?auto_32120 ?auto_32127 ) ) ( not ( = ?auto_32121 ?auto_32122 ) ) ( not ( = ?auto_32121 ?auto_32123 ) ) ( not ( = ?auto_32121 ?auto_32124 ) ) ( not ( = ?auto_32121 ?auto_32125 ) ) ( not ( = ?auto_32121 ?auto_32126 ) ) ( not ( = ?auto_32121 ?auto_32127 ) ) ( not ( = ?auto_32122 ?auto_32123 ) ) ( not ( = ?auto_32122 ?auto_32124 ) ) ( not ( = ?auto_32122 ?auto_32125 ) ) ( not ( = ?auto_32122 ?auto_32126 ) ) ( not ( = ?auto_32122 ?auto_32127 ) ) ( not ( = ?auto_32123 ?auto_32124 ) ) ( not ( = ?auto_32123 ?auto_32125 ) ) ( not ( = ?auto_32123 ?auto_32126 ) ) ( not ( = ?auto_32123 ?auto_32127 ) ) ( not ( = ?auto_32124 ?auto_32125 ) ) ( not ( = ?auto_32124 ?auto_32126 ) ) ( not ( = ?auto_32124 ?auto_32127 ) ) ( not ( = ?auto_32125 ?auto_32126 ) ) ( not ( = ?auto_32125 ?auto_32127 ) ) ( not ( = ?auto_32126 ?auto_32127 ) ) ( CLEAR ?auto_32124 ) ( ON ?auto_32125 ?auto_32126 ) ( CLEAR ?auto_32125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_32120 ?auto_32121 ?auto_32122 ?auto_32123 ?auto_32124 ?auto_32125 )
      ( MAKE-7PILE ?auto_32120 ?auto_32121 ?auto_32122 ?auto_32123 ?auto_32124 ?auto_32125 ?auto_32126 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_32135 - BLOCK
      ?auto_32136 - BLOCK
      ?auto_32137 - BLOCK
      ?auto_32138 - BLOCK
      ?auto_32139 - BLOCK
      ?auto_32140 - BLOCK
      ?auto_32141 - BLOCK
    )
    :vars
    (
      ?auto_32142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32141 ?auto_32142 ) ( ON-TABLE ?auto_32135 ) ( ON ?auto_32136 ?auto_32135 ) ( ON ?auto_32137 ?auto_32136 ) ( ON ?auto_32138 ?auto_32137 ) ( ON ?auto_32139 ?auto_32138 ) ( not ( = ?auto_32135 ?auto_32136 ) ) ( not ( = ?auto_32135 ?auto_32137 ) ) ( not ( = ?auto_32135 ?auto_32138 ) ) ( not ( = ?auto_32135 ?auto_32139 ) ) ( not ( = ?auto_32135 ?auto_32140 ) ) ( not ( = ?auto_32135 ?auto_32141 ) ) ( not ( = ?auto_32135 ?auto_32142 ) ) ( not ( = ?auto_32136 ?auto_32137 ) ) ( not ( = ?auto_32136 ?auto_32138 ) ) ( not ( = ?auto_32136 ?auto_32139 ) ) ( not ( = ?auto_32136 ?auto_32140 ) ) ( not ( = ?auto_32136 ?auto_32141 ) ) ( not ( = ?auto_32136 ?auto_32142 ) ) ( not ( = ?auto_32137 ?auto_32138 ) ) ( not ( = ?auto_32137 ?auto_32139 ) ) ( not ( = ?auto_32137 ?auto_32140 ) ) ( not ( = ?auto_32137 ?auto_32141 ) ) ( not ( = ?auto_32137 ?auto_32142 ) ) ( not ( = ?auto_32138 ?auto_32139 ) ) ( not ( = ?auto_32138 ?auto_32140 ) ) ( not ( = ?auto_32138 ?auto_32141 ) ) ( not ( = ?auto_32138 ?auto_32142 ) ) ( not ( = ?auto_32139 ?auto_32140 ) ) ( not ( = ?auto_32139 ?auto_32141 ) ) ( not ( = ?auto_32139 ?auto_32142 ) ) ( not ( = ?auto_32140 ?auto_32141 ) ) ( not ( = ?auto_32140 ?auto_32142 ) ) ( not ( = ?auto_32141 ?auto_32142 ) ) ( CLEAR ?auto_32139 ) ( ON ?auto_32140 ?auto_32141 ) ( CLEAR ?auto_32140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_32135 ?auto_32136 ?auto_32137 ?auto_32138 ?auto_32139 ?auto_32140 )
      ( MAKE-7PILE ?auto_32135 ?auto_32136 ?auto_32137 ?auto_32138 ?auto_32139 ?auto_32140 ?auto_32141 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_32150 - BLOCK
      ?auto_32151 - BLOCK
      ?auto_32152 - BLOCK
      ?auto_32153 - BLOCK
      ?auto_32154 - BLOCK
      ?auto_32155 - BLOCK
      ?auto_32156 - BLOCK
    )
    :vars
    (
      ?auto_32157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32156 ?auto_32157 ) ( ON-TABLE ?auto_32150 ) ( ON ?auto_32151 ?auto_32150 ) ( ON ?auto_32152 ?auto_32151 ) ( ON ?auto_32153 ?auto_32152 ) ( not ( = ?auto_32150 ?auto_32151 ) ) ( not ( = ?auto_32150 ?auto_32152 ) ) ( not ( = ?auto_32150 ?auto_32153 ) ) ( not ( = ?auto_32150 ?auto_32154 ) ) ( not ( = ?auto_32150 ?auto_32155 ) ) ( not ( = ?auto_32150 ?auto_32156 ) ) ( not ( = ?auto_32150 ?auto_32157 ) ) ( not ( = ?auto_32151 ?auto_32152 ) ) ( not ( = ?auto_32151 ?auto_32153 ) ) ( not ( = ?auto_32151 ?auto_32154 ) ) ( not ( = ?auto_32151 ?auto_32155 ) ) ( not ( = ?auto_32151 ?auto_32156 ) ) ( not ( = ?auto_32151 ?auto_32157 ) ) ( not ( = ?auto_32152 ?auto_32153 ) ) ( not ( = ?auto_32152 ?auto_32154 ) ) ( not ( = ?auto_32152 ?auto_32155 ) ) ( not ( = ?auto_32152 ?auto_32156 ) ) ( not ( = ?auto_32152 ?auto_32157 ) ) ( not ( = ?auto_32153 ?auto_32154 ) ) ( not ( = ?auto_32153 ?auto_32155 ) ) ( not ( = ?auto_32153 ?auto_32156 ) ) ( not ( = ?auto_32153 ?auto_32157 ) ) ( not ( = ?auto_32154 ?auto_32155 ) ) ( not ( = ?auto_32154 ?auto_32156 ) ) ( not ( = ?auto_32154 ?auto_32157 ) ) ( not ( = ?auto_32155 ?auto_32156 ) ) ( not ( = ?auto_32155 ?auto_32157 ) ) ( not ( = ?auto_32156 ?auto_32157 ) ) ( ON ?auto_32155 ?auto_32156 ) ( CLEAR ?auto_32153 ) ( ON ?auto_32154 ?auto_32155 ) ( CLEAR ?auto_32154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32150 ?auto_32151 ?auto_32152 ?auto_32153 ?auto_32154 )
      ( MAKE-7PILE ?auto_32150 ?auto_32151 ?auto_32152 ?auto_32153 ?auto_32154 ?auto_32155 ?auto_32156 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_32165 - BLOCK
      ?auto_32166 - BLOCK
      ?auto_32167 - BLOCK
      ?auto_32168 - BLOCK
      ?auto_32169 - BLOCK
      ?auto_32170 - BLOCK
      ?auto_32171 - BLOCK
    )
    :vars
    (
      ?auto_32172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32171 ?auto_32172 ) ( ON-TABLE ?auto_32165 ) ( ON ?auto_32166 ?auto_32165 ) ( ON ?auto_32167 ?auto_32166 ) ( ON ?auto_32168 ?auto_32167 ) ( not ( = ?auto_32165 ?auto_32166 ) ) ( not ( = ?auto_32165 ?auto_32167 ) ) ( not ( = ?auto_32165 ?auto_32168 ) ) ( not ( = ?auto_32165 ?auto_32169 ) ) ( not ( = ?auto_32165 ?auto_32170 ) ) ( not ( = ?auto_32165 ?auto_32171 ) ) ( not ( = ?auto_32165 ?auto_32172 ) ) ( not ( = ?auto_32166 ?auto_32167 ) ) ( not ( = ?auto_32166 ?auto_32168 ) ) ( not ( = ?auto_32166 ?auto_32169 ) ) ( not ( = ?auto_32166 ?auto_32170 ) ) ( not ( = ?auto_32166 ?auto_32171 ) ) ( not ( = ?auto_32166 ?auto_32172 ) ) ( not ( = ?auto_32167 ?auto_32168 ) ) ( not ( = ?auto_32167 ?auto_32169 ) ) ( not ( = ?auto_32167 ?auto_32170 ) ) ( not ( = ?auto_32167 ?auto_32171 ) ) ( not ( = ?auto_32167 ?auto_32172 ) ) ( not ( = ?auto_32168 ?auto_32169 ) ) ( not ( = ?auto_32168 ?auto_32170 ) ) ( not ( = ?auto_32168 ?auto_32171 ) ) ( not ( = ?auto_32168 ?auto_32172 ) ) ( not ( = ?auto_32169 ?auto_32170 ) ) ( not ( = ?auto_32169 ?auto_32171 ) ) ( not ( = ?auto_32169 ?auto_32172 ) ) ( not ( = ?auto_32170 ?auto_32171 ) ) ( not ( = ?auto_32170 ?auto_32172 ) ) ( not ( = ?auto_32171 ?auto_32172 ) ) ( ON ?auto_32170 ?auto_32171 ) ( CLEAR ?auto_32168 ) ( ON ?auto_32169 ?auto_32170 ) ( CLEAR ?auto_32169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32165 ?auto_32166 ?auto_32167 ?auto_32168 ?auto_32169 )
      ( MAKE-7PILE ?auto_32165 ?auto_32166 ?auto_32167 ?auto_32168 ?auto_32169 ?auto_32170 ?auto_32171 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_32180 - BLOCK
      ?auto_32181 - BLOCK
      ?auto_32182 - BLOCK
      ?auto_32183 - BLOCK
      ?auto_32184 - BLOCK
      ?auto_32185 - BLOCK
      ?auto_32186 - BLOCK
    )
    :vars
    (
      ?auto_32187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32186 ?auto_32187 ) ( ON-TABLE ?auto_32180 ) ( ON ?auto_32181 ?auto_32180 ) ( ON ?auto_32182 ?auto_32181 ) ( not ( = ?auto_32180 ?auto_32181 ) ) ( not ( = ?auto_32180 ?auto_32182 ) ) ( not ( = ?auto_32180 ?auto_32183 ) ) ( not ( = ?auto_32180 ?auto_32184 ) ) ( not ( = ?auto_32180 ?auto_32185 ) ) ( not ( = ?auto_32180 ?auto_32186 ) ) ( not ( = ?auto_32180 ?auto_32187 ) ) ( not ( = ?auto_32181 ?auto_32182 ) ) ( not ( = ?auto_32181 ?auto_32183 ) ) ( not ( = ?auto_32181 ?auto_32184 ) ) ( not ( = ?auto_32181 ?auto_32185 ) ) ( not ( = ?auto_32181 ?auto_32186 ) ) ( not ( = ?auto_32181 ?auto_32187 ) ) ( not ( = ?auto_32182 ?auto_32183 ) ) ( not ( = ?auto_32182 ?auto_32184 ) ) ( not ( = ?auto_32182 ?auto_32185 ) ) ( not ( = ?auto_32182 ?auto_32186 ) ) ( not ( = ?auto_32182 ?auto_32187 ) ) ( not ( = ?auto_32183 ?auto_32184 ) ) ( not ( = ?auto_32183 ?auto_32185 ) ) ( not ( = ?auto_32183 ?auto_32186 ) ) ( not ( = ?auto_32183 ?auto_32187 ) ) ( not ( = ?auto_32184 ?auto_32185 ) ) ( not ( = ?auto_32184 ?auto_32186 ) ) ( not ( = ?auto_32184 ?auto_32187 ) ) ( not ( = ?auto_32185 ?auto_32186 ) ) ( not ( = ?auto_32185 ?auto_32187 ) ) ( not ( = ?auto_32186 ?auto_32187 ) ) ( ON ?auto_32185 ?auto_32186 ) ( ON ?auto_32184 ?auto_32185 ) ( CLEAR ?auto_32182 ) ( ON ?auto_32183 ?auto_32184 ) ( CLEAR ?auto_32183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32180 ?auto_32181 ?auto_32182 ?auto_32183 )
      ( MAKE-7PILE ?auto_32180 ?auto_32181 ?auto_32182 ?auto_32183 ?auto_32184 ?auto_32185 ?auto_32186 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_32195 - BLOCK
      ?auto_32196 - BLOCK
      ?auto_32197 - BLOCK
      ?auto_32198 - BLOCK
      ?auto_32199 - BLOCK
      ?auto_32200 - BLOCK
      ?auto_32201 - BLOCK
    )
    :vars
    (
      ?auto_32202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32201 ?auto_32202 ) ( ON-TABLE ?auto_32195 ) ( ON ?auto_32196 ?auto_32195 ) ( ON ?auto_32197 ?auto_32196 ) ( not ( = ?auto_32195 ?auto_32196 ) ) ( not ( = ?auto_32195 ?auto_32197 ) ) ( not ( = ?auto_32195 ?auto_32198 ) ) ( not ( = ?auto_32195 ?auto_32199 ) ) ( not ( = ?auto_32195 ?auto_32200 ) ) ( not ( = ?auto_32195 ?auto_32201 ) ) ( not ( = ?auto_32195 ?auto_32202 ) ) ( not ( = ?auto_32196 ?auto_32197 ) ) ( not ( = ?auto_32196 ?auto_32198 ) ) ( not ( = ?auto_32196 ?auto_32199 ) ) ( not ( = ?auto_32196 ?auto_32200 ) ) ( not ( = ?auto_32196 ?auto_32201 ) ) ( not ( = ?auto_32196 ?auto_32202 ) ) ( not ( = ?auto_32197 ?auto_32198 ) ) ( not ( = ?auto_32197 ?auto_32199 ) ) ( not ( = ?auto_32197 ?auto_32200 ) ) ( not ( = ?auto_32197 ?auto_32201 ) ) ( not ( = ?auto_32197 ?auto_32202 ) ) ( not ( = ?auto_32198 ?auto_32199 ) ) ( not ( = ?auto_32198 ?auto_32200 ) ) ( not ( = ?auto_32198 ?auto_32201 ) ) ( not ( = ?auto_32198 ?auto_32202 ) ) ( not ( = ?auto_32199 ?auto_32200 ) ) ( not ( = ?auto_32199 ?auto_32201 ) ) ( not ( = ?auto_32199 ?auto_32202 ) ) ( not ( = ?auto_32200 ?auto_32201 ) ) ( not ( = ?auto_32200 ?auto_32202 ) ) ( not ( = ?auto_32201 ?auto_32202 ) ) ( ON ?auto_32200 ?auto_32201 ) ( ON ?auto_32199 ?auto_32200 ) ( CLEAR ?auto_32197 ) ( ON ?auto_32198 ?auto_32199 ) ( CLEAR ?auto_32198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32195 ?auto_32196 ?auto_32197 ?auto_32198 )
      ( MAKE-7PILE ?auto_32195 ?auto_32196 ?auto_32197 ?auto_32198 ?auto_32199 ?auto_32200 ?auto_32201 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_32210 - BLOCK
      ?auto_32211 - BLOCK
      ?auto_32212 - BLOCK
      ?auto_32213 - BLOCK
      ?auto_32214 - BLOCK
      ?auto_32215 - BLOCK
      ?auto_32216 - BLOCK
    )
    :vars
    (
      ?auto_32217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32216 ?auto_32217 ) ( ON-TABLE ?auto_32210 ) ( ON ?auto_32211 ?auto_32210 ) ( not ( = ?auto_32210 ?auto_32211 ) ) ( not ( = ?auto_32210 ?auto_32212 ) ) ( not ( = ?auto_32210 ?auto_32213 ) ) ( not ( = ?auto_32210 ?auto_32214 ) ) ( not ( = ?auto_32210 ?auto_32215 ) ) ( not ( = ?auto_32210 ?auto_32216 ) ) ( not ( = ?auto_32210 ?auto_32217 ) ) ( not ( = ?auto_32211 ?auto_32212 ) ) ( not ( = ?auto_32211 ?auto_32213 ) ) ( not ( = ?auto_32211 ?auto_32214 ) ) ( not ( = ?auto_32211 ?auto_32215 ) ) ( not ( = ?auto_32211 ?auto_32216 ) ) ( not ( = ?auto_32211 ?auto_32217 ) ) ( not ( = ?auto_32212 ?auto_32213 ) ) ( not ( = ?auto_32212 ?auto_32214 ) ) ( not ( = ?auto_32212 ?auto_32215 ) ) ( not ( = ?auto_32212 ?auto_32216 ) ) ( not ( = ?auto_32212 ?auto_32217 ) ) ( not ( = ?auto_32213 ?auto_32214 ) ) ( not ( = ?auto_32213 ?auto_32215 ) ) ( not ( = ?auto_32213 ?auto_32216 ) ) ( not ( = ?auto_32213 ?auto_32217 ) ) ( not ( = ?auto_32214 ?auto_32215 ) ) ( not ( = ?auto_32214 ?auto_32216 ) ) ( not ( = ?auto_32214 ?auto_32217 ) ) ( not ( = ?auto_32215 ?auto_32216 ) ) ( not ( = ?auto_32215 ?auto_32217 ) ) ( not ( = ?auto_32216 ?auto_32217 ) ) ( ON ?auto_32215 ?auto_32216 ) ( ON ?auto_32214 ?auto_32215 ) ( ON ?auto_32213 ?auto_32214 ) ( CLEAR ?auto_32211 ) ( ON ?auto_32212 ?auto_32213 ) ( CLEAR ?auto_32212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32210 ?auto_32211 ?auto_32212 )
      ( MAKE-7PILE ?auto_32210 ?auto_32211 ?auto_32212 ?auto_32213 ?auto_32214 ?auto_32215 ?auto_32216 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_32225 - BLOCK
      ?auto_32226 - BLOCK
      ?auto_32227 - BLOCK
      ?auto_32228 - BLOCK
      ?auto_32229 - BLOCK
      ?auto_32230 - BLOCK
      ?auto_32231 - BLOCK
    )
    :vars
    (
      ?auto_32232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32231 ?auto_32232 ) ( ON-TABLE ?auto_32225 ) ( ON ?auto_32226 ?auto_32225 ) ( not ( = ?auto_32225 ?auto_32226 ) ) ( not ( = ?auto_32225 ?auto_32227 ) ) ( not ( = ?auto_32225 ?auto_32228 ) ) ( not ( = ?auto_32225 ?auto_32229 ) ) ( not ( = ?auto_32225 ?auto_32230 ) ) ( not ( = ?auto_32225 ?auto_32231 ) ) ( not ( = ?auto_32225 ?auto_32232 ) ) ( not ( = ?auto_32226 ?auto_32227 ) ) ( not ( = ?auto_32226 ?auto_32228 ) ) ( not ( = ?auto_32226 ?auto_32229 ) ) ( not ( = ?auto_32226 ?auto_32230 ) ) ( not ( = ?auto_32226 ?auto_32231 ) ) ( not ( = ?auto_32226 ?auto_32232 ) ) ( not ( = ?auto_32227 ?auto_32228 ) ) ( not ( = ?auto_32227 ?auto_32229 ) ) ( not ( = ?auto_32227 ?auto_32230 ) ) ( not ( = ?auto_32227 ?auto_32231 ) ) ( not ( = ?auto_32227 ?auto_32232 ) ) ( not ( = ?auto_32228 ?auto_32229 ) ) ( not ( = ?auto_32228 ?auto_32230 ) ) ( not ( = ?auto_32228 ?auto_32231 ) ) ( not ( = ?auto_32228 ?auto_32232 ) ) ( not ( = ?auto_32229 ?auto_32230 ) ) ( not ( = ?auto_32229 ?auto_32231 ) ) ( not ( = ?auto_32229 ?auto_32232 ) ) ( not ( = ?auto_32230 ?auto_32231 ) ) ( not ( = ?auto_32230 ?auto_32232 ) ) ( not ( = ?auto_32231 ?auto_32232 ) ) ( ON ?auto_32230 ?auto_32231 ) ( ON ?auto_32229 ?auto_32230 ) ( ON ?auto_32228 ?auto_32229 ) ( CLEAR ?auto_32226 ) ( ON ?auto_32227 ?auto_32228 ) ( CLEAR ?auto_32227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32225 ?auto_32226 ?auto_32227 )
      ( MAKE-7PILE ?auto_32225 ?auto_32226 ?auto_32227 ?auto_32228 ?auto_32229 ?auto_32230 ?auto_32231 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_32240 - BLOCK
      ?auto_32241 - BLOCK
      ?auto_32242 - BLOCK
      ?auto_32243 - BLOCK
      ?auto_32244 - BLOCK
      ?auto_32245 - BLOCK
      ?auto_32246 - BLOCK
    )
    :vars
    (
      ?auto_32247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32246 ?auto_32247 ) ( ON-TABLE ?auto_32240 ) ( not ( = ?auto_32240 ?auto_32241 ) ) ( not ( = ?auto_32240 ?auto_32242 ) ) ( not ( = ?auto_32240 ?auto_32243 ) ) ( not ( = ?auto_32240 ?auto_32244 ) ) ( not ( = ?auto_32240 ?auto_32245 ) ) ( not ( = ?auto_32240 ?auto_32246 ) ) ( not ( = ?auto_32240 ?auto_32247 ) ) ( not ( = ?auto_32241 ?auto_32242 ) ) ( not ( = ?auto_32241 ?auto_32243 ) ) ( not ( = ?auto_32241 ?auto_32244 ) ) ( not ( = ?auto_32241 ?auto_32245 ) ) ( not ( = ?auto_32241 ?auto_32246 ) ) ( not ( = ?auto_32241 ?auto_32247 ) ) ( not ( = ?auto_32242 ?auto_32243 ) ) ( not ( = ?auto_32242 ?auto_32244 ) ) ( not ( = ?auto_32242 ?auto_32245 ) ) ( not ( = ?auto_32242 ?auto_32246 ) ) ( not ( = ?auto_32242 ?auto_32247 ) ) ( not ( = ?auto_32243 ?auto_32244 ) ) ( not ( = ?auto_32243 ?auto_32245 ) ) ( not ( = ?auto_32243 ?auto_32246 ) ) ( not ( = ?auto_32243 ?auto_32247 ) ) ( not ( = ?auto_32244 ?auto_32245 ) ) ( not ( = ?auto_32244 ?auto_32246 ) ) ( not ( = ?auto_32244 ?auto_32247 ) ) ( not ( = ?auto_32245 ?auto_32246 ) ) ( not ( = ?auto_32245 ?auto_32247 ) ) ( not ( = ?auto_32246 ?auto_32247 ) ) ( ON ?auto_32245 ?auto_32246 ) ( ON ?auto_32244 ?auto_32245 ) ( ON ?auto_32243 ?auto_32244 ) ( ON ?auto_32242 ?auto_32243 ) ( CLEAR ?auto_32240 ) ( ON ?auto_32241 ?auto_32242 ) ( CLEAR ?auto_32241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32240 ?auto_32241 )
      ( MAKE-7PILE ?auto_32240 ?auto_32241 ?auto_32242 ?auto_32243 ?auto_32244 ?auto_32245 ?auto_32246 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_32255 - BLOCK
      ?auto_32256 - BLOCK
      ?auto_32257 - BLOCK
      ?auto_32258 - BLOCK
      ?auto_32259 - BLOCK
      ?auto_32260 - BLOCK
      ?auto_32261 - BLOCK
    )
    :vars
    (
      ?auto_32262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32261 ?auto_32262 ) ( ON-TABLE ?auto_32255 ) ( not ( = ?auto_32255 ?auto_32256 ) ) ( not ( = ?auto_32255 ?auto_32257 ) ) ( not ( = ?auto_32255 ?auto_32258 ) ) ( not ( = ?auto_32255 ?auto_32259 ) ) ( not ( = ?auto_32255 ?auto_32260 ) ) ( not ( = ?auto_32255 ?auto_32261 ) ) ( not ( = ?auto_32255 ?auto_32262 ) ) ( not ( = ?auto_32256 ?auto_32257 ) ) ( not ( = ?auto_32256 ?auto_32258 ) ) ( not ( = ?auto_32256 ?auto_32259 ) ) ( not ( = ?auto_32256 ?auto_32260 ) ) ( not ( = ?auto_32256 ?auto_32261 ) ) ( not ( = ?auto_32256 ?auto_32262 ) ) ( not ( = ?auto_32257 ?auto_32258 ) ) ( not ( = ?auto_32257 ?auto_32259 ) ) ( not ( = ?auto_32257 ?auto_32260 ) ) ( not ( = ?auto_32257 ?auto_32261 ) ) ( not ( = ?auto_32257 ?auto_32262 ) ) ( not ( = ?auto_32258 ?auto_32259 ) ) ( not ( = ?auto_32258 ?auto_32260 ) ) ( not ( = ?auto_32258 ?auto_32261 ) ) ( not ( = ?auto_32258 ?auto_32262 ) ) ( not ( = ?auto_32259 ?auto_32260 ) ) ( not ( = ?auto_32259 ?auto_32261 ) ) ( not ( = ?auto_32259 ?auto_32262 ) ) ( not ( = ?auto_32260 ?auto_32261 ) ) ( not ( = ?auto_32260 ?auto_32262 ) ) ( not ( = ?auto_32261 ?auto_32262 ) ) ( ON ?auto_32260 ?auto_32261 ) ( ON ?auto_32259 ?auto_32260 ) ( ON ?auto_32258 ?auto_32259 ) ( ON ?auto_32257 ?auto_32258 ) ( CLEAR ?auto_32255 ) ( ON ?auto_32256 ?auto_32257 ) ( CLEAR ?auto_32256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32255 ?auto_32256 )
      ( MAKE-7PILE ?auto_32255 ?auto_32256 ?auto_32257 ?auto_32258 ?auto_32259 ?auto_32260 ?auto_32261 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_32270 - BLOCK
      ?auto_32271 - BLOCK
      ?auto_32272 - BLOCK
      ?auto_32273 - BLOCK
      ?auto_32274 - BLOCK
      ?auto_32275 - BLOCK
      ?auto_32276 - BLOCK
    )
    :vars
    (
      ?auto_32277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32276 ?auto_32277 ) ( not ( = ?auto_32270 ?auto_32271 ) ) ( not ( = ?auto_32270 ?auto_32272 ) ) ( not ( = ?auto_32270 ?auto_32273 ) ) ( not ( = ?auto_32270 ?auto_32274 ) ) ( not ( = ?auto_32270 ?auto_32275 ) ) ( not ( = ?auto_32270 ?auto_32276 ) ) ( not ( = ?auto_32270 ?auto_32277 ) ) ( not ( = ?auto_32271 ?auto_32272 ) ) ( not ( = ?auto_32271 ?auto_32273 ) ) ( not ( = ?auto_32271 ?auto_32274 ) ) ( not ( = ?auto_32271 ?auto_32275 ) ) ( not ( = ?auto_32271 ?auto_32276 ) ) ( not ( = ?auto_32271 ?auto_32277 ) ) ( not ( = ?auto_32272 ?auto_32273 ) ) ( not ( = ?auto_32272 ?auto_32274 ) ) ( not ( = ?auto_32272 ?auto_32275 ) ) ( not ( = ?auto_32272 ?auto_32276 ) ) ( not ( = ?auto_32272 ?auto_32277 ) ) ( not ( = ?auto_32273 ?auto_32274 ) ) ( not ( = ?auto_32273 ?auto_32275 ) ) ( not ( = ?auto_32273 ?auto_32276 ) ) ( not ( = ?auto_32273 ?auto_32277 ) ) ( not ( = ?auto_32274 ?auto_32275 ) ) ( not ( = ?auto_32274 ?auto_32276 ) ) ( not ( = ?auto_32274 ?auto_32277 ) ) ( not ( = ?auto_32275 ?auto_32276 ) ) ( not ( = ?auto_32275 ?auto_32277 ) ) ( not ( = ?auto_32276 ?auto_32277 ) ) ( ON ?auto_32275 ?auto_32276 ) ( ON ?auto_32274 ?auto_32275 ) ( ON ?auto_32273 ?auto_32274 ) ( ON ?auto_32272 ?auto_32273 ) ( ON ?auto_32271 ?auto_32272 ) ( ON ?auto_32270 ?auto_32271 ) ( CLEAR ?auto_32270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32270 )
      ( MAKE-7PILE ?auto_32270 ?auto_32271 ?auto_32272 ?auto_32273 ?auto_32274 ?auto_32275 ?auto_32276 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_32285 - BLOCK
      ?auto_32286 - BLOCK
      ?auto_32287 - BLOCK
      ?auto_32288 - BLOCK
      ?auto_32289 - BLOCK
      ?auto_32290 - BLOCK
      ?auto_32291 - BLOCK
    )
    :vars
    (
      ?auto_32292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32291 ?auto_32292 ) ( not ( = ?auto_32285 ?auto_32286 ) ) ( not ( = ?auto_32285 ?auto_32287 ) ) ( not ( = ?auto_32285 ?auto_32288 ) ) ( not ( = ?auto_32285 ?auto_32289 ) ) ( not ( = ?auto_32285 ?auto_32290 ) ) ( not ( = ?auto_32285 ?auto_32291 ) ) ( not ( = ?auto_32285 ?auto_32292 ) ) ( not ( = ?auto_32286 ?auto_32287 ) ) ( not ( = ?auto_32286 ?auto_32288 ) ) ( not ( = ?auto_32286 ?auto_32289 ) ) ( not ( = ?auto_32286 ?auto_32290 ) ) ( not ( = ?auto_32286 ?auto_32291 ) ) ( not ( = ?auto_32286 ?auto_32292 ) ) ( not ( = ?auto_32287 ?auto_32288 ) ) ( not ( = ?auto_32287 ?auto_32289 ) ) ( not ( = ?auto_32287 ?auto_32290 ) ) ( not ( = ?auto_32287 ?auto_32291 ) ) ( not ( = ?auto_32287 ?auto_32292 ) ) ( not ( = ?auto_32288 ?auto_32289 ) ) ( not ( = ?auto_32288 ?auto_32290 ) ) ( not ( = ?auto_32288 ?auto_32291 ) ) ( not ( = ?auto_32288 ?auto_32292 ) ) ( not ( = ?auto_32289 ?auto_32290 ) ) ( not ( = ?auto_32289 ?auto_32291 ) ) ( not ( = ?auto_32289 ?auto_32292 ) ) ( not ( = ?auto_32290 ?auto_32291 ) ) ( not ( = ?auto_32290 ?auto_32292 ) ) ( not ( = ?auto_32291 ?auto_32292 ) ) ( ON ?auto_32290 ?auto_32291 ) ( ON ?auto_32289 ?auto_32290 ) ( ON ?auto_32288 ?auto_32289 ) ( ON ?auto_32287 ?auto_32288 ) ( ON ?auto_32286 ?auto_32287 ) ( ON ?auto_32285 ?auto_32286 ) ( CLEAR ?auto_32285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32285 )
      ( MAKE-7PILE ?auto_32285 ?auto_32286 ?auto_32287 ?auto_32288 ?auto_32289 ?auto_32290 ?auto_32291 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_32301 - BLOCK
      ?auto_32302 - BLOCK
      ?auto_32303 - BLOCK
      ?auto_32304 - BLOCK
      ?auto_32305 - BLOCK
      ?auto_32306 - BLOCK
      ?auto_32307 - BLOCK
      ?auto_32308 - BLOCK
    )
    :vars
    (
      ?auto_32309 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32307 ) ( ON ?auto_32308 ?auto_32309 ) ( CLEAR ?auto_32308 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32301 ) ( ON ?auto_32302 ?auto_32301 ) ( ON ?auto_32303 ?auto_32302 ) ( ON ?auto_32304 ?auto_32303 ) ( ON ?auto_32305 ?auto_32304 ) ( ON ?auto_32306 ?auto_32305 ) ( ON ?auto_32307 ?auto_32306 ) ( not ( = ?auto_32301 ?auto_32302 ) ) ( not ( = ?auto_32301 ?auto_32303 ) ) ( not ( = ?auto_32301 ?auto_32304 ) ) ( not ( = ?auto_32301 ?auto_32305 ) ) ( not ( = ?auto_32301 ?auto_32306 ) ) ( not ( = ?auto_32301 ?auto_32307 ) ) ( not ( = ?auto_32301 ?auto_32308 ) ) ( not ( = ?auto_32301 ?auto_32309 ) ) ( not ( = ?auto_32302 ?auto_32303 ) ) ( not ( = ?auto_32302 ?auto_32304 ) ) ( not ( = ?auto_32302 ?auto_32305 ) ) ( not ( = ?auto_32302 ?auto_32306 ) ) ( not ( = ?auto_32302 ?auto_32307 ) ) ( not ( = ?auto_32302 ?auto_32308 ) ) ( not ( = ?auto_32302 ?auto_32309 ) ) ( not ( = ?auto_32303 ?auto_32304 ) ) ( not ( = ?auto_32303 ?auto_32305 ) ) ( not ( = ?auto_32303 ?auto_32306 ) ) ( not ( = ?auto_32303 ?auto_32307 ) ) ( not ( = ?auto_32303 ?auto_32308 ) ) ( not ( = ?auto_32303 ?auto_32309 ) ) ( not ( = ?auto_32304 ?auto_32305 ) ) ( not ( = ?auto_32304 ?auto_32306 ) ) ( not ( = ?auto_32304 ?auto_32307 ) ) ( not ( = ?auto_32304 ?auto_32308 ) ) ( not ( = ?auto_32304 ?auto_32309 ) ) ( not ( = ?auto_32305 ?auto_32306 ) ) ( not ( = ?auto_32305 ?auto_32307 ) ) ( not ( = ?auto_32305 ?auto_32308 ) ) ( not ( = ?auto_32305 ?auto_32309 ) ) ( not ( = ?auto_32306 ?auto_32307 ) ) ( not ( = ?auto_32306 ?auto_32308 ) ) ( not ( = ?auto_32306 ?auto_32309 ) ) ( not ( = ?auto_32307 ?auto_32308 ) ) ( not ( = ?auto_32307 ?auto_32309 ) ) ( not ( = ?auto_32308 ?auto_32309 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32308 ?auto_32309 )
      ( !STACK ?auto_32308 ?auto_32307 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_32318 - BLOCK
      ?auto_32319 - BLOCK
      ?auto_32320 - BLOCK
      ?auto_32321 - BLOCK
      ?auto_32322 - BLOCK
      ?auto_32323 - BLOCK
      ?auto_32324 - BLOCK
      ?auto_32325 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32324 ) ( ON-TABLE ?auto_32325 ) ( CLEAR ?auto_32325 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32318 ) ( ON ?auto_32319 ?auto_32318 ) ( ON ?auto_32320 ?auto_32319 ) ( ON ?auto_32321 ?auto_32320 ) ( ON ?auto_32322 ?auto_32321 ) ( ON ?auto_32323 ?auto_32322 ) ( ON ?auto_32324 ?auto_32323 ) ( not ( = ?auto_32318 ?auto_32319 ) ) ( not ( = ?auto_32318 ?auto_32320 ) ) ( not ( = ?auto_32318 ?auto_32321 ) ) ( not ( = ?auto_32318 ?auto_32322 ) ) ( not ( = ?auto_32318 ?auto_32323 ) ) ( not ( = ?auto_32318 ?auto_32324 ) ) ( not ( = ?auto_32318 ?auto_32325 ) ) ( not ( = ?auto_32319 ?auto_32320 ) ) ( not ( = ?auto_32319 ?auto_32321 ) ) ( not ( = ?auto_32319 ?auto_32322 ) ) ( not ( = ?auto_32319 ?auto_32323 ) ) ( not ( = ?auto_32319 ?auto_32324 ) ) ( not ( = ?auto_32319 ?auto_32325 ) ) ( not ( = ?auto_32320 ?auto_32321 ) ) ( not ( = ?auto_32320 ?auto_32322 ) ) ( not ( = ?auto_32320 ?auto_32323 ) ) ( not ( = ?auto_32320 ?auto_32324 ) ) ( not ( = ?auto_32320 ?auto_32325 ) ) ( not ( = ?auto_32321 ?auto_32322 ) ) ( not ( = ?auto_32321 ?auto_32323 ) ) ( not ( = ?auto_32321 ?auto_32324 ) ) ( not ( = ?auto_32321 ?auto_32325 ) ) ( not ( = ?auto_32322 ?auto_32323 ) ) ( not ( = ?auto_32322 ?auto_32324 ) ) ( not ( = ?auto_32322 ?auto_32325 ) ) ( not ( = ?auto_32323 ?auto_32324 ) ) ( not ( = ?auto_32323 ?auto_32325 ) ) ( not ( = ?auto_32324 ?auto_32325 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_32325 )
      ( !STACK ?auto_32325 ?auto_32324 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_32334 - BLOCK
      ?auto_32335 - BLOCK
      ?auto_32336 - BLOCK
      ?auto_32337 - BLOCK
      ?auto_32338 - BLOCK
      ?auto_32339 - BLOCK
      ?auto_32340 - BLOCK
      ?auto_32341 - BLOCK
    )
    :vars
    (
      ?auto_32342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32341 ?auto_32342 ) ( ON-TABLE ?auto_32334 ) ( ON ?auto_32335 ?auto_32334 ) ( ON ?auto_32336 ?auto_32335 ) ( ON ?auto_32337 ?auto_32336 ) ( ON ?auto_32338 ?auto_32337 ) ( ON ?auto_32339 ?auto_32338 ) ( not ( = ?auto_32334 ?auto_32335 ) ) ( not ( = ?auto_32334 ?auto_32336 ) ) ( not ( = ?auto_32334 ?auto_32337 ) ) ( not ( = ?auto_32334 ?auto_32338 ) ) ( not ( = ?auto_32334 ?auto_32339 ) ) ( not ( = ?auto_32334 ?auto_32340 ) ) ( not ( = ?auto_32334 ?auto_32341 ) ) ( not ( = ?auto_32334 ?auto_32342 ) ) ( not ( = ?auto_32335 ?auto_32336 ) ) ( not ( = ?auto_32335 ?auto_32337 ) ) ( not ( = ?auto_32335 ?auto_32338 ) ) ( not ( = ?auto_32335 ?auto_32339 ) ) ( not ( = ?auto_32335 ?auto_32340 ) ) ( not ( = ?auto_32335 ?auto_32341 ) ) ( not ( = ?auto_32335 ?auto_32342 ) ) ( not ( = ?auto_32336 ?auto_32337 ) ) ( not ( = ?auto_32336 ?auto_32338 ) ) ( not ( = ?auto_32336 ?auto_32339 ) ) ( not ( = ?auto_32336 ?auto_32340 ) ) ( not ( = ?auto_32336 ?auto_32341 ) ) ( not ( = ?auto_32336 ?auto_32342 ) ) ( not ( = ?auto_32337 ?auto_32338 ) ) ( not ( = ?auto_32337 ?auto_32339 ) ) ( not ( = ?auto_32337 ?auto_32340 ) ) ( not ( = ?auto_32337 ?auto_32341 ) ) ( not ( = ?auto_32337 ?auto_32342 ) ) ( not ( = ?auto_32338 ?auto_32339 ) ) ( not ( = ?auto_32338 ?auto_32340 ) ) ( not ( = ?auto_32338 ?auto_32341 ) ) ( not ( = ?auto_32338 ?auto_32342 ) ) ( not ( = ?auto_32339 ?auto_32340 ) ) ( not ( = ?auto_32339 ?auto_32341 ) ) ( not ( = ?auto_32339 ?auto_32342 ) ) ( not ( = ?auto_32340 ?auto_32341 ) ) ( not ( = ?auto_32340 ?auto_32342 ) ) ( not ( = ?auto_32341 ?auto_32342 ) ) ( CLEAR ?auto_32339 ) ( ON ?auto_32340 ?auto_32341 ) ( CLEAR ?auto_32340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_32334 ?auto_32335 ?auto_32336 ?auto_32337 ?auto_32338 ?auto_32339 ?auto_32340 )
      ( MAKE-8PILE ?auto_32334 ?auto_32335 ?auto_32336 ?auto_32337 ?auto_32338 ?auto_32339 ?auto_32340 ?auto_32341 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_32351 - BLOCK
      ?auto_32352 - BLOCK
      ?auto_32353 - BLOCK
      ?auto_32354 - BLOCK
      ?auto_32355 - BLOCK
      ?auto_32356 - BLOCK
      ?auto_32357 - BLOCK
      ?auto_32358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32358 ) ( ON-TABLE ?auto_32351 ) ( ON ?auto_32352 ?auto_32351 ) ( ON ?auto_32353 ?auto_32352 ) ( ON ?auto_32354 ?auto_32353 ) ( ON ?auto_32355 ?auto_32354 ) ( ON ?auto_32356 ?auto_32355 ) ( not ( = ?auto_32351 ?auto_32352 ) ) ( not ( = ?auto_32351 ?auto_32353 ) ) ( not ( = ?auto_32351 ?auto_32354 ) ) ( not ( = ?auto_32351 ?auto_32355 ) ) ( not ( = ?auto_32351 ?auto_32356 ) ) ( not ( = ?auto_32351 ?auto_32357 ) ) ( not ( = ?auto_32351 ?auto_32358 ) ) ( not ( = ?auto_32352 ?auto_32353 ) ) ( not ( = ?auto_32352 ?auto_32354 ) ) ( not ( = ?auto_32352 ?auto_32355 ) ) ( not ( = ?auto_32352 ?auto_32356 ) ) ( not ( = ?auto_32352 ?auto_32357 ) ) ( not ( = ?auto_32352 ?auto_32358 ) ) ( not ( = ?auto_32353 ?auto_32354 ) ) ( not ( = ?auto_32353 ?auto_32355 ) ) ( not ( = ?auto_32353 ?auto_32356 ) ) ( not ( = ?auto_32353 ?auto_32357 ) ) ( not ( = ?auto_32353 ?auto_32358 ) ) ( not ( = ?auto_32354 ?auto_32355 ) ) ( not ( = ?auto_32354 ?auto_32356 ) ) ( not ( = ?auto_32354 ?auto_32357 ) ) ( not ( = ?auto_32354 ?auto_32358 ) ) ( not ( = ?auto_32355 ?auto_32356 ) ) ( not ( = ?auto_32355 ?auto_32357 ) ) ( not ( = ?auto_32355 ?auto_32358 ) ) ( not ( = ?auto_32356 ?auto_32357 ) ) ( not ( = ?auto_32356 ?auto_32358 ) ) ( not ( = ?auto_32357 ?auto_32358 ) ) ( CLEAR ?auto_32356 ) ( ON ?auto_32357 ?auto_32358 ) ( CLEAR ?auto_32357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_32351 ?auto_32352 ?auto_32353 ?auto_32354 ?auto_32355 ?auto_32356 ?auto_32357 )
      ( MAKE-8PILE ?auto_32351 ?auto_32352 ?auto_32353 ?auto_32354 ?auto_32355 ?auto_32356 ?auto_32357 ?auto_32358 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_32367 - BLOCK
      ?auto_32368 - BLOCK
      ?auto_32369 - BLOCK
      ?auto_32370 - BLOCK
      ?auto_32371 - BLOCK
      ?auto_32372 - BLOCK
      ?auto_32373 - BLOCK
      ?auto_32374 - BLOCK
    )
    :vars
    (
      ?auto_32375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32374 ?auto_32375 ) ( ON-TABLE ?auto_32367 ) ( ON ?auto_32368 ?auto_32367 ) ( ON ?auto_32369 ?auto_32368 ) ( ON ?auto_32370 ?auto_32369 ) ( ON ?auto_32371 ?auto_32370 ) ( not ( = ?auto_32367 ?auto_32368 ) ) ( not ( = ?auto_32367 ?auto_32369 ) ) ( not ( = ?auto_32367 ?auto_32370 ) ) ( not ( = ?auto_32367 ?auto_32371 ) ) ( not ( = ?auto_32367 ?auto_32372 ) ) ( not ( = ?auto_32367 ?auto_32373 ) ) ( not ( = ?auto_32367 ?auto_32374 ) ) ( not ( = ?auto_32367 ?auto_32375 ) ) ( not ( = ?auto_32368 ?auto_32369 ) ) ( not ( = ?auto_32368 ?auto_32370 ) ) ( not ( = ?auto_32368 ?auto_32371 ) ) ( not ( = ?auto_32368 ?auto_32372 ) ) ( not ( = ?auto_32368 ?auto_32373 ) ) ( not ( = ?auto_32368 ?auto_32374 ) ) ( not ( = ?auto_32368 ?auto_32375 ) ) ( not ( = ?auto_32369 ?auto_32370 ) ) ( not ( = ?auto_32369 ?auto_32371 ) ) ( not ( = ?auto_32369 ?auto_32372 ) ) ( not ( = ?auto_32369 ?auto_32373 ) ) ( not ( = ?auto_32369 ?auto_32374 ) ) ( not ( = ?auto_32369 ?auto_32375 ) ) ( not ( = ?auto_32370 ?auto_32371 ) ) ( not ( = ?auto_32370 ?auto_32372 ) ) ( not ( = ?auto_32370 ?auto_32373 ) ) ( not ( = ?auto_32370 ?auto_32374 ) ) ( not ( = ?auto_32370 ?auto_32375 ) ) ( not ( = ?auto_32371 ?auto_32372 ) ) ( not ( = ?auto_32371 ?auto_32373 ) ) ( not ( = ?auto_32371 ?auto_32374 ) ) ( not ( = ?auto_32371 ?auto_32375 ) ) ( not ( = ?auto_32372 ?auto_32373 ) ) ( not ( = ?auto_32372 ?auto_32374 ) ) ( not ( = ?auto_32372 ?auto_32375 ) ) ( not ( = ?auto_32373 ?auto_32374 ) ) ( not ( = ?auto_32373 ?auto_32375 ) ) ( not ( = ?auto_32374 ?auto_32375 ) ) ( ON ?auto_32373 ?auto_32374 ) ( CLEAR ?auto_32371 ) ( ON ?auto_32372 ?auto_32373 ) ( CLEAR ?auto_32372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_32367 ?auto_32368 ?auto_32369 ?auto_32370 ?auto_32371 ?auto_32372 )
      ( MAKE-8PILE ?auto_32367 ?auto_32368 ?auto_32369 ?auto_32370 ?auto_32371 ?auto_32372 ?auto_32373 ?auto_32374 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_32384 - BLOCK
      ?auto_32385 - BLOCK
      ?auto_32386 - BLOCK
      ?auto_32387 - BLOCK
      ?auto_32388 - BLOCK
      ?auto_32389 - BLOCK
      ?auto_32390 - BLOCK
      ?auto_32391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32391 ) ( ON-TABLE ?auto_32384 ) ( ON ?auto_32385 ?auto_32384 ) ( ON ?auto_32386 ?auto_32385 ) ( ON ?auto_32387 ?auto_32386 ) ( ON ?auto_32388 ?auto_32387 ) ( not ( = ?auto_32384 ?auto_32385 ) ) ( not ( = ?auto_32384 ?auto_32386 ) ) ( not ( = ?auto_32384 ?auto_32387 ) ) ( not ( = ?auto_32384 ?auto_32388 ) ) ( not ( = ?auto_32384 ?auto_32389 ) ) ( not ( = ?auto_32384 ?auto_32390 ) ) ( not ( = ?auto_32384 ?auto_32391 ) ) ( not ( = ?auto_32385 ?auto_32386 ) ) ( not ( = ?auto_32385 ?auto_32387 ) ) ( not ( = ?auto_32385 ?auto_32388 ) ) ( not ( = ?auto_32385 ?auto_32389 ) ) ( not ( = ?auto_32385 ?auto_32390 ) ) ( not ( = ?auto_32385 ?auto_32391 ) ) ( not ( = ?auto_32386 ?auto_32387 ) ) ( not ( = ?auto_32386 ?auto_32388 ) ) ( not ( = ?auto_32386 ?auto_32389 ) ) ( not ( = ?auto_32386 ?auto_32390 ) ) ( not ( = ?auto_32386 ?auto_32391 ) ) ( not ( = ?auto_32387 ?auto_32388 ) ) ( not ( = ?auto_32387 ?auto_32389 ) ) ( not ( = ?auto_32387 ?auto_32390 ) ) ( not ( = ?auto_32387 ?auto_32391 ) ) ( not ( = ?auto_32388 ?auto_32389 ) ) ( not ( = ?auto_32388 ?auto_32390 ) ) ( not ( = ?auto_32388 ?auto_32391 ) ) ( not ( = ?auto_32389 ?auto_32390 ) ) ( not ( = ?auto_32389 ?auto_32391 ) ) ( not ( = ?auto_32390 ?auto_32391 ) ) ( ON ?auto_32390 ?auto_32391 ) ( CLEAR ?auto_32388 ) ( ON ?auto_32389 ?auto_32390 ) ( CLEAR ?auto_32389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_32384 ?auto_32385 ?auto_32386 ?auto_32387 ?auto_32388 ?auto_32389 )
      ( MAKE-8PILE ?auto_32384 ?auto_32385 ?auto_32386 ?auto_32387 ?auto_32388 ?auto_32389 ?auto_32390 ?auto_32391 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_32400 - BLOCK
      ?auto_32401 - BLOCK
      ?auto_32402 - BLOCK
      ?auto_32403 - BLOCK
      ?auto_32404 - BLOCK
      ?auto_32405 - BLOCK
      ?auto_32406 - BLOCK
      ?auto_32407 - BLOCK
    )
    :vars
    (
      ?auto_32408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32407 ?auto_32408 ) ( ON-TABLE ?auto_32400 ) ( ON ?auto_32401 ?auto_32400 ) ( ON ?auto_32402 ?auto_32401 ) ( ON ?auto_32403 ?auto_32402 ) ( not ( = ?auto_32400 ?auto_32401 ) ) ( not ( = ?auto_32400 ?auto_32402 ) ) ( not ( = ?auto_32400 ?auto_32403 ) ) ( not ( = ?auto_32400 ?auto_32404 ) ) ( not ( = ?auto_32400 ?auto_32405 ) ) ( not ( = ?auto_32400 ?auto_32406 ) ) ( not ( = ?auto_32400 ?auto_32407 ) ) ( not ( = ?auto_32400 ?auto_32408 ) ) ( not ( = ?auto_32401 ?auto_32402 ) ) ( not ( = ?auto_32401 ?auto_32403 ) ) ( not ( = ?auto_32401 ?auto_32404 ) ) ( not ( = ?auto_32401 ?auto_32405 ) ) ( not ( = ?auto_32401 ?auto_32406 ) ) ( not ( = ?auto_32401 ?auto_32407 ) ) ( not ( = ?auto_32401 ?auto_32408 ) ) ( not ( = ?auto_32402 ?auto_32403 ) ) ( not ( = ?auto_32402 ?auto_32404 ) ) ( not ( = ?auto_32402 ?auto_32405 ) ) ( not ( = ?auto_32402 ?auto_32406 ) ) ( not ( = ?auto_32402 ?auto_32407 ) ) ( not ( = ?auto_32402 ?auto_32408 ) ) ( not ( = ?auto_32403 ?auto_32404 ) ) ( not ( = ?auto_32403 ?auto_32405 ) ) ( not ( = ?auto_32403 ?auto_32406 ) ) ( not ( = ?auto_32403 ?auto_32407 ) ) ( not ( = ?auto_32403 ?auto_32408 ) ) ( not ( = ?auto_32404 ?auto_32405 ) ) ( not ( = ?auto_32404 ?auto_32406 ) ) ( not ( = ?auto_32404 ?auto_32407 ) ) ( not ( = ?auto_32404 ?auto_32408 ) ) ( not ( = ?auto_32405 ?auto_32406 ) ) ( not ( = ?auto_32405 ?auto_32407 ) ) ( not ( = ?auto_32405 ?auto_32408 ) ) ( not ( = ?auto_32406 ?auto_32407 ) ) ( not ( = ?auto_32406 ?auto_32408 ) ) ( not ( = ?auto_32407 ?auto_32408 ) ) ( ON ?auto_32406 ?auto_32407 ) ( ON ?auto_32405 ?auto_32406 ) ( CLEAR ?auto_32403 ) ( ON ?auto_32404 ?auto_32405 ) ( CLEAR ?auto_32404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32400 ?auto_32401 ?auto_32402 ?auto_32403 ?auto_32404 )
      ( MAKE-8PILE ?auto_32400 ?auto_32401 ?auto_32402 ?auto_32403 ?auto_32404 ?auto_32405 ?auto_32406 ?auto_32407 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_32417 - BLOCK
      ?auto_32418 - BLOCK
      ?auto_32419 - BLOCK
      ?auto_32420 - BLOCK
      ?auto_32421 - BLOCK
      ?auto_32422 - BLOCK
      ?auto_32423 - BLOCK
      ?auto_32424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32424 ) ( ON-TABLE ?auto_32417 ) ( ON ?auto_32418 ?auto_32417 ) ( ON ?auto_32419 ?auto_32418 ) ( ON ?auto_32420 ?auto_32419 ) ( not ( = ?auto_32417 ?auto_32418 ) ) ( not ( = ?auto_32417 ?auto_32419 ) ) ( not ( = ?auto_32417 ?auto_32420 ) ) ( not ( = ?auto_32417 ?auto_32421 ) ) ( not ( = ?auto_32417 ?auto_32422 ) ) ( not ( = ?auto_32417 ?auto_32423 ) ) ( not ( = ?auto_32417 ?auto_32424 ) ) ( not ( = ?auto_32418 ?auto_32419 ) ) ( not ( = ?auto_32418 ?auto_32420 ) ) ( not ( = ?auto_32418 ?auto_32421 ) ) ( not ( = ?auto_32418 ?auto_32422 ) ) ( not ( = ?auto_32418 ?auto_32423 ) ) ( not ( = ?auto_32418 ?auto_32424 ) ) ( not ( = ?auto_32419 ?auto_32420 ) ) ( not ( = ?auto_32419 ?auto_32421 ) ) ( not ( = ?auto_32419 ?auto_32422 ) ) ( not ( = ?auto_32419 ?auto_32423 ) ) ( not ( = ?auto_32419 ?auto_32424 ) ) ( not ( = ?auto_32420 ?auto_32421 ) ) ( not ( = ?auto_32420 ?auto_32422 ) ) ( not ( = ?auto_32420 ?auto_32423 ) ) ( not ( = ?auto_32420 ?auto_32424 ) ) ( not ( = ?auto_32421 ?auto_32422 ) ) ( not ( = ?auto_32421 ?auto_32423 ) ) ( not ( = ?auto_32421 ?auto_32424 ) ) ( not ( = ?auto_32422 ?auto_32423 ) ) ( not ( = ?auto_32422 ?auto_32424 ) ) ( not ( = ?auto_32423 ?auto_32424 ) ) ( ON ?auto_32423 ?auto_32424 ) ( ON ?auto_32422 ?auto_32423 ) ( CLEAR ?auto_32420 ) ( ON ?auto_32421 ?auto_32422 ) ( CLEAR ?auto_32421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32417 ?auto_32418 ?auto_32419 ?auto_32420 ?auto_32421 )
      ( MAKE-8PILE ?auto_32417 ?auto_32418 ?auto_32419 ?auto_32420 ?auto_32421 ?auto_32422 ?auto_32423 ?auto_32424 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_32433 - BLOCK
      ?auto_32434 - BLOCK
      ?auto_32435 - BLOCK
      ?auto_32436 - BLOCK
      ?auto_32437 - BLOCK
      ?auto_32438 - BLOCK
      ?auto_32439 - BLOCK
      ?auto_32440 - BLOCK
    )
    :vars
    (
      ?auto_32441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32440 ?auto_32441 ) ( ON-TABLE ?auto_32433 ) ( ON ?auto_32434 ?auto_32433 ) ( ON ?auto_32435 ?auto_32434 ) ( not ( = ?auto_32433 ?auto_32434 ) ) ( not ( = ?auto_32433 ?auto_32435 ) ) ( not ( = ?auto_32433 ?auto_32436 ) ) ( not ( = ?auto_32433 ?auto_32437 ) ) ( not ( = ?auto_32433 ?auto_32438 ) ) ( not ( = ?auto_32433 ?auto_32439 ) ) ( not ( = ?auto_32433 ?auto_32440 ) ) ( not ( = ?auto_32433 ?auto_32441 ) ) ( not ( = ?auto_32434 ?auto_32435 ) ) ( not ( = ?auto_32434 ?auto_32436 ) ) ( not ( = ?auto_32434 ?auto_32437 ) ) ( not ( = ?auto_32434 ?auto_32438 ) ) ( not ( = ?auto_32434 ?auto_32439 ) ) ( not ( = ?auto_32434 ?auto_32440 ) ) ( not ( = ?auto_32434 ?auto_32441 ) ) ( not ( = ?auto_32435 ?auto_32436 ) ) ( not ( = ?auto_32435 ?auto_32437 ) ) ( not ( = ?auto_32435 ?auto_32438 ) ) ( not ( = ?auto_32435 ?auto_32439 ) ) ( not ( = ?auto_32435 ?auto_32440 ) ) ( not ( = ?auto_32435 ?auto_32441 ) ) ( not ( = ?auto_32436 ?auto_32437 ) ) ( not ( = ?auto_32436 ?auto_32438 ) ) ( not ( = ?auto_32436 ?auto_32439 ) ) ( not ( = ?auto_32436 ?auto_32440 ) ) ( not ( = ?auto_32436 ?auto_32441 ) ) ( not ( = ?auto_32437 ?auto_32438 ) ) ( not ( = ?auto_32437 ?auto_32439 ) ) ( not ( = ?auto_32437 ?auto_32440 ) ) ( not ( = ?auto_32437 ?auto_32441 ) ) ( not ( = ?auto_32438 ?auto_32439 ) ) ( not ( = ?auto_32438 ?auto_32440 ) ) ( not ( = ?auto_32438 ?auto_32441 ) ) ( not ( = ?auto_32439 ?auto_32440 ) ) ( not ( = ?auto_32439 ?auto_32441 ) ) ( not ( = ?auto_32440 ?auto_32441 ) ) ( ON ?auto_32439 ?auto_32440 ) ( ON ?auto_32438 ?auto_32439 ) ( ON ?auto_32437 ?auto_32438 ) ( CLEAR ?auto_32435 ) ( ON ?auto_32436 ?auto_32437 ) ( CLEAR ?auto_32436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32433 ?auto_32434 ?auto_32435 ?auto_32436 )
      ( MAKE-8PILE ?auto_32433 ?auto_32434 ?auto_32435 ?auto_32436 ?auto_32437 ?auto_32438 ?auto_32439 ?auto_32440 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_32450 - BLOCK
      ?auto_32451 - BLOCK
      ?auto_32452 - BLOCK
      ?auto_32453 - BLOCK
      ?auto_32454 - BLOCK
      ?auto_32455 - BLOCK
      ?auto_32456 - BLOCK
      ?auto_32457 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32457 ) ( ON-TABLE ?auto_32450 ) ( ON ?auto_32451 ?auto_32450 ) ( ON ?auto_32452 ?auto_32451 ) ( not ( = ?auto_32450 ?auto_32451 ) ) ( not ( = ?auto_32450 ?auto_32452 ) ) ( not ( = ?auto_32450 ?auto_32453 ) ) ( not ( = ?auto_32450 ?auto_32454 ) ) ( not ( = ?auto_32450 ?auto_32455 ) ) ( not ( = ?auto_32450 ?auto_32456 ) ) ( not ( = ?auto_32450 ?auto_32457 ) ) ( not ( = ?auto_32451 ?auto_32452 ) ) ( not ( = ?auto_32451 ?auto_32453 ) ) ( not ( = ?auto_32451 ?auto_32454 ) ) ( not ( = ?auto_32451 ?auto_32455 ) ) ( not ( = ?auto_32451 ?auto_32456 ) ) ( not ( = ?auto_32451 ?auto_32457 ) ) ( not ( = ?auto_32452 ?auto_32453 ) ) ( not ( = ?auto_32452 ?auto_32454 ) ) ( not ( = ?auto_32452 ?auto_32455 ) ) ( not ( = ?auto_32452 ?auto_32456 ) ) ( not ( = ?auto_32452 ?auto_32457 ) ) ( not ( = ?auto_32453 ?auto_32454 ) ) ( not ( = ?auto_32453 ?auto_32455 ) ) ( not ( = ?auto_32453 ?auto_32456 ) ) ( not ( = ?auto_32453 ?auto_32457 ) ) ( not ( = ?auto_32454 ?auto_32455 ) ) ( not ( = ?auto_32454 ?auto_32456 ) ) ( not ( = ?auto_32454 ?auto_32457 ) ) ( not ( = ?auto_32455 ?auto_32456 ) ) ( not ( = ?auto_32455 ?auto_32457 ) ) ( not ( = ?auto_32456 ?auto_32457 ) ) ( ON ?auto_32456 ?auto_32457 ) ( ON ?auto_32455 ?auto_32456 ) ( ON ?auto_32454 ?auto_32455 ) ( CLEAR ?auto_32452 ) ( ON ?auto_32453 ?auto_32454 ) ( CLEAR ?auto_32453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32450 ?auto_32451 ?auto_32452 ?auto_32453 )
      ( MAKE-8PILE ?auto_32450 ?auto_32451 ?auto_32452 ?auto_32453 ?auto_32454 ?auto_32455 ?auto_32456 ?auto_32457 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_32466 - BLOCK
      ?auto_32467 - BLOCK
      ?auto_32468 - BLOCK
      ?auto_32469 - BLOCK
      ?auto_32470 - BLOCK
      ?auto_32471 - BLOCK
      ?auto_32472 - BLOCK
      ?auto_32473 - BLOCK
    )
    :vars
    (
      ?auto_32474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32473 ?auto_32474 ) ( ON-TABLE ?auto_32466 ) ( ON ?auto_32467 ?auto_32466 ) ( not ( = ?auto_32466 ?auto_32467 ) ) ( not ( = ?auto_32466 ?auto_32468 ) ) ( not ( = ?auto_32466 ?auto_32469 ) ) ( not ( = ?auto_32466 ?auto_32470 ) ) ( not ( = ?auto_32466 ?auto_32471 ) ) ( not ( = ?auto_32466 ?auto_32472 ) ) ( not ( = ?auto_32466 ?auto_32473 ) ) ( not ( = ?auto_32466 ?auto_32474 ) ) ( not ( = ?auto_32467 ?auto_32468 ) ) ( not ( = ?auto_32467 ?auto_32469 ) ) ( not ( = ?auto_32467 ?auto_32470 ) ) ( not ( = ?auto_32467 ?auto_32471 ) ) ( not ( = ?auto_32467 ?auto_32472 ) ) ( not ( = ?auto_32467 ?auto_32473 ) ) ( not ( = ?auto_32467 ?auto_32474 ) ) ( not ( = ?auto_32468 ?auto_32469 ) ) ( not ( = ?auto_32468 ?auto_32470 ) ) ( not ( = ?auto_32468 ?auto_32471 ) ) ( not ( = ?auto_32468 ?auto_32472 ) ) ( not ( = ?auto_32468 ?auto_32473 ) ) ( not ( = ?auto_32468 ?auto_32474 ) ) ( not ( = ?auto_32469 ?auto_32470 ) ) ( not ( = ?auto_32469 ?auto_32471 ) ) ( not ( = ?auto_32469 ?auto_32472 ) ) ( not ( = ?auto_32469 ?auto_32473 ) ) ( not ( = ?auto_32469 ?auto_32474 ) ) ( not ( = ?auto_32470 ?auto_32471 ) ) ( not ( = ?auto_32470 ?auto_32472 ) ) ( not ( = ?auto_32470 ?auto_32473 ) ) ( not ( = ?auto_32470 ?auto_32474 ) ) ( not ( = ?auto_32471 ?auto_32472 ) ) ( not ( = ?auto_32471 ?auto_32473 ) ) ( not ( = ?auto_32471 ?auto_32474 ) ) ( not ( = ?auto_32472 ?auto_32473 ) ) ( not ( = ?auto_32472 ?auto_32474 ) ) ( not ( = ?auto_32473 ?auto_32474 ) ) ( ON ?auto_32472 ?auto_32473 ) ( ON ?auto_32471 ?auto_32472 ) ( ON ?auto_32470 ?auto_32471 ) ( ON ?auto_32469 ?auto_32470 ) ( CLEAR ?auto_32467 ) ( ON ?auto_32468 ?auto_32469 ) ( CLEAR ?auto_32468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32466 ?auto_32467 ?auto_32468 )
      ( MAKE-8PILE ?auto_32466 ?auto_32467 ?auto_32468 ?auto_32469 ?auto_32470 ?auto_32471 ?auto_32472 ?auto_32473 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_32483 - BLOCK
      ?auto_32484 - BLOCK
      ?auto_32485 - BLOCK
      ?auto_32486 - BLOCK
      ?auto_32487 - BLOCK
      ?auto_32488 - BLOCK
      ?auto_32489 - BLOCK
      ?auto_32490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32490 ) ( ON-TABLE ?auto_32483 ) ( ON ?auto_32484 ?auto_32483 ) ( not ( = ?auto_32483 ?auto_32484 ) ) ( not ( = ?auto_32483 ?auto_32485 ) ) ( not ( = ?auto_32483 ?auto_32486 ) ) ( not ( = ?auto_32483 ?auto_32487 ) ) ( not ( = ?auto_32483 ?auto_32488 ) ) ( not ( = ?auto_32483 ?auto_32489 ) ) ( not ( = ?auto_32483 ?auto_32490 ) ) ( not ( = ?auto_32484 ?auto_32485 ) ) ( not ( = ?auto_32484 ?auto_32486 ) ) ( not ( = ?auto_32484 ?auto_32487 ) ) ( not ( = ?auto_32484 ?auto_32488 ) ) ( not ( = ?auto_32484 ?auto_32489 ) ) ( not ( = ?auto_32484 ?auto_32490 ) ) ( not ( = ?auto_32485 ?auto_32486 ) ) ( not ( = ?auto_32485 ?auto_32487 ) ) ( not ( = ?auto_32485 ?auto_32488 ) ) ( not ( = ?auto_32485 ?auto_32489 ) ) ( not ( = ?auto_32485 ?auto_32490 ) ) ( not ( = ?auto_32486 ?auto_32487 ) ) ( not ( = ?auto_32486 ?auto_32488 ) ) ( not ( = ?auto_32486 ?auto_32489 ) ) ( not ( = ?auto_32486 ?auto_32490 ) ) ( not ( = ?auto_32487 ?auto_32488 ) ) ( not ( = ?auto_32487 ?auto_32489 ) ) ( not ( = ?auto_32487 ?auto_32490 ) ) ( not ( = ?auto_32488 ?auto_32489 ) ) ( not ( = ?auto_32488 ?auto_32490 ) ) ( not ( = ?auto_32489 ?auto_32490 ) ) ( ON ?auto_32489 ?auto_32490 ) ( ON ?auto_32488 ?auto_32489 ) ( ON ?auto_32487 ?auto_32488 ) ( ON ?auto_32486 ?auto_32487 ) ( CLEAR ?auto_32484 ) ( ON ?auto_32485 ?auto_32486 ) ( CLEAR ?auto_32485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32483 ?auto_32484 ?auto_32485 )
      ( MAKE-8PILE ?auto_32483 ?auto_32484 ?auto_32485 ?auto_32486 ?auto_32487 ?auto_32488 ?auto_32489 ?auto_32490 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_32499 - BLOCK
      ?auto_32500 - BLOCK
      ?auto_32501 - BLOCK
      ?auto_32502 - BLOCK
      ?auto_32503 - BLOCK
      ?auto_32504 - BLOCK
      ?auto_32505 - BLOCK
      ?auto_32506 - BLOCK
    )
    :vars
    (
      ?auto_32507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32506 ?auto_32507 ) ( ON-TABLE ?auto_32499 ) ( not ( = ?auto_32499 ?auto_32500 ) ) ( not ( = ?auto_32499 ?auto_32501 ) ) ( not ( = ?auto_32499 ?auto_32502 ) ) ( not ( = ?auto_32499 ?auto_32503 ) ) ( not ( = ?auto_32499 ?auto_32504 ) ) ( not ( = ?auto_32499 ?auto_32505 ) ) ( not ( = ?auto_32499 ?auto_32506 ) ) ( not ( = ?auto_32499 ?auto_32507 ) ) ( not ( = ?auto_32500 ?auto_32501 ) ) ( not ( = ?auto_32500 ?auto_32502 ) ) ( not ( = ?auto_32500 ?auto_32503 ) ) ( not ( = ?auto_32500 ?auto_32504 ) ) ( not ( = ?auto_32500 ?auto_32505 ) ) ( not ( = ?auto_32500 ?auto_32506 ) ) ( not ( = ?auto_32500 ?auto_32507 ) ) ( not ( = ?auto_32501 ?auto_32502 ) ) ( not ( = ?auto_32501 ?auto_32503 ) ) ( not ( = ?auto_32501 ?auto_32504 ) ) ( not ( = ?auto_32501 ?auto_32505 ) ) ( not ( = ?auto_32501 ?auto_32506 ) ) ( not ( = ?auto_32501 ?auto_32507 ) ) ( not ( = ?auto_32502 ?auto_32503 ) ) ( not ( = ?auto_32502 ?auto_32504 ) ) ( not ( = ?auto_32502 ?auto_32505 ) ) ( not ( = ?auto_32502 ?auto_32506 ) ) ( not ( = ?auto_32502 ?auto_32507 ) ) ( not ( = ?auto_32503 ?auto_32504 ) ) ( not ( = ?auto_32503 ?auto_32505 ) ) ( not ( = ?auto_32503 ?auto_32506 ) ) ( not ( = ?auto_32503 ?auto_32507 ) ) ( not ( = ?auto_32504 ?auto_32505 ) ) ( not ( = ?auto_32504 ?auto_32506 ) ) ( not ( = ?auto_32504 ?auto_32507 ) ) ( not ( = ?auto_32505 ?auto_32506 ) ) ( not ( = ?auto_32505 ?auto_32507 ) ) ( not ( = ?auto_32506 ?auto_32507 ) ) ( ON ?auto_32505 ?auto_32506 ) ( ON ?auto_32504 ?auto_32505 ) ( ON ?auto_32503 ?auto_32504 ) ( ON ?auto_32502 ?auto_32503 ) ( ON ?auto_32501 ?auto_32502 ) ( CLEAR ?auto_32499 ) ( ON ?auto_32500 ?auto_32501 ) ( CLEAR ?auto_32500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32499 ?auto_32500 )
      ( MAKE-8PILE ?auto_32499 ?auto_32500 ?auto_32501 ?auto_32502 ?auto_32503 ?auto_32504 ?auto_32505 ?auto_32506 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_32516 - BLOCK
      ?auto_32517 - BLOCK
      ?auto_32518 - BLOCK
      ?auto_32519 - BLOCK
      ?auto_32520 - BLOCK
      ?auto_32521 - BLOCK
      ?auto_32522 - BLOCK
      ?auto_32523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32523 ) ( ON-TABLE ?auto_32516 ) ( not ( = ?auto_32516 ?auto_32517 ) ) ( not ( = ?auto_32516 ?auto_32518 ) ) ( not ( = ?auto_32516 ?auto_32519 ) ) ( not ( = ?auto_32516 ?auto_32520 ) ) ( not ( = ?auto_32516 ?auto_32521 ) ) ( not ( = ?auto_32516 ?auto_32522 ) ) ( not ( = ?auto_32516 ?auto_32523 ) ) ( not ( = ?auto_32517 ?auto_32518 ) ) ( not ( = ?auto_32517 ?auto_32519 ) ) ( not ( = ?auto_32517 ?auto_32520 ) ) ( not ( = ?auto_32517 ?auto_32521 ) ) ( not ( = ?auto_32517 ?auto_32522 ) ) ( not ( = ?auto_32517 ?auto_32523 ) ) ( not ( = ?auto_32518 ?auto_32519 ) ) ( not ( = ?auto_32518 ?auto_32520 ) ) ( not ( = ?auto_32518 ?auto_32521 ) ) ( not ( = ?auto_32518 ?auto_32522 ) ) ( not ( = ?auto_32518 ?auto_32523 ) ) ( not ( = ?auto_32519 ?auto_32520 ) ) ( not ( = ?auto_32519 ?auto_32521 ) ) ( not ( = ?auto_32519 ?auto_32522 ) ) ( not ( = ?auto_32519 ?auto_32523 ) ) ( not ( = ?auto_32520 ?auto_32521 ) ) ( not ( = ?auto_32520 ?auto_32522 ) ) ( not ( = ?auto_32520 ?auto_32523 ) ) ( not ( = ?auto_32521 ?auto_32522 ) ) ( not ( = ?auto_32521 ?auto_32523 ) ) ( not ( = ?auto_32522 ?auto_32523 ) ) ( ON ?auto_32522 ?auto_32523 ) ( ON ?auto_32521 ?auto_32522 ) ( ON ?auto_32520 ?auto_32521 ) ( ON ?auto_32519 ?auto_32520 ) ( ON ?auto_32518 ?auto_32519 ) ( CLEAR ?auto_32516 ) ( ON ?auto_32517 ?auto_32518 ) ( CLEAR ?auto_32517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32516 ?auto_32517 )
      ( MAKE-8PILE ?auto_32516 ?auto_32517 ?auto_32518 ?auto_32519 ?auto_32520 ?auto_32521 ?auto_32522 ?auto_32523 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_32532 - BLOCK
      ?auto_32533 - BLOCK
      ?auto_32534 - BLOCK
      ?auto_32535 - BLOCK
      ?auto_32536 - BLOCK
      ?auto_32537 - BLOCK
      ?auto_32538 - BLOCK
      ?auto_32539 - BLOCK
    )
    :vars
    (
      ?auto_32540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32539 ?auto_32540 ) ( not ( = ?auto_32532 ?auto_32533 ) ) ( not ( = ?auto_32532 ?auto_32534 ) ) ( not ( = ?auto_32532 ?auto_32535 ) ) ( not ( = ?auto_32532 ?auto_32536 ) ) ( not ( = ?auto_32532 ?auto_32537 ) ) ( not ( = ?auto_32532 ?auto_32538 ) ) ( not ( = ?auto_32532 ?auto_32539 ) ) ( not ( = ?auto_32532 ?auto_32540 ) ) ( not ( = ?auto_32533 ?auto_32534 ) ) ( not ( = ?auto_32533 ?auto_32535 ) ) ( not ( = ?auto_32533 ?auto_32536 ) ) ( not ( = ?auto_32533 ?auto_32537 ) ) ( not ( = ?auto_32533 ?auto_32538 ) ) ( not ( = ?auto_32533 ?auto_32539 ) ) ( not ( = ?auto_32533 ?auto_32540 ) ) ( not ( = ?auto_32534 ?auto_32535 ) ) ( not ( = ?auto_32534 ?auto_32536 ) ) ( not ( = ?auto_32534 ?auto_32537 ) ) ( not ( = ?auto_32534 ?auto_32538 ) ) ( not ( = ?auto_32534 ?auto_32539 ) ) ( not ( = ?auto_32534 ?auto_32540 ) ) ( not ( = ?auto_32535 ?auto_32536 ) ) ( not ( = ?auto_32535 ?auto_32537 ) ) ( not ( = ?auto_32535 ?auto_32538 ) ) ( not ( = ?auto_32535 ?auto_32539 ) ) ( not ( = ?auto_32535 ?auto_32540 ) ) ( not ( = ?auto_32536 ?auto_32537 ) ) ( not ( = ?auto_32536 ?auto_32538 ) ) ( not ( = ?auto_32536 ?auto_32539 ) ) ( not ( = ?auto_32536 ?auto_32540 ) ) ( not ( = ?auto_32537 ?auto_32538 ) ) ( not ( = ?auto_32537 ?auto_32539 ) ) ( not ( = ?auto_32537 ?auto_32540 ) ) ( not ( = ?auto_32538 ?auto_32539 ) ) ( not ( = ?auto_32538 ?auto_32540 ) ) ( not ( = ?auto_32539 ?auto_32540 ) ) ( ON ?auto_32538 ?auto_32539 ) ( ON ?auto_32537 ?auto_32538 ) ( ON ?auto_32536 ?auto_32537 ) ( ON ?auto_32535 ?auto_32536 ) ( ON ?auto_32534 ?auto_32535 ) ( ON ?auto_32533 ?auto_32534 ) ( ON ?auto_32532 ?auto_32533 ) ( CLEAR ?auto_32532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32532 )
      ( MAKE-8PILE ?auto_32532 ?auto_32533 ?auto_32534 ?auto_32535 ?auto_32536 ?auto_32537 ?auto_32538 ?auto_32539 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_32549 - BLOCK
      ?auto_32550 - BLOCK
      ?auto_32551 - BLOCK
      ?auto_32552 - BLOCK
      ?auto_32553 - BLOCK
      ?auto_32554 - BLOCK
      ?auto_32555 - BLOCK
      ?auto_32556 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32556 ) ( not ( = ?auto_32549 ?auto_32550 ) ) ( not ( = ?auto_32549 ?auto_32551 ) ) ( not ( = ?auto_32549 ?auto_32552 ) ) ( not ( = ?auto_32549 ?auto_32553 ) ) ( not ( = ?auto_32549 ?auto_32554 ) ) ( not ( = ?auto_32549 ?auto_32555 ) ) ( not ( = ?auto_32549 ?auto_32556 ) ) ( not ( = ?auto_32550 ?auto_32551 ) ) ( not ( = ?auto_32550 ?auto_32552 ) ) ( not ( = ?auto_32550 ?auto_32553 ) ) ( not ( = ?auto_32550 ?auto_32554 ) ) ( not ( = ?auto_32550 ?auto_32555 ) ) ( not ( = ?auto_32550 ?auto_32556 ) ) ( not ( = ?auto_32551 ?auto_32552 ) ) ( not ( = ?auto_32551 ?auto_32553 ) ) ( not ( = ?auto_32551 ?auto_32554 ) ) ( not ( = ?auto_32551 ?auto_32555 ) ) ( not ( = ?auto_32551 ?auto_32556 ) ) ( not ( = ?auto_32552 ?auto_32553 ) ) ( not ( = ?auto_32552 ?auto_32554 ) ) ( not ( = ?auto_32552 ?auto_32555 ) ) ( not ( = ?auto_32552 ?auto_32556 ) ) ( not ( = ?auto_32553 ?auto_32554 ) ) ( not ( = ?auto_32553 ?auto_32555 ) ) ( not ( = ?auto_32553 ?auto_32556 ) ) ( not ( = ?auto_32554 ?auto_32555 ) ) ( not ( = ?auto_32554 ?auto_32556 ) ) ( not ( = ?auto_32555 ?auto_32556 ) ) ( ON ?auto_32555 ?auto_32556 ) ( ON ?auto_32554 ?auto_32555 ) ( ON ?auto_32553 ?auto_32554 ) ( ON ?auto_32552 ?auto_32553 ) ( ON ?auto_32551 ?auto_32552 ) ( ON ?auto_32550 ?auto_32551 ) ( ON ?auto_32549 ?auto_32550 ) ( CLEAR ?auto_32549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32549 )
      ( MAKE-8PILE ?auto_32549 ?auto_32550 ?auto_32551 ?auto_32552 ?auto_32553 ?auto_32554 ?auto_32555 ?auto_32556 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_32565 - BLOCK
      ?auto_32566 - BLOCK
      ?auto_32567 - BLOCK
      ?auto_32568 - BLOCK
      ?auto_32569 - BLOCK
      ?auto_32570 - BLOCK
      ?auto_32571 - BLOCK
      ?auto_32572 - BLOCK
    )
    :vars
    (
      ?auto_32573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32565 ?auto_32566 ) ) ( not ( = ?auto_32565 ?auto_32567 ) ) ( not ( = ?auto_32565 ?auto_32568 ) ) ( not ( = ?auto_32565 ?auto_32569 ) ) ( not ( = ?auto_32565 ?auto_32570 ) ) ( not ( = ?auto_32565 ?auto_32571 ) ) ( not ( = ?auto_32565 ?auto_32572 ) ) ( not ( = ?auto_32566 ?auto_32567 ) ) ( not ( = ?auto_32566 ?auto_32568 ) ) ( not ( = ?auto_32566 ?auto_32569 ) ) ( not ( = ?auto_32566 ?auto_32570 ) ) ( not ( = ?auto_32566 ?auto_32571 ) ) ( not ( = ?auto_32566 ?auto_32572 ) ) ( not ( = ?auto_32567 ?auto_32568 ) ) ( not ( = ?auto_32567 ?auto_32569 ) ) ( not ( = ?auto_32567 ?auto_32570 ) ) ( not ( = ?auto_32567 ?auto_32571 ) ) ( not ( = ?auto_32567 ?auto_32572 ) ) ( not ( = ?auto_32568 ?auto_32569 ) ) ( not ( = ?auto_32568 ?auto_32570 ) ) ( not ( = ?auto_32568 ?auto_32571 ) ) ( not ( = ?auto_32568 ?auto_32572 ) ) ( not ( = ?auto_32569 ?auto_32570 ) ) ( not ( = ?auto_32569 ?auto_32571 ) ) ( not ( = ?auto_32569 ?auto_32572 ) ) ( not ( = ?auto_32570 ?auto_32571 ) ) ( not ( = ?auto_32570 ?auto_32572 ) ) ( not ( = ?auto_32571 ?auto_32572 ) ) ( ON ?auto_32565 ?auto_32573 ) ( not ( = ?auto_32572 ?auto_32573 ) ) ( not ( = ?auto_32571 ?auto_32573 ) ) ( not ( = ?auto_32570 ?auto_32573 ) ) ( not ( = ?auto_32569 ?auto_32573 ) ) ( not ( = ?auto_32568 ?auto_32573 ) ) ( not ( = ?auto_32567 ?auto_32573 ) ) ( not ( = ?auto_32566 ?auto_32573 ) ) ( not ( = ?auto_32565 ?auto_32573 ) ) ( ON ?auto_32566 ?auto_32565 ) ( ON ?auto_32567 ?auto_32566 ) ( ON ?auto_32568 ?auto_32567 ) ( ON ?auto_32569 ?auto_32568 ) ( ON ?auto_32570 ?auto_32569 ) ( ON ?auto_32571 ?auto_32570 ) ( ON ?auto_32572 ?auto_32571 ) ( CLEAR ?auto_32572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_32572 ?auto_32571 ?auto_32570 ?auto_32569 ?auto_32568 ?auto_32567 ?auto_32566 ?auto_32565 )
      ( MAKE-8PILE ?auto_32565 ?auto_32566 ?auto_32567 ?auto_32568 ?auto_32569 ?auto_32570 ?auto_32571 ?auto_32572 ) )
  )

)

