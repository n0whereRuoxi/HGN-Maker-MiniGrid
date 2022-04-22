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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106799 - BLOCK
      ?auto_106800 - BLOCK
      ?auto_106801 - BLOCK
      ?auto_106802 - BLOCK
      ?auto_106803 - BLOCK
      ?auto_106804 - BLOCK
      ?auto_106805 - BLOCK
    )
    :vars
    (
      ?auto_106806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106806 ?auto_106805 ) ( CLEAR ?auto_106806 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106799 ) ( ON ?auto_106800 ?auto_106799 ) ( ON ?auto_106801 ?auto_106800 ) ( ON ?auto_106802 ?auto_106801 ) ( ON ?auto_106803 ?auto_106802 ) ( ON ?auto_106804 ?auto_106803 ) ( ON ?auto_106805 ?auto_106804 ) ( not ( = ?auto_106799 ?auto_106800 ) ) ( not ( = ?auto_106799 ?auto_106801 ) ) ( not ( = ?auto_106799 ?auto_106802 ) ) ( not ( = ?auto_106799 ?auto_106803 ) ) ( not ( = ?auto_106799 ?auto_106804 ) ) ( not ( = ?auto_106799 ?auto_106805 ) ) ( not ( = ?auto_106799 ?auto_106806 ) ) ( not ( = ?auto_106800 ?auto_106801 ) ) ( not ( = ?auto_106800 ?auto_106802 ) ) ( not ( = ?auto_106800 ?auto_106803 ) ) ( not ( = ?auto_106800 ?auto_106804 ) ) ( not ( = ?auto_106800 ?auto_106805 ) ) ( not ( = ?auto_106800 ?auto_106806 ) ) ( not ( = ?auto_106801 ?auto_106802 ) ) ( not ( = ?auto_106801 ?auto_106803 ) ) ( not ( = ?auto_106801 ?auto_106804 ) ) ( not ( = ?auto_106801 ?auto_106805 ) ) ( not ( = ?auto_106801 ?auto_106806 ) ) ( not ( = ?auto_106802 ?auto_106803 ) ) ( not ( = ?auto_106802 ?auto_106804 ) ) ( not ( = ?auto_106802 ?auto_106805 ) ) ( not ( = ?auto_106802 ?auto_106806 ) ) ( not ( = ?auto_106803 ?auto_106804 ) ) ( not ( = ?auto_106803 ?auto_106805 ) ) ( not ( = ?auto_106803 ?auto_106806 ) ) ( not ( = ?auto_106804 ?auto_106805 ) ) ( not ( = ?auto_106804 ?auto_106806 ) ) ( not ( = ?auto_106805 ?auto_106806 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106806 ?auto_106805 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106808 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_106808 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_106808 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106809 - BLOCK
    )
    :vars
    (
      ?auto_106810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106809 ?auto_106810 ) ( CLEAR ?auto_106809 ) ( HAND-EMPTY ) ( not ( = ?auto_106809 ?auto_106810 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106809 ?auto_106810 )
      ( MAKE-1PILE ?auto_106809 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106817 - BLOCK
      ?auto_106818 - BLOCK
      ?auto_106819 - BLOCK
      ?auto_106820 - BLOCK
      ?auto_106821 - BLOCK
      ?auto_106822 - BLOCK
    )
    :vars
    (
      ?auto_106823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106823 ?auto_106822 ) ( CLEAR ?auto_106823 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106817 ) ( ON ?auto_106818 ?auto_106817 ) ( ON ?auto_106819 ?auto_106818 ) ( ON ?auto_106820 ?auto_106819 ) ( ON ?auto_106821 ?auto_106820 ) ( ON ?auto_106822 ?auto_106821 ) ( not ( = ?auto_106817 ?auto_106818 ) ) ( not ( = ?auto_106817 ?auto_106819 ) ) ( not ( = ?auto_106817 ?auto_106820 ) ) ( not ( = ?auto_106817 ?auto_106821 ) ) ( not ( = ?auto_106817 ?auto_106822 ) ) ( not ( = ?auto_106817 ?auto_106823 ) ) ( not ( = ?auto_106818 ?auto_106819 ) ) ( not ( = ?auto_106818 ?auto_106820 ) ) ( not ( = ?auto_106818 ?auto_106821 ) ) ( not ( = ?auto_106818 ?auto_106822 ) ) ( not ( = ?auto_106818 ?auto_106823 ) ) ( not ( = ?auto_106819 ?auto_106820 ) ) ( not ( = ?auto_106819 ?auto_106821 ) ) ( not ( = ?auto_106819 ?auto_106822 ) ) ( not ( = ?auto_106819 ?auto_106823 ) ) ( not ( = ?auto_106820 ?auto_106821 ) ) ( not ( = ?auto_106820 ?auto_106822 ) ) ( not ( = ?auto_106820 ?auto_106823 ) ) ( not ( = ?auto_106821 ?auto_106822 ) ) ( not ( = ?auto_106821 ?auto_106823 ) ) ( not ( = ?auto_106822 ?auto_106823 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106823 ?auto_106822 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106824 - BLOCK
      ?auto_106825 - BLOCK
      ?auto_106826 - BLOCK
      ?auto_106827 - BLOCK
      ?auto_106828 - BLOCK
      ?auto_106829 - BLOCK
    )
    :vars
    (
      ?auto_106830 - BLOCK
      ?auto_106831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106830 ?auto_106829 ) ( CLEAR ?auto_106830 ) ( ON-TABLE ?auto_106824 ) ( ON ?auto_106825 ?auto_106824 ) ( ON ?auto_106826 ?auto_106825 ) ( ON ?auto_106827 ?auto_106826 ) ( ON ?auto_106828 ?auto_106827 ) ( ON ?auto_106829 ?auto_106828 ) ( not ( = ?auto_106824 ?auto_106825 ) ) ( not ( = ?auto_106824 ?auto_106826 ) ) ( not ( = ?auto_106824 ?auto_106827 ) ) ( not ( = ?auto_106824 ?auto_106828 ) ) ( not ( = ?auto_106824 ?auto_106829 ) ) ( not ( = ?auto_106824 ?auto_106830 ) ) ( not ( = ?auto_106825 ?auto_106826 ) ) ( not ( = ?auto_106825 ?auto_106827 ) ) ( not ( = ?auto_106825 ?auto_106828 ) ) ( not ( = ?auto_106825 ?auto_106829 ) ) ( not ( = ?auto_106825 ?auto_106830 ) ) ( not ( = ?auto_106826 ?auto_106827 ) ) ( not ( = ?auto_106826 ?auto_106828 ) ) ( not ( = ?auto_106826 ?auto_106829 ) ) ( not ( = ?auto_106826 ?auto_106830 ) ) ( not ( = ?auto_106827 ?auto_106828 ) ) ( not ( = ?auto_106827 ?auto_106829 ) ) ( not ( = ?auto_106827 ?auto_106830 ) ) ( not ( = ?auto_106828 ?auto_106829 ) ) ( not ( = ?auto_106828 ?auto_106830 ) ) ( not ( = ?auto_106829 ?auto_106830 ) ) ( HOLDING ?auto_106831 ) ( not ( = ?auto_106824 ?auto_106831 ) ) ( not ( = ?auto_106825 ?auto_106831 ) ) ( not ( = ?auto_106826 ?auto_106831 ) ) ( not ( = ?auto_106827 ?auto_106831 ) ) ( not ( = ?auto_106828 ?auto_106831 ) ) ( not ( = ?auto_106829 ?auto_106831 ) ) ( not ( = ?auto_106830 ?auto_106831 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_106831 )
      ( MAKE-6PILE ?auto_106824 ?auto_106825 ?auto_106826 ?auto_106827 ?auto_106828 ?auto_106829 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106832 - BLOCK
      ?auto_106833 - BLOCK
      ?auto_106834 - BLOCK
      ?auto_106835 - BLOCK
      ?auto_106836 - BLOCK
      ?auto_106837 - BLOCK
    )
    :vars
    (
      ?auto_106839 - BLOCK
      ?auto_106838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106839 ?auto_106837 ) ( ON-TABLE ?auto_106832 ) ( ON ?auto_106833 ?auto_106832 ) ( ON ?auto_106834 ?auto_106833 ) ( ON ?auto_106835 ?auto_106834 ) ( ON ?auto_106836 ?auto_106835 ) ( ON ?auto_106837 ?auto_106836 ) ( not ( = ?auto_106832 ?auto_106833 ) ) ( not ( = ?auto_106832 ?auto_106834 ) ) ( not ( = ?auto_106832 ?auto_106835 ) ) ( not ( = ?auto_106832 ?auto_106836 ) ) ( not ( = ?auto_106832 ?auto_106837 ) ) ( not ( = ?auto_106832 ?auto_106839 ) ) ( not ( = ?auto_106833 ?auto_106834 ) ) ( not ( = ?auto_106833 ?auto_106835 ) ) ( not ( = ?auto_106833 ?auto_106836 ) ) ( not ( = ?auto_106833 ?auto_106837 ) ) ( not ( = ?auto_106833 ?auto_106839 ) ) ( not ( = ?auto_106834 ?auto_106835 ) ) ( not ( = ?auto_106834 ?auto_106836 ) ) ( not ( = ?auto_106834 ?auto_106837 ) ) ( not ( = ?auto_106834 ?auto_106839 ) ) ( not ( = ?auto_106835 ?auto_106836 ) ) ( not ( = ?auto_106835 ?auto_106837 ) ) ( not ( = ?auto_106835 ?auto_106839 ) ) ( not ( = ?auto_106836 ?auto_106837 ) ) ( not ( = ?auto_106836 ?auto_106839 ) ) ( not ( = ?auto_106837 ?auto_106839 ) ) ( not ( = ?auto_106832 ?auto_106838 ) ) ( not ( = ?auto_106833 ?auto_106838 ) ) ( not ( = ?auto_106834 ?auto_106838 ) ) ( not ( = ?auto_106835 ?auto_106838 ) ) ( not ( = ?auto_106836 ?auto_106838 ) ) ( not ( = ?auto_106837 ?auto_106838 ) ) ( not ( = ?auto_106839 ?auto_106838 ) ) ( ON ?auto_106838 ?auto_106839 ) ( CLEAR ?auto_106838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106832 ?auto_106833 ?auto_106834 ?auto_106835 ?auto_106836 ?auto_106837 ?auto_106839 )
      ( MAKE-6PILE ?auto_106832 ?auto_106833 ?auto_106834 ?auto_106835 ?auto_106836 ?auto_106837 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106842 - BLOCK
      ?auto_106843 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_106843 ) ( CLEAR ?auto_106842 ) ( ON-TABLE ?auto_106842 ) ( not ( = ?auto_106842 ?auto_106843 ) ) )
    :subtasks
    ( ( !STACK ?auto_106843 ?auto_106842 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106844 - BLOCK
      ?auto_106845 - BLOCK
    )
    :vars
    (
      ?auto_106846 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_106844 ) ( ON-TABLE ?auto_106844 ) ( not ( = ?auto_106844 ?auto_106845 ) ) ( ON ?auto_106845 ?auto_106846 ) ( CLEAR ?auto_106845 ) ( HAND-EMPTY ) ( not ( = ?auto_106844 ?auto_106846 ) ) ( not ( = ?auto_106845 ?auto_106846 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106845 ?auto_106846 )
      ( MAKE-2PILE ?auto_106844 ?auto_106845 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106847 - BLOCK
      ?auto_106848 - BLOCK
    )
    :vars
    (
      ?auto_106849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106847 ?auto_106848 ) ) ( ON ?auto_106848 ?auto_106849 ) ( CLEAR ?auto_106848 ) ( not ( = ?auto_106847 ?auto_106849 ) ) ( not ( = ?auto_106848 ?auto_106849 ) ) ( HOLDING ?auto_106847 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106847 )
      ( MAKE-2PILE ?auto_106847 ?auto_106848 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106850 - BLOCK
      ?auto_106851 - BLOCK
    )
    :vars
    (
      ?auto_106852 - BLOCK
      ?auto_106855 - BLOCK
      ?auto_106856 - BLOCK
      ?auto_106854 - BLOCK
      ?auto_106853 - BLOCK
      ?auto_106857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106850 ?auto_106851 ) ) ( ON ?auto_106851 ?auto_106852 ) ( not ( = ?auto_106850 ?auto_106852 ) ) ( not ( = ?auto_106851 ?auto_106852 ) ) ( ON ?auto_106850 ?auto_106851 ) ( CLEAR ?auto_106850 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106855 ) ( ON ?auto_106856 ?auto_106855 ) ( ON ?auto_106854 ?auto_106856 ) ( ON ?auto_106853 ?auto_106854 ) ( ON ?auto_106857 ?auto_106853 ) ( ON ?auto_106852 ?auto_106857 ) ( not ( = ?auto_106855 ?auto_106856 ) ) ( not ( = ?auto_106855 ?auto_106854 ) ) ( not ( = ?auto_106855 ?auto_106853 ) ) ( not ( = ?auto_106855 ?auto_106857 ) ) ( not ( = ?auto_106855 ?auto_106852 ) ) ( not ( = ?auto_106855 ?auto_106851 ) ) ( not ( = ?auto_106855 ?auto_106850 ) ) ( not ( = ?auto_106856 ?auto_106854 ) ) ( not ( = ?auto_106856 ?auto_106853 ) ) ( not ( = ?auto_106856 ?auto_106857 ) ) ( not ( = ?auto_106856 ?auto_106852 ) ) ( not ( = ?auto_106856 ?auto_106851 ) ) ( not ( = ?auto_106856 ?auto_106850 ) ) ( not ( = ?auto_106854 ?auto_106853 ) ) ( not ( = ?auto_106854 ?auto_106857 ) ) ( not ( = ?auto_106854 ?auto_106852 ) ) ( not ( = ?auto_106854 ?auto_106851 ) ) ( not ( = ?auto_106854 ?auto_106850 ) ) ( not ( = ?auto_106853 ?auto_106857 ) ) ( not ( = ?auto_106853 ?auto_106852 ) ) ( not ( = ?auto_106853 ?auto_106851 ) ) ( not ( = ?auto_106853 ?auto_106850 ) ) ( not ( = ?auto_106857 ?auto_106852 ) ) ( not ( = ?auto_106857 ?auto_106851 ) ) ( not ( = ?auto_106857 ?auto_106850 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106855 ?auto_106856 ?auto_106854 ?auto_106853 ?auto_106857 ?auto_106852 ?auto_106851 )
      ( MAKE-2PILE ?auto_106850 ?auto_106851 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106863 - BLOCK
      ?auto_106864 - BLOCK
      ?auto_106865 - BLOCK
      ?auto_106866 - BLOCK
      ?auto_106867 - BLOCK
    )
    :vars
    (
      ?auto_106868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106868 ?auto_106867 ) ( CLEAR ?auto_106868 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106863 ) ( ON ?auto_106864 ?auto_106863 ) ( ON ?auto_106865 ?auto_106864 ) ( ON ?auto_106866 ?auto_106865 ) ( ON ?auto_106867 ?auto_106866 ) ( not ( = ?auto_106863 ?auto_106864 ) ) ( not ( = ?auto_106863 ?auto_106865 ) ) ( not ( = ?auto_106863 ?auto_106866 ) ) ( not ( = ?auto_106863 ?auto_106867 ) ) ( not ( = ?auto_106863 ?auto_106868 ) ) ( not ( = ?auto_106864 ?auto_106865 ) ) ( not ( = ?auto_106864 ?auto_106866 ) ) ( not ( = ?auto_106864 ?auto_106867 ) ) ( not ( = ?auto_106864 ?auto_106868 ) ) ( not ( = ?auto_106865 ?auto_106866 ) ) ( not ( = ?auto_106865 ?auto_106867 ) ) ( not ( = ?auto_106865 ?auto_106868 ) ) ( not ( = ?auto_106866 ?auto_106867 ) ) ( not ( = ?auto_106866 ?auto_106868 ) ) ( not ( = ?auto_106867 ?auto_106868 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106868 ?auto_106867 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106869 - BLOCK
      ?auto_106870 - BLOCK
      ?auto_106871 - BLOCK
      ?auto_106872 - BLOCK
      ?auto_106873 - BLOCK
    )
    :vars
    (
      ?auto_106874 - BLOCK
      ?auto_106875 - BLOCK
      ?auto_106876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106874 ?auto_106873 ) ( CLEAR ?auto_106874 ) ( ON-TABLE ?auto_106869 ) ( ON ?auto_106870 ?auto_106869 ) ( ON ?auto_106871 ?auto_106870 ) ( ON ?auto_106872 ?auto_106871 ) ( ON ?auto_106873 ?auto_106872 ) ( not ( = ?auto_106869 ?auto_106870 ) ) ( not ( = ?auto_106869 ?auto_106871 ) ) ( not ( = ?auto_106869 ?auto_106872 ) ) ( not ( = ?auto_106869 ?auto_106873 ) ) ( not ( = ?auto_106869 ?auto_106874 ) ) ( not ( = ?auto_106870 ?auto_106871 ) ) ( not ( = ?auto_106870 ?auto_106872 ) ) ( not ( = ?auto_106870 ?auto_106873 ) ) ( not ( = ?auto_106870 ?auto_106874 ) ) ( not ( = ?auto_106871 ?auto_106872 ) ) ( not ( = ?auto_106871 ?auto_106873 ) ) ( not ( = ?auto_106871 ?auto_106874 ) ) ( not ( = ?auto_106872 ?auto_106873 ) ) ( not ( = ?auto_106872 ?auto_106874 ) ) ( not ( = ?auto_106873 ?auto_106874 ) ) ( HOLDING ?auto_106875 ) ( CLEAR ?auto_106876 ) ( not ( = ?auto_106869 ?auto_106875 ) ) ( not ( = ?auto_106869 ?auto_106876 ) ) ( not ( = ?auto_106870 ?auto_106875 ) ) ( not ( = ?auto_106870 ?auto_106876 ) ) ( not ( = ?auto_106871 ?auto_106875 ) ) ( not ( = ?auto_106871 ?auto_106876 ) ) ( not ( = ?auto_106872 ?auto_106875 ) ) ( not ( = ?auto_106872 ?auto_106876 ) ) ( not ( = ?auto_106873 ?auto_106875 ) ) ( not ( = ?auto_106873 ?auto_106876 ) ) ( not ( = ?auto_106874 ?auto_106875 ) ) ( not ( = ?auto_106874 ?auto_106876 ) ) ( not ( = ?auto_106875 ?auto_106876 ) ) )
    :subtasks
    ( ( !STACK ?auto_106875 ?auto_106876 )
      ( MAKE-5PILE ?auto_106869 ?auto_106870 ?auto_106871 ?auto_106872 ?auto_106873 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107795 - BLOCK
      ?auto_107796 - BLOCK
      ?auto_107797 - BLOCK
      ?auto_107798 - BLOCK
      ?auto_107799 - BLOCK
    )
    :vars
    (
      ?auto_107800 - BLOCK
      ?auto_107801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107800 ?auto_107799 ) ( ON-TABLE ?auto_107795 ) ( ON ?auto_107796 ?auto_107795 ) ( ON ?auto_107797 ?auto_107796 ) ( ON ?auto_107798 ?auto_107797 ) ( ON ?auto_107799 ?auto_107798 ) ( not ( = ?auto_107795 ?auto_107796 ) ) ( not ( = ?auto_107795 ?auto_107797 ) ) ( not ( = ?auto_107795 ?auto_107798 ) ) ( not ( = ?auto_107795 ?auto_107799 ) ) ( not ( = ?auto_107795 ?auto_107800 ) ) ( not ( = ?auto_107796 ?auto_107797 ) ) ( not ( = ?auto_107796 ?auto_107798 ) ) ( not ( = ?auto_107796 ?auto_107799 ) ) ( not ( = ?auto_107796 ?auto_107800 ) ) ( not ( = ?auto_107797 ?auto_107798 ) ) ( not ( = ?auto_107797 ?auto_107799 ) ) ( not ( = ?auto_107797 ?auto_107800 ) ) ( not ( = ?auto_107798 ?auto_107799 ) ) ( not ( = ?auto_107798 ?auto_107800 ) ) ( not ( = ?auto_107799 ?auto_107800 ) ) ( not ( = ?auto_107795 ?auto_107801 ) ) ( not ( = ?auto_107796 ?auto_107801 ) ) ( not ( = ?auto_107797 ?auto_107801 ) ) ( not ( = ?auto_107798 ?auto_107801 ) ) ( not ( = ?auto_107799 ?auto_107801 ) ) ( not ( = ?auto_107800 ?auto_107801 ) ) ( ON ?auto_107801 ?auto_107800 ) ( CLEAR ?auto_107801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107795 ?auto_107796 ?auto_107797 ?auto_107798 ?auto_107799 ?auto_107800 )
      ( MAKE-5PILE ?auto_107795 ?auto_107796 ?auto_107797 ?auto_107798 ?auto_107799 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106885 - BLOCK
      ?auto_106886 - BLOCK
      ?auto_106887 - BLOCK
      ?auto_106888 - BLOCK
      ?auto_106889 - BLOCK
    )
    :vars
    (
      ?auto_106891 - BLOCK
      ?auto_106890 - BLOCK
      ?auto_106892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106891 ?auto_106889 ) ( ON-TABLE ?auto_106885 ) ( ON ?auto_106886 ?auto_106885 ) ( ON ?auto_106887 ?auto_106886 ) ( ON ?auto_106888 ?auto_106887 ) ( ON ?auto_106889 ?auto_106888 ) ( not ( = ?auto_106885 ?auto_106886 ) ) ( not ( = ?auto_106885 ?auto_106887 ) ) ( not ( = ?auto_106885 ?auto_106888 ) ) ( not ( = ?auto_106885 ?auto_106889 ) ) ( not ( = ?auto_106885 ?auto_106891 ) ) ( not ( = ?auto_106886 ?auto_106887 ) ) ( not ( = ?auto_106886 ?auto_106888 ) ) ( not ( = ?auto_106886 ?auto_106889 ) ) ( not ( = ?auto_106886 ?auto_106891 ) ) ( not ( = ?auto_106887 ?auto_106888 ) ) ( not ( = ?auto_106887 ?auto_106889 ) ) ( not ( = ?auto_106887 ?auto_106891 ) ) ( not ( = ?auto_106888 ?auto_106889 ) ) ( not ( = ?auto_106888 ?auto_106891 ) ) ( not ( = ?auto_106889 ?auto_106891 ) ) ( not ( = ?auto_106885 ?auto_106890 ) ) ( not ( = ?auto_106885 ?auto_106892 ) ) ( not ( = ?auto_106886 ?auto_106890 ) ) ( not ( = ?auto_106886 ?auto_106892 ) ) ( not ( = ?auto_106887 ?auto_106890 ) ) ( not ( = ?auto_106887 ?auto_106892 ) ) ( not ( = ?auto_106888 ?auto_106890 ) ) ( not ( = ?auto_106888 ?auto_106892 ) ) ( not ( = ?auto_106889 ?auto_106890 ) ) ( not ( = ?auto_106889 ?auto_106892 ) ) ( not ( = ?auto_106891 ?auto_106890 ) ) ( not ( = ?auto_106891 ?auto_106892 ) ) ( not ( = ?auto_106890 ?auto_106892 ) ) ( ON ?auto_106890 ?auto_106891 ) ( CLEAR ?auto_106890 ) ( HOLDING ?auto_106892 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106892 )
      ( MAKE-5PILE ?auto_106885 ?auto_106886 ?auto_106887 ?auto_106888 ?auto_106889 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106893 - BLOCK
      ?auto_106894 - BLOCK
      ?auto_106895 - BLOCK
      ?auto_106896 - BLOCK
      ?auto_106897 - BLOCK
    )
    :vars
    (
      ?auto_106899 - BLOCK
      ?auto_106898 - BLOCK
      ?auto_106900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106899 ?auto_106897 ) ( ON-TABLE ?auto_106893 ) ( ON ?auto_106894 ?auto_106893 ) ( ON ?auto_106895 ?auto_106894 ) ( ON ?auto_106896 ?auto_106895 ) ( ON ?auto_106897 ?auto_106896 ) ( not ( = ?auto_106893 ?auto_106894 ) ) ( not ( = ?auto_106893 ?auto_106895 ) ) ( not ( = ?auto_106893 ?auto_106896 ) ) ( not ( = ?auto_106893 ?auto_106897 ) ) ( not ( = ?auto_106893 ?auto_106899 ) ) ( not ( = ?auto_106894 ?auto_106895 ) ) ( not ( = ?auto_106894 ?auto_106896 ) ) ( not ( = ?auto_106894 ?auto_106897 ) ) ( not ( = ?auto_106894 ?auto_106899 ) ) ( not ( = ?auto_106895 ?auto_106896 ) ) ( not ( = ?auto_106895 ?auto_106897 ) ) ( not ( = ?auto_106895 ?auto_106899 ) ) ( not ( = ?auto_106896 ?auto_106897 ) ) ( not ( = ?auto_106896 ?auto_106899 ) ) ( not ( = ?auto_106897 ?auto_106899 ) ) ( not ( = ?auto_106893 ?auto_106898 ) ) ( not ( = ?auto_106893 ?auto_106900 ) ) ( not ( = ?auto_106894 ?auto_106898 ) ) ( not ( = ?auto_106894 ?auto_106900 ) ) ( not ( = ?auto_106895 ?auto_106898 ) ) ( not ( = ?auto_106895 ?auto_106900 ) ) ( not ( = ?auto_106896 ?auto_106898 ) ) ( not ( = ?auto_106896 ?auto_106900 ) ) ( not ( = ?auto_106897 ?auto_106898 ) ) ( not ( = ?auto_106897 ?auto_106900 ) ) ( not ( = ?auto_106899 ?auto_106898 ) ) ( not ( = ?auto_106899 ?auto_106900 ) ) ( not ( = ?auto_106898 ?auto_106900 ) ) ( ON ?auto_106898 ?auto_106899 ) ( ON ?auto_106900 ?auto_106898 ) ( CLEAR ?auto_106900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106893 ?auto_106894 ?auto_106895 ?auto_106896 ?auto_106897 ?auto_106899 ?auto_106898 )
      ( MAKE-5PILE ?auto_106893 ?auto_106894 ?auto_106895 ?auto_106896 ?auto_106897 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_106904 - BLOCK
      ?auto_106905 - BLOCK
      ?auto_106906 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_106906 ) ( CLEAR ?auto_106905 ) ( ON-TABLE ?auto_106904 ) ( ON ?auto_106905 ?auto_106904 ) ( not ( = ?auto_106904 ?auto_106905 ) ) ( not ( = ?auto_106904 ?auto_106906 ) ) ( not ( = ?auto_106905 ?auto_106906 ) ) )
    :subtasks
    ( ( !STACK ?auto_106906 ?auto_106905 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_106907 - BLOCK
      ?auto_106908 - BLOCK
      ?auto_106909 - BLOCK
    )
    :vars
    (
      ?auto_106910 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_106908 ) ( ON-TABLE ?auto_106907 ) ( ON ?auto_106908 ?auto_106907 ) ( not ( = ?auto_106907 ?auto_106908 ) ) ( not ( = ?auto_106907 ?auto_106909 ) ) ( not ( = ?auto_106908 ?auto_106909 ) ) ( ON ?auto_106909 ?auto_106910 ) ( CLEAR ?auto_106909 ) ( HAND-EMPTY ) ( not ( = ?auto_106907 ?auto_106910 ) ) ( not ( = ?auto_106908 ?auto_106910 ) ) ( not ( = ?auto_106909 ?auto_106910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106909 ?auto_106910 )
      ( MAKE-3PILE ?auto_106907 ?auto_106908 ?auto_106909 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_106911 - BLOCK
      ?auto_106912 - BLOCK
      ?auto_106913 - BLOCK
    )
    :vars
    (
      ?auto_106914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106911 ) ( not ( = ?auto_106911 ?auto_106912 ) ) ( not ( = ?auto_106911 ?auto_106913 ) ) ( not ( = ?auto_106912 ?auto_106913 ) ) ( ON ?auto_106913 ?auto_106914 ) ( CLEAR ?auto_106913 ) ( not ( = ?auto_106911 ?auto_106914 ) ) ( not ( = ?auto_106912 ?auto_106914 ) ) ( not ( = ?auto_106913 ?auto_106914 ) ) ( HOLDING ?auto_106912 ) ( CLEAR ?auto_106911 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106911 ?auto_106912 )
      ( MAKE-3PILE ?auto_106911 ?auto_106912 ?auto_106913 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_106915 - BLOCK
      ?auto_106916 - BLOCK
      ?auto_106917 - BLOCK
    )
    :vars
    (
      ?auto_106918 - BLOCK
      ?auto_106920 - BLOCK
      ?auto_106922 - BLOCK
      ?auto_106919 - BLOCK
      ?auto_106921 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106915 ) ( not ( = ?auto_106915 ?auto_106916 ) ) ( not ( = ?auto_106915 ?auto_106917 ) ) ( not ( = ?auto_106916 ?auto_106917 ) ) ( ON ?auto_106917 ?auto_106918 ) ( not ( = ?auto_106915 ?auto_106918 ) ) ( not ( = ?auto_106916 ?auto_106918 ) ) ( not ( = ?auto_106917 ?auto_106918 ) ) ( CLEAR ?auto_106915 ) ( ON ?auto_106916 ?auto_106917 ) ( CLEAR ?auto_106916 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106920 ) ( ON ?auto_106922 ?auto_106920 ) ( ON ?auto_106919 ?auto_106922 ) ( ON ?auto_106921 ?auto_106919 ) ( ON ?auto_106918 ?auto_106921 ) ( not ( = ?auto_106920 ?auto_106922 ) ) ( not ( = ?auto_106920 ?auto_106919 ) ) ( not ( = ?auto_106920 ?auto_106921 ) ) ( not ( = ?auto_106920 ?auto_106918 ) ) ( not ( = ?auto_106920 ?auto_106917 ) ) ( not ( = ?auto_106920 ?auto_106916 ) ) ( not ( = ?auto_106922 ?auto_106919 ) ) ( not ( = ?auto_106922 ?auto_106921 ) ) ( not ( = ?auto_106922 ?auto_106918 ) ) ( not ( = ?auto_106922 ?auto_106917 ) ) ( not ( = ?auto_106922 ?auto_106916 ) ) ( not ( = ?auto_106919 ?auto_106921 ) ) ( not ( = ?auto_106919 ?auto_106918 ) ) ( not ( = ?auto_106919 ?auto_106917 ) ) ( not ( = ?auto_106919 ?auto_106916 ) ) ( not ( = ?auto_106921 ?auto_106918 ) ) ( not ( = ?auto_106921 ?auto_106917 ) ) ( not ( = ?auto_106921 ?auto_106916 ) ) ( not ( = ?auto_106915 ?auto_106920 ) ) ( not ( = ?auto_106915 ?auto_106922 ) ) ( not ( = ?auto_106915 ?auto_106919 ) ) ( not ( = ?auto_106915 ?auto_106921 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106920 ?auto_106922 ?auto_106919 ?auto_106921 ?auto_106918 ?auto_106917 )
      ( MAKE-3PILE ?auto_106915 ?auto_106916 ?auto_106917 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_106923 - BLOCK
      ?auto_106924 - BLOCK
      ?auto_106925 - BLOCK
    )
    :vars
    (
      ?auto_106930 - BLOCK
      ?auto_106928 - BLOCK
      ?auto_106927 - BLOCK
      ?auto_106929 - BLOCK
      ?auto_106926 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106923 ?auto_106924 ) ) ( not ( = ?auto_106923 ?auto_106925 ) ) ( not ( = ?auto_106924 ?auto_106925 ) ) ( ON ?auto_106925 ?auto_106930 ) ( not ( = ?auto_106923 ?auto_106930 ) ) ( not ( = ?auto_106924 ?auto_106930 ) ) ( not ( = ?auto_106925 ?auto_106930 ) ) ( ON ?auto_106924 ?auto_106925 ) ( CLEAR ?auto_106924 ) ( ON-TABLE ?auto_106928 ) ( ON ?auto_106927 ?auto_106928 ) ( ON ?auto_106929 ?auto_106927 ) ( ON ?auto_106926 ?auto_106929 ) ( ON ?auto_106930 ?auto_106926 ) ( not ( = ?auto_106928 ?auto_106927 ) ) ( not ( = ?auto_106928 ?auto_106929 ) ) ( not ( = ?auto_106928 ?auto_106926 ) ) ( not ( = ?auto_106928 ?auto_106930 ) ) ( not ( = ?auto_106928 ?auto_106925 ) ) ( not ( = ?auto_106928 ?auto_106924 ) ) ( not ( = ?auto_106927 ?auto_106929 ) ) ( not ( = ?auto_106927 ?auto_106926 ) ) ( not ( = ?auto_106927 ?auto_106930 ) ) ( not ( = ?auto_106927 ?auto_106925 ) ) ( not ( = ?auto_106927 ?auto_106924 ) ) ( not ( = ?auto_106929 ?auto_106926 ) ) ( not ( = ?auto_106929 ?auto_106930 ) ) ( not ( = ?auto_106929 ?auto_106925 ) ) ( not ( = ?auto_106929 ?auto_106924 ) ) ( not ( = ?auto_106926 ?auto_106930 ) ) ( not ( = ?auto_106926 ?auto_106925 ) ) ( not ( = ?auto_106926 ?auto_106924 ) ) ( not ( = ?auto_106923 ?auto_106928 ) ) ( not ( = ?auto_106923 ?auto_106927 ) ) ( not ( = ?auto_106923 ?auto_106929 ) ) ( not ( = ?auto_106923 ?auto_106926 ) ) ( HOLDING ?auto_106923 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106923 )
      ( MAKE-3PILE ?auto_106923 ?auto_106924 ?auto_106925 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_106931 - BLOCK
      ?auto_106932 - BLOCK
      ?auto_106933 - BLOCK
    )
    :vars
    (
      ?auto_106936 - BLOCK
      ?auto_106938 - BLOCK
      ?auto_106935 - BLOCK
      ?auto_106937 - BLOCK
      ?auto_106934 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106931 ?auto_106932 ) ) ( not ( = ?auto_106931 ?auto_106933 ) ) ( not ( = ?auto_106932 ?auto_106933 ) ) ( ON ?auto_106933 ?auto_106936 ) ( not ( = ?auto_106931 ?auto_106936 ) ) ( not ( = ?auto_106932 ?auto_106936 ) ) ( not ( = ?auto_106933 ?auto_106936 ) ) ( ON ?auto_106932 ?auto_106933 ) ( ON-TABLE ?auto_106938 ) ( ON ?auto_106935 ?auto_106938 ) ( ON ?auto_106937 ?auto_106935 ) ( ON ?auto_106934 ?auto_106937 ) ( ON ?auto_106936 ?auto_106934 ) ( not ( = ?auto_106938 ?auto_106935 ) ) ( not ( = ?auto_106938 ?auto_106937 ) ) ( not ( = ?auto_106938 ?auto_106934 ) ) ( not ( = ?auto_106938 ?auto_106936 ) ) ( not ( = ?auto_106938 ?auto_106933 ) ) ( not ( = ?auto_106938 ?auto_106932 ) ) ( not ( = ?auto_106935 ?auto_106937 ) ) ( not ( = ?auto_106935 ?auto_106934 ) ) ( not ( = ?auto_106935 ?auto_106936 ) ) ( not ( = ?auto_106935 ?auto_106933 ) ) ( not ( = ?auto_106935 ?auto_106932 ) ) ( not ( = ?auto_106937 ?auto_106934 ) ) ( not ( = ?auto_106937 ?auto_106936 ) ) ( not ( = ?auto_106937 ?auto_106933 ) ) ( not ( = ?auto_106937 ?auto_106932 ) ) ( not ( = ?auto_106934 ?auto_106936 ) ) ( not ( = ?auto_106934 ?auto_106933 ) ) ( not ( = ?auto_106934 ?auto_106932 ) ) ( not ( = ?auto_106931 ?auto_106938 ) ) ( not ( = ?auto_106931 ?auto_106935 ) ) ( not ( = ?auto_106931 ?auto_106937 ) ) ( not ( = ?auto_106931 ?auto_106934 ) ) ( ON ?auto_106931 ?auto_106932 ) ( CLEAR ?auto_106931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106938 ?auto_106935 ?auto_106937 ?auto_106934 ?auto_106936 ?auto_106933 ?auto_106932 )
      ( MAKE-3PILE ?auto_106931 ?auto_106932 ?auto_106933 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106943 - BLOCK
      ?auto_106944 - BLOCK
      ?auto_106945 - BLOCK
      ?auto_106946 - BLOCK
    )
    :vars
    (
      ?auto_106947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106947 ?auto_106946 ) ( CLEAR ?auto_106947 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106943 ) ( ON ?auto_106944 ?auto_106943 ) ( ON ?auto_106945 ?auto_106944 ) ( ON ?auto_106946 ?auto_106945 ) ( not ( = ?auto_106943 ?auto_106944 ) ) ( not ( = ?auto_106943 ?auto_106945 ) ) ( not ( = ?auto_106943 ?auto_106946 ) ) ( not ( = ?auto_106943 ?auto_106947 ) ) ( not ( = ?auto_106944 ?auto_106945 ) ) ( not ( = ?auto_106944 ?auto_106946 ) ) ( not ( = ?auto_106944 ?auto_106947 ) ) ( not ( = ?auto_106945 ?auto_106946 ) ) ( not ( = ?auto_106945 ?auto_106947 ) ) ( not ( = ?auto_106946 ?auto_106947 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106947 ?auto_106946 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106948 - BLOCK
      ?auto_106949 - BLOCK
      ?auto_106950 - BLOCK
      ?auto_106951 - BLOCK
    )
    :vars
    (
      ?auto_106952 - BLOCK
      ?auto_106953 - BLOCK
      ?auto_106954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106952 ?auto_106951 ) ( CLEAR ?auto_106952 ) ( ON-TABLE ?auto_106948 ) ( ON ?auto_106949 ?auto_106948 ) ( ON ?auto_106950 ?auto_106949 ) ( ON ?auto_106951 ?auto_106950 ) ( not ( = ?auto_106948 ?auto_106949 ) ) ( not ( = ?auto_106948 ?auto_106950 ) ) ( not ( = ?auto_106948 ?auto_106951 ) ) ( not ( = ?auto_106948 ?auto_106952 ) ) ( not ( = ?auto_106949 ?auto_106950 ) ) ( not ( = ?auto_106949 ?auto_106951 ) ) ( not ( = ?auto_106949 ?auto_106952 ) ) ( not ( = ?auto_106950 ?auto_106951 ) ) ( not ( = ?auto_106950 ?auto_106952 ) ) ( not ( = ?auto_106951 ?auto_106952 ) ) ( HOLDING ?auto_106953 ) ( CLEAR ?auto_106954 ) ( not ( = ?auto_106948 ?auto_106953 ) ) ( not ( = ?auto_106948 ?auto_106954 ) ) ( not ( = ?auto_106949 ?auto_106953 ) ) ( not ( = ?auto_106949 ?auto_106954 ) ) ( not ( = ?auto_106950 ?auto_106953 ) ) ( not ( = ?auto_106950 ?auto_106954 ) ) ( not ( = ?auto_106951 ?auto_106953 ) ) ( not ( = ?auto_106951 ?auto_106954 ) ) ( not ( = ?auto_106952 ?auto_106953 ) ) ( not ( = ?auto_106952 ?auto_106954 ) ) ( not ( = ?auto_106953 ?auto_106954 ) ) )
    :subtasks
    ( ( !STACK ?auto_106953 ?auto_106954 )
      ( MAKE-4PILE ?auto_106948 ?auto_106949 ?auto_106950 ?auto_106951 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106955 - BLOCK
      ?auto_106956 - BLOCK
      ?auto_106957 - BLOCK
      ?auto_106958 - BLOCK
    )
    :vars
    (
      ?auto_106961 - BLOCK
      ?auto_106959 - BLOCK
      ?auto_106960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106961 ?auto_106958 ) ( ON-TABLE ?auto_106955 ) ( ON ?auto_106956 ?auto_106955 ) ( ON ?auto_106957 ?auto_106956 ) ( ON ?auto_106958 ?auto_106957 ) ( not ( = ?auto_106955 ?auto_106956 ) ) ( not ( = ?auto_106955 ?auto_106957 ) ) ( not ( = ?auto_106955 ?auto_106958 ) ) ( not ( = ?auto_106955 ?auto_106961 ) ) ( not ( = ?auto_106956 ?auto_106957 ) ) ( not ( = ?auto_106956 ?auto_106958 ) ) ( not ( = ?auto_106956 ?auto_106961 ) ) ( not ( = ?auto_106957 ?auto_106958 ) ) ( not ( = ?auto_106957 ?auto_106961 ) ) ( not ( = ?auto_106958 ?auto_106961 ) ) ( CLEAR ?auto_106959 ) ( not ( = ?auto_106955 ?auto_106960 ) ) ( not ( = ?auto_106955 ?auto_106959 ) ) ( not ( = ?auto_106956 ?auto_106960 ) ) ( not ( = ?auto_106956 ?auto_106959 ) ) ( not ( = ?auto_106957 ?auto_106960 ) ) ( not ( = ?auto_106957 ?auto_106959 ) ) ( not ( = ?auto_106958 ?auto_106960 ) ) ( not ( = ?auto_106958 ?auto_106959 ) ) ( not ( = ?auto_106961 ?auto_106960 ) ) ( not ( = ?auto_106961 ?auto_106959 ) ) ( not ( = ?auto_106960 ?auto_106959 ) ) ( ON ?auto_106960 ?auto_106961 ) ( CLEAR ?auto_106960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106955 ?auto_106956 ?auto_106957 ?auto_106958 ?auto_106961 )
      ( MAKE-4PILE ?auto_106955 ?auto_106956 ?auto_106957 ?auto_106958 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106962 - BLOCK
      ?auto_106963 - BLOCK
      ?auto_106964 - BLOCK
      ?auto_106965 - BLOCK
    )
    :vars
    (
      ?auto_106968 - BLOCK
      ?auto_106966 - BLOCK
      ?auto_106967 - BLOCK
      ?auto_106969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106968 ?auto_106965 ) ( ON-TABLE ?auto_106962 ) ( ON ?auto_106963 ?auto_106962 ) ( ON ?auto_106964 ?auto_106963 ) ( ON ?auto_106965 ?auto_106964 ) ( not ( = ?auto_106962 ?auto_106963 ) ) ( not ( = ?auto_106962 ?auto_106964 ) ) ( not ( = ?auto_106962 ?auto_106965 ) ) ( not ( = ?auto_106962 ?auto_106968 ) ) ( not ( = ?auto_106963 ?auto_106964 ) ) ( not ( = ?auto_106963 ?auto_106965 ) ) ( not ( = ?auto_106963 ?auto_106968 ) ) ( not ( = ?auto_106964 ?auto_106965 ) ) ( not ( = ?auto_106964 ?auto_106968 ) ) ( not ( = ?auto_106965 ?auto_106968 ) ) ( not ( = ?auto_106962 ?auto_106966 ) ) ( not ( = ?auto_106962 ?auto_106967 ) ) ( not ( = ?auto_106963 ?auto_106966 ) ) ( not ( = ?auto_106963 ?auto_106967 ) ) ( not ( = ?auto_106964 ?auto_106966 ) ) ( not ( = ?auto_106964 ?auto_106967 ) ) ( not ( = ?auto_106965 ?auto_106966 ) ) ( not ( = ?auto_106965 ?auto_106967 ) ) ( not ( = ?auto_106968 ?auto_106966 ) ) ( not ( = ?auto_106968 ?auto_106967 ) ) ( not ( = ?auto_106966 ?auto_106967 ) ) ( ON ?auto_106966 ?auto_106968 ) ( CLEAR ?auto_106966 ) ( HOLDING ?auto_106967 ) ( CLEAR ?auto_106969 ) ( ON-TABLE ?auto_106969 ) ( not ( = ?auto_106969 ?auto_106967 ) ) ( not ( = ?auto_106962 ?auto_106969 ) ) ( not ( = ?auto_106963 ?auto_106969 ) ) ( not ( = ?auto_106964 ?auto_106969 ) ) ( not ( = ?auto_106965 ?auto_106969 ) ) ( not ( = ?auto_106968 ?auto_106969 ) ) ( not ( = ?auto_106966 ?auto_106969 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106969 ?auto_106967 )
      ( MAKE-4PILE ?auto_106962 ?auto_106963 ?auto_106964 ?auto_106965 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108024 - BLOCK
      ?auto_108025 - BLOCK
      ?auto_108026 - BLOCK
      ?auto_108027 - BLOCK
    )
    :vars
    (
      ?auto_108028 - BLOCK
      ?auto_108030 - BLOCK
      ?auto_108029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108028 ?auto_108027 ) ( ON-TABLE ?auto_108024 ) ( ON ?auto_108025 ?auto_108024 ) ( ON ?auto_108026 ?auto_108025 ) ( ON ?auto_108027 ?auto_108026 ) ( not ( = ?auto_108024 ?auto_108025 ) ) ( not ( = ?auto_108024 ?auto_108026 ) ) ( not ( = ?auto_108024 ?auto_108027 ) ) ( not ( = ?auto_108024 ?auto_108028 ) ) ( not ( = ?auto_108025 ?auto_108026 ) ) ( not ( = ?auto_108025 ?auto_108027 ) ) ( not ( = ?auto_108025 ?auto_108028 ) ) ( not ( = ?auto_108026 ?auto_108027 ) ) ( not ( = ?auto_108026 ?auto_108028 ) ) ( not ( = ?auto_108027 ?auto_108028 ) ) ( not ( = ?auto_108024 ?auto_108030 ) ) ( not ( = ?auto_108024 ?auto_108029 ) ) ( not ( = ?auto_108025 ?auto_108030 ) ) ( not ( = ?auto_108025 ?auto_108029 ) ) ( not ( = ?auto_108026 ?auto_108030 ) ) ( not ( = ?auto_108026 ?auto_108029 ) ) ( not ( = ?auto_108027 ?auto_108030 ) ) ( not ( = ?auto_108027 ?auto_108029 ) ) ( not ( = ?auto_108028 ?auto_108030 ) ) ( not ( = ?auto_108028 ?auto_108029 ) ) ( not ( = ?auto_108030 ?auto_108029 ) ) ( ON ?auto_108030 ?auto_108028 ) ( ON ?auto_108029 ?auto_108030 ) ( CLEAR ?auto_108029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108024 ?auto_108025 ?auto_108026 ?auto_108027 ?auto_108028 ?auto_108030 )
      ( MAKE-4PILE ?auto_108024 ?auto_108025 ?auto_108026 ?auto_108027 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106978 - BLOCK
      ?auto_106979 - BLOCK
      ?auto_106980 - BLOCK
      ?auto_106981 - BLOCK
    )
    :vars
    (
      ?auto_106983 - BLOCK
      ?auto_106982 - BLOCK
      ?auto_106985 - BLOCK
      ?auto_106984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106983 ?auto_106981 ) ( ON-TABLE ?auto_106978 ) ( ON ?auto_106979 ?auto_106978 ) ( ON ?auto_106980 ?auto_106979 ) ( ON ?auto_106981 ?auto_106980 ) ( not ( = ?auto_106978 ?auto_106979 ) ) ( not ( = ?auto_106978 ?auto_106980 ) ) ( not ( = ?auto_106978 ?auto_106981 ) ) ( not ( = ?auto_106978 ?auto_106983 ) ) ( not ( = ?auto_106979 ?auto_106980 ) ) ( not ( = ?auto_106979 ?auto_106981 ) ) ( not ( = ?auto_106979 ?auto_106983 ) ) ( not ( = ?auto_106980 ?auto_106981 ) ) ( not ( = ?auto_106980 ?auto_106983 ) ) ( not ( = ?auto_106981 ?auto_106983 ) ) ( not ( = ?auto_106978 ?auto_106982 ) ) ( not ( = ?auto_106978 ?auto_106985 ) ) ( not ( = ?auto_106979 ?auto_106982 ) ) ( not ( = ?auto_106979 ?auto_106985 ) ) ( not ( = ?auto_106980 ?auto_106982 ) ) ( not ( = ?auto_106980 ?auto_106985 ) ) ( not ( = ?auto_106981 ?auto_106982 ) ) ( not ( = ?auto_106981 ?auto_106985 ) ) ( not ( = ?auto_106983 ?auto_106982 ) ) ( not ( = ?auto_106983 ?auto_106985 ) ) ( not ( = ?auto_106982 ?auto_106985 ) ) ( ON ?auto_106982 ?auto_106983 ) ( not ( = ?auto_106984 ?auto_106985 ) ) ( not ( = ?auto_106978 ?auto_106984 ) ) ( not ( = ?auto_106979 ?auto_106984 ) ) ( not ( = ?auto_106980 ?auto_106984 ) ) ( not ( = ?auto_106981 ?auto_106984 ) ) ( not ( = ?auto_106983 ?auto_106984 ) ) ( not ( = ?auto_106982 ?auto_106984 ) ) ( ON ?auto_106985 ?auto_106982 ) ( CLEAR ?auto_106985 ) ( HOLDING ?auto_106984 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106984 )
      ( MAKE-4PILE ?auto_106978 ?auto_106979 ?auto_106980 ?auto_106981 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106986 - BLOCK
      ?auto_106987 - BLOCK
      ?auto_106988 - BLOCK
      ?auto_106989 - BLOCK
    )
    :vars
    (
      ?auto_106990 - BLOCK
      ?auto_106993 - BLOCK
      ?auto_106992 - BLOCK
      ?auto_106991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106990 ?auto_106989 ) ( ON-TABLE ?auto_106986 ) ( ON ?auto_106987 ?auto_106986 ) ( ON ?auto_106988 ?auto_106987 ) ( ON ?auto_106989 ?auto_106988 ) ( not ( = ?auto_106986 ?auto_106987 ) ) ( not ( = ?auto_106986 ?auto_106988 ) ) ( not ( = ?auto_106986 ?auto_106989 ) ) ( not ( = ?auto_106986 ?auto_106990 ) ) ( not ( = ?auto_106987 ?auto_106988 ) ) ( not ( = ?auto_106987 ?auto_106989 ) ) ( not ( = ?auto_106987 ?auto_106990 ) ) ( not ( = ?auto_106988 ?auto_106989 ) ) ( not ( = ?auto_106988 ?auto_106990 ) ) ( not ( = ?auto_106989 ?auto_106990 ) ) ( not ( = ?auto_106986 ?auto_106993 ) ) ( not ( = ?auto_106986 ?auto_106992 ) ) ( not ( = ?auto_106987 ?auto_106993 ) ) ( not ( = ?auto_106987 ?auto_106992 ) ) ( not ( = ?auto_106988 ?auto_106993 ) ) ( not ( = ?auto_106988 ?auto_106992 ) ) ( not ( = ?auto_106989 ?auto_106993 ) ) ( not ( = ?auto_106989 ?auto_106992 ) ) ( not ( = ?auto_106990 ?auto_106993 ) ) ( not ( = ?auto_106990 ?auto_106992 ) ) ( not ( = ?auto_106993 ?auto_106992 ) ) ( ON ?auto_106993 ?auto_106990 ) ( not ( = ?auto_106991 ?auto_106992 ) ) ( not ( = ?auto_106986 ?auto_106991 ) ) ( not ( = ?auto_106987 ?auto_106991 ) ) ( not ( = ?auto_106988 ?auto_106991 ) ) ( not ( = ?auto_106989 ?auto_106991 ) ) ( not ( = ?auto_106990 ?auto_106991 ) ) ( not ( = ?auto_106993 ?auto_106991 ) ) ( ON ?auto_106992 ?auto_106993 ) ( ON ?auto_106991 ?auto_106992 ) ( CLEAR ?auto_106991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106986 ?auto_106987 ?auto_106988 ?auto_106989 ?auto_106990 ?auto_106993 ?auto_106992 )
      ( MAKE-4PILE ?auto_106986 ?auto_106987 ?auto_106988 ?auto_106989 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106998 - BLOCK
      ?auto_106999 - BLOCK
      ?auto_107000 - BLOCK
      ?auto_107001 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_107001 ) ( CLEAR ?auto_107000 ) ( ON-TABLE ?auto_106998 ) ( ON ?auto_106999 ?auto_106998 ) ( ON ?auto_107000 ?auto_106999 ) ( not ( = ?auto_106998 ?auto_106999 ) ) ( not ( = ?auto_106998 ?auto_107000 ) ) ( not ( = ?auto_106998 ?auto_107001 ) ) ( not ( = ?auto_106999 ?auto_107000 ) ) ( not ( = ?auto_106999 ?auto_107001 ) ) ( not ( = ?auto_107000 ?auto_107001 ) ) )
    :subtasks
    ( ( !STACK ?auto_107001 ?auto_107000 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107002 - BLOCK
      ?auto_107003 - BLOCK
      ?auto_107004 - BLOCK
      ?auto_107005 - BLOCK
    )
    :vars
    (
      ?auto_107006 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_107004 ) ( ON-TABLE ?auto_107002 ) ( ON ?auto_107003 ?auto_107002 ) ( ON ?auto_107004 ?auto_107003 ) ( not ( = ?auto_107002 ?auto_107003 ) ) ( not ( = ?auto_107002 ?auto_107004 ) ) ( not ( = ?auto_107002 ?auto_107005 ) ) ( not ( = ?auto_107003 ?auto_107004 ) ) ( not ( = ?auto_107003 ?auto_107005 ) ) ( not ( = ?auto_107004 ?auto_107005 ) ) ( ON ?auto_107005 ?auto_107006 ) ( CLEAR ?auto_107005 ) ( HAND-EMPTY ) ( not ( = ?auto_107002 ?auto_107006 ) ) ( not ( = ?auto_107003 ?auto_107006 ) ) ( not ( = ?auto_107004 ?auto_107006 ) ) ( not ( = ?auto_107005 ?auto_107006 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107005 ?auto_107006 )
      ( MAKE-4PILE ?auto_107002 ?auto_107003 ?auto_107004 ?auto_107005 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107007 - BLOCK
      ?auto_107008 - BLOCK
      ?auto_107009 - BLOCK
      ?auto_107010 - BLOCK
    )
    :vars
    (
      ?auto_107011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107007 ) ( ON ?auto_107008 ?auto_107007 ) ( not ( = ?auto_107007 ?auto_107008 ) ) ( not ( = ?auto_107007 ?auto_107009 ) ) ( not ( = ?auto_107007 ?auto_107010 ) ) ( not ( = ?auto_107008 ?auto_107009 ) ) ( not ( = ?auto_107008 ?auto_107010 ) ) ( not ( = ?auto_107009 ?auto_107010 ) ) ( ON ?auto_107010 ?auto_107011 ) ( CLEAR ?auto_107010 ) ( not ( = ?auto_107007 ?auto_107011 ) ) ( not ( = ?auto_107008 ?auto_107011 ) ) ( not ( = ?auto_107009 ?auto_107011 ) ) ( not ( = ?auto_107010 ?auto_107011 ) ) ( HOLDING ?auto_107009 ) ( CLEAR ?auto_107008 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107007 ?auto_107008 ?auto_107009 )
      ( MAKE-4PILE ?auto_107007 ?auto_107008 ?auto_107009 ?auto_107010 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107012 - BLOCK
      ?auto_107013 - BLOCK
      ?auto_107014 - BLOCK
      ?auto_107015 - BLOCK
    )
    :vars
    (
      ?auto_107016 - BLOCK
      ?auto_107019 - BLOCK
      ?auto_107018 - BLOCK
      ?auto_107017 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107012 ) ( ON ?auto_107013 ?auto_107012 ) ( not ( = ?auto_107012 ?auto_107013 ) ) ( not ( = ?auto_107012 ?auto_107014 ) ) ( not ( = ?auto_107012 ?auto_107015 ) ) ( not ( = ?auto_107013 ?auto_107014 ) ) ( not ( = ?auto_107013 ?auto_107015 ) ) ( not ( = ?auto_107014 ?auto_107015 ) ) ( ON ?auto_107015 ?auto_107016 ) ( not ( = ?auto_107012 ?auto_107016 ) ) ( not ( = ?auto_107013 ?auto_107016 ) ) ( not ( = ?auto_107014 ?auto_107016 ) ) ( not ( = ?auto_107015 ?auto_107016 ) ) ( CLEAR ?auto_107013 ) ( ON ?auto_107014 ?auto_107015 ) ( CLEAR ?auto_107014 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107019 ) ( ON ?auto_107018 ?auto_107019 ) ( ON ?auto_107017 ?auto_107018 ) ( ON ?auto_107016 ?auto_107017 ) ( not ( = ?auto_107019 ?auto_107018 ) ) ( not ( = ?auto_107019 ?auto_107017 ) ) ( not ( = ?auto_107019 ?auto_107016 ) ) ( not ( = ?auto_107019 ?auto_107015 ) ) ( not ( = ?auto_107019 ?auto_107014 ) ) ( not ( = ?auto_107018 ?auto_107017 ) ) ( not ( = ?auto_107018 ?auto_107016 ) ) ( not ( = ?auto_107018 ?auto_107015 ) ) ( not ( = ?auto_107018 ?auto_107014 ) ) ( not ( = ?auto_107017 ?auto_107016 ) ) ( not ( = ?auto_107017 ?auto_107015 ) ) ( not ( = ?auto_107017 ?auto_107014 ) ) ( not ( = ?auto_107012 ?auto_107019 ) ) ( not ( = ?auto_107012 ?auto_107018 ) ) ( not ( = ?auto_107012 ?auto_107017 ) ) ( not ( = ?auto_107013 ?auto_107019 ) ) ( not ( = ?auto_107013 ?auto_107018 ) ) ( not ( = ?auto_107013 ?auto_107017 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107019 ?auto_107018 ?auto_107017 ?auto_107016 ?auto_107015 )
      ( MAKE-4PILE ?auto_107012 ?auto_107013 ?auto_107014 ?auto_107015 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107020 - BLOCK
      ?auto_107021 - BLOCK
      ?auto_107022 - BLOCK
      ?auto_107023 - BLOCK
    )
    :vars
    (
      ?auto_107024 - BLOCK
      ?auto_107026 - BLOCK
      ?auto_107025 - BLOCK
      ?auto_107027 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107020 ) ( not ( = ?auto_107020 ?auto_107021 ) ) ( not ( = ?auto_107020 ?auto_107022 ) ) ( not ( = ?auto_107020 ?auto_107023 ) ) ( not ( = ?auto_107021 ?auto_107022 ) ) ( not ( = ?auto_107021 ?auto_107023 ) ) ( not ( = ?auto_107022 ?auto_107023 ) ) ( ON ?auto_107023 ?auto_107024 ) ( not ( = ?auto_107020 ?auto_107024 ) ) ( not ( = ?auto_107021 ?auto_107024 ) ) ( not ( = ?auto_107022 ?auto_107024 ) ) ( not ( = ?auto_107023 ?auto_107024 ) ) ( ON ?auto_107022 ?auto_107023 ) ( CLEAR ?auto_107022 ) ( ON-TABLE ?auto_107026 ) ( ON ?auto_107025 ?auto_107026 ) ( ON ?auto_107027 ?auto_107025 ) ( ON ?auto_107024 ?auto_107027 ) ( not ( = ?auto_107026 ?auto_107025 ) ) ( not ( = ?auto_107026 ?auto_107027 ) ) ( not ( = ?auto_107026 ?auto_107024 ) ) ( not ( = ?auto_107026 ?auto_107023 ) ) ( not ( = ?auto_107026 ?auto_107022 ) ) ( not ( = ?auto_107025 ?auto_107027 ) ) ( not ( = ?auto_107025 ?auto_107024 ) ) ( not ( = ?auto_107025 ?auto_107023 ) ) ( not ( = ?auto_107025 ?auto_107022 ) ) ( not ( = ?auto_107027 ?auto_107024 ) ) ( not ( = ?auto_107027 ?auto_107023 ) ) ( not ( = ?auto_107027 ?auto_107022 ) ) ( not ( = ?auto_107020 ?auto_107026 ) ) ( not ( = ?auto_107020 ?auto_107025 ) ) ( not ( = ?auto_107020 ?auto_107027 ) ) ( not ( = ?auto_107021 ?auto_107026 ) ) ( not ( = ?auto_107021 ?auto_107025 ) ) ( not ( = ?auto_107021 ?auto_107027 ) ) ( HOLDING ?auto_107021 ) ( CLEAR ?auto_107020 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107020 ?auto_107021 )
      ( MAKE-4PILE ?auto_107020 ?auto_107021 ?auto_107022 ?auto_107023 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107028 - BLOCK
      ?auto_107029 - BLOCK
      ?auto_107030 - BLOCK
      ?auto_107031 - BLOCK
    )
    :vars
    (
      ?auto_107032 - BLOCK
      ?auto_107033 - BLOCK
      ?auto_107035 - BLOCK
      ?auto_107034 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107028 ) ( not ( = ?auto_107028 ?auto_107029 ) ) ( not ( = ?auto_107028 ?auto_107030 ) ) ( not ( = ?auto_107028 ?auto_107031 ) ) ( not ( = ?auto_107029 ?auto_107030 ) ) ( not ( = ?auto_107029 ?auto_107031 ) ) ( not ( = ?auto_107030 ?auto_107031 ) ) ( ON ?auto_107031 ?auto_107032 ) ( not ( = ?auto_107028 ?auto_107032 ) ) ( not ( = ?auto_107029 ?auto_107032 ) ) ( not ( = ?auto_107030 ?auto_107032 ) ) ( not ( = ?auto_107031 ?auto_107032 ) ) ( ON ?auto_107030 ?auto_107031 ) ( ON-TABLE ?auto_107033 ) ( ON ?auto_107035 ?auto_107033 ) ( ON ?auto_107034 ?auto_107035 ) ( ON ?auto_107032 ?auto_107034 ) ( not ( = ?auto_107033 ?auto_107035 ) ) ( not ( = ?auto_107033 ?auto_107034 ) ) ( not ( = ?auto_107033 ?auto_107032 ) ) ( not ( = ?auto_107033 ?auto_107031 ) ) ( not ( = ?auto_107033 ?auto_107030 ) ) ( not ( = ?auto_107035 ?auto_107034 ) ) ( not ( = ?auto_107035 ?auto_107032 ) ) ( not ( = ?auto_107035 ?auto_107031 ) ) ( not ( = ?auto_107035 ?auto_107030 ) ) ( not ( = ?auto_107034 ?auto_107032 ) ) ( not ( = ?auto_107034 ?auto_107031 ) ) ( not ( = ?auto_107034 ?auto_107030 ) ) ( not ( = ?auto_107028 ?auto_107033 ) ) ( not ( = ?auto_107028 ?auto_107035 ) ) ( not ( = ?auto_107028 ?auto_107034 ) ) ( not ( = ?auto_107029 ?auto_107033 ) ) ( not ( = ?auto_107029 ?auto_107035 ) ) ( not ( = ?auto_107029 ?auto_107034 ) ) ( CLEAR ?auto_107028 ) ( ON ?auto_107029 ?auto_107030 ) ( CLEAR ?auto_107029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107033 ?auto_107035 ?auto_107034 ?auto_107032 ?auto_107031 ?auto_107030 )
      ( MAKE-4PILE ?auto_107028 ?auto_107029 ?auto_107030 ?auto_107031 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107036 - BLOCK
      ?auto_107037 - BLOCK
      ?auto_107038 - BLOCK
      ?auto_107039 - BLOCK
    )
    :vars
    (
      ?auto_107041 - BLOCK
      ?auto_107043 - BLOCK
      ?auto_107042 - BLOCK
      ?auto_107040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107036 ?auto_107037 ) ) ( not ( = ?auto_107036 ?auto_107038 ) ) ( not ( = ?auto_107036 ?auto_107039 ) ) ( not ( = ?auto_107037 ?auto_107038 ) ) ( not ( = ?auto_107037 ?auto_107039 ) ) ( not ( = ?auto_107038 ?auto_107039 ) ) ( ON ?auto_107039 ?auto_107041 ) ( not ( = ?auto_107036 ?auto_107041 ) ) ( not ( = ?auto_107037 ?auto_107041 ) ) ( not ( = ?auto_107038 ?auto_107041 ) ) ( not ( = ?auto_107039 ?auto_107041 ) ) ( ON ?auto_107038 ?auto_107039 ) ( ON-TABLE ?auto_107043 ) ( ON ?auto_107042 ?auto_107043 ) ( ON ?auto_107040 ?auto_107042 ) ( ON ?auto_107041 ?auto_107040 ) ( not ( = ?auto_107043 ?auto_107042 ) ) ( not ( = ?auto_107043 ?auto_107040 ) ) ( not ( = ?auto_107043 ?auto_107041 ) ) ( not ( = ?auto_107043 ?auto_107039 ) ) ( not ( = ?auto_107043 ?auto_107038 ) ) ( not ( = ?auto_107042 ?auto_107040 ) ) ( not ( = ?auto_107042 ?auto_107041 ) ) ( not ( = ?auto_107042 ?auto_107039 ) ) ( not ( = ?auto_107042 ?auto_107038 ) ) ( not ( = ?auto_107040 ?auto_107041 ) ) ( not ( = ?auto_107040 ?auto_107039 ) ) ( not ( = ?auto_107040 ?auto_107038 ) ) ( not ( = ?auto_107036 ?auto_107043 ) ) ( not ( = ?auto_107036 ?auto_107042 ) ) ( not ( = ?auto_107036 ?auto_107040 ) ) ( not ( = ?auto_107037 ?auto_107043 ) ) ( not ( = ?auto_107037 ?auto_107042 ) ) ( not ( = ?auto_107037 ?auto_107040 ) ) ( ON ?auto_107037 ?auto_107038 ) ( CLEAR ?auto_107037 ) ( HOLDING ?auto_107036 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107036 )
      ( MAKE-4PILE ?auto_107036 ?auto_107037 ?auto_107038 ?auto_107039 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107044 - BLOCK
      ?auto_107045 - BLOCK
      ?auto_107046 - BLOCK
      ?auto_107047 - BLOCK
    )
    :vars
    (
      ?auto_107049 - BLOCK
      ?auto_107051 - BLOCK
      ?auto_107048 - BLOCK
      ?auto_107050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107044 ?auto_107045 ) ) ( not ( = ?auto_107044 ?auto_107046 ) ) ( not ( = ?auto_107044 ?auto_107047 ) ) ( not ( = ?auto_107045 ?auto_107046 ) ) ( not ( = ?auto_107045 ?auto_107047 ) ) ( not ( = ?auto_107046 ?auto_107047 ) ) ( ON ?auto_107047 ?auto_107049 ) ( not ( = ?auto_107044 ?auto_107049 ) ) ( not ( = ?auto_107045 ?auto_107049 ) ) ( not ( = ?auto_107046 ?auto_107049 ) ) ( not ( = ?auto_107047 ?auto_107049 ) ) ( ON ?auto_107046 ?auto_107047 ) ( ON-TABLE ?auto_107051 ) ( ON ?auto_107048 ?auto_107051 ) ( ON ?auto_107050 ?auto_107048 ) ( ON ?auto_107049 ?auto_107050 ) ( not ( = ?auto_107051 ?auto_107048 ) ) ( not ( = ?auto_107051 ?auto_107050 ) ) ( not ( = ?auto_107051 ?auto_107049 ) ) ( not ( = ?auto_107051 ?auto_107047 ) ) ( not ( = ?auto_107051 ?auto_107046 ) ) ( not ( = ?auto_107048 ?auto_107050 ) ) ( not ( = ?auto_107048 ?auto_107049 ) ) ( not ( = ?auto_107048 ?auto_107047 ) ) ( not ( = ?auto_107048 ?auto_107046 ) ) ( not ( = ?auto_107050 ?auto_107049 ) ) ( not ( = ?auto_107050 ?auto_107047 ) ) ( not ( = ?auto_107050 ?auto_107046 ) ) ( not ( = ?auto_107044 ?auto_107051 ) ) ( not ( = ?auto_107044 ?auto_107048 ) ) ( not ( = ?auto_107044 ?auto_107050 ) ) ( not ( = ?auto_107045 ?auto_107051 ) ) ( not ( = ?auto_107045 ?auto_107048 ) ) ( not ( = ?auto_107045 ?auto_107050 ) ) ( ON ?auto_107045 ?auto_107046 ) ( ON ?auto_107044 ?auto_107045 ) ( CLEAR ?auto_107044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107051 ?auto_107048 ?auto_107050 ?auto_107049 ?auto_107047 ?auto_107046 ?auto_107045 )
      ( MAKE-4PILE ?auto_107044 ?auto_107045 ?auto_107046 ?auto_107047 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107055 - BLOCK
      ?auto_107056 - BLOCK
      ?auto_107057 - BLOCK
    )
    :vars
    (
      ?auto_107058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107058 ?auto_107057 ) ( CLEAR ?auto_107058 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107055 ) ( ON ?auto_107056 ?auto_107055 ) ( ON ?auto_107057 ?auto_107056 ) ( not ( = ?auto_107055 ?auto_107056 ) ) ( not ( = ?auto_107055 ?auto_107057 ) ) ( not ( = ?auto_107055 ?auto_107058 ) ) ( not ( = ?auto_107056 ?auto_107057 ) ) ( not ( = ?auto_107056 ?auto_107058 ) ) ( not ( = ?auto_107057 ?auto_107058 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107058 ?auto_107057 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107059 - BLOCK
      ?auto_107060 - BLOCK
      ?auto_107061 - BLOCK
    )
    :vars
    (
      ?auto_107062 - BLOCK
      ?auto_107063 - BLOCK
      ?auto_107064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107062 ?auto_107061 ) ( CLEAR ?auto_107062 ) ( ON-TABLE ?auto_107059 ) ( ON ?auto_107060 ?auto_107059 ) ( ON ?auto_107061 ?auto_107060 ) ( not ( = ?auto_107059 ?auto_107060 ) ) ( not ( = ?auto_107059 ?auto_107061 ) ) ( not ( = ?auto_107059 ?auto_107062 ) ) ( not ( = ?auto_107060 ?auto_107061 ) ) ( not ( = ?auto_107060 ?auto_107062 ) ) ( not ( = ?auto_107061 ?auto_107062 ) ) ( HOLDING ?auto_107063 ) ( CLEAR ?auto_107064 ) ( not ( = ?auto_107059 ?auto_107063 ) ) ( not ( = ?auto_107059 ?auto_107064 ) ) ( not ( = ?auto_107060 ?auto_107063 ) ) ( not ( = ?auto_107060 ?auto_107064 ) ) ( not ( = ?auto_107061 ?auto_107063 ) ) ( not ( = ?auto_107061 ?auto_107064 ) ) ( not ( = ?auto_107062 ?auto_107063 ) ) ( not ( = ?auto_107062 ?auto_107064 ) ) ( not ( = ?auto_107063 ?auto_107064 ) ) )
    :subtasks
    ( ( !STACK ?auto_107063 ?auto_107064 )
      ( MAKE-3PILE ?auto_107059 ?auto_107060 ?auto_107061 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107065 - BLOCK
      ?auto_107066 - BLOCK
      ?auto_107067 - BLOCK
    )
    :vars
    (
      ?auto_107069 - BLOCK
      ?auto_107068 - BLOCK
      ?auto_107070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107069 ?auto_107067 ) ( ON-TABLE ?auto_107065 ) ( ON ?auto_107066 ?auto_107065 ) ( ON ?auto_107067 ?auto_107066 ) ( not ( = ?auto_107065 ?auto_107066 ) ) ( not ( = ?auto_107065 ?auto_107067 ) ) ( not ( = ?auto_107065 ?auto_107069 ) ) ( not ( = ?auto_107066 ?auto_107067 ) ) ( not ( = ?auto_107066 ?auto_107069 ) ) ( not ( = ?auto_107067 ?auto_107069 ) ) ( CLEAR ?auto_107068 ) ( not ( = ?auto_107065 ?auto_107070 ) ) ( not ( = ?auto_107065 ?auto_107068 ) ) ( not ( = ?auto_107066 ?auto_107070 ) ) ( not ( = ?auto_107066 ?auto_107068 ) ) ( not ( = ?auto_107067 ?auto_107070 ) ) ( not ( = ?auto_107067 ?auto_107068 ) ) ( not ( = ?auto_107069 ?auto_107070 ) ) ( not ( = ?auto_107069 ?auto_107068 ) ) ( not ( = ?auto_107070 ?auto_107068 ) ) ( ON ?auto_107070 ?auto_107069 ) ( CLEAR ?auto_107070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107065 ?auto_107066 ?auto_107067 ?auto_107069 )
      ( MAKE-3PILE ?auto_107065 ?auto_107066 ?auto_107067 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107071 - BLOCK
      ?auto_107072 - BLOCK
      ?auto_107073 - BLOCK
    )
    :vars
    (
      ?auto_107076 - BLOCK
      ?auto_107075 - BLOCK
      ?auto_107074 - BLOCK
      ?auto_107078 - BLOCK
      ?auto_107077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107076 ?auto_107073 ) ( ON-TABLE ?auto_107071 ) ( ON ?auto_107072 ?auto_107071 ) ( ON ?auto_107073 ?auto_107072 ) ( not ( = ?auto_107071 ?auto_107072 ) ) ( not ( = ?auto_107071 ?auto_107073 ) ) ( not ( = ?auto_107071 ?auto_107076 ) ) ( not ( = ?auto_107072 ?auto_107073 ) ) ( not ( = ?auto_107072 ?auto_107076 ) ) ( not ( = ?auto_107073 ?auto_107076 ) ) ( not ( = ?auto_107071 ?auto_107075 ) ) ( not ( = ?auto_107071 ?auto_107074 ) ) ( not ( = ?auto_107072 ?auto_107075 ) ) ( not ( = ?auto_107072 ?auto_107074 ) ) ( not ( = ?auto_107073 ?auto_107075 ) ) ( not ( = ?auto_107073 ?auto_107074 ) ) ( not ( = ?auto_107076 ?auto_107075 ) ) ( not ( = ?auto_107076 ?auto_107074 ) ) ( not ( = ?auto_107075 ?auto_107074 ) ) ( ON ?auto_107075 ?auto_107076 ) ( CLEAR ?auto_107075 ) ( HOLDING ?auto_107074 ) ( CLEAR ?auto_107078 ) ( ON-TABLE ?auto_107077 ) ( ON ?auto_107078 ?auto_107077 ) ( not ( = ?auto_107077 ?auto_107078 ) ) ( not ( = ?auto_107077 ?auto_107074 ) ) ( not ( = ?auto_107078 ?auto_107074 ) ) ( not ( = ?auto_107071 ?auto_107078 ) ) ( not ( = ?auto_107071 ?auto_107077 ) ) ( not ( = ?auto_107072 ?auto_107078 ) ) ( not ( = ?auto_107072 ?auto_107077 ) ) ( not ( = ?auto_107073 ?auto_107078 ) ) ( not ( = ?auto_107073 ?auto_107077 ) ) ( not ( = ?auto_107076 ?auto_107078 ) ) ( not ( = ?auto_107076 ?auto_107077 ) ) ( not ( = ?auto_107075 ?auto_107078 ) ) ( not ( = ?auto_107075 ?auto_107077 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107077 ?auto_107078 ?auto_107074 )
      ( MAKE-3PILE ?auto_107071 ?auto_107072 ?auto_107073 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107079 - BLOCK
      ?auto_107080 - BLOCK
      ?auto_107081 - BLOCK
    )
    :vars
    (
      ?auto_107085 - BLOCK
      ?auto_107083 - BLOCK
      ?auto_107084 - BLOCK
      ?auto_107086 - BLOCK
      ?auto_107082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107085 ?auto_107081 ) ( ON-TABLE ?auto_107079 ) ( ON ?auto_107080 ?auto_107079 ) ( ON ?auto_107081 ?auto_107080 ) ( not ( = ?auto_107079 ?auto_107080 ) ) ( not ( = ?auto_107079 ?auto_107081 ) ) ( not ( = ?auto_107079 ?auto_107085 ) ) ( not ( = ?auto_107080 ?auto_107081 ) ) ( not ( = ?auto_107080 ?auto_107085 ) ) ( not ( = ?auto_107081 ?auto_107085 ) ) ( not ( = ?auto_107079 ?auto_107083 ) ) ( not ( = ?auto_107079 ?auto_107084 ) ) ( not ( = ?auto_107080 ?auto_107083 ) ) ( not ( = ?auto_107080 ?auto_107084 ) ) ( not ( = ?auto_107081 ?auto_107083 ) ) ( not ( = ?auto_107081 ?auto_107084 ) ) ( not ( = ?auto_107085 ?auto_107083 ) ) ( not ( = ?auto_107085 ?auto_107084 ) ) ( not ( = ?auto_107083 ?auto_107084 ) ) ( ON ?auto_107083 ?auto_107085 ) ( CLEAR ?auto_107086 ) ( ON-TABLE ?auto_107082 ) ( ON ?auto_107086 ?auto_107082 ) ( not ( = ?auto_107082 ?auto_107086 ) ) ( not ( = ?auto_107082 ?auto_107084 ) ) ( not ( = ?auto_107086 ?auto_107084 ) ) ( not ( = ?auto_107079 ?auto_107086 ) ) ( not ( = ?auto_107079 ?auto_107082 ) ) ( not ( = ?auto_107080 ?auto_107086 ) ) ( not ( = ?auto_107080 ?auto_107082 ) ) ( not ( = ?auto_107081 ?auto_107086 ) ) ( not ( = ?auto_107081 ?auto_107082 ) ) ( not ( = ?auto_107085 ?auto_107086 ) ) ( not ( = ?auto_107085 ?auto_107082 ) ) ( not ( = ?auto_107083 ?auto_107086 ) ) ( not ( = ?auto_107083 ?auto_107082 ) ) ( ON ?auto_107084 ?auto_107083 ) ( CLEAR ?auto_107084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107079 ?auto_107080 ?auto_107081 ?auto_107085 ?auto_107083 )
      ( MAKE-3PILE ?auto_107079 ?auto_107080 ?auto_107081 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107087 - BLOCK
      ?auto_107088 - BLOCK
      ?auto_107089 - BLOCK
    )
    :vars
    (
      ?auto_107091 - BLOCK
      ?auto_107094 - BLOCK
      ?auto_107090 - BLOCK
      ?auto_107093 - BLOCK
      ?auto_107092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107091 ?auto_107089 ) ( ON-TABLE ?auto_107087 ) ( ON ?auto_107088 ?auto_107087 ) ( ON ?auto_107089 ?auto_107088 ) ( not ( = ?auto_107087 ?auto_107088 ) ) ( not ( = ?auto_107087 ?auto_107089 ) ) ( not ( = ?auto_107087 ?auto_107091 ) ) ( not ( = ?auto_107088 ?auto_107089 ) ) ( not ( = ?auto_107088 ?auto_107091 ) ) ( not ( = ?auto_107089 ?auto_107091 ) ) ( not ( = ?auto_107087 ?auto_107094 ) ) ( not ( = ?auto_107087 ?auto_107090 ) ) ( not ( = ?auto_107088 ?auto_107094 ) ) ( not ( = ?auto_107088 ?auto_107090 ) ) ( not ( = ?auto_107089 ?auto_107094 ) ) ( not ( = ?auto_107089 ?auto_107090 ) ) ( not ( = ?auto_107091 ?auto_107094 ) ) ( not ( = ?auto_107091 ?auto_107090 ) ) ( not ( = ?auto_107094 ?auto_107090 ) ) ( ON ?auto_107094 ?auto_107091 ) ( ON-TABLE ?auto_107093 ) ( not ( = ?auto_107093 ?auto_107092 ) ) ( not ( = ?auto_107093 ?auto_107090 ) ) ( not ( = ?auto_107092 ?auto_107090 ) ) ( not ( = ?auto_107087 ?auto_107092 ) ) ( not ( = ?auto_107087 ?auto_107093 ) ) ( not ( = ?auto_107088 ?auto_107092 ) ) ( not ( = ?auto_107088 ?auto_107093 ) ) ( not ( = ?auto_107089 ?auto_107092 ) ) ( not ( = ?auto_107089 ?auto_107093 ) ) ( not ( = ?auto_107091 ?auto_107092 ) ) ( not ( = ?auto_107091 ?auto_107093 ) ) ( not ( = ?auto_107094 ?auto_107092 ) ) ( not ( = ?auto_107094 ?auto_107093 ) ) ( ON ?auto_107090 ?auto_107094 ) ( CLEAR ?auto_107090 ) ( HOLDING ?auto_107092 ) ( CLEAR ?auto_107093 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107093 ?auto_107092 )
      ( MAKE-3PILE ?auto_107087 ?auto_107088 ?auto_107089 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108272 - BLOCK
      ?auto_108273 - BLOCK
      ?auto_108274 - BLOCK
    )
    :vars
    (
      ?auto_108277 - BLOCK
      ?auto_108278 - BLOCK
      ?auto_108276 - BLOCK
      ?auto_108275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108277 ?auto_108274 ) ( ON-TABLE ?auto_108272 ) ( ON ?auto_108273 ?auto_108272 ) ( ON ?auto_108274 ?auto_108273 ) ( not ( = ?auto_108272 ?auto_108273 ) ) ( not ( = ?auto_108272 ?auto_108274 ) ) ( not ( = ?auto_108272 ?auto_108277 ) ) ( not ( = ?auto_108273 ?auto_108274 ) ) ( not ( = ?auto_108273 ?auto_108277 ) ) ( not ( = ?auto_108274 ?auto_108277 ) ) ( not ( = ?auto_108272 ?auto_108278 ) ) ( not ( = ?auto_108272 ?auto_108276 ) ) ( not ( = ?auto_108273 ?auto_108278 ) ) ( not ( = ?auto_108273 ?auto_108276 ) ) ( not ( = ?auto_108274 ?auto_108278 ) ) ( not ( = ?auto_108274 ?auto_108276 ) ) ( not ( = ?auto_108277 ?auto_108278 ) ) ( not ( = ?auto_108277 ?auto_108276 ) ) ( not ( = ?auto_108278 ?auto_108276 ) ) ( ON ?auto_108278 ?auto_108277 ) ( not ( = ?auto_108275 ?auto_108276 ) ) ( not ( = ?auto_108272 ?auto_108275 ) ) ( not ( = ?auto_108273 ?auto_108275 ) ) ( not ( = ?auto_108274 ?auto_108275 ) ) ( not ( = ?auto_108277 ?auto_108275 ) ) ( not ( = ?auto_108278 ?auto_108275 ) ) ( ON ?auto_108276 ?auto_108278 ) ( ON ?auto_108275 ?auto_108276 ) ( CLEAR ?auto_108275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108272 ?auto_108273 ?auto_108274 ?auto_108277 ?auto_108278 ?auto_108276 )
      ( MAKE-3PILE ?auto_108272 ?auto_108273 ?auto_108274 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107103 - BLOCK
      ?auto_107104 - BLOCK
      ?auto_107105 - BLOCK
    )
    :vars
    (
      ?auto_107106 - BLOCK
      ?auto_107109 - BLOCK
      ?auto_107107 - BLOCK
      ?auto_107108 - BLOCK
      ?auto_107110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107106 ?auto_107105 ) ( ON-TABLE ?auto_107103 ) ( ON ?auto_107104 ?auto_107103 ) ( ON ?auto_107105 ?auto_107104 ) ( not ( = ?auto_107103 ?auto_107104 ) ) ( not ( = ?auto_107103 ?auto_107105 ) ) ( not ( = ?auto_107103 ?auto_107106 ) ) ( not ( = ?auto_107104 ?auto_107105 ) ) ( not ( = ?auto_107104 ?auto_107106 ) ) ( not ( = ?auto_107105 ?auto_107106 ) ) ( not ( = ?auto_107103 ?auto_107109 ) ) ( not ( = ?auto_107103 ?auto_107107 ) ) ( not ( = ?auto_107104 ?auto_107109 ) ) ( not ( = ?auto_107104 ?auto_107107 ) ) ( not ( = ?auto_107105 ?auto_107109 ) ) ( not ( = ?auto_107105 ?auto_107107 ) ) ( not ( = ?auto_107106 ?auto_107109 ) ) ( not ( = ?auto_107106 ?auto_107107 ) ) ( not ( = ?auto_107109 ?auto_107107 ) ) ( ON ?auto_107109 ?auto_107106 ) ( not ( = ?auto_107108 ?auto_107110 ) ) ( not ( = ?auto_107108 ?auto_107107 ) ) ( not ( = ?auto_107110 ?auto_107107 ) ) ( not ( = ?auto_107103 ?auto_107110 ) ) ( not ( = ?auto_107103 ?auto_107108 ) ) ( not ( = ?auto_107104 ?auto_107110 ) ) ( not ( = ?auto_107104 ?auto_107108 ) ) ( not ( = ?auto_107105 ?auto_107110 ) ) ( not ( = ?auto_107105 ?auto_107108 ) ) ( not ( = ?auto_107106 ?auto_107110 ) ) ( not ( = ?auto_107106 ?auto_107108 ) ) ( not ( = ?auto_107109 ?auto_107110 ) ) ( not ( = ?auto_107109 ?auto_107108 ) ) ( ON ?auto_107107 ?auto_107109 ) ( ON ?auto_107110 ?auto_107107 ) ( CLEAR ?auto_107110 ) ( HOLDING ?auto_107108 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107108 )
      ( MAKE-3PILE ?auto_107103 ?auto_107104 ?auto_107105 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107111 - BLOCK
      ?auto_107112 - BLOCK
      ?auto_107113 - BLOCK
    )
    :vars
    (
      ?auto_107115 - BLOCK
      ?auto_107118 - BLOCK
      ?auto_107116 - BLOCK
      ?auto_107117 - BLOCK
      ?auto_107114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107115 ?auto_107113 ) ( ON-TABLE ?auto_107111 ) ( ON ?auto_107112 ?auto_107111 ) ( ON ?auto_107113 ?auto_107112 ) ( not ( = ?auto_107111 ?auto_107112 ) ) ( not ( = ?auto_107111 ?auto_107113 ) ) ( not ( = ?auto_107111 ?auto_107115 ) ) ( not ( = ?auto_107112 ?auto_107113 ) ) ( not ( = ?auto_107112 ?auto_107115 ) ) ( not ( = ?auto_107113 ?auto_107115 ) ) ( not ( = ?auto_107111 ?auto_107118 ) ) ( not ( = ?auto_107111 ?auto_107116 ) ) ( not ( = ?auto_107112 ?auto_107118 ) ) ( not ( = ?auto_107112 ?auto_107116 ) ) ( not ( = ?auto_107113 ?auto_107118 ) ) ( not ( = ?auto_107113 ?auto_107116 ) ) ( not ( = ?auto_107115 ?auto_107118 ) ) ( not ( = ?auto_107115 ?auto_107116 ) ) ( not ( = ?auto_107118 ?auto_107116 ) ) ( ON ?auto_107118 ?auto_107115 ) ( not ( = ?auto_107117 ?auto_107114 ) ) ( not ( = ?auto_107117 ?auto_107116 ) ) ( not ( = ?auto_107114 ?auto_107116 ) ) ( not ( = ?auto_107111 ?auto_107114 ) ) ( not ( = ?auto_107111 ?auto_107117 ) ) ( not ( = ?auto_107112 ?auto_107114 ) ) ( not ( = ?auto_107112 ?auto_107117 ) ) ( not ( = ?auto_107113 ?auto_107114 ) ) ( not ( = ?auto_107113 ?auto_107117 ) ) ( not ( = ?auto_107115 ?auto_107114 ) ) ( not ( = ?auto_107115 ?auto_107117 ) ) ( not ( = ?auto_107118 ?auto_107114 ) ) ( not ( = ?auto_107118 ?auto_107117 ) ) ( ON ?auto_107116 ?auto_107118 ) ( ON ?auto_107114 ?auto_107116 ) ( ON ?auto_107117 ?auto_107114 ) ( CLEAR ?auto_107117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107111 ?auto_107112 ?auto_107113 ?auto_107115 ?auto_107118 ?auto_107116 ?auto_107114 )
      ( MAKE-3PILE ?auto_107111 ?auto_107112 ?auto_107113 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107124 - BLOCK
      ?auto_107125 - BLOCK
      ?auto_107126 - BLOCK
      ?auto_107127 - BLOCK
      ?auto_107128 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_107128 ) ( CLEAR ?auto_107127 ) ( ON-TABLE ?auto_107124 ) ( ON ?auto_107125 ?auto_107124 ) ( ON ?auto_107126 ?auto_107125 ) ( ON ?auto_107127 ?auto_107126 ) ( not ( = ?auto_107124 ?auto_107125 ) ) ( not ( = ?auto_107124 ?auto_107126 ) ) ( not ( = ?auto_107124 ?auto_107127 ) ) ( not ( = ?auto_107124 ?auto_107128 ) ) ( not ( = ?auto_107125 ?auto_107126 ) ) ( not ( = ?auto_107125 ?auto_107127 ) ) ( not ( = ?auto_107125 ?auto_107128 ) ) ( not ( = ?auto_107126 ?auto_107127 ) ) ( not ( = ?auto_107126 ?auto_107128 ) ) ( not ( = ?auto_107127 ?auto_107128 ) ) )
    :subtasks
    ( ( !STACK ?auto_107128 ?auto_107127 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107129 - BLOCK
      ?auto_107130 - BLOCK
      ?auto_107131 - BLOCK
      ?auto_107132 - BLOCK
      ?auto_107133 - BLOCK
    )
    :vars
    (
      ?auto_107134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_107132 ) ( ON-TABLE ?auto_107129 ) ( ON ?auto_107130 ?auto_107129 ) ( ON ?auto_107131 ?auto_107130 ) ( ON ?auto_107132 ?auto_107131 ) ( not ( = ?auto_107129 ?auto_107130 ) ) ( not ( = ?auto_107129 ?auto_107131 ) ) ( not ( = ?auto_107129 ?auto_107132 ) ) ( not ( = ?auto_107129 ?auto_107133 ) ) ( not ( = ?auto_107130 ?auto_107131 ) ) ( not ( = ?auto_107130 ?auto_107132 ) ) ( not ( = ?auto_107130 ?auto_107133 ) ) ( not ( = ?auto_107131 ?auto_107132 ) ) ( not ( = ?auto_107131 ?auto_107133 ) ) ( not ( = ?auto_107132 ?auto_107133 ) ) ( ON ?auto_107133 ?auto_107134 ) ( CLEAR ?auto_107133 ) ( HAND-EMPTY ) ( not ( = ?auto_107129 ?auto_107134 ) ) ( not ( = ?auto_107130 ?auto_107134 ) ) ( not ( = ?auto_107131 ?auto_107134 ) ) ( not ( = ?auto_107132 ?auto_107134 ) ) ( not ( = ?auto_107133 ?auto_107134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107133 ?auto_107134 )
      ( MAKE-5PILE ?auto_107129 ?auto_107130 ?auto_107131 ?auto_107132 ?auto_107133 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107135 - BLOCK
      ?auto_107136 - BLOCK
      ?auto_107137 - BLOCK
      ?auto_107138 - BLOCK
      ?auto_107139 - BLOCK
    )
    :vars
    (
      ?auto_107140 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107135 ) ( ON ?auto_107136 ?auto_107135 ) ( ON ?auto_107137 ?auto_107136 ) ( not ( = ?auto_107135 ?auto_107136 ) ) ( not ( = ?auto_107135 ?auto_107137 ) ) ( not ( = ?auto_107135 ?auto_107138 ) ) ( not ( = ?auto_107135 ?auto_107139 ) ) ( not ( = ?auto_107136 ?auto_107137 ) ) ( not ( = ?auto_107136 ?auto_107138 ) ) ( not ( = ?auto_107136 ?auto_107139 ) ) ( not ( = ?auto_107137 ?auto_107138 ) ) ( not ( = ?auto_107137 ?auto_107139 ) ) ( not ( = ?auto_107138 ?auto_107139 ) ) ( ON ?auto_107139 ?auto_107140 ) ( CLEAR ?auto_107139 ) ( not ( = ?auto_107135 ?auto_107140 ) ) ( not ( = ?auto_107136 ?auto_107140 ) ) ( not ( = ?auto_107137 ?auto_107140 ) ) ( not ( = ?auto_107138 ?auto_107140 ) ) ( not ( = ?auto_107139 ?auto_107140 ) ) ( HOLDING ?auto_107138 ) ( CLEAR ?auto_107137 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107135 ?auto_107136 ?auto_107137 ?auto_107138 )
      ( MAKE-5PILE ?auto_107135 ?auto_107136 ?auto_107137 ?auto_107138 ?auto_107139 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107141 - BLOCK
      ?auto_107142 - BLOCK
      ?auto_107143 - BLOCK
      ?auto_107144 - BLOCK
      ?auto_107145 - BLOCK
    )
    :vars
    (
      ?auto_107146 - BLOCK
      ?auto_107148 - BLOCK
      ?auto_107147 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107141 ) ( ON ?auto_107142 ?auto_107141 ) ( ON ?auto_107143 ?auto_107142 ) ( not ( = ?auto_107141 ?auto_107142 ) ) ( not ( = ?auto_107141 ?auto_107143 ) ) ( not ( = ?auto_107141 ?auto_107144 ) ) ( not ( = ?auto_107141 ?auto_107145 ) ) ( not ( = ?auto_107142 ?auto_107143 ) ) ( not ( = ?auto_107142 ?auto_107144 ) ) ( not ( = ?auto_107142 ?auto_107145 ) ) ( not ( = ?auto_107143 ?auto_107144 ) ) ( not ( = ?auto_107143 ?auto_107145 ) ) ( not ( = ?auto_107144 ?auto_107145 ) ) ( ON ?auto_107145 ?auto_107146 ) ( not ( = ?auto_107141 ?auto_107146 ) ) ( not ( = ?auto_107142 ?auto_107146 ) ) ( not ( = ?auto_107143 ?auto_107146 ) ) ( not ( = ?auto_107144 ?auto_107146 ) ) ( not ( = ?auto_107145 ?auto_107146 ) ) ( CLEAR ?auto_107143 ) ( ON ?auto_107144 ?auto_107145 ) ( CLEAR ?auto_107144 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107148 ) ( ON ?auto_107147 ?auto_107148 ) ( ON ?auto_107146 ?auto_107147 ) ( not ( = ?auto_107148 ?auto_107147 ) ) ( not ( = ?auto_107148 ?auto_107146 ) ) ( not ( = ?auto_107148 ?auto_107145 ) ) ( not ( = ?auto_107148 ?auto_107144 ) ) ( not ( = ?auto_107147 ?auto_107146 ) ) ( not ( = ?auto_107147 ?auto_107145 ) ) ( not ( = ?auto_107147 ?auto_107144 ) ) ( not ( = ?auto_107141 ?auto_107148 ) ) ( not ( = ?auto_107141 ?auto_107147 ) ) ( not ( = ?auto_107142 ?auto_107148 ) ) ( not ( = ?auto_107142 ?auto_107147 ) ) ( not ( = ?auto_107143 ?auto_107148 ) ) ( not ( = ?auto_107143 ?auto_107147 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107148 ?auto_107147 ?auto_107146 ?auto_107145 )
      ( MAKE-5PILE ?auto_107141 ?auto_107142 ?auto_107143 ?auto_107144 ?auto_107145 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107149 - BLOCK
      ?auto_107150 - BLOCK
      ?auto_107151 - BLOCK
      ?auto_107152 - BLOCK
      ?auto_107153 - BLOCK
    )
    :vars
    (
      ?auto_107154 - BLOCK
      ?auto_107156 - BLOCK
      ?auto_107155 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107149 ) ( ON ?auto_107150 ?auto_107149 ) ( not ( = ?auto_107149 ?auto_107150 ) ) ( not ( = ?auto_107149 ?auto_107151 ) ) ( not ( = ?auto_107149 ?auto_107152 ) ) ( not ( = ?auto_107149 ?auto_107153 ) ) ( not ( = ?auto_107150 ?auto_107151 ) ) ( not ( = ?auto_107150 ?auto_107152 ) ) ( not ( = ?auto_107150 ?auto_107153 ) ) ( not ( = ?auto_107151 ?auto_107152 ) ) ( not ( = ?auto_107151 ?auto_107153 ) ) ( not ( = ?auto_107152 ?auto_107153 ) ) ( ON ?auto_107153 ?auto_107154 ) ( not ( = ?auto_107149 ?auto_107154 ) ) ( not ( = ?auto_107150 ?auto_107154 ) ) ( not ( = ?auto_107151 ?auto_107154 ) ) ( not ( = ?auto_107152 ?auto_107154 ) ) ( not ( = ?auto_107153 ?auto_107154 ) ) ( ON ?auto_107152 ?auto_107153 ) ( CLEAR ?auto_107152 ) ( ON-TABLE ?auto_107156 ) ( ON ?auto_107155 ?auto_107156 ) ( ON ?auto_107154 ?auto_107155 ) ( not ( = ?auto_107156 ?auto_107155 ) ) ( not ( = ?auto_107156 ?auto_107154 ) ) ( not ( = ?auto_107156 ?auto_107153 ) ) ( not ( = ?auto_107156 ?auto_107152 ) ) ( not ( = ?auto_107155 ?auto_107154 ) ) ( not ( = ?auto_107155 ?auto_107153 ) ) ( not ( = ?auto_107155 ?auto_107152 ) ) ( not ( = ?auto_107149 ?auto_107156 ) ) ( not ( = ?auto_107149 ?auto_107155 ) ) ( not ( = ?auto_107150 ?auto_107156 ) ) ( not ( = ?auto_107150 ?auto_107155 ) ) ( not ( = ?auto_107151 ?auto_107156 ) ) ( not ( = ?auto_107151 ?auto_107155 ) ) ( HOLDING ?auto_107151 ) ( CLEAR ?auto_107150 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107149 ?auto_107150 ?auto_107151 )
      ( MAKE-5PILE ?auto_107149 ?auto_107150 ?auto_107151 ?auto_107152 ?auto_107153 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107157 - BLOCK
      ?auto_107158 - BLOCK
      ?auto_107159 - BLOCK
      ?auto_107160 - BLOCK
      ?auto_107161 - BLOCK
    )
    :vars
    (
      ?auto_107164 - BLOCK
      ?auto_107163 - BLOCK
      ?auto_107162 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107157 ) ( ON ?auto_107158 ?auto_107157 ) ( not ( = ?auto_107157 ?auto_107158 ) ) ( not ( = ?auto_107157 ?auto_107159 ) ) ( not ( = ?auto_107157 ?auto_107160 ) ) ( not ( = ?auto_107157 ?auto_107161 ) ) ( not ( = ?auto_107158 ?auto_107159 ) ) ( not ( = ?auto_107158 ?auto_107160 ) ) ( not ( = ?auto_107158 ?auto_107161 ) ) ( not ( = ?auto_107159 ?auto_107160 ) ) ( not ( = ?auto_107159 ?auto_107161 ) ) ( not ( = ?auto_107160 ?auto_107161 ) ) ( ON ?auto_107161 ?auto_107164 ) ( not ( = ?auto_107157 ?auto_107164 ) ) ( not ( = ?auto_107158 ?auto_107164 ) ) ( not ( = ?auto_107159 ?auto_107164 ) ) ( not ( = ?auto_107160 ?auto_107164 ) ) ( not ( = ?auto_107161 ?auto_107164 ) ) ( ON ?auto_107160 ?auto_107161 ) ( ON-TABLE ?auto_107163 ) ( ON ?auto_107162 ?auto_107163 ) ( ON ?auto_107164 ?auto_107162 ) ( not ( = ?auto_107163 ?auto_107162 ) ) ( not ( = ?auto_107163 ?auto_107164 ) ) ( not ( = ?auto_107163 ?auto_107161 ) ) ( not ( = ?auto_107163 ?auto_107160 ) ) ( not ( = ?auto_107162 ?auto_107164 ) ) ( not ( = ?auto_107162 ?auto_107161 ) ) ( not ( = ?auto_107162 ?auto_107160 ) ) ( not ( = ?auto_107157 ?auto_107163 ) ) ( not ( = ?auto_107157 ?auto_107162 ) ) ( not ( = ?auto_107158 ?auto_107163 ) ) ( not ( = ?auto_107158 ?auto_107162 ) ) ( not ( = ?auto_107159 ?auto_107163 ) ) ( not ( = ?auto_107159 ?auto_107162 ) ) ( CLEAR ?auto_107158 ) ( ON ?auto_107159 ?auto_107160 ) ( CLEAR ?auto_107159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107163 ?auto_107162 ?auto_107164 ?auto_107161 ?auto_107160 )
      ( MAKE-5PILE ?auto_107157 ?auto_107158 ?auto_107159 ?auto_107160 ?auto_107161 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107165 - BLOCK
      ?auto_107166 - BLOCK
      ?auto_107167 - BLOCK
      ?auto_107168 - BLOCK
      ?auto_107169 - BLOCK
    )
    :vars
    (
      ?auto_107170 - BLOCK
      ?auto_107172 - BLOCK
      ?auto_107171 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107165 ) ( not ( = ?auto_107165 ?auto_107166 ) ) ( not ( = ?auto_107165 ?auto_107167 ) ) ( not ( = ?auto_107165 ?auto_107168 ) ) ( not ( = ?auto_107165 ?auto_107169 ) ) ( not ( = ?auto_107166 ?auto_107167 ) ) ( not ( = ?auto_107166 ?auto_107168 ) ) ( not ( = ?auto_107166 ?auto_107169 ) ) ( not ( = ?auto_107167 ?auto_107168 ) ) ( not ( = ?auto_107167 ?auto_107169 ) ) ( not ( = ?auto_107168 ?auto_107169 ) ) ( ON ?auto_107169 ?auto_107170 ) ( not ( = ?auto_107165 ?auto_107170 ) ) ( not ( = ?auto_107166 ?auto_107170 ) ) ( not ( = ?auto_107167 ?auto_107170 ) ) ( not ( = ?auto_107168 ?auto_107170 ) ) ( not ( = ?auto_107169 ?auto_107170 ) ) ( ON ?auto_107168 ?auto_107169 ) ( ON-TABLE ?auto_107172 ) ( ON ?auto_107171 ?auto_107172 ) ( ON ?auto_107170 ?auto_107171 ) ( not ( = ?auto_107172 ?auto_107171 ) ) ( not ( = ?auto_107172 ?auto_107170 ) ) ( not ( = ?auto_107172 ?auto_107169 ) ) ( not ( = ?auto_107172 ?auto_107168 ) ) ( not ( = ?auto_107171 ?auto_107170 ) ) ( not ( = ?auto_107171 ?auto_107169 ) ) ( not ( = ?auto_107171 ?auto_107168 ) ) ( not ( = ?auto_107165 ?auto_107172 ) ) ( not ( = ?auto_107165 ?auto_107171 ) ) ( not ( = ?auto_107166 ?auto_107172 ) ) ( not ( = ?auto_107166 ?auto_107171 ) ) ( not ( = ?auto_107167 ?auto_107172 ) ) ( not ( = ?auto_107167 ?auto_107171 ) ) ( ON ?auto_107167 ?auto_107168 ) ( CLEAR ?auto_107167 ) ( HOLDING ?auto_107166 ) ( CLEAR ?auto_107165 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107165 ?auto_107166 )
      ( MAKE-5PILE ?auto_107165 ?auto_107166 ?auto_107167 ?auto_107168 ?auto_107169 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107173 - BLOCK
      ?auto_107174 - BLOCK
      ?auto_107175 - BLOCK
      ?auto_107176 - BLOCK
      ?auto_107177 - BLOCK
    )
    :vars
    (
      ?auto_107178 - BLOCK
      ?auto_107180 - BLOCK
      ?auto_107179 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107173 ) ( not ( = ?auto_107173 ?auto_107174 ) ) ( not ( = ?auto_107173 ?auto_107175 ) ) ( not ( = ?auto_107173 ?auto_107176 ) ) ( not ( = ?auto_107173 ?auto_107177 ) ) ( not ( = ?auto_107174 ?auto_107175 ) ) ( not ( = ?auto_107174 ?auto_107176 ) ) ( not ( = ?auto_107174 ?auto_107177 ) ) ( not ( = ?auto_107175 ?auto_107176 ) ) ( not ( = ?auto_107175 ?auto_107177 ) ) ( not ( = ?auto_107176 ?auto_107177 ) ) ( ON ?auto_107177 ?auto_107178 ) ( not ( = ?auto_107173 ?auto_107178 ) ) ( not ( = ?auto_107174 ?auto_107178 ) ) ( not ( = ?auto_107175 ?auto_107178 ) ) ( not ( = ?auto_107176 ?auto_107178 ) ) ( not ( = ?auto_107177 ?auto_107178 ) ) ( ON ?auto_107176 ?auto_107177 ) ( ON-TABLE ?auto_107180 ) ( ON ?auto_107179 ?auto_107180 ) ( ON ?auto_107178 ?auto_107179 ) ( not ( = ?auto_107180 ?auto_107179 ) ) ( not ( = ?auto_107180 ?auto_107178 ) ) ( not ( = ?auto_107180 ?auto_107177 ) ) ( not ( = ?auto_107180 ?auto_107176 ) ) ( not ( = ?auto_107179 ?auto_107178 ) ) ( not ( = ?auto_107179 ?auto_107177 ) ) ( not ( = ?auto_107179 ?auto_107176 ) ) ( not ( = ?auto_107173 ?auto_107180 ) ) ( not ( = ?auto_107173 ?auto_107179 ) ) ( not ( = ?auto_107174 ?auto_107180 ) ) ( not ( = ?auto_107174 ?auto_107179 ) ) ( not ( = ?auto_107175 ?auto_107180 ) ) ( not ( = ?auto_107175 ?auto_107179 ) ) ( ON ?auto_107175 ?auto_107176 ) ( CLEAR ?auto_107173 ) ( ON ?auto_107174 ?auto_107175 ) ( CLEAR ?auto_107174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107180 ?auto_107179 ?auto_107178 ?auto_107177 ?auto_107176 ?auto_107175 )
      ( MAKE-5PILE ?auto_107173 ?auto_107174 ?auto_107175 ?auto_107176 ?auto_107177 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107181 - BLOCK
      ?auto_107182 - BLOCK
      ?auto_107183 - BLOCK
      ?auto_107184 - BLOCK
      ?auto_107185 - BLOCK
    )
    :vars
    (
      ?auto_107187 - BLOCK
      ?auto_107186 - BLOCK
      ?auto_107188 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107181 ?auto_107182 ) ) ( not ( = ?auto_107181 ?auto_107183 ) ) ( not ( = ?auto_107181 ?auto_107184 ) ) ( not ( = ?auto_107181 ?auto_107185 ) ) ( not ( = ?auto_107182 ?auto_107183 ) ) ( not ( = ?auto_107182 ?auto_107184 ) ) ( not ( = ?auto_107182 ?auto_107185 ) ) ( not ( = ?auto_107183 ?auto_107184 ) ) ( not ( = ?auto_107183 ?auto_107185 ) ) ( not ( = ?auto_107184 ?auto_107185 ) ) ( ON ?auto_107185 ?auto_107187 ) ( not ( = ?auto_107181 ?auto_107187 ) ) ( not ( = ?auto_107182 ?auto_107187 ) ) ( not ( = ?auto_107183 ?auto_107187 ) ) ( not ( = ?auto_107184 ?auto_107187 ) ) ( not ( = ?auto_107185 ?auto_107187 ) ) ( ON ?auto_107184 ?auto_107185 ) ( ON-TABLE ?auto_107186 ) ( ON ?auto_107188 ?auto_107186 ) ( ON ?auto_107187 ?auto_107188 ) ( not ( = ?auto_107186 ?auto_107188 ) ) ( not ( = ?auto_107186 ?auto_107187 ) ) ( not ( = ?auto_107186 ?auto_107185 ) ) ( not ( = ?auto_107186 ?auto_107184 ) ) ( not ( = ?auto_107188 ?auto_107187 ) ) ( not ( = ?auto_107188 ?auto_107185 ) ) ( not ( = ?auto_107188 ?auto_107184 ) ) ( not ( = ?auto_107181 ?auto_107186 ) ) ( not ( = ?auto_107181 ?auto_107188 ) ) ( not ( = ?auto_107182 ?auto_107186 ) ) ( not ( = ?auto_107182 ?auto_107188 ) ) ( not ( = ?auto_107183 ?auto_107186 ) ) ( not ( = ?auto_107183 ?auto_107188 ) ) ( ON ?auto_107183 ?auto_107184 ) ( ON ?auto_107182 ?auto_107183 ) ( CLEAR ?auto_107182 ) ( HOLDING ?auto_107181 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107181 )
      ( MAKE-5PILE ?auto_107181 ?auto_107182 ?auto_107183 ?auto_107184 ?auto_107185 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107189 - BLOCK
      ?auto_107190 - BLOCK
      ?auto_107191 - BLOCK
      ?auto_107192 - BLOCK
      ?auto_107193 - BLOCK
    )
    :vars
    (
      ?auto_107196 - BLOCK
      ?auto_107194 - BLOCK
      ?auto_107195 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107189 ?auto_107190 ) ) ( not ( = ?auto_107189 ?auto_107191 ) ) ( not ( = ?auto_107189 ?auto_107192 ) ) ( not ( = ?auto_107189 ?auto_107193 ) ) ( not ( = ?auto_107190 ?auto_107191 ) ) ( not ( = ?auto_107190 ?auto_107192 ) ) ( not ( = ?auto_107190 ?auto_107193 ) ) ( not ( = ?auto_107191 ?auto_107192 ) ) ( not ( = ?auto_107191 ?auto_107193 ) ) ( not ( = ?auto_107192 ?auto_107193 ) ) ( ON ?auto_107193 ?auto_107196 ) ( not ( = ?auto_107189 ?auto_107196 ) ) ( not ( = ?auto_107190 ?auto_107196 ) ) ( not ( = ?auto_107191 ?auto_107196 ) ) ( not ( = ?auto_107192 ?auto_107196 ) ) ( not ( = ?auto_107193 ?auto_107196 ) ) ( ON ?auto_107192 ?auto_107193 ) ( ON-TABLE ?auto_107194 ) ( ON ?auto_107195 ?auto_107194 ) ( ON ?auto_107196 ?auto_107195 ) ( not ( = ?auto_107194 ?auto_107195 ) ) ( not ( = ?auto_107194 ?auto_107196 ) ) ( not ( = ?auto_107194 ?auto_107193 ) ) ( not ( = ?auto_107194 ?auto_107192 ) ) ( not ( = ?auto_107195 ?auto_107196 ) ) ( not ( = ?auto_107195 ?auto_107193 ) ) ( not ( = ?auto_107195 ?auto_107192 ) ) ( not ( = ?auto_107189 ?auto_107194 ) ) ( not ( = ?auto_107189 ?auto_107195 ) ) ( not ( = ?auto_107190 ?auto_107194 ) ) ( not ( = ?auto_107190 ?auto_107195 ) ) ( not ( = ?auto_107191 ?auto_107194 ) ) ( not ( = ?auto_107191 ?auto_107195 ) ) ( ON ?auto_107191 ?auto_107192 ) ( ON ?auto_107190 ?auto_107191 ) ( ON ?auto_107189 ?auto_107190 ) ( CLEAR ?auto_107189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107194 ?auto_107195 ?auto_107196 ?auto_107193 ?auto_107192 ?auto_107191 ?auto_107190 )
      ( MAKE-5PILE ?auto_107189 ?auto_107190 ?auto_107191 ?auto_107192 ?auto_107193 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107199 - BLOCK
      ?auto_107200 - BLOCK
    )
    :vars
    (
      ?auto_107201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107201 ?auto_107200 ) ( CLEAR ?auto_107201 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107199 ) ( ON ?auto_107200 ?auto_107199 ) ( not ( = ?auto_107199 ?auto_107200 ) ) ( not ( = ?auto_107199 ?auto_107201 ) ) ( not ( = ?auto_107200 ?auto_107201 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107201 ?auto_107200 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107202 - BLOCK
      ?auto_107203 - BLOCK
    )
    :vars
    (
      ?auto_107204 - BLOCK
      ?auto_107205 - BLOCK
      ?auto_107206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107204 ?auto_107203 ) ( CLEAR ?auto_107204 ) ( ON-TABLE ?auto_107202 ) ( ON ?auto_107203 ?auto_107202 ) ( not ( = ?auto_107202 ?auto_107203 ) ) ( not ( = ?auto_107202 ?auto_107204 ) ) ( not ( = ?auto_107203 ?auto_107204 ) ) ( HOLDING ?auto_107205 ) ( CLEAR ?auto_107206 ) ( not ( = ?auto_107202 ?auto_107205 ) ) ( not ( = ?auto_107202 ?auto_107206 ) ) ( not ( = ?auto_107203 ?auto_107205 ) ) ( not ( = ?auto_107203 ?auto_107206 ) ) ( not ( = ?auto_107204 ?auto_107205 ) ) ( not ( = ?auto_107204 ?auto_107206 ) ) ( not ( = ?auto_107205 ?auto_107206 ) ) )
    :subtasks
    ( ( !STACK ?auto_107205 ?auto_107206 )
      ( MAKE-2PILE ?auto_107202 ?auto_107203 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107207 - BLOCK
      ?auto_107208 - BLOCK
    )
    :vars
    (
      ?auto_107211 - BLOCK
      ?auto_107209 - BLOCK
      ?auto_107210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107211 ?auto_107208 ) ( ON-TABLE ?auto_107207 ) ( ON ?auto_107208 ?auto_107207 ) ( not ( = ?auto_107207 ?auto_107208 ) ) ( not ( = ?auto_107207 ?auto_107211 ) ) ( not ( = ?auto_107208 ?auto_107211 ) ) ( CLEAR ?auto_107209 ) ( not ( = ?auto_107207 ?auto_107210 ) ) ( not ( = ?auto_107207 ?auto_107209 ) ) ( not ( = ?auto_107208 ?auto_107210 ) ) ( not ( = ?auto_107208 ?auto_107209 ) ) ( not ( = ?auto_107211 ?auto_107210 ) ) ( not ( = ?auto_107211 ?auto_107209 ) ) ( not ( = ?auto_107210 ?auto_107209 ) ) ( ON ?auto_107210 ?auto_107211 ) ( CLEAR ?auto_107210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107207 ?auto_107208 ?auto_107211 )
      ( MAKE-2PILE ?auto_107207 ?auto_107208 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107212 - BLOCK
      ?auto_107213 - BLOCK
    )
    :vars
    (
      ?auto_107216 - BLOCK
      ?auto_107215 - BLOCK
      ?auto_107214 - BLOCK
      ?auto_107217 - BLOCK
      ?auto_107218 - BLOCK
      ?auto_107219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107216 ?auto_107213 ) ( ON-TABLE ?auto_107212 ) ( ON ?auto_107213 ?auto_107212 ) ( not ( = ?auto_107212 ?auto_107213 ) ) ( not ( = ?auto_107212 ?auto_107216 ) ) ( not ( = ?auto_107213 ?auto_107216 ) ) ( not ( = ?auto_107212 ?auto_107215 ) ) ( not ( = ?auto_107212 ?auto_107214 ) ) ( not ( = ?auto_107213 ?auto_107215 ) ) ( not ( = ?auto_107213 ?auto_107214 ) ) ( not ( = ?auto_107216 ?auto_107215 ) ) ( not ( = ?auto_107216 ?auto_107214 ) ) ( not ( = ?auto_107215 ?auto_107214 ) ) ( ON ?auto_107215 ?auto_107216 ) ( CLEAR ?auto_107215 ) ( HOLDING ?auto_107214 ) ( CLEAR ?auto_107217 ) ( ON-TABLE ?auto_107218 ) ( ON ?auto_107219 ?auto_107218 ) ( ON ?auto_107217 ?auto_107219 ) ( not ( = ?auto_107218 ?auto_107219 ) ) ( not ( = ?auto_107218 ?auto_107217 ) ) ( not ( = ?auto_107218 ?auto_107214 ) ) ( not ( = ?auto_107219 ?auto_107217 ) ) ( not ( = ?auto_107219 ?auto_107214 ) ) ( not ( = ?auto_107217 ?auto_107214 ) ) ( not ( = ?auto_107212 ?auto_107217 ) ) ( not ( = ?auto_107212 ?auto_107218 ) ) ( not ( = ?auto_107212 ?auto_107219 ) ) ( not ( = ?auto_107213 ?auto_107217 ) ) ( not ( = ?auto_107213 ?auto_107218 ) ) ( not ( = ?auto_107213 ?auto_107219 ) ) ( not ( = ?auto_107216 ?auto_107217 ) ) ( not ( = ?auto_107216 ?auto_107218 ) ) ( not ( = ?auto_107216 ?auto_107219 ) ) ( not ( = ?auto_107215 ?auto_107217 ) ) ( not ( = ?auto_107215 ?auto_107218 ) ) ( not ( = ?auto_107215 ?auto_107219 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107218 ?auto_107219 ?auto_107217 ?auto_107214 )
      ( MAKE-2PILE ?auto_107212 ?auto_107213 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107220 - BLOCK
      ?auto_107221 - BLOCK
    )
    :vars
    (
      ?auto_107225 - BLOCK
      ?auto_107222 - BLOCK
      ?auto_107223 - BLOCK
      ?auto_107224 - BLOCK
      ?auto_107227 - BLOCK
      ?auto_107226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107225 ?auto_107221 ) ( ON-TABLE ?auto_107220 ) ( ON ?auto_107221 ?auto_107220 ) ( not ( = ?auto_107220 ?auto_107221 ) ) ( not ( = ?auto_107220 ?auto_107225 ) ) ( not ( = ?auto_107221 ?auto_107225 ) ) ( not ( = ?auto_107220 ?auto_107222 ) ) ( not ( = ?auto_107220 ?auto_107223 ) ) ( not ( = ?auto_107221 ?auto_107222 ) ) ( not ( = ?auto_107221 ?auto_107223 ) ) ( not ( = ?auto_107225 ?auto_107222 ) ) ( not ( = ?auto_107225 ?auto_107223 ) ) ( not ( = ?auto_107222 ?auto_107223 ) ) ( ON ?auto_107222 ?auto_107225 ) ( CLEAR ?auto_107224 ) ( ON-TABLE ?auto_107227 ) ( ON ?auto_107226 ?auto_107227 ) ( ON ?auto_107224 ?auto_107226 ) ( not ( = ?auto_107227 ?auto_107226 ) ) ( not ( = ?auto_107227 ?auto_107224 ) ) ( not ( = ?auto_107227 ?auto_107223 ) ) ( not ( = ?auto_107226 ?auto_107224 ) ) ( not ( = ?auto_107226 ?auto_107223 ) ) ( not ( = ?auto_107224 ?auto_107223 ) ) ( not ( = ?auto_107220 ?auto_107224 ) ) ( not ( = ?auto_107220 ?auto_107227 ) ) ( not ( = ?auto_107220 ?auto_107226 ) ) ( not ( = ?auto_107221 ?auto_107224 ) ) ( not ( = ?auto_107221 ?auto_107227 ) ) ( not ( = ?auto_107221 ?auto_107226 ) ) ( not ( = ?auto_107225 ?auto_107224 ) ) ( not ( = ?auto_107225 ?auto_107227 ) ) ( not ( = ?auto_107225 ?auto_107226 ) ) ( not ( = ?auto_107222 ?auto_107224 ) ) ( not ( = ?auto_107222 ?auto_107227 ) ) ( not ( = ?auto_107222 ?auto_107226 ) ) ( ON ?auto_107223 ?auto_107222 ) ( CLEAR ?auto_107223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107220 ?auto_107221 ?auto_107225 ?auto_107222 )
      ( MAKE-2PILE ?auto_107220 ?auto_107221 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107228 - BLOCK
      ?auto_107229 - BLOCK
    )
    :vars
    (
      ?auto_107233 - BLOCK
      ?auto_107235 - BLOCK
      ?auto_107234 - BLOCK
      ?auto_107231 - BLOCK
      ?auto_107232 - BLOCK
      ?auto_107230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107233 ?auto_107229 ) ( ON-TABLE ?auto_107228 ) ( ON ?auto_107229 ?auto_107228 ) ( not ( = ?auto_107228 ?auto_107229 ) ) ( not ( = ?auto_107228 ?auto_107233 ) ) ( not ( = ?auto_107229 ?auto_107233 ) ) ( not ( = ?auto_107228 ?auto_107235 ) ) ( not ( = ?auto_107228 ?auto_107234 ) ) ( not ( = ?auto_107229 ?auto_107235 ) ) ( not ( = ?auto_107229 ?auto_107234 ) ) ( not ( = ?auto_107233 ?auto_107235 ) ) ( not ( = ?auto_107233 ?auto_107234 ) ) ( not ( = ?auto_107235 ?auto_107234 ) ) ( ON ?auto_107235 ?auto_107233 ) ( ON-TABLE ?auto_107231 ) ( ON ?auto_107232 ?auto_107231 ) ( not ( = ?auto_107231 ?auto_107232 ) ) ( not ( = ?auto_107231 ?auto_107230 ) ) ( not ( = ?auto_107231 ?auto_107234 ) ) ( not ( = ?auto_107232 ?auto_107230 ) ) ( not ( = ?auto_107232 ?auto_107234 ) ) ( not ( = ?auto_107230 ?auto_107234 ) ) ( not ( = ?auto_107228 ?auto_107230 ) ) ( not ( = ?auto_107228 ?auto_107231 ) ) ( not ( = ?auto_107228 ?auto_107232 ) ) ( not ( = ?auto_107229 ?auto_107230 ) ) ( not ( = ?auto_107229 ?auto_107231 ) ) ( not ( = ?auto_107229 ?auto_107232 ) ) ( not ( = ?auto_107233 ?auto_107230 ) ) ( not ( = ?auto_107233 ?auto_107231 ) ) ( not ( = ?auto_107233 ?auto_107232 ) ) ( not ( = ?auto_107235 ?auto_107230 ) ) ( not ( = ?auto_107235 ?auto_107231 ) ) ( not ( = ?auto_107235 ?auto_107232 ) ) ( ON ?auto_107234 ?auto_107235 ) ( CLEAR ?auto_107234 ) ( HOLDING ?auto_107230 ) ( CLEAR ?auto_107232 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107231 ?auto_107232 ?auto_107230 )
      ( MAKE-2PILE ?auto_107228 ?auto_107229 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107236 - BLOCK
      ?auto_107237 - BLOCK
    )
    :vars
    (
      ?auto_107242 - BLOCK
      ?auto_107240 - BLOCK
      ?auto_107239 - BLOCK
      ?auto_107241 - BLOCK
      ?auto_107238 - BLOCK
      ?auto_107243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107242 ?auto_107237 ) ( ON-TABLE ?auto_107236 ) ( ON ?auto_107237 ?auto_107236 ) ( not ( = ?auto_107236 ?auto_107237 ) ) ( not ( = ?auto_107236 ?auto_107242 ) ) ( not ( = ?auto_107237 ?auto_107242 ) ) ( not ( = ?auto_107236 ?auto_107240 ) ) ( not ( = ?auto_107236 ?auto_107239 ) ) ( not ( = ?auto_107237 ?auto_107240 ) ) ( not ( = ?auto_107237 ?auto_107239 ) ) ( not ( = ?auto_107242 ?auto_107240 ) ) ( not ( = ?auto_107242 ?auto_107239 ) ) ( not ( = ?auto_107240 ?auto_107239 ) ) ( ON ?auto_107240 ?auto_107242 ) ( ON-TABLE ?auto_107241 ) ( ON ?auto_107238 ?auto_107241 ) ( not ( = ?auto_107241 ?auto_107238 ) ) ( not ( = ?auto_107241 ?auto_107243 ) ) ( not ( = ?auto_107241 ?auto_107239 ) ) ( not ( = ?auto_107238 ?auto_107243 ) ) ( not ( = ?auto_107238 ?auto_107239 ) ) ( not ( = ?auto_107243 ?auto_107239 ) ) ( not ( = ?auto_107236 ?auto_107243 ) ) ( not ( = ?auto_107236 ?auto_107241 ) ) ( not ( = ?auto_107236 ?auto_107238 ) ) ( not ( = ?auto_107237 ?auto_107243 ) ) ( not ( = ?auto_107237 ?auto_107241 ) ) ( not ( = ?auto_107237 ?auto_107238 ) ) ( not ( = ?auto_107242 ?auto_107243 ) ) ( not ( = ?auto_107242 ?auto_107241 ) ) ( not ( = ?auto_107242 ?auto_107238 ) ) ( not ( = ?auto_107240 ?auto_107243 ) ) ( not ( = ?auto_107240 ?auto_107241 ) ) ( not ( = ?auto_107240 ?auto_107238 ) ) ( ON ?auto_107239 ?auto_107240 ) ( CLEAR ?auto_107238 ) ( ON ?auto_107243 ?auto_107239 ) ( CLEAR ?auto_107243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107236 ?auto_107237 ?auto_107242 ?auto_107240 ?auto_107239 )
      ( MAKE-2PILE ?auto_107236 ?auto_107237 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107244 - BLOCK
      ?auto_107245 - BLOCK
    )
    :vars
    (
      ?auto_107250 - BLOCK
      ?auto_107249 - BLOCK
      ?auto_107251 - BLOCK
      ?auto_107247 - BLOCK
      ?auto_107246 - BLOCK
      ?auto_107248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107250 ?auto_107245 ) ( ON-TABLE ?auto_107244 ) ( ON ?auto_107245 ?auto_107244 ) ( not ( = ?auto_107244 ?auto_107245 ) ) ( not ( = ?auto_107244 ?auto_107250 ) ) ( not ( = ?auto_107245 ?auto_107250 ) ) ( not ( = ?auto_107244 ?auto_107249 ) ) ( not ( = ?auto_107244 ?auto_107251 ) ) ( not ( = ?auto_107245 ?auto_107249 ) ) ( not ( = ?auto_107245 ?auto_107251 ) ) ( not ( = ?auto_107250 ?auto_107249 ) ) ( not ( = ?auto_107250 ?auto_107251 ) ) ( not ( = ?auto_107249 ?auto_107251 ) ) ( ON ?auto_107249 ?auto_107250 ) ( ON-TABLE ?auto_107247 ) ( not ( = ?auto_107247 ?auto_107246 ) ) ( not ( = ?auto_107247 ?auto_107248 ) ) ( not ( = ?auto_107247 ?auto_107251 ) ) ( not ( = ?auto_107246 ?auto_107248 ) ) ( not ( = ?auto_107246 ?auto_107251 ) ) ( not ( = ?auto_107248 ?auto_107251 ) ) ( not ( = ?auto_107244 ?auto_107248 ) ) ( not ( = ?auto_107244 ?auto_107247 ) ) ( not ( = ?auto_107244 ?auto_107246 ) ) ( not ( = ?auto_107245 ?auto_107248 ) ) ( not ( = ?auto_107245 ?auto_107247 ) ) ( not ( = ?auto_107245 ?auto_107246 ) ) ( not ( = ?auto_107250 ?auto_107248 ) ) ( not ( = ?auto_107250 ?auto_107247 ) ) ( not ( = ?auto_107250 ?auto_107246 ) ) ( not ( = ?auto_107249 ?auto_107248 ) ) ( not ( = ?auto_107249 ?auto_107247 ) ) ( not ( = ?auto_107249 ?auto_107246 ) ) ( ON ?auto_107251 ?auto_107249 ) ( ON ?auto_107248 ?auto_107251 ) ( CLEAR ?auto_107248 ) ( HOLDING ?auto_107246 ) ( CLEAR ?auto_107247 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107247 ?auto_107246 )
      ( MAKE-2PILE ?auto_107244 ?auto_107245 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108545 - BLOCK
      ?auto_108546 - BLOCK
    )
    :vars
    (
      ?auto_108547 - BLOCK
      ?auto_108551 - BLOCK
      ?auto_108550 - BLOCK
      ?auto_108549 - BLOCK
      ?auto_108548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108547 ?auto_108546 ) ( ON-TABLE ?auto_108545 ) ( ON ?auto_108546 ?auto_108545 ) ( not ( = ?auto_108545 ?auto_108546 ) ) ( not ( = ?auto_108545 ?auto_108547 ) ) ( not ( = ?auto_108546 ?auto_108547 ) ) ( not ( = ?auto_108545 ?auto_108551 ) ) ( not ( = ?auto_108545 ?auto_108550 ) ) ( not ( = ?auto_108546 ?auto_108551 ) ) ( not ( = ?auto_108546 ?auto_108550 ) ) ( not ( = ?auto_108547 ?auto_108551 ) ) ( not ( = ?auto_108547 ?auto_108550 ) ) ( not ( = ?auto_108551 ?auto_108550 ) ) ( ON ?auto_108551 ?auto_108547 ) ( not ( = ?auto_108549 ?auto_108548 ) ) ( not ( = ?auto_108549 ?auto_108550 ) ) ( not ( = ?auto_108548 ?auto_108550 ) ) ( not ( = ?auto_108545 ?auto_108548 ) ) ( not ( = ?auto_108545 ?auto_108549 ) ) ( not ( = ?auto_108546 ?auto_108548 ) ) ( not ( = ?auto_108546 ?auto_108549 ) ) ( not ( = ?auto_108547 ?auto_108548 ) ) ( not ( = ?auto_108547 ?auto_108549 ) ) ( not ( = ?auto_108551 ?auto_108548 ) ) ( not ( = ?auto_108551 ?auto_108549 ) ) ( ON ?auto_108550 ?auto_108551 ) ( ON ?auto_108548 ?auto_108550 ) ( ON ?auto_108549 ?auto_108548 ) ( CLEAR ?auto_108549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108545 ?auto_108546 ?auto_108547 ?auto_108551 ?auto_108550 ?auto_108548 )
      ( MAKE-2PILE ?auto_108545 ?auto_108546 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107260 - BLOCK
      ?auto_107261 - BLOCK
    )
    :vars
    (
      ?auto_107267 - BLOCK
      ?auto_107264 - BLOCK
      ?auto_107262 - BLOCK
      ?auto_107265 - BLOCK
      ?auto_107266 - BLOCK
      ?auto_107263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107267 ?auto_107261 ) ( ON-TABLE ?auto_107260 ) ( ON ?auto_107261 ?auto_107260 ) ( not ( = ?auto_107260 ?auto_107261 ) ) ( not ( = ?auto_107260 ?auto_107267 ) ) ( not ( = ?auto_107261 ?auto_107267 ) ) ( not ( = ?auto_107260 ?auto_107264 ) ) ( not ( = ?auto_107260 ?auto_107262 ) ) ( not ( = ?auto_107261 ?auto_107264 ) ) ( not ( = ?auto_107261 ?auto_107262 ) ) ( not ( = ?auto_107267 ?auto_107264 ) ) ( not ( = ?auto_107267 ?auto_107262 ) ) ( not ( = ?auto_107264 ?auto_107262 ) ) ( ON ?auto_107264 ?auto_107267 ) ( not ( = ?auto_107265 ?auto_107266 ) ) ( not ( = ?auto_107265 ?auto_107263 ) ) ( not ( = ?auto_107265 ?auto_107262 ) ) ( not ( = ?auto_107266 ?auto_107263 ) ) ( not ( = ?auto_107266 ?auto_107262 ) ) ( not ( = ?auto_107263 ?auto_107262 ) ) ( not ( = ?auto_107260 ?auto_107263 ) ) ( not ( = ?auto_107260 ?auto_107265 ) ) ( not ( = ?auto_107260 ?auto_107266 ) ) ( not ( = ?auto_107261 ?auto_107263 ) ) ( not ( = ?auto_107261 ?auto_107265 ) ) ( not ( = ?auto_107261 ?auto_107266 ) ) ( not ( = ?auto_107267 ?auto_107263 ) ) ( not ( = ?auto_107267 ?auto_107265 ) ) ( not ( = ?auto_107267 ?auto_107266 ) ) ( not ( = ?auto_107264 ?auto_107263 ) ) ( not ( = ?auto_107264 ?auto_107265 ) ) ( not ( = ?auto_107264 ?auto_107266 ) ) ( ON ?auto_107262 ?auto_107264 ) ( ON ?auto_107263 ?auto_107262 ) ( ON ?auto_107266 ?auto_107263 ) ( CLEAR ?auto_107266 ) ( HOLDING ?auto_107265 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107265 )
      ( MAKE-2PILE ?auto_107260 ?auto_107261 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107268 - BLOCK
      ?auto_107269 - BLOCK
    )
    :vars
    (
      ?auto_107272 - BLOCK
      ?auto_107274 - BLOCK
      ?auto_107270 - BLOCK
      ?auto_107271 - BLOCK
      ?auto_107273 - BLOCK
      ?auto_107275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107272 ?auto_107269 ) ( ON-TABLE ?auto_107268 ) ( ON ?auto_107269 ?auto_107268 ) ( not ( = ?auto_107268 ?auto_107269 ) ) ( not ( = ?auto_107268 ?auto_107272 ) ) ( not ( = ?auto_107269 ?auto_107272 ) ) ( not ( = ?auto_107268 ?auto_107274 ) ) ( not ( = ?auto_107268 ?auto_107270 ) ) ( not ( = ?auto_107269 ?auto_107274 ) ) ( not ( = ?auto_107269 ?auto_107270 ) ) ( not ( = ?auto_107272 ?auto_107274 ) ) ( not ( = ?auto_107272 ?auto_107270 ) ) ( not ( = ?auto_107274 ?auto_107270 ) ) ( ON ?auto_107274 ?auto_107272 ) ( not ( = ?auto_107271 ?auto_107273 ) ) ( not ( = ?auto_107271 ?auto_107275 ) ) ( not ( = ?auto_107271 ?auto_107270 ) ) ( not ( = ?auto_107273 ?auto_107275 ) ) ( not ( = ?auto_107273 ?auto_107270 ) ) ( not ( = ?auto_107275 ?auto_107270 ) ) ( not ( = ?auto_107268 ?auto_107275 ) ) ( not ( = ?auto_107268 ?auto_107271 ) ) ( not ( = ?auto_107268 ?auto_107273 ) ) ( not ( = ?auto_107269 ?auto_107275 ) ) ( not ( = ?auto_107269 ?auto_107271 ) ) ( not ( = ?auto_107269 ?auto_107273 ) ) ( not ( = ?auto_107272 ?auto_107275 ) ) ( not ( = ?auto_107272 ?auto_107271 ) ) ( not ( = ?auto_107272 ?auto_107273 ) ) ( not ( = ?auto_107274 ?auto_107275 ) ) ( not ( = ?auto_107274 ?auto_107271 ) ) ( not ( = ?auto_107274 ?auto_107273 ) ) ( ON ?auto_107270 ?auto_107274 ) ( ON ?auto_107275 ?auto_107270 ) ( ON ?auto_107273 ?auto_107275 ) ( ON ?auto_107271 ?auto_107273 ) ( CLEAR ?auto_107271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107268 ?auto_107269 ?auto_107272 ?auto_107274 ?auto_107270 ?auto_107275 ?auto_107273 )
      ( MAKE-2PILE ?auto_107268 ?auto_107269 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107282 - BLOCK
      ?auto_107283 - BLOCK
      ?auto_107284 - BLOCK
      ?auto_107285 - BLOCK
      ?auto_107286 - BLOCK
      ?auto_107287 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_107287 ) ( CLEAR ?auto_107286 ) ( ON-TABLE ?auto_107282 ) ( ON ?auto_107283 ?auto_107282 ) ( ON ?auto_107284 ?auto_107283 ) ( ON ?auto_107285 ?auto_107284 ) ( ON ?auto_107286 ?auto_107285 ) ( not ( = ?auto_107282 ?auto_107283 ) ) ( not ( = ?auto_107282 ?auto_107284 ) ) ( not ( = ?auto_107282 ?auto_107285 ) ) ( not ( = ?auto_107282 ?auto_107286 ) ) ( not ( = ?auto_107282 ?auto_107287 ) ) ( not ( = ?auto_107283 ?auto_107284 ) ) ( not ( = ?auto_107283 ?auto_107285 ) ) ( not ( = ?auto_107283 ?auto_107286 ) ) ( not ( = ?auto_107283 ?auto_107287 ) ) ( not ( = ?auto_107284 ?auto_107285 ) ) ( not ( = ?auto_107284 ?auto_107286 ) ) ( not ( = ?auto_107284 ?auto_107287 ) ) ( not ( = ?auto_107285 ?auto_107286 ) ) ( not ( = ?auto_107285 ?auto_107287 ) ) ( not ( = ?auto_107286 ?auto_107287 ) ) )
    :subtasks
    ( ( !STACK ?auto_107287 ?auto_107286 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107288 - BLOCK
      ?auto_107289 - BLOCK
      ?auto_107290 - BLOCK
      ?auto_107291 - BLOCK
      ?auto_107292 - BLOCK
      ?auto_107293 - BLOCK
    )
    :vars
    (
      ?auto_107294 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_107292 ) ( ON-TABLE ?auto_107288 ) ( ON ?auto_107289 ?auto_107288 ) ( ON ?auto_107290 ?auto_107289 ) ( ON ?auto_107291 ?auto_107290 ) ( ON ?auto_107292 ?auto_107291 ) ( not ( = ?auto_107288 ?auto_107289 ) ) ( not ( = ?auto_107288 ?auto_107290 ) ) ( not ( = ?auto_107288 ?auto_107291 ) ) ( not ( = ?auto_107288 ?auto_107292 ) ) ( not ( = ?auto_107288 ?auto_107293 ) ) ( not ( = ?auto_107289 ?auto_107290 ) ) ( not ( = ?auto_107289 ?auto_107291 ) ) ( not ( = ?auto_107289 ?auto_107292 ) ) ( not ( = ?auto_107289 ?auto_107293 ) ) ( not ( = ?auto_107290 ?auto_107291 ) ) ( not ( = ?auto_107290 ?auto_107292 ) ) ( not ( = ?auto_107290 ?auto_107293 ) ) ( not ( = ?auto_107291 ?auto_107292 ) ) ( not ( = ?auto_107291 ?auto_107293 ) ) ( not ( = ?auto_107292 ?auto_107293 ) ) ( ON ?auto_107293 ?auto_107294 ) ( CLEAR ?auto_107293 ) ( HAND-EMPTY ) ( not ( = ?auto_107288 ?auto_107294 ) ) ( not ( = ?auto_107289 ?auto_107294 ) ) ( not ( = ?auto_107290 ?auto_107294 ) ) ( not ( = ?auto_107291 ?auto_107294 ) ) ( not ( = ?auto_107292 ?auto_107294 ) ) ( not ( = ?auto_107293 ?auto_107294 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107293 ?auto_107294 )
      ( MAKE-6PILE ?auto_107288 ?auto_107289 ?auto_107290 ?auto_107291 ?auto_107292 ?auto_107293 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107295 - BLOCK
      ?auto_107296 - BLOCK
      ?auto_107297 - BLOCK
      ?auto_107298 - BLOCK
      ?auto_107299 - BLOCK
      ?auto_107300 - BLOCK
    )
    :vars
    (
      ?auto_107301 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107295 ) ( ON ?auto_107296 ?auto_107295 ) ( ON ?auto_107297 ?auto_107296 ) ( ON ?auto_107298 ?auto_107297 ) ( not ( = ?auto_107295 ?auto_107296 ) ) ( not ( = ?auto_107295 ?auto_107297 ) ) ( not ( = ?auto_107295 ?auto_107298 ) ) ( not ( = ?auto_107295 ?auto_107299 ) ) ( not ( = ?auto_107295 ?auto_107300 ) ) ( not ( = ?auto_107296 ?auto_107297 ) ) ( not ( = ?auto_107296 ?auto_107298 ) ) ( not ( = ?auto_107296 ?auto_107299 ) ) ( not ( = ?auto_107296 ?auto_107300 ) ) ( not ( = ?auto_107297 ?auto_107298 ) ) ( not ( = ?auto_107297 ?auto_107299 ) ) ( not ( = ?auto_107297 ?auto_107300 ) ) ( not ( = ?auto_107298 ?auto_107299 ) ) ( not ( = ?auto_107298 ?auto_107300 ) ) ( not ( = ?auto_107299 ?auto_107300 ) ) ( ON ?auto_107300 ?auto_107301 ) ( CLEAR ?auto_107300 ) ( not ( = ?auto_107295 ?auto_107301 ) ) ( not ( = ?auto_107296 ?auto_107301 ) ) ( not ( = ?auto_107297 ?auto_107301 ) ) ( not ( = ?auto_107298 ?auto_107301 ) ) ( not ( = ?auto_107299 ?auto_107301 ) ) ( not ( = ?auto_107300 ?auto_107301 ) ) ( HOLDING ?auto_107299 ) ( CLEAR ?auto_107298 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107295 ?auto_107296 ?auto_107297 ?auto_107298 ?auto_107299 )
      ( MAKE-6PILE ?auto_107295 ?auto_107296 ?auto_107297 ?auto_107298 ?auto_107299 ?auto_107300 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107302 - BLOCK
      ?auto_107303 - BLOCK
      ?auto_107304 - BLOCK
      ?auto_107305 - BLOCK
      ?auto_107306 - BLOCK
      ?auto_107307 - BLOCK
    )
    :vars
    (
      ?auto_107308 - BLOCK
      ?auto_107309 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107302 ) ( ON ?auto_107303 ?auto_107302 ) ( ON ?auto_107304 ?auto_107303 ) ( ON ?auto_107305 ?auto_107304 ) ( not ( = ?auto_107302 ?auto_107303 ) ) ( not ( = ?auto_107302 ?auto_107304 ) ) ( not ( = ?auto_107302 ?auto_107305 ) ) ( not ( = ?auto_107302 ?auto_107306 ) ) ( not ( = ?auto_107302 ?auto_107307 ) ) ( not ( = ?auto_107303 ?auto_107304 ) ) ( not ( = ?auto_107303 ?auto_107305 ) ) ( not ( = ?auto_107303 ?auto_107306 ) ) ( not ( = ?auto_107303 ?auto_107307 ) ) ( not ( = ?auto_107304 ?auto_107305 ) ) ( not ( = ?auto_107304 ?auto_107306 ) ) ( not ( = ?auto_107304 ?auto_107307 ) ) ( not ( = ?auto_107305 ?auto_107306 ) ) ( not ( = ?auto_107305 ?auto_107307 ) ) ( not ( = ?auto_107306 ?auto_107307 ) ) ( ON ?auto_107307 ?auto_107308 ) ( not ( = ?auto_107302 ?auto_107308 ) ) ( not ( = ?auto_107303 ?auto_107308 ) ) ( not ( = ?auto_107304 ?auto_107308 ) ) ( not ( = ?auto_107305 ?auto_107308 ) ) ( not ( = ?auto_107306 ?auto_107308 ) ) ( not ( = ?auto_107307 ?auto_107308 ) ) ( CLEAR ?auto_107305 ) ( ON ?auto_107306 ?auto_107307 ) ( CLEAR ?auto_107306 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107309 ) ( ON ?auto_107308 ?auto_107309 ) ( not ( = ?auto_107309 ?auto_107308 ) ) ( not ( = ?auto_107309 ?auto_107307 ) ) ( not ( = ?auto_107309 ?auto_107306 ) ) ( not ( = ?auto_107302 ?auto_107309 ) ) ( not ( = ?auto_107303 ?auto_107309 ) ) ( not ( = ?auto_107304 ?auto_107309 ) ) ( not ( = ?auto_107305 ?auto_107309 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107309 ?auto_107308 ?auto_107307 )
      ( MAKE-6PILE ?auto_107302 ?auto_107303 ?auto_107304 ?auto_107305 ?auto_107306 ?auto_107307 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107310 - BLOCK
      ?auto_107311 - BLOCK
      ?auto_107312 - BLOCK
      ?auto_107313 - BLOCK
      ?auto_107314 - BLOCK
      ?auto_107315 - BLOCK
    )
    :vars
    (
      ?auto_107317 - BLOCK
      ?auto_107316 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107310 ) ( ON ?auto_107311 ?auto_107310 ) ( ON ?auto_107312 ?auto_107311 ) ( not ( = ?auto_107310 ?auto_107311 ) ) ( not ( = ?auto_107310 ?auto_107312 ) ) ( not ( = ?auto_107310 ?auto_107313 ) ) ( not ( = ?auto_107310 ?auto_107314 ) ) ( not ( = ?auto_107310 ?auto_107315 ) ) ( not ( = ?auto_107311 ?auto_107312 ) ) ( not ( = ?auto_107311 ?auto_107313 ) ) ( not ( = ?auto_107311 ?auto_107314 ) ) ( not ( = ?auto_107311 ?auto_107315 ) ) ( not ( = ?auto_107312 ?auto_107313 ) ) ( not ( = ?auto_107312 ?auto_107314 ) ) ( not ( = ?auto_107312 ?auto_107315 ) ) ( not ( = ?auto_107313 ?auto_107314 ) ) ( not ( = ?auto_107313 ?auto_107315 ) ) ( not ( = ?auto_107314 ?auto_107315 ) ) ( ON ?auto_107315 ?auto_107317 ) ( not ( = ?auto_107310 ?auto_107317 ) ) ( not ( = ?auto_107311 ?auto_107317 ) ) ( not ( = ?auto_107312 ?auto_107317 ) ) ( not ( = ?auto_107313 ?auto_107317 ) ) ( not ( = ?auto_107314 ?auto_107317 ) ) ( not ( = ?auto_107315 ?auto_107317 ) ) ( ON ?auto_107314 ?auto_107315 ) ( CLEAR ?auto_107314 ) ( ON-TABLE ?auto_107316 ) ( ON ?auto_107317 ?auto_107316 ) ( not ( = ?auto_107316 ?auto_107317 ) ) ( not ( = ?auto_107316 ?auto_107315 ) ) ( not ( = ?auto_107316 ?auto_107314 ) ) ( not ( = ?auto_107310 ?auto_107316 ) ) ( not ( = ?auto_107311 ?auto_107316 ) ) ( not ( = ?auto_107312 ?auto_107316 ) ) ( not ( = ?auto_107313 ?auto_107316 ) ) ( HOLDING ?auto_107313 ) ( CLEAR ?auto_107312 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107310 ?auto_107311 ?auto_107312 ?auto_107313 )
      ( MAKE-6PILE ?auto_107310 ?auto_107311 ?auto_107312 ?auto_107313 ?auto_107314 ?auto_107315 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107318 - BLOCK
      ?auto_107319 - BLOCK
      ?auto_107320 - BLOCK
      ?auto_107321 - BLOCK
      ?auto_107322 - BLOCK
      ?auto_107323 - BLOCK
    )
    :vars
    (
      ?auto_107324 - BLOCK
      ?auto_107325 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107318 ) ( ON ?auto_107319 ?auto_107318 ) ( ON ?auto_107320 ?auto_107319 ) ( not ( = ?auto_107318 ?auto_107319 ) ) ( not ( = ?auto_107318 ?auto_107320 ) ) ( not ( = ?auto_107318 ?auto_107321 ) ) ( not ( = ?auto_107318 ?auto_107322 ) ) ( not ( = ?auto_107318 ?auto_107323 ) ) ( not ( = ?auto_107319 ?auto_107320 ) ) ( not ( = ?auto_107319 ?auto_107321 ) ) ( not ( = ?auto_107319 ?auto_107322 ) ) ( not ( = ?auto_107319 ?auto_107323 ) ) ( not ( = ?auto_107320 ?auto_107321 ) ) ( not ( = ?auto_107320 ?auto_107322 ) ) ( not ( = ?auto_107320 ?auto_107323 ) ) ( not ( = ?auto_107321 ?auto_107322 ) ) ( not ( = ?auto_107321 ?auto_107323 ) ) ( not ( = ?auto_107322 ?auto_107323 ) ) ( ON ?auto_107323 ?auto_107324 ) ( not ( = ?auto_107318 ?auto_107324 ) ) ( not ( = ?auto_107319 ?auto_107324 ) ) ( not ( = ?auto_107320 ?auto_107324 ) ) ( not ( = ?auto_107321 ?auto_107324 ) ) ( not ( = ?auto_107322 ?auto_107324 ) ) ( not ( = ?auto_107323 ?auto_107324 ) ) ( ON ?auto_107322 ?auto_107323 ) ( ON-TABLE ?auto_107325 ) ( ON ?auto_107324 ?auto_107325 ) ( not ( = ?auto_107325 ?auto_107324 ) ) ( not ( = ?auto_107325 ?auto_107323 ) ) ( not ( = ?auto_107325 ?auto_107322 ) ) ( not ( = ?auto_107318 ?auto_107325 ) ) ( not ( = ?auto_107319 ?auto_107325 ) ) ( not ( = ?auto_107320 ?auto_107325 ) ) ( not ( = ?auto_107321 ?auto_107325 ) ) ( CLEAR ?auto_107320 ) ( ON ?auto_107321 ?auto_107322 ) ( CLEAR ?auto_107321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107325 ?auto_107324 ?auto_107323 ?auto_107322 )
      ( MAKE-6PILE ?auto_107318 ?auto_107319 ?auto_107320 ?auto_107321 ?auto_107322 ?auto_107323 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107326 - BLOCK
      ?auto_107327 - BLOCK
      ?auto_107328 - BLOCK
      ?auto_107329 - BLOCK
      ?auto_107330 - BLOCK
      ?auto_107331 - BLOCK
    )
    :vars
    (
      ?auto_107332 - BLOCK
      ?auto_107333 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107326 ) ( ON ?auto_107327 ?auto_107326 ) ( not ( = ?auto_107326 ?auto_107327 ) ) ( not ( = ?auto_107326 ?auto_107328 ) ) ( not ( = ?auto_107326 ?auto_107329 ) ) ( not ( = ?auto_107326 ?auto_107330 ) ) ( not ( = ?auto_107326 ?auto_107331 ) ) ( not ( = ?auto_107327 ?auto_107328 ) ) ( not ( = ?auto_107327 ?auto_107329 ) ) ( not ( = ?auto_107327 ?auto_107330 ) ) ( not ( = ?auto_107327 ?auto_107331 ) ) ( not ( = ?auto_107328 ?auto_107329 ) ) ( not ( = ?auto_107328 ?auto_107330 ) ) ( not ( = ?auto_107328 ?auto_107331 ) ) ( not ( = ?auto_107329 ?auto_107330 ) ) ( not ( = ?auto_107329 ?auto_107331 ) ) ( not ( = ?auto_107330 ?auto_107331 ) ) ( ON ?auto_107331 ?auto_107332 ) ( not ( = ?auto_107326 ?auto_107332 ) ) ( not ( = ?auto_107327 ?auto_107332 ) ) ( not ( = ?auto_107328 ?auto_107332 ) ) ( not ( = ?auto_107329 ?auto_107332 ) ) ( not ( = ?auto_107330 ?auto_107332 ) ) ( not ( = ?auto_107331 ?auto_107332 ) ) ( ON ?auto_107330 ?auto_107331 ) ( ON-TABLE ?auto_107333 ) ( ON ?auto_107332 ?auto_107333 ) ( not ( = ?auto_107333 ?auto_107332 ) ) ( not ( = ?auto_107333 ?auto_107331 ) ) ( not ( = ?auto_107333 ?auto_107330 ) ) ( not ( = ?auto_107326 ?auto_107333 ) ) ( not ( = ?auto_107327 ?auto_107333 ) ) ( not ( = ?auto_107328 ?auto_107333 ) ) ( not ( = ?auto_107329 ?auto_107333 ) ) ( ON ?auto_107329 ?auto_107330 ) ( CLEAR ?auto_107329 ) ( HOLDING ?auto_107328 ) ( CLEAR ?auto_107327 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107326 ?auto_107327 ?auto_107328 )
      ( MAKE-6PILE ?auto_107326 ?auto_107327 ?auto_107328 ?auto_107329 ?auto_107330 ?auto_107331 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107334 - BLOCK
      ?auto_107335 - BLOCK
      ?auto_107336 - BLOCK
      ?auto_107337 - BLOCK
      ?auto_107338 - BLOCK
      ?auto_107339 - BLOCK
    )
    :vars
    (
      ?auto_107340 - BLOCK
      ?auto_107341 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107334 ) ( ON ?auto_107335 ?auto_107334 ) ( not ( = ?auto_107334 ?auto_107335 ) ) ( not ( = ?auto_107334 ?auto_107336 ) ) ( not ( = ?auto_107334 ?auto_107337 ) ) ( not ( = ?auto_107334 ?auto_107338 ) ) ( not ( = ?auto_107334 ?auto_107339 ) ) ( not ( = ?auto_107335 ?auto_107336 ) ) ( not ( = ?auto_107335 ?auto_107337 ) ) ( not ( = ?auto_107335 ?auto_107338 ) ) ( not ( = ?auto_107335 ?auto_107339 ) ) ( not ( = ?auto_107336 ?auto_107337 ) ) ( not ( = ?auto_107336 ?auto_107338 ) ) ( not ( = ?auto_107336 ?auto_107339 ) ) ( not ( = ?auto_107337 ?auto_107338 ) ) ( not ( = ?auto_107337 ?auto_107339 ) ) ( not ( = ?auto_107338 ?auto_107339 ) ) ( ON ?auto_107339 ?auto_107340 ) ( not ( = ?auto_107334 ?auto_107340 ) ) ( not ( = ?auto_107335 ?auto_107340 ) ) ( not ( = ?auto_107336 ?auto_107340 ) ) ( not ( = ?auto_107337 ?auto_107340 ) ) ( not ( = ?auto_107338 ?auto_107340 ) ) ( not ( = ?auto_107339 ?auto_107340 ) ) ( ON ?auto_107338 ?auto_107339 ) ( ON-TABLE ?auto_107341 ) ( ON ?auto_107340 ?auto_107341 ) ( not ( = ?auto_107341 ?auto_107340 ) ) ( not ( = ?auto_107341 ?auto_107339 ) ) ( not ( = ?auto_107341 ?auto_107338 ) ) ( not ( = ?auto_107334 ?auto_107341 ) ) ( not ( = ?auto_107335 ?auto_107341 ) ) ( not ( = ?auto_107336 ?auto_107341 ) ) ( not ( = ?auto_107337 ?auto_107341 ) ) ( ON ?auto_107337 ?auto_107338 ) ( CLEAR ?auto_107335 ) ( ON ?auto_107336 ?auto_107337 ) ( CLEAR ?auto_107336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107341 ?auto_107340 ?auto_107339 ?auto_107338 ?auto_107337 )
      ( MAKE-6PILE ?auto_107334 ?auto_107335 ?auto_107336 ?auto_107337 ?auto_107338 ?auto_107339 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107342 - BLOCK
      ?auto_107343 - BLOCK
      ?auto_107344 - BLOCK
      ?auto_107345 - BLOCK
      ?auto_107346 - BLOCK
      ?auto_107347 - BLOCK
    )
    :vars
    (
      ?auto_107349 - BLOCK
      ?auto_107348 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107342 ) ( not ( = ?auto_107342 ?auto_107343 ) ) ( not ( = ?auto_107342 ?auto_107344 ) ) ( not ( = ?auto_107342 ?auto_107345 ) ) ( not ( = ?auto_107342 ?auto_107346 ) ) ( not ( = ?auto_107342 ?auto_107347 ) ) ( not ( = ?auto_107343 ?auto_107344 ) ) ( not ( = ?auto_107343 ?auto_107345 ) ) ( not ( = ?auto_107343 ?auto_107346 ) ) ( not ( = ?auto_107343 ?auto_107347 ) ) ( not ( = ?auto_107344 ?auto_107345 ) ) ( not ( = ?auto_107344 ?auto_107346 ) ) ( not ( = ?auto_107344 ?auto_107347 ) ) ( not ( = ?auto_107345 ?auto_107346 ) ) ( not ( = ?auto_107345 ?auto_107347 ) ) ( not ( = ?auto_107346 ?auto_107347 ) ) ( ON ?auto_107347 ?auto_107349 ) ( not ( = ?auto_107342 ?auto_107349 ) ) ( not ( = ?auto_107343 ?auto_107349 ) ) ( not ( = ?auto_107344 ?auto_107349 ) ) ( not ( = ?auto_107345 ?auto_107349 ) ) ( not ( = ?auto_107346 ?auto_107349 ) ) ( not ( = ?auto_107347 ?auto_107349 ) ) ( ON ?auto_107346 ?auto_107347 ) ( ON-TABLE ?auto_107348 ) ( ON ?auto_107349 ?auto_107348 ) ( not ( = ?auto_107348 ?auto_107349 ) ) ( not ( = ?auto_107348 ?auto_107347 ) ) ( not ( = ?auto_107348 ?auto_107346 ) ) ( not ( = ?auto_107342 ?auto_107348 ) ) ( not ( = ?auto_107343 ?auto_107348 ) ) ( not ( = ?auto_107344 ?auto_107348 ) ) ( not ( = ?auto_107345 ?auto_107348 ) ) ( ON ?auto_107345 ?auto_107346 ) ( ON ?auto_107344 ?auto_107345 ) ( CLEAR ?auto_107344 ) ( HOLDING ?auto_107343 ) ( CLEAR ?auto_107342 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107342 ?auto_107343 )
      ( MAKE-6PILE ?auto_107342 ?auto_107343 ?auto_107344 ?auto_107345 ?auto_107346 ?auto_107347 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107350 - BLOCK
      ?auto_107351 - BLOCK
      ?auto_107352 - BLOCK
      ?auto_107353 - BLOCK
      ?auto_107354 - BLOCK
      ?auto_107355 - BLOCK
    )
    :vars
    (
      ?auto_107357 - BLOCK
      ?auto_107356 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107350 ) ( not ( = ?auto_107350 ?auto_107351 ) ) ( not ( = ?auto_107350 ?auto_107352 ) ) ( not ( = ?auto_107350 ?auto_107353 ) ) ( not ( = ?auto_107350 ?auto_107354 ) ) ( not ( = ?auto_107350 ?auto_107355 ) ) ( not ( = ?auto_107351 ?auto_107352 ) ) ( not ( = ?auto_107351 ?auto_107353 ) ) ( not ( = ?auto_107351 ?auto_107354 ) ) ( not ( = ?auto_107351 ?auto_107355 ) ) ( not ( = ?auto_107352 ?auto_107353 ) ) ( not ( = ?auto_107352 ?auto_107354 ) ) ( not ( = ?auto_107352 ?auto_107355 ) ) ( not ( = ?auto_107353 ?auto_107354 ) ) ( not ( = ?auto_107353 ?auto_107355 ) ) ( not ( = ?auto_107354 ?auto_107355 ) ) ( ON ?auto_107355 ?auto_107357 ) ( not ( = ?auto_107350 ?auto_107357 ) ) ( not ( = ?auto_107351 ?auto_107357 ) ) ( not ( = ?auto_107352 ?auto_107357 ) ) ( not ( = ?auto_107353 ?auto_107357 ) ) ( not ( = ?auto_107354 ?auto_107357 ) ) ( not ( = ?auto_107355 ?auto_107357 ) ) ( ON ?auto_107354 ?auto_107355 ) ( ON-TABLE ?auto_107356 ) ( ON ?auto_107357 ?auto_107356 ) ( not ( = ?auto_107356 ?auto_107357 ) ) ( not ( = ?auto_107356 ?auto_107355 ) ) ( not ( = ?auto_107356 ?auto_107354 ) ) ( not ( = ?auto_107350 ?auto_107356 ) ) ( not ( = ?auto_107351 ?auto_107356 ) ) ( not ( = ?auto_107352 ?auto_107356 ) ) ( not ( = ?auto_107353 ?auto_107356 ) ) ( ON ?auto_107353 ?auto_107354 ) ( ON ?auto_107352 ?auto_107353 ) ( CLEAR ?auto_107350 ) ( ON ?auto_107351 ?auto_107352 ) ( CLEAR ?auto_107351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107356 ?auto_107357 ?auto_107355 ?auto_107354 ?auto_107353 ?auto_107352 )
      ( MAKE-6PILE ?auto_107350 ?auto_107351 ?auto_107352 ?auto_107353 ?auto_107354 ?auto_107355 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107358 - BLOCK
      ?auto_107359 - BLOCK
      ?auto_107360 - BLOCK
      ?auto_107361 - BLOCK
      ?auto_107362 - BLOCK
      ?auto_107363 - BLOCK
    )
    :vars
    (
      ?auto_107365 - BLOCK
      ?auto_107364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107358 ?auto_107359 ) ) ( not ( = ?auto_107358 ?auto_107360 ) ) ( not ( = ?auto_107358 ?auto_107361 ) ) ( not ( = ?auto_107358 ?auto_107362 ) ) ( not ( = ?auto_107358 ?auto_107363 ) ) ( not ( = ?auto_107359 ?auto_107360 ) ) ( not ( = ?auto_107359 ?auto_107361 ) ) ( not ( = ?auto_107359 ?auto_107362 ) ) ( not ( = ?auto_107359 ?auto_107363 ) ) ( not ( = ?auto_107360 ?auto_107361 ) ) ( not ( = ?auto_107360 ?auto_107362 ) ) ( not ( = ?auto_107360 ?auto_107363 ) ) ( not ( = ?auto_107361 ?auto_107362 ) ) ( not ( = ?auto_107361 ?auto_107363 ) ) ( not ( = ?auto_107362 ?auto_107363 ) ) ( ON ?auto_107363 ?auto_107365 ) ( not ( = ?auto_107358 ?auto_107365 ) ) ( not ( = ?auto_107359 ?auto_107365 ) ) ( not ( = ?auto_107360 ?auto_107365 ) ) ( not ( = ?auto_107361 ?auto_107365 ) ) ( not ( = ?auto_107362 ?auto_107365 ) ) ( not ( = ?auto_107363 ?auto_107365 ) ) ( ON ?auto_107362 ?auto_107363 ) ( ON-TABLE ?auto_107364 ) ( ON ?auto_107365 ?auto_107364 ) ( not ( = ?auto_107364 ?auto_107365 ) ) ( not ( = ?auto_107364 ?auto_107363 ) ) ( not ( = ?auto_107364 ?auto_107362 ) ) ( not ( = ?auto_107358 ?auto_107364 ) ) ( not ( = ?auto_107359 ?auto_107364 ) ) ( not ( = ?auto_107360 ?auto_107364 ) ) ( not ( = ?auto_107361 ?auto_107364 ) ) ( ON ?auto_107361 ?auto_107362 ) ( ON ?auto_107360 ?auto_107361 ) ( ON ?auto_107359 ?auto_107360 ) ( CLEAR ?auto_107359 ) ( HOLDING ?auto_107358 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107358 )
      ( MAKE-6PILE ?auto_107358 ?auto_107359 ?auto_107360 ?auto_107361 ?auto_107362 ?auto_107363 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107366 - BLOCK
      ?auto_107367 - BLOCK
      ?auto_107368 - BLOCK
      ?auto_107369 - BLOCK
      ?auto_107370 - BLOCK
      ?auto_107371 - BLOCK
    )
    :vars
    (
      ?auto_107372 - BLOCK
      ?auto_107373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107366 ?auto_107367 ) ) ( not ( = ?auto_107366 ?auto_107368 ) ) ( not ( = ?auto_107366 ?auto_107369 ) ) ( not ( = ?auto_107366 ?auto_107370 ) ) ( not ( = ?auto_107366 ?auto_107371 ) ) ( not ( = ?auto_107367 ?auto_107368 ) ) ( not ( = ?auto_107367 ?auto_107369 ) ) ( not ( = ?auto_107367 ?auto_107370 ) ) ( not ( = ?auto_107367 ?auto_107371 ) ) ( not ( = ?auto_107368 ?auto_107369 ) ) ( not ( = ?auto_107368 ?auto_107370 ) ) ( not ( = ?auto_107368 ?auto_107371 ) ) ( not ( = ?auto_107369 ?auto_107370 ) ) ( not ( = ?auto_107369 ?auto_107371 ) ) ( not ( = ?auto_107370 ?auto_107371 ) ) ( ON ?auto_107371 ?auto_107372 ) ( not ( = ?auto_107366 ?auto_107372 ) ) ( not ( = ?auto_107367 ?auto_107372 ) ) ( not ( = ?auto_107368 ?auto_107372 ) ) ( not ( = ?auto_107369 ?auto_107372 ) ) ( not ( = ?auto_107370 ?auto_107372 ) ) ( not ( = ?auto_107371 ?auto_107372 ) ) ( ON ?auto_107370 ?auto_107371 ) ( ON-TABLE ?auto_107373 ) ( ON ?auto_107372 ?auto_107373 ) ( not ( = ?auto_107373 ?auto_107372 ) ) ( not ( = ?auto_107373 ?auto_107371 ) ) ( not ( = ?auto_107373 ?auto_107370 ) ) ( not ( = ?auto_107366 ?auto_107373 ) ) ( not ( = ?auto_107367 ?auto_107373 ) ) ( not ( = ?auto_107368 ?auto_107373 ) ) ( not ( = ?auto_107369 ?auto_107373 ) ) ( ON ?auto_107369 ?auto_107370 ) ( ON ?auto_107368 ?auto_107369 ) ( ON ?auto_107367 ?auto_107368 ) ( ON ?auto_107366 ?auto_107367 ) ( CLEAR ?auto_107366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107373 ?auto_107372 ?auto_107371 ?auto_107370 ?auto_107369 ?auto_107368 ?auto_107367 )
      ( MAKE-6PILE ?auto_107366 ?auto_107367 ?auto_107368 ?auto_107369 ?auto_107370 ?auto_107371 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107375 - BLOCK
    )
    :vars
    (
      ?auto_107376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107376 ?auto_107375 ) ( CLEAR ?auto_107376 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107375 ) ( not ( = ?auto_107375 ?auto_107376 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107376 ?auto_107375 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107377 - BLOCK
    )
    :vars
    (
      ?auto_107378 - BLOCK
      ?auto_107379 - BLOCK
      ?auto_107380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107378 ?auto_107377 ) ( CLEAR ?auto_107378 ) ( ON-TABLE ?auto_107377 ) ( not ( = ?auto_107377 ?auto_107378 ) ) ( HOLDING ?auto_107379 ) ( CLEAR ?auto_107380 ) ( not ( = ?auto_107377 ?auto_107379 ) ) ( not ( = ?auto_107377 ?auto_107380 ) ) ( not ( = ?auto_107378 ?auto_107379 ) ) ( not ( = ?auto_107378 ?auto_107380 ) ) ( not ( = ?auto_107379 ?auto_107380 ) ) )
    :subtasks
    ( ( !STACK ?auto_107379 ?auto_107380 )
      ( MAKE-1PILE ?auto_107377 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107381 - BLOCK
    )
    :vars
    (
      ?auto_107383 - BLOCK
      ?auto_107382 - BLOCK
      ?auto_107384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107383 ?auto_107381 ) ( ON-TABLE ?auto_107381 ) ( not ( = ?auto_107381 ?auto_107383 ) ) ( CLEAR ?auto_107382 ) ( not ( = ?auto_107381 ?auto_107384 ) ) ( not ( = ?auto_107381 ?auto_107382 ) ) ( not ( = ?auto_107383 ?auto_107384 ) ) ( not ( = ?auto_107383 ?auto_107382 ) ) ( not ( = ?auto_107384 ?auto_107382 ) ) ( ON ?auto_107384 ?auto_107383 ) ( CLEAR ?auto_107384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107381 ?auto_107383 )
      ( MAKE-1PILE ?auto_107381 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107385 - BLOCK
    )
    :vars
    (
      ?auto_107388 - BLOCK
      ?auto_107387 - BLOCK
      ?auto_107386 - BLOCK
      ?auto_107391 - BLOCK
      ?auto_107390 - BLOCK
      ?auto_107392 - BLOCK
      ?auto_107389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107388 ?auto_107385 ) ( ON-TABLE ?auto_107385 ) ( not ( = ?auto_107385 ?auto_107388 ) ) ( not ( = ?auto_107385 ?auto_107387 ) ) ( not ( = ?auto_107385 ?auto_107386 ) ) ( not ( = ?auto_107388 ?auto_107387 ) ) ( not ( = ?auto_107388 ?auto_107386 ) ) ( not ( = ?auto_107387 ?auto_107386 ) ) ( ON ?auto_107387 ?auto_107388 ) ( CLEAR ?auto_107387 ) ( HOLDING ?auto_107386 ) ( CLEAR ?auto_107391 ) ( ON-TABLE ?auto_107390 ) ( ON ?auto_107392 ?auto_107390 ) ( ON ?auto_107389 ?auto_107392 ) ( ON ?auto_107391 ?auto_107389 ) ( not ( = ?auto_107390 ?auto_107392 ) ) ( not ( = ?auto_107390 ?auto_107389 ) ) ( not ( = ?auto_107390 ?auto_107391 ) ) ( not ( = ?auto_107390 ?auto_107386 ) ) ( not ( = ?auto_107392 ?auto_107389 ) ) ( not ( = ?auto_107392 ?auto_107391 ) ) ( not ( = ?auto_107392 ?auto_107386 ) ) ( not ( = ?auto_107389 ?auto_107391 ) ) ( not ( = ?auto_107389 ?auto_107386 ) ) ( not ( = ?auto_107391 ?auto_107386 ) ) ( not ( = ?auto_107385 ?auto_107391 ) ) ( not ( = ?auto_107385 ?auto_107390 ) ) ( not ( = ?auto_107385 ?auto_107392 ) ) ( not ( = ?auto_107385 ?auto_107389 ) ) ( not ( = ?auto_107388 ?auto_107391 ) ) ( not ( = ?auto_107388 ?auto_107390 ) ) ( not ( = ?auto_107388 ?auto_107392 ) ) ( not ( = ?auto_107388 ?auto_107389 ) ) ( not ( = ?auto_107387 ?auto_107391 ) ) ( not ( = ?auto_107387 ?auto_107390 ) ) ( not ( = ?auto_107387 ?auto_107392 ) ) ( not ( = ?auto_107387 ?auto_107389 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107390 ?auto_107392 ?auto_107389 ?auto_107391 ?auto_107386 )
      ( MAKE-1PILE ?auto_107385 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107393 - BLOCK
    )
    :vars
    (
      ?auto_107397 - BLOCK
      ?auto_107396 - BLOCK
      ?auto_107395 - BLOCK
      ?auto_107400 - BLOCK
      ?auto_107398 - BLOCK
      ?auto_107394 - BLOCK
      ?auto_107399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107397 ?auto_107393 ) ( ON-TABLE ?auto_107393 ) ( not ( = ?auto_107393 ?auto_107397 ) ) ( not ( = ?auto_107393 ?auto_107396 ) ) ( not ( = ?auto_107393 ?auto_107395 ) ) ( not ( = ?auto_107397 ?auto_107396 ) ) ( not ( = ?auto_107397 ?auto_107395 ) ) ( not ( = ?auto_107396 ?auto_107395 ) ) ( ON ?auto_107396 ?auto_107397 ) ( CLEAR ?auto_107400 ) ( ON-TABLE ?auto_107398 ) ( ON ?auto_107394 ?auto_107398 ) ( ON ?auto_107399 ?auto_107394 ) ( ON ?auto_107400 ?auto_107399 ) ( not ( = ?auto_107398 ?auto_107394 ) ) ( not ( = ?auto_107398 ?auto_107399 ) ) ( not ( = ?auto_107398 ?auto_107400 ) ) ( not ( = ?auto_107398 ?auto_107395 ) ) ( not ( = ?auto_107394 ?auto_107399 ) ) ( not ( = ?auto_107394 ?auto_107400 ) ) ( not ( = ?auto_107394 ?auto_107395 ) ) ( not ( = ?auto_107399 ?auto_107400 ) ) ( not ( = ?auto_107399 ?auto_107395 ) ) ( not ( = ?auto_107400 ?auto_107395 ) ) ( not ( = ?auto_107393 ?auto_107400 ) ) ( not ( = ?auto_107393 ?auto_107398 ) ) ( not ( = ?auto_107393 ?auto_107394 ) ) ( not ( = ?auto_107393 ?auto_107399 ) ) ( not ( = ?auto_107397 ?auto_107400 ) ) ( not ( = ?auto_107397 ?auto_107398 ) ) ( not ( = ?auto_107397 ?auto_107394 ) ) ( not ( = ?auto_107397 ?auto_107399 ) ) ( not ( = ?auto_107396 ?auto_107400 ) ) ( not ( = ?auto_107396 ?auto_107398 ) ) ( not ( = ?auto_107396 ?auto_107394 ) ) ( not ( = ?auto_107396 ?auto_107399 ) ) ( ON ?auto_107395 ?auto_107396 ) ( CLEAR ?auto_107395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107393 ?auto_107397 ?auto_107396 )
      ( MAKE-1PILE ?auto_107393 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107401 - BLOCK
    )
    :vars
    (
      ?auto_107408 - BLOCK
      ?auto_107407 - BLOCK
      ?auto_107402 - BLOCK
      ?auto_107405 - BLOCK
      ?auto_107403 - BLOCK
      ?auto_107406 - BLOCK
      ?auto_107404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107408 ?auto_107401 ) ( ON-TABLE ?auto_107401 ) ( not ( = ?auto_107401 ?auto_107408 ) ) ( not ( = ?auto_107401 ?auto_107407 ) ) ( not ( = ?auto_107401 ?auto_107402 ) ) ( not ( = ?auto_107408 ?auto_107407 ) ) ( not ( = ?auto_107408 ?auto_107402 ) ) ( not ( = ?auto_107407 ?auto_107402 ) ) ( ON ?auto_107407 ?auto_107408 ) ( ON-TABLE ?auto_107405 ) ( ON ?auto_107403 ?auto_107405 ) ( ON ?auto_107406 ?auto_107403 ) ( not ( = ?auto_107405 ?auto_107403 ) ) ( not ( = ?auto_107405 ?auto_107406 ) ) ( not ( = ?auto_107405 ?auto_107404 ) ) ( not ( = ?auto_107405 ?auto_107402 ) ) ( not ( = ?auto_107403 ?auto_107406 ) ) ( not ( = ?auto_107403 ?auto_107404 ) ) ( not ( = ?auto_107403 ?auto_107402 ) ) ( not ( = ?auto_107406 ?auto_107404 ) ) ( not ( = ?auto_107406 ?auto_107402 ) ) ( not ( = ?auto_107404 ?auto_107402 ) ) ( not ( = ?auto_107401 ?auto_107404 ) ) ( not ( = ?auto_107401 ?auto_107405 ) ) ( not ( = ?auto_107401 ?auto_107403 ) ) ( not ( = ?auto_107401 ?auto_107406 ) ) ( not ( = ?auto_107408 ?auto_107404 ) ) ( not ( = ?auto_107408 ?auto_107405 ) ) ( not ( = ?auto_107408 ?auto_107403 ) ) ( not ( = ?auto_107408 ?auto_107406 ) ) ( not ( = ?auto_107407 ?auto_107404 ) ) ( not ( = ?auto_107407 ?auto_107405 ) ) ( not ( = ?auto_107407 ?auto_107403 ) ) ( not ( = ?auto_107407 ?auto_107406 ) ) ( ON ?auto_107402 ?auto_107407 ) ( CLEAR ?auto_107402 ) ( HOLDING ?auto_107404 ) ( CLEAR ?auto_107406 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107405 ?auto_107403 ?auto_107406 ?auto_107404 )
      ( MAKE-1PILE ?auto_107401 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107409 - BLOCK
    )
    :vars
    (
      ?auto_107413 - BLOCK
      ?auto_107410 - BLOCK
      ?auto_107414 - BLOCK
      ?auto_107411 - BLOCK
      ?auto_107412 - BLOCK
      ?auto_107416 - BLOCK
      ?auto_107415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107413 ?auto_107409 ) ( ON-TABLE ?auto_107409 ) ( not ( = ?auto_107409 ?auto_107413 ) ) ( not ( = ?auto_107409 ?auto_107410 ) ) ( not ( = ?auto_107409 ?auto_107414 ) ) ( not ( = ?auto_107413 ?auto_107410 ) ) ( not ( = ?auto_107413 ?auto_107414 ) ) ( not ( = ?auto_107410 ?auto_107414 ) ) ( ON ?auto_107410 ?auto_107413 ) ( ON-TABLE ?auto_107411 ) ( ON ?auto_107412 ?auto_107411 ) ( ON ?auto_107416 ?auto_107412 ) ( not ( = ?auto_107411 ?auto_107412 ) ) ( not ( = ?auto_107411 ?auto_107416 ) ) ( not ( = ?auto_107411 ?auto_107415 ) ) ( not ( = ?auto_107411 ?auto_107414 ) ) ( not ( = ?auto_107412 ?auto_107416 ) ) ( not ( = ?auto_107412 ?auto_107415 ) ) ( not ( = ?auto_107412 ?auto_107414 ) ) ( not ( = ?auto_107416 ?auto_107415 ) ) ( not ( = ?auto_107416 ?auto_107414 ) ) ( not ( = ?auto_107415 ?auto_107414 ) ) ( not ( = ?auto_107409 ?auto_107415 ) ) ( not ( = ?auto_107409 ?auto_107411 ) ) ( not ( = ?auto_107409 ?auto_107412 ) ) ( not ( = ?auto_107409 ?auto_107416 ) ) ( not ( = ?auto_107413 ?auto_107415 ) ) ( not ( = ?auto_107413 ?auto_107411 ) ) ( not ( = ?auto_107413 ?auto_107412 ) ) ( not ( = ?auto_107413 ?auto_107416 ) ) ( not ( = ?auto_107410 ?auto_107415 ) ) ( not ( = ?auto_107410 ?auto_107411 ) ) ( not ( = ?auto_107410 ?auto_107412 ) ) ( not ( = ?auto_107410 ?auto_107416 ) ) ( ON ?auto_107414 ?auto_107410 ) ( CLEAR ?auto_107416 ) ( ON ?auto_107415 ?auto_107414 ) ( CLEAR ?auto_107415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107409 ?auto_107413 ?auto_107410 ?auto_107414 )
      ( MAKE-1PILE ?auto_107409 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107417 - BLOCK
    )
    :vars
    (
      ?auto_107421 - BLOCK
      ?auto_107418 - BLOCK
      ?auto_107420 - BLOCK
      ?auto_107422 - BLOCK
      ?auto_107424 - BLOCK
      ?auto_107419 - BLOCK
      ?auto_107423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107421 ?auto_107417 ) ( ON-TABLE ?auto_107417 ) ( not ( = ?auto_107417 ?auto_107421 ) ) ( not ( = ?auto_107417 ?auto_107418 ) ) ( not ( = ?auto_107417 ?auto_107420 ) ) ( not ( = ?auto_107421 ?auto_107418 ) ) ( not ( = ?auto_107421 ?auto_107420 ) ) ( not ( = ?auto_107418 ?auto_107420 ) ) ( ON ?auto_107418 ?auto_107421 ) ( ON-TABLE ?auto_107422 ) ( ON ?auto_107424 ?auto_107422 ) ( not ( = ?auto_107422 ?auto_107424 ) ) ( not ( = ?auto_107422 ?auto_107419 ) ) ( not ( = ?auto_107422 ?auto_107423 ) ) ( not ( = ?auto_107422 ?auto_107420 ) ) ( not ( = ?auto_107424 ?auto_107419 ) ) ( not ( = ?auto_107424 ?auto_107423 ) ) ( not ( = ?auto_107424 ?auto_107420 ) ) ( not ( = ?auto_107419 ?auto_107423 ) ) ( not ( = ?auto_107419 ?auto_107420 ) ) ( not ( = ?auto_107423 ?auto_107420 ) ) ( not ( = ?auto_107417 ?auto_107423 ) ) ( not ( = ?auto_107417 ?auto_107422 ) ) ( not ( = ?auto_107417 ?auto_107424 ) ) ( not ( = ?auto_107417 ?auto_107419 ) ) ( not ( = ?auto_107421 ?auto_107423 ) ) ( not ( = ?auto_107421 ?auto_107422 ) ) ( not ( = ?auto_107421 ?auto_107424 ) ) ( not ( = ?auto_107421 ?auto_107419 ) ) ( not ( = ?auto_107418 ?auto_107423 ) ) ( not ( = ?auto_107418 ?auto_107422 ) ) ( not ( = ?auto_107418 ?auto_107424 ) ) ( not ( = ?auto_107418 ?auto_107419 ) ) ( ON ?auto_107420 ?auto_107418 ) ( ON ?auto_107423 ?auto_107420 ) ( CLEAR ?auto_107423 ) ( HOLDING ?auto_107419 ) ( CLEAR ?auto_107424 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107422 ?auto_107424 ?auto_107419 )
      ( MAKE-1PILE ?auto_107417 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107425 - BLOCK
    )
    :vars
    (
      ?auto_107432 - BLOCK
      ?auto_107429 - BLOCK
      ?auto_107426 - BLOCK
      ?auto_107430 - BLOCK
      ?auto_107427 - BLOCK
      ?auto_107431 - BLOCK
      ?auto_107428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107432 ?auto_107425 ) ( ON-TABLE ?auto_107425 ) ( not ( = ?auto_107425 ?auto_107432 ) ) ( not ( = ?auto_107425 ?auto_107429 ) ) ( not ( = ?auto_107425 ?auto_107426 ) ) ( not ( = ?auto_107432 ?auto_107429 ) ) ( not ( = ?auto_107432 ?auto_107426 ) ) ( not ( = ?auto_107429 ?auto_107426 ) ) ( ON ?auto_107429 ?auto_107432 ) ( ON-TABLE ?auto_107430 ) ( ON ?auto_107427 ?auto_107430 ) ( not ( = ?auto_107430 ?auto_107427 ) ) ( not ( = ?auto_107430 ?auto_107431 ) ) ( not ( = ?auto_107430 ?auto_107428 ) ) ( not ( = ?auto_107430 ?auto_107426 ) ) ( not ( = ?auto_107427 ?auto_107431 ) ) ( not ( = ?auto_107427 ?auto_107428 ) ) ( not ( = ?auto_107427 ?auto_107426 ) ) ( not ( = ?auto_107431 ?auto_107428 ) ) ( not ( = ?auto_107431 ?auto_107426 ) ) ( not ( = ?auto_107428 ?auto_107426 ) ) ( not ( = ?auto_107425 ?auto_107428 ) ) ( not ( = ?auto_107425 ?auto_107430 ) ) ( not ( = ?auto_107425 ?auto_107427 ) ) ( not ( = ?auto_107425 ?auto_107431 ) ) ( not ( = ?auto_107432 ?auto_107428 ) ) ( not ( = ?auto_107432 ?auto_107430 ) ) ( not ( = ?auto_107432 ?auto_107427 ) ) ( not ( = ?auto_107432 ?auto_107431 ) ) ( not ( = ?auto_107429 ?auto_107428 ) ) ( not ( = ?auto_107429 ?auto_107430 ) ) ( not ( = ?auto_107429 ?auto_107427 ) ) ( not ( = ?auto_107429 ?auto_107431 ) ) ( ON ?auto_107426 ?auto_107429 ) ( ON ?auto_107428 ?auto_107426 ) ( CLEAR ?auto_107427 ) ( ON ?auto_107431 ?auto_107428 ) ( CLEAR ?auto_107431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107425 ?auto_107432 ?auto_107429 ?auto_107426 ?auto_107428 )
      ( MAKE-1PILE ?auto_107425 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107433 - BLOCK
    )
    :vars
    (
      ?auto_107437 - BLOCK
      ?auto_107439 - BLOCK
      ?auto_107434 - BLOCK
      ?auto_107440 - BLOCK
      ?auto_107438 - BLOCK
      ?auto_107435 - BLOCK
      ?auto_107436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107437 ?auto_107433 ) ( ON-TABLE ?auto_107433 ) ( not ( = ?auto_107433 ?auto_107437 ) ) ( not ( = ?auto_107433 ?auto_107439 ) ) ( not ( = ?auto_107433 ?auto_107434 ) ) ( not ( = ?auto_107437 ?auto_107439 ) ) ( not ( = ?auto_107437 ?auto_107434 ) ) ( not ( = ?auto_107439 ?auto_107434 ) ) ( ON ?auto_107439 ?auto_107437 ) ( ON-TABLE ?auto_107440 ) ( not ( = ?auto_107440 ?auto_107438 ) ) ( not ( = ?auto_107440 ?auto_107435 ) ) ( not ( = ?auto_107440 ?auto_107436 ) ) ( not ( = ?auto_107440 ?auto_107434 ) ) ( not ( = ?auto_107438 ?auto_107435 ) ) ( not ( = ?auto_107438 ?auto_107436 ) ) ( not ( = ?auto_107438 ?auto_107434 ) ) ( not ( = ?auto_107435 ?auto_107436 ) ) ( not ( = ?auto_107435 ?auto_107434 ) ) ( not ( = ?auto_107436 ?auto_107434 ) ) ( not ( = ?auto_107433 ?auto_107436 ) ) ( not ( = ?auto_107433 ?auto_107440 ) ) ( not ( = ?auto_107433 ?auto_107438 ) ) ( not ( = ?auto_107433 ?auto_107435 ) ) ( not ( = ?auto_107437 ?auto_107436 ) ) ( not ( = ?auto_107437 ?auto_107440 ) ) ( not ( = ?auto_107437 ?auto_107438 ) ) ( not ( = ?auto_107437 ?auto_107435 ) ) ( not ( = ?auto_107439 ?auto_107436 ) ) ( not ( = ?auto_107439 ?auto_107440 ) ) ( not ( = ?auto_107439 ?auto_107438 ) ) ( not ( = ?auto_107439 ?auto_107435 ) ) ( ON ?auto_107434 ?auto_107439 ) ( ON ?auto_107436 ?auto_107434 ) ( ON ?auto_107435 ?auto_107436 ) ( CLEAR ?auto_107435 ) ( HOLDING ?auto_107438 ) ( CLEAR ?auto_107440 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107440 ?auto_107438 )
      ( MAKE-1PILE ?auto_107433 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108847 - BLOCK
    )
    :vars
    (
      ?auto_108851 - BLOCK
      ?auto_108849 - BLOCK
      ?auto_108852 - BLOCK
      ?auto_108853 - BLOCK
      ?auto_108848 - BLOCK
      ?auto_108850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108851 ?auto_108847 ) ( ON-TABLE ?auto_108847 ) ( not ( = ?auto_108847 ?auto_108851 ) ) ( not ( = ?auto_108847 ?auto_108849 ) ) ( not ( = ?auto_108847 ?auto_108852 ) ) ( not ( = ?auto_108851 ?auto_108849 ) ) ( not ( = ?auto_108851 ?auto_108852 ) ) ( not ( = ?auto_108849 ?auto_108852 ) ) ( ON ?auto_108849 ?auto_108851 ) ( not ( = ?auto_108853 ?auto_108848 ) ) ( not ( = ?auto_108853 ?auto_108850 ) ) ( not ( = ?auto_108853 ?auto_108852 ) ) ( not ( = ?auto_108848 ?auto_108850 ) ) ( not ( = ?auto_108848 ?auto_108852 ) ) ( not ( = ?auto_108850 ?auto_108852 ) ) ( not ( = ?auto_108847 ?auto_108850 ) ) ( not ( = ?auto_108847 ?auto_108853 ) ) ( not ( = ?auto_108847 ?auto_108848 ) ) ( not ( = ?auto_108851 ?auto_108850 ) ) ( not ( = ?auto_108851 ?auto_108853 ) ) ( not ( = ?auto_108851 ?auto_108848 ) ) ( not ( = ?auto_108849 ?auto_108850 ) ) ( not ( = ?auto_108849 ?auto_108853 ) ) ( not ( = ?auto_108849 ?auto_108848 ) ) ( ON ?auto_108852 ?auto_108849 ) ( ON ?auto_108850 ?auto_108852 ) ( ON ?auto_108848 ?auto_108850 ) ( ON ?auto_108853 ?auto_108848 ) ( CLEAR ?auto_108853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108847 ?auto_108851 ?auto_108849 ?auto_108852 ?auto_108850 ?auto_108848 )
      ( MAKE-1PILE ?auto_108847 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107449 - BLOCK
    )
    :vars
    (
      ?auto_107456 - BLOCK
      ?auto_107451 - BLOCK
      ?auto_107453 - BLOCK
      ?auto_107450 - BLOCK
      ?auto_107454 - BLOCK
      ?auto_107452 - BLOCK
      ?auto_107455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107456 ?auto_107449 ) ( ON-TABLE ?auto_107449 ) ( not ( = ?auto_107449 ?auto_107456 ) ) ( not ( = ?auto_107449 ?auto_107451 ) ) ( not ( = ?auto_107449 ?auto_107453 ) ) ( not ( = ?auto_107456 ?auto_107451 ) ) ( not ( = ?auto_107456 ?auto_107453 ) ) ( not ( = ?auto_107451 ?auto_107453 ) ) ( ON ?auto_107451 ?auto_107456 ) ( not ( = ?auto_107450 ?auto_107454 ) ) ( not ( = ?auto_107450 ?auto_107452 ) ) ( not ( = ?auto_107450 ?auto_107455 ) ) ( not ( = ?auto_107450 ?auto_107453 ) ) ( not ( = ?auto_107454 ?auto_107452 ) ) ( not ( = ?auto_107454 ?auto_107455 ) ) ( not ( = ?auto_107454 ?auto_107453 ) ) ( not ( = ?auto_107452 ?auto_107455 ) ) ( not ( = ?auto_107452 ?auto_107453 ) ) ( not ( = ?auto_107455 ?auto_107453 ) ) ( not ( = ?auto_107449 ?auto_107455 ) ) ( not ( = ?auto_107449 ?auto_107450 ) ) ( not ( = ?auto_107449 ?auto_107454 ) ) ( not ( = ?auto_107449 ?auto_107452 ) ) ( not ( = ?auto_107456 ?auto_107455 ) ) ( not ( = ?auto_107456 ?auto_107450 ) ) ( not ( = ?auto_107456 ?auto_107454 ) ) ( not ( = ?auto_107456 ?auto_107452 ) ) ( not ( = ?auto_107451 ?auto_107455 ) ) ( not ( = ?auto_107451 ?auto_107450 ) ) ( not ( = ?auto_107451 ?auto_107454 ) ) ( not ( = ?auto_107451 ?auto_107452 ) ) ( ON ?auto_107453 ?auto_107451 ) ( ON ?auto_107455 ?auto_107453 ) ( ON ?auto_107452 ?auto_107455 ) ( ON ?auto_107454 ?auto_107452 ) ( CLEAR ?auto_107454 ) ( HOLDING ?auto_107450 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107450 )
      ( MAKE-1PILE ?auto_107449 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107457 - BLOCK
    )
    :vars
    (
      ?auto_107461 - BLOCK
      ?auto_107463 - BLOCK
      ?auto_107458 - BLOCK
      ?auto_107462 - BLOCK
      ?auto_107460 - BLOCK
      ?auto_107459 - BLOCK
      ?auto_107464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107461 ?auto_107457 ) ( ON-TABLE ?auto_107457 ) ( not ( = ?auto_107457 ?auto_107461 ) ) ( not ( = ?auto_107457 ?auto_107463 ) ) ( not ( = ?auto_107457 ?auto_107458 ) ) ( not ( = ?auto_107461 ?auto_107463 ) ) ( not ( = ?auto_107461 ?auto_107458 ) ) ( not ( = ?auto_107463 ?auto_107458 ) ) ( ON ?auto_107463 ?auto_107461 ) ( not ( = ?auto_107462 ?auto_107460 ) ) ( not ( = ?auto_107462 ?auto_107459 ) ) ( not ( = ?auto_107462 ?auto_107464 ) ) ( not ( = ?auto_107462 ?auto_107458 ) ) ( not ( = ?auto_107460 ?auto_107459 ) ) ( not ( = ?auto_107460 ?auto_107464 ) ) ( not ( = ?auto_107460 ?auto_107458 ) ) ( not ( = ?auto_107459 ?auto_107464 ) ) ( not ( = ?auto_107459 ?auto_107458 ) ) ( not ( = ?auto_107464 ?auto_107458 ) ) ( not ( = ?auto_107457 ?auto_107464 ) ) ( not ( = ?auto_107457 ?auto_107462 ) ) ( not ( = ?auto_107457 ?auto_107460 ) ) ( not ( = ?auto_107457 ?auto_107459 ) ) ( not ( = ?auto_107461 ?auto_107464 ) ) ( not ( = ?auto_107461 ?auto_107462 ) ) ( not ( = ?auto_107461 ?auto_107460 ) ) ( not ( = ?auto_107461 ?auto_107459 ) ) ( not ( = ?auto_107463 ?auto_107464 ) ) ( not ( = ?auto_107463 ?auto_107462 ) ) ( not ( = ?auto_107463 ?auto_107460 ) ) ( not ( = ?auto_107463 ?auto_107459 ) ) ( ON ?auto_107458 ?auto_107463 ) ( ON ?auto_107464 ?auto_107458 ) ( ON ?auto_107459 ?auto_107464 ) ( ON ?auto_107460 ?auto_107459 ) ( ON ?auto_107462 ?auto_107460 ) ( CLEAR ?auto_107462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107457 ?auto_107461 ?auto_107463 ?auto_107458 ?auto_107464 ?auto_107459 ?auto_107460 )
      ( MAKE-1PILE ?auto_107457 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107472 - BLOCK
      ?auto_107473 - BLOCK
      ?auto_107474 - BLOCK
      ?auto_107475 - BLOCK
      ?auto_107476 - BLOCK
      ?auto_107477 - BLOCK
      ?auto_107478 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_107478 ) ( CLEAR ?auto_107477 ) ( ON-TABLE ?auto_107472 ) ( ON ?auto_107473 ?auto_107472 ) ( ON ?auto_107474 ?auto_107473 ) ( ON ?auto_107475 ?auto_107474 ) ( ON ?auto_107476 ?auto_107475 ) ( ON ?auto_107477 ?auto_107476 ) ( not ( = ?auto_107472 ?auto_107473 ) ) ( not ( = ?auto_107472 ?auto_107474 ) ) ( not ( = ?auto_107472 ?auto_107475 ) ) ( not ( = ?auto_107472 ?auto_107476 ) ) ( not ( = ?auto_107472 ?auto_107477 ) ) ( not ( = ?auto_107472 ?auto_107478 ) ) ( not ( = ?auto_107473 ?auto_107474 ) ) ( not ( = ?auto_107473 ?auto_107475 ) ) ( not ( = ?auto_107473 ?auto_107476 ) ) ( not ( = ?auto_107473 ?auto_107477 ) ) ( not ( = ?auto_107473 ?auto_107478 ) ) ( not ( = ?auto_107474 ?auto_107475 ) ) ( not ( = ?auto_107474 ?auto_107476 ) ) ( not ( = ?auto_107474 ?auto_107477 ) ) ( not ( = ?auto_107474 ?auto_107478 ) ) ( not ( = ?auto_107475 ?auto_107476 ) ) ( not ( = ?auto_107475 ?auto_107477 ) ) ( not ( = ?auto_107475 ?auto_107478 ) ) ( not ( = ?auto_107476 ?auto_107477 ) ) ( not ( = ?auto_107476 ?auto_107478 ) ) ( not ( = ?auto_107477 ?auto_107478 ) ) )
    :subtasks
    ( ( !STACK ?auto_107478 ?auto_107477 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107479 - BLOCK
      ?auto_107480 - BLOCK
      ?auto_107481 - BLOCK
      ?auto_107482 - BLOCK
      ?auto_107483 - BLOCK
      ?auto_107484 - BLOCK
      ?auto_107485 - BLOCK
    )
    :vars
    (
      ?auto_107486 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_107484 ) ( ON-TABLE ?auto_107479 ) ( ON ?auto_107480 ?auto_107479 ) ( ON ?auto_107481 ?auto_107480 ) ( ON ?auto_107482 ?auto_107481 ) ( ON ?auto_107483 ?auto_107482 ) ( ON ?auto_107484 ?auto_107483 ) ( not ( = ?auto_107479 ?auto_107480 ) ) ( not ( = ?auto_107479 ?auto_107481 ) ) ( not ( = ?auto_107479 ?auto_107482 ) ) ( not ( = ?auto_107479 ?auto_107483 ) ) ( not ( = ?auto_107479 ?auto_107484 ) ) ( not ( = ?auto_107479 ?auto_107485 ) ) ( not ( = ?auto_107480 ?auto_107481 ) ) ( not ( = ?auto_107480 ?auto_107482 ) ) ( not ( = ?auto_107480 ?auto_107483 ) ) ( not ( = ?auto_107480 ?auto_107484 ) ) ( not ( = ?auto_107480 ?auto_107485 ) ) ( not ( = ?auto_107481 ?auto_107482 ) ) ( not ( = ?auto_107481 ?auto_107483 ) ) ( not ( = ?auto_107481 ?auto_107484 ) ) ( not ( = ?auto_107481 ?auto_107485 ) ) ( not ( = ?auto_107482 ?auto_107483 ) ) ( not ( = ?auto_107482 ?auto_107484 ) ) ( not ( = ?auto_107482 ?auto_107485 ) ) ( not ( = ?auto_107483 ?auto_107484 ) ) ( not ( = ?auto_107483 ?auto_107485 ) ) ( not ( = ?auto_107484 ?auto_107485 ) ) ( ON ?auto_107485 ?auto_107486 ) ( CLEAR ?auto_107485 ) ( HAND-EMPTY ) ( not ( = ?auto_107479 ?auto_107486 ) ) ( not ( = ?auto_107480 ?auto_107486 ) ) ( not ( = ?auto_107481 ?auto_107486 ) ) ( not ( = ?auto_107482 ?auto_107486 ) ) ( not ( = ?auto_107483 ?auto_107486 ) ) ( not ( = ?auto_107484 ?auto_107486 ) ) ( not ( = ?auto_107485 ?auto_107486 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107485 ?auto_107486 )
      ( MAKE-7PILE ?auto_107479 ?auto_107480 ?auto_107481 ?auto_107482 ?auto_107483 ?auto_107484 ?auto_107485 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107487 - BLOCK
      ?auto_107488 - BLOCK
      ?auto_107489 - BLOCK
      ?auto_107490 - BLOCK
      ?auto_107491 - BLOCK
      ?auto_107492 - BLOCK
      ?auto_107493 - BLOCK
    )
    :vars
    (
      ?auto_107494 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107487 ) ( ON ?auto_107488 ?auto_107487 ) ( ON ?auto_107489 ?auto_107488 ) ( ON ?auto_107490 ?auto_107489 ) ( ON ?auto_107491 ?auto_107490 ) ( not ( = ?auto_107487 ?auto_107488 ) ) ( not ( = ?auto_107487 ?auto_107489 ) ) ( not ( = ?auto_107487 ?auto_107490 ) ) ( not ( = ?auto_107487 ?auto_107491 ) ) ( not ( = ?auto_107487 ?auto_107492 ) ) ( not ( = ?auto_107487 ?auto_107493 ) ) ( not ( = ?auto_107488 ?auto_107489 ) ) ( not ( = ?auto_107488 ?auto_107490 ) ) ( not ( = ?auto_107488 ?auto_107491 ) ) ( not ( = ?auto_107488 ?auto_107492 ) ) ( not ( = ?auto_107488 ?auto_107493 ) ) ( not ( = ?auto_107489 ?auto_107490 ) ) ( not ( = ?auto_107489 ?auto_107491 ) ) ( not ( = ?auto_107489 ?auto_107492 ) ) ( not ( = ?auto_107489 ?auto_107493 ) ) ( not ( = ?auto_107490 ?auto_107491 ) ) ( not ( = ?auto_107490 ?auto_107492 ) ) ( not ( = ?auto_107490 ?auto_107493 ) ) ( not ( = ?auto_107491 ?auto_107492 ) ) ( not ( = ?auto_107491 ?auto_107493 ) ) ( not ( = ?auto_107492 ?auto_107493 ) ) ( ON ?auto_107493 ?auto_107494 ) ( CLEAR ?auto_107493 ) ( not ( = ?auto_107487 ?auto_107494 ) ) ( not ( = ?auto_107488 ?auto_107494 ) ) ( not ( = ?auto_107489 ?auto_107494 ) ) ( not ( = ?auto_107490 ?auto_107494 ) ) ( not ( = ?auto_107491 ?auto_107494 ) ) ( not ( = ?auto_107492 ?auto_107494 ) ) ( not ( = ?auto_107493 ?auto_107494 ) ) ( HOLDING ?auto_107492 ) ( CLEAR ?auto_107491 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107487 ?auto_107488 ?auto_107489 ?auto_107490 ?auto_107491 ?auto_107492 )
      ( MAKE-7PILE ?auto_107487 ?auto_107488 ?auto_107489 ?auto_107490 ?auto_107491 ?auto_107492 ?auto_107493 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107495 - BLOCK
      ?auto_107496 - BLOCK
      ?auto_107497 - BLOCK
      ?auto_107498 - BLOCK
      ?auto_107499 - BLOCK
      ?auto_107500 - BLOCK
      ?auto_107501 - BLOCK
    )
    :vars
    (
      ?auto_107502 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107495 ) ( ON ?auto_107496 ?auto_107495 ) ( ON ?auto_107497 ?auto_107496 ) ( ON ?auto_107498 ?auto_107497 ) ( ON ?auto_107499 ?auto_107498 ) ( not ( = ?auto_107495 ?auto_107496 ) ) ( not ( = ?auto_107495 ?auto_107497 ) ) ( not ( = ?auto_107495 ?auto_107498 ) ) ( not ( = ?auto_107495 ?auto_107499 ) ) ( not ( = ?auto_107495 ?auto_107500 ) ) ( not ( = ?auto_107495 ?auto_107501 ) ) ( not ( = ?auto_107496 ?auto_107497 ) ) ( not ( = ?auto_107496 ?auto_107498 ) ) ( not ( = ?auto_107496 ?auto_107499 ) ) ( not ( = ?auto_107496 ?auto_107500 ) ) ( not ( = ?auto_107496 ?auto_107501 ) ) ( not ( = ?auto_107497 ?auto_107498 ) ) ( not ( = ?auto_107497 ?auto_107499 ) ) ( not ( = ?auto_107497 ?auto_107500 ) ) ( not ( = ?auto_107497 ?auto_107501 ) ) ( not ( = ?auto_107498 ?auto_107499 ) ) ( not ( = ?auto_107498 ?auto_107500 ) ) ( not ( = ?auto_107498 ?auto_107501 ) ) ( not ( = ?auto_107499 ?auto_107500 ) ) ( not ( = ?auto_107499 ?auto_107501 ) ) ( not ( = ?auto_107500 ?auto_107501 ) ) ( ON ?auto_107501 ?auto_107502 ) ( not ( = ?auto_107495 ?auto_107502 ) ) ( not ( = ?auto_107496 ?auto_107502 ) ) ( not ( = ?auto_107497 ?auto_107502 ) ) ( not ( = ?auto_107498 ?auto_107502 ) ) ( not ( = ?auto_107499 ?auto_107502 ) ) ( not ( = ?auto_107500 ?auto_107502 ) ) ( not ( = ?auto_107501 ?auto_107502 ) ) ( CLEAR ?auto_107499 ) ( ON ?auto_107500 ?auto_107501 ) ( CLEAR ?auto_107500 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107502 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107502 ?auto_107501 )
      ( MAKE-7PILE ?auto_107495 ?auto_107496 ?auto_107497 ?auto_107498 ?auto_107499 ?auto_107500 ?auto_107501 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107503 - BLOCK
      ?auto_107504 - BLOCK
      ?auto_107505 - BLOCK
      ?auto_107506 - BLOCK
      ?auto_107507 - BLOCK
      ?auto_107508 - BLOCK
      ?auto_107509 - BLOCK
    )
    :vars
    (
      ?auto_107510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107503 ) ( ON ?auto_107504 ?auto_107503 ) ( ON ?auto_107505 ?auto_107504 ) ( ON ?auto_107506 ?auto_107505 ) ( not ( = ?auto_107503 ?auto_107504 ) ) ( not ( = ?auto_107503 ?auto_107505 ) ) ( not ( = ?auto_107503 ?auto_107506 ) ) ( not ( = ?auto_107503 ?auto_107507 ) ) ( not ( = ?auto_107503 ?auto_107508 ) ) ( not ( = ?auto_107503 ?auto_107509 ) ) ( not ( = ?auto_107504 ?auto_107505 ) ) ( not ( = ?auto_107504 ?auto_107506 ) ) ( not ( = ?auto_107504 ?auto_107507 ) ) ( not ( = ?auto_107504 ?auto_107508 ) ) ( not ( = ?auto_107504 ?auto_107509 ) ) ( not ( = ?auto_107505 ?auto_107506 ) ) ( not ( = ?auto_107505 ?auto_107507 ) ) ( not ( = ?auto_107505 ?auto_107508 ) ) ( not ( = ?auto_107505 ?auto_107509 ) ) ( not ( = ?auto_107506 ?auto_107507 ) ) ( not ( = ?auto_107506 ?auto_107508 ) ) ( not ( = ?auto_107506 ?auto_107509 ) ) ( not ( = ?auto_107507 ?auto_107508 ) ) ( not ( = ?auto_107507 ?auto_107509 ) ) ( not ( = ?auto_107508 ?auto_107509 ) ) ( ON ?auto_107509 ?auto_107510 ) ( not ( = ?auto_107503 ?auto_107510 ) ) ( not ( = ?auto_107504 ?auto_107510 ) ) ( not ( = ?auto_107505 ?auto_107510 ) ) ( not ( = ?auto_107506 ?auto_107510 ) ) ( not ( = ?auto_107507 ?auto_107510 ) ) ( not ( = ?auto_107508 ?auto_107510 ) ) ( not ( = ?auto_107509 ?auto_107510 ) ) ( ON ?auto_107508 ?auto_107509 ) ( CLEAR ?auto_107508 ) ( ON-TABLE ?auto_107510 ) ( HOLDING ?auto_107507 ) ( CLEAR ?auto_107506 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107503 ?auto_107504 ?auto_107505 ?auto_107506 ?auto_107507 )
      ( MAKE-7PILE ?auto_107503 ?auto_107504 ?auto_107505 ?auto_107506 ?auto_107507 ?auto_107508 ?auto_107509 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107511 - BLOCK
      ?auto_107512 - BLOCK
      ?auto_107513 - BLOCK
      ?auto_107514 - BLOCK
      ?auto_107515 - BLOCK
      ?auto_107516 - BLOCK
      ?auto_107517 - BLOCK
    )
    :vars
    (
      ?auto_107518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107511 ) ( ON ?auto_107512 ?auto_107511 ) ( ON ?auto_107513 ?auto_107512 ) ( ON ?auto_107514 ?auto_107513 ) ( not ( = ?auto_107511 ?auto_107512 ) ) ( not ( = ?auto_107511 ?auto_107513 ) ) ( not ( = ?auto_107511 ?auto_107514 ) ) ( not ( = ?auto_107511 ?auto_107515 ) ) ( not ( = ?auto_107511 ?auto_107516 ) ) ( not ( = ?auto_107511 ?auto_107517 ) ) ( not ( = ?auto_107512 ?auto_107513 ) ) ( not ( = ?auto_107512 ?auto_107514 ) ) ( not ( = ?auto_107512 ?auto_107515 ) ) ( not ( = ?auto_107512 ?auto_107516 ) ) ( not ( = ?auto_107512 ?auto_107517 ) ) ( not ( = ?auto_107513 ?auto_107514 ) ) ( not ( = ?auto_107513 ?auto_107515 ) ) ( not ( = ?auto_107513 ?auto_107516 ) ) ( not ( = ?auto_107513 ?auto_107517 ) ) ( not ( = ?auto_107514 ?auto_107515 ) ) ( not ( = ?auto_107514 ?auto_107516 ) ) ( not ( = ?auto_107514 ?auto_107517 ) ) ( not ( = ?auto_107515 ?auto_107516 ) ) ( not ( = ?auto_107515 ?auto_107517 ) ) ( not ( = ?auto_107516 ?auto_107517 ) ) ( ON ?auto_107517 ?auto_107518 ) ( not ( = ?auto_107511 ?auto_107518 ) ) ( not ( = ?auto_107512 ?auto_107518 ) ) ( not ( = ?auto_107513 ?auto_107518 ) ) ( not ( = ?auto_107514 ?auto_107518 ) ) ( not ( = ?auto_107515 ?auto_107518 ) ) ( not ( = ?auto_107516 ?auto_107518 ) ) ( not ( = ?auto_107517 ?auto_107518 ) ) ( ON ?auto_107516 ?auto_107517 ) ( ON-TABLE ?auto_107518 ) ( CLEAR ?auto_107514 ) ( ON ?auto_107515 ?auto_107516 ) ( CLEAR ?auto_107515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107518 ?auto_107517 ?auto_107516 )
      ( MAKE-7PILE ?auto_107511 ?auto_107512 ?auto_107513 ?auto_107514 ?auto_107515 ?auto_107516 ?auto_107517 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107519 - BLOCK
      ?auto_107520 - BLOCK
      ?auto_107521 - BLOCK
      ?auto_107522 - BLOCK
      ?auto_107523 - BLOCK
      ?auto_107524 - BLOCK
      ?auto_107525 - BLOCK
    )
    :vars
    (
      ?auto_107526 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107519 ) ( ON ?auto_107520 ?auto_107519 ) ( ON ?auto_107521 ?auto_107520 ) ( not ( = ?auto_107519 ?auto_107520 ) ) ( not ( = ?auto_107519 ?auto_107521 ) ) ( not ( = ?auto_107519 ?auto_107522 ) ) ( not ( = ?auto_107519 ?auto_107523 ) ) ( not ( = ?auto_107519 ?auto_107524 ) ) ( not ( = ?auto_107519 ?auto_107525 ) ) ( not ( = ?auto_107520 ?auto_107521 ) ) ( not ( = ?auto_107520 ?auto_107522 ) ) ( not ( = ?auto_107520 ?auto_107523 ) ) ( not ( = ?auto_107520 ?auto_107524 ) ) ( not ( = ?auto_107520 ?auto_107525 ) ) ( not ( = ?auto_107521 ?auto_107522 ) ) ( not ( = ?auto_107521 ?auto_107523 ) ) ( not ( = ?auto_107521 ?auto_107524 ) ) ( not ( = ?auto_107521 ?auto_107525 ) ) ( not ( = ?auto_107522 ?auto_107523 ) ) ( not ( = ?auto_107522 ?auto_107524 ) ) ( not ( = ?auto_107522 ?auto_107525 ) ) ( not ( = ?auto_107523 ?auto_107524 ) ) ( not ( = ?auto_107523 ?auto_107525 ) ) ( not ( = ?auto_107524 ?auto_107525 ) ) ( ON ?auto_107525 ?auto_107526 ) ( not ( = ?auto_107519 ?auto_107526 ) ) ( not ( = ?auto_107520 ?auto_107526 ) ) ( not ( = ?auto_107521 ?auto_107526 ) ) ( not ( = ?auto_107522 ?auto_107526 ) ) ( not ( = ?auto_107523 ?auto_107526 ) ) ( not ( = ?auto_107524 ?auto_107526 ) ) ( not ( = ?auto_107525 ?auto_107526 ) ) ( ON ?auto_107524 ?auto_107525 ) ( ON-TABLE ?auto_107526 ) ( ON ?auto_107523 ?auto_107524 ) ( CLEAR ?auto_107523 ) ( HOLDING ?auto_107522 ) ( CLEAR ?auto_107521 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107519 ?auto_107520 ?auto_107521 ?auto_107522 )
      ( MAKE-7PILE ?auto_107519 ?auto_107520 ?auto_107521 ?auto_107522 ?auto_107523 ?auto_107524 ?auto_107525 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107527 - BLOCK
      ?auto_107528 - BLOCK
      ?auto_107529 - BLOCK
      ?auto_107530 - BLOCK
      ?auto_107531 - BLOCK
      ?auto_107532 - BLOCK
      ?auto_107533 - BLOCK
    )
    :vars
    (
      ?auto_107534 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107527 ) ( ON ?auto_107528 ?auto_107527 ) ( ON ?auto_107529 ?auto_107528 ) ( not ( = ?auto_107527 ?auto_107528 ) ) ( not ( = ?auto_107527 ?auto_107529 ) ) ( not ( = ?auto_107527 ?auto_107530 ) ) ( not ( = ?auto_107527 ?auto_107531 ) ) ( not ( = ?auto_107527 ?auto_107532 ) ) ( not ( = ?auto_107527 ?auto_107533 ) ) ( not ( = ?auto_107528 ?auto_107529 ) ) ( not ( = ?auto_107528 ?auto_107530 ) ) ( not ( = ?auto_107528 ?auto_107531 ) ) ( not ( = ?auto_107528 ?auto_107532 ) ) ( not ( = ?auto_107528 ?auto_107533 ) ) ( not ( = ?auto_107529 ?auto_107530 ) ) ( not ( = ?auto_107529 ?auto_107531 ) ) ( not ( = ?auto_107529 ?auto_107532 ) ) ( not ( = ?auto_107529 ?auto_107533 ) ) ( not ( = ?auto_107530 ?auto_107531 ) ) ( not ( = ?auto_107530 ?auto_107532 ) ) ( not ( = ?auto_107530 ?auto_107533 ) ) ( not ( = ?auto_107531 ?auto_107532 ) ) ( not ( = ?auto_107531 ?auto_107533 ) ) ( not ( = ?auto_107532 ?auto_107533 ) ) ( ON ?auto_107533 ?auto_107534 ) ( not ( = ?auto_107527 ?auto_107534 ) ) ( not ( = ?auto_107528 ?auto_107534 ) ) ( not ( = ?auto_107529 ?auto_107534 ) ) ( not ( = ?auto_107530 ?auto_107534 ) ) ( not ( = ?auto_107531 ?auto_107534 ) ) ( not ( = ?auto_107532 ?auto_107534 ) ) ( not ( = ?auto_107533 ?auto_107534 ) ) ( ON ?auto_107532 ?auto_107533 ) ( ON-TABLE ?auto_107534 ) ( ON ?auto_107531 ?auto_107532 ) ( CLEAR ?auto_107529 ) ( ON ?auto_107530 ?auto_107531 ) ( CLEAR ?auto_107530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107534 ?auto_107533 ?auto_107532 ?auto_107531 )
      ( MAKE-7PILE ?auto_107527 ?auto_107528 ?auto_107529 ?auto_107530 ?auto_107531 ?auto_107532 ?auto_107533 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107535 - BLOCK
      ?auto_107536 - BLOCK
      ?auto_107537 - BLOCK
      ?auto_107538 - BLOCK
      ?auto_107539 - BLOCK
      ?auto_107540 - BLOCK
      ?auto_107541 - BLOCK
    )
    :vars
    (
      ?auto_107542 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107535 ) ( ON ?auto_107536 ?auto_107535 ) ( not ( = ?auto_107535 ?auto_107536 ) ) ( not ( = ?auto_107535 ?auto_107537 ) ) ( not ( = ?auto_107535 ?auto_107538 ) ) ( not ( = ?auto_107535 ?auto_107539 ) ) ( not ( = ?auto_107535 ?auto_107540 ) ) ( not ( = ?auto_107535 ?auto_107541 ) ) ( not ( = ?auto_107536 ?auto_107537 ) ) ( not ( = ?auto_107536 ?auto_107538 ) ) ( not ( = ?auto_107536 ?auto_107539 ) ) ( not ( = ?auto_107536 ?auto_107540 ) ) ( not ( = ?auto_107536 ?auto_107541 ) ) ( not ( = ?auto_107537 ?auto_107538 ) ) ( not ( = ?auto_107537 ?auto_107539 ) ) ( not ( = ?auto_107537 ?auto_107540 ) ) ( not ( = ?auto_107537 ?auto_107541 ) ) ( not ( = ?auto_107538 ?auto_107539 ) ) ( not ( = ?auto_107538 ?auto_107540 ) ) ( not ( = ?auto_107538 ?auto_107541 ) ) ( not ( = ?auto_107539 ?auto_107540 ) ) ( not ( = ?auto_107539 ?auto_107541 ) ) ( not ( = ?auto_107540 ?auto_107541 ) ) ( ON ?auto_107541 ?auto_107542 ) ( not ( = ?auto_107535 ?auto_107542 ) ) ( not ( = ?auto_107536 ?auto_107542 ) ) ( not ( = ?auto_107537 ?auto_107542 ) ) ( not ( = ?auto_107538 ?auto_107542 ) ) ( not ( = ?auto_107539 ?auto_107542 ) ) ( not ( = ?auto_107540 ?auto_107542 ) ) ( not ( = ?auto_107541 ?auto_107542 ) ) ( ON ?auto_107540 ?auto_107541 ) ( ON-TABLE ?auto_107542 ) ( ON ?auto_107539 ?auto_107540 ) ( ON ?auto_107538 ?auto_107539 ) ( CLEAR ?auto_107538 ) ( HOLDING ?auto_107537 ) ( CLEAR ?auto_107536 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107535 ?auto_107536 ?auto_107537 )
      ( MAKE-7PILE ?auto_107535 ?auto_107536 ?auto_107537 ?auto_107538 ?auto_107539 ?auto_107540 ?auto_107541 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107543 - BLOCK
      ?auto_107544 - BLOCK
      ?auto_107545 - BLOCK
      ?auto_107546 - BLOCK
      ?auto_107547 - BLOCK
      ?auto_107548 - BLOCK
      ?auto_107549 - BLOCK
    )
    :vars
    (
      ?auto_107550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107543 ) ( ON ?auto_107544 ?auto_107543 ) ( not ( = ?auto_107543 ?auto_107544 ) ) ( not ( = ?auto_107543 ?auto_107545 ) ) ( not ( = ?auto_107543 ?auto_107546 ) ) ( not ( = ?auto_107543 ?auto_107547 ) ) ( not ( = ?auto_107543 ?auto_107548 ) ) ( not ( = ?auto_107543 ?auto_107549 ) ) ( not ( = ?auto_107544 ?auto_107545 ) ) ( not ( = ?auto_107544 ?auto_107546 ) ) ( not ( = ?auto_107544 ?auto_107547 ) ) ( not ( = ?auto_107544 ?auto_107548 ) ) ( not ( = ?auto_107544 ?auto_107549 ) ) ( not ( = ?auto_107545 ?auto_107546 ) ) ( not ( = ?auto_107545 ?auto_107547 ) ) ( not ( = ?auto_107545 ?auto_107548 ) ) ( not ( = ?auto_107545 ?auto_107549 ) ) ( not ( = ?auto_107546 ?auto_107547 ) ) ( not ( = ?auto_107546 ?auto_107548 ) ) ( not ( = ?auto_107546 ?auto_107549 ) ) ( not ( = ?auto_107547 ?auto_107548 ) ) ( not ( = ?auto_107547 ?auto_107549 ) ) ( not ( = ?auto_107548 ?auto_107549 ) ) ( ON ?auto_107549 ?auto_107550 ) ( not ( = ?auto_107543 ?auto_107550 ) ) ( not ( = ?auto_107544 ?auto_107550 ) ) ( not ( = ?auto_107545 ?auto_107550 ) ) ( not ( = ?auto_107546 ?auto_107550 ) ) ( not ( = ?auto_107547 ?auto_107550 ) ) ( not ( = ?auto_107548 ?auto_107550 ) ) ( not ( = ?auto_107549 ?auto_107550 ) ) ( ON ?auto_107548 ?auto_107549 ) ( ON-TABLE ?auto_107550 ) ( ON ?auto_107547 ?auto_107548 ) ( ON ?auto_107546 ?auto_107547 ) ( CLEAR ?auto_107544 ) ( ON ?auto_107545 ?auto_107546 ) ( CLEAR ?auto_107545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107550 ?auto_107549 ?auto_107548 ?auto_107547 ?auto_107546 )
      ( MAKE-7PILE ?auto_107543 ?auto_107544 ?auto_107545 ?auto_107546 ?auto_107547 ?auto_107548 ?auto_107549 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107551 - BLOCK
      ?auto_107552 - BLOCK
      ?auto_107553 - BLOCK
      ?auto_107554 - BLOCK
      ?auto_107555 - BLOCK
      ?auto_107556 - BLOCK
      ?auto_107557 - BLOCK
    )
    :vars
    (
      ?auto_107558 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107551 ) ( not ( = ?auto_107551 ?auto_107552 ) ) ( not ( = ?auto_107551 ?auto_107553 ) ) ( not ( = ?auto_107551 ?auto_107554 ) ) ( not ( = ?auto_107551 ?auto_107555 ) ) ( not ( = ?auto_107551 ?auto_107556 ) ) ( not ( = ?auto_107551 ?auto_107557 ) ) ( not ( = ?auto_107552 ?auto_107553 ) ) ( not ( = ?auto_107552 ?auto_107554 ) ) ( not ( = ?auto_107552 ?auto_107555 ) ) ( not ( = ?auto_107552 ?auto_107556 ) ) ( not ( = ?auto_107552 ?auto_107557 ) ) ( not ( = ?auto_107553 ?auto_107554 ) ) ( not ( = ?auto_107553 ?auto_107555 ) ) ( not ( = ?auto_107553 ?auto_107556 ) ) ( not ( = ?auto_107553 ?auto_107557 ) ) ( not ( = ?auto_107554 ?auto_107555 ) ) ( not ( = ?auto_107554 ?auto_107556 ) ) ( not ( = ?auto_107554 ?auto_107557 ) ) ( not ( = ?auto_107555 ?auto_107556 ) ) ( not ( = ?auto_107555 ?auto_107557 ) ) ( not ( = ?auto_107556 ?auto_107557 ) ) ( ON ?auto_107557 ?auto_107558 ) ( not ( = ?auto_107551 ?auto_107558 ) ) ( not ( = ?auto_107552 ?auto_107558 ) ) ( not ( = ?auto_107553 ?auto_107558 ) ) ( not ( = ?auto_107554 ?auto_107558 ) ) ( not ( = ?auto_107555 ?auto_107558 ) ) ( not ( = ?auto_107556 ?auto_107558 ) ) ( not ( = ?auto_107557 ?auto_107558 ) ) ( ON ?auto_107556 ?auto_107557 ) ( ON-TABLE ?auto_107558 ) ( ON ?auto_107555 ?auto_107556 ) ( ON ?auto_107554 ?auto_107555 ) ( ON ?auto_107553 ?auto_107554 ) ( CLEAR ?auto_107553 ) ( HOLDING ?auto_107552 ) ( CLEAR ?auto_107551 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107551 ?auto_107552 )
      ( MAKE-7PILE ?auto_107551 ?auto_107552 ?auto_107553 ?auto_107554 ?auto_107555 ?auto_107556 ?auto_107557 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107559 - BLOCK
      ?auto_107560 - BLOCK
      ?auto_107561 - BLOCK
      ?auto_107562 - BLOCK
      ?auto_107563 - BLOCK
      ?auto_107564 - BLOCK
      ?auto_107565 - BLOCK
    )
    :vars
    (
      ?auto_107566 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107559 ) ( not ( = ?auto_107559 ?auto_107560 ) ) ( not ( = ?auto_107559 ?auto_107561 ) ) ( not ( = ?auto_107559 ?auto_107562 ) ) ( not ( = ?auto_107559 ?auto_107563 ) ) ( not ( = ?auto_107559 ?auto_107564 ) ) ( not ( = ?auto_107559 ?auto_107565 ) ) ( not ( = ?auto_107560 ?auto_107561 ) ) ( not ( = ?auto_107560 ?auto_107562 ) ) ( not ( = ?auto_107560 ?auto_107563 ) ) ( not ( = ?auto_107560 ?auto_107564 ) ) ( not ( = ?auto_107560 ?auto_107565 ) ) ( not ( = ?auto_107561 ?auto_107562 ) ) ( not ( = ?auto_107561 ?auto_107563 ) ) ( not ( = ?auto_107561 ?auto_107564 ) ) ( not ( = ?auto_107561 ?auto_107565 ) ) ( not ( = ?auto_107562 ?auto_107563 ) ) ( not ( = ?auto_107562 ?auto_107564 ) ) ( not ( = ?auto_107562 ?auto_107565 ) ) ( not ( = ?auto_107563 ?auto_107564 ) ) ( not ( = ?auto_107563 ?auto_107565 ) ) ( not ( = ?auto_107564 ?auto_107565 ) ) ( ON ?auto_107565 ?auto_107566 ) ( not ( = ?auto_107559 ?auto_107566 ) ) ( not ( = ?auto_107560 ?auto_107566 ) ) ( not ( = ?auto_107561 ?auto_107566 ) ) ( not ( = ?auto_107562 ?auto_107566 ) ) ( not ( = ?auto_107563 ?auto_107566 ) ) ( not ( = ?auto_107564 ?auto_107566 ) ) ( not ( = ?auto_107565 ?auto_107566 ) ) ( ON ?auto_107564 ?auto_107565 ) ( ON-TABLE ?auto_107566 ) ( ON ?auto_107563 ?auto_107564 ) ( ON ?auto_107562 ?auto_107563 ) ( ON ?auto_107561 ?auto_107562 ) ( CLEAR ?auto_107559 ) ( ON ?auto_107560 ?auto_107561 ) ( CLEAR ?auto_107560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107566 ?auto_107565 ?auto_107564 ?auto_107563 ?auto_107562 ?auto_107561 )
      ( MAKE-7PILE ?auto_107559 ?auto_107560 ?auto_107561 ?auto_107562 ?auto_107563 ?auto_107564 ?auto_107565 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107567 - BLOCK
      ?auto_107568 - BLOCK
      ?auto_107569 - BLOCK
      ?auto_107570 - BLOCK
      ?auto_107571 - BLOCK
      ?auto_107572 - BLOCK
      ?auto_107573 - BLOCK
    )
    :vars
    (
      ?auto_107574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107567 ?auto_107568 ) ) ( not ( = ?auto_107567 ?auto_107569 ) ) ( not ( = ?auto_107567 ?auto_107570 ) ) ( not ( = ?auto_107567 ?auto_107571 ) ) ( not ( = ?auto_107567 ?auto_107572 ) ) ( not ( = ?auto_107567 ?auto_107573 ) ) ( not ( = ?auto_107568 ?auto_107569 ) ) ( not ( = ?auto_107568 ?auto_107570 ) ) ( not ( = ?auto_107568 ?auto_107571 ) ) ( not ( = ?auto_107568 ?auto_107572 ) ) ( not ( = ?auto_107568 ?auto_107573 ) ) ( not ( = ?auto_107569 ?auto_107570 ) ) ( not ( = ?auto_107569 ?auto_107571 ) ) ( not ( = ?auto_107569 ?auto_107572 ) ) ( not ( = ?auto_107569 ?auto_107573 ) ) ( not ( = ?auto_107570 ?auto_107571 ) ) ( not ( = ?auto_107570 ?auto_107572 ) ) ( not ( = ?auto_107570 ?auto_107573 ) ) ( not ( = ?auto_107571 ?auto_107572 ) ) ( not ( = ?auto_107571 ?auto_107573 ) ) ( not ( = ?auto_107572 ?auto_107573 ) ) ( ON ?auto_107573 ?auto_107574 ) ( not ( = ?auto_107567 ?auto_107574 ) ) ( not ( = ?auto_107568 ?auto_107574 ) ) ( not ( = ?auto_107569 ?auto_107574 ) ) ( not ( = ?auto_107570 ?auto_107574 ) ) ( not ( = ?auto_107571 ?auto_107574 ) ) ( not ( = ?auto_107572 ?auto_107574 ) ) ( not ( = ?auto_107573 ?auto_107574 ) ) ( ON ?auto_107572 ?auto_107573 ) ( ON-TABLE ?auto_107574 ) ( ON ?auto_107571 ?auto_107572 ) ( ON ?auto_107570 ?auto_107571 ) ( ON ?auto_107569 ?auto_107570 ) ( ON ?auto_107568 ?auto_107569 ) ( CLEAR ?auto_107568 ) ( HOLDING ?auto_107567 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107567 )
      ( MAKE-7PILE ?auto_107567 ?auto_107568 ?auto_107569 ?auto_107570 ?auto_107571 ?auto_107572 ?auto_107573 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107575 - BLOCK
      ?auto_107576 - BLOCK
      ?auto_107577 - BLOCK
      ?auto_107578 - BLOCK
      ?auto_107579 - BLOCK
      ?auto_107580 - BLOCK
      ?auto_107581 - BLOCK
    )
    :vars
    (
      ?auto_107582 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107575 ?auto_107576 ) ) ( not ( = ?auto_107575 ?auto_107577 ) ) ( not ( = ?auto_107575 ?auto_107578 ) ) ( not ( = ?auto_107575 ?auto_107579 ) ) ( not ( = ?auto_107575 ?auto_107580 ) ) ( not ( = ?auto_107575 ?auto_107581 ) ) ( not ( = ?auto_107576 ?auto_107577 ) ) ( not ( = ?auto_107576 ?auto_107578 ) ) ( not ( = ?auto_107576 ?auto_107579 ) ) ( not ( = ?auto_107576 ?auto_107580 ) ) ( not ( = ?auto_107576 ?auto_107581 ) ) ( not ( = ?auto_107577 ?auto_107578 ) ) ( not ( = ?auto_107577 ?auto_107579 ) ) ( not ( = ?auto_107577 ?auto_107580 ) ) ( not ( = ?auto_107577 ?auto_107581 ) ) ( not ( = ?auto_107578 ?auto_107579 ) ) ( not ( = ?auto_107578 ?auto_107580 ) ) ( not ( = ?auto_107578 ?auto_107581 ) ) ( not ( = ?auto_107579 ?auto_107580 ) ) ( not ( = ?auto_107579 ?auto_107581 ) ) ( not ( = ?auto_107580 ?auto_107581 ) ) ( ON ?auto_107581 ?auto_107582 ) ( not ( = ?auto_107575 ?auto_107582 ) ) ( not ( = ?auto_107576 ?auto_107582 ) ) ( not ( = ?auto_107577 ?auto_107582 ) ) ( not ( = ?auto_107578 ?auto_107582 ) ) ( not ( = ?auto_107579 ?auto_107582 ) ) ( not ( = ?auto_107580 ?auto_107582 ) ) ( not ( = ?auto_107581 ?auto_107582 ) ) ( ON ?auto_107580 ?auto_107581 ) ( ON-TABLE ?auto_107582 ) ( ON ?auto_107579 ?auto_107580 ) ( ON ?auto_107578 ?auto_107579 ) ( ON ?auto_107577 ?auto_107578 ) ( ON ?auto_107576 ?auto_107577 ) ( ON ?auto_107575 ?auto_107576 ) ( CLEAR ?auto_107575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107582 ?auto_107581 ?auto_107580 ?auto_107579 ?auto_107578 ?auto_107577 ?auto_107576 )
      ( MAKE-7PILE ?auto_107575 ?auto_107576 ?auto_107577 ?auto_107578 ?auto_107579 ?auto_107580 ?auto_107581 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107689 - BLOCK
    )
    :vars
    (
      ?auto_107690 - BLOCK
      ?auto_107691 - BLOCK
      ?auto_107692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107689 ?auto_107690 ) ( CLEAR ?auto_107689 ) ( not ( = ?auto_107689 ?auto_107690 ) ) ( HOLDING ?auto_107691 ) ( CLEAR ?auto_107692 ) ( not ( = ?auto_107689 ?auto_107691 ) ) ( not ( = ?auto_107689 ?auto_107692 ) ) ( not ( = ?auto_107690 ?auto_107691 ) ) ( not ( = ?auto_107690 ?auto_107692 ) ) ( not ( = ?auto_107691 ?auto_107692 ) ) )
    :subtasks
    ( ( !STACK ?auto_107691 ?auto_107692 )
      ( MAKE-1PILE ?auto_107689 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107693 - BLOCK
    )
    :vars
    (
      ?auto_107694 - BLOCK
      ?auto_107696 - BLOCK
      ?auto_107695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107693 ?auto_107694 ) ( not ( = ?auto_107693 ?auto_107694 ) ) ( CLEAR ?auto_107696 ) ( not ( = ?auto_107693 ?auto_107695 ) ) ( not ( = ?auto_107693 ?auto_107696 ) ) ( not ( = ?auto_107694 ?auto_107695 ) ) ( not ( = ?auto_107694 ?auto_107696 ) ) ( not ( = ?auto_107695 ?auto_107696 ) ) ( ON ?auto_107695 ?auto_107693 ) ( CLEAR ?auto_107695 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107694 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107694 ?auto_107693 )
      ( MAKE-1PILE ?auto_107693 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107697 - BLOCK
    )
    :vars
    (
      ?auto_107700 - BLOCK
      ?auto_107699 - BLOCK
      ?auto_107698 - BLOCK
      ?auto_107703 - BLOCK
      ?auto_107702 - BLOCK
      ?auto_107704 - BLOCK
      ?auto_107701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107697 ?auto_107700 ) ( not ( = ?auto_107697 ?auto_107700 ) ) ( not ( = ?auto_107697 ?auto_107699 ) ) ( not ( = ?auto_107697 ?auto_107698 ) ) ( not ( = ?auto_107700 ?auto_107699 ) ) ( not ( = ?auto_107700 ?auto_107698 ) ) ( not ( = ?auto_107699 ?auto_107698 ) ) ( ON ?auto_107699 ?auto_107697 ) ( CLEAR ?auto_107699 ) ( ON-TABLE ?auto_107700 ) ( HOLDING ?auto_107698 ) ( CLEAR ?auto_107703 ) ( ON-TABLE ?auto_107702 ) ( ON ?auto_107704 ?auto_107702 ) ( ON ?auto_107701 ?auto_107704 ) ( ON ?auto_107703 ?auto_107701 ) ( not ( = ?auto_107702 ?auto_107704 ) ) ( not ( = ?auto_107702 ?auto_107701 ) ) ( not ( = ?auto_107702 ?auto_107703 ) ) ( not ( = ?auto_107702 ?auto_107698 ) ) ( not ( = ?auto_107704 ?auto_107701 ) ) ( not ( = ?auto_107704 ?auto_107703 ) ) ( not ( = ?auto_107704 ?auto_107698 ) ) ( not ( = ?auto_107701 ?auto_107703 ) ) ( not ( = ?auto_107701 ?auto_107698 ) ) ( not ( = ?auto_107703 ?auto_107698 ) ) ( not ( = ?auto_107697 ?auto_107703 ) ) ( not ( = ?auto_107697 ?auto_107702 ) ) ( not ( = ?auto_107697 ?auto_107704 ) ) ( not ( = ?auto_107697 ?auto_107701 ) ) ( not ( = ?auto_107700 ?auto_107703 ) ) ( not ( = ?auto_107700 ?auto_107702 ) ) ( not ( = ?auto_107700 ?auto_107704 ) ) ( not ( = ?auto_107700 ?auto_107701 ) ) ( not ( = ?auto_107699 ?auto_107703 ) ) ( not ( = ?auto_107699 ?auto_107702 ) ) ( not ( = ?auto_107699 ?auto_107704 ) ) ( not ( = ?auto_107699 ?auto_107701 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107702 ?auto_107704 ?auto_107701 ?auto_107703 ?auto_107698 )
      ( MAKE-1PILE ?auto_107697 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107705 - BLOCK
    )
    :vars
    (
      ?auto_107708 - BLOCK
      ?auto_107712 - BLOCK
      ?auto_107711 - BLOCK
      ?auto_107710 - BLOCK
      ?auto_107709 - BLOCK
      ?auto_107707 - BLOCK
      ?auto_107706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107705 ?auto_107708 ) ( not ( = ?auto_107705 ?auto_107708 ) ) ( not ( = ?auto_107705 ?auto_107712 ) ) ( not ( = ?auto_107705 ?auto_107711 ) ) ( not ( = ?auto_107708 ?auto_107712 ) ) ( not ( = ?auto_107708 ?auto_107711 ) ) ( not ( = ?auto_107712 ?auto_107711 ) ) ( ON ?auto_107712 ?auto_107705 ) ( ON-TABLE ?auto_107708 ) ( CLEAR ?auto_107710 ) ( ON-TABLE ?auto_107709 ) ( ON ?auto_107707 ?auto_107709 ) ( ON ?auto_107706 ?auto_107707 ) ( ON ?auto_107710 ?auto_107706 ) ( not ( = ?auto_107709 ?auto_107707 ) ) ( not ( = ?auto_107709 ?auto_107706 ) ) ( not ( = ?auto_107709 ?auto_107710 ) ) ( not ( = ?auto_107709 ?auto_107711 ) ) ( not ( = ?auto_107707 ?auto_107706 ) ) ( not ( = ?auto_107707 ?auto_107710 ) ) ( not ( = ?auto_107707 ?auto_107711 ) ) ( not ( = ?auto_107706 ?auto_107710 ) ) ( not ( = ?auto_107706 ?auto_107711 ) ) ( not ( = ?auto_107710 ?auto_107711 ) ) ( not ( = ?auto_107705 ?auto_107710 ) ) ( not ( = ?auto_107705 ?auto_107709 ) ) ( not ( = ?auto_107705 ?auto_107707 ) ) ( not ( = ?auto_107705 ?auto_107706 ) ) ( not ( = ?auto_107708 ?auto_107710 ) ) ( not ( = ?auto_107708 ?auto_107709 ) ) ( not ( = ?auto_107708 ?auto_107707 ) ) ( not ( = ?auto_107708 ?auto_107706 ) ) ( not ( = ?auto_107712 ?auto_107710 ) ) ( not ( = ?auto_107712 ?auto_107709 ) ) ( not ( = ?auto_107712 ?auto_107707 ) ) ( not ( = ?auto_107712 ?auto_107706 ) ) ( ON ?auto_107711 ?auto_107712 ) ( CLEAR ?auto_107711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107708 ?auto_107705 ?auto_107712 )
      ( MAKE-1PILE ?auto_107705 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107713 - BLOCK
    )
    :vars
    (
      ?auto_107714 - BLOCK
      ?auto_107715 - BLOCK
      ?auto_107716 - BLOCK
      ?auto_107719 - BLOCK
      ?auto_107718 - BLOCK
      ?auto_107717 - BLOCK
      ?auto_107720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107713 ?auto_107714 ) ( not ( = ?auto_107713 ?auto_107714 ) ) ( not ( = ?auto_107713 ?auto_107715 ) ) ( not ( = ?auto_107713 ?auto_107716 ) ) ( not ( = ?auto_107714 ?auto_107715 ) ) ( not ( = ?auto_107714 ?auto_107716 ) ) ( not ( = ?auto_107715 ?auto_107716 ) ) ( ON ?auto_107715 ?auto_107713 ) ( ON-TABLE ?auto_107714 ) ( ON-TABLE ?auto_107719 ) ( ON ?auto_107718 ?auto_107719 ) ( ON ?auto_107717 ?auto_107718 ) ( not ( = ?auto_107719 ?auto_107718 ) ) ( not ( = ?auto_107719 ?auto_107717 ) ) ( not ( = ?auto_107719 ?auto_107720 ) ) ( not ( = ?auto_107719 ?auto_107716 ) ) ( not ( = ?auto_107718 ?auto_107717 ) ) ( not ( = ?auto_107718 ?auto_107720 ) ) ( not ( = ?auto_107718 ?auto_107716 ) ) ( not ( = ?auto_107717 ?auto_107720 ) ) ( not ( = ?auto_107717 ?auto_107716 ) ) ( not ( = ?auto_107720 ?auto_107716 ) ) ( not ( = ?auto_107713 ?auto_107720 ) ) ( not ( = ?auto_107713 ?auto_107719 ) ) ( not ( = ?auto_107713 ?auto_107718 ) ) ( not ( = ?auto_107713 ?auto_107717 ) ) ( not ( = ?auto_107714 ?auto_107720 ) ) ( not ( = ?auto_107714 ?auto_107719 ) ) ( not ( = ?auto_107714 ?auto_107718 ) ) ( not ( = ?auto_107714 ?auto_107717 ) ) ( not ( = ?auto_107715 ?auto_107720 ) ) ( not ( = ?auto_107715 ?auto_107719 ) ) ( not ( = ?auto_107715 ?auto_107718 ) ) ( not ( = ?auto_107715 ?auto_107717 ) ) ( ON ?auto_107716 ?auto_107715 ) ( CLEAR ?auto_107716 ) ( HOLDING ?auto_107720 ) ( CLEAR ?auto_107717 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107719 ?auto_107718 ?auto_107717 ?auto_107720 )
      ( MAKE-1PILE ?auto_107713 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107721 - BLOCK
    )
    :vars
    (
      ?auto_107726 - BLOCK
      ?auto_107727 - BLOCK
      ?auto_107722 - BLOCK
      ?auto_107725 - BLOCK
      ?auto_107728 - BLOCK
      ?auto_107724 - BLOCK
      ?auto_107723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107721 ?auto_107726 ) ( not ( = ?auto_107721 ?auto_107726 ) ) ( not ( = ?auto_107721 ?auto_107727 ) ) ( not ( = ?auto_107721 ?auto_107722 ) ) ( not ( = ?auto_107726 ?auto_107727 ) ) ( not ( = ?auto_107726 ?auto_107722 ) ) ( not ( = ?auto_107727 ?auto_107722 ) ) ( ON ?auto_107727 ?auto_107721 ) ( ON-TABLE ?auto_107726 ) ( ON-TABLE ?auto_107725 ) ( ON ?auto_107728 ?auto_107725 ) ( ON ?auto_107724 ?auto_107728 ) ( not ( = ?auto_107725 ?auto_107728 ) ) ( not ( = ?auto_107725 ?auto_107724 ) ) ( not ( = ?auto_107725 ?auto_107723 ) ) ( not ( = ?auto_107725 ?auto_107722 ) ) ( not ( = ?auto_107728 ?auto_107724 ) ) ( not ( = ?auto_107728 ?auto_107723 ) ) ( not ( = ?auto_107728 ?auto_107722 ) ) ( not ( = ?auto_107724 ?auto_107723 ) ) ( not ( = ?auto_107724 ?auto_107722 ) ) ( not ( = ?auto_107723 ?auto_107722 ) ) ( not ( = ?auto_107721 ?auto_107723 ) ) ( not ( = ?auto_107721 ?auto_107725 ) ) ( not ( = ?auto_107721 ?auto_107728 ) ) ( not ( = ?auto_107721 ?auto_107724 ) ) ( not ( = ?auto_107726 ?auto_107723 ) ) ( not ( = ?auto_107726 ?auto_107725 ) ) ( not ( = ?auto_107726 ?auto_107728 ) ) ( not ( = ?auto_107726 ?auto_107724 ) ) ( not ( = ?auto_107727 ?auto_107723 ) ) ( not ( = ?auto_107727 ?auto_107725 ) ) ( not ( = ?auto_107727 ?auto_107728 ) ) ( not ( = ?auto_107727 ?auto_107724 ) ) ( ON ?auto_107722 ?auto_107727 ) ( CLEAR ?auto_107724 ) ( ON ?auto_107723 ?auto_107722 ) ( CLEAR ?auto_107723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107726 ?auto_107721 ?auto_107727 ?auto_107722 )
      ( MAKE-1PILE ?auto_107721 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107729 - BLOCK
    )
    :vars
    (
      ?auto_107733 - BLOCK
      ?auto_107734 - BLOCK
      ?auto_107736 - BLOCK
      ?auto_107735 - BLOCK
      ?auto_107730 - BLOCK
      ?auto_107731 - BLOCK
      ?auto_107732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107729 ?auto_107733 ) ( not ( = ?auto_107729 ?auto_107733 ) ) ( not ( = ?auto_107729 ?auto_107734 ) ) ( not ( = ?auto_107729 ?auto_107736 ) ) ( not ( = ?auto_107733 ?auto_107734 ) ) ( not ( = ?auto_107733 ?auto_107736 ) ) ( not ( = ?auto_107734 ?auto_107736 ) ) ( ON ?auto_107734 ?auto_107729 ) ( ON-TABLE ?auto_107733 ) ( ON-TABLE ?auto_107735 ) ( ON ?auto_107730 ?auto_107735 ) ( not ( = ?auto_107735 ?auto_107730 ) ) ( not ( = ?auto_107735 ?auto_107731 ) ) ( not ( = ?auto_107735 ?auto_107732 ) ) ( not ( = ?auto_107735 ?auto_107736 ) ) ( not ( = ?auto_107730 ?auto_107731 ) ) ( not ( = ?auto_107730 ?auto_107732 ) ) ( not ( = ?auto_107730 ?auto_107736 ) ) ( not ( = ?auto_107731 ?auto_107732 ) ) ( not ( = ?auto_107731 ?auto_107736 ) ) ( not ( = ?auto_107732 ?auto_107736 ) ) ( not ( = ?auto_107729 ?auto_107732 ) ) ( not ( = ?auto_107729 ?auto_107735 ) ) ( not ( = ?auto_107729 ?auto_107730 ) ) ( not ( = ?auto_107729 ?auto_107731 ) ) ( not ( = ?auto_107733 ?auto_107732 ) ) ( not ( = ?auto_107733 ?auto_107735 ) ) ( not ( = ?auto_107733 ?auto_107730 ) ) ( not ( = ?auto_107733 ?auto_107731 ) ) ( not ( = ?auto_107734 ?auto_107732 ) ) ( not ( = ?auto_107734 ?auto_107735 ) ) ( not ( = ?auto_107734 ?auto_107730 ) ) ( not ( = ?auto_107734 ?auto_107731 ) ) ( ON ?auto_107736 ?auto_107734 ) ( ON ?auto_107732 ?auto_107736 ) ( CLEAR ?auto_107732 ) ( HOLDING ?auto_107731 ) ( CLEAR ?auto_107730 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107735 ?auto_107730 ?auto_107731 )
      ( MAKE-1PILE ?auto_107729 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107737 - BLOCK
    )
    :vars
    (
      ?auto_107744 - BLOCK
      ?auto_107740 - BLOCK
      ?auto_107742 - BLOCK
      ?auto_107743 - BLOCK
      ?auto_107741 - BLOCK
      ?auto_107739 - BLOCK
      ?auto_107738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107737 ?auto_107744 ) ( not ( = ?auto_107737 ?auto_107744 ) ) ( not ( = ?auto_107737 ?auto_107740 ) ) ( not ( = ?auto_107737 ?auto_107742 ) ) ( not ( = ?auto_107744 ?auto_107740 ) ) ( not ( = ?auto_107744 ?auto_107742 ) ) ( not ( = ?auto_107740 ?auto_107742 ) ) ( ON ?auto_107740 ?auto_107737 ) ( ON-TABLE ?auto_107744 ) ( ON-TABLE ?auto_107743 ) ( ON ?auto_107741 ?auto_107743 ) ( not ( = ?auto_107743 ?auto_107741 ) ) ( not ( = ?auto_107743 ?auto_107739 ) ) ( not ( = ?auto_107743 ?auto_107738 ) ) ( not ( = ?auto_107743 ?auto_107742 ) ) ( not ( = ?auto_107741 ?auto_107739 ) ) ( not ( = ?auto_107741 ?auto_107738 ) ) ( not ( = ?auto_107741 ?auto_107742 ) ) ( not ( = ?auto_107739 ?auto_107738 ) ) ( not ( = ?auto_107739 ?auto_107742 ) ) ( not ( = ?auto_107738 ?auto_107742 ) ) ( not ( = ?auto_107737 ?auto_107738 ) ) ( not ( = ?auto_107737 ?auto_107743 ) ) ( not ( = ?auto_107737 ?auto_107741 ) ) ( not ( = ?auto_107737 ?auto_107739 ) ) ( not ( = ?auto_107744 ?auto_107738 ) ) ( not ( = ?auto_107744 ?auto_107743 ) ) ( not ( = ?auto_107744 ?auto_107741 ) ) ( not ( = ?auto_107744 ?auto_107739 ) ) ( not ( = ?auto_107740 ?auto_107738 ) ) ( not ( = ?auto_107740 ?auto_107743 ) ) ( not ( = ?auto_107740 ?auto_107741 ) ) ( not ( = ?auto_107740 ?auto_107739 ) ) ( ON ?auto_107742 ?auto_107740 ) ( ON ?auto_107738 ?auto_107742 ) ( CLEAR ?auto_107741 ) ( ON ?auto_107739 ?auto_107738 ) ( CLEAR ?auto_107739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107744 ?auto_107737 ?auto_107740 ?auto_107742 ?auto_107738 )
      ( MAKE-1PILE ?auto_107737 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107745 - BLOCK
    )
    :vars
    (
      ?auto_107746 - BLOCK
      ?auto_107752 - BLOCK
      ?auto_107747 - BLOCK
      ?auto_107750 - BLOCK
      ?auto_107749 - BLOCK
      ?auto_107751 - BLOCK
      ?auto_107748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107745 ?auto_107746 ) ( not ( = ?auto_107745 ?auto_107746 ) ) ( not ( = ?auto_107745 ?auto_107752 ) ) ( not ( = ?auto_107745 ?auto_107747 ) ) ( not ( = ?auto_107746 ?auto_107752 ) ) ( not ( = ?auto_107746 ?auto_107747 ) ) ( not ( = ?auto_107752 ?auto_107747 ) ) ( ON ?auto_107752 ?auto_107745 ) ( ON-TABLE ?auto_107746 ) ( ON-TABLE ?auto_107750 ) ( not ( = ?auto_107750 ?auto_107749 ) ) ( not ( = ?auto_107750 ?auto_107751 ) ) ( not ( = ?auto_107750 ?auto_107748 ) ) ( not ( = ?auto_107750 ?auto_107747 ) ) ( not ( = ?auto_107749 ?auto_107751 ) ) ( not ( = ?auto_107749 ?auto_107748 ) ) ( not ( = ?auto_107749 ?auto_107747 ) ) ( not ( = ?auto_107751 ?auto_107748 ) ) ( not ( = ?auto_107751 ?auto_107747 ) ) ( not ( = ?auto_107748 ?auto_107747 ) ) ( not ( = ?auto_107745 ?auto_107748 ) ) ( not ( = ?auto_107745 ?auto_107750 ) ) ( not ( = ?auto_107745 ?auto_107749 ) ) ( not ( = ?auto_107745 ?auto_107751 ) ) ( not ( = ?auto_107746 ?auto_107748 ) ) ( not ( = ?auto_107746 ?auto_107750 ) ) ( not ( = ?auto_107746 ?auto_107749 ) ) ( not ( = ?auto_107746 ?auto_107751 ) ) ( not ( = ?auto_107752 ?auto_107748 ) ) ( not ( = ?auto_107752 ?auto_107750 ) ) ( not ( = ?auto_107752 ?auto_107749 ) ) ( not ( = ?auto_107752 ?auto_107751 ) ) ( ON ?auto_107747 ?auto_107752 ) ( ON ?auto_107748 ?auto_107747 ) ( ON ?auto_107751 ?auto_107748 ) ( CLEAR ?auto_107751 ) ( HOLDING ?auto_107749 ) ( CLEAR ?auto_107750 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107750 ?auto_107749 )
      ( MAKE-1PILE ?auto_107745 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107753 - BLOCK
    )
    :vars
    (
      ?auto_107755 - BLOCK
      ?auto_107756 - BLOCK
      ?auto_107758 - BLOCK
      ?auto_107760 - BLOCK
      ?auto_107754 - BLOCK
      ?auto_107759 - BLOCK
      ?auto_107757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107753 ?auto_107755 ) ( not ( = ?auto_107753 ?auto_107755 ) ) ( not ( = ?auto_107753 ?auto_107756 ) ) ( not ( = ?auto_107753 ?auto_107758 ) ) ( not ( = ?auto_107755 ?auto_107756 ) ) ( not ( = ?auto_107755 ?auto_107758 ) ) ( not ( = ?auto_107756 ?auto_107758 ) ) ( ON ?auto_107756 ?auto_107753 ) ( ON-TABLE ?auto_107755 ) ( ON-TABLE ?auto_107760 ) ( not ( = ?auto_107760 ?auto_107754 ) ) ( not ( = ?auto_107760 ?auto_107759 ) ) ( not ( = ?auto_107760 ?auto_107757 ) ) ( not ( = ?auto_107760 ?auto_107758 ) ) ( not ( = ?auto_107754 ?auto_107759 ) ) ( not ( = ?auto_107754 ?auto_107757 ) ) ( not ( = ?auto_107754 ?auto_107758 ) ) ( not ( = ?auto_107759 ?auto_107757 ) ) ( not ( = ?auto_107759 ?auto_107758 ) ) ( not ( = ?auto_107757 ?auto_107758 ) ) ( not ( = ?auto_107753 ?auto_107757 ) ) ( not ( = ?auto_107753 ?auto_107760 ) ) ( not ( = ?auto_107753 ?auto_107754 ) ) ( not ( = ?auto_107753 ?auto_107759 ) ) ( not ( = ?auto_107755 ?auto_107757 ) ) ( not ( = ?auto_107755 ?auto_107760 ) ) ( not ( = ?auto_107755 ?auto_107754 ) ) ( not ( = ?auto_107755 ?auto_107759 ) ) ( not ( = ?auto_107756 ?auto_107757 ) ) ( not ( = ?auto_107756 ?auto_107760 ) ) ( not ( = ?auto_107756 ?auto_107754 ) ) ( not ( = ?auto_107756 ?auto_107759 ) ) ( ON ?auto_107758 ?auto_107756 ) ( ON ?auto_107757 ?auto_107758 ) ( ON ?auto_107759 ?auto_107757 ) ( CLEAR ?auto_107760 ) ( ON ?auto_107754 ?auto_107759 ) ( CLEAR ?auto_107754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107755 ?auto_107753 ?auto_107756 ?auto_107758 ?auto_107757 ?auto_107759 )
      ( MAKE-1PILE ?auto_107753 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107761 - BLOCK
    )
    :vars
    (
      ?auto_107768 - BLOCK
      ?auto_107765 - BLOCK
      ?auto_107767 - BLOCK
      ?auto_107766 - BLOCK
      ?auto_107763 - BLOCK
      ?auto_107764 - BLOCK
      ?auto_107762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107761 ?auto_107768 ) ( not ( = ?auto_107761 ?auto_107768 ) ) ( not ( = ?auto_107761 ?auto_107765 ) ) ( not ( = ?auto_107761 ?auto_107767 ) ) ( not ( = ?auto_107768 ?auto_107765 ) ) ( not ( = ?auto_107768 ?auto_107767 ) ) ( not ( = ?auto_107765 ?auto_107767 ) ) ( ON ?auto_107765 ?auto_107761 ) ( ON-TABLE ?auto_107768 ) ( not ( = ?auto_107766 ?auto_107763 ) ) ( not ( = ?auto_107766 ?auto_107764 ) ) ( not ( = ?auto_107766 ?auto_107762 ) ) ( not ( = ?auto_107766 ?auto_107767 ) ) ( not ( = ?auto_107763 ?auto_107764 ) ) ( not ( = ?auto_107763 ?auto_107762 ) ) ( not ( = ?auto_107763 ?auto_107767 ) ) ( not ( = ?auto_107764 ?auto_107762 ) ) ( not ( = ?auto_107764 ?auto_107767 ) ) ( not ( = ?auto_107762 ?auto_107767 ) ) ( not ( = ?auto_107761 ?auto_107762 ) ) ( not ( = ?auto_107761 ?auto_107766 ) ) ( not ( = ?auto_107761 ?auto_107763 ) ) ( not ( = ?auto_107761 ?auto_107764 ) ) ( not ( = ?auto_107768 ?auto_107762 ) ) ( not ( = ?auto_107768 ?auto_107766 ) ) ( not ( = ?auto_107768 ?auto_107763 ) ) ( not ( = ?auto_107768 ?auto_107764 ) ) ( not ( = ?auto_107765 ?auto_107762 ) ) ( not ( = ?auto_107765 ?auto_107766 ) ) ( not ( = ?auto_107765 ?auto_107763 ) ) ( not ( = ?auto_107765 ?auto_107764 ) ) ( ON ?auto_107767 ?auto_107765 ) ( ON ?auto_107762 ?auto_107767 ) ( ON ?auto_107764 ?auto_107762 ) ( ON ?auto_107763 ?auto_107764 ) ( CLEAR ?auto_107763 ) ( HOLDING ?auto_107766 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107766 )
      ( MAKE-1PILE ?auto_107761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107769 - BLOCK
    )
    :vars
    (
      ?auto_107774 - BLOCK
      ?auto_107775 - BLOCK
      ?auto_107772 - BLOCK
      ?auto_107776 - BLOCK
      ?auto_107773 - BLOCK
      ?auto_107770 - BLOCK
      ?auto_107771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107769 ?auto_107774 ) ( not ( = ?auto_107769 ?auto_107774 ) ) ( not ( = ?auto_107769 ?auto_107775 ) ) ( not ( = ?auto_107769 ?auto_107772 ) ) ( not ( = ?auto_107774 ?auto_107775 ) ) ( not ( = ?auto_107774 ?auto_107772 ) ) ( not ( = ?auto_107775 ?auto_107772 ) ) ( ON ?auto_107775 ?auto_107769 ) ( ON-TABLE ?auto_107774 ) ( not ( = ?auto_107776 ?auto_107773 ) ) ( not ( = ?auto_107776 ?auto_107770 ) ) ( not ( = ?auto_107776 ?auto_107771 ) ) ( not ( = ?auto_107776 ?auto_107772 ) ) ( not ( = ?auto_107773 ?auto_107770 ) ) ( not ( = ?auto_107773 ?auto_107771 ) ) ( not ( = ?auto_107773 ?auto_107772 ) ) ( not ( = ?auto_107770 ?auto_107771 ) ) ( not ( = ?auto_107770 ?auto_107772 ) ) ( not ( = ?auto_107771 ?auto_107772 ) ) ( not ( = ?auto_107769 ?auto_107771 ) ) ( not ( = ?auto_107769 ?auto_107776 ) ) ( not ( = ?auto_107769 ?auto_107773 ) ) ( not ( = ?auto_107769 ?auto_107770 ) ) ( not ( = ?auto_107774 ?auto_107771 ) ) ( not ( = ?auto_107774 ?auto_107776 ) ) ( not ( = ?auto_107774 ?auto_107773 ) ) ( not ( = ?auto_107774 ?auto_107770 ) ) ( not ( = ?auto_107775 ?auto_107771 ) ) ( not ( = ?auto_107775 ?auto_107776 ) ) ( not ( = ?auto_107775 ?auto_107773 ) ) ( not ( = ?auto_107775 ?auto_107770 ) ) ( ON ?auto_107772 ?auto_107775 ) ( ON ?auto_107771 ?auto_107772 ) ( ON ?auto_107770 ?auto_107771 ) ( ON ?auto_107773 ?auto_107770 ) ( ON ?auto_107776 ?auto_107773 ) ( CLEAR ?auto_107776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107774 ?auto_107769 ?auto_107775 ?auto_107772 ?auto_107771 ?auto_107770 ?auto_107773 )
      ( MAKE-1PILE ?auto_107769 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107788 - BLOCK
      ?auto_107789 - BLOCK
      ?auto_107790 - BLOCK
      ?auto_107791 - BLOCK
      ?auto_107792 - BLOCK
    )
    :vars
    (
      ?auto_107793 - BLOCK
      ?auto_107794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107793 ?auto_107792 ) ( CLEAR ?auto_107793 ) ( ON-TABLE ?auto_107788 ) ( ON ?auto_107789 ?auto_107788 ) ( ON ?auto_107790 ?auto_107789 ) ( ON ?auto_107791 ?auto_107790 ) ( ON ?auto_107792 ?auto_107791 ) ( not ( = ?auto_107788 ?auto_107789 ) ) ( not ( = ?auto_107788 ?auto_107790 ) ) ( not ( = ?auto_107788 ?auto_107791 ) ) ( not ( = ?auto_107788 ?auto_107792 ) ) ( not ( = ?auto_107788 ?auto_107793 ) ) ( not ( = ?auto_107789 ?auto_107790 ) ) ( not ( = ?auto_107789 ?auto_107791 ) ) ( not ( = ?auto_107789 ?auto_107792 ) ) ( not ( = ?auto_107789 ?auto_107793 ) ) ( not ( = ?auto_107790 ?auto_107791 ) ) ( not ( = ?auto_107790 ?auto_107792 ) ) ( not ( = ?auto_107790 ?auto_107793 ) ) ( not ( = ?auto_107791 ?auto_107792 ) ) ( not ( = ?auto_107791 ?auto_107793 ) ) ( not ( = ?auto_107792 ?auto_107793 ) ) ( HOLDING ?auto_107794 ) ( not ( = ?auto_107788 ?auto_107794 ) ) ( not ( = ?auto_107789 ?auto_107794 ) ) ( not ( = ?auto_107790 ?auto_107794 ) ) ( not ( = ?auto_107791 ?auto_107794 ) ) ( not ( = ?auto_107792 ?auto_107794 ) ) ( not ( = ?auto_107793 ?auto_107794 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_107794 )
      ( MAKE-5PILE ?auto_107788 ?auto_107789 ?auto_107790 ?auto_107791 ?auto_107792 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107885 - BLOCK
      ?auto_107886 - BLOCK
    )
    :vars
    (
      ?auto_107887 - BLOCK
      ?auto_107888 - BLOCK
      ?auto_107889 - BLOCK
      ?auto_107891 - BLOCK
      ?auto_107890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107885 ?auto_107886 ) ) ( ON ?auto_107886 ?auto_107887 ) ( not ( = ?auto_107885 ?auto_107887 ) ) ( not ( = ?auto_107886 ?auto_107887 ) ) ( ON ?auto_107885 ?auto_107886 ) ( CLEAR ?auto_107885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107888 ) ( ON ?auto_107889 ?auto_107888 ) ( ON ?auto_107891 ?auto_107889 ) ( ON ?auto_107890 ?auto_107891 ) ( ON ?auto_107887 ?auto_107890 ) ( not ( = ?auto_107888 ?auto_107889 ) ) ( not ( = ?auto_107888 ?auto_107891 ) ) ( not ( = ?auto_107888 ?auto_107890 ) ) ( not ( = ?auto_107888 ?auto_107887 ) ) ( not ( = ?auto_107888 ?auto_107886 ) ) ( not ( = ?auto_107888 ?auto_107885 ) ) ( not ( = ?auto_107889 ?auto_107891 ) ) ( not ( = ?auto_107889 ?auto_107890 ) ) ( not ( = ?auto_107889 ?auto_107887 ) ) ( not ( = ?auto_107889 ?auto_107886 ) ) ( not ( = ?auto_107889 ?auto_107885 ) ) ( not ( = ?auto_107891 ?auto_107890 ) ) ( not ( = ?auto_107891 ?auto_107887 ) ) ( not ( = ?auto_107891 ?auto_107886 ) ) ( not ( = ?auto_107891 ?auto_107885 ) ) ( not ( = ?auto_107890 ?auto_107887 ) ) ( not ( = ?auto_107890 ?auto_107886 ) ) ( not ( = ?auto_107890 ?auto_107885 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107888 ?auto_107889 ?auto_107891 ?auto_107890 ?auto_107887 ?auto_107886 )
      ( MAKE-2PILE ?auto_107885 ?auto_107886 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107894 - BLOCK
      ?auto_107895 - BLOCK
    )
    :vars
    (
      ?auto_107896 - BLOCK
      ?auto_107897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107894 ?auto_107895 ) ) ( ON ?auto_107895 ?auto_107896 ) ( CLEAR ?auto_107895 ) ( not ( = ?auto_107894 ?auto_107896 ) ) ( not ( = ?auto_107895 ?auto_107896 ) ) ( ON ?auto_107894 ?auto_107897 ) ( CLEAR ?auto_107894 ) ( HAND-EMPTY ) ( not ( = ?auto_107894 ?auto_107897 ) ) ( not ( = ?auto_107895 ?auto_107897 ) ) ( not ( = ?auto_107896 ?auto_107897 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107894 ?auto_107897 )
      ( MAKE-2PILE ?auto_107894 ?auto_107895 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107898 - BLOCK
      ?auto_107899 - BLOCK
    )
    :vars
    (
      ?auto_107900 - BLOCK
      ?auto_107901 - BLOCK
      ?auto_107902 - BLOCK
      ?auto_107905 - BLOCK
      ?auto_107904 - BLOCK
      ?auto_107903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107898 ?auto_107899 ) ) ( not ( = ?auto_107898 ?auto_107900 ) ) ( not ( = ?auto_107899 ?auto_107900 ) ) ( ON ?auto_107898 ?auto_107901 ) ( CLEAR ?auto_107898 ) ( not ( = ?auto_107898 ?auto_107901 ) ) ( not ( = ?auto_107899 ?auto_107901 ) ) ( not ( = ?auto_107900 ?auto_107901 ) ) ( HOLDING ?auto_107899 ) ( CLEAR ?auto_107900 ) ( ON-TABLE ?auto_107902 ) ( ON ?auto_107905 ?auto_107902 ) ( ON ?auto_107904 ?auto_107905 ) ( ON ?auto_107903 ?auto_107904 ) ( ON ?auto_107900 ?auto_107903 ) ( not ( = ?auto_107902 ?auto_107905 ) ) ( not ( = ?auto_107902 ?auto_107904 ) ) ( not ( = ?auto_107902 ?auto_107903 ) ) ( not ( = ?auto_107902 ?auto_107900 ) ) ( not ( = ?auto_107902 ?auto_107899 ) ) ( not ( = ?auto_107905 ?auto_107904 ) ) ( not ( = ?auto_107905 ?auto_107903 ) ) ( not ( = ?auto_107905 ?auto_107900 ) ) ( not ( = ?auto_107905 ?auto_107899 ) ) ( not ( = ?auto_107904 ?auto_107903 ) ) ( not ( = ?auto_107904 ?auto_107900 ) ) ( not ( = ?auto_107904 ?auto_107899 ) ) ( not ( = ?auto_107903 ?auto_107900 ) ) ( not ( = ?auto_107903 ?auto_107899 ) ) ( not ( = ?auto_107898 ?auto_107902 ) ) ( not ( = ?auto_107898 ?auto_107905 ) ) ( not ( = ?auto_107898 ?auto_107904 ) ) ( not ( = ?auto_107898 ?auto_107903 ) ) ( not ( = ?auto_107901 ?auto_107902 ) ) ( not ( = ?auto_107901 ?auto_107905 ) ) ( not ( = ?auto_107901 ?auto_107904 ) ) ( not ( = ?auto_107901 ?auto_107903 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107902 ?auto_107905 ?auto_107904 ?auto_107903 ?auto_107900 ?auto_107899 )
      ( MAKE-2PILE ?auto_107898 ?auto_107899 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107906 - BLOCK
      ?auto_107907 - BLOCK
    )
    :vars
    (
      ?auto_107910 - BLOCK
      ?auto_107909 - BLOCK
      ?auto_107908 - BLOCK
      ?auto_107912 - BLOCK
      ?auto_107913 - BLOCK
      ?auto_107911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107906 ?auto_107907 ) ) ( not ( = ?auto_107906 ?auto_107910 ) ) ( not ( = ?auto_107907 ?auto_107910 ) ) ( ON ?auto_107906 ?auto_107909 ) ( not ( = ?auto_107906 ?auto_107909 ) ) ( not ( = ?auto_107907 ?auto_107909 ) ) ( not ( = ?auto_107910 ?auto_107909 ) ) ( CLEAR ?auto_107910 ) ( ON-TABLE ?auto_107908 ) ( ON ?auto_107912 ?auto_107908 ) ( ON ?auto_107913 ?auto_107912 ) ( ON ?auto_107911 ?auto_107913 ) ( ON ?auto_107910 ?auto_107911 ) ( not ( = ?auto_107908 ?auto_107912 ) ) ( not ( = ?auto_107908 ?auto_107913 ) ) ( not ( = ?auto_107908 ?auto_107911 ) ) ( not ( = ?auto_107908 ?auto_107910 ) ) ( not ( = ?auto_107908 ?auto_107907 ) ) ( not ( = ?auto_107912 ?auto_107913 ) ) ( not ( = ?auto_107912 ?auto_107911 ) ) ( not ( = ?auto_107912 ?auto_107910 ) ) ( not ( = ?auto_107912 ?auto_107907 ) ) ( not ( = ?auto_107913 ?auto_107911 ) ) ( not ( = ?auto_107913 ?auto_107910 ) ) ( not ( = ?auto_107913 ?auto_107907 ) ) ( not ( = ?auto_107911 ?auto_107910 ) ) ( not ( = ?auto_107911 ?auto_107907 ) ) ( not ( = ?auto_107906 ?auto_107908 ) ) ( not ( = ?auto_107906 ?auto_107912 ) ) ( not ( = ?auto_107906 ?auto_107913 ) ) ( not ( = ?auto_107906 ?auto_107911 ) ) ( not ( = ?auto_107909 ?auto_107908 ) ) ( not ( = ?auto_107909 ?auto_107912 ) ) ( not ( = ?auto_107909 ?auto_107913 ) ) ( not ( = ?auto_107909 ?auto_107911 ) ) ( ON ?auto_107907 ?auto_107906 ) ( CLEAR ?auto_107907 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107909 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107909 ?auto_107906 )
      ( MAKE-2PILE ?auto_107906 ?auto_107907 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107914 - BLOCK
      ?auto_107915 - BLOCK
    )
    :vars
    (
      ?auto_107918 - BLOCK
      ?auto_107917 - BLOCK
      ?auto_107916 - BLOCK
      ?auto_107921 - BLOCK
      ?auto_107920 - BLOCK
      ?auto_107919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107914 ?auto_107915 ) ) ( not ( = ?auto_107914 ?auto_107918 ) ) ( not ( = ?auto_107915 ?auto_107918 ) ) ( ON ?auto_107914 ?auto_107917 ) ( not ( = ?auto_107914 ?auto_107917 ) ) ( not ( = ?auto_107915 ?auto_107917 ) ) ( not ( = ?auto_107918 ?auto_107917 ) ) ( ON-TABLE ?auto_107916 ) ( ON ?auto_107921 ?auto_107916 ) ( ON ?auto_107920 ?auto_107921 ) ( ON ?auto_107919 ?auto_107920 ) ( not ( = ?auto_107916 ?auto_107921 ) ) ( not ( = ?auto_107916 ?auto_107920 ) ) ( not ( = ?auto_107916 ?auto_107919 ) ) ( not ( = ?auto_107916 ?auto_107918 ) ) ( not ( = ?auto_107916 ?auto_107915 ) ) ( not ( = ?auto_107921 ?auto_107920 ) ) ( not ( = ?auto_107921 ?auto_107919 ) ) ( not ( = ?auto_107921 ?auto_107918 ) ) ( not ( = ?auto_107921 ?auto_107915 ) ) ( not ( = ?auto_107920 ?auto_107919 ) ) ( not ( = ?auto_107920 ?auto_107918 ) ) ( not ( = ?auto_107920 ?auto_107915 ) ) ( not ( = ?auto_107919 ?auto_107918 ) ) ( not ( = ?auto_107919 ?auto_107915 ) ) ( not ( = ?auto_107914 ?auto_107916 ) ) ( not ( = ?auto_107914 ?auto_107921 ) ) ( not ( = ?auto_107914 ?auto_107920 ) ) ( not ( = ?auto_107914 ?auto_107919 ) ) ( not ( = ?auto_107917 ?auto_107916 ) ) ( not ( = ?auto_107917 ?auto_107921 ) ) ( not ( = ?auto_107917 ?auto_107920 ) ) ( not ( = ?auto_107917 ?auto_107919 ) ) ( ON ?auto_107915 ?auto_107914 ) ( CLEAR ?auto_107915 ) ( ON-TABLE ?auto_107917 ) ( HOLDING ?auto_107918 ) ( CLEAR ?auto_107919 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107916 ?auto_107921 ?auto_107920 ?auto_107919 ?auto_107918 )
      ( MAKE-2PILE ?auto_107914 ?auto_107915 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107922 - BLOCK
      ?auto_107923 - BLOCK
    )
    :vars
    (
      ?auto_107925 - BLOCK
      ?auto_107926 - BLOCK
      ?auto_107924 - BLOCK
      ?auto_107927 - BLOCK
      ?auto_107929 - BLOCK
      ?auto_107928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107922 ?auto_107923 ) ) ( not ( = ?auto_107922 ?auto_107925 ) ) ( not ( = ?auto_107923 ?auto_107925 ) ) ( ON ?auto_107922 ?auto_107926 ) ( not ( = ?auto_107922 ?auto_107926 ) ) ( not ( = ?auto_107923 ?auto_107926 ) ) ( not ( = ?auto_107925 ?auto_107926 ) ) ( ON-TABLE ?auto_107924 ) ( ON ?auto_107927 ?auto_107924 ) ( ON ?auto_107929 ?auto_107927 ) ( ON ?auto_107928 ?auto_107929 ) ( not ( = ?auto_107924 ?auto_107927 ) ) ( not ( = ?auto_107924 ?auto_107929 ) ) ( not ( = ?auto_107924 ?auto_107928 ) ) ( not ( = ?auto_107924 ?auto_107925 ) ) ( not ( = ?auto_107924 ?auto_107923 ) ) ( not ( = ?auto_107927 ?auto_107929 ) ) ( not ( = ?auto_107927 ?auto_107928 ) ) ( not ( = ?auto_107927 ?auto_107925 ) ) ( not ( = ?auto_107927 ?auto_107923 ) ) ( not ( = ?auto_107929 ?auto_107928 ) ) ( not ( = ?auto_107929 ?auto_107925 ) ) ( not ( = ?auto_107929 ?auto_107923 ) ) ( not ( = ?auto_107928 ?auto_107925 ) ) ( not ( = ?auto_107928 ?auto_107923 ) ) ( not ( = ?auto_107922 ?auto_107924 ) ) ( not ( = ?auto_107922 ?auto_107927 ) ) ( not ( = ?auto_107922 ?auto_107929 ) ) ( not ( = ?auto_107922 ?auto_107928 ) ) ( not ( = ?auto_107926 ?auto_107924 ) ) ( not ( = ?auto_107926 ?auto_107927 ) ) ( not ( = ?auto_107926 ?auto_107929 ) ) ( not ( = ?auto_107926 ?auto_107928 ) ) ( ON ?auto_107923 ?auto_107922 ) ( ON-TABLE ?auto_107926 ) ( CLEAR ?auto_107928 ) ( ON ?auto_107925 ?auto_107923 ) ( CLEAR ?auto_107925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107926 ?auto_107922 ?auto_107923 )
      ( MAKE-2PILE ?auto_107922 ?auto_107923 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107930 - BLOCK
      ?auto_107931 - BLOCK
    )
    :vars
    (
      ?auto_107937 - BLOCK
      ?auto_107935 - BLOCK
      ?auto_107936 - BLOCK
      ?auto_107934 - BLOCK
      ?auto_107932 - BLOCK
      ?auto_107933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107930 ?auto_107931 ) ) ( not ( = ?auto_107930 ?auto_107937 ) ) ( not ( = ?auto_107931 ?auto_107937 ) ) ( ON ?auto_107930 ?auto_107935 ) ( not ( = ?auto_107930 ?auto_107935 ) ) ( not ( = ?auto_107931 ?auto_107935 ) ) ( not ( = ?auto_107937 ?auto_107935 ) ) ( ON-TABLE ?auto_107936 ) ( ON ?auto_107934 ?auto_107936 ) ( ON ?auto_107932 ?auto_107934 ) ( not ( = ?auto_107936 ?auto_107934 ) ) ( not ( = ?auto_107936 ?auto_107932 ) ) ( not ( = ?auto_107936 ?auto_107933 ) ) ( not ( = ?auto_107936 ?auto_107937 ) ) ( not ( = ?auto_107936 ?auto_107931 ) ) ( not ( = ?auto_107934 ?auto_107932 ) ) ( not ( = ?auto_107934 ?auto_107933 ) ) ( not ( = ?auto_107934 ?auto_107937 ) ) ( not ( = ?auto_107934 ?auto_107931 ) ) ( not ( = ?auto_107932 ?auto_107933 ) ) ( not ( = ?auto_107932 ?auto_107937 ) ) ( not ( = ?auto_107932 ?auto_107931 ) ) ( not ( = ?auto_107933 ?auto_107937 ) ) ( not ( = ?auto_107933 ?auto_107931 ) ) ( not ( = ?auto_107930 ?auto_107936 ) ) ( not ( = ?auto_107930 ?auto_107934 ) ) ( not ( = ?auto_107930 ?auto_107932 ) ) ( not ( = ?auto_107930 ?auto_107933 ) ) ( not ( = ?auto_107935 ?auto_107936 ) ) ( not ( = ?auto_107935 ?auto_107934 ) ) ( not ( = ?auto_107935 ?auto_107932 ) ) ( not ( = ?auto_107935 ?auto_107933 ) ) ( ON ?auto_107931 ?auto_107930 ) ( ON-TABLE ?auto_107935 ) ( ON ?auto_107937 ?auto_107931 ) ( CLEAR ?auto_107937 ) ( HOLDING ?auto_107933 ) ( CLEAR ?auto_107932 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107936 ?auto_107934 ?auto_107932 ?auto_107933 )
      ( MAKE-2PILE ?auto_107930 ?auto_107931 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107938 - BLOCK
      ?auto_107939 - BLOCK
    )
    :vars
    (
      ?auto_107940 - BLOCK
      ?auto_107944 - BLOCK
      ?auto_107942 - BLOCK
      ?auto_107945 - BLOCK
      ?auto_107943 - BLOCK
      ?auto_107941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107938 ?auto_107939 ) ) ( not ( = ?auto_107938 ?auto_107940 ) ) ( not ( = ?auto_107939 ?auto_107940 ) ) ( ON ?auto_107938 ?auto_107944 ) ( not ( = ?auto_107938 ?auto_107944 ) ) ( not ( = ?auto_107939 ?auto_107944 ) ) ( not ( = ?auto_107940 ?auto_107944 ) ) ( ON-TABLE ?auto_107942 ) ( ON ?auto_107945 ?auto_107942 ) ( ON ?auto_107943 ?auto_107945 ) ( not ( = ?auto_107942 ?auto_107945 ) ) ( not ( = ?auto_107942 ?auto_107943 ) ) ( not ( = ?auto_107942 ?auto_107941 ) ) ( not ( = ?auto_107942 ?auto_107940 ) ) ( not ( = ?auto_107942 ?auto_107939 ) ) ( not ( = ?auto_107945 ?auto_107943 ) ) ( not ( = ?auto_107945 ?auto_107941 ) ) ( not ( = ?auto_107945 ?auto_107940 ) ) ( not ( = ?auto_107945 ?auto_107939 ) ) ( not ( = ?auto_107943 ?auto_107941 ) ) ( not ( = ?auto_107943 ?auto_107940 ) ) ( not ( = ?auto_107943 ?auto_107939 ) ) ( not ( = ?auto_107941 ?auto_107940 ) ) ( not ( = ?auto_107941 ?auto_107939 ) ) ( not ( = ?auto_107938 ?auto_107942 ) ) ( not ( = ?auto_107938 ?auto_107945 ) ) ( not ( = ?auto_107938 ?auto_107943 ) ) ( not ( = ?auto_107938 ?auto_107941 ) ) ( not ( = ?auto_107944 ?auto_107942 ) ) ( not ( = ?auto_107944 ?auto_107945 ) ) ( not ( = ?auto_107944 ?auto_107943 ) ) ( not ( = ?auto_107944 ?auto_107941 ) ) ( ON ?auto_107939 ?auto_107938 ) ( ON-TABLE ?auto_107944 ) ( ON ?auto_107940 ?auto_107939 ) ( CLEAR ?auto_107943 ) ( ON ?auto_107941 ?auto_107940 ) ( CLEAR ?auto_107941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107944 ?auto_107938 ?auto_107939 ?auto_107940 )
      ( MAKE-2PILE ?auto_107938 ?auto_107939 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107946 - BLOCK
      ?auto_107947 - BLOCK
    )
    :vars
    (
      ?auto_107952 - BLOCK
      ?auto_107948 - BLOCK
      ?auto_107949 - BLOCK
      ?auto_107950 - BLOCK
      ?auto_107953 - BLOCK
      ?auto_107951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107946 ?auto_107947 ) ) ( not ( = ?auto_107946 ?auto_107952 ) ) ( not ( = ?auto_107947 ?auto_107952 ) ) ( ON ?auto_107946 ?auto_107948 ) ( not ( = ?auto_107946 ?auto_107948 ) ) ( not ( = ?auto_107947 ?auto_107948 ) ) ( not ( = ?auto_107952 ?auto_107948 ) ) ( ON-TABLE ?auto_107949 ) ( ON ?auto_107950 ?auto_107949 ) ( not ( = ?auto_107949 ?auto_107950 ) ) ( not ( = ?auto_107949 ?auto_107953 ) ) ( not ( = ?auto_107949 ?auto_107951 ) ) ( not ( = ?auto_107949 ?auto_107952 ) ) ( not ( = ?auto_107949 ?auto_107947 ) ) ( not ( = ?auto_107950 ?auto_107953 ) ) ( not ( = ?auto_107950 ?auto_107951 ) ) ( not ( = ?auto_107950 ?auto_107952 ) ) ( not ( = ?auto_107950 ?auto_107947 ) ) ( not ( = ?auto_107953 ?auto_107951 ) ) ( not ( = ?auto_107953 ?auto_107952 ) ) ( not ( = ?auto_107953 ?auto_107947 ) ) ( not ( = ?auto_107951 ?auto_107952 ) ) ( not ( = ?auto_107951 ?auto_107947 ) ) ( not ( = ?auto_107946 ?auto_107949 ) ) ( not ( = ?auto_107946 ?auto_107950 ) ) ( not ( = ?auto_107946 ?auto_107953 ) ) ( not ( = ?auto_107946 ?auto_107951 ) ) ( not ( = ?auto_107948 ?auto_107949 ) ) ( not ( = ?auto_107948 ?auto_107950 ) ) ( not ( = ?auto_107948 ?auto_107953 ) ) ( not ( = ?auto_107948 ?auto_107951 ) ) ( ON ?auto_107947 ?auto_107946 ) ( ON-TABLE ?auto_107948 ) ( ON ?auto_107952 ?auto_107947 ) ( ON ?auto_107951 ?auto_107952 ) ( CLEAR ?auto_107951 ) ( HOLDING ?auto_107953 ) ( CLEAR ?auto_107950 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107949 ?auto_107950 ?auto_107953 )
      ( MAKE-2PILE ?auto_107946 ?auto_107947 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107954 - BLOCK
      ?auto_107955 - BLOCK
    )
    :vars
    (
      ?auto_107961 - BLOCK
      ?auto_107960 - BLOCK
      ?auto_107956 - BLOCK
      ?auto_107959 - BLOCK
      ?auto_107957 - BLOCK
      ?auto_107958 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107954 ?auto_107955 ) ) ( not ( = ?auto_107954 ?auto_107961 ) ) ( not ( = ?auto_107955 ?auto_107961 ) ) ( ON ?auto_107954 ?auto_107960 ) ( not ( = ?auto_107954 ?auto_107960 ) ) ( not ( = ?auto_107955 ?auto_107960 ) ) ( not ( = ?auto_107961 ?auto_107960 ) ) ( ON-TABLE ?auto_107956 ) ( ON ?auto_107959 ?auto_107956 ) ( not ( = ?auto_107956 ?auto_107959 ) ) ( not ( = ?auto_107956 ?auto_107957 ) ) ( not ( = ?auto_107956 ?auto_107958 ) ) ( not ( = ?auto_107956 ?auto_107961 ) ) ( not ( = ?auto_107956 ?auto_107955 ) ) ( not ( = ?auto_107959 ?auto_107957 ) ) ( not ( = ?auto_107959 ?auto_107958 ) ) ( not ( = ?auto_107959 ?auto_107961 ) ) ( not ( = ?auto_107959 ?auto_107955 ) ) ( not ( = ?auto_107957 ?auto_107958 ) ) ( not ( = ?auto_107957 ?auto_107961 ) ) ( not ( = ?auto_107957 ?auto_107955 ) ) ( not ( = ?auto_107958 ?auto_107961 ) ) ( not ( = ?auto_107958 ?auto_107955 ) ) ( not ( = ?auto_107954 ?auto_107956 ) ) ( not ( = ?auto_107954 ?auto_107959 ) ) ( not ( = ?auto_107954 ?auto_107957 ) ) ( not ( = ?auto_107954 ?auto_107958 ) ) ( not ( = ?auto_107960 ?auto_107956 ) ) ( not ( = ?auto_107960 ?auto_107959 ) ) ( not ( = ?auto_107960 ?auto_107957 ) ) ( not ( = ?auto_107960 ?auto_107958 ) ) ( ON ?auto_107955 ?auto_107954 ) ( ON-TABLE ?auto_107960 ) ( ON ?auto_107961 ?auto_107955 ) ( ON ?auto_107958 ?auto_107961 ) ( CLEAR ?auto_107959 ) ( ON ?auto_107957 ?auto_107958 ) ( CLEAR ?auto_107957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107960 ?auto_107954 ?auto_107955 ?auto_107961 ?auto_107958 )
      ( MAKE-2PILE ?auto_107954 ?auto_107955 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107962 - BLOCK
      ?auto_107963 - BLOCK
    )
    :vars
    (
      ?auto_107964 - BLOCK
      ?auto_107965 - BLOCK
      ?auto_107967 - BLOCK
      ?auto_107966 - BLOCK
      ?auto_107968 - BLOCK
      ?auto_107969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107962 ?auto_107963 ) ) ( not ( = ?auto_107962 ?auto_107964 ) ) ( not ( = ?auto_107963 ?auto_107964 ) ) ( ON ?auto_107962 ?auto_107965 ) ( not ( = ?auto_107962 ?auto_107965 ) ) ( not ( = ?auto_107963 ?auto_107965 ) ) ( not ( = ?auto_107964 ?auto_107965 ) ) ( ON-TABLE ?auto_107967 ) ( not ( = ?auto_107967 ?auto_107966 ) ) ( not ( = ?auto_107967 ?auto_107968 ) ) ( not ( = ?auto_107967 ?auto_107969 ) ) ( not ( = ?auto_107967 ?auto_107964 ) ) ( not ( = ?auto_107967 ?auto_107963 ) ) ( not ( = ?auto_107966 ?auto_107968 ) ) ( not ( = ?auto_107966 ?auto_107969 ) ) ( not ( = ?auto_107966 ?auto_107964 ) ) ( not ( = ?auto_107966 ?auto_107963 ) ) ( not ( = ?auto_107968 ?auto_107969 ) ) ( not ( = ?auto_107968 ?auto_107964 ) ) ( not ( = ?auto_107968 ?auto_107963 ) ) ( not ( = ?auto_107969 ?auto_107964 ) ) ( not ( = ?auto_107969 ?auto_107963 ) ) ( not ( = ?auto_107962 ?auto_107967 ) ) ( not ( = ?auto_107962 ?auto_107966 ) ) ( not ( = ?auto_107962 ?auto_107968 ) ) ( not ( = ?auto_107962 ?auto_107969 ) ) ( not ( = ?auto_107965 ?auto_107967 ) ) ( not ( = ?auto_107965 ?auto_107966 ) ) ( not ( = ?auto_107965 ?auto_107968 ) ) ( not ( = ?auto_107965 ?auto_107969 ) ) ( ON ?auto_107963 ?auto_107962 ) ( ON-TABLE ?auto_107965 ) ( ON ?auto_107964 ?auto_107963 ) ( ON ?auto_107969 ?auto_107964 ) ( ON ?auto_107968 ?auto_107969 ) ( CLEAR ?auto_107968 ) ( HOLDING ?auto_107966 ) ( CLEAR ?auto_107967 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107967 ?auto_107966 )
      ( MAKE-2PILE ?auto_107962 ?auto_107963 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107970 - BLOCK
      ?auto_107971 - BLOCK
    )
    :vars
    (
      ?auto_107975 - BLOCK
      ?auto_107977 - BLOCK
      ?auto_107976 - BLOCK
      ?auto_107973 - BLOCK
      ?auto_107972 - BLOCK
      ?auto_107974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107970 ?auto_107971 ) ) ( not ( = ?auto_107970 ?auto_107975 ) ) ( not ( = ?auto_107971 ?auto_107975 ) ) ( ON ?auto_107970 ?auto_107977 ) ( not ( = ?auto_107970 ?auto_107977 ) ) ( not ( = ?auto_107971 ?auto_107977 ) ) ( not ( = ?auto_107975 ?auto_107977 ) ) ( ON-TABLE ?auto_107976 ) ( not ( = ?auto_107976 ?auto_107973 ) ) ( not ( = ?auto_107976 ?auto_107972 ) ) ( not ( = ?auto_107976 ?auto_107974 ) ) ( not ( = ?auto_107976 ?auto_107975 ) ) ( not ( = ?auto_107976 ?auto_107971 ) ) ( not ( = ?auto_107973 ?auto_107972 ) ) ( not ( = ?auto_107973 ?auto_107974 ) ) ( not ( = ?auto_107973 ?auto_107975 ) ) ( not ( = ?auto_107973 ?auto_107971 ) ) ( not ( = ?auto_107972 ?auto_107974 ) ) ( not ( = ?auto_107972 ?auto_107975 ) ) ( not ( = ?auto_107972 ?auto_107971 ) ) ( not ( = ?auto_107974 ?auto_107975 ) ) ( not ( = ?auto_107974 ?auto_107971 ) ) ( not ( = ?auto_107970 ?auto_107976 ) ) ( not ( = ?auto_107970 ?auto_107973 ) ) ( not ( = ?auto_107970 ?auto_107972 ) ) ( not ( = ?auto_107970 ?auto_107974 ) ) ( not ( = ?auto_107977 ?auto_107976 ) ) ( not ( = ?auto_107977 ?auto_107973 ) ) ( not ( = ?auto_107977 ?auto_107972 ) ) ( not ( = ?auto_107977 ?auto_107974 ) ) ( ON ?auto_107971 ?auto_107970 ) ( ON-TABLE ?auto_107977 ) ( ON ?auto_107975 ?auto_107971 ) ( ON ?auto_107974 ?auto_107975 ) ( ON ?auto_107972 ?auto_107974 ) ( CLEAR ?auto_107976 ) ( ON ?auto_107973 ?auto_107972 ) ( CLEAR ?auto_107973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107977 ?auto_107970 ?auto_107971 ?auto_107975 ?auto_107974 ?auto_107972 )
      ( MAKE-2PILE ?auto_107970 ?auto_107971 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107978 - BLOCK
      ?auto_107979 - BLOCK
    )
    :vars
    (
      ?auto_107983 - BLOCK
      ?auto_107982 - BLOCK
      ?auto_107981 - BLOCK
      ?auto_107985 - BLOCK
      ?auto_107980 - BLOCK
      ?auto_107984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107978 ?auto_107979 ) ) ( not ( = ?auto_107978 ?auto_107983 ) ) ( not ( = ?auto_107979 ?auto_107983 ) ) ( ON ?auto_107978 ?auto_107982 ) ( not ( = ?auto_107978 ?auto_107982 ) ) ( not ( = ?auto_107979 ?auto_107982 ) ) ( not ( = ?auto_107983 ?auto_107982 ) ) ( not ( = ?auto_107981 ?auto_107985 ) ) ( not ( = ?auto_107981 ?auto_107980 ) ) ( not ( = ?auto_107981 ?auto_107984 ) ) ( not ( = ?auto_107981 ?auto_107983 ) ) ( not ( = ?auto_107981 ?auto_107979 ) ) ( not ( = ?auto_107985 ?auto_107980 ) ) ( not ( = ?auto_107985 ?auto_107984 ) ) ( not ( = ?auto_107985 ?auto_107983 ) ) ( not ( = ?auto_107985 ?auto_107979 ) ) ( not ( = ?auto_107980 ?auto_107984 ) ) ( not ( = ?auto_107980 ?auto_107983 ) ) ( not ( = ?auto_107980 ?auto_107979 ) ) ( not ( = ?auto_107984 ?auto_107983 ) ) ( not ( = ?auto_107984 ?auto_107979 ) ) ( not ( = ?auto_107978 ?auto_107981 ) ) ( not ( = ?auto_107978 ?auto_107985 ) ) ( not ( = ?auto_107978 ?auto_107980 ) ) ( not ( = ?auto_107978 ?auto_107984 ) ) ( not ( = ?auto_107982 ?auto_107981 ) ) ( not ( = ?auto_107982 ?auto_107985 ) ) ( not ( = ?auto_107982 ?auto_107980 ) ) ( not ( = ?auto_107982 ?auto_107984 ) ) ( ON ?auto_107979 ?auto_107978 ) ( ON-TABLE ?auto_107982 ) ( ON ?auto_107983 ?auto_107979 ) ( ON ?auto_107984 ?auto_107983 ) ( ON ?auto_107980 ?auto_107984 ) ( ON ?auto_107985 ?auto_107980 ) ( CLEAR ?auto_107985 ) ( HOLDING ?auto_107981 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107981 )
      ( MAKE-2PILE ?auto_107978 ?auto_107979 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107986 - BLOCK
      ?auto_107987 - BLOCK
    )
    :vars
    (
      ?auto_107988 - BLOCK
      ?auto_107989 - BLOCK
      ?auto_107993 - BLOCK
      ?auto_107990 - BLOCK
      ?auto_107992 - BLOCK
      ?auto_107991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107986 ?auto_107987 ) ) ( not ( = ?auto_107986 ?auto_107988 ) ) ( not ( = ?auto_107987 ?auto_107988 ) ) ( ON ?auto_107986 ?auto_107989 ) ( not ( = ?auto_107986 ?auto_107989 ) ) ( not ( = ?auto_107987 ?auto_107989 ) ) ( not ( = ?auto_107988 ?auto_107989 ) ) ( not ( = ?auto_107993 ?auto_107990 ) ) ( not ( = ?auto_107993 ?auto_107992 ) ) ( not ( = ?auto_107993 ?auto_107991 ) ) ( not ( = ?auto_107993 ?auto_107988 ) ) ( not ( = ?auto_107993 ?auto_107987 ) ) ( not ( = ?auto_107990 ?auto_107992 ) ) ( not ( = ?auto_107990 ?auto_107991 ) ) ( not ( = ?auto_107990 ?auto_107988 ) ) ( not ( = ?auto_107990 ?auto_107987 ) ) ( not ( = ?auto_107992 ?auto_107991 ) ) ( not ( = ?auto_107992 ?auto_107988 ) ) ( not ( = ?auto_107992 ?auto_107987 ) ) ( not ( = ?auto_107991 ?auto_107988 ) ) ( not ( = ?auto_107991 ?auto_107987 ) ) ( not ( = ?auto_107986 ?auto_107993 ) ) ( not ( = ?auto_107986 ?auto_107990 ) ) ( not ( = ?auto_107986 ?auto_107992 ) ) ( not ( = ?auto_107986 ?auto_107991 ) ) ( not ( = ?auto_107989 ?auto_107993 ) ) ( not ( = ?auto_107989 ?auto_107990 ) ) ( not ( = ?auto_107989 ?auto_107992 ) ) ( not ( = ?auto_107989 ?auto_107991 ) ) ( ON ?auto_107987 ?auto_107986 ) ( ON-TABLE ?auto_107989 ) ( ON ?auto_107988 ?auto_107987 ) ( ON ?auto_107991 ?auto_107988 ) ( ON ?auto_107992 ?auto_107991 ) ( ON ?auto_107990 ?auto_107992 ) ( ON ?auto_107993 ?auto_107990 ) ( CLEAR ?auto_107993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107989 ?auto_107986 ?auto_107987 ?auto_107988 ?auto_107991 ?auto_107992 ?auto_107990 )
      ( MAKE-2PILE ?auto_107986 ?auto_107987 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108017 - BLOCK
      ?auto_108018 - BLOCK
      ?auto_108019 - BLOCK
      ?auto_108020 - BLOCK
    )
    :vars
    (
      ?auto_108022 - BLOCK
      ?auto_108023 - BLOCK
      ?auto_108021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108022 ?auto_108020 ) ( ON-TABLE ?auto_108017 ) ( ON ?auto_108018 ?auto_108017 ) ( ON ?auto_108019 ?auto_108018 ) ( ON ?auto_108020 ?auto_108019 ) ( not ( = ?auto_108017 ?auto_108018 ) ) ( not ( = ?auto_108017 ?auto_108019 ) ) ( not ( = ?auto_108017 ?auto_108020 ) ) ( not ( = ?auto_108017 ?auto_108022 ) ) ( not ( = ?auto_108018 ?auto_108019 ) ) ( not ( = ?auto_108018 ?auto_108020 ) ) ( not ( = ?auto_108018 ?auto_108022 ) ) ( not ( = ?auto_108019 ?auto_108020 ) ) ( not ( = ?auto_108019 ?auto_108022 ) ) ( not ( = ?auto_108020 ?auto_108022 ) ) ( not ( = ?auto_108017 ?auto_108023 ) ) ( not ( = ?auto_108017 ?auto_108021 ) ) ( not ( = ?auto_108018 ?auto_108023 ) ) ( not ( = ?auto_108018 ?auto_108021 ) ) ( not ( = ?auto_108019 ?auto_108023 ) ) ( not ( = ?auto_108019 ?auto_108021 ) ) ( not ( = ?auto_108020 ?auto_108023 ) ) ( not ( = ?auto_108020 ?auto_108021 ) ) ( not ( = ?auto_108022 ?auto_108023 ) ) ( not ( = ?auto_108022 ?auto_108021 ) ) ( not ( = ?auto_108023 ?auto_108021 ) ) ( ON ?auto_108023 ?auto_108022 ) ( CLEAR ?auto_108023 ) ( HOLDING ?auto_108021 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108021 )
      ( MAKE-4PILE ?auto_108017 ?auto_108018 ?auto_108019 ?auto_108020 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108104 - BLOCK
      ?auto_108105 - BLOCK
      ?auto_108106 - BLOCK
    )
    :vars
    (
      ?auto_108107 - BLOCK
      ?auto_108110 - BLOCK
      ?auto_108109 - BLOCK
      ?auto_108108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108104 ) ( not ( = ?auto_108104 ?auto_108105 ) ) ( not ( = ?auto_108104 ?auto_108106 ) ) ( not ( = ?auto_108105 ?auto_108106 ) ) ( ON ?auto_108106 ?auto_108107 ) ( not ( = ?auto_108104 ?auto_108107 ) ) ( not ( = ?auto_108105 ?auto_108107 ) ) ( not ( = ?auto_108106 ?auto_108107 ) ) ( CLEAR ?auto_108104 ) ( ON ?auto_108105 ?auto_108106 ) ( CLEAR ?auto_108105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108110 ) ( ON ?auto_108109 ?auto_108110 ) ( ON ?auto_108108 ?auto_108109 ) ( ON ?auto_108107 ?auto_108108 ) ( not ( = ?auto_108110 ?auto_108109 ) ) ( not ( = ?auto_108110 ?auto_108108 ) ) ( not ( = ?auto_108110 ?auto_108107 ) ) ( not ( = ?auto_108110 ?auto_108106 ) ) ( not ( = ?auto_108110 ?auto_108105 ) ) ( not ( = ?auto_108109 ?auto_108108 ) ) ( not ( = ?auto_108109 ?auto_108107 ) ) ( not ( = ?auto_108109 ?auto_108106 ) ) ( not ( = ?auto_108109 ?auto_108105 ) ) ( not ( = ?auto_108108 ?auto_108107 ) ) ( not ( = ?auto_108108 ?auto_108106 ) ) ( not ( = ?auto_108108 ?auto_108105 ) ) ( not ( = ?auto_108104 ?auto_108110 ) ) ( not ( = ?auto_108104 ?auto_108109 ) ) ( not ( = ?auto_108104 ?auto_108108 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108110 ?auto_108109 ?auto_108108 ?auto_108107 ?auto_108106 )
      ( MAKE-3PILE ?auto_108104 ?auto_108105 ?auto_108106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108111 - BLOCK
      ?auto_108112 - BLOCK
      ?auto_108113 - BLOCK
    )
    :vars
    (
      ?auto_108116 - BLOCK
      ?auto_108117 - BLOCK
      ?auto_108114 - BLOCK
      ?auto_108115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108111 ?auto_108112 ) ) ( not ( = ?auto_108111 ?auto_108113 ) ) ( not ( = ?auto_108112 ?auto_108113 ) ) ( ON ?auto_108113 ?auto_108116 ) ( not ( = ?auto_108111 ?auto_108116 ) ) ( not ( = ?auto_108112 ?auto_108116 ) ) ( not ( = ?auto_108113 ?auto_108116 ) ) ( ON ?auto_108112 ?auto_108113 ) ( CLEAR ?auto_108112 ) ( ON-TABLE ?auto_108117 ) ( ON ?auto_108114 ?auto_108117 ) ( ON ?auto_108115 ?auto_108114 ) ( ON ?auto_108116 ?auto_108115 ) ( not ( = ?auto_108117 ?auto_108114 ) ) ( not ( = ?auto_108117 ?auto_108115 ) ) ( not ( = ?auto_108117 ?auto_108116 ) ) ( not ( = ?auto_108117 ?auto_108113 ) ) ( not ( = ?auto_108117 ?auto_108112 ) ) ( not ( = ?auto_108114 ?auto_108115 ) ) ( not ( = ?auto_108114 ?auto_108116 ) ) ( not ( = ?auto_108114 ?auto_108113 ) ) ( not ( = ?auto_108114 ?auto_108112 ) ) ( not ( = ?auto_108115 ?auto_108116 ) ) ( not ( = ?auto_108115 ?auto_108113 ) ) ( not ( = ?auto_108115 ?auto_108112 ) ) ( not ( = ?auto_108111 ?auto_108117 ) ) ( not ( = ?auto_108111 ?auto_108114 ) ) ( not ( = ?auto_108111 ?auto_108115 ) ) ( HOLDING ?auto_108111 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108111 )
      ( MAKE-3PILE ?auto_108111 ?auto_108112 ?auto_108113 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108118 - BLOCK
      ?auto_108119 - BLOCK
      ?auto_108120 - BLOCK
    )
    :vars
    (
      ?auto_108123 - BLOCK
      ?auto_108121 - BLOCK
      ?auto_108124 - BLOCK
      ?auto_108122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108118 ?auto_108119 ) ) ( not ( = ?auto_108118 ?auto_108120 ) ) ( not ( = ?auto_108119 ?auto_108120 ) ) ( ON ?auto_108120 ?auto_108123 ) ( not ( = ?auto_108118 ?auto_108123 ) ) ( not ( = ?auto_108119 ?auto_108123 ) ) ( not ( = ?auto_108120 ?auto_108123 ) ) ( ON ?auto_108119 ?auto_108120 ) ( ON-TABLE ?auto_108121 ) ( ON ?auto_108124 ?auto_108121 ) ( ON ?auto_108122 ?auto_108124 ) ( ON ?auto_108123 ?auto_108122 ) ( not ( = ?auto_108121 ?auto_108124 ) ) ( not ( = ?auto_108121 ?auto_108122 ) ) ( not ( = ?auto_108121 ?auto_108123 ) ) ( not ( = ?auto_108121 ?auto_108120 ) ) ( not ( = ?auto_108121 ?auto_108119 ) ) ( not ( = ?auto_108124 ?auto_108122 ) ) ( not ( = ?auto_108124 ?auto_108123 ) ) ( not ( = ?auto_108124 ?auto_108120 ) ) ( not ( = ?auto_108124 ?auto_108119 ) ) ( not ( = ?auto_108122 ?auto_108123 ) ) ( not ( = ?auto_108122 ?auto_108120 ) ) ( not ( = ?auto_108122 ?auto_108119 ) ) ( not ( = ?auto_108118 ?auto_108121 ) ) ( not ( = ?auto_108118 ?auto_108124 ) ) ( not ( = ?auto_108118 ?auto_108122 ) ) ( ON ?auto_108118 ?auto_108119 ) ( CLEAR ?auto_108118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108121 ?auto_108124 ?auto_108122 ?auto_108123 ?auto_108120 ?auto_108119 )
      ( MAKE-3PILE ?auto_108118 ?auto_108119 ?auto_108120 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108128 - BLOCK
      ?auto_108129 - BLOCK
      ?auto_108130 - BLOCK
    )
    :vars
    (
      ?auto_108133 - BLOCK
      ?auto_108134 - BLOCK
      ?auto_108132 - BLOCK
      ?auto_108131 - BLOCK
      ?auto_108135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108128 ?auto_108129 ) ) ( not ( = ?auto_108128 ?auto_108130 ) ) ( not ( = ?auto_108129 ?auto_108130 ) ) ( ON ?auto_108130 ?auto_108133 ) ( not ( = ?auto_108128 ?auto_108133 ) ) ( not ( = ?auto_108129 ?auto_108133 ) ) ( not ( = ?auto_108130 ?auto_108133 ) ) ( ON ?auto_108129 ?auto_108130 ) ( CLEAR ?auto_108129 ) ( ON-TABLE ?auto_108134 ) ( ON ?auto_108132 ?auto_108134 ) ( ON ?auto_108131 ?auto_108132 ) ( ON ?auto_108133 ?auto_108131 ) ( not ( = ?auto_108134 ?auto_108132 ) ) ( not ( = ?auto_108134 ?auto_108131 ) ) ( not ( = ?auto_108134 ?auto_108133 ) ) ( not ( = ?auto_108134 ?auto_108130 ) ) ( not ( = ?auto_108134 ?auto_108129 ) ) ( not ( = ?auto_108132 ?auto_108131 ) ) ( not ( = ?auto_108132 ?auto_108133 ) ) ( not ( = ?auto_108132 ?auto_108130 ) ) ( not ( = ?auto_108132 ?auto_108129 ) ) ( not ( = ?auto_108131 ?auto_108133 ) ) ( not ( = ?auto_108131 ?auto_108130 ) ) ( not ( = ?auto_108131 ?auto_108129 ) ) ( not ( = ?auto_108128 ?auto_108134 ) ) ( not ( = ?auto_108128 ?auto_108132 ) ) ( not ( = ?auto_108128 ?auto_108131 ) ) ( ON ?auto_108128 ?auto_108135 ) ( CLEAR ?auto_108128 ) ( HAND-EMPTY ) ( not ( = ?auto_108128 ?auto_108135 ) ) ( not ( = ?auto_108129 ?auto_108135 ) ) ( not ( = ?auto_108130 ?auto_108135 ) ) ( not ( = ?auto_108133 ?auto_108135 ) ) ( not ( = ?auto_108134 ?auto_108135 ) ) ( not ( = ?auto_108132 ?auto_108135 ) ) ( not ( = ?auto_108131 ?auto_108135 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108128 ?auto_108135 )
      ( MAKE-3PILE ?auto_108128 ?auto_108129 ?auto_108130 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108136 - BLOCK
      ?auto_108137 - BLOCK
      ?auto_108138 - BLOCK
    )
    :vars
    (
      ?auto_108140 - BLOCK
      ?auto_108142 - BLOCK
      ?auto_108143 - BLOCK
      ?auto_108139 - BLOCK
      ?auto_108141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108136 ?auto_108137 ) ) ( not ( = ?auto_108136 ?auto_108138 ) ) ( not ( = ?auto_108137 ?auto_108138 ) ) ( ON ?auto_108138 ?auto_108140 ) ( not ( = ?auto_108136 ?auto_108140 ) ) ( not ( = ?auto_108137 ?auto_108140 ) ) ( not ( = ?auto_108138 ?auto_108140 ) ) ( ON-TABLE ?auto_108142 ) ( ON ?auto_108143 ?auto_108142 ) ( ON ?auto_108139 ?auto_108143 ) ( ON ?auto_108140 ?auto_108139 ) ( not ( = ?auto_108142 ?auto_108143 ) ) ( not ( = ?auto_108142 ?auto_108139 ) ) ( not ( = ?auto_108142 ?auto_108140 ) ) ( not ( = ?auto_108142 ?auto_108138 ) ) ( not ( = ?auto_108142 ?auto_108137 ) ) ( not ( = ?auto_108143 ?auto_108139 ) ) ( not ( = ?auto_108143 ?auto_108140 ) ) ( not ( = ?auto_108143 ?auto_108138 ) ) ( not ( = ?auto_108143 ?auto_108137 ) ) ( not ( = ?auto_108139 ?auto_108140 ) ) ( not ( = ?auto_108139 ?auto_108138 ) ) ( not ( = ?auto_108139 ?auto_108137 ) ) ( not ( = ?auto_108136 ?auto_108142 ) ) ( not ( = ?auto_108136 ?auto_108143 ) ) ( not ( = ?auto_108136 ?auto_108139 ) ) ( ON ?auto_108136 ?auto_108141 ) ( CLEAR ?auto_108136 ) ( not ( = ?auto_108136 ?auto_108141 ) ) ( not ( = ?auto_108137 ?auto_108141 ) ) ( not ( = ?auto_108138 ?auto_108141 ) ) ( not ( = ?auto_108140 ?auto_108141 ) ) ( not ( = ?auto_108142 ?auto_108141 ) ) ( not ( = ?auto_108143 ?auto_108141 ) ) ( not ( = ?auto_108139 ?auto_108141 ) ) ( HOLDING ?auto_108137 ) ( CLEAR ?auto_108138 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108142 ?auto_108143 ?auto_108139 ?auto_108140 ?auto_108138 ?auto_108137 )
      ( MAKE-3PILE ?auto_108136 ?auto_108137 ?auto_108138 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108144 - BLOCK
      ?auto_108145 - BLOCK
      ?auto_108146 - BLOCK
    )
    :vars
    (
      ?auto_108149 - BLOCK
      ?auto_108151 - BLOCK
      ?auto_108148 - BLOCK
      ?auto_108150 - BLOCK
      ?auto_108147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108144 ?auto_108145 ) ) ( not ( = ?auto_108144 ?auto_108146 ) ) ( not ( = ?auto_108145 ?auto_108146 ) ) ( ON ?auto_108146 ?auto_108149 ) ( not ( = ?auto_108144 ?auto_108149 ) ) ( not ( = ?auto_108145 ?auto_108149 ) ) ( not ( = ?auto_108146 ?auto_108149 ) ) ( ON-TABLE ?auto_108151 ) ( ON ?auto_108148 ?auto_108151 ) ( ON ?auto_108150 ?auto_108148 ) ( ON ?auto_108149 ?auto_108150 ) ( not ( = ?auto_108151 ?auto_108148 ) ) ( not ( = ?auto_108151 ?auto_108150 ) ) ( not ( = ?auto_108151 ?auto_108149 ) ) ( not ( = ?auto_108151 ?auto_108146 ) ) ( not ( = ?auto_108151 ?auto_108145 ) ) ( not ( = ?auto_108148 ?auto_108150 ) ) ( not ( = ?auto_108148 ?auto_108149 ) ) ( not ( = ?auto_108148 ?auto_108146 ) ) ( not ( = ?auto_108148 ?auto_108145 ) ) ( not ( = ?auto_108150 ?auto_108149 ) ) ( not ( = ?auto_108150 ?auto_108146 ) ) ( not ( = ?auto_108150 ?auto_108145 ) ) ( not ( = ?auto_108144 ?auto_108151 ) ) ( not ( = ?auto_108144 ?auto_108148 ) ) ( not ( = ?auto_108144 ?auto_108150 ) ) ( ON ?auto_108144 ?auto_108147 ) ( not ( = ?auto_108144 ?auto_108147 ) ) ( not ( = ?auto_108145 ?auto_108147 ) ) ( not ( = ?auto_108146 ?auto_108147 ) ) ( not ( = ?auto_108149 ?auto_108147 ) ) ( not ( = ?auto_108151 ?auto_108147 ) ) ( not ( = ?auto_108148 ?auto_108147 ) ) ( not ( = ?auto_108150 ?auto_108147 ) ) ( CLEAR ?auto_108146 ) ( ON ?auto_108145 ?auto_108144 ) ( CLEAR ?auto_108145 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108147 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108147 ?auto_108144 )
      ( MAKE-3PILE ?auto_108144 ?auto_108145 ?auto_108146 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108152 - BLOCK
      ?auto_108153 - BLOCK
      ?auto_108154 - BLOCK
    )
    :vars
    (
      ?auto_108156 - BLOCK
      ?auto_108155 - BLOCK
      ?auto_108159 - BLOCK
      ?auto_108157 - BLOCK
      ?auto_108158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108152 ?auto_108153 ) ) ( not ( = ?auto_108152 ?auto_108154 ) ) ( not ( = ?auto_108153 ?auto_108154 ) ) ( not ( = ?auto_108152 ?auto_108156 ) ) ( not ( = ?auto_108153 ?auto_108156 ) ) ( not ( = ?auto_108154 ?auto_108156 ) ) ( ON-TABLE ?auto_108155 ) ( ON ?auto_108159 ?auto_108155 ) ( ON ?auto_108157 ?auto_108159 ) ( ON ?auto_108156 ?auto_108157 ) ( not ( = ?auto_108155 ?auto_108159 ) ) ( not ( = ?auto_108155 ?auto_108157 ) ) ( not ( = ?auto_108155 ?auto_108156 ) ) ( not ( = ?auto_108155 ?auto_108154 ) ) ( not ( = ?auto_108155 ?auto_108153 ) ) ( not ( = ?auto_108159 ?auto_108157 ) ) ( not ( = ?auto_108159 ?auto_108156 ) ) ( not ( = ?auto_108159 ?auto_108154 ) ) ( not ( = ?auto_108159 ?auto_108153 ) ) ( not ( = ?auto_108157 ?auto_108156 ) ) ( not ( = ?auto_108157 ?auto_108154 ) ) ( not ( = ?auto_108157 ?auto_108153 ) ) ( not ( = ?auto_108152 ?auto_108155 ) ) ( not ( = ?auto_108152 ?auto_108159 ) ) ( not ( = ?auto_108152 ?auto_108157 ) ) ( ON ?auto_108152 ?auto_108158 ) ( not ( = ?auto_108152 ?auto_108158 ) ) ( not ( = ?auto_108153 ?auto_108158 ) ) ( not ( = ?auto_108154 ?auto_108158 ) ) ( not ( = ?auto_108156 ?auto_108158 ) ) ( not ( = ?auto_108155 ?auto_108158 ) ) ( not ( = ?auto_108159 ?auto_108158 ) ) ( not ( = ?auto_108157 ?auto_108158 ) ) ( ON ?auto_108153 ?auto_108152 ) ( CLEAR ?auto_108153 ) ( ON-TABLE ?auto_108158 ) ( HOLDING ?auto_108154 ) ( CLEAR ?auto_108156 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108155 ?auto_108159 ?auto_108157 ?auto_108156 ?auto_108154 )
      ( MAKE-3PILE ?auto_108152 ?auto_108153 ?auto_108154 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108160 - BLOCK
      ?auto_108161 - BLOCK
      ?auto_108162 - BLOCK
    )
    :vars
    (
      ?auto_108165 - BLOCK
      ?auto_108163 - BLOCK
      ?auto_108167 - BLOCK
      ?auto_108166 - BLOCK
      ?auto_108164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108160 ?auto_108161 ) ) ( not ( = ?auto_108160 ?auto_108162 ) ) ( not ( = ?auto_108161 ?auto_108162 ) ) ( not ( = ?auto_108160 ?auto_108165 ) ) ( not ( = ?auto_108161 ?auto_108165 ) ) ( not ( = ?auto_108162 ?auto_108165 ) ) ( ON-TABLE ?auto_108163 ) ( ON ?auto_108167 ?auto_108163 ) ( ON ?auto_108166 ?auto_108167 ) ( ON ?auto_108165 ?auto_108166 ) ( not ( = ?auto_108163 ?auto_108167 ) ) ( not ( = ?auto_108163 ?auto_108166 ) ) ( not ( = ?auto_108163 ?auto_108165 ) ) ( not ( = ?auto_108163 ?auto_108162 ) ) ( not ( = ?auto_108163 ?auto_108161 ) ) ( not ( = ?auto_108167 ?auto_108166 ) ) ( not ( = ?auto_108167 ?auto_108165 ) ) ( not ( = ?auto_108167 ?auto_108162 ) ) ( not ( = ?auto_108167 ?auto_108161 ) ) ( not ( = ?auto_108166 ?auto_108165 ) ) ( not ( = ?auto_108166 ?auto_108162 ) ) ( not ( = ?auto_108166 ?auto_108161 ) ) ( not ( = ?auto_108160 ?auto_108163 ) ) ( not ( = ?auto_108160 ?auto_108167 ) ) ( not ( = ?auto_108160 ?auto_108166 ) ) ( ON ?auto_108160 ?auto_108164 ) ( not ( = ?auto_108160 ?auto_108164 ) ) ( not ( = ?auto_108161 ?auto_108164 ) ) ( not ( = ?auto_108162 ?auto_108164 ) ) ( not ( = ?auto_108165 ?auto_108164 ) ) ( not ( = ?auto_108163 ?auto_108164 ) ) ( not ( = ?auto_108167 ?auto_108164 ) ) ( not ( = ?auto_108166 ?auto_108164 ) ) ( ON ?auto_108161 ?auto_108160 ) ( ON-TABLE ?auto_108164 ) ( CLEAR ?auto_108165 ) ( ON ?auto_108162 ?auto_108161 ) ( CLEAR ?auto_108162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108164 ?auto_108160 ?auto_108161 )
      ( MAKE-3PILE ?auto_108160 ?auto_108161 ?auto_108162 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108168 - BLOCK
      ?auto_108169 - BLOCK
      ?auto_108170 - BLOCK
    )
    :vars
    (
      ?auto_108175 - BLOCK
      ?auto_108174 - BLOCK
      ?auto_108171 - BLOCK
      ?auto_108173 - BLOCK
      ?auto_108172 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108168 ?auto_108169 ) ) ( not ( = ?auto_108168 ?auto_108170 ) ) ( not ( = ?auto_108169 ?auto_108170 ) ) ( not ( = ?auto_108168 ?auto_108175 ) ) ( not ( = ?auto_108169 ?auto_108175 ) ) ( not ( = ?auto_108170 ?auto_108175 ) ) ( ON-TABLE ?auto_108174 ) ( ON ?auto_108171 ?auto_108174 ) ( ON ?auto_108173 ?auto_108171 ) ( not ( = ?auto_108174 ?auto_108171 ) ) ( not ( = ?auto_108174 ?auto_108173 ) ) ( not ( = ?auto_108174 ?auto_108175 ) ) ( not ( = ?auto_108174 ?auto_108170 ) ) ( not ( = ?auto_108174 ?auto_108169 ) ) ( not ( = ?auto_108171 ?auto_108173 ) ) ( not ( = ?auto_108171 ?auto_108175 ) ) ( not ( = ?auto_108171 ?auto_108170 ) ) ( not ( = ?auto_108171 ?auto_108169 ) ) ( not ( = ?auto_108173 ?auto_108175 ) ) ( not ( = ?auto_108173 ?auto_108170 ) ) ( not ( = ?auto_108173 ?auto_108169 ) ) ( not ( = ?auto_108168 ?auto_108174 ) ) ( not ( = ?auto_108168 ?auto_108171 ) ) ( not ( = ?auto_108168 ?auto_108173 ) ) ( ON ?auto_108168 ?auto_108172 ) ( not ( = ?auto_108168 ?auto_108172 ) ) ( not ( = ?auto_108169 ?auto_108172 ) ) ( not ( = ?auto_108170 ?auto_108172 ) ) ( not ( = ?auto_108175 ?auto_108172 ) ) ( not ( = ?auto_108174 ?auto_108172 ) ) ( not ( = ?auto_108171 ?auto_108172 ) ) ( not ( = ?auto_108173 ?auto_108172 ) ) ( ON ?auto_108169 ?auto_108168 ) ( ON-TABLE ?auto_108172 ) ( ON ?auto_108170 ?auto_108169 ) ( CLEAR ?auto_108170 ) ( HOLDING ?auto_108175 ) ( CLEAR ?auto_108173 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108174 ?auto_108171 ?auto_108173 ?auto_108175 )
      ( MAKE-3PILE ?auto_108168 ?auto_108169 ?auto_108170 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108176 - BLOCK
      ?auto_108177 - BLOCK
      ?auto_108178 - BLOCK
    )
    :vars
    (
      ?auto_108183 - BLOCK
      ?auto_108182 - BLOCK
      ?auto_108180 - BLOCK
      ?auto_108181 - BLOCK
      ?auto_108179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108176 ?auto_108177 ) ) ( not ( = ?auto_108176 ?auto_108178 ) ) ( not ( = ?auto_108177 ?auto_108178 ) ) ( not ( = ?auto_108176 ?auto_108183 ) ) ( not ( = ?auto_108177 ?auto_108183 ) ) ( not ( = ?auto_108178 ?auto_108183 ) ) ( ON-TABLE ?auto_108182 ) ( ON ?auto_108180 ?auto_108182 ) ( ON ?auto_108181 ?auto_108180 ) ( not ( = ?auto_108182 ?auto_108180 ) ) ( not ( = ?auto_108182 ?auto_108181 ) ) ( not ( = ?auto_108182 ?auto_108183 ) ) ( not ( = ?auto_108182 ?auto_108178 ) ) ( not ( = ?auto_108182 ?auto_108177 ) ) ( not ( = ?auto_108180 ?auto_108181 ) ) ( not ( = ?auto_108180 ?auto_108183 ) ) ( not ( = ?auto_108180 ?auto_108178 ) ) ( not ( = ?auto_108180 ?auto_108177 ) ) ( not ( = ?auto_108181 ?auto_108183 ) ) ( not ( = ?auto_108181 ?auto_108178 ) ) ( not ( = ?auto_108181 ?auto_108177 ) ) ( not ( = ?auto_108176 ?auto_108182 ) ) ( not ( = ?auto_108176 ?auto_108180 ) ) ( not ( = ?auto_108176 ?auto_108181 ) ) ( ON ?auto_108176 ?auto_108179 ) ( not ( = ?auto_108176 ?auto_108179 ) ) ( not ( = ?auto_108177 ?auto_108179 ) ) ( not ( = ?auto_108178 ?auto_108179 ) ) ( not ( = ?auto_108183 ?auto_108179 ) ) ( not ( = ?auto_108182 ?auto_108179 ) ) ( not ( = ?auto_108180 ?auto_108179 ) ) ( not ( = ?auto_108181 ?auto_108179 ) ) ( ON ?auto_108177 ?auto_108176 ) ( ON-TABLE ?auto_108179 ) ( ON ?auto_108178 ?auto_108177 ) ( CLEAR ?auto_108181 ) ( ON ?auto_108183 ?auto_108178 ) ( CLEAR ?auto_108183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108179 ?auto_108176 ?auto_108177 ?auto_108178 )
      ( MAKE-3PILE ?auto_108176 ?auto_108177 ?auto_108178 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108184 - BLOCK
      ?auto_108185 - BLOCK
      ?auto_108186 - BLOCK
    )
    :vars
    (
      ?auto_108187 - BLOCK
      ?auto_108189 - BLOCK
      ?auto_108191 - BLOCK
      ?auto_108190 - BLOCK
      ?auto_108188 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108184 ?auto_108185 ) ) ( not ( = ?auto_108184 ?auto_108186 ) ) ( not ( = ?auto_108185 ?auto_108186 ) ) ( not ( = ?auto_108184 ?auto_108187 ) ) ( not ( = ?auto_108185 ?auto_108187 ) ) ( not ( = ?auto_108186 ?auto_108187 ) ) ( ON-TABLE ?auto_108189 ) ( ON ?auto_108191 ?auto_108189 ) ( not ( = ?auto_108189 ?auto_108191 ) ) ( not ( = ?auto_108189 ?auto_108190 ) ) ( not ( = ?auto_108189 ?auto_108187 ) ) ( not ( = ?auto_108189 ?auto_108186 ) ) ( not ( = ?auto_108189 ?auto_108185 ) ) ( not ( = ?auto_108191 ?auto_108190 ) ) ( not ( = ?auto_108191 ?auto_108187 ) ) ( not ( = ?auto_108191 ?auto_108186 ) ) ( not ( = ?auto_108191 ?auto_108185 ) ) ( not ( = ?auto_108190 ?auto_108187 ) ) ( not ( = ?auto_108190 ?auto_108186 ) ) ( not ( = ?auto_108190 ?auto_108185 ) ) ( not ( = ?auto_108184 ?auto_108189 ) ) ( not ( = ?auto_108184 ?auto_108191 ) ) ( not ( = ?auto_108184 ?auto_108190 ) ) ( ON ?auto_108184 ?auto_108188 ) ( not ( = ?auto_108184 ?auto_108188 ) ) ( not ( = ?auto_108185 ?auto_108188 ) ) ( not ( = ?auto_108186 ?auto_108188 ) ) ( not ( = ?auto_108187 ?auto_108188 ) ) ( not ( = ?auto_108189 ?auto_108188 ) ) ( not ( = ?auto_108191 ?auto_108188 ) ) ( not ( = ?auto_108190 ?auto_108188 ) ) ( ON ?auto_108185 ?auto_108184 ) ( ON-TABLE ?auto_108188 ) ( ON ?auto_108186 ?auto_108185 ) ( ON ?auto_108187 ?auto_108186 ) ( CLEAR ?auto_108187 ) ( HOLDING ?auto_108190 ) ( CLEAR ?auto_108191 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108189 ?auto_108191 ?auto_108190 )
      ( MAKE-3PILE ?auto_108184 ?auto_108185 ?auto_108186 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108192 - BLOCK
      ?auto_108193 - BLOCK
      ?auto_108194 - BLOCK
    )
    :vars
    (
      ?auto_108199 - BLOCK
      ?auto_108195 - BLOCK
      ?auto_108197 - BLOCK
      ?auto_108198 - BLOCK
      ?auto_108196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108192 ?auto_108193 ) ) ( not ( = ?auto_108192 ?auto_108194 ) ) ( not ( = ?auto_108193 ?auto_108194 ) ) ( not ( = ?auto_108192 ?auto_108199 ) ) ( not ( = ?auto_108193 ?auto_108199 ) ) ( not ( = ?auto_108194 ?auto_108199 ) ) ( ON-TABLE ?auto_108195 ) ( ON ?auto_108197 ?auto_108195 ) ( not ( = ?auto_108195 ?auto_108197 ) ) ( not ( = ?auto_108195 ?auto_108198 ) ) ( not ( = ?auto_108195 ?auto_108199 ) ) ( not ( = ?auto_108195 ?auto_108194 ) ) ( not ( = ?auto_108195 ?auto_108193 ) ) ( not ( = ?auto_108197 ?auto_108198 ) ) ( not ( = ?auto_108197 ?auto_108199 ) ) ( not ( = ?auto_108197 ?auto_108194 ) ) ( not ( = ?auto_108197 ?auto_108193 ) ) ( not ( = ?auto_108198 ?auto_108199 ) ) ( not ( = ?auto_108198 ?auto_108194 ) ) ( not ( = ?auto_108198 ?auto_108193 ) ) ( not ( = ?auto_108192 ?auto_108195 ) ) ( not ( = ?auto_108192 ?auto_108197 ) ) ( not ( = ?auto_108192 ?auto_108198 ) ) ( ON ?auto_108192 ?auto_108196 ) ( not ( = ?auto_108192 ?auto_108196 ) ) ( not ( = ?auto_108193 ?auto_108196 ) ) ( not ( = ?auto_108194 ?auto_108196 ) ) ( not ( = ?auto_108199 ?auto_108196 ) ) ( not ( = ?auto_108195 ?auto_108196 ) ) ( not ( = ?auto_108197 ?auto_108196 ) ) ( not ( = ?auto_108198 ?auto_108196 ) ) ( ON ?auto_108193 ?auto_108192 ) ( ON-TABLE ?auto_108196 ) ( ON ?auto_108194 ?auto_108193 ) ( ON ?auto_108199 ?auto_108194 ) ( CLEAR ?auto_108197 ) ( ON ?auto_108198 ?auto_108199 ) ( CLEAR ?auto_108198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108196 ?auto_108192 ?auto_108193 ?auto_108194 ?auto_108199 )
      ( MAKE-3PILE ?auto_108192 ?auto_108193 ?auto_108194 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108200 - BLOCK
      ?auto_108201 - BLOCK
      ?auto_108202 - BLOCK
    )
    :vars
    (
      ?auto_108205 - BLOCK
      ?auto_108206 - BLOCK
      ?auto_108207 - BLOCK
      ?auto_108203 - BLOCK
      ?auto_108204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108200 ?auto_108201 ) ) ( not ( = ?auto_108200 ?auto_108202 ) ) ( not ( = ?auto_108201 ?auto_108202 ) ) ( not ( = ?auto_108200 ?auto_108205 ) ) ( not ( = ?auto_108201 ?auto_108205 ) ) ( not ( = ?auto_108202 ?auto_108205 ) ) ( ON-TABLE ?auto_108206 ) ( not ( = ?auto_108206 ?auto_108207 ) ) ( not ( = ?auto_108206 ?auto_108203 ) ) ( not ( = ?auto_108206 ?auto_108205 ) ) ( not ( = ?auto_108206 ?auto_108202 ) ) ( not ( = ?auto_108206 ?auto_108201 ) ) ( not ( = ?auto_108207 ?auto_108203 ) ) ( not ( = ?auto_108207 ?auto_108205 ) ) ( not ( = ?auto_108207 ?auto_108202 ) ) ( not ( = ?auto_108207 ?auto_108201 ) ) ( not ( = ?auto_108203 ?auto_108205 ) ) ( not ( = ?auto_108203 ?auto_108202 ) ) ( not ( = ?auto_108203 ?auto_108201 ) ) ( not ( = ?auto_108200 ?auto_108206 ) ) ( not ( = ?auto_108200 ?auto_108207 ) ) ( not ( = ?auto_108200 ?auto_108203 ) ) ( ON ?auto_108200 ?auto_108204 ) ( not ( = ?auto_108200 ?auto_108204 ) ) ( not ( = ?auto_108201 ?auto_108204 ) ) ( not ( = ?auto_108202 ?auto_108204 ) ) ( not ( = ?auto_108205 ?auto_108204 ) ) ( not ( = ?auto_108206 ?auto_108204 ) ) ( not ( = ?auto_108207 ?auto_108204 ) ) ( not ( = ?auto_108203 ?auto_108204 ) ) ( ON ?auto_108201 ?auto_108200 ) ( ON-TABLE ?auto_108204 ) ( ON ?auto_108202 ?auto_108201 ) ( ON ?auto_108205 ?auto_108202 ) ( ON ?auto_108203 ?auto_108205 ) ( CLEAR ?auto_108203 ) ( HOLDING ?auto_108207 ) ( CLEAR ?auto_108206 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108206 ?auto_108207 )
      ( MAKE-3PILE ?auto_108200 ?auto_108201 ?auto_108202 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108208 - BLOCK
      ?auto_108209 - BLOCK
      ?auto_108210 - BLOCK
    )
    :vars
    (
      ?auto_108214 - BLOCK
      ?auto_108211 - BLOCK
      ?auto_108213 - BLOCK
      ?auto_108215 - BLOCK
      ?auto_108212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108208 ?auto_108209 ) ) ( not ( = ?auto_108208 ?auto_108210 ) ) ( not ( = ?auto_108209 ?auto_108210 ) ) ( not ( = ?auto_108208 ?auto_108214 ) ) ( not ( = ?auto_108209 ?auto_108214 ) ) ( not ( = ?auto_108210 ?auto_108214 ) ) ( ON-TABLE ?auto_108211 ) ( not ( = ?auto_108211 ?auto_108213 ) ) ( not ( = ?auto_108211 ?auto_108215 ) ) ( not ( = ?auto_108211 ?auto_108214 ) ) ( not ( = ?auto_108211 ?auto_108210 ) ) ( not ( = ?auto_108211 ?auto_108209 ) ) ( not ( = ?auto_108213 ?auto_108215 ) ) ( not ( = ?auto_108213 ?auto_108214 ) ) ( not ( = ?auto_108213 ?auto_108210 ) ) ( not ( = ?auto_108213 ?auto_108209 ) ) ( not ( = ?auto_108215 ?auto_108214 ) ) ( not ( = ?auto_108215 ?auto_108210 ) ) ( not ( = ?auto_108215 ?auto_108209 ) ) ( not ( = ?auto_108208 ?auto_108211 ) ) ( not ( = ?auto_108208 ?auto_108213 ) ) ( not ( = ?auto_108208 ?auto_108215 ) ) ( ON ?auto_108208 ?auto_108212 ) ( not ( = ?auto_108208 ?auto_108212 ) ) ( not ( = ?auto_108209 ?auto_108212 ) ) ( not ( = ?auto_108210 ?auto_108212 ) ) ( not ( = ?auto_108214 ?auto_108212 ) ) ( not ( = ?auto_108211 ?auto_108212 ) ) ( not ( = ?auto_108213 ?auto_108212 ) ) ( not ( = ?auto_108215 ?auto_108212 ) ) ( ON ?auto_108209 ?auto_108208 ) ( ON-TABLE ?auto_108212 ) ( ON ?auto_108210 ?auto_108209 ) ( ON ?auto_108214 ?auto_108210 ) ( ON ?auto_108215 ?auto_108214 ) ( CLEAR ?auto_108211 ) ( ON ?auto_108213 ?auto_108215 ) ( CLEAR ?auto_108213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108212 ?auto_108208 ?auto_108209 ?auto_108210 ?auto_108214 ?auto_108215 )
      ( MAKE-3PILE ?auto_108208 ?auto_108209 ?auto_108210 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108216 - BLOCK
      ?auto_108217 - BLOCK
      ?auto_108218 - BLOCK
    )
    :vars
    (
      ?auto_108221 - BLOCK
      ?auto_108220 - BLOCK
      ?auto_108223 - BLOCK
      ?auto_108222 - BLOCK
      ?auto_108219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108216 ?auto_108217 ) ) ( not ( = ?auto_108216 ?auto_108218 ) ) ( not ( = ?auto_108217 ?auto_108218 ) ) ( not ( = ?auto_108216 ?auto_108221 ) ) ( not ( = ?auto_108217 ?auto_108221 ) ) ( not ( = ?auto_108218 ?auto_108221 ) ) ( not ( = ?auto_108220 ?auto_108223 ) ) ( not ( = ?auto_108220 ?auto_108222 ) ) ( not ( = ?auto_108220 ?auto_108221 ) ) ( not ( = ?auto_108220 ?auto_108218 ) ) ( not ( = ?auto_108220 ?auto_108217 ) ) ( not ( = ?auto_108223 ?auto_108222 ) ) ( not ( = ?auto_108223 ?auto_108221 ) ) ( not ( = ?auto_108223 ?auto_108218 ) ) ( not ( = ?auto_108223 ?auto_108217 ) ) ( not ( = ?auto_108222 ?auto_108221 ) ) ( not ( = ?auto_108222 ?auto_108218 ) ) ( not ( = ?auto_108222 ?auto_108217 ) ) ( not ( = ?auto_108216 ?auto_108220 ) ) ( not ( = ?auto_108216 ?auto_108223 ) ) ( not ( = ?auto_108216 ?auto_108222 ) ) ( ON ?auto_108216 ?auto_108219 ) ( not ( = ?auto_108216 ?auto_108219 ) ) ( not ( = ?auto_108217 ?auto_108219 ) ) ( not ( = ?auto_108218 ?auto_108219 ) ) ( not ( = ?auto_108221 ?auto_108219 ) ) ( not ( = ?auto_108220 ?auto_108219 ) ) ( not ( = ?auto_108223 ?auto_108219 ) ) ( not ( = ?auto_108222 ?auto_108219 ) ) ( ON ?auto_108217 ?auto_108216 ) ( ON-TABLE ?auto_108219 ) ( ON ?auto_108218 ?auto_108217 ) ( ON ?auto_108221 ?auto_108218 ) ( ON ?auto_108222 ?auto_108221 ) ( ON ?auto_108223 ?auto_108222 ) ( CLEAR ?auto_108223 ) ( HOLDING ?auto_108220 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108220 )
      ( MAKE-3PILE ?auto_108216 ?auto_108217 ?auto_108218 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108224 - BLOCK
      ?auto_108225 - BLOCK
      ?auto_108226 - BLOCK
    )
    :vars
    (
      ?auto_108229 - BLOCK
      ?auto_108228 - BLOCK
      ?auto_108230 - BLOCK
      ?auto_108231 - BLOCK
      ?auto_108227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108224 ?auto_108225 ) ) ( not ( = ?auto_108224 ?auto_108226 ) ) ( not ( = ?auto_108225 ?auto_108226 ) ) ( not ( = ?auto_108224 ?auto_108229 ) ) ( not ( = ?auto_108225 ?auto_108229 ) ) ( not ( = ?auto_108226 ?auto_108229 ) ) ( not ( = ?auto_108228 ?auto_108230 ) ) ( not ( = ?auto_108228 ?auto_108231 ) ) ( not ( = ?auto_108228 ?auto_108229 ) ) ( not ( = ?auto_108228 ?auto_108226 ) ) ( not ( = ?auto_108228 ?auto_108225 ) ) ( not ( = ?auto_108230 ?auto_108231 ) ) ( not ( = ?auto_108230 ?auto_108229 ) ) ( not ( = ?auto_108230 ?auto_108226 ) ) ( not ( = ?auto_108230 ?auto_108225 ) ) ( not ( = ?auto_108231 ?auto_108229 ) ) ( not ( = ?auto_108231 ?auto_108226 ) ) ( not ( = ?auto_108231 ?auto_108225 ) ) ( not ( = ?auto_108224 ?auto_108228 ) ) ( not ( = ?auto_108224 ?auto_108230 ) ) ( not ( = ?auto_108224 ?auto_108231 ) ) ( ON ?auto_108224 ?auto_108227 ) ( not ( = ?auto_108224 ?auto_108227 ) ) ( not ( = ?auto_108225 ?auto_108227 ) ) ( not ( = ?auto_108226 ?auto_108227 ) ) ( not ( = ?auto_108229 ?auto_108227 ) ) ( not ( = ?auto_108228 ?auto_108227 ) ) ( not ( = ?auto_108230 ?auto_108227 ) ) ( not ( = ?auto_108231 ?auto_108227 ) ) ( ON ?auto_108225 ?auto_108224 ) ( ON-TABLE ?auto_108227 ) ( ON ?auto_108226 ?auto_108225 ) ( ON ?auto_108229 ?auto_108226 ) ( ON ?auto_108231 ?auto_108229 ) ( ON ?auto_108230 ?auto_108231 ) ( ON ?auto_108228 ?auto_108230 ) ( CLEAR ?auto_108228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108227 ?auto_108224 ?auto_108225 ?auto_108226 ?auto_108229 ?auto_108231 ?auto_108230 )
      ( MAKE-3PILE ?auto_108224 ?auto_108225 ?auto_108226 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108251 - BLOCK
      ?auto_108252 - BLOCK
      ?auto_108253 - BLOCK
    )
    :vars
    (
      ?auto_108256 - BLOCK
      ?auto_108254 - BLOCK
      ?auto_108255 - BLOCK
      ?auto_108257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108256 ?auto_108253 ) ( ON-TABLE ?auto_108251 ) ( ON ?auto_108252 ?auto_108251 ) ( ON ?auto_108253 ?auto_108252 ) ( not ( = ?auto_108251 ?auto_108252 ) ) ( not ( = ?auto_108251 ?auto_108253 ) ) ( not ( = ?auto_108251 ?auto_108256 ) ) ( not ( = ?auto_108252 ?auto_108253 ) ) ( not ( = ?auto_108252 ?auto_108256 ) ) ( not ( = ?auto_108253 ?auto_108256 ) ) ( not ( = ?auto_108251 ?auto_108254 ) ) ( not ( = ?auto_108251 ?auto_108255 ) ) ( not ( = ?auto_108252 ?auto_108254 ) ) ( not ( = ?auto_108252 ?auto_108255 ) ) ( not ( = ?auto_108253 ?auto_108254 ) ) ( not ( = ?auto_108253 ?auto_108255 ) ) ( not ( = ?auto_108256 ?auto_108254 ) ) ( not ( = ?auto_108256 ?auto_108255 ) ) ( not ( = ?auto_108254 ?auto_108255 ) ) ( ON ?auto_108254 ?auto_108256 ) ( CLEAR ?auto_108254 ) ( HOLDING ?auto_108255 ) ( CLEAR ?auto_108257 ) ( ON-TABLE ?auto_108257 ) ( not ( = ?auto_108257 ?auto_108255 ) ) ( not ( = ?auto_108251 ?auto_108257 ) ) ( not ( = ?auto_108252 ?auto_108257 ) ) ( not ( = ?auto_108253 ?auto_108257 ) ) ( not ( = ?auto_108256 ?auto_108257 ) ) ( not ( = ?auto_108254 ?auto_108257 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108257 ?auto_108255 )
      ( MAKE-3PILE ?auto_108251 ?auto_108252 ?auto_108253 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108258 - BLOCK
      ?auto_108259 - BLOCK
      ?auto_108260 - BLOCK
    )
    :vars
    (
      ?auto_108262 - BLOCK
      ?auto_108261 - BLOCK
      ?auto_108264 - BLOCK
      ?auto_108263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108262 ?auto_108260 ) ( ON-TABLE ?auto_108258 ) ( ON ?auto_108259 ?auto_108258 ) ( ON ?auto_108260 ?auto_108259 ) ( not ( = ?auto_108258 ?auto_108259 ) ) ( not ( = ?auto_108258 ?auto_108260 ) ) ( not ( = ?auto_108258 ?auto_108262 ) ) ( not ( = ?auto_108259 ?auto_108260 ) ) ( not ( = ?auto_108259 ?auto_108262 ) ) ( not ( = ?auto_108260 ?auto_108262 ) ) ( not ( = ?auto_108258 ?auto_108261 ) ) ( not ( = ?auto_108258 ?auto_108264 ) ) ( not ( = ?auto_108259 ?auto_108261 ) ) ( not ( = ?auto_108259 ?auto_108264 ) ) ( not ( = ?auto_108260 ?auto_108261 ) ) ( not ( = ?auto_108260 ?auto_108264 ) ) ( not ( = ?auto_108262 ?auto_108261 ) ) ( not ( = ?auto_108262 ?auto_108264 ) ) ( not ( = ?auto_108261 ?auto_108264 ) ) ( ON ?auto_108261 ?auto_108262 ) ( CLEAR ?auto_108263 ) ( ON-TABLE ?auto_108263 ) ( not ( = ?auto_108263 ?auto_108264 ) ) ( not ( = ?auto_108258 ?auto_108263 ) ) ( not ( = ?auto_108259 ?auto_108263 ) ) ( not ( = ?auto_108260 ?auto_108263 ) ) ( not ( = ?auto_108262 ?auto_108263 ) ) ( not ( = ?auto_108261 ?auto_108263 ) ) ( ON ?auto_108264 ?auto_108261 ) ( CLEAR ?auto_108264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108258 ?auto_108259 ?auto_108260 ?auto_108262 ?auto_108261 )
      ( MAKE-3PILE ?auto_108258 ?auto_108259 ?auto_108260 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108265 - BLOCK
      ?auto_108266 - BLOCK
      ?auto_108267 - BLOCK
    )
    :vars
    (
      ?auto_108271 - BLOCK
      ?auto_108269 - BLOCK
      ?auto_108268 - BLOCK
      ?auto_108270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108271 ?auto_108267 ) ( ON-TABLE ?auto_108265 ) ( ON ?auto_108266 ?auto_108265 ) ( ON ?auto_108267 ?auto_108266 ) ( not ( = ?auto_108265 ?auto_108266 ) ) ( not ( = ?auto_108265 ?auto_108267 ) ) ( not ( = ?auto_108265 ?auto_108271 ) ) ( not ( = ?auto_108266 ?auto_108267 ) ) ( not ( = ?auto_108266 ?auto_108271 ) ) ( not ( = ?auto_108267 ?auto_108271 ) ) ( not ( = ?auto_108265 ?auto_108269 ) ) ( not ( = ?auto_108265 ?auto_108268 ) ) ( not ( = ?auto_108266 ?auto_108269 ) ) ( not ( = ?auto_108266 ?auto_108268 ) ) ( not ( = ?auto_108267 ?auto_108269 ) ) ( not ( = ?auto_108267 ?auto_108268 ) ) ( not ( = ?auto_108271 ?auto_108269 ) ) ( not ( = ?auto_108271 ?auto_108268 ) ) ( not ( = ?auto_108269 ?auto_108268 ) ) ( ON ?auto_108269 ?auto_108271 ) ( not ( = ?auto_108270 ?auto_108268 ) ) ( not ( = ?auto_108265 ?auto_108270 ) ) ( not ( = ?auto_108266 ?auto_108270 ) ) ( not ( = ?auto_108267 ?auto_108270 ) ) ( not ( = ?auto_108271 ?auto_108270 ) ) ( not ( = ?auto_108269 ?auto_108270 ) ) ( ON ?auto_108268 ?auto_108269 ) ( CLEAR ?auto_108268 ) ( HOLDING ?auto_108270 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108270 )
      ( MAKE-3PILE ?auto_108265 ?auto_108266 ?auto_108267 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108282 - BLOCK
      ?auto_108283 - BLOCK
      ?auto_108284 - BLOCK
    )
    :vars
    (
      ?auto_108285 - BLOCK
      ?auto_108288 - BLOCK
      ?auto_108286 - BLOCK
      ?auto_108287 - BLOCK
      ?auto_108289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108285 ?auto_108284 ) ( ON-TABLE ?auto_108282 ) ( ON ?auto_108283 ?auto_108282 ) ( ON ?auto_108284 ?auto_108283 ) ( not ( = ?auto_108282 ?auto_108283 ) ) ( not ( = ?auto_108282 ?auto_108284 ) ) ( not ( = ?auto_108282 ?auto_108285 ) ) ( not ( = ?auto_108283 ?auto_108284 ) ) ( not ( = ?auto_108283 ?auto_108285 ) ) ( not ( = ?auto_108284 ?auto_108285 ) ) ( not ( = ?auto_108282 ?auto_108288 ) ) ( not ( = ?auto_108282 ?auto_108286 ) ) ( not ( = ?auto_108283 ?auto_108288 ) ) ( not ( = ?auto_108283 ?auto_108286 ) ) ( not ( = ?auto_108284 ?auto_108288 ) ) ( not ( = ?auto_108284 ?auto_108286 ) ) ( not ( = ?auto_108285 ?auto_108288 ) ) ( not ( = ?auto_108285 ?auto_108286 ) ) ( not ( = ?auto_108288 ?auto_108286 ) ) ( ON ?auto_108288 ?auto_108285 ) ( not ( = ?auto_108287 ?auto_108286 ) ) ( not ( = ?auto_108282 ?auto_108287 ) ) ( not ( = ?auto_108283 ?auto_108287 ) ) ( not ( = ?auto_108284 ?auto_108287 ) ) ( not ( = ?auto_108285 ?auto_108287 ) ) ( not ( = ?auto_108288 ?auto_108287 ) ) ( ON ?auto_108286 ?auto_108288 ) ( CLEAR ?auto_108286 ) ( ON ?auto_108287 ?auto_108289 ) ( CLEAR ?auto_108287 ) ( HAND-EMPTY ) ( not ( = ?auto_108282 ?auto_108289 ) ) ( not ( = ?auto_108283 ?auto_108289 ) ) ( not ( = ?auto_108284 ?auto_108289 ) ) ( not ( = ?auto_108285 ?auto_108289 ) ) ( not ( = ?auto_108288 ?auto_108289 ) ) ( not ( = ?auto_108286 ?auto_108289 ) ) ( not ( = ?auto_108287 ?auto_108289 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108287 ?auto_108289 )
      ( MAKE-3PILE ?auto_108282 ?auto_108283 ?auto_108284 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108290 - BLOCK
      ?auto_108291 - BLOCK
      ?auto_108292 - BLOCK
    )
    :vars
    (
      ?auto_108293 - BLOCK
      ?auto_108297 - BLOCK
      ?auto_108294 - BLOCK
      ?auto_108296 - BLOCK
      ?auto_108295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108293 ?auto_108292 ) ( ON-TABLE ?auto_108290 ) ( ON ?auto_108291 ?auto_108290 ) ( ON ?auto_108292 ?auto_108291 ) ( not ( = ?auto_108290 ?auto_108291 ) ) ( not ( = ?auto_108290 ?auto_108292 ) ) ( not ( = ?auto_108290 ?auto_108293 ) ) ( not ( = ?auto_108291 ?auto_108292 ) ) ( not ( = ?auto_108291 ?auto_108293 ) ) ( not ( = ?auto_108292 ?auto_108293 ) ) ( not ( = ?auto_108290 ?auto_108297 ) ) ( not ( = ?auto_108290 ?auto_108294 ) ) ( not ( = ?auto_108291 ?auto_108297 ) ) ( not ( = ?auto_108291 ?auto_108294 ) ) ( not ( = ?auto_108292 ?auto_108297 ) ) ( not ( = ?auto_108292 ?auto_108294 ) ) ( not ( = ?auto_108293 ?auto_108297 ) ) ( not ( = ?auto_108293 ?auto_108294 ) ) ( not ( = ?auto_108297 ?auto_108294 ) ) ( ON ?auto_108297 ?auto_108293 ) ( not ( = ?auto_108296 ?auto_108294 ) ) ( not ( = ?auto_108290 ?auto_108296 ) ) ( not ( = ?auto_108291 ?auto_108296 ) ) ( not ( = ?auto_108292 ?auto_108296 ) ) ( not ( = ?auto_108293 ?auto_108296 ) ) ( not ( = ?auto_108297 ?auto_108296 ) ) ( ON ?auto_108296 ?auto_108295 ) ( CLEAR ?auto_108296 ) ( not ( = ?auto_108290 ?auto_108295 ) ) ( not ( = ?auto_108291 ?auto_108295 ) ) ( not ( = ?auto_108292 ?auto_108295 ) ) ( not ( = ?auto_108293 ?auto_108295 ) ) ( not ( = ?auto_108297 ?auto_108295 ) ) ( not ( = ?auto_108294 ?auto_108295 ) ) ( not ( = ?auto_108296 ?auto_108295 ) ) ( HOLDING ?auto_108294 ) ( CLEAR ?auto_108297 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108290 ?auto_108291 ?auto_108292 ?auto_108293 ?auto_108297 ?auto_108294 )
      ( MAKE-3PILE ?auto_108290 ?auto_108291 ?auto_108292 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108352 - BLOCK
      ?auto_108353 - BLOCK
      ?auto_108354 - BLOCK
      ?auto_108355 - BLOCK
    )
    :vars
    (
      ?auto_108356 - BLOCK
      ?auto_108357 - BLOCK
      ?auto_108358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108352 ) ( ON ?auto_108353 ?auto_108352 ) ( not ( = ?auto_108352 ?auto_108353 ) ) ( not ( = ?auto_108352 ?auto_108354 ) ) ( not ( = ?auto_108352 ?auto_108355 ) ) ( not ( = ?auto_108353 ?auto_108354 ) ) ( not ( = ?auto_108353 ?auto_108355 ) ) ( not ( = ?auto_108354 ?auto_108355 ) ) ( ON ?auto_108355 ?auto_108356 ) ( not ( = ?auto_108352 ?auto_108356 ) ) ( not ( = ?auto_108353 ?auto_108356 ) ) ( not ( = ?auto_108354 ?auto_108356 ) ) ( not ( = ?auto_108355 ?auto_108356 ) ) ( CLEAR ?auto_108353 ) ( ON ?auto_108354 ?auto_108355 ) ( CLEAR ?auto_108354 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108357 ) ( ON ?auto_108358 ?auto_108357 ) ( ON ?auto_108356 ?auto_108358 ) ( not ( = ?auto_108357 ?auto_108358 ) ) ( not ( = ?auto_108357 ?auto_108356 ) ) ( not ( = ?auto_108357 ?auto_108355 ) ) ( not ( = ?auto_108357 ?auto_108354 ) ) ( not ( = ?auto_108358 ?auto_108356 ) ) ( not ( = ?auto_108358 ?auto_108355 ) ) ( not ( = ?auto_108358 ?auto_108354 ) ) ( not ( = ?auto_108352 ?auto_108357 ) ) ( not ( = ?auto_108352 ?auto_108358 ) ) ( not ( = ?auto_108353 ?auto_108357 ) ) ( not ( = ?auto_108353 ?auto_108358 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108357 ?auto_108358 ?auto_108356 ?auto_108355 )
      ( MAKE-4PILE ?auto_108352 ?auto_108353 ?auto_108354 ?auto_108355 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108359 - BLOCK
      ?auto_108360 - BLOCK
      ?auto_108361 - BLOCK
      ?auto_108362 - BLOCK
    )
    :vars
    (
      ?auto_108364 - BLOCK
      ?auto_108365 - BLOCK
      ?auto_108363 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108359 ) ( not ( = ?auto_108359 ?auto_108360 ) ) ( not ( = ?auto_108359 ?auto_108361 ) ) ( not ( = ?auto_108359 ?auto_108362 ) ) ( not ( = ?auto_108360 ?auto_108361 ) ) ( not ( = ?auto_108360 ?auto_108362 ) ) ( not ( = ?auto_108361 ?auto_108362 ) ) ( ON ?auto_108362 ?auto_108364 ) ( not ( = ?auto_108359 ?auto_108364 ) ) ( not ( = ?auto_108360 ?auto_108364 ) ) ( not ( = ?auto_108361 ?auto_108364 ) ) ( not ( = ?auto_108362 ?auto_108364 ) ) ( ON ?auto_108361 ?auto_108362 ) ( CLEAR ?auto_108361 ) ( ON-TABLE ?auto_108365 ) ( ON ?auto_108363 ?auto_108365 ) ( ON ?auto_108364 ?auto_108363 ) ( not ( = ?auto_108365 ?auto_108363 ) ) ( not ( = ?auto_108365 ?auto_108364 ) ) ( not ( = ?auto_108365 ?auto_108362 ) ) ( not ( = ?auto_108365 ?auto_108361 ) ) ( not ( = ?auto_108363 ?auto_108364 ) ) ( not ( = ?auto_108363 ?auto_108362 ) ) ( not ( = ?auto_108363 ?auto_108361 ) ) ( not ( = ?auto_108359 ?auto_108365 ) ) ( not ( = ?auto_108359 ?auto_108363 ) ) ( not ( = ?auto_108360 ?auto_108365 ) ) ( not ( = ?auto_108360 ?auto_108363 ) ) ( HOLDING ?auto_108360 ) ( CLEAR ?auto_108359 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108359 ?auto_108360 )
      ( MAKE-4PILE ?auto_108359 ?auto_108360 ?auto_108361 ?auto_108362 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108366 - BLOCK
      ?auto_108367 - BLOCK
      ?auto_108368 - BLOCK
      ?auto_108369 - BLOCK
    )
    :vars
    (
      ?auto_108371 - BLOCK
      ?auto_108372 - BLOCK
      ?auto_108370 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108366 ) ( not ( = ?auto_108366 ?auto_108367 ) ) ( not ( = ?auto_108366 ?auto_108368 ) ) ( not ( = ?auto_108366 ?auto_108369 ) ) ( not ( = ?auto_108367 ?auto_108368 ) ) ( not ( = ?auto_108367 ?auto_108369 ) ) ( not ( = ?auto_108368 ?auto_108369 ) ) ( ON ?auto_108369 ?auto_108371 ) ( not ( = ?auto_108366 ?auto_108371 ) ) ( not ( = ?auto_108367 ?auto_108371 ) ) ( not ( = ?auto_108368 ?auto_108371 ) ) ( not ( = ?auto_108369 ?auto_108371 ) ) ( ON ?auto_108368 ?auto_108369 ) ( ON-TABLE ?auto_108372 ) ( ON ?auto_108370 ?auto_108372 ) ( ON ?auto_108371 ?auto_108370 ) ( not ( = ?auto_108372 ?auto_108370 ) ) ( not ( = ?auto_108372 ?auto_108371 ) ) ( not ( = ?auto_108372 ?auto_108369 ) ) ( not ( = ?auto_108372 ?auto_108368 ) ) ( not ( = ?auto_108370 ?auto_108371 ) ) ( not ( = ?auto_108370 ?auto_108369 ) ) ( not ( = ?auto_108370 ?auto_108368 ) ) ( not ( = ?auto_108366 ?auto_108372 ) ) ( not ( = ?auto_108366 ?auto_108370 ) ) ( not ( = ?auto_108367 ?auto_108372 ) ) ( not ( = ?auto_108367 ?auto_108370 ) ) ( CLEAR ?auto_108366 ) ( ON ?auto_108367 ?auto_108368 ) ( CLEAR ?auto_108367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108372 ?auto_108370 ?auto_108371 ?auto_108369 ?auto_108368 )
      ( MAKE-4PILE ?auto_108366 ?auto_108367 ?auto_108368 ?auto_108369 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108373 - BLOCK
      ?auto_108374 - BLOCK
      ?auto_108375 - BLOCK
      ?auto_108376 - BLOCK
    )
    :vars
    (
      ?auto_108379 - BLOCK
      ?auto_108378 - BLOCK
      ?auto_108377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108373 ?auto_108374 ) ) ( not ( = ?auto_108373 ?auto_108375 ) ) ( not ( = ?auto_108373 ?auto_108376 ) ) ( not ( = ?auto_108374 ?auto_108375 ) ) ( not ( = ?auto_108374 ?auto_108376 ) ) ( not ( = ?auto_108375 ?auto_108376 ) ) ( ON ?auto_108376 ?auto_108379 ) ( not ( = ?auto_108373 ?auto_108379 ) ) ( not ( = ?auto_108374 ?auto_108379 ) ) ( not ( = ?auto_108375 ?auto_108379 ) ) ( not ( = ?auto_108376 ?auto_108379 ) ) ( ON ?auto_108375 ?auto_108376 ) ( ON-TABLE ?auto_108378 ) ( ON ?auto_108377 ?auto_108378 ) ( ON ?auto_108379 ?auto_108377 ) ( not ( = ?auto_108378 ?auto_108377 ) ) ( not ( = ?auto_108378 ?auto_108379 ) ) ( not ( = ?auto_108378 ?auto_108376 ) ) ( not ( = ?auto_108378 ?auto_108375 ) ) ( not ( = ?auto_108377 ?auto_108379 ) ) ( not ( = ?auto_108377 ?auto_108376 ) ) ( not ( = ?auto_108377 ?auto_108375 ) ) ( not ( = ?auto_108373 ?auto_108378 ) ) ( not ( = ?auto_108373 ?auto_108377 ) ) ( not ( = ?auto_108374 ?auto_108378 ) ) ( not ( = ?auto_108374 ?auto_108377 ) ) ( ON ?auto_108374 ?auto_108375 ) ( CLEAR ?auto_108374 ) ( HOLDING ?auto_108373 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108373 )
      ( MAKE-4PILE ?auto_108373 ?auto_108374 ?auto_108375 ?auto_108376 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108380 - BLOCK
      ?auto_108381 - BLOCK
      ?auto_108382 - BLOCK
      ?auto_108383 - BLOCK
    )
    :vars
    (
      ?auto_108386 - BLOCK
      ?auto_108385 - BLOCK
      ?auto_108384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108380 ?auto_108381 ) ) ( not ( = ?auto_108380 ?auto_108382 ) ) ( not ( = ?auto_108380 ?auto_108383 ) ) ( not ( = ?auto_108381 ?auto_108382 ) ) ( not ( = ?auto_108381 ?auto_108383 ) ) ( not ( = ?auto_108382 ?auto_108383 ) ) ( ON ?auto_108383 ?auto_108386 ) ( not ( = ?auto_108380 ?auto_108386 ) ) ( not ( = ?auto_108381 ?auto_108386 ) ) ( not ( = ?auto_108382 ?auto_108386 ) ) ( not ( = ?auto_108383 ?auto_108386 ) ) ( ON ?auto_108382 ?auto_108383 ) ( ON-TABLE ?auto_108385 ) ( ON ?auto_108384 ?auto_108385 ) ( ON ?auto_108386 ?auto_108384 ) ( not ( = ?auto_108385 ?auto_108384 ) ) ( not ( = ?auto_108385 ?auto_108386 ) ) ( not ( = ?auto_108385 ?auto_108383 ) ) ( not ( = ?auto_108385 ?auto_108382 ) ) ( not ( = ?auto_108384 ?auto_108386 ) ) ( not ( = ?auto_108384 ?auto_108383 ) ) ( not ( = ?auto_108384 ?auto_108382 ) ) ( not ( = ?auto_108380 ?auto_108385 ) ) ( not ( = ?auto_108380 ?auto_108384 ) ) ( not ( = ?auto_108381 ?auto_108385 ) ) ( not ( = ?auto_108381 ?auto_108384 ) ) ( ON ?auto_108381 ?auto_108382 ) ( ON ?auto_108380 ?auto_108381 ) ( CLEAR ?auto_108380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108385 ?auto_108384 ?auto_108386 ?auto_108383 ?auto_108382 ?auto_108381 )
      ( MAKE-4PILE ?auto_108380 ?auto_108381 ?auto_108382 ?auto_108383 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108391 - BLOCK
      ?auto_108392 - BLOCK
      ?auto_108393 - BLOCK
      ?auto_108394 - BLOCK
    )
    :vars
    (
      ?auto_108395 - BLOCK
      ?auto_108396 - BLOCK
      ?auto_108397 - BLOCK
      ?auto_108398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108391 ?auto_108392 ) ) ( not ( = ?auto_108391 ?auto_108393 ) ) ( not ( = ?auto_108391 ?auto_108394 ) ) ( not ( = ?auto_108392 ?auto_108393 ) ) ( not ( = ?auto_108392 ?auto_108394 ) ) ( not ( = ?auto_108393 ?auto_108394 ) ) ( ON ?auto_108394 ?auto_108395 ) ( not ( = ?auto_108391 ?auto_108395 ) ) ( not ( = ?auto_108392 ?auto_108395 ) ) ( not ( = ?auto_108393 ?auto_108395 ) ) ( not ( = ?auto_108394 ?auto_108395 ) ) ( ON ?auto_108393 ?auto_108394 ) ( ON-TABLE ?auto_108396 ) ( ON ?auto_108397 ?auto_108396 ) ( ON ?auto_108395 ?auto_108397 ) ( not ( = ?auto_108396 ?auto_108397 ) ) ( not ( = ?auto_108396 ?auto_108395 ) ) ( not ( = ?auto_108396 ?auto_108394 ) ) ( not ( = ?auto_108396 ?auto_108393 ) ) ( not ( = ?auto_108397 ?auto_108395 ) ) ( not ( = ?auto_108397 ?auto_108394 ) ) ( not ( = ?auto_108397 ?auto_108393 ) ) ( not ( = ?auto_108391 ?auto_108396 ) ) ( not ( = ?auto_108391 ?auto_108397 ) ) ( not ( = ?auto_108392 ?auto_108396 ) ) ( not ( = ?auto_108392 ?auto_108397 ) ) ( ON ?auto_108392 ?auto_108393 ) ( CLEAR ?auto_108392 ) ( ON ?auto_108391 ?auto_108398 ) ( CLEAR ?auto_108391 ) ( HAND-EMPTY ) ( not ( = ?auto_108391 ?auto_108398 ) ) ( not ( = ?auto_108392 ?auto_108398 ) ) ( not ( = ?auto_108393 ?auto_108398 ) ) ( not ( = ?auto_108394 ?auto_108398 ) ) ( not ( = ?auto_108395 ?auto_108398 ) ) ( not ( = ?auto_108396 ?auto_108398 ) ) ( not ( = ?auto_108397 ?auto_108398 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108391 ?auto_108398 )
      ( MAKE-4PILE ?auto_108391 ?auto_108392 ?auto_108393 ?auto_108394 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108399 - BLOCK
      ?auto_108400 - BLOCK
      ?auto_108401 - BLOCK
      ?auto_108402 - BLOCK
    )
    :vars
    (
      ?auto_108404 - BLOCK
      ?auto_108406 - BLOCK
      ?auto_108405 - BLOCK
      ?auto_108403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108399 ?auto_108400 ) ) ( not ( = ?auto_108399 ?auto_108401 ) ) ( not ( = ?auto_108399 ?auto_108402 ) ) ( not ( = ?auto_108400 ?auto_108401 ) ) ( not ( = ?auto_108400 ?auto_108402 ) ) ( not ( = ?auto_108401 ?auto_108402 ) ) ( ON ?auto_108402 ?auto_108404 ) ( not ( = ?auto_108399 ?auto_108404 ) ) ( not ( = ?auto_108400 ?auto_108404 ) ) ( not ( = ?auto_108401 ?auto_108404 ) ) ( not ( = ?auto_108402 ?auto_108404 ) ) ( ON ?auto_108401 ?auto_108402 ) ( ON-TABLE ?auto_108406 ) ( ON ?auto_108405 ?auto_108406 ) ( ON ?auto_108404 ?auto_108405 ) ( not ( = ?auto_108406 ?auto_108405 ) ) ( not ( = ?auto_108406 ?auto_108404 ) ) ( not ( = ?auto_108406 ?auto_108402 ) ) ( not ( = ?auto_108406 ?auto_108401 ) ) ( not ( = ?auto_108405 ?auto_108404 ) ) ( not ( = ?auto_108405 ?auto_108402 ) ) ( not ( = ?auto_108405 ?auto_108401 ) ) ( not ( = ?auto_108399 ?auto_108406 ) ) ( not ( = ?auto_108399 ?auto_108405 ) ) ( not ( = ?auto_108400 ?auto_108406 ) ) ( not ( = ?auto_108400 ?auto_108405 ) ) ( ON ?auto_108399 ?auto_108403 ) ( CLEAR ?auto_108399 ) ( not ( = ?auto_108399 ?auto_108403 ) ) ( not ( = ?auto_108400 ?auto_108403 ) ) ( not ( = ?auto_108401 ?auto_108403 ) ) ( not ( = ?auto_108402 ?auto_108403 ) ) ( not ( = ?auto_108404 ?auto_108403 ) ) ( not ( = ?auto_108406 ?auto_108403 ) ) ( not ( = ?auto_108405 ?auto_108403 ) ) ( HOLDING ?auto_108400 ) ( CLEAR ?auto_108401 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108406 ?auto_108405 ?auto_108404 ?auto_108402 ?auto_108401 ?auto_108400 )
      ( MAKE-4PILE ?auto_108399 ?auto_108400 ?auto_108401 ?auto_108402 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108407 - BLOCK
      ?auto_108408 - BLOCK
      ?auto_108409 - BLOCK
      ?auto_108410 - BLOCK
    )
    :vars
    (
      ?auto_108413 - BLOCK
      ?auto_108412 - BLOCK
      ?auto_108414 - BLOCK
      ?auto_108411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108407 ?auto_108408 ) ) ( not ( = ?auto_108407 ?auto_108409 ) ) ( not ( = ?auto_108407 ?auto_108410 ) ) ( not ( = ?auto_108408 ?auto_108409 ) ) ( not ( = ?auto_108408 ?auto_108410 ) ) ( not ( = ?auto_108409 ?auto_108410 ) ) ( ON ?auto_108410 ?auto_108413 ) ( not ( = ?auto_108407 ?auto_108413 ) ) ( not ( = ?auto_108408 ?auto_108413 ) ) ( not ( = ?auto_108409 ?auto_108413 ) ) ( not ( = ?auto_108410 ?auto_108413 ) ) ( ON ?auto_108409 ?auto_108410 ) ( ON-TABLE ?auto_108412 ) ( ON ?auto_108414 ?auto_108412 ) ( ON ?auto_108413 ?auto_108414 ) ( not ( = ?auto_108412 ?auto_108414 ) ) ( not ( = ?auto_108412 ?auto_108413 ) ) ( not ( = ?auto_108412 ?auto_108410 ) ) ( not ( = ?auto_108412 ?auto_108409 ) ) ( not ( = ?auto_108414 ?auto_108413 ) ) ( not ( = ?auto_108414 ?auto_108410 ) ) ( not ( = ?auto_108414 ?auto_108409 ) ) ( not ( = ?auto_108407 ?auto_108412 ) ) ( not ( = ?auto_108407 ?auto_108414 ) ) ( not ( = ?auto_108408 ?auto_108412 ) ) ( not ( = ?auto_108408 ?auto_108414 ) ) ( ON ?auto_108407 ?auto_108411 ) ( not ( = ?auto_108407 ?auto_108411 ) ) ( not ( = ?auto_108408 ?auto_108411 ) ) ( not ( = ?auto_108409 ?auto_108411 ) ) ( not ( = ?auto_108410 ?auto_108411 ) ) ( not ( = ?auto_108413 ?auto_108411 ) ) ( not ( = ?auto_108412 ?auto_108411 ) ) ( not ( = ?auto_108414 ?auto_108411 ) ) ( CLEAR ?auto_108409 ) ( ON ?auto_108408 ?auto_108407 ) ( CLEAR ?auto_108408 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108411 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108411 ?auto_108407 )
      ( MAKE-4PILE ?auto_108407 ?auto_108408 ?auto_108409 ?auto_108410 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108415 - BLOCK
      ?auto_108416 - BLOCK
      ?auto_108417 - BLOCK
      ?auto_108418 - BLOCK
    )
    :vars
    (
      ?auto_108421 - BLOCK
      ?auto_108419 - BLOCK
      ?auto_108422 - BLOCK
      ?auto_108420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108415 ?auto_108416 ) ) ( not ( = ?auto_108415 ?auto_108417 ) ) ( not ( = ?auto_108415 ?auto_108418 ) ) ( not ( = ?auto_108416 ?auto_108417 ) ) ( not ( = ?auto_108416 ?auto_108418 ) ) ( not ( = ?auto_108417 ?auto_108418 ) ) ( ON ?auto_108418 ?auto_108421 ) ( not ( = ?auto_108415 ?auto_108421 ) ) ( not ( = ?auto_108416 ?auto_108421 ) ) ( not ( = ?auto_108417 ?auto_108421 ) ) ( not ( = ?auto_108418 ?auto_108421 ) ) ( ON-TABLE ?auto_108419 ) ( ON ?auto_108422 ?auto_108419 ) ( ON ?auto_108421 ?auto_108422 ) ( not ( = ?auto_108419 ?auto_108422 ) ) ( not ( = ?auto_108419 ?auto_108421 ) ) ( not ( = ?auto_108419 ?auto_108418 ) ) ( not ( = ?auto_108419 ?auto_108417 ) ) ( not ( = ?auto_108422 ?auto_108421 ) ) ( not ( = ?auto_108422 ?auto_108418 ) ) ( not ( = ?auto_108422 ?auto_108417 ) ) ( not ( = ?auto_108415 ?auto_108419 ) ) ( not ( = ?auto_108415 ?auto_108422 ) ) ( not ( = ?auto_108416 ?auto_108419 ) ) ( not ( = ?auto_108416 ?auto_108422 ) ) ( ON ?auto_108415 ?auto_108420 ) ( not ( = ?auto_108415 ?auto_108420 ) ) ( not ( = ?auto_108416 ?auto_108420 ) ) ( not ( = ?auto_108417 ?auto_108420 ) ) ( not ( = ?auto_108418 ?auto_108420 ) ) ( not ( = ?auto_108421 ?auto_108420 ) ) ( not ( = ?auto_108419 ?auto_108420 ) ) ( not ( = ?auto_108422 ?auto_108420 ) ) ( ON ?auto_108416 ?auto_108415 ) ( CLEAR ?auto_108416 ) ( ON-TABLE ?auto_108420 ) ( HOLDING ?auto_108417 ) ( CLEAR ?auto_108418 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108419 ?auto_108422 ?auto_108421 ?auto_108418 ?auto_108417 )
      ( MAKE-4PILE ?auto_108415 ?auto_108416 ?auto_108417 ?auto_108418 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108423 - BLOCK
      ?auto_108424 - BLOCK
      ?auto_108425 - BLOCK
      ?auto_108426 - BLOCK
    )
    :vars
    (
      ?auto_108430 - BLOCK
      ?auto_108429 - BLOCK
      ?auto_108428 - BLOCK
      ?auto_108427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108423 ?auto_108424 ) ) ( not ( = ?auto_108423 ?auto_108425 ) ) ( not ( = ?auto_108423 ?auto_108426 ) ) ( not ( = ?auto_108424 ?auto_108425 ) ) ( not ( = ?auto_108424 ?auto_108426 ) ) ( not ( = ?auto_108425 ?auto_108426 ) ) ( ON ?auto_108426 ?auto_108430 ) ( not ( = ?auto_108423 ?auto_108430 ) ) ( not ( = ?auto_108424 ?auto_108430 ) ) ( not ( = ?auto_108425 ?auto_108430 ) ) ( not ( = ?auto_108426 ?auto_108430 ) ) ( ON-TABLE ?auto_108429 ) ( ON ?auto_108428 ?auto_108429 ) ( ON ?auto_108430 ?auto_108428 ) ( not ( = ?auto_108429 ?auto_108428 ) ) ( not ( = ?auto_108429 ?auto_108430 ) ) ( not ( = ?auto_108429 ?auto_108426 ) ) ( not ( = ?auto_108429 ?auto_108425 ) ) ( not ( = ?auto_108428 ?auto_108430 ) ) ( not ( = ?auto_108428 ?auto_108426 ) ) ( not ( = ?auto_108428 ?auto_108425 ) ) ( not ( = ?auto_108423 ?auto_108429 ) ) ( not ( = ?auto_108423 ?auto_108428 ) ) ( not ( = ?auto_108424 ?auto_108429 ) ) ( not ( = ?auto_108424 ?auto_108428 ) ) ( ON ?auto_108423 ?auto_108427 ) ( not ( = ?auto_108423 ?auto_108427 ) ) ( not ( = ?auto_108424 ?auto_108427 ) ) ( not ( = ?auto_108425 ?auto_108427 ) ) ( not ( = ?auto_108426 ?auto_108427 ) ) ( not ( = ?auto_108430 ?auto_108427 ) ) ( not ( = ?auto_108429 ?auto_108427 ) ) ( not ( = ?auto_108428 ?auto_108427 ) ) ( ON ?auto_108424 ?auto_108423 ) ( ON-TABLE ?auto_108427 ) ( CLEAR ?auto_108426 ) ( ON ?auto_108425 ?auto_108424 ) ( CLEAR ?auto_108425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108427 ?auto_108423 ?auto_108424 )
      ( MAKE-4PILE ?auto_108423 ?auto_108424 ?auto_108425 ?auto_108426 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108431 - BLOCK
      ?auto_108432 - BLOCK
      ?auto_108433 - BLOCK
      ?auto_108434 - BLOCK
    )
    :vars
    (
      ?auto_108435 - BLOCK
      ?auto_108438 - BLOCK
      ?auto_108436 - BLOCK
      ?auto_108437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108431 ?auto_108432 ) ) ( not ( = ?auto_108431 ?auto_108433 ) ) ( not ( = ?auto_108431 ?auto_108434 ) ) ( not ( = ?auto_108432 ?auto_108433 ) ) ( not ( = ?auto_108432 ?auto_108434 ) ) ( not ( = ?auto_108433 ?auto_108434 ) ) ( not ( = ?auto_108431 ?auto_108435 ) ) ( not ( = ?auto_108432 ?auto_108435 ) ) ( not ( = ?auto_108433 ?auto_108435 ) ) ( not ( = ?auto_108434 ?auto_108435 ) ) ( ON-TABLE ?auto_108438 ) ( ON ?auto_108436 ?auto_108438 ) ( ON ?auto_108435 ?auto_108436 ) ( not ( = ?auto_108438 ?auto_108436 ) ) ( not ( = ?auto_108438 ?auto_108435 ) ) ( not ( = ?auto_108438 ?auto_108434 ) ) ( not ( = ?auto_108438 ?auto_108433 ) ) ( not ( = ?auto_108436 ?auto_108435 ) ) ( not ( = ?auto_108436 ?auto_108434 ) ) ( not ( = ?auto_108436 ?auto_108433 ) ) ( not ( = ?auto_108431 ?auto_108438 ) ) ( not ( = ?auto_108431 ?auto_108436 ) ) ( not ( = ?auto_108432 ?auto_108438 ) ) ( not ( = ?auto_108432 ?auto_108436 ) ) ( ON ?auto_108431 ?auto_108437 ) ( not ( = ?auto_108431 ?auto_108437 ) ) ( not ( = ?auto_108432 ?auto_108437 ) ) ( not ( = ?auto_108433 ?auto_108437 ) ) ( not ( = ?auto_108434 ?auto_108437 ) ) ( not ( = ?auto_108435 ?auto_108437 ) ) ( not ( = ?auto_108438 ?auto_108437 ) ) ( not ( = ?auto_108436 ?auto_108437 ) ) ( ON ?auto_108432 ?auto_108431 ) ( ON-TABLE ?auto_108437 ) ( ON ?auto_108433 ?auto_108432 ) ( CLEAR ?auto_108433 ) ( HOLDING ?auto_108434 ) ( CLEAR ?auto_108435 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108438 ?auto_108436 ?auto_108435 ?auto_108434 )
      ( MAKE-4PILE ?auto_108431 ?auto_108432 ?auto_108433 ?auto_108434 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108439 - BLOCK
      ?auto_108440 - BLOCK
      ?auto_108441 - BLOCK
      ?auto_108442 - BLOCK
    )
    :vars
    (
      ?auto_108443 - BLOCK
      ?auto_108445 - BLOCK
      ?auto_108444 - BLOCK
      ?auto_108446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108439 ?auto_108440 ) ) ( not ( = ?auto_108439 ?auto_108441 ) ) ( not ( = ?auto_108439 ?auto_108442 ) ) ( not ( = ?auto_108440 ?auto_108441 ) ) ( not ( = ?auto_108440 ?auto_108442 ) ) ( not ( = ?auto_108441 ?auto_108442 ) ) ( not ( = ?auto_108439 ?auto_108443 ) ) ( not ( = ?auto_108440 ?auto_108443 ) ) ( not ( = ?auto_108441 ?auto_108443 ) ) ( not ( = ?auto_108442 ?auto_108443 ) ) ( ON-TABLE ?auto_108445 ) ( ON ?auto_108444 ?auto_108445 ) ( ON ?auto_108443 ?auto_108444 ) ( not ( = ?auto_108445 ?auto_108444 ) ) ( not ( = ?auto_108445 ?auto_108443 ) ) ( not ( = ?auto_108445 ?auto_108442 ) ) ( not ( = ?auto_108445 ?auto_108441 ) ) ( not ( = ?auto_108444 ?auto_108443 ) ) ( not ( = ?auto_108444 ?auto_108442 ) ) ( not ( = ?auto_108444 ?auto_108441 ) ) ( not ( = ?auto_108439 ?auto_108445 ) ) ( not ( = ?auto_108439 ?auto_108444 ) ) ( not ( = ?auto_108440 ?auto_108445 ) ) ( not ( = ?auto_108440 ?auto_108444 ) ) ( ON ?auto_108439 ?auto_108446 ) ( not ( = ?auto_108439 ?auto_108446 ) ) ( not ( = ?auto_108440 ?auto_108446 ) ) ( not ( = ?auto_108441 ?auto_108446 ) ) ( not ( = ?auto_108442 ?auto_108446 ) ) ( not ( = ?auto_108443 ?auto_108446 ) ) ( not ( = ?auto_108445 ?auto_108446 ) ) ( not ( = ?auto_108444 ?auto_108446 ) ) ( ON ?auto_108440 ?auto_108439 ) ( ON-TABLE ?auto_108446 ) ( ON ?auto_108441 ?auto_108440 ) ( CLEAR ?auto_108443 ) ( ON ?auto_108442 ?auto_108441 ) ( CLEAR ?auto_108442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108446 ?auto_108439 ?auto_108440 ?auto_108441 )
      ( MAKE-4PILE ?auto_108439 ?auto_108440 ?auto_108441 ?auto_108442 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108447 - BLOCK
      ?auto_108448 - BLOCK
      ?auto_108449 - BLOCK
      ?auto_108450 - BLOCK
    )
    :vars
    (
      ?auto_108452 - BLOCK
      ?auto_108454 - BLOCK
      ?auto_108451 - BLOCK
      ?auto_108453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108447 ?auto_108448 ) ) ( not ( = ?auto_108447 ?auto_108449 ) ) ( not ( = ?auto_108447 ?auto_108450 ) ) ( not ( = ?auto_108448 ?auto_108449 ) ) ( not ( = ?auto_108448 ?auto_108450 ) ) ( not ( = ?auto_108449 ?auto_108450 ) ) ( not ( = ?auto_108447 ?auto_108452 ) ) ( not ( = ?auto_108448 ?auto_108452 ) ) ( not ( = ?auto_108449 ?auto_108452 ) ) ( not ( = ?auto_108450 ?auto_108452 ) ) ( ON-TABLE ?auto_108454 ) ( ON ?auto_108451 ?auto_108454 ) ( not ( = ?auto_108454 ?auto_108451 ) ) ( not ( = ?auto_108454 ?auto_108452 ) ) ( not ( = ?auto_108454 ?auto_108450 ) ) ( not ( = ?auto_108454 ?auto_108449 ) ) ( not ( = ?auto_108451 ?auto_108452 ) ) ( not ( = ?auto_108451 ?auto_108450 ) ) ( not ( = ?auto_108451 ?auto_108449 ) ) ( not ( = ?auto_108447 ?auto_108454 ) ) ( not ( = ?auto_108447 ?auto_108451 ) ) ( not ( = ?auto_108448 ?auto_108454 ) ) ( not ( = ?auto_108448 ?auto_108451 ) ) ( ON ?auto_108447 ?auto_108453 ) ( not ( = ?auto_108447 ?auto_108453 ) ) ( not ( = ?auto_108448 ?auto_108453 ) ) ( not ( = ?auto_108449 ?auto_108453 ) ) ( not ( = ?auto_108450 ?auto_108453 ) ) ( not ( = ?auto_108452 ?auto_108453 ) ) ( not ( = ?auto_108454 ?auto_108453 ) ) ( not ( = ?auto_108451 ?auto_108453 ) ) ( ON ?auto_108448 ?auto_108447 ) ( ON-TABLE ?auto_108453 ) ( ON ?auto_108449 ?auto_108448 ) ( ON ?auto_108450 ?auto_108449 ) ( CLEAR ?auto_108450 ) ( HOLDING ?auto_108452 ) ( CLEAR ?auto_108451 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108454 ?auto_108451 ?auto_108452 )
      ( MAKE-4PILE ?auto_108447 ?auto_108448 ?auto_108449 ?auto_108450 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108455 - BLOCK
      ?auto_108456 - BLOCK
      ?auto_108457 - BLOCK
      ?auto_108458 - BLOCK
    )
    :vars
    (
      ?auto_108461 - BLOCK
      ?auto_108460 - BLOCK
      ?auto_108459 - BLOCK
      ?auto_108462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108455 ?auto_108456 ) ) ( not ( = ?auto_108455 ?auto_108457 ) ) ( not ( = ?auto_108455 ?auto_108458 ) ) ( not ( = ?auto_108456 ?auto_108457 ) ) ( not ( = ?auto_108456 ?auto_108458 ) ) ( not ( = ?auto_108457 ?auto_108458 ) ) ( not ( = ?auto_108455 ?auto_108461 ) ) ( not ( = ?auto_108456 ?auto_108461 ) ) ( not ( = ?auto_108457 ?auto_108461 ) ) ( not ( = ?auto_108458 ?auto_108461 ) ) ( ON-TABLE ?auto_108460 ) ( ON ?auto_108459 ?auto_108460 ) ( not ( = ?auto_108460 ?auto_108459 ) ) ( not ( = ?auto_108460 ?auto_108461 ) ) ( not ( = ?auto_108460 ?auto_108458 ) ) ( not ( = ?auto_108460 ?auto_108457 ) ) ( not ( = ?auto_108459 ?auto_108461 ) ) ( not ( = ?auto_108459 ?auto_108458 ) ) ( not ( = ?auto_108459 ?auto_108457 ) ) ( not ( = ?auto_108455 ?auto_108460 ) ) ( not ( = ?auto_108455 ?auto_108459 ) ) ( not ( = ?auto_108456 ?auto_108460 ) ) ( not ( = ?auto_108456 ?auto_108459 ) ) ( ON ?auto_108455 ?auto_108462 ) ( not ( = ?auto_108455 ?auto_108462 ) ) ( not ( = ?auto_108456 ?auto_108462 ) ) ( not ( = ?auto_108457 ?auto_108462 ) ) ( not ( = ?auto_108458 ?auto_108462 ) ) ( not ( = ?auto_108461 ?auto_108462 ) ) ( not ( = ?auto_108460 ?auto_108462 ) ) ( not ( = ?auto_108459 ?auto_108462 ) ) ( ON ?auto_108456 ?auto_108455 ) ( ON-TABLE ?auto_108462 ) ( ON ?auto_108457 ?auto_108456 ) ( ON ?auto_108458 ?auto_108457 ) ( CLEAR ?auto_108459 ) ( ON ?auto_108461 ?auto_108458 ) ( CLEAR ?auto_108461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108462 ?auto_108455 ?auto_108456 ?auto_108457 ?auto_108458 )
      ( MAKE-4PILE ?auto_108455 ?auto_108456 ?auto_108457 ?auto_108458 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108463 - BLOCK
      ?auto_108464 - BLOCK
      ?auto_108465 - BLOCK
      ?auto_108466 - BLOCK
    )
    :vars
    (
      ?auto_108470 - BLOCK
      ?auto_108469 - BLOCK
      ?auto_108468 - BLOCK
      ?auto_108467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108463 ?auto_108464 ) ) ( not ( = ?auto_108463 ?auto_108465 ) ) ( not ( = ?auto_108463 ?auto_108466 ) ) ( not ( = ?auto_108464 ?auto_108465 ) ) ( not ( = ?auto_108464 ?auto_108466 ) ) ( not ( = ?auto_108465 ?auto_108466 ) ) ( not ( = ?auto_108463 ?auto_108470 ) ) ( not ( = ?auto_108464 ?auto_108470 ) ) ( not ( = ?auto_108465 ?auto_108470 ) ) ( not ( = ?auto_108466 ?auto_108470 ) ) ( ON-TABLE ?auto_108469 ) ( not ( = ?auto_108469 ?auto_108468 ) ) ( not ( = ?auto_108469 ?auto_108470 ) ) ( not ( = ?auto_108469 ?auto_108466 ) ) ( not ( = ?auto_108469 ?auto_108465 ) ) ( not ( = ?auto_108468 ?auto_108470 ) ) ( not ( = ?auto_108468 ?auto_108466 ) ) ( not ( = ?auto_108468 ?auto_108465 ) ) ( not ( = ?auto_108463 ?auto_108469 ) ) ( not ( = ?auto_108463 ?auto_108468 ) ) ( not ( = ?auto_108464 ?auto_108469 ) ) ( not ( = ?auto_108464 ?auto_108468 ) ) ( ON ?auto_108463 ?auto_108467 ) ( not ( = ?auto_108463 ?auto_108467 ) ) ( not ( = ?auto_108464 ?auto_108467 ) ) ( not ( = ?auto_108465 ?auto_108467 ) ) ( not ( = ?auto_108466 ?auto_108467 ) ) ( not ( = ?auto_108470 ?auto_108467 ) ) ( not ( = ?auto_108469 ?auto_108467 ) ) ( not ( = ?auto_108468 ?auto_108467 ) ) ( ON ?auto_108464 ?auto_108463 ) ( ON-TABLE ?auto_108467 ) ( ON ?auto_108465 ?auto_108464 ) ( ON ?auto_108466 ?auto_108465 ) ( ON ?auto_108470 ?auto_108466 ) ( CLEAR ?auto_108470 ) ( HOLDING ?auto_108468 ) ( CLEAR ?auto_108469 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108469 ?auto_108468 )
      ( MAKE-4PILE ?auto_108463 ?auto_108464 ?auto_108465 ?auto_108466 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108471 - BLOCK
      ?auto_108472 - BLOCK
      ?auto_108473 - BLOCK
      ?auto_108474 - BLOCK
    )
    :vars
    (
      ?auto_108476 - BLOCK
      ?auto_108478 - BLOCK
      ?auto_108475 - BLOCK
      ?auto_108477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108471 ?auto_108472 ) ) ( not ( = ?auto_108471 ?auto_108473 ) ) ( not ( = ?auto_108471 ?auto_108474 ) ) ( not ( = ?auto_108472 ?auto_108473 ) ) ( not ( = ?auto_108472 ?auto_108474 ) ) ( not ( = ?auto_108473 ?auto_108474 ) ) ( not ( = ?auto_108471 ?auto_108476 ) ) ( not ( = ?auto_108472 ?auto_108476 ) ) ( not ( = ?auto_108473 ?auto_108476 ) ) ( not ( = ?auto_108474 ?auto_108476 ) ) ( ON-TABLE ?auto_108478 ) ( not ( = ?auto_108478 ?auto_108475 ) ) ( not ( = ?auto_108478 ?auto_108476 ) ) ( not ( = ?auto_108478 ?auto_108474 ) ) ( not ( = ?auto_108478 ?auto_108473 ) ) ( not ( = ?auto_108475 ?auto_108476 ) ) ( not ( = ?auto_108475 ?auto_108474 ) ) ( not ( = ?auto_108475 ?auto_108473 ) ) ( not ( = ?auto_108471 ?auto_108478 ) ) ( not ( = ?auto_108471 ?auto_108475 ) ) ( not ( = ?auto_108472 ?auto_108478 ) ) ( not ( = ?auto_108472 ?auto_108475 ) ) ( ON ?auto_108471 ?auto_108477 ) ( not ( = ?auto_108471 ?auto_108477 ) ) ( not ( = ?auto_108472 ?auto_108477 ) ) ( not ( = ?auto_108473 ?auto_108477 ) ) ( not ( = ?auto_108474 ?auto_108477 ) ) ( not ( = ?auto_108476 ?auto_108477 ) ) ( not ( = ?auto_108478 ?auto_108477 ) ) ( not ( = ?auto_108475 ?auto_108477 ) ) ( ON ?auto_108472 ?auto_108471 ) ( ON-TABLE ?auto_108477 ) ( ON ?auto_108473 ?auto_108472 ) ( ON ?auto_108474 ?auto_108473 ) ( ON ?auto_108476 ?auto_108474 ) ( CLEAR ?auto_108478 ) ( ON ?auto_108475 ?auto_108476 ) ( CLEAR ?auto_108475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108477 ?auto_108471 ?auto_108472 ?auto_108473 ?auto_108474 ?auto_108476 )
      ( MAKE-4PILE ?auto_108471 ?auto_108472 ?auto_108473 ?auto_108474 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108479 - BLOCK
      ?auto_108480 - BLOCK
      ?auto_108481 - BLOCK
      ?auto_108482 - BLOCK
    )
    :vars
    (
      ?auto_108485 - BLOCK
      ?auto_108486 - BLOCK
      ?auto_108483 - BLOCK
      ?auto_108484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108479 ?auto_108480 ) ) ( not ( = ?auto_108479 ?auto_108481 ) ) ( not ( = ?auto_108479 ?auto_108482 ) ) ( not ( = ?auto_108480 ?auto_108481 ) ) ( not ( = ?auto_108480 ?auto_108482 ) ) ( not ( = ?auto_108481 ?auto_108482 ) ) ( not ( = ?auto_108479 ?auto_108485 ) ) ( not ( = ?auto_108480 ?auto_108485 ) ) ( not ( = ?auto_108481 ?auto_108485 ) ) ( not ( = ?auto_108482 ?auto_108485 ) ) ( not ( = ?auto_108486 ?auto_108483 ) ) ( not ( = ?auto_108486 ?auto_108485 ) ) ( not ( = ?auto_108486 ?auto_108482 ) ) ( not ( = ?auto_108486 ?auto_108481 ) ) ( not ( = ?auto_108483 ?auto_108485 ) ) ( not ( = ?auto_108483 ?auto_108482 ) ) ( not ( = ?auto_108483 ?auto_108481 ) ) ( not ( = ?auto_108479 ?auto_108486 ) ) ( not ( = ?auto_108479 ?auto_108483 ) ) ( not ( = ?auto_108480 ?auto_108486 ) ) ( not ( = ?auto_108480 ?auto_108483 ) ) ( ON ?auto_108479 ?auto_108484 ) ( not ( = ?auto_108479 ?auto_108484 ) ) ( not ( = ?auto_108480 ?auto_108484 ) ) ( not ( = ?auto_108481 ?auto_108484 ) ) ( not ( = ?auto_108482 ?auto_108484 ) ) ( not ( = ?auto_108485 ?auto_108484 ) ) ( not ( = ?auto_108486 ?auto_108484 ) ) ( not ( = ?auto_108483 ?auto_108484 ) ) ( ON ?auto_108480 ?auto_108479 ) ( ON-TABLE ?auto_108484 ) ( ON ?auto_108481 ?auto_108480 ) ( ON ?auto_108482 ?auto_108481 ) ( ON ?auto_108485 ?auto_108482 ) ( ON ?auto_108483 ?auto_108485 ) ( CLEAR ?auto_108483 ) ( HOLDING ?auto_108486 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108486 )
      ( MAKE-4PILE ?auto_108479 ?auto_108480 ?auto_108481 ?auto_108482 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108487 - BLOCK
      ?auto_108488 - BLOCK
      ?auto_108489 - BLOCK
      ?auto_108490 - BLOCK
    )
    :vars
    (
      ?auto_108493 - BLOCK
      ?auto_108494 - BLOCK
      ?auto_108491 - BLOCK
      ?auto_108492 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108487 ?auto_108488 ) ) ( not ( = ?auto_108487 ?auto_108489 ) ) ( not ( = ?auto_108487 ?auto_108490 ) ) ( not ( = ?auto_108488 ?auto_108489 ) ) ( not ( = ?auto_108488 ?auto_108490 ) ) ( not ( = ?auto_108489 ?auto_108490 ) ) ( not ( = ?auto_108487 ?auto_108493 ) ) ( not ( = ?auto_108488 ?auto_108493 ) ) ( not ( = ?auto_108489 ?auto_108493 ) ) ( not ( = ?auto_108490 ?auto_108493 ) ) ( not ( = ?auto_108494 ?auto_108491 ) ) ( not ( = ?auto_108494 ?auto_108493 ) ) ( not ( = ?auto_108494 ?auto_108490 ) ) ( not ( = ?auto_108494 ?auto_108489 ) ) ( not ( = ?auto_108491 ?auto_108493 ) ) ( not ( = ?auto_108491 ?auto_108490 ) ) ( not ( = ?auto_108491 ?auto_108489 ) ) ( not ( = ?auto_108487 ?auto_108494 ) ) ( not ( = ?auto_108487 ?auto_108491 ) ) ( not ( = ?auto_108488 ?auto_108494 ) ) ( not ( = ?auto_108488 ?auto_108491 ) ) ( ON ?auto_108487 ?auto_108492 ) ( not ( = ?auto_108487 ?auto_108492 ) ) ( not ( = ?auto_108488 ?auto_108492 ) ) ( not ( = ?auto_108489 ?auto_108492 ) ) ( not ( = ?auto_108490 ?auto_108492 ) ) ( not ( = ?auto_108493 ?auto_108492 ) ) ( not ( = ?auto_108494 ?auto_108492 ) ) ( not ( = ?auto_108491 ?auto_108492 ) ) ( ON ?auto_108488 ?auto_108487 ) ( ON-TABLE ?auto_108492 ) ( ON ?auto_108489 ?auto_108488 ) ( ON ?auto_108490 ?auto_108489 ) ( ON ?auto_108493 ?auto_108490 ) ( ON ?auto_108491 ?auto_108493 ) ( ON ?auto_108494 ?auto_108491 ) ( CLEAR ?auto_108494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108492 ?auto_108487 ?auto_108488 ?auto_108489 ?auto_108490 ?auto_108493 ?auto_108491 )
      ( MAKE-4PILE ?auto_108487 ?auto_108488 ?auto_108489 ?auto_108490 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108510 - BLOCK
      ?auto_108511 - BLOCK
    )
    :vars
    (
      ?auto_108512 - BLOCK
      ?auto_108513 - BLOCK
      ?auto_108514 - BLOCK
      ?auto_108515 - BLOCK
      ?auto_108516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108512 ?auto_108511 ) ( ON-TABLE ?auto_108510 ) ( ON ?auto_108511 ?auto_108510 ) ( not ( = ?auto_108510 ?auto_108511 ) ) ( not ( = ?auto_108510 ?auto_108512 ) ) ( not ( = ?auto_108511 ?auto_108512 ) ) ( not ( = ?auto_108510 ?auto_108513 ) ) ( not ( = ?auto_108510 ?auto_108514 ) ) ( not ( = ?auto_108511 ?auto_108513 ) ) ( not ( = ?auto_108511 ?auto_108514 ) ) ( not ( = ?auto_108512 ?auto_108513 ) ) ( not ( = ?auto_108512 ?auto_108514 ) ) ( not ( = ?auto_108513 ?auto_108514 ) ) ( ON ?auto_108513 ?auto_108512 ) ( CLEAR ?auto_108513 ) ( HOLDING ?auto_108514 ) ( CLEAR ?auto_108515 ) ( ON-TABLE ?auto_108516 ) ( ON ?auto_108515 ?auto_108516 ) ( not ( = ?auto_108516 ?auto_108515 ) ) ( not ( = ?auto_108516 ?auto_108514 ) ) ( not ( = ?auto_108515 ?auto_108514 ) ) ( not ( = ?auto_108510 ?auto_108515 ) ) ( not ( = ?auto_108510 ?auto_108516 ) ) ( not ( = ?auto_108511 ?auto_108515 ) ) ( not ( = ?auto_108511 ?auto_108516 ) ) ( not ( = ?auto_108512 ?auto_108515 ) ) ( not ( = ?auto_108512 ?auto_108516 ) ) ( not ( = ?auto_108513 ?auto_108515 ) ) ( not ( = ?auto_108513 ?auto_108516 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108516 ?auto_108515 ?auto_108514 )
      ( MAKE-2PILE ?auto_108510 ?auto_108511 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108517 - BLOCK
      ?auto_108518 - BLOCK
    )
    :vars
    (
      ?auto_108521 - BLOCK
      ?auto_108522 - BLOCK
      ?auto_108523 - BLOCK
      ?auto_108520 - BLOCK
      ?auto_108519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108521 ?auto_108518 ) ( ON-TABLE ?auto_108517 ) ( ON ?auto_108518 ?auto_108517 ) ( not ( = ?auto_108517 ?auto_108518 ) ) ( not ( = ?auto_108517 ?auto_108521 ) ) ( not ( = ?auto_108518 ?auto_108521 ) ) ( not ( = ?auto_108517 ?auto_108522 ) ) ( not ( = ?auto_108517 ?auto_108523 ) ) ( not ( = ?auto_108518 ?auto_108522 ) ) ( not ( = ?auto_108518 ?auto_108523 ) ) ( not ( = ?auto_108521 ?auto_108522 ) ) ( not ( = ?auto_108521 ?auto_108523 ) ) ( not ( = ?auto_108522 ?auto_108523 ) ) ( ON ?auto_108522 ?auto_108521 ) ( CLEAR ?auto_108520 ) ( ON-TABLE ?auto_108519 ) ( ON ?auto_108520 ?auto_108519 ) ( not ( = ?auto_108519 ?auto_108520 ) ) ( not ( = ?auto_108519 ?auto_108523 ) ) ( not ( = ?auto_108520 ?auto_108523 ) ) ( not ( = ?auto_108517 ?auto_108520 ) ) ( not ( = ?auto_108517 ?auto_108519 ) ) ( not ( = ?auto_108518 ?auto_108520 ) ) ( not ( = ?auto_108518 ?auto_108519 ) ) ( not ( = ?auto_108521 ?auto_108520 ) ) ( not ( = ?auto_108521 ?auto_108519 ) ) ( not ( = ?auto_108522 ?auto_108520 ) ) ( not ( = ?auto_108522 ?auto_108519 ) ) ( ON ?auto_108523 ?auto_108522 ) ( CLEAR ?auto_108523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108517 ?auto_108518 ?auto_108521 ?auto_108522 )
      ( MAKE-2PILE ?auto_108517 ?auto_108518 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108524 - BLOCK
      ?auto_108525 - BLOCK
    )
    :vars
    (
      ?auto_108529 - BLOCK
      ?auto_108528 - BLOCK
      ?auto_108530 - BLOCK
      ?auto_108527 - BLOCK
      ?auto_108526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108529 ?auto_108525 ) ( ON-TABLE ?auto_108524 ) ( ON ?auto_108525 ?auto_108524 ) ( not ( = ?auto_108524 ?auto_108525 ) ) ( not ( = ?auto_108524 ?auto_108529 ) ) ( not ( = ?auto_108525 ?auto_108529 ) ) ( not ( = ?auto_108524 ?auto_108528 ) ) ( not ( = ?auto_108524 ?auto_108530 ) ) ( not ( = ?auto_108525 ?auto_108528 ) ) ( not ( = ?auto_108525 ?auto_108530 ) ) ( not ( = ?auto_108529 ?auto_108528 ) ) ( not ( = ?auto_108529 ?auto_108530 ) ) ( not ( = ?auto_108528 ?auto_108530 ) ) ( ON ?auto_108528 ?auto_108529 ) ( ON-TABLE ?auto_108527 ) ( not ( = ?auto_108527 ?auto_108526 ) ) ( not ( = ?auto_108527 ?auto_108530 ) ) ( not ( = ?auto_108526 ?auto_108530 ) ) ( not ( = ?auto_108524 ?auto_108526 ) ) ( not ( = ?auto_108524 ?auto_108527 ) ) ( not ( = ?auto_108525 ?auto_108526 ) ) ( not ( = ?auto_108525 ?auto_108527 ) ) ( not ( = ?auto_108529 ?auto_108526 ) ) ( not ( = ?auto_108529 ?auto_108527 ) ) ( not ( = ?auto_108528 ?auto_108526 ) ) ( not ( = ?auto_108528 ?auto_108527 ) ) ( ON ?auto_108530 ?auto_108528 ) ( CLEAR ?auto_108530 ) ( HOLDING ?auto_108526 ) ( CLEAR ?auto_108527 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108527 ?auto_108526 )
      ( MAKE-2PILE ?auto_108524 ?auto_108525 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108531 - BLOCK
      ?auto_108532 - BLOCK
    )
    :vars
    (
      ?auto_108535 - BLOCK
      ?auto_108537 - BLOCK
      ?auto_108536 - BLOCK
      ?auto_108534 - BLOCK
      ?auto_108533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108535 ?auto_108532 ) ( ON-TABLE ?auto_108531 ) ( ON ?auto_108532 ?auto_108531 ) ( not ( = ?auto_108531 ?auto_108532 ) ) ( not ( = ?auto_108531 ?auto_108535 ) ) ( not ( = ?auto_108532 ?auto_108535 ) ) ( not ( = ?auto_108531 ?auto_108537 ) ) ( not ( = ?auto_108531 ?auto_108536 ) ) ( not ( = ?auto_108532 ?auto_108537 ) ) ( not ( = ?auto_108532 ?auto_108536 ) ) ( not ( = ?auto_108535 ?auto_108537 ) ) ( not ( = ?auto_108535 ?auto_108536 ) ) ( not ( = ?auto_108537 ?auto_108536 ) ) ( ON ?auto_108537 ?auto_108535 ) ( ON-TABLE ?auto_108534 ) ( not ( = ?auto_108534 ?auto_108533 ) ) ( not ( = ?auto_108534 ?auto_108536 ) ) ( not ( = ?auto_108533 ?auto_108536 ) ) ( not ( = ?auto_108531 ?auto_108533 ) ) ( not ( = ?auto_108531 ?auto_108534 ) ) ( not ( = ?auto_108532 ?auto_108533 ) ) ( not ( = ?auto_108532 ?auto_108534 ) ) ( not ( = ?auto_108535 ?auto_108533 ) ) ( not ( = ?auto_108535 ?auto_108534 ) ) ( not ( = ?auto_108537 ?auto_108533 ) ) ( not ( = ?auto_108537 ?auto_108534 ) ) ( ON ?auto_108536 ?auto_108537 ) ( CLEAR ?auto_108534 ) ( ON ?auto_108533 ?auto_108536 ) ( CLEAR ?auto_108533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108531 ?auto_108532 ?auto_108535 ?auto_108537 ?auto_108536 )
      ( MAKE-2PILE ?auto_108531 ?auto_108532 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108538 - BLOCK
      ?auto_108539 - BLOCK
    )
    :vars
    (
      ?auto_108540 - BLOCK
      ?auto_108541 - BLOCK
      ?auto_108544 - BLOCK
      ?auto_108543 - BLOCK
      ?auto_108542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108540 ?auto_108539 ) ( ON-TABLE ?auto_108538 ) ( ON ?auto_108539 ?auto_108538 ) ( not ( = ?auto_108538 ?auto_108539 ) ) ( not ( = ?auto_108538 ?auto_108540 ) ) ( not ( = ?auto_108539 ?auto_108540 ) ) ( not ( = ?auto_108538 ?auto_108541 ) ) ( not ( = ?auto_108538 ?auto_108544 ) ) ( not ( = ?auto_108539 ?auto_108541 ) ) ( not ( = ?auto_108539 ?auto_108544 ) ) ( not ( = ?auto_108540 ?auto_108541 ) ) ( not ( = ?auto_108540 ?auto_108544 ) ) ( not ( = ?auto_108541 ?auto_108544 ) ) ( ON ?auto_108541 ?auto_108540 ) ( not ( = ?auto_108543 ?auto_108542 ) ) ( not ( = ?auto_108543 ?auto_108544 ) ) ( not ( = ?auto_108542 ?auto_108544 ) ) ( not ( = ?auto_108538 ?auto_108542 ) ) ( not ( = ?auto_108538 ?auto_108543 ) ) ( not ( = ?auto_108539 ?auto_108542 ) ) ( not ( = ?auto_108539 ?auto_108543 ) ) ( not ( = ?auto_108540 ?auto_108542 ) ) ( not ( = ?auto_108540 ?auto_108543 ) ) ( not ( = ?auto_108541 ?auto_108542 ) ) ( not ( = ?auto_108541 ?auto_108543 ) ) ( ON ?auto_108544 ?auto_108541 ) ( ON ?auto_108542 ?auto_108544 ) ( CLEAR ?auto_108542 ) ( HOLDING ?auto_108543 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108543 )
      ( MAKE-2PILE ?auto_108538 ?auto_108539 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108554 - BLOCK
      ?auto_108555 - BLOCK
    )
    :vars
    (
      ?auto_108560 - BLOCK
      ?auto_108558 - BLOCK
      ?auto_108557 - BLOCK
      ?auto_108556 - BLOCK
      ?auto_108559 - BLOCK
      ?auto_108561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108560 ?auto_108555 ) ( ON-TABLE ?auto_108554 ) ( ON ?auto_108555 ?auto_108554 ) ( not ( = ?auto_108554 ?auto_108555 ) ) ( not ( = ?auto_108554 ?auto_108560 ) ) ( not ( = ?auto_108555 ?auto_108560 ) ) ( not ( = ?auto_108554 ?auto_108558 ) ) ( not ( = ?auto_108554 ?auto_108557 ) ) ( not ( = ?auto_108555 ?auto_108558 ) ) ( not ( = ?auto_108555 ?auto_108557 ) ) ( not ( = ?auto_108560 ?auto_108558 ) ) ( not ( = ?auto_108560 ?auto_108557 ) ) ( not ( = ?auto_108558 ?auto_108557 ) ) ( ON ?auto_108558 ?auto_108560 ) ( not ( = ?auto_108556 ?auto_108559 ) ) ( not ( = ?auto_108556 ?auto_108557 ) ) ( not ( = ?auto_108559 ?auto_108557 ) ) ( not ( = ?auto_108554 ?auto_108559 ) ) ( not ( = ?auto_108554 ?auto_108556 ) ) ( not ( = ?auto_108555 ?auto_108559 ) ) ( not ( = ?auto_108555 ?auto_108556 ) ) ( not ( = ?auto_108560 ?auto_108559 ) ) ( not ( = ?auto_108560 ?auto_108556 ) ) ( not ( = ?auto_108558 ?auto_108559 ) ) ( not ( = ?auto_108558 ?auto_108556 ) ) ( ON ?auto_108557 ?auto_108558 ) ( ON ?auto_108559 ?auto_108557 ) ( CLEAR ?auto_108559 ) ( ON ?auto_108556 ?auto_108561 ) ( CLEAR ?auto_108556 ) ( HAND-EMPTY ) ( not ( = ?auto_108554 ?auto_108561 ) ) ( not ( = ?auto_108555 ?auto_108561 ) ) ( not ( = ?auto_108560 ?auto_108561 ) ) ( not ( = ?auto_108558 ?auto_108561 ) ) ( not ( = ?auto_108557 ?auto_108561 ) ) ( not ( = ?auto_108556 ?auto_108561 ) ) ( not ( = ?auto_108559 ?auto_108561 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108556 ?auto_108561 )
      ( MAKE-2PILE ?auto_108554 ?auto_108555 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108562 - BLOCK
      ?auto_108563 - BLOCK
    )
    :vars
    (
      ?auto_108564 - BLOCK
      ?auto_108569 - BLOCK
      ?auto_108566 - BLOCK
      ?auto_108567 - BLOCK
      ?auto_108565 - BLOCK
      ?auto_108568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108564 ?auto_108563 ) ( ON-TABLE ?auto_108562 ) ( ON ?auto_108563 ?auto_108562 ) ( not ( = ?auto_108562 ?auto_108563 ) ) ( not ( = ?auto_108562 ?auto_108564 ) ) ( not ( = ?auto_108563 ?auto_108564 ) ) ( not ( = ?auto_108562 ?auto_108569 ) ) ( not ( = ?auto_108562 ?auto_108566 ) ) ( not ( = ?auto_108563 ?auto_108569 ) ) ( not ( = ?auto_108563 ?auto_108566 ) ) ( not ( = ?auto_108564 ?auto_108569 ) ) ( not ( = ?auto_108564 ?auto_108566 ) ) ( not ( = ?auto_108569 ?auto_108566 ) ) ( ON ?auto_108569 ?auto_108564 ) ( not ( = ?auto_108567 ?auto_108565 ) ) ( not ( = ?auto_108567 ?auto_108566 ) ) ( not ( = ?auto_108565 ?auto_108566 ) ) ( not ( = ?auto_108562 ?auto_108565 ) ) ( not ( = ?auto_108562 ?auto_108567 ) ) ( not ( = ?auto_108563 ?auto_108565 ) ) ( not ( = ?auto_108563 ?auto_108567 ) ) ( not ( = ?auto_108564 ?auto_108565 ) ) ( not ( = ?auto_108564 ?auto_108567 ) ) ( not ( = ?auto_108569 ?auto_108565 ) ) ( not ( = ?auto_108569 ?auto_108567 ) ) ( ON ?auto_108566 ?auto_108569 ) ( ON ?auto_108567 ?auto_108568 ) ( CLEAR ?auto_108567 ) ( not ( = ?auto_108562 ?auto_108568 ) ) ( not ( = ?auto_108563 ?auto_108568 ) ) ( not ( = ?auto_108564 ?auto_108568 ) ) ( not ( = ?auto_108569 ?auto_108568 ) ) ( not ( = ?auto_108566 ?auto_108568 ) ) ( not ( = ?auto_108567 ?auto_108568 ) ) ( not ( = ?auto_108565 ?auto_108568 ) ) ( HOLDING ?auto_108565 ) ( CLEAR ?auto_108566 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108562 ?auto_108563 ?auto_108564 ?auto_108569 ?auto_108566 ?auto_108565 )
      ( MAKE-2PILE ?auto_108562 ?auto_108563 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108570 - BLOCK
      ?auto_108571 - BLOCK
    )
    :vars
    (
      ?auto_108575 - BLOCK
      ?auto_108576 - BLOCK
      ?auto_108572 - BLOCK
      ?auto_108577 - BLOCK
      ?auto_108574 - BLOCK
      ?auto_108573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108575 ?auto_108571 ) ( ON-TABLE ?auto_108570 ) ( ON ?auto_108571 ?auto_108570 ) ( not ( = ?auto_108570 ?auto_108571 ) ) ( not ( = ?auto_108570 ?auto_108575 ) ) ( not ( = ?auto_108571 ?auto_108575 ) ) ( not ( = ?auto_108570 ?auto_108576 ) ) ( not ( = ?auto_108570 ?auto_108572 ) ) ( not ( = ?auto_108571 ?auto_108576 ) ) ( not ( = ?auto_108571 ?auto_108572 ) ) ( not ( = ?auto_108575 ?auto_108576 ) ) ( not ( = ?auto_108575 ?auto_108572 ) ) ( not ( = ?auto_108576 ?auto_108572 ) ) ( ON ?auto_108576 ?auto_108575 ) ( not ( = ?auto_108577 ?auto_108574 ) ) ( not ( = ?auto_108577 ?auto_108572 ) ) ( not ( = ?auto_108574 ?auto_108572 ) ) ( not ( = ?auto_108570 ?auto_108574 ) ) ( not ( = ?auto_108570 ?auto_108577 ) ) ( not ( = ?auto_108571 ?auto_108574 ) ) ( not ( = ?auto_108571 ?auto_108577 ) ) ( not ( = ?auto_108575 ?auto_108574 ) ) ( not ( = ?auto_108575 ?auto_108577 ) ) ( not ( = ?auto_108576 ?auto_108574 ) ) ( not ( = ?auto_108576 ?auto_108577 ) ) ( ON ?auto_108572 ?auto_108576 ) ( ON ?auto_108577 ?auto_108573 ) ( not ( = ?auto_108570 ?auto_108573 ) ) ( not ( = ?auto_108571 ?auto_108573 ) ) ( not ( = ?auto_108575 ?auto_108573 ) ) ( not ( = ?auto_108576 ?auto_108573 ) ) ( not ( = ?auto_108572 ?auto_108573 ) ) ( not ( = ?auto_108577 ?auto_108573 ) ) ( not ( = ?auto_108574 ?auto_108573 ) ) ( CLEAR ?auto_108572 ) ( ON ?auto_108574 ?auto_108577 ) ( CLEAR ?auto_108574 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108573 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108573 ?auto_108577 )
      ( MAKE-2PILE ?auto_108570 ?auto_108571 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108578 - BLOCK
      ?auto_108579 - BLOCK
    )
    :vars
    (
      ?auto_108581 - BLOCK
      ?auto_108582 - BLOCK
      ?auto_108583 - BLOCK
      ?auto_108580 - BLOCK
      ?auto_108584 - BLOCK
      ?auto_108585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108581 ?auto_108579 ) ( ON-TABLE ?auto_108578 ) ( ON ?auto_108579 ?auto_108578 ) ( not ( = ?auto_108578 ?auto_108579 ) ) ( not ( = ?auto_108578 ?auto_108581 ) ) ( not ( = ?auto_108579 ?auto_108581 ) ) ( not ( = ?auto_108578 ?auto_108582 ) ) ( not ( = ?auto_108578 ?auto_108583 ) ) ( not ( = ?auto_108579 ?auto_108582 ) ) ( not ( = ?auto_108579 ?auto_108583 ) ) ( not ( = ?auto_108581 ?auto_108582 ) ) ( not ( = ?auto_108581 ?auto_108583 ) ) ( not ( = ?auto_108582 ?auto_108583 ) ) ( ON ?auto_108582 ?auto_108581 ) ( not ( = ?auto_108580 ?auto_108584 ) ) ( not ( = ?auto_108580 ?auto_108583 ) ) ( not ( = ?auto_108584 ?auto_108583 ) ) ( not ( = ?auto_108578 ?auto_108584 ) ) ( not ( = ?auto_108578 ?auto_108580 ) ) ( not ( = ?auto_108579 ?auto_108584 ) ) ( not ( = ?auto_108579 ?auto_108580 ) ) ( not ( = ?auto_108581 ?auto_108584 ) ) ( not ( = ?auto_108581 ?auto_108580 ) ) ( not ( = ?auto_108582 ?auto_108584 ) ) ( not ( = ?auto_108582 ?auto_108580 ) ) ( ON ?auto_108580 ?auto_108585 ) ( not ( = ?auto_108578 ?auto_108585 ) ) ( not ( = ?auto_108579 ?auto_108585 ) ) ( not ( = ?auto_108581 ?auto_108585 ) ) ( not ( = ?auto_108582 ?auto_108585 ) ) ( not ( = ?auto_108583 ?auto_108585 ) ) ( not ( = ?auto_108580 ?auto_108585 ) ) ( not ( = ?auto_108584 ?auto_108585 ) ) ( ON ?auto_108584 ?auto_108580 ) ( CLEAR ?auto_108584 ) ( ON-TABLE ?auto_108585 ) ( HOLDING ?auto_108583 ) ( CLEAR ?auto_108582 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108578 ?auto_108579 ?auto_108581 ?auto_108582 ?auto_108583 )
      ( MAKE-2PILE ?auto_108578 ?auto_108579 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108629 - BLOCK
      ?auto_108630 - BLOCK
      ?auto_108631 - BLOCK
      ?auto_108632 - BLOCK
      ?auto_108633 - BLOCK
    )
    :vars
    (
      ?auto_108634 - BLOCK
      ?auto_108635 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108629 ) ( ON ?auto_108630 ?auto_108629 ) ( ON ?auto_108631 ?auto_108630 ) ( not ( = ?auto_108629 ?auto_108630 ) ) ( not ( = ?auto_108629 ?auto_108631 ) ) ( not ( = ?auto_108629 ?auto_108632 ) ) ( not ( = ?auto_108629 ?auto_108633 ) ) ( not ( = ?auto_108630 ?auto_108631 ) ) ( not ( = ?auto_108630 ?auto_108632 ) ) ( not ( = ?auto_108630 ?auto_108633 ) ) ( not ( = ?auto_108631 ?auto_108632 ) ) ( not ( = ?auto_108631 ?auto_108633 ) ) ( not ( = ?auto_108632 ?auto_108633 ) ) ( ON ?auto_108633 ?auto_108634 ) ( not ( = ?auto_108629 ?auto_108634 ) ) ( not ( = ?auto_108630 ?auto_108634 ) ) ( not ( = ?auto_108631 ?auto_108634 ) ) ( not ( = ?auto_108632 ?auto_108634 ) ) ( not ( = ?auto_108633 ?auto_108634 ) ) ( CLEAR ?auto_108631 ) ( ON ?auto_108632 ?auto_108633 ) ( CLEAR ?auto_108632 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108635 ) ( ON ?auto_108634 ?auto_108635 ) ( not ( = ?auto_108635 ?auto_108634 ) ) ( not ( = ?auto_108635 ?auto_108633 ) ) ( not ( = ?auto_108635 ?auto_108632 ) ) ( not ( = ?auto_108629 ?auto_108635 ) ) ( not ( = ?auto_108630 ?auto_108635 ) ) ( not ( = ?auto_108631 ?auto_108635 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108635 ?auto_108634 ?auto_108633 )
      ( MAKE-5PILE ?auto_108629 ?auto_108630 ?auto_108631 ?auto_108632 ?auto_108633 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108636 - BLOCK
      ?auto_108637 - BLOCK
      ?auto_108638 - BLOCK
      ?auto_108639 - BLOCK
      ?auto_108640 - BLOCK
    )
    :vars
    (
      ?auto_108642 - BLOCK
      ?auto_108641 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108636 ) ( ON ?auto_108637 ?auto_108636 ) ( not ( = ?auto_108636 ?auto_108637 ) ) ( not ( = ?auto_108636 ?auto_108638 ) ) ( not ( = ?auto_108636 ?auto_108639 ) ) ( not ( = ?auto_108636 ?auto_108640 ) ) ( not ( = ?auto_108637 ?auto_108638 ) ) ( not ( = ?auto_108637 ?auto_108639 ) ) ( not ( = ?auto_108637 ?auto_108640 ) ) ( not ( = ?auto_108638 ?auto_108639 ) ) ( not ( = ?auto_108638 ?auto_108640 ) ) ( not ( = ?auto_108639 ?auto_108640 ) ) ( ON ?auto_108640 ?auto_108642 ) ( not ( = ?auto_108636 ?auto_108642 ) ) ( not ( = ?auto_108637 ?auto_108642 ) ) ( not ( = ?auto_108638 ?auto_108642 ) ) ( not ( = ?auto_108639 ?auto_108642 ) ) ( not ( = ?auto_108640 ?auto_108642 ) ) ( ON ?auto_108639 ?auto_108640 ) ( CLEAR ?auto_108639 ) ( ON-TABLE ?auto_108641 ) ( ON ?auto_108642 ?auto_108641 ) ( not ( = ?auto_108641 ?auto_108642 ) ) ( not ( = ?auto_108641 ?auto_108640 ) ) ( not ( = ?auto_108641 ?auto_108639 ) ) ( not ( = ?auto_108636 ?auto_108641 ) ) ( not ( = ?auto_108637 ?auto_108641 ) ) ( not ( = ?auto_108638 ?auto_108641 ) ) ( HOLDING ?auto_108638 ) ( CLEAR ?auto_108637 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108636 ?auto_108637 ?auto_108638 )
      ( MAKE-5PILE ?auto_108636 ?auto_108637 ?auto_108638 ?auto_108639 ?auto_108640 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108643 - BLOCK
      ?auto_108644 - BLOCK
      ?auto_108645 - BLOCK
      ?auto_108646 - BLOCK
      ?auto_108647 - BLOCK
    )
    :vars
    (
      ?auto_108648 - BLOCK
      ?auto_108649 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108643 ) ( ON ?auto_108644 ?auto_108643 ) ( not ( = ?auto_108643 ?auto_108644 ) ) ( not ( = ?auto_108643 ?auto_108645 ) ) ( not ( = ?auto_108643 ?auto_108646 ) ) ( not ( = ?auto_108643 ?auto_108647 ) ) ( not ( = ?auto_108644 ?auto_108645 ) ) ( not ( = ?auto_108644 ?auto_108646 ) ) ( not ( = ?auto_108644 ?auto_108647 ) ) ( not ( = ?auto_108645 ?auto_108646 ) ) ( not ( = ?auto_108645 ?auto_108647 ) ) ( not ( = ?auto_108646 ?auto_108647 ) ) ( ON ?auto_108647 ?auto_108648 ) ( not ( = ?auto_108643 ?auto_108648 ) ) ( not ( = ?auto_108644 ?auto_108648 ) ) ( not ( = ?auto_108645 ?auto_108648 ) ) ( not ( = ?auto_108646 ?auto_108648 ) ) ( not ( = ?auto_108647 ?auto_108648 ) ) ( ON ?auto_108646 ?auto_108647 ) ( ON-TABLE ?auto_108649 ) ( ON ?auto_108648 ?auto_108649 ) ( not ( = ?auto_108649 ?auto_108648 ) ) ( not ( = ?auto_108649 ?auto_108647 ) ) ( not ( = ?auto_108649 ?auto_108646 ) ) ( not ( = ?auto_108643 ?auto_108649 ) ) ( not ( = ?auto_108644 ?auto_108649 ) ) ( not ( = ?auto_108645 ?auto_108649 ) ) ( CLEAR ?auto_108644 ) ( ON ?auto_108645 ?auto_108646 ) ( CLEAR ?auto_108645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108649 ?auto_108648 ?auto_108647 ?auto_108646 )
      ( MAKE-5PILE ?auto_108643 ?auto_108644 ?auto_108645 ?auto_108646 ?auto_108647 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108650 - BLOCK
      ?auto_108651 - BLOCK
      ?auto_108652 - BLOCK
      ?auto_108653 - BLOCK
      ?auto_108654 - BLOCK
    )
    :vars
    (
      ?auto_108655 - BLOCK
      ?auto_108656 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108650 ) ( not ( = ?auto_108650 ?auto_108651 ) ) ( not ( = ?auto_108650 ?auto_108652 ) ) ( not ( = ?auto_108650 ?auto_108653 ) ) ( not ( = ?auto_108650 ?auto_108654 ) ) ( not ( = ?auto_108651 ?auto_108652 ) ) ( not ( = ?auto_108651 ?auto_108653 ) ) ( not ( = ?auto_108651 ?auto_108654 ) ) ( not ( = ?auto_108652 ?auto_108653 ) ) ( not ( = ?auto_108652 ?auto_108654 ) ) ( not ( = ?auto_108653 ?auto_108654 ) ) ( ON ?auto_108654 ?auto_108655 ) ( not ( = ?auto_108650 ?auto_108655 ) ) ( not ( = ?auto_108651 ?auto_108655 ) ) ( not ( = ?auto_108652 ?auto_108655 ) ) ( not ( = ?auto_108653 ?auto_108655 ) ) ( not ( = ?auto_108654 ?auto_108655 ) ) ( ON ?auto_108653 ?auto_108654 ) ( ON-TABLE ?auto_108656 ) ( ON ?auto_108655 ?auto_108656 ) ( not ( = ?auto_108656 ?auto_108655 ) ) ( not ( = ?auto_108656 ?auto_108654 ) ) ( not ( = ?auto_108656 ?auto_108653 ) ) ( not ( = ?auto_108650 ?auto_108656 ) ) ( not ( = ?auto_108651 ?auto_108656 ) ) ( not ( = ?auto_108652 ?auto_108656 ) ) ( ON ?auto_108652 ?auto_108653 ) ( CLEAR ?auto_108652 ) ( HOLDING ?auto_108651 ) ( CLEAR ?auto_108650 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108650 ?auto_108651 )
      ( MAKE-5PILE ?auto_108650 ?auto_108651 ?auto_108652 ?auto_108653 ?auto_108654 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108657 - BLOCK
      ?auto_108658 - BLOCK
      ?auto_108659 - BLOCK
      ?auto_108660 - BLOCK
      ?auto_108661 - BLOCK
    )
    :vars
    (
      ?auto_108662 - BLOCK
      ?auto_108663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108657 ) ( not ( = ?auto_108657 ?auto_108658 ) ) ( not ( = ?auto_108657 ?auto_108659 ) ) ( not ( = ?auto_108657 ?auto_108660 ) ) ( not ( = ?auto_108657 ?auto_108661 ) ) ( not ( = ?auto_108658 ?auto_108659 ) ) ( not ( = ?auto_108658 ?auto_108660 ) ) ( not ( = ?auto_108658 ?auto_108661 ) ) ( not ( = ?auto_108659 ?auto_108660 ) ) ( not ( = ?auto_108659 ?auto_108661 ) ) ( not ( = ?auto_108660 ?auto_108661 ) ) ( ON ?auto_108661 ?auto_108662 ) ( not ( = ?auto_108657 ?auto_108662 ) ) ( not ( = ?auto_108658 ?auto_108662 ) ) ( not ( = ?auto_108659 ?auto_108662 ) ) ( not ( = ?auto_108660 ?auto_108662 ) ) ( not ( = ?auto_108661 ?auto_108662 ) ) ( ON ?auto_108660 ?auto_108661 ) ( ON-TABLE ?auto_108663 ) ( ON ?auto_108662 ?auto_108663 ) ( not ( = ?auto_108663 ?auto_108662 ) ) ( not ( = ?auto_108663 ?auto_108661 ) ) ( not ( = ?auto_108663 ?auto_108660 ) ) ( not ( = ?auto_108657 ?auto_108663 ) ) ( not ( = ?auto_108658 ?auto_108663 ) ) ( not ( = ?auto_108659 ?auto_108663 ) ) ( ON ?auto_108659 ?auto_108660 ) ( CLEAR ?auto_108657 ) ( ON ?auto_108658 ?auto_108659 ) ( CLEAR ?auto_108658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108663 ?auto_108662 ?auto_108661 ?auto_108660 ?auto_108659 )
      ( MAKE-5PILE ?auto_108657 ?auto_108658 ?auto_108659 ?auto_108660 ?auto_108661 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108664 - BLOCK
      ?auto_108665 - BLOCK
      ?auto_108666 - BLOCK
      ?auto_108667 - BLOCK
      ?auto_108668 - BLOCK
    )
    :vars
    (
      ?auto_108670 - BLOCK
      ?auto_108669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108664 ?auto_108665 ) ) ( not ( = ?auto_108664 ?auto_108666 ) ) ( not ( = ?auto_108664 ?auto_108667 ) ) ( not ( = ?auto_108664 ?auto_108668 ) ) ( not ( = ?auto_108665 ?auto_108666 ) ) ( not ( = ?auto_108665 ?auto_108667 ) ) ( not ( = ?auto_108665 ?auto_108668 ) ) ( not ( = ?auto_108666 ?auto_108667 ) ) ( not ( = ?auto_108666 ?auto_108668 ) ) ( not ( = ?auto_108667 ?auto_108668 ) ) ( ON ?auto_108668 ?auto_108670 ) ( not ( = ?auto_108664 ?auto_108670 ) ) ( not ( = ?auto_108665 ?auto_108670 ) ) ( not ( = ?auto_108666 ?auto_108670 ) ) ( not ( = ?auto_108667 ?auto_108670 ) ) ( not ( = ?auto_108668 ?auto_108670 ) ) ( ON ?auto_108667 ?auto_108668 ) ( ON-TABLE ?auto_108669 ) ( ON ?auto_108670 ?auto_108669 ) ( not ( = ?auto_108669 ?auto_108670 ) ) ( not ( = ?auto_108669 ?auto_108668 ) ) ( not ( = ?auto_108669 ?auto_108667 ) ) ( not ( = ?auto_108664 ?auto_108669 ) ) ( not ( = ?auto_108665 ?auto_108669 ) ) ( not ( = ?auto_108666 ?auto_108669 ) ) ( ON ?auto_108666 ?auto_108667 ) ( ON ?auto_108665 ?auto_108666 ) ( CLEAR ?auto_108665 ) ( HOLDING ?auto_108664 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108664 )
      ( MAKE-5PILE ?auto_108664 ?auto_108665 ?auto_108666 ?auto_108667 ?auto_108668 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108671 - BLOCK
      ?auto_108672 - BLOCK
      ?auto_108673 - BLOCK
      ?auto_108674 - BLOCK
      ?auto_108675 - BLOCK
    )
    :vars
    (
      ?auto_108676 - BLOCK
      ?auto_108677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108671 ?auto_108672 ) ) ( not ( = ?auto_108671 ?auto_108673 ) ) ( not ( = ?auto_108671 ?auto_108674 ) ) ( not ( = ?auto_108671 ?auto_108675 ) ) ( not ( = ?auto_108672 ?auto_108673 ) ) ( not ( = ?auto_108672 ?auto_108674 ) ) ( not ( = ?auto_108672 ?auto_108675 ) ) ( not ( = ?auto_108673 ?auto_108674 ) ) ( not ( = ?auto_108673 ?auto_108675 ) ) ( not ( = ?auto_108674 ?auto_108675 ) ) ( ON ?auto_108675 ?auto_108676 ) ( not ( = ?auto_108671 ?auto_108676 ) ) ( not ( = ?auto_108672 ?auto_108676 ) ) ( not ( = ?auto_108673 ?auto_108676 ) ) ( not ( = ?auto_108674 ?auto_108676 ) ) ( not ( = ?auto_108675 ?auto_108676 ) ) ( ON ?auto_108674 ?auto_108675 ) ( ON-TABLE ?auto_108677 ) ( ON ?auto_108676 ?auto_108677 ) ( not ( = ?auto_108677 ?auto_108676 ) ) ( not ( = ?auto_108677 ?auto_108675 ) ) ( not ( = ?auto_108677 ?auto_108674 ) ) ( not ( = ?auto_108671 ?auto_108677 ) ) ( not ( = ?auto_108672 ?auto_108677 ) ) ( not ( = ?auto_108673 ?auto_108677 ) ) ( ON ?auto_108673 ?auto_108674 ) ( ON ?auto_108672 ?auto_108673 ) ( ON ?auto_108671 ?auto_108672 ) ( CLEAR ?auto_108671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108677 ?auto_108676 ?auto_108675 ?auto_108674 ?auto_108673 ?auto_108672 )
      ( MAKE-5PILE ?auto_108671 ?auto_108672 ?auto_108673 ?auto_108674 ?auto_108675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108683 - BLOCK
      ?auto_108684 - BLOCK
      ?auto_108685 - BLOCK
      ?auto_108686 - BLOCK
      ?auto_108687 - BLOCK
    )
    :vars
    (
      ?auto_108688 - BLOCK
      ?auto_108689 - BLOCK
      ?auto_108690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108683 ?auto_108684 ) ) ( not ( = ?auto_108683 ?auto_108685 ) ) ( not ( = ?auto_108683 ?auto_108686 ) ) ( not ( = ?auto_108683 ?auto_108687 ) ) ( not ( = ?auto_108684 ?auto_108685 ) ) ( not ( = ?auto_108684 ?auto_108686 ) ) ( not ( = ?auto_108684 ?auto_108687 ) ) ( not ( = ?auto_108685 ?auto_108686 ) ) ( not ( = ?auto_108685 ?auto_108687 ) ) ( not ( = ?auto_108686 ?auto_108687 ) ) ( ON ?auto_108687 ?auto_108688 ) ( not ( = ?auto_108683 ?auto_108688 ) ) ( not ( = ?auto_108684 ?auto_108688 ) ) ( not ( = ?auto_108685 ?auto_108688 ) ) ( not ( = ?auto_108686 ?auto_108688 ) ) ( not ( = ?auto_108687 ?auto_108688 ) ) ( ON ?auto_108686 ?auto_108687 ) ( ON-TABLE ?auto_108689 ) ( ON ?auto_108688 ?auto_108689 ) ( not ( = ?auto_108689 ?auto_108688 ) ) ( not ( = ?auto_108689 ?auto_108687 ) ) ( not ( = ?auto_108689 ?auto_108686 ) ) ( not ( = ?auto_108683 ?auto_108689 ) ) ( not ( = ?auto_108684 ?auto_108689 ) ) ( not ( = ?auto_108685 ?auto_108689 ) ) ( ON ?auto_108685 ?auto_108686 ) ( ON ?auto_108684 ?auto_108685 ) ( CLEAR ?auto_108684 ) ( ON ?auto_108683 ?auto_108690 ) ( CLEAR ?auto_108683 ) ( HAND-EMPTY ) ( not ( = ?auto_108683 ?auto_108690 ) ) ( not ( = ?auto_108684 ?auto_108690 ) ) ( not ( = ?auto_108685 ?auto_108690 ) ) ( not ( = ?auto_108686 ?auto_108690 ) ) ( not ( = ?auto_108687 ?auto_108690 ) ) ( not ( = ?auto_108688 ?auto_108690 ) ) ( not ( = ?auto_108689 ?auto_108690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108683 ?auto_108690 )
      ( MAKE-5PILE ?auto_108683 ?auto_108684 ?auto_108685 ?auto_108686 ?auto_108687 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108691 - BLOCK
      ?auto_108692 - BLOCK
      ?auto_108693 - BLOCK
      ?auto_108694 - BLOCK
      ?auto_108695 - BLOCK
    )
    :vars
    (
      ?auto_108698 - BLOCK
      ?auto_108697 - BLOCK
      ?auto_108696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108691 ?auto_108692 ) ) ( not ( = ?auto_108691 ?auto_108693 ) ) ( not ( = ?auto_108691 ?auto_108694 ) ) ( not ( = ?auto_108691 ?auto_108695 ) ) ( not ( = ?auto_108692 ?auto_108693 ) ) ( not ( = ?auto_108692 ?auto_108694 ) ) ( not ( = ?auto_108692 ?auto_108695 ) ) ( not ( = ?auto_108693 ?auto_108694 ) ) ( not ( = ?auto_108693 ?auto_108695 ) ) ( not ( = ?auto_108694 ?auto_108695 ) ) ( ON ?auto_108695 ?auto_108698 ) ( not ( = ?auto_108691 ?auto_108698 ) ) ( not ( = ?auto_108692 ?auto_108698 ) ) ( not ( = ?auto_108693 ?auto_108698 ) ) ( not ( = ?auto_108694 ?auto_108698 ) ) ( not ( = ?auto_108695 ?auto_108698 ) ) ( ON ?auto_108694 ?auto_108695 ) ( ON-TABLE ?auto_108697 ) ( ON ?auto_108698 ?auto_108697 ) ( not ( = ?auto_108697 ?auto_108698 ) ) ( not ( = ?auto_108697 ?auto_108695 ) ) ( not ( = ?auto_108697 ?auto_108694 ) ) ( not ( = ?auto_108691 ?auto_108697 ) ) ( not ( = ?auto_108692 ?auto_108697 ) ) ( not ( = ?auto_108693 ?auto_108697 ) ) ( ON ?auto_108693 ?auto_108694 ) ( ON ?auto_108691 ?auto_108696 ) ( CLEAR ?auto_108691 ) ( not ( = ?auto_108691 ?auto_108696 ) ) ( not ( = ?auto_108692 ?auto_108696 ) ) ( not ( = ?auto_108693 ?auto_108696 ) ) ( not ( = ?auto_108694 ?auto_108696 ) ) ( not ( = ?auto_108695 ?auto_108696 ) ) ( not ( = ?auto_108698 ?auto_108696 ) ) ( not ( = ?auto_108697 ?auto_108696 ) ) ( HOLDING ?auto_108692 ) ( CLEAR ?auto_108693 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108697 ?auto_108698 ?auto_108695 ?auto_108694 ?auto_108693 ?auto_108692 )
      ( MAKE-5PILE ?auto_108691 ?auto_108692 ?auto_108693 ?auto_108694 ?auto_108695 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108699 - BLOCK
      ?auto_108700 - BLOCK
      ?auto_108701 - BLOCK
      ?auto_108702 - BLOCK
      ?auto_108703 - BLOCK
    )
    :vars
    (
      ?auto_108706 - BLOCK
      ?auto_108704 - BLOCK
      ?auto_108705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108699 ?auto_108700 ) ) ( not ( = ?auto_108699 ?auto_108701 ) ) ( not ( = ?auto_108699 ?auto_108702 ) ) ( not ( = ?auto_108699 ?auto_108703 ) ) ( not ( = ?auto_108700 ?auto_108701 ) ) ( not ( = ?auto_108700 ?auto_108702 ) ) ( not ( = ?auto_108700 ?auto_108703 ) ) ( not ( = ?auto_108701 ?auto_108702 ) ) ( not ( = ?auto_108701 ?auto_108703 ) ) ( not ( = ?auto_108702 ?auto_108703 ) ) ( ON ?auto_108703 ?auto_108706 ) ( not ( = ?auto_108699 ?auto_108706 ) ) ( not ( = ?auto_108700 ?auto_108706 ) ) ( not ( = ?auto_108701 ?auto_108706 ) ) ( not ( = ?auto_108702 ?auto_108706 ) ) ( not ( = ?auto_108703 ?auto_108706 ) ) ( ON ?auto_108702 ?auto_108703 ) ( ON-TABLE ?auto_108704 ) ( ON ?auto_108706 ?auto_108704 ) ( not ( = ?auto_108704 ?auto_108706 ) ) ( not ( = ?auto_108704 ?auto_108703 ) ) ( not ( = ?auto_108704 ?auto_108702 ) ) ( not ( = ?auto_108699 ?auto_108704 ) ) ( not ( = ?auto_108700 ?auto_108704 ) ) ( not ( = ?auto_108701 ?auto_108704 ) ) ( ON ?auto_108701 ?auto_108702 ) ( ON ?auto_108699 ?auto_108705 ) ( not ( = ?auto_108699 ?auto_108705 ) ) ( not ( = ?auto_108700 ?auto_108705 ) ) ( not ( = ?auto_108701 ?auto_108705 ) ) ( not ( = ?auto_108702 ?auto_108705 ) ) ( not ( = ?auto_108703 ?auto_108705 ) ) ( not ( = ?auto_108706 ?auto_108705 ) ) ( not ( = ?auto_108704 ?auto_108705 ) ) ( CLEAR ?auto_108701 ) ( ON ?auto_108700 ?auto_108699 ) ( CLEAR ?auto_108700 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108705 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108705 ?auto_108699 )
      ( MAKE-5PILE ?auto_108699 ?auto_108700 ?auto_108701 ?auto_108702 ?auto_108703 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108707 - BLOCK
      ?auto_108708 - BLOCK
      ?auto_108709 - BLOCK
      ?auto_108710 - BLOCK
      ?auto_108711 - BLOCK
    )
    :vars
    (
      ?auto_108712 - BLOCK
      ?auto_108713 - BLOCK
      ?auto_108714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108707 ?auto_108708 ) ) ( not ( = ?auto_108707 ?auto_108709 ) ) ( not ( = ?auto_108707 ?auto_108710 ) ) ( not ( = ?auto_108707 ?auto_108711 ) ) ( not ( = ?auto_108708 ?auto_108709 ) ) ( not ( = ?auto_108708 ?auto_108710 ) ) ( not ( = ?auto_108708 ?auto_108711 ) ) ( not ( = ?auto_108709 ?auto_108710 ) ) ( not ( = ?auto_108709 ?auto_108711 ) ) ( not ( = ?auto_108710 ?auto_108711 ) ) ( ON ?auto_108711 ?auto_108712 ) ( not ( = ?auto_108707 ?auto_108712 ) ) ( not ( = ?auto_108708 ?auto_108712 ) ) ( not ( = ?auto_108709 ?auto_108712 ) ) ( not ( = ?auto_108710 ?auto_108712 ) ) ( not ( = ?auto_108711 ?auto_108712 ) ) ( ON ?auto_108710 ?auto_108711 ) ( ON-TABLE ?auto_108713 ) ( ON ?auto_108712 ?auto_108713 ) ( not ( = ?auto_108713 ?auto_108712 ) ) ( not ( = ?auto_108713 ?auto_108711 ) ) ( not ( = ?auto_108713 ?auto_108710 ) ) ( not ( = ?auto_108707 ?auto_108713 ) ) ( not ( = ?auto_108708 ?auto_108713 ) ) ( not ( = ?auto_108709 ?auto_108713 ) ) ( ON ?auto_108707 ?auto_108714 ) ( not ( = ?auto_108707 ?auto_108714 ) ) ( not ( = ?auto_108708 ?auto_108714 ) ) ( not ( = ?auto_108709 ?auto_108714 ) ) ( not ( = ?auto_108710 ?auto_108714 ) ) ( not ( = ?auto_108711 ?auto_108714 ) ) ( not ( = ?auto_108712 ?auto_108714 ) ) ( not ( = ?auto_108713 ?auto_108714 ) ) ( ON ?auto_108708 ?auto_108707 ) ( CLEAR ?auto_108708 ) ( ON-TABLE ?auto_108714 ) ( HOLDING ?auto_108709 ) ( CLEAR ?auto_108710 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108713 ?auto_108712 ?auto_108711 ?auto_108710 ?auto_108709 )
      ( MAKE-5PILE ?auto_108707 ?auto_108708 ?auto_108709 ?auto_108710 ?auto_108711 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108715 - BLOCK
      ?auto_108716 - BLOCK
      ?auto_108717 - BLOCK
      ?auto_108718 - BLOCK
      ?auto_108719 - BLOCK
    )
    :vars
    (
      ?auto_108720 - BLOCK
      ?auto_108722 - BLOCK
      ?auto_108721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108715 ?auto_108716 ) ) ( not ( = ?auto_108715 ?auto_108717 ) ) ( not ( = ?auto_108715 ?auto_108718 ) ) ( not ( = ?auto_108715 ?auto_108719 ) ) ( not ( = ?auto_108716 ?auto_108717 ) ) ( not ( = ?auto_108716 ?auto_108718 ) ) ( not ( = ?auto_108716 ?auto_108719 ) ) ( not ( = ?auto_108717 ?auto_108718 ) ) ( not ( = ?auto_108717 ?auto_108719 ) ) ( not ( = ?auto_108718 ?auto_108719 ) ) ( ON ?auto_108719 ?auto_108720 ) ( not ( = ?auto_108715 ?auto_108720 ) ) ( not ( = ?auto_108716 ?auto_108720 ) ) ( not ( = ?auto_108717 ?auto_108720 ) ) ( not ( = ?auto_108718 ?auto_108720 ) ) ( not ( = ?auto_108719 ?auto_108720 ) ) ( ON ?auto_108718 ?auto_108719 ) ( ON-TABLE ?auto_108722 ) ( ON ?auto_108720 ?auto_108722 ) ( not ( = ?auto_108722 ?auto_108720 ) ) ( not ( = ?auto_108722 ?auto_108719 ) ) ( not ( = ?auto_108722 ?auto_108718 ) ) ( not ( = ?auto_108715 ?auto_108722 ) ) ( not ( = ?auto_108716 ?auto_108722 ) ) ( not ( = ?auto_108717 ?auto_108722 ) ) ( ON ?auto_108715 ?auto_108721 ) ( not ( = ?auto_108715 ?auto_108721 ) ) ( not ( = ?auto_108716 ?auto_108721 ) ) ( not ( = ?auto_108717 ?auto_108721 ) ) ( not ( = ?auto_108718 ?auto_108721 ) ) ( not ( = ?auto_108719 ?auto_108721 ) ) ( not ( = ?auto_108720 ?auto_108721 ) ) ( not ( = ?auto_108722 ?auto_108721 ) ) ( ON ?auto_108716 ?auto_108715 ) ( ON-TABLE ?auto_108721 ) ( CLEAR ?auto_108718 ) ( ON ?auto_108717 ?auto_108716 ) ( CLEAR ?auto_108717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108721 ?auto_108715 ?auto_108716 )
      ( MAKE-5PILE ?auto_108715 ?auto_108716 ?auto_108717 ?auto_108718 ?auto_108719 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108723 - BLOCK
      ?auto_108724 - BLOCK
      ?auto_108725 - BLOCK
      ?auto_108726 - BLOCK
      ?auto_108727 - BLOCK
    )
    :vars
    (
      ?auto_108729 - BLOCK
      ?auto_108728 - BLOCK
      ?auto_108730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108723 ?auto_108724 ) ) ( not ( = ?auto_108723 ?auto_108725 ) ) ( not ( = ?auto_108723 ?auto_108726 ) ) ( not ( = ?auto_108723 ?auto_108727 ) ) ( not ( = ?auto_108724 ?auto_108725 ) ) ( not ( = ?auto_108724 ?auto_108726 ) ) ( not ( = ?auto_108724 ?auto_108727 ) ) ( not ( = ?auto_108725 ?auto_108726 ) ) ( not ( = ?auto_108725 ?auto_108727 ) ) ( not ( = ?auto_108726 ?auto_108727 ) ) ( ON ?auto_108727 ?auto_108729 ) ( not ( = ?auto_108723 ?auto_108729 ) ) ( not ( = ?auto_108724 ?auto_108729 ) ) ( not ( = ?auto_108725 ?auto_108729 ) ) ( not ( = ?auto_108726 ?auto_108729 ) ) ( not ( = ?auto_108727 ?auto_108729 ) ) ( ON-TABLE ?auto_108728 ) ( ON ?auto_108729 ?auto_108728 ) ( not ( = ?auto_108728 ?auto_108729 ) ) ( not ( = ?auto_108728 ?auto_108727 ) ) ( not ( = ?auto_108728 ?auto_108726 ) ) ( not ( = ?auto_108723 ?auto_108728 ) ) ( not ( = ?auto_108724 ?auto_108728 ) ) ( not ( = ?auto_108725 ?auto_108728 ) ) ( ON ?auto_108723 ?auto_108730 ) ( not ( = ?auto_108723 ?auto_108730 ) ) ( not ( = ?auto_108724 ?auto_108730 ) ) ( not ( = ?auto_108725 ?auto_108730 ) ) ( not ( = ?auto_108726 ?auto_108730 ) ) ( not ( = ?auto_108727 ?auto_108730 ) ) ( not ( = ?auto_108729 ?auto_108730 ) ) ( not ( = ?auto_108728 ?auto_108730 ) ) ( ON ?auto_108724 ?auto_108723 ) ( ON-TABLE ?auto_108730 ) ( ON ?auto_108725 ?auto_108724 ) ( CLEAR ?auto_108725 ) ( HOLDING ?auto_108726 ) ( CLEAR ?auto_108727 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108728 ?auto_108729 ?auto_108727 ?auto_108726 )
      ( MAKE-5PILE ?auto_108723 ?auto_108724 ?auto_108725 ?auto_108726 ?auto_108727 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108731 - BLOCK
      ?auto_108732 - BLOCK
      ?auto_108733 - BLOCK
      ?auto_108734 - BLOCK
      ?auto_108735 - BLOCK
    )
    :vars
    (
      ?auto_108738 - BLOCK
      ?auto_108737 - BLOCK
      ?auto_108736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108731 ?auto_108732 ) ) ( not ( = ?auto_108731 ?auto_108733 ) ) ( not ( = ?auto_108731 ?auto_108734 ) ) ( not ( = ?auto_108731 ?auto_108735 ) ) ( not ( = ?auto_108732 ?auto_108733 ) ) ( not ( = ?auto_108732 ?auto_108734 ) ) ( not ( = ?auto_108732 ?auto_108735 ) ) ( not ( = ?auto_108733 ?auto_108734 ) ) ( not ( = ?auto_108733 ?auto_108735 ) ) ( not ( = ?auto_108734 ?auto_108735 ) ) ( ON ?auto_108735 ?auto_108738 ) ( not ( = ?auto_108731 ?auto_108738 ) ) ( not ( = ?auto_108732 ?auto_108738 ) ) ( not ( = ?auto_108733 ?auto_108738 ) ) ( not ( = ?auto_108734 ?auto_108738 ) ) ( not ( = ?auto_108735 ?auto_108738 ) ) ( ON-TABLE ?auto_108737 ) ( ON ?auto_108738 ?auto_108737 ) ( not ( = ?auto_108737 ?auto_108738 ) ) ( not ( = ?auto_108737 ?auto_108735 ) ) ( not ( = ?auto_108737 ?auto_108734 ) ) ( not ( = ?auto_108731 ?auto_108737 ) ) ( not ( = ?auto_108732 ?auto_108737 ) ) ( not ( = ?auto_108733 ?auto_108737 ) ) ( ON ?auto_108731 ?auto_108736 ) ( not ( = ?auto_108731 ?auto_108736 ) ) ( not ( = ?auto_108732 ?auto_108736 ) ) ( not ( = ?auto_108733 ?auto_108736 ) ) ( not ( = ?auto_108734 ?auto_108736 ) ) ( not ( = ?auto_108735 ?auto_108736 ) ) ( not ( = ?auto_108738 ?auto_108736 ) ) ( not ( = ?auto_108737 ?auto_108736 ) ) ( ON ?auto_108732 ?auto_108731 ) ( ON-TABLE ?auto_108736 ) ( ON ?auto_108733 ?auto_108732 ) ( CLEAR ?auto_108735 ) ( ON ?auto_108734 ?auto_108733 ) ( CLEAR ?auto_108734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108736 ?auto_108731 ?auto_108732 ?auto_108733 )
      ( MAKE-5PILE ?auto_108731 ?auto_108732 ?auto_108733 ?auto_108734 ?auto_108735 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108739 - BLOCK
      ?auto_108740 - BLOCK
      ?auto_108741 - BLOCK
      ?auto_108742 - BLOCK
      ?auto_108743 - BLOCK
    )
    :vars
    (
      ?auto_108746 - BLOCK
      ?auto_108745 - BLOCK
      ?auto_108744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108739 ?auto_108740 ) ) ( not ( = ?auto_108739 ?auto_108741 ) ) ( not ( = ?auto_108739 ?auto_108742 ) ) ( not ( = ?auto_108739 ?auto_108743 ) ) ( not ( = ?auto_108740 ?auto_108741 ) ) ( not ( = ?auto_108740 ?auto_108742 ) ) ( not ( = ?auto_108740 ?auto_108743 ) ) ( not ( = ?auto_108741 ?auto_108742 ) ) ( not ( = ?auto_108741 ?auto_108743 ) ) ( not ( = ?auto_108742 ?auto_108743 ) ) ( not ( = ?auto_108739 ?auto_108746 ) ) ( not ( = ?auto_108740 ?auto_108746 ) ) ( not ( = ?auto_108741 ?auto_108746 ) ) ( not ( = ?auto_108742 ?auto_108746 ) ) ( not ( = ?auto_108743 ?auto_108746 ) ) ( ON-TABLE ?auto_108745 ) ( ON ?auto_108746 ?auto_108745 ) ( not ( = ?auto_108745 ?auto_108746 ) ) ( not ( = ?auto_108745 ?auto_108743 ) ) ( not ( = ?auto_108745 ?auto_108742 ) ) ( not ( = ?auto_108739 ?auto_108745 ) ) ( not ( = ?auto_108740 ?auto_108745 ) ) ( not ( = ?auto_108741 ?auto_108745 ) ) ( ON ?auto_108739 ?auto_108744 ) ( not ( = ?auto_108739 ?auto_108744 ) ) ( not ( = ?auto_108740 ?auto_108744 ) ) ( not ( = ?auto_108741 ?auto_108744 ) ) ( not ( = ?auto_108742 ?auto_108744 ) ) ( not ( = ?auto_108743 ?auto_108744 ) ) ( not ( = ?auto_108746 ?auto_108744 ) ) ( not ( = ?auto_108745 ?auto_108744 ) ) ( ON ?auto_108740 ?auto_108739 ) ( ON-TABLE ?auto_108744 ) ( ON ?auto_108741 ?auto_108740 ) ( ON ?auto_108742 ?auto_108741 ) ( CLEAR ?auto_108742 ) ( HOLDING ?auto_108743 ) ( CLEAR ?auto_108746 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108745 ?auto_108746 ?auto_108743 )
      ( MAKE-5PILE ?auto_108739 ?auto_108740 ?auto_108741 ?auto_108742 ?auto_108743 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108747 - BLOCK
      ?auto_108748 - BLOCK
      ?auto_108749 - BLOCK
      ?auto_108750 - BLOCK
      ?auto_108751 - BLOCK
    )
    :vars
    (
      ?auto_108754 - BLOCK
      ?auto_108752 - BLOCK
      ?auto_108753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108747 ?auto_108748 ) ) ( not ( = ?auto_108747 ?auto_108749 ) ) ( not ( = ?auto_108747 ?auto_108750 ) ) ( not ( = ?auto_108747 ?auto_108751 ) ) ( not ( = ?auto_108748 ?auto_108749 ) ) ( not ( = ?auto_108748 ?auto_108750 ) ) ( not ( = ?auto_108748 ?auto_108751 ) ) ( not ( = ?auto_108749 ?auto_108750 ) ) ( not ( = ?auto_108749 ?auto_108751 ) ) ( not ( = ?auto_108750 ?auto_108751 ) ) ( not ( = ?auto_108747 ?auto_108754 ) ) ( not ( = ?auto_108748 ?auto_108754 ) ) ( not ( = ?auto_108749 ?auto_108754 ) ) ( not ( = ?auto_108750 ?auto_108754 ) ) ( not ( = ?auto_108751 ?auto_108754 ) ) ( ON-TABLE ?auto_108752 ) ( ON ?auto_108754 ?auto_108752 ) ( not ( = ?auto_108752 ?auto_108754 ) ) ( not ( = ?auto_108752 ?auto_108751 ) ) ( not ( = ?auto_108752 ?auto_108750 ) ) ( not ( = ?auto_108747 ?auto_108752 ) ) ( not ( = ?auto_108748 ?auto_108752 ) ) ( not ( = ?auto_108749 ?auto_108752 ) ) ( ON ?auto_108747 ?auto_108753 ) ( not ( = ?auto_108747 ?auto_108753 ) ) ( not ( = ?auto_108748 ?auto_108753 ) ) ( not ( = ?auto_108749 ?auto_108753 ) ) ( not ( = ?auto_108750 ?auto_108753 ) ) ( not ( = ?auto_108751 ?auto_108753 ) ) ( not ( = ?auto_108754 ?auto_108753 ) ) ( not ( = ?auto_108752 ?auto_108753 ) ) ( ON ?auto_108748 ?auto_108747 ) ( ON-TABLE ?auto_108753 ) ( ON ?auto_108749 ?auto_108748 ) ( ON ?auto_108750 ?auto_108749 ) ( CLEAR ?auto_108754 ) ( ON ?auto_108751 ?auto_108750 ) ( CLEAR ?auto_108751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108753 ?auto_108747 ?auto_108748 ?auto_108749 ?auto_108750 )
      ( MAKE-5PILE ?auto_108747 ?auto_108748 ?auto_108749 ?auto_108750 ?auto_108751 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108755 - BLOCK
      ?auto_108756 - BLOCK
      ?auto_108757 - BLOCK
      ?auto_108758 - BLOCK
      ?auto_108759 - BLOCK
    )
    :vars
    (
      ?auto_108761 - BLOCK
      ?auto_108760 - BLOCK
      ?auto_108762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108755 ?auto_108756 ) ) ( not ( = ?auto_108755 ?auto_108757 ) ) ( not ( = ?auto_108755 ?auto_108758 ) ) ( not ( = ?auto_108755 ?auto_108759 ) ) ( not ( = ?auto_108756 ?auto_108757 ) ) ( not ( = ?auto_108756 ?auto_108758 ) ) ( not ( = ?auto_108756 ?auto_108759 ) ) ( not ( = ?auto_108757 ?auto_108758 ) ) ( not ( = ?auto_108757 ?auto_108759 ) ) ( not ( = ?auto_108758 ?auto_108759 ) ) ( not ( = ?auto_108755 ?auto_108761 ) ) ( not ( = ?auto_108756 ?auto_108761 ) ) ( not ( = ?auto_108757 ?auto_108761 ) ) ( not ( = ?auto_108758 ?auto_108761 ) ) ( not ( = ?auto_108759 ?auto_108761 ) ) ( ON-TABLE ?auto_108760 ) ( not ( = ?auto_108760 ?auto_108761 ) ) ( not ( = ?auto_108760 ?auto_108759 ) ) ( not ( = ?auto_108760 ?auto_108758 ) ) ( not ( = ?auto_108755 ?auto_108760 ) ) ( not ( = ?auto_108756 ?auto_108760 ) ) ( not ( = ?auto_108757 ?auto_108760 ) ) ( ON ?auto_108755 ?auto_108762 ) ( not ( = ?auto_108755 ?auto_108762 ) ) ( not ( = ?auto_108756 ?auto_108762 ) ) ( not ( = ?auto_108757 ?auto_108762 ) ) ( not ( = ?auto_108758 ?auto_108762 ) ) ( not ( = ?auto_108759 ?auto_108762 ) ) ( not ( = ?auto_108761 ?auto_108762 ) ) ( not ( = ?auto_108760 ?auto_108762 ) ) ( ON ?auto_108756 ?auto_108755 ) ( ON-TABLE ?auto_108762 ) ( ON ?auto_108757 ?auto_108756 ) ( ON ?auto_108758 ?auto_108757 ) ( ON ?auto_108759 ?auto_108758 ) ( CLEAR ?auto_108759 ) ( HOLDING ?auto_108761 ) ( CLEAR ?auto_108760 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108760 ?auto_108761 )
      ( MAKE-5PILE ?auto_108755 ?auto_108756 ?auto_108757 ?auto_108758 ?auto_108759 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108763 - BLOCK
      ?auto_108764 - BLOCK
      ?auto_108765 - BLOCK
      ?auto_108766 - BLOCK
      ?auto_108767 - BLOCK
    )
    :vars
    (
      ?auto_108770 - BLOCK
      ?auto_108768 - BLOCK
      ?auto_108769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108763 ?auto_108764 ) ) ( not ( = ?auto_108763 ?auto_108765 ) ) ( not ( = ?auto_108763 ?auto_108766 ) ) ( not ( = ?auto_108763 ?auto_108767 ) ) ( not ( = ?auto_108764 ?auto_108765 ) ) ( not ( = ?auto_108764 ?auto_108766 ) ) ( not ( = ?auto_108764 ?auto_108767 ) ) ( not ( = ?auto_108765 ?auto_108766 ) ) ( not ( = ?auto_108765 ?auto_108767 ) ) ( not ( = ?auto_108766 ?auto_108767 ) ) ( not ( = ?auto_108763 ?auto_108770 ) ) ( not ( = ?auto_108764 ?auto_108770 ) ) ( not ( = ?auto_108765 ?auto_108770 ) ) ( not ( = ?auto_108766 ?auto_108770 ) ) ( not ( = ?auto_108767 ?auto_108770 ) ) ( ON-TABLE ?auto_108768 ) ( not ( = ?auto_108768 ?auto_108770 ) ) ( not ( = ?auto_108768 ?auto_108767 ) ) ( not ( = ?auto_108768 ?auto_108766 ) ) ( not ( = ?auto_108763 ?auto_108768 ) ) ( not ( = ?auto_108764 ?auto_108768 ) ) ( not ( = ?auto_108765 ?auto_108768 ) ) ( ON ?auto_108763 ?auto_108769 ) ( not ( = ?auto_108763 ?auto_108769 ) ) ( not ( = ?auto_108764 ?auto_108769 ) ) ( not ( = ?auto_108765 ?auto_108769 ) ) ( not ( = ?auto_108766 ?auto_108769 ) ) ( not ( = ?auto_108767 ?auto_108769 ) ) ( not ( = ?auto_108770 ?auto_108769 ) ) ( not ( = ?auto_108768 ?auto_108769 ) ) ( ON ?auto_108764 ?auto_108763 ) ( ON-TABLE ?auto_108769 ) ( ON ?auto_108765 ?auto_108764 ) ( ON ?auto_108766 ?auto_108765 ) ( ON ?auto_108767 ?auto_108766 ) ( CLEAR ?auto_108768 ) ( ON ?auto_108770 ?auto_108767 ) ( CLEAR ?auto_108770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108769 ?auto_108763 ?auto_108764 ?auto_108765 ?auto_108766 ?auto_108767 )
      ( MAKE-5PILE ?auto_108763 ?auto_108764 ?auto_108765 ?auto_108766 ?auto_108767 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108771 - BLOCK
      ?auto_108772 - BLOCK
      ?auto_108773 - BLOCK
      ?auto_108774 - BLOCK
      ?auto_108775 - BLOCK
    )
    :vars
    (
      ?auto_108777 - BLOCK
      ?auto_108778 - BLOCK
      ?auto_108776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108771 ?auto_108772 ) ) ( not ( = ?auto_108771 ?auto_108773 ) ) ( not ( = ?auto_108771 ?auto_108774 ) ) ( not ( = ?auto_108771 ?auto_108775 ) ) ( not ( = ?auto_108772 ?auto_108773 ) ) ( not ( = ?auto_108772 ?auto_108774 ) ) ( not ( = ?auto_108772 ?auto_108775 ) ) ( not ( = ?auto_108773 ?auto_108774 ) ) ( not ( = ?auto_108773 ?auto_108775 ) ) ( not ( = ?auto_108774 ?auto_108775 ) ) ( not ( = ?auto_108771 ?auto_108777 ) ) ( not ( = ?auto_108772 ?auto_108777 ) ) ( not ( = ?auto_108773 ?auto_108777 ) ) ( not ( = ?auto_108774 ?auto_108777 ) ) ( not ( = ?auto_108775 ?auto_108777 ) ) ( not ( = ?auto_108778 ?auto_108777 ) ) ( not ( = ?auto_108778 ?auto_108775 ) ) ( not ( = ?auto_108778 ?auto_108774 ) ) ( not ( = ?auto_108771 ?auto_108778 ) ) ( not ( = ?auto_108772 ?auto_108778 ) ) ( not ( = ?auto_108773 ?auto_108778 ) ) ( ON ?auto_108771 ?auto_108776 ) ( not ( = ?auto_108771 ?auto_108776 ) ) ( not ( = ?auto_108772 ?auto_108776 ) ) ( not ( = ?auto_108773 ?auto_108776 ) ) ( not ( = ?auto_108774 ?auto_108776 ) ) ( not ( = ?auto_108775 ?auto_108776 ) ) ( not ( = ?auto_108777 ?auto_108776 ) ) ( not ( = ?auto_108778 ?auto_108776 ) ) ( ON ?auto_108772 ?auto_108771 ) ( ON-TABLE ?auto_108776 ) ( ON ?auto_108773 ?auto_108772 ) ( ON ?auto_108774 ?auto_108773 ) ( ON ?auto_108775 ?auto_108774 ) ( ON ?auto_108777 ?auto_108775 ) ( CLEAR ?auto_108777 ) ( HOLDING ?auto_108778 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108778 )
      ( MAKE-5PILE ?auto_108771 ?auto_108772 ?auto_108773 ?auto_108774 ?auto_108775 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108779 - BLOCK
      ?auto_108780 - BLOCK
      ?auto_108781 - BLOCK
      ?auto_108782 - BLOCK
      ?auto_108783 - BLOCK
    )
    :vars
    (
      ?auto_108785 - BLOCK
      ?auto_108786 - BLOCK
      ?auto_108784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108779 ?auto_108780 ) ) ( not ( = ?auto_108779 ?auto_108781 ) ) ( not ( = ?auto_108779 ?auto_108782 ) ) ( not ( = ?auto_108779 ?auto_108783 ) ) ( not ( = ?auto_108780 ?auto_108781 ) ) ( not ( = ?auto_108780 ?auto_108782 ) ) ( not ( = ?auto_108780 ?auto_108783 ) ) ( not ( = ?auto_108781 ?auto_108782 ) ) ( not ( = ?auto_108781 ?auto_108783 ) ) ( not ( = ?auto_108782 ?auto_108783 ) ) ( not ( = ?auto_108779 ?auto_108785 ) ) ( not ( = ?auto_108780 ?auto_108785 ) ) ( not ( = ?auto_108781 ?auto_108785 ) ) ( not ( = ?auto_108782 ?auto_108785 ) ) ( not ( = ?auto_108783 ?auto_108785 ) ) ( not ( = ?auto_108786 ?auto_108785 ) ) ( not ( = ?auto_108786 ?auto_108783 ) ) ( not ( = ?auto_108786 ?auto_108782 ) ) ( not ( = ?auto_108779 ?auto_108786 ) ) ( not ( = ?auto_108780 ?auto_108786 ) ) ( not ( = ?auto_108781 ?auto_108786 ) ) ( ON ?auto_108779 ?auto_108784 ) ( not ( = ?auto_108779 ?auto_108784 ) ) ( not ( = ?auto_108780 ?auto_108784 ) ) ( not ( = ?auto_108781 ?auto_108784 ) ) ( not ( = ?auto_108782 ?auto_108784 ) ) ( not ( = ?auto_108783 ?auto_108784 ) ) ( not ( = ?auto_108785 ?auto_108784 ) ) ( not ( = ?auto_108786 ?auto_108784 ) ) ( ON ?auto_108780 ?auto_108779 ) ( ON-TABLE ?auto_108784 ) ( ON ?auto_108781 ?auto_108780 ) ( ON ?auto_108782 ?auto_108781 ) ( ON ?auto_108783 ?auto_108782 ) ( ON ?auto_108785 ?auto_108783 ) ( ON ?auto_108786 ?auto_108785 ) ( CLEAR ?auto_108786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108784 ?auto_108779 ?auto_108780 ?auto_108781 ?auto_108782 ?auto_108783 ?auto_108785 )
      ( MAKE-5PILE ?auto_108779 ?auto_108780 ?auto_108781 ?auto_108782 ?auto_108783 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108798 - BLOCK
    )
    :vars
    (
      ?auto_108801 - BLOCK
      ?auto_108800 - BLOCK
      ?auto_108799 - BLOCK
      ?auto_108803 - BLOCK
      ?auto_108802 - BLOCK
      ?auto_108804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108801 ?auto_108798 ) ( ON-TABLE ?auto_108798 ) ( not ( = ?auto_108798 ?auto_108801 ) ) ( not ( = ?auto_108798 ?auto_108800 ) ) ( not ( = ?auto_108798 ?auto_108799 ) ) ( not ( = ?auto_108801 ?auto_108800 ) ) ( not ( = ?auto_108801 ?auto_108799 ) ) ( not ( = ?auto_108800 ?auto_108799 ) ) ( ON ?auto_108800 ?auto_108801 ) ( CLEAR ?auto_108800 ) ( HOLDING ?auto_108799 ) ( CLEAR ?auto_108803 ) ( ON-TABLE ?auto_108802 ) ( ON ?auto_108804 ?auto_108802 ) ( ON ?auto_108803 ?auto_108804 ) ( not ( = ?auto_108802 ?auto_108804 ) ) ( not ( = ?auto_108802 ?auto_108803 ) ) ( not ( = ?auto_108802 ?auto_108799 ) ) ( not ( = ?auto_108804 ?auto_108803 ) ) ( not ( = ?auto_108804 ?auto_108799 ) ) ( not ( = ?auto_108803 ?auto_108799 ) ) ( not ( = ?auto_108798 ?auto_108803 ) ) ( not ( = ?auto_108798 ?auto_108802 ) ) ( not ( = ?auto_108798 ?auto_108804 ) ) ( not ( = ?auto_108801 ?auto_108803 ) ) ( not ( = ?auto_108801 ?auto_108802 ) ) ( not ( = ?auto_108801 ?auto_108804 ) ) ( not ( = ?auto_108800 ?auto_108803 ) ) ( not ( = ?auto_108800 ?auto_108802 ) ) ( not ( = ?auto_108800 ?auto_108804 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108802 ?auto_108804 ?auto_108803 ?auto_108799 )
      ( MAKE-1PILE ?auto_108798 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108805 - BLOCK
    )
    :vars
    (
      ?auto_108811 - BLOCK
      ?auto_108810 - BLOCK
      ?auto_108809 - BLOCK
      ?auto_108806 - BLOCK
      ?auto_108807 - BLOCK
      ?auto_108808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108811 ?auto_108805 ) ( ON-TABLE ?auto_108805 ) ( not ( = ?auto_108805 ?auto_108811 ) ) ( not ( = ?auto_108805 ?auto_108810 ) ) ( not ( = ?auto_108805 ?auto_108809 ) ) ( not ( = ?auto_108811 ?auto_108810 ) ) ( not ( = ?auto_108811 ?auto_108809 ) ) ( not ( = ?auto_108810 ?auto_108809 ) ) ( ON ?auto_108810 ?auto_108811 ) ( CLEAR ?auto_108806 ) ( ON-TABLE ?auto_108807 ) ( ON ?auto_108808 ?auto_108807 ) ( ON ?auto_108806 ?auto_108808 ) ( not ( = ?auto_108807 ?auto_108808 ) ) ( not ( = ?auto_108807 ?auto_108806 ) ) ( not ( = ?auto_108807 ?auto_108809 ) ) ( not ( = ?auto_108808 ?auto_108806 ) ) ( not ( = ?auto_108808 ?auto_108809 ) ) ( not ( = ?auto_108806 ?auto_108809 ) ) ( not ( = ?auto_108805 ?auto_108806 ) ) ( not ( = ?auto_108805 ?auto_108807 ) ) ( not ( = ?auto_108805 ?auto_108808 ) ) ( not ( = ?auto_108811 ?auto_108806 ) ) ( not ( = ?auto_108811 ?auto_108807 ) ) ( not ( = ?auto_108811 ?auto_108808 ) ) ( not ( = ?auto_108810 ?auto_108806 ) ) ( not ( = ?auto_108810 ?auto_108807 ) ) ( not ( = ?auto_108810 ?auto_108808 ) ) ( ON ?auto_108809 ?auto_108810 ) ( CLEAR ?auto_108809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108805 ?auto_108811 ?auto_108810 )
      ( MAKE-1PILE ?auto_108805 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108812 - BLOCK
    )
    :vars
    (
      ?auto_108816 - BLOCK
      ?auto_108817 - BLOCK
      ?auto_108818 - BLOCK
      ?auto_108813 - BLOCK
      ?auto_108814 - BLOCK
      ?auto_108815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108816 ?auto_108812 ) ( ON-TABLE ?auto_108812 ) ( not ( = ?auto_108812 ?auto_108816 ) ) ( not ( = ?auto_108812 ?auto_108817 ) ) ( not ( = ?auto_108812 ?auto_108818 ) ) ( not ( = ?auto_108816 ?auto_108817 ) ) ( not ( = ?auto_108816 ?auto_108818 ) ) ( not ( = ?auto_108817 ?auto_108818 ) ) ( ON ?auto_108817 ?auto_108816 ) ( ON-TABLE ?auto_108813 ) ( ON ?auto_108814 ?auto_108813 ) ( not ( = ?auto_108813 ?auto_108814 ) ) ( not ( = ?auto_108813 ?auto_108815 ) ) ( not ( = ?auto_108813 ?auto_108818 ) ) ( not ( = ?auto_108814 ?auto_108815 ) ) ( not ( = ?auto_108814 ?auto_108818 ) ) ( not ( = ?auto_108815 ?auto_108818 ) ) ( not ( = ?auto_108812 ?auto_108815 ) ) ( not ( = ?auto_108812 ?auto_108813 ) ) ( not ( = ?auto_108812 ?auto_108814 ) ) ( not ( = ?auto_108816 ?auto_108815 ) ) ( not ( = ?auto_108816 ?auto_108813 ) ) ( not ( = ?auto_108816 ?auto_108814 ) ) ( not ( = ?auto_108817 ?auto_108815 ) ) ( not ( = ?auto_108817 ?auto_108813 ) ) ( not ( = ?auto_108817 ?auto_108814 ) ) ( ON ?auto_108818 ?auto_108817 ) ( CLEAR ?auto_108818 ) ( HOLDING ?auto_108815 ) ( CLEAR ?auto_108814 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108813 ?auto_108814 ?auto_108815 )
      ( MAKE-1PILE ?auto_108812 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108819 - BLOCK
    )
    :vars
    (
      ?auto_108823 - BLOCK
      ?auto_108820 - BLOCK
      ?auto_108822 - BLOCK
      ?auto_108821 - BLOCK
      ?auto_108825 - BLOCK
      ?auto_108824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108823 ?auto_108819 ) ( ON-TABLE ?auto_108819 ) ( not ( = ?auto_108819 ?auto_108823 ) ) ( not ( = ?auto_108819 ?auto_108820 ) ) ( not ( = ?auto_108819 ?auto_108822 ) ) ( not ( = ?auto_108823 ?auto_108820 ) ) ( not ( = ?auto_108823 ?auto_108822 ) ) ( not ( = ?auto_108820 ?auto_108822 ) ) ( ON ?auto_108820 ?auto_108823 ) ( ON-TABLE ?auto_108821 ) ( ON ?auto_108825 ?auto_108821 ) ( not ( = ?auto_108821 ?auto_108825 ) ) ( not ( = ?auto_108821 ?auto_108824 ) ) ( not ( = ?auto_108821 ?auto_108822 ) ) ( not ( = ?auto_108825 ?auto_108824 ) ) ( not ( = ?auto_108825 ?auto_108822 ) ) ( not ( = ?auto_108824 ?auto_108822 ) ) ( not ( = ?auto_108819 ?auto_108824 ) ) ( not ( = ?auto_108819 ?auto_108821 ) ) ( not ( = ?auto_108819 ?auto_108825 ) ) ( not ( = ?auto_108823 ?auto_108824 ) ) ( not ( = ?auto_108823 ?auto_108821 ) ) ( not ( = ?auto_108823 ?auto_108825 ) ) ( not ( = ?auto_108820 ?auto_108824 ) ) ( not ( = ?auto_108820 ?auto_108821 ) ) ( not ( = ?auto_108820 ?auto_108825 ) ) ( ON ?auto_108822 ?auto_108820 ) ( CLEAR ?auto_108825 ) ( ON ?auto_108824 ?auto_108822 ) ( CLEAR ?auto_108824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108819 ?auto_108823 ?auto_108820 ?auto_108822 )
      ( MAKE-1PILE ?auto_108819 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108826 - BLOCK
    )
    :vars
    (
      ?auto_108828 - BLOCK
      ?auto_108829 - BLOCK
      ?auto_108827 - BLOCK
      ?auto_108831 - BLOCK
      ?auto_108832 - BLOCK
      ?auto_108830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108828 ?auto_108826 ) ( ON-TABLE ?auto_108826 ) ( not ( = ?auto_108826 ?auto_108828 ) ) ( not ( = ?auto_108826 ?auto_108829 ) ) ( not ( = ?auto_108826 ?auto_108827 ) ) ( not ( = ?auto_108828 ?auto_108829 ) ) ( not ( = ?auto_108828 ?auto_108827 ) ) ( not ( = ?auto_108829 ?auto_108827 ) ) ( ON ?auto_108829 ?auto_108828 ) ( ON-TABLE ?auto_108831 ) ( not ( = ?auto_108831 ?auto_108832 ) ) ( not ( = ?auto_108831 ?auto_108830 ) ) ( not ( = ?auto_108831 ?auto_108827 ) ) ( not ( = ?auto_108832 ?auto_108830 ) ) ( not ( = ?auto_108832 ?auto_108827 ) ) ( not ( = ?auto_108830 ?auto_108827 ) ) ( not ( = ?auto_108826 ?auto_108830 ) ) ( not ( = ?auto_108826 ?auto_108831 ) ) ( not ( = ?auto_108826 ?auto_108832 ) ) ( not ( = ?auto_108828 ?auto_108830 ) ) ( not ( = ?auto_108828 ?auto_108831 ) ) ( not ( = ?auto_108828 ?auto_108832 ) ) ( not ( = ?auto_108829 ?auto_108830 ) ) ( not ( = ?auto_108829 ?auto_108831 ) ) ( not ( = ?auto_108829 ?auto_108832 ) ) ( ON ?auto_108827 ?auto_108829 ) ( ON ?auto_108830 ?auto_108827 ) ( CLEAR ?auto_108830 ) ( HOLDING ?auto_108832 ) ( CLEAR ?auto_108831 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108831 ?auto_108832 )
      ( MAKE-1PILE ?auto_108826 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108833 - BLOCK
    )
    :vars
    (
      ?auto_108839 - BLOCK
      ?auto_108836 - BLOCK
      ?auto_108837 - BLOCK
      ?auto_108834 - BLOCK
      ?auto_108838 - BLOCK
      ?auto_108835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108839 ?auto_108833 ) ( ON-TABLE ?auto_108833 ) ( not ( = ?auto_108833 ?auto_108839 ) ) ( not ( = ?auto_108833 ?auto_108836 ) ) ( not ( = ?auto_108833 ?auto_108837 ) ) ( not ( = ?auto_108839 ?auto_108836 ) ) ( not ( = ?auto_108839 ?auto_108837 ) ) ( not ( = ?auto_108836 ?auto_108837 ) ) ( ON ?auto_108836 ?auto_108839 ) ( ON-TABLE ?auto_108834 ) ( not ( = ?auto_108834 ?auto_108838 ) ) ( not ( = ?auto_108834 ?auto_108835 ) ) ( not ( = ?auto_108834 ?auto_108837 ) ) ( not ( = ?auto_108838 ?auto_108835 ) ) ( not ( = ?auto_108838 ?auto_108837 ) ) ( not ( = ?auto_108835 ?auto_108837 ) ) ( not ( = ?auto_108833 ?auto_108835 ) ) ( not ( = ?auto_108833 ?auto_108834 ) ) ( not ( = ?auto_108833 ?auto_108838 ) ) ( not ( = ?auto_108839 ?auto_108835 ) ) ( not ( = ?auto_108839 ?auto_108834 ) ) ( not ( = ?auto_108839 ?auto_108838 ) ) ( not ( = ?auto_108836 ?auto_108835 ) ) ( not ( = ?auto_108836 ?auto_108834 ) ) ( not ( = ?auto_108836 ?auto_108838 ) ) ( ON ?auto_108837 ?auto_108836 ) ( ON ?auto_108835 ?auto_108837 ) ( CLEAR ?auto_108834 ) ( ON ?auto_108838 ?auto_108835 ) ( CLEAR ?auto_108838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108833 ?auto_108839 ?auto_108836 ?auto_108837 ?auto_108835 )
      ( MAKE-1PILE ?auto_108833 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108840 - BLOCK
    )
    :vars
    (
      ?auto_108846 - BLOCK
      ?auto_108843 - BLOCK
      ?auto_108844 - BLOCK
      ?auto_108841 - BLOCK
      ?auto_108842 - BLOCK
      ?auto_108845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108846 ?auto_108840 ) ( ON-TABLE ?auto_108840 ) ( not ( = ?auto_108840 ?auto_108846 ) ) ( not ( = ?auto_108840 ?auto_108843 ) ) ( not ( = ?auto_108840 ?auto_108844 ) ) ( not ( = ?auto_108846 ?auto_108843 ) ) ( not ( = ?auto_108846 ?auto_108844 ) ) ( not ( = ?auto_108843 ?auto_108844 ) ) ( ON ?auto_108843 ?auto_108846 ) ( not ( = ?auto_108841 ?auto_108842 ) ) ( not ( = ?auto_108841 ?auto_108845 ) ) ( not ( = ?auto_108841 ?auto_108844 ) ) ( not ( = ?auto_108842 ?auto_108845 ) ) ( not ( = ?auto_108842 ?auto_108844 ) ) ( not ( = ?auto_108845 ?auto_108844 ) ) ( not ( = ?auto_108840 ?auto_108845 ) ) ( not ( = ?auto_108840 ?auto_108841 ) ) ( not ( = ?auto_108840 ?auto_108842 ) ) ( not ( = ?auto_108846 ?auto_108845 ) ) ( not ( = ?auto_108846 ?auto_108841 ) ) ( not ( = ?auto_108846 ?auto_108842 ) ) ( not ( = ?auto_108843 ?auto_108845 ) ) ( not ( = ?auto_108843 ?auto_108841 ) ) ( not ( = ?auto_108843 ?auto_108842 ) ) ( ON ?auto_108844 ?auto_108843 ) ( ON ?auto_108845 ?auto_108844 ) ( ON ?auto_108842 ?auto_108845 ) ( CLEAR ?auto_108842 ) ( HOLDING ?auto_108841 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108841 )
      ( MAKE-1PILE ?auto_108840 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108855 - BLOCK
    )
    :vars
    (
      ?auto_108861 - BLOCK
      ?auto_108858 - BLOCK
      ?auto_108860 - BLOCK
      ?auto_108859 - BLOCK
      ?auto_108856 - BLOCK
      ?auto_108857 - BLOCK
      ?auto_108862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108861 ?auto_108855 ) ( ON-TABLE ?auto_108855 ) ( not ( = ?auto_108855 ?auto_108861 ) ) ( not ( = ?auto_108855 ?auto_108858 ) ) ( not ( = ?auto_108855 ?auto_108860 ) ) ( not ( = ?auto_108861 ?auto_108858 ) ) ( not ( = ?auto_108861 ?auto_108860 ) ) ( not ( = ?auto_108858 ?auto_108860 ) ) ( ON ?auto_108858 ?auto_108861 ) ( not ( = ?auto_108859 ?auto_108856 ) ) ( not ( = ?auto_108859 ?auto_108857 ) ) ( not ( = ?auto_108859 ?auto_108860 ) ) ( not ( = ?auto_108856 ?auto_108857 ) ) ( not ( = ?auto_108856 ?auto_108860 ) ) ( not ( = ?auto_108857 ?auto_108860 ) ) ( not ( = ?auto_108855 ?auto_108857 ) ) ( not ( = ?auto_108855 ?auto_108859 ) ) ( not ( = ?auto_108855 ?auto_108856 ) ) ( not ( = ?auto_108861 ?auto_108857 ) ) ( not ( = ?auto_108861 ?auto_108859 ) ) ( not ( = ?auto_108861 ?auto_108856 ) ) ( not ( = ?auto_108858 ?auto_108857 ) ) ( not ( = ?auto_108858 ?auto_108859 ) ) ( not ( = ?auto_108858 ?auto_108856 ) ) ( ON ?auto_108860 ?auto_108858 ) ( ON ?auto_108857 ?auto_108860 ) ( ON ?auto_108856 ?auto_108857 ) ( CLEAR ?auto_108856 ) ( ON ?auto_108859 ?auto_108862 ) ( CLEAR ?auto_108859 ) ( HAND-EMPTY ) ( not ( = ?auto_108855 ?auto_108862 ) ) ( not ( = ?auto_108861 ?auto_108862 ) ) ( not ( = ?auto_108858 ?auto_108862 ) ) ( not ( = ?auto_108860 ?auto_108862 ) ) ( not ( = ?auto_108859 ?auto_108862 ) ) ( not ( = ?auto_108856 ?auto_108862 ) ) ( not ( = ?auto_108857 ?auto_108862 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108859 ?auto_108862 )
      ( MAKE-1PILE ?auto_108855 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108863 - BLOCK
    )
    :vars
    (
      ?auto_108868 - BLOCK
      ?auto_108865 - BLOCK
      ?auto_108866 - BLOCK
      ?auto_108869 - BLOCK
      ?auto_108867 - BLOCK
      ?auto_108870 - BLOCK
      ?auto_108864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108868 ?auto_108863 ) ( ON-TABLE ?auto_108863 ) ( not ( = ?auto_108863 ?auto_108868 ) ) ( not ( = ?auto_108863 ?auto_108865 ) ) ( not ( = ?auto_108863 ?auto_108866 ) ) ( not ( = ?auto_108868 ?auto_108865 ) ) ( not ( = ?auto_108868 ?auto_108866 ) ) ( not ( = ?auto_108865 ?auto_108866 ) ) ( ON ?auto_108865 ?auto_108868 ) ( not ( = ?auto_108869 ?auto_108867 ) ) ( not ( = ?auto_108869 ?auto_108870 ) ) ( not ( = ?auto_108869 ?auto_108866 ) ) ( not ( = ?auto_108867 ?auto_108870 ) ) ( not ( = ?auto_108867 ?auto_108866 ) ) ( not ( = ?auto_108870 ?auto_108866 ) ) ( not ( = ?auto_108863 ?auto_108870 ) ) ( not ( = ?auto_108863 ?auto_108869 ) ) ( not ( = ?auto_108863 ?auto_108867 ) ) ( not ( = ?auto_108868 ?auto_108870 ) ) ( not ( = ?auto_108868 ?auto_108869 ) ) ( not ( = ?auto_108868 ?auto_108867 ) ) ( not ( = ?auto_108865 ?auto_108870 ) ) ( not ( = ?auto_108865 ?auto_108869 ) ) ( not ( = ?auto_108865 ?auto_108867 ) ) ( ON ?auto_108866 ?auto_108865 ) ( ON ?auto_108870 ?auto_108866 ) ( ON ?auto_108869 ?auto_108864 ) ( CLEAR ?auto_108869 ) ( not ( = ?auto_108863 ?auto_108864 ) ) ( not ( = ?auto_108868 ?auto_108864 ) ) ( not ( = ?auto_108865 ?auto_108864 ) ) ( not ( = ?auto_108866 ?auto_108864 ) ) ( not ( = ?auto_108869 ?auto_108864 ) ) ( not ( = ?auto_108867 ?auto_108864 ) ) ( not ( = ?auto_108870 ?auto_108864 ) ) ( HOLDING ?auto_108867 ) ( CLEAR ?auto_108870 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108863 ?auto_108868 ?auto_108865 ?auto_108866 ?auto_108870 ?auto_108867 )
      ( MAKE-1PILE ?auto_108863 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108871 - BLOCK
    )
    :vars
    (
      ?auto_108876 - BLOCK
      ?auto_108873 - BLOCK
      ?auto_108875 - BLOCK
      ?auto_108872 - BLOCK
      ?auto_108877 - BLOCK
      ?auto_108878 - BLOCK
      ?auto_108874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108876 ?auto_108871 ) ( ON-TABLE ?auto_108871 ) ( not ( = ?auto_108871 ?auto_108876 ) ) ( not ( = ?auto_108871 ?auto_108873 ) ) ( not ( = ?auto_108871 ?auto_108875 ) ) ( not ( = ?auto_108876 ?auto_108873 ) ) ( not ( = ?auto_108876 ?auto_108875 ) ) ( not ( = ?auto_108873 ?auto_108875 ) ) ( ON ?auto_108873 ?auto_108876 ) ( not ( = ?auto_108872 ?auto_108877 ) ) ( not ( = ?auto_108872 ?auto_108878 ) ) ( not ( = ?auto_108872 ?auto_108875 ) ) ( not ( = ?auto_108877 ?auto_108878 ) ) ( not ( = ?auto_108877 ?auto_108875 ) ) ( not ( = ?auto_108878 ?auto_108875 ) ) ( not ( = ?auto_108871 ?auto_108878 ) ) ( not ( = ?auto_108871 ?auto_108872 ) ) ( not ( = ?auto_108871 ?auto_108877 ) ) ( not ( = ?auto_108876 ?auto_108878 ) ) ( not ( = ?auto_108876 ?auto_108872 ) ) ( not ( = ?auto_108876 ?auto_108877 ) ) ( not ( = ?auto_108873 ?auto_108878 ) ) ( not ( = ?auto_108873 ?auto_108872 ) ) ( not ( = ?auto_108873 ?auto_108877 ) ) ( ON ?auto_108875 ?auto_108873 ) ( ON ?auto_108878 ?auto_108875 ) ( ON ?auto_108872 ?auto_108874 ) ( not ( = ?auto_108871 ?auto_108874 ) ) ( not ( = ?auto_108876 ?auto_108874 ) ) ( not ( = ?auto_108873 ?auto_108874 ) ) ( not ( = ?auto_108875 ?auto_108874 ) ) ( not ( = ?auto_108872 ?auto_108874 ) ) ( not ( = ?auto_108877 ?auto_108874 ) ) ( not ( = ?auto_108878 ?auto_108874 ) ) ( CLEAR ?auto_108878 ) ( ON ?auto_108877 ?auto_108872 ) ( CLEAR ?auto_108877 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108874 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108874 ?auto_108872 )
      ( MAKE-1PILE ?auto_108871 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108879 - BLOCK
    )
    :vars
    (
      ?auto_108880 - BLOCK
      ?auto_108883 - BLOCK
      ?auto_108884 - BLOCK
      ?auto_108882 - BLOCK
      ?auto_108881 - BLOCK
      ?auto_108885 - BLOCK
      ?auto_108886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108880 ?auto_108879 ) ( ON-TABLE ?auto_108879 ) ( not ( = ?auto_108879 ?auto_108880 ) ) ( not ( = ?auto_108879 ?auto_108883 ) ) ( not ( = ?auto_108879 ?auto_108884 ) ) ( not ( = ?auto_108880 ?auto_108883 ) ) ( not ( = ?auto_108880 ?auto_108884 ) ) ( not ( = ?auto_108883 ?auto_108884 ) ) ( ON ?auto_108883 ?auto_108880 ) ( not ( = ?auto_108882 ?auto_108881 ) ) ( not ( = ?auto_108882 ?auto_108885 ) ) ( not ( = ?auto_108882 ?auto_108884 ) ) ( not ( = ?auto_108881 ?auto_108885 ) ) ( not ( = ?auto_108881 ?auto_108884 ) ) ( not ( = ?auto_108885 ?auto_108884 ) ) ( not ( = ?auto_108879 ?auto_108885 ) ) ( not ( = ?auto_108879 ?auto_108882 ) ) ( not ( = ?auto_108879 ?auto_108881 ) ) ( not ( = ?auto_108880 ?auto_108885 ) ) ( not ( = ?auto_108880 ?auto_108882 ) ) ( not ( = ?auto_108880 ?auto_108881 ) ) ( not ( = ?auto_108883 ?auto_108885 ) ) ( not ( = ?auto_108883 ?auto_108882 ) ) ( not ( = ?auto_108883 ?auto_108881 ) ) ( ON ?auto_108884 ?auto_108883 ) ( ON ?auto_108882 ?auto_108886 ) ( not ( = ?auto_108879 ?auto_108886 ) ) ( not ( = ?auto_108880 ?auto_108886 ) ) ( not ( = ?auto_108883 ?auto_108886 ) ) ( not ( = ?auto_108884 ?auto_108886 ) ) ( not ( = ?auto_108882 ?auto_108886 ) ) ( not ( = ?auto_108881 ?auto_108886 ) ) ( not ( = ?auto_108885 ?auto_108886 ) ) ( ON ?auto_108881 ?auto_108882 ) ( CLEAR ?auto_108881 ) ( ON-TABLE ?auto_108886 ) ( HOLDING ?auto_108885 ) ( CLEAR ?auto_108884 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108879 ?auto_108880 ?auto_108883 ?auto_108884 ?auto_108885 )
      ( MAKE-1PILE ?auto_108879 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_108925 - BLOCK
      ?auto_108926 - BLOCK
      ?auto_108927 - BLOCK
      ?auto_108928 - BLOCK
      ?auto_108929 - BLOCK
      ?auto_108930 - BLOCK
    )
    :vars
    (
      ?auto_108931 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108925 ) ( ON ?auto_108926 ?auto_108925 ) ( ON ?auto_108927 ?auto_108926 ) ( ON ?auto_108928 ?auto_108927 ) ( not ( = ?auto_108925 ?auto_108926 ) ) ( not ( = ?auto_108925 ?auto_108927 ) ) ( not ( = ?auto_108925 ?auto_108928 ) ) ( not ( = ?auto_108925 ?auto_108929 ) ) ( not ( = ?auto_108925 ?auto_108930 ) ) ( not ( = ?auto_108926 ?auto_108927 ) ) ( not ( = ?auto_108926 ?auto_108928 ) ) ( not ( = ?auto_108926 ?auto_108929 ) ) ( not ( = ?auto_108926 ?auto_108930 ) ) ( not ( = ?auto_108927 ?auto_108928 ) ) ( not ( = ?auto_108927 ?auto_108929 ) ) ( not ( = ?auto_108927 ?auto_108930 ) ) ( not ( = ?auto_108928 ?auto_108929 ) ) ( not ( = ?auto_108928 ?auto_108930 ) ) ( not ( = ?auto_108929 ?auto_108930 ) ) ( ON ?auto_108930 ?auto_108931 ) ( not ( = ?auto_108925 ?auto_108931 ) ) ( not ( = ?auto_108926 ?auto_108931 ) ) ( not ( = ?auto_108927 ?auto_108931 ) ) ( not ( = ?auto_108928 ?auto_108931 ) ) ( not ( = ?auto_108929 ?auto_108931 ) ) ( not ( = ?auto_108930 ?auto_108931 ) ) ( CLEAR ?auto_108928 ) ( ON ?auto_108929 ?auto_108930 ) ( CLEAR ?auto_108929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108931 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108931 ?auto_108930 )
      ( MAKE-6PILE ?auto_108925 ?auto_108926 ?auto_108927 ?auto_108928 ?auto_108929 ?auto_108930 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_108932 - BLOCK
      ?auto_108933 - BLOCK
      ?auto_108934 - BLOCK
      ?auto_108935 - BLOCK
      ?auto_108936 - BLOCK
      ?auto_108937 - BLOCK
    )
    :vars
    (
      ?auto_108938 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108932 ) ( ON ?auto_108933 ?auto_108932 ) ( ON ?auto_108934 ?auto_108933 ) ( not ( = ?auto_108932 ?auto_108933 ) ) ( not ( = ?auto_108932 ?auto_108934 ) ) ( not ( = ?auto_108932 ?auto_108935 ) ) ( not ( = ?auto_108932 ?auto_108936 ) ) ( not ( = ?auto_108932 ?auto_108937 ) ) ( not ( = ?auto_108933 ?auto_108934 ) ) ( not ( = ?auto_108933 ?auto_108935 ) ) ( not ( = ?auto_108933 ?auto_108936 ) ) ( not ( = ?auto_108933 ?auto_108937 ) ) ( not ( = ?auto_108934 ?auto_108935 ) ) ( not ( = ?auto_108934 ?auto_108936 ) ) ( not ( = ?auto_108934 ?auto_108937 ) ) ( not ( = ?auto_108935 ?auto_108936 ) ) ( not ( = ?auto_108935 ?auto_108937 ) ) ( not ( = ?auto_108936 ?auto_108937 ) ) ( ON ?auto_108937 ?auto_108938 ) ( not ( = ?auto_108932 ?auto_108938 ) ) ( not ( = ?auto_108933 ?auto_108938 ) ) ( not ( = ?auto_108934 ?auto_108938 ) ) ( not ( = ?auto_108935 ?auto_108938 ) ) ( not ( = ?auto_108936 ?auto_108938 ) ) ( not ( = ?auto_108937 ?auto_108938 ) ) ( ON ?auto_108936 ?auto_108937 ) ( CLEAR ?auto_108936 ) ( ON-TABLE ?auto_108938 ) ( HOLDING ?auto_108935 ) ( CLEAR ?auto_108934 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108932 ?auto_108933 ?auto_108934 ?auto_108935 )
      ( MAKE-6PILE ?auto_108932 ?auto_108933 ?auto_108934 ?auto_108935 ?auto_108936 ?auto_108937 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_108939 - BLOCK
      ?auto_108940 - BLOCK
      ?auto_108941 - BLOCK
      ?auto_108942 - BLOCK
      ?auto_108943 - BLOCK
      ?auto_108944 - BLOCK
    )
    :vars
    (
      ?auto_108945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108939 ) ( ON ?auto_108940 ?auto_108939 ) ( ON ?auto_108941 ?auto_108940 ) ( not ( = ?auto_108939 ?auto_108940 ) ) ( not ( = ?auto_108939 ?auto_108941 ) ) ( not ( = ?auto_108939 ?auto_108942 ) ) ( not ( = ?auto_108939 ?auto_108943 ) ) ( not ( = ?auto_108939 ?auto_108944 ) ) ( not ( = ?auto_108940 ?auto_108941 ) ) ( not ( = ?auto_108940 ?auto_108942 ) ) ( not ( = ?auto_108940 ?auto_108943 ) ) ( not ( = ?auto_108940 ?auto_108944 ) ) ( not ( = ?auto_108941 ?auto_108942 ) ) ( not ( = ?auto_108941 ?auto_108943 ) ) ( not ( = ?auto_108941 ?auto_108944 ) ) ( not ( = ?auto_108942 ?auto_108943 ) ) ( not ( = ?auto_108942 ?auto_108944 ) ) ( not ( = ?auto_108943 ?auto_108944 ) ) ( ON ?auto_108944 ?auto_108945 ) ( not ( = ?auto_108939 ?auto_108945 ) ) ( not ( = ?auto_108940 ?auto_108945 ) ) ( not ( = ?auto_108941 ?auto_108945 ) ) ( not ( = ?auto_108942 ?auto_108945 ) ) ( not ( = ?auto_108943 ?auto_108945 ) ) ( not ( = ?auto_108944 ?auto_108945 ) ) ( ON ?auto_108943 ?auto_108944 ) ( ON-TABLE ?auto_108945 ) ( CLEAR ?auto_108941 ) ( ON ?auto_108942 ?auto_108943 ) ( CLEAR ?auto_108942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108945 ?auto_108944 ?auto_108943 )
      ( MAKE-6PILE ?auto_108939 ?auto_108940 ?auto_108941 ?auto_108942 ?auto_108943 ?auto_108944 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_108946 - BLOCK
      ?auto_108947 - BLOCK
      ?auto_108948 - BLOCK
      ?auto_108949 - BLOCK
      ?auto_108950 - BLOCK
      ?auto_108951 - BLOCK
    )
    :vars
    (
      ?auto_108952 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108946 ) ( ON ?auto_108947 ?auto_108946 ) ( not ( = ?auto_108946 ?auto_108947 ) ) ( not ( = ?auto_108946 ?auto_108948 ) ) ( not ( = ?auto_108946 ?auto_108949 ) ) ( not ( = ?auto_108946 ?auto_108950 ) ) ( not ( = ?auto_108946 ?auto_108951 ) ) ( not ( = ?auto_108947 ?auto_108948 ) ) ( not ( = ?auto_108947 ?auto_108949 ) ) ( not ( = ?auto_108947 ?auto_108950 ) ) ( not ( = ?auto_108947 ?auto_108951 ) ) ( not ( = ?auto_108948 ?auto_108949 ) ) ( not ( = ?auto_108948 ?auto_108950 ) ) ( not ( = ?auto_108948 ?auto_108951 ) ) ( not ( = ?auto_108949 ?auto_108950 ) ) ( not ( = ?auto_108949 ?auto_108951 ) ) ( not ( = ?auto_108950 ?auto_108951 ) ) ( ON ?auto_108951 ?auto_108952 ) ( not ( = ?auto_108946 ?auto_108952 ) ) ( not ( = ?auto_108947 ?auto_108952 ) ) ( not ( = ?auto_108948 ?auto_108952 ) ) ( not ( = ?auto_108949 ?auto_108952 ) ) ( not ( = ?auto_108950 ?auto_108952 ) ) ( not ( = ?auto_108951 ?auto_108952 ) ) ( ON ?auto_108950 ?auto_108951 ) ( ON-TABLE ?auto_108952 ) ( ON ?auto_108949 ?auto_108950 ) ( CLEAR ?auto_108949 ) ( HOLDING ?auto_108948 ) ( CLEAR ?auto_108947 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108946 ?auto_108947 ?auto_108948 )
      ( MAKE-6PILE ?auto_108946 ?auto_108947 ?auto_108948 ?auto_108949 ?auto_108950 ?auto_108951 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_108953 - BLOCK
      ?auto_108954 - BLOCK
      ?auto_108955 - BLOCK
      ?auto_108956 - BLOCK
      ?auto_108957 - BLOCK
      ?auto_108958 - BLOCK
    )
    :vars
    (
      ?auto_108959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108953 ) ( ON ?auto_108954 ?auto_108953 ) ( not ( = ?auto_108953 ?auto_108954 ) ) ( not ( = ?auto_108953 ?auto_108955 ) ) ( not ( = ?auto_108953 ?auto_108956 ) ) ( not ( = ?auto_108953 ?auto_108957 ) ) ( not ( = ?auto_108953 ?auto_108958 ) ) ( not ( = ?auto_108954 ?auto_108955 ) ) ( not ( = ?auto_108954 ?auto_108956 ) ) ( not ( = ?auto_108954 ?auto_108957 ) ) ( not ( = ?auto_108954 ?auto_108958 ) ) ( not ( = ?auto_108955 ?auto_108956 ) ) ( not ( = ?auto_108955 ?auto_108957 ) ) ( not ( = ?auto_108955 ?auto_108958 ) ) ( not ( = ?auto_108956 ?auto_108957 ) ) ( not ( = ?auto_108956 ?auto_108958 ) ) ( not ( = ?auto_108957 ?auto_108958 ) ) ( ON ?auto_108958 ?auto_108959 ) ( not ( = ?auto_108953 ?auto_108959 ) ) ( not ( = ?auto_108954 ?auto_108959 ) ) ( not ( = ?auto_108955 ?auto_108959 ) ) ( not ( = ?auto_108956 ?auto_108959 ) ) ( not ( = ?auto_108957 ?auto_108959 ) ) ( not ( = ?auto_108958 ?auto_108959 ) ) ( ON ?auto_108957 ?auto_108958 ) ( ON-TABLE ?auto_108959 ) ( ON ?auto_108956 ?auto_108957 ) ( CLEAR ?auto_108954 ) ( ON ?auto_108955 ?auto_108956 ) ( CLEAR ?auto_108955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108959 ?auto_108958 ?auto_108957 ?auto_108956 )
      ( MAKE-6PILE ?auto_108953 ?auto_108954 ?auto_108955 ?auto_108956 ?auto_108957 ?auto_108958 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_108960 - BLOCK
      ?auto_108961 - BLOCK
      ?auto_108962 - BLOCK
      ?auto_108963 - BLOCK
      ?auto_108964 - BLOCK
      ?auto_108965 - BLOCK
    )
    :vars
    (
      ?auto_108966 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108960 ) ( not ( = ?auto_108960 ?auto_108961 ) ) ( not ( = ?auto_108960 ?auto_108962 ) ) ( not ( = ?auto_108960 ?auto_108963 ) ) ( not ( = ?auto_108960 ?auto_108964 ) ) ( not ( = ?auto_108960 ?auto_108965 ) ) ( not ( = ?auto_108961 ?auto_108962 ) ) ( not ( = ?auto_108961 ?auto_108963 ) ) ( not ( = ?auto_108961 ?auto_108964 ) ) ( not ( = ?auto_108961 ?auto_108965 ) ) ( not ( = ?auto_108962 ?auto_108963 ) ) ( not ( = ?auto_108962 ?auto_108964 ) ) ( not ( = ?auto_108962 ?auto_108965 ) ) ( not ( = ?auto_108963 ?auto_108964 ) ) ( not ( = ?auto_108963 ?auto_108965 ) ) ( not ( = ?auto_108964 ?auto_108965 ) ) ( ON ?auto_108965 ?auto_108966 ) ( not ( = ?auto_108960 ?auto_108966 ) ) ( not ( = ?auto_108961 ?auto_108966 ) ) ( not ( = ?auto_108962 ?auto_108966 ) ) ( not ( = ?auto_108963 ?auto_108966 ) ) ( not ( = ?auto_108964 ?auto_108966 ) ) ( not ( = ?auto_108965 ?auto_108966 ) ) ( ON ?auto_108964 ?auto_108965 ) ( ON-TABLE ?auto_108966 ) ( ON ?auto_108963 ?auto_108964 ) ( ON ?auto_108962 ?auto_108963 ) ( CLEAR ?auto_108962 ) ( HOLDING ?auto_108961 ) ( CLEAR ?auto_108960 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108960 ?auto_108961 )
      ( MAKE-6PILE ?auto_108960 ?auto_108961 ?auto_108962 ?auto_108963 ?auto_108964 ?auto_108965 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_108967 - BLOCK
      ?auto_108968 - BLOCK
      ?auto_108969 - BLOCK
      ?auto_108970 - BLOCK
      ?auto_108971 - BLOCK
      ?auto_108972 - BLOCK
    )
    :vars
    (
      ?auto_108973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108967 ) ( not ( = ?auto_108967 ?auto_108968 ) ) ( not ( = ?auto_108967 ?auto_108969 ) ) ( not ( = ?auto_108967 ?auto_108970 ) ) ( not ( = ?auto_108967 ?auto_108971 ) ) ( not ( = ?auto_108967 ?auto_108972 ) ) ( not ( = ?auto_108968 ?auto_108969 ) ) ( not ( = ?auto_108968 ?auto_108970 ) ) ( not ( = ?auto_108968 ?auto_108971 ) ) ( not ( = ?auto_108968 ?auto_108972 ) ) ( not ( = ?auto_108969 ?auto_108970 ) ) ( not ( = ?auto_108969 ?auto_108971 ) ) ( not ( = ?auto_108969 ?auto_108972 ) ) ( not ( = ?auto_108970 ?auto_108971 ) ) ( not ( = ?auto_108970 ?auto_108972 ) ) ( not ( = ?auto_108971 ?auto_108972 ) ) ( ON ?auto_108972 ?auto_108973 ) ( not ( = ?auto_108967 ?auto_108973 ) ) ( not ( = ?auto_108968 ?auto_108973 ) ) ( not ( = ?auto_108969 ?auto_108973 ) ) ( not ( = ?auto_108970 ?auto_108973 ) ) ( not ( = ?auto_108971 ?auto_108973 ) ) ( not ( = ?auto_108972 ?auto_108973 ) ) ( ON ?auto_108971 ?auto_108972 ) ( ON-TABLE ?auto_108973 ) ( ON ?auto_108970 ?auto_108971 ) ( ON ?auto_108969 ?auto_108970 ) ( CLEAR ?auto_108967 ) ( ON ?auto_108968 ?auto_108969 ) ( CLEAR ?auto_108968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108973 ?auto_108972 ?auto_108971 ?auto_108970 ?auto_108969 )
      ( MAKE-6PILE ?auto_108967 ?auto_108968 ?auto_108969 ?auto_108970 ?auto_108971 ?auto_108972 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_108974 - BLOCK
      ?auto_108975 - BLOCK
      ?auto_108976 - BLOCK
      ?auto_108977 - BLOCK
      ?auto_108978 - BLOCK
      ?auto_108979 - BLOCK
    )
    :vars
    (
      ?auto_108980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108974 ?auto_108975 ) ) ( not ( = ?auto_108974 ?auto_108976 ) ) ( not ( = ?auto_108974 ?auto_108977 ) ) ( not ( = ?auto_108974 ?auto_108978 ) ) ( not ( = ?auto_108974 ?auto_108979 ) ) ( not ( = ?auto_108975 ?auto_108976 ) ) ( not ( = ?auto_108975 ?auto_108977 ) ) ( not ( = ?auto_108975 ?auto_108978 ) ) ( not ( = ?auto_108975 ?auto_108979 ) ) ( not ( = ?auto_108976 ?auto_108977 ) ) ( not ( = ?auto_108976 ?auto_108978 ) ) ( not ( = ?auto_108976 ?auto_108979 ) ) ( not ( = ?auto_108977 ?auto_108978 ) ) ( not ( = ?auto_108977 ?auto_108979 ) ) ( not ( = ?auto_108978 ?auto_108979 ) ) ( ON ?auto_108979 ?auto_108980 ) ( not ( = ?auto_108974 ?auto_108980 ) ) ( not ( = ?auto_108975 ?auto_108980 ) ) ( not ( = ?auto_108976 ?auto_108980 ) ) ( not ( = ?auto_108977 ?auto_108980 ) ) ( not ( = ?auto_108978 ?auto_108980 ) ) ( not ( = ?auto_108979 ?auto_108980 ) ) ( ON ?auto_108978 ?auto_108979 ) ( ON-TABLE ?auto_108980 ) ( ON ?auto_108977 ?auto_108978 ) ( ON ?auto_108976 ?auto_108977 ) ( ON ?auto_108975 ?auto_108976 ) ( CLEAR ?auto_108975 ) ( HOLDING ?auto_108974 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108974 )
      ( MAKE-6PILE ?auto_108974 ?auto_108975 ?auto_108976 ?auto_108977 ?auto_108978 ?auto_108979 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_108981 - BLOCK
      ?auto_108982 - BLOCK
      ?auto_108983 - BLOCK
      ?auto_108984 - BLOCK
      ?auto_108985 - BLOCK
      ?auto_108986 - BLOCK
    )
    :vars
    (
      ?auto_108987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108981 ?auto_108982 ) ) ( not ( = ?auto_108981 ?auto_108983 ) ) ( not ( = ?auto_108981 ?auto_108984 ) ) ( not ( = ?auto_108981 ?auto_108985 ) ) ( not ( = ?auto_108981 ?auto_108986 ) ) ( not ( = ?auto_108982 ?auto_108983 ) ) ( not ( = ?auto_108982 ?auto_108984 ) ) ( not ( = ?auto_108982 ?auto_108985 ) ) ( not ( = ?auto_108982 ?auto_108986 ) ) ( not ( = ?auto_108983 ?auto_108984 ) ) ( not ( = ?auto_108983 ?auto_108985 ) ) ( not ( = ?auto_108983 ?auto_108986 ) ) ( not ( = ?auto_108984 ?auto_108985 ) ) ( not ( = ?auto_108984 ?auto_108986 ) ) ( not ( = ?auto_108985 ?auto_108986 ) ) ( ON ?auto_108986 ?auto_108987 ) ( not ( = ?auto_108981 ?auto_108987 ) ) ( not ( = ?auto_108982 ?auto_108987 ) ) ( not ( = ?auto_108983 ?auto_108987 ) ) ( not ( = ?auto_108984 ?auto_108987 ) ) ( not ( = ?auto_108985 ?auto_108987 ) ) ( not ( = ?auto_108986 ?auto_108987 ) ) ( ON ?auto_108985 ?auto_108986 ) ( ON-TABLE ?auto_108987 ) ( ON ?auto_108984 ?auto_108985 ) ( ON ?auto_108983 ?auto_108984 ) ( ON ?auto_108982 ?auto_108983 ) ( ON ?auto_108981 ?auto_108982 ) ( CLEAR ?auto_108981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108987 ?auto_108986 ?auto_108985 ?auto_108984 ?auto_108983 ?auto_108982 )
      ( MAKE-6PILE ?auto_108981 ?auto_108982 ?auto_108983 ?auto_108984 ?auto_108985 ?auto_108986 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_108994 - BLOCK
      ?auto_108995 - BLOCK
      ?auto_108996 - BLOCK
      ?auto_108997 - BLOCK
      ?auto_108998 - BLOCK
      ?auto_108999 - BLOCK
    )
    :vars
    (
      ?auto_109000 - BLOCK
      ?auto_109001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108994 ?auto_108995 ) ) ( not ( = ?auto_108994 ?auto_108996 ) ) ( not ( = ?auto_108994 ?auto_108997 ) ) ( not ( = ?auto_108994 ?auto_108998 ) ) ( not ( = ?auto_108994 ?auto_108999 ) ) ( not ( = ?auto_108995 ?auto_108996 ) ) ( not ( = ?auto_108995 ?auto_108997 ) ) ( not ( = ?auto_108995 ?auto_108998 ) ) ( not ( = ?auto_108995 ?auto_108999 ) ) ( not ( = ?auto_108996 ?auto_108997 ) ) ( not ( = ?auto_108996 ?auto_108998 ) ) ( not ( = ?auto_108996 ?auto_108999 ) ) ( not ( = ?auto_108997 ?auto_108998 ) ) ( not ( = ?auto_108997 ?auto_108999 ) ) ( not ( = ?auto_108998 ?auto_108999 ) ) ( ON ?auto_108999 ?auto_109000 ) ( not ( = ?auto_108994 ?auto_109000 ) ) ( not ( = ?auto_108995 ?auto_109000 ) ) ( not ( = ?auto_108996 ?auto_109000 ) ) ( not ( = ?auto_108997 ?auto_109000 ) ) ( not ( = ?auto_108998 ?auto_109000 ) ) ( not ( = ?auto_108999 ?auto_109000 ) ) ( ON ?auto_108998 ?auto_108999 ) ( ON-TABLE ?auto_109000 ) ( ON ?auto_108997 ?auto_108998 ) ( ON ?auto_108996 ?auto_108997 ) ( ON ?auto_108995 ?auto_108996 ) ( CLEAR ?auto_108995 ) ( ON ?auto_108994 ?auto_109001 ) ( CLEAR ?auto_108994 ) ( HAND-EMPTY ) ( not ( = ?auto_108994 ?auto_109001 ) ) ( not ( = ?auto_108995 ?auto_109001 ) ) ( not ( = ?auto_108996 ?auto_109001 ) ) ( not ( = ?auto_108997 ?auto_109001 ) ) ( not ( = ?auto_108998 ?auto_109001 ) ) ( not ( = ?auto_108999 ?auto_109001 ) ) ( not ( = ?auto_109000 ?auto_109001 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108994 ?auto_109001 )
      ( MAKE-6PILE ?auto_108994 ?auto_108995 ?auto_108996 ?auto_108997 ?auto_108998 ?auto_108999 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109002 - BLOCK
      ?auto_109003 - BLOCK
      ?auto_109004 - BLOCK
      ?auto_109005 - BLOCK
      ?auto_109006 - BLOCK
      ?auto_109007 - BLOCK
    )
    :vars
    (
      ?auto_109009 - BLOCK
      ?auto_109008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109002 ?auto_109003 ) ) ( not ( = ?auto_109002 ?auto_109004 ) ) ( not ( = ?auto_109002 ?auto_109005 ) ) ( not ( = ?auto_109002 ?auto_109006 ) ) ( not ( = ?auto_109002 ?auto_109007 ) ) ( not ( = ?auto_109003 ?auto_109004 ) ) ( not ( = ?auto_109003 ?auto_109005 ) ) ( not ( = ?auto_109003 ?auto_109006 ) ) ( not ( = ?auto_109003 ?auto_109007 ) ) ( not ( = ?auto_109004 ?auto_109005 ) ) ( not ( = ?auto_109004 ?auto_109006 ) ) ( not ( = ?auto_109004 ?auto_109007 ) ) ( not ( = ?auto_109005 ?auto_109006 ) ) ( not ( = ?auto_109005 ?auto_109007 ) ) ( not ( = ?auto_109006 ?auto_109007 ) ) ( ON ?auto_109007 ?auto_109009 ) ( not ( = ?auto_109002 ?auto_109009 ) ) ( not ( = ?auto_109003 ?auto_109009 ) ) ( not ( = ?auto_109004 ?auto_109009 ) ) ( not ( = ?auto_109005 ?auto_109009 ) ) ( not ( = ?auto_109006 ?auto_109009 ) ) ( not ( = ?auto_109007 ?auto_109009 ) ) ( ON ?auto_109006 ?auto_109007 ) ( ON-TABLE ?auto_109009 ) ( ON ?auto_109005 ?auto_109006 ) ( ON ?auto_109004 ?auto_109005 ) ( ON ?auto_109002 ?auto_109008 ) ( CLEAR ?auto_109002 ) ( not ( = ?auto_109002 ?auto_109008 ) ) ( not ( = ?auto_109003 ?auto_109008 ) ) ( not ( = ?auto_109004 ?auto_109008 ) ) ( not ( = ?auto_109005 ?auto_109008 ) ) ( not ( = ?auto_109006 ?auto_109008 ) ) ( not ( = ?auto_109007 ?auto_109008 ) ) ( not ( = ?auto_109009 ?auto_109008 ) ) ( HOLDING ?auto_109003 ) ( CLEAR ?auto_109004 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109009 ?auto_109007 ?auto_109006 ?auto_109005 ?auto_109004 ?auto_109003 )
      ( MAKE-6PILE ?auto_109002 ?auto_109003 ?auto_109004 ?auto_109005 ?auto_109006 ?auto_109007 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109010 - BLOCK
      ?auto_109011 - BLOCK
      ?auto_109012 - BLOCK
      ?auto_109013 - BLOCK
      ?auto_109014 - BLOCK
      ?auto_109015 - BLOCK
    )
    :vars
    (
      ?auto_109017 - BLOCK
      ?auto_109016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109010 ?auto_109011 ) ) ( not ( = ?auto_109010 ?auto_109012 ) ) ( not ( = ?auto_109010 ?auto_109013 ) ) ( not ( = ?auto_109010 ?auto_109014 ) ) ( not ( = ?auto_109010 ?auto_109015 ) ) ( not ( = ?auto_109011 ?auto_109012 ) ) ( not ( = ?auto_109011 ?auto_109013 ) ) ( not ( = ?auto_109011 ?auto_109014 ) ) ( not ( = ?auto_109011 ?auto_109015 ) ) ( not ( = ?auto_109012 ?auto_109013 ) ) ( not ( = ?auto_109012 ?auto_109014 ) ) ( not ( = ?auto_109012 ?auto_109015 ) ) ( not ( = ?auto_109013 ?auto_109014 ) ) ( not ( = ?auto_109013 ?auto_109015 ) ) ( not ( = ?auto_109014 ?auto_109015 ) ) ( ON ?auto_109015 ?auto_109017 ) ( not ( = ?auto_109010 ?auto_109017 ) ) ( not ( = ?auto_109011 ?auto_109017 ) ) ( not ( = ?auto_109012 ?auto_109017 ) ) ( not ( = ?auto_109013 ?auto_109017 ) ) ( not ( = ?auto_109014 ?auto_109017 ) ) ( not ( = ?auto_109015 ?auto_109017 ) ) ( ON ?auto_109014 ?auto_109015 ) ( ON-TABLE ?auto_109017 ) ( ON ?auto_109013 ?auto_109014 ) ( ON ?auto_109012 ?auto_109013 ) ( ON ?auto_109010 ?auto_109016 ) ( not ( = ?auto_109010 ?auto_109016 ) ) ( not ( = ?auto_109011 ?auto_109016 ) ) ( not ( = ?auto_109012 ?auto_109016 ) ) ( not ( = ?auto_109013 ?auto_109016 ) ) ( not ( = ?auto_109014 ?auto_109016 ) ) ( not ( = ?auto_109015 ?auto_109016 ) ) ( not ( = ?auto_109017 ?auto_109016 ) ) ( CLEAR ?auto_109012 ) ( ON ?auto_109011 ?auto_109010 ) ( CLEAR ?auto_109011 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109016 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109016 ?auto_109010 )
      ( MAKE-6PILE ?auto_109010 ?auto_109011 ?auto_109012 ?auto_109013 ?auto_109014 ?auto_109015 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109018 - BLOCK
      ?auto_109019 - BLOCK
      ?auto_109020 - BLOCK
      ?auto_109021 - BLOCK
      ?auto_109022 - BLOCK
      ?auto_109023 - BLOCK
    )
    :vars
    (
      ?auto_109024 - BLOCK
      ?auto_109025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109018 ?auto_109019 ) ) ( not ( = ?auto_109018 ?auto_109020 ) ) ( not ( = ?auto_109018 ?auto_109021 ) ) ( not ( = ?auto_109018 ?auto_109022 ) ) ( not ( = ?auto_109018 ?auto_109023 ) ) ( not ( = ?auto_109019 ?auto_109020 ) ) ( not ( = ?auto_109019 ?auto_109021 ) ) ( not ( = ?auto_109019 ?auto_109022 ) ) ( not ( = ?auto_109019 ?auto_109023 ) ) ( not ( = ?auto_109020 ?auto_109021 ) ) ( not ( = ?auto_109020 ?auto_109022 ) ) ( not ( = ?auto_109020 ?auto_109023 ) ) ( not ( = ?auto_109021 ?auto_109022 ) ) ( not ( = ?auto_109021 ?auto_109023 ) ) ( not ( = ?auto_109022 ?auto_109023 ) ) ( ON ?auto_109023 ?auto_109024 ) ( not ( = ?auto_109018 ?auto_109024 ) ) ( not ( = ?auto_109019 ?auto_109024 ) ) ( not ( = ?auto_109020 ?auto_109024 ) ) ( not ( = ?auto_109021 ?auto_109024 ) ) ( not ( = ?auto_109022 ?auto_109024 ) ) ( not ( = ?auto_109023 ?auto_109024 ) ) ( ON ?auto_109022 ?auto_109023 ) ( ON-TABLE ?auto_109024 ) ( ON ?auto_109021 ?auto_109022 ) ( ON ?auto_109018 ?auto_109025 ) ( not ( = ?auto_109018 ?auto_109025 ) ) ( not ( = ?auto_109019 ?auto_109025 ) ) ( not ( = ?auto_109020 ?auto_109025 ) ) ( not ( = ?auto_109021 ?auto_109025 ) ) ( not ( = ?auto_109022 ?auto_109025 ) ) ( not ( = ?auto_109023 ?auto_109025 ) ) ( not ( = ?auto_109024 ?auto_109025 ) ) ( ON ?auto_109019 ?auto_109018 ) ( CLEAR ?auto_109019 ) ( ON-TABLE ?auto_109025 ) ( HOLDING ?auto_109020 ) ( CLEAR ?auto_109021 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109024 ?auto_109023 ?auto_109022 ?auto_109021 ?auto_109020 )
      ( MAKE-6PILE ?auto_109018 ?auto_109019 ?auto_109020 ?auto_109021 ?auto_109022 ?auto_109023 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109026 - BLOCK
      ?auto_109027 - BLOCK
      ?auto_109028 - BLOCK
      ?auto_109029 - BLOCK
      ?auto_109030 - BLOCK
      ?auto_109031 - BLOCK
    )
    :vars
    (
      ?auto_109033 - BLOCK
      ?auto_109032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109026 ?auto_109027 ) ) ( not ( = ?auto_109026 ?auto_109028 ) ) ( not ( = ?auto_109026 ?auto_109029 ) ) ( not ( = ?auto_109026 ?auto_109030 ) ) ( not ( = ?auto_109026 ?auto_109031 ) ) ( not ( = ?auto_109027 ?auto_109028 ) ) ( not ( = ?auto_109027 ?auto_109029 ) ) ( not ( = ?auto_109027 ?auto_109030 ) ) ( not ( = ?auto_109027 ?auto_109031 ) ) ( not ( = ?auto_109028 ?auto_109029 ) ) ( not ( = ?auto_109028 ?auto_109030 ) ) ( not ( = ?auto_109028 ?auto_109031 ) ) ( not ( = ?auto_109029 ?auto_109030 ) ) ( not ( = ?auto_109029 ?auto_109031 ) ) ( not ( = ?auto_109030 ?auto_109031 ) ) ( ON ?auto_109031 ?auto_109033 ) ( not ( = ?auto_109026 ?auto_109033 ) ) ( not ( = ?auto_109027 ?auto_109033 ) ) ( not ( = ?auto_109028 ?auto_109033 ) ) ( not ( = ?auto_109029 ?auto_109033 ) ) ( not ( = ?auto_109030 ?auto_109033 ) ) ( not ( = ?auto_109031 ?auto_109033 ) ) ( ON ?auto_109030 ?auto_109031 ) ( ON-TABLE ?auto_109033 ) ( ON ?auto_109029 ?auto_109030 ) ( ON ?auto_109026 ?auto_109032 ) ( not ( = ?auto_109026 ?auto_109032 ) ) ( not ( = ?auto_109027 ?auto_109032 ) ) ( not ( = ?auto_109028 ?auto_109032 ) ) ( not ( = ?auto_109029 ?auto_109032 ) ) ( not ( = ?auto_109030 ?auto_109032 ) ) ( not ( = ?auto_109031 ?auto_109032 ) ) ( not ( = ?auto_109033 ?auto_109032 ) ) ( ON ?auto_109027 ?auto_109026 ) ( ON-TABLE ?auto_109032 ) ( CLEAR ?auto_109029 ) ( ON ?auto_109028 ?auto_109027 ) ( CLEAR ?auto_109028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109032 ?auto_109026 ?auto_109027 )
      ( MAKE-6PILE ?auto_109026 ?auto_109027 ?auto_109028 ?auto_109029 ?auto_109030 ?auto_109031 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109034 - BLOCK
      ?auto_109035 - BLOCK
      ?auto_109036 - BLOCK
      ?auto_109037 - BLOCK
      ?auto_109038 - BLOCK
      ?auto_109039 - BLOCK
    )
    :vars
    (
      ?auto_109041 - BLOCK
      ?auto_109040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109034 ?auto_109035 ) ) ( not ( = ?auto_109034 ?auto_109036 ) ) ( not ( = ?auto_109034 ?auto_109037 ) ) ( not ( = ?auto_109034 ?auto_109038 ) ) ( not ( = ?auto_109034 ?auto_109039 ) ) ( not ( = ?auto_109035 ?auto_109036 ) ) ( not ( = ?auto_109035 ?auto_109037 ) ) ( not ( = ?auto_109035 ?auto_109038 ) ) ( not ( = ?auto_109035 ?auto_109039 ) ) ( not ( = ?auto_109036 ?auto_109037 ) ) ( not ( = ?auto_109036 ?auto_109038 ) ) ( not ( = ?auto_109036 ?auto_109039 ) ) ( not ( = ?auto_109037 ?auto_109038 ) ) ( not ( = ?auto_109037 ?auto_109039 ) ) ( not ( = ?auto_109038 ?auto_109039 ) ) ( ON ?auto_109039 ?auto_109041 ) ( not ( = ?auto_109034 ?auto_109041 ) ) ( not ( = ?auto_109035 ?auto_109041 ) ) ( not ( = ?auto_109036 ?auto_109041 ) ) ( not ( = ?auto_109037 ?auto_109041 ) ) ( not ( = ?auto_109038 ?auto_109041 ) ) ( not ( = ?auto_109039 ?auto_109041 ) ) ( ON ?auto_109038 ?auto_109039 ) ( ON-TABLE ?auto_109041 ) ( ON ?auto_109034 ?auto_109040 ) ( not ( = ?auto_109034 ?auto_109040 ) ) ( not ( = ?auto_109035 ?auto_109040 ) ) ( not ( = ?auto_109036 ?auto_109040 ) ) ( not ( = ?auto_109037 ?auto_109040 ) ) ( not ( = ?auto_109038 ?auto_109040 ) ) ( not ( = ?auto_109039 ?auto_109040 ) ) ( not ( = ?auto_109041 ?auto_109040 ) ) ( ON ?auto_109035 ?auto_109034 ) ( ON-TABLE ?auto_109040 ) ( ON ?auto_109036 ?auto_109035 ) ( CLEAR ?auto_109036 ) ( HOLDING ?auto_109037 ) ( CLEAR ?auto_109038 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109041 ?auto_109039 ?auto_109038 ?auto_109037 )
      ( MAKE-6PILE ?auto_109034 ?auto_109035 ?auto_109036 ?auto_109037 ?auto_109038 ?auto_109039 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109042 - BLOCK
      ?auto_109043 - BLOCK
      ?auto_109044 - BLOCK
      ?auto_109045 - BLOCK
      ?auto_109046 - BLOCK
      ?auto_109047 - BLOCK
    )
    :vars
    (
      ?auto_109049 - BLOCK
      ?auto_109048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109042 ?auto_109043 ) ) ( not ( = ?auto_109042 ?auto_109044 ) ) ( not ( = ?auto_109042 ?auto_109045 ) ) ( not ( = ?auto_109042 ?auto_109046 ) ) ( not ( = ?auto_109042 ?auto_109047 ) ) ( not ( = ?auto_109043 ?auto_109044 ) ) ( not ( = ?auto_109043 ?auto_109045 ) ) ( not ( = ?auto_109043 ?auto_109046 ) ) ( not ( = ?auto_109043 ?auto_109047 ) ) ( not ( = ?auto_109044 ?auto_109045 ) ) ( not ( = ?auto_109044 ?auto_109046 ) ) ( not ( = ?auto_109044 ?auto_109047 ) ) ( not ( = ?auto_109045 ?auto_109046 ) ) ( not ( = ?auto_109045 ?auto_109047 ) ) ( not ( = ?auto_109046 ?auto_109047 ) ) ( ON ?auto_109047 ?auto_109049 ) ( not ( = ?auto_109042 ?auto_109049 ) ) ( not ( = ?auto_109043 ?auto_109049 ) ) ( not ( = ?auto_109044 ?auto_109049 ) ) ( not ( = ?auto_109045 ?auto_109049 ) ) ( not ( = ?auto_109046 ?auto_109049 ) ) ( not ( = ?auto_109047 ?auto_109049 ) ) ( ON ?auto_109046 ?auto_109047 ) ( ON-TABLE ?auto_109049 ) ( ON ?auto_109042 ?auto_109048 ) ( not ( = ?auto_109042 ?auto_109048 ) ) ( not ( = ?auto_109043 ?auto_109048 ) ) ( not ( = ?auto_109044 ?auto_109048 ) ) ( not ( = ?auto_109045 ?auto_109048 ) ) ( not ( = ?auto_109046 ?auto_109048 ) ) ( not ( = ?auto_109047 ?auto_109048 ) ) ( not ( = ?auto_109049 ?auto_109048 ) ) ( ON ?auto_109043 ?auto_109042 ) ( ON-TABLE ?auto_109048 ) ( ON ?auto_109044 ?auto_109043 ) ( CLEAR ?auto_109046 ) ( ON ?auto_109045 ?auto_109044 ) ( CLEAR ?auto_109045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109048 ?auto_109042 ?auto_109043 ?auto_109044 )
      ( MAKE-6PILE ?auto_109042 ?auto_109043 ?auto_109044 ?auto_109045 ?auto_109046 ?auto_109047 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109050 - BLOCK
      ?auto_109051 - BLOCK
      ?auto_109052 - BLOCK
      ?auto_109053 - BLOCK
      ?auto_109054 - BLOCK
      ?auto_109055 - BLOCK
    )
    :vars
    (
      ?auto_109057 - BLOCK
      ?auto_109056 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109050 ?auto_109051 ) ) ( not ( = ?auto_109050 ?auto_109052 ) ) ( not ( = ?auto_109050 ?auto_109053 ) ) ( not ( = ?auto_109050 ?auto_109054 ) ) ( not ( = ?auto_109050 ?auto_109055 ) ) ( not ( = ?auto_109051 ?auto_109052 ) ) ( not ( = ?auto_109051 ?auto_109053 ) ) ( not ( = ?auto_109051 ?auto_109054 ) ) ( not ( = ?auto_109051 ?auto_109055 ) ) ( not ( = ?auto_109052 ?auto_109053 ) ) ( not ( = ?auto_109052 ?auto_109054 ) ) ( not ( = ?auto_109052 ?auto_109055 ) ) ( not ( = ?auto_109053 ?auto_109054 ) ) ( not ( = ?auto_109053 ?auto_109055 ) ) ( not ( = ?auto_109054 ?auto_109055 ) ) ( ON ?auto_109055 ?auto_109057 ) ( not ( = ?auto_109050 ?auto_109057 ) ) ( not ( = ?auto_109051 ?auto_109057 ) ) ( not ( = ?auto_109052 ?auto_109057 ) ) ( not ( = ?auto_109053 ?auto_109057 ) ) ( not ( = ?auto_109054 ?auto_109057 ) ) ( not ( = ?auto_109055 ?auto_109057 ) ) ( ON-TABLE ?auto_109057 ) ( ON ?auto_109050 ?auto_109056 ) ( not ( = ?auto_109050 ?auto_109056 ) ) ( not ( = ?auto_109051 ?auto_109056 ) ) ( not ( = ?auto_109052 ?auto_109056 ) ) ( not ( = ?auto_109053 ?auto_109056 ) ) ( not ( = ?auto_109054 ?auto_109056 ) ) ( not ( = ?auto_109055 ?auto_109056 ) ) ( not ( = ?auto_109057 ?auto_109056 ) ) ( ON ?auto_109051 ?auto_109050 ) ( ON-TABLE ?auto_109056 ) ( ON ?auto_109052 ?auto_109051 ) ( ON ?auto_109053 ?auto_109052 ) ( CLEAR ?auto_109053 ) ( HOLDING ?auto_109054 ) ( CLEAR ?auto_109055 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109057 ?auto_109055 ?auto_109054 )
      ( MAKE-6PILE ?auto_109050 ?auto_109051 ?auto_109052 ?auto_109053 ?auto_109054 ?auto_109055 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109058 - BLOCK
      ?auto_109059 - BLOCK
      ?auto_109060 - BLOCK
      ?auto_109061 - BLOCK
      ?auto_109062 - BLOCK
      ?auto_109063 - BLOCK
    )
    :vars
    (
      ?auto_109064 - BLOCK
      ?auto_109065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109058 ?auto_109059 ) ) ( not ( = ?auto_109058 ?auto_109060 ) ) ( not ( = ?auto_109058 ?auto_109061 ) ) ( not ( = ?auto_109058 ?auto_109062 ) ) ( not ( = ?auto_109058 ?auto_109063 ) ) ( not ( = ?auto_109059 ?auto_109060 ) ) ( not ( = ?auto_109059 ?auto_109061 ) ) ( not ( = ?auto_109059 ?auto_109062 ) ) ( not ( = ?auto_109059 ?auto_109063 ) ) ( not ( = ?auto_109060 ?auto_109061 ) ) ( not ( = ?auto_109060 ?auto_109062 ) ) ( not ( = ?auto_109060 ?auto_109063 ) ) ( not ( = ?auto_109061 ?auto_109062 ) ) ( not ( = ?auto_109061 ?auto_109063 ) ) ( not ( = ?auto_109062 ?auto_109063 ) ) ( ON ?auto_109063 ?auto_109064 ) ( not ( = ?auto_109058 ?auto_109064 ) ) ( not ( = ?auto_109059 ?auto_109064 ) ) ( not ( = ?auto_109060 ?auto_109064 ) ) ( not ( = ?auto_109061 ?auto_109064 ) ) ( not ( = ?auto_109062 ?auto_109064 ) ) ( not ( = ?auto_109063 ?auto_109064 ) ) ( ON-TABLE ?auto_109064 ) ( ON ?auto_109058 ?auto_109065 ) ( not ( = ?auto_109058 ?auto_109065 ) ) ( not ( = ?auto_109059 ?auto_109065 ) ) ( not ( = ?auto_109060 ?auto_109065 ) ) ( not ( = ?auto_109061 ?auto_109065 ) ) ( not ( = ?auto_109062 ?auto_109065 ) ) ( not ( = ?auto_109063 ?auto_109065 ) ) ( not ( = ?auto_109064 ?auto_109065 ) ) ( ON ?auto_109059 ?auto_109058 ) ( ON-TABLE ?auto_109065 ) ( ON ?auto_109060 ?auto_109059 ) ( ON ?auto_109061 ?auto_109060 ) ( CLEAR ?auto_109063 ) ( ON ?auto_109062 ?auto_109061 ) ( CLEAR ?auto_109062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109065 ?auto_109058 ?auto_109059 ?auto_109060 ?auto_109061 )
      ( MAKE-6PILE ?auto_109058 ?auto_109059 ?auto_109060 ?auto_109061 ?auto_109062 ?auto_109063 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109066 - BLOCK
      ?auto_109067 - BLOCK
      ?auto_109068 - BLOCK
      ?auto_109069 - BLOCK
      ?auto_109070 - BLOCK
      ?auto_109071 - BLOCK
    )
    :vars
    (
      ?auto_109072 - BLOCK
      ?auto_109073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109066 ?auto_109067 ) ) ( not ( = ?auto_109066 ?auto_109068 ) ) ( not ( = ?auto_109066 ?auto_109069 ) ) ( not ( = ?auto_109066 ?auto_109070 ) ) ( not ( = ?auto_109066 ?auto_109071 ) ) ( not ( = ?auto_109067 ?auto_109068 ) ) ( not ( = ?auto_109067 ?auto_109069 ) ) ( not ( = ?auto_109067 ?auto_109070 ) ) ( not ( = ?auto_109067 ?auto_109071 ) ) ( not ( = ?auto_109068 ?auto_109069 ) ) ( not ( = ?auto_109068 ?auto_109070 ) ) ( not ( = ?auto_109068 ?auto_109071 ) ) ( not ( = ?auto_109069 ?auto_109070 ) ) ( not ( = ?auto_109069 ?auto_109071 ) ) ( not ( = ?auto_109070 ?auto_109071 ) ) ( not ( = ?auto_109066 ?auto_109072 ) ) ( not ( = ?auto_109067 ?auto_109072 ) ) ( not ( = ?auto_109068 ?auto_109072 ) ) ( not ( = ?auto_109069 ?auto_109072 ) ) ( not ( = ?auto_109070 ?auto_109072 ) ) ( not ( = ?auto_109071 ?auto_109072 ) ) ( ON-TABLE ?auto_109072 ) ( ON ?auto_109066 ?auto_109073 ) ( not ( = ?auto_109066 ?auto_109073 ) ) ( not ( = ?auto_109067 ?auto_109073 ) ) ( not ( = ?auto_109068 ?auto_109073 ) ) ( not ( = ?auto_109069 ?auto_109073 ) ) ( not ( = ?auto_109070 ?auto_109073 ) ) ( not ( = ?auto_109071 ?auto_109073 ) ) ( not ( = ?auto_109072 ?auto_109073 ) ) ( ON ?auto_109067 ?auto_109066 ) ( ON-TABLE ?auto_109073 ) ( ON ?auto_109068 ?auto_109067 ) ( ON ?auto_109069 ?auto_109068 ) ( ON ?auto_109070 ?auto_109069 ) ( CLEAR ?auto_109070 ) ( HOLDING ?auto_109071 ) ( CLEAR ?auto_109072 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109072 ?auto_109071 )
      ( MAKE-6PILE ?auto_109066 ?auto_109067 ?auto_109068 ?auto_109069 ?auto_109070 ?auto_109071 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109074 - BLOCK
      ?auto_109075 - BLOCK
      ?auto_109076 - BLOCK
      ?auto_109077 - BLOCK
      ?auto_109078 - BLOCK
      ?auto_109079 - BLOCK
    )
    :vars
    (
      ?auto_109081 - BLOCK
      ?auto_109080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109074 ?auto_109075 ) ) ( not ( = ?auto_109074 ?auto_109076 ) ) ( not ( = ?auto_109074 ?auto_109077 ) ) ( not ( = ?auto_109074 ?auto_109078 ) ) ( not ( = ?auto_109074 ?auto_109079 ) ) ( not ( = ?auto_109075 ?auto_109076 ) ) ( not ( = ?auto_109075 ?auto_109077 ) ) ( not ( = ?auto_109075 ?auto_109078 ) ) ( not ( = ?auto_109075 ?auto_109079 ) ) ( not ( = ?auto_109076 ?auto_109077 ) ) ( not ( = ?auto_109076 ?auto_109078 ) ) ( not ( = ?auto_109076 ?auto_109079 ) ) ( not ( = ?auto_109077 ?auto_109078 ) ) ( not ( = ?auto_109077 ?auto_109079 ) ) ( not ( = ?auto_109078 ?auto_109079 ) ) ( not ( = ?auto_109074 ?auto_109081 ) ) ( not ( = ?auto_109075 ?auto_109081 ) ) ( not ( = ?auto_109076 ?auto_109081 ) ) ( not ( = ?auto_109077 ?auto_109081 ) ) ( not ( = ?auto_109078 ?auto_109081 ) ) ( not ( = ?auto_109079 ?auto_109081 ) ) ( ON-TABLE ?auto_109081 ) ( ON ?auto_109074 ?auto_109080 ) ( not ( = ?auto_109074 ?auto_109080 ) ) ( not ( = ?auto_109075 ?auto_109080 ) ) ( not ( = ?auto_109076 ?auto_109080 ) ) ( not ( = ?auto_109077 ?auto_109080 ) ) ( not ( = ?auto_109078 ?auto_109080 ) ) ( not ( = ?auto_109079 ?auto_109080 ) ) ( not ( = ?auto_109081 ?auto_109080 ) ) ( ON ?auto_109075 ?auto_109074 ) ( ON-TABLE ?auto_109080 ) ( ON ?auto_109076 ?auto_109075 ) ( ON ?auto_109077 ?auto_109076 ) ( ON ?auto_109078 ?auto_109077 ) ( CLEAR ?auto_109081 ) ( ON ?auto_109079 ?auto_109078 ) ( CLEAR ?auto_109079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109080 ?auto_109074 ?auto_109075 ?auto_109076 ?auto_109077 ?auto_109078 )
      ( MAKE-6PILE ?auto_109074 ?auto_109075 ?auto_109076 ?auto_109077 ?auto_109078 ?auto_109079 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109082 - BLOCK
      ?auto_109083 - BLOCK
      ?auto_109084 - BLOCK
      ?auto_109085 - BLOCK
      ?auto_109086 - BLOCK
      ?auto_109087 - BLOCK
    )
    :vars
    (
      ?auto_109088 - BLOCK
      ?auto_109089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109082 ?auto_109083 ) ) ( not ( = ?auto_109082 ?auto_109084 ) ) ( not ( = ?auto_109082 ?auto_109085 ) ) ( not ( = ?auto_109082 ?auto_109086 ) ) ( not ( = ?auto_109082 ?auto_109087 ) ) ( not ( = ?auto_109083 ?auto_109084 ) ) ( not ( = ?auto_109083 ?auto_109085 ) ) ( not ( = ?auto_109083 ?auto_109086 ) ) ( not ( = ?auto_109083 ?auto_109087 ) ) ( not ( = ?auto_109084 ?auto_109085 ) ) ( not ( = ?auto_109084 ?auto_109086 ) ) ( not ( = ?auto_109084 ?auto_109087 ) ) ( not ( = ?auto_109085 ?auto_109086 ) ) ( not ( = ?auto_109085 ?auto_109087 ) ) ( not ( = ?auto_109086 ?auto_109087 ) ) ( not ( = ?auto_109082 ?auto_109088 ) ) ( not ( = ?auto_109083 ?auto_109088 ) ) ( not ( = ?auto_109084 ?auto_109088 ) ) ( not ( = ?auto_109085 ?auto_109088 ) ) ( not ( = ?auto_109086 ?auto_109088 ) ) ( not ( = ?auto_109087 ?auto_109088 ) ) ( ON ?auto_109082 ?auto_109089 ) ( not ( = ?auto_109082 ?auto_109089 ) ) ( not ( = ?auto_109083 ?auto_109089 ) ) ( not ( = ?auto_109084 ?auto_109089 ) ) ( not ( = ?auto_109085 ?auto_109089 ) ) ( not ( = ?auto_109086 ?auto_109089 ) ) ( not ( = ?auto_109087 ?auto_109089 ) ) ( not ( = ?auto_109088 ?auto_109089 ) ) ( ON ?auto_109083 ?auto_109082 ) ( ON-TABLE ?auto_109089 ) ( ON ?auto_109084 ?auto_109083 ) ( ON ?auto_109085 ?auto_109084 ) ( ON ?auto_109086 ?auto_109085 ) ( ON ?auto_109087 ?auto_109086 ) ( CLEAR ?auto_109087 ) ( HOLDING ?auto_109088 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109088 )
      ( MAKE-6PILE ?auto_109082 ?auto_109083 ?auto_109084 ?auto_109085 ?auto_109086 ?auto_109087 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109090 - BLOCK
      ?auto_109091 - BLOCK
      ?auto_109092 - BLOCK
      ?auto_109093 - BLOCK
      ?auto_109094 - BLOCK
      ?auto_109095 - BLOCK
    )
    :vars
    (
      ?auto_109097 - BLOCK
      ?auto_109096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109090 ?auto_109091 ) ) ( not ( = ?auto_109090 ?auto_109092 ) ) ( not ( = ?auto_109090 ?auto_109093 ) ) ( not ( = ?auto_109090 ?auto_109094 ) ) ( not ( = ?auto_109090 ?auto_109095 ) ) ( not ( = ?auto_109091 ?auto_109092 ) ) ( not ( = ?auto_109091 ?auto_109093 ) ) ( not ( = ?auto_109091 ?auto_109094 ) ) ( not ( = ?auto_109091 ?auto_109095 ) ) ( not ( = ?auto_109092 ?auto_109093 ) ) ( not ( = ?auto_109092 ?auto_109094 ) ) ( not ( = ?auto_109092 ?auto_109095 ) ) ( not ( = ?auto_109093 ?auto_109094 ) ) ( not ( = ?auto_109093 ?auto_109095 ) ) ( not ( = ?auto_109094 ?auto_109095 ) ) ( not ( = ?auto_109090 ?auto_109097 ) ) ( not ( = ?auto_109091 ?auto_109097 ) ) ( not ( = ?auto_109092 ?auto_109097 ) ) ( not ( = ?auto_109093 ?auto_109097 ) ) ( not ( = ?auto_109094 ?auto_109097 ) ) ( not ( = ?auto_109095 ?auto_109097 ) ) ( ON ?auto_109090 ?auto_109096 ) ( not ( = ?auto_109090 ?auto_109096 ) ) ( not ( = ?auto_109091 ?auto_109096 ) ) ( not ( = ?auto_109092 ?auto_109096 ) ) ( not ( = ?auto_109093 ?auto_109096 ) ) ( not ( = ?auto_109094 ?auto_109096 ) ) ( not ( = ?auto_109095 ?auto_109096 ) ) ( not ( = ?auto_109097 ?auto_109096 ) ) ( ON ?auto_109091 ?auto_109090 ) ( ON-TABLE ?auto_109096 ) ( ON ?auto_109092 ?auto_109091 ) ( ON ?auto_109093 ?auto_109092 ) ( ON ?auto_109094 ?auto_109093 ) ( ON ?auto_109095 ?auto_109094 ) ( ON ?auto_109097 ?auto_109095 ) ( CLEAR ?auto_109097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109096 ?auto_109090 ?auto_109091 ?auto_109092 ?auto_109093 ?auto_109094 ?auto_109095 )
      ( MAKE-6PILE ?auto_109090 ?auto_109091 ?auto_109092 ?auto_109093 ?auto_109094 ?auto_109095 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109112 - BLOCK
      ?auto_109113 - BLOCK
      ?auto_109114 - BLOCK
      ?auto_109115 - BLOCK
      ?auto_109116 - BLOCK
      ?auto_109117 - BLOCK
      ?auto_109118 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109117 ) ( ON-TABLE ?auto_109112 ) ( ON ?auto_109113 ?auto_109112 ) ( ON ?auto_109114 ?auto_109113 ) ( ON ?auto_109115 ?auto_109114 ) ( ON ?auto_109116 ?auto_109115 ) ( ON ?auto_109117 ?auto_109116 ) ( not ( = ?auto_109112 ?auto_109113 ) ) ( not ( = ?auto_109112 ?auto_109114 ) ) ( not ( = ?auto_109112 ?auto_109115 ) ) ( not ( = ?auto_109112 ?auto_109116 ) ) ( not ( = ?auto_109112 ?auto_109117 ) ) ( not ( = ?auto_109112 ?auto_109118 ) ) ( not ( = ?auto_109113 ?auto_109114 ) ) ( not ( = ?auto_109113 ?auto_109115 ) ) ( not ( = ?auto_109113 ?auto_109116 ) ) ( not ( = ?auto_109113 ?auto_109117 ) ) ( not ( = ?auto_109113 ?auto_109118 ) ) ( not ( = ?auto_109114 ?auto_109115 ) ) ( not ( = ?auto_109114 ?auto_109116 ) ) ( not ( = ?auto_109114 ?auto_109117 ) ) ( not ( = ?auto_109114 ?auto_109118 ) ) ( not ( = ?auto_109115 ?auto_109116 ) ) ( not ( = ?auto_109115 ?auto_109117 ) ) ( not ( = ?auto_109115 ?auto_109118 ) ) ( not ( = ?auto_109116 ?auto_109117 ) ) ( not ( = ?auto_109116 ?auto_109118 ) ) ( not ( = ?auto_109117 ?auto_109118 ) ) ( ON-TABLE ?auto_109118 ) ( CLEAR ?auto_109118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_109118 )
      ( MAKE-7PILE ?auto_109112 ?auto_109113 ?auto_109114 ?auto_109115 ?auto_109116 ?auto_109117 ?auto_109118 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109119 - BLOCK
      ?auto_109120 - BLOCK
      ?auto_109121 - BLOCK
      ?auto_109122 - BLOCK
      ?auto_109123 - BLOCK
      ?auto_109124 - BLOCK
      ?auto_109125 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109119 ) ( ON ?auto_109120 ?auto_109119 ) ( ON ?auto_109121 ?auto_109120 ) ( ON ?auto_109122 ?auto_109121 ) ( ON ?auto_109123 ?auto_109122 ) ( not ( = ?auto_109119 ?auto_109120 ) ) ( not ( = ?auto_109119 ?auto_109121 ) ) ( not ( = ?auto_109119 ?auto_109122 ) ) ( not ( = ?auto_109119 ?auto_109123 ) ) ( not ( = ?auto_109119 ?auto_109124 ) ) ( not ( = ?auto_109119 ?auto_109125 ) ) ( not ( = ?auto_109120 ?auto_109121 ) ) ( not ( = ?auto_109120 ?auto_109122 ) ) ( not ( = ?auto_109120 ?auto_109123 ) ) ( not ( = ?auto_109120 ?auto_109124 ) ) ( not ( = ?auto_109120 ?auto_109125 ) ) ( not ( = ?auto_109121 ?auto_109122 ) ) ( not ( = ?auto_109121 ?auto_109123 ) ) ( not ( = ?auto_109121 ?auto_109124 ) ) ( not ( = ?auto_109121 ?auto_109125 ) ) ( not ( = ?auto_109122 ?auto_109123 ) ) ( not ( = ?auto_109122 ?auto_109124 ) ) ( not ( = ?auto_109122 ?auto_109125 ) ) ( not ( = ?auto_109123 ?auto_109124 ) ) ( not ( = ?auto_109123 ?auto_109125 ) ) ( not ( = ?auto_109124 ?auto_109125 ) ) ( ON-TABLE ?auto_109125 ) ( CLEAR ?auto_109125 ) ( HOLDING ?auto_109124 ) ( CLEAR ?auto_109123 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109119 ?auto_109120 ?auto_109121 ?auto_109122 ?auto_109123 ?auto_109124 )
      ( MAKE-7PILE ?auto_109119 ?auto_109120 ?auto_109121 ?auto_109122 ?auto_109123 ?auto_109124 ?auto_109125 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109126 - BLOCK
      ?auto_109127 - BLOCK
      ?auto_109128 - BLOCK
      ?auto_109129 - BLOCK
      ?auto_109130 - BLOCK
      ?auto_109131 - BLOCK
      ?auto_109132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109126 ) ( ON ?auto_109127 ?auto_109126 ) ( ON ?auto_109128 ?auto_109127 ) ( ON ?auto_109129 ?auto_109128 ) ( ON ?auto_109130 ?auto_109129 ) ( not ( = ?auto_109126 ?auto_109127 ) ) ( not ( = ?auto_109126 ?auto_109128 ) ) ( not ( = ?auto_109126 ?auto_109129 ) ) ( not ( = ?auto_109126 ?auto_109130 ) ) ( not ( = ?auto_109126 ?auto_109131 ) ) ( not ( = ?auto_109126 ?auto_109132 ) ) ( not ( = ?auto_109127 ?auto_109128 ) ) ( not ( = ?auto_109127 ?auto_109129 ) ) ( not ( = ?auto_109127 ?auto_109130 ) ) ( not ( = ?auto_109127 ?auto_109131 ) ) ( not ( = ?auto_109127 ?auto_109132 ) ) ( not ( = ?auto_109128 ?auto_109129 ) ) ( not ( = ?auto_109128 ?auto_109130 ) ) ( not ( = ?auto_109128 ?auto_109131 ) ) ( not ( = ?auto_109128 ?auto_109132 ) ) ( not ( = ?auto_109129 ?auto_109130 ) ) ( not ( = ?auto_109129 ?auto_109131 ) ) ( not ( = ?auto_109129 ?auto_109132 ) ) ( not ( = ?auto_109130 ?auto_109131 ) ) ( not ( = ?auto_109130 ?auto_109132 ) ) ( not ( = ?auto_109131 ?auto_109132 ) ) ( ON-TABLE ?auto_109132 ) ( CLEAR ?auto_109130 ) ( ON ?auto_109131 ?auto_109132 ) ( CLEAR ?auto_109131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109132 )
      ( MAKE-7PILE ?auto_109126 ?auto_109127 ?auto_109128 ?auto_109129 ?auto_109130 ?auto_109131 ?auto_109132 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109133 - BLOCK
      ?auto_109134 - BLOCK
      ?auto_109135 - BLOCK
      ?auto_109136 - BLOCK
      ?auto_109137 - BLOCK
      ?auto_109138 - BLOCK
      ?auto_109139 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109133 ) ( ON ?auto_109134 ?auto_109133 ) ( ON ?auto_109135 ?auto_109134 ) ( ON ?auto_109136 ?auto_109135 ) ( not ( = ?auto_109133 ?auto_109134 ) ) ( not ( = ?auto_109133 ?auto_109135 ) ) ( not ( = ?auto_109133 ?auto_109136 ) ) ( not ( = ?auto_109133 ?auto_109137 ) ) ( not ( = ?auto_109133 ?auto_109138 ) ) ( not ( = ?auto_109133 ?auto_109139 ) ) ( not ( = ?auto_109134 ?auto_109135 ) ) ( not ( = ?auto_109134 ?auto_109136 ) ) ( not ( = ?auto_109134 ?auto_109137 ) ) ( not ( = ?auto_109134 ?auto_109138 ) ) ( not ( = ?auto_109134 ?auto_109139 ) ) ( not ( = ?auto_109135 ?auto_109136 ) ) ( not ( = ?auto_109135 ?auto_109137 ) ) ( not ( = ?auto_109135 ?auto_109138 ) ) ( not ( = ?auto_109135 ?auto_109139 ) ) ( not ( = ?auto_109136 ?auto_109137 ) ) ( not ( = ?auto_109136 ?auto_109138 ) ) ( not ( = ?auto_109136 ?auto_109139 ) ) ( not ( = ?auto_109137 ?auto_109138 ) ) ( not ( = ?auto_109137 ?auto_109139 ) ) ( not ( = ?auto_109138 ?auto_109139 ) ) ( ON-TABLE ?auto_109139 ) ( ON ?auto_109138 ?auto_109139 ) ( CLEAR ?auto_109138 ) ( HOLDING ?auto_109137 ) ( CLEAR ?auto_109136 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109133 ?auto_109134 ?auto_109135 ?auto_109136 ?auto_109137 )
      ( MAKE-7PILE ?auto_109133 ?auto_109134 ?auto_109135 ?auto_109136 ?auto_109137 ?auto_109138 ?auto_109139 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109140 - BLOCK
      ?auto_109141 - BLOCK
      ?auto_109142 - BLOCK
      ?auto_109143 - BLOCK
      ?auto_109144 - BLOCK
      ?auto_109145 - BLOCK
      ?auto_109146 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109140 ) ( ON ?auto_109141 ?auto_109140 ) ( ON ?auto_109142 ?auto_109141 ) ( ON ?auto_109143 ?auto_109142 ) ( not ( = ?auto_109140 ?auto_109141 ) ) ( not ( = ?auto_109140 ?auto_109142 ) ) ( not ( = ?auto_109140 ?auto_109143 ) ) ( not ( = ?auto_109140 ?auto_109144 ) ) ( not ( = ?auto_109140 ?auto_109145 ) ) ( not ( = ?auto_109140 ?auto_109146 ) ) ( not ( = ?auto_109141 ?auto_109142 ) ) ( not ( = ?auto_109141 ?auto_109143 ) ) ( not ( = ?auto_109141 ?auto_109144 ) ) ( not ( = ?auto_109141 ?auto_109145 ) ) ( not ( = ?auto_109141 ?auto_109146 ) ) ( not ( = ?auto_109142 ?auto_109143 ) ) ( not ( = ?auto_109142 ?auto_109144 ) ) ( not ( = ?auto_109142 ?auto_109145 ) ) ( not ( = ?auto_109142 ?auto_109146 ) ) ( not ( = ?auto_109143 ?auto_109144 ) ) ( not ( = ?auto_109143 ?auto_109145 ) ) ( not ( = ?auto_109143 ?auto_109146 ) ) ( not ( = ?auto_109144 ?auto_109145 ) ) ( not ( = ?auto_109144 ?auto_109146 ) ) ( not ( = ?auto_109145 ?auto_109146 ) ) ( ON-TABLE ?auto_109146 ) ( ON ?auto_109145 ?auto_109146 ) ( CLEAR ?auto_109143 ) ( ON ?auto_109144 ?auto_109145 ) ( CLEAR ?auto_109144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109146 ?auto_109145 )
      ( MAKE-7PILE ?auto_109140 ?auto_109141 ?auto_109142 ?auto_109143 ?auto_109144 ?auto_109145 ?auto_109146 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109147 - BLOCK
      ?auto_109148 - BLOCK
      ?auto_109149 - BLOCK
      ?auto_109150 - BLOCK
      ?auto_109151 - BLOCK
      ?auto_109152 - BLOCK
      ?auto_109153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109147 ) ( ON ?auto_109148 ?auto_109147 ) ( ON ?auto_109149 ?auto_109148 ) ( not ( = ?auto_109147 ?auto_109148 ) ) ( not ( = ?auto_109147 ?auto_109149 ) ) ( not ( = ?auto_109147 ?auto_109150 ) ) ( not ( = ?auto_109147 ?auto_109151 ) ) ( not ( = ?auto_109147 ?auto_109152 ) ) ( not ( = ?auto_109147 ?auto_109153 ) ) ( not ( = ?auto_109148 ?auto_109149 ) ) ( not ( = ?auto_109148 ?auto_109150 ) ) ( not ( = ?auto_109148 ?auto_109151 ) ) ( not ( = ?auto_109148 ?auto_109152 ) ) ( not ( = ?auto_109148 ?auto_109153 ) ) ( not ( = ?auto_109149 ?auto_109150 ) ) ( not ( = ?auto_109149 ?auto_109151 ) ) ( not ( = ?auto_109149 ?auto_109152 ) ) ( not ( = ?auto_109149 ?auto_109153 ) ) ( not ( = ?auto_109150 ?auto_109151 ) ) ( not ( = ?auto_109150 ?auto_109152 ) ) ( not ( = ?auto_109150 ?auto_109153 ) ) ( not ( = ?auto_109151 ?auto_109152 ) ) ( not ( = ?auto_109151 ?auto_109153 ) ) ( not ( = ?auto_109152 ?auto_109153 ) ) ( ON-TABLE ?auto_109153 ) ( ON ?auto_109152 ?auto_109153 ) ( ON ?auto_109151 ?auto_109152 ) ( CLEAR ?auto_109151 ) ( HOLDING ?auto_109150 ) ( CLEAR ?auto_109149 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109147 ?auto_109148 ?auto_109149 ?auto_109150 )
      ( MAKE-7PILE ?auto_109147 ?auto_109148 ?auto_109149 ?auto_109150 ?auto_109151 ?auto_109152 ?auto_109153 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109154 - BLOCK
      ?auto_109155 - BLOCK
      ?auto_109156 - BLOCK
      ?auto_109157 - BLOCK
      ?auto_109158 - BLOCK
      ?auto_109159 - BLOCK
      ?auto_109160 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109154 ) ( ON ?auto_109155 ?auto_109154 ) ( ON ?auto_109156 ?auto_109155 ) ( not ( = ?auto_109154 ?auto_109155 ) ) ( not ( = ?auto_109154 ?auto_109156 ) ) ( not ( = ?auto_109154 ?auto_109157 ) ) ( not ( = ?auto_109154 ?auto_109158 ) ) ( not ( = ?auto_109154 ?auto_109159 ) ) ( not ( = ?auto_109154 ?auto_109160 ) ) ( not ( = ?auto_109155 ?auto_109156 ) ) ( not ( = ?auto_109155 ?auto_109157 ) ) ( not ( = ?auto_109155 ?auto_109158 ) ) ( not ( = ?auto_109155 ?auto_109159 ) ) ( not ( = ?auto_109155 ?auto_109160 ) ) ( not ( = ?auto_109156 ?auto_109157 ) ) ( not ( = ?auto_109156 ?auto_109158 ) ) ( not ( = ?auto_109156 ?auto_109159 ) ) ( not ( = ?auto_109156 ?auto_109160 ) ) ( not ( = ?auto_109157 ?auto_109158 ) ) ( not ( = ?auto_109157 ?auto_109159 ) ) ( not ( = ?auto_109157 ?auto_109160 ) ) ( not ( = ?auto_109158 ?auto_109159 ) ) ( not ( = ?auto_109158 ?auto_109160 ) ) ( not ( = ?auto_109159 ?auto_109160 ) ) ( ON-TABLE ?auto_109160 ) ( ON ?auto_109159 ?auto_109160 ) ( ON ?auto_109158 ?auto_109159 ) ( CLEAR ?auto_109156 ) ( ON ?auto_109157 ?auto_109158 ) ( CLEAR ?auto_109157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109160 ?auto_109159 ?auto_109158 )
      ( MAKE-7PILE ?auto_109154 ?auto_109155 ?auto_109156 ?auto_109157 ?auto_109158 ?auto_109159 ?auto_109160 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109161 - BLOCK
      ?auto_109162 - BLOCK
      ?auto_109163 - BLOCK
      ?auto_109164 - BLOCK
      ?auto_109165 - BLOCK
      ?auto_109166 - BLOCK
      ?auto_109167 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109161 ) ( ON ?auto_109162 ?auto_109161 ) ( not ( = ?auto_109161 ?auto_109162 ) ) ( not ( = ?auto_109161 ?auto_109163 ) ) ( not ( = ?auto_109161 ?auto_109164 ) ) ( not ( = ?auto_109161 ?auto_109165 ) ) ( not ( = ?auto_109161 ?auto_109166 ) ) ( not ( = ?auto_109161 ?auto_109167 ) ) ( not ( = ?auto_109162 ?auto_109163 ) ) ( not ( = ?auto_109162 ?auto_109164 ) ) ( not ( = ?auto_109162 ?auto_109165 ) ) ( not ( = ?auto_109162 ?auto_109166 ) ) ( not ( = ?auto_109162 ?auto_109167 ) ) ( not ( = ?auto_109163 ?auto_109164 ) ) ( not ( = ?auto_109163 ?auto_109165 ) ) ( not ( = ?auto_109163 ?auto_109166 ) ) ( not ( = ?auto_109163 ?auto_109167 ) ) ( not ( = ?auto_109164 ?auto_109165 ) ) ( not ( = ?auto_109164 ?auto_109166 ) ) ( not ( = ?auto_109164 ?auto_109167 ) ) ( not ( = ?auto_109165 ?auto_109166 ) ) ( not ( = ?auto_109165 ?auto_109167 ) ) ( not ( = ?auto_109166 ?auto_109167 ) ) ( ON-TABLE ?auto_109167 ) ( ON ?auto_109166 ?auto_109167 ) ( ON ?auto_109165 ?auto_109166 ) ( ON ?auto_109164 ?auto_109165 ) ( CLEAR ?auto_109164 ) ( HOLDING ?auto_109163 ) ( CLEAR ?auto_109162 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109161 ?auto_109162 ?auto_109163 )
      ( MAKE-7PILE ?auto_109161 ?auto_109162 ?auto_109163 ?auto_109164 ?auto_109165 ?auto_109166 ?auto_109167 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109168 - BLOCK
      ?auto_109169 - BLOCK
      ?auto_109170 - BLOCK
      ?auto_109171 - BLOCK
      ?auto_109172 - BLOCK
      ?auto_109173 - BLOCK
      ?auto_109174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109168 ) ( ON ?auto_109169 ?auto_109168 ) ( not ( = ?auto_109168 ?auto_109169 ) ) ( not ( = ?auto_109168 ?auto_109170 ) ) ( not ( = ?auto_109168 ?auto_109171 ) ) ( not ( = ?auto_109168 ?auto_109172 ) ) ( not ( = ?auto_109168 ?auto_109173 ) ) ( not ( = ?auto_109168 ?auto_109174 ) ) ( not ( = ?auto_109169 ?auto_109170 ) ) ( not ( = ?auto_109169 ?auto_109171 ) ) ( not ( = ?auto_109169 ?auto_109172 ) ) ( not ( = ?auto_109169 ?auto_109173 ) ) ( not ( = ?auto_109169 ?auto_109174 ) ) ( not ( = ?auto_109170 ?auto_109171 ) ) ( not ( = ?auto_109170 ?auto_109172 ) ) ( not ( = ?auto_109170 ?auto_109173 ) ) ( not ( = ?auto_109170 ?auto_109174 ) ) ( not ( = ?auto_109171 ?auto_109172 ) ) ( not ( = ?auto_109171 ?auto_109173 ) ) ( not ( = ?auto_109171 ?auto_109174 ) ) ( not ( = ?auto_109172 ?auto_109173 ) ) ( not ( = ?auto_109172 ?auto_109174 ) ) ( not ( = ?auto_109173 ?auto_109174 ) ) ( ON-TABLE ?auto_109174 ) ( ON ?auto_109173 ?auto_109174 ) ( ON ?auto_109172 ?auto_109173 ) ( ON ?auto_109171 ?auto_109172 ) ( CLEAR ?auto_109169 ) ( ON ?auto_109170 ?auto_109171 ) ( CLEAR ?auto_109170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109174 ?auto_109173 ?auto_109172 ?auto_109171 )
      ( MAKE-7PILE ?auto_109168 ?auto_109169 ?auto_109170 ?auto_109171 ?auto_109172 ?auto_109173 ?auto_109174 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109175 - BLOCK
      ?auto_109176 - BLOCK
      ?auto_109177 - BLOCK
      ?auto_109178 - BLOCK
      ?auto_109179 - BLOCK
      ?auto_109180 - BLOCK
      ?auto_109181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109175 ) ( not ( = ?auto_109175 ?auto_109176 ) ) ( not ( = ?auto_109175 ?auto_109177 ) ) ( not ( = ?auto_109175 ?auto_109178 ) ) ( not ( = ?auto_109175 ?auto_109179 ) ) ( not ( = ?auto_109175 ?auto_109180 ) ) ( not ( = ?auto_109175 ?auto_109181 ) ) ( not ( = ?auto_109176 ?auto_109177 ) ) ( not ( = ?auto_109176 ?auto_109178 ) ) ( not ( = ?auto_109176 ?auto_109179 ) ) ( not ( = ?auto_109176 ?auto_109180 ) ) ( not ( = ?auto_109176 ?auto_109181 ) ) ( not ( = ?auto_109177 ?auto_109178 ) ) ( not ( = ?auto_109177 ?auto_109179 ) ) ( not ( = ?auto_109177 ?auto_109180 ) ) ( not ( = ?auto_109177 ?auto_109181 ) ) ( not ( = ?auto_109178 ?auto_109179 ) ) ( not ( = ?auto_109178 ?auto_109180 ) ) ( not ( = ?auto_109178 ?auto_109181 ) ) ( not ( = ?auto_109179 ?auto_109180 ) ) ( not ( = ?auto_109179 ?auto_109181 ) ) ( not ( = ?auto_109180 ?auto_109181 ) ) ( ON-TABLE ?auto_109181 ) ( ON ?auto_109180 ?auto_109181 ) ( ON ?auto_109179 ?auto_109180 ) ( ON ?auto_109178 ?auto_109179 ) ( ON ?auto_109177 ?auto_109178 ) ( CLEAR ?auto_109177 ) ( HOLDING ?auto_109176 ) ( CLEAR ?auto_109175 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109175 ?auto_109176 )
      ( MAKE-7PILE ?auto_109175 ?auto_109176 ?auto_109177 ?auto_109178 ?auto_109179 ?auto_109180 ?auto_109181 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109182 - BLOCK
      ?auto_109183 - BLOCK
      ?auto_109184 - BLOCK
      ?auto_109185 - BLOCK
      ?auto_109186 - BLOCK
      ?auto_109187 - BLOCK
      ?auto_109188 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109182 ) ( not ( = ?auto_109182 ?auto_109183 ) ) ( not ( = ?auto_109182 ?auto_109184 ) ) ( not ( = ?auto_109182 ?auto_109185 ) ) ( not ( = ?auto_109182 ?auto_109186 ) ) ( not ( = ?auto_109182 ?auto_109187 ) ) ( not ( = ?auto_109182 ?auto_109188 ) ) ( not ( = ?auto_109183 ?auto_109184 ) ) ( not ( = ?auto_109183 ?auto_109185 ) ) ( not ( = ?auto_109183 ?auto_109186 ) ) ( not ( = ?auto_109183 ?auto_109187 ) ) ( not ( = ?auto_109183 ?auto_109188 ) ) ( not ( = ?auto_109184 ?auto_109185 ) ) ( not ( = ?auto_109184 ?auto_109186 ) ) ( not ( = ?auto_109184 ?auto_109187 ) ) ( not ( = ?auto_109184 ?auto_109188 ) ) ( not ( = ?auto_109185 ?auto_109186 ) ) ( not ( = ?auto_109185 ?auto_109187 ) ) ( not ( = ?auto_109185 ?auto_109188 ) ) ( not ( = ?auto_109186 ?auto_109187 ) ) ( not ( = ?auto_109186 ?auto_109188 ) ) ( not ( = ?auto_109187 ?auto_109188 ) ) ( ON-TABLE ?auto_109188 ) ( ON ?auto_109187 ?auto_109188 ) ( ON ?auto_109186 ?auto_109187 ) ( ON ?auto_109185 ?auto_109186 ) ( ON ?auto_109184 ?auto_109185 ) ( CLEAR ?auto_109182 ) ( ON ?auto_109183 ?auto_109184 ) ( CLEAR ?auto_109183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109188 ?auto_109187 ?auto_109186 ?auto_109185 ?auto_109184 )
      ( MAKE-7PILE ?auto_109182 ?auto_109183 ?auto_109184 ?auto_109185 ?auto_109186 ?auto_109187 ?auto_109188 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109189 - BLOCK
      ?auto_109190 - BLOCK
      ?auto_109191 - BLOCK
      ?auto_109192 - BLOCK
      ?auto_109193 - BLOCK
      ?auto_109194 - BLOCK
      ?auto_109195 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109189 ?auto_109190 ) ) ( not ( = ?auto_109189 ?auto_109191 ) ) ( not ( = ?auto_109189 ?auto_109192 ) ) ( not ( = ?auto_109189 ?auto_109193 ) ) ( not ( = ?auto_109189 ?auto_109194 ) ) ( not ( = ?auto_109189 ?auto_109195 ) ) ( not ( = ?auto_109190 ?auto_109191 ) ) ( not ( = ?auto_109190 ?auto_109192 ) ) ( not ( = ?auto_109190 ?auto_109193 ) ) ( not ( = ?auto_109190 ?auto_109194 ) ) ( not ( = ?auto_109190 ?auto_109195 ) ) ( not ( = ?auto_109191 ?auto_109192 ) ) ( not ( = ?auto_109191 ?auto_109193 ) ) ( not ( = ?auto_109191 ?auto_109194 ) ) ( not ( = ?auto_109191 ?auto_109195 ) ) ( not ( = ?auto_109192 ?auto_109193 ) ) ( not ( = ?auto_109192 ?auto_109194 ) ) ( not ( = ?auto_109192 ?auto_109195 ) ) ( not ( = ?auto_109193 ?auto_109194 ) ) ( not ( = ?auto_109193 ?auto_109195 ) ) ( not ( = ?auto_109194 ?auto_109195 ) ) ( ON-TABLE ?auto_109195 ) ( ON ?auto_109194 ?auto_109195 ) ( ON ?auto_109193 ?auto_109194 ) ( ON ?auto_109192 ?auto_109193 ) ( ON ?auto_109191 ?auto_109192 ) ( ON ?auto_109190 ?auto_109191 ) ( CLEAR ?auto_109190 ) ( HOLDING ?auto_109189 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109189 )
      ( MAKE-7PILE ?auto_109189 ?auto_109190 ?auto_109191 ?auto_109192 ?auto_109193 ?auto_109194 ?auto_109195 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109196 - BLOCK
      ?auto_109197 - BLOCK
      ?auto_109198 - BLOCK
      ?auto_109199 - BLOCK
      ?auto_109200 - BLOCK
      ?auto_109201 - BLOCK
      ?auto_109202 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109196 ?auto_109197 ) ) ( not ( = ?auto_109196 ?auto_109198 ) ) ( not ( = ?auto_109196 ?auto_109199 ) ) ( not ( = ?auto_109196 ?auto_109200 ) ) ( not ( = ?auto_109196 ?auto_109201 ) ) ( not ( = ?auto_109196 ?auto_109202 ) ) ( not ( = ?auto_109197 ?auto_109198 ) ) ( not ( = ?auto_109197 ?auto_109199 ) ) ( not ( = ?auto_109197 ?auto_109200 ) ) ( not ( = ?auto_109197 ?auto_109201 ) ) ( not ( = ?auto_109197 ?auto_109202 ) ) ( not ( = ?auto_109198 ?auto_109199 ) ) ( not ( = ?auto_109198 ?auto_109200 ) ) ( not ( = ?auto_109198 ?auto_109201 ) ) ( not ( = ?auto_109198 ?auto_109202 ) ) ( not ( = ?auto_109199 ?auto_109200 ) ) ( not ( = ?auto_109199 ?auto_109201 ) ) ( not ( = ?auto_109199 ?auto_109202 ) ) ( not ( = ?auto_109200 ?auto_109201 ) ) ( not ( = ?auto_109200 ?auto_109202 ) ) ( not ( = ?auto_109201 ?auto_109202 ) ) ( ON-TABLE ?auto_109202 ) ( ON ?auto_109201 ?auto_109202 ) ( ON ?auto_109200 ?auto_109201 ) ( ON ?auto_109199 ?auto_109200 ) ( ON ?auto_109198 ?auto_109199 ) ( ON ?auto_109197 ?auto_109198 ) ( ON ?auto_109196 ?auto_109197 ) ( CLEAR ?auto_109196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109202 ?auto_109201 ?auto_109200 ?auto_109199 ?auto_109198 ?auto_109197 )
      ( MAKE-7PILE ?auto_109196 ?auto_109197 ?auto_109198 ?auto_109199 ?auto_109200 ?auto_109201 ?auto_109202 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109210 - BLOCK
      ?auto_109211 - BLOCK
      ?auto_109212 - BLOCK
      ?auto_109213 - BLOCK
      ?auto_109214 - BLOCK
      ?auto_109215 - BLOCK
      ?auto_109216 - BLOCK
    )
    :vars
    (
      ?auto_109217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109210 ?auto_109211 ) ) ( not ( = ?auto_109210 ?auto_109212 ) ) ( not ( = ?auto_109210 ?auto_109213 ) ) ( not ( = ?auto_109210 ?auto_109214 ) ) ( not ( = ?auto_109210 ?auto_109215 ) ) ( not ( = ?auto_109210 ?auto_109216 ) ) ( not ( = ?auto_109211 ?auto_109212 ) ) ( not ( = ?auto_109211 ?auto_109213 ) ) ( not ( = ?auto_109211 ?auto_109214 ) ) ( not ( = ?auto_109211 ?auto_109215 ) ) ( not ( = ?auto_109211 ?auto_109216 ) ) ( not ( = ?auto_109212 ?auto_109213 ) ) ( not ( = ?auto_109212 ?auto_109214 ) ) ( not ( = ?auto_109212 ?auto_109215 ) ) ( not ( = ?auto_109212 ?auto_109216 ) ) ( not ( = ?auto_109213 ?auto_109214 ) ) ( not ( = ?auto_109213 ?auto_109215 ) ) ( not ( = ?auto_109213 ?auto_109216 ) ) ( not ( = ?auto_109214 ?auto_109215 ) ) ( not ( = ?auto_109214 ?auto_109216 ) ) ( not ( = ?auto_109215 ?auto_109216 ) ) ( ON-TABLE ?auto_109216 ) ( ON ?auto_109215 ?auto_109216 ) ( ON ?auto_109214 ?auto_109215 ) ( ON ?auto_109213 ?auto_109214 ) ( ON ?auto_109212 ?auto_109213 ) ( ON ?auto_109211 ?auto_109212 ) ( CLEAR ?auto_109211 ) ( ON ?auto_109210 ?auto_109217 ) ( CLEAR ?auto_109210 ) ( HAND-EMPTY ) ( not ( = ?auto_109210 ?auto_109217 ) ) ( not ( = ?auto_109211 ?auto_109217 ) ) ( not ( = ?auto_109212 ?auto_109217 ) ) ( not ( = ?auto_109213 ?auto_109217 ) ) ( not ( = ?auto_109214 ?auto_109217 ) ) ( not ( = ?auto_109215 ?auto_109217 ) ) ( not ( = ?auto_109216 ?auto_109217 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109210 ?auto_109217 )
      ( MAKE-7PILE ?auto_109210 ?auto_109211 ?auto_109212 ?auto_109213 ?auto_109214 ?auto_109215 ?auto_109216 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109218 - BLOCK
      ?auto_109219 - BLOCK
      ?auto_109220 - BLOCK
      ?auto_109221 - BLOCK
      ?auto_109222 - BLOCK
      ?auto_109223 - BLOCK
      ?auto_109224 - BLOCK
    )
    :vars
    (
      ?auto_109225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109218 ?auto_109219 ) ) ( not ( = ?auto_109218 ?auto_109220 ) ) ( not ( = ?auto_109218 ?auto_109221 ) ) ( not ( = ?auto_109218 ?auto_109222 ) ) ( not ( = ?auto_109218 ?auto_109223 ) ) ( not ( = ?auto_109218 ?auto_109224 ) ) ( not ( = ?auto_109219 ?auto_109220 ) ) ( not ( = ?auto_109219 ?auto_109221 ) ) ( not ( = ?auto_109219 ?auto_109222 ) ) ( not ( = ?auto_109219 ?auto_109223 ) ) ( not ( = ?auto_109219 ?auto_109224 ) ) ( not ( = ?auto_109220 ?auto_109221 ) ) ( not ( = ?auto_109220 ?auto_109222 ) ) ( not ( = ?auto_109220 ?auto_109223 ) ) ( not ( = ?auto_109220 ?auto_109224 ) ) ( not ( = ?auto_109221 ?auto_109222 ) ) ( not ( = ?auto_109221 ?auto_109223 ) ) ( not ( = ?auto_109221 ?auto_109224 ) ) ( not ( = ?auto_109222 ?auto_109223 ) ) ( not ( = ?auto_109222 ?auto_109224 ) ) ( not ( = ?auto_109223 ?auto_109224 ) ) ( ON-TABLE ?auto_109224 ) ( ON ?auto_109223 ?auto_109224 ) ( ON ?auto_109222 ?auto_109223 ) ( ON ?auto_109221 ?auto_109222 ) ( ON ?auto_109220 ?auto_109221 ) ( ON ?auto_109218 ?auto_109225 ) ( CLEAR ?auto_109218 ) ( not ( = ?auto_109218 ?auto_109225 ) ) ( not ( = ?auto_109219 ?auto_109225 ) ) ( not ( = ?auto_109220 ?auto_109225 ) ) ( not ( = ?auto_109221 ?auto_109225 ) ) ( not ( = ?auto_109222 ?auto_109225 ) ) ( not ( = ?auto_109223 ?auto_109225 ) ) ( not ( = ?auto_109224 ?auto_109225 ) ) ( HOLDING ?auto_109219 ) ( CLEAR ?auto_109220 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109224 ?auto_109223 ?auto_109222 ?auto_109221 ?auto_109220 ?auto_109219 )
      ( MAKE-7PILE ?auto_109218 ?auto_109219 ?auto_109220 ?auto_109221 ?auto_109222 ?auto_109223 ?auto_109224 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109226 - BLOCK
      ?auto_109227 - BLOCK
      ?auto_109228 - BLOCK
      ?auto_109229 - BLOCK
      ?auto_109230 - BLOCK
      ?auto_109231 - BLOCK
      ?auto_109232 - BLOCK
    )
    :vars
    (
      ?auto_109233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109226 ?auto_109227 ) ) ( not ( = ?auto_109226 ?auto_109228 ) ) ( not ( = ?auto_109226 ?auto_109229 ) ) ( not ( = ?auto_109226 ?auto_109230 ) ) ( not ( = ?auto_109226 ?auto_109231 ) ) ( not ( = ?auto_109226 ?auto_109232 ) ) ( not ( = ?auto_109227 ?auto_109228 ) ) ( not ( = ?auto_109227 ?auto_109229 ) ) ( not ( = ?auto_109227 ?auto_109230 ) ) ( not ( = ?auto_109227 ?auto_109231 ) ) ( not ( = ?auto_109227 ?auto_109232 ) ) ( not ( = ?auto_109228 ?auto_109229 ) ) ( not ( = ?auto_109228 ?auto_109230 ) ) ( not ( = ?auto_109228 ?auto_109231 ) ) ( not ( = ?auto_109228 ?auto_109232 ) ) ( not ( = ?auto_109229 ?auto_109230 ) ) ( not ( = ?auto_109229 ?auto_109231 ) ) ( not ( = ?auto_109229 ?auto_109232 ) ) ( not ( = ?auto_109230 ?auto_109231 ) ) ( not ( = ?auto_109230 ?auto_109232 ) ) ( not ( = ?auto_109231 ?auto_109232 ) ) ( ON-TABLE ?auto_109232 ) ( ON ?auto_109231 ?auto_109232 ) ( ON ?auto_109230 ?auto_109231 ) ( ON ?auto_109229 ?auto_109230 ) ( ON ?auto_109228 ?auto_109229 ) ( ON ?auto_109226 ?auto_109233 ) ( not ( = ?auto_109226 ?auto_109233 ) ) ( not ( = ?auto_109227 ?auto_109233 ) ) ( not ( = ?auto_109228 ?auto_109233 ) ) ( not ( = ?auto_109229 ?auto_109233 ) ) ( not ( = ?auto_109230 ?auto_109233 ) ) ( not ( = ?auto_109231 ?auto_109233 ) ) ( not ( = ?auto_109232 ?auto_109233 ) ) ( CLEAR ?auto_109228 ) ( ON ?auto_109227 ?auto_109226 ) ( CLEAR ?auto_109227 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109233 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109233 ?auto_109226 )
      ( MAKE-7PILE ?auto_109226 ?auto_109227 ?auto_109228 ?auto_109229 ?auto_109230 ?auto_109231 ?auto_109232 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109234 - BLOCK
      ?auto_109235 - BLOCK
      ?auto_109236 - BLOCK
      ?auto_109237 - BLOCK
      ?auto_109238 - BLOCK
      ?auto_109239 - BLOCK
      ?auto_109240 - BLOCK
    )
    :vars
    (
      ?auto_109241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109234 ?auto_109235 ) ) ( not ( = ?auto_109234 ?auto_109236 ) ) ( not ( = ?auto_109234 ?auto_109237 ) ) ( not ( = ?auto_109234 ?auto_109238 ) ) ( not ( = ?auto_109234 ?auto_109239 ) ) ( not ( = ?auto_109234 ?auto_109240 ) ) ( not ( = ?auto_109235 ?auto_109236 ) ) ( not ( = ?auto_109235 ?auto_109237 ) ) ( not ( = ?auto_109235 ?auto_109238 ) ) ( not ( = ?auto_109235 ?auto_109239 ) ) ( not ( = ?auto_109235 ?auto_109240 ) ) ( not ( = ?auto_109236 ?auto_109237 ) ) ( not ( = ?auto_109236 ?auto_109238 ) ) ( not ( = ?auto_109236 ?auto_109239 ) ) ( not ( = ?auto_109236 ?auto_109240 ) ) ( not ( = ?auto_109237 ?auto_109238 ) ) ( not ( = ?auto_109237 ?auto_109239 ) ) ( not ( = ?auto_109237 ?auto_109240 ) ) ( not ( = ?auto_109238 ?auto_109239 ) ) ( not ( = ?auto_109238 ?auto_109240 ) ) ( not ( = ?auto_109239 ?auto_109240 ) ) ( ON-TABLE ?auto_109240 ) ( ON ?auto_109239 ?auto_109240 ) ( ON ?auto_109238 ?auto_109239 ) ( ON ?auto_109237 ?auto_109238 ) ( ON ?auto_109234 ?auto_109241 ) ( not ( = ?auto_109234 ?auto_109241 ) ) ( not ( = ?auto_109235 ?auto_109241 ) ) ( not ( = ?auto_109236 ?auto_109241 ) ) ( not ( = ?auto_109237 ?auto_109241 ) ) ( not ( = ?auto_109238 ?auto_109241 ) ) ( not ( = ?auto_109239 ?auto_109241 ) ) ( not ( = ?auto_109240 ?auto_109241 ) ) ( ON ?auto_109235 ?auto_109234 ) ( CLEAR ?auto_109235 ) ( ON-TABLE ?auto_109241 ) ( HOLDING ?auto_109236 ) ( CLEAR ?auto_109237 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109240 ?auto_109239 ?auto_109238 ?auto_109237 ?auto_109236 )
      ( MAKE-7PILE ?auto_109234 ?auto_109235 ?auto_109236 ?auto_109237 ?auto_109238 ?auto_109239 ?auto_109240 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109242 - BLOCK
      ?auto_109243 - BLOCK
      ?auto_109244 - BLOCK
      ?auto_109245 - BLOCK
      ?auto_109246 - BLOCK
      ?auto_109247 - BLOCK
      ?auto_109248 - BLOCK
    )
    :vars
    (
      ?auto_109249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109242 ?auto_109243 ) ) ( not ( = ?auto_109242 ?auto_109244 ) ) ( not ( = ?auto_109242 ?auto_109245 ) ) ( not ( = ?auto_109242 ?auto_109246 ) ) ( not ( = ?auto_109242 ?auto_109247 ) ) ( not ( = ?auto_109242 ?auto_109248 ) ) ( not ( = ?auto_109243 ?auto_109244 ) ) ( not ( = ?auto_109243 ?auto_109245 ) ) ( not ( = ?auto_109243 ?auto_109246 ) ) ( not ( = ?auto_109243 ?auto_109247 ) ) ( not ( = ?auto_109243 ?auto_109248 ) ) ( not ( = ?auto_109244 ?auto_109245 ) ) ( not ( = ?auto_109244 ?auto_109246 ) ) ( not ( = ?auto_109244 ?auto_109247 ) ) ( not ( = ?auto_109244 ?auto_109248 ) ) ( not ( = ?auto_109245 ?auto_109246 ) ) ( not ( = ?auto_109245 ?auto_109247 ) ) ( not ( = ?auto_109245 ?auto_109248 ) ) ( not ( = ?auto_109246 ?auto_109247 ) ) ( not ( = ?auto_109246 ?auto_109248 ) ) ( not ( = ?auto_109247 ?auto_109248 ) ) ( ON-TABLE ?auto_109248 ) ( ON ?auto_109247 ?auto_109248 ) ( ON ?auto_109246 ?auto_109247 ) ( ON ?auto_109245 ?auto_109246 ) ( ON ?auto_109242 ?auto_109249 ) ( not ( = ?auto_109242 ?auto_109249 ) ) ( not ( = ?auto_109243 ?auto_109249 ) ) ( not ( = ?auto_109244 ?auto_109249 ) ) ( not ( = ?auto_109245 ?auto_109249 ) ) ( not ( = ?auto_109246 ?auto_109249 ) ) ( not ( = ?auto_109247 ?auto_109249 ) ) ( not ( = ?auto_109248 ?auto_109249 ) ) ( ON ?auto_109243 ?auto_109242 ) ( ON-TABLE ?auto_109249 ) ( CLEAR ?auto_109245 ) ( ON ?auto_109244 ?auto_109243 ) ( CLEAR ?auto_109244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109249 ?auto_109242 ?auto_109243 )
      ( MAKE-7PILE ?auto_109242 ?auto_109243 ?auto_109244 ?auto_109245 ?auto_109246 ?auto_109247 ?auto_109248 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109250 - BLOCK
      ?auto_109251 - BLOCK
      ?auto_109252 - BLOCK
      ?auto_109253 - BLOCK
      ?auto_109254 - BLOCK
      ?auto_109255 - BLOCK
      ?auto_109256 - BLOCK
    )
    :vars
    (
      ?auto_109257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109250 ?auto_109251 ) ) ( not ( = ?auto_109250 ?auto_109252 ) ) ( not ( = ?auto_109250 ?auto_109253 ) ) ( not ( = ?auto_109250 ?auto_109254 ) ) ( not ( = ?auto_109250 ?auto_109255 ) ) ( not ( = ?auto_109250 ?auto_109256 ) ) ( not ( = ?auto_109251 ?auto_109252 ) ) ( not ( = ?auto_109251 ?auto_109253 ) ) ( not ( = ?auto_109251 ?auto_109254 ) ) ( not ( = ?auto_109251 ?auto_109255 ) ) ( not ( = ?auto_109251 ?auto_109256 ) ) ( not ( = ?auto_109252 ?auto_109253 ) ) ( not ( = ?auto_109252 ?auto_109254 ) ) ( not ( = ?auto_109252 ?auto_109255 ) ) ( not ( = ?auto_109252 ?auto_109256 ) ) ( not ( = ?auto_109253 ?auto_109254 ) ) ( not ( = ?auto_109253 ?auto_109255 ) ) ( not ( = ?auto_109253 ?auto_109256 ) ) ( not ( = ?auto_109254 ?auto_109255 ) ) ( not ( = ?auto_109254 ?auto_109256 ) ) ( not ( = ?auto_109255 ?auto_109256 ) ) ( ON-TABLE ?auto_109256 ) ( ON ?auto_109255 ?auto_109256 ) ( ON ?auto_109254 ?auto_109255 ) ( ON ?auto_109250 ?auto_109257 ) ( not ( = ?auto_109250 ?auto_109257 ) ) ( not ( = ?auto_109251 ?auto_109257 ) ) ( not ( = ?auto_109252 ?auto_109257 ) ) ( not ( = ?auto_109253 ?auto_109257 ) ) ( not ( = ?auto_109254 ?auto_109257 ) ) ( not ( = ?auto_109255 ?auto_109257 ) ) ( not ( = ?auto_109256 ?auto_109257 ) ) ( ON ?auto_109251 ?auto_109250 ) ( ON-TABLE ?auto_109257 ) ( ON ?auto_109252 ?auto_109251 ) ( CLEAR ?auto_109252 ) ( HOLDING ?auto_109253 ) ( CLEAR ?auto_109254 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109256 ?auto_109255 ?auto_109254 ?auto_109253 )
      ( MAKE-7PILE ?auto_109250 ?auto_109251 ?auto_109252 ?auto_109253 ?auto_109254 ?auto_109255 ?auto_109256 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109258 - BLOCK
      ?auto_109259 - BLOCK
      ?auto_109260 - BLOCK
      ?auto_109261 - BLOCK
      ?auto_109262 - BLOCK
      ?auto_109263 - BLOCK
      ?auto_109264 - BLOCK
    )
    :vars
    (
      ?auto_109265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109258 ?auto_109259 ) ) ( not ( = ?auto_109258 ?auto_109260 ) ) ( not ( = ?auto_109258 ?auto_109261 ) ) ( not ( = ?auto_109258 ?auto_109262 ) ) ( not ( = ?auto_109258 ?auto_109263 ) ) ( not ( = ?auto_109258 ?auto_109264 ) ) ( not ( = ?auto_109259 ?auto_109260 ) ) ( not ( = ?auto_109259 ?auto_109261 ) ) ( not ( = ?auto_109259 ?auto_109262 ) ) ( not ( = ?auto_109259 ?auto_109263 ) ) ( not ( = ?auto_109259 ?auto_109264 ) ) ( not ( = ?auto_109260 ?auto_109261 ) ) ( not ( = ?auto_109260 ?auto_109262 ) ) ( not ( = ?auto_109260 ?auto_109263 ) ) ( not ( = ?auto_109260 ?auto_109264 ) ) ( not ( = ?auto_109261 ?auto_109262 ) ) ( not ( = ?auto_109261 ?auto_109263 ) ) ( not ( = ?auto_109261 ?auto_109264 ) ) ( not ( = ?auto_109262 ?auto_109263 ) ) ( not ( = ?auto_109262 ?auto_109264 ) ) ( not ( = ?auto_109263 ?auto_109264 ) ) ( ON-TABLE ?auto_109264 ) ( ON ?auto_109263 ?auto_109264 ) ( ON ?auto_109262 ?auto_109263 ) ( ON ?auto_109258 ?auto_109265 ) ( not ( = ?auto_109258 ?auto_109265 ) ) ( not ( = ?auto_109259 ?auto_109265 ) ) ( not ( = ?auto_109260 ?auto_109265 ) ) ( not ( = ?auto_109261 ?auto_109265 ) ) ( not ( = ?auto_109262 ?auto_109265 ) ) ( not ( = ?auto_109263 ?auto_109265 ) ) ( not ( = ?auto_109264 ?auto_109265 ) ) ( ON ?auto_109259 ?auto_109258 ) ( ON-TABLE ?auto_109265 ) ( ON ?auto_109260 ?auto_109259 ) ( CLEAR ?auto_109262 ) ( ON ?auto_109261 ?auto_109260 ) ( CLEAR ?auto_109261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109265 ?auto_109258 ?auto_109259 ?auto_109260 )
      ( MAKE-7PILE ?auto_109258 ?auto_109259 ?auto_109260 ?auto_109261 ?auto_109262 ?auto_109263 ?auto_109264 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109266 - BLOCK
      ?auto_109267 - BLOCK
      ?auto_109268 - BLOCK
      ?auto_109269 - BLOCK
      ?auto_109270 - BLOCK
      ?auto_109271 - BLOCK
      ?auto_109272 - BLOCK
    )
    :vars
    (
      ?auto_109273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109266 ?auto_109267 ) ) ( not ( = ?auto_109266 ?auto_109268 ) ) ( not ( = ?auto_109266 ?auto_109269 ) ) ( not ( = ?auto_109266 ?auto_109270 ) ) ( not ( = ?auto_109266 ?auto_109271 ) ) ( not ( = ?auto_109266 ?auto_109272 ) ) ( not ( = ?auto_109267 ?auto_109268 ) ) ( not ( = ?auto_109267 ?auto_109269 ) ) ( not ( = ?auto_109267 ?auto_109270 ) ) ( not ( = ?auto_109267 ?auto_109271 ) ) ( not ( = ?auto_109267 ?auto_109272 ) ) ( not ( = ?auto_109268 ?auto_109269 ) ) ( not ( = ?auto_109268 ?auto_109270 ) ) ( not ( = ?auto_109268 ?auto_109271 ) ) ( not ( = ?auto_109268 ?auto_109272 ) ) ( not ( = ?auto_109269 ?auto_109270 ) ) ( not ( = ?auto_109269 ?auto_109271 ) ) ( not ( = ?auto_109269 ?auto_109272 ) ) ( not ( = ?auto_109270 ?auto_109271 ) ) ( not ( = ?auto_109270 ?auto_109272 ) ) ( not ( = ?auto_109271 ?auto_109272 ) ) ( ON-TABLE ?auto_109272 ) ( ON ?auto_109271 ?auto_109272 ) ( ON ?auto_109266 ?auto_109273 ) ( not ( = ?auto_109266 ?auto_109273 ) ) ( not ( = ?auto_109267 ?auto_109273 ) ) ( not ( = ?auto_109268 ?auto_109273 ) ) ( not ( = ?auto_109269 ?auto_109273 ) ) ( not ( = ?auto_109270 ?auto_109273 ) ) ( not ( = ?auto_109271 ?auto_109273 ) ) ( not ( = ?auto_109272 ?auto_109273 ) ) ( ON ?auto_109267 ?auto_109266 ) ( ON-TABLE ?auto_109273 ) ( ON ?auto_109268 ?auto_109267 ) ( ON ?auto_109269 ?auto_109268 ) ( CLEAR ?auto_109269 ) ( HOLDING ?auto_109270 ) ( CLEAR ?auto_109271 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109272 ?auto_109271 ?auto_109270 )
      ( MAKE-7PILE ?auto_109266 ?auto_109267 ?auto_109268 ?auto_109269 ?auto_109270 ?auto_109271 ?auto_109272 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109274 - BLOCK
      ?auto_109275 - BLOCK
      ?auto_109276 - BLOCK
      ?auto_109277 - BLOCK
      ?auto_109278 - BLOCK
      ?auto_109279 - BLOCK
      ?auto_109280 - BLOCK
    )
    :vars
    (
      ?auto_109281 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109274 ?auto_109275 ) ) ( not ( = ?auto_109274 ?auto_109276 ) ) ( not ( = ?auto_109274 ?auto_109277 ) ) ( not ( = ?auto_109274 ?auto_109278 ) ) ( not ( = ?auto_109274 ?auto_109279 ) ) ( not ( = ?auto_109274 ?auto_109280 ) ) ( not ( = ?auto_109275 ?auto_109276 ) ) ( not ( = ?auto_109275 ?auto_109277 ) ) ( not ( = ?auto_109275 ?auto_109278 ) ) ( not ( = ?auto_109275 ?auto_109279 ) ) ( not ( = ?auto_109275 ?auto_109280 ) ) ( not ( = ?auto_109276 ?auto_109277 ) ) ( not ( = ?auto_109276 ?auto_109278 ) ) ( not ( = ?auto_109276 ?auto_109279 ) ) ( not ( = ?auto_109276 ?auto_109280 ) ) ( not ( = ?auto_109277 ?auto_109278 ) ) ( not ( = ?auto_109277 ?auto_109279 ) ) ( not ( = ?auto_109277 ?auto_109280 ) ) ( not ( = ?auto_109278 ?auto_109279 ) ) ( not ( = ?auto_109278 ?auto_109280 ) ) ( not ( = ?auto_109279 ?auto_109280 ) ) ( ON-TABLE ?auto_109280 ) ( ON ?auto_109279 ?auto_109280 ) ( ON ?auto_109274 ?auto_109281 ) ( not ( = ?auto_109274 ?auto_109281 ) ) ( not ( = ?auto_109275 ?auto_109281 ) ) ( not ( = ?auto_109276 ?auto_109281 ) ) ( not ( = ?auto_109277 ?auto_109281 ) ) ( not ( = ?auto_109278 ?auto_109281 ) ) ( not ( = ?auto_109279 ?auto_109281 ) ) ( not ( = ?auto_109280 ?auto_109281 ) ) ( ON ?auto_109275 ?auto_109274 ) ( ON-TABLE ?auto_109281 ) ( ON ?auto_109276 ?auto_109275 ) ( ON ?auto_109277 ?auto_109276 ) ( CLEAR ?auto_109279 ) ( ON ?auto_109278 ?auto_109277 ) ( CLEAR ?auto_109278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109281 ?auto_109274 ?auto_109275 ?auto_109276 ?auto_109277 )
      ( MAKE-7PILE ?auto_109274 ?auto_109275 ?auto_109276 ?auto_109277 ?auto_109278 ?auto_109279 ?auto_109280 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109282 - BLOCK
      ?auto_109283 - BLOCK
      ?auto_109284 - BLOCK
      ?auto_109285 - BLOCK
      ?auto_109286 - BLOCK
      ?auto_109287 - BLOCK
      ?auto_109288 - BLOCK
    )
    :vars
    (
      ?auto_109289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109282 ?auto_109283 ) ) ( not ( = ?auto_109282 ?auto_109284 ) ) ( not ( = ?auto_109282 ?auto_109285 ) ) ( not ( = ?auto_109282 ?auto_109286 ) ) ( not ( = ?auto_109282 ?auto_109287 ) ) ( not ( = ?auto_109282 ?auto_109288 ) ) ( not ( = ?auto_109283 ?auto_109284 ) ) ( not ( = ?auto_109283 ?auto_109285 ) ) ( not ( = ?auto_109283 ?auto_109286 ) ) ( not ( = ?auto_109283 ?auto_109287 ) ) ( not ( = ?auto_109283 ?auto_109288 ) ) ( not ( = ?auto_109284 ?auto_109285 ) ) ( not ( = ?auto_109284 ?auto_109286 ) ) ( not ( = ?auto_109284 ?auto_109287 ) ) ( not ( = ?auto_109284 ?auto_109288 ) ) ( not ( = ?auto_109285 ?auto_109286 ) ) ( not ( = ?auto_109285 ?auto_109287 ) ) ( not ( = ?auto_109285 ?auto_109288 ) ) ( not ( = ?auto_109286 ?auto_109287 ) ) ( not ( = ?auto_109286 ?auto_109288 ) ) ( not ( = ?auto_109287 ?auto_109288 ) ) ( ON-TABLE ?auto_109288 ) ( ON ?auto_109282 ?auto_109289 ) ( not ( = ?auto_109282 ?auto_109289 ) ) ( not ( = ?auto_109283 ?auto_109289 ) ) ( not ( = ?auto_109284 ?auto_109289 ) ) ( not ( = ?auto_109285 ?auto_109289 ) ) ( not ( = ?auto_109286 ?auto_109289 ) ) ( not ( = ?auto_109287 ?auto_109289 ) ) ( not ( = ?auto_109288 ?auto_109289 ) ) ( ON ?auto_109283 ?auto_109282 ) ( ON-TABLE ?auto_109289 ) ( ON ?auto_109284 ?auto_109283 ) ( ON ?auto_109285 ?auto_109284 ) ( ON ?auto_109286 ?auto_109285 ) ( CLEAR ?auto_109286 ) ( HOLDING ?auto_109287 ) ( CLEAR ?auto_109288 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109288 ?auto_109287 )
      ( MAKE-7PILE ?auto_109282 ?auto_109283 ?auto_109284 ?auto_109285 ?auto_109286 ?auto_109287 ?auto_109288 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109290 - BLOCK
      ?auto_109291 - BLOCK
      ?auto_109292 - BLOCK
      ?auto_109293 - BLOCK
      ?auto_109294 - BLOCK
      ?auto_109295 - BLOCK
      ?auto_109296 - BLOCK
    )
    :vars
    (
      ?auto_109297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109290 ?auto_109291 ) ) ( not ( = ?auto_109290 ?auto_109292 ) ) ( not ( = ?auto_109290 ?auto_109293 ) ) ( not ( = ?auto_109290 ?auto_109294 ) ) ( not ( = ?auto_109290 ?auto_109295 ) ) ( not ( = ?auto_109290 ?auto_109296 ) ) ( not ( = ?auto_109291 ?auto_109292 ) ) ( not ( = ?auto_109291 ?auto_109293 ) ) ( not ( = ?auto_109291 ?auto_109294 ) ) ( not ( = ?auto_109291 ?auto_109295 ) ) ( not ( = ?auto_109291 ?auto_109296 ) ) ( not ( = ?auto_109292 ?auto_109293 ) ) ( not ( = ?auto_109292 ?auto_109294 ) ) ( not ( = ?auto_109292 ?auto_109295 ) ) ( not ( = ?auto_109292 ?auto_109296 ) ) ( not ( = ?auto_109293 ?auto_109294 ) ) ( not ( = ?auto_109293 ?auto_109295 ) ) ( not ( = ?auto_109293 ?auto_109296 ) ) ( not ( = ?auto_109294 ?auto_109295 ) ) ( not ( = ?auto_109294 ?auto_109296 ) ) ( not ( = ?auto_109295 ?auto_109296 ) ) ( ON-TABLE ?auto_109296 ) ( ON ?auto_109290 ?auto_109297 ) ( not ( = ?auto_109290 ?auto_109297 ) ) ( not ( = ?auto_109291 ?auto_109297 ) ) ( not ( = ?auto_109292 ?auto_109297 ) ) ( not ( = ?auto_109293 ?auto_109297 ) ) ( not ( = ?auto_109294 ?auto_109297 ) ) ( not ( = ?auto_109295 ?auto_109297 ) ) ( not ( = ?auto_109296 ?auto_109297 ) ) ( ON ?auto_109291 ?auto_109290 ) ( ON-TABLE ?auto_109297 ) ( ON ?auto_109292 ?auto_109291 ) ( ON ?auto_109293 ?auto_109292 ) ( ON ?auto_109294 ?auto_109293 ) ( CLEAR ?auto_109296 ) ( ON ?auto_109295 ?auto_109294 ) ( CLEAR ?auto_109295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109297 ?auto_109290 ?auto_109291 ?auto_109292 ?auto_109293 ?auto_109294 )
      ( MAKE-7PILE ?auto_109290 ?auto_109291 ?auto_109292 ?auto_109293 ?auto_109294 ?auto_109295 ?auto_109296 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109298 - BLOCK
      ?auto_109299 - BLOCK
      ?auto_109300 - BLOCK
      ?auto_109301 - BLOCK
      ?auto_109302 - BLOCK
      ?auto_109303 - BLOCK
      ?auto_109304 - BLOCK
    )
    :vars
    (
      ?auto_109305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109298 ?auto_109299 ) ) ( not ( = ?auto_109298 ?auto_109300 ) ) ( not ( = ?auto_109298 ?auto_109301 ) ) ( not ( = ?auto_109298 ?auto_109302 ) ) ( not ( = ?auto_109298 ?auto_109303 ) ) ( not ( = ?auto_109298 ?auto_109304 ) ) ( not ( = ?auto_109299 ?auto_109300 ) ) ( not ( = ?auto_109299 ?auto_109301 ) ) ( not ( = ?auto_109299 ?auto_109302 ) ) ( not ( = ?auto_109299 ?auto_109303 ) ) ( not ( = ?auto_109299 ?auto_109304 ) ) ( not ( = ?auto_109300 ?auto_109301 ) ) ( not ( = ?auto_109300 ?auto_109302 ) ) ( not ( = ?auto_109300 ?auto_109303 ) ) ( not ( = ?auto_109300 ?auto_109304 ) ) ( not ( = ?auto_109301 ?auto_109302 ) ) ( not ( = ?auto_109301 ?auto_109303 ) ) ( not ( = ?auto_109301 ?auto_109304 ) ) ( not ( = ?auto_109302 ?auto_109303 ) ) ( not ( = ?auto_109302 ?auto_109304 ) ) ( not ( = ?auto_109303 ?auto_109304 ) ) ( ON ?auto_109298 ?auto_109305 ) ( not ( = ?auto_109298 ?auto_109305 ) ) ( not ( = ?auto_109299 ?auto_109305 ) ) ( not ( = ?auto_109300 ?auto_109305 ) ) ( not ( = ?auto_109301 ?auto_109305 ) ) ( not ( = ?auto_109302 ?auto_109305 ) ) ( not ( = ?auto_109303 ?auto_109305 ) ) ( not ( = ?auto_109304 ?auto_109305 ) ) ( ON ?auto_109299 ?auto_109298 ) ( ON-TABLE ?auto_109305 ) ( ON ?auto_109300 ?auto_109299 ) ( ON ?auto_109301 ?auto_109300 ) ( ON ?auto_109302 ?auto_109301 ) ( ON ?auto_109303 ?auto_109302 ) ( CLEAR ?auto_109303 ) ( HOLDING ?auto_109304 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109304 )
      ( MAKE-7PILE ?auto_109298 ?auto_109299 ?auto_109300 ?auto_109301 ?auto_109302 ?auto_109303 ?auto_109304 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109306 - BLOCK
      ?auto_109307 - BLOCK
      ?auto_109308 - BLOCK
      ?auto_109309 - BLOCK
      ?auto_109310 - BLOCK
      ?auto_109311 - BLOCK
      ?auto_109312 - BLOCK
    )
    :vars
    (
      ?auto_109313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109306 ?auto_109307 ) ) ( not ( = ?auto_109306 ?auto_109308 ) ) ( not ( = ?auto_109306 ?auto_109309 ) ) ( not ( = ?auto_109306 ?auto_109310 ) ) ( not ( = ?auto_109306 ?auto_109311 ) ) ( not ( = ?auto_109306 ?auto_109312 ) ) ( not ( = ?auto_109307 ?auto_109308 ) ) ( not ( = ?auto_109307 ?auto_109309 ) ) ( not ( = ?auto_109307 ?auto_109310 ) ) ( not ( = ?auto_109307 ?auto_109311 ) ) ( not ( = ?auto_109307 ?auto_109312 ) ) ( not ( = ?auto_109308 ?auto_109309 ) ) ( not ( = ?auto_109308 ?auto_109310 ) ) ( not ( = ?auto_109308 ?auto_109311 ) ) ( not ( = ?auto_109308 ?auto_109312 ) ) ( not ( = ?auto_109309 ?auto_109310 ) ) ( not ( = ?auto_109309 ?auto_109311 ) ) ( not ( = ?auto_109309 ?auto_109312 ) ) ( not ( = ?auto_109310 ?auto_109311 ) ) ( not ( = ?auto_109310 ?auto_109312 ) ) ( not ( = ?auto_109311 ?auto_109312 ) ) ( ON ?auto_109306 ?auto_109313 ) ( not ( = ?auto_109306 ?auto_109313 ) ) ( not ( = ?auto_109307 ?auto_109313 ) ) ( not ( = ?auto_109308 ?auto_109313 ) ) ( not ( = ?auto_109309 ?auto_109313 ) ) ( not ( = ?auto_109310 ?auto_109313 ) ) ( not ( = ?auto_109311 ?auto_109313 ) ) ( not ( = ?auto_109312 ?auto_109313 ) ) ( ON ?auto_109307 ?auto_109306 ) ( ON-TABLE ?auto_109313 ) ( ON ?auto_109308 ?auto_109307 ) ( ON ?auto_109309 ?auto_109308 ) ( ON ?auto_109310 ?auto_109309 ) ( ON ?auto_109311 ?auto_109310 ) ( ON ?auto_109312 ?auto_109311 ) ( CLEAR ?auto_109312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109313 ?auto_109306 ?auto_109307 ?auto_109308 ?auto_109309 ?auto_109310 ?auto_109311 )
      ( MAKE-7PILE ?auto_109306 ?auto_109307 ?auto_109308 ?auto_109309 ?auto_109310 ?auto_109311 ?auto_109312 ) )
  )

)

