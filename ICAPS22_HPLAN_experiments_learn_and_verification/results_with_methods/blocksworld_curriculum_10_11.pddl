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
      ?auto_91792 - BLOCK
    )
    :vars
    (
      ?auto_91793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91792 ?auto_91793 ) ( CLEAR ?auto_91792 ) ( HAND-EMPTY ) ( not ( = ?auto_91792 ?auto_91793 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91792 ?auto_91793 )
      ( !PUTDOWN ?auto_91792 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91795 - BLOCK
    )
    :vars
    (
      ?auto_91796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91795 ?auto_91796 ) ( CLEAR ?auto_91795 ) ( HAND-EMPTY ) ( not ( = ?auto_91795 ?auto_91796 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91795 ?auto_91796 )
      ( !PUTDOWN ?auto_91795 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91799 - BLOCK
      ?auto_91800 - BLOCK
    )
    :vars
    (
      ?auto_91801 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91799 ) ( ON ?auto_91800 ?auto_91801 ) ( CLEAR ?auto_91800 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91799 ) ( not ( = ?auto_91799 ?auto_91800 ) ) ( not ( = ?auto_91799 ?auto_91801 ) ) ( not ( = ?auto_91800 ?auto_91801 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91800 ?auto_91801 )
      ( !STACK ?auto_91800 ?auto_91799 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91804 - BLOCK
      ?auto_91805 - BLOCK
    )
    :vars
    (
      ?auto_91806 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91804 ) ( ON ?auto_91805 ?auto_91806 ) ( CLEAR ?auto_91805 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91804 ) ( not ( = ?auto_91804 ?auto_91805 ) ) ( not ( = ?auto_91804 ?auto_91806 ) ) ( not ( = ?auto_91805 ?auto_91806 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91805 ?auto_91806 )
      ( !STACK ?auto_91805 ?auto_91804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91809 - BLOCK
      ?auto_91810 - BLOCK
    )
    :vars
    (
      ?auto_91811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91810 ?auto_91811 ) ( not ( = ?auto_91809 ?auto_91810 ) ) ( not ( = ?auto_91809 ?auto_91811 ) ) ( not ( = ?auto_91810 ?auto_91811 ) ) ( ON ?auto_91809 ?auto_91810 ) ( CLEAR ?auto_91809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91809 )
      ( MAKE-2PILE ?auto_91809 ?auto_91810 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91814 - BLOCK
      ?auto_91815 - BLOCK
    )
    :vars
    (
      ?auto_91816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91815 ?auto_91816 ) ( not ( = ?auto_91814 ?auto_91815 ) ) ( not ( = ?auto_91814 ?auto_91816 ) ) ( not ( = ?auto_91815 ?auto_91816 ) ) ( ON ?auto_91814 ?auto_91815 ) ( CLEAR ?auto_91814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91814 )
      ( MAKE-2PILE ?auto_91814 ?auto_91815 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91820 - BLOCK
      ?auto_91821 - BLOCK
      ?auto_91822 - BLOCK
    )
    :vars
    (
      ?auto_91823 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91821 ) ( ON ?auto_91822 ?auto_91823 ) ( CLEAR ?auto_91822 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91820 ) ( ON ?auto_91821 ?auto_91820 ) ( not ( = ?auto_91820 ?auto_91821 ) ) ( not ( = ?auto_91820 ?auto_91822 ) ) ( not ( = ?auto_91820 ?auto_91823 ) ) ( not ( = ?auto_91821 ?auto_91822 ) ) ( not ( = ?auto_91821 ?auto_91823 ) ) ( not ( = ?auto_91822 ?auto_91823 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91822 ?auto_91823 )
      ( !STACK ?auto_91822 ?auto_91821 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91827 - BLOCK
      ?auto_91828 - BLOCK
      ?auto_91829 - BLOCK
    )
    :vars
    (
      ?auto_91830 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91828 ) ( ON ?auto_91829 ?auto_91830 ) ( CLEAR ?auto_91829 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91827 ) ( ON ?auto_91828 ?auto_91827 ) ( not ( = ?auto_91827 ?auto_91828 ) ) ( not ( = ?auto_91827 ?auto_91829 ) ) ( not ( = ?auto_91827 ?auto_91830 ) ) ( not ( = ?auto_91828 ?auto_91829 ) ) ( not ( = ?auto_91828 ?auto_91830 ) ) ( not ( = ?auto_91829 ?auto_91830 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91829 ?auto_91830 )
      ( !STACK ?auto_91829 ?auto_91828 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91834 - BLOCK
      ?auto_91835 - BLOCK
      ?auto_91836 - BLOCK
    )
    :vars
    (
      ?auto_91837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91836 ?auto_91837 ) ( ON-TABLE ?auto_91834 ) ( not ( = ?auto_91834 ?auto_91835 ) ) ( not ( = ?auto_91834 ?auto_91836 ) ) ( not ( = ?auto_91834 ?auto_91837 ) ) ( not ( = ?auto_91835 ?auto_91836 ) ) ( not ( = ?auto_91835 ?auto_91837 ) ) ( not ( = ?auto_91836 ?auto_91837 ) ) ( CLEAR ?auto_91834 ) ( ON ?auto_91835 ?auto_91836 ) ( CLEAR ?auto_91835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91834 ?auto_91835 )
      ( MAKE-3PILE ?auto_91834 ?auto_91835 ?auto_91836 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91841 - BLOCK
      ?auto_91842 - BLOCK
      ?auto_91843 - BLOCK
    )
    :vars
    (
      ?auto_91844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91843 ?auto_91844 ) ( ON-TABLE ?auto_91841 ) ( not ( = ?auto_91841 ?auto_91842 ) ) ( not ( = ?auto_91841 ?auto_91843 ) ) ( not ( = ?auto_91841 ?auto_91844 ) ) ( not ( = ?auto_91842 ?auto_91843 ) ) ( not ( = ?auto_91842 ?auto_91844 ) ) ( not ( = ?auto_91843 ?auto_91844 ) ) ( CLEAR ?auto_91841 ) ( ON ?auto_91842 ?auto_91843 ) ( CLEAR ?auto_91842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91841 ?auto_91842 )
      ( MAKE-3PILE ?auto_91841 ?auto_91842 ?auto_91843 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91848 - BLOCK
      ?auto_91849 - BLOCK
      ?auto_91850 - BLOCK
    )
    :vars
    (
      ?auto_91851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91850 ?auto_91851 ) ( not ( = ?auto_91848 ?auto_91849 ) ) ( not ( = ?auto_91848 ?auto_91850 ) ) ( not ( = ?auto_91848 ?auto_91851 ) ) ( not ( = ?auto_91849 ?auto_91850 ) ) ( not ( = ?auto_91849 ?auto_91851 ) ) ( not ( = ?auto_91850 ?auto_91851 ) ) ( ON ?auto_91849 ?auto_91850 ) ( ON ?auto_91848 ?auto_91849 ) ( CLEAR ?auto_91848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91848 )
      ( MAKE-3PILE ?auto_91848 ?auto_91849 ?auto_91850 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91855 - BLOCK
      ?auto_91856 - BLOCK
      ?auto_91857 - BLOCK
    )
    :vars
    (
      ?auto_91858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91857 ?auto_91858 ) ( not ( = ?auto_91855 ?auto_91856 ) ) ( not ( = ?auto_91855 ?auto_91857 ) ) ( not ( = ?auto_91855 ?auto_91858 ) ) ( not ( = ?auto_91856 ?auto_91857 ) ) ( not ( = ?auto_91856 ?auto_91858 ) ) ( not ( = ?auto_91857 ?auto_91858 ) ) ( ON ?auto_91856 ?auto_91857 ) ( ON ?auto_91855 ?auto_91856 ) ( CLEAR ?auto_91855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91855 )
      ( MAKE-3PILE ?auto_91855 ?auto_91856 ?auto_91857 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91863 - BLOCK
      ?auto_91864 - BLOCK
      ?auto_91865 - BLOCK
      ?auto_91866 - BLOCK
    )
    :vars
    (
      ?auto_91867 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91865 ) ( ON ?auto_91866 ?auto_91867 ) ( CLEAR ?auto_91866 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91863 ) ( ON ?auto_91864 ?auto_91863 ) ( ON ?auto_91865 ?auto_91864 ) ( not ( = ?auto_91863 ?auto_91864 ) ) ( not ( = ?auto_91863 ?auto_91865 ) ) ( not ( = ?auto_91863 ?auto_91866 ) ) ( not ( = ?auto_91863 ?auto_91867 ) ) ( not ( = ?auto_91864 ?auto_91865 ) ) ( not ( = ?auto_91864 ?auto_91866 ) ) ( not ( = ?auto_91864 ?auto_91867 ) ) ( not ( = ?auto_91865 ?auto_91866 ) ) ( not ( = ?auto_91865 ?auto_91867 ) ) ( not ( = ?auto_91866 ?auto_91867 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91866 ?auto_91867 )
      ( !STACK ?auto_91866 ?auto_91865 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91872 - BLOCK
      ?auto_91873 - BLOCK
      ?auto_91874 - BLOCK
      ?auto_91875 - BLOCK
    )
    :vars
    (
      ?auto_91876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91874 ) ( ON ?auto_91875 ?auto_91876 ) ( CLEAR ?auto_91875 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91872 ) ( ON ?auto_91873 ?auto_91872 ) ( ON ?auto_91874 ?auto_91873 ) ( not ( = ?auto_91872 ?auto_91873 ) ) ( not ( = ?auto_91872 ?auto_91874 ) ) ( not ( = ?auto_91872 ?auto_91875 ) ) ( not ( = ?auto_91872 ?auto_91876 ) ) ( not ( = ?auto_91873 ?auto_91874 ) ) ( not ( = ?auto_91873 ?auto_91875 ) ) ( not ( = ?auto_91873 ?auto_91876 ) ) ( not ( = ?auto_91874 ?auto_91875 ) ) ( not ( = ?auto_91874 ?auto_91876 ) ) ( not ( = ?auto_91875 ?auto_91876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91875 ?auto_91876 )
      ( !STACK ?auto_91875 ?auto_91874 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91881 - BLOCK
      ?auto_91882 - BLOCK
      ?auto_91883 - BLOCK
      ?auto_91884 - BLOCK
    )
    :vars
    (
      ?auto_91885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91884 ?auto_91885 ) ( ON-TABLE ?auto_91881 ) ( ON ?auto_91882 ?auto_91881 ) ( not ( = ?auto_91881 ?auto_91882 ) ) ( not ( = ?auto_91881 ?auto_91883 ) ) ( not ( = ?auto_91881 ?auto_91884 ) ) ( not ( = ?auto_91881 ?auto_91885 ) ) ( not ( = ?auto_91882 ?auto_91883 ) ) ( not ( = ?auto_91882 ?auto_91884 ) ) ( not ( = ?auto_91882 ?auto_91885 ) ) ( not ( = ?auto_91883 ?auto_91884 ) ) ( not ( = ?auto_91883 ?auto_91885 ) ) ( not ( = ?auto_91884 ?auto_91885 ) ) ( CLEAR ?auto_91882 ) ( ON ?auto_91883 ?auto_91884 ) ( CLEAR ?auto_91883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91881 ?auto_91882 ?auto_91883 )
      ( MAKE-4PILE ?auto_91881 ?auto_91882 ?auto_91883 ?auto_91884 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91890 - BLOCK
      ?auto_91891 - BLOCK
      ?auto_91892 - BLOCK
      ?auto_91893 - BLOCK
    )
    :vars
    (
      ?auto_91894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91893 ?auto_91894 ) ( ON-TABLE ?auto_91890 ) ( ON ?auto_91891 ?auto_91890 ) ( not ( = ?auto_91890 ?auto_91891 ) ) ( not ( = ?auto_91890 ?auto_91892 ) ) ( not ( = ?auto_91890 ?auto_91893 ) ) ( not ( = ?auto_91890 ?auto_91894 ) ) ( not ( = ?auto_91891 ?auto_91892 ) ) ( not ( = ?auto_91891 ?auto_91893 ) ) ( not ( = ?auto_91891 ?auto_91894 ) ) ( not ( = ?auto_91892 ?auto_91893 ) ) ( not ( = ?auto_91892 ?auto_91894 ) ) ( not ( = ?auto_91893 ?auto_91894 ) ) ( CLEAR ?auto_91891 ) ( ON ?auto_91892 ?auto_91893 ) ( CLEAR ?auto_91892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91890 ?auto_91891 ?auto_91892 )
      ( MAKE-4PILE ?auto_91890 ?auto_91891 ?auto_91892 ?auto_91893 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91899 - BLOCK
      ?auto_91900 - BLOCK
      ?auto_91901 - BLOCK
      ?auto_91902 - BLOCK
    )
    :vars
    (
      ?auto_91903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91902 ?auto_91903 ) ( ON-TABLE ?auto_91899 ) ( not ( = ?auto_91899 ?auto_91900 ) ) ( not ( = ?auto_91899 ?auto_91901 ) ) ( not ( = ?auto_91899 ?auto_91902 ) ) ( not ( = ?auto_91899 ?auto_91903 ) ) ( not ( = ?auto_91900 ?auto_91901 ) ) ( not ( = ?auto_91900 ?auto_91902 ) ) ( not ( = ?auto_91900 ?auto_91903 ) ) ( not ( = ?auto_91901 ?auto_91902 ) ) ( not ( = ?auto_91901 ?auto_91903 ) ) ( not ( = ?auto_91902 ?auto_91903 ) ) ( ON ?auto_91901 ?auto_91902 ) ( CLEAR ?auto_91899 ) ( ON ?auto_91900 ?auto_91901 ) ( CLEAR ?auto_91900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91899 ?auto_91900 )
      ( MAKE-4PILE ?auto_91899 ?auto_91900 ?auto_91901 ?auto_91902 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91908 - BLOCK
      ?auto_91909 - BLOCK
      ?auto_91910 - BLOCK
      ?auto_91911 - BLOCK
    )
    :vars
    (
      ?auto_91912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91911 ?auto_91912 ) ( ON-TABLE ?auto_91908 ) ( not ( = ?auto_91908 ?auto_91909 ) ) ( not ( = ?auto_91908 ?auto_91910 ) ) ( not ( = ?auto_91908 ?auto_91911 ) ) ( not ( = ?auto_91908 ?auto_91912 ) ) ( not ( = ?auto_91909 ?auto_91910 ) ) ( not ( = ?auto_91909 ?auto_91911 ) ) ( not ( = ?auto_91909 ?auto_91912 ) ) ( not ( = ?auto_91910 ?auto_91911 ) ) ( not ( = ?auto_91910 ?auto_91912 ) ) ( not ( = ?auto_91911 ?auto_91912 ) ) ( ON ?auto_91910 ?auto_91911 ) ( CLEAR ?auto_91908 ) ( ON ?auto_91909 ?auto_91910 ) ( CLEAR ?auto_91909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91908 ?auto_91909 )
      ( MAKE-4PILE ?auto_91908 ?auto_91909 ?auto_91910 ?auto_91911 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91917 - BLOCK
      ?auto_91918 - BLOCK
      ?auto_91919 - BLOCK
      ?auto_91920 - BLOCK
    )
    :vars
    (
      ?auto_91921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91920 ?auto_91921 ) ( not ( = ?auto_91917 ?auto_91918 ) ) ( not ( = ?auto_91917 ?auto_91919 ) ) ( not ( = ?auto_91917 ?auto_91920 ) ) ( not ( = ?auto_91917 ?auto_91921 ) ) ( not ( = ?auto_91918 ?auto_91919 ) ) ( not ( = ?auto_91918 ?auto_91920 ) ) ( not ( = ?auto_91918 ?auto_91921 ) ) ( not ( = ?auto_91919 ?auto_91920 ) ) ( not ( = ?auto_91919 ?auto_91921 ) ) ( not ( = ?auto_91920 ?auto_91921 ) ) ( ON ?auto_91919 ?auto_91920 ) ( ON ?auto_91918 ?auto_91919 ) ( ON ?auto_91917 ?auto_91918 ) ( CLEAR ?auto_91917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91917 )
      ( MAKE-4PILE ?auto_91917 ?auto_91918 ?auto_91919 ?auto_91920 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91926 - BLOCK
      ?auto_91927 - BLOCK
      ?auto_91928 - BLOCK
      ?auto_91929 - BLOCK
    )
    :vars
    (
      ?auto_91930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91929 ?auto_91930 ) ( not ( = ?auto_91926 ?auto_91927 ) ) ( not ( = ?auto_91926 ?auto_91928 ) ) ( not ( = ?auto_91926 ?auto_91929 ) ) ( not ( = ?auto_91926 ?auto_91930 ) ) ( not ( = ?auto_91927 ?auto_91928 ) ) ( not ( = ?auto_91927 ?auto_91929 ) ) ( not ( = ?auto_91927 ?auto_91930 ) ) ( not ( = ?auto_91928 ?auto_91929 ) ) ( not ( = ?auto_91928 ?auto_91930 ) ) ( not ( = ?auto_91929 ?auto_91930 ) ) ( ON ?auto_91928 ?auto_91929 ) ( ON ?auto_91927 ?auto_91928 ) ( ON ?auto_91926 ?auto_91927 ) ( CLEAR ?auto_91926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91926 )
      ( MAKE-4PILE ?auto_91926 ?auto_91927 ?auto_91928 ?auto_91929 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91936 - BLOCK
      ?auto_91937 - BLOCK
      ?auto_91938 - BLOCK
      ?auto_91939 - BLOCK
      ?auto_91940 - BLOCK
    )
    :vars
    (
      ?auto_91941 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91939 ) ( ON ?auto_91940 ?auto_91941 ) ( CLEAR ?auto_91940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91936 ) ( ON ?auto_91937 ?auto_91936 ) ( ON ?auto_91938 ?auto_91937 ) ( ON ?auto_91939 ?auto_91938 ) ( not ( = ?auto_91936 ?auto_91937 ) ) ( not ( = ?auto_91936 ?auto_91938 ) ) ( not ( = ?auto_91936 ?auto_91939 ) ) ( not ( = ?auto_91936 ?auto_91940 ) ) ( not ( = ?auto_91936 ?auto_91941 ) ) ( not ( = ?auto_91937 ?auto_91938 ) ) ( not ( = ?auto_91937 ?auto_91939 ) ) ( not ( = ?auto_91937 ?auto_91940 ) ) ( not ( = ?auto_91937 ?auto_91941 ) ) ( not ( = ?auto_91938 ?auto_91939 ) ) ( not ( = ?auto_91938 ?auto_91940 ) ) ( not ( = ?auto_91938 ?auto_91941 ) ) ( not ( = ?auto_91939 ?auto_91940 ) ) ( not ( = ?auto_91939 ?auto_91941 ) ) ( not ( = ?auto_91940 ?auto_91941 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91940 ?auto_91941 )
      ( !STACK ?auto_91940 ?auto_91939 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91947 - BLOCK
      ?auto_91948 - BLOCK
      ?auto_91949 - BLOCK
      ?auto_91950 - BLOCK
      ?auto_91951 - BLOCK
    )
    :vars
    (
      ?auto_91952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91950 ) ( ON ?auto_91951 ?auto_91952 ) ( CLEAR ?auto_91951 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91947 ) ( ON ?auto_91948 ?auto_91947 ) ( ON ?auto_91949 ?auto_91948 ) ( ON ?auto_91950 ?auto_91949 ) ( not ( = ?auto_91947 ?auto_91948 ) ) ( not ( = ?auto_91947 ?auto_91949 ) ) ( not ( = ?auto_91947 ?auto_91950 ) ) ( not ( = ?auto_91947 ?auto_91951 ) ) ( not ( = ?auto_91947 ?auto_91952 ) ) ( not ( = ?auto_91948 ?auto_91949 ) ) ( not ( = ?auto_91948 ?auto_91950 ) ) ( not ( = ?auto_91948 ?auto_91951 ) ) ( not ( = ?auto_91948 ?auto_91952 ) ) ( not ( = ?auto_91949 ?auto_91950 ) ) ( not ( = ?auto_91949 ?auto_91951 ) ) ( not ( = ?auto_91949 ?auto_91952 ) ) ( not ( = ?auto_91950 ?auto_91951 ) ) ( not ( = ?auto_91950 ?auto_91952 ) ) ( not ( = ?auto_91951 ?auto_91952 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91951 ?auto_91952 )
      ( !STACK ?auto_91951 ?auto_91950 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91958 - BLOCK
      ?auto_91959 - BLOCK
      ?auto_91960 - BLOCK
      ?auto_91961 - BLOCK
      ?auto_91962 - BLOCK
    )
    :vars
    (
      ?auto_91963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91962 ?auto_91963 ) ( ON-TABLE ?auto_91958 ) ( ON ?auto_91959 ?auto_91958 ) ( ON ?auto_91960 ?auto_91959 ) ( not ( = ?auto_91958 ?auto_91959 ) ) ( not ( = ?auto_91958 ?auto_91960 ) ) ( not ( = ?auto_91958 ?auto_91961 ) ) ( not ( = ?auto_91958 ?auto_91962 ) ) ( not ( = ?auto_91958 ?auto_91963 ) ) ( not ( = ?auto_91959 ?auto_91960 ) ) ( not ( = ?auto_91959 ?auto_91961 ) ) ( not ( = ?auto_91959 ?auto_91962 ) ) ( not ( = ?auto_91959 ?auto_91963 ) ) ( not ( = ?auto_91960 ?auto_91961 ) ) ( not ( = ?auto_91960 ?auto_91962 ) ) ( not ( = ?auto_91960 ?auto_91963 ) ) ( not ( = ?auto_91961 ?auto_91962 ) ) ( not ( = ?auto_91961 ?auto_91963 ) ) ( not ( = ?auto_91962 ?auto_91963 ) ) ( CLEAR ?auto_91960 ) ( ON ?auto_91961 ?auto_91962 ) ( CLEAR ?auto_91961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91958 ?auto_91959 ?auto_91960 ?auto_91961 )
      ( MAKE-5PILE ?auto_91958 ?auto_91959 ?auto_91960 ?auto_91961 ?auto_91962 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91969 - BLOCK
      ?auto_91970 - BLOCK
      ?auto_91971 - BLOCK
      ?auto_91972 - BLOCK
      ?auto_91973 - BLOCK
    )
    :vars
    (
      ?auto_91974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91973 ?auto_91974 ) ( ON-TABLE ?auto_91969 ) ( ON ?auto_91970 ?auto_91969 ) ( ON ?auto_91971 ?auto_91970 ) ( not ( = ?auto_91969 ?auto_91970 ) ) ( not ( = ?auto_91969 ?auto_91971 ) ) ( not ( = ?auto_91969 ?auto_91972 ) ) ( not ( = ?auto_91969 ?auto_91973 ) ) ( not ( = ?auto_91969 ?auto_91974 ) ) ( not ( = ?auto_91970 ?auto_91971 ) ) ( not ( = ?auto_91970 ?auto_91972 ) ) ( not ( = ?auto_91970 ?auto_91973 ) ) ( not ( = ?auto_91970 ?auto_91974 ) ) ( not ( = ?auto_91971 ?auto_91972 ) ) ( not ( = ?auto_91971 ?auto_91973 ) ) ( not ( = ?auto_91971 ?auto_91974 ) ) ( not ( = ?auto_91972 ?auto_91973 ) ) ( not ( = ?auto_91972 ?auto_91974 ) ) ( not ( = ?auto_91973 ?auto_91974 ) ) ( CLEAR ?auto_91971 ) ( ON ?auto_91972 ?auto_91973 ) ( CLEAR ?auto_91972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91969 ?auto_91970 ?auto_91971 ?auto_91972 )
      ( MAKE-5PILE ?auto_91969 ?auto_91970 ?auto_91971 ?auto_91972 ?auto_91973 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91980 - BLOCK
      ?auto_91981 - BLOCK
      ?auto_91982 - BLOCK
      ?auto_91983 - BLOCK
      ?auto_91984 - BLOCK
    )
    :vars
    (
      ?auto_91985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91984 ?auto_91985 ) ( ON-TABLE ?auto_91980 ) ( ON ?auto_91981 ?auto_91980 ) ( not ( = ?auto_91980 ?auto_91981 ) ) ( not ( = ?auto_91980 ?auto_91982 ) ) ( not ( = ?auto_91980 ?auto_91983 ) ) ( not ( = ?auto_91980 ?auto_91984 ) ) ( not ( = ?auto_91980 ?auto_91985 ) ) ( not ( = ?auto_91981 ?auto_91982 ) ) ( not ( = ?auto_91981 ?auto_91983 ) ) ( not ( = ?auto_91981 ?auto_91984 ) ) ( not ( = ?auto_91981 ?auto_91985 ) ) ( not ( = ?auto_91982 ?auto_91983 ) ) ( not ( = ?auto_91982 ?auto_91984 ) ) ( not ( = ?auto_91982 ?auto_91985 ) ) ( not ( = ?auto_91983 ?auto_91984 ) ) ( not ( = ?auto_91983 ?auto_91985 ) ) ( not ( = ?auto_91984 ?auto_91985 ) ) ( ON ?auto_91983 ?auto_91984 ) ( CLEAR ?auto_91981 ) ( ON ?auto_91982 ?auto_91983 ) ( CLEAR ?auto_91982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91980 ?auto_91981 ?auto_91982 )
      ( MAKE-5PILE ?auto_91980 ?auto_91981 ?auto_91982 ?auto_91983 ?auto_91984 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91991 - BLOCK
      ?auto_91992 - BLOCK
      ?auto_91993 - BLOCK
      ?auto_91994 - BLOCK
      ?auto_91995 - BLOCK
    )
    :vars
    (
      ?auto_91996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91995 ?auto_91996 ) ( ON-TABLE ?auto_91991 ) ( ON ?auto_91992 ?auto_91991 ) ( not ( = ?auto_91991 ?auto_91992 ) ) ( not ( = ?auto_91991 ?auto_91993 ) ) ( not ( = ?auto_91991 ?auto_91994 ) ) ( not ( = ?auto_91991 ?auto_91995 ) ) ( not ( = ?auto_91991 ?auto_91996 ) ) ( not ( = ?auto_91992 ?auto_91993 ) ) ( not ( = ?auto_91992 ?auto_91994 ) ) ( not ( = ?auto_91992 ?auto_91995 ) ) ( not ( = ?auto_91992 ?auto_91996 ) ) ( not ( = ?auto_91993 ?auto_91994 ) ) ( not ( = ?auto_91993 ?auto_91995 ) ) ( not ( = ?auto_91993 ?auto_91996 ) ) ( not ( = ?auto_91994 ?auto_91995 ) ) ( not ( = ?auto_91994 ?auto_91996 ) ) ( not ( = ?auto_91995 ?auto_91996 ) ) ( ON ?auto_91994 ?auto_91995 ) ( CLEAR ?auto_91992 ) ( ON ?auto_91993 ?auto_91994 ) ( CLEAR ?auto_91993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91991 ?auto_91992 ?auto_91993 )
      ( MAKE-5PILE ?auto_91991 ?auto_91992 ?auto_91993 ?auto_91994 ?auto_91995 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92002 - BLOCK
      ?auto_92003 - BLOCK
      ?auto_92004 - BLOCK
      ?auto_92005 - BLOCK
      ?auto_92006 - BLOCK
    )
    :vars
    (
      ?auto_92007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92006 ?auto_92007 ) ( ON-TABLE ?auto_92002 ) ( not ( = ?auto_92002 ?auto_92003 ) ) ( not ( = ?auto_92002 ?auto_92004 ) ) ( not ( = ?auto_92002 ?auto_92005 ) ) ( not ( = ?auto_92002 ?auto_92006 ) ) ( not ( = ?auto_92002 ?auto_92007 ) ) ( not ( = ?auto_92003 ?auto_92004 ) ) ( not ( = ?auto_92003 ?auto_92005 ) ) ( not ( = ?auto_92003 ?auto_92006 ) ) ( not ( = ?auto_92003 ?auto_92007 ) ) ( not ( = ?auto_92004 ?auto_92005 ) ) ( not ( = ?auto_92004 ?auto_92006 ) ) ( not ( = ?auto_92004 ?auto_92007 ) ) ( not ( = ?auto_92005 ?auto_92006 ) ) ( not ( = ?auto_92005 ?auto_92007 ) ) ( not ( = ?auto_92006 ?auto_92007 ) ) ( ON ?auto_92005 ?auto_92006 ) ( ON ?auto_92004 ?auto_92005 ) ( CLEAR ?auto_92002 ) ( ON ?auto_92003 ?auto_92004 ) ( CLEAR ?auto_92003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92002 ?auto_92003 )
      ( MAKE-5PILE ?auto_92002 ?auto_92003 ?auto_92004 ?auto_92005 ?auto_92006 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92013 - BLOCK
      ?auto_92014 - BLOCK
      ?auto_92015 - BLOCK
      ?auto_92016 - BLOCK
      ?auto_92017 - BLOCK
    )
    :vars
    (
      ?auto_92018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92017 ?auto_92018 ) ( ON-TABLE ?auto_92013 ) ( not ( = ?auto_92013 ?auto_92014 ) ) ( not ( = ?auto_92013 ?auto_92015 ) ) ( not ( = ?auto_92013 ?auto_92016 ) ) ( not ( = ?auto_92013 ?auto_92017 ) ) ( not ( = ?auto_92013 ?auto_92018 ) ) ( not ( = ?auto_92014 ?auto_92015 ) ) ( not ( = ?auto_92014 ?auto_92016 ) ) ( not ( = ?auto_92014 ?auto_92017 ) ) ( not ( = ?auto_92014 ?auto_92018 ) ) ( not ( = ?auto_92015 ?auto_92016 ) ) ( not ( = ?auto_92015 ?auto_92017 ) ) ( not ( = ?auto_92015 ?auto_92018 ) ) ( not ( = ?auto_92016 ?auto_92017 ) ) ( not ( = ?auto_92016 ?auto_92018 ) ) ( not ( = ?auto_92017 ?auto_92018 ) ) ( ON ?auto_92016 ?auto_92017 ) ( ON ?auto_92015 ?auto_92016 ) ( CLEAR ?auto_92013 ) ( ON ?auto_92014 ?auto_92015 ) ( CLEAR ?auto_92014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92013 ?auto_92014 )
      ( MAKE-5PILE ?auto_92013 ?auto_92014 ?auto_92015 ?auto_92016 ?auto_92017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92024 - BLOCK
      ?auto_92025 - BLOCK
      ?auto_92026 - BLOCK
      ?auto_92027 - BLOCK
      ?auto_92028 - BLOCK
    )
    :vars
    (
      ?auto_92029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92028 ?auto_92029 ) ( not ( = ?auto_92024 ?auto_92025 ) ) ( not ( = ?auto_92024 ?auto_92026 ) ) ( not ( = ?auto_92024 ?auto_92027 ) ) ( not ( = ?auto_92024 ?auto_92028 ) ) ( not ( = ?auto_92024 ?auto_92029 ) ) ( not ( = ?auto_92025 ?auto_92026 ) ) ( not ( = ?auto_92025 ?auto_92027 ) ) ( not ( = ?auto_92025 ?auto_92028 ) ) ( not ( = ?auto_92025 ?auto_92029 ) ) ( not ( = ?auto_92026 ?auto_92027 ) ) ( not ( = ?auto_92026 ?auto_92028 ) ) ( not ( = ?auto_92026 ?auto_92029 ) ) ( not ( = ?auto_92027 ?auto_92028 ) ) ( not ( = ?auto_92027 ?auto_92029 ) ) ( not ( = ?auto_92028 ?auto_92029 ) ) ( ON ?auto_92027 ?auto_92028 ) ( ON ?auto_92026 ?auto_92027 ) ( ON ?auto_92025 ?auto_92026 ) ( ON ?auto_92024 ?auto_92025 ) ( CLEAR ?auto_92024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92024 )
      ( MAKE-5PILE ?auto_92024 ?auto_92025 ?auto_92026 ?auto_92027 ?auto_92028 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92035 - BLOCK
      ?auto_92036 - BLOCK
      ?auto_92037 - BLOCK
      ?auto_92038 - BLOCK
      ?auto_92039 - BLOCK
    )
    :vars
    (
      ?auto_92040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92039 ?auto_92040 ) ( not ( = ?auto_92035 ?auto_92036 ) ) ( not ( = ?auto_92035 ?auto_92037 ) ) ( not ( = ?auto_92035 ?auto_92038 ) ) ( not ( = ?auto_92035 ?auto_92039 ) ) ( not ( = ?auto_92035 ?auto_92040 ) ) ( not ( = ?auto_92036 ?auto_92037 ) ) ( not ( = ?auto_92036 ?auto_92038 ) ) ( not ( = ?auto_92036 ?auto_92039 ) ) ( not ( = ?auto_92036 ?auto_92040 ) ) ( not ( = ?auto_92037 ?auto_92038 ) ) ( not ( = ?auto_92037 ?auto_92039 ) ) ( not ( = ?auto_92037 ?auto_92040 ) ) ( not ( = ?auto_92038 ?auto_92039 ) ) ( not ( = ?auto_92038 ?auto_92040 ) ) ( not ( = ?auto_92039 ?auto_92040 ) ) ( ON ?auto_92038 ?auto_92039 ) ( ON ?auto_92037 ?auto_92038 ) ( ON ?auto_92036 ?auto_92037 ) ( ON ?auto_92035 ?auto_92036 ) ( CLEAR ?auto_92035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92035 )
      ( MAKE-5PILE ?auto_92035 ?auto_92036 ?auto_92037 ?auto_92038 ?auto_92039 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92047 - BLOCK
      ?auto_92048 - BLOCK
      ?auto_92049 - BLOCK
      ?auto_92050 - BLOCK
      ?auto_92051 - BLOCK
      ?auto_92052 - BLOCK
    )
    :vars
    (
      ?auto_92053 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_92051 ) ( ON ?auto_92052 ?auto_92053 ) ( CLEAR ?auto_92052 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92047 ) ( ON ?auto_92048 ?auto_92047 ) ( ON ?auto_92049 ?auto_92048 ) ( ON ?auto_92050 ?auto_92049 ) ( ON ?auto_92051 ?auto_92050 ) ( not ( = ?auto_92047 ?auto_92048 ) ) ( not ( = ?auto_92047 ?auto_92049 ) ) ( not ( = ?auto_92047 ?auto_92050 ) ) ( not ( = ?auto_92047 ?auto_92051 ) ) ( not ( = ?auto_92047 ?auto_92052 ) ) ( not ( = ?auto_92047 ?auto_92053 ) ) ( not ( = ?auto_92048 ?auto_92049 ) ) ( not ( = ?auto_92048 ?auto_92050 ) ) ( not ( = ?auto_92048 ?auto_92051 ) ) ( not ( = ?auto_92048 ?auto_92052 ) ) ( not ( = ?auto_92048 ?auto_92053 ) ) ( not ( = ?auto_92049 ?auto_92050 ) ) ( not ( = ?auto_92049 ?auto_92051 ) ) ( not ( = ?auto_92049 ?auto_92052 ) ) ( not ( = ?auto_92049 ?auto_92053 ) ) ( not ( = ?auto_92050 ?auto_92051 ) ) ( not ( = ?auto_92050 ?auto_92052 ) ) ( not ( = ?auto_92050 ?auto_92053 ) ) ( not ( = ?auto_92051 ?auto_92052 ) ) ( not ( = ?auto_92051 ?auto_92053 ) ) ( not ( = ?auto_92052 ?auto_92053 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92052 ?auto_92053 )
      ( !STACK ?auto_92052 ?auto_92051 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92060 - BLOCK
      ?auto_92061 - BLOCK
      ?auto_92062 - BLOCK
      ?auto_92063 - BLOCK
      ?auto_92064 - BLOCK
      ?auto_92065 - BLOCK
    )
    :vars
    (
      ?auto_92066 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_92064 ) ( ON ?auto_92065 ?auto_92066 ) ( CLEAR ?auto_92065 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92060 ) ( ON ?auto_92061 ?auto_92060 ) ( ON ?auto_92062 ?auto_92061 ) ( ON ?auto_92063 ?auto_92062 ) ( ON ?auto_92064 ?auto_92063 ) ( not ( = ?auto_92060 ?auto_92061 ) ) ( not ( = ?auto_92060 ?auto_92062 ) ) ( not ( = ?auto_92060 ?auto_92063 ) ) ( not ( = ?auto_92060 ?auto_92064 ) ) ( not ( = ?auto_92060 ?auto_92065 ) ) ( not ( = ?auto_92060 ?auto_92066 ) ) ( not ( = ?auto_92061 ?auto_92062 ) ) ( not ( = ?auto_92061 ?auto_92063 ) ) ( not ( = ?auto_92061 ?auto_92064 ) ) ( not ( = ?auto_92061 ?auto_92065 ) ) ( not ( = ?auto_92061 ?auto_92066 ) ) ( not ( = ?auto_92062 ?auto_92063 ) ) ( not ( = ?auto_92062 ?auto_92064 ) ) ( not ( = ?auto_92062 ?auto_92065 ) ) ( not ( = ?auto_92062 ?auto_92066 ) ) ( not ( = ?auto_92063 ?auto_92064 ) ) ( not ( = ?auto_92063 ?auto_92065 ) ) ( not ( = ?auto_92063 ?auto_92066 ) ) ( not ( = ?auto_92064 ?auto_92065 ) ) ( not ( = ?auto_92064 ?auto_92066 ) ) ( not ( = ?auto_92065 ?auto_92066 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92065 ?auto_92066 )
      ( !STACK ?auto_92065 ?auto_92064 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92073 - BLOCK
      ?auto_92074 - BLOCK
      ?auto_92075 - BLOCK
      ?auto_92076 - BLOCK
      ?auto_92077 - BLOCK
      ?auto_92078 - BLOCK
    )
    :vars
    (
      ?auto_92079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92078 ?auto_92079 ) ( ON-TABLE ?auto_92073 ) ( ON ?auto_92074 ?auto_92073 ) ( ON ?auto_92075 ?auto_92074 ) ( ON ?auto_92076 ?auto_92075 ) ( not ( = ?auto_92073 ?auto_92074 ) ) ( not ( = ?auto_92073 ?auto_92075 ) ) ( not ( = ?auto_92073 ?auto_92076 ) ) ( not ( = ?auto_92073 ?auto_92077 ) ) ( not ( = ?auto_92073 ?auto_92078 ) ) ( not ( = ?auto_92073 ?auto_92079 ) ) ( not ( = ?auto_92074 ?auto_92075 ) ) ( not ( = ?auto_92074 ?auto_92076 ) ) ( not ( = ?auto_92074 ?auto_92077 ) ) ( not ( = ?auto_92074 ?auto_92078 ) ) ( not ( = ?auto_92074 ?auto_92079 ) ) ( not ( = ?auto_92075 ?auto_92076 ) ) ( not ( = ?auto_92075 ?auto_92077 ) ) ( not ( = ?auto_92075 ?auto_92078 ) ) ( not ( = ?auto_92075 ?auto_92079 ) ) ( not ( = ?auto_92076 ?auto_92077 ) ) ( not ( = ?auto_92076 ?auto_92078 ) ) ( not ( = ?auto_92076 ?auto_92079 ) ) ( not ( = ?auto_92077 ?auto_92078 ) ) ( not ( = ?auto_92077 ?auto_92079 ) ) ( not ( = ?auto_92078 ?auto_92079 ) ) ( CLEAR ?auto_92076 ) ( ON ?auto_92077 ?auto_92078 ) ( CLEAR ?auto_92077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92073 ?auto_92074 ?auto_92075 ?auto_92076 ?auto_92077 )
      ( MAKE-6PILE ?auto_92073 ?auto_92074 ?auto_92075 ?auto_92076 ?auto_92077 ?auto_92078 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92086 - BLOCK
      ?auto_92087 - BLOCK
      ?auto_92088 - BLOCK
      ?auto_92089 - BLOCK
      ?auto_92090 - BLOCK
      ?auto_92091 - BLOCK
    )
    :vars
    (
      ?auto_92092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92091 ?auto_92092 ) ( ON-TABLE ?auto_92086 ) ( ON ?auto_92087 ?auto_92086 ) ( ON ?auto_92088 ?auto_92087 ) ( ON ?auto_92089 ?auto_92088 ) ( not ( = ?auto_92086 ?auto_92087 ) ) ( not ( = ?auto_92086 ?auto_92088 ) ) ( not ( = ?auto_92086 ?auto_92089 ) ) ( not ( = ?auto_92086 ?auto_92090 ) ) ( not ( = ?auto_92086 ?auto_92091 ) ) ( not ( = ?auto_92086 ?auto_92092 ) ) ( not ( = ?auto_92087 ?auto_92088 ) ) ( not ( = ?auto_92087 ?auto_92089 ) ) ( not ( = ?auto_92087 ?auto_92090 ) ) ( not ( = ?auto_92087 ?auto_92091 ) ) ( not ( = ?auto_92087 ?auto_92092 ) ) ( not ( = ?auto_92088 ?auto_92089 ) ) ( not ( = ?auto_92088 ?auto_92090 ) ) ( not ( = ?auto_92088 ?auto_92091 ) ) ( not ( = ?auto_92088 ?auto_92092 ) ) ( not ( = ?auto_92089 ?auto_92090 ) ) ( not ( = ?auto_92089 ?auto_92091 ) ) ( not ( = ?auto_92089 ?auto_92092 ) ) ( not ( = ?auto_92090 ?auto_92091 ) ) ( not ( = ?auto_92090 ?auto_92092 ) ) ( not ( = ?auto_92091 ?auto_92092 ) ) ( CLEAR ?auto_92089 ) ( ON ?auto_92090 ?auto_92091 ) ( CLEAR ?auto_92090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92086 ?auto_92087 ?auto_92088 ?auto_92089 ?auto_92090 )
      ( MAKE-6PILE ?auto_92086 ?auto_92087 ?auto_92088 ?auto_92089 ?auto_92090 ?auto_92091 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92099 - BLOCK
      ?auto_92100 - BLOCK
      ?auto_92101 - BLOCK
      ?auto_92102 - BLOCK
      ?auto_92103 - BLOCK
      ?auto_92104 - BLOCK
    )
    :vars
    (
      ?auto_92105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92104 ?auto_92105 ) ( ON-TABLE ?auto_92099 ) ( ON ?auto_92100 ?auto_92099 ) ( ON ?auto_92101 ?auto_92100 ) ( not ( = ?auto_92099 ?auto_92100 ) ) ( not ( = ?auto_92099 ?auto_92101 ) ) ( not ( = ?auto_92099 ?auto_92102 ) ) ( not ( = ?auto_92099 ?auto_92103 ) ) ( not ( = ?auto_92099 ?auto_92104 ) ) ( not ( = ?auto_92099 ?auto_92105 ) ) ( not ( = ?auto_92100 ?auto_92101 ) ) ( not ( = ?auto_92100 ?auto_92102 ) ) ( not ( = ?auto_92100 ?auto_92103 ) ) ( not ( = ?auto_92100 ?auto_92104 ) ) ( not ( = ?auto_92100 ?auto_92105 ) ) ( not ( = ?auto_92101 ?auto_92102 ) ) ( not ( = ?auto_92101 ?auto_92103 ) ) ( not ( = ?auto_92101 ?auto_92104 ) ) ( not ( = ?auto_92101 ?auto_92105 ) ) ( not ( = ?auto_92102 ?auto_92103 ) ) ( not ( = ?auto_92102 ?auto_92104 ) ) ( not ( = ?auto_92102 ?auto_92105 ) ) ( not ( = ?auto_92103 ?auto_92104 ) ) ( not ( = ?auto_92103 ?auto_92105 ) ) ( not ( = ?auto_92104 ?auto_92105 ) ) ( ON ?auto_92103 ?auto_92104 ) ( CLEAR ?auto_92101 ) ( ON ?auto_92102 ?auto_92103 ) ( CLEAR ?auto_92102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92099 ?auto_92100 ?auto_92101 ?auto_92102 )
      ( MAKE-6PILE ?auto_92099 ?auto_92100 ?auto_92101 ?auto_92102 ?auto_92103 ?auto_92104 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92112 - BLOCK
      ?auto_92113 - BLOCK
      ?auto_92114 - BLOCK
      ?auto_92115 - BLOCK
      ?auto_92116 - BLOCK
      ?auto_92117 - BLOCK
    )
    :vars
    (
      ?auto_92118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92117 ?auto_92118 ) ( ON-TABLE ?auto_92112 ) ( ON ?auto_92113 ?auto_92112 ) ( ON ?auto_92114 ?auto_92113 ) ( not ( = ?auto_92112 ?auto_92113 ) ) ( not ( = ?auto_92112 ?auto_92114 ) ) ( not ( = ?auto_92112 ?auto_92115 ) ) ( not ( = ?auto_92112 ?auto_92116 ) ) ( not ( = ?auto_92112 ?auto_92117 ) ) ( not ( = ?auto_92112 ?auto_92118 ) ) ( not ( = ?auto_92113 ?auto_92114 ) ) ( not ( = ?auto_92113 ?auto_92115 ) ) ( not ( = ?auto_92113 ?auto_92116 ) ) ( not ( = ?auto_92113 ?auto_92117 ) ) ( not ( = ?auto_92113 ?auto_92118 ) ) ( not ( = ?auto_92114 ?auto_92115 ) ) ( not ( = ?auto_92114 ?auto_92116 ) ) ( not ( = ?auto_92114 ?auto_92117 ) ) ( not ( = ?auto_92114 ?auto_92118 ) ) ( not ( = ?auto_92115 ?auto_92116 ) ) ( not ( = ?auto_92115 ?auto_92117 ) ) ( not ( = ?auto_92115 ?auto_92118 ) ) ( not ( = ?auto_92116 ?auto_92117 ) ) ( not ( = ?auto_92116 ?auto_92118 ) ) ( not ( = ?auto_92117 ?auto_92118 ) ) ( ON ?auto_92116 ?auto_92117 ) ( CLEAR ?auto_92114 ) ( ON ?auto_92115 ?auto_92116 ) ( CLEAR ?auto_92115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92112 ?auto_92113 ?auto_92114 ?auto_92115 )
      ( MAKE-6PILE ?auto_92112 ?auto_92113 ?auto_92114 ?auto_92115 ?auto_92116 ?auto_92117 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92125 - BLOCK
      ?auto_92126 - BLOCK
      ?auto_92127 - BLOCK
      ?auto_92128 - BLOCK
      ?auto_92129 - BLOCK
      ?auto_92130 - BLOCK
    )
    :vars
    (
      ?auto_92131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92130 ?auto_92131 ) ( ON-TABLE ?auto_92125 ) ( ON ?auto_92126 ?auto_92125 ) ( not ( = ?auto_92125 ?auto_92126 ) ) ( not ( = ?auto_92125 ?auto_92127 ) ) ( not ( = ?auto_92125 ?auto_92128 ) ) ( not ( = ?auto_92125 ?auto_92129 ) ) ( not ( = ?auto_92125 ?auto_92130 ) ) ( not ( = ?auto_92125 ?auto_92131 ) ) ( not ( = ?auto_92126 ?auto_92127 ) ) ( not ( = ?auto_92126 ?auto_92128 ) ) ( not ( = ?auto_92126 ?auto_92129 ) ) ( not ( = ?auto_92126 ?auto_92130 ) ) ( not ( = ?auto_92126 ?auto_92131 ) ) ( not ( = ?auto_92127 ?auto_92128 ) ) ( not ( = ?auto_92127 ?auto_92129 ) ) ( not ( = ?auto_92127 ?auto_92130 ) ) ( not ( = ?auto_92127 ?auto_92131 ) ) ( not ( = ?auto_92128 ?auto_92129 ) ) ( not ( = ?auto_92128 ?auto_92130 ) ) ( not ( = ?auto_92128 ?auto_92131 ) ) ( not ( = ?auto_92129 ?auto_92130 ) ) ( not ( = ?auto_92129 ?auto_92131 ) ) ( not ( = ?auto_92130 ?auto_92131 ) ) ( ON ?auto_92129 ?auto_92130 ) ( ON ?auto_92128 ?auto_92129 ) ( CLEAR ?auto_92126 ) ( ON ?auto_92127 ?auto_92128 ) ( CLEAR ?auto_92127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92125 ?auto_92126 ?auto_92127 )
      ( MAKE-6PILE ?auto_92125 ?auto_92126 ?auto_92127 ?auto_92128 ?auto_92129 ?auto_92130 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92138 - BLOCK
      ?auto_92139 - BLOCK
      ?auto_92140 - BLOCK
      ?auto_92141 - BLOCK
      ?auto_92142 - BLOCK
      ?auto_92143 - BLOCK
    )
    :vars
    (
      ?auto_92144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92143 ?auto_92144 ) ( ON-TABLE ?auto_92138 ) ( ON ?auto_92139 ?auto_92138 ) ( not ( = ?auto_92138 ?auto_92139 ) ) ( not ( = ?auto_92138 ?auto_92140 ) ) ( not ( = ?auto_92138 ?auto_92141 ) ) ( not ( = ?auto_92138 ?auto_92142 ) ) ( not ( = ?auto_92138 ?auto_92143 ) ) ( not ( = ?auto_92138 ?auto_92144 ) ) ( not ( = ?auto_92139 ?auto_92140 ) ) ( not ( = ?auto_92139 ?auto_92141 ) ) ( not ( = ?auto_92139 ?auto_92142 ) ) ( not ( = ?auto_92139 ?auto_92143 ) ) ( not ( = ?auto_92139 ?auto_92144 ) ) ( not ( = ?auto_92140 ?auto_92141 ) ) ( not ( = ?auto_92140 ?auto_92142 ) ) ( not ( = ?auto_92140 ?auto_92143 ) ) ( not ( = ?auto_92140 ?auto_92144 ) ) ( not ( = ?auto_92141 ?auto_92142 ) ) ( not ( = ?auto_92141 ?auto_92143 ) ) ( not ( = ?auto_92141 ?auto_92144 ) ) ( not ( = ?auto_92142 ?auto_92143 ) ) ( not ( = ?auto_92142 ?auto_92144 ) ) ( not ( = ?auto_92143 ?auto_92144 ) ) ( ON ?auto_92142 ?auto_92143 ) ( ON ?auto_92141 ?auto_92142 ) ( CLEAR ?auto_92139 ) ( ON ?auto_92140 ?auto_92141 ) ( CLEAR ?auto_92140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92138 ?auto_92139 ?auto_92140 )
      ( MAKE-6PILE ?auto_92138 ?auto_92139 ?auto_92140 ?auto_92141 ?auto_92142 ?auto_92143 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92151 - BLOCK
      ?auto_92152 - BLOCK
      ?auto_92153 - BLOCK
      ?auto_92154 - BLOCK
      ?auto_92155 - BLOCK
      ?auto_92156 - BLOCK
    )
    :vars
    (
      ?auto_92157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92156 ?auto_92157 ) ( ON-TABLE ?auto_92151 ) ( not ( = ?auto_92151 ?auto_92152 ) ) ( not ( = ?auto_92151 ?auto_92153 ) ) ( not ( = ?auto_92151 ?auto_92154 ) ) ( not ( = ?auto_92151 ?auto_92155 ) ) ( not ( = ?auto_92151 ?auto_92156 ) ) ( not ( = ?auto_92151 ?auto_92157 ) ) ( not ( = ?auto_92152 ?auto_92153 ) ) ( not ( = ?auto_92152 ?auto_92154 ) ) ( not ( = ?auto_92152 ?auto_92155 ) ) ( not ( = ?auto_92152 ?auto_92156 ) ) ( not ( = ?auto_92152 ?auto_92157 ) ) ( not ( = ?auto_92153 ?auto_92154 ) ) ( not ( = ?auto_92153 ?auto_92155 ) ) ( not ( = ?auto_92153 ?auto_92156 ) ) ( not ( = ?auto_92153 ?auto_92157 ) ) ( not ( = ?auto_92154 ?auto_92155 ) ) ( not ( = ?auto_92154 ?auto_92156 ) ) ( not ( = ?auto_92154 ?auto_92157 ) ) ( not ( = ?auto_92155 ?auto_92156 ) ) ( not ( = ?auto_92155 ?auto_92157 ) ) ( not ( = ?auto_92156 ?auto_92157 ) ) ( ON ?auto_92155 ?auto_92156 ) ( ON ?auto_92154 ?auto_92155 ) ( ON ?auto_92153 ?auto_92154 ) ( CLEAR ?auto_92151 ) ( ON ?auto_92152 ?auto_92153 ) ( CLEAR ?auto_92152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92151 ?auto_92152 )
      ( MAKE-6PILE ?auto_92151 ?auto_92152 ?auto_92153 ?auto_92154 ?auto_92155 ?auto_92156 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92164 - BLOCK
      ?auto_92165 - BLOCK
      ?auto_92166 - BLOCK
      ?auto_92167 - BLOCK
      ?auto_92168 - BLOCK
      ?auto_92169 - BLOCK
    )
    :vars
    (
      ?auto_92170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92169 ?auto_92170 ) ( ON-TABLE ?auto_92164 ) ( not ( = ?auto_92164 ?auto_92165 ) ) ( not ( = ?auto_92164 ?auto_92166 ) ) ( not ( = ?auto_92164 ?auto_92167 ) ) ( not ( = ?auto_92164 ?auto_92168 ) ) ( not ( = ?auto_92164 ?auto_92169 ) ) ( not ( = ?auto_92164 ?auto_92170 ) ) ( not ( = ?auto_92165 ?auto_92166 ) ) ( not ( = ?auto_92165 ?auto_92167 ) ) ( not ( = ?auto_92165 ?auto_92168 ) ) ( not ( = ?auto_92165 ?auto_92169 ) ) ( not ( = ?auto_92165 ?auto_92170 ) ) ( not ( = ?auto_92166 ?auto_92167 ) ) ( not ( = ?auto_92166 ?auto_92168 ) ) ( not ( = ?auto_92166 ?auto_92169 ) ) ( not ( = ?auto_92166 ?auto_92170 ) ) ( not ( = ?auto_92167 ?auto_92168 ) ) ( not ( = ?auto_92167 ?auto_92169 ) ) ( not ( = ?auto_92167 ?auto_92170 ) ) ( not ( = ?auto_92168 ?auto_92169 ) ) ( not ( = ?auto_92168 ?auto_92170 ) ) ( not ( = ?auto_92169 ?auto_92170 ) ) ( ON ?auto_92168 ?auto_92169 ) ( ON ?auto_92167 ?auto_92168 ) ( ON ?auto_92166 ?auto_92167 ) ( CLEAR ?auto_92164 ) ( ON ?auto_92165 ?auto_92166 ) ( CLEAR ?auto_92165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92164 ?auto_92165 )
      ( MAKE-6PILE ?auto_92164 ?auto_92165 ?auto_92166 ?auto_92167 ?auto_92168 ?auto_92169 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92177 - BLOCK
      ?auto_92178 - BLOCK
      ?auto_92179 - BLOCK
      ?auto_92180 - BLOCK
      ?auto_92181 - BLOCK
      ?auto_92182 - BLOCK
    )
    :vars
    (
      ?auto_92183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92182 ?auto_92183 ) ( not ( = ?auto_92177 ?auto_92178 ) ) ( not ( = ?auto_92177 ?auto_92179 ) ) ( not ( = ?auto_92177 ?auto_92180 ) ) ( not ( = ?auto_92177 ?auto_92181 ) ) ( not ( = ?auto_92177 ?auto_92182 ) ) ( not ( = ?auto_92177 ?auto_92183 ) ) ( not ( = ?auto_92178 ?auto_92179 ) ) ( not ( = ?auto_92178 ?auto_92180 ) ) ( not ( = ?auto_92178 ?auto_92181 ) ) ( not ( = ?auto_92178 ?auto_92182 ) ) ( not ( = ?auto_92178 ?auto_92183 ) ) ( not ( = ?auto_92179 ?auto_92180 ) ) ( not ( = ?auto_92179 ?auto_92181 ) ) ( not ( = ?auto_92179 ?auto_92182 ) ) ( not ( = ?auto_92179 ?auto_92183 ) ) ( not ( = ?auto_92180 ?auto_92181 ) ) ( not ( = ?auto_92180 ?auto_92182 ) ) ( not ( = ?auto_92180 ?auto_92183 ) ) ( not ( = ?auto_92181 ?auto_92182 ) ) ( not ( = ?auto_92181 ?auto_92183 ) ) ( not ( = ?auto_92182 ?auto_92183 ) ) ( ON ?auto_92181 ?auto_92182 ) ( ON ?auto_92180 ?auto_92181 ) ( ON ?auto_92179 ?auto_92180 ) ( ON ?auto_92178 ?auto_92179 ) ( ON ?auto_92177 ?auto_92178 ) ( CLEAR ?auto_92177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92177 )
      ( MAKE-6PILE ?auto_92177 ?auto_92178 ?auto_92179 ?auto_92180 ?auto_92181 ?auto_92182 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92190 - BLOCK
      ?auto_92191 - BLOCK
      ?auto_92192 - BLOCK
      ?auto_92193 - BLOCK
      ?auto_92194 - BLOCK
      ?auto_92195 - BLOCK
    )
    :vars
    (
      ?auto_92196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92195 ?auto_92196 ) ( not ( = ?auto_92190 ?auto_92191 ) ) ( not ( = ?auto_92190 ?auto_92192 ) ) ( not ( = ?auto_92190 ?auto_92193 ) ) ( not ( = ?auto_92190 ?auto_92194 ) ) ( not ( = ?auto_92190 ?auto_92195 ) ) ( not ( = ?auto_92190 ?auto_92196 ) ) ( not ( = ?auto_92191 ?auto_92192 ) ) ( not ( = ?auto_92191 ?auto_92193 ) ) ( not ( = ?auto_92191 ?auto_92194 ) ) ( not ( = ?auto_92191 ?auto_92195 ) ) ( not ( = ?auto_92191 ?auto_92196 ) ) ( not ( = ?auto_92192 ?auto_92193 ) ) ( not ( = ?auto_92192 ?auto_92194 ) ) ( not ( = ?auto_92192 ?auto_92195 ) ) ( not ( = ?auto_92192 ?auto_92196 ) ) ( not ( = ?auto_92193 ?auto_92194 ) ) ( not ( = ?auto_92193 ?auto_92195 ) ) ( not ( = ?auto_92193 ?auto_92196 ) ) ( not ( = ?auto_92194 ?auto_92195 ) ) ( not ( = ?auto_92194 ?auto_92196 ) ) ( not ( = ?auto_92195 ?auto_92196 ) ) ( ON ?auto_92194 ?auto_92195 ) ( ON ?auto_92193 ?auto_92194 ) ( ON ?auto_92192 ?auto_92193 ) ( ON ?auto_92191 ?auto_92192 ) ( ON ?auto_92190 ?auto_92191 ) ( CLEAR ?auto_92190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92190 )
      ( MAKE-6PILE ?auto_92190 ?auto_92191 ?auto_92192 ?auto_92193 ?auto_92194 ?auto_92195 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92204 - BLOCK
      ?auto_92205 - BLOCK
      ?auto_92206 - BLOCK
      ?auto_92207 - BLOCK
      ?auto_92208 - BLOCK
      ?auto_92209 - BLOCK
      ?auto_92210 - BLOCK
    )
    :vars
    (
      ?auto_92211 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_92209 ) ( ON ?auto_92210 ?auto_92211 ) ( CLEAR ?auto_92210 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92204 ) ( ON ?auto_92205 ?auto_92204 ) ( ON ?auto_92206 ?auto_92205 ) ( ON ?auto_92207 ?auto_92206 ) ( ON ?auto_92208 ?auto_92207 ) ( ON ?auto_92209 ?auto_92208 ) ( not ( = ?auto_92204 ?auto_92205 ) ) ( not ( = ?auto_92204 ?auto_92206 ) ) ( not ( = ?auto_92204 ?auto_92207 ) ) ( not ( = ?auto_92204 ?auto_92208 ) ) ( not ( = ?auto_92204 ?auto_92209 ) ) ( not ( = ?auto_92204 ?auto_92210 ) ) ( not ( = ?auto_92204 ?auto_92211 ) ) ( not ( = ?auto_92205 ?auto_92206 ) ) ( not ( = ?auto_92205 ?auto_92207 ) ) ( not ( = ?auto_92205 ?auto_92208 ) ) ( not ( = ?auto_92205 ?auto_92209 ) ) ( not ( = ?auto_92205 ?auto_92210 ) ) ( not ( = ?auto_92205 ?auto_92211 ) ) ( not ( = ?auto_92206 ?auto_92207 ) ) ( not ( = ?auto_92206 ?auto_92208 ) ) ( not ( = ?auto_92206 ?auto_92209 ) ) ( not ( = ?auto_92206 ?auto_92210 ) ) ( not ( = ?auto_92206 ?auto_92211 ) ) ( not ( = ?auto_92207 ?auto_92208 ) ) ( not ( = ?auto_92207 ?auto_92209 ) ) ( not ( = ?auto_92207 ?auto_92210 ) ) ( not ( = ?auto_92207 ?auto_92211 ) ) ( not ( = ?auto_92208 ?auto_92209 ) ) ( not ( = ?auto_92208 ?auto_92210 ) ) ( not ( = ?auto_92208 ?auto_92211 ) ) ( not ( = ?auto_92209 ?auto_92210 ) ) ( not ( = ?auto_92209 ?auto_92211 ) ) ( not ( = ?auto_92210 ?auto_92211 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92210 ?auto_92211 )
      ( !STACK ?auto_92210 ?auto_92209 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92219 - BLOCK
      ?auto_92220 - BLOCK
      ?auto_92221 - BLOCK
      ?auto_92222 - BLOCK
      ?auto_92223 - BLOCK
      ?auto_92224 - BLOCK
      ?auto_92225 - BLOCK
    )
    :vars
    (
      ?auto_92226 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_92224 ) ( ON ?auto_92225 ?auto_92226 ) ( CLEAR ?auto_92225 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92219 ) ( ON ?auto_92220 ?auto_92219 ) ( ON ?auto_92221 ?auto_92220 ) ( ON ?auto_92222 ?auto_92221 ) ( ON ?auto_92223 ?auto_92222 ) ( ON ?auto_92224 ?auto_92223 ) ( not ( = ?auto_92219 ?auto_92220 ) ) ( not ( = ?auto_92219 ?auto_92221 ) ) ( not ( = ?auto_92219 ?auto_92222 ) ) ( not ( = ?auto_92219 ?auto_92223 ) ) ( not ( = ?auto_92219 ?auto_92224 ) ) ( not ( = ?auto_92219 ?auto_92225 ) ) ( not ( = ?auto_92219 ?auto_92226 ) ) ( not ( = ?auto_92220 ?auto_92221 ) ) ( not ( = ?auto_92220 ?auto_92222 ) ) ( not ( = ?auto_92220 ?auto_92223 ) ) ( not ( = ?auto_92220 ?auto_92224 ) ) ( not ( = ?auto_92220 ?auto_92225 ) ) ( not ( = ?auto_92220 ?auto_92226 ) ) ( not ( = ?auto_92221 ?auto_92222 ) ) ( not ( = ?auto_92221 ?auto_92223 ) ) ( not ( = ?auto_92221 ?auto_92224 ) ) ( not ( = ?auto_92221 ?auto_92225 ) ) ( not ( = ?auto_92221 ?auto_92226 ) ) ( not ( = ?auto_92222 ?auto_92223 ) ) ( not ( = ?auto_92222 ?auto_92224 ) ) ( not ( = ?auto_92222 ?auto_92225 ) ) ( not ( = ?auto_92222 ?auto_92226 ) ) ( not ( = ?auto_92223 ?auto_92224 ) ) ( not ( = ?auto_92223 ?auto_92225 ) ) ( not ( = ?auto_92223 ?auto_92226 ) ) ( not ( = ?auto_92224 ?auto_92225 ) ) ( not ( = ?auto_92224 ?auto_92226 ) ) ( not ( = ?auto_92225 ?auto_92226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92225 ?auto_92226 )
      ( !STACK ?auto_92225 ?auto_92224 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92234 - BLOCK
      ?auto_92235 - BLOCK
      ?auto_92236 - BLOCK
      ?auto_92237 - BLOCK
      ?auto_92238 - BLOCK
      ?auto_92239 - BLOCK
      ?auto_92240 - BLOCK
    )
    :vars
    (
      ?auto_92241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92240 ?auto_92241 ) ( ON-TABLE ?auto_92234 ) ( ON ?auto_92235 ?auto_92234 ) ( ON ?auto_92236 ?auto_92235 ) ( ON ?auto_92237 ?auto_92236 ) ( ON ?auto_92238 ?auto_92237 ) ( not ( = ?auto_92234 ?auto_92235 ) ) ( not ( = ?auto_92234 ?auto_92236 ) ) ( not ( = ?auto_92234 ?auto_92237 ) ) ( not ( = ?auto_92234 ?auto_92238 ) ) ( not ( = ?auto_92234 ?auto_92239 ) ) ( not ( = ?auto_92234 ?auto_92240 ) ) ( not ( = ?auto_92234 ?auto_92241 ) ) ( not ( = ?auto_92235 ?auto_92236 ) ) ( not ( = ?auto_92235 ?auto_92237 ) ) ( not ( = ?auto_92235 ?auto_92238 ) ) ( not ( = ?auto_92235 ?auto_92239 ) ) ( not ( = ?auto_92235 ?auto_92240 ) ) ( not ( = ?auto_92235 ?auto_92241 ) ) ( not ( = ?auto_92236 ?auto_92237 ) ) ( not ( = ?auto_92236 ?auto_92238 ) ) ( not ( = ?auto_92236 ?auto_92239 ) ) ( not ( = ?auto_92236 ?auto_92240 ) ) ( not ( = ?auto_92236 ?auto_92241 ) ) ( not ( = ?auto_92237 ?auto_92238 ) ) ( not ( = ?auto_92237 ?auto_92239 ) ) ( not ( = ?auto_92237 ?auto_92240 ) ) ( not ( = ?auto_92237 ?auto_92241 ) ) ( not ( = ?auto_92238 ?auto_92239 ) ) ( not ( = ?auto_92238 ?auto_92240 ) ) ( not ( = ?auto_92238 ?auto_92241 ) ) ( not ( = ?auto_92239 ?auto_92240 ) ) ( not ( = ?auto_92239 ?auto_92241 ) ) ( not ( = ?auto_92240 ?auto_92241 ) ) ( CLEAR ?auto_92238 ) ( ON ?auto_92239 ?auto_92240 ) ( CLEAR ?auto_92239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92234 ?auto_92235 ?auto_92236 ?auto_92237 ?auto_92238 ?auto_92239 )
      ( MAKE-7PILE ?auto_92234 ?auto_92235 ?auto_92236 ?auto_92237 ?auto_92238 ?auto_92239 ?auto_92240 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92249 - BLOCK
      ?auto_92250 - BLOCK
      ?auto_92251 - BLOCK
      ?auto_92252 - BLOCK
      ?auto_92253 - BLOCK
      ?auto_92254 - BLOCK
      ?auto_92255 - BLOCK
    )
    :vars
    (
      ?auto_92256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92255 ?auto_92256 ) ( ON-TABLE ?auto_92249 ) ( ON ?auto_92250 ?auto_92249 ) ( ON ?auto_92251 ?auto_92250 ) ( ON ?auto_92252 ?auto_92251 ) ( ON ?auto_92253 ?auto_92252 ) ( not ( = ?auto_92249 ?auto_92250 ) ) ( not ( = ?auto_92249 ?auto_92251 ) ) ( not ( = ?auto_92249 ?auto_92252 ) ) ( not ( = ?auto_92249 ?auto_92253 ) ) ( not ( = ?auto_92249 ?auto_92254 ) ) ( not ( = ?auto_92249 ?auto_92255 ) ) ( not ( = ?auto_92249 ?auto_92256 ) ) ( not ( = ?auto_92250 ?auto_92251 ) ) ( not ( = ?auto_92250 ?auto_92252 ) ) ( not ( = ?auto_92250 ?auto_92253 ) ) ( not ( = ?auto_92250 ?auto_92254 ) ) ( not ( = ?auto_92250 ?auto_92255 ) ) ( not ( = ?auto_92250 ?auto_92256 ) ) ( not ( = ?auto_92251 ?auto_92252 ) ) ( not ( = ?auto_92251 ?auto_92253 ) ) ( not ( = ?auto_92251 ?auto_92254 ) ) ( not ( = ?auto_92251 ?auto_92255 ) ) ( not ( = ?auto_92251 ?auto_92256 ) ) ( not ( = ?auto_92252 ?auto_92253 ) ) ( not ( = ?auto_92252 ?auto_92254 ) ) ( not ( = ?auto_92252 ?auto_92255 ) ) ( not ( = ?auto_92252 ?auto_92256 ) ) ( not ( = ?auto_92253 ?auto_92254 ) ) ( not ( = ?auto_92253 ?auto_92255 ) ) ( not ( = ?auto_92253 ?auto_92256 ) ) ( not ( = ?auto_92254 ?auto_92255 ) ) ( not ( = ?auto_92254 ?auto_92256 ) ) ( not ( = ?auto_92255 ?auto_92256 ) ) ( CLEAR ?auto_92253 ) ( ON ?auto_92254 ?auto_92255 ) ( CLEAR ?auto_92254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92249 ?auto_92250 ?auto_92251 ?auto_92252 ?auto_92253 ?auto_92254 )
      ( MAKE-7PILE ?auto_92249 ?auto_92250 ?auto_92251 ?auto_92252 ?auto_92253 ?auto_92254 ?auto_92255 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92264 - BLOCK
      ?auto_92265 - BLOCK
      ?auto_92266 - BLOCK
      ?auto_92267 - BLOCK
      ?auto_92268 - BLOCK
      ?auto_92269 - BLOCK
      ?auto_92270 - BLOCK
    )
    :vars
    (
      ?auto_92271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92270 ?auto_92271 ) ( ON-TABLE ?auto_92264 ) ( ON ?auto_92265 ?auto_92264 ) ( ON ?auto_92266 ?auto_92265 ) ( ON ?auto_92267 ?auto_92266 ) ( not ( = ?auto_92264 ?auto_92265 ) ) ( not ( = ?auto_92264 ?auto_92266 ) ) ( not ( = ?auto_92264 ?auto_92267 ) ) ( not ( = ?auto_92264 ?auto_92268 ) ) ( not ( = ?auto_92264 ?auto_92269 ) ) ( not ( = ?auto_92264 ?auto_92270 ) ) ( not ( = ?auto_92264 ?auto_92271 ) ) ( not ( = ?auto_92265 ?auto_92266 ) ) ( not ( = ?auto_92265 ?auto_92267 ) ) ( not ( = ?auto_92265 ?auto_92268 ) ) ( not ( = ?auto_92265 ?auto_92269 ) ) ( not ( = ?auto_92265 ?auto_92270 ) ) ( not ( = ?auto_92265 ?auto_92271 ) ) ( not ( = ?auto_92266 ?auto_92267 ) ) ( not ( = ?auto_92266 ?auto_92268 ) ) ( not ( = ?auto_92266 ?auto_92269 ) ) ( not ( = ?auto_92266 ?auto_92270 ) ) ( not ( = ?auto_92266 ?auto_92271 ) ) ( not ( = ?auto_92267 ?auto_92268 ) ) ( not ( = ?auto_92267 ?auto_92269 ) ) ( not ( = ?auto_92267 ?auto_92270 ) ) ( not ( = ?auto_92267 ?auto_92271 ) ) ( not ( = ?auto_92268 ?auto_92269 ) ) ( not ( = ?auto_92268 ?auto_92270 ) ) ( not ( = ?auto_92268 ?auto_92271 ) ) ( not ( = ?auto_92269 ?auto_92270 ) ) ( not ( = ?auto_92269 ?auto_92271 ) ) ( not ( = ?auto_92270 ?auto_92271 ) ) ( ON ?auto_92269 ?auto_92270 ) ( CLEAR ?auto_92267 ) ( ON ?auto_92268 ?auto_92269 ) ( CLEAR ?auto_92268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92264 ?auto_92265 ?auto_92266 ?auto_92267 ?auto_92268 )
      ( MAKE-7PILE ?auto_92264 ?auto_92265 ?auto_92266 ?auto_92267 ?auto_92268 ?auto_92269 ?auto_92270 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92279 - BLOCK
      ?auto_92280 - BLOCK
      ?auto_92281 - BLOCK
      ?auto_92282 - BLOCK
      ?auto_92283 - BLOCK
      ?auto_92284 - BLOCK
      ?auto_92285 - BLOCK
    )
    :vars
    (
      ?auto_92286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92285 ?auto_92286 ) ( ON-TABLE ?auto_92279 ) ( ON ?auto_92280 ?auto_92279 ) ( ON ?auto_92281 ?auto_92280 ) ( ON ?auto_92282 ?auto_92281 ) ( not ( = ?auto_92279 ?auto_92280 ) ) ( not ( = ?auto_92279 ?auto_92281 ) ) ( not ( = ?auto_92279 ?auto_92282 ) ) ( not ( = ?auto_92279 ?auto_92283 ) ) ( not ( = ?auto_92279 ?auto_92284 ) ) ( not ( = ?auto_92279 ?auto_92285 ) ) ( not ( = ?auto_92279 ?auto_92286 ) ) ( not ( = ?auto_92280 ?auto_92281 ) ) ( not ( = ?auto_92280 ?auto_92282 ) ) ( not ( = ?auto_92280 ?auto_92283 ) ) ( not ( = ?auto_92280 ?auto_92284 ) ) ( not ( = ?auto_92280 ?auto_92285 ) ) ( not ( = ?auto_92280 ?auto_92286 ) ) ( not ( = ?auto_92281 ?auto_92282 ) ) ( not ( = ?auto_92281 ?auto_92283 ) ) ( not ( = ?auto_92281 ?auto_92284 ) ) ( not ( = ?auto_92281 ?auto_92285 ) ) ( not ( = ?auto_92281 ?auto_92286 ) ) ( not ( = ?auto_92282 ?auto_92283 ) ) ( not ( = ?auto_92282 ?auto_92284 ) ) ( not ( = ?auto_92282 ?auto_92285 ) ) ( not ( = ?auto_92282 ?auto_92286 ) ) ( not ( = ?auto_92283 ?auto_92284 ) ) ( not ( = ?auto_92283 ?auto_92285 ) ) ( not ( = ?auto_92283 ?auto_92286 ) ) ( not ( = ?auto_92284 ?auto_92285 ) ) ( not ( = ?auto_92284 ?auto_92286 ) ) ( not ( = ?auto_92285 ?auto_92286 ) ) ( ON ?auto_92284 ?auto_92285 ) ( CLEAR ?auto_92282 ) ( ON ?auto_92283 ?auto_92284 ) ( CLEAR ?auto_92283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92279 ?auto_92280 ?auto_92281 ?auto_92282 ?auto_92283 )
      ( MAKE-7PILE ?auto_92279 ?auto_92280 ?auto_92281 ?auto_92282 ?auto_92283 ?auto_92284 ?auto_92285 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92294 - BLOCK
      ?auto_92295 - BLOCK
      ?auto_92296 - BLOCK
      ?auto_92297 - BLOCK
      ?auto_92298 - BLOCK
      ?auto_92299 - BLOCK
      ?auto_92300 - BLOCK
    )
    :vars
    (
      ?auto_92301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92300 ?auto_92301 ) ( ON-TABLE ?auto_92294 ) ( ON ?auto_92295 ?auto_92294 ) ( ON ?auto_92296 ?auto_92295 ) ( not ( = ?auto_92294 ?auto_92295 ) ) ( not ( = ?auto_92294 ?auto_92296 ) ) ( not ( = ?auto_92294 ?auto_92297 ) ) ( not ( = ?auto_92294 ?auto_92298 ) ) ( not ( = ?auto_92294 ?auto_92299 ) ) ( not ( = ?auto_92294 ?auto_92300 ) ) ( not ( = ?auto_92294 ?auto_92301 ) ) ( not ( = ?auto_92295 ?auto_92296 ) ) ( not ( = ?auto_92295 ?auto_92297 ) ) ( not ( = ?auto_92295 ?auto_92298 ) ) ( not ( = ?auto_92295 ?auto_92299 ) ) ( not ( = ?auto_92295 ?auto_92300 ) ) ( not ( = ?auto_92295 ?auto_92301 ) ) ( not ( = ?auto_92296 ?auto_92297 ) ) ( not ( = ?auto_92296 ?auto_92298 ) ) ( not ( = ?auto_92296 ?auto_92299 ) ) ( not ( = ?auto_92296 ?auto_92300 ) ) ( not ( = ?auto_92296 ?auto_92301 ) ) ( not ( = ?auto_92297 ?auto_92298 ) ) ( not ( = ?auto_92297 ?auto_92299 ) ) ( not ( = ?auto_92297 ?auto_92300 ) ) ( not ( = ?auto_92297 ?auto_92301 ) ) ( not ( = ?auto_92298 ?auto_92299 ) ) ( not ( = ?auto_92298 ?auto_92300 ) ) ( not ( = ?auto_92298 ?auto_92301 ) ) ( not ( = ?auto_92299 ?auto_92300 ) ) ( not ( = ?auto_92299 ?auto_92301 ) ) ( not ( = ?auto_92300 ?auto_92301 ) ) ( ON ?auto_92299 ?auto_92300 ) ( ON ?auto_92298 ?auto_92299 ) ( CLEAR ?auto_92296 ) ( ON ?auto_92297 ?auto_92298 ) ( CLEAR ?auto_92297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92294 ?auto_92295 ?auto_92296 ?auto_92297 )
      ( MAKE-7PILE ?auto_92294 ?auto_92295 ?auto_92296 ?auto_92297 ?auto_92298 ?auto_92299 ?auto_92300 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92309 - BLOCK
      ?auto_92310 - BLOCK
      ?auto_92311 - BLOCK
      ?auto_92312 - BLOCK
      ?auto_92313 - BLOCK
      ?auto_92314 - BLOCK
      ?auto_92315 - BLOCK
    )
    :vars
    (
      ?auto_92316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92315 ?auto_92316 ) ( ON-TABLE ?auto_92309 ) ( ON ?auto_92310 ?auto_92309 ) ( ON ?auto_92311 ?auto_92310 ) ( not ( = ?auto_92309 ?auto_92310 ) ) ( not ( = ?auto_92309 ?auto_92311 ) ) ( not ( = ?auto_92309 ?auto_92312 ) ) ( not ( = ?auto_92309 ?auto_92313 ) ) ( not ( = ?auto_92309 ?auto_92314 ) ) ( not ( = ?auto_92309 ?auto_92315 ) ) ( not ( = ?auto_92309 ?auto_92316 ) ) ( not ( = ?auto_92310 ?auto_92311 ) ) ( not ( = ?auto_92310 ?auto_92312 ) ) ( not ( = ?auto_92310 ?auto_92313 ) ) ( not ( = ?auto_92310 ?auto_92314 ) ) ( not ( = ?auto_92310 ?auto_92315 ) ) ( not ( = ?auto_92310 ?auto_92316 ) ) ( not ( = ?auto_92311 ?auto_92312 ) ) ( not ( = ?auto_92311 ?auto_92313 ) ) ( not ( = ?auto_92311 ?auto_92314 ) ) ( not ( = ?auto_92311 ?auto_92315 ) ) ( not ( = ?auto_92311 ?auto_92316 ) ) ( not ( = ?auto_92312 ?auto_92313 ) ) ( not ( = ?auto_92312 ?auto_92314 ) ) ( not ( = ?auto_92312 ?auto_92315 ) ) ( not ( = ?auto_92312 ?auto_92316 ) ) ( not ( = ?auto_92313 ?auto_92314 ) ) ( not ( = ?auto_92313 ?auto_92315 ) ) ( not ( = ?auto_92313 ?auto_92316 ) ) ( not ( = ?auto_92314 ?auto_92315 ) ) ( not ( = ?auto_92314 ?auto_92316 ) ) ( not ( = ?auto_92315 ?auto_92316 ) ) ( ON ?auto_92314 ?auto_92315 ) ( ON ?auto_92313 ?auto_92314 ) ( CLEAR ?auto_92311 ) ( ON ?auto_92312 ?auto_92313 ) ( CLEAR ?auto_92312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92309 ?auto_92310 ?auto_92311 ?auto_92312 )
      ( MAKE-7PILE ?auto_92309 ?auto_92310 ?auto_92311 ?auto_92312 ?auto_92313 ?auto_92314 ?auto_92315 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92324 - BLOCK
      ?auto_92325 - BLOCK
      ?auto_92326 - BLOCK
      ?auto_92327 - BLOCK
      ?auto_92328 - BLOCK
      ?auto_92329 - BLOCK
      ?auto_92330 - BLOCK
    )
    :vars
    (
      ?auto_92331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92330 ?auto_92331 ) ( ON-TABLE ?auto_92324 ) ( ON ?auto_92325 ?auto_92324 ) ( not ( = ?auto_92324 ?auto_92325 ) ) ( not ( = ?auto_92324 ?auto_92326 ) ) ( not ( = ?auto_92324 ?auto_92327 ) ) ( not ( = ?auto_92324 ?auto_92328 ) ) ( not ( = ?auto_92324 ?auto_92329 ) ) ( not ( = ?auto_92324 ?auto_92330 ) ) ( not ( = ?auto_92324 ?auto_92331 ) ) ( not ( = ?auto_92325 ?auto_92326 ) ) ( not ( = ?auto_92325 ?auto_92327 ) ) ( not ( = ?auto_92325 ?auto_92328 ) ) ( not ( = ?auto_92325 ?auto_92329 ) ) ( not ( = ?auto_92325 ?auto_92330 ) ) ( not ( = ?auto_92325 ?auto_92331 ) ) ( not ( = ?auto_92326 ?auto_92327 ) ) ( not ( = ?auto_92326 ?auto_92328 ) ) ( not ( = ?auto_92326 ?auto_92329 ) ) ( not ( = ?auto_92326 ?auto_92330 ) ) ( not ( = ?auto_92326 ?auto_92331 ) ) ( not ( = ?auto_92327 ?auto_92328 ) ) ( not ( = ?auto_92327 ?auto_92329 ) ) ( not ( = ?auto_92327 ?auto_92330 ) ) ( not ( = ?auto_92327 ?auto_92331 ) ) ( not ( = ?auto_92328 ?auto_92329 ) ) ( not ( = ?auto_92328 ?auto_92330 ) ) ( not ( = ?auto_92328 ?auto_92331 ) ) ( not ( = ?auto_92329 ?auto_92330 ) ) ( not ( = ?auto_92329 ?auto_92331 ) ) ( not ( = ?auto_92330 ?auto_92331 ) ) ( ON ?auto_92329 ?auto_92330 ) ( ON ?auto_92328 ?auto_92329 ) ( ON ?auto_92327 ?auto_92328 ) ( CLEAR ?auto_92325 ) ( ON ?auto_92326 ?auto_92327 ) ( CLEAR ?auto_92326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92324 ?auto_92325 ?auto_92326 )
      ( MAKE-7PILE ?auto_92324 ?auto_92325 ?auto_92326 ?auto_92327 ?auto_92328 ?auto_92329 ?auto_92330 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92339 - BLOCK
      ?auto_92340 - BLOCK
      ?auto_92341 - BLOCK
      ?auto_92342 - BLOCK
      ?auto_92343 - BLOCK
      ?auto_92344 - BLOCK
      ?auto_92345 - BLOCK
    )
    :vars
    (
      ?auto_92346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92345 ?auto_92346 ) ( ON-TABLE ?auto_92339 ) ( ON ?auto_92340 ?auto_92339 ) ( not ( = ?auto_92339 ?auto_92340 ) ) ( not ( = ?auto_92339 ?auto_92341 ) ) ( not ( = ?auto_92339 ?auto_92342 ) ) ( not ( = ?auto_92339 ?auto_92343 ) ) ( not ( = ?auto_92339 ?auto_92344 ) ) ( not ( = ?auto_92339 ?auto_92345 ) ) ( not ( = ?auto_92339 ?auto_92346 ) ) ( not ( = ?auto_92340 ?auto_92341 ) ) ( not ( = ?auto_92340 ?auto_92342 ) ) ( not ( = ?auto_92340 ?auto_92343 ) ) ( not ( = ?auto_92340 ?auto_92344 ) ) ( not ( = ?auto_92340 ?auto_92345 ) ) ( not ( = ?auto_92340 ?auto_92346 ) ) ( not ( = ?auto_92341 ?auto_92342 ) ) ( not ( = ?auto_92341 ?auto_92343 ) ) ( not ( = ?auto_92341 ?auto_92344 ) ) ( not ( = ?auto_92341 ?auto_92345 ) ) ( not ( = ?auto_92341 ?auto_92346 ) ) ( not ( = ?auto_92342 ?auto_92343 ) ) ( not ( = ?auto_92342 ?auto_92344 ) ) ( not ( = ?auto_92342 ?auto_92345 ) ) ( not ( = ?auto_92342 ?auto_92346 ) ) ( not ( = ?auto_92343 ?auto_92344 ) ) ( not ( = ?auto_92343 ?auto_92345 ) ) ( not ( = ?auto_92343 ?auto_92346 ) ) ( not ( = ?auto_92344 ?auto_92345 ) ) ( not ( = ?auto_92344 ?auto_92346 ) ) ( not ( = ?auto_92345 ?auto_92346 ) ) ( ON ?auto_92344 ?auto_92345 ) ( ON ?auto_92343 ?auto_92344 ) ( ON ?auto_92342 ?auto_92343 ) ( CLEAR ?auto_92340 ) ( ON ?auto_92341 ?auto_92342 ) ( CLEAR ?auto_92341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92339 ?auto_92340 ?auto_92341 )
      ( MAKE-7PILE ?auto_92339 ?auto_92340 ?auto_92341 ?auto_92342 ?auto_92343 ?auto_92344 ?auto_92345 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92354 - BLOCK
      ?auto_92355 - BLOCK
      ?auto_92356 - BLOCK
      ?auto_92357 - BLOCK
      ?auto_92358 - BLOCK
      ?auto_92359 - BLOCK
      ?auto_92360 - BLOCK
    )
    :vars
    (
      ?auto_92361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92360 ?auto_92361 ) ( ON-TABLE ?auto_92354 ) ( not ( = ?auto_92354 ?auto_92355 ) ) ( not ( = ?auto_92354 ?auto_92356 ) ) ( not ( = ?auto_92354 ?auto_92357 ) ) ( not ( = ?auto_92354 ?auto_92358 ) ) ( not ( = ?auto_92354 ?auto_92359 ) ) ( not ( = ?auto_92354 ?auto_92360 ) ) ( not ( = ?auto_92354 ?auto_92361 ) ) ( not ( = ?auto_92355 ?auto_92356 ) ) ( not ( = ?auto_92355 ?auto_92357 ) ) ( not ( = ?auto_92355 ?auto_92358 ) ) ( not ( = ?auto_92355 ?auto_92359 ) ) ( not ( = ?auto_92355 ?auto_92360 ) ) ( not ( = ?auto_92355 ?auto_92361 ) ) ( not ( = ?auto_92356 ?auto_92357 ) ) ( not ( = ?auto_92356 ?auto_92358 ) ) ( not ( = ?auto_92356 ?auto_92359 ) ) ( not ( = ?auto_92356 ?auto_92360 ) ) ( not ( = ?auto_92356 ?auto_92361 ) ) ( not ( = ?auto_92357 ?auto_92358 ) ) ( not ( = ?auto_92357 ?auto_92359 ) ) ( not ( = ?auto_92357 ?auto_92360 ) ) ( not ( = ?auto_92357 ?auto_92361 ) ) ( not ( = ?auto_92358 ?auto_92359 ) ) ( not ( = ?auto_92358 ?auto_92360 ) ) ( not ( = ?auto_92358 ?auto_92361 ) ) ( not ( = ?auto_92359 ?auto_92360 ) ) ( not ( = ?auto_92359 ?auto_92361 ) ) ( not ( = ?auto_92360 ?auto_92361 ) ) ( ON ?auto_92359 ?auto_92360 ) ( ON ?auto_92358 ?auto_92359 ) ( ON ?auto_92357 ?auto_92358 ) ( ON ?auto_92356 ?auto_92357 ) ( CLEAR ?auto_92354 ) ( ON ?auto_92355 ?auto_92356 ) ( CLEAR ?auto_92355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92354 ?auto_92355 )
      ( MAKE-7PILE ?auto_92354 ?auto_92355 ?auto_92356 ?auto_92357 ?auto_92358 ?auto_92359 ?auto_92360 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92369 - BLOCK
      ?auto_92370 - BLOCK
      ?auto_92371 - BLOCK
      ?auto_92372 - BLOCK
      ?auto_92373 - BLOCK
      ?auto_92374 - BLOCK
      ?auto_92375 - BLOCK
    )
    :vars
    (
      ?auto_92376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92375 ?auto_92376 ) ( ON-TABLE ?auto_92369 ) ( not ( = ?auto_92369 ?auto_92370 ) ) ( not ( = ?auto_92369 ?auto_92371 ) ) ( not ( = ?auto_92369 ?auto_92372 ) ) ( not ( = ?auto_92369 ?auto_92373 ) ) ( not ( = ?auto_92369 ?auto_92374 ) ) ( not ( = ?auto_92369 ?auto_92375 ) ) ( not ( = ?auto_92369 ?auto_92376 ) ) ( not ( = ?auto_92370 ?auto_92371 ) ) ( not ( = ?auto_92370 ?auto_92372 ) ) ( not ( = ?auto_92370 ?auto_92373 ) ) ( not ( = ?auto_92370 ?auto_92374 ) ) ( not ( = ?auto_92370 ?auto_92375 ) ) ( not ( = ?auto_92370 ?auto_92376 ) ) ( not ( = ?auto_92371 ?auto_92372 ) ) ( not ( = ?auto_92371 ?auto_92373 ) ) ( not ( = ?auto_92371 ?auto_92374 ) ) ( not ( = ?auto_92371 ?auto_92375 ) ) ( not ( = ?auto_92371 ?auto_92376 ) ) ( not ( = ?auto_92372 ?auto_92373 ) ) ( not ( = ?auto_92372 ?auto_92374 ) ) ( not ( = ?auto_92372 ?auto_92375 ) ) ( not ( = ?auto_92372 ?auto_92376 ) ) ( not ( = ?auto_92373 ?auto_92374 ) ) ( not ( = ?auto_92373 ?auto_92375 ) ) ( not ( = ?auto_92373 ?auto_92376 ) ) ( not ( = ?auto_92374 ?auto_92375 ) ) ( not ( = ?auto_92374 ?auto_92376 ) ) ( not ( = ?auto_92375 ?auto_92376 ) ) ( ON ?auto_92374 ?auto_92375 ) ( ON ?auto_92373 ?auto_92374 ) ( ON ?auto_92372 ?auto_92373 ) ( ON ?auto_92371 ?auto_92372 ) ( CLEAR ?auto_92369 ) ( ON ?auto_92370 ?auto_92371 ) ( CLEAR ?auto_92370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92369 ?auto_92370 )
      ( MAKE-7PILE ?auto_92369 ?auto_92370 ?auto_92371 ?auto_92372 ?auto_92373 ?auto_92374 ?auto_92375 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92384 - BLOCK
      ?auto_92385 - BLOCK
      ?auto_92386 - BLOCK
      ?auto_92387 - BLOCK
      ?auto_92388 - BLOCK
      ?auto_92389 - BLOCK
      ?auto_92390 - BLOCK
    )
    :vars
    (
      ?auto_92391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92390 ?auto_92391 ) ( not ( = ?auto_92384 ?auto_92385 ) ) ( not ( = ?auto_92384 ?auto_92386 ) ) ( not ( = ?auto_92384 ?auto_92387 ) ) ( not ( = ?auto_92384 ?auto_92388 ) ) ( not ( = ?auto_92384 ?auto_92389 ) ) ( not ( = ?auto_92384 ?auto_92390 ) ) ( not ( = ?auto_92384 ?auto_92391 ) ) ( not ( = ?auto_92385 ?auto_92386 ) ) ( not ( = ?auto_92385 ?auto_92387 ) ) ( not ( = ?auto_92385 ?auto_92388 ) ) ( not ( = ?auto_92385 ?auto_92389 ) ) ( not ( = ?auto_92385 ?auto_92390 ) ) ( not ( = ?auto_92385 ?auto_92391 ) ) ( not ( = ?auto_92386 ?auto_92387 ) ) ( not ( = ?auto_92386 ?auto_92388 ) ) ( not ( = ?auto_92386 ?auto_92389 ) ) ( not ( = ?auto_92386 ?auto_92390 ) ) ( not ( = ?auto_92386 ?auto_92391 ) ) ( not ( = ?auto_92387 ?auto_92388 ) ) ( not ( = ?auto_92387 ?auto_92389 ) ) ( not ( = ?auto_92387 ?auto_92390 ) ) ( not ( = ?auto_92387 ?auto_92391 ) ) ( not ( = ?auto_92388 ?auto_92389 ) ) ( not ( = ?auto_92388 ?auto_92390 ) ) ( not ( = ?auto_92388 ?auto_92391 ) ) ( not ( = ?auto_92389 ?auto_92390 ) ) ( not ( = ?auto_92389 ?auto_92391 ) ) ( not ( = ?auto_92390 ?auto_92391 ) ) ( ON ?auto_92389 ?auto_92390 ) ( ON ?auto_92388 ?auto_92389 ) ( ON ?auto_92387 ?auto_92388 ) ( ON ?auto_92386 ?auto_92387 ) ( ON ?auto_92385 ?auto_92386 ) ( ON ?auto_92384 ?auto_92385 ) ( CLEAR ?auto_92384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92384 )
      ( MAKE-7PILE ?auto_92384 ?auto_92385 ?auto_92386 ?auto_92387 ?auto_92388 ?auto_92389 ?auto_92390 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92399 - BLOCK
      ?auto_92400 - BLOCK
      ?auto_92401 - BLOCK
      ?auto_92402 - BLOCK
      ?auto_92403 - BLOCK
      ?auto_92404 - BLOCK
      ?auto_92405 - BLOCK
    )
    :vars
    (
      ?auto_92406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92405 ?auto_92406 ) ( not ( = ?auto_92399 ?auto_92400 ) ) ( not ( = ?auto_92399 ?auto_92401 ) ) ( not ( = ?auto_92399 ?auto_92402 ) ) ( not ( = ?auto_92399 ?auto_92403 ) ) ( not ( = ?auto_92399 ?auto_92404 ) ) ( not ( = ?auto_92399 ?auto_92405 ) ) ( not ( = ?auto_92399 ?auto_92406 ) ) ( not ( = ?auto_92400 ?auto_92401 ) ) ( not ( = ?auto_92400 ?auto_92402 ) ) ( not ( = ?auto_92400 ?auto_92403 ) ) ( not ( = ?auto_92400 ?auto_92404 ) ) ( not ( = ?auto_92400 ?auto_92405 ) ) ( not ( = ?auto_92400 ?auto_92406 ) ) ( not ( = ?auto_92401 ?auto_92402 ) ) ( not ( = ?auto_92401 ?auto_92403 ) ) ( not ( = ?auto_92401 ?auto_92404 ) ) ( not ( = ?auto_92401 ?auto_92405 ) ) ( not ( = ?auto_92401 ?auto_92406 ) ) ( not ( = ?auto_92402 ?auto_92403 ) ) ( not ( = ?auto_92402 ?auto_92404 ) ) ( not ( = ?auto_92402 ?auto_92405 ) ) ( not ( = ?auto_92402 ?auto_92406 ) ) ( not ( = ?auto_92403 ?auto_92404 ) ) ( not ( = ?auto_92403 ?auto_92405 ) ) ( not ( = ?auto_92403 ?auto_92406 ) ) ( not ( = ?auto_92404 ?auto_92405 ) ) ( not ( = ?auto_92404 ?auto_92406 ) ) ( not ( = ?auto_92405 ?auto_92406 ) ) ( ON ?auto_92404 ?auto_92405 ) ( ON ?auto_92403 ?auto_92404 ) ( ON ?auto_92402 ?auto_92403 ) ( ON ?auto_92401 ?auto_92402 ) ( ON ?auto_92400 ?auto_92401 ) ( ON ?auto_92399 ?auto_92400 ) ( CLEAR ?auto_92399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92399 )
      ( MAKE-7PILE ?auto_92399 ?auto_92400 ?auto_92401 ?auto_92402 ?auto_92403 ?auto_92404 ?auto_92405 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_92415 - BLOCK
      ?auto_92416 - BLOCK
      ?auto_92417 - BLOCK
      ?auto_92418 - BLOCK
      ?auto_92419 - BLOCK
      ?auto_92420 - BLOCK
      ?auto_92421 - BLOCK
      ?auto_92422 - BLOCK
    )
    :vars
    (
      ?auto_92423 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_92421 ) ( ON ?auto_92422 ?auto_92423 ) ( CLEAR ?auto_92422 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92415 ) ( ON ?auto_92416 ?auto_92415 ) ( ON ?auto_92417 ?auto_92416 ) ( ON ?auto_92418 ?auto_92417 ) ( ON ?auto_92419 ?auto_92418 ) ( ON ?auto_92420 ?auto_92419 ) ( ON ?auto_92421 ?auto_92420 ) ( not ( = ?auto_92415 ?auto_92416 ) ) ( not ( = ?auto_92415 ?auto_92417 ) ) ( not ( = ?auto_92415 ?auto_92418 ) ) ( not ( = ?auto_92415 ?auto_92419 ) ) ( not ( = ?auto_92415 ?auto_92420 ) ) ( not ( = ?auto_92415 ?auto_92421 ) ) ( not ( = ?auto_92415 ?auto_92422 ) ) ( not ( = ?auto_92415 ?auto_92423 ) ) ( not ( = ?auto_92416 ?auto_92417 ) ) ( not ( = ?auto_92416 ?auto_92418 ) ) ( not ( = ?auto_92416 ?auto_92419 ) ) ( not ( = ?auto_92416 ?auto_92420 ) ) ( not ( = ?auto_92416 ?auto_92421 ) ) ( not ( = ?auto_92416 ?auto_92422 ) ) ( not ( = ?auto_92416 ?auto_92423 ) ) ( not ( = ?auto_92417 ?auto_92418 ) ) ( not ( = ?auto_92417 ?auto_92419 ) ) ( not ( = ?auto_92417 ?auto_92420 ) ) ( not ( = ?auto_92417 ?auto_92421 ) ) ( not ( = ?auto_92417 ?auto_92422 ) ) ( not ( = ?auto_92417 ?auto_92423 ) ) ( not ( = ?auto_92418 ?auto_92419 ) ) ( not ( = ?auto_92418 ?auto_92420 ) ) ( not ( = ?auto_92418 ?auto_92421 ) ) ( not ( = ?auto_92418 ?auto_92422 ) ) ( not ( = ?auto_92418 ?auto_92423 ) ) ( not ( = ?auto_92419 ?auto_92420 ) ) ( not ( = ?auto_92419 ?auto_92421 ) ) ( not ( = ?auto_92419 ?auto_92422 ) ) ( not ( = ?auto_92419 ?auto_92423 ) ) ( not ( = ?auto_92420 ?auto_92421 ) ) ( not ( = ?auto_92420 ?auto_92422 ) ) ( not ( = ?auto_92420 ?auto_92423 ) ) ( not ( = ?auto_92421 ?auto_92422 ) ) ( not ( = ?auto_92421 ?auto_92423 ) ) ( not ( = ?auto_92422 ?auto_92423 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92422 ?auto_92423 )
      ( !STACK ?auto_92422 ?auto_92421 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_92432 - BLOCK
      ?auto_92433 - BLOCK
      ?auto_92434 - BLOCK
      ?auto_92435 - BLOCK
      ?auto_92436 - BLOCK
      ?auto_92437 - BLOCK
      ?auto_92438 - BLOCK
      ?auto_92439 - BLOCK
    )
    :vars
    (
      ?auto_92440 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_92438 ) ( ON ?auto_92439 ?auto_92440 ) ( CLEAR ?auto_92439 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92432 ) ( ON ?auto_92433 ?auto_92432 ) ( ON ?auto_92434 ?auto_92433 ) ( ON ?auto_92435 ?auto_92434 ) ( ON ?auto_92436 ?auto_92435 ) ( ON ?auto_92437 ?auto_92436 ) ( ON ?auto_92438 ?auto_92437 ) ( not ( = ?auto_92432 ?auto_92433 ) ) ( not ( = ?auto_92432 ?auto_92434 ) ) ( not ( = ?auto_92432 ?auto_92435 ) ) ( not ( = ?auto_92432 ?auto_92436 ) ) ( not ( = ?auto_92432 ?auto_92437 ) ) ( not ( = ?auto_92432 ?auto_92438 ) ) ( not ( = ?auto_92432 ?auto_92439 ) ) ( not ( = ?auto_92432 ?auto_92440 ) ) ( not ( = ?auto_92433 ?auto_92434 ) ) ( not ( = ?auto_92433 ?auto_92435 ) ) ( not ( = ?auto_92433 ?auto_92436 ) ) ( not ( = ?auto_92433 ?auto_92437 ) ) ( not ( = ?auto_92433 ?auto_92438 ) ) ( not ( = ?auto_92433 ?auto_92439 ) ) ( not ( = ?auto_92433 ?auto_92440 ) ) ( not ( = ?auto_92434 ?auto_92435 ) ) ( not ( = ?auto_92434 ?auto_92436 ) ) ( not ( = ?auto_92434 ?auto_92437 ) ) ( not ( = ?auto_92434 ?auto_92438 ) ) ( not ( = ?auto_92434 ?auto_92439 ) ) ( not ( = ?auto_92434 ?auto_92440 ) ) ( not ( = ?auto_92435 ?auto_92436 ) ) ( not ( = ?auto_92435 ?auto_92437 ) ) ( not ( = ?auto_92435 ?auto_92438 ) ) ( not ( = ?auto_92435 ?auto_92439 ) ) ( not ( = ?auto_92435 ?auto_92440 ) ) ( not ( = ?auto_92436 ?auto_92437 ) ) ( not ( = ?auto_92436 ?auto_92438 ) ) ( not ( = ?auto_92436 ?auto_92439 ) ) ( not ( = ?auto_92436 ?auto_92440 ) ) ( not ( = ?auto_92437 ?auto_92438 ) ) ( not ( = ?auto_92437 ?auto_92439 ) ) ( not ( = ?auto_92437 ?auto_92440 ) ) ( not ( = ?auto_92438 ?auto_92439 ) ) ( not ( = ?auto_92438 ?auto_92440 ) ) ( not ( = ?auto_92439 ?auto_92440 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92439 ?auto_92440 )
      ( !STACK ?auto_92439 ?auto_92438 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_92449 - BLOCK
      ?auto_92450 - BLOCK
      ?auto_92451 - BLOCK
      ?auto_92452 - BLOCK
      ?auto_92453 - BLOCK
      ?auto_92454 - BLOCK
      ?auto_92455 - BLOCK
      ?auto_92456 - BLOCK
    )
    :vars
    (
      ?auto_92457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92456 ?auto_92457 ) ( ON-TABLE ?auto_92449 ) ( ON ?auto_92450 ?auto_92449 ) ( ON ?auto_92451 ?auto_92450 ) ( ON ?auto_92452 ?auto_92451 ) ( ON ?auto_92453 ?auto_92452 ) ( ON ?auto_92454 ?auto_92453 ) ( not ( = ?auto_92449 ?auto_92450 ) ) ( not ( = ?auto_92449 ?auto_92451 ) ) ( not ( = ?auto_92449 ?auto_92452 ) ) ( not ( = ?auto_92449 ?auto_92453 ) ) ( not ( = ?auto_92449 ?auto_92454 ) ) ( not ( = ?auto_92449 ?auto_92455 ) ) ( not ( = ?auto_92449 ?auto_92456 ) ) ( not ( = ?auto_92449 ?auto_92457 ) ) ( not ( = ?auto_92450 ?auto_92451 ) ) ( not ( = ?auto_92450 ?auto_92452 ) ) ( not ( = ?auto_92450 ?auto_92453 ) ) ( not ( = ?auto_92450 ?auto_92454 ) ) ( not ( = ?auto_92450 ?auto_92455 ) ) ( not ( = ?auto_92450 ?auto_92456 ) ) ( not ( = ?auto_92450 ?auto_92457 ) ) ( not ( = ?auto_92451 ?auto_92452 ) ) ( not ( = ?auto_92451 ?auto_92453 ) ) ( not ( = ?auto_92451 ?auto_92454 ) ) ( not ( = ?auto_92451 ?auto_92455 ) ) ( not ( = ?auto_92451 ?auto_92456 ) ) ( not ( = ?auto_92451 ?auto_92457 ) ) ( not ( = ?auto_92452 ?auto_92453 ) ) ( not ( = ?auto_92452 ?auto_92454 ) ) ( not ( = ?auto_92452 ?auto_92455 ) ) ( not ( = ?auto_92452 ?auto_92456 ) ) ( not ( = ?auto_92452 ?auto_92457 ) ) ( not ( = ?auto_92453 ?auto_92454 ) ) ( not ( = ?auto_92453 ?auto_92455 ) ) ( not ( = ?auto_92453 ?auto_92456 ) ) ( not ( = ?auto_92453 ?auto_92457 ) ) ( not ( = ?auto_92454 ?auto_92455 ) ) ( not ( = ?auto_92454 ?auto_92456 ) ) ( not ( = ?auto_92454 ?auto_92457 ) ) ( not ( = ?auto_92455 ?auto_92456 ) ) ( not ( = ?auto_92455 ?auto_92457 ) ) ( not ( = ?auto_92456 ?auto_92457 ) ) ( CLEAR ?auto_92454 ) ( ON ?auto_92455 ?auto_92456 ) ( CLEAR ?auto_92455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92449 ?auto_92450 ?auto_92451 ?auto_92452 ?auto_92453 ?auto_92454 ?auto_92455 )
      ( MAKE-8PILE ?auto_92449 ?auto_92450 ?auto_92451 ?auto_92452 ?auto_92453 ?auto_92454 ?auto_92455 ?auto_92456 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_92466 - BLOCK
      ?auto_92467 - BLOCK
      ?auto_92468 - BLOCK
      ?auto_92469 - BLOCK
      ?auto_92470 - BLOCK
      ?auto_92471 - BLOCK
      ?auto_92472 - BLOCK
      ?auto_92473 - BLOCK
    )
    :vars
    (
      ?auto_92474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92473 ?auto_92474 ) ( ON-TABLE ?auto_92466 ) ( ON ?auto_92467 ?auto_92466 ) ( ON ?auto_92468 ?auto_92467 ) ( ON ?auto_92469 ?auto_92468 ) ( ON ?auto_92470 ?auto_92469 ) ( ON ?auto_92471 ?auto_92470 ) ( not ( = ?auto_92466 ?auto_92467 ) ) ( not ( = ?auto_92466 ?auto_92468 ) ) ( not ( = ?auto_92466 ?auto_92469 ) ) ( not ( = ?auto_92466 ?auto_92470 ) ) ( not ( = ?auto_92466 ?auto_92471 ) ) ( not ( = ?auto_92466 ?auto_92472 ) ) ( not ( = ?auto_92466 ?auto_92473 ) ) ( not ( = ?auto_92466 ?auto_92474 ) ) ( not ( = ?auto_92467 ?auto_92468 ) ) ( not ( = ?auto_92467 ?auto_92469 ) ) ( not ( = ?auto_92467 ?auto_92470 ) ) ( not ( = ?auto_92467 ?auto_92471 ) ) ( not ( = ?auto_92467 ?auto_92472 ) ) ( not ( = ?auto_92467 ?auto_92473 ) ) ( not ( = ?auto_92467 ?auto_92474 ) ) ( not ( = ?auto_92468 ?auto_92469 ) ) ( not ( = ?auto_92468 ?auto_92470 ) ) ( not ( = ?auto_92468 ?auto_92471 ) ) ( not ( = ?auto_92468 ?auto_92472 ) ) ( not ( = ?auto_92468 ?auto_92473 ) ) ( not ( = ?auto_92468 ?auto_92474 ) ) ( not ( = ?auto_92469 ?auto_92470 ) ) ( not ( = ?auto_92469 ?auto_92471 ) ) ( not ( = ?auto_92469 ?auto_92472 ) ) ( not ( = ?auto_92469 ?auto_92473 ) ) ( not ( = ?auto_92469 ?auto_92474 ) ) ( not ( = ?auto_92470 ?auto_92471 ) ) ( not ( = ?auto_92470 ?auto_92472 ) ) ( not ( = ?auto_92470 ?auto_92473 ) ) ( not ( = ?auto_92470 ?auto_92474 ) ) ( not ( = ?auto_92471 ?auto_92472 ) ) ( not ( = ?auto_92471 ?auto_92473 ) ) ( not ( = ?auto_92471 ?auto_92474 ) ) ( not ( = ?auto_92472 ?auto_92473 ) ) ( not ( = ?auto_92472 ?auto_92474 ) ) ( not ( = ?auto_92473 ?auto_92474 ) ) ( CLEAR ?auto_92471 ) ( ON ?auto_92472 ?auto_92473 ) ( CLEAR ?auto_92472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92466 ?auto_92467 ?auto_92468 ?auto_92469 ?auto_92470 ?auto_92471 ?auto_92472 )
      ( MAKE-8PILE ?auto_92466 ?auto_92467 ?auto_92468 ?auto_92469 ?auto_92470 ?auto_92471 ?auto_92472 ?auto_92473 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_92483 - BLOCK
      ?auto_92484 - BLOCK
      ?auto_92485 - BLOCK
      ?auto_92486 - BLOCK
      ?auto_92487 - BLOCK
      ?auto_92488 - BLOCK
      ?auto_92489 - BLOCK
      ?auto_92490 - BLOCK
    )
    :vars
    (
      ?auto_92491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92490 ?auto_92491 ) ( ON-TABLE ?auto_92483 ) ( ON ?auto_92484 ?auto_92483 ) ( ON ?auto_92485 ?auto_92484 ) ( ON ?auto_92486 ?auto_92485 ) ( ON ?auto_92487 ?auto_92486 ) ( not ( = ?auto_92483 ?auto_92484 ) ) ( not ( = ?auto_92483 ?auto_92485 ) ) ( not ( = ?auto_92483 ?auto_92486 ) ) ( not ( = ?auto_92483 ?auto_92487 ) ) ( not ( = ?auto_92483 ?auto_92488 ) ) ( not ( = ?auto_92483 ?auto_92489 ) ) ( not ( = ?auto_92483 ?auto_92490 ) ) ( not ( = ?auto_92483 ?auto_92491 ) ) ( not ( = ?auto_92484 ?auto_92485 ) ) ( not ( = ?auto_92484 ?auto_92486 ) ) ( not ( = ?auto_92484 ?auto_92487 ) ) ( not ( = ?auto_92484 ?auto_92488 ) ) ( not ( = ?auto_92484 ?auto_92489 ) ) ( not ( = ?auto_92484 ?auto_92490 ) ) ( not ( = ?auto_92484 ?auto_92491 ) ) ( not ( = ?auto_92485 ?auto_92486 ) ) ( not ( = ?auto_92485 ?auto_92487 ) ) ( not ( = ?auto_92485 ?auto_92488 ) ) ( not ( = ?auto_92485 ?auto_92489 ) ) ( not ( = ?auto_92485 ?auto_92490 ) ) ( not ( = ?auto_92485 ?auto_92491 ) ) ( not ( = ?auto_92486 ?auto_92487 ) ) ( not ( = ?auto_92486 ?auto_92488 ) ) ( not ( = ?auto_92486 ?auto_92489 ) ) ( not ( = ?auto_92486 ?auto_92490 ) ) ( not ( = ?auto_92486 ?auto_92491 ) ) ( not ( = ?auto_92487 ?auto_92488 ) ) ( not ( = ?auto_92487 ?auto_92489 ) ) ( not ( = ?auto_92487 ?auto_92490 ) ) ( not ( = ?auto_92487 ?auto_92491 ) ) ( not ( = ?auto_92488 ?auto_92489 ) ) ( not ( = ?auto_92488 ?auto_92490 ) ) ( not ( = ?auto_92488 ?auto_92491 ) ) ( not ( = ?auto_92489 ?auto_92490 ) ) ( not ( = ?auto_92489 ?auto_92491 ) ) ( not ( = ?auto_92490 ?auto_92491 ) ) ( ON ?auto_92489 ?auto_92490 ) ( CLEAR ?auto_92487 ) ( ON ?auto_92488 ?auto_92489 ) ( CLEAR ?auto_92488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92483 ?auto_92484 ?auto_92485 ?auto_92486 ?auto_92487 ?auto_92488 )
      ( MAKE-8PILE ?auto_92483 ?auto_92484 ?auto_92485 ?auto_92486 ?auto_92487 ?auto_92488 ?auto_92489 ?auto_92490 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_92500 - BLOCK
      ?auto_92501 - BLOCK
      ?auto_92502 - BLOCK
      ?auto_92503 - BLOCK
      ?auto_92504 - BLOCK
      ?auto_92505 - BLOCK
      ?auto_92506 - BLOCK
      ?auto_92507 - BLOCK
    )
    :vars
    (
      ?auto_92508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92507 ?auto_92508 ) ( ON-TABLE ?auto_92500 ) ( ON ?auto_92501 ?auto_92500 ) ( ON ?auto_92502 ?auto_92501 ) ( ON ?auto_92503 ?auto_92502 ) ( ON ?auto_92504 ?auto_92503 ) ( not ( = ?auto_92500 ?auto_92501 ) ) ( not ( = ?auto_92500 ?auto_92502 ) ) ( not ( = ?auto_92500 ?auto_92503 ) ) ( not ( = ?auto_92500 ?auto_92504 ) ) ( not ( = ?auto_92500 ?auto_92505 ) ) ( not ( = ?auto_92500 ?auto_92506 ) ) ( not ( = ?auto_92500 ?auto_92507 ) ) ( not ( = ?auto_92500 ?auto_92508 ) ) ( not ( = ?auto_92501 ?auto_92502 ) ) ( not ( = ?auto_92501 ?auto_92503 ) ) ( not ( = ?auto_92501 ?auto_92504 ) ) ( not ( = ?auto_92501 ?auto_92505 ) ) ( not ( = ?auto_92501 ?auto_92506 ) ) ( not ( = ?auto_92501 ?auto_92507 ) ) ( not ( = ?auto_92501 ?auto_92508 ) ) ( not ( = ?auto_92502 ?auto_92503 ) ) ( not ( = ?auto_92502 ?auto_92504 ) ) ( not ( = ?auto_92502 ?auto_92505 ) ) ( not ( = ?auto_92502 ?auto_92506 ) ) ( not ( = ?auto_92502 ?auto_92507 ) ) ( not ( = ?auto_92502 ?auto_92508 ) ) ( not ( = ?auto_92503 ?auto_92504 ) ) ( not ( = ?auto_92503 ?auto_92505 ) ) ( not ( = ?auto_92503 ?auto_92506 ) ) ( not ( = ?auto_92503 ?auto_92507 ) ) ( not ( = ?auto_92503 ?auto_92508 ) ) ( not ( = ?auto_92504 ?auto_92505 ) ) ( not ( = ?auto_92504 ?auto_92506 ) ) ( not ( = ?auto_92504 ?auto_92507 ) ) ( not ( = ?auto_92504 ?auto_92508 ) ) ( not ( = ?auto_92505 ?auto_92506 ) ) ( not ( = ?auto_92505 ?auto_92507 ) ) ( not ( = ?auto_92505 ?auto_92508 ) ) ( not ( = ?auto_92506 ?auto_92507 ) ) ( not ( = ?auto_92506 ?auto_92508 ) ) ( not ( = ?auto_92507 ?auto_92508 ) ) ( ON ?auto_92506 ?auto_92507 ) ( CLEAR ?auto_92504 ) ( ON ?auto_92505 ?auto_92506 ) ( CLEAR ?auto_92505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92500 ?auto_92501 ?auto_92502 ?auto_92503 ?auto_92504 ?auto_92505 )
      ( MAKE-8PILE ?auto_92500 ?auto_92501 ?auto_92502 ?auto_92503 ?auto_92504 ?auto_92505 ?auto_92506 ?auto_92507 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_92517 - BLOCK
      ?auto_92518 - BLOCK
      ?auto_92519 - BLOCK
      ?auto_92520 - BLOCK
      ?auto_92521 - BLOCK
      ?auto_92522 - BLOCK
      ?auto_92523 - BLOCK
      ?auto_92524 - BLOCK
    )
    :vars
    (
      ?auto_92525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92524 ?auto_92525 ) ( ON-TABLE ?auto_92517 ) ( ON ?auto_92518 ?auto_92517 ) ( ON ?auto_92519 ?auto_92518 ) ( ON ?auto_92520 ?auto_92519 ) ( not ( = ?auto_92517 ?auto_92518 ) ) ( not ( = ?auto_92517 ?auto_92519 ) ) ( not ( = ?auto_92517 ?auto_92520 ) ) ( not ( = ?auto_92517 ?auto_92521 ) ) ( not ( = ?auto_92517 ?auto_92522 ) ) ( not ( = ?auto_92517 ?auto_92523 ) ) ( not ( = ?auto_92517 ?auto_92524 ) ) ( not ( = ?auto_92517 ?auto_92525 ) ) ( not ( = ?auto_92518 ?auto_92519 ) ) ( not ( = ?auto_92518 ?auto_92520 ) ) ( not ( = ?auto_92518 ?auto_92521 ) ) ( not ( = ?auto_92518 ?auto_92522 ) ) ( not ( = ?auto_92518 ?auto_92523 ) ) ( not ( = ?auto_92518 ?auto_92524 ) ) ( not ( = ?auto_92518 ?auto_92525 ) ) ( not ( = ?auto_92519 ?auto_92520 ) ) ( not ( = ?auto_92519 ?auto_92521 ) ) ( not ( = ?auto_92519 ?auto_92522 ) ) ( not ( = ?auto_92519 ?auto_92523 ) ) ( not ( = ?auto_92519 ?auto_92524 ) ) ( not ( = ?auto_92519 ?auto_92525 ) ) ( not ( = ?auto_92520 ?auto_92521 ) ) ( not ( = ?auto_92520 ?auto_92522 ) ) ( not ( = ?auto_92520 ?auto_92523 ) ) ( not ( = ?auto_92520 ?auto_92524 ) ) ( not ( = ?auto_92520 ?auto_92525 ) ) ( not ( = ?auto_92521 ?auto_92522 ) ) ( not ( = ?auto_92521 ?auto_92523 ) ) ( not ( = ?auto_92521 ?auto_92524 ) ) ( not ( = ?auto_92521 ?auto_92525 ) ) ( not ( = ?auto_92522 ?auto_92523 ) ) ( not ( = ?auto_92522 ?auto_92524 ) ) ( not ( = ?auto_92522 ?auto_92525 ) ) ( not ( = ?auto_92523 ?auto_92524 ) ) ( not ( = ?auto_92523 ?auto_92525 ) ) ( not ( = ?auto_92524 ?auto_92525 ) ) ( ON ?auto_92523 ?auto_92524 ) ( ON ?auto_92522 ?auto_92523 ) ( CLEAR ?auto_92520 ) ( ON ?auto_92521 ?auto_92522 ) ( CLEAR ?auto_92521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92517 ?auto_92518 ?auto_92519 ?auto_92520 ?auto_92521 )
      ( MAKE-8PILE ?auto_92517 ?auto_92518 ?auto_92519 ?auto_92520 ?auto_92521 ?auto_92522 ?auto_92523 ?auto_92524 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_92534 - BLOCK
      ?auto_92535 - BLOCK
      ?auto_92536 - BLOCK
      ?auto_92537 - BLOCK
      ?auto_92538 - BLOCK
      ?auto_92539 - BLOCK
      ?auto_92540 - BLOCK
      ?auto_92541 - BLOCK
    )
    :vars
    (
      ?auto_92542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92541 ?auto_92542 ) ( ON-TABLE ?auto_92534 ) ( ON ?auto_92535 ?auto_92534 ) ( ON ?auto_92536 ?auto_92535 ) ( ON ?auto_92537 ?auto_92536 ) ( not ( = ?auto_92534 ?auto_92535 ) ) ( not ( = ?auto_92534 ?auto_92536 ) ) ( not ( = ?auto_92534 ?auto_92537 ) ) ( not ( = ?auto_92534 ?auto_92538 ) ) ( not ( = ?auto_92534 ?auto_92539 ) ) ( not ( = ?auto_92534 ?auto_92540 ) ) ( not ( = ?auto_92534 ?auto_92541 ) ) ( not ( = ?auto_92534 ?auto_92542 ) ) ( not ( = ?auto_92535 ?auto_92536 ) ) ( not ( = ?auto_92535 ?auto_92537 ) ) ( not ( = ?auto_92535 ?auto_92538 ) ) ( not ( = ?auto_92535 ?auto_92539 ) ) ( not ( = ?auto_92535 ?auto_92540 ) ) ( not ( = ?auto_92535 ?auto_92541 ) ) ( not ( = ?auto_92535 ?auto_92542 ) ) ( not ( = ?auto_92536 ?auto_92537 ) ) ( not ( = ?auto_92536 ?auto_92538 ) ) ( not ( = ?auto_92536 ?auto_92539 ) ) ( not ( = ?auto_92536 ?auto_92540 ) ) ( not ( = ?auto_92536 ?auto_92541 ) ) ( not ( = ?auto_92536 ?auto_92542 ) ) ( not ( = ?auto_92537 ?auto_92538 ) ) ( not ( = ?auto_92537 ?auto_92539 ) ) ( not ( = ?auto_92537 ?auto_92540 ) ) ( not ( = ?auto_92537 ?auto_92541 ) ) ( not ( = ?auto_92537 ?auto_92542 ) ) ( not ( = ?auto_92538 ?auto_92539 ) ) ( not ( = ?auto_92538 ?auto_92540 ) ) ( not ( = ?auto_92538 ?auto_92541 ) ) ( not ( = ?auto_92538 ?auto_92542 ) ) ( not ( = ?auto_92539 ?auto_92540 ) ) ( not ( = ?auto_92539 ?auto_92541 ) ) ( not ( = ?auto_92539 ?auto_92542 ) ) ( not ( = ?auto_92540 ?auto_92541 ) ) ( not ( = ?auto_92540 ?auto_92542 ) ) ( not ( = ?auto_92541 ?auto_92542 ) ) ( ON ?auto_92540 ?auto_92541 ) ( ON ?auto_92539 ?auto_92540 ) ( CLEAR ?auto_92537 ) ( ON ?auto_92538 ?auto_92539 ) ( CLEAR ?auto_92538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92534 ?auto_92535 ?auto_92536 ?auto_92537 ?auto_92538 )
      ( MAKE-8PILE ?auto_92534 ?auto_92535 ?auto_92536 ?auto_92537 ?auto_92538 ?auto_92539 ?auto_92540 ?auto_92541 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_92551 - BLOCK
      ?auto_92552 - BLOCK
      ?auto_92553 - BLOCK
      ?auto_92554 - BLOCK
      ?auto_92555 - BLOCK
      ?auto_92556 - BLOCK
      ?auto_92557 - BLOCK
      ?auto_92558 - BLOCK
    )
    :vars
    (
      ?auto_92559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92558 ?auto_92559 ) ( ON-TABLE ?auto_92551 ) ( ON ?auto_92552 ?auto_92551 ) ( ON ?auto_92553 ?auto_92552 ) ( not ( = ?auto_92551 ?auto_92552 ) ) ( not ( = ?auto_92551 ?auto_92553 ) ) ( not ( = ?auto_92551 ?auto_92554 ) ) ( not ( = ?auto_92551 ?auto_92555 ) ) ( not ( = ?auto_92551 ?auto_92556 ) ) ( not ( = ?auto_92551 ?auto_92557 ) ) ( not ( = ?auto_92551 ?auto_92558 ) ) ( not ( = ?auto_92551 ?auto_92559 ) ) ( not ( = ?auto_92552 ?auto_92553 ) ) ( not ( = ?auto_92552 ?auto_92554 ) ) ( not ( = ?auto_92552 ?auto_92555 ) ) ( not ( = ?auto_92552 ?auto_92556 ) ) ( not ( = ?auto_92552 ?auto_92557 ) ) ( not ( = ?auto_92552 ?auto_92558 ) ) ( not ( = ?auto_92552 ?auto_92559 ) ) ( not ( = ?auto_92553 ?auto_92554 ) ) ( not ( = ?auto_92553 ?auto_92555 ) ) ( not ( = ?auto_92553 ?auto_92556 ) ) ( not ( = ?auto_92553 ?auto_92557 ) ) ( not ( = ?auto_92553 ?auto_92558 ) ) ( not ( = ?auto_92553 ?auto_92559 ) ) ( not ( = ?auto_92554 ?auto_92555 ) ) ( not ( = ?auto_92554 ?auto_92556 ) ) ( not ( = ?auto_92554 ?auto_92557 ) ) ( not ( = ?auto_92554 ?auto_92558 ) ) ( not ( = ?auto_92554 ?auto_92559 ) ) ( not ( = ?auto_92555 ?auto_92556 ) ) ( not ( = ?auto_92555 ?auto_92557 ) ) ( not ( = ?auto_92555 ?auto_92558 ) ) ( not ( = ?auto_92555 ?auto_92559 ) ) ( not ( = ?auto_92556 ?auto_92557 ) ) ( not ( = ?auto_92556 ?auto_92558 ) ) ( not ( = ?auto_92556 ?auto_92559 ) ) ( not ( = ?auto_92557 ?auto_92558 ) ) ( not ( = ?auto_92557 ?auto_92559 ) ) ( not ( = ?auto_92558 ?auto_92559 ) ) ( ON ?auto_92557 ?auto_92558 ) ( ON ?auto_92556 ?auto_92557 ) ( ON ?auto_92555 ?auto_92556 ) ( CLEAR ?auto_92553 ) ( ON ?auto_92554 ?auto_92555 ) ( CLEAR ?auto_92554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92551 ?auto_92552 ?auto_92553 ?auto_92554 )
      ( MAKE-8PILE ?auto_92551 ?auto_92552 ?auto_92553 ?auto_92554 ?auto_92555 ?auto_92556 ?auto_92557 ?auto_92558 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_92568 - BLOCK
      ?auto_92569 - BLOCK
      ?auto_92570 - BLOCK
      ?auto_92571 - BLOCK
      ?auto_92572 - BLOCK
      ?auto_92573 - BLOCK
      ?auto_92574 - BLOCK
      ?auto_92575 - BLOCK
    )
    :vars
    (
      ?auto_92576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92575 ?auto_92576 ) ( ON-TABLE ?auto_92568 ) ( ON ?auto_92569 ?auto_92568 ) ( ON ?auto_92570 ?auto_92569 ) ( not ( = ?auto_92568 ?auto_92569 ) ) ( not ( = ?auto_92568 ?auto_92570 ) ) ( not ( = ?auto_92568 ?auto_92571 ) ) ( not ( = ?auto_92568 ?auto_92572 ) ) ( not ( = ?auto_92568 ?auto_92573 ) ) ( not ( = ?auto_92568 ?auto_92574 ) ) ( not ( = ?auto_92568 ?auto_92575 ) ) ( not ( = ?auto_92568 ?auto_92576 ) ) ( not ( = ?auto_92569 ?auto_92570 ) ) ( not ( = ?auto_92569 ?auto_92571 ) ) ( not ( = ?auto_92569 ?auto_92572 ) ) ( not ( = ?auto_92569 ?auto_92573 ) ) ( not ( = ?auto_92569 ?auto_92574 ) ) ( not ( = ?auto_92569 ?auto_92575 ) ) ( not ( = ?auto_92569 ?auto_92576 ) ) ( not ( = ?auto_92570 ?auto_92571 ) ) ( not ( = ?auto_92570 ?auto_92572 ) ) ( not ( = ?auto_92570 ?auto_92573 ) ) ( not ( = ?auto_92570 ?auto_92574 ) ) ( not ( = ?auto_92570 ?auto_92575 ) ) ( not ( = ?auto_92570 ?auto_92576 ) ) ( not ( = ?auto_92571 ?auto_92572 ) ) ( not ( = ?auto_92571 ?auto_92573 ) ) ( not ( = ?auto_92571 ?auto_92574 ) ) ( not ( = ?auto_92571 ?auto_92575 ) ) ( not ( = ?auto_92571 ?auto_92576 ) ) ( not ( = ?auto_92572 ?auto_92573 ) ) ( not ( = ?auto_92572 ?auto_92574 ) ) ( not ( = ?auto_92572 ?auto_92575 ) ) ( not ( = ?auto_92572 ?auto_92576 ) ) ( not ( = ?auto_92573 ?auto_92574 ) ) ( not ( = ?auto_92573 ?auto_92575 ) ) ( not ( = ?auto_92573 ?auto_92576 ) ) ( not ( = ?auto_92574 ?auto_92575 ) ) ( not ( = ?auto_92574 ?auto_92576 ) ) ( not ( = ?auto_92575 ?auto_92576 ) ) ( ON ?auto_92574 ?auto_92575 ) ( ON ?auto_92573 ?auto_92574 ) ( ON ?auto_92572 ?auto_92573 ) ( CLEAR ?auto_92570 ) ( ON ?auto_92571 ?auto_92572 ) ( CLEAR ?auto_92571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92568 ?auto_92569 ?auto_92570 ?auto_92571 )
      ( MAKE-8PILE ?auto_92568 ?auto_92569 ?auto_92570 ?auto_92571 ?auto_92572 ?auto_92573 ?auto_92574 ?auto_92575 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_92585 - BLOCK
      ?auto_92586 - BLOCK
      ?auto_92587 - BLOCK
      ?auto_92588 - BLOCK
      ?auto_92589 - BLOCK
      ?auto_92590 - BLOCK
      ?auto_92591 - BLOCK
      ?auto_92592 - BLOCK
    )
    :vars
    (
      ?auto_92593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92592 ?auto_92593 ) ( ON-TABLE ?auto_92585 ) ( ON ?auto_92586 ?auto_92585 ) ( not ( = ?auto_92585 ?auto_92586 ) ) ( not ( = ?auto_92585 ?auto_92587 ) ) ( not ( = ?auto_92585 ?auto_92588 ) ) ( not ( = ?auto_92585 ?auto_92589 ) ) ( not ( = ?auto_92585 ?auto_92590 ) ) ( not ( = ?auto_92585 ?auto_92591 ) ) ( not ( = ?auto_92585 ?auto_92592 ) ) ( not ( = ?auto_92585 ?auto_92593 ) ) ( not ( = ?auto_92586 ?auto_92587 ) ) ( not ( = ?auto_92586 ?auto_92588 ) ) ( not ( = ?auto_92586 ?auto_92589 ) ) ( not ( = ?auto_92586 ?auto_92590 ) ) ( not ( = ?auto_92586 ?auto_92591 ) ) ( not ( = ?auto_92586 ?auto_92592 ) ) ( not ( = ?auto_92586 ?auto_92593 ) ) ( not ( = ?auto_92587 ?auto_92588 ) ) ( not ( = ?auto_92587 ?auto_92589 ) ) ( not ( = ?auto_92587 ?auto_92590 ) ) ( not ( = ?auto_92587 ?auto_92591 ) ) ( not ( = ?auto_92587 ?auto_92592 ) ) ( not ( = ?auto_92587 ?auto_92593 ) ) ( not ( = ?auto_92588 ?auto_92589 ) ) ( not ( = ?auto_92588 ?auto_92590 ) ) ( not ( = ?auto_92588 ?auto_92591 ) ) ( not ( = ?auto_92588 ?auto_92592 ) ) ( not ( = ?auto_92588 ?auto_92593 ) ) ( not ( = ?auto_92589 ?auto_92590 ) ) ( not ( = ?auto_92589 ?auto_92591 ) ) ( not ( = ?auto_92589 ?auto_92592 ) ) ( not ( = ?auto_92589 ?auto_92593 ) ) ( not ( = ?auto_92590 ?auto_92591 ) ) ( not ( = ?auto_92590 ?auto_92592 ) ) ( not ( = ?auto_92590 ?auto_92593 ) ) ( not ( = ?auto_92591 ?auto_92592 ) ) ( not ( = ?auto_92591 ?auto_92593 ) ) ( not ( = ?auto_92592 ?auto_92593 ) ) ( ON ?auto_92591 ?auto_92592 ) ( ON ?auto_92590 ?auto_92591 ) ( ON ?auto_92589 ?auto_92590 ) ( ON ?auto_92588 ?auto_92589 ) ( CLEAR ?auto_92586 ) ( ON ?auto_92587 ?auto_92588 ) ( CLEAR ?auto_92587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92585 ?auto_92586 ?auto_92587 )
      ( MAKE-8PILE ?auto_92585 ?auto_92586 ?auto_92587 ?auto_92588 ?auto_92589 ?auto_92590 ?auto_92591 ?auto_92592 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_92602 - BLOCK
      ?auto_92603 - BLOCK
      ?auto_92604 - BLOCK
      ?auto_92605 - BLOCK
      ?auto_92606 - BLOCK
      ?auto_92607 - BLOCK
      ?auto_92608 - BLOCK
      ?auto_92609 - BLOCK
    )
    :vars
    (
      ?auto_92610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92609 ?auto_92610 ) ( ON-TABLE ?auto_92602 ) ( ON ?auto_92603 ?auto_92602 ) ( not ( = ?auto_92602 ?auto_92603 ) ) ( not ( = ?auto_92602 ?auto_92604 ) ) ( not ( = ?auto_92602 ?auto_92605 ) ) ( not ( = ?auto_92602 ?auto_92606 ) ) ( not ( = ?auto_92602 ?auto_92607 ) ) ( not ( = ?auto_92602 ?auto_92608 ) ) ( not ( = ?auto_92602 ?auto_92609 ) ) ( not ( = ?auto_92602 ?auto_92610 ) ) ( not ( = ?auto_92603 ?auto_92604 ) ) ( not ( = ?auto_92603 ?auto_92605 ) ) ( not ( = ?auto_92603 ?auto_92606 ) ) ( not ( = ?auto_92603 ?auto_92607 ) ) ( not ( = ?auto_92603 ?auto_92608 ) ) ( not ( = ?auto_92603 ?auto_92609 ) ) ( not ( = ?auto_92603 ?auto_92610 ) ) ( not ( = ?auto_92604 ?auto_92605 ) ) ( not ( = ?auto_92604 ?auto_92606 ) ) ( not ( = ?auto_92604 ?auto_92607 ) ) ( not ( = ?auto_92604 ?auto_92608 ) ) ( not ( = ?auto_92604 ?auto_92609 ) ) ( not ( = ?auto_92604 ?auto_92610 ) ) ( not ( = ?auto_92605 ?auto_92606 ) ) ( not ( = ?auto_92605 ?auto_92607 ) ) ( not ( = ?auto_92605 ?auto_92608 ) ) ( not ( = ?auto_92605 ?auto_92609 ) ) ( not ( = ?auto_92605 ?auto_92610 ) ) ( not ( = ?auto_92606 ?auto_92607 ) ) ( not ( = ?auto_92606 ?auto_92608 ) ) ( not ( = ?auto_92606 ?auto_92609 ) ) ( not ( = ?auto_92606 ?auto_92610 ) ) ( not ( = ?auto_92607 ?auto_92608 ) ) ( not ( = ?auto_92607 ?auto_92609 ) ) ( not ( = ?auto_92607 ?auto_92610 ) ) ( not ( = ?auto_92608 ?auto_92609 ) ) ( not ( = ?auto_92608 ?auto_92610 ) ) ( not ( = ?auto_92609 ?auto_92610 ) ) ( ON ?auto_92608 ?auto_92609 ) ( ON ?auto_92607 ?auto_92608 ) ( ON ?auto_92606 ?auto_92607 ) ( ON ?auto_92605 ?auto_92606 ) ( CLEAR ?auto_92603 ) ( ON ?auto_92604 ?auto_92605 ) ( CLEAR ?auto_92604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92602 ?auto_92603 ?auto_92604 )
      ( MAKE-8PILE ?auto_92602 ?auto_92603 ?auto_92604 ?auto_92605 ?auto_92606 ?auto_92607 ?auto_92608 ?auto_92609 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_92619 - BLOCK
      ?auto_92620 - BLOCK
      ?auto_92621 - BLOCK
      ?auto_92622 - BLOCK
      ?auto_92623 - BLOCK
      ?auto_92624 - BLOCK
      ?auto_92625 - BLOCK
      ?auto_92626 - BLOCK
    )
    :vars
    (
      ?auto_92627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92626 ?auto_92627 ) ( ON-TABLE ?auto_92619 ) ( not ( = ?auto_92619 ?auto_92620 ) ) ( not ( = ?auto_92619 ?auto_92621 ) ) ( not ( = ?auto_92619 ?auto_92622 ) ) ( not ( = ?auto_92619 ?auto_92623 ) ) ( not ( = ?auto_92619 ?auto_92624 ) ) ( not ( = ?auto_92619 ?auto_92625 ) ) ( not ( = ?auto_92619 ?auto_92626 ) ) ( not ( = ?auto_92619 ?auto_92627 ) ) ( not ( = ?auto_92620 ?auto_92621 ) ) ( not ( = ?auto_92620 ?auto_92622 ) ) ( not ( = ?auto_92620 ?auto_92623 ) ) ( not ( = ?auto_92620 ?auto_92624 ) ) ( not ( = ?auto_92620 ?auto_92625 ) ) ( not ( = ?auto_92620 ?auto_92626 ) ) ( not ( = ?auto_92620 ?auto_92627 ) ) ( not ( = ?auto_92621 ?auto_92622 ) ) ( not ( = ?auto_92621 ?auto_92623 ) ) ( not ( = ?auto_92621 ?auto_92624 ) ) ( not ( = ?auto_92621 ?auto_92625 ) ) ( not ( = ?auto_92621 ?auto_92626 ) ) ( not ( = ?auto_92621 ?auto_92627 ) ) ( not ( = ?auto_92622 ?auto_92623 ) ) ( not ( = ?auto_92622 ?auto_92624 ) ) ( not ( = ?auto_92622 ?auto_92625 ) ) ( not ( = ?auto_92622 ?auto_92626 ) ) ( not ( = ?auto_92622 ?auto_92627 ) ) ( not ( = ?auto_92623 ?auto_92624 ) ) ( not ( = ?auto_92623 ?auto_92625 ) ) ( not ( = ?auto_92623 ?auto_92626 ) ) ( not ( = ?auto_92623 ?auto_92627 ) ) ( not ( = ?auto_92624 ?auto_92625 ) ) ( not ( = ?auto_92624 ?auto_92626 ) ) ( not ( = ?auto_92624 ?auto_92627 ) ) ( not ( = ?auto_92625 ?auto_92626 ) ) ( not ( = ?auto_92625 ?auto_92627 ) ) ( not ( = ?auto_92626 ?auto_92627 ) ) ( ON ?auto_92625 ?auto_92626 ) ( ON ?auto_92624 ?auto_92625 ) ( ON ?auto_92623 ?auto_92624 ) ( ON ?auto_92622 ?auto_92623 ) ( ON ?auto_92621 ?auto_92622 ) ( CLEAR ?auto_92619 ) ( ON ?auto_92620 ?auto_92621 ) ( CLEAR ?auto_92620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92619 ?auto_92620 )
      ( MAKE-8PILE ?auto_92619 ?auto_92620 ?auto_92621 ?auto_92622 ?auto_92623 ?auto_92624 ?auto_92625 ?auto_92626 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_92636 - BLOCK
      ?auto_92637 - BLOCK
      ?auto_92638 - BLOCK
      ?auto_92639 - BLOCK
      ?auto_92640 - BLOCK
      ?auto_92641 - BLOCK
      ?auto_92642 - BLOCK
      ?auto_92643 - BLOCK
    )
    :vars
    (
      ?auto_92644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92643 ?auto_92644 ) ( ON-TABLE ?auto_92636 ) ( not ( = ?auto_92636 ?auto_92637 ) ) ( not ( = ?auto_92636 ?auto_92638 ) ) ( not ( = ?auto_92636 ?auto_92639 ) ) ( not ( = ?auto_92636 ?auto_92640 ) ) ( not ( = ?auto_92636 ?auto_92641 ) ) ( not ( = ?auto_92636 ?auto_92642 ) ) ( not ( = ?auto_92636 ?auto_92643 ) ) ( not ( = ?auto_92636 ?auto_92644 ) ) ( not ( = ?auto_92637 ?auto_92638 ) ) ( not ( = ?auto_92637 ?auto_92639 ) ) ( not ( = ?auto_92637 ?auto_92640 ) ) ( not ( = ?auto_92637 ?auto_92641 ) ) ( not ( = ?auto_92637 ?auto_92642 ) ) ( not ( = ?auto_92637 ?auto_92643 ) ) ( not ( = ?auto_92637 ?auto_92644 ) ) ( not ( = ?auto_92638 ?auto_92639 ) ) ( not ( = ?auto_92638 ?auto_92640 ) ) ( not ( = ?auto_92638 ?auto_92641 ) ) ( not ( = ?auto_92638 ?auto_92642 ) ) ( not ( = ?auto_92638 ?auto_92643 ) ) ( not ( = ?auto_92638 ?auto_92644 ) ) ( not ( = ?auto_92639 ?auto_92640 ) ) ( not ( = ?auto_92639 ?auto_92641 ) ) ( not ( = ?auto_92639 ?auto_92642 ) ) ( not ( = ?auto_92639 ?auto_92643 ) ) ( not ( = ?auto_92639 ?auto_92644 ) ) ( not ( = ?auto_92640 ?auto_92641 ) ) ( not ( = ?auto_92640 ?auto_92642 ) ) ( not ( = ?auto_92640 ?auto_92643 ) ) ( not ( = ?auto_92640 ?auto_92644 ) ) ( not ( = ?auto_92641 ?auto_92642 ) ) ( not ( = ?auto_92641 ?auto_92643 ) ) ( not ( = ?auto_92641 ?auto_92644 ) ) ( not ( = ?auto_92642 ?auto_92643 ) ) ( not ( = ?auto_92642 ?auto_92644 ) ) ( not ( = ?auto_92643 ?auto_92644 ) ) ( ON ?auto_92642 ?auto_92643 ) ( ON ?auto_92641 ?auto_92642 ) ( ON ?auto_92640 ?auto_92641 ) ( ON ?auto_92639 ?auto_92640 ) ( ON ?auto_92638 ?auto_92639 ) ( CLEAR ?auto_92636 ) ( ON ?auto_92637 ?auto_92638 ) ( CLEAR ?auto_92637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92636 ?auto_92637 )
      ( MAKE-8PILE ?auto_92636 ?auto_92637 ?auto_92638 ?auto_92639 ?auto_92640 ?auto_92641 ?auto_92642 ?auto_92643 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_92653 - BLOCK
      ?auto_92654 - BLOCK
      ?auto_92655 - BLOCK
      ?auto_92656 - BLOCK
      ?auto_92657 - BLOCK
      ?auto_92658 - BLOCK
      ?auto_92659 - BLOCK
      ?auto_92660 - BLOCK
    )
    :vars
    (
      ?auto_92661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92660 ?auto_92661 ) ( not ( = ?auto_92653 ?auto_92654 ) ) ( not ( = ?auto_92653 ?auto_92655 ) ) ( not ( = ?auto_92653 ?auto_92656 ) ) ( not ( = ?auto_92653 ?auto_92657 ) ) ( not ( = ?auto_92653 ?auto_92658 ) ) ( not ( = ?auto_92653 ?auto_92659 ) ) ( not ( = ?auto_92653 ?auto_92660 ) ) ( not ( = ?auto_92653 ?auto_92661 ) ) ( not ( = ?auto_92654 ?auto_92655 ) ) ( not ( = ?auto_92654 ?auto_92656 ) ) ( not ( = ?auto_92654 ?auto_92657 ) ) ( not ( = ?auto_92654 ?auto_92658 ) ) ( not ( = ?auto_92654 ?auto_92659 ) ) ( not ( = ?auto_92654 ?auto_92660 ) ) ( not ( = ?auto_92654 ?auto_92661 ) ) ( not ( = ?auto_92655 ?auto_92656 ) ) ( not ( = ?auto_92655 ?auto_92657 ) ) ( not ( = ?auto_92655 ?auto_92658 ) ) ( not ( = ?auto_92655 ?auto_92659 ) ) ( not ( = ?auto_92655 ?auto_92660 ) ) ( not ( = ?auto_92655 ?auto_92661 ) ) ( not ( = ?auto_92656 ?auto_92657 ) ) ( not ( = ?auto_92656 ?auto_92658 ) ) ( not ( = ?auto_92656 ?auto_92659 ) ) ( not ( = ?auto_92656 ?auto_92660 ) ) ( not ( = ?auto_92656 ?auto_92661 ) ) ( not ( = ?auto_92657 ?auto_92658 ) ) ( not ( = ?auto_92657 ?auto_92659 ) ) ( not ( = ?auto_92657 ?auto_92660 ) ) ( not ( = ?auto_92657 ?auto_92661 ) ) ( not ( = ?auto_92658 ?auto_92659 ) ) ( not ( = ?auto_92658 ?auto_92660 ) ) ( not ( = ?auto_92658 ?auto_92661 ) ) ( not ( = ?auto_92659 ?auto_92660 ) ) ( not ( = ?auto_92659 ?auto_92661 ) ) ( not ( = ?auto_92660 ?auto_92661 ) ) ( ON ?auto_92659 ?auto_92660 ) ( ON ?auto_92658 ?auto_92659 ) ( ON ?auto_92657 ?auto_92658 ) ( ON ?auto_92656 ?auto_92657 ) ( ON ?auto_92655 ?auto_92656 ) ( ON ?auto_92654 ?auto_92655 ) ( ON ?auto_92653 ?auto_92654 ) ( CLEAR ?auto_92653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92653 )
      ( MAKE-8PILE ?auto_92653 ?auto_92654 ?auto_92655 ?auto_92656 ?auto_92657 ?auto_92658 ?auto_92659 ?auto_92660 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_92670 - BLOCK
      ?auto_92671 - BLOCK
      ?auto_92672 - BLOCK
      ?auto_92673 - BLOCK
      ?auto_92674 - BLOCK
      ?auto_92675 - BLOCK
      ?auto_92676 - BLOCK
      ?auto_92677 - BLOCK
    )
    :vars
    (
      ?auto_92678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92677 ?auto_92678 ) ( not ( = ?auto_92670 ?auto_92671 ) ) ( not ( = ?auto_92670 ?auto_92672 ) ) ( not ( = ?auto_92670 ?auto_92673 ) ) ( not ( = ?auto_92670 ?auto_92674 ) ) ( not ( = ?auto_92670 ?auto_92675 ) ) ( not ( = ?auto_92670 ?auto_92676 ) ) ( not ( = ?auto_92670 ?auto_92677 ) ) ( not ( = ?auto_92670 ?auto_92678 ) ) ( not ( = ?auto_92671 ?auto_92672 ) ) ( not ( = ?auto_92671 ?auto_92673 ) ) ( not ( = ?auto_92671 ?auto_92674 ) ) ( not ( = ?auto_92671 ?auto_92675 ) ) ( not ( = ?auto_92671 ?auto_92676 ) ) ( not ( = ?auto_92671 ?auto_92677 ) ) ( not ( = ?auto_92671 ?auto_92678 ) ) ( not ( = ?auto_92672 ?auto_92673 ) ) ( not ( = ?auto_92672 ?auto_92674 ) ) ( not ( = ?auto_92672 ?auto_92675 ) ) ( not ( = ?auto_92672 ?auto_92676 ) ) ( not ( = ?auto_92672 ?auto_92677 ) ) ( not ( = ?auto_92672 ?auto_92678 ) ) ( not ( = ?auto_92673 ?auto_92674 ) ) ( not ( = ?auto_92673 ?auto_92675 ) ) ( not ( = ?auto_92673 ?auto_92676 ) ) ( not ( = ?auto_92673 ?auto_92677 ) ) ( not ( = ?auto_92673 ?auto_92678 ) ) ( not ( = ?auto_92674 ?auto_92675 ) ) ( not ( = ?auto_92674 ?auto_92676 ) ) ( not ( = ?auto_92674 ?auto_92677 ) ) ( not ( = ?auto_92674 ?auto_92678 ) ) ( not ( = ?auto_92675 ?auto_92676 ) ) ( not ( = ?auto_92675 ?auto_92677 ) ) ( not ( = ?auto_92675 ?auto_92678 ) ) ( not ( = ?auto_92676 ?auto_92677 ) ) ( not ( = ?auto_92676 ?auto_92678 ) ) ( not ( = ?auto_92677 ?auto_92678 ) ) ( ON ?auto_92676 ?auto_92677 ) ( ON ?auto_92675 ?auto_92676 ) ( ON ?auto_92674 ?auto_92675 ) ( ON ?auto_92673 ?auto_92674 ) ( ON ?auto_92672 ?auto_92673 ) ( ON ?auto_92671 ?auto_92672 ) ( ON ?auto_92670 ?auto_92671 ) ( CLEAR ?auto_92670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92670 )
      ( MAKE-8PILE ?auto_92670 ?auto_92671 ?auto_92672 ?auto_92673 ?auto_92674 ?auto_92675 ?auto_92676 ?auto_92677 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_92688 - BLOCK
      ?auto_92689 - BLOCK
      ?auto_92690 - BLOCK
      ?auto_92691 - BLOCK
      ?auto_92692 - BLOCK
      ?auto_92693 - BLOCK
      ?auto_92694 - BLOCK
      ?auto_92695 - BLOCK
      ?auto_92696 - BLOCK
    )
    :vars
    (
      ?auto_92697 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_92695 ) ( ON ?auto_92696 ?auto_92697 ) ( CLEAR ?auto_92696 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92688 ) ( ON ?auto_92689 ?auto_92688 ) ( ON ?auto_92690 ?auto_92689 ) ( ON ?auto_92691 ?auto_92690 ) ( ON ?auto_92692 ?auto_92691 ) ( ON ?auto_92693 ?auto_92692 ) ( ON ?auto_92694 ?auto_92693 ) ( ON ?auto_92695 ?auto_92694 ) ( not ( = ?auto_92688 ?auto_92689 ) ) ( not ( = ?auto_92688 ?auto_92690 ) ) ( not ( = ?auto_92688 ?auto_92691 ) ) ( not ( = ?auto_92688 ?auto_92692 ) ) ( not ( = ?auto_92688 ?auto_92693 ) ) ( not ( = ?auto_92688 ?auto_92694 ) ) ( not ( = ?auto_92688 ?auto_92695 ) ) ( not ( = ?auto_92688 ?auto_92696 ) ) ( not ( = ?auto_92688 ?auto_92697 ) ) ( not ( = ?auto_92689 ?auto_92690 ) ) ( not ( = ?auto_92689 ?auto_92691 ) ) ( not ( = ?auto_92689 ?auto_92692 ) ) ( not ( = ?auto_92689 ?auto_92693 ) ) ( not ( = ?auto_92689 ?auto_92694 ) ) ( not ( = ?auto_92689 ?auto_92695 ) ) ( not ( = ?auto_92689 ?auto_92696 ) ) ( not ( = ?auto_92689 ?auto_92697 ) ) ( not ( = ?auto_92690 ?auto_92691 ) ) ( not ( = ?auto_92690 ?auto_92692 ) ) ( not ( = ?auto_92690 ?auto_92693 ) ) ( not ( = ?auto_92690 ?auto_92694 ) ) ( not ( = ?auto_92690 ?auto_92695 ) ) ( not ( = ?auto_92690 ?auto_92696 ) ) ( not ( = ?auto_92690 ?auto_92697 ) ) ( not ( = ?auto_92691 ?auto_92692 ) ) ( not ( = ?auto_92691 ?auto_92693 ) ) ( not ( = ?auto_92691 ?auto_92694 ) ) ( not ( = ?auto_92691 ?auto_92695 ) ) ( not ( = ?auto_92691 ?auto_92696 ) ) ( not ( = ?auto_92691 ?auto_92697 ) ) ( not ( = ?auto_92692 ?auto_92693 ) ) ( not ( = ?auto_92692 ?auto_92694 ) ) ( not ( = ?auto_92692 ?auto_92695 ) ) ( not ( = ?auto_92692 ?auto_92696 ) ) ( not ( = ?auto_92692 ?auto_92697 ) ) ( not ( = ?auto_92693 ?auto_92694 ) ) ( not ( = ?auto_92693 ?auto_92695 ) ) ( not ( = ?auto_92693 ?auto_92696 ) ) ( not ( = ?auto_92693 ?auto_92697 ) ) ( not ( = ?auto_92694 ?auto_92695 ) ) ( not ( = ?auto_92694 ?auto_92696 ) ) ( not ( = ?auto_92694 ?auto_92697 ) ) ( not ( = ?auto_92695 ?auto_92696 ) ) ( not ( = ?auto_92695 ?auto_92697 ) ) ( not ( = ?auto_92696 ?auto_92697 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92696 ?auto_92697 )
      ( !STACK ?auto_92696 ?auto_92695 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_92707 - BLOCK
      ?auto_92708 - BLOCK
      ?auto_92709 - BLOCK
      ?auto_92710 - BLOCK
      ?auto_92711 - BLOCK
      ?auto_92712 - BLOCK
      ?auto_92713 - BLOCK
      ?auto_92714 - BLOCK
      ?auto_92715 - BLOCK
    )
    :vars
    (
      ?auto_92716 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_92714 ) ( ON ?auto_92715 ?auto_92716 ) ( CLEAR ?auto_92715 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92707 ) ( ON ?auto_92708 ?auto_92707 ) ( ON ?auto_92709 ?auto_92708 ) ( ON ?auto_92710 ?auto_92709 ) ( ON ?auto_92711 ?auto_92710 ) ( ON ?auto_92712 ?auto_92711 ) ( ON ?auto_92713 ?auto_92712 ) ( ON ?auto_92714 ?auto_92713 ) ( not ( = ?auto_92707 ?auto_92708 ) ) ( not ( = ?auto_92707 ?auto_92709 ) ) ( not ( = ?auto_92707 ?auto_92710 ) ) ( not ( = ?auto_92707 ?auto_92711 ) ) ( not ( = ?auto_92707 ?auto_92712 ) ) ( not ( = ?auto_92707 ?auto_92713 ) ) ( not ( = ?auto_92707 ?auto_92714 ) ) ( not ( = ?auto_92707 ?auto_92715 ) ) ( not ( = ?auto_92707 ?auto_92716 ) ) ( not ( = ?auto_92708 ?auto_92709 ) ) ( not ( = ?auto_92708 ?auto_92710 ) ) ( not ( = ?auto_92708 ?auto_92711 ) ) ( not ( = ?auto_92708 ?auto_92712 ) ) ( not ( = ?auto_92708 ?auto_92713 ) ) ( not ( = ?auto_92708 ?auto_92714 ) ) ( not ( = ?auto_92708 ?auto_92715 ) ) ( not ( = ?auto_92708 ?auto_92716 ) ) ( not ( = ?auto_92709 ?auto_92710 ) ) ( not ( = ?auto_92709 ?auto_92711 ) ) ( not ( = ?auto_92709 ?auto_92712 ) ) ( not ( = ?auto_92709 ?auto_92713 ) ) ( not ( = ?auto_92709 ?auto_92714 ) ) ( not ( = ?auto_92709 ?auto_92715 ) ) ( not ( = ?auto_92709 ?auto_92716 ) ) ( not ( = ?auto_92710 ?auto_92711 ) ) ( not ( = ?auto_92710 ?auto_92712 ) ) ( not ( = ?auto_92710 ?auto_92713 ) ) ( not ( = ?auto_92710 ?auto_92714 ) ) ( not ( = ?auto_92710 ?auto_92715 ) ) ( not ( = ?auto_92710 ?auto_92716 ) ) ( not ( = ?auto_92711 ?auto_92712 ) ) ( not ( = ?auto_92711 ?auto_92713 ) ) ( not ( = ?auto_92711 ?auto_92714 ) ) ( not ( = ?auto_92711 ?auto_92715 ) ) ( not ( = ?auto_92711 ?auto_92716 ) ) ( not ( = ?auto_92712 ?auto_92713 ) ) ( not ( = ?auto_92712 ?auto_92714 ) ) ( not ( = ?auto_92712 ?auto_92715 ) ) ( not ( = ?auto_92712 ?auto_92716 ) ) ( not ( = ?auto_92713 ?auto_92714 ) ) ( not ( = ?auto_92713 ?auto_92715 ) ) ( not ( = ?auto_92713 ?auto_92716 ) ) ( not ( = ?auto_92714 ?auto_92715 ) ) ( not ( = ?auto_92714 ?auto_92716 ) ) ( not ( = ?auto_92715 ?auto_92716 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92715 ?auto_92716 )
      ( !STACK ?auto_92715 ?auto_92714 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_92726 - BLOCK
      ?auto_92727 - BLOCK
      ?auto_92728 - BLOCK
      ?auto_92729 - BLOCK
      ?auto_92730 - BLOCK
      ?auto_92731 - BLOCK
      ?auto_92732 - BLOCK
      ?auto_92733 - BLOCK
      ?auto_92734 - BLOCK
    )
    :vars
    (
      ?auto_92735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92734 ?auto_92735 ) ( ON-TABLE ?auto_92726 ) ( ON ?auto_92727 ?auto_92726 ) ( ON ?auto_92728 ?auto_92727 ) ( ON ?auto_92729 ?auto_92728 ) ( ON ?auto_92730 ?auto_92729 ) ( ON ?auto_92731 ?auto_92730 ) ( ON ?auto_92732 ?auto_92731 ) ( not ( = ?auto_92726 ?auto_92727 ) ) ( not ( = ?auto_92726 ?auto_92728 ) ) ( not ( = ?auto_92726 ?auto_92729 ) ) ( not ( = ?auto_92726 ?auto_92730 ) ) ( not ( = ?auto_92726 ?auto_92731 ) ) ( not ( = ?auto_92726 ?auto_92732 ) ) ( not ( = ?auto_92726 ?auto_92733 ) ) ( not ( = ?auto_92726 ?auto_92734 ) ) ( not ( = ?auto_92726 ?auto_92735 ) ) ( not ( = ?auto_92727 ?auto_92728 ) ) ( not ( = ?auto_92727 ?auto_92729 ) ) ( not ( = ?auto_92727 ?auto_92730 ) ) ( not ( = ?auto_92727 ?auto_92731 ) ) ( not ( = ?auto_92727 ?auto_92732 ) ) ( not ( = ?auto_92727 ?auto_92733 ) ) ( not ( = ?auto_92727 ?auto_92734 ) ) ( not ( = ?auto_92727 ?auto_92735 ) ) ( not ( = ?auto_92728 ?auto_92729 ) ) ( not ( = ?auto_92728 ?auto_92730 ) ) ( not ( = ?auto_92728 ?auto_92731 ) ) ( not ( = ?auto_92728 ?auto_92732 ) ) ( not ( = ?auto_92728 ?auto_92733 ) ) ( not ( = ?auto_92728 ?auto_92734 ) ) ( not ( = ?auto_92728 ?auto_92735 ) ) ( not ( = ?auto_92729 ?auto_92730 ) ) ( not ( = ?auto_92729 ?auto_92731 ) ) ( not ( = ?auto_92729 ?auto_92732 ) ) ( not ( = ?auto_92729 ?auto_92733 ) ) ( not ( = ?auto_92729 ?auto_92734 ) ) ( not ( = ?auto_92729 ?auto_92735 ) ) ( not ( = ?auto_92730 ?auto_92731 ) ) ( not ( = ?auto_92730 ?auto_92732 ) ) ( not ( = ?auto_92730 ?auto_92733 ) ) ( not ( = ?auto_92730 ?auto_92734 ) ) ( not ( = ?auto_92730 ?auto_92735 ) ) ( not ( = ?auto_92731 ?auto_92732 ) ) ( not ( = ?auto_92731 ?auto_92733 ) ) ( not ( = ?auto_92731 ?auto_92734 ) ) ( not ( = ?auto_92731 ?auto_92735 ) ) ( not ( = ?auto_92732 ?auto_92733 ) ) ( not ( = ?auto_92732 ?auto_92734 ) ) ( not ( = ?auto_92732 ?auto_92735 ) ) ( not ( = ?auto_92733 ?auto_92734 ) ) ( not ( = ?auto_92733 ?auto_92735 ) ) ( not ( = ?auto_92734 ?auto_92735 ) ) ( CLEAR ?auto_92732 ) ( ON ?auto_92733 ?auto_92734 ) ( CLEAR ?auto_92733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_92726 ?auto_92727 ?auto_92728 ?auto_92729 ?auto_92730 ?auto_92731 ?auto_92732 ?auto_92733 )
      ( MAKE-9PILE ?auto_92726 ?auto_92727 ?auto_92728 ?auto_92729 ?auto_92730 ?auto_92731 ?auto_92732 ?auto_92733 ?auto_92734 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_92745 - BLOCK
      ?auto_92746 - BLOCK
      ?auto_92747 - BLOCK
      ?auto_92748 - BLOCK
      ?auto_92749 - BLOCK
      ?auto_92750 - BLOCK
      ?auto_92751 - BLOCK
      ?auto_92752 - BLOCK
      ?auto_92753 - BLOCK
    )
    :vars
    (
      ?auto_92754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92753 ?auto_92754 ) ( ON-TABLE ?auto_92745 ) ( ON ?auto_92746 ?auto_92745 ) ( ON ?auto_92747 ?auto_92746 ) ( ON ?auto_92748 ?auto_92747 ) ( ON ?auto_92749 ?auto_92748 ) ( ON ?auto_92750 ?auto_92749 ) ( ON ?auto_92751 ?auto_92750 ) ( not ( = ?auto_92745 ?auto_92746 ) ) ( not ( = ?auto_92745 ?auto_92747 ) ) ( not ( = ?auto_92745 ?auto_92748 ) ) ( not ( = ?auto_92745 ?auto_92749 ) ) ( not ( = ?auto_92745 ?auto_92750 ) ) ( not ( = ?auto_92745 ?auto_92751 ) ) ( not ( = ?auto_92745 ?auto_92752 ) ) ( not ( = ?auto_92745 ?auto_92753 ) ) ( not ( = ?auto_92745 ?auto_92754 ) ) ( not ( = ?auto_92746 ?auto_92747 ) ) ( not ( = ?auto_92746 ?auto_92748 ) ) ( not ( = ?auto_92746 ?auto_92749 ) ) ( not ( = ?auto_92746 ?auto_92750 ) ) ( not ( = ?auto_92746 ?auto_92751 ) ) ( not ( = ?auto_92746 ?auto_92752 ) ) ( not ( = ?auto_92746 ?auto_92753 ) ) ( not ( = ?auto_92746 ?auto_92754 ) ) ( not ( = ?auto_92747 ?auto_92748 ) ) ( not ( = ?auto_92747 ?auto_92749 ) ) ( not ( = ?auto_92747 ?auto_92750 ) ) ( not ( = ?auto_92747 ?auto_92751 ) ) ( not ( = ?auto_92747 ?auto_92752 ) ) ( not ( = ?auto_92747 ?auto_92753 ) ) ( not ( = ?auto_92747 ?auto_92754 ) ) ( not ( = ?auto_92748 ?auto_92749 ) ) ( not ( = ?auto_92748 ?auto_92750 ) ) ( not ( = ?auto_92748 ?auto_92751 ) ) ( not ( = ?auto_92748 ?auto_92752 ) ) ( not ( = ?auto_92748 ?auto_92753 ) ) ( not ( = ?auto_92748 ?auto_92754 ) ) ( not ( = ?auto_92749 ?auto_92750 ) ) ( not ( = ?auto_92749 ?auto_92751 ) ) ( not ( = ?auto_92749 ?auto_92752 ) ) ( not ( = ?auto_92749 ?auto_92753 ) ) ( not ( = ?auto_92749 ?auto_92754 ) ) ( not ( = ?auto_92750 ?auto_92751 ) ) ( not ( = ?auto_92750 ?auto_92752 ) ) ( not ( = ?auto_92750 ?auto_92753 ) ) ( not ( = ?auto_92750 ?auto_92754 ) ) ( not ( = ?auto_92751 ?auto_92752 ) ) ( not ( = ?auto_92751 ?auto_92753 ) ) ( not ( = ?auto_92751 ?auto_92754 ) ) ( not ( = ?auto_92752 ?auto_92753 ) ) ( not ( = ?auto_92752 ?auto_92754 ) ) ( not ( = ?auto_92753 ?auto_92754 ) ) ( CLEAR ?auto_92751 ) ( ON ?auto_92752 ?auto_92753 ) ( CLEAR ?auto_92752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_92745 ?auto_92746 ?auto_92747 ?auto_92748 ?auto_92749 ?auto_92750 ?auto_92751 ?auto_92752 )
      ( MAKE-9PILE ?auto_92745 ?auto_92746 ?auto_92747 ?auto_92748 ?auto_92749 ?auto_92750 ?auto_92751 ?auto_92752 ?auto_92753 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_92764 - BLOCK
      ?auto_92765 - BLOCK
      ?auto_92766 - BLOCK
      ?auto_92767 - BLOCK
      ?auto_92768 - BLOCK
      ?auto_92769 - BLOCK
      ?auto_92770 - BLOCK
      ?auto_92771 - BLOCK
      ?auto_92772 - BLOCK
    )
    :vars
    (
      ?auto_92773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92772 ?auto_92773 ) ( ON-TABLE ?auto_92764 ) ( ON ?auto_92765 ?auto_92764 ) ( ON ?auto_92766 ?auto_92765 ) ( ON ?auto_92767 ?auto_92766 ) ( ON ?auto_92768 ?auto_92767 ) ( ON ?auto_92769 ?auto_92768 ) ( not ( = ?auto_92764 ?auto_92765 ) ) ( not ( = ?auto_92764 ?auto_92766 ) ) ( not ( = ?auto_92764 ?auto_92767 ) ) ( not ( = ?auto_92764 ?auto_92768 ) ) ( not ( = ?auto_92764 ?auto_92769 ) ) ( not ( = ?auto_92764 ?auto_92770 ) ) ( not ( = ?auto_92764 ?auto_92771 ) ) ( not ( = ?auto_92764 ?auto_92772 ) ) ( not ( = ?auto_92764 ?auto_92773 ) ) ( not ( = ?auto_92765 ?auto_92766 ) ) ( not ( = ?auto_92765 ?auto_92767 ) ) ( not ( = ?auto_92765 ?auto_92768 ) ) ( not ( = ?auto_92765 ?auto_92769 ) ) ( not ( = ?auto_92765 ?auto_92770 ) ) ( not ( = ?auto_92765 ?auto_92771 ) ) ( not ( = ?auto_92765 ?auto_92772 ) ) ( not ( = ?auto_92765 ?auto_92773 ) ) ( not ( = ?auto_92766 ?auto_92767 ) ) ( not ( = ?auto_92766 ?auto_92768 ) ) ( not ( = ?auto_92766 ?auto_92769 ) ) ( not ( = ?auto_92766 ?auto_92770 ) ) ( not ( = ?auto_92766 ?auto_92771 ) ) ( not ( = ?auto_92766 ?auto_92772 ) ) ( not ( = ?auto_92766 ?auto_92773 ) ) ( not ( = ?auto_92767 ?auto_92768 ) ) ( not ( = ?auto_92767 ?auto_92769 ) ) ( not ( = ?auto_92767 ?auto_92770 ) ) ( not ( = ?auto_92767 ?auto_92771 ) ) ( not ( = ?auto_92767 ?auto_92772 ) ) ( not ( = ?auto_92767 ?auto_92773 ) ) ( not ( = ?auto_92768 ?auto_92769 ) ) ( not ( = ?auto_92768 ?auto_92770 ) ) ( not ( = ?auto_92768 ?auto_92771 ) ) ( not ( = ?auto_92768 ?auto_92772 ) ) ( not ( = ?auto_92768 ?auto_92773 ) ) ( not ( = ?auto_92769 ?auto_92770 ) ) ( not ( = ?auto_92769 ?auto_92771 ) ) ( not ( = ?auto_92769 ?auto_92772 ) ) ( not ( = ?auto_92769 ?auto_92773 ) ) ( not ( = ?auto_92770 ?auto_92771 ) ) ( not ( = ?auto_92770 ?auto_92772 ) ) ( not ( = ?auto_92770 ?auto_92773 ) ) ( not ( = ?auto_92771 ?auto_92772 ) ) ( not ( = ?auto_92771 ?auto_92773 ) ) ( not ( = ?auto_92772 ?auto_92773 ) ) ( ON ?auto_92771 ?auto_92772 ) ( CLEAR ?auto_92769 ) ( ON ?auto_92770 ?auto_92771 ) ( CLEAR ?auto_92770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92764 ?auto_92765 ?auto_92766 ?auto_92767 ?auto_92768 ?auto_92769 ?auto_92770 )
      ( MAKE-9PILE ?auto_92764 ?auto_92765 ?auto_92766 ?auto_92767 ?auto_92768 ?auto_92769 ?auto_92770 ?auto_92771 ?auto_92772 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_92783 - BLOCK
      ?auto_92784 - BLOCK
      ?auto_92785 - BLOCK
      ?auto_92786 - BLOCK
      ?auto_92787 - BLOCK
      ?auto_92788 - BLOCK
      ?auto_92789 - BLOCK
      ?auto_92790 - BLOCK
      ?auto_92791 - BLOCK
    )
    :vars
    (
      ?auto_92792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92791 ?auto_92792 ) ( ON-TABLE ?auto_92783 ) ( ON ?auto_92784 ?auto_92783 ) ( ON ?auto_92785 ?auto_92784 ) ( ON ?auto_92786 ?auto_92785 ) ( ON ?auto_92787 ?auto_92786 ) ( ON ?auto_92788 ?auto_92787 ) ( not ( = ?auto_92783 ?auto_92784 ) ) ( not ( = ?auto_92783 ?auto_92785 ) ) ( not ( = ?auto_92783 ?auto_92786 ) ) ( not ( = ?auto_92783 ?auto_92787 ) ) ( not ( = ?auto_92783 ?auto_92788 ) ) ( not ( = ?auto_92783 ?auto_92789 ) ) ( not ( = ?auto_92783 ?auto_92790 ) ) ( not ( = ?auto_92783 ?auto_92791 ) ) ( not ( = ?auto_92783 ?auto_92792 ) ) ( not ( = ?auto_92784 ?auto_92785 ) ) ( not ( = ?auto_92784 ?auto_92786 ) ) ( not ( = ?auto_92784 ?auto_92787 ) ) ( not ( = ?auto_92784 ?auto_92788 ) ) ( not ( = ?auto_92784 ?auto_92789 ) ) ( not ( = ?auto_92784 ?auto_92790 ) ) ( not ( = ?auto_92784 ?auto_92791 ) ) ( not ( = ?auto_92784 ?auto_92792 ) ) ( not ( = ?auto_92785 ?auto_92786 ) ) ( not ( = ?auto_92785 ?auto_92787 ) ) ( not ( = ?auto_92785 ?auto_92788 ) ) ( not ( = ?auto_92785 ?auto_92789 ) ) ( not ( = ?auto_92785 ?auto_92790 ) ) ( not ( = ?auto_92785 ?auto_92791 ) ) ( not ( = ?auto_92785 ?auto_92792 ) ) ( not ( = ?auto_92786 ?auto_92787 ) ) ( not ( = ?auto_92786 ?auto_92788 ) ) ( not ( = ?auto_92786 ?auto_92789 ) ) ( not ( = ?auto_92786 ?auto_92790 ) ) ( not ( = ?auto_92786 ?auto_92791 ) ) ( not ( = ?auto_92786 ?auto_92792 ) ) ( not ( = ?auto_92787 ?auto_92788 ) ) ( not ( = ?auto_92787 ?auto_92789 ) ) ( not ( = ?auto_92787 ?auto_92790 ) ) ( not ( = ?auto_92787 ?auto_92791 ) ) ( not ( = ?auto_92787 ?auto_92792 ) ) ( not ( = ?auto_92788 ?auto_92789 ) ) ( not ( = ?auto_92788 ?auto_92790 ) ) ( not ( = ?auto_92788 ?auto_92791 ) ) ( not ( = ?auto_92788 ?auto_92792 ) ) ( not ( = ?auto_92789 ?auto_92790 ) ) ( not ( = ?auto_92789 ?auto_92791 ) ) ( not ( = ?auto_92789 ?auto_92792 ) ) ( not ( = ?auto_92790 ?auto_92791 ) ) ( not ( = ?auto_92790 ?auto_92792 ) ) ( not ( = ?auto_92791 ?auto_92792 ) ) ( ON ?auto_92790 ?auto_92791 ) ( CLEAR ?auto_92788 ) ( ON ?auto_92789 ?auto_92790 ) ( CLEAR ?auto_92789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92783 ?auto_92784 ?auto_92785 ?auto_92786 ?auto_92787 ?auto_92788 ?auto_92789 )
      ( MAKE-9PILE ?auto_92783 ?auto_92784 ?auto_92785 ?auto_92786 ?auto_92787 ?auto_92788 ?auto_92789 ?auto_92790 ?auto_92791 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_92802 - BLOCK
      ?auto_92803 - BLOCK
      ?auto_92804 - BLOCK
      ?auto_92805 - BLOCK
      ?auto_92806 - BLOCK
      ?auto_92807 - BLOCK
      ?auto_92808 - BLOCK
      ?auto_92809 - BLOCK
      ?auto_92810 - BLOCK
    )
    :vars
    (
      ?auto_92811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92810 ?auto_92811 ) ( ON-TABLE ?auto_92802 ) ( ON ?auto_92803 ?auto_92802 ) ( ON ?auto_92804 ?auto_92803 ) ( ON ?auto_92805 ?auto_92804 ) ( ON ?auto_92806 ?auto_92805 ) ( not ( = ?auto_92802 ?auto_92803 ) ) ( not ( = ?auto_92802 ?auto_92804 ) ) ( not ( = ?auto_92802 ?auto_92805 ) ) ( not ( = ?auto_92802 ?auto_92806 ) ) ( not ( = ?auto_92802 ?auto_92807 ) ) ( not ( = ?auto_92802 ?auto_92808 ) ) ( not ( = ?auto_92802 ?auto_92809 ) ) ( not ( = ?auto_92802 ?auto_92810 ) ) ( not ( = ?auto_92802 ?auto_92811 ) ) ( not ( = ?auto_92803 ?auto_92804 ) ) ( not ( = ?auto_92803 ?auto_92805 ) ) ( not ( = ?auto_92803 ?auto_92806 ) ) ( not ( = ?auto_92803 ?auto_92807 ) ) ( not ( = ?auto_92803 ?auto_92808 ) ) ( not ( = ?auto_92803 ?auto_92809 ) ) ( not ( = ?auto_92803 ?auto_92810 ) ) ( not ( = ?auto_92803 ?auto_92811 ) ) ( not ( = ?auto_92804 ?auto_92805 ) ) ( not ( = ?auto_92804 ?auto_92806 ) ) ( not ( = ?auto_92804 ?auto_92807 ) ) ( not ( = ?auto_92804 ?auto_92808 ) ) ( not ( = ?auto_92804 ?auto_92809 ) ) ( not ( = ?auto_92804 ?auto_92810 ) ) ( not ( = ?auto_92804 ?auto_92811 ) ) ( not ( = ?auto_92805 ?auto_92806 ) ) ( not ( = ?auto_92805 ?auto_92807 ) ) ( not ( = ?auto_92805 ?auto_92808 ) ) ( not ( = ?auto_92805 ?auto_92809 ) ) ( not ( = ?auto_92805 ?auto_92810 ) ) ( not ( = ?auto_92805 ?auto_92811 ) ) ( not ( = ?auto_92806 ?auto_92807 ) ) ( not ( = ?auto_92806 ?auto_92808 ) ) ( not ( = ?auto_92806 ?auto_92809 ) ) ( not ( = ?auto_92806 ?auto_92810 ) ) ( not ( = ?auto_92806 ?auto_92811 ) ) ( not ( = ?auto_92807 ?auto_92808 ) ) ( not ( = ?auto_92807 ?auto_92809 ) ) ( not ( = ?auto_92807 ?auto_92810 ) ) ( not ( = ?auto_92807 ?auto_92811 ) ) ( not ( = ?auto_92808 ?auto_92809 ) ) ( not ( = ?auto_92808 ?auto_92810 ) ) ( not ( = ?auto_92808 ?auto_92811 ) ) ( not ( = ?auto_92809 ?auto_92810 ) ) ( not ( = ?auto_92809 ?auto_92811 ) ) ( not ( = ?auto_92810 ?auto_92811 ) ) ( ON ?auto_92809 ?auto_92810 ) ( ON ?auto_92808 ?auto_92809 ) ( CLEAR ?auto_92806 ) ( ON ?auto_92807 ?auto_92808 ) ( CLEAR ?auto_92807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92802 ?auto_92803 ?auto_92804 ?auto_92805 ?auto_92806 ?auto_92807 )
      ( MAKE-9PILE ?auto_92802 ?auto_92803 ?auto_92804 ?auto_92805 ?auto_92806 ?auto_92807 ?auto_92808 ?auto_92809 ?auto_92810 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_92821 - BLOCK
      ?auto_92822 - BLOCK
      ?auto_92823 - BLOCK
      ?auto_92824 - BLOCK
      ?auto_92825 - BLOCK
      ?auto_92826 - BLOCK
      ?auto_92827 - BLOCK
      ?auto_92828 - BLOCK
      ?auto_92829 - BLOCK
    )
    :vars
    (
      ?auto_92830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92829 ?auto_92830 ) ( ON-TABLE ?auto_92821 ) ( ON ?auto_92822 ?auto_92821 ) ( ON ?auto_92823 ?auto_92822 ) ( ON ?auto_92824 ?auto_92823 ) ( ON ?auto_92825 ?auto_92824 ) ( not ( = ?auto_92821 ?auto_92822 ) ) ( not ( = ?auto_92821 ?auto_92823 ) ) ( not ( = ?auto_92821 ?auto_92824 ) ) ( not ( = ?auto_92821 ?auto_92825 ) ) ( not ( = ?auto_92821 ?auto_92826 ) ) ( not ( = ?auto_92821 ?auto_92827 ) ) ( not ( = ?auto_92821 ?auto_92828 ) ) ( not ( = ?auto_92821 ?auto_92829 ) ) ( not ( = ?auto_92821 ?auto_92830 ) ) ( not ( = ?auto_92822 ?auto_92823 ) ) ( not ( = ?auto_92822 ?auto_92824 ) ) ( not ( = ?auto_92822 ?auto_92825 ) ) ( not ( = ?auto_92822 ?auto_92826 ) ) ( not ( = ?auto_92822 ?auto_92827 ) ) ( not ( = ?auto_92822 ?auto_92828 ) ) ( not ( = ?auto_92822 ?auto_92829 ) ) ( not ( = ?auto_92822 ?auto_92830 ) ) ( not ( = ?auto_92823 ?auto_92824 ) ) ( not ( = ?auto_92823 ?auto_92825 ) ) ( not ( = ?auto_92823 ?auto_92826 ) ) ( not ( = ?auto_92823 ?auto_92827 ) ) ( not ( = ?auto_92823 ?auto_92828 ) ) ( not ( = ?auto_92823 ?auto_92829 ) ) ( not ( = ?auto_92823 ?auto_92830 ) ) ( not ( = ?auto_92824 ?auto_92825 ) ) ( not ( = ?auto_92824 ?auto_92826 ) ) ( not ( = ?auto_92824 ?auto_92827 ) ) ( not ( = ?auto_92824 ?auto_92828 ) ) ( not ( = ?auto_92824 ?auto_92829 ) ) ( not ( = ?auto_92824 ?auto_92830 ) ) ( not ( = ?auto_92825 ?auto_92826 ) ) ( not ( = ?auto_92825 ?auto_92827 ) ) ( not ( = ?auto_92825 ?auto_92828 ) ) ( not ( = ?auto_92825 ?auto_92829 ) ) ( not ( = ?auto_92825 ?auto_92830 ) ) ( not ( = ?auto_92826 ?auto_92827 ) ) ( not ( = ?auto_92826 ?auto_92828 ) ) ( not ( = ?auto_92826 ?auto_92829 ) ) ( not ( = ?auto_92826 ?auto_92830 ) ) ( not ( = ?auto_92827 ?auto_92828 ) ) ( not ( = ?auto_92827 ?auto_92829 ) ) ( not ( = ?auto_92827 ?auto_92830 ) ) ( not ( = ?auto_92828 ?auto_92829 ) ) ( not ( = ?auto_92828 ?auto_92830 ) ) ( not ( = ?auto_92829 ?auto_92830 ) ) ( ON ?auto_92828 ?auto_92829 ) ( ON ?auto_92827 ?auto_92828 ) ( CLEAR ?auto_92825 ) ( ON ?auto_92826 ?auto_92827 ) ( CLEAR ?auto_92826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92821 ?auto_92822 ?auto_92823 ?auto_92824 ?auto_92825 ?auto_92826 )
      ( MAKE-9PILE ?auto_92821 ?auto_92822 ?auto_92823 ?auto_92824 ?auto_92825 ?auto_92826 ?auto_92827 ?auto_92828 ?auto_92829 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_92840 - BLOCK
      ?auto_92841 - BLOCK
      ?auto_92842 - BLOCK
      ?auto_92843 - BLOCK
      ?auto_92844 - BLOCK
      ?auto_92845 - BLOCK
      ?auto_92846 - BLOCK
      ?auto_92847 - BLOCK
      ?auto_92848 - BLOCK
    )
    :vars
    (
      ?auto_92849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92848 ?auto_92849 ) ( ON-TABLE ?auto_92840 ) ( ON ?auto_92841 ?auto_92840 ) ( ON ?auto_92842 ?auto_92841 ) ( ON ?auto_92843 ?auto_92842 ) ( not ( = ?auto_92840 ?auto_92841 ) ) ( not ( = ?auto_92840 ?auto_92842 ) ) ( not ( = ?auto_92840 ?auto_92843 ) ) ( not ( = ?auto_92840 ?auto_92844 ) ) ( not ( = ?auto_92840 ?auto_92845 ) ) ( not ( = ?auto_92840 ?auto_92846 ) ) ( not ( = ?auto_92840 ?auto_92847 ) ) ( not ( = ?auto_92840 ?auto_92848 ) ) ( not ( = ?auto_92840 ?auto_92849 ) ) ( not ( = ?auto_92841 ?auto_92842 ) ) ( not ( = ?auto_92841 ?auto_92843 ) ) ( not ( = ?auto_92841 ?auto_92844 ) ) ( not ( = ?auto_92841 ?auto_92845 ) ) ( not ( = ?auto_92841 ?auto_92846 ) ) ( not ( = ?auto_92841 ?auto_92847 ) ) ( not ( = ?auto_92841 ?auto_92848 ) ) ( not ( = ?auto_92841 ?auto_92849 ) ) ( not ( = ?auto_92842 ?auto_92843 ) ) ( not ( = ?auto_92842 ?auto_92844 ) ) ( not ( = ?auto_92842 ?auto_92845 ) ) ( not ( = ?auto_92842 ?auto_92846 ) ) ( not ( = ?auto_92842 ?auto_92847 ) ) ( not ( = ?auto_92842 ?auto_92848 ) ) ( not ( = ?auto_92842 ?auto_92849 ) ) ( not ( = ?auto_92843 ?auto_92844 ) ) ( not ( = ?auto_92843 ?auto_92845 ) ) ( not ( = ?auto_92843 ?auto_92846 ) ) ( not ( = ?auto_92843 ?auto_92847 ) ) ( not ( = ?auto_92843 ?auto_92848 ) ) ( not ( = ?auto_92843 ?auto_92849 ) ) ( not ( = ?auto_92844 ?auto_92845 ) ) ( not ( = ?auto_92844 ?auto_92846 ) ) ( not ( = ?auto_92844 ?auto_92847 ) ) ( not ( = ?auto_92844 ?auto_92848 ) ) ( not ( = ?auto_92844 ?auto_92849 ) ) ( not ( = ?auto_92845 ?auto_92846 ) ) ( not ( = ?auto_92845 ?auto_92847 ) ) ( not ( = ?auto_92845 ?auto_92848 ) ) ( not ( = ?auto_92845 ?auto_92849 ) ) ( not ( = ?auto_92846 ?auto_92847 ) ) ( not ( = ?auto_92846 ?auto_92848 ) ) ( not ( = ?auto_92846 ?auto_92849 ) ) ( not ( = ?auto_92847 ?auto_92848 ) ) ( not ( = ?auto_92847 ?auto_92849 ) ) ( not ( = ?auto_92848 ?auto_92849 ) ) ( ON ?auto_92847 ?auto_92848 ) ( ON ?auto_92846 ?auto_92847 ) ( ON ?auto_92845 ?auto_92846 ) ( CLEAR ?auto_92843 ) ( ON ?auto_92844 ?auto_92845 ) ( CLEAR ?auto_92844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92840 ?auto_92841 ?auto_92842 ?auto_92843 ?auto_92844 )
      ( MAKE-9PILE ?auto_92840 ?auto_92841 ?auto_92842 ?auto_92843 ?auto_92844 ?auto_92845 ?auto_92846 ?auto_92847 ?auto_92848 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_92859 - BLOCK
      ?auto_92860 - BLOCK
      ?auto_92861 - BLOCK
      ?auto_92862 - BLOCK
      ?auto_92863 - BLOCK
      ?auto_92864 - BLOCK
      ?auto_92865 - BLOCK
      ?auto_92866 - BLOCK
      ?auto_92867 - BLOCK
    )
    :vars
    (
      ?auto_92868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92867 ?auto_92868 ) ( ON-TABLE ?auto_92859 ) ( ON ?auto_92860 ?auto_92859 ) ( ON ?auto_92861 ?auto_92860 ) ( ON ?auto_92862 ?auto_92861 ) ( not ( = ?auto_92859 ?auto_92860 ) ) ( not ( = ?auto_92859 ?auto_92861 ) ) ( not ( = ?auto_92859 ?auto_92862 ) ) ( not ( = ?auto_92859 ?auto_92863 ) ) ( not ( = ?auto_92859 ?auto_92864 ) ) ( not ( = ?auto_92859 ?auto_92865 ) ) ( not ( = ?auto_92859 ?auto_92866 ) ) ( not ( = ?auto_92859 ?auto_92867 ) ) ( not ( = ?auto_92859 ?auto_92868 ) ) ( not ( = ?auto_92860 ?auto_92861 ) ) ( not ( = ?auto_92860 ?auto_92862 ) ) ( not ( = ?auto_92860 ?auto_92863 ) ) ( not ( = ?auto_92860 ?auto_92864 ) ) ( not ( = ?auto_92860 ?auto_92865 ) ) ( not ( = ?auto_92860 ?auto_92866 ) ) ( not ( = ?auto_92860 ?auto_92867 ) ) ( not ( = ?auto_92860 ?auto_92868 ) ) ( not ( = ?auto_92861 ?auto_92862 ) ) ( not ( = ?auto_92861 ?auto_92863 ) ) ( not ( = ?auto_92861 ?auto_92864 ) ) ( not ( = ?auto_92861 ?auto_92865 ) ) ( not ( = ?auto_92861 ?auto_92866 ) ) ( not ( = ?auto_92861 ?auto_92867 ) ) ( not ( = ?auto_92861 ?auto_92868 ) ) ( not ( = ?auto_92862 ?auto_92863 ) ) ( not ( = ?auto_92862 ?auto_92864 ) ) ( not ( = ?auto_92862 ?auto_92865 ) ) ( not ( = ?auto_92862 ?auto_92866 ) ) ( not ( = ?auto_92862 ?auto_92867 ) ) ( not ( = ?auto_92862 ?auto_92868 ) ) ( not ( = ?auto_92863 ?auto_92864 ) ) ( not ( = ?auto_92863 ?auto_92865 ) ) ( not ( = ?auto_92863 ?auto_92866 ) ) ( not ( = ?auto_92863 ?auto_92867 ) ) ( not ( = ?auto_92863 ?auto_92868 ) ) ( not ( = ?auto_92864 ?auto_92865 ) ) ( not ( = ?auto_92864 ?auto_92866 ) ) ( not ( = ?auto_92864 ?auto_92867 ) ) ( not ( = ?auto_92864 ?auto_92868 ) ) ( not ( = ?auto_92865 ?auto_92866 ) ) ( not ( = ?auto_92865 ?auto_92867 ) ) ( not ( = ?auto_92865 ?auto_92868 ) ) ( not ( = ?auto_92866 ?auto_92867 ) ) ( not ( = ?auto_92866 ?auto_92868 ) ) ( not ( = ?auto_92867 ?auto_92868 ) ) ( ON ?auto_92866 ?auto_92867 ) ( ON ?auto_92865 ?auto_92866 ) ( ON ?auto_92864 ?auto_92865 ) ( CLEAR ?auto_92862 ) ( ON ?auto_92863 ?auto_92864 ) ( CLEAR ?auto_92863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92859 ?auto_92860 ?auto_92861 ?auto_92862 ?auto_92863 )
      ( MAKE-9PILE ?auto_92859 ?auto_92860 ?auto_92861 ?auto_92862 ?auto_92863 ?auto_92864 ?auto_92865 ?auto_92866 ?auto_92867 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_92878 - BLOCK
      ?auto_92879 - BLOCK
      ?auto_92880 - BLOCK
      ?auto_92881 - BLOCK
      ?auto_92882 - BLOCK
      ?auto_92883 - BLOCK
      ?auto_92884 - BLOCK
      ?auto_92885 - BLOCK
      ?auto_92886 - BLOCK
    )
    :vars
    (
      ?auto_92887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92886 ?auto_92887 ) ( ON-TABLE ?auto_92878 ) ( ON ?auto_92879 ?auto_92878 ) ( ON ?auto_92880 ?auto_92879 ) ( not ( = ?auto_92878 ?auto_92879 ) ) ( not ( = ?auto_92878 ?auto_92880 ) ) ( not ( = ?auto_92878 ?auto_92881 ) ) ( not ( = ?auto_92878 ?auto_92882 ) ) ( not ( = ?auto_92878 ?auto_92883 ) ) ( not ( = ?auto_92878 ?auto_92884 ) ) ( not ( = ?auto_92878 ?auto_92885 ) ) ( not ( = ?auto_92878 ?auto_92886 ) ) ( not ( = ?auto_92878 ?auto_92887 ) ) ( not ( = ?auto_92879 ?auto_92880 ) ) ( not ( = ?auto_92879 ?auto_92881 ) ) ( not ( = ?auto_92879 ?auto_92882 ) ) ( not ( = ?auto_92879 ?auto_92883 ) ) ( not ( = ?auto_92879 ?auto_92884 ) ) ( not ( = ?auto_92879 ?auto_92885 ) ) ( not ( = ?auto_92879 ?auto_92886 ) ) ( not ( = ?auto_92879 ?auto_92887 ) ) ( not ( = ?auto_92880 ?auto_92881 ) ) ( not ( = ?auto_92880 ?auto_92882 ) ) ( not ( = ?auto_92880 ?auto_92883 ) ) ( not ( = ?auto_92880 ?auto_92884 ) ) ( not ( = ?auto_92880 ?auto_92885 ) ) ( not ( = ?auto_92880 ?auto_92886 ) ) ( not ( = ?auto_92880 ?auto_92887 ) ) ( not ( = ?auto_92881 ?auto_92882 ) ) ( not ( = ?auto_92881 ?auto_92883 ) ) ( not ( = ?auto_92881 ?auto_92884 ) ) ( not ( = ?auto_92881 ?auto_92885 ) ) ( not ( = ?auto_92881 ?auto_92886 ) ) ( not ( = ?auto_92881 ?auto_92887 ) ) ( not ( = ?auto_92882 ?auto_92883 ) ) ( not ( = ?auto_92882 ?auto_92884 ) ) ( not ( = ?auto_92882 ?auto_92885 ) ) ( not ( = ?auto_92882 ?auto_92886 ) ) ( not ( = ?auto_92882 ?auto_92887 ) ) ( not ( = ?auto_92883 ?auto_92884 ) ) ( not ( = ?auto_92883 ?auto_92885 ) ) ( not ( = ?auto_92883 ?auto_92886 ) ) ( not ( = ?auto_92883 ?auto_92887 ) ) ( not ( = ?auto_92884 ?auto_92885 ) ) ( not ( = ?auto_92884 ?auto_92886 ) ) ( not ( = ?auto_92884 ?auto_92887 ) ) ( not ( = ?auto_92885 ?auto_92886 ) ) ( not ( = ?auto_92885 ?auto_92887 ) ) ( not ( = ?auto_92886 ?auto_92887 ) ) ( ON ?auto_92885 ?auto_92886 ) ( ON ?auto_92884 ?auto_92885 ) ( ON ?auto_92883 ?auto_92884 ) ( ON ?auto_92882 ?auto_92883 ) ( CLEAR ?auto_92880 ) ( ON ?auto_92881 ?auto_92882 ) ( CLEAR ?auto_92881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92878 ?auto_92879 ?auto_92880 ?auto_92881 )
      ( MAKE-9PILE ?auto_92878 ?auto_92879 ?auto_92880 ?auto_92881 ?auto_92882 ?auto_92883 ?auto_92884 ?auto_92885 ?auto_92886 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_92897 - BLOCK
      ?auto_92898 - BLOCK
      ?auto_92899 - BLOCK
      ?auto_92900 - BLOCK
      ?auto_92901 - BLOCK
      ?auto_92902 - BLOCK
      ?auto_92903 - BLOCK
      ?auto_92904 - BLOCK
      ?auto_92905 - BLOCK
    )
    :vars
    (
      ?auto_92906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92905 ?auto_92906 ) ( ON-TABLE ?auto_92897 ) ( ON ?auto_92898 ?auto_92897 ) ( ON ?auto_92899 ?auto_92898 ) ( not ( = ?auto_92897 ?auto_92898 ) ) ( not ( = ?auto_92897 ?auto_92899 ) ) ( not ( = ?auto_92897 ?auto_92900 ) ) ( not ( = ?auto_92897 ?auto_92901 ) ) ( not ( = ?auto_92897 ?auto_92902 ) ) ( not ( = ?auto_92897 ?auto_92903 ) ) ( not ( = ?auto_92897 ?auto_92904 ) ) ( not ( = ?auto_92897 ?auto_92905 ) ) ( not ( = ?auto_92897 ?auto_92906 ) ) ( not ( = ?auto_92898 ?auto_92899 ) ) ( not ( = ?auto_92898 ?auto_92900 ) ) ( not ( = ?auto_92898 ?auto_92901 ) ) ( not ( = ?auto_92898 ?auto_92902 ) ) ( not ( = ?auto_92898 ?auto_92903 ) ) ( not ( = ?auto_92898 ?auto_92904 ) ) ( not ( = ?auto_92898 ?auto_92905 ) ) ( not ( = ?auto_92898 ?auto_92906 ) ) ( not ( = ?auto_92899 ?auto_92900 ) ) ( not ( = ?auto_92899 ?auto_92901 ) ) ( not ( = ?auto_92899 ?auto_92902 ) ) ( not ( = ?auto_92899 ?auto_92903 ) ) ( not ( = ?auto_92899 ?auto_92904 ) ) ( not ( = ?auto_92899 ?auto_92905 ) ) ( not ( = ?auto_92899 ?auto_92906 ) ) ( not ( = ?auto_92900 ?auto_92901 ) ) ( not ( = ?auto_92900 ?auto_92902 ) ) ( not ( = ?auto_92900 ?auto_92903 ) ) ( not ( = ?auto_92900 ?auto_92904 ) ) ( not ( = ?auto_92900 ?auto_92905 ) ) ( not ( = ?auto_92900 ?auto_92906 ) ) ( not ( = ?auto_92901 ?auto_92902 ) ) ( not ( = ?auto_92901 ?auto_92903 ) ) ( not ( = ?auto_92901 ?auto_92904 ) ) ( not ( = ?auto_92901 ?auto_92905 ) ) ( not ( = ?auto_92901 ?auto_92906 ) ) ( not ( = ?auto_92902 ?auto_92903 ) ) ( not ( = ?auto_92902 ?auto_92904 ) ) ( not ( = ?auto_92902 ?auto_92905 ) ) ( not ( = ?auto_92902 ?auto_92906 ) ) ( not ( = ?auto_92903 ?auto_92904 ) ) ( not ( = ?auto_92903 ?auto_92905 ) ) ( not ( = ?auto_92903 ?auto_92906 ) ) ( not ( = ?auto_92904 ?auto_92905 ) ) ( not ( = ?auto_92904 ?auto_92906 ) ) ( not ( = ?auto_92905 ?auto_92906 ) ) ( ON ?auto_92904 ?auto_92905 ) ( ON ?auto_92903 ?auto_92904 ) ( ON ?auto_92902 ?auto_92903 ) ( ON ?auto_92901 ?auto_92902 ) ( CLEAR ?auto_92899 ) ( ON ?auto_92900 ?auto_92901 ) ( CLEAR ?auto_92900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92897 ?auto_92898 ?auto_92899 ?auto_92900 )
      ( MAKE-9PILE ?auto_92897 ?auto_92898 ?auto_92899 ?auto_92900 ?auto_92901 ?auto_92902 ?auto_92903 ?auto_92904 ?auto_92905 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_92916 - BLOCK
      ?auto_92917 - BLOCK
      ?auto_92918 - BLOCK
      ?auto_92919 - BLOCK
      ?auto_92920 - BLOCK
      ?auto_92921 - BLOCK
      ?auto_92922 - BLOCK
      ?auto_92923 - BLOCK
      ?auto_92924 - BLOCK
    )
    :vars
    (
      ?auto_92925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92924 ?auto_92925 ) ( ON-TABLE ?auto_92916 ) ( ON ?auto_92917 ?auto_92916 ) ( not ( = ?auto_92916 ?auto_92917 ) ) ( not ( = ?auto_92916 ?auto_92918 ) ) ( not ( = ?auto_92916 ?auto_92919 ) ) ( not ( = ?auto_92916 ?auto_92920 ) ) ( not ( = ?auto_92916 ?auto_92921 ) ) ( not ( = ?auto_92916 ?auto_92922 ) ) ( not ( = ?auto_92916 ?auto_92923 ) ) ( not ( = ?auto_92916 ?auto_92924 ) ) ( not ( = ?auto_92916 ?auto_92925 ) ) ( not ( = ?auto_92917 ?auto_92918 ) ) ( not ( = ?auto_92917 ?auto_92919 ) ) ( not ( = ?auto_92917 ?auto_92920 ) ) ( not ( = ?auto_92917 ?auto_92921 ) ) ( not ( = ?auto_92917 ?auto_92922 ) ) ( not ( = ?auto_92917 ?auto_92923 ) ) ( not ( = ?auto_92917 ?auto_92924 ) ) ( not ( = ?auto_92917 ?auto_92925 ) ) ( not ( = ?auto_92918 ?auto_92919 ) ) ( not ( = ?auto_92918 ?auto_92920 ) ) ( not ( = ?auto_92918 ?auto_92921 ) ) ( not ( = ?auto_92918 ?auto_92922 ) ) ( not ( = ?auto_92918 ?auto_92923 ) ) ( not ( = ?auto_92918 ?auto_92924 ) ) ( not ( = ?auto_92918 ?auto_92925 ) ) ( not ( = ?auto_92919 ?auto_92920 ) ) ( not ( = ?auto_92919 ?auto_92921 ) ) ( not ( = ?auto_92919 ?auto_92922 ) ) ( not ( = ?auto_92919 ?auto_92923 ) ) ( not ( = ?auto_92919 ?auto_92924 ) ) ( not ( = ?auto_92919 ?auto_92925 ) ) ( not ( = ?auto_92920 ?auto_92921 ) ) ( not ( = ?auto_92920 ?auto_92922 ) ) ( not ( = ?auto_92920 ?auto_92923 ) ) ( not ( = ?auto_92920 ?auto_92924 ) ) ( not ( = ?auto_92920 ?auto_92925 ) ) ( not ( = ?auto_92921 ?auto_92922 ) ) ( not ( = ?auto_92921 ?auto_92923 ) ) ( not ( = ?auto_92921 ?auto_92924 ) ) ( not ( = ?auto_92921 ?auto_92925 ) ) ( not ( = ?auto_92922 ?auto_92923 ) ) ( not ( = ?auto_92922 ?auto_92924 ) ) ( not ( = ?auto_92922 ?auto_92925 ) ) ( not ( = ?auto_92923 ?auto_92924 ) ) ( not ( = ?auto_92923 ?auto_92925 ) ) ( not ( = ?auto_92924 ?auto_92925 ) ) ( ON ?auto_92923 ?auto_92924 ) ( ON ?auto_92922 ?auto_92923 ) ( ON ?auto_92921 ?auto_92922 ) ( ON ?auto_92920 ?auto_92921 ) ( ON ?auto_92919 ?auto_92920 ) ( CLEAR ?auto_92917 ) ( ON ?auto_92918 ?auto_92919 ) ( CLEAR ?auto_92918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92916 ?auto_92917 ?auto_92918 )
      ( MAKE-9PILE ?auto_92916 ?auto_92917 ?auto_92918 ?auto_92919 ?auto_92920 ?auto_92921 ?auto_92922 ?auto_92923 ?auto_92924 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_92935 - BLOCK
      ?auto_92936 - BLOCK
      ?auto_92937 - BLOCK
      ?auto_92938 - BLOCK
      ?auto_92939 - BLOCK
      ?auto_92940 - BLOCK
      ?auto_92941 - BLOCK
      ?auto_92942 - BLOCK
      ?auto_92943 - BLOCK
    )
    :vars
    (
      ?auto_92944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92943 ?auto_92944 ) ( ON-TABLE ?auto_92935 ) ( ON ?auto_92936 ?auto_92935 ) ( not ( = ?auto_92935 ?auto_92936 ) ) ( not ( = ?auto_92935 ?auto_92937 ) ) ( not ( = ?auto_92935 ?auto_92938 ) ) ( not ( = ?auto_92935 ?auto_92939 ) ) ( not ( = ?auto_92935 ?auto_92940 ) ) ( not ( = ?auto_92935 ?auto_92941 ) ) ( not ( = ?auto_92935 ?auto_92942 ) ) ( not ( = ?auto_92935 ?auto_92943 ) ) ( not ( = ?auto_92935 ?auto_92944 ) ) ( not ( = ?auto_92936 ?auto_92937 ) ) ( not ( = ?auto_92936 ?auto_92938 ) ) ( not ( = ?auto_92936 ?auto_92939 ) ) ( not ( = ?auto_92936 ?auto_92940 ) ) ( not ( = ?auto_92936 ?auto_92941 ) ) ( not ( = ?auto_92936 ?auto_92942 ) ) ( not ( = ?auto_92936 ?auto_92943 ) ) ( not ( = ?auto_92936 ?auto_92944 ) ) ( not ( = ?auto_92937 ?auto_92938 ) ) ( not ( = ?auto_92937 ?auto_92939 ) ) ( not ( = ?auto_92937 ?auto_92940 ) ) ( not ( = ?auto_92937 ?auto_92941 ) ) ( not ( = ?auto_92937 ?auto_92942 ) ) ( not ( = ?auto_92937 ?auto_92943 ) ) ( not ( = ?auto_92937 ?auto_92944 ) ) ( not ( = ?auto_92938 ?auto_92939 ) ) ( not ( = ?auto_92938 ?auto_92940 ) ) ( not ( = ?auto_92938 ?auto_92941 ) ) ( not ( = ?auto_92938 ?auto_92942 ) ) ( not ( = ?auto_92938 ?auto_92943 ) ) ( not ( = ?auto_92938 ?auto_92944 ) ) ( not ( = ?auto_92939 ?auto_92940 ) ) ( not ( = ?auto_92939 ?auto_92941 ) ) ( not ( = ?auto_92939 ?auto_92942 ) ) ( not ( = ?auto_92939 ?auto_92943 ) ) ( not ( = ?auto_92939 ?auto_92944 ) ) ( not ( = ?auto_92940 ?auto_92941 ) ) ( not ( = ?auto_92940 ?auto_92942 ) ) ( not ( = ?auto_92940 ?auto_92943 ) ) ( not ( = ?auto_92940 ?auto_92944 ) ) ( not ( = ?auto_92941 ?auto_92942 ) ) ( not ( = ?auto_92941 ?auto_92943 ) ) ( not ( = ?auto_92941 ?auto_92944 ) ) ( not ( = ?auto_92942 ?auto_92943 ) ) ( not ( = ?auto_92942 ?auto_92944 ) ) ( not ( = ?auto_92943 ?auto_92944 ) ) ( ON ?auto_92942 ?auto_92943 ) ( ON ?auto_92941 ?auto_92942 ) ( ON ?auto_92940 ?auto_92941 ) ( ON ?auto_92939 ?auto_92940 ) ( ON ?auto_92938 ?auto_92939 ) ( CLEAR ?auto_92936 ) ( ON ?auto_92937 ?auto_92938 ) ( CLEAR ?auto_92937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92935 ?auto_92936 ?auto_92937 )
      ( MAKE-9PILE ?auto_92935 ?auto_92936 ?auto_92937 ?auto_92938 ?auto_92939 ?auto_92940 ?auto_92941 ?auto_92942 ?auto_92943 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_92954 - BLOCK
      ?auto_92955 - BLOCK
      ?auto_92956 - BLOCK
      ?auto_92957 - BLOCK
      ?auto_92958 - BLOCK
      ?auto_92959 - BLOCK
      ?auto_92960 - BLOCK
      ?auto_92961 - BLOCK
      ?auto_92962 - BLOCK
    )
    :vars
    (
      ?auto_92963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92962 ?auto_92963 ) ( ON-TABLE ?auto_92954 ) ( not ( = ?auto_92954 ?auto_92955 ) ) ( not ( = ?auto_92954 ?auto_92956 ) ) ( not ( = ?auto_92954 ?auto_92957 ) ) ( not ( = ?auto_92954 ?auto_92958 ) ) ( not ( = ?auto_92954 ?auto_92959 ) ) ( not ( = ?auto_92954 ?auto_92960 ) ) ( not ( = ?auto_92954 ?auto_92961 ) ) ( not ( = ?auto_92954 ?auto_92962 ) ) ( not ( = ?auto_92954 ?auto_92963 ) ) ( not ( = ?auto_92955 ?auto_92956 ) ) ( not ( = ?auto_92955 ?auto_92957 ) ) ( not ( = ?auto_92955 ?auto_92958 ) ) ( not ( = ?auto_92955 ?auto_92959 ) ) ( not ( = ?auto_92955 ?auto_92960 ) ) ( not ( = ?auto_92955 ?auto_92961 ) ) ( not ( = ?auto_92955 ?auto_92962 ) ) ( not ( = ?auto_92955 ?auto_92963 ) ) ( not ( = ?auto_92956 ?auto_92957 ) ) ( not ( = ?auto_92956 ?auto_92958 ) ) ( not ( = ?auto_92956 ?auto_92959 ) ) ( not ( = ?auto_92956 ?auto_92960 ) ) ( not ( = ?auto_92956 ?auto_92961 ) ) ( not ( = ?auto_92956 ?auto_92962 ) ) ( not ( = ?auto_92956 ?auto_92963 ) ) ( not ( = ?auto_92957 ?auto_92958 ) ) ( not ( = ?auto_92957 ?auto_92959 ) ) ( not ( = ?auto_92957 ?auto_92960 ) ) ( not ( = ?auto_92957 ?auto_92961 ) ) ( not ( = ?auto_92957 ?auto_92962 ) ) ( not ( = ?auto_92957 ?auto_92963 ) ) ( not ( = ?auto_92958 ?auto_92959 ) ) ( not ( = ?auto_92958 ?auto_92960 ) ) ( not ( = ?auto_92958 ?auto_92961 ) ) ( not ( = ?auto_92958 ?auto_92962 ) ) ( not ( = ?auto_92958 ?auto_92963 ) ) ( not ( = ?auto_92959 ?auto_92960 ) ) ( not ( = ?auto_92959 ?auto_92961 ) ) ( not ( = ?auto_92959 ?auto_92962 ) ) ( not ( = ?auto_92959 ?auto_92963 ) ) ( not ( = ?auto_92960 ?auto_92961 ) ) ( not ( = ?auto_92960 ?auto_92962 ) ) ( not ( = ?auto_92960 ?auto_92963 ) ) ( not ( = ?auto_92961 ?auto_92962 ) ) ( not ( = ?auto_92961 ?auto_92963 ) ) ( not ( = ?auto_92962 ?auto_92963 ) ) ( ON ?auto_92961 ?auto_92962 ) ( ON ?auto_92960 ?auto_92961 ) ( ON ?auto_92959 ?auto_92960 ) ( ON ?auto_92958 ?auto_92959 ) ( ON ?auto_92957 ?auto_92958 ) ( ON ?auto_92956 ?auto_92957 ) ( CLEAR ?auto_92954 ) ( ON ?auto_92955 ?auto_92956 ) ( CLEAR ?auto_92955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92954 ?auto_92955 )
      ( MAKE-9PILE ?auto_92954 ?auto_92955 ?auto_92956 ?auto_92957 ?auto_92958 ?auto_92959 ?auto_92960 ?auto_92961 ?auto_92962 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_92973 - BLOCK
      ?auto_92974 - BLOCK
      ?auto_92975 - BLOCK
      ?auto_92976 - BLOCK
      ?auto_92977 - BLOCK
      ?auto_92978 - BLOCK
      ?auto_92979 - BLOCK
      ?auto_92980 - BLOCK
      ?auto_92981 - BLOCK
    )
    :vars
    (
      ?auto_92982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92981 ?auto_92982 ) ( ON-TABLE ?auto_92973 ) ( not ( = ?auto_92973 ?auto_92974 ) ) ( not ( = ?auto_92973 ?auto_92975 ) ) ( not ( = ?auto_92973 ?auto_92976 ) ) ( not ( = ?auto_92973 ?auto_92977 ) ) ( not ( = ?auto_92973 ?auto_92978 ) ) ( not ( = ?auto_92973 ?auto_92979 ) ) ( not ( = ?auto_92973 ?auto_92980 ) ) ( not ( = ?auto_92973 ?auto_92981 ) ) ( not ( = ?auto_92973 ?auto_92982 ) ) ( not ( = ?auto_92974 ?auto_92975 ) ) ( not ( = ?auto_92974 ?auto_92976 ) ) ( not ( = ?auto_92974 ?auto_92977 ) ) ( not ( = ?auto_92974 ?auto_92978 ) ) ( not ( = ?auto_92974 ?auto_92979 ) ) ( not ( = ?auto_92974 ?auto_92980 ) ) ( not ( = ?auto_92974 ?auto_92981 ) ) ( not ( = ?auto_92974 ?auto_92982 ) ) ( not ( = ?auto_92975 ?auto_92976 ) ) ( not ( = ?auto_92975 ?auto_92977 ) ) ( not ( = ?auto_92975 ?auto_92978 ) ) ( not ( = ?auto_92975 ?auto_92979 ) ) ( not ( = ?auto_92975 ?auto_92980 ) ) ( not ( = ?auto_92975 ?auto_92981 ) ) ( not ( = ?auto_92975 ?auto_92982 ) ) ( not ( = ?auto_92976 ?auto_92977 ) ) ( not ( = ?auto_92976 ?auto_92978 ) ) ( not ( = ?auto_92976 ?auto_92979 ) ) ( not ( = ?auto_92976 ?auto_92980 ) ) ( not ( = ?auto_92976 ?auto_92981 ) ) ( not ( = ?auto_92976 ?auto_92982 ) ) ( not ( = ?auto_92977 ?auto_92978 ) ) ( not ( = ?auto_92977 ?auto_92979 ) ) ( not ( = ?auto_92977 ?auto_92980 ) ) ( not ( = ?auto_92977 ?auto_92981 ) ) ( not ( = ?auto_92977 ?auto_92982 ) ) ( not ( = ?auto_92978 ?auto_92979 ) ) ( not ( = ?auto_92978 ?auto_92980 ) ) ( not ( = ?auto_92978 ?auto_92981 ) ) ( not ( = ?auto_92978 ?auto_92982 ) ) ( not ( = ?auto_92979 ?auto_92980 ) ) ( not ( = ?auto_92979 ?auto_92981 ) ) ( not ( = ?auto_92979 ?auto_92982 ) ) ( not ( = ?auto_92980 ?auto_92981 ) ) ( not ( = ?auto_92980 ?auto_92982 ) ) ( not ( = ?auto_92981 ?auto_92982 ) ) ( ON ?auto_92980 ?auto_92981 ) ( ON ?auto_92979 ?auto_92980 ) ( ON ?auto_92978 ?auto_92979 ) ( ON ?auto_92977 ?auto_92978 ) ( ON ?auto_92976 ?auto_92977 ) ( ON ?auto_92975 ?auto_92976 ) ( CLEAR ?auto_92973 ) ( ON ?auto_92974 ?auto_92975 ) ( CLEAR ?auto_92974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92973 ?auto_92974 )
      ( MAKE-9PILE ?auto_92973 ?auto_92974 ?auto_92975 ?auto_92976 ?auto_92977 ?auto_92978 ?auto_92979 ?auto_92980 ?auto_92981 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_92992 - BLOCK
      ?auto_92993 - BLOCK
      ?auto_92994 - BLOCK
      ?auto_92995 - BLOCK
      ?auto_92996 - BLOCK
      ?auto_92997 - BLOCK
      ?auto_92998 - BLOCK
      ?auto_92999 - BLOCK
      ?auto_93000 - BLOCK
    )
    :vars
    (
      ?auto_93001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93000 ?auto_93001 ) ( not ( = ?auto_92992 ?auto_92993 ) ) ( not ( = ?auto_92992 ?auto_92994 ) ) ( not ( = ?auto_92992 ?auto_92995 ) ) ( not ( = ?auto_92992 ?auto_92996 ) ) ( not ( = ?auto_92992 ?auto_92997 ) ) ( not ( = ?auto_92992 ?auto_92998 ) ) ( not ( = ?auto_92992 ?auto_92999 ) ) ( not ( = ?auto_92992 ?auto_93000 ) ) ( not ( = ?auto_92992 ?auto_93001 ) ) ( not ( = ?auto_92993 ?auto_92994 ) ) ( not ( = ?auto_92993 ?auto_92995 ) ) ( not ( = ?auto_92993 ?auto_92996 ) ) ( not ( = ?auto_92993 ?auto_92997 ) ) ( not ( = ?auto_92993 ?auto_92998 ) ) ( not ( = ?auto_92993 ?auto_92999 ) ) ( not ( = ?auto_92993 ?auto_93000 ) ) ( not ( = ?auto_92993 ?auto_93001 ) ) ( not ( = ?auto_92994 ?auto_92995 ) ) ( not ( = ?auto_92994 ?auto_92996 ) ) ( not ( = ?auto_92994 ?auto_92997 ) ) ( not ( = ?auto_92994 ?auto_92998 ) ) ( not ( = ?auto_92994 ?auto_92999 ) ) ( not ( = ?auto_92994 ?auto_93000 ) ) ( not ( = ?auto_92994 ?auto_93001 ) ) ( not ( = ?auto_92995 ?auto_92996 ) ) ( not ( = ?auto_92995 ?auto_92997 ) ) ( not ( = ?auto_92995 ?auto_92998 ) ) ( not ( = ?auto_92995 ?auto_92999 ) ) ( not ( = ?auto_92995 ?auto_93000 ) ) ( not ( = ?auto_92995 ?auto_93001 ) ) ( not ( = ?auto_92996 ?auto_92997 ) ) ( not ( = ?auto_92996 ?auto_92998 ) ) ( not ( = ?auto_92996 ?auto_92999 ) ) ( not ( = ?auto_92996 ?auto_93000 ) ) ( not ( = ?auto_92996 ?auto_93001 ) ) ( not ( = ?auto_92997 ?auto_92998 ) ) ( not ( = ?auto_92997 ?auto_92999 ) ) ( not ( = ?auto_92997 ?auto_93000 ) ) ( not ( = ?auto_92997 ?auto_93001 ) ) ( not ( = ?auto_92998 ?auto_92999 ) ) ( not ( = ?auto_92998 ?auto_93000 ) ) ( not ( = ?auto_92998 ?auto_93001 ) ) ( not ( = ?auto_92999 ?auto_93000 ) ) ( not ( = ?auto_92999 ?auto_93001 ) ) ( not ( = ?auto_93000 ?auto_93001 ) ) ( ON ?auto_92999 ?auto_93000 ) ( ON ?auto_92998 ?auto_92999 ) ( ON ?auto_92997 ?auto_92998 ) ( ON ?auto_92996 ?auto_92997 ) ( ON ?auto_92995 ?auto_92996 ) ( ON ?auto_92994 ?auto_92995 ) ( ON ?auto_92993 ?auto_92994 ) ( ON ?auto_92992 ?auto_92993 ) ( CLEAR ?auto_92992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92992 )
      ( MAKE-9PILE ?auto_92992 ?auto_92993 ?auto_92994 ?auto_92995 ?auto_92996 ?auto_92997 ?auto_92998 ?auto_92999 ?auto_93000 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_93011 - BLOCK
      ?auto_93012 - BLOCK
      ?auto_93013 - BLOCK
      ?auto_93014 - BLOCK
      ?auto_93015 - BLOCK
      ?auto_93016 - BLOCK
      ?auto_93017 - BLOCK
      ?auto_93018 - BLOCK
      ?auto_93019 - BLOCK
    )
    :vars
    (
      ?auto_93020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93019 ?auto_93020 ) ( not ( = ?auto_93011 ?auto_93012 ) ) ( not ( = ?auto_93011 ?auto_93013 ) ) ( not ( = ?auto_93011 ?auto_93014 ) ) ( not ( = ?auto_93011 ?auto_93015 ) ) ( not ( = ?auto_93011 ?auto_93016 ) ) ( not ( = ?auto_93011 ?auto_93017 ) ) ( not ( = ?auto_93011 ?auto_93018 ) ) ( not ( = ?auto_93011 ?auto_93019 ) ) ( not ( = ?auto_93011 ?auto_93020 ) ) ( not ( = ?auto_93012 ?auto_93013 ) ) ( not ( = ?auto_93012 ?auto_93014 ) ) ( not ( = ?auto_93012 ?auto_93015 ) ) ( not ( = ?auto_93012 ?auto_93016 ) ) ( not ( = ?auto_93012 ?auto_93017 ) ) ( not ( = ?auto_93012 ?auto_93018 ) ) ( not ( = ?auto_93012 ?auto_93019 ) ) ( not ( = ?auto_93012 ?auto_93020 ) ) ( not ( = ?auto_93013 ?auto_93014 ) ) ( not ( = ?auto_93013 ?auto_93015 ) ) ( not ( = ?auto_93013 ?auto_93016 ) ) ( not ( = ?auto_93013 ?auto_93017 ) ) ( not ( = ?auto_93013 ?auto_93018 ) ) ( not ( = ?auto_93013 ?auto_93019 ) ) ( not ( = ?auto_93013 ?auto_93020 ) ) ( not ( = ?auto_93014 ?auto_93015 ) ) ( not ( = ?auto_93014 ?auto_93016 ) ) ( not ( = ?auto_93014 ?auto_93017 ) ) ( not ( = ?auto_93014 ?auto_93018 ) ) ( not ( = ?auto_93014 ?auto_93019 ) ) ( not ( = ?auto_93014 ?auto_93020 ) ) ( not ( = ?auto_93015 ?auto_93016 ) ) ( not ( = ?auto_93015 ?auto_93017 ) ) ( not ( = ?auto_93015 ?auto_93018 ) ) ( not ( = ?auto_93015 ?auto_93019 ) ) ( not ( = ?auto_93015 ?auto_93020 ) ) ( not ( = ?auto_93016 ?auto_93017 ) ) ( not ( = ?auto_93016 ?auto_93018 ) ) ( not ( = ?auto_93016 ?auto_93019 ) ) ( not ( = ?auto_93016 ?auto_93020 ) ) ( not ( = ?auto_93017 ?auto_93018 ) ) ( not ( = ?auto_93017 ?auto_93019 ) ) ( not ( = ?auto_93017 ?auto_93020 ) ) ( not ( = ?auto_93018 ?auto_93019 ) ) ( not ( = ?auto_93018 ?auto_93020 ) ) ( not ( = ?auto_93019 ?auto_93020 ) ) ( ON ?auto_93018 ?auto_93019 ) ( ON ?auto_93017 ?auto_93018 ) ( ON ?auto_93016 ?auto_93017 ) ( ON ?auto_93015 ?auto_93016 ) ( ON ?auto_93014 ?auto_93015 ) ( ON ?auto_93013 ?auto_93014 ) ( ON ?auto_93012 ?auto_93013 ) ( ON ?auto_93011 ?auto_93012 ) ( CLEAR ?auto_93011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93011 )
      ( MAKE-9PILE ?auto_93011 ?auto_93012 ?auto_93013 ?auto_93014 ?auto_93015 ?auto_93016 ?auto_93017 ?auto_93018 ?auto_93019 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93031 - BLOCK
      ?auto_93032 - BLOCK
      ?auto_93033 - BLOCK
      ?auto_93034 - BLOCK
      ?auto_93035 - BLOCK
      ?auto_93036 - BLOCK
      ?auto_93037 - BLOCK
      ?auto_93038 - BLOCK
      ?auto_93039 - BLOCK
      ?auto_93040 - BLOCK
    )
    :vars
    (
      ?auto_93041 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93039 ) ( ON ?auto_93040 ?auto_93041 ) ( CLEAR ?auto_93040 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93031 ) ( ON ?auto_93032 ?auto_93031 ) ( ON ?auto_93033 ?auto_93032 ) ( ON ?auto_93034 ?auto_93033 ) ( ON ?auto_93035 ?auto_93034 ) ( ON ?auto_93036 ?auto_93035 ) ( ON ?auto_93037 ?auto_93036 ) ( ON ?auto_93038 ?auto_93037 ) ( ON ?auto_93039 ?auto_93038 ) ( not ( = ?auto_93031 ?auto_93032 ) ) ( not ( = ?auto_93031 ?auto_93033 ) ) ( not ( = ?auto_93031 ?auto_93034 ) ) ( not ( = ?auto_93031 ?auto_93035 ) ) ( not ( = ?auto_93031 ?auto_93036 ) ) ( not ( = ?auto_93031 ?auto_93037 ) ) ( not ( = ?auto_93031 ?auto_93038 ) ) ( not ( = ?auto_93031 ?auto_93039 ) ) ( not ( = ?auto_93031 ?auto_93040 ) ) ( not ( = ?auto_93031 ?auto_93041 ) ) ( not ( = ?auto_93032 ?auto_93033 ) ) ( not ( = ?auto_93032 ?auto_93034 ) ) ( not ( = ?auto_93032 ?auto_93035 ) ) ( not ( = ?auto_93032 ?auto_93036 ) ) ( not ( = ?auto_93032 ?auto_93037 ) ) ( not ( = ?auto_93032 ?auto_93038 ) ) ( not ( = ?auto_93032 ?auto_93039 ) ) ( not ( = ?auto_93032 ?auto_93040 ) ) ( not ( = ?auto_93032 ?auto_93041 ) ) ( not ( = ?auto_93033 ?auto_93034 ) ) ( not ( = ?auto_93033 ?auto_93035 ) ) ( not ( = ?auto_93033 ?auto_93036 ) ) ( not ( = ?auto_93033 ?auto_93037 ) ) ( not ( = ?auto_93033 ?auto_93038 ) ) ( not ( = ?auto_93033 ?auto_93039 ) ) ( not ( = ?auto_93033 ?auto_93040 ) ) ( not ( = ?auto_93033 ?auto_93041 ) ) ( not ( = ?auto_93034 ?auto_93035 ) ) ( not ( = ?auto_93034 ?auto_93036 ) ) ( not ( = ?auto_93034 ?auto_93037 ) ) ( not ( = ?auto_93034 ?auto_93038 ) ) ( not ( = ?auto_93034 ?auto_93039 ) ) ( not ( = ?auto_93034 ?auto_93040 ) ) ( not ( = ?auto_93034 ?auto_93041 ) ) ( not ( = ?auto_93035 ?auto_93036 ) ) ( not ( = ?auto_93035 ?auto_93037 ) ) ( not ( = ?auto_93035 ?auto_93038 ) ) ( not ( = ?auto_93035 ?auto_93039 ) ) ( not ( = ?auto_93035 ?auto_93040 ) ) ( not ( = ?auto_93035 ?auto_93041 ) ) ( not ( = ?auto_93036 ?auto_93037 ) ) ( not ( = ?auto_93036 ?auto_93038 ) ) ( not ( = ?auto_93036 ?auto_93039 ) ) ( not ( = ?auto_93036 ?auto_93040 ) ) ( not ( = ?auto_93036 ?auto_93041 ) ) ( not ( = ?auto_93037 ?auto_93038 ) ) ( not ( = ?auto_93037 ?auto_93039 ) ) ( not ( = ?auto_93037 ?auto_93040 ) ) ( not ( = ?auto_93037 ?auto_93041 ) ) ( not ( = ?auto_93038 ?auto_93039 ) ) ( not ( = ?auto_93038 ?auto_93040 ) ) ( not ( = ?auto_93038 ?auto_93041 ) ) ( not ( = ?auto_93039 ?auto_93040 ) ) ( not ( = ?auto_93039 ?auto_93041 ) ) ( not ( = ?auto_93040 ?auto_93041 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93040 ?auto_93041 )
      ( !STACK ?auto_93040 ?auto_93039 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93052 - BLOCK
      ?auto_93053 - BLOCK
      ?auto_93054 - BLOCK
      ?auto_93055 - BLOCK
      ?auto_93056 - BLOCK
      ?auto_93057 - BLOCK
      ?auto_93058 - BLOCK
      ?auto_93059 - BLOCK
      ?auto_93060 - BLOCK
      ?auto_93061 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93060 ) ( ON-TABLE ?auto_93061 ) ( CLEAR ?auto_93061 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93052 ) ( ON ?auto_93053 ?auto_93052 ) ( ON ?auto_93054 ?auto_93053 ) ( ON ?auto_93055 ?auto_93054 ) ( ON ?auto_93056 ?auto_93055 ) ( ON ?auto_93057 ?auto_93056 ) ( ON ?auto_93058 ?auto_93057 ) ( ON ?auto_93059 ?auto_93058 ) ( ON ?auto_93060 ?auto_93059 ) ( not ( = ?auto_93052 ?auto_93053 ) ) ( not ( = ?auto_93052 ?auto_93054 ) ) ( not ( = ?auto_93052 ?auto_93055 ) ) ( not ( = ?auto_93052 ?auto_93056 ) ) ( not ( = ?auto_93052 ?auto_93057 ) ) ( not ( = ?auto_93052 ?auto_93058 ) ) ( not ( = ?auto_93052 ?auto_93059 ) ) ( not ( = ?auto_93052 ?auto_93060 ) ) ( not ( = ?auto_93052 ?auto_93061 ) ) ( not ( = ?auto_93053 ?auto_93054 ) ) ( not ( = ?auto_93053 ?auto_93055 ) ) ( not ( = ?auto_93053 ?auto_93056 ) ) ( not ( = ?auto_93053 ?auto_93057 ) ) ( not ( = ?auto_93053 ?auto_93058 ) ) ( not ( = ?auto_93053 ?auto_93059 ) ) ( not ( = ?auto_93053 ?auto_93060 ) ) ( not ( = ?auto_93053 ?auto_93061 ) ) ( not ( = ?auto_93054 ?auto_93055 ) ) ( not ( = ?auto_93054 ?auto_93056 ) ) ( not ( = ?auto_93054 ?auto_93057 ) ) ( not ( = ?auto_93054 ?auto_93058 ) ) ( not ( = ?auto_93054 ?auto_93059 ) ) ( not ( = ?auto_93054 ?auto_93060 ) ) ( not ( = ?auto_93054 ?auto_93061 ) ) ( not ( = ?auto_93055 ?auto_93056 ) ) ( not ( = ?auto_93055 ?auto_93057 ) ) ( not ( = ?auto_93055 ?auto_93058 ) ) ( not ( = ?auto_93055 ?auto_93059 ) ) ( not ( = ?auto_93055 ?auto_93060 ) ) ( not ( = ?auto_93055 ?auto_93061 ) ) ( not ( = ?auto_93056 ?auto_93057 ) ) ( not ( = ?auto_93056 ?auto_93058 ) ) ( not ( = ?auto_93056 ?auto_93059 ) ) ( not ( = ?auto_93056 ?auto_93060 ) ) ( not ( = ?auto_93056 ?auto_93061 ) ) ( not ( = ?auto_93057 ?auto_93058 ) ) ( not ( = ?auto_93057 ?auto_93059 ) ) ( not ( = ?auto_93057 ?auto_93060 ) ) ( not ( = ?auto_93057 ?auto_93061 ) ) ( not ( = ?auto_93058 ?auto_93059 ) ) ( not ( = ?auto_93058 ?auto_93060 ) ) ( not ( = ?auto_93058 ?auto_93061 ) ) ( not ( = ?auto_93059 ?auto_93060 ) ) ( not ( = ?auto_93059 ?auto_93061 ) ) ( not ( = ?auto_93060 ?auto_93061 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_93061 )
      ( !STACK ?auto_93061 ?auto_93060 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93072 - BLOCK
      ?auto_93073 - BLOCK
      ?auto_93074 - BLOCK
      ?auto_93075 - BLOCK
      ?auto_93076 - BLOCK
      ?auto_93077 - BLOCK
      ?auto_93078 - BLOCK
      ?auto_93079 - BLOCK
      ?auto_93080 - BLOCK
      ?auto_93081 - BLOCK
    )
    :vars
    (
      ?auto_93082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93081 ?auto_93082 ) ( ON-TABLE ?auto_93072 ) ( ON ?auto_93073 ?auto_93072 ) ( ON ?auto_93074 ?auto_93073 ) ( ON ?auto_93075 ?auto_93074 ) ( ON ?auto_93076 ?auto_93075 ) ( ON ?auto_93077 ?auto_93076 ) ( ON ?auto_93078 ?auto_93077 ) ( ON ?auto_93079 ?auto_93078 ) ( not ( = ?auto_93072 ?auto_93073 ) ) ( not ( = ?auto_93072 ?auto_93074 ) ) ( not ( = ?auto_93072 ?auto_93075 ) ) ( not ( = ?auto_93072 ?auto_93076 ) ) ( not ( = ?auto_93072 ?auto_93077 ) ) ( not ( = ?auto_93072 ?auto_93078 ) ) ( not ( = ?auto_93072 ?auto_93079 ) ) ( not ( = ?auto_93072 ?auto_93080 ) ) ( not ( = ?auto_93072 ?auto_93081 ) ) ( not ( = ?auto_93072 ?auto_93082 ) ) ( not ( = ?auto_93073 ?auto_93074 ) ) ( not ( = ?auto_93073 ?auto_93075 ) ) ( not ( = ?auto_93073 ?auto_93076 ) ) ( not ( = ?auto_93073 ?auto_93077 ) ) ( not ( = ?auto_93073 ?auto_93078 ) ) ( not ( = ?auto_93073 ?auto_93079 ) ) ( not ( = ?auto_93073 ?auto_93080 ) ) ( not ( = ?auto_93073 ?auto_93081 ) ) ( not ( = ?auto_93073 ?auto_93082 ) ) ( not ( = ?auto_93074 ?auto_93075 ) ) ( not ( = ?auto_93074 ?auto_93076 ) ) ( not ( = ?auto_93074 ?auto_93077 ) ) ( not ( = ?auto_93074 ?auto_93078 ) ) ( not ( = ?auto_93074 ?auto_93079 ) ) ( not ( = ?auto_93074 ?auto_93080 ) ) ( not ( = ?auto_93074 ?auto_93081 ) ) ( not ( = ?auto_93074 ?auto_93082 ) ) ( not ( = ?auto_93075 ?auto_93076 ) ) ( not ( = ?auto_93075 ?auto_93077 ) ) ( not ( = ?auto_93075 ?auto_93078 ) ) ( not ( = ?auto_93075 ?auto_93079 ) ) ( not ( = ?auto_93075 ?auto_93080 ) ) ( not ( = ?auto_93075 ?auto_93081 ) ) ( not ( = ?auto_93075 ?auto_93082 ) ) ( not ( = ?auto_93076 ?auto_93077 ) ) ( not ( = ?auto_93076 ?auto_93078 ) ) ( not ( = ?auto_93076 ?auto_93079 ) ) ( not ( = ?auto_93076 ?auto_93080 ) ) ( not ( = ?auto_93076 ?auto_93081 ) ) ( not ( = ?auto_93076 ?auto_93082 ) ) ( not ( = ?auto_93077 ?auto_93078 ) ) ( not ( = ?auto_93077 ?auto_93079 ) ) ( not ( = ?auto_93077 ?auto_93080 ) ) ( not ( = ?auto_93077 ?auto_93081 ) ) ( not ( = ?auto_93077 ?auto_93082 ) ) ( not ( = ?auto_93078 ?auto_93079 ) ) ( not ( = ?auto_93078 ?auto_93080 ) ) ( not ( = ?auto_93078 ?auto_93081 ) ) ( not ( = ?auto_93078 ?auto_93082 ) ) ( not ( = ?auto_93079 ?auto_93080 ) ) ( not ( = ?auto_93079 ?auto_93081 ) ) ( not ( = ?auto_93079 ?auto_93082 ) ) ( not ( = ?auto_93080 ?auto_93081 ) ) ( not ( = ?auto_93080 ?auto_93082 ) ) ( not ( = ?auto_93081 ?auto_93082 ) ) ( CLEAR ?auto_93079 ) ( ON ?auto_93080 ?auto_93081 ) ( CLEAR ?auto_93080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_93072 ?auto_93073 ?auto_93074 ?auto_93075 ?auto_93076 ?auto_93077 ?auto_93078 ?auto_93079 ?auto_93080 )
      ( MAKE-10PILE ?auto_93072 ?auto_93073 ?auto_93074 ?auto_93075 ?auto_93076 ?auto_93077 ?auto_93078 ?auto_93079 ?auto_93080 ?auto_93081 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93093 - BLOCK
      ?auto_93094 - BLOCK
      ?auto_93095 - BLOCK
      ?auto_93096 - BLOCK
      ?auto_93097 - BLOCK
      ?auto_93098 - BLOCK
      ?auto_93099 - BLOCK
      ?auto_93100 - BLOCK
      ?auto_93101 - BLOCK
      ?auto_93102 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93102 ) ( ON-TABLE ?auto_93093 ) ( ON ?auto_93094 ?auto_93093 ) ( ON ?auto_93095 ?auto_93094 ) ( ON ?auto_93096 ?auto_93095 ) ( ON ?auto_93097 ?auto_93096 ) ( ON ?auto_93098 ?auto_93097 ) ( ON ?auto_93099 ?auto_93098 ) ( ON ?auto_93100 ?auto_93099 ) ( not ( = ?auto_93093 ?auto_93094 ) ) ( not ( = ?auto_93093 ?auto_93095 ) ) ( not ( = ?auto_93093 ?auto_93096 ) ) ( not ( = ?auto_93093 ?auto_93097 ) ) ( not ( = ?auto_93093 ?auto_93098 ) ) ( not ( = ?auto_93093 ?auto_93099 ) ) ( not ( = ?auto_93093 ?auto_93100 ) ) ( not ( = ?auto_93093 ?auto_93101 ) ) ( not ( = ?auto_93093 ?auto_93102 ) ) ( not ( = ?auto_93094 ?auto_93095 ) ) ( not ( = ?auto_93094 ?auto_93096 ) ) ( not ( = ?auto_93094 ?auto_93097 ) ) ( not ( = ?auto_93094 ?auto_93098 ) ) ( not ( = ?auto_93094 ?auto_93099 ) ) ( not ( = ?auto_93094 ?auto_93100 ) ) ( not ( = ?auto_93094 ?auto_93101 ) ) ( not ( = ?auto_93094 ?auto_93102 ) ) ( not ( = ?auto_93095 ?auto_93096 ) ) ( not ( = ?auto_93095 ?auto_93097 ) ) ( not ( = ?auto_93095 ?auto_93098 ) ) ( not ( = ?auto_93095 ?auto_93099 ) ) ( not ( = ?auto_93095 ?auto_93100 ) ) ( not ( = ?auto_93095 ?auto_93101 ) ) ( not ( = ?auto_93095 ?auto_93102 ) ) ( not ( = ?auto_93096 ?auto_93097 ) ) ( not ( = ?auto_93096 ?auto_93098 ) ) ( not ( = ?auto_93096 ?auto_93099 ) ) ( not ( = ?auto_93096 ?auto_93100 ) ) ( not ( = ?auto_93096 ?auto_93101 ) ) ( not ( = ?auto_93096 ?auto_93102 ) ) ( not ( = ?auto_93097 ?auto_93098 ) ) ( not ( = ?auto_93097 ?auto_93099 ) ) ( not ( = ?auto_93097 ?auto_93100 ) ) ( not ( = ?auto_93097 ?auto_93101 ) ) ( not ( = ?auto_93097 ?auto_93102 ) ) ( not ( = ?auto_93098 ?auto_93099 ) ) ( not ( = ?auto_93098 ?auto_93100 ) ) ( not ( = ?auto_93098 ?auto_93101 ) ) ( not ( = ?auto_93098 ?auto_93102 ) ) ( not ( = ?auto_93099 ?auto_93100 ) ) ( not ( = ?auto_93099 ?auto_93101 ) ) ( not ( = ?auto_93099 ?auto_93102 ) ) ( not ( = ?auto_93100 ?auto_93101 ) ) ( not ( = ?auto_93100 ?auto_93102 ) ) ( not ( = ?auto_93101 ?auto_93102 ) ) ( CLEAR ?auto_93100 ) ( ON ?auto_93101 ?auto_93102 ) ( CLEAR ?auto_93101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_93093 ?auto_93094 ?auto_93095 ?auto_93096 ?auto_93097 ?auto_93098 ?auto_93099 ?auto_93100 ?auto_93101 )
      ( MAKE-10PILE ?auto_93093 ?auto_93094 ?auto_93095 ?auto_93096 ?auto_93097 ?auto_93098 ?auto_93099 ?auto_93100 ?auto_93101 ?auto_93102 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93113 - BLOCK
      ?auto_93114 - BLOCK
      ?auto_93115 - BLOCK
      ?auto_93116 - BLOCK
      ?auto_93117 - BLOCK
      ?auto_93118 - BLOCK
      ?auto_93119 - BLOCK
      ?auto_93120 - BLOCK
      ?auto_93121 - BLOCK
      ?auto_93122 - BLOCK
    )
    :vars
    (
      ?auto_93123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93122 ?auto_93123 ) ( ON-TABLE ?auto_93113 ) ( ON ?auto_93114 ?auto_93113 ) ( ON ?auto_93115 ?auto_93114 ) ( ON ?auto_93116 ?auto_93115 ) ( ON ?auto_93117 ?auto_93116 ) ( ON ?auto_93118 ?auto_93117 ) ( ON ?auto_93119 ?auto_93118 ) ( not ( = ?auto_93113 ?auto_93114 ) ) ( not ( = ?auto_93113 ?auto_93115 ) ) ( not ( = ?auto_93113 ?auto_93116 ) ) ( not ( = ?auto_93113 ?auto_93117 ) ) ( not ( = ?auto_93113 ?auto_93118 ) ) ( not ( = ?auto_93113 ?auto_93119 ) ) ( not ( = ?auto_93113 ?auto_93120 ) ) ( not ( = ?auto_93113 ?auto_93121 ) ) ( not ( = ?auto_93113 ?auto_93122 ) ) ( not ( = ?auto_93113 ?auto_93123 ) ) ( not ( = ?auto_93114 ?auto_93115 ) ) ( not ( = ?auto_93114 ?auto_93116 ) ) ( not ( = ?auto_93114 ?auto_93117 ) ) ( not ( = ?auto_93114 ?auto_93118 ) ) ( not ( = ?auto_93114 ?auto_93119 ) ) ( not ( = ?auto_93114 ?auto_93120 ) ) ( not ( = ?auto_93114 ?auto_93121 ) ) ( not ( = ?auto_93114 ?auto_93122 ) ) ( not ( = ?auto_93114 ?auto_93123 ) ) ( not ( = ?auto_93115 ?auto_93116 ) ) ( not ( = ?auto_93115 ?auto_93117 ) ) ( not ( = ?auto_93115 ?auto_93118 ) ) ( not ( = ?auto_93115 ?auto_93119 ) ) ( not ( = ?auto_93115 ?auto_93120 ) ) ( not ( = ?auto_93115 ?auto_93121 ) ) ( not ( = ?auto_93115 ?auto_93122 ) ) ( not ( = ?auto_93115 ?auto_93123 ) ) ( not ( = ?auto_93116 ?auto_93117 ) ) ( not ( = ?auto_93116 ?auto_93118 ) ) ( not ( = ?auto_93116 ?auto_93119 ) ) ( not ( = ?auto_93116 ?auto_93120 ) ) ( not ( = ?auto_93116 ?auto_93121 ) ) ( not ( = ?auto_93116 ?auto_93122 ) ) ( not ( = ?auto_93116 ?auto_93123 ) ) ( not ( = ?auto_93117 ?auto_93118 ) ) ( not ( = ?auto_93117 ?auto_93119 ) ) ( not ( = ?auto_93117 ?auto_93120 ) ) ( not ( = ?auto_93117 ?auto_93121 ) ) ( not ( = ?auto_93117 ?auto_93122 ) ) ( not ( = ?auto_93117 ?auto_93123 ) ) ( not ( = ?auto_93118 ?auto_93119 ) ) ( not ( = ?auto_93118 ?auto_93120 ) ) ( not ( = ?auto_93118 ?auto_93121 ) ) ( not ( = ?auto_93118 ?auto_93122 ) ) ( not ( = ?auto_93118 ?auto_93123 ) ) ( not ( = ?auto_93119 ?auto_93120 ) ) ( not ( = ?auto_93119 ?auto_93121 ) ) ( not ( = ?auto_93119 ?auto_93122 ) ) ( not ( = ?auto_93119 ?auto_93123 ) ) ( not ( = ?auto_93120 ?auto_93121 ) ) ( not ( = ?auto_93120 ?auto_93122 ) ) ( not ( = ?auto_93120 ?auto_93123 ) ) ( not ( = ?auto_93121 ?auto_93122 ) ) ( not ( = ?auto_93121 ?auto_93123 ) ) ( not ( = ?auto_93122 ?auto_93123 ) ) ( ON ?auto_93121 ?auto_93122 ) ( CLEAR ?auto_93119 ) ( ON ?auto_93120 ?auto_93121 ) ( CLEAR ?auto_93120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_93113 ?auto_93114 ?auto_93115 ?auto_93116 ?auto_93117 ?auto_93118 ?auto_93119 ?auto_93120 )
      ( MAKE-10PILE ?auto_93113 ?auto_93114 ?auto_93115 ?auto_93116 ?auto_93117 ?auto_93118 ?auto_93119 ?auto_93120 ?auto_93121 ?auto_93122 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93134 - BLOCK
      ?auto_93135 - BLOCK
      ?auto_93136 - BLOCK
      ?auto_93137 - BLOCK
      ?auto_93138 - BLOCK
      ?auto_93139 - BLOCK
      ?auto_93140 - BLOCK
      ?auto_93141 - BLOCK
      ?auto_93142 - BLOCK
      ?auto_93143 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93143 ) ( ON-TABLE ?auto_93134 ) ( ON ?auto_93135 ?auto_93134 ) ( ON ?auto_93136 ?auto_93135 ) ( ON ?auto_93137 ?auto_93136 ) ( ON ?auto_93138 ?auto_93137 ) ( ON ?auto_93139 ?auto_93138 ) ( ON ?auto_93140 ?auto_93139 ) ( not ( = ?auto_93134 ?auto_93135 ) ) ( not ( = ?auto_93134 ?auto_93136 ) ) ( not ( = ?auto_93134 ?auto_93137 ) ) ( not ( = ?auto_93134 ?auto_93138 ) ) ( not ( = ?auto_93134 ?auto_93139 ) ) ( not ( = ?auto_93134 ?auto_93140 ) ) ( not ( = ?auto_93134 ?auto_93141 ) ) ( not ( = ?auto_93134 ?auto_93142 ) ) ( not ( = ?auto_93134 ?auto_93143 ) ) ( not ( = ?auto_93135 ?auto_93136 ) ) ( not ( = ?auto_93135 ?auto_93137 ) ) ( not ( = ?auto_93135 ?auto_93138 ) ) ( not ( = ?auto_93135 ?auto_93139 ) ) ( not ( = ?auto_93135 ?auto_93140 ) ) ( not ( = ?auto_93135 ?auto_93141 ) ) ( not ( = ?auto_93135 ?auto_93142 ) ) ( not ( = ?auto_93135 ?auto_93143 ) ) ( not ( = ?auto_93136 ?auto_93137 ) ) ( not ( = ?auto_93136 ?auto_93138 ) ) ( not ( = ?auto_93136 ?auto_93139 ) ) ( not ( = ?auto_93136 ?auto_93140 ) ) ( not ( = ?auto_93136 ?auto_93141 ) ) ( not ( = ?auto_93136 ?auto_93142 ) ) ( not ( = ?auto_93136 ?auto_93143 ) ) ( not ( = ?auto_93137 ?auto_93138 ) ) ( not ( = ?auto_93137 ?auto_93139 ) ) ( not ( = ?auto_93137 ?auto_93140 ) ) ( not ( = ?auto_93137 ?auto_93141 ) ) ( not ( = ?auto_93137 ?auto_93142 ) ) ( not ( = ?auto_93137 ?auto_93143 ) ) ( not ( = ?auto_93138 ?auto_93139 ) ) ( not ( = ?auto_93138 ?auto_93140 ) ) ( not ( = ?auto_93138 ?auto_93141 ) ) ( not ( = ?auto_93138 ?auto_93142 ) ) ( not ( = ?auto_93138 ?auto_93143 ) ) ( not ( = ?auto_93139 ?auto_93140 ) ) ( not ( = ?auto_93139 ?auto_93141 ) ) ( not ( = ?auto_93139 ?auto_93142 ) ) ( not ( = ?auto_93139 ?auto_93143 ) ) ( not ( = ?auto_93140 ?auto_93141 ) ) ( not ( = ?auto_93140 ?auto_93142 ) ) ( not ( = ?auto_93140 ?auto_93143 ) ) ( not ( = ?auto_93141 ?auto_93142 ) ) ( not ( = ?auto_93141 ?auto_93143 ) ) ( not ( = ?auto_93142 ?auto_93143 ) ) ( ON ?auto_93142 ?auto_93143 ) ( CLEAR ?auto_93140 ) ( ON ?auto_93141 ?auto_93142 ) ( CLEAR ?auto_93141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_93134 ?auto_93135 ?auto_93136 ?auto_93137 ?auto_93138 ?auto_93139 ?auto_93140 ?auto_93141 )
      ( MAKE-10PILE ?auto_93134 ?auto_93135 ?auto_93136 ?auto_93137 ?auto_93138 ?auto_93139 ?auto_93140 ?auto_93141 ?auto_93142 ?auto_93143 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93154 - BLOCK
      ?auto_93155 - BLOCK
      ?auto_93156 - BLOCK
      ?auto_93157 - BLOCK
      ?auto_93158 - BLOCK
      ?auto_93159 - BLOCK
      ?auto_93160 - BLOCK
      ?auto_93161 - BLOCK
      ?auto_93162 - BLOCK
      ?auto_93163 - BLOCK
    )
    :vars
    (
      ?auto_93164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93163 ?auto_93164 ) ( ON-TABLE ?auto_93154 ) ( ON ?auto_93155 ?auto_93154 ) ( ON ?auto_93156 ?auto_93155 ) ( ON ?auto_93157 ?auto_93156 ) ( ON ?auto_93158 ?auto_93157 ) ( ON ?auto_93159 ?auto_93158 ) ( not ( = ?auto_93154 ?auto_93155 ) ) ( not ( = ?auto_93154 ?auto_93156 ) ) ( not ( = ?auto_93154 ?auto_93157 ) ) ( not ( = ?auto_93154 ?auto_93158 ) ) ( not ( = ?auto_93154 ?auto_93159 ) ) ( not ( = ?auto_93154 ?auto_93160 ) ) ( not ( = ?auto_93154 ?auto_93161 ) ) ( not ( = ?auto_93154 ?auto_93162 ) ) ( not ( = ?auto_93154 ?auto_93163 ) ) ( not ( = ?auto_93154 ?auto_93164 ) ) ( not ( = ?auto_93155 ?auto_93156 ) ) ( not ( = ?auto_93155 ?auto_93157 ) ) ( not ( = ?auto_93155 ?auto_93158 ) ) ( not ( = ?auto_93155 ?auto_93159 ) ) ( not ( = ?auto_93155 ?auto_93160 ) ) ( not ( = ?auto_93155 ?auto_93161 ) ) ( not ( = ?auto_93155 ?auto_93162 ) ) ( not ( = ?auto_93155 ?auto_93163 ) ) ( not ( = ?auto_93155 ?auto_93164 ) ) ( not ( = ?auto_93156 ?auto_93157 ) ) ( not ( = ?auto_93156 ?auto_93158 ) ) ( not ( = ?auto_93156 ?auto_93159 ) ) ( not ( = ?auto_93156 ?auto_93160 ) ) ( not ( = ?auto_93156 ?auto_93161 ) ) ( not ( = ?auto_93156 ?auto_93162 ) ) ( not ( = ?auto_93156 ?auto_93163 ) ) ( not ( = ?auto_93156 ?auto_93164 ) ) ( not ( = ?auto_93157 ?auto_93158 ) ) ( not ( = ?auto_93157 ?auto_93159 ) ) ( not ( = ?auto_93157 ?auto_93160 ) ) ( not ( = ?auto_93157 ?auto_93161 ) ) ( not ( = ?auto_93157 ?auto_93162 ) ) ( not ( = ?auto_93157 ?auto_93163 ) ) ( not ( = ?auto_93157 ?auto_93164 ) ) ( not ( = ?auto_93158 ?auto_93159 ) ) ( not ( = ?auto_93158 ?auto_93160 ) ) ( not ( = ?auto_93158 ?auto_93161 ) ) ( not ( = ?auto_93158 ?auto_93162 ) ) ( not ( = ?auto_93158 ?auto_93163 ) ) ( not ( = ?auto_93158 ?auto_93164 ) ) ( not ( = ?auto_93159 ?auto_93160 ) ) ( not ( = ?auto_93159 ?auto_93161 ) ) ( not ( = ?auto_93159 ?auto_93162 ) ) ( not ( = ?auto_93159 ?auto_93163 ) ) ( not ( = ?auto_93159 ?auto_93164 ) ) ( not ( = ?auto_93160 ?auto_93161 ) ) ( not ( = ?auto_93160 ?auto_93162 ) ) ( not ( = ?auto_93160 ?auto_93163 ) ) ( not ( = ?auto_93160 ?auto_93164 ) ) ( not ( = ?auto_93161 ?auto_93162 ) ) ( not ( = ?auto_93161 ?auto_93163 ) ) ( not ( = ?auto_93161 ?auto_93164 ) ) ( not ( = ?auto_93162 ?auto_93163 ) ) ( not ( = ?auto_93162 ?auto_93164 ) ) ( not ( = ?auto_93163 ?auto_93164 ) ) ( ON ?auto_93162 ?auto_93163 ) ( ON ?auto_93161 ?auto_93162 ) ( CLEAR ?auto_93159 ) ( ON ?auto_93160 ?auto_93161 ) ( CLEAR ?auto_93160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93154 ?auto_93155 ?auto_93156 ?auto_93157 ?auto_93158 ?auto_93159 ?auto_93160 )
      ( MAKE-10PILE ?auto_93154 ?auto_93155 ?auto_93156 ?auto_93157 ?auto_93158 ?auto_93159 ?auto_93160 ?auto_93161 ?auto_93162 ?auto_93163 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93175 - BLOCK
      ?auto_93176 - BLOCK
      ?auto_93177 - BLOCK
      ?auto_93178 - BLOCK
      ?auto_93179 - BLOCK
      ?auto_93180 - BLOCK
      ?auto_93181 - BLOCK
      ?auto_93182 - BLOCK
      ?auto_93183 - BLOCK
      ?auto_93184 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93184 ) ( ON-TABLE ?auto_93175 ) ( ON ?auto_93176 ?auto_93175 ) ( ON ?auto_93177 ?auto_93176 ) ( ON ?auto_93178 ?auto_93177 ) ( ON ?auto_93179 ?auto_93178 ) ( ON ?auto_93180 ?auto_93179 ) ( not ( = ?auto_93175 ?auto_93176 ) ) ( not ( = ?auto_93175 ?auto_93177 ) ) ( not ( = ?auto_93175 ?auto_93178 ) ) ( not ( = ?auto_93175 ?auto_93179 ) ) ( not ( = ?auto_93175 ?auto_93180 ) ) ( not ( = ?auto_93175 ?auto_93181 ) ) ( not ( = ?auto_93175 ?auto_93182 ) ) ( not ( = ?auto_93175 ?auto_93183 ) ) ( not ( = ?auto_93175 ?auto_93184 ) ) ( not ( = ?auto_93176 ?auto_93177 ) ) ( not ( = ?auto_93176 ?auto_93178 ) ) ( not ( = ?auto_93176 ?auto_93179 ) ) ( not ( = ?auto_93176 ?auto_93180 ) ) ( not ( = ?auto_93176 ?auto_93181 ) ) ( not ( = ?auto_93176 ?auto_93182 ) ) ( not ( = ?auto_93176 ?auto_93183 ) ) ( not ( = ?auto_93176 ?auto_93184 ) ) ( not ( = ?auto_93177 ?auto_93178 ) ) ( not ( = ?auto_93177 ?auto_93179 ) ) ( not ( = ?auto_93177 ?auto_93180 ) ) ( not ( = ?auto_93177 ?auto_93181 ) ) ( not ( = ?auto_93177 ?auto_93182 ) ) ( not ( = ?auto_93177 ?auto_93183 ) ) ( not ( = ?auto_93177 ?auto_93184 ) ) ( not ( = ?auto_93178 ?auto_93179 ) ) ( not ( = ?auto_93178 ?auto_93180 ) ) ( not ( = ?auto_93178 ?auto_93181 ) ) ( not ( = ?auto_93178 ?auto_93182 ) ) ( not ( = ?auto_93178 ?auto_93183 ) ) ( not ( = ?auto_93178 ?auto_93184 ) ) ( not ( = ?auto_93179 ?auto_93180 ) ) ( not ( = ?auto_93179 ?auto_93181 ) ) ( not ( = ?auto_93179 ?auto_93182 ) ) ( not ( = ?auto_93179 ?auto_93183 ) ) ( not ( = ?auto_93179 ?auto_93184 ) ) ( not ( = ?auto_93180 ?auto_93181 ) ) ( not ( = ?auto_93180 ?auto_93182 ) ) ( not ( = ?auto_93180 ?auto_93183 ) ) ( not ( = ?auto_93180 ?auto_93184 ) ) ( not ( = ?auto_93181 ?auto_93182 ) ) ( not ( = ?auto_93181 ?auto_93183 ) ) ( not ( = ?auto_93181 ?auto_93184 ) ) ( not ( = ?auto_93182 ?auto_93183 ) ) ( not ( = ?auto_93182 ?auto_93184 ) ) ( not ( = ?auto_93183 ?auto_93184 ) ) ( ON ?auto_93183 ?auto_93184 ) ( ON ?auto_93182 ?auto_93183 ) ( CLEAR ?auto_93180 ) ( ON ?auto_93181 ?auto_93182 ) ( CLEAR ?auto_93181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93175 ?auto_93176 ?auto_93177 ?auto_93178 ?auto_93179 ?auto_93180 ?auto_93181 )
      ( MAKE-10PILE ?auto_93175 ?auto_93176 ?auto_93177 ?auto_93178 ?auto_93179 ?auto_93180 ?auto_93181 ?auto_93182 ?auto_93183 ?auto_93184 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93195 - BLOCK
      ?auto_93196 - BLOCK
      ?auto_93197 - BLOCK
      ?auto_93198 - BLOCK
      ?auto_93199 - BLOCK
      ?auto_93200 - BLOCK
      ?auto_93201 - BLOCK
      ?auto_93202 - BLOCK
      ?auto_93203 - BLOCK
      ?auto_93204 - BLOCK
    )
    :vars
    (
      ?auto_93205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93204 ?auto_93205 ) ( ON-TABLE ?auto_93195 ) ( ON ?auto_93196 ?auto_93195 ) ( ON ?auto_93197 ?auto_93196 ) ( ON ?auto_93198 ?auto_93197 ) ( ON ?auto_93199 ?auto_93198 ) ( not ( = ?auto_93195 ?auto_93196 ) ) ( not ( = ?auto_93195 ?auto_93197 ) ) ( not ( = ?auto_93195 ?auto_93198 ) ) ( not ( = ?auto_93195 ?auto_93199 ) ) ( not ( = ?auto_93195 ?auto_93200 ) ) ( not ( = ?auto_93195 ?auto_93201 ) ) ( not ( = ?auto_93195 ?auto_93202 ) ) ( not ( = ?auto_93195 ?auto_93203 ) ) ( not ( = ?auto_93195 ?auto_93204 ) ) ( not ( = ?auto_93195 ?auto_93205 ) ) ( not ( = ?auto_93196 ?auto_93197 ) ) ( not ( = ?auto_93196 ?auto_93198 ) ) ( not ( = ?auto_93196 ?auto_93199 ) ) ( not ( = ?auto_93196 ?auto_93200 ) ) ( not ( = ?auto_93196 ?auto_93201 ) ) ( not ( = ?auto_93196 ?auto_93202 ) ) ( not ( = ?auto_93196 ?auto_93203 ) ) ( not ( = ?auto_93196 ?auto_93204 ) ) ( not ( = ?auto_93196 ?auto_93205 ) ) ( not ( = ?auto_93197 ?auto_93198 ) ) ( not ( = ?auto_93197 ?auto_93199 ) ) ( not ( = ?auto_93197 ?auto_93200 ) ) ( not ( = ?auto_93197 ?auto_93201 ) ) ( not ( = ?auto_93197 ?auto_93202 ) ) ( not ( = ?auto_93197 ?auto_93203 ) ) ( not ( = ?auto_93197 ?auto_93204 ) ) ( not ( = ?auto_93197 ?auto_93205 ) ) ( not ( = ?auto_93198 ?auto_93199 ) ) ( not ( = ?auto_93198 ?auto_93200 ) ) ( not ( = ?auto_93198 ?auto_93201 ) ) ( not ( = ?auto_93198 ?auto_93202 ) ) ( not ( = ?auto_93198 ?auto_93203 ) ) ( not ( = ?auto_93198 ?auto_93204 ) ) ( not ( = ?auto_93198 ?auto_93205 ) ) ( not ( = ?auto_93199 ?auto_93200 ) ) ( not ( = ?auto_93199 ?auto_93201 ) ) ( not ( = ?auto_93199 ?auto_93202 ) ) ( not ( = ?auto_93199 ?auto_93203 ) ) ( not ( = ?auto_93199 ?auto_93204 ) ) ( not ( = ?auto_93199 ?auto_93205 ) ) ( not ( = ?auto_93200 ?auto_93201 ) ) ( not ( = ?auto_93200 ?auto_93202 ) ) ( not ( = ?auto_93200 ?auto_93203 ) ) ( not ( = ?auto_93200 ?auto_93204 ) ) ( not ( = ?auto_93200 ?auto_93205 ) ) ( not ( = ?auto_93201 ?auto_93202 ) ) ( not ( = ?auto_93201 ?auto_93203 ) ) ( not ( = ?auto_93201 ?auto_93204 ) ) ( not ( = ?auto_93201 ?auto_93205 ) ) ( not ( = ?auto_93202 ?auto_93203 ) ) ( not ( = ?auto_93202 ?auto_93204 ) ) ( not ( = ?auto_93202 ?auto_93205 ) ) ( not ( = ?auto_93203 ?auto_93204 ) ) ( not ( = ?auto_93203 ?auto_93205 ) ) ( not ( = ?auto_93204 ?auto_93205 ) ) ( ON ?auto_93203 ?auto_93204 ) ( ON ?auto_93202 ?auto_93203 ) ( ON ?auto_93201 ?auto_93202 ) ( CLEAR ?auto_93199 ) ( ON ?auto_93200 ?auto_93201 ) ( CLEAR ?auto_93200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93195 ?auto_93196 ?auto_93197 ?auto_93198 ?auto_93199 ?auto_93200 )
      ( MAKE-10PILE ?auto_93195 ?auto_93196 ?auto_93197 ?auto_93198 ?auto_93199 ?auto_93200 ?auto_93201 ?auto_93202 ?auto_93203 ?auto_93204 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93216 - BLOCK
      ?auto_93217 - BLOCK
      ?auto_93218 - BLOCK
      ?auto_93219 - BLOCK
      ?auto_93220 - BLOCK
      ?auto_93221 - BLOCK
      ?auto_93222 - BLOCK
      ?auto_93223 - BLOCK
      ?auto_93224 - BLOCK
      ?auto_93225 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93225 ) ( ON-TABLE ?auto_93216 ) ( ON ?auto_93217 ?auto_93216 ) ( ON ?auto_93218 ?auto_93217 ) ( ON ?auto_93219 ?auto_93218 ) ( ON ?auto_93220 ?auto_93219 ) ( not ( = ?auto_93216 ?auto_93217 ) ) ( not ( = ?auto_93216 ?auto_93218 ) ) ( not ( = ?auto_93216 ?auto_93219 ) ) ( not ( = ?auto_93216 ?auto_93220 ) ) ( not ( = ?auto_93216 ?auto_93221 ) ) ( not ( = ?auto_93216 ?auto_93222 ) ) ( not ( = ?auto_93216 ?auto_93223 ) ) ( not ( = ?auto_93216 ?auto_93224 ) ) ( not ( = ?auto_93216 ?auto_93225 ) ) ( not ( = ?auto_93217 ?auto_93218 ) ) ( not ( = ?auto_93217 ?auto_93219 ) ) ( not ( = ?auto_93217 ?auto_93220 ) ) ( not ( = ?auto_93217 ?auto_93221 ) ) ( not ( = ?auto_93217 ?auto_93222 ) ) ( not ( = ?auto_93217 ?auto_93223 ) ) ( not ( = ?auto_93217 ?auto_93224 ) ) ( not ( = ?auto_93217 ?auto_93225 ) ) ( not ( = ?auto_93218 ?auto_93219 ) ) ( not ( = ?auto_93218 ?auto_93220 ) ) ( not ( = ?auto_93218 ?auto_93221 ) ) ( not ( = ?auto_93218 ?auto_93222 ) ) ( not ( = ?auto_93218 ?auto_93223 ) ) ( not ( = ?auto_93218 ?auto_93224 ) ) ( not ( = ?auto_93218 ?auto_93225 ) ) ( not ( = ?auto_93219 ?auto_93220 ) ) ( not ( = ?auto_93219 ?auto_93221 ) ) ( not ( = ?auto_93219 ?auto_93222 ) ) ( not ( = ?auto_93219 ?auto_93223 ) ) ( not ( = ?auto_93219 ?auto_93224 ) ) ( not ( = ?auto_93219 ?auto_93225 ) ) ( not ( = ?auto_93220 ?auto_93221 ) ) ( not ( = ?auto_93220 ?auto_93222 ) ) ( not ( = ?auto_93220 ?auto_93223 ) ) ( not ( = ?auto_93220 ?auto_93224 ) ) ( not ( = ?auto_93220 ?auto_93225 ) ) ( not ( = ?auto_93221 ?auto_93222 ) ) ( not ( = ?auto_93221 ?auto_93223 ) ) ( not ( = ?auto_93221 ?auto_93224 ) ) ( not ( = ?auto_93221 ?auto_93225 ) ) ( not ( = ?auto_93222 ?auto_93223 ) ) ( not ( = ?auto_93222 ?auto_93224 ) ) ( not ( = ?auto_93222 ?auto_93225 ) ) ( not ( = ?auto_93223 ?auto_93224 ) ) ( not ( = ?auto_93223 ?auto_93225 ) ) ( not ( = ?auto_93224 ?auto_93225 ) ) ( ON ?auto_93224 ?auto_93225 ) ( ON ?auto_93223 ?auto_93224 ) ( ON ?auto_93222 ?auto_93223 ) ( CLEAR ?auto_93220 ) ( ON ?auto_93221 ?auto_93222 ) ( CLEAR ?auto_93221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93216 ?auto_93217 ?auto_93218 ?auto_93219 ?auto_93220 ?auto_93221 )
      ( MAKE-10PILE ?auto_93216 ?auto_93217 ?auto_93218 ?auto_93219 ?auto_93220 ?auto_93221 ?auto_93222 ?auto_93223 ?auto_93224 ?auto_93225 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93236 - BLOCK
      ?auto_93237 - BLOCK
      ?auto_93238 - BLOCK
      ?auto_93239 - BLOCK
      ?auto_93240 - BLOCK
      ?auto_93241 - BLOCK
      ?auto_93242 - BLOCK
      ?auto_93243 - BLOCK
      ?auto_93244 - BLOCK
      ?auto_93245 - BLOCK
    )
    :vars
    (
      ?auto_93246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93245 ?auto_93246 ) ( ON-TABLE ?auto_93236 ) ( ON ?auto_93237 ?auto_93236 ) ( ON ?auto_93238 ?auto_93237 ) ( ON ?auto_93239 ?auto_93238 ) ( not ( = ?auto_93236 ?auto_93237 ) ) ( not ( = ?auto_93236 ?auto_93238 ) ) ( not ( = ?auto_93236 ?auto_93239 ) ) ( not ( = ?auto_93236 ?auto_93240 ) ) ( not ( = ?auto_93236 ?auto_93241 ) ) ( not ( = ?auto_93236 ?auto_93242 ) ) ( not ( = ?auto_93236 ?auto_93243 ) ) ( not ( = ?auto_93236 ?auto_93244 ) ) ( not ( = ?auto_93236 ?auto_93245 ) ) ( not ( = ?auto_93236 ?auto_93246 ) ) ( not ( = ?auto_93237 ?auto_93238 ) ) ( not ( = ?auto_93237 ?auto_93239 ) ) ( not ( = ?auto_93237 ?auto_93240 ) ) ( not ( = ?auto_93237 ?auto_93241 ) ) ( not ( = ?auto_93237 ?auto_93242 ) ) ( not ( = ?auto_93237 ?auto_93243 ) ) ( not ( = ?auto_93237 ?auto_93244 ) ) ( not ( = ?auto_93237 ?auto_93245 ) ) ( not ( = ?auto_93237 ?auto_93246 ) ) ( not ( = ?auto_93238 ?auto_93239 ) ) ( not ( = ?auto_93238 ?auto_93240 ) ) ( not ( = ?auto_93238 ?auto_93241 ) ) ( not ( = ?auto_93238 ?auto_93242 ) ) ( not ( = ?auto_93238 ?auto_93243 ) ) ( not ( = ?auto_93238 ?auto_93244 ) ) ( not ( = ?auto_93238 ?auto_93245 ) ) ( not ( = ?auto_93238 ?auto_93246 ) ) ( not ( = ?auto_93239 ?auto_93240 ) ) ( not ( = ?auto_93239 ?auto_93241 ) ) ( not ( = ?auto_93239 ?auto_93242 ) ) ( not ( = ?auto_93239 ?auto_93243 ) ) ( not ( = ?auto_93239 ?auto_93244 ) ) ( not ( = ?auto_93239 ?auto_93245 ) ) ( not ( = ?auto_93239 ?auto_93246 ) ) ( not ( = ?auto_93240 ?auto_93241 ) ) ( not ( = ?auto_93240 ?auto_93242 ) ) ( not ( = ?auto_93240 ?auto_93243 ) ) ( not ( = ?auto_93240 ?auto_93244 ) ) ( not ( = ?auto_93240 ?auto_93245 ) ) ( not ( = ?auto_93240 ?auto_93246 ) ) ( not ( = ?auto_93241 ?auto_93242 ) ) ( not ( = ?auto_93241 ?auto_93243 ) ) ( not ( = ?auto_93241 ?auto_93244 ) ) ( not ( = ?auto_93241 ?auto_93245 ) ) ( not ( = ?auto_93241 ?auto_93246 ) ) ( not ( = ?auto_93242 ?auto_93243 ) ) ( not ( = ?auto_93242 ?auto_93244 ) ) ( not ( = ?auto_93242 ?auto_93245 ) ) ( not ( = ?auto_93242 ?auto_93246 ) ) ( not ( = ?auto_93243 ?auto_93244 ) ) ( not ( = ?auto_93243 ?auto_93245 ) ) ( not ( = ?auto_93243 ?auto_93246 ) ) ( not ( = ?auto_93244 ?auto_93245 ) ) ( not ( = ?auto_93244 ?auto_93246 ) ) ( not ( = ?auto_93245 ?auto_93246 ) ) ( ON ?auto_93244 ?auto_93245 ) ( ON ?auto_93243 ?auto_93244 ) ( ON ?auto_93242 ?auto_93243 ) ( ON ?auto_93241 ?auto_93242 ) ( CLEAR ?auto_93239 ) ( ON ?auto_93240 ?auto_93241 ) ( CLEAR ?auto_93240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93236 ?auto_93237 ?auto_93238 ?auto_93239 ?auto_93240 )
      ( MAKE-10PILE ?auto_93236 ?auto_93237 ?auto_93238 ?auto_93239 ?auto_93240 ?auto_93241 ?auto_93242 ?auto_93243 ?auto_93244 ?auto_93245 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93257 - BLOCK
      ?auto_93258 - BLOCK
      ?auto_93259 - BLOCK
      ?auto_93260 - BLOCK
      ?auto_93261 - BLOCK
      ?auto_93262 - BLOCK
      ?auto_93263 - BLOCK
      ?auto_93264 - BLOCK
      ?auto_93265 - BLOCK
      ?auto_93266 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93266 ) ( ON-TABLE ?auto_93257 ) ( ON ?auto_93258 ?auto_93257 ) ( ON ?auto_93259 ?auto_93258 ) ( ON ?auto_93260 ?auto_93259 ) ( not ( = ?auto_93257 ?auto_93258 ) ) ( not ( = ?auto_93257 ?auto_93259 ) ) ( not ( = ?auto_93257 ?auto_93260 ) ) ( not ( = ?auto_93257 ?auto_93261 ) ) ( not ( = ?auto_93257 ?auto_93262 ) ) ( not ( = ?auto_93257 ?auto_93263 ) ) ( not ( = ?auto_93257 ?auto_93264 ) ) ( not ( = ?auto_93257 ?auto_93265 ) ) ( not ( = ?auto_93257 ?auto_93266 ) ) ( not ( = ?auto_93258 ?auto_93259 ) ) ( not ( = ?auto_93258 ?auto_93260 ) ) ( not ( = ?auto_93258 ?auto_93261 ) ) ( not ( = ?auto_93258 ?auto_93262 ) ) ( not ( = ?auto_93258 ?auto_93263 ) ) ( not ( = ?auto_93258 ?auto_93264 ) ) ( not ( = ?auto_93258 ?auto_93265 ) ) ( not ( = ?auto_93258 ?auto_93266 ) ) ( not ( = ?auto_93259 ?auto_93260 ) ) ( not ( = ?auto_93259 ?auto_93261 ) ) ( not ( = ?auto_93259 ?auto_93262 ) ) ( not ( = ?auto_93259 ?auto_93263 ) ) ( not ( = ?auto_93259 ?auto_93264 ) ) ( not ( = ?auto_93259 ?auto_93265 ) ) ( not ( = ?auto_93259 ?auto_93266 ) ) ( not ( = ?auto_93260 ?auto_93261 ) ) ( not ( = ?auto_93260 ?auto_93262 ) ) ( not ( = ?auto_93260 ?auto_93263 ) ) ( not ( = ?auto_93260 ?auto_93264 ) ) ( not ( = ?auto_93260 ?auto_93265 ) ) ( not ( = ?auto_93260 ?auto_93266 ) ) ( not ( = ?auto_93261 ?auto_93262 ) ) ( not ( = ?auto_93261 ?auto_93263 ) ) ( not ( = ?auto_93261 ?auto_93264 ) ) ( not ( = ?auto_93261 ?auto_93265 ) ) ( not ( = ?auto_93261 ?auto_93266 ) ) ( not ( = ?auto_93262 ?auto_93263 ) ) ( not ( = ?auto_93262 ?auto_93264 ) ) ( not ( = ?auto_93262 ?auto_93265 ) ) ( not ( = ?auto_93262 ?auto_93266 ) ) ( not ( = ?auto_93263 ?auto_93264 ) ) ( not ( = ?auto_93263 ?auto_93265 ) ) ( not ( = ?auto_93263 ?auto_93266 ) ) ( not ( = ?auto_93264 ?auto_93265 ) ) ( not ( = ?auto_93264 ?auto_93266 ) ) ( not ( = ?auto_93265 ?auto_93266 ) ) ( ON ?auto_93265 ?auto_93266 ) ( ON ?auto_93264 ?auto_93265 ) ( ON ?auto_93263 ?auto_93264 ) ( ON ?auto_93262 ?auto_93263 ) ( CLEAR ?auto_93260 ) ( ON ?auto_93261 ?auto_93262 ) ( CLEAR ?auto_93261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93257 ?auto_93258 ?auto_93259 ?auto_93260 ?auto_93261 )
      ( MAKE-10PILE ?auto_93257 ?auto_93258 ?auto_93259 ?auto_93260 ?auto_93261 ?auto_93262 ?auto_93263 ?auto_93264 ?auto_93265 ?auto_93266 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93277 - BLOCK
      ?auto_93278 - BLOCK
      ?auto_93279 - BLOCK
      ?auto_93280 - BLOCK
      ?auto_93281 - BLOCK
      ?auto_93282 - BLOCK
      ?auto_93283 - BLOCK
      ?auto_93284 - BLOCK
      ?auto_93285 - BLOCK
      ?auto_93286 - BLOCK
    )
    :vars
    (
      ?auto_93287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93286 ?auto_93287 ) ( ON-TABLE ?auto_93277 ) ( ON ?auto_93278 ?auto_93277 ) ( ON ?auto_93279 ?auto_93278 ) ( not ( = ?auto_93277 ?auto_93278 ) ) ( not ( = ?auto_93277 ?auto_93279 ) ) ( not ( = ?auto_93277 ?auto_93280 ) ) ( not ( = ?auto_93277 ?auto_93281 ) ) ( not ( = ?auto_93277 ?auto_93282 ) ) ( not ( = ?auto_93277 ?auto_93283 ) ) ( not ( = ?auto_93277 ?auto_93284 ) ) ( not ( = ?auto_93277 ?auto_93285 ) ) ( not ( = ?auto_93277 ?auto_93286 ) ) ( not ( = ?auto_93277 ?auto_93287 ) ) ( not ( = ?auto_93278 ?auto_93279 ) ) ( not ( = ?auto_93278 ?auto_93280 ) ) ( not ( = ?auto_93278 ?auto_93281 ) ) ( not ( = ?auto_93278 ?auto_93282 ) ) ( not ( = ?auto_93278 ?auto_93283 ) ) ( not ( = ?auto_93278 ?auto_93284 ) ) ( not ( = ?auto_93278 ?auto_93285 ) ) ( not ( = ?auto_93278 ?auto_93286 ) ) ( not ( = ?auto_93278 ?auto_93287 ) ) ( not ( = ?auto_93279 ?auto_93280 ) ) ( not ( = ?auto_93279 ?auto_93281 ) ) ( not ( = ?auto_93279 ?auto_93282 ) ) ( not ( = ?auto_93279 ?auto_93283 ) ) ( not ( = ?auto_93279 ?auto_93284 ) ) ( not ( = ?auto_93279 ?auto_93285 ) ) ( not ( = ?auto_93279 ?auto_93286 ) ) ( not ( = ?auto_93279 ?auto_93287 ) ) ( not ( = ?auto_93280 ?auto_93281 ) ) ( not ( = ?auto_93280 ?auto_93282 ) ) ( not ( = ?auto_93280 ?auto_93283 ) ) ( not ( = ?auto_93280 ?auto_93284 ) ) ( not ( = ?auto_93280 ?auto_93285 ) ) ( not ( = ?auto_93280 ?auto_93286 ) ) ( not ( = ?auto_93280 ?auto_93287 ) ) ( not ( = ?auto_93281 ?auto_93282 ) ) ( not ( = ?auto_93281 ?auto_93283 ) ) ( not ( = ?auto_93281 ?auto_93284 ) ) ( not ( = ?auto_93281 ?auto_93285 ) ) ( not ( = ?auto_93281 ?auto_93286 ) ) ( not ( = ?auto_93281 ?auto_93287 ) ) ( not ( = ?auto_93282 ?auto_93283 ) ) ( not ( = ?auto_93282 ?auto_93284 ) ) ( not ( = ?auto_93282 ?auto_93285 ) ) ( not ( = ?auto_93282 ?auto_93286 ) ) ( not ( = ?auto_93282 ?auto_93287 ) ) ( not ( = ?auto_93283 ?auto_93284 ) ) ( not ( = ?auto_93283 ?auto_93285 ) ) ( not ( = ?auto_93283 ?auto_93286 ) ) ( not ( = ?auto_93283 ?auto_93287 ) ) ( not ( = ?auto_93284 ?auto_93285 ) ) ( not ( = ?auto_93284 ?auto_93286 ) ) ( not ( = ?auto_93284 ?auto_93287 ) ) ( not ( = ?auto_93285 ?auto_93286 ) ) ( not ( = ?auto_93285 ?auto_93287 ) ) ( not ( = ?auto_93286 ?auto_93287 ) ) ( ON ?auto_93285 ?auto_93286 ) ( ON ?auto_93284 ?auto_93285 ) ( ON ?auto_93283 ?auto_93284 ) ( ON ?auto_93282 ?auto_93283 ) ( ON ?auto_93281 ?auto_93282 ) ( CLEAR ?auto_93279 ) ( ON ?auto_93280 ?auto_93281 ) ( CLEAR ?auto_93280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93277 ?auto_93278 ?auto_93279 ?auto_93280 )
      ( MAKE-10PILE ?auto_93277 ?auto_93278 ?auto_93279 ?auto_93280 ?auto_93281 ?auto_93282 ?auto_93283 ?auto_93284 ?auto_93285 ?auto_93286 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93298 - BLOCK
      ?auto_93299 - BLOCK
      ?auto_93300 - BLOCK
      ?auto_93301 - BLOCK
      ?auto_93302 - BLOCK
      ?auto_93303 - BLOCK
      ?auto_93304 - BLOCK
      ?auto_93305 - BLOCK
      ?auto_93306 - BLOCK
      ?auto_93307 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93307 ) ( ON-TABLE ?auto_93298 ) ( ON ?auto_93299 ?auto_93298 ) ( ON ?auto_93300 ?auto_93299 ) ( not ( = ?auto_93298 ?auto_93299 ) ) ( not ( = ?auto_93298 ?auto_93300 ) ) ( not ( = ?auto_93298 ?auto_93301 ) ) ( not ( = ?auto_93298 ?auto_93302 ) ) ( not ( = ?auto_93298 ?auto_93303 ) ) ( not ( = ?auto_93298 ?auto_93304 ) ) ( not ( = ?auto_93298 ?auto_93305 ) ) ( not ( = ?auto_93298 ?auto_93306 ) ) ( not ( = ?auto_93298 ?auto_93307 ) ) ( not ( = ?auto_93299 ?auto_93300 ) ) ( not ( = ?auto_93299 ?auto_93301 ) ) ( not ( = ?auto_93299 ?auto_93302 ) ) ( not ( = ?auto_93299 ?auto_93303 ) ) ( not ( = ?auto_93299 ?auto_93304 ) ) ( not ( = ?auto_93299 ?auto_93305 ) ) ( not ( = ?auto_93299 ?auto_93306 ) ) ( not ( = ?auto_93299 ?auto_93307 ) ) ( not ( = ?auto_93300 ?auto_93301 ) ) ( not ( = ?auto_93300 ?auto_93302 ) ) ( not ( = ?auto_93300 ?auto_93303 ) ) ( not ( = ?auto_93300 ?auto_93304 ) ) ( not ( = ?auto_93300 ?auto_93305 ) ) ( not ( = ?auto_93300 ?auto_93306 ) ) ( not ( = ?auto_93300 ?auto_93307 ) ) ( not ( = ?auto_93301 ?auto_93302 ) ) ( not ( = ?auto_93301 ?auto_93303 ) ) ( not ( = ?auto_93301 ?auto_93304 ) ) ( not ( = ?auto_93301 ?auto_93305 ) ) ( not ( = ?auto_93301 ?auto_93306 ) ) ( not ( = ?auto_93301 ?auto_93307 ) ) ( not ( = ?auto_93302 ?auto_93303 ) ) ( not ( = ?auto_93302 ?auto_93304 ) ) ( not ( = ?auto_93302 ?auto_93305 ) ) ( not ( = ?auto_93302 ?auto_93306 ) ) ( not ( = ?auto_93302 ?auto_93307 ) ) ( not ( = ?auto_93303 ?auto_93304 ) ) ( not ( = ?auto_93303 ?auto_93305 ) ) ( not ( = ?auto_93303 ?auto_93306 ) ) ( not ( = ?auto_93303 ?auto_93307 ) ) ( not ( = ?auto_93304 ?auto_93305 ) ) ( not ( = ?auto_93304 ?auto_93306 ) ) ( not ( = ?auto_93304 ?auto_93307 ) ) ( not ( = ?auto_93305 ?auto_93306 ) ) ( not ( = ?auto_93305 ?auto_93307 ) ) ( not ( = ?auto_93306 ?auto_93307 ) ) ( ON ?auto_93306 ?auto_93307 ) ( ON ?auto_93305 ?auto_93306 ) ( ON ?auto_93304 ?auto_93305 ) ( ON ?auto_93303 ?auto_93304 ) ( ON ?auto_93302 ?auto_93303 ) ( CLEAR ?auto_93300 ) ( ON ?auto_93301 ?auto_93302 ) ( CLEAR ?auto_93301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93298 ?auto_93299 ?auto_93300 ?auto_93301 )
      ( MAKE-10PILE ?auto_93298 ?auto_93299 ?auto_93300 ?auto_93301 ?auto_93302 ?auto_93303 ?auto_93304 ?auto_93305 ?auto_93306 ?auto_93307 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93318 - BLOCK
      ?auto_93319 - BLOCK
      ?auto_93320 - BLOCK
      ?auto_93321 - BLOCK
      ?auto_93322 - BLOCK
      ?auto_93323 - BLOCK
      ?auto_93324 - BLOCK
      ?auto_93325 - BLOCK
      ?auto_93326 - BLOCK
      ?auto_93327 - BLOCK
    )
    :vars
    (
      ?auto_93328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93327 ?auto_93328 ) ( ON-TABLE ?auto_93318 ) ( ON ?auto_93319 ?auto_93318 ) ( not ( = ?auto_93318 ?auto_93319 ) ) ( not ( = ?auto_93318 ?auto_93320 ) ) ( not ( = ?auto_93318 ?auto_93321 ) ) ( not ( = ?auto_93318 ?auto_93322 ) ) ( not ( = ?auto_93318 ?auto_93323 ) ) ( not ( = ?auto_93318 ?auto_93324 ) ) ( not ( = ?auto_93318 ?auto_93325 ) ) ( not ( = ?auto_93318 ?auto_93326 ) ) ( not ( = ?auto_93318 ?auto_93327 ) ) ( not ( = ?auto_93318 ?auto_93328 ) ) ( not ( = ?auto_93319 ?auto_93320 ) ) ( not ( = ?auto_93319 ?auto_93321 ) ) ( not ( = ?auto_93319 ?auto_93322 ) ) ( not ( = ?auto_93319 ?auto_93323 ) ) ( not ( = ?auto_93319 ?auto_93324 ) ) ( not ( = ?auto_93319 ?auto_93325 ) ) ( not ( = ?auto_93319 ?auto_93326 ) ) ( not ( = ?auto_93319 ?auto_93327 ) ) ( not ( = ?auto_93319 ?auto_93328 ) ) ( not ( = ?auto_93320 ?auto_93321 ) ) ( not ( = ?auto_93320 ?auto_93322 ) ) ( not ( = ?auto_93320 ?auto_93323 ) ) ( not ( = ?auto_93320 ?auto_93324 ) ) ( not ( = ?auto_93320 ?auto_93325 ) ) ( not ( = ?auto_93320 ?auto_93326 ) ) ( not ( = ?auto_93320 ?auto_93327 ) ) ( not ( = ?auto_93320 ?auto_93328 ) ) ( not ( = ?auto_93321 ?auto_93322 ) ) ( not ( = ?auto_93321 ?auto_93323 ) ) ( not ( = ?auto_93321 ?auto_93324 ) ) ( not ( = ?auto_93321 ?auto_93325 ) ) ( not ( = ?auto_93321 ?auto_93326 ) ) ( not ( = ?auto_93321 ?auto_93327 ) ) ( not ( = ?auto_93321 ?auto_93328 ) ) ( not ( = ?auto_93322 ?auto_93323 ) ) ( not ( = ?auto_93322 ?auto_93324 ) ) ( not ( = ?auto_93322 ?auto_93325 ) ) ( not ( = ?auto_93322 ?auto_93326 ) ) ( not ( = ?auto_93322 ?auto_93327 ) ) ( not ( = ?auto_93322 ?auto_93328 ) ) ( not ( = ?auto_93323 ?auto_93324 ) ) ( not ( = ?auto_93323 ?auto_93325 ) ) ( not ( = ?auto_93323 ?auto_93326 ) ) ( not ( = ?auto_93323 ?auto_93327 ) ) ( not ( = ?auto_93323 ?auto_93328 ) ) ( not ( = ?auto_93324 ?auto_93325 ) ) ( not ( = ?auto_93324 ?auto_93326 ) ) ( not ( = ?auto_93324 ?auto_93327 ) ) ( not ( = ?auto_93324 ?auto_93328 ) ) ( not ( = ?auto_93325 ?auto_93326 ) ) ( not ( = ?auto_93325 ?auto_93327 ) ) ( not ( = ?auto_93325 ?auto_93328 ) ) ( not ( = ?auto_93326 ?auto_93327 ) ) ( not ( = ?auto_93326 ?auto_93328 ) ) ( not ( = ?auto_93327 ?auto_93328 ) ) ( ON ?auto_93326 ?auto_93327 ) ( ON ?auto_93325 ?auto_93326 ) ( ON ?auto_93324 ?auto_93325 ) ( ON ?auto_93323 ?auto_93324 ) ( ON ?auto_93322 ?auto_93323 ) ( ON ?auto_93321 ?auto_93322 ) ( CLEAR ?auto_93319 ) ( ON ?auto_93320 ?auto_93321 ) ( CLEAR ?auto_93320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93318 ?auto_93319 ?auto_93320 )
      ( MAKE-10PILE ?auto_93318 ?auto_93319 ?auto_93320 ?auto_93321 ?auto_93322 ?auto_93323 ?auto_93324 ?auto_93325 ?auto_93326 ?auto_93327 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93339 - BLOCK
      ?auto_93340 - BLOCK
      ?auto_93341 - BLOCK
      ?auto_93342 - BLOCK
      ?auto_93343 - BLOCK
      ?auto_93344 - BLOCK
      ?auto_93345 - BLOCK
      ?auto_93346 - BLOCK
      ?auto_93347 - BLOCK
      ?auto_93348 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93348 ) ( ON-TABLE ?auto_93339 ) ( ON ?auto_93340 ?auto_93339 ) ( not ( = ?auto_93339 ?auto_93340 ) ) ( not ( = ?auto_93339 ?auto_93341 ) ) ( not ( = ?auto_93339 ?auto_93342 ) ) ( not ( = ?auto_93339 ?auto_93343 ) ) ( not ( = ?auto_93339 ?auto_93344 ) ) ( not ( = ?auto_93339 ?auto_93345 ) ) ( not ( = ?auto_93339 ?auto_93346 ) ) ( not ( = ?auto_93339 ?auto_93347 ) ) ( not ( = ?auto_93339 ?auto_93348 ) ) ( not ( = ?auto_93340 ?auto_93341 ) ) ( not ( = ?auto_93340 ?auto_93342 ) ) ( not ( = ?auto_93340 ?auto_93343 ) ) ( not ( = ?auto_93340 ?auto_93344 ) ) ( not ( = ?auto_93340 ?auto_93345 ) ) ( not ( = ?auto_93340 ?auto_93346 ) ) ( not ( = ?auto_93340 ?auto_93347 ) ) ( not ( = ?auto_93340 ?auto_93348 ) ) ( not ( = ?auto_93341 ?auto_93342 ) ) ( not ( = ?auto_93341 ?auto_93343 ) ) ( not ( = ?auto_93341 ?auto_93344 ) ) ( not ( = ?auto_93341 ?auto_93345 ) ) ( not ( = ?auto_93341 ?auto_93346 ) ) ( not ( = ?auto_93341 ?auto_93347 ) ) ( not ( = ?auto_93341 ?auto_93348 ) ) ( not ( = ?auto_93342 ?auto_93343 ) ) ( not ( = ?auto_93342 ?auto_93344 ) ) ( not ( = ?auto_93342 ?auto_93345 ) ) ( not ( = ?auto_93342 ?auto_93346 ) ) ( not ( = ?auto_93342 ?auto_93347 ) ) ( not ( = ?auto_93342 ?auto_93348 ) ) ( not ( = ?auto_93343 ?auto_93344 ) ) ( not ( = ?auto_93343 ?auto_93345 ) ) ( not ( = ?auto_93343 ?auto_93346 ) ) ( not ( = ?auto_93343 ?auto_93347 ) ) ( not ( = ?auto_93343 ?auto_93348 ) ) ( not ( = ?auto_93344 ?auto_93345 ) ) ( not ( = ?auto_93344 ?auto_93346 ) ) ( not ( = ?auto_93344 ?auto_93347 ) ) ( not ( = ?auto_93344 ?auto_93348 ) ) ( not ( = ?auto_93345 ?auto_93346 ) ) ( not ( = ?auto_93345 ?auto_93347 ) ) ( not ( = ?auto_93345 ?auto_93348 ) ) ( not ( = ?auto_93346 ?auto_93347 ) ) ( not ( = ?auto_93346 ?auto_93348 ) ) ( not ( = ?auto_93347 ?auto_93348 ) ) ( ON ?auto_93347 ?auto_93348 ) ( ON ?auto_93346 ?auto_93347 ) ( ON ?auto_93345 ?auto_93346 ) ( ON ?auto_93344 ?auto_93345 ) ( ON ?auto_93343 ?auto_93344 ) ( ON ?auto_93342 ?auto_93343 ) ( CLEAR ?auto_93340 ) ( ON ?auto_93341 ?auto_93342 ) ( CLEAR ?auto_93341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93339 ?auto_93340 ?auto_93341 )
      ( MAKE-10PILE ?auto_93339 ?auto_93340 ?auto_93341 ?auto_93342 ?auto_93343 ?auto_93344 ?auto_93345 ?auto_93346 ?auto_93347 ?auto_93348 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93359 - BLOCK
      ?auto_93360 - BLOCK
      ?auto_93361 - BLOCK
      ?auto_93362 - BLOCK
      ?auto_93363 - BLOCK
      ?auto_93364 - BLOCK
      ?auto_93365 - BLOCK
      ?auto_93366 - BLOCK
      ?auto_93367 - BLOCK
      ?auto_93368 - BLOCK
    )
    :vars
    (
      ?auto_93369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93368 ?auto_93369 ) ( ON-TABLE ?auto_93359 ) ( not ( = ?auto_93359 ?auto_93360 ) ) ( not ( = ?auto_93359 ?auto_93361 ) ) ( not ( = ?auto_93359 ?auto_93362 ) ) ( not ( = ?auto_93359 ?auto_93363 ) ) ( not ( = ?auto_93359 ?auto_93364 ) ) ( not ( = ?auto_93359 ?auto_93365 ) ) ( not ( = ?auto_93359 ?auto_93366 ) ) ( not ( = ?auto_93359 ?auto_93367 ) ) ( not ( = ?auto_93359 ?auto_93368 ) ) ( not ( = ?auto_93359 ?auto_93369 ) ) ( not ( = ?auto_93360 ?auto_93361 ) ) ( not ( = ?auto_93360 ?auto_93362 ) ) ( not ( = ?auto_93360 ?auto_93363 ) ) ( not ( = ?auto_93360 ?auto_93364 ) ) ( not ( = ?auto_93360 ?auto_93365 ) ) ( not ( = ?auto_93360 ?auto_93366 ) ) ( not ( = ?auto_93360 ?auto_93367 ) ) ( not ( = ?auto_93360 ?auto_93368 ) ) ( not ( = ?auto_93360 ?auto_93369 ) ) ( not ( = ?auto_93361 ?auto_93362 ) ) ( not ( = ?auto_93361 ?auto_93363 ) ) ( not ( = ?auto_93361 ?auto_93364 ) ) ( not ( = ?auto_93361 ?auto_93365 ) ) ( not ( = ?auto_93361 ?auto_93366 ) ) ( not ( = ?auto_93361 ?auto_93367 ) ) ( not ( = ?auto_93361 ?auto_93368 ) ) ( not ( = ?auto_93361 ?auto_93369 ) ) ( not ( = ?auto_93362 ?auto_93363 ) ) ( not ( = ?auto_93362 ?auto_93364 ) ) ( not ( = ?auto_93362 ?auto_93365 ) ) ( not ( = ?auto_93362 ?auto_93366 ) ) ( not ( = ?auto_93362 ?auto_93367 ) ) ( not ( = ?auto_93362 ?auto_93368 ) ) ( not ( = ?auto_93362 ?auto_93369 ) ) ( not ( = ?auto_93363 ?auto_93364 ) ) ( not ( = ?auto_93363 ?auto_93365 ) ) ( not ( = ?auto_93363 ?auto_93366 ) ) ( not ( = ?auto_93363 ?auto_93367 ) ) ( not ( = ?auto_93363 ?auto_93368 ) ) ( not ( = ?auto_93363 ?auto_93369 ) ) ( not ( = ?auto_93364 ?auto_93365 ) ) ( not ( = ?auto_93364 ?auto_93366 ) ) ( not ( = ?auto_93364 ?auto_93367 ) ) ( not ( = ?auto_93364 ?auto_93368 ) ) ( not ( = ?auto_93364 ?auto_93369 ) ) ( not ( = ?auto_93365 ?auto_93366 ) ) ( not ( = ?auto_93365 ?auto_93367 ) ) ( not ( = ?auto_93365 ?auto_93368 ) ) ( not ( = ?auto_93365 ?auto_93369 ) ) ( not ( = ?auto_93366 ?auto_93367 ) ) ( not ( = ?auto_93366 ?auto_93368 ) ) ( not ( = ?auto_93366 ?auto_93369 ) ) ( not ( = ?auto_93367 ?auto_93368 ) ) ( not ( = ?auto_93367 ?auto_93369 ) ) ( not ( = ?auto_93368 ?auto_93369 ) ) ( ON ?auto_93367 ?auto_93368 ) ( ON ?auto_93366 ?auto_93367 ) ( ON ?auto_93365 ?auto_93366 ) ( ON ?auto_93364 ?auto_93365 ) ( ON ?auto_93363 ?auto_93364 ) ( ON ?auto_93362 ?auto_93363 ) ( ON ?auto_93361 ?auto_93362 ) ( CLEAR ?auto_93359 ) ( ON ?auto_93360 ?auto_93361 ) ( CLEAR ?auto_93360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93359 ?auto_93360 )
      ( MAKE-10PILE ?auto_93359 ?auto_93360 ?auto_93361 ?auto_93362 ?auto_93363 ?auto_93364 ?auto_93365 ?auto_93366 ?auto_93367 ?auto_93368 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93380 - BLOCK
      ?auto_93381 - BLOCK
      ?auto_93382 - BLOCK
      ?auto_93383 - BLOCK
      ?auto_93384 - BLOCK
      ?auto_93385 - BLOCK
      ?auto_93386 - BLOCK
      ?auto_93387 - BLOCK
      ?auto_93388 - BLOCK
      ?auto_93389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93389 ) ( ON-TABLE ?auto_93380 ) ( not ( = ?auto_93380 ?auto_93381 ) ) ( not ( = ?auto_93380 ?auto_93382 ) ) ( not ( = ?auto_93380 ?auto_93383 ) ) ( not ( = ?auto_93380 ?auto_93384 ) ) ( not ( = ?auto_93380 ?auto_93385 ) ) ( not ( = ?auto_93380 ?auto_93386 ) ) ( not ( = ?auto_93380 ?auto_93387 ) ) ( not ( = ?auto_93380 ?auto_93388 ) ) ( not ( = ?auto_93380 ?auto_93389 ) ) ( not ( = ?auto_93381 ?auto_93382 ) ) ( not ( = ?auto_93381 ?auto_93383 ) ) ( not ( = ?auto_93381 ?auto_93384 ) ) ( not ( = ?auto_93381 ?auto_93385 ) ) ( not ( = ?auto_93381 ?auto_93386 ) ) ( not ( = ?auto_93381 ?auto_93387 ) ) ( not ( = ?auto_93381 ?auto_93388 ) ) ( not ( = ?auto_93381 ?auto_93389 ) ) ( not ( = ?auto_93382 ?auto_93383 ) ) ( not ( = ?auto_93382 ?auto_93384 ) ) ( not ( = ?auto_93382 ?auto_93385 ) ) ( not ( = ?auto_93382 ?auto_93386 ) ) ( not ( = ?auto_93382 ?auto_93387 ) ) ( not ( = ?auto_93382 ?auto_93388 ) ) ( not ( = ?auto_93382 ?auto_93389 ) ) ( not ( = ?auto_93383 ?auto_93384 ) ) ( not ( = ?auto_93383 ?auto_93385 ) ) ( not ( = ?auto_93383 ?auto_93386 ) ) ( not ( = ?auto_93383 ?auto_93387 ) ) ( not ( = ?auto_93383 ?auto_93388 ) ) ( not ( = ?auto_93383 ?auto_93389 ) ) ( not ( = ?auto_93384 ?auto_93385 ) ) ( not ( = ?auto_93384 ?auto_93386 ) ) ( not ( = ?auto_93384 ?auto_93387 ) ) ( not ( = ?auto_93384 ?auto_93388 ) ) ( not ( = ?auto_93384 ?auto_93389 ) ) ( not ( = ?auto_93385 ?auto_93386 ) ) ( not ( = ?auto_93385 ?auto_93387 ) ) ( not ( = ?auto_93385 ?auto_93388 ) ) ( not ( = ?auto_93385 ?auto_93389 ) ) ( not ( = ?auto_93386 ?auto_93387 ) ) ( not ( = ?auto_93386 ?auto_93388 ) ) ( not ( = ?auto_93386 ?auto_93389 ) ) ( not ( = ?auto_93387 ?auto_93388 ) ) ( not ( = ?auto_93387 ?auto_93389 ) ) ( not ( = ?auto_93388 ?auto_93389 ) ) ( ON ?auto_93388 ?auto_93389 ) ( ON ?auto_93387 ?auto_93388 ) ( ON ?auto_93386 ?auto_93387 ) ( ON ?auto_93385 ?auto_93386 ) ( ON ?auto_93384 ?auto_93385 ) ( ON ?auto_93383 ?auto_93384 ) ( ON ?auto_93382 ?auto_93383 ) ( CLEAR ?auto_93380 ) ( ON ?auto_93381 ?auto_93382 ) ( CLEAR ?auto_93381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93380 ?auto_93381 )
      ( MAKE-10PILE ?auto_93380 ?auto_93381 ?auto_93382 ?auto_93383 ?auto_93384 ?auto_93385 ?auto_93386 ?auto_93387 ?auto_93388 ?auto_93389 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93400 - BLOCK
      ?auto_93401 - BLOCK
      ?auto_93402 - BLOCK
      ?auto_93403 - BLOCK
      ?auto_93404 - BLOCK
      ?auto_93405 - BLOCK
      ?auto_93406 - BLOCK
      ?auto_93407 - BLOCK
      ?auto_93408 - BLOCK
      ?auto_93409 - BLOCK
    )
    :vars
    (
      ?auto_93410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93409 ?auto_93410 ) ( not ( = ?auto_93400 ?auto_93401 ) ) ( not ( = ?auto_93400 ?auto_93402 ) ) ( not ( = ?auto_93400 ?auto_93403 ) ) ( not ( = ?auto_93400 ?auto_93404 ) ) ( not ( = ?auto_93400 ?auto_93405 ) ) ( not ( = ?auto_93400 ?auto_93406 ) ) ( not ( = ?auto_93400 ?auto_93407 ) ) ( not ( = ?auto_93400 ?auto_93408 ) ) ( not ( = ?auto_93400 ?auto_93409 ) ) ( not ( = ?auto_93400 ?auto_93410 ) ) ( not ( = ?auto_93401 ?auto_93402 ) ) ( not ( = ?auto_93401 ?auto_93403 ) ) ( not ( = ?auto_93401 ?auto_93404 ) ) ( not ( = ?auto_93401 ?auto_93405 ) ) ( not ( = ?auto_93401 ?auto_93406 ) ) ( not ( = ?auto_93401 ?auto_93407 ) ) ( not ( = ?auto_93401 ?auto_93408 ) ) ( not ( = ?auto_93401 ?auto_93409 ) ) ( not ( = ?auto_93401 ?auto_93410 ) ) ( not ( = ?auto_93402 ?auto_93403 ) ) ( not ( = ?auto_93402 ?auto_93404 ) ) ( not ( = ?auto_93402 ?auto_93405 ) ) ( not ( = ?auto_93402 ?auto_93406 ) ) ( not ( = ?auto_93402 ?auto_93407 ) ) ( not ( = ?auto_93402 ?auto_93408 ) ) ( not ( = ?auto_93402 ?auto_93409 ) ) ( not ( = ?auto_93402 ?auto_93410 ) ) ( not ( = ?auto_93403 ?auto_93404 ) ) ( not ( = ?auto_93403 ?auto_93405 ) ) ( not ( = ?auto_93403 ?auto_93406 ) ) ( not ( = ?auto_93403 ?auto_93407 ) ) ( not ( = ?auto_93403 ?auto_93408 ) ) ( not ( = ?auto_93403 ?auto_93409 ) ) ( not ( = ?auto_93403 ?auto_93410 ) ) ( not ( = ?auto_93404 ?auto_93405 ) ) ( not ( = ?auto_93404 ?auto_93406 ) ) ( not ( = ?auto_93404 ?auto_93407 ) ) ( not ( = ?auto_93404 ?auto_93408 ) ) ( not ( = ?auto_93404 ?auto_93409 ) ) ( not ( = ?auto_93404 ?auto_93410 ) ) ( not ( = ?auto_93405 ?auto_93406 ) ) ( not ( = ?auto_93405 ?auto_93407 ) ) ( not ( = ?auto_93405 ?auto_93408 ) ) ( not ( = ?auto_93405 ?auto_93409 ) ) ( not ( = ?auto_93405 ?auto_93410 ) ) ( not ( = ?auto_93406 ?auto_93407 ) ) ( not ( = ?auto_93406 ?auto_93408 ) ) ( not ( = ?auto_93406 ?auto_93409 ) ) ( not ( = ?auto_93406 ?auto_93410 ) ) ( not ( = ?auto_93407 ?auto_93408 ) ) ( not ( = ?auto_93407 ?auto_93409 ) ) ( not ( = ?auto_93407 ?auto_93410 ) ) ( not ( = ?auto_93408 ?auto_93409 ) ) ( not ( = ?auto_93408 ?auto_93410 ) ) ( not ( = ?auto_93409 ?auto_93410 ) ) ( ON ?auto_93408 ?auto_93409 ) ( ON ?auto_93407 ?auto_93408 ) ( ON ?auto_93406 ?auto_93407 ) ( ON ?auto_93405 ?auto_93406 ) ( ON ?auto_93404 ?auto_93405 ) ( ON ?auto_93403 ?auto_93404 ) ( ON ?auto_93402 ?auto_93403 ) ( ON ?auto_93401 ?auto_93402 ) ( ON ?auto_93400 ?auto_93401 ) ( CLEAR ?auto_93400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93400 )
      ( MAKE-10PILE ?auto_93400 ?auto_93401 ?auto_93402 ?auto_93403 ?auto_93404 ?auto_93405 ?auto_93406 ?auto_93407 ?auto_93408 ?auto_93409 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93421 - BLOCK
      ?auto_93422 - BLOCK
      ?auto_93423 - BLOCK
      ?auto_93424 - BLOCK
      ?auto_93425 - BLOCK
      ?auto_93426 - BLOCK
      ?auto_93427 - BLOCK
      ?auto_93428 - BLOCK
      ?auto_93429 - BLOCK
      ?auto_93430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93430 ) ( not ( = ?auto_93421 ?auto_93422 ) ) ( not ( = ?auto_93421 ?auto_93423 ) ) ( not ( = ?auto_93421 ?auto_93424 ) ) ( not ( = ?auto_93421 ?auto_93425 ) ) ( not ( = ?auto_93421 ?auto_93426 ) ) ( not ( = ?auto_93421 ?auto_93427 ) ) ( not ( = ?auto_93421 ?auto_93428 ) ) ( not ( = ?auto_93421 ?auto_93429 ) ) ( not ( = ?auto_93421 ?auto_93430 ) ) ( not ( = ?auto_93422 ?auto_93423 ) ) ( not ( = ?auto_93422 ?auto_93424 ) ) ( not ( = ?auto_93422 ?auto_93425 ) ) ( not ( = ?auto_93422 ?auto_93426 ) ) ( not ( = ?auto_93422 ?auto_93427 ) ) ( not ( = ?auto_93422 ?auto_93428 ) ) ( not ( = ?auto_93422 ?auto_93429 ) ) ( not ( = ?auto_93422 ?auto_93430 ) ) ( not ( = ?auto_93423 ?auto_93424 ) ) ( not ( = ?auto_93423 ?auto_93425 ) ) ( not ( = ?auto_93423 ?auto_93426 ) ) ( not ( = ?auto_93423 ?auto_93427 ) ) ( not ( = ?auto_93423 ?auto_93428 ) ) ( not ( = ?auto_93423 ?auto_93429 ) ) ( not ( = ?auto_93423 ?auto_93430 ) ) ( not ( = ?auto_93424 ?auto_93425 ) ) ( not ( = ?auto_93424 ?auto_93426 ) ) ( not ( = ?auto_93424 ?auto_93427 ) ) ( not ( = ?auto_93424 ?auto_93428 ) ) ( not ( = ?auto_93424 ?auto_93429 ) ) ( not ( = ?auto_93424 ?auto_93430 ) ) ( not ( = ?auto_93425 ?auto_93426 ) ) ( not ( = ?auto_93425 ?auto_93427 ) ) ( not ( = ?auto_93425 ?auto_93428 ) ) ( not ( = ?auto_93425 ?auto_93429 ) ) ( not ( = ?auto_93425 ?auto_93430 ) ) ( not ( = ?auto_93426 ?auto_93427 ) ) ( not ( = ?auto_93426 ?auto_93428 ) ) ( not ( = ?auto_93426 ?auto_93429 ) ) ( not ( = ?auto_93426 ?auto_93430 ) ) ( not ( = ?auto_93427 ?auto_93428 ) ) ( not ( = ?auto_93427 ?auto_93429 ) ) ( not ( = ?auto_93427 ?auto_93430 ) ) ( not ( = ?auto_93428 ?auto_93429 ) ) ( not ( = ?auto_93428 ?auto_93430 ) ) ( not ( = ?auto_93429 ?auto_93430 ) ) ( ON ?auto_93429 ?auto_93430 ) ( ON ?auto_93428 ?auto_93429 ) ( ON ?auto_93427 ?auto_93428 ) ( ON ?auto_93426 ?auto_93427 ) ( ON ?auto_93425 ?auto_93426 ) ( ON ?auto_93424 ?auto_93425 ) ( ON ?auto_93423 ?auto_93424 ) ( ON ?auto_93422 ?auto_93423 ) ( ON ?auto_93421 ?auto_93422 ) ( CLEAR ?auto_93421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93421 )
      ( MAKE-10PILE ?auto_93421 ?auto_93422 ?auto_93423 ?auto_93424 ?auto_93425 ?auto_93426 ?auto_93427 ?auto_93428 ?auto_93429 ?auto_93430 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_93441 - BLOCK
      ?auto_93442 - BLOCK
      ?auto_93443 - BLOCK
      ?auto_93444 - BLOCK
      ?auto_93445 - BLOCK
      ?auto_93446 - BLOCK
      ?auto_93447 - BLOCK
      ?auto_93448 - BLOCK
      ?auto_93449 - BLOCK
      ?auto_93450 - BLOCK
    )
    :vars
    (
      ?auto_93451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93441 ?auto_93442 ) ) ( not ( = ?auto_93441 ?auto_93443 ) ) ( not ( = ?auto_93441 ?auto_93444 ) ) ( not ( = ?auto_93441 ?auto_93445 ) ) ( not ( = ?auto_93441 ?auto_93446 ) ) ( not ( = ?auto_93441 ?auto_93447 ) ) ( not ( = ?auto_93441 ?auto_93448 ) ) ( not ( = ?auto_93441 ?auto_93449 ) ) ( not ( = ?auto_93441 ?auto_93450 ) ) ( not ( = ?auto_93442 ?auto_93443 ) ) ( not ( = ?auto_93442 ?auto_93444 ) ) ( not ( = ?auto_93442 ?auto_93445 ) ) ( not ( = ?auto_93442 ?auto_93446 ) ) ( not ( = ?auto_93442 ?auto_93447 ) ) ( not ( = ?auto_93442 ?auto_93448 ) ) ( not ( = ?auto_93442 ?auto_93449 ) ) ( not ( = ?auto_93442 ?auto_93450 ) ) ( not ( = ?auto_93443 ?auto_93444 ) ) ( not ( = ?auto_93443 ?auto_93445 ) ) ( not ( = ?auto_93443 ?auto_93446 ) ) ( not ( = ?auto_93443 ?auto_93447 ) ) ( not ( = ?auto_93443 ?auto_93448 ) ) ( not ( = ?auto_93443 ?auto_93449 ) ) ( not ( = ?auto_93443 ?auto_93450 ) ) ( not ( = ?auto_93444 ?auto_93445 ) ) ( not ( = ?auto_93444 ?auto_93446 ) ) ( not ( = ?auto_93444 ?auto_93447 ) ) ( not ( = ?auto_93444 ?auto_93448 ) ) ( not ( = ?auto_93444 ?auto_93449 ) ) ( not ( = ?auto_93444 ?auto_93450 ) ) ( not ( = ?auto_93445 ?auto_93446 ) ) ( not ( = ?auto_93445 ?auto_93447 ) ) ( not ( = ?auto_93445 ?auto_93448 ) ) ( not ( = ?auto_93445 ?auto_93449 ) ) ( not ( = ?auto_93445 ?auto_93450 ) ) ( not ( = ?auto_93446 ?auto_93447 ) ) ( not ( = ?auto_93446 ?auto_93448 ) ) ( not ( = ?auto_93446 ?auto_93449 ) ) ( not ( = ?auto_93446 ?auto_93450 ) ) ( not ( = ?auto_93447 ?auto_93448 ) ) ( not ( = ?auto_93447 ?auto_93449 ) ) ( not ( = ?auto_93447 ?auto_93450 ) ) ( not ( = ?auto_93448 ?auto_93449 ) ) ( not ( = ?auto_93448 ?auto_93450 ) ) ( not ( = ?auto_93449 ?auto_93450 ) ) ( ON ?auto_93441 ?auto_93451 ) ( not ( = ?auto_93450 ?auto_93451 ) ) ( not ( = ?auto_93449 ?auto_93451 ) ) ( not ( = ?auto_93448 ?auto_93451 ) ) ( not ( = ?auto_93447 ?auto_93451 ) ) ( not ( = ?auto_93446 ?auto_93451 ) ) ( not ( = ?auto_93445 ?auto_93451 ) ) ( not ( = ?auto_93444 ?auto_93451 ) ) ( not ( = ?auto_93443 ?auto_93451 ) ) ( not ( = ?auto_93442 ?auto_93451 ) ) ( not ( = ?auto_93441 ?auto_93451 ) ) ( ON ?auto_93442 ?auto_93441 ) ( ON ?auto_93443 ?auto_93442 ) ( ON ?auto_93444 ?auto_93443 ) ( ON ?auto_93445 ?auto_93444 ) ( ON ?auto_93446 ?auto_93445 ) ( ON ?auto_93447 ?auto_93446 ) ( ON ?auto_93448 ?auto_93447 ) ( ON ?auto_93449 ?auto_93448 ) ( ON ?auto_93450 ?auto_93449 ) ( CLEAR ?auto_93450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_93450 ?auto_93449 ?auto_93448 ?auto_93447 ?auto_93446 ?auto_93445 ?auto_93444 ?auto_93443 ?auto_93442 ?auto_93441 )
      ( MAKE-10PILE ?auto_93441 ?auto_93442 ?auto_93443 ?auto_93444 ?auto_93445 ?auto_93446 ?auto_93447 ?auto_93448 ?auto_93449 ?auto_93450 ) )
  )

)

