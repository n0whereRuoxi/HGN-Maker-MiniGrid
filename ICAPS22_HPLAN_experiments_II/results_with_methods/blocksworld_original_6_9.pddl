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
      ?auto_55737 - BLOCK
      ?auto_55738 - BLOCK
      ?auto_55739 - BLOCK
      ?auto_55740 - BLOCK
      ?auto_55741 - BLOCK
      ?auto_55742 - BLOCK
    )
    :vars
    (
      ?auto_55743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55743 ?auto_55742 ) ( CLEAR ?auto_55743 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55737 ) ( ON ?auto_55738 ?auto_55737 ) ( ON ?auto_55739 ?auto_55738 ) ( ON ?auto_55740 ?auto_55739 ) ( ON ?auto_55741 ?auto_55740 ) ( ON ?auto_55742 ?auto_55741 ) ( not ( = ?auto_55737 ?auto_55738 ) ) ( not ( = ?auto_55737 ?auto_55739 ) ) ( not ( = ?auto_55737 ?auto_55740 ) ) ( not ( = ?auto_55737 ?auto_55741 ) ) ( not ( = ?auto_55737 ?auto_55742 ) ) ( not ( = ?auto_55737 ?auto_55743 ) ) ( not ( = ?auto_55738 ?auto_55739 ) ) ( not ( = ?auto_55738 ?auto_55740 ) ) ( not ( = ?auto_55738 ?auto_55741 ) ) ( not ( = ?auto_55738 ?auto_55742 ) ) ( not ( = ?auto_55738 ?auto_55743 ) ) ( not ( = ?auto_55739 ?auto_55740 ) ) ( not ( = ?auto_55739 ?auto_55741 ) ) ( not ( = ?auto_55739 ?auto_55742 ) ) ( not ( = ?auto_55739 ?auto_55743 ) ) ( not ( = ?auto_55740 ?auto_55741 ) ) ( not ( = ?auto_55740 ?auto_55742 ) ) ( not ( = ?auto_55740 ?auto_55743 ) ) ( not ( = ?auto_55741 ?auto_55742 ) ) ( not ( = ?auto_55741 ?auto_55743 ) ) ( not ( = ?auto_55742 ?auto_55743 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55743 ?auto_55742 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55745 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_55745 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_55745 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55746 - BLOCK
    )
    :vars
    (
      ?auto_55747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55746 ?auto_55747 ) ( CLEAR ?auto_55746 ) ( HAND-EMPTY ) ( not ( = ?auto_55746 ?auto_55747 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55746 ?auto_55747 )
      ( MAKE-1PILE ?auto_55746 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55753 - BLOCK
      ?auto_55754 - BLOCK
      ?auto_55755 - BLOCK
      ?auto_55756 - BLOCK
      ?auto_55757 - BLOCK
    )
    :vars
    (
      ?auto_55758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55758 ?auto_55757 ) ( CLEAR ?auto_55758 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55753 ) ( ON ?auto_55754 ?auto_55753 ) ( ON ?auto_55755 ?auto_55754 ) ( ON ?auto_55756 ?auto_55755 ) ( ON ?auto_55757 ?auto_55756 ) ( not ( = ?auto_55753 ?auto_55754 ) ) ( not ( = ?auto_55753 ?auto_55755 ) ) ( not ( = ?auto_55753 ?auto_55756 ) ) ( not ( = ?auto_55753 ?auto_55757 ) ) ( not ( = ?auto_55753 ?auto_55758 ) ) ( not ( = ?auto_55754 ?auto_55755 ) ) ( not ( = ?auto_55754 ?auto_55756 ) ) ( not ( = ?auto_55754 ?auto_55757 ) ) ( not ( = ?auto_55754 ?auto_55758 ) ) ( not ( = ?auto_55755 ?auto_55756 ) ) ( not ( = ?auto_55755 ?auto_55757 ) ) ( not ( = ?auto_55755 ?auto_55758 ) ) ( not ( = ?auto_55756 ?auto_55757 ) ) ( not ( = ?auto_55756 ?auto_55758 ) ) ( not ( = ?auto_55757 ?auto_55758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55758 ?auto_55757 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55759 - BLOCK
      ?auto_55760 - BLOCK
      ?auto_55761 - BLOCK
      ?auto_55762 - BLOCK
      ?auto_55763 - BLOCK
    )
    :vars
    (
      ?auto_55764 - BLOCK
      ?auto_55765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55764 ?auto_55763 ) ( CLEAR ?auto_55764 ) ( ON-TABLE ?auto_55759 ) ( ON ?auto_55760 ?auto_55759 ) ( ON ?auto_55761 ?auto_55760 ) ( ON ?auto_55762 ?auto_55761 ) ( ON ?auto_55763 ?auto_55762 ) ( not ( = ?auto_55759 ?auto_55760 ) ) ( not ( = ?auto_55759 ?auto_55761 ) ) ( not ( = ?auto_55759 ?auto_55762 ) ) ( not ( = ?auto_55759 ?auto_55763 ) ) ( not ( = ?auto_55759 ?auto_55764 ) ) ( not ( = ?auto_55760 ?auto_55761 ) ) ( not ( = ?auto_55760 ?auto_55762 ) ) ( not ( = ?auto_55760 ?auto_55763 ) ) ( not ( = ?auto_55760 ?auto_55764 ) ) ( not ( = ?auto_55761 ?auto_55762 ) ) ( not ( = ?auto_55761 ?auto_55763 ) ) ( not ( = ?auto_55761 ?auto_55764 ) ) ( not ( = ?auto_55762 ?auto_55763 ) ) ( not ( = ?auto_55762 ?auto_55764 ) ) ( not ( = ?auto_55763 ?auto_55764 ) ) ( HOLDING ?auto_55765 ) ( not ( = ?auto_55759 ?auto_55765 ) ) ( not ( = ?auto_55760 ?auto_55765 ) ) ( not ( = ?auto_55761 ?auto_55765 ) ) ( not ( = ?auto_55762 ?auto_55765 ) ) ( not ( = ?auto_55763 ?auto_55765 ) ) ( not ( = ?auto_55764 ?auto_55765 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_55765 )
      ( MAKE-5PILE ?auto_55759 ?auto_55760 ?auto_55761 ?auto_55762 ?auto_55763 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55766 - BLOCK
      ?auto_55767 - BLOCK
      ?auto_55768 - BLOCK
      ?auto_55769 - BLOCK
      ?auto_55770 - BLOCK
    )
    :vars
    (
      ?auto_55771 - BLOCK
      ?auto_55772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55771 ?auto_55770 ) ( ON-TABLE ?auto_55766 ) ( ON ?auto_55767 ?auto_55766 ) ( ON ?auto_55768 ?auto_55767 ) ( ON ?auto_55769 ?auto_55768 ) ( ON ?auto_55770 ?auto_55769 ) ( not ( = ?auto_55766 ?auto_55767 ) ) ( not ( = ?auto_55766 ?auto_55768 ) ) ( not ( = ?auto_55766 ?auto_55769 ) ) ( not ( = ?auto_55766 ?auto_55770 ) ) ( not ( = ?auto_55766 ?auto_55771 ) ) ( not ( = ?auto_55767 ?auto_55768 ) ) ( not ( = ?auto_55767 ?auto_55769 ) ) ( not ( = ?auto_55767 ?auto_55770 ) ) ( not ( = ?auto_55767 ?auto_55771 ) ) ( not ( = ?auto_55768 ?auto_55769 ) ) ( not ( = ?auto_55768 ?auto_55770 ) ) ( not ( = ?auto_55768 ?auto_55771 ) ) ( not ( = ?auto_55769 ?auto_55770 ) ) ( not ( = ?auto_55769 ?auto_55771 ) ) ( not ( = ?auto_55770 ?auto_55771 ) ) ( not ( = ?auto_55766 ?auto_55772 ) ) ( not ( = ?auto_55767 ?auto_55772 ) ) ( not ( = ?auto_55768 ?auto_55772 ) ) ( not ( = ?auto_55769 ?auto_55772 ) ) ( not ( = ?auto_55770 ?auto_55772 ) ) ( not ( = ?auto_55771 ?auto_55772 ) ) ( ON ?auto_55772 ?auto_55771 ) ( CLEAR ?auto_55772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55766 ?auto_55767 ?auto_55768 ?auto_55769 ?auto_55770 ?auto_55771 )
      ( MAKE-5PILE ?auto_55766 ?auto_55767 ?auto_55768 ?auto_55769 ?auto_55770 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55775 - BLOCK
      ?auto_55776 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_55776 ) ( CLEAR ?auto_55775 ) ( ON-TABLE ?auto_55775 ) ( not ( = ?auto_55775 ?auto_55776 ) ) )
    :subtasks
    ( ( !STACK ?auto_55776 ?auto_55775 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55777 - BLOCK
      ?auto_55778 - BLOCK
    )
    :vars
    (
      ?auto_55779 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55777 ) ( ON-TABLE ?auto_55777 ) ( not ( = ?auto_55777 ?auto_55778 ) ) ( ON ?auto_55778 ?auto_55779 ) ( CLEAR ?auto_55778 ) ( HAND-EMPTY ) ( not ( = ?auto_55777 ?auto_55779 ) ) ( not ( = ?auto_55778 ?auto_55779 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55778 ?auto_55779 )
      ( MAKE-2PILE ?auto_55777 ?auto_55778 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55780 - BLOCK
      ?auto_55781 - BLOCK
    )
    :vars
    (
      ?auto_55782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55780 ?auto_55781 ) ) ( ON ?auto_55781 ?auto_55782 ) ( CLEAR ?auto_55781 ) ( not ( = ?auto_55780 ?auto_55782 ) ) ( not ( = ?auto_55781 ?auto_55782 ) ) ( HOLDING ?auto_55780 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55780 )
      ( MAKE-2PILE ?auto_55780 ?auto_55781 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55783 - BLOCK
      ?auto_55784 - BLOCK
    )
    :vars
    (
      ?auto_55785 - BLOCK
      ?auto_55786 - BLOCK
      ?auto_55788 - BLOCK
      ?auto_55787 - BLOCK
      ?auto_55789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55783 ?auto_55784 ) ) ( ON ?auto_55784 ?auto_55785 ) ( not ( = ?auto_55783 ?auto_55785 ) ) ( not ( = ?auto_55784 ?auto_55785 ) ) ( ON ?auto_55783 ?auto_55784 ) ( CLEAR ?auto_55783 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55786 ) ( ON ?auto_55788 ?auto_55786 ) ( ON ?auto_55787 ?auto_55788 ) ( ON ?auto_55789 ?auto_55787 ) ( ON ?auto_55785 ?auto_55789 ) ( not ( = ?auto_55786 ?auto_55788 ) ) ( not ( = ?auto_55786 ?auto_55787 ) ) ( not ( = ?auto_55786 ?auto_55789 ) ) ( not ( = ?auto_55786 ?auto_55785 ) ) ( not ( = ?auto_55786 ?auto_55784 ) ) ( not ( = ?auto_55786 ?auto_55783 ) ) ( not ( = ?auto_55788 ?auto_55787 ) ) ( not ( = ?auto_55788 ?auto_55789 ) ) ( not ( = ?auto_55788 ?auto_55785 ) ) ( not ( = ?auto_55788 ?auto_55784 ) ) ( not ( = ?auto_55788 ?auto_55783 ) ) ( not ( = ?auto_55787 ?auto_55789 ) ) ( not ( = ?auto_55787 ?auto_55785 ) ) ( not ( = ?auto_55787 ?auto_55784 ) ) ( not ( = ?auto_55787 ?auto_55783 ) ) ( not ( = ?auto_55789 ?auto_55785 ) ) ( not ( = ?auto_55789 ?auto_55784 ) ) ( not ( = ?auto_55789 ?auto_55783 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55786 ?auto_55788 ?auto_55787 ?auto_55789 ?auto_55785 ?auto_55784 )
      ( MAKE-2PILE ?auto_55783 ?auto_55784 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55794 - BLOCK
      ?auto_55795 - BLOCK
      ?auto_55796 - BLOCK
      ?auto_55797 - BLOCK
    )
    :vars
    (
      ?auto_55798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55798 ?auto_55797 ) ( CLEAR ?auto_55798 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55794 ) ( ON ?auto_55795 ?auto_55794 ) ( ON ?auto_55796 ?auto_55795 ) ( ON ?auto_55797 ?auto_55796 ) ( not ( = ?auto_55794 ?auto_55795 ) ) ( not ( = ?auto_55794 ?auto_55796 ) ) ( not ( = ?auto_55794 ?auto_55797 ) ) ( not ( = ?auto_55794 ?auto_55798 ) ) ( not ( = ?auto_55795 ?auto_55796 ) ) ( not ( = ?auto_55795 ?auto_55797 ) ) ( not ( = ?auto_55795 ?auto_55798 ) ) ( not ( = ?auto_55796 ?auto_55797 ) ) ( not ( = ?auto_55796 ?auto_55798 ) ) ( not ( = ?auto_55797 ?auto_55798 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55798 ?auto_55797 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55799 - BLOCK
      ?auto_55800 - BLOCK
      ?auto_55801 - BLOCK
      ?auto_55802 - BLOCK
    )
    :vars
    (
      ?auto_55803 - BLOCK
      ?auto_55804 - BLOCK
      ?auto_55805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55803 ?auto_55802 ) ( CLEAR ?auto_55803 ) ( ON-TABLE ?auto_55799 ) ( ON ?auto_55800 ?auto_55799 ) ( ON ?auto_55801 ?auto_55800 ) ( ON ?auto_55802 ?auto_55801 ) ( not ( = ?auto_55799 ?auto_55800 ) ) ( not ( = ?auto_55799 ?auto_55801 ) ) ( not ( = ?auto_55799 ?auto_55802 ) ) ( not ( = ?auto_55799 ?auto_55803 ) ) ( not ( = ?auto_55800 ?auto_55801 ) ) ( not ( = ?auto_55800 ?auto_55802 ) ) ( not ( = ?auto_55800 ?auto_55803 ) ) ( not ( = ?auto_55801 ?auto_55802 ) ) ( not ( = ?auto_55801 ?auto_55803 ) ) ( not ( = ?auto_55802 ?auto_55803 ) ) ( HOLDING ?auto_55804 ) ( CLEAR ?auto_55805 ) ( not ( = ?auto_55799 ?auto_55804 ) ) ( not ( = ?auto_55799 ?auto_55805 ) ) ( not ( = ?auto_55800 ?auto_55804 ) ) ( not ( = ?auto_55800 ?auto_55805 ) ) ( not ( = ?auto_55801 ?auto_55804 ) ) ( not ( = ?auto_55801 ?auto_55805 ) ) ( not ( = ?auto_55802 ?auto_55804 ) ) ( not ( = ?auto_55802 ?auto_55805 ) ) ( not ( = ?auto_55803 ?auto_55804 ) ) ( not ( = ?auto_55803 ?auto_55805 ) ) ( not ( = ?auto_55804 ?auto_55805 ) ) )
    :subtasks
    ( ( !STACK ?auto_55804 ?auto_55805 )
      ( MAKE-4PILE ?auto_55799 ?auto_55800 ?auto_55801 ?auto_55802 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55806 - BLOCK
      ?auto_55807 - BLOCK
      ?auto_55808 - BLOCK
      ?auto_55809 - BLOCK
    )
    :vars
    (
      ?auto_55811 - BLOCK
      ?auto_55810 - BLOCK
      ?auto_55812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55811 ?auto_55809 ) ( ON-TABLE ?auto_55806 ) ( ON ?auto_55807 ?auto_55806 ) ( ON ?auto_55808 ?auto_55807 ) ( ON ?auto_55809 ?auto_55808 ) ( not ( = ?auto_55806 ?auto_55807 ) ) ( not ( = ?auto_55806 ?auto_55808 ) ) ( not ( = ?auto_55806 ?auto_55809 ) ) ( not ( = ?auto_55806 ?auto_55811 ) ) ( not ( = ?auto_55807 ?auto_55808 ) ) ( not ( = ?auto_55807 ?auto_55809 ) ) ( not ( = ?auto_55807 ?auto_55811 ) ) ( not ( = ?auto_55808 ?auto_55809 ) ) ( not ( = ?auto_55808 ?auto_55811 ) ) ( not ( = ?auto_55809 ?auto_55811 ) ) ( CLEAR ?auto_55810 ) ( not ( = ?auto_55806 ?auto_55812 ) ) ( not ( = ?auto_55806 ?auto_55810 ) ) ( not ( = ?auto_55807 ?auto_55812 ) ) ( not ( = ?auto_55807 ?auto_55810 ) ) ( not ( = ?auto_55808 ?auto_55812 ) ) ( not ( = ?auto_55808 ?auto_55810 ) ) ( not ( = ?auto_55809 ?auto_55812 ) ) ( not ( = ?auto_55809 ?auto_55810 ) ) ( not ( = ?auto_55811 ?auto_55812 ) ) ( not ( = ?auto_55811 ?auto_55810 ) ) ( not ( = ?auto_55812 ?auto_55810 ) ) ( ON ?auto_55812 ?auto_55811 ) ( CLEAR ?auto_55812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55806 ?auto_55807 ?auto_55808 ?auto_55809 ?auto_55811 )
      ( MAKE-4PILE ?auto_55806 ?auto_55807 ?auto_55808 ?auto_55809 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55813 - BLOCK
      ?auto_55814 - BLOCK
      ?auto_55815 - BLOCK
      ?auto_55816 - BLOCK
    )
    :vars
    (
      ?auto_55818 - BLOCK
      ?auto_55817 - BLOCK
      ?auto_55819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55818 ?auto_55816 ) ( ON-TABLE ?auto_55813 ) ( ON ?auto_55814 ?auto_55813 ) ( ON ?auto_55815 ?auto_55814 ) ( ON ?auto_55816 ?auto_55815 ) ( not ( = ?auto_55813 ?auto_55814 ) ) ( not ( = ?auto_55813 ?auto_55815 ) ) ( not ( = ?auto_55813 ?auto_55816 ) ) ( not ( = ?auto_55813 ?auto_55818 ) ) ( not ( = ?auto_55814 ?auto_55815 ) ) ( not ( = ?auto_55814 ?auto_55816 ) ) ( not ( = ?auto_55814 ?auto_55818 ) ) ( not ( = ?auto_55815 ?auto_55816 ) ) ( not ( = ?auto_55815 ?auto_55818 ) ) ( not ( = ?auto_55816 ?auto_55818 ) ) ( not ( = ?auto_55813 ?auto_55817 ) ) ( not ( = ?auto_55813 ?auto_55819 ) ) ( not ( = ?auto_55814 ?auto_55817 ) ) ( not ( = ?auto_55814 ?auto_55819 ) ) ( not ( = ?auto_55815 ?auto_55817 ) ) ( not ( = ?auto_55815 ?auto_55819 ) ) ( not ( = ?auto_55816 ?auto_55817 ) ) ( not ( = ?auto_55816 ?auto_55819 ) ) ( not ( = ?auto_55818 ?auto_55817 ) ) ( not ( = ?auto_55818 ?auto_55819 ) ) ( not ( = ?auto_55817 ?auto_55819 ) ) ( ON ?auto_55817 ?auto_55818 ) ( CLEAR ?auto_55817 ) ( HOLDING ?auto_55819 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55819 )
      ( MAKE-4PILE ?auto_55813 ?auto_55814 ?auto_55815 ?auto_55816 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55820 - BLOCK
      ?auto_55821 - BLOCK
      ?auto_55822 - BLOCK
      ?auto_55823 - BLOCK
    )
    :vars
    (
      ?auto_55826 - BLOCK
      ?auto_55824 - BLOCK
      ?auto_55825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55826 ?auto_55823 ) ( ON-TABLE ?auto_55820 ) ( ON ?auto_55821 ?auto_55820 ) ( ON ?auto_55822 ?auto_55821 ) ( ON ?auto_55823 ?auto_55822 ) ( not ( = ?auto_55820 ?auto_55821 ) ) ( not ( = ?auto_55820 ?auto_55822 ) ) ( not ( = ?auto_55820 ?auto_55823 ) ) ( not ( = ?auto_55820 ?auto_55826 ) ) ( not ( = ?auto_55821 ?auto_55822 ) ) ( not ( = ?auto_55821 ?auto_55823 ) ) ( not ( = ?auto_55821 ?auto_55826 ) ) ( not ( = ?auto_55822 ?auto_55823 ) ) ( not ( = ?auto_55822 ?auto_55826 ) ) ( not ( = ?auto_55823 ?auto_55826 ) ) ( not ( = ?auto_55820 ?auto_55824 ) ) ( not ( = ?auto_55820 ?auto_55825 ) ) ( not ( = ?auto_55821 ?auto_55824 ) ) ( not ( = ?auto_55821 ?auto_55825 ) ) ( not ( = ?auto_55822 ?auto_55824 ) ) ( not ( = ?auto_55822 ?auto_55825 ) ) ( not ( = ?auto_55823 ?auto_55824 ) ) ( not ( = ?auto_55823 ?auto_55825 ) ) ( not ( = ?auto_55826 ?auto_55824 ) ) ( not ( = ?auto_55826 ?auto_55825 ) ) ( not ( = ?auto_55824 ?auto_55825 ) ) ( ON ?auto_55824 ?auto_55826 ) ( ON ?auto_55825 ?auto_55824 ) ( CLEAR ?auto_55825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55820 ?auto_55821 ?auto_55822 ?auto_55823 ?auto_55826 ?auto_55824 )
      ( MAKE-4PILE ?auto_55820 ?auto_55821 ?auto_55822 ?auto_55823 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55830 - BLOCK
      ?auto_55831 - BLOCK
      ?auto_55832 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_55832 ) ( CLEAR ?auto_55831 ) ( ON-TABLE ?auto_55830 ) ( ON ?auto_55831 ?auto_55830 ) ( not ( = ?auto_55830 ?auto_55831 ) ) ( not ( = ?auto_55830 ?auto_55832 ) ) ( not ( = ?auto_55831 ?auto_55832 ) ) )
    :subtasks
    ( ( !STACK ?auto_55832 ?auto_55831 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55833 - BLOCK
      ?auto_55834 - BLOCK
      ?auto_55835 - BLOCK
    )
    :vars
    (
      ?auto_55836 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55834 ) ( ON-TABLE ?auto_55833 ) ( ON ?auto_55834 ?auto_55833 ) ( not ( = ?auto_55833 ?auto_55834 ) ) ( not ( = ?auto_55833 ?auto_55835 ) ) ( not ( = ?auto_55834 ?auto_55835 ) ) ( ON ?auto_55835 ?auto_55836 ) ( CLEAR ?auto_55835 ) ( HAND-EMPTY ) ( not ( = ?auto_55833 ?auto_55836 ) ) ( not ( = ?auto_55834 ?auto_55836 ) ) ( not ( = ?auto_55835 ?auto_55836 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55835 ?auto_55836 )
      ( MAKE-3PILE ?auto_55833 ?auto_55834 ?auto_55835 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55837 - BLOCK
      ?auto_55838 - BLOCK
      ?auto_55839 - BLOCK
    )
    :vars
    (
      ?auto_55840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55837 ) ( not ( = ?auto_55837 ?auto_55838 ) ) ( not ( = ?auto_55837 ?auto_55839 ) ) ( not ( = ?auto_55838 ?auto_55839 ) ) ( ON ?auto_55839 ?auto_55840 ) ( CLEAR ?auto_55839 ) ( not ( = ?auto_55837 ?auto_55840 ) ) ( not ( = ?auto_55838 ?auto_55840 ) ) ( not ( = ?auto_55839 ?auto_55840 ) ) ( HOLDING ?auto_55838 ) ( CLEAR ?auto_55837 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55837 ?auto_55838 )
      ( MAKE-3PILE ?auto_55837 ?auto_55838 ?auto_55839 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55841 - BLOCK
      ?auto_55842 - BLOCK
      ?auto_55843 - BLOCK
    )
    :vars
    (
      ?auto_55844 - BLOCK
      ?auto_55847 - BLOCK
      ?auto_55846 - BLOCK
      ?auto_55845 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55841 ) ( not ( = ?auto_55841 ?auto_55842 ) ) ( not ( = ?auto_55841 ?auto_55843 ) ) ( not ( = ?auto_55842 ?auto_55843 ) ) ( ON ?auto_55843 ?auto_55844 ) ( not ( = ?auto_55841 ?auto_55844 ) ) ( not ( = ?auto_55842 ?auto_55844 ) ) ( not ( = ?auto_55843 ?auto_55844 ) ) ( CLEAR ?auto_55841 ) ( ON ?auto_55842 ?auto_55843 ) ( CLEAR ?auto_55842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55847 ) ( ON ?auto_55846 ?auto_55847 ) ( ON ?auto_55845 ?auto_55846 ) ( ON ?auto_55844 ?auto_55845 ) ( not ( = ?auto_55847 ?auto_55846 ) ) ( not ( = ?auto_55847 ?auto_55845 ) ) ( not ( = ?auto_55847 ?auto_55844 ) ) ( not ( = ?auto_55847 ?auto_55843 ) ) ( not ( = ?auto_55847 ?auto_55842 ) ) ( not ( = ?auto_55846 ?auto_55845 ) ) ( not ( = ?auto_55846 ?auto_55844 ) ) ( not ( = ?auto_55846 ?auto_55843 ) ) ( not ( = ?auto_55846 ?auto_55842 ) ) ( not ( = ?auto_55845 ?auto_55844 ) ) ( not ( = ?auto_55845 ?auto_55843 ) ) ( not ( = ?auto_55845 ?auto_55842 ) ) ( not ( = ?auto_55841 ?auto_55847 ) ) ( not ( = ?auto_55841 ?auto_55846 ) ) ( not ( = ?auto_55841 ?auto_55845 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55847 ?auto_55846 ?auto_55845 ?auto_55844 ?auto_55843 )
      ( MAKE-3PILE ?auto_55841 ?auto_55842 ?auto_55843 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55848 - BLOCK
      ?auto_55849 - BLOCK
      ?auto_55850 - BLOCK
    )
    :vars
    (
      ?auto_55852 - BLOCK
      ?auto_55851 - BLOCK
      ?auto_55854 - BLOCK
      ?auto_55853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55848 ?auto_55849 ) ) ( not ( = ?auto_55848 ?auto_55850 ) ) ( not ( = ?auto_55849 ?auto_55850 ) ) ( ON ?auto_55850 ?auto_55852 ) ( not ( = ?auto_55848 ?auto_55852 ) ) ( not ( = ?auto_55849 ?auto_55852 ) ) ( not ( = ?auto_55850 ?auto_55852 ) ) ( ON ?auto_55849 ?auto_55850 ) ( CLEAR ?auto_55849 ) ( ON-TABLE ?auto_55851 ) ( ON ?auto_55854 ?auto_55851 ) ( ON ?auto_55853 ?auto_55854 ) ( ON ?auto_55852 ?auto_55853 ) ( not ( = ?auto_55851 ?auto_55854 ) ) ( not ( = ?auto_55851 ?auto_55853 ) ) ( not ( = ?auto_55851 ?auto_55852 ) ) ( not ( = ?auto_55851 ?auto_55850 ) ) ( not ( = ?auto_55851 ?auto_55849 ) ) ( not ( = ?auto_55854 ?auto_55853 ) ) ( not ( = ?auto_55854 ?auto_55852 ) ) ( not ( = ?auto_55854 ?auto_55850 ) ) ( not ( = ?auto_55854 ?auto_55849 ) ) ( not ( = ?auto_55853 ?auto_55852 ) ) ( not ( = ?auto_55853 ?auto_55850 ) ) ( not ( = ?auto_55853 ?auto_55849 ) ) ( not ( = ?auto_55848 ?auto_55851 ) ) ( not ( = ?auto_55848 ?auto_55854 ) ) ( not ( = ?auto_55848 ?auto_55853 ) ) ( HOLDING ?auto_55848 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55848 )
      ( MAKE-3PILE ?auto_55848 ?auto_55849 ?auto_55850 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55855 - BLOCK
      ?auto_55856 - BLOCK
      ?auto_55857 - BLOCK
    )
    :vars
    (
      ?auto_55861 - BLOCK
      ?auto_55860 - BLOCK
      ?auto_55858 - BLOCK
      ?auto_55859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55855 ?auto_55856 ) ) ( not ( = ?auto_55855 ?auto_55857 ) ) ( not ( = ?auto_55856 ?auto_55857 ) ) ( ON ?auto_55857 ?auto_55861 ) ( not ( = ?auto_55855 ?auto_55861 ) ) ( not ( = ?auto_55856 ?auto_55861 ) ) ( not ( = ?auto_55857 ?auto_55861 ) ) ( ON ?auto_55856 ?auto_55857 ) ( ON-TABLE ?auto_55860 ) ( ON ?auto_55858 ?auto_55860 ) ( ON ?auto_55859 ?auto_55858 ) ( ON ?auto_55861 ?auto_55859 ) ( not ( = ?auto_55860 ?auto_55858 ) ) ( not ( = ?auto_55860 ?auto_55859 ) ) ( not ( = ?auto_55860 ?auto_55861 ) ) ( not ( = ?auto_55860 ?auto_55857 ) ) ( not ( = ?auto_55860 ?auto_55856 ) ) ( not ( = ?auto_55858 ?auto_55859 ) ) ( not ( = ?auto_55858 ?auto_55861 ) ) ( not ( = ?auto_55858 ?auto_55857 ) ) ( not ( = ?auto_55858 ?auto_55856 ) ) ( not ( = ?auto_55859 ?auto_55861 ) ) ( not ( = ?auto_55859 ?auto_55857 ) ) ( not ( = ?auto_55859 ?auto_55856 ) ) ( not ( = ?auto_55855 ?auto_55860 ) ) ( not ( = ?auto_55855 ?auto_55858 ) ) ( not ( = ?auto_55855 ?auto_55859 ) ) ( ON ?auto_55855 ?auto_55856 ) ( CLEAR ?auto_55855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55860 ?auto_55858 ?auto_55859 ?auto_55861 ?auto_55857 ?auto_55856 )
      ( MAKE-3PILE ?auto_55855 ?auto_55856 ?auto_55857 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55865 - BLOCK
      ?auto_55866 - BLOCK
      ?auto_55867 - BLOCK
    )
    :vars
    (
      ?auto_55868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55868 ?auto_55867 ) ( CLEAR ?auto_55868 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55865 ) ( ON ?auto_55866 ?auto_55865 ) ( ON ?auto_55867 ?auto_55866 ) ( not ( = ?auto_55865 ?auto_55866 ) ) ( not ( = ?auto_55865 ?auto_55867 ) ) ( not ( = ?auto_55865 ?auto_55868 ) ) ( not ( = ?auto_55866 ?auto_55867 ) ) ( not ( = ?auto_55866 ?auto_55868 ) ) ( not ( = ?auto_55867 ?auto_55868 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55868 ?auto_55867 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55869 - BLOCK
      ?auto_55870 - BLOCK
      ?auto_55871 - BLOCK
    )
    :vars
    (
      ?auto_55872 - BLOCK
      ?auto_55873 - BLOCK
      ?auto_55874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55872 ?auto_55871 ) ( CLEAR ?auto_55872 ) ( ON-TABLE ?auto_55869 ) ( ON ?auto_55870 ?auto_55869 ) ( ON ?auto_55871 ?auto_55870 ) ( not ( = ?auto_55869 ?auto_55870 ) ) ( not ( = ?auto_55869 ?auto_55871 ) ) ( not ( = ?auto_55869 ?auto_55872 ) ) ( not ( = ?auto_55870 ?auto_55871 ) ) ( not ( = ?auto_55870 ?auto_55872 ) ) ( not ( = ?auto_55871 ?auto_55872 ) ) ( HOLDING ?auto_55873 ) ( CLEAR ?auto_55874 ) ( not ( = ?auto_55869 ?auto_55873 ) ) ( not ( = ?auto_55869 ?auto_55874 ) ) ( not ( = ?auto_55870 ?auto_55873 ) ) ( not ( = ?auto_55870 ?auto_55874 ) ) ( not ( = ?auto_55871 ?auto_55873 ) ) ( not ( = ?auto_55871 ?auto_55874 ) ) ( not ( = ?auto_55872 ?auto_55873 ) ) ( not ( = ?auto_55872 ?auto_55874 ) ) ( not ( = ?auto_55873 ?auto_55874 ) ) )
    :subtasks
    ( ( !STACK ?auto_55873 ?auto_55874 )
      ( MAKE-3PILE ?auto_55869 ?auto_55870 ?auto_55871 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55875 - BLOCK
      ?auto_55876 - BLOCK
      ?auto_55877 - BLOCK
    )
    :vars
    (
      ?auto_55878 - BLOCK
      ?auto_55879 - BLOCK
      ?auto_55880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55878 ?auto_55877 ) ( ON-TABLE ?auto_55875 ) ( ON ?auto_55876 ?auto_55875 ) ( ON ?auto_55877 ?auto_55876 ) ( not ( = ?auto_55875 ?auto_55876 ) ) ( not ( = ?auto_55875 ?auto_55877 ) ) ( not ( = ?auto_55875 ?auto_55878 ) ) ( not ( = ?auto_55876 ?auto_55877 ) ) ( not ( = ?auto_55876 ?auto_55878 ) ) ( not ( = ?auto_55877 ?auto_55878 ) ) ( CLEAR ?auto_55879 ) ( not ( = ?auto_55875 ?auto_55880 ) ) ( not ( = ?auto_55875 ?auto_55879 ) ) ( not ( = ?auto_55876 ?auto_55880 ) ) ( not ( = ?auto_55876 ?auto_55879 ) ) ( not ( = ?auto_55877 ?auto_55880 ) ) ( not ( = ?auto_55877 ?auto_55879 ) ) ( not ( = ?auto_55878 ?auto_55880 ) ) ( not ( = ?auto_55878 ?auto_55879 ) ) ( not ( = ?auto_55880 ?auto_55879 ) ) ( ON ?auto_55880 ?auto_55878 ) ( CLEAR ?auto_55880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55875 ?auto_55876 ?auto_55877 ?auto_55878 )
      ( MAKE-3PILE ?auto_55875 ?auto_55876 ?auto_55877 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55881 - BLOCK
      ?auto_55882 - BLOCK
      ?auto_55883 - BLOCK
    )
    :vars
    (
      ?auto_55884 - BLOCK
      ?auto_55886 - BLOCK
      ?auto_55885 - BLOCK
      ?auto_55887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55884 ?auto_55883 ) ( ON-TABLE ?auto_55881 ) ( ON ?auto_55882 ?auto_55881 ) ( ON ?auto_55883 ?auto_55882 ) ( not ( = ?auto_55881 ?auto_55882 ) ) ( not ( = ?auto_55881 ?auto_55883 ) ) ( not ( = ?auto_55881 ?auto_55884 ) ) ( not ( = ?auto_55882 ?auto_55883 ) ) ( not ( = ?auto_55882 ?auto_55884 ) ) ( not ( = ?auto_55883 ?auto_55884 ) ) ( not ( = ?auto_55881 ?auto_55886 ) ) ( not ( = ?auto_55881 ?auto_55885 ) ) ( not ( = ?auto_55882 ?auto_55886 ) ) ( not ( = ?auto_55882 ?auto_55885 ) ) ( not ( = ?auto_55883 ?auto_55886 ) ) ( not ( = ?auto_55883 ?auto_55885 ) ) ( not ( = ?auto_55884 ?auto_55886 ) ) ( not ( = ?auto_55884 ?auto_55885 ) ) ( not ( = ?auto_55886 ?auto_55885 ) ) ( ON ?auto_55886 ?auto_55884 ) ( CLEAR ?auto_55886 ) ( HOLDING ?auto_55885 ) ( CLEAR ?auto_55887 ) ( ON-TABLE ?auto_55887 ) ( not ( = ?auto_55887 ?auto_55885 ) ) ( not ( = ?auto_55881 ?auto_55887 ) ) ( not ( = ?auto_55882 ?auto_55887 ) ) ( not ( = ?auto_55883 ?auto_55887 ) ) ( not ( = ?auto_55884 ?auto_55887 ) ) ( not ( = ?auto_55886 ?auto_55887 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55887 ?auto_55885 )
      ( MAKE-3PILE ?auto_55881 ?auto_55882 ?auto_55883 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55888 - BLOCK
      ?auto_55889 - BLOCK
      ?auto_55890 - BLOCK
    )
    :vars
    (
      ?auto_55894 - BLOCK
      ?auto_55891 - BLOCK
      ?auto_55892 - BLOCK
      ?auto_55893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55894 ?auto_55890 ) ( ON-TABLE ?auto_55888 ) ( ON ?auto_55889 ?auto_55888 ) ( ON ?auto_55890 ?auto_55889 ) ( not ( = ?auto_55888 ?auto_55889 ) ) ( not ( = ?auto_55888 ?auto_55890 ) ) ( not ( = ?auto_55888 ?auto_55894 ) ) ( not ( = ?auto_55889 ?auto_55890 ) ) ( not ( = ?auto_55889 ?auto_55894 ) ) ( not ( = ?auto_55890 ?auto_55894 ) ) ( not ( = ?auto_55888 ?auto_55891 ) ) ( not ( = ?auto_55888 ?auto_55892 ) ) ( not ( = ?auto_55889 ?auto_55891 ) ) ( not ( = ?auto_55889 ?auto_55892 ) ) ( not ( = ?auto_55890 ?auto_55891 ) ) ( not ( = ?auto_55890 ?auto_55892 ) ) ( not ( = ?auto_55894 ?auto_55891 ) ) ( not ( = ?auto_55894 ?auto_55892 ) ) ( not ( = ?auto_55891 ?auto_55892 ) ) ( ON ?auto_55891 ?auto_55894 ) ( CLEAR ?auto_55893 ) ( ON-TABLE ?auto_55893 ) ( not ( = ?auto_55893 ?auto_55892 ) ) ( not ( = ?auto_55888 ?auto_55893 ) ) ( not ( = ?auto_55889 ?auto_55893 ) ) ( not ( = ?auto_55890 ?auto_55893 ) ) ( not ( = ?auto_55894 ?auto_55893 ) ) ( not ( = ?auto_55891 ?auto_55893 ) ) ( ON ?auto_55892 ?auto_55891 ) ( CLEAR ?auto_55892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55888 ?auto_55889 ?auto_55890 ?auto_55894 ?auto_55891 )
      ( MAKE-3PILE ?auto_55888 ?auto_55889 ?auto_55890 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55895 - BLOCK
      ?auto_55896 - BLOCK
      ?auto_55897 - BLOCK
    )
    :vars
    (
      ?auto_55900 - BLOCK
      ?auto_55901 - BLOCK
      ?auto_55898 - BLOCK
      ?auto_55899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55900 ?auto_55897 ) ( ON-TABLE ?auto_55895 ) ( ON ?auto_55896 ?auto_55895 ) ( ON ?auto_55897 ?auto_55896 ) ( not ( = ?auto_55895 ?auto_55896 ) ) ( not ( = ?auto_55895 ?auto_55897 ) ) ( not ( = ?auto_55895 ?auto_55900 ) ) ( not ( = ?auto_55896 ?auto_55897 ) ) ( not ( = ?auto_55896 ?auto_55900 ) ) ( not ( = ?auto_55897 ?auto_55900 ) ) ( not ( = ?auto_55895 ?auto_55901 ) ) ( not ( = ?auto_55895 ?auto_55898 ) ) ( not ( = ?auto_55896 ?auto_55901 ) ) ( not ( = ?auto_55896 ?auto_55898 ) ) ( not ( = ?auto_55897 ?auto_55901 ) ) ( not ( = ?auto_55897 ?auto_55898 ) ) ( not ( = ?auto_55900 ?auto_55901 ) ) ( not ( = ?auto_55900 ?auto_55898 ) ) ( not ( = ?auto_55901 ?auto_55898 ) ) ( ON ?auto_55901 ?auto_55900 ) ( not ( = ?auto_55899 ?auto_55898 ) ) ( not ( = ?auto_55895 ?auto_55899 ) ) ( not ( = ?auto_55896 ?auto_55899 ) ) ( not ( = ?auto_55897 ?auto_55899 ) ) ( not ( = ?auto_55900 ?auto_55899 ) ) ( not ( = ?auto_55901 ?auto_55899 ) ) ( ON ?auto_55898 ?auto_55901 ) ( CLEAR ?auto_55898 ) ( HOLDING ?auto_55899 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55899 )
      ( MAKE-3PILE ?auto_55895 ?auto_55896 ?auto_55897 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55902 - BLOCK
      ?auto_55903 - BLOCK
      ?auto_55904 - BLOCK
    )
    :vars
    (
      ?auto_55905 - BLOCK
      ?auto_55908 - BLOCK
      ?auto_55906 - BLOCK
      ?auto_55907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55905 ?auto_55904 ) ( ON-TABLE ?auto_55902 ) ( ON ?auto_55903 ?auto_55902 ) ( ON ?auto_55904 ?auto_55903 ) ( not ( = ?auto_55902 ?auto_55903 ) ) ( not ( = ?auto_55902 ?auto_55904 ) ) ( not ( = ?auto_55902 ?auto_55905 ) ) ( not ( = ?auto_55903 ?auto_55904 ) ) ( not ( = ?auto_55903 ?auto_55905 ) ) ( not ( = ?auto_55904 ?auto_55905 ) ) ( not ( = ?auto_55902 ?auto_55908 ) ) ( not ( = ?auto_55902 ?auto_55906 ) ) ( not ( = ?auto_55903 ?auto_55908 ) ) ( not ( = ?auto_55903 ?auto_55906 ) ) ( not ( = ?auto_55904 ?auto_55908 ) ) ( not ( = ?auto_55904 ?auto_55906 ) ) ( not ( = ?auto_55905 ?auto_55908 ) ) ( not ( = ?auto_55905 ?auto_55906 ) ) ( not ( = ?auto_55908 ?auto_55906 ) ) ( ON ?auto_55908 ?auto_55905 ) ( not ( = ?auto_55907 ?auto_55906 ) ) ( not ( = ?auto_55902 ?auto_55907 ) ) ( not ( = ?auto_55903 ?auto_55907 ) ) ( not ( = ?auto_55904 ?auto_55907 ) ) ( not ( = ?auto_55905 ?auto_55907 ) ) ( not ( = ?auto_55908 ?auto_55907 ) ) ( ON ?auto_55906 ?auto_55908 ) ( ON ?auto_55907 ?auto_55906 ) ( CLEAR ?auto_55907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55902 ?auto_55903 ?auto_55904 ?auto_55905 ?auto_55908 ?auto_55906 )
      ( MAKE-3PILE ?auto_55902 ?auto_55903 ?auto_55904 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55913 - BLOCK
      ?auto_55914 - BLOCK
      ?auto_55915 - BLOCK
      ?auto_55916 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_55916 ) ( CLEAR ?auto_55915 ) ( ON-TABLE ?auto_55913 ) ( ON ?auto_55914 ?auto_55913 ) ( ON ?auto_55915 ?auto_55914 ) ( not ( = ?auto_55913 ?auto_55914 ) ) ( not ( = ?auto_55913 ?auto_55915 ) ) ( not ( = ?auto_55913 ?auto_55916 ) ) ( not ( = ?auto_55914 ?auto_55915 ) ) ( not ( = ?auto_55914 ?auto_55916 ) ) ( not ( = ?auto_55915 ?auto_55916 ) ) )
    :subtasks
    ( ( !STACK ?auto_55916 ?auto_55915 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55917 - BLOCK
      ?auto_55918 - BLOCK
      ?auto_55919 - BLOCK
      ?auto_55920 - BLOCK
    )
    :vars
    (
      ?auto_55921 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55919 ) ( ON-TABLE ?auto_55917 ) ( ON ?auto_55918 ?auto_55917 ) ( ON ?auto_55919 ?auto_55918 ) ( not ( = ?auto_55917 ?auto_55918 ) ) ( not ( = ?auto_55917 ?auto_55919 ) ) ( not ( = ?auto_55917 ?auto_55920 ) ) ( not ( = ?auto_55918 ?auto_55919 ) ) ( not ( = ?auto_55918 ?auto_55920 ) ) ( not ( = ?auto_55919 ?auto_55920 ) ) ( ON ?auto_55920 ?auto_55921 ) ( CLEAR ?auto_55920 ) ( HAND-EMPTY ) ( not ( = ?auto_55917 ?auto_55921 ) ) ( not ( = ?auto_55918 ?auto_55921 ) ) ( not ( = ?auto_55919 ?auto_55921 ) ) ( not ( = ?auto_55920 ?auto_55921 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55920 ?auto_55921 )
      ( MAKE-4PILE ?auto_55917 ?auto_55918 ?auto_55919 ?auto_55920 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55922 - BLOCK
      ?auto_55923 - BLOCK
      ?auto_55924 - BLOCK
      ?auto_55925 - BLOCK
    )
    :vars
    (
      ?auto_55926 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55922 ) ( ON ?auto_55923 ?auto_55922 ) ( not ( = ?auto_55922 ?auto_55923 ) ) ( not ( = ?auto_55922 ?auto_55924 ) ) ( not ( = ?auto_55922 ?auto_55925 ) ) ( not ( = ?auto_55923 ?auto_55924 ) ) ( not ( = ?auto_55923 ?auto_55925 ) ) ( not ( = ?auto_55924 ?auto_55925 ) ) ( ON ?auto_55925 ?auto_55926 ) ( CLEAR ?auto_55925 ) ( not ( = ?auto_55922 ?auto_55926 ) ) ( not ( = ?auto_55923 ?auto_55926 ) ) ( not ( = ?auto_55924 ?auto_55926 ) ) ( not ( = ?auto_55925 ?auto_55926 ) ) ( HOLDING ?auto_55924 ) ( CLEAR ?auto_55923 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55922 ?auto_55923 ?auto_55924 )
      ( MAKE-4PILE ?auto_55922 ?auto_55923 ?auto_55924 ?auto_55925 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55927 - BLOCK
      ?auto_55928 - BLOCK
      ?auto_55929 - BLOCK
      ?auto_55930 - BLOCK
    )
    :vars
    (
      ?auto_55931 - BLOCK
      ?auto_55932 - BLOCK
      ?auto_55933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55927 ) ( ON ?auto_55928 ?auto_55927 ) ( not ( = ?auto_55927 ?auto_55928 ) ) ( not ( = ?auto_55927 ?auto_55929 ) ) ( not ( = ?auto_55927 ?auto_55930 ) ) ( not ( = ?auto_55928 ?auto_55929 ) ) ( not ( = ?auto_55928 ?auto_55930 ) ) ( not ( = ?auto_55929 ?auto_55930 ) ) ( ON ?auto_55930 ?auto_55931 ) ( not ( = ?auto_55927 ?auto_55931 ) ) ( not ( = ?auto_55928 ?auto_55931 ) ) ( not ( = ?auto_55929 ?auto_55931 ) ) ( not ( = ?auto_55930 ?auto_55931 ) ) ( CLEAR ?auto_55928 ) ( ON ?auto_55929 ?auto_55930 ) ( CLEAR ?auto_55929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55932 ) ( ON ?auto_55933 ?auto_55932 ) ( ON ?auto_55931 ?auto_55933 ) ( not ( = ?auto_55932 ?auto_55933 ) ) ( not ( = ?auto_55932 ?auto_55931 ) ) ( not ( = ?auto_55932 ?auto_55930 ) ) ( not ( = ?auto_55932 ?auto_55929 ) ) ( not ( = ?auto_55933 ?auto_55931 ) ) ( not ( = ?auto_55933 ?auto_55930 ) ) ( not ( = ?auto_55933 ?auto_55929 ) ) ( not ( = ?auto_55927 ?auto_55932 ) ) ( not ( = ?auto_55927 ?auto_55933 ) ) ( not ( = ?auto_55928 ?auto_55932 ) ) ( not ( = ?auto_55928 ?auto_55933 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55932 ?auto_55933 ?auto_55931 ?auto_55930 )
      ( MAKE-4PILE ?auto_55927 ?auto_55928 ?auto_55929 ?auto_55930 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55934 - BLOCK
      ?auto_55935 - BLOCK
      ?auto_55936 - BLOCK
      ?auto_55937 - BLOCK
    )
    :vars
    (
      ?auto_55939 - BLOCK
      ?auto_55940 - BLOCK
      ?auto_55938 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55934 ) ( not ( = ?auto_55934 ?auto_55935 ) ) ( not ( = ?auto_55934 ?auto_55936 ) ) ( not ( = ?auto_55934 ?auto_55937 ) ) ( not ( = ?auto_55935 ?auto_55936 ) ) ( not ( = ?auto_55935 ?auto_55937 ) ) ( not ( = ?auto_55936 ?auto_55937 ) ) ( ON ?auto_55937 ?auto_55939 ) ( not ( = ?auto_55934 ?auto_55939 ) ) ( not ( = ?auto_55935 ?auto_55939 ) ) ( not ( = ?auto_55936 ?auto_55939 ) ) ( not ( = ?auto_55937 ?auto_55939 ) ) ( ON ?auto_55936 ?auto_55937 ) ( CLEAR ?auto_55936 ) ( ON-TABLE ?auto_55940 ) ( ON ?auto_55938 ?auto_55940 ) ( ON ?auto_55939 ?auto_55938 ) ( not ( = ?auto_55940 ?auto_55938 ) ) ( not ( = ?auto_55940 ?auto_55939 ) ) ( not ( = ?auto_55940 ?auto_55937 ) ) ( not ( = ?auto_55940 ?auto_55936 ) ) ( not ( = ?auto_55938 ?auto_55939 ) ) ( not ( = ?auto_55938 ?auto_55937 ) ) ( not ( = ?auto_55938 ?auto_55936 ) ) ( not ( = ?auto_55934 ?auto_55940 ) ) ( not ( = ?auto_55934 ?auto_55938 ) ) ( not ( = ?auto_55935 ?auto_55940 ) ) ( not ( = ?auto_55935 ?auto_55938 ) ) ( HOLDING ?auto_55935 ) ( CLEAR ?auto_55934 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55934 ?auto_55935 )
      ( MAKE-4PILE ?auto_55934 ?auto_55935 ?auto_55936 ?auto_55937 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55941 - BLOCK
      ?auto_55942 - BLOCK
      ?auto_55943 - BLOCK
      ?auto_55944 - BLOCK
    )
    :vars
    (
      ?auto_55947 - BLOCK
      ?auto_55946 - BLOCK
      ?auto_55945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55941 ) ( not ( = ?auto_55941 ?auto_55942 ) ) ( not ( = ?auto_55941 ?auto_55943 ) ) ( not ( = ?auto_55941 ?auto_55944 ) ) ( not ( = ?auto_55942 ?auto_55943 ) ) ( not ( = ?auto_55942 ?auto_55944 ) ) ( not ( = ?auto_55943 ?auto_55944 ) ) ( ON ?auto_55944 ?auto_55947 ) ( not ( = ?auto_55941 ?auto_55947 ) ) ( not ( = ?auto_55942 ?auto_55947 ) ) ( not ( = ?auto_55943 ?auto_55947 ) ) ( not ( = ?auto_55944 ?auto_55947 ) ) ( ON ?auto_55943 ?auto_55944 ) ( ON-TABLE ?auto_55946 ) ( ON ?auto_55945 ?auto_55946 ) ( ON ?auto_55947 ?auto_55945 ) ( not ( = ?auto_55946 ?auto_55945 ) ) ( not ( = ?auto_55946 ?auto_55947 ) ) ( not ( = ?auto_55946 ?auto_55944 ) ) ( not ( = ?auto_55946 ?auto_55943 ) ) ( not ( = ?auto_55945 ?auto_55947 ) ) ( not ( = ?auto_55945 ?auto_55944 ) ) ( not ( = ?auto_55945 ?auto_55943 ) ) ( not ( = ?auto_55941 ?auto_55946 ) ) ( not ( = ?auto_55941 ?auto_55945 ) ) ( not ( = ?auto_55942 ?auto_55946 ) ) ( not ( = ?auto_55942 ?auto_55945 ) ) ( CLEAR ?auto_55941 ) ( ON ?auto_55942 ?auto_55943 ) ( CLEAR ?auto_55942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55946 ?auto_55945 ?auto_55947 ?auto_55944 ?auto_55943 )
      ( MAKE-4PILE ?auto_55941 ?auto_55942 ?auto_55943 ?auto_55944 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55948 - BLOCK
      ?auto_55949 - BLOCK
      ?auto_55950 - BLOCK
      ?auto_55951 - BLOCK
    )
    :vars
    (
      ?auto_55953 - BLOCK
      ?auto_55954 - BLOCK
      ?auto_55952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55948 ?auto_55949 ) ) ( not ( = ?auto_55948 ?auto_55950 ) ) ( not ( = ?auto_55948 ?auto_55951 ) ) ( not ( = ?auto_55949 ?auto_55950 ) ) ( not ( = ?auto_55949 ?auto_55951 ) ) ( not ( = ?auto_55950 ?auto_55951 ) ) ( ON ?auto_55951 ?auto_55953 ) ( not ( = ?auto_55948 ?auto_55953 ) ) ( not ( = ?auto_55949 ?auto_55953 ) ) ( not ( = ?auto_55950 ?auto_55953 ) ) ( not ( = ?auto_55951 ?auto_55953 ) ) ( ON ?auto_55950 ?auto_55951 ) ( ON-TABLE ?auto_55954 ) ( ON ?auto_55952 ?auto_55954 ) ( ON ?auto_55953 ?auto_55952 ) ( not ( = ?auto_55954 ?auto_55952 ) ) ( not ( = ?auto_55954 ?auto_55953 ) ) ( not ( = ?auto_55954 ?auto_55951 ) ) ( not ( = ?auto_55954 ?auto_55950 ) ) ( not ( = ?auto_55952 ?auto_55953 ) ) ( not ( = ?auto_55952 ?auto_55951 ) ) ( not ( = ?auto_55952 ?auto_55950 ) ) ( not ( = ?auto_55948 ?auto_55954 ) ) ( not ( = ?auto_55948 ?auto_55952 ) ) ( not ( = ?auto_55949 ?auto_55954 ) ) ( not ( = ?auto_55949 ?auto_55952 ) ) ( ON ?auto_55949 ?auto_55950 ) ( CLEAR ?auto_55949 ) ( HOLDING ?auto_55948 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55948 )
      ( MAKE-4PILE ?auto_55948 ?auto_55949 ?auto_55950 ?auto_55951 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55955 - BLOCK
      ?auto_55956 - BLOCK
      ?auto_55957 - BLOCK
      ?auto_55958 - BLOCK
    )
    :vars
    (
      ?auto_55960 - BLOCK
      ?auto_55961 - BLOCK
      ?auto_55959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55955 ?auto_55956 ) ) ( not ( = ?auto_55955 ?auto_55957 ) ) ( not ( = ?auto_55955 ?auto_55958 ) ) ( not ( = ?auto_55956 ?auto_55957 ) ) ( not ( = ?auto_55956 ?auto_55958 ) ) ( not ( = ?auto_55957 ?auto_55958 ) ) ( ON ?auto_55958 ?auto_55960 ) ( not ( = ?auto_55955 ?auto_55960 ) ) ( not ( = ?auto_55956 ?auto_55960 ) ) ( not ( = ?auto_55957 ?auto_55960 ) ) ( not ( = ?auto_55958 ?auto_55960 ) ) ( ON ?auto_55957 ?auto_55958 ) ( ON-TABLE ?auto_55961 ) ( ON ?auto_55959 ?auto_55961 ) ( ON ?auto_55960 ?auto_55959 ) ( not ( = ?auto_55961 ?auto_55959 ) ) ( not ( = ?auto_55961 ?auto_55960 ) ) ( not ( = ?auto_55961 ?auto_55958 ) ) ( not ( = ?auto_55961 ?auto_55957 ) ) ( not ( = ?auto_55959 ?auto_55960 ) ) ( not ( = ?auto_55959 ?auto_55958 ) ) ( not ( = ?auto_55959 ?auto_55957 ) ) ( not ( = ?auto_55955 ?auto_55961 ) ) ( not ( = ?auto_55955 ?auto_55959 ) ) ( not ( = ?auto_55956 ?auto_55961 ) ) ( not ( = ?auto_55956 ?auto_55959 ) ) ( ON ?auto_55956 ?auto_55957 ) ( ON ?auto_55955 ?auto_55956 ) ( CLEAR ?auto_55955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55961 ?auto_55959 ?auto_55960 ?auto_55958 ?auto_55957 ?auto_55956 )
      ( MAKE-4PILE ?auto_55955 ?auto_55956 ?auto_55957 ?auto_55958 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55964 - BLOCK
      ?auto_55965 - BLOCK
    )
    :vars
    (
      ?auto_55966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55966 ?auto_55965 ) ( CLEAR ?auto_55966 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55964 ) ( ON ?auto_55965 ?auto_55964 ) ( not ( = ?auto_55964 ?auto_55965 ) ) ( not ( = ?auto_55964 ?auto_55966 ) ) ( not ( = ?auto_55965 ?auto_55966 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55966 ?auto_55965 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55967 - BLOCK
      ?auto_55968 - BLOCK
    )
    :vars
    (
      ?auto_55969 - BLOCK
      ?auto_55970 - BLOCK
      ?auto_55971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55969 ?auto_55968 ) ( CLEAR ?auto_55969 ) ( ON-TABLE ?auto_55967 ) ( ON ?auto_55968 ?auto_55967 ) ( not ( = ?auto_55967 ?auto_55968 ) ) ( not ( = ?auto_55967 ?auto_55969 ) ) ( not ( = ?auto_55968 ?auto_55969 ) ) ( HOLDING ?auto_55970 ) ( CLEAR ?auto_55971 ) ( not ( = ?auto_55967 ?auto_55970 ) ) ( not ( = ?auto_55967 ?auto_55971 ) ) ( not ( = ?auto_55968 ?auto_55970 ) ) ( not ( = ?auto_55968 ?auto_55971 ) ) ( not ( = ?auto_55969 ?auto_55970 ) ) ( not ( = ?auto_55969 ?auto_55971 ) ) ( not ( = ?auto_55970 ?auto_55971 ) ) )
    :subtasks
    ( ( !STACK ?auto_55970 ?auto_55971 )
      ( MAKE-2PILE ?auto_55967 ?auto_55968 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55972 - BLOCK
      ?auto_55973 - BLOCK
    )
    :vars
    (
      ?auto_55974 - BLOCK
      ?auto_55976 - BLOCK
      ?auto_55975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55974 ?auto_55973 ) ( ON-TABLE ?auto_55972 ) ( ON ?auto_55973 ?auto_55972 ) ( not ( = ?auto_55972 ?auto_55973 ) ) ( not ( = ?auto_55972 ?auto_55974 ) ) ( not ( = ?auto_55973 ?auto_55974 ) ) ( CLEAR ?auto_55976 ) ( not ( = ?auto_55972 ?auto_55975 ) ) ( not ( = ?auto_55972 ?auto_55976 ) ) ( not ( = ?auto_55973 ?auto_55975 ) ) ( not ( = ?auto_55973 ?auto_55976 ) ) ( not ( = ?auto_55974 ?auto_55975 ) ) ( not ( = ?auto_55974 ?auto_55976 ) ) ( not ( = ?auto_55975 ?auto_55976 ) ) ( ON ?auto_55975 ?auto_55974 ) ( CLEAR ?auto_55975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55972 ?auto_55973 ?auto_55974 )
      ( MAKE-2PILE ?auto_55972 ?auto_55973 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55977 - BLOCK
      ?auto_55978 - BLOCK
    )
    :vars
    (
      ?auto_55981 - BLOCK
      ?auto_55980 - BLOCK
      ?auto_55979 - BLOCK
      ?auto_55982 - BLOCK
      ?auto_55983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55981 ?auto_55978 ) ( ON-TABLE ?auto_55977 ) ( ON ?auto_55978 ?auto_55977 ) ( not ( = ?auto_55977 ?auto_55978 ) ) ( not ( = ?auto_55977 ?auto_55981 ) ) ( not ( = ?auto_55978 ?auto_55981 ) ) ( not ( = ?auto_55977 ?auto_55980 ) ) ( not ( = ?auto_55977 ?auto_55979 ) ) ( not ( = ?auto_55978 ?auto_55980 ) ) ( not ( = ?auto_55978 ?auto_55979 ) ) ( not ( = ?auto_55981 ?auto_55980 ) ) ( not ( = ?auto_55981 ?auto_55979 ) ) ( not ( = ?auto_55980 ?auto_55979 ) ) ( ON ?auto_55980 ?auto_55981 ) ( CLEAR ?auto_55980 ) ( HOLDING ?auto_55979 ) ( CLEAR ?auto_55982 ) ( ON-TABLE ?auto_55983 ) ( ON ?auto_55982 ?auto_55983 ) ( not ( = ?auto_55983 ?auto_55982 ) ) ( not ( = ?auto_55983 ?auto_55979 ) ) ( not ( = ?auto_55982 ?auto_55979 ) ) ( not ( = ?auto_55977 ?auto_55982 ) ) ( not ( = ?auto_55977 ?auto_55983 ) ) ( not ( = ?auto_55978 ?auto_55982 ) ) ( not ( = ?auto_55978 ?auto_55983 ) ) ( not ( = ?auto_55981 ?auto_55982 ) ) ( not ( = ?auto_55981 ?auto_55983 ) ) ( not ( = ?auto_55980 ?auto_55982 ) ) ( not ( = ?auto_55980 ?auto_55983 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55983 ?auto_55982 ?auto_55979 )
      ( MAKE-2PILE ?auto_55977 ?auto_55978 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55984 - BLOCK
      ?auto_55985 - BLOCK
    )
    :vars
    (
      ?auto_55988 - BLOCK
      ?auto_55990 - BLOCK
      ?auto_55987 - BLOCK
      ?auto_55986 - BLOCK
      ?auto_55989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55988 ?auto_55985 ) ( ON-TABLE ?auto_55984 ) ( ON ?auto_55985 ?auto_55984 ) ( not ( = ?auto_55984 ?auto_55985 ) ) ( not ( = ?auto_55984 ?auto_55988 ) ) ( not ( = ?auto_55985 ?auto_55988 ) ) ( not ( = ?auto_55984 ?auto_55990 ) ) ( not ( = ?auto_55984 ?auto_55987 ) ) ( not ( = ?auto_55985 ?auto_55990 ) ) ( not ( = ?auto_55985 ?auto_55987 ) ) ( not ( = ?auto_55988 ?auto_55990 ) ) ( not ( = ?auto_55988 ?auto_55987 ) ) ( not ( = ?auto_55990 ?auto_55987 ) ) ( ON ?auto_55990 ?auto_55988 ) ( CLEAR ?auto_55986 ) ( ON-TABLE ?auto_55989 ) ( ON ?auto_55986 ?auto_55989 ) ( not ( = ?auto_55989 ?auto_55986 ) ) ( not ( = ?auto_55989 ?auto_55987 ) ) ( not ( = ?auto_55986 ?auto_55987 ) ) ( not ( = ?auto_55984 ?auto_55986 ) ) ( not ( = ?auto_55984 ?auto_55989 ) ) ( not ( = ?auto_55985 ?auto_55986 ) ) ( not ( = ?auto_55985 ?auto_55989 ) ) ( not ( = ?auto_55988 ?auto_55986 ) ) ( not ( = ?auto_55988 ?auto_55989 ) ) ( not ( = ?auto_55990 ?auto_55986 ) ) ( not ( = ?auto_55990 ?auto_55989 ) ) ( ON ?auto_55987 ?auto_55990 ) ( CLEAR ?auto_55987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55984 ?auto_55985 ?auto_55988 ?auto_55990 )
      ( MAKE-2PILE ?auto_55984 ?auto_55985 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55991 - BLOCK
      ?auto_55992 - BLOCK
    )
    :vars
    (
      ?auto_55997 - BLOCK
      ?auto_55996 - BLOCK
      ?auto_55994 - BLOCK
      ?auto_55993 - BLOCK
      ?auto_55995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55997 ?auto_55992 ) ( ON-TABLE ?auto_55991 ) ( ON ?auto_55992 ?auto_55991 ) ( not ( = ?auto_55991 ?auto_55992 ) ) ( not ( = ?auto_55991 ?auto_55997 ) ) ( not ( = ?auto_55992 ?auto_55997 ) ) ( not ( = ?auto_55991 ?auto_55996 ) ) ( not ( = ?auto_55991 ?auto_55994 ) ) ( not ( = ?auto_55992 ?auto_55996 ) ) ( not ( = ?auto_55992 ?auto_55994 ) ) ( not ( = ?auto_55997 ?auto_55996 ) ) ( not ( = ?auto_55997 ?auto_55994 ) ) ( not ( = ?auto_55996 ?auto_55994 ) ) ( ON ?auto_55996 ?auto_55997 ) ( ON-TABLE ?auto_55993 ) ( not ( = ?auto_55993 ?auto_55995 ) ) ( not ( = ?auto_55993 ?auto_55994 ) ) ( not ( = ?auto_55995 ?auto_55994 ) ) ( not ( = ?auto_55991 ?auto_55995 ) ) ( not ( = ?auto_55991 ?auto_55993 ) ) ( not ( = ?auto_55992 ?auto_55995 ) ) ( not ( = ?auto_55992 ?auto_55993 ) ) ( not ( = ?auto_55997 ?auto_55995 ) ) ( not ( = ?auto_55997 ?auto_55993 ) ) ( not ( = ?auto_55996 ?auto_55995 ) ) ( not ( = ?auto_55996 ?auto_55993 ) ) ( ON ?auto_55994 ?auto_55996 ) ( CLEAR ?auto_55994 ) ( HOLDING ?auto_55995 ) ( CLEAR ?auto_55993 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55993 ?auto_55995 )
      ( MAKE-2PILE ?auto_55991 ?auto_55992 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55998 - BLOCK
      ?auto_55999 - BLOCK
    )
    :vars
    (
      ?auto_56002 - BLOCK
      ?auto_56000 - BLOCK
      ?auto_56003 - BLOCK
      ?auto_56004 - BLOCK
      ?auto_56001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56002 ?auto_55999 ) ( ON-TABLE ?auto_55998 ) ( ON ?auto_55999 ?auto_55998 ) ( not ( = ?auto_55998 ?auto_55999 ) ) ( not ( = ?auto_55998 ?auto_56002 ) ) ( not ( = ?auto_55999 ?auto_56002 ) ) ( not ( = ?auto_55998 ?auto_56000 ) ) ( not ( = ?auto_55998 ?auto_56003 ) ) ( not ( = ?auto_55999 ?auto_56000 ) ) ( not ( = ?auto_55999 ?auto_56003 ) ) ( not ( = ?auto_56002 ?auto_56000 ) ) ( not ( = ?auto_56002 ?auto_56003 ) ) ( not ( = ?auto_56000 ?auto_56003 ) ) ( ON ?auto_56000 ?auto_56002 ) ( ON-TABLE ?auto_56004 ) ( not ( = ?auto_56004 ?auto_56001 ) ) ( not ( = ?auto_56004 ?auto_56003 ) ) ( not ( = ?auto_56001 ?auto_56003 ) ) ( not ( = ?auto_55998 ?auto_56001 ) ) ( not ( = ?auto_55998 ?auto_56004 ) ) ( not ( = ?auto_55999 ?auto_56001 ) ) ( not ( = ?auto_55999 ?auto_56004 ) ) ( not ( = ?auto_56002 ?auto_56001 ) ) ( not ( = ?auto_56002 ?auto_56004 ) ) ( not ( = ?auto_56000 ?auto_56001 ) ) ( not ( = ?auto_56000 ?auto_56004 ) ) ( ON ?auto_56003 ?auto_56000 ) ( CLEAR ?auto_56004 ) ( ON ?auto_56001 ?auto_56003 ) ( CLEAR ?auto_56001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55998 ?auto_55999 ?auto_56002 ?auto_56000 ?auto_56003 )
      ( MAKE-2PILE ?auto_55998 ?auto_55999 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56005 - BLOCK
      ?auto_56006 - BLOCK
    )
    :vars
    (
      ?auto_56010 - BLOCK
      ?auto_56007 - BLOCK
      ?auto_56008 - BLOCK
      ?auto_56009 - BLOCK
      ?auto_56011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56010 ?auto_56006 ) ( ON-TABLE ?auto_56005 ) ( ON ?auto_56006 ?auto_56005 ) ( not ( = ?auto_56005 ?auto_56006 ) ) ( not ( = ?auto_56005 ?auto_56010 ) ) ( not ( = ?auto_56006 ?auto_56010 ) ) ( not ( = ?auto_56005 ?auto_56007 ) ) ( not ( = ?auto_56005 ?auto_56008 ) ) ( not ( = ?auto_56006 ?auto_56007 ) ) ( not ( = ?auto_56006 ?auto_56008 ) ) ( not ( = ?auto_56010 ?auto_56007 ) ) ( not ( = ?auto_56010 ?auto_56008 ) ) ( not ( = ?auto_56007 ?auto_56008 ) ) ( ON ?auto_56007 ?auto_56010 ) ( not ( = ?auto_56009 ?auto_56011 ) ) ( not ( = ?auto_56009 ?auto_56008 ) ) ( not ( = ?auto_56011 ?auto_56008 ) ) ( not ( = ?auto_56005 ?auto_56011 ) ) ( not ( = ?auto_56005 ?auto_56009 ) ) ( not ( = ?auto_56006 ?auto_56011 ) ) ( not ( = ?auto_56006 ?auto_56009 ) ) ( not ( = ?auto_56010 ?auto_56011 ) ) ( not ( = ?auto_56010 ?auto_56009 ) ) ( not ( = ?auto_56007 ?auto_56011 ) ) ( not ( = ?auto_56007 ?auto_56009 ) ) ( ON ?auto_56008 ?auto_56007 ) ( ON ?auto_56011 ?auto_56008 ) ( CLEAR ?auto_56011 ) ( HOLDING ?auto_56009 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56009 )
      ( MAKE-2PILE ?auto_56005 ?auto_56006 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56012 - BLOCK
      ?auto_56013 - BLOCK
    )
    :vars
    (
      ?auto_56017 - BLOCK
      ?auto_56016 - BLOCK
      ?auto_56018 - BLOCK
      ?auto_56014 - BLOCK
      ?auto_56015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56017 ?auto_56013 ) ( ON-TABLE ?auto_56012 ) ( ON ?auto_56013 ?auto_56012 ) ( not ( = ?auto_56012 ?auto_56013 ) ) ( not ( = ?auto_56012 ?auto_56017 ) ) ( not ( = ?auto_56013 ?auto_56017 ) ) ( not ( = ?auto_56012 ?auto_56016 ) ) ( not ( = ?auto_56012 ?auto_56018 ) ) ( not ( = ?auto_56013 ?auto_56016 ) ) ( not ( = ?auto_56013 ?auto_56018 ) ) ( not ( = ?auto_56017 ?auto_56016 ) ) ( not ( = ?auto_56017 ?auto_56018 ) ) ( not ( = ?auto_56016 ?auto_56018 ) ) ( ON ?auto_56016 ?auto_56017 ) ( not ( = ?auto_56014 ?auto_56015 ) ) ( not ( = ?auto_56014 ?auto_56018 ) ) ( not ( = ?auto_56015 ?auto_56018 ) ) ( not ( = ?auto_56012 ?auto_56015 ) ) ( not ( = ?auto_56012 ?auto_56014 ) ) ( not ( = ?auto_56013 ?auto_56015 ) ) ( not ( = ?auto_56013 ?auto_56014 ) ) ( not ( = ?auto_56017 ?auto_56015 ) ) ( not ( = ?auto_56017 ?auto_56014 ) ) ( not ( = ?auto_56016 ?auto_56015 ) ) ( not ( = ?auto_56016 ?auto_56014 ) ) ( ON ?auto_56018 ?auto_56016 ) ( ON ?auto_56015 ?auto_56018 ) ( ON ?auto_56014 ?auto_56015 ) ( CLEAR ?auto_56014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56012 ?auto_56013 ?auto_56017 ?auto_56016 ?auto_56018 ?auto_56015 )
      ( MAKE-2PILE ?auto_56012 ?auto_56013 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56024 - BLOCK
      ?auto_56025 - BLOCK
      ?auto_56026 - BLOCK
      ?auto_56027 - BLOCK
      ?auto_56028 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_56028 ) ( CLEAR ?auto_56027 ) ( ON-TABLE ?auto_56024 ) ( ON ?auto_56025 ?auto_56024 ) ( ON ?auto_56026 ?auto_56025 ) ( ON ?auto_56027 ?auto_56026 ) ( not ( = ?auto_56024 ?auto_56025 ) ) ( not ( = ?auto_56024 ?auto_56026 ) ) ( not ( = ?auto_56024 ?auto_56027 ) ) ( not ( = ?auto_56024 ?auto_56028 ) ) ( not ( = ?auto_56025 ?auto_56026 ) ) ( not ( = ?auto_56025 ?auto_56027 ) ) ( not ( = ?auto_56025 ?auto_56028 ) ) ( not ( = ?auto_56026 ?auto_56027 ) ) ( not ( = ?auto_56026 ?auto_56028 ) ) ( not ( = ?auto_56027 ?auto_56028 ) ) )
    :subtasks
    ( ( !STACK ?auto_56028 ?auto_56027 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56029 - BLOCK
      ?auto_56030 - BLOCK
      ?auto_56031 - BLOCK
      ?auto_56032 - BLOCK
      ?auto_56033 - BLOCK
    )
    :vars
    (
      ?auto_56034 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_56032 ) ( ON-TABLE ?auto_56029 ) ( ON ?auto_56030 ?auto_56029 ) ( ON ?auto_56031 ?auto_56030 ) ( ON ?auto_56032 ?auto_56031 ) ( not ( = ?auto_56029 ?auto_56030 ) ) ( not ( = ?auto_56029 ?auto_56031 ) ) ( not ( = ?auto_56029 ?auto_56032 ) ) ( not ( = ?auto_56029 ?auto_56033 ) ) ( not ( = ?auto_56030 ?auto_56031 ) ) ( not ( = ?auto_56030 ?auto_56032 ) ) ( not ( = ?auto_56030 ?auto_56033 ) ) ( not ( = ?auto_56031 ?auto_56032 ) ) ( not ( = ?auto_56031 ?auto_56033 ) ) ( not ( = ?auto_56032 ?auto_56033 ) ) ( ON ?auto_56033 ?auto_56034 ) ( CLEAR ?auto_56033 ) ( HAND-EMPTY ) ( not ( = ?auto_56029 ?auto_56034 ) ) ( not ( = ?auto_56030 ?auto_56034 ) ) ( not ( = ?auto_56031 ?auto_56034 ) ) ( not ( = ?auto_56032 ?auto_56034 ) ) ( not ( = ?auto_56033 ?auto_56034 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56033 ?auto_56034 )
      ( MAKE-5PILE ?auto_56029 ?auto_56030 ?auto_56031 ?auto_56032 ?auto_56033 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56035 - BLOCK
      ?auto_56036 - BLOCK
      ?auto_56037 - BLOCK
      ?auto_56038 - BLOCK
      ?auto_56039 - BLOCK
    )
    :vars
    (
      ?auto_56040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56035 ) ( ON ?auto_56036 ?auto_56035 ) ( ON ?auto_56037 ?auto_56036 ) ( not ( = ?auto_56035 ?auto_56036 ) ) ( not ( = ?auto_56035 ?auto_56037 ) ) ( not ( = ?auto_56035 ?auto_56038 ) ) ( not ( = ?auto_56035 ?auto_56039 ) ) ( not ( = ?auto_56036 ?auto_56037 ) ) ( not ( = ?auto_56036 ?auto_56038 ) ) ( not ( = ?auto_56036 ?auto_56039 ) ) ( not ( = ?auto_56037 ?auto_56038 ) ) ( not ( = ?auto_56037 ?auto_56039 ) ) ( not ( = ?auto_56038 ?auto_56039 ) ) ( ON ?auto_56039 ?auto_56040 ) ( CLEAR ?auto_56039 ) ( not ( = ?auto_56035 ?auto_56040 ) ) ( not ( = ?auto_56036 ?auto_56040 ) ) ( not ( = ?auto_56037 ?auto_56040 ) ) ( not ( = ?auto_56038 ?auto_56040 ) ) ( not ( = ?auto_56039 ?auto_56040 ) ) ( HOLDING ?auto_56038 ) ( CLEAR ?auto_56037 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56035 ?auto_56036 ?auto_56037 ?auto_56038 )
      ( MAKE-5PILE ?auto_56035 ?auto_56036 ?auto_56037 ?auto_56038 ?auto_56039 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56041 - BLOCK
      ?auto_56042 - BLOCK
      ?auto_56043 - BLOCK
      ?auto_56044 - BLOCK
      ?auto_56045 - BLOCK
    )
    :vars
    (
      ?auto_56046 - BLOCK
      ?auto_56047 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56041 ) ( ON ?auto_56042 ?auto_56041 ) ( ON ?auto_56043 ?auto_56042 ) ( not ( = ?auto_56041 ?auto_56042 ) ) ( not ( = ?auto_56041 ?auto_56043 ) ) ( not ( = ?auto_56041 ?auto_56044 ) ) ( not ( = ?auto_56041 ?auto_56045 ) ) ( not ( = ?auto_56042 ?auto_56043 ) ) ( not ( = ?auto_56042 ?auto_56044 ) ) ( not ( = ?auto_56042 ?auto_56045 ) ) ( not ( = ?auto_56043 ?auto_56044 ) ) ( not ( = ?auto_56043 ?auto_56045 ) ) ( not ( = ?auto_56044 ?auto_56045 ) ) ( ON ?auto_56045 ?auto_56046 ) ( not ( = ?auto_56041 ?auto_56046 ) ) ( not ( = ?auto_56042 ?auto_56046 ) ) ( not ( = ?auto_56043 ?auto_56046 ) ) ( not ( = ?auto_56044 ?auto_56046 ) ) ( not ( = ?auto_56045 ?auto_56046 ) ) ( CLEAR ?auto_56043 ) ( ON ?auto_56044 ?auto_56045 ) ( CLEAR ?auto_56044 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56047 ) ( ON ?auto_56046 ?auto_56047 ) ( not ( = ?auto_56047 ?auto_56046 ) ) ( not ( = ?auto_56047 ?auto_56045 ) ) ( not ( = ?auto_56047 ?auto_56044 ) ) ( not ( = ?auto_56041 ?auto_56047 ) ) ( not ( = ?auto_56042 ?auto_56047 ) ) ( not ( = ?auto_56043 ?auto_56047 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56047 ?auto_56046 ?auto_56045 )
      ( MAKE-5PILE ?auto_56041 ?auto_56042 ?auto_56043 ?auto_56044 ?auto_56045 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56048 - BLOCK
      ?auto_56049 - BLOCK
      ?auto_56050 - BLOCK
      ?auto_56051 - BLOCK
      ?auto_56052 - BLOCK
    )
    :vars
    (
      ?auto_56054 - BLOCK
      ?auto_56053 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56048 ) ( ON ?auto_56049 ?auto_56048 ) ( not ( = ?auto_56048 ?auto_56049 ) ) ( not ( = ?auto_56048 ?auto_56050 ) ) ( not ( = ?auto_56048 ?auto_56051 ) ) ( not ( = ?auto_56048 ?auto_56052 ) ) ( not ( = ?auto_56049 ?auto_56050 ) ) ( not ( = ?auto_56049 ?auto_56051 ) ) ( not ( = ?auto_56049 ?auto_56052 ) ) ( not ( = ?auto_56050 ?auto_56051 ) ) ( not ( = ?auto_56050 ?auto_56052 ) ) ( not ( = ?auto_56051 ?auto_56052 ) ) ( ON ?auto_56052 ?auto_56054 ) ( not ( = ?auto_56048 ?auto_56054 ) ) ( not ( = ?auto_56049 ?auto_56054 ) ) ( not ( = ?auto_56050 ?auto_56054 ) ) ( not ( = ?auto_56051 ?auto_56054 ) ) ( not ( = ?auto_56052 ?auto_56054 ) ) ( ON ?auto_56051 ?auto_56052 ) ( CLEAR ?auto_56051 ) ( ON-TABLE ?auto_56053 ) ( ON ?auto_56054 ?auto_56053 ) ( not ( = ?auto_56053 ?auto_56054 ) ) ( not ( = ?auto_56053 ?auto_56052 ) ) ( not ( = ?auto_56053 ?auto_56051 ) ) ( not ( = ?auto_56048 ?auto_56053 ) ) ( not ( = ?auto_56049 ?auto_56053 ) ) ( not ( = ?auto_56050 ?auto_56053 ) ) ( HOLDING ?auto_56050 ) ( CLEAR ?auto_56049 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56048 ?auto_56049 ?auto_56050 )
      ( MAKE-5PILE ?auto_56048 ?auto_56049 ?auto_56050 ?auto_56051 ?auto_56052 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56055 - BLOCK
      ?auto_56056 - BLOCK
      ?auto_56057 - BLOCK
      ?auto_56058 - BLOCK
      ?auto_56059 - BLOCK
    )
    :vars
    (
      ?auto_56060 - BLOCK
      ?auto_56061 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56055 ) ( ON ?auto_56056 ?auto_56055 ) ( not ( = ?auto_56055 ?auto_56056 ) ) ( not ( = ?auto_56055 ?auto_56057 ) ) ( not ( = ?auto_56055 ?auto_56058 ) ) ( not ( = ?auto_56055 ?auto_56059 ) ) ( not ( = ?auto_56056 ?auto_56057 ) ) ( not ( = ?auto_56056 ?auto_56058 ) ) ( not ( = ?auto_56056 ?auto_56059 ) ) ( not ( = ?auto_56057 ?auto_56058 ) ) ( not ( = ?auto_56057 ?auto_56059 ) ) ( not ( = ?auto_56058 ?auto_56059 ) ) ( ON ?auto_56059 ?auto_56060 ) ( not ( = ?auto_56055 ?auto_56060 ) ) ( not ( = ?auto_56056 ?auto_56060 ) ) ( not ( = ?auto_56057 ?auto_56060 ) ) ( not ( = ?auto_56058 ?auto_56060 ) ) ( not ( = ?auto_56059 ?auto_56060 ) ) ( ON ?auto_56058 ?auto_56059 ) ( ON-TABLE ?auto_56061 ) ( ON ?auto_56060 ?auto_56061 ) ( not ( = ?auto_56061 ?auto_56060 ) ) ( not ( = ?auto_56061 ?auto_56059 ) ) ( not ( = ?auto_56061 ?auto_56058 ) ) ( not ( = ?auto_56055 ?auto_56061 ) ) ( not ( = ?auto_56056 ?auto_56061 ) ) ( not ( = ?auto_56057 ?auto_56061 ) ) ( CLEAR ?auto_56056 ) ( ON ?auto_56057 ?auto_56058 ) ( CLEAR ?auto_56057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56061 ?auto_56060 ?auto_56059 ?auto_56058 )
      ( MAKE-5PILE ?auto_56055 ?auto_56056 ?auto_56057 ?auto_56058 ?auto_56059 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56062 - BLOCK
      ?auto_56063 - BLOCK
      ?auto_56064 - BLOCK
      ?auto_56065 - BLOCK
      ?auto_56066 - BLOCK
    )
    :vars
    (
      ?auto_56068 - BLOCK
      ?auto_56067 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56062 ) ( not ( = ?auto_56062 ?auto_56063 ) ) ( not ( = ?auto_56062 ?auto_56064 ) ) ( not ( = ?auto_56062 ?auto_56065 ) ) ( not ( = ?auto_56062 ?auto_56066 ) ) ( not ( = ?auto_56063 ?auto_56064 ) ) ( not ( = ?auto_56063 ?auto_56065 ) ) ( not ( = ?auto_56063 ?auto_56066 ) ) ( not ( = ?auto_56064 ?auto_56065 ) ) ( not ( = ?auto_56064 ?auto_56066 ) ) ( not ( = ?auto_56065 ?auto_56066 ) ) ( ON ?auto_56066 ?auto_56068 ) ( not ( = ?auto_56062 ?auto_56068 ) ) ( not ( = ?auto_56063 ?auto_56068 ) ) ( not ( = ?auto_56064 ?auto_56068 ) ) ( not ( = ?auto_56065 ?auto_56068 ) ) ( not ( = ?auto_56066 ?auto_56068 ) ) ( ON ?auto_56065 ?auto_56066 ) ( ON-TABLE ?auto_56067 ) ( ON ?auto_56068 ?auto_56067 ) ( not ( = ?auto_56067 ?auto_56068 ) ) ( not ( = ?auto_56067 ?auto_56066 ) ) ( not ( = ?auto_56067 ?auto_56065 ) ) ( not ( = ?auto_56062 ?auto_56067 ) ) ( not ( = ?auto_56063 ?auto_56067 ) ) ( not ( = ?auto_56064 ?auto_56067 ) ) ( ON ?auto_56064 ?auto_56065 ) ( CLEAR ?auto_56064 ) ( HOLDING ?auto_56063 ) ( CLEAR ?auto_56062 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56062 ?auto_56063 )
      ( MAKE-5PILE ?auto_56062 ?auto_56063 ?auto_56064 ?auto_56065 ?auto_56066 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56069 - BLOCK
      ?auto_56070 - BLOCK
      ?auto_56071 - BLOCK
      ?auto_56072 - BLOCK
      ?auto_56073 - BLOCK
    )
    :vars
    (
      ?auto_56075 - BLOCK
      ?auto_56074 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56069 ) ( not ( = ?auto_56069 ?auto_56070 ) ) ( not ( = ?auto_56069 ?auto_56071 ) ) ( not ( = ?auto_56069 ?auto_56072 ) ) ( not ( = ?auto_56069 ?auto_56073 ) ) ( not ( = ?auto_56070 ?auto_56071 ) ) ( not ( = ?auto_56070 ?auto_56072 ) ) ( not ( = ?auto_56070 ?auto_56073 ) ) ( not ( = ?auto_56071 ?auto_56072 ) ) ( not ( = ?auto_56071 ?auto_56073 ) ) ( not ( = ?auto_56072 ?auto_56073 ) ) ( ON ?auto_56073 ?auto_56075 ) ( not ( = ?auto_56069 ?auto_56075 ) ) ( not ( = ?auto_56070 ?auto_56075 ) ) ( not ( = ?auto_56071 ?auto_56075 ) ) ( not ( = ?auto_56072 ?auto_56075 ) ) ( not ( = ?auto_56073 ?auto_56075 ) ) ( ON ?auto_56072 ?auto_56073 ) ( ON-TABLE ?auto_56074 ) ( ON ?auto_56075 ?auto_56074 ) ( not ( = ?auto_56074 ?auto_56075 ) ) ( not ( = ?auto_56074 ?auto_56073 ) ) ( not ( = ?auto_56074 ?auto_56072 ) ) ( not ( = ?auto_56069 ?auto_56074 ) ) ( not ( = ?auto_56070 ?auto_56074 ) ) ( not ( = ?auto_56071 ?auto_56074 ) ) ( ON ?auto_56071 ?auto_56072 ) ( CLEAR ?auto_56069 ) ( ON ?auto_56070 ?auto_56071 ) ( CLEAR ?auto_56070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56074 ?auto_56075 ?auto_56073 ?auto_56072 ?auto_56071 )
      ( MAKE-5PILE ?auto_56069 ?auto_56070 ?auto_56071 ?auto_56072 ?auto_56073 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56076 - BLOCK
      ?auto_56077 - BLOCK
      ?auto_56078 - BLOCK
      ?auto_56079 - BLOCK
      ?auto_56080 - BLOCK
    )
    :vars
    (
      ?auto_56081 - BLOCK
      ?auto_56082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56076 ?auto_56077 ) ) ( not ( = ?auto_56076 ?auto_56078 ) ) ( not ( = ?auto_56076 ?auto_56079 ) ) ( not ( = ?auto_56076 ?auto_56080 ) ) ( not ( = ?auto_56077 ?auto_56078 ) ) ( not ( = ?auto_56077 ?auto_56079 ) ) ( not ( = ?auto_56077 ?auto_56080 ) ) ( not ( = ?auto_56078 ?auto_56079 ) ) ( not ( = ?auto_56078 ?auto_56080 ) ) ( not ( = ?auto_56079 ?auto_56080 ) ) ( ON ?auto_56080 ?auto_56081 ) ( not ( = ?auto_56076 ?auto_56081 ) ) ( not ( = ?auto_56077 ?auto_56081 ) ) ( not ( = ?auto_56078 ?auto_56081 ) ) ( not ( = ?auto_56079 ?auto_56081 ) ) ( not ( = ?auto_56080 ?auto_56081 ) ) ( ON ?auto_56079 ?auto_56080 ) ( ON-TABLE ?auto_56082 ) ( ON ?auto_56081 ?auto_56082 ) ( not ( = ?auto_56082 ?auto_56081 ) ) ( not ( = ?auto_56082 ?auto_56080 ) ) ( not ( = ?auto_56082 ?auto_56079 ) ) ( not ( = ?auto_56076 ?auto_56082 ) ) ( not ( = ?auto_56077 ?auto_56082 ) ) ( not ( = ?auto_56078 ?auto_56082 ) ) ( ON ?auto_56078 ?auto_56079 ) ( ON ?auto_56077 ?auto_56078 ) ( CLEAR ?auto_56077 ) ( HOLDING ?auto_56076 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56076 )
      ( MAKE-5PILE ?auto_56076 ?auto_56077 ?auto_56078 ?auto_56079 ?auto_56080 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56083 - BLOCK
      ?auto_56084 - BLOCK
      ?auto_56085 - BLOCK
      ?auto_56086 - BLOCK
      ?auto_56087 - BLOCK
    )
    :vars
    (
      ?auto_56088 - BLOCK
      ?auto_56089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56083 ?auto_56084 ) ) ( not ( = ?auto_56083 ?auto_56085 ) ) ( not ( = ?auto_56083 ?auto_56086 ) ) ( not ( = ?auto_56083 ?auto_56087 ) ) ( not ( = ?auto_56084 ?auto_56085 ) ) ( not ( = ?auto_56084 ?auto_56086 ) ) ( not ( = ?auto_56084 ?auto_56087 ) ) ( not ( = ?auto_56085 ?auto_56086 ) ) ( not ( = ?auto_56085 ?auto_56087 ) ) ( not ( = ?auto_56086 ?auto_56087 ) ) ( ON ?auto_56087 ?auto_56088 ) ( not ( = ?auto_56083 ?auto_56088 ) ) ( not ( = ?auto_56084 ?auto_56088 ) ) ( not ( = ?auto_56085 ?auto_56088 ) ) ( not ( = ?auto_56086 ?auto_56088 ) ) ( not ( = ?auto_56087 ?auto_56088 ) ) ( ON ?auto_56086 ?auto_56087 ) ( ON-TABLE ?auto_56089 ) ( ON ?auto_56088 ?auto_56089 ) ( not ( = ?auto_56089 ?auto_56088 ) ) ( not ( = ?auto_56089 ?auto_56087 ) ) ( not ( = ?auto_56089 ?auto_56086 ) ) ( not ( = ?auto_56083 ?auto_56089 ) ) ( not ( = ?auto_56084 ?auto_56089 ) ) ( not ( = ?auto_56085 ?auto_56089 ) ) ( ON ?auto_56085 ?auto_56086 ) ( ON ?auto_56084 ?auto_56085 ) ( ON ?auto_56083 ?auto_56084 ) ( CLEAR ?auto_56083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56089 ?auto_56088 ?auto_56087 ?auto_56086 ?auto_56085 ?auto_56084 )
      ( MAKE-5PILE ?auto_56083 ?auto_56084 ?auto_56085 ?auto_56086 ?auto_56087 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56091 - BLOCK
    )
    :vars
    (
      ?auto_56092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56092 ?auto_56091 ) ( CLEAR ?auto_56092 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56091 ) ( not ( = ?auto_56091 ?auto_56092 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56092 ?auto_56091 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56093 - BLOCK
    )
    :vars
    (
      ?auto_56094 - BLOCK
      ?auto_56095 - BLOCK
      ?auto_56096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56094 ?auto_56093 ) ( CLEAR ?auto_56094 ) ( ON-TABLE ?auto_56093 ) ( not ( = ?auto_56093 ?auto_56094 ) ) ( HOLDING ?auto_56095 ) ( CLEAR ?auto_56096 ) ( not ( = ?auto_56093 ?auto_56095 ) ) ( not ( = ?auto_56093 ?auto_56096 ) ) ( not ( = ?auto_56094 ?auto_56095 ) ) ( not ( = ?auto_56094 ?auto_56096 ) ) ( not ( = ?auto_56095 ?auto_56096 ) ) )
    :subtasks
    ( ( !STACK ?auto_56095 ?auto_56096 )
      ( MAKE-1PILE ?auto_56093 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56097 - BLOCK
    )
    :vars
    (
      ?auto_56098 - BLOCK
      ?auto_56099 - BLOCK
      ?auto_56100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56098 ?auto_56097 ) ( ON-TABLE ?auto_56097 ) ( not ( = ?auto_56097 ?auto_56098 ) ) ( CLEAR ?auto_56099 ) ( not ( = ?auto_56097 ?auto_56100 ) ) ( not ( = ?auto_56097 ?auto_56099 ) ) ( not ( = ?auto_56098 ?auto_56100 ) ) ( not ( = ?auto_56098 ?auto_56099 ) ) ( not ( = ?auto_56100 ?auto_56099 ) ) ( ON ?auto_56100 ?auto_56098 ) ( CLEAR ?auto_56100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56097 ?auto_56098 )
      ( MAKE-1PILE ?auto_56097 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56101 - BLOCK
    )
    :vars
    (
      ?auto_56103 - BLOCK
      ?auto_56104 - BLOCK
      ?auto_56102 - BLOCK
      ?auto_56106 - BLOCK
      ?auto_56107 - BLOCK
      ?auto_56105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56103 ?auto_56101 ) ( ON-TABLE ?auto_56101 ) ( not ( = ?auto_56101 ?auto_56103 ) ) ( not ( = ?auto_56101 ?auto_56104 ) ) ( not ( = ?auto_56101 ?auto_56102 ) ) ( not ( = ?auto_56103 ?auto_56104 ) ) ( not ( = ?auto_56103 ?auto_56102 ) ) ( not ( = ?auto_56104 ?auto_56102 ) ) ( ON ?auto_56104 ?auto_56103 ) ( CLEAR ?auto_56104 ) ( HOLDING ?auto_56102 ) ( CLEAR ?auto_56106 ) ( ON-TABLE ?auto_56107 ) ( ON ?auto_56105 ?auto_56107 ) ( ON ?auto_56106 ?auto_56105 ) ( not ( = ?auto_56107 ?auto_56105 ) ) ( not ( = ?auto_56107 ?auto_56106 ) ) ( not ( = ?auto_56107 ?auto_56102 ) ) ( not ( = ?auto_56105 ?auto_56106 ) ) ( not ( = ?auto_56105 ?auto_56102 ) ) ( not ( = ?auto_56106 ?auto_56102 ) ) ( not ( = ?auto_56101 ?auto_56106 ) ) ( not ( = ?auto_56101 ?auto_56107 ) ) ( not ( = ?auto_56101 ?auto_56105 ) ) ( not ( = ?auto_56103 ?auto_56106 ) ) ( not ( = ?auto_56103 ?auto_56107 ) ) ( not ( = ?auto_56103 ?auto_56105 ) ) ( not ( = ?auto_56104 ?auto_56106 ) ) ( not ( = ?auto_56104 ?auto_56107 ) ) ( not ( = ?auto_56104 ?auto_56105 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56107 ?auto_56105 ?auto_56106 ?auto_56102 )
      ( MAKE-1PILE ?auto_56101 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56108 - BLOCK
    )
    :vars
    (
      ?auto_56111 - BLOCK
      ?auto_56110 - BLOCK
      ?auto_56109 - BLOCK
      ?auto_56114 - BLOCK
      ?auto_56112 - BLOCK
      ?auto_56113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56111 ?auto_56108 ) ( ON-TABLE ?auto_56108 ) ( not ( = ?auto_56108 ?auto_56111 ) ) ( not ( = ?auto_56108 ?auto_56110 ) ) ( not ( = ?auto_56108 ?auto_56109 ) ) ( not ( = ?auto_56111 ?auto_56110 ) ) ( not ( = ?auto_56111 ?auto_56109 ) ) ( not ( = ?auto_56110 ?auto_56109 ) ) ( ON ?auto_56110 ?auto_56111 ) ( CLEAR ?auto_56114 ) ( ON-TABLE ?auto_56112 ) ( ON ?auto_56113 ?auto_56112 ) ( ON ?auto_56114 ?auto_56113 ) ( not ( = ?auto_56112 ?auto_56113 ) ) ( not ( = ?auto_56112 ?auto_56114 ) ) ( not ( = ?auto_56112 ?auto_56109 ) ) ( not ( = ?auto_56113 ?auto_56114 ) ) ( not ( = ?auto_56113 ?auto_56109 ) ) ( not ( = ?auto_56114 ?auto_56109 ) ) ( not ( = ?auto_56108 ?auto_56114 ) ) ( not ( = ?auto_56108 ?auto_56112 ) ) ( not ( = ?auto_56108 ?auto_56113 ) ) ( not ( = ?auto_56111 ?auto_56114 ) ) ( not ( = ?auto_56111 ?auto_56112 ) ) ( not ( = ?auto_56111 ?auto_56113 ) ) ( not ( = ?auto_56110 ?auto_56114 ) ) ( not ( = ?auto_56110 ?auto_56112 ) ) ( not ( = ?auto_56110 ?auto_56113 ) ) ( ON ?auto_56109 ?auto_56110 ) ( CLEAR ?auto_56109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56108 ?auto_56111 ?auto_56110 )
      ( MAKE-1PILE ?auto_56108 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56115 - BLOCK
    )
    :vars
    (
      ?auto_56120 - BLOCK
      ?auto_56116 - BLOCK
      ?auto_56118 - BLOCK
      ?auto_56119 - BLOCK
      ?auto_56117 - BLOCK
      ?auto_56121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56120 ?auto_56115 ) ( ON-TABLE ?auto_56115 ) ( not ( = ?auto_56115 ?auto_56120 ) ) ( not ( = ?auto_56115 ?auto_56116 ) ) ( not ( = ?auto_56115 ?auto_56118 ) ) ( not ( = ?auto_56120 ?auto_56116 ) ) ( not ( = ?auto_56120 ?auto_56118 ) ) ( not ( = ?auto_56116 ?auto_56118 ) ) ( ON ?auto_56116 ?auto_56120 ) ( ON-TABLE ?auto_56119 ) ( ON ?auto_56117 ?auto_56119 ) ( not ( = ?auto_56119 ?auto_56117 ) ) ( not ( = ?auto_56119 ?auto_56121 ) ) ( not ( = ?auto_56119 ?auto_56118 ) ) ( not ( = ?auto_56117 ?auto_56121 ) ) ( not ( = ?auto_56117 ?auto_56118 ) ) ( not ( = ?auto_56121 ?auto_56118 ) ) ( not ( = ?auto_56115 ?auto_56121 ) ) ( not ( = ?auto_56115 ?auto_56119 ) ) ( not ( = ?auto_56115 ?auto_56117 ) ) ( not ( = ?auto_56120 ?auto_56121 ) ) ( not ( = ?auto_56120 ?auto_56119 ) ) ( not ( = ?auto_56120 ?auto_56117 ) ) ( not ( = ?auto_56116 ?auto_56121 ) ) ( not ( = ?auto_56116 ?auto_56119 ) ) ( not ( = ?auto_56116 ?auto_56117 ) ) ( ON ?auto_56118 ?auto_56116 ) ( CLEAR ?auto_56118 ) ( HOLDING ?auto_56121 ) ( CLEAR ?auto_56117 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56119 ?auto_56117 ?auto_56121 )
      ( MAKE-1PILE ?auto_56115 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56122 - BLOCK
    )
    :vars
    (
      ?auto_56123 - BLOCK
      ?auto_56126 - BLOCK
      ?auto_56124 - BLOCK
      ?auto_56128 - BLOCK
      ?auto_56127 - BLOCK
      ?auto_56125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56123 ?auto_56122 ) ( ON-TABLE ?auto_56122 ) ( not ( = ?auto_56122 ?auto_56123 ) ) ( not ( = ?auto_56122 ?auto_56126 ) ) ( not ( = ?auto_56122 ?auto_56124 ) ) ( not ( = ?auto_56123 ?auto_56126 ) ) ( not ( = ?auto_56123 ?auto_56124 ) ) ( not ( = ?auto_56126 ?auto_56124 ) ) ( ON ?auto_56126 ?auto_56123 ) ( ON-TABLE ?auto_56128 ) ( ON ?auto_56127 ?auto_56128 ) ( not ( = ?auto_56128 ?auto_56127 ) ) ( not ( = ?auto_56128 ?auto_56125 ) ) ( not ( = ?auto_56128 ?auto_56124 ) ) ( not ( = ?auto_56127 ?auto_56125 ) ) ( not ( = ?auto_56127 ?auto_56124 ) ) ( not ( = ?auto_56125 ?auto_56124 ) ) ( not ( = ?auto_56122 ?auto_56125 ) ) ( not ( = ?auto_56122 ?auto_56128 ) ) ( not ( = ?auto_56122 ?auto_56127 ) ) ( not ( = ?auto_56123 ?auto_56125 ) ) ( not ( = ?auto_56123 ?auto_56128 ) ) ( not ( = ?auto_56123 ?auto_56127 ) ) ( not ( = ?auto_56126 ?auto_56125 ) ) ( not ( = ?auto_56126 ?auto_56128 ) ) ( not ( = ?auto_56126 ?auto_56127 ) ) ( ON ?auto_56124 ?auto_56126 ) ( CLEAR ?auto_56127 ) ( ON ?auto_56125 ?auto_56124 ) ( CLEAR ?auto_56125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56122 ?auto_56123 ?auto_56126 ?auto_56124 )
      ( MAKE-1PILE ?auto_56122 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56129 - BLOCK
    )
    :vars
    (
      ?auto_56135 - BLOCK
      ?auto_56134 - BLOCK
      ?auto_56131 - BLOCK
      ?auto_56130 - BLOCK
      ?auto_56132 - BLOCK
      ?auto_56133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56135 ?auto_56129 ) ( ON-TABLE ?auto_56129 ) ( not ( = ?auto_56129 ?auto_56135 ) ) ( not ( = ?auto_56129 ?auto_56134 ) ) ( not ( = ?auto_56129 ?auto_56131 ) ) ( not ( = ?auto_56135 ?auto_56134 ) ) ( not ( = ?auto_56135 ?auto_56131 ) ) ( not ( = ?auto_56134 ?auto_56131 ) ) ( ON ?auto_56134 ?auto_56135 ) ( ON-TABLE ?auto_56130 ) ( not ( = ?auto_56130 ?auto_56132 ) ) ( not ( = ?auto_56130 ?auto_56133 ) ) ( not ( = ?auto_56130 ?auto_56131 ) ) ( not ( = ?auto_56132 ?auto_56133 ) ) ( not ( = ?auto_56132 ?auto_56131 ) ) ( not ( = ?auto_56133 ?auto_56131 ) ) ( not ( = ?auto_56129 ?auto_56133 ) ) ( not ( = ?auto_56129 ?auto_56130 ) ) ( not ( = ?auto_56129 ?auto_56132 ) ) ( not ( = ?auto_56135 ?auto_56133 ) ) ( not ( = ?auto_56135 ?auto_56130 ) ) ( not ( = ?auto_56135 ?auto_56132 ) ) ( not ( = ?auto_56134 ?auto_56133 ) ) ( not ( = ?auto_56134 ?auto_56130 ) ) ( not ( = ?auto_56134 ?auto_56132 ) ) ( ON ?auto_56131 ?auto_56134 ) ( ON ?auto_56133 ?auto_56131 ) ( CLEAR ?auto_56133 ) ( HOLDING ?auto_56132 ) ( CLEAR ?auto_56130 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56130 ?auto_56132 )
      ( MAKE-1PILE ?auto_56129 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56136 - BLOCK
    )
    :vars
    (
      ?auto_56141 - BLOCK
      ?auto_56140 - BLOCK
      ?auto_56137 - BLOCK
      ?auto_56139 - BLOCK
      ?auto_56138 - BLOCK
      ?auto_56142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56141 ?auto_56136 ) ( ON-TABLE ?auto_56136 ) ( not ( = ?auto_56136 ?auto_56141 ) ) ( not ( = ?auto_56136 ?auto_56140 ) ) ( not ( = ?auto_56136 ?auto_56137 ) ) ( not ( = ?auto_56141 ?auto_56140 ) ) ( not ( = ?auto_56141 ?auto_56137 ) ) ( not ( = ?auto_56140 ?auto_56137 ) ) ( ON ?auto_56140 ?auto_56141 ) ( ON-TABLE ?auto_56139 ) ( not ( = ?auto_56139 ?auto_56138 ) ) ( not ( = ?auto_56139 ?auto_56142 ) ) ( not ( = ?auto_56139 ?auto_56137 ) ) ( not ( = ?auto_56138 ?auto_56142 ) ) ( not ( = ?auto_56138 ?auto_56137 ) ) ( not ( = ?auto_56142 ?auto_56137 ) ) ( not ( = ?auto_56136 ?auto_56142 ) ) ( not ( = ?auto_56136 ?auto_56139 ) ) ( not ( = ?auto_56136 ?auto_56138 ) ) ( not ( = ?auto_56141 ?auto_56142 ) ) ( not ( = ?auto_56141 ?auto_56139 ) ) ( not ( = ?auto_56141 ?auto_56138 ) ) ( not ( = ?auto_56140 ?auto_56142 ) ) ( not ( = ?auto_56140 ?auto_56139 ) ) ( not ( = ?auto_56140 ?auto_56138 ) ) ( ON ?auto_56137 ?auto_56140 ) ( ON ?auto_56142 ?auto_56137 ) ( CLEAR ?auto_56139 ) ( ON ?auto_56138 ?auto_56142 ) ( CLEAR ?auto_56138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56136 ?auto_56141 ?auto_56140 ?auto_56137 ?auto_56142 )
      ( MAKE-1PILE ?auto_56136 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56143 - BLOCK
    )
    :vars
    (
      ?auto_56146 - BLOCK
      ?auto_56148 - BLOCK
      ?auto_56145 - BLOCK
      ?auto_56144 - BLOCK
      ?auto_56149 - BLOCK
      ?auto_56147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56146 ?auto_56143 ) ( ON-TABLE ?auto_56143 ) ( not ( = ?auto_56143 ?auto_56146 ) ) ( not ( = ?auto_56143 ?auto_56148 ) ) ( not ( = ?auto_56143 ?auto_56145 ) ) ( not ( = ?auto_56146 ?auto_56148 ) ) ( not ( = ?auto_56146 ?auto_56145 ) ) ( not ( = ?auto_56148 ?auto_56145 ) ) ( ON ?auto_56148 ?auto_56146 ) ( not ( = ?auto_56144 ?auto_56149 ) ) ( not ( = ?auto_56144 ?auto_56147 ) ) ( not ( = ?auto_56144 ?auto_56145 ) ) ( not ( = ?auto_56149 ?auto_56147 ) ) ( not ( = ?auto_56149 ?auto_56145 ) ) ( not ( = ?auto_56147 ?auto_56145 ) ) ( not ( = ?auto_56143 ?auto_56147 ) ) ( not ( = ?auto_56143 ?auto_56144 ) ) ( not ( = ?auto_56143 ?auto_56149 ) ) ( not ( = ?auto_56146 ?auto_56147 ) ) ( not ( = ?auto_56146 ?auto_56144 ) ) ( not ( = ?auto_56146 ?auto_56149 ) ) ( not ( = ?auto_56148 ?auto_56147 ) ) ( not ( = ?auto_56148 ?auto_56144 ) ) ( not ( = ?auto_56148 ?auto_56149 ) ) ( ON ?auto_56145 ?auto_56148 ) ( ON ?auto_56147 ?auto_56145 ) ( ON ?auto_56149 ?auto_56147 ) ( CLEAR ?auto_56149 ) ( HOLDING ?auto_56144 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56144 )
      ( MAKE-1PILE ?auto_56143 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56150 - BLOCK
    )
    :vars
    (
      ?auto_56156 - BLOCK
      ?auto_56152 - BLOCK
      ?auto_56151 - BLOCK
      ?auto_56155 - BLOCK
      ?auto_56153 - BLOCK
      ?auto_56154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56156 ?auto_56150 ) ( ON-TABLE ?auto_56150 ) ( not ( = ?auto_56150 ?auto_56156 ) ) ( not ( = ?auto_56150 ?auto_56152 ) ) ( not ( = ?auto_56150 ?auto_56151 ) ) ( not ( = ?auto_56156 ?auto_56152 ) ) ( not ( = ?auto_56156 ?auto_56151 ) ) ( not ( = ?auto_56152 ?auto_56151 ) ) ( ON ?auto_56152 ?auto_56156 ) ( not ( = ?auto_56155 ?auto_56153 ) ) ( not ( = ?auto_56155 ?auto_56154 ) ) ( not ( = ?auto_56155 ?auto_56151 ) ) ( not ( = ?auto_56153 ?auto_56154 ) ) ( not ( = ?auto_56153 ?auto_56151 ) ) ( not ( = ?auto_56154 ?auto_56151 ) ) ( not ( = ?auto_56150 ?auto_56154 ) ) ( not ( = ?auto_56150 ?auto_56155 ) ) ( not ( = ?auto_56150 ?auto_56153 ) ) ( not ( = ?auto_56156 ?auto_56154 ) ) ( not ( = ?auto_56156 ?auto_56155 ) ) ( not ( = ?auto_56156 ?auto_56153 ) ) ( not ( = ?auto_56152 ?auto_56154 ) ) ( not ( = ?auto_56152 ?auto_56155 ) ) ( not ( = ?auto_56152 ?auto_56153 ) ) ( ON ?auto_56151 ?auto_56152 ) ( ON ?auto_56154 ?auto_56151 ) ( ON ?auto_56153 ?auto_56154 ) ( ON ?auto_56155 ?auto_56153 ) ( CLEAR ?auto_56155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56150 ?auto_56156 ?auto_56152 ?auto_56151 ?auto_56154 ?auto_56153 )
      ( MAKE-1PILE ?auto_56150 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56163 - BLOCK
      ?auto_56164 - BLOCK
      ?auto_56165 - BLOCK
      ?auto_56166 - BLOCK
      ?auto_56167 - BLOCK
      ?auto_56168 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_56168 ) ( CLEAR ?auto_56167 ) ( ON-TABLE ?auto_56163 ) ( ON ?auto_56164 ?auto_56163 ) ( ON ?auto_56165 ?auto_56164 ) ( ON ?auto_56166 ?auto_56165 ) ( ON ?auto_56167 ?auto_56166 ) ( not ( = ?auto_56163 ?auto_56164 ) ) ( not ( = ?auto_56163 ?auto_56165 ) ) ( not ( = ?auto_56163 ?auto_56166 ) ) ( not ( = ?auto_56163 ?auto_56167 ) ) ( not ( = ?auto_56163 ?auto_56168 ) ) ( not ( = ?auto_56164 ?auto_56165 ) ) ( not ( = ?auto_56164 ?auto_56166 ) ) ( not ( = ?auto_56164 ?auto_56167 ) ) ( not ( = ?auto_56164 ?auto_56168 ) ) ( not ( = ?auto_56165 ?auto_56166 ) ) ( not ( = ?auto_56165 ?auto_56167 ) ) ( not ( = ?auto_56165 ?auto_56168 ) ) ( not ( = ?auto_56166 ?auto_56167 ) ) ( not ( = ?auto_56166 ?auto_56168 ) ) ( not ( = ?auto_56167 ?auto_56168 ) ) )
    :subtasks
    ( ( !STACK ?auto_56168 ?auto_56167 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56169 - BLOCK
      ?auto_56170 - BLOCK
      ?auto_56171 - BLOCK
      ?auto_56172 - BLOCK
      ?auto_56173 - BLOCK
      ?auto_56174 - BLOCK
    )
    :vars
    (
      ?auto_56175 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_56173 ) ( ON-TABLE ?auto_56169 ) ( ON ?auto_56170 ?auto_56169 ) ( ON ?auto_56171 ?auto_56170 ) ( ON ?auto_56172 ?auto_56171 ) ( ON ?auto_56173 ?auto_56172 ) ( not ( = ?auto_56169 ?auto_56170 ) ) ( not ( = ?auto_56169 ?auto_56171 ) ) ( not ( = ?auto_56169 ?auto_56172 ) ) ( not ( = ?auto_56169 ?auto_56173 ) ) ( not ( = ?auto_56169 ?auto_56174 ) ) ( not ( = ?auto_56170 ?auto_56171 ) ) ( not ( = ?auto_56170 ?auto_56172 ) ) ( not ( = ?auto_56170 ?auto_56173 ) ) ( not ( = ?auto_56170 ?auto_56174 ) ) ( not ( = ?auto_56171 ?auto_56172 ) ) ( not ( = ?auto_56171 ?auto_56173 ) ) ( not ( = ?auto_56171 ?auto_56174 ) ) ( not ( = ?auto_56172 ?auto_56173 ) ) ( not ( = ?auto_56172 ?auto_56174 ) ) ( not ( = ?auto_56173 ?auto_56174 ) ) ( ON ?auto_56174 ?auto_56175 ) ( CLEAR ?auto_56174 ) ( HAND-EMPTY ) ( not ( = ?auto_56169 ?auto_56175 ) ) ( not ( = ?auto_56170 ?auto_56175 ) ) ( not ( = ?auto_56171 ?auto_56175 ) ) ( not ( = ?auto_56172 ?auto_56175 ) ) ( not ( = ?auto_56173 ?auto_56175 ) ) ( not ( = ?auto_56174 ?auto_56175 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56174 ?auto_56175 )
      ( MAKE-6PILE ?auto_56169 ?auto_56170 ?auto_56171 ?auto_56172 ?auto_56173 ?auto_56174 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56176 - BLOCK
      ?auto_56177 - BLOCK
      ?auto_56178 - BLOCK
      ?auto_56179 - BLOCK
      ?auto_56180 - BLOCK
      ?auto_56181 - BLOCK
    )
    :vars
    (
      ?auto_56182 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56176 ) ( ON ?auto_56177 ?auto_56176 ) ( ON ?auto_56178 ?auto_56177 ) ( ON ?auto_56179 ?auto_56178 ) ( not ( = ?auto_56176 ?auto_56177 ) ) ( not ( = ?auto_56176 ?auto_56178 ) ) ( not ( = ?auto_56176 ?auto_56179 ) ) ( not ( = ?auto_56176 ?auto_56180 ) ) ( not ( = ?auto_56176 ?auto_56181 ) ) ( not ( = ?auto_56177 ?auto_56178 ) ) ( not ( = ?auto_56177 ?auto_56179 ) ) ( not ( = ?auto_56177 ?auto_56180 ) ) ( not ( = ?auto_56177 ?auto_56181 ) ) ( not ( = ?auto_56178 ?auto_56179 ) ) ( not ( = ?auto_56178 ?auto_56180 ) ) ( not ( = ?auto_56178 ?auto_56181 ) ) ( not ( = ?auto_56179 ?auto_56180 ) ) ( not ( = ?auto_56179 ?auto_56181 ) ) ( not ( = ?auto_56180 ?auto_56181 ) ) ( ON ?auto_56181 ?auto_56182 ) ( CLEAR ?auto_56181 ) ( not ( = ?auto_56176 ?auto_56182 ) ) ( not ( = ?auto_56177 ?auto_56182 ) ) ( not ( = ?auto_56178 ?auto_56182 ) ) ( not ( = ?auto_56179 ?auto_56182 ) ) ( not ( = ?auto_56180 ?auto_56182 ) ) ( not ( = ?auto_56181 ?auto_56182 ) ) ( HOLDING ?auto_56180 ) ( CLEAR ?auto_56179 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56176 ?auto_56177 ?auto_56178 ?auto_56179 ?auto_56180 )
      ( MAKE-6PILE ?auto_56176 ?auto_56177 ?auto_56178 ?auto_56179 ?auto_56180 ?auto_56181 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56183 - BLOCK
      ?auto_56184 - BLOCK
      ?auto_56185 - BLOCK
      ?auto_56186 - BLOCK
      ?auto_56187 - BLOCK
      ?auto_56188 - BLOCK
    )
    :vars
    (
      ?auto_56189 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56183 ) ( ON ?auto_56184 ?auto_56183 ) ( ON ?auto_56185 ?auto_56184 ) ( ON ?auto_56186 ?auto_56185 ) ( not ( = ?auto_56183 ?auto_56184 ) ) ( not ( = ?auto_56183 ?auto_56185 ) ) ( not ( = ?auto_56183 ?auto_56186 ) ) ( not ( = ?auto_56183 ?auto_56187 ) ) ( not ( = ?auto_56183 ?auto_56188 ) ) ( not ( = ?auto_56184 ?auto_56185 ) ) ( not ( = ?auto_56184 ?auto_56186 ) ) ( not ( = ?auto_56184 ?auto_56187 ) ) ( not ( = ?auto_56184 ?auto_56188 ) ) ( not ( = ?auto_56185 ?auto_56186 ) ) ( not ( = ?auto_56185 ?auto_56187 ) ) ( not ( = ?auto_56185 ?auto_56188 ) ) ( not ( = ?auto_56186 ?auto_56187 ) ) ( not ( = ?auto_56186 ?auto_56188 ) ) ( not ( = ?auto_56187 ?auto_56188 ) ) ( ON ?auto_56188 ?auto_56189 ) ( not ( = ?auto_56183 ?auto_56189 ) ) ( not ( = ?auto_56184 ?auto_56189 ) ) ( not ( = ?auto_56185 ?auto_56189 ) ) ( not ( = ?auto_56186 ?auto_56189 ) ) ( not ( = ?auto_56187 ?auto_56189 ) ) ( not ( = ?auto_56188 ?auto_56189 ) ) ( CLEAR ?auto_56186 ) ( ON ?auto_56187 ?auto_56188 ) ( CLEAR ?auto_56187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56189 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56189 ?auto_56188 )
      ( MAKE-6PILE ?auto_56183 ?auto_56184 ?auto_56185 ?auto_56186 ?auto_56187 ?auto_56188 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56190 - BLOCK
      ?auto_56191 - BLOCK
      ?auto_56192 - BLOCK
      ?auto_56193 - BLOCK
      ?auto_56194 - BLOCK
      ?auto_56195 - BLOCK
    )
    :vars
    (
      ?auto_56196 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56190 ) ( ON ?auto_56191 ?auto_56190 ) ( ON ?auto_56192 ?auto_56191 ) ( not ( = ?auto_56190 ?auto_56191 ) ) ( not ( = ?auto_56190 ?auto_56192 ) ) ( not ( = ?auto_56190 ?auto_56193 ) ) ( not ( = ?auto_56190 ?auto_56194 ) ) ( not ( = ?auto_56190 ?auto_56195 ) ) ( not ( = ?auto_56191 ?auto_56192 ) ) ( not ( = ?auto_56191 ?auto_56193 ) ) ( not ( = ?auto_56191 ?auto_56194 ) ) ( not ( = ?auto_56191 ?auto_56195 ) ) ( not ( = ?auto_56192 ?auto_56193 ) ) ( not ( = ?auto_56192 ?auto_56194 ) ) ( not ( = ?auto_56192 ?auto_56195 ) ) ( not ( = ?auto_56193 ?auto_56194 ) ) ( not ( = ?auto_56193 ?auto_56195 ) ) ( not ( = ?auto_56194 ?auto_56195 ) ) ( ON ?auto_56195 ?auto_56196 ) ( not ( = ?auto_56190 ?auto_56196 ) ) ( not ( = ?auto_56191 ?auto_56196 ) ) ( not ( = ?auto_56192 ?auto_56196 ) ) ( not ( = ?auto_56193 ?auto_56196 ) ) ( not ( = ?auto_56194 ?auto_56196 ) ) ( not ( = ?auto_56195 ?auto_56196 ) ) ( ON ?auto_56194 ?auto_56195 ) ( CLEAR ?auto_56194 ) ( ON-TABLE ?auto_56196 ) ( HOLDING ?auto_56193 ) ( CLEAR ?auto_56192 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56190 ?auto_56191 ?auto_56192 ?auto_56193 )
      ( MAKE-6PILE ?auto_56190 ?auto_56191 ?auto_56192 ?auto_56193 ?auto_56194 ?auto_56195 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56197 - BLOCK
      ?auto_56198 - BLOCK
      ?auto_56199 - BLOCK
      ?auto_56200 - BLOCK
      ?auto_56201 - BLOCK
      ?auto_56202 - BLOCK
    )
    :vars
    (
      ?auto_56203 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56197 ) ( ON ?auto_56198 ?auto_56197 ) ( ON ?auto_56199 ?auto_56198 ) ( not ( = ?auto_56197 ?auto_56198 ) ) ( not ( = ?auto_56197 ?auto_56199 ) ) ( not ( = ?auto_56197 ?auto_56200 ) ) ( not ( = ?auto_56197 ?auto_56201 ) ) ( not ( = ?auto_56197 ?auto_56202 ) ) ( not ( = ?auto_56198 ?auto_56199 ) ) ( not ( = ?auto_56198 ?auto_56200 ) ) ( not ( = ?auto_56198 ?auto_56201 ) ) ( not ( = ?auto_56198 ?auto_56202 ) ) ( not ( = ?auto_56199 ?auto_56200 ) ) ( not ( = ?auto_56199 ?auto_56201 ) ) ( not ( = ?auto_56199 ?auto_56202 ) ) ( not ( = ?auto_56200 ?auto_56201 ) ) ( not ( = ?auto_56200 ?auto_56202 ) ) ( not ( = ?auto_56201 ?auto_56202 ) ) ( ON ?auto_56202 ?auto_56203 ) ( not ( = ?auto_56197 ?auto_56203 ) ) ( not ( = ?auto_56198 ?auto_56203 ) ) ( not ( = ?auto_56199 ?auto_56203 ) ) ( not ( = ?auto_56200 ?auto_56203 ) ) ( not ( = ?auto_56201 ?auto_56203 ) ) ( not ( = ?auto_56202 ?auto_56203 ) ) ( ON ?auto_56201 ?auto_56202 ) ( ON-TABLE ?auto_56203 ) ( CLEAR ?auto_56199 ) ( ON ?auto_56200 ?auto_56201 ) ( CLEAR ?auto_56200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56203 ?auto_56202 ?auto_56201 )
      ( MAKE-6PILE ?auto_56197 ?auto_56198 ?auto_56199 ?auto_56200 ?auto_56201 ?auto_56202 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56204 - BLOCK
      ?auto_56205 - BLOCK
      ?auto_56206 - BLOCK
      ?auto_56207 - BLOCK
      ?auto_56208 - BLOCK
      ?auto_56209 - BLOCK
    )
    :vars
    (
      ?auto_56210 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56204 ) ( ON ?auto_56205 ?auto_56204 ) ( not ( = ?auto_56204 ?auto_56205 ) ) ( not ( = ?auto_56204 ?auto_56206 ) ) ( not ( = ?auto_56204 ?auto_56207 ) ) ( not ( = ?auto_56204 ?auto_56208 ) ) ( not ( = ?auto_56204 ?auto_56209 ) ) ( not ( = ?auto_56205 ?auto_56206 ) ) ( not ( = ?auto_56205 ?auto_56207 ) ) ( not ( = ?auto_56205 ?auto_56208 ) ) ( not ( = ?auto_56205 ?auto_56209 ) ) ( not ( = ?auto_56206 ?auto_56207 ) ) ( not ( = ?auto_56206 ?auto_56208 ) ) ( not ( = ?auto_56206 ?auto_56209 ) ) ( not ( = ?auto_56207 ?auto_56208 ) ) ( not ( = ?auto_56207 ?auto_56209 ) ) ( not ( = ?auto_56208 ?auto_56209 ) ) ( ON ?auto_56209 ?auto_56210 ) ( not ( = ?auto_56204 ?auto_56210 ) ) ( not ( = ?auto_56205 ?auto_56210 ) ) ( not ( = ?auto_56206 ?auto_56210 ) ) ( not ( = ?auto_56207 ?auto_56210 ) ) ( not ( = ?auto_56208 ?auto_56210 ) ) ( not ( = ?auto_56209 ?auto_56210 ) ) ( ON ?auto_56208 ?auto_56209 ) ( ON-TABLE ?auto_56210 ) ( ON ?auto_56207 ?auto_56208 ) ( CLEAR ?auto_56207 ) ( HOLDING ?auto_56206 ) ( CLEAR ?auto_56205 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56204 ?auto_56205 ?auto_56206 )
      ( MAKE-6PILE ?auto_56204 ?auto_56205 ?auto_56206 ?auto_56207 ?auto_56208 ?auto_56209 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56211 - BLOCK
      ?auto_56212 - BLOCK
      ?auto_56213 - BLOCK
      ?auto_56214 - BLOCK
      ?auto_56215 - BLOCK
      ?auto_56216 - BLOCK
    )
    :vars
    (
      ?auto_56217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56211 ) ( ON ?auto_56212 ?auto_56211 ) ( not ( = ?auto_56211 ?auto_56212 ) ) ( not ( = ?auto_56211 ?auto_56213 ) ) ( not ( = ?auto_56211 ?auto_56214 ) ) ( not ( = ?auto_56211 ?auto_56215 ) ) ( not ( = ?auto_56211 ?auto_56216 ) ) ( not ( = ?auto_56212 ?auto_56213 ) ) ( not ( = ?auto_56212 ?auto_56214 ) ) ( not ( = ?auto_56212 ?auto_56215 ) ) ( not ( = ?auto_56212 ?auto_56216 ) ) ( not ( = ?auto_56213 ?auto_56214 ) ) ( not ( = ?auto_56213 ?auto_56215 ) ) ( not ( = ?auto_56213 ?auto_56216 ) ) ( not ( = ?auto_56214 ?auto_56215 ) ) ( not ( = ?auto_56214 ?auto_56216 ) ) ( not ( = ?auto_56215 ?auto_56216 ) ) ( ON ?auto_56216 ?auto_56217 ) ( not ( = ?auto_56211 ?auto_56217 ) ) ( not ( = ?auto_56212 ?auto_56217 ) ) ( not ( = ?auto_56213 ?auto_56217 ) ) ( not ( = ?auto_56214 ?auto_56217 ) ) ( not ( = ?auto_56215 ?auto_56217 ) ) ( not ( = ?auto_56216 ?auto_56217 ) ) ( ON ?auto_56215 ?auto_56216 ) ( ON-TABLE ?auto_56217 ) ( ON ?auto_56214 ?auto_56215 ) ( CLEAR ?auto_56212 ) ( ON ?auto_56213 ?auto_56214 ) ( CLEAR ?auto_56213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56217 ?auto_56216 ?auto_56215 ?auto_56214 )
      ( MAKE-6PILE ?auto_56211 ?auto_56212 ?auto_56213 ?auto_56214 ?auto_56215 ?auto_56216 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56218 - BLOCK
      ?auto_56219 - BLOCK
      ?auto_56220 - BLOCK
      ?auto_56221 - BLOCK
      ?auto_56222 - BLOCK
      ?auto_56223 - BLOCK
    )
    :vars
    (
      ?auto_56224 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56218 ) ( not ( = ?auto_56218 ?auto_56219 ) ) ( not ( = ?auto_56218 ?auto_56220 ) ) ( not ( = ?auto_56218 ?auto_56221 ) ) ( not ( = ?auto_56218 ?auto_56222 ) ) ( not ( = ?auto_56218 ?auto_56223 ) ) ( not ( = ?auto_56219 ?auto_56220 ) ) ( not ( = ?auto_56219 ?auto_56221 ) ) ( not ( = ?auto_56219 ?auto_56222 ) ) ( not ( = ?auto_56219 ?auto_56223 ) ) ( not ( = ?auto_56220 ?auto_56221 ) ) ( not ( = ?auto_56220 ?auto_56222 ) ) ( not ( = ?auto_56220 ?auto_56223 ) ) ( not ( = ?auto_56221 ?auto_56222 ) ) ( not ( = ?auto_56221 ?auto_56223 ) ) ( not ( = ?auto_56222 ?auto_56223 ) ) ( ON ?auto_56223 ?auto_56224 ) ( not ( = ?auto_56218 ?auto_56224 ) ) ( not ( = ?auto_56219 ?auto_56224 ) ) ( not ( = ?auto_56220 ?auto_56224 ) ) ( not ( = ?auto_56221 ?auto_56224 ) ) ( not ( = ?auto_56222 ?auto_56224 ) ) ( not ( = ?auto_56223 ?auto_56224 ) ) ( ON ?auto_56222 ?auto_56223 ) ( ON-TABLE ?auto_56224 ) ( ON ?auto_56221 ?auto_56222 ) ( ON ?auto_56220 ?auto_56221 ) ( CLEAR ?auto_56220 ) ( HOLDING ?auto_56219 ) ( CLEAR ?auto_56218 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56218 ?auto_56219 )
      ( MAKE-6PILE ?auto_56218 ?auto_56219 ?auto_56220 ?auto_56221 ?auto_56222 ?auto_56223 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56225 - BLOCK
      ?auto_56226 - BLOCK
      ?auto_56227 - BLOCK
      ?auto_56228 - BLOCK
      ?auto_56229 - BLOCK
      ?auto_56230 - BLOCK
    )
    :vars
    (
      ?auto_56231 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56225 ) ( not ( = ?auto_56225 ?auto_56226 ) ) ( not ( = ?auto_56225 ?auto_56227 ) ) ( not ( = ?auto_56225 ?auto_56228 ) ) ( not ( = ?auto_56225 ?auto_56229 ) ) ( not ( = ?auto_56225 ?auto_56230 ) ) ( not ( = ?auto_56226 ?auto_56227 ) ) ( not ( = ?auto_56226 ?auto_56228 ) ) ( not ( = ?auto_56226 ?auto_56229 ) ) ( not ( = ?auto_56226 ?auto_56230 ) ) ( not ( = ?auto_56227 ?auto_56228 ) ) ( not ( = ?auto_56227 ?auto_56229 ) ) ( not ( = ?auto_56227 ?auto_56230 ) ) ( not ( = ?auto_56228 ?auto_56229 ) ) ( not ( = ?auto_56228 ?auto_56230 ) ) ( not ( = ?auto_56229 ?auto_56230 ) ) ( ON ?auto_56230 ?auto_56231 ) ( not ( = ?auto_56225 ?auto_56231 ) ) ( not ( = ?auto_56226 ?auto_56231 ) ) ( not ( = ?auto_56227 ?auto_56231 ) ) ( not ( = ?auto_56228 ?auto_56231 ) ) ( not ( = ?auto_56229 ?auto_56231 ) ) ( not ( = ?auto_56230 ?auto_56231 ) ) ( ON ?auto_56229 ?auto_56230 ) ( ON-TABLE ?auto_56231 ) ( ON ?auto_56228 ?auto_56229 ) ( ON ?auto_56227 ?auto_56228 ) ( CLEAR ?auto_56225 ) ( ON ?auto_56226 ?auto_56227 ) ( CLEAR ?auto_56226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56231 ?auto_56230 ?auto_56229 ?auto_56228 ?auto_56227 )
      ( MAKE-6PILE ?auto_56225 ?auto_56226 ?auto_56227 ?auto_56228 ?auto_56229 ?auto_56230 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56232 - BLOCK
      ?auto_56233 - BLOCK
      ?auto_56234 - BLOCK
      ?auto_56235 - BLOCK
      ?auto_56236 - BLOCK
      ?auto_56237 - BLOCK
    )
    :vars
    (
      ?auto_56238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56232 ?auto_56233 ) ) ( not ( = ?auto_56232 ?auto_56234 ) ) ( not ( = ?auto_56232 ?auto_56235 ) ) ( not ( = ?auto_56232 ?auto_56236 ) ) ( not ( = ?auto_56232 ?auto_56237 ) ) ( not ( = ?auto_56233 ?auto_56234 ) ) ( not ( = ?auto_56233 ?auto_56235 ) ) ( not ( = ?auto_56233 ?auto_56236 ) ) ( not ( = ?auto_56233 ?auto_56237 ) ) ( not ( = ?auto_56234 ?auto_56235 ) ) ( not ( = ?auto_56234 ?auto_56236 ) ) ( not ( = ?auto_56234 ?auto_56237 ) ) ( not ( = ?auto_56235 ?auto_56236 ) ) ( not ( = ?auto_56235 ?auto_56237 ) ) ( not ( = ?auto_56236 ?auto_56237 ) ) ( ON ?auto_56237 ?auto_56238 ) ( not ( = ?auto_56232 ?auto_56238 ) ) ( not ( = ?auto_56233 ?auto_56238 ) ) ( not ( = ?auto_56234 ?auto_56238 ) ) ( not ( = ?auto_56235 ?auto_56238 ) ) ( not ( = ?auto_56236 ?auto_56238 ) ) ( not ( = ?auto_56237 ?auto_56238 ) ) ( ON ?auto_56236 ?auto_56237 ) ( ON-TABLE ?auto_56238 ) ( ON ?auto_56235 ?auto_56236 ) ( ON ?auto_56234 ?auto_56235 ) ( ON ?auto_56233 ?auto_56234 ) ( CLEAR ?auto_56233 ) ( HOLDING ?auto_56232 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56232 )
      ( MAKE-6PILE ?auto_56232 ?auto_56233 ?auto_56234 ?auto_56235 ?auto_56236 ?auto_56237 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_56239 - BLOCK
      ?auto_56240 - BLOCK
      ?auto_56241 - BLOCK
      ?auto_56242 - BLOCK
      ?auto_56243 - BLOCK
      ?auto_56244 - BLOCK
    )
    :vars
    (
      ?auto_56245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56239 ?auto_56240 ) ) ( not ( = ?auto_56239 ?auto_56241 ) ) ( not ( = ?auto_56239 ?auto_56242 ) ) ( not ( = ?auto_56239 ?auto_56243 ) ) ( not ( = ?auto_56239 ?auto_56244 ) ) ( not ( = ?auto_56240 ?auto_56241 ) ) ( not ( = ?auto_56240 ?auto_56242 ) ) ( not ( = ?auto_56240 ?auto_56243 ) ) ( not ( = ?auto_56240 ?auto_56244 ) ) ( not ( = ?auto_56241 ?auto_56242 ) ) ( not ( = ?auto_56241 ?auto_56243 ) ) ( not ( = ?auto_56241 ?auto_56244 ) ) ( not ( = ?auto_56242 ?auto_56243 ) ) ( not ( = ?auto_56242 ?auto_56244 ) ) ( not ( = ?auto_56243 ?auto_56244 ) ) ( ON ?auto_56244 ?auto_56245 ) ( not ( = ?auto_56239 ?auto_56245 ) ) ( not ( = ?auto_56240 ?auto_56245 ) ) ( not ( = ?auto_56241 ?auto_56245 ) ) ( not ( = ?auto_56242 ?auto_56245 ) ) ( not ( = ?auto_56243 ?auto_56245 ) ) ( not ( = ?auto_56244 ?auto_56245 ) ) ( ON ?auto_56243 ?auto_56244 ) ( ON-TABLE ?auto_56245 ) ( ON ?auto_56242 ?auto_56243 ) ( ON ?auto_56241 ?auto_56242 ) ( ON ?auto_56240 ?auto_56241 ) ( ON ?auto_56239 ?auto_56240 ) ( CLEAR ?auto_56239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56245 ?auto_56244 ?auto_56243 ?auto_56242 ?auto_56241 ?auto_56240 )
      ( MAKE-6PILE ?auto_56239 ?auto_56240 ?auto_56241 ?auto_56242 ?auto_56243 ?auto_56244 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56251 - BLOCK
      ?auto_56252 - BLOCK
      ?auto_56253 - BLOCK
      ?auto_56254 - BLOCK
      ?auto_56255 - BLOCK
    )
    :vars
    (
      ?auto_56256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56256 ?auto_56255 ) ( CLEAR ?auto_56256 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56251 ) ( ON ?auto_56252 ?auto_56251 ) ( ON ?auto_56253 ?auto_56252 ) ( ON ?auto_56254 ?auto_56253 ) ( ON ?auto_56255 ?auto_56254 ) ( not ( = ?auto_56251 ?auto_56252 ) ) ( not ( = ?auto_56251 ?auto_56253 ) ) ( not ( = ?auto_56251 ?auto_56254 ) ) ( not ( = ?auto_56251 ?auto_56255 ) ) ( not ( = ?auto_56251 ?auto_56256 ) ) ( not ( = ?auto_56252 ?auto_56253 ) ) ( not ( = ?auto_56252 ?auto_56254 ) ) ( not ( = ?auto_56252 ?auto_56255 ) ) ( not ( = ?auto_56252 ?auto_56256 ) ) ( not ( = ?auto_56253 ?auto_56254 ) ) ( not ( = ?auto_56253 ?auto_56255 ) ) ( not ( = ?auto_56253 ?auto_56256 ) ) ( not ( = ?auto_56254 ?auto_56255 ) ) ( not ( = ?auto_56254 ?auto_56256 ) ) ( not ( = ?auto_56255 ?auto_56256 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56256 ?auto_56255 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56270 - BLOCK
      ?auto_56271 - BLOCK
      ?auto_56272 - BLOCK
      ?auto_56273 - BLOCK
      ?auto_56274 - BLOCK
    )
    :vars
    (
      ?auto_56275 - BLOCK
      ?auto_56276 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56270 ) ( ON ?auto_56271 ?auto_56270 ) ( ON ?auto_56272 ?auto_56271 ) ( ON ?auto_56273 ?auto_56272 ) ( not ( = ?auto_56270 ?auto_56271 ) ) ( not ( = ?auto_56270 ?auto_56272 ) ) ( not ( = ?auto_56270 ?auto_56273 ) ) ( not ( = ?auto_56270 ?auto_56274 ) ) ( not ( = ?auto_56270 ?auto_56275 ) ) ( not ( = ?auto_56271 ?auto_56272 ) ) ( not ( = ?auto_56271 ?auto_56273 ) ) ( not ( = ?auto_56271 ?auto_56274 ) ) ( not ( = ?auto_56271 ?auto_56275 ) ) ( not ( = ?auto_56272 ?auto_56273 ) ) ( not ( = ?auto_56272 ?auto_56274 ) ) ( not ( = ?auto_56272 ?auto_56275 ) ) ( not ( = ?auto_56273 ?auto_56274 ) ) ( not ( = ?auto_56273 ?auto_56275 ) ) ( not ( = ?auto_56274 ?auto_56275 ) ) ( ON ?auto_56275 ?auto_56276 ) ( CLEAR ?auto_56275 ) ( not ( = ?auto_56270 ?auto_56276 ) ) ( not ( = ?auto_56271 ?auto_56276 ) ) ( not ( = ?auto_56272 ?auto_56276 ) ) ( not ( = ?auto_56273 ?auto_56276 ) ) ( not ( = ?auto_56274 ?auto_56276 ) ) ( not ( = ?auto_56275 ?auto_56276 ) ) ( HOLDING ?auto_56274 ) ( CLEAR ?auto_56273 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56270 ?auto_56271 ?auto_56272 ?auto_56273 ?auto_56274 ?auto_56275 )
      ( MAKE-5PILE ?auto_56270 ?auto_56271 ?auto_56272 ?auto_56273 ?auto_56274 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56277 - BLOCK
      ?auto_56278 - BLOCK
      ?auto_56279 - BLOCK
      ?auto_56280 - BLOCK
      ?auto_56281 - BLOCK
    )
    :vars
    (
      ?auto_56282 - BLOCK
      ?auto_56283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56277 ) ( ON ?auto_56278 ?auto_56277 ) ( ON ?auto_56279 ?auto_56278 ) ( ON ?auto_56280 ?auto_56279 ) ( not ( = ?auto_56277 ?auto_56278 ) ) ( not ( = ?auto_56277 ?auto_56279 ) ) ( not ( = ?auto_56277 ?auto_56280 ) ) ( not ( = ?auto_56277 ?auto_56281 ) ) ( not ( = ?auto_56277 ?auto_56282 ) ) ( not ( = ?auto_56278 ?auto_56279 ) ) ( not ( = ?auto_56278 ?auto_56280 ) ) ( not ( = ?auto_56278 ?auto_56281 ) ) ( not ( = ?auto_56278 ?auto_56282 ) ) ( not ( = ?auto_56279 ?auto_56280 ) ) ( not ( = ?auto_56279 ?auto_56281 ) ) ( not ( = ?auto_56279 ?auto_56282 ) ) ( not ( = ?auto_56280 ?auto_56281 ) ) ( not ( = ?auto_56280 ?auto_56282 ) ) ( not ( = ?auto_56281 ?auto_56282 ) ) ( ON ?auto_56282 ?auto_56283 ) ( not ( = ?auto_56277 ?auto_56283 ) ) ( not ( = ?auto_56278 ?auto_56283 ) ) ( not ( = ?auto_56279 ?auto_56283 ) ) ( not ( = ?auto_56280 ?auto_56283 ) ) ( not ( = ?auto_56281 ?auto_56283 ) ) ( not ( = ?auto_56282 ?auto_56283 ) ) ( CLEAR ?auto_56280 ) ( ON ?auto_56281 ?auto_56282 ) ( CLEAR ?auto_56281 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56283 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56283 ?auto_56282 )
      ( MAKE-5PILE ?auto_56277 ?auto_56278 ?auto_56279 ?auto_56280 ?auto_56281 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56284 - BLOCK
      ?auto_56285 - BLOCK
      ?auto_56286 - BLOCK
      ?auto_56287 - BLOCK
      ?auto_56288 - BLOCK
    )
    :vars
    (
      ?auto_56289 - BLOCK
      ?auto_56290 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56284 ) ( ON ?auto_56285 ?auto_56284 ) ( ON ?auto_56286 ?auto_56285 ) ( not ( = ?auto_56284 ?auto_56285 ) ) ( not ( = ?auto_56284 ?auto_56286 ) ) ( not ( = ?auto_56284 ?auto_56287 ) ) ( not ( = ?auto_56284 ?auto_56288 ) ) ( not ( = ?auto_56284 ?auto_56289 ) ) ( not ( = ?auto_56285 ?auto_56286 ) ) ( not ( = ?auto_56285 ?auto_56287 ) ) ( not ( = ?auto_56285 ?auto_56288 ) ) ( not ( = ?auto_56285 ?auto_56289 ) ) ( not ( = ?auto_56286 ?auto_56287 ) ) ( not ( = ?auto_56286 ?auto_56288 ) ) ( not ( = ?auto_56286 ?auto_56289 ) ) ( not ( = ?auto_56287 ?auto_56288 ) ) ( not ( = ?auto_56287 ?auto_56289 ) ) ( not ( = ?auto_56288 ?auto_56289 ) ) ( ON ?auto_56289 ?auto_56290 ) ( not ( = ?auto_56284 ?auto_56290 ) ) ( not ( = ?auto_56285 ?auto_56290 ) ) ( not ( = ?auto_56286 ?auto_56290 ) ) ( not ( = ?auto_56287 ?auto_56290 ) ) ( not ( = ?auto_56288 ?auto_56290 ) ) ( not ( = ?auto_56289 ?auto_56290 ) ) ( ON ?auto_56288 ?auto_56289 ) ( CLEAR ?auto_56288 ) ( ON-TABLE ?auto_56290 ) ( HOLDING ?auto_56287 ) ( CLEAR ?auto_56286 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56284 ?auto_56285 ?auto_56286 ?auto_56287 )
      ( MAKE-5PILE ?auto_56284 ?auto_56285 ?auto_56286 ?auto_56287 ?auto_56288 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56291 - BLOCK
      ?auto_56292 - BLOCK
      ?auto_56293 - BLOCK
      ?auto_56294 - BLOCK
      ?auto_56295 - BLOCK
    )
    :vars
    (
      ?auto_56296 - BLOCK
      ?auto_56297 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56291 ) ( ON ?auto_56292 ?auto_56291 ) ( ON ?auto_56293 ?auto_56292 ) ( not ( = ?auto_56291 ?auto_56292 ) ) ( not ( = ?auto_56291 ?auto_56293 ) ) ( not ( = ?auto_56291 ?auto_56294 ) ) ( not ( = ?auto_56291 ?auto_56295 ) ) ( not ( = ?auto_56291 ?auto_56296 ) ) ( not ( = ?auto_56292 ?auto_56293 ) ) ( not ( = ?auto_56292 ?auto_56294 ) ) ( not ( = ?auto_56292 ?auto_56295 ) ) ( not ( = ?auto_56292 ?auto_56296 ) ) ( not ( = ?auto_56293 ?auto_56294 ) ) ( not ( = ?auto_56293 ?auto_56295 ) ) ( not ( = ?auto_56293 ?auto_56296 ) ) ( not ( = ?auto_56294 ?auto_56295 ) ) ( not ( = ?auto_56294 ?auto_56296 ) ) ( not ( = ?auto_56295 ?auto_56296 ) ) ( ON ?auto_56296 ?auto_56297 ) ( not ( = ?auto_56291 ?auto_56297 ) ) ( not ( = ?auto_56292 ?auto_56297 ) ) ( not ( = ?auto_56293 ?auto_56297 ) ) ( not ( = ?auto_56294 ?auto_56297 ) ) ( not ( = ?auto_56295 ?auto_56297 ) ) ( not ( = ?auto_56296 ?auto_56297 ) ) ( ON ?auto_56295 ?auto_56296 ) ( ON-TABLE ?auto_56297 ) ( CLEAR ?auto_56293 ) ( ON ?auto_56294 ?auto_56295 ) ( CLEAR ?auto_56294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56297 ?auto_56296 ?auto_56295 )
      ( MAKE-5PILE ?auto_56291 ?auto_56292 ?auto_56293 ?auto_56294 ?auto_56295 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56298 - BLOCK
      ?auto_56299 - BLOCK
      ?auto_56300 - BLOCK
      ?auto_56301 - BLOCK
      ?auto_56302 - BLOCK
    )
    :vars
    (
      ?auto_56303 - BLOCK
      ?auto_56304 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56298 ) ( ON ?auto_56299 ?auto_56298 ) ( not ( = ?auto_56298 ?auto_56299 ) ) ( not ( = ?auto_56298 ?auto_56300 ) ) ( not ( = ?auto_56298 ?auto_56301 ) ) ( not ( = ?auto_56298 ?auto_56302 ) ) ( not ( = ?auto_56298 ?auto_56303 ) ) ( not ( = ?auto_56299 ?auto_56300 ) ) ( not ( = ?auto_56299 ?auto_56301 ) ) ( not ( = ?auto_56299 ?auto_56302 ) ) ( not ( = ?auto_56299 ?auto_56303 ) ) ( not ( = ?auto_56300 ?auto_56301 ) ) ( not ( = ?auto_56300 ?auto_56302 ) ) ( not ( = ?auto_56300 ?auto_56303 ) ) ( not ( = ?auto_56301 ?auto_56302 ) ) ( not ( = ?auto_56301 ?auto_56303 ) ) ( not ( = ?auto_56302 ?auto_56303 ) ) ( ON ?auto_56303 ?auto_56304 ) ( not ( = ?auto_56298 ?auto_56304 ) ) ( not ( = ?auto_56299 ?auto_56304 ) ) ( not ( = ?auto_56300 ?auto_56304 ) ) ( not ( = ?auto_56301 ?auto_56304 ) ) ( not ( = ?auto_56302 ?auto_56304 ) ) ( not ( = ?auto_56303 ?auto_56304 ) ) ( ON ?auto_56302 ?auto_56303 ) ( ON-TABLE ?auto_56304 ) ( ON ?auto_56301 ?auto_56302 ) ( CLEAR ?auto_56301 ) ( HOLDING ?auto_56300 ) ( CLEAR ?auto_56299 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56298 ?auto_56299 ?auto_56300 )
      ( MAKE-5PILE ?auto_56298 ?auto_56299 ?auto_56300 ?auto_56301 ?auto_56302 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56305 - BLOCK
      ?auto_56306 - BLOCK
      ?auto_56307 - BLOCK
      ?auto_56308 - BLOCK
      ?auto_56309 - BLOCK
    )
    :vars
    (
      ?auto_56311 - BLOCK
      ?auto_56310 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56305 ) ( ON ?auto_56306 ?auto_56305 ) ( not ( = ?auto_56305 ?auto_56306 ) ) ( not ( = ?auto_56305 ?auto_56307 ) ) ( not ( = ?auto_56305 ?auto_56308 ) ) ( not ( = ?auto_56305 ?auto_56309 ) ) ( not ( = ?auto_56305 ?auto_56311 ) ) ( not ( = ?auto_56306 ?auto_56307 ) ) ( not ( = ?auto_56306 ?auto_56308 ) ) ( not ( = ?auto_56306 ?auto_56309 ) ) ( not ( = ?auto_56306 ?auto_56311 ) ) ( not ( = ?auto_56307 ?auto_56308 ) ) ( not ( = ?auto_56307 ?auto_56309 ) ) ( not ( = ?auto_56307 ?auto_56311 ) ) ( not ( = ?auto_56308 ?auto_56309 ) ) ( not ( = ?auto_56308 ?auto_56311 ) ) ( not ( = ?auto_56309 ?auto_56311 ) ) ( ON ?auto_56311 ?auto_56310 ) ( not ( = ?auto_56305 ?auto_56310 ) ) ( not ( = ?auto_56306 ?auto_56310 ) ) ( not ( = ?auto_56307 ?auto_56310 ) ) ( not ( = ?auto_56308 ?auto_56310 ) ) ( not ( = ?auto_56309 ?auto_56310 ) ) ( not ( = ?auto_56311 ?auto_56310 ) ) ( ON ?auto_56309 ?auto_56311 ) ( ON-TABLE ?auto_56310 ) ( ON ?auto_56308 ?auto_56309 ) ( CLEAR ?auto_56306 ) ( ON ?auto_56307 ?auto_56308 ) ( CLEAR ?auto_56307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56310 ?auto_56311 ?auto_56309 ?auto_56308 )
      ( MAKE-5PILE ?auto_56305 ?auto_56306 ?auto_56307 ?auto_56308 ?auto_56309 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56312 - BLOCK
      ?auto_56313 - BLOCK
      ?auto_56314 - BLOCK
      ?auto_56315 - BLOCK
      ?auto_56316 - BLOCK
    )
    :vars
    (
      ?auto_56318 - BLOCK
      ?auto_56317 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56312 ) ( not ( = ?auto_56312 ?auto_56313 ) ) ( not ( = ?auto_56312 ?auto_56314 ) ) ( not ( = ?auto_56312 ?auto_56315 ) ) ( not ( = ?auto_56312 ?auto_56316 ) ) ( not ( = ?auto_56312 ?auto_56318 ) ) ( not ( = ?auto_56313 ?auto_56314 ) ) ( not ( = ?auto_56313 ?auto_56315 ) ) ( not ( = ?auto_56313 ?auto_56316 ) ) ( not ( = ?auto_56313 ?auto_56318 ) ) ( not ( = ?auto_56314 ?auto_56315 ) ) ( not ( = ?auto_56314 ?auto_56316 ) ) ( not ( = ?auto_56314 ?auto_56318 ) ) ( not ( = ?auto_56315 ?auto_56316 ) ) ( not ( = ?auto_56315 ?auto_56318 ) ) ( not ( = ?auto_56316 ?auto_56318 ) ) ( ON ?auto_56318 ?auto_56317 ) ( not ( = ?auto_56312 ?auto_56317 ) ) ( not ( = ?auto_56313 ?auto_56317 ) ) ( not ( = ?auto_56314 ?auto_56317 ) ) ( not ( = ?auto_56315 ?auto_56317 ) ) ( not ( = ?auto_56316 ?auto_56317 ) ) ( not ( = ?auto_56318 ?auto_56317 ) ) ( ON ?auto_56316 ?auto_56318 ) ( ON-TABLE ?auto_56317 ) ( ON ?auto_56315 ?auto_56316 ) ( ON ?auto_56314 ?auto_56315 ) ( CLEAR ?auto_56314 ) ( HOLDING ?auto_56313 ) ( CLEAR ?auto_56312 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56312 ?auto_56313 )
      ( MAKE-5PILE ?auto_56312 ?auto_56313 ?auto_56314 ?auto_56315 ?auto_56316 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56319 - BLOCK
      ?auto_56320 - BLOCK
      ?auto_56321 - BLOCK
      ?auto_56322 - BLOCK
      ?auto_56323 - BLOCK
    )
    :vars
    (
      ?auto_56324 - BLOCK
      ?auto_56325 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56319 ) ( not ( = ?auto_56319 ?auto_56320 ) ) ( not ( = ?auto_56319 ?auto_56321 ) ) ( not ( = ?auto_56319 ?auto_56322 ) ) ( not ( = ?auto_56319 ?auto_56323 ) ) ( not ( = ?auto_56319 ?auto_56324 ) ) ( not ( = ?auto_56320 ?auto_56321 ) ) ( not ( = ?auto_56320 ?auto_56322 ) ) ( not ( = ?auto_56320 ?auto_56323 ) ) ( not ( = ?auto_56320 ?auto_56324 ) ) ( not ( = ?auto_56321 ?auto_56322 ) ) ( not ( = ?auto_56321 ?auto_56323 ) ) ( not ( = ?auto_56321 ?auto_56324 ) ) ( not ( = ?auto_56322 ?auto_56323 ) ) ( not ( = ?auto_56322 ?auto_56324 ) ) ( not ( = ?auto_56323 ?auto_56324 ) ) ( ON ?auto_56324 ?auto_56325 ) ( not ( = ?auto_56319 ?auto_56325 ) ) ( not ( = ?auto_56320 ?auto_56325 ) ) ( not ( = ?auto_56321 ?auto_56325 ) ) ( not ( = ?auto_56322 ?auto_56325 ) ) ( not ( = ?auto_56323 ?auto_56325 ) ) ( not ( = ?auto_56324 ?auto_56325 ) ) ( ON ?auto_56323 ?auto_56324 ) ( ON-TABLE ?auto_56325 ) ( ON ?auto_56322 ?auto_56323 ) ( ON ?auto_56321 ?auto_56322 ) ( CLEAR ?auto_56319 ) ( ON ?auto_56320 ?auto_56321 ) ( CLEAR ?auto_56320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56325 ?auto_56324 ?auto_56323 ?auto_56322 ?auto_56321 )
      ( MAKE-5PILE ?auto_56319 ?auto_56320 ?auto_56321 ?auto_56322 ?auto_56323 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56326 - BLOCK
      ?auto_56327 - BLOCK
      ?auto_56328 - BLOCK
      ?auto_56329 - BLOCK
      ?auto_56330 - BLOCK
    )
    :vars
    (
      ?auto_56332 - BLOCK
      ?auto_56331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56326 ?auto_56327 ) ) ( not ( = ?auto_56326 ?auto_56328 ) ) ( not ( = ?auto_56326 ?auto_56329 ) ) ( not ( = ?auto_56326 ?auto_56330 ) ) ( not ( = ?auto_56326 ?auto_56332 ) ) ( not ( = ?auto_56327 ?auto_56328 ) ) ( not ( = ?auto_56327 ?auto_56329 ) ) ( not ( = ?auto_56327 ?auto_56330 ) ) ( not ( = ?auto_56327 ?auto_56332 ) ) ( not ( = ?auto_56328 ?auto_56329 ) ) ( not ( = ?auto_56328 ?auto_56330 ) ) ( not ( = ?auto_56328 ?auto_56332 ) ) ( not ( = ?auto_56329 ?auto_56330 ) ) ( not ( = ?auto_56329 ?auto_56332 ) ) ( not ( = ?auto_56330 ?auto_56332 ) ) ( ON ?auto_56332 ?auto_56331 ) ( not ( = ?auto_56326 ?auto_56331 ) ) ( not ( = ?auto_56327 ?auto_56331 ) ) ( not ( = ?auto_56328 ?auto_56331 ) ) ( not ( = ?auto_56329 ?auto_56331 ) ) ( not ( = ?auto_56330 ?auto_56331 ) ) ( not ( = ?auto_56332 ?auto_56331 ) ) ( ON ?auto_56330 ?auto_56332 ) ( ON-TABLE ?auto_56331 ) ( ON ?auto_56329 ?auto_56330 ) ( ON ?auto_56328 ?auto_56329 ) ( ON ?auto_56327 ?auto_56328 ) ( CLEAR ?auto_56327 ) ( HOLDING ?auto_56326 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56326 )
      ( MAKE-5PILE ?auto_56326 ?auto_56327 ?auto_56328 ?auto_56329 ?auto_56330 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_56333 - BLOCK
      ?auto_56334 - BLOCK
      ?auto_56335 - BLOCK
      ?auto_56336 - BLOCK
      ?auto_56337 - BLOCK
    )
    :vars
    (
      ?auto_56339 - BLOCK
      ?auto_56338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56333 ?auto_56334 ) ) ( not ( = ?auto_56333 ?auto_56335 ) ) ( not ( = ?auto_56333 ?auto_56336 ) ) ( not ( = ?auto_56333 ?auto_56337 ) ) ( not ( = ?auto_56333 ?auto_56339 ) ) ( not ( = ?auto_56334 ?auto_56335 ) ) ( not ( = ?auto_56334 ?auto_56336 ) ) ( not ( = ?auto_56334 ?auto_56337 ) ) ( not ( = ?auto_56334 ?auto_56339 ) ) ( not ( = ?auto_56335 ?auto_56336 ) ) ( not ( = ?auto_56335 ?auto_56337 ) ) ( not ( = ?auto_56335 ?auto_56339 ) ) ( not ( = ?auto_56336 ?auto_56337 ) ) ( not ( = ?auto_56336 ?auto_56339 ) ) ( not ( = ?auto_56337 ?auto_56339 ) ) ( ON ?auto_56339 ?auto_56338 ) ( not ( = ?auto_56333 ?auto_56338 ) ) ( not ( = ?auto_56334 ?auto_56338 ) ) ( not ( = ?auto_56335 ?auto_56338 ) ) ( not ( = ?auto_56336 ?auto_56338 ) ) ( not ( = ?auto_56337 ?auto_56338 ) ) ( not ( = ?auto_56339 ?auto_56338 ) ) ( ON ?auto_56337 ?auto_56339 ) ( ON-TABLE ?auto_56338 ) ( ON ?auto_56336 ?auto_56337 ) ( ON ?auto_56335 ?auto_56336 ) ( ON ?auto_56334 ?auto_56335 ) ( ON ?auto_56333 ?auto_56334 ) ( CLEAR ?auto_56333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56338 ?auto_56339 ?auto_56337 ?auto_56336 ?auto_56335 ?auto_56334 )
      ( MAKE-5PILE ?auto_56333 ?auto_56334 ?auto_56335 ?auto_56336 ?auto_56337 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56341 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_56341 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_56341 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56342 - BLOCK
    )
    :vars
    (
      ?auto_56343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56342 ?auto_56343 ) ( CLEAR ?auto_56342 ) ( HAND-EMPTY ) ( not ( = ?auto_56342 ?auto_56343 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56342 ?auto_56343 )
      ( MAKE-1PILE ?auto_56342 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56344 - BLOCK
    )
    :vars
    (
      ?auto_56345 - BLOCK
      ?auto_56347 - BLOCK
      ?auto_56349 - BLOCK
      ?auto_56346 - BLOCK
      ?auto_56348 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56344 ?auto_56345 ) ) ( HOLDING ?auto_56344 ) ( CLEAR ?auto_56345 ) ( ON-TABLE ?auto_56347 ) ( ON ?auto_56349 ?auto_56347 ) ( ON ?auto_56346 ?auto_56349 ) ( ON ?auto_56348 ?auto_56346 ) ( ON ?auto_56345 ?auto_56348 ) ( not ( = ?auto_56347 ?auto_56349 ) ) ( not ( = ?auto_56347 ?auto_56346 ) ) ( not ( = ?auto_56347 ?auto_56348 ) ) ( not ( = ?auto_56347 ?auto_56345 ) ) ( not ( = ?auto_56347 ?auto_56344 ) ) ( not ( = ?auto_56349 ?auto_56346 ) ) ( not ( = ?auto_56349 ?auto_56348 ) ) ( not ( = ?auto_56349 ?auto_56345 ) ) ( not ( = ?auto_56349 ?auto_56344 ) ) ( not ( = ?auto_56346 ?auto_56348 ) ) ( not ( = ?auto_56346 ?auto_56345 ) ) ( not ( = ?auto_56346 ?auto_56344 ) ) ( not ( = ?auto_56348 ?auto_56345 ) ) ( not ( = ?auto_56348 ?auto_56344 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56347 ?auto_56349 ?auto_56346 ?auto_56348 ?auto_56345 ?auto_56344 )
      ( MAKE-1PILE ?auto_56344 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56350 - BLOCK
    )
    :vars
    (
      ?auto_56355 - BLOCK
      ?auto_56351 - BLOCK
      ?auto_56354 - BLOCK
      ?auto_56352 - BLOCK
      ?auto_56353 - BLOCK
      ?auto_56356 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56350 ?auto_56355 ) ) ( CLEAR ?auto_56355 ) ( ON-TABLE ?auto_56351 ) ( ON ?auto_56354 ?auto_56351 ) ( ON ?auto_56352 ?auto_56354 ) ( ON ?auto_56353 ?auto_56352 ) ( ON ?auto_56355 ?auto_56353 ) ( not ( = ?auto_56351 ?auto_56354 ) ) ( not ( = ?auto_56351 ?auto_56352 ) ) ( not ( = ?auto_56351 ?auto_56353 ) ) ( not ( = ?auto_56351 ?auto_56355 ) ) ( not ( = ?auto_56351 ?auto_56350 ) ) ( not ( = ?auto_56354 ?auto_56352 ) ) ( not ( = ?auto_56354 ?auto_56353 ) ) ( not ( = ?auto_56354 ?auto_56355 ) ) ( not ( = ?auto_56354 ?auto_56350 ) ) ( not ( = ?auto_56352 ?auto_56353 ) ) ( not ( = ?auto_56352 ?auto_56355 ) ) ( not ( = ?auto_56352 ?auto_56350 ) ) ( not ( = ?auto_56353 ?auto_56355 ) ) ( not ( = ?auto_56353 ?auto_56350 ) ) ( ON ?auto_56350 ?auto_56356 ) ( CLEAR ?auto_56350 ) ( HAND-EMPTY ) ( not ( = ?auto_56350 ?auto_56356 ) ) ( not ( = ?auto_56355 ?auto_56356 ) ) ( not ( = ?auto_56351 ?auto_56356 ) ) ( not ( = ?auto_56354 ?auto_56356 ) ) ( not ( = ?auto_56352 ?auto_56356 ) ) ( not ( = ?auto_56353 ?auto_56356 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56350 ?auto_56356 )
      ( MAKE-1PILE ?auto_56350 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56357 - BLOCK
    )
    :vars
    (
      ?auto_56358 - BLOCK
      ?auto_56361 - BLOCK
      ?auto_56363 - BLOCK
      ?auto_56362 - BLOCK
      ?auto_56359 - BLOCK
      ?auto_56360 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56357 ?auto_56358 ) ) ( ON-TABLE ?auto_56361 ) ( ON ?auto_56363 ?auto_56361 ) ( ON ?auto_56362 ?auto_56363 ) ( ON ?auto_56359 ?auto_56362 ) ( not ( = ?auto_56361 ?auto_56363 ) ) ( not ( = ?auto_56361 ?auto_56362 ) ) ( not ( = ?auto_56361 ?auto_56359 ) ) ( not ( = ?auto_56361 ?auto_56358 ) ) ( not ( = ?auto_56361 ?auto_56357 ) ) ( not ( = ?auto_56363 ?auto_56362 ) ) ( not ( = ?auto_56363 ?auto_56359 ) ) ( not ( = ?auto_56363 ?auto_56358 ) ) ( not ( = ?auto_56363 ?auto_56357 ) ) ( not ( = ?auto_56362 ?auto_56359 ) ) ( not ( = ?auto_56362 ?auto_56358 ) ) ( not ( = ?auto_56362 ?auto_56357 ) ) ( not ( = ?auto_56359 ?auto_56358 ) ) ( not ( = ?auto_56359 ?auto_56357 ) ) ( ON ?auto_56357 ?auto_56360 ) ( CLEAR ?auto_56357 ) ( not ( = ?auto_56357 ?auto_56360 ) ) ( not ( = ?auto_56358 ?auto_56360 ) ) ( not ( = ?auto_56361 ?auto_56360 ) ) ( not ( = ?auto_56363 ?auto_56360 ) ) ( not ( = ?auto_56362 ?auto_56360 ) ) ( not ( = ?auto_56359 ?auto_56360 ) ) ( HOLDING ?auto_56358 ) ( CLEAR ?auto_56359 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56361 ?auto_56363 ?auto_56362 ?auto_56359 ?auto_56358 )
      ( MAKE-1PILE ?auto_56357 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56364 - BLOCK
    )
    :vars
    (
      ?auto_56370 - BLOCK
      ?auto_56369 - BLOCK
      ?auto_56365 - BLOCK
      ?auto_56367 - BLOCK
      ?auto_56368 - BLOCK
      ?auto_56366 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56364 ?auto_56370 ) ) ( ON-TABLE ?auto_56369 ) ( ON ?auto_56365 ?auto_56369 ) ( ON ?auto_56367 ?auto_56365 ) ( ON ?auto_56368 ?auto_56367 ) ( not ( = ?auto_56369 ?auto_56365 ) ) ( not ( = ?auto_56369 ?auto_56367 ) ) ( not ( = ?auto_56369 ?auto_56368 ) ) ( not ( = ?auto_56369 ?auto_56370 ) ) ( not ( = ?auto_56369 ?auto_56364 ) ) ( not ( = ?auto_56365 ?auto_56367 ) ) ( not ( = ?auto_56365 ?auto_56368 ) ) ( not ( = ?auto_56365 ?auto_56370 ) ) ( not ( = ?auto_56365 ?auto_56364 ) ) ( not ( = ?auto_56367 ?auto_56368 ) ) ( not ( = ?auto_56367 ?auto_56370 ) ) ( not ( = ?auto_56367 ?auto_56364 ) ) ( not ( = ?auto_56368 ?auto_56370 ) ) ( not ( = ?auto_56368 ?auto_56364 ) ) ( ON ?auto_56364 ?auto_56366 ) ( not ( = ?auto_56364 ?auto_56366 ) ) ( not ( = ?auto_56370 ?auto_56366 ) ) ( not ( = ?auto_56369 ?auto_56366 ) ) ( not ( = ?auto_56365 ?auto_56366 ) ) ( not ( = ?auto_56367 ?auto_56366 ) ) ( not ( = ?auto_56368 ?auto_56366 ) ) ( CLEAR ?auto_56368 ) ( ON ?auto_56370 ?auto_56364 ) ( CLEAR ?auto_56370 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56366 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56366 ?auto_56364 )
      ( MAKE-1PILE ?auto_56364 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56371 - BLOCK
    )
    :vars
    (
      ?auto_56374 - BLOCK
      ?auto_56373 - BLOCK
      ?auto_56375 - BLOCK
      ?auto_56377 - BLOCK
      ?auto_56372 - BLOCK
      ?auto_56376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56371 ?auto_56374 ) ) ( ON-TABLE ?auto_56373 ) ( ON ?auto_56375 ?auto_56373 ) ( ON ?auto_56377 ?auto_56375 ) ( not ( = ?auto_56373 ?auto_56375 ) ) ( not ( = ?auto_56373 ?auto_56377 ) ) ( not ( = ?auto_56373 ?auto_56372 ) ) ( not ( = ?auto_56373 ?auto_56374 ) ) ( not ( = ?auto_56373 ?auto_56371 ) ) ( not ( = ?auto_56375 ?auto_56377 ) ) ( not ( = ?auto_56375 ?auto_56372 ) ) ( not ( = ?auto_56375 ?auto_56374 ) ) ( not ( = ?auto_56375 ?auto_56371 ) ) ( not ( = ?auto_56377 ?auto_56372 ) ) ( not ( = ?auto_56377 ?auto_56374 ) ) ( not ( = ?auto_56377 ?auto_56371 ) ) ( not ( = ?auto_56372 ?auto_56374 ) ) ( not ( = ?auto_56372 ?auto_56371 ) ) ( ON ?auto_56371 ?auto_56376 ) ( not ( = ?auto_56371 ?auto_56376 ) ) ( not ( = ?auto_56374 ?auto_56376 ) ) ( not ( = ?auto_56373 ?auto_56376 ) ) ( not ( = ?auto_56375 ?auto_56376 ) ) ( not ( = ?auto_56377 ?auto_56376 ) ) ( not ( = ?auto_56372 ?auto_56376 ) ) ( ON ?auto_56374 ?auto_56371 ) ( CLEAR ?auto_56374 ) ( ON-TABLE ?auto_56376 ) ( HOLDING ?auto_56372 ) ( CLEAR ?auto_56377 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56373 ?auto_56375 ?auto_56377 ?auto_56372 )
      ( MAKE-1PILE ?auto_56371 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56378 - BLOCK
    )
    :vars
    (
      ?auto_56383 - BLOCK
      ?auto_56382 - BLOCK
      ?auto_56384 - BLOCK
      ?auto_56380 - BLOCK
      ?auto_56381 - BLOCK
      ?auto_56379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56378 ?auto_56383 ) ) ( ON-TABLE ?auto_56382 ) ( ON ?auto_56384 ?auto_56382 ) ( ON ?auto_56380 ?auto_56384 ) ( not ( = ?auto_56382 ?auto_56384 ) ) ( not ( = ?auto_56382 ?auto_56380 ) ) ( not ( = ?auto_56382 ?auto_56381 ) ) ( not ( = ?auto_56382 ?auto_56383 ) ) ( not ( = ?auto_56382 ?auto_56378 ) ) ( not ( = ?auto_56384 ?auto_56380 ) ) ( not ( = ?auto_56384 ?auto_56381 ) ) ( not ( = ?auto_56384 ?auto_56383 ) ) ( not ( = ?auto_56384 ?auto_56378 ) ) ( not ( = ?auto_56380 ?auto_56381 ) ) ( not ( = ?auto_56380 ?auto_56383 ) ) ( not ( = ?auto_56380 ?auto_56378 ) ) ( not ( = ?auto_56381 ?auto_56383 ) ) ( not ( = ?auto_56381 ?auto_56378 ) ) ( ON ?auto_56378 ?auto_56379 ) ( not ( = ?auto_56378 ?auto_56379 ) ) ( not ( = ?auto_56383 ?auto_56379 ) ) ( not ( = ?auto_56382 ?auto_56379 ) ) ( not ( = ?auto_56384 ?auto_56379 ) ) ( not ( = ?auto_56380 ?auto_56379 ) ) ( not ( = ?auto_56381 ?auto_56379 ) ) ( ON ?auto_56383 ?auto_56378 ) ( ON-TABLE ?auto_56379 ) ( CLEAR ?auto_56380 ) ( ON ?auto_56381 ?auto_56383 ) ( CLEAR ?auto_56381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56379 ?auto_56378 ?auto_56383 )
      ( MAKE-1PILE ?auto_56378 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56385 - BLOCK
    )
    :vars
    (
      ?auto_56386 - BLOCK
      ?auto_56391 - BLOCK
      ?auto_56387 - BLOCK
      ?auto_56388 - BLOCK
      ?auto_56390 - BLOCK
      ?auto_56389 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56385 ?auto_56386 ) ) ( ON-TABLE ?auto_56391 ) ( ON ?auto_56387 ?auto_56391 ) ( not ( = ?auto_56391 ?auto_56387 ) ) ( not ( = ?auto_56391 ?auto_56388 ) ) ( not ( = ?auto_56391 ?auto_56390 ) ) ( not ( = ?auto_56391 ?auto_56386 ) ) ( not ( = ?auto_56391 ?auto_56385 ) ) ( not ( = ?auto_56387 ?auto_56388 ) ) ( not ( = ?auto_56387 ?auto_56390 ) ) ( not ( = ?auto_56387 ?auto_56386 ) ) ( not ( = ?auto_56387 ?auto_56385 ) ) ( not ( = ?auto_56388 ?auto_56390 ) ) ( not ( = ?auto_56388 ?auto_56386 ) ) ( not ( = ?auto_56388 ?auto_56385 ) ) ( not ( = ?auto_56390 ?auto_56386 ) ) ( not ( = ?auto_56390 ?auto_56385 ) ) ( ON ?auto_56385 ?auto_56389 ) ( not ( = ?auto_56385 ?auto_56389 ) ) ( not ( = ?auto_56386 ?auto_56389 ) ) ( not ( = ?auto_56391 ?auto_56389 ) ) ( not ( = ?auto_56387 ?auto_56389 ) ) ( not ( = ?auto_56388 ?auto_56389 ) ) ( not ( = ?auto_56390 ?auto_56389 ) ) ( ON ?auto_56386 ?auto_56385 ) ( ON-TABLE ?auto_56389 ) ( ON ?auto_56390 ?auto_56386 ) ( CLEAR ?auto_56390 ) ( HOLDING ?auto_56388 ) ( CLEAR ?auto_56387 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56391 ?auto_56387 ?auto_56388 )
      ( MAKE-1PILE ?auto_56385 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56392 - BLOCK
    )
    :vars
    (
      ?auto_56393 - BLOCK
      ?auto_56394 - BLOCK
      ?auto_56395 - BLOCK
      ?auto_56398 - BLOCK
      ?auto_56396 - BLOCK
      ?auto_56397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56392 ?auto_56393 ) ) ( ON-TABLE ?auto_56394 ) ( ON ?auto_56395 ?auto_56394 ) ( not ( = ?auto_56394 ?auto_56395 ) ) ( not ( = ?auto_56394 ?auto_56398 ) ) ( not ( = ?auto_56394 ?auto_56396 ) ) ( not ( = ?auto_56394 ?auto_56393 ) ) ( not ( = ?auto_56394 ?auto_56392 ) ) ( not ( = ?auto_56395 ?auto_56398 ) ) ( not ( = ?auto_56395 ?auto_56396 ) ) ( not ( = ?auto_56395 ?auto_56393 ) ) ( not ( = ?auto_56395 ?auto_56392 ) ) ( not ( = ?auto_56398 ?auto_56396 ) ) ( not ( = ?auto_56398 ?auto_56393 ) ) ( not ( = ?auto_56398 ?auto_56392 ) ) ( not ( = ?auto_56396 ?auto_56393 ) ) ( not ( = ?auto_56396 ?auto_56392 ) ) ( ON ?auto_56392 ?auto_56397 ) ( not ( = ?auto_56392 ?auto_56397 ) ) ( not ( = ?auto_56393 ?auto_56397 ) ) ( not ( = ?auto_56394 ?auto_56397 ) ) ( not ( = ?auto_56395 ?auto_56397 ) ) ( not ( = ?auto_56398 ?auto_56397 ) ) ( not ( = ?auto_56396 ?auto_56397 ) ) ( ON ?auto_56393 ?auto_56392 ) ( ON-TABLE ?auto_56397 ) ( ON ?auto_56396 ?auto_56393 ) ( CLEAR ?auto_56395 ) ( ON ?auto_56398 ?auto_56396 ) ( CLEAR ?auto_56398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56397 ?auto_56392 ?auto_56393 ?auto_56396 )
      ( MAKE-1PILE ?auto_56392 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56399 - BLOCK
    )
    :vars
    (
      ?auto_56402 - BLOCK
      ?auto_56405 - BLOCK
      ?auto_56404 - BLOCK
      ?auto_56400 - BLOCK
      ?auto_56401 - BLOCK
      ?auto_56403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56399 ?auto_56402 ) ) ( ON-TABLE ?auto_56405 ) ( not ( = ?auto_56405 ?auto_56404 ) ) ( not ( = ?auto_56405 ?auto_56400 ) ) ( not ( = ?auto_56405 ?auto_56401 ) ) ( not ( = ?auto_56405 ?auto_56402 ) ) ( not ( = ?auto_56405 ?auto_56399 ) ) ( not ( = ?auto_56404 ?auto_56400 ) ) ( not ( = ?auto_56404 ?auto_56401 ) ) ( not ( = ?auto_56404 ?auto_56402 ) ) ( not ( = ?auto_56404 ?auto_56399 ) ) ( not ( = ?auto_56400 ?auto_56401 ) ) ( not ( = ?auto_56400 ?auto_56402 ) ) ( not ( = ?auto_56400 ?auto_56399 ) ) ( not ( = ?auto_56401 ?auto_56402 ) ) ( not ( = ?auto_56401 ?auto_56399 ) ) ( ON ?auto_56399 ?auto_56403 ) ( not ( = ?auto_56399 ?auto_56403 ) ) ( not ( = ?auto_56402 ?auto_56403 ) ) ( not ( = ?auto_56405 ?auto_56403 ) ) ( not ( = ?auto_56404 ?auto_56403 ) ) ( not ( = ?auto_56400 ?auto_56403 ) ) ( not ( = ?auto_56401 ?auto_56403 ) ) ( ON ?auto_56402 ?auto_56399 ) ( ON-TABLE ?auto_56403 ) ( ON ?auto_56401 ?auto_56402 ) ( ON ?auto_56400 ?auto_56401 ) ( CLEAR ?auto_56400 ) ( HOLDING ?auto_56404 ) ( CLEAR ?auto_56405 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56405 ?auto_56404 )
      ( MAKE-1PILE ?auto_56399 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56406 - BLOCK
    )
    :vars
    (
      ?auto_56409 - BLOCK
      ?auto_56408 - BLOCK
      ?auto_56407 - BLOCK
      ?auto_56412 - BLOCK
      ?auto_56410 - BLOCK
      ?auto_56411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56406 ?auto_56409 ) ) ( ON-TABLE ?auto_56408 ) ( not ( = ?auto_56408 ?auto_56407 ) ) ( not ( = ?auto_56408 ?auto_56412 ) ) ( not ( = ?auto_56408 ?auto_56410 ) ) ( not ( = ?auto_56408 ?auto_56409 ) ) ( not ( = ?auto_56408 ?auto_56406 ) ) ( not ( = ?auto_56407 ?auto_56412 ) ) ( not ( = ?auto_56407 ?auto_56410 ) ) ( not ( = ?auto_56407 ?auto_56409 ) ) ( not ( = ?auto_56407 ?auto_56406 ) ) ( not ( = ?auto_56412 ?auto_56410 ) ) ( not ( = ?auto_56412 ?auto_56409 ) ) ( not ( = ?auto_56412 ?auto_56406 ) ) ( not ( = ?auto_56410 ?auto_56409 ) ) ( not ( = ?auto_56410 ?auto_56406 ) ) ( ON ?auto_56406 ?auto_56411 ) ( not ( = ?auto_56406 ?auto_56411 ) ) ( not ( = ?auto_56409 ?auto_56411 ) ) ( not ( = ?auto_56408 ?auto_56411 ) ) ( not ( = ?auto_56407 ?auto_56411 ) ) ( not ( = ?auto_56412 ?auto_56411 ) ) ( not ( = ?auto_56410 ?auto_56411 ) ) ( ON ?auto_56409 ?auto_56406 ) ( ON-TABLE ?auto_56411 ) ( ON ?auto_56410 ?auto_56409 ) ( ON ?auto_56412 ?auto_56410 ) ( CLEAR ?auto_56408 ) ( ON ?auto_56407 ?auto_56412 ) ( CLEAR ?auto_56407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56411 ?auto_56406 ?auto_56409 ?auto_56410 ?auto_56412 )
      ( MAKE-1PILE ?auto_56406 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56413 - BLOCK
    )
    :vars
    (
      ?auto_56417 - BLOCK
      ?auto_56416 - BLOCK
      ?auto_56414 - BLOCK
      ?auto_56419 - BLOCK
      ?auto_56418 - BLOCK
      ?auto_56415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56413 ?auto_56417 ) ) ( not ( = ?auto_56416 ?auto_56414 ) ) ( not ( = ?auto_56416 ?auto_56419 ) ) ( not ( = ?auto_56416 ?auto_56418 ) ) ( not ( = ?auto_56416 ?auto_56417 ) ) ( not ( = ?auto_56416 ?auto_56413 ) ) ( not ( = ?auto_56414 ?auto_56419 ) ) ( not ( = ?auto_56414 ?auto_56418 ) ) ( not ( = ?auto_56414 ?auto_56417 ) ) ( not ( = ?auto_56414 ?auto_56413 ) ) ( not ( = ?auto_56419 ?auto_56418 ) ) ( not ( = ?auto_56419 ?auto_56417 ) ) ( not ( = ?auto_56419 ?auto_56413 ) ) ( not ( = ?auto_56418 ?auto_56417 ) ) ( not ( = ?auto_56418 ?auto_56413 ) ) ( ON ?auto_56413 ?auto_56415 ) ( not ( = ?auto_56413 ?auto_56415 ) ) ( not ( = ?auto_56417 ?auto_56415 ) ) ( not ( = ?auto_56416 ?auto_56415 ) ) ( not ( = ?auto_56414 ?auto_56415 ) ) ( not ( = ?auto_56419 ?auto_56415 ) ) ( not ( = ?auto_56418 ?auto_56415 ) ) ( ON ?auto_56417 ?auto_56413 ) ( ON-TABLE ?auto_56415 ) ( ON ?auto_56418 ?auto_56417 ) ( ON ?auto_56419 ?auto_56418 ) ( ON ?auto_56414 ?auto_56419 ) ( CLEAR ?auto_56414 ) ( HOLDING ?auto_56416 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56416 )
      ( MAKE-1PILE ?auto_56413 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_56420 - BLOCK
    )
    :vars
    (
      ?auto_56425 - BLOCK
      ?auto_56421 - BLOCK
      ?auto_56422 - BLOCK
      ?auto_56426 - BLOCK
      ?auto_56423 - BLOCK
      ?auto_56424 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56420 ?auto_56425 ) ) ( not ( = ?auto_56421 ?auto_56422 ) ) ( not ( = ?auto_56421 ?auto_56426 ) ) ( not ( = ?auto_56421 ?auto_56423 ) ) ( not ( = ?auto_56421 ?auto_56425 ) ) ( not ( = ?auto_56421 ?auto_56420 ) ) ( not ( = ?auto_56422 ?auto_56426 ) ) ( not ( = ?auto_56422 ?auto_56423 ) ) ( not ( = ?auto_56422 ?auto_56425 ) ) ( not ( = ?auto_56422 ?auto_56420 ) ) ( not ( = ?auto_56426 ?auto_56423 ) ) ( not ( = ?auto_56426 ?auto_56425 ) ) ( not ( = ?auto_56426 ?auto_56420 ) ) ( not ( = ?auto_56423 ?auto_56425 ) ) ( not ( = ?auto_56423 ?auto_56420 ) ) ( ON ?auto_56420 ?auto_56424 ) ( not ( = ?auto_56420 ?auto_56424 ) ) ( not ( = ?auto_56425 ?auto_56424 ) ) ( not ( = ?auto_56421 ?auto_56424 ) ) ( not ( = ?auto_56422 ?auto_56424 ) ) ( not ( = ?auto_56426 ?auto_56424 ) ) ( not ( = ?auto_56423 ?auto_56424 ) ) ( ON ?auto_56425 ?auto_56420 ) ( ON-TABLE ?auto_56424 ) ( ON ?auto_56423 ?auto_56425 ) ( ON ?auto_56426 ?auto_56423 ) ( ON ?auto_56422 ?auto_56426 ) ( ON ?auto_56421 ?auto_56422 ) ( CLEAR ?auto_56421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56424 ?auto_56420 ?auto_56425 ?auto_56423 ?auto_56426 ?auto_56422 )
      ( MAKE-1PILE ?auto_56420 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56431 - BLOCK
      ?auto_56432 - BLOCK
      ?auto_56433 - BLOCK
      ?auto_56434 - BLOCK
    )
    :vars
    (
      ?auto_56435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56435 ?auto_56434 ) ( CLEAR ?auto_56435 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56431 ) ( ON ?auto_56432 ?auto_56431 ) ( ON ?auto_56433 ?auto_56432 ) ( ON ?auto_56434 ?auto_56433 ) ( not ( = ?auto_56431 ?auto_56432 ) ) ( not ( = ?auto_56431 ?auto_56433 ) ) ( not ( = ?auto_56431 ?auto_56434 ) ) ( not ( = ?auto_56431 ?auto_56435 ) ) ( not ( = ?auto_56432 ?auto_56433 ) ) ( not ( = ?auto_56432 ?auto_56434 ) ) ( not ( = ?auto_56432 ?auto_56435 ) ) ( not ( = ?auto_56433 ?auto_56434 ) ) ( not ( = ?auto_56433 ?auto_56435 ) ) ( not ( = ?auto_56434 ?auto_56435 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56435 ?auto_56434 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56436 - BLOCK
      ?auto_56437 - BLOCK
      ?auto_56438 - BLOCK
      ?auto_56439 - BLOCK
    )
    :vars
    (
      ?auto_56440 - BLOCK
      ?auto_56441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56440 ?auto_56439 ) ( CLEAR ?auto_56440 ) ( ON-TABLE ?auto_56436 ) ( ON ?auto_56437 ?auto_56436 ) ( ON ?auto_56438 ?auto_56437 ) ( ON ?auto_56439 ?auto_56438 ) ( not ( = ?auto_56436 ?auto_56437 ) ) ( not ( = ?auto_56436 ?auto_56438 ) ) ( not ( = ?auto_56436 ?auto_56439 ) ) ( not ( = ?auto_56436 ?auto_56440 ) ) ( not ( = ?auto_56437 ?auto_56438 ) ) ( not ( = ?auto_56437 ?auto_56439 ) ) ( not ( = ?auto_56437 ?auto_56440 ) ) ( not ( = ?auto_56438 ?auto_56439 ) ) ( not ( = ?auto_56438 ?auto_56440 ) ) ( not ( = ?auto_56439 ?auto_56440 ) ) ( HOLDING ?auto_56441 ) ( not ( = ?auto_56436 ?auto_56441 ) ) ( not ( = ?auto_56437 ?auto_56441 ) ) ( not ( = ?auto_56438 ?auto_56441 ) ) ( not ( = ?auto_56439 ?auto_56441 ) ) ( not ( = ?auto_56440 ?auto_56441 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_56441 )
      ( MAKE-4PILE ?auto_56436 ?auto_56437 ?auto_56438 ?auto_56439 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56442 - BLOCK
      ?auto_56443 - BLOCK
      ?auto_56444 - BLOCK
      ?auto_56445 - BLOCK
    )
    :vars
    (
      ?auto_56447 - BLOCK
      ?auto_56446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56447 ?auto_56445 ) ( ON-TABLE ?auto_56442 ) ( ON ?auto_56443 ?auto_56442 ) ( ON ?auto_56444 ?auto_56443 ) ( ON ?auto_56445 ?auto_56444 ) ( not ( = ?auto_56442 ?auto_56443 ) ) ( not ( = ?auto_56442 ?auto_56444 ) ) ( not ( = ?auto_56442 ?auto_56445 ) ) ( not ( = ?auto_56442 ?auto_56447 ) ) ( not ( = ?auto_56443 ?auto_56444 ) ) ( not ( = ?auto_56443 ?auto_56445 ) ) ( not ( = ?auto_56443 ?auto_56447 ) ) ( not ( = ?auto_56444 ?auto_56445 ) ) ( not ( = ?auto_56444 ?auto_56447 ) ) ( not ( = ?auto_56445 ?auto_56447 ) ) ( not ( = ?auto_56442 ?auto_56446 ) ) ( not ( = ?auto_56443 ?auto_56446 ) ) ( not ( = ?auto_56444 ?auto_56446 ) ) ( not ( = ?auto_56445 ?auto_56446 ) ) ( not ( = ?auto_56447 ?auto_56446 ) ) ( ON ?auto_56446 ?auto_56447 ) ( CLEAR ?auto_56446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56442 ?auto_56443 ?auto_56444 ?auto_56445 ?auto_56447 )
      ( MAKE-4PILE ?auto_56442 ?auto_56443 ?auto_56444 ?auto_56445 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56448 - BLOCK
      ?auto_56449 - BLOCK
      ?auto_56450 - BLOCK
      ?auto_56451 - BLOCK
    )
    :vars
    (
      ?auto_56453 - BLOCK
      ?auto_56452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56453 ?auto_56451 ) ( ON-TABLE ?auto_56448 ) ( ON ?auto_56449 ?auto_56448 ) ( ON ?auto_56450 ?auto_56449 ) ( ON ?auto_56451 ?auto_56450 ) ( not ( = ?auto_56448 ?auto_56449 ) ) ( not ( = ?auto_56448 ?auto_56450 ) ) ( not ( = ?auto_56448 ?auto_56451 ) ) ( not ( = ?auto_56448 ?auto_56453 ) ) ( not ( = ?auto_56449 ?auto_56450 ) ) ( not ( = ?auto_56449 ?auto_56451 ) ) ( not ( = ?auto_56449 ?auto_56453 ) ) ( not ( = ?auto_56450 ?auto_56451 ) ) ( not ( = ?auto_56450 ?auto_56453 ) ) ( not ( = ?auto_56451 ?auto_56453 ) ) ( not ( = ?auto_56448 ?auto_56452 ) ) ( not ( = ?auto_56449 ?auto_56452 ) ) ( not ( = ?auto_56450 ?auto_56452 ) ) ( not ( = ?auto_56451 ?auto_56452 ) ) ( not ( = ?auto_56453 ?auto_56452 ) ) ( HOLDING ?auto_56452 ) ( CLEAR ?auto_56453 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56448 ?auto_56449 ?auto_56450 ?auto_56451 ?auto_56453 ?auto_56452 )
      ( MAKE-4PILE ?auto_56448 ?auto_56449 ?auto_56450 ?auto_56451 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56454 - BLOCK
      ?auto_56455 - BLOCK
      ?auto_56456 - BLOCK
      ?auto_56457 - BLOCK
    )
    :vars
    (
      ?auto_56459 - BLOCK
      ?auto_56458 - BLOCK
      ?auto_56460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56459 ?auto_56457 ) ( ON-TABLE ?auto_56454 ) ( ON ?auto_56455 ?auto_56454 ) ( ON ?auto_56456 ?auto_56455 ) ( ON ?auto_56457 ?auto_56456 ) ( not ( = ?auto_56454 ?auto_56455 ) ) ( not ( = ?auto_56454 ?auto_56456 ) ) ( not ( = ?auto_56454 ?auto_56457 ) ) ( not ( = ?auto_56454 ?auto_56459 ) ) ( not ( = ?auto_56455 ?auto_56456 ) ) ( not ( = ?auto_56455 ?auto_56457 ) ) ( not ( = ?auto_56455 ?auto_56459 ) ) ( not ( = ?auto_56456 ?auto_56457 ) ) ( not ( = ?auto_56456 ?auto_56459 ) ) ( not ( = ?auto_56457 ?auto_56459 ) ) ( not ( = ?auto_56454 ?auto_56458 ) ) ( not ( = ?auto_56455 ?auto_56458 ) ) ( not ( = ?auto_56456 ?auto_56458 ) ) ( not ( = ?auto_56457 ?auto_56458 ) ) ( not ( = ?auto_56459 ?auto_56458 ) ) ( CLEAR ?auto_56459 ) ( ON ?auto_56458 ?auto_56460 ) ( CLEAR ?auto_56458 ) ( HAND-EMPTY ) ( not ( = ?auto_56454 ?auto_56460 ) ) ( not ( = ?auto_56455 ?auto_56460 ) ) ( not ( = ?auto_56456 ?auto_56460 ) ) ( not ( = ?auto_56457 ?auto_56460 ) ) ( not ( = ?auto_56459 ?auto_56460 ) ) ( not ( = ?auto_56458 ?auto_56460 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56458 ?auto_56460 )
      ( MAKE-4PILE ?auto_56454 ?auto_56455 ?auto_56456 ?auto_56457 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56475 - BLOCK
      ?auto_56476 - BLOCK
      ?auto_56477 - BLOCK
      ?auto_56478 - BLOCK
    )
    :vars
    (
      ?auto_56481 - BLOCK
      ?auto_56479 - BLOCK
      ?auto_56480 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56475 ) ( ON ?auto_56476 ?auto_56475 ) ( ON ?auto_56477 ?auto_56476 ) ( not ( = ?auto_56475 ?auto_56476 ) ) ( not ( = ?auto_56475 ?auto_56477 ) ) ( not ( = ?auto_56475 ?auto_56478 ) ) ( not ( = ?auto_56475 ?auto_56481 ) ) ( not ( = ?auto_56476 ?auto_56477 ) ) ( not ( = ?auto_56476 ?auto_56478 ) ) ( not ( = ?auto_56476 ?auto_56481 ) ) ( not ( = ?auto_56477 ?auto_56478 ) ) ( not ( = ?auto_56477 ?auto_56481 ) ) ( not ( = ?auto_56478 ?auto_56481 ) ) ( not ( = ?auto_56475 ?auto_56479 ) ) ( not ( = ?auto_56476 ?auto_56479 ) ) ( not ( = ?auto_56477 ?auto_56479 ) ) ( not ( = ?auto_56478 ?auto_56479 ) ) ( not ( = ?auto_56481 ?auto_56479 ) ) ( ON ?auto_56479 ?auto_56480 ) ( not ( = ?auto_56475 ?auto_56480 ) ) ( not ( = ?auto_56476 ?auto_56480 ) ) ( not ( = ?auto_56477 ?auto_56480 ) ) ( not ( = ?auto_56478 ?auto_56480 ) ) ( not ( = ?auto_56481 ?auto_56480 ) ) ( not ( = ?auto_56479 ?auto_56480 ) ) ( ON ?auto_56481 ?auto_56479 ) ( CLEAR ?auto_56481 ) ( HOLDING ?auto_56478 ) ( CLEAR ?auto_56477 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56475 ?auto_56476 ?auto_56477 ?auto_56478 ?auto_56481 )
      ( MAKE-4PILE ?auto_56475 ?auto_56476 ?auto_56477 ?auto_56478 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56482 - BLOCK
      ?auto_56483 - BLOCK
      ?auto_56484 - BLOCK
      ?auto_56485 - BLOCK
    )
    :vars
    (
      ?auto_56487 - BLOCK
      ?auto_56486 - BLOCK
      ?auto_56488 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56482 ) ( ON ?auto_56483 ?auto_56482 ) ( ON ?auto_56484 ?auto_56483 ) ( not ( = ?auto_56482 ?auto_56483 ) ) ( not ( = ?auto_56482 ?auto_56484 ) ) ( not ( = ?auto_56482 ?auto_56485 ) ) ( not ( = ?auto_56482 ?auto_56487 ) ) ( not ( = ?auto_56483 ?auto_56484 ) ) ( not ( = ?auto_56483 ?auto_56485 ) ) ( not ( = ?auto_56483 ?auto_56487 ) ) ( not ( = ?auto_56484 ?auto_56485 ) ) ( not ( = ?auto_56484 ?auto_56487 ) ) ( not ( = ?auto_56485 ?auto_56487 ) ) ( not ( = ?auto_56482 ?auto_56486 ) ) ( not ( = ?auto_56483 ?auto_56486 ) ) ( not ( = ?auto_56484 ?auto_56486 ) ) ( not ( = ?auto_56485 ?auto_56486 ) ) ( not ( = ?auto_56487 ?auto_56486 ) ) ( ON ?auto_56486 ?auto_56488 ) ( not ( = ?auto_56482 ?auto_56488 ) ) ( not ( = ?auto_56483 ?auto_56488 ) ) ( not ( = ?auto_56484 ?auto_56488 ) ) ( not ( = ?auto_56485 ?auto_56488 ) ) ( not ( = ?auto_56487 ?auto_56488 ) ) ( not ( = ?auto_56486 ?auto_56488 ) ) ( ON ?auto_56487 ?auto_56486 ) ( CLEAR ?auto_56484 ) ( ON ?auto_56485 ?auto_56487 ) ( CLEAR ?auto_56485 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56488 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56488 ?auto_56486 ?auto_56487 )
      ( MAKE-4PILE ?auto_56482 ?auto_56483 ?auto_56484 ?auto_56485 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56489 - BLOCK
      ?auto_56490 - BLOCK
      ?auto_56491 - BLOCK
      ?auto_56492 - BLOCK
    )
    :vars
    (
      ?auto_56495 - BLOCK
      ?auto_56493 - BLOCK
      ?auto_56494 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56489 ) ( ON ?auto_56490 ?auto_56489 ) ( not ( = ?auto_56489 ?auto_56490 ) ) ( not ( = ?auto_56489 ?auto_56491 ) ) ( not ( = ?auto_56489 ?auto_56492 ) ) ( not ( = ?auto_56489 ?auto_56495 ) ) ( not ( = ?auto_56490 ?auto_56491 ) ) ( not ( = ?auto_56490 ?auto_56492 ) ) ( not ( = ?auto_56490 ?auto_56495 ) ) ( not ( = ?auto_56491 ?auto_56492 ) ) ( not ( = ?auto_56491 ?auto_56495 ) ) ( not ( = ?auto_56492 ?auto_56495 ) ) ( not ( = ?auto_56489 ?auto_56493 ) ) ( not ( = ?auto_56490 ?auto_56493 ) ) ( not ( = ?auto_56491 ?auto_56493 ) ) ( not ( = ?auto_56492 ?auto_56493 ) ) ( not ( = ?auto_56495 ?auto_56493 ) ) ( ON ?auto_56493 ?auto_56494 ) ( not ( = ?auto_56489 ?auto_56494 ) ) ( not ( = ?auto_56490 ?auto_56494 ) ) ( not ( = ?auto_56491 ?auto_56494 ) ) ( not ( = ?auto_56492 ?auto_56494 ) ) ( not ( = ?auto_56495 ?auto_56494 ) ) ( not ( = ?auto_56493 ?auto_56494 ) ) ( ON ?auto_56495 ?auto_56493 ) ( ON ?auto_56492 ?auto_56495 ) ( CLEAR ?auto_56492 ) ( ON-TABLE ?auto_56494 ) ( HOLDING ?auto_56491 ) ( CLEAR ?auto_56490 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56489 ?auto_56490 ?auto_56491 )
      ( MAKE-4PILE ?auto_56489 ?auto_56490 ?auto_56491 ?auto_56492 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56496 - BLOCK
      ?auto_56497 - BLOCK
      ?auto_56498 - BLOCK
      ?auto_56499 - BLOCK
    )
    :vars
    (
      ?auto_56501 - BLOCK
      ?auto_56500 - BLOCK
      ?auto_56502 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56496 ) ( ON ?auto_56497 ?auto_56496 ) ( not ( = ?auto_56496 ?auto_56497 ) ) ( not ( = ?auto_56496 ?auto_56498 ) ) ( not ( = ?auto_56496 ?auto_56499 ) ) ( not ( = ?auto_56496 ?auto_56501 ) ) ( not ( = ?auto_56497 ?auto_56498 ) ) ( not ( = ?auto_56497 ?auto_56499 ) ) ( not ( = ?auto_56497 ?auto_56501 ) ) ( not ( = ?auto_56498 ?auto_56499 ) ) ( not ( = ?auto_56498 ?auto_56501 ) ) ( not ( = ?auto_56499 ?auto_56501 ) ) ( not ( = ?auto_56496 ?auto_56500 ) ) ( not ( = ?auto_56497 ?auto_56500 ) ) ( not ( = ?auto_56498 ?auto_56500 ) ) ( not ( = ?auto_56499 ?auto_56500 ) ) ( not ( = ?auto_56501 ?auto_56500 ) ) ( ON ?auto_56500 ?auto_56502 ) ( not ( = ?auto_56496 ?auto_56502 ) ) ( not ( = ?auto_56497 ?auto_56502 ) ) ( not ( = ?auto_56498 ?auto_56502 ) ) ( not ( = ?auto_56499 ?auto_56502 ) ) ( not ( = ?auto_56501 ?auto_56502 ) ) ( not ( = ?auto_56500 ?auto_56502 ) ) ( ON ?auto_56501 ?auto_56500 ) ( ON ?auto_56499 ?auto_56501 ) ( ON-TABLE ?auto_56502 ) ( CLEAR ?auto_56497 ) ( ON ?auto_56498 ?auto_56499 ) ( CLEAR ?auto_56498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56502 ?auto_56500 ?auto_56501 ?auto_56499 )
      ( MAKE-4PILE ?auto_56496 ?auto_56497 ?auto_56498 ?auto_56499 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56503 - BLOCK
      ?auto_56504 - BLOCK
      ?auto_56505 - BLOCK
      ?auto_56506 - BLOCK
    )
    :vars
    (
      ?auto_56507 - BLOCK
      ?auto_56509 - BLOCK
      ?auto_56508 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56503 ) ( not ( = ?auto_56503 ?auto_56504 ) ) ( not ( = ?auto_56503 ?auto_56505 ) ) ( not ( = ?auto_56503 ?auto_56506 ) ) ( not ( = ?auto_56503 ?auto_56507 ) ) ( not ( = ?auto_56504 ?auto_56505 ) ) ( not ( = ?auto_56504 ?auto_56506 ) ) ( not ( = ?auto_56504 ?auto_56507 ) ) ( not ( = ?auto_56505 ?auto_56506 ) ) ( not ( = ?auto_56505 ?auto_56507 ) ) ( not ( = ?auto_56506 ?auto_56507 ) ) ( not ( = ?auto_56503 ?auto_56509 ) ) ( not ( = ?auto_56504 ?auto_56509 ) ) ( not ( = ?auto_56505 ?auto_56509 ) ) ( not ( = ?auto_56506 ?auto_56509 ) ) ( not ( = ?auto_56507 ?auto_56509 ) ) ( ON ?auto_56509 ?auto_56508 ) ( not ( = ?auto_56503 ?auto_56508 ) ) ( not ( = ?auto_56504 ?auto_56508 ) ) ( not ( = ?auto_56505 ?auto_56508 ) ) ( not ( = ?auto_56506 ?auto_56508 ) ) ( not ( = ?auto_56507 ?auto_56508 ) ) ( not ( = ?auto_56509 ?auto_56508 ) ) ( ON ?auto_56507 ?auto_56509 ) ( ON ?auto_56506 ?auto_56507 ) ( ON-TABLE ?auto_56508 ) ( ON ?auto_56505 ?auto_56506 ) ( CLEAR ?auto_56505 ) ( HOLDING ?auto_56504 ) ( CLEAR ?auto_56503 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56503 ?auto_56504 )
      ( MAKE-4PILE ?auto_56503 ?auto_56504 ?auto_56505 ?auto_56506 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56510 - BLOCK
      ?auto_56511 - BLOCK
      ?auto_56512 - BLOCK
      ?auto_56513 - BLOCK
    )
    :vars
    (
      ?auto_56514 - BLOCK
      ?auto_56515 - BLOCK
      ?auto_56516 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56510 ) ( not ( = ?auto_56510 ?auto_56511 ) ) ( not ( = ?auto_56510 ?auto_56512 ) ) ( not ( = ?auto_56510 ?auto_56513 ) ) ( not ( = ?auto_56510 ?auto_56514 ) ) ( not ( = ?auto_56511 ?auto_56512 ) ) ( not ( = ?auto_56511 ?auto_56513 ) ) ( not ( = ?auto_56511 ?auto_56514 ) ) ( not ( = ?auto_56512 ?auto_56513 ) ) ( not ( = ?auto_56512 ?auto_56514 ) ) ( not ( = ?auto_56513 ?auto_56514 ) ) ( not ( = ?auto_56510 ?auto_56515 ) ) ( not ( = ?auto_56511 ?auto_56515 ) ) ( not ( = ?auto_56512 ?auto_56515 ) ) ( not ( = ?auto_56513 ?auto_56515 ) ) ( not ( = ?auto_56514 ?auto_56515 ) ) ( ON ?auto_56515 ?auto_56516 ) ( not ( = ?auto_56510 ?auto_56516 ) ) ( not ( = ?auto_56511 ?auto_56516 ) ) ( not ( = ?auto_56512 ?auto_56516 ) ) ( not ( = ?auto_56513 ?auto_56516 ) ) ( not ( = ?auto_56514 ?auto_56516 ) ) ( not ( = ?auto_56515 ?auto_56516 ) ) ( ON ?auto_56514 ?auto_56515 ) ( ON ?auto_56513 ?auto_56514 ) ( ON-TABLE ?auto_56516 ) ( ON ?auto_56512 ?auto_56513 ) ( CLEAR ?auto_56510 ) ( ON ?auto_56511 ?auto_56512 ) ( CLEAR ?auto_56511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56516 ?auto_56515 ?auto_56514 ?auto_56513 ?auto_56512 )
      ( MAKE-4PILE ?auto_56510 ?auto_56511 ?auto_56512 ?auto_56513 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56517 - BLOCK
      ?auto_56518 - BLOCK
      ?auto_56519 - BLOCK
      ?auto_56520 - BLOCK
    )
    :vars
    (
      ?auto_56521 - BLOCK
      ?auto_56522 - BLOCK
      ?auto_56523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56517 ?auto_56518 ) ) ( not ( = ?auto_56517 ?auto_56519 ) ) ( not ( = ?auto_56517 ?auto_56520 ) ) ( not ( = ?auto_56517 ?auto_56521 ) ) ( not ( = ?auto_56518 ?auto_56519 ) ) ( not ( = ?auto_56518 ?auto_56520 ) ) ( not ( = ?auto_56518 ?auto_56521 ) ) ( not ( = ?auto_56519 ?auto_56520 ) ) ( not ( = ?auto_56519 ?auto_56521 ) ) ( not ( = ?auto_56520 ?auto_56521 ) ) ( not ( = ?auto_56517 ?auto_56522 ) ) ( not ( = ?auto_56518 ?auto_56522 ) ) ( not ( = ?auto_56519 ?auto_56522 ) ) ( not ( = ?auto_56520 ?auto_56522 ) ) ( not ( = ?auto_56521 ?auto_56522 ) ) ( ON ?auto_56522 ?auto_56523 ) ( not ( = ?auto_56517 ?auto_56523 ) ) ( not ( = ?auto_56518 ?auto_56523 ) ) ( not ( = ?auto_56519 ?auto_56523 ) ) ( not ( = ?auto_56520 ?auto_56523 ) ) ( not ( = ?auto_56521 ?auto_56523 ) ) ( not ( = ?auto_56522 ?auto_56523 ) ) ( ON ?auto_56521 ?auto_56522 ) ( ON ?auto_56520 ?auto_56521 ) ( ON-TABLE ?auto_56523 ) ( ON ?auto_56519 ?auto_56520 ) ( ON ?auto_56518 ?auto_56519 ) ( CLEAR ?auto_56518 ) ( HOLDING ?auto_56517 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56517 )
      ( MAKE-4PILE ?auto_56517 ?auto_56518 ?auto_56519 ?auto_56520 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56524 - BLOCK
      ?auto_56525 - BLOCK
      ?auto_56526 - BLOCK
      ?auto_56527 - BLOCK
    )
    :vars
    (
      ?auto_56529 - BLOCK
      ?auto_56530 - BLOCK
      ?auto_56528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56524 ?auto_56525 ) ) ( not ( = ?auto_56524 ?auto_56526 ) ) ( not ( = ?auto_56524 ?auto_56527 ) ) ( not ( = ?auto_56524 ?auto_56529 ) ) ( not ( = ?auto_56525 ?auto_56526 ) ) ( not ( = ?auto_56525 ?auto_56527 ) ) ( not ( = ?auto_56525 ?auto_56529 ) ) ( not ( = ?auto_56526 ?auto_56527 ) ) ( not ( = ?auto_56526 ?auto_56529 ) ) ( not ( = ?auto_56527 ?auto_56529 ) ) ( not ( = ?auto_56524 ?auto_56530 ) ) ( not ( = ?auto_56525 ?auto_56530 ) ) ( not ( = ?auto_56526 ?auto_56530 ) ) ( not ( = ?auto_56527 ?auto_56530 ) ) ( not ( = ?auto_56529 ?auto_56530 ) ) ( ON ?auto_56530 ?auto_56528 ) ( not ( = ?auto_56524 ?auto_56528 ) ) ( not ( = ?auto_56525 ?auto_56528 ) ) ( not ( = ?auto_56526 ?auto_56528 ) ) ( not ( = ?auto_56527 ?auto_56528 ) ) ( not ( = ?auto_56529 ?auto_56528 ) ) ( not ( = ?auto_56530 ?auto_56528 ) ) ( ON ?auto_56529 ?auto_56530 ) ( ON ?auto_56527 ?auto_56529 ) ( ON-TABLE ?auto_56528 ) ( ON ?auto_56526 ?auto_56527 ) ( ON ?auto_56525 ?auto_56526 ) ( ON ?auto_56524 ?auto_56525 ) ( CLEAR ?auto_56524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56528 ?auto_56530 ?auto_56529 ?auto_56527 ?auto_56526 ?auto_56525 )
      ( MAKE-4PILE ?auto_56524 ?auto_56525 ?auto_56526 ?auto_56527 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56533 - BLOCK
      ?auto_56534 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_56534 ) ( CLEAR ?auto_56533 ) ( ON-TABLE ?auto_56533 ) ( not ( = ?auto_56533 ?auto_56534 ) ) )
    :subtasks
    ( ( !STACK ?auto_56534 ?auto_56533 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56535 - BLOCK
      ?auto_56536 - BLOCK
    )
    :vars
    (
      ?auto_56537 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_56535 ) ( ON-TABLE ?auto_56535 ) ( not ( = ?auto_56535 ?auto_56536 ) ) ( ON ?auto_56536 ?auto_56537 ) ( CLEAR ?auto_56536 ) ( HAND-EMPTY ) ( not ( = ?auto_56535 ?auto_56537 ) ) ( not ( = ?auto_56536 ?auto_56537 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56536 ?auto_56537 )
      ( MAKE-2PILE ?auto_56535 ?auto_56536 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56538 - BLOCK
      ?auto_56539 - BLOCK
    )
    :vars
    (
      ?auto_56540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56538 ?auto_56539 ) ) ( ON ?auto_56539 ?auto_56540 ) ( CLEAR ?auto_56539 ) ( not ( = ?auto_56538 ?auto_56540 ) ) ( not ( = ?auto_56539 ?auto_56540 ) ) ( HOLDING ?auto_56538 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56538 )
      ( MAKE-2PILE ?auto_56538 ?auto_56539 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56541 - BLOCK
      ?auto_56542 - BLOCK
    )
    :vars
    (
      ?auto_56543 - BLOCK
      ?auto_56545 - BLOCK
      ?auto_56546 - BLOCK
      ?auto_56544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56541 ?auto_56542 ) ) ( ON ?auto_56542 ?auto_56543 ) ( not ( = ?auto_56541 ?auto_56543 ) ) ( not ( = ?auto_56542 ?auto_56543 ) ) ( ON ?auto_56541 ?auto_56542 ) ( CLEAR ?auto_56541 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56545 ) ( ON ?auto_56546 ?auto_56545 ) ( ON ?auto_56544 ?auto_56546 ) ( ON ?auto_56543 ?auto_56544 ) ( not ( = ?auto_56545 ?auto_56546 ) ) ( not ( = ?auto_56545 ?auto_56544 ) ) ( not ( = ?auto_56545 ?auto_56543 ) ) ( not ( = ?auto_56545 ?auto_56542 ) ) ( not ( = ?auto_56545 ?auto_56541 ) ) ( not ( = ?auto_56546 ?auto_56544 ) ) ( not ( = ?auto_56546 ?auto_56543 ) ) ( not ( = ?auto_56546 ?auto_56542 ) ) ( not ( = ?auto_56546 ?auto_56541 ) ) ( not ( = ?auto_56544 ?auto_56543 ) ) ( not ( = ?auto_56544 ?auto_56542 ) ) ( not ( = ?auto_56544 ?auto_56541 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56545 ?auto_56546 ?auto_56544 ?auto_56543 ?auto_56542 )
      ( MAKE-2PILE ?auto_56541 ?auto_56542 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56547 - BLOCK
      ?auto_56548 - BLOCK
    )
    :vars
    (
      ?auto_56550 - BLOCK
      ?auto_56552 - BLOCK
      ?auto_56551 - BLOCK
      ?auto_56549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56547 ?auto_56548 ) ) ( ON ?auto_56548 ?auto_56550 ) ( not ( = ?auto_56547 ?auto_56550 ) ) ( not ( = ?auto_56548 ?auto_56550 ) ) ( ON-TABLE ?auto_56552 ) ( ON ?auto_56551 ?auto_56552 ) ( ON ?auto_56549 ?auto_56551 ) ( ON ?auto_56550 ?auto_56549 ) ( not ( = ?auto_56552 ?auto_56551 ) ) ( not ( = ?auto_56552 ?auto_56549 ) ) ( not ( = ?auto_56552 ?auto_56550 ) ) ( not ( = ?auto_56552 ?auto_56548 ) ) ( not ( = ?auto_56552 ?auto_56547 ) ) ( not ( = ?auto_56551 ?auto_56549 ) ) ( not ( = ?auto_56551 ?auto_56550 ) ) ( not ( = ?auto_56551 ?auto_56548 ) ) ( not ( = ?auto_56551 ?auto_56547 ) ) ( not ( = ?auto_56549 ?auto_56550 ) ) ( not ( = ?auto_56549 ?auto_56548 ) ) ( not ( = ?auto_56549 ?auto_56547 ) ) ( HOLDING ?auto_56547 ) ( CLEAR ?auto_56548 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56552 ?auto_56551 ?auto_56549 ?auto_56550 ?auto_56548 ?auto_56547 )
      ( MAKE-2PILE ?auto_56547 ?auto_56548 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56553 - BLOCK
      ?auto_56554 - BLOCK
    )
    :vars
    (
      ?auto_56557 - BLOCK
      ?auto_56556 - BLOCK
      ?auto_56558 - BLOCK
      ?auto_56555 - BLOCK
      ?auto_56559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56553 ?auto_56554 ) ) ( ON ?auto_56554 ?auto_56557 ) ( not ( = ?auto_56553 ?auto_56557 ) ) ( not ( = ?auto_56554 ?auto_56557 ) ) ( ON-TABLE ?auto_56556 ) ( ON ?auto_56558 ?auto_56556 ) ( ON ?auto_56555 ?auto_56558 ) ( ON ?auto_56557 ?auto_56555 ) ( not ( = ?auto_56556 ?auto_56558 ) ) ( not ( = ?auto_56556 ?auto_56555 ) ) ( not ( = ?auto_56556 ?auto_56557 ) ) ( not ( = ?auto_56556 ?auto_56554 ) ) ( not ( = ?auto_56556 ?auto_56553 ) ) ( not ( = ?auto_56558 ?auto_56555 ) ) ( not ( = ?auto_56558 ?auto_56557 ) ) ( not ( = ?auto_56558 ?auto_56554 ) ) ( not ( = ?auto_56558 ?auto_56553 ) ) ( not ( = ?auto_56555 ?auto_56557 ) ) ( not ( = ?auto_56555 ?auto_56554 ) ) ( not ( = ?auto_56555 ?auto_56553 ) ) ( CLEAR ?auto_56554 ) ( ON ?auto_56553 ?auto_56559 ) ( CLEAR ?auto_56553 ) ( HAND-EMPTY ) ( not ( = ?auto_56553 ?auto_56559 ) ) ( not ( = ?auto_56554 ?auto_56559 ) ) ( not ( = ?auto_56557 ?auto_56559 ) ) ( not ( = ?auto_56556 ?auto_56559 ) ) ( not ( = ?auto_56558 ?auto_56559 ) ) ( not ( = ?auto_56555 ?auto_56559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56553 ?auto_56559 )
      ( MAKE-2PILE ?auto_56553 ?auto_56554 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56560 - BLOCK
      ?auto_56561 - BLOCK
    )
    :vars
    (
      ?auto_56563 - BLOCK
      ?auto_56566 - BLOCK
      ?auto_56565 - BLOCK
      ?auto_56564 - BLOCK
      ?auto_56562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56560 ?auto_56561 ) ) ( not ( = ?auto_56560 ?auto_56563 ) ) ( not ( = ?auto_56561 ?auto_56563 ) ) ( ON-TABLE ?auto_56566 ) ( ON ?auto_56565 ?auto_56566 ) ( ON ?auto_56564 ?auto_56565 ) ( ON ?auto_56563 ?auto_56564 ) ( not ( = ?auto_56566 ?auto_56565 ) ) ( not ( = ?auto_56566 ?auto_56564 ) ) ( not ( = ?auto_56566 ?auto_56563 ) ) ( not ( = ?auto_56566 ?auto_56561 ) ) ( not ( = ?auto_56566 ?auto_56560 ) ) ( not ( = ?auto_56565 ?auto_56564 ) ) ( not ( = ?auto_56565 ?auto_56563 ) ) ( not ( = ?auto_56565 ?auto_56561 ) ) ( not ( = ?auto_56565 ?auto_56560 ) ) ( not ( = ?auto_56564 ?auto_56563 ) ) ( not ( = ?auto_56564 ?auto_56561 ) ) ( not ( = ?auto_56564 ?auto_56560 ) ) ( ON ?auto_56560 ?auto_56562 ) ( CLEAR ?auto_56560 ) ( not ( = ?auto_56560 ?auto_56562 ) ) ( not ( = ?auto_56561 ?auto_56562 ) ) ( not ( = ?auto_56563 ?auto_56562 ) ) ( not ( = ?auto_56566 ?auto_56562 ) ) ( not ( = ?auto_56565 ?auto_56562 ) ) ( not ( = ?auto_56564 ?auto_56562 ) ) ( HOLDING ?auto_56561 ) ( CLEAR ?auto_56563 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56566 ?auto_56565 ?auto_56564 ?auto_56563 ?auto_56561 )
      ( MAKE-2PILE ?auto_56560 ?auto_56561 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56567 - BLOCK
      ?auto_56568 - BLOCK
    )
    :vars
    (
      ?auto_56570 - BLOCK
      ?auto_56571 - BLOCK
      ?auto_56572 - BLOCK
      ?auto_56569 - BLOCK
      ?auto_56573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56567 ?auto_56568 ) ) ( not ( = ?auto_56567 ?auto_56570 ) ) ( not ( = ?auto_56568 ?auto_56570 ) ) ( ON-TABLE ?auto_56571 ) ( ON ?auto_56572 ?auto_56571 ) ( ON ?auto_56569 ?auto_56572 ) ( ON ?auto_56570 ?auto_56569 ) ( not ( = ?auto_56571 ?auto_56572 ) ) ( not ( = ?auto_56571 ?auto_56569 ) ) ( not ( = ?auto_56571 ?auto_56570 ) ) ( not ( = ?auto_56571 ?auto_56568 ) ) ( not ( = ?auto_56571 ?auto_56567 ) ) ( not ( = ?auto_56572 ?auto_56569 ) ) ( not ( = ?auto_56572 ?auto_56570 ) ) ( not ( = ?auto_56572 ?auto_56568 ) ) ( not ( = ?auto_56572 ?auto_56567 ) ) ( not ( = ?auto_56569 ?auto_56570 ) ) ( not ( = ?auto_56569 ?auto_56568 ) ) ( not ( = ?auto_56569 ?auto_56567 ) ) ( ON ?auto_56567 ?auto_56573 ) ( not ( = ?auto_56567 ?auto_56573 ) ) ( not ( = ?auto_56568 ?auto_56573 ) ) ( not ( = ?auto_56570 ?auto_56573 ) ) ( not ( = ?auto_56571 ?auto_56573 ) ) ( not ( = ?auto_56572 ?auto_56573 ) ) ( not ( = ?auto_56569 ?auto_56573 ) ) ( CLEAR ?auto_56570 ) ( ON ?auto_56568 ?auto_56567 ) ( CLEAR ?auto_56568 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56573 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56573 ?auto_56567 )
      ( MAKE-2PILE ?auto_56567 ?auto_56568 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56574 - BLOCK
      ?auto_56575 - BLOCK
    )
    :vars
    (
      ?auto_56579 - BLOCK
      ?auto_56578 - BLOCK
      ?auto_56576 - BLOCK
      ?auto_56580 - BLOCK
      ?auto_56577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56574 ?auto_56575 ) ) ( not ( = ?auto_56574 ?auto_56579 ) ) ( not ( = ?auto_56575 ?auto_56579 ) ) ( ON-TABLE ?auto_56578 ) ( ON ?auto_56576 ?auto_56578 ) ( ON ?auto_56580 ?auto_56576 ) ( not ( = ?auto_56578 ?auto_56576 ) ) ( not ( = ?auto_56578 ?auto_56580 ) ) ( not ( = ?auto_56578 ?auto_56579 ) ) ( not ( = ?auto_56578 ?auto_56575 ) ) ( not ( = ?auto_56578 ?auto_56574 ) ) ( not ( = ?auto_56576 ?auto_56580 ) ) ( not ( = ?auto_56576 ?auto_56579 ) ) ( not ( = ?auto_56576 ?auto_56575 ) ) ( not ( = ?auto_56576 ?auto_56574 ) ) ( not ( = ?auto_56580 ?auto_56579 ) ) ( not ( = ?auto_56580 ?auto_56575 ) ) ( not ( = ?auto_56580 ?auto_56574 ) ) ( ON ?auto_56574 ?auto_56577 ) ( not ( = ?auto_56574 ?auto_56577 ) ) ( not ( = ?auto_56575 ?auto_56577 ) ) ( not ( = ?auto_56579 ?auto_56577 ) ) ( not ( = ?auto_56578 ?auto_56577 ) ) ( not ( = ?auto_56576 ?auto_56577 ) ) ( not ( = ?auto_56580 ?auto_56577 ) ) ( ON ?auto_56575 ?auto_56574 ) ( CLEAR ?auto_56575 ) ( ON-TABLE ?auto_56577 ) ( HOLDING ?auto_56579 ) ( CLEAR ?auto_56580 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56578 ?auto_56576 ?auto_56580 ?auto_56579 )
      ( MAKE-2PILE ?auto_56574 ?auto_56575 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56581 - BLOCK
      ?auto_56582 - BLOCK
    )
    :vars
    (
      ?auto_56587 - BLOCK
      ?auto_56583 - BLOCK
      ?auto_56584 - BLOCK
      ?auto_56586 - BLOCK
      ?auto_56585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56581 ?auto_56582 ) ) ( not ( = ?auto_56581 ?auto_56587 ) ) ( not ( = ?auto_56582 ?auto_56587 ) ) ( ON-TABLE ?auto_56583 ) ( ON ?auto_56584 ?auto_56583 ) ( ON ?auto_56586 ?auto_56584 ) ( not ( = ?auto_56583 ?auto_56584 ) ) ( not ( = ?auto_56583 ?auto_56586 ) ) ( not ( = ?auto_56583 ?auto_56587 ) ) ( not ( = ?auto_56583 ?auto_56582 ) ) ( not ( = ?auto_56583 ?auto_56581 ) ) ( not ( = ?auto_56584 ?auto_56586 ) ) ( not ( = ?auto_56584 ?auto_56587 ) ) ( not ( = ?auto_56584 ?auto_56582 ) ) ( not ( = ?auto_56584 ?auto_56581 ) ) ( not ( = ?auto_56586 ?auto_56587 ) ) ( not ( = ?auto_56586 ?auto_56582 ) ) ( not ( = ?auto_56586 ?auto_56581 ) ) ( ON ?auto_56581 ?auto_56585 ) ( not ( = ?auto_56581 ?auto_56585 ) ) ( not ( = ?auto_56582 ?auto_56585 ) ) ( not ( = ?auto_56587 ?auto_56585 ) ) ( not ( = ?auto_56583 ?auto_56585 ) ) ( not ( = ?auto_56584 ?auto_56585 ) ) ( not ( = ?auto_56586 ?auto_56585 ) ) ( ON ?auto_56582 ?auto_56581 ) ( ON-TABLE ?auto_56585 ) ( CLEAR ?auto_56586 ) ( ON ?auto_56587 ?auto_56582 ) ( CLEAR ?auto_56587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56585 ?auto_56581 ?auto_56582 )
      ( MAKE-2PILE ?auto_56581 ?auto_56582 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56588 - BLOCK
      ?auto_56589 - BLOCK
    )
    :vars
    (
      ?auto_56590 - BLOCK
      ?auto_56592 - BLOCK
      ?auto_56594 - BLOCK
      ?auto_56591 - BLOCK
      ?auto_56593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56588 ?auto_56589 ) ) ( not ( = ?auto_56588 ?auto_56590 ) ) ( not ( = ?auto_56589 ?auto_56590 ) ) ( ON-TABLE ?auto_56592 ) ( ON ?auto_56594 ?auto_56592 ) ( not ( = ?auto_56592 ?auto_56594 ) ) ( not ( = ?auto_56592 ?auto_56591 ) ) ( not ( = ?auto_56592 ?auto_56590 ) ) ( not ( = ?auto_56592 ?auto_56589 ) ) ( not ( = ?auto_56592 ?auto_56588 ) ) ( not ( = ?auto_56594 ?auto_56591 ) ) ( not ( = ?auto_56594 ?auto_56590 ) ) ( not ( = ?auto_56594 ?auto_56589 ) ) ( not ( = ?auto_56594 ?auto_56588 ) ) ( not ( = ?auto_56591 ?auto_56590 ) ) ( not ( = ?auto_56591 ?auto_56589 ) ) ( not ( = ?auto_56591 ?auto_56588 ) ) ( ON ?auto_56588 ?auto_56593 ) ( not ( = ?auto_56588 ?auto_56593 ) ) ( not ( = ?auto_56589 ?auto_56593 ) ) ( not ( = ?auto_56590 ?auto_56593 ) ) ( not ( = ?auto_56592 ?auto_56593 ) ) ( not ( = ?auto_56594 ?auto_56593 ) ) ( not ( = ?auto_56591 ?auto_56593 ) ) ( ON ?auto_56589 ?auto_56588 ) ( ON-TABLE ?auto_56593 ) ( ON ?auto_56590 ?auto_56589 ) ( CLEAR ?auto_56590 ) ( HOLDING ?auto_56591 ) ( CLEAR ?auto_56594 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56592 ?auto_56594 ?auto_56591 )
      ( MAKE-2PILE ?auto_56588 ?auto_56589 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56595 - BLOCK
      ?auto_56596 - BLOCK
    )
    :vars
    (
      ?auto_56599 - BLOCK
      ?auto_56597 - BLOCK
      ?auto_56601 - BLOCK
      ?auto_56598 - BLOCK
      ?auto_56600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56595 ?auto_56596 ) ) ( not ( = ?auto_56595 ?auto_56599 ) ) ( not ( = ?auto_56596 ?auto_56599 ) ) ( ON-TABLE ?auto_56597 ) ( ON ?auto_56601 ?auto_56597 ) ( not ( = ?auto_56597 ?auto_56601 ) ) ( not ( = ?auto_56597 ?auto_56598 ) ) ( not ( = ?auto_56597 ?auto_56599 ) ) ( not ( = ?auto_56597 ?auto_56596 ) ) ( not ( = ?auto_56597 ?auto_56595 ) ) ( not ( = ?auto_56601 ?auto_56598 ) ) ( not ( = ?auto_56601 ?auto_56599 ) ) ( not ( = ?auto_56601 ?auto_56596 ) ) ( not ( = ?auto_56601 ?auto_56595 ) ) ( not ( = ?auto_56598 ?auto_56599 ) ) ( not ( = ?auto_56598 ?auto_56596 ) ) ( not ( = ?auto_56598 ?auto_56595 ) ) ( ON ?auto_56595 ?auto_56600 ) ( not ( = ?auto_56595 ?auto_56600 ) ) ( not ( = ?auto_56596 ?auto_56600 ) ) ( not ( = ?auto_56599 ?auto_56600 ) ) ( not ( = ?auto_56597 ?auto_56600 ) ) ( not ( = ?auto_56601 ?auto_56600 ) ) ( not ( = ?auto_56598 ?auto_56600 ) ) ( ON ?auto_56596 ?auto_56595 ) ( ON-TABLE ?auto_56600 ) ( ON ?auto_56599 ?auto_56596 ) ( CLEAR ?auto_56601 ) ( ON ?auto_56598 ?auto_56599 ) ( CLEAR ?auto_56598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56600 ?auto_56595 ?auto_56596 ?auto_56599 )
      ( MAKE-2PILE ?auto_56595 ?auto_56596 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56602 - BLOCK
      ?auto_56603 - BLOCK
    )
    :vars
    (
      ?auto_56606 - BLOCK
      ?auto_56604 - BLOCK
      ?auto_56605 - BLOCK
      ?auto_56607 - BLOCK
      ?auto_56608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56602 ?auto_56603 ) ) ( not ( = ?auto_56602 ?auto_56606 ) ) ( not ( = ?auto_56603 ?auto_56606 ) ) ( ON-TABLE ?auto_56604 ) ( not ( = ?auto_56604 ?auto_56605 ) ) ( not ( = ?auto_56604 ?auto_56607 ) ) ( not ( = ?auto_56604 ?auto_56606 ) ) ( not ( = ?auto_56604 ?auto_56603 ) ) ( not ( = ?auto_56604 ?auto_56602 ) ) ( not ( = ?auto_56605 ?auto_56607 ) ) ( not ( = ?auto_56605 ?auto_56606 ) ) ( not ( = ?auto_56605 ?auto_56603 ) ) ( not ( = ?auto_56605 ?auto_56602 ) ) ( not ( = ?auto_56607 ?auto_56606 ) ) ( not ( = ?auto_56607 ?auto_56603 ) ) ( not ( = ?auto_56607 ?auto_56602 ) ) ( ON ?auto_56602 ?auto_56608 ) ( not ( = ?auto_56602 ?auto_56608 ) ) ( not ( = ?auto_56603 ?auto_56608 ) ) ( not ( = ?auto_56606 ?auto_56608 ) ) ( not ( = ?auto_56604 ?auto_56608 ) ) ( not ( = ?auto_56605 ?auto_56608 ) ) ( not ( = ?auto_56607 ?auto_56608 ) ) ( ON ?auto_56603 ?auto_56602 ) ( ON-TABLE ?auto_56608 ) ( ON ?auto_56606 ?auto_56603 ) ( ON ?auto_56607 ?auto_56606 ) ( CLEAR ?auto_56607 ) ( HOLDING ?auto_56605 ) ( CLEAR ?auto_56604 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56604 ?auto_56605 )
      ( MAKE-2PILE ?auto_56602 ?auto_56603 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56609 - BLOCK
      ?auto_56610 - BLOCK
    )
    :vars
    (
      ?auto_56613 - BLOCK
      ?auto_56612 - BLOCK
      ?auto_56614 - BLOCK
      ?auto_56611 - BLOCK
      ?auto_56615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56609 ?auto_56610 ) ) ( not ( = ?auto_56609 ?auto_56613 ) ) ( not ( = ?auto_56610 ?auto_56613 ) ) ( ON-TABLE ?auto_56612 ) ( not ( = ?auto_56612 ?auto_56614 ) ) ( not ( = ?auto_56612 ?auto_56611 ) ) ( not ( = ?auto_56612 ?auto_56613 ) ) ( not ( = ?auto_56612 ?auto_56610 ) ) ( not ( = ?auto_56612 ?auto_56609 ) ) ( not ( = ?auto_56614 ?auto_56611 ) ) ( not ( = ?auto_56614 ?auto_56613 ) ) ( not ( = ?auto_56614 ?auto_56610 ) ) ( not ( = ?auto_56614 ?auto_56609 ) ) ( not ( = ?auto_56611 ?auto_56613 ) ) ( not ( = ?auto_56611 ?auto_56610 ) ) ( not ( = ?auto_56611 ?auto_56609 ) ) ( ON ?auto_56609 ?auto_56615 ) ( not ( = ?auto_56609 ?auto_56615 ) ) ( not ( = ?auto_56610 ?auto_56615 ) ) ( not ( = ?auto_56613 ?auto_56615 ) ) ( not ( = ?auto_56612 ?auto_56615 ) ) ( not ( = ?auto_56614 ?auto_56615 ) ) ( not ( = ?auto_56611 ?auto_56615 ) ) ( ON ?auto_56610 ?auto_56609 ) ( ON-TABLE ?auto_56615 ) ( ON ?auto_56613 ?auto_56610 ) ( ON ?auto_56611 ?auto_56613 ) ( CLEAR ?auto_56612 ) ( ON ?auto_56614 ?auto_56611 ) ( CLEAR ?auto_56614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56615 ?auto_56609 ?auto_56610 ?auto_56613 ?auto_56611 )
      ( MAKE-2PILE ?auto_56609 ?auto_56610 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56616 - BLOCK
      ?auto_56617 - BLOCK
    )
    :vars
    (
      ?auto_56622 - BLOCK
      ?auto_56620 - BLOCK
      ?auto_56618 - BLOCK
      ?auto_56619 - BLOCK
      ?auto_56621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56616 ?auto_56617 ) ) ( not ( = ?auto_56616 ?auto_56622 ) ) ( not ( = ?auto_56617 ?auto_56622 ) ) ( not ( = ?auto_56620 ?auto_56618 ) ) ( not ( = ?auto_56620 ?auto_56619 ) ) ( not ( = ?auto_56620 ?auto_56622 ) ) ( not ( = ?auto_56620 ?auto_56617 ) ) ( not ( = ?auto_56620 ?auto_56616 ) ) ( not ( = ?auto_56618 ?auto_56619 ) ) ( not ( = ?auto_56618 ?auto_56622 ) ) ( not ( = ?auto_56618 ?auto_56617 ) ) ( not ( = ?auto_56618 ?auto_56616 ) ) ( not ( = ?auto_56619 ?auto_56622 ) ) ( not ( = ?auto_56619 ?auto_56617 ) ) ( not ( = ?auto_56619 ?auto_56616 ) ) ( ON ?auto_56616 ?auto_56621 ) ( not ( = ?auto_56616 ?auto_56621 ) ) ( not ( = ?auto_56617 ?auto_56621 ) ) ( not ( = ?auto_56622 ?auto_56621 ) ) ( not ( = ?auto_56620 ?auto_56621 ) ) ( not ( = ?auto_56618 ?auto_56621 ) ) ( not ( = ?auto_56619 ?auto_56621 ) ) ( ON ?auto_56617 ?auto_56616 ) ( ON-TABLE ?auto_56621 ) ( ON ?auto_56622 ?auto_56617 ) ( ON ?auto_56619 ?auto_56622 ) ( ON ?auto_56618 ?auto_56619 ) ( CLEAR ?auto_56618 ) ( HOLDING ?auto_56620 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56620 )
      ( MAKE-2PILE ?auto_56616 ?auto_56617 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56623 - BLOCK
      ?auto_56624 - BLOCK
    )
    :vars
    (
      ?auto_56627 - BLOCK
      ?auto_56626 - BLOCK
      ?auto_56625 - BLOCK
      ?auto_56628 - BLOCK
      ?auto_56629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56623 ?auto_56624 ) ) ( not ( = ?auto_56623 ?auto_56627 ) ) ( not ( = ?auto_56624 ?auto_56627 ) ) ( not ( = ?auto_56626 ?auto_56625 ) ) ( not ( = ?auto_56626 ?auto_56628 ) ) ( not ( = ?auto_56626 ?auto_56627 ) ) ( not ( = ?auto_56626 ?auto_56624 ) ) ( not ( = ?auto_56626 ?auto_56623 ) ) ( not ( = ?auto_56625 ?auto_56628 ) ) ( not ( = ?auto_56625 ?auto_56627 ) ) ( not ( = ?auto_56625 ?auto_56624 ) ) ( not ( = ?auto_56625 ?auto_56623 ) ) ( not ( = ?auto_56628 ?auto_56627 ) ) ( not ( = ?auto_56628 ?auto_56624 ) ) ( not ( = ?auto_56628 ?auto_56623 ) ) ( ON ?auto_56623 ?auto_56629 ) ( not ( = ?auto_56623 ?auto_56629 ) ) ( not ( = ?auto_56624 ?auto_56629 ) ) ( not ( = ?auto_56627 ?auto_56629 ) ) ( not ( = ?auto_56626 ?auto_56629 ) ) ( not ( = ?auto_56625 ?auto_56629 ) ) ( not ( = ?auto_56628 ?auto_56629 ) ) ( ON ?auto_56624 ?auto_56623 ) ( ON-TABLE ?auto_56629 ) ( ON ?auto_56627 ?auto_56624 ) ( ON ?auto_56628 ?auto_56627 ) ( ON ?auto_56625 ?auto_56628 ) ( ON ?auto_56626 ?auto_56625 ) ( CLEAR ?auto_56626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56629 ?auto_56623 ?auto_56624 ?auto_56627 ?auto_56628 ?auto_56625 )
      ( MAKE-2PILE ?auto_56623 ?auto_56624 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56633 - BLOCK
      ?auto_56634 - BLOCK
      ?auto_56635 - BLOCK
    )
    :vars
    (
      ?auto_56636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56636 ?auto_56635 ) ( CLEAR ?auto_56636 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56633 ) ( ON ?auto_56634 ?auto_56633 ) ( ON ?auto_56635 ?auto_56634 ) ( not ( = ?auto_56633 ?auto_56634 ) ) ( not ( = ?auto_56633 ?auto_56635 ) ) ( not ( = ?auto_56633 ?auto_56636 ) ) ( not ( = ?auto_56634 ?auto_56635 ) ) ( not ( = ?auto_56634 ?auto_56636 ) ) ( not ( = ?auto_56635 ?auto_56636 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56636 ?auto_56635 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56637 - BLOCK
      ?auto_56638 - BLOCK
      ?auto_56639 - BLOCK
    )
    :vars
    (
      ?auto_56640 - BLOCK
      ?auto_56641 - BLOCK
      ?auto_56642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56640 ?auto_56639 ) ( CLEAR ?auto_56640 ) ( ON-TABLE ?auto_56637 ) ( ON ?auto_56638 ?auto_56637 ) ( ON ?auto_56639 ?auto_56638 ) ( not ( = ?auto_56637 ?auto_56638 ) ) ( not ( = ?auto_56637 ?auto_56639 ) ) ( not ( = ?auto_56637 ?auto_56640 ) ) ( not ( = ?auto_56638 ?auto_56639 ) ) ( not ( = ?auto_56638 ?auto_56640 ) ) ( not ( = ?auto_56639 ?auto_56640 ) ) ( HOLDING ?auto_56641 ) ( CLEAR ?auto_56642 ) ( not ( = ?auto_56637 ?auto_56641 ) ) ( not ( = ?auto_56637 ?auto_56642 ) ) ( not ( = ?auto_56638 ?auto_56641 ) ) ( not ( = ?auto_56638 ?auto_56642 ) ) ( not ( = ?auto_56639 ?auto_56641 ) ) ( not ( = ?auto_56639 ?auto_56642 ) ) ( not ( = ?auto_56640 ?auto_56641 ) ) ( not ( = ?auto_56640 ?auto_56642 ) ) ( not ( = ?auto_56641 ?auto_56642 ) ) )
    :subtasks
    ( ( !STACK ?auto_56641 ?auto_56642 )
      ( MAKE-3PILE ?auto_56637 ?auto_56638 ?auto_56639 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56643 - BLOCK
      ?auto_56644 - BLOCK
      ?auto_56645 - BLOCK
    )
    :vars
    (
      ?auto_56648 - BLOCK
      ?auto_56646 - BLOCK
      ?auto_56647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56648 ?auto_56645 ) ( ON-TABLE ?auto_56643 ) ( ON ?auto_56644 ?auto_56643 ) ( ON ?auto_56645 ?auto_56644 ) ( not ( = ?auto_56643 ?auto_56644 ) ) ( not ( = ?auto_56643 ?auto_56645 ) ) ( not ( = ?auto_56643 ?auto_56648 ) ) ( not ( = ?auto_56644 ?auto_56645 ) ) ( not ( = ?auto_56644 ?auto_56648 ) ) ( not ( = ?auto_56645 ?auto_56648 ) ) ( CLEAR ?auto_56646 ) ( not ( = ?auto_56643 ?auto_56647 ) ) ( not ( = ?auto_56643 ?auto_56646 ) ) ( not ( = ?auto_56644 ?auto_56647 ) ) ( not ( = ?auto_56644 ?auto_56646 ) ) ( not ( = ?auto_56645 ?auto_56647 ) ) ( not ( = ?auto_56645 ?auto_56646 ) ) ( not ( = ?auto_56648 ?auto_56647 ) ) ( not ( = ?auto_56648 ?auto_56646 ) ) ( not ( = ?auto_56647 ?auto_56646 ) ) ( ON ?auto_56647 ?auto_56648 ) ( CLEAR ?auto_56647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56643 ?auto_56644 ?auto_56645 ?auto_56648 )
      ( MAKE-3PILE ?auto_56643 ?auto_56644 ?auto_56645 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56649 - BLOCK
      ?auto_56650 - BLOCK
      ?auto_56651 - BLOCK
    )
    :vars
    (
      ?auto_56654 - BLOCK
      ?auto_56653 - BLOCK
      ?auto_56652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56654 ?auto_56651 ) ( ON-TABLE ?auto_56649 ) ( ON ?auto_56650 ?auto_56649 ) ( ON ?auto_56651 ?auto_56650 ) ( not ( = ?auto_56649 ?auto_56650 ) ) ( not ( = ?auto_56649 ?auto_56651 ) ) ( not ( = ?auto_56649 ?auto_56654 ) ) ( not ( = ?auto_56650 ?auto_56651 ) ) ( not ( = ?auto_56650 ?auto_56654 ) ) ( not ( = ?auto_56651 ?auto_56654 ) ) ( not ( = ?auto_56649 ?auto_56653 ) ) ( not ( = ?auto_56649 ?auto_56652 ) ) ( not ( = ?auto_56650 ?auto_56653 ) ) ( not ( = ?auto_56650 ?auto_56652 ) ) ( not ( = ?auto_56651 ?auto_56653 ) ) ( not ( = ?auto_56651 ?auto_56652 ) ) ( not ( = ?auto_56654 ?auto_56653 ) ) ( not ( = ?auto_56654 ?auto_56652 ) ) ( not ( = ?auto_56653 ?auto_56652 ) ) ( ON ?auto_56653 ?auto_56654 ) ( CLEAR ?auto_56653 ) ( HOLDING ?auto_56652 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56652 )
      ( MAKE-3PILE ?auto_56649 ?auto_56650 ?auto_56651 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56655 - BLOCK
      ?auto_56656 - BLOCK
      ?auto_56657 - BLOCK
    )
    :vars
    (
      ?auto_56658 - BLOCK
      ?auto_56659 - BLOCK
      ?auto_56660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56658 ?auto_56657 ) ( ON-TABLE ?auto_56655 ) ( ON ?auto_56656 ?auto_56655 ) ( ON ?auto_56657 ?auto_56656 ) ( not ( = ?auto_56655 ?auto_56656 ) ) ( not ( = ?auto_56655 ?auto_56657 ) ) ( not ( = ?auto_56655 ?auto_56658 ) ) ( not ( = ?auto_56656 ?auto_56657 ) ) ( not ( = ?auto_56656 ?auto_56658 ) ) ( not ( = ?auto_56657 ?auto_56658 ) ) ( not ( = ?auto_56655 ?auto_56659 ) ) ( not ( = ?auto_56655 ?auto_56660 ) ) ( not ( = ?auto_56656 ?auto_56659 ) ) ( not ( = ?auto_56656 ?auto_56660 ) ) ( not ( = ?auto_56657 ?auto_56659 ) ) ( not ( = ?auto_56657 ?auto_56660 ) ) ( not ( = ?auto_56658 ?auto_56659 ) ) ( not ( = ?auto_56658 ?auto_56660 ) ) ( not ( = ?auto_56659 ?auto_56660 ) ) ( ON ?auto_56659 ?auto_56658 ) ( ON ?auto_56660 ?auto_56659 ) ( CLEAR ?auto_56660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56655 ?auto_56656 ?auto_56657 ?auto_56658 ?auto_56659 )
      ( MAKE-3PILE ?auto_56655 ?auto_56656 ?auto_56657 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56661 - BLOCK
      ?auto_56662 - BLOCK
      ?auto_56663 - BLOCK
    )
    :vars
    (
      ?auto_56666 - BLOCK
      ?auto_56664 - BLOCK
      ?auto_56665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56666 ?auto_56663 ) ( ON-TABLE ?auto_56661 ) ( ON ?auto_56662 ?auto_56661 ) ( ON ?auto_56663 ?auto_56662 ) ( not ( = ?auto_56661 ?auto_56662 ) ) ( not ( = ?auto_56661 ?auto_56663 ) ) ( not ( = ?auto_56661 ?auto_56666 ) ) ( not ( = ?auto_56662 ?auto_56663 ) ) ( not ( = ?auto_56662 ?auto_56666 ) ) ( not ( = ?auto_56663 ?auto_56666 ) ) ( not ( = ?auto_56661 ?auto_56664 ) ) ( not ( = ?auto_56661 ?auto_56665 ) ) ( not ( = ?auto_56662 ?auto_56664 ) ) ( not ( = ?auto_56662 ?auto_56665 ) ) ( not ( = ?auto_56663 ?auto_56664 ) ) ( not ( = ?auto_56663 ?auto_56665 ) ) ( not ( = ?auto_56666 ?auto_56664 ) ) ( not ( = ?auto_56666 ?auto_56665 ) ) ( not ( = ?auto_56664 ?auto_56665 ) ) ( ON ?auto_56664 ?auto_56666 ) ( HOLDING ?auto_56665 ) ( CLEAR ?auto_56664 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56661 ?auto_56662 ?auto_56663 ?auto_56666 ?auto_56664 ?auto_56665 )
      ( MAKE-3PILE ?auto_56661 ?auto_56662 ?auto_56663 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56667 - BLOCK
      ?auto_56668 - BLOCK
      ?auto_56669 - BLOCK
    )
    :vars
    (
      ?auto_56671 - BLOCK
      ?auto_56670 - BLOCK
      ?auto_56672 - BLOCK
      ?auto_56673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56671 ?auto_56669 ) ( ON-TABLE ?auto_56667 ) ( ON ?auto_56668 ?auto_56667 ) ( ON ?auto_56669 ?auto_56668 ) ( not ( = ?auto_56667 ?auto_56668 ) ) ( not ( = ?auto_56667 ?auto_56669 ) ) ( not ( = ?auto_56667 ?auto_56671 ) ) ( not ( = ?auto_56668 ?auto_56669 ) ) ( not ( = ?auto_56668 ?auto_56671 ) ) ( not ( = ?auto_56669 ?auto_56671 ) ) ( not ( = ?auto_56667 ?auto_56670 ) ) ( not ( = ?auto_56667 ?auto_56672 ) ) ( not ( = ?auto_56668 ?auto_56670 ) ) ( not ( = ?auto_56668 ?auto_56672 ) ) ( not ( = ?auto_56669 ?auto_56670 ) ) ( not ( = ?auto_56669 ?auto_56672 ) ) ( not ( = ?auto_56671 ?auto_56670 ) ) ( not ( = ?auto_56671 ?auto_56672 ) ) ( not ( = ?auto_56670 ?auto_56672 ) ) ( ON ?auto_56670 ?auto_56671 ) ( CLEAR ?auto_56670 ) ( ON ?auto_56672 ?auto_56673 ) ( CLEAR ?auto_56672 ) ( HAND-EMPTY ) ( not ( = ?auto_56667 ?auto_56673 ) ) ( not ( = ?auto_56668 ?auto_56673 ) ) ( not ( = ?auto_56669 ?auto_56673 ) ) ( not ( = ?auto_56671 ?auto_56673 ) ) ( not ( = ?auto_56670 ?auto_56673 ) ) ( not ( = ?auto_56672 ?auto_56673 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56672 ?auto_56673 )
      ( MAKE-3PILE ?auto_56667 ?auto_56668 ?auto_56669 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56674 - BLOCK
      ?auto_56675 - BLOCK
      ?auto_56676 - BLOCK
    )
    :vars
    (
      ?auto_56678 - BLOCK
      ?auto_56680 - BLOCK
      ?auto_56677 - BLOCK
      ?auto_56679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56678 ?auto_56676 ) ( ON-TABLE ?auto_56674 ) ( ON ?auto_56675 ?auto_56674 ) ( ON ?auto_56676 ?auto_56675 ) ( not ( = ?auto_56674 ?auto_56675 ) ) ( not ( = ?auto_56674 ?auto_56676 ) ) ( not ( = ?auto_56674 ?auto_56678 ) ) ( not ( = ?auto_56675 ?auto_56676 ) ) ( not ( = ?auto_56675 ?auto_56678 ) ) ( not ( = ?auto_56676 ?auto_56678 ) ) ( not ( = ?auto_56674 ?auto_56680 ) ) ( not ( = ?auto_56674 ?auto_56677 ) ) ( not ( = ?auto_56675 ?auto_56680 ) ) ( not ( = ?auto_56675 ?auto_56677 ) ) ( not ( = ?auto_56676 ?auto_56680 ) ) ( not ( = ?auto_56676 ?auto_56677 ) ) ( not ( = ?auto_56678 ?auto_56680 ) ) ( not ( = ?auto_56678 ?auto_56677 ) ) ( not ( = ?auto_56680 ?auto_56677 ) ) ( ON ?auto_56677 ?auto_56679 ) ( CLEAR ?auto_56677 ) ( not ( = ?auto_56674 ?auto_56679 ) ) ( not ( = ?auto_56675 ?auto_56679 ) ) ( not ( = ?auto_56676 ?auto_56679 ) ) ( not ( = ?auto_56678 ?auto_56679 ) ) ( not ( = ?auto_56680 ?auto_56679 ) ) ( not ( = ?auto_56677 ?auto_56679 ) ) ( HOLDING ?auto_56680 ) ( CLEAR ?auto_56678 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56674 ?auto_56675 ?auto_56676 ?auto_56678 ?auto_56680 )
      ( MAKE-3PILE ?auto_56674 ?auto_56675 ?auto_56676 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56681 - BLOCK
      ?auto_56682 - BLOCK
      ?auto_56683 - BLOCK
    )
    :vars
    (
      ?auto_56687 - BLOCK
      ?auto_56685 - BLOCK
      ?auto_56686 - BLOCK
      ?auto_56684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56687 ?auto_56683 ) ( ON-TABLE ?auto_56681 ) ( ON ?auto_56682 ?auto_56681 ) ( ON ?auto_56683 ?auto_56682 ) ( not ( = ?auto_56681 ?auto_56682 ) ) ( not ( = ?auto_56681 ?auto_56683 ) ) ( not ( = ?auto_56681 ?auto_56687 ) ) ( not ( = ?auto_56682 ?auto_56683 ) ) ( not ( = ?auto_56682 ?auto_56687 ) ) ( not ( = ?auto_56683 ?auto_56687 ) ) ( not ( = ?auto_56681 ?auto_56685 ) ) ( not ( = ?auto_56681 ?auto_56686 ) ) ( not ( = ?auto_56682 ?auto_56685 ) ) ( not ( = ?auto_56682 ?auto_56686 ) ) ( not ( = ?auto_56683 ?auto_56685 ) ) ( not ( = ?auto_56683 ?auto_56686 ) ) ( not ( = ?auto_56687 ?auto_56685 ) ) ( not ( = ?auto_56687 ?auto_56686 ) ) ( not ( = ?auto_56685 ?auto_56686 ) ) ( ON ?auto_56686 ?auto_56684 ) ( not ( = ?auto_56681 ?auto_56684 ) ) ( not ( = ?auto_56682 ?auto_56684 ) ) ( not ( = ?auto_56683 ?auto_56684 ) ) ( not ( = ?auto_56687 ?auto_56684 ) ) ( not ( = ?auto_56685 ?auto_56684 ) ) ( not ( = ?auto_56686 ?auto_56684 ) ) ( CLEAR ?auto_56687 ) ( ON ?auto_56685 ?auto_56686 ) ( CLEAR ?auto_56685 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56684 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56684 ?auto_56686 )
      ( MAKE-3PILE ?auto_56681 ?auto_56682 ?auto_56683 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56702 - BLOCK
      ?auto_56703 - BLOCK
      ?auto_56704 - BLOCK
    )
    :vars
    (
      ?auto_56708 - BLOCK
      ?auto_56705 - BLOCK
      ?auto_56706 - BLOCK
      ?auto_56707 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56702 ) ( ON ?auto_56703 ?auto_56702 ) ( not ( = ?auto_56702 ?auto_56703 ) ) ( not ( = ?auto_56702 ?auto_56704 ) ) ( not ( = ?auto_56702 ?auto_56708 ) ) ( not ( = ?auto_56703 ?auto_56704 ) ) ( not ( = ?auto_56703 ?auto_56708 ) ) ( not ( = ?auto_56704 ?auto_56708 ) ) ( not ( = ?auto_56702 ?auto_56705 ) ) ( not ( = ?auto_56702 ?auto_56706 ) ) ( not ( = ?auto_56703 ?auto_56705 ) ) ( not ( = ?auto_56703 ?auto_56706 ) ) ( not ( = ?auto_56704 ?auto_56705 ) ) ( not ( = ?auto_56704 ?auto_56706 ) ) ( not ( = ?auto_56708 ?auto_56705 ) ) ( not ( = ?auto_56708 ?auto_56706 ) ) ( not ( = ?auto_56705 ?auto_56706 ) ) ( ON ?auto_56706 ?auto_56707 ) ( not ( = ?auto_56702 ?auto_56707 ) ) ( not ( = ?auto_56703 ?auto_56707 ) ) ( not ( = ?auto_56704 ?auto_56707 ) ) ( not ( = ?auto_56708 ?auto_56707 ) ) ( not ( = ?auto_56705 ?auto_56707 ) ) ( not ( = ?auto_56706 ?auto_56707 ) ) ( ON ?auto_56705 ?auto_56706 ) ( ON-TABLE ?auto_56707 ) ( ON ?auto_56708 ?auto_56705 ) ( CLEAR ?auto_56708 ) ( HOLDING ?auto_56704 ) ( CLEAR ?auto_56703 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56702 ?auto_56703 ?auto_56704 ?auto_56708 )
      ( MAKE-3PILE ?auto_56702 ?auto_56703 ?auto_56704 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56709 - BLOCK
      ?auto_56710 - BLOCK
      ?auto_56711 - BLOCK
    )
    :vars
    (
      ?auto_56714 - BLOCK
      ?auto_56712 - BLOCK
      ?auto_56713 - BLOCK
      ?auto_56715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56709 ) ( ON ?auto_56710 ?auto_56709 ) ( not ( = ?auto_56709 ?auto_56710 ) ) ( not ( = ?auto_56709 ?auto_56711 ) ) ( not ( = ?auto_56709 ?auto_56714 ) ) ( not ( = ?auto_56710 ?auto_56711 ) ) ( not ( = ?auto_56710 ?auto_56714 ) ) ( not ( = ?auto_56711 ?auto_56714 ) ) ( not ( = ?auto_56709 ?auto_56712 ) ) ( not ( = ?auto_56709 ?auto_56713 ) ) ( not ( = ?auto_56710 ?auto_56712 ) ) ( not ( = ?auto_56710 ?auto_56713 ) ) ( not ( = ?auto_56711 ?auto_56712 ) ) ( not ( = ?auto_56711 ?auto_56713 ) ) ( not ( = ?auto_56714 ?auto_56712 ) ) ( not ( = ?auto_56714 ?auto_56713 ) ) ( not ( = ?auto_56712 ?auto_56713 ) ) ( ON ?auto_56713 ?auto_56715 ) ( not ( = ?auto_56709 ?auto_56715 ) ) ( not ( = ?auto_56710 ?auto_56715 ) ) ( not ( = ?auto_56711 ?auto_56715 ) ) ( not ( = ?auto_56714 ?auto_56715 ) ) ( not ( = ?auto_56712 ?auto_56715 ) ) ( not ( = ?auto_56713 ?auto_56715 ) ) ( ON ?auto_56712 ?auto_56713 ) ( ON-TABLE ?auto_56715 ) ( ON ?auto_56714 ?auto_56712 ) ( CLEAR ?auto_56710 ) ( ON ?auto_56711 ?auto_56714 ) ( CLEAR ?auto_56711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56715 ?auto_56713 ?auto_56712 ?auto_56714 )
      ( MAKE-3PILE ?auto_56709 ?auto_56710 ?auto_56711 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56716 - BLOCK
      ?auto_56717 - BLOCK
      ?auto_56718 - BLOCK
    )
    :vars
    (
      ?auto_56719 - BLOCK
      ?auto_56721 - BLOCK
      ?auto_56722 - BLOCK
      ?auto_56720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56716 ) ( not ( = ?auto_56716 ?auto_56717 ) ) ( not ( = ?auto_56716 ?auto_56718 ) ) ( not ( = ?auto_56716 ?auto_56719 ) ) ( not ( = ?auto_56717 ?auto_56718 ) ) ( not ( = ?auto_56717 ?auto_56719 ) ) ( not ( = ?auto_56718 ?auto_56719 ) ) ( not ( = ?auto_56716 ?auto_56721 ) ) ( not ( = ?auto_56716 ?auto_56722 ) ) ( not ( = ?auto_56717 ?auto_56721 ) ) ( not ( = ?auto_56717 ?auto_56722 ) ) ( not ( = ?auto_56718 ?auto_56721 ) ) ( not ( = ?auto_56718 ?auto_56722 ) ) ( not ( = ?auto_56719 ?auto_56721 ) ) ( not ( = ?auto_56719 ?auto_56722 ) ) ( not ( = ?auto_56721 ?auto_56722 ) ) ( ON ?auto_56722 ?auto_56720 ) ( not ( = ?auto_56716 ?auto_56720 ) ) ( not ( = ?auto_56717 ?auto_56720 ) ) ( not ( = ?auto_56718 ?auto_56720 ) ) ( not ( = ?auto_56719 ?auto_56720 ) ) ( not ( = ?auto_56721 ?auto_56720 ) ) ( not ( = ?auto_56722 ?auto_56720 ) ) ( ON ?auto_56721 ?auto_56722 ) ( ON-TABLE ?auto_56720 ) ( ON ?auto_56719 ?auto_56721 ) ( ON ?auto_56718 ?auto_56719 ) ( CLEAR ?auto_56718 ) ( HOLDING ?auto_56717 ) ( CLEAR ?auto_56716 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56716 ?auto_56717 )
      ( MAKE-3PILE ?auto_56716 ?auto_56717 ?auto_56718 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56723 - BLOCK
      ?auto_56724 - BLOCK
      ?auto_56725 - BLOCK
    )
    :vars
    (
      ?auto_56727 - BLOCK
      ?auto_56729 - BLOCK
      ?auto_56728 - BLOCK
      ?auto_56726 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56723 ) ( not ( = ?auto_56723 ?auto_56724 ) ) ( not ( = ?auto_56723 ?auto_56725 ) ) ( not ( = ?auto_56723 ?auto_56727 ) ) ( not ( = ?auto_56724 ?auto_56725 ) ) ( not ( = ?auto_56724 ?auto_56727 ) ) ( not ( = ?auto_56725 ?auto_56727 ) ) ( not ( = ?auto_56723 ?auto_56729 ) ) ( not ( = ?auto_56723 ?auto_56728 ) ) ( not ( = ?auto_56724 ?auto_56729 ) ) ( not ( = ?auto_56724 ?auto_56728 ) ) ( not ( = ?auto_56725 ?auto_56729 ) ) ( not ( = ?auto_56725 ?auto_56728 ) ) ( not ( = ?auto_56727 ?auto_56729 ) ) ( not ( = ?auto_56727 ?auto_56728 ) ) ( not ( = ?auto_56729 ?auto_56728 ) ) ( ON ?auto_56728 ?auto_56726 ) ( not ( = ?auto_56723 ?auto_56726 ) ) ( not ( = ?auto_56724 ?auto_56726 ) ) ( not ( = ?auto_56725 ?auto_56726 ) ) ( not ( = ?auto_56727 ?auto_56726 ) ) ( not ( = ?auto_56729 ?auto_56726 ) ) ( not ( = ?auto_56728 ?auto_56726 ) ) ( ON ?auto_56729 ?auto_56728 ) ( ON-TABLE ?auto_56726 ) ( ON ?auto_56727 ?auto_56729 ) ( ON ?auto_56725 ?auto_56727 ) ( CLEAR ?auto_56723 ) ( ON ?auto_56724 ?auto_56725 ) ( CLEAR ?auto_56724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56726 ?auto_56728 ?auto_56729 ?auto_56727 ?auto_56725 )
      ( MAKE-3PILE ?auto_56723 ?auto_56724 ?auto_56725 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56730 - BLOCK
      ?auto_56731 - BLOCK
      ?auto_56732 - BLOCK
    )
    :vars
    (
      ?auto_56736 - BLOCK
      ?auto_56733 - BLOCK
      ?auto_56735 - BLOCK
      ?auto_56734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56730 ?auto_56731 ) ) ( not ( = ?auto_56730 ?auto_56732 ) ) ( not ( = ?auto_56730 ?auto_56736 ) ) ( not ( = ?auto_56731 ?auto_56732 ) ) ( not ( = ?auto_56731 ?auto_56736 ) ) ( not ( = ?auto_56732 ?auto_56736 ) ) ( not ( = ?auto_56730 ?auto_56733 ) ) ( not ( = ?auto_56730 ?auto_56735 ) ) ( not ( = ?auto_56731 ?auto_56733 ) ) ( not ( = ?auto_56731 ?auto_56735 ) ) ( not ( = ?auto_56732 ?auto_56733 ) ) ( not ( = ?auto_56732 ?auto_56735 ) ) ( not ( = ?auto_56736 ?auto_56733 ) ) ( not ( = ?auto_56736 ?auto_56735 ) ) ( not ( = ?auto_56733 ?auto_56735 ) ) ( ON ?auto_56735 ?auto_56734 ) ( not ( = ?auto_56730 ?auto_56734 ) ) ( not ( = ?auto_56731 ?auto_56734 ) ) ( not ( = ?auto_56732 ?auto_56734 ) ) ( not ( = ?auto_56736 ?auto_56734 ) ) ( not ( = ?auto_56733 ?auto_56734 ) ) ( not ( = ?auto_56735 ?auto_56734 ) ) ( ON ?auto_56733 ?auto_56735 ) ( ON-TABLE ?auto_56734 ) ( ON ?auto_56736 ?auto_56733 ) ( ON ?auto_56732 ?auto_56736 ) ( ON ?auto_56731 ?auto_56732 ) ( CLEAR ?auto_56731 ) ( HOLDING ?auto_56730 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56730 )
      ( MAKE-3PILE ?auto_56730 ?auto_56731 ?auto_56732 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56737 - BLOCK
      ?auto_56738 - BLOCK
      ?auto_56739 - BLOCK
    )
    :vars
    (
      ?auto_56741 - BLOCK
      ?auto_56743 - BLOCK
      ?auto_56742 - BLOCK
      ?auto_56740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56737 ?auto_56738 ) ) ( not ( = ?auto_56737 ?auto_56739 ) ) ( not ( = ?auto_56737 ?auto_56741 ) ) ( not ( = ?auto_56738 ?auto_56739 ) ) ( not ( = ?auto_56738 ?auto_56741 ) ) ( not ( = ?auto_56739 ?auto_56741 ) ) ( not ( = ?auto_56737 ?auto_56743 ) ) ( not ( = ?auto_56737 ?auto_56742 ) ) ( not ( = ?auto_56738 ?auto_56743 ) ) ( not ( = ?auto_56738 ?auto_56742 ) ) ( not ( = ?auto_56739 ?auto_56743 ) ) ( not ( = ?auto_56739 ?auto_56742 ) ) ( not ( = ?auto_56741 ?auto_56743 ) ) ( not ( = ?auto_56741 ?auto_56742 ) ) ( not ( = ?auto_56743 ?auto_56742 ) ) ( ON ?auto_56742 ?auto_56740 ) ( not ( = ?auto_56737 ?auto_56740 ) ) ( not ( = ?auto_56738 ?auto_56740 ) ) ( not ( = ?auto_56739 ?auto_56740 ) ) ( not ( = ?auto_56741 ?auto_56740 ) ) ( not ( = ?auto_56743 ?auto_56740 ) ) ( not ( = ?auto_56742 ?auto_56740 ) ) ( ON ?auto_56743 ?auto_56742 ) ( ON-TABLE ?auto_56740 ) ( ON ?auto_56741 ?auto_56743 ) ( ON ?auto_56739 ?auto_56741 ) ( ON ?auto_56738 ?auto_56739 ) ( ON ?auto_56737 ?auto_56738 ) ( CLEAR ?auto_56737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56740 ?auto_56742 ?auto_56743 ?auto_56741 ?auto_56739 ?auto_56738 )
      ( MAKE-3PILE ?auto_56737 ?auto_56738 ?auto_56739 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56747 - BLOCK
      ?auto_56748 - BLOCK
      ?auto_56749 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_56749 ) ( CLEAR ?auto_56748 ) ( ON-TABLE ?auto_56747 ) ( ON ?auto_56748 ?auto_56747 ) ( not ( = ?auto_56747 ?auto_56748 ) ) ( not ( = ?auto_56747 ?auto_56749 ) ) ( not ( = ?auto_56748 ?auto_56749 ) ) )
    :subtasks
    ( ( !STACK ?auto_56749 ?auto_56748 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56750 - BLOCK
      ?auto_56751 - BLOCK
      ?auto_56752 - BLOCK
    )
    :vars
    (
      ?auto_56753 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_56751 ) ( ON-TABLE ?auto_56750 ) ( ON ?auto_56751 ?auto_56750 ) ( not ( = ?auto_56750 ?auto_56751 ) ) ( not ( = ?auto_56750 ?auto_56752 ) ) ( not ( = ?auto_56751 ?auto_56752 ) ) ( ON ?auto_56752 ?auto_56753 ) ( CLEAR ?auto_56752 ) ( HAND-EMPTY ) ( not ( = ?auto_56750 ?auto_56753 ) ) ( not ( = ?auto_56751 ?auto_56753 ) ) ( not ( = ?auto_56752 ?auto_56753 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56752 ?auto_56753 )
      ( MAKE-3PILE ?auto_56750 ?auto_56751 ?auto_56752 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56754 - BLOCK
      ?auto_56755 - BLOCK
      ?auto_56756 - BLOCK
    )
    :vars
    (
      ?auto_56757 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56754 ) ( not ( = ?auto_56754 ?auto_56755 ) ) ( not ( = ?auto_56754 ?auto_56756 ) ) ( not ( = ?auto_56755 ?auto_56756 ) ) ( ON ?auto_56756 ?auto_56757 ) ( CLEAR ?auto_56756 ) ( not ( = ?auto_56754 ?auto_56757 ) ) ( not ( = ?auto_56755 ?auto_56757 ) ) ( not ( = ?auto_56756 ?auto_56757 ) ) ( HOLDING ?auto_56755 ) ( CLEAR ?auto_56754 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56754 ?auto_56755 )
      ( MAKE-3PILE ?auto_56754 ?auto_56755 ?auto_56756 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56758 - BLOCK
      ?auto_56759 - BLOCK
      ?auto_56760 - BLOCK
    )
    :vars
    (
      ?auto_56761 - BLOCK
      ?auto_56762 - BLOCK
      ?auto_56763 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56758 ) ( not ( = ?auto_56758 ?auto_56759 ) ) ( not ( = ?auto_56758 ?auto_56760 ) ) ( not ( = ?auto_56759 ?auto_56760 ) ) ( ON ?auto_56760 ?auto_56761 ) ( not ( = ?auto_56758 ?auto_56761 ) ) ( not ( = ?auto_56759 ?auto_56761 ) ) ( not ( = ?auto_56760 ?auto_56761 ) ) ( CLEAR ?auto_56758 ) ( ON ?auto_56759 ?auto_56760 ) ( CLEAR ?auto_56759 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56762 ) ( ON ?auto_56763 ?auto_56762 ) ( ON ?auto_56761 ?auto_56763 ) ( not ( = ?auto_56762 ?auto_56763 ) ) ( not ( = ?auto_56762 ?auto_56761 ) ) ( not ( = ?auto_56762 ?auto_56760 ) ) ( not ( = ?auto_56762 ?auto_56759 ) ) ( not ( = ?auto_56763 ?auto_56761 ) ) ( not ( = ?auto_56763 ?auto_56760 ) ) ( not ( = ?auto_56763 ?auto_56759 ) ) ( not ( = ?auto_56758 ?auto_56762 ) ) ( not ( = ?auto_56758 ?auto_56763 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56762 ?auto_56763 ?auto_56761 ?auto_56760 )
      ( MAKE-3PILE ?auto_56758 ?auto_56759 ?auto_56760 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56764 - BLOCK
      ?auto_56765 - BLOCK
      ?auto_56766 - BLOCK
    )
    :vars
    (
      ?auto_56767 - BLOCK
      ?auto_56768 - BLOCK
      ?auto_56769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56764 ?auto_56765 ) ) ( not ( = ?auto_56764 ?auto_56766 ) ) ( not ( = ?auto_56765 ?auto_56766 ) ) ( ON ?auto_56766 ?auto_56767 ) ( not ( = ?auto_56764 ?auto_56767 ) ) ( not ( = ?auto_56765 ?auto_56767 ) ) ( not ( = ?auto_56766 ?auto_56767 ) ) ( ON ?auto_56765 ?auto_56766 ) ( CLEAR ?auto_56765 ) ( ON-TABLE ?auto_56768 ) ( ON ?auto_56769 ?auto_56768 ) ( ON ?auto_56767 ?auto_56769 ) ( not ( = ?auto_56768 ?auto_56769 ) ) ( not ( = ?auto_56768 ?auto_56767 ) ) ( not ( = ?auto_56768 ?auto_56766 ) ) ( not ( = ?auto_56768 ?auto_56765 ) ) ( not ( = ?auto_56769 ?auto_56767 ) ) ( not ( = ?auto_56769 ?auto_56766 ) ) ( not ( = ?auto_56769 ?auto_56765 ) ) ( not ( = ?auto_56764 ?auto_56768 ) ) ( not ( = ?auto_56764 ?auto_56769 ) ) ( HOLDING ?auto_56764 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56764 )
      ( MAKE-3PILE ?auto_56764 ?auto_56765 ?auto_56766 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56770 - BLOCK
      ?auto_56771 - BLOCK
      ?auto_56772 - BLOCK
    )
    :vars
    (
      ?auto_56773 - BLOCK
      ?auto_56774 - BLOCK
      ?auto_56775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56770 ?auto_56771 ) ) ( not ( = ?auto_56770 ?auto_56772 ) ) ( not ( = ?auto_56771 ?auto_56772 ) ) ( ON ?auto_56772 ?auto_56773 ) ( not ( = ?auto_56770 ?auto_56773 ) ) ( not ( = ?auto_56771 ?auto_56773 ) ) ( not ( = ?auto_56772 ?auto_56773 ) ) ( ON ?auto_56771 ?auto_56772 ) ( ON-TABLE ?auto_56774 ) ( ON ?auto_56775 ?auto_56774 ) ( ON ?auto_56773 ?auto_56775 ) ( not ( = ?auto_56774 ?auto_56775 ) ) ( not ( = ?auto_56774 ?auto_56773 ) ) ( not ( = ?auto_56774 ?auto_56772 ) ) ( not ( = ?auto_56774 ?auto_56771 ) ) ( not ( = ?auto_56775 ?auto_56773 ) ) ( not ( = ?auto_56775 ?auto_56772 ) ) ( not ( = ?auto_56775 ?auto_56771 ) ) ( not ( = ?auto_56770 ?auto_56774 ) ) ( not ( = ?auto_56770 ?auto_56775 ) ) ( ON ?auto_56770 ?auto_56771 ) ( CLEAR ?auto_56770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56774 ?auto_56775 ?auto_56773 ?auto_56772 ?auto_56771 )
      ( MAKE-3PILE ?auto_56770 ?auto_56771 ?auto_56772 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56776 - BLOCK
      ?auto_56777 - BLOCK
      ?auto_56778 - BLOCK
    )
    :vars
    (
      ?auto_56779 - BLOCK
      ?auto_56780 - BLOCK
      ?auto_56781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56776 ?auto_56777 ) ) ( not ( = ?auto_56776 ?auto_56778 ) ) ( not ( = ?auto_56777 ?auto_56778 ) ) ( ON ?auto_56778 ?auto_56779 ) ( not ( = ?auto_56776 ?auto_56779 ) ) ( not ( = ?auto_56777 ?auto_56779 ) ) ( not ( = ?auto_56778 ?auto_56779 ) ) ( ON ?auto_56777 ?auto_56778 ) ( ON-TABLE ?auto_56780 ) ( ON ?auto_56781 ?auto_56780 ) ( ON ?auto_56779 ?auto_56781 ) ( not ( = ?auto_56780 ?auto_56781 ) ) ( not ( = ?auto_56780 ?auto_56779 ) ) ( not ( = ?auto_56780 ?auto_56778 ) ) ( not ( = ?auto_56780 ?auto_56777 ) ) ( not ( = ?auto_56781 ?auto_56779 ) ) ( not ( = ?auto_56781 ?auto_56778 ) ) ( not ( = ?auto_56781 ?auto_56777 ) ) ( not ( = ?auto_56776 ?auto_56780 ) ) ( not ( = ?auto_56776 ?auto_56781 ) ) ( HOLDING ?auto_56776 ) ( CLEAR ?auto_56777 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56780 ?auto_56781 ?auto_56779 ?auto_56778 ?auto_56777 ?auto_56776 )
      ( MAKE-3PILE ?auto_56776 ?auto_56777 ?auto_56778 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56782 - BLOCK
      ?auto_56783 - BLOCK
      ?auto_56784 - BLOCK
    )
    :vars
    (
      ?auto_56785 - BLOCK
      ?auto_56787 - BLOCK
      ?auto_56786 - BLOCK
      ?auto_56788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56782 ?auto_56783 ) ) ( not ( = ?auto_56782 ?auto_56784 ) ) ( not ( = ?auto_56783 ?auto_56784 ) ) ( ON ?auto_56784 ?auto_56785 ) ( not ( = ?auto_56782 ?auto_56785 ) ) ( not ( = ?auto_56783 ?auto_56785 ) ) ( not ( = ?auto_56784 ?auto_56785 ) ) ( ON ?auto_56783 ?auto_56784 ) ( ON-TABLE ?auto_56787 ) ( ON ?auto_56786 ?auto_56787 ) ( ON ?auto_56785 ?auto_56786 ) ( not ( = ?auto_56787 ?auto_56786 ) ) ( not ( = ?auto_56787 ?auto_56785 ) ) ( not ( = ?auto_56787 ?auto_56784 ) ) ( not ( = ?auto_56787 ?auto_56783 ) ) ( not ( = ?auto_56786 ?auto_56785 ) ) ( not ( = ?auto_56786 ?auto_56784 ) ) ( not ( = ?auto_56786 ?auto_56783 ) ) ( not ( = ?auto_56782 ?auto_56787 ) ) ( not ( = ?auto_56782 ?auto_56786 ) ) ( CLEAR ?auto_56783 ) ( ON ?auto_56782 ?auto_56788 ) ( CLEAR ?auto_56782 ) ( HAND-EMPTY ) ( not ( = ?auto_56782 ?auto_56788 ) ) ( not ( = ?auto_56783 ?auto_56788 ) ) ( not ( = ?auto_56784 ?auto_56788 ) ) ( not ( = ?auto_56785 ?auto_56788 ) ) ( not ( = ?auto_56787 ?auto_56788 ) ) ( not ( = ?auto_56786 ?auto_56788 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56782 ?auto_56788 )
      ( MAKE-3PILE ?auto_56782 ?auto_56783 ?auto_56784 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56789 - BLOCK
      ?auto_56790 - BLOCK
      ?auto_56791 - BLOCK
    )
    :vars
    (
      ?auto_56792 - BLOCK
      ?auto_56794 - BLOCK
      ?auto_56793 - BLOCK
      ?auto_56795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56789 ?auto_56790 ) ) ( not ( = ?auto_56789 ?auto_56791 ) ) ( not ( = ?auto_56790 ?auto_56791 ) ) ( ON ?auto_56791 ?auto_56792 ) ( not ( = ?auto_56789 ?auto_56792 ) ) ( not ( = ?auto_56790 ?auto_56792 ) ) ( not ( = ?auto_56791 ?auto_56792 ) ) ( ON-TABLE ?auto_56794 ) ( ON ?auto_56793 ?auto_56794 ) ( ON ?auto_56792 ?auto_56793 ) ( not ( = ?auto_56794 ?auto_56793 ) ) ( not ( = ?auto_56794 ?auto_56792 ) ) ( not ( = ?auto_56794 ?auto_56791 ) ) ( not ( = ?auto_56794 ?auto_56790 ) ) ( not ( = ?auto_56793 ?auto_56792 ) ) ( not ( = ?auto_56793 ?auto_56791 ) ) ( not ( = ?auto_56793 ?auto_56790 ) ) ( not ( = ?auto_56789 ?auto_56794 ) ) ( not ( = ?auto_56789 ?auto_56793 ) ) ( ON ?auto_56789 ?auto_56795 ) ( CLEAR ?auto_56789 ) ( not ( = ?auto_56789 ?auto_56795 ) ) ( not ( = ?auto_56790 ?auto_56795 ) ) ( not ( = ?auto_56791 ?auto_56795 ) ) ( not ( = ?auto_56792 ?auto_56795 ) ) ( not ( = ?auto_56794 ?auto_56795 ) ) ( not ( = ?auto_56793 ?auto_56795 ) ) ( HOLDING ?auto_56790 ) ( CLEAR ?auto_56791 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56794 ?auto_56793 ?auto_56792 ?auto_56791 ?auto_56790 )
      ( MAKE-3PILE ?auto_56789 ?auto_56790 ?auto_56791 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56796 - BLOCK
      ?auto_56797 - BLOCK
      ?auto_56798 - BLOCK
    )
    :vars
    (
      ?auto_56799 - BLOCK
      ?auto_56801 - BLOCK
      ?auto_56802 - BLOCK
      ?auto_56800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56796 ?auto_56797 ) ) ( not ( = ?auto_56796 ?auto_56798 ) ) ( not ( = ?auto_56797 ?auto_56798 ) ) ( ON ?auto_56798 ?auto_56799 ) ( not ( = ?auto_56796 ?auto_56799 ) ) ( not ( = ?auto_56797 ?auto_56799 ) ) ( not ( = ?auto_56798 ?auto_56799 ) ) ( ON-TABLE ?auto_56801 ) ( ON ?auto_56802 ?auto_56801 ) ( ON ?auto_56799 ?auto_56802 ) ( not ( = ?auto_56801 ?auto_56802 ) ) ( not ( = ?auto_56801 ?auto_56799 ) ) ( not ( = ?auto_56801 ?auto_56798 ) ) ( not ( = ?auto_56801 ?auto_56797 ) ) ( not ( = ?auto_56802 ?auto_56799 ) ) ( not ( = ?auto_56802 ?auto_56798 ) ) ( not ( = ?auto_56802 ?auto_56797 ) ) ( not ( = ?auto_56796 ?auto_56801 ) ) ( not ( = ?auto_56796 ?auto_56802 ) ) ( ON ?auto_56796 ?auto_56800 ) ( not ( = ?auto_56796 ?auto_56800 ) ) ( not ( = ?auto_56797 ?auto_56800 ) ) ( not ( = ?auto_56798 ?auto_56800 ) ) ( not ( = ?auto_56799 ?auto_56800 ) ) ( not ( = ?auto_56801 ?auto_56800 ) ) ( not ( = ?auto_56802 ?auto_56800 ) ) ( CLEAR ?auto_56798 ) ( ON ?auto_56797 ?auto_56796 ) ( CLEAR ?auto_56797 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56800 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56800 ?auto_56796 )
      ( MAKE-3PILE ?auto_56796 ?auto_56797 ?auto_56798 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56803 - BLOCK
      ?auto_56804 - BLOCK
      ?auto_56805 - BLOCK
    )
    :vars
    (
      ?auto_56807 - BLOCK
      ?auto_56809 - BLOCK
      ?auto_56808 - BLOCK
      ?auto_56806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56803 ?auto_56804 ) ) ( not ( = ?auto_56803 ?auto_56805 ) ) ( not ( = ?auto_56804 ?auto_56805 ) ) ( not ( = ?auto_56803 ?auto_56807 ) ) ( not ( = ?auto_56804 ?auto_56807 ) ) ( not ( = ?auto_56805 ?auto_56807 ) ) ( ON-TABLE ?auto_56809 ) ( ON ?auto_56808 ?auto_56809 ) ( ON ?auto_56807 ?auto_56808 ) ( not ( = ?auto_56809 ?auto_56808 ) ) ( not ( = ?auto_56809 ?auto_56807 ) ) ( not ( = ?auto_56809 ?auto_56805 ) ) ( not ( = ?auto_56809 ?auto_56804 ) ) ( not ( = ?auto_56808 ?auto_56807 ) ) ( not ( = ?auto_56808 ?auto_56805 ) ) ( not ( = ?auto_56808 ?auto_56804 ) ) ( not ( = ?auto_56803 ?auto_56809 ) ) ( not ( = ?auto_56803 ?auto_56808 ) ) ( ON ?auto_56803 ?auto_56806 ) ( not ( = ?auto_56803 ?auto_56806 ) ) ( not ( = ?auto_56804 ?auto_56806 ) ) ( not ( = ?auto_56805 ?auto_56806 ) ) ( not ( = ?auto_56807 ?auto_56806 ) ) ( not ( = ?auto_56809 ?auto_56806 ) ) ( not ( = ?auto_56808 ?auto_56806 ) ) ( ON ?auto_56804 ?auto_56803 ) ( CLEAR ?auto_56804 ) ( ON-TABLE ?auto_56806 ) ( HOLDING ?auto_56805 ) ( CLEAR ?auto_56807 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56809 ?auto_56808 ?auto_56807 ?auto_56805 )
      ( MAKE-3PILE ?auto_56803 ?auto_56804 ?auto_56805 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56810 - BLOCK
      ?auto_56811 - BLOCK
      ?auto_56812 - BLOCK
    )
    :vars
    (
      ?auto_56814 - BLOCK
      ?auto_56813 - BLOCK
      ?auto_56816 - BLOCK
      ?auto_56815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56810 ?auto_56811 ) ) ( not ( = ?auto_56810 ?auto_56812 ) ) ( not ( = ?auto_56811 ?auto_56812 ) ) ( not ( = ?auto_56810 ?auto_56814 ) ) ( not ( = ?auto_56811 ?auto_56814 ) ) ( not ( = ?auto_56812 ?auto_56814 ) ) ( ON-TABLE ?auto_56813 ) ( ON ?auto_56816 ?auto_56813 ) ( ON ?auto_56814 ?auto_56816 ) ( not ( = ?auto_56813 ?auto_56816 ) ) ( not ( = ?auto_56813 ?auto_56814 ) ) ( not ( = ?auto_56813 ?auto_56812 ) ) ( not ( = ?auto_56813 ?auto_56811 ) ) ( not ( = ?auto_56816 ?auto_56814 ) ) ( not ( = ?auto_56816 ?auto_56812 ) ) ( not ( = ?auto_56816 ?auto_56811 ) ) ( not ( = ?auto_56810 ?auto_56813 ) ) ( not ( = ?auto_56810 ?auto_56816 ) ) ( ON ?auto_56810 ?auto_56815 ) ( not ( = ?auto_56810 ?auto_56815 ) ) ( not ( = ?auto_56811 ?auto_56815 ) ) ( not ( = ?auto_56812 ?auto_56815 ) ) ( not ( = ?auto_56814 ?auto_56815 ) ) ( not ( = ?auto_56813 ?auto_56815 ) ) ( not ( = ?auto_56816 ?auto_56815 ) ) ( ON ?auto_56811 ?auto_56810 ) ( ON-TABLE ?auto_56815 ) ( CLEAR ?auto_56814 ) ( ON ?auto_56812 ?auto_56811 ) ( CLEAR ?auto_56812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56815 ?auto_56810 ?auto_56811 )
      ( MAKE-3PILE ?auto_56810 ?auto_56811 ?auto_56812 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56817 - BLOCK
      ?auto_56818 - BLOCK
      ?auto_56819 - BLOCK
    )
    :vars
    (
      ?auto_56821 - BLOCK
      ?auto_56823 - BLOCK
      ?auto_56820 - BLOCK
      ?auto_56822 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56817 ?auto_56818 ) ) ( not ( = ?auto_56817 ?auto_56819 ) ) ( not ( = ?auto_56818 ?auto_56819 ) ) ( not ( = ?auto_56817 ?auto_56821 ) ) ( not ( = ?auto_56818 ?auto_56821 ) ) ( not ( = ?auto_56819 ?auto_56821 ) ) ( ON-TABLE ?auto_56823 ) ( ON ?auto_56820 ?auto_56823 ) ( not ( = ?auto_56823 ?auto_56820 ) ) ( not ( = ?auto_56823 ?auto_56821 ) ) ( not ( = ?auto_56823 ?auto_56819 ) ) ( not ( = ?auto_56823 ?auto_56818 ) ) ( not ( = ?auto_56820 ?auto_56821 ) ) ( not ( = ?auto_56820 ?auto_56819 ) ) ( not ( = ?auto_56820 ?auto_56818 ) ) ( not ( = ?auto_56817 ?auto_56823 ) ) ( not ( = ?auto_56817 ?auto_56820 ) ) ( ON ?auto_56817 ?auto_56822 ) ( not ( = ?auto_56817 ?auto_56822 ) ) ( not ( = ?auto_56818 ?auto_56822 ) ) ( not ( = ?auto_56819 ?auto_56822 ) ) ( not ( = ?auto_56821 ?auto_56822 ) ) ( not ( = ?auto_56823 ?auto_56822 ) ) ( not ( = ?auto_56820 ?auto_56822 ) ) ( ON ?auto_56818 ?auto_56817 ) ( ON-TABLE ?auto_56822 ) ( ON ?auto_56819 ?auto_56818 ) ( CLEAR ?auto_56819 ) ( HOLDING ?auto_56821 ) ( CLEAR ?auto_56820 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56823 ?auto_56820 ?auto_56821 )
      ( MAKE-3PILE ?auto_56817 ?auto_56818 ?auto_56819 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56824 - BLOCK
      ?auto_56825 - BLOCK
      ?auto_56826 - BLOCK
    )
    :vars
    (
      ?auto_56828 - BLOCK
      ?auto_56827 - BLOCK
      ?auto_56829 - BLOCK
      ?auto_56830 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56824 ?auto_56825 ) ) ( not ( = ?auto_56824 ?auto_56826 ) ) ( not ( = ?auto_56825 ?auto_56826 ) ) ( not ( = ?auto_56824 ?auto_56828 ) ) ( not ( = ?auto_56825 ?auto_56828 ) ) ( not ( = ?auto_56826 ?auto_56828 ) ) ( ON-TABLE ?auto_56827 ) ( ON ?auto_56829 ?auto_56827 ) ( not ( = ?auto_56827 ?auto_56829 ) ) ( not ( = ?auto_56827 ?auto_56828 ) ) ( not ( = ?auto_56827 ?auto_56826 ) ) ( not ( = ?auto_56827 ?auto_56825 ) ) ( not ( = ?auto_56829 ?auto_56828 ) ) ( not ( = ?auto_56829 ?auto_56826 ) ) ( not ( = ?auto_56829 ?auto_56825 ) ) ( not ( = ?auto_56824 ?auto_56827 ) ) ( not ( = ?auto_56824 ?auto_56829 ) ) ( ON ?auto_56824 ?auto_56830 ) ( not ( = ?auto_56824 ?auto_56830 ) ) ( not ( = ?auto_56825 ?auto_56830 ) ) ( not ( = ?auto_56826 ?auto_56830 ) ) ( not ( = ?auto_56828 ?auto_56830 ) ) ( not ( = ?auto_56827 ?auto_56830 ) ) ( not ( = ?auto_56829 ?auto_56830 ) ) ( ON ?auto_56825 ?auto_56824 ) ( ON-TABLE ?auto_56830 ) ( ON ?auto_56826 ?auto_56825 ) ( CLEAR ?auto_56829 ) ( ON ?auto_56828 ?auto_56826 ) ( CLEAR ?auto_56828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56830 ?auto_56824 ?auto_56825 ?auto_56826 )
      ( MAKE-3PILE ?auto_56824 ?auto_56825 ?auto_56826 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56831 - BLOCK
      ?auto_56832 - BLOCK
      ?auto_56833 - BLOCK
    )
    :vars
    (
      ?auto_56837 - BLOCK
      ?auto_56834 - BLOCK
      ?auto_56835 - BLOCK
      ?auto_56836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56831 ?auto_56832 ) ) ( not ( = ?auto_56831 ?auto_56833 ) ) ( not ( = ?auto_56832 ?auto_56833 ) ) ( not ( = ?auto_56831 ?auto_56837 ) ) ( not ( = ?auto_56832 ?auto_56837 ) ) ( not ( = ?auto_56833 ?auto_56837 ) ) ( ON-TABLE ?auto_56834 ) ( not ( = ?auto_56834 ?auto_56835 ) ) ( not ( = ?auto_56834 ?auto_56837 ) ) ( not ( = ?auto_56834 ?auto_56833 ) ) ( not ( = ?auto_56834 ?auto_56832 ) ) ( not ( = ?auto_56835 ?auto_56837 ) ) ( not ( = ?auto_56835 ?auto_56833 ) ) ( not ( = ?auto_56835 ?auto_56832 ) ) ( not ( = ?auto_56831 ?auto_56834 ) ) ( not ( = ?auto_56831 ?auto_56835 ) ) ( ON ?auto_56831 ?auto_56836 ) ( not ( = ?auto_56831 ?auto_56836 ) ) ( not ( = ?auto_56832 ?auto_56836 ) ) ( not ( = ?auto_56833 ?auto_56836 ) ) ( not ( = ?auto_56837 ?auto_56836 ) ) ( not ( = ?auto_56834 ?auto_56836 ) ) ( not ( = ?auto_56835 ?auto_56836 ) ) ( ON ?auto_56832 ?auto_56831 ) ( ON-TABLE ?auto_56836 ) ( ON ?auto_56833 ?auto_56832 ) ( ON ?auto_56837 ?auto_56833 ) ( CLEAR ?auto_56837 ) ( HOLDING ?auto_56835 ) ( CLEAR ?auto_56834 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56834 ?auto_56835 )
      ( MAKE-3PILE ?auto_56831 ?auto_56832 ?auto_56833 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56838 - BLOCK
      ?auto_56839 - BLOCK
      ?auto_56840 - BLOCK
    )
    :vars
    (
      ?auto_56841 - BLOCK
      ?auto_56844 - BLOCK
      ?auto_56843 - BLOCK
      ?auto_56842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56838 ?auto_56839 ) ) ( not ( = ?auto_56838 ?auto_56840 ) ) ( not ( = ?auto_56839 ?auto_56840 ) ) ( not ( = ?auto_56838 ?auto_56841 ) ) ( not ( = ?auto_56839 ?auto_56841 ) ) ( not ( = ?auto_56840 ?auto_56841 ) ) ( ON-TABLE ?auto_56844 ) ( not ( = ?auto_56844 ?auto_56843 ) ) ( not ( = ?auto_56844 ?auto_56841 ) ) ( not ( = ?auto_56844 ?auto_56840 ) ) ( not ( = ?auto_56844 ?auto_56839 ) ) ( not ( = ?auto_56843 ?auto_56841 ) ) ( not ( = ?auto_56843 ?auto_56840 ) ) ( not ( = ?auto_56843 ?auto_56839 ) ) ( not ( = ?auto_56838 ?auto_56844 ) ) ( not ( = ?auto_56838 ?auto_56843 ) ) ( ON ?auto_56838 ?auto_56842 ) ( not ( = ?auto_56838 ?auto_56842 ) ) ( not ( = ?auto_56839 ?auto_56842 ) ) ( not ( = ?auto_56840 ?auto_56842 ) ) ( not ( = ?auto_56841 ?auto_56842 ) ) ( not ( = ?auto_56844 ?auto_56842 ) ) ( not ( = ?auto_56843 ?auto_56842 ) ) ( ON ?auto_56839 ?auto_56838 ) ( ON-TABLE ?auto_56842 ) ( ON ?auto_56840 ?auto_56839 ) ( ON ?auto_56841 ?auto_56840 ) ( CLEAR ?auto_56844 ) ( ON ?auto_56843 ?auto_56841 ) ( CLEAR ?auto_56843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56842 ?auto_56838 ?auto_56839 ?auto_56840 ?auto_56841 )
      ( MAKE-3PILE ?auto_56838 ?auto_56839 ?auto_56840 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56845 - BLOCK
      ?auto_56846 - BLOCK
      ?auto_56847 - BLOCK
    )
    :vars
    (
      ?auto_56848 - BLOCK
      ?auto_56851 - BLOCK
      ?auto_56849 - BLOCK
      ?auto_56850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56845 ?auto_56846 ) ) ( not ( = ?auto_56845 ?auto_56847 ) ) ( not ( = ?auto_56846 ?auto_56847 ) ) ( not ( = ?auto_56845 ?auto_56848 ) ) ( not ( = ?auto_56846 ?auto_56848 ) ) ( not ( = ?auto_56847 ?auto_56848 ) ) ( not ( = ?auto_56851 ?auto_56849 ) ) ( not ( = ?auto_56851 ?auto_56848 ) ) ( not ( = ?auto_56851 ?auto_56847 ) ) ( not ( = ?auto_56851 ?auto_56846 ) ) ( not ( = ?auto_56849 ?auto_56848 ) ) ( not ( = ?auto_56849 ?auto_56847 ) ) ( not ( = ?auto_56849 ?auto_56846 ) ) ( not ( = ?auto_56845 ?auto_56851 ) ) ( not ( = ?auto_56845 ?auto_56849 ) ) ( ON ?auto_56845 ?auto_56850 ) ( not ( = ?auto_56845 ?auto_56850 ) ) ( not ( = ?auto_56846 ?auto_56850 ) ) ( not ( = ?auto_56847 ?auto_56850 ) ) ( not ( = ?auto_56848 ?auto_56850 ) ) ( not ( = ?auto_56851 ?auto_56850 ) ) ( not ( = ?auto_56849 ?auto_56850 ) ) ( ON ?auto_56846 ?auto_56845 ) ( ON-TABLE ?auto_56850 ) ( ON ?auto_56847 ?auto_56846 ) ( ON ?auto_56848 ?auto_56847 ) ( ON ?auto_56849 ?auto_56848 ) ( CLEAR ?auto_56849 ) ( HOLDING ?auto_56851 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56851 )
      ( MAKE-3PILE ?auto_56845 ?auto_56846 ?auto_56847 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_56852 - BLOCK
      ?auto_56853 - BLOCK
      ?auto_56854 - BLOCK
    )
    :vars
    (
      ?auto_56858 - BLOCK
      ?auto_56857 - BLOCK
      ?auto_56856 - BLOCK
      ?auto_56855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56852 ?auto_56853 ) ) ( not ( = ?auto_56852 ?auto_56854 ) ) ( not ( = ?auto_56853 ?auto_56854 ) ) ( not ( = ?auto_56852 ?auto_56858 ) ) ( not ( = ?auto_56853 ?auto_56858 ) ) ( not ( = ?auto_56854 ?auto_56858 ) ) ( not ( = ?auto_56857 ?auto_56856 ) ) ( not ( = ?auto_56857 ?auto_56858 ) ) ( not ( = ?auto_56857 ?auto_56854 ) ) ( not ( = ?auto_56857 ?auto_56853 ) ) ( not ( = ?auto_56856 ?auto_56858 ) ) ( not ( = ?auto_56856 ?auto_56854 ) ) ( not ( = ?auto_56856 ?auto_56853 ) ) ( not ( = ?auto_56852 ?auto_56857 ) ) ( not ( = ?auto_56852 ?auto_56856 ) ) ( ON ?auto_56852 ?auto_56855 ) ( not ( = ?auto_56852 ?auto_56855 ) ) ( not ( = ?auto_56853 ?auto_56855 ) ) ( not ( = ?auto_56854 ?auto_56855 ) ) ( not ( = ?auto_56858 ?auto_56855 ) ) ( not ( = ?auto_56857 ?auto_56855 ) ) ( not ( = ?auto_56856 ?auto_56855 ) ) ( ON ?auto_56853 ?auto_56852 ) ( ON-TABLE ?auto_56855 ) ( ON ?auto_56854 ?auto_56853 ) ( ON ?auto_56858 ?auto_56854 ) ( ON ?auto_56856 ?auto_56858 ) ( ON ?auto_56857 ?auto_56856 ) ( CLEAR ?auto_56857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56855 ?auto_56852 ?auto_56853 ?auto_56854 ?auto_56858 ?auto_56856 )
      ( MAKE-3PILE ?auto_56852 ?auto_56853 ?auto_56854 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56861 - BLOCK
      ?auto_56862 - BLOCK
    )
    :vars
    (
      ?auto_56863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56863 ?auto_56862 ) ( CLEAR ?auto_56863 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56861 ) ( ON ?auto_56862 ?auto_56861 ) ( not ( = ?auto_56861 ?auto_56862 ) ) ( not ( = ?auto_56861 ?auto_56863 ) ) ( not ( = ?auto_56862 ?auto_56863 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56863 ?auto_56862 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56864 - BLOCK
      ?auto_56865 - BLOCK
    )
    :vars
    (
      ?auto_56866 - BLOCK
      ?auto_56867 - BLOCK
      ?auto_56868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56866 ?auto_56865 ) ( CLEAR ?auto_56866 ) ( ON-TABLE ?auto_56864 ) ( ON ?auto_56865 ?auto_56864 ) ( not ( = ?auto_56864 ?auto_56865 ) ) ( not ( = ?auto_56864 ?auto_56866 ) ) ( not ( = ?auto_56865 ?auto_56866 ) ) ( HOLDING ?auto_56867 ) ( CLEAR ?auto_56868 ) ( not ( = ?auto_56864 ?auto_56867 ) ) ( not ( = ?auto_56864 ?auto_56868 ) ) ( not ( = ?auto_56865 ?auto_56867 ) ) ( not ( = ?auto_56865 ?auto_56868 ) ) ( not ( = ?auto_56866 ?auto_56867 ) ) ( not ( = ?auto_56866 ?auto_56868 ) ) ( not ( = ?auto_56867 ?auto_56868 ) ) )
    :subtasks
    ( ( !STACK ?auto_56867 ?auto_56868 )
      ( MAKE-2PILE ?auto_56864 ?auto_56865 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56869 - BLOCK
      ?auto_56870 - BLOCK
    )
    :vars
    (
      ?auto_56872 - BLOCK
      ?auto_56873 - BLOCK
      ?auto_56871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56872 ?auto_56870 ) ( ON-TABLE ?auto_56869 ) ( ON ?auto_56870 ?auto_56869 ) ( not ( = ?auto_56869 ?auto_56870 ) ) ( not ( = ?auto_56869 ?auto_56872 ) ) ( not ( = ?auto_56870 ?auto_56872 ) ) ( CLEAR ?auto_56873 ) ( not ( = ?auto_56869 ?auto_56871 ) ) ( not ( = ?auto_56869 ?auto_56873 ) ) ( not ( = ?auto_56870 ?auto_56871 ) ) ( not ( = ?auto_56870 ?auto_56873 ) ) ( not ( = ?auto_56872 ?auto_56871 ) ) ( not ( = ?auto_56872 ?auto_56873 ) ) ( not ( = ?auto_56871 ?auto_56873 ) ) ( ON ?auto_56871 ?auto_56872 ) ( CLEAR ?auto_56871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56869 ?auto_56870 ?auto_56872 )
      ( MAKE-2PILE ?auto_56869 ?auto_56870 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56874 - BLOCK
      ?auto_56875 - BLOCK
    )
    :vars
    (
      ?auto_56877 - BLOCK
      ?auto_56878 - BLOCK
      ?auto_56876 - BLOCK
      ?auto_56879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56877 ?auto_56875 ) ( ON-TABLE ?auto_56874 ) ( ON ?auto_56875 ?auto_56874 ) ( not ( = ?auto_56874 ?auto_56875 ) ) ( not ( = ?auto_56874 ?auto_56877 ) ) ( not ( = ?auto_56875 ?auto_56877 ) ) ( not ( = ?auto_56874 ?auto_56878 ) ) ( not ( = ?auto_56874 ?auto_56876 ) ) ( not ( = ?auto_56875 ?auto_56878 ) ) ( not ( = ?auto_56875 ?auto_56876 ) ) ( not ( = ?auto_56877 ?auto_56878 ) ) ( not ( = ?auto_56877 ?auto_56876 ) ) ( not ( = ?auto_56878 ?auto_56876 ) ) ( ON ?auto_56878 ?auto_56877 ) ( CLEAR ?auto_56878 ) ( HOLDING ?auto_56876 ) ( CLEAR ?auto_56879 ) ( ON-TABLE ?auto_56879 ) ( not ( = ?auto_56879 ?auto_56876 ) ) ( not ( = ?auto_56874 ?auto_56879 ) ) ( not ( = ?auto_56875 ?auto_56879 ) ) ( not ( = ?auto_56877 ?auto_56879 ) ) ( not ( = ?auto_56878 ?auto_56879 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56879 ?auto_56876 )
      ( MAKE-2PILE ?auto_56874 ?auto_56875 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56880 - BLOCK
      ?auto_56881 - BLOCK
    )
    :vars
    (
      ?auto_56884 - BLOCK
      ?auto_56883 - BLOCK
      ?auto_56885 - BLOCK
      ?auto_56882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56884 ?auto_56881 ) ( ON-TABLE ?auto_56880 ) ( ON ?auto_56881 ?auto_56880 ) ( not ( = ?auto_56880 ?auto_56881 ) ) ( not ( = ?auto_56880 ?auto_56884 ) ) ( not ( = ?auto_56881 ?auto_56884 ) ) ( not ( = ?auto_56880 ?auto_56883 ) ) ( not ( = ?auto_56880 ?auto_56885 ) ) ( not ( = ?auto_56881 ?auto_56883 ) ) ( not ( = ?auto_56881 ?auto_56885 ) ) ( not ( = ?auto_56884 ?auto_56883 ) ) ( not ( = ?auto_56884 ?auto_56885 ) ) ( not ( = ?auto_56883 ?auto_56885 ) ) ( ON ?auto_56883 ?auto_56884 ) ( CLEAR ?auto_56882 ) ( ON-TABLE ?auto_56882 ) ( not ( = ?auto_56882 ?auto_56885 ) ) ( not ( = ?auto_56880 ?auto_56882 ) ) ( not ( = ?auto_56881 ?auto_56882 ) ) ( not ( = ?auto_56884 ?auto_56882 ) ) ( not ( = ?auto_56883 ?auto_56882 ) ) ( ON ?auto_56885 ?auto_56883 ) ( CLEAR ?auto_56885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56880 ?auto_56881 ?auto_56884 ?auto_56883 )
      ( MAKE-2PILE ?auto_56880 ?auto_56881 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56886 - BLOCK
      ?auto_56887 - BLOCK
    )
    :vars
    (
      ?auto_56891 - BLOCK
      ?auto_56890 - BLOCK
      ?auto_56889 - BLOCK
      ?auto_56888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56891 ?auto_56887 ) ( ON-TABLE ?auto_56886 ) ( ON ?auto_56887 ?auto_56886 ) ( not ( = ?auto_56886 ?auto_56887 ) ) ( not ( = ?auto_56886 ?auto_56891 ) ) ( not ( = ?auto_56887 ?auto_56891 ) ) ( not ( = ?auto_56886 ?auto_56890 ) ) ( not ( = ?auto_56886 ?auto_56889 ) ) ( not ( = ?auto_56887 ?auto_56890 ) ) ( not ( = ?auto_56887 ?auto_56889 ) ) ( not ( = ?auto_56891 ?auto_56890 ) ) ( not ( = ?auto_56891 ?auto_56889 ) ) ( not ( = ?auto_56890 ?auto_56889 ) ) ( ON ?auto_56890 ?auto_56891 ) ( not ( = ?auto_56888 ?auto_56889 ) ) ( not ( = ?auto_56886 ?auto_56888 ) ) ( not ( = ?auto_56887 ?auto_56888 ) ) ( not ( = ?auto_56891 ?auto_56888 ) ) ( not ( = ?auto_56890 ?auto_56888 ) ) ( ON ?auto_56889 ?auto_56890 ) ( CLEAR ?auto_56889 ) ( HOLDING ?auto_56888 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56888 )
      ( MAKE-2PILE ?auto_56886 ?auto_56887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56892 - BLOCK
      ?auto_56893 - BLOCK
    )
    :vars
    (
      ?auto_56896 - BLOCK
      ?auto_56895 - BLOCK
      ?auto_56894 - BLOCK
      ?auto_56897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56896 ?auto_56893 ) ( ON-TABLE ?auto_56892 ) ( ON ?auto_56893 ?auto_56892 ) ( not ( = ?auto_56892 ?auto_56893 ) ) ( not ( = ?auto_56892 ?auto_56896 ) ) ( not ( = ?auto_56893 ?auto_56896 ) ) ( not ( = ?auto_56892 ?auto_56895 ) ) ( not ( = ?auto_56892 ?auto_56894 ) ) ( not ( = ?auto_56893 ?auto_56895 ) ) ( not ( = ?auto_56893 ?auto_56894 ) ) ( not ( = ?auto_56896 ?auto_56895 ) ) ( not ( = ?auto_56896 ?auto_56894 ) ) ( not ( = ?auto_56895 ?auto_56894 ) ) ( ON ?auto_56895 ?auto_56896 ) ( not ( = ?auto_56897 ?auto_56894 ) ) ( not ( = ?auto_56892 ?auto_56897 ) ) ( not ( = ?auto_56893 ?auto_56897 ) ) ( not ( = ?auto_56896 ?auto_56897 ) ) ( not ( = ?auto_56895 ?auto_56897 ) ) ( ON ?auto_56894 ?auto_56895 ) ( ON ?auto_56897 ?auto_56894 ) ( CLEAR ?auto_56897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56892 ?auto_56893 ?auto_56896 ?auto_56895 ?auto_56894 )
      ( MAKE-2PILE ?auto_56892 ?auto_56893 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56898 - BLOCK
      ?auto_56899 - BLOCK
    )
    :vars
    (
      ?auto_56901 - BLOCK
      ?auto_56900 - BLOCK
      ?auto_56903 - BLOCK
      ?auto_56902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56901 ?auto_56899 ) ( ON-TABLE ?auto_56898 ) ( ON ?auto_56899 ?auto_56898 ) ( not ( = ?auto_56898 ?auto_56899 ) ) ( not ( = ?auto_56898 ?auto_56901 ) ) ( not ( = ?auto_56899 ?auto_56901 ) ) ( not ( = ?auto_56898 ?auto_56900 ) ) ( not ( = ?auto_56898 ?auto_56903 ) ) ( not ( = ?auto_56899 ?auto_56900 ) ) ( not ( = ?auto_56899 ?auto_56903 ) ) ( not ( = ?auto_56901 ?auto_56900 ) ) ( not ( = ?auto_56901 ?auto_56903 ) ) ( not ( = ?auto_56900 ?auto_56903 ) ) ( ON ?auto_56900 ?auto_56901 ) ( not ( = ?auto_56902 ?auto_56903 ) ) ( not ( = ?auto_56898 ?auto_56902 ) ) ( not ( = ?auto_56899 ?auto_56902 ) ) ( not ( = ?auto_56901 ?auto_56902 ) ) ( not ( = ?auto_56900 ?auto_56902 ) ) ( ON ?auto_56903 ?auto_56900 ) ( HOLDING ?auto_56902 ) ( CLEAR ?auto_56903 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56898 ?auto_56899 ?auto_56901 ?auto_56900 ?auto_56903 ?auto_56902 )
      ( MAKE-2PILE ?auto_56898 ?auto_56899 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56904 - BLOCK
      ?auto_56905 - BLOCK
    )
    :vars
    (
      ?auto_56908 - BLOCK
      ?auto_56906 - BLOCK
      ?auto_56907 - BLOCK
      ?auto_56909 - BLOCK
      ?auto_56910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56908 ?auto_56905 ) ( ON-TABLE ?auto_56904 ) ( ON ?auto_56905 ?auto_56904 ) ( not ( = ?auto_56904 ?auto_56905 ) ) ( not ( = ?auto_56904 ?auto_56908 ) ) ( not ( = ?auto_56905 ?auto_56908 ) ) ( not ( = ?auto_56904 ?auto_56906 ) ) ( not ( = ?auto_56904 ?auto_56907 ) ) ( not ( = ?auto_56905 ?auto_56906 ) ) ( not ( = ?auto_56905 ?auto_56907 ) ) ( not ( = ?auto_56908 ?auto_56906 ) ) ( not ( = ?auto_56908 ?auto_56907 ) ) ( not ( = ?auto_56906 ?auto_56907 ) ) ( ON ?auto_56906 ?auto_56908 ) ( not ( = ?auto_56909 ?auto_56907 ) ) ( not ( = ?auto_56904 ?auto_56909 ) ) ( not ( = ?auto_56905 ?auto_56909 ) ) ( not ( = ?auto_56908 ?auto_56909 ) ) ( not ( = ?auto_56906 ?auto_56909 ) ) ( ON ?auto_56907 ?auto_56906 ) ( CLEAR ?auto_56907 ) ( ON ?auto_56909 ?auto_56910 ) ( CLEAR ?auto_56909 ) ( HAND-EMPTY ) ( not ( = ?auto_56904 ?auto_56910 ) ) ( not ( = ?auto_56905 ?auto_56910 ) ) ( not ( = ?auto_56908 ?auto_56910 ) ) ( not ( = ?auto_56906 ?auto_56910 ) ) ( not ( = ?auto_56907 ?auto_56910 ) ) ( not ( = ?auto_56909 ?auto_56910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56909 ?auto_56910 )
      ( MAKE-2PILE ?auto_56904 ?auto_56905 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56911 - BLOCK
      ?auto_56912 - BLOCK
    )
    :vars
    (
      ?auto_56913 - BLOCK
      ?auto_56916 - BLOCK
      ?auto_56915 - BLOCK
      ?auto_56917 - BLOCK
      ?auto_56914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56913 ?auto_56912 ) ( ON-TABLE ?auto_56911 ) ( ON ?auto_56912 ?auto_56911 ) ( not ( = ?auto_56911 ?auto_56912 ) ) ( not ( = ?auto_56911 ?auto_56913 ) ) ( not ( = ?auto_56912 ?auto_56913 ) ) ( not ( = ?auto_56911 ?auto_56916 ) ) ( not ( = ?auto_56911 ?auto_56915 ) ) ( not ( = ?auto_56912 ?auto_56916 ) ) ( not ( = ?auto_56912 ?auto_56915 ) ) ( not ( = ?auto_56913 ?auto_56916 ) ) ( not ( = ?auto_56913 ?auto_56915 ) ) ( not ( = ?auto_56916 ?auto_56915 ) ) ( ON ?auto_56916 ?auto_56913 ) ( not ( = ?auto_56917 ?auto_56915 ) ) ( not ( = ?auto_56911 ?auto_56917 ) ) ( not ( = ?auto_56912 ?auto_56917 ) ) ( not ( = ?auto_56913 ?auto_56917 ) ) ( not ( = ?auto_56916 ?auto_56917 ) ) ( ON ?auto_56917 ?auto_56914 ) ( CLEAR ?auto_56917 ) ( not ( = ?auto_56911 ?auto_56914 ) ) ( not ( = ?auto_56912 ?auto_56914 ) ) ( not ( = ?auto_56913 ?auto_56914 ) ) ( not ( = ?auto_56916 ?auto_56914 ) ) ( not ( = ?auto_56915 ?auto_56914 ) ) ( not ( = ?auto_56917 ?auto_56914 ) ) ( HOLDING ?auto_56915 ) ( CLEAR ?auto_56916 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56911 ?auto_56912 ?auto_56913 ?auto_56916 ?auto_56915 )
      ( MAKE-2PILE ?auto_56911 ?auto_56912 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56918 - BLOCK
      ?auto_56919 - BLOCK
    )
    :vars
    (
      ?auto_56922 - BLOCK
      ?auto_56924 - BLOCK
      ?auto_56921 - BLOCK
      ?auto_56923 - BLOCK
      ?auto_56920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56922 ?auto_56919 ) ( ON-TABLE ?auto_56918 ) ( ON ?auto_56919 ?auto_56918 ) ( not ( = ?auto_56918 ?auto_56919 ) ) ( not ( = ?auto_56918 ?auto_56922 ) ) ( not ( = ?auto_56919 ?auto_56922 ) ) ( not ( = ?auto_56918 ?auto_56924 ) ) ( not ( = ?auto_56918 ?auto_56921 ) ) ( not ( = ?auto_56919 ?auto_56924 ) ) ( not ( = ?auto_56919 ?auto_56921 ) ) ( not ( = ?auto_56922 ?auto_56924 ) ) ( not ( = ?auto_56922 ?auto_56921 ) ) ( not ( = ?auto_56924 ?auto_56921 ) ) ( ON ?auto_56924 ?auto_56922 ) ( not ( = ?auto_56923 ?auto_56921 ) ) ( not ( = ?auto_56918 ?auto_56923 ) ) ( not ( = ?auto_56919 ?auto_56923 ) ) ( not ( = ?auto_56922 ?auto_56923 ) ) ( not ( = ?auto_56924 ?auto_56923 ) ) ( ON ?auto_56923 ?auto_56920 ) ( not ( = ?auto_56918 ?auto_56920 ) ) ( not ( = ?auto_56919 ?auto_56920 ) ) ( not ( = ?auto_56922 ?auto_56920 ) ) ( not ( = ?auto_56924 ?auto_56920 ) ) ( not ( = ?auto_56921 ?auto_56920 ) ) ( not ( = ?auto_56923 ?auto_56920 ) ) ( CLEAR ?auto_56924 ) ( ON ?auto_56921 ?auto_56923 ) ( CLEAR ?auto_56921 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_56920 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56920 ?auto_56923 )
      ( MAKE-2PILE ?auto_56918 ?auto_56919 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56925 - BLOCK
      ?auto_56926 - BLOCK
    )
    :vars
    (
      ?auto_56929 - BLOCK
      ?auto_56930 - BLOCK
      ?auto_56927 - BLOCK
      ?auto_56928 - BLOCK
      ?auto_56931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56929 ?auto_56926 ) ( ON-TABLE ?auto_56925 ) ( ON ?auto_56926 ?auto_56925 ) ( not ( = ?auto_56925 ?auto_56926 ) ) ( not ( = ?auto_56925 ?auto_56929 ) ) ( not ( = ?auto_56926 ?auto_56929 ) ) ( not ( = ?auto_56925 ?auto_56930 ) ) ( not ( = ?auto_56925 ?auto_56927 ) ) ( not ( = ?auto_56926 ?auto_56930 ) ) ( not ( = ?auto_56926 ?auto_56927 ) ) ( not ( = ?auto_56929 ?auto_56930 ) ) ( not ( = ?auto_56929 ?auto_56927 ) ) ( not ( = ?auto_56930 ?auto_56927 ) ) ( not ( = ?auto_56928 ?auto_56927 ) ) ( not ( = ?auto_56925 ?auto_56928 ) ) ( not ( = ?auto_56926 ?auto_56928 ) ) ( not ( = ?auto_56929 ?auto_56928 ) ) ( not ( = ?auto_56930 ?auto_56928 ) ) ( ON ?auto_56928 ?auto_56931 ) ( not ( = ?auto_56925 ?auto_56931 ) ) ( not ( = ?auto_56926 ?auto_56931 ) ) ( not ( = ?auto_56929 ?auto_56931 ) ) ( not ( = ?auto_56930 ?auto_56931 ) ) ( not ( = ?auto_56927 ?auto_56931 ) ) ( not ( = ?auto_56928 ?auto_56931 ) ) ( ON ?auto_56927 ?auto_56928 ) ( CLEAR ?auto_56927 ) ( ON-TABLE ?auto_56931 ) ( HOLDING ?auto_56930 ) ( CLEAR ?auto_56929 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56925 ?auto_56926 ?auto_56929 ?auto_56930 )
      ( MAKE-2PILE ?auto_56925 ?auto_56926 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56932 - BLOCK
      ?auto_56933 - BLOCK
    )
    :vars
    (
      ?auto_56937 - BLOCK
      ?auto_56935 - BLOCK
      ?auto_56934 - BLOCK
      ?auto_56936 - BLOCK
      ?auto_56938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56937 ?auto_56933 ) ( ON-TABLE ?auto_56932 ) ( ON ?auto_56933 ?auto_56932 ) ( not ( = ?auto_56932 ?auto_56933 ) ) ( not ( = ?auto_56932 ?auto_56937 ) ) ( not ( = ?auto_56933 ?auto_56937 ) ) ( not ( = ?auto_56932 ?auto_56935 ) ) ( not ( = ?auto_56932 ?auto_56934 ) ) ( not ( = ?auto_56933 ?auto_56935 ) ) ( not ( = ?auto_56933 ?auto_56934 ) ) ( not ( = ?auto_56937 ?auto_56935 ) ) ( not ( = ?auto_56937 ?auto_56934 ) ) ( not ( = ?auto_56935 ?auto_56934 ) ) ( not ( = ?auto_56936 ?auto_56934 ) ) ( not ( = ?auto_56932 ?auto_56936 ) ) ( not ( = ?auto_56933 ?auto_56936 ) ) ( not ( = ?auto_56937 ?auto_56936 ) ) ( not ( = ?auto_56935 ?auto_56936 ) ) ( ON ?auto_56936 ?auto_56938 ) ( not ( = ?auto_56932 ?auto_56938 ) ) ( not ( = ?auto_56933 ?auto_56938 ) ) ( not ( = ?auto_56937 ?auto_56938 ) ) ( not ( = ?auto_56935 ?auto_56938 ) ) ( not ( = ?auto_56934 ?auto_56938 ) ) ( not ( = ?auto_56936 ?auto_56938 ) ) ( ON ?auto_56934 ?auto_56936 ) ( ON-TABLE ?auto_56938 ) ( CLEAR ?auto_56937 ) ( ON ?auto_56935 ?auto_56934 ) ( CLEAR ?auto_56935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56938 ?auto_56936 ?auto_56934 )
      ( MAKE-2PILE ?auto_56932 ?auto_56933 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56953 - BLOCK
      ?auto_56954 - BLOCK
    )
    :vars
    (
      ?auto_56959 - BLOCK
      ?auto_56957 - BLOCK
      ?auto_56956 - BLOCK
      ?auto_56958 - BLOCK
      ?auto_56955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56953 ) ( not ( = ?auto_56953 ?auto_56954 ) ) ( not ( = ?auto_56953 ?auto_56959 ) ) ( not ( = ?auto_56954 ?auto_56959 ) ) ( not ( = ?auto_56953 ?auto_56957 ) ) ( not ( = ?auto_56953 ?auto_56956 ) ) ( not ( = ?auto_56954 ?auto_56957 ) ) ( not ( = ?auto_56954 ?auto_56956 ) ) ( not ( = ?auto_56959 ?auto_56957 ) ) ( not ( = ?auto_56959 ?auto_56956 ) ) ( not ( = ?auto_56957 ?auto_56956 ) ) ( not ( = ?auto_56958 ?auto_56956 ) ) ( not ( = ?auto_56953 ?auto_56958 ) ) ( not ( = ?auto_56954 ?auto_56958 ) ) ( not ( = ?auto_56959 ?auto_56958 ) ) ( not ( = ?auto_56957 ?auto_56958 ) ) ( ON ?auto_56958 ?auto_56955 ) ( not ( = ?auto_56953 ?auto_56955 ) ) ( not ( = ?auto_56954 ?auto_56955 ) ) ( not ( = ?auto_56959 ?auto_56955 ) ) ( not ( = ?auto_56957 ?auto_56955 ) ) ( not ( = ?auto_56956 ?auto_56955 ) ) ( not ( = ?auto_56958 ?auto_56955 ) ) ( ON ?auto_56956 ?auto_56958 ) ( ON-TABLE ?auto_56955 ) ( ON ?auto_56957 ?auto_56956 ) ( ON ?auto_56959 ?auto_56957 ) ( CLEAR ?auto_56959 ) ( HOLDING ?auto_56954 ) ( CLEAR ?auto_56953 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56953 ?auto_56954 ?auto_56959 )
      ( MAKE-2PILE ?auto_56953 ?auto_56954 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56960 - BLOCK
      ?auto_56961 - BLOCK
    )
    :vars
    (
      ?auto_56965 - BLOCK
      ?auto_56962 - BLOCK
      ?auto_56964 - BLOCK
      ?auto_56966 - BLOCK
      ?auto_56963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56960 ) ( not ( = ?auto_56960 ?auto_56961 ) ) ( not ( = ?auto_56960 ?auto_56965 ) ) ( not ( = ?auto_56961 ?auto_56965 ) ) ( not ( = ?auto_56960 ?auto_56962 ) ) ( not ( = ?auto_56960 ?auto_56964 ) ) ( not ( = ?auto_56961 ?auto_56962 ) ) ( not ( = ?auto_56961 ?auto_56964 ) ) ( not ( = ?auto_56965 ?auto_56962 ) ) ( not ( = ?auto_56965 ?auto_56964 ) ) ( not ( = ?auto_56962 ?auto_56964 ) ) ( not ( = ?auto_56966 ?auto_56964 ) ) ( not ( = ?auto_56960 ?auto_56966 ) ) ( not ( = ?auto_56961 ?auto_56966 ) ) ( not ( = ?auto_56965 ?auto_56966 ) ) ( not ( = ?auto_56962 ?auto_56966 ) ) ( ON ?auto_56966 ?auto_56963 ) ( not ( = ?auto_56960 ?auto_56963 ) ) ( not ( = ?auto_56961 ?auto_56963 ) ) ( not ( = ?auto_56965 ?auto_56963 ) ) ( not ( = ?auto_56962 ?auto_56963 ) ) ( not ( = ?auto_56964 ?auto_56963 ) ) ( not ( = ?auto_56966 ?auto_56963 ) ) ( ON ?auto_56964 ?auto_56966 ) ( ON-TABLE ?auto_56963 ) ( ON ?auto_56962 ?auto_56964 ) ( ON ?auto_56965 ?auto_56962 ) ( CLEAR ?auto_56960 ) ( ON ?auto_56961 ?auto_56965 ) ( CLEAR ?auto_56961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_56963 ?auto_56966 ?auto_56964 ?auto_56962 ?auto_56965 )
      ( MAKE-2PILE ?auto_56960 ?auto_56961 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56967 - BLOCK
      ?auto_56968 - BLOCK
    )
    :vars
    (
      ?auto_56971 - BLOCK
      ?auto_56973 - BLOCK
      ?auto_56969 - BLOCK
      ?auto_56972 - BLOCK
      ?auto_56970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56967 ?auto_56968 ) ) ( not ( = ?auto_56967 ?auto_56971 ) ) ( not ( = ?auto_56968 ?auto_56971 ) ) ( not ( = ?auto_56967 ?auto_56973 ) ) ( not ( = ?auto_56967 ?auto_56969 ) ) ( not ( = ?auto_56968 ?auto_56973 ) ) ( not ( = ?auto_56968 ?auto_56969 ) ) ( not ( = ?auto_56971 ?auto_56973 ) ) ( not ( = ?auto_56971 ?auto_56969 ) ) ( not ( = ?auto_56973 ?auto_56969 ) ) ( not ( = ?auto_56972 ?auto_56969 ) ) ( not ( = ?auto_56967 ?auto_56972 ) ) ( not ( = ?auto_56968 ?auto_56972 ) ) ( not ( = ?auto_56971 ?auto_56972 ) ) ( not ( = ?auto_56973 ?auto_56972 ) ) ( ON ?auto_56972 ?auto_56970 ) ( not ( = ?auto_56967 ?auto_56970 ) ) ( not ( = ?auto_56968 ?auto_56970 ) ) ( not ( = ?auto_56971 ?auto_56970 ) ) ( not ( = ?auto_56973 ?auto_56970 ) ) ( not ( = ?auto_56969 ?auto_56970 ) ) ( not ( = ?auto_56972 ?auto_56970 ) ) ( ON ?auto_56969 ?auto_56972 ) ( ON-TABLE ?auto_56970 ) ( ON ?auto_56973 ?auto_56969 ) ( ON ?auto_56971 ?auto_56973 ) ( ON ?auto_56968 ?auto_56971 ) ( CLEAR ?auto_56968 ) ( HOLDING ?auto_56967 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56967 )
      ( MAKE-2PILE ?auto_56967 ?auto_56968 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_56974 - BLOCK
      ?auto_56975 - BLOCK
    )
    :vars
    (
      ?auto_56977 - BLOCK
      ?auto_56978 - BLOCK
      ?auto_56980 - BLOCK
      ?auto_56979 - BLOCK
      ?auto_56976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56974 ?auto_56975 ) ) ( not ( = ?auto_56974 ?auto_56977 ) ) ( not ( = ?auto_56975 ?auto_56977 ) ) ( not ( = ?auto_56974 ?auto_56978 ) ) ( not ( = ?auto_56974 ?auto_56980 ) ) ( not ( = ?auto_56975 ?auto_56978 ) ) ( not ( = ?auto_56975 ?auto_56980 ) ) ( not ( = ?auto_56977 ?auto_56978 ) ) ( not ( = ?auto_56977 ?auto_56980 ) ) ( not ( = ?auto_56978 ?auto_56980 ) ) ( not ( = ?auto_56979 ?auto_56980 ) ) ( not ( = ?auto_56974 ?auto_56979 ) ) ( not ( = ?auto_56975 ?auto_56979 ) ) ( not ( = ?auto_56977 ?auto_56979 ) ) ( not ( = ?auto_56978 ?auto_56979 ) ) ( ON ?auto_56979 ?auto_56976 ) ( not ( = ?auto_56974 ?auto_56976 ) ) ( not ( = ?auto_56975 ?auto_56976 ) ) ( not ( = ?auto_56977 ?auto_56976 ) ) ( not ( = ?auto_56978 ?auto_56976 ) ) ( not ( = ?auto_56980 ?auto_56976 ) ) ( not ( = ?auto_56979 ?auto_56976 ) ) ( ON ?auto_56980 ?auto_56979 ) ( ON-TABLE ?auto_56976 ) ( ON ?auto_56978 ?auto_56980 ) ( ON ?auto_56977 ?auto_56978 ) ( ON ?auto_56975 ?auto_56977 ) ( ON ?auto_56974 ?auto_56975 ) ( CLEAR ?auto_56974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_56976 ?auto_56979 ?auto_56980 ?auto_56978 ?auto_56977 ?auto_56975 )
      ( MAKE-2PILE ?auto_56974 ?auto_56975 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56985 - BLOCK
      ?auto_56986 - BLOCK
      ?auto_56987 - BLOCK
      ?auto_56988 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_56988 ) ( CLEAR ?auto_56987 ) ( ON-TABLE ?auto_56985 ) ( ON ?auto_56986 ?auto_56985 ) ( ON ?auto_56987 ?auto_56986 ) ( not ( = ?auto_56985 ?auto_56986 ) ) ( not ( = ?auto_56985 ?auto_56987 ) ) ( not ( = ?auto_56985 ?auto_56988 ) ) ( not ( = ?auto_56986 ?auto_56987 ) ) ( not ( = ?auto_56986 ?auto_56988 ) ) ( not ( = ?auto_56987 ?auto_56988 ) ) )
    :subtasks
    ( ( !STACK ?auto_56988 ?auto_56987 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56989 - BLOCK
      ?auto_56990 - BLOCK
      ?auto_56991 - BLOCK
      ?auto_56992 - BLOCK
    )
    :vars
    (
      ?auto_56993 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_56991 ) ( ON-TABLE ?auto_56989 ) ( ON ?auto_56990 ?auto_56989 ) ( ON ?auto_56991 ?auto_56990 ) ( not ( = ?auto_56989 ?auto_56990 ) ) ( not ( = ?auto_56989 ?auto_56991 ) ) ( not ( = ?auto_56989 ?auto_56992 ) ) ( not ( = ?auto_56990 ?auto_56991 ) ) ( not ( = ?auto_56990 ?auto_56992 ) ) ( not ( = ?auto_56991 ?auto_56992 ) ) ( ON ?auto_56992 ?auto_56993 ) ( CLEAR ?auto_56992 ) ( HAND-EMPTY ) ( not ( = ?auto_56989 ?auto_56993 ) ) ( not ( = ?auto_56990 ?auto_56993 ) ) ( not ( = ?auto_56991 ?auto_56993 ) ) ( not ( = ?auto_56992 ?auto_56993 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_56992 ?auto_56993 )
      ( MAKE-4PILE ?auto_56989 ?auto_56990 ?auto_56991 ?auto_56992 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56994 - BLOCK
      ?auto_56995 - BLOCK
      ?auto_56996 - BLOCK
      ?auto_56997 - BLOCK
    )
    :vars
    (
      ?auto_56998 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56994 ) ( ON ?auto_56995 ?auto_56994 ) ( not ( = ?auto_56994 ?auto_56995 ) ) ( not ( = ?auto_56994 ?auto_56996 ) ) ( not ( = ?auto_56994 ?auto_56997 ) ) ( not ( = ?auto_56995 ?auto_56996 ) ) ( not ( = ?auto_56995 ?auto_56997 ) ) ( not ( = ?auto_56996 ?auto_56997 ) ) ( ON ?auto_56997 ?auto_56998 ) ( CLEAR ?auto_56997 ) ( not ( = ?auto_56994 ?auto_56998 ) ) ( not ( = ?auto_56995 ?auto_56998 ) ) ( not ( = ?auto_56996 ?auto_56998 ) ) ( not ( = ?auto_56997 ?auto_56998 ) ) ( HOLDING ?auto_56996 ) ( CLEAR ?auto_56995 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56994 ?auto_56995 ?auto_56996 )
      ( MAKE-4PILE ?auto_56994 ?auto_56995 ?auto_56996 ?auto_56997 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_56999 - BLOCK
      ?auto_57000 - BLOCK
      ?auto_57001 - BLOCK
      ?auto_57002 - BLOCK
    )
    :vars
    (
      ?auto_57003 - BLOCK
      ?auto_57004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56999 ) ( ON ?auto_57000 ?auto_56999 ) ( not ( = ?auto_56999 ?auto_57000 ) ) ( not ( = ?auto_56999 ?auto_57001 ) ) ( not ( = ?auto_56999 ?auto_57002 ) ) ( not ( = ?auto_57000 ?auto_57001 ) ) ( not ( = ?auto_57000 ?auto_57002 ) ) ( not ( = ?auto_57001 ?auto_57002 ) ) ( ON ?auto_57002 ?auto_57003 ) ( not ( = ?auto_56999 ?auto_57003 ) ) ( not ( = ?auto_57000 ?auto_57003 ) ) ( not ( = ?auto_57001 ?auto_57003 ) ) ( not ( = ?auto_57002 ?auto_57003 ) ) ( CLEAR ?auto_57000 ) ( ON ?auto_57001 ?auto_57002 ) ( CLEAR ?auto_57001 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57004 ) ( ON ?auto_57003 ?auto_57004 ) ( not ( = ?auto_57004 ?auto_57003 ) ) ( not ( = ?auto_57004 ?auto_57002 ) ) ( not ( = ?auto_57004 ?auto_57001 ) ) ( not ( = ?auto_56999 ?auto_57004 ) ) ( not ( = ?auto_57000 ?auto_57004 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57004 ?auto_57003 ?auto_57002 )
      ( MAKE-4PILE ?auto_56999 ?auto_57000 ?auto_57001 ?auto_57002 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57005 - BLOCK
      ?auto_57006 - BLOCK
      ?auto_57007 - BLOCK
      ?auto_57008 - BLOCK
    )
    :vars
    (
      ?auto_57009 - BLOCK
      ?auto_57010 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57005 ) ( not ( = ?auto_57005 ?auto_57006 ) ) ( not ( = ?auto_57005 ?auto_57007 ) ) ( not ( = ?auto_57005 ?auto_57008 ) ) ( not ( = ?auto_57006 ?auto_57007 ) ) ( not ( = ?auto_57006 ?auto_57008 ) ) ( not ( = ?auto_57007 ?auto_57008 ) ) ( ON ?auto_57008 ?auto_57009 ) ( not ( = ?auto_57005 ?auto_57009 ) ) ( not ( = ?auto_57006 ?auto_57009 ) ) ( not ( = ?auto_57007 ?auto_57009 ) ) ( not ( = ?auto_57008 ?auto_57009 ) ) ( ON ?auto_57007 ?auto_57008 ) ( CLEAR ?auto_57007 ) ( ON-TABLE ?auto_57010 ) ( ON ?auto_57009 ?auto_57010 ) ( not ( = ?auto_57010 ?auto_57009 ) ) ( not ( = ?auto_57010 ?auto_57008 ) ) ( not ( = ?auto_57010 ?auto_57007 ) ) ( not ( = ?auto_57005 ?auto_57010 ) ) ( not ( = ?auto_57006 ?auto_57010 ) ) ( HOLDING ?auto_57006 ) ( CLEAR ?auto_57005 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57005 ?auto_57006 )
      ( MAKE-4PILE ?auto_57005 ?auto_57006 ?auto_57007 ?auto_57008 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57011 - BLOCK
      ?auto_57012 - BLOCK
      ?auto_57013 - BLOCK
      ?auto_57014 - BLOCK
    )
    :vars
    (
      ?auto_57015 - BLOCK
      ?auto_57016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57011 ) ( not ( = ?auto_57011 ?auto_57012 ) ) ( not ( = ?auto_57011 ?auto_57013 ) ) ( not ( = ?auto_57011 ?auto_57014 ) ) ( not ( = ?auto_57012 ?auto_57013 ) ) ( not ( = ?auto_57012 ?auto_57014 ) ) ( not ( = ?auto_57013 ?auto_57014 ) ) ( ON ?auto_57014 ?auto_57015 ) ( not ( = ?auto_57011 ?auto_57015 ) ) ( not ( = ?auto_57012 ?auto_57015 ) ) ( not ( = ?auto_57013 ?auto_57015 ) ) ( not ( = ?auto_57014 ?auto_57015 ) ) ( ON ?auto_57013 ?auto_57014 ) ( ON-TABLE ?auto_57016 ) ( ON ?auto_57015 ?auto_57016 ) ( not ( = ?auto_57016 ?auto_57015 ) ) ( not ( = ?auto_57016 ?auto_57014 ) ) ( not ( = ?auto_57016 ?auto_57013 ) ) ( not ( = ?auto_57011 ?auto_57016 ) ) ( not ( = ?auto_57012 ?auto_57016 ) ) ( CLEAR ?auto_57011 ) ( ON ?auto_57012 ?auto_57013 ) ( CLEAR ?auto_57012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57016 ?auto_57015 ?auto_57014 ?auto_57013 )
      ( MAKE-4PILE ?auto_57011 ?auto_57012 ?auto_57013 ?auto_57014 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57017 - BLOCK
      ?auto_57018 - BLOCK
      ?auto_57019 - BLOCK
      ?auto_57020 - BLOCK
    )
    :vars
    (
      ?auto_57021 - BLOCK
      ?auto_57022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57017 ?auto_57018 ) ) ( not ( = ?auto_57017 ?auto_57019 ) ) ( not ( = ?auto_57017 ?auto_57020 ) ) ( not ( = ?auto_57018 ?auto_57019 ) ) ( not ( = ?auto_57018 ?auto_57020 ) ) ( not ( = ?auto_57019 ?auto_57020 ) ) ( ON ?auto_57020 ?auto_57021 ) ( not ( = ?auto_57017 ?auto_57021 ) ) ( not ( = ?auto_57018 ?auto_57021 ) ) ( not ( = ?auto_57019 ?auto_57021 ) ) ( not ( = ?auto_57020 ?auto_57021 ) ) ( ON ?auto_57019 ?auto_57020 ) ( ON-TABLE ?auto_57022 ) ( ON ?auto_57021 ?auto_57022 ) ( not ( = ?auto_57022 ?auto_57021 ) ) ( not ( = ?auto_57022 ?auto_57020 ) ) ( not ( = ?auto_57022 ?auto_57019 ) ) ( not ( = ?auto_57017 ?auto_57022 ) ) ( not ( = ?auto_57018 ?auto_57022 ) ) ( ON ?auto_57018 ?auto_57019 ) ( CLEAR ?auto_57018 ) ( HOLDING ?auto_57017 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57017 )
      ( MAKE-4PILE ?auto_57017 ?auto_57018 ?auto_57019 ?auto_57020 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57023 - BLOCK
      ?auto_57024 - BLOCK
      ?auto_57025 - BLOCK
      ?auto_57026 - BLOCK
    )
    :vars
    (
      ?auto_57027 - BLOCK
      ?auto_57028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57023 ?auto_57024 ) ) ( not ( = ?auto_57023 ?auto_57025 ) ) ( not ( = ?auto_57023 ?auto_57026 ) ) ( not ( = ?auto_57024 ?auto_57025 ) ) ( not ( = ?auto_57024 ?auto_57026 ) ) ( not ( = ?auto_57025 ?auto_57026 ) ) ( ON ?auto_57026 ?auto_57027 ) ( not ( = ?auto_57023 ?auto_57027 ) ) ( not ( = ?auto_57024 ?auto_57027 ) ) ( not ( = ?auto_57025 ?auto_57027 ) ) ( not ( = ?auto_57026 ?auto_57027 ) ) ( ON ?auto_57025 ?auto_57026 ) ( ON-TABLE ?auto_57028 ) ( ON ?auto_57027 ?auto_57028 ) ( not ( = ?auto_57028 ?auto_57027 ) ) ( not ( = ?auto_57028 ?auto_57026 ) ) ( not ( = ?auto_57028 ?auto_57025 ) ) ( not ( = ?auto_57023 ?auto_57028 ) ) ( not ( = ?auto_57024 ?auto_57028 ) ) ( ON ?auto_57024 ?auto_57025 ) ( ON ?auto_57023 ?auto_57024 ) ( CLEAR ?auto_57023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57028 ?auto_57027 ?auto_57026 ?auto_57025 ?auto_57024 )
      ( MAKE-4PILE ?auto_57023 ?auto_57024 ?auto_57025 ?auto_57026 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57029 - BLOCK
      ?auto_57030 - BLOCK
      ?auto_57031 - BLOCK
      ?auto_57032 - BLOCK
    )
    :vars
    (
      ?auto_57034 - BLOCK
      ?auto_57033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57029 ?auto_57030 ) ) ( not ( = ?auto_57029 ?auto_57031 ) ) ( not ( = ?auto_57029 ?auto_57032 ) ) ( not ( = ?auto_57030 ?auto_57031 ) ) ( not ( = ?auto_57030 ?auto_57032 ) ) ( not ( = ?auto_57031 ?auto_57032 ) ) ( ON ?auto_57032 ?auto_57034 ) ( not ( = ?auto_57029 ?auto_57034 ) ) ( not ( = ?auto_57030 ?auto_57034 ) ) ( not ( = ?auto_57031 ?auto_57034 ) ) ( not ( = ?auto_57032 ?auto_57034 ) ) ( ON ?auto_57031 ?auto_57032 ) ( ON-TABLE ?auto_57033 ) ( ON ?auto_57034 ?auto_57033 ) ( not ( = ?auto_57033 ?auto_57034 ) ) ( not ( = ?auto_57033 ?auto_57032 ) ) ( not ( = ?auto_57033 ?auto_57031 ) ) ( not ( = ?auto_57029 ?auto_57033 ) ) ( not ( = ?auto_57030 ?auto_57033 ) ) ( ON ?auto_57030 ?auto_57031 ) ( HOLDING ?auto_57029 ) ( CLEAR ?auto_57030 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57033 ?auto_57034 ?auto_57032 ?auto_57031 ?auto_57030 ?auto_57029 )
      ( MAKE-4PILE ?auto_57029 ?auto_57030 ?auto_57031 ?auto_57032 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57035 - BLOCK
      ?auto_57036 - BLOCK
      ?auto_57037 - BLOCK
      ?auto_57038 - BLOCK
    )
    :vars
    (
      ?auto_57039 - BLOCK
      ?auto_57040 - BLOCK
      ?auto_57041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57035 ?auto_57036 ) ) ( not ( = ?auto_57035 ?auto_57037 ) ) ( not ( = ?auto_57035 ?auto_57038 ) ) ( not ( = ?auto_57036 ?auto_57037 ) ) ( not ( = ?auto_57036 ?auto_57038 ) ) ( not ( = ?auto_57037 ?auto_57038 ) ) ( ON ?auto_57038 ?auto_57039 ) ( not ( = ?auto_57035 ?auto_57039 ) ) ( not ( = ?auto_57036 ?auto_57039 ) ) ( not ( = ?auto_57037 ?auto_57039 ) ) ( not ( = ?auto_57038 ?auto_57039 ) ) ( ON ?auto_57037 ?auto_57038 ) ( ON-TABLE ?auto_57040 ) ( ON ?auto_57039 ?auto_57040 ) ( not ( = ?auto_57040 ?auto_57039 ) ) ( not ( = ?auto_57040 ?auto_57038 ) ) ( not ( = ?auto_57040 ?auto_57037 ) ) ( not ( = ?auto_57035 ?auto_57040 ) ) ( not ( = ?auto_57036 ?auto_57040 ) ) ( ON ?auto_57036 ?auto_57037 ) ( CLEAR ?auto_57036 ) ( ON ?auto_57035 ?auto_57041 ) ( CLEAR ?auto_57035 ) ( HAND-EMPTY ) ( not ( = ?auto_57035 ?auto_57041 ) ) ( not ( = ?auto_57036 ?auto_57041 ) ) ( not ( = ?auto_57037 ?auto_57041 ) ) ( not ( = ?auto_57038 ?auto_57041 ) ) ( not ( = ?auto_57039 ?auto_57041 ) ) ( not ( = ?auto_57040 ?auto_57041 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57035 ?auto_57041 )
      ( MAKE-4PILE ?auto_57035 ?auto_57036 ?auto_57037 ?auto_57038 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57042 - BLOCK
      ?auto_57043 - BLOCK
      ?auto_57044 - BLOCK
      ?auto_57045 - BLOCK
    )
    :vars
    (
      ?auto_57048 - BLOCK
      ?auto_57047 - BLOCK
      ?auto_57046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57042 ?auto_57043 ) ) ( not ( = ?auto_57042 ?auto_57044 ) ) ( not ( = ?auto_57042 ?auto_57045 ) ) ( not ( = ?auto_57043 ?auto_57044 ) ) ( not ( = ?auto_57043 ?auto_57045 ) ) ( not ( = ?auto_57044 ?auto_57045 ) ) ( ON ?auto_57045 ?auto_57048 ) ( not ( = ?auto_57042 ?auto_57048 ) ) ( not ( = ?auto_57043 ?auto_57048 ) ) ( not ( = ?auto_57044 ?auto_57048 ) ) ( not ( = ?auto_57045 ?auto_57048 ) ) ( ON ?auto_57044 ?auto_57045 ) ( ON-TABLE ?auto_57047 ) ( ON ?auto_57048 ?auto_57047 ) ( not ( = ?auto_57047 ?auto_57048 ) ) ( not ( = ?auto_57047 ?auto_57045 ) ) ( not ( = ?auto_57047 ?auto_57044 ) ) ( not ( = ?auto_57042 ?auto_57047 ) ) ( not ( = ?auto_57043 ?auto_57047 ) ) ( ON ?auto_57042 ?auto_57046 ) ( CLEAR ?auto_57042 ) ( not ( = ?auto_57042 ?auto_57046 ) ) ( not ( = ?auto_57043 ?auto_57046 ) ) ( not ( = ?auto_57044 ?auto_57046 ) ) ( not ( = ?auto_57045 ?auto_57046 ) ) ( not ( = ?auto_57048 ?auto_57046 ) ) ( not ( = ?auto_57047 ?auto_57046 ) ) ( HOLDING ?auto_57043 ) ( CLEAR ?auto_57044 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57047 ?auto_57048 ?auto_57045 ?auto_57044 ?auto_57043 )
      ( MAKE-4PILE ?auto_57042 ?auto_57043 ?auto_57044 ?auto_57045 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57049 - BLOCK
      ?auto_57050 - BLOCK
      ?auto_57051 - BLOCK
      ?auto_57052 - BLOCK
    )
    :vars
    (
      ?auto_57053 - BLOCK
      ?auto_57055 - BLOCK
      ?auto_57054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57049 ?auto_57050 ) ) ( not ( = ?auto_57049 ?auto_57051 ) ) ( not ( = ?auto_57049 ?auto_57052 ) ) ( not ( = ?auto_57050 ?auto_57051 ) ) ( not ( = ?auto_57050 ?auto_57052 ) ) ( not ( = ?auto_57051 ?auto_57052 ) ) ( ON ?auto_57052 ?auto_57053 ) ( not ( = ?auto_57049 ?auto_57053 ) ) ( not ( = ?auto_57050 ?auto_57053 ) ) ( not ( = ?auto_57051 ?auto_57053 ) ) ( not ( = ?auto_57052 ?auto_57053 ) ) ( ON ?auto_57051 ?auto_57052 ) ( ON-TABLE ?auto_57055 ) ( ON ?auto_57053 ?auto_57055 ) ( not ( = ?auto_57055 ?auto_57053 ) ) ( not ( = ?auto_57055 ?auto_57052 ) ) ( not ( = ?auto_57055 ?auto_57051 ) ) ( not ( = ?auto_57049 ?auto_57055 ) ) ( not ( = ?auto_57050 ?auto_57055 ) ) ( ON ?auto_57049 ?auto_57054 ) ( not ( = ?auto_57049 ?auto_57054 ) ) ( not ( = ?auto_57050 ?auto_57054 ) ) ( not ( = ?auto_57051 ?auto_57054 ) ) ( not ( = ?auto_57052 ?auto_57054 ) ) ( not ( = ?auto_57053 ?auto_57054 ) ) ( not ( = ?auto_57055 ?auto_57054 ) ) ( CLEAR ?auto_57051 ) ( ON ?auto_57050 ?auto_57049 ) ( CLEAR ?auto_57050 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57054 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57054 ?auto_57049 )
      ( MAKE-4PILE ?auto_57049 ?auto_57050 ?auto_57051 ?auto_57052 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57056 - BLOCK
      ?auto_57057 - BLOCK
      ?auto_57058 - BLOCK
      ?auto_57059 - BLOCK
    )
    :vars
    (
      ?auto_57061 - BLOCK
      ?auto_57060 - BLOCK
      ?auto_57062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57056 ?auto_57057 ) ) ( not ( = ?auto_57056 ?auto_57058 ) ) ( not ( = ?auto_57056 ?auto_57059 ) ) ( not ( = ?auto_57057 ?auto_57058 ) ) ( not ( = ?auto_57057 ?auto_57059 ) ) ( not ( = ?auto_57058 ?auto_57059 ) ) ( ON ?auto_57059 ?auto_57061 ) ( not ( = ?auto_57056 ?auto_57061 ) ) ( not ( = ?auto_57057 ?auto_57061 ) ) ( not ( = ?auto_57058 ?auto_57061 ) ) ( not ( = ?auto_57059 ?auto_57061 ) ) ( ON-TABLE ?auto_57060 ) ( ON ?auto_57061 ?auto_57060 ) ( not ( = ?auto_57060 ?auto_57061 ) ) ( not ( = ?auto_57060 ?auto_57059 ) ) ( not ( = ?auto_57060 ?auto_57058 ) ) ( not ( = ?auto_57056 ?auto_57060 ) ) ( not ( = ?auto_57057 ?auto_57060 ) ) ( ON ?auto_57056 ?auto_57062 ) ( not ( = ?auto_57056 ?auto_57062 ) ) ( not ( = ?auto_57057 ?auto_57062 ) ) ( not ( = ?auto_57058 ?auto_57062 ) ) ( not ( = ?auto_57059 ?auto_57062 ) ) ( not ( = ?auto_57061 ?auto_57062 ) ) ( not ( = ?auto_57060 ?auto_57062 ) ) ( ON ?auto_57057 ?auto_57056 ) ( CLEAR ?auto_57057 ) ( ON-TABLE ?auto_57062 ) ( HOLDING ?auto_57058 ) ( CLEAR ?auto_57059 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57060 ?auto_57061 ?auto_57059 ?auto_57058 )
      ( MAKE-4PILE ?auto_57056 ?auto_57057 ?auto_57058 ?auto_57059 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57063 - BLOCK
      ?auto_57064 - BLOCK
      ?auto_57065 - BLOCK
      ?auto_57066 - BLOCK
    )
    :vars
    (
      ?auto_57067 - BLOCK
      ?auto_57068 - BLOCK
      ?auto_57069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57063 ?auto_57064 ) ) ( not ( = ?auto_57063 ?auto_57065 ) ) ( not ( = ?auto_57063 ?auto_57066 ) ) ( not ( = ?auto_57064 ?auto_57065 ) ) ( not ( = ?auto_57064 ?auto_57066 ) ) ( not ( = ?auto_57065 ?auto_57066 ) ) ( ON ?auto_57066 ?auto_57067 ) ( not ( = ?auto_57063 ?auto_57067 ) ) ( not ( = ?auto_57064 ?auto_57067 ) ) ( not ( = ?auto_57065 ?auto_57067 ) ) ( not ( = ?auto_57066 ?auto_57067 ) ) ( ON-TABLE ?auto_57068 ) ( ON ?auto_57067 ?auto_57068 ) ( not ( = ?auto_57068 ?auto_57067 ) ) ( not ( = ?auto_57068 ?auto_57066 ) ) ( not ( = ?auto_57068 ?auto_57065 ) ) ( not ( = ?auto_57063 ?auto_57068 ) ) ( not ( = ?auto_57064 ?auto_57068 ) ) ( ON ?auto_57063 ?auto_57069 ) ( not ( = ?auto_57063 ?auto_57069 ) ) ( not ( = ?auto_57064 ?auto_57069 ) ) ( not ( = ?auto_57065 ?auto_57069 ) ) ( not ( = ?auto_57066 ?auto_57069 ) ) ( not ( = ?auto_57067 ?auto_57069 ) ) ( not ( = ?auto_57068 ?auto_57069 ) ) ( ON ?auto_57064 ?auto_57063 ) ( ON-TABLE ?auto_57069 ) ( CLEAR ?auto_57066 ) ( ON ?auto_57065 ?auto_57064 ) ( CLEAR ?auto_57065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57069 ?auto_57063 ?auto_57064 )
      ( MAKE-4PILE ?auto_57063 ?auto_57064 ?auto_57065 ?auto_57066 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57070 - BLOCK
      ?auto_57071 - BLOCK
      ?auto_57072 - BLOCK
      ?auto_57073 - BLOCK
    )
    :vars
    (
      ?auto_57076 - BLOCK
      ?auto_57074 - BLOCK
      ?auto_57075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57070 ?auto_57071 ) ) ( not ( = ?auto_57070 ?auto_57072 ) ) ( not ( = ?auto_57070 ?auto_57073 ) ) ( not ( = ?auto_57071 ?auto_57072 ) ) ( not ( = ?auto_57071 ?auto_57073 ) ) ( not ( = ?auto_57072 ?auto_57073 ) ) ( not ( = ?auto_57070 ?auto_57076 ) ) ( not ( = ?auto_57071 ?auto_57076 ) ) ( not ( = ?auto_57072 ?auto_57076 ) ) ( not ( = ?auto_57073 ?auto_57076 ) ) ( ON-TABLE ?auto_57074 ) ( ON ?auto_57076 ?auto_57074 ) ( not ( = ?auto_57074 ?auto_57076 ) ) ( not ( = ?auto_57074 ?auto_57073 ) ) ( not ( = ?auto_57074 ?auto_57072 ) ) ( not ( = ?auto_57070 ?auto_57074 ) ) ( not ( = ?auto_57071 ?auto_57074 ) ) ( ON ?auto_57070 ?auto_57075 ) ( not ( = ?auto_57070 ?auto_57075 ) ) ( not ( = ?auto_57071 ?auto_57075 ) ) ( not ( = ?auto_57072 ?auto_57075 ) ) ( not ( = ?auto_57073 ?auto_57075 ) ) ( not ( = ?auto_57076 ?auto_57075 ) ) ( not ( = ?auto_57074 ?auto_57075 ) ) ( ON ?auto_57071 ?auto_57070 ) ( ON-TABLE ?auto_57075 ) ( ON ?auto_57072 ?auto_57071 ) ( CLEAR ?auto_57072 ) ( HOLDING ?auto_57073 ) ( CLEAR ?auto_57076 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57074 ?auto_57076 ?auto_57073 )
      ( MAKE-4PILE ?auto_57070 ?auto_57071 ?auto_57072 ?auto_57073 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57077 - BLOCK
      ?auto_57078 - BLOCK
      ?auto_57079 - BLOCK
      ?auto_57080 - BLOCK
    )
    :vars
    (
      ?auto_57083 - BLOCK
      ?auto_57081 - BLOCK
      ?auto_57082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57077 ?auto_57078 ) ) ( not ( = ?auto_57077 ?auto_57079 ) ) ( not ( = ?auto_57077 ?auto_57080 ) ) ( not ( = ?auto_57078 ?auto_57079 ) ) ( not ( = ?auto_57078 ?auto_57080 ) ) ( not ( = ?auto_57079 ?auto_57080 ) ) ( not ( = ?auto_57077 ?auto_57083 ) ) ( not ( = ?auto_57078 ?auto_57083 ) ) ( not ( = ?auto_57079 ?auto_57083 ) ) ( not ( = ?auto_57080 ?auto_57083 ) ) ( ON-TABLE ?auto_57081 ) ( ON ?auto_57083 ?auto_57081 ) ( not ( = ?auto_57081 ?auto_57083 ) ) ( not ( = ?auto_57081 ?auto_57080 ) ) ( not ( = ?auto_57081 ?auto_57079 ) ) ( not ( = ?auto_57077 ?auto_57081 ) ) ( not ( = ?auto_57078 ?auto_57081 ) ) ( ON ?auto_57077 ?auto_57082 ) ( not ( = ?auto_57077 ?auto_57082 ) ) ( not ( = ?auto_57078 ?auto_57082 ) ) ( not ( = ?auto_57079 ?auto_57082 ) ) ( not ( = ?auto_57080 ?auto_57082 ) ) ( not ( = ?auto_57083 ?auto_57082 ) ) ( not ( = ?auto_57081 ?auto_57082 ) ) ( ON ?auto_57078 ?auto_57077 ) ( ON-TABLE ?auto_57082 ) ( ON ?auto_57079 ?auto_57078 ) ( CLEAR ?auto_57083 ) ( ON ?auto_57080 ?auto_57079 ) ( CLEAR ?auto_57080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57082 ?auto_57077 ?auto_57078 ?auto_57079 )
      ( MAKE-4PILE ?auto_57077 ?auto_57078 ?auto_57079 ?auto_57080 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57084 - BLOCK
      ?auto_57085 - BLOCK
      ?auto_57086 - BLOCK
      ?auto_57087 - BLOCK
    )
    :vars
    (
      ?auto_57088 - BLOCK
      ?auto_57090 - BLOCK
      ?auto_57089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57084 ?auto_57085 ) ) ( not ( = ?auto_57084 ?auto_57086 ) ) ( not ( = ?auto_57084 ?auto_57087 ) ) ( not ( = ?auto_57085 ?auto_57086 ) ) ( not ( = ?auto_57085 ?auto_57087 ) ) ( not ( = ?auto_57086 ?auto_57087 ) ) ( not ( = ?auto_57084 ?auto_57088 ) ) ( not ( = ?auto_57085 ?auto_57088 ) ) ( not ( = ?auto_57086 ?auto_57088 ) ) ( not ( = ?auto_57087 ?auto_57088 ) ) ( ON-TABLE ?auto_57090 ) ( not ( = ?auto_57090 ?auto_57088 ) ) ( not ( = ?auto_57090 ?auto_57087 ) ) ( not ( = ?auto_57090 ?auto_57086 ) ) ( not ( = ?auto_57084 ?auto_57090 ) ) ( not ( = ?auto_57085 ?auto_57090 ) ) ( ON ?auto_57084 ?auto_57089 ) ( not ( = ?auto_57084 ?auto_57089 ) ) ( not ( = ?auto_57085 ?auto_57089 ) ) ( not ( = ?auto_57086 ?auto_57089 ) ) ( not ( = ?auto_57087 ?auto_57089 ) ) ( not ( = ?auto_57088 ?auto_57089 ) ) ( not ( = ?auto_57090 ?auto_57089 ) ) ( ON ?auto_57085 ?auto_57084 ) ( ON-TABLE ?auto_57089 ) ( ON ?auto_57086 ?auto_57085 ) ( ON ?auto_57087 ?auto_57086 ) ( CLEAR ?auto_57087 ) ( HOLDING ?auto_57088 ) ( CLEAR ?auto_57090 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57090 ?auto_57088 )
      ( MAKE-4PILE ?auto_57084 ?auto_57085 ?auto_57086 ?auto_57087 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57091 - BLOCK
      ?auto_57092 - BLOCK
      ?auto_57093 - BLOCK
      ?auto_57094 - BLOCK
    )
    :vars
    (
      ?auto_57095 - BLOCK
      ?auto_57097 - BLOCK
      ?auto_57096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57091 ?auto_57092 ) ) ( not ( = ?auto_57091 ?auto_57093 ) ) ( not ( = ?auto_57091 ?auto_57094 ) ) ( not ( = ?auto_57092 ?auto_57093 ) ) ( not ( = ?auto_57092 ?auto_57094 ) ) ( not ( = ?auto_57093 ?auto_57094 ) ) ( not ( = ?auto_57091 ?auto_57095 ) ) ( not ( = ?auto_57092 ?auto_57095 ) ) ( not ( = ?auto_57093 ?auto_57095 ) ) ( not ( = ?auto_57094 ?auto_57095 ) ) ( ON-TABLE ?auto_57097 ) ( not ( = ?auto_57097 ?auto_57095 ) ) ( not ( = ?auto_57097 ?auto_57094 ) ) ( not ( = ?auto_57097 ?auto_57093 ) ) ( not ( = ?auto_57091 ?auto_57097 ) ) ( not ( = ?auto_57092 ?auto_57097 ) ) ( ON ?auto_57091 ?auto_57096 ) ( not ( = ?auto_57091 ?auto_57096 ) ) ( not ( = ?auto_57092 ?auto_57096 ) ) ( not ( = ?auto_57093 ?auto_57096 ) ) ( not ( = ?auto_57094 ?auto_57096 ) ) ( not ( = ?auto_57095 ?auto_57096 ) ) ( not ( = ?auto_57097 ?auto_57096 ) ) ( ON ?auto_57092 ?auto_57091 ) ( ON-TABLE ?auto_57096 ) ( ON ?auto_57093 ?auto_57092 ) ( ON ?auto_57094 ?auto_57093 ) ( CLEAR ?auto_57097 ) ( ON ?auto_57095 ?auto_57094 ) ( CLEAR ?auto_57095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57096 ?auto_57091 ?auto_57092 ?auto_57093 ?auto_57094 )
      ( MAKE-4PILE ?auto_57091 ?auto_57092 ?auto_57093 ?auto_57094 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57098 - BLOCK
      ?auto_57099 - BLOCK
      ?auto_57100 - BLOCK
      ?auto_57101 - BLOCK
    )
    :vars
    (
      ?auto_57104 - BLOCK
      ?auto_57102 - BLOCK
      ?auto_57103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57098 ?auto_57099 ) ) ( not ( = ?auto_57098 ?auto_57100 ) ) ( not ( = ?auto_57098 ?auto_57101 ) ) ( not ( = ?auto_57099 ?auto_57100 ) ) ( not ( = ?auto_57099 ?auto_57101 ) ) ( not ( = ?auto_57100 ?auto_57101 ) ) ( not ( = ?auto_57098 ?auto_57104 ) ) ( not ( = ?auto_57099 ?auto_57104 ) ) ( not ( = ?auto_57100 ?auto_57104 ) ) ( not ( = ?auto_57101 ?auto_57104 ) ) ( not ( = ?auto_57102 ?auto_57104 ) ) ( not ( = ?auto_57102 ?auto_57101 ) ) ( not ( = ?auto_57102 ?auto_57100 ) ) ( not ( = ?auto_57098 ?auto_57102 ) ) ( not ( = ?auto_57099 ?auto_57102 ) ) ( ON ?auto_57098 ?auto_57103 ) ( not ( = ?auto_57098 ?auto_57103 ) ) ( not ( = ?auto_57099 ?auto_57103 ) ) ( not ( = ?auto_57100 ?auto_57103 ) ) ( not ( = ?auto_57101 ?auto_57103 ) ) ( not ( = ?auto_57104 ?auto_57103 ) ) ( not ( = ?auto_57102 ?auto_57103 ) ) ( ON ?auto_57099 ?auto_57098 ) ( ON-TABLE ?auto_57103 ) ( ON ?auto_57100 ?auto_57099 ) ( ON ?auto_57101 ?auto_57100 ) ( ON ?auto_57104 ?auto_57101 ) ( CLEAR ?auto_57104 ) ( HOLDING ?auto_57102 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57102 )
      ( MAKE-4PILE ?auto_57098 ?auto_57099 ?auto_57100 ?auto_57101 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57105 - BLOCK
      ?auto_57106 - BLOCK
      ?auto_57107 - BLOCK
      ?auto_57108 - BLOCK
    )
    :vars
    (
      ?auto_57109 - BLOCK
      ?auto_57110 - BLOCK
      ?auto_57111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57105 ?auto_57106 ) ) ( not ( = ?auto_57105 ?auto_57107 ) ) ( not ( = ?auto_57105 ?auto_57108 ) ) ( not ( = ?auto_57106 ?auto_57107 ) ) ( not ( = ?auto_57106 ?auto_57108 ) ) ( not ( = ?auto_57107 ?auto_57108 ) ) ( not ( = ?auto_57105 ?auto_57109 ) ) ( not ( = ?auto_57106 ?auto_57109 ) ) ( not ( = ?auto_57107 ?auto_57109 ) ) ( not ( = ?auto_57108 ?auto_57109 ) ) ( not ( = ?auto_57110 ?auto_57109 ) ) ( not ( = ?auto_57110 ?auto_57108 ) ) ( not ( = ?auto_57110 ?auto_57107 ) ) ( not ( = ?auto_57105 ?auto_57110 ) ) ( not ( = ?auto_57106 ?auto_57110 ) ) ( ON ?auto_57105 ?auto_57111 ) ( not ( = ?auto_57105 ?auto_57111 ) ) ( not ( = ?auto_57106 ?auto_57111 ) ) ( not ( = ?auto_57107 ?auto_57111 ) ) ( not ( = ?auto_57108 ?auto_57111 ) ) ( not ( = ?auto_57109 ?auto_57111 ) ) ( not ( = ?auto_57110 ?auto_57111 ) ) ( ON ?auto_57106 ?auto_57105 ) ( ON-TABLE ?auto_57111 ) ( ON ?auto_57107 ?auto_57106 ) ( ON ?auto_57108 ?auto_57107 ) ( ON ?auto_57109 ?auto_57108 ) ( ON ?auto_57110 ?auto_57109 ) ( CLEAR ?auto_57110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57111 ?auto_57105 ?auto_57106 ?auto_57107 ?auto_57108 ?auto_57109 )
      ( MAKE-4PILE ?auto_57105 ?auto_57106 ?auto_57107 ?auto_57108 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57113 - BLOCK
    )
    :vars
    (
      ?auto_57114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57114 ?auto_57113 ) ( CLEAR ?auto_57114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57113 ) ( not ( = ?auto_57113 ?auto_57114 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57114 ?auto_57113 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57115 - BLOCK
    )
    :vars
    (
      ?auto_57116 - BLOCK
      ?auto_57117 - BLOCK
      ?auto_57118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57116 ?auto_57115 ) ( CLEAR ?auto_57116 ) ( ON-TABLE ?auto_57115 ) ( not ( = ?auto_57115 ?auto_57116 ) ) ( HOLDING ?auto_57117 ) ( CLEAR ?auto_57118 ) ( not ( = ?auto_57115 ?auto_57117 ) ) ( not ( = ?auto_57115 ?auto_57118 ) ) ( not ( = ?auto_57116 ?auto_57117 ) ) ( not ( = ?auto_57116 ?auto_57118 ) ) ( not ( = ?auto_57117 ?auto_57118 ) ) )
    :subtasks
    ( ( !STACK ?auto_57117 ?auto_57118 )
      ( MAKE-1PILE ?auto_57115 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57119 - BLOCK
    )
    :vars
    (
      ?auto_57120 - BLOCK
      ?auto_57121 - BLOCK
      ?auto_57122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57120 ?auto_57119 ) ( ON-TABLE ?auto_57119 ) ( not ( = ?auto_57119 ?auto_57120 ) ) ( CLEAR ?auto_57121 ) ( not ( = ?auto_57119 ?auto_57122 ) ) ( not ( = ?auto_57119 ?auto_57121 ) ) ( not ( = ?auto_57120 ?auto_57122 ) ) ( not ( = ?auto_57120 ?auto_57121 ) ) ( not ( = ?auto_57122 ?auto_57121 ) ) ( ON ?auto_57122 ?auto_57120 ) ( CLEAR ?auto_57122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57119 ?auto_57120 )
      ( MAKE-1PILE ?auto_57119 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57123 - BLOCK
    )
    :vars
    (
      ?auto_57125 - BLOCK
      ?auto_57126 - BLOCK
      ?auto_57124 - BLOCK
      ?auto_57128 - BLOCK
      ?auto_57127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57125 ?auto_57123 ) ( ON-TABLE ?auto_57123 ) ( not ( = ?auto_57123 ?auto_57125 ) ) ( not ( = ?auto_57123 ?auto_57126 ) ) ( not ( = ?auto_57123 ?auto_57124 ) ) ( not ( = ?auto_57125 ?auto_57126 ) ) ( not ( = ?auto_57125 ?auto_57124 ) ) ( not ( = ?auto_57126 ?auto_57124 ) ) ( ON ?auto_57126 ?auto_57125 ) ( CLEAR ?auto_57126 ) ( HOLDING ?auto_57124 ) ( CLEAR ?auto_57128 ) ( ON-TABLE ?auto_57127 ) ( ON ?auto_57128 ?auto_57127 ) ( not ( = ?auto_57127 ?auto_57128 ) ) ( not ( = ?auto_57127 ?auto_57124 ) ) ( not ( = ?auto_57128 ?auto_57124 ) ) ( not ( = ?auto_57123 ?auto_57128 ) ) ( not ( = ?auto_57123 ?auto_57127 ) ) ( not ( = ?auto_57125 ?auto_57128 ) ) ( not ( = ?auto_57125 ?auto_57127 ) ) ( not ( = ?auto_57126 ?auto_57128 ) ) ( not ( = ?auto_57126 ?auto_57127 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57127 ?auto_57128 ?auto_57124 )
      ( MAKE-1PILE ?auto_57123 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57129 - BLOCK
    )
    :vars
    (
      ?auto_57132 - BLOCK
      ?auto_57133 - BLOCK
      ?auto_57134 - BLOCK
      ?auto_57131 - BLOCK
      ?auto_57130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57132 ?auto_57129 ) ( ON-TABLE ?auto_57129 ) ( not ( = ?auto_57129 ?auto_57132 ) ) ( not ( = ?auto_57129 ?auto_57133 ) ) ( not ( = ?auto_57129 ?auto_57134 ) ) ( not ( = ?auto_57132 ?auto_57133 ) ) ( not ( = ?auto_57132 ?auto_57134 ) ) ( not ( = ?auto_57133 ?auto_57134 ) ) ( ON ?auto_57133 ?auto_57132 ) ( CLEAR ?auto_57131 ) ( ON-TABLE ?auto_57130 ) ( ON ?auto_57131 ?auto_57130 ) ( not ( = ?auto_57130 ?auto_57131 ) ) ( not ( = ?auto_57130 ?auto_57134 ) ) ( not ( = ?auto_57131 ?auto_57134 ) ) ( not ( = ?auto_57129 ?auto_57131 ) ) ( not ( = ?auto_57129 ?auto_57130 ) ) ( not ( = ?auto_57132 ?auto_57131 ) ) ( not ( = ?auto_57132 ?auto_57130 ) ) ( not ( = ?auto_57133 ?auto_57131 ) ) ( not ( = ?auto_57133 ?auto_57130 ) ) ( ON ?auto_57134 ?auto_57133 ) ( CLEAR ?auto_57134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57129 ?auto_57132 ?auto_57133 )
      ( MAKE-1PILE ?auto_57129 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57135 - BLOCK
    )
    :vars
    (
      ?auto_57139 - BLOCK
      ?auto_57138 - BLOCK
      ?auto_57136 - BLOCK
      ?auto_57140 - BLOCK
      ?auto_57137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57139 ?auto_57135 ) ( ON-TABLE ?auto_57135 ) ( not ( = ?auto_57135 ?auto_57139 ) ) ( not ( = ?auto_57135 ?auto_57138 ) ) ( not ( = ?auto_57135 ?auto_57136 ) ) ( not ( = ?auto_57139 ?auto_57138 ) ) ( not ( = ?auto_57139 ?auto_57136 ) ) ( not ( = ?auto_57138 ?auto_57136 ) ) ( ON ?auto_57138 ?auto_57139 ) ( ON-TABLE ?auto_57140 ) ( not ( = ?auto_57140 ?auto_57137 ) ) ( not ( = ?auto_57140 ?auto_57136 ) ) ( not ( = ?auto_57137 ?auto_57136 ) ) ( not ( = ?auto_57135 ?auto_57137 ) ) ( not ( = ?auto_57135 ?auto_57140 ) ) ( not ( = ?auto_57139 ?auto_57137 ) ) ( not ( = ?auto_57139 ?auto_57140 ) ) ( not ( = ?auto_57138 ?auto_57137 ) ) ( not ( = ?auto_57138 ?auto_57140 ) ) ( ON ?auto_57136 ?auto_57138 ) ( CLEAR ?auto_57136 ) ( HOLDING ?auto_57137 ) ( CLEAR ?auto_57140 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57140 ?auto_57137 )
      ( MAKE-1PILE ?auto_57135 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57141 - BLOCK
    )
    :vars
    (
      ?auto_57146 - BLOCK
      ?auto_57144 - BLOCK
      ?auto_57145 - BLOCK
      ?auto_57143 - BLOCK
      ?auto_57142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57146 ?auto_57141 ) ( ON-TABLE ?auto_57141 ) ( not ( = ?auto_57141 ?auto_57146 ) ) ( not ( = ?auto_57141 ?auto_57144 ) ) ( not ( = ?auto_57141 ?auto_57145 ) ) ( not ( = ?auto_57146 ?auto_57144 ) ) ( not ( = ?auto_57146 ?auto_57145 ) ) ( not ( = ?auto_57144 ?auto_57145 ) ) ( ON ?auto_57144 ?auto_57146 ) ( ON-TABLE ?auto_57143 ) ( not ( = ?auto_57143 ?auto_57142 ) ) ( not ( = ?auto_57143 ?auto_57145 ) ) ( not ( = ?auto_57142 ?auto_57145 ) ) ( not ( = ?auto_57141 ?auto_57142 ) ) ( not ( = ?auto_57141 ?auto_57143 ) ) ( not ( = ?auto_57146 ?auto_57142 ) ) ( not ( = ?auto_57146 ?auto_57143 ) ) ( not ( = ?auto_57144 ?auto_57142 ) ) ( not ( = ?auto_57144 ?auto_57143 ) ) ( ON ?auto_57145 ?auto_57144 ) ( CLEAR ?auto_57143 ) ( ON ?auto_57142 ?auto_57145 ) ( CLEAR ?auto_57142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57141 ?auto_57146 ?auto_57144 ?auto_57145 )
      ( MAKE-1PILE ?auto_57141 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57147 - BLOCK
    )
    :vars
    (
      ?auto_57149 - BLOCK
      ?auto_57150 - BLOCK
      ?auto_57151 - BLOCK
      ?auto_57148 - BLOCK
      ?auto_57152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57149 ?auto_57147 ) ( ON-TABLE ?auto_57147 ) ( not ( = ?auto_57147 ?auto_57149 ) ) ( not ( = ?auto_57147 ?auto_57150 ) ) ( not ( = ?auto_57147 ?auto_57151 ) ) ( not ( = ?auto_57149 ?auto_57150 ) ) ( not ( = ?auto_57149 ?auto_57151 ) ) ( not ( = ?auto_57150 ?auto_57151 ) ) ( ON ?auto_57150 ?auto_57149 ) ( not ( = ?auto_57148 ?auto_57152 ) ) ( not ( = ?auto_57148 ?auto_57151 ) ) ( not ( = ?auto_57152 ?auto_57151 ) ) ( not ( = ?auto_57147 ?auto_57152 ) ) ( not ( = ?auto_57147 ?auto_57148 ) ) ( not ( = ?auto_57149 ?auto_57152 ) ) ( not ( = ?auto_57149 ?auto_57148 ) ) ( not ( = ?auto_57150 ?auto_57152 ) ) ( not ( = ?auto_57150 ?auto_57148 ) ) ( ON ?auto_57151 ?auto_57150 ) ( ON ?auto_57152 ?auto_57151 ) ( CLEAR ?auto_57152 ) ( HOLDING ?auto_57148 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57148 )
      ( MAKE-1PILE ?auto_57147 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57153 - BLOCK
    )
    :vars
    (
      ?auto_57155 - BLOCK
      ?auto_57154 - BLOCK
      ?auto_57156 - BLOCK
      ?auto_57158 - BLOCK
      ?auto_57157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57155 ?auto_57153 ) ( ON-TABLE ?auto_57153 ) ( not ( = ?auto_57153 ?auto_57155 ) ) ( not ( = ?auto_57153 ?auto_57154 ) ) ( not ( = ?auto_57153 ?auto_57156 ) ) ( not ( = ?auto_57155 ?auto_57154 ) ) ( not ( = ?auto_57155 ?auto_57156 ) ) ( not ( = ?auto_57154 ?auto_57156 ) ) ( ON ?auto_57154 ?auto_57155 ) ( not ( = ?auto_57158 ?auto_57157 ) ) ( not ( = ?auto_57158 ?auto_57156 ) ) ( not ( = ?auto_57157 ?auto_57156 ) ) ( not ( = ?auto_57153 ?auto_57157 ) ) ( not ( = ?auto_57153 ?auto_57158 ) ) ( not ( = ?auto_57155 ?auto_57157 ) ) ( not ( = ?auto_57155 ?auto_57158 ) ) ( not ( = ?auto_57154 ?auto_57157 ) ) ( not ( = ?auto_57154 ?auto_57158 ) ) ( ON ?auto_57156 ?auto_57154 ) ( ON ?auto_57157 ?auto_57156 ) ( ON ?auto_57158 ?auto_57157 ) ( CLEAR ?auto_57158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57153 ?auto_57155 ?auto_57154 ?auto_57156 ?auto_57157 )
      ( MAKE-1PILE ?auto_57153 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57159 - BLOCK
    )
    :vars
    (
      ?auto_57163 - BLOCK
      ?auto_57164 - BLOCK
      ?auto_57160 - BLOCK
      ?auto_57161 - BLOCK
      ?auto_57162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57163 ?auto_57159 ) ( ON-TABLE ?auto_57159 ) ( not ( = ?auto_57159 ?auto_57163 ) ) ( not ( = ?auto_57159 ?auto_57164 ) ) ( not ( = ?auto_57159 ?auto_57160 ) ) ( not ( = ?auto_57163 ?auto_57164 ) ) ( not ( = ?auto_57163 ?auto_57160 ) ) ( not ( = ?auto_57164 ?auto_57160 ) ) ( ON ?auto_57164 ?auto_57163 ) ( not ( = ?auto_57161 ?auto_57162 ) ) ( not ( = ?auto_57161 ?auto_57160 ) ) ( not ( = ?auto_57162 ?auto_57160 ) ) ( not ( = ?auto_57159 ?auto_57162 ) ) ( not ( = ?auto_57159 ?auto_57161 ) ) ( not ( = ?auto_57163 ?auto_57162 ) ) ( not ( = ?auto_57163 ?auto_57161 ) ) ( not ( = ?auto_57164 ?auto_57162 ) ) ( not ( = ?auto_57164 ?auto_57161 ) ) ( ON ?auto_57160 ?auto_57164 ) ( ON ?auto_57162 ?auto_57160 ) ( HOLDING ?auto_57161 ) ( CLEAR ?auto_57162 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57159 ?auto_57163 ?auto_57164 ?auto_57160 ?auto_57162 ?auto_57161 )
      ( MAKE-1PILE ?auto_57159 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57165 - BLOCK
    )
    :vars
    (
      ?auto_57169 - BLOCK
      ?auto_57168 - BLOCK
      ?auto_57170 - BLOCK
      ?auto_57166 - BLOCK
      ?auto_57167 - BLOCK
      ?auto_57171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57169 ?auto_57165 ) ( ON-TABLE ?auto_57165 ) ( not ( = ?auto_57165 ?auto_57169 ) ) ( not ( = ?auto_57165 ?auto_57168 ) ) ( not ( = ?auto_57165 ?auto_57170 ) ) ( not ( = ?auto_57169 ?auto_57168 ) ) ( not ( = ?auto_57169 ?auto_57170 ) ) ( not ( = ?auto_57168 ?auto_57170 ) ) ( ON ?auto_57168 ?auto_57169 ) ( not ( = ?auto_57166 ?auto_57167 ) ) ( not ( = ?auto_57166 ?auto_57170 ) ) ( not ( = ?auto_57167 ?auto_57170 ) ) ( not ( = ?auto_57165 ?auto_57167 ) ) ( not ( = ?auto_57165 ?auto_57166 ) ) ( not ( = ?auto_57169 ?auto_57167 ) ) ( not ( = ?auto_57169 ?auto_57166 ) ) ( not ( = ?auto_57168 ?auto_57167 ) ) ( not ( = ?auto_57168 ?auto_57166 ) ) ( ON ?auto_57170 ?auto_57168 ) ( ON ?auto_57167 ?auto_57170 ) ( CLEAR ?auto_57167 ) ( ON ?auto_57166 ?auto_57171 ) ( CLEAR ?auto_57166 ) ( HAND-EMPTY ) ( not ( = ?auto_57165 ?auto_57171 ) ) ( not ( = ?auto_57169 ?auto_57171 ) ) ( not ( = ?auto_57168 ?auto_57171 ) ) ( not ( = ?auto_57170 ?auto_57171 ) ) ( not ( = ?auto_57166 ?auto_57171 ) ) ( not ( = ?auto_57167 ?auto_57171 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57166 ?auto_57171 )
      ( MAKE-1PILE ?auto_57165 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57172 - BLOCK
    )
    :vars
    (
      ?auto_57177 - BLOCK
      ?auto_57174 - BLOCK
      ?auto_57178 - BLOCK
      ?auto_57175 - BLOCK
      ?auto_57173 - BLOCK
      ?auto_57176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57177 ?auto_57172 ) ( ON-TABLE ?auto_57172 ) ( not ( = ?auto_57172 ?auto_57177 ) ) ( not ( = ?auto_57172 ?auto_57174 ) ) ( not ( = ?auto_57172 ?auto_57178 ) ) ( not ( = ?auto_57177 ?auto_57174 ) ) ( not ( = ?auto_57177 ?auto_57178 ) ) ( not ( = ?auto_57174 ?auto_57178 ) ) ( ON ?auto_57174 ?auto_57177 ) ( not ( = ?auto_57175 ?auto_57173 ) ) ( not ( = ?auto_57175 ?auto_57178 ) ) ( not ( = ?auto_57173 ?auto_57178 ) ) ( not ( = ?auto_57172 ?auto_57173 ) ) ( not ( = ?auto_57172 ?auto_57175 ) ) ( not ( = ?auto_57177 ?auto_57173 ) ) ( not ( = ?auto_57177 ?auto_57175 ) ) ( not ( = ?auto_57174 ?auto_57173 ) ) ( not ( = ?auto_57174 ?auto_57175 ) ) ( ON ?auto_57178 ?auto_57174 ) ( ON ?auto_57175 ?auto_57176 ) ( CLEAR ?auto_57175 ) ( not ( = ?auto_57172 ?auto_57176 ) ) ( not ( = ?auto_57177 ?auto_57176 ) ) ( not ( = ?auto_57174 ?auto_57176 ) ) ( not ( = ?auto_57178 ?auto_57176 ) ) ( not ( = ?auto_57175 ?auto_57176 ) ) ( not ( = ?auto_57173 ?auto_57176 ) ) ( HOLDING ?auto_57173 ) ( CLEAR ?auto_57178 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57172 ?auto_57177 ?auto_57174 ?auto_57178 ?auto_57173 )
      ( MAKE-1PILE ?auto_57172 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57179 - BLOCK
    )
    :vars
    (
      ?auto_57185 - BLOCK
      ?auto_57181 - BLOCK
      ?auto_57182 - BLOCK
      ?auto_57183 - BLOCK
      ?auto_57180 - BLOCK
      ?auto_57184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57185 ?auto_57179 ) ( ON-TABLE ?auto_57179 ) ( not ( = ?auto_57179 ?auto_57185 ) ) ( not ( = ?auto_57179 ?auto_57181 ) ) ( not ( = ?auto_57179 ?auto_57182 ) ) ( not ( = ?auto_57185 ?auto_57181 ) ) ( not ( = ?auto_57185 ?auto_57182 ) ) ( not ( = ?auto_57181 ?auto_57182 ) ) ( ON ?auto_57181 ?auto_57185 ) ( not ( = ?auto_57183 ?auto_57180 ) ) ( not ( = ?auto_57183 ?auto_57182 ) ) ( not ( = ?auto_57180 ?auto_57182 ) ) ( not ( = ?auto_57179 ?auto_57180 ) ) ( not ( = ?auto_57179 ?auto_57183 ) ) ( not ( = ?auto_57185 ?auto_57180 ) ) ( not ( = ?auto_57185 ?auto_57183 ) ) ( not ( = ?auto_57181 ?auto_57180 ) ) ( not ( = ?auto_57181 ?auto_57183 ) ) ( ON ?auto_57182 ?auto_57181 ) ( ON ?auto_57183 ?auto_57184 ) ( not ( = ?auto_57179 ?auto_57184 ) ) ( not ( = ?auto_57185 ?auto_57184 ) ) ( not ( = ?auto_57181 ?auto_57184 ) ) ( not ( = ?auto_57182 ?auto_57184 ) ) ( not ( = ?auto_57183 ?auto_57184 ) ) ( not ( = ?auto_57180 ?auto_57184 ) ) ( CLEAR ?auto_57182 ) ( ON ?auto_57180 ?auto_57183 ) ( CLEAR ?auto_57180 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57184 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57184 ?auto_57183 )
      ( MAKE-1PILE ?auto_57179 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57186 - BLOCK
    )
    :vars
    (
      ?auto_57191 - BLOCK
      ?auto_57188 - BLOCK
      ?auto_57187 - BLOCK
      ?auto_57189 - BLOCK
      ?auto_57190 - BLOCK
      ?auto_57192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57191 ?auto_57186 ) ( ON-TABLE ?auto_57186 ) ( not ( = ?auto_57186 ?auto_57191 ) ) ( not ( = ?auto_57186 ?auto_57188 ) ) ( not ( = ?auto_57186 ?auto_57187 ) ) ( not ( = ?auto_57191 ?auto_57188 ) ) ( not ( = ?auto_57191 ?auto_57187 ) ) ( not ( = ?auto_57188 ?auto_57187 ) ) ( ON ?auto_57188 ?auto_57191 ) ( not ( = ?auto_57189 ?auto_57190 ) ) ( not ( = ?auto_57189 ?auto_57187 ) ) ( not ( = ?auto_57190 ?auto_57187 ) ) ( not ( = ?auto_57186 ?auto_57190 ) ) ( not ( = ?auto_57186 ?auto_57189 ) ) ( not ( = ?auto_57191 ?auto_57190 ) ) ( not ( = ?auto_57191 ?auto_57189 ) ) ( not ( = ?auto_57188 ?auto_57190 ) ) ( not ( = ?auto_57188 ?auto_57189 ) ) ( ON ?auto_57189 ?auto_57192 ) ( not ( = ?auto_57186 ?auto_57192 ) ) ( not ( = ?auto_57191 ?auto_57192 ) ) ( not ( = ?auto_57188 ?auto_57192 ) ) ( not ( = ?auto_57187 ?auto_57192 ) ) ( not ( = ?auto_57189 ?auto_57192 ) ) ( not ( = ?auto_57190 ?auto_57192 ) ) ( ON ?auto_57190 ?auto_57189 ) ( CLEAR ?auto_57190 ) ( ON-TABLE ?auto_57192 ) ( HOLDING ?auto_57187 ) ( CLEAR ?auto_57188 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57186 ?auto_57191 ?auto_57188 ?auto_57187 )
      ( MAKE-1PILE ?auto_57186 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57193 - BLOCK
    )
    :vars
    (
      ?auto_57198 - BLOCK
      ?auto_57194 - BLOCK
      ?auto_57197 - BLOCK
      ?auto_57196 - BLOCK
      ?auto_57195 - BLOCK
      ?auto_57199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57198 ?auto_57193 ) ( ON-TABLE ?auto_57193 ) ( not ( = ?auto_57193 ?auto_57198 ) ) ( not ( = ?auto_57193 ?auto_57194 ) ) ( not ( = ?auto_57193 ?auto_57197 ) ) ( not ( = ?auto_57198 ?auto_57194 ) ) ( not ( = ?auto_57198 ?auto_57197 ) ) ( not ( = ?auto_57194 ?auto_57197 ) ) ( ON ?auto_57194 ?auto_57198 ) ( not ( = ?auto_57196 ?auto_57195 ) ) ( not ( = ?auto_57196 ?auto_57197 ) ) ( not ( = ?auto_57195 ?auto_57197 ) ) ( not ( = ?auto_57193 ?auto_57195 ) ) ( not ( = ?auto_57193 ?auto_57196 ) ) ( not ( = ?auto_57198 ?auto_57195 ) ) ( not ( = ?auto_57198 ?auto_57196 ) ) ( not ( = ?auto_57194 ?auto_57195 ) ) ( not ( = ?auto_57194 ?auto_57196 ) ) ( ON ?auto_57196 ?auto_57199 ) ( not ( = ?auto_57193 ?auto_57199 ) ) ( not ( = ?auto_57198 ?auto_57199 ) ) ( not ( = ?auto_57194 ?auto_57199 ) ) ( not ( = ?auto_57197 ?auto_57199 ) ) ( not ( = ?auto_57196 ?auto_57199 ) ) ( not ( = ?auto_57195 ?auto_57199 ) ) ( ON ?auto_57195 ?auto_57196 ) ( ON-TABLE ?auto_57199 ) ( CLEAR ?auto_57194 ) ( ON ?auto_57197 ?auto_57195 ) ( CLEAR ?auto_57197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57199 ?auto_57196 ?auto_57195 )
      ( MAKE-1PILE ?auto_57193 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57200 - BLOCK
    )
    :vars
    (
      ?auto_57201 - BLOCK
      ?auto_57204 - BLOCK
      ?auto_57203 - BLOCK
      ?auto_57205 - BLOCK
      ?auto_57202 - BLOCK
      ?auto_57206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57201 ?auto_57200 ) ( ON-TABLE ?auto_57200 ) ( not ( = ?auto_57200 ?auto_57201 ) ) ( not ( = ?auto_57200 ?auto_57204 ) ) ( not ( = ?auto_57200 ?auto_57203 ) ) ( not ( = ?auto_57201 ?auto_57204 ) ) ( not ( = ?auto_57201 ?auto_57203 ) ) ( not ( = ?auto_57204 ?auto_57203 ) ) ( not ( = ?auto_57205 ?auto_57202 ) ) ( not ( = ?auto_57205 ?auto_57203 ) ) ( not ( = ?auto_57202 ?auto_57203 ) ) ( not ( = ?auto_57200 ?auto_57202 ) ) ( not ( = ?auto_57200 ?auto_57205 ) ) ( not ( = ?auto_57201 ?auto_57202 ) ) ( not ( = ?auto_57201 ?auto_57205 ) ) ( not ( = ?auto_57204 ?auto_57202 ) ) ( not ( = ?auto_57204 ?auto_57205 ) ) ( ON ?auto_57205 ?auto_57206 ) ( not ( = ?auto_57200 ?auto_57206 ) ) ( not ( = ?auto_57201 ?auto_57206 ) ) ( not ( = ?auto_57204 ?auto_57206 ) ) ( not ( = ?auto_57203 ?auto_57206 ) ) ( not ( = ?auto_57205 ?auto_57206 ) ) ( not ( = ?auto_57202 ?auto_57206 ) ) ( ON ?auto_57202 ?auto_57205 ) ( ON-TABLE ?auto_57206 ) ( ON ?auto_57203 ?auto_57202 ) ( CLEAR ?auto_57203 ) ( HOLDING ?auto_57204 ) ( CLEAR ?auto_57201 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57200 ?auto_57201 ?auto_57204 )
      ( MAKE-1PILE ?auto_57200 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57207 - BLOCK
    )
    :vars
    (
      ?auto_57208 - BLOCK
      ?auto_57212 - BLOCK
      ?auto_57210 - BLOCK
      ?auto_57213 - BLOCK
      ?auto_57211 - BLOCK
      ?auto_57209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57208 ?auto_57207 ) ( ON-TABLE ?auto_57207 ) ( not ( = ?auto_57207 ?auto_57208 ) ) ( not ( = ?auto_57207 ?auto_57212 ) ) ( not ( = ?auto_57207 ?auto_57210 ) ) ( not ( = ?auto_57208 ?auto_57212 ) ) ( not ( = ?auto_57208 ?auto_57210 ) ) ( not ( = ?auto_57212 ?auto_57210 ) ) ( not ( = ?auto_57213 ?auto_57211 ) ) ( not ( = ?auto_57213 ?auto_57210 ) ) ( not ( = ?auto_57211 ?auto_57210 ) ) ( not ( = ?auto_57207 ?auto_57211 ) ) ( not ( = ?auto_57207 ?auto_57213 ) ) ( not ( = ?auto_57208 ?auto_57211 ) ) ( not ( = ?auto_57208 ?auto_57213 ) ) ( not ( = ?auto_57212 ?auto_57211 ) ) ( not ( = ?auto_57212 ?auto_57213 ) ) ( ON ?auto_57213 ?auto_57209 ) ( not ( = ?auto_57207 ?auto_57209 ) ) ( not ( = ?auto_57208 ?auto_57209 ) ) ( not ( = ?auto_57212 ?auto_57209 ) ) ( not ( = ?auto_57210 ?auto_57209 ) ) ( not ( = ?auto_57213 ?auto_57209 ) ) ( not ( = ?auto_57211 ?auto_57209 ) ) ( ON ?auto_57211 ?auto_57213 ) ( ON-TABLE ?auto_57209 ) ( ON ?auto_57210 ?auto_57211 ) ( CLEAR ?auto_57208 ) ( ON ?auto_57212 ?auto_57210 ) ( CLEAR ?auto_57212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57209 ?auto_57213 ?auto_57211 ?auto_57210 )
      ( MAKE-1PILE ?auto_57207 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57228 - BLOCK
    )
    :vars
    (
      ?auto_57234 - BLOCK
      ?auto_57231 - BLOCK
      ?auto_57229 - BLOCK
      ?auto_57230 - BLOCK
      ?auto_57232 - BLOCK
      ?auto_57233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57228 ?auto_57234 ) ) ( not ( = ?auto_57228 ?auto_57231 ) ) ( not ( = ?auto_57228 ?auto_57229 ) ) ( not ( = ?auto_57234 ?auto_57231 ) ) ( not ( = ?auto_57234 ?auto_57229 ) ) ( not ( = ?auto_57231 ?auto_57229 ) ) ( not ( = ?auto_57230 ?auto_57232 ) ) ( not ( = ?auto_57230 ?auto_57229 ) ) ( not ( = ?auto_57232 ?auto_57229 ) ) ( not ( = ?auto_57228 ?auto_57232 ) ) ( not ( = ?auto_57228 ?auto_57230 ) ) ( not ( = ?auto_57234 ?auto_57232 ) ) ( not ( = ?auto_57234 ?auto_57230 ) ) ( not ( = ?auto_57231 ?auto_57232 ) ) ( not ( = ?auto_57231 ?auto_57230 ) ) ( ON ?auto_57230 ?auto_57233 ) ( not ( = ?auto_57228 ?auto_57233 ) ) ( not ( = ?auto_57234 ?auto_57233 ) ) ( not ( = ?auto_57231 ?auto_57233 ) ) ( not ( = ?auto_57229 ?auto_57233 ) ) ( not ( = ?auto_57230 ?auto_57233 ) ) ( not ( = ?auto_57232 ?auto_57233 ) ) ( ON ?auto_57232 ?auto_57230 ) ( ON-TABLE ?auto_57233 ) ( ON ?auto_57229 ?auto_57232 ) ( ON ?auto_57231 ?auto_57229 ) ( ON ?auto_57234 ?auto_57231 ) ( CLEAR ?auto_57234 ) ( HOLDING ?auto_57228 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57228 ?auto_57234 )
      ( MAKE-1PILE ?auto_57228 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57235 - BLOCK
    )
    :vars
    (
      ?auto_57236 - BLOCK
      ?auto_57237 - BLOCK
      ?auto_57241 - BLOCK
      ?auto_57240 - BLOCK
      ?auto_57238 - BLOCK
      ?auto_57239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57235 ?auto_57236 ) ) ( not ( = ?auto_57235 ?auto_57237 ) ) ( not ( = ?auto_57235 ?auto_57241 ) ) ( not ( = ?auto_57236 ?auto_57237 ) ) ( not ( = ?auto_57236 ?auto_57241 ) ) ( not ( = ?auto_57237 ?auto_57241 ) ) ( not ( = ?auto_57240 ?auto_57238 ) ) ( not ( = ?auto_57240 ?auto_57241 ) ) ( not ( = ?auto_57238 ?auto_57241 ) ) ( not ( = ?auto_57235 ?auto_57238 ) ) ( not ( = ?auto_57235 ?auto_57240 ) ) ( not ( = ?auto_57236 ?auto_57238 ) ) ( not ( = ?auto_57236 ?auto_57240 ) ) ( not ( = ?auto_57237 ?auto_57238 ) ) ( not ( = ?auto_57237 ?auto_57240 ) ) ( ON ?auto_57240 ?auto_57239 ) ( not ( = ?auto_57235 ?auto_57239 ) ) ( not ( = ?auto_57236 ?auto_57239 ) ) ( not ( = ?auto_57237 ?auto_57239 ) ) ( not ( = ?auto_57241 ?auto_57239 ) ) ( not ( = ?auto_57240 ?auto_57239 ) ) ( not ( = ?auto_57238 ?auto_57239 ) ) ( ON ?auto_57238 ?auto_57240 ) ( ON-TABLE ?auto_57239 ) ( ON ?auto_57241 ?auto_57238 ) ( ON ?auto_57237 ?auto_57241 ) ( ON ?auto_57236 ?auto_57237 ) ( ON ?auto_57235 ?auto_57236 ) ( CLEAR ?auto_57235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57239 ?auto_57240 ?auto_57238 ?auto_57241 ?auto_57237 ?auto_57236 )
      ( MAKE-1PILE ?auto_57235 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57247 - BLOCK
      ?auto_57248 - BLOCK
      ?auto_57249 - BLOCK
      ?auto_57250 - BLOCK
      ?auto_57251 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_57251 ) ( CLEAR ?auto_57250 ) ( ON-TABLE ?auto_57247 ) ( ON ?auto_57248 ?auto_57247 ) ( ON ?auto_57249 ?auto_57248 ) ( ON ?auto_57250 ?auto_57249 ) ( not ( = ?auto_57247 ?auto_57248 ) ) ( not ( = ?auto_57247 ?auto_57249 ) ) ( not ( = ?auto_57247 ?auto_57250 ) ) ( not ( = ?auto_57247 ?auto_57251 ) ) ( not ( = ?auto_57248 ?auto_57249 ) ) ( not ( = ?auto_57248 ?auto_57250 ) ) ( not ( = ?auto_57248 ?auto_57251 ) ) ( not ( = ?auto_57249 ?auto_57250 ) ) ( not ( = ?auto_57249 ?auto_57251 ) ) ( not ( = ?auto_57250 ?auto_57251 ) ) )
    :subtasks
    ( ( !STACK ?auto_57251 ?auto_57250 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57252 - BLOCK
      ?auto_57253 - BLOCK
      ?auto_57254 - BLOCK
      ?auto_57255 - BLOCK
      ?auto_57256 - BLOCK
    )
    :vars
    (
      ?auto_57257 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57255 ) ( ON-TABLE ?auto_57252 ) ( ON ?auto_57253 ?auto_57252 ) ( ON ?auto_57254 ?auto_57253 ) ( ON ?auto_57255 ?auto_57254 ) ( not ( = ?auto_57252 ?auto_57253 ) ) ( not ( = ?auto_57252 ?auto_57254 ) ) ( not ( = ?auto_57252 ?auto_57255 ) ) ( not ( = ?auto_57252 ?auto_57256 ) ) ( not ( = ?auto_57253 ?auto_57254 ) ) ( not ( = ?auto_57253 ?auto_57255 ) ) ( not ( = ?auto_57253 ?auto_57256 ) ) ( not ( = ?auto_57254 ?auto_57255 ) ) ( not ( = ?auto_57254 ?auto_57256 ) ) ( not ( = ?auto_57255 ?auto_57256 ) ) ( ON ?auto_57256 ?auto_57257 ) ( CLEAR ?auto_57256 ) ( HAND-EMPTY ) ( not ( = ?auto_57252 ?auto_57257 ) ) ( not ( = ?auto_57253 ?auto_57257 ) ) ( not ( = ?auto_57254 ?auto_57257 ) ) ( not ( = ?auto_57255 ?auto_57257 ) ) ( not ( = ?auto_57256 ?auto_57257 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57256 ?auto_57257 )
      ( MAKE-5PILE ?auto_57252 ?auto_57253 ?auto_57254 ?auto_57255 ?auto_57256 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57258 - BLOCK
      ?auto_57259 - BLOCK
      ?auto_57260 - BLOCK
      ?auto_57261 - BLOCK
      ?auto_57262 - BLOCK
    )
    :vars
    (
      ?auto_57263 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57258 ) ( ON ?auto_57259 ?auto_57258 ) ( ON ?auto_57260 ?auto_57259 ) ( not ( = ?auto_57258 ?auto_57259 ) ) ( not ( = ?auto_57258 ?auto_57260 ) ) ( not ( = ?auto_57258 ?auto_57261 ) ) ( not ( = ?auto_57258 ?auto_57262 ) ) ( not ( = ?auto_57259 ?auto_57260 ) ) ( not ( = ?auto_57259 ?auto_57261 ) ) ( not ( = ?auto_57259 ?auto_57262 ) ) ( not ( = ?auto_57260 ?auto_57261 ) ) ( not ( = ?auto_57260 ?auto_57262 ) ) ( not ( = ?auto_57261 ?auto_57262 ) ) ( ON ?auto_57262 ?auto_57263 ) ( CLEAR ?auto_57262 ) ( not ( = ?auto_57258 ?auto_57263 ) ) ( not ( = ?auto_57259 ?auto_57263 ) ) ( not ( = ?auto_57260 ?auto_57263 ) ) ( not ( = ?auto_57261 ?auto_57263 ) ) ( not ( = ?auto_57262 ?auto_57263 ) ) ( HOLDING ?auto_57261 ) ( CLEAR ?auto_57260 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57258 ?auto_57259 ?auto_57260 ?auto_57261 )
      ( MAKE-5PILE ?auto_57258 ?auto_57259 ?auto_57260 ?auto_57261 ?auto_57262 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57264 - BLOCK
      ?auto_57265 - BLOCK
      ?auto_57266 - BLOCK
      ?auto_57267 - BLOCK
      ?auto_57268 - BLOCK
    )
    :vars
    (
      ?auto_57269 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57264 ) ( ON ?auto_57265 ?auto_57264 ) ( ON ?auto_57266 ?auto_57265 ) ( not ( = ?auto_57264 ?auto_57265 ) ) ( not ( = ?auto_57264 ?auto_57266 ) ) ( not ( = ?auto_57264 ?auto_57267 ) ) ( not ( = ?auto_57264 ?auto_57268 ) ) ( not ( = ?auto_57265 ?auto_57266 ) ) ( not ( = ?auto_57265 ?auto_57267 ) ) ( not ( = ?auto_57265 ?auto_57268 ) ) ( not ( = ?auto_57266 ?auto_57267 ) ) ( not ( = ?auto_57266 ?auto_57268 ) ) ( not ( = ?auto_57267 ?auto_57268 ) ) ( ON ?auto_57268 ?auto_57269 ) ( not ( = ?auto_57264 ?auto_57269 ) ) ( not ( = ?auto_57265 ?auto_57269 ) ) ( not ( = ?auto_57266 ?auto_57269 ) ) ( not ( = ?auto_57267 ?auto_57269 ) ) ( not ( = ?auto_57268 ?auto_57269 ) ) ( CLEAR ?auto_57266 ) ( ON ?auto_57267 ?auto_57268 ) ( CLEAR ?auto_57267 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57269 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57269 ?auto_57268 )
      ( MAKE-5PILE ?auto_57264 ?auto_57265 ?auto_57266 ?auto_57267 ?auto_57268 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57270 - BLOCK
      ?auto_57271 - BLOCK
      ?auto_57272 - BLOCK
      ?auto_57273 - BLOCK
      ?auto_57274 - BLOCK
    )
    :vars
    (
      ?auto_57275 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57270 ) ( ON ?auto_57271 ?auto_57270 ) ( not ( = ?auto_57270 ?auto_57271 ) ) ( not ( = ?auto_57270 ?auto_57272 ) ) ( not ( = ?auto_57270 ?auto_57273 ) ) ( not ( = ?auto_57270 ?auto_57274 ) ) ( not ( = ?auto_57271 ?auto_57272 ) ) ( not ( = ?auto_57271 ?auto_57273 ) ) ( not ( = ?auto_57271 ?auto_57274 ) ) ( not ( = ?auto_57272 ?auto_57273 ) ) ( not ( = ?auto_57272 ?auto_57274 ) ) ( not ( = ?auto_57273 ?auto_57274 ) ) ( ON ?auto_57274 ?auto_57275 ) ( not ( = ?auto_57270 ?auto_57275 ) ) ( not ( = ?auto_57271 ?auto_57275 ) ) ( not ( = ?auto_57272 ?auto_57275 ) ) ( not ( = ?auto_57273 ?auto_57275 ) ) ( not ( = ?auto_57274 ?auto_57275 ) ) ( ON ?auto_57273 ?auto_57274 ) ( CLEAR ?auto_57273 ) ( ON-TABLE ?auto_57275 ) ( HOLDING ?auto_57272 ) ( CLEAR ?auto_57271 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57270 ?auto_57271 ?auto_57272 )
      ( MAKE-5PILE ?auto_57270 ?auto_57271 ?auto_57272 ?auto_57273 ?auto_57274 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57276 - BLOCK
      ?auto_57277 - BLOCK
      ?auto_57278 - BLOCK
      ?auto_57279 - BLOCK
      ?auto_57280 - BLOCK
    )
    :vars
    (
      ?auto_57281 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57276 ) ( ON ?auto_57277 ?auto_57276 ) ( not ( = ?auto_57276 ?auto_57277 ) ) ( not ( = ?auto_57276 ?auto_57278 ) ) ( not ( = ?auto_57276 ?auto_57279 ) ) ( not ( = ?auto_57276 ?auto_57280 ) ) ( not ( = ?auto_57277 ?auto_57278 ) ) ( not ( = ?auto_57277 ?auto_57279 ) ) ( not ( = ?auto_57277 ?auto_57280 ) ) ( not ( = ?auto_57278 ?auto_57279 ) ) ( not ( = ?auto_57278 ?auto_57280 ) ) ( not ( = ?auto_57279 ?auto_57280 ) ) ( ON ?auto_57280 ?auto_57281 ) ( not ( = ?auto_57276 ?auto_57281 ) ) ( not ( = ?auto_57277 ?auto_57281 ) ) ( not ( = ?auto_57278 ?auto_57281 ) ) ( not ( = ?auto_57279 ?auto_57281 ) ) ( not ( = ?auto_57280 ?auto_57281 ) ) ( ON ?auto_57279 ?auto_57280 ) ( ON-TABLE ?auto_57281 ) ( CLEAR ?auto_57277 ) ( ON ?auto_57278 ?auto_57279 ) ( CLEAR ?auto_57278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57281 ?auto_57280 ?auto_57279 )
      ( MAKE-5PILE ?auto_57276 ?auto_57277 ?auto_57278 ?auto_57279 ?auto_57280 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57282 - BLOCK
      ?auto_57283 - BLOCK
      ?auto_57284 - BLOCK
      ?auto_57285 - BLOCK
      ?auto_57286 - BLOCK
    )
    :vars
    (
      ?auto_57287 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57282 ) ( not ( = ?auto_57282 ?auto_57283 ) ) ( not ( = ?auto_57282 ?auto_57284 ) ) ( not ( = ?auto_57282 ?auto_57285 ) ) ( not ( = ?auto_57282 ?auto_57286 ) ) ( not ( = ?auto_57283 ?auto_57284 ) ) ( not ( = ?auto_57283 ?auto_57285 ) ) ( not ( = ?auto_57283 ?auto_57286 ) ) ( not ( = ?auto_57284 ?auto_57285 ) ) ( not ( = ?auto_57284 ?auto_57286 ) ) ( not ( = ?auto_57285 ?auto_57286 ) ) ( ON ?auto_57286 ?auto_57287 ) ( not ( = ?auto_57282 ?auto_57287 ) ) ( not ( = ?auto_57283 ?auto_57287 ) ) ( not ( = ?auto_57284 ?auto_57287 ) ) ( not ( = ?auto_57285 ?auto_57287 ) ) ( not ( = ?auto_57286 ?auto_57287 ) ) ( ON ?auto_57285 ?auto_57286 ) ( ON-TABLE ?auto_57287 ) ( ON ?auto_57284 ?auto_57285 ) ( CLEAR ?auto_57284 ) ( HOLDING ?auto_57283 ) ( CLEAR ?auto_57282 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57282 ?auto_57283 )
      ( MAKE-5PILE ?auto_57282 ?auto_57283 ?auto_57284 ?auto_57285 ?auto_57286 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57288 - BLOCK
      ?auto_57289 - BLOCK
      ?auto_57290 - BLOCK
      ?auto_57291 - BLOCK
      ?auto_57292 - BLOCK
    )
    :vars
    (
      ?auto_57293 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57288 ) ( not ( = ?auto_57288 ?auto_57289 ) ) ( not ( = ?auto_57288 ?auto_57290 ) ) ( not ( = ?auto_57288 ?auto_57291 ) ) ( not ( = ?auto_57288 ?auto_57292 ) ) ( not ( = ?auto_57289 ?auto_57290 ) ) ( not ( = ?auto_57289 ?auto_57291 ) ) ( not ( = ?auto_57289 ?auto_57292 ) ) ( not ( = ?auto_57290 ?auto_57291 ) ) ( not ( = ?auto_57290 ?auto_57292 ) ) ( not ( = ?auto_57291 ?auto_57292 ) ) ( ON ?auto_57292 ?auto_57293 ) ( not ( = ?auto_57288 ?auto_57293 ) ) ( not ( = ?auto_57289 ?auto_57293 ) ) ( not ( = ?auto_57290 ?auto_57293 ) ) ( not ( = ?auto_57291 ?auto_57293 ) ) ( not ( = ?auto_57292 ?auto_57293 ) ) ( ON ?auto_57291 ?auto_57292 ) ( ON-TABLE ?auto_57293 ) ( ON ?auto_57290 ?auto_57291 ) ( CLEAR ?auto_57288 ) ( ON ?auto_57289 ?auto_57290 ) ( CLEAR ?auto_57289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57293 ?auto_57292 ?auto_57291 ?auto_57290 )
      ( MAKE-5PILE ?auto_57288 ?auto_57289 ?auto_57290 ?auto_57291 ?auto_57292 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57294 - BLOCK
      ?auto_57295 - BLOCK
      ?auto_57296 - BLOCK
      ?auto_57297 - BLOCK
      ?auto_57298 - BLOCK
    )
    :vars
    (
      ?auto_57299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57294 ?auto_57295 ) ) ( not ( = ?auto_57294 ?auto_57296 ) ) ( not ( = ?auto_57294 ?auto_57297 ) ) ( not ( = ?auto_57294 ?auto_57298 ) ) ( not ( = ?auto_57295 ?auto_57296 ) ) ( not ( = ?auto_57295 ?auto_57297 ) ) ( not ( = ?auto_57295 ?auto_57298 ) ) ( not ( = ?auto_57296 ?auto_57297 ) ) ( not ( = ?auto_57296 ?auto_57298 ) ) ( not ( = ?auto_57297 ?auto_57298 ) ) ( ON ?auto_57298 ?auto_57299 ) ( not ( = ?auto_57294 ?auto_57299 ) ) ( not ( = ?auto_57295 ?auto_57299 ) ) ( not ( = ?auto_57296 ?auto_57299 ) ) ( not ( = ?auto_57297 ?auto_57299 ) ) ( not ( = ?auto_57298 ?auto_57299 ) ) ( ON ?auto_57297 ?auto_57298 ) ( ON-TABLE ?auto_57299 ) ( ON ?auto_57296 ?auto_57297 ) ( ON ?auto_57295 ?auto_57296 ) ( CLEAR ?auto_57295 ) ( HOLDING ?auto_57294 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57294 )
      ( MAKE-5PILE ?auto_57294 ?auto_57295 ?auto_57296 ?auto_57297 ?auto_57298 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57300 - BLOCK
      ?auto_57301 - BLOCK
      ?auto_57302 - BLOCK
      ?auto_57303 - BLOCK
      ?auto_57304 - BLOCK
    )
    :vars
    (
      ?auto_57305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57300 ?auto_57301 ) ) ( not ( = ?auto_57300 ?auto_57302 ) ) ( not ( = ?auto_57300 ?auto_57303 ) ) ( not ( = ?auto_57300 ?auto_57304 ) ) ( not ( = ?auto_57301 ?auto_57302 ) ) ( not ( = ?auto_57301 ?auto_57303 ) ) ( not ( = ?auto_57301 ?auto_57304 ) ) ( not ( = ?auto_57302 ?auto_57303 ) ) ( not ( = ?auto_57302 ?auto_57304 ) ) ( not ( = ?auto_57303 ?auto_57304 ) ) ( ON ?auto_57304 ?auto_57305 ) ( not ( = ?auto_57300 ?auto_57305 ) ) ( not ( = ?auto_57301 ?auto_57305 ) ) ( not ( = ?auto_57302 ?auto_57305 ) ) ( not ( = ?auto_57303 ?auto_57305 ) ) ( not ( = ?auto_57304 ?auto_57305 ) ) ( ON ?auto_57303 ?auto_57304 ) ( ON-TABLE ?auto_57305 ) ( ON ?auto_57302 ?auto_57303 ) ( ON ?auto_57301 ?auto_57302 ) ( ON ?auto_57300 ?auto_57301 ) ( CLEAR ?auto_57300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57305 ?auto_57304 ?auto_57303 ?auto_57302 ?auto_57301 )
      ( MAKE-5PILE ?auto_57300 ?auto_57301 ?auto_57302 ?auto_57303 ?auto_57304 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57306 - BLOCK
      ?auto_57307 - BLOCK
      ?auto_57308 - BLOCK
      ?auto_57309 - BLOCK
      ?auto_57310 - BLOCK
    )
    :vars
    (
      ?auto_57311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57306 ?auto_57307 ) ) ( not ( = ?auto_57306 ?auto_57308 ) ) ( not ( = ?auto_57306 ?auto_57309 ) ) ( not ( = ?auto_57306 ?auto_57310 ) ) ( not ( = ?auto_57307 ?auto_57308 ) ) ( not ( = ?auto_57307 ?auto_57309 ) ) ( not ( = ?auto_57307 ?auto_57310 ) ) ( not ( = ?auto_57308 ?auto_57309 ) ) ( not ( = ?auto_57308 ?auto_57310 ) ) ( not ( = ?auto_57309 ?auto_57310 ) ) ( ON ?auto_57310 ?auto_57311 ) ( not ( = ?auto_57306 ?auto_57311 ) ) ( not ( = ?auto_57307 ?auto_57311 ) ) ( not ( = ?auto_57308 ?auto_57311 ) ) ( not ( = ?auto_57309 ?auto_57311 ) ) ( not ( = ?auto_57310 ?auto_57311 ) ) ( ON ?auto_57309 ?auto_57310 ) ( ON-TABLE ?auto_57311 ) ( ON ?auto_57308 ?auto_57309 ) ( ON ?auto_57307 ?auto_57308 ) ( HOLDING ?auto_57306 ) ( CLEAR ?auto_57307 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57311 ?auto_57310 ?auto_57309 ?auto_57308 ?auto_57307 ?auto_57306 )
      ( MAKE-5PILE ?auto_57306 ?auto_57307 ?auto_57308 ?auto_57309 ?auto_57310 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57312 - BLOCK
      ?auto_57313 - BLOCK
      ?auto_57314 - BLOCK
      ?auto_57315 - BLOCK
      ?auto_57316 - BLOCK
    )
    :vars
    (
      ?auto_57317 - BLOCK
      ?auto_57318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57312 ?auto_57313 ) ) ( not ( = ?auto_57312 ?auto_57314 ) ) ( not ( = ?auto_57312 ?auto_57315 ) ) ( not ( = ?auto_57312 ?auto_57316 ) ) ( not ( = ?auto_57313 ?auto_57314 ) ) ( not ( = ?auto_57313 ?auto_57315 ) ) ( not ( = ?auto_57313 ?auto_57316 ) ) ( not ( = ?auto_57314 ?auto_57315 ) ) ( not ( = ?auto_57314 ?auto_57316 ) ) ( not ( = ?auto_57315 ?auto_57316 ) ) ( ON ?auto_57316 ?auto_57317 ) ( not ( = ?auto_57312 ?auto_57317 ) ) ( not ( = ?auto_57313 ?auto_57317 ) ) ( not ( = ?auto_57314 ?auto_57317 ) ) ( not ( = ?auto_57315 ?auto_57317 ) ) ( not ( = ?auto_57316 ?auto_57317 ) ) ( ON ?auto_57315 ?auto_57316 ) ( ON-TABLE ?auto_57317 ) ( ON ?auto_57314 ?auto_57315 ) ( ON ?auto_57313 ?auto_57314 ) ( CLEAR ?auto_57313 ) ( ON ?auto_57312 ?auto_57318 ) ( CLEAR ?auto_57312 ) ( HAND-EMPTY ) ( not ( = ?auto_57312 ?auto_57318 ) ) ( not ( = ?auto_57313 ?auto_57318 ) ) ( not ( = ?auto_57314 ?auto_57318 ) ) ( not ( = ?auto_57315 ?auto_57318 ) ) ( not ( = ?auto_57316 ?auto_57318 ) ) ( not ( = ?auto_57317 ?auto_57318 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57312 ?auto_57318 )
      ( MAKE-5PILE ?auto_57312 ?auto_57313 ?auto_57314 ?auto_57315 ?auto_57316 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57319 - BLOCK
      ?auto_57320 - BLOCK
      ?auto_57321 - BLOCK
      ?auto_57322 - BLOCK
      ?auto_57323 - BLOCK
    )
    :vars
    (
      ?auto_57325 - BLOCK
      ?auto_57324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57319 ?auto_57320 ) ) ( not ( = ?auto_57319 ?auto_57321 ) ) ( not ( = ?auto_57319 ?auto_57322 ) ) ( not ( = ?auto_57319 ?auto_57323 ) ) ( not ( = ?auto_57320 ?auto_57321 ) ) ( not ( = ?auto_57320 ?auto_57322 ) ) ( not ( = ?auto_57320 ?auto_57323 ) ) ( not ( = ?auto_57321 ?auto_57322 ) ) ( not ( = ?auto_57321 ?auto_57323 ) ) ( not ( = ?auto_57322 ?auto_57323 ) ) ( ON ?auto_57323 ?auto_57325 ) ( not ( = ?auto_57319 ?auto_57325 ) ) ( not ( = ?auto_57320 ?auto_57325 ) ) ( not ( = ?auto_57321 ?auto_57325 ) ) ( not ( = ?auto_57322 ?auto_57325 ) ) ( not ( = ?auto_57323 ?auto_57325 ) ) ( ON ?auto_57322 ?auto_57323 ) ( ON-TABLE ?auto_57325 ) ( ON ?auto_57321 ?auto_57322 ) ( ON ?auto_57319 ?auto_57324 ) ( CLEAR ?auto_57319 ) ( not ( = ?auto_57319 ?auto_57324 ) ) ( not ( = ?auto_57320 ?auto_57324 ) ) ( not ( = ?auto_57321 ?auto_57324 ) ) ( not ( = ?auto_57322 ?auto_57324 ) ) ( not ( = ?auto_57323 ?auto_57324 ) ) ( not ( = ?auto_57325 ?auto_57324 ) ) ( HOLDING ?auto_57320 ) ( CLEAR ?auto_57321 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57325 ?auto_57323 ?auto_57322 ?auto_57321 ?auto_57320 )
      ( MAKE-5PILE ?auto_57319 ?auto_57320 ?auto_57321 ?auto_57322 ?auto_57323 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57326 - BLOCK
      ?auto_57327 - BLOCK
      ?auto_57328 - BLOCK
      ?auto_57329 - BLOCK
      ?auto_57330 - BLOCK
    )
    :vars
    (
      ?auto_57332 - BLOCK
      ?auto_57331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57326 ?auto_57327 ) ) ( not ( = ?auto_57326 ?auto_57328 ) ) ( not ( = ?auto_57326 ?auto_57329 ) ) ( not ( = ?auto_57326 ?auto_57330 ) ) ( not ( = ?auto_57327 ?auto_57328 ) ) ( not ( = ?auto_57327 ?auto_57329 ) ) ( not ( = ?auto_57327 ?auto_57330 ) ) ( not ( = ?auto_57328 ?auto_57329 ) ) ( not ( = ?auto_57328 ?auto_57330 ) ) ( not ( = ?auto_57329 ?auto_57330 ) ) ( ON ?auto_57330 ?auto_57332 ) ( not ( = ?auto_57326 ?auto_57332 ) ) ( not ( = ?auto_57327 ?auto_57332 ) ) ( not ( = ?auto_57328 ?auto_57332 ) ) ( not ( = ?auto_57329 ?auto_57332 ) ) ( not ( = ?auto_57330 ?auto_57332 ) ) ( ON ?auto_57329 ?auto_57330 ) ( ON-TABLE ?auto_57332 ) ( ON ?auto_57328 ?auto_57329 ) ( ON ?auto_57326 ?auto_57331 ) ( not ( = ?auto_57326 ?auto_57331 ) ) ( not ( = ?auto_57327 ?auto_57331 ) ) ( not ( = ?auto_57328 ?auto_57331 ) ) ( not ( = ?auto_57329 ?auto_57331 ) ) ( not ( = ?auto_57330 ?auto_57331 ) ) ( not ( = ?auto_57332 ?auto_57331 ) ) ( CLEAR ?auto_57328 ) ( ON ?auto_57327 ?auto_57326 ) ( CLEAR ?auto_57327 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57331 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57331 ?auto_57326 )
      ( MAKE-5PILE ?auto_57326 ?auto_57327 ?auto_57328 ?auto_57329 ?auto_57330 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57333 - BLOCK
      ?auto_57334 - BLOCK
      ?auto_57335 - BLOCK
      ?auto_57336 - BLOCK
      ?auto_57337 - BLOCK
    )
    :vars
    (
      ?auto_57339 - BLOCK
      ?auto_57338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57333 ?auto_57334 ) ) ( not ( = ?auto_57333 ?auto_57335 ) ) ( not ( = ?auto_57333 ?auto_57336 ) ) ( not ( = ?auto_57333 ?auto_57337 ) ) ( not ( = ?auto_57334 ?auto_57335 ) ) ( not ( = ?auto_57334 ?auto_57336 ) ) ( not ( = ?auto_57334 ?auto_57337 ) ) ( not ( = ?auto_57335 ?auto_57336 ) ) ( not ( = ?auto_57335 ?auto_57337 ) ) ( not ( = ?auto_57336 ?auto_57337 ) ) ( ON ?auto_57337 ?auto_57339 ) ( not ( = ?auto_57333 ?auto_57339 ) ) ( not ( = ?auto_57334 ?auto_57339 ) ) ( not ( = ?auto_57335 ?auto_57339 ) ) ( not ( = ?auto_57336 ?auto_57339 ) ) ( not ( = ?auto_57337 ?auto_57339 ) ) ( ON ?auto_57336 ?auto_57337 ) ( ON-TABLE ?auto_57339 ) ( ON ?auto_57333 ?auto_57338 ) ( not ( = ?auto_57333 ?auto_57338 ) ) ( not ( = ?auto_57334 ?auto_57338 ) ) ( not ( = ?auto_57335 ?auto_57338 ) ) ( not ( = ?auto_57336 ?auto_57338 ) ) ( not ( = ?auto_57337 ?auto_57338 ) ) ( not ( = ?auto_57339 ?auto_57338 ) ) ( ON ?auto_57334 ?auto_57333 ) ( CLEAR ?auto_57334 ) ( ON-TABLE ?auto_57338 ) ( HOLDING ?auto_57335 ) ( CLEAR ?auto_57336 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57339 ?auto_57337 ?auto_57336 ?auto_57335 )
      ( MAKE-5PILE ?auto_57333 ?auto_57334 ?auto_57335 ?auto_57336 ?auto_57337 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57340 - BLOCK
      ?auto_57341 - BLOCK
      ?auto_57342 - BLOCK
      ?auto_57343 - BLOCK
      ?auto_57344 - BLOCK
    )
    :vars
    (
      ?auto_57345 - BLOCK
      ?auto_57346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57340 ?auto_57341 ) ) ( not ( = ?auto_57340 ?auto_57342 ) ) ( not ( = ?auto_57340 ?auto_57343 ) ) ( not ( = ?auto_57340 ?auto_57344 ) ) ( not ( = ?auto_57341 ?auto_57342 ) ) ( not ( = ?auto_57341 ?auto_57343 ) ) ( not ( = ?auto_57341 ?auto_57344 ) ) ( not ( = ?auto_57342 ?auto_57343 ) ) ( not ( = ?auto_57342 ?auto_57344 ) ) ( not ( = ?auto_57343 ?auto_57344 ) ) ( ON ?auto_57344 ?auto_57345 ) ( not ( = ?auto_57340 ?auto_57345 ) ) ( not ( = ?auto_57341 ?auto_57345 ) ) ( not ( = ?auto_57342 ?auto_57345 ) ) ( not ( = ?auto_57343 ?auto_57345 ) ) ( not ( = ?auto_57344 ?auto_57345 ) ) ( ON ?auto_57343 ?auto_57344 ) ( ON-TABLE ?auto_57345 ) ( ON ?auto_57340 ?auto_57346 ) ( not ( = ?auto_57340 ?auto_57346 ) ) ( not ( = ?auto_57341 ?auto_57346 ) ) ( not ( = ?auto_57342 ?auto_57346 ) ) ( not ( = ?auto_57343 ?auto_57346 ) ) ( not ( = ?auto_57344 ?auto_57346 ) ) ( not ( = ?auto_57345 ?auto_57346 ) ) ( ON ?auto_57341 ?auto_57340 ) ( ON-TABLE ?auto_57346 ) ( CLEAR ?auto_57343 ) ( ON ?auto_57342 ?auto_57341 ) ( CLEAR ?auto_57342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57346 ?auto_57340 ?auto_57341 )
      ( MAKE-5PILE ?auto_57340 ?auto_57341 ?auto_57342 ?auto_57343 ?auto_57344 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57347 - BLOCK
      ?auto_57348 - BLOCK
      ?auto_57349 - BLOCK
      ?auto_57350 - BLOCK
      ?auto_57351 - BLOCK
    )
    :vars
    (
      ?auto_57353 - BLOCK
      ?auto_57352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57347 ?auto_57348 ) ) ( not ( = ?auto_57347 ?auto_57349 ) ) ( not ( = ?auto_57347 ?auto_57350 ) ) ( not ( = ?auto_57347 ?auto_57351 ) ) ( not ( = ?auto_57348 ?auto_57349 ) ) ( not ( = ?auto_57348 ?auto_57350 ) ) ( not ( = ?auto_57348 ?auto_57351 ) ) ( not ( = ?auto_57349 ?auto_57350 ) ) ( not ( = ?auto_57349 ?auto_57351 ) ) ( not ( = ?auto_57350 ?auto_57351 ) ) ( ON ?auto_57351 ?auto_57353 ) ( not ( = ?auto_57347 ?auto_57353 ) ) ( not ( = ?auto_57348 ?auto_57353 ) ) ( not ( = ?auto_57349 ?auto_57353 ) ) ( not ( = ?auto_57350 ?auto_57353 ) ) ( not ( = ?auto_57351 ?auto_57353 ) ) ( ON-TABLE ?auto_57353 ) ( ON ?auto_57347 ?auto_57352 ) ( not ( = ?auto_57347 ?auto_57352 ) ) ( not ( = ?auto_57348 ?auto_57352 ) ) ( not ( = ?auto_57349 ?auto_57352 ) ) ( not ( = ?auto_57350 ?auto_57352 ) ) ( not ( = ?auto_57351 ?auto_57352 ) ) ( not ( = ?auto_57353 ?auto_57352 ) ) ( ON ?auto_57348 ?auto_57347 ) ( ON-TABLE ?auto_57352 ) ( ON ?auto_57349 ?auto_57348 ) ( CLEAR ?auto_57349 ) ( HOLDING ?auto_57350 ) ( CLEAR ?auto_57351 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57353 ?auto_57351 ?auto_57350 )
      ( MAKE-5PILE ?auto_57347 ?auto_57348 ?auto_57349 ?auto_57350 ?auto_57351 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57354 - BLOCK
      ?auto_57355 - BLOCK
      ?auto_57356 - BLOCK
      ?auto_57357 - BLOCK
      ?auto_57358 - BLOCK
    )
    :vars
    (
      ?auto_57360 - BLOCK
      ?auto_57359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57354 ?auto_57355 ) ) ( not ( = ?auto_57354 ?auto_57356 ) ) ( not ( = ?auto_57354 ?auto_57357 ) ) ( not ( = ?auto_57354 ?auto_57358 ) ) ( not ( = ?auto_57355 ?auto_57356 ) ) ( not ( = ?auto_57355 ?auto_57357 ) ) ( not ( = ?auto_57355 ?auto_57358 ) ) ( not ( = ?auto_57356 ?auto_57357 ) ) ( not ( = ?auto_57356 ?auto_57358 ) ) ( not ( = ?auto_57357 ?auto_57358 ) ) ( ON ?auto_57358 ?auto_57360 ) ( not ( = ?auto_57354 ?auto_57360 ) ) ( not ( = ?auto_57355 ?auto_57360 ) ) ( not ( = ?auto_57356 ?auto_57360 ) ) ( not ( = ?auto_57357 ?auto_57360 ) ) ( not ( = ?auto_57358 ?auto_57360 ) ) ( ON-TABLE ?auto_57360 ) ( ON ?auto_57354 ?auto_57359 ) ( not ( = ?auto_57354 ?auto_57359 ) ) ( not ( = ?auto_57355 ?auto_57359 ) ) ( not ( = ?auto_57356 ?auto_57359 ) ) ( not ( = ?auto_57357 ?auto_57359 ) ) ( not ( = ?auto_57358 ?auto_57359 ) ) ( not ( = ?auto_57360 ?auto_57359 ) ) ( ON ?auto_57355 ?auto_57354 ) ( ON-TABLE ?auto_57359 ) ( ON ?auto_57356 ?auto_57355 ) ( CLEAR ?auto_57358 ) ( ON ?auto_57357 ?auto_57356 ) ( CLEAR ?auto_57357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57359 ?auto_57354 ?auto_57355 ?auto_57356 )
      ( MAKE-5PILE ?auto_57354 ?auto_57355 ?auto_57356 ?auto_57357 ?auto_57358 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57361 - BLOCK
      ?auto_57362 - BLOCK
      ?auto_57363 - BLOCK
      ?auto_57364 - BLOCK
      ?auto_57365 - BLOCK
    )
    :vars
    (
      ?auto_57366 - BLOCK
      ?auto_57367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57361 ?auto_57362 ) ) ( not ( = ?auto_57361 ?auto_57363 ) ) ( not ( = ?auto_57361 ?auto_57364 ) ) ( not ( = ?auto_57361 ?auto_57365 ) ) ( not ( = ?auto_57362 ?auto_57363 ) ) ( not ( = ?auto_57362 ?auto_57364 ) ) ( not ( = ?auto_57362 ?auto_57365 ) ) ( not ( = ?auto_57363 ?auto_57364 ) ) ( not ( = ?auto_57363 ?auto_57365 ) ) ( not ( = ?auto_57364 ?auto_57365 ) ) ( not ( = ?auto_57361 ?auto_57366 ) ) ( not ( = ?auto_57362 ?auto_57366 ) ) ( not ( = ?auto_57363 ?auto_57366 ) ) ( not ( = ?auto_57364 ?auto_57366 ) ) ( not ( = ?auto_57365 ?auto_57366 ) ) ( ON-TABLE ?auto_57366 ) ( ON ?auto_57361 ?auto_57367 ) ( not ( = ?auto_57361 ?auto_57367 ) ) ( not ( = ?auto_57362 ?auto_57367 ) ) ( not ( = ?auto_57363 ?auto_57367 ) ) ( not ( = ?auto_57364 ?auto_57367 ) ) ( not ( = ?auto_57365 ?auto_57367 ) ) ( not ( = ?auto_57366 ?auto_57367 ) ) ( ON ?auto_57362 ?auto_57361 ) ( ON-TABLE ?auto_57367 ) ( ON ?auto_57363 ?auto_57362 ) ( ON ?auto_57364 ?auto_57363 ) ( CLEAR ?auto_57364 ) ( HOLDING ?auto_57365 ) ( CLEAR ?auto_57366 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57366 ?auto_57365 )
      ( MAKE-5PILE ?auto_57361 ?auto_57362 ?auto_57363 ?auto_57364 ?auto_57365 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57368 - BLOCK
      ?auto_57369 - BLOCK
      ?auto_57370 - BLOCK
      ?auto_57371 - BLOCK
      ?auto_57372 - BLOCK
    )
    :vars
    (
      ?auto_57373 - BLOCK
      ?auto_57374 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57368 ?auto_57369 ) ) ( not ( = ?auto_57368 ?auto_57370 ) ) ( not ( = ?auto_57368 ?auto_57371 ) ) ( not ( = ?auto_57368 ?auto_57372 ) ) ( not ( = ?auto_57369 ?auto_57370 ) ) ( not ( = ?auto_57369 ?auto_57371 ) ) ( not ( = ?auto_57369 ?auto_57372 ) ) ( not ( = ?auto_57370 ?auto_57371 ) ) ( not ( = ?auto_57370 ?auto_57372 ) ) ( not ( = ?auto_57371 ?auto_57372 ) ) ( not ( = ?auto_57368 ?auto_57373 ) ) ( not ( = ?auto_57369 ?auto_57373 ) ) ( not ( = ?auto_57370 ?auto_57373 ) ) ( not ( = ?auto_57371 ?auto_57373 ) ) ( not ( = ?auto_57372 ?auto_57373 ) ) ( ON-TABLE ?auto_57373 ) ( ON ?auto_57368 ?auto_57374 ) ( not ( = ?auto_57368 ?auto_57374 ) ) ( not ( = ?auto_57369 ?auto_57374 ) ) ( not ( = ?auto_57370 ?auto_57374 ) ) ( not ( = ?auto_57371 ?auto_57374 ) ) ( not ( = ?auto_57372 ?auto_57374 ) ) ( not ( = ?auto_57373 ?auto_57374 ) ) ( ON ?auto_57369 ?auto_57368 ) ( ON-TABLE ?auto_57374 ) ( ON ?auto_57370 ?auto_57369 ) ( ON ?auto_57371 ?auto_57370 ) ( CLEAR ?auto_57373 ) ( ON ?auto_57372 ?auto_57371 ) ( CLEAR ?auto_57372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57374 ?auto_57368 ?auto_57369 ?auto_57370 ?auto_57371 )
      ( MAKE-5PILE ?auto_57368 ?auto_57369 ?auto_57370 ?auto_57371 ?auto_57372 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57375 - BLOCK
      ?auto_57376 - BLOCK
      ?auto_57377 - BLOCK
      ?auto_57378 - BLOCK
      ?auto_57379 - BLOCK
    )
    :vars
    (
      ?auto_57381 - BLOCK
      ?auto_57380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57375 ?auto_57376 ) ) ( not ( = ?auto_57375 ?auto_57377 ) ) ( not ( = ?auto_57375 ?auto_57378 ) ) ( not ( = ?auto_57375 ?auto_57379 ) ) ( not ( = ?auto_57376 ?auto_57377 ) ) ( not ( = ?auto_57376 ?auto_57378 ) ) ( not ( = ?auto_57376 ?auto_57379 ) ) ( not ( = ?auto_57377 ?auto_57378 ) ) ( not ( = ?auto_57377 ?auto_57379 ) ) ( not ( = ?auto_57378 ?auto_57379 ) ) ( not ( = ?auto_57375 ?auto_57381 ) ) ( not ( = ?auto_57376 ?auto_57381 ) ) ( not ( = ?auto_57377 ?auto_57381 ) ) ( not ( = ?auto_57378 ?auto_57381 ) ) ( not ( = ?auto_57379 ?auto_57381 ) ) ( ON ?auto_57375 ?auto_57380 ) ( not ( = ?auto_57375 ?auto_57380 ) ) ( not ( = ?auto_57376 ?auto_57380 ) ) ( not ( = ?auto_57377 ?auto_57380 ) ) ( not ( = ?auto_57378 ?auto_57380 ) ) ( not ( = ?auto_57379 ?auto_57380 ) ) ( not ( = ?auto_57381 ?auto_57380 ) ) ( ON ?auto_57376 ?auto_57375 ) ( ON-TABLE ?auto_57380 ) ( ON ?auto_57377 ?auto_57376 ) ( ON ?auto_57378 ?auto_57377 ) ( ON ?auto_57379 ?auto_57378 ) ( CLEAR ?auto_57379 ) ( HOLDING ?auto_57381 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57381 )
      ( MAKE-5PILE ?auto_57375 ?auto_57376 ?auto_57377 ?auto_57378 ?auto_57379 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57382 - BLOCK
      ?auto_57383 - BLOCK
      ?auto_57384 - BLOCK
      ?auto_57385 - BLOCK
      ?auto_57386 - BLOCK
    )
    :vars
    (
      ?auto_57387 - BLOCK
      ?auto_57388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57382 ?auto_57383 ) ) ( not ( = ?auto_57382 ?auto_57384 ) ) ( not ( = ?auto_57382 ?auto_57385 ) ) ( not ( = ?auto_57382 ?auto_57386 ) ) ( not ( = ?auto_57383 ?auto_57384 ) ) ( not ( = ?auto_57383 ?auto_57385 ) ) ( not ( = ?auto_57383 ?auto_57386 ) ) ( not ( = ?auto_57384 ?auto_57385 ) ) ( not ( = ?auto_57384 ?auto_57386 ) ) ( not ( = ?auto_57385 ?auto_57386 ) ) ( not ( = ?auto_57382 ?auto_57387 ) ) ( not ( = ?auto_57383 ?auto_57387 ) ) ( not ( = ?auto_57384 ?auto_57387 ) ) ( not ( = ?auto_57385 ?auto_57387 ) ) ( not ( = ?auto_57386 ?auto_57387 ) ) ( ON ?auto_57382 ?auto_57388 ) ( not ( = ?auto_57382 ?auto_57388 ) ) ( not ( = ?auto_57383 ?auto_57388 ) ) ( not ( = ?auto_57384 ?auto_57388 ) ) ( not ( = ?auto_57385 ?auto_57388 ) ) ( not ( = ?auto_57386 ?auto_57388 ) ) ( not ( = ?auto_57387 ?auto_57388 ) ) ( ON ?auto_57383 ?auto_57382 ) ( ON-TABLE ?auto_57388 ) ( ON ?auto_57384 ?auto_57383 ) ( ON ?auto_57385 ?auto_57384 ) ( ON ?auto_57386 ?auto_57385 ) ( ON ?auto_57387 ?auto_57386 ) ( CLEAR ?auto_57387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57388 ?auto_57382 ?auto_57383 ?auto_57384 ?auto_57385 ?auto_57386 )
      ( MAKE-5PILE ?auto_57382 ?auto_57383 ?auto_57384 ?auto_57385 ?auto_57386 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57395 - BLOCK
      ?auto_57396 - BLOCK
      ?auto_57397 - BLOCK
      ?auto_57398 - BLOCK
      ?auto_57399 - BLOCK
      ?auto_57400 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_57400 ) ( CLEAR ?auto_57399 ) ( ON-TABLE ?auto_57395 ) ( ON ?auto_57396 ?auto_57395 ) ( ON ?auto_57397 ?auto_57396 ) ( ON ?auto_57398 ?auto_57397 ) ( ON ?auto_57399 ?auto_57398 ) ( not ( = ?auto_57395 ?auto_57396 ) ) ( not ( = ?auto_57395 ?auto_57397 ) ) ( not ( = ?auto_57395 ?auto_57398 ) ) ( not ( = ?auto_57395 ?auto_57399 ) ) ( not ( = ?auto_57395 ?auto_57400 ) ) ( not ( = ?auto_57396 ?auto_57397 ) ) ( not ( = ?auto_57396 ?auto_57398 ) ) ( not ( = ?auto_57396 ?auto_57399 ) ) ( not ( = ?auto_57396 ?auto_57400 ) ) ( not ( = ?auto_57397 ?auto_57398 ) ) ( not ( = ?auto_57397 ?auto_57399 ) ) ( not ( = ?auto_57397 ?auto_57400 ) ) ( not ( = ?auto_57398 ?auto_57399 ) ) ( not ( = ?auto_57398 ?auto_57400 ) ) ( not ( = ?auto_57399 ?auto_57400 ) ) )
    :subtasks
    ( ( !STACK ?auto_57400 ?auto_57399 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57401 - BLOCK
      ?auto_57402 - BLOCK
      ?auto_57403 - BLOCK
      ?auto_57404 - BLOCK
      ?auto_57405 - BLOCK
      ?auto_57406 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57405 ) ( ON-TABLE ?auto_57401 ) ( ON ?auto_57402 ?auto_57401 ) ( ON ?auto_57403 ?auto_57402 ) ( ON ?auto_57404 ?auto_57403 ) ( ON ?auto_57405 ?auto_57404 ) ( not ( = ?auto_57401 ?auto_57402 ) ) ( not ( = ?auto_57401 ?auto_57403 ) ) ( not ( = ?auto_57401 ?auto_57404 ) ) ( not ( = ?auto_57401 ?auto_57405 ) ) ( not ( = ?auto_57401 ?auto_57406 ) ) ( not ( = ?auto_57402 ?auto_57403 ) ) ( not ( = ?auto_57402 ?auto_57404 ) ) ( not ( = ?auto_57402 ?auto_57405 ) ) ( not ( = ?auto_57402 ?auto_57406 ) ) ( not ( = ?auto_57403 ?auto_57404 ) ) ( not ( = ?auto_57403 ?auto_57405 ) ) ( not ( = ?auto_57403 ?auto_57406 ) ) ( not ( = ?auto_57404 ?auto_57405 ) ) ( not ( = ?auto_57404 ?auto_57406 ) ) ( not ( = ?auto_57405 ?auto_57406 ) ) ( ON-TABLE ?auto_57406 ) ( CLEAR ?auto_57406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_57406 )
      ( MAKE-6PILE ?auto_57401 ?auto_57402 ?auto_57403 ?auto_57404 ?auto_57405 ?auto_57406 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57407 - BLOCK
      ?auto_57408 - BLOCK
      ?auto_57409 - BLOCK
      ?auto_57410 - BLOCK
      ?auto_57411 - BLOCK
      ?auto_57412 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57407 ) ( ON ?auto_57408 ?auto_57407 ) ( ON ?auto_57409 ?auto_57408 ) ( ON ?auto_57410 ?auto_57409 ) ( not ( = ?auto_57407 ?auto_57408 ) ) ( not ( = ?auto_57407 ?auto_57409 ) ) ( not ( = ?auto_57407 ?auto_57410 ) ) ( not ( = ?auto_57407 ?auto_57411 ) ) ( not ( = ?auto_57407 ?auto_57412 ) ) ( not ( = ?auto_57408 ?auto_57409 ) ) ( not ( = ?auto_57408 ?auto_57410 ) ) ( not ( = ?auto_57408 ?auto_57411 ) ) ( not ( = ?auto_57408 ?auto_57412 ) ) ( not ( = ?auto_57409 ?auto_57410 ) ) ( not ( = ?auto_57409 ?auto_57411 ) ) ( not ( = ?auto_57409 ?auto_57412 ) ) ( not ( = ?auto_57410 ?auto_57411 ) ) ( not ( = ?auto_57410 ?auto_57412 ) ) ( not ( = ?auto_57411 ?auto_57412 ) ) ( ON-TABLE ?auto_57412 ) ( CLEAR ?auto_57412 ) ( HOLDING ?auto_57411 ) ( CLEAR ?auto_57410 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57407 ?auto_57408 ?auto_57409 ?auto_57410 ?auto_57411 )
      ( MAKE-6PILE ?auto_57407 ?auto_57408 ?auto_57409 ?auto_57410 ?auto_57411 ?auto_57412 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57413 - BLOCK
      ?auto_57414 - BLOCK
      ?auto_57415 - BLOCK
      ?auto_57416 - BLOCK
      ?auto_57417 - BLOCK
      ?auto_57418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57413 ) ( ON ?auto_57414 ?auto_57413 ) ( ON ?auto_57415 ?auto_57414 ) ( ON ?auto_57416 ?auto_57415 ) ( not ( = ?auto_57413 ?auto_57414 ) ) ( not ( = ?auto_57413 ?auto_57415 ) ) ( not ( = ?auto_57413 ?auto_57416 ) ) ( not ( = ?auto_57413 ?auto_57417 ) ) ( not ( = ?auto_57413 ?auto_57418 ) ) ( not ( = ?auto_57414 ?auto_57415 ) ) ( not ( = ?auto_57414 ?auto_57416 ) ) ( not ( = ?auto_57414 ?auto_57417 ) ) ( not ( = ?auto_57414 ?auto_57418 ) ) ( not ( = ?auto_57415 ?auto_57416 ) ) ( not ( = ?auto_57415 ?auto_57417 ) ) ( not ( = ?auto_57415 ?auto_57418 ) ) ( not ( = ?auto_57416 ?auto_57417 ) ) ( not ( = ?auto_57416 ?auto_57418 ) ) ( not ( = ?auto_57417 ?auto_57418 ) ) ( ON-TABLE ?auto_57418 ) ( CLEAR ?auto_57416 ) ( ON ?auto_57417 ?auto_57418 ) ( CLEAR ?auto_57417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57418 )
      ( MAKE-6PILE ?auto_57413 ?auto_57414 ?auto_57415 ?auto_57416 ?auto_57417 ?auto_57418 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57419 - BLOCK
      ?auto_57420 - BLOCK
      ?auto_57421 - BLOCK
      ?auto_57422 - BLOCK
      ?auto_57423 - BLOCK
      ?auto_57424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57419 ) ( ON ?auto_57420 ?auto_57419 ) ( ON ?auto_57421 ?auto_57420 ) ( not ( = ?auto_57419 ?auto_57420 ) ) ( not ( = ?auto_57419 ?auto_57421 ) ) ( not ( = ?auto_57419 ?auto_57422 ) ) ( not ( = ?auto_57419 ?auto_57423 ) ) ( not ( = ?auto_57419 ?auto_57424 ) ) ( not ( = ?auto_57420 ?auto_57421 ) ) ( not ( = ?auto_57420 ?auto_57422 ) ) ( not ( = ?auto_57420 ?auto_57423 ) ) ( not ( = ?auto_57420 ?auto_57424 ) ) ( not ( = ?auto_57421 ?auto_57422 ) ) ( not ( = ?auto_57421 ?auto_57423 ) ) ( not ( = ?auto_57421 ?auto_57424 ) ) ( not ( = ?auto_57422 ?auto_57423 ) ) ( not ( = ?auto_57422 ?auto_57424 ) ) ( not ( = ?auto_57423 ?auto_57424 ) ) ( ON-TABLE ?auto_57424 ) ( ON ?auto_57423 ?auto_57424 ) ( CLEAR ?auto_57423 ) ( HOLDING ?auto_57422 ) ( CLEAR ?auto_57421 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57419 ?auto_57420 ?auto_57421 ?auto_57422 )
      ( MAKE-6PILE ?auto_57419 ?auto_57420 ?auto_57421 ?auto_57422 ?auto_57423 ?auto_57424 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57425 - BLOCK
      ?auto_57426 - BLOCK
      ?auto_57427 - BLOCK
      ?auto_57428 - BLOCK
      ?auto_57429 - BLOCK
      ?auto_57430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57425 ) ( ON ?auto_57426 ?auto_57425 ) ( ON ?auto_57427 ?auto_57426 ) ( not ( = ?auto_57425 ?auto_57426 ) ) ( not ( = ?auto_57425 ?auto_57427 ) ) ( not ( = ?auto_57425 ?auto_57428 ) ) ( not ( = ?auto_57425 ?auto_57429 ) ) ( not ( = ?auto_57425 ?auto_57430 ) ) ( not ( = ?auto_57426 ?auto_57427 ) ) ( not ( = ?auto_57426 ?auto_57428 ) ) ( not ( = ?auto_57426 ?auto_57429 ) ) ( not ( = ?auto_57426 ?auto_57430 ) ) ( not ( = ?auto_57427 ?auto_57428 ) ) ( not ( = ?auto_57427 ?auto_57429 ) ) ( not ( = ?auto_57427 ?auto_57430 ) ) ( not ( = ?auto_57428 ?auto_57429 ) ) ( not ( = ?auto_57428 ?auto_57430 ) ) ( not ( = ?auto_57429 ?auto_57430 ) ) ( ON-TABLE ?auto_57430 ) ( ON ?auto_57429 ?auto_57430 ) ( CLEAR ?auto_57427 ) ( ON ?auto_57428 ?auto_57429 ) ( CLEAR ?auto_57428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57430 ?auto_57429 )
      ( MAKE-6PILE ?auto_57425 ?auto_57426 ?auto_57427 ?auto_57428 ?auto_57429 ?auto_57430 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57431 - BLOCK
      ?auto_57432 - BLOCK
      ?auto_57433 - BLOCK
      ?auto_57434 - BLOCK
      ?auto_57435 - BLOCK
      ?auto_57436 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57431 ) ( ON ?auto_57432 ?auto_57431 ) ( not ( = ?auto_57431 ?auto_57432 ) ) ( not ( = ?auto_57431 ?auto_57433 ) ) ( not ( = ?auto_57431 ?auto_57434 ) ) ( not ( = ?auto_57431 ?auto_57435 ) ) ( not ( = ?auto_57431 ?auto_57436 ) ) ( not ( = ?auto_57432 ?auto_57433 ) ) ( not ( = ?auto_57432 ?auto_57434 ) ) ( not ( = ?auto_57432 ?auto_57435 ) ) ( not ( = ?auto_57432 ?auto_57436 ) ) ( not ( = ?auto_57433 ?auto_57434 ) ) ( not ( = ?auto_57433 ?auto_57435 ) ) ( not ( = ?auto_57433 ?auto_57436 ) ) ( not ( = ?auto_57434 ?auto_57435 ) ) ( not ( = ?auto_57434 ?auto_57436 ) ) ( not ( = ?auto_57435 ?auto_57436 ) ) ( ON-TABLE ?auto_57436 ) ( ON ?auto_57435 ?auto_57436 ) ( ON ?auto_57434 ?auto_57435 ) ( CLEAR ?auto_57434 ) ( HOLDING ?auto_57433 ) ( CLEAR ?auto_57432 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57431 ?auto_57432 ?auto_57433 )
      ( MAKE-6PILE ?auto_57431 ?auto_57432 ?auto_57433 ?auto_57434 ?auto_57435 ?auto_57436 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57437 - BLOCK
      ?auto_57438 - BLOCK
      ?auto_57439 - BLOCK
      ?auto_57440 - BLOCK
      ?auto_57441 - BLOCK
      ?auto_57442 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57437 ) ( ON ?auto_57438 ?auto_57437 ) ( not ( = ?auto_57437 ?auto_57438 ) ) ( not ( = ?auto_57437 ?auto_57439 ) ) ( not ( = ?auto_57437 ?auto_57440 ) ) ( not ( = ?auto_57437 ?auto_57441 ) ) ( not ( = ?auto_57437 ?auto_57442 ) ) ( not ( = ?auto_57438 ?auto_57439 ) ) ( not ( = ?auto_57438 ?auto_57440 ) ) ( not ( = ?auto_57438 ?auto_57441 ) ) ( not ( = ?auto_57438 ?auto_57442 ) ) ( not ( = ?auto_57439 ?auto_57440 ) ) ( not ( = ?auto_57439 ?auto_57441 ) ) ( not ( = ?auto_57439 ?auto_57442 ) ) ( not ( = ?auto_57440 ?auto_57441 ) ) ( not ( = ?auto_57440 ?auto_57442 ) ) ( not ( = ?auto_57441 ?auto_57442 ) ) ( ON-TABLE ?auto_57442 ) ( ON ?auto_57441 ?auto_57442 ) ( ON ?auto_57440 ?auto_57441 ) ( CLEAR ?auto_57438 ) ( ON ?auto_57439 ?auto_57440 ) ( CLEAR ?auto_57439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57442 ?auto_57441 ?auto_57440 )
      ( MAKE-6PILE ?auto_57437 ?auto_57438 ?auto_57439 ?auto_57440 ?auto_57441 ?auto_57442 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57443 - BLOCK
      ?auto_57444 - BLOCK
      ?auto_57445 - BLOCK
      ?auto_57446 - BLOCK
      ?auto_57447 - BLOCK
      ?auto_57448 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57443 ) ( not ( = ?auto_57443 ?auto_57444 ) ) ( not ( = ?auto_57443 ?auto_57445 ) ) ( not ( = ?auto_57443 ?auto_57446 ) ) ( not ( = ?auto_57443 ?auto_57447 ) ) ( not ( = ?auto_57443 ?auto_57448 ) ) ( not ( = ?auto_57444 ?auto_57445 ) ) ( not ( = ?auto_57444 ?auto_57446 ) ) ( not ( = ?auto_57444 ?auto_57447 ) ) ( not ( = ?auto_57444 ?auto_57448 ) ) ( not ( = ?auto_57445 ?auto_57446 ) ) ( not ( = ?auto_57445 ?auto_57447 ) ) ( not ( = ?auto_57445 ?auto_57448 ) ) ( not ( = ?auto_57446 ?auto_57447 ) ) ( not ( = ?auto_57446 ?auto_57448 ) ) ( not ( = ?auto_57447 ?auto_57448 ) ) ( ON-TABLE ?auto_57448 ) ( ON ?auto_57447 ?auto_57448 ) ( ON ?auto_57446 ?auto_57447 ) ( ON ?auto_57445 ?auto_57446 ) ( CLEAR ?auto_57445 ) ( HOLDING ?auto_57444 ) ( CLEAR ?auto_57443 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57443 ?auto_57444 )
      ( MAKE-6PILE ?auto_57443 ?auto_57444 ?auto_57445 ?auto_57446 ?auto_57447 ?auto_57448 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57449 - BLOCK
      ?auto_57450 - BLOCK
      ?auto_57451 - BLOCK
      ?auto_57452 - BLOCK
      ?auto_57453 - BLOCK
      ?auto_57454 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57449 ) ( not ( = ?auto_57449 ?auto_57450 ) ) ( not ( = ?auto_57449 ?auto_57451 ) ) ( not ( = ?auto_57449 ?auto_57452 ) ) ( not ( = ?auto_57449 ?auto_57453 ) ) ( not ( = ?auto_57449 ?auto_57454 ) ) ( not ( = ?auto_57450 ?auto_57451 ) ) ( not ( = ?auto_57450 ?auto_57452 ) ) ( not ( = ?auto_57450 ?auto_57453 ) ) ( not ( = ?auto_57450 ?auto_57454 ) ) ( not ( = ?auto_57451 ?auto_57452 ) ) ( not ( = ?auto_57451 ?auto_57453 ) ) ( not ( = ?auto_57451 ?auto_57454 ) ) ( not ( = ?auto_57452 ?auto_57453 ) ) ( not ( = ?auto_57452 ?auto_57454 ) ) ( not ( = ?auto_57453 ?auto_57454 ) ) ( ON-TABLE ?auto_57454 ) ( ON ?auto_57453 ?auto_57454 ) ( ON ?auto_57452 ?auto_57453 ) ( ON ?auto_57451 ?auto_57452 ) ( CLEAR ?auto_57449 ) ( ON ?auto_57450 ?auto_57451 ) ( CLEAR ?auto_57450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57454 ?auto_57453 ?auto_57452 ?auto_57451 )
      ( MAKE-6PILE ?auto_57449 ?auto_57450 ?auto_57451 ?auto_57452 ?auto_57453 ?auto_57454 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57455 - BLOCK
      ?auto_57456 - BLOCK
      ?auto_57457 - BLOCK
      ?auto_57458 - BLOCK
      ?auto_57459 - BLOCK
      ?auto_57460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57455 ?auto_57456 ) ) ( not ( = ?auto_57455 ?auto_57457 ) ) ( not ( = ?auto_57455 ?auto_57458 ) ) ( not ( = ?auto_57455 ?auto_57459 ) ) ( not ( = ?auto_57455 ?auto_57460 ) ) ( not ( = ?auto_57456 ?auto_57457 ) ) ( not ( = ?auto_57456 ?auto_57458 ) ) ( not ( = ?auto_57456 ?auto_57459 ) ) ( not ( = ?auto_57456 ?auto_57460 ) ) ( not ( = ?auto_57457 ?auto_57458 ) ) ( not ( = ?auto_57457 ?auto_57459 ) ) ( not ( = ?auto_57457 ?auto_57460 ) ) ( not ( = ?auto_57458 ?auto_57459 ) ) ( not ( = ?auto_57458 ?auto_57460 ) ) ( not ( = ?auto_57459 ?auto_57460 ) ) ( ON-TABLE ?auto_57460 ) ( ON ?auto_57459 ?auto_57460 ) ( ON ?auto_57458 ?auto_57459 ) ( ON ?auto_57457 ?auto_57458 ) ( ON ?auto_57456 ?auto_57457 ) ( CLEAR ?auto_57456 ) ( HOLDING ?auto_57455 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57455 )
      ( MAKE-6PILE ?auto_57455 ?auto_57456 ?auto_57457 ?auto_57458 ?auto_57459 ?auto_57460 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57461 - BLOCK
      ?auto_57462 - BLOCK
      ?auto_57463 - BLOCK
      ?auto_57464 - BLOCK
      ?auto_57465 - BLOCK
      ?auto_57466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57461 ?auto_57462 ) ) ( not ( = ?auto_57461 ?auto_57463 ) ) ( not ( = ?auto_57461 ?auto_57464 ) ) ( not ( = ?auto_57461 ?auto_57465 ) ) ( not ( = ?auto_57461 ?auto_57466 ) ) ( not ( = ?auto_57462 ?auto_57463 ) ) ( not ( = ?auto_57462 ?auto_57464 ) ) ( not ( = ?auto_57462 ?auto_57465 ) ) ( not ( = ?auto_57462 ?auto_57466 ) ) ( not ( = ?auto_57463 ?auto_57464 ) ) ( not ( = ?auto_57463 ?auto_57465 ) ) ( not ( = ?auto_57463 ?auto_57466 ) ) ( not ( = ?auto_57464 ?auto_57465 ) ) ( not ( = ?auto_57464 ?auto_57466 ) ) ( not ( = ?auto_57465 ?auto_57466 ) ) ( ON-TABLE ?auto_57466 ) ( ON ?auto_57465 ?auto_57466 ) ( ON ?auto_57464 ?auto_57465 ) ( ON ?auto_57463 ?auto_57464 ) ( ON ?auto_57462 ?auto_57463 ) ( ON ?auto_57461 ?auto_57462 ) ( CLEAR ?auto_57461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57466 ?auto_57465 ?auto_57464 ?auto_57463 ?auto_57462 )
      ( MAKE-6PILE ?auto_57461 ?auto_57462 ?auto_57463 ?auto_57464 ?auto_57465 ?auto_57466 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57467 - BLOCK
      ?auto_57468 - BLOCK
      ?auto_57469 - BLOCK
      ?auto_57470 - BLOCK
      ?auto_57471 - BLOCK
      ?auto_57472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57467 ?auto_57468 ) ) ( not ( = ?auto_57467 ?auto_57469 ) ) ( not ( = ?auto_57467 ?auto_57470 ) ) ( not ( = ?auto_57467 ?auto_57471 ) ) ( not ( = ?auto_57467 ?auto_57472 ) ) ( not ( = ?auto_57468 ?auto_57469 ) ) ( not ( = ?auto_57468 ?auto_57470 ) ) ( not ( = ?auto_57468 ?auto_57471 ) ) ( not ( = ?auto_57468 ?auto_57472 ) ) ( not ( = ?auto_57469 ?auto_57470 ) ) ( not ( = ?auto_57469 ?auto_57471 ) ) ( not ( = ?auto_57469 ?auto_57472 ) ) ( not ( = ?auto_57470 ?auto_57471 ) ) ( not ( = ?auto_57470 ?auto_57472 ) ) ( not ( = ?auto_57471 ?auto_57472 ) ) ( ON-TABLE ?auto_57472 ) ( ON ?auto_57471 ?auto_57472 ) ( ON ?auto_57470 ?auto_57471 ) ( ON ?auto_57469 ?auto_57470 ) ( ON ?auto_57468 ?auto_57469 ) ( HOLDING ?auto_57467 ) ( CLEAR ?auto_57468 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57472 ?auto_57471 ?auto_57470 ?auto_57469 ?auto_57468 ?auto_57467 )
      ( MAKE-6PILE ?auto_57467 ?auto_57468 ?auto_57469 ?auto_57470 ?auto_57471 ?auto_57472 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57473 - BLOCK
      ?auto_57474 - BLOCK
      ?auto_57475 - BLOCK
      ?auto_57476 - BLOCK
      ?auto_57477 - BLOCK
      ?auto_57478 - BLOCK
    )
    :vars
    (
      ?auto_57479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57473 ?auto_57474 ) ) ( not ( = ?auto_57473 ?auto_57475 ) ) ( not ( = ?auto_57473 ?auto_57476 ) ) ( not ( = ?auto_57473 ?auto_57477 ) ) ( not ( = ?auto_57473 ?auto_57478 ) ) ( not ( = ?auto_57474 ?auto_57475 ) ) ( not ( = ?auto_57474 ?auto_57476 ) ) ( not ( = ?auto_57474 ?auto_57477 ) ) ( not ( = ?auto_57474 ?auto_57478 ) ) ( not ( = ?auto_57475 ?auto_57476 ) ) ( not ( = ?auto_57475 ?auto_57477 ) ) ( not ( = ?auto_57475 ?auto_57478 ) ) ( not ( = ?auto_57476 ?auto_57477 ) ) ( not ( = ?auto_57476 ?auto_57478 ) ) ( not ( = ?auto_57477 ?auto_57478 ) ) ( ON-TABLE ?auto_57478 ) ( ON ?auto_57477 ?auto_57478 ) ( ON ?auto_57476 ?auto_57477 ) ( ON ?auto_57475 ?auto_57476 ) ( ON ?auto_57474 ?auto_57475 ) ( CLEAR ?auto_57474 ) ( ON ?auto_57473 ?auto_57479 ) ( CLEAR ?auto_57473 ) ( HAND-EMPTY ) ( not ( = ?auto_57473 ?auto_57479 ) ) ( not ( = ?auto_57474 ?auto_57479 ) ) ( not ( = ?auto_57475 ?auto_57479 ) ) ( not ( = ?auto_57476 ?auto_57479 ) ) ( not ( = ?auto_57477 ?auto_57479 ) ) ( not ( = ?auto_57478 ?auto_57479 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57473 ?auto_57479 )
      ( MAKE-6PILE ?auto_57473 ?auto_57474 ?auto_57475 ?auto_57476 ?auto_57477 ?auto_57478 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57480 - BLOCK
      ?auto_57481 - BLOCK
      ?auto_57482 - BLOCK
      ?auto_57483 - BLOCK
      ?auto_57484 - BLOCK
      ?auto_57485 - BLOCK
    )
    :vars
    (
      ?auto_57486 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57480 ?auto_57481 ) ) ( not ( = ?auto_57480 ?auto_57482 ) ) ( not ( = ?auto_57480 ?auto_57483 ) ) ( not ( = ?auto_57480 ?auto_57484 ) ) ( not ( = ?auto_57480 ?auto_57485 ) ) ( not ( = ?auto_57481 ?auto_57482 ) ) ( not ( = ?auto_57481 ?auto_57483 ) ) ( not ( = ?auto_57481 ?auto_57484 ) ) ( not ( = ?auto_57481 ?auto_57485 ) ) ( not ( = ?auto_57482 ?auto_57483 ) ) ( not ( = ?auto_57482 ?auto_57484 ) ) ( not ( = ?auto_57482 ?auto_57485 ) ) ( not ( = ?auto_57483 ?auto_57484 ) ) ( not ( = ?auto_57483 ?auto_57485 ) ) ( not ( = ?auto_57484 ?auto_57485 ) ) ( ON-TABLE ?auto_57485 ) ( ON ?auto_57484 ?auto_57485 ) ( ON ?auto_57483 ?auto_57484 ) ( ON ?auto_57482 ?auto_57483 ) ( ON ?auto_57480 ?auto_57486 ) ( CLEAR ?auto_57480 ) ( not ( = ?auto_57480 ?auto_57486 ) ) ( not ( = ?auto_57481 ?auto_57486 ) ) ( not ( = ?auto_57482 ?auto_57486 ) ) ( not ( = ?auto_57483 ?auto_57486 ) ) ( not ( = ?auto_57484 ?auto_57486 ) ) ( not ( = ?auto_57485 ?auto_57486 ) ) ( HOLDING ?auto_57481 ) ( CLEAR ?auto_57482 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57485 ?auto_57484 ?auto_57483 ?auto_57482 ?auto_57481 )
      ( MAKE-6PILE ?auto_57480 ?auto_57481 ?auto_57482 ?auto_57483 ?auto_57484 ?auto_57485 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57487 - BLOCK
      ?auto_57488 - BLOCK
      ?auto_57489 - BLOCK
      ?auto_57490 - BLOCK
      ?auto_57491 - BLOCK
      ?auto_57492 - BLOCK
    )
    :vars
    (
      ?auto_57493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57487 ?auto_57488 ) ) ( not ( = ?auto_57487 ?auto_57489 ) ) ( not ( = ?auto_57487 ?auto_57490 ) ) ( not ( = ?auto_57487 ?auto_57491 ) ) ( not ( = ?auto_57487 ?auto_57492 ) ) ( not ( = ?auto_57488 ?auto_57489 ) ) ( not ( = ?auto_57488 ?auto_57490 ) ) ( not ( = ?auto_57488 ?auto_57491 ) ) ( not ( = ?auto_57488 ?auto_57492 ) ) ( not ( = ?auto_57489 ?auto_57490 ) ) ( not ( = ?auto_57489 ?auto_57491 ) ) ( not ( = ?auto_57489 ?auto_57492 ) ) ( not ( = ?auto_57490 ?auto_57491 ) ) ( not ( = ?auto_57490 ?auto_57492 ) ) ( not ( = ?auto_57491 ?auto_57492 ) ) ( ON-TABLE ?auto_57492 ) ( ON ?auto_57491 ?auto_57492 ) ( ON ?auto_57490 ?auto_57491 ) ( ON ?auto_57489 ?auto_57490 ) ( ON ?auto_57487 ?auto_57493 ) ( not ( = ?auto_57487 ?auto_57493 ) ) ( not ( = ?auto_57488 ?auto_57493 ) ) ( not ( = ?auto_57489 ?auto_57493 ) ) ( not ( = ?auto_57490 ?auto_57493 ) ) ( not ( = ?auto_57491 ?auto_57493 ) ) ( not ( = ?auto_57492 ?auto_57493 ) ) ( CLEAR ?auto_57489 ) ( ON ?auto_57488 ?auto_57487 ) ( CLEAR ?auto_57488 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57493 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57493 ?auto_57487 )
      ( MAKE-6PILE ?auto_57487 ?auto_57488 ?auto_57489 ?auto_57490 ?auto_57491 ?auto_57492 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57494 - BLOCK
      ?auto_57495 - BLOCK
      ?auto_57496 - BLOCK
      ?auto_57497 - BLOCK
      ?auto_57498 - BLOCK
      ?auto_57499 - BLOCK
    )
    :vars
    (
      ?auto_57500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57494 ?auto_57495 ) ) ( not ( = ?auto_57494 ?auto_57496 ) ) ( not ( = ?auto_57494 ?auto_57497 ) ) ( not ( = ?auto_57494 ?auto_57498 ) ) ( not ( = ?auto_57494 ?auto_57499 ) ) ( not ( = ?auto_57495 ?auto_57496 ) ) ( not ( = ?auto_57495 ?auto_57497 ) ) ( not ( = ?auto_57495 ?auto_57498 ) ) ( not ( = ?auto_57495 ?auto_57499 ) ) ( not ( = ?auto_57496 ?auto_57497 ) ) ( not ( = ?auto_57496 ?auto_57498 ) ) ( not ( = ?auto_57496 ?auto_57499 ) ) ( not ( = ?auto_57497 ?auto_57498 ) ) ( not ( = ?auto_57497 ?auto_57499 ) ) ( not ( = ?auto_57498 ?auto_57499 ) ) ( ON-TABLE ?auto_57499 ) ( ON ?auto_57498 ?auto_57499 ) ( ON ?auto_57497 ?auto_57498 ) ( ON ?auto_57494 ?auto_57500 ) ( not ( = ?auto_57494 ?auto_57500 ) ) ( not ( = ?auto_57495 ?auto_57500 ) ) ( not ( = ?auto_57496 ?auto_57500 ) ) ( not ( = ?auto_57497 ?auto_57500 ) ) ( not ( = ?auto_57498 ?auto_57500 ) ) ( not ( = ?auto_57499 ?auto_57500 ) ) ( ON ?auto_57495 ?auto_57494 ) ( CLEAR ?auto_57495 ) ( ON-TABLE ?auto_57500 ) ( HOLDING ?auto_57496 ) ( CLEAR ?auto_57497 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57499 ?auto_57498 ?auto_57497 ?auto_57496 )
      ( MAKE-6PILE ?auto_57494 ?auto_57495 ?auto_57496 ?auto_57497 ?auto_57498 ?auto_57499 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57501 - BLOCK
      ?auto_57502 - BLOCK
      ?auto_57503 - BLOCK
      ?auto_57504 - BLOCK
      ?auto_57505 - BLOCK
      ?auto_57506 - BLOCK
    )
    :vars
    (
      ?auto_57507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57501 ?auto_57502 ) ) ( not ( = ?auto_57501 ?auto_57503 ) ) ( not ( = ?auto_57501 ?auto_57504 ) ) ( not ( = ?auto_57501 ?auto_57505 ) ) ( not ( = ?auto_57501 ?auto_57506 ) ) ( not ( = ?auto_57502 ?auto_57503 ) ) ( not ( = ?auto_57502 ?auto_57504 ) ) ( not ( = ?auto_57502 ?auto_57505 ) ) ( not ( = ?auto_57502 ?auto_57506 ) ) ( not ( = ?auto_57503 ?auto_57504 ) ) ( not ( = ?auto_57503 ?auto_57505 ) ) ( not ( = ?auto_57503 ?auto_57506 ) ) ( not ( = ?auto_57504 ?auto_57505 ) ) ( not ( = ?auto_57504 ?auto_57506 ) ) ( not ( = ?auto_57505 ?auto_57506 ) ) ( ON-TABLE ?auto_57506 ) ( ON ?auto_57505 ?auto_57506 ) ( ON ?auto_57504 ?auto_57505 ) ( ON ?auto_57501 ?auto_57507 ) ( not ( = ?auto_57501 ?auto_57507 ) ) ( not ( = ?auto_57502 ?auto_57507 ) ) ( not ( = ?auto_57503 ?auto_57507 ) ) ( not ( = ?auto_57504 ?auto_57507 ) ) ( not ( = ?auto_57505 ?auto_57507 ) ) ( not ( = ?auto_57506 ?auto_57507 ) ) ( ON ?auto_57502 ?auto_57501 ) ( ON-TABLE ?auto_57507 ) ( CLEAR ?auto_57504 ) ( ON ?auto_57503 ?auto_57502 ) ( CLEAR ?auto_57503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57507 ?auto_57501 ?auto_57502 )
      ( MAKE-6PILE ?auto_57501 ?auto_57502 ?auto_57503 ?auto_57504 ?auto_57505 ?auto_57506 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57508 - BLOCK
      ?auto_57509 - BLOCK
      ?auto_57510 - BLOCK
      ?auto_57511 - BLOCK
      ?auto_57512 - BLOCK
      ?auto_57513 - BLOCK
    )
    :vars
    (
      ?auto_57514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57508 ?auto_57509 ) ) ( not ( = ?auto_57508 ?auto_57510 ) ) ( not ( = ?auto_57508 ?auto_57511 ) ) ( not ( = ?auto_57508 ?auto_57512 ) ) ( not ( = ?auto_57508 ?auto_57513 ) ) ( not ( = ?auto_57509 ?auto_57510 ) ) ( not ( = ?auto_57509 ?auto_57511 ) ) ( not ( = ?auto_57509 ?auto_57512 ) ) ( not ( = ?auto_57509 ?auto_57513 ) ) ( not ( = ?auto_57510 ?auto_57511 ) ) ( not ( = ?auto_57510 ?auto_57512 ) ) ( not ( = ?auto_57510 ?auto_57513 ) ) ( not ( = ?auto_57511 ?auto_57512 ) ) ( not ( = ?auto_57511 ?auto_57513 ) ) ( not ( = ?auto_57512 ?auto_57513 ) ) ( ON-TABLE ?auto_57513 ) ( ON ?auto_57512 ?auto_57513 ) ( ON ?auto_57508 ?auto_57514 ) ( not ( = ?auto_57508 ?auto_57514 ) ) ( not ( = ?auto_57509 ?auto_57514 ) ) ( not ( = ?auto_57510 ?auto_57514 ) ) ( not ( = ?auto_57511 ?auto_57514 ) ) ( not ( = ?auto_57512 ?auto_57514 ) ) ( not ( = ?auto_57513 ?auto_57514 ) ) ( ON ?auto_57509 ?auto_57508 ) ( ON-TABLE ?auto_57514 ) ( ON ?auto_57510 ?auto_57509 ) ( CLEAR ?auto_57510 ) ( HOLDING ?auto_57511 ) ( CLEAR ?auto_57512 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57513 ?auto_57512 ?auto_57511 )
      ( MAKE-6PILE ?auto_57508 ?auto_57509 ?auto_57510 ?auto_57511 ?auto_57512 ?auto_57513 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57515 - BLOCK
      ?auto_57516 - BLOCK
      ?auto_57517 - BLOCK
      ?auto_57518 - BLOCK
      ?auto_57519 - BLOCK
      ?auto_57520 - BLOCK
    )
    :vars
    (
      ?auto_57521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57515 ?auto_57516 ) ) ( not ( = ?auto_57515 ?auto_57517 ) ) ( not ( = ?auto_57515 ?auto_57518 ) ) ( not ( = ?auto_57515 ?auto_57519 ) ) ( not ( = ?auto_57515 ?auto_57520 ) ) ( not ( = ?auto_57516 ?auto_57517 ) ) ( not ( = ?auto_57516 ?auto_57518 ) ) ( not ( = ?auto_57516 ?auto_57519 ) ) ( not ( = ?auto_57516 ?auto_57520 ) ) ( not ( = ?auto_57517 ?auto_57518 ) ) ( not ( = ?auto_57517 ?auto_57519 ) ) ( not ( = ?auto_57517 ?auto_57520 ) ) ( not ( = ?auto_57518 ?auto_57519 ) ) ( not ( = ?auto_57518 ?auto_57520 ) ) ( not ( = ?auto_57519 ?auto_57520 ) ) ( ON-TABLE ?auto_57520 ) ( ON ?auto_57519 ?auto_57520 ) ( ON ?auto_57515 ?auto_57521 ) ( not ( = ?auto_57515 ?auto_57521 ) ) ( not ( = ?auto_57516 ?auto_57521 ) ) ( not ( = ?auto_57517 ?auto_57521 ) ) ( not ( = ?auto_57518 ?auto_57521 ) ) ( not ( = ?auto_57519 ?auto_57521 ) ) ( not ( = ?auto_57520 ?auto_57521 ) ) ( ON ?auto_57516 ?auto_57515 ) ( ON-TABLE ?auto_57521 ) ( ON ?auto_57517 ?auto_57516 ) ( CLEAR ?auto_57519 ) ( ON ?auto_57518 ?auto_57517 ) ( CLEAR ?auto_57518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57521 ?auto_57515 ?auto_57516 ?auto_57517 )
      ( MAKE-6PILE ?auto_57515 ?auto_57516 ?auto_57517 ?auto_57518 ?auto_57519 ?auto_57520 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57522 - BLOCK
      ?auto_57523 - BLOCK
      ?auto_57524 - BLOCK
      ?auto_57525 - BLOCK
      ?auto_57526 - BLOCK
      ?auto_57527 - BLOCK
    )
    :vars
    (
      ?auto_57528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57522 ?auto_57523 ) ) ( not ( = ?auto_57522 ?auto_57524 ) ) ( not ( = ?auto_57522 ?auto_57525 ) ) ( not ( = ?auto_57522 ?auto_57526 ) ) ( not ( = ?auto_57522 ?auto_57527 ) ) ( not ( = ?auto_57523 ?auto_57524 ) ) ( not ( = ?auto_57523 ?auto_57525 ) ) ( not ( = ?auto_57523 ?auto_57526 ) ) ( not ( = ?auto_57523 ?auto_57527 ) ) ( not ( = ?auto_57524 ?auto_57525 ) ) ( not ( = ?auto_57524 ?auto_57526 ) ) ( not ( = ?auto_57524 ?auto_57527 ) ) ( not ( = ?auto_57525 ?auto_57526 ) ) ( not ( = ?auto_57525 ?auto_57527 ) ) ( not ( = ?auto_57526 ?auto_57527 ) ) ( ON-TABLE ?auto_57527 ) ( ON ?auto_57522 ?auto_57528 ) ( not ( = ?auto_57522 ?auto_57528 ) ) ( not ( = ?auto_57523 ?auto_57528 ) ) ( not ( = ?auto_57524 ?auto_57528 ) ) ( not ( = ?auto_57525 ?auto_57528 ) ) ( not ( = ?auto_57526 ?auto_57528 ) ) ( not ( = ?auto_57527 ?auto_57528 ) ) ( ON ?auto_57523 ?auto_57522 ) ( ON-TABLE ?auto_57528 ) ( ON ?auto_57524 ?auto_57523 ) ( ON ?auto_57525 ?auto_57524 ) ( CLEAR ?auto_57525 ) ( HOLDING ?auto_57526 ) ( CLEAR ?auto_57527 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57527 ?auto_57526 )
      ( MAKE-6PILE ?auto_57522 ?auto_57523 ?auto_57524 ?auto_57525 ?auto_57526 ?auto_57527 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57529 - BLOCK
      ?auto_57530 - BLOCK
      ?auto_57531 - BLOCK
      ?auto_57532 - BLOCK
      ?auto_57533 - BLOCK
      ?auto_57534 - BLOCK
    )
    :vars
    (
      ?auto_57535 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57529 ?auto_57530 ) ) ( not ( = ?auto_57529 ?auto_57531 ) ) ( not ( = ?auto_57529 ?auto_57532 ) ) ( not ( = ?auto_57529 ?auto_57533 ) ) ( not ( = ?auto_57529 ?auto_57534 ) ) ( not ( = ?auto_57530 ?auto_57531 ) ) ( not ( = ?auto_57530 ?auto_57532 ) ) ( not ( = ?auto_57530 ?auto_57533 ) ) ( not ( = ?auto_57530 ?auto_57534 ) ) ( not ( = ?auto_57531 ?auto_57532 ) ) ( not ( = ?auto_57531 ?auto_57533 ) ) ( not ( = ?auto_57531 ?auto_57534 ) ) ( not ( = ?auto_57532 ?auto_57533 ) ) ( not ( = ?auto_57532 ?auto_57534 ) ) ( not ( = ?auto_57533 ?auto_57534 ) ) ( ON-TABLE ?auto_57534 ) ( ON ?auto_57529 ?auto_57535 ) ( not ( = ?auto_57529 ?auto_57535 ) ) ( not ( = ?auto_57530 ?auto_57535 ) ) ( not ( = ?auto_57531 ?auto_57535 ) ) ( not ( = ?auto_57532 ?auto_57535 ) ) ( not ( = ?auto_57533 ?auto_57535 ) ) ( not ( = ?auto_57534 ?auto_57535 ) ) ( ON ?auto_57530 ?auto_57529 ) ( ON-TABLE ?auto_57535 ) ( ON ?auto_57531 ?auto_57530 ) ( ON ?auto_57532 ?auto_57531 ) ( CLEAR ?auto_57534 ) ( ON ?auto_57533 ?auto_57532 ) ( CLEAR ?auto_57533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57535 ?auto_57529 ?auto_57530 ?auto_57531 ?auto_57532 )
      ( MAKE-6PILE ?auto_57529 ?auto_57530 ?auto_57531 ?auto_57532 ?auto_57533 ?auto_57534 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57536 - BLOCK
      ?auto_57537 - BLOCK
      ?auto_57538 - BLOCK
      ?auto_57539 - BLOCK
      ?auto_57540 - BLOCK
      ?auto_57541 - BLOCK
    )
    :vars
    (
      ?auto_57542 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57536 ?auto_57537 ) ) ( not ( = ?auto_57536 ?auto_57538 ) ) ( not ( = ?auto_57536 ?auto_57539 ) ) ( not ( = ?auto_57536 ?auto_57540 ) ) ( not ( = ?auto_57536 ?auto_57541 ) ) ( not ( = ?auto_57537 ?auto_57538 ) ) ( not ( = ?auto_57537 ?auto_57539 ) ) ( not ( = ?auto_57537 ?auto_57540 ) ) ( not ( = ?auto_57537 ?auto_57541 ) ) ( not ( = ?auto_57538 ?auto_57539 ) ) ( not ( = ?auto_57538 ?auto_57540 ) ) ( not ( = ?auto_57538 ?auto_57541 ) ) ( not ( = ?auto_57539 ?auto_57540 ) ) ( not ( = ?auto_57539 ?auto_57541 ) ) ( not ( = ?auto_57540 ?auto_57541 ) ) ( ON ?auto_57536 ?auto_57542 ) ( not ( = ?auto_57536 ?auto_57542 ) ) ( not ( = ?auto_57537 ?auto_57542 ) ) ( not ( = ?auto_57538 ?auto_57542 ) ) ( not ( = ?auto_57539 ?auto_57542 ) ) ( not ( = ?auto_57540 ?auto_57542 ) ) ( not ( = ?auto_57541 ?auto_57542 ) ) ( ON ?auto_57537 ?auto_57536 ) ( ON-TABLE ?auto_57542 ) ( ON ?auto_57538 ?auto_57537 ) ( ON ?auto_57539 ?auto_57538 ) ( ON ?auto_57540 ?auto_57539 ) ( CLEAR ?auto_57540 ) ( HOLDING ?auto_57541 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57541 )
      ( MAKE-6PILE ?auto_57536 ?auto_57537 ?auto_57538 ?auto_57539 ?auto_57540 ?auto_57541 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57543 - BLOCK
      ?auto_57544 - BLOCK
      ?auto_57545 - BLOCK
      ?auto_57546 - BLOCK
      ?auto_57547 - BLOCK
      ?auto_57548 - BLOCK
    )
    :vars
    (
      ?auto_57549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57543 ?auto_57544 ) ) ( not ( = ?auto_57543 ?auto_57545 ) ) ( not ( = ?auto_57543 ?auto_57546 ) ) ( not ( = ?auto_57543 ?auto_57547 ) ) ( not ( = ?auto_57543 ?auto_57548 ) ) ( not ( = ?auto_57544 ?auto_57545 ) ) ( not ( = ?auto_57544 ?auto_57546 ) ) ( not ( = ?auto_57544 ?auto_57547 ) ) ( not ( = ?auto_57544 ?auto_57548 ) ) ( not ( = ?auto_57545 ?auto_57546 ) ) ( not ( = ?auto_57545 ?auto_57547 ) ) ( not ( = ?auto_57545 ?auto_57548 ) ) ( not ( = ?auto_57546 ?auto_57547 ) ) ( not ( = ?auto_57546 ?auto_57548 ) ) ( not ( = ?auto_57547 ?auto_57548 ) ) ( ON ?auto_57543 ?auto_57549 ) ( not ( = ?auto_57543 ?auto_57549 ) ) ( not ( = ?auto_57544 ?auto_57549 ) ) ( not ( = ?auto_57545 ?auto_57549 ) ) ( not ( = ?auto_57546 ?auto_57549 ) ) ( not ( = ?auto_57547 ?auto_57549 ) ) ( not ( = ?auto_57548 ?auto_57549 ) ) ( ON ?auto_57544 ?auto_57543 ) ( ON-TABLE ?auto_57549 ) ( ON ?auto_57545 ?auto_57544 ) ( ON ?auto_57546 ?auto_57545 ) ( ON ?auto_57547 ?auto_57546 ) ( ON ?auto_57548 ?auto_57547 ) ( CLEAR ?auto_57548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57549 ?auto_57543 ?auto_57544 ?auto_57545 ?auto_57546 ?auto_57547 )
      ( MAKE-6PILE ?auto_57543 ?auto_57544 ?auto_57545 ?auto_57546 ?auto_57547 ?auto_57548 ) )
  )

)

