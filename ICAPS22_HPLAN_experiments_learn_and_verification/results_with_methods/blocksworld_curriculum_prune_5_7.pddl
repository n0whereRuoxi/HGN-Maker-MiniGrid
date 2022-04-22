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
      ?auto_6713 - BLOCK
    )
    :vars
    (
      ?auto_6714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6713 ?auto_6714 ) ( CLEAR ?auto_6713 ) ( HAND-EMPTY ) ( not ( = ?auto_6713 ?auto_6714 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6713 ?auto_6714 )
      ( !PUTDOWN ?auto_6713 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6720 - BLOCK
      ?auto_6721 - BLOCK
    )
    :vars
    (
      ?auto_6722 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6720 ) ( ON ?auto_6721 ?auto_6722 ) ( CLEAR ?auto_6721 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6720 ) ( not ( = ?auto_6720 ?auto_6721 ) ) ( not ( = ?auto_6720 ?auto_6722 ) ) ( not ( = ?auto_6721 ?auto_6722 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6721 ?auto_6722 )
      ( !STACK ?auto_6721 ?auto_6720 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6730 - BLOCK
      ?auto_6731 - BLOCK
    )
    :vars
    (
      ?auto_6732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6731 ?auto_6732 ) ( not ( = ?auto_6730 ?auto_6731 ) ) ( not ( = ?auto_6730 ?auto_6732 ) ) ( not ( = ?auto_6731 ?auto_6732 ) ) ( ON ?auto_6730 ?auto_6731 ) ( CLEAR ?auto_6730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6730 )
      ( MAKE-2PILE ?auto_6730 ?auto_6731 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6741 - BLOCK
      ?auto_6742 - BLOCK
      ?auto_6743 - BLOCK
    )
    :vars
    (
      ?auto_6744 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6742 ) ( ON ?auto_6743 ?auto_6744 ) ( CLEAR ?auto_6743 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6741 ) ( ON ?auto_6742 ?auto_6741 ) ( not ( = ?auto_6741 ?auto_6742 ) ) ( not ( = ?auto_6741 ?auto_6743 ) ) ( not ( = ?auto_6741 ?auto_6744 ) ) ( not ( = ?auto_6742 ?auto_6743 ) ) ( not ( = ?auto_6742 ?auto_6744 ) ) ( not ( = ?auto_6743 ?auto_6744 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6743 ?auto_6744 )
      ( !STACK ?auto_6743 ?auto_6742 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6755 - BLOCK
      ?auto_6756 - BLOCK
      ?auto_6757 - BLOCK
    )
    :vars
    (
      ?auto_6758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6757 ?auto_6758 ) ( ON-TABLE ?auto_6755 ) ( not ( = ?auto_6755 ?auto_6756 ) ) ( not ( = ?auto_6755 ?auto_6757 ) ) ( not ( = ?auto_6755 ?auto_6758 ) ) ( not ( = ?auto_6756 ?auto_6757 ) ) ( not ( = ?auto_6756 ?auto_6758 ) ) ( not ( = ?auto_6757 ?auto_6758 ) ) ( CLEAR ?auto_6755 ) ( ON ?auto_6756 ?auto_6757 ) ( CLEAR ?auto_6756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6755 ?auto_6756 )
      ( MAKE-3PILE ?auto_6755 ?auto_6756 ?auto_6757 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6769 - BLOCK
      ?auto_6770 - BLOCK
      ?auto_6771 - BLOCK
    )
    :vars
    (
      ?auto_6772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6771 ?auto_6772 ) ( not ( = ?auto_6769 ?auto_6770 ) ) ( not ( = ?auto_6769 ?auto_6771 ) ) ( not ( = ?auto_6769 ?auto_6772 ) ) ( not ( = ?auto_6770 ?auto_6771 ) ) ( not ( = ?auto_6770 ?auto_6772 ) ) ( not ( = ?auto_6771 ?auto_6772 ) ) ( ON ?auto_6770 ?auto_6771 ) ( ON ?auto_6769 ?auto_6770 ) ( CLEAR ?auto_6769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6769 )
      ( MAKE-3PILE ?auto_6769 ?auto_6770 ?auto_6771 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6784 - BLOCK
      ?auto_6785 - BLOCK
      ?auto_6786 - BLOCK
      ?auto_6787 - BLOCK
    )
    :vars
    (
      ?auto_6788 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6786 ) ( ON ?auto_6787 ?auto_6788 ) ( CLEAR ?auto_6787 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6784 ) ( ON ?auto_6785 ?auto_6784 ) ( ON ?auto_6786 ?auto_6785 ) ( not ( = ?auto_6784 ?auto_6785 ) ) ( not ( = ?auto_6784 ?auto_6786 ) ) ( not ( = ?auto_6784 ?auto_6787 ) ) ( not ( = ?auto_6784 ?auto_6788 ) ) ( not ( = ?auto_6785 ?auto_6786 ) ) ( not ( = ?auto_6785 ?auto_6787 ) ) ( not ( = ?auto_6785 ?auto_6788 ) ) ( not ( = ?auto_6786 ?auto_6787 ) ) ( not ( = ?auto_6786 ?auto_6788 ) ) ( not ( = ?auto_6787 ?auto_6788 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6787 ?auto_6788 )
      ( !STACK ?auto_6787 ?auto_6786 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6802 - BLOCK
      ?auto_6803 - BLOCK
      ?auto_6804 - BLOCK
      ?auto_6805 - BLOCK
    )
    :vars
    (
      ?auto_6806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6805 ?auto_6806 ) ( ON-TABLE ?auto_6802 ) ( ON ?auto_6803 ?auto_6802 ) ( not ( = ?auto_6802 ?auto_6803 ) ) ( not ( = ?auto_6802 ?auto_6804 ) ) ( not ( = ?auto_6802 ?auto_6805 ) ) ( not ( = ?auto_6802 ?auto_6806 ) ) ( not ( = ?auto_6803 ?auto_6804 ) ) ( not ( = ?auto_6803 ?auto_6805 ) ) ( not ( = ?auto_6803 ?auto_6806 ) ) ( not ( = ?auto_6804 ?auto_6805 ) ) ( not ( = ?auto_6804 ?auto_6806 ) ) ( not ( = ?auto_6805 ?auto_6806 ) ) ( CLEAR ?auto_6803 ) ( ON ?auto_6804 ?auto_6805 ) ( CLEAR ?auto_6804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6802 ?auto_6803 ?auto_6804 )
      ( MAKE-4PILE ?auto_6802 ?auto_6803 ?auto_6804 ?auto_6805 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6820 - BLOCK
      ?auto_6821 - BLOCK
      ?auto_6822 - BLOCK
      ?auto_6823 - BLOCK
    )
    :vars
    (
      ?auto_6824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6823 ?auto_6824 ) ( ON-TABLE ?auto_6820 ) ( not ( = ?auto_6820 ?auto_6821 ) ) ( not ( = ?auto_6820 ?auto_6822 ) ) ( not ( = ?auto_6820 ?auto_6823 ) ) ( not ( = ?auto_6820 ?auto_6824 ) ) ( not ( = ?auto_6821 ?auto_6822 ) ) ( not ( = ?auto_6821 ?auto_6823 ) ) ( not ( = ?auto_6821 ?auto_6824 ) ) ( not ( = ?auto_6822 ?auto_6823 ) ) ( not ( = ?auto_6822 ?auto_6824 ) ) ( not ( = ?auto_6823 ?auto_6824 ) ) ( ON ?auto_6822 ?auto_6823 ) ( CLEAR ?auto_6820 ) ( ON ?auto_6821 ?auto_6822 ) ( CLEAR ?auto_6821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6820 ?auto_6821 )
      ( MAKE-4PILE ?auto_6820 ?auto_6821 ?auto_6822 ?auto_6823 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6838 - BLOCK
      ?auto_6839 - BLOCK
      ?auto_6840 - BLOCK
      ?auto_6841 - BLOCK
    )
    :vars
    (
      ?auto_6842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6841 ?auto_6842 ) ( not ( = ?auto_6838 ?auto_6839 ) ) ( not ( = ?auto_6838 ?auto_6840 ) ) ( not ( = ?auto_6838 ?auto_6841 ) ) ( not ( = ?auto_6838 ?auto_6842 ) ) ( not ( = ?auto_6839 ?auto_6840 ) ) ( not ( = ?auto_6839 ?auto_6841 ) ) ( not ( = ?auto_6839 ?auto_6842 ) ) ( not ( = ?auto_6840 ?auto_6841 ) ) ( not ( = ?auto_6840 ?auto_6842 ) ) ( not ( = ?auto_6841 ?auto_6842 ) ) ( ON ?auto_6840 ?auto_6841 ) ( ON ?auto_6839 ?auto_6840 ) ( ON ?auto_6838 ?auto_6839 ) ( CLEAR ?auto_6838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6838 )
      ( MAKE-4PILE ?auto_6838 ?auto_6839 ?auto_6840 ?auto_6841 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6857 - BLOCK
      ?auto_6858 - BLOCK
      ?auto_6859 - BLOCK
      ?auto_6860 - BLOCK
      ?auto_6861 - BLOCK
    )
    :vars
    (
      ?auto_6862 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6860 ) ( ON ?auto_6861 ?auto_6862 ) ( CLEAR ?auto_6861 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6857 ) ( ON ?auto_6858 ?auto_6857 ) ( ON ?auto_6859 ?auto_6858 ) ( ON ?auto_6860 ?auto_6859 ) ( not ( = ?auto_6857 ?auto_6858 ) ) ( not ( = ?auto_6857 ?auto_6859 ) ) ( not ( = ?auto_6857 ?auto_6860 ) ) ( not ( = ?auto_6857 ?auto_6861 ) ) ( not ( = ?auto_6857 ?auto_6862 ) ) ( not ( = ?auto_6858 ?auto_6859 ) ) ( not ( = ?auto_6858 ?auto_6860 ) ) ( not ( = ?auto_6858 ?auto_6861 ) ) ( not ( = ?auto_6858 ?auto_6862 ) ) ( not ( = ?auto_6859 ?auto_6860 ) ) ( not ( = ?auto_6859 ?auto_6861 ) ) ( not ( = ?auto_6859 ?auto_6862 ) ) ( not ( = ?auto_6860 ?auto_6861 ) ) ( not ( = ?auto_6860 ?auto_6862 ) ) ( not ( = ?auto_6861 ?auto_6862 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6861 ?auto_6862 )
      ( !STACK ?auto_6861 ?auto_6860 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6868 - BLOCK
      ?auto_6869 - BLOCK
      ?auto_6870 - BLOCK
      ?auto_6871 - BLOCK
      ?auto_6872 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6871 ) ( ON-TABLE ?auto_6872 ) ( CLEAR ?auto_6872 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6868 ) ( ON ?auto_6869 ?auto_6868 ) ( ON ?auto_6870 ?auto_6869 ) ( ON ?auto_6871 ?auto_6870 ) ( not ( = ?auto_6868 ?auto_6869 ) ) ( not ( = ?auto_6868 ?auto_6870 ) ) ( not ( = ?auto_6868 ?auto_6871 ) ) ( not ( = ?auto_6868 ?auto_6872 ) ) ( not ( = ?auto_6869 ?auto_6870 ) ) ( not ( = ?auto_6869 ?auto_6871 ) ) ( not ( = ?auto_6869 ?auto_6872 ) ) ( not ( = ?auto_6870 ?auto_6871 ) ) ( not ( = ?auto_6870 ?auto_6872 ) ) ( not ( = ?auto_6871 ?auto_6872 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_6872 )
      ( !STACK ?auto_6872 ?auto_6871 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6878 - BLOCK
      ?auto_6879 - BLOCK
      ?auto_6880 - BLOCK
      ?auto_6881 - BLOCK
      ?auto_6882 - BLOCK
    )
    :vars
    (
      ?auto_6883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6882 ?auto_6883 ) ( ON-TABLE ?auto_6878 ) ( ON ?auto_6879 ?auto_6878 ) ( ON ?auto_6880 ?auto_6879 ) ( not ( = ?auto_6878 ?auto_6879 ) ) ( not ( = ?auto_6878 ?auto_6880 ) ) ( not ( = ?auto_6878 ?auto_6881 ) ) ( not ( = ?auto_6878 ?auto_6882 ) ) ( not ( = ?auto_6878 ?auto_6883 ) ) ( not ( = ?auto_6879 ?auto_6880 ) ) ( not ( = ?auto_6879 ?auto_6881 ) ) ( not ( = ?auto_6879 ?auto_6882 ) ) ( not ( = ?auto_6879 ?auto_6883 ) ) ( not ( = ?auto_6880 ?auto_6881 ) ) ( not ( = ?auto_6880 ?auto_6882 ) ) ( not ( = ?auto_6880 ?auto_6883 ) ) ( not ( = ?auto_6881 ?auto_6882 ) ) ( not ( = ?auto_6881 ?auto_6883 ) ) ( not ( = ?auto_6882 ?auto_6883 ) ) ( CLEAR ?auto_6880 ) ( ON ?auto_6881 ?auto_6882 ) ( CLEAR ?auto_6881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6878 ?auto_6879 ?auto_6880 ?auto_6881 )
      ( MAKE-5PILE ?auto_6878 ?auto_6879 ?auto_6880 ?auto_6881 ?auto_6882 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6889 - BLOCK
      ?auto_6890 - BLOCK
      ?auto_6891 - BLOCK
      ?auto_6892 - BLOCK
      ?auto_6893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6893 ) ( ON-TABLE ?auto_6889 ) ( ON ?auto_6890 ?auto_6889 ) ( ON ?auto_6891 ?auto_6890 ) ( not ( = ?auto_6889 ?auto_6890 ) ) ( not ( = ?auto_6889 ?auto_6891 ) ) ( not ( = ?auto_6889 ?auto_6892 ) ) ( not ( = ?auto_6889 ?auto_6893 ) ) ( not ( = ?auto_6890 ?auto_6891 ) ) ( not ( = ?auto_6890 ?auto_6892 ) ) ( not ( = ?auto_6890 ?auto_6893 ) ) ( not ( = ?auto_6891 ?auto_6892 ) ) ( not ( = ?auto_6891 ?auto_6893 ) ) ( not ( = ?auto_6892 ?auto_6893 ) ) ( CLEAR ?auto_6891 ) ( ON ?auto_6892 ?auto_6893 ) ( CLEAR ?auto_6892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6889 ?auto_6890 ?auto_6891 ?auto_6892 )
      ( MAKE-5PILE ?auto_6889 ?auto_6890 ?auto_6891 ?auto_6892 ?auto_6893 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6899 - BLOCK
      ?auto_6900 - BLOCK
      ?auto_6901 - BLOCK
      ?auto_6902 - BLOCK
      ?auto_6903 - BLOCK
    )
    :vars
    (
      ?auto_6904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6903 ?auto_6904 ) ( ON-TABLE ?auto_6899 ) ( ON ?auto_6900 ?auto_6899 ) ( not ( = ?auto_6899 ?auto_6900 ) ) ( not ( = ?auto_6899 ?auto_6901 ) ) ( not ( = ?auto_6899 ?auto_6902 ) ) ( not ( = ?auto_6899 ?auto_6903 ) ) ( not ( = ?auto_6899 ?auto_6904 ) ) ( not ( = ?auto_6900 ?auto_6901 ) ) ( not ( = ?auto_6900 ?auto_6902 ) ) ( not ( = ?auto_6900 ?auto_6903 ) ) ( not ( = ?auto_6900 ?auto_6904 ) ) ( not ( = ?auto_6901 ?auto_6902 ) ) ( not ( = ?auto_6901 ?auto_6903 ) ) ( not ( = ?auto_6901 ?auto_6904 ) ) ( not ( = ?auto_6902 ?auto_6903 ) ) ( not ( = ?auto_6902 ?auto_6904 ) ) ( not ( = ?auto_6903 ?auto_6904 ) ) ( ON ?auto_6902 ?auto_6903 ) ( CLEAR ?auto_6900 ) ( ON ?auto_6901 ?auto_6902 ) ( CLEAR ?auto_6901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6899 ?auto_6900 ?auto_6901 )
      ( MAKE-5PILE ?auto_6899 ?auto_6900 ?auto_6901 ?auto_6902 ?auto_6903 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6910 - BLOCK
      ?auto_6911 - BLOCK
      ?auto_6912 - BLOCK
      ?auto_6913 - BLOCK
      ?auto_6914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6914 ) ( ON-TABLE ?auto_6910 ) ( ON ?auto_6911 ?auto_6910 ) ( not ( = ?auto_6910 ?auto_6911 ) ) ( not ( = ?auto_6910 ?auto_6912 ) ) ( not ( = ?auto_6910 ?auto_6913 ) ) ( not ( = ?auto_6910 ?auto_6914 ) ) ( not ( = ?auto_6911 ?auto_6912 ) ) ( not ( = ?auto_6911 ?auto_6913 ) ) ( not ( = ?auto_6911 ?auto_6914 ) ) ( not ( = ?auto_6912 ?auto_6913 ) ) ( not ( = ?auto_6912 ?auto_6914 ) ) ( not ( = ?auto_6913 ?auto_6914 ) ) ( ON ?auto_6913 ?auto_6914 ) ( CLEAR ?auto_6911 ) ( ON ?auto_6912 ?auto_6913 ) ( CLEAR ?auto_6912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6910 ?auto_6911 ?auto_6912 )
      ( MAKE-5PILE ?auto_6910 ?auto_6911 ?auto_6912 ?auto_6913 ?auto_6914 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6920 - BLOCK
      ?auto_6921 - BLOCK
      ?auto_6922 - BLOCK
      ?auto_6923 - BLOCK
      ?auto_6924 - BLOCK
    )
    :vars
    (
      ?auto_6925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6924 ?auto_6925 ) ( ON-TABLE ?auto_6920 ) ( not ( = ?auto_6920 ?auto_6921 ) ) ( not ( = ?auto_6920 ?auto_6922 ) ) ( not ( = ?auto_6920 ?auto_6923 ) ) ( not ( = ?auto_6920 ?auto_6924 ) ) ( not ( = ?auto_6920 ?auto_6925 ) ) ( not ( = ?auto_6921 ?auto_6922 ) ) ( not ( = ?auto_6921 ?auto_6923 ) ) ( not ( = ?auto_6921 ?auto_6924 ) ) ( not ( = ?auto_6921 ?auto_6925 ) ) ( not ( = ?auto_6922 ?auto_6923 ) ) ( not ( = ?auto_6922 ?auto_6924 ) ) ( not ( = ?auto_6922 ?auto_6925 ) ) ( not ( = ?auto_6923 ?auto_6924 ) ) ( not ( = ?auto_6923 ?auto_6925 ) ) ( not ( = ?auto_6924 ?auto_6925 ) ) ( ON ?auto_6923 ?auto_6924 ) ( ON ?auto_6922 ?auto_6923 ) ( CLEAR ?auto_6920 ) ( ON ?auto_6921 ?auto_6922 ) ( CLEAR ?auto_6921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6920 ?auto_6921 )
      ( MAKE-5PILE ?auto_6920 ?auto_6921 ?auto_6922 ?auto_6923 ?auto_6924 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6931 - BLOCK
      ?auto_6932 - BLOCK
      ?auto_6933 - BLOCK
      ?auto_6934 - BLOCK
      ?auto_6935 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6935 ) ( ON-TABLE ?auto_6931 ) ( not ( = ?auto_6931 ?auto_6932 ) ) ( not ( = ?auto_6931 ?auto_6933 ) ) ( not ( = ?auto_6931 ?auto_6934 ) ) ( not ( = ?auto_6931 ?auto_6935 ) ) ( not ( = ?auto_6932 ?auto_6933 ) ) ( not ( = ?auto_6932 ?auto_6934 ) ) ( not ( = ?auto_6932 ?auto_6935 ) ) ( not ( = ?auto_6933 ?auto_6934 ) ) ( not ( = ?auto_6933 ?auto_6935 ) ) ( not ( = ?auto_6934 ?auto_6935 ) ) ( ON ?auto_6934 ?auto_6935 ) ( ON ?auto_6933 ?auto_6934 ) ( CLEAR ?auto_6931 ) ( ON ?auto_6932 ?auto_6933 ) ( CLEAR ?auto_6932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6931 ?auto_6932 )
      ( MAKE-5PILE ?auto_6931 ?auto_6932 ?auto_6933 ?auto_6934 ?auto_6935 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6941 - BLOCK
      ?auto_6942 - BLOCK
      ?auto_6943 - BLOCK
      ?auto_6944 - BLOCK
      ?auto_6945 - BLOCK
    )
    :vars
    (
      ?auto_6946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6945 ?auto_6946 ) ( not ( = ?auto_6941 ?auto_6942 ) ) ( not ( = ?auto_6941 ?auto_6943 ) ) ( not ( = ?auto_6941 ?auto_6944 ) ) ( not ( = ?auto_6941 ?auto_6945 ) ) ( not ( = ?auto_6941 ?auto_6946 ) ) ( not ( = ?auto_6942 ?auto_6943 ) ) ( not ( = ?auto_6942 ?auto_6944 ) ) ( not ( = ?auto_6942 ?auto_6945 ) ) ( not ( = ?auto_6942 ?auto_6946 ) ) ( not ( = ?auto_6943 ?auto_6944 ) ) ( not ( = ?auto_6943 ?auto_6945 ) ) ( not ( = ?auto_6943 ?auto_6946 ) ) ( not ( = ?auto_6944 ?auto_6945 ) ) ( not ( = ?auto_6944 ?auto_6946 ) ) ( not ( = ?auto_6945 ?auto_6946 ) ) ( ON ?auto_6944 ?auto_6945 ) ( ON ?auto_6943 ?auto_6944 ) ( ON ?auto_6942 ?auto_6943 ) ( ON ?auto_6941 ?auto_6942 ) ( CLEAR ?auto_6941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6941 )
      ( MAKE-5PILE ?auto_6941 ?auto_6942 ?auto_6943 ?auto_6944 ?auto_6945 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6952 - BLOCK
      ?auto_6953 - BLOCK
      ?auto_6954 - BLOCK
      ?auto_6955 - BLOCK
      ?auto_6956 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6956 ) ( not ( = ?auto_6952 ?auto_6953 ) ) ( not ( = ?auto_6952 ?auto_6954 ) ) ( not ( = ?auto_6952 ?auto_6955 ) ) ( not ( = ?auto_6952 ?auto_6956 ) ) ( not ( = ?auto_6953 ?auto_6954 ) ) ( not ( = ?auto_6953 ?auto_6955 ) ) ( not ( = ?auto_6953 ?auto_6956 ) ) ( not ( = ?auto_6954 ?auto_6955 ) ) ( not ( = ?auto_6954 ?auto_6956 ) ) ( not ( = ?auto_6955 ?auto_6956 ) ) ( ON ?auto_6955 ?auto_6956 ) ( ON ?auto_6954 ?auto_6955 ) ( ON ?auto_6953 ?auto_6954 ) ( ON ?auto_6952 ?auto_6953 ) ( CLEAR ?auto_6952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6952 )
      ( MAKE-5PILE ?auto_6952 ?auto_6953 ?auto_6954 ?auto_6955 ?auto_6956 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6962 - BLOCK
      ?auto_6963 - BLOCK
      ?auto_6964 - BLOCK
      ?auto_6965 - BLOCK
      ?auto_6966 - BLOCK
    )
    :vars
    (
      ?auto_6967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6962 ?auto_6963 ) ) ( not ( = ?auto_6962 ?auto_6964 ) ) ( not ( = ?auto_6962 ?auto_6965 ) ) ( not ( = ?auto_6962 ?auto_6966 ) ) ( not ( = ?auto_6963 ?auto_6964 ) ) ( not ( = ?auto_6963 ?auto_6965 ) ) ( not ( = ?auto_6963 ?auto_6966 ) ) ( not ( = ?auto_6964 ?auto_6965 ) ) ( not ( = ?auto_6964 ?auto_6966 ) ) ( not ( = ?auto_6965 ?auto_6966 ) ) ( ON ?auto_6962 ?auto_6967 ) ( not ( = ?auto_6966 ?auto_6967 ) ) ( not ( = ?auto_6965 ?auto_6967 ) ) ( not ( = ?auto_6964 ?auto_6967 ) ) ( not ( = ?auto_6963 ?auto_6967 ) ) ( not ( = ?auto_6962 ?auto_6967 ) ) ( ON ?auto_6963 ?auto_6962 ) ( ON ?auto_6964 ?auto_6963 ) ( ON ?auto_6965 ?auto_6964 ) ( ON ?auto_6966 ?auto_6965 ) ( CLEAR ?auto_6966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_6966 ?auto_6965 ?auto_6964 ?auto_6963 ?auto_6962 )
      ( MAKE-5PILE ?auto_6962 ?auto_6963 ?auto_6964 ?auto_6965 ?auto_6966 ) )
  )

)

