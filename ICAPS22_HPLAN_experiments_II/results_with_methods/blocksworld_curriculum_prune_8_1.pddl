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

