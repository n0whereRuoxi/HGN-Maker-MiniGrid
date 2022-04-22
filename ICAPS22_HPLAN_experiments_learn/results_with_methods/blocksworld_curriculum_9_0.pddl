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
      ?auto_48721 - BLOCK
    )
    :vars
    (
      ?auto_48722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48721 ?auto_48722 ) ( CLEAR ?auto_48721 ) ( HAND-EMPTY ) ( not ( = ?auto_48721 ?auto_48722 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48721 ?auto_48722 )
      ( !PUTDOWN ?auto_48721 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48724 - BLOCK
    )
    :vars
    (
      ?auto_48725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48724 ?auto_48725 ) ( CLEAR ?auto_48724 ) ( HAND-EMPTY ) ( not ( = ?auto_48724 ?auto_48725 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48724 ?auto_48725 )
      ( !PUTDOWN ?auto_48724 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48728 - BLOCK
      ?auto_48729 - BLOCK
    )
    :vars
    (
      ?auto_48730 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48728 ) ( ON ?auto_48729 ?auto_48730 ) ( CLEAR ?auto_48729 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48728 ) ( not ( = ?auto_48728 ?auto_48729 ) ) ( not ( = ?auto_48728 ?auto_48730 ) ) ( not ( = ?auto_48729 ?auto_48730 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48729 ?auto_48730 )
      ( !STACK ?auto_48729 ?auto_48728 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48733 - BLOCK
      ?auto_48734 - BLOCK
    )
    :vars
    (
      ?auto_48735 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48733 ) ( ON ?auto_48734 ?auto_48735 ) ( CLEAR ?auto_48734 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48733 ) ( not ( = ?auto_48733 ?auto_48734 ) ) ( not ( = ?auto_48733 ?auto_48735 ) ) ( not ( = ?auto_48734 ?auto_48735 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48734 ?auto_48735 )
      ( !STACK ?auto_48734 ?auto_48733 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48738 - BLOCK
      ?auto_48739 - BLOCK
    )
    :vars
    (
      ?auto_48740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48739 ?auto_48740 ) ( not ( = ?auto_48738 ?auto_48739 ) ) ( not ( = ?auto_48738 ?auto_48740 ) ) ( not ( = ?auto_48739 ?auto_48740 ) ) ( ON ?auto_48738 ?auto_48739 ) ( CLEAR ?auto_48738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48738 )
      ( MAKE-2PILE ?auto_48738 ?auto_48739 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48743 - BLOCK
      ?auto_48744 - BLOCK
    )
    :vars
    (
      ?auto_48745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48744 ?auto_48745 ) ( not ( = ?auto_48743 ?auto_48744 ) ) ( not ( = ?auto_48743 ?auto_48745 ) ) ( not ( = ?auto_48744 ?auto_48745 ) ) ( ON ?auto_48743 ?auto_48744 ) ( CLEAR ?auto_48743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48743 )
      ( MAKE-2PILE ?auto_48743 ?auto_48744 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48749 - BLOCK
      ?auto_48750 - BLOCK
      ?auto_48751 - BLOCK
    )
    :vars
    (
      ?auto_48752 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48750 ) ( ON ?auto_48751 ?auto_48752 ) ( CLEAR ?auto_48751 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48749 ) ( ON ?auto_48750 ?auto_48749 ) ( not ( = ?auto_48749 ?auto_48750 ) ) ( not ( = ?auto_48749 ?auto_48751 ) ) ( not ( = ?auto_48749 ?auto_48752 ) ) ( not ( = ?auto_48750 ?auto_48751 ) ) ( not ( = ?auto_48750 ?auto_48752 ) ) ( not ( = ?auto_48751 ?auto_48752 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48751 ?auto_48752 )
      ( !STACK ?auto_48751 ?auto_48750 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48756 - BLOCK
      ?auto_48757 - BLOCK
      ?auto_48758 - BLOCK
    )
    :vars
    (
      ?auto_48759 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48757 ) ( ON ?auto_48758 ?auto_48759 ) ( CLEAR ?auto_48758 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48756 ) ( ON ?auto_48757 ?auto_48756 ) ( not ( = ?auto_48756 ?auto_48757 ) ) ( not ( = ?auto_48756 ?auto_48758 ) ) ( not ( = ?auto_48756 ?auto_48759 ) ) ( not ( = ?auto_48757 ?auto_48758 ) ) ( not ( = ?auto_48757 ?auto_48759 ) ) ( not ( = ?auto_48758 ?auto_48759 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48758 ?auto_48759 )
      ( !STACK ?auto_48758 ?auto_48757 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48763 - BLOCK
      ?auto_48764 - BLOCK
      ?auto_48765 - BLOCK
    )
    :vars
    (
      ?auto_48766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48765 ?auto_48766 ) ( ON-TABLE ?auto_48763 ) ( not ( = ?auto_48763 ?auto_48764 ) ) ( not ( = ?auto_48763 ?auto_48765 ) ) ( not ( = ?auto_48763 ?auto_48766 ) ) ( not ( = ?auto_48764 ?auto_48765 ) ) ( not ( = ?auto_48764 ?auto_48766 ) ) ( not ( = ?auto_48765 ?auto_48766 ) ) ( CLEAR ?auto_48763 ) ( ON ?auto_48764 ?auto_48765 ) ( CLEAR ?auto_48764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48763 ?auto_48764 )
      ( MAKE-3PILE ?auto_48763 ?auto_48764 ?auto_48765 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48770 - BLOCK
      ?auto_48771 - BLOCK
      ?auto_48772 - BLOCK
    )
    :vars
    (
      ?auto_48773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48772 ?auto_48773 ) ( ON-TABLE ?auto_48770 ) ( not ( = ?auto_48770 ?auto_48771 ) ) ( not ( = ?auto_48770 ?auto_48772 ) ) ( not ( = ?auto_48770 ?auto_48773 ) ) ( not ( = ?auto_48771 ?auto_48772 ) ) ( not ( = ?auto_48771 ?auto_48773 ) ) ( not ( = ?auto_48772 ?auto_48773 ) ) ( CLEAR ?auto_48770 ) ( ON ?auto_48771 ?auto_48772 ) ( CLEAR ?auto_48771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48770 ?auto_48771 )
      ( MAKE-3PILE ?auto_48770 ?auto_48771 ?auto_48772 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48777 - BLOCK
      ?auto_48778 - BLOCK
      ?auto_48779 - BLOCK
    )
    :vars
    (
      ?auto_48780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48779 ?auto_48780 ) ( not ( = ?auto_48777 ?auto_48778 ) ) ( not ( = ?auto_48777 ?auto_48779 ) ) ( not ( = ?auto_48777 ?auto_48780 ) ) ( not ( = ?auto_48778 ?auto_48779 ) ) ( not ( = ?auto_48778 ?auto_48780 ) ) ( not ( = ?auto_48779 ?auto_48780 ) ) ( ON ?auto_48778 ?auto_48779 ) ( ON ?auto_48777 ?auto_48778 ) ( CLEAR ?auto_48777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48777 )
      ( MAKE-3PILE ?auto_48777 ?auto_48778 ?auto_48779 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48784 - BLOCK
      ?auto_48785 - BLOCK
      ?auto_48786 - BLOCK
    )
    :vars
    (
      ?auto_48787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48786 ?auto_48787 ) ( not ( = ?auto_48784 ?auto_48785 ) ) ( not ( = ?auto_48784 ?auto_48786 ) ) ( not ( = ?auto_48784 ?auto_48787 ) ) ( not ( = ?auto_48785 ?auto_48786 ) ) ( not ( = ?auto_48785 ?auto_48787 ) ) ( not ( = ?auto_48786 ?auto_48787 ) ) ( ON ?auto_48785 ?auto_48786 ) ( ON ?auto_48784 ?auto_48785 ) ( CLEAR ?auto_48784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48784 )
      ( MAKE-3PILE ?auto_48784 ?auto_48785 ?auto_48786 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48792 - BLOCK
      ?auto_48793 - BLOCK
      ?auto_48794 - BLOCK
      ?auto_48795 - BLOCK
    )
    :vars
    (
      ?auto_48796 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48794 ) ( ON ?auto_48795 ?auto_48796 ) ( CLEAR ?auto_48795 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48792 ) ( ON ?auto_48793 ?auto_48792 ) ( ON ?auto_48794 ?auto_48793 ) ( not ( = ?auto_48792 ?auto_48793 ) ) ( not ( = ?auto_48792 ?auto_48794 ) ) ( not ( = ?auto_48792 ?auto_48795 ) ) ( not ( = ?auto_48792 ?auto_48796 ) ) ( not ( = ?auto_48793 ?auto_48794 ) ) ( not ( = ?auto_48793 ?auto_48795 ) ) ( not ( = ?auto_48793 ?auto_48796 ) ) ( not ( = ?auto_48794 ?auto_48795 ) ) ( not ( = ?auto_48794 ?auto_48796 ) ) ( not ( = ?auto_48795 ?auto_48796 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48795 ?auto_48796 )
      ( !STACK ?auto_48795 ?auto_48794 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48801 - BLOCK
      ?auto_48802 - BLOCK
      ?auto_48803 - BLOCK
      ?auto_48804 - BLOCK
    )
    :vars
    (
      ?auto_48805 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48803 ) ( ON ?auto_48804 ?auto_48805 ) ( CLEAR ?auto_48804 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48801 ) ( ON ?auto_48802 ?auto_48801 ) ( ON ?auto_48803 ?auto_48802 ) ( not ( = ?auto_48801 ?auto_48802 ) ) ( not ( = ?auto_48801 ?auto_48803 ) ) ( not ( = ?auto_48801 ?auto_48804 ) ) ( not ( = ?auto_48801 ?auto_48805 ) ) ( not ( = ?auto_48802 ?auto_48803 ) ) ( not ( = ?auto_48802 ?auto_48804 ) ) ( not ( = ?auto_48802 ?auto_48805 ) ) ( not ( = ?auto_48803 ?auto_48804 ) ) ( not ( = ?auto_48803 ?auto_48805 ) ) ( not ( = ?auto_48804 ?auto_48805 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48804 ?auto_48805 )
      ( !STACK ?auto_48804 ?auto_48803 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48810 - BLOCK
      ?auto_48811 - BLOCK
      ?auto_48812 - BLOCK
      ?auto_48813 - BLOCK
    )
    :vars
    (
      ?auto_48814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48813 ?auto_48814 ) ( ON-TABLE ?auto_48810 ) ( ON ?auto_48811 ?auto_48810 ) ( not ( = ?auto_48810 ?auto_48811 ) ) ( not ( = ?auto_48810 ?auto_48812 ) ) ( not ( = ?auto_48810 ?auto_48813 ) ) ( not ( = ?auto_48810 ?auto_48814 ) ) ( not ( = ?auto_48811 ?auto_48812 ) ) ( not ( = ?auto_48811 ?auto_48813 ) ) ( not ( = ?auto_48811 ?auto_48814 ) ) ( not ( = ?auto_48812 ?auto_48813 ) ) ( not ( = ?auto_48812 ?auto_48814 ) ) ( not ( = ?auto_48813 ?auto_48814 ) ) ( CLEAR ?auto_48811 ) ( ON ?auto_48812 ?auto_48813 ) ( CLEAR ?auto_48812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48810 ?auto_48811 ?auto_48812 )
      ( MAKE-4PILE ?auto_48810 ?auto_48811 ?auto_48812 ?auto_48813 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48819 - BLOCK
      ?auto_48820 - BLOCK
      ?auto_48821 - BLOCK
      ?auto_48822 - BLOCK
    )
    :vars
    (
      ?auto_48823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48822 ?auto_48823 ) ( ON-TABLE ?auto_48819 ) ( ON ?auto_48820 ?auto_48819 ) ( not ( = ?auto_48819 ?auto_48820 ) ) ( not ( = ?auto_48819 ?auto_48821 ) ) ( not ( = ?auto_48819 ?auto_48822 ) ) ( not ( = ?auto_48819 ?auto_48823 ) ) ( not ( = ?auto_48820 ?auto_48821 ) ) ( not ( = ?auto_48820 ?auto_48822 ) ) ( not ( = ?auto_48820 ?auto_48823 ) ) ( not ( = ?auto_48821 ?auto_48822 ) ) ( not ( = ?auto_48821 ?auto_48823 ) ) ( not ( = ?auto_48822 ?auto_48823 ) ) ( CLEAR ?auto_48820 ) ( ON ?auto_48821 ?auto_48822 ) ( CLEAR ?auto_48821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48819 ?auto_48820 ?auto_48821 )
      ( MAKE-4PILE ?auto_48819 ?auto_48820 ?auto_48821 ?auto_48822 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48828 - BLOCK
      ?auto_48829 - BLOCK
      ?auto_48830 - BLOCK
      ?auto_48831 - BLOCK
    )
    :vars
    (
      ?auto_48832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48831 ?auto_48832 ) ( ON-TABLE ?auto_48828 ) ( not ( = ?auto_48828 ?auto_48829 ) ) ( not ( = ?auto_48828 ?auto_48830 ) ) ( not ( = ?auto_48828 ?auto_48831 ) ) ( not ( = ?auto_48828 ?auto_48832 ) ) ( not ( = ?auto_48829 ?auto_48830 ) ) ( not ( = ?auto_48829 ?auto_48831 ) ) ( not ( = ?auto_48829 ?auto_48832 ) ) ( not ( = ?auto_48830 ?auto_48831 ) ) ( not ( = ?auto_48830 ?auto_48832 ) ) ( not ( = ?auto_48831 ?auto_48832 ) ) ( ON ?auto_48830 ?auto_48831 ) ( CLEAR ?auto_48828 ) ( ON ?auto_48829 ?auto_48830 ) ( CLEAR ?auto_48829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48828 ?auto_48829 )
      ( MAKE-4PILE ?auto_48828 ?auto_48829 ?auto_48830 ?auto_48831 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48837 - BLOCK
      ?auto_48838 - BLOCK
      ?auto_48839 - BLOCK
      ?auto_48840 - BLOCK
    )
    :vars
    (
      ?auto_48841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48840 ?auto_48841 ) ( ON-TABLE ?auto_48837 ) ( not ( = ?auto_48837 ?auto_48838 ) ) ( not ( = ?auto_48837 ?auto_48839 ) ) ( not ( = ?auto_48837 ?auto_48840 ) ) ( not ( = ?auto_48837 ?auto_48841 ) ) ( not ( = ?auto_48838 ?auto_48839 ) ) ( not ( = ?auto_48838 ?auto_48840 ) ) ( not ( = ?auto_48838 ?auto_48841 ) ) ( not ( = ?auto_48839 ?auto_48840 ) ) ( not ( = ?auto_48839 ?auto_48841 ) ) ( not ( = ?auto_48840 ?auto_48841 ) ) ( ON ?auto_48839 ?auto_48840 ) ( CLEAR ?auto_48837 ) ( ON ?auto_48838 ?auto_48839 ) ( CLEAR ?auto_48838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48837 ?auto_48838 )
      ( MAKE-4PILE ?auto_48837 ?auto_48838 ?auto_48839 ?auto_48840 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48846 - BLOCK
      ?auto_48847 - BLOCK
      ?auto_48848 - BLOCK
      ?auto_48849 - BLOCK
    )
    :vars
    (
      ?auto_48850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48849 ?auto_48850 ) ( not ( = ?auto_48846 ?auto_48847 ) ) ( not ( = ?auto_48846 ?auto_48848 ) ) ( not ( = ?auto_48846 ?auto_48849 ) ) ( not ( = ?auto_48846 ?auto_48850 ) ) ( not ( = ?auto_48847 ?auto_48848 ) ) ( not ( = ?auto_48847 ?auto_48849 ) ) ( not ( = ?auto_48847 ?auto_48850 ) ) ( not ( = ?auto_48848 ?auto_48849 ) ) ( not ( = ?auto_48848 ?auto_48850 ) ) ( not ( = ?auto_48849 ?auto_48850 ) ) ( ON ?auto_48848 ?auto_48849 ) ( ON ?auto_48847 ?auto_48848 ) ( ON ?auto_48846 ?auto_48847 ) ( CLEAR ?auto_48846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48846 )
      ( MAKE-4PILE ?auto_48846 ?auto_48847 ?auto_48848 ?auto_48849 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48855 - BLOCK
      ?auto_48856 - BLOCK
      ?auto_48857 - BLOCK
      ?auto_48858 - BLOCK
    )
    :vars
    (
      ?auto_48859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48858 ?auto_48859 ) ( not ( = ?auto_48855 ?auto_48856 ) ) ( not ( = ?auto_48855 ?auto_48857 ) ) ( not ( = ?auto_48855 ?auto_48858 ) ) ( not ( = ?auto_48855 ?auto_48859 ) ) ( not ( = ?auto_48856 ?auto_48857 ) ) ( not ( = ?auto_48856 ?auto_48858 ) ) ( not ( = ?auto_48856 ?auto_48859 ) ) ( not ( = ?auto_48857 ?auto_48858 ) ) ( not ( = ?auto_48857 ?auto_48859 ) ) ( not ( = ?auto_48858 ?auto_48859 ) ) ( ON ?auto_48857 ?auto_48858 ) ( ON ?auto_48856 ?auto_48857 ) ( ON ?auto_48855 ?auto_48856 ) ( CLEAR ?auto_48855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48855 )
      ( MAKE-4PILE ?auto_48855 ?auto_48856 ?auto_48857 ?auto_48858 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48865 - BLOCK
      ?auto_48866 - BLOCK
      ?auto_48867 - BLOCK
      ?auto_48868 - BLOCK
      ?auto_48869 - BLOCK
    )
    :vars
    (
      ?auto_48870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48868 ) ( ON ?auto_48869 ?auto_48870 ) ( CLEAR ?auto_48869 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48865 ) ( ON ?auto_48866 ?auto_48865 ) ( ON ?auto_48867 ?auto_48866 ) ( ON ?auto_48868 ?auto_48867 ) ( not ( = ?auto_48865 ?auto_48866 ) ) ( not ( = ?auto_48865 ?auto_48867 ) ) ( not ( = ?auto_48865 ?auto_48868 ) ) ( not ( = ?auto_48865 ?auto_48869 ) ) ( not ( = ?auto_48865 ?auto_48870 ) ) ( not ( = ?auto_48866 ?auto_48867 ) ) ( not ( = ?auto_48866 ?auto_48868 ) ) ( not ( = ?auto_48866 ?auto_48869 ) ) ( not ( = ?auto_48866 ?auto_48870 ) ) ( not ( = ?auto_48867 ?auto_48868 ) ) ( not ( = ?auto_48867 ?auto_48869 ) ) ( not ( = ?auto_48867 ?auto_48870 ) ) ( not ( = ?auto_48868 ?auto_48869 ) ) ( not ( = ?auto_48868 ?auto_48870 ) ) ( not ( = ?auto_48869 ?auto_48870 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48869 ?auto_48870 )
      ( !STACK ?auto_48869 ?auto_48868 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48876 - BLOCK
      ?auto_48877 - BLOCK
      ?auto_48878 - BLOCK
      ?auto_48879 - BLOCK
      ?auto_48880 - BLOCK
    )
    :vars
    (
      ?auto_48881 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48879 ) ( ON ?auto_48880 ?auto_48881 ) ( CLEAR ?auto_48880 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48876 ) ( ON ?auto_48877 ?auto_48876 ) ( ON ?auto_48878 ?auto_48877 ) ( ON ?auto_48879 ?auto_48878 ) ( not ( = ?auto_48876 ?auto_48877 ) ) ( not ( = ?auto_48876 ?auto_48878 ) ) ( not ( = ?auto_48876 ?auto_48879 ) ) ( not ( = ?auto_48876 ?auto_48880 ) ) ( not ( = ?auto_48876 ?auto_48881 ) ) ( not ( = ?auto_48877 ?auto_48878 ) ) ( not ( = ?auto_48877 ?auto_48879 ) ) ( not ( = ?auto_48877 ?auto_48880 ) ) ( not ( = ?auto_48877 ?auto_48881 ) ) ( not ( = ?auto_48878 ?auto_48879 ) ) ( not ( = ?auto_48878 ?auto_48880 ) ) ( not ( = ?auto_48878 ?auto_48881 ) ) ( not ( = ?auto_48879 ?auto_48880 ) ) ( not ( = ?auto_48879 ?auto_48881 ) ) ( not ( = ?auto_48880 ?auto_48881 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48880 ?auto_48881 )
      ( !STACK ?auto_48880 ?auto_48879 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48887 - BLOCK
      ?auto_48888 - BLOCK
      ?auto_48889 - BLOCK
      ?auto_48890 - BLOCK
      ?auto_48891 - BLOCK
    )
    :vars
    (
      ?auto_48892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48891 ?auto_48892 ) ( ON-TABLE ?auto_48887 ) ( ON ?auto_48888 ?auto_48887 ) ( ON ?auto_48889 ?auto_48888 ) ( not ( = ?auto_48887 ?auto_48888 ) ) ( not ( = ?auto_48887 ?auto_48889 ) ) ( not ( = ?auto_48887 ?auto_48890 ) ) ( not ( = ?auto_48887 ?auto_48891 ) ) ( not ( = ?auto_48887 ?auto_48892 ) ) ( not ( = ?auto_48888 ?auto_48889 ) ) ( not ( = ?auto_48888 ?auto_48890 ) ) ( not ( = ?auto_48888 ?auto_48891 ) ) ( not ( = ?auto_48888 ?auto_48892 ) ) ( not ( = ?auto_48889 ?auto_48890 ) ) ( not ( = ?auto_48889 ?auto_48891 ) ) ( not ( = ?auto_48889 ?auto_48892 ) ) ( not ( = ?auto_48890 ?auto_48891 ) ) ( not ( = ?auto_48890 ?auto_48892 ) ) ( not ( = ?auto_48891 ?auto_48892 ) ) ( CLEAR ?auto_48889 ) ( ON ?auto_48890 ?auto_48891 ) ( CLEAR ?auto_48890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48887 ?auto_48888 ?auto_48889 ?auto_48890 )
      ( MAKE-5PILE ?auto_48887 ?auto_48888 ?auto_48889 ?auto_48890 ?auto_48891 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48898 - BLOCK
      ?auto_48899 - BLOCK
      ?auto_48900 - BLOCK
      ?auto_48901 - BLOCK
      ?auto_48902 - BLOCK
    )
    :vars
    (
      ?auto_48903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48902 ?auto_48903 ) ( ON-TABLE ?auto_48898 ) ( ON ?auto_48899 ?auto_48898 ) ( ON ?auto_48900 ?auto_48899 ) ( not ( = ?auto_48898 ?auto_48899 ) ) ( not ( = ?auto_48898 ?auto_48900 ) ) ( not ( = ?auto_48898 ?auto_48901 ) ) ( not ( = ?auto_48898 ?auto_48902 ) ) ( not ( = ?auto_48898 ?auto_48903 ) ) ( not ( = ?auto_48899 ?auto_48900 ) ) ( not ( = ?auto_48899 ?auto_48901 ) ) ( not ( = ?auto_48899 ?auto_48902 ) ) ( not ( = ?auto_48899 ?auto_48903 ) ) ( not ( = ?auto_48900 ?auto_48901 ) ) ( not ( = ?auto_48900 ?auto_48902 ) ) ( not ( = ?auto_48900 ?auto_48903 ) ) ( not ( = ?auto_48901 ?auto_48902 ) ) ( not ( = ?auto_48901 ?auto_48903 ) ) ( not ( = ?auto_48902 ?auto_48903 ) ) ( CLEAR ?auto_48900 ) ( ON ?auto_48901 ?auto_48902 ) ( CLEAR ?auto_48901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48898 ?auto_48899 ?auto_48900 ?auto_48901 )
      ( MAKE-5PILE ?auto_48898 ?auto_48899 ?auto_48900 ?auto_48901 ?auto_48902 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48909 - BLOCK
      ?auto_48910 - BLOCK
      ?auto_48911 - BLOCK
      ?auto_48912 - BLOCK
      ?auto_48913 - BLOCK
    )
    :vars
    (
      ?auto_48914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48913 ?auto_48914 ) ( ON-TABLE ?auto_48909 ) ( ON ?auto_48910 ?auto_48909 ) ( not ( = ?auto_48909 ?auto_48910 ) ) ( not ( = ?auto_48909 ?auto_48911 ) ) ( not ( = ?auto_48909 ?auto_48912 ) ) ( not ( = ?auto_48909 ?auto_48913 ) ) ( not ( = ?auto_48909 ?auto_48914 ) ) ( not ( = ?auto_48910 ?auto_48911 ) ) ( not ( = ?auto_48910 ?auto_48912 ) ) ( not ( = ?auto_48910 ?auto_48913 ) ) ( not ( = ?auto_48910 ?auto_48914 ) ) ( not ( = ?auto_48911 ?auto_48912 ) ) ( not ( = ?auto_48911 ?auto_48913 ) ) ( not ( = ?auto_48911 ?auto_48914 ) ) ( not ( = ?auto_48912 ?auto_48913 ) ) ( not ( = ?auto_48912 ?auto_48914 ) ) ( not ( = ?auto_48913 ?auto_48914 ) ) ( ON ?auto_48912 ?auto_48913 ) ( CLEAR ?auto_48910 ) ( ON ?auto_48911 ?auto_48912 ) ( CLEAR ?auto_48911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48909 ?auto_48910 ?auto_48911 )
      ( MAKE-5PILE ?auto_48909 ?auto_48910 ?auto_48911 ?auto_48912 ?auto_48913 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48920 - BLOCK
      ?auto_48921 - BLOCK
      ?auto_48922 - BLOCK
      ?auto_48923 - BLOCK
      ?auto_48924 - BLOCK
    )
    :vars
    (
      ?auto_48925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48924 ?auto_48925 ) ( ON-TABLE ?auto_48920 ) ( ON ?auto_48921 ?auto_48920 ) ( not ( = ?auto_48920 ?auto_48921 ) ) ( not ( = ?auto_48920 ?auto_48922 ) ) ( not ( = ?auto_48920 ?auto_48923 ) ) ( not ( = ?auto_48920 ?auto_48924 ) ) ( not ( = ?auto_48920 ?auto_48925 ) ) ( not ( = ?auto_48921 ?auto_48922 ) ) ( not ( = ?auto_48921 ?auto_48923 ) ) ( not ( = ?auto_48921 ?auto_48924 ) ) ( not ( = ?auto_48921 ?auto_48925 ) ) ( not ( = ?auto_48922 ?auto_48923 ) ) ( not ( = ?auto_48922 ?auto_48924 ) ) ( not ( = ?auto_48922 ?auto_48925 ) ) ( not ( = ?auto_48923 ?auto_48924 ) ) ( not ( = ?auto_48923 ?auto_48925 ) ) ( not ( = ?auto_48924 ?auto_48925 ) ) ( ON ?auto_48923 ?auto_48924 ) ( CLEAR ?auto_48921 ) ( ON ?auto_48922 ?auto_48923 ) ( CLEAR ?auto_48922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48920 ?auto_48921 ?auto_48922 )
      ( MAKE-5PILE ?auto_48920 ?auto_48921 ?auto_48922 ?auto_48923 ?auto_48924 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48931 - BLOCK
      ?auto_48932 - BLOCK
      ?auto_48933 - BLOCK
      ?auto_48934 - BLOCK
      ?auto_48935 - BLOCK
    )
    :vars
    (
      ?auto_48936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48935 ?auto_48936 ) ( ON-TABLE ?auto_48931 ) ( not ( = ?auto_48931 ?auto_48932 ) ) ( not ( = ?auto_48931 ?auto_48933 ) ) ( not ( = ?auto_48931 ?auto_48934 ) ) ( not ( = ?auto_48931 ?auto_48935 ) ) ( not ( = ?auto_48931 ?auto_48936 ) ) ( not ( = ?auto_48932 ?auto_48933 ) ) ( not ( = ?auto_48932 ?auto_48934 ) ) ( not ( = ?auto_48932 ?auto_48935 ) ) ( not ( = ?auto_48932 ?auto_48936 ) ) ( not ( = ?auto_48933 ?auto_48934 ) ) ( not ( = ?auto_48933 ?auto_48935 ) ) ( not ( = ?auto_48933 ?auto_48936 ) ) ( not ( = ?auto_48934 ?auto_48935 ) ) ( not ( = ?auto_48934 ?auto_48936 ) ) ( not ( = ?auto_48935 ?auto_48936 ) ) ( ON ?auto_48934 ?auto_48935 ) ( ON ?auto_48933 ?auto_48934 ) ( CLEAR ?auto_48931 ) ( ON ?auto_48932 ?auto_48933 ) ( CLEAR ?auto_48932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48931 ?auto_48932 )
      ( MAKE-5PILE ?auto_48931 ?auto_48932 ?auto_48933 ?auto_48934 ?auto_48935 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48942 - BLOCK
      ?auto_48943 - BLOCK
      ?auto_48944 - BLOCK
      ?auto_48945 - BLOCK
      ?auto_48946 - BLOCK
    )
    :vars
    (
      ?auto_48947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48946 ?auto_48947 ) ( ON-TABLE ?auto_48942 ) ( not ( = ?auto_48942 ?auto_48943 ) ) ( not ( = ?auto_48942 ?auto_48944 ) ) ( not ( = ?auto_48942 ?auto_48945 ) ) ( not ( = ?auto_48942 ?auto_48946 ) ) ( not ( = ?auto_48942 ?auto_48947 ) ) ( not ( = ?auto_48943 ?auto_48944 ) ) ( not ( = ?auto_48943 ?auto_48945 ) ) ( not ( = ?auto_48943 ?auto_48946 ) ) ( not ( = ?auto_48943 ?auto_48947 ) ) ( not ( = ?auto_48944 ?auto_48945 ) ) ( not ( = ?auto_48944 ?auto_48946 ) ) ( not ( = ?auto_48944 ?auto_48947 ) ) ( not ( = ?auto_48945 ?auto_48946 ) ) ( not ( = ?auto_48945 ?auto_48947 ) ) ( not ( = ?auto_48946 ?auto_48947 ) ) ( ON ?auto_48945 ?auto_48946 ) ( ON ?auto_48944 ?auto_48945 ) ( CLEAR ?auto_48942 ) ( ON ?auto_48943 ?auto_48944 ) ( CLEAR ?auto_48943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48942 ?auto_48943 )
      ( MAKE-5PILE ?auto_48942 ?auto_48943 ?auto_48944 ?auto_48945 ?auto_48946 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48953 - BLOCK
      ?auto_48954 - BLOCK
      ?auto_48955 - BLOCK
      ?auto_48956 - BLOCK
      ?auto_48957 - BLOCK
    )
    :vars
    (
      ?auto_48958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48957 ?auto_48958 ) ( not ( = ?auto_48953 ?auto_48954 ) ) ( not ( = ?auto_48953 ?auto_48955 ) ) ( not ( = ?auto_48953 ?auto_48956 ) ) ( not ( = ?auto_48953 ?auto_48957 ) ) ( not ( = ?auto_48953 ?auto_48958 ) ) ( not ( = ?auto_48954 ?auto_48955 ) ) ( not ( = ?auto_48954 ?auto_48956 ) ) ( not ( = ?auto_48954 ?auto_48957 ) ) ( not ( = ?auto_48954 ?auto_48958 ) ) ( not ( = ?auto_48955 ?auto_48956 ) ) ( not ( = ?auto_48955 ?auto_48957 ) ) ( not ( = ?auto_48955 ?auto_48958 ) ) ( not ( = ?auto_48956 ?auto_48957 ) ) ( not ( = ?auto_48956 ?auto_48958 ) ) ( not ( = ?auto_48957 ?auto_48958 ) ) ( ON ?auto_48956 ?auto_48957 ) ( ON ?auto_48955 ?auto_48956 ) ( ON ?auto_48954 ?auto_48955 ) ( ON ?auto_48953 ?auto_48954 ) ( CLEAR ?auto_48953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48953 )
      ( MAKE-5PILE ?auto_48953 ?auto_48954 ?auto_48955 ?auto_48956 ?auto_48957 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48964 - BLOCK
      ?auto_48965 - BLOCK
      ?auto_48966 - BLOCK
      ?auto_48967 - BLOCK
      ?auto_48968 - BLOCK
    )
    :vars
    (
      ?auto_48969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48968 ?auto_48969 ) ( not ( = ?auto_48964 ?auto_48965 ) ) ( not ( = ?auto_48964 ?auto_48966 ) ) ( not ( = ?auto_48964 ?auto_48967 ) ) ( not ( = ?auto_48964 ?auto_48968 ) ) ( not ( = ?auto_48964 ?auto_48969 ) ) ( not ( = ?auto_48965 ?auto_48966 ) ) ( not ( = ?auto_48965 ?auto_48967 ) ) ( not ( = ?auto_48965 ?auto_48968 ) ) ( not ( = ?auto_48965 ?auto_48969 ) ) ( not ( = ?auto_48966 ?auto_48967 ) ) ( not ( = ?auto_48966 ?auto_48968 ) ) ( not ( = ?auto_48966 ?auto_48969 ) ) ( not ( = ?auto_48967 ?auto_48968 ) ) ( not ( = ?auto_48967 ?auto_48969 ) ) ( not ( = ?auto_48968 ?auto_48969 ) ) ( ON ?auto_48967 ?auto_48968 ) ( ON ?auto_48966 ?auto_48967 ) ( ON ?auto_48965 ?auto_48966 ) ( ON ?auto_48964 ?auto_48965 ) ( CLEAR ?auto_48964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48964 )
      ( MAKE-5PILE ?auto_48964 ?auto_48965 ?auto_48966 ?auto_48967 ?auto_48968 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48976 - BLOCK
      ?auto_48977 - BLOCK
      ?auto_48978 - BLOCK
      ?auto_48979 - BLOCK
      ?auto_48980 - BLOCK
      ?auto_48981 - BLOCK
    )
    :vars
    (
      ?auto_48982 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48980 ) ( ON ?auto_48981 ?auto_48982 ) ( CLEAR ?auto_48981 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48976 ) ( ON ?auto_48977 ?auto_48976 ) ( ON ?auto_48978 ?auto_48977 ) ( ON ?auto_48979 ?auto_48978 ) ( ON ?auto_48980 ?auto_48979 ) ( not ( = ?auto_48976 ?auto_48977 ) ) ( not ( = ?auto_48976 ?auto_48978 ) ) ( not ( = ?auto_48976 ?auto_48979 ) ) ( not ( = ?auto_48976 ?auto_48980 ) ) ( not ( = ?auto_48976 ?auto_48981 ) ) ( not ( = ?auto_48976 ?auto_48982 ) ) ( not ( = ?auto_48977 ?auto_48978 ) ) ( not ( = ?auto_48977 ?auto_48979 ) ) ( not ( = ?auto_48977 ?auto_48980 ) ) ( not ( = ?auto_48977 ?auto_48981 ) ) ( not ( = ?auto_48977 ?auto_48982 ) ) ( not ( = ?auto_48978 ?auto_48979 ) ) ( not ( = ?auto_48978 ?auto_48980 ) ) ( not ( = ?auto_48978 ?auto_48981 ) ) ( not ( = ?auto_48978 ?auto_48982 ) ) ( not ( = ?auto_48979 ?auto_48980 ) ) ( not ( = ?auto_48979 ?auto_48981 ) ) ( not ( = ?auto_48979 ?auto_48982 ) ) ( not ( = ?auto_48980 ?auto_48981 ) ) ( not ( = ?auto_48980 ?auto_48982 ) ) ( not ( = ?auto_48981 ?auto_48982 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48981 ?auto_48982 )
      ( !STACK ?auto_48981 ?auto_48980 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48989 - BLOCK
      ?auto_48990 - BLOCK
      ?auto_48991 - BLOCK
      ?auto_48992 - BLOCK
      ?auto_48993 - BLOCK
      ?auto_48994 - BLOCK
    )
    :vars
    (
      ?auto_48995 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48993 ) ( ON ?auto_48994 ?auto_48995 ) ( CLEAR ?auto_48994 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48989 ) ( ON ?auto_48990 ?auto_48989 ) ( ON ?auto_48991 ?auto_48990 ) ( ON ?auto_48992 ?auto_48991 ) ( ON ?auto_48993 ?auto_48992 ) ( not ( = ?auto_48989 ?auto_48990 ) ) ( not ( = ?auto_48989 ?auto_48991 ) ) ( not ( = ?auto_48989 ?auto_48992 ) ) ( not ( = ?auto_48989 ?auto_48993 ) ) ( not ( = ?auto_48989 ?auto_48994 ) ) ( not ( = ?auto_48989 ?auto_48995 ) ) ( not ( = ?auto_48990 ?auto_48991 ) ) ( not ( = ?auto_48990 ?auto_48992 ) ) ( not ( = ?auto_48990 ?auto_48993 ) ) ( not ( = ?auto_48990 ?auto_48994 ) ) ( not ( = ?auto_48990 ?auto_48995 ) ) ( not ( = ?auto_48991 ?auto_48992 ) ) ( not ( = ?auto_48991 ?auto_48993 ) ) ( not ( = ?auto_48991 ?auto_48994 ) ) ( not ( = ?auto_48991 ?auto_48995 ) ) ( not ( = ?auto_48992 ?auto_48993 ) ) ( not ( = ?auto_48992 ?auto_48994 ) ) ( not ( = ?auto_48992 ?auto_48995 ) ) ( not ( = ?auto_48993 ?auto_48994 ) ) ( not ( = ?auto_48993 ?auto_48995 ) ) ( not ( = ?auto_48994 ?auto_48995 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48994 ?auto_48995 )
      ( !STACK ?auto_48994 ?auto_48993 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49002 - BLOCK
      ?auto_49003 - BLOCK
      ?auto_49004 - BLOCK
      ?auto_49005 - BLOCK
      ?auto_49006 - BLOCK
      ?auto_49007 - BLOCK
    )
    :vars
    (
      ?auto_49008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49007 ?auto_49008 ) ( ON-TABLE ?auto_49002 ) ( ON ?auto_49003 ?auto_49002 ) ( ON ?auto_49004 ?auto_49003 ) ( ON ?auto_49005 ?auto_49004 ) ( not ( = ?auto_49002 ?auto_49003 ) ) ( not ( = ?auto_49002 ?auto_49004 ) ) ( not ( = ?auto_49002 ?auto_49005 ) ) ( not ( = ?auto_49002 ?auto_49006 ) ) ( not ( = ?auto_49002 ?auto_49007 ) ) ( not ( = ?auto_49002 ?auto_49008 ) ) ( not ( = ?auto_49003 ?auto_49004 ) ) ( not ( = ?auto_49003 ?auto_49005 ) ) ( not ( = ?auto_49003 ?auto_49006 ) ) ( not ( = ?auto_49003 ?auto_49007 ) ) ( not ( = ?auto_49003 ?auto_49008 ) ) ( not ( = ?auto_49004 ?auto_49005 ) ) ( not ( = ?auto_49004 ?auto_49006 ) ) ( not ( = ?auto_49004 ?auto_49007 ) ) ( not ( = ?auto_49004 ?auto_49008 ) ) ( not ( = ?auto_49005 ?auto_49006 ) ) ( not ( = ?auto_49005 ?auto_49007 ) ) ( not ( = ?auto_49005 ?auto_49008 ) ) ( not ( = ?auto_49006 ?auto_49007 ) ) ( not ( = ?auto_49006 ?auto_49008 ) ) ( not ( = ?auto_49007 ?auto_49008 ) ) ( CLEAR ?auto_49005 ) ( ON ?auto_49006 ?auto_49007 ) ( CLEAR ?auto_49006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49002 ?auto_49003 ?auto_49004 ?auto_49005 ?auto_49006 )
      ( MAKE-6PILE ?auto_49002 ?auto_49003 ?auto_49004 ?auto_49005 ?auto_49006 ?auto_49007 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49015 - BLOCK
      ?auto_49016 - BLOCK
      ?auto_49017 - BLOCK
      ?auto_49018 - BLOCK
      ?auto_49019 - BLOCK
      ?auto_49020 - BLOCK
    )
    :vars
    (
      ?auto_49021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49020 ?auto_49021 ) ( ON-TABLE ?auto_49015 ) ( ON ?auto_49016 ?auto_49015 ) ( ON ?auto_49017 ?auto_49016 ) ( ON ?auto_49018 ?auto_49017 ) ( not ( = ?auto_49015 ?auto_49016 ) ) ( not ( = ?auto_49015 ?auto_49017 ) ) ( not ( = ?auto_49015 ?auto_49018 ) ) ( not ( = ?auto_49015 ?auto_49019 ) ) ( not ( = ?auto_49015 ?auto_49020 ) ) ( not ( = ?auto_49015 ?auto_49021 ) ) ( not ( = ?auto_49016 ?auto_49017 ) ) ( not ( = ?auto_49016 ?auto_49018 ) ) ( not ( = ?auto_49016 ?auto_49019 ) ) ( not ( = ?auto_49016 ?auto_49020 ) ) ( not ( = ?auto_49016 ?auto_49021 ) ) ( not ( = ?auto_49017 ?auto_49018 ) ) ( not ( = ?auto_49017 ?auto_49019 ) ) ( not ( = ?auto_49017 ?auto_49020 ) ) ( not ( = ?auto_49017 ?auto_49021 ) ) ( not ( = ?auto_49018 ?auto_49019 ) ) ( not ( = ?auto_49018 ?auto_49020 ) ) ( not ( = ?auto_49018 ?auto_49021 ) ) ( not ( = ?auto_49019 ?auto_49020 ) ) ( not ( = ?auto_49019 ?auto_49021 ) ) ( not ( = ?auto_49020 ?auto_49021 ) ) ( CLEAR ?auto_49018 ) ( ON ?auto_49019 ?auto_49020 ) ( CLEAR ?auto_49019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49015 ?auto_49016 ?auto_49017 ?auto_49018 ?auto_49019 )
      ( MAKE-6PILE ?auto_49015 ?auto_49016 ?auto_49017 ?auto_49018 ?auto_49019 ?auto_49020 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49028 - BLOCK
      ?auto_49029 - BLOCK
      ?auto_49030 - BLOCK
      ?auto_49031 - BLOCK
      ?auto_49032 - BLOCK
      ?auto_49033 - BLOCK
    )
    :vars
    (
      ?auto_49034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49033 ?auto_49034 ) ( ON-TABLE ?auto_49028 ) ( ON ?auto_49029 ?auto_49028 ) ( ON ?auto_49030 ?auto_49029 ) ( not ( = ?auto_49028 ?auto_49029 ) ) ( not ( = ?auto_49028 ?auto_49030 ) ) ( not ( = ?auto_49028 ?auto_49031 ) ) ( not ( = ?auto_49028 ?auto_49032 ) ) ( not ( = ?auto_49028 ?auto_49033 ) ) ( not ( = ?auto_49028 ?auto_49034 ) ) ( not ( = ?auto_49029 ?auto_49030 ) ) ( not ( = ?auto_49029 ?auto_49031 ) ) ( not ( = ?auto_49029 ?auto_49032 ) ) ( not ( = ?auto_49029 ?auto_49033 ) ) ( not ( = ?auto_49029 ?auto_49034 ) ) ( not ( = ?auto_49030 ?auto_49031 ) ) ( not ( = ?auto_49030 ?auto_49032 ) ) ( not ( = ?auto_49030 ?auto_49033 ) ) ( not ( = ?auto_49030 ?auto_49034 ) ) ( not ( = ?auto_49031 ?auto_49032 ) ) ( not ( = ?auto_49031 ?auto_49033 ) ) ( not ( = ?auto_49031 ?auto_49034 ) ) ( not ( = ?auto_49032 ?auto_49033 ) ) ( not ( = ?auto_49032 ?auto_49034 ) ) ( not ( = ?auto_49033 ?auto_49034 ) ) ( ON ?auto_49032 ?auto_49033 ) ( CLEAR ?auto_49030 ) ( ON ?auto_49031 ?auto_49032 ) ( CLEAR ?auto_49031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49028 ?auto_49029 ?auto_49030 ?auto_49031 )
      ( MAKE-6PILE ?auto_49028 ?auto_49029 ?auto_49030 ?auto_49031 ?auto_49032 ?auto_49033 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49041 - BLOCK
      ?auto_49042 - BLOCK
      ?auto_49043 - BLOCK
      ?auto_49044 - BLOCK
      ?auto_49045 - BLOCK
      ?auto_49046 - BLOCK
    )
    :vars
    (
      ?auto_49047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49046 ?auto_49047 ) ( ON-TABLE ?auto_49041 ) ( ON ?auto_49042 ?auto_49041 ) ( ON ?auto_49043 ?auto_49042 ) ( not ( = ?auto_49041 ?auto_49042 ) ) ( not ( = ?auto_49041 ?auto_49043 ) ) ( not ( = ?auto_49041 ?auto_49044 ) ) ( not ( = ?auto_49041 ?auto_49045 ) ) ( not ( = ?auto_49041 ?auto_49046 ) ) ( not ( = ?auto_49041 ?auto_49047 ) ) ( not ( = ?auto_49042 ?auto_49043 ) ) ( not ( = ?auto_49042 ?auto_49044 ) ) ( not ( = ?auto_49042 ?auto_49045 ) ) ( not ( = ?auto_49042 ?auto_49046 ) ) ( not ( = ?auto_49042 ?auto_49047 ) ) ( not ( = ?auto_49043 ?auto_49044 ) ) ( not ( = ?auto_49043 ?auto_49045 ) ) ( not ( = ?auto_49043 ?auto_49046 ) ) ( not ( = ?auto_49043 ?auto_49047 ) ) ( not ( = ?auto_49044 ?auto_49045 ) ) ( not ( = ?auto_49044 ?auto_49046 ) ) ( not ( = ?auto_49044 ?auto_49047 ) ) ( not ( = ?auto_49045 ?auto_49046 ) ) ( not ( = ?auto_49045 ?auto_49047 ) ) ( not ( = ?auto_49046 ?auto_49047 ) ) ( ON ?auto_49045 ?auto_49046 ) ( CLEAR ?auto_49043 ) ( ON ?auto_49044 ?auto_49045 ) ( CLEAR ?auto_49044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49041 ?auto_49042 ?auto_49043 ?auto_49044 )
      ( MAKE-6PILE ?auto_49041 ?auto_49042 ?auto_49043 ?auto_49044 ?auto_49045 ?auto_49046 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49054 - BLOCK
      ?auto_49055 - BLOCK
      ?auto_49056 - BLOCK
      ?auto_49057 - BLOCK
      ?auto_49058 - BLOCK
      ?auto_49059 - BLOCK
    )
    :vars
    (
      ?auto_49060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49059 ?auto_49060 ) ( ON-TABLE ?auto_49054 ) ( ON ?auto_49055 ?auto_49054 ) ( not ( = ?auto_49054 ?auto_49055 ) ) ( not ( = ?auto_49054 ?auto_49056 ) ) ( not ( = ?auto_49054 ?auto_49057 ) ) ( not ( = ?auto_49054 ?auto_49058 ) ) ( not ( = ?auto_49054 ?auto_49059 ) ) ( not ( = ?auto_49054 ?auto_49060 ) ) ( not ( = ?auto_49055 ?auto_49056 ) ) ( not ( = ?auto_49055 ?auto_49057 ) ) ( not ( = ?auto_49055 ?auto_49058 ) ) ( not ( = ?auto_49055 ?auto_49059 ) ) ( not ( = ?auto_49055 ?auto_49060 ) ) ( not ( = ?auto_49056 ?auto_49057 ) ) ( not ( = ?auto_49056 ?auto_49058 ) ) ( not ( = ?auto_49056 ?auto_49059 ) ) ( not ( = ?auto_49056 ?auto_49060 ) ) ( not ( = ?auto_49057 ?auto_49058 ) ) ( not ( = ?auto_49057 ?auto_49059 ) ) ( not ( = ?auto_49057 ?auto_49060 ) ) ( not ( = ?auto_49058 ?auto_49059 ) ) ( not ( = ?auto_49058 ?auto_49060 ) ) ( not ( = ?auto_49059 ?auto_49060 ) ) ( ON ?auto_49058 ?auto_49059 ) ( ON ?auto_49057 ?auto_49058 ) ( CLEAR ?auto_49055 ) ( ON ?auto_49056 ?auto_49057 ) ( CLEAR ?auto_49056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49054 ?auto_49055 ?auto_49056 )
      ( MAKE-6PILE ?auto_49054 ?auto_49055 ?auto_49056 ?auto_49057 ?auto_49058 ?auto_49059 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49067 - BLOCK
      ?auto_49068 - BLOCK
      ?auto_49069 - BLOCK
      ?auto_49070 - BLOCK
      ?auto_49071 - BLOCK
      ?auto_49072 - BLOCK
    )
    :vars
    (
      ?auto_49073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49072 ?auto_49073 ) ( ON-TABLE ?auto_49067 ) ( ON ?auto_49068 ?auto_49067 ) ( not ( = ?auto_49067 ?auto_49068 ) ) ( not ( = ?auto_49067 ?auto_49069 ) ) ( not ( = ?auto_49067 ?auto_49070 ) ) ( not ( = ?auto_49067 ?auto_49071 ) ) ( not ( = ?auto_49067 ?auto_49072 ) ) ( not ( = ?auto_49067 ?auto_49073 ) ) ( not ( = ?auto_49068 ?auto_49069 ) ) ( not ( = ?auto_49068 ?auto_49070 ) ) ( not ( = ?auto_49068 ?auto_49071 ) ) ( not ( = ?auto_49068 ?auto_49072 ) ) ( not ( = ?auto_49068 ?auto_49073 ) ) ( not ( = ?auto_49069 ?auto_49070 ) ) ( not ( = ?auto_49069 ?auto_49071 ) ) ( not ( = ?auto_49069 ?auto_49072 ) ) ( not ( = ?auto_49069 ?auto_49073 ) ) ( not ( = ?auto_49070 ?auto_49071 ) ) ( not ( = ?auto_49070 ?auto_49072 ) ) ( not ( = ?auto_49070 ?auto_49073 ) ) ( not ( = ?auto_49071 ?auto_49072 ) ) ( not ( = ?auto_49071 ?auto_49073 ) ) ( not ( = ?auto_49072 ?auto_49073 ) ) ( ON ?auto_49071 ?auto_49072 ) ( ON ?auto_49070 ?auto_49071 ) ( CLEAR ?auto_49068 ) ( ON ?auto_49069 ?auto_49070 ) ( CLEAR ?auto_49069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49067 ?auto_49068 ?auto_49069 )
      ( MAKE-6PILE ?auto_49067 ?auto_49068 ?auto_49069 ?auto_49070 ?auto_49071 ?auto_49072 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49080 - BLOCK
      ?auto_49081 - BLOCK
      ?auto_49082 - BLOCK
      ?auto_49083 - BLOCK
      ?auto_49084 - BLOCK
      ?auto_49085 - BLOCK
    )
    :vars
    (
      ?auto_49086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49085 ?auto_49086 ) ( ON-TABLE ?auto_49080 ) ( not ( = ?auto_49080 ?auto_49081 ) ) ( not ( = ?auto_49080 ?auto_49082 ) ) ( not ( = ?auto_49080 ?auto_49083 ) ) ( not ( = ?auto_49080 ?auto_49084 ) ) ( not ( = ?auto_49080 ?auto_49085 ) ) ( not ( = ?auto_49080 ?auto_49086 ) ) ( not ( = ?auto_49081 ?auto_49082 ) ) ( not ( = ?auto_49081 ?auto_49083 ) ) ( not ( = ?auto_49081 ?auto_49084 ) ) ( not ( = ?auto_49081 ?auto_49085 ) ) ( not ( = ?auto_49081 ?auto_49086 ) ) ( not ( = ?auto_49082 ?auto_49083 ) ) ( not ( = ?auto_49082 ?auto_49084 ) ) ( not ( = ?auto_49082 ?auto_49085 ) ) ( not ( = ?auto_49082 ?auto_49086 ) ) ( not ( = ?auto_49083 ?auto_49084 ) ) ( not ( = ?auto_49083 ?auto_49085 ) ) ( not ( = ?auto_49083 ?auto_49086 ) ) ( not ( = ?auto_49084 ?auto_49085 ) ) ( not ( = ?auto_49084 ?auto_49086 ) ) ( not ( = ?auto_49085 ?auto_49086 ) ) ( ON ?auto_49084 ?auto_49085 ) ( ON ?auto_49083 ?auto_49084 ) ( ON ?auto_49082 ?auto_49083 ) ( CLEAR ?auto_49080 ) ( ON ?auto_49081 ?auto_49082 ) ( CLEAR ?auto_49081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49080 ?auto_49081 )
      ( MAKE-6PILE ?auto_49080 ?auto_49081 ?auto_49082 ?auto_49083 ?auto_49084 ?auto_49085 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49093 - BLOCK
      ?auto_49094 - BLOCK
      ?auto_49095 - BLOCK
      ?auto_49096 - BLOCK
      ?auto_49097 - BLOCK
      ?auto_49098 - BLOCK
    )
    :vars
    (
      ?auto_49099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49098 ?auto_49099 ) ( ON-TABLE ?auto_49093 ) ( not ( = ?auto_49093 ?auto_49094 ) ) ( not ( = ?auto_49093 ?auto_49095 ) ) ( not ( = ?auto_49093 ?auto_49096 ) ) ( not ( = ?auto_49093 ?auto_49097 ) ) ( not ( = ?auto_49093 ?auto_49098 ) ) ( not ( = ?auto_49093 ?auto_49099 ) ) ( not ( = ?auto_49094 ?auto_49095 ) ) ( not ( = ?auto_49094 ?auto_49096 ) ) ( not ( = ?auto_49094 ?auto_49097 ) ) ( not ( = ?auto_49094 ?auto_49098 ) ) ( not ( = ?auto_49094 ?auto_49099 ) ) ( not ( = ?auto_49095 ?auto_49096 ) ) ( not ( = ?auto_49095 ?auto_49097 ) ) ( not ( = ?auto_49095 ?auto_49098 ) ) ( not ( = ?auto_49095 ?auto_49099 ) ) ( not ( = ?auto_49096 ?auto_49097 ) ) ( not ( = ?auto_49096 ?auto_49098 ) ) ( not ( = ?auto_49096 ?auto_49099 ) ) ( not ( = ?auto_49097 ?auto_49098 ) ) ( not ( = ?auto_49097 ?auto_49099 ) ) ( not ( = ?auto_49098 ?auto_49099 ) ) ( ON ?auto_49097 ?auto_49098 ) ( ON ?auto_49096 ?auto_49097 ) ( ON ?auto_49095 ?auto_49096 ) ( CLEAR ?auto_49093 ) ( ON ?auto_49094 ?auto_49095 ) ( CLEAR ?auto_49094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49093 ?auto_49094 )
      ( MAKE-6PILE ?auto_49093 ?auto_49094 ?auto_49095 ?auto_49096 ?auto_49097 ?auto_49098 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49106 - BLOCK
      ?auto_49107 - BLOCK
      ?auto_49108 - BLOCK
      ?auto_49109 - BLOCK
      ?auto_49110 - BLOCK
      ?auto_49111 - BLOCK
    )
    :vars
    (
      ?auto_49112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49111 ?auto_49112 ) ( not ( = ?auto_49106 ?auto_49107 ) ) ( not ( = ?auto_49106 ?auto_49108 ) ) ( not ( = ?auto_49106 ?auto_49109 ) ) ( not ( = ?auto_49106 ?auto_49110 ) ) ( not ( = ?auto_49106 ?auto_49111 ) ) ( not ( = ?auto_49106 ?auto_49112 ) ) ( not ( = ?auto_49107 ?auto_49108 ) ) ( not ( = ?auto_49107 ?auto_49109 ) ) ( not ( = ?auto_49107 ?auto_49110 ) ) ( not ( = ?auto_49107 ?auto_49111 ) ) ( not ( = ?auto_49107 ?auto_49112 ) ) ( not ( = ?auto_49108 ?auto_49109 ) ) ( not ( = ?auto_49108 ?auto_49110 ) ) ( not ( = ?auto_49108 ?auto_49111 ) ) ( not ( = ?auto_49108 ?auto_49112 ) ) ( not ( = ?auto_49109 ?auto_49110 ) ) ( not ( = ?auto_49109 ?auto_49111 ) ) ( not ( = ?auto_49109 ?auto_49112 ) ) ( not ( = ?auto_49110 ?auto_49111 ) ) ( not ( = ?auto_49110 ?auto_49112 ) ) ( not ( = ?auto_49111 ?auto_49112 ) ) ( ON ?auto_49110 ?auto_49111 ) ( ON ?auto_49109 ?auto_49110 ) ( ON ?auto_49108 ?auto_49109 ) ( ON ?auto_49107 ?auto_49108 ) ( ON ?auto_49106 ?auto_49107 ) ( CLEAR ?auto_49106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49106 )
      ( MAKE-6PILE ?auto_49106 ?auto_49107 ?auto_49108 ?auto_49109 ?auto_49110 ?auto_49111 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49119 - BLOCK
      ?auto_49120 - BLOCK
      ?auto_49121 - BLOCK
      ?auto_49122 - BLOCK
      ?auto_49123 - BLOCK
      ?auto_49124 - BLOCK
    )
    :vars
    (
      ?auto_49125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49124 ?auto_49125 ) ( not ( = ?auto_49119 ?auto_49120 ) ) ( not ( = ?auto_49119 ?auto_49121 ) ) ( not ( = ?auto_49119 ?auto_49122 ) ) ( not ( = ?auto_49119 ?auto_49123 ) ) ( not ( = ?auto_49119 ?auto_49124 ) ) ( not ( = ?auto_49119 ?auto_49125 ) ) ( not ( = ?auto_49120 ?auto_49121 ) ) ( not ( = ?auto_49120 ?auto_49122 ) ) ( not ( = ?auto_49120 ?auto_49123 ) ) ( not ( = ?auto_49120 ?auto_49124 ) ) ( not ( = ?auto_49120 ?auto_49125 ) ) ( not ( = ?auto_49121 ?auto_49122 ) ) ( not ( = ?auto_49121 ?auto_49123 ) ) ( not ( = ?auto_49121 ?auto_49124 ) ) ( not ( = ?auto_49121 ?auto_49125 ) ) ( not ( = ?auto_49122 ?auto_49123 ) ) ( not ( = ?auto_49122 ?auto_49124 ) ) ( not ( = ?auto_49122 ?auto_49125 ) ) ( not ( = ?auto_49123 ?auto_49124 ) ) ( not ( = ?auto_49123 ?auto_49125 ) ) ( not ( = ?auto_49124 ?auto_49125 ) ) ( ON ?auto_49123 ?auto_49124 ) ( ON ?auto_49122 ?auto_49123 ) ( ON ?auto_49121 ?auto_49122 ) ( ON ?auto_49120 ?auto_49121 ) ( ON ?auto_49119 ?auto_49120 ) ( CLEAR ?auto_49119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49119 )
      ( MAKE-6PILE ?auto_49119 ?auto_49120 ?auto_49121 ?auto_49122 ?auto_49123 ?auto_49124 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49133 - BLOCK
      ?auto_49134 - BLOCK
      ?auto_49135 - BLOCK
      ?auto_49136 - BLOCK
      ?auto_49137 - BLOCK
      ?auto_49138 - BLOCK
      ?auto_49139 - BLOCK
    )
    :vars
    (
      ?auto_49140 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49138 ) ( ON ?auto_49139 ?auto_49140 ) ( CLEAR ?auto_49139 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49133 ) ( ON ?auto_49134 ?auto_49133 ) ( ON ?auto_49135 ?auto_49134 ) ( ON ?auto_49136 ?auto_49135 ) ( ON ?auto_49137 ?auto_49136 ) ( ON ?auto_49138 ?auto_49137 ) ( not ( = ?auto_49133 ?auto_49134 ) ) ( not ( = ?auto_49133 ?auto_49135 ) ) ( not ( = ?auto_49133 ?auto_49136 ) ) ( not ( = ?auto_49133 ?auto_49137 ) ) ( not ( = ?auto_49133 ?auto_49138 ) ) ( not ( = ?auto_49133 ?auto_49139 ) ) ( not ( = ?auto_49133 ?auto_49140 ) ) ( not ( = ?auto_49134 ?auto_49135 ) ) ( not ( = ?auto_49134 ?auto_49136 ) ) ( not ( = ?auto_49134 ?auto_49137 ) ) ( not ( = ?auto_49134 ?auto_49138 ) ) ( not ( = ?auto_49134 ?auto_49139 ) ) ( not ( = ?auto_49134 ?auto_49140 ) ) ( not ( = ?auto_49135 ?auto_49136 ) ) ( not ( = ?auto_49135 ?auto_49137 ) ) ( not ( = ?auto_49135 ?auto_49138 ) ) ( not ( = ?auto_49135 ?auto_49139 ) ) ( not ( = ?auto_49135 ?auto_49140 ) ) ( not ( = ?auto_49136 ?auto_49137 ) ) ( not ( = ?auto_49136 ?auto_49138 ) ) ( not ( = ?auto_49136 ?auto_49139 ) ) ( not ( = ?auto_49136 ?auto_49140 ) ) ( not ( = ?auto_49137 ?auto_49138 ) ) ( not ( = ?auto_49137 ?auto_49139 ) ) ( not ( = ?auto_49137 ?auto_49140 ) ) ( not ( = ?auto_49138 ?auto_49139 ) ) ( not ( = ?auto_49138 ?auto_49140 ) ) ( not ( = ?auto_49139 ?auto_49140 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49139 ?auto_49140 )
      ( !STACK ?auto_49139 ?auto_49138 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49148 - BLOCK
      ?auto_49149 - BLOCK
      ?auto_49150 - BLOCK
      ?auto_49151 - BLOCK
      ?auto_49152 - BLOCK
      ?auto_49153 - BLOCK
      ?auto_49154 - BLOCK
    )
    :vars
    (
      ?auto_49155 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49153 ) ( ON ?auto_49154 ?auto_49155 ) ( CLEAR ?auto_49154 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49148 ) ( ON ?auto_49149 ?auto_49148 ) ( ON ?auto_49150 ?auto_49149 ) ( ON ?auto_49151 ?auto_49150 ) ( ON ?auto_49152 ?auto_49151 ) ( ON ?auto_49153 ?auto_49152 ) ( not ( = ?auto_49148 ?auto_49149 ) ) ( not ( = ?auto_49148 ?auto_49150 ) ) ( not ( = ?auto_49148 ?auto_49151 ) ) ( not ( = ?auto_49148 ?auto_49152 ) ) ( not ( = ?auto_49148 ?auto_49153 ) ) ( not ( = ?auto_49148 ?auto_49154 ) ) ( not ( = ?auto_49148 ?auto_49155 ) ) ( not ( = ?auto_49149 ?auto_49150 ) ) ( not ( = ?auto_49149 ?auto_49151 ) ) ( not ( = ?auto_49149 ?auto_49152 ) ) ( not ( = ?auto_49149 ?auto_49153 ) ) ( not ( = ?auto_49149 ?auto_49154 ) ) ( not ( = ?auto_49149 ?auto_49155 ) ) ( not ( = ?auto_49150 ?auto_49151 ) ) ( not ( = ?auto_49150 ?auto_49152 ) ) ( not ( = ?auto_49150 ?auto_49153 ) ) ( not ( = ?auto_49150 ?auto_49154 ) ) ( not ( = ?auto_49150 ?auto_49155 ) ) ( not ( = ?auto_49151 ?auto_49152 ) ) ( not ( = ?auto_49151 ?auto_49153 ) ) ( not ( = ?auto_49151 ?auto_49154 ) ) ( not ( = ?auto_49151 ?auto_49155 ) ) ( not ( = ?auto_49152 ?auto_49153 ) ) ( not ( = ?auto_49152 ?auto_49154 ) ) ( not ( = ?auto_49152 ?auto_49155 ) ) ( not ( = ?auto_49153 ?auto_49154 ) ) ( not ( = ?auto_49153 ?auto_49155 ) ) ( not ( = ?auto_49154 ?auto_49155 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49154 ?auto_49155 )
      ( !STACK ?auto_49154 ?auto_49153 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49163 - BLOCK
      ?auto_49164 - BLOCK
      ?auto_49165 - BLOCK
      ?auto_49166 - BLOCK
      ?auto_49167 - BLOCK
      ?auto_49168 - BLOCK
      ?auto_49169 - BLOCK
    )
    :vars
    (
      ?auto_49170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49169 ?auto_49170 ) ( ON-TABLE ?auto_49163 ) ( ON ?auto_49164 ?auto_49163 ) ( ON ?auto_49165 ?auto_49164 ) ( ON ?auto_49166 ?auto_49165 ) ( ON ?auto_49167 ?auto_49166 ) ( not ( = ?auto_49163 ?auto_49164 ) ) ( not ( = ?auto_49163 ?auto_49165 ) ) ( not ( = ?auto_49163 ?auto_49166 ) ) ( not ( = ?auto_49163 ?auto_49167 ) ) ( not ( = ?auto_49163 ?auto_49168 ) ) ( not ( = ?auto_49163 ?auto_49169 ) ) ( not ( = ?auto_49163 ?auto_49170 ) ) ( not ( = ?auto_49164 ?auto_49165 ) ) ( not ( = ?auto_49164 ?auto_49166 ) ) ( not ( = ?auto_49164 ?auto_49167 ) ) ( not ( = ?auto_49164 ?auto_49168 ) ) ( not ( = ?auto_49164 ?auto_49169 ) ) ( not ( = ?auto_49164 ?auto_49170 ) ) ( not ( = ?auto_49165 ?auto_49166 ) ) ( not ( = ?auto_49165 ?auto_49167 ) ) ( not ( = ?auto_49165 ?auto_49168 ) ) ( not ( = ?auto_49165 ?auto_49169 ) ) ( not ( = ?auto_49165 ?auto_49170 ) ) ( not ( = ?auto_49166 ?auto_49167 ) ) ( not ( = ?auto_49166 ?auto_49168 ) ) ( not ( = ?auto_49166 ?auto_49169 ) ) ( not ( = ?auto_49166 ?auto_49170 ) ) ( not ( = ?auto_49167 ?auto_49168 ) ) ( not ( = ?auto_49167 ?auto_49169 ) ) ( not ( = ?auto_49167 ?auto_49170 ) ) ( not ( = ?auto_49168 ?auto_49169 ) ) ( not ( = ?auto_49168 ?auto_49170 ) ) ( not ( = ?auto_49169 ?auto_49170 ) ) ( CLEAR ?auto_49167 ) ( ON ?auto_49168 ?auto_49169 ) ( CLEAR ?auto_49168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49163 ?auto_49164 ?auto_49165 ?auto_49166 ?auto_49167 ?auto_49168 )
      ( MAKE-7PILE ?auto_49163 ?auto_49164 ?auto_49165 ?auto_49166 ?auto_49167 ?auto_49168 ?auto_49169 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49178 - BLOCK
      ?auto_49179 - BLOCK
      ?auto_49180 - BLOCK
      ?auto_49181 - BLOCK
      ?auto_49182 - BLOCK
      ?auto_49183 - BLOCK
      ?auto_49184 - BLOCK
    )
    :vars
    (
      ?auto_49185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49184 ?auto_49185 ) ( ON-TABLE ?auto_49178 ) ( ON ?auto_49179 ?auto_49178 ) ( ON ?auto_49180 ?auto_49179 ) ( ON ?auto_49181 ?auto_49180 ) ( ON ?auto_49182 ?auto_49181 ) ( not ( = ?auto_49178 ?auto_49179 ) ) ( not ( = ?auto_49178 ?auto_49180 ) ) ( not ( = ?auto_49178 ?auto_49181 ) ) ( not ( = ?auto_49178 ?auto_49182 ) ) ( not ( = ?auto_49178 ?auto_49183 ) ) ( not ( = ?auto_49178 ?auto_49184 ) ) ( not ( = ?auto_49178 ?auto_49185 ) ) ( not ( = ?auto_49179 ?auto_49180 ) ) ( not ( = ?auto_49179 ?auto_49181 ) ) ( not ( = ?auto_49179 ?auto_49182 ) ) ( not ( = ?auto_49179 ?auto_49183 ) ) ( not ( = ?auto_49179 ?auto_49184 ) ) ( not ( = ?auto_49179 ?auto_49185 ) ) ( not ( = ?auto_49180 ?auto_49181 ) ) ( not ( = ?auto_49180 ?auto_49182 ) ) ( not ( = ?auto_49180 ?auto_49183 ) ) ( not ( = ?auto_49180 ?auto_49184 ) ) ( not ( = ?auto_49180 ?auto_49185 ) ) ( not ( = ?auto_49181 ?auto_49182 ) ) ( not ( = ?auto_49181 ?auto_49183 ) ) ( not ( = ?auto_49181 ?auto_49184 ) ) ( not ( = ?auto_49181 ?auto_49185 ) ) ( not ( = ?auto_49182 ?auto_49183 ) ) ( not ( = ?auto_49182 ?auto_49184 ) ) ( not ( = ?auto_49182 ?auto_49185 ) ) ( not ( = ?auto_49183 ?auto_49184 ) ) ( not ( = ?auto_49183 ?auto_49185 ) ) ( not ( = ?auto_49184 ?auto_49185 ) ) ( CLEAR ?auto_49182 ) ( ON ?auto_49183 ?auto_49184 ) ( CLEAR ?auto_49183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49178 ?auto_49179 ?auto_49180 ?auto_49181 ?auto_49182 ?auto_49183 )
      ( MAKE-7PILE ?auto_49178 ?auto_49179 ?auto_49180 ?auto_49181 ?auto_49182 ?auto_49183 ?auto_49184 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49193 - BLOCK
      ?auto_49194 - BLOCK
      ?auto_49195 - BLOCK
      ?auto_49196 - BLOCK
      ?auto_49197 - BLOCK
      ?auto_49198 - BLOCK
      ?auto_49199 - BLOCK
    )
    :vars
    (
      ?auto_49200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49199 ?auto_49200 ) ( ON-TABLE ?auto_49193 ) ( ON ?auto_49194 ?auto_49193 ) ( ON ?auto_49195 ?auto_49194 ) ( ON ?auto_49196 ?auto_49195 ) ( not ( = ?auto_49193 ?auto_49194 ) ) ( not ( = ?auto_49193 ?auto_49195 ) ) ( not ( = ?auto_49193 ?auto_49196 ) ) ( not ( = ?auto_49193 ?auto_49197 ) ) ( not ( = ?auto_49193 ?auto_49198 ) ) ( not ( = ?auto_49193 ?auto_49199 ) ) ( not ( = ?auto_49193 ?auto_49200 ) ) ( not ( = ?auto_49194 ?auto_49195 ) ) ( not ( = ?auto_49194 ?auto_49196 ) ) ( not ( = ?auto_49194 ?auto_49197 ) ) ( not ( = ?auto_49194 ?auto_49198 ) ) ( not ( = ?auto_49194 ?auto_49199 ) ) ( not ( = ?auto_49194 ?auto_49200 ) ) ( not ( = ?auto_49195 ?auto_49196 ) ) ( not ( = ?auto_49195 ?auto_49197 ) ) ( not ( = ?auto_49195 ?auto_49198 ) ) ( not ( = ?auto_49195 ?auto_49199 ) ) ( not ( = ?auto_49195 ?auto_49200 ) ) ( not ( = ?auto_49196 ?auto_49197 ) ) ( not ( = ?auto_49196 ?auto_49198 ) ) ( not ( = ?auto_49196 ?auto_49199 ) ) ( not ( = ?auto_49196 ?auto_49200 ) ) ( not ( = ?auto_49197 ?auto_49198 ) ) ( not ( = ?auto_49197 ?auto_49199 ) ) ( not ( = ?auto_49197 ?auto_49200 ) ) ( not ( = ?auto_49198 ?auto_49199 ) ) ( not ( = ?auto_49198 ?auto_49200 ) ) ( not ( = ?auto_49199 ?auto_49200 ) ) ( ON ?auto_49198 ?auto_49199 ) ( CLEAR ?auto_49196 ) ( ON ?auto_49197 ?auto_49198 ) ( CLEAR ?auto_49197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49193 ?auto_49194 ?auto_49195 ?auto_49196 ?auto_49197 )
      ( MAKE-7PILE ?auto_49193 ?auto_49194 ?auto_49195 ?auto_49196 ?auto_49197 ?auto_49198 ?auto_49199 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49208 - BLOCK
      ?auto_49209 - BLOCK
      ?auto_49210 - BLOCK
      ?auto_49211 - BLOCK
      ?auto_49212 - BLOCK
      ?auto_49213 - BLOCK
      ?auto_49214 - BLOCK
    )
    :vars
    (
      ?auto_49215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49214 ?auto_49215 ) ( ON-TABLE ?auto_49208 ) ( ON ?auto_49209 ?auto_49208 ) ( ON ?auto_49210 ?auto_49209 ) ( ON ?auto_49211 ?auto_49210 ) ( not ( = ?auto_49208 ?auto_49209 ) ) ( not ( = ?auto_49208 ?auto_49210 ) ) ( not ( = ?auto_49208 ?auto_49211 ) ) ( not ( = ?auto_49208 ?auto_49212 ) ) ( not ( = ?auto_49208 ?auto_49213 ) ) ( not ( = ?auto_49208 ?auto_49214 ) ) ( not ( = ?auto_49208 ?auto_49215 ) ) ( not ( = ?auto_49209 ?auto_49210 ) ) ( not ( = ?auto_49209 ?auto_49211 ) ) ( not ( = ?auto_49209 ?auto_49212 ) ) ( not ( = ?auto_49209 ?auto_49213 ) ) ( not ( = ?auto_49209 ?auto_49214 ) ) ( not ( = ?auto_49209 ?auto_49215 ) ) ( not ( = ?auto_49210 ?auto_49211 ) ) ( not ( = ?auto_49210 ?auto_49212 ) ) ( not ( = ?auto_49210 ?auto_49213 ) ) ( not ( = ?auto_49210 ?auto_49214 ) ) ( not ( = ?auto_49210 ?auto_49215 ) ) ( not ( = ?auto_49211 ?auto_49212 ) ) ( not ( = ?auto_49211 ?auto_49213 ) ) ( not ( = ?auto_49211 ?auto_49214 ) ) ( not ( = ?auto_49211 ?auto_49215 ) ) ( not ( = ?auto_49212 ?auto_49213 ) ) ( not ( = ?auto_49212 ?auto_49214 ) ) ( not ( = ?auto_49212 ?auto_49215 ) ) ( not ( = ?auto_49213 ?auto_49214 ) ) ( not ( = ?auto_49213 ?auto_49215 ) ) ( not ( = ?auto_49214 ?auto_49215 ) ) ( ON ?auto_49213 ?auto_49214 ) ( CLEAR ?auto_49211 ) ( ON ?auto_49212 ?auto_49213 ) ( CLEAR ?auto_49212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49208 ?auto_49209 ?auto_49210 ?auto_49211 ?auto_49212 )
      ( MAKE-7PILE ?auto_49208 ?auto_49209 ?auto_49210 ?auto_49211 ?auto_49212 ?auto_49213 ?auto_49214 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49223 - BLOCK
      ?auto_49224 - BLOCK
      ?auto_49225 - BLOCK
      ?auto_49226 - BLOCK
      ?auto_49227 - BLOCK
      ?auto_49228 - BLOCK
      ?auto_49229 - BLOCK
    )
    :vars
    (
      ?auto_49230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49229 ?auto_49230 ) ( ON-TABLE ?auto_49223 ) ( ON ?auto_49224 ?auto_49223 ) ( ON ?auto_49225 ?auto_49224 ) ( not ( = ?auto_49223 ?auto_49224 ) ) ( not ( = ?auto_49223 ?auto_49225 ) ) ( not ( = ?auto_49223 ?auto_49226 ) ) ( not ( = ?auto_49223 ?auto_49227 ) ) ( not ( = ?auto_49223 ?auto_49228 ) ) ( not ( = ?auto_49223 ?auto_49229 ) ) ( not ( = ?auto_49223 ?auto_49230 ) ) ( not ( = ?auto_49224 ?auto_49225 ) ) ( not ( = ?auto_49224 ?auto_49226 ) ) ( not ( = ?auto_49224 ?auto_49227 ) ) ( not ( = ?auto_49224 ?auto_49228 ) ) ( not ( = ?auto_49224 ?auto_49229 ) ) ( not ( = ?auto_49224 ?auto_49230 ) ) ( not ( = ?auto_49225 ?auto_49226 ) ) ( not ( = ?auto_49225 ?auto_49227 ) ) ( not ( = ?auto_49225 ?auto_49228 ) ) ( not ( = ?auto_49225 ?auto_49229 ) ) ( not ( = ?auto_49225 ?auto_49230 ) ) ( not ( = ?auto_49226 ?auto_49227 ) ) ( not ( = ?auto_49226 ?auto_49228 ) ) ( not ( = ?auto_49226 ?auto_49229 ) ) ( not ( = ?auto_49226 ?auto_49230 ) ) ( not ( = ?auto_49227 ?auto_49228 ) ) ( not ( = ?auto_49227 ?auto_49229 ) ) ( not ( = ?auto_49227 ?auto_49230 ) ) ( not ( = ?auto_49228 ?auto_49229 ) ) ( not ( = ?auto_49228 ?auto_49230 ) ) ( not ( = ?auto_49229 ?auto_49230 ) ) ( ON ?auto_49228 ?auto_49229 ) ( ON ?auto_49227 ?auto_49228 ) ( CLEAR ?auto_49225 ) ( ON ?auto_49226 ?auto_49227 ) ( CLEAR ?auto_49226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49223 ?auto_49224 ?auto_49225 ?auto_49226 )
      ( MAKE-7PILE ?auto_49223 ?auto_49224 ?auto_49225 ?auto_49226 ?auto_49227 ?auto_49228 ?auto_49229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49238 - BLOCK
      ?auto_49239 - BLOCK
      ?auto_49240 - BLOCK
      ?auto_49241 - BLOCK
      ?auto_49242 - BLOCK
      ?auto_49243 - BLOCK
      ?auto_49244 - BLOCK
    )
    :vars
    (
      ?auto_49245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49244 ?auto_49245 ) ( ON-TABLE ?auto_49238 ) ( ON ?auto_49239 ?auto_49238 ) ( ON ?auto_49240 ?auto_49239 ) ( not ( = ?auto_49238 ?auto_49239 ) ) ( not ( = ?auto_49238 ?auto_49240 ) ) ( not ( = ?auto_49238 ?auto_49241 ) ) ( not ( = ?auto_49238 ?auto_49242 ) ) ( not ( = ?auto_49238 ?auto_49243 ) ) ( not ( = ?auto_49238 ?auto_49244 ) ) ( not ( = ?auto_49238 ?auto_49245 ) ) ( not ( = ?auto_49239 ?auto_49240 ) ) ( not ( = ?auto_49239 ?auto_49241 ) ) ( not ( = ?auto_49239 ?auto_49242 ) ) ( not ( = ?auto_49239 ?auto_49243 ) ) ( not ( = ?auto_49239 ?auto_49244 ) ) ( not ( = ?auto_49239 ?auto_49245 ) ) ( not ( = ?auto_49240 ?auto_49241 ) ) ( not ( = ?auto_49240 ?auto_49242 ) ) ( not ( = ?auto_49240 ?auto_49243 ) ) ( not ( = ?auto_49240 ?auto_49244 ) ) ( not ( = ?auto_49240 ?auto_49245 ) ) ( not ( = ?auto_49241 ?auto_49242 ) ) ( not ( = ?auto_49241 ?auto_49243 ) ) ( not ( = ?auto_49241 ?auto_49244 ) ) ( not ( = ?auto_49241 ?auto_49245 ) ) ( not ( = ?auto_49242 ?auto_49243 ) ) ( not ( = ?auto_49242 ?auto_49244 ) ) ( not ( = ?auto_49242 ?auto_49245 ) ) ( not ( = ?auto_49243 ?auto_49244 ) ) ( not ( = ?auto_49243 ?auto_49245 ) ) ( not ( = ?auto_49244 ?auto_49245 ) ) ( ON ?auto_49243 ?auto_49244 ) ( ON ?auto_49242 ?auto_49243 ) ( CLEAR ?auto_49240 ) ( ON ?auto_49241 ?auto_49242 ) ( CLEAR ?auto_49241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49238 ?auto_49239 ?auto_49240 ?auto_49241 )
      ( MAKE-7PILE ?auto_49238 ?auto_49239 ?auto_49240 ?auto_49241 ?auto_49242 ?auto_49243 ?auto_49244 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49253 - BLOCK
      ?auto_49254 - BLOCK
      ?auto_49255 - BLOCK
      ?auto_49256 - BLOCK
      ?auto_49257 - BLOCK
      ?auto_49258 - BLOCK
      ?auto_49259 - BLOCK
    )
    :vars
    (
      ?auto_49260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49259 ?auto_49260 ) ( ON-TABLE ?auto_49253 ) ( ON ?auto_49254 ?auto_49253 ) ( not ( = ?auto_49253 ?auto_49254 ) ) ( not ( = ?auto_49253 ?auto_49255 ) ) ( not ( = ?auto_49253 ?auto_49256 ) ) ( not ( = ?auto_49253 ?auto_49257 ) ) ( not ( = ?auto_49253 ?auto_49258 ) ) ( not ( = ?auto_49253 ?auto_49259 ) ) ( not ( = ?auto_49253 ?auto_49260 ) ) ( not ( = ?auto_49254 ?auto_49255 ) ) ( not ( = ?auto_49254 ?auto_49256 ) ) ( not ( = ?auto_49254 ?auto_49257 ) ) ( not ( = ?auto_49254 ?auto_49258 ) ) ( not ( = ?auto_49254 ?auto_49259 ) ) ( not ( = ?auto_49254 ?auto_49260 ) ) ( not ( = ?auto_49255 ?auto_49256 ) ) ( not ( = ?auto_49255 ?auto_49257 ) ) ( not ( = ?auto_49255 ?auto_49258 ) ) ( not ( = ?auto_49255 ?auto_49259 ) ) ( not ( = ?auto_49255 ?auto_49260 ) ) ( not ( = ?auto_49256 ?auto_49257 ) ) ( not ( = ?auto_49256 ?auto_49258 ) ) ( not ( = ?auto_49256 ?auto_49259 ) ) ( not ( = ?auto_49256 ?auto_49260 ) ) ( not ( = ?auto_49257 ?auto_49258 ) ) ( not ( = ?auto_49257 ?auto_49259 ) ) ( not ( = ?auto_49257 ?auto_49260 ) ) ( not ( = ?auto_49258 ?auto_49259 ) ) ( not ( = ?auto_49258 ?auto_49260 ) ) ( not ( = ?auto_49259 ?auto_49260 ) ) ( ON ?auto_49258 ?auto_49259 ) ( ON ?auto_49257 ?auto_49258 ) ( ON ?auto_49256 ?auto_49257 ) ( CLEAR ?auto_49254 ) ( ON ?auto_49255 ?auto_49256 ) ( CLEAR ?auto_49255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49253 ?auto_49254 ?auto_49255 )
      ( MAKE-7PILE ?auto_49253 ?auto_49254 ?auto_49255 ?auto_49256 ?auto_49257 ?auto_49258 ?auto_49259 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49268 - BLOCK
      ?auto_49269 - BLOCK
      ?auto_49270 - BLOCK
      ?auto_49271 - BLOCK
      ?auto_49272 - BLOCK
      ?auto_49273 - BLOCK
      ?auto_49274 - BLOCK
    )
    :vars
    (
      ?auto_49275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49274 ?auto_49275 ) ( ON-TABLE ?auto_49268 ) ( ON ?auto_49269 ?auto_49268 ) ( not ( = ?auto_49268 ?auto_49269 ) ) ( not ( = ?auto_49268 ?auto_49270 ) ) ( not ( = ?auto_49268 ?auto_49271 ) ) ( not ( = ?auto_49268 ?auto_49272 ) ) ( not ( = ?auto_49268 ?auto_49273 ) ) ( not ( = ?auto_49268 ?auto_49274 ) ) ( not ( = ?auto_49268 ?auto_49275 ) ) ( not ( = ?auto_49269 ?auto_49270 ) ) ( not ( = ?auto_49269 ?auto_49271 ) ) ( not ( = ?auto_49269 ?auto_49272 ) ) ( not ( = ?auto_49269 ?auto_49273 ) ) ( not ( = ?auto_49269 ?auto_49274 ) ) ( not ( = ?auto_49269 ?auto_49275 ) ) ( not ( = ?auto_49270 ?auto_49271 ) ) ( not ( = ?auto_49270 ?auto_49272 ) ) ( not ( = ?auto_49270 ?auto_49273 ) ) ( not ( = ?auto_49270 ?auto_49274 ) ) ( not ( = ?auto_49270 ?auto_49275 ) ) ( not ( = ?auto_49271 ?auto_49272 ) ) ( not ( = ?auto_49271 ?auto_49273 ) ) ( not ( = ?auto_49271 ?auto_49274 ) ) ( not ( = ?auto_49271 ?auto_49275 ) ) ( not ( = ?auto_49272 ?auto_49273 ) ) ( not ( = ?auto_49272 ?auto_49274 ) ) ( not ( = ?auto_49272 ?auto_49275 ) ) ( not ( = ?auto_49273 ?auto_49274 ) ) ( not ( = ?auto_49273 ?auto_49275 ) ) ( not ( = ?auto_49274 ?auto_49275 ) ) ( ON ?auto_49273 ?auto_49274 ) ( ON ?auto_49272 ?auto_49273 ) ( ON ?auto_49271 ?auto_49272 ) ( CLEAR ?auto_49269 ) ( ON ?auto_49270 ?auto_49271 ) ( CLEAR ?auto_49270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49268 ?auto_49269 ?auto_49270 )
      ( MAKE-7PILE ?auto_49268 ?auto_49269 ?auto_49270 ?auto_49271 ?auto_49272 ?auto_49273 ?auto_49274 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49283 - BLOCK
      ?auto_49284 - BLOCK
      ?auto_49285 - BLOCK
      ?auto_49286 - BLOCK
      ?auto_49287 - BLOCK
      ?auto_49288 - BLOCK
      ?auto_49289 - BLOCK
    )
    :vars
    (
      ?auto_49290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49289 ?auto_49290 ) ( ON-TABLE ?auto_49283 ) ( not ( = ?auto_49283 ?auto_49284 ) ) ( not ( = ?auto_49283 ?auto_49285 ) ) ( not ( = ?auto_49283 ?auto_49286 ) ) ( not ( = ?auto_49283 ?auto_49287 ) ) ( not ( = ?auto_49283 ?auto_49288 ) ) ( not ( = ?auto_49283 ?auto_49289 ) ) ( not ( = ?auto_49283 ?auto_49290 ) ) ( not ( = ?auto_49284 ?auto_49285 ) ) ( not ( = ?auto_49284 ?auto_49286 ) ) ( not ( = ?auto_49284 ?auto_49287 ) ) ( not ( = ?auto_49284 ?auto_49288 ) ) ( not ( = ?auto_49284 ?auto_49289 ) ) ( not ( = ?auto_49284 ?auto_49290 ) ) ( not ( = ?auto_49285 ?auto_49286 ) ) ( not ( = ?auto_49285 ?auto_49287 ) ) ( not ( = ?auto_49285 ?auto_49288 ) ) ( not ( = ?auto_49285 ?auto_49289 ) ) ( not ( = ?auto_49285 ?auto_49290 ) ) ( not ( = ?auto_49286 ?auto_49287 ) ) ( not ( = ?auto_49286 ?auto_49288 ) ) ( not ( = ?auto_49286 ?auto_49289 ) ) ( not ( = ?auto_49286 ?auto_49290 ) ) ( not ( = ?auto_49287 ?auto_49288 ) ) ( not ( = ?auto_49287 ?auto_49289 ) ) ( not ( = ?auto_49287 ?auto_49290 ) ) ( not ( = ?auto_49288 ?auto_49289 ) ) ( not ( = ?auto_49288 ?auto_49290 ) ) ( not ( = ?auto_49289 ?auto_49290 ) ) ( ON ?auto_49288 ?auto_49289 ) ( ON ?auto_49287 ?auto_49288 ) ( ON ?auto_49286 ?auto_49287 ) ( ON ?auto_49285 ?auto_49286 ) ( CLEAR ?auto_49283 ) ( ON ?auto_49284 ?auto_49285 ) ( CLEAR ?auto_49284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49283 ?auto_49284 )
      ( MAKE-7PILE ?auto_49283 ?auto_49284 ?auto_49285 ?auto_49286 ?auto_49287 ?auto_49288 ?auto_49289 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49298 - BLOCK
      ?auto_49299 - BLOCK
      ?auto_49300 - BLOCK
      ?auto_49301 - BLOCK
      ?auto_49302 - BLOCK
      ?auto_49303 - BLOCK
      ?auto_49304 - BLOCK
    )
    :vars
    (
      ?auto_49305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49304 ?auto_49305 ) ( ON-TABLE ?auto_49298 ) ( not ( = ?auto_49298 ?auto_49299 ) ) ( not ( = ?auto_49298 ?auto_49300 ) ) ( not ( = ?auto_49298 ?auto_49301 ) ) ( not ( = ?auto_49298 ?auto_49302 ) ) ( not ( = ?auto_49298 ?auto_49303 ) ) ( not ( = ?auto_49298 ?auto_49304 ) ) ( not ( = ?auto_49298 ?auto_49305 ) ) ( not ( = ?auto_49299 ?auto_49300 ) ) ( not ( = ?auto_49299 ?auto_49301 ) ) ( not ( = ?auto_49299 ?auto_49302 ) ) ( not ( = ?auto_49299 ?auto_49303 ) ) ( not ( = ?auto_49299 ?auto_49304 ) ) ( not ( = ?auto_49299 ?auto_49305 ) ) ( not ( = ?auto_49300 ?auto_49301 ) ) ( not ( = ?auto_49300 ?auto_49302 ) ) ( not ( = ?auto_49300 ?auto_49303 ) ) ( not ( = ?auto_49300 ?auto_49304 ) ) ( not ( = ?auto_49300 ?auto_49305 ) ) ( not ( = ?auto_49301 ?auto_49302 ) ) ( not ( = ?auto_49301 ?auto_49303 ) ) ( not ( = ?auto_49301 ?auto_49304 ) ) ( not ( = ?auto_49301 ?auto_49305 ) ) ( not ( = ?auto_49302 ?auto_49303 ) ) ( not ( = ?auto_49302 ?auto_49304 ) ) ( not ( = ?auto_49302 ?auto_49305 ) ) ( not ( = ?auto_49303 ?auto_49304 ) ) ( not ( = ?auto_49303 ?auto_49305 ) ) ( not ( = ?auto_49304 ?auto_49305 ) ) ( ON ?auto_49303 ?auto_49304 ) ( ON ?auto_49302 ?auto_49303 ) ( ON ?auto_49301 ?auto_49302 ) ( ON ?auto_49300 ?auto_49301 ) ( CLEAR ?auto_49298 ) ( ON ?auto_49299 ?auto_49300 ) ( CLEAR ?auto_49299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49298 ?auto_49299 )
      ( MAKE-7PILE ?auto_49298 ?auto_49299 ?auto_49300 ?auto_49301 ?auto_49302 ?auto_49303 ?auto_49304 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49313 - BLOCK
      ?auto_49314 - BLOCK
      ?auto_49315 - BLOCK
      ?auto_49316 - BLOCK
      ?auto_49317 - BLOCK
      ?auto_49318 - BLOCK
      ?auto_49319 - BLOCK
    )
    :vars
    (
      ?auto_49320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49319 ?auto_49320 ) ( not ( = ?auto_49313 ?auto_49314 ) ) ( not ( = ?auto_49313 ?auto_49315 ) ) ( not ( = ?auto_49313 ?auto_49316 ) ) ( not ( = ?auto_49313 ?auto_49317 ) ) ( not ( = ?auto_49313 ?auto_49318 ) ) ( not ( = ?auto_49313 ?auto_49319 ) ) ( not ( = ?auto_49313 ?auto_49320 ) ) ( not ( = ?auto_49314 ?auto_49315 ) ) ( not ( = ?auto_49314 ?auto_49316 ) ) ( not ( = ?auto_49314 ?auto_49317 ) ) ( not ( = ?auto_49314 ?auto_49318 ) ) ( not ( = ?auto_49314 ?auto_49319 ) ) ( not ( = ?auto_49314 ?auto_49320 ) ) ( not ( = ?auto_49315 ?auto_49316 ) ) ( not ( = ?auto_49315 ?auto_49317 ) ) ( not ( = ?auto_49315 ?auto_49318 ) ) ( not ( = ?auto_49315 ?auto_49319 ) ) ( not ( = ?auto_49315 ?auto_49320 ) ) ( not ( = ?auto_49316 ?auto_49317 ) ) ( not ( = ?auto_49316 ?auto_49318 ) ) ( not ( = ?auto_49316 ?auto_49319 ) ) ( not ( = ?auto_49316 ?auto_49320 ) ) ( not ( = ?auto_49317 ?auto_49318 ) ) ( not ( = ?auto_49317 ?auto_49319 ) ) ( not ( = ?auto_49317 ?auto_49320 ) ) ( not ( = ?auto_49318 ?auto_49319 ) ) ( not ( = ?auto_49318 ?auto_49320 ) ) ( not ( = ?auto_49319 ?auto_49320 ) ) ( ON ?auto_49318 ?auto_49319 ) ( ON ?auto_49317 ?auto_49318 ) ( ON ?auto_49316 ?auto_49317 ) ( ON ?auto_49315 ?auto_49316 ) ( ON ?auto_49314 ?auto_49315 ) ( ON ?auto_49313 ?auto_49314 ) ( CLEAR ?auto_49313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49313 )
      ( MAKE-7PILE ?auto_49313 ?auto_49314 ?auto_49315 ?auto_49316 ?auto_49317 ?auto_49318 ?auto_49319 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49328 - BLOCK
      ?auto_49329 - BLOCK
      ?auto_49330 - BLOCK
      ?auto_49331 - BLOCK
      ?auto_49332 - BLOCK
      ?auto_49333 - BLOCK
      ?auto_49334 - BLOCK
    )
    :vars
    (
      ?auto_49335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49334 ?auto_49335 ) ( not ( = ?auto_49328 ?auto_49329 ) ) ( not ( = ?auto_49328 ?auto_49330 ) ) ( not ( = ?auto_49328 ?auto_49331 ) ) ( not ( = ?auto_49328 ?auto_49332 ) ) ( not ( = ?auto_49328 ?auto_49333 ) ) ( not ( = ?auto_49328 ?auto_49334 ) ) ( not ( = ?auto_49328 ?auto_49335 ) ) ( not ( = ?auto_49329 ?auto_49330 ) ) ( not ( = ?auto_49329 ?auto_49331 ) ) ( not ( = ?auto_49329 ?auto_49332 ) ) ( not ( = ?auto_49329 ?auto_49333 ) ) ( not ( = ?auto_49329 ?auto_49334 ) ) ( not ( = ?auto_49329 ?auto_49335 ) ) ( not ( = ?auto_49330 ?auto_49331 ) ) ( not ( = ?auto_49330 ?auto_49332 ) ) ( not ( = ?auto_49330 ?auto_49333 ) ) ( not ( = ?auto_49330 ?auto_49334 ) ) ( not ( = ?auto_49330 ?auto_49335 ) ) ( not ( = ?auto_49331 ?auto_49332 ) ) ( not ( = ?auto_49331 ?auto_49333 ) ) ( not ( = ?auto_49331 ?auto_49334 ) ) ( not ( = ?auto_49331 ?auto_49335 ) ) ( not ( = ?auto_49332 ?auto_49333 ) ) ( not ( = ?auto_49332 ?auto_49334 ) ) ( not ( = ?auto_49332 ?auto_49335 ) ) ( not ( = ?auto_49333 ?auto_49334 ) ) ( not ( = ?auto_49333 ?auto_49335 ) ) ( not ( = ?auto_49334 ?auto_49335 ) ) ( ON ?auto_49333 ?auto_49334 ) ( ON ?auto_49332 ?auto_49333 ) ( ON ?auto_49331 ?auto_49332 ) ( ON ?auto_49330 ?auto_49331 ) ( ON ?auto_49329 ?auto_49330 ) ( ON ?auto_49328 ?auto_49329 ) ( CLEAR ?auto_49328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49328 )
      ( MAKE-7PILE ?auto_49328 ?auto_49329 ?auto_49330 ?auto_49331 ?auto_49332 ?auto_49333 ?auto_49334 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49344 - BLOCK
      ?auto_49345 - BLOCK
      ?auto_49346 - BLOCK
      ?auto_49347 - BLOCK
      ?auto_49348 - BLOCK
      ?auto_49349 - BLOCK
      ?auto_49350 - BLOCK
      ?auto_49351 - BLOCK
    )
    :vars
    (
      ?auto_49352 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49350 ) ( ON ?auto_49351 ?auto_49352 ) ( CLEAR ?auto_49351 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49344 ) ( ON ?auto_49345 ?auto_49344 ) ( ON ?auto_49346 ?auto_49345 ) ( ON ?auto_49347 ?auto_49346 ) ( ON ?auto_49348 ?auto_49347 ) ( ON ?auto_49349 ?auto_49348 ) ( ON ?auto_49350 ?auto_49349 ) ( not ( = ?auto_49344 ?auto_49345 ) ) ( not ( = ?auto_49344 ?auto_49346 ) ) ( not ( = ?auto_49344 ?auto_49347 ) ) ( not ( = ?auto_49344 ?auto_49348 ) ) ( not ( = ?auto_49344 ?auto_49349 ) ) ( not ( = ?auto_49344 ?auto_49350 ) ) ( not ( = ?auto_49344 ?auto_49351 ) ) ( not ( = ?auto_49344 ?auto_49352 ) ) ( not ( = ?auto_49345 ?auto_49346 ) ) ( not ( = ?auto_49345 ?auto_49347 ) ) ( not ( = ?auto_49345 ?auto_49348 ) ) ( not ( = ?auto_49345 ?auto_49349 ) ) ( not ( = ?auto_49345 ?auto_49350 ) ) ( not ( = ?auto_49345 ?auto_49351 ) ) ( not ( = ?auto_49345 ?auto_49352 ) ) ( not ( = ?auto_49346 ?auto_49347 ) ) ( not ( = ?auto_49346 ?auto_49348 ) ) ( not ( = ?auto_49346 ?auto_49349 ) ) ( not ( = ?auto_49346 ?auto_49350 ) ) ( not ( = ?auto_49346 ?auto_49351 ) ) ( not ( = ?auto_49346 ?auto_49352 ) ) ( not ( = ?auto_49347 ?auto_49348 ) ) ( not ( = ?auto_49347 ?auto_49349 ) ) ( not ( = ?auto_49347 ?auto_49350 ) ) ( not ( = ?auto_49347 ?auto_49351 ) ) ( not ( = ?auto_49347 ?auto_49352 ) ) ( not ( = ?auto_49348 ?auto_49349 ) ) ( not ( = ?auto_49348 ?auto_49350 ) ) ( not ( = ?auto_49348 ?auto_49351 ) ) ( not ( = ?auto_49348 ?auto_49352 ) ) ( not ( = ?auto_49349 ?auto_49350 ) ) ( not ( = ?auto_49349 ?auto_49351 ) ) ( not ( = ?auto_49349 ?auto_49352 ) ) ( not ( = ?auto_49350 ?auto_49351 ) ) ( not ( = ?auto_49350 ?auto_49352 ) ) ( not ( = ?auto_49351 ?auto_49352 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49351 ?auto_49352 )
      ( !STACK ?auto_49351 ?auto_49350 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49361 - BLOCK
      ?auto_49362 - BLOCK
      ?auto_49363 - BLOCK
      ?auto_49364 - BLOCK
      ?auto_49365 - BLOCK
      ?auto_49366 - BLOCK
      ?auto_49367 - BLOCK
      ?auto_49368 - BLOCK
    )
    :vars
    (
      ?auto_49369 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49367 ) ( ON ?auto_49368 ?auto_49369 ) ( CLEAR ?auto_49368 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49361 ) ( ON ?auto_49362 ?auto_49361 ) ( ON ?auto_49363 ?auto_49362 ) ( ON ?auto_49364 ?auto_49363 ) ( ON ?auto_49365 ?auto_49364 ) ( ON ?auto_49366 ?auto_49365 ) ( ON ?auto_49367 ?auto_49366 ) ( not ( = ?auto_49361 ?auto_49362 ) ) ( not ( = ?auto_49361 ?auto_49363 ) ) ( not ( = ?auto_49361 ?auto_49364 ) ) ( not ( = ?auto_49361 ?auto_49365 ) ) ( not ( = ?auto_49361 ?auto_49366 ) ) ( not ( = ?auto_49361 ?auto_49367 ) ) ( not ( = ?auto_49361 ?auto_49368 ) ) ( not ( = ?auto_49361 ?auto_49369 ) ) ( not ( = ?auto_49362 ?auto_49363 ) ) ( not ( = ?auto_49362 ?auto_49364 ) ) ( not ( = ?auto_49362 ?auto_49365 ) ) ( not ( = ?auto_49362 ?auto_49366 ) ) ( not ( = ?auto_49362 ?auto_49367 ) ) ( not ( = ?auto_49362 ?auto_49368 ) ) ( not ( = ?auto_49362 ?auto_49369 ) ) ( not ( = ?auto_49363 ?auto_49364 ) ) ( not ( = ?auto_49363 ?auto_49365 ) ) ( not ( = ?auto_49363 ?auto_49366 ) ) ( not ( = ?auto_49363 ?auto_49367 ) ) ( not ( = ?auto_49363 ?auto_49368 ) ) ( not ( = ?auto_49363 ?auto_49369 ) ) ( not ( = ?auto_49364 ?auto_49365 ) ) ( not ( = ?auto_49364 ?auto_49366 ) ) ( not ( = ?auto_49364 ?auto_49367 ) ) ( not ( = ?auto_49364 ?auto_49368 ) ) ( not ( = ?auto_49364 ?auto_49369 ) ) ( not ( = ?auto_49365 ?auto_49366 ) ) ( not ( = ?auto_49365 ?auto_49367 ) ) ( not ( = ?auto_49365 ?auto_49368 ) ) ( not ( = ?auto_49365 ?auto_49369 ) ) ( not ( = ?auto_49366 ?auto_49367 ) ) ( not ( = ?auto_49366 ?auto_49368 ) ) ( not ( = ?auto_49366 ?auto_49369 ) ) ( not ( = ?auto_49367 ?auto_49368 ) ) ( not ( = ?auto_49367 ?auto_49369 ) ) ( not ( = ?auto_49368 ?auto_49369 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49368 ?auto_49369 )
      ( !STACK ?auto_49368 ?auto_49367 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49378 - BLOCK
      ?auto_49379 - BLOCK
      ?auto_49380 - BLOCK
      ?auto_49381 - BLOCK
      ?auto_49382 - BLOCK
      ?auto_49383 - BLOCK
      ?auto_49384 - BLOCK
      ?auto_49385 - BLOCK
    )
    :vars
    (
      ?auto_49386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49385 ?auto_49386 ) ( ON-TABLE ?auto_49378 ) ( ON ?auto_49379 ?auto_49378 ) ( ON ?auto_49380 ?auto_49379 ) ( ON ?auto_49381 ?auto_49380 ) ( ON ?auto_49382 ?auto_49381 ) ( ON ?auto_49383 ?auto_49382 ) ( not ( = ?auto_49378 ?auto_49379 ) ) ( not ( = ?auto_49378 ?auto_49380 ) ) ( not ( = ?auto_49378 ?auto_49381 ) ) ( not ( = ?auto_49378 ?auto_49382 ) ) ( not ( = ?auto_49378 ?auto_49383 ) ) ( not ( = ?auto_49378 ?auto_49384 ) ) ( not ( = ?auto_49378 ?auto_49385 ) ) ( not ( = ?auto_49378 ?auto_49386 ) ) ( not ( = ?auto_49379 ?auto_49380 ) ) ( not ( = ?auto_49379 ?auto_49381 ) ) ( not ( = ?auto_49379 ?auto_49382 ) ) ( not ( = ?auto_49379 ?auto_49383 ) ) ( not ( = ?auto_49379 ?auto_49384 ) ) ( not ( = ?auto_49379 ?auto_49385 ) ) ( not ( = ?auto_49379 ?auto_49386 ) ) ( not ( = ?auto_49380 ?auto_49381 ) ) ( not ( = ?auto_49380 ?auto_49382 ) ) ( not ( = ?auto_49380 ?auto_49383 ) ) ( not ( = ?auto_49380 ?auto_49384 ) ) ( not ( = ?auto_49380 ?auto_49385 ) ) ( not ( = ?auto_49380 ?auto_49386 ) ) ( not ( = ?auto_49381 ?auto_49382 ) ) ( not ( = ?auto_49381 ?auto_49383 ) ) ( not ( = ?auto_49381 ?auto_49384 ) ) ( not ( = ?auto_49381 ?auto_49385 ) ) ( not ( = ?auto_49381 ?auto_49386 ) ) ( not ( = ?auto_49382 ?auto_49383 ) ) ( not ( = ?auto_49382 ?auto_49384 ) ) ( not ( = ?auto_49382 ?auto_49385 ) ) ( not ( = ?auto_49382 ?auto_49386 ) ) ( not ( = ?auto_49383 ?auto_49384 ) ) ( not ( = ?auto_49383 ?auto_49385 ) ) ( not ( = ?auto_49383 ?auto_49386 ) ) ( not ( = ?auto_49384 ?auto_49385 ) ) ( not ( = ?auto_49384 ?auto_49386 ) ) ( not ( = ?auto_49385 ?auto_49386 ) ) ( CLEAR ?auto_49383 ) ( ON ?auto_49384 ?auto_49385 ) ( CLEAR ?auto_49384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_49378 ?auto_49379 ?auto_49380 ?auto_49381 ?auto_49382 ?auto_49383 ?auto_49384 )
      ( MAKE-8PILE ?auto_49378 ?auto_49379 ?auto_49380 ?auto_49381 ?auto_49382 ?auto_49383 ?auto_49384 ?auto_49385 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49395 - BLOCK
      ?auto_49396 - BLOCK
      ?auto_49397 - BLOCK
      ?auto_49398 - BLOCK
      ?auto_49399 - BLOCK
      ?auto_49400 - BLOCK
      ?auto_49401 - BLOCK
      ?auto_49402 - BLOCK
    )
    :vars
    (
      ?auto_49403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49402 ?auto_49403 ) ( ON-TABLE ?auto_49395 ) ( ON ?auto_49396 ?auto_49395 ) ( ON ?auto_49397 ?auto_49396 ) ( ON ?auto_49398 ?auto_49397 ) ( ON ?auto_49399 ?auto_49398 ) ( ON ?auto_49400 ?auto_49399 ) ( not ( = ?auto_49395 ?auto_49396 ) ) ( not ( = ?auto_49395 ?auto_49397 ) ) ( not ( = ?auto_49395 ?auto_49398 ) ) ( not ( = ?auto_49395 ?auto_49399 ) ) ( not ( = ?auto_49395 ?auto_49400 ) ) ( not ( = ?auto_49395 ?auto_49401 ) ) ( not ( = ?auto_49395 ?auto_49402 ) ) ( not ( = ?auto_49395 ?auto_49403 ) ) ( not ( = ?auto_49396 ?auto_49397 ) ) ( not ( = ?auto_49396 ?auto_49398 ) ) ( not ( = ?auto_49396 ?auto_49399 ) ) ( not ( = ?auto_49396 ?auto_49400 ) ) ( not ( = ?auto_49396 ?auto_49401 ) ) ( not ( = ?auto_49396 ?auto_49402 ) ) ( not ( = ?auto_49396 ?auto_49403 ) ) ( not ( = ?auto_49397 ?auto_49398 ) ) ( not ( = ?auto_49397 ?auto_49399 ) ) ( not ( = ?auto_49397 ?auto_49400 ) ) ( not ( = ?auto_49397 ?auto_49401 ) ) ( not ( = ?auto_49397 ?auto_49402 ) ) ( not ( = ?auto_49397 ?auto_49403 ) ) ( not ( = ?auto_49398 ?auto_49399 ) ) ( not ( = ?auto_49398 ?auto_49400 ) ) ( not ( = ?auto_49398 ?auto_49401 ) ) ( not ( = ?auto_49398 ?auto_49402 ) ) ( not ( = ?auto_49398 ?auto_49403 ) ) ( not ( = ?auto_49399 ?auto_49400 ) ) ( not ( = ?auto_49399 ?auto_49401 ) ) ( not ( = ?auto_49399 ?auto_49402 ) ) ( not ( = ?auto_49399 ?auto_49403 ) ) ( not ( = ?auto_49400 ?auto_49401 ) ) ( not ( = ?auto_49400 ?auto_49402 ) ) ( not ( = ?auto_49400 ?auto_49403 ) ) ( not ( = ?auto_49401 ?auto_49402 ) ) ( not ( = ?auto_49401 ?auto_49403 ) ) ( not ( = ?auto_49402 ?auto_49403 ) ) ( CLEAR ?auto_49400 ) ( ON ?auto_49401 ?auto_49402 ) ( CLEAR ?auto_49401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_49395 ?auto_49396 ?auto_49397 ?auto_49398 ?auto_49399 ?auto_49400 ?auto_49401 )
      ( MAKE-8PILE ?auto_49395 ?auto_49396 ?auto_49397 ?auto_49398 ?auto_49399 ?auto_49400 ?auto_49401 ?auto_49402 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49412 - BLOCK
      ?auto_49413 - BLOCK
      ?auto_49414 - BLOCK
      ?auto_49415 - BLOCK
      ?auto_49416 - BLOCK
      ?auto_49417 - BLOCK
      ?auto_49418 - BLOCK
      ?auto_49419 - BLOCK
    )
    :vars
    (
      ?auto_49420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49419 ?auto_49420 ) ( ON-TABLE ?auto_49412 ) ( ON ?auto_49413 ?auto_49412 ) ( ON ?auto_49414 ?auto_49413 ) ( ON ?auto_49415 ?auto_49414 ) ( ON ?auto_49416 ?auto_49415 ) ( not ( = ?auto_49412 ?auto_49413 ) ) ( not ( = ?auto_49412 ?auto_49414 ) ) ( not ( = ?auto_49412 ?auto_49415 ) ) ( not ( = ?auto_49412 ?auto_49416 ) ) ( not ( = ?auto_49412 ?auto_49417 ) ) ( not ( = ?auto_49412 ?auto_49418 ) ) ( not ( = ?auto_49412 ?auto_49419 ) ) ( not ( = ?auto_49412 ?auto_49420 ) ) ( not ( = ?auto_49413 ?auto_49414 ) ) ( not ( = ?auto_49413 ?auto_49415 ) ) ( not ( = ?auto_49413 ?auto_49416 ) ) ( not ( = ?auto_49413 ?auto_49417 ) ) ( not ( = ?auto_49413 ?auto_49418 ) ) ( not ( = ?auto_49413 ?auto_49419 ) ) ( not ( = ?auto_49413 ?auto_49420 ) ) ( not ( = ?auto_49414 ?auto_49415 ) ) ( not ( = ?auto_49414 ?auto_49416 ) ) ( not ( = ?auto_49414 ?auto_49417 ) ) ( not ( = ?auto_49414 ?auto_49418 ) ) ( not ( = ?auto_49414 ?auto_49419 ) ) ( not ( = ?auto_49414 ?auto_49420 ) ) ( not ( = ?auto_49415 ?auto_49416 ) ) ( not ( = ?auto_49415 ?auto_49417 ) ) ( not ( = ?auto_49415 ?auto_49418 ) ) ( not ( = ?auto_49415 ?auto_49419 ) ) ( not ( = ?auto_49415 ?auto_49420 ) ) ( not ( = ?auto_49416 ?auto_49417 ) ) ( not ( = ?auto_49416 ?auto_49418 ) ) ( not ( = ?auto_49416 ?auto_49419 ) ) ( not ( = ?auto_49416 ?auto_49420 ) ) ( not ( = ?auto_49417 ?auto_49418 ) ) ( not ( = ?auto_49417 ?auto_49419 ) ) ( not ( = ?auto_49417 ?auto_49420 ) ) ( not ( = ?auto_49418 ?auto_49419 ) ) ( not ( = ?auto_49418 ?auto_49420 ) ) ( not ( = ?auto_49419 ?auto_49420 ) ) ( ON ?auto_49418 ?auto_49419 ) ( CLEAR ?auto_49416 ) ( ON ?auto_49417 ?auto_49418 ) ( CLEAR ?auto_49417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49412 ?auto_49413 ?auto_49414 ?auto_49415 ?auto_49416 ?auto_49417 )
      ( MAKE-8PILE ?auto_49412 ?auto_49413 ?auto_49414 ?auto_49415 ?auto_49416 ?auto_49417 ?auto_49418 ?auto_49419 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49429 - BLOCK
      ?auto_49430 - BLOCK
      ?auto_49431 - BLOCK
      ?auto_49432 - BLOCK
      ?auto_49433 - BLOCK
      ?auto_49434 - BLOCK
      ?auto_49435 - BLOCK
      ?auto_49436 - BLOCK
    )
    :vars
    (
      ?auto_49437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49436 ?auto_49437 ) ( ON-TABLE ?auto_49429 ) ( ON ?auto_49430 ?auto_49429 ) ( ON ?auto_49431 ?auto_49430 ) ( ON ?auto_49432 ?auto_49431 ) ( ON ?auto_49433 ?auto_49432 ) ( not ( = ?auto_49429 ?auto_49430 ) ) ( not ( = ?auto_49429 ?auto_49431 ) ) ( not ( = ?auto_49429 ?auto_49432 ) ) ( not ( = ?auto_49429 ?auto_49433 ) ) ( not ( = ?auto_49429 ?auto_49434 ) ) ( not ( = ?auto_49429 ?auto_49435 ) ) ( not ( = ?auto_49429 ?auto_49436 ) ) ( not ( = ?auto_49429 ?auto_49437 ) ) ( not ( = ?auto_49430 ?auto_49431 ) ) ( not ( = ?auto_49430 ?auto_49432 ) ) ( not ( = ?auto_49430 ?auto_49433 ) ) ( not ( = ?auto_49430 ?auto_49434 ) ) ( not ( = ?auto_49430 ?auto_49435 ) ) ( not ( = ?auto_49430 ?auto_49436 ) ) ( not ( = ?auto_49430 ?auto_49437 ) ) ( not ( = ?auto_49431 ?auto_49432 ) ) ( not ( = ?auto_49431 ?auto_49433 ) ) ( not ( = ?auto_49431 ?auto_49434 ) ) ( not ( = ?auto_49431 ?auto_49435 ) ) ( not ( = ?auto_49431 ?auto_49436 ) ) ( not ( = ?auto_49431 ?auto_49437 ) ) ( not ( = ?auto_49432 ?auto_49433 ) ) ( not ( = ?auto_49432 ?auto_49434 ) ) ( not ( = ?auto_49432 ?auto_49435 ) ) ( not ( = ?auto_49432 ?auto_49436 ) ) ( not ( = ?auto_49432 ?auto_49437 ) ) ( not ( = ?auto_49433 ?auto_49434 ) ) ( not ( = ?auto_49433 ?auto_49435 ) ) ( not ( = ?auto_49433 ?auto_49436 ) ) ( not ( = ?auto_49433 ?auto_49437 ) ) ( not ( = ?auto_49434 ?auto_49435 ) ) ( not ( = ?auto_49434 ?auto_49436 ) ) ( not ( = ?auto_49434 ?auto_49437 ) ) ( not ( = ?auto_49435 ?auto_49436 ) ) ( not ( = ?auto_49435 ?auto_49437 ) ) ( not ( = ?auto_49436 ?auto_49437 ) ) ( ON ?auto_49435 ?auto_49436 ) ( CLEAR ?auto_49433 ) ( ON ?auto_49434 ?auto_49435 ) ( CLEAR ?auto_49434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49429 ?auto_49430 ?auto_49431 ?auto_49432 ?auto_49433 ?auto_49434 )
      ( MAKE-8PILE ?auto_49429 ?auto_49430 ?auto_49431 ?auto_49432 ?auto_49433 ?auto_49434 ?auto_49435 ?auto_49436 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49446 - BLOCK
      ?auto_49447 - BLOCK
      ?auto_49448 - BLOCK
      ?auto_49449 - BLOCK
      ?auto_49450 - BLOCK
      ?auto_49451 - BLOCK
      ?auto_49452 - BLOCK
      ?auto_49453 - BLOCK
    )
    :vars
    (
      ?auto_49454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49453 ?auto_49454 ) ( ON-TABLE ?auto_49446 ) ( ON ?auto_49447 ?auto_49446 ) ( ON ?auto_49448 ?auto_49447 ) ( ON ?auto_49449 ?auto_49448 ) ( not ( = ?auto_49446 ?auto_49447 ) ) ( not ( = ?auto_49446 ?auto_49448 ) ) ( not ( = ?auto_49446 ?auto_49449 ) ) ( not ( = ?auto_49446 ?auto_49450 ) ) ( not ( = ?auto_49446 ?auto_49451 ) ) ( not ( = ?auto_49446 ?auto_49452 ) ) ( not ( = ?auto_49446 ?auto_49453 ) ) ( not ( = ?auto_49446 ?auto_49454 ) ) ( not ( = ?auto_49447 ?auto_49448 ) ) ( not ( = ?auto_49447 ?auto_49449 ) ) ( not ( = ?auto_49447 ?auto_49450 ) ) ( not ( = ?auto_49447 ?auto_49451 ) ) ( not ( = ?auto_49447 ?auto_49452 ) ) ( not ( = ?auto_49447 ?auto_49453 ) ) ( not ( = ?auto_49447 ?auto_49454 ) ) ( not ( = ?auto_49448 ?auto_49449 ) ) ( not ( = ?auto_49448 ?auto_49450 ) ) ( not ( = ?auto_49448 ?auto_49451 ) ) ( not ( = ?auto_49448 ?auto_49452 ) ) ( not ( = ?auto_49448 ?auto_49453 ) ) ( not ( = ?auto_49448 ?auto_49454 ) ) ( not ( = ?auto_49449 ?auto_49450 ) ) ( not ( = ?auto_49449 ?auto_49451 ) ) ( not ( = ?auto_49449 ?auto_49452 ) ) ( not ( = ?auto_49449 ?auto_49453 ) ) ( not ( = ?auto_49449 ?auto_49454 ) ) ( not ( = ?auto_49450 ?auto_49451 ) ) ( not ( = ?auto_49450 ?auto_49452 ) ) ( not ( = ?auto_49450 ?auto_49453 ) ) ( not ( = ?auto_49450 ?auto_49454 ) ) ( not ( = ?auto_49451 ?auto_49452 ) ) ( not ( = ?auto_49451 ?auto_49453 ) ) ( not ( = ?auto_49451 ?auto_49454 ) ) ( not ( = ?auto_49452 ?auto_49453 ) ) ( not ( = ?auto_49452 ?auto_49454 ) ) ( not ( = ?auto_49453 ?auto_49454 ) ) ( ON ?auto_49452 ?auto_49453 ) ( ON ?auto_49451 ?auto_49452 ) ( CLEAR ?auto_49449 ) ( ON ?auto_49450 ?auto_49451 ) ( CLEAR ?auto_49450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49446 ?auto_49447 ?auto_49448 ?auto_49449 ?auto_49450 )
      ( MAKE-8PILE ?auto_49446 ?auto_49447 ?auto_49448 ?auto_49449 ?auto_49450 ?auto_49451 ?auto_49452 ?auto_49453 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49463 - BLOCK
      ?auto_49464 - BLOCK
      ?auto_49465 - BLOCK
      ?auto_49466 - BLOCK
      ?auto_49467 - BLOCK
      ?auto_49468 - BLOCK
      ?auto_49469 - BLOCK
      ?auto_49470 - BLOCK
    )
    :vars
    (
      ?auto_49471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49470 ?auto_49471 ) ( ON-TABLE ?auto_49463 ) ( ON ?auto_49464 ?auto_49463 ) ( ON ?auto_49465 ?auto_49464 ) ( ON ?auto_49466 ?auto_49465 ) ( not ( = ?auto_49463 ?auto_49464 ) ) ( not ( = ?auto_49463 ?auto_49465 ) ) ( not ( = ?auto_49463 ?auto_49466 ) ) ( not ( = ?auto_49463 ?auto_49467 ) ) ( not ( = ?auto_49463 ?auto_49468 ) ) ( not ( = ?auto_49463 ?auto_49469 ) ) ( not ( = ?auto_49463 ?auto_49470 ) ) ( not ( = ?auto_49463 ?auto_49471 ) ) ( not ( = ?auto_49464 ?auto_49465 ) ) ( not ( = ?auto_49464 ?auto_49466 ) ) ( not ( = ?auto_49464 ?auto_49467 ) ) ( not ( = ?auto_49464 ?auto_49468 ) ) ( not ( = ?auto_49464 ?auto_49469 ) ) ( not ( = ?auto_49464 ?auto_49470 ) ) ( not ( = ?auto_49464 ?auto_49471 ) ) ( not ( = ?auto_49465 ?auto_49466 ) ) ( not ( = ?auto_49465 ?auto_49467 ) ) ( not ( = ?auto_49465 ?auto_49468 ) ) ( not ( = ?auto_49465 ?auto_49469 ) ) ( not ( = ?auto_49465 ?auto_49470 ) ) ( not ( = ?auto_49465 ?auto_49471 ) ) ( not ( = ?auto_49466 ?auto_49467 ) ) ( not ( = ?auto_49466 ?auto_49468 ) ) ( not ( = ?auto_49466 ?auto_49469 ) ) ( not ( = ?auto_49466 ?auto_49470 ) ) ( not ( = ?auto_49466 ?auto_49471 ) ) ( not ( = ?auto_49467 ?auto_49468 ) ) ( not ( = ?auto_49467 ?auto_49469 ) ) ( not ( = ?auto_49467 ?auto_49470 ) ) ( not ( = ?auto_49467 ?auto_49471 ) ) ( not ( = ?auto_49468 ?auto_49469 ) ) ( not ( = ?auto_49468 ?auto_49470 ) ) ( not ( = ?auto_49468 ?auto_49471 ) ) ( not ( = ?auto_49469 ?auto_49470 ) ) ( not ( = ?auto_49469 ?auto_49471 ) ) ( not ( = ?auto_49470 ?auto_49471 ) ) ( ON ?auto_49469 ?auto_49470 ) ( ON ?auto_49468 ?auto_49469 ) ( CLEAR ?auto_49466 ) ( ON ?auto_49467 ?auto_49468 ) ( CLEAR ?auto_49467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49463 ?auto_49464 ?auto_49465 ?auto_49466 ?auto_49467 )
      ( MAKE-8PILE ?auto_49463 ?auto_49464 ?auto_49465 ?auto_49466 ?auto_49467 ?auto_49468 ?auto_49469 ?auto_49470 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49480 - BLOCK
      ?auto_49481 - BLOCK
      ?auto_49482 - BLOCK
      ?auto_49483 - BLOCK
      ?auto_49484 - BLOCK
      ?auto_49485 - BLOCK
      ?auto_49486 - BLOCK
      ?auto_49487 - BLOCK
    )
    :vars
    (
      ?auto_49488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49487 ?auto_49488 ) ( ON-TABLE ?auto_49480 ) ( ON ?auto_49481 ?auto_49480 ) ( ON ?auto_49482 ?auto_49481 ) ( not ( = ?auto_49480 ?auto_49481 ) ) ( not ( = ?auto_49480 ?auto_49482 ) ) ( not ( = ?auto_49480 ?auto_49483 ) ) ( not ( = ?auto_49480 ?auto_49484 ) ) ( not ( = ?auto_49480 ?auto_49485 ) ) ( not ( = ?auto_49480 ?auto_49486 ) ) ( not ( = ?auto_49480 ?auto_49487 ) ) ( not ( = ?auto_49480 ?auto_49488 ) ) ( not ( = ?auto_49481 ?auto_49482 ) ) ( not ( = ?auto_49481 ?auto_49483 ) ) ( not ( = ?auto_49481 ?auto_49484 ) ) ( not ( = ?auto_49481 ?auto_49485 ) ) ( not ( = ?auto_49481 ?auto_49486 ) ) ( not ( = ?auto_49481 ?auto_49487 ) ) ( not ( = ?auto_49481 ?auto_49488 ) ) ( not ( = ?auto_49482 ?auto_49483 ) ) ( not ( = ?auto_49482 ?auto_49484 ) ) ( not ( = ?auto_49482 ?auto_49485 ) ) ( not ( = ?auto_49482 ?auto_49486 ) ) ( not ( = ?auto_49482 ?auto_49487 ) ) ( not ( = ?auto_49482 ?auto_49488 ) ) ( not ( = ?auto_49483 ?auto_49484 ) ) ( not ( = ?auto_49483 ?auto_49485 ) ) ( not ( = ?auto_49483 ?auto_49486 ) ) ( not ( = ?auto_49483 ?auto_49487 ) ) ( not ( = ?auto_49483 ?auto_49488 ) ) ( not ( = ?auto_49484 ?auto_49485 ) ) ( not ( = ?auto_49484 ?auto_49486 ) ) ( not ( = ?auto_49484 ?auto_49487 ) ) ( not ( = ?auto_49484 ?auto_49488 ) ) ( not ( = ?auto_49485 ?auto_49486 ) ) ( not ( = ?auto_49485 ?auto_49487 ) ) ( not ( = ?auto_49485 ?auto_49488 ) ) ( not ( = ?auto_49486 ?auto_49487 ) ) ( not ( = ?auto_49486 ?auto_49488 ) ) ( not ( = ?auto_49487 ?auto_49488 ) ) ( ON ?auto_49486 ?auto_49487 ) ( ON ?auto_49485 ?auto_49486 ) ( ON ?auto_49484 ?auto_49485 ) ( CLEAR ?auto_49482 ) ( ON ?auto_49483 ?auto_49484 ) ( CLEAR ?auto_49483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49480 ?auto_49481 ?auto_49482 ?auto_49483 )
      ( MAKE-8PILE ?auto_49480 ?auto_49481 ?auto_49482 ?auto_49483 ?auto_49484 ?auto_49485 ?auto_49486 ?auto_49487 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49497 - BLOCK
      ?auto_49498 - BLOCK
      ?auto_49499 - BLOCK
      ?auto_49500 - BLOCK
      ?auto_49501 - BLOCK
      ?auto_49502 - BLOCK
      ?auto_49503 - BLOCK
      ?auto_49504 - BLOCK
    )
    :vars
    (
      ?auto_49505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49504 ?auto_49505 ) ( ON-TABLE ?auto_49497 ) ( ON ?auto_49498 ?auto_49497 ) ( ON ?auto_49499 ?auto_49498 ) ( not ( = ?auto_49497 ?auto_49498 ) ) ( not ( = ?auto_49497 ?auto_49499 ) ) ( not ( = ?auto_49497 ?auto_49500 ) ) ( not ( = ?auto_49497 ?auto_49501 ) ) ( not ( = ?auto_49497 ?auto_49502 ) ) ( not ( = ?auto_49497 ?auto_49503 ) ) ( not ( = ?auto_49497 ?auto_49504 ) ) ( not ( = ?auto_49497 ?auto_49505 ) ) ( not ( = ?auto_49498 ?auto_49499 ) ) ( not ( = ?auto_49498 ?auto_49500 ) ) ( not ( = ?auto_49498 ?auto_49501 ) ) ( not ( = ?auto_49498 ?auto_49502 ) ) ( not ( = ?auto_49498 ?auto_49503 ) ) ( not ( = ?auto_49498 ?auto_49504 ) ) ( not ( = ?auto_49498 ?auto_49505 ) ) ( not ( = ?auto_49499 ?auto_49500 ) ) ( not ( = ?auto_49499 ?auto_49501 ) ) ( not ( = ?auto_49499 ?auto_49502 ) ) ( not ( = ?auto_49499 ?auto_49503 ) ) ( not ( = ?auto_49499 ?auto_49504 ) ) ( not ( = ?auto_49499 ?auto_49505 ) ) ( not ( = ?auto_49500 ?auto_49501 ) ) ( not ( = ?auto_49500 ?auto_49502 ) ) ( not ( = ?auto_49500 ?auto_49503 ) ) ( not ( = ?auto_49500 ?auto_49504 ) ) ( not ( = ?auto_49500 ?auto_49505 ) ) ( not ( = ?auto_49501 ?auto_49502 ) ) ( not ( = ?auto_49501 ?auto_49503 ) ) ( not ( = ?auto_49501 ?auto_49504 ) ) ( not ( = ?auto_49501 ?auto_49505 ) ) ( not ( = ?auto_49502 ?auto_49503 ) ) ( not ( = ?auto_49502 ?auto_49504 ) ) ( not ( = ?auto_49502 ?auto_49505 ) ) ( not ( = ?auto_49503 ?auto_49504 ) ) ( not ( = ?auto_49503 ?auto_49505 ) ) ( not ( = ?auto_49504 ?auto_49505 ) ) ( ON ?auto_49503 ?auto_49504 ) ( ON ?auto_49502 ?auto_49503 ) ( ON ?auto_49501 ?auto_49502 ) ( CLEAR ?auto_49499 ) ( ON ?auto_49500 ?auto_49501 ) ( CLEAR ?auto_49500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49497 ?auto_49498 ?auto_49499 ?auto_49500 )
      ( MAKE-8PILE ?auto_49497 ?auto_49498 ?auto_49499 ?auto_49500 ?auto_49501 ?auto_49502 ?auto_49503 ?auto_49504 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49514 - BLOCK
      ?auto_49515 - BLOCK
      ?auto_49516 - BLOCK
      ?auto_49517 - BLOCK
      ?auto_49518 - BLOCK
      ?auto_49519 - BLOCK
      ?auto_49520 - BLOCK
      ?auto_49521 - BLOCK
    )
    :vars
    (
      ?auto_49522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49521 ?auto_49522 ) ( ON-TABLE ?auto_49514 ) ( ON ?auto_49515 ?auto_49514 ) ( not ( = ?auto_49514 ?auto_49515 ) ) ( not ( = ?auto_49514 ?auto_49516 ) ) ( not ( = ?auto_49514 ?auto_49517 ) ) ( not ( = ?auto_49514 ?auto_49518 ) ) ( not ( = ?auto_49514 ?auto_49519 ) ) ( not ( = ?auto_49514 ?auto_49520 ) ) ( not ( = ?auto_49514 ?auto_49521 ) ) ( not ( = ?auto_49514 ?auto_49522 ) ) ( not ( = ?auto_49515 ?auto_49516 ) ) ( not ( = ?auto_49515 ?auto_49517 ) ) ( not ( = ?auto_49515 ?auto_49518 ) ) ( not ( = ?auto_49515 ?auto_49519 ) ) ( not ( = ?auto_49515 ?auto_49520 ) ) ( not ( = ?auto_49515 ?auto_49521 ) ) ( not ( = ?auto_49515 ?auto_49522 ) ) ( not ( = ?auto_49516 ?auto_49517 ) ) ( not ( = ?auto_49516 ?auto_49518 ) ) ( not ( = ?auto_49516 ?auto_49519 ) ) ( not ( = ?auto_49516 ?auto_49520 ) ) ( not ( = ?auto_49516 ?auto_49521 ) ) ( not ( = ?auto_49516 ?auto_49522 ) ) ( not ( = ?auto_49517 ?auto_49518 ) ) ( not ( = ?auto_49517 ?auto_49519 ) ) ( not ( = ?auto_49517 ?auto_49520 ) ) ( not ( = ?auto_49517 ?auto_49521 ) ) ( not ( = ?auto_49517 ?auto_49522 ) ) ( not ( = ?auto_49518 ?auto_49519 ) ) ( not ( = ?auto_49518 ?auto_49520 ) ) ( not ( = ?auto_49518 ?auto_49521 ) ) ( not ( = ?auto_49518 ?auto_49522 ) ) ( not ( = ?auto_49519 ?auto_49520 ) ) ( not ( = ?auto_49519 ?auto_49521 ) ) ( not ( = ?auto_49519 ?auto_49522 ) ) ( not ( = ?auto_49520 ?auto_49521 ) ) ( not ( = ?auto_49520 ?auto_49522 ) ) ( not ( = ?auto_49521 ?auto_49522 ) ) ( ON ?auto_49520 ?auto_49521 ) ( ON ?auto_49519 ?auto_49520 ) ( ON ?auto_49518 ?auto_49519 ) ( ON ?auto_49517 ?auto_49518 ) ( CLEAR ?auto_49515 ) ( ON ?auto_49516 ?auto_49517 ) ( CLEAR ?auto_49516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49514 ?auto_49515 ?auto_49516 )
      ( MAKE-8PILE ?auto_49514 ?auto_49515 ?auto_49516 ?auto_49517 ?auto_49518 ?auto_49519 ?auto_49520 ?auto_49521 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49531 - BLOCK
      ?auto_49532 - BLOCK
      ?auto_49533 - BLOCK
      ?auto_49534 - BLOCK
      ?auto_49535 - BLOCK
      ?auto_49536 - BLOCK
      ?auto_49537 - BLOCK
      ?auto_49538 - BLOCK
    )
    :vars
    (
      ?auto_49539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49538 ?auto_49539 ) ( ON-TABLE ?auto_49531 ) ( ON ?auto_49532 ?auto_49531 ) ( not ( = ?auto_49531 ?auto_49532 ) ) ( not ( = ?auto_49531 ?auto_49533 ) ) ( not ( = ?auto_49531 ?auto_49534 ) ) ( not ( = ?auto_49531 ?auto_49535 ) ) ( not ( = ?auto_49531 ?auto_49536 ) ) ( not ( = ?auto_49531 ?auto_49537 ) ) ( not ( = ?auto_49531 ?auto_49538 ) ) ( not ( = ?auto_49531 ?auto_49539 ) ) ( not ( = ?auto_49532 ?auto_49533 ) ) ( not ( = ?auto_49532 ?auto_49534 ) ) ( not ( = ?auto_49532 ?auto_49535 ) ) ( not ( = ?auto_49532 ?auto_49536 ) ) ( not ( = ?auto_49532 ?auto_49537 ) ) ( not ( = ?auto_49532 ?auto_49538 ) ) ( not ( = ?auto_49532 ?auto_49539 ) ) ( not ( = ?auto_49533 ?auto_49534 ) ) ( not ( = ?auto_49533 ?auto_49535 ) ) ( not ( = ?auto_49533 ?auto_49536 ) ) ( not ( = ?auto_49533 ?auto_49537 ) ) ( not ( = ?auto_49533 ?auto_49538 ) ) ( not ( = ?auto_49533 ?auto_49539 ) ) ( not ( = ?auto_49534 ?auto_49535 ) ) ( not ( = ?auto_49534 ?auto_49536 ) ) ( not ( = ?auto_49534 ?auto_49537 ) ) ( not ( = ?auto_49534 ?auto_49538 ) ) ( not ( = ?auto_49534 ?auto_49539 ) ) ( not ( = ?auto_49535 ?auto_49536 ) ) ( not ( = ?auto_49535 ?auto_49537 ) ) ( not ( = ?auto_49535 ?auto_49538 ) ) ( not ( = ?auto_49535 ?auto_49539 ) ) ( not ( = ?auto_49536 ?auto_49537 ) ) ( not ( = ?auto_49536 ?auto_49538 ) ) ( not ( = ?auto_49536 ?auto_49539 ) ) ( not ( = ?auto_49537 ?auto_49538 ) ) ( not ( = ?auto_49537 ?auto_49539 ) ) ( not ( = ?auto_49538 ?auto_49539 ) ) ( ON ?auto_49537 ?auto_49538 ) ( ON ?auto_49536 ?auto_49537 ) ( ON ?auto_49535 ?auto_49536 ) ( ON ?auto_49534 ?auto_49535 ) ( CLEAR ?auto_49532 ) ( ON ?auto_49533 ?auto_49534 ) ( CLEAR ?auto_49533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49531 ?auto_49532 ?auto_49533 )
      ( MAKE-8PILE ?auto_49531 ?auto_49532 ?auto_49533 ?auto_49534 ?auto_49535 ?auto_49536 ?auto_49537 ?auto_49538 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49548 - BLOCK
      ?auto_49549 - BLOCK
      ?auto_49550 - BLOCK
      ?auto_49551 - BLOCK
      ?auto_49552 - BLOCK
      ?auto_49553 - BLOCK
      ?auto_49554 - BLOCK
      ?auto_49555 - BLOCK
    )
    :vars
    (
      ?auto_49556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49555 ?auto_49556 ) ( ON-TABLE ?auto_49548 ) ( not ( = ?auto_49548 ?auto_49549 ) ) ( not ( = ?auto_49548 ?auto_49550 ) ) ( not ( = ?auto_49548 ?auto_49551 ) ) ( not ( = ?auto_49548 ?auto_49552 ) ) ( not ( = ?auto_49548 ?auto_49553 ) ) ( not ( = ?auto_49548 ?auto_49554 ) ) ( not ( = ?auto_49548 ?auto_49555 ) ) ( not ( = ?auto_49548 ?auto_49556 ) ) ( not ( = ?auto_49549 ?auto_49550 ) ) ( not ( = ?auto_49549 ?auto_49551 ) ) ( not ( = ?auto_49549 ?auto_49552 ) ) ( not ( = ?auto_49549 ?auto_49553 ) ) ( not ( = ?auto_49549 ?auto_49554 ) ) ( not ( = ?auto_49549 ?auto_49555 ) ) ( not ( = ?auto_49549 ?auto_49556 ) ) ( not ( = ?auto_49550 ?auto_49551 ) ) ( not ( = ?auto_49550 ?auto_49552 ) ) ( not ( = ?auto_49550 ?auto_49553 ) ) ( not ( = ?auto_49550 ?auto_49554 ) ) ( not ( = ?auto_49550 ?auto_49555 ) ) ( not ( = ?auto_49550 ?auto_49556 ) ) ( not ( = ?auto_49551 ?auto_49552 ) ) ( not ( = ?auto_49551 ?auto_49553 ) ) ( not ( = ?auto_49551 ?auto_49554 ) ) ( not ( = ?auto_49551 ?auto_49555 ) ) ( not ( = ?auto_49551 ?auto_49556 ) ) ( not ( = ?auto_49552 ?auto_49553 ) ) ( not ( = ?auto_49552 ?auto_49554 ) ) ( not ( = ?auto_49552 ?auto_49555 ) ) ( not ( = ?auto_49552 ?auto_49556 ) ) ( not ( = ?auto_49553 ?auto_49554 ) ) ( not ( = ?auto_49553 ?auto_49555 ) ) ( not ( = ?auto_49553 ?auto_49556 ) ) ( not ( = ?auto_49554 ?auto_49555 ) ) ( not ( = ?auto_49554 ?auto_49556 ) ) ( not ( = ?auto_49555 ?auto_49556 ) ) ( ON ?auto_49554 ?auto_49555 ) ( ON ?auto_49553 ?auto_49554 ) ( ON ?auto_49552 ?auto_49553 ) ( ON ?auto_49551 ?auto_49552 ) ( ON ?auto_49550 ?auto_49551 ) ( CLEAR ?auto_49548 ) ( ON ?auto_49549 ?auto_49550 ) ( CLEAR ?auto_49549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49548 ?auto_49549 )
      ( MAKE-8PILE ?auto_49548 ?auto_49549 ?auto_49550 ?auto_49551 ?auto_49552 ?auto_49553 ?auto_49554 ?auto_49555 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49565 - BLOCK
      ?auto_49566 - BLOCK
      ?auto_49567 - BLOCK
      ?auto_49568 - BLOCK
      ?auto_49569 - BLOCK
      ?auto_49570 - BLOCK
      ?auto_49571 - BLOCK
      ?auto_49572 - BLOCK
    )
    :vars
    (
      ?auto_49573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49572 ?auto_49573 ) ( ON-TABLE ?auto_49565 ) ( not ( = ?auto_49565 ?auto_49566 ) ) ( not ( = ?auto_49565 ?auto_49567 ) ) ( not ( = ?auto_49565 ?auto_49568 ) ) ( not ( = ?auto_49565 ?auto_49569 ) ) ( not ( = ?auto_49565 ?auto_49570 ) ) ( not ( = ?auto_49565 ?auto_49571 ) ) ( not ( = ?auto_49565 ?auto_49572 ) ) ( not ( = ?auto_49565 ?auto_49573 ) ) ( not ( = ?auto_49566 ?auto_49567 ) ) ( not ( = ?auto_49566 ?auto_49568 ) ) ( not ( = ?auto_49566 ?auto_49569 ) ) ( not ( = ?auto_49566 ?auto_49570 ) ) ( not ( = ?auto_49566 ?auto_49571 ) ) ( not ( = ?auto_49566 ?auto_49572 ) ) ( not ( = ?auto_49566 ?auto_49573 ) ) ( not ( = ?auto_49567 ?auto_49568 ) ) ( not ( = ?auto_49567 ?auto_49569 ) ) ( not ( = ?auto_49567 ?auto_49570 ) ) ( not ( = ?auto_49567 ?auto_49571 ) ) ( not ( = ?auto_49567 ?auto_49572 ) ) ( not ( = ?auto_49567 ?auto_49573 ) ) ( not ( = ?auto_49568 ?auto_49569 ) ) ( not ( = ?auto_49568 ?auto_49570 ) ) ( not ( = ?auto_49568 ?auto_49571 ) ) ( not ( = ?auto_49568 ?auto_49572 ) ) ( not ( = ?auto_49568 ?auto_49573 ) ) ( not ( = ?auto_49569 ?auto_49570 ) ) ( not ( = ?auto_49569 ?auto_49571 ) ) ( not ( = ?auto_49569 ?auto_49572 ) ) ( not ( = ?auto_49569 ?auto_49573 ) ) ( not ( = ?auto_49570 ?auto_49571 ) ) ( not ( = ?auto_49570 ?auto_49572 ) ) ( not ( = ?auto_49570 ?auto_49573 ) ) ( not ( = ?auto_49571 ?auto_49572 ) ) ( not ( = ?auto_49571 ?auto_49573 ) ) ( not ( = ?auto_49572 ?auto_49573 ) ) ( ON ?auto_49571 ?auto_49572 ) ( ON ?auto_49570 ?auto_49571 ) ( ON ?auto_49569 ?auto_49570 ) ( ON ?auto_49568 ?auto_49569 ) ( ON ?auto_49567 ?auto_49568 ) ( CLEAR ?auto_49565 ) ( ON ?auto_49566 ?auto_49567 ) ( CLEAR ?auto_49566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49565 ?auto_49566 )
      ( MAKE-8PILE ?auto_49565 ?auto_49566 ?auto_49567 ?auto_49568 ?auto_49569 ?auto_49570 ?auto_49571 ?auto_49572 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49582 - BLOCK
      ?auto_49583 - BLOCK
      ?auto_49584 - BLOCK
      ?auto_49585 - BLOCK
      ?auto_49586 - BLOCK
      ?auto_49587 - BLOCK
      ?auto_49588 - BLOCK
      ?auto_49589 - BLOCK
    )
    :vars
    (
      ?auto_49590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49589 ?auto_49590 ) ( not ( = ?auto_49582 ?auto_49583 ) ) ( not ( = ?auto_49582 ?auto_49584 ) ) ( not ( = ?auto_49582 ?auto_49585 ) ) ( not ( = ?auto_49582 ?auto_49586 ) ) ( not ( = ?auto_49582 ?auto_49587 ) ) ( not ( = ?auto_49582 ?auto_49588 ) ) ( not ( = ?auto_49582 ?auto_49589 ) ) ( not ( = ?auto_49582 ?auto_49590 ) ) ( not ( = ?auto_49583 ?auto_49584 ) ) ( not ( = ?auto_49583 ?auto_49585 ) ) ( not ( = ?auto_49583 ?auto_49586 ) ) ( not ( = ?auto_49583 ?auto_49587 ) ) ( not ( = ?auto_49583 ?auto_49588 ) ) ( not ( = ?auto_49583 ?auto_49589 ) ) ( not ( = ?auto_49583 ?auto_49590 ) ) ( not ( = ?auto_49584 ?auto_49585 ) ) ( not ( = ?auto_49584 ?auto_49586 ) ) ( not ( = ?auto_49584 ?auto_49587 ) ) ( not ( = ?auto_49584 ?auto_49588 ) ) ( not ( = ?auto_49584 ?auto_49589 ) ) ( not ( = ?auto_49584 ?auto_49590 ) ) ( not ( = ?auto_49585 ?auto_49586 ) ) ( not ( = ?auto_49585 ?auto_49587 ) ) ( not ( = ?auto_49585 ?auto_49588 ) ) ( not ( = ?auto_49585 ?auto_49589 ) ) ( not ( = ?auto_49585 ?auto_49590 ) ) ( not ( = ?auto_49586 ?auto_49587 ) ) ( not ( = ?auto_49586 ?auto_49588 ) ) ( not ( = ?auto_49586 ?auto_49589 ) ) ( not ( = ?auto_49586 ?auto_49590 ) ) ( not ( = ?auto_49587 ?auto_49588 ) ) ( not ( = ?auto_49587 ?auto_49589 ) ) ( not ( = ?auto_49587 ?auto_49590 ) ) ( not ( = ?auto_49588 ?auto_49589 ) ) ( not ( = ?auto_49588 ?auto_49590 ) ) ( not ( = ?auto_49589 ?auto_49590 ) ) ( ON ?auto_49588 ?auto_49589 ) ( ON ?auto_49587 ?auto_49588 ) ( ON ?auto_49586 ?auto_49587 ) ( ON ?auto_49585 ?auto_49586 ) ( ON ?auto_49584 ?auto_49585 ) ( ON ?auto_49583 ?auto_49584 ) ( ON ?auto_49582 ?auto_49583 ) ( CLEAR ?auto_49582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49582 )
      ( MAKE-8PILE ?auto_49582 ?auto_49583 ?auto_49584 ?auto_49585 ?auto_49586 ?auto_49587 ?auto_49588 ?auto_49589 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49599 - BLOCK
      ?auto_49600 - BLOCK
      ?auto_49601 - BLOCK
      ?auto_49602 - BLOCK
      ?auto_49603 - BLOCK
      ?auto_49604 - BLOCK
      ?auto_49605 - BLOCK
      ?auto_49606 - BLOCK
    )
    :vars
    (
      ?auto_49607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49606 ?auto_49607 ) ( not ( = ?auto_49599 ?auto_49600 ) ) ( not ( = ?auto_49599 ?auto_49601 ) ) ( not ( = ?auto_49599 ?auto_49602 ) ) ( not ( = ?auto_49599 ?auto_49603 ) ) ( not ( = ?auto_49599 ?auto_49604 ) ) ( not ( = ?auto_49599 ?auto_49605 ) ) ( not ( = ?auto_49599 ?auto_49606 ) ) ( not ( = ?auto_49599 ?auto_49607 ) ) ( not ( = ?auto_49600 ?auto_49601 ) ) ( not ( = ?auto_49600 ?auto_49602 ) ) ( not ( = ?auto_49600 ?auto_49603 ) ) ( not ( = ?auto_49600 ?auto_49604 ) ) ( not ( = ?auto_49600 ?auto_49605 ) ) ( not ( = ?auto_49600 ?auto_49606 ) ) ( not ( = ?auto_49600 ?auto_49607 ) ) ( not ( = ?auto_49601 ?auto_49602 ) ) ( not ( = ?auto_49601 ?auto_49603 ) ) ( not ( = ?auto_49601 ?auto_49604 ) ) ( not ( = ?auto_49601 ?auto_49605 ) ) ( not ( = ?auto_49601 ?auto_49606 ) ) ( not ( = ?auto_49601 ?auto_49607 ) ) ( not ( = ?auto_49602 ?auto_49603 ) ) ( not ( = ?auto_49602 ?auto_49604 ) ) ( not ( = ?auto_49602 ?auto_49605 ) ) ( not ( = ?auto_49602 ?auto_49606 ) ) ( not ( = ?auto_49602 ?auto_49607 ) ) ( not ( = ?auto_49603 ?auto_49604 ) ) ( not ( = ?auto_49603 ?auto_49605 ) ) ( not ( = ?auto_49603 ?auto_49606 ) ) ( not ( = ?auto_49603 ?auto_49607 ) ) ( not ( = ?auto_49604 ?auto_49605 ) ) ( not ( = ?auto_49604 ?auto_49606 ) ) ( not ( = ?auto_49604 ?auto_49607 ) ) ( not ( = ?auto_49605 ?auto_49606 ) ) ( not ( = ?auto_49605 ?auto_49607 ) ) ( not ( = ?auto_49606 ?auto_49607 ) ) ( ON ?auto_49605 ?auto_49606 ) ( ON ?auto_49604 ?auto_49605 ) ( ON ?auto_49603 ?auto_49604 ) ( ON ?auto_49602 ?auto_49603 ) ( ON ?auto_49601 ?auto_49602 ) ( ON ?auto_49600 ?auto_49601 ) ( ON ?auto_49599 ?auto_49600 ) ( CLEAR ?auto_49599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49599 )
      ( MAKE-8PILE ?auto_49599 ?auto_49600 ?auto_49601 ?auto_49602 ?auto_49603 ?auto_49604 ?auto_49605 ?auto_49606 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49617 - BLOCK
      ?auto_49618 - BLOCK
      ?auto_49619 - BLOCK
      ?auto_49620 - BLOCK
      ?auto_49621 - BLOCK
      ?auto_49622 - BLOCK
      ?auto_49623 - BLOCK
      ?auto_49624 - BLOCK
      ?auto_49625 - BLOCK
    )
    :vars
    (
      ?auto_49626 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49624 ) ( ON ?auto_49625 ?auto_49626 ) ( CLEAR ?auto_49625 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49617 ) ( ON ?auto_49618 ?auto_49617 ) ( ON ?auto_49619 ?auto_49618 ) ( ON ?auto_49620 ?auto_49619 ) ( ON ?auto_49621 ?auto_49620 ) ( ON ?auto_49622 ?auto_49621 ) ( ON ?auto_49623 ?auto_49622 ) ( ON ?auto_49624 ?auto_49623 ) ( not ( = ?auto_49617 ?auto_49618 ) ) ( not ( = ?auto_49617 ?auto_49619 ) ) ( not ( = ?auto_49617 ?auto_49620 ) ) ( not ( = ?auto_49617 ?auto_49621 ) ) ( not ( = ?auto_49617 ?auto_49622 ) ) ( not ( = ?auto_49617 ?auto_49623 ) ) ( not ( = ?auto_49617 ?auto_49624 ) ) ( not ( = ?auto_49617 ?auto_49625 ) ) ( not ( = ?auto_49617 ?auto_49626 ) ) ( not ( = ?auto_49618 ?auto_49619 ) ) ( not ( = ?auto_49618 ?auto_49620 ) ) ( not ( = ?auto_49618 ?auto_49621 ) ) ( not ( = ?auto_49618 ?auto_49622 ) ) ( not ( = ?auto_49618 ?auto_49623 ) ) ( not ( = ?auto_49618 ?auto_49624 ) ) ( not ( = ?auto_49618 ?auto_49625 ) ) ( not ( = ?auto_49618 ?auto_49626 ) ) ( not ( = ?auto_49619 ?auto_49620 ) ) ( not ( = ?auto_49619 ?auto_49621 ) ) ( not ( = ?auto_49619 ?auto_49622 ) ) ( not ( = ?auto_49619 ?auto_49623 ) ) ( not ( = ?auto_49619 ?auto_49624 ) ) ( not ( = ?auto_49619 ?auto_49625 ) ) ( not ( = ?auto_49619 ?auto_49626 ) ) ( not ( = ?auto_49620 ?auto_49621 ) ) ( not ( = ?auto_49620 ?auto_49622 ) ) ( not ( = ?auto_49620 ?auto_49623 ) ) ( not ( = ?auto_49620 ?auto_49624 ) ) ( not ( = ?auto_49620 ?auto_49625 ) ) ( not ( = ?auto_49620 ?auto_49626 ) ) ( not ( = ?auto_49621 ?auto_49622 ) ) ( not ( = ?auto_49621 ?auto_49623 ) ) ( not ( = ?auto_49621 ?auto_49624 ) ) ( not ( = ?auto_49621 ?auto_49625 ) ) ( not ( = ?auto_49621 ?auto_49626 ) ) ( not ( = ?auto_49622 ?auto_49623 ) ) ( not ( = ?auto_49622 ?auto_49624 ) ) ( not ( = ?auto_49622 ?auto_49625 ) ) ( not ( = ?auto_49622 ?auto_49626 ) ) ( not ( = ?auto_49623 ?auto_49624 ) ) ( not ( = ?auto_49623 ?auto_49625 ) ) ( not ( = ?auto_49623 ?auto_49626 ) ) ( not ( = ?auto_49624 ?auto_49625 ) ) ( not ( = ?auto_49624 ?auto_49626 ) ) ( not ( = ?auto_49625 ?auto_49626 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49625 ?auto_49626 )
      ( !STACK ?auto_49625 ?auto_49624 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49636 - BLOCK
      ?auto_49637 - BLOCK
      ?auto_49638 - BLOCK
      ?auto_49639 - BLOCK
      ?auto_49640 - BLOCK
      ?auto_49641 - BLOCK
      ?auto_49642 - BLOCK
      ?auto_49643 - BLOCK
      ?auto_49644 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49643 ) ( ON-TABLE ?auto_49644 ) ( CLEAR ?auto_49644 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49636 ) ( ON ?auto_49637 ?auto_49636 ) ( ON ?auto_49638 ?auto_49637 ) ( ON ?auto_49639 ?auto_49638 ) ( ON ?auto_49640 ?auto_49639 ) ( ON ?auto_49641 ?auto_49640 ) ( ON ?auto_49642 ?auto_49641 ) ( ON ?auto_49643 ?auto_49642 ) ( not ( = ?auto_49636 ?auto_49637 ) ) ( not ( = ?auto_49636 ?auto_49638 ) ) ( not ( = ?auto_49636 ?auto_49639 ) ) ( not ( = ?auto_49636 ?auto_49640 ) ) ( not ( = ?auto_49636 ?auto_49641 ) ) ( not ( = ?auto_49636 ?auto_49642 ) ) ( not ( = ?auto_49636 ?auto_49643 ) ) ( not ( = ?auto_49636 ?auto_49644 ) ) ( not ( = ?auto_49637 ?auto_49638 ) ) ( not ( = ?auto_49637 ?auto_49639 ) ) ( not ( = ?auto_49637 ?auto_49640 ) ) ( not ( = ?auto_49637 ?auto_49641 ) ) ( not ( = ?auto_49637 ?auto_49642 ) ) ( not ( = ?auto_49637 ?auto_49643 ) ) ( not ( = ?auto_49637 ?auto_49644 ) ) ( not ( = ?auto_49638 ?auto_49639 ) ) ( not ( = ?auto_49638 ?auto_49640 ) ) ( not ( = ?auto_49638 ?auto_49641 ) ) ( not ( = ?auto_49638 ?auto_49642 ) ) ( not ( = ?auto_49638 ?auto_49643 ) ) ( not ( = ?auto_49638 ?auto_49644 ) ) ( not ( = ?auto_49639 ?auto_49640 ) ) ( not ( = ?auto_49639 ?auto_49641 ) ) ( not ( = ?auto_49639 ?auto_49642 ) ) ( not ( = ?auto_49639 ?auto_49643 ) ) ( not ( = ?auto_49639 ?auto_49644 ) ) ( not ( = ?auto_49640 ?auto_49641 ) ) ( not ( = ?auto_49640 ?auto_49642 ) ) ( not ( = ?auto_49640 ?auto_49643 ) ) ( not ( = ?auto_49640 ?auto_49644 ) ) ( not ( = ?auto_49641 ?auto_49642 ) ) ( not ( = ?auto_49641 ?auto_49643 ) ) ( not ( = ?auto_49641 ?auto_49644 ) ) ( not ( = ?auto_49642 ?auto_49643 ) ) ( not ( = ?auto_49642 ?auto_49644 ) ) ( not ( = ?auto_49643 ?auto_49644 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_49644 )
      ( !STACK ?auto_49644 ?auto_49643 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49654 - BLOCK
      ?auto_49655 - BLOCK
      ?auto_49656 - BLOCK
      ?auto_49657 - BLOCK
      ?auto_49658 - BLOCK
      ?auto_49659 - BLOCK
      ?auto_49660 - BLOCK
      ?auto_49661 - BLOCK
      ?auto_49662 - BLOCK
    )
    :vars
    (
      ?auto_49663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49662 ?auto_49663 ) ( ON-TABLE ?auto_49654 ) ( ON ?auto_49655 ?auto_49654 ) ( ON ?auto_49656 ?auto_49655 ) ( ON ?auto_49657 ?auto_49656 ) ( ON ?auto_49658 ?auto_49657 ) ( ON ?auto_49659 ?auto_49658 ) ( ON ?auto_49660 ?auto_49659 ) ( not ( = ?auto_49654 ?auto_49655 ) ) ( not ( = ?auto_49654 ?auto_49656 ) ) ( not ( = ?auto_49654 ?auto_49657 ) ) ( not ( = ?auto_49654 ?auto_49658 ) ) ( not ( = ?auto_49654 ?auto_49659 ) ) ( not ( = ?auto_49654 ?auto_49660 ) ) ( not ( = ?auto_49654 ?auto_49661 ) ) ( not ( = ?auto_49654 ?auto_49662 ) ) ( not ( = ?auto_49654 ?auto_49663 ) ) ( not ( = ?auto_49655 ?auto_49656 ) ) ( not ( = ?auto_49655 ?auto_49657 ) ) ( not ( = ?auto_49655 ?auto_49658 ) ) ( not ( = ?auto_49655 ?auto_49659 ) ) ( not ( = ?auto_49655 ?auto_49660 ) ) ( not ( = ?auto_49655 ?auto_49661 ) ) ( not ( = ?auto_49655 ?auto_49662 ) ) ( not ( = ?auto_49655 ?auto_49663 ) ) ( not ( = ?auto_49656 ?auto_49657 ) ) ( not ( = ?auto_49656 ?auto_49658 ) ) ( not ( = ?auto_49656 ?auto_49659 ) ) ( not ( = ?auto_49656 ?auto_49660 ) ) ( not ( = ?auto_49656 ?auto_49661 ) ) ( not ( = ?auto_49656 ?auto_49662 ) ) ( not ( = ?auto_49656 ?auto_49663 ) ) ( not ( = ?auto_49657 ?auto_49658 ) ) ( not ( = ?auto_49657 ?auto_49659 ) ) ( not ( = ?auto_49657 ?auto_49660 ) ) ( not ( = ?auto_49657 ?auto_49661 ) ) ( not ( = ?auto_49657 ?auto_49662 ) ) ( not ( = ?auto_49657 ?auto_49663 ) ) ( not ( = ?auto_49658 ?auto_49659 ) ) ( not ( = ?auto_49658 ?auto_49660 ) ) ( not ( = ?auto_49658 ?auto_49661 ) ) ( not ( = ?auto_49658 ?auto_49662 ) ) ( not ( = ?auto_49658 ?auto_49663 ) ) ( not ( = ?auto_49659 ?auto_49660 ) ) ( not ( = ?auto_49659 ?auto_49661 ) ) ( not ( = ?auto_49659 ?auto_49662 ) ) ( not ( = ?auto_49659 ?auto_49663 ) ) ( not ( = ?auto_49660 ?auto_49661 ) ) ( not ( = ?auto_49660 ?auto_49662 ) ) ( not ( = ?auto_49660 ?auto_49663 ) ) ( not ( = ?auto_49661 ?auto_49662 ) ) ( not ( = ?auto_49661 ?auto_49663 ) ) ( not ( = ?auto_49662 ?auto_49663 ) ) ( CLEAR ?auto_49660 ) ( ON ?auto_49661 ?auto_49662 ) ( CLEAR ?auto_49661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_49654 ?auto_49655 ?auto_49656 ?auto_49657 ?auto_49658 ?auto_49659 ?auto_49660 ?auto_49661 )
      ( MAKE-9PILE ?auto_49654 ?auto_49655 ?auto_49656 ?auto_49657 ?auto_49658 ?auto_49659 ?auto_49660 ?auto_49661 ?auto_49662 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49673 - BLOCK
      ?auto_49674 - BLOCK
      ?auto_49675 - BLOCK
      ?auto_49676 - BLOCK
      ?auto_49677 - BLOCK
      ?auto_49678 - BLOCK
      ?auto_49679 - BLOCK
      ?auto_49680 - BLOCK
      ?auto_49681 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49681 ) ( ON-TABLE ?auto_49673 ) ( ON ?auto_49674 ?auto_49673 ) ( ON ?auto_49675 ?auto_49674 ) ( ON ?auto_49676 ?auto_49675 ) ( ON ?auto_49677 ?auto_49676 ) ( ON ?auto_49678 ?auto_49677 ) ( ON ?auto_49679 ?auto_49678 ) ( not ( = ?auto_49673 ?auto_49674 ) ) ( not ( = ?auto_49673 ?auto_49675 ) ) ( not ( = ?auto_49673 ?auto_49676 ) ) ( not ( = ?auto_49673 ?auto_49677 ) ) ( not ( = ?auto_49673 ?auto_49678 ) ) ( not ( = ?auto_49673 ?auto_49679 ) ) ( not ( = ?auto_49673 ?auto_49680 ) ) ( not ( = ?auto_49673 ?auto_49681 ) ) ( not ( = ?auto_49674 ?auto_49675 ) ) ( not ( = ?auto_49674 ?auto_49676 ) ) ( not ( = ?auto_49674 ?auto_49677 ) ) ( not ( = ?auto_49674 ?auto_49678 ) ) ( not ( = ?auto_49674 ?auto_49679 ) ) ( not ( = ?auto_49674 ?auto_49680 ) ) ( not ( = ?auto_49674 ?auto_49681 ) ) ( not ( = ?auto_49675 ?auto_49676 ) ) ( not ( = ?auto_49675 ?auto_49677 ) ) ( not ( = ?auto_49675 ?auto_49678 ) ) ( not ( = ?auto_49675 ?auto_49679 ) ) ( not ( = ?auto_49675 ?auto_49680 ) ) ( not ( = ?auto_49675 ?auto_49681 ) ) ( not ( = ?auto_49676 ?auto_49677 ) ) ( not ( = ?auto_49676 ?auto_49678 ) ) ( not ( = ?auto_49676 ?auto_49679 ) ) ( not ( = ?auto_49676 ?auto_49680 ) ) ( not ( = ?auto_49676 ?auto_49681 ) ) ( not ( = ?auto_49677 ?auto_49678 ) ) ( not ( = ?auto_49677 ?auto_49679 ) ) ( not ( = ?auto_49677 ?auto_49680 ) ) ( not ( = ?auto_49677 ?auto_49681 ) ) ( not ( = ?auto_49678 ?auto_49679 ) ) ( not ( = ?auto_49678 ?auto_49680 ) ) ( not ( = ?auto_49678 ?auto_49681 ) ) ( not ( = ?auto_49679 ?auto_49680 ) ) ( not ( = ?auto_49679 ?auto_49681 ) ) ( not ( = ?auto_49680 ?auto_49681 ) ) ( CLEAR ?auto_49679 ) ( ON ?auto_49680 ?auto_49681 ) ( CLEAR ?auto_49680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_49673 ?auto_49674 ?auto_49675 ?auto_49676 ?auto_49677 ?auto_49678 ?auto_49679 ?auto_49680 )
      ( MAKE-9PILE ?auto_49673 ?auto_49674 ?auto_49675 ?auto_49676 ?auto_49677 ?auto_49678 ?auto_49679 ?auto_49680 ?auto_49681 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49691 - BLOCK
      ?auto_49692 - BLOCK
      ?auto_49693 - BLOCK
      ?auto_49694 - BLOCK
      ?auto_49695 - BLOCK
      ?auto_49696 - BLOCK
      ?auto_49697 - BLOCK
      ?auto_49698 - BLOCK
      ?auto_49699 - BLOCK
    )
    :vars
    (
      ?auto_49700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49699 ?auto_49700 ) ( ON-TABLE ?auto_49691 ) ( ON ?auto_49692 ?auto_49691 ) ( ON ?auto_49693 ?auto_49692 ) ( ON ?auto_49694 ?auto_49693 ) ( ON ?auto_49695 ?auto_49694 ) ( ON ?auto_49696 ?auto_49695 ) ( not ( = ?auto_49691 ?auto_49692 ) ) ( not ( = ?auto_49691 ?auto_49693 ) ) ( not ( = ?auto_49691 ?auto_49694 ) ) ( not ( = ?auto_49691 ?auto_49695 ) ) ( not ( = ?auto_49691 ?auto_49696 ) ) ( not ( = ?auto_49691 ?auto_49697 ) ) ( not ( = ?auto_49691 ?auto_49698 ) ) ( not ( = ?auto_49691 ?auto_49699 ) ) ( not ( = ?auto_49691 ?auto_49700 ) ) ( not ( = ?auto_49692 ?auto_49693 ) ) ( not ( = ?auto_49692 ?auto_49694 ) ) ( not ( = ?auto_49692 ?auto_49695 ) ) ( not ( = ?auto_49692 ?auto_49696 ) ) ( not ( = ?auto_49692 ?auto_49697 ) ) ( not ( = ?auto_49692 ?auto_49698 ) ) ( not ( = ?auto_49692 ?auto_49699 ) ) ( not ( = ?auto_49692 ?auto_49700 ) ) ( not ( = ?auto_49693 ?auto_49694 ) ) ( not ( = ?auto_49693 ?auto_49695 ) ) ( not ( = ?auto_49693 ?auto_49696 ) ) ( not ( = ?auto_49693 ?auto_49697 ) ) ( not ( = ?auto_49693 ?auto_49698 ) ) ( not ( = ?auto_49693 ?auto_49699 ) ) ( not ( = ?auto_49693 ?auto_49700 ) ) ( not ( = ?auto_49694 ?auto_49695 ) ) ( not ( = ?auto_49694 ?auto_49696 ) ) ( not ( = ?auto_49694 ?auto_49697 ) ) ( not ( = ?auto_49694 ?auto_49698 ) ) ( not ( = ?auto_49694 ?auto_49699 ) ) ( not ( = ?auto_49694 ?auto_49700 ) ) ( not ( = ?auto_49695 ?auto_49696 ) ) ( not ( = ?auto_49695 ?auto_49697 ) ) ( not ( = ?auto_49695 ?auto_49698 ) ) ( not ( = ?auto_49695 ?auto_49699 ) ) ( not ( = ?auto_49695 ?auto_49700 ) ) ( not ( = ?auto_49696 ?auto_49697 ) ) ( not ( = ?auto_49696 ?auto_49698 ) ) ( not ( = ?auto_49696 ?auto_49699 ) ) ( not ( = ?auto_49696 ?auto_49700 ) ) ( not ( = ?auto_49697 ?auto_49698 ) ) ( not ( = ?auto_49697 ?auto_49699 ) ) ( not ( = ?auto_49697 ?auto_49700 ) ) ( not ( = ?auto_49698 ?auto_49699 ) ) ( not ( = ?auto_49698 ?auto_49700 ) ) ( not ( = ?auto_49699 ?auto_49700 ) ) ( ON ?auto_49698 ?auto_49699 ) ( CLEAR ?auto_49696 ) ( ON ?auto_49697 ?auto_49698 ) ( CLEAR ?auto_49697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_49691 ?auto_49692 ?auto_49693 ?auto_49694 ?auto_49695 ?auto_49696 ?auto_49697 )
      ( MAKE-9PILE ?auto_49691 ?auto_49692 ?auto_49693 ?auto_49694 ?auto_49695 ?auto_49696 ?auto_49697 ?auto_49698 ?auto_49699 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49710 - BLOCK
      ?auto_49711 - BLOCK
      ?auto_49712 - BLOCK
      ?auto_49713 - BLOCK
      ?auto_49714 - BLOCK
      ?auto_49715 - BLOCK
      ?auto_49716 - BLOCK
      ?auto_49717 - BLOCK
      ?auto_49718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49718 ) ( ON-TABLE ?auto_49710 ) ( ON ?auto_49711 ?auto_49710 ) ( ON ?auto_49712 ?auto_49711 ) ( ON ?auto_49713 ?auto_49712 ) ( ON ?auto_49714 ?auto_49713 ) ( ON ?auto_49715 ?auto_49714 ) ( not ( = ?auto_49710 ?auto_49711 ) ) ( not ( = ?auto_49710 ?auto_49712 ) ) ( not ( = ?auto_49710 ?auto_49713 ) ) ( not ( = ?auto_49710 ?auto_49714 ) ) ( not ( = ?auto_49710 ?auto_49715 ) ) ( not ( = ?auto_49710 ?auto_49716 ) ) ( not ( = ?auto_49710 ?auto_49717 ) ) ( not ( = ?auto_49710 ?auto_49718 ) ) ( not ( = ?auto_49711 ?auto_49712 ) ) ( not ( = ?auto_49711 ?auto_49713 ) ) ( not ( = ?auto_49711 ?auto_49714 ) ) ( not ( = ?auto_49711 ?auto_49715 ) ) ( not ( = ?auto_49711 ?auto_49716 ) ) ( not ( = ?auto_49711 ?auto_49717 ) ) ( not ( = ?auto_49711 ?auto_49718 ) ) ( not ( = ?auto_49712 ?auto_49713 ) ) ( not ( = ?auto_49712 ?auto_49714 ) ) ( not ( = ?auto_49712 ?auto_49715 ) ) ( not ( = ?auto_49712 ?auto_49716 ) ) ( not ( = ?auto_49712 ?auto_49717 ) ) ( not ( = ?auto_49712 ?auto_49718 ) ) ( not ( = ?auto_49713 ?auto_49714 ) ) ( not ( = ?auto_49713 ?auto_49715 ) ) ( not ( = ?auto_49713 ?auto_49716 ) ) ( not ( = ?auto_49713 ?auto_49717 ) ) ( not ( = ?auto_49713 ?auto_49718 ) ) ( not ( = ?auto_49714 ?auto_49715 ) ) ( not ( = ?auto_49714 ?auto_49716 ) ) ( not ( = ?auto_49714 ?auto_49717 ) ) ( not ( = ?auto_49714 ?auto_49718 ) ) ( not ( = ?auto_49715 ?auto_49716 ) ) ( not ( = ?auto_49715 ?auto_49717 ) ) ( not ( = ?auto_49715 ?auto_49718 ) ) ( not ( = ?auto_49716 ?auto_49717 ) ) ( not ( = ?auto_49716 ?auto_49718 ) ) ( not ( = ?auto_49717 ?auto_49718 ) ) ( ON ?auto_49717 ?auto_49718 ) ( CLEAR ?auto_49715 ) ( ON ?auto_49716 ?auto_49717 ) ( CLEAR ?auto_49716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_49710 ?auto_49711 ?auto_49712 ?auto_49713 ?auto_49714 ?auto_49715 ?auto_49716 )
      ( MAKE-9PILE ?auto_49710 ?auto_49711 ?auto_49712 ?auto_49713 ?auto_49714 ?auto_49715 ?auto_49716 ?auto_49717 ?auto_49718 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49728 - BLOCK
      ?auto_49729 - BLOCK
      ?auto_49730 - BLOCK
      ?auto_49731 - BLOCK
      ?auto_49732 - BLOCK
      ?auto_49733 - BLOCK
      ?auto_49734 - BLOCK
      ?auto_49735 - BLOCK
      ?auto_49736 - BLOCK
    )
    :vars
    (
      ?auto_49737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49736 ?auto_49737 ) ( ON-TABLE ?auto_49728 ) ( ON ?auto_49729 ?auto_49728 ) ( ON ?auto_49730 ?auto_49729 ) ( ON ?auto_49731 ?auto_49730 ) ( ON ?auto_49732 ?auto_49731 ) ( not ( = ?auto_49728 ?auto_49729 ) ) ( not ( = ?auto_49728 ?auto_49730 ) ) ( not ( = ?auto_49728 ?auto_49731 ) ) ( not ( = ?auto_49728 ?auto_49732 ) ) ( not ( = ?auto_49728 ?auto_49733 ) ) ( not ( = ?auto_49728 ?auto_49734 ) ) ( not ( = ?auto_49728 ?auto_49735 ) ) ( not ( = ?auto_49728 ?auto_49736 ) ) ( not ( = ?auto_49728 ?auto_49737 ) ) ( not ( = ?auto_49729 ?auto_49730 ) ) ( not ( = ?auto_49729 ?auto_49731 ) ) ( not ( = ?auto_49729 ?auto_49732 ) ) ( not ( = ?auto_49729 ?auto_49733 ) ) ( not ( = ?auto_49729 ?auto_49734 ) ) ( not ( = ?auto_49729 ?auto_49735 ) ) ( not ( = ?auto_49729 ?auto_49736 ) ) ( not ( = ?auto_49729 ?auto_49737 ) ) ( not ( = ?auto_49730 ?auto_49731 ) ) ( not ( = ?auto_49730 ?auto_49732 ) ) ( not ( = ?auto_49730 ?auto_49733 ) ) ( not ( = ?auto_49730 ?auto_49734 ) ) ( not ( = ?auto_49730 ?auto_49735 ) ) ( not ( = ?auto_49730 ?auto_49736 ) ) ( not ( = ?auto_49730 ?auto_49737 ) ) ( not ( = ?auto_49731 ?auto_49732 ) ) ( not ( = ?auto_49731 ?auto_49733 ) ) ( not ( = ?auto_49731 ?auto_49734 ) ) ( not ( = ?auto_49731 ?auto_49735 ) ) ( not ( = ?auto_49731 ?auto_49736 ) ) ( not ( = ?auto_49731 ?auto_49737 ) ) ( not ( = ?auto_49732 ?auto_49733 ) ) ( not ( = ?auto_49732 ?auto_49734 ) ) ( not ( = ?auto_49732 ?auto_49735 ) ) ( not ( = ?auto_49732 ?auto_49736 ) ) ( not ( = ?auto_49732 ?auto_49737 ) ) ( not ( = ?auto_49733 ?auto_49734 ) ) ( not ( = ?auto_49733 ?auto_49735 ) ) ( not ( = ?auto_49733 ?auto_49736 ) ) ( not ( = ?auto_49733 ?auto_49737 ) ) ( not ( = ?auto_49734 ?auto_49735 ) ) ( not ( = ?auto_49734 ?auto_49736 ) ) ( not ( = ?auto_49734 ?auto_49737 ) ) ( not ( = ?auto_49735 ?auto_49736 ) ) ( not ( = ?auto_49735 ?auto_49737 ) ) ( not ( = ?auto_49736 ?auto_49737 ) ) ( ON ?auto_49735 ?auto_49736 ) ( ON ?auto_49734 ?auto_49735 ) ( CLEAR ?auto_49732 ) ( ON ?auto_49733 ?auto_49734 ) ( CLEAR ?auto_49733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49728 ?auto_49729 ?auto_49730 ?auto_49731 ?auto_49732 ?auto_49733 )
      ( MAKE-9PILE ?auto_49728 ?auto_49729 ?auto_49730 ?auto_49731 ?auto_49732 ?auto_49733 ?auto_49734 ?auto_49735 ?auto_49736 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49747 - BLOCK
      ?auto_49748 - BLOCK
      ?auto_49749 - BLOCK
      ?auto_49750 - BLOCK
      ?auto_49751 - BLOCK
      ?auto_49752 - BLOCK
      ?auto_49753 - BLOCK
      ?auto_49754 - BLOCK
      ?auto_49755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49755 ) ( ON-TABLE ?auto_49747 ) ( ON ?auto_49748 ?auto_49747 ) ( ON ?auto_49749 ?auto_49748 ) ( ON ?auto_49750 ?auto_49749 ) ( ON ?auto_49751 ?auto_49750 ) ( not ( = ?auto_49747 ?auto_49748 ) ) ( not ( = ?auto_49747 ?auto_49749 ) ) ( not ( = ?auto_49747 ?auto_49750 ) ) ( not ( = ?auto_49747 ?auto_49751 ) ) ( not ( = ?auto_49747 ?auto_49752 ) ) ( not ( = ?auto_49747 ?auto_49753 ) ) ( not ( = ?auto_49747 ?auto_49754 ) ) ( not ( = ?auto_49747 ?auto_49755 ) ) ( not ( = ?auto_49748 ?auto_49749 ) ) ( not ( = ?auto_49748 ?auto_49750 ) ) ( not ( = ?auto_49748 ?auto_49751 ) ) ( not ( = ?auto_49748 ?auto_49752 ) ) ( not ( = ?auto_49748 ?auto_49753 ) ) ( not ( = ?auto_49748 ?auto_49754 ) ) ( not ( = ?auto_49748 ?auto_49755 ) ) ( not ( = ?auto_49749 ?auto_49750 ) ) ( not ( = ?auto_49749 ?auto_49751 ) ) ( not ( = ?auto_49749 ?auto_49752 ) ) ( not ( = ?auto_49749 ?auto_49753 ) ) ( not ( = ?auto_49749 ?auto_49754 ) ) ( not ( = ?auto_49749 ?auto_49755 ) ) ( not ( = ?auto_49750 ?auto_49751 ) ) ( not ( = ?auto_49750 ?auto_49752 ) ) ( not ( = ?auto_49750 ?auto_49753 ) ) ( not ( = ?auto_49750 ?auto_49754 ) ) ( not ( = ?auto_49750 ?auto_49755 ) ) ( not ( = ?auto_49751 ?auto_49752 ) ) ( not ( = ?auto_49751 ?auto_49753 ) ) ( not ( = ?auto_49751 ?auto_49754 ) ) ( not ( = ?auto_49751 ?auto_49755 ) ) ( not ( = ?auto_49752 ?auto_49753 ) ) ( not ( = ?auto_49752 ?auto_49754 ) ) ( not ( = ?auto_49752 ?auto_49755 ) ) ( not ( = ?auto_49753 ?auto_49754 ) ) ( not ( = ?auto_49753 ?auto_49755 ) ) ( not ( = ?auto_49754 ?auto_49755 ) ) ( ON ?auto_49754 ?auto_49755 ) ( ON ?auto_49753 ?auto_49754 ) ( CLEAR ?auto_49751 ) ( ON ?auto_49752 ?auto_49753 ) ( CLEAR ?auto_49752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49747 ?auto_49748 ?auto_49749 ?auto_49750 ?auto_49751 ?auto_49752 )
      ( MAKE-9PILE ?auto_49747 ?auto_49748 ?auto_49749 ?auto_49750 ?auto_49751 ?auto_49752 ?auto_49753 ?auto_49754 ?auto_49755 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49765 - BLOCK
      ?auto_49766 - BLOCK
      ?auto_49767 - BLOCK
      ?auto_49768 - BLOCK
      ?auto_49769 - BLOCK
      ?auto_49770 - BLOCK
      ?auto_49771 - BLOCK
      ?auto_49772 - BLOCK
      ?auto_49773 - BLOCK
    )
    :vars
    (
      ?auto_49774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49773 ?auto_49774 ) ( ON-TABLE ?auto_49765 ) ( ON ?auto_49766 ?auto_49765 ) ( ON ?auto_49767 ?auto_49766 ) ( ON ?auto_49768 ?auto_49767 ) ( not ( = ?auto_49765 ?auto_49766 ) ) ( not ( = ?auto_49765 ?auto_49767 ) ) ( not ( = ?auto_49765 ?auto_49768 ) ) ( not ( = ?auto_49765 ?auto_49769 ) ) ( not ( = ?auto_49765 ?auto_49770 ) ) ( not ( = ?auto_49765 ?auto_49771 ) ) ( not ( = ?auto_49765 ?auto_49772 ) ) ( not ( = ?auto_49765 ?auto_49773 ) ) ( not ( = ?auto_49765 ?auto_49774 ) ) ( not ( = ?auto_49766 ?auto_49767 ) ) ( not ( = ?auto_49766 ?auto_49768 ) ) ( not ( = ?auto_49766 ?auto_49769 ) ) ( not ( = ?auto_49766 ?auto_49770 ) ) ( not ( = ?auto_49766 ?auto_49771 ) ) ( not ( = ?auto_49766 ?auto_49772 ) ) ( not ( = ?auto_49766 ?auto_49773 ) ) ( not ( = ?auto_49766 ?auto_49774 ) ) ( not ( = ?auto_49767 ?auto_49768 ) ) ( not ( = ?auto_49767 ?auto_49769 ) ) ( not ( = ?auto_49767 ?auto_49770 ) ) ( not ( = ?auto_49767 ?auto_49771 ) ) ( not ( = ?auto_49767 ?auto_49772 ) ) ( not ( = ?auto_49767 ?auto_49773 ) ) ( not ( = ?auto_49767 ?auto_49774 ) ) ( not ( = ?auto_49768 ?auto_49769 ) ) ( not ( = ?auto_49768 ?auto_49770 ) ) ( not ( = ?auto_49768 ?auto_49771 ) ) ( not ( = ?auto_49768 ?auto_49772 ) ) ( not ( = ?auto_49768 ?auto_49773 ) ) ( not ( = ?auto_49768 ?auto_49774 ) ) ( not ( = ?auto_49769 ?auto_49770 ) ) ( not ( = ?auto_49769 ?auto_49771 ) ) ( not ( = ?auto_49769 ?auto_49772 ) ) ( not ( = ?auto_49769 ?auto_49773 ) ) ( not ( = ?auto_49769 ?auto_49774 ) ) ( not ( = ?auto_49770 ?auto_49771 ) ) ( not ( = ?auto_49770 ?auto_49772 ) ) ( not ( = ?auto_49770 ?auto_49773 ) ) ( not ( = ?auto_49770 ?auto_49774 ) ) ( not ( = ?auto_49771 ?auto_49772 ) ) ( not ( = ?auto_49771 ?auto_49773 ) ) ( not ( = ?auto_49771 ?auto_49774 ) ) ( not ( = ?auto_49772 ?auto_49773 ) ) ( not ( = ?auto_49772 ?auto_49774 ) ) ( not ( = ?auto_49773 ?auto_49774 ) ) ( ON ?auto_49772 ?auto_49773 ) ( ON ?auto_49771 ?auto_49772 ) ( ON ?auto_49770 ?auto_49771 ) ( CLEAR ?auto_49768 ) ( ON ?auto_49769 ?auto_49770 ) ( CLEAR ?auto_49769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49765 ?auto_49766 ?auto_49767 ?auto_49768 ?auto_49769 )
      ( MAKE-9PILE ?auto_49765 ?auto_49766 ?auto_49767 ?auto_49768 ?auto_49769 ?auto_49770 ?auto_49771 ?auto_49772 ?auto_49773 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49784 - BLOCK
      ?auto_49785 - BLOCK
      ?auto_49786 - BLOCK
      ?auto_49787 - BLOCK
      ?auto_49788 - BLOCK
      ?auto_49789 - BLOCK
      ?auto_49790 - BLOCK
      ?auto_49791 - BLOCK
      ?auto_49792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49792 ) ( ON-TABLE ?auto_49784 ) ( ON ?auto_49785 ?auto_49784 ) ( ON ?auto_49786 ?auto_49785 ) ( ON ?auto_49787 ?auto_49786 ) ( not ( = ?auto_49784 ?auto_49785 ) ) ( not ( = ?auto_49784 ?auto_49786 ) ) ( not ( = ?auto_49784 ?auto_49787 ) ) ( not ( = ?auto_49784 ?auto_49788 ) ) ( not ( = ?auto_49784 ?auto_49789 ) ) ( not ( = ?auto_49784 ?auto_49790 ) ) ( not ( = ?auto_49784 ?auto_49791 ) ) ( not ( = ?auto_49784 ?auto_49792 ) ) ( not ( = ?auto_49785 ?auto_49786 ) ) ( not ( = ?auto_49785 ?auto_49787 ) ) ( not ( = ?auto_49785 ?auto_49788 ) ) ( not ( = ?auto_49785 ?auto_49789 ) ) ( not ( = ?auto_49785 ?auto_49790 ) ) ( not ( = ?auto_49785 ?auto_49791 ) ) ( not ( = ?auto_49785 ?auto_49792 ) ) ( not ( = ?auto_49786 ?auto_49787 ) ) ( not ( = ?auto_49786 ?auto_49788 ) ) ( not ( = ?auto_49786 ?auto_49789 ) ) ( not ( = ?auto_49786 ?auto_49790 ) ) ( not ( = ?auto_49786 ?auto_49791 ) ) ( not ( = ?auto_49786 ?auto_49792 ) ) ( not ( = ?auto_49787 ?auto_49788 ) ) ( not ( = ?auto_49787 ?auto_49789 ) ) ( not ( = ?auto_49787 ?auto_49790 ) ) ( not ( = ?auto_49787 ?auto_49791 ) ) ( not ( = ?auto_49787 ?auto_49792 ) ) ( not ( = ?auto_49788 ?auto_49789 ) ) ( not ( = ?auto_49788 ?auto_49790 ) ) ( not ( = ?auto_49788 ?auto_49791 ) ) ( not ( = ?auto_49788 ?auto_49792 ) ) ( not ( = ?auto_49789 ?auto_49790 ) ) ( not ( = ?auto_49789 ?auto_49791 ) ) ( not ( = ?auto_49789 ?auto_49792 ) ) ( not ( = ?auto_49790 ?auto_49791 ) ) ( not ( = ?auto_49790 ?auto_49792 ) ) ( not ( = ?auto_49791 ?auto_49792 ) ) ( ON ?auto_49791 ?auto_49792 ) ( ON ?auto_49790 ?auto_49791 ) ( ON ?auto_49789 ?auto_49790 ) ( CLEAR ?auto_49787 ) ( ON ?auto_49788 ?auto_49789 ) ( CLEAR ?auto_49788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49784 ?auto_49785 ?auto_49786 ?auto_49787 ?auto_49788 )
      ( MAKE-9PILE ?auto_49784 ?auto_49785 ?auto_49786 ?auto_49787 ?auto_49788 ?auto_49789 ?auto_49790 ?auto_49791 ?auto_49792 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49802 - BLOCK
      ?auto_49803 - BLOCK
      ?auto_49804 - BLOCK
      ?auto_49805 - BLOCK
      ?auto_49806 - BLOCK
      ?auto_49807 - BLOCK
      ?auto_49808 - BLOCK
      ?auto_49809 - BLOCK
      ?auto_49810 - BLOCK
    )
    :vars
    (
      ?auto_49811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49810 ?auto_49811 ) ( ON-TABLE ?auto_49802 ) ( ON ?auto_49803 ?auto_49802 ) ( ON ?auto_49804 ?auto_49803 ) ( not ( = ?auto_49802 ?auto_49803 ) ) ( not ( = ?auto_49802 ?auto_49804 ) ) ( not ( = ?auto_49802 ?auto_49805 ) ) ( not ( = ?auto_49802 ?auto_49806 ) ) ( not ( = ?auto_49802 ?auto_49807 ) ) ( not ( = ?auto_49802 ?auto_49808 ) ) ( not ( = ?auto_49802 ?auto_49809 ) ) ( not ( = ?auto_49802 ?auto_49810 ) ) ( not ( = ?auto_49802 ?auto_49811 ) ) ( not ( = ?auto_49803 ?auto_49804 ) ) ( not ( = ?auto_49803 ?auto_49805 ) ) ( not ( = ?auto_49803 ?auto_49806 ) ) ( not ( = ?auto_49803 ?auto_49807 ) ) ( not ( = ?auto_49803 ?auto_49808 ) ) ( not ( = ?auto_49803 ?auto_49809 ) ) ( not ( = ?auto_49803 ?auto_49810 ) ) ( not ( = ?auto_49803 ?auto_49811 ) ) ( not ( = ?auto_49804 ?auto_49805 ) ) ( not ( = ?auto_49804 ?auto_49806 ) ) ( not ( = ?auto_49804 ?auto_49807 ) ) ( not ( = ?auto_49804 ?auto_49808 ) ) ( not ( = ?auto_49804 ?auto_49809 ) ) ( not ( = ?auto_49804 ?auto_49810 ) ) ( not ( = ?auto_49804 ?auto_49811 ) ) ( not ( = ?auto_49805 ?auto_49806 ) ) ( not ( = ?auto_49805 ?auto_49807 ) ) ( not ( = ?auto_49805 ?auto_49808 ) ) ( not ( = ?auto_49805 ?auto_49809 ) ) ( not ( = ?auto_49805 ?auto_49810 ) ) ( not ( = ?auto_49805 ?auto_49811 ) ) ( not ( = ?auto_49806 ?auto_49807 ) ) ( not ( = ?auto_49806 ?auto_49808 ) ) ( not ( = ?auto_49806 ?auto_49809 ) ) ( not ( = ?auto_49806 ?auto_49810 ) ) ( not ( = ?auto_49806 ?auto_49811 ) ) ( not ( = ?auto_49807 ?auto_49808 ) ) ( not ( = ?auto_49807 ?auto_49809 ) ) ( not ( = ?auto_49807 ?auto_49810 ) ) ( not ( = ?auto_49807 ?auto_49811 ) ) ( not ( = ?auto_49808 ?auto_49809 ) ) ( not ( = ?auto_49808 ?auto_49810 ) ) ( not ( = ?auto_49808 ?auto_49811 ) ) ( not ( = ?auto_49809 ?auto_49810 ) ) ( not ( = ?auto_49809 ?auto_49811 ) ) ( not ( = ?auto_49810 ?auto_49811 ) ) ( ON ?auto_49809 ?auto_49810 ) ( ON ?auto_49808 ?auto_49809 ) ( ON ?auto_49807 ?auto_49808 ) ( ON ?auto_49806 ?auto_49807 ) ( CLEAR ?auto_49804 ) ( ON ?auto_49805 ?auto_49806 ) ( CLEAR ?auto_49805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49802 ?auto_49803 ?auto_49804 ?auto_49805 )
      ( MAKE-9PILE ?auto_49802 ?auto_49803 ?auto_49804 ?auto_49805 ?auto_49806 ?auto_49807 ?auto_49808 ?auto_49809 ?auto_49810 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49821 - BLOCK
      ?auto_49822 - BLOCK
      ?auto_49823 - BLOCK
      ?auto_49824 - BLOCK
      ?auto_49825 - BLOCK
      ?auto_49826 - BLOCK
      ?auto_49827 - BLOCK
      ?auto_49828 - BLOCK
      ?auto_49829 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49829 ) ( ON-TABLE ?auto_49821 ) ( ON ?auto_49822 ?auto_49821 ) ( ON ?auto_49823 ?auto_49822 ) ( not ( = ?auto_49821 ?auto_49822 ) ) ( not ( = ?auto_49821 ?auto_49823 ) ) ( not ( = ?auto_49821 ?auto_49824 ) ) ( not ( = ?auto_49821 ?auto_49825 ) ) ( not ( = ?auto_49821 ?auto_49826 ) ) ( not ( = ?auto_49821 ?auto_49827 ) ) ( not ( = ?auto_49821 ?auto_49828 ) ) ( not ( = ?auto_49821 ?auto_49829 ) ) ( not ( = ?auto_49822 ?auto_49823 ) ) ( not ( = ?auto_49822 ?auto_49824 ) ) ( not ( = ?auto_49822 ?auto_49825 ) ) ( not ( = ?auto_49822 ?auto_49826 ) ) ( not ( = ?auto_49822 ?auto_49827 ) ) ( not ( = ?auto_49822 ?auto_49828 ) ) ( not ( = ?auto_49822 ?auto_49829 ) ) ( not ( = ?auto_49823 ?auto_49824 ) ) ( not ( = ?auto_49823 ?auto_49825 ) ) ( not ( = ?auto_49823 ?auto_49826 ) ) ( not ( = ?auto_49823 ?auto_49827 ) ) ( not ( = ?auto_49823 ?auto_49828 ) ) ( not ( = ?auto_49823 ?auto_49829 ) ) ( not ( = ?auto_49824 ?auto_49825 ) ) ( not ( = ?auto_49824 ?auto_49826 ) ) ( not ( = ?auto_49824 ?auto_49827 ) ) ( not ( = ?auto_49824 ?auto_49828 ) ) ( not ( = ?auto_49824 ?auto_49829 ) ) ( not ( = ?auto_49825 ?auto_49826 ) ) ( not ( = ?auto_49825 ?auto_49827 ) ) ( not ( = ?auto_49825 ?auto_49828 ) ) ( not ( = ?auto_49825 ?auto_49829 ) ) ( not ( = ?auto_49826 ?auto_49827 ) ) ( not ( = ?auto_49826 ?auto_49828 ) ) ( not ( = ?auto_49826 ?auto_49829 ) ) ( not ( = ?auto_49827 ?auto_49828 ) ) ( not ( = ?auto_49827 ?auto_49829 ) ) ( not ( = ?auto_49828 ?auto_49829 ) ) ( ON ?auto_49828 ?auto_49829 ) ( ON ?auto_49827 ?auto_49828 ) ( ON ?auto_49826 ?auto_49827 ) ( ON ?auto_49825 ?auto_49826 ) ( CLEAR ?auto_49823 ) ( ON ?auto_49824 ?auto_49825 ) ( CLEAR ?auto_49824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49821 ?auto_49822 ?auto_49823 ?auto_49824 )
      ( MAKE-9PILE ?auto_49821 ?auto_49822 ?auto_49823 ?auto_49824 ?auto_49825 ?auto_49826 ?auto_49827 ?auto_49828 ?auto_49829 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49839 - BLOCK
      ?auto_49840 - BLOCK
      ?auto_49841 - BLOCK
      ?auto_49842 - BLOCK
      ?auto_49843 - BLOCK
      ?auto_49844 - BLOCK
      ?auto_49845 - BLOCK
      ?auto_49846 - BLOCK
      ?auto_49847 - BLOCK
    )
    :vars
    (
      ?auto_49848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49847 ?auto_49848 ) ( ON-TABLE ?auto_49839 ) ( ON ?auto_49840 ?auto_49839 ) ( not ( = ?auto_49839 ?auto_49840 ) ) ( not ( = ?auto_49839 ?auto_49841 ) ) ( not ( = ?auto_49839 ?auto_49842 ) ) ( not ( = ?auto_49839 ?auto_49843 ) ) ( not ( = ?auto_49839 ?auto_49844 ) ) ( not ( = ?auto_49839 ?auto_49845 ) ) ( not ( = ?auto_49839 ?auto_49846 ) ) ( not ( = ?auto_49839 ?auto_49847 ) ) ( not ( = ?auto_49839 ?auto_49848 ) ) ( not ( = ?auto_49840 ?auto_49841 ) ) ( not ( = ?auto_49840 ?auto_49842 ) ) ( not ( = ?auto_49840 ?auto_49843 ) ) ( not ( = ?auto_49840 ?auto_49844 ) ) ( not ( = ?auto_49840 ?auto_49845 ) ) ( not ( = ?auto_49840 ?auto_49846 ) ) ( not ( = ?auto_49840 ?auto_49847 ) ) ( not ( = ?auto_49840 ?auto_49848 ) ) ( not ( = ?auto_49841 ?auto_49842 ) ) ( not ( = ?auto_49841 ?auto_49843 ) ) ( not ( = ?auto_49841 ?auto_49844 ) ) ( not ( = ?auto_49841 ?auto_49845 ) ) ( not ( = ?auto_49841 ?auto_49846 ) ) ( not ( = ?auto_49841 ?auto_49847 ) ) ( not ( = ?auto_49841 ?auto_49848 ) ) ( not ( = ?auto_49842 ?auto_49843 ) ) ( not ( = ?auto_49842 ?auto_49844 ) ) ( not ( = ?auto_49842 ?auto_49845 ) ) ( not ( = ?auto_49842 ?auto_49846 ) ) ( not ( = ?auto_49842 ?auto_49847 ) ) ( not ( = ?auto_49842 ?auto_49848 ) ) ( not ( = ?auto_49843 ?auto_49844 ) ) ( not ( = ?auto_49843 ?auto_49845 ) ) ( not ( = ?auto_49843 ?auto_49846 ) ) ( not ( = ?auto_49843 ?auto_49847 ) ) ( not ( = ?auto_49843 ?auto_49848 ) ) ( not ( = ?auto_49844 ?auto_49845 ) ) ( not ( = ?auto_49844 ?auto_49846 ) ) ( not ( = ?auto_49844 ?auto_49847 ) ) ( not ( = ?auto_49844 ?auto_49848 ) ) ( not ( = ?auto_49845 ?auto_49846 ) ) ( not ( = ?auto_49845 ?auto_49847 ) ) ( not ( = ?auto_49845 ?auto_49848 ) ) ( not ( = ?auto_49846 ?auto_49847 ) ) ( not ( = ?auto_49846 ?auto_49848 ) ) ( not ( = ?auto_49847 ?auto_49848 ) ) ( ON ?auto_49846 ?auto_49847 ) ( ON ?auto_49845 ?auto_49846 ) ( ON ?auto_49844 ?auto_49845 ) ( ON ?auto_49843 ?auto_49844 ) ( ON ?auto_49842 ?auto_49843 ) ( CLEAR ?auto_49840 ) ( ON ?auto_49841 ?auto_49842 ) ( CLEAR ?auto_49841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49839 ?auto_49840 ?auto_49841 )
      ( MAKE-9PILE ?auto_49839 ?auto_49840 ?auto_49841 ?auto_49842 ?auto_49843 ?auto_49844 ?auto_49845 ?auto_49846 ?auto_49847 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49858 - BLOCK
      ?auto_49859 - BLOCK
      ?auto_49860 - BLOCK
      ?auto_49861 - BLOCK
      ?auto_49862 - BLOCK
      ?auto_49863 - BLOCK
      ?auto_49864 - BLOCK
      ?auto_49865 - BLOCK
      ?auto_49866 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49866 ) ( ON-TABLE ?auto_49858 ) ( ON ?auto_49859 ?auto_49858 ) ( not ( = ?auto_49858 ?auto_49859 ) ) ( not ( = ?auto_49858 ?auto_49860 ) ) ( not ( = ?auto_49858 ?auto_49861 ) ) ( not ( = ?auto_49858 ?auto_49862 ) ) ( not ( = ?auto_49858 ?auto_49863 ) ) ( not ( = ?auto_49858 ?auto_49864 ) ) ( not ( = ?auto_49858 ?auto_49865 ) ) ( not ( = ?auto_49858 ?auto_49866 ) ) ( not ( = ?auto_49859 ?auto_49860 ) ) ( not ( = ?auto_49859 ?auto_49861 ) ) ( not ( = ?auto_49859 ?auto_49862 ) ) ( not ( = ?auto_49859 ?auto_49863 ) ) ( not ( = ?auto_49859 ?auto_49864 ) ) ( not ( = ?auto_49859 ?auto_49865 ) ) ( not ( = ?auto_49859 ?auto_49866 ) ) ( not ( = ?auto_49860 ?auto_49861 ) ) ( not ( = ?auto_49860 ?auto_49862 ) ) ( not ( = ?auto_49860 ?auto_49863 ) ) ( not ( = ?auto_49860 ?auto_49864 ) ) ( not ( = ?auto_49860 ?auto_49865 ) ) ( not ( = ?auto_49860 ?auto_49866 ) ) ( not ( = ?auto_49861 ?auto_49862 ) ) ( not ( = ?auto_49861 ?auto_49863 ) ) ( not ( = ?auto_49861 ?auto_49864 ) ) ( not ( = ?auto_49861 ?auto_49865 ) ) ( not ( = ?auto_49861 ?auto_49866 ) ) ( not ( = ?auto_49862 ?auto_49863 ) ) ( not ( = ?auto_49862 ?auto_49864 ) ) ( not ( = ?auto_49862 ?auto_49865 ) ) ( not ( = ?auto_49862 ?auto_49866 ) ) ( not ( = ?auto_49863 ?auto_49864 ) ) ( not ( = ?auto_49863 ?auto_49865 ) ) ( not ( = ?auto_49863 ?auto_49866 ) ) ( not ( = ?auto_49864 ?auto_49865 ) ) ( not ( = ?auto_49864 ?auto_49866 ) ) ( not ( = ?auto_49865 ?auto_49866 ) ) ( ON ?auto_49865 ?auto_49866 ) ( ON ?auto_49864 ?auto_49865 ) ( ON ?auto_49863 ?auto_49864 ) ( ON ?auto_49862 ?auto_49863 ) ( ON ?auto_49861 ?auto_49862 ) ( CLEAR ?auto_49859 ) ( ON ?auto_49860 ?auto_49861 ) ( CLEAR ?auto_49860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49858 ?auto_49859 ?auto_49860 )
      ( MAKE-9PILE ?auto_49858 ?auto_49859 ?auto_49860 ?auto_49861 ?auto_49862 ?auto_49863 ?auto_49864 ?auto_49865 ?auto_49866 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49876 - BLOCK
      ?auto_49877 - BLOCK
      ?auto_49878 - BLOCK
      ?auto_49879 - BLOCK
      ?auto_49880 - BLOCK
      ?auto_49881 - BLOCK
      ?auto_49882 - BLOCK
      ?auto_49883 - BLOCK
      ?auto_49884 - BLOCK
    )
    :vars
    (
      ?auto_49885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49884 ?auto_49885 ) ( ON-TABLE ?auto_49876 ) ( not ( = ?auto_49876 ?auto_49877 ) ) ( not ( = ?auto_49876 ?auto_49878 ) ) ( not ( = ?auto_49876 ?auto_49879 ) ) ( not ( = ?auto_49876 ?auto_49880 ) ) ( not ( = ?auto_49876 ?auto_49881 ) ) ( not ( = ?auto_49876 ?auto_49882 ) ) ( not ( = ?auto_49876 ?auto_49883 ) ) ( not ( = ?auto_49876 ?auto_49884 ) ) ( not ( = ?auto_49876 ?auto_49885 ) ) ( not ( = ?auto_49877 ?auto_49878 ) ) ( not ( = ?auto_49877 ?auto_49879 ) ) ( not ( = ?auto_49877 ?auto_49880 ) ) ( not ( = ?auto_49877 ?auto_49881 ) ) ( not ( = ?auto_49877 ?auto_49882 ) ) ( not ( = ?auto_49877 ?auto_49883 ) ) ( not ( = ?auto_49877 ?auto_49884 ) ) ( not ( = ?auto_49877 ?auto_49885 ) ) ( not ( = ?auto_49878 ?auto_49879 ) ) ( not ( = ?auto_49878 ?auto_49880 ) ) ( not ( = ?auto_49878 ?auto_49881 ) ) ( not ( = ?auto_49878 ?auto_49882 ) ) ( not ( = ?auto_49878 ?auto_49883 ) ) ( not ( = ?auto_49878 ?auto_49884 ) ) ( not ( = ?auto_49878 ?auto_49885 ) ) ( not ( = ?auto_49879 ?auto_49880 ) ) ( not ( = ?auto_49879 ?auto_49881 ) ) ( not ( = ?auto_49879 ?auto_49882 ) ) ( not ( = ?auto_49879 ?auto_49883 ) ) ( not ( = ?auto_49879 ?auto_49884 ) ) ( not ( = ?auto_49879 ?auto_49885 ) ) ( not ( = ?auto_49880 ?auto_49881 ) ) ( not ( = ?auto_49880 ?auto_49882 ) ) ( not ( = ?auto_49880 ?auto_49883 ) ) ( not ( = ?auto_49880 ?auto_49884 ) ) ( not ( = ?auto_49880 ?auto_49885 ) ) ( not ( = ?auto_49881 ?auto_49882 ) ) ( not ( = ?auto_49881 ?auto_49883 ) ) ( not ( = ?auto_49881 ?auto_49884 ) ) ( not ( = ?auto_49881 ?auto_49885 ) ) ( not ( = ?auto_49882 ?auto_49883 ) ) ( not ( = ?auto_49882 ?auto_49884 ) ) ( not ( = ?auto_49882 ?auto_49885 ) ) ( not ( = ?auto_49883 ?auto_49884 ) ) ( not ( = ?auto_49883 ?auto_49885 ) ) ( not ( = ?auto_49884 ?auto_49885 ) ) ( ON ?auto_49883 ?auto_49884 ) ( ON ?auto_49882 ?auto_49883 ) ( ON ?auto_49881 ?auto_49882 ) ( ON ?auto_49880 ?auto_49881 ) ( ON ?auto_49879 ?auto_49880 ) ( ON ?auto_49878 ?auto_49879 ) ( CLEAR ?auto_49876 ) ( ON ?auto_49877 ?auto_49878 ) ( CLEAR ?auto_49877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49876 ?auto_49877 )
      ( MAKE-9PILE ?auto_49876 ?auto_49877 ?auto_49878 ?auto_49879 ?auto_49880 ?auto_49881 ?auto_49882 ?auto_49883 ?auto_49884 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49895 - BLOCK
      ?auto_49896 - BLOCK
      ?auto_49897 - BLOCK
      ?auto_49898 - BLOCK
      ?auto_49899 - BLOCK
      ?auto_49900 - BLOCK
      ?auto_49901 - BLOCK
      ?auto_49902 - BLOCK
      ?auto_49903 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49903 ) ( ON-TABLE ?auto_49895 ) ( not ( = ?auto_49895 ?auto_49896 ) ) ( not ( = ?auto_49895 ?auto_49897 ) ) ( not ( = ?auto_49895 ?auto_49898 ) ) ( not ( = ?auto_49895 ?auto_49899 ) ) ( not ( = ?auto_49895 ?auto_49900 ) ) ( not ( = ?auto_49895 ?auto_49901 ) ) ( not ( = ?auto_49895 ?auto_49902 ) ) ( not ( = ?auto_49895 ?auto_49903 ) ) ( not ( = ?auto_49896 ?auto_49897 ) ) ( not ( = ?auto_49896 ?auto_49898 ) ) ( not ( = ?auto_49896 ?auto_49899 ) ) ( not ( = ?auto_49896 ?auto_49900 ) ) ( not ( = ?auto_49896 ?auto_49901 ) ) ( not ( = ?auto_49896 ?auto_49902 ) ) ( not ( = ?auto_49896 ?auto_49903 ) ) ( not ( = ?auto_49897 ?auto_49898 ) ) ( not ( = ?auto_49897 ?auto_49899 ) ) ( not ( = ?auto_49897 ?auto_49900 ) ) ( not ( = ?auto_49897 ?auto_49901 ) ) ( not ( = ?auto_49897 ?auto_49902 ) ) ( not ( = ?auto_49897 ?auto_49903 ) ) ( not ( = ?auto_49898 ?auto_49899 ) ) ( not ( = ?auto_49898 ?auto_49900 ) ) ( not ( = ?auto_49898 ?auto_49901 ) ) ( not ( = ?auto_49898 ?auto_49902 ) ) ( not ( = ?auto_49898 ?auto_49903 ) ) ( not ( = ?auto_49899 ?auto_49900 ) ) ( not ( = ?auto_49899 ?auto_49901 ) ) ( not ( = ?auto_49899 ?auto_49902 ) ) ( not ( = ?auto_49899 ?auto_49903 ) ) ( not ( = ?auto_49900 ?auto_49901 ) ) ( not ( = ?auto_49900 ?auto_49902 ) ) ( not ( = ?auto_49900 ?auto_49903 ) ) ( not ( = ?auto_49901 ?auto_49902 ) ) ( not ( = ?auto_49901 ?auto_49903 ) ) ( not ( = ?auto_49902 ?auto_49903 ) ) ( ON ?auto_49902 ?auto_49903 ) ( ON ?auto_49901 ?auto_49902 ) ( ON ?auto_49900 ?auto_49901 ) ( ON ?auto_49899 ?auto_49900 ) ( ON ?auto_49898 ?auto_49899 ) ( ON ?auto_49897 ?auto_49898 ) ( CLEAR ?auto_49895 ) ( ON ?auto_49896 ?auto_49897 ) ( CLEAR ?auto_49896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49895 ?auto_49896 )
      ( MAKE-9PILE ?auto_49895 ?auto_49896 ?auto_49897 ?auto_49898 ?auto_49899 ?auto_49900 ?auto_49901 ?auto_49902 ?auto_49903 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49913 - BLOCK
      ?auto_49914 - BLOCK
      ?auto_49915 - BLOCK
      ?auto_49916 - BLOCK
      ?auto_49917 - BLOCK
      ?auto_49918 - BLOCK
      ?auto_49919 - BLOCK
      ?auto_49920 - BLOCK
      ?auto_49921 - BLOCK
    )
    :vars
    (
      ?auto_49922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49921 ?auto_49922 ) ( not ( = ?auto_49913 ?auto_49914 ) ) ( not ( = ?auto_49913 ?auto_49915 ) ) ( not ( = ?auto_49913 ?auto_49916 ) ) ( not ( = ?auto_49913 ?auto_49917 ) ) ( not ( = ?auto_49913 ?auto_49918 ) ) ( not ( = ?auto_49913 ?auto_49919 ) ) ( not ( = ?auto_49913 ?auto_49920 ) ) ( not ( = ?auto_49913 ?auto_49921 ) ) ( not ( = ?auto_49913 ?auto_49922 ) ) ( not ( = ?auto_49914 ?auto_49915 ) ) ( not ( = ?auto_49914 ?auto_49916 ) ) ( not ( = ?auto_49914 ?auto_49917 ) ) ( not ( = ?auto_49914 ?auto_49918 ) ) ( not ( = ?auto_49914 ?auto_49919 ) ) ( not ( = ?auto_49914 ?auto_49920 ) ) ( not ( = ?auto_49914 ?auto_49921 ) ) ( not ( = ?auto_49914 ?auto_49922 ) ) ( not ( = ?auto_49915 ?auto_49916 ) ) ( not ( = ?auto_49915 ?auto_49917 ) ) ( not ( = ?auto_49915 ?auto_49918 ) ) ( not ( = ?auto_49915 ?auto_49919 ) ) ( not ( = ?auto_49915 ?auto_49920 ) ) ( not ( = ?auto_49915 ?auto_49921 ) ) ( not ( = ?auto_49915 ?auto_49922 ) ) ( not ( = ?auto_49916 ?auto_49917 ) ) ( not ( = ?auto_49916 ?auto_49918 ) ) ( not ( = ?auto_49916 ?auto_49919 ) ) ( not ( = ?auto_49916 ?auto_49920 ) ) ( not ( = ?auto_49916 ?auto_49921 ) ) ( not ( = ?auto_49916 ?auto_49922 ) ) ( not ( = ?auto_49917 ?auto_49918 ) ) ( not ( = ?auto_49917 ?auto_49919 ) ) ( not ( = ?auto_49917 ?auto_49920 ) ) ( not ( = ?auto_49917 ?auto_49921 ) ) ( not ( = ?auto_49917 ?auto_49922 ) ) ( not ( = ?auto_49918 ?auto_49919 ) ) ( not ( = ?auto_49918 ?auto_49920 ) ) ( not ( = ?auto_49918 ?auto_49921 ) ) ( not ( = ?auto_49918 ?auto_49922 ) ) ( not ( = ?auto_49919 ?auto_49920 ) ) ( not ( = ?auto_49919 ?auto_49921 ) ) ( not ( = ?auto_49919 ?auto_49922 ) ) ( not ( = ?auto_49920 ?auto_49921 ) ) ( not ( = ?auto_49920 ?auto_49922 ) ) ( not ( = ?auto_49921 ?auto_49922 ) ) ( ON ?auto_49920 ?auto_49921 ) ( ON ?auto_49919 ?auto_49920 ) ( ON ?auto_49918 ?auto_49919 ) ( ON ?auto_49917 ?auto_49918 ) ( ON ?auto_49916 ?auto_49917 ) ( ON ?auto_49915 ?auto_49916 ) ( ON ?auto_49914 ?auto_49915 ) ( ON ?auto_49913 ?auto_49914 ) ( CLEAR ?auto_49913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49913 )
      ( MAKE-9PILE ?auto_49913 ?auto_49914 ?auto_49915 ?auto_49916 ?auto_49917 ?auto_49918 ?auto_49919 ?auto_49920 ?auto_49921 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49932 - BLOCK
      ?auto_49933 - BLOCK
      ?auto_49934 - BLOCK
      ?auto_49935 - BLOCK
      ?auto_49936 - BLOCK
      ?auto_49937 - BLOCK
      ?auto_49938 - BLOCK
      ?auto_49939 - BLOCK
      ?auto_49940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49940 ) ( not ( = ?auto_49932 ?auto_49933 ) ) ( not ( = ?auto_49932 ?auto_49934 ) ) ( not ( = ?auto_49932 ?auto_49935 ) ) ( not ( = ?auto_49932 ?auto_49936 ) ) ( not ( = ?auto_49932 ?auto_49937 ) ) ( not ( = ?auto_49932 ?auto_49938 ) ) ( not ( = ?auto_49932 ?auto_49939 ) ) ( not ( = ?auto_49932 ?auto_49940 ) ) ( not ( = ?auto_49933 ?auto_49934 ) ) ( not ( = ?auto_49933 ?auto_49935 ) ) ( not ( = ?auto_49933 ?auto_49936 ) ) ( not ( = ?auto_49933 ?auto_49937 ) ) ( not ( = ?auto_49933 ?auto_49938 ) ) ( not ( = ?auto_49933 ?auto_49939 ) ) ( not ( = ?auto_49933 ?auto_49940 ) ) ( not ( = ?auto_49934 ?auto_49935 ) ) ( not ( = ?auto_49934 ?auto_49936 ) ) ( not ( = ?auto_49934 ?auto_49937 ) ) ( not ( = ?auto_49934 ?auto_49938 ) ) ( not ( = ?auto_49934 ?auto_49939 ) ) ( not ( = ?auto_49934 ?auto_49940 ) ) ( not ( = ?auto_49935 ?auto_49936 ) ) ( not ( = ?auto_49935 ?auto_49937 ) ) ( not ( = ?auto_49935 ?auto_49938 ) ) ( not ( = ?auto_49935 ?auto_49939 ) ) ( not ( = ?auto_49935 ?auto_49940 ) ) ( not ( = ?auto_49936 ?auto_49937 ) ) ( not ( = ?auto_49936 ?auto_49938 ) ) ( not ( = ?auto_49936 ?auto_49939 ) ) ( not ( = ?auto_49936 ?auto_49940 ) ) ( not ( = ?auto_49937 ?auto_49938 ) ) ( not ( = ?auto_49937 ?auto_49939 ) ) ( not ( = ?auto_49937 ?auto_49940 ) ) ( not ( = ?auto_49938 ?auto_49939 ) ) ( not ( = ?auto_49938 ?auto_49940 ) ) ( not ( = ?auto_49939 ?auto_49940 ) ) ( ON ?auto_49939 ?auto_49940 ) ( ON ?auto_49938 ?auto_49939 ) ( ON ?auto_49937 ?auto_49938 ) ( ON ?auto_49936 ?auto_49937 ) ( ON ?auto_49935 ?auto_49936 ) ( ON ?auto_49934 ?auto_49935 ) ( ON ?auto_49933 ?auto_49934 ) ( ON ?auto_49932 ?auto_49933 ) ( CLEAR ?auto_49932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49932 )
      ( MAKE-9PILE ?auto_49932 ?auto_49933 ?auto_49934 ?auto_49935 ?auto_49936 ?auto_49937 ?auto_49938 ?auto_49939 ?auto_49940 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49950 - BLOCK
      ?auto_49951 - BLOCK
      ?auto_49952 - BLOCK
      ?auto_49953 - BLOCK
      ?auto_49954 - BLOCK
      ?auto_49955 - BLOCK
      ?auto_49956 - BLOCK
      ?auto_49957 - BLOCK
      ?auto_49958 - BLOCK
    )
    :vars
    (
      ?auto_49959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49950 ?auto_49951 ) ) ( not ( = ?auto_49950 ?auto_49952 ) ) ( not ( = ?auto_49950 ?auto_49953 ) ) ( not ( = ?auto_49950 ?auto_49954 ) ) ( not ( = ?auto_49950 ?auto_49955 ) ) ( not ( = ?auto_49950 ?auto_49956 ) ) ( not ( = ?auto_49950 ?auto_49957 ) ) ( not ( = ?auto_49950 ?auto_49958 ) ) ( not ( = ?auto_49951 ?auto_49952 ) ) ( not ( = ?auto_49951 ?auto_49953 ) ) ( not ( = ?auto_49951 ?auto_49954 ) ) ( not ( = ?auto_49951 ?auto_49955 ) ) ( not ( = ?auto_49951 ?auto_49956 ) ) ( not ( = ?auto_49951 ?auto_49957 ) ) ( not ( = ?auto_49951 ?auto_49958 ) ) ( not ( = ?auto_49952 ?auto_49953 ) ) ( not ( = ?auto_49952 ?auto_49954 ) ) ( not ( = ?auto_49952 ?auto_49955 ) ) ( not ( = ?auto_49952 ?auto_49956 ) ) ( not ( = ?auto_49952 ?auto_49957 ) ) ( not ( = ?auto_49952 ?auto_49958 ) ) ( not ( = ?auto_49953 ?auto_49954 ) ) ( not ( = ?auto_49953 ?auto_49955 ) ) ( not ( = ?auto_49953 ?auto_49956 ) ) ( not ( = ?auto_49953 ?auto_49957 ) ) ( not ( = ?auto_49953 ?auto_49958 ) ) ( not ( = ?auto_49954 ?auto_49955 ) ) ( not ( = ?auto_49954 ?auto_49956 ) ) ( not ( = ?auto_49954 ?auto_49957 ) ) ( not ( = ?auto_49954 ?auto_49958 ) ) ( not ( = ?auto_49955 ?auto_49956 ) ) ( not ( = ?auto_49955 ?auto_49957 ) ) ( not ( = ?auto_49955 ?auto_49958 ) ) ( not ( = ?auto_49956 ?auto_49957 ) ) ( not ( = ?auto_49956 ?auto_49958 ) ) ( not ( = ?auto_49957 ?auto_49958 ) ) ( ON ?auto_49950 ?auto_49959 ) ( not ( = ?auto_49958 ?auto_49959 ) ) ( not ( = ?auto_49957 ?auto_49959 ) ) ( not ( = ?auto_49956 ?auto_49959 ) ) ( not ( = ?auto_49955 ?auto_49959 ) ) ( not ( = ?auto_49954 ?auto_49959 ) ) ( not ( = ?auto_49953 ?auto_49959 ) ) ( not ( = ?auto_49952 ?auto_49959 ) ) ( not ( = ?auto_49951 ?auto_49959 ) ) ( not ( = ?auto_49950 ?auto_49959 ) ) ( ON ?auto_49951 ?auto_49950 ) ( ON ?auto_49952 ?auto_49951 ) ( ON ?auto_49953 ?auto_49952 ) ( ON ?auto_49954 ?auto_49953 ) ( ON ?auto_49955 ?auto_49954 ) ( ON ?auto_49956 ?auto_49955 ) ( ON ?auto_49957 ?auto_49956 ) ( ON ?auto_49958 ?auto_49957 ) ( CLEAR ?auto_49958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_49958 ?auto_49957 ?auto_49956 ?auto_49955 ?auto_49954 ?auto_49953 ?auto_49952 ?auto_49951 ?auto_49950 )
      ( MAKE-9PILE ?auto_49950 ?auto_49951 ?auto_49952 ?auto_49953 ?auto_49954 ?auto_49955 ?auto_49956 ?auto_49957 ?auto_49958 ) )
  )

)

