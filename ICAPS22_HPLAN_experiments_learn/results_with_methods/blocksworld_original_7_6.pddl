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
      ?auto_92871 - BLOCK
      ?auto_92872 - BLOCK
      ?auto_92873 - BLOCK
      ?auto_92874 - BLOCK
      ?auto_92875 - BLOCK
      ?auto_92876 - BLOCK
      ?auto_92877 - BLOCK
    )
    :vars
    (
      ?auto_92878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92878 ?auto_92877 ) ( CLEAR ?auto_92878 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92871 ) ( ON ?auto_92872 ?auto_92871 ) ( ON ?auto_92873 ?auto_92872 ) ( ON ?auto_92874 ?auto_92873 ) ( ON ?auto_92875 ?auto_92874 ) ( ON ?auto_92876 ?auto_92875 ) ( ON ?auto_92877 ?auto_92876 ) ( not ( = ?auto_92871 ?auto_92872 ) ) ( not ( = ?auto_92871 ?auto_92873 ) ) ( not ( = ?auto_92871 ?auto_92874 ) ) ( not ( = ?auto_92871 ?auto_92875 ) ) ( not ( = ?auto_92871 ?auto_92876 ) ) ( not ( = ?auto_92871 ?auto_92877 ) ) ( not ( = ?auto_92871 ?auto_92878 ) ) ( not ( = ?auto_92872 ?auto_92873 ) ) ( not ( = ?auto_92872 ?auto_92874 ) ) ( not ( = ?auto_92872 ?auto_92875 ) ) ( not ( = ?auto_92872 ?auto_92876 ) ) ( not ( = ?auto_92872 ?auto_92877 ) ) ( not ( = ?auto_92872 ?auto_92878 ) ) ( not ( = ?auto_92873 ?auto_92874 ) ) ( not ( = ?auto_92873 ?auto_92875 ) ) ( not ( = ?auto_92873 ?auto_92876 ) ) ( not ( = ?auto_92873 ?auto_92877 ) ) ( not ( = ?auto_92873 ?auto_92878 ) ) ( not ( = ?auto_92874 ?auto_92875 ) ) ( not ( = ?auto_92874 ?auto_92876 ) ) ( not ( = ?auto_92874 ?auto_92877 ) ) ( not ( = ?auto_92874 ?auto_92878 ) ) ( not ( = ?auto_92875 ?auto_92876 ) ) ( not ( = ?auto_92875 ?auto_92877 ) ) ( not ( = ?auto_92875 ?auto_92878 ) ) ( not ( = ?auto_92876 ?auto_92877 ) ) ( not ( = ?auto_92876 ?auto_92878 ) ) ( not ( = ?auto_92877 ?auto_92878 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92878 ?auto_92877 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92880 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_92880 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_92880 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92881 - BLOCK
    )
    :vars
    (
      ?auto_92882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92881 ?auto_92882 ) ( CLEAR ?auto_92881 ) ( HAND-EMPTY ) ( not ( = ?auto_92881 ?auto_92882 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92881 ?auto_92882 )
      ( MAKE-1PILE ?auto_92881 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92889 - BLOCK
      ?auto_92890 - BLOCK
      ?auto_92891 - BLOCK
      ?auto_92892 - BLOCK
      ?auto_92893 - BLOCK
      ?auto_92894 - BLOCK
    )
    :vars
    (
      ?auto_92895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92895 ?auto_92894 ) ( CLEAR ?auto_92895 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92889 ) ( ON ?auto_92890 ?auto_92889 ) ( ON ?auto_92891 ?auto_92890 ) ( ON ?auto_92892 ?auto_92891 ) ( ON ?auto_92893 ?auto_92892 ) ( ON ?auto_92894 ?auto_92893 ) ( not ( = ?auto_92889 ?auto_92890 ) ) ( not ( = ?auto_92889 ?auto_92891 ) ) ( not ( = ?auto_92889 ?auto_92892 ) ) ( not ( = ?auto_92889 ?auto_92893 ) ) ( not ( = ?auto_92889 ?auto_92894 ) ) ( not ( = ?auto_92889 ?auto_92895 ) ) ( not ( = ?auto_92890 ?auto_92891 ) ) ( not ( = ?auto_92890 ?auto_92892 ) ) ( not ( = ?auto_92890 ?auto_92893 ) ) ( not ( = ?auto_92890 ?auto_92894 ) ) ( not ( = ?auto_92890 ?auto_92895 ) ) ( not ( = ?auto_92891 ?auto_92892 ) ) ( not ( = ?auto_92891 ?auto_92893 ) ) ( not ( = ?auto_92891 ?auto_92894 ) ) ( not ( = ?auto_92891 ?auto_92895 ) ) ( not ( = ?auto_92892 ?auto_92893 ) ) ( not ( = ?auto_92892 ?auto_92894 ) ) ( not ( = ?auto_92892 ?auto_92895 ) ) ( not ( = ?auto_92893 ?auto_92894 ) ) ( not ( = ?auto_92893 ?auto_92895 ) ) ( not ( = ?auto_92894 ?auto_92895 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92895 ?auto_92894 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92896 - BLOCK
      ?auto_92897 - BLOCK
      ?auto_92898 - BLOCK
      ?auto_92899 - BLOCK
      ?auto_92900 - BLOCK
      ?auto_92901 - BLOCK
    )
    :vars
    (
      ?auto_92902 - BLOCK
      ?auto_92903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92902 ?auto_92901 ) ( CLEAR ?auto_92902 ) ( ON-TABLE ?auto_92896 ) ( ON ?auto_92897 ?auto_92896 ) ( ON ?auto_92898 ?auto_92897 ) ( ON ?auto_92899 ?auto_92898 ) ( ON ?auto_92900 ?auto_92899 ) ( ON ?auto_92901 ?auto_92900 ) ( not ( = ?auto_92896 ?auto_92897 ) ) ( not ( = ?auto_92896 ?auto_92898 ) ) ( not ( = ?auto_92896 ?auto_92899 ) ) ( not ( = ?auto_92896 ?auto_92900 ) ) ( not ( = ?auto_92896 ?auto_92901 ) ) ( not ( = ?auto_92896 ?auto_92902 ) ) ( not ( = ?auto_92897 ?auto_92898 ) ) ( not ( = ?auto_92897 ?auto_92899 ) ) ( not ( = ?auto_92897 ?auto_92900 ) ) ( not ( = ?auto_92897 ?auto_92901 ) ) ( not ( = ?auto_92897 ?auto_92902 ) ) ( not ( = ?auto_92898 ?auto_92899 ) ) ( not ( = ?auto_92898 ?auto_92900 ) ) ( not ( = ?auto_92898 ?auto_92901 ) ) ( not ( = ?auto_92898 ?auto_92902 ) ) ( not ( = ?auto_92899 ?auto_92900 ) ) ( not ( = ?auto_92899 ?auto_92901 ) ) ( not ( = ?auto_92899 ?auto_92902 ) ) ( not ( = ?auto_92900 ?auto_92901 ) ) ( not ( = ?auto_92900 ?auto_92902 ) ) ( not ( = ?auto_92901 ?auto_92902 ) ) ( HOLDING ?auto_92903 ) ( not ( = ?auto_92896 ?auto_92903 ) ) ( not ( = ?auto_92897 ?auto_92903 ) ) ( not ( = ?auto_92898 ?auto_92903 ) ) ( not ( = ?auto_92899 ?auto_92903 ) ) ( not ( = ?auto_92900 ?auto_92903 ) ) ( not ( = ?auto_92901 ?auto_92903 ) ) ( not ( = ?auto_92902 ?auto_92903 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_92903 )
      ( MAKE-6PILE ?auto_92896 ?auto_92897 ?auto_92898 ?auto_92899 ?auto_92900 ?auto_92901 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92904 - BLOCK
      ?auto_92905 - BLOCK
      ?auto_92906 - BLOCK
      ?auto_92907 - BLOCK
      ?auto_92908 - BLOCK
      ?auto_92909 - BLOCK
    )
    :vars
    (
      ?auto_92911 - BLOCK
      ?auto_92910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92911 ?auto_92909 ) ( ON-TABLE ?auto_92904 ) ( ON ?auto_92905 ?auto_92904 ) ( ON ?auto_92906 ?auto_92905 ) ( ON ?auto_92907 ?auto_92906 ) ( ON ?auto_92908 ?auto_92907 ) ( ON ?auto_92909 ?auto_92908 ) ( not ( = ?auto_92904 ?auto_92905 ) ) ( not ( = ?auto_92904 ?auto_92906 ) ) ( not ( = ?auto_92904 ?auto_92907 ) ) ( not ( = ?auto_92904 ?auto_92908 ) ) ( not ( = ?auto_92904 ?auto_92909 ) ) ( not ( = ?auto_92904 ?auto_92911 ) ) ( not ( = ?auto_92905 ?auto_92906 ) ) ( not ( = ?auto_92905 ?auto_92907 ) ) ( not ( = ?auto_92905 ?auto_92908 ) ) ( not ( = ?auto_92905 ?auto_92909 ) ) ( not ( = ?auto_92905 ?auto_92911 ) ) ( not ( = ?auto_92906 ?auto_92907 ) ) ( not ( = ?auto_92906 ?auto_92908 ) ) ( not ( = ?auto_92906 ?auto_92909 ) ) ( not ( = ?auto_92906 ?auto_92911 ) ) ( not ( = ?auto_92907 ?auto_92908 ) ) ( not ( = ?auto_92907 ?auto_92909 ) ) ( not ( = ?auto_92907 ?auto_92911 ) ) ( not ( = ?auto_92908 ?auto_92909 ) ) ( not ( = ?auto_92908 ?auto_92911 ) ) ( not ( = ?auto_92909 ?auto_92911 ) ) ( not ( = ?auto_92904 ?auto_92910 ) ) ( not ( = ?auto_92905 ?auto_92910 ) ) ( not ( = ?auto_92906 ?auto_92910 ) ) ( not ( = ?auto_92907 ?auto_92910 ) ) ( not ( = ?auto_92908 ?auto_92910 ) ) ( not ( = ?auto_92909 ?auto_92910 ) ) ( not ( = ?auto_92911 ?auto_92910 ) ) ( ON ?auto_92910 ?auto_92911 ) ( CLEAR ?auto_92910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92904 ?auto_92905 ?auto_92906 ?auto_92907 ?auto_92908 ?auto_92909 ?auto_92911 )
      ( MAKE-6PILE ?auto_92904 ?auto_92905 ?auto_92906 ?auto_92907 ?auto_92908 ?auto_92909 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92914 - BLOCK
      ?auto_92915 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_92915 ) ( CLEAR ?auto_92914 ) ( ON-TABLE ?auto_92914 ) ( not ( = ?auto_92914 ?auto_92915 ) ) )
    :subtasks
    ( ( !STACK ?auto_92915 ?auto_92914 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92916 - BLOCK
      ?auto_92917 - BLOCK
    )
    :vars
    (
      ?auto_92918 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_92916 ) ( ON-TABLE ?auto_92916 ) ( not ( = ?auto_92916 ?auto_92917 ) ) ( ON ?auto_92917 ?auto_92918 ) ( CLEAR ?auto_92917 ) ( HAND-EMPTY ) ( not ( = ?auto_92916 ?auto_92918 ) ) ( not ( = ?auto_92917 ?auto_92918 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92917 ?auto_92918 )
      ( MAKE-2PILE ?auto_92916 ?auto_92917 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92919 - BLOCK
      ?auto_92920 - BLOCK
    )
    :vars
    (
      ?auto_92921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92919 ?auto_92920 ) ) ( ON ?auto_92920 ?auto_92921 ) ( CLEAR ?auto_92920 ) ( not ( = ?auto_92919 ?auto_92921 ) ) ( not ( = ?auto_92920 ?auto_92921 ) ) ( HOLDING ?auto_92919 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92919 )
      ( MAKE-2PILE ?auto_92919 ?auto_92920 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92922 - BLOCK
      ?auto_92923 - BLOCK
    )
    :vars
    (
      ?auto_92924 - BLOCK
      ?auto_92928 - BLOCK
      ?auto_92929 - BLOCK
      ?auto_92926 - BLOCK
      ?auto_92927 - BLOCK
      ?auto_92925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92922 ?auto_92923 ) ) ( ON ?auto_92923 ?auto_92924 ) ( not ( = ?auto_92922 ?auto_92924 ) ) ( not ( = ?auto_92923 ?auto_92924 ) ) ( ON ?auto_92922 ?auto_92923 ) ( CLEAR ?auto_92922 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92928 ) ( ON ?auto_92929 ?auto_92928 ) ( ON ?auto_92926 ?auto_92929 ) ( ON ?auto_92927 ?auto_92926 ) ( ON ?auto_92925 ?auto_92927 ) ( ON ?auto_92924 ?auto_92925 ) ( not ( = ?auto_92928 ?auto_92929 ) ) ( not ( = ?auto_92928 ?auto_92926 ) ) ( not ( = ?auto_92928 ?auto_92927 ) ) ( not ( = ?auto_92928 ?auto_92925 ) ) ( not ( = ?auto_92928 ?auto_92924 ) ) ( not ( = ?auto_92928 ?auto_92923 ) ) ( not ( = ?auto_92928 ?auto_92922 ) ) ( not ( = ?auto_92929 ?auto_92926 ) ) ( not ( = ?auto_92929 ?auto_92927 ) ) ( not ( = ?auto_92929 ?auto_92925 ) ) ( not ( = ?auto_92929 ?auto_92924 ) ) ( not ( = ?auto_92929 ?auto_92923 ) ) ( not ( = ?auto_92929 ?auto_92922 ) ) ( not ( = ?auto_92926 ?auto_92927 ) ) ( not ( = ?auto_92926 ?auto_92925 ) ) ( not ( = ?auto_92926 ?auto_92924 ) ) ( not ( = ?auto_92926 ?auto_92923 ) ) ( not ( = ?auto_92926 ?auto_92922 ) ) ( not ( = ?auto_92927 ?auto_92925 ) ) ( not ( = ?auto_92927 ?auto_92924 ) ) ( not ( = ?auto_92927 ?auto_92923 ) ) ( not ( = ?auto_92927 ?auto_92922 ) ) ( not ( = ?auto_92925 ?auto_92924 ) ) ( not ( = ?auto_92925 ?auto_92923 ) ) ( not ( = ?auto_92925 ?auto_92922 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92928 ?auto_92929 ?auto_92926 ?auto_92927 ?auto_92925 ?auto_92924 ?auto_92923 )
      ( MAKE-2PILE ?auto_92922 ?auto_92923 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92935 - BLOCK
      ?auto_92936 - BLOCK
      ?auto_92937 - BLOCK
      ?auto_92938 - BLOCK
      ?auto_92939 - BLOCK
    )
    :vars
    (
      ?auto_92940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92940 ?auto_92939 ) ( CLEAR ?auto_92940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92935 ) ( ON ?auto_92936 ?auto_92935 ) ( ON ?auto_92937 ?auto_92936 ) ( ON ?auto_92938 ?auto_92937 ) ( ON ?auto_92939 ?auto_92938 ) ( not ( = ?auto_92935 ?auto_92936 ) ) ( not ( = ?auto_92935 ?auto_92937 ) ) ( not ( = ?auto_92935 ?auto_92938 ) ) ( not ( = ?auto_92935 ?auto_92939 ) ) ( not ( = ?auto_92935 ?auto_92940 ) ) ( not ( = ?auto_92936 ?auto_92937 ) ) ( not ( = ?auto_92936 ?auto_92938 ) ) ( not ( = ?auto_92936 ?auto_92939 ) ) ( not ( = ?auto_92936 ?auto_92940 ) ) ( not ( = ?auto_92937 ?auto_92938 ) ) ( not ( = ?auto_92937 ?auto_92939 ) ) ( not ( = ?auto_92937 ?auto_92940 ) ) ( not ( = ?auto_92938 ?auto_92939 ) ) ( not ( = ?auto_92938 ?auto_92940 ) ) ( not ( = ?auto_92939 ?auto_92940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92940 ?auto_92939 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92941 - BLOCK
      ?auto_92942 - BLOCK
      ?auto_92943 - BLOCK
      ?auto_92944 - BLOCK
      ?auto_92945 - BLOCK
    )
    :vars
    (
      ?auto_92946 - BLOCK
      ?auto_92947 - BLOCK
      ?auto_92948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92946 ?auto_92945 ) ( CLEAR ?auto_92946 ) ( ON-TABLE ?auto_92941 ) ( ON ?auto_92942 ?auto_92941 ) ( ON ?auto_92943 ?auto_92942 ) ( ON ?auto_92944 ?auto_92943 ) ( ON ?auto_92945 ?auto_92944 ) ( not ( = ?auto_92941 ?auto_92942 ) ) ( not ( = ?auto_92941 ?auto_92943 ) ) ( not ( = ?auto_92941 ?auto_92944 ) ) ( not ( = ?auto_92941 ?auto_92945 ) ) ( not ( = ?auto_92941 ?auto_92946 ) ) ( not ( = ?auto_92942 ?auto_92943 ) ) ( not ( = ?auto_92942 ?auto_92944 ) ) ( not ( = ?auto_92942 ?auto_92945 ) ) ( not ( = ?auto_92942 ?auto_92946 ) ) ( not ( = ?auto_92943 ?auto_92944 ) ) ( not ( = ?auto_92943 ?auto_92945 ) ) ( not ( = ?auto_92943 ?auto_92946 ) ) ( not ( = ?auto_92944 ?auto_92945 ) ) ( not ( = ?auto_92944 ?auto_92946 ) ) ( not ( = ?auto_92945 ?auto_92946 ) ) ( HOLDING ?auto_92947 ) ( CLEAR ?auto_92948 ) ( not ( = ?auto_92941 ?auto_92947 ) ) ( not ( = ?auto_92941 ?auto_92948 ) ) ( not ( = ?auto_92942 ?auto_92947 ) ) ( not ( = ?auto_92942 ?auto_92948 ) ) ( not ( = ?auto_92943 ?auto_92947 ) ) ( not ( = ?auto_92943 ?auto_92948 ) ) ( not ( = ?auto_92944 ?auto_92947 ) ) ( not ( = ?auto_92944 ?auto_92948 ) ) ( not ( = ?auto_92945 ?auto_92947 ) ) ( not ( = ?auto_92945 ?auto_92948 ) ) ( not ( = ?auto_92946 ?auto_92947 ) ) ( not ( = ?auto_92946 ?auto_92948 ) ) ( not ( = ?auto_92947 ?auto_92948 ) ) )
    :subtasks
    ( ( !STACK ?auto_92947 ?auto_92948 )
      ( MAKE-5PILE ?auto_92941 ?auto_92942 ?auto_92943 ?auto_92944 ?auto_92945 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92949 - BLOCK
      ?auto_92950 - BLOCK
      ?auto_92951 - BLOCK
      ?auto_92952 - BLOCK
      ?auto_92953 - BLOCK
    )
    :vars
    (
      ?auto_92954 - BLOCK
      ?auto_92956 - BLOCK
      ?auto_92955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92954 ?auto_92953 ) ( ON-TABLE ?auto_92949 ) ( ON ?auto_92950 ?auto_92949 ) ( ON ?auto_92951 ?auto_92950 ) ( ON ?auto_92952 ?auto_92951 ) ( ON ?auto_92953 ?auto_92952 ) ( not ( = ?auto_92949 ?auto_92950 ) ) ( not ( = ?auto_92949 ?auto_92951 ) ) ( not ( = ?auto_92949 ?auto_92952 ) ) ( not ( = ?auto_92949 ?auto_92953 ) ) ( not ( = ?auto_92949 ?auto_92954 ) ) ( not ( = ?auto_92950 ?auto_92951 ) ) ( not ( = ?auto_92950 ?auto_92952 ) ) ( not ( = ?auto_92950 ?auto_92953 ) ) ( not ( = ?auto_92950 ?auto_92954 ) ) ( not ( = ?auto_92951 ?auto_92952 ) ) ( not ( = ?auto_92951 ?auto_92953 ) ) ( not ( = ?auto_92951 ?auto_92954 ) ) ( not ( = ?auto_92952 ?auto_92953 ) ) ( not ( = ?auto_92952 ?auto_92954 ) ) ( not ( = ?auto_92953 ?auto_92954 ) ) ( CLEAR ?auto_92956 ) ( not ( = ?auto_92949 ?auto_92955 ) ) ( not ( = ?auto_92949 ?auto_92956 ) ) ( not ( = ?auto_92950 ?auto_92955 ) ) ( not ( = ?auto_92950 ?auto_92956 ) ) ( not ( = ?auto_92951 ?auto_92955 ) ) ( not ( = ?auto_92951 ?auto_92956 ) ) ( not ( = ?auto_92952 ?auto_92955 ) ) ( not ( = ?auto_92952 ?auto_92956 ) ) ( not ( = ?auto_92953 ?auto_92955 ) ) ( not ( = ?auto_92953 ?auto_92956 ) ) ( not ( = ?auto_92954 ?auto_92955 ) ) ( not ( = ?auto_92954 ?auto_92956 ) ) ( not ( = ?auto_92955 ?auto_92956 ) ) ( ON ?auto_92955 ?auto_92954 ) ( CLEAR ?auto_92955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92949 ?auto_92950 ?auto_92951 ?auto_92952 ?auto_92953 ?auto_92954 )
      ( MAKE-5PILE ?auto_92949 ?auto_92950 ?auto_92951 ?auto_92952 ?auto_92953 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92957 - BLOCK
      ?auto_92958 - BLOCK
      ?auto_92959 - BLOCK
      ?auto_92960 - BLOCK
      ?auto_92961 - BLOCK
    )
    :vars
    (
      ?auto_92963 - BLOCK
      ?auto_92964 - BLOCK
      ?auto_92962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92963 ?auto_92961 ) ( ON-TABLE ?auto_92957 ) ( ON ?auto_92958 ?auto_92957 ) ( ON ?auto_92959 ?auto_92958 ) ( ON ?auto_92960 ?auto_92959 ) ( ON ?auto_92961 ?auto_92960 ) ( not ( = ?auto_92957 ?auto_92958 ) ) ( not ( = ?auto_92957 ?auto_92959 ) ) ( not ( = ?auto_92957 ?auto_92960 ) ) ( not ( = ?auto_92957 ?auto_92961 ) ) ( not ( = ?auto_92957 ?auto_92963 ) ) ( not ( = ?auto_92958 ?auto_92959 ) ) ( not ( = ?auto_92958 ?auto_92960 ) ) ( not ( = ?auto_92958 ?auto_92961 ) ) ( not ( = ?auto_92958 ?auto_92963 ) ) ( not ( = ?auto_92959 ?auto_92960 ) ) ( not ( = ?auto_92959 ?auto_92961 ) ) ( not ( = ?auto_92959 ?auto_92963 ) ) ( not ( = ?auto_92960 ?auto_92961 ) ) ( not ( = ?auto_92960 ?auto_92963 ) ) ( not ( = ?auto_92961 ?auto_92963 ) ) ( not ( = ?auto_92957 ?auto_92964 ) ) ( not ( = ?auto_92957 ?auto_92962 ) ) ( not ( = ?auto_92958 ?auto_92964 ) ) ( not ( = ?auto_92958 ?auto_92962 ) ) ( not ( = ?auto_92959 ?auto_92964 ) ) ( not ( = ?auto_92959 ?auto_92962 ) ) ( not ( = ?auto_92960 ?auto_92964 ) ) ( not ( = ?auto_92960 ?auto_92962 ) ) ( not ( = ?auto_92961 ?auto_92964 ) ) ( not ( = ?auto_92961 ?auto_92962 ) ) ( not ( = ?auto_92963 ?auto_92964 ) ) ( not ( = ?auto_92963 ?auto_92962 ) ) ( not ( = ?auto_92964 ?auto_92962 ) ) ( ON ?auto_92964 ?auto_92963 ) ( CLEAR ?auto_92964 ) ( HOLDING ?auto_92962 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92962 )
      ( MAKE-5PILE ?auto_92957 ?auto_92958 ?auto_92959 ?auto_92960 ?auto_92961 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92965 - BLOCK
      ?auto_92966 - BLOCK
      ?auto_92967 - BLOCK
      ?auto_92968 - BLOCK
      ?auto_92969 - BLOCK
    )
    :vars
    (
      ?auto_92971 - BLOCK
      ?auto_92970 - BLOCK
      ?auto_92972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92971 ?auto_92969 ) ( ON-TABLE ?auto_92965 ) ( ON ?auto_92966 ?auto_92965 ) ( ON ?auto_92967 ?auto_92966 ) ( ON ?auto_92968 ?auto_92967 ) ( ON ?auto_92969 ?auto_92968 ) ( not ( = ?auto_92965 ?auto_92966 ) ) ( not ( = ?auto_92965 ?auto_92967 ) ) ( not ( = ?auto_92965 ?auto_92968 ) ) ( not ( = ?auto_92965 ?auto_92969 ) ) ( not ( = ?auto_92965 ?auto_92971 ) ) ( not ( = ?auto_92966 ?auto_92967 ) ) ( not ( = ?auto_92966 ?auto_92968 ) ) ( not ( = ?auto_92966 ?auto_92969 ) ) ( not ( = ?auto_92966 ?auto_92971 ) ) ( not ( = ?auto_92967 ?auto_92968 ) ) ( not ( = ?auto_92967 ?auto_92969 ) ) ( not ( = ?auto_92967 ?auto_92971 ) ) ( not ( = ?auto_92968 ?auto_92969 ) ) ( not ( = ?auto_92968 ?auto_92971 ) ) ( not ( = ?auto_92969 ?auto_92971 ) ) ( not ( = ?auto_92965 ?auto_92970 ) ) ( not ( = ?auto_92965 ?auto_92972 ) ) ( not ( = ?auto_92966 ?auto_92970 ) ) ( not ( = ?auto_92966 ?auto_92972 ) ) ( not ( = ?auto_92967 ?auto_92970 ) ) ( not ( = ?auto_92967 ?auto_92972 ) ) ( not ( = ?auto_92968 ?auto_92970 ) ) ( not ( = ?auto_92968 ?auto_92972 ) ) ( not ( = ?auto_92969 ?auto_92970 ) ) ( not ( = ?auto_92969 ?auto_92972 ) ) ( not ( = ?auto_92971 ?auto_92970 ) ) ( not ( = ?auto_92971 ?auto_92972 ) ) ( not ( = ?auto_92970 ?auto_92972 ) ) ( ON ?auto_92970 ?auto_92971 ) ( ON ?auto_92972 ?auto_92970 ) ( CLEAR ?auto_92972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92965 ?auto_92966 ?auto_92967 ?auto_92968 ?auto_92969 ?auto_92971 ?auto_92970 )
      ( MAKE-5PILE ?auto_92965 ?auto_92966 ?auto_92967 ?auto_92968 ?auto_92969 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_92976 - BLOCK
      ?auto_92977 - BLOCK
      ?auto_92978 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_92978 ) ( CLEAR ?auto_92977 ) ( ON-TABLE ?auto_92976 ) ( ON ?auto_92977 ?auto_92976 ) ( not ( = ?auto_92976 ?auto_92977 ) ) ( not ( = ?auto_92976 ?auto_92978 ) ) ( not ( = ?auto_92977 ?auto_92978 ) ) )
    :subtasks
    ( ( !STACK ?auto_92978 ?auto_92977 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_92979 - BLOCK
      ?auto_92980 - BLOCK
      ?auto_92981 - BLOCK
    )
    :vars
    (
      ?auto_92982 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_92980 ) ( ON-TABLE ?auto_92979 ) ( ON ?auto_92980 ?auto_92979 ) ( not ( = ?auto_92979 ?auto_92980 ) ) ( not ( = ?auto_92979 ?auto_92981 ) ) ( not ( = ?auto_92980 ?auto_92981 ) ) ( ON ?auto_92981 ?auto_92982 ) ( CLEAR ?auto_92981 ) ( HAND-EMPTY ) ( not ( = ?auto_92979 ?auto_92982 ) ) ( not ( = ?auto_92980 ?auto_92982 ) ) ( not ( = ?auto_92981 ?auto_92982 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92981 ?auto_92982 )
      ( MAKE-3PILE ?auto_92979 ?auto_92980 ?auto_92981 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_92983 - BLOCK
      ?auto_92984 - BLOCK
      ?auto_92985 - BLOCK
    )
    :vars
    (
      ?auto_92986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92983 ) ( not ( = ?auto_92983 ?auto_92984 ) ) ( not ( = ?auto_92983 ?auto_92985 ) ) ( not ( = ?auto_92984 ?auto_92985 ) ) ( ON ?auto_92985 ?auto_92986 ) ( CLEAR ?auto_92985 ) ( not ( = ?auto_92983 ?auto_92986 ) ) ( not ( = ?auto_92984 ?auto_92986 ) ) ( not ( = ?auto_92985 ?auto_92986 ) ) ( HOLDING ?auto_92984 ) ( CLEAR ?auto_92983 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92983 ?auto_92984 )
      ( MAKE-3PILE ?auto_92983 ?auto_92984 ?auto_92985 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_92987 - BLOCK
      ?auto_92988 - BLOCK
      ?auto_92989 - BLOCK
    )
    :vars
    (
      ?auto_92990 - BLOCK
      ?auto_92991 - BLOCK
      ?auto_92992 - BLOCK
      ?auto_92993 - BLOCK
      ?auto_92994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92987 ) ( not ( = ?auto_92987 ?auto_92988 ) ) ( not ( = ?auto_92987 ?auto_92989 ) ) ( not ( = ?auto_92988 ?auto_92989 ) ) ( ON ?auto_92989 ?auto_92990 ) ( not ( = ?auto_92987 ?auto_92990 ) ) ( not ( = ?auto_92988 ?auto_92990 ) ) ( not ( = ?auto_92989 ?auto_92990 ) ) ( CLEAR ?auto_92987 ) ( ON ?auto_92988 ?auto_92989 ) ( CLEAR ?auto_92988 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92991 ) ( ON ?auto_92992 ?auto_92991 ) ( ON ?auto_92993 ?auto_92992 ) ( ON ?auto_92994 ?auto_92993 ) ( ON ?auto_92990 ?auto_92994 ) ( not ( = ?auto_92991 ?auto_92992 ) ) ( not ( = ?auto_92991 ?auto_92993 ) ) ( not ( = ?auto_92991 ?auto_92994 ) ) ( not ( = ?auto_92991 ?auto_92990 ) ) ( not ( = ?auto_92991 ?auto_92989 ) ) ( not ( = ?auto_92991 ?auto_92988 ) ) ( not ( = ?auto_92992 ?auto_92993 ) ) ( not ( = ?auto_92992 ?auto_92994 ) ) ( not ( = ?auto_92992 ?auto_92990 ) ) ( not ( = ?auto_92992 ?auto_92989 ) ) ( not ( = ?auto_92992 ?auto_92988 ) ) ( not ( = ?auto_92993 ?auto_92994 ) ) ( not ( = ?auto_92993 ?auto_92990 ) ) ( not ( = ?auto_92993 ?auto_92989 ) ) ( not ( = ?auto_92993 ?auto_92988 ) ) ( not ( = ?auto_92994 ?auto_92990 ) ) ( not ( = ?auto_92994 ?auto_92989 ) ) ( not ( = ?auto_92994 ?auto_92988 ) ) ( not ( = ?auto_92987 ?auto_92991 ) ) ( not ( = ?auto_92987 ?auto_92992 ) ) ( not ( = ?auto_92987 ?auto_92993 ) ) ( not ( = ?auto_92987 ?auto_92994 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92991 ?auto_92992 ?auto_92993 ?auto_92994 ?auto_92990 ?auto_92989 )
      ( MAKE-3PILE ?auto_92987 ?auto_92988 ?auto_92989 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_92995 - BLOCK
      ?auto_92996 - BLOCK
      ?auto_92997 - BLOCK
    )
    :vars
    (
      ?auto_93002 - BLOCK
      ?auto_93000 - BLOCK
      ?auto_92998 - BLOCK
      ?auto_92999 - BLOCK
      ?auto_93001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92995 ?auto_92996 ) ) ( not ( = ?auto_92995 ?auto_92997 ) ) ( not ( = ?auto_92996 ?auto_92997 ) ) ( ON ?auto_92997 ?auto_93002 ) ( not ( = ?auto_92995 ?auto_93002 ) ) ( not ( = ?auto_92996 ?auto_93002 ) ) ( not ( = ?auto_92997 ?auto_93002 ) ) ( ON ?auto_92996 ?auto_92997 ) ( CLEAR ?auto_92996 ) ( ON-TABLE ?auto_93000 ) ( ON ?auto_92998 ?auto_93000 ) ( ON ?auto_92999 ?auto_92998 ) ( ON ?auto_93001 ?auto_92999 ) ( ON ?auto_93002 ?auto_93001 ) ( not ( = ?auto_93000 ?auto_92998 ) ) ( not ( = ?auto_93000 ?auto_92999 ) ) ( not ( = ?auto_93000 ?auto_93001 ) ) ( not ( = ?auto_93000 ?auto_93002 ) ) ( not ( = ?auto_93000 ?auto_92997 ) ) ( not ( = ?auto_93000 ?auto_92996 ) ) ( not ( = ?auto_92998 ?auto_92999 ) ) ( not ( = ?auto_92998 ?auto_93001 ) ) ( not ( = ?auto_92998 ?auto_93002 ) ) ( not ( = ?auto_92998 ?auto_92997 ) ) ( not ( = ?auto_92998 ?auto_92996 ) ) ( not ( = ?auto_92999 ?auto_93001 ) ) ( not ( = ?auto_92999 ?auto_93002 ) ) ( not ( = ?auto_92999 ?auto_92997 ) ) ( not ( = ?auto_92999 ?auto_92996 ) ) ( not ( = ?auto_93001 ?auto_93002 ) ) ( not ( = ?auto_93001 ?auto_92997 ) ) ( not ( = ?auto_93001 ?auto_92996 ) ) ( not ( = ?auto_92995 ?auto_93000 ) ) ( not ( = ?auto_92995 ?auto_92998 ) ) ( not ( = ?auto_92995 ?auto_92999 ) ) ( not ( = ?auto_92995 ?auto_93001 ) ) ( HOLDING ?auto_92995 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92995 )
      ( MAKE-3PILE ?auto_92995 ?auto_92996 ?auto_92997 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93003 - BLOCK
      ?auto_93004 - BLOCK
      ?auto_93005 - BLOCK
    )
    :vars
    (
      ?auto_93009 - BLOCK
      ?auto_93006 - BLOCK
      ?auto_93007 - BLOCK
      ?auto_93010 - BLOCK
      ?auto_93008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93003 ?auto_93004 ) ) ( not ( = ?auto_93003 ?auto_93005 ) ) ( not ( = ?auto_93004 ?auto_93005 ) ) ( ON ?auto_93005 ?auto_93009 ) ( not ( = ?auto_93003 ?auto_93009 ) ) ( not ( = ?auto_93004 ?auto_93009 ) ) ( not ( = ?auto_93005 ?auto_93009 ) ) ( ON ?auto_93004 ?auto_93005 ) ( ON-TABLE ?auto_93006 ) ( ON ?auto_93007 ?auto_93006 ) ( ON ?auto_93010 ?auto_93007 ) ( ON ?auto_93008 ?auto_93010 ) ( ON ?auto_93009 ?auto_93008 ) ( not ( = ?auto_93006 ?auto_93007 ) ) ( not ( = ?auto_93006 ?auto_93010 ) ) ( not ( = ?auto_93006 ?auto_93008 ) ) ( not ( = ?auto_93006 ?auto_93009 ) ) ( not ( = ?auto_93006 ?auto_93005 ) ) ( not ( = ?auto_93006 ?auto_93004 ) ) ( not ( = ?auto_93007 ?auto_93010 ) ) ( not ( = ?auto_93007 ?auto_93008 ) ) ( not ( = ?auto_93007 ?auto_93009 ) ) ( not ( = ?auto_93007 ?auto_93005 ) ) ( not ( = ?auto_93007 ?auto_93004 ) ) ( not ( = ?auto_93010 ?auto_93008 ) ) ( not ( = ?auto_93010 ?auto_93009 ) ) ( not ( = ?auto_93010 ?auto_93005 ) ) ( not ( = ?auto_93010 ?auto_93004 ) ) ( not ( = ?auto_93008 ?auto_93009 ) ) ( not ( = ?auto_93008 ?auto_93005 ) ) ( not ( = ?auto_93008 ?auto_93004 ) ) ( not ( = ?auto_93003 ?auto_93006 ) ) ( not ( = ?auto_93003 ?auto_93007 ) ) ( not ( = ?auto_93003 ?auto_93010 ) ) ( not ( = ?auto_93003 ?auto_93008 ) ) ( ON ?auto_93003 ?auto_93004 ) ( CLEAR ?auto_93003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93006 ?auto_93007 ?auto_93010 ?auto_93008 ?auto_93009 ?auto_93005 ?auto_93004 )
      ( MAKE-3PILE ?auto_93003 ?auto_93004 ?auto_93005 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93015 - BLOCK
      ?auto_93016 - BLOCK
      ?auto_93017 - BLOCK
      ?auto_93018 - BLOCK
    )
    :vars
    (
      ?auto_93019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93019 ?auto_93018 ) ( CLEAR ?auto_93019 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93015 ) ( ON ?auto_93016 ?auto_93015 ) ( ON ?auto_93017 ?auto_93016 ) ( ON ?auto_93018 ?auto_93017 ) ( not ( = ?auto_93015 ?auto_93016 ) ) ( not ( = ?auto_93015 ?auto_93017 ) ) ( not ( = ?auto_93015 ?auto_93018 ) ) ( not ( = ?auto_93015 ?auto_93019 ) ) ( not ( = ?auto_93016 ?auto_93017 ) ) ( not ( = ?auto_93016 ?auto_93018 ) ) ( not ( = ?auto_93016 ?auto_93019 ) ) ( not ( = ?auto_93017 ?auto_93018 ) ) ( not ( = ?auto_93017 ?auto_93019 ) ) ( not ( = ?auto_93018 ?auto_93019 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93019 ?auto_93018 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93020 - BLOCK
      ?auto_93021 - BLOCK
      ?auto_93022 - BLOCK
      ?auto_93023 - BLOCK
    )
    :vars
    (
      ?auto_93024 - BLOCK
      ?auto_93025 - BLOCK
      ?auto_93026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93024 ?auto_93023 ) ( CLEAR ?auto_93024 ) ( ON-TABLE ?auto_93020 ) ( ON ?auto_93021 ?auto_93020 ) ( ON ?auto_93022 ?auto_93021 ) ( ON ?auto_93023 ?auto_93022 ) ( not ( = ?auto_93020 ?auto_93021 ) ) ( not ( = ?auto_93020 ?auto_93022 ) ) ( not ( = ?auto_93020 ?auto_93023 ) ) ( not ( = ?auto_93020 ?auto_93024 ) ) ( not ( = ?auto_93021 ?auto_93022 ) ) ( not ( = ?auto_93021 ?auto_93023 ) ) ( not ( = ?auto_93021 ?auto_93024 ) ) ( not ( = ?auto_93022 ?auto_93023 ) ) ( not ( = ?auto_93022 ?auto_93024 ) ) ( not ( = ?auto_93023 ?auto_93024 ) ) ( HOLDING ?auto_93025 ) ( CLEAR ?auto_93026 ) ( not ( = ?auto_93020 ?auto_93025 ) ) ( not ( = ?auto_93020 ?auto_93026 ) ) ( not ( = ?auto_93021 ?auto_93025 ) ) ( not ( = ?auto_93021 ?auto_93026 ) ) ( not ( = ?auto_93022 ?auto_93025 ) ) ( not ( = ?auto_93022 ?auto_93026 ) ) ( not ( = ?auto_93023 ?auto_93025 ) ) ( not ( = ?auto_93023 ?auto_93026 ) ) ( not ( = ?auto_93024 ?auto_93025 ) ) ( not ( = ?auto_93024 ?auto_93026 ) ) ( not ( = ?auto_93025 ?auto_93026 ) ) )
    :subtasks
    ( ( !STACK ?auto_93025 ?auto_93026 )
      ( MAKE-4PILE ?auto_93020 ?auto_93021 ?auto_93022 ?auto_93023 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93027 - BLOCK
      ?auto_93028 - BLOCK
      ?auto_93029 - BLOCK
      ?auto_93030 - BLOCK
    )
    :vars
    (
      ?auto_93032 - BLOCK
      ?auto_93033 - BLOCK
      ?auto_93031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93032 ?auto_93030 ) ( ON-TABLE ?auto_93027 ) ( ON ?auto_93028 ?auto_93027 ) ( ON ?auto_93029 ?auto_93028 ) ( ON ?auto_93030 ?auto_93029 ) ( not ( = ?auto_93027 ?auto_93028 ) ) ( not ( = ?auto_93027 ?auto_93029 ) ) ( not ( = ?auto_93027 ?auto_93030 ) ) ( not ( = ?auto_93027 ?auto_93032 ) ) ( not ( = ?auto_93028 ?auto_93029 ) ) ( not ( = ?auto_93028 ?auto_93030 ) ) ( not ( = ?auto_93028 ?auto_93032 ) ) ( not ( = ?auto_93029 ?auto_93030 ) ) ( not ( = ?auto_93029 ?auto_93032 ) ) ( not ( = ?auto_93030 ?auto_93032 ) ) ( CLEAR ?auto_93033 ) ( not ( = ?auto_93027 ?auto_93031 ) ) ( not ( = ?auto_93027 ?auto_93033 ) ) ( not ( = ?auto_93028 ?auto_93031 ) ) ( not ( = ?auto_93028 ?auto_93033 ) ) ( not ( = ?auto_93029 ?auto_93031 ) ) ( not ( = ?auto_93029 ?auto_93033 ) ) ( not ( = ?auto_93030 ?auto_93031 ) ) ( not ( = ?auto_93030 ?auto_93033 ) ) ( not ( = ?auto_93032 ?auto_93031 ) ) ( not ( = ?auto_93032 ?auto_93033 ) ) ( not ( = ?auto_93031 ?auto_93033 ) ) ( ON ?auto_93031 ?auto_93032 ) ( CLEAR ?auto_93031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93027 ?auto_93028 ?auto_93029 ?auto_93030 ?auto_93032 )
      ( MAKE-4PILE ?auto_93027 ?auto_93028 ?auto_93029 ?auto_93030 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93034 - BLOCK
      ?auto_93035 - BLOCK
      ?auto_93036 - BLOCK
      ?auto_93037 - BLOCK
    )
    :vars
    (
      ?auto_93039 - BLOCK
      ?auto_93038 - BLOCK
      ?auto_93040 - BLOCK
      ?auto_93041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93039 ?auto_93037 ) ( ON-TABLE ?auto_93034 ) ( ON ?auto_93035 ?auto_93034 ) ( ON ?auto_93036 ?auto_93035 ) ( ON ?auto_93037 ?auto_93036 ) ( not ( = ?auto_93034 ?auto_93035 ) ) ( not ( = ?auto_93034 ?auto_93036 ) ) ( not ( = ?auto_93034 ?auto_93037 ) ) ( not ( = ?auto_93034 ?auto_93039 ) ) ( not ( = ?auto_93035 ?auto_93036 ) ) ( not ( = ?auto_93035 ?auto_93037 ) ) ( not ( = ?auto_93035 ?auto_93039 ) ) ( not ( = ?auto_93036 ?auto_93037 ) ) ( not ( = ?auto_93036 ?auto_93039 ) ) ( not ( = ?auto_93037 ?auto_93039 ) ) ( not ( = ?auto_93034 ?auto_93038 ) ) ( not ( = ?auto_93034 ?auto_93040 ) ) ( not ( = ?auto_93035 ?auto_93038 ) ) ( not ( = ?auto_93035 ?auto_93040 ) ) ( not ( = ?auto_93036 ?auto_93038 ) ) ( not ( = ?auto_93036 ?auto_93040 ) ) ( not ( = ?auto_93037 ?auto_93038 ) ) ( not ( = ?auto_93037 ?auto_93040 ) ) ( not ( = ?auto_93039 ?auto_93038 ) ) ( not ( = ?auto_93039 ?auto_93040 ) ) ( not ( = ?auto_93038 ?auto_93040 ) ) ( ON ?auto_93038 ?auto_93039 ) ( CLEAR ?auto_93038 ) ( HOLDING ?auto_93040 ) ( CLEAR ?auto_93041 ) ( ON-TABLE ?auto_93041 ) ( not ( = ?auto_93041 ?auto_93040 ) ) ( not ( = ?auto_93034 ?auto_93041 ) ) ( not ( = ?auto_93035 ?auto_93041 ) ) ( not ( = ?auto_93036 ?auto_93041 ) ) ( not ( = ?auto_93037 ?auto_93041 ) ) ( not ( = ?auto_93039 ?auto_93041 ) ) ( not ( = ?auto_93038 ?auto_93041 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93041 ?auto_93040 )
      ( MAKE-4PILE ?auto_93034 ?auto_93035 ?auto_93036 ?auto_93037 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93042 - BLOCK
      ?auto_93043 - BLOCK
      ?auto_93044 - BLOCK
      ?auto_93045 - BLOCK
    )
    :vars
    (
      ?auto_93049 - BLOCK
      ?auto_93048 - BLOCK
      ?auto_93047 - BLOCK
      ?auto_93046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93049 ?auto_93045 ) ( ON-TABLE ?auto_93042 ) ( ON ?auto_93043 ?auto_93042 ) ( ON ?auto_93044 ?auto_93043 ) ( ON ?auto_93045 ?auto_93044 ) ( not ( = ?auto_93042 ?auto_93043 ) ) ( not ( = ?auto_93042 ?auto_93044 ) ) ( not ( = ?auto_93042 ?auto_93045 ) ) ( not ( = ?auto_93042 ?auto_93049 ) ) ( not ( = ?auto_93043 ?auto_93044 ) ) ( not ( = ?auto_93043 ?auto_93045 ) ) ( not ( = ?auto_93043 ?auto_93049 ) ) ( not ( = ?auto_93044 ?auto_93045 ) ) ( not ( = ?auto_93044 ?auto_93049 ) ) ( not ( = ?auto_93045 ?auto_93049 ) ) ( not ( = ?auto_93042 ?auto_93048 ) ) ( not ( = ?auto_93042 ?auto_93047 ) ) ( not ( = ?auto_93043 ?auto_93048 ) ) ( not ( = ?auto_93043 ?auto_93047 ) ) ( not ( = ?auto_93044 ?auto_93048 ) ) ( not ( = ?auto_93044 ?auto_93047 ) ) ( not ( = ?auto_93045 ?auto_93048 ) ) ( not ( = ?auto_93045 ?auto_93047 ) ) ( not ( = ?auto_93049 ?auto_93048 ) ) ( not ( = ?auto_93049 ?auto_93047 ) ) ( not ( = ?auto_93048 ?auto_93047 ) ) ( ON ?auto_93048 ?auto_93049 ) ( CLEAR ?auto_93046 ) ( ON-TABLE ?auto_93046 ) ( not ( = ?auto_93046 ?auto_93047 ) ) ( not ( = ?auto_93042 ?auto_93046 ) ) ( not ( = ?auto_93043 ?auto_93046 ) ) ( not ( = ?auto_93044 ?auto_93046 ) ) ( not ( = ?auto_93045 ?auto_93046 ) ) ( not ( = ?auto_93049 ?auto_93046 ) ) ( not ( = ?auto_93048 ?auto_93046 ) ) ( ON ?auto_93047 ?auto_93048 ) ( CLEAR ?auto_93047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93042 ?auto_93043 ?auto_93044 ?auto_93045 ?auto_93049 ?auto_93048 )
      ( MAKE-4PILE ?auto_93042 ?auto_93043 ?auto_93044 ?auto_93045 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93050 - BLOCK
      ?auto_93051 - BLOCK
      ?auto_93052 - BLOCK
      ?auto_93053 - BLOCK
    )
    :vars
    (
      ?auto_93055 - BLOCK
      ?auto_93057 - BLOCK
      ?auto_93054 - BLOCK
      ?auto_93056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93055 ?auto_93053 ) ( ON-TABLE ?auto_93050 ) ( ON ?auto_93051 ?auto_93050 ) ( ON ?auto_93052 ?auto_93051 ) ( ON ?auto_93053 ?auto_93052 ) ( not ( = ?auto_93050 ?auto_93051 ) ) ( not ( = ?auto_93050 ?auto_93052 ) ) ( not ( = ?auto_93050 ?auto_93053 ) ) ( not ( = ?auto_93050 ?auto_93055 ) ) ( not ( = ?auto_93051 ?auto_93052 ) ) ( not ( = ?auto_93051 ?auto_93053 ) ) ( not ( = ?auto_93051 ?auto_93055 ) ) ( not ( = ?auto_93052 ?auto_93053 ) ) ( not ( = ?auto_93052 ?auto_93055 ) ) ( not ( = ?auto_93053 ?auto_93055 ) ) ( not ( = ?auto_93050 ?auto_93057 ) ) ( not ( = ?auto_93050 ?auto_93054 ) ) ( not ( = ?auto_93051 ?auto_93057 ) ) ( not ( = ?auto_93051 ?auto_93054 ) ) ( not ( = ?auto_93052 ?auto_93057 ) ) ( not ( = ?auto_93052 ?auto_93054 ) ) ( not ( = ?auto_93053 ?auto_93057 ) ) ( not ( = ?auto_93053 ?auto_93054 ) ) ( not ( = ?auto_93055 ?auto_93057 ) ) ( not ( = ?auto_93055 ?auto_93054 ) ) ( not ( = ?auto_93057 ?auto_93054 ) ) ( ON ?auto_93057 ?auto_93055 ) ( not ( = ?auto_93056 ?auto_93054 ) ) ( not ( = ?auto_93050 ?auto_93056 ) ) ( not ( = ?auto_93051 ?auto_93056 ) ) ( not ( = ?auto_93052 ?auto_93056 ) ) ( not ( = ?auto_93053 ?auto_93056 ) ) ( not ( = ?auto_93055 ?auto_93056 ) ) ( not ( = ?auto_93057 ?auto_93056 ) ) ( ON ?auto_93054 ?auto_93057 ) ( CLEAR ?auto_93054 ) ( HOLDING ?auto_93056 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93056 )
      ( MAKE-4PILE ?auto_93050 ?auto_93051 ?auto_93052 ?auto_93053 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93058 - BLOCK
      ?auto_93059 - BLOCK
      ?auto_93060 - BLOCK
      ?auto_93061 - BLOCK
    )
    :vars
    (
      ?auto_93063 - BLOCK
      ?auto_93064 - BLOCK
      ?auto_93062 - BLOCK
      ?auto_93065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93063 ?auto_93061 ) ( ON-TABLE ?auto_93058 ) ( ON ?auto_93059 ?auto_93058 ) ( ON ?auto_93060 ?auto_93059 ) ( ON ?auto_93061 ?auto_93060 ) ( not ( = ?auto_93058 ?auto_93059 ) ) ( not ( = ?auto_93058 ?auto_93060 ) ) ( not ( = ?auto_93058 ?auto_93061 ) ) ( not ( = ?auto_93058 ?auto_93063 ) ) ( not ( = ?auto_93059 ?auto_93060 ) ) ( not ( = ?auto_93059 ?auto_93061 ) ) ( not ( = ?auto_93059 ?auto_93063 ) ) ( not ( = ?auto_93060 ?auto_93061 ) ) ( not ( = ?auto_93060 ?auto_93063 ) ) ( not ( = ?auto_93061 ?auto_93063 ) ) ( not ( = ?auto_93058 ?auto_93064 ) ) ( not ( = ?auto_93058 ?auto_93062 ) ) ( not ( = ?auto_93059 ?auto_93064 ) ) ( not ( = ?auto_93059 ?auto_93062 ) ) ( not ( = ?auto_93060 ?auto_93064 ) ) ( not ( = ?auto_93060 ?auto_93062 ) ) ( not ( = ?auto_93061 ?auto_93064 ) ) ( not ( = ?auto_93061 ?auto_93062 ) ) ( not ( = ?auto_93063 ?auto_93064 ) ) ( not ( = ?auto_93063 ?auto_93062 ) ) ( not ( = ?auto_93064 ?auto_93062 ) ) ( ON ?auto_93064 ?auto_93063 ) ( not ( = ?auto_93065 ?auto_93062 ) ) ( not ( = ?auto_93058 ?auto_93065 ) ) ( not ( = ?auto_93059 ?auto_93065 ) ) ( not ( = ?auto_93060 ?auto_93065 ) ) ( not ( = ?auto_93061 ?auto_93065 ) ) ( not ( = ?auto_93063 ?auto_93065 ) ) ( not ( = ?auto_93064 ?auto_93065 ) ) ( ON ?auto_93062 ?auto_93064 ) ( ON ?auto_93065 ?auto_93062 ) ( CLEAR ?auto_93065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93058 ?auto_93059 ?auto_93060 ?auto_93061 ?auto_93063 ?auto_93064 ?auto_93062 )
      ( MAKE-4PILE ?auto_93058 ?auto_93059 ?auto_93060 ?auto_93061 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93070 - BLOCK
      ?auto_93071 - BLOCK
      ?auto_93072 - BLOCK
      ?auto_93073 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_93073 ) ( CLEAR ?auto_93072 ) ( ON-TABLE ?auto_93070 ) ( ON ?auto_93071 ?auto_93070 ) ( ON ?auto_93072 ?auto_93071 ) ( not ( = ?auto_93070 ?auto_93071 ) ) ( not ( = ?auto_93070 ?auto_93072 ) ) ( not ( = ?auto_93070 ?auto_93073 ) ) ( not ( = ?auto_93071 ?auto_93072 ) ) ( not ( = ?auto_93071 ?auto_93073 ) ) ( not ( = ?auto_93072 ?auto_93073 ) ) )
    :subtasks
    ( ( !STACK ?auto_93073 ?auto_93072 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93074 - BLOCK
      ?auto_93075 - BLOCK
      ?auto_93076 - BLOCK
      ?auto_93077 - BLOCK
    )
    :vars
    (
      ?auto_93078 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93076 ) ( ON-TABLE ?auto_93074 ) ( ON ?auto_93075 ?auto_93074 ) ( ON ?auto_93076 ?auto_93075 ) ( not ( = ?auto_93074 ?auto_93075 ) ) ( not ( = ?auto_93074 ?auto_93076 ) ) ( not ( = ?auto_93074 ?auto_93077 ) ) ( not ( = ?auto_93075 ?auto_93076 ) ) ( not ( = ?auto_93075 ?auto_93077 ) ) ( not ( = ?auto_93076 ?auto_93077 ) ) ( ON ?auto_93077 ?auto_93078 ) ( CLEAR ?auto_93077 ) ( HAND-EMPTY ) ( not ( = ?auto_93074 ?auto_93078 ) ) ( not ( = ?auto_93075 ?auto_93078 ) ) ( not ( = ?auto_93076 ?auto_93078 ) ) ( not ( = ?auto_93077 ?auto_93078 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93077 ?auto_93078 )
      ( MAKE-4PILE ?auto_93074 ?auto_93075 ?auto_93076 ?auto_93077 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93079 - BLOCK
      ?auto_93080 - BLOCK
      ?auto_93081 - BLOCK
      ?auto_93082 - BLOCK
    )
    :vars
    (
      ?auto_93083 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93079 ) ( ON ?auto_93080 ?auto_93079 ) ( not ( = ?auto_93079 ?auto_93080 ) ) ( not ( = ?auto_93079 ?auto_93081 ) ) ( not ( = ?auto_93079 ?auto_93082 ) ) ( not ( = ?auto_93080 ?auto_93081 ) ) ( not ( = ?auto_93080 ?auto_93082 ) ) ( not ( = ?auto_93081 ?auto_93082 ) ) ( ON ?auto_93082 ?auto_93083 ) ( CLEAR ?auto_93082 ) ( not ( = ?auto_93079 ?auto_93083 ) ) ( not ( = ?auto_93080 ?auto_93083 ) ) ( not ( = ?auto_93081 ?auto_93083 ) ) ( not ( = ?auto_93082 ?auto_93083 ) ) ( HOLDING ?auto_93081 ) ( CLEAR ?auto_93080 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93079 ?auto_93080 ?auto_93081 )
      ( MAKE-4PILE ?auto_93079 ?auto_93080 ?auto_93081 ?auto_93082 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93084 - BLOCK
      ?auto_93085 - BLOCK
      ?auto_93086 - BLOCK
      ?auto_93087 - BLOCK
    )
    :vars
    (
      ?auto_93088 - BLOCK
      ?auto_93089 - BLOCK
      ?auto_93090 - BLOCK
      ?auto_93091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93084 ) ( ON ?auto_93085 ?auto_93084 ) ( not ( = ?auto_93084 ?auto_93085 ) ) ( not ( = ?auto_93084 ?auto_93086 ) ) ( not ( = ?auto_93084 ?auto_93087 ) ) ( not ( = ?auto_93085 ?auto_93086 ) ) ( not ( = ?auto_93085 ?auto_93087 ) ) ( not ( = ?auto_93086 ?auto_93087 ) ) ( ON ?auto_93087 ?auto_93088 ) ( not ( = ?auto_93084 ?auto_93088 ) ) ( not ( = ?auto_93085 ?auto_93088 ) ) ( not ( = ?auto_93086 ?auto_93088 ) ) ( not ( = ?auto_93087 ?auto_93088 ) ) ( CLEAR ?auto_93085 ) ( ON ?auto_93086 ?auto_93087 ) ( CLEAR ?auto_93086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93089 ) ( ON ?auto_93090 ?auto_93089 ) ( ON ?auto_93091 ?auto_93090 ) ( ON ?auto_93088 ?auto_93091 ) ( not ( = ?auto_93089 ?auto_93090 ) ) ( not ( = ?auto_93089 ?auto_93091 ) ) ( not ( = ?auto_93089 ?auto_93088 ) ) ( not ( = ?auto_93089 ?auto_93087 ) ) ( not ( = ?auto_93089 ?auto_93086 ) ) ( not ( = ?auto_93090 ?auto_93091 ) ) ( not ( = ?auto_93090 ?auto_93088 ) ) ( not ( = ?auto_93090 ?auto_93087 ) ) ( not ( = ?auto_93090 ?auto_93086 ) ) ( not ( = ?auto_93091 ?auto_93088 ) ) ( not ( = ?auto_93091 ?auto_93087 ) ) ( not ( = ?auto_93091 ?auto_93086 ) ) ( not ( = ?auto_93084 ?auto_93089 ) ) ( not ( = ?auto_93084 ?auto_93090 ) ) ( not ( = ?auto_93084 ?auto_93091 ) ) ( not ( = ?auto_93085 ?auto_93089 ) ) ( not ( = ?auto_93085 ?auto_93090 ) ) ( not ( = ?auto_93085 ?auto_93091 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93089 ?auto_93090 ?auto_93091 ?auto_93088 ?auto_93087 )
      ( MAKE-4PILE ?auto_93084 ?auto_93085 ?auto_93086 ?auto_93087 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93092 - BLOCK
      ?auto_93093 - BLOCK
      ?auto_93094 - BLOCK
      ?auto_93095 - BLOCK
    )
    :vars
    (
      ?auto_93096 - BLOCK
      ?auto_93097 - BLOCK
      ?auto_93099 - BLOCK
      ?auto_93098 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93092 ) ( not ( = ?auto_93092 ?auto_93093 ) ) ( not ( = ?auto_93092 ?auto_93094 ) ) ( not ( = ?auto_93092 ?auto_93095 ) ) ( not ( = ?auto_93093 ?auto_93094 ) ) ( not ( = ?auto_93093 ?auto_93095 ) ) ( not ( = ?auto_93094 ?auto_93095 ) ) ( ON ?auto_93095 ?auto_93096 ) ( not ( = ?auto_93092 ?auto_93096 ) ) ( not ( = ?auto_93093 ?auto_93096 ) ) ( not ( = ?auto_93094 ?auto_93096 ) ) ( not ( = ?auto_93095 ?auto_93096 ) ) ( ON ?auto_93094 ?auto_93095 ) ( CLEAR ?auto_93094 ) ( ON-TABLE ?auto_93097 ) ( ON ?auto_93099 ?auto_93097 ) ( ON ?auto_93098 ?auto_93099 ) ( ON ?auto_93096 ?auto_93098 ) ( not ( = ?auto_93097 ?auto_93099 ) ) ( not ( = ?auto_93097 ?auto_93098 ) ) ( not ( = ?auto_93097 ?auto_93096 ) ) ( not ( = ?auto_93097 ?auto_93095 ) ) ( not ( = ?auto_93097 ?auto_93094 ) ) ( not ( = ?auto_93099 ?auto_93098 ) ) ( not ( = ?auto_93099 ?auto_93096 ) ) ( not ( = ?auto_93099 ?auto_93095 ) ) ( not ( = ?auto_93099 ?auto_93094 ) ) ( not ( = ?auto_93098 ?auto_93096 ) ) ( not ( = ?auto_93098 ?auto_93095 ) ) ( not ( = ?auto_93098 ?auto_93094 ) ) ( not ( = ?auto_93092 ?auto_93097 ) ) ( not ( = ?auto_93092 ?auto_93099 ) ) ( not ( = ?auto_93092 ?auto_93098 ) ) ( not ( = ?auto_93093 ?auto_93097 ) ) ( not ( = ?auto_93093 ?auto_93099 ) ) ( not ( = ?auto_93093 ?auto_93098 ) ) ( HOLDING ?auto_93093 ) ( CLEAR ?auto_93092 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93092 ?auto_93093 )
      ( MAKE-4PILE ?auto_93092 ?auto_93093 ?auto_93094 ?auto_93095 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93100 - BLOCK
      ?auto_93101 - BLOCK
      ?auto_93102 - BLOCK
      ?auto_93103 - BLOCK
    )
    :vars
    (
      ?auto_93105 - BLOCK
      ?auto_93107 - BLOCK
      ?auto_93104 - BLOCK
      ?auto_93106 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93100 ) ( not ( = ?auto_93100 ?auto_93101 ) ) ( not ( = ?auto_93100 ?auto_93102 ) ) ( not ( = ?auto_93100 ?auto_93103 ) ) ( not ( = ?auto_93101 ?auto_93102 ) ) ( not ( = ?auto_93101 ?auto_93103 ) ) ( not ( = ?auto_93102 ?auto_93103 ) ) ( ON ?auto_93103 ?auto_93105 ) ( not ( = ?auto_93100 ?auto_93105 ) ) ( not ( = ?auto_93101 ?auto_93105 ) ) ( not ( = ?auto_93102 ?auto_93105 ) ) ( not ( = ?auto_93103 ?auto_93105 ) ) ( ON ?auto_93102 ?auto_93103 ) ( ON-TABLE ?auto_93107 ) ( ON ?auto_93104 ?auto_93107 ) ( ON ?auto_93106 ?auto_93104 ) ( ON ?auto_93105 ?auto_93106 ) ( not ( = ?auto_93107 ?auto_93104 ) ) ( not ( = ?auto_93107 ?auto_93106 ) ) ( not ( = ?auto_93107 ?auto_93105 ) ) ( not ( = ?auto_93107 ?auto_93103 ) ) ( not ( = ?auto_93107 ?auto_93102 ) ) ( not ( = ?auto_93104 ?auto_93106 ) ) ( not ( = ?auto_93104 ?auto_93105 ) ) ( not ( = ?auto_93104 ?auto_93103 ) ) ( not ( = ?auto_93104 ?auto_93102 ) ) ( not ( = ?auto_93106 ?auto_93105 ) ) ( not ( = ?auto_93106 ?auto_93103 ) ) ( not ( = ?auto_93106 ?auto_93102 ) ) ( not ( = ?auto_93100 ?auto_93107 ) ) ( not ( = ?auto_93100 ?auto_93104 ) ) ( not ( = ?auto_93100 ?auto_93106 ) ) ( not ( = ?auto_93101 ?auto_93107 ) ) ( not ( = ?auto_93101 ?auto_93104 ) ) ( not ( = ?auto_93101 ?auto_93106 ) ) ( CLEAR ?auto_93100 ) ( ON ?auto_93101 ?auto_93102 ) ( CLEAR ?auto_93101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93107 ?auto_93104 ?auto_93106 ?auto_93105 ?auto_93103 ?auto_93102 )
      ( MAKE-4PILE ?auto_93100 ?auto_93101 ?auto_93102 ?auto_93103 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93108 - BLOCK
      ?auto_93109 - BLOCK
      ?auto_93110 - BLOCK
      ?auto_93111 - BLOCK
    )
    :vars
    (
      ?auto_93115 - BLOCK
      ?auto_93114 - BLOCK
      ?auto_93113 - BLOCK
      ?auto_93112 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93108 ?auto_93109 ) ) ( not ( = ?auto_93108 ?auto_93110 ) ) ( not ( = ?auto_93108 ?auto_93111 ) ) ( not ( = ?auto_93109 ?auto_93110 ) ) ( not ( = ?auto_93109 ?auto_93111 ) ) ( not ( = ?auto_93110 ?auto_93111 ) ) ( ON ?auto_93111 ?auto_93115 ) ( not ( = ?auto_93108 ?auto_93115 ) ) ( not ( = ?auto_93109 ?auto_93115 ) ) ( not ( = ?auto_93110 ?auto_93115 ) ) ( not ( = ?auto_93111 ?auto_93115 ) ) ( ON ?auto_93110 ?auto_93111 ) ( ON-TABLE ?auto_93114 ) ( ON ?auto_93113 ?auto_93114 ) ( ON ?auto_93112 ?auto_93113 ) ( ON ?auto_93115 ?auto_93112 ) ( not ( = ?auto_93114 ?auto_93113 ) ) ( not ( = ?auto_93114 ?auto_93112 ) ) ( not ( = ?auto_93114 ?auto_93115 ) ) ( not ( = ?auto_93114 ?auto_93111 ) ) ( not ( = ?auto_93114 ?auto_93110 ) ) ( not ( = ?auto_93113 ?auto_93112 ) ) ( not ( = ?auto_93113 ?auto_93115 ) ) ( not ( = ?auto_93113 ?auto_93111 ) ) ( not ( = ?auto_93113 ?auto_93110 ) ) ( not ( = ?auto_93112 ?auto_93115 ) ) ( not ( = ?auto_93112 ?auto_93111 ) ) ( not ( = ?auto_93112 ?auto_93110 ) ) ( not ( = ?auto_93108 ?auto_93114 ) ) ( not ( = ?auto_93108 ?auto_93113 ) ) ( not ( = ?auto_93108 ?auto_93112 ) ) ( not ( = ?auto_93109 ?auto_93114 ) ) ( not ( = ?auto_93109 ?auto_93113 ) ) ( not ( = ?auto_93109 ?auto_93112 ) ) ( ON ?auto_93109 ?auto_93110 ) ( CLEAR ?auto_93109 ) ( HOLDING ?auto_93108 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93108 )
      ( MAKE-4PILE ?auto_93108 ?auto_93109 ?auto_93110 ?auto_93111 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93116 - BLOCK
      ?auto_93117 - BLOCK
      ?auto_93118 - BLOCK
      ?auto_93119 - BLOCK
    )
    :vars
    (
      ?auto_93122 - BLOCK
      ?auto_93120 - BLOCK
      ?auto_93123 - BLOCK
      ?auto_93121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93116 ?auto_93117 ) ) ( not ( = ?auto_93116 ?auto_93118 ) ) ( not ( = ?auto_93116 ?auto_93119 ) ) ( not ( = ?auto_93117 ?auto_93118 ) ) ( not ( = ?auto_93117 ?auto_93119 ) ) ( not ( = ?auto_93118 ?auto_93119 ) ) ( ON ?auto_93119 ?auto_93122 ) ( not ( = ?auto_93116 ?auto_93122 ) ) ( not ( = ?auto_93117 ?auto_93122 ) ) ( not ( = ?auto_93118 ?auto_93122 ) ) ( not ( = ?auto_93119 ?auto_93122 ) ) ( ON ?auto_93118 ?auto_93119 ) ( ON-TABLE ?auto_93120 ) ( ON ?auto_93123 ?auto_93120 ) ( ON ?auto_93121 ?auto_93123 ) ( ON ?auto_93122 ?auto_93121 ) ( not ( = ?auto_93120 ?auto_93123 ) ) ( not ( = ?auto_93120 ?auto_93121 ) ) ( not ( = ?auto_93120 ?auto_93122 ) ) ( not ( = ?auto_93120 ?auto_93119 ) ) ( not ( = ?auto_93120 ?auto_93118 ) ) ( not ( = ?auto_93123 ?auto_93121 ) ) ( not ( = ?auto_93123 ?auto_93122 ) ) ( not ( = ?auto_93123 ?auto_93119 ) ) ( not ( = ?auto_93123 ?auto_93118 ) ) ( not ( = ?auto_93121 ?auto_93122 ) ) ( not ( = ?auto_93121 ?auto_93119 ) ) ( not ( = ?auto_93121 ?auto_93118 ) ) ( not ( = ?auto_93116 ?auto_93120 ) ) ( not ( = ?auto_93116 ?auto_93123 ) ) ( not ( = ?auto_93116 ?auto_93121 ) ) ( not ( = ?auto_93117 ?auto_93120 ) ) ( not ( = ?auto_93117 ?auto_93123 ) ) ( not ( = ?auto_93117 ?auto_93121 ) ) ( ON ?auto_93117 ?auto_93118 ) ( ON ?auto_93116 ?auto_93117 ) ( CLEAR ?auto_93116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93120 ?auto_93123 ?auto_93121 ?auto_93122 ?auto_93119 ?auto_93118 ?auto_93117 )
      ( MAKE-4PILE ?auto_93116 ?auto_93117 ?auto_93118 ?auto_93119 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93127 - BLOCK
      ?auto_93128 - BLOCK
      ?auto_93129 - BLOCK
    )
    :vars
    (
      ?auto_93130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93130 ?auto_93129 ) ( CLEAR ?auto_93130 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93127 ) ( ON ?auto_93128 ?auto_93127 ) ( ON ?auto_93129 ?auto_93128 ) ( not ( = ?auto_93127 ?auto_93128 ) ) ( not ( = ?auto_93127 ?auto_93129 ) ) ( not ( = ?auto_93127 ?auto_93130 ) ) ( not ( = ?auto_93128 ?auto_93129 ) ) ( not ( = ?auto_93128 ?auto_93130 ) ) ( not ( = ?auto_93129 ?auto_93130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93130 ?auto_93129 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93131 - BLOCK
      ?auto_93132 - BLOCK
      ?auto_93133 - BLOCK
    )
    :vars
    (
      ?auto_93134 - BLOCK
      ?auto_93135 - BLOCK
      ?auto_93136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93134 ?auto_93133 ) ( CLEAR ?auto_93134 ) ( ON-TABLE ?auto_93131 ) ( ON ?auto_93132 ?auto_93131 ) ( ON ?auto_93133 ?auto_93132 ) ( not ( = ?auto_93131 ?auto_93132 ) ) ( not ( = ?auto_93131 ?auto_93133 ) ) ( not ( = ?auto_93131 ?auto_93134 ) ) ( not ( = ?auto_93132 ?auto_93133 ) ) ( not ( = ?auto_93132 ?auto_93134 ) ) ( not ( = ?auto_93133 ?auto_93134 ) ) ( HOLDING ?auto_93135 ) ( CLEAR ?auto_93136 ) ( not ( = ?auto_93131 ?auto_93135 ) ) ( not ( = ?auto_93131 ?auto_93136 ) ) ( not ( = ?auto_93132 ?auto_93135 ) ) ( not ( = ?auto_93132 ?auto_93136 ) ) ( not ( = ?auto_93133 ?auto_93135 ) ) ( not ( = ?auto_93133 ?auto_93136 ) ) ( not ( = ?auto_93134 ?auto_93135 ) ) ( not ( = ?auto_93134 ?auto_93136 ) ) ( not ( = ?auto_93135 ?auto_93136 ) ) )
    :subtasks
    ( ( !STACK ?auto_93135 ?auto_93136 )
      ( MAKE-3PILE ?auto_93131 ?auto_93132 ?auto_93133 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93137 - BLOCK
      ?auto_93138 - BLOCK
      ?auto_93139 - BLOCK
    )
    :vars
    (
      ?auto_93141 - BLOCK
      ?auto_93140 - BLOCK
      ?auto_93142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93141 ?auto_93139 ) ( ON-TABLE ?auto_93137 ) ( ON ?auto_93138 ?auto_93137 ) ( ON ?auto_93139 ?auto_93138 ) ( not ( = ?auto_93137 ?auto_93138 ) ) ( not ( = ?auto_93137 ?auto_93139 ) ) ( not ( = ?auto_93137 ?auto_93141 ) ) ( not ( = ?auto_93138 ?auto_93139 ) ) ( not ( = ?auto_93138 ?auto_93141 ) ) ( not ( = ?auto_93139 ?auto_93141 ) ) ( CLEAR ?auto_93140 ) ( not ( = ?auto_93137 ?auto_93142 ) ) ( not ( = ?auto_93137 ?auto_93140 ) ) ( not ( = ?auto_93138 ?auto_93142 ) ) ( not ( = ?auto_93138 ?auto_93140 ) ) ( not ( = ?auto_93139 ?auto_93142 ) ) ( not ( = ?auto_93139 ?auto_93140 ) ) ( not ( = ?auto_93141 ?auto_93142 ) ) ( not ( = ?auto_93141 ?auto_93140 ) ) ( not ( = ?auto_93142 ?auto_93140 ) ) ( ON ?auto_93142 ?auto_93141 ) ( CLEAR ?auto_93142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93137 ?auto_93138 ?auto_93139 ?auto_93141 )
      ( MAKE-3PILE ?auto_93137 ?auto_93138 ?auto_93139 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93143 - BLOCK
      ?auto_93144 - BLOCK
      ?auto_93145 - BLOCK
    )
    :vars
    (
      ?auto_93147 - BLOCK
      ?auto_93148 - BLOCK
      ?auto_93146 - BLOCK
      ?auto_93149 - BLOCK
      ?auto_93150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93147 ?auto_93145 ) ( ON-TABLE ?auto_93143 ) ( ON ?auto_93144 ?auto_93143 ) ( ON ?auto_93145 ?auto_93144 ) ( not ( = ?auto_93143 ?auto_93144 ) ) ( not ( = ?auto_93143 ?auto_93145 ) ) ( not ( = ?auto_93143 ?auto_93147 ) ) ( not ( = ?auto_93144 ?auto_93145 ) ) ( not ( = ?auto_93144 ?auto_93147 ) ) ( not ( = ?auto_93145 ?auto_93147 ) ) ( not ( = ?auto_93143 ?auto_93148 ) ) ( not ( = ?auto_93143 ?auto_93146 ) ) ( not ( = ?auto_93144 ?auto_93148 ) ) ( not ( = ?auto_93144 ?auto_93146 ) ) ( not ( = ?auto_93145 ?auto_93148 ) ) ( not ( = ?auto_93145 ?auto_93146 ) ) ( not ( = ?auto_93147 ?auto_93148 ) ) ( not ( = ?auto_93147 ?auto_93146 ) ) ( not ( = ?auto_93148 ?auto_93146 ) ) ( ON ?auto_93148 ?auto_93147 ) ( CLEAR ?auto_93148 ) ( HOLDING ?auto_93146 ) ( CLEAR ?auto_93149 ) ( ON-TABLE ?auto_93150 ) ( ON ?auto_93149 ?auto_93150 ) ( not ( = ?auto_93150 ?auto_93149 ) ) ( not ( = ?auto_93150 ?auto_93146 ) ) ( not ( = ?auto_93149 ?auto_93146 ) ) ( not ( = ?auto_93143 ?auto_93149 ) ) ( not ( = ?auto_93143 ?auto_93150 ) ) ( not ( = ?auto_93144 ?auto_93149 ) ) ( not ( = ?auto_93144 ?auto_93150 ) ) ( not ( = ?auto_93145 ?auto_93149 ) ) ( not ( = ?auto_93145 ?auto_93150 ) ) ( not ( = ?auto_93147 ?auto_93149 ) ) ( not ( = ?auto_93147 ?auto_93150 ) ) ( not ( = ?auto_93148 ?auto_93149 ) ) ( not ( = ?auto_93148 ?auto_93150 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93150 ?auto_93149 ?auto_93146 )
      ( MAKE-3PILE ?auto_93143 ?auto_93144 ?auto_93145 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93151 - BLOCK
      ?auto_93152 - BLOCK
      ?auto_93153 - BLOCK
    )
    :vars
    (
      ?auto_93154 - BLOCK
      ?auto_93157 - BLOCK
      ?auto_93155 - BLOCK
      ?auto_93156 - BLOCK
      ?auto_93158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93154 ?auto_93153 ) ( ON-TABLE ?auto_93151 ) ( ON ?auto_93152 ?auto_93151 ) ( ON ?auto_93153 ?auto_93152 ) ( not ( = ?auto_93151 ?auto_93152 ) ) ( not ( = ?auto_93151 ?auto_93153 ) ) ( not ( = ?auto_93151 ?auto_93154 ) ) ( not ( = ?auto_93152 ?auto_93153 ) ) ( not ( = ?auto_93152 ?auto_93154 ) ) ( not ( = ?auto_93153 ?auto_93154 ) ) ( not ( = ?auto_93151 ?auto_93157 ) ) ( not ( = ?auto_93151 ?auto_93155 ) ) ( not ( = ?auto_93152 ?auto_93157 ) ) ( not ( = ?auto_93152 ?auto_93155 ) ) ( not ( = ?auto_93153 ?auto_93157 ) ) ( not ( = ?auto_93153 ?auto_93155 ) ) ( not ( = ?auto_93154 ?auto_93157 ) ) ( not ( = ?auto_93154 ?auto_93155 ) ) ( not ( = ?auto_93157 ?auto_93155 ) ) ( ON ?auto_93157 ?auto_93154 ) ( CLEAR ?auto_93156 ) ( ON-TABLE ?auto_93158 ) ( ON ?auto_93156 ?auto_93158 ) ( not ( = ?auto_93158 ?auto_93156 ) ) ( not ( = ?auto_93158 ?auto_93155 ) ) ( not ( = ?auto_93156 ?auto_93155 ) ) ( not ( = ?auto_93151 ?auto_93156 ) ) ( not ( = ?auto_93151 ?auto_93158 ) ) ( not ( = ?auto_93152 ?auto_93156 ) ) ( not ( = ?auto_93152 ?auto_93158 ) ) ( not ( = ?auto_93153 ?auto_93156 ) ) ( not ( = ?auto_93153 ?auto_93158 ) ) ( not ( = ?auto_93154 ?auto_93156 ) ) ( not ( = ?auto_93154 ?auto_93158 ) ) ( not ( = ?auto_93157 ?auto_93156 ) ) ( not ( = ?auto_93157 ?auto_93158 ) ) ( ON ?auto_93155 ?auto_93157 ) ( CLEAR ?auto_93155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93151 ?auto_93152 ?auto_93153 ?auto_93154 ?auto_93157 )
      ( MAKE-3PILE ?auto_93151 ?auto_93152 ?auto_93153 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93159 - BLOCK
      ?auto_93160 - BLOCK
      ?auto_93161 - BLOCK
    )
    :vars
    (
      ?auto_93166 - BLOCK
      ?auto_93162 - BLOCK
      ?auto_93163 - BLOCK
      ?auto_93165 - BLOCK
      ?auto_93164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93166 ?auto_93161 ) ( ON-TABLE ?auto_93159 ) ( ON ?auto_93160 ?auto_93159 ) ( ON ?auto_93161 ?auto_93160 ) ( not ( = ?auto_93159 ?auto_93160 ) ) ( not ( = ?auto_93159 ?auto_93161 ) ) ( not ( = ?auto_93159 ?auto_93166 ) ) ( not ( = ?auto_93160 ?auto_93161 ) ) ( not ( = ?auto_93160 ?auto_93166 ) ) ( not ( = ?auto_93161 ?auto_93166 ) ) ( not ( = ?auto_93159 ?auto_93162 ) ) ( not ( = ?auto_93159 ?auto_93163 ) ) ( not ( = ?auto_93160 ?auto_93162 ) ) ( not ( = ?auto_93160 ?auto_93163 ) ) ( not ( = ?auto_93161 ?auto_93162 ) ) ( not ( = ?auto_93161 ?auto_93163 ) ) ( not ( = ?auto_93166 ?auto_93162 ) ) ( not ( = ?auto_93166 ?auto_93163 ) ) ( not ( = ?auto_93162 ?auto_93163 ) ) ( ON ?auto_93162 ?auto_93166 ) ( ON-TABLE ?auto_93165 ) ( not ( = ?auto_93165 ?auto_93164 ) ) ( not ( = ?auto_93165 ?auto_93163 ) ) ( not ( = ?auto_93164 ?auto_93163 ) ) ( not ( = ?auto_93159 ?auto_93164 ) ) ( not ( = ?auto_93159 ?auto_93165 ) ) ( not ( = ?auto_93160 ?auto_93164 ) ) ( not ( = ?auto_93160 ?auto_93165 ) ) ( not ( = ?auto_93161 ?auto_93164 ) ) ( not ( = ?auto_93161 ?auto_93165 ) ) ( not ( = ?auto_93166 ?auto_93164 ) ) ( not ( = ?auto_93166 ?auto_93165 ) ) ( not ( = ?auto_93162 ?auto_93164 ) ) ( not ( = ?auto_93162 ?auto_93165 ) ) ( ON ?auto_93163 ?auto_93162 ) ( CLEAR ?auto_93163 ) ( HOLDING ?auto_93164 ) ( CLEAR ?auto_93165 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93165 ?auto_93164 )
      ( MAKE-3PILE ?auto_93159 ?auto_93160 ?auto_93161 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93167 - BLOCK
      ?auto_93168 - BLOCK
      ?auto_93169 - BLOCK
    )
    :vars
    (
      ?auto_93170 - BLOCK
      ?auto_93174 - BLOCK
      ?auto_93172 - BLOCK
      ?auto_93173 - BLOCK
      ?auto_93171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93170 ?auto_93169 ) ( ON-TABLE ?auto_93167 ) ( ON ?auto_93168 ?auto_93167 ) ( ON ?auto_93169 ?auto_93168 ) ( not ( = ?auto_93167 ?auto_93168 ) ) ( not ( = ?auto_93167 ?auto_93169 ) ) ( not ( = ?auto_93167 ?auto_93170 ) ) ( not ( = ?auto_93168 ?auto_93169 ) ) ( not ( = ?auto_93168 ?auto_93170 ) ) ( not ( = ?auto_93169 ?auto_93170 ) ) ( not ( = ?auto_93167 ?auto_93174 ) ) ( not ( = ?auto_93167 ?auto_93172 ) ) ( not ( = ?auto_93168 ?auto_93174 ) ) ( not ( = ?auto_93168 ?auto_93172 ) ) ( not ( = ?auto_93169 ?auto_93174 ) ) ( not ( = ?auto_93169 ?auto_93172 ) ) ( not ( = ?auto_93170 ?auto_93174 ) ) ( not ( = ?auto_93170 ?auto_93172 ) ) ( not ( = ?auto_93174 ?auto_93172 ) ) ( ON ?auto_93174 ?auto_93170 ) ( ON-TABLE ?auto_93173 ) ( not ( = ?auto_93173 ?auto_93171 ) ) ( not ( = ?auto_93173 ?auto_93172 ) ) ( not ( = ?auto_93171 ?auto_93172 ) ) ( not ( = ?auto_93167 ?auto_93171 ) ) ( not ( = ?auto_93167 ?auto_93173 ) ) ( not ( = ?auto_93168 ?auto_93171 ) ) ( not ( = ?auto_93168 ?auto_93173 ) ) ( not ( = ?auto_93169 ?auto_93171 ) ) ( not ( = ?auto_93169 ?auto_93173 ) ) ( not ( = ?auto_93170 ?auto_93171 ) ) ( not ( = ?auto_93170 ?auto_93173 ) ) ( not ( = ?auto_93174 ?auto_93171 ) ) ( not ( = ?auto_93174 ?auto_93173 ) ) ( ON ?auto_93172 ?auto_93174 ) ( CLEAR ?auto_93173 ) ( ON ?auto_93171 ?auto_93172 ) ( CLEAR ?auto_93171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93167 ?auto_93168 ?auto_93169 ?auto_93170 ?auto_93174 ?auto_93172 )
      ( MAKE-3PILE ?auto_93167 ?auto_93168 ?auto_93169 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93175 - BLOCK
      ?auto_93176 - BLOCK
      ?auto_93177 - BLOCK
    )
    :vars
    (
      ?auto_93182 - BLOCK
      ?auto_93178 - BLOCK
      ?auto_93180 - BLOCK
      ?auto_93181 - BLOCK
      ?auto_93179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93182 ?auto_93177 ) ( ON-TABLE ?auto_93175 ) ( ON ?auto_93176 ?auto_93175 ) ( ON ?auto_93177 ?auto_93176 ) ( not ( = ?auto_93175 ?auto_93176 ) ) ( not ( = ?auto_93175 ?auto_93177 ) ) ( not ( = ?auto_93175 ?auto_93182 ) ) ( not ( = ?auto_93176 ?auto_93177 ) ) ( not ( = ?auto_93176 ?auto_93182 ) ) ( not ( = ?auto_93177 ?auto_93182 ) ) ( not ( = ?auto_93175 ?auto_93178 ) ) ( not ( = ?auto_93175 ?auto_93180 ) ) ( not ( = ?auto_93176 ?auto_93178 ) ) ( not ( = ?auto_93176 ?auto_93180 ) ) ( not ( = ?auto_93177 ?auto_93178 ) ) ( not ( = ?auto_93177 ?auto_93180 ) ) ( not ( = ?auto_93182 ?auto_93178 ) ) ( not ( = ?auto_93182 ?auto_93180 ) ) ( not ( = ?auto_93178 ?auto_93180 ) ) ( ON ?auto_93178 ?auto_93182 ) ( not ( = ?auto_93181 ?auto_93179 ) ) ( not ( = ?auto_93181 ?auto_93180 ) ) ( not ( = ?auto_93179 ?auto_93180 ) ) ( not ( = ?auto_93175 ?auto_93179 ) ) ( not ( = ?auto_93175 ?auto_93181 ) ) ( not ( = ?auto_93176 ?auto_93179 ) ) ( not ( = ?auto_93176 ?auto_93181 ) ) ( not ( = ?auto_93177 ?auto_93179 ) ) ( not ( = ?auto_93177 ?auto_93181 ) ) ( not ( = ?auto_93182 ?auto_93179 ) ) ( not ( = ?auto_93182 ?auto_93181 ) ) ( not ( = ?auto_93178 ?auto_93179 ) ) ( not ( = ?auto_93178 ?auto_93181 ) ) ( ON ?auto_93180 ?auto_93178 ) ( ON ?auto_93179 ?auto_93180 ) ( CLEAR ?auto_93179 ) ( HOLDING ?auto_93181 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93181 )
      ( MAKE-3PILE ?auto_93175 ?auto_93176 ?auto_93177 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93183 - BLOCK
      ?auto_93184 - BLOCK
      ?auto_93185 - BLOCK
    )
    :vars
    (
      ?auto_93189 - BLOCK
      ?auto_93190 - BLOCK
      ?auto_93187 - BLOCK
      ?auto_93186 - BLOCK
      ?auto_93188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93189 ?auto_93185 ) ( ON-TABLE ?auto_93183 ) ( ON ?auto_93184 ?auto_93183 ) ( ON ?auto_93185 ?auto_93184 ) ( not ( = ?auto_93183 ?auto_93184 ) ) ( not ( = ?auto_93183 ?auto_93185 ) ) ( not ( = ?auto_93183 ?auto_93189 ) ) ( not ( = ?auto_93184 ?auto_93185 ) ) ( not ( = ?auto_93184 ?auto_93189 ) ) ( not ( = ?auto_93185 ?auto_93189 ) ) ( not ( = ?auto_93183 ?auto_93190 ) ) ( not ( = ?auto_93183 ?auto_93187 ) ) ( not ( = ?auto_93184 ?auto_93190 ) ) ( not ( = ?auto_93184 ?auto_93187 ) ) ( not ( = ?auto_93185 ?auto_93190 ) ) ( not ( = ?auto_93185 ?auto_93187 ) ) ( not ( = ?auto_93189 ?auto_93190 ) ) ( not ( = ?auto_93189 ?auto_93187 ) ) ( not ( = ?auto_93190 ?auto_93187 ) ) ( ON ?auto_93190 ?auto_93189 ) ( not ( = ?auto_93186 ?auto_93188 ) ) ( not ( = ?auto_93186 ?auto_93187 ) ) ( not ( = ?auto_93188 ?auto_93187 ) ) ( not ( = ?auto_93183 ?auto_93188 ) ) ( not ( = ?auto_93183 ?auto_93186 ) ) ( not ( = ?auto_93184 ?auto_93188 ) ) ( not ( = ?auto_93184 ?auto_93186 ) ) ( not ( = ?auto_93185 ?auto_93188 ) ) ( not ( = ?auto_93185 ?auto_93186 ) ) ( not ( = ?auto_93189 ?auto_93188 ) ) ( not ( = ?auto_93189 ?auto_93186 ) ) ( not ( = ?auto_93190 ?auto_93188 ) ) ( not ( = ?auto_93190 ?auto_93186 ) ) ( ON ?auto_93187 ?auto_93190 ) ( ON ?auto_93188 ?auto_93187 ) ( ON ?auto_93186 ?auto_93188 ) ( CLEAR ?auto_93186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93183 ?auto_93184 ?auto_93185 ?auto_93189 ?auto_93190 ?auto_93187 ?auto_93188 )
      ( MAKE-3PILE ?auto_93183 ?auto_93184 ?auto_93185 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93196 - BLOCK
      ?auto_93197 - BLOCK
      ?auto_93198 - BLOCK
      ?auto_93199 - BLOCK
      ?auto_93200 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_93200 ) ( CLEAR ?auto_93199 ) ( ON-TABLE ?auto_93196 ) ( ON ?auto_93197 ?auto_93196 ) ( ON ?auto_93198 ?auto_93197 ) ( ON ?auto_93199 ?auto_93198 ) ( not ( = ?auto_93196 ?auto_93197 ) ) ( not ( = ?auto_93196 ?auto_93198 ) ) ( not ( = ?auto_93196 ?auto_93199 ) ) ( not ( = ?auto_93196 ?auto_93200 ) ) ( not ( = ?auto_93197 ?auto_93198 ) ) ( not ( = ?auto_93197 ?auto_93199 ) ) ( not ( = ?auto_93197 ?auto_93200 ) ) ( not ( = ?auto_93198 ?auto_93199 ) ) ( not ( = ?auto_93198 ?auto_93200 ) ) ( not ( = ?auto_93199 ?auto_93200 ) ) )
    :subtasks
    ( ( !STACK ?auto_93200 ?auto_93199 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93201 - BLOCK
      ?auto_93202 - BLOCK
      ?auto_93203 - BLOCK
      ?auto_93204 - BLOCK
      ?auto_93205 - BLOCK
    )
    :vars
    (
      ?auto_93206 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93204 ) ( ON-TABLE ?auto_93201 ) ( ON ?auto_93202 ?auto_93201 ) ( ON ?auto_93203 ?auto_93202 ) ( ON ?auto_93204 ?auto_93203 ) ( not ( = ?auto_93201 ?auto_93202 ) ) ( not ( = ?auto_93201 ?auto_93203 ) ) ( not ( = ?auto_93201 ?auto_93204 ) ) ( not ( = ?auto_93201 ?auto_93205 ) ) ( not ( = ?auto_93202 ?auto_93203 ) ) ( not ( = ?auto_93202 ?auto_93204 ) ) ( not ( = ?auto_93202 ?auto_93205 ) ) ( not ( = ?auto_93203 ?auto_93204 ) ) ( not ( = ?auto_93203 ?auto_93205 ) ) ( not ( = ?auto_93204 ?auto_93205 ) ) ( ON ?auto_93205 ?auto_93206 ) ( CLEAR ?auto_93205 ) ( HAND-EMPTY ) ( not ( = ?auto_93201 ?auto_93206 ) ) ( not ( = ?auto_93202 ?auto_93206 ) ) ( not ( = ?auto_93203 ?auto_93206 ) ) ( not ( = ?auto_93204 ?auto_93206 ) ) ( not ( = ?auto_93205 ?auto_93206 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93205 ?auto_93206 )
      ( MAKE-5PILE ?auto_93201 ?auto_93202 ?auto_93203 ?auto_93204 ?auto_93205 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93207 - BLOCK
      ?auto_93208 - BLOCK
      ?auto_93209 - BLOCK
      ?auto_93210 - BLOCK
      ?auto_93211 - BLOCK
    )
    :vars
    (
      ?auto_93212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93207 ) ( ON ?auto_93208 ?auto_93207 ) ( ON ?auto_93209 ?auto_93208 ) ( not ( = ?auto_93207 ?auto_93208 ) ) ( not ( = ?auto_93207 ?auto_93209 ) ) ( not ( = ?auto_93207 ?auto_93210 ) ) ( not ( = ?auto_93207 ?auto_93211 ) ) ( not ( = ?auto_93208 ?auto_93209 ) ) ( not ( = ?auto_93208 ?auto_93210 ) ) ( not ( = ?auto_93208 ?auto_93211 ) ) ( not ( = ?auto_93209 ?auto_93210 ) ) ( not ( = ?auto_93209 ?auto_93211 ) ) ( not ( = ?auto_93210 ?auto_93211 ) ) ( ON ?auto_93211 ?auto_93212 ) ( CLEAR ?auto_93211 ) ( not ( = ?auto_93207 ?auto_93212 ) ) ( not ( = ?auto_93208 ?auto_93212 ) ) ( not ( = ?auto_93209 ?auto_93212 ) ) ( not ( = ?auto_93210 ?auto_93212 ) ) ( not ( = ?auto_93211 ?auto_93212 ) ) ( HOLDING ?auto_93210 ) ( CLEAR ?auto_93209 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93207 ?auto_93208 ?auto_93209 ?auto_93210 )
      ( MAKE-5PILE ?auto_93207 ?auto_93208 ?auto_93209 ?auto_93210 ?auto_93211 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93213 - BLOCK
      ?auto_93214 - BLOCK
      ?auto_93215 - BLOCK
      ?auto_93216 - BLOCK
      ?auto_93217 - BLOCK
    )
    :vars
    (
      ?auto_93218 - BLOCK
      ?auto_93219 - BLOCK
      ?auto_93220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93213 ) ( ON ?auto_93214 ?auto_93213 ) ( ON ?auto_93215 ?auto_93214 ) ( not ( = ?auto_93213 ?auto_93214 ) ) ( not ( = ?auto_93213 ?auto_93215 ) ) ( not ( = ?auto_93213 ?auto_93216 ) ) ( not ( = ?auto_93213 ?auto_93217 ) ) ( not ( = ?auto_93214 ?auto_93215 ) ) ( not ( = ?auto_93214 ?auto_93216 ) ) ( not ( = ?auto_93214 ?auto_93217 ) ) ( not ( = ?auto_93215 ?auto_93216 ) ) ( not ( = ?auto_93215 ?auto_93217 ) ) ( not ( = ?auto_93216 ?auto_93217 ) ) ( ON ?auto_93217 ?auto_93218 ) ( not ( = ?auto_93213 ?auto_93218 ) ) ( not ( = ?auto_93214 ?auto_93218 ) ) ( not ( = ?auto_93215 ?auto_93218 ) ) ( not ( = ?auto_93216 ?auto_93218 ) ) ( not ( = ?auto_93217 ?auto_93218 ) ) ( CLEAR ?auto_93215 ) ( ON ?auto_93216 ?auto_93217 ) ( CLEAR ?auto_93216 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93219 ) ( ON ?auto_93220 ?auto_93219 ) ( ON ?auto_93218 ?auto_93220 ) ( not ( = ?auto_93219 ?auto_93220 ) ) ( not ( = ?auto_93219 ?auto_93218 ) ) ( not ( = ?auto_93219 ?auto_93217 ) ) ( not ( = ?auto_93219 ?auto_93216 ) ) ( not ( = ?auto_93220 ?auto_93218 ) ) ( not ( = ?auto_93220 ?auto_93217 ) ) ( not ( = ?auto_93220 ?auto_93216 ) ) ( not ( = ?auto_93213 ?auto_93219 ) ) ( not ( = ?auto_93213 ?auto_93220 ) ) ( not ( = ?auto_93214 ?auto_93219 ) ) ( not ( = ?auto_93214 ?auto_93220 ) ) ( not ( = ?auto_93215 ?auto_93219 ) ) ( not ( = ?auto_93215 ?auto_93220 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93219 ?auto_93220 ?auto_93218 ?auto_93217 )
      ( MAKE-5PILE ?auto_93213 ?auto_93214 ?auto_93215 ?auto_93216 ?auto_93217 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93221 - BLOCK
      ?auto_93222 - BLOCK
      ?auto_93223 - BLOCK
      ?auto_93224 - BLOCK
      ?auto_93225 - BLOCK
    )
    :vars
    (
      ?auto_93228 - BLOCK
      ?auto_93227 - BLOCK
      ?auto_93226 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93221 ) ( ON ?auto_93222 ?auto_93221 ) ( not ( = ?auto_93221 ?auto_93222 ) ) ( not ( = ?auto_93221 ?auto_93223 ) ) ( not ( = ?auto_93221 ?auto_93224 ) ) ( not ( = ?auto_93221 ?auto_93225 ) ) ( not ( = ?auto_93222 ?auto_93223 ) ) ( not ( = ?auto_93222 ?auto_93224 ) ) ( not ( = ?auto_93222 ?auto_93225 ) ) ( not ( = ?auto_93223 ?auto_93224 ) ) ( not ( = ?auto_93223 ?auto_93225 ) ) ( not ( = ?auto_93224 ?auto_93225 ) ) ( ON ?auto_93225 ?auto_93228 ) ( not ( = ?auto_93221 ?auto_93228 ) ) ( not ( = ?auto_93222 ?auto_93228 ) ) ( not ( = ?auto_93223 ?auto_93228 ) ) ( not ( = ?auto_93224 ?auto_93228 ) ) ( not ( = ?auto_93225 ?auto_93228 ) ) ( ON ?auto_93224 ?auto_93225 ) ( CLEAR ?auto_93224 ) ( ON-TABLE ?auto_93227 ) ( ON ?auto_93226 ?auto_93227 ) ( ON ?auto_93228 ?auto_93226 ) ( not ( = ?auto_93227 ?auto_93226 ) ) ( not ( = ?auto_93227 ?auto_93228 ) ) ( not ( = ?auto_93227 ?auto_93225 ) ) ( not ( = ?auto_93227 ?auto_93224 ) ) ( not ( = ?auto_93226 ?auto_93228 ) ) ( not ( = ?auto_93226 ?auto_93225 ) ) ( not ( = ?auto_93226 ?auto_93224 ) ) ( not ( = ?auto_93221 ?auto_93227 ) ) ( not ( = ?auto_93221 ?auto_93226 ) ) ( not ( = ?auto_93222 ?auto_93227 ) ) ( not ( = ?auto_93222 ?auto_93226 ) ) ( not ( = ?auto_93223 ?auto_93227 ) ) ( not ( = ?auto_93223 ?auto_93226 ) ) ( HOLDING ?auto_93223 ) ( CLEAR ?auto_93222 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93221 ?auto_93222 ?auto_93223 )
      ( MAKE-5PILE ?auto_93221 ?auto_93222 ?auto_93223 ?auto_93224 ?auto_93225 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93229 - BLOCK
      ?auto_93230 - BLOCK
      ?auto_93231 - BLOCK
      ?auto_93232 - BLOCK
      ?auto_93233 - BLOCK
    )
    :vars
    (
      ?auto_93234 - BLOCK
      ?auto_93236 - BLOCK
      ?auto_93235 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93229 ) ( ON ?auto_93230 ?auto_93229 ) ( not ( = ?auto_93229 ?auto_93230 ) ) ( not ( = ?auto_93229 ?auto_93231 ) ) ( not ( = ?auto_93229 ?auto_93232 ) ) ( not ( = ?auto_93229 ?auto_93233 ) ) ( not ( = ?auto_93230 ?auto_93231 ) ) ( not ( = ?auto_93230 ?auto_93232 ) ) ( not ( = ?auto_93230 ?auto_93233 ) ) ( not ( = ?auto_93231 ?auto_93232 ) ) ( not ( = ?auto_93231 ?auto_93233 ) ) ( not ( = ?auto_93232 ?auto_93233 ) ) ( ON ?auto_93233 ?auto_93234 ) ( not ( = ?auto_93229 ?auto_93234 ) ) ( not ( = ?auto_93230 ?auto_93234 ) ) ( not ( = ?auto_93231 ?auto_93234 ) ) ( not ( = ?auto_93232 ?auto_93234 ) ) ( not ( = ?auto_93233 ?auto_93234 ) ) ( ON ?auto_93232 ?auto_93233 ) ( ON-TABLE ?auto_93236 ) ( ON ?auto_93235 ?auto_93236 ) ( ON ?auto_93234 ?auto_93235 ) ( not ( = ?auto_93236 ?auto_93235 ) ) ( not ( = ?auto_93236 ?auto_93234 ) ) ( not ( = ?auto_93236 ?auto_93233 ) ) ( not ( = ?auto_93236 ?auto_93232 ) ) ( not ( = ?auto_93235 ?auto_93234 ) ) ( not ( = ?auto_93235 ?auto_93233 ) ) ( not ( = ?auto_93235 ?auto_93232 ) ) ( not ( = ?auto_93229 ?auto_93236 ) ) ( not ( = ?auto_93229 ?auto_93235 ) ) ( not ( = ?auto_93230 ?auto_93236 ) ) ( not ( = ?auto_93230 ?auto_93235 ) ) ( not ( = ?auto_93231 ?auto_93236 ) ) ( not ( = ?auto_93231 ?auto_93235 ) ) ( CLEAR ?auto_93230 ) ( ON ?auto_93231 ?auto_93232 ) ( CLEAR ?auto_93231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93236 ?auto_93235 ?auto_93234 ?auto_93233 ?auto_93232 )
      ( MAKE-5PILE ?auto_93229 ?auto_93230 ?auto_93231 ?auto_93232 ?auto_93233 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93237 - BLOCK
      ?auto_93238 - BLOCK
      ?auto_93239 - BLOCK
      ?auto_93240 - BLOCK
      ?auto_93241 - BLOCK
    )
    :vars
    (
      ?auto_93244 - BLOCK
      ?auto_93242 - BLOCK
      ?auto_93243 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93237 ) ( not ( = ?auto_93237 ?auto_93238 ) ) ( not ( = ?auto_93237 ?auto_93239 ) ) ( not ( = ?auto_93237 ?auto_93240 ) ) ( not ( = ?auto_93237 ?auto_93241 ) ) ( not ( = ?auto_93238 ?auto_93239 ) ) ( not ( = ?auto_93238 ?auto_93240 ) ) ( not ( = ?auto_93238 ?auto_93241 ) ) ( not ( = ?auto_93239 ?auto_93240 ) ) ( not ( = ?auto_93239 ?auto_93241 ) ) ( not ( = ?auto_93240 ?auto_93241 ) ) ( ON ?auto_93241 ?auto_93244 ) ( not ( = ?auto_93237 ?auto_93244 ) ) ( not ( = ?auto_93238 ?auto_93244 ) ) ( not ( = ?auto_93239 ?auto_93244 ) ) ( not ( = ?auto_93240 ?auto_93244 ) ) ( not ( = ?auto_93241 ?auto_93244 ) ) ( ON ?auto_93240 ?auto_93241 ) ( ON-TABLE ?auto_93242 ) ( ON ?auto_93243 ?auto_93242 ) ( ON ?auto_93244 ?auto_93243 ) ( not ( = ?auto_93242 ?auto_93243 ) ) ( not ( = ?auto_93242 ?auto_93244 ) ) ( not ( = ?auto_93242 ?auto_93241 ) ) ( not ( = ?auto_93242 ?auto_93240 ) ) ( not ( = ?auto_93243 ?auto_93244 ) ) ( not ( = ?auto_93243 ?auto_93241 ) ) ( not ( = ?auto_93243 ?auto_93240 ) ) ( not ( = ?auto_93237 ?auto_93242 ) ) ( not ( = ?auto_93237 ?auto_93243 ) ) ( not ( = ?auto_93238 ?auto_93242 ) ) ( not ( = ?auto_93238 ?auto_93243 ) ) ( not ( = ?auto_93239 ?auto_93242 ) ) ( not ( = ?auto_93239 ?auto_93243 ) ) ( ON ?auto_93239 ?auto_93240 ) ( CLEAR ?auto_93239 ) ( HOLDING ?auto_93238 ) ( CLEAR ?auto_93237 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93237 ?auto_93238 )
      ( MAKE-5PILE ?auto_93237 ?auto_93238 ?auto_93239 ?auto_93240 ?auto_93241 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93245 - BLOCK
      ?auto_93246 - BLOCK
      ?auto_93247 - BLOCK
      ?auto_93248 - BLOCK
      ?auto_93249 - BLOCK
    )
    :vars
    (
      ?auto_93251 - BLOCK
      ?auto_93250 - BLOCK
      ?auto_93252 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93245 ) ( not ( = ?auto_93245 ?auto_93246 ) ) ( not ( = ?auto_93245 ?auto_93247 ) ) ( not ( = ?auto_93245 ?auto_93248 ) ) ( not ( = ?auto_93245 ?auto_93249 ) ) ( not ( = ?auto_93246 ?auto_93247 ) ) ( not ( = ?auto_93246 ?auto_93248 ) ) ( not ( = ?auto_93246 ?auto_93249 ) ) ( not ( = ?auto_93247 ?auto_93248 ) ) ( not ( = ?auto_93247 ?auto_93249 ) ) ( not ( = ?auto_93248 ?auto_93249 ) ) ( ON ?auto_93249 ?auto_93251 ) ( not ( = ?auto_93245 ?auto_93251 ) ) ( not ( = ?auto_93246 ?auto_93251 ) ) ( not ( = ?auto_93247 ?auto_93251 ) ) ( not ( = ?auto_93248 ?auto_93251 ) ) ( not ( = ?auto_93249 ?auto_93251 ) ) ( ON ?auto_93248 ?auto_93249 ) ( ON-TABLE ?auto_93250 ) ( ON ?auto_93252 ?auto_93250 ) ( ON ?auto_93251 ?auto_93252 ) ( not ( = ?auto_93250 ?auto_93252 ) ) ( not ( = ?auto_93250 ?auto_93251 ) ) ( not ( = ?auto_93250 ?auto_93249 ) ) ( not ( = ?auto_93250 ?auto_93248 ) ) ( not ( = ?auto_93252 ?auto_93251 ) ) ( not ( = ?auto_93252 ?auto_93249 ) ) ( not ( = ?auto_93252 ?auto_93248 ) ) ( not ( = ?auto_93245 ?auto_93250 ) ) ( not ( = ?auto_93245 ?auto_93252 ) ) ( not ( = ?auto_93246 ?auto_93250 ) ) ( not ( = ?auto_93246 ?auto_93252 ) ) ( not ( = ?auto_93247 ?auto_93250 ) ) ( not ( = ?auto_93247 ?auto_93252 ) ) ( ON ?auto_93247 ?auto_93248 ) ( CLEAR ?auto_93245 ) ( ON ?auto_93246 ?auto_93247 ) ( CLEAR ?auto_93246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93250 ?auto_93252 ?auto_93251 ?auto_93249 ?auto_93248 ?auto_93247 )
      ( MAKE-5PILE ?auto_93245 ?auto_93246 ?auto_93247 ?auto_93248 ?auto_93249 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93253 - BLOCK
      ?auto_93254 - BLOCK
      ?auto_93255 - BLOCK
      ?auto_93256 - BLOCK
      ?auto_93257 - BLOCK
    )
    :vars
    (
      ?auto_93260 - BLOCK
      ?auto_93258 - BLOCK
      ?auto_93259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93253 ?auto_93254 ) ) ( not ( = ?auto_93253 ?auto_93255 ) ) ( not ( = ?auto_93253 ?auto_93256 ) ) ( not ( = ?auto_93253 ?auto_93257 ) ) ( not ( = ?auto_93254 ?auto_93255 ) ) ( not ( = ?auto_93254 ?auto_93256 ) ) ( not ( = ?auto_93254 ?auto_93257 ) ) ( not ( = ?auto_93255 ?auto_93256 ) ) ( not ( = ?auto_93255 ?auto_93257 ) ) ( not ( = ?auto_93256 ?auto_93257 ) ) ( ON ?auto_93257 ?auto_93260 ) ( not ( = ?auto_93253 ?auto_93260 ) ) ( not ( = ?auto_93254 ?auto_93260 ) ) ( not ( = ?auto_93255 ?auto_93260 ) ) ( not ( = ?auto_93256 ?auto_93260 ) ) ( not ( = ?auto_93257 ?auto_93260 ) ) ( ON ?auto_93256 ?auto_93257 ) ( ON-TABLE ?auto_93258 ) ( ON ?auto_93259 ?auto_93258 ) ( ON ?auto_93260 ?auto_93259 ) ( not ( = ?auto_93258 ?auto_93259 ) ) ( not ( = ?auto_93258 ?auto_93260 ) ) ( not ( = ?auto_93258 ?auto_93257 ) ) ( not ( = ?auto_93258 ?auto_93256 ) ) ( not ( = ?auto_93259 ?auto_93260 ) ) ( not ( = ?auto_93259 ?auto_93257 ) ) ( not ( = ?auto_93259 ?auto_93256 ) ) ( not ( = ?auto_93253 ?auto_93258 ) ) ( not ( = ?auto_93253 ?auto_93259 ) ) ( not ( = ?auto_93254 ?auto_93258 ) ) ( not ( = ?auto_93254 ?auto_93259 ) ) ( not ( = ?auto_93255 ?auto_93258 ) ) ( not ( = ?auto_93255 ?auto_93259 ) ) ( ON ?auto_93255 ?auto_93256 ) ( ON ?auto_93254 ?auto_93255 ) ( CLEAR ?auto_93254 ) ( HOLDING ?auto_93253 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93253 )
      ( MAKE-5PILE ?auto_93253 ?auto_93254 ?auto_93255 ?auto_93256 ?auto_93257 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93261 - BLOCK
      ?auto_93262 - BLOCK
      ?auto_93263 - BLOCK
      ?auto_93264 - BLOCK
      ?auto_93265 - BLOCK
    )
    :vars
    (
      ?auto_93267 - BLOCK
      ?auto_93266 - BLOCK
      ?auto_93268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93261 ?auto_93262 ) ) ( not ( = ?auto_93261 ?auto_93263 ) ) ( not ( = ?auto_93261 ?auto_93264 ) ) ( not ( = ?auto_93261 ?auto_93265 ) ) ( not ( = ?auto_93262 ?auto_93263 ) ) ( not ( = ?auto_93262 ?auto_93264 ) ) ( not ( = ?auto_93262 ?auto_93265 ) ) ( not ( = ?auto_93263 ?auto_93264 ) ) ( not ( = ?auto_93263 ?auto_93265 ) ) ( not ( = ?auto_93264 ?auto_93265 ) ) ( ON ?auto_93265 ?auto_93267 ) ( not ( = ?auto_93261 ?auto_93267 ) ) ( not ( = ?auto_93262 ?auto_93267 ) ) ( not ( = ?auto_93263 ?auto_93267 ) ) ( not ( = ?auto_93264 ?auto_93267 ) ) ( not ( = ?auto_93265 ?auto_93267 ) ) ( ON ?auto_93264 ?auto_93265 ) ( ON-TABLE ?auto_93266 ) ( ON ?auto_93268 ?auto_93266 ) ( ON ?auto_93267 ?auto_93268 ) ( not ( = ?auto_93266 ?auto_93268 ) ) ( not ( = ?auto_93266 ?auto_93267 ) ) ( not ( = ?auto_93266 ?auto_93265 ) ) ( not ( = ?auto_93266 ?auto_93264 ) ) ( not ( = ?auto_93268 ?auto_93267 ) ) ( not ( = ?auto_93268 ?auto_93265 ) ) ( not ( = ?auto_93268 ?auto_93264 ) ) ( not ( = ?auto_93261 ?auto_93266 ) ) ( not ( = ?auto_93261 ?auto_93268 ) ) ( not ( = ?auto_93262 ?auto_93266 ) ) ( not ( = ?auto_93262 ?auto_93268 ) ) ( not ( = ?auto_93263 ?auto_93266 ) ) ( not ( = ?auto_93263 ?auto_93268 ) ) ( ON ?auto_93263 ?auto_93264 ) ( ON ?auto_93262 ?auto_93263 ) ( ON ?auto_93261 ?auto_93262 ) ( CLEAR ?auto_93261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93266 ?auto_93268 ?auto_93267 ?auto_93265 ?auto_93264 ?auto_93263 ?auto_93262 )
      ( MAKE-5PILE ?auto_93261 ?auto_93262 ?auto_93263 ?auto_93264 ?auto_93265 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93271 - BLOCK
      ?auto_93272 - BLOCK
    )
    :vars
    (
      ?auto_93273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93273 ?auto_93272 ) ( CLEAR ?auto_93273 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93271 ) ( ON ?auto_93272 ?auto_93271 ) ( not ( = ?auto_93271 ?auto_93272 ) ) ( not ( = ?auto_93271 ?auto_93273 ) ) ( not ( = ?auto_93272 ?auto_93273 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93273 ?auto_93272 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93274 - BLOCK
      ?auto_93275 - BLOCK
    )
    :vars
    (
      ?auto_93276 - BLOCK
      ?auto_93277 - BLOCK
      ?auto_93278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93276 ?auto_93275 ) ( CLEAR ?auto_93276 ) ( ON-TABLE ?auto_93274 ) ( ON ?auto_93275 ?auto_93274 ) ( not ( = ?auto_93274 ?auto_93275 ) ) ( not ( = ?auto_93274 ?auto_93276 ) ) ( not ( = ?auto_93275 ?auto_93276 ) ) ( HOLDING ?auto_93277 ) ( CLEAR ?auto_93278 ) ( not ( = ?auto_93274 ?auto_93277 ) ) ( not ( = ?auto_93274 ?auto_93278 ) ) ( not ( = ?auto_93275 ?auto_93277 ) ) ( not ( = ?auto_93275 ?auto_93278 ) ) ( not ( = ?auto_93276 ?auto_93277 ) ) ( not ( = ?auto_93276 ?auto_93278 ) ) ( not ( = ?auto_93277 ?auto_93278 ) ) )
    :subtasks
    ( ( !STACK ?auto_93277 ?auto_93278 )
      ( MAKE-2PILE ?auto_93274 ?auto_93275 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93279 - BLOCK
      ?auto_93280 - BLOCK
    )
    :vars
    (
      ?auto_93281 - BLOCK
      ?auto_93282 - BLOCK
      ?auto_93283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93281 ?auto_93280 ) ( ON-TABLE ?auto_93279 ) ( ON ?auto_93280 ?auto_93279 ) ( not ( = ?auto_93279 ?auto_93280 ) ) ( not ( = ?auto_93279 ?auto_93281 ) ) ( not ( = ?auto_93280 ?auto_93281 ) ) ( CLEAR ?auto_93282 ) ( not ( = ?auto_93279 ?auto_93283 ) ) ( not ( = ?auto_93279 ?auto_93282 ) ) ( not ( = ?auto_93280 ?auto_93283 ) ) ( not ( = ?auto_93280 ?auto_93282 ) ) ( not ( = ?auto_93281 ?auto_93283 ) ) ( not ( = ?auto_93281 ?auto_93282 ) ) ( not ( = ?auto_93283 ?auto_93282 ) ) ( ON ?auto_93283 ?auto_93281 ) ( CLEAR ?auto_93283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93279 ?auto_93280 ?auto_93281 )
      ( MAKE-2PILE ?auto_93279 ?auto_93280 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93284 - BLOCK
      ?auto_93285 - BLOCK
    )
    :vars
    (
      ?auto_93287 - BLOCK
      ?auto_93286 - BLOCK
      ?auto_93288 - BLOCK
      ?auto_93290 - BLOCK
      ?auto_93291 - BLOCK
      ?auto_93289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93287 ?auto_93285 ) ( ON-TABLE ?auto_93284 ) ( ON ?auto_93285 ?auto_93284 ) ( not ( = ?auto_93284 ?auto_93285 ) ) ( not ( = ?auto_93284 ?auto_93287 ) ) ( not ( = ?auto_93285 ?auto_93287 ) ) ( not ( = ?auto_93284 ?auto_93286 ) ) ( not ( = ?auto_93284 ?auto_93288 ) ) ( not ( = ?auto_93285 ?auto_93286 ) ) ( not ( = ?auto_93285 ?auto_93288 ) ) ( not ( = ?auto_93287 ?auto_93286 ) ) ( not ( = ?auto_93287 ?auto_93288 ) ) ( not ( = ?auto_93286 ?auto_93288 ) ) ( ON ?auto_93286 ?auto_93287 ) ( CLEAR ?auto_93286 ) ( HOLDING ?auto_93288 ) ( CLEAR ?auto_93290 ) ( ON-TABLE ?auto_93291 ) ( ON ?auto_93289 ?auto_93291 ) ( ON ?auto_93290 ?auto_93289 ) ( not ( = ?auto_93291 ?auto_93289 ) ) ( not ( = ?auto_93291 ?auto_93290 ) ) ( not ( = ?auto_93291 ?auto_93288 ) ) ( not ( = ?auto_93289 ?auto_93290 ) ) ( not ( = ?auto_93289 ?auto_93288 ) ) ( not ( = ?auto_93290 ?auto_93288 ) ) ( not ( = ?auto_93284 ?auto_93290 ) ) ( not ( = ?auto_93284 ?auto_93291 ) ) ( not ( = ?auto_93284 ?auto_93289 ) ) ( not ( = ?auto_93285 ?auto_93290 ) ) ( not ( = ?auto_93285 ?auto_93291 ) ) ( not ( = ?auto_93285 ?auto_93289 ) ) ( not ( = ?auto_93287 ?auto_93290 ) ) ( not ( = ?auto_93287 ?auto_93291 ) ) ( not ( = ?auto_93287 ?auto_93289 ) ) ( not ( = ?auto_93286 ?auto_93290 ) ) ( not ( = ?auto_93286 ?auto_93291 ) ) ( not ( = ?auto_93286 ?auto_93289 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93291 ?auto_93289 ?auto_93290 ?auto_93288 )
      ( MAKE-2PILE ?auto_93284 ?auto_93285 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93292 - BLOCK
      ?auto_93293 - BLOCK
    )
    :vars
    (
      ?auto_93295 - BLOCK
      ?auto_93296 - BLOCK
      ?auto_93297 - BLOCK
      ?auto_93298 - BLOCK
      ?auto_93294 - BLOCK
      ?auto_93299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93295 ?auto_93293 ) ( ON-TABLE ?auto_93292 ) ( ON ?auto_93293 ?auto_93292 ) ( not ( = ?auto_93292 ?auto_93293 ) ) ( not ( = ?auto_93292 ?auto_93295 ) ) ( not ( = ?auto_93293 ?auto_93295 ) ) ( not ( = ?auto_93292 ?auto_93296 ) ) ( not ( = ?auto_93292 ?auto_93297 ) ) ( not ( = ?auto_93293 ?auto_93296 ) ) ( not ( = ?auto_93293 ?auto_93297 ) ) ( not ( = ?auto_93295 ?auto_93296 ) ) ( not ( = ?auto_93295 ?auto_93297 ) ) ( not ( = ?auto_93296 ?auto_93297 ) ) ( ON ?auto_93296 ?auto_93295 ) ( CLEAR ?auto_93298 ) ( ON-TABLE ?auto_93294 ) ( ON ?auto_93299 ?auto_93294 ) ( ON ?auto_93298 ?auto_93299 ) ( not ( = ?auto_93294 ?auto_93299 ) ) ( not ( = ?auto_93294 ?auto_93298 ) ) ( not ( = ?auto_93294 ?auto_93297 ) ) ( not ( = ?auto_93299 ?auto_93298 ) ) ( not ( = ?auto_93299 ?auto_93297 ) ) ( not ( = ?auto_93298 ?auto_93297 ) ) ( not ( = ?auto_93292 ?auto_93298 ) ) ( not ( = ?auto_93292 ?auto_93294 ) ) ( not ( = ?auto_93292 ?auto_93299 ) ) ( not ( = ?auto_93293 ?auto_93298 ) ) ( not ( = ?auto_93293 ?auto_93294 ) ) ( not ( = ?auto_93293 ?auto_93299 ) ) ( not ( = ?auto_93295 ?auto_93298 ) ) ( not ( = ?auto_93295 ?auto_93294 ) ) ( not ( = ?auto_93295 ?auto_93299 ) ) ( not ( = ?auto_93296 ?auto_93298 ) ) ( not ( = ?auto_93296 ?auto_93294 ) ) ( not ( = ?auto_93296 ?auto_93299 ) ) ( ON ?auto_93297 ?auto_93296 ) ( CLEAR ?auto_93297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93292 ?auto_93293 ?auto_93295 ?auto_93296 )
      ( MAKE-2PILE ?auto_93292 ?auto_93293 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93300 - BLOCK
      ?auto_93301 - BLOCK
    )
    :vars
    (
      ?auto_93306 - BLOCK
      ?auto_93302 - BLOCK
      ?auto_93304 - BLOCK
      ?auto_93303 - BLOCK
      ?auto_93307 - BLOCK
      ?auto_93305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93306 ?auto_93301 ) ( ON-TABLE ?auto_93300 ) ( ON ?auto_93301 ?auto_93300 ) ( not ( = ?auto_93300 ?auto_93301 ) ) ( not ( = ?auto_93300 ?auto_93306 ) ) ( not ( = ?auto_93301 ?auto_93306 ) ) ( not ( = ?auto_93300 ?auto_93302 ) ) ( not ( = ?auto_93300 ?auto_93304 ) ) ( not ( = ?auto_93301 ?auto_93302 ) ) ( not ( = ?auto_93301 ?auto_93304 ) ) ( not ( = ?auto_93306 ?auto_93302 ) ) ( not ( = ?auto_93306 ?auto_93304 ) ) ( not ( = ?auto_93302 ?auto_93304 ) ) ( ON ?auto_93302 ?auto_93306 ) ( ON-TABLE ?auto_93303 ) ( ON ?auto_93307 ?auto_93303 ) ( not ( = ?auto_93303 ?auto_93307 ) ) ( not ( = ?auto_93303 ?auto_93305 ) ) ( not ( = ?auto_93303 ?auto_93304 ) ) ( not ( = ?auto_93307 ?auto_93305 ) ) ( not ( = ?auto_93307 ?auto_93304 ) ) ( not ( = ?auto_93305 ?auto_93304 ) ) ( not ( = ?auto_93300 ?auto_93305 ) ) ( not ( = ?auto_93300 ?auto_93303 ) ) ( not ( = ?auto_93300 ?auto_93307 ) ) ( not ( = ?auto_93301 ?auto_93305 ) ) ( not ( = ?auto_93301 ?auto_93303 ) ) ( not ( = ?auto_93301 ?auto_93307 ) ) ( not ( = ?auto_93306 ?auto_93305 ) ) ( not ( = ?auto_93306 ?auto_93303 ) ) ( not ( = ?auto_93306 ?auto_93307 ) ) ( not ( = ?auto_93302 ?auto_93305 ) ) ( not ( = ?auto_93302 ?auto_93303 ) ) ( not ( = ?auto_93302 ?auto_93307 ) ) ( ON ?auto_93304 ?auto_93302 ) ( CLEAR ?auto_93304 ) ( HOLDING ?auto_93305 ) ( CLEAR ?auto_93307 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93303 ?auto_93307 ?auto_93305 )
      ( MAKE-2PILE ?auto_93300 ?auto_93301 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93308 - BLOCK
      ?auto_93309 - BLOCK
    )
    :vars
    (
      ?auto_93310 - BLOCK
      ?auto_93315 - BLOCK
      ?auto_93311 - BLOCK
      ?auto_93312 - BLOCK
      ?auto_93314 - BLOCK
      ?auto_93313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93310 ?auto_93309 ) ( ON-TABLE ?auto_93308 ) ( ON ?auto_93309 ?auto_93308 ) ( not ( = ?auto_93308 ?auto_93309 ) ) ( not ( = ?auto_93308 ?auto_93310 ) ) ( not ( = ?auto_93309 ?auto_93310 ) ) ( not ( = ?auto_93308 ?auto_93315 ) ) ( not ( = ?auto_93308 ?auto_93311 ) ) ( not ( = ?auto_93309 ?auto_93315 ) ) ( not ( = ?auto_93309 ?auto_93311 ) ) ( not ( = ?auto_93310 ?auto_93315 ) ) ( not ( = ?auto_93310 ?auto_93311 ) ) ( not ( = ?auto_93315 ?auto_93311 ) ) ( ON ?auto_93315 ?auto_93310 ) ( ON-TABLE ?auto_93312 ) ( ON ?auto_93314 ?auto_93312 ) ( not ( = ?auto_93312 ?auto_93314 ) ) ( not ( = ?auto_93312 ?auto_93313 ) ) ( not ( = ?auto_93312 ?auto_93311 ) ) ( not ( = ?auto_93314 ?auto_93313 ) ) ( not ( = ?auto_93314 ?auto_93311 ) ) ( not ( = ?auto_93313 ?auto_93311 ) ) ( not ( = ?auto_93308 ?auto_93313 ) ) ( not ( = ?auto_93308 ?auto_93312 ) ) ( not ( = ?auto_93308 ?auto_93314 ) ) ( not ( = ?auto_93309 ?auto_93313 ) ) ( not ( = ?auto_93309 ?auto_93312 ) ) ( not ( = ?auto_93309 ?auto_93314 ) ) ( not ( = ?auto_93310 ?auto_93313 ) ) ( not ( = ?auto_93310 ?auto_93312 ) ) ( not ( = ?auto_93310 ?auto_93314 ) ) ( not ( = ?auto_93315 ?auto_93313 ) ) ( not ( = ?auto_93315 ?auto_93312 ) ) ( not ( = ?auto_93315 ?auto_93314 ) ) ( ON ?auto_93311 ?auto_93315 ) ( CLEAR ?auto_93314 ) ( ON ?auto_93313 ?auto_93311 ) ( CLEAR ?auto_93313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93308 ?auto_93309 ?auto_93310 ?auto_93315 ?auto_93311 )
      ( MAKE-2PILE ?auto_93308 ?auto_93309 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93316 - BLOCK
      ?auto_93317 - BLOCK
    )
    :vars
    (
      ?auto_93318 - BLOCK
      ?auto_93319 - BLOCK
      ?auto_93322 - BLOCK
      ?auto_93323 - BLOCK
      ?auto_93320 - BLOCK
      ?auto_93321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93318 ?auto_93317 ) ( ON-TABLE ?auto_93316 ) ( ON ?auto_93317 ?auto_93316 ) ( not ( = ?auto_93316 ?auto_93317 ) ) ( not ( = ?auto_93316 ?auto_93318 ) ) ( not ( = ?auto_93317 ?auto_93318 ) ) ( not ( = ?auto_93316 ?auto_93319 ) ) ( not ( = ?auto_93316 ?auto_93322 ) ) ( not ( = ?auto_93317 ?auto_93319 ) ) ( not ( = ?auto_93317 ?auto_93322 ) ) ( not ( = ?auto_93318 ?auto_93319 ) ) ( not ( = ?auto_93318 ?auto_93322 ) ) ( not ( = ?auto_93319 ?auto_93322 ) ) ( ON ?auto_93319 ?auto_93318 ) ( ON-TABLE ?auto_93323 ) ( not ( = ?auto_93323 ?auto_93320 ) ) ( not ( = ?auto_93323 ?auto_93321 ) ) ( not ( = ?auto_93323 ?auto_93322 ) ) ( not ( = ?auto_93320 ?auto_93321 ) ) ( not ( = ?auto_93320 ?auto_93322 ) ) ( not ( = ?auto_93321 ?auto_93322 ) ) ( not ( = ?auto_93316 ?auto_93321 ) ) ( not ( = ?auto_93316 ?auto_93323 ) ) ( not ( = ?auto_93316 ?auto_93320 ) ) ( not ( = ?auto_93317 ?auto_93321 ) ) ( not ( = ?auto_93317 ?auto_93323 ) ) ( not ( = ?auto_93317 ?auto_93320 ) ) ( not ( = ?auto_93318 ?auto_93321 ) ) ( not ( = ?auto_93318 ?auto_93323 ) ) ( not ( = ?auto_93318 ?auto_93320 ) ) ( not ( = ?auto_93319 ?auto_93321 ) ) ( not ( = ?auto_93319 ?auto_93323 ) ) ( not ( = ?auto_93319 ?auto_93320 ) ) ( ON ?auto_93322 ?auto_93319 ) ( ON ?auto_93321 ?auto_93322 ) ( CLEAR ?auto_93321 ) ( HOLDING ?auto_93320 ) ( CLEAR ?auto_93323 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93323 ?auto_93320 )
      ( MAKE-2PILE ?auto_93316 ?auto_93317 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93324 - BLOCK
      ?auto_93325 - BLOCK
    )
    :vars
    (
      ?auto_93326 - BLOCK
      ?auto_93327 - BLOCK
      ?auto_93330 - BLOCK
      ?auto_93329 - BLOCK
      ?auto_93328 - BLOCK
      ?auto_93331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93326 ?auto_93325 ) ( ON-TABLE ?auto_93324 ) ( ON ?auto_93325 ?auto_93324 ) ( not ( = ?auto_93324 ?auto_93325 ) ) ( not ( = ?auto_93324 ?auto_93326 ) ) ( not ( = ?auto_93325 ?auto_93326 ) ) ( not ( = ?auto_93324 ?auto_93327 ) ) ( not ( = ?auto_93324 ?auto_93330 ) ) ( not ( = ?auto_93325 ?auto_93327 ) ) ( not ( = ?auto_93325 ?auto_93330 ) ) ( not ( = ?auto_93326 ?auto_93327 ) ) ( not ( = ?auto_93326 ?auto_93330 ) ) ( not ( = ?auto_93327 ?auto_93330 ) ) ( ON ?auto_93327 ?auto_93326 ) ( ON-TABLE ?auto_93329 ) ( not ( = ?auto_93329 ?auto_93328 ) ) ( not ( = ?auto_93329 ?auto_93331 ) ) ( not ( = ?auto_93329 ?auto_93330 ) ) ( not ( = ?auto_93328 ?auto_93331 ) ) ( not ( = ?auto_93328 ?auto_93330 ) ) ( not ( = ?auto_93331 ?auto_93330 ) ) ( not ( = ?auto_93324 ?auto_93331 ) ) ( not ( = ?auto_93324 ?auto_93329 ) ) ( not ( = ?auto_93324 ?auto_93328 ) ) ( not ( = ?auto_93325 ?auto_93331 ) ) ( not ( = ?auto_93325 ?auto_93329 ) ) ( not ( = ?auto_93325 ?auto_93328 ) ) ( not ( = ?auto_93326 ?auto_93331 ) ) ( not ( = ?auto_93326 ?auto_93329 ) ) ( not ( = ?auto_93326 ?auto_93328 ) ) ( not ( = ?auto_93327 ?auto_93331 ) ) ( not ( = ?auto_93327 ?auto_93329 ) ) ( not ( = ?auto_93327 ?auto_93328 ) ) ( ON ?auto_93330 ?auto_93327 ) ( ON ?auto_93331 ?auto_93330 ) ( CLEAR ?auto_93329 ) ( ON ?auto_93328 ?auto_93331 ) ( CLEAR ?auto_93328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93324 ?auto_93325 ?auto_93326 ?auto_93327 ?auto_93330 ?auto_93331 )
      ( MAKE-2PILE ?auto_93324 ?auto_93325 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93332 - BLOCK
      ?auto_93333 - BLOCK
    )
    :vars
    (
      ?auto_93334 - BLOCK
      ?auto_93338 - BLOCK
      ?auto_93339 - BLOCK
      ?auto_93335 - BLOCK
      ?auto_93337 - BLOCK
      ?auto_93336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93334 ?auto_93333 ) ( ON-TABLE ?auto_93332 ) ( ON ?auto_93333 ?auto_93332 ) ( not ( = ?auto_93332 ?auto_93333 ) ) ( not ( = ?auto_93332 ?auto_93334 ) ) ( not ( = ?auto_93333 ?auto_93334 ) ) ( not ( = ?auto_93332 ?auto_93338 ) ) ( not ( = ?auto_93332 ?auto_93339 ) ) ( not ( = ?auto_93333 ?auto_93338 ) ) ( not ( = ?auto_93333 ?auto_93339 ) ) ( not ( = ?auto_93334 ?auto_93338 ) ) ( not ( = ?auto_93334 ?auto_93339 ) ) ( not ( = ?auto_93338 ?auto_93339 ) ) ( ON ?auto_93338 ?auto_93334 ) ( not ( = ?auto_93335 ?auto_93337 ) ) ( not ( = ?auto_93335 ?auto_93336 ) ) ( not ( = ?auto_93335 ?auto_93339 ) ) ( not ( = ?auto_93337 ?auto_93336 ) ) ( not ( = ?auto_93337 ?auto_93339 ) ) ( not ( = ?auto_93336 ?auto_93339 ) ) ( not ( = ?auto_93332 ?auto_93336 ) ) ( not ( = ?auto_93332 ?auto_93335 ) ) ( not ( = ?auto_93332 ?auto_93337 ) ) ( not ( = ?auto_93333 ?auto_93336 ) ) ( not ( = ?auto_93333 ?auto_93335 ) ) ( not ( = ?auto_93333 ?auto_93337 ) ) ( not ( = ?auto_93334 ?auto_93336 ) ) ( not ( = ?auto_93334 ?auto_93335 ) ) ( not ( = ?auto_93334 ?auto_93337 ) ) ( not ( = ?auto_93338 ?auto_93336 ) ) ( not ( = ?auto_93338 ?auto_93335 ) ) ( not ( = ?auto_93338 ?auto_93337 ) ) ( ON ?auto_93339 ?auto_93338 ) ( ON ?auto_93336 ?auto_93339 ) ( ON ?auto_93337 ?auto_93336 ) ( CLEAR ?auto_93337 ) ( HOLDING ?auto_93335 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93335 )
      ( MAKE-2PILE ?auto_93332 ?auto_93333 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93340 - BLOCK
      ?auto_93341 - BLOCK
    )
    :vars
    (
      ?auto_93347 - BLOCK
      ?auto_93345 - BLOCK
      ?auto_93344 - BLOCK
      ?auto_93346 - BLOCK
      ?auto_93343 - BLOCK
      ?auto_93342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93347 ?auto_93341 ) ( ON-TABLE ?auto_93340 ) ( ON ?auto_93341 ?auto_93340 ) ( not ( = ?auto_93340 ?auto_93341 ) ) ( not ( = ?auto_93340 ?auto_93347 ) ) ( not ( = ?auto_93341 ?auto_93347 ) ) ( not ( = ?auto_93340 ?auto_93345 ) ) ( not ( = ?auto_93340 ?auto_93344 ) ) ( not ( = ?auto_93341 ?auto_93345 ) ) ( not ( = ?auto_93341 ?auto_93344 ) ) ( not ( = ?auto_93347 ?auto_93345 ) ) ( not ( = ?auto_93347 ?auto_93344 ) ) ( not ( = ?auto_93345 ?auto_93344 ) ) ( ON ?auto_93345 ?auto_93347 ) ( not ( = ?auto_93346 ?auto_93343 ) ) ( not ( = ?auto_93346 ?auto_93342 ) ) ( not ( = ?auto_93346 ?auto_93344 ) ) ( not ( = ?auto_93343 ?auto_93342 ) ) ( not ( = ?auto_93343 ?auto_93344 ) ) ( not ( = ?auto_93342 ?auto_93344 ) ) ( not ( = ?auto_93340 ?auto_93342 ) ) ( not ( = ?auto_93340 ?auto_93346 ) ) ( not ( = ?auto_93340 ?auto_93343 ) ) ( not ( = ?auto_93341 ?auto_93342 ) ) ( not ( = ?auto_93341 ?auto_93346 ) ) ( not ( = ?auto_93341 ?auto_93343 ) ) ( not ( = ?auto_93347 ?auto_93342 ) ) ( not ( = ?auto_93347 ?auto_93346 ) ) ( not ( = ?auto_93347 ?auto_93343 ) ) ( not ( = ?auto_93345 ?auto_93342 ) ) ( not ( = ?auto_93345 ?auto_93346 ) ) ( not ( = ?auto_93345 ?auto_93343 ) ) ( ON ?auto_93344 ?auto_93345 ) ( ON ?auto_93342 ?auto_93344 ) ( ON ?auto_93343 ?auto_93342 ) ( ON ?auto_93346 ?auto_93343 ) ( CLEAR ?auto_93346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93340 ?auto_93341 ?auto_93347 ?auto_93345 ?auto_93344 ?auto_93342 ?auto_93343 )
      ( MAKE-2PILE ?auto_93340 ?auto_93341 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93354 - BLOCK
      ?auto_93355 - BLOCK
      ?auto_93356 - BLOCK
      ?auto_93357 - BLOCK
      ?auto_93358 - BLOCK
      ?auto_93359 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_93359 ) ( CLEAR ?auto_93358 ) ( ON-TABLE ?auto_93354 ) ( ON ?auto_93355 ?auto_93354 ) ( ON ?auto_93356 ?auto_93355 ) ( ON ?auto_93357 ?auto_93356 ) ( ON ?auto_93358 ?auto_93357 ) ( not ( = ?auto_93354 ?auto_93355 ) ) ( not ( = ?auto_93354 ?auto_93356 ) ) ( not ( = ?auto_93354 ?auto_93357 ) ) ( not ( = ?auto_93354 ?auto_93358 ) ) ( not ( = ?auto_93354 ?auto_93359 ) ) ( not ( = ?auto_93355 ?auto_93356 ) ) ( not ( = ?auto_93355 ?auto_93357 ) ) ( not ( = ?auto_93355 ?auto_93358 ) ) ( not ( = ?auto_93355 ?auto_93359 ) ) ( not ( = ?auto_93356 ?auto_93357 ) ) ( not ( = ?auto_93356 ?auto_93358 ) ) ( not ( = ?auto_93356 ?auto_93359 ) ) ( not ( = ?auto_93357 ?auto_93358 ) ) ( not ( = ?auto_93357 ?auto_93359 ) ) ( not ( = ?auto_93358 ?auto_93359 ) ) )
    :subtasks
    ( ( !STACK ?auto_93359 ?auto_93358 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93360 - BLOCK
      ?auto_93361 - BLOCK
      ?auto_93362 - BLOCK
      ?auto_93363 - BLOCK
      ?auto_93364 - BLOCK
      ?auto_93365 - BLOCK
    )
    :vars
    (
      ?auto_93366 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93364 ) ( ON-TABLE ?auto_93360 ) ( ON ?auto_93361 ?auto_93360 ) ( ON ?auto_93362 ?auto_93361 ) ( ON ?auto_93363 ?auto_93362 ) ( ON ?auto_93364 ?auto_93363 ) ( not ( = ?auto_93360 ?auto_93361 ) ) ( not ( = ?auto_93360 ?auto_93362 ) ) ( not ( = ?auto_93360 ?auto_93363 ) ) ( not ( = ?auto_93360 ?auto_93364 ) ) ( not ( = ?auto_93360 ?auto_93365 ) ) ( not ( = ?auto_93361 ?auto_93362 ) ) ( not ( = ?auto_93361 ?auto_93363 ) ) ( not ( = ?auto_93361 ?auto_93364 ) ) ( not ( = ?auto_93361 ?auto_93365 ) ) ( not ( = ?auto_93362 ?auto_93363 ) ) ( not ( = ?auto_93362 ?auto_93364 ) ) ( not ( = ?auto_93362 ?auto_93365 ) ) ( not ( = ?auto_93363 ?auto_93364 ) ) ( not ( = ?auto_93363 ?auto_93365 ) ) ( not ( = ?auto_93364 ?auto_93365 ) ) ( ON ?auto_93365 ?auto_93366 ) ( CLEAR ?auto_93365 ) ( HAND-EMPTY ) ( not ( = ?auto_93360 ?auto_93366 ) ) ( not ( = ?auto_93361 ?auto_93366 ) ) ( not ( = ?auto_93362 ?auto_93366 ) ) ( not ( = ?auto_93363 ?auto_93366 ) ) ( not ( = ?auto_93364 ?auto_93366 ) ) ( not ( = ?auto_93365 ?auto_93366 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93365 ?auto_93366 )
      ( MAKE-6PILE ?auto_93360 ?auto_93361 ?auto_93362 ?auto_93363 ?auto_93364 ?auto_93365 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93367 - BLOCK
      ?auto_93368 - BLOCK
      ?auto_93369 - BLOCK
      ?auto_93370 - BLOCK
      ?auto_93371 - BLOCK
      ?auto_93372 - BLOCK
    )
    :vars
    (
      ?auto_93373 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93367 ) ( ON ?auto_93368 ?auto_93367 ) ( ON ?auto_93369 ?auto_93368 ) ( ON ?auto_93370 ?auto_93369 ) ( not ( = ?auto_93367 ?auto_93368 ) ) ( not ( = ?auto_93367 ?auto_93369 ) ) ( not ( = ?auto_93367 ?auto_93370 ) ) ( not ( = ?auto_93367 ?auto_93371 ) ) ( not ( = ?auto_93367 ?auto_93372 ) ) ( not ( = ?auto_93368 ?auto_93369 ) ) ( not ( = ?auto_93368 ?auto_93370 ) ) ( not ( = ?auto_93368 ?auto_93371 ) ) ( not ( = ?auto_93368 ?auto_93372 ) ) ( not ( = ?auto_93369 ?auto_93370 ) ) ( not ( = ?auto_93369 ?auto_93371 ) ) ( not ( = ?auto_93369 ?auto_93372 ) ) ( not ( = ?auto_93370 ?auto_93371 ) ) ( not ( = ?auto_93370 ?auto_93372 ) ) ( not ( = ?auto_93371 ?auto_93372 ) ) ( ON ?auto_93372 ?auto_93373 ) ( CLEAR ?auto_93372 ) ( not ( = ?auto_93367 ?auto_93373 ) ) ( not ( = ?auto_93368 ?auto_93373 ) ) ( not ( = ?auto_93369 ?auto_93373 ) ) ( not ( = ?auto_93370 ?auto_93373 ) ) ( not ( = ?auto_93371 ?auto_93373 ) ) ( not ( = ?auto_93372 ?auto_93373 ) ) ( HOLDING ?auto_93371 ) ( CLEAR ?auto_93370 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93367 ?auto_93368 ?auto_93369 ?auto_93370 ?auto_93371 )
      ( MAKE-6PILE ?auto_93367 ?auto_93368 ?auto_93369 ?auto_93370 ?auto_93371 ?auto_93372 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93374 - BLOCK
      ?auto_93375 - BLOCK
      ?auto_93376 - BLOCK
      ?auto_93377 - BLOCK
      ?auto_93378 - BLOCK
      ?auto_93379 - BLOCK
    )
    :vars
    (
      ?auto_93380 - BLOCK
      ?auto_93381 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93374 ) ( ON ?auto_93375 ?auto_93374 ) ( ON ?auto_93376 ?auto_93375 ) ( ON ?auto_93377 ?auto_93376 ) ( not ( = ?auto_93374 ?auto_93375 ) ) ( not ( = ?auto_93374 ?auto_93376 ) ) ( not ( = ?auto_93374 ?auto_93377 ) ) ( not ( = ?auto_93374 ?auto_93378 ) ) ( not ( = ?auto_93374 ?auto_93379 ) ) ( not ( = ?auto_93375 ?auto_93376 ) ) ( not ( = ?auto_93375 ?auto_93377 ) ) ( not ( = ?auto_93375 ?auto_93378 ) ) ( not ( = ?auto_93375 ?auto_93379 ) ) ( not ( = ?auto_93376 ?auto_93377 ) ) ( not ( = ?auto_93376 ?auto_93378 ) ) ( not ( = ?auto_93376 ?auto_93379 ) ) ( not ( = ?auto_93377 ?auto_93378 ) ) ( not ( = ?auto_93377 ?auto_93379 ) ) ( not ( = ?auto_93378 ?auto_93379 ) ) ( ON ?auto_93379 ?auto_93380 ) ( not ( = ?auto_93374 ?auto_93380 ) ) ( not ( = ?auto_93375 ?auto_93380 ) ) ( not ( = ?auto_93376 ?auto_93380 ) ) ( not ( = ?auto_93377 ?auto_93380 ) ) ( not ( = ?auto_93378 ?auto_93380 ) ) ( not ( = ?auto_93379 ?auto_93380 ) ) ( CLEAR ?auto_93377 ) ( ON ?auto_93378 ?auto_93379 ) ( CLEAR ?auto_93378 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93381 ) ( ON ?auto_93380 ?auto_93381 ) ( not ( = ?auto_93381 ?auto_93380 ) ) ( not ( = ?auto_93381 ?auto_93379 ) ) ( not ( = ?auto_93381 ?auto_93378 ) ) ( not ( = ?auto_93374 ?auto_93381 ) ) ( not ( = ?auto_93375 ?auto_93381 ) ) ( not ( = ?auto_93376 ?auto_93381 ) ) ( not ( = ?auto_93377 ?auto_93381 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93381 ?auto_93380 ?auto_93379 )
      ( MAKE-6PILE ?auto_93374 ?auto_93375 ?auto_93376 ?auto_93377 ?auto_93378 ?auto_93379 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93382 - BLOCK
      ?auto_93383 - BLOCK
      ?auto_93384 - BLOCK
      ?auto_93385 - BLOCK
      ?auto_93386 - BLOCK
      ?auto_93387 - BLOCK
    )
    :vars
    (
      ?auto_93388 - BLOCK
      ?auto_93389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93382 ) ( ON ?auto_93383 ?auto_93382 ) ( ON ?auto_93384 ?auto_93383 ) ( not ( = ?auto_93382 ?auto_93383 ) ) ( not ( = ?auto_93382 ?auto_93384 ) ) ( not ( = ?auto_93382 ?auto_93385 ) ) ( not ( = ?auto_93382 ?auto_93386 ) ) ( not ( = ?auto_93382 ?auto_93387 ) ) ( not ( = ?auto_93383 ?auto_93384 ) ) ( not ( = ?auto_93383 ?auto_93385 ) ) ( not ( = ?auto_93383 ?auto_93386 ) ) ( not ( = ?auto_93383 ?auto_93387 ) ) ( not ( = ?auto_93384 ?auto_93385 ) ) ( not ( = ?auto_93384 ?auto_93386 ) ) ( not ( = ?auto_93384 ?auto_93387 ) ) ( not ( = ?auto_93385 ?auto_93386 ) ) ( not ( = ?auto_93385 ?auto_93387 ) ) ( not ( = ?auto_93386 ?auto_93387 ) ) ( ON ?auto_93387 ?auto_93388 ) ( not ( = ?auto_93382 ?auto_93388 ) ) ( not ( = ?auto_93383 ?auto_93388 ) ) ( not ( = ?auto_93384 ?auto_93388 ) ) ( not ( = ?auto_93385 ?auto_93388 ) ) ( not ( = ?auto_93386 ?auto_93388 ) ) ( not ( = ?auto_93387 ?auto_93388 ) ) ( ON ?auto_93386 ?auto_93387 ) ( CLEAR ?auto_93386 ) ( ON-TABLE ?auto_93389 ) ( ON ?auto_93388 ?auto_93389 ) ( not ( = ?auto_93389 ?auto_93388 ) ) ( not ( = ?auto_93389 ?auto_93387 ) ) ( not ( = ?auto_93389 ?auto_93386 ) ) ( not ( = ?auto_93382 ?auto_93389 ) ) ( not ( = ?auto_93383 ?auto_93389 ) ) ( not ( = ?auto_93384 ?auto_93389 ) ) ( not ( = ?auto_93385 ?auto_93389 ) ) ( HOLDING ?auto_93385 ) ( CLEAR ?auto_93384 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93382 ?auto_93383 ?auto_93384 ?auto_93385 )
      ( MAKE-6PILE ?auto_93382 ?auto_93383 ?auto_93384 ?auto_93385 ?auto_93386 ?auto_93387 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93390 - BLOCK
      ?auto_93391 - BLOCK
      ?auto_93392 - BLOCK
      ?auto_93393 - BLOCK
      ?auto_93394 - BLOCK
      ?auto_93395 - BLOCK
    )
    :vars
    (
      ?auto_93396 - BLOCK
      ?auto_93397 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93390 ) ( ON ?auto_93391 ?auto_93390 ) ( ON ?auto_93392 ?auto_93391 ) ( not ( = ?auto_93390 ?auto_93391 ) ) ( not ( = ?auto_93390 ?auto_93392 ) ) ( not ( = ?auto_93390 ?auto_93393 ) ) ( not ( = ?auto_93390 ?auto_93394 ) ) ( not ( = ?auto_93390 ?auto_93395 ) ) ( not ( = ?auto_93391 ?auto_93392 ) ) ( not ( = ?auto_93391 ?auto_93393 ) ) ( not ( = ?auto_93391 ?auto_93394 ) ) ( not ( = ?auto_93391 ?auto_93395 ) ) ( not ( = ?auto_93392 ?auto_93393 ) ) ( not ( = ?auto_93392 ?auto_93394 ) ) ( not ( = ?auto_93392 ?auto_93395 ) ) ( not ( = ?auto_93393 ?auto_93394 ) ) ( not ( = ?auto_93393 ?auto_93395 ) ) ( not ( = ?auto_93394 ?auto_93395 ) ) ( ON ?auto_93395 ?auto_93396 ) ( not ( = ?auto_93390 ?auto_93396 ) ) ( not ( = ?auto_93391 ?auto_93396 ) ) ( not ( = ?auto_93392 ?auto_93396 ) ) ( not ( = ?auto_93393 ?auto_93396 ) ) ( not ( = ?auto_93394 ?auto_93396 ) ) ( not ( = ?auto_93395 ?auto_93396 ) ) ( ON ?auto_93394 ?auto_93395 ) ( ON-TABLE ?auto_93397 ) ( ON ?auto_93396 ?auto_93397 ) ( not ( = ?auto_93397 ?auto_93396 ) ) ( not ( = ?auto_93397 ?auto_93395 ) ) ( not ( = ?auto_93397 ?auto_93394 ) ) ( not ( = ?auto_93390 ?auto_93397 ) ) ( not ( = ?auto_93391 ?auto_93397 ) ) ( not ( = ?auto_93392 ?auto_93397 ) ) ( not ( = ?auto_93393 ?auto_93397 ) ) ( CLEAR ?auto_93392 ) ( ON ?auto_93393 ?auto_93394 ) ( CLEAR ?auto_93393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93397 ?auto_93396 ?auto_93395 ?auto_93394 )
      ( MAKE-6PILE ?auto_93390 ?auto_93391 ?auto_93392 ?auto_93393 ?auto_93394 ?auto_93395 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93398 - BLOCK
      ?auto_93399 - BLOCK
      ?auto_93400 - BLOCK
      ?auto_93401 - BLOCK
      ?auto_93402 - BLOCK
      ?auto_93403 - BLOCK
    )
    :vars
    (
      ?auto_93404 - BLOCK
      ?auto_93405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93398 ) ( ON ?auto_93399 ?auto_93398 ) ( not ( = ?auto_93398 ?auto_93399 ) ) ( not ( = ?auto_93398 ?auto_93400 ) ) ( not ( = ?auto_93398 ?auto_93401 ) ) ( not ( = ?auto_93398 ?auto_93402 ) ) ( not ( = ?auto_93398 ?auto_93403 ) ) ( not ( = ?auto_93399 ?auto_93400 ) ) ( not ( = ?auto_93399 ?auto_93401 ) ) ( not ( = ?auto_93399 ?auto_93402 ) ) ( not ( = ?auto_93399 ?auto_93403 ) ) ( not ( = ?auto_93400 ?auto_93401 ) ) ( not ( = ?auto_93400 ?auto_93402 ) ) ( not ( = ?auto_93400 ?auto_93403 ) ) ( not ( = ?auto_93401 ?auto_93402 ) ) ( not ( = ?auto_93401 ?auto_93403 ) ) ( not ( = ?auto_93402 ?auto_93403 ) ) ( ON ?auto_93403 ?auto_93404 ) ( not ( = ?auto_93398 ?auto_93404 ) ) ( not ( = ?auto_93399 ?auto_93404 ) ) ( not ( = ?auto_93400 ?auto_93404 ) ) ( not ( = ?auto_93401 ?auto_93404 ) ) ( not ( = ?auto_93402 ?auto_93404 ) ) ( not ( = ?auto_93403 ?auto_93404 ) ) ( ON ?auto_93402 ?auto_93403 ) ( ON-TABLE ?auto_93405 ) ( ON ?auto_93404 ?auto_93405 ) ( not ( = ?auto_93405 ?auto_93404 ) ) ( not ( = ?auto_93405 ?auto_93403 ) ) ( not ( = ?auto_93405 ?auto_93402 ) ) ( not ( = ?auto_93398 ?auto_93405 ) ) ( not ( = ?auto_93399 ?auto_93405 ) ) ( not ( = ?auto_93400 ?auto_93405 ) ) ( not ( = ?auto_93401 ?auto_93405 ) ) ( ON ?auto_93401 ?auto_93402 ) ( CLEAR ?auto_93401 ) ( HOLDING ?auto_93400 ) ( CLEAR ?auto_93399 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93398 ?auto_93399 ?auto_93400 )
      ( MAKE-6PILE ?auto_93398 ?auto_93399 ?auto_93400 ?auto_93401 ?auto_93402 ?auto_93403 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93406 - BLOCK
      ?auto_93407 - BLOCK
      ?auto_93408 - BLOCK
      ?auto_93409 - BLOCK
      ?auto_93410 - BLOCK
      ?auto_93411 - BLOCK
    )
    :vars
    (
      ?auto_93412 - BLOCK
      ?auto_93413 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93406 ) ( ON ?auto_93407 ?auto_93406 ) ( not ( = ?auto_93406 ?auto_93407 ) ) ( not ( = ?auto_93406 ?auto_93408 ) ) ( not ( = ?auto_93406 ?auto_93409 ) ) ( not ( = ?auto_93406 ?auto_93410 ) ) ( not ( = ?auto_93406 ?auto_93411 ) ) ( not ( = ?auto_93407 ?auto_93408 ) ) ( not ( = ?auto_93407 ?auto_93409 ) ) ( not ( = ?auto_93407 ?auto_93410 ) ) ( not ( = ?auto_93407 ?auto_93411 ) ) ( not ( = ?auto_93408 ?auto_93409 ) ) ( not ( = ?auto_93408 ?auto_93410 ) ) ( not ( = ?auto_93408 ?auto_93411 ) ) ( not ( = ?auto_93409 ?auto_93410 ) ) ( not ( = ?auto_93409 ?auto_93411 ) ) ( not ( = ?auto_93410 ?auto_93411 ) ) ( ON ?auto_93411 ?auto_93412 ) ( not ( = ?auto_93406 ?auto_93412 ) ) ( not ( = ?auto_93407 ?auto_93412 ) ) ( not ( = ?auto_93408 ?auto_93412 ) ) ( not ( = ?auto_93409 ?auto_93412 ) ) ( not ( = ?auto_93410 ?auto_93412 ) ) ( not ( = ?auto_93411 ?auto_93412 ) ) ( ON ?auto_93410 ?auto_93411 ) ( ON-TABLE ?auto_93413 ) ( ON ?auto_93412 ?auto_93413 ) ( not ( = ?auto_93413 ?auto_93412 ) ) ( not ( = ?auto_93413 ?auto_93411 ) ) ( not ( = ?auto_93413 ?auto_93410 ) ) ( not ( = ?auto_93406 ?auto_93413 ) ) ( not ( = ?auto_93407 ?auto_93413 ) ) ( not ( = ?auto_93408 ?auto_93413 ) ) ( not ( = ?auto_93409 ?auto_93413 ) ) ( ON ?auto_93409 ?auto_93410 ) ( CLEAR ?auto_93407 ) ( ON ?auto_93408 ?auto_93409 ) ( CLEAR ?auto_93408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93413 ?auto_93412 ?auto_93411 ?auto_93410 ?auto_93409 )
      ( MAKE-6PILE ?auto_93406 ?auto_93407 ?auto_93408 ?auto_93409 ?auto_93410 ?auto_93411 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93414 - BLOCK
      ?auto_93415 - BLOCK
      ?auto_93416 - BLOCK
      ?auto_93417 - BLOCK
      ?auto_93418 - BLOCK
      ?auto_93419 - BLOCK
    )
    :vars
    (
      ?auto_93421 - BLOCK
      ?auto_93420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93414 ) ( not ( = ?auto_93414 ?auto_93415 ) ) ( not ( = ?auto_93414 ?auto_93416 ) ) ( not ( = ?auto_93414 ?auto_93417 ) ) ( not ( = ?auto_93414 ?auto_93418 ) ) ( not ( = ?auto_93414 ?auto_93419 ) ) ( not ( = ?auto_93415 ?auto_93416 ) ) ( not ( = ?auto_93415 ?auto_93417 ) ) ( not ( = ?auto_93415 ?auto_93418 ) ) ( not ( = ?auto_93415 ?auto_93419 ) ) ( not ( = ?auto_93416 ?auto_93417 ) ) ( not ( = ?auto_93416 ?auto_93418 ) ) ( not ( = ?auto_93416 ?auto_93419 ) ) ( not ( = ?auto_93417 ?auto_93418 ) ) ( not ( = ?auto_93417 ?auto_93419 ) ) ( not ( = ?auto_93418 ?auto_93419 ) ) ( ON ?auto_93419 ?auto_93421 ) ( not ( = ?auto_93414 ?auto_93421 ) ) ( not ( = ?auto_93415 ?auto_93421 ) ) ( not ( = ?auto_93416 ?auto_93421 ) ) ( not ( = ?auto_93417 ?auto_93421 ) ) ( not ( = ?auto_93418 ?auto_93421 ) ) ( not ( = ?auto_93419 ?auto_93421 ) ) ( ON ?auto_93418 ?auto_93419 ) ( ON-TABLE ?auto_93420 ) ( ON ?auto_93421 ?auto_93420 ) ( not ( = ?auto_93420 ?auto_93421 ) ) ( not ( = ?auto_93420 ?auto_93419 ) ) ( not ( = ?auto_93420 ?auto_93418 ) ) ( not ( = ?auto_93414 ?auto_93420 ) ) ( not ( = ?auto_93415 ?auto_93420 ) ) ( not ( = ?auto_93416 ?auto_93420 ) ) ( not ( = ?auto_93417 ?auto_93420 ) ) ( ON ?auto_93417 ?auto_93418 ) ( ON ?auto_93416 ?auto_93417 ) ( CLEAR ?auto_93416 ) ( HOLDING ?auto_93415 ) ( CLEAR ?auto_93414 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93414 ?auto_93415 )
      ( MAKE-6PILE ?auto_93414 ?auto_93415 ?auto_93416 ?auto_93417 ?auto_93418 ?auto_93419 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93422 - BLOCK
      ?auto_93423 - BLOCK
      ?auto_93424 - BLOCK
      ?auto_93425 - BLOCK
      ?auto_93426 - BLOCK
      ?auto_93427 - BLOCK
    )
    :vars
    (
      ?auto_93428 - BLOCK
      ?auto_93429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93422 ) ( not ( = ?auto_93422 ?auto_93423 ) ) ( not ( = ?auto_93422 ?auto_93424 ) ) ( not ( = ?auto_93422 ?auto_93425 ) ) ( not ( = ?auto_93422 ?auto_93426 ) ) ( not ( = ?auto_93422 ?auto_93427 ) ) ( not ( = ?auto_93423 ?auto_93424 ) ) ( not ( = ?auto_93423 ?auto_93425 ) ) ( not ( = ?auto_93423 ?auto_93426 ) ) ( not ( = ?auto_93423 ?auto_93427 ) ) ( not ( = ?auto_93424 ?auto_93425 ) ) ( not ( = ?auto_93424 ?auto_93426 ) ) ( not ( = ?auto_93424 ?auto_93427 ) ) ( not ( = ?auto_93425 ?auto_93426 ) ) ( not ( = ?auto_93425 ?auto_93427 ) ) ( not ( = ?auto_93426 ?auto_93427 ) ) ( ON ?auto_93427 ?auto_93428 ) ( not ( = ?auto_93422 ?auto_93428 ) ) ( not ( = ?auto_93423 ?auto_93428 ) ) ( not ( = ?auto_93424 ?auto_93428 ) ) ( not ( = ?auto_93425 ?auto_93428 ) ) ( not ( = ?auto_93426 ?auto_93428 ) ) ( not ( = ?auto_93427 ?auto_93428 ) ) ( ON ?auto_93426 ?auto_93427 ) ( ON-TABLE ?auto_93429 ) ( ON ?auto_93428 ?auto_93429 ) ( not ( = ?auto_93429 ?auto_93428 ) ) ( not ( = ?auto_93429 ?auto_93427 ) ) ( not ( = ?auto_93429 ?auto_93426 ) ) ( not ( = ?auto_93422 ?auto_93429 ) ) ( not ( = ?auto_93423 ?auto_93429 ) ) ( not ( = ?auto_93424 ?auto_93429 ) ) ( not ( = ?auto_93425 ?auto_93429 ) ) ( ON ?auto_93425 ?auto_93426 ) ( ON ?auto_93424 ?auto_93425 ) ( CLEAR ?auto_93422 ) ( ON ?auto_93423 ?auto_93424 ) ( CLEAR ?auto_93423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93429 ?auto_93428 ?auto_93427 ?auto_93426 ?auto_93425 ?auto_93424 )
      ( MAKE-6PILE ?auto_93422 ?auto_93423 ?auto_93424 ?auto_93425 ?auto_93426 ?auto_93427 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93430 - BLOCK
      ?auto_93431 - BLOCK
      ?auto_93432 - BLOCK
      ?auto_93433 - BLOCK
      ?auto_93434 - BLOCK
      ?auto_93435 - BLOCK
    )
    :vars
    (
      ?auto_93437 - BLOCK
      ?auto_93436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93430 ?auto_93431 ) ) ( not ( = ?auto_93430 ?auto_93432 ) ) ( not ( = ?auto_93430 ?auto_93433 ) ) ( not ( = ?auto_93430 ?auto_93434 ) ) ( not ( = ?auto_93430 ?auto_93435 ) ) ( not ( = ?auto_93431 ?auto_93432 ) ) ( not ( = ?auto_93431 ?auto_93433 ) ) ( not ( = ?auto_93431 ?auto_93434 ) ) ( not ( = ?auto_93431 ?auto_93435 ) ) ( not ( = ?auto_93432 ?auto_93433 ) ) ( not ( = ?auto_93432 ?auto_93434 ) ) ( not ( = ?auto_93432 ?auto_93435 ) ) ( not ( = ?auto_93433 ?auto_93434 ) ) ( not ( = ?auto_93433 ?auto_93435 ) ) ( not ( = ?auto_93434 ?auto_93435 ) ) ( ON ?auto_93435 ?auto_93437 ) ( not ( = ?auto_93430 ?auto_93437 ) ) ( not ( = ?auto_93431 ?auto_93437 ) ) ( not ( = ?auto_93432 ?auto_93437 ) ) ( not ( = ?auto_93433 ?auto_93437 ) ) ( not ( = ?auto_93434 ?auto_93437 ) ) ( not ( = ?auto_93435 ?auto_93437 ) ) ( ON ?auto_93434 ?auto_93435 ) ( ON-TABLE ?auto_93436 ) ( ON ?auto_93437 ?auto_93436 ) ( not ( = ?auto_93436 ?auto_93437 ) ) ( not ( = ?auto_93436 ?auto_93435 ) ) ( not ( = ?auto_93436 ?auto_93434 ) ) ( not ( = ?auto_93430 ?auto_93436 ) ) ( not ( = ?auto_93431 ?auto_93436 ) ) ( not ( = ?auto_93432 ?auto_93436 ) ) ( not ( = ?auto_93433 ?auto_93436 ) ) ( ON ?auto_93433 ?auto_93434 ) ( ON ?auto_93432 ?auto_93433 ) ( ON ?auto_93431 ?auto_93432 ) ( CLEAR ?auto_93431 ) ( HOLDING ?auto_93430 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93430 )
      ( MAKE-6PILE ?auto_93430 ?auto_93431 ?auto_93432 ?auto_93433 ?auto_93434 ?auto_93435 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93438 - BLOCK
      ?auto_93439 - BLOCK
      ?auto_93440 - BLOCK
      ?auto_93441 - BLOCK
      ?auto_93442 - BLOCK
      ?auto_93443 - BLOCK
    )
    :vars
    (
      ?auto_93444 - BLOCK
      ?auto_93445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93438 ?auto_93439 ) ) ( not ( = ?auto_93438 ?auto_93440 ) ) ( not ( = ?auto_93438 ?auto_93441 ) ) ( not ( = ?auto_93438 ?auto_93442 ) ) ( not ( = ?auto_93438 ?auto_93443 ) ) ( not ( = ?auto_93439 ?auto_93440 ) ) ( not ( = ?auto_93439 ?auto_93441 ) ) ( not ( = ?auto_93439 ?auto_93442 ) ) ( not ( = ?auto_93439 ?auto_93443 ) ) ( not ( = ?auto_93440 ?auto_93441 ) ) ( not ( = ?auto_93440 ?auto_93442 ) ) ( not ( = ?auto_93440 ?auto_93443 ) ) ( not ( = ?auto_93441 ?auto_93442 ) ) ( not ( = ?auto_93441 ?auto_93443 ) ) ( not ( = ?auto_93442 ?auto_93443 ) ) ( ON ?auto_93443 ?auto_93444 ) ( not ( = ?auto_93438 ?auto_93444 ) ) ( not ( = ?auto_93439 ?auto_93444 ) ) ( not ( = ?auto_93440 ?auto_93444 ) ) ( not ( = ?auto_93441 ?auto_93444 ) ) ( not ( = ?auto_93442 ?auto_93444 ) ) ( not ( = ?auto_93443 ?auto_93444 ) ) ( ON ?auto_93442 ?auto_93443 ) ( ON-TABLE ?auto_93445 ) ( ON ?auto_93444 ?auto_93445 ) ( not ( = ?auto_93445 ?auto_93444 ) ) ( not ( = ?auto_93445 ?auto_93443 ) ) ( not ( = ?auto_93445 ?auto_93442 ) ) ( not ( = ?auto_93438 ?auto_93445 ) ) ( not ( = ?auto_93439 ?auto_93445 ) ) ( not ( = ?auto_93440 ?auto_93445 ) ) ( not ( = ?auto_93441 ?auto_93445 ) ) ( ON ?auto_93441 ?auto_93442 ) ( ON ?auto_93440 ?auto_93441 ) ( ON ?auto_93439 ?auto_93440 ) ( ON ?auto_93438 ?auto_93439 ) ( CLEAR ?auto_93438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93445 ?auto_93444 ?auto_93443 ?auto_93442 ?auto_93441 ?auto_93440 ?auto_93439 )
      ( MAKE-6PILE ?auto_93438 ?auto_93439 ?auto_93440 ?auto_93441 ?auto_93442 ?auto_93443 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93447 - BLOCK
    )
    :vars
    (
      ?auto_93448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93448 ?auto_93447 ) ( CLEAR ?auto_93448 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93447 ) ( not ( = ?auto_93447 ?auto_93448 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93448 ?auto_93447 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93449 - BLOCK
    )
    :vars
    (
      ?auto_93450 - BLOCK
      ?auto_93451 - BLOCK
      ?auto_93452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93450 ?auto_93449 ) ( CLEAR ?auto_93450 ) ( ON-TABLE ?auto_93449 ) ( not ( = ?auto_93449 ?auto_93450 ) ) ( HOLDING ?auto_93451 ) ( CLEAR ?auto_93452 ) ( not ( = ?auto_93449 ?auto_93451 ) ) ( not ( = ?auto_93449 ?auto_93452 ) ) ( not ( = ?auto_93450 ?auto_93451 ) ) ( not ( = ?auto_93450 ?auto_93452 ) ) ( not ( = ?auto_93451 ?auto_93452 ) ) )
    :subtasks
    ( ( !STACK ?auto_93451 ?auto_93452 )
      ( MAKE-1PILE ?auto_93449 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93453 - BLOCK
    )
    :vars
    (
      ?auto_93456 - BLOCK
      ?auto_93454 - BLOCK
      ?auto_93455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93456 ?auto_93453 ) ( ON-TABLE ?auto_93453 ) ( not ( = ?auto_93453 ?auto_93456 ) ) ( CLEAR ?auto_93454 ) ( not ( = ?auto_93453 ?auto_93455 ) ) ( not ( = ?auto_93453 ?auto_93454 ) ) ( not ( = ?auto_93456 ?auto_93455 ) ) ( not ( = ?auto_93456 ?auto_93454 ) ) ( not ( = ?auto_93455 ?auto_93454 ) ) ( ON ?auto_93455 ?auto_93456 ) ( CLEAR ?auto_93455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93453 ?auto_93456 )
      ( MAKE-1PILE ?auto_93453 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93457 - BLOCK
    )
    :vars
    (
      ?auto_93458 - BLOCK
      ?auto_93460 - BLOCK
      ?auto_93459 - BLOCK
      ?auto_93461 - BLOCK
      ?auto_93464 - BLOCK
      ?auto_93463 - BLOCK
      ?auto_93462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93458 ?auto_93457 ) ( ON-TABLE ?auto_93457 ) ( not ( = ?auto_93457 ?auto_93458 ) ) ( not ( = ?auto_93457 ?auto_93460 ) ) ( not ( = ?auto_93457 ?auto_93459 ) ) ( not ( = ?auto_93458 ?auto_93460 ) ) ( not ( = ?auto_93458 ?auto_93459 ) ) ( not ( = ?auto_93460 ?auto_93459 ) ) ( ON ?auto_93460 ?auto_93458 ) ( CLEAR ?auto_93460 ) ( HOLDING ?auto_93459 ) ( CLEAR ?auto_93461 ) ( ON-TABLE ?auto_93464 ) ( ON ?auto_93463 ?auto_93464 ) ( ON ?auto_93462 ?auto_93463 ) ( ON ?auto_93461 ?auto_93462 ) ( not ( = ?auto_93464 ?auto_93463 ) ) ( not ( = ?auto_93464 ?auto_93462 ) ) ( not ( = ?auto_93464 ?auto_93461 ) ) ( not ( = ?auto_93464 ?auto_93459 ) ) ( not ( = ?auto_93463 ?auto_93462 ) ) ( not ( = ?auto_93463 ?auto_93461 ) ) ( not ( = ?auto_93463 ?auto_93459 ) ) ( not ( = ?auto_93462 ?auto_93461 ) ) ( not ( = ?auto_93462 ?auto_93459 ) ) ( not ( = ?auto_93461 ?auto_93459 ) ) ( not ( = ?auto_93457 ?auto_93461 ) ) ( not ( = ?auto_93457 ?auto_93464 ) ) ( not ( = ?auto_93457 ?auto_93463 ) ) ( not ( = ?auto_93457 ?auto_93462 ) ) ( not ( = ?auto_93458 ?auto_93461 ) ) ( not ( = ?auto_93458 ?auto_93464 ) ) ( not ( = ?auto_93458 ?auto_93463 ) ) ( not ( = ?auto_93458 ?auto_93462 ) ) ( not ( = ?auto_93460 ?auto_93461 ) ) ( not ( = ?auto_93460 ?auto_93464 ) ) ( not ( = ?auto_93460 ?auto_93463 ) ) ( not ( = ?auto_93460 ?auto_93462 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93464 ?auto_93463 ?auto_93462 ?auto_93461 ?auto_93459 )
      ( MAKE-1PILE ?auto_93457 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93465 - BLOCK
    )
    :vars
    (
      ?auto_93470 - BLOCK
      ?auto_93472 - BLOCK
      ?auto_93468 - BLOCK
      ?auto_93471 - BLOCK
      ?auto_93466 - BLOCK
      ?auto_93469 - BLOCK
      ?auto_93467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93470 ?auto_93465 ) ( ON-TABLE ?auto_93465 ) ( not ( = ?auto_93465 ?auto_93470 ) ) ( not ( = ?auto_93465 ?auto_93472 ) ) ( not ( = ?auto_93465 ?auto_93468 ) ) ( not ( = ?auto_93470 ?auto_93472 ) ) ( not ( = ?auto_93470 ?auto_93468 ) ) ( not ( = ?auto_93472 ?auto_93468 ) ) ( ON ?auto_93472 ?auto_93470 ) ( CLEAR ?auto_93471 ) ( ON-TABLE ?auto_93466 ) ( ON ?auto_93469 ?auto_93466 ) ( ON ?auto_93467 ?auto_93469 ) ( ON ?auto_93471 ?auto_93467 ) ( not ( = ?auto_93466 ?auto_93469 ) ) ( not ( = ?auto_93466 ?auto_93467 ) ) ( not ( = ?auto_93466 ?auto_93471 ) ) ( not ( = ?auto_93466 ?auto_93468 ) ) ( not ( = ?auto_93469 ?auto_93467 ) ) ( not ( = ?auto_93469 ?auto_93471 ) ) ( not ( = ?auto_93469 ?auto_93468 ) ) ( not ( = ?auto_93467 ?auto_93471 ) ) ( not ( = ?auto_93467 ?auto_93468 ) ) ( not ( = ?auto_93471 ?auto_93468 ) ) ( not ( = ?auto_93465 ?auto_93471 ) ) ( not ( = ?auto_93465 ?auto_93466 ) ) ( not ( = ?auto_93465 ?auto_93469 ) ) ( not ( = ?auto_93465 ?auto_93467 ) ) ( not ( = ?auto_93470 ?auto_93471 ) ) ( not ( = ?auto_93470 ?auto_93466 ) ) ( not ( = ?auto_93470 ?auto_93469 ) ) ( not ( = ?auto_93470 ?auto_93467 ) ) ( not ( = ?auto_93472 ?auto_93471 ) ) ( not ( = ?auto_93472 ?auto_93466 ) ) ( not ( = ?auto_93472 ?auto_93469 ) ) ( not ( = ?auto_93472 ?auto_93467 ) ) ( ON ?auto_93468 ?auto_93472 ) ( CLEAR ?auto_93468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93465 ?auto_93470 ?auto_93472 )
      ( MAKE-1PILE ?auto_93465 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93473 - BLOCK
    )
    :vars
    (
      ?auto_93477 - BLOCK
      ?auto_93476 - BLOCK
      ?auto_93474 - BLOCK
      ?auto_93480 - BLOCK
      ?auto_93479 - BLOCK
      ?auto_93475 - BLOCK
      ?auto_93478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93477 ?auto_93473 ) ( ON-TABLE ?auto_93473 ) ( not ( = ?auto_93473 ?auto_93477 ) ) ( not ( = ?auto_93473 ?auto_93476 ) ) ( not ( = ?auto_93473 ?auto_93474 ) ) ( not ( = ?auto_93477 ?auto_93476 ) ) ( not ( = ?auto_93477 ?auto_93474 ) ) ( not ( = ?auto_93476 ?auto_93474 ) ) ( ON ?auto_93476 ?auto_93477 ) ( ON-TABLE ?auto_93480 ) ( ON ?auto_93479 ?auto_93480 ) ( ON ?auto_93475 ?auto_93479 ) ( not ( = ?auto_93480 ?auto_93479 ) ) ( not ( = ?auto_93480 ?auto_93475 ) ) ( not ( = ?auto_93480 ?auto_93478 ) ) ( not ( = ?auto_93480 ?auto_93474 ) ) ( not ( = ?auto_93479 ?auto_93475 ) ) ( not ( = ?auto_93479 ?auto_93478 ) ) ( not ( = ?auto_93479 ?auto_93474 ) ) ( not ( = ?auto_93475 ?auto_93478 ) ) ( not ( = ?auto_93475 ?auto_93474 ) ) ( not ( = ?auto_93478 ?auto_93474 ) ) ( not ( = ?auto_93473 ?auto_93478 ) ) ( not ( = ?auto_93473 ?auto_93480 ) ) ( not ( = ?auto_93473 ?auto_93479 ) ) ( not ( = ?auto_93473 ?auto_93475 ) ) ( not ( = ?auto_93477 ?auto_93478 ) ) ( not ( = ?auto_93477 ?auto_93480 ) ) ( not ( = ?auto_93477 ?auto_93479 ) ) ( not ( = ?auto_93477 ?auto_93475 ) ) ( not ( = ?auto_93476 ?auto_93478 ) ) ( not ( = ?auto_93476 ?auto_93480 ) ) ( not ( = ?auto_93476 ?auto_93479 ) ) ( not ( = ?auto_93476 ?auto_93475 ) ) ( ON ?auto_93474 ?auto_93476 ) ( CLEAR ?auto_93474 ) ( HOLDING ?auto_93478 ) ( CLEAR ?auto_93475 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93480 ?auto_93479 ?auto_93475 ?auto_93478 )
      ( MAKE-1PILE ?auto_93473 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93481 - BLOCK
    )
    :vars
    (
      ?auto_93487 - BLOCK
      ?auto_93488 - BLOCK
      ?auto_93482 - BLOCK
      ?auto_93483 - BLOCK
      ?auto_93484 - BLOCK
      ?auto_93486 - BLOCK
      ?auto_93485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93487 ?auto_93481 ) ( ON-TABLE ?auto_93481 ) ( not ( = ?auto_93481 ?auto_93487 ) ) ( not ( = ?auto_93481 ?auto_93488 ) ) ( not ( = ?auto_93481 ?auto_93482 ) ) ( not ( = ?auto_93487 ?auto_93488 ) ) ( not ( = ?auto_93487 ?auto_93482 ) ) ( not ( = ?auto_93488 ?auto_93482 ) ) ( ON ?auto_93488 ?auto_93487 ) ( ON-TABLE ?auto_93483 ) ( ON ?auto_93484 ?auto_93483 ) ( ON ?auto_93486 ?auto_93484 ) ( not ( = ?auto_93483 ?auto_93484 ) ) ( not ( = ?auto_93483 ?auto_93486 ) ) ( not ( = ?auto_93483 ?auto_93485 ) ) ( not ( = ?auto_93483 ?auto_93482 ) ) ( not ( = ?auto_93484 ?auto_93486 ) ) ( not ( = ?auto_93484 ?auto_93485 ) ) ( not ( = ?auto_93484 ?auto_93482 ) ) ( not ( = ?auto_93486 ?auto_93485 ) ) ( not ( = ?auto_93486 ?auto_93482 ) ) ( not ( = ?auto_93485 ?auto_93482 ) ) ( not ( = ?auto_93481 ?auto_93485 ) ) ( not ( = ?auto_93481 ?auto_93483 ) ) ( not ( = ?auto_93481 ?auto_93484 ) ) ( not ( = ?auto_93481 ?auto_93486 ) ) ( not ( = ?auto_93487 ?auto_93485 ) ) ( not ( = ?auto_93487 ?auto_93483 ) ) ( not ( = ?auto_93487 ?auto_93484 ) ) ( not ( = ?auto_93487 ?auto_93486 ) ) ( not ( = ?auto_93488 ?auto_93485 ) ) ( not ( = ?auto_93488 ?auto_93483 ) ) ( not ( = ?auto_93488 ?auto_93484 ) ) ( not ( = ?auto_93488 ?auto_93486 ) ) ( ON ?auto_93482 ?auto_93488 ) ( CLEAR ?auto_93486 ) ( ON ?auto_93485 ?auto_93482 ) ( CLEAR ?auto_93485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93481 ?auto_93487 ?auto_93488 ?auto_93482 )
      ( MAKE-1PILE ?auto_93481 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93489 - BLOCK
    )
    :vars
    (
      ?auto_93494 - BLOCK
      ?auto_93491 - BLOCK
      ?auto_93493 - BLOCK
      ?auto_93492 - BLOCK
      ?auto_93490 - BLOCK
      ?auto_93496 - BLOCK
      ?auto_93495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93494 ?auto_93489 ) ( ON-TABLE ?auto_93489 ) ( not ( = ?auto_93489 ?auto_93494 ) ) ( not ( = ?auto_93489 ?auto_93491 ) ) ( not ( = ?auto_93489 ?auto_93493 ) ) ( not ( = ?auto_93494 ?auto_93491 ) ) ( not ( = ?auto_93494 ?auto_93493 ) ) ( not ( = ?auto_93491 ?auto_93493 ) ) ( ON ?auto_93491 ?auto_93494 ) ( ON-TABLE ?auto_93492 ) ( ON ?auto_93490 ?auto_93492 ) ( not ( = ?auto_93492 ?auto_93490 ) ) ( not ( = ?auto_93492 ?auto_93496 ) ) ( not ( = ?auto_93492 ?auto_93495 ) ) ( not ( = ?auto_93492 ?auto_93493 ) ) ( not ( = ?auto_93490 ?auto_93496 ) ) ( not ( = ?auto_93490 ?auto_93495 ) ) ( not ( = ?auto_93490 ?auto_93493 ) ) ( not ( = ?auto_93496 ?auto_93495 ) ) ( not ( = ?auto_93496 ?auto_93493 ) ) ( not ( = ?auto_93495 ?auto_93493 ) ) ( not ( = ?auto_93489 ?auto_93495 ) ) ( not ( = ?auto_93489 ?auto_93492 ) ) ( not ( = ?auto_93489 ?auto_93490 ) ) ( not ( = ?auto_93489 ?auto_93496 ) ) ( not ( = ?auto_93494 ?auto_93495 ) ) ( not ( = ?auto_93494 ?auto_93492 ) ) ( not ( = ?auto_93494 ?auto_93490 ) ) ( not ( = ?auto_93494 ?auto_93496 ) ) ( not ( = ?auto_93491 ?auto_93495 ) ) ( not ( = ?auto_93491 ?auto_93492 ) ) ( not ( = ?auto_93491 ?auto_93490 ) ) ( not ( = ?auto_93491 ?auto_93496 ) ) ( ON ?auto_93493 ?auto_93491 ) ( ON ?auto_93495 ?auto_93493 ) ( CLEAR ?auto_93495 ) ( HOLDING ?auto_93496 ) ( CLEAR ?auto_93490 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93492 ?auto_93490 ?auto_93496 )
      ( MAKE-1PILE ?auto_93489 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93497 - BLOCK
    )
    :vars
    (
      ?auto_93503 - BLOCK
      ?auto_93500 - BLOCK
      ?auto_93504 - BLOCK
      ?auto_93501 - BLOCK
      ?auto_93499 - BLOCK
      ?auto_93502 - BLOCK
      ?auto_93498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93503 ?auto_93497 ) ( ON-TABLE ?auto_93497 ) ( not ( = ?auto_93497 ?auto_93503 ) ) ( not ( = ?auto_93497 ?auto_93500 ) ) ( not ( = ?auto_93497 ?auto_93504 ) ) ( not ( = ?auto_93503 ?auto_93500 ) ) ( not ( = ?auto_93503 ?auto_93504 ) ) ( not ( = ?auto_93500 ?auto_93504 ) ) ( ON ?auto_93500 ?auto_93503 ) ( ON-TABLE ?auto_93501 ) ( ON ?auto_93499 ?auto_93501 ) ( not ( = ?auto_93501 ?auto_93499 ) ) ( not ( = ?auto_93501 ?auto_93502 ) ) ( not ( = ?auto_93501 ?auto_93498 ) ) ( not ( = ?auto_93501 ?auto_93504 ) ) ( not ( = ?auto_93499 ?auto_93502 ) ) ( not ( = ?auto_93499 ?auto_93498 ) ) ( not ( = ?auto_93499 ?auto_93504 ) ) ( not ( = ?auto_93502 ?auto_93498 ) ) ( not ( = ?auto_93502 ?auto_93504 ) ) ( not ( = ?auto_93498 ?auto_93504 ) ) ( not ( = ?auto_93497 ?auto_93498 ) ) ( not ( = ?auto_93497 ?auto_93501 ) ) ( not ( = ?auto_93497 ?auto_93499 ) ) ( not ( = ?auto_93497 ?auto_93502 ) ) ( not ( = ?auto_93503 ?auto_93498 ) ) ( not ( = ?auto_93503 ?auto_93501 ) ) ( not ( = ?auto_93503 ?auto_93499 ) ) ( not ( = ?auto_93503 ?auto_93502 ) ) ( not ( = ?auto_93500 ?auto_93498 ) ) ( not ( = ?auto_93500 ?auto_93501 ) ) ( not ( = ?auto_93500 ?auto_93499 ) ) ( not ( = ?auto_93500 ?auto_93502 ) ) ( ON ?auto_93504 ?auto_93500 ) ( ON ?auto_93498 ?auto_93504 ) ( CLEAR ?auto_93499 ) ( ON ?auto_93502 ?auto_93498 ) ( CLEAR ?auto_93502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93497 ?auto_93503 ?auto_93500 ?auto_93504 ?auto_93498 )
      ( MAKE-1PILE ?auto_93497 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93505 - BLOCK
    )
    :vars
    (
      ?auto_93512 - BLOCK
      ?auto_93508 - BLOCK
      ?auto_93511 - BLOCK
      ?auto_93509 - BLOCK
      ?auto_93506 - BLOCK
      ?auto_93510 - BLOCK
      ?auto_93507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93512 ?auto_93505 ) ( ON-TABLE ?auto_93505 ) ( not ( = ?auto_93505 ?auto_93512 ) ) ( not ( = ?auto_93505 ?auto_93508 ) ) ( not ( = ?auto_93505 ?auto_93511 ) ) ( not ( = ?auto_93512 ?auto_93508 ) ) ( not ( = ?auto_93512 ?auto_93511 ) ) ( not ( = ?auto_93508 ?auto_93511 ) ) ( ON ?auto_93508 ?auto_93512 ) ( ON-TABLE ?auto_93509 ) ( not ( = ?auto_93509 ?auto_93506 ) ) ( not ( = ?auto_93509 ?auto_93510 ) ) ( not ( = ?auto_93509 ?auto_93507 ) ) ( not ( = ?auto_93509 ?auto_93511 ) ) ( not ( = ?auto_93506 ?auto_93510 ) ) ( not ( = ?auto_93506 ?auto_93507 ) ) ( not ( = ?auto_93506 ?auto_93511 ) ) ( not ( = ?auto_93510 ?auto_93507 ) ) ( not ( = ?auto_93510 ?auto_93511 ) ) ( not ( = ?auto_93507 ?auto_93511 ) ) ( not ( = ?auto_93505 ?auto_93507 ) ) ( not ( = ?auto_93505 ?auto_93509 ) ) ( not ( = ?auto_93505 ?auto_93506 ) ) ( not ( = ?auto_93505 ?auto_93510 ) ) ( not ( = ?auto_93512 ?auto_93507 ) ) ( not ( = ?auto_93512 ?auto_93509 ) ) ( not ( = ?auto_93512 ?auto_93506 ) ) ( not ( = ?auto_93512 ?auto_93510 ) ) ( not ( = ?auto_93508 ?auto_93507 ) ) ( not ( = ?auto_93508 ?auto_93509 ) ) ( not ( = ?auto_93508 ?auto_93506 ) ) ( not ( = ?auto_93508 ?auto_93510 ) ) ( ON ?auto_93511 ?auto_93508 ) ( ON ?auto_93507 ?auto_93511 ) ( ON ?auto_93510 ?auto_93507 ) ( CLEAR ?auto_93510 ) ( HOLDING ?auto_93506 ) ( CLEAR ?auto_93509 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93509 ?auto_93506 )
      ( MAKE-1PILE ?auto_93505 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93513 - BLOCK
    )
    :vars
    (
      ?auto_93515 - BLOCK
      ?auto_93520 - BLOCK
      ?auto_93514 - BLOCK
      ?auto_93517 - BLOCK
      ?auto_93518 - BLOCK
      ?auto_93519 - BLOCK
      ?auto_93516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93515 ?auto_93513 ) ( ON-TABLE ?auto_93513 ) ( not ( = ?auto_93513 ?auto_93515 ) ) ( not ( = ?auto_93513 ?auto_93520 ) ) ( not ( = ?auto_93513 ?auto_93514 ) ) ( not ( = ?auto_93515 ?auto_93520 ) ) ( not ( = ?auto_93515 ?auto_93514 ) ) ( not ( = ?auto_93520 ?auto_93514 ) ) ( ON ?auto_93520 ?auto_93515 ) ( ON-TABLE ?auto_93517 ) ( not ( = ?auto_93517 ?auto_93518 ) ) ( not ( = ?auto_93517 ?auto_93519 ) ) ( not ( = ?auto_93517 ?auto_93516 ) ) ( not ( = ?auto_93517 ?auto_93514 ) ) ( not ( = ?auto_93518 ?auto_93519 ) ) ( not ( = ?auto_93518 ?auto_93516 ) ) ( not ( = ?auto_93518 ?auto_93514 ) ) ( not ( = ?auto_93519 ?auto_93516 ) ) ( not ( = ?auto_93519 ?auto_93514 ) ) ( not ( = ?auto_93516 ?auto_93514 ) ) ( not ( = ?auto_93513 ?auto_93516 ) ) ( not ( = ?auto_93513 ?auto_93517 ) ) ( not ( = ?auto_93513 ?auto_93518 ) ) ( not ( = ?auto_93513 ?auto_93519 ) ) ( not ( = ?auto_93515 ?auto_93516 ) ) ( not ( = ?auto_93515 ?auto_93517 ) ) ( not ( = ?auto_93515 ?auto_93518 ) ) ( not ( = ?auto_93515 ?auto_93519 ) ) ( not ( = ?auto_93520 ?auto_93516 ) ) ( not ( = ?auto_93520 ?auto_93517 ) ) ( not ( = ?auto_93520 ?auto_93518 ) ) ( not ( = ?auto_93520 ?auto_93519 ) ) ( ON ?auto_93514 ?auto_93520 ) ( ON ?auto_93516 ?auto_93514 ) ( ON ?auto_93519 ?auto_93516 ) ( CLEAR ?auto_93517 ) ( ON ?auto_93518 ?auto_93519 ) ( CLEAR ?auto_93518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93513 ?auto_93515 ?auto_93520 ?auto_93514 ?auto_93516 ?auto_93519 )
      ( MAKE-1PILE ?auto_93513 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93521 - BLOCK
    )
    :vars
    (
      ?auto_93522 - BLOCK
      ?auto_93528 - BLOCK
      ?auto_93527 - BLOCK
      ?auto_93526 - BLOCK
      ?auto_93523 - BLOCK
      ?auto_93524 - BLOCK
      ?auto_93525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93522 ?auto_93521 ) ( ON-TABLE ?auto_93521 ) ( not ( = ?auto_93521 ?auto_93522 ) ) ( not ( = ?auto_93521 ?auto_93528 ) ) ( not ( = ?auto_93521 ?auto_93527 ) ) ( not ( = ?auto_93522 ?auto_93528 ) ) ( not ( = ?auto_93522 ?auto_93527 ) ) ( not ( = ?auto_93528 ?auto_93527 ) ) ( ON ?auto_93528 ?auto_93522 ) ( not ( = ?auto_93526 ?auto_93523 ) ) ( not ( = ?auto_93526 ?auto_93524 ) ) ( not ( = ?auto_93526 ?auto_93525 ) ) ( not ( = ?auto_93526 ?auto_93527 ) ) ( not ( = ?auto_93523 ?auto_93524 ) ) ( not ( = ?auto_93523 ?auto_93525 ) ) ( not ( = ?auto_93523 ?auto_93527 ) ) ( not ( = ?auto_93524 ?auto_93525 ) ) ( not ( = ?auto_93524 ?auto_93527 ) ) ( not ( = ?auto_93525 ?auto_93527 ) ) ( not ( = ?auto_93521 ?auto_93525 ) ) ( not ( = ?auto_93521 ?auto_93526 ) ) ( not ( = ?auto_93521 ?auto_93523 ) ) ( not ( = ?auto_93521 ?auto_93524 ) ) ( not ( = ?auto_93522 ?auto_93525 ) ) ( not ( = ?auto_93522 ?auto_93526 ) ) ( not ( = ?auto_93522 ?auto_93523 ) ) ( not ( = ?auto_93522 ?auto_93524 ) ) ( not ( = ?auto_93528 ?auto_93525 ) ) ( not ( = ?auto_93528 ?auto_93526 ) ) ( not ( = ?auto_93528 ?auto_93523 ) ) ( not ( = ?auto_93528 ?auto_93524 ) ) ( ON ?auto_93527 ?auto_93528 ) ( ON ?auto_93525 ?auto_93527 ) ( ON ?auto_93524 ?auto_93525 ) ( ON ?auto_93523 ?auto_93524 ) ( CLEAR ?auto_93523 ) ( HOLDING ?auto_93526 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93526 )
      ( MAKE-1PILE ?auto_93521 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93529 - BLOCK
    )
    :vars
    (
      ?auto_93533 - BLOCK
      ?auto_93535 - BLOCK
      ?auto_93532 - BLOCK
      ?auto_93531 - BLOCK
      ?auto_93530 - BLOCK
      ?auto_93536 - BLOCK
      ?auto_93534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93533 ?auto_93529 ) ( ON-TABLE ?auto_93529 ) ( not ( = ?auto_93529 ?auto_93533 ) ) ( not ( = ?auto_93529 ?auto_93535 ) ) ( not ( = ?auto_93529 ?auto_93532 ) ) ( not ( = ?auto_93533 ?auto_93535 ) ) ( not ( = ?auto_93533 ?auto_93532 ) ) ( not ( = ?auto_93535 ?auto_93532 ) ) ( ON ?auto_93535 ?auto_93533 ) ( not ( = ?auto_93531 ?auto_93530 ) ) ( not ( = ?auto_93531 ?auto_93536 ) ) ( not ( = ?auto_93531 ?auto_93534 ) ) ( not ( = ?auto_93531 ?auto_93532 ) ) ( not ( = ?auto_93530 ?auto_93536 ) ) ( not ( = ?auto_93530 ?auto_93534 ) ) ( not ( = ?auto_93530 ?auto_93532 ) ) ( not ( = ?auto_93536 ?auto_93534 ) ) ( not ( = ?auto_93536 ?auto_93532 ) ) ( not ( = ?auto_93534 ?auto_93532 ) ) ( not ( = ?auto_93529 ?auto_93534 ) ) ( not ( = ?auto_93529 ?auto_93531 ) ) ( not ( = ?auto_93529 ?auto_93530 ) ) ( not ( = ?auto_93529 ?auto_93536 ) ) ( not ( = ?auto_93533 ?auto_93534 ) ) ( not ( = ?auto_93533 ?auto_93531 ) ) ( not ( = ?auto_93533 ?auto_93530 ) ) ( not ( = ?auto_93533 ?auto_93536 ) ) ( not ( = ?auto_93535 ?auto_93534 ) ) ( not ( = ?auto_93535 ?auto_93531 ) ) ( not ( = ?auto_93535 ?auto_93530 ) ) ( not ( = ?auto_93535 ?auto_93536 ) ) ( ON ?auto_93532 ?auto_93535 ) ( ON ?auto_93534 ?auto_93532 ) ( ON ?auto_93536 ?auto_93534 ) ( ON ?auto_93530 ?auto_93536 ) ( ON ?auto_93531 ?auto_93530 ) ( CLEAR ?auto_93531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93529 ?auto_93533 ?auto_93535 ?auto_93532 ?auto_93534 ?auto_93536 ?auto_93530 )
      ( MAKE-1PILE ?auto_93529 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93544 - BLOCK
      ?auto_93545 - BLOCK
      ?auto_93546 - BLOCK
      ?auto_93547 - BLOCK
      ?auto_93548 - BLOCK
      ?auto_93549 - BLOCK
      ?auto_93550 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_93550 ) ( CLEAR ?auto_93549 ) ( ON-TABLE ?auto_93544 ) ( ON ?auto_93545 ?auto_93544 ) ( ON ?auto_93546 ?auto_93545 ) ( ON ?auto_93547 ?auto_93546 ) ( ON ?auto_93548 ?auto_93547 ) ( ON ?auto_93549 ?auto_93548 ) ( not ( = ?auto_93544 ?auto_93545 ) ) ( not ( = ?auto_93544 ?auto_93546 ) ) ( not ( = ?auto_93544 ?auto_93547 ) ) ( not ( = ?auto_93544 ?auto_93548 ) ) ( not ( = ?auto_93544 ?auto_93549 ) ) ( not ( = ?auto_93544 ?auto_93550 ) ) ( not ( = ?auto_93545 ?auto_93546 ) ) ( not ( = ?auto_93545 ?auto_93547 ) ) ( not ( = ?auto_93545 ?auto_93548 ) ) ( not ( = ?auto_93545 ?auto_93549 ) ) ( not ( = ?auto_93545 ?auto_93550 ) ) ( not ( = ?auto_93546 ?auto_93547 ) ) ( not ( = ?auto_93546 ?auto_93548 ) ) ( not ( = ?auto_93546 ?auto_93549 ) ) ( not ( = ?auto_93546 ?auto_93550 ) ) ( not ( = ?auto_93547 ?auto_93548 ) ) ( not ( = ?auto_93547 ?auto_93549 ) ) ( not ( = ?auto_93547 ?auto_93550 ) ) ( not ( = ?auto_93548 ?auto_93549 ) ) ( not ( = ?auto_93548 ?auto_93550 ) ) ( not ( = ?auto_93549 ?auto_93550 ) ) )
    :subtasks
    ( ( !STACK ?auto_93550 ?auto_93549 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93551 - BLOCK
      ?auto_93552 - BLOCK
      ?auto_93553 - BLOCK
      ?auto_93554 - BLOCK
      ?auto_93555 - BLOCK
      ?auto_93556 - BLOCK
      ?auto_93557 - BLOCK
    )
    :vars
    (
      ?auto_93558 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93556 ) ( ON-TABLE ?auto_93551 ) ( ON ?auto_93552 ?auto_93551 ) ( ON ?auto_93553 ?auto_93552 ) ( ON ?auto_93554 ?auto_93553 ) ( ON ?auto_93555 ?auto_93554 ) ( ON ?auto_93556 ?auto_93555 ) ( not ( = ?auto_93551 ?auto_93552 ) ) ( not ( = ?auto_93551 ?auto_93553 ) ) ( not ( = ?auto_93551 ?auto_93554 ) ) ( not ( = ?auto_93551 ?auto_93555 ) ) ( not ( = ?auto_93551 ?auto_93556 ) ) ( not ( = ?auto_93551 ?auto_93557 ) ) ( not ( = ?auto_93552 ?auto_93553 ) ) ( not ( = ?auto_93552 ?auto_93554 ) ) ( not ( = ?auto_93552 ?auto_93555 ) ) ( not ( = ?auto_93552 ?auto_93556 ) ) ( not ( = ?auto_93552 ?auto_93557 ) ) ( not ( = ?auto_93553 ?auto_93554 ) ) ( not ( = ?auto_93553 ?auto_93555 ) ) ( not ( = ?auto_93553 ?auto_93556 ) ) ( not ( = ?auto_93553 ?auto_93557 ) ) ( not ( = ?auto_93554 ?auto_93555 ) ) ( not ( = ?auto_93554 ?auto_93556 ) ) ( not ( = ?auto_93554 ?auto_93557 ) ) ( not ( = ?auto_93555 ?auto_93556 ) ) ( not ( = ?auto_93555 ?auto_93557 ) ) ( not ( = ?auto_93556 ?auto_93557 ) ) ( ON ?auto_93557 ?auto_93558 ) ( CLEAR ?auto_93557 ) ( HAND-EMPTY ) ( not ( = ?auto_93551 ?auto_93558 ) ) ( not ( = ?auto_93552 ?auto_93558 ) ) ( not ( = ?auto_93553 ?auto_93558 ) ) ( not ( = ?auto_93554 ?auto_93558 ) ) ( not ( = ?auto_93555 ?auto_93558 ) ) ( not ( = ?auto_93556 ?auto_93558 ) ) ( not ( = ?auto_93557 ?auto_93558 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93557 ?auto_93558 )
      ( MAKE-7PILE ?auto_93551 ?auto_93552 ?auto_93553 ?auto_93554 ?auto_93555 ?auto_93556 ?auto_93557 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93559 - BLOCK
      ?auto_93560 - BLOCK
      ?auto_93561 - BLOCK
      ?auto_93562 - BLOCK
      ?auto_93563 - BLOCK
      ?auto_93564 - BLOCK
      ?auto_93565 - BLOCK
    )
    :vars
    (
      ?auto_93566 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93559 ) ( ON ?auto_93560 ?auto_93559 ) ( ON ?auto_93561 ?auto_93560 ) ( ON ?auto_93562 ?auto_93561 ) ( ON ?auto_93563 ?auto_93562 ) ( not ( = ?auto_93559 ?auto_93560 ) ) ( not ( = ?auto_93559 ?auto_93561 ) ) ( not ( = ?auto_93559 ?auto_93562 ) ) ( not ( = ?auto_93559 ?auto_93563 ) ) ( not ( = ?auto_93559 ?auto_93564 ) ) ( not ( = ?auto_93559 ?auto_93565 ) ) ( not ( = ?auto_93560 ?auto_93561 ) ) ( not ( = ?auto_93560 ?auto_93562 ) ) ( not ( = ?auto_93560 ?auto_93563 ) ) ( not ( = ?auto_93560 ?auto_93564 ) ) ( not ( = ?auto_93560 ?auto_93565 ) ) ( not ( = ?auto_93561 ?auto_93562 ) ) ( not ( = ?auto_93561 ?auto_93563 ) ) ( not ( = ?auto_93561 ?auto_93564 ) ) ( not ( = ?auto_93561 ?auto_93565 ) ) ( not ( = ?auto_93562 ?auto_93563 ) ) ( not ( = ?auto_93562 ?auto_93564 ) ) ( not ( = ?auto_93562 ?auto_93565 ) ) ( not ( = ?auto_93563 ?auto_93564 ) ) ( not ( = ?auto_93563 ?auto_93565 ) ) ( not ( = ?auto_93564 ?auto_93565 ) ) ( ON ?auto_93565 ?auto_93566 ) ( CLEAR ?auto_93565 ) ( not ( = ?auto_93559 ?auto_93566 ) ) ( not ( = ?auto_93560 ?auto_93566 ) ) ( not ( = ?auto_93561 ?auto_93566 ) ) ( not ( = ?auto_93562 ?auto_93566 ) ) ( not ( = ?auto_93563 ?auto_93566 ) ) ( not ( = ?auto_93564 ?auto_93566 ) ) ( not ( = ?auto_93565 ?auto_93566 ) ) ( HOLDING ?auto_93564 ) ( CLEAR ?auto_93563 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93559 ?auto_93560 ?auto_93561 ?auto_93562 ?auto_93563 ?auto_93564 )
      ( MAKE-7PILE ?auto_93559 ?auto_93560 ?auto_93561 ?auto_93562 ?auto_93563 ?auto_93564 ?auto_93565 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93567 - BLOCK
      ?auto_93568 - BLOCK
      ?auto_93569 - BLOCK
      ?auto_93570 - BLOCK
      ?auto_93571 - BLOCK
      ?auto_93572 - BLOCK
      ?auto_93573 - BLOCK
    )
    :vars
    (
      ?auto_93574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93567 ) ( ON ?auto_93568 ?auto_93567 ) ( ON ?auto_93569 ?auto_93568 ) ( ON ?auto_93570 ?auto_93569 ) ( ON ?auto_93571 ?auto_93570 ) ( not ( = ?auto_93567 ?auto_93568 ) ) ( not ( = ?auto_93567 ?auto_93569 ) ) ( not ( = ?auto_93567 ?auto_93570 ) ) ( not ( = ?auto_93567 ?auto_93571 ) ) ( not ( = ?auto_93567 ?auto_93572 ) ) ( not ( = ?auto_93567 ?auto_93573 ) ) ( not ( = ?auto_93568 ?auto_93569 ) ) ( not ( = ?auto_93568 ?auto_93570 ) ) ( not ( = ?auto_93568 ?auto_93571 ) ) ( not ( = ?auto_93568 ?auto_93572 ) ) ( not ( = ?auto_93568 ?auto_93573 ) ) ( not ( = ?auto_93569 ?auto_93570 ) ) ( not ( = ?auto_93569 ?auto_93571 ) ) ( not ( = ?auto_93569 ?auto_93572 ) ) ( not ( = ?auto_93569 ?auto_93573 ) ) ( not ( = ?auto_93570 ?auto_93571 ) ) ( not ( = ?auto_93570 ?auto_93572 ) ) ( not ( = ?auto_93570 ?auto_93573 ) ) ( not ( = ?auto_93571 ?auto_93572 ) ) ( not ( = ?auto_93571 ?auto_93573 ) ) ( not ( = ?auto_93572 ?auto_93573 ) ) ( ON ?auto_93573 ?auto_93574 ) ( not ( = ?auto_93567 ?auto_93574 ) ) ( not ( = ?auto_93568 ?auto_93574 ) ) ( not ( = ?auto_93569 ?auto_93574 ) ) ( not ( = ?auto_93570 ?auto_93574 ) ) ( not ( = ?auto_93571 ?auto_93574 ) ) ( not ( = ?auto_93572 ?auto_93574 ) ) ( not ( = ?auto_93573 ?auto_93574 ) ) ( CLEAR ?auto_93571 ) ( ON ?auto_93572 ?auto_93573 ) ( CLEAR ?auto_93572 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93574 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93574 ?auto_93573 )
      ( MAKE-7PILE ?auto_93567 ?auto_93568 ?auto_93569 ?auto_93570 ?auto_93571 ?auto_93572 ?auto_93573 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93575 - BLOCK
      ?auto_93576 - BLOCK
      ?auto_93577 - BLOCK
      ?auto_93578 - BLOCK
      ?auto_93579 - BLOCK
      ?auto_93580 - BLOCK
      ?auto_93581 - BLOCK
    )
    :vars
    (
      ?auto_93582 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93575 ) ( ON ?auto_93576 ?auto_93575 ) ( ON ?auto_93577 ?auto_93576 ) ( ON ?auto_93578 ?auto_93577 ) ( not ( = ?auto_93575 ?auto_93576 ) ) ( not ( = ?auto_93575 ?auto_93577 ) ) ( not ( = ?auto_93575 ?auto_93578 ) ) ( not ( = ?auto_93575 ?auto_93579 ) ) ( not ( = ?auto_93575 ?auto_93580 ) ) ( not ( = ?auto_93575 ?auto_93581 ) ) ( not ( = ?auto_93576 ?auto_93577 ) ) ( not ( = ?auto_93576 ?auto_93578 ) ) ( not ( = ?auto_93576 ?auto_93579 ) ) ( not ( = ?auto_93576 ?auto_93580 ) ) ( not ( = ?auto_93576 ?auto_93581 ) ) ( not ( = ?auto_93577 ?auto_93578 ) ) ( not ( = ?auto_93577 ?auto_93579 ) ) ( not ( = ?auto_93577 ?auto_93580 ) ) ( not ( = ?auto_93577 ?auto_93581 ) ) ( not ( = ?auto_93578 ?auto_93579 ) ) ( not ( = ?auto_93578 ?auto_93580 ) ) ( not ( = ?auto_93578 ?auto_93581 ) ) ( not ( = ?auto_93579 ?auto_93580 ) ) ( not ( = ?auto_93579 ?auto_93581 ) ) ( not ( = ?auto_93580 ?auto_93581 ) ) ( ON ?auto_93581 ?auto_93582 ) ( not ( = ?auto_93575 ?auto_93582 ) ) ( not ( = ?auto_93576 ?auto_93582 ) ) ( not ( = ?auto_93577 ?auto_93582 ) ) ( not ( = ?auto_93578 ?auto_93582 ) ) ( not ( = ?auto_93579 ?auto_93582 ) ) ( not ( = ?auto_93580 ?auto_93582 ) ) ( not ( = ?auto_93581 ?auto_93582 ) ) ( ON ?auto_93580 ?auto_93581 ) ( CLEAR ?auto_93580 ) ( ON-TABLE ?auto_93582 ) ( HOLDING ?auto_93579 ) ( CLEAR ?auto_93578 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93575 ?auto_93576 ?auto_93577 ?auto_93578 ?auto_93579 )
      ( MAKE-7PILE ?auto_93575 ?auto_93576 ?auto_93577 ?auto_93578 ?auto_93579 ?auto_93580 ?auto_93581 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93583 - BLOCK
      ?auto_93584 - BLOCK
      ?auto_93585 - BLOCK
      ?auto_93586 - BLOCK
      ?auto_93587 - BLOCK
      ?auto_93588 - BLOCK
      ?auto_93589 - BLOCK
    )
    :vars
    (
      ?auto_93590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93583 ) ( ON ?auto_93584 ?auto_93583 ) ( ON ?auto_93585 ?auto_93584 ) ( ON ?auto_93586 ?auto_93585 ) ( not ( = ?auto_93583 ?auto_93584 ) ) ( not ( = ?auto_93583 ?auto_93585 ) ) ( not ( = ?auto_93583 ?auto_93586 ) ) ( not ( = ?auto_93583 ?auto_93587 ) ) ( not ( = ?auto_93583 ?auto_93588 ) ) ( not ( = ?auto_93583 ?auto_93589 ) ) ( not ( = ?auto_93584 ?auto_93585 ) ) ( not ( = ?auto_93584 ?auto_93586 ) ) ( not ( = ?auto_93584 ?auto_93587 ) ) ( not ( = ?auto_93584 ?auto_93588 ) ) ( not ( = ?auto_93584 ?auto_93589 ) ) ( not ( = ?auto_93585 ?auto_93586 ) ) ( not ( = ?auto_93585 ?auto_93587 ) ) ( not ( = ?auto_93585 ?auto_93588 ) ) ( not ( = ?auto_93585 ?auto_93589 ) ) ( not ( = ?auto_93586 ?auto_93587 ) ) ( not ( = ?auto_93586 ?auto_93588 ) ) ( not ( = ?auto_93586 ?auto_93589 ) ) ( not ( = ?auto_93587 ?auto_93588 ) ) ( not ( = ?auto_93587 ?auto_93589 ) ) ( not ( = ?auto_93588 ?auto_93589 ) ) ( ON ?auto_93589 ?auto_93590 ) ( not ( = ?auto_93583 ?auto_93590 ) ) ( not ( = ?auto_93584 ?auto_93590 ) ) ( not ( = ?auto_93585 ?auto_93590 ) ) ( not ( = ?auto_93586 ?auto_93590 ) ) ( not ( = ?auto_93587 ?auto_93590 ) ) ( not ( = ?auto_93588 ?auto_93590 ) ) ( not ( = ?auto_93589 ?auto_93590 ) ) ( ON ?auto_93588 ?auto_93589 ) ( ON-TABLE ?auto_93590 ) ( CLEAR ?auto_93586 ) ( ON ?auto_93587 ?auto_93588 ) ( CLEAR ?auto_93587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93590 ?auto_93589 ?auto_93588 )
      ( MAKE-7PILE ?auto_93583 ?auto_93584 ?auto_93585 ?auto_93586 ?auto_93587 ?auto_93588 ?auto_93589 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93591 - BLOCK
      ?auto_93592 - BLOCK
      ?auto_93593 - BLOCK
      ?auto_93594 - BLOCK
      ?auto_93595 - BLOCK
      ?auto_93596 - BLOCK
      ?auto_93597 - BLOCK
    )
    :vars
    (
      ?auto_93598 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93591 ) ( ON ?auto_93592 ?auto_93591 ) ( ON ?auto_93593 ?auto_93592 ) ( not ( = ?auto_93591 ?auto_93592 ) ) ( not ( = ?auto_93591 ?auto_93593 ) ) ( not ( = ?auto_93591 ?auto_93594 ) ) ( not ( = ?auto_93591 ?auto_93595 ) ) ( not ( = ?auto_93591 ?auto_93596 ) ) ( not ( = ?auto_93591 ?auto_93597 ) ) ( not ( = ?auto_93592 ?auto_93593 ) ) ( not ( = ?auto_93592 ?auto_93594 ) ) ( not ( = ?auto_93592 ?auto_93595 ) ) ( not ( = ?auto_93592 ?auto_93596 ) ) ( not ( = ?auto_93592 ?auto_93597 ) ) ( not ( = ?auto_93593 ?auto_93594 ) ) ( not ( = ?auto_93593 ?auto_93595 ) ) ( not ( = ?auto_93593 ?auto_93596 ) ) ( not ( = ?auto_93593 ?auto_93597 ) ) ( not ( = ?auto_93594 ?auto_93595 ) ) ( not ( = ?auto_93594 ?auto_93596 ) ) ( not ( = ?auto_93594 ?auto_93597 ) ) ( not ( = ?auto_93595 ?auto_93596 ) ) ( not ( = ?auto_93595 ?auto_93597 ) ) ( not ( = ?auto_93596 ?auto_93597 ) ) ( ON ?auto_93597 ?auto_93598 ) ( not ( = ?auto_93591 ?auto_93598 ) ) ( not ( = ?auto_93592 ?auto_93598 ) ) ( not ( = ?auto_93593 ?auto_93598 ) ) ( not ( = ?auto_93594 ?auto_93598 ) ) ( not ( = ?auto_93595 ?auto_93598 ) ) ( not ( = ?auto_93596 ?auto_93598 ) ) ( not ( = ?auto_93597 ?auto_93598 ) ) ( ON ?auto_93596 ?auto_93597 ) ( ON-TABLE ?auto_93598 ) ( ON ?auto_93595 ?auto_93596 ) ( CLEAR ?auto_93595 ) ( HOLDING ?auto_93594 ) ( CLEAR ?auto_93593 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93591 ?auto_93592 ?auto_93593 ?auto_93594 )
      ( MAKE-7PILE ?auto_93591 ?auto_93592 ?auto_93593 ?auto_93594 ?auto_93595 ?auto_93596 ?auto_93597 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93599 - BLOCK
      ?auto_93600 - BLOCK
      ?auto_93601 - BLOCK
      ?auto_93602 - BLOCK
      ?auto_93603 - BLOCK
      ?auto_93604 - BLOCK
      ?auto_93605 - BLOCK
    )
    :vars
    (
      ?auto_93606 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93599 ) ( ON ?auto_93600 ?auto_93599 ) ( ON ?auto_93601 ?auto_93600 ) ( not ( = ?auto_93599 ?auto_93600 ) ) ( not ( = ?auto_93599 ?auto_93601 ) ) ( not ( = ?auto_93599 ?auto_93602 ) ) ( not ( = ?auto_93599 ?auto_93603 ) ) ( not ( = ?auto_93599 ?auto_93604 ) ) ( not ( = ?auto_93599 ?auto_93605 ) ) ( not ( = ?auto_93600 ?auto_93601 ) ) ( not ( = ?auto_93600 ?auto_93602 ) ) ( not ( = ?auto_93600 ?auto_93603 ) ) ( not ( = ?auto_93600 ?auto_93604 ) ) ( not ( = ?auto_93600 ?auto_93605 ) ) ( not ( = ?auto_93601 ?auto_93602 ) ) ( not ( = ?auto_93601 ?auto_93603 ) ) ( not ( = ?auto_93601 ?auto_93604 ) ) ( not ( = ?auto_93601 ?auto_93605 ) ) ( not ( = ?auto_93602 ?auto_93603 ) ) ( not ( = ?auto_93602 ?auto_93604 ) ) ( not ( = ?auto_93602 ?auto_93605 ) ) ( not ( = ?auto_93603 ?auto_93604 ) ) ( not ( = ?auto_93603 ?auto_93605 ) ) ( not ( = ?auto_93604 ?auto_93605 ) ) ( ON ?auto_93605 ?auto_93606 ) ( not ( = ?auto_93599 ?auto_93606 ) ) ( not ( = ?auto_93600 ?auto_93606 ) ) ( not ( = ?auto_93601 ?auto_93606 ) ) ( not ( = ?auto_93602 ?auto_93606 ) ) ( not ( = ?auto_93603 ?auto_93606 ) ) ( not ( = ?auto_93604 ?auto_93606 ) ) ( not ( = ?auto_93605 ?auto_93606 ) ) ( ON ?auto_93604 ?auto_93605 ) ( ON-TABLE ?auto_93606 ) ( ON ?auto_93603 ?auto_93604 ) ( CLEAR ?auto_93601 ) ( ON ?auto_93602 ?auto_93603 ) ( CLEAR ?auto_93602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93606 ?auto_93605 ?auto_93604 ?auto_93603 )
      ( MAKE-7PILE ?auto_93599 ?auto_93600 ?auto_93601 ?auto_93602 ?auto_93603 ?auto_93604 ?auto_93605 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93607 - BLOCK
      ?auto_93608 - BLOCK
      ?auto_93609 - BLOCK
      ?auto_93610 - BLOCK
      ?auto_93611 - BLOCK
      ?auto_93612 - BLOCK
      ?auto_93613 - BLOCK
    )
    :vars
    (
      ?auto_93614 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93607 ) ( ON ?auto_93608 ?auto_93607 ) ( not ( = ?auto_93607 ?auto_93608 ) ) ( not ( = ?auto_93607 ?auto_93609 ) ) ( not ( = ?auto_93607 ?auto_93610 ) ) ( not ( = ?auto_93607 ?auto_93611 ) ) ( not ( = ?auto_93607 ?auto_93612 ) ) ( not ( = ?auto_93607 ?auto_93613 ) ) ( not ( = ?auto_93608 ?auto_93609 ) ) ( not ( = ?auto_93608 ?auto_93610 ) ) ( not ( = ?auto_93608 ?auto_93611 ) ) ( not ( = ?auto_93608 ?auto_93612 ) ) ( not ( = ?auto_93608 ?auto_93613 ) ) ( not ( = ?auto_93609 ?auto_93610 ) ) ( not ( = ?auto_93609 ?auto_93611 ) ) ( not ( = ?auto_93609 ?auto_93612 ) ) ( not ( = ?auto_93609 ?auto_93613 ) ) ( not ( = ?auto_93610 ?auto_93611 ) ) ( not ( = ?auto_93610 ?auto_93612 ) ) ( not ( = ?auto_93610 ?auto_93613 ) ) ( not ( = ?auto_93611 ?auto_93612 ) ) ( not ( = ?auto_93611 ?auto_93613 ) ) ( not ( = ?auto_93612 ?auto_93613 ) ) ( ON ?auto_93613 ?auto_93614 ) ( not ( = ?auto_93607 ?auto_93614 ) ) ( not ( = ?auto_93608 ?auto_93614 ) ) ( not ( = ?auto_93609 ?auto_93614 ) ) ( not ( = ?auto_93610 ?auto_93614 ) ) ( not ( = ?auto_93611 ?auto_93614 ) ) ( not ( = ?auto_93612 ?auto_93614 ) ) ( not ( = ?auto_93613 ?auto_93614 ) ) ( ON ?auto_93612 ?auto_93613 ) ( ON-TABLE ?auto_93614 ) ( ON ?auto_93611 ?auto_93612 ) ( ON ?auto_93610 ?auto_93611 ) ( CLEAR ?auto_93610 ) ( HOLDING ?auto_93609 ) ( CLEAR ?auto_93608 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93607 ?auto_93608 ?auto_93609 )
      ( MAKE-7PILE ?auto_93607 ?auto_93608 ?auto_93609 ?auto_93610 ?auto_93611 ?auto_93612 ?auto_93613 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93615 - BLOCK
      ?auto_93616 - BLOCK
      ?auto_93617 - BLOCK
      ?auto_93618 - BLOCK
      ?auto_93619 - BLOCK
      ?auto_93620 - BLOCK
      ?auto_93621 - BLOCK
    )
    :vars
    (
      ?auto_93622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93615 ) ( ON ?auto_93616 ?auto_93615 ) ( not ( = ?auto_93615 ?auto_93616 ) ) ( not ( = ?auto_93615 ?auto_93617 ) ) ( not ( = ?auto_93615 ?auto_93618 ) ) ( not ( = ?auto_93615 ?auto_93619 ) ) ( not ( = ?auto_93615 ?auto_93620 ) ) ( not ( = ?auto_93615 ?auto_93621 ) ) ( not ( = ?auto_93616 ?auto_93617 ) ) ( not ( = ?auto_93616 ?auto_93618 ) ) ( not ( = ?auto_93616 ?auto_93619 ) ) ( not ( = ?auto_93616 ?auto_93620 ) ) ( not ( = ?auto_93616 ?auto_93621 ) ) ( not ( = ?auto_93617 ?auto_93618 ) ) ( not ( = ?auto_93617 ?auto_93619 ) ) ( not ( = ?auto_93617 ?auto_93620 ) ) ( not ( = ?auto_93617 ?auto_93621 ) ) ( not ( = ?auto_93618 ?auto_93619 ) ) ( not ( = ?auto_93618 ?auto_93620 ) ) ( not ( = ?auto_93618 ?auto_93621 ) ) ( not ( = ?auto_93619 ?auto_93620 ) ) ( not ( = ?auto_93619 ?auto_93621 ) ) ( not ( = ?auto_93620 ?auto_93621 ) ) ( ON ?auto_93621 ?auto_93622 ) ( not ( = ?auto_93615 ?auto_93622 ) ) ( not ( = ?auto_93616 ?auto_93622 ) ) ( not ( = ?auto_93617 ?auto_93622 ) ) ( not ( = ?auto_93618 ?auto_93622 ) ) ( not ( = ?auto_93619 ?auto_93622 ) ) ( not ( = ?auto_93620 ?auto_93622 ) ) ( not ( = ?auto_93621 ?auto_93622 ) ) ( ON ?auto_93620 ?auto_93621 ) ( ON-TABLE ?auto_93622 ) ( ON ?auto_93619 ?auto_93620 ) ( ON ?auto_93618 ?auto_93619 ) ( CLEAR ?auto_93616 ) ( ON ?auto_93617 ?auto_93618 ) ( CLEAR ?auto_93617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93622 ?auto_93621 ?auto_93620 ?auto_93619 ?auto_93618 )
      ( MAKE-7PILE ?auto_93615 ?auto_93616 ?auto_93617 ?auto_93618 ?auto_93619 ?auto_93620 ?auto_93621 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93623 - BLOCK
      ?auto_93624 - BLOCK
      ?auto_93625 - BLOCK
      ?auto_93626 - BLOCK
      ?auto_93627 - BLOCK
      ?auto_93628 - BLOCK
      ?auto_93629 - BLOCK
    )
    :vars
    (
      ?auto_93630 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93623 ) ( not ( = ?auto_93623 ?auto_93624 ) ) ( not ( = ?auto_93623 ?auto_93625 ) ) ( not ( = ?auto_93623 ?auto_93626 ) ) ( not ( = ?auto_93623 ?auto_93627 ) ) ( not ( = ?auto_93623 ?auto_93628 ) ) ( not ( = ?auto_93623 ?auto_93629 ) ) ( not ( = ?auto_93624 ?auto_93625 ) ) ( not ( = ?auto_93624 ?auto_93626 ) ) ( not ( = ?auto_93624 ?auto_93627 ) ) ( not ( = ?auto_93624 ?auto_93628 ) ) ( not ( = ?auto_93624 ?auto_93629 ) ) ( not ( = ?auto_93625 ?auto_93626 ) ) ( not ( = ?auto_93625 ?auto_93627 ) ) ( not ( = ?auto_93625 ?auto_93628 ) ) ( not ( = ?auto_93625 ?auto_93629 ) ) ( not ( = ?auto_93626 ?auto_93627 ) ) ( not ( = ?auto_93626 ?auto_93628 ) ) ( not ( = ?auto_93626 ?auto_93629 ) ) ( not ( = ?auto_93627 ?auto_93628 ) ) ( not ( = ?auto_93627 ?auto_93629 ) ) ( not ( = ?auto_93628 ?auto_93629 ) ) ( ON ?auto_93629 ?auto_93630 ) ( not ( = ?auto_93623 ?auto_93630 ) ) ( not ( = ?auto_93624 ?auto_93630 ) ) ( not ( = ?auto_93625 ?auto_93630 ) ) ( not ( = ?auto_93626 ?auto_93630 ) ) ( not ( = ?auto_93627 ?auto_93630 ) ) ( not ( = ?auto_93628 ?auto_93630 ) ) ( not ( = ?auto_93629 ?auto_93630 ) ) ( ON ?auto_93628 ?auto_93629 ) ( ON-TABLE ?auto_93630 ) ( ON ?auto_93627 ?auto_93628 ) ( ON ?auto_93626 ?auto_93627 ) ( ON ?auto_93625 ?auto_93626 ) ( CLEAR ?auto_93625 ) ( HOLDING ?auto_93624 ) ( CLEAR ?auto_93623 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93623 ?auto_93624 )
      ( MAKE-7PILE ?auto_93623 ?auto_93624 ?auto_93625 ?auto_93626 ?auto_93627 ?auto_93628 ?auto_93629 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93631 - BLOCK
      ?auto_93632 - BLOCK
      ?auto_93633 - BLOCK
      ?auto_93634 - BLOCK
      ?auto_93635 - BLOCK
      ?auto_93636 - BLOCK
      ?auto_93637 - BLOCK
    )
    :vars
    (
      ?auto_93638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93631 ) ( not ( = ?auto_93631 ?auto_93632 ) ) ( not ( = ?auto_93631 ?auto_93633 ) ) ( not ( = ?auto_93631 ?auto_93634 ) ) ( not ( = ?auto_93631 ?auto_93635 ) ) ( not ( = ?auto_93631 ?auto_93636 ) ) ( not ( = ?auto_93631 ?auto_93637 ) ) ( not ( = ?auto_93632 ?auto_93633 ) ) ( not ( = ?auto_93632 ?auto_93634 ) ) ( not ( = ?auto_93632 ?auto_93635 ) ) ( not ( = ?auto_93632 ?auto_93636 ) ) ( not ( = ?auto_93632 ?auto_93637 ) ) ( not ( = ?auto_93633 ?auto_93634 ) ) ( not ( = ?auto_93633 ?auto_93635 ) ) ( not ( = ?auto_93633 ?auto_93636 ) ) ( not ( = ?auto_93633 ?auto_93637 ) ) ( not ( = ?auto_93634 ?auto_93635 ) ) ( not ( = ?auto_93634 ?auto_93636 ) ) ( not ( = ?auto_93634 ?auto_93637 ) ) ( not ( = ?auto_93635 ?auto_93636 ) ) ( not ( = ?auto_93635 ?auto_93637 ) ) ( not ( = ?auto_93636 ?auto_93637 ) ) ( ON ?auto_93637 ?auto_93638 ) ( not ( = ?auto_93631 ?auto_93638 ) ) ( not ( = ?auto_93632 ?auto_93638 ) ) ( not ( = ?auto_93633 ?auto_93638 ) ) ( not ( = ?auto_93634 ?auto_93638 ) ) ( not ( = ?auto_93635 ?auto_93638 ) ) ( not ( = ?auto_93636 ?auto_93638 ) ) ( not ( = ?auto_93637 ?auto_93638 ) ) ( ON ?auto_93636 ?auto_93637 ) ( ON-TABLE ?auto_93638 ) ( ON ?auto_93635 ?auto_93636 ) ( ON ?auto_93634 ?auto_93635 ) ( ON ?auto_93633 ?auto_93634 ) ( CLEAR ?auto_93631 ) ( ON ?auto_93632 ?auto_93633 ) ( CLEAR ?auto_93632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93638 ?auto_93637 ?auto_93636 ?auto_93635 ?auto_93634 ?auto_93633 )
      ( MAKE-7PILE ?auto_93631 ?auto_93632 ?auto_93633 ?auto_93634 ?auto_93635 ?auto_93636 ?auto_93637 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93639 - BLOCK
      ?auto_93640 - BLOCK
      ?auto_93641 - BLOCK
      ?auto_93642 - BLOCK
      ?auto_93643 - BLOCK
      ?auto_93644 - BLOCK
      ?auto_93645 - BLOCK
    )
    :vars
    (
      ?auto_93646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93639 ?auto_93640 ) ) ( not ( = ?auto_93639 ?auto_93641 ) ) ( not ( = ?auto_93639 ?auto_93642 ) ) ( not ( = ?auto_93639 ?auto_93643 ) ) ( not ( = ?auto_93639 ?auto_93644 ) ) ( not ( = ?auto_93639 ?auto_93645 ) ) ( not ( = ?auto_93640 ?auto_93641 ) ) ( not ( = ?auto_93640 ?auto_93642 ) ) ( not ( = ?auto_93640 ?auto_93643 ) ) ( not ( = ?auto_93640 ?auto_93644 ) ) ( not ( = ?auto_93640 ?auto_93645 ) ) ( not ( = ?auto_93641 ?auto_93642 ) ) ( not ( = ?auto_93641 ?auto_93643 ) ) ( not ( = ?auto_93641 ?auto_93644 ) ) ( not ( = ?auto_93641 ?auto_93645 ) ) ( not ( = ?auto_93642 ?auto_93643 ) ) ( not ( = ?auto_93642 ?auto_93644 ) ) ( not ( = ?auto_93642 ?auto_93645 ) ) ( not ( = ?auto_93643 ?auto_93644 ) ) ( not ( = ?auto_93643 ?auto_93645 ) ) ( not ( = ?auto_93644 ?auto_93645 ) ) ( ON ?auto_93645 ?auto_93646 ) ( not ( = ?auto_93639 ?auto_93646 ) ) ( not ( = ?auto_93640 ?auto_93646 ) ) ( not ( = ?auto_93641 ?auto_93646 ) ) ( not ( = ?auto_93642 ?auto_93646 ) ) ( not ( = ?auto_93643 ?auto_93646 ) ) ( not ( = ?auto_93644 ?auto_93646 ) ) ( not ( = ?auto_93645 ?auto_93646 ) ) ( ON ?auto_93644 ?auto_93645 ) ( ON-TABLE ?auto_93646 ) ( ON ?auto_93643 ?auto_93644 ) ( ON ?auto_93642 ?auto_93643 ) ( ON ?auto_93641 ?auto_93642 ) ( ON ?auto_93640 ?auto_93641 ) ( CLEAR ?auto_93640 ) ( HOLDING ?auto_93639 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93639 )
      ( MAKE-7PILE ?auto_93639 ?auto_93640 ?auto_93641 ?auto_93642 ?auto_93643 ?auto_93644 ?auto_93645 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93647 - BLOCK
      ?auto_93648 - BLOCK
      ?auto_93649 - BLOCK
      ?auto_93650 - BLOCK
      ?auto_93651 - BLOCK
      ?auto_93652 - BLOCK
      ?auto_93653 - BLOCK
    )
    :vars
    (
      ?auto_93654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93647 ?auto_93648 ) ) ( not ( = ?auto_93647 ?auto_93649 ) ) ( not ( = ?auto_93647 ?auto_93650 ) ) ( not ( = ?auto_93647 ?auto_93651 ) ) ( not ( = ?auto_93647 ?auto_93652 ) ) ( not ( = ?auto_93647 ?auto_93653 ) ) ( not ( = ?auto_93648 ?auto_93649 ) ) ( not ( = ?auto_93648 ?auto_93650 ) ) ( not ( = ?auto_93648 ?auto_93651 ) ) ( not ( = ?auto_93648 ?auto_93652 ) ) ( not ( = ?auto_93648 ?auto_93653 ) ) ( not ( = ?auto_93649 ?auto_93650 ) ) ( not ( = ?auto_93649 ?auto_93651 ) ) ( not ( = ?auto_93649 ?auto_93652 ) ) ( not ( = ?auto_93649 ?auto_93653 ) ) ( not ( = ?auto_93650 ?auto_93651 ) ) ( not ( = ?auto_93650 ?auto_93652 ) ) ( not ( = ?auto_93650 ?auto_93653 ) ) ( not ( = ?auto_93651 ?auto_93652 ) ) ( not ( = ?auto_93651 ?auto_93653 ) ) ( not ( = ?auto_93652 ?auto_93653 ) ) ( ON ?auto_93653 ?auto_93654 ) ( not ( = ?auto_93647 ?auto_93654 ) ) ( not ( = ?auto_93648 ?auto_93654 ) ) ( not ( = ?auto_93649 ?auto_93654 ) ) ( not ( = ?auto_93650 ?auto_93654 ) ) ( not ( = ?auto_93651 ?auto_93654 ) ) ( not ( = ?auto_93652 ?auto_93654 ) ) ( not ( = ?auto_93653 ?auto_93654 ) ) ( ON ?auto_93652 ?auto_93653 ) ( ON-TABLE ?auto_93654 ) ( ON ?auto_93651 ?auto_93652 ) ( ON ?auto_93650 ?auto_93651 ) ( ON ?auto_93649 ?auto_93650 ) ( ON ?auto_93648 ?auto_93649 ) ( ON ?auto_93647 ?auto_93648 ) ( CLEAR ?auto_93647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93654 ?auto_93653 ?auto_93652 ?auto_93651 ?auto_93650 ?auto_93649 ?auto_93648 )
      ( MAKE-7PILE ?auto_93647 ?auto_93648 ?auto_93649 ?auto_93650 ?auto_93651 ?auto_93652 ?auto_93653 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93661 - BLOCK
      ?auto_93662 - BLOCK
      ?auto_93663 - BLOCK
      ?auto_93664 - BLOCK
      ?auto_93665 - BLOCK
      ?auto_93666 - BLOCK
    )
    :vars
    (
      ?auto_93667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93667 ?auto_93666 ) ( CLEAR ?auto_93667 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93661 ) ( ON ?auto_93662 ?auto_93661 ) ( ON ?auto_93663 ?auto_93662 ) ( ON ?auto_93664 ?auto_93663 ) ( ON ?auto_93665 ?auto_93664 ) ( ON ?auto_93666 ?auto_93665 ) ( not ( = ?auto_93661 ?auto_93662 ) ) ( not ( = ?auto_93661 ?auto_93663 ) ) ( not ( = ?auto_93661 ?auto_93664 ) ) ( not ( = ?auto_93661 ?auto_93665 ) ) ( not ( = ?auto_93661 ?auto_93666 ) ) ( not ( = ?auto_93661 ?auto_93667 ) ) ( not ( = ?auto_93662 ?auto_93663 ) ) ( not ( = ?auto_93662 ?auto_93664 ) ) ( not ( = ?auto_93662 ?auto_93665 ) ) ( not ( = ?auto_93662 ?auto_93666 ) ) ( not ( = ?auto_93662 ?auto_93667 ) ) ( not ( = ?auto_93663 ?auto_93664 ) ) ( not ( = ?auto_93663 ?auto_93665 ) ) ( not ( = ?auto_93663 ?auto_93666 ) ) ( not ( = ?auto_93663 ?auto_93667 ) ) ( not ( = ?auto_93664 ?auto_93665 ) ) ( not ( = ?auto_93664 ?auto_93666 ) ) ( not ( = ?auto_93664 ?auto_93667 ) ) ( not ( = ?auto_93665 ?auto_93666 ) ) ( not ( = ?auto_93665 ?auto_93667 ) ) ( not ( = ?auto_93666 ?auto_93667 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93667 ?auto_93666 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93683 - BLOCK
      ?auto_93684 - BLOCK
      ?auto_93685 - BLOCK
      ?auto_93686 - BLOCK
      ?auto_93687 - BLOCK
      ?auto_93688 - BLOCK
    )
    :vars
    (
      ?auto_93689 - BLOCK
      ?auto_93690 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93683 ) ( ON ?auto_93684 ?auto_93683 ) ( ON ?auto_93685 ?auto_93684 ) ( ON ?auto_93686 ?auto_93685 ) ( ON ?auto_93687 ?auto_93686 ) ( not ( = ?auto_93683 ?auto_93684 ) ) ( not ( = ?auto_93683 ?auto_93685 ) ) ( not ( = ?auto_93683 ?auto_93686 ) ) ( not ( = ?auto_93683 ?auto_93687 ) ) ( not ( = ?auto_93683 ?auto_93688 ) ) ( not ( = ?auto_93683 ?auto_93689 ) ) ( not ( = ?auto_93684 ?auto_93685 ) ) ( not ( = ?auto_93684 ?auto_93686 ) ) ( not ( = ?auto_93684 ?auto_93687 ) ) ( not ( = ?auto_93684 ?auto_93688 ) ) ( not ( = ?auto_93684 ?auto_93689 ) ) ( not ( = ?auto_93685 ?auto_93686 ) ) ( not ( = ?auto_93685 ?auto_93687 ) ) ( not ( = ?auto_93685 ?auto_93688 ) ) ( not ( = ?auto_93685 ?auto_93689 ) ) ( not ( = ?auto_93686 ?auto_93687 ) ) ( not ( = ?auto_93686 ?auto_93688 ) ) ( not ( = ?auto_93686 ?auto_93689 ) ) ( not ( = ?auto_93687 ?auto_93688 ) ) ( not ( = ?auto_93687 ?auto_93689 ) ) ( not ( = ?auto_93688 ?auto_93689 ) ) ( ON ?auto_93689 ?auto_93690 ) ( CLEAR ?auto_93689 ) ( not ( = ?auto_93683 ?auto_93690 ) ) ( not ( = ?auto_93684 ?auto_93690 ) ) ( not ( = ?auto_93685 ?auto_93690 ) ) ( not ( = ?auto_93686 ?auto_93690 ) ) ( not ( = ?auto_93687 ?auto_93690 ) ) ( not ( = ?auto_93688 ?auto_93690 ) ) ( not ( = ?auto_93689 ?auto_93690 ) ) ( HOLDING ?auto_93688 ) ( CLEAR ?auto_93687 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93683 ?auto_93684 ?auto_93685 ?auto_93686 ?auto_93687 ?auto_93688 ?auto_93689 )
      ( MAKE-6PILE ?auto_93683 ?auto_93684 ?auto_93685 ?auto_93686 ?auto_93687 ?auto_93688 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93691 - BLOCK
      ?auto_93692 - BLOCK
      ?auto_93693 - BLOCK
      ?auto_93694 - BLOCK
      ?auto_93695 - BLOCK
      ?auto_93696 - BLOCK
    )
    :vars
    (
      ?auto_93698 - BLOCK
      ?auto_93697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93691 ) ( ON ?auto_93692 ?auto_93691 ) ( ON ?auto_93693 ?auto_93692 ) ( ON ?auto_93694 ?auto_93693 ) ( ON ?auto_93695 ?auto_93694 ) ( not ( = ?auto_93691 ?auto_93692 ) ) ( not ( = ?auto_93691 ?auto_93693 ) ) ( not ( = ?auto_93691 ?auto_93694 ) ) ( not ( = ?auto_93691 ?auto_93695 ) ) ( not ( = ?auto_93691 ?auto_93696 ) ) ( not ( = ?auto_93691 ?auto_93698 ) ) ( not ( = ?auto_93692 ?auto_93693 ) ) ( not ( = ?auto_93692 ?auto_93694 ) ) ( not ( = ?auto_93692 ?auto_93695 ) ) ( not ( = ?auto_93692 ?auto_93696 ) ) ( not ( = ?auto_93692 ?auto_93698 ) ) ( not ( = ?auto_93693 ?auto_93694 ) ) ( not ( = ?auto_93693 ?auto_93695 ) ) ( not ( = ?auto_93693 ?auto_93696 ) ) ( not ( = ?auto_93693 ?auto_93698 ) ) ( not ( = ?auto_93694 ?auto_93695 ) ) ( not ( = ?auto_93694 ?auto_93696 ) ) ( not ( = ?auto_93694 ?auto_93698 ) ) ( not ( = ?auto_93695 ?auto_93696 ) ) ( not ( = ?auto_93695 ?auto_93698 ) ) ( not ( = ?auto_93696 ?auto_93698 ) ) ( ON ?auto_93698 ?auto_93697 ) ( not ( = ?auto_93691 ?auto_93697 ) ) ( not ( = ?auto_93692 ?auto_93697 ) ) ( not ( = ?auto_93693 ?auto_93697 ) ) ( not ( = ?auto_93694 ?auto_93697 ) ) ( not ( = ?auto_93695 ?auto_93697 ) ) ( not ( = ?auto_93696 ?auto_93697 ) ) ( not ( = ?auto_93698 ?auto_93697 ) ) ( CLEAR ?auto_93695 ) ( ON ?auto_93696 ?auto_93698 ) ( CLEAR ?auto_93696 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93697 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93697 ?auto_93698 )
      ( MAKE-6PILE ?auto_93691 ?auto_93692 ?auto_93693 ?auto_93694 ?auto_93695 ?auto_93696 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93699 - BLOCK
      ?auto_93700 - BLOCK
      ?auto_93701 - BLOCK
      ?auto_93702 - BLOCK
      ?auto_93703 - BLOCK
      ?auto_93704 - BLOCK
    )
    :vars
    (
      ?auto_93706 - BLOCK
      ?auto_93705 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93699 ) ( ON ?auto_93700 ?auto_93699 ) ( ON ?auto_93701 ?auto_93700 ) ( ON ?auto_93702 ?auto_93701 ) ( not ( = ?auto_93699 ?auto_93700 ) ) ( not ( = ?auto_93699 ?auto_93701 ) ) ( not ( = ?auto_93699 ?auto_93702 ) ) ( not ( = ?auto_93699 ?auto_93703 ) ) ( not ( = ?auto_93699 ?auto_93704 ) ) ( not ( = ?auto_93699 ?auto_93706 ) ) ( not ( = ?auto_93700 ?auto_93701 ) ) ( not ( = ?auto_93700 ?auto_93702 ) ) ( not ( = ?auto_93700 ?auto_93703 ) ) ( not ( = ?auto_93700 ?auto_93704 ) ) ( not ( = ?auto_93700 ?auto_93706 ) ) ( not ( = ?auto_93701 ?auto_93702 ) ) ( not ( = ?auto_93701 ?auto_93703 ) ) ( not ( = ?auto_93701 ?auto_93704 ) ) ( not ( = ?auto_93701 ?auto_93706 ) ) ( not ( = ?auto_93702 ?auto_93703 ) ) ( not ( = ?auto_93702 ?auto_93704 ) ) ( not ( = ?auto_93702 ?auto_93706 ) ) ( not ( = ?auto_93703 ?auto_93704 ) ) ( not ( = ?auto_93703 ?auto_93706 ) ) ( not ( = ?auto_93704 ?auto_93706 ) ) ( ON ?auto_93706 ?auto_93705 ) ( not ( = ?auto_93699 ?auto_93705 ) ) ( not ( = ?auto_93700 ?auto_93705 ) ) ( not ( = ?auto_93701 ?auto_93705 ) ) ( not ( = ?auto_93702 ?auto_93705 ) ) ( not ( = ?auto_93703 ?auto_93705 ) ) ( not ( = ?auto_93704 ?auto_93705 ) ) ( not ( = ?auto_93706 ?auto_93705 ) ) ( ON ?auto_93704 ?auto_93706 ) ( CLEAR ?auto_93704 ) ( ON-TABLE ?auto_93705 ) ( HOLDING ?auto_93703 ) ( CLEAR ?auto_93702 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93699 ?auto_93700 ?auto_93701 ?auto_93702 ?auto_93703 )
      ( MAKE-6PILE ?auto_93699 ?auto_93700 ?auto_93701 ?auto_93702 ?auto_93703 ?auto_93704 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93707 - BLOCK
      ?auto_93708 - BLOCK
      ?auto_93709 - BLOCK
      ?auto_93710 - BLOCK
      ?auto_93711 - BLOCK
      ?auto_93712 - BLOCK
    )
    :vars
    (
      ?auto_93713 - BLOCK
      ?auto_93714 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93707 ) ( ON ?auto_93708 ?auto_93707 ) ( ON ?auto_93709 ?auto_93708 ) ( ON ?auto_93710 ?auto_93709 ) ( not ( = ?auto_93707 ?auto_93708 ) ) ( not ( = ?auto_93707 ?auto_93709 ) ) ( not ( = ?auto_93707 ?auto_93710 ) ) ( not ( = ?auto_93707 ?auto_93711 ) ) ( not ( = ?auto_93707 ?auto_93712 ) ) ( not ( = ?auto_93707 ?auto_93713 ) ) ( not ( = ?auto_93708 ?auto_93709 ) ) ( not ( = ?auto_93708 ?auto_93710 ) ) ( not ( = ?auto_93708 ?auto_93711 ) ) ( not ( = ?auto_93708 ?auto_93712 ) ) ( not ( = ?auto_93708 ?auto_93713 ) ) ( not ( = ?auto_93709 ?auto_93710 ) ) ( not ( = ?auto_93709 ?auto_93711 ) ) ( not ( = ?auto_93709 ?auto_93712 ) ) ( not ( = ?auto_93709 ?auto_93713 ) ) ( not ( = ?auto_93710 ?auto_93711 ) ) ( not ( = ?auto_93710 ?auto_93712 ) ) ( not ( = ?auto_93710 ?auto_93713 ) ) ( not ( = ?auto_93711 ?auto_93712 ) ) ( not ( = ?auto_93711 ?auto_93713 ) ) ( not ( = ?auto_93712 ?auto_93713 ) ) ( ON ?auto_93713 ?auto_93714 ) ( not ( = ?auto_93707 ?auto_93714 ) ) ( not ( = ?auto_93708 ?auto_93714 ) ) ( not ( = ?auto_93709 ?auto_93714 ) ) ( not ( = ?auto_93710 ?auto_93714 ) ) ( not ( = ?auto_93711 ?auto_93714 ) ) ( not ( = ?auto_93712 ?auto_93714 ) ) ( not ( = ?auto_93713 ?auto_93714 ) ) ( ON ?auto_93712 ?auto_93713 ) ( ON-TABLE ?auto_93714 ) ( CLEAR ?auto_93710 ) ( ON ?auto_93711 ?auto_93712 ) ( CLEAR ?auto_93711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93714 ?auto_93713 ?auto_93712 )
      ( MAKE-6PILE ?auto_93707 ?auto_93708 ?auto_93709 ?auto_93710 ?auto_93711 ?auto_93712 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93715 - BLOCK
      ?auto_93716 - BLOCK
      ?auto_93717 - BLOCK
      ?auto_93718 - BLOCK
      ?auto_93719 - BLOCK
      ?auto_93720 - BLOCK
    )
    :vars
    (
      ?auto_93721 - BLOCK
      ?auto_93722 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93715 ) ( ON ?auto_93716 ?auto_93715 ) ( ON ?auto_93717 ?auto_93716 ) ( not ( = ?auto_93715 ?auto_93716 ) ) ( not ( = ?auto_93715 ?auto_93717 ) ) ( not ( = ?auto_93715 ?auto_93718 ) ) ( not ( = ?auto_93715 ?auto_93719 ) ) ( not ( = ?auto_93715 ?auto_93720 ) ) ( not ( = ?auto_93715 ?auto_93721 ) ) ( not ( = ?auto_93716 ?auto_93717 ) ) ( not ( = ?auto_93716 ?auto_93718 ) ) ( not ( = ?auto_93716 ?auto_93719 ) ) ( not ( = ?auto_93716 ?auto_93720 ) ) ( not ( = ?auto_93716 ?auto_93721 ) ) ( not ( = ?auto_93717 ?auto_93718 ) ) ( not ( = ?auto_93717 ?auto_93719 ) ) ( not ( = ?auto_93717 ?auto_93720 ) ) ( not ( = ?auto_93717 ?auto_93721 ) ) ( not ( = ?auto_93718 ?auto_93719 ) ) ( not ( = ?auto_93718 ?auto_93720 ) ) ( not ( = ?auto_93718 ?auto_93721 ) ) ( not ( = ?auto_93719 ?auto_93720 ) ) ( not ( = ?auto_93719 ?auto_93721 ) ) ( not ( = ?auto_93720 ?auto_93721 ) ) ( ON ?auto_93721 ?auto_93722 ) ( not ( = ?auto_93715 ?auto_93722 ) ) ( not ( = ?auto_93716 ?auto_93722 ) ) ( not ( = ?auto_93717 ?auto_93722 ) ) ( not ( = ?auto_93718 ?auto_93722 ) ) ( not ( = ?auto_93719 ?auto_93722 ) ) ( not ( = ?auto_93720 ?auto_93722 ) ) ( not ( = ?auto_93721 ?auto_93722 ) ) ( ON ?auto_93720 ?auto_93721 ) ( ON-TABLE ?auto_93722 ) ( ON ?auto_93719 ?auto_93720 ) ( CLEAR ?auto_93719 ) ( HOLDING ?auto_93718 ) ( CLEAR ?auto_93717 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93715 ?auto_93716 ?auto_93717 ?auto_93718 )
      ( MAKE-6PILE ?auto_93715 ?auto_93716 ?auto_93717 ?auto_93718 ?auto_93719 ?auto_93720 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93723 - BLOCK
      ?auto_93724 - BLOCK
      ?auto_93725 - BLOCK
      ?auto_93726 - BLOCK
      ?auto_93727 - BLOCK
      ?auto_93728 - BLOCK
    )
    :vars
    (
      ?auto_93729 - BLOCK
      ?auto_93730 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93723 ) ( ON ?auto_93724 ?auto_93723 ) ( ON ?auto_93725 ?auto_93724 ) ( not ( = ?auto_93723 ?auto_93724 ) ) ( not ( = ?auto_93723 ?auto_93725 ) ) ( not ( = ?auto_93723 ?auto_93726 ) ) ( not ( = ?auto_93723 ?auto_93727 ) ) ( not ( = ?auto_93723 ?auto_93728 ) ) ( not ( = ?auto_93723 ?auto_93729 ) ) ( not ( = ?auto_93724 ?auto_93725 ) ) ( not ( = ?auto_93724 ?auto_93726 ) ) ( not ( = ?auto_93724 ?auto_93727 ) ) ( not ( = ?auto_93724 ?auto_93728 ) ) ( not ( = ?auto_93724 ?auto_93729 ) ) ( not ( = ?auto_93725 ?auto_93726 ) ) ( not ( = ?auto_93725 ?auto_93727 ) ) ( not ( = ?auto_93725 ?auto_93728 ) ) ( not ( = ?auto_93725 ?auto_93729 ) ) ( not ( = ?auto_93726 ?auto_93727 ) ) ( not ( = ?auto_93726 ?auto_93728 ) ) ( not ( = ?auto_93726 ?auto_93729 ) ) ( not ( = ?auto_93727 ?auto_93728 ) ) ( not ( = ?auto_93727 ?auto_93729 ) ) ( not ( = ?auto_93728 ?auto_93729 ) ) ( ON ?auto_93729 ?auto_93730 ) ( not ( = ?auto_93723 ?auto_93730 ) ) ( not ( = ?auto_93724 ?auto_93730 ) ) ( not ( = ?auto_93725 ?auto_93730 ) ) ( not ( = ?auto_93726 ?auto_93730 ) ) ( not ( = ?auto_93727 ?auto_93730 ) ) ( not ( = ?auto_93728 ?auto_93730 ) ) ( not ( = ?auto_93729 ?auto_93730 ) ) ( ON ?auto_93728 ?auto_93729 ) ( ON-TABLE ?auto_93730 ) ( ON ?auto_93727 ?auto_93728 ) ( CLEAR ?auto_93725 ) ( ON ?auto_93726 ?auto_93727 ) ( CLEAR ?auto_93726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93730 ?auto_93729 ?auto_93728 ?auto_93727 )
      ( MAKE-6PILE ?auto_93723 ?auto_93724 ?auto_93725 ?auto_93726 ?auto_93727 ?auto_93728 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93731 - BLOCK
      ?auto_93732 - BLOCK
      ?auto_93733 - BLOCK
      ?auto_93734 - BLOCK
      ?auto_93735 - BLOCK
      ?auto_93736 - BLOCK
    )
    :vars
    (
      ?auto_93738 - BLOCK
      ?auto_93737 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93731 ) ( ON ?auto_93732 ?auto_93731 ) ( not ( = ?auto_93731 ?auto_93732 ) ) ( not ( = ?auto_93731 ?auto_93733 ) ) ( not ( = ?auto_93731 ?auto_93734 ) ) ( not ( = ?auto_93731 ?auto_93735 ) ) ( not ( = ?auto_93731 ?auto_93736 ) ) ( not ( = ?auto_93731 ?auto_93738 ) ) ( not ( = ?auto_93732 ?auto_93733 ) ) ( not ( = ?auto_93732 ?auto_93734 ) ) ( not ( = ?auto_93732 ?auto_93735 ) ) ( not ( = ?auto_93732 ?auto_93736 ) ) ( not ( = ?auto_93732 ?auto_93738 ) ) ( not ( = ?auto_93733 ?auto_93734 ) ) ( not ( = ?auto_93733 ?auto_93735 ) ) ( not ( = ?auto_93733 ?auto_93736 ) ) ( not ( = ?auto_93733 ?auto_93738 ) ) ( not ( = ?auto_93734 ?auto_93735 ) ) ( not ( = ?auto_93734 ?auto_93736 ) ) ( not ( = ?auto_93734 ?auto_93738 ) ) ( not ( = ?auto_93735 ?auto_93736 ) ) ( not ( = ?auto_93735 ?auto_93738 ) ) ( not ( = ?auto_93736 ?auto_93738 ) ) ( ON ?auto_93738 ?auto_93737 ) ( not ( = ?auto_93731 ?auto_93737 ) ) ( not ( = ?auto_93732 ?auto_93737 ) ) ( not ( = ?auto_93733 ?auto_93737 ) ) ( not ( = ?auto_93734 ?auto_93737 ) ) ( not ( = ?auto_93735 ?auto_93737 ) ) ( not ( = ?auto_93736 ?auto_93737 ) ) ( not ( = ?auto_93738 ?auto_93737 ) ) ( ON ?auto_93736 ?auto_93738 ) ( ON-TABLE ?auto_93737 ) ( ON ?auto_93735 ?auto_93736 ) ( ON ?auto_93734 ?auto_93735 ) ( CLEAR ?auto_93734 ) ( HOLDING ?auto_93733 ) ( CLEAR ?auto_93732 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93731 ?auto_93732 ?auto_93733 )
      ( MAKE-6PILE ?auto_93731 ?auto_93732 ?auto_93733 ?auto_93734 ?auto_93735 ?auto_93736 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93739 - BLOCK
      ?auto_93740 - BLOCK
      ?auto_93741 - BLOCK
      ?auto_93742 - BLOCK
      ?auto_93743 - BLOCK
      ?auto_93744 - BLOCK
    )
    :vars
    (
      ?auto_93745 - BLOCK
      ?auto_93746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93739 ) ( ON ?auto_93740 ?auto_93739 ) ( not ( = ?auto_93739 ?auto_93740 ) ) ( not ( = ?auto_93739 ?auto_93741 ) ) ( not ( = ?auto_93739 ?auto_93742 ) ) ( not ( = ?auto_93739 ?auto_93743 ) ) ( not ( = ?auto_93739 ?auto_93744 ) ) ( not ( = ?auto_93739 ?auto_93745 ) ) ( not ( = ?auto_93740 ?auto_93741 ) ) ( not ( = ?auto_93740 ?auto_93742 ) ) ( not ( = ?auto_93740 ?auto_93743 ) ) ( not ( = ?auto_93740 ?auto_93744 ) ) ( not ( = ?auto_93740 ?auto_93745 ) ) ( not ( = ?auto_93741 ?auto_93742 ) ) ( not ( = ?auto_93741 ?auto_93743 ) ) ( not ( = ?auto_93741 ?auto_93744 ) ) ( not ( = ?auto_93741 ?auto_93745 ) ) ( not ( = ?auto_93742 ?auto_93743 ) ) ( not ( = ?auto_93742 ?auto_93744 ) ) ( not ( = ?auto_93742 ?auto_93745 ) ) ( not ( = ?auto_93743 ?auto_93744 ) ) ( not ( = ?auto_93743 ?auto_93745 ) ) ( not ( = ?auto_93744 ?auto_93745 ) ) ( ON ?auto_93745 ?auto_93746 ) ( not ( = ?auto_93739 ?auto_93746 ) ) ( not ( = ?auto_93740 ?auto_93746 ) ) ( not ( = ?auto_93741 ?auto_93746 ) ) ( not ( = ?auto_93742 ?auto_93746 ) ) ( not ( = ?auto_93743 ?auto_93746 ) ) ( not ( = ?auto_93744 ?auto_93746 ) ) ( not ( = ?auto_93745 ?auto_93746 ) ) ( ON ?auto_93744 ?auto_93745 ) ( ON-TABLE ?auto_93746 ) ( ON ?auto_93743 ?auto_93744 ) ( ON ?auto_93742 ?auto_93743 ) ( CLEAR ?auto_93740 ) ( ON ?auto_93741 ?auto_93742 ) ( CLEAR ?auto_93741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93746 ?auto_93745 ?auto_93744 ?auto_93743 ?auto_93742 )
      ( MAKE-6PILE ?auto_93739 ?auto_93740 ?auto_93741 ?auto_93742 ?auto_93743 ?auto_93744 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93747 - BLOCK
      ?auto_93748 - BLOCK
      ?auto_93749 - BLOCK
      ?auto_93750 - BLOCK
      ?auto_93751 - BLOCK
      ?auto_93752 - BLOCK
    )
    :vars
    (
      ?auto_93754 - BLOCK
      ?auto_93753 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93747 ) ( not ( = ?auto_93747 ?auto_93748 ) ) ( not ( = ?auto_93747 ?auto_93749 ) ) ( not ( = ?auto_93747 ?auto_93750 ) ) ( not ( = ?auto_93747 ?auto_93751 ) ) ( not ( = ?auto_93747 ?auto_93752 ) ) ( not ( = ?auto_93747 ?auto_93754 ) ) ( not ( = ?auto_93748 ?auto_93749 ) ) ( not ( = ?auto_93748 ?auto_93750 ) ) ( not ( = ?auto_93748 ?auto_93751 ) ) ( not ( = ?auto_93748 ?auto_93752 ) ) ( not ( = ?auto_93748 ?auto_93754 ) ) ( not ( = ?auto_93749 ?auto_93750 ) ) ( not ( = ?auto_93749 ?auto_93751 ) ) ( not ( = ?auto_93749 ?auto_93752 ) ) ( not ( = ?auto_93749 ?auto_93754 ) ) ( not ( = ?auto_93750 ?auto_93751 ) ) ( not ( = ?auto_93750 ?auto_93752 ) ) ( not ( = ?auto_93750 ?auto_93754 ) ) ( not ( = ?auto_93751 ?auto_93752 ) ) ( not ( = ?auto_93751 ?auto_93754 ) ) ( not ( = ?auto_93752 ?auto_93754 ) ) ( ON ?auto_93754 ?auto_93753 ) ( not ( = ?auto_93747 ?auto_93753 ) ) ( not ( = ?auto_93748 ?auto_93753 ) ) ( not ( = ?auto_93749 ?auto_93753 ) ) ( not ( = ?auto_93750 ?auto_93753 ) ) ( not ( = ?auto_93751 ?auto_93753 ) ) ( not ( = ?auto_93752 ?auto_93753 ) ) ( not ( = ?auto_93754 ?auto_93753 ) ) ( ON ?auto_93752 ?auto_93754 ) ( ON-TABLE ?auto_93753 ) ( ON ?auto_93751 ?auto_93752 ) ( ON ?auto_93750 ?auto_93751 ) ( ON ?auto_93749 ?auto_93750 ) ( CLEAR ?auto_93749 ) ( HOLDING ?auto_93748 ) ( CLEAR ?auto_93747 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93747 ?auto_93748 )
      ( MAKE-6PILE ?auto_93747 ?auto_93748 ?auto_93749 ?auto_93750 ?auto_93751 ?auto_93752 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93755 - BLOCK
      ?auto_93756 - BLOCK
      ?auto_93757 - BLOCK
      ?auto_93758 - BLOCK
      ?auto_93759 - BLOCK
      ?auto_93760 - BLOCK
    )
    :vars
    (
      ?auto_93762 - BLOCK
      ?auto_93761 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93755 ) ( not ( = ?auto_93755 ?auto_93756 ) ) ( not ( = ?auto_93755 ?auto_93757 ) ) ( not ( = ?auto_93755 ?auto_93758 ) ) ( not ( = ?auto_93755 ?auto_93759 ) ) ( not ( = ?auto_93755 ?auto_93760 ) ) ( not ( = ?auto_93755 ?auto_93762 ) ) ( not ( = ?auto_93756 ?auto_93757 ) ) ( not ( = ?auto_93756 ?auto_93758 ) ) ( not ( = ?auto_93756 ?auto_93759 ) ) ( not ( = ?auto_93756 ?auto_93760 ) ) ( not ( = ?auto_93756 ?auto_93762 ) ) ( not ( = ?auto_93757 ?auto_93758 ) ) ( not ( = ?auto_93757 ?auto_93759 ) ) ( not ( = ?auto_93757 ?auto_93760 ) ) ( not ( = ?auto_93757 ?auto_93762 ) ) ( not ( = ?auto_93758 ?auto_93759 ) ) ( not ( = ?auto_93758 ?auto_93760 ) ) ( not ( = ?auto_93758 ?auto_93762 ) ) ( not ( = ?auto_93759 ?auto_93760 ) ) ( not ( = ?auto_93759 ?auto_93762 ) ) ( not ( = ?auto_93760 ?auto_93762 ) ) ( ON ?auto_93762 ?auto_93761 ) ( not ( = ?auto_93755 ?auto_93761 ) ) ( not ( = ?auto_93756 ?auto_93761 ) ) ( not ( = ?auto_93757 ?auto_93761 ) ) ( not ( = ?auto_93758 ?auto_93761 ) ) ( not ( = ?auto_93759 ?auto_93761 ) ) ( not ( = ?auto_93760 ?auto_93761 ) ) ( not ( = ?auto_93762 ?auto_93761 ) ) ( ON ?auto_93760 ?auto_93762 ) ( ON-TABLE ?auto_93761 ) ( ON ?auto_93759 ?auto_93760 ) ( ON ?auto_93758 ?auto_93759 ) ( ON ?auto_93757 ?auto_93758 ) ( CLEAR ?auto_93755 ) ( ON ?auto_93756 ?auto_93757 ) ( CLEAR ?auto_93756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93761 ?auto_93762 ?auto_93760 ?auto_93759 ?auto_93758 ?auto_93757 )
      ( MAKE-6PILE ?auto_93755 ?auto_93756 ?auto_93757 ?auto_93758 ?auto_93759 ?auto_93760 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93763 - BLOCK
      ?auto_93764 - BLOCK
      ?auto_93765 - BLOCK
      ?auto_93766 - BLOCK
      ?auto_93767 - BLOCK
      ?auto_93768 - BLOCK
    )
    :vars
    (
      ?auto_93769 - BLOCK
      ?auto_93770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93763 ?auto_93764 ) ) ( not ( = ?auto_93763 ?auto_93765 ) ) ( not ( = ?auto_93763 ?auto_93766 ) ) ( not ( = ?auto_93763 ?auto_93767 ) ) ( not ( = ?auto_93763 ?auto_93768 ) ) ( not ( = ?auto_93763 ?auto_93769 ) ) ( not ( = ?auto_93764 ?auto_93765 ) ) ( not ( = ?auto_93764 ?auto_93766 ) ) ( not ( = ?auto_93764 ?auto_93767 ) ) ( not ( = ?auto_93764 ?auto_93768 ) ) ( not ( = ?auto_93764 ?auto_93769 ) ) ( not ( = ?auto_93765 ?auto_93766 ) ) ( not ( = ?auto_93765 ?auto_93767 ) ) ( not ( = ?auto_93765 ?auto_93768 ) ) ( not ( = ?auto_93765 ?auto_93769 ) ) ( not ( = ?auto_93766 ?auto_93767 ) ) ( not ( = ?auto_93766 ?auto_93768 ) ) ( not ( = ?auto_93766 ?auto_93769 ) ) ( not ( = ?auto_93767 ?auto_93768 ) ) ( not ( = ?auto_93767 ?auto_93769 ) ) ( not ( = ?auto_93768 ?auto_93769 ) ) ( ON ?auto_93769 ?auto_93770 ) ( not ( = ?auto_93763 ?auto_93770 ) ) ( not ( = ?auto_93764 ?auto_93770 ) ) ( not ( = ?auto_93765 ?auto_93770 ) ) ( not ( = ?auto_93766 ?auto_93770 ) ) ( not ( = ?auto_93767 ?auto_93770 ) ) ( not ( = ?auto_93768 ?auto_93770 ) ) ( not ( = ?auto_93769 ?auto_93770 ) ) ( ON ?auto_93768 ?auto_93769 ) ( ON-TABLE ?auto_93770 ) ( ON ?auto_93767 ?auto_93768 ) ( ON ?auto_93766 ?auto_93767 ) ( ON ?auto_93765 ?auto_93766 ) ( ON ?auto_93764 ?auto_93765 ) ( CLEAR ?auto_93764 ) ( HOLDING ?auto_93763 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93763 )
      ( MAKE-6PILE ?auto_93763 ?auto_93764 ?auto_93765 ?auto_93766 ?auto_93767 ?auto_93768 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93771 - BLOCK
      ?auto_93772 - BLOCK
      ?auto_93773 - BLOCK
      ?auto_93774 - BLOCK
      ?auto_93775 - BLOCK
      ?auto_93776 - BLOCK
    )
    :vars
    (
      ?auto_93777 - BLOCK
      ?auto_93778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93771 ?auto_93772 ) ) ( not ( = ?auto_93771 ?auto_93773 ) ) ( not ( = ?auto_93771 ?auto_93774 ) ) ( not ( = ?auto_93771 ?auto_93775 ) ) ( not ( = ?auto_93771 ?auto_93776 ) ) ( not ( = ?auto_93771 ?auto_93777 ) ) ( not ( = ?auto_93772 ?auto_93773 ) ) ( not ( = ?auto_93772 ?auto_93774 ) ) ( not ( = ?auto_93772 ?auto_93775 ) ) ( not ( = ?auto_93772 ?auto_93776 ) ) ( not ( = ?auto_93772 ?auto_93777 ) ) ( not ( = ?auto_93773 ?auto_93774 ) ) ( not ( = ?auto_93773 ?auto_93775 ) ) ( not ( = ?auto_93773 ?auto_93776 ) ) ( not ( = ?auto_93773 ?auto_93777 ) ) ( not ( = ?auto_93774 ?auto_93775 ) ) ( not ( = ?auto_93774 ?auto_93776 ) ) ( not ( = ?auto_93774 ?auto_93777 ) ) ( not ( = ?auto_93775 ?auto_93776 ) ) ( not ( = ?auto_93775 ?auto_93777 ) ) ( not ( = ?auto_93776 ?auto_93777 ) ) ( ON ?auto_93777 ?auto_93778 ) ( not ( = ?auto_93771 ?auto_93778 ) ) ( not ( = ?auto_93772 ?auto_93778 ) ) ( not ( = ?auto_93773 ?auto_93778 ) ) ( not ( = ?auto_93774 ?auto_93778 ) ) ( not ( = ?auto_93775 ?auto_93778 ) ) ( not ( = ?auto_93776 ?auto_93778 ) ) ( not ( = ?auto_93777 ?auto_93778 ) ) ( ON ?auto_93776 ?auto_93777 ) ( ON-TABLE ?auto_93778 ) ( ON ?auto_93775 ?auto_93776 ) ( ON ?auto_93774 ?auto_93775 ) ( ON ?auto_93773 ?auto_93774 ) ( ON ?auto_93772 ?auto_93773 ) ( ON ?auto_93771 ?auto_93772 ) ( CLEAR ?auto_93771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93778 ?auto_93777 ?auto_93776 ?auto_93775 ?auto_93774 ?auto_93773 ?auto_93772 )
      ( MAKE-6PILE ?auto_93771 ?auto_93772 ?auto_93773 ?auto_93774 ?auto_93775 ?auto_93776 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93780 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_93780 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_93780 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93781 - BLOCK
    )
    :vars
    (
      ?auto_93782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93781 ?auto_93782 ) ( CLEAR ?auto_93781 ) ( HAND-EMPTY ) ( not ( = ?auto_93781 ?auto_93782 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93781 ?auto_93782 )
      ( MAKE-1PILE ?auto_93781 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93783 - BLOCK
    )
    :vars
    (
      ?auto_93784 - BLOCK
      ?auto_93788 - BLOCK
      ?auto_93787 - BLOCK
      ?auto_93786 - BLOCK
      ?auto_93789 - BLOCK
      ?auto_93785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93783 ?auto_93784 ) ) ( HOLDING ?auto_93783 ) ( CLEAR ?auto_93784 ) ( ON-TABLE ?auto_93788 ) ( ON ?auto_93787 ?auto_93788 ) ( ON ?auto_93786 ?auto_93787 ) ( ON ?auto_93789 ?auto_93786 ) ( ON ?auto_93785 ?auto_93789 ) ( ON ?auto_93784 ?auto_93785 ) ( not ( = ?auto_93788 ?auto_93787 ) ) ( not ( = ?auto_93788 ?auto_93786 ) ) ( not ( = ?auto_93788 ?auto_93789 ) ) ( not ( = ?auto_93788 ?auto_93785 ) ) ( not ( = ?auto_93788 ?auto_93784 ) ) ( not ( = ?auto_93788 ?auto_93783 ) ) ( not ( = ?auto_93787 ?auto_93786 ) ) ( not ( = ?auto_93787 ?auto_93789 ) ) ( not ( = ?auto_93787 ?auto_93785 ) ) ( not ( = ?auto_93787 ?auto_93784 ) ) ( not ( = ?auto_93787 ?auto_93783 ) ) ( not ( = ?auto_93786 ?auto_93789 ) ) ( not ( = ?auto_93786 ?auto_93785 ) ) ( not ( = ?auto_93786 ?auto_93784 ) ) ( not ( = ?auto_93786 ?auto_93783 ) ) ( not ( = ?auto_93789 ?auto_93785 ) ) ( not ( = ?auto_93789 ?auto_93784 ) ) ( not ( = ?auto_93789 ?auto_93783 ) ) ( not ( = ?auto_93785 ?auto_93784 ) ) ( not ( = ?auto_93785 ?auto_93783 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93788 ?auto_93787 ?auto_93786 ?auto_93789 ?auto_93785 ?auto_93784 ?auto_93783 )
      ( MAKE-1PILE ?auto_93783 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93790 - BLOCK
    )
    :vars
    (
      ?auto_93794 - BLOCK
      ?auto_93793 - BLOCK
      ?auto_93796 - BLOCK
      ?auto_93791 - BLOCK
      ?auto_93795 - BLOCK
      ?auto_93792 - BLOCK
      ?auto_93797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93790 ?auto_93794 ) ) ( CLEAR ?auto_93794 ) ( ON-TABLE ?auto_93793 ) ( ON ?auto_93796 ?auto_93793 ) ( ON ?auto_93791 ?auto_93796 ) ( ON ?auto_93795 ?auto_93791 ) ( ON ?auto_93792 ?auto_93795 ) ( ON ?auto_93794 ?auto_93792 ) ( not ( = ?auto_93793 ?auto_93796 ) ) ( not ( = ?auto_93793 ?auto_93791 ) ) ( not ( = ?auto_93793 ?auto_93795 ) ) ( not ( = ?auto_93793 ?auto_93792 ) ) ( not ( = ?auto_93793 ?auto_93794 ) ) ( not ( = ?auto_93793 ?auto_93790 ) ) ( not ( = ?auto_93796 ?auto_93791 ) ) ( not ( = ?auto_93796 ?auto_93795 ) ) ( not ( = ?auto_93796 ?auto_93792 ) ) ( not ( = ?auto_93796 ?auto_93794 ) ) ( not ( = ?auto_93796 ?auto_93790 ) ) ( not ( = ?auto_93791 ?auto_93795 ) ) ( not ( = ?auto_93791 ?auto_93792 ) ) ( not ( = ?auto_93791 ?auto_93794 ) ) ( not ( = ?auto_93791 ?auto_93790 ) ) ( not ( = ?auto_93795 ?auto_93792 ) ) ( not ( = ?auto_93795 ?auto_93794 ) ) ( not ( = ?auto_93795 ?auto_93790 ) ) ( not ( = ?auto_93792 ?auto_93794 ) ) ( not ( = ?auto_93792 ?auto_93790 ) ) ( ON ?auto_93790 ?auto_93797 ) ( CLEAR ?auto_93790 ) ( HAND-EMPTY ) ( not ( = ?auto_93790 ?auto_93797 ) ) ( not ( = ?auto_93794 ?auto_93797 ) ) ( not ( = ?auto_93793 ?auto_93797 ) ) ( not ( = ?auto_93796 ?auto_93797 ) ) ( not ( = ?auto_93791 ?auto_93797 ) ) ( not ( = ?auto_93795 ?auto_93797 ) ) ( not ( = ?auto_93792 ?auto_93797 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93790 ?auto_93797 )
      ( MAKE-1PILE ?auto_93790 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93798 - BLOCK
    )
    :vars
    (
      ?auto_93799 - BLOCK
      ?auto_93805 - BLOCK
      ?auto_93804 - BLOCK
      ?auto_93802 - BLOCK
      ?auto_93801 - BLOCK
      ?auto_93800 - BLOCK
      ?auto_93803 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93798 ?auto_93799 ) ) ( ON-TABLE ?auto_93805 ) ( ON ?auto_93804 ?auto_93805 ) ( ON ?auto_93802 ?auto_93804 ) ( ON ?auto_93801 ?auto_93802 ) ( ON ?auto_93800 ?auto_93801 ) ( not ( = ?auto_93805 ?auto_93804 ) ) ( not ( = ?auto_93805 ?auto_93802 ) ) ( not ( = ?auto_93805 ?auto_93801 ) ) ( not ( = ?auto_93805 ?auto_93800 ) ) ( not ( = ?auto_93805 ?auto_93799 ) ) ( not ( = ?auto_93805 ?auto_93798 ) ) ( not ( = ?auto_93804 ?auto_93802 ) ) ( not ( = ?auto_93804 ?auto_93801 ) ) ( not ( = ?auto_93804 ?auto_93800 ) ) ( not ( = ?auto_93804 ?auto_93799 ) ) ( not ( = ?auto_93804 ?auto_93798 ) ) ( not ( = ?auto_93802 ?auto_93801 ) ) ( not ( = ?auto_93802 ?auto_93800 ) ) ( not ( = ?auto_93802 ?auto_93799 ) ) ( not ( = ?auto_93802 ?auto_93798 ) ) ( not ( = ?auto_93801 ?auto_93800 ) ) ( not ( = ?auto_93801 ?auto_93799 ) ) ( not ( = ?auto_93801 ?auto_93798 ) ) ( not ( = ?auto_93800 ?auto_93799 ) ) ( not ( = ?auto_93800 ?auto_93798 ) ) ( ON ?auto_93798 ?auto_93803 ) ( CLEAR ?auto_93798 ) ( not ( = ?auto_93798 ?auto_93803 ) ) ( not ( = ?auto_93799 ?auto_93803 ) ) ( not ( = ?auto_93805 ?auto_93803 ) ) ( not ( = ?auto_93804 ?auto_93803 ) ) ( not ( = ?auto_93802 ?auto_93803 ) ) ( not ( = ?auto_93801 ?auto_93803 ) ) ( not ( = ?auto_93800 ?auto_93803 ) ) ( HOLDING ?auto_93799 ) ( CLEAR ?auto_93800 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93805 ?auto_93804 ?auto_93802 ?auto_93801 ?auto_93800 ?auto_93799 )
      ( MAKE-1PILE ?auto_93798 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93806 - BLOCK
    )
    :vars
    (
      ?auto_93809 - BLOCK
      ?auto_93812 - BLOCK
      ?auto_93808 - BLOCK
      ?auto_93813 - BLOCK
      ?auto_93807 - BLOCK
      ?auto_93811 - BLOCK
      ?auto_93810 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93806 ?auto_93809 ) ) ( ON-TABLE ?auto_93812 ) ( ON ?auto_93808 ?auto_93812 ) ( ON ?auto_93813 ?auto_93808 ) ( ON ?auto_93807 ?auto_93813 ) ( ON ?auto_93811 ?auto_93807 ) ( not ( = ?auto_93812 ?auto_93808 ) ) ( not ( = ?auto_93812 ?auto_93813 ) ) ( not ( = ?auto_93812 ?auto_93807 ) ) ( not ( = ?auto_93812 ?auto_93811 ) ) ( not ( = ?auto_93812 ?auto_93809 ) ) ( not ( = ?auto_93812 ?auto_93806 ) ) ( not ( = ?auto_93808 ?auto_93813 ) ) ( not ( = ?auto_93808 ?auto_93807 ) ) ( not ( = ?auto_93808 ?auto_93811 ) ) ( not ( = ?auto_93808 ?auto_93809 ) ) ( not ( = ?auto_93808 ?auto_93806 ) ) ( not ( = ?auto_93813 ?auto_93807 ) ) ( not ( = ?auto_93813 ?auto_93811 ) ) ( not ( = ?auto_93813 ?auto_93809 ) ) ( not ( = ?auto_93813 ?auto_93806 ) ) ( not ( = ?auto_93807 ?auto_93811 ) ) ( not ( = ?auto_93807 ?auto_93809 ) ) ( not ( = ?auto_93807 ?auto_93806 ) ) ( not ( = ?auto_93811 ?auto_93809 ) ) ( not ( = ?auto_93811 ?auto_93806 ) ) ( ON ?auto_93806 ?auto_93810 ) ( not ( = ?auto_93806 ?auto_93810 ) ) ( not ( = ?auto_93809 ?auto_93810 ) ) ( not ( = ?auto_93812 ?auto_93810 ) ) ( not ( = ?auto_93808 ?auto_93810 ) ) ( not ( = ?auto_93813 ?auto_93810 ) ) ( not ( = ?auto_93807 ?auto_93810 ) ) ( not ( = ?auto_93811 ?auto_93810 ) ) ( CLEAR ?auto_93811 ) ( ON ?auto_93809 ?auto_93806 ) ( CLEAR ?auto_93809 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93810 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93810 ?auto_93806 )
      ( MAKE-1PILE ?auto_93806 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93814 - BLOCK
    )
    :vars
    (
      ?auto_93815 - BLOCK
      ?auto_93819 - BLOCK
      ?auto_93818 - BLOCK
      ?auto_93820 - BLOCK
      ?auto_93817 - BLOCK
      ?auto_93816 - BLOCK
      ?auto_93821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93814 ?auto_93815 ) ) ( ON-TABLE ?auto_93819 ) ( ON ?auto_93818 ?auto_93819 ) ( ON ?auto_93820 ?auto_93818 ) ( ON ?auto_93817 ?auto_93820 ) ( not ( = ?auto_93819 ?auto_93818 ) ) ( not ( = ?auto_93819 ?auto_93820 ) ) ( not ( = ?auto_93819 ?auto_93817 ) ) ( not ( = ?auto_93819 ?auto_93816 ) ) ( not ( = ?auto_93819 ?auto_93815 ) ) ( not ( = ?auto_93819 ?auto_93814 ) ) ( not ( = ?auto_93818 ?auto_93820 ) ) ( not ( = ?auto_93818 ?auto_93817 ) ) ( not ( = ?auto_93818 ?auto_93816 ) ) ( not ( = ?auto_93818 ?auto_93815 ) ) ( not ( = ?auto_93818 ?auto_93814 ) ) ( not ( = ?auto_93820 ?auto_93817 ) ) ( not ( = ?auto_93820 ?auto_93816 ) ) ( not ( = ?auto_93820 ?auto_93815 ) ) ( not ( = ?auto_93820 ?auto_93814 ) ) ( not ( = ?auto_93817 ?auto_93816 ) ) ( not ( = ?auto_93817 ?auto_93815 ) ) ( not ( = ?auto_93817 ?auto_93814 ) ) ( not ( = ?auto_93816 ?auto_93815 ) ) ( not ( = ?auto_93816 ?auto_93814 ) ) ( ON ?auto_93814 ?auto_93821 ) ( not ( = ?auto_93814 ?auto_93821 ) ) ( not ( = ?auto_93815 ?auto_93821 ) ) ( not ( = ?auto_93819 ?auto_93821 ) ) ( not ( = ?auto_93818 ?auto_93821 ) ) ( not ( = ?auto_93820 ?auto_93821 ) ) ( not ( = ?auto_93817 ?auto_93821 ) ) ( not ( = ?auto_93816 ?auto_93821 ) ) ( ON ?auto_93815 ?auto_93814 ) ( CLEAR ?auto_93815 ) ( ON-TABLE ?auto_93821 ) ( HOLDING ?auto_93816 ) ( CLEAR ?auto_93817 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93819 ?auto_93818 ?auto_93820 ?auto_93817 ?auto_93816 )
      ( MAKE-1PILE ?auto_93814 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93822 - BLOCK
    )
    :vars
    (
      ?auto_93827 - BLOCK
      ?auto_93825 - BLOCK
      ?auto_93826 - BLOCK
      ?auto_93828 - BLOCK
      ?auto_93824 - BLOCK
      ?auto_93823 - BLOCK
      ?auto_93829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93822 ?auto_93827 ) ) ( ON-TABLE ?auto_93825 ) ( ON ?auto_93826 ?auto_93825 ) ( ON ?auto_93828 ?auto_93826 ) ( ON ?auto_93824 ?auto_93828 ) ( not ( = ?auto_93825 ?auto_93826 ) ) ( not ( = ?auto_93825 ?auto_93828 ) ) ( not ( = ?auto_93825 ?auto_93824 ) ) ( not ( = ?auto_93825 ?auto_93823 ) ) ( not ( = ?auto_93825 ?auto_93827 ) ) ( not ( = ?auto_93825 ?auto_93822 ) ) ( not ( = ?auto_93826 ?auto_93828 ) ) ( not ( = ?auto_93826 ?auto_93824 ) ) ( not ( = ?auto_93826 ?auto_93823 ) ) ( not ( = ?auto_93826 ?auto_93827 ) ) ( not ( = ?auto_93826 ?auto_93822 ) ) ( not ( = ?auto_93828 ?auto_93824 ) ) ( not ( = ?auto_93828 ?auto_93823 ) ) ( not ( = ?auto_93828 ?auto_93827 ) ) ( not ( = ?auto_93828 ?auto_93822 ) ) ( not ( = ?auto_93824 ?auto_93823 ) ) ( not ( = ?auto_93824 ?auto_93827 ) ) ( not ( = ?auto_93824 ?auto_93822 ) ) ( not ( = ?auto_93823 ?auto_93827 ) ) ( not ( = ?auto_93823 ?auto_93822 ) ) ( ON ?auto_93822 ?auto_93829 ) ( not ( = ?auto_93822 ?auto_93829 ) ) ( not ( = ?auto_93827 ?auto_93829 ) ) ( not ( = ?auto_93825 ?auto_93829 ) ) ( not ( = ?auto_93826 ?auto_93829 ) ) ( not ( = ?auto_93828 ?auto_93829 ) ) ( not ( = ?auto_93824 ?auto_93829 ) ) ( not ( = ?auto_93823 ?auto_93829 ) ) ( ON ?auto_93827 ?auto_93822 ) ( ON-TABLE ?auto_93829 ) ( CLEAR ?auto_93824 ) ( ON ?auto_93823 ?auto_93827 ) ( CLEAR ?auto_93823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93829 ?auto_93822 ?auto_93827 )
      ( MAKE-1PILE ?auto_93822 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93830 - BLOCK
    )
    :vars
    (
      ?auto_93831 - BLOCK
      ?auto_93836 - BLOCK
      ?auto_93835 - BLOCK
      ?auto_93834 - BLOCK
      ?auto_93837 - BLOCK
      ?auto_93832 - BLOCK
      ?auto_93833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93830 ?auto_93831 ) ) ( ON-TABLE ?auto_93836 ) ( ON ?auto_93835 ?auto_93836 ) ( ON ?auto_93834 ?auto_93835 ) ( not ( = ?auto_93836 ?auto_93835 ) ) ( not ( = ?auto_93836 ?auto_93834 ) ) ( not ( = ?auto_93836 ?auto_93837 ) ) ( not ( = ?auto_93836 ?auto_93832 ) ) ( not ( = ?auto_93836 ?auto_93831 ) ) ( not ( = ?auto_93836 ?auto_93830 ) ) ( not ( = ?auto_93835 ?auto_93834 ) ) ( not ( = ?auto_93835 ?auto_93837 ) ) ( not ( = ?auto_93835 ?auto_93832 ) ) ( not ( = ?auto_93835 ?auto_93831 ) ) ( not ( = ?auto_93835 ?auto_93830 ) ) ( not ( = ?auto_93834 ?auto_93837 ) ) ( not ( = ?auto_93834 ?auto_93832 ) ) ( not ( = ?auto_93834 ?auto_93831 ) ) ( not ( = ?auto_93834 ?auto_93830 ) ) ( not ( = ?auto_93837 ?auto_93832 ) ) ( not ( = ?auto_93837 ?auto_93831 ) ) ( not ( = ?auto_93837 ?auto_93830 ) ) ( not ( = ?auto_93832 ?auto_93831 ) ) ( not ( = ?auto_93832 ?auto_93830 ) ) ( ON ?auto_93830 ?auto_93833 ) ( not ( = ?auto_93830 ?auto_93833 ) ) ( not ( = ?auto_93831 ?auto_93833 ) ) ( not ( = ?auto_93836 ?auto_93833 ) ) ( not ( = ?auto_93835 ?auto_93833 ) ) ( not ( = ?auto_93834 ?auto_93833 ) ) ( not ( = ?auto_93837 ?auto_93833 ) ) ( not ( = ?auto_93832 ?auto_93833 ) ) ( ON ?auto_93831 ?auto_93830 ) ( ON-TABLE ?auto_93833 ) ( ON ?auto_93832 ?auto_93831 ) ( CLEAR ?auto_93832 ) ( HOLDING ?auto_93837 ) ( CLEAR ?auto_93834 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93836 ?auto_93835 ?auto_93834 ?auto_93837 )
      ( MAKE-1PILE ?auto_93830 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93838 - BLOCK
    )
    :vars
    (
      ?auto_93845 - BLOCK
      ?auto_93844 - BLOCK
      ?auto_93841 - BLOCK
      ?auto_93842 - BLOCK
      ?auto_93840 - BLOCK
      ?auto_93839 - BLOCK
      ?auto_93843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93838 ?auto_93845 ) ) ( ON-TABLE ?auto_93844 ) ( ON ?auto_93841 ?auto_93844 ) ( ON ?auto_93842 ?auto_93841 ) ( not ( = ?auto_93844 ?auto_93841 ) ) ( not ( = ?auto_93844 ?auto_93842 ) ) ( not ( = ?auto_93844 ?auto_93840 ) ) ( not ( = ?auto_93844 ?auto_93839 ) ) ( not ( = ?auto_93844 ?auto_93845 ) ) ( not ( = ?auto_93844 ?auto_93838 ) ) ( not ( = ?auto_93841 ?auto_93842 ) ) ( not ( = ?auto_93841 ?auto_93840 ) ) ( not ( = ?auto_93841 ?auto_93839 ) ) ( not ( = ?auto_93841 ?auto_93845 ) ) ( not ( = ?auto_93841 ?auto_93838 ) ) ( not ( = ?auto_93842 ?auto_93840 ) ) ( not ( = ?auto_93842 ?auto_93839 ) ) ( not ( = ?auto_93842 ?auto_93845 ) ) ( not ( = ?auto_93842 ?auto_93838 ) ) ( not ( = ?auto_93840 ?auto_93839 ) ) ( not ( = ?auto_93840 ?auto_93845 ) ) ( not ( = ?auto_93840 ?auto_93838 ) ) ( not ( = ?auto_93839 ?auto_93845 ) ) ( not ( = ?auto_93839 ?auto_93838 ) ) ( ON ?auto_93838 ?auto_93843 ) ( not ( = ?auto_93838 ?auto_93843 ) ) ( not ( = ?auto_93845 ?auto_93843 ) ) ( not ( = ?auto_93844 ?auto_93843 ) ) ( not ( = ?auto_93841 ?auto_93843 ) ) ( not ( = ?auto_93842 ?auto_93843 ) ) ( not ( = ?auto_93840 ?auto_93843 ) ) ( not ( = ?auto_93839 ?auto_93843 ) ) ( ON ?auto_93845 ?auto_93838 ) ( ON-TABLE ?auto_93843 ) ( ON ?auto_93839 ?auto_93845 ) ( CLEAR ?auto_93842 ) ( ON ?auto_93840 ?auto_93839 ) ( CLEAR ?auto_93840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93843 ?auto_93838 ?auto_93845 ?auto_93839 )
      ( MAKE-1PILE ?auto_93838 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93846 - BLOCK
    )
    :vars
    (
      ?auto_93850 - BLOCK
      ?auto_93849 - BLOCK
      ?auto_93852 - BLOCK
      ?auto_93851 - BLOCK
      ?auto_93847 - BLOCK
      ?auto_93848 - BLOCK
      ?auto_93853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93846 ?auto_93850 ) ) ( ON-TABLE ?auto_93849 ) ( ON ?auto_93852 ?auto_93849 ) ( not ( = ?auto_93849 ?auto_93852 ) ) ( not ( = ?auto_93849 ?auto_93851 ) ) ( not ( = ?auto_93849 ?auto_93847 ) ) ( not ( = ?auto_93849 ?auto_93848 ) ) ( not ( = ?auto_93849 ?auto_93850 ) ) ( not ( = ?auto_93849 ?auto_93846 ) ) ( not ( = ?auto_93852 ?auto_93851 ) ) ( not ( = ?auto_93852 ?auto_93847 ) ) ( not ( = ?auto_93852 ?auto_93848 ) ) ( not ( = ?auto_93852 ?auto_93850 ) ) ( not ( = ?auto_93852 ?auto_93846 ) ) ( not ( = ?auto_93851 ?auto_93847 ) ) ( not ( = ?auto_93851 ?auto_93848 ) ) ( not ( = ?auto_93851 ?auto_93850 ) ) ( not ( = ?auto_93851 ?auto_93846 ) ) ( not ( = ?auto_93847 ?auto_93848 ) ) ( not ( = ?auto_93847 ?auto_93850 ) ) ( not ( = ?auto_93847 ?auto_93846 ) ) ( not ( = ?auto_93848 ?auto_93850 ) ) ( not ( = ?auto_93848 ?auto_93846 ) ) ( ON ?auto_93846 ?auto_93853 ) ( not ( = ?auto_93846 ?auto_93853 ) ) ( not ( = ?auto_93850 ?auto_93853 ) ) ( not ( = ?auto_93849 ?auto_93853 ) ) ( not ( = ?auto_93852 ?auto_93853 ) ) ( not ( = ?auto_93851 ?auto_93853 ) ) ( not ( = ?auto_93847 ?auto_93853 ) ) ( not ( = ?auto_93848 ?auto_93853 ) ) ( ON ?auto_93850 ?auto_93846 ) ( ON-TABLE ?auto_93853 ) ( ON ?auto_93848 ?auto_93850 ) ( ON ?auto_93847 ?auto_93848 ) ( CLEAR ?auto_93847 ) ( HOLDING ?auto_93851 ) ( CLEAR ?auto_93852 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93849 ?auto_93852 ?auto_93851 )
      ( MAKE-1PILE ?auto_93846 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93854 - BLOCK
    )
    :vars
    (
      ?auto_93858 - BLOCK
      ?auto_93859 - BLOCK
      ?auto_93860 - BLOCK
      ?auto_93855 - BLOCK
      ?auto_93857 - BLOCK
      ?auto_93861 - BLOCK
      ?auto_93856 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93854 ?auto_93858 ) ) ( ON-TABLE ?auto_93859 ) ( ON ?auto_93860 ?auto_93859 ) ( not ( = ?auto_93859 ?auto_93860 ) ) ( not ( = ?auto_93859 ?auto_93855 ) ) ( not ( = ?auto_93859 ?auto_93857 ) ) ( not ( = ?auto_93859 ?auto_93861 ) ) ( not ( = ?auto_93859 ?auto_93858 ) ) ( not ( = ?auto_93859 ?auto_93854 ) ) ( not ( = ?auto_93860 ?auto_93855 ) ) ( not ( = ?auto_93860 ?auto_93857 ) ) ( not ( = ?auto_93860 ?auto_93861 ) ) ( not ( = ?auto_93860 ?auto_93858 ) ) ( not ( = ?auto_93860 ?auto_93854 ) ) ( not ( = ?auto_93855 ?auto_93857 ) ) ( not ( = ?auto_93855 ?auto_93861 ) ) ( not ( = ?auto_93855 ?auto_93858 ) ) ( not ( = ?auto_93855 ?auto_93854 ) ) ( not ( = ?auto_93857 ?auto_93861 ) ) ( not ( = ?auto_93857 ?auto_93858 ) ) ( not ( = ?auto_93857 ?auto_93854 ) ) ( not ( = ?auto_93861 ?auto_93858 ) ) ( not ( = ?auto_93861 ?auto_93854 ) ) ( ON ?auto_93854 ?auto_93856 ) ( not ( = ?auto_93854 ?auto_93856 ) ) ( not ( = ?auto_93858 ?auto_93856 ) ) ( not ( = ?auto_93859 ?auto_93856 ) ) ( not ( = ?auto_93860 ?auto_93856 ) ) ( not ( = ?auto_93855 ?auto_93856 ) ) ( not ( = ?auto_93857 ?auto_93856 ) ) ( not ( = ?auto_93861 ?auto_93856 ) ) ( ON ?auto_93858 ?auto_93854 ) ( ON-TABLE ?auto_93856 ) ( ON ?auto_93861 ?auto_93858 ) ( ON ?auto_93857 ?auto_93861 ) ( CLEAR ?auto_93860 ) ( ON ?auto_93855 ?auto_93857 ) ( CLEAR ?auto_93855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93856 ?auto_93854 ?auto_93858 ?auto_93861 ?auto_93857 )
      ( MAKE-1PILE ?auto_93854 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93862 - BLOCK
    )
    :vars
    (
      ?auto_93866 - BLOCK
      ?auto_93869 - BLOCK
      ?auto_93865 - BLOCK
      ?auto_93863 - BLOCK
      ?auto_93867 - BLOCK
      ?auto_93868 - BLOCK
      ?auto_93864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93862 ?auto_93866 ) ) ( ON-TABLE ?auto_93869 ) ( not ( = ?auto_93869 ?auto_93865 ) ) ( not ( = ?auto_93869 ?auto_93863 ) ) ( not ( = ?auto_93869 ?auto_93867 ) ) ( not ( = ?auto_93869 ?auto_93868 ) ) ( not ( = ?auto_93869 ?auto_93866 ) ) ( not ( = ?auto_93869 ?auto_93862 ) ) ( not ( = ?auto_93865 ?auto_93863 ) ) ( not ( = ?auto_93865 ?auto_93867 ) ) ( not ( = ?auto_93865 ?auto_93868 ) ) ( not ( = ?auto_93865 ?auto_93866 ) ) ( not ( = ?auto_93865 ?auto_93862 ) ) ( not ( = ?auto_93863 ?auto_93867 ) ) ( not ( = ?auto_93863 ?auto_93868 ) ) ( not ( = ?auto_93863 ?auto_93866 ) ) ( not ( = ?auto_93863 ?auto_93862 ) ) ( not ( = ?auto_93867 ?auto_93868 ) ) ( not ( = ?auto_93867 ?auto_93866 ) ) ( not ( = ?auto_93867 ?auto_93862 ) ) ( not ( = ?auto_93868 ?auto_93866 ) ) ( not ( = ?auto_93868 ?auto_93862 ) ) ( ON ?auto_93862 ?auto_93864 ) ( not ( = ?auto_93862 ?auto_93864 ) ) ( not ( = ?auto_93866 ?auto_93864 ) ) ( not ( = ?auto_93869 ?auto_93864 ) ) ( not ( = ?auto_93865 ?auto_93864 ) ) ( not ( = ?auto_93863 ?auto_93864 ) ) ( not ( = ?auto_93867 ?auto_93864 ) ) ( not ( = ?auto_93868 ?auto_93864 ) ) ( ON ?auto_93866 ?auto_93862 ) ( ON-TABLE ?auto_93864 ) ( ON ?auto_93868 ?auto_93866 ) ( ON ?auto_93867 ?auto_93868 ) ( ON ?auto_93863 ?auto_93867 ) ( CLEAR ?auto_93863 ) ( HOLDING ?auto_93865 ) ( CLEAR ?auto_93869 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93869 ?auto_93865 )
      ( MAKE-1PILE ?auto_93862 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93870 - BLOCK
    )
    :vars
    (
      ?auto_93873 - BLOCK
      ?auto_93875 - BLOCK
      ?auto_93874 - BLOCK
      ?auto_93872 - BLOCK
      ?auto_93871 - BLOCK
      ?auto_93877 - BLOCK
      ?auto_93876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93870 ?auto_93873 ) ) ( ON-TABLE ?auto_93875 ) ( not ( = ?auto_93875 ?auto_93874 ) ) ( not ( = ?auto_93875 ?auto_93872 ) ) ( not ( = ?auto_93875 ?auto_93871 ) ) ( not ( = ?auto_93875 ?auto_93877 ) ) ( not ( = ?auto_93875 ?auto_93873 ) ) ( not ( = ?auto_93875 ?auto_93870 ) ) ( not ( = ?auto_93874 ?auto_93872 ) ) ( not ( = ?auto_93874 ?auto_93871 ) ) ( not ( = ?auto_93874 ?auto_93877 ) ) ( not ( = ?auto_93874 ?auto_93873 ) ) ( not ( = ?auto_93874 ?auto_93870 ) ) ( not ( = ?auto_93872 ?auto_93871 ) ) ( not ( = ?auto_93872 ?auto_93877 ) ) ( not ( = ?auto_93872 ?auto_93873 ) ) ( not ( = ?auto_93872 ?auto_93870 ) ) ( not ( = ?auto_93871 ?auto_93877 ) ) ( not ( = ?auto_93871 ?auto_93873 ) ) ( not ( = ?auto_93871 ?auto_93870 ) ) ( not ( = ?auto_93877 ?auto_93873 ) ) ( not ( = ?auto_93877 ?auto_93870 ) ) ( ON ?auto_93870 ?auto_93876 ) ( not ( = ?auto_93870 ?auto_93876 ) ) ( not ( = ?auto_93873 ?auto_93876 ) ) ( not ( = ?auto_93875 ?auto_93876 ) ) ( not ( = ?auto_93874 ?auto_93876 ) ) ( not ( = ?auto_93872 ?auto_93876 ) ) ( not ( = ?auto_93871 ?auto_93876 ) ) ( not ( = ?auto_93877 ?auto_93876 ) ) ( ON ?auto_93873 ?auto_93870 ) ( ON-TABLE ?auto_93876 ) ( ON ?auto_93877 ?auto_93873 ) ( ON ?auto_93871 ?auto_93877 ) ( ON ?auto_93872 ?auto_93871 ) ( CLEAR ?auto_93875 ) ( ON ?auto_93874 ?auto_93872 ) ( CLEAR ?auto_93874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93876 ?auto_93870 ?auto_93873 ?auto_93877 ?auto_93871 ?auto_93872 )
      ( MAKE-1PILE ?auto_93870 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93878 - BLOCK
    )
    :vars
    (
      ?auto_93884 - BLOCK
      ?auto_93882 - BLOCK
      ?auto_93880 - BLOCK
      ?auto_93879 - BLOCK
      ?auto_93885 - BLOCK
      ?auto_93883 - BLOCK
      ?auto_93881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93878 ?auto_93884 ) ) ( not ( = ?auto_93882 ?auto_93880 ) ) ( not ( = ?auto_93882 ?auto_93879 ) ) ( not ( = ?auto_93882 ?auto_93885 ) ) ( not ( = ?auto_93882 ?auto_93883 ) ) ( not ( = ?auto_93882 ?auto_93884 ) ) ( not ( = ?auto_93882 ?auto_93878 ) ) ( not ( = ?auto_93880 ?auto_93879 ) ) ( not ( = ?auto_93880 ?auto_93885 ) ) ( not ( = ?auto_93880 ?auto_93883 ) ) ( not ( = ?auto_93880 ?auto_93884 ) ) ( not ( = ?auto_93880 ?auto_93878 ) ) ( not ( = ?auto_93879 ?auto_93885 ) ) ( not ( = ?auto_93879 ?auto_93883 ) ) ( not ( = ?auto_93879 ?auto_93884 ) ) ( not ( = ?auto_93879 ?auto_93878 ) ) ( not ( = ?auto_93885 ?auto_93883 ) ) ( not ( = ?auto_93885 ?auto_93884 ) ) ( not ( = ?auto_93885 ?auto_93878 ) ) ( not ( = ?auto_93883 ?auto_93884 ) ) ( not ( = ?auto_93883 ?auto_93878 ) ) ( ON ?auto_93878 ?auto_93881 ) ( not ( = ?auto_93878 ?auto_93881 ) ) ( not ( = ?auto_93884 ?auto_93881 ) ) ( not ( = ?auto_93882 ?auto_93881 ) ) ( not ( = ?auto_93880 ?auto_93881 ) ) ( not ( = ?auto_93879 ?auto_93881 ) ) ( not ( = ?auto_93885 ?auto_93881 ) ) ( not ( = ?auto_93883 ?auto_93881 ) ) ( ON ?auto_93884 ?auto_93878 ) ( ON-TABLE ?auto_93881 ) ( ON ?auto_93883 ?auto_93884 ) ( ON ?auto_93885 ?auto_93883 ) ( ON ?auto_93879 ?auto_93885 ) ( ON ?auto_93880 ?auto_93879 ) ( CLEAR ?auto_93880 ) ( HOLDING ?auto_93882 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93882 )
      ( MAKE-1PILE ?auto_93878 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93886 - BLOCK
    )
    :vars
    (
      ?auto_93888 - BLOCK
      ?auto_93887 - BLOCK
      ?auto_93890 - BLOCK
      ?auto_93891 - BLOCK
      ?auto_93889 - BLOCK
      ?auto_93893 - BLOCK
      ?auto_93892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93886 ?auto_93888 ) ) ( not ( = ?auto_93887 ?auto_93890 ) ) ( not ( = ?auto_93887 ?auto_93891 ) ) ( not ( = ?auto_93887 ?auto_93889 ) ) ( not ( = ?auto_93887 ?auto_93893 ) ) ( not ( = ?auto_93887 ?auto_93888 ) ) ( not ( = ?auto_93887 ?auto_93886 ) ) ( not ( = ?auto_93890 ?auto_93891 ) ) ( not ( = ?auto_93890 ?auto_93889 ) ) ( not ( = ?auto_93890 ?auto_93893 ) ) ( not ( = ?auto_93890 ?auto_93888 ) ) ( not ( = ?auto_93890 ?auto_93886 ) ) ( not ( = ?auto_93891 ?auto_93889 ) ) ( not ( = ?auto_93891 ?auto_93893 ) ) ( not ( = ?auto_93891 ?auto_93888 ) ) ( not ( = ?auto_93891 ?auto_93886 ) ) ( not ( = ?auto_93889 ?auto_93893 ) ) ( not ( = ?auto_93889 ?auto_93888 ) ) ( not ( = ?auto_93889 ?auto_93886 ) ) ( not ( = ?auto_93893 ?auto_93888 ) ) ( not ( = ?auto_93893 ?auto_93886 ) ) ( ON ?auto_93886 ?auto_93892 ) ( not ( = ?auto_93886 ?auto_93892 ) ) ( not ( = ?auto_93888 ?auto_93892 ) ) ( not ( = ?auto_93887 ?auto_93892 ) ) ( not ( = ?auto_93890 ?auto_93892 ) ) ( not ( = ?auto_93891 ?auto_93892 ) ) ( not ( = ?auto_93889 ?auto_93892 ) ) ( not ( = ?auto_93893 ?auto_93892 ) ) ( ON ?auto_93888 ?auto_93886 ) ( ON-TABLE ?auto_93892 ) ( ON ?auto_93893 ?auto_93888 ) ( ON ?auto_93889 ?auto_93893 ) ( ON ?auto_93891 ?auto_93889 ) ( ON ?auto_93890 ?auto_93891 ) ( ON ?auto_93887 ?auto_93890 ) ( CLEAR ?auto_93887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93892 ?auto_93886 ?auto_93888 ?auto_93893 ?auto_93889 ?auto_93891 ?auto_93890 )
      ( MAKE-1PILE ?auto_93886 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93899 - BLOCK
      ?auto_93900 - BLOCK
      ?auto_93901 - BLOCK
      ?auto_93902 - BLOCK
      ?auto_93903 - BLOCK
    )
    :vars
    (
      ?auto_93904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93904 ?auto_93903 ) ( CLEAR ?auto_93904 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93899 ) ( ON ?auto_93900 ?auto_93899 ) ( ON ?auto_93901 ?auto_93900 ) ( ON ?auto_93902 ?auto_93901 ) ( ON ?auto_93903 ?auto_93902 ) ( not ( = ?auto_93899 ?auto_93900 ) ) ( not ( = ?auto_93899 ?auto_93901 ) ) ( not ( = ?auto_93899 ?auto_93902 ) ) ( not ( = ?auto_93899 ?auto_93903 ) ) ( not ( = ?auto_93899 ?auto_93904 ) ) ( not ( = ?auto_93900 ?auto_93901 ) ) ( not ( = ?auto_93900 ?auto_93902 ) ) ( not ( = ?auto_93900 ?auto_93903 ) ) ( not ( = ?auto_93900 ?auto_93904 ) ) ( not ( = ?auto_93901 ?auto_93902 ) ) ( not ( = ?auto_93901 ?auto_93903 ) ) ( not ( = ?auto_93901 ?auto_93904 ) ) ( not ( = ?auto_93902 ?auto_93903 ) ) ( not ( = ?auto_93902 ?auto_93904 ) ) ( not ( = ?auto_93903 ?auto_93904 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93904 ?auto_93903 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93905 - BLOCK
      ?auto_93906 - BLOCK
      ?auto_93907 - BLOCK
      ?auto_93908 - BLOCK
      ?auto_93909 - BLOCK
    )
    :vars
    (
      ?auto_93910 - BLOCK
      ?auto_93911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93910 ?auto_93909 ) ( CLEAR ?auto_93910 ) ( ON-TABLE ?auto_93905 ) ( ON ?auto_93906 ?auto_93905 ) ( ON ?auto_93907 ?auto_93906 ) ( ON ?auto_93908 ?auto_93907 ) ( ON ?auto_93909 ?auto_93908 ) ( not ( = ?auto_93905 ?auto_93906 ) ) ( not ( = ?auto_93905 ?auto_93907 ) ) ( not ( = ?auto_93905 ?auto_93908 ) ) ( not ( = ?auto_93905 ?auto_93909 ) ) ( not ( = ?auto_93905 ?auto_93910 ) ) ( not ( = ?auto_93906 ?auto_93907 ) ) ( not ( = ?auto_93906 ?auto_93908 ) ) ( not ( = ?auto_93906 ?auto_93909 ) ) ( not ( = ?auto_93906 ?auto_93910 ) ) ( not ( = ?auto_93907 ?auto_93908 ) ) ( not ( = ?auto_93907 ?auto_93909 ) ) ( not ( = ?auto_93907 ?auto_93910 ) ) ( not ( = ?auto_93908 ?auto_93909 ) ) ( not ( = ?auto_93908 ?auto_93910 ) ) ( not ( = ?auto_93909 ?auto_93910 ) ) ( HOLDING ?auto_93911 ) ( not ( = ?auto_93905 ?auto_93911 ) ) ( not ( = ?auto_93906 ?auto_93911 ) ) ( not ( = ?auto_93907 ?auto_93911 ) ) ( not ( = ?auto_93908 ?auto_93911 ) ) ( not ( = ?auto_93909 ?auto_93911 ) ) ( not ( = ?auto_93910 ?auto_93911 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_93911 )
      ( MAKE-5PILE ?auto_93905 ?auto_93906 ?auto_93907 ?auto_93908 ?auto_93909 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93912 - BLOCK
      ?auto_93913 - BLOCK
      ?auto_93914 - BLOCK
      ?auto_93915 - BLOCK
      ?auto_93916 - BLOCK
    )
    :vars
    (
      ?auto_93917 - BLOCK
      ?auto_93918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93917 ?auto_93916 ) ( ON-TABLE ?auto_93912 ) ( ON ?auto_93913 ?auto_93912 ) ( ON ?auto_93914 ?auto_93913 ) ( ON ?auto_93915 ?auto_93914 ) ( ON ?auto_93916 ?auto_93915 ) ( not ( = ?auto_93912 ?auto_93913 ) ) ( not ( = ?auto_93912 ?auto_93914 ) ) ( not ( = ?auto_93912 ?auto_93915 ) ) ( not ( = ?auto_93912 ?auto_93916 ) ) ( not ( = ?auto_93912 ?auto_93917 ) ) ( not ( = ?auto_93913 ?auto_93914 ) ) ( not ( = ?auto_93913 ?auto_93915 ) ) ( not ( = ?auto_93913 ?auto_93916 ) ) ( not ( = ?auto_93913 ?auto_93917 ) ) ( not ( = ?auto_93914 ?auto_93915 ) ) ( not ( = ?auto_93914 ?auto_93916 ) ) ( not ( = ?auto_93914 ?auto_93917 ) ) ( not ( = ?auto_93915 ?auto_93916 ) ) ( not ( = ?auto_93915 ?auto_93917 ) ) ( not ( = ?auto_93916 ?auto_93917 ) ) ( not ( = ?auto_93912 ?auto_93918 ) ) ( not ( = ?auto_93913 ?auto_93918 ) ) ( not ( = ?auto_93914 ?auto_93918 ) ) ( not ( = ?auto_93915 ?auto_93918 ) ) ( not ( = ?auto_93916 ?auto_93918 ) ) ( not ( = ?auto_93917 ?auto_93918 ) ) ( ON ?auto_93918 ?auto_93917 ) ( CLEAR ?auto_93918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93912 ?auto_93913 ?auto_93914 ?auto_93915 ?auto_93916 ?auto_93917 )
      ( MAKE-5PILE ?auto_93912 ?auto_93913 ?auto_93914 ?auto_93915 ?auto_93916 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93919 - BLOCK
      ?auto_93920 - BLOCK
      ?auto_93921 - BLOCK
      ?auto_93922 - BLOCK
      ?auto_93923 - BLOCK
    )
    :vars
    (
      ?auto_93924 - BLOCK
      ?auto_93925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93924 ?auto_93923 ) ( ON-TABLE ?auto_93919 ) ( ON ?auto_93920 ?auto_93919 ) ( ON ?auto_93921 ?auto_93920 ) ( ON ?auto_93922 ?auto_93921 ) ( ON ?auto_93923 ?auto_93922 ) ( not ( = ?auto_93919 ?auto_93920 ) ) ( not ( = ?auto_93919 ?auto_93921 ) ) ( not ( = ?auto_93919 ?auto_93922 ) ) ( not ( = ?auto_93919 ?auto_93923 ) ) ( not ( = ?auto_93919 ?auto_93924 ) ) ( not ( = ?auto_93920 ?auto_93921 ) ) ( not ( = ?auto_93920 ?auto_93922 ) ) ( not ( = ?auto_93920 ?auto_93923 ) ) ( not ( = ?auto_93920 ?auto_93924 ) ) ( not ( = ?auto_93921 ?auto_93922 ) ) ( not ( = ?auto_93921 ?auto_93923 ) ) ( not ( = ?auto_93921 ?auto_93924 ) ) ( not ( = ?auto_93922 ?auto_93923 ) ) ( not ( = ?auto_93922 ?auto_93924 ) ) ( not ( = ?auto_93923 ?auto_93924 ) ) ( not ( = ?auto_93919 ?auto_93925 ) ) ( not ( = ?auto_93920 ?auto_93925 ) ) ( not ( = ?auto_93921 ?auto_93925 ) ) ( not ( = ?auto_93922 ?auto_93925 ) ) ( not ( = ?auto_93923 ?auto_93925 ) ) ( not ( = ?auto_93924 ?auto_93925 ) ) ( HOLDING ?auto_93925 ) ( CLEAR ?auto_93924 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93919 ?auto_93920 ?auto_93921 ?auto_93922 ?auto_93923 ?auto_93924 ?auto_93925 )
      ( MAKE-5PILE ?auto_93919 ?auto_93920 ?auto_93921 ?auto_93922 ?auto_93923 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93926 - BLOCK
      ?auto_93927 - BLOCK
      ?auto_93928 - BLOCK
      ?auto_93929 - BLOCK
      ?auto_93930 - BLOCK
    )
    :vars
    (
      ?auto_93931 - BLOCK
      ?auto_93932 - BLOCK
      ?auto_93933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93931 ?auto_93930 ) ( ON-TABLE ?auto_93926 ) ( ON ?auto_93927 ?auto_93926 ) ( ON ?auto_93928 ?auto_93927 ) ( ON ?auto_93929 ?auto_93928 ) ( ON ?auto_93930 ?auto_93929 ) ( not ( = ?auto_93926 ?auto_93927 ) ) ( not ( = ?auto_93926 ?auto_93928 ) ) ( not ( = ?auto_93926 ?auto_93929 ) ) ( not ( = ?auto_93926 ?auto_93930 ) ) ( not ( = ?auto_93926 ?auto_93931 ) ) ( not ( = ?auto_93927 ?auto_93928 ) ) ( not ( = ?auto_93927 ?auto_93929 ) ) ( not ( = ?auto_93927 ?auto_93930 ) ) ( not ( = ?auto_93927 ?auto_93931 ) ) ( not ( = ?auto_93928 ?auto_93929 ) ) ( not ( = ?auto_93928 ?auto_93930 ) ) ( not ( = ?auto_93928 ?auto_93931 ) ) ( not ( = ?auto_93929 ?auto_93930 ) ) ( not ( = ?auto_93929 ?auto_93931 ) ) ( not ( = ?auto_93930 ?auto_93931 ) ) ( not ( = ?auto_93926 ?auto_93932 ) ) ( not ( = ?auto_93927 ?auto_93932 ) ) ( not ( = ?auto_93928 ?auto_93932 ) ) ( not ( = ?auto_93929 ?auto_93932 ) ) ( not ( = ?auto_93930 ?auto_93932 ) ) ( not ( = ?auto_93931 ?auto_93932 ) ) ( CLEAR ?auto_93931 ) ( ON ?auto_93932 ?auto_93933 ) ( CLEAR ?auto_93932 ) ( HAND-EMPTY ) ( not ( = ?auto_93926 ?auto_93933 ) ) ( not ( = ?auto_93927 ?auto_93933 ) ) ( not ( = ?auto_93928 ?auto_93933 ) ) ( not ( = ?auto_93929 ?auto_93933 ) ) ( not ( = ?auto_93930 ?auto_93933 ) ) ( not ( = ?auto_93931 ?auto_93933 ) ) ( not ( = ?auto_93932 ?auto_93933 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93932 ?auto_93933 )
      ( MAKE-5PILE ?auto_93926 ?auto_93927 ?auto_93928 ?auto_93929 ?auto_93930 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93950 - BLOCK
      ?auto_93951 - BLOCK
      ?auto_93952 - BLOCK
      ?auto_93953 - BLOCK
      ?auto_93954 - BLOCK
    )
    :vars
    (
      ?auto_93956 - BLOCK
      ?auto_93957 - BLOCK
      ?auto_93955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93950 ) ( ON ?auto_93951 ?auto_93950 ) ( ON ?auto_93952 ?auto_93951 ) ( ON ?auto_93953 ?auto_93952 ) ( not ( = ?auto_93950 ?auto_93951 ) ) ( not ( = ?auto_93950 ?auto_93952 ) ) ( not ( = ?auto_93950 ?auto_93953 ) ) ( not ( = ?auto_93950 ?auto_93954 ) ) ( not ( = ?auto_93950 ?auto_93956 ) ) ( not ( = ?auto_93951 ?auto_93952 ) ) ( not ( = ?auto_93951 ?auto_93953 ) ) ( not ( = ?auto_93951 ?auto_93954 ) ) ( not ( = ?auto_93951 ?auto_93956 ) ) ( not ( = ?auto_93952 ?auto_93953 ) ) ( not ( = ?auto_93952 ?auto_93954 ) ) ( not ( = ?auto_93952 ?auto_93956 ) ) ( not ( = ?auto_93953 ?auto_93954 ) ) ( not ( = ?auto_93953 ?auto_93956 ) ) ( not ( = ?auto_93954 ?auto_93956 ) ) ( not ( = ?auto_93950 ?auto_93957 ) ) ( not ( = ?auto_93951 ?auto_93957 ) ) ( not ( = ?auto_93952 ?auto_93957 ) ) ( not ( = ?auto_93953 ?auto_93957 ) ) ( not ( = ?auto_93954 ?auto_93957 ) ) ( not ( = ?auto_93956 ?auto_93957 ) ) ( ON ?auto_93957 ?auto_93955 ) ( not ( = ?auto_93950 ?auto_93955 ) ) ( not ( = ?auto_93951 ?auto_93955 ) ) ( not ( = ?auto_93952 ?auto_93955 ) ) ( not ( = ?auto_93953 ?auto_93955 ) ) ( not ( = ?auto_93954 ?auto_93955 ) ) ( not ( = ?auto_93956 ?auto_93955 ) ) ( not ( = ?auto_93957 ?auto_93955 ) ) ( ON ?auto_93956 ?auto_93957 ) ( CLEAR ?auto_93956 ) ( HOLDING ?auto_93954 ) ( CLEAR ?auto_93953 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93950 ?auto_93951 ?auto_93952 ?auto_93953 ?auto_93954 ?auto_93956 )
      ( MAKE-5PILE ?auto_93950 ?auto_93951 ?auto_93952 ?auto_93953 ?auto_93954 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93958 - BLOCK
      ?auto_93959 - BLOCK
      ?auto_93960 - BLOCK
      ?auto_93961 - BLOCK
      ?auto_93962 - BLOCK
    )
    :vars
    (
      ?auto_93964 - BLOCK
      ?auto_93965 - BLOCK
      ?auto_93963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93958 ) ( ON ?auto_93959 ?auto_93958 ) ( ON ?auto_93960 ?auto_93959 ) ( ON ?auto_93961 ?auto_93960 ) ( not ( = ?auto_93958 ?auto_93959 ) ) ( not ( = ?auto_93958 ?auto_93960 ) ) ( not ( = ?auto_93958 ?auto_93961 ) ) ( not ( = ?auto_93958 ?auto_93962 ) ) ( not ( = ?auto_93958 ?auto_93964 ) ) ( not ( = ?auto_93959 ?auto_93960 ) ) ( not ( = ?auto_93959 ?auto_93961 ) ) ( not ( = ?auto_93959 ?auto_93962 ) ) ( not ( = ?auto_93959 ?auto_93964 ) ) ( not ( = ?auto_93960 ?auto_93961 ) ) ( not ( = ?auto_93960 ?auto_93962 ) ) ( not ( = ?auto_93960 ?auto_93964 ) ) ( not ( = ?auto_93961 ?auto_93962 ) ) ( not ( = ?auto_93961 ?auto_93964 ) ) ( not ( = ?auto_93962 ?auto_93964 ) ) ( not ( = ?auto_93958 ?auto_93965 ) ) ( not ( = ?auto_93959 ?auto_93965 ) ) ( not ( = ?auto_93960 ?auto_93965 ) ) ( not ( = ?auto_93961 ?auto_93965 ) ) ( not ( = ?auto_93962 ?auto_93965 ) ) ( not ( = ?auto_93964 ?auto_93965 ) ) ( ON ?auto_93965 ?auto_93963 ) ( not ( = ?auto_93958 ?auto_93963 ) ) ( not ( = ?auto_93959 ?auto_93963 ) ) ( not ( = ?auto_93960 ?auto_93963 ) ) ( not ( = ?auto_93961 ?auto_93963 ) ) ( not ( = ?auto_93962 ?auto_93963 ) ) ( not ( = ?auto_93964 ?auto_93963 ) ) ( not ( = ?auto_93965 ?auto_93963 ) ) ( ON ?auto_93964 ?auto_93965 ) ( CLEAR ?auto_93961 ) ( ON ?auto_93962 ?auto_93964 ) ( CLEAR ?auto_93962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93963 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93963 ?auto_93965 ?auto_93964 )
      ( MAKE-5PILE ?auto_93958 ?auto_93959 ?auto_93960 ?auto_93961 ?auto_93962 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93966 - BLOCK
      ?auto_93967 - BLOCK
      ?auto_93968 - BLOCK
      ?auto_93969 - BLOCK
      ?auto_93970 - BLOCK
    )
    :vars
    (
      ?auto_93973 - BLOCK
      ?auto_93972 - BLOCK
      ?auto_93971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93966 ) ( ON ?auto_93967 ?auto_93966 ) ( ON ?auto_93968 ?auto_93967 ) ( not ( = ?auto_93966 ?auto_93967 ) ) ( not ( = ?auto_93966 ?auto_93968 ) ) ( not ( = ?auto_93966 ?auto_93969 ) ) ( not ( = ?auto_93966 ?auto_93970 ) ) ( not ( = ?auto_93966 ?auto_93973 ) ) ( not ( = ?auto_93967 ?auto_93968 ) ) ( not ( = ?auto_93967 ?auto_93969 ) ) ( not ( = ?auto_93967 ?auto_93970 ) ) ( not ( = ?auto_93967 ?auto_93973 ) ) ( not ( = ?auto_93968 ?auto_93969 ) ) ( not ( = ?auto_93968 ?auto_93970 ) ) ( not ( = ?auto_93968 ?auto_93973 ) ) ( not ( = ?auto_93969 ?auto_93970 ) ) ( not ( = ?auto_93969 ?auto_93973 ) ) ( not ( = ?auto_93970 ?auto_93973 ) ) ( not ( = ?auto_93966 ?auto_93972 ) ) ( not ( = ?auto_93967 ?auto_93972 ) ) ( not ( = ?auto_93968 ?auto_93972 ) ) ( not ( = ?auto_93969 ?auto_93972 ) ) ( not ( = ?auto_93970 ?auto_93972 ) ) ( not ( = ?auto_93973 ?auto_93972 ) ) ( ON ?auto_93972 ?auto_93971 ) ( not ( = ?auto_93966 ?auto_93971 ) ) ( not ( = ?auto_93967 ?auto_93971 ) ) ( not ( = ?auto_93968 ?auto_93971 ) ) ( not ( = ?auto_93969 ?auto_93971 ) ) ( not ( = ?auto_93970 ?auto_93971 ) ) ( not ( = ?auto_93973 ?auto_93971 ) ) ( not ( = ?auto_93972 ?auto_93971 ) ) ( ON ?auto_93973 ?auto_93972 ) ( ON ?auto_93970 ?auto_93973 ) ( CLEAR ?auto_93970 ) ( ON-TABLE ?auto_93971 ) ( HOLDING ?auto_93969 ) ( CLEAR ?auto_93968 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93966 ?auto_93967 ?auto_93968 ?auto_93969 )
      ( MAKE-5PILE ?auto_93966 ?auto_93967 ?auto_93968 ?auto_93969 ?auto_93970 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93974 - BLOCK
      ?auto_93975 - BLOCK
      ?auto_93976 - BLOCK
      ?auto_93977 - BLOCK
      ?auto_93978 - BLOCK
    )
    :vars
    (
      ?auto_93979 - BLOCK
      ?auto_93981 - BLOCK
      ?auto_93980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93974 ) ( ON ?auto_93975 ?auto_93974 ) ( ON ?auto_93976 ?auto_93975 ) ( not ( = ?auto_93974 ?auto_93975 ) ) ( not ( = ?auto_93974 ?auto_93976 ) ) ( not ( = ?auto_93974 ?auto_93977 ) ) ( not ( = ?auto_93974 ?auto_93978 ) ) ( not ( = ?auto_93974 ?auto_93979 ) ) ( not ( = ?auto_93975 ?auto_93976 ) ) ( not ( = ?auto_93975 ?auto_93977 ) ) ( not ( = ?auto_93975 ?auto_93978 ) ) ( not ( = ?auto_93975 ?auto_93979 ) ) ( not ( = ?auto_93976 ?auto_93977 ) ) ( not ( = ?auto_93976 ?auto_93978 ) ) ( not ( = ?auto_93976 ?auto_93979 ) ) ( not ( = ?auto_93977 ?auto_93978 ) ) ( not ( = ?auto_93977 ?auto_93979 ) ) ( not ( = ?auto_93978 ?auto_93979 ) ) ( not ( = ?auto_93974 ?auto_93981 ) ) ( not ( = ?auto_93975 ?auto_93981 ) ) ( not ( = ?auto_93976 ?auto_93981 ) ) ( not ( = ?auto_93977 ?auto_93981 ) ) ( not ( = ?auto_93978 ?auto_93981 ) ) ( not ( = ?auto_93979 ?auto_93981 ) ) ( ON ?auto_93981 ?auto_93980 ) ( not ( = ?auto_93974 ?auto_93980 ) ) ( not ( = ?auto_93975 ?auto_93980 ) ) ( not ( = ?auto_93976 ?auto_93980 ) ) ( not ( = ?auto_93977 ?auto_93980 ) ) ( not ( = ?auto_93978 ?auto_93980 ) ) ( not ( = ?auto_93979 ?auto_93980 ) ) ( not ( = ?auto_93981 ?auto_93980 ) ) ( ON ?auto_93979 ?auto_93981 ) ( ON ?auto_93978 ?auto_93979 ) ( ON-TABLE ?auto_93980 ) ( CLEAR ?auto_93976 ) ( ON ?auto_93977 ?auto_93978 ) ( CLEAR ?auto_93977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93980 ?auto_93981 ?auto_93979 ?auto_93978 )
      ( MAKE-5PILE ?auto_93974 ?auto_93975 ?auto_93976 ?auto_93977 ?auto_93978 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93982 - BLOCK
      ?auto_93983 - BLOCK
      ?auto_93984 - BLOCK
      ?auto_93985 - BLOCK
      ?auto_93986 - BLOCK
    )
    :vars
    (
      ?auto_93987 - BLOCK
      ?auto_93989 - BLOCK
      ?auto_93988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93982 ) ( ON ?auto_93983 ?auto_93982 ) ( not ( = ?auto_93982 ?auto_93983 ) ) ( not ( = ?auto_93982 ?auto_93984 ) ) ( not ( = ?auto_93982 ?auto_93985 ) ) ( not ( = ?auto_93982 ?auto_93986 ) ) ( not ( = ?auto_93982 ?auto_93987 ) ) ( not ( = ?auto_93983 ?auto_93984 ) ) ( not ( = ?auto_93983 ?auto_93985 ) ) ( not ( = ?auto_93983 ?auto_93986 ) ) ( not ( = ?auto_93983 ?auto_93987 ) ) ( not ( = ?auto_93984 ?auto_93985 ) ) ( not ( = ?auto_93984 ?auto_93986 ) ) ( not ( = ?auto_93984 ?auto_93987 ) ) ( not ( = ?auto_93985 ?auto_93986 ) ) ( not ( = ?auto_93985 ?auto_93987 ) ) ( not ( = ?auto_93986 ?auto_93987 ) ) ( not ( = ?auto_93982 ?auto_93989 ) ) ( not ( = ?auto_93983 ?auto_93989 ) ) ( not ( = ?auto_93984 ?auto_93989 ) ) ( not ( = ?auto_93985 ?auto_93989 ) ) ( not ( = ?auto_93986 ?auto_93989 ) ) ( not ( = ?auto_93987 ?auto_93989 ) ) ( ON ?auto_93989 ?auto_93988 ) ( not ( = ?auto_93982 ?auto_93988 ) ) ( not ( = ?auto_93983 ?auto_93988 ) ) ( not ( = ?auto_93984 ?auto_93988 ) ) ( not ( = ?auto_93985 ?auto_93988 ) ) ( not ( = ?auto_93986 ?auto_93988 ) ) ( not ( = ?auto_93987 ?auto_93988 ) ) ( not ( = ?auto_93989 ?auto_93988 ) ) ( ON ?auto_93987 ?auto_93989 ) ( ON ?auto_93986 ?auto_93987 ) ( ON-TABLE ?auto_93988 ) ( ON ?auto_93985 ?auto_93986 ) ( CLEAR ?auto_93985 ) ( HOLDING ?auto_93984 ) ( CLEAR ?auto_93983 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93982 ?auto_93983 ?auto_93984 )
      ( MAKE-5PILE ?auto_93982 ?auto_93983 ?auto_93984 ?auto_93985 ?auto_93986 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93990 - BLOCK
      ?auto_93991 - BLOCK
      ?auto_93992 - BLOCK
      ?auto_93993 - BLOCK
      ?auto_93994 - BLOCK
    )
    :vars
    (
      ?auto_93995 - BLOCK
      ?auto_93996 - BLOCK
      ?auto_93997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93990 ) ( ON ?auto_93991 ?auto_93990 ) ( not ( = ?auto_93990 ?auto_93991 ) ) ( not ( = ?auto_93990 ?auto_93992 ) ) ( not ( = ?auto_93990 ?auto_93993 ) ) ( not ( = ?auto_93990 ?auto_93994 ) ) ( not ( = ?auto_93990 ?auto_93995 ) ) ( not ( = ?auto_93991 ?auto_93992 ) ) ( not ( = ?auto_93991 ?auto_93993 ) ) ( not ( = ?auto_93991 ?auto_93994 ) ) ( not ( = ?auto_93991 ?auto_93995 ) ) ( not ( = ?auto_93992 ?auto_93993 ) ) ( not ( = ?auto_93992 ?auto_93994 ) ) ( not ( = ?auto_93992 ?auto_93995 ) ) ( not ( = ?auto_93993 ?auto_93994 ) ) ( not ( = ?auto_93993 ?auto_93995 ) ) ( not ( = ?auto_93994 ?auto_93995 ) ) ( not ( = ?auto_93990 ?auto_93996 ) ) ( not ( = ?auto_93991 ?auto_93996 ) ) ( not ( = ?auto_93992 ?auto_93996 ) ) ( not ( = ?auto_93993 ?auto_93996 ) ) ( not ( = ?auto_93994 ?auto_93996 ) ) ( not ( = ?auto_93995 ?auto_93996 ) ) ( ON ?auto_93996 ?auto_93997 ) ( not ( = ?auto_93990 ?auto_93997 ) ) ( not ( = ?auto_93991 ?auto_93997 ) ) ( not ( = ?auto_93992 ?auto_93997 ) ) ( not ( = ?auto_93993 ?auto_93997 ) ) ( not ( = ?auto_93994 ?auto_93997 ) ) ( not ( = ?auto_93995 ?auto_93997 ) ) ( not ( = ?auto_93996 ?auto_93997 ) ) ( ON ?auto_93995 ?auto_93996 ) ( ON ?auto_93994 ?auto_93995 ) ( ON-TABLE ?auto_93997 ) ( ON ?auto_93993 ?auto_93994 ) ( CLEAR ?auto_93991 ) ( ON ?auto_93992 ?auto_93993 ) ( CLEAR ?auto_93992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93997 ?auto_93996 ?auto_93995 ?auto_93994 ?auto_93993 )
      ( MAKE-5PILE ?auto_93990 ?auto_93991 ?auto_93992 ?auto_93993 ?auto_93994 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93998 - BLOCK
      ?auto_93999 - BLOCK
      ?auto_94000 - BLOCK
      ?auto_94001 - BLOCK
      ?auto_94002 - BLOCK
    )
    :vars
    (
      ?auto_94003 - BLOCK
      ?auto_94004 - BLOCK
      ?auto_94005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93998 ) ( not ( = ?auto_93998 ?auto_93999 ) ) ( not ( = ?auto_93998 ?auto_94000 ) ) ( not ( = ?auto_93998 ?auto_94001 ) ) ( not ( = ?auto_93998 ?auto_94002 ) ) ( not ( = ?auto_93998 ?auto_94003 ) ) ( not ( = ?auto_93999 ?auto_94000 ) ) ( not ( = ?auto_93999 ?auto_94001 ) ) ( not ( = ?auto_93999 ?auto_94002 ) ) ( not ( = ?auto_93999 ?auto_94003 ) ) ( not ( = ?auto_94000 ?auto_94001 ) ) ( not ( = ?auto_94000 ?auto_94002 ) ) ( not ( = ?auto_94000 ?auto_94003 ) ) ( not ( = ?auto_94001 ?auto_94002 ) ) ( not ( = ?auto_94001 ?auto_94003 ) ) ( not ( = ?auto_94002 ?auto_94003 ) ) ( not ( = ?auto_93998 ?auto_94004 ) ) ( not ( = ?auto_93999 ?auto_94004 ) ) ( not ( = ?auto_94000 ?auto_94004 ) ) ( not ( = ?auto_94001 ?auto_94004 ) ) ( not ( = ?auto_94002 ?auto_94004 ) ) ( not ( = ?auto_94003 ?auto_94004 ) ) ( ON ?auto_94004 ?auto_94005 ) ( not ( = ?auto_93998 ?auto_94005 ) ) ( not ( = ?auto_93999 ?auto_94005 ) ) ( not ( = ?auto_94000 ?auto_94005 ) ) ( not ( = ?auto_94001 ?auto_94005 ) ) ( not ( = ?auto_94002 ?auto_94005 ) ) ( not ( = ?auto_94003 ?auto_94005 ) ) ( not ( = ?auto_94004 ?auto_94005 ) ) ( ON ?auto_94003 ?auto_94004 ) ( ON ?auto_94002 ?auto_94003 ) ( ON-TABLE ?auto_94005 ) ( ON ?auto_94001 ?auto_94002 ) ( ON ?auto_94000 ?auto_94001 ) ( CLEAR ?auto_94000 ) ( HOLDING ?auto_93999 ) ( CLEAR ?auto_93998 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93998 ?auto_93999 )
      ( MAKE-5PILE ?auto_93998 ?auto_93999 ?auto_94000 ?auto_94001 ?auto_94002 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94006 - BLOCK
      ?auto_94007 - BLOCK
      ?auto_94008 - BLOCK
      ?auto_94009 - BLOCK
      ?auto_94010 - BLOCK
    )
    :vars
    (
      ?auto_94012 - BLOCK
      ?auto_94011 - BLOCK
      ?auto_94013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94006 ) ( not ( = ?auto_94006 ?auto_94007 ) ) ( not ( = ?auto_94006 ?auto_94008 ) ) ( not ( = ?auto_94006 ?auto_94009 ) ) ( not ( = ?auto_94006 ?auto_94010 ) ) ( not ( = ?auto_94006 ?auto_94012 ) ) ( not ( = ?auto_94007 ?auto_94008 ) ) ( not ( = ?auto_94007 ?auto_94009 ) ) ( not ( = ?auto_94007 ?auto_94010 ) ) ( not ( = ?auto_94007 ?auto_94012 ) ) ( not ( = ?auto_94008 ?auto_94009 ) ) ( not ( = ?auto_94008 ?auto_94010 ) ) ( not ( = ?auto_94008 ?auto_94012 ) ) ( not ( = ?auto_94009 ?auto_94010 ) ) ( not ( = ?auto_94009 ?auto_94012 ) ) ( not ( = ?auto_94010 ?auto_94012 ) ) ( not ( = ?auto_94006 ?auto_94011 ) ) ( not ( = ?auto_94007 ?auto_94011 ) ) ( not ( = ?auto_94008 ?auto_94011 ) ) ( not ( = ?auto_94009 ?auto_94011 ) ) ( not ( = ?auto_94010 ?auto_94011 ) ) ( not ( = ?auto_94012 ?auto_94011 ) ) ( ON ?auto_94011 ?auto_94013 ) ( not ( = ?auto_94006 ?auto_94013 ) ) ( not ( = ?auto_94007 ?auto_94013 ) ) ( not ( = ?auto_94008 ?auto_94013 ) ) ( not ( = ?auto_94009 ?auto_94013 ) ) ( not ( = ?auto_94010 ?auto_94013 ) ) ( not ( = ?auto_94012 ?auto_94013 ) ) ( not ( = ?auto_94011 ?auto_94013 ) ) ( ON ?auto_94012 ?auto_94011 ) ( ON ?auto_94010 ?auto_94012 ) ( ON-TABLE ?auto_94013 ) ( ON ?auto_94009 ?auto_94010 ) ( ON ?auto_94008 ?auto_94009 ) ( CLEAR ?auto_94006 ) ( ON ?auto_94007 ?auto_94008 ) ( CLEAR ?auto_94007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94013 ?auto_94011 ?auto_94012 ?auto_94010 ?auto_94009 ?auto_94008 )
      ( MAKE-5PILE ?auto_94006 ?auto_94007 ?auto_94008 ?auto_94009 ?auto_94010 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94014 - BLOCK
      ?auto_94015 - BLOCK
      ?auto_94016 - BLOCK
      ?auto_94017 - BLOCK
      ?auto_94018 - BLOCK
    )
    :vars
    (
      ?auto_94021 - BLOCK
      ?auto_94019 - BLOCK
      ?auto_94020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94014 ?auto_94015 ) ) ( not ( = ?auto_94014 ?auto_94016 ) ) ( not ( = ?auto_94014 ?auto_94017 ) ) ( not ( = ?auto_94014 ?auto_94018 ) ) ( not ( = ?auto_94014 ?auto_94021 ) ) ( not ( = ?auto_94015 ?auto_94016 ) ) ( not ( = ?auto_94015 ?auto_94017 ) ) ( not ( = ?auto_94015 ?auto_94018 ) ) ( not ( = ?auto_94015 ?auto_94021 ) ) ( not ( = ?auto_94016 ?auto_94017 ) ) ( not ( = ?auto_94016 ?auto_94018 ) ) ( not ( = ?auto_94016 ?auto_94021 ) ) ( not ( = ?auto_94017 ?auto_94018 ) ) ( not ( = ?auto_94017 ?auto_94021 ) ) ( not ( = ?auto_94018 ?auto_94021 ) ) ( not ( = ?auto_94014 ?auto_94019 ) ) ( not ( = ?auto_94015 ?auto_94019 ) ) ( not ( = ?auto_94016 ?auto_94019 ) ) ( not ( = ?auto_94017 ?auto_94019 ) ) ( not ( = ?auto_94018 ?auto_94019 ) ) ( not ( = ?auto_94021 ?auto_94019 ) ) ( ON ?auto_94019 ?auto_94020 ) ( not ( = ?auto_94014 ?auto_94020 ) ) ( not ( = ?auto_94015 ?auto_94020 ) ) ( not ( = ?auto_94016 ?auto_94020 ) ) ( not ( = ?auto_94017 ?auto_94020 ) ) ( not ( = ?auto_94018 ?auto_94020 ) ) ( not ( = ?auto_94021 ?auto_94020 ) ) ( not ( = ?auto_94019 ?auto_94020 ) ) ( ON ?auto_94021 ?auto_94019 ) ( ON ?auto_94018 ?auto_94021 ) ( ON-TABLE ?auto_94020 ) ( ON ?auto_94017 ?auto_94018 ) ( ON ?auto_94016 ?auto_94017 ) ( ON ?auto_94015 ?auto_94016 ) ( CLEAR ?auto_94015 ) ( HOLDING ?auto_94014 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94014 )
      ( MAKE-5PILE ?auto_94014 ?auto_94015 ?auto_94016 ?auto_94017 ?auto_94018 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94022 - BLOCK
      ?auto_94023 - BLOCK
      ?auto_94024 - BLOCK
      ?auto_94025 - BLOCK
      ?auto_94026 - BLOCK
    )
    :vars
    (
      ?auto_94027 - BLOCK
      ?auto_94028 - BLOCK
      ?auto_94029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94022 ?auto_94023 ) ) ( not ( = ?auto_94022 ?auto_94024 ) ) ( not ( = ?auto_94022 ?auto_94025 ) ) ( not ( = ?auto_94022 ?auto_94026 ) ) ( not ( = ?auto_94022 ?auto_94027 ) ) ( not ( = ?auto_94023 ?auto_94024 ) ) ( not ( = ?auto_94023 ?auto_94025 ) ) ( not ( = ?auto_94023 ?auto_94026 ) ) ( not ( = ?auto_94023 ?auto_94027 ) ) ( not ( = ?auto_94024 ?auto_94025 ) ) ( not ( = ?auto_94024 ?auto_94026 ) ) ( not ( = ?auto_94024 ?auto_94027 ) ) ( not ( = ?auto_94025 ?auto_94026 ) ) ( not ( = ?auto_94025 ?auto_94027 ) ) ( not ( = ?auto_94026 ?auto_94027 ) ) ( not ( = ?auto_94022 ?auto_94028 ) ) ( not ( = ?auto_94023 ?auto_94028 ) ) ( not ( = ?auto_94024 ?auto_94028 ) ) ( not ( = ?auto_94025 ?auto_94028 ) ) ( not ( = ?auto_94026 ?auto_94028 ) ) ( not ( = ?auto_94027 ?auto_94028 ) ) ( ON ?auto_94028 ?auto_94029 ) ( not ( = ?auto_94022 ?auto_94029 ) ) ( not ( = ?auto_94023 ?auto_94029 ) ) ( not ( = ?auto_94024 ?auto_94029 ) ) ( not ( = ?auto_94025 ?auto_94029 ) ) ( not ( = ?auto_94026 ?auto_94029 ) ) ( not ( = ?auto_94027 ?auto_94029 ) ) ( not ( = ?auto_94028 ?auto_94029 ) ) ( ON ?auto_94027 ?auto_94028 ) ( ON ?auto_94026 ?auto_94027 ) ( ON-TABLE ?auto_94029 ) ( ON ?auto_94025 ?auto_94026 ) ( ON ?auto_94024 ?auto_94025 ) ( ON ?auto_94023 ?auto_94024 ) ( ON ?auto_94022 ?auto_94023 ) ( CLEAR ?auto_94022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94029 ?auto_94028 ?auto_94027 ?auto_94026 ?auto_94025 ?auto_94024 ?auto_94023 )
      ( MAKE-5PILE ?auto_94022 ?auto_94023 ?auto_94024 ?auto_94025 ?auto_94026 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94032 - BLOCK
      ?auto_94033 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_94033 ) ( CLEAR ?auto_94032 ) ( ON-TABLE ?auto_94032 ) ( not ( = ?auto_94032 ?auto_94033 ) ) )
    :subtasks
    ( ( !STACK ?auto_94033 ?auto_94032 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94034 - BLOCK
      ?auto_94035 - BLOCK
    )
    :vars
    (
      ?auto_94036 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_94034 ) ( ON-TABLE ?auto_94034 ) ( not ( = ?auto_94034 ?auto_94035 ) ) ( ON ?auto_94035 ?auto_94036 ) ( CLEAR ?auto_94035 ) ( HAND-EMPTY ) ( not ( = ?auto_94034 ?auto_94036 ) ) ( not ( = ?auto_94035 ?auto_94036 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94035 ?auto_94036 )
      ( MAKE-2PILE ?auto_94034 ?auto_94035 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94037 - BLOCK
      ?auto_94038 - BLOCK
    )
    :vars
    (
      ?auto_94039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94037 ?auto_94038 ) ) ( ON ?auto_94038 ?auto_94039 ) ( CLEAR ?auto_94038 ) ( not ( = ?auto_94037 ?auto_94039 ) ) ( not ( = ?auto_94038 ?auto_94039 ) ) ( HOLDING ?auto_94037 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94037 )
      ( MAKE-2PILE ?auto_94037 ?auto_94038 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94040 - BLOCK
      ?auto_94041 - BLOCK
    )
    :vars
    (
      ?auto_94042 - BLOCK
      ?auto_94044 - BLOCK
      ?auto_94046 - BLOCK
      ?auto_94043 - BLOCK
      ?auto_94045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94040 ?auto_94041 ) ) ( ON ?auto_94041 ?auto_94042 ) ( not ( = ?auto_94040 ?auto_94042 ) ) ( not ( = ?auto_94041 ?auto_94042 ) ) ( ON ?auto_94040 ?auto_94041 ) ( CLEAR ?auto_94040 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94044 ) ( ON ?auto_94046 ?auto_94044 ) ( ON ?auto_94043 ?auto_94046 ) ( ON ?auto_94045 ?auto_94043 ) ( ON ?auto_94042 ?auto_94045 ) ( not ( = ?auto_94044 ?auto_94046 ) ) ( not ( = ?auto_94044 ?auto_94043 ) ) ( not ( = ?auto_94044 ?auto_94045 ) ) ( not ( = ?auto_94044 ?auto_94042 ) ) ( not ( = ?auto_94044 ?auto_94041 ) ) ( not ( = ?auto_94044 ?auto_94040 ) ) ( not ( = ?auto_94046 ?auto_94043 ) ) ( not ( = ?auto_94046 ?auto_94045 ) ) ( not ( = ?auto_94046 ?auto_94042 ) ) ( not ( = ?auto_94046 ?auto_94041 ) ) ( not ( = ?auto_94046 ?auto_94040 ) ) ( not ( = ?auto_94043 ?auto_94045 ) ) ( not ( = ?auto_94043 ?auto_94042 ) ) ( not ( = ?auto_94043 ?auto_94041 ) ) ( not ( = ?auto_94043 ?auto_94040 ) ) ( not ( = ?auto_94045 ?auto_94042 ) ) ( not ( = ?auto_94045 ?auto_94041 ) ) ( not ( = ?auto_94045 ?auto_94040 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94044 ?auto_94046 ?auto_94043 ?auto_94045 ?auto_94042 ?auto_94041 )
      ( MAKE-2PILE ?auto_94040 ?auto_94041 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94047 - BLOCK
      ?auto_94048 - BLOCK
    )
    :vars
    (
      ?auto_94050 - BLOCK
      ?auto_94049 - BLOCK
      ?auto_94052 - BLOCK
      ?auto_94051 - BLOCK
      ?auto_94053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94047 ?auto_94048 ) ) ( ON ?auto_94048 ?auto_94050 ) ( not ( = ?auto_94047 ?auto_94050 ) ) ( not ( = ?auto_94048 ?auto_94050 ) ) ( ON-TABLE ?auto_94049 ) ( ON ?auto_94052 ?auto_94049 ) ( ON ?auto_94051 ?auto_94052 ) ( ON ?auto_94053 ?auto_94051 ) ( ON ?auto_94050 ?auto_94053 ) ( not ( = ?auto_94049 ?auto_94052 ) ) ( not ( = ?auto_94049 ?auto_94051 ) ) ( not ( = ?auto_94049 ?auto_94053 ) ) ( not ( = ?auto_94049 ?auto_94050 ) ) ( not ( = ?auto_94049 ?auto_94048 ) ) ( not ( = ?auto_94049 ?auto_94047 ) ) ( not ( = ?auto_94052 ?auto_94051 ) ) ( not ( = ?auto_94052 ?auto_94053 ) ) ( not ( = ?auto_94052 ?auto_94050 ) ) ( not ( = ?auto_94052 ?auto_94048 ) ) ( not ( = ?auto_94052 ?auto_94047 ) ) ( not ( = ?auto_94051 ?auto_94053 ) ) ( not ( = ?auto_94051 ?auto_94050 ) ) ( not ( = ?auto_94051 ?auto_94048 ) ) ( not ( = ?auto_94051 ?auto_94047 ) ) ( not ( = ?auto_94053 ?auto_94050 ) ) ( not ( = ?auto_94053 ?auto_94048 ) ) ( not ( = ?auto_94053 ?auto_94047 ) ) ( HOLDING ?auto_94047 ) ( CLEAR ?auto_94048 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94049 ?auto_94052 ?auto_94051 ?auto_94053 ?auto_94050 ?auto_94048 ?auto_94047 )
      ( MAKE-2PILE ?auto_94047 ?auto_94048 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94054 - BLOCK
      ?auto_94055 - BLOCK
    )
    :vars
    (
      ?auto_94057 - BLOCK
      ?auto_94058 - BLOCK
      ?auto_94060 - BLOCK
      ?auto_94056 - BLOCK
      ?auto_94059 - BLOCK
      ?auto_94061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94054 ?auto_94055 ) ) ( ON ?auto_94055 ?auto_94057 ) ( not ( = ?auto_94054 ?auto_94057 ) ) ( not ( = ?auto_94055 ?auto_94057 ) ) ( ON-TABLE ?auto_94058 ) ( ON ?auto_94060 ?auto_94058 ) ( ON ?auto_94056 ?auto_94060 ) ( ON ?auto_94059 ?auto_94056 ) ( ON ?auto_94057 ?auto_94059 ) ( not ( = ?auto_94058 ?auto_94060 ) ) ( not ( = ?auto_94058 ?auto_94056 ) ) ( not ( = ?auto_94058 ?auto_94059 ) ) ( not ( = ?auto_94058 ?auto_94057 ) ) ( not ( = ?auto_94058 ?auto_94055 ) ) ( not ( = ?auto_94058 ?auto_94054 ) ) ( not ( = ?auto_94060 ?auto_94056 ) ) ( not ( = ?auto_94060 ?auto_94059 ) ) ( not ( = ?auto_94060 ?auto_94057 ) ) ( not ( = ?auto_94060 ?auto_94055 ) ) ( not ( = ?auto_94060 ?auto_94054 ) ) ( not ( = ?auto_94056 ?auto_94059 ) ) ( not ( = ?auto_94056 ?auto_94057 ) ) ( not ( = ?auto_94056 ?auto_94055 ) ) ( not ( = ?auto_94056 ?auto_94054 ) ) ( not ( = ?auto_94059 ?auto_94057 ) ) ( not ( = ?auto_94059 ?auto_94055 ) ) ( not ( = ?auto_94059 ?auto_94054 ) ) ( CLEAR ?auto_94055 ) ( ON ?auto_94054 ?auto_94061 ) ( CLEAR ?auto_94054 ) ( HAND-EMPTY ) ( not ( = ?auto_94054 ?auto_94061 ) ) ( not ( = ?auto_94055 ?auto_94061 ) ) ( not ( = ?auto_94057 ?auto_94061 ) ) ( not ( = ?auto_94058 ?auto_94061 ) ) ( not ( = ?auto_94060 ?auto_94061 ) ) ( not ( = ?auto_94056 ?auto_94061 ) ) ( not ( = ?auto_94059 ?auto_94061 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94054 ?auto_94061 )
      ( MAKE-2PILE ?auto_94054 ?auto_94055 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94062 - BLOCK
      ?auto_94063 - BLOCK
    )
    :vars
    (
      ?auto_94068 - BLOCK
      ?auto_94069 - BLOCK
      ?auto_94066 - BLOCK
      ?auto_94065 - BLOCK
      ?auto_94067 - BLOCK
      ?auto_94064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94062 ?auto_94063 ) ) ( not ( = ?auto_94062 ?auto_94068 ) ) ( not ( = ?auto_94063 ?auto_94068 ) ) ( ON-TABLE ?auto_94069 ) ( ON ?auto_94066 ?auto_94069 ) ( ON ?auto_94065 ?auto_94066 ) ( ON ?auto_94067 ?auto_94065 ) ( ON ?auto_94068 ?auto_94067 ) ( not ( = ?auto_94069 ?auto_94066 ) ) ( not ( = ?auto_94069 ?auto_94065 ) ) ( not ( = ?auto_94069 ?auto_94067 ) ) ( not ( = ?auto_94069 ?auto_94068 ) ) ( not ( = ?auto_94069 ?auto_94063 ) ) ( not ( = ?auto_94069 ?auto_94062 ) ) ( not ( = ?auto_94066 ?auto_94065 ) ) ( not ( = ?auto_94066 ?auto_94067 ) ) ( not ( = ?auto_94066 ?auto_94068 ) ) ( not ( = ?auto_94066 ?auto_94063 ) ) ( not ( = ?auto_94066 ?auto_94062 ) ) ( not ( = ?auto_94065 ?auto_94067 ) ) ( not ( = ?auto_94065 ?auto_94068 ) ) ( not ( = ?auto_94065 ?auto_94063 ) ) ( not ( = ?auto_94065 ?auto_94062 ) ) ( not ( = ?auto_94067 ?auto_94068 ) ) ( not ( = ?auto_94067 ?auto_94063 ) ) ( not ( = ?auto_94067 ?auto_94062 ) ) ( ON ?auto_94062 ?auto_94064 ) ( CLEAR ?auto_94062 ) ( not ( = ?auto_94062 ?auto_94064 ) ) ( not ( = ?auto_94063 ?auto_94064 ) ) ( not ( = ?auto_94068 ?auto_94064 ) ) ( not ( = ?auto_94069 ?auto_94064 ) ) ( not ( = ?auto_94066 ?auto_94064 ) ) ( not ( = ?auto_94065 ?auto_94064 ) ) ( not ( = ?auto_94067 ?auto_94064 ) ) ( HOLDING ?auto_94063 ) ( CLEAR ?auto_94068 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94069 ?auto_94066 ?auto_94065 ?auto_94067 ?auto_94068 ?auto_94063 )
      ( MAKE-2PILE ?auto_94062 ?auto_94063 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94070 - BLOCK
      ?auto_94071 - BLOCK
    )
    :vars
    (
      ?auto_94076 - BLOCK
      ?auto_94074 - BLOCK
      ?auto_94077 - BLOCK
      ?auto_94072 - BLOCK
      ?auto_94073 - BLOCK
      ?auto_94075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94070 ?auto_94071 ) ) ( not ( = ?auto_94070 ?auto_94076 ) ) ( not ( = ?auto_94071 ?auto_94076 ) ) ( ON-TABLE ?auto_94074 ) ( ON ?auto_94077 ?auto_94074 ) ( ON ?auto_94072 ?auto_94077 ) ( ON ?auto_94073 ?auto_94072 ) ( ON ?auto_94076 ?auto_94073 ) ( not ( = ?auto_94074 ?auto_94077 ) ) ( not ( = ?auto_94074 ?auto_94072 ) ) ( not ( = ?auto_94074 ?auto_94073 ) ) ( not ( = ?auto_94074 ?auto_94076 ) ) ( not ( = ?auto_94074 ?auto_94071 ) ) ( not ( = ?auto_94074 ?auto_94070 ) ) ( not ( = ?auto_94077 ?auto_94072 ) ) ( not ( = ?auto_94077 ?auto_94073 ) ) ( not ( = ?auto_94077 ?auto_94076 ) ) ( not ( = ?auto_94077 ?auto_94071 ) ) ( not ( = ?auto_94077 ?auto_94070 ) ) ( not ( = ?auto_94072 ?auto_94073 ) ) ( not ( = ?auto_94072 ?auto_94076 ) ) ( not ( = ?auto_94072 ?auto_94071 ) ) ( not ( = ?auto_94072 ?auto_94070 ) ) ( not ( = ?auto_94073 ?auto_94076 ) ) ( not ( = ?auto_94073 ?auto_94071 ) ) ( not ( = ?auto_94073 ?auto_94070 ) ) ( ON ?auto_94070 ?auto_94075 ) ( not ( = ?auto_94070 ?auto_94075 ) ) ( not ( = ?auto_94071 ?auto_94075 ) ) ( not ( = ?auto_94076 ?auto_94075 ) ) ( not ( = ?auto_94074 ?auto_94075 ) ) ( not ( = ?auto_94077 ?auto_94075 ) ) ( not ( = ?auto_94072 ?auto_94075 ) ) ( not ( = ?auto_94073 ?auto_94075 ) ) ( CLEAR ?auto_94076 ) ( ON ?auto_94071 ?auto_94070 ) ( CLEAR ?auto_94071 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94075 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94075 ?auto_94070 )
      ( MAKE-2PILE ?auto_94070 ?auto_94071 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94078 - BLOCK
      ?auto_94079 - BLOCK
    )
    :vars
    (
      ?auto_94084 - BLOCK
      ?auto_94085 - BLOCK
      ?auto_94080 - BLOCK
      ?auto_94081 - BLOCK
      ?auto_94083 - BLOCK
      ?auto_94082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94078 ?auto_94079 ) ) ( not ( = ?auto_94078 ?auto_94084 ) ) ( not ( = ?auto_94079 ?auto_94084 ) ) ( ON-TABLE ?auto_94085 ) ( ON ?auto_94080 ?auto_94085 ) ( ON ?auto_94081 ?auto_94080 ) ( ON ?auto_94083 ?auto_94081 ) ( not ( = ?auto_94085 ?auto_94080 ) ) ( not ( = ?auto_94085 ?auto_94081 ) ) ( not ( = ?auto_94085 ?auto_94083 ) ) ( not ( = ?auto_94085 ?auto_94084 ) ) ( not ( = ?auto_94085 ?auto_94079 ) ) ( not ( = ?auto_94085 ?auto_94078 ) ) ( not ( = ?auto_94080 ?auto_94081 ) ) ( not ( = ?auto_94080 ?auto_94083 ) ) ( not ( = ?auto_94080 ?auto_94084 ) ) ( not ( = ?auto_94080 ?auto_94079 ) ) ( not ( = ?auto_94080 ?auto_94078 ) ) ( not ( = ?auto_94081 ?auto_94083 ) ) ( not ( = ?auto_94081 ?auto_94084 ) ) ( not ( = ?auto_94081 ?auto_94079 ) ) ( not ( = ?auto_94081 ?auto_94078 ) ) ( not ( = ?auto_94083 ?auto_94084 ) ) ( not ( = ?auto_94083 ?auto_94079 ) ) ( not ( = ?auto_94083 ?auto_94078 ) ) ( ON ?auto_94078 ?auto_94082 ) ( not ( = ?auto_94078 ?auto_94082 ) ) ( not ( = ?auto_94079 ?auto_94082 ) ) ( not ( = ?auto_94084 ?auto_94082 ) ) ( not ( = ?auto_94085 ?auto_94082 ) ) ( not ( = ?auto_94080 ?auto_94082 ) ) ( not ( = ?auto_94081 ?auto_94082 ) ) ( not ( = ?auto_94083 ?auto_94082 ) ) ( ON ?auto_94079 ?auto_94078 ) ( CLEAR ?auto_94079 ) ( ON-TABLE ?auto_94082 ) ( HOLDING ?auto_94084 ) ( CLEAR ?auto_94083 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94085 ?auto_94080 ?auto_94081 ?auto_94083 ?auto_94084 )
      ( MAKE-2PILE ?auto_94078 ?auto_94079 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94086 - BLOCK
      ?auto_94087 - BLOCK
    )
    :vars
    (
      ?auto_94093 - BLOCK
      ?auto_94090 - BLOCK
      ?auto_94091 - BLOCK
      ?auto_94092 - BLOCK
      ?auto_94088 - BLOCK
      ?auto_94089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94086 ?auto_94087 ) ) ( not ( = ?auto_94086 ?auto_94093 ) ) ( not ( = ?auto_94087 ?auto_94093 ) ) ( ON-TABLE ?auto_94090 ) ( ON ?auto_94091 ?auto_94090 ) ( ON ?auto_94092 ?auto_94091 ) ( ON ?auto_94088 ?auto_94092 ) ( not ( = ?auto_94090 ?auto_94091 ) ) ( not ( = ?auto_94090 ?auto_94092 ) ) ( not ( = ?auto_94090 ?auto_94088 ) ) ( not ( = ?auto_94090 ?auto_94093 ) ) ( not ( = ?auto_94090 ?auto_94087 ) ) ( not ( = ?auto_94090 ?auto_94086 ) ) ( not ( = ?auto_94091 ?auto_94092 ) ) ( not ( = ?auto_94091 ?auto_94088 ) ) ( not ( = ?auto_94091 ?auto_94093 ) ) ( not ( = ?auto_94091 ?auto_94087 ) ) ( not ( = ?auto_94091 ?auto_94086 ) ) ( not ( = ?auto_94092 ?auto_94088 ) ) ( not ( = ?auto_94092 ?auto_94093 ) ) ( not ( = ?auto_94092 ?auto_94087 ) ) ( not ( = ?auto_94092 ?auto_94086 ) ) ( not ( = ?auto_94088 ?auto_94093 ) ) ( not ( = ?auto_94088 ?auto_94087 ) ) ( not ( = ?auto_94088 ?auto_94086 ) ) ( ON ?auto_94086 ?auto_94089 ) ( not ( = ?auto_94086 ?auto_94089 ) ) ( not ( = ?auto_94087 ?auto_94089 ) ) ( not ( = ?auto_94093 ?auto_94089 ) ) ( not ( = ?auto_94090 ?auto_94089 ) ) ( not ( = ?auto_94091 ?auto_94089 ) ) ( not ( = ?auto_94092 ?auto_94089 ) ) ( not ( = ?auto_94088 ?auto_94089 ) ) ( ON ?auto_94087 ?auto_94086 ) ( ON-TABLE ?auto_94089 ) ( CLEAR ?auto_94088 ) ( ON ?auto_94093 ?auto_94087 ) ( CLEAR ?auto_94093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94089 ?auto_94086 ?auto_94087 )
      ( MAKE-2PILE ?auto_94086 ?auto_94087 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94094 - BLOCK
      ?auto_94095 - BLOCK
    )
    :vars
    (
      ?auto_94097 - BLOCK
      ?auto_94101 - BLOCK
      ?auto_94100 - BLOCK
      ?auto_94099 - BLOCK
      ?auto_94098 - BLOCK
      ?auto_94096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94094 ?auto_94095 ) ) ( not ( = ?auto_94094 ?auto_94097 ) ) ( not ( = ?auto_94095 ?auto_94097 ) ) ( ON-TABLE ?auto_94101 ) ( ON ?auto_94100 ?auto_94101 ) ( ON ?auto_94099 ?auto_94100 ) ( not ( = ?auto_94101 ?auto_94100 ) ) ( not ( = ?auto_94101 ?auto_94099 ) ) ( not ( = ?auto_94101 ?auto_94098 ) ) ( not ( = ?auto_94101 ?auto_94097 ) ) ( not ( = ?auto_94101 ?auto_94095 ) ) ( not ( = ?auto_94101 ?auto_94094 ) ) ( not ( = ?auto_94100 ?auto_94099 ) ) ( not ( = ?auto_94100 ?auto_94098 ) ) ( not ( = ?auto_94100 ?auto_94097 ) ) ( not ( = ?auto_94100 ?auto_94095 ) ) ( not ( = ?auto_94100 ?auto_94094 ) ) ( not ( = ?auto_94099 ?auto_94098 ) ) ( not ( = ?auto_94099 ?auto_94097 ) ) ( not ( = ?auto_94099 ?auto_94095 ) ) ( not ( = ?auto_94099 ?auto_94094 ) ) ( not ( = ?auto_94098 ?auto_94097 ) ) ( not ( = ?auto_94098 ?auto_94095 ) ) ( not ( = ?auto_94098 ?auto_94094 ) ) ( ON ?auto_94094 ?auto_94096 ) ( not ( = ?auto_94094 ?auto_94096 ) ) ( not ( = ?auto_94095 ?auto_94096 ) ) ( not ( = ?auto_94097 ?auto_94096 ) ) ( not ( = ?auto_94101 ?auto_94096 ) ) ( not ( = ?auto_94100 ?auto_94096 ) ) ( not ( = ?auto_94099 ?auto_94096 ) ) ( not ( = ?auto_94098 ?auto_94096 ) ) ( ON ?auto_94095 ?auto_94094 ) ( ON-TABLE ?auto_94096 ) ( ON ?auto_94097 ?auto_94095 ) ( CLEAR ?auto_94097 ) ( HOLDING ?auto_94098 ) ( CLEAR ?auto_94099 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94101 ?auto_94100 ?auto_94099 ?auto_94098 )
      ( MAKE-2PILE ?auto_94094 ?auto_94095 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94102 - BLOCK
      ?auto_94103 - BLOCK
    )
    :vars
    (
      ?auto_94105 - BLOCK
      ?auto_94104 - BLOCK
      ?auto_94107 - BLOCK
      ?auto_94109 - BLOCK
      ?auto_94108 - BLOCK
      ?auto_94106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94102 ?auto_94103 ) ) ( not ( = ?auto_94102 ?auto_94105 ) ) ( not ( = ?auto_94103 ?auto_94105 ) ) ( ON-TABLE ?auto_94104 ) ( ON ?auto_94107 ?auto_94104 ) ( ON ?auto_94109 ?auto_94107 ) ( not ( = ?auto_94104 ?auto_94107 ) ) ( not ( = ?auto_94104 ?auto_94109 ) ) ( not ( = ?auto_94104 ?auto_94108 ) ) ( not ( = ?auto_94104 ?auto_94105 ) ) ( not ( = ?auto_94104 ?auto_94103 ) ) ( not ( = ?auto_94104 ?auto_94102 ) ) ( not ( = ?auto_94107 ?auto_94109 ) ) ( not ( = ?auto_94107 ?auto_94108 ) ) ( not ( = ?auto_94107 ?auto_94105 ) ) ( not ( = ?auto_94107 ?auto_94103 ) ) ( not ( = ?auto_94107 ?auto_94102 ) ) ( not ( = ?auto_94109 ?auto_94108 ) ) ( not ( = ?auto_94109 ?auto_94105 ) ) ( not ( = ?auto_94109 ?auto_94103 ) ) ( not ( = ?auto_94109 ?auto_94102 ) ) ( not ( = ?auto_94108 ?auto_94105 ) ) ( not ( = ?auto_94108 ?auto_94103 ) ) ( not ( = ?auto_94108 ?auto_94102 ) ) ( ON ?auto_94102 ?auto_94106 ) ( not ( = ?auto_94102 ?auto_94106 ) ) ( not ( = ?auto_94103 ?auto_94106 ) ) ( not ( = ?auto_94105 ?auto_94106 ) ) ( not ( = ?auto_94104 ?auto_94106 ) ) ( not ( = ?auto_94107 ?auto_94106 ) ) ( not ( = ?auto_94109 ?auto_94106 ) ) ( not ( = ?auto_94108 ?auto_94106 ) ) ( ON ?auto_94103 ?auto_94102 ) ( ON-TABLE ?auto_94106 ) ( ON ?auto_94105 ?auto_94103 ) ( CLEAR ?auto_94109 ) ( ON ?auto_94108 ?auto_94105 ) ( CLEAR ?auto_94108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94106 ?auto_94102 ?auto_94103 ?auto_94105 )
      ( MAKE-2PILE ?auto_94102 ?auto_94103 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94110 - BLOCK
      ?auto_94111 - BLOCK
    )
    :vars
    (
      ?auto_94116 - BLOCK
      ?auto_94115 - BLOCK
      ?auto_94112 - BLOCK
      ?auto_94117 - BLOCK
      ?auto_94114 - BLOCK
      ?auto_94113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94110 ?auto_94111 ) ) ( not ( = ?auto_94110 ?auto_94116 ) ) ( not ( = ?auto_94111 ?auto_94116 ) ) ( ON-TABLE ?auto_94115 ) ( ON ?auto_94112 ?auto_94115 ) ( not ( = ?auto_94115 ?auto_94112 ) ) ( not ( = ?auto_94115 ?auto_94117 ) ) ( not ( = ?auto_94115 ?auto_94114 ) ) ( not ( = ?auto_94115 ?auto_94116 ) ) ( not ( = ?auto_94115 ?auto_94111 ) ) ( not ( = ?auto_94115 ?auto_94110 ) ) ( not ( = ?auto_94112 ?auto_94117 ) ) ( not ( = ?auto_94112 ?auto_94114 ) ) ( not ( = ?auto_94112 ?auto_94116 ) ) ( not ( = ?auto_94112 ?auto_94111 ) ) ( not ( = ?auto_94112 ?auto_94110 ) ) ( not ( = ?auto_94117 ?auto_94114 ) ) ( not ( = ?auto_94117 ?auto_94116 ) ) ( not ( = ?auto_94117 ?auto_94111 ) ) ( not ( = ?auto_94117 ?auto_94110 ) ) ( not ( = ?auto_94114 ?auto_94116 ) ) ( not ( = ?auto_94114 ?auto_94111 ) ) ( not ( = ?auto_94114 ?auto_94110 ) ) ( ON ?auto_94110 ?auto_94113 ) ( not ( = ?auto_94110 ?auto_94113 ) ) ( not ( = ?auto_94111 ?auto_94113 ) ) ( not ( = ?auto_94116 ?auto_94113 ) ) ( not ( = ?auto_94115 ?auto_94113 ) ) ( not ( = ?auto_94112 ?auto_94113 ) ) ( not ( = ?auto_94117 ?auto_94113 ) ) ( not ( = ?auto_94114 ?auto_94113 ) ) ( ON ?auto_94111 ?auto_94110 ) ( ON-TABLE ?auto_94113 ) ( ON ?auto_94116 ?auto_94111 ) ( ON ?auto_94114 ?auto_94116 ) ( CLEAR ?auto_94114 ) ( HOLDING ?auto_94117 ) ( CLEAR ?auto_94112 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94115 ?auto_94112 ?auto_94117 )
      ( MAKE-2PILE ?auto_94110 ?auto_94111 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94118 - BLOCK
      ?auto_94119 - BLOCK
    )
    :vars
    (
      ?auto_94121 - BLOCK
      ?auto_94125 - BLOCK
      ?auto_94122 - BLOCK
      ?auto_94120 - BLOCK
      ?auto_94123 - BLOCK
      ?auto_94124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94118 ?auto_94119 ) ) ( not ( = ?auto_94118 ?auto_94121 ) ) ( not ( = ?auto_94119 ?auto_94121 ) ) ( ON-TABLE ?auto_94125 ) ( ON ?auto_94122 ?auto_94125 ) ( not ( = ?auto_94125 ?auto_94122 ) ) ( not ( = ?auto_94125 ?auto_94120 ) ) ( not ( = ?auto_94125 ?auto_94123 ) ) ( not ( = ?auto_94125 ?auto_94121 ) ) ( not ( = ?auto_94125 ?auto_94119 ) ) ( not ( = ?auto_94125 ?auto_94118 ) ) ( not ( = ?auto_94122 ?auto_94120 ) ) ( not ( = ?auto_94122 ?auto_94123 ) ) ( not ( = ?auto_94122 ?auto_94121 ) ) ( not ( = ?auto_94122 ?auto_94119 ) ) ( not ( = ?auto_94122 ?auto_94118 ) ) ( not ( = ?auto_94120 ?auto_94123 ) ) ( not ( = ?auto_94120 ?auto_94121 ) ) ( not ( = ?auto_94120 ?auto_94119 ) ) ( not ( = ?auto_94120 ?auto_94118 ) ) ( not ( = ?auto_94123 ?auto_94121 ) ) ( not ( = ?auto_94123 ?auto_94119 ) ) ( not ( = ?auto_94123 ?auto_94118 ) ) ( ON ?auto_94118 ?auto_94124 ) ( not ( = ?auto_94118 ?auto_94124 ) ) ( not ( = ?auto_94119 ?auto_94124 ) ) ( not ( = ?auto_94121 ?auto_94124 ) ) ( not ( = ?auto_94125 ?auto_94124 ) ) ( not ( = ?auto_94122 ?auto_94124 ) ) ( not ( = ?auto_94120 ?auto_94124 ) ) ( not ( = ?auto_94123 ?auto_94124 ) ) ( ON ?auto_94119 ?auto_94118 ) ( ON-TABLE ?auto_94124 ) ( ON ?auto_94121 ?auto_94119 ) ( ON ?auto_94123 ?auto_94121 ) ( CLEAR ?auto_94122 ) ( ON ?auto_94120 ?auto_94123 ) ( CLEAR ?auto_94120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94124 ?auto_94118 ?auto_94119 ?auto_94121 ?auto_94123 )
      ( MAKE-2PILE ?auto_94118 ?auto_94119 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94126 - BLOCK
      ?auto_94127 - BLOCK
    )
    :vars
    (
      ?auto_94133 - BLOCK
      ?auto_94130 - BLOCK
      ?auto_94132 - BLOCK
      ?auto_94129 - BLOCK
      ?auto_94128 - BLOCK
      ?auto_94131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94126 ?auto_94127 ) ) ( not ( = ?auto_94126 ?auto_94133 ) ) ( not ( = ?auto_94127 ?auto_94133 ) ) ( ON-TABLE ?auto_94130 ) ( not ( = ?auto_94130 ?auto_94132 ) ) ( not ( = ?auto_94130 ?auto_94129 ) ) ( not ( = ?auto_94130 ?auto_94128 ) ) ( not ( = ?auto_94130 ?auto_94133 ) ) ( not ( = ?auto_94130 ?auto_94127 ) ) ( not ( = ?auto_94130 ?auto_94126 ) ) ( not ( = ?auto_94132 ?auto_94129 ) ) ( not ( = ?auto_94132 ?auto_94128 ) ) ( not ( = ?auto_94132 ?auto_94133 ) ) ( not ( = ?auto_94132 ?auto_94127 ) ) ( not ( = ?auto_94132 ?auto_94126 ) ) ( not ( = ?auto_94129 ?auto_94128 ) ) ( not ( = ?auto_94129 ?auto_94133 ) ) ( not ( = ?auto_94129 ?auto_94127 ) ) ( not ( = ?auto_94129 ?auto_94126 ) ) ( not ( = ?auto_94128 ?auto_94133 ) ) ( not ( = ?auto_94128 ?auto_94127 ) ) ( not ( = ?auto_94128 ?auto_94126 ) ) ( ON ?auto_94126 ?auto_94131 ) ( not ( = ?auto_94126 ?auto_94131 ) ) ( not ( = ?auto_94127 ?auto_94131 ) ) ( not ( = ?auto_94133 ?auto_94131 ) ) ( not ( = ?auto_94130 ?auto_94131 ) ) ( not ( = ?auto_94132 ?auto_94131 ) ) ( not ( = ?auto_94129 ?auto_94131 ) ) ( not ( = ?auto_94128 ?auto_94131 ) ) ( ON ?auto_94127 ?auto_94126 ) ( ON-TABLE ?auto_94131 ) ( ON ?auto_94133 ?auto_94127 ) ( ON ?auto_94128 ?auto_94133 ) ( ON ?auto_94129 ?auto_94128 ) ( CLEAR ?auto_94129 ) ( HOLDING ?auto_94132 ) ( CLEAR ?auto_94130 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94130 ?auto_94132 )
      ( MAKE-2PILE ?auto_94126 ?auto_94127 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94134 - BLOCK
      ?auto_94135 - BLOCK
    )
    :vars
    (
      ?auto_94141 - BLOCK
      ?auto_94136 - BLOCK
      ?auto_94137 - BLOCK
      ?auto_94140 - BLOCK
      ?auto_94139 - BLOCK
      ?auto_94138 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94134 ?auto_94135 ) ) ( not ( = ?auto_94134 ?auto_94141 ) ) ( not ( = ?auto_94135 ?auto_94141 ) ) ( ON-TABLE ?auto_94136 ) ( not ( = ?auto_94136 ?auto_94137 ) ) ( not ( = ?auto_94136 ?auto_94140 ) ) ( not ( = ?auto_94136 ?auto_94139 ) ) ( not ( = ?auto_94136 ?auto_94141 ) ) ( not ( = ?auto_94136 ?auto_94135 ) ) ( not ( = ?auto_94136 ?auto_94134 ) ) ( not ( = ?auto_94137 ?auto_94140 ) ) ( not ( = ?auto_94137 ?auto_94139 ) ) ( not ( = ?auto_94137 ?auto_94141 ) ) ( not ( = ?auto_94137 ?auto_94135 ) ) ( not ( = ?auto_94137 ?auto_94134 ) ) ( not ( = ?auto_94140 ?auto_94139 ) ) ( not ( = ?auto_94140 ?auto_94141 ) ) ( not ( = ?auto_94140 ?auto_94135 ) ) ( not ( = ?auto_94140 ?auto_94134 ) ) ( not ( = ?auto_94139 ?auto_94141 ) ) ( not ( = ?auto_94139 ?auto_94135 ) ) ( not ( = ?auto_94139 ?auto_94134 ) ) ( ON ?auto_94134 ?auto_94138 ) ( not ( = ?auto_94134 ?auto_94138 ) ) ( not ( = ?auto_94135 ?auto_94138 ) ) ( not ( = ?auto_94141 ?auto_94138 ) ) ( not ( = ?auto_94136 ?auto_94138 ) ) ( not ( = ?auto_94137 ?auto_94138 ) ) ( not ( = ?auto_94140 ?auto_94138 ) ) ( not ( = ?auto_94139 ?auto_94138 ) ) ( ON ?auto_94135 ?auto_94134 ) ( ON-TABLE ?auto_94138 ) ( ON ?auto_94141 ?auto_94135 ) ( ON ?auto_94139 ?auto_94141 ) ( ON ?auto_94140 ?auto_94139 ) ( CLEAR ?auto_94136 ) ( ON ?auto_94137 ?auto_94140 ) ( CLEAR ?auto_94137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94138 ?auto_94134 ?auto_94135 ?auto_94141 ?auto_94139 ?auto_94140 )
      ( MAKE-2PILE ?auto_94134 ?auto_94135 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94142 - BLOCK
      ?auto_94143 - BLOCK
    )
    :vars
    (
      ?auto_94146 - BLOCK
      ?auto_94149 - BLOCK
      ?auto_94145 - BLOCK
      ?auto_94147 - BLOCK
      ?auto_94144 - BLOCK
      ?auto_94148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94142 ?auto_94143 ) ) ( not ( = ?auto_94142 ?auto_94146 ) ) ( not ( = ?auto_94143 ?auto_94146 ) ) ( not ( = ?auto_94149 ?auto_94145 ) ) ( not ( = ?auto_94149 ?auto_94147 ) ) ( not ( = ?auto_94149 ?auto_94144 ) ) ( not ( = ?auto_94149 ?auto_94146 ) ) ( not ( = ?auto_94149 ?auto_94143 ) ) ( not ( = ?auto_94149 ?auto_94142 ) ) ( not ( = ?auto_94145 ?auto_94147 ) ) ( not ( = ?auto_94145 ?auto_94144 ) ) ( not ( = ?auto_94145 ?auto_94146 ) ) ( not ( = ?auto_94145 ?auto_94143 ) ) ( not ( = ?auto_94145 ?auto_94142 ) ) ( not ( = ?auto_94147 ?auto_94144 ) ) ( not ( = ?auto_94147 ?auto_94146 ) ) ( not ( = ?auto_94147 ?auto_94143 ) ) ( not ( = ?auto_94147 ?auto_94142 ) ) ( not ( = ?auto_94144 ?auto_94146 ) ) ( not ( = ?auto_94144 ?auto_94143 ) ) ( not ( = ?auto_94144 ?auto_94142 ) ) ( ON ?auto_94142 ?auto_94148 ) ( not ( = ?auto_94142 ?auto_94148 ) ) ( not ( = ?auto_94143 ?auto_94148 ) ) ( not ( = ?auto_94146 ?auto_94148 ) ) ( not ( = ?auto_94149 ?auto_94148 ) ) ( not ( = ?auto_94145 ?auto_94148 ) ) ( not ( = ?auto_94147 ?auto_94148 ) ) ( not ( = ?auto_94144 ?auto_94148 ) ) ( ON ?auto_94143 ?auto_94142 ) ( ON-TABLE ?auto_94148 ) ( ON ?auto_94146 ?auto_94143 ) ( ON ?auto_94144 ?auto_94146 ) ( ON ?auto_94147 ?auto_94144 ) ( ON ?auto_94145 ?auto_94147 ) ( CLEAR ?auto_94145 ) ( HOLDING ?auto_94149 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94149 )
      ( MAKE-2PILE ?auto_94142 ?auto_94143 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94150 - BLOCK
      ?auto_94151 - BLOCK
    )
    :vars
    (
      ?auto_94152 - BLOCK
      ?auto_94155 - BLOCK
      ?auto_94154 - BLOCK
      ?auto_94153 - BLOCK
      ?auto_94157 - BLOCK
      ?auto_94156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94150 ?auto_94151 ) ) ( not ( = ?auto_94150 ?auto_94152 ) ) ( not ( = ?auto_94151 ?auto_94152 ) ) ( not ( = ?auto_94155 ?auto_94154 ) ) ( not ( = ?auto_94155 ?auto_94153 ) ) ( not ( = ?auto_94155 ?auto_94157 ) ) ( not ( = ?auto_94155 ?auto_94152 ) ) ( not ( = ?auto_94155 ?auto_94151 ) ) ( not ( = ?auto_94155 ?auto_94150 ) ) ( not ( = ?auto_94154 ?auto_94153 ) ) ( not ( = ?auto_94154 ?auto_94157 ) ) ( not ( = ?auto_94154 ?auto_94152 ) ) ( not ( = ?auto_94154 ?auto_94151 ) ) ( not ( = ?auto_94154 ?auto_94150 ) ) ( not ( = ?auto_94153 ?auto_94157 ) ) ( not ( = ?auto_94153 ?auto_94152 ) ) ( not ( = ?auto_94153 ?auto_94151 ) ) ( not ( = ?auto_94153 ?auto_94150 ) ) ( not ( = ?auto_94157 ?auto_94152 ) ) ( not ( = ?auto_94157 ?auto_94151 ) ) ( not ( = ?auto_94157 ?auto_94150 ) ) ( ON ?auto_94150 ?auto_94156 ) ( not ( = ?auto_94150 ?auto_94156 ) ) ( not ( = ?auto_94151 ?auto_94156 ) ) ( not ( = ?auto_94152 ?auto_94156 ) ) ( not ( = ?auto_94155 ?auto_94156 ) ) ( not ( = ?auto_94154 ?auto_94156 ) ) ( not ( = ?auto_94153 ?auto_94156 ) ) ( not ( = ?auto_94157 ?auto_94156 ) ) ( ON ?auto_94151 ?auto_94150 ) ( ON-TABLE ?auto_94156 ) ( ON ?auto_94152 ?auto_94151 ) ( ON ?auto_94157 ?auto_94152 ) ( ON ?auto_94153 ?auto_94157 ) ( ON ?auto_94154 ?auto_94153 ) ( ON ?auto_94155 ?auto_94154 ) ( CLEAR ?auto_94155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94156 ?auto_94150 ?auto_94151 ?auto_94152 ?auto_94157 ?auto_94153 ?auto_94154 )
      ( MAKE-2PILE ?auto_94150 ?auto_94151 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94162 - BLOCK
      ?auto_94163 - BLOCK
      ?auto_94164 - BLOCK
      ?auto_94165 - BLOCK
    )
    :vars
    (
      ?auto_94166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94166 ?auto_94165 ) ( CLEAR ?auto_94166 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94162 ) ( ON ?auto_94163 ?auto_94162 ) ( ON ?auto_94164 ?auto_94163 ) ( ON ?auto_94165 ?auto_94164 ) ( not ( = ?auto_94162 ?auto_94163 ) ) ( not ( = ?auto_94162 ?auto_94164 ) ) ( not ( = ?auto_94162 ?auto_94165 ) ) ( not ( = ?auto_94162 ?auto_94166 ) ) ( not ( = ?auto_94163 ?auto_94164 ) ) ( not ( = ?auto_94163 ?auto_94165 ) ) ( not ( = ?auto_94163 ?auto_94166 ) ) ( not ( = ?auto_94164 ?auto_94165 ) ) ( not ( = ?auto_94164 ?auto_94166 ) ) ( not ( = ?auto_94165 ?auto_94166 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94166 ?auto_94165 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94167 - BLOCK
      ?auto_94168 - BLOCK
      ?auto_94169 - BLOCK
      ?auto_94170 - BLOCK
    )
    :vars
    (
      ?auto_94171 - BLOCK
      ?auto_94172 - BLOCK
      ?auto_94173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94171 ?auto_94170 ) ( CLEAR ?auto_94171 ) ( ON-TABLE ?auto_94167 ) ( ON ?auto_94168 ?auto_94167 ) ( ON ?auto_94169 ?auto_94168 ) ( ON ?auto_94170 ?auto_94169 ) ( not ( = ?auto_94167 ?auto_94168 ) ) ( not ( = ?auto_94167 ?auto_94169 ) ) ( not ( = ?auto_94167 ?auto_94170 ) ) ( not ( = ?auto_94167 ?auto_94171 ) ) ( not ( = ?auto_94168 ?auto_94169 ) ) ( not ( = ?auto_94168 ?auto_94170 ) ) ( not ( = ?auto_94168 ?auto_94171 ) ) ( not ( = ?auto_94169 ?auto_94170 ) ) ( not ( = ?auto_94169 ?auto_94171 ) ) ( not ( = ?auto_94170 ?auto_94171 ) ) ( HOLDING ?auto_94172 ) ( CLEAR ?auto_94173 ) ( not ( = ?auto_94167 ?auto_94172 ) ) ( not ( = ?auto_94167 ?auto_94173 ) ) ( not ( = ?auto_94168 ?auto_94172 ) ) ( not ( = ?auto_94168 ?auto_94173 ) ) ( not ( = ?auto_94169 ?auto_94172 ) ) ( not ( = ?auto_94169 ?auto_94173 ) ) ( not ( = ?auto_94170 ?auto_94172 ) ) ( not ( = ?auto_94170 ?auto_94173 ) ) ( not ( = ?auto_94171 ?auto_94172 ) ) ( not ( = ?auto_94171 ?auto_94173 ) ) ( not ( = ?auto_94172 ?auto_94173 ) ) )
    :subtasks
    ( ( !STACK ?auto_94172 ?auto_94173 )
      ( MAKE-4PILE ?auto_94167 ?auto_94168 ?auto_94169 ?auto_94170 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94174 - BLOCK
      ?auto_94175 - BLOCK
      ?auto_94176 - BLOCK
      ?auto_94177 - BLOCK
    )
    :vars
    (
      ?auto_94178 - BLOCK
      ?auto_94180 - BLOCK
      ?auto_94179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94178 ?auto_94177 ) ( ON-TABLE ?auto_94174 ) ( ON ?auto_94175 ?auto_94174 ) ( ON ?auto_94176 ?auto_94175 ) ( ON ?auto_94177 ?auto_94176 ) ( not ( = ?auto_94174 ?auto_94175 ) ) ( not ( = ?auto_94174 ?auto_94176 ) ) ( not ( = ?auto_94174 ?auto_94177 ) ) ( not ( = ?auto_94174 ?auto_94178 ) ) ( not ( = ?auto_94175 ?auto_94176 ) ) ( not ( = ?auto_94175 ?auto_94177 ) ) ( not ( = ?auto_94175 ?auto_94178 ) ) ( not ( = ?auto_94176 ?auto_94177 ) ) ( not ( = ?auto_94176 ?auto_94178 ) ) ( not ( = ?auto_94177 ?auto_94178 ) ) ( CLEAR ?auto_94180 ) ( not ( = ?auto_94174 ?auto_94179 ) ) ( not ( = ?auto_94174 ?auto_94180 ) ) ( not ( = ?auto_94175 ?auto_94179 ) ) ( not ( = ?auto_94175 ?auto_94180 ) ) ( not ( = ?auto_94176 ?auto_94179 ) ) ( not ( = ?auto_94176 ?auto_94180 ) ) ( not ( = ?auto_94177 ?auto_94179 ) ) ( not ( = ?auto_94177 ?auto_94180 ) ) ( not ( = ?auto_94178 ?auto_94179 ) ) ( not ( = ?auto_94178 ?auto_94180 ) ) ( not ( = ?auto_94179 ?auto_94180 ) ) ( ON ?auto_94179 ?auto_94178 ) ( CLEAR ?auto_94179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94174 ?auto_94175 ?auto_94176 ?auto_94177 ?auto_94178 )
      ( MAKE-4PILE ?auto_94174 ?auto_94175 ?auto_94176 ?auto_94177 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94181 - BLOCK
      ?auto_94182 - BLOCK
      ?auto_94183 - BLOCK
      ?auto_94184 - BLOCK
    )
    :vars
    (
      ?auto_94187 - BLOCK
      ?auto_94185 - BLOCK
      ?auto_94186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94187 ?auto_94184 ) ( ON-TABLE ?auto_94181 ) ( ON ?auto_94182 ?auto_94181 ) ( ON ?auto_94183 ?auto_94182 ) ( ON ?auto_94184 ?auto_94183 ) ( not ( = ?auto_94181 ?auto_94182 ) ) ( not ( = ?auto_94181 ?auto_94183 ) ) ( not ( = ?auto_94181 ?auto_94184 ) ) ( not ( = ?auto_94181 ?auto_94187 ) ) ( not ( = ?auto_94182 ?auto_94183 ) ) ( not ( = ?auto_94182 ?auto_94184 ) ) ( not ( = ?auto_94182 ?auto_94187 ) ) ( not ( = ?auto_94183 ?auto_94184 ) ) ( not ( = ?auto_94183 ?auto_94187 ) ) ( not ( = ?auto_94184 ?auto_94187 ) ) ( not ( = ?auto_94181 ?auto_94185 ) ) ( not ( = ?auto_94181 ?auto_94186 ) ) ( not ( = ?auto_94182 ?auto_94185 ) ) ( not ( = ?auto_94182 ?auto_94186 ) ) ( not ( = ?auto_94183 ?auto_94185 ) ) ( not ( = ?auto_94183 ?auto_94186 ) ) ( not ( = ?auto_94184 ?auto_94185 ) ) ( not ( = ?auto_94184 ?auto_94186 ) ) ( not ( = ?auto_94187 ?auto_94185 ) ) ( not ( = ?auto_94187 ?auto_94186 ) ) ( not ( = ?auto_94185 ?auto_94186 ) ) ( ON ?auto_94185 ?auto_94187 ) ( CLEAR ?auto_94185 ) ( HOLDING ?auto_94186 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94186 )
      ( MAKE-4PILE ?auto_94181 ?auto_94182 ?auto_94183 ?auto_94184 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94188 - BLOCK
      ?auto_94189 - BLOCK
      ?auto_94190 - BLOCK
      ?auto_94191 - BLOCK
    )
    :vars
    (
      ?auto_94194 - BLOCK
      ?auto_94193 - BLOCK
      ?auto_94192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94194 ?auto_94191 ) ( ON-TABLE ?auto_94188 ) ( ON ?auto_94189 ?auto_94188 ) ( ON ?auto_94190 ?auto_94189 ) ( ON ?auto_94191 ?auto_94190 ) ( not ( = ?auto_94188 ?auto_94189 ) ) ( not ( = ?auto_94188 ?auto_94190 ) ) ( not ( = ?auto_94188 ?auto_94191 ) ) ( not ( = ?auto_94188 ?auto_94194 ) ) ( not ( = ?auto_94189 ?auto_94190 ) ) ( not ( = ?auto_94189 ?auto_94191 ) ) ( not ( = ?auto_94189 ?auto_94194 ) ) ( not ( = ?auto_94190 ?auto_94191 ) ) ( not ( = ?auto_94190 ?auto_94194 ) ) ( not ( = ?auto_94191 ?auto_94194 ) ) ( not ( = ?auto_94188 ?auto_94193 ) ) ( not ( = ?auto_94188 ?auto_94192 ) ) ( not ( = ?auto_94189 ?auto_94193 ) ) ( not ( = ?auto_94189 ?auto_94192 ) ) ( not ( = ?auto_94190 ?auto_94193 ) ) ( not ( = ?auto_94190 ?auto_94192 ) ) ( not ( = ?auto_94191 ?auto_94193 ) ) ( not ( = ?auto_94191 ?auto_94192 ) ) ( not ( = ?auto_94194 ?auto_94193 ) ) ( not ( = ?auto_94194 ?auto_94192 ) ) ( not ( = ?auto_94193 ?auto_94192 ) ) ( ON ?auto_94193 ?auto_94194 ) ( ON ?auto_94192 ?auto_94193 ) ( CLEAR ?auto_94192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94188 ?auto_94189 ?auto_94190 ?auto_94191 ?auto_94194 ?auto_94193 )
      ( MAKE-4PILE ?auto_94188 ?auto_94189 ?auto_94190 ?auto_94191 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94195 - BLOCK
      ?auto_94196 - BLOCK
      ?auto_94197 - BLOCK
      ?auto_94198 - BLOCK
    )
    :vars
    (
      ?auto_94201 - BLOCK
      ?auto_94199 - BLOCK
      ?auto_94200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94201 ?auto_94198 ) ( ON-TABLE ?auto_94195 ) ( ON ?auto_94196 ?auto_94195 ) ( ON ?auto_94197 ?auto_94196 ) ( ON ?auto_94198 ?auto_94197 ) ( not ( = ?auto_94195 ?auto_94196 ) ) ( not ( = ?auto_94195 ?auto_94197 ) ) ( not ( = ?auto_94195 ?auto_94198 ) ) ( not ( = ?auto_94195 ?auto_94201 ) ) ( not ( = ?auto_94196 ?auto_94197 ) ) ( not ( = ?auto_94196 ?auto_94198 ) ) ( not ( = ?auto_94196 ?auto_94201 ) ) ( not ( = ?auto_94197 ?auto_94198 ) ) ( not ( = ?auto_94197 ?auto_94201 ) ) ( not ( = ?auto_94198 ?auto_94201 ) ) ( not ( = ?auto_94195 ?auto_94199 ) ) ( not ( = ?auto_94195 ?auto_94200 ) ) ( not ( = ?auto_94196 ?auto_94199 ) ) ( not ( = ?auto_94196 ?auto_94200 ) ) ( not ( = ?auto_94197 ?auto_94199 ) ) ( not ( = ?auto_94197 ?auto_94200 ) ) ( not ( = ?auto_94198 ?auto_94199 ) ) ( not ( = ?auto_94198 ?auto_94200 ) ) ( not ( = ?auto_94201 ?auto_94199 ) ) ( not ( = ?auto_94201 ?auto_94200 ) ) ( not ( = ?auto_94199 ?auto_94200 ) ) ( ON ?auto_94199 ?auto_94201 ) ( HOLDING ?auto_94200 ) ( CLEAR ?auto_94199 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94195 ?auto_94196 ?auto_94197 ?auto_94198 ?auto_94201 ?auto_94199 ?auto_94200 )
      ( MAKE-4PILE ?auto_94195 ?auto_94196 ?auto_94197 ?auto_94198 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94202 - BLOCK
      ?auto_94203 - BLOCK
      ?auto_94204 - BLOCK
      ?auto_94205 - BLOCK
    )
    :vars
    (
      ?auto_94208 - BLOCK
      ?auto_94207 - BLOCK
      ?auto_94206 - BLOCK
      ?auto_94209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94208 ?auto_94205 ) ( ON-TABLE ?auto_94202 ) ( ON ?auto_94203 ?auto_94202 ) ( ON ?auto_94204 ?auto_94203 ) ( ON ?auto_94205 ?auto_94204 ) ( not ( = ?auto_94202 ?auto_94203 ) ) ( not ( = ?auto_94202 ?auto_94204 ) ) ( not ( = ?auto_94202 ?auto_94205 ) ) ( not ( = ?auto_94202 ?auto_94208 ) ) ( not ( = ?auto_94203 ?auto_94204 ) ) ( not ( = ?auto_94203 ?auto_94205 ) ) ( not ( = ?auto_94203 ?auto_94208 ) ) ( not ( = ?auto_94204 ?auto_94205 ) ) ( not ( = ?auto_94204 ?auto_94208 ) ) ( not ( = ?auto_94205 ?auto_94208 ) ) ( not ( = ?auto_94202 ?auto_94207 ) ) ( not ( = ?auto_94202 ?auto_94206 ) ) ( not ( = ?auto_94203 ?auto_94207 ) ) ( not ( = ?auto_94203 ?auto_94206 ) ) ( not ( = ?auto_94204 ?auto_94207 ) ) ( not ( = ?auto_94204 ?auto_94206 ) ) ( not ( = ?auto_94205 ?auto_94207 ) ) ( not ( = ?auto_94205 ?auto_94206 ) ) ( not ( = ?auto_94208 ?auto_94207 ) ) ( not ( = ?auto_94208 ?auto_94206 ) ) ( not ( = ?auto_94207 ?auto_94206 ) ) ( ON ?auto_94207 ?auto_94208 ) ( CLEAR ?auto_94207 ) ( ON ?auto_94206 ?auto_94209 ) ( CLEAR ?auto_94206 ) ( HAND-EMPTY ) ( not ( = ?auto_94202 ?auto_94209 ) ) ( not ( = ?auto_94203 ?auto_94209 ) ) ( not ( = ?auto_94204 ?auto_94209 ) ) ( not ( = ?auto_94205 ?auto_94209 ) ) ( not ( = ?auto_94208 ?auto_94209 ) ) ( not ( = ?auto_94207 ?auto_94209 ) ) ( not ( = ?auto_94206 ?auto_94209 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94206 ?auto_94209 )
      ( MAKE-4PILE ?auto_94202 ?auto_94203 ?auto_94204 ?auto_94205 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94210 - BLOCK
      ?auto_94211 - BLOCK
      ?auto_94212 - BLOCK
      ?auto_94213 - BLOCK
    )
    :vars
    (
      ?auto_94217 - BLOCK
      ?auto_94216 - BLOCK
      ?auto_94215 - BLOCK
      ?auto_94214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94217 ?auto_94213 ) ( ON-TABLE ?auto_94210 ) ( ON ?auto_94211 ?auto_94210 ) ( ON ?auto_94212 ?auto_94211 ) ( ON ?auto_94213 ?auto_94212 ) ( not ( = ?auto_94210 ?auto_94211 ) ) ( not ( = ?auto_94210 ?auto_94212 ) ) ( not ( = ?auto_94210 ?auto_94213 ) ) ( not ( = ?auto_94210 ?auto_94217 ) ) ( not ( = ?auto_94211 ?auto_94212 ) ) ( not ( = ?auto_94211 ?auto_94213 ) ) ( not ( = ?auto_94211 ?auto_94217 ) ) ( not ( = ?auto_94212 ?auto_94213 ) ) ( not ( = ?auto_94212 ?auto_94217 ) ) ( not ( = ?auto_94213 ?auto_94217 ) ) ( not ( = ?auto_94210 ?auto_94216 ) ) ( not ( = ?auto_94210 ?auto_94215 ) ) ( not ( = ?auto_94211 ?auto_94216 ) ) ( not ( = ?auto_94211 ?auto_94215 ) ) ( not ( = ?auto_94212 ?auto_94216 ) ) ( not ( = ?auto_94212 ?auto_94215 ) ) ( not ( = ?auto_94213 ?auto_94216 ) ) ( not ( = ?auto_94213 ?auto_94215 ) ) ( not ( = ?auto_94217 ?auto_94216 ) ) ( not ( = ?auto_94217 ?auto_94215 ) ) ( not ( = ?auto_94216 ?auto_94215 ) ) ( ON ?auto_94215 ?auto_94214 ) ( CLEAR ?auto_94215 ) ( not ( = ?auto_94210 ?auto_94214 ) ) ( not ( = ?auto_94211 ?auto_94214 ) ) ( not ( = ?auto_94212 ?auto_94214 ) ) ( not ( = ?auto_94213 ?auto_94214 ) ) ( not ( = ?auto_94217 ?auto_94214 ) ) ( not ( = ?auto_94216 ?auto_94214 ) ) ( not ( = ?auto_94215 ?auto_94214 ) ) ( HOLDING ?auto_94216 ) ( CLEAR ?auto_94217 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94210 ?auto_94211 ?auto_94212 ?auto_94213 ?auto_94217 ?auto_94216 )
      ( MAKE-4PILE ?auto_94210 ?auto_94211 ?auto_94212 ?auto_94213 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94218 - BLOCK
      ?auto_94219 - BLOCK
      ?auto_94220 - BLOCK
      ?auto_94221 - BLOCK
    )
    :vars
    (
      ?auto_94224 - BLOCK
      ?auto_94225 - BLOCK
      ?auto_94223 - BLOCK
      ?auto_94222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94224 ?auto_94221 ) ( ON-TABLE ?auto_94218 ) ( ON ?auto_94219 ?auto_94218 ) ( ON ?auto_94220 ?auto_94219 ) ( ON ?auto_94221 ?auto_94220 ) ( not ( = ?auto_94218 ?auto_94219 ) ) ( not ( = ?auto_94218 ?auto_94220 ) ) ( not ( = ?auto_94218 ?auto_94221 ) ) ( not ( = ?auto_94218 ?auto_94224 ) ) ( not ( = ?auto_94219 ?auto_94220 ) ) ( not ( = ?auto_94219 ?auto_94221 ) ) ( not ( = ?auto_94219 ?auto_94224 ) ) ( not ( = ?auto_94220 ?auto_94221 ) ) ( not ( = ?auto_94220 ?auto_94224 ) ) ( not ( = ?auto_94221 ?auto_94224 ) ) ( not ( = ?auto_94218 ?auto_94225 ) ) ( not ( = ?auto_94218 ?auto_94223 ) ) ( not ( = ?auto_94219 ?auto_94225 ) ) ( not ( = ?auto_94219 ?auto_94223 ) ) ( not ( = ?auto_94220 ?auto_94225 ) ) ( not ( = ?auto_94220 ?auto_94223 ) ) ( not ( = ?auto_94221 ?auto_94225 ) ) ( not ( = ?auto_94221 ?auto_94223 ) ) ( not ( = ?auto_94224 ?auto_94225 ) ) ( not ( = ?auto_94224 ?auto_94223 ) ) ( not ( = ?auto_94225 ?auto_94223 ) ) ( ON ?auto_94223 ?auto_94222 ) ( not ( = ?auto_94218 ?auto_94222 ) ) ( not ( = ?auto_94219 ?auto_94222 ) ) ( not ( = ?auto_94220 ?auto_94222 ) ) ( not ( = ?auto_94221 ?auto_94222 ) ) ( not ( = ?auto_94224 ?auto_94222 ) ) ( not ( = ?auto_94225 ?auto_94222 ) ) ( not ( = ?auto_94223 ?auto_94222 ) ) ( CLEAR ?auto_94224 ) ( ON ?auto_94225 ?auto_94223 ) ( CLEAR ?auto_94225 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94222 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94222 ?auto_94223 )
      ( MAKE-4PILE ?auto_94218 ?auto_94219 ?auto_94220 ?auto_94221 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94242 - BLOCK
      ?auto_94243 - BLOCK
      ?auto_94244 - BLOCK
      ?auto_94245 - BLOCK
    )
    :vars
    (
      ?auto_94247 - BLOCK
      ?auto_94249 - BLOCK
      ?auto_94246 - BLOCK
      ?auto_94248 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94242 ) ( ON ?auto_94243 ?auto_94242 ) ( ON ?auto_94244 ?auto_94243 ) ( not ( = ?auto_94242 ?auto_94243 ) ) ( not ( = ?auto_94242 ?auto_94244 ) ) ( not ( = ?auto_94242 ?auto_94245 ) ) ( not ( = ?auto_94242 ?auto_94247 ) ) ( not ( = ?auto_94243 ?auto_94244 ) ) ( not ( = ?auto_94243 ?auto_94245 ) ) ( not ( = ?auto_94243 ?auto_94247 ) ) ( not ( = ?auto_94244 ?auto_94245 ) ) ( not ( = ?auto_94244 ?auto_94247 ) ) ( not ( = ?auto_94245 ?auto_94247 ) ) ( not ( = ?auto_94242 ?auto_94249 ) ) ( not ( = ?auto_94242 ?auto_94246 ) ) ( not ( = ?auto_94243 ?auto_94249 ) ) ( not ( = ?auto_94243 ?auto_94246 ) ) ( not ( = ?auto_94244 ?auto_94249 ) ) ( not ( = ?auto_94244 ?auto_94246 ) ) ( not ( = ?auto_94245 ?auto_94249 ) ) ( not ( = ?auto_94245 ?auto_94246 ) ) ( not ( = ?auto_94247 ?auto_94249 ) ) ( not ( = ?auto_94247 ?auto_94246 ) ) ( not ( = ?auto_94249 ?auto_94246 ) ) ( ON ?auto_94246 ?auto_94248 ) ( not ( = ?auto_94242 ?auto_94248 ) ) ( not ( = ?auto_94243 ?auto_94248 ) ) ( not ( = ?auto_94244 ?auto_94248 ) ) ( not ( = ?auto_94245 ?auto_94248 ) ) ( not ( = ?auto_94247 ?auto_94248 ) ) ( not ( = ?auto_94249 ?auto_94248 ) ) ( not ( = ?auto_94246 ?auto_94248 ) ) ( ON ?auto_94249 ?auto_94246 ) ( ON-TABLE ?auto_94248 ) ( ON ?auto_94247 ?auto_94249 ) ( CLEAR ?auto_94247 ) ( HOLDING ?auto_94245 ) ( CLEAR ?auto_94244 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94242 ?auto_94243 ?auto_94244 ?auto_94245 ?auto_94247 )
      ( MAKE-4PILE ?auto_94242 ?auto_94243 ?auto_94244 ?auto_94245 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94250 - BLOCK
      ?auto_94251 - BLOCK
      ?auto_94252 - BLOCK
      ?auto_94253 - BLOCK
    )
    :vars
    (
      ?auto_94256 - BLOCK
      ?auto_94257 - BLOCK
      ?auto_94254 - BLOCK
      ?auto_94255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94250 ) ( ON ?auto_94251 ?auto_94250 ) ( ON ?auto_94252 ?auto_94251 ) ( not ( = ?auto_94250 ?auto_94251 ) ) ( not ( = ?auto_94250 ?auto_94252 ) ) ( not ( = ?auto_94250 ?auto_94253 ) ) ( not ( = ?auto_94250 ?auto_94256 ) ) ( not ( = ?auto_94251 ?auto_94252 ) ) ( not ( = ?auto_94251 ?auto_94253 ) ) ( not ( = ?auto_94251 ?auto_94256 ) ) ( not ( = ?auto_94252 ?auto_94253 ) ) ( not ( = ?auto_94252 ?auto_94256 ) ) ( not ( = ?auto_94253 ?auto_94256 ) ) ( not ( = ?auto_94250 ?auto_94257 ) ) ( not ( = ?auto_94250 ?auto_94254 ) ) ( not ( = ?auto_94251 ?auto_94257 ) ) ( not ( = ?auto_94251 ?auto_94254 ) ) ( not ( = ?auto_94252 ?auto_94257 ) ) ( not ( = ?auto_94252 ?auto_94254 ) ) ( not ( = ?auto_94253 ?auto_94257 ) ) ( not ( = ?auto_94253 ?auto_94254 ) ) ( not ( = ?auto_94256 ?auto_94257 ) ) ( not ( = ?auto_94256 ?auto_94254 ) ) ( not ( = ?auto_94257 ?auto_94254 ) ) ( ON ?auto_94254 ?auto_94255 ) ( not ( = ?auto_94250 ?auto_94255 ) ) ( not ( = ?auto_94251 ?auto_94255 ) ) ( not ( = ?auto_94252 ?auto_94255 ) ) ( not ( = ?auto_94253 ?auto_94255 ) ) ( not ( = ?auto_94256 ?auto_94255 ) ) ( not ( = ?auto_94257 ?auto_94255 ) ) ( not ( = ?auto_94254 ?auto_94255 ) ) ( ON ?auto_94257 ?auto_94254 ) ( ON-TABLE ?auto_94255 ) ( ON ?auto_94256 ?auto_94257 ) ( CLEAR ?auto_94252 ) ( ON ?auto_94253 ?auto_94256 ) ( CLEAR ?auto_94253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94255 ?auto_94254 ?auto_94257 ?auto_94256 )
      ( MAKE-4PILE ?auto_94250 ?auto_94251 ?auto_94252 ?auto_94253 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94258 - BLOCK
      ?auto_94259 - BLOCK
      ?auto_94260 - BLOCK
      ?auto_94261 - BLOCK
    )
    :vars
    (
      ?auto_94263 - BLOCK
      ?auto_94262 - BLOCK
      ?auto_94265 - BLOCK
      ?auto_94264 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94258 ) ( ON ?auto_94259 ?auto_94258 ) ( not ( = ?auto_94258 ?auto_94259 ) ) ( not ( = ?auto_94258 ?auto_94260 ) ) ( not ( = ?auto_94258 ?auto_94261 ) ) ( not ( = ?auto_94258 ?auto_94263 ) ) ( not ( = ?auto_94259 ?auto_94260 ) ) ( not ( = ?auto_94259 ?auto_94261 ) ) ( not ( = ?auto_94259 ?auto_94263 ) ) ( not ( = ?auto_94260 ?auto_94261 ) ) ( not ( = ?auto_94260 ?auto_94263 ) ) ( not ( = ?auto_94261 ?auto_94263 ) ) ( not ( = ?auto_94258 ?auto_94262 ) ) ( not ( = ?auto_94258 ?auto_94265 ) ) ( not ( = ?auto_94259 ?auto_94262 ) ) ( not ( = ?auto_94259 ?auto_94265 ) ) ( not ( = ?auto_94260 ?auto_94262 ) ) ( not ( = ?auto_94260 ?auto_94265 ) ) ( not ( = ?auto_94261 ?auto_94262 ) ) ( not ( = ?auto_94261 ?auto_94265 ) ) ( not ( = ?auto_94263 ?auto_94262 ) ) ( not ( = ?auto_94263 ?auto_94265 ) ) ( not ( = ?auto_94262 ?auto_94265 ) ) ( ON ?auto_94265 ?auto_94264 ) ( not ( = ?auto_94258 ?auto_94264 ) ) ( not ( = ?auto_94259 ?auto_94264 ) ) ( not ( = ?auto_94260 ?auto_94264 ) ) ( not ( = ?auto_94261 ?auto_94264 ) ) ( not ( = ?auto_94263 ?auto_94264 ) ) ( not ( = ?auto_94262 ?auto_94264 ) ) ( not ( = ?auto_94265 ?auto_94264 ) ) ( ON ?auto_94262 ?auto_94265 ) ( ON-TABLE ?auto_94264 ) ( ON ?auto_94263 ?auto_94262 ) ( ON ?auto_94261 ?auto_94263 ) ( CLEAR ?auto_94261 ) ( HOLDING ?auto_94260 ) ( CLEAR ?auto_94259 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94258 ?auto_94259 ?auto_94260 )
      ( MAKE-4PILE ?auto_94258 ?auto_94259 ?auto_94260 ?auto_94261 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94266 - BLOCK
      ?auto_94267 - BLOCK
      ?auto_94268 - BLOCK
      ?auto_94269 - BLOCK
    )
    :vars
    (
      ?auto_94272 - BLOCK
      ?auto_94273 - BLOCK
      ?auto_94271 - BLOCK
      ?auto_94270 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94266 ) ( ON ?auto_94267 ?auto_94266 ) ( not ( = ?auto_94266 ?auto_94267 ) ) ( not ( = ?auto_94266 ?auto_94268 ) ) ( not ( = ?auto_94266 ?auto_94269 ) ) ( not ( = ?auto_94266 ?auto_94272 ) ) ( not ( = ?auto_94267 ?auto_94268 ) ) ( not ( = ?auto_94267 ?auto_94269 ) ) ( not ( = ?auto_94267 ?auto_94272 ) ) ( not ( = ?auto_94268 ?auto_94269 ) ) ( not ( = ?auto_94268 ?auto_94272 ) ) ( not ( = ?auto_94269 ?auto_94272 ) ) ( not ( = ?auto_94266 ?auto_94273 ) ) ( not ( = ?auto_94266 ?auto_94271 ) ) ( not ( = ?auto_94267 ?auto_94273 ) ) ( not ( = ?auto_94267 ?auto_94271 ) ) ( not ( = ?auto_94268 ?auto_94273 ) ) ( not ( = ?auto_94268 ?auto_94271 ) ) ( not ( = ?auto_94269 ?auto_94273 ) ) ( not ( = ?auto_94269 ?auto_94271 ) ) ( not ( = ?auto_94272 ?auto_94273 ) ) ( not ( = ?auto_94272 ?auto_94271 ) ) ( not ( = ?auto_94273 ?auto_94271 ) ) ( ON ?auto_94271 ?auto_94270 ) ( not ( = ?auto_94266 ?auto_94270 ) ) ( not ( = ?auto_94267 ?auto_94270 ) ) ( not ( = ?auto_94268 ?auto_94270 ) ) ( not ( = ?auto_94269 ?auto_94270 ) ) ( not ( = ?auto_94272 ?auto_94270 ) ) ( not ( = ?auto_94273 ?auto_94270 ) ) ( not ( = ?auto_94271 ?auto_94270 ) ) ( ON ?auto_94273 ?auto_94271 ) ( ON-TABLE ?auto_94270 ) ( ON ?auto_94272 ?auto_94273 ) ( ON ?auto_94269 ?auto_94272 ) ( CLEAR ?auto_94267 ) ( ON ?auto_94268 ?auto_94269 ) ( CLEAR ?auto_94268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94270 ?auto_94271 ?auto_94273 ?auto_94272 ?auto_94269 )
      ( MAKE-4PILE ?auto_94266 ?auto_94267 ?auto_94268 ?auto_94269 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94274 - BLOCK
      ?auto_94275 - BLOCK
      ?auto_94276 - BLOCK
      ?auto_94277 - BLOCK
    )
    :vars
    (
      ?auto_94279 - BLOCK
      ?auto_94280 - BLOCK
      ?auto_94278 - BLOCK
      ?auto_94281 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94274 ) ( not ( = ?auto_94274 ?auto_94275 ) ) ( not ( = ?auto_94274 ?auto_94276 ) ) ( not ( = ?auto_94274 ?auto_94277 ) ) ( not ( = ?auto_94274 ?auto_94279 ) ) ( not ( = ?auto_94275 ?auto_94276 ) ) ( not ( = ?auto_94275 ?auto_94277 ) ) ( not ( = ?auto_94275 ?auto_94279 ) ) ( not ( = ?auto_94276 ?auto_94277 ) ) ( not ( = ?auto_94276 ?auto_94279 ) ) ( not ( = ?auto_94277 ?auto_94279 ) ) ( not ( = ?auto_94274 ?auto_94280 ) ) ( not ( = ?auto_94274 ?auto_94278 ) ) ( not ( = ?auto_94275 ?auto_94280 ) ) ( not ( = ?auto_94275 ?auto_94278 ) ) ( not ( = ?auto_94276 ?auto_94280 ) ) ( not ( = ?auto_94276 ?auto_94278 ) ) ( not ( = ?auto_94277 ?auto_94280 ) ) ( not ( = ?auto_94277 ?auto_94278 ) ) ( not ( = ?auto_94279 ?auto_94280 ) ) ( not ( = ?auto_94279 ?auto_94278 ) ) ( not ( = ?auto_94280 ?auto_94278 ) ) ( ON ?auto_94278 ?auto_94281 ) ( not ( = ?auto_94274 ?auto_94281 ) ) ( not ( = ?auto_94275 ?auto_94281 ) ) ( not ( = ?auto_94276 ?auto_94281 ) ) ( not ( = ?auto_94277 ?auto_94281 ) ) ( not ( = ?auto_94279 ?auto_94281 ) ) ( not ( = ?auto_94280 ?auto_94281 ) ) ( not ( = ?auto_94278 ?auto_94281 ) ) ( ON ?auto_94280 ?auto_94278 ) ( ON-TABLE ?auto_94281 ) ( ON ?auto_94279 ?auto_94280 ) ( ON ?auto_94277 ?auto_94279 ) ( ON ?auto_94276 ?auto_94277 ) ( CLEAR ?auto_94276 ) ( HOLDING ?auto_94275 ) ( CLEAR ?auto_94274 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94274 ?auto_94275 )
      ( MAKE-4PILE ?auto_94274 ?auto_94275 ?auto_94276 ?auto_94277 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94282 - BLOCK
      ?auto_94283 - BLOCK
      ?auto_94284 - BLOCK
      ?auto_94285 - BLOCK
    )
    :vars
    (
      ?auto_94288 - BLOCK
      ?auto_94287 - BLOCK
      ?auto_94286 - BLOCK
      ?auto_94289 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94282 ) ( not ( = ?auto_94282 ?auto_94283 ) ) ( not ( = ?auto_94282 ?auto_94284 ) ) ( not ( = ?auto_94282 ?auto_94285 ) ) ( not ( = ?auto_94282 ?auto_94288 ) ) ( not ( = ?auto_94283 ?auto_94284 ) ) ( not ( = ?auto_94283 ?auto_94285 ) ) ( not ( = ?auto_94283 ?auto_94288 ) ) ( not ( = ?auto_94284 ?auto_94285 ) ) ( not ( = ?auto_94284 ?auto_94288 ) ) ( not ( = ?auto_94285 ?auto_94288 ) ) ( not ( = ?auto_94282 ?auto_94287 ) ) ( not ( = ?auto_94282 ?auto_94286 ) ) ( not ( = ?auto_94283 ?auto_94287 ) ) ( not ( = ?auto_94283 ?auto_94286 ) ) ( not ( = ?auto_94284 ?auto_94287 ) ) ( not ( = ?auto_94284 ?auto_94286 ) ) ( not ( = ?auto_94285 ?auto_94287 ) ) ( not ( = ?auto_94285 ?auto_94286 ) ) ( not ( = ?auto_94288 ?auto_94287 ) ) ( not ( = ?auto_94288 ?auto_94286 ) ) ( not ( = ?auto_94287 ?auto_94286 ) ) ( ON ?auto_94286 ?auto_94289 ) ( not ( = ?auto_94282 ?auto_94289 ) ) ( not ( = ?auto_94283 ?auto_94289 ) ) ( not ( = ?auto_94284 ?auto_94289 ) ) ( not ( = ?auto_94285 ?auto_94289 ) ) ( not ( = ?auto_94288 ?auto_94289 ) ) ( not ( = ?auto_94287 ?auto_94289 ) ) ( not ( = ?auto_94286 ?auto_94289 ) ) ( ON ?auto_94287 ?auto_94286 ) ( ON-TABLE ?auto_94289 ) ( ON ?auto_94288 ?auto_94287 ) ( ON ?auto_94285 ?auto_94288 ) ( ON ?auto_94284 ?auto_94285 ) ( CLEAR ?auto_94282 ) ( ON ?auto_94283 ?auto_94284 ) ( CLEAR ?auto_94283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94289 ?auto_94286 ?auto_94287 ?auto_94288 ?auto_94285 ?auto_94284 )
      ( MAKE-4PILE ?auto_94282 ?auto_94283 ?auto_94284 ?auto_94285 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94290 - BLOCK
      ?auto_94291 - BLOCK
      ?auto_94292 - BLOCK
      ?auto_94293 - BLOCK
    )
    :vars
    (
      ?auto_94294 - BLOCK
      ?auto_94296 - BLOCK
      ?auto_94297 - BLOCK
      ?auto_94295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94290 ?auto_94291 ) ) ( not ( = ?auto_94290 ?auto_94292 ) ) ( not ( = ?auto_94290 ?auto_94293 ) ) ( not ( = ?auto_94290 ?auto_94294 ) ) ( not ( = ?auto_94291 ?auto_94292 ) ) ( not ( = ?auto_94291 ?auto_94293 ) ) ( not ( = ?auto_94291 ?auto_94294 ) ) ( not ( = ?auto_94292 ?auto_94293 ) ) ( not ( = ?auto_94292 ?auto_94294 ) ) ( not ( = ?auto_94293 ?auto_94294 ) ) ( not ( = ?auto_94290 ?auto_94296 ) ) ( not ( = ?auto_94290 ?auto_94297 ) ) ( not ( = ?auto_94291 ?auto_94296 ) ) ( not ( = ?auto_94291 ?auto_94297 ) ) ( not ( = ?auto_94292 ?auto_94296 ) ) ( not ( = ?auto_94292 ?auto_94297 ) ) ( not ( = ?auto_94293 ?auto_94296 ) ) ( not ( = ?auto_94293 ?auto_94297 ) ) ( not ( = ?auto_94294 ?auto_94296 ) ) ( not ( = ?auto_94294 ?auto_94297 ) ) ( not ( = ?auto_94296 ?auto_94297 ) ) ( ON ?auto_94297 ?auto_94295 ) ( not ( = ?auto_94290 ?auto_94295 ) ) ( not ( = ?auto_94291 ?auto_94295 ) ) ( not ( = ?auto_94292 ?auto_94295 ) ) ( not ( = ?auto_94293 ?auto_94295 ) ) ( not ( = ?auto_94294 ?auto_94295 ) ) ( not ( = ?auto_94296 ?auto_94295 ) ) ( not ( = ?auto_94297 ?auto_94295 ) ) ( ON ?auto_94296 ?auto_94297 ) ( ON-TABLE ?auto_94295 ) ( ON ?auto_94294 ?auto_94296 ) ( ON ?auto_94293 ?auto_94294 ) ( ON ?auto_94292 ?auto_94293 ) ( ON ?auto_94291 ?auto_94292 ) ( CLEAR ?auto_94291 ) ( HOLDING ?auto_94290 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94290 )
      ( MAKE-4PILE ?auto_94290 ?auto_94291 ?auto_94292 ?auto_94293 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94298 - BLOCK
      ?auto_94299 - BLOCK
      ?auto_94300 - BLOCK
      ?auto_94301 - BLOCK
    )
    :vars
    (
      ?auto_94303 - BLOCK
      ?auto_94304 - BLOCK
      ?auto_94302 - BLOCK
      ?auto_94305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94298 ?auto_94299 ) ) ( not ( = ?auto_94298 ?auto_94300 ) ) ( not ( = ?auto_94298 ?auto_94301 ) ) ( not ( = ?auto_94298 ?auto_94303 ) ) ( not ( = ?auto_94299 ?auto_94300 ) ) ( not ( = ?auto_94299 ?auto_94301 ) ) ( not ( = ?auto_94299 ?auto_94303 ) ) ( not ( = ?auto_94300 ?auto_94301 ) ) ( not ( = ?auto_94300 ?auto_94303 ) ) ( not ( = ?auto_94301 ?auto_94303 ) ) ( not ( = ?auto_94298 ?auto_94304 ) ) ( not ( = ?auto_94298 ?auto_94302 ) ) ( not ( = ?auto_94299 ?auto_94304 ) ) ( not ( = ?auto_94299 ?auto_94302 ) ) ( not ( = ?auto_94300 ?auto_94304 ) ) ( not ( = ?auto_94300 ?auto_94302 ) ) ( not ( = ?auto_94301 ?auto_94304 ) ) ( not ( = ?auto_94301 ?auto_94302 ) ) ( not ( = ?auto_94303 ?auto_94304 ) ) ( not ( = ?auto_94303 ?auto_94302 ) ) ( not ( = ?auto_94304 ?auto_94302 ) ) ( ON ?auto_94302 ?auto_94305 ) ( not ( = ?auto_94298 ?auto_94305 ) ) ( not ( = ?auto_94299 ?auto_94305 ) ) ( not ( = ?auto_94300 ?auto_94305 ) ) ( not ( = ?auto_94301 ?auto_94305 ) ) ( not ( = ?auto_94303 ?auto_94305 ) ) ( not ( = ?auto_94304 ?auto_94305 ) ) ( not ( = ?auto_94302 ?auto_94305 ) ) ( ON ?auto_94304 ?auto_94302 ) ( ON-TABLE ?auto_94305 ) ( ON ?auto_94303 ?auto_94304 ) ( ON ?auto_94301 ?auto_94303 ) ( ON ?auto_94300 ?auto_94301 ) ( ON ?auto_94299 ?auto_94300 ) ( ON ?auto_94298 ?auto_94299 ) ( CLEAR ?auto_94298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94305 ?auto_94302 ?auto_94304 ?auto_94303 ?auto_94301 ?auto_94300 ?auto_94299 )
      ( MAKE-4PILE ?auto_94298 ?auto_94299 ?auto_94300 ?auto_94301 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94309 - BLOCK
      ?auto_94310 - BLOCK
      ?auto_94311 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_94311 ) ( CLEAR ?auto_94310 ) ( ON-TABLE ?auto_94309 ) ( ON ?auto_94310 ?auto_94309 ) ( not ( = ?auto_94309 ?auto_94310 ) ) ( not ( = ?auto_94309 ?auto_94311 ) ) ( not ( = ?auto_94310 ?auto_94311 ) ) )
    :subtasks
    ( ( !STACK ?auto_94311 ?auto_94310 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94312 - BLOCK
      ?auto_94313 - BLOCK
      ?auto_94314 - BLOCK
    )
    :vars
    (
      ?auto_94315 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_94313 ) ( ON-TABLE ?auto_94312 ) ( ON ?auto_94313 ?auto_94312 ) ( not ( = ?auto_94312 ?auto_94313 ) ) ( not ( = ?auto_94312 ?auto_94314 ) ) ( not ( = ?auto_94313 ?auto_94314 ) ) ( ON ?auto_94314 ?auto_94315 ) ( CLEAR ?auto_94314 ) ( HAND-EMPTY ) ( not ( = ?auto_94312 ?auto_94315 ) ) ( not ( = ?auto_94313 ?auto_94315 ) ) ( not ( = ?auto_94314 ?auto_94315 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94314 ?auto_94315 )
      ( MAKE-3PILE ?auto_94312 ?auto_94313 ?auto_94314 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94316 - BLOCK
      ?auto_94317 - BLOCK
      ?auto_94318 - BLOCK
    )
    :vars
    (
      ?auto_94319 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94316 ) ( not ( = ?auto_94316 ?auto_94317 ) ) ( not ( = ?auto_94316 ?auto_94318 ) ) ( not ( = ?auto_94317 ?auto_94318 ) ) ( ON ?auto_94318 ?auto_94319 ) ( CLEAR ?auto_94318 ) ( not ( = ?auto_94316 ?auto_94319 ) ) ( not ( = ?auto_94317 ?auto_94319 ) ) ( not ( = ?auto_94318 ?auto_94319 ) ) ( HOLDING ?auto_94317 ) ( CLEAR ?auto_94316 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94316 ?auto_94317 )
      ( MAKE-3PILE ?auto_94316 ?auto_94317 ?auto_94318 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94320 - BLOCK
      ?auto_94321 - BLOCK
      ?auto_94322 - BLOCK
    )
    :vars
    (
      ?auto_94323 - BLOCK
      ?auto_94324 - BLOCK
      ?auto_94325 - BLOCK
      ?auto_94326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94320 ) ( not ( = ?auto_94320 ?auto_94321 ) ) ( not ( = ?auto_94320 ?auto_94322 ) ) ( not ( = ?auto_94321 ?auto_94322 ) ) ( ON ?auto_94322 ?auto_94323 ) ( not ( = ?auto_94320 ?auto_94323 ) ) ( not ( = ?auto_94321 ?auto_94323 ) ) ( not ( = ?auto_94322 ?auto_94323 ) ) ( CLEAR ?auto_94320 ) ( ON ?auto_94321 ?auto_94322 ) ( CLEAR ?auto_94321 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94324 ) ( ON ?auto_94325 ?auto_94324 ) ( ON ?auto_94326 ?auto_94325 ) ( ON ?auto_94323 ?auto_94326 ) ( not ( = ?auto_94324 ?auto_94325 ) ) ( not ( = ?auto_94324 ?auto_94326 ) ) ( not ( = ?auto_94324 ?auto_94323 ) ) ( not ( = ?auto_94324 ?auto_94322 ) ) ( not ( = ?auto_94324 ?auto_94321 ) ) ( not ( = ?auto_94325 ?auto_94326 ) ) ( not ( = ?auto_94325 ?auto_94323 ) ) ( not ( = ?auto_94325 ?auto_94322 ) ) ( not ( = ?auto_94325 ?auto_94321 ) ) ( not ( = ?auto_94326 ?auto_94323 ) ) ( not ( = ?auto_94326 ?auto_94322 ) ) ( not ( = ?auto_94326 ?auto_94321 ) ) ( not ( = ?auto_94320 ?auto_94324 ) ) ( not ( = ?auto_94320 ?auto_94325 ) ) ( not ( = ?auto_94320 ?auto_94326 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94324 ?auto_94325 ?auto_94326 ?auto_94323 ?auto_94322 )
      ( MAKE-3PILE ?auto_94320 ?auto_94321 ?auto_94322 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94327 - BLOCK
      ?auto_94328 - BLOCK
      ?auto_94329 - BLOCK
    )
    :vars
    (
      ?auto_94332 - BLOCK
      ?auto_94330 - BLOCK
      ?auto_94331 - BLOCK
      ?auto_94333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94327 ?auto_94328 ) ) ( not ( = ?auto_94327 ?auto_94329 ) ) ( not ( = ?auto_94328 ?auto_94329 ) ) ( ON ?auto_94329 ?auto_94332 ) ( not ( = ?auto_94327 ?auto_94332 ) ) ( not ( = ?auto_94328 ?auto_94332 ) ) ( not ( = ?auto_94329 ?auto_94332 ) ) ( ON ?auto_94328 ?auto_94329 ) ( CLEAR ?auto_94328 ) ( ON-TABLE ?auto_94330 ) ( ON ?auto_94331 ?auto_94330 ) ( ON ?auto_94333 ?auto_94331 ) ( ON ?auto_94332 ?auto_94333 ) ( not ( = ?auto_94330 ?auto_94331 ) ) ( not ( = ?auto_94330 ?auto_94333 ) ) ( not ( = ?auto_94330 ?auto_94332 ) ) ( not ( = ?auto_94330 ?auto_94329 ) ) ( not ( = ?auto_94330 ?auto_94328 ) ) ( not ( = ?auto_94331 ?auto_94333 ) ) ( not ( = ?auto_94331 ?auto_94332 ) ) ( not ( = ?auto_94331 ?auto_94329 ) ) ( not ( = ?auto_94331 ?auto_94328 ) ) ( not ( = ?auto_94333 ?auto_94332 ) ) ( not ( = ?auto_94333 ?auto_94329 ) ) ( not ( = ?auto_94333 ?auto_94328 ) ) ( not ( = ?auto_94327 ?auto_94330 ) ) ( not ( = ?auto_94327 ?auto_94331 ) ) ( not ( = ?auto_94327 ?auto_94333 ) ) ( HOLDING ?auto_94327 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94327 )
      ( MAKE-3PILE ?auto_94327 ?auto_94328 ?auto_94329 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94334 - BLOCK
      ?auto_94335 - BLOCK
      ?auto_94336 - BLOCK
    )
    :vars
    (
      ?auto_94338 - BLOCK
      ?auto_94339 - BLOCK
      ?auto_94340 - BLOCK
      ?auto_94337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94334 ?auto_94335 ) ) ( not ( = ?auto_94334 ?auto_94336 ) ) ( not ( = ?auto_94335 ?auto_94336 ) ) ( ON ?auto_94336 ?auto_94338 ) ( not ( = ?auto_94334 ?auto_94338 ) ) ( not ( = ?auto_94335 ?auto_94338 ) ) ( not ( = ?auto_94336 ?auto_94338 ) ) ( ON ?auto_94335 ?auto_94336 ) ( ON-TABLE ?auto_94339 ) ( ON ?auto_94340 ?auto_94339 ) ( ON ?auto_94337 ?auto_94340 ) ( ON ?auto_94338 ?auto_94337 ) ( not ( = ?auto_94339 ?auto_94340 ) ) ( not ( = ?auto_94339 ?auto_94337 ) ) ( not ( = ?auto_94339 ?auto_94338 ) ) ( not ( = ?auto_94339 ?auto_94336 ) ) ( not ( = ?auto_94339 ?auto_94335 ) ) ( not ( = ?auto_94340 ?auto_94337 ) ) ( not ( = ?auto_94340 ?auto_94338 ) ) ( not ( = ?auto_94340 ?auto_94336 ) ) ( not ( = ?auto_94340 ?auto_94335 ) ) ( not ( = ?auto_94337 ?auto_94338 ) ) ( not ( = ?auto_94337 ?auto_94336 ) ) ( not ( = ?auto_94337 ?auto_94335 ) ) ( not ( = ?auto_94334 ?auto_94339 ) ) ( not ( = ?auto_94334 ?auto_94340 ) ) ( not ( = ?auto_94334 ?auto_94337 ) ) ( ON ?auto_94334 ?auto_94335 ) ( CLEAR ?auto_94334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94339 ?auto_94340 ?auto_94337 ?auto_94338 ?auto_94336 ?auto_94335 )
      ( MAKE-3PILE ?auto_94334 ?auto_94335 ?auto_94336 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94341 - BLOCK
      ?auto_94342 - BLOCK
      ?auto_94343 - BLOCK
    )
    :vars
    (
      ?auto_94345 - BLOCK
      ?auto_94344 - BLOCK
      ?auto_94346 - BLOCK
      ?auto_94347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94341 ?auto_94342 ) ) ( not ( = ?auto_94341 ?auto_94343 ) ) ( not ( = ?auto_94342 ?auto_94343 ) ) ( ON ?auto_94343 ?auto_94345 ) ( not ( = ?auto_94341 ?auto_94345 ) ) ( not ( = ?auto_94342 ?auto_94345 ) ) ( not ( = ?auto_94343 ?auto_94345 ) ) ( ON ?auto_94342 ?auto_94343 ) ( ON-TABLE ?auto_94344 ) ( ON ?auto_94346 ?auto_94344 ) ( ON ?auto_94347 ?auto_94346 ) ( ON ?auto_94345 ?auto_94347 ) ( not ( = ?auto_94344 ?auto_94346 ) ) ( not ( = ?auto_94344 ?auto_94347 ) ) ( not ( = ?auto_94344 ?auto_94345 ) ) ( not ( = ?auto_94344 ?auto_94343 ) ) ( not ( = ?auto_94344 ?auto_94342 ) ) ( not ( = ?auto_94346 ?auto_94347 ) ) ( not ( = ?auto_94346 ?auto_94345 ) ) ( not ( = ?auto_94346 ?auto_94343 ) ) ( not ( = ?auto_94346 ?auto_94342 ) ) ( not ( = ?auto_94347 ?auto_94345 ) ) ( not ( = ?auto_94347 ?auto_94343 ) ) ( not ( = ?auto_94347 ?auto_94342 ) ) ( not ( = ?auto_94341 ?auto_94344 ) ) ( not ( = ?auto_94341 ?auto_94346 ) ) ( not ( = ?auto_94341 ?auto_94347 ) ) ( HOLDING ?auto_94341 ) ( CLEAR ?auto_94342 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94344 ?auto_94346 ?auto_94347 ?auto_94345 ?auto_94343 ?auto_94342 ?auto_94341 )
      ( MAKE-3PILE ?auto_94341 ?auto_94342 ?auto_94343 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94348 - BLOCK
      ?auto_94349 - BLOCK
      ?auto_94350 - BLOCK
    )
    :vars
    (
      ?auto_94352 - BLOCK
      ?auto_94351 - BLOCK
      ?auto_94353 - BLOCK
      ?auto_94354 - BLOCK
      ?auto_94355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94348 ?auto_94349 ) ) ( not ( = ?auto_94348 ?auto_94350 ) ) ( not ( = ?auto_94349 ?auto_94350 ) ) ( ON ?auto_94350 ?auto_94352 ) ( not ( = ?auto_94348 ?auto_94352 ) ) ( not ( = ?auto_94349 ?auto_94352 ) ) ( not ( = ?auto_94350 ?auto_94352 ) ) ( ON ?auto_94349 ?auto_94350 ) ( ON-TABLE ?auto_94351 ) ( ON ?auto_94353 ?auto_94351 ) ( ON ?auto_94354 ?auto_94353 ) ( ON ?auto_94352 ?auto_94354 ) ( not ( = ?auto_94351 ?auto_94353 ) ) ( not ( = ?auto_94351 ?auto_94354 ) ) ( not ( = ?auto_94351 ?auto_94352 ) ) ( not ( = ?auto_94351 ?auto_94350 ) ) ( not ( = ?auto_94351 ?auto_94349 ) ) ( not ( = ?auto_94353 ?auto_94354 ) ) ( not ( = ?auto_94353 ?auto_94352 ) ) ( not ( = ?auto_94353 ?auto_94350 ) ) ( not ( = ?auto_94353 ?auto_94349 ) ) ( not ( = ?auto_94354 ?auto_94352 ) ) ( not ( = ?auto_94354 ?auto_94350 ) ) ( not ( = ?auto_94354 ?auto_94349 ) ) ( not ( = ?auto_94348 ?auto_94351 ) ) ( not ( = ?auto_94348 ?auto_94353 ) ) ( not ( = ?auto_94348 ?auto_94354 ) ) ( CLEAR ?auto_94349 ) ( ON ?auto_94348 ?auto_94355 ) ( CLEAR ?auto_94348 ) ( HAND-EMPTY ) ( not ( = ?auto_94348 ?auto_94355 ) ) ( not ( = ?auto_94349 ?auto_94355 ) ) ( not ( = ?auto_94350 ?auto_94355 ) ) ( not ( = ?auto_94352 ?auto_94355 ) ) ( not ( = ?auto_94351 ?auto_94355 ) ) ( not ( = ?auto_94353 ?auto_94355 ) ) ( not ( = ?auto_94354 ?auto_94355 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94348 ?auto_94355 )
      ( MAKE-3PILE ?auto_94348 ?auto_94349 ?auto_94350 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94356 - BLOCK
      ?auto_94357 - BLOCK
      ?auto_94358 - BLOCK
    )
    :vars
    (
      ?auto_94361 - BLOCK
      ?auto_94363 - BLOCK
      ?auto_94362 - BLOCK
      ?auto_94359 - BLOCK
      ?auto_94360 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94356 ?auto_94357 ) ) ( not ( = ?auto_94356 ?auto_94358 ) ) ( not ( = ?auto_94357 ?auto_94358 ) ) ( ON ?auto_94358 ?auto_94361 ) ( not ( = ?auto_94356 ?auto_94361 ) ) ( not ( = ?auto_94357 ?auto_94361 ) ) ( not ( = ?auto_94358 ?auto_94361 ) ) ( ON-TABLE ?auto_94363 ) ( ON ?auto_94362 ?auto_94363 ) ( ON ?auto_94359 ?auto_94362 ) ( ON ?auto_94361 ?auto_94359 ) ( not ( = ?auto_94363 ?auto_94362 ) ) ( not ( = ?auto_94363 ?auto_94359 ) ) ( not ( = ?auto_94363 ?auto_94361 ) ) ( not ( = ?auto_94363 ?auto_94358 ) ) ( not ( = ?auto_94363 ?auto_94357 ) ) ( not ( = ?auto_94362 ?auto_94359 ) ) ( not ( = ?auto_94362 ?auto_94361 ) ) ( not ( = ?auto_94362 ?auto_94358 ) ) ( not ( = ?auto_94362 ?auto_94357 ) ) ( not ( = ?auto_94359 ?auto_94361 ) ) ( not ( = ?auto_94359 ?auto_94358 ) ) ( not ( = ?auto_94359 ?auto_94357 ) ) ( not ( = ?auto_94356 ?auto_94363 ) ) ( not ( = ?auto_94356 ?auto_94362 ) ) ( not ( = ?auto_94356 ?auto_94359 ) ) ( ON ?auto_94356 ?auto_94360 ) ( CLEAR ?auto_94356 ) ( not ( = ?auto_94356 ?auto_94360 ) ) ( not ( = ?auto_94357 ?auto_94360 ) ) ( not ( = ?auto_94358 ?auto_94360 ) ) ( not ( = ?auto_94361 ?auto_94360 ) ) ( not ( = ?auto_94363 ?auto_94360 ) ) ( not ( = ?auto_94362 ?auto_94360 ) ) ( not ( = ?auto_94359 ?auto_94360 ) ) ( HOLDING ?auto_94357 ) ( CLEAR ?auto_94358 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94363 ?auto_94362 ?auto_94359 ?auto_94361 ?auto_94358 ?auto_94357 )
      ( MAKE-3PILE ?auto_94356 ?auto_94357 ?auto_94358 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94364 - BLOCK
      ?auto_94365 - BLOCK
      ?auto_94366 - BLOCK
    )
    :vars
    (
      ?auto_94370 - BLOCK
      ?auto_94369 - BLOCK
      ?auto_94367 - BLOCK
      ?auto_94368 - BLOCK
      ?auto_94371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94364 ?auto_94365 ) ) ( not ( = ?auto_94364 ?auto_94366 ) ) ( not ( = ?auto_94365 ?auto_94366 ) ) ( ON ?auto_94366 ?auto_94370 ) ( not ( = ?auto_94364 ?auto_94370 ) ) ( not ( = ?auto_94365 ?auto_94370 ) ) ( not ( = ?auto_94366 ?auto_94370 ) ) ( ON-TABLE ?auto_94369 ) ( ON ?auto_94367 ?auto_94369 ) ( ON ?auto_94368 ?auto_94367 ) ( ON ?auto_94370 ?auto_94368 ) ( not ( = ?auto_94369 ?auto_94367 ) ) ( not ( = ?auto_94369 ?auto_94368 ) ) ( not ( = ?auto_94369 ?auto_94370 ) ) ( not ( = ?auto_94369 ?auto_94366 ) ) ( not ( = ?auto_94369 ?auto_94365 ) ) ( not ( = ?auto_94367 ?auto_94368 ) ) ( not ( = ?auto_94367 ?auto_94370 ) ) ( not ( = ?auto_94367 ?auto_94366 ) ) ( not ( = ?auto_94367 ?auto_94365 ) ) ( not ( = ?auto_94368 ?auto_94370 ) ) ( not ( = ?auto_94368 ?auto_94366 ) ) ( not ( = ?auto_94368 ?auto_94365 ) ) ( not ( = ?auto_94364 ?auto_94369 ) ) ( not ( = ?auto_94364 ?auto_94367 ) ) ( not ( = ?auto_94364 ?auto_94368 ) ) ( ON ?auto_94364 ?auto_94371 ) ( not ( = ?auto_94364 ?auto_94371 ) ) ( not ( = ?auto_94365 ?auto_94371 ) ) ( not ( = ?auto_94366 ?auto_94371 ) ) ( not ( = ?auto_94370 ?auto_94371 ) ) ( not ( = ?auto_94369 ?auto_94371 ) ) ( not ( = ?auto_94367 ?auto_94371 ) ) ( not ( = ?auto_94368 ?auto_94371 ) ) ( CLEAR ?auto_94366 ) ( ON ?auto_94365 ?auto_94364 ) ( CLEAR ?auto_94365 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94371 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94371 ?auto_94364 )
      ( MAKE-3PILE ?auto_94364 ?auto_94365 ?auto_94366 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94372 - BLOCK
      ?auto_94373 - BLOCK
      ?auto_94374 - BLOCK
    )
    :vars
    (
      ?auto_94375 - BLOCK
      ?auto_94376 - BLOCK
      ?auto_94377 - BLOCK
      ?auto_94379 - BLOCK
      ?auto_94378 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94372 ?auto_94373 ) ) ( not ( = ?auto_94372 ?auto_94374 ) ) ( not ( = ?auto_94373 ?auto_94374 ) ) ( not ( = ?auto_94372 ?auto_94375 ) ) ( not ( = ?auto_94373 ?auto_94375 ) ) ( not ( = ?auto_94374 ?auto_94375 ) ) ( ON-TABLE ?auto_94376 ) ( ON ?auto_94377 ?auto_94376 ) ( ON ?auto_94379 ?auto_94377 ) ( ON ?auto_94375 ?auto_94379 ) ( not ( = ?auto_94376 ?auto_94377 ) ) ( not ( = ?auto_94376 ?auto_94379 ) ) ( not ( = ?auto_94376 ?auto_94375 ) ) ( not ( = ?auto_94376 ?auto_94374 ) ) ( not ( = ?auto_94376 ?auto_94373 ) ) ( not ( = ?auto_94377 ?auto_94379 ) ) ( not ( = ?auto_94377 ?auto_94375 ) ) ( not ( = ?auto_94377 ?auto_94374 ) ) ( not ( = ?auto_94377 ?auto_94373 ) ) ( not ( = ?auto_94379 ?auto_94375 ) ) ( not ( = ?auto_94379 ?auto_94374 ) ) ( not ( = ?auto_94379 ?auto_94373 ) ) ( not ( = ?auto_94372 ?auto_94376 ) ) ( not ( = ?auto_94372 ?auto_94377 ) ) ( not ( = ?auto_94372 ?auto_94379 ) ) ( ON ?auto_94372 ?auto_94378 ) ( not ( = ?auto_94372 ?auto_94378 ) ) ( not ( = ?auto_94373 ?auto_94378 ) ) ( not ( = ?auto_94374 ?auto_94378 ) ) ( not ( = ?auto_94375 ?auto_94378 ) ) ( not ( = ?auto_94376 ?auto_94378 ) ) ( not ( = ?auto_94377 ?auto_94378 ) ) ( not ( = ?auto_94379 ?auto_94378 ) ) ( ON ?auto_94373 ?auto_94372 ) ( CLEAR ?auto_94373 ) ( ON-TABLE ?auto_94378 ) ( HOLDING ?auto_94374 ) ( CLEAR ?auto_94375 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94376 ?auto_94377 ?auto_94379 ?auto_94375 ?auto_94374 )
      ( MAKE-3PILE ?auto_94372 ?auto_94373 ?auto_94374 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94380 - BLOCK
      ?auto_94381 - BLOCK
      ?auto_94382 - BLOCK
    )
    :vars
    (
      ?auto_94386 - BLOCK
      ?auto_94383 - BLOCK
      ?auto_94385 - BLOCK
      ?auto_94387 - BLOCK
      ?auto_94384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94380 ?auto_94381 ) ) ( not ( = ?auto_94380 ?auto_94382 ) ) ( not ( = ?auto_94381 ?auto_94382 ) ) ( not ( = ?auto_94380 ?auto_94386 ) ) ( not ( = ?auto_94381 ?auto_94386 ) ) ( not ( = ?auto_94382 ?auto_94386 ) ) ( ON-TABLE ?auto_94383 ) ( ON ?auto_94385 ?auto_94383 ) ( ON ?auto_94387 ?auto_94385 ) ( ON ?auto_94386 ?auto_94387 ) ( not ( = ?auto_94383 ?auto_94385 ) ) ( not ( = ?auto_94383 ?auto_94387 ) ) ( not ( = ?auto_94383 ?auto_94386 ) ) ( not ( = ?auto_94383 ?auto_94382 ) ) ( not ( = ?auto_94383 ?auto_94381 ) ) ( not ( = ?auto_94385 ?auto_94387 ) ) ( not ( = ?auto_94385 ?auto_94386 ) ) ( not ( = ?auto_94385 ?auto_94382 ) ) ( not ( = ?auto_94385 ?auto_94381 ) ) ( not ( = ?auto_94387 ?auto_94386 ) ) ( not ( = ?auto_94387 ?auto_94382 ) ) ( not ( = ?auto_94387 ?auto_94381 ) ) ( not ( = ?auto_94380 ?auto_94383 ) ) ( not ( = ?auto_94380 ?auto_94385 ) ) ( not ( = ?auto_94380 ?auto_94387 ) ) ( ON ?auto_94380 ?auto_94384 ) ( not ( = ?auto_94380 ?auto_94384 ) ) ( not ( = ?auto_94381 ?auto_94384 ) ) ( not ( = ?auto_94382 ?auto_94384 ) ) ( not ( = ?auto_94386 ?auto_94384 ) ) ( not ( = ?auto_94383 ?auto_94384 ) ) ( not ( = ?auto_94385 ?auto_94384 ) ) ( not ( = ?auto_94387 ?auto_94384 ) ) ( ON ?auto_94381 ?auto_94380 ) ( ON-TABLE ?auto_94384 ) ( CLEAR ?auto_94386 ) ( ON ?auto_94382 ?auto_94381 ) ( CLEAR ?auto_94382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94384 ?auto_94380 ?auto_94381 )
      ( MAKE-3PILE ?auto_94380 ?auto_94381 ?auto_94382 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94388 - BLOCK
      ?auto_94389 - BLOCK
      ?auto_94390 - BLOCK
    )
    :vars
    (
      ?auto_94392 - BLOCK
      ?auto_94395 - BLOCK
      ?auto_94393 - BLOCK
      ?auto_94391 - BLOCK
      ?auto_94394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94388 ?auto_94389 ) ) ( not ( = ?auto_94388 ?auto_94390 ) ) ( not ( = ?auto_94389 ?auto_94390 ) ) ( not ( = ?auto_94388 ?auto_94392 ) ) ( not ( = ?auto_94389 ?auto_94392 ) ) ( not ( = ?auto_94390 ?auto_94392 ) ) ( ON-TABLE ?auto_94395 ) ( ON ?auto_94393 ?auto_94395 ) ( ON ?auto_94391 ?auto_94393 ) ( not ( = ?auto_94395 ?auto_94393 ) ) ( not ( = ?auto_94395 ?auto_94391 ) ) ( not ( = ?auto_94395 ?auto_94392 ) ) ( not ( = ?auto_94395 ?auto_94390 ) ) ( not ( = ?auto_94395 ?auto_94389 ) ) ( not ( = ?auto_94393 ?auto_94391 ) ) ( not ( = ?auto_94393 ?auto_94392 ) ) ( not ( = ?auto_94393 ?auto_94390 ) ) ( not ( = ?auto_94393 ?auto_94389 ) ) ( not ( = ?auto_94391 ?auto_94392 ) ) ( not ( = ?auto_94391 ?auto_94390 ) ) ( not ( = ?auto_94391 ?auto_94389 ) ) ( not ( = ?auto_94388 ?auto_94395 ) ) ( not ( = ?auto_94388 ?auto_94393 ) ) ( not ( = ?auto_94388 ?auto_94391 ) ) ( ON ?auto_94388 ?auto_94394 ) ( not ( = ?auto_94388 ?auto_94394 ) ) ( not ( = ?auto_94389 ?auto_94394 ) ) ( not ( = ?auto_94390 ?auto_94394 ) ) ( not ( = ?auto_94392 ?auto_94394 ) ) ( not ( = ?auto_94395 ?auto_94394 ) ) ( not ( = ?auto_94393 ?auto_94394 ) ) ( not ( = ?auto_94391 ?auto_94394 ) ) ( ON ?auto_94389 ?auto_94388 ) ( ON-TABLE ?auto_94394 ) ( ON ?auto_94390 ?auto_94389 ) ( CLEAR ?auto_94390 ) ( HOLDING ?auto_94392 ) ( CLEAR ?auto_94391 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94395 ?auto_94393 ?auto_94391 ?auto_94392 )
      ( MAKE-3PILE ?auto_94388 ?auto_94389 ?auto_94390 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94396 - BLOCK
      ?auto_94397 - BLOCK
      ?auto_94398 - BLOCK
    )
    :vars
    (
      ?auto_94401 - BLOCK
      ?auto_94399 - BLOCK
      ?auto_94400 - BLOCK
      ?auto_94402 - BLOCK
      ?auto_94403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94396 ?auto_94397 ) ) ( not ( = ?auto_94396 ?auto_94398 ) ) ( not ( = ?auto_94397 ?auto_94398 ) ) ( not ( = ?auto_94396 ?auto_94401 ) ) ( not ( = ?auto_94397 ?auto_94401 ) ) ( not ( = ?auto_94398 ?auto_94401 ) ) ( ON-TABLE ?auto_94399 ) ( ON ?auto_94400 ?auto_94399 ) ( ON ?auto_94402 ?auto_94400 ) ( not ( = ?auto_94399 ?auto_94400 ) ) ( not ( = ?auto_94399 ?auto_94402 ) ) ( not ( = ?auto_94399 ?auto_94401 ) ) ( not ( = ?auto_94399 ?auto_94398 ) ) ( not ( = ?auto_94399 ?auto_94397 ) ) ( not ( = ?auto_94400 ?auto_94402 ) ) ( not ( = ?auto_94400 ?auto_94401 ) ) ( not ( = ?auto_94400 ?auto_94398 ) ) ( not ( = ?auto_94400 ?auto_94397 ) ) ( not ( = ?auto_94402 ?auto_94401 ) ) ( not ( = ?auto_94402 ?auto_94398 ) ) ( not ( = ?auto_94402 ?auto_94397 ) ) ( not ( = ?auto_94396 ?auto_94399 ) ) ( not ( = ?auto_94396 ?auto_94400 ) ) ( not ( = ?auto_94396 ?auto_94402 ) ) ( ON ?auto_94396 ?auto_94403 ) ( not ( = ?auto_94396 ?auto_94403 ) ) ( not ( = ?auto_94397 ?auto_94403 ) ) ( not ( = ?auto_94398 ?auto_94403 ) ) ( not ( = ?auto_94401 ?auto_94403 ) ) ( not ( = ?auto_94399 ?auto_94403 ) ) ( not ( = ?auto_94400 ?auto_94403 ) ) ( not ( = ?auto_94402 ?auto_94403 ) ) ( ON ?auto_94397 ?auto_94396 ) ( ON-TABLE ?auto_94403 ) ( ON ?auto_94398 ?auto_94397 ) ( CLEAR ?auto_94402 ) ( ON ?auto_94401 ?auto_94398 ) ( CLEAR ?auto_94401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94403 ?auto_94396 ?auto_94397 ?auto_94398 )
      ( MAKE-3PILE ?auto_94396 ?auto_94397 ?auto_94398 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94404 - BLOCK
      ?auto_94405 - BLOCK
      ?auto_94406 - BLOCK
    )
    :vars
    (
      ?auto_94407 - BLOCK
      ?auto_94408 - BLOCK
      ?auto_94409 - BLOCK
      ?auto_94411 - BLOCK
      ?auto_94410 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94404 ?auto_94405 ) ) ( not ( = ?auto_94404 ?auto_94406 ) ) ( not ( = ?auto_94405 ?auto_94406 ) ) ( not ( = ?auto_94404 ?auto_94407 ) ) ( not ( = ?auto_94405 ?auto_94407 ) ) ( not ( = ?auto_94406 ?auto_94407 ) ) ( ON-TABLE ?auto_94408 ) ( ON ?auto_94409 ?auto_94408 ) ( not ( = ?auto_94408 ?auto_94409 ) ) ( not ( = ?auto_94408 ?auto_94411 ) ) ( not ( = ?auto_94408 ?auto_94407 ) ) ( not ( = ?auto_94408 ?auto_94406 ) ) ( not ( = ?auto_94408 ?auto_94405 ) ) ( not ( = ?auto_94409 ?auto_94411 ) ) ( not ( = ?auto_94409 ?auto_94407 ) ) ( not ( = ?auto_94409 ?auto_94406 ) ) ( not ( = ?auto_94409 ?auto_94405 ) ) ( not ( = ?auto_94411 ?auto_94407 ) ) ( not ( = ?auto_94411 ?auto_94406 ) ) ( not ( = ?auto_94411 ?auto_94405 ) ) ( not ( = ?auto_94404 ?auto_94408 ) ) ( not ( = ?auto_94404 ?auto_94409 ) ) ( not ( = ?auto_94404 ?auto_94411 ) ) ( ON ?auto_94404 ?auto_94410 ) ( not ( = ?auto_94404 ?auto_94410 ) ) ( not ( = ?auto_94405 ?auto_94410 ) ) ( not ( = ?auto_94406 ?auto_94410 ) ) ( not ( = ?auto_94407 ?auto_94410 ) ) ( not ( = ?auto_94408 ?auto_94410 ) ) ( not ( = ?auto_94409 ?auto_94410 ) ) ( not ( = ?auto_94411 ?auto_94410 ) ) ( ON ?auto_94405 ?auto_94404 ) ( ON-TABLE ?auto_94410 ) ( ON ?auto_94406 ?auto_94405 ) ( ON ?auto_94407 ?auto_94406 ) ( CLEAR ?auto_94407 ) ( HOLDING ?auto_94411 ) ( CLEAR ?auto_94409 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94408 ?auto_94409 ?auto_94411 )
      ( MAKE-3PILE ?auto_94404 ?auto_94405 ?auto_94406 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94412 - BLOCK
      ?auto_94413 - BLOCK
      ?auto_94414 - BLOCK
    )
    :vars
    (
      ?auto_94416 - BLOCK
      ?auto_94419 - BLOCK
      ?auto_94418 - BLOCK
      ?auto_94415 - BLOCK
      ?auto_94417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94412 ?auto_94413 ) ) ( not ( = ?auto_94412 ?auto_94414 ) ) ( not ( = ?auto_94413 ?auto_94414 ) ) ( not ( = ?auto_94412 ?auto_94416 ) ) ( not ( = ?auto_94413 ?auto_94416 ) ) ( not ( = ?auto_94414 ?auto_94416 ) ) ( ON-TABLE ?auto_94419 ) ( ON ?auto_94418 ?auto_94419 ) ( not ( = ?auto_94419 ?auto_94418 ) ) ( not ( = ?auto_94419 ?auto_94415 ) ) ( not ( = ?auto_94419 ?auto_94416 ) ) ( not ( = ?auto_94419 ?auto_94414 ) ) ( not ( = ?auto_94419 ?auto_94413 ) ) ( not ( = ?auto_94418 ?auto_94415 ) ) ( not ( = ?auto_94418 ?auto_94416 ) ) ( not ( = ?auto_94418 ?auto_94414 ) ) ( not ( = ?auto_94418 ?auto_94413 ) ) ( not ( = ?auto_94415 ?auto_94416 ) ) ( not ( = ?auto_94415 ?auto_94414 ) ) ( not ( = ?auto_94415 ?auto_94413 ) ) ( not ( = ?auto_94412 ?auto_94419 ) ) ( not ( = ?auto_94412 ?auto_94418 ) ) ( not ( = ?auto_94412 ?auto_94415 ) ) ( ON ?auto_94412 ?auto_94417 ) ( not ( = ?auto_94412 ?auto_94417 ) ) ( not ( = ?auto_94413 ?auto_94417 ) ) ( not ( = ?auto_94414 ?auto_94417 ) ) ( not ( = ?auto_94416 ?auto_94417 ) ) ( not ( = ?auto_94419 ?auto_94417 ) ) ( not ( = ?auto_94418 ?auto_94417 ) ) ( not ( = ?auto_94415 ?auto_94417 ) ) ( ON ?auto_94413 ?auto_94412 ) ( ON-TABLE ?auto_94417 ) ( ON ?auto_94414 ?auto_94413 ) ( ON ?auto_94416 ?auto_94414 ) ( CLEAR ?auto_94418 ) ( ON ?auto_94415 ?auto_94416 ) ( CLEAR ?auto_94415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94417 ?auto_94412 ?auto_94413 ?auto_94414 ?auto_94416 )
      ( MAKE-3PILE ?auto_94412 ?auto_94413 ?auto_94414 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94420 - BLOCK
      ?auto_94421 - BLOCK
      ?auto_94422 - BLOCK
    )
    :vars
    (
      ?auto_94426 - BLOCK
      ?auto_94427 - BLOCK
      ?auto_94423 - BLOCK
      ?auto_94425 - BLOCK
      ?auto_94424 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94420 ?auto_94421 ) ) ( not ( = ?auto_94420 ?auto_94422 ) ) ( not ( = ?auto_94421 ?auto_94422 ) ) ( not ( = ?auto_94420 ?auto_94426 ) ) ( not ( = ?auto_94421 ?auto_94426 ) ) ( not ( = ?auto_94422 ?auto_94426 ) ) ( ON-TABLE ?auto_94427 ) ( not ( = ?auto_94427 ?auto_94423 ) ) ( not ( = ?auto_94427 ?auto_94425 ) ) ( not ( = ?auto_94427 ?auto_94426 ) ) ( not ( = ?auto_94427 ?auto_94422 ) ) ( not ( = ?auto_94427 ?auto_94421 ) ) ( not ( = ?auto_94423 ?auto_94425 ) ) ( not ( = ?auto_94423 ?auto_94426 ) ) ( not ( = ?auto_94423 ?auto_94422 ) ) ( not ( = ?auto_94423 ?auto_94421 ) ) ( not ( = ?auto_94425 ?auto_94426 ) ) ( not ( = ?auto_94425 ?auto_94422 ) ) ( not ( = ?auto_94425 ?auto_94421 ) ) ( not ( = ?auto_94420 ?auto_94427 ) ) ( not ( = ?auto_94420 ?auto_94423 ) ) ( not ( = ?auto_94420 ?auto_94425 ) ) ( ON ?auto_94420 ?auto_94424 ) ( not ( = ?auto_94420 ?auto_94424 ) ) ( not ( = ?auto_94421 ?auto_94424 ) ) ( not ( = ?auto_94422 ?auto_94424 ) ) ( not ( = ?auto_94426 ?auto_94424 ) ) ( not ( = ?auto_94427 ?auto_94424 ) ) ( not ( = ?auto_94423 ?auto_94424 ) ) ( not ( = ?auto_94425 ?auto_94424 ) ) ( ON ?auto_94421 ?auto_94420 ) ( ON-TABLE ?auto_94424 ) ( ON ?auto_94422 ?auto_94421 ) ( ON ?auto_94426 ?auto_94422 ) ( ON ?auto_94425 ?auto_94426 ) ( CLEAR ?auto_94425 ) ( HOLDING ?auto_94423 ) ( CLEAR ?auto_94427 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94427 ?auto_94423 )
      ( MAKE-3PILE ?auto_94420 ?auto_94421 ?auto_94422 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94428 - BLOCK
      ?auto_94429 - BLOCK
      ?auto_94430 - BLOCK
    )
    :vars
    (
      ?auto_94431 - BLOCK
      ?auto_94435 - BLOCK
      ?auto_94433 - BLOCK
      ?auto_94432 - BLOCK
      ?auto_94434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94428 ?auto_94429 ) ) ( not ( = ?auto_94428 ?auto_94430 ) ) ( not ( = ?auto_94429 ?auto_94430 ) ) ( not ( = ?auto_94428 ?auto_94431 ) ) ( not ( = ?auto_94429 ?auto_94431 ) ) ( not ( = ?auto_94430 ?auto_94431 ) ) ( ON-TABLE ?auto_94435 ) ( not ( = ?auto_94435 ?auto_94433 ) ) ( not ( = ?auto_94435 ?auto_94432 ) ) ( not ( = ?auto_94435 ?auto_94431 ) ) ( not ( = ?auto_94435 ?auto_94430 ) ) ( not ( = ?auto_94435 ?auto_94429 ) ) ( not ( = ?auto_94433 ?auto_94432 ) ) ( not ( = ?auto_94433 ?auto_94431 ) ) ( not ( = ?auto_94433 ?auto_94430 ) ) ( not ( = ?auto_94433 ?auto_94429 ) ) ( not ( = ?auto_94432 ?auto_94431 ) ) ( not ( = ?auto_94432 ?auto_94430 ) ) ( not ( = ?auto_94432 ?auto_94429 ) ) ( not ( = ?auto_94428 ?auto_94435 ) ) ( not ( = ?auto_94428 ?auto_94433 ) ) ( not ( = ?auto_94428 ?auto_94432 ) ) ( ON ?auto_94428 ?auto_94434 ) ( not ( = ?auto_94428 ?auto_94434 ) ) ( not ( = ?auto_94429 ?auto_94434 ) ) ( not ( = ?auto_94430 ?auto_94434 ) ) ( not ( = ?auto_94431 ?auto_94434 ) ) ( not ( = ?auto_94435 ?auto_94434 ) ) ( not ( = ?auto_94433 ?auto_94434 ) ) ( not ( = ?auto_94432 ?auto_94434 ) ) ( ON ?auto_94429 ?auto_94428 ) ( ON-TABLE ?auto_94434 ) ( ON ?auto_94430 ?auto_94429 ) ( ON ?auto_94431 ?auto_94430 ) ( ON ?auto_94432 ?auto_94431 ) ( CLEAR ?auto_94435 ) ( ON ?auto_94433 ?auto_94432 ) ( CLEAR ?auto_94433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94434 ?auto_94428 ?auto_94429 ?auto_94430 ?auto_94431 ?auto_94432 )
      ( MAKE-3PILE ?auto_94428 ?auto_94429 ?auto_94430 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94436 - BLOCK
      ?auto_94437 - BLOCK
      ?auto_94438 - BLOCK
    )
    :vars
    (
      ?auto_94443 - BLOCK
      ?auto_94441 - BLOCK
      ?auto_94440 - BLOCK
      ?auto_94439 - BLOCK
      ?auto_94442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94436 ?auto_94437 ) ) ( not ( = ?auto_94436 ?auto_94438 ) ) ( not ( = ?auto_94437 ?auto_94438 ) ) ( not ( = ?auto_94436 ?auto_94443 ) ) ( not ( = ?auto_94437 ?auto_94443 ) ) ( not ( = ?auto_94438 ?auto_94443 ) ) ( not ( = ?auto_94441 ?auto_94440 ) ) ( not ( = ?auto_94441 ?auto_94439 ) ) ( not ( = ?auto_94441 ?auto_94443 ) ) ( not ( = ?auto_94441 ?auto_94438 ) ) ( not ( = ?auto_94441 ?auto_94437 ) ) ( not ( = ?auto_94440 ?auto_94439 ) ) ( not ( = ?auto_94440 ?auto_94443 ) ) ( not ( = ?auto_94440 ?auto_94438 ) ) ( not ( = ?auto_94440 ?auto_94437 ) ) ( not ( = ?auto_94439 ?auto_94443 ) ) ( not ( = ?auto_94439 ?auto_94438 ) ) ( not ( = ?auto_94439 ?auto_94437 ) ) ( not ( = ?auto_94436 ?auto_94441 ) ) ( not ( = ?auto_94436 ?auto_94440 ) ) ( not ( = ?auto_94436 ?auto_94439 ) ) ( ON ?auto_94436 ?auto_94442 ) ( not ( = ?auto_94436 ?auto_94442 ) ) ( not ( = ?auto_94437 ?auto_94442 ) ) ( not ( = ?auto_94438 ?auto_94442 ) ) ( not ( = ?auto_94443 ?auto_94442 ) ) ( not ( = ?auto_94441 ?auto_94442 ) ) ( not ( = ?auto_94440 ?auto_94442 ) ) ( not ( = ?auto_94439 ?auto_94442 ) ) ( ON ?auto_94437 ?auto_94436 ) ( ON-TABLE ?auto_94442 ) ( ON ?auto_94438 ?auto_94437 ) ( ON ?auto_94443 ?auto_94438 ) ( ON ?auto_94439 ?auto_94443 ) ( ON ?auto_94440 ?auto_94439 ) ( CLEAR ?auto_94440 ) ( HOLDING ?auto_94441 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94441 )
      ( MAKE-3PILE ?auto_94436 ?auto_94437 ?auto_94438 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94444 - BLOCK
      ?auto_94445 - BLOCK
      ?auto_94446 - BLOCK
    )
    :vars
    (
      ?auto_94448 - BLOCK
      ?auto_94451 - BLOCK
      ?auto_94450 - BLOCK
      ?auto_94447 - BLOCK
      ?auto_94449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94444 ?auto_94445 ) ) ( not ( = ?auto_94444 ?auto_94446 ) ) ( not ( = ?auto_94445 ?auto_94446 ) ) ( not ( = ?auto_94444 ?auto_94448 ) ) ( not ( = ?auto_94445 ?auto_94448 ) ) ( not ( = ?auto_94446 ?auto_94448 ) ) ( not ( = ?auto_94451 ?auto_94450 ) ) ( not ( = ?auto_94451 ?auto_94447 ) ) ( not ( = ?auto_94451 ?auto_94448 ) ) ( not ( = ?auto_94451 ?auto_94446 ) ) ( not ( = ?auto_94451 ?auto_94445 ) ) ( not ( = ?auto_94450 ?auto_94447 ) ) ( not ( = ?auto_94450 ?auto_94448 ) ) ( not ( = ?auto_94450 ?auto_94446 ) ) ( not ( = ?auto_94450 ?auto_94445 ) ) ( not ( = ?auto_94447 ?auto_94448 ) ) ( not ( = ?auto_94447 ?auto_94446 ) ) ( not ( = ?auto_94447 ?auto_94445 ) ) ( not ( = ?auto_94444 ?auto_94451 ) ) ( not ( = ?auto_94444 ?auto_94450 ) ) ( not ( = ?auto_94444 ?auto_94447 ) ) ( ON ?auto_94444 ?auto_94449 ) ( not ( = ?auto_94444 ?auto_94449 ) ) ( not ( = ?auto_94445 ?auto_94449 ) ) ( not ( = ?auto_94446 ?auto_94449 ) ) ( not ( = ?auto_94448 ?auto_94449 ) ) ( not ( = ?auto_94451 ?auto_94449 ) ) ( not ( = ?auto_94450 ?auto_94449 ) ) ( not ( = ?auto_94447 ?auto_94449 ) ) ( ON ?auto_94445 ?auto_94444 ) ( ON-TABLE ?auto_94449 ) ( ON ?auto_94446 ?auto_94445 ) ( ON ?auto_94448 ?auto_94446 ) ( ON ?auto_94447 ?auto_94448 ) ( ON ?auto_94450 ?auto_94447 ) ( ON ?auto_94451 ?auto_94450 ) ( CLEAR ?auto_94451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94449 ?auto_94444 ?auto_94445 ?auto_94446 ?auto_94448 ?auto_94447 ?auto_94450 )
      ( MAKE-3PILE ?auto_94444 ?auto_94445 ?auto_94446 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94455 - BLOCK
      ?auto_94456 - BLOCK
      ?auto_94457 - BLOCK
    )
    :vars
    (
      ?auto_94458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94458 ?auto_94457 ) ( CLEAR ?auto_94458 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94455 ) ( ON ?auto_94456 ?auto_94455 ) ( ON ?auto_94457 ?auto_94456 ) ( not ( = ?auto_94455 ?auto_94456 ) ) ( not ( = ?auto_94455 ?auto_94457 ) ) ( not ( = ?auto_94455 ?auto_94458 ) ) ( not ( = ?auto_94456 ?auto_94457 ) ) ( not ( = ?auto_94456 ?auto_94458 ) ) ( not ( = ?auto_94457 ?auto_94458 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94458 ?auto_94457 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94459 - BLOCK
      ?auto_94460 - BLOCK
      ?auto_94461 - BLOCK
    )
    :vars
    (
      ?auto_94462 - BLOCK
      ?auto_94463 - BLOCK
      ?auto_94464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94462 ?auto_94461 ) ( CLEAR ?auto_94462 ) ( ON-TABLE ?auto_94459 ) ( ON ?auto_94460 ?auto_94459 ) ( ON ?auto_94461 ?auto_94460 ) ( not ( = ?auto_94459 ?auto_94460 ) ) ( not ( = ?auto_94459 ?auto_94461 ) ) ( not ( = ?auto_94459 ?auto_94462 ) ) ( not ( = ?auto_94460 ?auto_94461 ) ) ( not ( = ?auto_94460 ?auto_94462 ) ) ( not ( = ?auto_94461 ?auto_94462 ) ) ( HOLDING ?auto_94463 ) ( CLEAR ?auto_94464 ) ( not ( = ?auto_94459 ?auto_94463 ) ) ( not ( = ?auto_94459 ?auto_94464 ) ) ( not ( = ?auto_94460 ?auto_94463 ) ) ( not ( = ?auto_94460 ?auto_94464 ) ) ( not ( = ?auto_94461 ?auto_94463 ) ) ( not ( = ?auto_94461 ?auto_94464 ) ) ( not ( = ?auto_94462 ?auto_94463 ) ) ( not ( = ?auto_94462 ?auto_94464 ) ) ( not ( = ?auto_94463 ?auto_94464 ) ) )
    :subtasks
    ( ( !STACK ?auto_94463 ?auto_94464 )
      ( MAKE-3PILE ?auto_94459 ?auto_94460 ?auto_94461 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94465 - BLOCK
      ?auto_94466 - BLOCK
      ?auto_94467 - BLOCK
    )
    :vars
    (
      ?auto_94470 - BLOCK
      ?auto_94468 - BLOCK
      ?auto_94469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94470 ?auto_94467 ) ( ON-TABLE ?auto_94465 ) ( ON ?auto_94466 ?auto_94465 ) ( ON ?auto_94467 ?auto_94466 ) ( not ( = ?auto_94465 ?auto_94466 ) ) ( not ( = ?auto_94465 ?auto_94467 ) ) ( not ( = ?auto_94465 ?auto_94470 ) ) ( not ( = ?auto_94466 ?auto_94467 ) ) ( not ( = ?auto_94466 ?auto_94470 ) ) ( not ( = ?auto_94467 ?auto_94470 ) ) ( CLEAR ?auto_94468 ) ( not ( = ?auto_94465 ?auto_94469 ) ) ( not ( = ?auto_94465 ?auto_94468 ) ) ( not ( = ?auto_94466 ?auto_94469 ) ) ( not ( = ?auto_94466 ?auto_94468 ) ) ( not ( = ?auto_94467 ?auto_94469 ) ) ( not ( = ?auto_94467 ?auto_94468 ) ) ( not ( = ?auto_94470 ?auto_94469 ) ) ( not ( = ?auto_94470 ?auto_94468 ) ) ( not ( = ?auto_94469 ?auto_94468 ) ) ( ON ?auto_94469 ?auto_94470 ) ( CLEAR ?auto_94469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94465 ?auto_94466 ?auto_94467 ?auto_94470 )
      ( MAKE-3PILE ?auto_94465 ?auto_94466 ?auto_94467 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94471 - BLOCK
      ?auto_94472 - BLOCK
      ?auto_94473 - BLOCK
    )
    :vars
    (
      ?auto_94476 - BLOCK
      ?auto_94475 - BLOCK
      ?auto_94474 - BLOCK
      ?auto_94477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94476 ?auto_94473 ) ( ON-TABLE ?auto_94471 ) ( ON ?auto_94472 ?auto_94471 ) ( ON ?auto_94473 ?auto_94472 ) ( not ( = ?auto_94471 ?auto_94472 ) ) ( not ( = ?auto_94471 ?auto_94473 ) ) ( not ( = ?auto_94471 ?auto_94476 ) ) ( not ( = ?auto_94472 ?auto_94473 ) ) ( not ( = ?auto_94472 ?auto_94476 ) ) ( not ( = ?auto_94473 ?auto_94476 ) ) ( not ( = ?auto_94471 ?auto_94475 ) ) ( not ( = ?auto_94471 ?auto_94474 ) ) ( not ( = ?auto_94472 ?auto_94475 ) ) ( not ( = ?auto_94472 ?auto_94474 ) ) ( not ( = ?auto_94473 ?auto_94475 ) ) ( not ( = ?auto_94473 ?auto_94474 ) ) ( not ( = ?auto_94476 ?auto_94475 ) ) ( not ( = ?auto_94476 ?auto_94474 ) ) ( not ( = ?auto_94475 ?auto_94474 ) ) ( ON ?auto_94475 ?auto_94476 ) ( CLEAR ?auto_94475 ) ( HOLDING ?auto_94474 ) ( CLEAR ?auto_94477 ) ( ON-TABLE ?auto_94477 ) ( not ( = ?auto_94477 ?auto_94474 ) ) ( not ( = ?auto_94471 ?auto_94477 ) ) ( not ( = ?auto_94472 ?auto_94477 ) ) ( not ( = ?auto_94473 ?auto_94477 ) ) ( not ( = ?auto_94476 ?auto_94477 ) ) ( not ( = ?auto_94475 ?auto_94477 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94477 ?auto_94474 )
      ( MAKE-3PILE ?auto_94471 ?auto_94472 ?auto_94473 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94478 - BLOCK
      ?auto_94479 - BLOCK
      ?auto_94480 - BLOCK
    )
    :vars
    (
      ?auto_94482 - BLOCK
      ?auto_94483 - BLOCK
      ?auto_94484 - BLOCK
      ?auto_94481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94482 ?auto_94480 ) ( ON-TABLE ?auto_94478 ) ( ON ?auto_94479 ?auto_94478 ) ( ON ?auto_94480 ?auto_94479 ) ( not ( = ?auto_94478 ?auto_94479 ) ) ( not ( = ?auto_94478 ?auto_94480 ) ) ( not ( = ?auto_94478 ?auto_94482 ) ) ( not ( = ?auto_94479 ?auto_94480 ) ) ( not ( = ?auto_94479 ?auto_94482 ) ) ( not ( = ?auto_94480 ?auto_94482 ) ) ( not ( = ?auto_94478 ?auto_94483 ) ) ( not ( = ?auto_94478 ?auto_94484 ) ) ( not ( = ?auto_94479 ?auto_94483 ) ) ( not ( = ?auto_94479 ?auto_94484 ) ) ( not ( = ?auto_94480 ?auto_94483 ) ) ( not ( = ?auto_94480 ?auto_94484 ) ) ( not ( = ?auto_94482 ?auto_94483 ) ) ( not ( = ?auto_94482 ?auto_94484 ) ) ( not ( = ?auto_94483 ?auto_94484 ) ) ( ON ?auto_94483 ?auto_94482 ) ( CLEAR ?auto_94481 ) ( ON-TABLE ?auto_94481 ) ( not ( = ?auto_94481 ?auto_94484 ) ) ( not ( = ?auto_94478 ?auto_94481 ) ) ( not ( = ?auto_94479 ?auto_94481 ) ) ( not ( = ?auto_94480 ?auto_94481 ) ) ( not ( = ?auto_94482 ?auto_94481 ) ) ( not ( = ?auto_94483 ?auto_94481 ) ) ( ON ?auto_94484 ?auto_94483 ) ( CLEAR ?auto_94484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94478 ?auto_94479 ?auto_94480 ?auto_94482 ?auto_94483 )
      ( MAKE-3PILE ?auto_94478 ?auto_94479 ?auto_94480 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94485 - BLOCK
      ?auto_94486 - BLOCK
      ?auto_94487 - BLOCK
    )
    :vars
    (
      ?auto_94490 - BLOCK
      ?auto_94488 - BLOCK
      ?auto_94491 - BLOCK
      ?auto_94489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94490 ?auto_94487 ) ( ON-TABLE ?auto_94485 ) ( ON ?auto_94486 ?auto_94485 ) ( ON ?auto_94487 ?auto_94486 ) ( not ( = ?auto_94485 ?auto_94486 ) ) ( not ( = ?auto_94485 ?auto_94487 ) ) ( not ( = ?auto_94485 ?auto_94490 ) ) ( not ( = ?auto_94486 ?auto_94487 ) ) ( not ( = ?auto_94486 ?auto_94490 ) ) ( not ( = ?auto_94487 ?auto_94490 ) ) ( not ( = ?auto_94485 ?auto_94488 ) ) ( not ( = ?auto_94485 ?auto_94491 ) ) ( not ( = ?auto_94486 ?auto_94488 ) ) ( not ( = ?auto_94486 ?auto_94491 ) ) ( not ( = ?auto_94487 ?auto_94488 ) ) ( not ( = ?auto_94487 ?auto_94491 ) ) ( not ( = ?auto_94490 ?auto_94488 ) ) ( not ( = ?auto_94490 ?auto_94491 ) ) ( not ( = ?auto_94488 ?auto_94491 ) ) ( ON ?auto_94488 ?auto_94490 ) ( not ( = ?auto_94489 ?auto_94491 ) ) ( not ( = ?auto_94485 ?auto_94489 ) ) ( not ( = ?auto_94486 ?auto_94489 ) ) ( not ( = ?auto_94487 ?auto_94489 ) ) ( not ( = ?auto_94490 ?auto_94489 ) ) ( not ( = ?auto_94488 ?auto_94489 ) ) ( ON ?auto_94491 ?auto_94488 ) ( CLEAR ?auto_94491 ) ( HOLDING ?auto_94489 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94489 )
      ( MAKE-3PILE ?auto_94485 ?auto_94486 ?auto_94487 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94492 - BLOCK
      ?auto_94493 - BLOCK
      ?auto_94494 - BLOCK
    )
    :vars
    (
      ?auto_94495 - BLOCK
      ?auto_94496 - BLOCK
      ?auto_94497 - BLOCK
      ?auto_94498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94495 ?auto_94494 ) ( ON-TABLE ?auto_94492 ) ( ON ?auto_94493 ?auto_94492 ) ( ON ?auto_94494 ?auto_94493 ) ( not ( = ?auto_94492 ?auto_94493 ) ) ( not ( = ?auto_94492 ?auto_94494 ) ) ( not ( = ?auto_94492 ?auto_94495 ) ) ( not ( = ?auto_94493 ?auto_94494 ) ) ( not ( = ?auto_94493 ?auto_94495 ) ) ( not ( = ?auto_94494 ?auto_94495 ) ) ( not ( = ?auto_94492 ?auto_94496 ) ) ( not ( = ?auto_94492 ?auto_94497 ) ) ( not ( = ?auto_94493 ?auto_94496 ) ) ( not ( = ?auto_94493 ?auto_94497 ) ) ( not ( = ?auto_94494 ?auto_94496 ) ) ( not ( = ?auto_94494 ?auto_94497 ) ) ( not ( = ?auto_94495 ?auto_94496 ) ) ( not ( = ?auto_94495 ?auto_94497 ) ) ( not ( = ?auto_94496 ?auto_94497 ) ) ( ON ?auto_94496 ?auto_94495 ) ( not ( = ?auto_94498 ?auto_94497 ) ) ( not ( = ?auto_94492 ?auto_94498 ) ) ( not ( = ?auto_94493 ?auto_94498 ) ) ( not ( = ?auto_94494 ?auto_94498 ) ) ( not ( = ?auto_94495 ?auto_94498 ) ) ( not ( = ?auto_94496 ?auto_94498 ) ) ( ON ?auto_94497 ?auto_94496 ) ( ON ?auto_94498 ?auto_94497 ) ( CLEAR ?auto_94498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94492 ?auto_94493 ?auto_94494 ?auto_94495 ?auto_94496 ?auto_94497 )
      ( MAKE-3PILE ?auto_94492 ?auto_94493 ?auto_94494 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94499 - BLOCK
      ?auto_94500 - BLOCK
      ?auto_94501 - BLOCK
    )
    :vars
    (
      ?auto_94502 - BLOCK
      ?auto_94503 - BLOCK
      ?auto_94504 - BLOCK
      ?auto_94505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94502 ?auto_94501 ) ( ON-TABLE ?auto_94499 ) ( ON ?auto_94500 ?auto_94499 ) ( ON ?auto_94501 ?auto_94500 ) ( not ( = ?auto_94499 ?auto_94500 ) ) ( not ( = ?auto_94499 ?auto_94501 ) ) ( not ( = ?auto_94499 ?auto_94502 ) ) ( not ( = ?auto_94500 ?auto_94501 ) ) ( not ( = ?auto_94500 ?auto_94502 ) ) ( not ( = ?auto_94501 ?auto_94502 ) ) ( not ( = ?auto_94499 ?auto_94503 ) ) ( not ( = ?auto_94499 ?auto_94504 ) ) ( not ( = ?auto_94500 ?auto_94503 ) ) ( not ( = ?auto_94500 ?auto_94504 ) ) ( not ( = ?auto_94501 ?auto_94503 ) ) ( not ( = ?auto_94501 ?auto_94504 ) ) ( not ( = ?auto_94502 ?auto_94503 ) ) ( not ( = ?auto_94502 ?auto_94504 ) ) ( not ( = ?auto_94503 ?auto_94504 ) ) ( ON ?auto_94503 ?auto_94502 ) ( not ( = ?auto_94505 ?auto_94504 ) ) ( not ( = ?auto_94499 ?auto_94505 ) ) ( not ( = ?auto_94500 ?auto_94505 ) ) ( not ( = ?auto_94501 ?auto_94505 ) ) ( not ( = ?auto_94502 ?auto_94505 ) ) ( not ( = ?auto_94503 ?auto_94505 ) ) ( ON ?auto_94504 ?auto_94503 ) ( HOLDING ?auto_94505 ) ( CLEAR ?auto_94504 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94499 ?auto_94500 ?auto_94501 ?auto_94502 ?auto_94503 ?auto_94504 ?auto_94505 )
      ( MAKE-3PILE ?auto_94499 ?auto_94500 ?auto_94501 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94506 - BLOCK
      ?auto_94507 - BLOCK
      ?auto_94508 - BLOCK
    )
    :vars
    (
      ?auto_94509 - BLOCK
      ?auto_94511 - BLOCK
      ?auto_94510 - BLOCK
      ?auto_94512 - BLOCK
      ?auto_94513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94509 ?auto_94508 ) ( ON-TABLE ?auto_94506 ) ( ON ?auto_94507 ?auto_94506 ) ( ON ?auto_94508 ?auto_94507 ) ( not ( = ?auto_94506 ?auto_94507 ) ) ( not ( = ?auto_94506 ?auto_94508 ) ) ( not ( = ?auto_94506 ?auto_94509 ) ) ( not ( = ?auto_94507 ?auto_94508 ) ) ( not ( = ?auto_94507 ?auto_94509 ) ) ( not ( = ?auto_94508 ?auto_94509 ) ) ( not ( = ?auto_94506 ?auto_94511 ) ) ( not ( = ?auto_94506 ?auto_94510 ) ) ( not ( = ?auto_94507 ?auto_94511 ) ) ( not ( = ?auto_94507 ?auto_94510 ) ) ( not ( = ?auto_94508 ?auto_94511 ) ) ( not ( = ?auto_94508 ?auto_94510 ) ) ( not ( = ?auto_94509 ?auto_94511 ) ) ( not ( = ?auto_94509 ?auto_94510 ) ) ( not ( = ?auto_94511 ?auto_94510 ) ) ( ON ?auto_94511 ?auto_94509 ) ( not ( = ?auto_94512 ?auto_94510 ) ) ( not ( = ?auto_94506 ?auto_94512 ) ) ( not ( = ?auto_94507 ?auto_94512 ) ) ( not ( = ?auto_94508 ?auto_94512 ) ) ( not ( = ?auto_94509 ?auto_94512 ) ) ( not ( = ?auto_94511 ?auto_94512 ) ) ( ON ?auto_94510 ?auto_94511 ) ( CLEAR ?auto_94510 ) ( ON ?auto_94512 ?auto_94513 ) ( CLEAR ?auto_94512 ) ( HAND-EMPTY ) ( not ( = ?auto_94506 ?auto_94513 ) ) ( not ( = ?auto_94507 ?auto_94513 ) ) ( not ( = ?auto_94508 ?auto_94513 ) ) ( not ( = ?auto_94509 ?auto_94513 ) ) ( not ( = ?auto_94511 ?auto_94513 ) ) ( not ( = ?auto_94510 ?auto_94513 ) ) ( not ( = ?auto_94512 ?auto_94513 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94512 ?auto_94513 )
      ( MAKE-3PILE ?auto_94506 ?auto_94507 ?auto_94508 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94514 - BLOCK
      ?auto_94515 - BLOCK
      ?auto_94516 - BLOCK
    )
    :vars
    (
      ?auto_94521 - BLOCK
      ?auto_94520 - BLOCK
      ?auto_94518 - BLOCK
      ?auto_94517 - BLOCK
      ?auto_94519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94521 ?auto_94516 ) ( ON-TABLE ?auto_94514 ) ( ON ?auto_94515 ?auto_94514 ) ( ON ?auto_94516 ?auto_94515 ) ( not ( = ?auto_94514 ?auto_94515 ) ) ( not ( = ?auto_94514 ?auto_94516 ) ) ( not ( = ?auto_94514 ?auto_94521 ) ) ( not ( = ?auto_94515 ?auto_94516 ) ) ( not ( = ?auto_94515 ?auto_94521 ) ) ( not ( = ?auto_94516 ?auto_94521 ) ) ( not ( = ?auto_94514 ?auto_94520 ) ) ( not ( = ?auto_94514 ?auto_94518 ) ) ( not ( = ?auto_94515 ?auto_94520 ) ) ( not ( = ?auto_94515 ?auto_94518 ) ) ( not ( = ?auto_94516 ?auto_94520 ) ) ( not ( = ?auto_94516 ?auto_94518 ) ) ( not ( = ?auto_94521 ?auto_94520 ) ) ( not ( = ?auto_94521 ?auto_94518 ) ) ( not ( = ?auto_94520 ?auto_94518 ) ) ( ON ?auto_94520 ?auto_94521 ) ( not ( = ?auto_94517 ?auto_94518 ) ) ( not ( = ?auto_94514 ?auto_94517 ) ) ( not ( = ?auto_94515 ?auto_94517 ) ) ( not ( = ?auto_94516 ?auto_94517 ) ) ( not ( = ?auto_94521 ?auto_94517 ) ) ( not ( = ?auto_94520 ?auto_94517 ) ) ( ON ?auto_94517 ?auto_94519 ) ( CLEAR ?auto_94517 ) ( not ( = ?auto_94514 ?auto_94519 ) ) ( not ( = ?auto_94515 ?auto_94519 ) ) ( not ( = ?auto_94516 ?auto_94519 ) ) ( not ( = ?auto_94521 ?auto_94519 ) ) ( not ( = ?auto_94520 ?auto_94519 ) ) ( not ( = ?auto_94518 ?auto_94519 ) ) ( not ( = ?auto_94517 ?auto_94519 ) ) ( HOLDING ?auto_94518 ) ( CLEAR ?auto_94520 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94514 ?auto_94515 ?auto_94516 ?auto_94521 ?auto_94520 ?auto_94518 )
      ( MAKE-3PILE ?auto_94514 ?auto_94515 ?auto_94516 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94522 - BLOCK
      ?auto_94523 - BLOCK
      ?auto_94524 - BLOCK
    )
    :vars
    (
      ?auto_94529 - BLOCK
      ?auto_94527 - BLOCK
      ?auto_94528 - BLOCK
      ?auto_94525 - BLOCK
      ?auto_94526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94529 ?auto_94524 ) ( ON-TABLE ?auto_94522 ) ( ON ?auto_94523 ?auto_94522 ) ( ON ?auto_94524 ?auto_94523 ) ( not ( = ?auto_94522 ?auto_94523 ) ) ( not ( = ?auto_94522 ?auto_94524 ) ) ( not ( = ?auto_94522 ?auto_94529 ) ) ( not ( = ?auto_94523 ?auto_94524 ) ) ( not ( = ?auto_94523 ?auto_94529 ) ) ( not ( = ?auto_94524 ?auto_94529 ) ) ( not ( = ?auto_94522 ?auto_94527 ) ) ( not ( = ?auto_94522 ?auto_94528 ) ) ( not ( = ?auto_94523 ?auto_94527 ) ) ( not ( = ?auto_94523 ?auto_94528 ) ) ( not ( = ?auto_94524 ?auto_94527 ) ) ( not ( = ?auto_94524 ?auto_94528 ) ) ( not ( = ?auto_94529 ?auto_94527 ) ) ( not ( = ?auto_94529 ?auto_94528 ) ) ( not ( = ?auto_94527 ?auto_94528 ) ) ( ON ?auto_94527 ?auto_94529 ) ( not ( = ?auto_94525 ?auto_94528 ) ) ( not ( = ?auto_94522 ?auto_94525 ) ) ( not ( = ?auto_94523 ?auto_94525 ) ) ( not ( = ?auto_94524 ?auto_94525 ) ) ( not ( = ?auto_94529 ?auto_94525 ) ) ( not ( = ?auto_94527 ?auto_94525 ) ) ( ON ?auto_94525 ?auto_94526 ) ( not ( = ?auto_94522 ?auto_94526 ) ) ( not ( = ?auto_94523 ?auto_94526 ) ) ( not ( = ?auto_94524 ?auto_94526 ) ) ( not ( = ?auto_94529 ?auto_94526 ) ) ( not ( = ?auto_94527 ?auto_94526 ) ) ( not ( = ?auto_94528 ?auto_94526 ) ) ( not ( = ?auto_94525 ?auto_94526 ) ) ( CLEAR ?auto_94527 ) ( ON ?auto_94528 ?auto_94525 ) ( CLEAR ?auto_94528 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94526 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94526 ?auto_94525 )
      ( MAKE-3PILE ?auto_94522 ?auto_94523 ?auto_94524 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94530 - BLOCK
      ?auto_94531 - BLOCK
      ?auto_94532 - BLOCK
    )
    :vars
    (
      ?auto_94537 - BLOCK
      ?auto_94536 - BLOCK
      ?auto_94533 - BLOCK
      ?auto_94534 - BLOCK
      ?auto_94535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94537 ?auto_94532 ) ( ON-TABLE ?auto_94530 ) ( ON ?auto_94531 ?auto_94530 ) ( ON ?auto_94532 ?auto_94531 ) ( not ( = ?auto_94530 ?auto_94531 ) ) ( not ( = ?auto_94530 ?auto_94532 ) ) ( not ( = ?auto_94530 ?auto_94537 ) ) ( not ( = ?auto_94531 ?auto_94532 ) ) ( not ( = ?auto_94531 ?auto_94537 ) ) ( not ( = ?auto_94532 ?auto_94537 ) ) ( not ( = ?auto_94530 ?auto_94536 ) ) ( not ( = ?auto_94530 ?auto_94533 ) ) ( not ( = ?auto_94531 ?auto_94536 ) ) ( not ( = ?auto_94531 ?auto_94533 ) ) ( not ( = ?auto_94532 ?auto_94536 ) ) ( not ( = ?auto_94532 ?auto_94533 ) ) ( not ( = ?auto_94537 ?auto_94536 ) ) ( not ( = ?auto_94537 ?auto_94533 ) ) ( not ( = ?auto_94536 ?auto_94533 ) ) ( not ( = ?auto_94534 ?auto_94533 ) ) ( not ( = ?auto_94530 ?auto_94534 ) ) ( not ( = ?auto_94531 ?auto_94534 ) ) ( not ( = ?auto_94532 ?auto_94534 ) ) ( not ( = ?auto_94537 ?auto_94534 ) ) ( not ( = ?auto_94536 ?auto_94534 ) ) ( ON ?auto_94534 ?auto_94535 ) ( not ( = ?auto_94530 ?auto_94535 ) ) ( not ( = ?auto_94531 ?auto_94535 ) ) ( not ( = ?auto_94532 ?auto_94535 ) ) ( not ( = ?auto_94537 ?auto_94535 ) ) ( not ( = ?auto_94536 ?auto_94535 ) ) ( not ( = ?auto_94533 ?auto_94535 ) ) ( not ( = ?auto_94534 ?auto_94535 ) ) ( ON ?auto_94533 ?auto_94534 ) ( CLEAR ?auto_94533 ) ( ON-TABLE ?auto_94535 ) ( HOLDING ?auto_94536 ) ( CLEAR ?auto_94537 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94530 ?auto_94531 ?auto_94532 ?auto_94537 ?auto_94536 )
      ( MAKE-3PILE ?auto_94530 ?auto_94531 ?auto_94532 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94538 - BLOCK
      ?auto_94539 - BLOCK
      ?auto_94540 - BLOCK
    )
    :vars
    (
      ?auto_94543 - BLOCK
      ?auto_94542 - BLOCK
      ?auto_94541 - BLOCK
      ?auto_94544 - BLOCK
      ?auto_94545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94543 ?auto_94540 ) ( ON-TABLE ?auto_94538 ) ( ON ?auto_94539 ?auto_94538 ) ( ON ?auto_94540 ?auto_94539 ) ( not ( = ?auto_94538 ?auto_94539 ) ) ( not ( = ?auto_94538 ?auto_94540 ) ) ( not ( = ?auto_94538 ?auto_94543 ) ) ( not ( = ?auto_94539 ?auto_94540 ) ) ( not ( = ?auto_94539 ?auto_94543 ) ) ( not ( = ?auto_94540 ?auto_94543 ) ) ( not ( = ?auto_94538 ?auto_94542 ) ) ( not ( = ?auto_94538 ?auto_94541 ) ) ( not ( = ?auto_94539 ?auto_94542 ) ) ( not ( = ?auto_94539 ?auto_94541 ) ) ( not ( = ?auto_94540 ?auto_94542 ) ) ( not ( = ?auto_94540 ?auto_94541 ) ) ( not ( = ?auto_94543 ?auto_94542 ) ) ( not ( = ?auto_94543 ?auto_94541 ) ) ( not ( = ?auto_94542 ?auto_94541 ) ) ( not ( = ?auto_94544 ?auto_94541 ) ) ( not ( = ?auto_94538 ?auto_94544 ) ) ( not ( = ?auto_94539 ?auto_94544 ) ) ( not ( = ?auto_94540 ?auto_94544 ) ) ( not ( = ?auto_94543 ?auto_94544 ) ) ( not ( = ?auto_94542 ?auto_94544 ) ) ( ON ?auto_94544 ?auto_94545 ) ( not ( = ?auto_94538 ?auto_94545 ) ) ( not ( = ?auto_94539 ?auto_94545 ) ) ( not ( = ?auto_94540 ?auto_94545 ) ) ( not ( = ?auto_94543 ?auto_94545 ) ) ( not ( = ?auto_94542 ?auto_94545 ) ) ( not ( = ?auto_94541 ?auto_94545 ) ) ( not ( = ?auto_94544 ?auto_94545 ) ) ( ON ?auto_94541 ?auto_94544 ) ( ON-TABLE ?auto_94545 ) ( CLEAR ?auto_94543 ) ( ON ?auto_94542 ?auto_94541 ) ( CLEAR ?auto_94542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94545 ?auto_94544 ?auto_94541 )
      ( MAKE-3PILE ?auto_94538 ?auto_94539 ?auto_94540 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94562 - BLOCK
      ?auto_94563 - BLOCK
      ?auto_94564 - BLOCK
    )
    :vars
    (
      ?auto_94567 - BLOCK
      ?auto_94566 - BLOCK
      ?auto_94569 - BLOCK
      ?auto_94565 - BLOCK
      ?auto_94568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94562 ) ( ON ?auto_94563 ?auto_94562 ) ( not ( = ?auto_94562 ?auto_94563 ) ) ( not ( = ?auto_94562 ?auto_94564 ) ) ( not ( = ?auto_94562 ?auto_94567 ) ) ( not ( = ?auto_94563 ?auto_94564 ) ) ( not ( = ?auto_94563 ?auto_94567 ) ) ( not ( = ?auto_94564 ?auto_94567 ) ) ( not ( = ?auto_94562 ?auto_94566 ) ) ( not ( = ?auto_94562 ?auto_94569 ) ) ( not ( = ?auto_94563 ?auto_94566 ) ) ( not ( = ?auto_94563 ?auto_94569 ) ) ( not ( = ?auto_94564 ?auto_94566 ) ) ( not ( = ?auto_94564 ?auto_94569 ) ) ( not ( = ?auto_94567 ?auto_94566 ) ) ( not ( = ?auto_94567 ?auto_94569 ) ) ( not ( = ?auto_94566 ?auto_94569 ) ) ( not ( = ?auto_94565 ?auto_94569 ) ) ( not ( = ?auto_94562 ?auto_94565 ) ) ( not ( = ?auto_94563 ?auto_94565 ) ) ( not ( = ?auto_94564 ?auto_94565 ) ) ( not ( = ?auto_94567 ?auto_94565 ) ) ( not ( = ?auto_94566 ?auto_94565 ) ) ( ON ?auto_94565 ?auto_94568 ) ( not ( = ?auto_94562 ?auto_94568 ) ) ( not ( = ?auto_94563 ?auto_94568 ) ) ( not ( = ?auto_94564 ?auto_94568 ) ) ( not ( = ?auto_94567 ?auto_94568 ) ) ( not ( = ?auto_94566 ?auto_94568 ) ) ( not ( = ?auto_94569 ?auto_94568 ) ) ( not ( = ?auto_94565 ?auto_94568 ) ) ( ON ?auto_94569 ?auto_94565 ) ( ON-TABLE ?auto_94568 ) ( ON ?auto_94566 ?auto_94569 ) ( ON ?auto_94567 ?auto_94566 ) ( CLEAR ?auto_94567 ) ( HOLDING ?auto_94564 ) ( CLEAR ?auto_94563 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94562 ?auto_94563 ?auto_94564 ?auto_94567 )
      ( MAKE-3PILE ?auto_94562 ?auto_94563 ?auto_94564 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94570 - BLOCK
      ?auto_94571 - BLOCK
      ?auto_94572 - BLOCK
    )
    :vars
    (
      ?auto_94574 - BLOCK
      ?auto_94575 - BLOCK
      ?auto_94573 - BLOCK
      ?auto_94576 - BLOCK
      ?auto_94577 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94570 ) ( ON ?auto_94571 ?auto_94570 ) ( not ( = ?auto_94570 ?auto_94571 ) ) ( not ( = ?auto_94570 ?auto_94572 ) ) ( not ( = ?auto_94570 ?auto_94574 ) ) ( not ( = ?auto_94571 ?auto_94572 ) ) ( not ( = ?auto_94571 ?auto_94574 ) ) ( not ( = ?auto_94572 ?auto_94574 ) ) ( not ( = ?auto_94570 ?auto_94575 ) ) ( not ( = ?auto_94570 ?auto_94573 ) ) ( not ( = ?auto_94571 ?auto_94575 ) ) ( not ( = ?auto_94571 ?auto_94573 ) ) ( not ( = ?auto_94572 ?auto_94575 ) ) ( not ( = ?auto_94572 ?auto_94573 ) ) ( not ( = ?auto_94574 ?auto_94575 ) ) ( not ( = ?auto_94574 ?auto_94573 ) ) ( not ( = ?auto_94575 ?auto_94573 ) ) ( not ( = ?auto_94576 ?auto_94573 ) ) ( not ( = ?auto_94570 ?auto_94576 ) ) ( not ( = ?auto_94571 ?auto_94576 ) ) ( not ( = ?auto_94572 ?auto_94576 ) ) ( not ( = ?auto_94574 ?auto_94576 ) ) ( not ( = ?auto_94575 ?auto_94576 ) ) ( ON ?auto_94576 ?auto_94577 ) ( not ( = ?auto_94570 ?auto_94577 ) ) ( not ( = ?auto_94571 ?auto_94577 ) ) ( not ( = ?auto_94572 ?auto_94577 ) ) ( not ( = ?auto_94574 ?auto_94577 ) ) ( not ( = ?auto_94575 ?auto_94577 ) ) ( not ( = ?auto_94573 ?auto_94577 ) ) ( not ( = ?auto_94576 ?auto_94577 ) ) ( ON ?auto_94573 ?auto_94576 ) ( ON-TABLE ?auto_94577 ) ( ON ?auto_94575 ?auto_94573 ) ( ON ?auto_94574 ?auto_94575 ) ( CLEAR ?auto_94571 ) ( ON ?auto_94572 ?auto_94574 ) ( CLEAR ?auto_94572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94577 ?auto_94576 ?auto_94573 ?auto_94575 ?auto_94574 )
      ( MAKE-3PILE ?auto_94570 ?auto_94571 ?auto_94572 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94578 - BLOCK
      ?auto_94579 - BLOCK
      ?auto_94580 - BLOCK
    )
    :vars
    (
      ?auto_94584 - BLOCK
      ?auto_94585 - BLOCK
      ?auto_94583 - BLOCK
      ?auto_94582 - BLOCK
      ?auto_94581 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94578 ) ( not ( = ?auto_94578 ?auto_94579 ) ) ( not ( = ?auto_94578 ?auto_94580 ) ) ( not ( = ?auto_94578 ?auto_94584 ) ) ( not ( = ?auto_94579 ?auto_94580 ) ) ( not ( = ?auto_94579 ?auto_94584 ) ) ( not ( = ?auto_94580 ?auto_94584 ) ) ( not ( = ?auto_94578 ?auto_94585 ) ) ( not ( = ?auto_94578 ?auto_94583 ) ) ( not ( = ?auto_94579 ?auto_94585 ) ) ( not ( = ?auto_94579 ?auto_94583 ) ) ( not ( = ?auto_94580 ?auto_94585 ) ) ( not ( = ?auto_94580 ?auto_94583 ) ) ( not ( = ?auto_94584 ?auto_94585 ) ) ( not ( = ?auto_94584 ?auto_94583 ) ) ( not ( = ?auto_94585 ?auto_94583 ) ) ( not ( = ?auto_94582 ?auto_94583 ) ) ( not ( = ?auto_94578 ?auto_94582 ) ) ( not ( = ?auto_94579 ?auto_94582 ) ) ( not ( = ?auto_94580 ?auto_94582 ) ) ( not ( = ?auto_94584 ?auto_94582 ) ) ( not ( = ?auto_94585 ?auto_94582 ) ) ( ON ?auto_94582 ?auto_94581 ) ( not ( = ?auto_94578 ?auto_94581 ) ) ( not ( = ?auto_94579 ?auto_94581 ) ) ( not ( = ?auto_94580 ?auto_94581 ) ) ( not ( = ?auto_94584 ?auto_94581 ) ) ( not ( = ?auto_94585 ?auto_94581 ) ) ( not ( = ?auto_94583 ?auto_94581 ) ) ( not ( = ?auto_94582 ?auto_94581 ) ) ( ON ?auto_94583 ?auto_94582 ) ( ON-TABLE ?auto_94581 ) ( ON ?auto_94585 ?auto_94583 ) ( ON ?auto_94584 ?auto_94585 ) ( ON ?auto_94580 ?auto_94584 ) ( CLEAR ?auto_94580 ) ( HOLDING ?auto_94579 ) ( CLEAR ?auto_94578 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94578 ?auto_94579 )
      ( MAKE-3PILE ?auto_94578 ?auto_94579 ?auto_94580 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94586 - BLOCK
      ?auto_94587 - BLOCK
      ?auto_94588 - BLOCK
    )
    :vars
    (
      ?auto_94591 - BLOCK
      ?auto_94593 - BLOCK
      ?auto_94589 - BLOCK
      ?auto_94592 - BLOCK
      ?auto_94590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94586 ) ( not ( = ?auto_94586 ?auto_94587 ) ) ( not ( = ?auto_94586 ?auto_94588 ) ) ( not ( = ?auto_94586 ?auto_94591 ) ) ( not ( = ?auto_94587 ?auto_94588 ) ) ( not ( = ?auto_94587 ?auto_94591 ) ) ( not ( = ?auto_94588 ?auto_94591 ) ) ( not ( = ?auto_94586 ?auto_94593 ) ) ( not ( = ?auto_94586 ?auto_94589 ) ) ( not ( = ?auto_94587 ?auto_94593 ) ) ( not ( = ?auto_94587 ?auto_94589 ) ) ( not ( = ?auto_94588 ?auto_94593 ) ) ( not ( = ?auto_94588 ?auto_94589 ) ) ( not ( = ?auto_94591 ?auto_94593 ) ) ( not ( = ?auto_94591 ?auto_94589 ) ) ( not ( = ?auto_94593 ?auto_94589 ) ) ( not ( = ?auto_94592 ?auto_94589 ) ) ( not ( = ?auto_94586 ?auto_94592 ) ) ( not ( = ?auto_94587 ?auto_94592 ) ) ( not ( = ?auto_94588 ?auto_94592 ) ) ( not ( = ?auto_94591 ?auto_94592 ) ) ( not ( = ?auto_94593 ?auto_94592 ) ) ( ON ?auto_94592 ?auto_94590 ) ( not ( = ?auto_94586 ?auto_94590 ) ) ( not ( = ?auto_94587 ?auto_94590 ) ) ( not ( = ?auto_94588 ?auto_94590 ) ) ( not ( = ?auto_94591 ?auto_94590 ) ) ( not ( = ?auto_94593 ?auto_94590 ) ) ( not ( = ?auto_94589 ?auto_94590 ) ) ( not ( = ?auto_94592 ?auto_94590 ) ) ( ON ?auto_94589 ?auto_94592 ) ( ON-TABLE ?auto_94590 ) ( ON ?auto_94593 ?auto_94589 ) ( ON ?auto_94591 ?auto_94593 ) ( ON ?auto_94588 ?auto_94591 ) ( CLEAR ?auto_94586 ) ( ON ?auto_94587 ?auto_94588 ) ( CLEAR ?auto_94587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94590 ?auto_94592 ?auto_94589 ?auto_94593 ?auto_94591 ?auto_94588 )
      ( MAKE-3PILE ?auto_94586 ?auto_94587 ?auto_94588 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94594 - BLOCK
      ?auto_94595 - BLOCK
      ?auto_94596 - BLOCK
    )
    :vars
    (
      ?auto_94601 - BLOCK
      ?auto_94599 - BLOCK
      ?auto_94598 - BLOCK
      ?auto_94597 - BLOCK
      ?auto_94600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94594 ?auto_94595 ) ) ( not ( = ?auto_94594 ?auto_94596 ) ) ( not ( = ?auto_94594 ?auto_94601 ) ) ( not ( = ?auto_94595 ?auto_94596 ) ) ( not ( = ?auto_94595 ?auto_94601 ) ) ( not ( = ?auto_94596 ?auto_94601 ) ) ( not ( = ?auto_94594 ?auto_94599 ) ) ( not ( = ?auto_94594 ?auto_94598 ) ) ( not ( = ?auto_94595 ?auto_94599 ) ) ( not ( = ?auto_94595 ?auto_94598 ) ) ( not ( = ?auto_94596 ?auto_94599 ) ) ( not ( = ?auto_94596 ?auto_94598 ) ) ( not ( = ?auto_94601 ?auto_94599 ) ) ( not ( = ?auto_94601 ?auto_94598 ) ) ( not ( = ?auto_94599 ?auto_94598 ) ) ( not ( = ?auto_94597 ?auto_94598 ) ) ( not ( = ?auto_94594 ?auto_94597 ) ) ( not ( = ?auto_94595 ?auto_94597 ) ) ( not ( = ?auto_94596 ?auto_94597 ) ) ( not ( = ?auto_94601 ?auto_94597 ) ) ( not ( = ?auto_94599 ?auto_94597 ) ) ( ON ?auto_94597 ?auto_94600 ) ( not ( = ?auto_94594 ?auto_94600 ) ) ( not ( = ?auto_94595 ?auto_94600 ) ) ( not ( = ?auto_94596 ?auto_94600 ) ) ( not ( = ?auto_94601 ?auto_94600 ) ) ( not ( = ?auto_94599 ?auto_94600 ) ) ( not ( = ?auto_94598 ?auto_94600 ) ) ( not ( = ?auto_94597 ?auto_94600 ) ) ( ON ?auto_94598 ?auto_94597 ) ( ON-TABLE ?auto_94600 ) ( ON ?auto_94599 ?auto_94598 ) ( ON ?auto_94601 ?auto_94599 ) ( ON ?auto_94596 ?auto_94601 ) ( ON ?auto_94595 ?auto_94596 ) ( CLEAR ?auto_94595 ) ( HOLDING ?auto_94594 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94594 )
      ( MAKE-3PILE ?auto_94594 ?auto_94595 ?auto_94596 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94602 - BLOCK
      ?auto_94603 - BLOCK
      ?auto_94604 - BLOCK
    )
    :vars
    (
      ?auto_94606 - BLOCK
      ?auto_94609 - BLOCK
      ?auto_94608 - BLOCK
      ?auto_94607 - BLOCK
      ?auto_94605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94602 ?auto_94603 ) ) ( not ( = ?auto_94602 ?auto_94604 ) ) ( not ( = ?auto_94602 ?auto_94606 ) ) ( not ( = ?auto_94603 ?auto_94604 ) ) ( not ( = ?auto_94603 ?auto_94606 ) ) ( not ( = ?auto_94604 ?auto_94606 ) ) ( not ( = ?auto_94602 ?auto_94609 ) ) ( not ( = ?auto_94602 ?auto_94608 ) ) ( not ( = ?auto_94603 ?auto_94609 ) ) ( not ( = ?auto_94603 ?auto_94608 ) ) ( not ( = ?auto_94604 ?auto_94609 ) ) ( not ( = ?auto_94604 ?auto_94608 ) ) ( not ( = ?auto_94606 ?auto_94609 ) ) ( not ( = ?auto_94606 ?auto_94608 ) ) ( not ( = ?auto_94609 ?auto_94608 ) ) ( not ( = ?auto_94607 ?auto_94608 ) ) ( not ( = ?auto_94602 ?auto_94607 ) ) ( not ( = ?auto_94603 ?auto_94607 ) ) ( not ( = ?auto_94604 ?auto_94607 ) ) ( not ( = ?auto_94606 ?auto_94607 ) ) ( not ( = ?auto_94609 ?auto_94607 ) ) ( ON ?auto_94607 ?auto_94605 ) ( not ( = ?auto_94602 ?auto_94605 ) ) ( not ( = ?auto_94603 ?auto_94605 ) ) ( not ( = ?auto_94604 ?auto_94605 ) ) ( not ( = ?auto_94606 ?auto_94605 ) ) ( not ( = ?auto_94609 ?auto_94605 ) ) ( not ( = ?auto_94608 ?auto_94605 ) ) ( not ( = ?auto_94607 ?auto_94605 ) ) ( ON ?auto_94608 ?auto_94607 ) ( ON-TABLE ?auto_94605 ) ( ON ?auto_94609 ?auto_94608 ) ( ON ?auto_94606 ?auto_94609 ) ( ON ?auto_94604 ?auto_94606 ) ( ON ?auto_94603 ?auto_94604 ) ( ON ?auto_94602 ?auto_94603 ) ( CLEAR ?auto_94602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94605 ?auto_94607 ?auto_94608 ?auto_94609 ?auto_94606 ?auto_94604 ?auto_94603 )
      ( MAKE-3PILE ?auto_94602 ?auto_94603 ?auto_94604 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94614 - BLOCK
      ?auto_94615 - BLOCK
      ?auto_94616 - BLOCK
      ?auto_94617 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_94617 ) ( CLEAR ?auto_94616 ) ( ON-TABLE ?auto_94614 ) ( ON ?auto_94615 ?auto_94614 ) ( ON ?auto_94616 ?auto_94615 ) ( not ( = ?auto_94614 ?auto_94615 ) ) ( not ( = ?auto_94614 ?auto_94616 ) ) ( not ( = ?auto_94614 ?auto_94617 ) ) ( not ( = ?auto_94615 ?auto_94616 ) ) ( not ( = ?auto_94615 ?auto_94617 ) ) ( not ( = ?auto_94616 ?auto_94617 ) ) )
    :subtasks
    ( ( !STACK ?auto_94617 ?auto_94616 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94618 - BLOCK
      ?auto_94619 - BLOCK
      ?auto_94620 - BLOCK
      ?auto_94621 - BLOCK
    )
    :vars
    (
      ?auto_94622 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_94620 ) ( ON-TABLE ?auto_94618 ) ( ON ?auto_94619 ?auto_94618 ) ( ON ?auto_94620 ?auto_94619 ) ( not ( = ?auto_94618 ?auto_94619 ) ) ( not ( = ?auto_94618 ?auto_94620 ) ) ( not ( = ?auto_94618 ?auto_94621 ) ) ( not ( = ?auto_94619 ?auto_94620 ) ) ( not ( = ?auto_94619 ?auto_94621 ) ) ( not ( = ?auto_94620 ?auto_94621 ) ) ( ON ?auto_94621 ?auto_94622 ) ( CLEAR ?auto_94621 ) ( HAND-EMPTY ) ( not ( = ?auto_94618 ?auto_94622 ) ) ( not ( = ?auto_94619 ?auto_94622 ) ) ( not ( = ?auto_94620 ?auto_94622 ) ) ( not ( = ?auto_94621 ?auto_94622 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94621 ?auto_94622 )
      ( MAKE-4PILE ?auto_94618 ?auto_94619 ?auto_94620 ?auto_94621 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94623 - BLOCK
      ?auto_94624 - BLOCK
      ?auto_94625 - BLOCK
      ?auto_94626 - BLOCK
    )
    :vars
    (
      ?auto_94627 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94623 ) ( ON ?auto_94624 ?auto_94623 ) ( not ( = ?auto_94623 ?auto_94624 ) ) ( not ( = ?auto_94623 ?auto_94625 ) ) ( not ( = ?auto_94623 ?auto_94626 ) ) ( not ( = ?auto_94624 ?auto_94625 ) ) ( not ( = ?auto_94624 ?auto_94626 ) ) ( not ( = ?auto_94625 ?auto_94626 ) ) ( ON ?auto_94626 ?auto_94627 ) ( CLEAR ?auto_94626 ) ( not ( = ?auto_94623 ?auto_94627 ) ) ( not ( = ?auto_94624 ?auto_94627 ) ) ( not ( = ?auto_94625 ?auto_94627 ) ) ( not ( = ?auto_94626 ?auto_94627 ) ) ( HOLDING ?auto_94625 ) ( CLEAR ?auto_94624 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94623 ?auto_94624 ?auto_94625 )
      ( MAKE-4PILE ?auto_94623 ?auto_94624 ?auto_94625 ?auto_94626 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94628 - BLOCK
      ?auto_94629 - BLOCK
      ?auto_94630 - BLOCK
      ?auto_94631 - BLOCK
    )
    :vars
    (
      ?auto_94632 - BLOCK
      ?auto_94634 - BLOCK
      ?auto_94633 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94628 ) ( ON ?auto_94629 ?auto_94628 ) ( not ( = ?auto_94628 ?auto_94629 ) ) ( not ( = ?auto_94628 ?auto_94630 ) ) ( not ( = ?auto_94628 ?auto_94631 ) ) ( not ( = ?auto_94629 ?auto_94630 ) ) ( not ( = ?auto_94629 ?auto_94631 ) ) ( not ( = ?auto_94630 ?auto_94631 ) ) ( ON ?auto_94631 ?auto_94632 ) ( not ( = ?auto_94628 ?auto_94632 ) ) ( not ( = ?auto_94629 ?auto_94632 ) ) ( not ( = ?auto_94630 ?auto_94632 ) ) ( not ( = ?auto_94631 ?auto_94632 ) ) ( CLEAR ?auto_94629 ) ( ON ?auto_94630 ?auto_94631 ) ( CLEAR ?auto_94630 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94634 ) ( ON ?auto_94633 ?auto_94634 ) ( ON ?auto_94632 ?auto_94633 ) ( not ( = ?auto_94634 ?auto_94633 ) ) ( not ( = ?auto_94634 ?auto_94632 ) ) ( not ( = ?auto_94634 ?auto_94631 ) ) ( not ( = ?auto_94634 ?auto_94630 ) ) ( not ( = ?auto_94633 ?auto_94632 ) ) ( not ( = ?auto_94633 ?auto_94631 ) ) ( not ( = ?auto_94633 ?auto_94630 ) ) ( not ( = ?auto_94628 ?auto_94634 ) ) ( not ( = ?auto_94628 ?auto_94633 ) ) ( not ( = ?auto_94629 ?auto_94634 ) ) ( not ( = ?auto_94629 ?auto_94633 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94634 ?auto_94633 ?auto_94632 ?auto_94631 )
      ( MAKE-4PILE ?auto_94628 ?auto_94629 ?auto_94630 ?auto_94631 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94635 - BLOCK
      ?auto_94636 - BLOCK
      ?auto_94637 - BLOCK
      ?auto_94638 - BLOCK
    )
    :vars
    (
      ?auto_94639 - BLOCK
      ?auto_94640 - BLOCK
      ?auto_94641 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94635 ) ( not ( = ?auto_94635 ?auto_94636 ) ) ( not ( = ?auto_94635 ?auto_94637 ) ) ( not ( = ?auto_94635 ?auto_94638 ) ) ( not ( = ?auto_94636 ?auto_94637 ) ) ( not ( = ?auto_94636 ?auto_94638 ) ) ( not ( = ?auto_94637 ?auto_94638 ) ) ( ON ?auto_94638 ?auto_94639 ) ( not ( = ?auto_94635 ?auto_94639 ) ) ( not ( = ?auto_94636 ?auto_94639 ) ) ( not ( = ?auto_94637 ?auto_94639 ) ) ( not ( = ?auto_94638 ?auto_94639 ) ) ( ON ?auto_94637 ?auto_94638 ) ( CLEAR ?auto_94637 ) ( ON-TABLE ?auto_94640 ) ( ON ?auto_94641 ?auto_94640 ) ( ON ?auto_94639 ?auto_94641 ) ( not ( = ?auto_94640 ?auto_94641 ) ) ( not ( = ?auto_94640 ?auto_94639 ) ) ( not ( = ?auto_94640 ?auto_94638 ) ) ( not ( = ?auto_94640 ?auto_94637 ) ) ( not ( = ?auto_94641 ?auto_94639 ) ) ( not ( = ?auto_94641 ?auto_94638 ) ) ( not ( = ?auto_94641 ?auto_94637 ) ) ( not ( = ?auto_94635 ?auto_94640 ) ) ( not ( = ?auto_94635 ?auto_94641 ) ) ( not ( = ?auto_94636 ?auto_94640 ) ) ( not ( = ?auto_94636 ?auto_94641 ) ) ( HOLDING ?auto_94636 ) ( CLEAR ?auto_94635 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94635 ?auto_94636 )
      ( MAKE-4PILE ?auto_94635 ?auto_94636 ?auto_94637 ?auto_94638 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94642 - BLOCK
      ?auto_94643 - BLOCK
      ?auto_94644 - BLOCK
      ?auto_94645 - BLOCK
    )
    :vars
    (
      ?auto_94646 - BLOCK
      ?auto_94647 - BLOCK
      ?auto_94648 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94642 ) ( not ( = ?auto_94642 ?auto_94643 ) ) ( not ( = ?auto_94642 ?auto_94644 ) ) ( not ( = ?auto_94642 ?auto_94645 ) ) ( not ( = ?auto_94643 ?auto_94644 ) ) ( not ( = ?auto_94643 ?auto_94645 ) ) ( not ( = ?auto_94644 ?auto_94645 ) ) ( ON ?auto_94645 ?auto_94646 ) ( not ( = ?auto_94642 ?auto_94646 ) ) ( not ( = ?auto_94643 ?auto_94646 ) ) ( not ( = ?auto_94644 ?auto_94646 ) ) ( not ( = ?auto_94645 ?auto_94646 ) ) ( ON ?auto_94644 ?auto_94645 ) ( ON-TABLE ?auto_94647 ) ( ON ?auto_94648 ?auto_94647 ) ( ON ?auto_94646 ?auto_94648 ) ( not ( = ?auto_94647 ?auto_94648 ) ) ( not ( = ?auto_94647 ?auto_94646 ) ) ( not ( = ?auto_94647 ?auto_94645 ) ) ( not ( = ?auto_94647 ?auto_94644 ) ) ( not ( = ?auto_94648 ?auto_94646 ) ) ( not ( = ?auto_94648 ?auto_94645 ) ) ( not ( = ?auto_94648 ?auto_94644 ) ) ( not ( = ?auto_94642 ?auto_94647 ) ) ( not ( = ?auto_94642 ?auto_94648 ) ) ( not ( = ?auto_94643 ?auto_94647 ) ) ( not ( = ?auto_94643 ?auto_94648 ) ) ( CLEAR ?auto_94642 ) ( ON ?auto_94643 ?auto_94644 ) ( CLEAR ?auto_94643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94647 ?auto_94648 ?auto_94646 ?auto_94645 ?auto_94644 )
      ( MAKE-4PILE ?auto_94642 ?auto_94643 ?auto_94644 ?auto_94645 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94649 - BLOCK
      ?auto_94650 - BLOCK
      ?auto_94651 - BLOCK
      ?auto_94652 - BLOCK
    )
    :vars
    (
      ?auto_94655 - BLOCK
      ?auto_94654 - BLOCK
      ?auto_94653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94649 ?auto_94650 ) ) ( not ( = ?auto_94649 ?auto_94651 ) ) ( not ( = ?auto_94649 ?auto_94652 ) ) ( not ( = ?auto_94650 ?auto_94651 ) ) ( not ( = ?auto_94650 ?auto_94652 ) ) ( not ( = ?auto_94651 ?auto_94652 ) ) ( ON ?auto_94652 ?auto_94655 ) ( not ( = ?auto_94649 ?auto_94655 ) ) ( not ( = ?auto_94650 ?auto_94655 ) ) ( not ( = ?auto_94651 ?auto_94655 ) ) ( not ( = ?auto_94652 ?auto_94655 ) ) ( ON ?auto_94651 ?auto_94652 ) ( ON-TABLE ?auto_94654 ) ( ON ?auto_94653 ?auto_94654 ) ( ON ?auto_94655 ?auto_94653 ) ( not ( = ?auto_94654 ?auto_94653 ) ) ( not ( = ?auto_94654 ?auto_94655 ) ) ( not ( = ?auto_94654 ?auto_94652 ) ) ( not ( = ?auto_94654 ?auto_94651 ) ) ( not ( = ?auto_94653 ?auto_94655 ) ) ( not ( = ?auto_94653 ?auto_94652 ) ) ( not ( = ?auto_94653 ?auto_94651 ) ) ( not ( = ?auto_94649 ?auto_94654 ) ) ( not ( = ?auto_94649 ?auto_94653 ) ) ( not ( = ?auto_94650 ?auto_94654 ) ) ( not ( = ?auto_94650 ?auto_94653 ) ) ( ON ?auto_94650 ?auto_94651 ) ( CLEAR ?auto_94650 ) ( HOLDING ?auto_94649 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94649 )
      ( MAKE-4PILE ?auto_94649 ?auto_94650 ?auto_94651 ?auto_94652 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94656 - BLOCK
      ?auto_94657 - BLOCK
      ?auto_94658 - BLOCK
      ?auto_94659 - BLOCK
    )
    :vars
    (
      ?auto_94661 - BLOCK
      ?auto_94662 - BLOCK
      ?auto_94660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94656 ?auto_94657 ) ) ( not ( = ?auto_94656 ?auto_94658 ) ) ( not ( = ?auto_94656 ?auto_94659 ) ) ( not ( = ?auto_94657 ?auto_94658 ) ) ( not ( = ?auto_94657 ?auto_94659 ) ) ( not ( = ?auto_94658 ?auto_94659 ) ) ( ON ?auto_94659 ?auto_94661 ) ( not ( = ?auto_94656 ?auto_94661 ) ) ( not ( = ?auto_94657 ?auto_94661 ) ) ( not ( = ?auto_94658 ?auto_94661 ) ) ( not ( = ?auto_94659 ?auto_94661 ) ) ( ON ?auto_94658 ?auto_94659 ) ( ON-TABLE ?auto_94662 ) ( ON ?auto_94660 ?auto_94662 ) ( ON ?auto_94661 ?auto_94660 ) ( not ( = ?auto_94662 ?auto_94660 ) ) ( not ( = ?auto_94662 ?auto_94661 ) ) ( not ( = ?auto_94662 ?auto_94659 ) ) ( not ( = ?auto_94662 ?auto_94658 ) ) ( not ( = ?auto_94660 ?auto_94661 ) ) ( not ( = ?auto_94660 ?auto_94659 ) ) ( not ( = ?auto_94660 ?auto_94658 ) ) ( not ( = ?auto_94656 ?auto_94662 ) ) ( not ( = ?auto_94656 ?auto_94660 ) ) ( not ( = ?auto_94657 ?auto_94662 ) ) ( not ( = ?auto_94657 ?auto_94660 ) ) ( ON ?auto_94657 ?auto_94658 ) ( ON ?auto_94656 ?auto_94657 ) ( CLEAR ?auto_94656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94662 ?auto_94660 ?auto_94661 ?auto_94659 ?auto_94658 ?auto_94657 )
      ( MAKE-4PILE ?auto_94656 ?auto_94657 ?auto_94658 ?auto_94659 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94663 - BLOCK
      ?auto_94664 - BLOCK
      ?auto_94665 - BLOCK
      ?auto_94666 - BLOCK
    )
    :vars
    (
      ?auto_94669 - BLOCK
      ?auto_94667 - BLOCK
      ?auto_94668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94663 ?auto_94664 ) ) ( not ( = ?auto_94663 ?auto_94665 ) ) ( not ( = ?auto_94663 ?auto_94666 ) ) ( not ( = ?auto_94664 ?auto_94665 ) ) ( not ( = ?auto_94664 ?auto_94666 ) ) ( not ( = ?auto_94665 ?auto_94666 ) ) ( ON ?auto_94666 ?auto_94669 ) ( not ( = ?auto_94663 ?auto_94669 ) ) ( not ( = ?auto_94664 ?auto_94669 ) ) ( not ( = ?auto_94665 ?auto_94669 ) ) ( not ( = ?auto_94666 ?auto_94669 ) ) ( ON ?auto_94665 ?auto_94666 ) ( ON-TABLE ?auto_94667 ) ( ON ?auto_94668 ?auto_94667 ) ( ON ?auto_94669 ?auto_94668 ) ( not ( = ?auto_94667 ?auto_94668 ) ) ( not ( = ?auto_94667 ?auto_94669 ) ) ( not ( = ?auto_94667 ?auto_94666 ) ) ( not ( = ?auto_94667 ?auto_94665 ) ) ( not ( = ?auto_94668 ?auto_94669 ) ) ( not ( = ?auto_94668 ?auto_94666 ) ) ( not ( = ?auto_94668 ?auto_94665 ) ) ( not ( = ?auto_94663 ?auto_94667 ) ) ( not ( = ?auto_94663 ?auto_94668 ) ) ( not ( = ?auto_94664 ?auto_94667 ) ) ( not ( = ?auto_94664 ?auto_94668 ) ) ( ON ?auto_94664 ?auto_94665 ) ( HOLDING ?auto_94663 ) ( CLEAR ?auto_94664 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94667 ?auto_94668 ?auto_94669 ?auto_94666 ?auto_94665 ?auto_94664 ?auto_94663 )
      ( MAKE-4PILE ?auto_94663 ?auto_94664 ?auto_94665 ?auto_94666 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94670 - BLOCK
      ?auto_94671 - BLOCK
      ?auto_94672 - BLOCK
      ?auto_94673 - BLOCK
    )
    :vars
    (
      ?auto_94675 - BLOCK
      ?auto_94676 - BLOCK
      ?auto_94674 - BLOCK
      ?auto_94677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94670 ?auto_94671 ) ) ( not ( = ?auto_94670 ?auto_94672 ) ) ( not ( = ?auto_94670 ?auto_94673 ) ) ( not ( = ?auto_94671 ?auto_94672 ) ) ( not ( = ?auto_94671 ?auto_94673 ) ) ( not ( = ?auto_94672 ?auto_94673 ) ) ( ON ?auto_94673 ?auto_94675 ) ( not ( = ?auto_94670 ?auto_94675 ) ) ( not ( = ?auto_94671 ?auto_94675 ) ) ( not ( = ?auto_94672 ?auto_94675 ) ) ( not ( = ?auto_94673 ?auto_94675 ) ) ( ON ?auto_94672 ?auto_94673 ) ( ON-TABLE ?auto_94676 ) ( ON ?auto_94674 ?auto_94676 ) ( ON ?auto_94675 ?auto_94674 ) ( not ( = ?auto_94676 ?auto_94674 ) ) ( not ( = ?auto_94676 ?auto_94675 ) ) ( not ( = ?auto_94676 ?auto_94673 ) ) ( not ( = ?auto_94676 ?auto_94672 ) ) ( not ( = ?auto_94674 ?auto_94675 ) ) ( not ( = ?auto_94674 ?auto_94673 ) ) ( not ( = ?auto_94674 ?auto_94672 ) ) ( not ( = ?auto_94670 ?auto_94676 ) ) ( not ( = ?auto_94670 ?auto_94674 ) ) ( not ( = ?auto_94671 ?auto_94676 ) ) ( not ( = ?auto_94671 ?auto_94674 ) ) ( ON ?auto_94671 ?auto_94672 ) ( CLEAR ?auto_94671 ) ( ON ?auto_94670 ?auto_94677 ) ( CLEAR ?auto_94670 ) ( HAND-EMPTY ) ( not ( = ?auto_94670 ?auto_94677 ) ) ( not ( = ?auto_94671 ?auto_94677 ) ) ( not ( = ?auto_94672 ?auto_94677 ) ) ( not ( = ?auto_94673 ?auto_94677 ) ) ( not ( = ?auto_94675 ?auto_94677 ) ) ( not ( = ?auto_94676 ?auto_94677 ) ) ( not ( = ?auto_94674 ?auto_94677 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94670 ?auto_94677 )
      ( MAKE-4PILE ?auto_94670 ?auto_94671 ?auto_94672 ?auto_94673 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94678 - BLOCK
      ?auto_94679 - BLOCK
      ?auto_94680 - BLOCK
      ?auto_94681 - BLOCK
    )
    :vars
    (
      ?auto_94683 - BLOCK
      ?auto_94685 - BLOCK
      ?auto_94684 - BLOCK
      ?auto_94682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94678 ?auto_94679 ) ) ( not ( = ?auto_94678 ?auto_94680 ) ) ( not ( = ?auto_94678 ?auto_94681 ) ) ( not ( = ?auto_94679 ?auto_94680 ) ) ( not ( = ?auto_94679 ?auto_94681 ) ) ( not ( = ?auto_94680 ?auto_94681 ) ) ( ON ?auto_94681 ?auto_94683 ) ( not ( = ?auto_94678 ?auto_94683 ) ) ( not ( = ?auto_94679 ?auto_94683 ) ) ( not ( = ?auto_94680 ?auto_94683 ) ) ( not ( = ?auto_94681 ?auto_94683 ) ) ( ON ?auto_94680 ?auto_94681 ) ( ON-TABLE ?auto_94685 ) ( ON ?auto_94684 ?auto_94685 ) ( ON ?auto_94683 ?auto_94684 ) ( not ( = ?auto_94685 ?auto_94684 ) ) ( not ( = ?auto_94685 ?auto_94683 ) ) ( not ( = ?auto_94685 ?auto_94681 ) ) ( not ( = ?auto_94685 ?auto_94680 ) ) ( not ( = ?auto_94684 ?auto_94683 ) ) ( not ( = ?auto_94684 ?auto_94681 ) ) ( not ( = ?auto_94684 ?auto_94680 ) ) ( not ( = ?auto_94678 ?auto_94685 ) ) ( not ( = ?auto_94678 ?auto_94684 ) ) ( not ( = ?auto_94679 ?auto_94685 ) ) ( not ( = ?auto_94679 ?auto_94684 ) ) ( ON ?auto_94678 ?auto_94682 ) ( CLEAR ?auto_94678 ) ( not ( = ?auto_94678 ?auto_94682 ) ) ( not ( = ?auto_94679 ?auto_94682 ) ) ( not ( = ?auto_94680 ?auto_94682 ) ) ( not ( = ?auto_94681 ?auto_94682 ) ) ( not ( = ?auto_94683 ?auto_94682 ) ) ( not ( = ?auto_94685 ?auto_94682 ) ) ( not ( = ?auto_94684 ?auto_94682 ) ) ( HOLDING ?auto_94679 ) ( CLEAR ?auto_94680 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94685 ?auto_94684 ?auto_94683 ?auto_94681 ?auto_94680 ?auto_94679 )
      ( MAKE-4PILE ?auto_94678 ?auto_94679 ?auto_94680 ?auto_94681 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94686 - BLOCK
      ?auto_94687 - BLOCK
      ?auto_94688 - BLOCK
      ?auto_94689 - BLOCK
    )
    :vars
    (
      ?auto_94690 - BLOCK
      ?auto_94692 - BLOCK
      ?auto_94691 - BLOCK
      ?auto_94693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94686 ?auto_94687 ) ) ( not ( = ?auto_94686 ?auto_94688 ) ) ( not ( = ?auto_94686 ?auto_94689 ) ) ( not ( = ?auto_94687 ?auto_94688 ) ) ( not ( = ?auto_94687 ?auto_94689 ) ) ( not ( = ?auto_94688 ?auto_94689 ) ) ( ON ?auto_94689 ?auto_94690 ) ( not ( = ?auto_94686 ?auto_94690 ) ) ( not ( = ?auto_94687 ?auto_94690 ) ) ( not ( = ?auto_94688 ?auto_94690 ) ) ( not ( = ?auto_94689 ?auto_94690 ) ) ( ON ?auto_94688 ?auto_94689 ) ( ON-TABLE ?auto_94692 ) ( ON ?auto_94691 ?auto_94692 ) ( ON ?auto_94690 ?auto_94691 ) ( not ( = ?auto_94692 ?auto_94691 ) ) ( not ( = ?auto_94692 ?auto_94690 ) ) ( not ( = ?auto_94692 ?auto_94689 ) ) ( not ( = ?auto_94692 ?auto_94688 ) ) ( not ( = ?auto_94691 ?auto_94690 ) ) ( not ( = ?auto_94691 ?auto_94689 ) ) ( not ( = ?auto_94691 ?auto_94688 ) ) ( not ( = ?auto_94686 ?auto_94692 ) ) ( not ( = ?auto_94686 ?auto_94691 ) ) ( not ( = ?auto_94687 ?auto_94692 ) ) ( not ( = ?auto_94687 ?auto_94691 ) ) ( ON ?auto_94686 ?auto_94693 ) ( not ( = ?auto_94686 ?auto_94693 ) ) ( not ( = ?auto_94687 ?auto_94693 ) ) ( not ( = ?auto_94688 ?auto_94693 ) ) ( not ( = ?auto_94689 ?auto_94693 ) ) ( not ( = ?auto_94690 ?auto_94693 ) ) ( not ( = ?auto_94692 ?auto_94693 ) ) ( not ( = ?auto_94691 ?auto_94693 ) ) ( CLEAR ?auto_94688 ) ( ON ?auto_94687 ?auto_94686 ) ( CLEAR ?auto_94687 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94693 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94693 ?auto_94686 )
      ( MAKE-4PILE ?auto_94686 ?auto_94687 ?auto_94688 ?auto_94689 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94694 - BLOCK
      ?auto_94695 - BLOCK
      ?auto_94696 - BLOCK
      ?auto_94697 - BLOCK
    )
    :vars
    (
      ?auto_94699 - BLOCK
      ?auto_94700 - BLOCK
      ?auto_94701 - BLOCK
      ?auto_94698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94694 ?auto_94695 ) ) ( not ( = ?auto_94694 ?auto_94696 ) ) ( not ( = ?auto_94694 ?auto_94697 ) ) ( not ( = ?auto_94695 ?auto_94696 ) ) ( not ( = ?auto_94695 ?auto_94697 ) ) ( not ( = ?auto_94696 ?auto_94697 ) ) ( ON ?auto_94697 ?auto_94699 ) ( not ( = ?auto_94694 ?auto_94699 ) ) ( not ( = ?auto_94695 ?auto_94699 ) ) ( not ( = ?auto_94696 ?auto_94699 ) ) ( not ( = ?auto_94697 ?auto_94699 ) ) ( ON-TABLE ?auto_94700 ) ( ON ?auto_94701 ?auto_94700 ) ( ON ?auto_94699 ?auto_94701 ) ( not ( = ?auto_94700 ?auto_94701 ) ) ( not ( = ?auto_94700 ?auto_94699 ) ) ( not ( = ?auto_94700 ?auto_94697 ) ) ( not ( = ?auto_94700 ?auto_94696 ) ) ( not ( = ?auto_94701 ?auto_94699 ) ) ( not ( = ?auto_94701 ?auto_94697 ) ) ( not ( = ?auto_94701 ?auto_94696 ) ) ( not ( = ?auto_94694 ?auto_94700 ) ) ( not ( = ?auto_94694 ?auto_94701 ) ) ( not ( = ?auto_94695 ?auto_94700 ) ) ( not ( = ?auto_94695 ?auto_94701 ) ) ( ON ?auto_94694 ?auto_94698 ) ( not ( = ?auto_94694 ?auto_94698 ) ) ( not ( = ?auto_94695 ?auto_94698 ) ) ( not ( = ?auto_94696 ?auto_94698 ) ) ( not ( = ?auto_94697 ?auto_94698 ) ) ( not ( = ?auto_94699 ?auto_94698 ) ) ( not ( = ?auto_94700 ?auto_94698 ) ) ( not ( = ?auto_94701 ?auto_94698 ) ) ( ON ?auto_94695 ?auto_94694 ) ( CLEAR ?auto_94695 ) ( ON-TABLE ?auto_94698 ) ( HOLDING ?auto_94696 ) ( CLEAR ?auto_94697 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94700 ?auto_94701 ?auto_94699 ?auto_94697 ?auto_94696 )
      ( MAKE-4PILE ?auto_94694 ?auto_94695 ?auto_94696 ?auto_94697 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94702 - BLOCK
      ?auto_94703 - BLOCK
      ?auto_94704 - BLOCK
      ?auto_94705 - BLOCK
    )
    :vars
    (
      ?auto_94706 - BLOCK
      ?auto_94708 - BLOCK
      ?auto_94707 - BLOCK
      ?auto_94709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94702 ?auto_94703 ) ) ( not ( = ?auto_94702 ?auto_94704 ) ) ( not ( = ?auto_94702 ?auto_94705 ) ) ( not ( = ?auto_94703 ?auto_94704 ) ) ( not ( = ?auto_94703 ?auto_94705 ) ) ( not ( = ?auto_94704 ?auto_94705 ) ) ( ON ?auto_94705 ?auto_94706 ) ( not ( = ?auto_94702 ?auto_94706 ) ) ( not ( = ?auto_94703 ?auto_94706 ) ) ( not ( = ?auto_94704 ?auto_94706 ) ) ( not ( = ?auto_94705 ?auto_94706 ) ) ( ON-TABLE ?auto_94708 ) ( ON ?auto_94707 ?auto_94708 ) ( ON ?auto_94706 ?auto_94707 ) ( not ( = ?auto_94708 ?auto_94707 ) ) ( not ( = ?auto_94708 ?auto_94706 ) ) ( not ( = ?auto_94708 ?auto_94705 ) ) ( not ( = ?auto_94708 ?auto_94704 ) ) ( not ( = ?auto_94707 ?auto_94706 ) ) ( not ( = ?auto_94707 ?auto_94705 ) ) ( not ( = ?auto_94707 ?auto_94704 ) ) ( not ( = ?auto_94702 ?auto_94708 ) ) ( not ( = ?auto_94702 ?auto_94707 ) ) ( not ( = ?auto_94703 ?auto_94708 ) ) ( not ( = ?auto_94703 ?auto_94707 ) ) ( ON ?auto_94702 ?auto_94709 ) ( not ( = ?auto_94702 ?auto_94709 ) ) ( not ( = ?auto_94703 ?auto_94709 ) ) ( not ( = ?auto_94704 ?auto_94709 ) ) ( not ( = ?auto_94705 ?auto_94709 ) ) ( not ( = ?auto_94706 ?auto_94709 ) ) ( not ( = ?auto_94708 ?auto_94709 ) ) ( not ( = ?auto_94707 ?auto_94709 ) ) ( ON ?auto_94703 ?auto_94702 ) ( ON-TABLE ?auto_94709 ) ( CLEAR ?auto_94705 ) ( ON ?auto_94704 ?auto_94703 ) ( CLEAR ?auto_94704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94709 ?auto_94702 ?auto_94703 )
      ( MAKE-4PILE ?auto_94702 ?auto_94703 ?auto_94704 ?auto_94705 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94710 - BLOCK
      ?auto_94711 - BLOCK
      ?auto_94712 - BLOCK
      ?auto_94713 - BLOCK
    )
    :vars
    (
      ?auto_94715 - BLOCK
      ?auto_94716 - BLOCK
      ?auto_94717 - BLOCK
      ?auto_94714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94710 ?auto_94711 ) ) ( not ( = ?auto_94710 ?auto_94712 ) ) ( not ( = ?auto_94710 ?auto_94713 ) ) ( not ( = ?auto_94711 ?auto_94712 ) ) ( not ( = ?auto_94711 ?auto_94713 ) ) ( not ( = ?auto_94712 ?auto_94713 ) ) ( not ( = ?auto_94710 ?auto_94715 ) ) ( not ( = ?auto_94711 ?auto_94715 ) ) ( not ( = ?auto_94712 ?auto_94715 ) ) ( not ( = ?auto_94713 ?auto_94715 ) ) ( ON-TABLE ?auto_94716 ) ( ON ?auto_94717 ?auto_94716 ) ( ON ?auto_94715 ?auto_94717 ) ( not ( = ?auto_94716 ?auto_94717 ) ) ( not ( = ?auto_94716 ?auto_94715 ) ) ( not ( = ?auto_94716 ?auto_94713 ) ) ( not ( = ?auto_94716 ?auto_94712 ) ) ( not ( = ?auto_94717 ?auto_94715 ) ) ( not ( = ?auto_94717 ?auto_94713 ) ) ( not ( = ?auto_94717 ?auto_94712 ) ) ( not ( = ?auto_94710 ?auto_94716 ) ) ( not ( = ?auto_94710 ?auto_94717 ) ) ( not ( = ?auto_94711 ?auto_94716 ) ) ( not ( = ?auto_94711 ?auto_94717 ) ) ( ON ?auto_94710 ?auto_94714 ) ( not ( = ?auto_94710 ?auto_94714 ) ) ( not ( = ?auto_94711 ?auto_94714 ) ) ( not ( = ?auto_94712 ?auto_94714 ) ) ( not ( = ?auto_94713 ?auto_94714 ) ) ( not ( = ?auto_94715 ?auto_94714 ) ) ( not ( = ?auto_94716 ?auto_94714 ) ) ( not ( = ?auto_94717 ?auto_94714 ) ) ( ON ?auto_94711 ?auto_94710 ) ( ON-TABLE ?auto_94714 ) ( ON ?auto_94712 ?auto_94711 ) ( CLEAR ?auto_94712 ) ( HOLDING ?auto_94713 ) ( CLEAR ?auto_94715 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94716 ?auto_94717 ?auto_94715 ?auto_94713 )
      ( MAKE-4PILE ?auto_94710 ?auto_94711 ?auto_94712 ?auto_94713 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94718 - BLOCK
      ?auto_94719 - BLOCK
      ?auto_94720 - BLOCK
      ?auto_94721 - BLOCK
    )
    :vars
    (
      ?auto_94722 - BLOCK
      ?auto_94723 - BLOCK
      ?auto_94724 - BLOCK
      ?auto_94725 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94718 ?auto_94719 ) ) ( not ( = ?auto_94718 ?auto_94720 ) ) ( not ( = ?auto_94718 ?auto_94721 ) ) ( not ( = ?auto_94719 ?auto_94720 ) ) ( not ( = ?auto_94719 ?auto_94721 ) ) ( not ( = ?auto_94720 ?auto_94721 ) ) ( not ( = ?auto_94718 ?auto_94722 ) ) ( not ( = ?auto_94719 ?auto_94722 ) ) ( not ( = ?auto_94720 ?auto_94722 ) ) ( not ( = ?auto_94721 ?auto_94722 ) ) ( ON-TABLE ?auto_94723 ) ( ON ?auto_94724 ?auto_94723 ) ( ON ?auto_94722 ?auto_94724 ) ( not ( = ?auto_94723 ?auto_94724 ) ) ( not ( = ?auto_94723 ?auto_94722 ) ) ( not ( = ?auto_94723 ?auto_94721 ) ) ( not ( = ?auto_94723 ?auto_94720 ) ) ( not ( = ?auto_94724 ?auto_94722 ) ) ( not ( = ?auto_94724 ?auto_94721 ) ) ( not ( = ?auto_94724 ?auto_94720 ) ) ( not ( = ?auto_94718 ?auto_94723 ) ) ( not ( = ?auto_94718 ?auto_94724 ) ) ( not ( = ?auto_94719 ?auto_94723 ) ) ( not ( = ?auto_94719 ?auto_94724 ) ) ( ON ?auto_94718 ?auto_94725 ) ( not ( = ?auto_94718 ?auto_94725 ) ) ( not ( = ?auto_94719 ?auto_94725 ) ) ( not ( = ?auto_94720 ?auto_94725 ) ) ( not ( = ?auto_94721 ?auto_94725 ) ) ( not ( = ?auto_94722 ?auto_94725 ) ) ( not ( = ?auto_94723 ?auto_94725 ) ) ( not ( = ?auto_94724 ?auto_94725 ) ) ( ON ?auto_94719 ?auto_94718 ) ( ON-TABLE ?auto_94725 ) ( ON ?auto_94720 ?auto_94719 ) ( CLEAR ?auto_94722 ) ( ON ?auto_94721 ?auto_94720 ) ( CLEAR ?auto_94721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94725 ?auto_94718 ?auto_94719 ?auto_94720 )
      ( MAKE-4PILE ?auto_94718 ?auto_94719 ?auto_94720 ?auto_94721 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94726 - BLOCK
      ?auto_94727 - BLOCK
      ?auto_94728 - BLOCK
      ?auto_94729 - BLOCK
    )
    :vars
    (
      ?auto_94730 - BLOCK
      ?auto_94732 - BLOCK
      ?auto_94731 - BLOCK
      ?auto_94733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94726 ?auto_94727 ) ) ( not ( = ?auto_94726 ?auto_94728 ) ) ( not ( = ?auto_94726 ?auto_94729 ) ) ( not ( = ?auto_94727 ?auto_94728 ) ) ( not ( = ?auto_94727 ?auto_94729 ) ) ( not ( = ?auto_94728 ?auto_94729 ) ) ( not ( = ?auto_94726 ?auto_94730 ) ) ( not ( = ?auto_94727 ?auto_94730 ) ) ( not ( = ?auto_94728 ?auto_94730 ) ) ( not ( = ?auto_94729 ?auto_94730 ) ) ( ON-TABLE ?auto_94732 ) ( ON ?auto_94731 ?auto_94732 ) ( not ( = ?auto_94732 ?auto_94731 ) ) ( not ( = ?auto_94732 ?auto_94730 ) ) ( not ( = ?auto_94732 ?auto_94729 ) ) ( not ( = ?auto_94732 ?auto_94728 ) ) ( not ( = ?auto_94731 ?auto_94730 ) ) ( not ( = ?auto_94731 ?auto_94729 ) ) ( not ( = ?auto_94731 ?auto_94728 ) ) ( not ( = ?auto_94726 ?auto_94732 ) ) ( not ( = ?auto_94726 ?auto_94731 ) ) ( not ( = ?auto_94727 ?auto_94732 ) ) ( not ( = ?auto_94727 ?auto_94731 ) ) ( ON ?auto_94726 ?auto_94733 ) ( not ( = ?auto_94726 ?auto_94733 ) ) ( not ( = ?auto_94727 ?auto_94733 ) ) ( not ( = ?auto_94728 ?auto_94733 ) ) ( not ( = ?auto_94729 ?auto_94733 ) ) ( not ( = ?auto_94730 ?auto_94733 ) ) ( not ( = ?auto_94732 ?auto_94733 ) ) ( not ( = ?auto_94731 ?auto_94733 ) ) ( ON ?auto_94727 ?auto_94726 ) ( ON-TABLE ?auto_94733 ) ( ON ?auto_94728 ?auto_94727 ) ( ON ?auto_94729 ?auto_94728 ) ( CLEAR ?auto_94729 ) ( HOLDING ?auto_94730 ) ( CLEAR ?auto_94731 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94732 ?auto_94731 ?auto_94730 )
      ( MAKE-4PILE ?auto_94726 ?auto_94727 ?auto_94728 ?auto_94729 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94734 - BLOCK
      ?auto_94735 - BLOCK
      ?auto_94736 - BLOCK
      ?auto_94737 - BLOCK
    )
    :vars
    (
      ?auto_94739 - BLOCK
      ?auto_94740 - BLOCK
      ?auto_94738 - BLOCK
      ?auto_94741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94734 ?auto_94735 ) ) ( not ( = ?auto_94734 ?auto_94736 ) ) ( not ( = ?auto_94734 ?auto_94737 ) ) ( not ( = ?auto_94735 ?auto_94736 ) ) ( not ( = ?auto_94735 ?auto_94737 ) ) ( not ( = ?auto_94736 ?auto_94737 ) ) ( not ( = ?auto_94734 ?auto_94739 ) ) ( not ( = ?auto_94735 ?auto_94739 ) ) ( not ( = ?auto_94736 ?auto_94739 ) ) ( not ( = ?auto_94737 ?auto_94739 ) ) ( ON-TABLE ?auto_94740 ) ( ON ?auto_94738 ?auto_94740 ) ( not ( = ?auto_94740 ?auto_94738 ) ) ( not ( = ?auto_94740 ?auto_94739 ) ) ( not ( = ?auto_94740 ?auto_94737 ) ) ( not ( = ?auto_94740 ?auto_94736 ) ) ( not ( = ?auto_94738 ?auto_94739 ) ) ( not ( = ?auto_94738 ?auto_94737 ) ) ( not ( = ?auto_94738 ?auto_94736 ) ) ( not ( = ?auto_94734 ?auto_94740 ) ) ( not ( = ?auto_94734 ?auto_94738 ) ) ( not ( = ?auto_94735 ?auto_94740 ) ) ( not ( = ?auto_94735 ?auto_94738 ) ) ( ON ?auto_94734 ?auto_94741 ) ( not ( = ?auto_94734 ?auto_94741 ) ) ( not ( = ?auto_94735 ?auto_94741 ) ) ( not ( = ?auto_94736 ?auto_94741 ) ) ( not ( = ?auto_94737 ?auto_94741 ) ) ( not ( = ?auto_94739 ?auto_94741 ) ) ( not ( = ?auto_94740 ?auto_94741 ) ) ( not ( = ?auto_94738 ?auto_94741 ) ) ( ON ?auto_94735 ?auto_94734 ) ( ON-TABLE ?auto_94741 ) ( ON ?auto_94736 ?auto_94735 ) ( ON ?auto_94737 ?auto_94736 ) ( CLEAR ?auto_94738 ) ( ON ?auto_94739 ?auto_94737 ) ( CLEAR ?auto_94739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94741 ?auto_94734 ?auto_94735 ?auto_94736 ?auto_94737 )
      ( MAKE-4PILE ?auto_94734 ?auto_94735 ?auto_94736 ?auto_94737 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94742 - BLOCK
      ?auto_94743 - BLOCK
      ?auto_94744 - BLOCK
      ?auto_94745 - BLOCK
    )
    :vars
    (
      ?auto_94747 - BLOCK
      ?auto_94746 - BLOCK
      ?auto_94749 - BLOCK
      ?auto_94748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94742 ?auto_94743 ) ) ( not ( = ?auto_94742 ?auto_94744 ) ) ( not ( = ?auto_94742 ?auto_94745 ) ) ( not ( = ?auto_94743 ?auto_94744 ) ) ( not ( = ?auto_94743 ?auto_94745 ) ) ( not ( = ?auto_94744 ?auto_94745 ) ) ( not ( = ?auto_94742 ?auto_94747 ) ) ( not ( = ?auto_94743 ?auto_94747 ) ) ( not ( = ?auto_94744 ?auto_94747 ) ) ( not ( = ?auto_94745 ?auto_94747 ) ) ( ON-TABLE ?auto_94746 ) ( not ( = ?auto_94746 ?auto_94749 ) ) ( not ( = ?auto_94746 ?auto_94747 ) ) ( not ( = ?auto_94746 ?auto_94745 ) ) ( not ( = ?auto_94746 ?auto_94744 ) ) ( not ( = ?auto_94749 ?auto_94747 ) ) ( not ( = ?auto_94749 ?auto_94745 ) ) ( not ( = ?auto_94749 ?auto_94744 ) ) ( not ( = ?auto_94742 ?auto_94746 ) ) ( not ( = ?auto_94742 ?auto_94749 ) ) ( not ( = ?auto_94743 ?auto_94746 ) ) ( not ( = ?auto_94743 ?auto_94749 ) ) ( ON ?auto_94742 ?auto_94748 ) ( not ( = ?auto_94742 ?auto_94748 ) ) ( not ( = ?auto_94743 ?auto_94748 ) ) ( not ( = ?auto_94744 ?auto_94748 ) ) ( not ( = ?auto_94745 ?auto_94748 ) ) ( not ( = ?auto_94747 ?auto_94748 ) ) ( not ( = ?auto_94746 ?auto_94748 ) ) ( not ( = ?auto_94749 ?auto_94748 ) ) ( ON ?auto_94743 ?auto_94742 ) ( ON-TABLE ?auto_94748 ) ( ON ?auto_94744 ?auto_94743 ) ( ON ?auto_94745 ?auto_94744 ) ( ON ?auto_94747 ?auto_94745 ) ( CLEAR ?auto_94747 ) ( HOLDING ?auto_94749 ) ( CLEAR ?auto_94746 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94746 ?auto_94749 )
      ( MAKE-4PILE ?auto_94742 ?auto_94743 ?auto_94744 ?auto_94745 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94750 - BLOCK
      ?auto_94751 - BLOCK
      ?auto_94752 - BLOCK
      ?auto_94753 - BLOCK
    )
    :vars
    (
      ?auto_94755 - BLOCK
      ?auto_94756 - BLOCK
      ?auto_94757 - BLOCK
      ?auto_94754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94750 ?auto_94751 ) ) ( not ( = ?auto_94750 ?auto_94752 ) ) ( not ( = ?auto_94750 ?auto_94753 ) ) ( not ( = ?auto_94751 ?auto_94752 ) ) ( not ( = ?auto_94751 ?auto_94753 ) ) ( not ( = ?auto_94752 ?auto_94753 ) ) ( not ( = ?auto_94750 ?auto_94755 ) ) ( not ( = ?auto_94751 ?auto_94755 ) ) ( not ( = ?auto_94752 ?auto_94755 ) ) ( not ( = ?auto_94753 ?auto_94755 ) ) ( ON-TABLE ?auto_94756 ) ( not ( = ?auto_94756 ?auto_94757 ) ) ( not ( = ?auto_94756 ?auto_94755 ) ) ( not ( = ?auto_94756 ?auto_94753 ) ) ( not ( = ?auto_94756 ?auto_94752 ) ) ( not ( = ?auto_94757 ?auto_94755 ) ) ( not ( = ?auto_94757 ?auto_94753 ) ) ( not ( = ?auto_94757 ?auto_94752 ) ) ( not ( = ?auto_94750 ?auto_94756 ) ) ( not ( = ?auto_94750 ?auto_94757 ) ) ( not ( = ?auto_94751 ?auto_94756 ) ) ( not ( = ?auto_94751 ?auto_94757 ) ) ( ON ?auto_94750 ?auto_94754 ) ( not ( = ?auto_94750 ?auto_94754 ) ) ( not ( = ?auto_94751 ?auto_94754 ) ) ( not ( = ?auto_94752 ?auto_94754 ) ) ( not ( = ?auto_94753 ?auto_94754 ) ) ( not ( = ?auto_94755 ?auto_94754 ) ) ( not ( = ?auto_94756 ?auto_94754 ) ) ( not ( = ?auto_94757 ?auto_94754 ) ) ( ON ?auto_94751 ?auto_94750 ) ( ON-TABLE ?auto_94754 ) ( ON ?auto_94752 ?auto_94751 ) ( ON ?auto_94753 ?auto_94752 ) ( ON ?auto_94755 ?auto_94753 ) ( CLEAR ?auto_94756 ) ( ON ?auto_94757 ?auto_94755 ) ( CLEAR ?auto_94757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94754 ?auto_94750 ?auto_94751 ?auto_94752 ?auto_94753 ?auto_94755 )
      ( MAKE-4PILE ?auto_94750 ?auto_94751 ?auto_94752 ?auto_94753 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94758 - BLOCK
      ?auto_94759 - BLOCK
      ?auto_94760 - BLOCK
      ?auto_94761 - BLOCK
    )
    :vars
    (
      ?auto_94763 - BLOCK
      ?auto_94762 - BLOCK
      ?auto_94764 - BLOCK
      ?auto_94765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94758 ?auto_94759 ) ) ( not ( = ?auto_94758 ?auto_94760 ) ) ( not ( = ?auto_94758 ?auto_94761 ) ) ( not ( = ?auto_94759 ?auto_94760 ) ) ( not ( = ?auto_94759 ?auto_94761 ) ) ( not ( = ?auto_94760 ?auto_94761 ) ) ( not ( = ?auto_94758 ?auto_94763 ) ) ( not ( = ?auto_94759 ?auto_94763 ) ) ( not ( = ?auto_94760 ?auto_94763 ) ) ( not ( = ?auto_94761 ?auto_94763 ) ) ( not ( = ?auto_94762 ?auto_94764 ) ) ( not ( = ?auto_94762 ?auto_94763 ) ) ( not ( = ?auto_94762 ?auto_94761 ) ) ( not ( = ?auto_94762 ?auto_94760 ) ) ( not ( = ?auto_94764 ?auto_94763 ) ) ( not ( = ?auto_94764 ?auto_94761 ) ) ( not ( = ?auto_94764 ?auto_94760 ) ) ( not ( = ?auto_94758 ?auto_94762 ) ) ( not ( = ?auto_94758 ?auto_94764 ) ) ( not ( = ?auto_94759 ?auto_94762 ) ) ( not ( = ?auto_94759 ?auto_94764 ) ) ( ON ?auto_94758 ?auto_94765 ) ( not ( = ?auto_94758 ?auto_94765 ) ) ( not ( = ?auto_94759 ?auto_94765 ) ) ( not ( = ?auto_94760 ?auto_94765 ) ) ( not ( = ?auto_94761 ?auto_94765 ) ) ( not ( = ?auto_94763 ?auto_94765 ) ) ( not ( = ?auto_94762 ?auto_94765 ) ) ( not ( = ?auto_94764 ?auto_94765 ) ) ( ON ?auto_94759 ?auto_94758 ) ( ON-TABLE ?auto_94765 ) ( ON ?auto_94760 ?auto_94759 ) ( ON ?auto_94761 ?auto_94760 ) ( ON ?auto_94763 ?auto_94761 ) ( ON ?auto_94764 ?auto_94763 ) ( CLEAR ?auto_94764 ) ( HOLDING ?auto_94762 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94762 )
      ( MAKE-4PILE ?auto_94758 ?auto_94759 ?auto_94760 ?auto_94761 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94766 - BLOCK
      ?auto_94767 - BLOCK
      ?auto_94768 - BLOCK
      ?auto_94769 - BLOCK
    )
    :vars
    (
      ?auto_94773 - BLOCK
      ?auto_94771 - BLOCK
      ?auto_94770 - BLOCK
      ?auto_94772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94766 ?auto_94767 ) ) ( not ( = ?auto_94766 ?auto_94768 ) ) ( not ( = ?auto_94766 ?auto_94769 ) ) ( not ( = ?auto_94767 ?auto_94768 ) ) ( not ( = ?auto_94767 ?auto_94769 ) ) ( not ( = ?auto_94768 ?auto_94769 ) ) ( not ( = ?auto_94766 ?auto_94773 ) ) ( not ( = ?auto_94767 ?auto_94773 ) ) ( not ( = ?auto_94768 ?auto_94773 ) ) ( not ( = ?auto_94769 ?auto_94773 ) ) ( not ( = ?auto_94771 ?auto_94770 ) ) ( not ( = ?auto_94771 ?auto_94773 ) ) ( not ( = ?auto_94771 ?auto_94769 ) ) ( not ( = ?auto_94771 ?auto_94768 ) ) ( not ( = ?auto_94770 ?auto_94773 ) ) ( not ( = ?auto_94770 ?auto_94769 ) ) ( not ( = ?auto_94770 ?auto_94768 ) ) ( not ( = ?auto_94766 ?auto_94771 ) ) ( not ( = ?auto_94766 ?auto_94770 ) ) ( not ( = ?auto_94767 ?auto_94771 ) ) ( not ( = ?auto_94767 ?auto_94770 ) ) ( ON ?auto_94766 ?auto_94772 ) ( not ( = ?auto_94766 ?auto_94772 ) ) ( not ( = ?auto_94767 ?auto_94772 ) ) ( not ( = ?auto_94768 ?auto_94772 ) ) ( not ( = ?auto_94769 ?auto_94772 ) ) ( not ( = ?auto_94773 ?auto_94772 ) ) ( not ( = ?auto_94771 ?auto_94772 ) ) ( not ( = ?auto_94770 ?auto_94772 ) ) ( ON ?auto_94767 ?auto_94766 ) ( ON-TABLE ?auto_94772 ) ( ON ?auto_94768 ?auto_94767 ) ( ON ?auto_94769 ?auto_94768 ) ( ON ?auto_94773 ?auto_94769 ) ( ON ?auto_94770 ?auto_94773 ) ( ON ?auto_94771 ?auto_94770 ) ( CLEAR ?auto_94771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94772 ?auto_94766 ?auto_94767 ?auto_94768 ?auto_94769 ?auto_94773 ?auto_94770 )
      ( MAKE-4PILE ?auto_94766 ?auto_94767 ?auto_94768 ?auto_94769 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94776 - BLOCK
      ?auto_94777 - BLOCK
    )
    :vars
    (
      ?auto_94778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94778 ?auto_94777 ) ( CLEAR ?auto_94778 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94776 ) ( ON ?auto_94777 ?auto_94776 ) ( not ( = ?auto_94776 ?auto_94777 ) ) ( not ( = ?auto_94776 ?auto_94778 ) ) ( not ( = ?auto_94777 ?auto_94778 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94778 ?auto_94777 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94779 - BLOCK
      ?auto_94780 - BLOCK
    )
    :vars
    (
      ?auto_94781 - BLOCK
      ?auto_94782 - BLOCK
      ?auto_94783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94781 ?auto_94780 ) ( CLEAR ?auto_94781 ) ( ON-TABLE ?auto_94779 ) ( ON ?auto_94780 ?auto_94779 ) ( not ( = ?auto_94779 ?auto_94780 ) ) ( not ( = ?auto_94779 ?auto_94781 ) ) ( not ( = ?auto_94780 ?auto_94781 ) ) ( HOLDING ?auto_94782 ) ( CLEAR ?auto_94783 ) ( not ( = ?auto_94779 ?auto_94782 ) ) ( not ( = ?auto_94779 ?auto_94783 ) ) ( not ( = ?auto_94780 ?auto_94782 ) ) ( not ( = ?auto_94780 ?auto_94783 ) ) ( not ( = ?auto_94781 ?auto_94782 ) ) ( not ( = ?auto_94781 ?auto_94783 ) ) ( not ( = ?auto_94782 ?auto_94783 ) ) )
    :subtasks
    ( ( !STACK ?auto_94782 ?auto_94783 )
      ( MAKE-2PILE ?auto_94779 ?auto_94780 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94784 - BLOCK
      ?auto_94785 - BLOCK
    )
    :vars
    (
      ?auto_94788 - BLOCK
      ?auto_94786 - BLOCK
      ?auto_94787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94788 ?auto_94785 ) ( ON-TABLE ?auto_94784 ) ( ON ?auto_94785 ?auto_94784 ) ( not ( = ?auto_94784 ?auto_94785 ) ) ( not ( = ?auto_94784 ?auto_94788 ) ) ( not ( = ?auto_94785 ?auto_94788 ) ) ( CLEAR ?auto_94786 ) ( not ( = ?auto_94784 ?auto_94787 ) ) ( not ( = ?auto_94784 ?auto_94786 ) ) ( not ( = ?auto_94785 ?auto_94787 ) ) ( not ( = ?auto_94785 ?auto_94786 ) ) ( not ( = ?auto_94788 ?auto_94787 ) ) ( not ( = ?auto_94788 ?auto_94786 ) ) ( not ( = ?auto_94787 ?auto_94786 ) ) ( ON ?auto_94787 ?auto_94788 ) ( CLEAR ?auto_94787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94784 ?auto_94785 ?auto_94788 )
      ( MAKE-2PILE ?auto_94784 ?auto_94785 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94789 - BLOCK
      ?auto_94790 - BLOCK
    )
    :vars
    (
      ?auto_94791 - BLOCK
      ?auto_94793 - BLOCK
      ?auto_94792 - BLOCK
      ?auto_94794 - BLOCK
      ?auto_94795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94791 ?auto_94790 ) ( ON-TABLE ?auto_94789 ) ( ON ?auto_94790 ?auto_94789 ) ( not ( = ?auto_94789 ?auto_94790 ) ) ( not ( = ?auto_94789 ?auto_94791 ) ) ( not ( = ?auto_94790 ?auto_94791 ) ) ( not ( = ?auto_94789 ?auto_94793 ) ) ( not ( = ?auto_94789 ?auto_94792 ) ) ( not ( = ?auto_94790 ?auto_94793 ) ) ( not ( = ?auto_94790 ?auto_94792 ) ) ( not ( = ?auto_94791 ?auto_94793 ) ) ( not ( = ?auto_94791 ?auto_94792 ) ) ( not ( = ?auto_94793 ?auto_94792 ) ) ( ON ?auto_94793 ?auto_94791 ) ( CLEAR ?auto_94793 ) ( HOLDING ?auto_94792 ) ( CLEAR ?auto_94794 ) ( ON-TABLE ?auto_94795 ) ( ON ?auto_94794 ?auto_94795 ) ( not ( = ?auto_94795 ?auto_94794 ) ) ( not ( = ?auto_94795 ?auto_94792 ) ) ( not ( = ?auto_94794 ?auto_94792 ) ) ( not ( = ?auto_94789 ?auto_94794 ) ) ( not ( = ?auto_94789 ?auto_94795 ) ) ( not ( = ?auto_94790 ?auto_94794 ) ) ( not ( = ?auto_94790 ?auto_94795 ) ) ( not ( = ?auto_94791 ?auto_94794 ) ) ( not ( = ?auto_94791 ?auto_94795 ) ) ( not ( = ?auto_94793 ?auto_94794 ) ) ( not ( = ?auto_94793 ?auto_94795 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94795 ?auto_94794 ?auto_94792 )
      ( MAKE-2PILE ?auto_94789 ?auto_94790 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94796 - BLOCK
      ?auto_94797 - BLOCK
    )
    :vars
    (
      ?auto_94800 - BLOCK
      ?auto_94798 - BLOCK
      ?auto_94799 - BLOCK
      ?auto_94801 - BLOCK
      ?auto_94802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94800 ?auto_94797 ) ( ON-TABLE ?auto_94796 ) ( ON ?auto_94797 ?auto_94796 ) ( not ( = ?auto_94796 ?auto_94797 ) ) ( not ( = ?auto_94796 ?auto_94800 ) ) ( not ( = ?auto_94797 ?auto_94800 ) ) ( not ( = ?auto_94796 ?auto_94798 ) ) ( not ( = ?auto_94796 ?auto_94799 ) ) ( not ( = ?auto_94797 ?auto_94798 ) ) ( not ( = ?auto_94797 ?auto_94799 ) ) ( not ( = ?auto_94800 ?auto_94798 ) ) ( not ( = ?auto_94800 ?auto_94799 ) ) ( not ( = ?auto_94798 ?auto_94799 ) ) ( ON ?auto_94798 ?auto_94800 ) ( CLEAR ?auto_94801 ) ( ON-TABLE ?auto_94802 ) ( ON ?auto_94801 ?auto_94802 ) ( not ( = ?auto_94802 ?auto_94801 ) ) ( not ( = ?auto_94802 ?auto_94799 ) ) ( not ( = ?auto_94801 ?auto_94799 ) ) ( not ( = ?auto_94796 ?auto_94801 ) ) ( not ( = ?auto_94796 ?auto_94802 ) ) ( not ( = ?auto_94797 ?auto_94801 ) ) ( not ( = ?auto_94797 ?auto_94802 ) ) ( not ( = ?auto_94800 ?auto_94801 ) ) ( not ( = ?auto_94800 ?auto_94802 ) ) ( not ( = ?auto_94798 ?auto_94801 ) ) ( not ( = ?auto_94798 ?auto_94802 ) ) ( ON ?auto_94799 ?auto_94798 ) ( CLEAR ?auto_94799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94796 ?auto_94797 ?auto_94800 ?auto_94798 )
      ( MAKE-2PILE ?auto_94796 ?auto_94797 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94803 - BLOCK
      ?auto_94804 - BLOCK
    )
    :vars
    (
      ?auto_94807 - BLOCK
      ?auto_94805 - BLOCK
      ?auto_94806 - BLOCK
      ?auto_94808 - BLOCK
      ?auto_94809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94807 ?auto_94804 ) ( ON-TABLE ?auto_94803 ) ( ON ?auto_94804 ?auto_94803 ) ( not ( = ?auto_94803 ?auto_94804 ) ) ( not ( = ?auto_94803 ?auto_94807 ) ) ( not ( = ?auto_94804 ?auto_94807 ) ) ( not ( = ?auto_94803 ?auto_94805 ) ) ( not ( = ?auto_94803 ?auto_94806 ) ) ( not ( = ?auto_94804 ?auto_94805 ) ) ( not ( = ?auto_94804 ?auto_94806 ) ) ( not ( = ?auto_94807 ?auto_94805 ) ) ( not ( = ?auto_94807 ?auto_94806 ) ) ( not ( = ?auto_94805 ?auto_94806 ) ) ( ON ?auto_94805 ?auto_94807 ) ( ON-TABLE ?auto_94808 ) ( not ( = ?auto_94808 ?auto_94809 ) ) ( not ( = ?auto_94808 ?auto_94806 ) ) ( not ( = ?auto_94809 ?auto_94806 ) ) ( not ( = ?auto_94803 ?auto_94809 ) ) ( not ( = ?auto_94803 ?auto_94808 ) ) ( not ( = ?auto_94804 ?auto_94809 ) ) ( not ( = ?auto_94804 ?auto_94808 ) ) ( not ( = ?auto_94807 ?auto_94809 ) ) ( not ( = ?auto_94807 ?auto_94808 ) ) ( not ( = ?auto_94805 ?auto_94809 ) ) ( not ( = ?auto_94805 ?auto_94808 ) ) ( ON ?auto_94806 ?auto_94805 ) ( CLEAR ?auto_94806 ) ( HOLDING ?auto_94809 ) ( CLEAR ?auto_94808 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94808 ?auto_94809 )
      ( MAKE-2PILE ?auto_94803 ?auto_94804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94810 - BLOCK
      ?auto_94811 - BLOCK
    )
    :vars
    (
      ?auto_94816 - BLOCK
      ?auto_94812 - BLOCK
      ?auto_94814 - BLOCK
      ?auto_94815 - BLOCK
      ?auto_94813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94816 ?auto_94811 ) ( ON-TABLE ?auto_94810 ) ( ON ?auto_94811 ?auto_94810 ) ( not ( = ?auto_94810 ?auto_94811 ) ) ( not ( = ?auto_94810 ?auto_94816 ) ) ( not ( = ?auto_94811 ?auto_94816 ) ) ( not ( = ?auto_94810 ?auto_94812 ) ) ( not ( = ?auto_94810 ?auto_94814 ) ) ( not ( = ?auto_94811 ?auto_94812 ) ) ( not ( = ?auto_94811 ?auto_94814 ) ) ( not ( = ?auto_94816 ?auto_94812 ) ) ( not ( = ?auto_94816 ?auto_94814 ) ) ( not ( = ?auto_94812 ?auto_94814 ) ) ( ON ?auto_94812 ?auto_94816 ) ( ON-TABLE ?auto_94815 ) ( not ( = ?auto_94815 ?auto_94813 ) ) ( not ( = ?auto_94815 ?auto_94814 ) ) ( not ( = ?auto_94813 ?auto_94814 ) ) ( not ( = ?auto_94810 ?auto_94813 ) ) ( not ( = ?auto_94810 ?auto_94815 ) ) ( not ( = ?auto_94811 ?auto_94813 ) ) ( not ( = ?auto_94811 ?auto_94815 ) ) ( not ( = ?auto_94816 ?auto_94813 ) ) ( not ( = ?auto_94816 ?auto_94815 ) ) ( not ( = ?auto_94812 ?auto_94813 ) ) ( not ( = ?auto_94812 ?auto_94815 ) ) ( ON ?auto_94814 ?auto_94812 ) ( CLEAR ?auto_94815 ) ( ON ?auto_94813 ?auto_94814 ) ( CLEAR ?auto_94813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94810 ?auto_94811 ?auto_94816 ?auto_94812 ?auto_94814 )
      ( MAKE-2PILE ?auto_94810 ?auto_94811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94817 - BLOCK
      ?auto_94818 - BLOCK
    )
    :vars
    (
      ?auto_94823 - BLOCK
      ?auto_94822 - BLOCK
      ?auto_94819 - BLOCK
      ?auto_94820 - BLOCK
      ?auto_94821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94823 ?auto_94818 ) ( ON-TABLE ?auto_94817 ) ( ON ?auto_94818 ?auto_94817 ) ( not ( = ?auto_94817 ?auto_94818 ) ) ( not ( = ?auto_94817 ?auto_94823 ) ) ( not ( = ?auto_94818 ?auto_94823 ) ) ( not ( = ?auto_94817 ?auto_94822 ) ) ( not ( = ?auto_94817 ?auto_94819 ) ) ( not ( = ?auto_94818 ?auto_94822 ) ) ( not ( = ?auto_94818 ?auto_94819 ) ) ( not ( = ?auto_94823 ?auto_94822 ) ) ( not ( = ?auto_94823 ?auto_94819 ) ) ( not ( = ?auto_94822 ?auto_94819 ) ) ( ON ?auto_94822 ?auto_94823 ) ( not ( = ?auto_94820 ?auto_94821 ) ) ( not ( = ?auto_94820 ?auto_94819 ) ) ( not ( = ?auto_94821 ?auto_94819 ) ) ( not ( = ?auto_94817 ?auto_94821 ) ) ( not ( = ?auto_94817 ?auto_94820 ) ) ( not ( = ?auto_94818 ?auto_94821 ) ) ( not ( = ?auto_94818 ?auto_94820 ) ) ( not ( = ?auto_94823 ?auto_94821 ) ) ( not ( = ?auto_94823 ?auto_94820 ) ) ( not ( = ?auto_94822 ?auto_94821 ) ) ( not ( = ?auto_94822 ?auto_94820 ) ) ( ON ?auto_94819 ?auto_94822 ) ( ON ?auto_94821 ?auto_94819 ) ( CLEAR ?auto_94821 ) ( HOLDING ?auto_94820 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94820 )
      ( MAKE-2PILE ?auto_94817 ?auto_94818 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94824 - BLOCK
      ?auto_94825 - BLOCK
    )
    :vars
    (
      ?auto_94827 - BLOCK
      ?auto_94830 - BLOCK
      ?auto_94829 - BLOCK
      ?auto_94828 - BLOCK
      ?auto_94826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94827 ?auto_94825 ) ( ON-TABLE ?auto_94824 ) ( ON ?auto_94825 ?auto_94824 ) ( not ( = ?auto_94824 ?auto_94825 ) ) ( not ( = ?auto_94824 ?auto_94827 ) ) ( not ( = ?auto_94825 ?auto_94827 ) ) ( not ( = ?auto_94824 ?auto_94830 ) ) ( not ( = ?auto_94824 ?auto_94829 ) ) ( not ( = ?auto_94825 ?auto_94830 ) ) ( not ( = ?auto_94825 ?auto_94829 ) ) ( not ( = ?auto_94827 ?auto_94830 ) ) ( not ( = ?auto_94827 ?auto_94829 ) ) ( not ( = ?auto_94830 ?auto_94829 ) ) ( ON ?auto_94830 ?auto_94827 ) ( not ( = ?auto_94828 ?auto_94826 ) ) ( not ( = ?auto_94828 ?auto_94829 ) ) ( not ( = ?auto_94826 ?auto_94829 ) ) ( not ( = ?auto_94824 ?auto_94826 ) ) ( not ( = ?auto_94824 ?auto_94828 ) ) ( not ( = ?auto_94825 ?auto_94826 ) ) ( not ( = ?auto_94825 ?auto_94828 ) ) ( not ( = ?auto_94827 ?auto_94826 ) ) ( not ( = ?auto_94827 ?auto_94828 ) ) ( not ( = ?auto_94830 ?auto_94826 ) ) ( not ( = ?auto_94830 ?auto_94828 ) ) ( ON ?auto_94829 ?auto_94830 ) ( ON ?auto_94826 ?auto_94829 ) ( ON ?auto_94828 ?auto_94826 ) ( CLEAR ?auto_94828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94824 ?auto_94825 ?auto_94827 ?auto_94830 ?auto_94829 ?auto_94826 )
      ( MAKE-2PILE ?auto_94824 ?auto_94825 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94831 - BLOCK
      ?auto_94832 - BLOCK
    )
    :vars
    (
      ?auto_94833 - BLOCK
      ?auto_94836 - BLOCK
      ?auto_94837 - BLOCK
      ?auto_94835 - BLOCK
      ?auto_94834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94833 ?auto_94832 ) ( ON-TABLE ?auto_94831 ) ( ON ?auto_94832 ?auto_94831 ) ( not ( = ?auto_94831 ?auto_94832 ) ) ( not ( = ?auto_94831 ?auto_94833 ) ) ( not ( = ?auto_94832 ?auto_94833 ) ) ( not ( = ?auto_94831 ?auto_94836 ) ) ( not ( = ?auto_94831 ?auto_94837 ) ) ( not ( = ?auto_94832 ?auto_94836 ) ) ( not ( = ?auto_94832 ?auto_94837 ) ) ( not ( = ?auto_94833 ?auto_94836 ) ) ( not ( = ?auto_94833 ?auto_94837 ) ) ( not ( = ?auto_94836 ?auto_94837 ) ) ( ON ?auto_94836 ?auto_94833 ) ( not ( = ?auto_94835 ?auto_94834 ) ) ( not ( = ?auto_94835 ?auto_94837 ) ) ( not ( = ?auto_94834 ?auto_94837 ) ) ( not ( = ?auto_94831 ?auto_94834 ) ) ( not ( = ?auto_94831 ?auto_94835 ) ) ( not ( = ?auto_94832 ?auto_94834 ) ) ( not ( = ?auto_94832 ?auto_94835 ) ) ( not ( = ?auto_94833 ?auto_94834 ) ) ( not ( = ?auto_94833 ?auto_94835 ) ) ( not ( = ?auto_94836 ?auto_94834 ) ) ( not ( = ?auto_94836 ?auto_94835 ) ) ( ON ?auto_94837 ?auto_94836 ) ( ON ?auto_94834 ?auto_94837 ) ( HOLDING ?auto_94835 ) ( CLEAR ?auto_94834 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94831 ?auto_94832 ?auto_94833 ?auto_94836 ?auto_94837 ?auto_94834 ?auto_94835 )
      ( MAKE-2PILE ?auto_94831 ?auto_94832 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94838 - BLOCK
      ?auto_94839 - BLOCK
    )
    :vars
    (
      ?auto_94842 - BLOCK
      ?auto_94844 - BLOCK
      ?auto_94840 - BLOCK
      ?auto_94841 - BLOCK
      ?auto_94843 - BLOCK
      ?auto_94845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94842 ?auto_94839 ) ( ON-TABLE ?auto_94838 ) ( ON ?auto_94839 ?auto_94838 ) ( not ( = ?auto_94838 ?auto_94839 ) ) ( not ( = ?auto_94838 ?auto_94842 ) ) ( not ( = ?auto_94839 ?auto_94842 ) ) ( not ( = ?auto_94838 ?auto_94844 ) ) ( not ( = ?auto_94838 ?auto_94840 ) ) ( not ( = ?auto_94839 ?auto_94844 ) ) ( not ( = ?auto_94839 ?auto_94840 ) ) ( not ( = ?auto_94842 ?auto_94844 ) ) ( not ( = ?auto_94842 ?auto_94840 ) ) ( not ( = ?auto_94844 ?auto_94840 ) ) ( ON ?auto_94844 ?auto_94842 ) ( not ( = ?auto_94841 ?auto_94843 ) ) ( not ( = ?auto_94841 ?auto_94840 ) ) ( not ( = ?auto_94843 ?auto_94840 ) ) ( not ( = ?auto_94838 ?auto_94843 ) ) ( not ( = ?auto_94838 ?auto_94841 ) ) ( not ( = ?auto_94839 ?auto_94843 ) ) ( not ( = ?auto_94839 ?auto_94841 ) ) ( not ( = ?auto_94842 ?auto_94843 ) ) ( not ( = ?auto_94842 ?auto_94841 ) ) ( not ( = ?auto_94844 ?auto_94843 ) ) ( not ( = ?auto_94844 ?auto_94841 ) ) ( ON ?auto_94840 ?auto_94844 ) ( ON ?auto_94843 ?auto_94840 ) ( CLEAR ?auto_94843 ) ( ON ?auto_94841 ?auto_94845 ) ( CLEAR ?auto_94841 ) ( HAND-EMPTY ) ( not ( = ?auto_94838 ?auto_94845 ) ) ( not ( = ?auto_94839 ?auto_94845 ) ) ( not ( = ?auto_94842 ?auto_94845 ) ) ( not ( = ?auto_94844 ?auto_94845 ) ) ( not ( = ?auto_94840 ?auto_94845 ) ) ( not ( = ?auto_94841 ?auto_94845 ) ) ( not ( = ?auto_94843 ?auto_94845 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94841 ?auto_94845 )
      ( MAKE-2PILE ?auto_94838 ?auto_94839 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94846 - BLOCK
      ?auto_94847 - BLOCK
    )
    :vars
    (
      ?auto_94848 - BLOCK
      ?auto_94852 - BLOCK
      ?auto_94853 - BLOCK
      ?auto_94851 - BLOCK
      ?auto_94850 - BLOCK
      ?auto_94849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94848 ?auto_94847 ) ( ON-TABLE ?auto_94846 ) ( ON ?auto_94847 ?auto_94846 ) ( not ( = ?auto_94846 ?auto_94847 ) ) ( not ( = ?auto_94846 ?auto_94848 ) ) ( not ( = ?auto_94847 ?auto_94848 ) ) ( not ( = ?auto_94846 ?auto_94852 ) ) ( not ( = ?auto_94846 ?auto_94853 ) ) ( not ( = ?auto_94847 ?auto_94852 ) ) ( not ( = ?auto_94847 ?auto_94853 ) ) ( not ( = ?auto_94848 ?auto_94852 ) ) ( not ( = ?auto_94848 ?auto_94853 ) ) ( not ( = ?auto_94852 ?auto_94853 ) ) ( ON ?auto_94852 ?auto_94848 ) ( not ( = ?auto_94851 ?auto_94850 ) ) ( not ( = ?auto_94851 ?auto_94853 ) ) ( not ( = ?auto_94850 ?auto_94853 ) ) ( not ( = ?auto_94846 ?auto_94850 ) ) ( not ( = ?auto_94846 ?auto_94851 ) ) ( not ( = ?auto_94847 ?auto_94850 ) ) ( not ( = ?auto_94847 ?auto_94851 ) ) ( not ( = ?auto_94848 ?auto_94850 ) ) ( not ( = ?auto_94848 ?auto_94851 ) ) ( not ( = ?auto_94852 ?auto_94850 ) ) ( not ( = ?auto_94852 ?auto_94851 ) ) ( ON ?auto_94853 ?auto_94852 ) ( ON ?auto_94851 ?auto_94849 ) ( CLEAR ?auto_94851 ) ( not ( = ?auto_94846 ?auto_94849 ) ) ( not ( = ?auto_94847 ?auto_94849 ) ) ( not ( = ?auto_94848 ?auto_94849 ) ) ( not ( = ?auto_94852 ?auto_94849 ) ) ( not ( = ?auto_94853 ?auto_94849 ) ) ( not ( = ?auto_94851 ?auto_94849 ) ) ( not ( = ?auto_94850 ?auto_94849 ) ) ( HOLDING ?auto_94850 ) ( CLEAR ?auto_94853 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94846 ?auto_94847 ?auto_94848 ?auto_94852 ?auto_94853 ?auto_94850 )
      ( MAKE-2PILE ?auto_94846 ?auto_94847 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94854 - BLOCK
      ?auto_94855 - BLOCK
    )
    :vars
    (
      ?auto_94859 - BLOCK
      ?auto_94861 - BLOCK
      ?auto_94856 - BLOCK
      ?auto_94858 - BLOCK
      ?auto_94857 - BLOCK
      ?auto_94860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94859 ?auto_94855 ) ( ON-TABLE ?auto_94854 ) ( ON ?auto_94855 ?auto_94854 ) ( not ( = ?auto_94854 ?auto_94855 ) ) ( not ( = ?auto_94854 ?auto_94859 ) ) ( not ( = ?auto_94855 ?auto_94859 ) ) ( not ( = ?auto_94854 ?auto_94861 ) ) ( not ( = ?auto_94854 ?auto_94856 ) ) ( not ( = ?auto_94855 ?auto_94861 ) ) ( not ( = ?auto_94855 ?auto_94856 ) ) ( not ( = ?auto_94859 ?auto_94861 ) ) ( not ( = ?auto_94859 ?auto_94856 ) ) ( not ( = ?auto_94861 ?auto_94856 ) ) ( ON ?auto_94861 ?auto_94859 ) ( not ( = ?auto_94858 ?auto_94857 ) ) ( not ( = ?auto_94858 ?auto_94856 ) ) ( not ( = ?auto_94857 ?auto_94856 ) ) ( not ( = ?auto_94854 ?auto_94857 ) ) ( not ( = ?auto_94854 ?auto_94858 ) ) ( not ( = ?auto_94855 ?auto_94857 ) ) ( not ( = ?auto_94855 ?auto_94858 ) ) ( not ( = ?auto_94859 ?auto_94857 ) ) ( not ( = ?auto_94859 ?auto_94858 ) ) ( not ( = ?auto_94861 ?auto_94857 ) ) ( not ( = ?auto_94861 ?auto_94858 ) ) ( ON ?auto_94856 ?auto_94861 ) ( ON ?auto_94858 ?auto_94860 ) ( not ( = ?auto_94854 ?auto_94860 ) ) ( not ( = ?auto_94855 ?auto_94860 ) ) ( not ( = ?auto_94859 ?auto_94860 ) ) ( not ( = ?auto_94861 ?auto_94860 ) ) ( not ( = ?auto_94856 ?auto_94860 ) ) ( not ( = ?auto_94858 ?auto_94860 ) ) ( not ( = ?auto_94857 ?auto_94860 ) ) ( CLEAR ?auto_94856 ) ( ON ?auto_94857 ?auto_94858 ) ( CLEAR ?auto_94857 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94860 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94860 ?auto_94858 )
      ( MAKE-2PILE ?auto_94854 ?auto_94855 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94862 - BLOCK
      ?auto_94863 - BLOCK
    )
    :vars
    (
      ?auto_94864 - BLOCK
      ?auto_94866 - BLOCK
      ?auto_94865 - BLOCK
      ?auto_94868 - BLOCK
      ?auto_94869 - BLOCK
      ?auto_94867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94864 ?auto_94863 ) ( ON-TABLE ?auto_94862 ) ( ON ?auto_94863 ?auto_94862 ) ( not ( = ?auto_94862 ?auto_94863 ) ) ( not ( = ?auto_94862 ?auto_94864 ) ) ( not ( = ?auto_94863 ?auto_94864 ) ) ( not ( = ?auto_94862 ?auto_94866 ) ) ( not ( = ?auto_94862 ?auto_94865 ) ) ( not ( = ?auto_94863 ?auto_94866 ) ) ( not ( = ?auto_94863 ?auto_94865 ) ) ( not ( = ?auto_94864 ?auto_94866 ) ) ( not ( = ?auto_94864 ?auto_94865 ) ) ( not ( = ?auto_94866 ?auto_94865 ) ) ( ON ?auto_94866 ?auto_94864 ) ( not ( = ?auto_94868 ?auto_94869 ) ) ( not ( = ?auto_94868 ?auto_94865 ) ) ( not ( = ?auto_94869 ?auto_94865 ) ) ( not ( = ?auto_94862 ?auto_94869 ) ) ( not ( = ?auto_94862 ?auto_94868 ) ) ( not ( = ?auto_94863 ?auto_94869 ) ) ( not ( = ?auto_94863 ?auto_94868 ) ) ( not ( = ?auto_94864 ?auto_94869 ) ) ( not ( = ?auto_94864 ?auto_94868 ) ) ( not ( = ?auto_94866 ?auto_94869 ) ) ( not ( = ?auto_94866 ?auto_94868 ) ) ( ON ?auto_94868 ?auto_94867 ) ( not ( = ?auto_94862 ?auto_94867 ) ) ( not ( = ?auto_94863 ?auto_94867 ) ) ( not ( = ?auto_94864 ?auto_94867 ) ) ( not ( = ?auto_94866 ?auto_94867 ) ) ( not ( = ?auto_94865 ?auto_94867 ) ) ( not ( = ?auto_94868 ?auto_94867 ) ) ( not ( = ?auto_94869 ?auto_94867 ) ) ( ON ?auto_94869 ?auto_94868 ) ( CLEAR ?auto_94869 ) ( ON-TABLE ?auto_94867 ) ( HOLDING ?auto_94865 ) ( CLEAR ?auto_94866 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94862 ?auto_94863 ?auto_94864 ?auto_94866 ?auto_94865 )
      ( MAKE-2PILE ?auto_94862 ?auto_94863 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94870 - BLOCK
      ?auto_94871 - BLOCK
    )
    :vars
    (
      ?auto_94877 - BLOCK
      ?auto_94872 - BLOCK
      ?auto_94876 - BLOCK
      ?auto_94873 - BLOCK
      ?auto_94874 - BLOCK
      ?auto_94875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94877 ?auto_94871 ) ( ON-TABLE ?auto_94870 ) ( ON ?auto_94871 ?auto_94870 ) ( not ( = ?auto_94870 ?auto_94871 ) ) ( not ( = ?auto_94870 ?auto_94877 ) ) ( not ( = ?auto_94871 ?auto_94877 ) ) ( not ( = ?auto_94870 ?auto_94872 ) ) ( not ( = ?auto_94870 ?auto_94876 ) ) ( not ( = ?auto_94871 ?auto_94872 ) ) ( not ( = ?auto_94871 ?auto_94876 ) ) ( not ( = ?auto_94877 ?auto_94872 ) ) ( not ( = ?auto_94877 ?auto_94876 ) ) ( not ( = ?auto_94872 ?auto_94876 ) ) ( ON ?auto_94872 ?auto_94877 ) ( not ( = ?auto_94873 ?auto_94874 ) ) ( not ( = ?auto_94873 ?auto_94876 ) ) ( not ( = ?auto_94874 ?auto_94876 ) ) ( not ( = ?auto_94870 ?auto_94874 ) ) ( not ( = ?auto_94870 ?auto_94873 ) ) ( not ( = ?auto_94871 ?auto_94874 ) ) ( not ( = ?auto_94871 ?auto_94873 ) ) ( not ( = ?auto_94877 ?auto_94874 ) ) ( not ( = ?auto_94877 ?auto_94873 ) ) ( not ( = ?auto_94872 ?auto_94874 ) ) ( not ( = ?auto_94872 ?auto_94873 ) ) ( ON ?auto_94873 ?auto_94875 ) ( not ( = ?auto_94870 ?auto_94875 ) ) ( not ( = ?auto_94871 ?auto_94875 ) ) ( not ( = ?auto_94877 ?auto_94875 ) ) ( not ( = ?auto_94872 ?auto_94875 ) ) ( not ( = ?auto_94876 ?auto_94875 ) ) ( not ( = ?auto_94873 ?auto_94875 ) ) ( not ( = ?auto_94874 ?auto_94875 ) ) ( ON ?auto_94874 ?auto_94873 ) ( ON-TABLE ?auto_94875 ) ( CLEAR ?auto_94872 ) ( ON ?auto_94876 ?auto_94874 ) ( CLEAR ?auto_94876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94875 ?auto_94873 ?auto_94874 )
      ( MAKE-2PILE ?auto_94870 ?auto_94871 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94878 - BLOCK
      ?auto_94879 - BLOCK
    )
    :vars
    (
      ?auto_94880 - BLOCK
      ?auto_94882 - BLOCK
      ?auto_94881 - BLOCK
      ?auto_94885 - BLOCK
      ?auto_94884 - BLOCK
      ?auto_94883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94880 ?auto_94879 ) ( ON-TABLE ?auto_94878 ) ( ON ?auto_94879 ?auto_94878 ) ( not ( = ?auto_94878 ?auto_94879 ) ) ( not ( = ?auto_94878 ?auto_94880 ) ) ( not ( = ?auto_94879 ?auto_94880 ) ) ( not ( = ?auto_94878 ?auto_94882 ) ) ( not ( = ?auto_94878 ?auto_94881 ) ) ( not ( = ?auto_94879 ?auto_94882 ) ) ( not ( = ?auto_94879 ?auto_94881 ) ) ( not ( = ?auto_94880 ?auto_94882 ) ) ( not ( = ?auto_94880 ?auto_94881 ) ) ( not ( = ?auto_94882 ?auto_94881 ) ) ( not ( = ?auto_94885 ?auto_94884 ) ) ( not ( = ?auto_94885 ?auto_94881 ) ) ( not ( = ?auto_94884 ?auto_94881 ) ) ( not ( = ?auto_94878 ?auto_94884 ) ) ( not ( = ?auto_94878 ?auto_94885 ) ) ( not ( = ?auto_94879 ?auto_94884 ) ) ( not ( = ?auto_94879 ?auto_94885 ) ) ( not ( = ?auto_94880 ?auto_94884 ) ) ( not ( = ?auto_94880 ?auto_94885 ) ) ( not ( = ?auto_94882 ?auto_94884 ) ) ( not ( = ?auto_94882 ?auto_94885 ) ) ( ON ?auto_94885 ?auto_94883 ) ( not ( = ?auto_94878 ?auto_94883 ) ) ( not ( = ?auto_94879 ?auto_94883 ) ) ( not ( = ?auto_94880 ?auto_94883 ) ) ( not ( = ?auto_94882 ?auto_94883 ) ) ( not ( = ?auto_94881 ?auto_94883 ) ) ( not ( = ?auto_94885 ?auto_94883 ) ) ( not ( = ?auto_94884 ?auto_94883 ) ) ( ON ?auto_94884 ?auto_94885 ) ( ON-TABLE ?auto_94883 ) ( ON ?auto_94881 ?auto_94884 ) ( CLEAR ?auto_94881 ) ( HOLDING ?auto_94882 ) ( CLEAR ?auto_94880 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94878 ?auto_94879 ?auto_94880 ?auto_94882 )
      ( MAKE-2PILE ?auto_94878 ?auto_94879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94886 - BLOCK
      ?auto_94887 - BLOCK
    )
    :vars
    (
      ?auto_94893 - BLOCK
      ?auto_94892 - BLOCK
      ?auto_94888 - BLOCK
      ?auto_94891 - BLOCK
      ?auto_94890 - BLOCK
      ?auto_94889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94893 ?auto_94887 ) ( ON-TABLE ?auto_94886 ) ( ON ?auto_94887 ?auto_94886 ) ( not ( = ?auto_94886 ?auto_94887 ) ) ( not ( = ?auto_94886 ?auto_94893 ) ) ( not ( = ?auto_94887 ?auto_94893 ) ) ( not ( = ?auto_94886 ?auto_94892 ) ) ( not ( = ?auto_94886 ?auto_94888 ) ) ( not ( = ?auto_94887 ?auto_94892 ) ) ( not ( = ?auto_94887 ?auto_94888 ) ) ( not ( = ?auto_94893 ?auto_94892 ) ) ( not ( = ?auto_94893 ?auto_94888 ) ) ( not ( = ?auto_94892 ?auto_94888 ) ) ( not ( = ?auto_94891 ?auto_94890 ) ) ( not ( = ?auto_94891 ?auto_94888 ) ) ( not ( = ?auto_94890 ?auto_94888 ) ) ( not ( = ?auto_94886 ?auto_94890 ) ) ( not ( = ?auto_94886 ?auto_94891 ) ) ( not ( = ?auto_94887 ?auto_94890 ) ) ( not ( = ?auto_94887 ?auto_94891 ) ) ( not ( = ?auto_94893 ?auto_94890 ) ) ( not ( = ?auto_94893 ?auto_94891 ) ) ( not ( = ?auto_94892 ?auto_94890 ) ) ( not ( = ?auto_94892 ?auto_94891 ) ) ( ON ?auto_94891 ?auto_94889 ) ( not ( = ?auto_94886 ?auto_94889 ) ) ( not ( = ?auto_94887 ?auto_94889 ) ) ( not ( = ?auto_94893 ?auto_94889 ) ) ( not ( = ?auto_94892 ?auto_94889 ) ) ( not ( = ?auto_94888 ?auto_94889 ) ) ( not ( = ?auto_94891 ?auto_94889 ) ) ( not ( = ?auto_94890 ?auto_94889 ) ) ( ON ?auto_94890 ?auto_94891 ) ( ON-TABLE ?auto_94889 ) ( ON ?auto_94888 ?auto_94890 ) ( CLEAR ?auto_94893 ) ( ON ?auto_94892 ?auto_94888 ) ( CLEAR ?auto_94892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94889 ?auto_94891 ?auto_94890 ?auto_94888 )
      ( MAKE-2PILE ?auto_94886 ?auto_94887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94910 - BLOCK
      ?auto_94911 - BLOCK
    )
    :vars
    (
      ?auto_94917 - BLOCK
      ?auto_94916 - BLOCK
      ?auto_94914 - BLOCK
      ?auto_94912 - BLOCK
      ?auto_94915 - BLOCK
      ?auto_94913 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94910 ) ( not ( = ?auto_94910 ?auto_94911 ) ) ( not ( = ?auto_94910 ?auto_94917 ) ) ( not ( = ?auto_94911 ?auto_94917 ) ) ( not ( = ?auto_94910 ?auto_94916 ) ) ( not ( = ?auto_94910 ?auto_94914 ) ) ( not ( = ?auto_94911 ?auto_94916 ) ) ( not ( = ?auto_94911 ?auto_94914 ) ) ( not ( = ?auto_94917 ?auto_94916 ) ) ( not ( = ?auto_94917 ?auto_94914 ) ) ( not ( = ?auto_94916 ?auto_94914 ) ) ( not ( = ?auto_94912 ?auto_94915 ) ) ( not ( = ?auto_94912 ?auto_94914 ) ) ( not ( = ?auto_94915 ?auto_94914 ) ) ( not ( = ?auto_94910 ?auto_94915 ) ) ( not ( = ?auto_94910 ?auto_94912 ) ) ( not ( = ?auto_94911 ?auto_94915 ) ) ( not ( = ?auto_94911 ?auto_94912 ) ) ( not ( = ?auto_94917 ?auto_94915 ) ) ( not ( = ?auto_94917 ?auto_94912 ) ) ( not ( = ?auto_94916 ?auto_94915 ) ) ( not ( = ?auto_94916 ?auto_94912 ) ) ( ON ?auto_94912 ?auto_94913 ) ( not ( = ?auto_94910 ?auto_94913 ) ) ( not ( = ?auto_94911 ?auto_94913 ) ) ( not ( = ?auto_94917 ?auto_94913 ) ) ( not ( = ?auto_94916 ?auto_94913 ) ) ( not ( = ?auto_94914 ?auto_94913 ) ) ( not ( = ?auto_94912 ?auto_94913 ) ) ( not ( = ?auto_94915 ?auto_94913 ) ) ( ON ?auto_94915 ?auto_94912 ) ( ON-TABLE ?auto_94913 ) ( ON ?auto_94914 ?auto_94915 ) ( ON ?auto_94916 ?auto_94914 ) ( ON ?auto_94917 ?auto_94916 ) ( CLEAR ?auto_94917 ) ( HOLDING ?auto_94911 ) ( CLEAR ?auto_94910 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94910 ?auto_94911 ?auto_94917 )
      ( MAKE-2PILE ?auto_94910 ?auto_94911 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94918 - BLOCK
      ?auto_94919 - BLOCK
    )
    :vars
    (
      ?auto_94925 - BLOCK
      ?auto_94924 - BLOCK
      ?auto_94923 - BLOCK
      ?auto_94922 - BLOCK
      ?auto_94921 - BLOCK
      ?auto_94920 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94918 ) ( not ( = ?auto_94918 ?auto_94919 ) ) ( not ( = ?auto_94918 ?auto_94925 ) ) ( not ( = ?auto_94919 ?auto_94925 ) ) ( not ( = ?auto_94918 ?auto_94924 ) ) ( not ( = ?auto_94918 ?auto_94923 ) ) ( not ( = ?auto_94919 ?auto_94924 ) ) ( not ( = ?auto_94919 ?auto_94923 ) ) ( not ( = ?auto_94925 ?auto_94924 ) ) ( not ( = ?auto_94925 ?auto_94923 ) ) ( not ( = ?auto_94924 ?auto_94923 ) ) ( not ( = ?auto_94922 ?auto_94921 ) ) ( not ( = ?auto_94922 ?auto_94923 ) ) ( not ( = ?auto_94921 ?auto_94923 ) ) ( not ( = ?auto_94918 ?auto_94921 ) ) ( not ( = ?auto_94918 ?auto_94922 ) ) ( not ( = ?auto_94919 ?auto_94921 ) ) ( not ( = ?auto_94919 ?auto_94922 ) ) ( not ( = ?auto_94925 ?auto_94921 ) ) ( not ( = ?auto_94925 ?auto_94922 ) ) ( not ( = ?auto_94924 ?auto_94921 ) ) ( not ( = ?auto_94924 ?auto_94922 ) ) ( ON ?auto_94922 ?auto_94920 ) ( not ( = ?auto_94918 ?auto_94920 ) ) ( not ( = ?auto_94919 ?auto_94920 ) ) ( not ( = ?auto_94925 ?auto_94920 ) ) ( not ( = ?auto_94924 ?auto_94920 ) ) ( not ( = ?auto_94923 ?auto_94920 ) ) ( not ( = ?auto_94922 ?auto_94920 ) ) ( not ( = ?auto_94921 ?auto_94920 ) ) ( ON ?auto_94921 ?auto_94922 ) ( ON-TABLE ?auto_94920 ) ( ON ?auto_94923 ?auto_94921 ) ( ON ?auto_94924 ?auto_94923 ) ( ON ?auto_94925 ?auto_94924 ) ( CLEAR ?auto_94918 ) ( ON ?auto_94919 ?auto_94925 ) ( CLEAR ?auto_94919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94920 ?auto_94922 ?auto_94921 ?auto_94923 ?auto_94924 ?auto_94925 )
      ( MAKE-2PILE ?auto_94918 ?auto_94919 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94926 - BLOCK
      ?auto_94927 - BLOCK
    )
    :vars
    (
      ?auto_94928 - BLOCK
      ?auto_94933 - BLOCK
      ?auto_94932 - BLOCK
      ?auto_94930 - BLOCK
      ?auto_94929 - BLOCK
      ?auto_94931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94926 ?auto_94927 ) ) ( not ( = ?auto_94926 ?auto_94928 ) ) ( not ( = ?auto_94927 ?auto_94928 ) ) ( not ( = ?auto_94926 ?auto_94933 ) ) ( not ( = ?auto_94926 ?auto_94932 ) ) ( not ( = ?auto_94927 ?auto_94933 ) ) ( not ( = ?auto_94927 ?auto_94932 ) ) ( not ( = ?auto_94928 ?auto_94933 ) ) ( not ( = ?auto_94928 ?auto_94932 ) ) ( not ( = ?auto_94933 ?auto_94932 ) ) ( not ( = ?auto_94930 ?auto_94929 ) ) ( not ( = ?auto_94930 ?auto_94932 ) ) ( not ( = ?auto_94929 ?auto_94932 ) ) ( not ( = ?auto_94926 ?auto_94929 ) ) ( not ( = ?auto_94926 ?auto_94930 ) ) ( not ( = ?auto_94927 ?auto_94929 ) ) ( not ( = ?auto_94927 ?auto_94930 ) ) ( not ( = ?auto_94928 ?auto_94929 ) ) ( not ( = ?auto_94928 ?auto_94930 ) ) ( not ( = ?auto_94933 ?auto_94929 ) ) ( not ( = ?auto_94933 ?auto_94930 ) ) ( ON ?auto_94930 ?auto_94931 ) ( not ( = ?auto_94926 ?auto_94931 ) ) ( not ( = ?auto_94927 ?auto_94931 ) ) ( not ( = ?auto_94928 ?auto_94931 ) ) ( not ( = ?auto_94933 ?auto_94931 ) ) ( not ( = ?auto_94932 ?auto_94931 ) ) ( not ( = ?auto_94930 ?auto_94931 ) ) ( not ( = ?auto_94929 ?auto_94931 ) ) ( ON ?auto_94929 ?auto_94930 ) ( ON-TABLE ?auto_94931 ) ( ON ?auto_94932 ?auto_94929 ) ( ON ?auto_94933 ?auto_94932 ) ( ON ?auto_94928 ?auto_94933 ) ( ON ?auto_94927 ?auto_94928 ) ( CLEAR ?auto_94927 ) ( HOLDING ?auto_94926 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94926 )
      ( MAKE-2PILE ?auto_94926 ?auto_94927 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94934 - BLOCK
      ?auto_94935 - BLOCK
    )
    :vars
    (
      ?auto_94941 - BLOCK
      ?auto_94937 - BLOCK
      ?auto_94938 - BLOCK
      ?auto_94940 - BLOCK
      ?auto_94936 - BLOCK
      ?auto_94939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94934 ?auto_94935 ) ) ( not ( = ?auto_94934 ?auto_94941 ) ) ( not ( = ?auto_94935 ?auto_94941 ) ) ( not ( = ?auto_94934 ?auto_94937 ) ) ( not ( = ?auto_94934 ?auto_94938 ) ) ( not ( = ?auto_94935 ?auto_94937 ) ) ( not ( = ?auto_94935 ?auto_94938 ) ) ( not ( = ?auto_94941 ?auto_94937 ) ) ( not ( = ?auto_94941 ?auto_94938 ) ) ( not ( = ?auto_94937 ?auto_94938 ) ) ( not ( = ?auto_94940 ?auto_94936 ) ) ( not ( = ?auto_94940 ?auto_94938 ) ) ( not ( = ?auto_94936 ?auto_94938 ) ) ( not ( = ?auto_94934 ?auto_94936 ) ) ( not ( = ?auto_94934 ?auto_94940 ) ) ( not ( = ?auto_94935 ?auto_94936 ) ) ( not ( = ?auto_94935 ?auto_94940 ) ) ( not ( = ?auto_94941 ?auto_94936 ) ) ( not ( = ?auto_94941 ?auto_94940 ) ) ( not ( = ?auto_94937 ?auto_94936 ) ) ( not ( = ?auto_94937 ?auto_94940 ) ) ( ON ?auto_94940 ?auto_94939 ) ( not ( = ?auto_94934 ?auto_94939 ) ) ( not ( = ?auto_94935 ?auto_94939 ) ) ( not ( = ?auto_94941 ?auto_94939 ) ) ( not ( = ?auto_94937 ?auto_94939 ) ) ( not ( = ?auto_94938 ?auto_94939 ) ) ( not ( = ?auto_94940 ?auto_94939 ) ) ( not ( = ?auto_94936 ?auto_94939 ) ) ( ON ?auto_94936 ?auto_94940 ) ( ON-TABLE ?auto_94939 ) ( ON ?auto_94938 ?auto_94936 ) ( ON ?auto_94937 ?auto_94938 ) ( ON ?auto_94941 ?auto_94937 ) ( ON ?auto_94935 ?auto_94941 ) ( ON ?auto_94934 ?auto_94935 ) ( CLEAR ?auto_94934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94939 ?auto_94940 ?auto_94936 ?auto_94938 ?auto_94937 ?auto_94941 ?auto_94935 )
      ( MAKE-2PILE ?auto_94934 ?auto_94935 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94947 - BLOCK
      ?auto_94948 - BLOCK
      ?auto_94949 - BLOCK
      ?auto_94950 - BLOCK
      ?auto_94951 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_94951 ) ( CLEAR ?auto_94950 ) ( ON-TABLE ?auto_94947 ) ( ON ?auto_94948 ?auto_94947 ) ( ON ?auto_94949 ?auto_94948 ) ( ON ?auto_94950 ?auto_94949 ) ( not ( = ?auto_94947 ?auto_94948 ) ) ( not ( = ?auto_94947 ?auto_94949 ) ) ( not ( = ?auto_94947 ?auto_94950 ) ) ( not ( = ?auto_94947 ?auto_94951 ) ) ( not ( = ?auto_94948 ?auto_94949 ) ) ( not ( = ?auto_94948 ?auto_94950 ) ) ( not ( = ?auto_94948 ?auto_94951 ) ) ( not ( = ?auto_94949 ?auto_94950 ) ) ( not ( = ?auto_94949 ?auto_94951 ) ) ( not ( = ?auto_94950 ?auto_94951 ) ) )
    :subtasks
    ( ( !STACK ?auto_94951 ?auto_94950 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94952 - BLOCK
      ?auto_94953 - BLOCK
      ?auto_94954 - BLOCK
      ?auto_94955 - BLOCK
      ?auto_94956 - BLOCK
    )
    :vars
    (
      ?auto_94957 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_94955 ) ( ON-TABLE ?auto_94952 ) ( ON ?auto_94953 ?auto_94952 ) ( ON ?auto_94954 ?auto_94953 ) ( ON ?auto_94955 ?auto_94954 ) ( not ( = ?auto_94952 ?auto_94953 ) ) ( not ( = ?auto_94952 ?auto_94954 ) ) ( not ( = ?auto_94952 ?auto_94955 ) ) ( not ( = ?auto_94952 ?auto_94956 ) ) ( not ( = ?auto_94953 ?auto_94954 ) ) ( not ( = ?auto_94953 ?auto_94955 ) ) ( not ( = ?auto_94953 ?auto_94956 ) ) ( not ( = ?auto_94954 ?auto_94955 ) ) ( not ( = ?auto_94954 ?auto_94956 ) ) ( not ( = ?auto_94955 ?auto_94956 ) ) ( ON ?auto_94956 ?auto_94957 ) ( CLEAR ?auto_94956 ) ( HAND-EMPTY ) ( not ( = ?auto_94952 ?auto_94957 ) ) ( not ( = ?auto_94953 ?auto_94957 ) ) ( not ( = ?auto_94954 ?auto_94957 ) ) ( not ( = ?auto_94955 ?auto_94957 ) ) ( not ( = ?auto_94956 ?auto_94957 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94956 ?auto_94957 )
      ( MAKE-5PILE ?auto_94952 ?auto_94953 ?auto_94954 ?auto_94955 ?auto_94956 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94958 - BLOCK
      ?auto_94959 - BLOCK
      ?auto_94960 - BLOCK
      ?auto_94961 - BLOCK
      ?auto_94962 - BLOCK
    )
    :vars
    (
      ?auto_94963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94958 ) ( ON ?auto_94959 ?auto_94958 ) ( ON ?auto_94960 ?auto_94959 ) ( not ( = ?auto_94958 ?auto_94959 ) ) ( not ( = ?auto_94958 ?auto_94960 ) ) ( not ( = ?auto_94958 ?auto_94961 ) ) ( not ( = ?auto_94958 ?auto_94962 ) ) ( not ( = ?auto_94959 ?auto_94960 ) ) ( not ( = ?auto_94959 ?auto_94961 ) ) ( not ( = ?auto_94959 ?auto_94962 ) ) ( not ( = ?auto_94960 ?auto_94961 ) ) ( not ( = ?auto_94960 ?auto_94962 ) ) ( not ( = ?auto_94961 ?auto_94962 ) ) ( ON ?auto_94962 ?auto_94963 ) ( CLEAR ?auto_94962 ) ( not ( = ?auto_94958 ?auto_94963 ) ) ( not ( = ?auto_94959 ?auto_94963 ) ) ( not ( = ?auto_94960 ?auto_94963 ) ) ( not ( = ?auto_94961 ?auto_94963 ) ) ( not ( = ?auto_94962 ?auto_94963 ) ) ( HOLDING ?auto_94961 ) ( CLEAR ?auto_94960 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94958 ?auto_94959 ?auto_94960 ?auto_94961 )
      ( MAKE-5PILE ?auto_94958 ?auto_94959 ?auto_94960 ?auto_94961 ?auto_94962 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94964 - BLOCK
      ?auto_94965 - BLOCK
      ?auto_94966 - BLOCK
      ?auto_94967 - BLOCK
      ?auto_94968 - BLOCK
    )
    :vars
    (
      ?auto_94969 - BLOCK
      ?auto_94970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94964 ) ( ON ?auto_94965 ?auto_94964 ) ( ON ?auto_94966 ?auto_94965 ) ( not ( = ?auto_94964 ?auto_94965 ) ) ( not ( = ?auto_94964 ?auto_94966 ) ) ( not ( = ?auto_94964 ?auto_94967 ) ) ( not ( = ?auto_94964 ?auto_94968 ) ) ( not ( = ?auto_94965 ?auto_94966 ) ) ( not ( = ?auto_94965 ?auto_94967 ) ) ( not ( = ?auto_94965 ?auto_94968 ) ) ( not ( = ?auto_94966 ?auto_94967 ) ) ( not ( = ?auto_94966 ?auto_94968 ) ) ( not ( = ?auto_94967 ?auto_94968 ) ) ( ON ?auto_94968 ?auto_94969 ) ( not ( = ?auto_94964 ?auto_94969 ) ) ( not ( = ?auto_94965 ?auto_94969 ) ) ( not ( = ?auto_94966 ?auto_94969 ) ) ( not ( = ?auto_94967 ?auto_94969 ) ) ( not ( = ?auto_94968 ?auto_94969 ) ) ( CLEAR ?auto_94966 ) ( ON ?auto_94967 ?auto_94968 ) ( CLEAR ?auto_94967 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94970 ) ( ON ?auto_94969 ?auto_94970 ) ( not ( = ?auto_94970 ?auto_94969 ) ) ( not ( = ?auto_94970 ?auto_94968 ) ) ( not ( = ?auto_94970 ?auto_94967 ) ) ( not ( = ?auto_94964 ?auto_94970 ) ) ( not ( = ?auto_94965 ?auto_94970 ) ) ( not ( = ?auto_94966 ?auto_94970 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94970 ?auto_94969 ?auto_94968 )
      ( MAKE-5PILE ?auto_94964 ?auto_94965 ?auto_94966 ?auto_94967 ?auto_94968 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94971 - BLOCK
      ?auto_94972 - BLOCK
      ?auto_94973 - BLOCK
      ?auto_94974 - BLOCK
      ?auto_94975 - BLOCK
    )
    :vars
    (
      ?auto_94976 - BLOCK
      ?auto_94977 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94971 ) ( ON ?auto_94972 ?auto_94971 ) ( not ( = ?auto_94971 ?auto_94972 ) ) ( not ( = ?auto_94971 ?auto_94973 ) ) ( not ( = ?auto_94971 ?auto_94974 ) ) ( not ( = ?auto_94971 ?auto_94975 ) ) ( not ( = ?auto_94972 ?auto_94973 ) ) ( not ( = ?auto_94972 ?auto_94974 ) ) ( not ( = ?auto_94972 ?auto_94975 ) ) ( not ( = ?auto_94973 ?auto_94974 ) ) ( not ( = ?auto_94973 ?auto_94975 ) ) ( not ( = ?auto_94974 ?auto_94975 ) ) ( ON ?auto_94975 ?auto_94976 ) ( not ( = ?auto_94971 ?auto_94976 ) ) ( not ( = ?auto_94972 ?auto_94976 ) ) ( not ( = ?auto_94973 ?auto_94976 ) ) ( not ( = ?auto_94974 ?auto_94976 ) ) ( not ( = ?auto_94975 ?auto_94976 ) ) ( ON ?auto_94974 ?auto_94975 ) ( CLEAR ?auto_94974 ) ( ON-TABLE ?auto_94977 ) ( ON ?auto_94976 ?auto_94977 ) ( not ( = ?auto_94977 ?auto_94976 ) ) ( not ( = ?auto_94977 ?auto_94975 ) ) ( not ( = ?auto_94977 ?auto_94974 ) ) ( not ( = ?auto_94971 ?auto_94977 ) ) ( not ( = ?auto_94972 ?auto_94977 ) ) ( not ( = ?auto_94973 ?auto_94977 ) ) ( HOLDING ?auto_94973 ) ( CLEAR ?auto_94972 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94971 ?auto_94972 ?auto_94973 )
      ( MAKE-5PILE ?auto_94971 ?auto_94972 ?auto_94973 ?auto_94974 ?auto_94975 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94978 - BLOCK
      ?auto_94979 - BLOCK
      ?auto_94980 - BLOCK
      ?auto_94981 - BLOCK
      ?auto_94982 - BLOCK
    )
    :vars
    (
      ?auto_94983 - BLOCK
      ?auto_94984 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94978 ) ( ON ?auto_94979 ?auto_94978 ) ( not ( = ?auto_94978 ?auto_94979 ) ) ( not ( = ?auto_94978 ?auto_94980 ) ) ( not ( = ?auto_94978 ?auto_94981 ) ) ( not ( = ?auto_94978 ?auto_94982 ) ) ( not ( = ?auto_94979 ?auto_94980 ) ) ( not ( = ?auto_94979 ?auto_94981 ) ) ( not ( = ?auto_94979 ?auto_94982 ) ) ( not ( = ?auto_94980 ?auto_94981 ) ) ( not ( = ?auto_94980 ?auto_94982 ) ) ( not ( = ?auto_94981 ?auto_94982 ) ) ( ON ?auto_94982 ?auto_94983 ) ( not ( = ?auto_94978 ?auto_94983 ) ) ( not ( = ?auto_94979 ?auto_94983 ) ) ( not ( = ?auto_94980 ?auto_94983 ) ) ( not ( = ?auto_94981 ?auto_94983 ) ) ( not ( = ?auto_94982 ?auto_94983 ) ) ( ON ?auto_94981 ?auto_94982 ) ( ON-TABLE ?auto_94984 ) ( ON ?auto_94983 ?auto_94984 ) ( not ( = ?auto_94984 ?auto_94983 ) ) ( not ( = ?auto_94984 ?auto_94982 ) ) ( not ( = ?auto_94984 ?auto_94981 ) ) ( not ( = ?auto_94978 ?auto_94984 ) ) ( not ( = ?auto_94979 ?auto_94984 ) ) ( not ( = ?auto_94980 ?auto_94984 ) ) ( CLEAR ?auto_94979 ) ( ON ?auto_94980 ?auto_94981 ) ( CLEAR ?auto_94980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94984 ?auto_94983 ?auto_94982 ?auto_94981 )
      ( MAKE-5PILE ?auto_94978 ?auto_94979 ?auto_94980 ?auto_94981 ?auto_94982 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94985 - BLOCK
      ?auto_94986 - BLOCK
      ?auto_94987 - BLOCK
      ?auto_94988 - BLOCK
      ?auto_94989 - BLOCK
    )
    :vars
    (
      ?auto_94990 - BLOCK
      ?auto_94991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94985 ) ( not ( = ?auto_94985 ?auto_94986 ) ) ( not ( = ?auto_94985 ?auto_94987 ) ) ( not ( = ?auto_94985 ?auto_94988 ) ) ( not ( = ?auto_94985 ?auto_94989 ) ) ( not ( = ?auto_94986 ?auto_94987 ) ) ( not ( = ?auto_94986 ?auto_94988 ) ) ( not ( = ?auto_94986 ?auto_94989 ) ) ( not ( = ?auto_94987 ?auto_94988 ) ) ( not ( = ?auto_94987 ?auto_94989 ) ) ( not ( = ?auto_94988 ?auto_94989 ) ) ( ON ?auto_94989 ?auto_94990 ) ( not ( = ?auto_94985 ?auto_94990 ) ) ( not ( = ?auto_94986 ?auto_94990 ) ) ( not ( = ?auto_94987 ?auto_94990 ) ) ( not ( = ?auto_94988 ?auto_94990 ) ) ( not ( = ?auto_94989 ?auto_94990 ) ) ( ON ?auto_94988 ?auto_94989 ) ( ON-TABLE ?auto_94991 ) ( ON ?auto_94990 ?auto_94991 ) ( not ( = ?auto_94991 ?auto_94990 ) ) ( not ( = ?auto_94991 ?auto_94989 ) ) ( not ( = ?auto_94991 ?auto_94988 ) ) ( not ( = ?auto_94985 ?auto_94991 ) ) ( not ( = ?auto_94986 ?auto_94991 ) ) ( not ( = ?auto_94987 ?auto_94991 ) ) ( ON ?auto_94987 ?auto_94988 ) ( CLEAR ?auto_94987 ) ( HOLDING ?auto_94986 ) ( CLEAR ?auto_94985 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94985 ?auto_94986 )
      ( MAKE-5PILE ?auto_94985 ?auto_94986 ?auto_94987 ?auto_94988 ?auto_94989 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94992 - BLOCK
      ?auto_94993 - BLOCK
      ?auto_94994 - BLOCK
      ?auto_94995 - BLOCK
      ?auto_94996 - BLOCK
    )
    :vars
    (
      ?auto_94997 - BLOCK
      ?auto_94998 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94992 ) ( not ( = ?auto_94992 ?auto_94993 ) ) ( not ( = ?auto_94992 ?auto_94994 ) ) ( not ( = ?auto_94992 ?auto_94995 ) ) ( not ( = ?auto_94992 ?auto_94996 ) ) ( not ( = ?auto_94993 ?auto_94994 ) ) ( not ( = ?auto_94993 ?auto_94995 ) ) ( not ( = ?auto_94993 ?auto_94996 ) ) ( not ( = ?auto_94994 ?auto_94995 ) ) ( not ( = ?auto_94994 ?auto_94996 ) ) ( not ( = ?auto_94995 ?auto_94996 ) ) ( ON ?auto_94996 ?auto_94997 ) ( not ( = ?auto_94992 ?auto_94997 ) ) ( not ( = ?auto_94993 ?auto_94997 ) ) ( not ( = ?auto_94994 ?auto_94997 ) ) ( not ( = ?auto_94995 ?auto_94997 ) ) ( not ( = ?auto_94996 ?auto_94997 ) ) ( ON ?auto_94995 ?auto_94996 ) ( ON-TABLE ?auto_94998 ) ( ON ?auto_94997 ?auto_94998 ) ( not ( = ?auto_94998 ?auto_94997 ) ) ( not ( = ?auto_94998 ?auto_94996 ) ) ( not ( = ?auto_94998 ?auto_94995 ) ) ( not ( = ?auto_94992 ?auto_94998 ) ) ( not ( = ?auto_94993 ?auto_94998 ) ) ( not ( = ?auto_94994 ?auto_94998 ) ) ( ON ?auto_94994 ?auto_94995 ) ( CLEAR ?auto_94992 ) ( ON ?auto_94993 ?auto_94994 ) ( CLEAR ?auto_94993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94998 ?auto_94997 ?auto_94996 ?auto_94995 ?auto_94994 )
      ( MAKE-5PILE ?auto_94992 ?auto_94993 ?auto_94994 ?auto_94995 ?auto_94996 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94999 - BLOCK
      ?auto_95000 - BLOCK
      ?auto_95001 - BLOCK
      ?auto_95002 - BLOCK
      ?auto_95003 - BLOCK
    )
    :vars
    (
      ?auto_95004 - BLOCK
      ?auto_95005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94999 ?auto_95000 ) ) ( not ( = ?auto_94999 ?auto_95001 ) ) ( not ( = ?auto_94999 ?auto_95002 ) ) ( not ( = ?auto_94999 ?auto_95003 ) ) ( not ( = ?auto_95000 ?auto_95001 ) ) ( not ( = ?auto_95000 ?auto_95002 ) ) ( not ( = ?auto_95000 ?auto_95003 ) ) ( not ( = ?auto_95001 ?auto_95002 ) ) ( not ( = ?auto_95001 ?auto_95003 ) ) ( not ( = ?auto_95002 ?auto_95003 ) ) ( ON ?auto_95003 ?auto_95004 ) ( not ( = ?auto_94999 ?auto_95004 ) ) ( not ( = ?auto_95000 ?auto_95004 ) ) ( not ( = ?auto_95001 ?auto_95004 ) ) ( not ( = ?auto_95002 ?auto_95004 ) ) ( not ( = ?auto_95003 ?auto_95004 ) ) ( ON ?auto_95002 ?auto_95003 ) ( ON-TABLE ?auto_95005 ) ( ON ?auto_95004 ?auto_95005 ) ( not ( = ?auto_95005 ?auto_95004 ) ) ( not ( = ?auto_95005 ?auto_95003 ) ) ( not ( = ?auto_95005 ?auto_95002 ) ) ( not ( = ?auto_94999 ?auto_95005 ) ) ( not ( = ?auto_95000 ?auto_95005 ) ) ( not ( = ?auto_95001 ?auto_95005 ) ) ( ON ?auto_95001 ?auto_95002 ) ( ON ?auto_95000 ?auto_95001 ) ( CLEAR ?auto_95000 ) ( HOLDING ?auto_94999 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94999 )
      ( MAKE-5PILE ?auto_94999 ?auto_95000 ?auto_95001 ?auto_95002 ?auto_95003 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95006 - BLOCK
      ?auto_95007 - BLOCK
      ?auto_95008 - BLOCK
      ?auto_95009 - BLOCK
      ?auto_95010 - BLOCK
    )
    :vars
    (
      ?auto_95011 - BLOCK
      ?auto_95012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95006 ?auto_95007 ) ) ( not ( = ?auto_95006 ?auto_95008 ) ) ( not ( = ?auto_95006 ?auto_95009 ) ) ( not ( = ?auto_95006 ?auto_95010 ) ) ( not ( = ?auto_95007 ?auto_95008 ) ) ( not ( = ?auto_95007 ?auto_95009 ) ) ( not ( = ?auto_95007 ?auto_95010 ) ) ( not ( = ?auto_95008 ?auto_95009 ) ) ( not ( = ?auto_95008 ?auto_95010 ) ) ( not ( = ?auto_95009 ?auto_95010 ) ) ( ON ?auto_95010 ?auto_95011 ) ( not ( = ?auto_95006 ?auto_95011 ) ) ( not ( = ?auto_95007 ?auto_95011 ) ) ( not ( = ?auto_95008 ?auto_95011 ) ) ( not ( = ?auto_95009 ?auto_95011 ) ) ( not ( = ?auto_95010 ?auto_95011 ) ) ( ON ?auto_95009 ?auto_95010 ) ( ON-TABLE ?auto_95012 ) ( ON ?auto_95011 ?auto_95012 ) ( not ( = ?auto_95012 ?auto_95011 ) ) ( not ( = ?auto_95012 ?auto_95010 ) ) ( not ( = ?auto_95012 ?auto_95009 ) ) ( not ( = ?auto_95006 ?auto_95012 ) ) ( not ( = ?auto_95007 ?auto_95012 ) ) ( not ( = ?auto_95008 ?auto_95012 ) ) ( ON ?auto_95008 ?auto_95009 ) ( ON ?auto_95007 ?auto_95008 ) ( ON ?auto_95006 ?auto_95007 ) ( CLEAR ?auto_95006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95012 ?auto_95011 ?auto_95010 ?auto_95009 ?auto_95008 ?auto_95007 )
      ( MAKE-5PILE ?auto_95006 ?auto_95007 ?auto_95008 ?auto_95009 ?auto_95010 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95013 - BLOCK
      ?auto_95014 - BLOCK
      ?auto_95015 - BLOCK
      ?auto_95016 - BLOCK
      ?auto_95017 - BLOCK
    )
    :vars
    (
      ?auto_95018 - BLOCK
      ?auto_95019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95013 ?auto_95014 ) ) ( not ( = ?auto_95013 ?auto_95015 ) ) ( not ( = ?auto_95013 ?auto_95016 ) ) ( not ( = ?auto_95013 ?auto_95017 ) ) ( not ( = ?auto_95014 ?auto_95015 ) ) ( not ( = ?auto_95014 ?auto_95016 ) ) ( not ( = ?auto_95014 ?auto_95017 ) ) ( not ( = ?auto_95015 ?auto_95016 ) ) ( not ( = ?auto_95015 ?auto_95017 ) ) ( not ( = ?auto_95016 ?auto_95017 ) ) ( ON ?auto_95017 ?auto_95018 ) ( not ( = ?auto_95013 ?auto_95018 ) ) ( not ( = ?auto_95014 ?auto_95018 ) ) ( not ( = ?auto_95015 ?auto_95018 ) ) ( not ( = ?auto_95016 ?auto_95018 ) ) ( not ( = ?auto_95017 ?auto_95018 ) ) ( ON ?auto_95016 ?auto_95017 ) ( ON-TABLE ?auto_95019 ) ( ON ?auto_95018 ?auto_95019 ) ( not ( = ?auto_95019 ?auto_95018 ) ) ( not ( = ?auto_95019 ?auto_95017 ) ) ( not ( = ?auto_95019 ?auto_95016 ) ) ( not ( = ?auto_95013 ?auto_95019 ) ) ( not ( = ?auto_95014 ?auto_95019 ) ) ( not ( = ?auto_95015 ?auto_95019 ) ) ( ON ?auto_95015 ?auto_95016 ) ( ON ?auto_95014 ?auto_95015 ) ( HOLDING ?auto_95013 ) ( CLEAR ?auto_95014 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95019 ?auto_95018 ?auto_95017 ?auto_95016 ?auto_95015 ?auto_95014 ?auto_95013 )
      ( MAKE-5PILE ?auto_95013 ?auto_95014 ?auto_95015 ?auto_95016 ?auto_95017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95020 - BLOCK
      ?auto_95021 - BLOCK
      ?auto_95022 - BLOCK
      ?auto_95023 - BLOCK
      ?auto_95024 - BLOCK
    )
    :vars
    (
      ?auto_95025 - BLOCK
      ?auto_95026 - BLOCK
      ?auto_95027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95020 ?auto_95021 ) ) ( not ( = ?auto_95020 ?auto_95022 ) ) ( not ( = ?auto_95020 ?auto_95023 ) ) ( not ( = ?auto_95020 ?auto_95024 ) ) ( not ( = ?auto_95021 ?auto_95022 ) ) ( not ( = ?auto_95021 ?auto_95023 ) ) ( not ( = ?auto_95021 ?auto_95024 ) ) ( not ( = ?auto_95022 ?auto_95023 ) ) ( not ( = ?auto_95022 ?auto_95024 ) ) ( not ( = ?auto_95023 ?auto_95024 ) ) ( ON ?auto_95024 ?auto_95025 ) ( not ( = ?auto_95020 ?auto_95025 ) ) ( not ( = ?auto_95021 ?auto_95025 ) ) ( not ( = ?auto_95022 ?auto_95025 ) ) ( not ( = ?auto_95023 ?auto_95025 ) ) ( not ( = ?auto_95024 ?auto_95025 ) ) ( ON ?auto_95023 ?auto_95024 ) ( ON-TABLE ?auto_95026 ) ( ON ?auto_95025 ?auto_95026 ) ( not ( = ?auto_95026 ?auto_95025 ) ) ( not ( = ?auto_95026 ?auto_95024 ) ) ( not ( = ?auto_95026 ?auto_95023 ) ) ( not ( = ?auto_95020 ?auto_95026 ) ) ( not ( = ?auto_95021 ?auto_95026 ) ) ( not ( = ?auto_95022 ?auto_95026 ) ) ( ON ?auto_95022 ?auto_95023 ) ( ON ?auto_95021 ?auto_95022 ) ( CLEAR ?auto_95021 ) ( ON ?auto_95020 ?auto_95027 ) ( CLEAR ?auto_95020 ) ( HAND-EMPTY ) ( not ( = ?auto_95020 ?auto_95027 ) ) ( not ( = ?auto_95021 ?auto_95027 ) ) ( not ( = ?auto_95022 ?auto_95027 ) ) ( not ( = ?auto_95023 ?auto_95027 ) ) ( not ( = ?auto_95024 ?auto_95027 ) ) ( not ( = ?auto_95025 ?auto_95027 ) ) ( not ( = ?auto_95026 ?auto_95027 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95020 ?auto_95027 )
      ( MAKE-5PILE ?auto_95020 ?auto_95021 ?auto_95022 ?auto_95023 ?auto_95024 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95028 - BLOCK
      ?auto_95029 - BLOCK
      ?auto_95030 - BLOCK
      ?auto_95031 - BLOCK
      ?auto_95032 - BLOCK
    )
    :vars
    (
      ?auto_95035 - BLOCK
      ?auto_95033 - BLOCK
      ?auto_95034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95028 ?auto_95029 ) ) ( not ( = ?auto_95028 ?auto_95030 ) ) ( not ( = ?auto_95028 ?auto_95031 ) ) ( not ( = ?auto_95028 ?auto_95032 ) ) ( not ( = ?auto_95029 ?auto_95030 ) ) ( not ( = ?auto_95029 ?auto_95031 ) ) ( not ( = ?auto_95029 ?auto_95032 ) ) ( not ( = ?auto_95030 ?auto_95031 ) ) ( not ( = ?auto_95030 ?auto_95032 ) ) ( not ( = ?auto_95031 ?auto_95032 ) ) ( ON ?auto_95032 ?auto_95035 ) ( not ( = ?auto_95028 ?auto_95035 ) ) ( not ( = ?auto_95029 ?auto_95035 ) ) ( not ( = ?auto_95030 ?auto_95035 ) ) ( not ( = ?auto_95031 ?auto_95035 ) ) ( not ( = ?auto_95032 ?auto_95035 ) ) ( ON ?auto_95031 ?auto_95032 ) ( ON-TABLE ?auto_95033 ) ( ON ?auto_95035 ?auto_95033 ) ( not ( = ?auto_95033 ?auto_95035 ) ) ( not ( = ?auto_95033 ?auto_95032 ) ) ( not ( = ?auto_95033 ?auto_95031 ) ) ( not ( = ?auto_95028 ?auto_95033 ) ) ( not ( = ?auto_95029 ?auto_95033 ) ) ( not ( = ?auto_95030 ?auto_95033 ) ) ( ON ?auto_95030 ?auto_95031 ) ( ON ?auto_95028 ?auto_95034 ) ( CLEAR ?auto_95028 ) ( not ( = ?auto_95028 ?auto_95034 ) ) ( not ( = ?auto_95029 ?auto_95034 ) ) ( not ( = ?auto_95030 ?auto_95034 ) ) ( not ( = ?auto_95031 ?auto_95034 ) ) ( not ( = ?auto_95032 ?auto_95034 ) ) ( not ( = ?auto_95035 ?auto_95034 ) ) ( not ( = ?auto_95033 ?auto_95034 ) ) ( HOLDING ?auto_95029 ) ( CLEAR ?auto_95030 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95033 ?auto_95035 ?auto_95032 ?auto_95031 ?auto_95030 ?auto_95029 )
      ( MAKE-5PILE ?auto_95028 ?auto_95029 ?auto_95030 ?auto_95031 ?auto_95032 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95036 - BLOCK
      ?auto_95037 - BLOCK
      ?auto_95038 - BLOCK
      ?auto_95039 - BLOCK
      ?auto_95040 - BLOCK
    )
    :vars
    (
      ?auto_95041 - BLOCK
      ?auto_95043 - BLOCK
      ?auto_95042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95036 ?auto_95037 ) ) ( not ( = ?auto_95036 ?auto_95038 ) ) ( not ( = ?auto_95036 ?auto_95039 ) ) ( not ( = ?auto_95036 ?auto_95040 ) ) ( not ( = ?auto_95037 ?auto_95038 ) ) ( not ( = ?auto_95037 ?auto_95039 ) ) ( not ( = ?auto_95037 ?auto_95040 ) ) ( not ( = ?auto_95038 ?auto_95039 ) ) ( not ( = ?auto_95038 ?auto_95040 ) ) ( not ( = ?auto_95039 ?auto_95040 ) ) ( ON ?auto_95040 ?auto_95041 ) ( not ( = ?auto_95036 ?auto_95041 ) ) ( not ( = ?auto_95037 ?auto_95041 ) ) ( not ( = ?auto_95038 ?auto_95041 ) ) ( not ( = ?auto_95039 ?auto_95041 ) ) ( not ( = ?auto_95040 ?auto_95041 ) ) ( ON ?auto_95039 ?auto_95040 ) ( ON-TABLE ?auto_95043 ) ( ON ?auto_95041 ?auto_95043 ) ( not ( = ?auto_95043 ?auto_95041 ) ) ( not ( = ?auto_95043 ?auto_95040 ) ) ( not ( = ?auto_95043 ?auto_95039 ) ) ( not ( = ?auto_95036 ?auto_95043 ) ) ( not ( = ?auto_95037 ?auto_95043 ) ) ( not ( = ?auto_95038 ?auto_95043 ) ) ( ON ?auto_95038 ?auto_95039 ) ( ON ?auto_95036 ?auto_95042 ) ( not ( = ?auto_95036 ?auto_95042 ) ) ( not ( = ?auto_95037 ?auto_95042 ) ) ( not ( = ?auto_95038 ?auto_95042 ) ) ( not ( = ?auto_95039 ?auto_95042 ) ) ( not ( = ?auto_95040 ?auto_95042 ) ) ( not ( = ?auto_95041 ?auto_95042 ) ) ( not ( = ?auto_95043 ?auto_95042 ) ) ( CLEAR ?auto_95038 ) ( ON ?auto_95037 ?auto_95036 ) ( CLEAR ?auto_95037 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95042 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95042 ?auto_95036 )
      ( MAKE-5PILE ?auto_95036 ?auto_95037 ?auto_95038 ?auto_95039 ?auto_95040 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95044 - BLOCK
      ?auto_95045 - BLOCK
      ?auto_95046 - BLOCK
      ?auto_95047 - BLOCK
      ?auto_95048 - BLOCK
    )
    :vars
    (
      ?auto_95050 - BLOCK
      ?auto_95051 - BLOCK
      ?auto_95049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95044 ?auto_95045 ) ) ( not ( = ?auto_95044 ?auto_95046 ) ) ( not ( = ?auto_95044 ?auto_95047 ) ) ( not ( = ?auto_95044 ?auto_95048 ) ) ( not ( = ?auto_95045 ?auto_95046 ) ) ( not ( = ?auto_95045 ?auto_95047 ) ) ( not ( = ?auto_95045 ?auto_95048 ) ) ( not ( = ?auto_95046 ?auto_95047 ) ) ( not ( = ?auto_95046 ?auto_95048 ) ) ( not ( = ?auto_95047 ?auto_95048 ) ) ( ON ?auto_95048 ?auto_95050 ) ( not ( = ?auto_95044 ?auto_95050 ) ) ( not ( = ?auto_95045 ?auto_95050 ) ) ( not ( = ?auto_95046 ?auto_95050 ) ) ( not ( = ?auto_95047 ?auto_95050 ) ) ( not ( = ?auto_95048 ?auto_95050 ) ) ( ON ?auto_95047 ?auto_95048 ) ( ON-TABLE ?auto_95051 ) ( ON ?auto_95050 ?auto_95051 ) ( not ( = ?auto_95051 ?auto_95050 ) ) ( not ( = ?auto_95051 ?auto_95048 ) ) ( not ( = ?auto_95051 ?auto_95047 ) ) ( not ( = ?auto_95044 ?auto_95051 ) ) ( not ( = ?auto_95045 ?auto_95051 ) ) ( not ( = ?auto_95046 ?auto_95051 ) ) ( ON ?auto_95044 ?auto_95049 ) ( not ( = ?auto_95044 ?auto_95049 ) ) ( not ( = ?auto_95045 ?auto_95049 ) ) ( not ( = ?auto_95046 ?auto_95049 ) ) ( not ( = ?auto_95047 ?auto_95049 ) ) ( not ( = ?auto_95048 ?auto_95049 ) ) ( not ( = ?auto_95050 ?auto_95049 ) ) ( not ( = ?auto_95051 ?auto_95049 ) ) ( ON ?auto_95045 ?auto_95044 ) ( CLEAR ?auto_95045 ) ( ON-TABLE ?auto_95049 ) ( HOLDING ?auto_95046 ) ( CLEAR ?auto_95047 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95051 ?auto_95050 ?auto_95048 ?auto_95047 ?auto_95046 )
      ( MAKE-5PILE ?auto_95044 ?auto_95045 ?auto_95046 ?auto_95047 ?auto_95048 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95052 - BLOCK
      ?auto_95053 - BLOCK
      ?auto_95054 - BLOCK
      ?auto_95055 - BLOCK
      ?auto_95056 - BLOCK
    )
    :vars
    (
      ?auto_95057 - BLOCK
      ?auto_95059 - BLOCK
      ?auto_95058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95052 ?auto_95053 ) ) ( not ( = ?auto_95052 ?auto_95054 ) ) ( not ( = ?auto_95052 ?auto_95055 ) ) ( not ( = ?auto_95052 ?auto_95056 ) ) ( not ( = ?auto_95053 ?auto_95054 ) ) ( not ( = ?auto_95053 ?auto_95055 ) ) ( not ( = ?auto_95053 ?auto_95056 ) ) ( not ( = ?auto_95054 ?auto_95055 ) ) ( not ( = ?auto_95054 ?auto_95056 ) ) ( not ( = ?auto_95055 ?auto_95056 ) ) ( ON ?auto_95056 ?auto_95057 ) ( not ( = ?auto_95052 ?auto_95057 ) ) ( not ( = ?auto_95053 ?auto_95057 ) ) ( not ( = ?auto_95054 ?auto_95057 ) ) ( not ( = ?auto_95055 ?auto_95057 ) ) ( not ( = ?auto_95056 ?auto_95057 ) ) ( ON ?auto_95055 ?auto_95056 ) ( ON-TABLE ?auto_95059 ) ( ON ?auto_95057 ?auto_95059 ) ( not ( = ?auto_95059 ?auto_95057 ) ) ( not ( = ?auto_95059 ?auto_95056 ) ) ( not ( = ?auto_95059 ?auto_95055 ) ) ( not ( = ?auto_95052 ?auto_95059 ) ) ( not ( = ?auto_95053 ?auto_95059 ) ) ( not ( = ?auto_95054 ?auto_95059 ) ) ( ON ?auto_95052 ?auto_95058 ) ( not ( = ?auto_95052 ?auto_95058 ) ) ( not ( = ?auto_95053 ?auto_95058 ) ) ( not ( = ?auto_95054 ?auto_95058 ) ) ( not ( = ?auto_95055 ?auto_95058 ) ) ( not ( = ?auto_95056 ?auto_95058 ) ) ( not ( = ?auto_95057 ?auto_95058 ) ) ( not ( = ?auto_95059 ?auto_95058 ) ) ( ON ?auto_95053 ?auto_95052 ) ( ON-TABLE ?auto_95058 ) ( CLEAR ?auto_95055 ) ( ON ?auto_95054 ?auto_95053 ) ( CLEAR ?auto_95054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95058 ?auto_95052 ?auto_95053 )
      ( MAKE-5PILE ?auto_95052 ?auto_95053 ?auto_95054 ?auto_95055 ?auto_95056 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95060 - BLOCK
      ?auto_95061 - BLOCK
      ?auto_95062 - BLOCK
      ?auto_95063 - BLOCK
      ?auto_95064 - BLOCK
    )
    :vars
    (
      ?auto_95067 - BLOCK
      ?auto_95066 - BLOCK
      ?auto_95065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95060 ?auto_95061 ) ) ( not ( = ?auto_95060 ?auto_95062 ) ) ( not ( = ?auto_95060 ?auto_95063 ) ) ( not ( = ?auto_95060 ?auto_95064 ) ) ( not ( = ?auto_95061 ?auto_95062 ) ) ( not ( = ?auto_95061 ?auto_95063 ) ) ( not ( = ?auto_95061 ?auto_95064 ) ) ( not ( = ?auto_95062 ?auto_95063 ) ) ( not ( = ?auto_95062 ?auto_95064 ) ) ( not ( = ?auto_95063 ?auto_95064 ) ) ( ON ?auto_95064 ?auto_95067 ) ( not ( = ?auto_95060 ?auto_95067 ) ) ( not ( = ?auto_95061 ?auto_95067 ) ) ( not ( = ?auto_95062 ?auto_95067 ) ) ( not ( = ?auto_95063 ?auto_95067 ) ) ( not ( = ?auto_95064 ?auto_95067 ) ) ( ON-TABLE ?auto_95066 ) ( ON ?auto_95067 ?auto_95066 ) ( not ( = ?auto_95066 ?auto_95067 ) ) ( not ( = ?auto_95066 ?auto_95064 ) ) ( not ( = ?auto_95066 ?auto_95063 ) ) ( not ( = ?auto_95060 ?auto_95066 ) ) ( not ( = ?auto_95061 ?auto_95066 ) ) ( not ( = ?auto_95062 ?auto_95066 ) ) ( ON ?auto_95060 ?auto_95065 ) ( not ( = ?auto_95060 ?auto_95065 ) ) ( not ( = ?auto_95061 ?auto_95065 ) ) ( not ( = ?auto_95062 ?auto_95065 ) ) ( not ( = ?auto_95063 ?auto_95065 ) ) ( not ( = ?auto_95064 ?auto_95065 ) ) ( not ( = ?auto_95067 ?auto_95065 ) ) ( not ( = ?auto_95066 ?auto_95065 ) ) ( ON ?auto_95061 ?auto_95060 ) ( ON-TABLE ?auto_95065 ) ( ON ?auto_95062 ?auto_95061 ) ( CLEAR ?auto_95062 ) ( HOLDING ?auto_95063 ) ( CLEAR ?auto_95064 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95066 ?auto_95067 ?auto_95064 ?auto_95063 )
      ( MAKE-5PILE ?auto_95060 ?auto_95061 ?auto_95062 ?auto_95063 ?auto_95064 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95068 - BLOCK
      ?auto_95069 - BLOCK
      ?auto_95070 - BLOCK
      ?auto_95071 - BLOCK
      ?auto_95072 - BLOCK
    )
    :vars
    (
      ?auto_95074 - BLOCK
      ?auto_95075 - BLOCK
      ?auto_95073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95068 ?auto_95069 ) ) ( not ( = ?auto_95068 ?auto_95070 ) ) ( not ( = ?auto_95068 ?auto_95071 ) ) ( not ( = ?auto_95068 ?auto_95072 ) ) ( not ( = ?auto_95069 ?auto_95070 ) ) ( not ( = ?auto_95069 ?auto_95071 ) ) ( not ( = ?auto_95069 ?auto_95072 ) ) ( not ( = ?auto_95070 ?auto_95071 ) ) ( not ( = ?auto_95070 ?auto_95072 ) ) ( not ( = ?auto_95071 ?auto_95072 ) ) ( ON ?auto_95072 ?auto_95074 ) ( not ( = ?auto_95068 ?auto_95074 ) ) ( not ( = ?auto_95069 ?auto_95074 ) ) ( not ( = ?auto_95070 ?auto_95074 ) ) ( not ( = ?auto_95071 ?auto_95074 ) ) ( not ( = ?auto_95072 ?auto_95074 ) ) ( ON-TABLE ?auto_95075 ) ( ON ?auto_95074 ?auto_95075 ) ( not ( = ?auto_95075 ?auto_95074 ) ) ( not ( = ?auto_95075 ?auto_95072 ) ) ( not ( = ?auto_95075 ?auto_95071 ) ) ( not ( = ?auto_95068 ?auto_95075 ) ) ( not ( = ?auto_95069 ?auto_95075 ) ) ( not ( = ?auto_95070 ?auto_95075 ) ) ( ON ?auto_95068 ?auto_95073 ) ( not ( = ?auto_95068 ?auto_95073 ) ) ( not ( = ?auto_95069 ?auto_95073 ) ) ( not ( = ?auto_95070 ?auto_95073 ) ) ( not ( = ?auto_95071 ?auto_95073 ) ) ( not ( = ?auto_95072 ?auto_95073 ) ) ( not ( = ?auto_95074 ?auto_95073 ) ) ( not ( = ?auto_95075 ?auto_95073 ) ) ( ON ?auto_95069 ?auto_95068 ) ( ON-TABLE ?auto_95073 ) ( ON ?auto_95070 ?auto_95069 ) ( CLEAR ?auto_95072 ) ( ON ?auto_95071 ?auto_95070 ) ( CLEAR ?auto_95071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95073 ?auto_95068 ?auto_95069 ?auto_95070 )
      ( MAKE-5PILE ?auto_95068 ?auto_95069 ?auto_95070 ?auto_95071 ?auto_95072 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95076 - BLOCK
      ?auto_95077 - BLOCK
      ?auto_95078 - BLOCK
      ?auto_95079 - BLOCK
      ?auto_95080 - BLOCK
    )
    :vars
    (
      ?auto_95082 - BLOCK
      ?auto_95083 - BLOCK
      ?auto_95081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95076 ?auto_95077 ) ) ( not ( = ?auto_95076 ?auto_95078 ) ) ( not ( = ?auto_95076 ?auto_95079 ) ) ( not ( = ?auto_95076 ?auto_95080 ) ) ( not ( = ?auto_95077 ?auto_95078 ) ) ( not ( = ?auto_95077 ?auto_95079 ) ) ( not ( = ?auto_95077 ?auto_95080 ) ) ( not ( = ?auto_95078 ?auto_95079 ) ) ( not ( = ?auto_95078 ?auto_95080 ) ) ( not ( = ?auto_95079 ?auto_95080 ) ) ( not ( = ?auto_95076 ?auto_95082 ) ) ( not ( = ?auto_95077 ?auto_95082 ) ) ( not ( = ?auto_95078 ?auto_95082 ) ) ( not ( = ?auto_95079 ?auto_95082 ) ) ( not ( = ?auto_95080 ?auto_95082 ) ) ( ON-TABLE ?auto_95083 ) ( ON ?auto_95082 ?auto_95083 ) ( not ( = ?auto_95083 ?auto_95082 ) ) ( not ( = ?auto_95083 ?auto_95080 ) ) ( not ( = ?auto_95083 ?auto_95079 ) ) ( not ( = ?auto_95076 ?auto_95083 ) ) ( not ( = ?auto_95077 ?auto_95083 ) ) ( not ( = ?auto_95078 ?auto_95083 ) ) ( ON ?auto_95076 ?auto_95081 ) ( not ( = ?auto_95076 ?auto_95081 ) ) ( not ( = ?auto_95077 ?auto_95081 ) ) ( not ( = ?auto_95078 ?auto_95081 ) ) ( not ( = ?auto_95079 ?auto_95081 ) ) ( not ( = ?auto_95080 ?auto_95081 ) ) ( not ( = ?auto_95082 ?auto_95081 ) ) ( not ( = ?auto_95083 ?auto_95081 ) ) ( ON ?auto_95077 ?auto_95076 ) ( ON-TABLE ?auto_95081 ) ( ON ?auto_95078 ?auto_95077 ) ( ON ?auto_95079 ?auto_95078 ) ( CLEAR ?auto_95079 ) ( HOLDING ?auto_95080 ) ( CLEAR ?auto_95082 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95083 ?auto_95082 ?auto_95080 )
      ( MAKE-5PILE ?auto_95076 ?auto_95077 ?auto_95078 ?auto_95079 ?auto_95080 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95084 - BLOCK
      ?auto_95085 - BLOCK
      ?auto_95086 - BLOCK
      ?auto_95087 - BLOCK
      ?auto_95088 - BLOCK
    )
    :vars
    (
      ?auto_95091 - BLOCK
      ?auto_95090 - BLOCK
      ?auto_95089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95084 ?auto_95085 ) ) ( not ( = ?auto_95084 ?auto_95086 ) ) ( not ( = ?auto_95084 ?auto_95087 ) ) ( not ( = ?auto_95084 ?auto_95088 ) ) ( not ( = ?auto_95085 ?auto_95086 ) ) ( not ( = ?auto_95085 ?auto_95087 ) ) ( not ( = ?auto_95085 ?auto_95088 ) ) ( not ( = ?auto_95086 ?auto_95087 ) ) ( not ( = ?auto_95086 ?auto_95088 ) ) ( not ( = ?auto_95087 ?auto_95088 ) ) ( not ( = ?auto_95084 ?auto_95091 ) ) ( not ( = ?auto_95085 ?auto_95091 ) ) ( not ( = ?auto_95086 ?auto_95091 ) ) ( not ( = ?auto_95087 ?auto_95091 ) ) ( not ( = ?auto_95088 ?auto_95091 ) ) ( ON-TABLE ?auto_95090 ) ( ON ?auto_95091 ?auto_95090 ) ( not ( = ?auto_95090 ?auto_95091 ) ) ( not ( = ?auto_95090 ?auto_95088 ) ) ( not ( = ?auto_95090 ?auto_95087 ) ) ( not ( = ?auto_95084 ?auto_95090 ) ) ( not ( = ?auto_95085 ?auto_95090 ) ) ( not ( = ?auto_95086 ?auto_95090 ) ) ( ON ?auto_95084 ?auto_95089 ) ( not ( = ?auto_95084 ?auto_95089 ) ) ( not ( = ?auto_95085 ?auto_95089 ) ) ( not ( = ?auto_95086 ?auto_95089 ) ) ( not ( = ?auto_95087 ?auto_95089 ) ) ( not ( = ?auto_95088 ?auto_95089 ) ) ( not ( = ?auto_95091 ?auto_95089 ) ) ( not ( = ?auto_95090 ?auto_95089 ) ) ( ON ?auto_95085 ?auto_95084 ) ( ON-TABLE ?auto_95089 ) ( ON ?auto_95086 ?auto_95085 ) ( ON ?auto_95087 ?auto_95086 ) ( CLEAR ?auto_95091 ) ( ON ?auto_95088 ?auto_95087 ) ( CLEAR ?auto_95088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95089 ?auto_95084 ?auto_95085 ?auto_95086 ?auto_95087 )
      ( MAKE-5PILE ?auto_95084 ?auto_95085 ?auto_95086 ?auto_95087 ?auto_95088 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95092 - BLOCK
      ?auto_95093 - BLOCK
      ?auto_95094 - BLOCK
      ?auto_95095 - BLOCK
      ?auto_95096 - BLOCK
    )
    :vars
    (
      ?auto_95098 - BLOCK
      ?auto_95097 - BLOCK
      ?auto_95099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95092 ?auto_95093 ) ) ( not ( = ?auto_95092 ?auto_95094 ) ) ( not ( = ?auto_95092 ?auto_95095 ) ) ( not ( = ?auto_95092 ?auto_95096 ) ) ( not ( = ?auto_95093 ?auto_95094 ) ) ( not ( = ?auto_95093 ?auto_95095 ) ) ( not ( = ?auto_95093 ?auto_95096 ) ) ( not ( = ?auto_95094 ?auto_95095 ) ) ( not ( = ?auto_95094 ?auto_95096 ) ) ( not ( = ?auto_95095 ?auto_95096 ) ) ( not ( = ?auto_95092 ?auto_95098 ) ) ( not ( = ?auto_95093 ?auto_95098 ) ) ( not ( = ?auto_95094 ?auto_95098 ) ) ( not ( = ?auto_95095 ?auto_95098 ) ) ( not ( = ?auto_95096 ?auto_95098 ) ) ( ON-TABLE ?auto_95097 ) ( not ( = ?auto_95097 ?auto_95098 ) ) ( not ( = ?auto_95097 ?auto_95096 ) ) ( not ( = ?auto_95097 ?auto_95095 ) ) ( not ( = ?auto_95092 ?auto_95097 ) ) ( not ( = ?auto_95093 ?auto_95097 ) ) ( not ( = ?auto_95094 ?auto_95097 ) ) ( ON ?auto_95092 ?auto_95099 ) ( not ( = ?auto_95092 ?auto_95099 ) ) ( not ( = ?auto_95093 ?auto_95099 ) ) ( not ( = ?auto_95094 ?auto_95099 ) ) ( not ( = ?auto_95095 ?auto_95099 ) ) ( not ( = ?auto_95096 ?auto_95099 ) ) ( not ( = ?auto_95098 ?auto_95099 ) ) ( not ( = ?auto_95097 ?auto_95099 ) ) ( ON ?auto_95093 ?auto_95092 ) ( ON-TABLE ?auto_95099 ) ( ON ?auto_95094 ?auto_95093 ) ( ON ?auto_95095 ?auto_95094 ) ( ON ?auto_95096 ?auto_95095 ) ( CLEAR ?auto_95096 ) ( HOLDING ?auto_95098 ) ( CLEAR ?auto_95097 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95097 ?auto_95098 )
      ( MAKE-5PILE ?auto_95092 ?auto_95093 ?auto_95094 ?auto_95095 ?auto_95096 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95100 - BLOCK
      ?auto_95101 - BLOCK
      ?auto_95102 - BLOCK
      ?auto_95103 - BLOCK
      ?auto_95104 - BLOCK
    )
    :vars
    (
      ?auto_95105 - BLOCK
      ?auto_95106 - BLOCK
      ?auto_95107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95100 ?auto_95101 ) ) ( not ( = ?auto_95100 ?auto_95102 ) ) ( not ( = ?auto_95100 ?auto_95103 ) ) ( not ( = ?auto_95100 ?auto_95104 ) ) ( not ( = ?auto_95101 ?auto_95102 ) ) ( not ( = ?auto_95101 ?auto_95103 ) ) ( not ( = ?auto_95101 ?auto_95104 ) ) ( not ( = ?auto_95102 ?auto_95103 ) ) ( not ( = ?auto_95102 ?auto_95104 ) ) ( not ( = ?auto_95103 ?auto_95104 ) ) ( not ( = ?auto_95100 ?auto_95105 ) ) ( not ( = ?auto_95101 ?auto_95105 ) ) ( not ( = ?auto_95102 ?auto_95105 ) ) ( not ( = ?auto_95103 ?auto_95105 ) ) ( not ( = ?auto_95104 ?auto_95105 ) ) ( ON-TABLE ?auto_95106 ) ( not ( = ?auto_95106 ?auto_95105 ) ) ( not ( = ?auto_95106 ?auto_95104 ) ) ( not ( = ?auto_95106 ?auto_95103 ) ) ( not ( = ?auto_95100 ?auto_95106 ) ) ( not ( = ?auto_95101 ?auto_95106 ) ) ( not ( = ?auto_95102 ?auto_95106 ) ) ( ON ?auto_95100 ?auto_95107 ) ( not ( = ?auto_95100 ?auto_95107 ) ) ( not ( = ?auto_95101 ?auto_95107 ) ) ( not ( = ?auto_95102 ?auto_95107 ) ) ( not ( = ?auto_95103 ?auto_95107 ) ) ( not ( = ?auto_95104 ?auto_95107 ) ) ( not ( = ?auto_95105 ?auto_95107 ) ) ( not ( = ?auto_95106 ?auto_95107 ) ) ( ON ?auto_95101 ?auto_95100 ) ( ON-TABLE ?auto_95107 ) ( ON ?auto_95102 ?auto_95101 ) ( ON ?auto_95103 ?auto_95102 ) ( ON ?auto_95104 ?auto_95103 ) ( CLEAR ?auto_95106 ) ( ON ?auto_95105 ?auto_95104 ) ( CLEAR ?auto_95105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95107 ?auto_95100 ?auto_95101 ?auto_95102 ?auto_95103 ?auto_95104 )
      ( MAKE-5PILE ?auto_95100 ?auto_95101 ?auto_95102 ?auto_95103 ?auto_95104 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95108 - BLOCK
      ?auto_95109 - BLOCK
      ?auto_95110 - BLOCK
      ?auto_95111 - BLOCK
      ?auto_95112 - BLOCK
    )
    :vars
    (
      ?auto_95114 - BLOCK
      ?auto_95115 - BLOCK
      ?auto_95113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95108 ?auto_95109 ) ) ( not ( = ?auto_95108 ?auto_95110 ) ) ( not ( = ?auto_95108 ?auto_95111 ) ) ( not ( = ?auto_95108 ?auto_95112 ) ) ( not ( = ?auto_95109 ?auto_95110 ) ) ( not ( = ?auto_95109 ?auto_95111 ) ) ( not ( = ?auto_95109 ?auto_95112 ) ) ( not ( = ?auto_95110 ?auto_95111 ) ) ( not ( = ?auto_95110 ?auto_95112 ) ) ( not ( = ?auto_95111 ?auto_95112 ) ) ( not ( = ?auto_95108 ?auto_95114 ) ) ( not ( = ?auto_95109 ?auto_95114 ) ) ( not ( = ?auto_95110 ?auto_95114 ) ) ( not ( = ?auto_95111 ?auto_95114 ) ) ( not ( = ?auto_95112 ?auto_95114 ) ) ( not ( = ?auto_95115 ?auto_95114 ) ) ( not ( = ?auto_95115 ?auto_95112 ) ) ( not ( = ?auto_95115 ?auto_95111 ) ) ( not ( = ?auto_95108 ?auto_95115 ) ) ( not ( = ?auto_95109 ?auto_95115 ) ) ( not ( = ?auto_95110 ?auto_95115 ) ) ( ON ?auto_95108 ?auto_95113 ) ( not ( = ?auto_95108 ?auto_95113 ) ) ( not ( = ?auto_95109 ?auto_95113 ) ) ( not ( = ?auto_95110 ?auto_95113 ) ) ( not ( = ?auto_95111 ?auto_95113 ) ) ( not ( = ?auto_95112 ?auto_95113 ) ) ( not ( = ?auto_95114 ?auto_95113 ) ) ( not ( = ?auto_95115 ?auto_95113 ) ) ( ON ?auto_95109 ?auto_95108 ) ( ON-TABLE ?auto_95113 ) ( ON ?auto_95110 ?auto_95109 ) ( ON ?auto_95111 ?auto_95110 ) ( ON ?auto_95112 ?auto_95111 ) ( ON ?auto_95114 ?auto_95112 ) ( CLEAR ?auto_95114 ) ( HOLDING ?auto_95115 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95115 )
      ( MAKE-5PILE ?auto_95108 ?auto_95109 ?auto_95110 ?auto_95111 ?auto_95112 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95116 - BLOCK
      ?auto_95117 - BLOCK
      ?auto_95118 - BLOCK
      ?auto_95119 - BLOCK
      ?auto_95120 - BLOCK
    )
    :vars
    (
      ?auto_95123 - BLOCK
      ?auto_95121 - BLOCK
      ?auto_95122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95116 ?auto_95117 ) ) ( not ( = ?auto_95116 ?auto_95118 ) ) ( not ( = ?auto_95116 ?auto_95119 ) ) ( not ( = ?auto_95116 ?auto_95120 ) ) ( not ( = ?auto_95117 ?auto_95118 ) ) ( not ( = ?auto_95117 ?auto_95119 ) ) ( not ( = ?auto_95117 ?auto_95120 ) ) ( not ( = ?auto_95118 ?auto_95119 ) ) ( not ( = ?auto_95118 ?auto_95120 ) ) ( not ( = ?auto_95119 ?auto_95120 ) ) ( not ( = ?auto_95116 ?auto_95123 ) ) ( not ( = ?auto_95117 ?auto_95123 ) ) ( not ( = ?auto_95118 ?auto_95123 ) ) ( not ( = ?auto_95119 ?auto_95123 ) ) ( not ( = ?auto_95120 ?auto_95123 ) ) ( not ( = ?auto_95121 ?auto_95123 ) ) ( not ( = ?auto_95121 ?auto_95120 ) ) ( not ( = ?auto_95121 ?auto_95119 ) ) ( not ( = ?auto_95116 ?auto_95121 ) ) ( not ( = ?auto_95117 ?auto_95121 ) ) ( not ( = ?auto_95118 ?auto_95121 ) ) ( ON ?auto_95116 ?auto_95122 ) ( not ( = ?auto_95116 ?auto_95122 ) ) ( not ( = ?auto_95117 ?auto_95122 ) ) ( not ( = ?auto_95118 ?auto_95122 ) ) ( not ( = ?auto_95119 ?auto_95122 ) ) ( not ( = ?auto_95120 ?auto_95122 ) ) ( not ( = ?auto_95123 ?auto_95122 ) ) ( not ( = ?auto_95121 ?auto_95122 ) ) ( ON ?auto_95117 ?auto_95116 ) ( ON-TABLE ?auto_95122 ) ( ON ?auto_95118 ?auto_95117 ) ( ON ?auto_95119 ?auto_95118 ) ( ON ?auto_95120 ?auto_95119 ) ( ON ?auto_95123 ?auto_95120 ) ( ON ?auto_95121 ?auto_95123 ) ( CLEAR ?auto_95121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95122 ?auto_95116 ?auto_95117 ?auto_95118 ?auto_95119 ?auto_95120 ?auto_95123 )
      ( MAKE-5PILE ?auto_95116 ?auto_95117 ?auto_95118 ?auto_95119 ?auto_95120 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95125 - BLOCK
    )
    :vars
    (
      ?auto_95126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95126 ?auto_95125 ) ( CLEAR ?auto_95126 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95125 ) ( not ( = ?auto_95125 ?auto_95126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95126 ?auto_95125 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95127 - BLOCK
    )
    :vars
    (
      ?auto_95128 - BLOCK
      ?auto_95129 - BLOCK
      ?auto_95130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95128 ?auto_95127 ) ( CLEAR ?auto_95128 ) ( ON-TABLE ?auto_95127 ) ( not ( = ?auto_95127 ?auto_95128 ) ) ( HOLDING ?auto_95129 ) ( CLEAR ?auto_95130 ) ( not ( = ?auto_95127 ?auto_95129 ) ) ( not ( = ?auto_95127 ?auto_95130 ) ) ( not ( = ?auto_95128 ?auto_95129 ) ) ( not ( = ?auto_95128 ?auto_95130 ) ) ( not ( = ?auto_95129 ?auto_95130 ) ) )
    :subtasks
    ( ( !STACK ?auto_95129 ?auto_95130 )
      ( MAKE-1PILE ?auto_95127 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95131 - BLOCK
    )
    :vars
    (
      ?auto_95133 - BLOCK
      ?auto_95134 - BLOCK
      ?auto_95132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95133 ?auto_95131 ) ( ON-TABLE ?auto_95131 ) ( not ( = ?auto_95131 ?auto_95133 ) ) ( CLEAR ?auto_95134 ) ( not ( = ?auto_95131 ?auto_95132 ) ) ( not ( = ?auto_95131 ?auto_95134 ) ) ( not ( = ?auto_95133 ?auto_95132 ) ) ( not ( = ?auto_95133 ?auto_95134 ) ) ( not ( = ?auto_95132 ?auto_95134 ) ) ( ON ?auto_95132 ?auto_95133 ) ( CLEAR ?auto_95132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95131 ?auto_95133 )
      ( MAKE-1PILE ?auto_95131 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95135 - BLOCK
    )
    :vars
    (
      ?auto_95136 - BLOCK
      ?auto_95137 - BLOCK
      ?auto_95138 - BLOCK
      ?auto_95139 - BLOCK
      ?auto_95140 - BLOCK
      ?auto_95141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95136 ?auto_95135 ) ( ON-TABLE ?auto_95135 ) ( not ( = ?auto_95135 ?auto_95136 ) ) ( not ( = ?auto_95135 ?auto_95137 ) ) ( not ( = ?auto_95135 ?auto_95138 ) ) ( not ( = ?auto_95136 ?auto_95137 ) ) ( not ( = ?auto_95136 ?auto_95138 ) ) ( not ( = ?auto_95137 ?auto_95138 ) ) ( ON ?auto_95137 ?auto_95136 ) ( CLEAR ?auto_95137 ) ( HOLDING ?auto_95138 ) ( CLEAR ?auto_95139 ) ( ON-TABLE ?auto_95140 ) ( ON ?auto_95141 ?auto_95140 ) ( ON ?auto_95139 ?auto_95141 ) ( not ( = ?auto_95140 ?auto_95141 ) ) ( not ( = ?auto_95140 ?auto_95139 ) ) ( not ( = ?auto_95140 ?auto_95138 ) ) ( not ( = ?auto_95141 ?auto_95139 ) ) ( not ( = ?auto_95141 ?auto_95138 ) ) ( not ( = ?auto_95139 ?auto_95138 ) ) ( not ( = ?auto_95135 ?auto_95139 ) ) ( not ( = ?auto_95135 ?auto_95140 ) ) ( not ( = ?auto_95135 ?auto_95141 ) ) ( not ( = ?auto_95136 ?auto_95139 ) ) ( not ( = ?auto_95136 ?auto_95140 ) ) ( not ( = ?auto_95136 ?auto_95141 ) ) ( not ( = ?auto_95137 ?auto_95139 ) ) ( not ( = ?auto_95137 ?auto_95140 ) ) ( not ( = ?auto_95137 ?auto_95141 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95140 ?auto_95141 ?auto_95139 ?auto_95138 )
      ( MAKE-1PILE ?auto_95135 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95142 - BLOCK
    )
    :vars
    (
      ?auto_95145 - BLOCK
      ?auto_95147 - BLOCK
      ?auto_95146 - BLOCK
      ?auto_95148 - BLOCK
      ?auto_95144 - BLOCK
      ?auto_95143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95145 ?auto_95142 ) ( ON-TABLE ?auto_95142 ) ( not ( = ?auto_95142 ?auto_95145 ) ) ( not ( = ?auto_95142 ?auto_95147 ) ) ( not ( = ?auto_95142 ?auto_95146 ) ) ( not ( = ?auto_95145 ?auto_95147 ) ) ( not ( = ?auto_95145 ?auto_95146 ) ) ( not ( = ?auto_95147 ?auto_95146 ) ) ( ON ?auto_95147 ?auto_95145 ) ( CLEAR ?auto_95148 ) ( ON-TABLE ?auto_95144 ) ( ON ?auto_95143 ?auto_95144 ) ( ON ?auto_95148 ?auto_95143 ) ( not ( = ?auto_95144 ?auto_95143 ) ) ( not ( = ?auto_95144 ?auto_95148 ) ) ( not ( = ?auto_95144 ?auto_95146 ) ) ( not ( = ?auto_95143 ?auto_95148 ) ) ( not ( = ?auto_95143 ?auto_95146 ) ) ( not ( = ?auto_95148 ?auto_95146 ) ) ( not ( = ?auto_95142 ?auto_95148 ) ) ( not ( = ?auto_95142 ?auto_95144 ) ) ( not ( = ?auto_95142 ?auto_95143 ) ) ( not ( = ?auto_95145 ?auto_95148 ) ) ( not ( = ?auto_95145 ?auto_95144 ) ) ( not ( = ?auto_95145 ?auto_95143 ) ) ( not ( = ?auto_95147 ?auto_95148 ) ) ( not ( = ?auto_95147 ?auto_95144 ) ) ( not ( = ?auto_95147 ?auto_95143 ) ) ( ON ?auto_95146 ?auto_95147 ) ( CLEAR ?auto_95146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95142 ?auto_95145 ?auto_95147 )
      ( MAKE-1PILE ?auto_95142 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95149 - BLOCK
    )
    :vars
    (
      ?auto_95155 - BLOCK
      ?auto_95151 - BLOCK
      ?auto_95152 - BLOCK
      ?auto_95154 - BLOCK
      ?auto_95153 - BLOCK
      ?auto_95150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95155 ?auto_95149 ) ( ON-TABLE ?auto_95149 ) ( not ( = ?auto_95149 ?auto_95155 ) ) ( not ( = ?auto_95149 ?auto_95151 ) ) ( not ( = ?auto_95149 ?auto_95152 ) ) ( not ( = ?auto_95155 ?auto_95151 ) ) ( not ( = ?auto_95155 ?auto_95152 ) ) ( not ( = ?auto_95151 ?auto_95152 ) ) ( ON ?auto_95151 ?auto_95155 ) ( ON-TABLE ?auto_95154 ) ( ON ?auto_95153 ?auto_95154 ) ( not ( = ?auto_95154 ?auto_95153 ) ) ( not ( = ?auto_95154 ?auto_95150 ) ) ( not ( = ?auto_95154 ?auto_95152 ) ) ( not ( = ?auto_95153 ?auto_95150 ) ) ( not ( = ?auto_95153 ?auto_95152 ) ) ( not ( = ?auto_95150 ?auto_95152 ) ) ( not ( = ?auto_95149 ?auto_95150 ) ) ( not ( = ?auto_95149 ?auto_95154 ) ) ( not ( = ?auto_95149 ?auto_95153 ) ) ( not ( = ?auto_95155 ?auto_95150 ) ) ( not ( = ?auto_95155 ?auto_95154 ) ) ( not ( = ?auto_95155 ?auto_95153 ) ) ( not ( = ?auto_95151 ?auto_95150 ) ) ( not ( = ?auto_95151 ?auto_95154 ) ) ( not ( = ?auto_95151 ?auto_95153 ) ) ( ON ?auto_95152 ?auto_95151 ) ( CLEAR ?auto_95152 ) ( HOLDING ?auto_95150 ) ( CLEAR ?auto_95153 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95154 ?auto_95153 ?auto_95150 )
      ( MAKE-1PILE ?auto_95149 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95156 - BLOCK
    )
    :vars
    (
      ?auto_95160 - BLOCK
      ?auto_95158 - BLOCK
      ?auto_95161 - BLOCK
      ?auto_95159 - BLOCK
      ?auto_95162 - BLOCK
      ?auto_95157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95160 ?auto_95156 ) ( ON-TABLE ?auto_95156 ) ( not ( = ?auto_95156 ?auto_95160 ) ) ( not ( = ?auto_95156 ?auto_95158 ) ) ( not ( = ?auto_95156 ?auto_95161 ) ) ( not ( = ?auto_95160 ?auto_95158 ) ) ( not ( = ?auto_95160 ?auto_95161 ) ) ( not ( = ?auto_95158 ?auto_95161 ) ) ( ON ?auto_95158 ?auto_95160 ) ( ON-TABLE ?auto_95159 ) ( ON ?auto_95162 ?auto_95159 ) ( not ( = ?auto_95159 ?auto_95162 ) ) ( not ( = ?auto_95159 ?auto_95157 ) ) ( not ( = ?auto_95159 ?auto_95161 ) ) ( not ( = ?auto_95162 ?auto_95157 ) ) ( not ( = ?auto_95162 ?auto_95161 ) ) ( not ( = ?auto_95157 ?auto_95161 ) ) ( not ( = ?auto_95156 ?auto_95157 ) ) ( not ( = ?auto_95156 ?auto_95159 ) ) ( not ( = ?auto_95156 ?auto_95162 ) ) ( not ( = ?auto_95160 ?auto_95157 ) ) ( not ( = ?auto_95160 ?auto_95159 ) ) ( not ( = ?auto_95160 ?auto_95162 ) ) ( not ( = ?auto_95158 ?auto_95157 ) ) ( not ( = ?auto_95158 ?auto_95159 ) ) ( not ( = ?auto_95158 ?auto_95162 ) ) ( ON ?auto_95161 ?auto_95158 ) ( CLEAR ?auto_95162 ) ( ON ?auto_95157 ?auto_95161 ) ( CLEAR ?auto_95157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95156 ?auto_95160 ?auto_95158 ?auto_95161 )
      ( MAKE-1PILE ?auto_95156 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95163 - BLOCK
    )
    :vars
    (
      ?auto_95164 - BLOCK
      ?auto_95168 - BLOCK
      ?auto_95166 - BLOCK
      ?auto_95165 - BLOCK
      ?auto_95167 - BLOCK
      ?auto_95169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95164 ?auto_95163 ) ( ON-TABLE ?auto_95163 ) ( not ( = ?auto_95163 ?auto_95164 ) ) ( not ( = ?auto_95163 ?auto_95168 ) ) ( not ( = ?auto_95163 ?auto_95166 ) ) ( not ( = ?auto_95164 ?auto_95168 ) ) ( not ( = ?auto_95164 ?auto_95166 ) ) ( not ( = ?auto_95168 ?auto_95166 ) ) ( ON ?auto_95168 ?auto_95164 ) ( ON-TABLE ?auto_95165 ) ( not ( = ?auto_95165 ?auto_95167 ) ) ( not ( = ?auto_95165 ?auto_95169 ) ) ( not ( = ?auto_95165 ?auto_95166 ) ) ( not ( = ?auto_95167 ?auto_95169 ) ) ( not ( = ?auto_95167 ?auto_95166 ) ) ( not ( = ?auto_95169 ?auto_95166 ) ) ( not ( = ?auto_95163 ?auto_95169 ) ) ( not ( = ?auto_95163 ?auto_95165 ) ) ( not ( = ?auto_95163 ?auto_95167 ) ) ( not ( = ?auto_95164 ?auto_95169 ) ) ( not ( = ?auto_95164 ?auto_95165 ) ) ( not ( = ?auto_95164 ?auto_95167 ) ) ( not ( = ?auto_95168 ?auto_95169 ) ) ( not ( = ?auto_95168 ?auto_95165 ) ) ( not ( = ?auto_95168 ?auto_95167 ) ) ( ON ?auto_95166 ?auto_95168 ) ( ON ?auto_95169 ?auto_95166 ) ( CLEAR ?auto_95169 ) ( HOLDING ?auto_95167 ) ( CLEAR ?auto_95165 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95165 ?auto_95167 )
      ( MAKE-1PILE ?auto_95163 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95170 - BLOCK
    )
    :vars
    (
      ?auto_95173 - BLOCK
      ?auto_95174 - BLOCK
      ?auto_95171 - BLOCK
      ?auto_95176 - BLOCK
      ?auto_95172 - BLOCK
      ?auto_95175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95173 ?auto_95170 ) ( ON-TABLE ?auto_95170 ) ( not ( = ?auto_95170 ?auto_95173 ) ) ( not ( = ?auto_95170 ?auto_95174 ) ) ( not ( = ?auto_95170 ?auto_95171 ) ) ( not ( = ?auto_95173 ?auto_95174 ) ) ( not ( = ?auto_95173 ?auto_95171 ) ) ( not ( = ?auto_95174 ?auto_95171 ) ) ( ON ?auto_95174 ?auto_95173 ) ( ON-TABLE ?auto_95176 ) ( not ( = ?auto_95176 ?auto_95172 ) ) ( not ( = ?auto_95176 ?auto_95175 ) ) ( not ( = ?auto_95176 ?auto_95171 ) ) ( not ( = ?auto_95172 ?auto_95175 ) ) ( not ( = ?auto_95172 ?auto_95171 ) ) ( not ( = ?auto_95175 ?auto_95171 ) ) ( not ( = ?auto_95170 ?auto_95175 ) ) ( not ( = ?auto_95170 ?auto_95176 ) ) ( not ( = ?auto_95170 ?auto_95172 ) ) ( not ( = ?auto_95173 ?auto_95175 ) ) ( not ( = ?auto_95173 ?auto_95176 ) ) ( not ( = ?auto_95173 ?auto_95172 ) ) ( not ( = ?auto_95174 ?auto_95175 ) ) ( not ( = ?auto_95174 ?auto_95176 ) ) ( not ( = ?auto_95174 ?auto_95172 ) ) ( ON ?auto_95171 ?auto_95174 ) ( ON ?auto_95175 ?auto_95171 ) ( CLEAR ?auto_95176 ) ( ON ?auto_95172 ?auto_95175 ) ( CLEAR ?auto_95172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95170 ?auto_95173 ?auto_95174 ?auto_95171 ?auto_95175 )
      ( MAKE-1PILE ?auto_95170 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95177 - BLOCK
    )
    :vars
    (
      ?auto_95179 - BLOCK
      ?auto_95180 - BLOCK
      ?auto_95183 - BLOCK
      ?auto_95178 - BLOCK
      ?auto_95181 - BLOCK
      ?auto_95182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95179 ?auto_95177 ) ( ON-TABLE ?auto_95177 ) ( not ( = ?auto_95177 ?auto_95179 ) ) ( not ( = ?auto_95177 ?auto_95180 ) ) ( not ( = ?auto_95177 ?auto_95183 ) ) ( not ( = ?auto_95179 ?auto_95180 ) ) ( not ( = ?auto_95179 ?auto_95183 ) ) ( not ( = ?auto_95180 ?auto_95183 ) ) ( ON ?auto_95180 ?auto_95179 ) ( not ( = ?auto_95178 ?auto_95181 ) ) ( not ( = ?auto_95178 ?auto_95182 ) ) ( not ( = ?auto_95178 ?auto_95183 ) ) ( not ( = ?auto_95181 ?auto_95182 ) ) ( not ( = ?auto_95181 ?auto_95183 ) ) ( not ( = ?auto_95182 ?auto_95183 ) ) ( not ( = ?auto_95177 ?auto_95182 ) ) ( not ( = ?auto_95177 ?auto_95178 ) ) ( not ( = ?auto_95177 ?auto_95181 ) ) ( not ( = ?auto_95179 ?auto_95182 ) ) ( not ( = ?auto_95179 ?auto_95178 ) ) ( not ( = ?auto_95179 ?auto_95181 ) ) ( not ( = ?auto_95180 ?auto_95182 ) ) ( not ( = ?auto_95180 ?auto_95178 ) ) ( not ( = ?auto_95180 ?auto_95181 ) ) ( ON ?auto_95183 ?auto_95180 ) ( ON ?auto_95182 ?auto_95183 ) ( ON ?auto_95181 ?auto_95182 ) ( CLEAR ?auto_95181 ) ( HOLDING ?auto_95178 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95178 )
      ( MAKE-1PILE ?auto_95177 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95184 - BLOCK
    )
    :vars
    (
      ?auto_95185 - BLOCK
      ?auto_95186 - BLOCK
      ?auto_95187 - BLOCK
      ?auto_95190 - BLOCK
      ?auto_95189 - BLOCK
      ?auto_95188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95185 ?auto_95184 ) ( ON-TABLE ?auto_95184 ) ( not ( = ?auto_95184 ?auto_95185 ) ) ( not ( = ?auto_95184 ?auto_95186 ) ) ( not ( = ?auto_95184 ?auto_95187 ) ) ( not ( = ?auto_95185 ?auto_95186 ) ) ( not ( = ?auto_95185 ?auto_95187 ) ) ( not ( = ?auto_95186 ?auto_95187 ) ) ( ON ?auto_95186 ?auto_95185 ) ( not ( = ?auto_95190 ?auto_95189 ) ) ( not ( = ?auto_95190 ?auto_95188 ) ) ( not ( = ?auto_95190 ?auto_95187 ) ) ( not ( = ?auto_95189 ?auto_95188 ) ) ( not ( = ?auto_95189 ?auto_95187 ) ) ( not ( = ?auto_95188 ?auto_95187 ) ) ( not ( = ?auto_95184 ?auto_95188 ) ) ( not ( = ?auto_95184 ?auto_95190 ) ) ( not ( = ?auto_95184 ?auto_95189 ) ) ( not ( = ?auto_95185 ?auto_95188 ) ) ( not ( = ?auto_95185 ?auto_95190 ) ) ( not ( = ?auto_95185 ?auto_95189 ) ) ( not ( = ?auto_95186 ?auto_95188 ) ) ( not ( = ?auto_95186 ?auto_95190 ) ) ( not ( = ?auto_95186 ?auto_95189 ) ) ( ON ?auto_95187 ?auto_95186 ) ( ON ?auto_95188 ?auto_95187 ) ( ON ?auto_95189 ?auto_95188 ) ( ON ?auto_95190 ?auto_95189 ) ( CLEAR ?auto_95190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95184 ?auto_95185 ?auto_95186 ?auto_95187 ?auto_95188 ?auto_95189 )
      ( MAKE-1PILE ?auto_95184 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95191 - BLOCK
    )
    :vars
    (
      ?auto_95192 - BLOCK
      ?auto_95193 - BLOCK
      ?auto_95197 - BLOCK
      ?auto_95194 - BLOCK
      ?auto_95196 - BLOCK
      ?auto_95195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95192 ?auto_95191 ) ( ON-TABLE ?auto_95191 ) ( not ( = ?auto_95191 ?auto_95192 ) ) ( not ( = ?auto_95191 ?auto_95193 ) ) ( not ( = ?auto_95191 ?auto_95197 ) ) ( not ( = ?auto_95192 ?auto_95193 ) ) ( not ( = ?auto_95192 ?auto_95197 ) ) ( not ( = ?auto_95193 ?auto_95197 ) ) ( ON ?auto_95193 ?auto_95192 ) ( not ( = ?auto_95194 ?auto_95196 ) ) ( not ( = ?auto_95194 ?auto_95195 ) ) ( not ( = ?auto_95194 ?auto_95197 ) ) ( not ( = ?auto_95196 ?auto_95195 ) ) ( not ( = ?auto_95196 ?auto_95197 ) ) ( not ( = ?auto_95195 ?auto_95197 ) ) ( not ( = ?auto_95191 ?auto_95195 ) ) ( not ( = ?auto_95191 ?auto_95194 ) ) ( not ( = ?auto_95191 ?auto_95196 ) ) ( not ( = ?auto_95192 ?auto_95195 ) ) ( not ( = ?auto_95192 ?auto_95194 ) ) ( not ( = ?auto_95192 ?auto_95196 ) ) ( not ( = ?auto_95193 ?auto_95195 ) ) ( not ( = ?auto_95193 ?auto_95194 ) ) ( not ( = ?auto_95193 ?auto_95196 ) ) ( ON ?auto_95197 ?auto_95193 ) ( ON ?auto_95195 ?auto_95197 ) ( ON ?auto_95196 ?auto_95195 ) ( HOLDING ?auto_95194 ) ( CLEAR ?auto_95196 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95191 ?auto_95192 ?auto_95193 ?auto_95197 ?auto_95195 ?auto_95196 ?auto_95194 )
      ( MAKE-1PILE ?auto_95191 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95198 - BLOCK
    )
    :vars
    (
      ?auto_95204 - BLOCK
      ?auto_95201 - BLOCK
      ?auto_95199 - BLOCK
      ?auto_95202 - BLOCK
      ?auto_95203 - BLOCK
      ?auto_95200 - BLOCK
      ?auto_95205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95204 ?auto_95198 ) ( ON-TABLE ?auto_95198 ) ( not ( = ?auto_95198 ?auto_95204 ) ) ( not ( = ?auto_95198 ?auto_95201 ) ) ( not ( = ?auto_95198 ?auto_95199 ) ) ( not ( = ?auto_95204 ?auto_95201 ) ) ( not ( = ?auto_95204 ?auto_95199 ) ) ( not ( = ?auto_95201 ?auto_95199 ) ) ( ON ?auto_95201 ?auto_95204 ) ( not ( = ?auto_95202 ?auto_95203 ) ) ( not ( = ?auto_95202 ?auto_95200 ) ) ( not ( = ?auto_95202 ?auto_95199 ) ) ( not ( = ?auto_95203 ?auto_95200 ) ) ( not ( = ?auto_95203 ?auto_95199 ) ) ( not ( = ?auto_95200 ?auto_95199 ) ) ( not ( = ?auto_95198 ?auto_95200 ) ) ( not ( = ?auto_95198 ?auto_95202 ) ) ( not ( = ?auto_95198 ?auto_95203 ) ) ( not ( = ?auto_95204 ?auto_95200 ) ) ( not ( = ?auto_95204 ?auto_95202 ) ) ( not ( = ?auto_95204 ?auto_95203 ) ) ( not ( = ?auto_95201 ?auto_95200 ) ) ( not ( = ?auto_95201 ?auto_95202 ) ) ( not ( = ?auto_95201 ?auto_95203 ) ) ( ON ?auto_95199 ?auto_95201 ) ( ON ?auto_95200 ?auto_95199 ) ( ON ?auto_95203 ?auto_95200 ) ( CLEAR ?auto_95203 ) ( ON ?auto_95202 ?auto_95205 ) ( CLEAR ?auto_95202 ) ( HAND-EMPTY ) ( not ( = ?auto_95198 ?auto_95205 ) ) ( not ( = ?auto_95204 ?auto_95205 ) ) ( not ( = ?auto_95201 ?auto_95205 ) ) ( not ( = ?auto_95199 ?auto_95205 ) ) ( not ( = ?auto_95202 ?auto_95205 ) ) ( not ( = ?auto_95203 ?auto_95205 ) ) ( not ( = ?auto_95200 ?auto_95205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95202 ?auto_95205 )
      ( MAKE-1PILE ?auto_95198 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95206 - BLOCK
    )
    :vars
    (
      ?auto_95208 - BLOCK
      ?auto_95210 - BLOCK
      ?auto_95209 - BLOCK
      ?auto_95213 - BLOCK
      ?auto_95212 - BLOCK
      ?auto_95211 - BLOCK
      ?auto_95207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95208 ?auto_95206 ) ( ON-TABLE ?auto_95206 ) ( not ( = ?auto_95206 ?auto_95208 ) ) ( not ( = ?auto_95206 ?auto_95210 ) ) ( not ( = ?auto_95206 ?auto_95209 ) ) ( not ( = ?auto_95208 ?auto_95210 ) ) ( not ( = ?auto_95208 ?auto_95209 ) ) ( not ( = ?auto_95210 ?auto_95209 ) ) ( ON ?auto_95210 ?auto_95208 ) ( not ( = ?auto_95213 ?auto_95212 ) ) ( not ( = ?auto_95213 ?auto_95211 ) ) ( not ( = ?auto_95213 ?auto_95209 ) ) ( not ( = ?auto_95212 ?auto_95211 ) ) ( not ( = ?auto_95212 ?auto_95209 ) ) ( not ( = ?auto_95211 ?auto_95209 ) ) ( not ( = ?auto_95206 ?auto_95211 ) ) ( not ( = ?auto_95206 ?auto_95213 ) ) ( not ( = ?auto_95206 ?auto_95212 ) ) ( not ( = ?auto_95208 ?auto_95211 ) ) ( not ( = ?auto_95208 ?auto_95213 ) ) ( not ( = ?auto_95208 ?auto_95212 ) ) ( not ( = ?auto_95210 ?auto_95211 ) ) ( not ( = ?auto_95210 ?auto_95213 ) ) ( not ( = ?auto_95210 ?auto_95212 ) ) ( ON ?auto_95209 ?auto_95210 ) ( ON ?auto_95211 ?auto_95209 ) ( ON ?auto_95213 ?auto_95207 ) ( CLEAR ?auto_95213 ) ( not ( = ?auto_95206 ?auto_95207 ) ) ( not ( = ?auto_95208 ?auto_95207 ) ) ( not ( = ?auto_95210 ?auto_95207 ) ) ( not ( = ?auto_95209 ?auto_95207 ) ) ( not ( = ?auto_95213 ?auto_95207 ) ) ( not ( = ?auto_95212 ?auto_95207 ) ) ( not ( = ?auto_95211 ?auto_95207 ) ) ( HOLDING ?auto_95212 ) ( CLEAR ?auto_95211 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95206 ?auto_95208 ?auto_95210 ?auto_95209 ?auto_95211 ?auto_95212 )
      ( MAKE-1PILE ?auto_95206 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95214 - BLOCK
    )
    :vars
    (
      ?auto_95218 - BLOCK
      ?auto_95219 - BLOCK
      ?auto_95217 - BLOCK
      ?auto_95221 - BLOCK
      ?auto_95215 - BLOCK
      ?auto_95220 - BLOCK
      ?auto_95216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95218 ?auto_95214 ) ( ON-TABLE ?auto_95214 ) ( not ( = ?auto_95214 ?auto_95218 ) ) ( not ( = ?auto_95214 ?auto_95219 ) ) ( not ( = ?auto_95214 ?auto_95217 ) ) ( not ( = ?auto_95218 ?auto_95219 ) ) ( not ( = ?auto_95218 ?auto_95217 ) ) ( not ( = ?auto_95219 ?auto_95217 ) ) ( ON ?auto_95219 ?auto_95218 ) ( not ( = ?auto_95221 ?auto_95215 ) ) ( not ( = ?auto_95221 ?auto_95220 ) ) ( not ( = ?auto_95221 ?auto_95217 ) ) ( not ( = ?auto_95215 ?auto_95220 ) ) ( not ( = ?auto_95215 ?auto_95217 ) ) ( not ( = ?auto_95220 ?auto_95217 ) ) ( not ( = ?auto_95214 ?auto_95220 ) ) ( not ( = ?auto_95214 ?auto_95221 ) ) ( not ( = ?auto_95214 ?auto_95215 ) ) ( not ( = ?auto_95218 ?auto_95220 ) ) ( not ( = ?auto_95218 ?auto_95221 ) ) ( not ( = ?auto_95218 ?auto_95215 ) ) ( not ( = ?auto_95219 ?auto_95220 ) ) ( not ( = ?auto_95219 ?auto_95221 ) ) ( not ( = ?auto_95219 ?auto_95215 ) ) ( ON ?auto_95217 ?auto_95219 ) ( ON ?auto_95220 ?auto_95217 ) ( ON ?auto_95221 ?auto_95216 ) ( not ( = ?auto_95214 ?auto_95216 ) ) ( not ( = ?auto_95218 ?auto_95216 ) ) ( not ( = ?auto_95219 ?auto_95216 ) ) ( not ( = ?auto_95217 ?auto_95216 ) ) ( not ( = ?auto_95221 ?auto_95216 ) ) ( not ( = ?auto_95215 ?auto_95216 ) ) ( not ( = ?auto_95220 ?auto_95216 ) ) ( CLEAR ?auto_95220 ) ( ON ?auto_95215 ?auto_95221 ) ( CLEAR ?auto_95215 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95216 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95216 ?auto_95221 )
      ( MAKE-1PILE ?auto_95214 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95222 - BLOCK
    )
    :vars
    (
      ?auto_95225 - BLOCK
      ?auto_95224 - BLOCK
      ?auto_95227 - BLOCK
      ?auto_95226 - BLOCK
      ?auto_95228 - BLOCK
      ?auto_95229 - BLOCK
      ?auto_95223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95225 ?auto_95222 ) ( ON-TABLE ?auto_95222 ) ( not ( = ?auto_95222 ?auto_95225 ) ) ( not ( = ?auto_95222 ?auto_95224 ) ) ( not ( = ?auto_95222 ?auto_95227 ) ) ( not ( = ?auto_95225 ?auto_95224 ) ) ( not ( = ?auto_95225 ?auto_95227 ) ) ( not ( = ?auto_95224 ?auto_95227 ) ) ( ON ?auto_95224 ?auto_95225 ) ( not ( = ?auto_95226 ?auto_95228 ) ) ( not ( = ?auto_95226 ?auto_95229 ) ) ( not ( = ?auto_95226 ?auto_95227 ) ) ( not ( = ?auto_95228 ?auto_95229 ) ) ( not ( = ?auto_95228 ?auto_95227 ) ) ( not ( = ?auto_95229 ?auto_95227 ) ) ( not ( = ?auto_95222 ?auto_95229 ) ) ( not ( = ?auto_95222 ?auto_95226 ) ) ( not ( = ?auto_95222 ?auto_95228 ) ) ( not ( = ?auto_95225 ?auto_95229 ) ) ( not ( = ?auto_95225 ?auto_95226 ) ) ( not ( = ?auto_95225 ?auto_95228 ) ) ( not ( = ?auto_95224 ?auto_95229 ) ) ( not ( = ?auto_95224 ?auto_95226 ) ) ( not ( = ?auto_95224 ?auto_95228 ) ) ( ON ?auto_95227 ?auto_95224 ) ( ON ?auto_95226 ?auto_95223 ) ( not ( = ?auto_95222 ?auto_95223 ) ) ( not ( = ?auto_95225 ?auto_95223 ) ) ( not ( = ?auto_95224 ?auto_95223 ) ) ( not ( = ?auto_95227 ?auto_95223 ) ) ( not ( = ?auto_95226 ?auto_95223 ) ) ( not ( = ?auto_95228 ?auto_95223 ) ) ( not ( = ?auto_95229 ?auto_95223 ) ) ( ON ?auto_95228 ?auto_95226 ) ( CLEAR ?auto_95228 ) ( ON-TABLE ?auto_95223 ) ( HOLDING ?auto_95229 ) ( CLEAR ?auto_95227 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95222 ?auto_95225 ?auto_95224 ?auto_95227 ?auto_95229 )
      ( MAKE-1PILE ?auto_95222 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95230 - BLOCK
    )
    :vars
    (
      ?auto_95233 - BLOCK
      ?auto_95235 - BLOCK
      ?auto_95237 - BLOCK
      ?auto_95234 - BLOCK
      ?auto_95232 - BLOCK
      ?auto_95236 - BLOCK
      ?auto_95231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95233 ?auto_95230 ) ( ON-TABLE ?auto_95230 ) ( not ( = ?auto_95230 ?auto_95233 ) ) ( not ( = ?auto_95230 ?auto_95235 ) ) ( not ( = ?auto_95230 ?auto_95237 ) ) ( not ( = ?auto_95233 ?auto_95235 ) ) ( not ( = ?auto_95233 ?auto_95237 ) ) ( not ( = ?auto_95235 ?auto_95237 ) ) ( ON ?auto_95235 ?auto_95233 ) ( not ( = ?auto_95234 ?auto_95232 ) ) ( not ( = ?auto_95234 ?auto_95236 ) ) ( not ( = ?auto_95234 ?auto_95237 ) ) ( not ( = ?auto_95232 ?auto_95236 ) ) ( not ( = ?auto_95232 ?auto_95237 ) ) ( not ( = ?auto_95236 ?auto_95237 ) ) ( not ( = ?auto_95230 ?auto_95236 ) ) ( not ( = ?auto_95230 ?auto_95234 ) ) ( not ( = ?auto_95230 ?auto_95232 ) ) ( not ( = ?auto_95233 ?auto_95236 ) ) ( not ( = ?auto_95233 ?auto_95234 ) ) ( not ( = ?auto_95233 ?auto_95232 ) ) ( not ( = ?auto_95235 ?auto_95236 ) ) ( not ( = ?auto_95235 ?auto_95234 ) ) ( not ( = ?auto_95235 ?auto_95232 ) ) ( ON ?auto_95237 ?auto_95235 ) ( ON ?auto_95234 ?auto_95231 ) ( not ( = ?auto_95230 ?auto_95231 ) ) ( not ( = ?auto_95233 ?auto_95231 ) ) ( not ( = ?auto_95235 ?auto_95231 ) ) ( not ( = ?auto_95237 ?auto_95231 ) ) ( not ( = ?auto_95234 ?auto_95231 ) ) ( not ( = ?auto_95232 ?auto_95231 ) ) ( not ( = ?auto_95236 ?auto_95231 ) ) ( ON ?auto_95232 ?auto_95234 ) ( ON-TABLE ?auto_95231 ) ( CLEAR ?auto_95237 ) ( ON ?auto_95236 ?auto_95232 ) ( CLEAR ?auto_95236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95231 ?auto_95234 ?auto_95232 )
      ( MAKE-1PILE ?auto_95230 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95238 - BLOCK
    )
    :vars
    (
      ?auto_95245 - BLOCK
      ?auto_95243 - BLOCK
      ?auto_95239 - BLOCK
      ?auto_95242 - BLOCK
      ?auto_95241 - BLOCK
      ?auto_95240 - BLOCK
      ?auto_95244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95245 ?auto_95238 ) ( ON-TABLE ?auto_95238 ) ( not ( = ?auto_95238 ?auto_95245 ) ) ( not ( = ?auto_95238 ?auto_95243 ) ) ( not ( = ?auto_95238 ?auto_95239 ) ) ( not ( = ?auto_95245 ?auto_95243 ) ) ( not ( = ?auto_95245 ?auto_95239 ) ) ( not ( = ?auto_95243 ?auto_95239 ) ) ( ON ?auto_95243 ?auto_95245 ) ( not ( = ?auto_95242 ?auto_95241 ) ) ( not ( = ?auto_95242 ?auto_95240 ) ) ( not ( = ?auto_95242 ?auto_95239 ) ) ( not ( = ?auto_95241 ?auto_95240 ) ) ( not ( = ?auto_95241 ?auto_95239 ) ) ( not ( = ?auto_95240 ?auto_95239 ) ) ( not ( = ?auto_95238 ?auto_95240 ) ) ( not ( = ?auto_95238 ?auto_95242 ) ) ( not ( = ?auto_95238 ?auto_95241 ) ) ( not ( = ?auto_95245 ?auto_95240 ) ) ( not ( = ?auto_95245 ?auto_95242 ) ) ( not ( = ?auto_95245 ?auto_95241 ) ) ( not ( = ?auto_95243 ?auto_95240 ) ) ( not ( = ?auto_95243 ?auto_95242 ) ) ( not ( = ?auto_95243 ?auto_95241 ) ) ( ON ?auto_95242 ?auto_95244 ) ( not ( = ?auto_95238 ?auto_95244 ) ) ( not ( = ?auto_95245 ?auto_95244 ) ) ( not ( = ?auto_95243 ?auto_95244 ) ) ( not ( = ?auto_95239 ?auto_95244 ) ) ( not ( = ?auto_95242 ?auto_95244 ) ) ( not ( = ?auto_95241 ?auto_95244 ) ) ( not ( = ?auto_95240 ?auto_95244 ) ) ( ON ?auto_95241 ?auto_95242 ) ( ON-TABLE ?auto_95244 ) ( ON ?auto_95240 ?auto_95241 ) ( CLEAR ?auto_95240 ) ( HOLDING ?auto_95239 ) ( CLEAR ?auto_95243 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95238 ?auto_95245 ?auto_95243 ?auto_95239 )
      ( MAKE-1PILE ?auto_95238 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95246 - BLOCK
    )
    :vars
    (
      ?auto_95253 - BLOCK
      ?auto_95252 - BLOCK
      ?auto_95248 - BLOCK
      ?auto_95251 - BLOCK
      ?auto_95250 - BLOCK
      ?auto_95249 - BLOCK
      ?auto_95247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95253 ?auto_95246 ) ( ON-TABLE ?auto_95246 ) ( not ( = ?auto_95246 ?auto_95253 ) ) ( not ( = ?auto_95246 ?auto_95252 ) ) ( not ( = ?auto_95246 ?auto_95248 ) ) ( not ( = ?auto_95253 ?auto_95252 ) ) ( not ( = ?auto_95253 ?auto_95248 ) ) ( not ( = ?auto_95252 ?auto_95248 ) ) ( ON ?auto_95252 ?auto_95253 ) ( not ( = ?auto_95251 ?auto_95250 ) ) ( not ( = ?auto_95251 ?auto_95249 ) ) ( not ( = ?auto_95251 ?auto_95248 ) ) ( not ( = ?auto_95250 ?auto_95249 ) ) ( not ( = ?auto_95250 ?auto_95248 ) ) ( not ( = ?auto_95249 ?auto_95248 ) ) ( not ( = ?auto_95246 ?auto_95249 ) ) ( not ( = ?auto_95246 ?auto_95251 ) ) ( not ( = ?auto_95246 ?auto_95250 ) ) ( not ( = ?auto_95253 ?auto_95249 ) ) ( not ( = ?auto_95253 ?auto_95251 ) ) ( not ( = ?auto_95253 ?auto_95250 ) ) ( not ( = ?auto_95252 ?auto_95249 ) ) ( not ( = ?auto_95252 ?auto_95251 ) ) ( not ( = ?auto_95252 ?auto_95250 ) ) ( ON ?auto_95251 ?auto_95247 ) ( not ( = ?auto_95246 ?auto_95247 ) ) ( not ( = ?auto_95253 ?auto_95247 ) ) ( not ( = ?auto_95252 ?auto_95247 ) ) ( not ( = ?auto_95248 ?auto_95247 ) ) ( not ( = ?auto_95251 ?auto_95247 ) ) ( not ( = ?auto_95250 ?auto_95247 ) ) ( not ( = ?auto_95249 ?auto_95247 ) ) ( ON ?auto_95250 ?auto_95251 ) ( ON-TABLE ?auto_95247 ) ( ON ?auto_95249 ?auto_95250 ) ( CLEAR ?auto_95252 ) ( ON ?auto_95248 ?auto_95249 ) ( CLEAR ?auto_95248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95247 ?auto_95251 ?auto_95250 ?auto_95249 )
      ( MAKE-1PILE ?auto_95246 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95254 - BLOCK
    )
    :vars
    (
      ?auto_95257 - BLOCK
      ?auto_95261 - BLOCK
      ?auto_95259 - BLOCK
      ?auto_95255 - BLOCK
      ?auto_95256 - BLOCK
      ?auto_95260 - BLOCK
      ?auto_95258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95257 ?auto_95254 ) ( ON-TABLE ?auto_95254 ) ( not ( = ?auto_95254 ?auto_95257 ) ) ( not ( = ?auto_95254 ?auto_95261 ) ) ( not ( = ?auto_95254 ?auto_95259 ) ) ( not ( = ?auto_95257 ?auto_95261 ) ) ( not ( = ?auto_95257 ?auto_95259 ) ) ( not ( = ?auto_95261 ?auto_95259 ) ) ( not ( = ?auto_95255 ?auto_95256 ) ) ( not ( = ?auto_95255 ?auto_95260 ) ) ( not ( = ?auto_95255 ?auto_95259 ) ) ( not ( = ?auto_95256 ?auto_95260 ) ) ( not ( = ?auto_95256 ?auto_95259 ) ) ( not ( = ?auto_95260 ?auto_95259 ) ) ( not ( = ?auto_95254 ?auto_95260 ) ) ( not ( = ?auto_95254 ?auto_95255 ) ) ( not ( = ?auto_95254 ?auto_95256 ) ) ( not ( = ?auto_95257 ?auto_95260 ) ) ( not ( = ?auto_95257 ?auto_95255 ) ) ( not ( = ?auto_95257 ?auto_95256 ) ) ( not ( = ?auto_95261 ?auto_95260 ) ) ( not ( = ?auto_95261 ?auto_95255 ) ) ( not ( = ?auto_95261 ?auto_95256 ) ) ( ON ?auto_95255 ?auto_95258 ) ( not ( = ?auto_95254 ?auto_95258 ) ) ( not ( = ?auto_95257 ?auto_95258 ) ) ( not ( = ?auto_95261 ?auto_95258 ) ) ( not ( = ?auto_95259 ?auto_95258 ) ) ( not ( = ?auto_95255 ?auto_95258 ) ) ( not ( = ?auto_95256 ?auto_95258 ) ) ( not ( = ?auto_95260 ?auto_95258 ) ) ( ON ?auto_95256 ?auto_95255 ) ( ON-TABLE ?auto_95258 ) ( ON ?auto_95260 ?auto_95256 ) ( ON ?auto_95259 ?auto_95260 ) ( CLEAR ?auto_95259 ) ( HOLDING ?auto_95261 ) ( CLEAR ?auto_95257 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95254 ?auto_95257 ?auto_95261 )
      ( MAKE-1PILE ?auto_95254 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95262 - BLOCK
    )
    :vars
    (
      ?auto_95268 - BLOCK
      ?auto_95267 - BLOCK
      ?auto_95264 - BLOCK
      ?auto_95263 - BLOCK
      ?auto_95266 - BLOCK
      ?auto_95265 - BLOCK
      ?auto_95269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95268 ?auto_95262 ) ( ON-TABLE ?auto_95262 ) ( not ( = ?auto_95262 ?auto_95268 ) ) ( not ( = ?auto_95262 ?auto_95267 ) ) ( not ( = ?auto_95262 ?auto_95264 ) ) ( not ( = ?auto_95268 ?auto_95267 ) ) ( not ( = ?auto_95268 ?auto_95264 ) ) ( not ( = ?auto_95267 ?auto_95264 ) ) ( not ( = ?auto_95263 ?auto_95266 ) ) ( not ( = ?auto_95263 ?auto_95265 ) ) ( not ( = ?auto_95263 ?auto_95264 ) ) ( not ( = ?auto_95266 ?auto_95265 ) ) ( not ( = ?auto_95266 ?auto_95264 ) ) ( not ( = ?auto_95265 ?auto_95264 ) ) ( not ( = ?auto_95262 ?auto_95265 ) ) ( not ( = ?auto_95262 ?auto_95263 ) ) ( not ( = ?auto_95262 ?auto_95266 ) ) ( not ( = ?auto_95268 ?auto_95265 ) ) ( not ( = ?auto_95268 ?auto_95263 ) ) ( not ( = ?auto_95268 ?auto_95266 ) ) ( not ( = ?auto_95267 ?auto_95265 ) ) ( not ( = ?auto_95267 ?auto_95263 ) ) ( not ( = ?auto_95267 ?auto_95266 ) ) ( ON ?auto_95263 ?auto_95269 ) ( not ( = ?auto_95262 ?auto_95269 ) ) ( not ( = ?auto_95268 ?auto_95269 ) ) ( not ( = ?auto_95267 ?auto_95269 ) ) ( not ( = ?auto_95264 ?auto_95269 ) ) ( not ( = ?auto_95263 ?auto_95269 ) ) ( not ( = ?auto_95266 ?auto_95269 ) ) ( not ( = ?auto_95265 ?auto_95269 ) ) ( ON ?auto_95266 ?auto_95263 ) ( ON-TABLE ?auto_95269 ) ( ON ?auto_95265 ?auto_95266 ) ( ON ?auto_95264 ?auto_95265 ) ( CLEAR ?auto_95268 ) ( ON ?auto_95267 ?auto_95264 ) ( CLEAR ?auto_95267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95269 ?auto_95263 ?auto_95266 ?auto_95265 ?auto_95264 )
      ( MAKE-1PILE ?auto_95262 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95286 - BLOCK
    )
    :vars
    (
      ?auto_95289 - BLOCK
      ?auto_95292 - BLOCK
      ?auto_95291 - BLOCK
      ?auto_95287 - BLOCK
      ?auto_95293 - BLOCK
      ?auto_95290 - BLOCK
      ?auto_95288 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95286 ?auto_95289 ) ) ( not ( = ?auto_95286 ?auto_95292 ) ) ( not ( = ?auto_95286 ?auto_95291 ) ) ( not ( = ?auto_95289 ?auto_95292 ) ) ( not ( = ?auto_95289 ?auto_95291 ) ) ( not ( = ?auto_95292 ?auto_95291 ) ) ( not ( = ?auto_95287 ?auto_95293 ) ) ( not ( = ?auto_95287 ?auto_95290 ) ) ( not ( = ?auto_95287 ?auto_95291 ) ) ( not ( = ?auto_95293 ?auto_95290 ) ) ( not ( = ?auto_95293 ?auto_95291 ) ) ( not ( = ?auto_95290 ?auto_95291 ) ) ( not ( = ?auto_95286 ?auto_95290 ) ) ( not ( = ?auto_95286 ?auto_95287 ) ) ( not ( = ?auto_95286 ?auto_95293 ) ) ( not ( = ?auto_95289 ?auto_95290 ) ) ( not ( = ?auto_95289 ?auto_95287 ) ) ( not ( = ?auto_95289 ?auto_95293 ) ) ( not ( = ?auto_95292 ?auto_95290 ) ) ( not ( = ?auto_95292 ?auto_95287 ) ) ( not ( = ?auto_95292 ?auto_95293 ) ) ( ON ?auto_95287 ?auto_95288 ) ( not ( = ?auto_95286 ?auto_95288 ) ) ( not ( = ?auto_95289 ?auto_95288 ) ) ( not ( = ?auto_95292 ?auto_95288 ) ) ( not ( = ?auto_95291 ?auto_95288 ) ) ( not ( = ?auto_95287 ?auto_95288 ) ) ( not ( = ?auto_95293 ?auto_95288 ) ) ( not ( = ?auto_95290 ?auto_95288 ) ) ( ON ?auto_95293 ?auto_95287 ) ( ON-TABLE ?auto_95288 ) ( ON ?auto_95290 ?auto_95293 ) ( ON ?auto_95291 ?auto_95290 ) ( ON ?auto_95292 ?auto_95291 ) ( ON ?auto_95289 ?auto_95292 ) ( CLEAR ?auto_95289 ) ( HOLDING ?auto_95286 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95286 ?auto_95289 )
      ( MAKE-1PILE ?auto_95286 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95294 - BLOCK
    )
    :vars
    (
      ?auto_95297 - BLOCK
      ?auto_95298 - BLOCK
      ?auto_95301 - BLOCK
      ?auto_95299 - BLOCK
      ?auto_95296 - BLOCK
      ?auto_95295 - BLOCK
      ?auto_95300 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95294 ?auto_95297 ) ) ( not ( = ?auto_95294 ?auto_95298 ) ) ( not ( = ?auto_95294 ?auto_95301 ) ) ( not ( = ?auto_95297 ?auto_95298 ) ) ( not ( = ?auto_95297 ?auto_95301 ) ) ( not ( = ?auto_95298 ?auto_95301 ) ) ( not ( = ?auto_95299 ?auto_95296 ) ) ( not ( = ?auto_95299 ?auto_95295 ) ) ( not ( = ?auto_95299 ?auto_95301 ) ) ( not ( = ?auto_95296 ?auto_95295 ) ) ( not ( = ?auto_95296 ?auto_95301 ) ) ( not ( = ?auto_95295 ?auto_95301 ) ) ( not ( = ?auto_95294 ?auto_95295 ) ) ( not ( = ?auto_95294 ?auto_95299 ) ) ( not ( = ?auto_95294 ?auto_95296 ) ) ( not ( = ?auto_95297 ?auto_95295 ) ) ( not ( = ?auto_95297 ?auto_95299 ) ) ( not ( = ?auto_95297 ?auto_95296 ) ) ( not ( = ?auto_95298 ?auto_95295 ) ) ( not ( = ?auto_95298 ?auto_95299 ) ) ( not ( = ?auto_95298 ?auto_95296 ) ) ( ON ?auto_95299 ?auto_95300 ) ( not ( = ?auto_95294 ?auto_95300 ) ) ( not ( = ?auto_95297 ?auto_95300 ) ) ( not ( = ?auto_95298 ?auto_95300 ) ) ( not ( = ?auto_95301 ?auto_95300 ) ) ( not ( = ?auto_95299 ?auto_95300 ) ) ( not ( = ?auto_95296 ?auto_95300 ) ) ( not ( = ?auto_95295 ?auto_95300 ) ) ( ON ?auto_95296 ?auto_95299 ) ( ON-TABLE ?auto_95300 ) ( ON ?auto_95295 ?auto_95296 ) ( ON ?auto_95301 ?auto_95295 ) ( ON ?auto_95298 ?auto_95301 ) ( ON ?auto_95297 ?auto_95298 ) ( ON ?auto_95294 ?auto_95297 ) ( CLEAR ?auto_95294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95300 ?auto_95299 ?auto_95296 ?auto_95295 ?auto_95301 ?auto_95298 ?auto_95297 )
      ( MAKE-1PILE ?auto_95294 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95308 - BLOCK
      ?auto_95309 - BLOCK
      ?auto_95310 - BLOCK
      ?auto_95311 - BLOCK
      ?auto_95312 - BLOCK
      ?auto_95313 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_95313 ) ( CLEAR ?auto_95312 ) ( ON-TABLE ?auto_95308 ) ( ON ?auto_95309 ?auto_95308 ) ( ON ?auto_95310 ?auto_95309 ) ( ON ?auto_95311 ?auto_95310 ) ( ON ?auto_95312 ?auto_95311 ) ( not ( = ?auto_95308 ?auto_95309 ) ) ( not ( = ?auto_95308 ?auto_95310 ) ) ( not ( = ?auto_95308 ?auto_95311 ) ) ( not ( = ?auto_95308 ?auto_95312 ) ) ( not ( = ?auto_95308 ?auto_95313 ) ) ( not ( = ?auto_95309 ?auto_95310 ) ) ( not ( = ?auto_95309 ?auto_95311 ) ) ( not ( = ?auto_95309 ?auto_95312 ) ) ( not ( = ?auto_95309 ?auto_95313 ) ) ( not ( = ?auto_95310 ?auto_95311 ) ) ( not ( = ?auto_95310 ?auto_95312 ) ) ( not ( = ?auto_95310 ?auto_95313 ) ) ( not ( = ?auto_95311 ?auto_95312 ) ) ( not ( = ?auto_95311 ?auto_95313 ) ) ( not ( = ?auto_95312 ?auto_95313 ) ) )
    :subtasks
    ( ( !STACK ?auto_95313 ?auto_95312 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95314 - BLOCK
      ?auto_95315 - BLOCK
      ?auto_95316 - BLOCK
      ?auto_95317 - BLOCK
      ?auto_95318 - BLOCK
      ?auto_95319 - BLOCK
    )
    :vars
    (
      ?auto_95320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95318 ) ( ON-TABLE ?auto_95314 ) ( ON ?auto_95315 ?auto_95314 ) ( ON ?auto_95316 ?auto_95315 ) ( ON ?auto_95317 ?auto_95316 ) ( ON ?auto_95318 ?auto_95317 ) ( not ( = ?auto_95314 ?auto_95315 ) ) ( not ( = ?auto_95314 ?auto_95316 ) ) ( not ( = ?auto_95314 ?auto_95317 ) ) ( not ( = ?auto_95314 ?auto_95318 ) ) ( not ( = ?auto_95314 ?auto_95319 ) ) ( not ( = ?auto_95315 ?auto_95316 ) ) ( not ( = ?auto_95315 ?auto_95317 ) ) ( not ( = ?auto_95315 ?auto_95318 ) ) ( not ( = ?auto_95315 ?auto_95319 ) ) ( not ( = ?auto_95316 ?auto_95317 ) ) ( not ( = ?auto_95316 ?auto_95318 ) ) ( not ( = ?auto_95316 ?auto_95319 ) ) ( not ( = ?auto_95317 ?auto_95318 ) ) ( not ( = ?auto_95317 ?auto_95319 ) ) ( not ( = ?auto_95318 ?auto_95319 ) ) ( ON ?auto_95319 ?auto_95320 ) ( CLEAR ?auto_95319 ) ( HAND-EMPTY ) ( not ( = ?auto_95314 ?auto_95320 ) ) ( not ( = ?auto_95315 ?auto_95320 ) ) ( not ( = ?auto_95316 ?auto_95320 ) ) ( not ( = ?auto_95317 ?auto_95320 ) ) ( not ( = ?auto_95318 ?auto_95320 ) ) ( not ( = ?auto_95319 ?auto_95320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95319 ?auto_95320 )
      ( MAKE-6PILE ?auto_95314 ?auto_95315 ?auto_95316 ?auto_95317 ?auto_95318 ?auto_95319 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95321 - BLOCK
      ?auto_95322 - BLOCK
      ?auto_95323 - BLOCK
      ?auto_95324 - BLOCK
      ?auto_95325 - BLOCK
      ?auto_95326 - BLOCK
    )
    :vars
    (
      ?auto_95327 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95321 ) ( ON ?auto_95322 ?auto_95321 ) ( ON ?auto_95323 ?auto_95322 ) ( ON ?auto_95324 ?auto_95323 ) ( not ( = ?auto_95321 ?auto_95322 ) ) ( not ( = ?auto_95321 ?auto_95323 ) ) ( not ( = ?auto_95321 ?auto_95324 ) ) ( not ( = ?auto_95321 ?auto_95325 ) ) ( not ( = ?auto_95321 ?auto_95326 ) ) ( not ( = ?auto_95322 ?auto_95323 ) ) ( not ( = ?auto_95322 ?auto_95324 ) ) ( not ( = ?auto_95322 ?auto_95325 ) ) ( not ( = ?auto_95322 ?auto_95326 ) ) ( not ( = ?auto_95323 ?auto_95324 ) ) ( not ( = ?auto_95323 ?auto_95325 ) ) ( not ( = ?auto_95323 ?auto_95326 ) ) ( not ( = ?auto_95324 ?auto_95325 ) ) ( not ( = ?auto_95324 ?auto_95326 ) ) ( not ( = ?auto_95325 ?auto_95326 ) ) ( ON ?auto_95326 ?auto_95327 ) ( CLEAR ?auto_95326 ) ( not ( = ?auto_95321 ?auto_95327 ) ) ( not ( = ?auto_95322 ?auto_95327 ) ) ( not ( = ?auto_95323 ?auto_95327 ) ) ( not ( = ?auto_95324 ?auto_95327 ) ) ( not ( = ?auto_95325 ?auto_95327 ) ) ( not ( = ?auto_95326 ?auto_95327 ) ) ( HOLDING ?auto_95325 ) ( CLEAR ?auto_95324 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95321 ?auto_95322 ?auto_95323 ?auto_95324 ?auto_95325 )
      ( MAKE-6PILE ?auto_95321 ?auto_95322 ?auto_95323 ?auto_95324 ?auto_95325 ?auto_95326 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95328 - BLOCK
      ?auto_95329 - BLOCK
      ?auto_95330 - BLOCK
      ?auto_95331 - BLOCK
      ?auto_95332 - BLOCK
      ?auto_95333 - BLOCK
    )
    :vars
    (
      ?auto_95334 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95328 ) ( ON ?auto_95329 ?auto_95328 ) ( ON ?auto_95330 ?auto_95329 ) ( ON ?auto_95331 ?auto_95330 ) ( not ( = ?auto_95328 ?auto_95329 ) ) ( not ( = ?auto_95328 ?auto_95330 ) ) ( not ( = ?auto_95328 ?auto_95331 ) ) ( not ( = ?auto_95328 ?auto_95332 ) ) ( not ( = ?auto_95328 ?auto_95333 ) ) ( not ( = ?auto_95329 ?auto_95330 ) ) ( not ( = ?auto_95329 ?auto_95331 ) ) ( not ( = ?auto_95329 ?auto_95332 ) ) ( not ( = ?auto_95329 ?auto_95333 ) ) ( not ( = ?auto_95330 ?auto_95331 ) ) ( not ( = ?auto_95330 ?auto_95332 ) ) ( not ( = ?auto_95330 ?auto_95333 ) ) ( not ( = ?auto_95331 ?auto_95332 ) ) ( not ( = ?auto_95331 ?auto_95333 ) ) ( not ( = ?auto_95332 ?auto_95333 ) ) ( ON ?auto_95333 ?auto_95334 ) ( not ( = ?auto_95328 ?auto_95334 ) ) ( not ( = ?auto_95329 ?auto_95334 ) ) ( not ( = ?auto_95330 ?auto_95334 ) ) ( not ( = ?auto_95331 ?auto_95334 ) ) ( not ( = ?auto_95332 ?auto_95334 ) ) ( not ( = ?auto_95333 ?auto_95334 ) ) ( CLEAR ?auto_95331 ) ( ON ?auto_95332 ?auto_95333 ) ( CLEAR ?auto_95332 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95334 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95334 ?auto_95333 )
      ( MAKE-6PILE ?auto_95328 ?auto_95329 ?auto_95330 ?auto_95331 ?auto_95332 ?auto_95333 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95335 - BLOCK
      ?auto_95336 - BLOCK
      ?auto_95337 - BLOCK
      ?auto_95338 - BLOCK
      ?auto_95339 - BLOCK
      ?auto_95340 - BLOCK
    )
    :vars
    (
      ?auto_95341 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95335 ) ( ON ?auto_95336 ?auto_95335 ) ( ON ?auto_95337 ?auto_95336 ) ( not ( = ?auto_95335 ?auto_95336 ) ) ( not ( = ?auto_95335 ?auto_95337 ) ) ( not ( = ?auto_95335 ?auto_95338 ) ) ( not ( = ?auto_95335 ?auto_95339 ) ) ( not ( = ?auto_95335 ?auto_95340 ) ) ( not ( = ?auto_95336 ?auto_95337 ) ) ( not ( = ?auto_95336 ?auto_95338 ) ) ( not ( = ?auto_95336 ?auto_95339 ) ) ( not ( = ?auto_95336 ?auto_95340 ) ) ( not ( = ?auto_95337 ?auto_95338 ) ) ( not ( = ?auto_95337 ?auto_95339 ) ) ( not ( = ?auto_95337 ?auto_95340 ) ) ( not ( = ?auto_95338 ?auto_95339 ) ) ( not ( = ?auto_95338 ?auto_95340 ) ) ( not ( = ?auto_95339 ?auto_95340 ) ) ( ON ?auto_95340 ?auto_95341 ) ( not ( = ?auto_95335 ?auto_95341 ) ) ( not ( = ?auto_95336 ?auto_95341 ) ) ( not ( = ?auto_95337 ?auto_95341 ) ) ( not ( = ?auto_95338 ?auto_95341 ) ) ( not ( = ?auto_95339 ?auto_95341 ) ) ( not ( = ?auto_95340 ?auto_95341 ) ) ( ON ?auto_95339 ?auto_95340 ) ( CLEAR ?auto_95339 ) ( ON-TABLE ?auto_95341 ) ( HOLDING ?auto_95338 ) ( CLEAR ?auto_95337 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95335 ?auto_95336 ?auto_95337 ?auto_95338 )
      ( MAKE-6PILE ?auto_95335 ?auto_95336 ?auto_95337 ?auto_95338 ?auto_95339 ?auto_95340 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95342 - BLOCK
      ?auto_95343 - BLOCK
      ?auto_95344 - BLOCK
      ?auto_95345 - BLOCK
      ?auto_95346 - BLOCK
      ?auto_95347 - BLOCK
    )
    :vars
    (
      ?auto_95348 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95342 ) ( ON ?auto_95343 ?auto_95342 ) ( ON ?auto_95344 ?auto_95343 ) ( not ( = ?auto_95342 ?auto_95343 ) ) ( not ( = ?auto_95342 ?auto_95344 ) ) ( not ( = ?auto_95342 ?auto_95345 ) ) ( not ( = ?auto_95342 ?auto_95346 ) ) ( not ( = ?auto_95342 ?auto_95347 ) ) ( not ( = ?auto_95343 ?auto_95344 ) ) ( not ( = ?auto_95343 ?auto_95345 ) ) ( not ( = ?auto_95343 ?auto_95346 ) ) ( not ( = ?auto_95343 ?auto_95347 ) ) ( not ( = ?auto_95344 ?auto_95345 ) ) ( not ( = ?auto_95344 ?auto_95346 ) ) ( not ( = ?auto_95344 ?auto_95347 ) ) ( not ( = ?auto_95345 ?auto_95346 ) ) ( not ( = ?auto_95345 ?auto_95347 ) ) ( not ( = ?auto_95346 ?auto_95347 ) ) ( ON ?auto_95347 ?auto_95348 ) ( not ( = ?auto_95342 ?auto_95348 ) ) ( not ( = ?auto_95343 ?auto_95348 ) ) ( not ( = ?auto_95344 ?auto_95348 ) ) ( not ( = ?auto_95345 ?auto_95348 ) ) ( not ( = ?auto_95346 ?auto_95348 ) ) ( not ( = ?auto_95347 ?auto_95348 ) ) ( ON ?auto_95346 ?auto_95347 ) ( ON-TABLE ?auto_95348 ) ( CLEAR ?auto_95344 ) ( ON ?auto_95345 ?auto_95346 ) ( CLEAR ?auto_95345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95348 ?auto_95347 ?auto_95346 )
      ( MAKE-6PILE ?auto_95342 ?auto_95343 ?auto_95344 ?auto_95345 ?auto_95346 ?auto_95347 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95349 - BLOCK
      ?auto_95350 - BLOCK
      ?auto_95351 - BLOCK
      ?auto_95352 - BLOCK
      ?auto_95353 - BLOCK
      ?auto_95354 - BLOCK
    )
    :vars
    (
      ?auto_95355 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95349 ) ( ON ?auto_95350 ?auto_95349 ) ( not ( = ?auto_95349 ?auto_95350 ) ) ( not ( = ?auto_95349 ?auto_95351 ) ) ( not ( = ?auto_95349 ?auto_95352 ) ) ( not ( = ?auto_95349 ?auto_95353 ) ) ( not ( = ?auto_95349 ?auto_95354 ) ) ( not ( = ?auto_95350 ?auto_95351 ) ) ( not ( = ?auto_95350 ?auto_95352 ) ) ( not ( = ?auto_95350 ?auto_95353 ) ) ( not ( = ?auto_95350 ?auto_95354 ) ) ( not ( = ?auto_95351 ?auto_95352 ) ) ( not ( = ?auto_95351 ?auto_95353 ) ) ( not ( = ?auto_95351 ?auto_95354 ) ) ( not ( = ?auto_95352 ?auto_95353 ) ) ( not ( = ?auto_95352 ?auto_95354 ) ) ( not ( = ?auto_95353 ?auto_95354 ) ) ( ON ?auto_95354 ?auto_95355 ) ( not ( = ?auto_95349 ?auto_95355 ) ) ( not ( = ?auto_95350 ?auto_95355 ) ) ( not ( = ?auto_95351 ?auto_95355 ) ) ( not ( = ?auto_95352 ?auto_95355 ) ) ( not ( = ?auto_95353 ?auto_95355 ) ) ( not ( = ?auto_95354 ?auto_95355 ) ) ( ON ?auto_95353 ?auto_95354 ) ( ON-TABLE ?auto_95355 ) ( ON ?auto_95352 ?auto_95353 ) ( CLEAR ?auto_95352 ) ( HOLDING ?auto_95351 ) ( CLEAR ?auto_95350 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95349 ?auto_95350 ?auto_95351 )
      ( MAKE-6PILE ?auto_95349 ?auto_95350 ?auto_95351 ?auto_95352 ?auto_95353 ?auto_95354 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95356 - BLOCK
      ?auto_95357 - BLOCK
      ?auto_95358 - BLOCK
      ?auto_95359 - BLOCK
      ?auto_95360 - BLOCK
      ?auto_95361 - BLOCK
    )
    :vars
    (
      ?auto_95362 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95356 ) ( ON ?auto_95357 ?auto_95356 ) ( not ( = ?auto_95356 ?auto_95357 ) ) ( not ( = ?auto_95356 ?auto_95358 ) ) ( not ( = ?auto_95356 ?auto_95359 ) ) ( not ( = ?auto_95356 ?auto_95360 ) ) ( not ( = ?auto_95356 ?auto_95361 ) ) ( not ( = ?auto_95357 ?auto_95358 ) ) ( not ( = ?auto_95357 ?auto_95359 ) ) ( not ( = ?auto_95357 ?auto_95360 ) ) ( not ( = ?auto_95357 ?auto_95361 ) ) ( not ( = ?auto_95358 ?auto_95359 ) ) ( not ( = ?auto_95358 ?auto_95360 ) ) ( not ( = ?auto_95358 ?auto_95361 ) ) ( not ( = ?auto_95359 ?auto_95360 ) ) ( not ( = ?auto_95359 ?auto_95361 ) ) ( not ( = ?auto_95360 ?auto_95361 ) ) ( ON ?auto_95361 ?auto_95362 ) ( not ( = ?auto_95356 ?auto_95362 ) ) ( not ( = ?auto_95357 ?auto_95362 ) ) ( not ( = ?auto_95358 ?auto_95362 ) ) ( not ( = ?auto_95359 ?auto_95362 ) ) ( not ( = ?auto_95360 ?auto_95362 ) ) ( not ( = ?auto_95361 ?auto_95362 ) ) ( ON ?auto_95360 ?auto_95361 ) ( ON-TABLE ?auto_95362 ) ( ON ?auto_95359 ?auto_95360 ) ( CLEAR ?auto_95357 ) ( ON ?auto_95358 ?auto_95359 ) ( CLEAR ?auto_95358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95362 ?auto_95361 ?auto_95360 ?auto_95359 )
      ( MAKE-6PILE ?auto_95356 ?auto_95357 ?auto_95358 ?auto_95359 ?auto_95360 ?auto_95361 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95363 - BLOCK
      ?auto_95364 - BLOCK
      ?auto_95365 - BLOCK
      ?auto_95366 - BLOCK
      ?auto_95367 - BLOCK
      ?auto_95368 - BLOCK
    )
    :vars
    (
      ?auto_95369 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95363 ) ( not ( = ?auto_95363 ?auto_95364 ) ) ( not ( = ?auto_95363 ?auto_95365 ) ) ( not ( = ?auto_95363 ?auto_95366 ) ) ( not ( = ?auto_95363 ?auto_95367 ) ) ( not ( = ?auto_95363 ?auto_95368 ) ) ( not ( = ?auto_95364 ?auto_95365 ) ) ( not ( = ?auto_95364 ?auto_95366 ) ) ( not ( = ?auto_95364 ?auto_95367 ) ) ( not ( = ?auto_95364 ?auto_95368 ) ) ( not ( = ?auto_95365 ?auto_95366 ) ) ( not ( = ?auto_95365 ?auto_95367 ) ) ( not ( = ?auto_95365 ?auto_95368 ) ) ( not ( = ?auto_95366 ?auto_95367 ) ) ( not ( = ?auto_95366 ?auto_95368 ) ) ( not ( = ?auto_95367 ?auto_95368 ) ) ( ON ?auto_95368 ?auto_95369 ) ( not ( = ?auto_95363 ?auto_95369 ) ) ( not ( = ?auto_95364 ?auto_95369 ) ) ( not ( = ?auto_95365 ?auto_95369 ) ) ( not ( = ?auto_95366 ?auto_95369 ) ) ( not ( = ?auto_95367 ?auto_95369 ) ) ( not ( = ?auto_95368 ?auto_95369 ) ) ( ON ?auto_95367 ?auto_95368 ) ( ON-TABLE ?auto_95369 ) ( ON ?auto_95366 ?auto_95367 ) ( ON ?auto_95365 ?auto_95366 ) ( CLEAR ?auto_95365 ) ( HOLDING ?auto_95364 ) ( CLEAR ?auto_95363 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95363 ?auto_95364 )
      ( MAKE-6PILE ?auto_95363 ?auto_95364 ?auto_95365 ?auto_95366 ?auto_95367 ?auto_95368 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95370 - BLOCK
      ?auto_95371 - BLOCK
      ?auto_95372 - BLOCK
      ?auto_95373 - BLOCK
      ?auto_95374 - BLOCK
      ?auto_95375 - BLOCK
    )
    :vars
    (
      ?auto_95376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95370 ) ( not ( = ?auto_95370 ?auto_95371 ) ) ( not ( = ?auto_95370 ?auto_95372 ) ) ( not ( = ?auto_95370 ?auto_95373 ) ) ( not ( = ?auto_95370 ?auto_95374 ) ) ( not ( = ?auto_95370 ?auto_95375 ) ) ( not ( = ?auto_95371 ?auto_95372 ) ) ( not ( = ?auto_95371 ?auto_95373 ) ) ( not ( = ?auto_95371 ?auto_95374 ) ) ( not ( = ?auto_95371 ?auto_95375 ) ) ( not ( = ?auto_95372 ?auto_95373 ) ) ( not ( = ?auto_95372 ?auto_95374 ) ) ( not ( = ?auto_95372 ?auto_95375 ) ) ( not ( = ?auto_95373 ?auto_95374 ) ) ( not ( = ?auto_95373 ?auto_95375 ) ) ( not ( = ?auto_95374 ?auto_95375 ) ) ( ON ?auto_95375 ?auto_95376 ) ( not ( = ?auto_95370 ?auto_95376 ) ) ( not ( = ?auto_95371 ?auto_95376 ) ) ( not ( = ?auto_95372 ?auto_95376 ) ) ( not ( = ?auto_95373 ?auto_95376 ) ) ( not ( = ?auto_95374 ?auto_95376 ) ) ( not ( = ?auto_95375 ?auto_95376 ) ) ( ON ?auto_95374 ?auto_95375 ) ( ON-TABLE ?auto_95376 ) ( ON ?auto_95373 ?auto_95374 ) ( ON ?auto_95372 ?auto_95373 ) ( CLEAR ?auto_95370 ) ( ON ?auto_95371 ?auto_95372 ) ( CLEAR ?auto_95371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95376 ?auto_95375 ?auto_95374 ?auto_95373 ?auto_95372 )
      ( MAKE-6PILE ?auto_95370 ?auto_95371 ?auto_95372 ?auto_95373 ?auto_95374 ?auto_95375 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95377 - BLOCK
      ?auto_95378 - BLOCK
      ?auto_95379 - BLOCK
      ?auto_95380 - BLOCK
      ?auto_95381 - BLOCK
      ?auto_95382 - BLOCK
    )
    :vars
    (
      ?auto_95383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95377 ?auto_95378 ) ) ( not ( = ?auto_95377 ?auto_95379 ) ) ( not ( = ?auto_95377 ?auto_95380 ) ) ( not ( = ?auto_95377 ?auto_95381 ) ) ( not ( = ?auto_95377 ?auto_95382 ) ) ( not ( = ?auto_95378 ?auto_95379 ) ) ( not ( = ?auto_95378 ?auto_95380 ) ) ( not ( = ?auto_95378 ?auto_95381 ) ) ( not ( = ?auto_95378 ?auto_95382 ) ) ( not ( = ?auto_95379 ?auto_95380 ) ) ( not ( = ?auto_95379 ?auto_95381 ) ) ( not ( = ?auto_95379 ?auto_95382 ) ) ( not ( = ?auto_95380 ?auto_95381 ) ) ( not ( = ?auto_95380 ?auto_95382 ) ) ( not ( = ?auto_95381 ?auto_95382 ) ) ( ON ?auto_95382 ?auto_95383 ) ( not ( = ?auto_95377 ?auto_95383 ) ) ( not ( = ?auto_95378 ?auto_95383 ) ) ( not ( = ?auto_95379 ?auto_95383 ) ) ( not ( = ?auto_95380 ?auto_95383 ) ) ( not ( = ?auto_95381 ?auto_95383 ) ) ( not ( = ?auto_95382 ?auto_95383 ) ) ( ON ?auto_95381 ?auto_95382 ) ( ON-TABLE ?auto_95383 ) ( ON ?auto_95380 ?auto_95381 ) ( ON ?auto_95379 ?auto_95380 ) ( ON ?auto_95378 ?auto_95379 ) ( CLEAR ?auto_95378 ) ( HOLDING ?auto_95377 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95377 )
      ( MAKE-6PILE ?auto_95377 ?auto_95378 ?auto_95379 ?auto_95380 ?auto_95381 ?auto_95382 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95384 - BLOCK
      ?auto_95385 - BLOCK
      ?auto_95386 - BLOCK
      ?auto_95387 - BLOCK
      ?auto_95388 - BLOCK
      ?auto_95389 - BLOCK
    )
    :vars
    (
      ?auto_95390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95384 ?auto_95385 ) ) ( not ( = ?auto_95384 ?auto_95386 ) ) ( not ( = ?auto_95384 ?auto_95387 ) ) ( not ( = ?auto_95384 ?auto_95388 ) ) ( not ( = ?auto_95384 ?auto_95389 ) ) ( not ( = ?auto_95385 ?auto_95386 ) ) ( not ( = ?auto_95385 ?auto_95387 ) ) ( not ( = ?auto_95385 ?auto_95388 ) ) ( not ( = ?auto_95385 ?auto_95389 ) ) ( not ( = ?auto_95386 ?auto_95387 ) ) ( not ( = ?auto_95386 ?auto_95388 ) ) ( not ( = ?auto_95386 ?auto_95389 ) ) ( not ( = ?auto_95387 ?auto_95388 ) ) ( not ( = ?auto_95387 ?auto_95389 ) ) ( not ( = ?auto_95388 ?auto_95389 ) ) ( ON ?auto_95389 ?auto_95390 ) ( not ( = ?auto_95384 ?auto_95390 ) ) ( not ( = ?auto_95385 ?auto_95390 ) ) ( not ( = ?auto_95386 ?auto_95390 ) ) ( not ( = ?auto_95387 ?auto_95390 ) ) ( not ( = ?auto_95388 ?auto_95390 ) ) ( not ( = ?auto_95389 ?auto_95390 ) ) ( ON ?auto_95388 ?auto_95389 ) ( ON-TABLE ?auto_95390 ) ( ON ?auto_95387 ?auto_95388 ) ( ON ?auto_95386 ?auto_95387 ) ( ON ?auto_95385 ?auto_95386 ) ( ON ?auto_95384 ?auto_95385 ) ( CLEAR ?auto_95384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95390 ?auto_95389 ?auto_95388 ?auto_95387 ?auto_95386 ?auto_95385 )
      ( MAKE-6PILE ?auto_95384 ?auto_95385 ?auto_95386 ?auto_95387 ?auto_95388 ?auto_95389 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95391 - BLOCK
      ?auto_95392 - BLOCK
      ?auto_95393 - BLOCK
      ?auto_95394 - BLOCK
      ?auto_95395 - BLOCK
      ?auto_95396 - BLOCK
    )
    :vars
    (
      ?auto_95397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95391 ?auto_95392 ) ) ( not ( = ?auto_95391 ?auto_95393 ) ) ( not ( = ?auto_95391 ?auto_95394 ) ) ( not ( = ?auto_95391 ?auto_95395 ) ) ( not ( = ?auto_95391 ?auto_95396 ) ) ( not ( = ?auto_95392 ?auto_95393 ) ) ( not ( = ?auto_95392 ?auto_95394 ) ) ( not ( = ?auto_95392 ?auto_95395 ) ) ( not ( = ?auto_95392 ?auto_95396 ) ) ( not ( = ?auto_95393 ?auto_95394 ) ) ( not ( = ?auto_95393 ?auto_95395 ) ) ( not ( = ?auto_95393 ?auto_95396 ) ) ( not ( = ?auto_95394 ?auto_95395 ) ) ( not ( = ?auto_95394 ?auto_95396 ) ) ( not ( = ?auto_95395 ?auto_95396 ) ) ( ON ?auto_95396 ?auto_95397 ) ( not ( = ?auto_95391 ?auto_95397 ) ) ( not ( = ?auto_95392 ?auto_95397 ) ) ( not ( = ?auto_95393 ?auto_95397 ) ) ( not ( = ?auto_95394 ?auto_95397 ) ) ( not ( = ?auto_95395 ?auto_95397 ) ) ( not ( = ?auto_95396 ?auto_95397 ) ) ( ON ?auto_95395 ?auto_95396 ) ( ON-TABLE ?auto_95397 ) ( ON ?auto_95394 ?auto_95395 ) ( ON ?auto_95393 ?auto_95394 ) ( ON ?auto_95392 ?auto_95393 ) ( HOLDING ?auto_95391 ) ( CLEAR ?auto_95392 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95397 ?auto_95396 ?auto_95395 ?auto_95394 ?auto_95393 ?auto_95392 ?auto_95391 )
      ( MAKE-6PILE ?auto_95391 ?auto_95392 ?auto_95393 ?auto_95394 ?auto_95395 ?auto_95396 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95398 - BLOCK
      ?auto_95399 - BLOCK
      ?auto_95400 - BLOCK
      ?auto_95401 - BLOCK
      ?auto_95402 - BLOCK
      ?auto_95403 - BLOCK
    )
    :vars
    (
      ?auto_95404 - BLOCK
      ?auto_95405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95398 ?auto_95399 ) ) ( not ( = ?auto_95398 ?auto_95400 ) ) ( not ( = ?auto_95398 ?auto_95401 ) ) ( not ( = ?auto_95398 ?auto_95402 ) ) ( not ( = ?auto_95398 ?auto_95403 ) ) ( not ( = ?auto_95399 ?auto_95400 ) ) ( not ( = ?auto_95399 ?auto_95401 ) ) ( not ( = ?auto_95399 ?auto_95402 ) ) ( not ( = ?auto_95399 ?auto_95403 ) ) ( not ( = ?auto_95400 ?auto_95401 ) ) ( not ( = ?auto_95400 ?auto_95402 ) ) ( not ( = ?auto_95400 ?auto_95403 ) ) ( not ( = ?auto_95401 ?auto_95402 ) ) ( not ( = ?auto_95401 ?auto_95403 ) ) ( not ( = ?auto_95402 ?auto_95403 ) ) ( ON ?auto_95403 ?auto_95404 ) ( not ( = ?auto_95398 ?auto_95404 ) ) ( not ( = ?auto_95399 ?auto_95404 ) ) ( not ( = ?auto_95400 ?auto_95404 ) ) ( not ( = ?auto_95401 ?auto_95404 ) ) ( not ( = ?auto_95402 ?auto_95404 ) ) ( not ( = ?auto_95403 ?auto_95404 ) ) ( ON ?auto_95402 ?auto_95403 ) ( ON-TABLE ?auto_95404 ) ( ON ?auto_95401 ?auto_95402 ) ( ON ?auto_95400 ?auto_95401 ) ( ON ?auto_95399 ?auto_95400 ) ( CLEAR ?auto_95399 ) ( ON ?auto_95398 ?auto_95405 ) ( CLEAR ?auto_95398 ) ( HAND-EMPTY ) ( not ( = ?auto_95398 ?auto_95405 ) ) ( not ( = ?auto_95399 ?auto_95405 ) ) ( not ( = ?auto_95400 ?auto_95405 ) ) ( not ( = ?auto_95401 ?auto_95405 ) ) ( not ( = ?auto_95402 ?auto_95405 ) ) ( not ( = ?auto_95403 ?auto_95405 ) ) ( not ( = ?auto_95404 ?auto_95405 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95398 ?auto_95405 )
      ( MAKE-6PILE ?auto_95398 ?auto_95399 ?auto_95400 ?auto_95401 ?auto_95402 ?auto_95403 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95406 - BLOCK
      ?auto_95407 - BLOCK
      ?auto_95408 - BLOCK
      ?auto_95409 - BLOCK
      ?auto_95410 - BLOCK
      ?auto_95411 - BLOCK
    )
    :vars
    (
      ?auto_95413 - BLOCK
      ?auto_95412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95406 ?auto_95407 ) ) ( not ( = ?auto_95406 ?auto_95408 ) ) ( not ( = ?auto_95406 ?auto_95409 ) ) ( not ( = ?auto_95406 ?auto_95410 ) ) ( not ( = ?auto_95406 ?auto_95411 ) ) ( not ( = ?auto_95407 ?auto_95408 ) ) ( not ( = ?auto_95407 ?auto_95409 ) ) ( not ( = ?auto_95407 ?auto_95410 ) ) ( not ( = ?auto_95407 ?auto_95411 ) ) ( not ( = ?auto_95408 ?auto_95409 ) ) ( not ( = ?auto_95408 ?auto_95410 ) ) ( not ( = ?auto_95408 ?auto_95411 ) ) ( not ( = ?auto_95409 ?auto_95410 ) ) ( not ( = ?auto_95409 ?auto_95411 ) ) ( not ( = ?auto_95410 ?auto_95411 ) ) ( ON ?auto_95411 ?auto_95413 ) ( not ( = ?auto_95406 ?auto_95413 ) ) ( not ( = ?auto_95407 ?auto_95413 ) ) ( not ( = ?auto_95408 ?auto_95413 ) ) ( not ( = ?auto_95409 ?auto_95413 ) ) ( not ( = ?auto_95410 ?auto_95413 ) ) ( not ( = ?auto_95411 ?auto_95413 ) ) ( ON ?auto_95410 ?auto_95411 ) ( ON-TABLE ?auto_95413 ) ( ON ?auto_95409 ?auto_95410 ) ( ON ?auto_95408 ?auto_95409 ) ( ON ?auto_95406 ?auto_95412 ) ( CLEAR ?auto_95406 ) ( not ( = ?auto_95406 ?auto_95412 ) ) ( not ( = ?auto_95407 ?auto_95412 ) ) ( not ( = ?auto_95408 ?auto_95412 ) ) ( not ( = ?auto_95409 ?auto_95412 ) ) ( not ( = ?auto_95410 ?auto_95412 ) ) ( not ( = ?auto_95411 ?auto_95412 ) ) ( not ( = ?auto_95413 ?auto_95412 ) ) ( HOLDING ?auto_95407 ) ( CLEAR ?auto_95408 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95413 ?auto_95411 ?auto_95410 ?auto_95409 ?auto_95408 ?auto_95407 )
      ( MAKE-6PILE ?auto_95406 ?auto_95407 ?auto_95408 ?auto_95409 ?auto_95410 ?auto_95411 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95414 - BLOCK
      ?auto_95415 - BLOCK
      ?auto_95416 - BLOCK
      ?auto_95417 - BLOCK
      ?auto_95418 - BLOCK
      ?auto_95419 - BLOCK
    )
    :vars
    (
      ?auto_95421 - BLOCK
      ?auto_95420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95414 ?auto_95415 ) ) ( not ( = ?auto_95414 ?auto_95416 ) ) ( not ( = ?auto_95414 ?auto_95417 ) ) ( not ( = ?auto_95414 ?auto_95418 ) ) ( not ( = ?auto_95414 ?auto_95419 ) ) ( not ( = ?auto_95415 ?auto_95416 ) ) ( not ( = ?auto_95415 ?auto_95417 ) ) ( not ( = ?auto_95415 ?auto_95418 ) ) ( not ( = ?auto_95415 ?auto_95419 ) ) ( not ( = ?auto_95416 ?auto_95417 ) ) ( not ( = ?auto_95416 ?auto_95418 ) ) ( not ( = ?auto_95416 ?auto_95419 ) ) ( not ( = ?auto_95417 ?auto_95418 ) ) ( not ( = ?auto_95417 ?auto_95419 ) ) ( not ( = ?auto_95418 ?auto_95419 ) ) ( ON ?auto_95419 ?auto_95421 ) ( not ( = ?auto_95414 ?auto_95421 ) ) ( not ( = ?auto_95415 ?auto_95421 ) ) ( not ( = ?auto_95416 ?auto_95421 ) ) ( not ( = ?auto_95417 ?auto_95421 ) ) ( not ( = ?auto_95418 ?auto_95421 ) ) ( not ( = ?auto_95419 ?auto_95421 ) ) ( ON ?auto_95418 ?auto_95419 ) ( ON-TABLE ?auto_95421 ) ( ON ?auto_95417 ?auto_95418 ) ( ON ?auto_95416 ?auto_95417 ) ( ON ?auto_95414 ?auto_95420 ) ( not ( = ?auto_95414 ?auto_95420 ) ) ( not ( = ?auto_95415 ?auto_95420 ) ) ( not ( = ?auto_95416 ?auto_95420 ) ) ( not ( = ?auto_95417 ?auto_95420 ) ) ( not ( = ?auto_95418 ?auto_95420 ) ) ( not ( = ?auto_95419 ?auto_95420 ) ) ( not ( = ?auto_95421 ?auto_95420 ) ) ( CLEAR ?auto_95416 ) ( ON ?auto_95415 ?auto_95414 ) ( CLEAR ?auto_95415 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95420 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95420 ?auto_95414 )
      ( MAKE-6PILE ?auto_95414 ?auto_95415 ?auto_95416 ?auto_95417 ?auto_95418 ?auto_95419 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95422 - BLOCK
      ?auto_95423 - BLOCK
      ?auto_95424 - BLOCK
      ?auto_95425 - BLOCK
      ?auto_95426 - BLOCK
      ?auto_95427 - BLOCK
    )
    :vars
    (
      ?auto_95429 - BLOCK
      ?auto_95428 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95422 ?auto_95423 ) ) ( not ( = ?auto_95422 ?auto_95424 ) ) ( not ( = ?auto_95422 ?auto_95425 ) ) ( not ( = ?auto_95422 ?auto_95426 ) ) ( not ( = ?auto_95422 ?auto_95427 ) ) ( not ( = ?auto_95423 ?auto_95424 ) ) ( not ( = ?auto_95423 ?auto_95425 ) ) ( not ( = ?auto_95423 ?auto_95426 ) ) ( not ( = ?auto_95423 ?auto_95427 ) ) ( not ( = ?auto_95424 ?auto_95425 ) ) ( not ( = ?auto_95424 ?auto_95426 ) ) ( not ( = ?auto_95424 ?auto_95427 ) ) ( not ( = ?auto_95425 ?auto_95426 ) ) ( not ( = ?auto_95425 ?auto_95427 ) ) ( not ( = ?auto_95426 ?auto_95427 ) ) ( ON ?auto_95427 ?auto_95429 ) ( not ( = ?auto_95422 ?auto_95429 ) ) ( not ( = ?auto_95423 ?auto_95429 ) ) ( not ( = ?auto_95424 ?auto_95429 ) ) ( not ( = ?auto_95425 ?auto_95429 ) ) ( not ( = ?auto_95426 ?auto_95429 ) ) ( not ( = ?auto_95427 ?auto_95429 ) ) ( ON ?auto_95426 ?auto_95427 ) ( ON-TABLE ?auto_95429 ) ( ON ?auto_95425 ?auto_95426 ) ( ON ?auto_95422 ?auto_95428 ) ( not ( = ?auto_95422 ?auto_95428 ) ) ( not ( = ?auto_95423 ?auto_95428 ) ) ( not ( = ?auto_95424 ?auto_95428 ) ) ( not ( = ?auto_95425 ?auto_95428 ) ) ( not ( = ?auto_95426 ?auto_95428 ) ) ( not ( = ?auto_95427 ?auto_95428 ) ) ( not ( = ?auto_95429 ?auto_95428 ) ) ( ON ?auto_95423 ?auto_95422 ) ( CLEAR ?auto_95423 ) ( ON-TABLE ?auto_95428 ) ( HOLDING ?auto_95424 ) ( CLEAR ?auto_95425 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95429 ?auto_95427 ?auto_95426 ?auto_95425 ?auto_95424 )
      ( MAKE-6PILE ?auto_95422 ?auto_95423 ?auto_95424 ?auto_95425 ?auto_95426 ?auto_95427 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95430 - BLOCK
      ?auto_95431 - BLOCK
      ?auto_95432 - BLOCK
      ?auto_95433 - BLOCK
      ?auto_95434 - BLOCK
      ?auto_95435 - BLOCK
    )
    :vars
    (
      ?auto_95437 - BLOCK
      ?auto_95436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95430 ?auto_95431 ) ) ( not ( = ?auto_95430 ?auto_95432 ) ) ( not ( = ?auto_95430 ?auto_95433 ) ) ( not ( = ?auto_95430 ?auto_95434 ) ) ( not ( = ?auto_95430 ?auto_95435 ) ) ( not ( = ?auto_95431 ?auto_95432 ) ) ( not ( = ?auto_95431 ?auto_95433 ) ) ( not ( = ?auto_95431 ?auto_95434 ) ) ( not ( = ?auto_95431 ?auto_95435 ) ) ( not ( = ?auto_95432 ?auto_95433 ) ) ( not ( = ?auto_95432 ?auto_95434 ) ) ( not ( = ?auto_95432 ?auto_95435 ) ) ( not ( = ?auto_95433 ?auto_95434 ) ) ( not ( = ?auto_95433 ?auto_95435 ) ) ( not ( = ?auto_95434 ?auto_95435 ) ) ( ON ?auto_95435 ?auto_95437 ) ( not ( = ?auto_95430 ?auto_95437 ) ) ( not ( = ?auto_95431 ?auto_95437 ) ) ( not ( = ?auto_95432 ?auto_95437 ) ) ( not ( = ?auto_95433 ?auto_95437 ) ) ( not ( = ?auto_95434 ?auto_95437 ) ) ( not ( = ?auto_95435 ?auto_95437 ) ) ( ON ?auto_95434 ?auto_95435 ) ( ON-TABLE ?auto_95437 ) ( ON ?auto_95433 ?auto_95434 ) ( ON ?auto_95430 ?auto_95436 ) ( not ( = ?auto_95430 ?auto_95436 ) ) ( not ( = ?auto_95431 ?auto_95436 ) ) ( not ( = ?auto_95432 ?auto_95436 ) ) ( not ( = ?auto_95433 ?auto_95436 ) ) ( not ( = ?auto_95434 ?auto_95436 ) ) ( not ( = ?auto_95435 ?auto_95436 ) ) ( not ( = ?auto_95437 ?auto_95436 ) ) ( ON ?auto_95431 ?auto_95430 ) ( ON-TABLE ?auto_95436 ) ( CLEAR ?auto_95433 ) ( ON ?auto_95432 ?auto_95431 ) ( CLEAR ?auto_95432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95436 ?auto_95430 ?auto_95431 )
      ( MAKE-6PILE ?auto_95430 ?auto_95431 ?auto_95432 ?auto_95433 ?auto_95434 ?auto_95435 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95438 - BLOCK
      ?auto_95439 - BLOCK
      ?auto_95440 - BLOCK
      ?auto_95441 - BLOCK
      ?auto_95442 - BLOCK
      ?auto_95443 - BLOCK
    )
    :vars
    (
      ?auto_95445 - BLOCK
      ?auto_95444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95438 ?auto_95439 ) ) ( not ( = ?auto_95438 ?auto_95440 ) ) ( not ( = ?auto_95438 ?auto_95441 ) ) ( not ( = ?auto_95438 ?auto_95442 ) ) ( not ( = ?auto_95438 ?auto_95443 ) ) ( not ( = ?auto_95439 ?auto_95440 ) ) ( not ( = ?auto_95439 ?auto_95441 ) ) ( not ( = ?auto_95439 ?auto_95442 ) ) ( not ( = ?auto_95439 ?auto_95443 ) ) ( not ( = ?auto_95440 ?auto_95441 ) ) ( not ( = ?auto_95440 ?auto_95442 ) ) ( not ( = ?auto_95440 ?auto_95443 ) ) ( not ( = ?auto_95441 ?auto_95442 ) ) ( not ( = ?auto_95441 ?auto_95443 ) ) ( not ( = ?auto_95442 ?auto_95443 ) ) ( ON ?auto_95443 ?auto_95445 ) ( not ( = ?auto_95438 ?auto_95445 ) ) ( not ( = ?auto_95439 ?auto_95445 ) ) ( not ( = ?auto_95440 ?auto_95445 ) ) ( not ( = ?auto_95441 ?auto_95445 ) ) ( not ( = ?auto_95442 ?auto_95445 ) ) ( not ( = ?auto_95443 ?auto_95445 ) ) ( ON ?auto_95442 ?auto_95443 ) ( ON-TABLE ?auto_95445 ) ( ON ?auto_95438 ?auto_95444 ) ( not ( = ?auto_95438 ?auto_95444 ) ) ( not ( = ?auto_95439 ?auto_95444 ) ) ( not ( = ?auto_95440 ?auto_95444 ) ) ( not ( = ?auto_95441 ?auto_95444 ) ) ( not ( = ?auto_95442 ?auto_95444 ) ) ( not ( = ?auto_95443 ?auto_95444 ) ) ( not ( = ?auto_95445 ?auto_95444 ) ) ( ON ?auto_95439 ?auto_95438 ) ( ON-TABLE ?auto_95444 ) ( ON ?auto_95440 ?auto_95439 ) ( CLEAR ?auto_95440 ) ( HOLDING ?auto_95441 ) ( CLEAR ?auto_95442 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95445 ?auto_95443 ?auto_95442 ?auto_95441 )
      ( MAKE-6PILE ?auto_95438 ?auto_95439 ?auto_95440 ?auto_95441 ?auto_95442 ?auto_95443 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95446 - BLOCK
      ?auto_95447 - BLOCK
      ?auto_95448 - BLOCK
      ?auto_95449 - BLOCK
      ?auto_95450 - BLOCK
      ?auto_95451 - BLOCK
    )
    :vars
    (
      ?auto_95452 - BLOCK
      ?auto_95453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95446 ?auto_95447 ) ) ( not ( = ?auto_95446 ?auto_95448 ) ) ( not ( = ?auto_95446 ?auto_95449 ) ) ( not ( = ?auto_95446 ?auto_95450 ) ) ( not ( = ?auto_95446 ?auto_95451 ) ) ( not ( = ?auto_95447 ?auto_95448 ) ) ( not ( = ?auto_95447 ?auto_95449 ) ) ( not ( = ?auto_95447 ?auto_95450 ) ) ( not ( = ?auto_95447 ?auto_95451 ) ) ( not ( = ?auto_95448 ?auto_95449 ) ) ( not ( = ?auto_95448 ?auto_95450 ) ) ( not ( = ?auto_95448 ?auto_95451 ) ) ( not ( = ?auto_95449 ?auto_95450 ) ) ( not ( = ?auto_95449 ?auto_95451 ) ) ( not ( = ?auto_95450 ?auto_95451 ) ) ( ON ?auto_95451 ?auto_95452 ) ( not ( = ?auto_95446 ?auto_95452 ) ) ( not ( = ?auto_95447 ?auto_95452 ) ) ( not ( = ?auto_95448 ?auto_95452 ) ) ( not ( = ?auto_95449 ?auto_95452 ) ) ( not ( = ?auto_95450 ?auto_95452 ) ) ( not ( = ?auto_95451 ?auto_95452 ) ) ( ON ?auto_95450 ?auto_95451 ) ( ON-TABLE ?auto_95452 ) ( ON ?auto_95446 ?auto_95453 ) ( not ( = ?auto_95446 ?auto_95453 ) ) ( not ( = ?auto_95447 ?auto_95453 ) ) ( not ( = ?auto_95448 ?auto_95453 ) ) ( not ( = ?auto_95449 ?auto_95453 ) ) ( not ( = ?auto_95450 ?auto_95453 ) ) ( not ( = ?auto_95451 ?auto_95453 ) ) ( not ( = ?auto_95452 ?auto_95453 ) ) ( ON ?auto_95447 ?auto_95446 ) ( ON-TABLE ?auto_95453 ) ( ON ?auto_95448 ?auto_95447 ) ( CLEAR ?auto_95450 ) ( ON ?auto_95449 ?auto_95448 ) ( CLEAR ?auto_95449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95453 ?auto_95446 ?auto_95447 ?auto_95448 )
      ( MAKE-6PILE ?auto_95446 ?auto_95447 ?auto_95448 ?auto_95449 ?auto_95450 ?auto_95451 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95454 - BLOCK
      ?auto_95455 - BLOCK
      ?auto_95456 - BLOCK
      ?auto_95457 - BLOCK
      ?auto_95458 - BLOCK
      ?auto_95459 - BLOCK
    )
    :vars
    (
      ?auto_95460 - BLOCK
      ?auto_95461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95454 ?auto_95455 ) ) ( not ( = ?auto_95454 ?auto_95456 ) ) ( not ( = ?auto_95454 ?auto_95457 ) ) ( not ( = ?auto_95454 ?auto_95458 ) ) ( not ( = ?auto_95454 ?auto_95459 ) ) ( not ( = ?auto_95455 ?auto_95456 ) ) ( not ( = ?auto_95455 ?auto_95457 ) ) ( not ( = ?auto_95455 ?auto_95458 ) ) ( not ( = ?auto_95455 ?auto_95459 ) ) ( not ( = ?auto_95456 ?auto_95457 ) ) ( not ( = ?auto_95456 ?auto_95458 ) ) ( not ( = ?auto_95456 ?auto_95459 ) ) ( not ( = ?auto_95457 ?auto_95458 ) ) ( not ( = ?auto_95457 ?auto_95459 ) ) ( not ( = ?auto_95458 ?auto_95459 ) ) ( ON ?auto_95459 ?auto_95460 ) ( not ( = ?auto_95454 ?auto_95460 ) ) ( not ( = ?auto_95455 ?auto_95460 ) ) ( not ( = ?auto_95456 ?auto_95460 ) ) ( not ( = ?auto_95457 ?auto_95460 ) ) ( not ( = ?auto_95458 ?auto_95460 ) ) ( not ( = ?auto_95459 ?auto_95460 ) ) ( ON-TABLE ?auto_95460 ) ( ON ?auto_95454 ?auto_95461 ) ( not ( = ?auto_95454 ?auto_95461 ) ) ( not ( = ?auto_95455 ?auto_95461 ) ) ( not ( = ?auto_95456 ?auto_95461 ) ) ( not ( = ?auto_95457 ?auto_95461 ) ) ( not ( = ?auto_95458 ?auto_95461 ) ) ( not ( = ?auto_95459 ?auto_95461 ) ) ( not ( = ?auto_95460 ?auto_95461 ) ) ( ON ?auto_95455 ?auto_95454 ) ( ON-TABLE ?auto_95461 ) ( ON ?auto_95456 ?auto_95455 ) ( ON ?auto_95457 ?auto_95456 ) ( CLEAR ?auto_95457 ) ( HOLDING ?auto_95458 ) ( CLEAR ?auto_95459 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95460 ?auto_95459 ?auto_95458 )
      ( MAKE-6PILE ?auto_95454 ?auto_95455 ?auto_95456 ?auto_95457 ?auto_95458 ?auto_95459 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95462 - BLOCK
      ?auto_95463 - BLOCK
      ?auto_95464 - BLOCK
      ?auto_95465 - BLOCK
      ?auto_95466 - BLOCK
      ?auto_95467 - BLOCK
    )
    :vars
    (
      ?auto_95469 - BLOCK
      ?auto_95468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95462 ?auto_95463 ) ) ( not ( = ?auto_95462 ?auto_95464 ) ) ( not ( = ?auto_95462 ?auto_95465 ) ) ( not ( = ?auto_95462 ?auto_95466 ) ) ( not ( = ?auto_95462 ?auto_95467 ) ) ( not ( = ?auto_95463 ?auto_95464 ) ) ( not ( = ?auto_95463 ?auto_95465 ) ) ( not ( = ?auto_95463 ?auto_95466 ) ) ( not ( = ?auto_95463 ?auto_95467 ) ) ( not ( = ?auto_95464 ?auto_95465 ) ) ( not ( = ?auto_95464 ?auto_95466 ) ) ( not ( = ?auto_95464 ?auto_95467 ) ) ( not ( = ?auto_95465 ?auto_95466 ) ) ( not ( = ?auto_95465 ?auto_95467 ) ) ( not ( = ?auto_95466 ?auto_95467 ) ) ( ON ?auto_95467 ?auto_95469 ) ( not ( = ?auto_95462 ?auto_95469 ) ) ( not ( = ?auto_95463 ?auto_95469 ) ) ( not ( = ?auto_95464 ?auto_95469 ) ) ( not ( = ?auto_95465 ?auto_95469 ) ) ( not ( = ?auto_95466 ?auto_95469 ) ) ( not ( = ?auto_95467 ?auto_95469 ) ) ( ON-TABLE ?auto_95469 ) ( ON ?auto_95462 ?auto_95468 ) ( not ( = ?auto_95462 ?auto_95468 ) ) ( not ( = ?auto_95463 ?auto_95468 ) ) ( not ( = ?auto_95464 ?auto_95468 ) ) ( not ( = ?auto_95465 ?auto_95468 ) ) ( not ( = ?auto_95466 ?auto_95468 ) ) ( not ( = ?auto_95467 ?auto_95468 ) ) ( not ( = ?auto_95469 ?auto_95468 ) ) ( ON ?auto_95463 ?auto_95462 ) ( ON-TABLE ?auto_95468 ) ( ON ?auto_95464 ?auto_95463 ) ( ON ?auto_95465 ?auto_95464 ) ( CLEAR ?auto_95467 ) ( ON ?auto_95466 ?auto_95465 ) ( CLEAR ?auto_95466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95468 ?auto_95462 ?auto_95463 ?auto_95464 ?auto_95465 )
      ( MAKE-6PILE ?auto_95462 ?auto_95463 ?auto_95464 ?auto_95465 ?auto_95466 ?auto_95467 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95470 - BLOCK
      ?auto_95471 - BLOCK
      ?auto_95472 - BLOCK
      ?auto_95473 - BLOCK
      ?auto_95474 - BLOCK
      ?auto_95475 - BLOCK
    )
    :vars
    (
      ?auto_95477 - BLOCK
      ?auto_95476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95470 ?auto_95471 ) ) ( not ( = ?auto_95470 ?auto_95472 ) ) ( not ( = ?auto_95470 ?auto_95473 ) ) ( not ( = ?auto_95470 ?auto_95474 ) ) ( not ( = ?auto_95470 ?auto_95475 ) ) ( not ( = ?auto_95471 ?auto_95472 ) ) ( not ( = ?auto_95471 ?auto_95473 ) ) ( not ( = ?auto_95471 ?auto_95474 ) ) ( not ( = ?auto_95471 ?auto_95475 ) ) ( not ( = ?auto_95472 ?auto_95473 ) ) ( not ( = ?auto_95472 ?auto_95474 ) ) ( not ( = ?auto_95472 ?auto_95475 ) ) ( not ( = ?auto_95473 ?auto_95474 ) ) ( not ( = ?auto_95473 ?auto_95475 ) ) ( not ( = ?auto_95474 ?auto_95475 ) ) ( not ( = ?auto_95470 ?auto_95477 ) ) ( not ( = ?auto_95471 ?auto_95477 ) ) ( not ( = ?auto_95472 ?auto_95477 ) ) ( not ( = ?auto_95473 ?auto_95477 ) ) ( not ( = ?auto_95474 ?auto_95477 ) ) ( not ( = ?auto_95475 ?auto_95477 ) ) ( ON-TABLE ?auto_95477 ) ( ON ?auto_95470 ?auto_95476 ) ( not ( = ?auto_95470 ?auto_95476 ) ) ( not ( = ?auto_95471 ?auto_95476 ) ) ( not ( = ?auto_95472 ?auto_95476 ) ) ( not ( = ?auto_95473 ?auto_95476 ) ) ( not ( = ?auto_95474 ?auto_95476 ) ) ( not ( = ?auto_95475 ?auto_95476 ) ) ( not ( = ?auto_95477 ?auto_95476 ) ) ( ON ?auto_95471 ?auto_95470 ) ( ON-TABLE ?auto_95476 ) ( ON ?auto_95472 ?auto_95471 ) ( ON ?auto_95473 ?auto_95472 ) ( ON ?auto_95474 ?auto_95473 ) ( CLEAR ?auto_95474 ) ( HOLDING ?auto_95475 ) ( CLEAR ?auto_95477 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95477 ?auto_95475 )
      ( MAKE-6PILE ?auto_95470 ?auto_95471 ?auto_95472 ?auto_95473 ?auto_95474 ?auto_95475 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95478 - BLOCK
      ?auto_95479 - BLOCK
      ?auto_95480 - BLOCK
      ?auto_95481 - BLOCK
      ?auto_95482 - BLOCK
      ?auto_95483 - BLOCK
    )
    :vars
    (
      ?auto_95484 - BLOCK
      ?auto_95485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95478 ?auto_95479 ) ) ( not ( = ?auto_95478 ?auto_95480 ) ) ( not ( = ?auto_95478 ?auto_95481 ) ) ( not ( = ?auto_95478 ?auto_95482 ) ) ( not ( = ?auto_95478 ?auto_95483 ) ) ( not ( = ?auto_95479 ?auto_95480 ) ) ( not ( = ?auto_95479 ?auto_95481 ) ) ( not ( = ?auto_95479 ?auto_95482 ) ) ( not ( = ?auto_95479 ?auto_95483 ) ) ( not ( = ?auto_95480 ?auto_95481 ) ) ( not ( = ?auto_95480 ?auto_95482 ) ) ( not ( = ?auto_95480 ?auto_95483 ) ) ( not ( = ?auto_95481 ?auto_95482 ) ) ( not ( = ?auto_95481 ?auto_95483 ) ) ( not ( = ?auto_95482 ?auto_95483 ) ) ( not ( = ?auto_95478 ?auto_95484 ) ) ( not ( = ?auto_95479 ?auto_95484 ) ) ( not ( = ?auto_95480 ?auto_95484 ) ) ( not ( = ?auto_95481 ?auto_95484 ) ) ( not ( = ?auto_95482 ?auto_95484 ) ) ( not ( = ?auto_95483 ?auto_95484 ) ) ( ON-TABLE ?auto_95484 ) ( ON ?auto_95478 ?auto_95485 ) ( not ( = ?auto_95478 ?auto_95485 ) ) ( not ( = ?auto_95479 ?auto_95485 ) ) ( not ( = ?auto_95480 ?auto_95485 ) ) ( not ( = ?auto_95481 ?auto_95485 ) ) ( not ( = ?auto_95482 ?auto_95485 ) ) ( not ( = ?auto_95483 ?auto_95485 ) ) ( not ( = ?auto_95484 ?auto_95485 ) ) ( ON ?auto_95479 ?auto_95478 ) ( ON-TABLE ?auto_95485 ) ( ON ?auto_95480 ?auto_95479 ) ( ON ?auto_95481 ?auto_95480 ) ( ON ?auto_95482 ?auto_95481 ) ( CLEAR ?auto_95484 ) ( ON ?auto_95483 ?auto_95482 ) ( CLEAR ?auto_95483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95485 ?auto_95478 ?auto_95479 ?auto_95480 ?auto_95481 ?auto_95482 )
      ( MAKE-6PILE ?auto_95478 ?auto_95479 ?auto_95480 ?auto_95481 ?auto_95482 ?auto_95483 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95486 - BLOCK
      ?auto_95487 - BLOCK
      ?auto_95488 - BLOCK
      ?auto_95489 - BLOCK
      ?auto_95490 - BLOCK
      ?auto_95491 - BLOCK
    )
    :vars
    (
      ?auto_95492 - BLOCK
      ?auto_95493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95486 ?auto_95487 ) ) ( not ( = ?auto_95486 ?auto_95488 ) ) ( not ( = ?auto_95486 ?auto_95489 ) ) ( not ( = ?auto_95486 ?auto_95490 ) ) ( not ( = ?auto_95486 ?auto_95491 ) ) ( not ( = ?auto_95487 ?auto_95488 ) ) ( not ( = ?auto_95487 ?auto_95489 ) ) ( not ( = ?auto_95487 ?auto_95490 ) ) ( not ( = ?auto_95487 ?auto_95491 ) ) ( not ( = ?auto_95488 ?auto_95489 ) ) ( not ( = ?auto_95488 ?auto_95490 ) ) ( not ( = ?auto_95488 ?auto_95491 ) ) ( not ( = ?auto_95489 ?auto_95490 ) ) ( not ( = ?auto_95489 ?auto_95491 ) ) ( not ( = ?auto_95490 ?auto_95491 ) ) ( not ( = ?auto_95486 ?auto_95492 ) ) ( not ( = ?auto_95487 ?auto_95492 ) ) ( not ( = ?auto_95488 ?auto_95492 ) ) ( not ( = ?auto_95489 ?auto_95492 ) ) ( not ( = ?auto_95490 ?auto_95492 ) ) ( not ( = ?auto_95491 ?auto_95492 ) ) ( ON ?auto_95486 ?auto_95493 ) ( not ( = ?auto_95486 ?auto_95493 ) ) ( not ( = ?auto_95487 ?auto_95493 ) ) ( not ( = ?auto_95488 ?auto_95493 ) ) ( not ( = ?auto_95489 ?auto_95493 ) ) ( not ( = ?auto_95490 ?auto_95493 ) ) ( not ( = ?auto_95491 ?auto_95493 ) ) ( not ( = ?auto_95492 ?auto_95493 ) ) ( ON ?auto_95487 ?auto_95486 ) ( ON-TABLE ?auto_95493 ) ( ON ?auto_95488 ?auto_95487 ) ( ON ?auto_95489 ?auto_95488 ) ( ON ?auto_95490 ?auto_95489 ) ( ON ?auto_95491 ?auto_95490 ) ( CLEAR ?auto_95491 ) ( HOLDING ?auto_95492 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95492 )
      ( MAKE-6PILE ?auto_95486 ?auto_95487 ?auto_95488 ?auto_95489 ?auto_95490 ?auto_95491 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95494 - BLOCK
      ?auto_95495 - BLOCK
      ?auto_95496 - BLOCK
      ?auto_95497 - BLOCK
      ?auto_95498 - BLOCK
      ?auto_95499 - BLOCK
    )
    :vars
    (
      ?auto_95500 - BLOCK
      ?auto_95501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95494 ?auto_95495 ) ) ( not ( = ?auto_95494 ?auto_95496 ) ) ( not ( = ?auto_95494 ?auto_95497 ) ) ( not ( = ?auto_95494 ?auto_95498 ) ) ( not ( = ?auto_95494 ?auto_95499 ) ) ( not ( = ?auto_95495 ?auto_95496 ) ) ( not ( = ?auto_95495 ?auto_95497 ) ) ( not ( = ?auto_95495 ?auto_95498 ) ) ( not ( = ?auto_95495 ?auto_95499 ) ) ( not ( = ?auto_95496 ?auto_95497 ) ) ( not ( = ?auto_95496 ?auto_95498 ) ) ( not ( = ?auto_95496 ?auto_95499 ) ) ( not ( = ?auto_95497 ?auto_95498 ) ) ( not ( = ?auto_95497 ?auto_95499 ) ) ( not ( = ?auto_95498 ?auto_95499 ) ) ( not ( = ?auto_95494 ?auto_95500 ) ) ( not ( = ?auto_95495 ?auto_95500 ) ) ( not ( = ?auto_95496 ?auto_95500 ) ) ( not ( = ?auto_95497 ?auto_95500 ) ) ( not ( = ?auto_95498 ?auto_95500 ) ) ( not ( = ?auto_95499 ?auto_95500 ) ) ( ON ?auto_95494 ?auto_95501 ) ( not ( = ?auto_95494 ?auto_95501 ) ) ( not ( = ?auto_95495 ?auto_95501 ) ) ( not ( = ?auto_95496 ?auto_95501 ) ) ( not ( = ?auto_95497 ?auto_95501 ) ) ( not ( = ?auto_95498 ?auto_95501 ) ) ( not ( = ?auto_95499 ?auto_95501 ) ) ( not ( = ?auto_95500 ?auto_95501 ) ) ( ON ?auto_95495 ?auto_95494 ) ( ON-TABLE ?auto_95501 ) ( ON ?auto_95496 ?auto_95495 ) ( ON ?auto_95497 ?auto_95496 ) ( ON ?auto_95498 ?auto_95497 ) ( ON ?auto_95499 ?auto_95498 ) ( ON ?auto_95500 ?auto_95499 ) ( CLEAR ?auto_95500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95501 ?auto_95494 ?auto_95495 ?auto_95496 ?auto_95497 ?auto_95498 ?auto_95499 )
      ( MAKE-6PILE ?auto_95494 ?auto_95495 ?auto_95496 ?auto_95497 ?auto_95498 ?auto_95499 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95509 - BLOCK
      ?auto_95510 - BLOCK
      ?auto_95511 - BLOCK
      ?auto_95512 - BLOCK
      ?auto_95513 - BLOCK
      ?auto_95514 - BLOCK
      ?auto_95515 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_95515 ) ( CLEAR ?auto_95514 ) ( ON-TABLE ?auto_95509 ) ( ON ?auto_95510 ?auto_95509 ) ( ON ?auto_95511 ?auto_95510 ) ( ON ?auto_95512 ?auto_95511 ) ( ON ?auto_95513 ?auto_95512 ) ( ON ?auto_95514 ?auto_95513 ) ( not ( = ?auto_95509 ?auto_95510 ) ) ( not ( = ?auto_95509 ?auto_95511 ) ) ( not ( = ?auto_95509 ?auto_95512 ) ) ( not ( = ?auto_95509 ?auto_95513 ) ) ( not ( = ?auto_95509 ?auto_95514 ) ) ( not ( = ?auto_95509 ?auto_95515 ) ) ( not ( = ?auto_95510 ?auto_95511 ) ) ( not ( = ?auto_95510 ?auto_95512 ) ) ( not ( = ?auto_95510 ?auto_95513 ) ) ( not ( = ?auto_95510 ?auto_95514 ) ) ( not ( = ?auto_95510 ?auto_95515 ) ) ( not ( = ?auto_95511 ?auto_95512 ) ) ( not ( = ?auto_95511 ?auto_95513 ) ) ( not ( = ?auto_95511 ?auto_95514 ) ) ( not ( = ?auto_95511 ?auto_95515 ) ) ( not ( = ?auto_95512 ?auto_95513 ) ) ( not ( = ?auto_95512 ?auto_95514 ) ) ( not ( = ?auto_95512 ?auto_95515 ) ) ( not ( = ?auto_95513 ?auto_95514 ) ) ( not ( = ?auto_95513 ?auto_95515 ) ) ( not ( = ?auto_95514 ?auto_95515 ) ) )
    :subtasks
    ( ( !STACK ?auto_95515 ?auto_95514 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95516 - BLOCK
      ?auto_95517 - BLOCK
      ?auto_95518 - BLOCK
      ?auto_95519 - BLOCK
      ?auto_95520 - BLOCK
      ?auto_95521 - BLOCK
      ?auto_95522 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95521 ) ( ON-TABLE ?auto_95516 ) ( ON ?auto_95517 ?auto_95516 ) ( ON ?auto_95518 ?auto_95517 ) ( ON ?auto_95519 ?auto_95518 ) ( ON ?auto_95520 ?auto_95519 ) ( ON ?auto_95521 ?auto_95520 ) ( not ( = ?auto_95516 ?auto_95517 ) ) ( not ( = ?auto_95516 ?auto_95518 ) ) ( not ( = ?auto_95516 ?auto_95519 ) ) ( not ( = ?auto_95516 ?auto_95520 ) ) ( not ( = ?auto_95516 ?auto_95521 ) ) ( not ( = ?auto_95516 ?auto_95522 ) ) ( not ( = ?auto_95517 ?auto_95518 ) ) ( not ( = ?auto_95517 ?auto_95519 ) ) ( not ( = ?auto_95517 ?auto_95520 ) ) ( not ( = ?auto_95517 ?auto_95521 ) ) ( not ( = ?auto_95517 ?auto_95522 ) ) ( not ( = ?auto_95518 ?auto_95519 ) ) ( not ( = ?auto_95518 ?auto_95520 ) ) ( not ( = ?auto_95518 ?auto_95521 ) ) ( not ( = ?auto_95518 ?auto_95522 ) ) ( not ( = ?auto_95519 ?auto_95520 ) ) ( not ( = ?auto_95519 ?auto_95521 ) ) ( not ( = ?auto_95519 ?auto_95522 ) ) ( not ( = ?auto_95520 ?auto_95521 ) ) ( not ( = ?auto_95520 ?auto_95522 ) ) ( not ( = ?auto_95521 ?auto_95522 ) ) ( ON-TABLE ?auto_95522 ) ( CLEAR ?auto_95522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_95522 )
      ( MAKE-7PILE ?auto_95516 ?auto_95517 ?auto_95518 ?auto_95519 ?auto_95520 ?auto_95521 ?auto_95522 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95523 - BLOCK
      ?auto_95524 - BLOCK
      ?auto_95525 - BLOCK
      ?auto_95526 - BLOCK
      ?auto_95527 - BLOCK
      ?auto_95528 - BLOCK
      ?auto_95529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95523 ) ( ON ?auto_95524 ?auto_95523 ) ( ON ?auto_95525 ?auto_95524 ) ( ON ?auto_95526 ?auto_95525 ) ( ON ?auto_95527 ?auto_95526 ) ( not ( = ?auto_95523 ?auto_95524 ) ) ( not ( = ?auto_95523 ?auto_95525 ) ) ( not ( = ?auto_95523 ?auto_95526 ) ) ( not ( = ?auto_95523 ?auto_95527 ) ) ( not ( = ?auto_95523 ?auto_95528 ) ) ( not ( = ?auto_95523 ?auto_95529 ) ) ( not ( = ?auto_95524 ?auto_95525 ) ) ( not ( = ?auto_95524 ?auto_95526 ) ) ( not ( = ?auto_95524 ?auto_95527 ) ) ( not ( = ?auto_95524 ?auto_95528 ) ) ( not ( = ?auto_95524 ?auto_95529 ) ) ( not ( = ?auto_95525 ?auto_95526 ) ) ( not ( = ?auto_95525 ?auto_95527 ) ) ( not ( = ?auto_95525 ?auto_95528 ) ) ( not ( = ?auto_95525 ?auto_95529 ) ) ( not ( = ?auto_95526 ?auto_95527 ) ) ( not ( = ?auto_95526 ?auto_95528 ) ) ( not ( = ?auto_95526 ?auto_95529 ) ) ( not ( = ?auto_95527 ?auto_95528 ) ) ( not ( = ?auto_95527 ?auto_95529 ) ) ( not ( = ?auto_95528 ?auto_95529 ) ) ( ON-TABLE ?auto_95529 ) ( CLEAR ?auto_95529 ) ( HOLDING ?auto_95528 ) ( CLEAR ?auto_95527 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95523 ?auto_95524 ?auto_95525 ?auto_95526 ?auto_95527 ?auto_95528 )
      ( MAKE-7PILE ?auto_95523 ?auto_95524 ?auto_95525 ?auto_95526 ?auto_95527 ?auto_95528 ?auto_95529 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95530 - BLOCK
      ?auto_95531 - BLOCK
      ?auto_95532 - BLOCK
      ?auto_95533 - BLOCK
      ?auto_95534 - BLOCK
      ?auto_95535 - BLOCK
      ?auto_95536 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95530 ) ( ON ?auto_95531 ?auto_95530 ) ( ON ?auto_95532 ?auto_95531 ) ( ON ?auto_95533 ?auto_95532 ) ( ON ?auto_95534 ?auto_95533 ) ( not ( = ?auto_95530 ?auto_95531 ) ) ( not ( = ?auto_95530 ?auto_95532 ) ) ( not ( = ?auto_95530 ?auto_95533 ) ) ( not ( = ?auto_95530 ?auto_95534 ) ) ( not ( = ?auto_95530 ?auto_95535 ) ) ( not ( = ?auto_95530 ?auto_95536 ) ) ( not ( = ?auto_95531 ?auto_95532 ) ) ( not ( = ?auto_95531 ?auto_95533 ) ) ( not ( = ?auto_95531 ?auto_95534 ) ) ( not ( = ?auto_95531 ?auto_95535 ) ) ( not ( = ?auto_95531 ?auto_95536 ) ) ( not ( = ?auto_95532 ?auto_95533 ) ) ( not ( = ?auto_95532 ?auto_95534 ) ) ( not ( = ?auto_95532 ?auto_95535 ) ) ( not ( = ?auto_95532 ?auto_95536 ) ) ( not ( = ?auto_95533 ?auto_95534 ) ) ( not ( = ?auto_95533 ?auto_95535 ) ) ( not ( = ?auto_95533 ?auto_95536 ) ) ( not ( = ?auto_95534 ?auto_95535 ) ) ( not ( = ?auto_95534 ?auto_95536 ) ) ( not ( = ?auto_95535 ?auto_95536 ) ) ( ON-TABLE ?auto_95536 ) ( CLEAR ?auto_95534 ) ( ON ?auto_95535 ?auto_95536 ) ( CLEAR ?auto_95535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95536 )
      ( MAKE-7PILE ?auto_95530 ?auto_95531 ?auto_95532 ?auto_95533 ?auto_95534 ?auto_95535 ?auto_95536 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95537 - BLOCK
      ?auto_95538 - BLOCK
      ?auto_95539 - BLOCK
      ?auto_95540 - BLOCK
      ?auto_95541 - BLOCK
      ?auto_95542 - BLOCK
      ?auto_95543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95537 ) ( ON ?auto_95538 ?auto_95537 ) ( ON ?auto_95539 ?auto_95538 ) ( ON ?auto_95540 ?auto_95539 ) ( not ( = ?auto_95537 ?auto_95538 ) ) ( not ( = ?auto_95537 ?auto_95539 ) ) ( not ( = ?auto_95537 ?auto_95540 ) ) ( not ( = ?auto_95537 ?auto_95541 ) ) ( not ( = ?auto_95537 ?auto_95542 ) ) ( not ( = ?auto_95537 ?auto_95543 ) ) ( not ( = ?auto_95538 ?auto_95539 ) ) ( not ( = ?auto_95538 ?auto_95540 ) ) ( not ( = ?auto_95538 ?auto_95541 ) ) ( not ( = ?auto_95538 ?auto_95542 ) ) ( not ( = ?auto_95538 ?auto_95543 ) ) ( not ( = ?auto_95539 ?auto_95540 ) ) ( not ( = ?auto_95539 ?auto_95541 ) ) ( not ( = ?auto_95539 ?auto_95542 ) ) ( not ( = ?auto_95539 ?auto_95543 ) ) ( not ( = ?auto_95540 ?auto_95541 ) ) ( not ( = ?auto_95540 ?auto_95542 ) ) ( not ( = ?auto_95540 ?auto_95543 ) ) ( not ( = ?auto_95541 ?auto_95542 ) ) ( not ( = ?auto_95541 ?auto_95543 ) ) ( not ( = ?auto_95542 ?auto_95543 ) ) ( ON-TABLE ?auto_95543 ) ( ON ?auto_95542 ?auto_95543 ) ( CLEAR ?auto_95542 ) ( HOLDING ?auto_95541 ) ( CLEAR ?auto_95540 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95537 ?auto_95538 ?auto_95539 ?auto_95540 ?auto_95541 )
      ( MAKE-7PILE ?auto_95537 ?auto_95538 ?auto_95539 ?auto_95540 ?auto_95541 ?auto_95542 ?auto_95543 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95544 - BLOCK
      ?auto_95545 - BLOCK
      ?auto_95546 - BLOCK
      ?auto_95547 - BLOCK
      ?auto_95548 - BLOCK
      ?auto_95549 - BLOCK
      ?auto_95550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95544 ) ( ON ?auto_95545 ?auto_95544 ) ( ON ?auto_95546 ?auto_95545 ) ( ON ?auto_95547 ?auto_95546 ) ( not ( = ?auto_95544 ?auto_95545 ) ) ( not ( = ?auto_95544 ?auto_95546 ) ) ( not ( = ?auto_95544 ?auto_95547 ) ) ( not ( = ?auto_95544 ?auto_95548 ) ) ( not ( = ?auto_95544 ?auto_95549 ) ) ( not ( = ?auto_95544 ?auto_95550 ) ) ( not ( = ?auto_95545 ?auto_95546 ) ) ( not ( = ?auto_95545 ?auto_95547 ) ) ( not ( = ?auto_95545 ?auto_95548 ) ) ( not ( = ?auto_95545 ?auto_95549 ) ) ( not ( = ?auto_95545 ?auto_95550 ) ) ( not ( = ?auto_95546 ?auto_95547 ) ) ( not ( = ?auto_95546 ?auto_95548 ) ) ( not ( = ?auto_95546 ?auto_95549 ) ) ( not ( = ?auto_95546 ?auto_95550 ) ) ( not ( = ?auto_95547 ?auto_95548 ) ) ( not ( = ?auto_95547 ?auto_95549 ) ) ( not ( = ?auto_95547 ?auto_95550 ) ) ( not ( = ?auto_95548 ?auto_95549 ) ) ( not ( = ?auto_95548 ?auto_95550 ) ) ( not ( = ?auto_95549 ?auto_95550 ) ) ( ON-TABLE ?auto_95550 ) ( ON ?auto_95549 ?auto_95550 ) ( CLEAR ?auto_95547 ) ( ON ?auto_95548 ?auto_95549 ) ( CLEAR ?auto_95548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95550 ?auto_95549 )
      ( MAKE-7PILE ?auto_95544 ?auto_95545 ?auto_95546 ?auto_95547 ?auto_95548 ?auto_95549 ?auto_95550 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95551 - BLOCK
      ?auto_95552 - BLOCK
      ?auto_95553 - BLOCK
      ?auto_95554 - BLOCK
      ?auto_95555 - BLOCK
      ?auto_95556 - BLOCK
      ?auto_95557 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95551 ) ( ON ?auto_95552 ?auto_95551 ) ( ON ?auto_95553 ?auto_95552 ) ( not ( = ?auto_95551 ?auto_95552 ) ) ( not ( = ?auto_95551 ?auto_95553 ) ) ( not ( = ?auto_95551 ?auto_95554 ) ) ( not ( = ?auto_95551 ?auto_95555 ) ) ( not ( = ?auto_95551 ?auto_95556 ) ) ( not ( = ?auto_95551 ?auto_95557 ) ) ( not ( = ?auto_95552 ?auto_95553 ) ) ( not ( = ?auto_95552 ?auto_95554 ) ) ( not ( = ?auto_95552 ?auto_95555 ) ) ( not ( = ?auto_95552 ?auto_95556 ) ) ( not ( = ?auto_95552 ?auto_95557 ) ) ( not ( = ?auto_95553 ?auto_95554 ) ) ( not ( = ?auto_95553 ?auto_95555 ) ) ( not ( = ?auto_95553 ?auto_95556 ) ) ( not ( = ?auto_95553 ?auto_95557 ) ) ( not ( = ?auto_95554 ?auto_95555 ) ) ( not ( = ?auto_95554 ?auto_95556 ) ) ( not ( = ?auto_95554 ?auto_95557 ) ) ( not ( = ?auto_95555 ?auto_95556 ) ) ( not ( = ?auto_95555 ?auto_95557 ) ) ( not ( = ?auto_95556 ?auto_95557 ) ) ( ON-TABLE ?auto_95557 ) ( ON ?auto_95556 ?auto_95557 ) ( ON ?auto_95555 ?auto_95556 ) ( CLEAR ?auto_95555 ) ( HOLDING ?auto_95554 ) ( CLEAR ?auto_95553 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95551 ?auto_95552 ?auto_95553 ?auto_95554 )
      ( MAKE-7PILE ?auto_95551 ?auto_95552 ?auto_95553 ?auto_95554 ?auto_95555 ?auto_95556 ?auto_95557 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95558 - BLOCK
      ?auto_95559 - BLOCK
      ?auto_95560 - BLOCK
      ?auto_95561 - BLOCK
      ?auto_95562 - BLOCK
      ?auto_95563 - BLOCK
      ?auto_95564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95558 ) ( ON ?auto_95559 ?auto_95558 ) ( ON ?auto_95560 ?auto_95559 ) ( not ( = ?auto_95558 ?auto_95559 ) ) ( not ( = ?auto_95558 ?auto_95560 ) ) ( not ( = ?auto_95558 ?auto_95561 ) ) ( not ( = ?auto_95558 ?auto_95562 ) ) ( not ( = ?auto_95558 ?auto_95563 ) ) ( not ( = ?auto_95558 ?auto_95564 ) ) ( not ( = ?auto_95559 ?auto_95560 ) ) ( not ( = ?auto_95559 ?auto_95561 ) ) ( not ( = ?auto_95559 ?auto_95562 ) ) ( not ( = ?auto_95559 ?auto_95563 ) ) ( not ( = ?auto_95559 ?auto_95564 ) ) ( not ( = ?auto_95560 ?auto_95561 ) ) ( not ( = ?auto_95560 ?auto_95562 ) ) ( not ( = ?auto_95560 ?auto_95563 ) ) ( not ( = ?auto_95560 ?auto_95564 ) ) ( not ( = ?auto_95561 ?auto_95562 ) ) ( not ( = ?auto_95561 ?auto_95563 ) ) ( not ( = ?auto_95561 ?auto_95564 ) ) ( not ( = ?auto_95562 ?auto_95563 ) ) ( not ( = ?auto_95562 ?auto_95564 ) ) ( not ( = ?auto_95563 ?auto_95564 ) ) ( ON-TABLE ?auto_95564 ) ( ON ?auto_95563 ?auto_95564 ) ( ON ?auto_95562 ?auto_95563 ) ( CLEAR ?auto_95560 ) ( ON ?auto_95561 ?auto_95562 ) ( CLEAR ?auto_95561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95564 ?auto_95563 ?auto_95562 )
      ( MAKE-7PILE ?auto_95558 ?auto_95559 ?auto_95560 ?auto_95561 ?auto_95562 ?auto_95563 ?auto_95564 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95565 - BLOCK
      ?auto_95566 - BLOCK
      ?auto_95567 - BLOCK
      ?auto_95568 - BLOCK
      ?auto_95569 - BLOCK
      ?auto_95570 - BLOCK
      ?auto_95571 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95565 ) ( ON ?auto_95566 ?auto_95565 ) ( not ( = ?auto_95565 ?auto_95566 ) ) ( not ( = ?auto_95565 ?auto_95567 ) ) ( not ( = ?auto_95565 ?auto_95568 ) ) ( not ( = ?auto_95565 ?auto_95569 ) ) ( not ( = ?auto_95565 ?auto_95570 ) ) ( not ( = ?auto_95565 ?auto_95571 ) ) ( not ( = ?auto_95566 ?auto_95567 ) ) ( not ( = ?auto_95566 ?auto_95568 ) ) ( not ( = ?auto_95566 ?auto_95569 ) ) ( not ( = ?auto_95566 ?auto_95570 ) ) ( not ( = ?auto_95566 ?auto_95571 ) ) ( not ( = ?auto_95567 ?auto_95568 ) ) ( not ( = ?auto_95567 ?auto_95569 ) ) ( not ( = ?auto_95567 ?auto_95570 ) ) ( not ( = ?auto_95567 ?auto_95571 ) ) ( not ( = ?auto_95568 ?auto_95569 ) ) ( not ( = ?auto_95568 ?auto_95570 ) ) ( not ( = ?auto_95568 ?auto_95571 ) ) ( not ( = ?auto_95569 ?auto_95570 ) ) ( not ( = ?auto_95569 ?auto_95571 ) ) ( not ( = ?auto_95570 ?auto_95571 ) ) ( ON-TABLE ?auto_95571 ) ( ON ?auto_95570 ?auto_95571 ) ( ON ?auto_95569 ?auto_95570 ) ( ON ?auto_95568 ?auto_95569 ) ( CLEAR ?auto_95568 ) ( HOLDING ?auto_95567 ) ( CLEAR ?auto_95566 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95565 ?auto_95566 ?auto_95567 )
      ( MAKE-7PILE ?auto_95565 ?auto_95566 ?auto_95567 ?auto_95568 ?auto_95569 ?auto_95570 ?auto_95571 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95572 - BLOCK
      ?auto_95573 - BLOCK
      ?auto_95574 - BLOCK
      ?auto_95575 - BLOCK
      ?auto_95576 - BLOCK
      ?auto_95577 - BLOCK
      ?auto_95578 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95572 ) ( ON ?auto_95573 ?auto_95572 ) ( not ( = ?auto_95572 ?auto_95573 ) ) ( not ( = ?auto_95572 ?auto_95574 ) ) ( not ( = ?auto_95572 ?auto_95575 ) ) ( not ( = ?auto_95572 ?auto_95576 ) ) ( not ( = ?auto_95572 ?auto_95577 ) ) ( not ( = ?auto_95572 ?auto_95578 ) ) ( not ( = ?auto_95573 ?auto_95574 ) ) ( not ( = ?auto_95573 ?auto_95575 ) ) ( not ( = ?auto_95573 ?auto_95576 ) ) ( not ( = ?auto_95573 ?auto_95577 ) ) ( not ( = ?auto_95573 ?auto_95578 ) ) ( not ( = ?auto_95574 ?auto_95575 ) ) ( not ( = ?auto_95574 ?auto_95576 ) ) ( not ( = ?auto_95574 ?auto_95577 ) ) ( not ( = ?auto_95574 ?auto_95578 ) ) ( not ( = ?auto_95575 ?auto_95576 ) ) ( not ( = ?auto_95575 ?auto_95577 ) ) ( not ( = ?auto_95575 ?auto_95578 ) ) ( not ( = ?auto_95576 ?auto_95577 ) ) ( not ( = ?auto_95576 ?auto_95578 ) ) ( not ( = ?auto_95577 ?auto_95578 ) ) ( ON-TABLE ?auto_95578 ) ( ON ?auto_95577 ?auto_95578 ) ( ON ?auto_95576 ?auto_95577 ) ( ON ?auto_95575 ?auto_95576 ) ( CLEAR ?auto_95573 ) ( ON ?auto_95574 ?auto_95575 ) ( CLEAR ?auto_95574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95578 ?auto_95577 ?auto_95576 ?auto_95575 )
      ( MAKE-7PILE ?auto_95572 ?auto_95573 ?auto_95574 ?auto_95575 ?auto_95576 ?auto_95577 ?auto_95578 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95579 - BLOCK
      ?auto_95580 - BLOCK
      ?auto_95581 - BLOCK
      ?auto_95582 - BLOCK
      ?auto_95583 - BLOCK
      ?auto_95584 - BLOCK
      ?auto_95585 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95579 ) ( not ( = ?auto_95579 ?auto_95580 ) ) ( not ( = ?auto_95579 ?auto_95581 ) ) ( not ( = ?auto_95579 ?auto_95582 ) ) ( not ( = ?auto_95579 ?auto_95583 ) ) ( not ( = ?auto_95579 ?auto_95584 ) ) ( not ( = ?auto_95579 ?auto_95585 ) ) ( not ( = ?auto_95580 ?auto_95581 ) ) ( not ( = ?auto_95580 ?auto_95582 ) ) ( not ( = ?auto_95580 ?auto_95583 ) ) ( not ( = ?auto_95580 ?auto_95584 ) ) ( not ( = ?auto_95580 ?auto_95585 ) ) ( not ( = ?auto_95581 ?auto_95582 ) ) ( not ( = ?auto_95581 ?auto_95583 ) ) ( not ( = ?auto_95581 ?auto_95584 ) ) ( not ( = ?auto_95581 ?auto_95585 ) ) ( not ( = ?auto_95582 ?auto_95583 ) ) ( not ( = ?auto_95582 ?auto_95584 ) ) ( not ( = ?auto_95582 ?auto_95585 ) ) ( not ( = ?auto_95583 ?auto_95584 ) ) ( not ( = ?auto_95583 ?auto_95585 ) ) ( not ( = ?auto_95584 ?auto_95585 ) ) ( ON-TABLE ?auto_95585 ) ( ON ?auto_95584 ?auto_95585 ) ( ON ?auto_95583 ?auto_95584 ) ( ON ?auto_95582 ?auto_95583 ) ( ON ?auto_95581 ?auto_95582 ) ( CLEAR ?auto_95581 ) ( HOLDING ?auto_95580 ) ( CLEAR ?auto_95579 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95579 ?auto_95580 )
      ( MAKE-7PILE ?auto_95579 ?auto_95580 ?auto_95581 ?auto_95582 ?auto_95583 ?auto_95584 ?auto_95585 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95586 - BLOCK
      ?auto_95587 - BLOCK
      ?auto_95588 - BLOCK
      ?auto_95589 - BLOCK
      ?auto_95590 - BLOCK
      ?auto_95591 - BLOCK
      ?auto_95592 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95586 ) ( not ( = ?auto_95586 ?auto_95587 ) ) ( not ( = ?auto_95586 ?auto_95588 ) ) ( not ( = ?auto_95586 ?auto_95589 ) ) ( not ( = ?auto_95586 ?auto_95590 ) ) ( not ( = ?auto_95586 ?auto_95591 ) ) ( not ( = ?auto_95586 ?auto_95592 ) ) ( not ( = ?auto_95587 ?auto_95588 ) ) ( not ( = ?auto_95587 ?auto_95589 ) ) ( not ( = ?auto_95587 ?auto_95590 ) ) ( not ( = ?auto_95587 ?auto_95591 ) ) ( not ( = ?auto_95587 ?auto_95592 ) ) ( not ( = ?auto_95588 ?auto_95589 ) ) ( not ( = ?auto_95588 ?auto_95590 ) ) ( not ( = ?auto_95588 ?auto_95591 ) ) ( not ( = ?auto_95588 ?auto_95592 ) ) ( not ( = ?auto_95589 ?auto_95590 ) ) ( not ( = ?auto_95589 ?auto_95591 ) ) ( not ( = ?auto_95589 ?auto_95592 ) ) ( not ( = ?auto_95590 ?auto_95591 ) ) ( not ( = ?auto_95590 ?auto_95592 ) ) ( not ( = ?auto_95591 ?auto_95592 ) ) ( ON-TABLE ?auto_95592 ) ( ON ?auto_95591 ?auto_95592 ) ( ON ?auto_95590 ?auto_95591 ) ( ON ?auto_95589 ?auto_95590 ) ( ON ?auto_95588 ?auto_95589 ) ( CLEAR ?auto_95586 ) ( ON ?auto_95587 ?auto_95588 ) ( CLEAR ?auto_95587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95592 ?auto_95591 ?auto_95590 ?auto_95589 ?auto_95588 )
      ( MAKE-7PILE ?auto_95586 ?auto_95587 ?auto_95588 ?auto_95589 ?auto_95590 ?auto_95591 ?auto_95592 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95593 - BLOCK
      ?auto_95594 - BLOCK
      ?auto_95595 - BLOCK
      ?auto_95596 - BLOCK
      ?auto_95597 - BLOCK
      ?auto_95598 - BLOCK
      ?auto_95599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95593 ?auto_95594 ) ) ( not ( = ?auto_95593 ?auto_95595 ) ) ( not ( = ?auto_95593 ?auto_95596 ) ) ( not ( = ?auto_95593 ?auto_95597 ) ) ( not ( = ?auto_95593 ?auto_95598 ) ) ( not ( = ?auto_95593 ?auto_95599 ) ) ( not ( = ?auto_95594 ?auto_95595 ) ) ( not ( = ?auto_95594 ?auto_95596 ) ) ( not ( = ?auto_95594 ?auto_95597 ) ) ( not ( = ?auto_95594 ?auto_95598 ) ) ( not ( = ?auto_95594 ?auto_95599 ) ) ( not ( = ?auto_95595 ?auto_95596 ) ) ( not ( = ?auto_95595 ?auto_95597 ) ) ( not ( = ?auto_95595 ?auto_95598 ) ) ( not ( = ?auto_95595 ?auto_95599 ) ) ( not ( = ?auto_95596 ?auto_95597 ) ) ( not ( = ?auto_95596 ?auto_95598 ) ) ( not ( = ?auto_95596 ?auto_95599 ) ) ( not ( = ?auto_95597 ?auto_95598 ) ) ( not ( = ?auto_95597 ?auto_95599 ) ) ( not ( = ?auto_95598 ?auto_95599 ) ) ( ON-TABLE ?auto_95599 ) ( ON ?auto_95598 ?auto_95599 ) ( ON ?auto_95597 ?auto_95598 ) ( ON ?auto_95596 ?auto_95597 ) ( ON ?auto_95595 ?auto_95596 ) ( ON ?auto_95594 ?auto_95595 ) ( CLEAR ?auto_95594 ) ( HOLDING ?auto_95593 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95593 )
      ( MAKE-7PILE ?auto_95593 ?auto_95594 ?auto_95595 ?auto_95596 ?auto_95597 ?auto_95598 ?auto_95599 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95600 - BLOCK
      ?auto_95601 - BLOCK
      ?auto_95602 - BLOCK
      ?auto_95603 - BLOCK
      ?auto_95604 - BLOCK
      ?auto_95605 - BLOCK
      ?auto_95606 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95600 ?auto_95601 ) ) ( not ( = ?auto_95600 ?auto_95602 ) ) ( not ( = ?auto_95600 ?auto_95603 ) ) ( not ( = ?auto_95600 ?auto_95604 ) ) ( not ( = ?auto_95600 ?auto_95605 ) ) ( not ( = ?auto_95600 ?auto_95606 ) ) ( not ( = ?auto_95601 ?auto_95602 ) ) ( not ( = ?auto_95601 ?auto_95603 ) ) ( not ( = ?auto_95601 ?auto_95604 ) ) ( not ( = ?auto_95601 ?auto_95605 ) ) ( not ( = ?auto_95601 ?auto_95606 ) ) ( not ( = ?auto_95602 ?auto_95603 ) ) ( not ( = ?auto_95602 ?auto_95604 ) ) ( not ( = ?auto_95602 ?auto_95605 ) ) ( not ( = ?auto_95602 ?auto_95606 ) ) ( not ( = ?auto_95603 ?auto_95604 ) ) ( not ( = ?auto_95603 ?auto_95605 ) ) ( not ( = ?auto_95603 ?auto_95606 ) ) ( not ( = ?auto_95604 ?auto_95605 ) ) ( not ( = ?auto_95604 ?auto_95606 ) ) ( not ( = ?auto_95605 ?auto_95606 ) ) ( ON-TABLE ?auto_95606 ) ( ON ?auto_95605 ?auto_95606 ) ( ON ?auto_95604 ?auto_95605 ) ( ON ?auto_95603 ?auto_95604 ) ( ON ?auto_95602 ?auto_95603 ) ( ON ?auto_95601 ?auto_95602 ) ( ON ?auto_95600 ?auto_95601 ) ( CLEAR ?auto_95600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95606 ?auto_95605 ?auto_95604 ?auto_95603 ?auto_95602 ?auto_95601 )
      ( MAKE-7PILE ?auto_95600 ?auto_95601 ?auto_95602 ?auto_95603 ?auto_95604 ?auto_95605 ?auto_95606 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95607 - BLOCK
      ?auto_95608 - BLOCK
      ?auto_95609 - BLOCK
      ?auto_95610 - BLOCK
      ?auto_95611 - BLOCK
      ?auto_95612 - BLOCK
      ?auto_95613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95607 ?auto_95608 ) ) ( not ( = ?auto_95607 ?auto_95609 ) ) ( not ( = ?auto_95607 ?auto_95610 ) ) ( not ( = ?auto_95607 ?auto_95611 ) ) ( not ( = ?auto_95607 ?auto_95612 ) ) ( not ( = ?auto_95607 ?auto_95613 ) ) ( not ( = ?auto_95608 ?auto_95609 ) ) ( not ( = ?auto_95608 ?auto_95610 ) ) ( not ( = ?auto_95608 ?auto_95611 ) ) ( not ( = ?auto_95608 ?auto_95612 ) ) ( not ( = ?auto_95608 ?auto_95613 ) ) ( not ( = ?auto_95609 ?auto_95610 ) ) ( not ( = ?auto_95609 ?auto_95611 ) ) ( not ( = ?auto_95609 ?auto_95612 ) ) ( not ( = ?auto_95609 ?auto_95613 ) ) ( not ( = ?auto_95610 ?auto_95611 ) ) ( not ( = ?auto_95610 ?auto_95612 ) ) ( not ( = ?auto_95610 ?auto_95613 ) ) ( not ( = ?auto_95611 ?auto_95612 ) ) ( not ( = ?auto_95611 ?auto_95613 ) ) ( not ( = ?auto_95612 ?auto_95613 ) ) ( ON-TABLE ?auto_95613 ) ( ON ?auto_95612 ?auto_95613 ) ( ON ?auto_95611 ?auto_95612 ) ( ON ?auto_95610 ?auto_95611 ) ( ON ?auto_95609 ?auto_95610 ) ( ON ?auto_95608 ?auto_95609 ) ( HOLDING ?auto_95607 ) ( CLEAR ?auto_95608 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95613 ?auto_95612 ?auto_95611 ?auto_95610 ?auto_95609 ?auto_95608 ?auto_95607 )
      ( MAKE-7PILE ?auto_95607 ?auto_95608 ?auto_95609 ?auto_95610 ?auto_95611 ?auto_95612 ?auto_95613 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95614 - BLOCK
      ?auto_95615 - BLOCK
      ?auto_95616 - BLOCK
      ?auto_95617 - BLOCK
      ?auto_95618 - BLOCK
      ?auto_95619 - BLOCK
      ?auto_95620 - BLOCK
    )
    :vars
    (
      ?auto_95621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95614 ?auto_95615 ) ) ( not ( = ?auto_95614 ?auto_95616 ) ) ( not ( = ?auto_95614 ?auto_95617 ) ) ( not ( = ?auto_95614 ?auto_95618 ) ) ( not ( = ?auto_95614 ?auto_95619 ) ) ( not ( = ?auto_95614 ?auto_95620 ) ) ( not ( = ?auto_95615 ?auto_95616 ) ) ( not ( = ?auto_95615 ?auto_95617 ) ) ( not ( = ?auto_95615 ?auto_95618 ) ) ( not ( = ?auto_95615 ?auto_95619 ) ) ( not ( = ?auto_95615 ?auto_95620 ) ) ( not ( = ?auto_95616 ?auto_95617 ) ) ( not ( = ?auto_95616 ?auto_95618 ) ) ( not ( = ?auto_95616 ?auto_95619 ) ) ( not ( = ?auto_95616 ?auto_95620 ) ) ( not ( = ?auto_95617 ?auto_95618 ) ) ( not ( = ?auto_95617 ?auto_95619 ) ) ( not ( = ?auto_95617 ?auto_95620 ) ) ( not ( = ?auto_95618 ?auto_95619 ) ) ( not ( = ?auto_95618 ?auto_95620 ) ) ( not ( = ?auto_95619 ?auto_95620 ) ) ( ON-TABLE ?auto_95620 ) ( ON ?auto_95619 ?auto_95620 ) ( ON ?auto_95618 ?auto_95619 ) ( ON ?auto_95617 ?auto_95618 ) ( ON ?auto_95616 ?auto_95617 ) ( ON ?auto_95615 ?auto_95616 ) ( CLEAR ?auto_95615 ) ( ON ?auto_95614 ?auto_95621 ) ( CLEAR ?auto_95614 ) ( HAND-EMPTY ) ( not ( = ?auto_95614 ?auto_95621 ) ) ( not ( = ?auto_95615 ?auto_95621 ) ) ( not ( = ?auto_95616 ?auto_95621 ) ) ( not ( = ?auto_95617 ?auto_95621 ) ) ( not ( = ?auto_95618 ?auto_95621 ) ) ( not ( = ?auto_95619 ?auto_95621 ) ) ( not ( = ?auto_95620 ?auto_95621 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95614 ?auto_95621 )
      ( MAKE-7PILE ?auto_95614 ?auto_95615 ?auto_95616 ?auto_95617 ?auto_95618 ?auto_95619 ?auto_95620 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95622 - BLOCK
      ?auto_95623 - BLOCK
      ?auto_95624 - BLOCK
      ?auto_95625 - BLOCK
      ?auto_95626 - BLOCK
      ?auto_95627 - BLOCK
      ?auto_95628 - BLOCK
    )
    :vars
    (
      ?auto_95629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95622 ?auto_95623 ) ) ( not ( = ?auto_95622 ?auto_95624 ) ) ( not ( = ?auto_95622 ?auto_95625 ) ) ( not ( = ?auto_95622 ?auto_95626 ) ) ( not ( = ?auto_95622 ?auto_95627 ) ) ( not ( = ?auto_95622 ?auto_95628 ) ) ( not ( = ?auto_95623 ?auto_95624 ) ) ( not ( = ?auto_95623 ?auto_95625 ) ) ( not ( = ?auto_95623 ?auto_95626 ) ) ( not ( = ?auto_95623 ?auto_95627 ) ) ( not ( = ?auto_95623 ?auto_95628 ) ) ( not ( = ?auto_95624 ?auto_95625 ) ) ( not ( = ?auto_95624 ?auto_95626 ) ) ( not ( = ?auto_95624 ?auto_95627 ) ) ( not ( = ?auto_95624 ?auto_95628 ) ) ( not ( = ?auto_95625 ?auto_95626 ) ) ( not ( = ?auto_95625 ?auto_95627 ) ) ( not ( = ?auto_95625 ?auto_95628 ) ) ( not ( = ?auto_95626 ?auto_95627 ) ) ( not ( = ?auto_95626 ?auto_95628 ) ) ( not ( = ?auto_95627 ?auto_95628 ) ) ( ON-TABLE ?auto_95628 ) ( ON ?auto_95627 ?auto_95628 ) ( ON ?auto_95626 ?auto_95627 ) ( ON ?auto_95625 ?auto_95626 ) ( ON ?auto_95624 ?auto_95625 ) ( ON ?auto_95622 ?auto_95629 ) ( CLEAR ?auto_95622 ) ( not ( = ?auto_95622 ?auto_95629 ) ) ( not ( = ?auto_95623 ?auto_95629 ) ) ( not ( = ?auto_95624 ?auto_95629 ) ) ( not ( = ?auto_95625 ?auto_95629 ) ) ( not ( = ?auto_95626 ?auto_95629 ) ) ( not ( = ?auto_95627 ?auto_95629 ) ) ( not ( = ?auto_95628 ?auto_95629 ) ) ( HOLDING ?auto_95623 ) ( CLEAR ?auto_95624 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95628 ?auto_95627 ?auto_95626 ?auto_95625 ?auto_95624 ?auto_95623 )
      ( MAKE-7PILE ?auto_95622 ?auto_95623 ?auto_95624 ?auto_95625 ?auto_95626 ?auto_95627 ?auto_95628 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95630 - BLOCK
      ?auto_95631 - BLOCK
      ?auto_95632 - BLOCK
      ?auto_95633 - BLOCK
      ?auto_95634 - BLOCK
      ?auto_95635 - BLOCK
      ?auto_95636 - BLOCK
    )
    :vars
    (
      ?auto_95637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95630 ?auto_95631 ) ) ( not ( = ?auto_95630 ?auto_95632 ) ) ( not ( = ?auto_95630 ?auto_95633 ) ) ( not ( = ?auto_95630 ?auto_95634 ) ) ( not ( = ?auto_95630 ?auto_95635 ) ) ( not ( = ?auto_95630 ?auto_95636 ) ) ( not ( = ?auto_95631 ?auto_95632 ) ) ( not ( = ?auto_95631 ?auto_95633 ) ) ( not ( = ?auto_95631 ?auto_95634 ) ) ( not ( = ?auto_95631 ?auto_95635 ) ) ( not ( = ?auto_95631 ?auto_95636 ) ) ( not ( = ?auto_95632 ?auto_95633 ) ) ( not ( = ?auto_95632 ?auto_95634 ) ) ( not ( = ?auto_95632 ?auto_95635 ) ) ( not ( = ?auto_95632 ?auto_95636 ) ) ( not ( = ?auto_95633 ?auto_95634 ) ) ( not ( = ?auto_95633 ?auto_95635 ) ) ( not ( = ?auto_95633 ?auto_95636 ) ) ( not ( = ?auto_95634 ?auto_95635 ) ) ( not ( = ?auto_95634 ?auto_95636 ) ) ( not ( = ?auto_95635 ?auto_95636 ) ) ( ON-TABLE ?auto_95636 ) ( ON ?auto_95635 ?auto_95636 ) ( ON ?auto_95634 ?auto_95635 ) ( ON ?auto_95633 ?auto_95634 ) ( ON ?auto_95632 ?auto_95633 ) ( ON ?auto_95630 ?auto_95637 ) ( not ( = ?auto_95630 ?auto_95637 ) ) ( not ( = ?auto_95631 ?auto_95637 ) ) ( not ( = ?auto_95632 ?auto_95637 ) ) ( not ( = ?auto_95633 ?auto_95637 ) ) ( not ( = ?auto_95634 ?auto_95637 ) ) ( not ( = ?auto_95635 ?auto_95637 ) ) ( not ( = ?auto_95636 ?auto_95637 ) ) ( CLEAR ?auto_95632 ) ( ON ?auto_95631 ?auto_95630 ) ( CLEAR ?auto_95631 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95637 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95637 ?auto_95630 )
      ( MAKE-7PILE ?auto_95630 ?auto_95631 ?auto_95632 ?auto_95633 ?auto_95634 ?auto_95635 ?auto_95636 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95638 - BLOCK
      ?auto_95639 - BLOCK
      ?auto_95640 - BLOCK
      ?auto_95641 - BLOCK
      ?auto_95642 - BLOCK
      ?auto_95643 - BLOCK
      ?auto_95644 - BLOCK
    )
    :vars
    (
      ?auto_95645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95638 ?auto_95639 ) ) ( not ( = ?auto_95638 ?auto_95640 ) ) ( not ( = ?auto_95638 ?auto_95641 ) ) ( not ( = ?auto_95638 ?auto_95642 ) ) ( not ( = ?auto_95638 ?auto_95643 ) ) ( not ( = ?auto_95638 ?auto_95644 ) ) ( not ( = ?auto_95639 ?auto_95640 ) ) ( not ( = ?auto_95639 ?auto_95641 ) ) ( not ( = ?auto_95639 ?auto_95642 ) ) ( not ( = ?auto_95639 ?auto_95643 ) ) ( not ( = ?auto_95639 ?auto_95644 ) ) ( not ( = ?auto_95640 ?auto_95641 ) ) ( not ( = ?auto_95640 ?auto_95642 ) ) ( not ( = ?auto_95640 ?auto_95643 ) ) ( not ( = ?auto_95640 ?auto_95644 ) ) ( not ( = ?auto_95641 ?auto_95642 ) ) ( not ( = ?auto_95641 ?auto_95643 ) ) ( not ( = ?auto_95641 ?auto_95644 ) ) ( not ( = ?auto_95642 ?auto_95643 ) ) ( not ( = ?auto_95642 ?auto_95644 ) ) ( not ( = ?auto_95643 ?auto_95644 ) ) ( ON-TABLE ?auto_95644 ) ( ON ?auto_95643 ?auto_95644 ) ( ON ?auto_95642 ?auto_95643 ) ( ON ?auto_95641 ?auto_95642 ) ( ON ?auto_95638 ?auto_95645 ) ( not ( = ?auto_95638 ?auto_95645 ) ) ( not ( = ?auto_95639 ?auto_95645 ) ) ( not ( = ?auto_95640 ?auto_95645 ) ) ( not ( = ?auto_95641 ?auto_95645 ) ) ( not ( = ?auto_95642 ?auto_95645 ) ) ( not ( = ?auto_95643 ?auto_95645 ) ) ( not ( = ?auto_95644 ?auto_95645 ) ) ( ON ?auto_95639 ?auto_95638 ) ( CLEAR ?auto_95639 ) ( ON-TABLE ?auto_95645 ) ( HOLDING ?auto_95640 ) ( CLEAR ?auto_95641 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95644 ?auto_95643 ?auto_95642 ?auto_95641 ?auto_95640 )
      ( MAKE-7PILE ?auto_95638 ?auto_95639 ?auto_95640 ?auto_95641 ?auto_95642 ?auto_95643 ?auto_95644 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95646 - BLOCK
      ?auto_95647 - BLOCK
      ?auto_95648 - BLOCK
      ?auto_95649 - BLOCK
      ?auto_95650 - BLOCK
      ?auto_95651 - BLOCK
      ?auto_95652 - BLOCK
    )
    :vars
    (
      ?auto_95653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95646 ?auto_95647 ) ) ( not ( = ?auto_95646 ?auto_95648 ) ) ( not ( = ?auto_95646 ?auto_95649 ) ) ( not ( = ?auto_95646 ?auto_95650 ) ) ( not ( = ?auto_95646 ?auto_95651 ) ) ( not ( = ?auto_95646 ?auto_95652 ) ) ( not ( = ?auto_95647 ?auto_95648 ) ) ( not ( = ?auto_95647 ?auto_95649 ) ) ( not ( = ?auto_95647 ?auto_95650 ) ) ( not ( = ?auto_95647 ?auto_95651 ) ) ( not ( = ?auto_95647 ?auto_95652 ) ) ( not ( = ?auto_95648 ?auto_95649 ) ) ( not ( = ?auto_95648 ?auto_95650 ) ) ( not ( = ?auto_95648 ?auto_95651 ) ) ( not ( = ?auto_95648 ?auto_95652 ) ) ( not ( = ?auto_95649 ?auto_95650 ) ) ( not ( = ?auto_95649 ?auto_95651 ) ) ( not ( = ?auto_95649 ?auto_95652 ) ) ( not ( = ?auto_95650 ?auto_95651 ) ) ( not ( = ?auto_95650 ?auto_95652 ) ) ( not ( = ?auto_95651 ?auto_95652 ) ) ( ON-TABLE ?auto_95652 ) ( ON ?auto_95651 ?auto_95652 ) ( ON ?auto_95650 ?auto_95651 ) ( ON ?auto_95649 ?auto_95650 ) ( ON ?auto_95646 ?auto_95653 ) ( not ( = ?auto_95646 ?auto_95653 ) ) ( not ( = ?auto_95647 ?auto_95653 ) ) ( not ( = ?auto_95648 ?auto_95653 ) ) ( not ( = ?auto_95649 ?auto_95653 ) ) ( not ( = ?auto_95650 ?auto_95653 ) ) ( not ( = ?auto_95651 ?auto_95653 ) ) ( not ( = ?auto_95652 ?auto_95653 ) ) ( ON ?auto_95647 ?auto_95646 ) ( ON-TABLE ?auto_95653 ) ( CLEAR ?auto_95649 ) ( ON ?auto_95648 ?auto_95647 ) ( CLEAR ?auto_95648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95653 ?auto_95646 ?auto_95647 )
      ( MAKE-7PILE ?auto_95646 ?auto_95647 ?auto_95648 ?auto_95649 ?auto_95650 ?auto_95651 ?auto_95652 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95654 - BLOCK
      ?auto_95655 - BLOCK
      ?auto_95656 - BLOCK
      ?auto_95657 - BLOCK
      ?auto_95658 - BLOCK
      ?auto_95659 - BLOCK
      ?auto_95660 - BLOCK
    )
    :vars
    (
      ?auto_95661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95654 ?auto_95655 ) ) ( not ( = ?auto_95654 ?auto_95656 ) ) ( not ( = ?auto_95654 ?auto_95657 ) ) ( not ( = ?auto_95654 ?auto_95658 ) ) ( not ( = ?auto_95654 ?auto_95659 ) ) ( not ( = ?auto_95654 ?auto_95660 ) ) ( not ( = ?auto_95655 ?auto_95656 ) ) ( not ( = ?auto_95655 ?auto_95657 ) ) ( not ( = ?auto_95655 ?auto_95658 ) ) ( not ( = ?auto_95655 ?auto_95659 ) ) ( not ( = ?auto_95655 ?auto_95660 ) ) ( not ( = ?auto_95656 ?auto_95657 ) ) ( not ( = ?auto_95656 ?auto_95658 ) ) ( not ( = ?auto_95656 ?auto_95659 ) ) ( not ( = ?auto_95656 ?auto_95660 ) ) ( not ( = ?auto_95657 ?auto_95658 ) ) ( not ( = ?auto_95657 ?auto_95659 ) ) ( not ( = ?auto_95657 ?auto_95660 ) ) ( not ( = ?auto_95658 ?auto_95659 ) ) ( not ( = ?auto_95658 ?auto_95660 ) ) ( not ( = ?auto_95659 ?auto_95660 ) ) ( ON-TABLE ?auto_95660 ) ( ON ?auto_95659 ?auto_95660 ) ( ON ?auto_95658 ?auto_95659 ) ( ON ?auto_95654 ?auto_95661 ) ( not ( = ?auto_95654 ?auto_95661 ) ) ( not ( = ?auto_95655 ?auto_95661 ) ) ( not ( = ?auto_95656 ?auto_95661 ) ) ( not ( = ?auto_95657 ?auto_95661 ) ) ( not ( = ?auto_95658 ?auto_95661 ) ) ( not ( = ?auto_95659 ?auto_95661 ) ) ( not ( = ?auto_95660 ?auto_95661 ) ) ( ON ?auto_95655 ?auto_95654 ) ( ON-TABLE ?auto_95661 ) ( ON ?auto_95656 ?auto_95655 ) ( CLEAR ?auto_95656 ) ( HOLDING ?auto_95657 ) ( CLEAR ?auto_95658 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95660 ?auto_95659 ?auto_95658 ?auto_95657 )
      ( MAKE-7PILE ?auto_95654 ?auto_95655 ?auto_95656 ?auto_95657 ?auto_95658 ?auto_95659 ?auto_95660 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95662 - BLOCK
      ?auto_95663 - BLOCK
      ?auto_95664 - BLOCK
      ?auto_95665 - BLOCK
      ?auto_95666 - BLOCK
      ?auto_95667 - BLOCK
      ?auto_95668 - BLOCK
    )
    :vars
    (
      ?auto_95669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95662 ?auto_95663 ) ) ( not ( = ?auto_95662 ?auto_95664 ) ) ( not ( = ?auto_95662 ?auto_95665 ) ) ( not ( = ?auto_95662 ?auto_95666 ) ) ( not ( = ?auto_95662 ?auto_95667 ) ) ( not ( = ?auto_95662 ?auto_95668 ) ) ( not ( = ?auto_95663 ?auto_95664 ) ) ( not ( = ?auto_95663 ?auto_95665 ) ) ( not ( = ?auto_95663 ?auto_95666 ) ) ( not ( = ?auto_95663 ?auto_95667 ) ) ( not ( = ?auto_95663 ?auto_95668 ) ) ( not ( = ?auto_95664 ?auto_95665 ) ) ( not ( = ?auto_95664 ?auto_95666 ) ) ( not ( = ?auto_95664 ?auto_95667 ) ) ( not ( = ?auto_95664 ?auto_95668 ) ) ( not ( = ?auto_95665 ?auto_95666 ) ) ( not ( = ?auto_95665 ?auto_95667 ) ) ( not ( = ?auto_95665 ?auto_95668 ) ) ( not ( = ?auto_95666 ?auto_95667 ) ) ( not ( = ?auto_95666 ?auto_95668 ) ) ( not ( = ?auto_95667 ?auto_95668 ) ) ( ON-TABLE ?auto_95668 ) ( ON ?auto_95667 ?auto_95668 ) ( ON ?auto_95666 ?auto_95667 ) ( ON ?auto_95662 ?auto_95669 ) ( not ( = ?auto_95662 ?auto_95669 ) ) ( not ( = ?auto_95663 ?auto_95669 ) ) ( not ( = ?auto_95664 ?auto_95669 ) ) ( not ( = ?auto_95665 ?auto_95669 ) ) ( not ( = ?auto_95666 ?auto_95669 ) ) ( not ( = ?auto_95667 ?auto_95669 ) ) ( not ( = ?auto_95668 ?auto_95669 ) ) ( ON ?auto_95663 ?auto_95662 ) ( ON-TABLE ?auto_95669 ) ( ON ?auto_95664 ?auto_95663 ) ( CLEAR ?auto_95666 ) ( ON ?auto_95665 ?auto_95664 ) ( CLEAR ?auto_95665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95669 ?auto_95662 ?auto_95663 ?auto_95664 )
      ( MAKE-7PILE ?auto_95662 ?auto_95663 ?auto_95664 ?auto_95665 ?auto_95666 ?auto_95667 ?auto_95668 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95670 - BLOCK
      ?auto_95671 - BLOCK
      ?auto_95672 - BLOCK
      ?auto_95673 - BLOCK
      ?auto_95674 - BLOCK
      ?auto_95675 - BLOCK
      ?auto_95676 - BLOCK
    )
    :vars
    (
      ?auto_95677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95670 ?auto_95671 ) ) ( not ( = ?auto_95670 ?auto_95672 ) ) ( not ( = ?auto_95670 ?auto_95673 ) ) ( not ( = ?auto_95670 ?auto_95674 ) ) ( not ( = ?auto_95670 ?auto_95675 ) ) ( not ( = ?auto_95670 ?auto_95676 ) ) ( not ( = ?auto_95671 ?auto_95672 ) ) ( not ( = ?auto_95671 ?auto_95673 ) ) ( not ( = ?auto_95671 ?auto_95674 ) ) ( not ( = ?auto_95671 ?auto_95675 ) ) ( not ( = ?auto_95671 ?auto_95676 ) ) ( not ( = ?auto_95672 ?auto_95673 ) ) ( not ( = ?auto_95672 ?auto_95674 ) ) ( not ( = ?auto_95672 ?auto_95675 ) ) ( not ( = ?auto_95672 ?auto_95676 ) ) ( not ( = ?auto_95673 ?auto_95674 ) ) ( not ( = ?auto_95673 ?auto_95675 ) ) ( not ( = ?auto_95673 ?auto_95676 ) ) ( not ( = ?auto_95674 ?auto_95675 ) ) ( not ( = ?auto_95674 ?auto_95676 ) ) ( not ( = ?auto_95675 ?auto_95676 ) ) ( ON-TABLE ?auto_95676 ) ( ON ?auto_95675 ?auto_95676 ) ( ON ?auto_95670 ?auto_95677 ) ( not ( = ?auto_95670 ?auto_95677 ) ) ( not ( = ?auto_95671 ?auto_95677 ) ) ( not ( = ?auto_95672 ?auto_95677 ) ) ( not ( = ?auto_95673 ?auto_95677 ) ) ( not ( = ?auto_95674 ?auto_95677 ) ) ( not ( = ?auto_95675 ?auto_95677 ) ) ( not ( = ?auto_95676 ?auto_95677 ) ) ( ON ?auto_95671 ?auto_95670 ) ( ON-TABLE ?auto_95677 ) ( ON ?auto_95672 ?auto_95671 ) ( ON ?auto_95673 ?auto_95672 ) ( CLEAR ?auto_95673 ) ( HOLDING ?auto_95674 ) ( CLEAR ?auto_95675 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95676 ?auto_95675 ?auto_95674 )
      ( MAKE-7PILE ?auto_95670 ?auto_95671 ?auto_95672 ?auto_95673 ?auto_95674 ?auto_95675 ?auto_95676 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95678 - BLOCK
      ?auto_95679 - BLOCK
      ?auto_95680 - BLOCK
      ?auto_95681 - BLOCK
      ?auto_95682 - BLOCK
      ?auto_95683 - BLOCK
      ?auto_95684 - BLOCK
    )
    :vars
    (
      ?auto_95685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95678 ?auto_95679 ) ) ( not ( = ?auto_95678 ?auto_95680 ) ) ( not ( = ?auto_95678 ?auto_95681 ) ) ( not ( = ?auto_95678 ?auto_95682 ) ) ( not ( = ?auto_95678 ?auto_95683 ) ) ( not ( = ?auto_95678 ?auto_95684 ) ) ( not ( = ?auto_95679 ?auto_95680 ) ) ( not ( = ?auto_95679 ?auto_95681 ) ) ( not ( = ?auto_95679 ?auto_95682 ) ) ( not ( = ?auto_95679 ?auto_95683 ) ) ( not ( = ?auto_95679 ?auto_95684 ) ) ( not ( = ?auto_95680 ?auto_95681 ) ) ( not ( = ?auto_95680 ?auto_95682 ) ) ( not ( = ?auto_95680 ?auto_95683 ) ) ( not ( = ?auto_95680 ?auto_95684 ) ) ( not ( = ?auto_95681 ?auto_95682 ) ) ( not ( = ?auto_95681 ?auto_95683 ) ) ( not ( = ?auto_95681 ?auto_95684 ) ) ( not ( = ?auto_95682 ?auto_95683 ) ) ( not ( = ?auto_95682 ?auto_95684 ) ) ( not ( = ?auto_95683 ?auto_95684 ) ) ( ON-TABLE ?auto_95684 ) ( ON ?auto_95683 ?auto_95684 ) ( ON ?auto_95678 ?auto_95685 ) ( not ( = ?auto_95678 ?auto_95685 ) ) ( not ( = ?auto_95679 ?auto_95685 ) ) ( not ( = ?auto_95680 ?auto_95685 ) ) ( not ( = ?auto_95681 ?auto_95685 ) ) ( not ( = ?auto_95682 ?auto_95685 ) ) ( not ( = ?auto_95683 ?auto_95685 ) ) ( not ( = ?auto_95684 ?auto_95685 ) ) ( ON ?auto_95679 ?auto_95678 ) ( ON-TABLE ?auto_95685 ) ( ON ?auto_95680 ?auto_95679 ) ( ON ?auto_95681 ?auto_95680 ) ( CLEAR ?auto_95683 ) ( ON ?auto_95682 ?auto_95681 ) ( CLEAR ?auto_95682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95685 ?auto_95678 ?auto_95679 ?auto_95680 ?auto_95681 )
      ( MAKE-7PILE ?auto_95678 ?auto_95679 ?auto_95680 ?auto_95681 ?auto_95682 ?auto_95683 ?auto_95684 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95686 - BLOCK
      ?auto_95687 - BLOCK
      ?auto_95688 - BLOCK
      ?auto_95689 - BLOCK
      ?auto_95690 - BLOCK
      ?auto_95691 - BLOCK
      ?auto_95692 - BLOCK
    )
    :vars
    (
      ?auto_95693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95686 ?auto_95687 ) ) ( not ( = ?auto_95686 ?auto_95688 ) ) ( not ( = ?auto_95686 ?auto_95689 ) ) ( not ( = ?auto_95686 ?auto_95690 ) ) ( not ( = ?auto_95686 ?auto_95691 ) ) ( not ( = ?auto_95686 ?auto_95692 ) ) ( not ( = ?auto_95687 ?auto_95688 ) ) ( not ( = ?auto_95687 ?auto_95689 ) ) ( not ( = ?auto_95687 ?auto_95690 ) ) ( not ( = ?auto_95687 ?auto_95691 ) ) ( not ( = ?auto_95687 ?auto_95692 ) ) ( not ( = ?auto_95688 ?auto_95689 ) ) ( not ( = ?auto_95688 ?auto_95690 ) ) ( not ( = ?auto_95688 ?auto_95691 ) ) ( not ( = ?auto_95688 ?auto_95692 ) ) ( not ( = ?auto_95689 ?auto_95690 ) ) ( not ( = ?auto_95689 ?auto_95691 ) ) ( not ( = ?auto_95689 ?auto_95692 ) ) ( not ( = ?auto_95690 ?auto_95691 ) ) ( not ( = ?auto_95690 ?auto_95692 ) ) ( not ( = ?auto_95691 ?auto_95692 ) ) ( ON-TABLE ?auto_95692 ) ( ON ?auto_95686 ?auto_95693 ) ( not ( = ?auto_95686 ?auto_95693 ) ) ( not ( = ?auto_95687 ?auto_95693 ) ) ( not ( = ?auto_95688 ?auto_95693 ) ) ( not ( = ?auto_95689 ?auto_95693 ) ) ( not ( = ?auto_95690 ?auto_95693 ) ) ( not ( = ?auto_95691 ?auto_95693 ) ) ( not ( = ?auto_95692 ?auto_95693 ) ) ( ON ?auto_95687 ?auto_95686 ) ( ON-TABLE ?auto_95693 ) ( ON ?auto_95688 ?auto_95687 ) ( ON ?auto_95689 ?auto_95688 ) ( ON ?auto_95690 ?auto_95689 ) ( CLEAR ?auto_95690 ) ( HOLDING ?auto_95691 ) ( CLEAR ?auto_95692 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95692 ?auto_95691 )
      ( MAKE-7PILE ?auto_95686 ?auto_95687 ?auto_95688 ?auto_95689 ?auto_95690 ?auto_95691 ?auto_95692 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95694 - BLOCK
      ?auto_95695 - BLOCK
      ?auto_95696 - BLOCK
      ?auto_95697 - BLOCK
      ?auto_95698 - BLOCK
      ?auto_95699 - BLOCK
      ?auto_95700 - BLOCK
    )
    :vars
    (
      ?auto_95701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95694 ?auto_95695 ) ) ( not ( = ?auto_95694 ?auto_95696 ) ) ( not ( = ?auto_95694 ?auto_95697 ) ) ( not ( = ?auto_95694 ?auto_95698 ) ) ( not ( = ?auto_95694 ?auto_95699 ) ) ( not ( = ?auto_95694 ?auto_95700 ) ) ( not ( = ?auto_95695 ?auto_95696 ) ) ( not ( = ?auto_95695 ?auto_95697 ) ) ( not ( = ?auto_95695 ?auto_95698 ) ) ( not ( = ?auto_95695 ?auto_95699 ) ) ( not ( = ?auto_95695 ?auto_95700 ) ) ( not ( = ?auto_95696 ?auto_95697 ) ) ( not ( = ?auto_95696 ?auto_95698 ) ) ( not ( = ?auto_95696 ?auto_95699 ) ) ( not ( = ?auto_95696 ?auto_95700 ) ) ( not ( = ?auto_95697 ?auto_95698 ) ) ( not ( = ?auto_95697 ?auto_95699 ) ) ( not ( = ?auto_95697 ?auto_95700 ) ) ( not ( = ?auto_95698 ?auto_95699 ) ) ( not ( = ?auto_95698 ?auto_95700 ) ) ( not ( = ?auto_95699 ?auto_95700 ) ) ( ON-TABLE ?auto_95700 ) ( ON ?auto_95694 ?auto_95701 ) ( not ( = ?auto_95694 ?auto_95701 ) ) ( not ( = ?auto_95695 ?auto_95701 ) ) ( not ( = ?auto_95696 ?auto_95701 ) ) ( not ( = ?auto_95697 ?auto_95701 ) ) ( not ( = ?auto_95698 ?auto_95701 ) ) ( not ( = ?auto_95699 ?auto_95701 ) ) ( not ( = ?auto_95700 ?auto_95701 ) ) ( ON ?auto_95695 ?auto_95694 ) ( ON-TABLE ?auto_95701 ) ( ON ?auto_95696 ?auto_95695 ) ( ON ?auto_95697 ?auto_95696 ) ( ON ?auto_95698 ?auto_95697 ) ( CLEAR ?auto_95700 ) ( ON ?auto_95699 ?auto_95698 ) ( CLEAR ?auto_95699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95701 ?auto_95694 ?auto_95695 ?auto_95696 ?auto_95697 ?auto_95698 )
      ( MAKE-7PILE ?auto_95694 ?auto_95695 ?auto_95696 ?auto_95697 ?auto_95698 ?auto_95699 ?auto_95700 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95702 - BLOCK
      ?auto_95703 - BLOCK
      ?auto_95704 - BLOCK
      ?auto_95705 - BLOCK
      ?auto_95706 - BLOCK
      ?auto_95707 - BLOCK
      ?auto_95708 - BLOCK
    )
    :vars
    (
      ?auto_95709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95702 ?auto_95703 ) ) ( not ( = ?auto_95702 ?auto_95704 ) ) ( not ( = ?auto_95702 ?auto_95705 ) ) ( not ( = ?auto_95702 ?auto_95706 ) ) ( not ( = ?auto_95702 ?auto_95707 ) ) ( not ( = ?auto_95702 ?auto_95708 ) ) ( not ( = ?auto_95703 ?auto_95704 ) ) ( not ( = ?auto_95703 ?auto_95705 ) ) ( not ( = ?auto_95703 ?auto_95706 ) ) ( not ( = ?auto_95703 ?auto_95707 ) ) ( not ( = ?auto_95703 ?auto_95708 ) ) ( not ( = ?auto_95704 ?auto_95705 ) ) ( not ( = ?auto_95704 ?auto_95706 ) ) ( not ( = ?auto_95704 ?auto_95707 ) ) ( not ( = ?auto_95704 ?auto_95708 ) ) ( not ( = ?auto_95705 ?auto_95706 ) ) ( not ( = ?auto_95705 ?auto_95707 ) ) ( not ( = ?auto_95705 ?auto_95708 ) ) ( not ( = ?auto_95706 ?auto_95707 ) ) ( not ( = ?auto_95706 ?auto_95708 ) ) ( not ( = ?auto_95707 ?auto_95708 ) ) ( ON ?auto_95702 ?auto_95709 ) ( not ( = ?auto_95702 ?auto_95709 ) ) ( not ( = ?auto_95703 ?auto_95709 ) ) ( not ( = ?auto_95704 ?auto_95709 ) ) ( not ( = ?auto_95705 ?auto_95709 ) ) ( not ( = ?auto_95706 ?auto_95709 ) ) ( not ( = ?auto_95707 ?auto_95709 ) ) ( not ( = ?auto_95708 ?auto_95709 ) ) ( ON ?auto_95703 ?auto_95702 ) ( ON-TABLE ?auto_95709 ) ( ON ?auto_95704 ?auto_95703 ) ( ON ?auto_95705 ?auto_95704 ) ( ON ?auto_95706 ?auto_95705 ) ( ON ?auto_95707 ?auto_95706 ) ( CLEAR ?auto_95707 ) ( HOLDING ?auto_95708 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95708 )
      ( MAKE-7PILE ?auto_95702 ?auto_95703 ?auto_95704 ?auto_95705 ?auto_95706 ?auto_95707 ?auto_95708 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95710 - BLOCK
      ?auto_95711 - BLOCK
      ?auto_95712 - BLOCK
      ?auto_95713 - BLOCK
      ?auto_95714 - BLOCK
      ?auto_95715 - BLOCK
      ?auto_95716 - BLOCK
    )
    :vars
    (
      ?auto_95717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95710 ?auto_95711 ) ) ( not ( = ?auto_95710 ?auto_95712 ) ) ( not ( = ?auto_95710 ?auto_95713 ) ) ( not ( = ?auto_95710 ?auto_95714 ) ) ( not ( = ?auto_95710 ?auto_95715 ) ) ( not ( = ?auto_95710 ?auto_95716 ) ) ( not ( = ?auto_95711 ?auto_95712 ) ) ( not ( = ?auto_95711 ?auto_95713 ) ) ( not ( = ?auto_95711 ?auto_95714 ) ) ( not ( = ?auto_95711 ?auto_95715 ) ) ( not ( = ?auto_95711 ?auto_95716 ) ) ( not ( = ?auto_95712 ?auto_95713 ) ) ( not ( = ?auto_95712 ?auto_95714 ) ) ( not ( = ?auto_95712 ?auto_95715 ) ) ( not ( = ?auto_95712 ?auto_95716 ) ) ( not ( = ?auto_95713 ?auto_95714 ) ) ( not ( = ?auto_95713 ?auto_95715 ) ) ( not ( = ?auto_95713 ?auto_95716 ) ) ( not ( = ?auto_95714 ?auto_95715 ) ) ( not ( = ?auto_95714 ?auto_95716 ) ) ( not ( = ?auto_95715 ?auto_95716 ) ) ( ON ?auto_95710 ?auto_95717 ) ( not ( = ?auto_95710 ?auto_95717 ) ) ( not ( = ?auto_95711 ?auto_95717 ) ) ( not ( = ?auto_95712 ?auto_95717 ) ) ( not ( = ?auto_95713 ?auto_95717 ) ) ( not ( = ?auto_95714 ?auto_95717 ) ) ( not ( = ?auto_95715 ?auto_95717 ) ) ( not ( = ?auto_95716 ?auto_95717 ) ) ( ON ?auto_95711 ?auto_95710 ) ( ON-TABLE ?auto_95717 ) ( ON ?auto_95712 ?auto_95711 ) ( ON ?auto_95713 ?auto_95712 ) ( ON ?auto_95714 ?auto_95713 ) ( ON ?auto_95715 ?auto_95714 ) ( ON ?auto_95716 ?auto_95715 ) ( CLEAR ?auto_95716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95717 ?auto_95710 ?auto_95711 ?auto_95712 ?auto_95713 ?auto_95714 ?auto_95715 )
      ( MAKE-7PILE ?auto_95710 ?auto_95711 ?auto_95712 ?auto_95713 ?auto_95714 ?auto_95715 ?auto_95716 ) )
  )

)

