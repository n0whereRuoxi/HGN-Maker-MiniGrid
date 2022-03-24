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
      ?auto_69801 - BLOCK
    )
    :vars
    (
      ?auto_69802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69801 ?auto_69802 ) ( CLEAR ?auto_69801 ) ( HAND-EMPTY ) ( not ( = ?auto_69801 ?auto_69802 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69801 ?auto_69802 )
      ( !PUTDOWN ?auto_69801 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69804 - BLOCK
    )
    :vars
    (
      ?auto_69805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69804 ?auto_69805 ) ( CLEAR ?auto_69804 ) ( HAND-EMPTY ) ( not ( = ?auto_69804 ?auto_69805 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69804 ?auto_69805 )
      ( !PUTDOWN ?auto_69804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69808 - BLOCK
      ?auto_69809 - BLOCK
    )
    :vars
    (
      ?auto_69810 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69808 ) ( ON ?auto_69809 ?auto_69810 ) ( CLEAR ?auto_69809 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69808 ) ( not ( = ?auto_69808 ?auto_69809 ) ) ( not ( = ?auto_69808 ?auto_69810 ) ) ( not ( = ?auto_69809 ?auto_69810 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69809 ?auto_69810 )
      ( !STACK ?auto_69809 ?auto_69808 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69813 - BLOCK
      ?auto_69814 - BLOCK
    )
    :vars
    (
      ?auto_69815 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69813 ) ( ON ?auto_69814 ?auto_69815 ) ( CLEAR ?auto_69814 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69813 ) ( not ( = ?auto_69813 ?auto_69814 ) ) ( not ( = ?auto_69813 ?auto_69815 ) ) ( not ( = ?auto_69814 ?auto_69815 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69814 ?auto_69815 )
      ( !STACK ?auto_69814 ?auto_69813 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69818 - BLOCK
      ?auto_69819 - BLOCK
    )
    :vars
    (
      ?auto_69820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69819 ?auto_69820 ) ( not ( = ?auto_69818 ?auto_69819 ) ) ( not ( = ?auto_69818 ?auto_69820 ) ) ( not ( = ?auto_69819 ?auto_69820 ) ) ( ON ?auto_69818 ?auto_69819 ) ( CLEAR ?auto_69818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69818 )
      ( MAKE-2PILE ?auto_69818 ?auto_69819 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69823 - BLOCK
      ?auto_69824 - BLOCK
    )
    :vars
    (
      ?auto_69825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69824 ?auto_69825 ) ( not ( = ?auto_69823 ?auto_69824 ) ) ( not ( = ?auto_69823 ?auto_69825 ) ) ( not ( = ?auto_69824 ?auto_69825 ) ) ( ON ?auto_69823 ?auto_69824 ) ( CLEAR ?auto_69823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69823 )
      ( MAKE-2PILE ?auto_69823 ?auto_69824 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69829 - BLOCK
      ?auto_69830 - BLOCK
      ?auto_69831 - BLOCK
    )
    :vars
    (
      ?auto_69832 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69830 ) ( ON ?auto_69831 ?auto_69832 ) ( CLEAR ?auto_69831 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69829 ) ( ON ?auto_69830 ?auto_69829 ) ( not ( = ?auto_69829 ?auto_69830 ) ) ( not ( = ?auto_69829 ?auto_69831 ) ) ( not ( = ?auto_69829 ?auto_69832 ) ) ( not ( = ?auto_69830 ?auto_69831 ) ) ( not ( = ?auto_69830 ?auto_69832 ) ) ( not ( = ?auto_69831 ?auto_69832 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69831 ?auto_69832 )
      ( !STACK ?auto_69831 ?auto_69830 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69836 - BLOCK
      ?auto_69837 - BLOCK
      ?auto_69838 - BLOCK
    )
    :vars
    (
      ?auto_69839 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69837 ) ( ON ?auto_69838 ?auto_69839 ) ( CLEAR ?auto_69838 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69836 ) ( ON ?auto_69837 ?auto_69836 ) ( not ( = ?auto_69836 ?auto_69837 ) ) ( not ( = ?auto_69836 ?auto_69838 ) ) ( not ( = ?auto_69836 ?auto_69839 ) ) ( not ( = ?auto_69837 ?auto_69838 ) ) ( not ( = ?auto_69837 ?auto_69839 ) ) ( not ( = ?auto_69838 ?auto_69839 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69838 ?auto_69839 )
      ( !STACK ?auto_69838 ?auto_69837 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69843 - BLOCK
      ?auto_69844 - BLOCK
      ?auto_69845 - BLOCK
    )
    :vars
    (
      ?auto_69846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69845 ?auto_69846 ) ( ON-TABLE ?auto_69843 ) ( not ( = ?auto_69843 ?auto_69844 ) ) ( not ( = ?auto_69843 ?auto_69845 ) ) ( not ( = ?auto_69843 ?auto_69846 ) ) ( not ( = ?auto_69844 ?auto_69845 ) ) ( not ( = ?auto_69844 ?auto_69846 ) ) ( not ( = ?auto_69845 ?auto_69846 ) ) ( CLEAR ?auto_69843 ) ( ON ?auto_69844 ?auto_69845 ) ( CLEAR ?auto_69844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69843 ?auto_69844 )
      ( MAKE-3PILE ?auto_69843 ?auto_69844 ?auto_69845 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69850 - BLOCK
      ?auto_69851 - BLOCK
      ?auto_69852 - BLOCK
    )
    :vars
    (
      ?auto_69853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69852 ?auto_69853 ) ( ON-TABLE ?auto_69850 ) ( not ( = ?auto_69850 ?auto_69851 ) ) ( not ( = ?auto_69850 ?auto_69852 ) ) ( not ( = ?auto_69850 ?auto_69853 ) ) ( not ( = ?auto_69851 ?auto_69852 ) ) ( not ( = ?auto_69851 ?auto_69853 ) ) ( not ( = ?auto_69852 ?auto_69853 ) ) ( CLEAR ?auto_69850 ) ( ON ?auto_69851 ?auto_69852 ) ( CLEAR ?auto_69851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69850 ?auto_69851 )
      ( MAKE-3PILE ?auto_69850 ?auto_69851 ?auto_69852 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69857 - BLOCK
      ?auto_69858 - BLOCK
      ?auto_69859 - BLOCK
    )
    :vars
    (
      ?auto_69860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69859 ?auto_69860 ) ( not ( = ?auto_69857 ?auto_69858 ) ) ( not ( = ?auto_69857 ?auto_69859 ) ) ( not ( = ?auto_69857 ?auto_69860 ) ) ( not ( = ?auto_69858 ?auto_69859 ) ) ( not ( = ?auto_69858 ?auto_69860 ) ) ( not ( = ?auto_69859 ?auto_69860 ) ) ( ON ?auto_69858 ?auto_69859 ) ( ON ?auto_69857 ?auto_69858 ) ( CLEAR ?auto_69857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69857 )
      ( MAKE-3PILE ?auto_69857 ?auto_69858 ?auto_69859 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69864 - BLOCK
      ?auto_69865 - BLOCK
      ?auto_69866 - BLOCK
    )
    :vars
    (
      ?auto_69867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69866 ?auto_69867 ) ( not ( = ?auto_69864 ?auto_69865 ) ) ( not ( = ?auto_69864 ?auto_69866 ) ) ( not ( = ?auto_69864 ?auto_69867 ) ) ( not ( = ?auto_69865 ?auto_69866 ) ) ( not ( = ?auto_69865 ?auto_69867 ) ) ( not ( = ?auto_69866 ?auto_69867 ) ) ( ON ?auto_69865 ?auto_69866 ) ( ON ?auto_69864 ?auto_69865 ) ( CLEAR ?auto_69864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69864 )
      ( MAKE-3PILE ?auto_69864 ?auto_69865 ?auto_69866 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69872 - BLOCK
      ?auto_69873 - BLOCK
      ?auto_69874 - BLOCK
      ?auto_69875 - BLOCK
    )
    :vars
    (
      ?auto_69876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69874 ) ( ON ?auto_69875 ?auto_69876 ) ( CLEAR ?auto_69875 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69872 ) ( ON ?auto_69873 ?auto_69872 ) ( ON ?auto_69874 ?auto_69873 ) ( not ( = ?auto_69872 ?auto_69873 ) ) ( not ( = ?auto_69872 ?auto_69874 ) ) ( not ( = ?auto_69872 ?auto_69875 ) ) ( not ( = ?auto_69872 ?auto_69876 ) ) ( not ( = ?auto_69873 ?auto_69874 ) ) ( not ( = ?auto_69873 ?auto_69875 ) ) ( not ( = ?auto_69873 ?auto_69876 ) ) ( not ( = ?auto_69874 ?auto_69875 ) ) ( not ( = ?auto_69874 ?auto_69876 ) ) ( not ( = ?auto_69875 ?auto_69876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69875 ?auto_69876 )
      ( !STACK ?auto_69875 ?auto_69874 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69881 - BLOCK
      ?auto_69882 - BLOCK
      ?auto_69883 - BLOCK
      ?auto_69884 - BLOCK
    )
    :vars
    (
      ?auto_69885 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69883 ) ( ON ?auto_69884 ?auto_69885 ) ( CLEAR ?auto_69884 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69881 ) ( ON ?auto_69882 ?auto_69881 ) ( ON ?auto_69883 ?auto_69882 ) ( not ( = ?auto_69881 ?auto_69882 ) ) ( not ( = ?auto_69881 ?auto_69883 ) ) ( not ( = ?auto_69881 ?auto_69884 ) ) ( not ( = ?auto_69881 ?auto_69885 ) ) ( not ( = ?auto_69882 ?auto_69883 ) ) ( not ( = ?auto_69882 ?auto_69884 ) ) ( not ( = ?auto_69882 ?auto_69885 ) ) ( not ( = ?auto_69883 ?auto_69884 ) ) ( not ( = ?auto_69883 ?auto_69885 ) ) ( not ( = ?auto_69884 ?auto_69885 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69884 ?auto_69885 )
      ( !STACK ?auto_69884 ?auto_69883 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69890 - BLOCK
      ?auto_69891 - BLOCK
      ?auto_69892 - BLOCK
      ?auto_69893 - BLOCK
    )
    :vars
    (
      ?auto_69894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69893 ?auto_69894 ) ( ON-TABLE ?auto_69890 ) ( ON ?auto_69891 ?auto_69890 ) ( not ( = ?auto_69890 ?auto_69891 ) ) ( not ( = ?auto_69890 ?auto_69892 ) ) ( not ( = ?auto_69890 ?auto_69893 ) ) ( not ( = ?auto_69890 ?auto_69894 ) ) ( not ( = ?auto_69891 ?auto_69892 ) ) ( not ( = ?auto_69891 ?auto_69893 ) ) ( not ( = ?auto_69891 ?auto_69894 ) ) ( not ( = ?auto_69892 ?auto_69893 ) ) ( not ( = ?auto_69892 ?auto_69894 ) ) ( not ( = ?auto_69893 ?auto_69894 ) ) ( CLEAR ?auto_69891 ) ( ON ?auto_69892 ?auto_69893 ) ( CLEAR ?auto_69892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69890 ?auto_69891 ?auto_69892 )
      ( MAKE-4PILE ?auto_69890 ?auto_69891 ?auto_69892 ?auto_69893 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69899 - BLOCK
      ?auto_69900 - BLOCK
      ?auto_69901 - BLOCK
      ?auto_69902 - BLOCK
    )
    :vars
    (
      ?auto_69903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69902 ?auto_69903 ) ( ON-TABLE ?auto_69899 ) ( ON ?auto_69900 ?auto_69899 ) ( not ( = ?auto_69899 ?auto_69900 ) ) ( not ( = ?auto_69899 ?auto_69901 ) ) ( not ( = ?auto_69899 ?auto_69902 ) ) ( not ( = ?auto_69899 ?auto_69903 ) ) ( not ( = ?auto_69900 ?auto_69901 ) ) ( not ( = ?auto_69900 ?auto_69902 ) ) ( not ( = ?auto_69900 ?auto_69903 ) ) ( not ( = ?auto_69901 ?auto_69902 ) ) ( not ( = ?auto_69901 ?auto_69903 ) ) ( not ( = ?auto_69902 ?auto_69903 ) ) ( CLEAR ?auto_69900 ) ( ON ?auto_69901 ?auto_69902 ) ( CLEAR ?auto_69901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69899 ?auto_69900 ?auto_69901 )
      ( MAKE-4PILE ?auto_69899 ?auto_69900 ?auto_69901 ?auto_69902 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69908 - BLOCK
      ?auto_69909 - BLOCK
      ?auto_69910 - BLOCK
      ?auto_69911 - BLOCK
    )
    :vars
    (
      ?auto_69912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69911 ?auto_69912 ) ( ON-TABLE ?auto_69908 ) ( not ( = ?auto_69908 ?auto_69909 ) ) ( not ( = ?auto_69908 ?auto_69910 ) ) ( not ( = ?auto_69908 ?auto_69911 ) ) ( not ( = ?auto_69908 ?auto_69912 ) ) ( not ( = ?auto_69909 ?auto_69910 ) ) ( not ( = ?auto_69909 ?auto_69911 ) ) ( not ( = ?auto_69909 ?auto_69912 ) ) ( not ( = ?auto_69910 ?auto_69911 ) ) ( not ( = ?auto_69910 ?auto_69912 ) ) ( not ( = ?auto_69911 ?auto_69912 ) ) ( ON ?auto_69910 ?auto_69911 ) ( CLEAR ?auto_69908 ) ( ON ?auto_69909 ?auto_69910 ) ( CLEAR ?auto_69909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69908 ?auto_69909 )
      ( MAKE-4PILE ?auto_69908 ?auto_69909 ?auto_69910 ?auto_69911 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69917 - BLOCK
      ?auto_69918 - BLOCK
      ?auto_69919 - BLOCK
      ?auto_69920 - BLOCK
    )
    :vars
    (
      ?auto_69921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69920 ?auto_69921 ) ( ON-TABLE ?auto_69917 ) ( not ( = ?auto_69917 ?auto_69918 ) ) ( not ( = ?auto_69917 ?auto_69919 ) ) ( not ( = ?auto_69917 ?auto_69920 ) ) ( not ( = ?auto_69917 ?auto_69921 ) ) ( not ( = ?auto_69918 ?auto_69919 ) ) ( not ( = ?auto_69918 ?auto_69920 ) ) ( not ( = ?auto_69918 ?auto_69921 ) ) ( not ( = ?auto_69919 ?auto_69920 ) ) ( not ( = ?auto_69919 ?auto_69921 ) ) ( not ( = ?auto_69920 ?auto_69921 ) ) ( ON ?auto_69919 ?auto_69920 ) ( CLEAR ?auto_69917 ) ( ON ?auto_69918 ?auto_69919 ) ( CLEAR ?auto_69918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69917 ?auto_69918 )
      ( MAKE-4PILE ?auto_69917 ?auto_69918 ?auto_69919 ?auto_69920 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69926 - BLOCK
      ?auto_69927 - BLOCK
      ?auto_69928 - BLOCK
      ?auto_69929 - BLOCK
    )
    :vars
    (
      ?auto_69930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69929 ?auto_69930 ) ( not ( = ?auto_69926 ?auto_69927 ) ) ( not ( = ?auto_69926 ?auto_69928 ) ) ( not ( = ?auto_69926 ?auto_69929 ) ) ( not ( = ?auto_69926 ?auto_69930 ) ) ( not ( = ?auto_69927 ?auto_69928 ) ) ( not ( = ?auto_69927 ?auto_69929 ) ) ( not ( = ?auto_69927 ?auto_69930 ) ) ( not ( = ?auto_69928 ?auto_69929 ) ) ( not ( = ?auto_69928 ?auto_69930 ) ) ( not ( = ?auto_69929 ?auto_69930 ) ) ( ON ?auto_69928 ?auto_69929 ) ( ON ?auto_69927 ?auto_69928 ) ( ON ?auto_69926 ?auto_69927 ) ( CLEAR ?auto_69926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69926 )
      ( MAKE-4PILE ?auto_69926 ?auto_69927 ?auto_69928 ?auto_69929 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69935 - BLOCK
      ?auto_69936 - BLOCK
      ?auto_69937 - BLOCK
      ?auto_69938 - BLOCK
    )
    :vars
    (
      ?auto_69939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69938 ?auto_69939 ) ( not ( = ?auto_69935 ?auto_69936 ) ) ( not ( = ?auto_69935 ?auto_69937 ) ) ( not ( = ?auto_69935 ?auto_69938 ) ) ( not ( = ?auto_69935 ?auto_69939 ) ) ( not ( = ?auto_69936 ?auto_69937 ) ) ( not ( = ?auto_69936 ?auto_69938 ) ) ( not ( = ?auto_69936 ?auto_69939 ) ) ( not ( = ?auto_69937 ?auto_69938 ) ) ( not ( = ?auto_69937 ?auto_69939 ) ) ( not ( = ?auto_69938 ?auto_69939 ) ) ( ON ?auto_69937 ?auto_69938 ) ( ON ?auto_69936 ?auto_69937 ) ( ON ?auto_69935 ?auto_69936 ) ( CLEAR ?auto_69935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69935 )
      ( MAKE-4PILE ?auto_69935 ?auto_69936 ?auto_69937 ?auto_69938 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69945 - BLOCK
      ?auto_69946 - BLOCK
      ?auto_69947 - BLOCK
      ?auto_69948 - BLOCK
      ?auto_69949 - BLOCK
    )
    :vars
    (
      ?auto_69950 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69948 ) ( ON ?auto_69949 ?auto_69950 ) ( CLEAR ?auto_69949 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69945 ) ( ON ?auto_69946 ?auto_69945 ) ( ON ?auto_69947 ?auto_69946 ) ( ON ?auto_69948 ?auto_69947 ) ( not ( = ?auto_69945 ?auto_69946 ) ) ( not ( = ?auto_69945 ?auto_69947 ) ) ( not ( = ?auto_69945 ?auto_69948 ) ) ( not ( = ?auto_69945 ?auto_69949 ) ) ( not ( = ?auto_69945 ?auto_69950 ) ) ( not ( = ?auto_69946 ?auto_69947 ) ) ( not ( = ?auto_69946 ?auto_69948 ) ) ( not ( = ?auto_69946 ?auto_69949 ) ) ( not ( = ?auto_69946 ?auto_69950 ) ) ( not ( = ?auto_69947 ?auto_69948 ) ) ( not ( = ?auto_69947 ?auto_69949 ) ) ( not ( = ?auto_69947 ?auto_69950 ) ) ( not ( = ?auto_69948 ?auto_69949 ) ) ( not ( = ?auto_69948 ?auto_69950 ) ) ( not ( = ?auto_69949 ?auto_69950 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69949 ?auto_69950 )
      ( !STACK ?auto_69949 ?auto_69948 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69956 - BLOCK
      ?auto_69957 - BLOCK
      ?auto_69958 - BLOCK
      ?auto_69959 - BLOCK
      ?auto_69960 - BLOCK
    )
    :vars
    (
      ?auto_69961 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69959 ) ( ON ?auto_69960 ?auto_69961 ) ( CLEAR ?auto_69960 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69956 ) ( ON ?auto_69957 ?auto_69956 ) ( ON ?auto_69958 ?auto_69957 ) ( ON ?auto_69959 ?auto_69958 ) ( not ( = ?auto_69956 ?auto_69957 ) ) ( not ( = ?auto_69956 ?auto_69958 ) ) ( not ( = ?auto_69956 ?auto_69959 ) ) ( not ( = ?auto_69956 ?auto_69960 ) ) ( not ( = ?auto_69956 ?auto_69961 ) ) ( not ( = ?auto_69957 ?auto_69958 ) ) ( not ( = ?auto_69957 ?auto_69959 ) ) ( not ( = ?auto_69957 ?auto_69960 ) ) ( not ( = ?auto_69957 ?auto_69961 ) ) ( not ( = ?auto_69958 ?auto_69959 ) ) ( not ( = ?auto_69958 ?auto_69960 ) ) ( not ( = ?auto_69958 ?auto_69961 ) ) ( not ( = ?auto_69959 ?auto_69960 ) ) ( not ( = ?auto_69959 ?auto_69961 ) ) ( not ( = ?auto_69960 ?auto_69961 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69960 ?auto_69961 )
      ( !STACK ?auto_69960 ?auto_69959 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69967 - BLOCK
      ?auto_69968 - BLOCK
      ?auto_69969 - BLOCK
      ?auto_69970 - BLOCK
      ?auto_69971 - BLOCK
    )
    :vars
    (
      ?auto_69972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69971 ?auto_69972 ) ( ON-TABLE ?auto_69967 ) ( ON ?auto_69968 ?auto_69967 ) ( ON ?auto_69969 ?auto_69968 ) ( not ( = ?auto_69967 ?auto_69968 ) ) ( not ( = ?auto_69967 ?auto_69969 ) ) ( not ( = ?auto_69967 ?auto_69970 ) ) ( not ( = ?auto_69967 ?auto_69971 ) ) ( not ( = ?auto_69967 ?auto_69972 ) ) ( not ( = ?auto_69968 ?auto_69969 ) ) ( not ( = ?auto_69968 ?auto_69970 ) ) ( not ( = ?auto_69968 ?auto_69971 ) ) ( not ( = ?auto_69968 ?auto_69972 ) ) ( not ( = ?auto_69969 ?auto_69970 ) ) ( not ( = ?auto_69969 ?auto_69971 ) ) ( not ( = ?auto_69969 ?auto_69972 ) ) ( not ( = ?auto_69970 ?auto_69971 ) ) ( not ( = ?auto_69970 ?auto_69972 ) ) ( not ( = ?auto_69971 ?auto_69972 ) ) ( CLEAR ?auto_69969 ) ( ON ?auto_69970 ?auto_69971 ) ( CLEAR ?auto_69970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69967 ?auto_69968 ?auto_69969 ?auto_69970 )
      ( MAKE-5PILE ?auto_69967 ?auto_69968 ?auto_69969 ?auto_69970 ?auto_69971 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69978 - BLOCK
      ?auto_69979 - BLOCK
      ?auto_69980 - BLOCK
      ?auto_69981 - BLOCK
      ?auto_69982 - BLOCK
    )
    :vars
    (
      ?auto_69983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69982 ?auto_69983 ) ( ON-TABLE ?auto_69978 ) ( ON ?auto_69979 ?auto_69978 ) ( ON ?auto_69980 ?auto_69979 ) ( not ( = ?auto_69978 ?auto_69979 ) ) ( not ( = ?auto_69978 ?auto_69980 ) ) ( not ( = ?auto_69978 ?auto_69981 ) ) ( not ( = ?auto_69978 ?auto_69982 ) ) ( not ( = ?auto_69978 ?auto_69983 ) ) ( not ( = ?auto_69979 ?auto_69980 ) ) ( not ( = ?auto_69979 ?auto_69981 ) ) ( not ( = ?auto_69979 ?auto_69982 ) ) ( not ( = ?auto_69979 ?auto_69983 ) ) ( not ( = ?auto_69980 ?auto_69981 ) ) ( not ( = ?auto_69980 ?auto_69982 ) ) ( not ( = ?auto_69980 ?auto_69983 ) ) ( not ( = ?auto_69981 ?auto_69982 ) ) ( not ( = ?auto_69981 ?auto_69983 ) ) ( not ( = ?auto_69982 ?auto_69983 ) ) ( CLEAR ?auto_69980 ) ( ON ?auto_69981 ?auto_69982 ) ( CLEAR ?auto_69981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69978 ?auto_69979 ?auto_69980 ?auto_69981 )
      ( MAKE-5PILE ?auto_69978 ?auto_69979 ?auto_69980 ?auto_69981 ?auto_69982 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69989 - BLOCK
      ?auto_69990 - BLOCK
      ?auto_69991 - BLOCK
      ?auto_69992 - BLOCK
      ?auto_69993 - BLOCK
    )
    :vars
    (
      ?auto_69994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69993 ?auto_69994 ) ( ON-TABLE ?auto_69989 ) ( ON ?auto_69990 ?auto_69989 ) ( not ( = ?auto_69989 ?auto_69990 ) ) ( not ( = ?auto_69989 ?auto_69991 ) ) ( not ( = ?auto_69989 ?auto_69992 ) ) ( not ( = ?auto_69989 ?auto_69993 ) ) ( not ( = ?auto_69989 ?auto_69994 ) ) ( not ( = ?auto_69990 ?auto_69991 ) ) ( not ( = ?auto_69990 ?auto_69992 ) ) ( not ( = ?auto_69990 ?auto_69993 ) ) ( not ( = ?auto_69990 ?auto_69994 ) ) ( not ( = ?auto_69991 ?auto_69992 ) ) ( not ( = ?auto_69991 ?auto_69993 ) ) ( not ( = ?auto_69991 ?auto_69994 ) ) ( not ( = ?auto_69992 ?auto_69993 ) ) ( not ( = ?auto_69992 ?auto_69994 ) ) ( not ( = ?auto_69993 ?auto_69994 ) ) ( ON ?auto_69992 ?auto_69993 ) ( CLEAR ?auto_69990 ) ( ON ?auto_69991 ?auto_69992 ) ( CLEAR ?auto_69991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69989 ?auto_69990 ?auto_69991 )
      ( MAKE-5PILE ?auto_69989 ?auto_69990 ?auto_69991 ?auto_69992 ?auto_69993 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70000 - BLOCK
      ?auto_70001 - BLOCK
      ?auto_70002 - BLOCK
      ?auto_70003 - BLOCK
      ?auto_70004 - BLOCK
    )
    :vars
    (
      ?auto_70005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70004 ?auto_70005 ) ( ON-TABLE ?auto_70000 ) ( ON ?auto_70001 ?auto_70000 ) ( not ( = ?auto_70000 ?auto_70001 ) ) ( not ( = ?auto_70000 ?auto_70002 ) ) ( not ( = ?auto_70000 ?auto_70003 ) ) ( not ( = ?auto_70000 ?auto_70004 ) ) ( not ( = ?auto_70000 ?auto_70005 ) ) ( not ( = ?auto_70001 ?auto_70002 ) ) ( not ( = ?auto_70001 ?auto_70003 ) ) ( not ( = ?auto_70001 ?auto_70004 ) ) ( not ( = ?auto_70001 ?auto_70005 ) ) ( not ( = ?auto_70002 ?auto_70003 ) ) ( not ( = ?auto_70002 ?auto_70004 ) ) ( not ( = ?auto_70002 ?auto_70005 ) ) ( not ( = ?auto_70003 ?auto_70004 ) ) ( not ( = ?auto_70003 ?auto_70005 ) ) ( not ( = ?auto_70004 ?auto_70005 ) ) ( ON ?auto_70003 ?auto_70004 ) ( CLEAR ?auto_70001 ) ( ON ?auto_70002 ?auto_70003 ) ( CLEAR ?auto_70002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70000 ?auto_70001 ?auto_70002 )
      ( MAKE-5PILE ?auto_70000 ?auto_70001 ?auto_70002 ?auto_70003 ?auto_70004 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70011 - BLOCK
      ?auto_70012 - BLOCK
      ?auto_70013 - BLOCK
      ?auto_70014 - BLOCK
      ?auto_70015 - BLOCK
    )
    :vars
    (
      ?auto_70016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70015 ?auto_70016 ) ( ON-TABLE ?auto_70011 ) ( not ( = ?auto_70011 ?auto_70012 ) ) ( not ( = ?auto_70011 ?auto_70013 ) ) ( not ( = ?auto_70011 ?auto_70014 ) ) ( not ( = ?auto_70011 ?auto_70015 ) ) ( not ( = ?auto_70011 ?auto_70016 ) ) ( not ( = ?auto_70012 ?auto_70013 ) ) ( not ( = ?auto_70012 ?auto_70014 ) ) ( not ( = ?auto_70012 ?auto_70015 ) ) ( not ( = ?auto_70012 ?auto_70016 ) ) ( not ( = ?auto_70013 ?auto_70014 ) ) ( not ( = ?auto_70013 ?auto_70015 ) ) ( not ( = ?auto_70013 ?auto_70016 ) ) ( not ( = ?auto_70014 ?auto_70015 ) ) ( not ( = ?auto_70014 ?auto_70016 ) ) ( not ( = ?auto_70015 ?auto_70016 ) ) ( ON ?auto_70014 ?auto_70015 ) ( ON ?auto_70013 ?auto_70014 ) ( CLEAR ?auto_70011 ) ( ON ?auto_70012 ?auto_70013 ) ( CLEAR ?auto_70012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70011 ?auto_70012 )
      ( MAKE-5PILE ?auto_70011 ?auto_70012 ?auto_70013 ?auto_70014 ?auto_70015 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70022 - BLOCK
      ?auto_70023 - BLOCK
      ?auto_70024 - BLOCK
      ?auto_70025 - BLOCK
      ?auto_70026 - BLOCK
    )
    :vars
    (
      ?auto_70027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70026 ?auto_70027 ) ( ON-TABLE ?auto_70022 ) ( not ( = ?auto_70022 ?auto_70023 ) ) ( not ( = ?auto_70022 ?auto_70024 ) ) ( not ( = ?auto_70022 ?auto_70025 ) ) ( not ( = ?auto_70022 ?auto_70026 ) ) ( not ( = ?auto_70022 ?auto_70027 ) ) ( not ( = ?auto_70023 ?auto_70024 ) ) ( not ( = ?auto_70023 ?auto_70025 ) ) ( not ( = ?auto_70023 ?auto_70026 ) ) ( not ( = ?auto_70023 ?auto_70027 ) ) ( not ( = ?auto_70024 ?auto_70025 ) ) ( not ( = ?auto_70024 ?auto_70026 ) ) ( not ( = ?auto_70024 ?auto_70027 ) ) ( not ( = ?auto_70025 ?auto_70026 ) ) ( not ( = ?auto_70025 ?auto_70027 ) ) ( not ( = ?auto_70026 ?auto_70027 ) ) ( ON ?auto_70025 ?auto_70026 ) ( ON ?auto_70024 ?auto_70025 ) ( CLEAR ?auto_70022 ) ( ON ?auto_70023 ?auto_70024 ) ( CLEAR ?auto_70023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70022 ?auto_70023 )
      ( MAKE-5PILE ?auto_70022 ?auto_70023 ?auto_70024 ?auto_70025 ?auto_70026 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70033 - BLOCK
      ?auto_70034 - BLOCK
      ?auto_70035 - BLOCK
      ?auto_70036 - BLOCK
      ?auto_70037 - BLOCK
    )
    :vars
    (
      ?auto_70038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70037 ?auto_70038 ) ( not ( = ?auto_70033 ?auto_70034 ) ) ( not ( = ?auto_70033 ?auto_70035 ) ) ( not ( = ?auto_70033 ?auto_70036 ) ) ( not ( = ?auto_70033 ?auto_70037 ) ) ( not ( = ?auto_70033 ?auto_70038 ) ) ( not ( = ?auto_70034 ?auto_70035 ) ) ( not ( = ?auto_70034 ?auto_70036 ) ) ( not ( = ?auto_70034 ?auto_70037 ) ) ( not ( = ?auto_70034 ?auto_70038 ) ) ( not ( = ?auto_70035 ?auto_70036 ) ) ( not ( = ?auto_70035 ?auto_70037 ) ) ( not ( = ?auto_70035 ?auto_70038 ) ) ( not ( = ?auto_70036 ?auto_70037 ) ) ( not ( = ?auto_70036 ?auto_70038 ) ) ( not ( = ?auto_70037 ?auto_70038 ) ) ( ON ?auto_70036 ?auto_70037 ) ( ON ?auto_70035 ?auto_70036 ) ( ON ?auto_70034 ?auto_70035 ) ( ON ?auto_70033 ?auto_70034 ) ( CLEAR ?auto_70033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70033 )
      ( MAKE-5PILE ?auto_70033 ?auto_70034 ?auto_70035 ?auto_70036 ?auto_70037 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70044 - BLOCK
      ?auto_70045 - BLOCK
      ?auto_70046 - BLOCK
      ?auto_70047 - BLOCK
      ?auto_70048 - BLOCK
    )
    :vars
    (
      ?auto_70049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70048 ?auto_70049 ) ( not ( = ?auto_70044 ?auto_70045 ) ) ( not ( = ?auto_70044 ?auto_70046 ) ) ( not ( = ?auto_70044 ?auto_70047 ) ) ( not ( = ?auto_70044 ?auto_70048 ) ) ( not ( = ?auto_70044 ?auto_70049 ) ) ( not ( = ?auto_70045 ?auto_70046 ) ) ( not ( = ?auto_70045 ?auto_70047 ) ) ( not ( = ?auto_70045 ?auto_70048 ) ) ( not ( = ?auto_70045 ?auto_70049 ) ) ( not ( = ?auto_70046 ?auto_70047 ) ) ( not ( = ?auto_70046 ?auto_70048 ) ) ( not ( = ?auto_70046 ?auto_70049 ) ) ( not ( = ?auto_70047 ?auto_70048 ) ) ( not ( = ?auto_70047 ?auto_70049 ) ) ( not ( = ?auto_70048 ?auto_70049 ) ) ( ON ?auto_70047 ?auto_70048 ) ( ON ?auto_70046 ?auto_70047 ) ( ON ?auto_70045 ?auto_70046 ) ( ON ?auto_70044 ?auto_70045 ) ( CLEAR ?auto_70044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70044 )
      ( MAKE-5PILE ?auto_70044 ?auto_70045 ?auto_70046 ?auto_70047 ?auto_70048 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70056 - BLOCK
      ?auto_70057 - BLOCK
      ?auto_70058 - BLOCK
      ?auto_70059 - BLOCK
      ?auto_70060 - BLOCK
      ?auto_70061 - BLOCK
    )
    :vars
    (
      ?auto_70062 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_70060 ) ( ON ?auto_70061 ?auto_70062 ) ( CLEAR ?auto_70061 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70056 ) ( ON ?auto_70057 ?auto_70056 ) ( ON ?auto_70058 ?auto_70057 ) ( ON ?auto_70059 ?auto_70058 ) ( ON ?auto_70060 ?auto_70059 ) ( not ( = ?auto_70056 ?auto_70057 ) ) ( not ( = ?auto_70056 ?auto_70058 ) ) ( not ( = ?auto_70056 ?auto_70059 ) ) ( not ( = ?auto_70056 ?auto_70060 ) ) ( not ( = ?auto_70056 ?auto_70061 ) ) ( not ( = ?auto_70056 ?auto_70062 ) ) ( not ( = ?auto_70057 ?auto_70058 ) ) ( not ( = ?auto_70057 ?auto_70059 ) ) ( not ( = ?auto_70057 ?auto_70060 ) ) ( not ( = ?auto_70057 ?auto_70061 ) ) ( not ( = ?auto_70057 ?auto_70062 ) ) ( not ( = ?auto_70058 ?auto_70059 ) ) ( not ( = ?auto_70058 ?auto_70060 ) ) ( not ( = ?auto_70058 ?auto_70061 ) ) ( not ( = ?auto_70058 ?auto_70062 ) ) ( not ( = ?auto_70059 ?auto_70060 ) ) ( not ( = ?auto_70059 ?auto_70061 ) ) ( not ( = ?auto_70059 ?auto_70062 ) ) ( not ( = ?auto_70060 ?auto_70061 ) ) ( not ( = ?auto_70060 ?auto_70062 ) ) ( not ( = ?auto_70061 ?auto_70062 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70061 ?auto_70062 )
      ( !STACK ?auto_70061 ?auto_70060 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70069 - BLOCK
      ?auto_70070 - BLOCK
      ?auto_70071 - BLOCK
      ?auto_70072 - BLOCK
      ?auto_70073 - BLOCK
      ?auto_70074 - BLOCK
    )
    :vars
    (
      ?auto_70075 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_70073 ) ( ON ?auto_70074 ?auto_70075 ) ( CLEAR ?auto_70074 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70069 ) ( ON ?auto_70070 ?auto_70069 ) ( ON ?auto_70071 ?auto_70070 ) ( ON ?auto_70072 ?auto_70071 ) ( ON ?auto_70073 ?auto_70072 ) ( not ( = ?auto_70069 ?auto_70070 ) ) ( not ( = ?auto_70069 ?auto_70071 ) ) ( not ( = ?auto_70069 ?auto_70072 ) ) ( not ( = ?auto_70069 ?auto_70073 ) ) ( not ( = ?auto_70069 ?auto_70074 ) ) ( not ( = ?auto_70069 ?auto_70075 ) ) ( not ( = ?auto_70070 ?auto_70071 ) ) ( not ( = ?auto_70070 ?auto_70072 ) ) ( not ( = ?auto_70070 ?auto_70073 ) ) ( not ( = ?auto_70070 ?auto_70074 ) ) ( not ( = ?auto_70070 ?auto_70075 ) ) ( not ( = ?auto_70071 ?auto_70072 ) ) ( not ( = ?auto_70071 ?auto_70073 ) ) ( not ( = ?auto_70071 ?auto_70074 ) ) ( not ( = ?auto_70071 ?auto_70075 ) ) ( not ( = ?auto_70072 ?auto_70073 ) ) ( not ( = ?auto_70072 ?auto_70074 ) ) ( not ( = ?auto_70072 ?auto_70075 ) ) ( not ( = ?auto_70073 ?auto_70074 ) ) ( not ( = ?auto_70073 ?auto_70075 ) ) ( not ( = ?auto_70074 ?auto_70075 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70074 ?auto_70075 )
      ( !STACK ?auto_70074 ?auto_70073 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70082 - BLOCK
      ?auto_70083 - BLOCK
      ?auto_70084 - BLOCK
      ?auto_70085 - BLOCK
      ?auto_70086 - BLOCK
      ?auto_70087 - BLOCK
    )
    :vars
    (
      ?auto_70088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70087 ?auto_70088 ) ( ON-TABLE ?auto_70082 ) ( ON ?auto_70083 ?auto_70082 ) ( ON ?auto_70084 ?auto_70083 ) ( ON ?auto_70085 ?auto_70084 ) ( not ( = ?auto_70082 ?auto_70083 ) ) ( not ( = ?auto_70082 ?auto_70084 ) ) ( not ( = ?auto_70082 ?auto_70085 ) ) ( not ( = ?auto_70082 ?auto_70086 ) ) ( not ( = ?auto_70082 ?auto_70087 ) ) ( not ( = ?auto_70082 ?auto_70088 ) ) ( not ( = ?auto_70083 ?auto_70084 ) ) ( not ( = ?auto_70083 ?auto_70085 ) ) ( not ( = ?auto_70083 ?auto_70086 ) ) ( not ( = ?auto_70083 ?auto_70087 ) ) ( not ( = ?auto_70083 ?auto_70088 ) ) ( not ( = ?auto_70084 ?auto_70085 ) ) ( not ( = ?auto_70084 ?auto_70086 ) ) ( not ( = ?auto_70084 ?auto_70087 ) ) ( not ( = ?auto_70084 ?auto_70088 ) ) ( not ( = ?auto_70085 ?auto_70086 ) ) ( not ( = ?auto_70085 ?auto_70087 ) ) ( not ( = ?auto_70085 ?auto_70088 ) ) ( not ( = ?auto_70086 ?auto_70087 ) ) ( not ( = ?auto_70086 ?auto_70088 ) ) ( not ( = ?auto_70087 ?auto_70088 ) ) ( CLEAR ?auto_70085 ) ( ON ?auto_70086 ?auto_70087 ) ( CLEAR ?auto_70086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70082 ?auto_70083 ?auto_70084 ?auto_70085 ?auto_70086 )
      ( MAKE-6PILE ?auto_70082 ?auto_70083 ?auto_70084 ?auto_70085 ?auto_70086 ?auto_70087 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70095 - BLOCK
      ?auto_70096 - BLOCK
      ?auto_70097 - BLOCK
      ?auto_70098 - BLOCK
      ?auto_70099 - BLOCK
      ?auto_70100 - BLOCK
    )
    :vars
    (
      ?auto_70101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70100 ?auto_70101 ) ( ON-TABLE ?auto_70095 ) ( ON ?auto_70096 ?auto_70095 ) ( ON ?auto_70097 ?auto_70096 ) ( ON ?auto_70098 ?auto_70097 ) ( not ( = ?auto_70095 ?auto_70096 ) ) ( not ( = ?auto_70095 ?auto_70097 ) ) ( not ( = ?auto_70095 ?auto_70098 ) ) ( not ( = ?auto_70095 ?auto_70099 ) ) ( not ( = ?auto_70095 ?auto_70100 ) ) ( not ( = ?auto_70095 ?auto_70101 ) ) ( not ( = ?auto_70096 ?auto_70097 ) ) ( not ( = ?auto_70096 ?auto_70098 ) ) ( not ( = ?auto_70096 ?auto_70099 ) ) ( not ( = ?auto_70096 ?auto_70100 ) ) ( not ( = ?auto_70096 ?auto_70101 ) ) ( not ( = ?auto_70097 ?auto_70098 ) ) ( not ( = ?auto_70097 ?auto_70099 ) ) ( not ( = ?auto_70097 ?auto_70100 ) ) ( not ( = ?auto_70097 ?auto_70101 ) ) ( not ( = ?auto_70098 ?auto_70099 ) ) ( not ( = ?auto_70098 ?auto_70100 ) ) ( not ( = ?auto_70098 ?auto_70101 ) ) ( not ( = ?auto_70099 ?auto_70100 ) ) ( not ( = ?auto_70099 ?auto_70101 ) ) ( not ( = ?auto_70100 ?auto_70101 ) ) ( CLEAR ?auto_70098 ) ( ON ?auto_70099 ?auto_70100 ) ( CLEAR ?auto_70099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70095 ?auto_70096 ?auto_70097 ?auto_70098 ?auto_70099 )
      ( MAKE-6PILE ?auto_70095 ?auto_70096 ?auto_70097 ?auto_70098 ?auto_70099 ?auto_70100 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70108 - BLOCK
      ?auto_70109 - BLOCK
      ?auto_70110 - BLOCK
      ?auto_70111 - BLOCK
      ?auto_70112 - BLOCK
      ?auto_70113 - BLOCK
    )
    :vars
    (
      ?auto_70114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70113 ?auto_70114 ) ( ON-TABLE ?auto_70108 ) ( ON ?auto_70109 ?auto_70108 ) ( ON ?auto_70110 ?auto_70109 ) ( not ( = ?auto_70108 ?auto_70109 ) ) ( not ( = ?auto_70108 ?auto_70110 ) ) ( not ( = ?auto_70108 ?auto_70111 ) ) ( not ( = ?auto_70108 ?auto_70112 ) ) ( not ( = ?auto_70108 ?auto_70113 ) ) ( not ( = ?auto_70108 ?auto_70114 ) ) ( not ( = ?auto_70109 ?auto_70110 ) ) ( not ( = ?auto_70109 ?auto_70111 ) ) ( not ( = ?auto_70109 ?auto_70112 ) ) ( not ( = ?auto_70109 ?auto_70113 ) ) ( not ( = ?auto_70109 ?auto_70114 ) ) ( not ( = ?auto_70110 ?auto_70111 ) ) ( not ( = ?auto_70110 ?auto_70112 ) ) ( not ( = ?auto_70110 ?auto_70113 ) ) ( not ( = ?auto_70110 ?auto_70114 ) ) ( not ( = ?auto_70111 ?auto_70112 ) ) ( not ( = ?auto_70111 ?auto_70113 ) ) ( not ( = ?auto_70111 ?auto_70114 ) ) ( not ( = ?auto_70112 ?auto_70113 ) ) ( not ( = ?auto_70112 ?auto_70114 ) ) ( not ( = ?auto_70113 ?auto_70114 ) ) ( ON ?auto_70112 ?auto_70113 ) ( CLEAR ?auto_70110 ) ( ON ?auto_70111 ?auto_70112 ) ( CLEAR ?auto_70111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70108 ?auto_70109 ?auto_70110 ?auto_70111 )
      ( MAKE-6PILE ?auto_70108 ?auto_70109 ?auto_70110 ?auto_70111 ?auto_70112 ?auto_70113 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70121 - BLOCK
      ?auto_70122 - BLOCK
      ?auto_70123 - BLOCK
      ?auto_70124 - BLOCK
      ?auto_70125 - BLOCK
      ?auto_70126 - BLOCK
    )
    :vars
    (
      ?auto_70127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70126 ?auto_70127 ) ( ON-TABLE ?auto_70121 ) ( ON ?auto_70122 ?auto_70121 ) ( ON ?auto_70123 ?auto_70122 ) ( not ( = ?auto_70121 ?auto_70122 ) ) ( not ( = ?auto_70121 ?auto_70123 ) ) ( not ( = ?auto_70121 ?auto_70124 ) ) ( not ( = ?auto_70121 ?auto_70125 ) ) ( not ( = ?auto_70121 ?auto_70126 ) ) ( not ( = ?auto_70121 ?auto_70127 ) ) ( not ( = ?auto_70122 ?auto_70123 ) ) ( not ( = ?auto_70122 ?auto_70124 ) ) ( not ( = ?auto_70122 ?auto_70125 ) ) ( not ( = ?auto_70122 ?auto_70126 ) ) ( not ( = ?auto_70122 ?auto_70127 ) ) ( not ( = ?auto_70123 ?auto_70124 ) ) ( not ( = ?auto_70123 ?auto_70125 ) ) ( not ( = ?auto_70123 ?auto_70126 ) ) ( not ( = ?auto_70123 ?auto_70127 ) ) ( not ( = ?auto_70124 ?auto_70125 ) ) ( not ( = ?auto_70124 ?auto_70126 ) ) ( not ( = ?auto_70124 ?auto_70127 ) ) ( not ( = ?auto_70125 ?auto_70126 ) ) ( not ( = ?auto_70125 ?auto_70127 ) ) ( not ( = ?auto_70126 ?auto_70127 ) ) ( ON ?auto_70125 ?auto_70126 ) ( CLEAR ?auto_70123 ) ( ON ?auto_70124 ?auto_70125 ) ( CLEAR ?auto_70124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70121 ?auto_70122 ?auto_70123 ?auto_70124 )
      ( MAKE-6PILE ?auto_70121 ?auto_70122 ?auto_70123 ?auto_70124 ?auto_70125 ?auto_70126 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70134 - BLOCK
      ?auto_70135 - BLOCK
      ?auto_70136 - BLOCK
      ?auto_70137 - BLOCK
      ?auto_70138 - BLOCK
      ?auto_70139 - BLOCK
    )
    :vars
    (
      ?auto_70140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70139 ?auto_70140 ) ( ON-TABLE ?auto_70134 ) ( ON ?auto_70135 ?auto_70134 ) ( not ( = ?auto_70134 ?auto_70135 ) ) ( not ( = ?auto_70134 ?auto_70136 ) ) ( not ( = ?auto_70134 ?auto_70137 ) ) ( not ( = ?auto_70134 ?auto_70138 ) ) ( not ( = ?auto_70134 ?auto_70139 ) ) ( not ( = ?auto_70134 ?auto_70140 ) ) ( not ( = ?auto_70135 ?auto_70136 ) ) ( not ( = ?auto_70135 ?auto_70137 ) ) ( not ( = ?auto_70135 ?auto_70138 ) ) ( not ( = ?auto_70135 ?auto_70139 ) ) ( not ( = ?auto_70135 ?auto_70140 ) ) ( not ( = ?auto_70136 ?auto_70137 ) ) ( not ( = ?auto_70136 ?auto_70138 ) ) ( not ( = ?auto_70136 ?auto_70139 ) ) ( not ( = ?auto_70136 ?auto_70140 ) ) ( not ( = ?auto_70137 ?auto_70138 ) ) ( not ( = ?auto_70137 ?auto_70139 ) ) ( not ( = ?auto_70137 ?auto_70140 ) ) ( not ( = ?auto_70138 ?auto_70139 ) ) ( not ( = ?auto_70138 ?auto_70140 ) ) ( not ( = ?auto_70139 ?auto_70140 ) ) ( ON ?auto_70138 ?auto_70139 ) ( ON ?auto_70137 ?auto_70138 ) ( CLEAR ?auto_70135 ) ( ON ?auto_70136 ?auto_70137 ) ( CLEAR ?auto_70136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70134 ?auto_70135 ?auto_70136 )
      ( MAKE-6PILE ?auto_70134 ?auto_70135 ?auto_70136 ?auto_70137 ?auto_70138 ?auto_70139 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70147 - BLOCK
      ?auto_70148 - BLOCK
      ?auto_70149 - BLOCK
      ?auto_70150 - BLOCK
      ?auto_70151 - BLOCK
      ?auto_70152 - BLOCK
    )
    :vars
    (
      ?auto_70153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70152 ?auto_70153 ) ( ON-TABLE ?auto_70147 ) ( ON ?auto_70148 ?auto_70147 ) ( not ( = ?auto_70147 ?auto_70148 ) ) ( not ( = ?auto_70147 ?auto_70149 ) ) ( not ( = ?auto_70147 ?auto_70150 ) ) ( not ( = ?auto_70147 ?auto_70151 ) ) ( not ( = ?auto_70147 ?auto_70152 ) ) ( not ( = ?auto_70147 ?auto_70153 ) ) ( not ( = ?auto_70148 ?auto_70149 ) ) ( not ( = ?auto_70148 ?auto_70150 ) ) ( not ( = ?auto_70148 ?auto_70151 ) ) ( not ( = ?auto_70148 ?auto_70152 ) ) ( not ( = ?auto_70148 ?auto_70153 ) ) ( not ( = ?auto_70149 ?auto_70150 ) ) ( not ( = ?auto_70149 ?auto_70151 ) ) ( not ( = ?auto_70149 ?auto_70152 ) ) ( not ( = ?auto_70149 ?auto_70153 ) ) ( not ( = ?auto_70150 ?auto_70151 ) ) ( not ( = ?auto_70150 ?auto_70152 ) ) ( not ( = ?auto_70150 ?auto_70153 ) ) ( not ( = ?auto_70151 ?auto_70152 ) ) ( not ( = ?auto_70151 ?auto_70153 ) ) ( not ( = ?auto_70152 ?auto_70153 ) ) ( ON ?auto_70151 ?auto_70152 ) ( ON ?auto_70150 ?auto_70151 ) ( CLEAR ?auto_70148 ) ( ON ?auto_70149 ?auto_70150 ) ( CLEAR ?auto_70149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70147 ?auto_70148 ?auto_70149 )
      ( MAKE-6PILE ?auto_70147 ?auto_70148 ?auto_70149 ?auto_70150 ?auto_70151 ?auto_70152 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70160 - BLOCK
      ?auto_70161 - BLOCK
      ?auto_70162 - BLOCK
      ?auto_70163 - BLOCK
      ?auto_70164 - BLOCK
      ?auto_70165 - BLOCK
    )
    :vars
    (
      ?auto_70166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70165 ?auto_70166 ) ( ON-TABLE ?auto_70160 ) ( not ( = ?auto_70160 ?auto_70161 ) ) ( not ( = ?auto_70160 ?auto_70162 ) ) ( not ( = ?auto_70160 ?auto_70163 ) ) ( not ( = ?auto_70160 ?auto_70164 ) ) ( not ( = ?auto_70160 ?auto_70165 ) ) ( not ( = ?auto_70160 ?auto_70166 ) ) ( not ( = ?auto_70161 ?auto_70162 ) ) ( not ( = ?auto_70161 ?auto_70163 ) ) ( not ( = ?auto_70161 ?auto_70164 ) ) ( not ( = ?auto_70161 ?auto_70165 ) ) ( not ( = ?auto_70161 ?auto_70166 ) ) ( not ( = ?auto_70162 ?auto_70163 ) ) ( not ( = ?auto_70162 ?auto_70164 ) ) ( not ( = ?auto_70162 ?auto_70165 ) ) ( not ( = ?auto_70162 ?auto_70166 ) ) ( not ( = ?auto_70163 ?auto_70164 ) ) ( not ( = ?auto_70163 ?auto_70165 ) ) ( not ( = ?auto_70163 ?auto_70166 ) ) ( not ( = ?auto_70164 ?auto_70165 ) ) ( not ( = ?auto_70164 ?auto_70166 ) ) ( not ( = ?auto_70165 ?auto_70166 ) ) ( ON ?auto_70164 ?auto_70165 ) ( ON ?auto_70163 ?auto_70164 ) ( ON ?auto_70162 ?auto_70163 ) ( CLEAR ?auto_70160 ) ( ON ?auto_70161 ?auto_70162 ) ( CLEAR ?auto_70161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70160 ?auto_70161 )
      ( MAKE-6PILE ?auto_70160 ?auto_70161 ?auto_70162 ?auto_70163 ?auto_70164 ?auto_70165 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70173 - BLOCK
      ?auto_70174 - BLOCK
      ?auto_70175 - BLOCK
      ?auto_70176 - BLOCK
      ?auto_70177 - BLOCK
      ?auto_70178 - BLOCK
    )
    :vars
    (
      ?auto_70179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70178 ?auto_70179 ) ( ON-TABLE ?auto_70173 ) ( not ( = ?auto_70173 ?auto_70174 ) ) ( not ( = ?auto_70173 ?auto_70175 ) ) ( not ( = ?auto_70173 ?auto_70176 ) ) ( not ( = ?auto_70173 ?auto_70177 ) ) ( not ( = ?auto_70173 ?auto_70178 ) ) ( not ( = ?auto_70173 ?auto_70179 ) ) ( not ( = ?auto_70174 ?auto_70175 ) ) ( not ( = ?auto_70174 ?auto_70176 ) ) ( not ( = ?auto_70174 ?auto_70177 ) ) ( not ( = ?auto_70174 ?auto_70178 ) ) ( not ( = ?auto_70174 ?auto_70179 ) ) ( not ( = ?auto_70175 ?auto_70176 ) ) ( not ( = ?auto_70175 ?auto_70177 ) ) ( not ( = ?auto_70175 ?auto_70178 ) ) ( not ( = ?auto_70175 ?auto_70179 ) ) ( not ( = ?auto_70176 ?auto_70177 ) ) ( not ( = ?auto_70176 ?auto_70178 ) ) ( not ( = ?auto_70176 ?auto_70179 ) ) ( not ( = ?auto_70177 ?auto_70178 ) ) ( not ( = ?auto_70177 ?auto_70179 ) ) ( not ( = ?auto_70178 ?auto_70179 ) ) ( ON ?auto_70177 ?auto_70178 ) ( ON ?auto_70176 ?auto_70177 ) ( ON ?auto_70175 ?auto_70176 ) ( CLEAR ?auto_70173 ) ( ON ?auto_70174 ?auto_70175 ) ( CLEAR ?auto_70174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70173 ?auto_70174 )
      ( MAKE-6PILE ?auto_70173 ?auto_70174 ?auto_70175 ?auto_70176 ?auto_70177 ?auto_70178 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70186 - BLOCK
      ?auto_70187 - BLOCK
      ?auto_70188 - BLOCK
      ?auto_70189 - BLOCK
      ?auto_70190 - BLOCK
      ?auto_70191 - BLOCK
    )
    :vars
    (
      ?auto_70192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70191 ?auto_70192 ) ( not ( = ?auto_70186 ?auto_70187 ) ) ( not ( = ?auto_70186 ?auto_70188 ) ) ( not ( = ?auto_70186 ?auto_70189 ) ) ( not ( = ?auto_70186 ?auto_70190 ) ) ( not ( = ?auto_70186 ?auto_70191 ) ) ( not ( = ?auto_70186 ?auto_70192 ) ) ( not ( = ?auto_70187 ?auto_70188 ) ) ( not ( = ?auto_70187 ?auto_70189 ) ) ( not ( = ?auto_70187 ?auto_70190 ) ) ( not ( = ?auto_70187 ?auto_70191 ) ) ( not ( = ?auto_70187 ?auto_70192 ) ) ( not ( = ?auto_70188 ?auto_70189 ) ) ( not ( = ?auto_70188 ?auto_70190 ) ) ( not ( = ?auto_70188 ?auto_70191 ) ) ( not ( = ?auto_70188 ?auto_70192 ) ) ( not ( = ?auto_70189 ?auto_70190 ) ) ( not ( = ?auto_70189 ?auto_70191 ) ) ( not ( = ?auto_70189 ?auto_70192 ) ) ( not ( = ?auto_70190 ?auto_70191 ) ) ( not ( = ?auto_70190 ?auto_70192 ) ) ( not ( = ?auto_70191 ?auto_70192 ) ) ( ON ?auto_70190 ?auto_70191 ) ( ON ?auto_70189 ?auto_70190 ) ( ON ?auto_70188 ?auto_70189 ) ( ON ?auto_70187 ?auto_70188 ) ( ON ?auto_70186 ?auto_70187 ) ( CLEAR ?auto_70186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70186 )
      ( MAKE-6PILE ?auto_70186 ?auto_70187 ?auto_70188 ?auto_70189 ?auto_70190 ?auto_70191 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70199 - BLOCK
      ?auto_70200 - BLOCK
      ?auto_70201 - BLOCK
      ?auto_70202 - BLOCK
      ?auto_70203 - BLOCK
      ?auto_70204 - BLOCK
    )
    :vars
    (
      ?auto_70205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70204 ?auto_70205 ) ( not ( = ?auto_70199 ?auto_70200 ) ) ( not ( = ?auto_70199 ?auto_70201 ) ) ( not ( = ?auto_70199 ?auto_70202 ) ) ( not ( = ?auto_70199 ?auto_70203 ) ) ( not ( = ?auto_70199 ?auto_70204 ) ) ( not ( = ?auto_70199 ?auto_70205 ) ) ( not ( = ?auto_70200 ?auto_70201 ) ) ( not ( = ?auto_70200 ?auto_70202 ) ) ( not ( = ?auto_70200 ?auto_70203 ) ) ( not ( = ?auto_70200 ?auto_70204 ) ) ( not ( = ?auto_70200 ?auto_70205 ) ) ( not ( = ?auto_70201 ?auto_70202 ) ) ( not ( = ?auto_70201 ?auto_70203 ) ) ( not ( = ?auto_70201 ?auto_70204 ) ) ( not ( = ?auto_70201 ?auto_70205 ) ) ( not ( = ?auto_70202 ?auto_70203 ) ) ( not ( = ?auto_70202 ?auto_70204 ) ) ( not ( = ?auto_70202 ?auto_70205 ) ) ( not ( = ?auto_70203 ?auto_70204 ) ) ( not ( = ?auto_70203 ?auto_70205 ) ) ( not ( = ?auto_70204 ?auto_70205 ) ) ( ON ?auto_70203 ?auto_70204 ) ( ON ?auto_70202 ?auto_70203 ) ( ON ?auto_70201 ?auto_70202 ) ( ON ?auto_70200 ?auto_70201 ) ( ON ?auto_70199 ?auto_70200 ) ( CLEAR ?auto_70199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70199 )
      ( MAKE-6PILE ?auto_70199 ?auto_70200 ?auto_70201 ?auto_70202 ?auto_70203 ?auto_70204 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_70213 - BLOCK
      ?auto_70214 - BLOCK
      ?auto_70215 - BLOCK
      ?auto_70216 - BLOCK
      ?auto_70217 - BLOCK
      ?auto_70218 - BLOCK
      ?auto_70219 - BLOCK
    )
    :vars
    (
      ?auto_70220 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_70218 ) ( ON ?auto_70219 ?auto_70220 ) ( CLEAR ?auto_70219 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70213 ) ( ON ?auto_70214 ?auto_70213 ) ( ON ?auto_70215 ?auto_70214 ) ( ON ?auto_70216 ?auto_70215 ) ( ON ?auto_70217 ?auto_70216 ) ( ON ?auto_70218 ?auto_70217 ) ( not ( = ?auto_70213 ?auto_70214 ) ) ( not ( = ?auto_70213 ?auto_70215 ) ) ( not ( = ?auto_70213 ?auto_70216 ) ) ( not ( = ?auto_70213 ?auto_70217 ) ) ( not ( = ?auto_70213 ?auto_70218 ) ) ( not ( = ?auto_70213 ?auto_70219 ) ) ( not ( = ?auto_70213 ?auto_70220 ) ) ( not ( = ?auto_70214 ?auto_70215 ) ) ( not ( = ?auto_70214 ?auto_70216 ) ) ( not ( = ?auto_70214 ?auto_70217 ) ) ( not ( = ?auto_70214 ?auto_70218 ) ) ( not ( = ?auto_70214 ?auto_70219 ) ) ( not ( = ?auto_70214 ?auto_70220 ) ) ( not ( = ?auto_70215 ?auto_70216 ) ) ( not ( = ?auto_70215 ?auto_70217 ) ) ( not ( = ?auto_70215 ?auto_70218 ) ) ( not ( = ?auto_70215 ?auto_70219 ) ) ( not ( = ?auto_70215 ?auto_70220 ) ) ( not ( = ?auto_70216 ?auto_70217 ) ) ( not ( = ?auto_70216 ?auto_70218 ) ) ( not ( = ?auto_70216 ?auto_70219 ) ) ( not ( = ?auto_70216 ?auto_70220 ) ) ( not ( = ?auto_70217 ?auto_70218 ) ) ( not ( = ?auto_70217 ?auto_70219 ) ) ( not ( = ?auto_70217 ?auto_70220 ) ) ( not ( = ?auto_70218 ?auto_70219 ) ) ( not ( = ?auto_70218 ?auto_70220 ) ) ( not ( = ?auto_70219 ?auto_70220 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70219 ?auto_70220 )
      ( !STACK ?auto_70219 ?auto_70218 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_70228 - BLOCK
      ?auto_70229 - BLOCK
      ?auto_70230 - BLOCK
      ?auto_70231 - BLOCK
      ?auto_70232 - BLOCK
      ?auto_70233 - BLOCK
      ?auto_70234 - BLOCK
    )
    :vars
    (
      ?auto_70235 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_70233 ) ( ON ?auto_70234 ?auto_70235 ) ( CLEAR ?auto_70234 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70228 ) ( ON ?auto_70229 ?auto_70228 ) ( ON ?auto_70230 ?auto_70229 ) ( ON ?auto_70231 ?auto_70230 ) ( ON ?auto_70232 ?auto_70231 ) ( ON ?auto_70233 ?auto_70232 ) ( not ( = ?auto_70228 ?auto_70229 ) ) ( not ( = ?auto_70228 ?auto_70230 ) ) ( not ( = ?auto_70228 ?auto_70231 ) ) ( not ( = ?auto_70228 ?auto_70232 ) ) ( not ( = ?auto_70228 ?auto_70233 ) ) ( not ( = ?auto_70228 ?auto_70234 ) ) ( not ( = ?auto_70228 ?auto_70235 ) ) ( not ( = ?auto_70229 ?auto_70230 ) ) ( not ( = ?auto_70229 ?auto_70231 ) ) ( not ( = ?auto_70229 ?auto_70232 ) ) ( not ( = ?auto_70229 ?auto_70233 ) ) ( not ( = ?auto_70229 ?auto_70234 ) ) ( not ( = ?auto_70229 ?auto_70235 ) ) ( not ( = ?auto_70230 ?auto_70231 ) ) ( not ( = ?auto_70230 ?auto_70232 ) ) ( not ( = ?auto_70230 ?auto_70233 ) ) ( not ( = ?auto_70230 ?auto_70234 ) ) ( not ( = ?auto_70230 ?auto_70235 ) ) ( not ( = ?auto_70231 ?auto_70232 ) ) ( not ( = ?auto_70231 ?auto_70233 ) ) ( not ( = ?auto_70231 ?auto_70234 ) ) ( not ( = ?auto_70231 ?auto_70235 ) ) ( not ( = ?auto_70232 ?auto_70233 ) ) ( not ( = ?auto_70232 ?auto_70234 ) ) ( not ( = ?auto_70232 ?auto_70235 ) ) ( not ( = ?auto_70233 ?auto_70234 ) ) ( not ( = ?auto_70233 ?auto_70235 ) ) ( not ( = ?auto_70234 ?auto_70235 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70234 ?auto_70235 )
      ( !STACK ?auto_70234 ?auto_70233 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_70243 - BLOCK
      ?auto_70244 - BLOCK
      ?auto_70245 - BLOCK
      ?auto_70246 - BLOCK
      ?auto_70247 - BLOCK
      ?auto_70248 - BLOCK
      ?auto_70249 - BLOCK
    )
    :vars
    (
      ?auto_70250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70249 ?auto_70250 ) ( ON-TABLE ?auto_70243 ) ( ON ?auto_70244 ?auto_70243 ) ( ON ?auto_70245 ?auto_70244 ) ( ON ?auto_70246 ?auto_70245 ) ( ON ?auto_70247 ?auto_70246 ) ( not ( = ?auto_70243 ?auto_70244 ) ) ( not ( = ?auto_70243 ?auto_70245 ) ) ( not ( = ?auto_70243 ?auto_70246 ) ) ( not ( = ?auto_70243 ?auto_70247 ) ) ( not ( = ?auto_70243 ?auto_70248 ) ) ( not ( = ?auto_70243 ?auto_70249 ) ) ( not ( = ?auto_70243 ?auto_70250 ) ) ( not ( = ?auto_70244 ?auto_70245 ) ) ( not ( = ?auto_70244 ?auto_70246 ) ) ( not ( = ?auto_70244 ?auto_70247 ) ) ( not ( = ?auto_70244 ?auto_70248 ) ) ( not ( = ?auto_70244 ?auto_70249 ) ) ( not ( = ?auto_70244 ?auto_70250 ) ) ( not ( = ?auto_70245 ?auto_70246 ) ) ( not ( = ?auto_70245 ?auto_70247 ) ) ( not ( = ?auto_70245 ?auto_70248 ) ) ( not ( = ?auto_70245 ?auto_70249 ) ) ( not ( = ?auto_70245 ?auto_70250 ) ) ( not ( = ?auto_70246 ?auto_70247 ) ) ( not ( = ?auto_70246 ?auto_70248 ) ) ( not ( = ?auto_70246 ?auto_70249 ) ) ( not ( = ?auto_70246 ?auto_70250 ) ) ( not ( = ?auto_70247 ?auto_70248 ) ) ( not ( = ?auto_70247 ?auto_70249 ) ) ( not ( = ?auto_70247 ?auto_70250 ) ) ( not ( = ?auto_70248 ?auto_70249 ) ) ( not ( = ?auto_70248 ?auto_70250 ) ) ( not ( = ?auto_70249 ?auto_70250 ) ) ( CLEAR ?auto_70247 ) ( ON ?auto_70248 ?auto_70249 ) ( CLEAR ?auto_70248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70243 ?auto_70244 ?auto_70245 ?auto_70246 ?auto_70247 ?auto_70248 )
      ( MAKE-7PILE ?auto_70243 ?auto_70244 ?auto_70245 ?auto_70246 ?auto_70247 ?auto_70248 ?auto_70249 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_70258 - BLOCK
      ?auto_70259 - BLOCK
      ?auto_70260 - BLOCK
      ?auto_70261 - BLOCK
      ?auto_70262 - BLOCK
      ?auto_70263 - BLOCK
      ?auto_70264 - BLOCK
    )
    :vars
    (
      ?auto_70265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70264 ?auto_70265 ) ( ON-TABLE ?auto_70258 ) ( ON ?auto_70259 ?auto_70258 ) ( ON ?auto_70260 ?auto_70259 ) ( ON ?auto_70261 ?auto_70260 ) ( ON ?auto_70262 ?auto_70261 ) ( not ( = ?auto_70258 ?auto_70259 ) ) ( not ( = ?auto_70258 ?auto_70260 ) ) ( not ( = ?auto_70258 ?auto_70261 ) ) ( not ( = ?auto_70258 ?auto_70262 ) ) ( not ( = ?auto_70258 ?auto_70263 ) ) ( not ( = ?auto_70258 ?auto_70264 ) ) ( not ( = ?auto_70258 ?auto_70265 ) ) ( not ( = ?auto_70259 ?auto_70260 ) ) ( not ( = ?auto_70259 ?auto_70261 ) ) ( not ( = ?auto_70259 ?auto_70262 ) ) ( not ( = ?auto_70259 ?auto_70263 ) ) ( not ( = ?auto_70259 ?auto_70264 ) ) ( not ( = ?auto_70259 ?auto_70265 ) ) ( not ( = ?auto_70260 ?auto_70261 ) ) ( not ( = ?auto_70260 ?auto_70262 ) ) ( not ( = ?auto_70260 ?auto_70263 ) ) ( not ( = ?auto_70260 ?auto_70264 ) ) ( not ( = ?auto_70260 ?auto_70265 ) ) ( not ( = ?auto_70261 ?auto_70262 ) ) ( not ( = ?auto_70261 ?auto_70263 ) ) ( not ( = ?auto_70261 ?auto_70264 ) ) ( not ( = ?auto_70261 ?auto_70265 ) ) ( not ( = ?auto_70262 ?auto_70263 ) ) ( not ( = ?auto_70262 ?auto_70264 ) ) ( not ( = ?auto_70262 ?auto_70265 ) ) ( not ( = ?auto_70263 ?auto_70264 ) ) ( not ( = ?auto_70263 ?auto_70265 ) ) ( not ( = ?auto_70264 ?auto_70265 ) ) ( CLEAR ?auto_70262 ) ( ON ?auto_70263 ?auto_70264 ) ( CLEAR ?auto_70263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70258 ?auto_70259 ?auto_70260 ?auto_70261 ?auto_70262 ?auto_70263 )
      ( MAKE-7PILE ?auto_70258 ?auto_70259 ?auto_70260 ?auto_70261 ?auto_70262 ?auto_70263 ?auto_70264 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_70273 - BLOCK
      ?auto_70274 - BLOCK
      ?auto_70275 - BLOCK
      ?auto_70276 - BLOCK
      ?auto_70277 - BLOCK
      ?auto_70278 - BLOCK
      ?auto_70279 - BLOCK
    )
    :vars
    (
      ?auto_70280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70279 ?auto_70280 ) ( ON-TABLE ?auto_70273 ) ( ON ?auto_70274 ?auto_70273 ) ( ON ?auto_70275 ?auto_70274 ) ( ON ?auto_70276 ?auto_70275 ) ( not ( = ?auto_70273 ?auto_70274 ) ) ( not ( = ?auto_70273 ?auto_70275 ) ) ( not ( = ?auto_70273 ?auto_70276 ) ) ( not ( = ?auto_70273 ?auto_70277 ) ) ( not ( = ?auto_70273 ?auto_70278 ) ) ( not ( = ?auto_70273 ?auto_70279 ) ) ( not ( = ?auto_70273 ?auto_70280 ) ) ( not ( = ?auto_70274 ?auto_70275 ) ) ( not ( = ?auto_70274 ?auto_70276 ) ) ( not ( = ?auto_70274 ?auto_70277 ) ) ( not ( = ?auto_70274 ?auto_70278 ) ) ( not ( = ?auto_70274 ?auto_70279 ) ) ( not ( = ?auto_70274 ?auto_70280 ) ) ( not ( = ?auto_70275 ?auto_70276 ) ) ( not ( = ?auto_70275 ?auto_70277 ) ) ( not ( = ?auto_70275 ?auto_70278 ) ) ( not ( = ?auto_70275 ?auto_70279 ) ) ( not ( = ?auto_70275 ?auto_70280 ) ) ( not ( = ?auto_70276 ?auto_70277 ) ) ( not ( = ?auto_70276 ?auto_70278 ) ) ( not ( = ?auto_70276 ?auto_70279 ) ) ( not ( = ?auto_70276 ?auto_70280 ) ) ( not ( = ?auto_70277 ?auto_70278 ) ) ( not ( = ?auto_70277 ?auto_70279 ) ) ( not ( = ?auto_70277 ?auto_70280 ) ) ( not ( = ?auto_70278 ?auto_70279 ) ) ( not ( = ?auto_70278 ?auto_70280 ) ) ( not ( = ?auto_70279 ?auto_70280 ) ) ( ON ?auto_70278 ?auto_70279 ) ( CLEAR ?auto_70276 ) ( ON ?auto_70277 ?auto_70278 ) ( CLEAR ?auto_70277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70273 ?auto_70274 ?auto_70275 ?auto_70276 ?auto_70277 )
      ( MAKE-7PILE ?auto_70273 ?auto_70274 ?auto_70275 ?auto_70276 ?auto_70277 ?auto_70278 ?auto_70279 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_70288 - BLOCK
      ?auto_70289 - BLOCK
      ?auto_70290 - BLOCK
      ?auto_70291 - BLOCK
      ?auto_70292 - BLOCK
      ?auto_70293 - BLOCK
      ?auto_70294 - BLOCK
    )
    :vars
    (
      ?auto_70295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70294 ?auto_70295 ) ( ON-TABLE ?auto_70288 ) ( ON ?auto_70289 ?auto_70288 ) ( ON ?auto_70290 ?auto_70289 ) ( ON ?auto_70291 ?auto_70290 ) ( not ( = ?auto_70288 ?auto_70289 ) ) ( not ( = ?auto_70288 ?auto_70290 ) ) ( not ( = ?auto_70288 ?auto_70291 ) ) ( not ( = ?auto_70288 ?auto_70292 ) ) ( not ( = ?auto_70288 ?auto_70293 ) ) ( not ( = ?auto_70288 ?auto_70294 ) ) ( not ( = ?auto_70288 ?auto_70295 ) ) ( not ( = ?auto_70289 ?auto_70290 ) ) ( not ( = ?auto_70289 ?auto_70291 ) ) ( not ( = ?auto_70289 ?auto_70292 ) ) ( not ( = ?auto_70289 ?auto_70293 ) ) ( not ( = ?auto_70289 ?auto_70294 ) ) ( not ( = ?auto_70289 ?auto_70295 ) ) ( not ( = ?auto_70290 ?auto_70291 ) ) ( not ( = ?auto_70290 ?auto_70292 ) ) ( not ( = ?auto_70290 ?auto_70293 ) ) ( not ( = ?auto_70290 ?auto_70294 ) ) ( not ( = ?auto_70290 ?auto_70295 ) ) ( not ( = ?auto_70291 ?auto_70292 ) ) ( not ( = ?auto_70291 ?auto_70293 ) ) ( not ( = ?auto_70291 ?auto_70294 ) ) ( not ( = ?auto_70291 ?auto_70295 ) ) ( not ( = ?auto_70292 ?auto_70293 ) ) ( not ( = ?auto_70292 ?auto_70294 ) ) ( not ( = ?auto_70292 ?auto_70295 ) ) ( not ( = ?auto_70293 ?auto_70294 ) ) ( not ( = ?auto_70293 ?auto_70295 ) ) ( not ( = ?auto_70294 ?auto_70295 ) ) ( ON ?auto_70293 ?auto_70294 ) ( CLEAR ?auto_70291 ) ( ON ?auto_70292 ?auto_70293 ) ( CLEAR ?auto_70292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70288 ?auto_70289 ?auto_70290 ?auto_70291 ?auto_70292 )
      ( MAKE-7PILE ?auto_70288 ?auto_70289 ?auto_70290 ?auto_70291 ?auto_70292 ?auto_70293 ?auto_70294 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_70303 - BLOCK
      ?auto_70304 - BLOCK
      ?auto_70305 - BLOCK
      ?auto_70306 - BLOCK
      ?auto_70307 - BLOCK
      ?auto_70308 - BLOCK
      ?auto_70309 - BLOCK
    )
    :vars
    (
      ?auto_70310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70309 ?auto_70310 ) ( ON-TABLE ?auto_70303 ) ( ON ?auto_70304 ?auto_70303 ) ( ON ?auto_70305 ?auto_70304 ) ( not ( = ?auto_70303 ?auto_70304 ) ) ( not ( = ?auto_70303 ?auto_70305 ) ) ( not ( = ?auto_70303 ?auto_70306 ) ) ( not ( = ?auto_70303 ?auto_70307 ) ) ( not ( = ?auto_70303 ?auto_70308 ) ) ( not ( = ?auto_70303 ?auto_70309 ) ) ( not ( = ?auto_70303 ?auto_70310 ) ) ( not ( = ?auto_70304 ?auto_70305 ) ) ( not ( = ?auto_70304 ?auto_70306 ) ) ( not ( = ?auto_70304 ?auto_70307 ) ) ( not ( = ?auto_70304 ?auto_70308 ) ) ( not ( = ?auto_70304 ?auto_70309 ) ) ( not ( = ?auto_70304 ?auto_70310 ) ) ( not ( = ?auto_70305 ?auto_70306 ) ) ( not ( = ?auto_70305 ?auto_70307 ) ) ( not ( = ?auto_70305 ?auto_70308 ) ) ( not ( = ?auto_70305 ?auto_70309 ) ) ( not ( = ?auto_70305 ?auto_70310 ) ) ( not ( = ?auto_70306 ?auto_70307 ) ) ( not ( = ?auto_70306 ?auto_70308 ) ) ( not ( = ?auto_70306 ?auto_70309 ) ) ( not ( = ?auto_70306 ?auto_70310 ) ) ( not ( = ?auto_70307 ?auto_70308 ) ) ( not ( = ?auto_70307 ?auto_70309 ) ) ( not ( = ?auto_70307 ?auto_70310 ) ) ( not ( = ?auto_70308 ?auto_70309 ) ) ( not ( = ?auto_70308 ?auto_70310 ) ) ( not ( = ?auto_70309 ?auto_70310 ) ) ( ON ?auto_70308 ?auto_70309 ) ( ON ?auto_70307 ?auto_70308 ) ( CLEAR ?auto_70305 ) ( ON ?auto_70306 ?auto_70307 ) ( CLEAR ?auto_70306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70303 ?auto_70304 ?auto_70305 ?auto_70306 )
      ( MAKE-7PILE ?auto_70303 ?auto_70304 ?auto_70305 ?auto_70306 ?auto_70307 ?auto_70308 ?auto_70309 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_70318 - BLOCK
      ?auto_70319 - BLOCK
      ?auto_70320 - BLOCK
      ?auto_70321 - BLOCK
      ?auto_70322 - BLOCK
      ?auto_70323 - BLOCK
      ?auto_70324 - BLOCK
    )
    :vars
    (
      ?auto_70325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70324 ?auto_70325 ) ( ON-TABLE ?auto_70318 ) ( ON ?auto_70319 ?auto_70318 ) ( ON ?auto_70320 ?auto_70319 ) ( not ( = ?auto_70318 ?auto_70319 ) ) ( not ( = ?auto_70318 ?auto_70320 ) ) ( not ( = ?auto_70318 ?auto_70321 ) ) ( not ( = ?auto_70318 ?auto_70322 ) ) ( not ( = ?auto_70318 ?auto_70323 ) ) ( not ( = ?auto_70318 ?auto_70324 ) ) ( not ( = ?auto_70318 ?auto_70325 ) ) ( not ( = ?auto_70319 ?auto_70320 ) ) ( not ( = ?auto_70319 ?auto_70321 ) ) ( not ( = ?auto_70319 ?auto_70322 ) ) ( not ( = ?auto_70319 ?auto_70323 ) ) ( not ( = ?auto_70319 ?auto_70324 ) ) ( not ( = ?auto_70319 ?auto_70325 ) ) ( not ( = ?auto_70320 ?auto_70321 ) ) ( not ( = ?auto_70320 ?auto_70322 ) ) ( not ( = ?auto_70320 ?auto_70323 ) ) ( not ( = ?auto_70320 ?auto_70324 ) ) ( not ( = ?auto_70320 ?auto_70325 ) ) ( not ( = ?auto_70321 ?auto_70322 ) ) ( not ( = ?auto_70321 ?auto_70323 ) ) ( not ( = ?auto_70321 ?auto_70324 ) ) ( not ( = ?auto_70321 ?auto_70325 ) ) ( not ( = ?auto_70322 ?auto_70323 ) ) ( not ( = ?auto_70322 ?auto_70324 ) ) ( not ( = ?auto_70322 ?auto_70325 ) ) ( not ( = ?auto_70323 ?auto_70324 ) ) ( not ( = ?auto_70323 ?auto_70325 ) ) ( not ( = ?auto_70324 ?auto_70325 ) ) ( ON ?auto_70323 ?auto_70324 ) ( ON ?auto_70322 ?auto_70323 ) ( CLEAR ?auto_70320 ) ( ON ?auto_70321 ?auto_70322 ) ( CLEAR ?auto_70321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70318 ?auto_70319 ?auto_70320 ?auto_70321 )
      ( MAKE-7PILE ?auto_70318 ?auto_70319 ?auto_70320 ?auto_70321 ?auto_70322 ?auto_70323 ?auto_70324 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_70333 - BLOCK
      ?auto_70334 - BLOCK
      ?auto_70335 - BLOCK
      ?auto_70336 - BLOCK
      ?auto_70337 - BLOCK
      ?auto_70338 - BLOCK
      ?auto_70339 - BLOCK
    )
    :vars
    (
      ?auto_70340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70339 ?auto_70340 ) ( ON-TABLE ?auto_70333 ) ( ON ?auto_70334 ?auto_70333 ) ( not ( = ?auto_70333 ?auto_70334 ) ) ( not ( = ?auto_70333 ?auto_70335 ) ) ( not ( = ?auto_70333 ?auto_70336 ) ) ( not ( = ?auto_70333 ?auto_70337 ) ) ( not ( = ?auto_70333 ?auto_70338 ) ) ( not ( = ?auto_70333 ?auto_70339 ) ) ( not ( = ?auto_70333 ?auto_70340 ) ) ( not ( = ?auto_70334 ?auto_70335 ) ) ( not ( = ?auto_70334 ?auto_70336 ) ) ( not ( = ?auto_70334 ?auto_70337 ) ) ( not ( = ?auto_70334 ?auto_70338 ) ) ( not ( = ?auto_70334 ?auto_70339 ) ) ( not ( = ?auto_70334 ?auto_70340 ) ) ( not ( = ?auto_70335 ?auto_70336 ) ) ( not ( = ?auto_70335 ?auto_70337 ) ) ( not ( = ?auto_70335 ?auto_70338 ) ) ( not ( = ?auto_70335 ?auto_70339 ) ) ( not ( = ?auto_70335 ?auto_70340 ) ) ( not ( = ?auto_70336 ?auto_70337 ) ) ( not ( = ?auto_70336 ?auto_70338 ) ) ( not ( = ?auto_70336 ?auto_70339 ) ) ( not ( = ?auto_70336 ?auto_70340 ) ) ( not ( = ?auto_70337 ?auto_70338 ) ) ( not ( = ?auto_70337 ?auto_70339 ) ) ( not ( = ?auto_70337 ?auto_70340 ) ) ( not ( = ?auto_70338 ?auto_70339 ) ) ( not ( = ?auto_70338 ?auto_70340 ) ) ( not ( = ?auto_70339 ?auto_70340 ) ) ( ON ?auto_70338 ?auto_70339 ) ( ON ?auto_70337 ?auto_70338 ) ( ON ?auto_70336 ?auto_70337 ) ( CLEAR ?auto_70334 ) ( ON ?auto_70335 ?auto_70336 ) ( CLEAR ?auto_70335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70333 ?auto_70334 ?auto_70335 )
      ( MAKE-7PILE ?auto_70333 ?auto_70334 ?auto_70335 ?auto_70336 ?auto_70337 ?auto_70338 ?auto_70339 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_70348 - BLOCK
      ?auto_70349 - BLOCK
      ?auto_70350 - BLOCK
      ?auto_70351 - BLOCK
      ?auto_70352 - BLOCK
      ?auto_70353 - BLOCK
      ?auto_70354 - BLOCK
    )
    :vars
    (
      ?auto_70355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70354 ?auto_70355 ) ( ON-TABLE ?auto_70348 ) ( ON ?auto_70349 ?auto_70348 ) ( not ( = ?auto_70348 ?auto_70349 ) ) ( not ( = ?auto_70348 ?auto_70350 ) ) ( not ( = ?auto_70348 ?auto_70351 ) ) ( not ( = ?auto_70348 ?auto_70352 ) ) ( not ( = ?auto_70348 ?auto_70353 ) ) ( not ( = ?auto_70348 ?auto_70354 ) ) ( not ( = ?auto_70348 ?auto_70355 ) ) ( not ( = ?auto_70349 ?auto_70350 ) ) ( not ( = ?auto_70349 ?auto_70351 ) ) ( not ( = ?auto_70349 ?auto_70352 ) ) ( not ( = ?auto_70349 ?auto_70353 ) ) ( not ( = ?auto_70349 ?auto_70354 ) ) ( not ( = ?auto_70349 ?auto_70355 ) ) ( not ( = ?auto_70350 ?auto_70351 ) ) ( not ( = ?auto_70350 ?auto_70352 ) ) ( not ( = ?auto_70350 ?auto_70353 ) ) ( not ( = ?auto_70350 ?auto_70354 ) ) ( not ( = ?auto_70350 ?auto_70355 ) ) ( not ( = ?auto_70351 ?auto_70352 ) ) ( not ( = ?auto_70351 ?auto_70353 ) ) ( not ( = ?auto_70351 ?auto_70354 ) ) ( not ( = ?auto_70351 ?auto_70355 ) ) ( not ( = ?auto_70352 ?auto_70353 ) ) ( not ( = ?auto_70352 ?auto_70354 ) ) ( not ( = ?auto_70352 ?auto_70355 ) ) ( not ( = ?auto_70353 ?auto_70354 ) ) ( not ( = ?auto_70353 ?auto_70355 ) ) ( not ( = ?auto_70354 ?auto_70355 ) ) ( ON ?auto_70353 ?auto_70354 ) ( ON ?auto_70352 ?auto_70353 ) ( ON ?auto_70351 ?auto_70352 ) ( CLEAR ?auto_70349 ) ( ON ?auto_70350 ?auto_70351 ) ( CLEAR ?auto_70350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70348 ?auto_70349 ?auto_70350 )
      ( MAKE-7PILE ?auto_70348 ?auto_70349 ?auto_70350 ?auto_70351 ?auto_70352 ?auto_70353 ?auto_70354 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_70363 - BLOCK
      ?auto_70364 - BLOCK
      ?auto_70365 - BLOCK
      ?auto_70366 - BLOCK
      ?auto_70367 - BLOCK
      ?auto_70368 - BLOCK
      ?auto_70369 - BLOCK
    )
    :vars
    (
      ?auto_70370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70369 ?auto_70370 ) ( ON-TABLE ?auto_70363 ) ( not ( = ?auto_70363 ?auto_70364 ) ) ( not ( = ?auto_70363 ?auto_70365 ) ) ( not ( = ?auto_70363 ?auto_70366 ) ) ( not ( = ?auto_70363 ?auto_70367 ) ) ( not ( = ?auto_70363 ?auto_70368 ) ) ( not ( = ?auto_70363 ?auto_70369 ) ) ( not ( = ?auto_70363 ?auto_70370 ) ) ( not ( = ?auto_70364 ?auto_70365 ) ) ( not ( = ?auto_70364 ?auto_70366 ) ) ( not ( = ?auto_70364 ?auto_70367 ) ) ( not ( = ?auto_70364 ?auto_70368 ) ) ( not ( = ?auto_70364 ?auto_70369 ) ) ( not ( = ?auto_70364 ?auto_70370 ) ) ( not ( = ?auto_70365 ?auto_70366 ) ) ( not ( = ?auto_70365 ?auto_70367 ) ) ( not ( = ?auto_70365 ?auto_70368 ) ) ( not ( = ?auto_70365 ?auto_70369 ) ) ( not ( = ?auto_70365 ?auto_70370 ) ) ( not ( = ?auto_70366 ?auto_70367 ) ) ( not ( = ?auto_70366 ?auto_70368 ) ) ( not ( = ?auto_70366 ?auto_70369 ) ) ( not ( = ?auto_70366 ?auto_70370 ) ) ( not ( = ?auto_70367 ?auto_70368 ) ) ( not ( = ?auto_70367 ?auto_70369 ) ) ( not ( = ?auto_70367 ?auto_70370 ) ) ( not ( = ?auto_70368 ?auto_70369 ) ) ( not ( = ?auto_70368 ?auto_70370 ) ) ( not ( = ?auto_70369 ?auto_70370 ) ) ( ON ?auto_70368 ?auto_70369 ) ( ON ?auto_70367 ?auto_70368 ) ( ON ?auto_70366 ?auto_70367 ) ( ON ?auto_70365 ?auto_70366 ) ( CLEAR ?auto_70363 ) ( ON ?auto_70364 ?auto_70365 ) ( CLEAR ?auto_70364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70363 ?auto_70364 )
      ( MAKE-7PILE ?auto_70363 ?auto_70364 ?auto_70365 ?auto_70366 ?auto_70367 ?auto_70368 ?auto_70369 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_70378 - BLOCK
      ?auto_70379 - BLOCK
      ?auto_70380 - BLOCK
      ?auto_70381 - BLOCK
      ?auto_70382 - BLOCK
      ?auto_70383 - BLOCK
      ?auto_70384 - BLOCK
    )
    :vars
    (
      ?auto_70385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70384 ?auto_70385 ) ( ON-TABLE ?auto_70378 ) ( not ( = ?auto_70378 ?auto_70379 ) ) ( not ( = ?auto_70378 ?auto_70380 ) ) ( not ( = ?auto_70378 ?auto_70381 ) ) ( not ( = ?auto_70378 ?auto_70382 ) ) ( not ( = ?auto_70378 ?auto_70383 ) ) ( not ( = ?auto_70378 ?auto_70384 ) ) ( not ( = ?auto_70378 ?auto_70385 ) ) ( not ( = ?auto_70379 ?auto_70380 ) ) ( not ( = ?auto_70379 ?auto_70381 ) ) ( not ( = ?auto_70379 ?auto_70382 ) ) ( not ( = ?auto_70379 ?auto_70383 ) ) ( not ( = ?auto_70379 ?auto_70384 ) ) ( not ( = ?auto_70379 ?auto_70385 ) ) ( not ( = ?auto_70380 ?auto_70381 ) ) ( not ( = ?auto_70380 ?auto_70382 ) ) ( not ( = ?auto_70380 ?auto_70383 ) ) ( not ( = ?auto_70380 ?auto_70384 ) ) ( not ( = ?auto_70380 ?auto_70385 ) ) ( not ( = ?auto_70381 ?auto_70382 ) ) ( not ( = ?auto_70381 ?auto_70383 ) ) ( not ( = ?auto_70381 ?auto_70384 ) ) ( not ( = ?auto_70381 ?auto_70385 ) ) ( not ( = ?auto_70382 ?auto_70383 ) ) ( not ( = ?auto_70382 ?auto_70384 ) ) ( not ( = ?auto_70382 ?auto_70385 ) ) ( not ( = ?auto_70383 ?auto_70384 ) ) ( not ( = ?auto_70383 ?auto_70385 ) ) ( not ( = ?auto_70384 ?auto_70385 ) ) ( ON ?auto_70383 ?auto_70384 ) ( ON ?auto_70382 ?auto_70383 ) ( ON ?auto_70381 ?auto_70382 ) ( ON ?auto_70380 ?auto_70381 ) ( CLEAR ?auto_70378 ) ( ON ?auto_70379 ?auto_70380 ) ( CLEAR ?auto_70379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70378 ?auto_70379 )
      ( MAKE-7PILE ?auto_70378 ?auto_70379 ?auto_70380 ?auto_70381 ?auto_70382 ?auto_70383 ?auto_70384 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_70393 - BLOCK
      ?auto_70394 - BLOCK
      ?auto_70395 - BLOCK
      ?auto_70396 - BLOCK
      ?auto_70397 - BLOCK
      ?auto_70398 - BLOCK
      ?auto_70399 - BLOCK
    )
    :vars
    (
      ?auto_70400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70399 ?auto_70400 ) ( not ( = ?auto_70393 ?auto_70394 ) ) ( not ( = ?auto_70393 ?auto_70395 ) ) ( not ( = ?auto_70393 ?auto_70396 ) ) ( not ( = ?auto_70393 ?auto_70397 ) ) ( not ( = ?auto_70393 ?auto_70398 ) ) ( not ( = ?auto_70393 ?auto_70399 ) ) ( not ( = ?auto_70393 ?auto_70400 ) ) ( not ( = ?auto_70394 ?auto_70395 ) ) ( not ( = ?auto_70394 ?auto_70396 ) ) ( not ( = ?auto_70394 ?auto_70397 ) ) ( not ( = ?auto_70394 ?auto_70398 ) ) ( not ( = ?auto_70394 ?auto_70399 ) ) ( not ( = ?auto_70394 ?auto_70400 ) ) ( not ( = ?auto_70395 ?auto_70396 ) ) ( not ( = ?auto_70395 ?auto_70397 ) ) ( not ( = ?auto_70395 ?auto_70398 ) ) ( not ( = ?auto_70395 ?auto_70399 ) ) ( not ( = ?auto_70395 ?auto_70400 ) ) ( not ( = ?auto_70396 ?auto_70397 ) ) ( not ( = ?auto_70396 ?auto_70398 ) ) ( not ( = ?auto_70396 ?auto_70399 ) ) ( not ( = ?auto_70396 ?auto_70400 ) ) ( not ( = ?auto_70397 ?auto_70398 ) ) ( not ( = ?auto_70397 ?auto_70399 ) ) ( not ( = ?auto_70397 ?auto_70400 ) ) ( not ( = ?auto_70398 ?auto_70399 ) ) ( not ( = ?auto_70398 ?auto_70400 ) ) ( not ( = ?auto_70399 ?auto_70400 ) ) ( ON ?auto_70398 ?auto_70399 ) ( ON ?auto_70397 ?auto_70398 ) ( ON ?auto_70396 ?auto_70397 ) ( ON ?auto_70395 ?auto_70396 ) ( ON ?auto_70394 ?auto_70395 ) ( ON ?auto_70393 ?auto_70394 ) ( CLEAR ?auto_70393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70393 )
      ( MAKE-7PILE ?auto_70393 ?auto_70394 ?auto_70395 ?auto_70396 ?auto_70397 ?auto_70398 ?auto_70399 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_70408 - BLOCK
      ?auto_70409 - BLOCK
      ?auto_70410 - BLOCK
      ?auto_70411 - BLOCK
      ?auto_70412 - BLOCK
      ?auto_70413 - BLOCK
      ?auto_70414 - BLOCK
    )
    :vars
    (
      ?auto_70415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70414 ?auto_70415 ) ( not ( = ?auto_70408 ?auto_70409 ) ) ( not ( = ?auto_70408 ?auto_70410 ) ) ( not ( = ?auto_70408 ?auto_70411 ) ) ( not ( = ?auto_70408 ?auto_70412 ) ) ( not ( = ?auto_70408 ?auto_70413 ) ) ( not ( = ?auto_70408 ?auto_70414 ) ) ( not ( = ?auto_70408 ?auto_70415 ) ) ( not ( = ?auto_70409 ?auto_70410 ) ) ( not ( = ?auto_70409 ?auto_70411 ) ) ( not ( = ?auto_70409 ?auto_70412 ) ) ( not ( = ?auto_70409 ?auto_70413 ) ) ( not ( = ?auto_70409 ?auto_70414 ) ) ( not ( = ?auto_70409 ?auto_70415 ) ) ( not ( = ?auto_70410 ?auto_70411 ) ) ( not ( = ?auto_70410 ?auto_70412 ) ) ( not ( = ?auto_70410 ?auto_70413 ) ) ( not ( = ?auto_70410 ?auto_70414 ) ) ( not ( = ?auto_70410 ?auto_70415 ) ) ( not ( = ?auto_70411 ?auto_70412 ) ) ( not ( = ?auto_70411 ?auto_70413 ) ) ( not ( = ?auto_70411 ?auto_70414 ) ) ( not ( = ?auto_70411 ?auto_70415 ) ) ( not ( = ?auto_70412 ?auto_70413 ) ) ( not ( = ?auto_70412 ?auto_70414 ) ) ( not ( = ?auto_70412 ?auto_70415 ) ) ( not ( = ?auto_70413 ?auto_70414 ) ) ( not ( = ?auto_70413 ?auto_70415 ) ) ( not ( = ?auto_70414 ?auto_70415 ) ) ( ON ?auto_70413 ?auto_70414 ) ( ON ?auto_70412 ?auto_70413 ) ( ON ?auto_70411 ?auto_70412 ) ( ON ?auto_70410 ?auto_70411 ) ( ON ?auto_70409 ?auto_70410 ) ( ON ?auto_70408 ?auto_70409 ) ( CLEAR ?auto_70408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70408 )
      ( MAKE-7PILE ?auto_70408 ?auto_70409 ?auto_70410 ?auto_70411 ?auto_70412 ?auto_70413 ?auto_70414 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_70424 - BLOCK
      ?auto_70425 - BLOCK
      ?auto_70426 - BLOCK
      ?auto_70427 - BLOCK
      ?auto_70428 - BLOCK
      ?auto_70429 - BLOCK
      ?auto_70430 - BLOCK
      ?auto_70431 - BLOCK
    )
    :vars
    (
      ?auto_70432 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_70430 ) ( ON ?auto_70431 ?auto_70432 ) ( CLEAR ?auto_70431 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70424 ) ( ON ?auto_70425 ?auto_70424 ) ( ON ?auto_70426 ?auto_70425 ) ( ON ?auto_70427 ?auto_70426 ) ( ON ?auto_70428 ?auto_70427 ) ( ON ?auto_70429 ?auto_70428 ) ( ON ?auto_70430 ?auto_70429 ) ( not ( = ?auto_70424 ?auto_70425 ) ) ( not ( = ?auto_70424 ?auto_70426 ) ) ( not ( = ?auto_70424 ?auto_70427 ) ) ( not ( = ?auto_70424 ?auto_70428 ) ) ( not ( = ?auto_70424 ?auto_70429 ) ) ( not ( = ?auto_70424 ?auto_70430 ) ) ( not ( = ?auto_70424 ?auto_70431 ) ) ( not ( = ?auto_70424 ?auto_70432 ) ) ( not ( = ?auto_70425 ?auto_70426 ) ) ( not ( = ?auto_70425 ?auto_70427 ) ) ( not ( = ?auto_70425 ?auto_70428 ) ) ( not ( = ?auto_70425 ?auto_70429 ) ) ( not ( = ?auto_70425 ?auto_70430 ) ) ( not ( = ?auto_70425 ?auto_70431 ) ) ( not ( = ?auto_70425 ?auto_70432 ) ) ( not ( = ?auto_70426 ?auto_70427 ) ) ( not ( = ?auto_70426 ?auto_70428 ) ) ( not ( = ?auto_70426 ?auto_70429 ) ) ( not ( = ?auto_70426 ?auto_70430 ) ) ( not ( = ?auto_70426 ?auto_70431 ) ) ( not ( = ?auto_70426 ?auto_70432 ) ) ( not ( = ?auto_70427 ?auto_70428 ) ) ( not ( = ?auto_70427 ?auto_70429 ) ) ( not ( = ?auto_70427 ?auto_70430 ) ) ( not ( = ?auto_70427 ?auto_70431 ) ) ( not ( = ?auto_70427 ?auto_70432 ) ) ( not ( = ?auto_70428 ?auto_70429 ) ) ( not ( = ?auto_70428 ?auto_70430 ) ) ( not ( = ?auto_70428 ?auto_70431 ) ) ( not ( = ?auto_70428 ?auto_70432 ) ) ( not ( = ?auto_70429 ?auto_70430 ) ) ( not ( = ?auto_70429 ?auto_70431 ) ) ( not ( = ?auto_70429 ?auto_70432 ) ) ( not ( = ?auto_70430 ?auto_70431 ) ) ( not ( = ?auto_70430 ?auto_70432 ) ) ( not ( = ?auto_70431 ?auto_70432 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70431 ?auto_70432 )
      ( !STACK ?auto_70431 ?auto_70430 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_70441 - BLOCK
      ?auto_70442 - BLOCK
      ?auto_70443 - BLOCK
      ?auto_70444 - BLOCK
      ?auto_70445 - BLOCK
      ?auto_70446 - BLOCK
      ?auto_70447 - BLOCK
      ?auto_70448 - BLOCK
    )
    :vars
    (
      ?auto_70449 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_70447 ) ( ON ?auto_70448 ?auto_70449 ) ( CLEAR ?auto_70448 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70441 ) ( ON ?auto_70442 ?auto_70441 ) ( ON ?auto_70443 ?auto_70442 ) ( ON ?auto_70444 ?auto_70443 ) ( ON ?auto_70445 ?auto_70444 ) ( ON ?auto_70446 ?auto_70445 ) ( ON ?auto_70447 ?auto_70446 ) ( not ( = ?auto_70441 ?auto_70442 ) ) ( not ( = ?auto_70441 ?auto_70443 ) ) ( not ( = ?auto_70441 ?auto_70444 ) ) ( not ( = ?auto_70441 ?auto_70445 ) ) ( not ( = ?auto_70441 ?auto_70446 ) ) ( not ( = ?auto_70441 ?auto_70447 ) ) ( not ( = ?auto_70441 ?auto_70448 ) ) ( not ( = ?auto_70441 ?auto_70449 ) ) ( not ( = ?auto_70442 ?auto_70443 ) ) ( not ( = ?auto_70442 ?auto_70444 ) ) ( not ( = ?auto_70442 ?auto_70445 ) ) ( not ( = ?auto_70442 ?auto_70446 ) ) ( not ( = ?auto_70442 ?auto_70447 ) ) ( not ( = ?auto_70442 ?auto_70448 ) ) ( not ( = ?auto_70442 ?auto_70449 ) ) ( not ( = ?auto_70443 ?auto_70444 ) ) ( not ( = ?auto_70443 ?auto_70445 ) ) ( not ( = ?auto_70443 ?auto_70446 ) ) ( not ( = ?auto_70443 ?auto_70447 ) ) ( not ( = ?auto_70443 ?auto_70448 ) ) ( not ( = ?auto_70443 ?auto_70449 ) ) ( not ( = ?auto_70444 ?auto_70445 ) ) ( not ( = ?auto_70444 ?auto_70446 ) ) ( not ( = ?auto_70444 ?auto_70447 ) ) ( not ( = ?auto_70444 ?auto_70448 ) ) ( not ( = ?auto_70444 ?auto_70449 ) ) ( not ( = ?auto_70445 ?auto_70446 ) ) ( not ( = ?auto_70445 ?auto_70447 ) ) ( not ( = ?auto_70445 ?auto_70448 ) ) ( not ( = ?auto_70445 ?auto_70449 ) ) ( not ( = ?auto_70446 ?auto_70447 ) ) ( not ( = ?auto_70446 ?auto_70448 ) ) ( not ( = ?auto_70446 ?auto_70449 ) ) ( not ( = ?auto_70447 ?auto_70448 ) ) ( not ( = ?auto_70447 ?auto_70449 ) ) ( not ( = ?auto_70448 ?auto_70449 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70448 ?auto_70449 )
      ( !STACK ?auto_70448 ?auto_70447 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_70458 - BLOCK
      ?auto_70459 - BLOCK
      ?auto_70460 - BLOCK
      ?auto_70461 - BLOCK
      ?auto_70462 - BLOCK
      ?auto_70463 - BLOCK
      ?auto_70464 - BLOCK
      ?auto_70465 - BLOCK
    )
    :vars
    (
      ?auto_70466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70465 ?auto_70466 ) ( ON-TABLE ?auto_70458 ) ( ON ?auto_70459 ?auto_70458 ) ( ON ?auto_70460 ?auto_70459 ) ( ON ?auto_70461 ?auto_70460 ) ( ON ?auto_70462 ?auto_70461 ) ( ON ?auto_70463 ?auto_70462 ) ( not ( = ?auto_70458 ?auto_70459 ) ) ( not ( = ?auto_70458 ?auto_70460 ) ) ( not ( = ?auto_70458 ?auto_70461 ) ) ( not ( = ?auto_70458 ?auto_70462 ) ) ( not ( = ?auto_70458 ?auto_70463 ) ) ( not ( = ?auto_70458 ?auto_70464 ) ) ( not ( = ?auto_70458 ?auto_70465 ) ) ( not ( = ?auto_70458 ?auto_70466 ) ) ( not ( = ?auto_70459 ?auto_70460 ) ) ( not ( = ?auto_70459 ?auto_70461 ) ) ( not ( = ?auto_70459 ?auto_70462 ) ) ( not ( = ?auto_70459 ?auto_70463 ) ) ( not ( = ?auto_70459 ?auto_70464 ) ) ( not ( = ?auto_70459 ?auto_70465 ) ) ( not ( = ?auto_70459 ?auto_70466 ) ) ( not ( = ?auto_70460 ?auto_70461 ) ) ( not ( = ?auto_70460 ?auto_70462 ) ) ( not ( = ?auto_70460 ?auto_70463 ) ) ( not ( = ?auto_70460 ?auto_70464 ) ) ( not ( = ?auto_70460 ?auto_70465 ) ) ( not ( = ?auto_70460 ?auto_70466 ) ) ( not ( = ?auto_70461 ?auto_70462 ) ) ( not ( = ?auto_70461 ?auto_70463 ) ) ( not ( = ?auto_70461 ?auto_70464 ) ) ( not ( = ?auto_70461 ?auto_70465 ) ) ( not ( = ?auto_70461 ?auto_70466 ) ) ( not ( = ?auto_70462 ?auto_70463 ) ) ( not ( = ?auto_70462 ?auto_70464 ) ) ( not ( = ?auto_70462 ?auto_70465 ) ) ( not ( = ?auto_70462 ?auto_70466 ) ) ( not ( = ?auto_70463 ?auto_70464 ) ) ( not ( = ?auto_70463 ?auto_70465 ) ) ( not ( = ?auto_70463 ?auto_70466 ) ) ( not ( = ?auto_70464 ?auto_70465 ) ) ( not ( = ?auto_70464 ?auto_70466 ) ) ( not ( = ?auto_70465 ?auto_70466 ) ) ( CLEAR ?auto_70463 ) ( ON ?auto_70464 ?auto_70465 ) ( CLEAR ?auto_70464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_70458 ?auto_70459 ?auto_70460 ?auto_70461 ?auto_70462 ?auto_70463 ?auto_70464 )
      ( MAKE-8PILE ?auto_70458 ?auto_70459 ?auto_70460 ?auto_70461 ?auto_70462 ?auto_70463 ?auto_70464 ?auto_70465 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_70475 - BLOCK
      ?auto_70476 - BLOCK
      ?auto_70477 - BLOCK
      ?auto_70478 - BLOCK
      ?auto_70479 - BLOCK
      ?auto_70480 - BLOCK
      ?auto_70481 - BLOCK
      ?auto_70482 - BLOCK
    )
    :vars
    (
      ?auto_70483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70482 ?auto_70483 ) ( ON-TABLE ?auto_70475 ) ( ON ?auto_70476 ?auto_70475 ) ( ON ?auto_70477 ?auto_70476 ) ( ON ?auto_70478 ?auto_70477 ) ( ON ?auto_70479 ?auto_70478 ) ( ON ?auto_70480 ?auto_70479 ) ( not ( = ?auto_70475 ?auto_70476 ) ) ( not ( = ?auto_70475 ?auto_70477 ) ) ( not ( = ?auto_70475 ?auto_70478 ) ) ( not ( = ?auto_70475 ?auto_70479 ) ) ( not ( = ?auto_70475 ?auto_70480 ) ) ( not ( = ?auto_70475 ?auto_70481 ) ) ( not ( = ?auto_70475 ?auto_70482 ) ) ( not ( = ?auto_70475 ?auto_70483 ) ) ( not ( = ?auto_70476 ?auto_70477 ) ) ( not ( = ?auto_70476 ?auto_70478 ) ) ( not ( = ?auto_70476 ?auto_70479 ) ) ( not ( = ?auto_70476 ?auto_70480 ) ) ( not ( = ?auto_70476 ?auto_70481 ) ) ( not ( = ?auto_70476 ?auto_70482 ) ) ( not ( = ?auto_70476 ?auto_70483 ) ) ( not ( = ?auto_70477 ?auto_70478 ) ) ( not ( = ?auto_70477 ?auto_70479 ) ) ( not ( = ?auto_70477 ?auto_70480 ) ) ( not ( = ?auto_70477 ?auto_70481 ) ) ( not ( = ?auto_70477 ?auto_70482 ) ) ( not ( = ?auto_70477 ?auto_70483 ) ) ( not ( = ?auto_70478 ?auto_70479 ) ) ( not ( = ?auto_70478 ?auto_70480 ) ) ( not ( = ?auto_70478 ?auto_70481 ) ) ( not ( = ?auto_70478 ?auto_70482 ) ) ( not ( = ?auto_70478 ?auto_70483 ) ) ( not ( = ?auto_70479 ?auto_70480 ) ) ( not ( = ?auto_70479 ?auto_70481 ) ) ( not ( = ?auto_70479 ?auto_70482 ) ) ( not ( = ?auto_70479 ?auto_70483 ) ) ( not ( = ?auto_70480 ?auto_70481 ) ) ( not ( = ?auto_70480 ?auto_70482 ) ) ( not ( = ?auto_70480 ?auto_70483 ) ) ( not ( = ?auto_70481 ?auto_70482 ) ) ( not ( = ?auto_70481 ?auto_70483 ) ) ( not ( = ?auto_70482 ?auto_70483 ) ) ( CLEAR ?auto_70480 ) ( ON ?auto_70481 ?auto_70482 ) ( CLEAR ?auto_70481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_70475 ?auto_70476 ?auto_70477 ?auto_70478 ?auto_70479 ?auto_70480 ?auto_70481 )
      ( MAKE-8PILE ?auto_70475 ?auto_70476 ?auto_70477 ?auto_70478 ?auto_70479 ?auto_70480 ?auto_70481 ?auto_70482 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_70492 - BLOCK
      ?auto_70493 - BLOCK
      ?auto_70494 - BLOCK
      ?auto_70495 - BLOCK
      ?auto_70496 - BLOCK
      ?auto_70497 - BLOCK
      ?auto_70498 - BLOCK
      ?auto_70499 - BLOCK
    )
    :vars
    (
      ?auto_70500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70499 ?auto_70500 ) ( ON-TABLE ?auto_70492 ) ( ON ?auto_70493 ?auto_70492 ) ( ON ?auto_70494 ?auto_70493 ) ( ON ?auto_70495 ?auto_70494 ) ( ON ?auto_70496 ?auto_70495 ) ( not ( = ?auto_70492 ?auto_70493 ) ) ( not ( = ?auto_70492 ?auto_70494 ) ) ( not ( = ?auto_70492 ?auto_70495 ) ) ( not ( = ?auto_70492 ?auto_70496 ) ) ( not ( = ?auto_70492 ?auto_70497 ) ) ( not ( = ?auto_70492 ?auto_70498 ) ) ( not ( = ?auto_70492 ?auto_70499 ) ) ( not ( = ?auto_70492 ?auto_70500 ) ) ( not ( = ?auto_70493 ?auto_70494 ) ) ( not ( = ?auto_70493 ?auto_70495 ) ) ( not ( = ?auto_70493 ?auto_70496 ) ) ( not ( = ?auto_70493 ?auto_70497 ) ) ( not ( = ?auto_70493 ?auto_70498 ) ) ( not ( = ?auto_70493 ?auto_70499 ) ) ( not ( = ?auto_70493 ?auto_70500 ) ) ( not ( = ?auto_70494 ?auto_70495 ) ) ( not ( = ?auto_70494 ?auto_70496 ) ) ( not ( = ?auto_70494 ?auto_70497 ) ) ( not ( = ?auto_70494 ?auto_70498 ) ) ( not ( = ?auto_70494 ?auto_70499 ) ) ( not ( = ?auto_70494 ?auto_70500 ) ) ( not ( = ?auto_70495 ?auto_70496 ) ) ( not ( = ?auto_70495 ?auto_70497 ) ) ( not ( = ?auto_70495 ?auto_70498 ) ) ( not ( = ?auto_70495 ?auto_70499 ) ) ( not ( = ?auto_70495 ?auto_70500 ) ) ( not ( = ?auto_70496 ?auto_70497 ) ) ( not ( = ?auto_70496 ?auto_70498 ) ) ( not ( = ?auto_70496 ?auto_70499 ) ) ( not ( = ?auto_70496 ?auto_70500 ) ) ( not ( = ?auto_70497 ?auto_70498 ) ) ( not ( = ?auto_70497 ?auto_70499 ) ) ( not ( = ?auto_70497 ?auto_70500 ) ) ( not ( = ?auto_70498 ?auto_70499 ) ) ( not ( = ?auto_70498 ?auto_70500 ) ) ( not ( = ?auto_70499 ?auto_70500 ) ) ( ON ?auto_70498 ?auto_70499 ) ( CLEAR ?auto_70496 ) ( ON ?auto_70497 ?auto_70498 ) ( CLEAR ?auto_70497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70492 ?auto_70493 ?auto_70494 ?auto_70495 ?auto_70496 ?auto_70497 )
      ( MAKE-8PILE ?auto_70492 ?auto_70493 ?auto_70494 ?auto_70495 ?auto_70496 ?auto_70497 ?auto_70498 ?auto_70499 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_70509 - BLOCK
      ?auto_70510 - BLOCK
      ?auto_70511 - BLOCK
      ?auto_70512 - BLOCK
      ?auto_70513 - BLOCK
      ?auto_70514 - BLOCK
      ?auto_70515 - BLOCK
      ?auto_70516 - BLOCK
    )
    :vars
    (
      ?auto_70517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70516 ?auto_70517 ) ( ON-TABLE ?auto_70509 ) ( ON ?auto_70510 ?auto_70509 ) ( ON ?auto_70511 ?auto_70510 ) ( ON ?auto_70512 ?auto_70511 ) ( ON ?auto_70513 ?auto_70512 ) ( not ( = ?auto_70509 ?auto_70510 ) ) ( not ( = ?auto_70509 ?auto_70511 ) ) ( not ( = ?auto_70509 ?auto_70512 ) ) ( not ( = ?auto_70509 ?auto_70513 ) ) ( not ( = ?auto_70509 ?auto_70514 ) ) ( not ( = ?auto_70509 ?auto_70515 ) ) ( not ( = ?auto_70509 ?auto_70516 ) ) ( not ( = ?auto_70509 ?auto_70517 ) ) ( not ( = ?auto_70510 ?auto_70511 ) ) ( not ( = ?auto_70510 ?auto_70512 ) ) ( not ( = ?auto_70510 ?auto_70513 ) ) ( not ( = ?auto_70510 ?auto_70514 ) ) ( not ( = ?auto_70510 ?auto_70515 ) ) ( not ( = ?auto_70510 ?auto_70516 ) ) ( not ( = ?auto_70510 ?auto_70517 ) ) ( not ( = ?auto_70511 ?auto_70512 ) ) ( not ( = ?auto_70511 ?auto_70513 ) ) ( not ( = ?auto_70511 ?auto_70514 ) ) ( not ( = ?auto_70511 ?auto_70515 ) ) ( not ( = ?auto_70511 ?auto_70516 ) ) ( not ( = ?auto_70511 ?auto_70517 ) ) ( not ( = ?auto_70512 ?auto_70513 ) ) ( not ( = ?auto_70512 ?auto_70514 ) ) ( not ( = ?auto_70512 ?auto_70515 ) ) ( not ( = ?auto_70512 ?auto_70516 ) ) ( not ( = ?auto_70512 ?auto_70517 ) ) ( not ( = ?auto_70513 ?auto_70514 ) ) ( not ( = ?auto_70513 ?auto_70515 ) ) ( not ( = ?auto_70513 ?auto_70516 ) ) ( not ( = ?auto_70513 ?auto_70517 ) ) ( not ( = ?auto_70514 ?auto_70515 ) ) ( not ( = ?auto_70514 ?auto_70516 ) ) ( not ( = ?auto_70514 ?auto_70517 ) ) ( not ( = ?auto_70515 ?auto_70516 ) ) ( not ( = ?auto_70515 ?auto_70517 ) ) ( not ( = ?auto_70516 ?auto_70517 ) ) ( ON ?auto_70515 ?auto_70516 ) ( CLEAR ?auto_70513 ) ( ON ?auto_70514 ?auto_70515 ) ( CLEAR ?auto_70514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70509 ?auto_70510 ?auto_70511 ?auto_70512 ?auto_70513 ?auto_70514 )
      ( MAKE-8PILE ?auto_70509 ?auto_70510 ?auto_70511 ?auto_70512 ?auto_70513 ?auto_70514 ?auto_70515 ?auto_70516 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_70526 - BLOCK
      ?auto_70527 - BLOCK
      ?auto_70528 - BLOCK
      ?auto_70529 - BLOCK
      ?auto_70530 - BLOCK
      ?auto_70531 - BLOCK
      ?auto_70532 - BLOCK
      ?auto_70533 - BLOCK
    )
    :vars
    (
      ?auto_70534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70533 ?auto_70534 ) ( ON-TABLE ?auto_70526 ) ( ON ?auto_70527 ?auto_70526 ) ( ON ?auto_70528 ?auto_70527 ) ( ON ?auto_70529 ?auto_70528 ) ( not ( = ?auto_70526 ?auto_70527 ) ) ( not ( = ?auto_70526 ?auto_70528 ) ) ( not ( = ?auto_70526 ?auto_70529 ) ) ( not ( = ?auto_70526 ?auto_70530 ) ) ( not ( = ?auto_70526 ?auto_70531 ) ) ( not ( = ?auto_70526 ?auto_70532 ) ) ( not ( = ?auto_70526 ?auto_70533 ) ) ( not ( = ?auto_70526 ?auto_70534 ) ) ( not ( = ?auto_70527 ?auto_70528 ) ) ( not ( = ?auto_70527 ?auto_70529 ) ) ( not ( = ?auto_70527 ?auto_70530 ) ) ( not ( = ?auto_70527 ?auto_70531 ) ) ( not ( = ?auto_70527 ?auto_70532 ) ) ( not ( = ?auto_70527 ?auto_70533 ) ) ( not ( = ?auto_70527 ?auto_70534 ) ) ( not ( = ?auto_70528 ?auto_70529 ) ) ( not ( = ?auto_70528 ?auto_70530 ) ) ( not ( = ?auto_70528 ?auto_70531 ) ) ( not ( = ?auto_70528 ?auto_70532 ) ) ( not ( = ?auto_70528 ?auto_70533 ) ) ( not ( = ?auto_70528 ?auto_70534 ) ) ( not ( = ?auto_70529 ?auto_70530 ) ) ( not ( = ?auto_70529 ?auto_70531 ) ) ( not ( = ?auto_70529 ?auto_70532 ) ) ( not ( = ?auto_70529 ?auto_70533 ) ) ( not ( = ?auto_70529 ?auto_70534 ) ) ( not ( = ?auto_70530 ?auto_70531 ) ) ( not ( = ?auto_70530 ?auto_70532 ) ) ( not ( = ?auto_70530 ?auto_70533 ) ) ( not ( = ?auto_70530 ?auto_70534 ) ) ( not ( = ?auto_70531 ?auto_70532 ) ) ( not ( = ?auto_70531 ?auto_70533 ) ) ( not ( = ?auto_70531 ?auto_70534 ) ) ( not ( = ?auto_70532 ?auto_70533 ) ) ( not ( = ?auto_70532 ?auto_70534 ) ) ( not ( = ?auto_70533 ?auto_70534 ) ) ( ON ?auto_70532 ?auto_70533 ) ( ON ?auto_70531 ?auto_70532 ) ( CLEAR ?auto_70529 ) ( ON ?auto_70530 ?auto_70531 ) ( CLEAR ?auto_70530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70526 ?auto_70527 ?auto_70528 ?auto_70529 ?auto_70530 )
      ( MAKE-8PILE ?auto_70526 ?auto_70527 ?auto_70528 ?auto_70529 ?auto_70530 ?auto_70531 ?auto_70532 ?auto_70533 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_70543 - BLOCK
      ?auto_70544 - BLOCK
      ?auto_70545 - BLOCK
      ?auto_70546 - BLOCK
      ?auto_70547 - BLOCK
      ?auto_70548 - BLOCK
      ?auto_70549 - BLOCK
      ?auto_70550 - BLOCK
    )
    :vars
    (
      ?auto_70551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70550 ?auto_70551 ) ( ON-TABLE ?auto_70543 ) ( ON ?auto_70544 ?auto_70543 ) ( ON ?auto_70545 ?auto_70544 ) ( ON ?auto_70546 ?auto_70545 ) ( not ( = ?auto_70543 ?auto_70544 ) ) ( not ( = ?auto_70543 ?auto_70545 ) ) ( not ( = ?auto_70543 ?auto_70546 ) ) ( not ( = ?auto_70543 ?auto_70547 ) ) ( not ( = ?auto_70543 ?auto_70548 ) ) ( not ( = ?auto_70543 ?auto_70549 ) ) ( not ( = ?auto_70543 ?auto_70550 ) ) ( not ( = ?auto_70543 ?auto_70551 ) ) ( not ( = ?auto_70544 ?auto_70545 ) ) ( not ( = ?auto_70544 ?auto_70546 ) ) ( not ( = ?auto_70544 ?auto_70547 ) ) ( not ( = ?auto_70544 ?auto_70548 ) ) ( not ( = ?auto_70544 ?auto_70549 ) ) ( not ( = ?auto_70544 ?auto_70550 ) ) ( not ( = ?auto_70544 ?auto_70551 ) ) ( not ( = ?auto_70545 ?auto_70546 ) ) ( not ( = ?auto_70545 ?auto_70547 ) ) ( not ( = ?auto_70545 ?auto_70548 ) ) ( not ( = ?auto_70545 ?auto_70549 ) ) ( not ( = ?auto_70545 ?auto_70550 ) ) ( not ( = ?auto_70545 ?auto_70551 ) ) ( not ( = ?auto_70546 ?auto_70547 ) ) ( not ( = ?auto_70546 ?auto_70548 ) ) ( not ( = ?auto_70546 ?auto_70549 ) ) ( not ( = ?auto_70546 ?auto_70550 ) ) ( not ( = ?auto_70546 ?auto_70551 ) ) ( not ( = ?auto_70547 ?auto_70548 ) ) ( not ( = ?auto_70547 ?auto_70549 ) ) ( not ( = ?auto_70547 ?auto_70550 ) ) ( not ( = ?auto_70547 ?auto_70551 ) ) ( not ( = ?auto_70548 ?auto_70549 ) ) ( not ( = ?auto_70548 ?auto_70550 ) ) ( not ( = ?auto_70548 ?auto_70551 ) ) ( not ( = ?auto_70549 ?auto_70550 ) ) ( not ( = ?auto_70549 ?auto_70551 ) ) ( not ( = ?auto_70550 ?auto_70551 ) ) ( ON ?auto_70549 ?auto_70550 ) ( ON ?auto_70548 ?auto_70549 ) ( CLEAR ?auto_70546 ) ( ON ?auto_70547 ?auto_70548 ) ( CLEAR ?auto_70547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70543 ?auto_70544 ?auto_70545 ?auto_70546 ?auto_70547 )
      ( MAKE-8PILE ?auto_70543 ?auto_70544 ?auto_70545 ?auto_70546 ?auto_70547 ?auto_70548 ?auto_70549 ?auto_70550 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_70560 - BLOCK
      ?auto_70561 - BLOCK
      ?auto_70562 - BLOCK
      ?auto_70563 - BLOCK
      ?auto_70564 - BLOCK
      ?auto_70565 - BLOCK
      ?auto_70566 - BLOCK
      ?auto_70567 - BLOCK
    )
    :vars
    (
      ?auto_70568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70567 ?auto_70568 ) ( ON-TABLE ?auto_70560 ) ( ON ?auto_70561 ?auto_70560 ) ( ON ?auto_70562 ?auto_70561 ) ( not ( = ?auto_70560 ?auto_70561 ) ) ( not ( = ?auto_70560 ?auto_70562 ) ) ( not ( = ?auto_70560 ?auto_70563 ) ) ( not ( = ?auto_70560 ?auto_70564 ) ) ( not ( = ?auto_70560 ?auto_70565 ) ) ( not ( = ?auto_70560 ?auto_70566 ) ) ( not ( = ?auto_70560 ?auto_70567 ) ) ( not ( = ?auto_70560 ?auto_70568 ) ) ( not ( = ?auto_70561 ?auto_70562 ) ) ( not ( = ?auto_70561 ?auto_70563 ) ) ( not ( = ?auto_70561 ?auto_70564 ) ) ( not ( = ?auto_70561 ?auto_70565 ) ) ( not ( = ?auto_70561 ?auto_70566 ) ) ( not ( = ?auto_70561 ?auto_70567 ) ) ( not ( = ?auto_70561 ?auto_70568 ) ) ( not ( = ?auto_70562 ?auto_70563 ) ) ( not ( = ?auto_70562 ?auto_70564 ) ) ( not ( = ?auto_70562 ?auto_70565 ) ) ( not ( = ?auto_70562 ?auto_70566 ) ) ( not ( = ?auto_70562 ?auto_70567 ) ) ( not ( = ?auto_70562 ?auto_70568 ) ) ( not ( = ?auto_70563 ?auto_70564 ) ) ( not ( = ?auto_70563 ?auto_70565 ) ) ( not ( = ?auto_70563 ?auto_70566 ) ) ( not ( = ?auto_70563 ?auto_70567 ) ) ( not ( = ?auto_70563 ?auto_70568 ) ) ( not ( = ?auto_70564 ?auto_70565 ) ) ( not ( = ?auto_70564 ?auto_70566 ) ) ( not ( = ?auto_70564 ?auto_70567 ) ) ( not ( = ?auto_70564 ?auto_70568 ) ) ( not ( = ?auto_70565 ?auto_70566 ) ) ( not ( = ?auto_70565 ?auto_70567 ) ) ( not ( = ?auto_70565 ?auto_70568 ) ) ( not ( = ?auto_70566 ?auto_70567 ) ) ( not ( = ?auto_70566 ?auto_70568 ) ) ( not ( = ?auto_70567 ?auto_70568 ) ) ( ON ?auto_70566 ?auto_70567 ) ( ON ?auto_70565 ?auto_70566 ) ( ON ?auto_70564 ?auto_70565 ) ( CLEAR ?auto_70562 ) ( ON ?auto_70563 ?auto_70564 ) ( CLEAR ?auto_70563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70560 ?auto_70561 ?auto_70562 ?auto_70563 )
      ( MAKE-8PILE ?auto_70560 ?auto_70561 ?auto_70562 ?auto_70563 ?auto_70564 ?auto_70565 ?auto_70566 ?auto_70567 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_70577 - BLOCK
      ?auto_70578 - BLOCK
      ?auto_70579 - BLOCK
      ?auto_70580 - BLOCK
      ?auto_70581 - BLOCK
      ?auto_70582 - BLOCK
      ?auto_70583 - BLOCK
      ?auto_70584 - BLOCK
    )
    :vars
    (
      ?auto_70585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70584 ?auto_70585 ) ( ON-TABLE ?auto_70577 ) ( ON ?auto_70578 ?auto_70577 ) ( ON ?auto_70579 ?auto_70578 ) ( not ( = ?auto_70577 ?auto_70578 ) ) ( not ( = ?auto_70577 ?auto_70579 ) ) ( not ( = ?auto_70577 ?auto_70580 ) ) ( not ( = ?auto_70577 ?auto_70581 ) ) ( not ( = ?auto_70577 ?auto_70582 ) ) ( not ( = ?auto_70577 ?auto_70583 ) ) ( not ( = ?auto_70577 ?auto_70584 ) ) ( not ( = ?auto_70577 ?auto_70585 ) ) ( not ( = ?auto_70578 ?auto_70579 ) ) ( not ( = ?auto_70578 ?auto_70580 ) ) ( not ( = ?auto_70578 ?auto_70581 ) ) ( not ( = ?auto_70578 ?auto_70582 ) ) ( not ( = ?auto_70578 ?auto_70583 ) ) ( not ( = ?auto_70578 ?auto_70584 ) ) ( not ( = ?auto_70578 ?auto_70585 ) ) ( not ( = ?auto_70579 ?auto_70580 ) ) ( not ( = ?auto_70579 ?auto_70581 ) ) ( not ( = ?auto_70579 ?auto_70582 ) ) ( not ( = ?auto_70579 ?auto_70583 ) ) ( not ( = ?auto_70579 ?auto_70584 ) ) ( not ( = ?auto_70579 ?auto_70585 ) ) ( not ( = ?auto_70580 ?auto_70581 ) ) ( not ( = ?auto_70580 ?auto_70582 ) ) ( not ( = ?auto_70580 ?auto_70583 ) ) ( not ( = ?auto_70580 ?auto_70584 ) ) ( not ( = ?auto_70580 ?auto_70585 ) ) ( not ( = ?auto_70581 ?auto_70582 ) ) ( not ( = ?auto_70581 ?auto_70583 ) ) ( not ( = ?auto_70581 ?auto_70584 ) ) ( not ( = ?auto_70581 ?auto_70585 ) ) ( not ( = ?auto_70582 ?auto_70583 ) ) ( not ( = ?auto_70582 ?auto_70584 ) ) ( not ( = ?auto_70582 ?auto_70585 ) ) ( not ( = ?auto_70583 ?auto_70584 ) ) ( not ( = ?auto_70583 ?auto_70585 ) ) ( not ( = ?auto_70584 ?auto_70585 ) ) ( ON ?auto_70583 ?auto_70584 ) ( ON ?auto_70582 ?auto_70583 ) ( ON ?auto_70581 ?auto_70582 ) ( CLEAR ?auto_70579 ) ( ON ?auto_70580 ?auto_70581 ) ( CLEAR ?auto_70580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70577 ?auto_70578 ?auto_70579 ?auto_70580 )
      ( MAKE-8PILE ?auto_70577 ?auto_70578 ?auto_70579 ?auto_70580 ?auto_70581 ?auto_70582 ?auto_70583 ?auto_70584 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_70594 - BLOCK
      ?auto_70595 - BLOCK
      ?auto_70596 - BLOCK
      ?auto_70597 - BLOCK
      ?auto_70598 - BLOCK
      ?auto_70599 - BLOCK
      ?auto_70600 - BLOCK
      ?auto_70601 - BLOCK
    )
    :vars
    (
      ?auto_70602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70601 ?auto_70602 ) ( ON-TABLE ?auto_70594 ) ( ON ?auto_70595 ?auto_70594 ) ( not ( = ?auto_70594 ?auto_70595 ) ) ( not ( = ?auto_70594 ?auto_70596 ) ) ( not ( = ?auto_70594 ?auto_70597 ) ) ( not ( = ?auto_70594 ?auto_70598 ) ) ( not ( = ?auto_70594 ?auto_70599 ) ) ( not ( = ?auto_70594 ?auto_70600 ) ) ( not ( = ?auto_70594 ?auto_70601 ) ) ( not ( = ?auto_70594 ?auto_70602 ) ) ( not ( = ?auto_70595 ?auto_70596 ) ) ( not ( = ?auto_70595 ?auto_70597 ) ) ( not ( = ?auto_70595 ?auto_70598 ) ) ( not ( = ?auto_70595 ?auto_70599 ) ) ( not ( = ?auto_70595 ?auto_70600 ) ) ( not ( = ?auto_70595 ?auto_70601 ) ) ( not ( = ?auto_70595 ?auto_70602 ) ) ( not ( = ?auto_70596 ?auto_70597 ) ) ( not ( = ?auto_70596 ?auto_70598 ) ) ( not ( = ?auto_70596 ?auto_70599 ) ) ( not ( = ?auto_70596 ?auto_70600 ) ) ( not ( = ?auto_70596 ?auto_70601 ) ) ( not ( = ?auto_70596 ?auto_70602 ) ) ( not ( = ?auto_70597 ?auto_70598 ) ) ( not ( = ?auto_70597 ?auto_70599 ) ) ( not ( = ?auto_70597 ?auto_70600 ) ) ( not ( = ?auto_70597 ?auto_70601 ) ) ( not ( = ?auto_70597 ?auto_70602 ) ) ( not ( = ?auto_70598 ?auto_70599 ) ) ( not ( = ?auto_70598 ?auto_70600 ) ) ( not ( = ?auto_70598 ?auto_70601 ) ) ( not ( = ?auto_70598 ?auto_70602 ) ) ( not ( = ?auto_70599 ?auto_70600 ) ) ( not ( = ?auto_70599 ?auto_70601 ) ) ( not ( = ?auto_70599 ?auto_70602 ) ) ( not ( = ?auto_70600 ?auto_70601 ) ) ( not ( = ?auto_70600 ?auto_70602 ) ) ( not ( = ?auto_70601 ?auto_70602 ) ) ( ON ?auto_70600 ?auto_70601 ) ( ON ?auto_70599 ?auto_70600 ) ( ON ?auto_70598 ?auto_70599 ) ( ON ?auto_70597 ?auto_70598 ) ( CLEAR ?auto_70595 ) ( ON ?auto_70596 ?auto_70597 ) ( CLEAR ?auto_70596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70594 ?auto_70595 ?auto_70596 )
      ( MAKE-8PILE ?auto_70594 ?auto_70595 ?auto_70596 ?auto_70597 ?auto_70598 ?auto_70599 ?auto_70600 ?auto_70601 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_70611 - BLOCK
      ?auto_70612 - BLOCK
      ?auto_70613 - BLOCK
      ?auto_70614 - BLOCK
      ?auto_70615 - BLOCK
      ?auto_70616 - BLOCK
      ?auto_70617 - BLOCK
      ?auto_70618 - BLOCK
    )
    :vars
    (
      ?auto_70619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70618 ?auto_70619 ) ( ON-TABLE ?auto_70611 ) ( ON ?auto_70612 ?auto_70611 ) ( not ( = ?auto_70611 ?auto_70612 ) ) ( not ( = ?auto_70611 ?auto_70613 ) ) ( not ( = ?auto_70611 ?auto_70614 ) ) ( not ( = ?auto_70611 ?auto_70615 ) ) ( not ( = ?auto_70611 ?auto_70616 ) ) ( not ( = ?auto_70611 ?auto_70617 ) ) ( not ( = ?auto_70611 ?auto_70618 ) ) ( not ( = ?auto_70611 ?auto_70619 ) ) ( not ( = ?auto_70612 ?auto_70613 ) ) ( not ( = ?auto_70612 ?auto_70614 ) ) ( not ( = ?auto_70612 ?auto_70615 ) ) ( not ( = ?auto_70612 ?auto_70616 ) ) ( not ( = ?auto_70612 ?auto_70617 ) ) ( not ( = ?auto_70612 ?auto_70618 ) ) ( not ( = ?auto_70612 ?auto_70619 ) ) ( not ( = ?auto_70613 ?auto_70614 ) ) ( not ( = ?auto_70613 ?auto_70615 ) ) ( not ( = ?auto_70613 ?auto_70616 ) ) ( not ( = ?auto_70613 ?auto_70617 ) ) ( not ( = ?auto_70613 ?auto_70618 ) ) ( not ( = ?auto_70613 ?auto_70619 ) ) ( not ( = ?auto_70614 ?auto_70615 ) ) ( not ( = ?auto_70614 ?auto_70616 ) ) ( not ( = ?auto_70614 ?auto_70617 ) ) ( not ( = ?auto_70614 ?auto_70618 ) ) ( not ( = ?auto_70614 ?auto_70619 ) ) ( not ( = ?auto_70615 ?auto_70616 ) ) ( not ( = ?auto_70615 ?auto_70617 ) ) ( not ( = ?auto_70615 ?auto_70618 ) ) ( not ( = ?auto_70615 ?auto_70619 ) ) ( not ( = ?auto_70616 ?auto_70617 ) ) ( not ( = ?auto_70616 ?auto_70618 ) ) ( not ( = ?auto_70616 ?auto_70619 ) ) ( not ( = ?auto_70617 ?auto_70618 ) ) ( not ( = ?auto_70617 ?auto_70619 ) ) ( not ( = ?auto_70618 ?auto_70619 ) ) ( ON ?auto_70617 ?auto_70618 ) ( ON ?auto_70616 ?auto_70617 ) ( ON ?auto_70615 ?auto_70616 ) ( ON ?auto_70614 ?auto_70615 ) ( CLEAR ?auto_70612 ) ( ON ?auto_70613 ?auto_70614 ) ( CLEAR ?auto_70613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70611 ?auto_70612 ?auto_70613 )
      ( MAKE-8PILE ?auto_70611 ?auto_70612 ?auto_70613 ?auto_70614 ?auto_70615 ?auto_70616 ?auto_70617 ?auto_70618 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_70628 - BLOCK
      ?auto_70629 - BLOCK
      ?auto_70630 - BLOCK
      ?auto_70631 - BLOCK
      ?auto_70632 - BLOCK
      ?auto_70633 - BLOCK
      ?auto_70634 - BLOCK
      ?auto_70635 - BLOCK
    )
    :vars
    (
      ?auto_70636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70635 ?auto_70636 ) ( ON-TABLE ?auto_70628 ) ( not ( = ?auto_70628 ?auto_70629 ) ) ( not ( = ?auto_70628 ?auto_70630 ) ) ( not ( = ?auto_70628 ?auto_70631 ) ) ( not ( = ?auto_70628 ?auto_70632 ) ) ( not ( = ?auto_70628 ?auto_70633 ) ) ( not ( = ?auto_70628 ?auto_70634 ) ) ( not ( = ?auto_70628 ?auto_70635 ) ) ( not ( = ?auto_70628 ?auto_70636 ) ) ( not ( = ?auto_70629 ?auto_70630 ) ) ( not ( = ?auto_70629 ?auto_70631 ) ) ( not ( = ?auto_70629 ?auto_70632 ) ) ( not ( = ?auto_70629 ?auto_70633 ) ) ( not ( = ?auto_70629 ?auto_70634 ) ) ( not ( = ?auto_70629 ?auto_70635 ) ) ( not ( = ?auto_70629 ?auto_70636 ) ) ( not ( = ?auto_70630 ?auto_70631 ) ) ( not ( = ?auto_70630 ?auto_70632 ) ) ( not ( = ?auto_70630 ?auto_70633 ) ) ( not ( = ?auto_70630 ?auto_70634 ) ) ( not ( = ?auto_70630 ?auto_70635 ) ) ( not ( = ?auto_70630 ?auto_70636 ) ) ( not ( = ?auto_70631 ?auto_70632 ) ) ( not ( = ?auto_70631 ?auto_70633 ) ) ( not ( = ?auto_70631 ?auto_70634 ) ) ( not ( = ?auto_70631 ?auto_70635 ) ) ( not ( = ?auto_70631 ?auto_70636 ) ) ( not ( = ?auto_70632 ?auto_70633 ) ) ( not ( = ?auto_70632 ?auto_70634 ) ) ( not ( = ?auto_70632 ?auto_70635 ) ) ( not ( = ?auto_70632 ?auto_70636 ) ) ( not ( = ?auto_70633 ?auto_70634 ) ) ( not ( = ?auto_70633 ?auto_70635 ) ) ( not ( = ?auto_70633 ?auto_70636 ) ) ( not ( = ?auto_70634 ?auto_70635 ) ) ( not ( = ?auto_70634 ?auto_70636 ) ) ( not ( = ?auto_70635 ?auto_70636 ) ) ( ON ?auto_70634 ?auto_70635 ) ( ON ?auto_70633 ?auto_70634 ) ( ON ?auto_70632 ?auto_70633 ) ( ON ?auto_70631 ?auto_70632 ) ( ON ?auto_70630 ?auto_70631 ) ( CLEAR ?auto_70628 ) ( ON ?auto_70629 ?auto_70630 ) ( CLEAR ?auto_70629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70628 ?auto_70629 )
      ( MAKE-8PILE ?auto_70628 ?auto_70629 ?auto_70630 ?auto_70631 ?auto_70632 ?auto_70633 ?auto_70634 ?auto_70635 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_70645 - BLOCK
      ?auto_70646 - BLOCK
      ?auto_70647 - BLOCK
      ?auto_70648 - BLOCK
      ?auto_70649 - BLOCK
      ?auto_70650 - BLOCK
      ?auto_70651 - BLOCK
      ?auto_70652 - BLOCK
    )
    :vars
    (
      ?auto_70653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70652 ?auto_70653 ) ( ON-TABLE ?auto_70645 ) ( not ( = ?auto_70645 ?auto_70646 ) ) ( not ( = ?auto_70645 ?auto_70647 ) ) ( not ( = ?auto_70645 ?auto_70648 ) ) ( not ( = ?auto_70645 ?auto_70649 ) ) ( not ( = ?auto_70645 ?auto_70650 ) ) ( not ( = ?auto_70645 ?auto_70651 ) ) ( not ( = ?auto_70645 ?auto_70652 ) ) ( not ( = ?auto_70645 ?auto_70653 ) ) ( not ( = ?auto_70646 ?auto_70647 ) ) ( not ( = ?auto_70646 ?auto_70648 ) ) ( not ( = ?auto_70646 ?auto_70649 ) ) ( not ( = ?auto_70646 ?auto_70650 ) ) ( not ( = ?auto_70646 ?auto_70651 ) ) ( not ( = ?auto_70646 ?auto_70652 ) ) ( not ( = ?auto_70646 ?auto_70653 ) ) ( not ( = ?auto_70647 ?auto_70648 ) ) ( not ( = ?auto_70647 ?auto_70649 ) ) ( not ( = ?auto_70647 ?auto_70650 ) ) ( not ( = ?auto_70647 ?auto_70651 ) ) ( not ( = ?auto_70647 ?auto_70652 ) ) ( not ( = ?auto_70647 ?auto_70653 ) ) ( not ( = ?auto_70648 ?auto_70649 ) ) ( not ( = ?auto_70648 ?auto_70650 ) ) ( not ( = ?auto_70648 ?auto_70651 ) ) ( not ( = ?auto_70648 ?auto_70652 ) ) ( not ( = ?auto_70648 ?auto_70653 ) ) ( not ( = ?auto_70649 ?auto_70650 ) ) ( not ( = ?auto_70649 ?auto_70651 ) ) ( not ( = ?auto_70649 ?auto_70652 ) ) ( not ( = ?auto_70649 ?auto_70653 ) ) ( not ( = ?auto_70650 ?auto_70651 ) ) ( not ( = ?auto_70650 ?auto_70652 ) ) ( not ( = ?auto_70650 ?auto_70653 ) ) ( not ( = ?auto_70651 ?auto_70652 ) ) ( not ( = ?auto_70651 ?auto_70653 ) ) ( not ( = ?auto_70652 ?auto_70653 ) ) ( ON ?auto_70651 ?auto_70652 ) ( ON ?auto_70650 ?auto_70651 ) ( ON ?auto_70649 ?auto_70650 ) ( ON ?auto_70648 ?auto_70649 ) ( ON ?auto_70647 ?auto_70648 ) ( CLEAR ?auto_70645 ) ( ON ?auto_70646 ?auto_70647 ) ( CLEAR ?auto_70646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70645 ?auto_70646 )
      ( MAKE-8PILE ?auto_70645 ?auto_70646 ?auto_70647 ?auto_70648 ?auto_70649 ?auto_70650 ?auto_70651 ?auto_70652 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_70662 - BLOCK
      ?auto_70663 - BLOCK
      ?auto_70664 - BLOCK
      ?auto_70665 - BLOCK
      ?auto_70666 - BLOCK
      ?auto_70667 - BLOCK
      ?auto_70668 - BLOCK
      ?auto_70669 - BLOCK
    )
    :vars
    (
      ?auto_70670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70669 ?auto_70670 ) ( not ( = ?auto_70662 ?auto_70663 ) ) ( not ( = ?auto_70662 ?auto_70664 ) ) ( not ( = ?auto_70662 ?auto_70665 ) ) ( not ( = ?auto_70662 ?auto_70666 ) ) ( not ( = ?auto_70662 ?auto_70667 ) ) ( not ( = ?auto_70662 ?auto_70668 ) ) ( not ( = ?auto_70662 ?auto_70669 ) ) ( not ( = ?auto_70662 ?auto_70670 ) ) ( not ( = ?auto_70663 ?auto_70664 ) ) ( not ( = ?auto_70663 ?auto_70665 ) ) ( not ( = ?auto_70663 ?auto_70666 ) ) ( not ( = ?auto_70663 ?auto_70667 ) ) ( not ( = ?auto_70663 ?auto_70668 ) ) ( not ( = ?auto_70663 ?auto_70669 ) ) ( not ( = ?auto_70663 ?auto_70670 ) ) ( not ( = ?auto_70664 ?auto_70665 ) ) ( not ( = ?auto_70664 ?auto_70666 ) ) ( not ( = ?auto_70664 ?auto_70667 ) ) ( not ( = ?auto_70664 ?auto_70668 ) ) ( not ( = ?auto_70664 ?auto_70669 ) ) ( not ( = ?auto_70664 ?auto_70670 ) ) ( not ( = ?auto_70665 ?auto_70666 ) ) ( not ( = ?auto_70665 ?auto_70667 ) ) ( not ( = ?auto_70665 ?auto_70668 ) ) ( not ( = ?auto_70665 ?auto_70669 ) ) ( not ( = ?auto_70665 ?auto_70670 ) ) ( not ( = ?auto_70666 ?auto_70667 ) ) ( not ( = ?auto_70666 ?auto_70668 ) ) ( not ( = ?auto_70666 ?auto_70669 ) ) ( not ( = ?auto_70666 ?auto_70670 ) ) ( not ( = ?auto_70667 ?auto_70668 ) ) ( not ( = ?auto_70667 ?auto_70669 ) ) ( not ( = ?auto_70667 ?auto_70670 ) ) ( not ( = ?auto_70668 ?auto_70669 ) ) ( not ( = ?auto_70668 ?auto_70670 ) ) ( not ( = ?auto_70669 ?auto_70670 ) ) ( ON ?auto_70668 ?auto_70669 ) ( ON ?auto_70667 ?auto_70668 ) ( ON ?auto_70666 ?auto_70667 ) ( ON ?auto_70665 ?auto_70666 ) ( ON ?auto_70664 ?auto_70665 ) ( ON ?auto_70663 ?auto_70664 ) ( ON ?auto_70662 ?auto_70663 ) ( CLEAR ?auto_70662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70662 )
      ( MAKE-8PILE ?auto_70662 ?auto_70663 ?auto_70664 ?auto_70665 ?auto_70666 ?auto_70667 ?auto_70668 ?auto_70669 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_70679 - BLOCK
      ?auto_70680 - BLOCK
      ?auto_70681 - BLOCK
      ?auto_70682 - BLOCK
      ?auto_70683 - BLOCK
      ?auto_70684 - BLOCK
      ?auto_70685 - BLOCK
      ?auto_70686 - BLOCK
    )
    :vars
    (
      ?auto_70687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70686 ?auto_70687 ) ( not ( = ?auto_70679 ?auto_70680 ) ) ( not ( = ?auto_70679 ?auto_70681 ) ) ( not ( = ?auto_70679 ?auto_70682 ) ) ( not ( = ?auto_70679 ?auto_70683 ) ) ( not ( = ?auto_70679 ?auto_70684 ) ) ( not ( = ?auto_70679 ?auto_70685 ) ) ( not ( = ?auto_70679 ?auto_70686 ) ) ( not ( = ?auto_70679 ?auto_70687 ) ) ( not ( = ?auto_70680 ?auto_70681 ) ) ( not ( = ?auto_70680 ?auto_70682 ) ) ( not ( = ?auto_70680 ?auto_70683 ) ) ( not ( = ?auto_70680 ?auto_70684 ) ) ( not ( = ?auto_70680 ?auto_70685 ) ) ( not ( = ?auto_70680 ?auto_70686 ) ) ( not ( = ?auto_70680 ?auto_70687 ) ) ( not ( = ?auto_70681 ?auto_70682 ) ) ( not ( = ?auto_70681 ?auto_70683 ) ) ( not ( = ?auto_70681 ?auto_70684 ) ) ( not ( = ?auto_70681 ?auto_70685 ) ) ( not ( = ?auto_70681 ?auto_70686 ) ) ( not ( = ?auto_70681 ?auto_70687 ) ) ( not ( = ?auto_70682 ?auto_70683 ) ) ( not ( = ?auto_70682 ?auto_70684 ) ) ( not ( = ?auto_70682 ?auto_70685 ) ) ( not ( = ?auto_70682 ?auto_70686 ) ) ( not ( = ?auto_70682 ?auto_70687 ) ) ( not ( = ?auto_70683 ?auto_70684 ) ) ( not ( = ?auto_70683 ?auto_70685 ) ) ( not ( = ?auto_70683 ?auto_70686 ) ) ( not ( = ?auto_70683 ?auto_70687 ) ) ( not ( = ?auto_70684 ?auto_70685 ) ) ( not ( = ?auto_70684 ?auto_70686 ) ) ( not ( = ?auto_70684 ?auto_70687 ) ) ( not ( = ?auto_70685 ?auto_70686 ) ) ( not ( = ?auto_70685 ?auto_70687 ) ) ( not ( = ?auto_70686 ?auto_70687 ) ) ( ON ?auto_70685 ?auto_70686 ) ( ON ?auto_70684 ?auto_70685 ) ( ON ?auto_70683 ?auto_70684 ) ( ON ?auto_70682 ?auto_70683 ) ( ON ?auto_70681 ?auto_70682 ) ( ON ?auto_70680 ?auto_70681 ) ( ON ?auto_70679 ?auto_70680 ) ( CLEAR ?auto_70679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70679 )
      ( MAKE-8PILE ?auto_70679 ?auto_70680 ?auto_70681 ?auto_70682 ?auto_70683 ?auto_70684 ?auto_70685 ?auto_70686 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_70697 - BLOCK
      ?auto_70698 - BLOCK
      ?auto_70699 - BLOCK
      ?auto_70700 - BLOCK
      ?auto_70701 - BLOCK
      ?auto_70702 - BLOCK
      ?auto_70703 - BLOCK
      ?auto_70704 - BLOCK
      ?auto_70705 - BLOCK
    )
    :vars
    (
      ?auto_70706 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_70704 ) ( ON ?auto_70705 ?auto_70706 ) ( CLEAR ?auto_70705 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70697 ) ( ON ?auto_70698 ?auto_70697 ) ( ON ?auto_70699 ?auto_70698 ) ( ON ?auto_70700 ?auto_70699 ) ( ON ?auto_70701 ?auto_70700 ) ( ON ?auto_70702 ?auto_70701 ) ( ON ?auto_70703 ?auto_70702 ) ( ON ?auto_70704 ?auto_70703 ) ( not ( = ?auto_70697 ?auto_70698 ) ) ( not ( = ?auto_70697 ?auto_70699 ) ) ( not ( = ?auto_70697 ?auto_70700 ) ) ( not ( = ?auto_70697 ?auto_70701 ) ) ( not ( = ?auto_70697 ?auto_70702 ) ) ( not ( = ?auto_70697 ?auto_70703 ) ) ( not ( = ?auto_70697 ?auto_70704 ) ) ( not ( = ?auto_70697 ?auto_70705 ) ) ( not ( = ?auto_70697 ?auto_70706 ) ) ( not ( = ?auto_70698 ?auto_70699 ) ) ( not ( = ?auto_70698 ?auto_70700 ) ) ( not ( = ?auto_70698 ?auto_70701 ) ) ( not ( = ?auto_70698 ?auto_70702 ) ) ( not ( = ?auto_70698 ?auto_70703 ) ) ( not ( = ?auto_70698 ?auto_70704 ) ) ( not ( = ?auto_70698 ?auto_70705 ) ) ( not ( = ?auto_70698 ?auto_70706 ) ) ( not ( = ?auto_70699 ?auto_70700 ) ) ( not ( = ?auto_70699 ?auto_70701 ) ) ( not ( = ?auto_70699 ?auto_70702 ) ) ( not ( = ?auto_70699 ?auto_70703 ) ) ( not ( = ?auto_70699 ?auto_70704 ) ) ( not ( = ?auto_70699 ?auto_70705 ) ) ( not ( = ?auto_70699 ?auto_70706 ) ) ( not ( = ?auto_70700 ?auto_70701 ) ) ( not ( = ?auto_70700 ?auto_70702 ) ) ( not ( = ?auto_70700 ?auto_70703 ) ) ( not ( = ?auto_70700 ?auto_70704 ) ) ( not ( = ?auto_70700 ?auto_70705 ) ) ( not ( = ?auto_70700 ?auto_70706 ) ) ( not ( = ?auto_70701 ?auto_70702 ) ) ( not ( = ?auto_70701 ?auto_70703 ) ) ( not ( = ?auto_70701 ?auto_70704 ) ) ( not ( = ?auto_70701 ?auto_70705 ) ) ( not ( = ?auto_70701 ?auto_70706 ) ) ( not ( = ?auto_70702 ?auto_70703 ) ) ( not ( = ?auto_70702 ?auto_70704 ) ) ( not ( = ?auto_70702 ?auto_70705 ) ) ( not ( = ?auto_70702 ?auto_70706 ) ) ( not ( = ?auto_70703 ?auto_70704 ) ) ( not ( = ?auto_70703 ?auto_70705 ) ) ( not ( = ?auto_70703 ?auto_70706 ) ) ( not ( = ?auto_70704 ?auto_70705 ) ) ( not ( = ?auto_70704 ?auto_70706 ) ) ( not ( = ?auto_70705 ?auto_70706 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70705 ?auto_70706 )
      ( !STACK ?auto_70705 ?auto_70704 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_70716 - BLOCK
      ?auto_70717 - BLOCK
      ?auto_70718 - BLOCK
      ?auto_70719 - BLOCK
      ?auto_70720 - BLOCK
      ?auto_70721 - BLOCK
      ?auto_70722 - BLOCK
      ?auto_70723 - BLOCK
      ?auto_70724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_70723 ) ( ON-TABLE ?auto_70724 ) ( CLEAR ?auto_70724 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70716 ) ( ON ?auto_70717 ?auto_70716 ) ( ON ?auto_70718 ?auto_70717 ) ( ON ?auto_70719 ?auto_70718 ) ( ON ?auto_70720 ?auto_70719 ) ( ON ?auto_70721 ?auto_70720 ) ( ON ?auto_70722 ?auto_70721 ) ( ON ?auto_70723 ?auto_70722 ) ( not ( = ?auto_70716 ?auto_70717 ) ) ( not ( = ?auto_70716 ?auto_70718 ) ) ( not ( = ?auto_70716 ?auto_70719 ) ) ( not ( = ?auto_70716 ?auto_70720 ) ) ( not ( = ?auto_70716 ?auto_70721 ) ) ( not ( = ?auto_70716 ?auto_70722 ) ) ( not ( = ?auto_70716 ?auto_70723 ) ) ( not ( = ?auto_70716 ?auto_70724 ) ) ( not ( = ?auto_70717 ?auto_70718 ) ) ( not ( = ?auto_70717 ?auto_70719 ) ) ( not ( = ?auto_70717 ?auto_70720 ) ) ( not ( = ?auto_70717 ?auto_70721 ) ) ( not ( = ?auto_70717 ?auto_70722 ) ) ( not ( = ?auto_70717 ?auto_70723 ) ) ( not ( = ?auto_70717 ?auto_70724 ) ) ( not ( = ?auto_70718 ?auto_70719 ) ) ( not ( = ?auto_70718 ?auto_70720 ) ) ( not ( = ?auto_70718 ?auto_70721 ) ) ( not ( = ?auto_70718 ?auto_70722 ) ) ( not ( = ?auto_70718 ?auto_70723 ) ) ( not ( = ?auto_70718 ?auto_70724 ) ) ( not ( = ?auto_70719 ?auto_70720 ) ) ( not ( = ?auto_70719 ?auto_70721 ) ) ( not ( = ?auto_70719 ?auto_70722 ) ) ( not ( = ?auto_70719 ?auto_70723 ) ) ( not ( = ?auto_70719 ?auto_70724 ) ) ( not ( = ?auto_70720 ?auto_70721 ) ) ( not ( = ?auto_70720 ?auto_70722 ) ) ( not ( = ?auto_70720 ?auto_70723 ) ) ( not ( = ?auto_70720 ?auto_70724 ) ) ( not ( = ?auto_70721 ?auto_70722 ) ) ( not ( = ?auto_70721 ?auto_70723 ) ) ( not ( = ?auto_70721 ?auto_70724 ) ) ( not ( = ?auto_70722 ?auto_70723 ) ) ( not ( = ?auto_70722 ?auto_70724 ) ) ( not ( = ?auto_70723 ?auto_70724 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_70724 )
      ( !STACK ?auto_70724 ?auto_70723 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_70734 - BLOCK
      ?auto_70735 - BLOCK
      ?auto_70736 - BLOCK
      ?auto_70737 - BLOCK
      ?auto_70738 - BLOCK
      ?auto_70739 - BLOCK
      ?auto_70740 - BLOCK
      ?auto_70741 - BLOCK
      ?auto_70742 - BLOCK
    )
    :vars
    (
      ?auto_70743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70742 ?auto_70743 ) ( ON-TABLE ?auto_70734 ) ( ON ?auto_70735 ?auto_70734 ) ( ON ?auto_70736 ?auto_70735 ) ( ON ?auto_70737 ?auto_70736 ) ( ON ?auto_70738 ?auto_70737 ) ( ON ?auto_70739 ?auto_70738 ) ( ON ?auto_70740 ?auto_70739 ) ( not ( = ?auto_70734 ?auto_70735 ) ) ( not ( = ?auto_70734 ?auto_70736 ) ) ( not ( = ?auto_70734 ?auto_70737 ) ) ( not ( = ?auto_70734 ?auto_70738 ) ) ( not ( = ?auto_70734 ?auto_70739 ) ) ( not ( = ?auto_70734 ?auto_70740 ) ) ( not ( = ?auto_70734 ?auto_70741 ) ) ( not ( = ?auto_70734 ?auto_70742 ) ) ( not ( = ?auto_70734 ?auto_70743 ) ) ( not ( = ?auto_70735 ?auto_70736 ) ) ( not ( = ?auto_70735 ?auto_70737 ) ) ( not ( = ?auto_70735 ?auto_70738 ) ) ( not ( = ?auto_70735 ?auto_70739 ) ) ( not ( = ?auto_70735 ?auto_70740 ) ) ( not ( = ?auto_70735 ?auto_70741 ) ) ( not ( = ?auto_70735 ?auto_70742 ) ) ( not ( = ?auto_70735 ?auto_70743 ) ) ( not ( = ?auto_70736 ?auto_70737 ) ) ( not ( = ?auto_70736 ?auto_70738 ) ) ( not ( = ?auto_70736 ?auto_70739 ) ) ( not ( = ?auto_70736 ?auto_70740 ) ) ( not ( = ?auto_70736 ?auto_70741 ) ) ( not ( = ?auto_70736 ?auto_70742 ) ) ( not ( = ?auto_70736 ?auto_70743 ) ) ( not ( = ?auto_70737 ?auto_70738 ) ) ( not ( = ?auto_70737 ?auto_70739 ) ) ( not ( = ?auto_70737 ?auto_70740 ) ) ( not ( = ?auto_70737 ?auto_70741 ) ) ( not ( = ?auto_70737 ?auto_70742 ) ) ( not ( = ?auto_70737 ?auto_70743 ) ) ( not ( = ?auto_70738 ?auto_70739 ) ) ( not ( = ?auto_70738 ?auto_70740 ) ) ( not ( = ?auto_70738 ?auto_70741 ) ) ( not ( = ?auto_70738 ?auto_70742 ) ) ( not ( = ?auto_70738 ?auto_70743 ) ) ( not ( = ?auto_70739 ?auto_70740 ) ) ( not ( = ?auto_70739 ?auto_70741 ) ) ( not ( = ?auto_70739 ?auto_70742 ) ) ( not ( = ?auto_70739 ?auto_70743 ) ) ( not ( = ?auto_70740 ?auto_70741 ) ) ( not ( = ?auto_70740 ?auto_70742 ) ) ( not ( = ?auto_70740 ?auto_70743 ) ) ( not ( = ?auto_70741 ?auto_70742 ) ) ( not ( = ?auto_70741 ?auto_70743 ) ) ( not ( = ?auto_70742 ?auto_70743 ) ) ( CLEAR ?auto_70740 ) ( ON ?auto_70741 ?auto_70742 ) ( CLEAR ?auto_70741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_70734 ?auto_70735 ?auto_70736 ?auto_70737 ?auto_70738 ?auto_70739 ?auto_70740 ?auto_70741 )
      ( MAKE-9PILE ?auto_70734 ?auto_70735 ?auto_70736 ?auto_70737 ?auto_70738 ?auto_70739 ?auto_70740 ?auto_70741 ?auto_70742 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_70753 - BLOCK
      ?auto_70754 - BLOCK
      ?auto_70755 - BLOCK
      ?auto_70756 - BLOCK
      ?auto_70757 - BLOCK
      ?auto_70758 - BLOCK
      ?auto_70759 - BLOCK
      ?auto_70760 - BLOCK
      ?auto_70761 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70761 ) ( ON-TABLE ?auto_70753 ) ( ON ?auto_70754 ?auto_70753 ) ( ON ?auto_70755 ?auto_70754 ) ( ON ?auto_70756 ?auto_70755 ) ( ON ?auto_70757 ?auto_70756 ) ( ON ?auto_70758 ?auto_70757 ) ( ON ?auto_70759 ?auto_70758 ) ( not ( = ?auto_70753 ?auto_70754 ) ) ( not ( = ?auto_70753 ?auto_70755 ) ) ( not ( = ?auto_70753 ?auto_70756 ) ) ( not ( = ?auto_70753 ?auto_70757 ) ) ( not ( = ?auto_70753 ?auto_70758 ) ) ( not ( = ?auto_70753 ?auto_70759 ) ) ( not ( = ?auto_70753 ?auto_70760 ) ) ( not ( = ?auto_70753 ?auto_70761 ) ) ( not ( = ?auto_70754 ?auto_70755 ) ) ( not ( = ?auto_70754 ?auto_70756 ) ) ( not ( = ?auto_70754 ?auto_70757 ) ) ( not ( = ?auto_70754 ?auto_70758 ) ) ( not ( = ?auto_70754 ?auto_70759 ) ) ( not ( = ?auto_70754 ?auto_70760 ) ) ( not ( = ?auto_70754 ?auto_70761 ) ) ( not ( = ?auto_70755 ?auto_70756 ) ) ( not ( = ?auto_70755 ?auto_70757 ) ) ( not ( = ?auto_70755 ?auto_70758 ) ) ( not ( = ?auto_70755 ?auto_70759 ) ) ( not ( = ?auto_70755 ?auto_70760 ) ) ( not ( = ?auto_70755 ?auto_70761 ) ) ( not ( = ?auto_70756 ?auto_70757 ) ) ( not ( = ?auto_70756 ?auto_70758 ) ) ( not ( = ?auto_70756 ?auto_70759 ) ) ( not ( = ?auto_70756 ?auto_70760 ) ) ( not ( = ?auto_70756 ?auto_70761 ) ) ( not ( = ?auto_70757 ?auto_70758 ) ) ( not ( = ?auto_70757 ?auto_70759 ) ) ( not ( = ?auto_70757 ?auto_70760 ) ) ( not ( = ?auto_70757 ?auto_70761 ) ) ( not ( = ?auto_70758 ?auto_70759 ) ) ( not ( = ?auto_70758 ?auto_70760 ) ) ( not ( = ?auto_70758 ?auto_70761 ) ) ( not ( = ?auto_70759 ?auto_70760 ) ) ( not ( = ?auto_70759 ?auto_70761 ) ) ( not ( = ?auto_70760 ?auto_70761 ) ) ( CLEAR ?auto_70759 ) ( ON ?auto_70760 ?auto_70761 ) ( CLEAR ?auto_70760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_70753 ?auto_70754 ?auto_70755 ?auto_70756 ?auto_70757 ?auto_70758 ?auto_70759 ?auto_70760 )
      ( MAKE-9PILE ?auto_70753 ?auto_70754 ?auto_70755 ?auto_70756 ?auto_70757 ?auto_70758 ?auto_70759 ?auto_70760 ?auto_70761 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_70771 - BLOCK
      ?auto_70772 - BLOCK
      ?auto_70773 - BLOCK
      ?auto_70774 - BLOCK
      ?auto_70775 - BLOCK
      ?auto_70776 - BLOCK
      ?auto_70777 - BLOCK
      ?auto_70778 - BLOCK
      ?auto_70779 - BLOCK
    )
    :vars
    (
      ?auto_70780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70779 ?auto_70780 ) ( ON-TABLE ?auto_70771 ) ( ON ?auto_70772 ?auto_70771 ) ( ON ?auto_70773 ?auto_70772 ) ( ON ?auto_70774 ?auto_70773 ) ( ON ?auto_70775 ?auto_70774 ) ( ON ?auto_70776 ?auto_70775 ) ( not ( = ?auto_70771 ?auto_70772 ) ) ( not ( = ?auto_70771 ?auto_70773 ) ) ( not ( = ?auto_70771 ?auto_70774 ) ) ( not ( = ?auto_70771 ?auto_70775 ) ) ( not ( = ?auto_70771 ?auto_70776 ) ) ( not ( = ?auto_70771 ?auto_70777 ) ) ( not ( = ?auto_70771 ?auto_70778 ) ) ( not ( = ?auto_70771 ?auto_70779 ) ) ( not ( = ?auto_70771 ?auto_70780 ) ) ( not ( = ?auto_70772 ?auto_70773 ) ) ( not ( = ?auto_70772 ?auto_70774 ) ) ( not ( = ?auto_70772 ?auto_70775 ) ) ( not ( = ?auto_70772 ?auto_70776 ) ) ( not ( = ?auto_70772 ?auto_70777 ) ) ( not ( = ?auto_70772 ?auto_70778 ) ) ( not ( = ?auto_70772 ?auto_70779 ) ) ( not ( = ?auto_70772 ?auto_70780 ) ) ( not ( = ?auto_70773 ?auto_70774 ) ) ( not ( = ?auto_70773 ?auto_70775 ) ) ( not ( = ?auto_70773 ?auto_70776 ) ) ( not ( = ?auto_70773 ?auto_70777 ) ) ( not ( = ?auto_70773 ?auto_70778 ) ) ( not ( = ?auto_70773 ?auto_70779 ) ) ( not ( = ?auto_70773 ?auto_70780 ) ) ( not ( = ?auto_70774 ?auto_70775 ) ) ( not ( = ?auto_70774 ?auto_70776 ) ) ( not ( = ?auto_70774 ?auto_70777 ) ) ( not ( = ?auto_70774 ?auto_70778 ) ) ( not ( = ?auto_70774 ?auto_70779 ) ) ( not ( = ?auto_70774 ?auto_70780 ) ) ( not ( = ?auto_70775 ?auto_70776 ) ) ( not ( = ?auto_70775 ?auto_70777 ) ) ( not ( = ?auto_70775 ?auto_70778 ) ) ( not ( = ?auto_70775 ?auto_70779 ) ) ( not ( = ?auto_70775 ?auto_70780 ) ) ( not ( = ?auto_70776 ?auto_70777 ) ) ( not ( = ?auto_70776 ?auto_70778 ) ) ( not ( = ?auto_70776 ?auto_70779 ) ) ( not ( = ?auto_70776 ?auto_70780 ) ) ( not ( = ?auto_70777 ?auto_70778 ) ) ( not ( = ?auto_70777 ?auto_70779 ) ) ( not ( = ?auto_70777 ?auto_70780 ) ) ( not ( = ?auto_70778 ?auto_70779 ) ) ( not ( = ?auto_70778 ?auto_70780 ) ) ( not ( = ?auto_70779 ?auto_70780 ) ) ( ON ?auto_70778 ?auto_70779 ) ( CLEAR ?auto_70776 ) ( ON ?auto_70777 ?auto_70778 ) ( CLEAR ?auto_70777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_70771 ?auto_70772 ?auto_70773 ?auto_70774 ?auto_70775 ?auto_70776 ?auto_70777 )
      ( MAKE-9PILE ?auto_70771 ?auto_70772 ?auto_70773 ?auto_70774 ?auto_70775 ?auto_70776 ?auto_70777 ?auto_70778 ?auto_70779 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_70790 - BLOCK
      ?auto_70791 - BLOCK
      ?auto_70792 - BLOCK
      ?auto_70793 - BLOCK
      ?auto_70794 - BLOCK
      ?auto_70795 - BLOCK
      ?auto_70796 - BLOCK
      ?auto_70797 - BLOCK
      ?auto_70798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70798 ) ( ON-TABLE ?auto_70790 ) ( ON ?auto_70791 ?auto_70790 ) ( ON ?auto_70792 ?auto_70791 ) ( ON ?auto_70793 ?auto_70792 ) ( ON ?auto_70794 ?auto_70793 ) ( ON ?auto_70795 ?auto_70794 ) ( not ( = ?auto_70790 ?auto_70791 ) ) ( not ( = ?auto_70790 ?auto_70792 ) ) ( not ( = ?auto_70790 ?auto_70793 ) ) ( not ( = ?auto_70790 ?auto_70794 ) ) ( not ( = ?auto_70790 ?auto_70795 ) ) ( not ( = ?auto_70790 ?auto_70796 ) ) ( not ( = ?auto_70790 ?auto_70797 ) ) ( not ( = ?auto_70790 ?auto_70798 ) ) ( not ( = ?auto_70791 ?auto_70792 ) ) ( not ( = ?auto_70791 ?auto_70793 ) ) ( not ( = ?auto_70791 ?auto_70794 ) ) ( not ( = ?auto_70791 ?auto_70795 ) ) ( not ( = ?auto_70791 ?auto_70796 ) ) ( not ( = ?auto_70791 ?auto_70797 ) ) ( not ( = ?auto_70791 ?auto_70798 ) ) ( not ( = ?auto_70792 ?auto_70793 ) ) ( not ( = ?auto_70792 ?auto_70794 ) ) ( not ( = ?auto_70792 ?auto_70795 ) ) ( not ( = ?auto_70792 ?auto_70796 ) ) ( not ( = ?auto_70792 ?auto_70797 ) ) ( not ( = ?auto_70792 ?auto_70798 ) ) ( not ( = ?auto_70793 ?auto_70794 ) ) ( not ( = ?auto_70793 ?auto_70795 ) ) ( not ( = ?auto_70793 ?auto_70796 ) ) ( not ( = ?auto_70793 ?auto_70797 ) ) ( not ( = ?auto_70793 ?auto_70798 ) ) ( not ( = ?auto_70794 ?auto_70795 ) ) ( not ( = ?auto_70794 ?auto_70796 ) ) ( not ( = ?auto_70794 ?auto_70797 ) ) ( not ( = ?auto_70794 ?auto_70798 ) ) ( not ( = ?auto_70795 ?auto_70796 ) ) ( not ( = ?auto_70795 ?auto_70797 ) ) ( not ( = ?auto_70795 ?auto_70798 ) ) ( not ( = ?auto_70796 ?auto_70797 ) ) ( not ( = ?auto_70796 ?auto_70798 ) ) ( not ( = ?auto_70797 ?auto_70798 ) ) ( ON ?auto_70797 ?auto_70798 ) ( CLEAR ?auto_70795 ) ( ON ?auto_70796 ?auto_70797 ) ( CLEAR ?auto_70796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_70790 ?auto_70791 ?auto_70792 ?auto_70793 ?auto_70794 ?auto_70795 ?auto_70796 )
      ( MAKE-9PILE ?auto_70790 ?auto_70791 ?auto_70792 ?auto_70793 ?auto_70794 ?auto_70795 ?auto_70796 ?auto_70797 ?auto_70798 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_70808 - BLOCK
      ?auto_70809 - BLOCK
      ?auto_70810 - BLOCK
      ?auto_70811 - BLOCK
      ?auto_70812 - BLOCK
      ?auto_70813 - BLOCK
      ?auto_70814 - BLOCK
      ?auto_70815 - BLOCK
      ?auto_70816 - BLOCK
    )
    :vars
    (
      ?auto_70817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70816 ?auto_70817 ) ( ON-TABLE ?auto_70808 ) ( ON ?auto_70809 ?auto_70808 ) ( ON ?auto_70810 ?auto_70809 ) ( ON ?auto_70811 ?auto_70810 ) ( ON ?auto_70812 ?auto_70811 ) ( not ( = ?auto_70808 ?auto_70809 ) ) ( not ( = ?auto_70808 ?auto_70810 ) ) ( not ( = ?auto_70808 ?auto_70811 ) ) ( not ( = ?auto_70808 ?auto_70812 ) ) ( not ( = ?auto_70808 ?auto_70813 ) ) ( not ( = ?auto_70808 ?auto_70814 ) ) ( not ( = ?auto_70808 ?auto_70815 ) ) ( not ( = ?auto_70808 ?auto_70816 ) ) ( not ( = ?auto_70808 ?auto_70817 ) ) ( not ( = ?auto_70809 ?auto_70810 ) ) ( not ( = ?auto_70809 ?auto_70811 ) ) ( not ( = ?auto_70809 ?auto_70812 ) ) ( not ( = ?auto_70809 ?auto_70813 ) ) ( not ( = ?auto_70809 ?auto_70814 ) ) ( not ( = ?auto_70809 ?auto_70815 ) ) ( not ( = ?auto_70809 ?auto_70816 ) ) ( not ( = ?auto_70809 ?auto_70817 ) ) ( not ( = ?auto_70810 ?auto_70811 ) ) ( not ( = ?auto_70810 ?auto_70812 ) ) ( not ( = ?auto_70810 ?auto_70813 ) ) ( not ( = ?auto_70810 ?auto_70814 ) ) ( not ( = ?auto_70810 ?auto_70815 ) ) ( not ( = ?auto_70810 ?auto_70816 ) ) ( not ( = ?auto_70810 ?auto_70817 ) ) ( not ( = ?auto_70811 ?auto_70812 ) ) ( not ( = ?auto_70811 ?auto_70813 ) ) ( not ( = ?auto_70811 ?auto_70814 ) ) ( not ( = ?auto_70811 ?auto_70815 ) ) ( not ( = ?auto_70811 ?auto_70816 ) ) ( not ( = ?auto_70811 ?auto_70817 ) ) ( not ( = ?auto_70812 ?auto_70813 ) ) ( not ( = ?auto_70812 ?auto_70814 ) ) ( not ( = ?auto_70812 ?auto_70815 ) ) ( not ( = ?auto_70812 ?auto_70816 ) ) ( not ( = ?auto_70812 ?auto_70817 ) ) ( not ( = ?auto_70813 ?auto_70814 ) ) ( not ( = ?auto_70813 ?auto_70815 ) ) ( not ( = ?auto_70813 ?auto_70816 ) ) ( not ( = ?auto_70813 ?auto_70817 ) ) ( not ( = ?auto_70814 ?auto_70815 ) ) ( not ( = ?auto_70814 ?auto_70816 ) ) ( not ( = ?auto_70814 ?auto_70817 ) ) ( not ( = ?auto_70815 ?auto_70816 ) ) ( not ( = ?auto_70815 ?auto_70817 ) ) ( not ( = ?auto_70816 ?auto_70817 ) ) ( ON ?auto_70815 ?auto_70816 ) ( ON ?auto_70814 ?auto_70815 ) ( CLEAR ?auto_70812 ) ( ON ?auto_70813 ?auto_70814 ) ( CLEAR ?auto_70813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70808 ?auto_70809 ?auto_70810 ?auto_70811 ?auto_70812 ?auto_70813 )
      ( MAKE-9PILE ?auto_70808 ?auto_70809 ?auto_70810 ?auto_70811 ?auto_70812 ?auto_70813 ?auto_70814 ?auto_70815 ?auto_70816 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_70827 - BLOCK
      ?auto_70828 - BLOCK
      ?auto_70829 - BLOCK
      ?auto_70830 - BLOCK
      ?auto_70831 - BLOCK
      ?auto_70832 - BLOCK
      ?auto_70833 - BLOCK
      ?auto_70834 - BLOCK
      ?auto_70835 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70835 ) ( ON-TABLE ?auto_70827 ) ( ON ?auto_70828 ?auto_70827 ) ( ON ?auto_70829 ?auto_70828 ) ( ON ?auto_70830 ?auto_70829 ) ( ON ?auto_70831 ?auto_70830 ) ( not ( = ?auto_70827 ?auto_70828 ) ) ( not ( = ?auto_70827 ?auto_70829 ) ) ( not ( = ?auto_70827 ?auto_70830 ) ) ( not ( = ?auto_70827 ?auto_70831 ) ) ( not ( = ?auto_70827 ?auto_70832 ) ) ( not ( = ?auto_70827 ?auto_70833 ) ) ( not ( = ?auto_70827 ?auto_70834 ) ) ( not ( = ?auto_70827 ?auto_70835 ) ) ( not ( = ?auto_70828 ?auto_70829 ) ) ( not ( = ?auto_70828 ?auto_70830 ) ) ( not ( = ?auto_70828 ?auto_70831 ) ) ( not ( = ?auto_70828 ?auto_70832 ) ) ( not ( = ?auto_70828 ?auto_70833 ) ) ( not ( = ?auto_70828 ?auto_70834 ) ) ( not ( = ?auto_70828 ?auto_70835 ) ) ( not ( = ?auto_70829 ?auto_70830 ) ) ( not ( = ?auto_70829 ?auto_70831 ) ) ( not ( = ?auto_70829 ?auto_70832 ) ) ( not ( = ?auto_70829 ?auto_70833 ) ) ( not ( = ?auto_70829 ?auto_70834 ) ) ( not ( = ?auto_70829 ?auto_70835 ) ) ( not ( = ?auto_70830 ?auto_70831 ) ) ( not ( = ?auto_70830 ?auto_70832 ) ) ( not ( = ?auto_70830 ?auto_70833 ) ) ( not ( = ?auto_70830 ?auto_70834 ) ) ( not ( = ?auto_70830 ?auto_70835 ) ) ( not ( = ?auto_70831 ?auto_70832 ) ) ( not ( = ?auto_70831 ?auto_70833 ) ) ( not ( = ?auto_70831 ?auto_70834 ) ) ( not ( = ?auto_70831 ?auto_70835 ) ) ( not ( = ?auto_70832 ?auto_70833 ) ) ( not ( = ?auto_70832 ?auto_70834 ) ) ( not ( = ?auto_70832 ?auto_70835 ) ) ( not ( = ?auto_70833 ?auto_70834 ) ) ( not ( = ?auto_70833 ?auto_70835 ) ) ( not ( = ?auto_70834 ?auto_70835 ) ) ( ON ?auto_70834 ?auto_70835 ) ( ON ?auto_70833 ?auto_70834 ) ( CLEAR ?auto_70831 ) ( ON ?auto_70832 ?auto_70833 ) ( CLEAR ?auto_70832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70827 ?auto_70828 ?auto_70829 ?auto_70830 ?auto_70831 ?auto_70832 )
      ( MAKE-9PILE ?auto_70827 ?auto_70828 ?auto_70829 ?auto_70830 ?auto_70831 ?auto_70832 ?auto_70833 ?auto_70834 ?auto_70835 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_70845 - BLOCK
      ?auto_70846 - BLOCK
      ?auto_70847 - BLOCK
      ?auto_70848 - BLOCK
      ?auto_70849 - BLOCK
      ?auto_70850 - BLOCK
      ?auto_70851 - BLOCK
      ?auto_70852 - BLOCK
      ?auto_70853 - BLOCK
    )
    :vars
    (
      ?auto_70854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70853 ?auto_70854 ) ( ON-TABLE ?auto_70845 ) ( ON ?auto_70846 ?auto_70845 ) ( ON ?auto_70847 ?auto_70846 ) ( ON ?auto_70848 ?auto_70847 ) ( not ( = ?auto_70845 ?auto_70846 ) ) ( not ( = ?auto_70845 ?auto_70847 ) ) ( not ( = ?auto_70845 ?auto_70848 ) ) ( not ( = ?auto_70845 ?auto_70849 ) ) ( not ( = ?auto_70845 ?auto_70850 ) ) ( not ( = ?auto_70845 ?auto_70851 ) ) ( not ( = ?auto_70845 ?auto_70852 ) ) ( not ( = ?auto_70845 ?auto_70853 ) ) ( not ( = ?auto_70845 ?auto_70854 ) ) ( not ( = ?auto_70846 ?auto_70847 ) ) ( not ( = ?auto_70846 ?auto_70848 ) ) ( not ( = ?auto_70846 ?auto_70849 ) ) ( not ( = ?auto_70846 ?auto_70850 ) ) ( not ( = ?auto_70846 ?auto_70851 ) ) ( not ( = ?auto_70846 ?auto_70852 ) ) ( not ( = ?auto_70846 ?auto_70853 ) ) ( not ( = ?auto_70846 ?auto_70854 ) ) ( not ( = ?auto_70847 ?auto_70848 ) ) ( not ( = ?auto_70847 ?auto_70849 ) ) ( not ( = ?auto_70847 ?auto_70850 ) ) ( not ( = ?auto_70847 ?auto_70851 ) ) ( not ( = ?auto_70847 ?auto_70852 ) ) ( not ( = ?auto_70847 ?auto_70853 ) ) ( not ( = ?auto_70847 ?auto_70854 ) ) ( not ( = ?auto_70848 ?auto_70849 ) ) ( not ( = ?auto_70848 ?auto_70850 ) ) ( not ( = ?auto_70848 ?auto_70851 ) ) ( not ( = ?auto_70848 ?auto_70852 ) ) ( not ( = ?auto_70848 ?auto_70853 ) ) ( not ( = ?auto_70848 ?auto_70854 ) ) ( not ( = ?auto_70849 ?auto_70850 ) ) ( not ( = ?auto_70849 ?auto_70851 ) ) ( not ( = ?auto_70849 ?auto_70852 ) ) ( not ( = ?auto_70849 ?auto_70853 ) ) ( not ( = ?auto_70849 ?auto_70854 ) ) ( not ( = ?auto_70850 ?auto_70851 ) ) ( not ( = ?auto_70850 ?auto_70852 ) ) ( not ( = ?auto_70850 ?auto_70853 ) ) ( not ( = ?auto_70850 ?auto_70854 ) ) ( not ( = ?auto_70851 ?auto_70852 ) ) ( not ( = ?auto_70851 ?auto_70853 ) ) ( not ( = ?auto_70851 ?auto_70854 ) ) ( not ( = ?auto_70852 ?auto_70853 ) ) ( not ( = ?auto_70852 ?auto_70854 ) ) ( not ( = ?auto_70853 ?auto_70854 ) ) ( ON ?auto_70852 ?auto_70853 ) ( ON ?auto_70851 ?auto_70852 ) ( ON ?auto_70850 ?auto_70851 ) ( CLEAR ?auto_70848 ) ( ON ?auto_70849 ?auto_70850 ) ( CLEAR ?auto_70849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70845 ?auto_70846 ?auto_70847 ?auto_70848 ?auto_70849 )
      ( MAKE-9PILE ?auto_70845 ?auto_70846 ?auto_70847 ?auto_70848 ?auto_70849 ?auto_70850 ?auto_70851 ?auto_70852 ?auto_70853 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_70864 - BLOCK
      ?auto_70865 - BLOCK
      ?auto_70866 - BLOCK
      ?auto_70867 - BLOCK
      ?auto_70868 - BLOCK
      ?auto_70869 - BLOCK
      ?auto_70870 - BLOCK
      ?auto_70871 - BLOCK
      ?auto_70872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70872 ) ( ON-TABLE ?auto_70864 ) ( ON ?auto_70865 ?auto_70864 ) ( ON ?auto_70866 ?auto_70865 ) ( ON ?auto_70867 ?auto_70866 ) ( not ( = ?auto_70864 ?auto_70865 ) ) ( not ( = ?auto_70864 ?auto_70866 ) ) ( not ( = ?auto_70864 ?auto_70867 ) ) ( not ( = ?auto_70864 ?auto_70868 ) ) ( not ( = ?auto_70864 ?auto_70869 ) ) ( not ( = ?auto_70864 ?auto_70870 ) ) ( not ( = ?auto_70864 ?auto_70871 ) ) ( not ( = ?auto_70864 ?auto_70872 ) ) ( not ( = ?auto_70865 ?auto_70866 ) ) ( not ( = ?auto_70865 ?auto_70867 ) ) ( not ( = ?auto_70865 ?auto_70868 ) ) ( not ( = ?auto_70865 ?auto_70869 ) ) ( not ( = ?auto_70865 ?auto_70870 ) ) ( not ( = ?auto_70865 ?auto_70871 ) ) ( not ( = ?auto_70865 ?auto_70872 ) ) ( not ( = ?auto_70866 ?auto_70867 ) ) ( not ( = ?auto_70866 ?auto_70868 ) ) ( not ( = ?auto_70866 ?auto_70869 ) ) ( not ( = ?auto_70866 ?auto_70870 ) ) ( not ( = ?auto_70866 ?auto_70871 ) ) ( not ( = ?auto_70866 ?auto_70872 ) ) ( not ( = ?auto_70867 ?auto_70868 ) ) ( not ( = ?auto_70867 ?auto_70869 ) ) ( not ( = ?auto_70867 ?auto_70870 ) ) ( not ( = ?auto_70867 ?auto_70871 ) ) ( not ( = ?auto_70867 ?auto_70872 ) ) ( not ( = ?auto_70868 ?auto_70869 ) ) ( not ( = ?auto_70868 ?auto_70870 ) ) ( not ( = ?auto_70868 ?auto_70871 ) ) ( not ( = ?auto_70868 ?auto_70872 ) ) ( not ( = ?auto_70869 ?auto_70870 ) ) ( not ( = ?auto_70869 ?auto_70871 ) ) ( not ( = ?auto_70869 ?auto_70872 ) ) ( not ( = ?auto_70870 ?auto_70871 ) ) ( not ( = ?auto_70870 ?auto_70872 ) ) ( not ( = ?auto_70871 ?auto_70872 ) ) ( ON ?auto_70871 ?auto_70872 ) ( ON ?auto_70870 ?auto_70871 ) ( ON ?auto_70869 ?auto_70870 ) ( CLEAR ?auto_70867 ) ( ON ?auto_70868 ?auto_70869 ) ( CLEAR ?auto_70868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70864 ?auto_70865 ?auto_70866 ?auto_70867 ?auto_70868 )
      ( MAKE-9PILE ?auto_70864 ?auto_70865 ?auto_70866 ?auto_70867 ?auto_70868 ?auto_70869 ?auto_70870 ?auto_70871 ?auto_70872 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_70882 - BLOCK
      ?auto_70883 - BLOCK
      ?auto_70884 - BLOCK
      ?auto_70885 - BLOCK
      ?auto_70886 - BLOCK
      ?auto_70887 - BLOCK
      ?auto_70888 - BLOCK
      ?auto_70889 - BLOCK
      ?auto_70890 - BLOCK
    )
    :vars
    (
      ?auto_70891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70890 ?auto_70891 ) ( ON-TABLE ?auto_70882 ) ( ON ?auto_70883 ?auto_70882 ) ( ON ?auto_70884 ?auto_70883 ) ( not ( = ?auto_70882 ?auto_70883 ) ) ( not ( = ?auto_70882 ?auto_70884 ) ) ( not ( = ?auto_70882 ?auto_70885 ) ) ( not ( = ?auto_70882 ?auto_70886 ) ) ( not ( = ?auto_70882 ?auto_70887 ) ) ( not ( = ?auto_70882 ?auto_70888 ) ) ( not ( = ?auto_70882 ?auto_70889 ) ) ( not ( = ?auto_70882 ?auto_70890 ) ) ( not ( = ?auto_70882 ?auto_70891 ) ) ( not ( = ?auto_70883 ?auto_70884 ) ) ( not ( = ?auto_70883 ?auto_70885 ) ) ( not ( = ?auto_70883 ?auto_70886 ) ) ( not ( = ?auto_70883 ?auto_70887 ) ) ( not ( = ?auto_70883 ?auto_70888 ) ) ( not ( = ?auto_70883 ?auto_70889 ) ) ( not ( = ?auto_70883 ?auto_70890 ) ) ( not ( = ?auto_70883 ?auto_70891 ) ) ( not ( = ?auto_70884 ?auto_70885 ) ) ( not ( = ?auto_70884 ?auto_70886 ) ) ( not ( = ?auto_70884 ?auto_70887 ) ) ( not ( = ?auto_70884 ?auto_70888 ) ) ( not ( = ?auto_70884 ?auto_70889 ) ) ( not ( = ?auto_70884 ?auto_70890 ) ) ( not ( = ?auto_70884 ?auto_70891 ) ) ( not ( = ?auto_70885 ?auto_70886 ) ) ( not ( = ?auto_70885 ?auto_70887 ) ) ( not ( = ?auto_70885 ?auto_70888 ) ) ( not ( = ?auto_70885 ?auto_70889 ) ) ( not ( = ?auto_70885 ?auto_70890 ) ) ( not ( = ?auto_70885 ?auto_70891 ) ) ( not ( = ?auto_70886 ?auto_70887 ) ) ( not ( = ?auto_70886 ?auto_70888 ) ) ( not ( = ?auto_70886 ?auto_70889 ) ) ( not ( = ?auto_70886 ?auto_70890 ) ) ( not ( = ?auto_70886 ?auto_70891 ) ) ( not ( = ?auto_70887 ?auto_70888 ) ) ( not ( = ?auto_70887 ?auto_70889 ) ) ( not ( = ?auto_70887 ?auto_70890 ) ) ( not ( = ?auto_70887 ?auto_70891 ) ) ( not ( = ?auto_70888 ?auto_70889 ) ) ( not ( = ?auto_70888 ?auto_70890 ) ) ( not ( = ?auto_70888 ?auto_70891 ) ) ( not ( = ?auto_70889 ?auto_70890 ) ) ( not ( = ?auto_70889 ?auto_70891 ) ) ( not ( = ?auto_70890 ?auto_70891 ) ) ( ON ?auto_70889 ?auto_70890 ) ( ON ?auto_70888 ?auto_70889 ) ( ON ?auto_70887 ?auto_70888 ) ( ON ?auto_70886 ?auto_70887 ) ( CLEAR ?auto_70884 ) ( ON ?auto_70885 ?auto_70886 ) ( CLEAR ?auto_70885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70882 ?auto_70883 ?auto_70884 ?auto_70885 )
      ( MAKE-9PILE ?auto_70882 ?auto_70883 ?auto_70884 ?auto_70885 ?auto_70886 ?auto_70887 ?auto_70888 ?auto_70889 ?auto_70890 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_70901 - BLOCK
      ?auto_70902 - BLOCK
      ?auto_70903 - BLOCK
      ?auto_70904 - BLOCK
      ?auto_70905 - BLOCK
      ?auto_70906 - BLOCK
      ?auto_70907 - BLOCK
      ?auto_70908 - BLOCK
      ?auto_70909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70909 ) ( ON-TABLE ?auto_70901 ) ( ON ?auto_70902 ?auto_70901 ) ( ON ?auto_70903 ?auto_70902 ) ( not ( = ?auto_70901 ?auto_70902 ) ) ( not ( = ?auto_70901 ?auto_70903 ) ) ( not ( = ?auto_70901 ?auto_70904 ) ) ( not ( = ?auto_70901 ?auto_70905 ) ) ( not ( = ?auto_70901 ?auto_70906 ) ) ( not ( = ?auto_70901 ?auto_70907 ) ) ( not ( = ?auto_70901 ?auto_70908 ) ) ( not ( = ?auto_70901 ?auto_70909 ) ) ( not ( = ?auto_70902 ?auto_70903 ) ) ( not ( = ?auto_70902 ?auto_70904 ) ) ( not ( = ?auto_70902 ?auto_70905 ) ) ( not ( = ?auto_70902 ?auto_70906 ) ) ( not ( = ?auto_70902 ?auto_70907 ) ) ( not ( = ?auto_70902 ?auto_70908 ) ) ( not ( = ?auto_70902 ?auto_70909 ) ) ( not ( = ?auto_70903 ?auto_70904 ) ) ( not ( = ?auto_70903 ?auto_70905 ) ) ( not ( = ?auto_70903 ?auto_70906 ) ) ( not ( = ?auto_70903 ?auto_70907 ) ) ( not ( = ?auto_70903 ?auto_70908 ) ) ( not ( = ?auto_70903 ?auto_70909 ) ) ( not ( = ?auto_70904 ?auto_70905 ) ) ( not ( = ?auto_70904 ?auto_70906 ) ) ( not ( = ?auto_70904 ?auto_70907 ) ) ( not ( = ?auto_70904 ?auto_70908 ) ) ( not ( = ?auto_70904 ?auto_70909 ) ) ( not ( = ?auto_70905 ?auto_70906 ) ) ( not ( = ?auto_70905 ?auto_70907 ) ) ( not ( = ?auto_70905 ?auto_70908 ) ) ( not ( = ?auto_70905 ?auto_70909 ) ) ( not ( = ?auto_70906 ?auto_70907 ) ) ( not ( = ?auto_70906 ?auto_70908 ) ) ( not ( = ?auto_70906 ?auto_70909 ) ) ( not ( = ?auto_70907 ?auto_70908 ) ) ( not ( = ?auto_70907 ?auto_70909 ) ) ( not ( = ?auto_70908 ?auto_70909 ) ) ( ON ?auto_70908 ?auto_70909 ) ( ON ?auto_70907 ?auto_70908 ) ( ON ?auto_70906 ?auto_70907 ) ( ON ?auto_70905 ?auto_70906 ) ( CLEAR ?auto_70903 ) ( ON ?auto_70904 ?auto_70905 ) ( CLEAR ?auto_70904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70901 ?auto_70902 ?auto_70903 ?auto_70904 )
      ( MAKE-9PILE ?auto_70901 ?auto_70902 ?auto_70903 ?auto_70904 ?auto_70905 ?auto_70906 ?auto_70907 ?auto_70908 ?auto_70909 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_70919 - BLOCK
      ?auto_70920 - BLOCK
      ?auto_70921 - BLOCK
      ?auto_70922 - BLOCK
      ?auto_70923 - BLOCK
      ?auto_70924 - BLOCK
      ?auto_70925 - BLOCK
      ?auto_70926 - BLOCK
      ?auto_70927 - BLOCK
    )
    :vars
    (
      ?auto_70928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70927 ?auto_70928 ) ( ON-TABLE ?auto_70919 ) ( ON ?auto_70920 ?auto_70919 ) ( not ( = ?auto_70919 ?auto_70920 ) ) ( not ( = ?auto_70919 ?auto_70921 ) ) ( not ( = ?auto_70919 ?auto_70922 ) ) ( not ( = ?auto_70919 ?auto_70923 ) ) ( not ( = ?auto_70919 ?auto_70924 ) ) ( not ( = ?auto_70919 ?auto_70925 ) ) ( not ( = ?auto_70919 ?auto_70926 ) ) ( not ( = ?auto_70919 ?auto_70927 ) ) ( not ( = ?auto_70919 ?auto_70928 ) ) ( not ( = ?auto_70920 ?auto_70921 ) ) ( not ( = ?auto_70920 ?auto_70922 ) ) ( not ( = ?auto_70920 ?auto_70923 ) ) ( not ( = ?auto_70920 ?auto_70924 ) ) ( not ( = ?auto_70920 ?auto_70925 ) ) ( not ( = ?auto_70920 ?auto_70926 ) ) ( not ( = ?auto_70920 ?auto_70927 ) ) ( not ( = ?auto_70920 ?auto_70928 ) ) ( not ( = ?auto_70921 ?auto_70922 ) ) ( not ( = ?auto_70921 ?auto_70923 ) ) ( not ( = ?auto_70921 ?auto_70924 ) ) ( not ( = ?auto_70921 ?auto_70925 ) ) ( not ( = ?auto_70921 ?auto_70926 ) ) ( not ( = ?auto_70921 ?auto_70927 ) ) ( not ( = ?auto_70921 ?auto_70928 ) ) ( not ( = ?auto_70922 ?auto_70923 ) ) ( not ( = ?auto_70922 ?auto_70924 ) ) ( not ( = ?auto_70922 ?auto_70925 ) ) ( not ( = ?auto_70922 ?auto_70926 ) ) ( not ( = ?auto_70922 ?auto_70927 ) ) ( not ( = ?auto_70922 ?auto_70928 ) ) ( not ( = ?auto_70923 ?auto_70924 ) ) ( not ( = ?auto_70923 ?auto_70925 ) ) ( not ( = ?auto_70923 ?auto_70926 ) ) ( not ( = ?auto_70923 ?auto_70927 ) ) ( not ( = ?auto_70923 ?auto_70928 ) ) ( not ( = ?auto_70924 ?auto_70925 ) ) ( not ( = ?auto_70924 ?auto_70926 ) ) ( not ( = ?auto_70924 ?auto_70927 ) ) ( not ( = ?auto_70924 ?auto_70928 ) ) ( not ( = ?auto_70925 ?auto_70926 ) ) ( not ( = ?auto_70925 ?auto_70927 ) ) ( not ( = ?auto_70925 ?auto_70928 ) ) ( not ( = ?auto_70926 ?auto_70927 ) ) ( not ( = ?auto_70926 ?auto_70928 ) ) ( not ( = ?auto_70927 ?auto_70928 ) ) ( ON ?auto_70926 ?auto_70927 ) ( ON ?auto_70925 ?auto_70926 ) ( ON ?auto_70924 ?auto_70925 ) ( ON ?auto_70923 ?auto_70924 ) ( ON ?auto_70922 ?auto_70923 ) ( CLEAR ?auto_70920 ) ( ON ?auto_70921 ?auto_70922 ) ( CLEAR ?auto_70921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70919 ?auto_70920 ?auto_70921 )
      ( MAKE-9PILE ?auto_70919 ?auto_70920 ?auto_70921 ?auto_70922 ?auto_70923 ?auto_70924 ?auto_70925 ?auto_70926 ?auto_70927 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_70938 - BLOCK
      ?auto_70939 - BLOCK
      ?auto_70940 - BLOCK
      ?auto_70941 - BLOCK
      ?auto_70942 - BLOCK
      ?auto_70943 - BLOCK
      ?auto_70944 - BLOCK
      ?auto_70945 - BLOCK
      ?auto_70946 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70946 ) ( ON-TABLE ?auto_70938 ) ( ON ?auto_70939 ?auto_70938 ) ( not ( = ?auto_70938 ?auto_70939 ) ) ( not ( = ?auto_70938 ?auto_70940 ) ) ( not ( = ?auto_70938 ?auto_70941 ) ) ( not ( = ?auto_70938 ?auto_70942 ) ) ( not ( = ?auto_70938 ?auto_70943 ) ) ( not ( = ?auto_70938 ?auto_70944 ) ) ( not ( = ?auto_70938 ?auto_70945 ) ) ( not ( = ?auto_70938 ?auto_70946 ) ) ( not ( = ?auto_70939 ?auto_70940 ) ) ( not ( = ?auto_70939 ?auto_70941 ) ) ( not ( = ?auto_70939 ?auto_70942 ) ) ( not ( = ?auto_70939 ?auto_70943 ) ) ( not ( = ?auto_70939 ?auto_70944 ) ) ( not ( = ?auto_70939 ?auto_70945 ) ) ( not ( = ?auto_70939 ?auto_70946 ) ) ( not ( = ?auto_70940 ?auto_70941 ) ) ( not ( = ?auto_70940 ?auto_70942 ) ) ( not ( = ?auto_70940 ?auto_70943 ) ) ( not ( = ?auto_70940 ?auto_70944 ) ) ( not ( = ?auto_70940 ?auto_70945 ) ) ( not ( = ?auto_70940 ?auto_70946 ) ) ( not ( = ?auto_70941 ?auto_70942 ) ) ( not ( = ?auto_70941 ?auto_70943 ) ) ( not ( = ?auto_70941 ?auto_70944 ) ) ( not ( = ?auto_70941 ?auto_70945 ) ) ( not ( = ?auto_70941 ?auto_70946 ) ) ( not ( = ?auto_70942 ?auto_70943 ) ) ( not ( = ?auto_70942 ?auto_70944 ) ) ( not ( = ?auto_70942 ?auto_70945 ) ) ( not ( = ?auto_70942 ?auto_70946 ) ) ( not ( = ?auto_70943 ?auto_70944 ) ) ( not ( = ?auto_70943 ?auto_70945 ) ) ( not ( = ?auto_70943 ?auto_70946 ) ) ( not ( = ?auto_70944 ?auto_70945 ) ) ( not ( = ?auto_70944 ?auto_70946 ) ) ( not ( = ?auto_70945 ?auto_70946 ) ) ( ON ?auto_70945 ?auto_70946 ) ( ON ?auto_70944 ?auto_70945 ) ( ON ?auto_70943 ?auto_70944 ) ( ON ?auto_70942 ?auto_70943 ) ( ON ?auto_70941 ?auto_70942 ) ( CLEAR ?auto_70939 ) ( ON ?auto_70940 ?auto_70941 ) ( CLEAR ?auto_70940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70938 ?auto_70939 ?auto_70940 )
      ( MAKE-9PILE ?auto_70938 ?auto_70939 ?auto_70940 ?auto_70941 ?auto_70942 ?auto_70943 ?auto_70944 ?auto_70945 ?auto_70946 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_70956 - BLOCK
      ?auto_70957 - BLOCK
      ?auto_70958 - BLOCK
      ?auto_70959 - BLOCK
      ?auto_70960 - BLOCK
      ?auto_70961 - BLOCK
      ?auto_70962 - BLOCK
      ?auto_70963 - BLOCK
      ?auto_70964 - BLOCK
    )
    :vars
    (
      ?auto_70965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70964 ?auto_70965 ) ( ON-TABLE ?auto_70956 ) ( not ( = ?auto_70956 ?auto_70957 ) ) ( not ( = ?auto_70956 ?auto_70958 ) ) ( not ( = ?auto_70956 ?auto_70959 ) ) ( not ( = ?auto_70956 ?auto_70960 ) ) ( not ( = ?auto_70956 ?auto_70961 ) ) ( not ( = ?auto_70956 ?auto_70962 ) ) ( not ( = ?auto_70956 ?auto_70963 ) ) ( not ( = ?auto_70956 ?auto_70964 ) ) ( not ( = ?auto_70956 ?auto_70965 ) ) ( not ( = ?auto_70957 ?auto_70958 ) ) ( not ( = ?auto_70957 ?auto_70959 ) ) ( not ( = ?auto_70957 ?auto_70960 ) ) ( not ( = ?auto_70957 ?auto_70961 ) ) ( not ( = ?auto_70957 ?auto_70962 ) ) ( not ( = ?auto_70957 ?auto_70963 ) ) ( not ( = ?auto_70957 ?auto_70964 ) ) ( not ( = ?auto_70957 ?auto_70965 ) ) ( not ( = ?auto_70958 ?auto_70959 ) ) ( not ( = ?auto_70958 ?auto_70960 ) ) ( not ( = ?auto_70958 ?auto_70961 ) ) ( not ( = ?auto_70958 ?auto_70962 ) ) ( not ( = ?auto_70958 ?auto_70963 ) ) ( not ( = ?auto_70958 ?auto_70964 ) ) ( not ( = ?auto_70958 ?auto_70965 ) ) ( not ( = ?auto_70959 ?auto_70960 ) ) ( not ( = ?auto_70959 ?auto_70961 ) ) ( not ( = ?auto_70959 ?auto_70962 ) ) ( not ( = ?auto_70959 ?auto_70963 ) ) ( not ( = ?auto_70959 ?auto_70964 ) ) ( not ( = ?auto_70959 ?auto_70965 ) ) ( not ( = ?auto_70960 ?auto_70961 ) ) ( not ( = ?auto_70960 ?auto_70962 ) ) ( not ( = ?auto_70960 ?auto_70963 ) ) ( not ( = ?auto_70960 ?auto_70964 ) ) ( not ( = ?auto_70960 ?auto_70965 ) ) ( not ( = ?auto_70961 ?auto_70962 ) ) ( not ( = ?auto_70961 ?auto_70963 ) ) ( not ( = ?auto_70961 ?auto_70964 ) ) ( not ( = ?auto_70961 ?auto_70965 ) ) ( not ( = ?auto_70962 ?auto_70963 ) ) ( not ( = ?auto_70962 ?auto_70964 ) ) ( not ( = ?auto_70962 ?auto_70965 ) ) ( not ( = ?auto_70963 ?auto_70964 ) ) ( not ( = ?auto_70963 ?auto_70965 ) ) ( not ( = ?auto_70964 ?auto_70965 ) ) ( ON ?auto_70963 ?auto_70964 ) ( ON ?auto_70962 ?auto_70963 ) ( ON ?auto_70961 ?auto_70962 ) ( ON ?auto_70960 ?auto_70961 ) ( ON ?auto_70959 ?auto_70960 ) ( ON ?auto_70958 ?auto_70959 ) ( CLEAR ?auto_70956 ) ( ON ?auto_70957 ?auto_70958 ) ( CLEAR ?auto_70957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70956 ?auto_70957 )
      ( MAKE-9PILE ?auto_70956 ?auto_70957 ?auto_70958 ?auto_70959 ?auto_70960 ?auto_70961 ?auto_70962 ?auto_70963 ?auto_70964 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_70975 - BLOCK
      ?auto_70976 - BLOCK
      ?auto_70977 - BLOCK
      ?auto_70978 - BLOCK
      ?auto_70979 - BLOCK
      ?auto_70980 - BLOCK
      ?auto_70981 - BLOCK
      ?auto_70982 - BLOCK
      ?auto_70983 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70983 ) ( ON-TABLE ?auto_70975 ) ( not ( = ?auto_70975 ?auto_70976 ) ) ( not ( = ?auto_70975 ?auto_70977 ) ) ( not ( = ?auto_70975 ?auto_70978 ) ) ( not ( = ?auto_70975 ?auto_70979 ) ) ( not ( = ?auto_70975 ?auto_70980 ) ) ( not ( = ?auto_70975 ?auto_70981 ) ) ( not ( = ?auto_70975 ?auto_70982 ) ) ( not ( = ?auto_70975 ?auto_70983 ) ) ( not ( = ?auto_70976 ?auto_70977 ) ) ( not ( = ?auto_70976 ?auto_70978 ) ) ( not ( = ?auto_70976 ?auto_70979 ) ) ( not ( = ?auto_70976 ?auto_70980 ) ) ( not ( = ?auto_70976 ?auto_70981 ) ) ( not ( = ?auto_70976 ?auto_70982 ) ) ( not ( = ?auto_70976 ?auto_70983 ) ) ( not ( = ?auto_70977 ?auto_70978 ) ) ( not ( = ?auto_70977 ?auto_70979 ) ) ( not ( = ?auto_70977 ?auto_70980 ) ) ( not ( = ?auto_70977 ?auto_70981 ) ) ( not ( = ?auto_70977 ?auto_70982 ) ) ( not ( = ?auto_70977 ?auto_70983 ) ) ( not ( = ?auto_70978 ?auto_70979 ) ) ( not ( = ?auto_70978 ?auto_70980 ) ) ( not ( = ?auto_70978 ?auto_70981 ) ) ( not ( = ?auto_70978 ?auto_70982 ) ) ( not ( = ?auto_70978 ?auto_70983 ) ) ( not ( = ?auto_70979 ?auto_70980 ) ) ( not ( = ?auto_70979 ?auto_70981 ) ) ( not ( = ?auto_70979 ?auto_70982 ) ) ( not ( = ?auto_70979 ?auto_70983 ) ) ( not ( = ?auto_70980 ?auto_70981 ) ) ( not ( = ?auto_70980 ?auto_70982 ) ) ( not ( = ?auto_70980 ?auto_70983 ) ) ( not ( = ?auto_70981 ?auto_70982 ) ) ( not ( = ?auto_70981 ?auto_70983 ) ) ( not ( = ?auto_70982 ?auto_70983 ) ) ( ON ?auto_70982 ?auto_70983 ) ( ON ?auto_70981 ?auto_70982 ) ( ON ?auto_70980 ?auto_70981 ) ( ON ?auto_70979 ?auto_70980 ) ( ON ?auto_70978 ?auto_70979 ) ( ON ?auto_70977 ?auto_70978 ) ( CLEAR ?auto_70975 ) ( ON ?auto_70976 ?auto_70977 ) ( CLEAR ?auto_70976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70975 ?auto_70976 )
      ( MAKE-9PILE ?auto_70975 ?auto_70976 ?auto_70977 ?auto_70978 ?auto_70979 ?auto_70980 ?auto_70981 ?auto_70982 ?auto_70983 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_70993 - BLOCK
      ?auto_70994 - BLOCK
      ?auto_70995 - BLOCK
      ?auto_70996 - BLOCK
      ?auto_70997 - BLOCK
      ?auto_70998 - BLOCK
      ?auto_70999 - BLOCK
      ?auto_71000 - BLOCK
      ?auto_71001 - BLOCK
    )
    :vars
    (
      ?auto_71002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71001 ?auto_71002 ) ( not ( = ?auto_70993 ?auto_70994 ) ) ( not ( = ?auto_70993 ?auto_70995 ) ) ( not ( = ?auto_70993 ?auto_70996 ) ) ( not ( = ?auto_70993 ?auto_70997 ) ) ( not ( = ?auto_70993 ?auto_70998 ) ) ( not ( = ?auto_70993 ?auto_70999 ) ) ( not ( = ?auto_70993 ?auto_71000 ) ) ( not ( = ?auto_70993 ?auto_71001 ) ) ( not ( = ?auto_70993 ?auto_71002 ) ) ( not ( = ?auto_70994 ?auto_70995 ) ) ( not ( = ?auto_70994 ?auto_70996 ) ) ( not ( = ?auto_70994 ?auto_70997 ) ) ( not ( = ?auto_70994 ?auto_70998 ) ) ( not ( = ?auto_70994 ?auto_70999 ) ) ( not ( = ?auto_70994 ?auto_71000 ) ) ( not ( = ?auto_70994 ?auto_71001 ) ) ( not ( = ?auto_70994 ?auto_71002 ) ) ( not ( = ?auto_70995 ?auto_70996 ) ) ( not ( = ?auto_70995 ?auto_70997 ) ) ( not ( = ?auto_70995 ?auto_70998 ) ) ( not ( = ?auto_70995 ?auto_70999 ) ) ( not ( = ?auto_70995 ?auto_71000 ) ) ( not ( = ?auto_70995 ?auto_71001 ) ) ( not ( = ?auto_70995 ?auto_71002 ) ) ( not ( = ?auto_70996 ?auto_70997 ) ) ( not ( = ?auto_70996 ?auto_70998 ) ) ( not ( = ?auto_70996 ?auto_70999 ) ) ( not ( = ?auto_70996 ?auto_71000 ) ) ( not ( = ?auto_70996 ?auto_71001 ) ) ( not ( = ?auto_70996 ?auto_71002 ) ) ( not ( = ?auto_70997 ?auto_70998 ) ) ( not ( = ?auto_70997 ?auto_70999 ) ) ( not ( = ?auto_70997 ?auto_71000 ) ) ( not ( = ?auto_70997 ?auto_71001 ) ) ( not ( = ?auto_70997 ?auto_71002 ) ) ( not ( = ?auto_70998 ?auto_70999 ) ) ( not ( = ?auto_70998 ?auto_71000 ) ) ( not ( = ?auto_70998 ?auto_71001 ) ) ( not ( = ?auto_70998 ?auto_71002 ) ) ( not ( = ?auto_70999 ?auto_71000 ) ) ( not ( = ?auto_70999 ?auto_71001 ) ) ( not ( = ?auto_70999 ?auto_71002 ) ) ( not ( = ?auto_71000 ?auto_71001 ) ) ( not ( = ?auto_71000 ?auto_71002 ) ) ( not ( = ?auto_71001 ?auto_71002 ) ) ( ON ?auto_71000 ?auto_71001 ) ( ON ?auto_70999 ?auto_71000 ) ( ON ?auto_70998 ?auto_70999 ) ( ON ?auto_70997 ?auto_70998 ) ( ON ?auto_70996 ?auto_70997 ) ( ON ?auto_70995 ?auto_70996 ) ( ON ?auto_70994 ?auto_70995 ) ( ON ?auto_70993 ?auto_70994 ) ( CLEAR ?auto_70993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70993 )
      ( MAKE-9PILE ?auto_70993 ?auto_70994 ?auto_70995 ?auto_70996 ?auto_70997 ?auto_70998 ?auto_70999 ?auto_71000 ?auto_71001 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_71012 - BLOCK
      ?auto_71013 - BLOCK
      ?auto_71014 - BLOCK
      ?auto_71015 - BLOCK
      ?auto_71016 - BLOCK
      ?auto_71017 - BLOCK
      ?auto_71018 - BLOCK
      ?auto_71019 - BLOCK
      ?auto_71020 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71020 ) ( not ( = ?auto_71012 ?auto_71013 ) ) ( not ( = ?auto_71012 ?auto_71014 ) ) ( not ( = ?auto_71012 ?auto_71015 ) ) ( not ( = ?auto_71012 ?auto_71016 ) ) ( not ( = ?auto_71012 ?auto_71017 ) ) ( not ( = ?auto_71012 ?auto_71018 ) ) ( not ( = ?auto_71012 ?auto_71019 ) ) ( not ( = ?auto_71012 ?auto_71020 ) ) ( not ( = ?auto_71013 ?auto_71014 ) ) ( not ( = ?auto_71013 ?auto_71015 ) ) ( not ( = ?auto_71013 ?auto_71016 ) ) ( not ( = ?auto_71013 ?auto_71017 ) ) ( not ( = ?auto_71013 ?auto_71018 ) ) ( not ( = ?auto_71013 ?auto_71019 ) ) ( not ( = ?auto_71013 ?auto_71020 ) ) ( not ( = ?auto_71014 ?auto_71015 ) ) ( not ( = ?auto_71014 ?auto_71016 ) ) ( not ( = ?auto_71014 ?auto_71017 ) ) ( not ( = ?auto_71014 ?auto_71018 ) ) ( not ( = ?auto_71014 ?auto_71019 ) ) ( not ( = ?auto_71014 ?auto_71020 ) ) ( not ( = ?auto_71015 ?auto_71016 ) ) ( not ( = ?auto_71015 ?auto_71017 ) ) ( not ( = ?auto_71015 ?auto_71018 ) ) ( not ( = ?auto_71015 ?auto_71019 ) ) ( not ( = ?auto_71015 ?auto_71020 ) ) ( not ( = ?auto_71016 ?auto_71017 ) ) ( not ( = ?auto_71016 ?auto_71018 ) ) ( not ( = ?auto_71016 ?auto_71019 ) ) ( not ( = ?auto_71016 ?auto_71020 ) ) ( not ( = ?auto_71017 ?auto_71018 ) ) ( not ( = ?auto_71017 ?auto_71019 ) ) ( not ( = ?auto_71017 ?auto_71020 ) ) ( not ( = ?auto_71018 ?auto_71019 ) ) ( not ( = ?auto_71018 ?auto_71020 ) ) ( not ( = ?auto_71019 ?auto_71020 ) ) ( ON ?auto_71019 ?auto_71020 ) ( ON ?auto_71018 ?auto_71019 ) ( ON ?auto_71017 ?auto_71018 ) ( ON ?auto_71016 ?auto_71017 ) ( ON ?auto_71015 ?auto_71016 ) ( ON ?auto_71014 ?auto_71015 ) ( ON ?auto_71013 ?auto_71014 ) ( ON ?auto_71012 ?auto_71013 ) ( CLEAR ?auto_71012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71012 )
      ( MAKE-9PILE ?auto_71012 ?auto_71013 ?auto_71014 ?auto_71015 ?auto_71016 ?auto_71017 ?auto_71018 ?auto_71019 ?auto_71020 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_71030 - BLOCK
      ?auto_71031 - BLOCK
      ?auto_71032 - BLOCK
      ?auto_71033 - BLOCK
      ?auto_71034 - BLOCK
      ?auto_71035 - BLOCK
      ?auto_71036 - BLOCK
      ?auto_71037 - BLOCK
      ?auto_71038 - BLOCK
    )
    :vars
    (
      ?auto_71039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71030 ?auto_71031 ) ) ( not ( = ?auto_71030 ?auto_71032 ) ) ( not ( = ?auto_71030 ?auto_71033 ) ) ( not ( = ?auto_71030 ?auto_71034 ) ) ( not ( = ?auto_71030 ?auto_71035 ) ) ( not ( = ?auto_71030 ?auto_71036 ) ) ( not ( = ?auto_71030 ?auto_71037 ) ) ( not ( = ?auto_71030 ?auto_71038 ) ) ( not ( = ?auto_71031 ?auto_71032 ) ) ( not ( = ?auto_71031 ?auto_71033 ) ) ( not ( = ?auto_71031 ?auto_71034 ) ) ( not ( = ?auto_71031 ?auto_71035 ) ) ( not ( = ?auto_71031 ?auto_71036 ) ) ( not ( = ?auto_71031 ?auto_71037 ) ) ( not ( = ?auto_71031 ?auto_71038 ) ) ( not ( = ?auto_71032 ?auto_71033 ) ) ( not ( = ?auto_71032 ?auto_71034 ) ) ( not ( = ?auto_71032 ?auto_71035 ) ) ( not ( = ?auto_71032 ?auto_71036 ) ) ( not ( = ?auto_71032 ?auto_71037 ) ) ( not ( = ?auto_71032 ?auto_71038 ) ) ( not ( = ?auto_71033 ?auto_71034 ) ) ( not ( = ?auto_71033 ?auto_71035 ) ) ( not ( = ?auto_71033 ?auto_71036 ) ) ( not ( = ?auto_71033 ?auto_71037 ) ) ( not ( = ?auto_71033 ?auto_71038 ) ) ( not ( = ?auto_71034 ?auto_71035 ) ) ( not ( = ?auto_71034 ?auto_71036 ) ) ( not ( = ?auto_71034 ?auto_71037 ) ) ( not ( = ?auto_71034 ?auto_71038 ) ) ( not ( = ?auto_71035 ?auto_71036 ) ) ( not ( = ?auto_71035 ?auto_71037 ) ) ( not ( = ?auto_71035 ?auto_71038 ) ) ( not ( = ?auto_71036 ?auto_71037 ) ) ( not ( = ?auto_71036 ?auto_71038 ) ) ( not ( = ?auto_71037 ?auto_71038 ) ) ( ON ?auto_71030 ?auto_71039 ) ( not ( = ?auto_71038 ?auto_71039 ) ) ( not ( = ?auto_71037 ?auto_71039 ) ) ( not ( = ?auto_71036 ?auto_71039 ) ) ( not ( = ?auto_71035 ?auto_71039 ) ) ( not ( = ?auto_71034 ?auto_71039 ) ) ( not ( = ?auto_71033 ?auto_71039 ) ) ( not ( = ?auto_71032 ?auto_71039 ) ) ( not ( = ?auto_71031 ?auto_71039 ) ) ( not ( = ?auto_71030 ?auto_71039 ) ) ( ON ?auto_71031 ?auto_71030 ) ( ON ?auto_71032 ?auto_71031 ) ( ON ?auto_71033 ?auto_71032 ) ( ON ?auto_71034 ?auto_71033 ) ( ON ?auto_71035 ?auto_71034 ) ( ON ?auto_71036 ?auto_71035 ) ( ON ?auto_71037 ?auto_71036 ) ( ON ?auto_71038 ?auto_71037 ) ( CLEAR ?auto_71038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_71038 ?auto_71037 ?auto_71036 ?auto_71035 ?auto_71034 ?auto_71033 ?auto_71032 ?auto_71031 ?auto_71030 )
      ( MAKE-9PILE ?auto_71030 ?auto_71031 ?auto_71032 ?auto_71033 ?auto_71034 ?auto_71035 ?auto_71036 ?auto_71037 ?auto_71038 ) )
  )

)

