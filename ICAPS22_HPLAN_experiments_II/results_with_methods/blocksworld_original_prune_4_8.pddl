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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9860 - BLOCK
      ?auto_9861 - BLOCK
      ?auto_9862 - BLOCK
      ?auto_9863 - BLOCK
    )
    :vars
    (
      ?auto_9864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9864 ?auto_9863 ) ( CLEAR ?auto_9864 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9860 ) ( ON ?auto_9861 ?auto_9860 ) ( ON ?auto_9862 ?auto_9861 ) ( ON ?auto_9863 ?auto_9862 ) ( not ( = ?auto_9860 ?auto_9861 ) ) ( not ( = ?auto_9860 ?auto_9862 ) ) ( not ( = ?auto_9860 ?auto_9863 ) ) ( not ( = ?auto_9860 ?auto_9864 ) ) ( not ( = ?auto_9861 ?auto_9862 ) ) ( not ( = ?auto_9861 ?auto_9863 ) ) ( not ( = ?auto_9861 ?auto_9864 ) ) ( not ( = ?auto_9862 ?auto_9863 ) ) ( not ( = ?auto_9862 ?auto_9864 ) ) ( not ( = ?auto_9863 ?auto_9864 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9864 ?auto_9863 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9866 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9866 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_9866 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9867 - BLOCK
    )
    :vars
    (
      ?auto_9868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9867 ?auto_9868 ) ( CLEAR ?auto_9867 ) ( HAND-EMPTY ) ( not ( = ?auto_9867 ?auto_9868 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9867 ?auto_9868 )
      ( MAKE-1PILE ?auto_9867 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9872 - BLOCK
      ?auto_9873 - BLOCK
      ?auto_9874 - BLOCK
    )
    :vars
    (
      ?auto_9875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9875 ?auto_9874 ) ( CLEAR ?auto_9875 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9872 ) ( ON ?auto_9873 ?auto_9872 ) ( ON ?auto_9874 ?auto_9873 ) ( not ( = ?auto_9872 ?auto_9873 ) ) ( not ( = ?auto_9872 ?auto_9874 ) ) ( not ( = ?auto_9872 ?auto_9875 ) ) ( not ( = ?auto_9873 ?auto_9874 ) ) ( not ( = ?auto_9873 ?auto_9875 ) ) ( not ( = ?auto_9874 ?auto_9875 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9875 ?auto_9874 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9876 - BLOCK
      ?auto_9877 - BLOCK
      ?auto_9878 - BLOCK
    )
    :vars
    (
      ?auto_9879 - BLOCK
      ?auto_9880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9879 ?auto_9878 ) ( CLEAR ?auto_9879 ) ( ON-TABLE ?auto_9876 ) ( ON ?auto_9877 ?auto_9876 ) ( ON ?auto_9878 ?auto_9877 ) ( not ( = ?auto_9876 ?auto_9877 ) ) ( not ( = ?auto_9876 ?auto_9878 ) ) ( not ( = ?auto_9876 ?auto_9879 ) ) ( not ( = ?auto_9877 ?auto_9878 ) ) ( not ( = ?auto_9877 ?auto_9879 ) ) ( not ( = ?auto_9878 ?auto_9879 ) ) ( HOLDING ?auto_9880 ) ( not ( = ?auto_9876 ?auto_9880 ) ) ( not ( = ?auto_9877 ?auto_9880 ) ) ( not ( = ?auto_9878 ?auto_9880 ) ) ( not ( = ?auto_9879 ?auto_9880 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_9880 )
      ( MAKE-3PILE ?auto_9876 ?auto_9877 ?auto_9878 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9881 - BLOCK
      ?auto_9882 - BLOCK
      ?auto_9883 - BLOCK
    )
    :vars
    (
      ?auto_9885 - BLOCK
      ?auto_9884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9885 ?auto_9883 ) ( ON-TABLE ?auto_9881 ) ( ON ?auto_9882 ?auto_9881 ) ( ON ?auto_9883 ?auto_9882 ) ( not ( = ?auto_9881 ?auto_9882 ) ) ( not ( = ?auto_9881 ?auto_9883 ) ) ( not ( = ?auto_9881 ?auto_9885 ) ) ( not ( = ?auto_9882 ?auto_9883 ) ) ( not ( = ?auto_9882 ?auto_9885 ) ) ( not ( = ?auto_9883 ?auto_9885 ) ) ( not ( = ?auto_9881 ?auto_9884 ) ) ( not ( = ?auto_9882 ?auto_9884 ) ) ( not ( = ?auto_9883 ?auto_9884 ) ) ( not ( = ?auto_9885 ?auto_9884 ) ) ( ON ?auto_9884 ?auto_9885 ) ( CLEAR ?auto_9884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9881 ?auto_9882 ?auto_9883 ?auto_9885 )
      ( MAKE-3PILE ?auto_9881 ?auto_9882 ?auto_9883 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9888 - BLOCK
      ?auto_9889 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9889 ) ( CLEAR ?auto_9888 ) ( ON-TABLE ?auto_9888 ) ( not ( = ?auto_9888 ?auto_9889 ) ) )
    :subtasks
    ( ( !STACK ?auto_9889 ?auto_9888 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9890 - BLOCK
      ?auto_9891 - BLOCK
    )
    :vars
    (
      ?auto_9892 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9890 ) ( ON-TABLE ?auto_9890 ) ( not ( = ?auto_9890 ?auto_9891 ) ) ( ON ?auto_9891 ?auto_9892 ) ( CLEAR ?auto_9891 ) ( HAND-EMPTY ) ( not ( = ?auto_9890 ?auto_9892 ) ) ( not ( = ?auto_9891 ?auto_9892 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9891 ?auto_9892 )
      ( MAKE-2PILE ?auto_9890 ?auto_9891 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9893 - BLOCK
      ?auto_9894 - BLOCK
    )
    :vars
    (
      ?auto_9895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9893 ?auto_9894 ) ) ( ON ?auto_9894 ?auto_9895 ) ( CLEAR ?auto_9894 ) ( not ( = ?auto_9893 ?auto_9895 ) ) ( not ( = ?auto_9894 ?auto_9895 ) ) ( HOLDING ?auto_9893 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9893 )
      ( MAKE-2PILE ?auto_9893 ?auto_9894 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9896 - BLOCK
      ?auto_9897 - BLOCK
    )
    :vars
    (
      ?auto_9898 - BLOCK
      ?auto_9900 - BLOCK
      ?auto_9899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9896 ?auto_9897 ) ) ( ON ?auto_9897 ?auto_9898 ) ( not ( = ?auto_9896 ?auto_9898 ) ) ( not ( = ?auto_9897 ?auto_9898 ) ) ( ON ?auto_9896 ?auto_9897 ) ( CLEAR ?auto_9896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9900 ) ( ON ?auto_9899 ?auto_9900 ) ( ON ?auto_9898 ?auto_9899 ) ( not ( = ?auto_9900 ?auto_9899 ) ) ( not ( = ?auto_9900 ?auto_9898 ) ) ( not ( = ?auto_9900 ?auto_9897 ) ) ( not ( = ?auto_9900 ?auto_9896 ) ) ( not ( = ?auto_9899 ?auto_9898 ) ) ( not ( = ?auto_9899 ?auto_9897 ) ) ( not ( = ?auto_9899 ?auto_9896 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9900 ?auto_9899 ?auto_9898 ?auto_9897 )
      ( MAKE-2PILE ?auto_9896 ?auto_9897 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9903 - BLOCK
      ?auto_9904 - BLOCK
    )
    :vars
    (
      ?auto_9905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9905 ?auto_9904 ) ( CLEAR ?auto_9905 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9903 ) ( ON ?auto_9904 ?auto_9903 ) ( not ( = ?auto_9903 ?auto_9904 ) ) ( not ( = ?auto_9903 ?auto_9905 ) ) ( not ( = ?auto_9904 ?auto_9905 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9905 ?auto_9904 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9906 - BLOCK
      ?auto_9907 - BLOCK
    )
    :vars
    (
      ?auto_9908 - BLOCK
      ?auto_9909 - BLOCK
      ?auto_9910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9908 ?auto_9907 ) ( CLEAR ?auto_9908 ) ( ON-TABLE ?auto_9906 ) ( ON ?auto_9907 ?auto_9906 ) ( not ( = ?auto_9906 ?auto_9907 ) ) ( not ( = ?auto_9906 ?auto_9908 ) ) ( not ( = ?auto_9907 ?auto_9908 ) ) ( HOLDING ?auto_9909 ) ( CLEAR ?auto_9910 ) ( not ( = ?auto_9906 ?auto_9909 ) ) ( not ( = ?auto_9906 ?auto_9910 ) ) ( not ( = ?auto_9907 ?auto_9909 ) ) ( not ( = ?auto_9907 ?auto_9910 ) ) ( not ( = ?auto_9908 ?auto_9909 ) ) ( not ( = ?auto_9908 ?auto_9910 ) ) ( not ( = ?auto_9909 ?auto_9910 ) ) )
    :subtasks
    ( ( !STACK ?auto_9909 ?auto_9910 )
      ( MAKE-2PILE ?auto_9906 ?auto_9907 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10106 - BLOCK
      ?auto_10107 - BLOCK
    )
    :vars
    (
      ?auto_10109 - BLOCK
      ?auto_10108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10109 ?auto_10107 ) ( ON-TABLE ?auto_10106 ) ( ON ?auto_10107 ?auto_10106 ) ( not ( = ?auto_10106 ?auto_10107 ) ) ( not ( = ?auto_10106 ?auto_10109 ) ) ( not ( = ?auto_10107 ?auto_10109 ) ) ( not ( = ?auto_10106 ?auto_10108 ) ) ( not ( = ?auto_10107 ?auto_10108 ) ) ( not ( = ?auto_10109 ?auto_10108 ) ) ( ON ?auto_10108 ?auto_10109 ) ( CLEAR ?auto_10108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10106 ?auto_10107 ?auto_10109 )
      ( MAKE-2PILE ?auto_10106 ?auto_10107 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9916 - BLOCK
      ?auto_9917 - BLOCK
    )
    :vars
    (
      ?auto_9920 - BLOCK
      ?auto_9918 - BLOCK
      ?auto_9919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9920 ?auto_9917 ) ( ON-TABLE ?auto_9916 ) ( ON ?auto_9917 ?auto_9916 ) ( not ( = ?auto_9916 ?auto_9917 ) ) ( not ( = ?auto_9916 ?auto_9920 ) ) ( not ( = ?auto_9917 ?auto_9920 ) ) ( not ( = ?auto_9916 ?auto_9918 ) ) ( not ( = ?auto_9916 ?auto_9919 ) ) ( not ( = ?auto_9917 ?auto_9918 ) ) ( not ( = ?auto_9917 ?auto_9919 ) ) ( not ( = ?auto_9920 ?auto_9918 ) ) ( not ( = ?auto_9920 ?auto_9919 ) ) ( not ( = ?auto_9918 ?auto_9919 ) ) ( ON ?auto_9918 ?auto_9920 ) ( CLEAR ?auto_9918 ) ( HOLDING ?auto_9919 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9919 )
      ( MAKE-2PILE ?auto_9916 ?auto_9917 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9921 - BLOCK
      ?auto_9922 - BLOCK
    )
    :vars
    (
      ?auto_9924 - BLOCK
      ?auto_9923 - BLOCK
      ?auto_9925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9924 ?auto_9922 ) ( ON-TABLE ?auto_9921 ) ( ON ?auto_9922 ?auto_9921 ) ( not ( = ?auto_9921 ?auto_9922 ) ) ( not ( = ?auto_9921 ?auto_9924 ) ) ( not ( = ?auto_9922 ?auto_9924 ) ) ( not ( = ?auto_9921 ?auto_9923 ) ) ( not ( = ?auto_9921 ?auto_9925 ) ) ( not ( = ?auto_9922 ?auto_9923 ) ) ( not ( = ?auto_9922 ?auto_9925 ) ) ( not ( = ?auto_9924 ?auto_9923 ) ) ( not ( = ?auto_9924 ?auto_9925 ) ) ( not ( = ?auto_9923 ?auto_9925 ) ) ( ON ?auto_9923 ?auto_9924 ) ( ON ?auto_9925 ?auto_9923 ) ( CLEAR ?auto_9925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9921 ?auto_9922 ?auto_9924 ?auto_9923 )
      ( MAKE-2PILE ?auto_9921 ?auto_9922 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9929 - BLOCK
      ?auto_9930 - BLOCK
      ?auto_9931 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9931 ) ( CLEAR ?auto_9930 ) ( ON-TABLE ?auto_9929 ) ( ON ?auto_9930 ?auto_9929 ) ( not ( = ?auto_9929 ?auto_9930 ) ) ( not ( = ?auto_9929 ?auto_9931 ) ) ( not ( = ?auto_9930 ?auto_9931 ) ) )
    :subtasks
    ( ( !STACK ?auto_9931 ?auto_9930 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9932 - BLOCK
      ?auto_9933 - BLOCK
      ?auto_9934 - BLOCK
    )
    :vars
    (
      ?auto_9935 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9933 ) ( ON-TABLE ?auto_9932 ) ( ON ?auto_9933 ?auto_9932 ) ( not ( = ?auto_9932 ?auto_9933 ) ) ( not ( = ?auto_9932 ?auto_9934 ) ) ( not ( = ?auto_9933 ?auto_9934 ) ) ( ON ?auto_9934 ?auto_9935 ) ( CLEAR ?auto_9934 ) ( HAND-EMPTY ) ( not ( = ?auto_9932 ?auto_9935 ) ) ( not ( = ?auto_9933 ?auto_9935 ) ) ( not ( = ?auto_9934 ?auto_9935 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9934 ?auto_9935 )
      ( MAKE-3PILE ?auto_9932 ?auto_9933 ?auto_9934 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9936 - BLOCK
      ?auto_9937 - BLOCK
      ?auto_9938 - BLOCK
    )
    :vars
    (
      ?auto_9939 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9936 ) ( not ( = ?auto_9936 ?auto_9937 ) ) ( not ( = ?auto_9936 ?auto_9938 ) ) ( not ( = ?auto_9937 ?auto_9938 ) ) ( ON ?auto_9938 ?auto_9939 ) ( CLEAR ?auto_9938 ) ( not ( = ?auto_9936 ?auto_9939 ) ) ( not ( = ?auto_9937 ?auto_9939 ) ) ( not ( = ?auto_9938 ?auto_9939 ) ) ( HOLDING ?auto_9937 ) ( CLEAR ?auto_9936 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9936 ?auto_9937 )
      ( MAKE-3PILE ?auto_9936 ?auto_9937 ?auto_9938 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9940 - BLOCK
      ?auto_9941 - BLOCK
      ?auto_9942 - BLOCK
    )
    :vars
    (
      ?auto_9943 - BLOCK
      ?auto_9944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9940 ) ( not ( = ?auto_9940 ?auto_9941 ) ) ( not ( = ?auto_9940 ?auto_9942 ) ) ( not ( = ?auto_9941 ?auto_9942 ) ) ( ON ?auto_9942 ?auto_9943 ) ( not ( = ?auto_9940 ?auto_9943 ) ) ( not ( = ?auto_9941 ?auto_9943 ) ) ( not ( = ?auto_9942 ?auto_9943 ) ) ( CLEAR ?auto_9940 ) ( ON ?auto_9941 ?auto_9942 ) ( CLEAR ?auto_9941 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9944 ) ( ON ?auto_9943 ?auto_9944 ) ( not ( = ?auto_9944 ?auto_9943 ) ) ( not ( = ?auto_9944 ?auto_9942 ) ) ( not ( = ?auto_9944 ?auto_9941 ) ) ( not ( = ?auto_9940 ?auto_9944 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9944 ?auto_9943 ?auto_9942 )
      ( MAKE-3PILE ?auto_9940 ?auto_9941 ?auto_9942 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9945 - BLOCK
      ?auto_9946 - BLOCK
      ?auto_9947 - BLOCK
    )
    :vars
    (
      ?auto_9949 - BLOCK
      ?auto_9948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9945 ?auto_9946 ) ) ( not ( = ?auto_9945 ?auto_9947 ) ) ( not ( = ?auto_9946 ?auto_9947 ) ) ( ON ?auto_9947 ?auto_9949 ) ( not ( = ?auto_9945 ?auto_9949 ) ) ( not ( = ?auto_9946 ?auto_9949 ) ) ( not ( = ?auto_9947 ?auto_9949 ) ) ( ON ?auto_9946 ?auto_9947 ) ( CLEAR ?auto_9946 ) ( ON-TABLE ?auto_9948 ) ( ON ?auto_9949 ?auto_9948 ) ( not ( = ?auto_9948 ?auto_9949 ) ) ( not ( = ?auto_9948 ?auto_9947 ) ) ( not ( = ?auto_9948 ?auto_9946 ) ) ( not ( = ?auto_9945 ?auto_9948 ) ) ( HOLDING ?auto_9945 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9945 )
      ( MAKE-3PILE ?auto_9945 ?auto_9946 ?auto_9947 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9950 - BLOCK
      ?auto_9951 - BLOCK
      ?auto_9952 - BLOCK
    )
    :vars
    (
      ?auto_9954 - BLOCK
      ?auto_9953 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9950 ?auto_9951 ) ) ( not ( = ?auto_9950 ?auto_9952 ) ) ( not ( = ?auto_9951 ?auto_9952 ) ) ( ON ?auto_9952 ?auto_9954 ) ( not ( = ?auto_9950 ?auto_9954 ) ) ( not ( = ?auto_9951 ?auto_9954 ) ) ( not ( = ?auto_9952 ?auto_9954 ) ) ( ON ?auto_9951 ?auto_9952 ) ( ON-TABLE ?auto_9953 ) ( ON ?auto_9954 ?auto_9953 ) ( not ( = ?auto_9953 ?auto_9954 ) ) ( not ( = ?auto_9953 ?auto_9952 ) ) ( not ( = ?auto_9953 ?auto_9951 ) ) ( not ( = ?auto_9950 ?auto_9953 ) ) ( ON ?auto_9950 ?auto_9951 ) ( CLEAR ?auto_9950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9953 ?auto_9954 ?auto_9952 ?auto_9951 )
      ( MAKE-3PILE ?auto_9950 ?auto_9951 ?auto_9952 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9956 - BLOCK
    )
    :vars
    (
      ?auto_9957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9957 ?auto_9956 ) ( CLEAR ?auto_9957 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9956 ) ( not ( = ?auto_9956 ?auto_9957 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9957 ?auto_9956 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9958 - BLOCK
    )
    :vars
    (
      ?auto_9959 - BLOCK
      ?auto_9960 - BLOCK
      ?auto_9961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9959 ?auto_9958 ) ( CLEAR ?auto_9959 ) ( ON-TABLE ?auto_9958 ) ( not ( = ?auto_9958 ?auto_9959 ) ) ( HOLDING ?auto_9960 ) ( CLEAR ?auto_9961 ) ( not ( = ?auto_9958 ?auto_9960 ) ) ( not ( = ?auto_9958 ?auto_9961 ) ) ( not ( = ?auto_9959 ?auto_9960 ) ) ( not ( = ?auto_9959 ?auto_9961 ) ) ( not ( = ?auto_9960 ?auto_9961 ) ) )
    :subtasks
    ( ( !STACK ?auto_9960 ?auto_9961 )
      ( MAKE-1PILE ?auto_9958 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9962 - BLOCK
    )
    :vars
    (
      ?auto_9964 - BLOCK
      ?auto_9965 - BLOCK
      ?auto_9963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9964 ?auto_9962 ) ( ON-TABLE ?auto_9962 ) ( not ( = ?auto_9962 ?auto_9964 ) ) ( CLEAR ?auto_9965 ) ( not ( = ?auto_9962 ?auto_9963 ) ) ( not ( = ?auto_9962 ?auto_9965 ) ) ( not ( = ?auto_9964 ?auto_9963 ) ) ( not ( = ?auto_9964 ?auto_9965 ) ) ( not ( = ?auto_9963 ?auto_9965 ) ) ( ON ?auto_9963 ?auto_9964 ) ( CLEAR ?auto_9963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9962 ?auto_9964 )
      ( MAKE-1PILE ?auto_9962 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9966 - BLOCK
    )
    :vars
    (
      ?auto_9968 - BLOCK
      ?auto_9967 - BLOCK
      ?auto_9969 - BLOCK
      ?auto_9970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9968 ?auto_9966 ) ( ON-TABLE ?auto_9966 ) ( not ( = ?auto_9966 ?auto_9968 ) ) ( not ( = ?auto_9966 ?auto_9967 ) ) ( not ( = ?auto_9966 ?auto_9969 ) ) ( not ( = ?auto_9968 ?auto_9967 ) ) ( not ( = ?auto_9968 ?auto_9969 ) ) ( not ( = ?auto_9967 ?auto_9969 ) ) ( ON ?auto_9967 ?auto_9968 ) ( CLEAR ?auto_9967 ) ( HOLDING ?auto_9969 ) ( CLEAR ?auto_9970 ) ( ON-TABLE ?auto_9970 ) ( not ( = ?auto_9970 ?auto_9969 ) ) ( not ( = ?auto_9966 ?auto_9970 ) ) ( not ( = ?auto_9968 ?auto_9970 ) ) ( not ( = ?auto_9967 ?auto_9970 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9970 ?auto_9969 )
      ( MAKE-1PILE ?auto_9966 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10194 - BLOCK
    )
    :vars
    (
      ?auto_10196 - BLOCK
      ?auto_10195 - BLOCK
      ?auto_10197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10196 ?auto_10194 ) ( ON-TABLE ?auto_10194 ) ( not ( = ?auto_10194 ?auto_10196 ) ) ( not ( = ?auto_10194 ?auto_10195 ) ) ( not ( = ?auto_10194 ?auto_10197 ) ) ( not ( = ?auto_10196 ?auto_10195 ) ) ( not ( = ?auto_10196 ?auto_10197 ) ) ( not ( = ?auto_10195 ?auto_10197 ) ) ( ON ?auto_10195 ?auto_10196 ) ( ON ?auto_10197 ?auto_10195 ) ( CLEAR ?auto_10197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10194 ?auto_10196 ?auto_10195 )
      ( MAKE-1PILE ?auto_10194 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9976 - BLOCK
    )
    :vars
    (
      ?auto_9977 - BLOCK
      ?auto_9979 - BLOCK
      ?auto_9978 - BLOCK
      ?auto_9980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9977 ?auto_9976 ) ( ON-TABLE ?auto_9976 ) ( not ( = ?auto_9976 ?auto_9977 ) ) ( not ( = ?auto_9976 ?auto_9979 ) ) ( not ( = ?auto_9976 ?auto_9978 ) ) ( not ( = ?auto_9977 ?auto_9979 ) ) ( not ( = ?auto_9977 ?auto_9978 ) ) ( not ( = ?auto_9979 ?auto_9978 ) ) ( ON ?auto_9979 ?auto_9977 ) ( not ( = ?auto_9980 ?auto_9978 ) ) ( not ( = ?auto_9976 ?auto_9980 ) ) ( not ( = ?auto_9977 ?auto_9980 ) ) ( not ( = ?auto_9979 ?auto_9980 ) ) ( ON ?auto_9978 ?auto_9979 ) ( CLEAR ?auto_9978 ) ( HOLDING ?auto_9980 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9980 )
      ( MAKE-1PILE ?auto_9976 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9981 - BLOCK
    )
    :vars
    (
      ?auto_9983 - BLOCK
      ?auto_9982 - BLOCK
      ?auto_9985 - BLOCK
      ?auto_9984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9983 ?auto_9981 ) ( ON-TABLE ?auto_9981 ) ( not ( = ?auto_9981 ?auto_9983 ) ) ( not ( = ?auto_9981 ?auto_9982 ) ) ( not ( = ?auto_9981 ?auto_9985 ) ) ( not ( = ?auto_9983 ?auto_9982 ) ) ( not ( = ?auto_9983 ?auto_9985 ) ) ( not ( = ?auto_9982 ?auto_9985 ) ) ( ON ?auto_9982 ?auto_9983 ) ( not ( = ?auto_9984 ?auto_9985 ) ) ( not ( = ?auto_9981 ?auto_9984 ) ) ( not ( = ?auto_9983 ?auto_9984 ) ) ( not ( = ?auto_9982 ?auto_9984 ) ) ( ON ?auto_9985 ?auto_9982 ) ( ON ?auto_9984 ?auto_9985 ) ( CLEAR ?auto_9984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9981 ?auto_9983 ?auto_9982 ?auto_9985 )
      ( MAKE-1PILE ?auto_9981 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9990 - BLOCK
      ?auto_9991 - BLOCK
      ?auto_9992 - BLOCK
      ?auto_9993 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9993 ) ( CLEAR ?auto_9992 ) ( ON-TABLE ?auto_9990 ) ( ON ?auto_9991 ?auto_9990 ) ( ON ?auto_9992 ?auto_9991 ) ( not ( = ?auto_9990 ?auto_9991 ) ) ( not ( = ?auto_9990 ?auto_9992 ) ) ( not ( = ?auto_9990 ?auto_9993 ) ) ( not ( = ?auto_9991 ?auto_9992 ) ) ( not ( = ?auto_9991 ?auto_9993 ) ) ( not ( = ?auto_9992 ?auto_9993 ) ) )
    :subtasks
    ( ( !STACK ?auto_9993 ?auto_9992 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9994 - BLOCK
      ?auto_9995 - BLOCK
      ?auto_9996 - BLOCK
      ?auto_9997 - BLOCK
    )
    :vars
    (
      ?auto_9998 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9996 ) ( ON-TABLE ?auto_9994 ) ( ON ?auto_9995 ?auto_9994 ) ( ON ?auto_9996 ?auto_9995 ) ( not ( = ?auto_9994 ?auto_9995 ) ) ( not ( = ?auto_9994 ?auto_9996 ) ) ( not ( = ?auto_9994 ?auto_9997 ) ) ( not ( = ?auto_9995 ?auto_9996 ) ) ( not ( = ?auto_9995 ?auto_9997 ) ) ( not ( = ?auto_9996 ?auto_9997 ) ) ( ON ?auto_9997 ?auto_9998 ) ( CLEAR ?auto_9997 ) ( HAND-EMPTY ) ( not ( = ?auto_9994 ?auto_9998 ) ) ( not ( = ?auto_9995 ?auto_9998 ) ) ( not ( = ?auto_9996 ?auto_9998 ) ) ( not ( = ?auto_9997 ?auto_9998 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9997 ?auto_9998 )
      ( MAKE-4PILE ?auto_9994 ?auto_9995 ?auto_9996 ?auto_9997 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9999 - BLOCK
      ?auto_10000 - BLOCK
      ?auto_10001 - BLOCK
      ?auto_10002 - BLOCK
    )
    :vars
    (
      ?auto_10003 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9999 ) ( ON ?auto_10000 ?auto_9999 ) ( not ( = ?auto_9999 ?auto_10000 ) ) ( not ( = ?auto_9999 ?auto_10001 ) ) ( not ( = ?auto_9999 ?auto_10002 ) ) ( not ( = ?auto_10000 ?auto_10001 ) ) ( not ( = ?auto_10000 ?auto_10002 ) ) ( not ( = ?auto_10001 ?auto_10002 ) ) ( ON ?auto_10002 ?auto_10003 ) ( CLEAR ?auto_10002 ) ( not ( = ?auto_9999 ?auto_10003 ) ) ( not ( = ?auto_10000 ?auto_10003 ) ) ( not ( = ?auto_10001 ?auto_10003 ) ) ( not ( = ?auto_10002 ?auto_10003 ) ) ( HOLDING ?auto_10001 ) ( CLEAR ?auto_10000 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9999 ?auto_10000 ?auto_10001 )
      ( MAKE-4PILE ?auto_9999 ?auto_10000 ?auto_10001 ?auto_10002 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10004 - BLOCK
      ?auto_10005 - BLOCK
      ?auto_10006 - BLOCK
      ?auto_10007 - BLOCK
    )
    :vars
    (
      ?auto_10008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10004 ) ( ON ?auto_10005 ?auto_10004 ) ( not ( = ?auto_10004 ?auto_10005 ) ) ( not ( = ?auto_10004 ?auto_10006 ) ) ( not ( = ?auto_10004 ?auto_10007 ) ) ( not ( = ?auto_10005 ?auto_10006 ) ) ( not ( = ?auto_10005 ?auto_10007 ) ) ( not ( = ?auto_10006 ?auto_10007 ) ) ( ON ?auto_10007 ?auto_10008 ) ( not ( = ?auto_10004 ?auto_10008 ) ) ( not ( = ?auto_10005 ?auto_10008 ) ) ( not ( = ?auto_10006 ?auto_10008 ) ) ( not ( = ?auto_10007 ?auto_10008 ) ) ( CLEAR ?auto_10005 ) ( ON ?auto_10006 ?auto_10007 ) ( CLEAR ?auto_10006 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10008 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10008 ?auto_10007 )
      ( MAKE-4PILE ?auto_10004 ?auto_10005 ?auto_10006 ?auto_10007 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10009 - BLOCK
      ?auto_10010 - BLOCK
      ?auto_10011 - BLOCK
      ?auto_10012 - BLOCK
    )
    :vars
    (
      ?auto_10013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10009 ) ( not ( = ?auto_10009 ?auto_10010 ) ) ( not ( = ?auto_10009 ?auto_10011 ) ) ( not ( = ?auto_10009 ?auto_10012 ) ) ( not ( = ?auto_10010 ?auto_10011 ) ) ( not ( = ?auto_10010 ?auto_10012 ) ) ( not ( = ?auto_10011 ?auto_10012 ) ) ( ON ?auto_10012 ?auto_10013 ) ( not ( = ?auto_10009 ?auto_10013 ) ) ( not ( = ?auto_10010 ?auto_10013 ) ) ( not ( = ?auto_10011 ?auto_10013 ) ) ( not ( = ?auto_10012 ?auto_10013 ) ) ( ON ?auto_10011 ?auto_10012 ) ( CLEAR ?auto_10011 ) ( ON-TABLE ?auto_10013 ) ( HOLDING ?auto_10010 ) ( CLEAR ?auto_10009 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10009 ?auto_10010 )
      ( MAKE-4PILE ?auto_10009 ?auto_10010 ?auto_10011 ?auto_10012 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10014 - BLOCK
      ?auto_10015 - BLOCK
      ?auto_10016 - BLOCK
      ?auto_10017 - BLOCK
    )
    :vars
    (
      ?auto_10018 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10014 ) ( not ( = ?auto_10014 ?auto_10015 ) ) ( not ( = ?auto_10014 ?auto_10016 ) ) ( not ( = ?auto_10014 ?auto_10017 ) ) ( not ( = ?auto_10015 ?auto_10016 ) ) ( not ( = ?auto_10015 ?auto_10017 ) ) ( not ( = ?auto_10016 ?auto_10017 ) ) ( ON ?auto_10017 ?auto_10018 ) ( not ( = ?auto_10014 ?auto_10018 ) ) ( not ( = ?auto_10015 ?auto_10018 ) ) ( not ( = ?auto_10016 ?auto_10018 ) ) ( not ( = ?auto_10017 ?auto_10018 ) ) ( ON ?auto_10016 ?auto_10017 ) ( ON-TABLE ?auto_10018 ) ( CLEAR ?auto_10014 ) ( ON ?auto_10015 ?auto_10016 ) ( CLEAR ?auto_10015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10018 ?auto_10017 ?auto_10016 )
      ( MAKE-4PILE ?auto_10014 ?auto_10015 ?auto_10016 ?auto_10017 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10019 - BLOCK
      ?auto_10020 - BLOCK
      ?auto_10021 - BLOCK
      ?auto_10022 - BLOCK
    )
    :vars
    (
      ?auto_10023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10019 ?auto_10020 ) ) ( not ( = ?auto_10019 ?auto_10021 ) ) ( not ( = ?auto_10019 ?auto_10022 ) ) ( not ( = ?auto_10020 ?auto_10021 ) ) ( not ( = ?auto_10020 ?auto_10022 ) ) ( not ( = ?auto_10021 ?auto_10022 ) ) ( ON ?auto_10022 ?auto_10023 ) ( not ( = ?auto_10019 ?auto_10023 ) ) ( not ( = ?auto_10020 ?auto_10023 ) ) ( not ( = ?auto_10021 ?auto_10023 ) ) ( not ( = ?auto_10022 ?auto_10023 ) ) ( ON ?auto_10021 ?auto_10022 ) ( ON-TABLE ?auto_10023 ) ( ON ?auto_10020 ?auto_10021 ) ( CLEAR ?auto_10020 ) ( HOLDING ?auto_10019 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10019 )
      ( MAKE-4PILE ?auto_10019 ?auto_10020 ?auto_10021 ?auto_10022 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10024 - BLOCK
      ?auto_10025 - BLOCK
      ?auto_10026 - BLOCK
      ?auto_10027 - BLOCK
    )
    :vars
    (
      ?auto_10028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10024 ?auto_10025 ) ) ( not ( = ?auto_10024 ?auto_10026 ) ) ( not ( = ?auto_10024 ?auto_10027 ) ) ( not ( = ?auto_10025 ?auto_10026 ) ) ( not ( = ?auto_10025 ?auto_10027 ) ) ( not ( = ?auto_10026 ?auto_10027 ) ) ( ON ?auto_10027 ?auto_10028 ) ( not ( = ?auto_10024 ?auto_10028 ) ) ( not ( = ?auto_10025 ?auto_10028 ) ) ( not ( = ?auto_10026 ?auto_10028 ) ) ( not ( = ?auto_10027 ?auto_10028 ) ) ( ON ?auto_10026 ?auto_10027 ) ( ON-TABLE ?auto_10028 ) ( ON ?auto_10025 ?auto_10026 ) ( ON ?auto_10024 ?auto_10025 ) ( CLEAR ?auto_10024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10028 ?auto_10027 ?auto_10026 ?auto_10025 )
      ( MAKE-4PILE ?auto_10024 ?auto_10025 ?auto_10026 ?auto_10027 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10069 - BLOCK
    )
    :vars
    (
      ?auto_10070 - BLOCK
      ?auto_10071 - BLOCK
      ?auto_10072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10069 ?auto_10070 ) ( CLEAR ?auto_10069 ) ( not ( = ?auto_10069 ?auto_10070 ) ) ( HOLDING ?auto_10071 ) ( CLEAR ?auto_10072 ) ( not ( = ?auto_10069 ?auto_10071 ) ) ( not ( = ?auto_10069 ?auto_10072 ) ) ( not ( = ?auto_10070 ?auto_10071 ) ) ( not ( = ?auto_10070 ?auto_10072 ) ) ( not ( = ?auto_10071 ?auto_10072 ) ) )
    :subtasks
    ( ( !STACK ?auto_10071 ?auto_10072 )
      ( MAKE-1PILE ?auto_10069 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10073 - BLOCK
    )
    :vars
    (
      ?auto_10074 - BLOCK
      ?auto_10076 - BLOCK
      ?auto_10075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10073 ?auto_10074 ) ( not ( = ?auto_10073 ?auto_10074 ) ) ( CLEAR ?auto_10076 ) ( not ( = ?auto_10073 ?auto_10075 ) ) ( not ( = ?auto_10073 ?auto_10076 ) ) ( not ( = ?auto_10074 ?auto_10075 ) ) ( not ( = ?auto_10074 ?auto_10076 ) ) ( not ( = ?auto_10075 ?auto_10076 ) ) ( ON ?auto_10075 ?auto_10073 ) ( CLEAR ?auto_10075 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10074 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10074 ?auto_10073 )
      ( MAKE-1PILE ?auto_10073 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10077 - BLOCK
    )
    :vars
    (
      ?auto_10080 - BLOCK
      ?auto_10078 - BLOCK
      ?auto_10079 - BLOCK
      ?auto_10081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10077 ?auto_10080 ) ( not ( = ?auto_10077 ?auto_10080 ) ) ( not ( = ?auto_10077 ?auto_10078 ) ) ( not ( = ?auto_10077 ?auto_10079 ) ) ( not ( = ?auto_10080 ?auto_10078 ) ) ( not ( = ?auto_10080 ?auto_10079 ) ) ( not ( = ?auto_10078 ?auto_10079 ) ) ( ON ?auto_10078 ?auto_10077 ) ( CLEAR ?auto_10078 ) ( ON-TABLE ?auto_10080 ) ( HOLDING ?auto_10079 ) ( CLEAR ?auto_10081 ) ( ON-TABLE ?auto_10081 ) ( not ( = ?auto_10081 ?auto_10079 ) ) ( not ( = ?auto_10077 ?auto_10081 ) ) ( not ( = ?auto_10080 ?auto_10081 ) ) ( not ( = ?auto_10078 ?auto_10081 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10081 ?auto_10079 )
      ( MAKE-1PILE ?auto_10077 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10082 - BLOCK
    )
    :vars
    (
      ?auto_10084 - BLOCK
      ?auto_10083 - BLOCK
      ?auto_10086 - BLOCK
      ?auto_10085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10082 ?auto_10084 ) ( not ( = ?auto_10082 ?auto_10084 ) ) ( not ( = ?auto_10082 ?auto_10083 ) ) ( not ( = ?auto_10082 ?auto_10086 ) ) ( not ( = ?auto_10084 ?auto_10083 ) ) ( not ( = ?auto_10084 ?auto_10086 ) ) ( not ( = ?auto_10083 ?auto_10086 ) ) ( ON ?auto_10083 ?auto_10082 ) ( ON-TABLE ?auto_10084 ) ( CLEAR ?auto_10085 ) ( ON-TABLE ?auto_10085 ) ( not ( = ?auto_10085 ?auto_10086 ) ) ( not ( = ?auto_10082 ?auto_10085 ) ) ( not ( = ?auto_10084 ?auto_10085 ) ) ( not ( = ?auto_10083 ?auto_10085 ) ) ( ON ?auto_10086 ?auto_10083 ) ( CLEAR ?auto_10086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10084 ?auto_10082 ?auto_10083 )
      ( MAKE-1PILE ?auto_10082 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10087 - BLOCK
    )
    :vars
    (
      ?auto_10088 - BLOCK
      ?auto_10090 - BLOCK
      ?auto_10089 - BLOCK
      ?auto_10091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10087 ?auto_10088 ) ( not ( = ?auto_10087 ?auto_10088 ) ) ( not ( = ?auto_10087 ?auto_10090 ) ) ( not ( = ?auto_10087 ?auto_10089 ) ) ( not ( = ?auto_10088 ?auto_10090 ) ) ( not ( = ?auto_10088 ?auto_10089 ) ) ( not ( = ?auto_10090 ?auto_10089 ) ) ( ON ?auto_10090 ?auto_10087 ) ( ON-TABLE ?auto_10088 ) ( not ( = ?auto_10091 ?auto_10089 ) ) ( not ( = ?auto_10087 ?auto_10091 ) ) ( not ( = ?auto_10088 ?auto_10091 ) ) ( not ( = ?auto_10090 ?auto_10091 ) ) ( ON ?auto_10089 ?auto_10090 ) ( CLEAR ?auto_10089 ) ( HOLDING ?auto_10091 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10091 )
      ( MAKE-1PILE ?auto_10087 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10092 - BLOCK
    )
    :vars
    (
      ?auto_10094 - BLOCK
      ?auto_10095 - BLOCK
      ?auto_10096 - BLOCK
      ?auto_10093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10092 ?auto_10094 ) ( not ( = ?auto_10092 ?auto_10094 ) ) ( not ( = ?auto_10092 ?auto_10095 ) ) ( not ( = ?auto_10092 ?auto_10096 ) ) ( not ( = ?auto_10094 ?auto_10095 ) ) ( not ( = ?auto_10094 ?auto_10096 ) ) ( not ( = ?auto_10095 ?auto_10096 ) ) ( ON ?auto_10095 ?auto_10092 ) ( ON-TABLE ?auto_10094 ) ( not ( = ?auto_10093 ?auto_10096 ) ) ( not ( = ?auto_10092 ?auto_10093 ) ) ( not ( = ?auto_10094 ?auto_10093 ) ) ( not ( = ?auto_10095 ?auto_10093 ) ) ( ON ?auto_10096 ?auto_10095 ) ( ON ?auto_10093 ?auto_10096 ) ( CLEAR ?auto_10093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10094 ?auto_10092 ?auto_10095 ?auto_10096 )
      ( MAKE-1PILE ?auto_10092 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10102 - BLOCK
      ?auto_10103 - BLOCK
    )
    :vars
    (
      ?auto_10104 - BLOCK
      ?auto_10105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10104 ?auto_10103 ) ( CLEAR ?auto_10104 ) ( ON-TABLE ?auto_10102 ) ( ON ?auto_10103 ?auto_10102 ) ( not ( = ?auto_10102 ?auto_10103 ) ) ( not ( = ?auto_10102 ?auto_10104 ) ) ( not ( = ?auto_10103 ?auto_10104 ) ) ( HOLDING ?auto_10105 ) ( not ( = ?auto_10102 ?auto_10105 ) ) ( not ( = ?auto_10103 ?auto_10105 ) ) ( not ( = ?auto_10104 ?auto_10105 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_10105 )
      ( MAKE-2PILE ?auto_10102 ?auto_10103 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10139 - BLOCK
      ?auto_10140 - BLOCK
    )
    :vars
    (
      ?auto_10141 - BLOCK
      ?auto_10142 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10139 ?auto_10140 ) ) ( ON ?auto_10140 ?auto_10141 ) ( not ( = ?auto_10139 ?auto_10141 ) ) ( not ( = ?auto_10140 ?auto_10141 ) ) ( ON ?auto_10139 ?auto_10140 ) ( CLEAR ?auto_10139 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10142 ) ( ON ?auto_10141 ?auto_10142 ) ( not ( = ?auto_10142 ?auto_10141 ) ) ( not ( = ?auto_10142 ?auto_10140 ) ) ( not ( = ?auto_10142 ?auto_10139 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10142 ?auto_10141 ?auto_10140 )
      ( MAKE-2PILE ?auto_10139 ?auto_10140 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10145 - BLOCK
      ?auto_10146 - BLOCK
    )
    :vars
    (
      ?auto_10147 - BLOCK
      ?auto_10148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10145 ?auto_10146 ) ) ( ON ?auto_10146 ?auto_10147 ) ( CLEAR ?auto_10146 ) ( not ( = ?auto_10145 ?auto_10147 ) ) ( not ( = ?auto_10146 ?auto_10147 ) ) ( ON ?auto_10145 ?auto_10148 ) ( CLEAR ?auto_10145 ) ( HAND-EMPTY ) ( not ( = ?auto_10145 ?auto_10148 ) ) ( not ( = ?auto_10146 ?auto_10148 ) ) ( not ( = ?auto_10147 ?auto_10148 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10145 ?auto_10148 )
      ( MAKE-2PILE ?auto_10145 ?auto_10146 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10149 - BLOCK
      ?auto_10150 - BLOCK
    )
    :vars
    (
      ?auto_10152 - BLOCK
      ?auto_10151 - BLOCK
      ?auto_10153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10149 ?auto_10150 ) ) ( not ( = ?auto_10149 ?auto_10152 ) ) ( not ( = ?auto_10150 ?auto_10152 ) ) ( ON ?auto_10149 ?auto_10151 ) ( CLEAR ?auto_10149 ) ( not ( = ?auto_10149 ?auto_10151 ) ) ( not ( = ?auto_10150 ?auto_10151 ) ) ( not ( = ?auto_10152 ?auto_10151 ) ) ( HOLDING ?auto_10150 ) ( CLEAR ?auto_10152 ) ( ON-TABLE ?auto_10153 ) ( ON ?auto_10152 ?auto_10153 ) ( not ( = ?auto_10153 ?auto_10152 ) ) ( not ( = ?auto_10153 ?auto_10150 ) ) ( not ( = ?auto_10149 ?auto_10153 ) ) ( not ( = ?auto_10151 ?auto_10153 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10153 ?auto_10152 ?auto_10150 )
      ( MAKE-2PILE ?auto_10149 ?auto_10150 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10154 - BLOCK
      ?auto_10155 - BLOCK
    )
    :vars
    (
      ?auto_10157 - BLOCK
      ?auto_10158 - BLOCK
      ?auto_10156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10154 ?auto_10155 ) ) ( not ( = ?auto_10154 ?auto_10157 ) ) ( not ( = ?auto_10155 ?auto_10157 ) ) ( ON ?auto_10154 ?auto_10158 ) ( not ( = ?auto_10154 ?auto_10158 ) ) ( not ( = ?auto_10155 ?auto_10158 ) ) ( not ( = ?auto_10157 ?auto_10158 ) ) ( CLEAR ?auto_10157 ) ( ON-TABLE ?auto_10156 ) ( ON ?auto_10157 ?auto_10156 ) ( not ( = ?auto_10156 ?auto_10157 ) ) ( not ( = ?auto_10156 ?auto_10155 ) ) ( not ( = ?auto_10154 ?auto_10156 ) ) ( not ( = ?auto_10158 ?auto_10156 ) ) ( ON ?auto_10155 ?auto_10154 ) ( CLEAR ?auto_10155 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10158 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10158 ?auto_10154 )
      ( MAKE-2PILE ?auto_10154 ?auto_10155 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10159 - BLOCK
      ?auto_10160 - BLOCK
    )
    :vars
    (
      ?auto_10163 - BLOCK
      ?auto_10161 - BLOCK
      ?auto_10162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10159 ?auto_10160 ) ) ( not ( = ?auto_10159 ?auto_10163 ) ) ( not ( = ?auto_10160 ?auto_10163 ) ) ( ON ?auto_10159 ?auto_10161 ) ( not ( = ?auto_10159 ?auto_10161 ) ) ( not ( = ?auto_10160 ?auto_10161 ) ) ( not ( = ?auto_10163 ?auto_10161 ) ) ( ON-TABLE ?auto_10162 ) ( not ( = ?auto_10162 ?auto_10163 ) ) ( not ( = ?auto_10162 ?auto_10160 ) ) ( not ( = ?auto_10159 ?auto_10162 ) ) ( not ( = ?auto_10161 ?auto_10162 ) ) ( ON ?auto_10160 ?auto_10159 ) ( CLEAR ?auto_10160 ) ( ON-TABLE ?auto_10161 ) ( HOLDING ?auto_10163 ) ( CLEAR ?auto_10162 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10162 ?auto_10163 )
      ( MAKE-2PILE ?auto_10159 ?auto_10160 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10164 - BLOCK
      ?auto_10165 - BLOCK
    )
    :vars
    (
      ?auto_10168 - BLOCK
      ?auto_10167 - BLOCK
      ?auto_10166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10164 ?auto_10165 ) ) ( not ( = ?auto_10164 ?auto_10168 ) ) ( not ( = ?auto_10165 ?auto_10168 ) ) ( ON ?auto_10164 ?auto_10167 ) ( not ( = ?auto_10164 ?auto_10167 ) ) ( not ( = ?auto_10165 ?auto_10167 ) ) ( not ( = ?auto_10168 ?auto_10167 ) ) ( ON-TABLE ?auto_10166 ) ( not ( = ?auto_10166 ?auto_10168 ) ) ( not ( = ?auto_10166 ?auto_10165 ) ) ( not ( = ?auto_10164 ?auto_10166 ) ) ( not ( = ?auto_10167 ?auto_10166 ) ) ( ON ?auto_10165 ?auto_10164 ) ( ON-TABLE ?auto_10167 ) ( CLEAR ?auto_10166 ) ( ON ?auto_10168 ?auto_10165 ) ( CLEAR ?auto_10168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10167 ?auto_10164 ?auto_10165 )
      ( MAKE-2PILE ?auto_10164 ?auto_10165 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10169 - BLOCK
      ?auto_10170 - BLOCK
    )
    :vars
    (
      ?auto_10173 - BLOCK
      ?auto_10172 - BLOCK
      ?auto_10171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10169 ?auto_10170 ) ) ( not ( = ?auto_10169 ?auto_10173 ) ) ( not ( = ?auto_10170 ?auto_10173 ) ) ( ON ?auto_10169 ?auto_10172 ) ( not ( = ?auto_10169 ?auto_10172 ) ) ( not ( = ?auto_10170 ?auto_10172 ) ) ( not ( = ?auto_10173 ?auto_10172 ) ) ( not ( = ?auto_10171 ?auto_10173 ) ) ( not ( = ?auto_10171 ?auto_10170 ) ) ( not ( = ?auto_10169 ?auto_10171 ) ) ( not ( = ?auto_10172 ?auto_10171 ) ) ( ON ?auto_10170 ?auto_10169 ) ( ON-TABLE ?auto_10172 ) ( ON ?auto_10173 ?auto_10170 ) ( CLEAR ?auto_10173 ) ( HOLDING ?auto_10171 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10171 )
      ( MAKE-2PILE ?auto_10169 ?auto_10170 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10174 - BLOCK
      ?auto_10175 - BLOCK
    )
    :vars
    (
      ?auto_10177 - BLOCK
      ?auto_10178 - BLOCK
      ?auto_10176 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10174 ?auto_10175 ) ) ( not ( = ?auto_10174 ?auto_10177 ) ) ( not ( = ?auto_10175 ?auto_10177 ) ) ( ON ?auto_10174 ?auto_10178 ) ( not ( = ?auto_10174 ?auto_10178 ) ) ( not ( = ?auto_10175 ?auto_10178 ) ) ( not ( = ?auto_10177 ?auto_10178 ) ) ( not ( = ?auto_10176 ?auto_10177 ) ) ( not ( = ?auto_10176 ?auto_10175 ) ) ( not ( = ?auto_10174 ?auto_10176 ) ) ( not ( = ?auto_10178 ?auto_10176 ) ) ( ON ?auto_10175 ?auto_10174 ) ( ON-TABLE ?auto_10178 ) ( ON ?auto_10177 ?auto_10175 ) ( ON ?auto_10176 ?auto_10177 ) ( CLEAR ?auto_10176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10178 ?auto_10174 ?auto_10175 ?auto_10177 )
      ( MAKE-2PILE ?auto_10174 ?auto_10175 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10190 - BLOCK
    )
    :vars
    (
      ?auto_10191 - BLOCK
      ?auto_10193 - BLOCK
      ?auto_10192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10191 ?auto_10190 ) ( ON-TABLE ?auto_10190 ) ( not ( = ?auto_10190 ?auto_10191 ) ) ( not ( = ?auto_10190 ?auto_10193 ) ) ( not ( = ?auto_10190 ?auto_10192 ) ) ( not ( = ?auto_10191 ?auto_10193 ) ) ( not ( = ?auto_10191 ?auto_10192 ) ) ( not ( = ?auto_10193 ?auto_10192 ) ) ( ON ?auto_10193 ?auto_10191 ) ( CLEAR ?auto_10193 ) ( HOLDING ?auto_10192 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10192 )
      ( MAKE-1PILE ?auto_10190 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10223 - BLOCK
      ?auto_10224 - BLOCK
      ?auto_10225 - BLOCK
    )
    :vars
    (
      ?auto_10226 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10223 ) ( not ( = ?auto_10223 ?auto_10224 ) ) ( not ( = ?auto_10223 ?auto_10225 ) ) ( not ( = ?auto_10224 ?auto_10225 ) ) ( ON ?auto_10225 ?auto_10226 ) ( not ( = ?auto_10223 ?auto_10226 ) ) ( not ( = ?auto_10224 ?auto_10226 ) ) ( not ( = ?auto_10225 ?auto_10226 ) ) ( CLEAR ?auto_10223 ) ( ON ?auto_10224 ?auto_10225 ) ( CLEAR ?auto_10224 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10226 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10226 ?auto_10225 )
      ( MAKE-3PILE ?auto_10223 ?auto_10224 ?auto_10225 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10227 - BLOCK
      ?auto_10228 - BLOCK
      ?auto_10229 - BLOCK
    )
    :vars
    (
      ?auto_10230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10227 ?auto_10228 ) ) ( not ( = ?auto_10227 ?auto_10229 ) ) ( not ( = ?auto_10228 ?auto_10229 ) ) ( ON ?auto_10229 ?auto_10230 ) ( not ( = ?auto_10227 ?auto_10230 ) ) ( not ( = ?auto_10228 ?auto_10230 ) ) ( not ( = ?auto_10229 ?auto_10230 ) ) ( ON ?auto_10228 ?auto_10229 ) ( CLEAR ?auto_10228 ) ( ON-TABLE ?auto_10230 ) ( HOLDING ?auto_10227 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10227 )
      ( MAKE-3PILE ?auto_10227 ?auto_10228 ?auto_10229 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10231 - BLOCK
      ?auto_10232 - BLOCK
      ?auto_10233 - BLOCK
    )
    :vars
    (
      ?auto_10234 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10231 ?auto_10232 ) ) ( not ( = ?auto_10231 ?auto_10233 ) ) ( not ( = ?auto_10232 ?auto_10233 ) ) ( ON ?auto_10233 ?auto_10234 ) ( not ( = ?auto_10231 ?auto_10234 ) ) ( not ( = ?auto_10232 ?auto_10234 ) ) ( not ( = ?auto_10233 ?auto_10234 ) ) ( ON ?auto_10232 ?auto_10233 ) ( ON-TABLE ?auto_10234 ) ( ON ?auto_10231 ?auto_10232 ) ( CLEAR ?auto_10231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10234 ?auto_10233 ?auto_10232 )
      ( MAKE-3PILE ?auto_10231 ?auto_10232 ?auto_10233 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10238 - BLOCK
      ?auto_10239 - BLOCK
      ?auto_10240 - BLOCK
    )
    :vars
    (
      ?auto_10241 - BLOCK
      ?auto_10242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10238 ?auto_10239 ) ) ( not ( = ?auto_10238 ?auto_10240 ) ) ( not ( = ?auto_10239 ?auto_10240 ) ) ( ON ?auto_10240 ?auto_10241 ) ( not ( = ?auto_10238 ?auto_10241 ) ) ( not ( = ?auto_10239 ?auto_10241 ) ) ( not ( = ?auto_10240 ?auto_10241 ) ) ( ON ?auto_10239 ?auto_10240 ) ( CLEAR ?auto_10239 ) ( ON-TABLE ?auto_10241 ) ( ON ?auto_10238 ?auto_10242 ) ( CLEAR ?auto_10238 ) ( HAND-EMPTY ) ( not ( = ?auto_10238 ?auto_10242 ) ) ( not ( = ?auto_10239 ?auto_10242 ) ) ( not ( = ?auto_10240 ?auto_10242 ) ) ( not ( = ?auto_10241 ?auto_10242 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10238 ?auto_10242 )
      ( MAKE-3PILE ?auto_10238 ?auto_10239 ?auto_10240 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10243 - BLOCK
      ?auto_10244 - BLOCK
      ?auto_10245 - BLOCK
    )
    :vars
    (
      ?auto_10247 - BLOCK
      ?auto_10246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10243 ?auto_10244 ) ) ( not ( = ?auto_10243 ?auto_10245 ) ) ( not ( = ?auto_10244 ?auto_10245 ) ) ( ON ?auto_10245 ?auto_10247 ) ( not ( = ?auto_10243 ?auto_10247 ) ) ( not ( = ?auto_10244 ?auto_10247 ) ) ( not ( = ?auto_10245 ?auto_10247 ) ) ( ON-TABLE ?auto_10247 ) ( ON ?auto_10243 ?auto_10246 ) ( CLEAR ?auto_10243 ) ( not ( = ?auto_10243 ?auto_10246 ) ) ( not ( = ?auto_10244 ?auto_10246 ) ) ( not ( = ?auto_10245 ?auto_10246 ) ) ( not ( = ?auto_10247 ?auto_10246 ) ) ( HOLDING ?auto_10244 ) ( CLEAR ?auto_10245 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10247 ?auto_10245 ?auto_10244 )
      ( MAKE-3PILE ?auto_10243 ?auto_10244 ?auto_10245 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10248 - BLOCK
      ?auto_10249 - BLOCK
      ?auto_10250 - BLOCK
    )
    :vars
    (
      ?auto_10252 - BLOCK
      ?auto_10251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10248 ?auto_10249 ) ) ( not ( = ?auto_10248 ?auto_10250 ) ) ( not ( = ?auto_10249 ?auto_10250 ) ) ( ON ?auto_10250 ?auto_10252 ) ( not ( = ?auto_10248 ?auto_10252 ) ) ( not ( = ?auto_10249 ?auto_10252 ) ) ( not ( = ?auto_10250 ?auto_10252 ) ) ( ON-TABLE ?auto_10252 ) ( ON ?auto_10248 ?auto_10251 ) ( not ( = ?auto_10248 ?auto_10251 ) ) ( not ( = ?auto_10249 ?auto_10251 ) ) ( not ( = ?auto_10250 ?auto_10251 ) ) ( not ( = ?auto_10252 ?auto_10251 ) ) ( CLEAR ?auto_10250 ) ( ON ?auto_10249 ?auto_10248 ) ( CLEAR ?auto_10249 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10251 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10251 ?auto_10248 )
      ( MAKE-3PILE ?auto_10248 ?auto_10249 ?auto_10250 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10253 - BLOCK
      ?auto_10254 - BLOCK
      ?auto_10255 - BLOCK
    )
    :vars
    (
      ?auto_10256 - BLOCK
      ?auto_10257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10253 ?auto_10254 ) ) ( not ( = ?auto_10253 ?auto_10255 ) ) ( not ( = ?auto_10254 ?auto_10255 ) ) ( not ( = ?auto_10253 ?auto_10256 ) ) ( not ( = ?auto_10254 ?auto_10256 ) ) ( not ( = ?auto_10255 ?auto_10256 ) ) ( ON-TABLE ?auto_10256 ) ( ON ?auto_10253 ?auto_10257 ) ( not ( = ?auto_10253 ?auto_10257 ) ) ( not ( = ?auto_10254 ?auto_10257 ) ) ( not ( = ?auto_10255 ?auto_10257 ) ) ( not ( = ?auto_10256 ?auto_10257 ) ) ( ON ?auto_10254 ?auto_10253 ) ( CLEAR ?auto_10254 ) ( ON-TABLE ?auto_10257 ) ( HOLDING ?auto_10255 ) ( CLEAR ?auto_10256 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10256 ?auto_10255 )
      ( MAKE-3PILE ?auto_10253 ?auto_10254 ?auto_10255 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10258 - BLOCK
      ?auto_10259 - BLOCK
      ?auto_10260 - BLOCK
    )
    :vars
    (
      ?auto_10261 - BLOCK
      ?auto_10262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10258 ?auto_10259 ) ) ( not ( = ?auto_10258 ?auto_10260 ) ) ( not ( = ?auto_10259 ?auto_10260 ) ) ( not ( = ?auto_10258 ?auto_10261 ) ) ( not ( = ?auto_10259 ?auto_10261 ) ) ( not ( = ?auto_10260 ?auto_10261 ) ) ( ON-TABLE ?auto_10261 ) ( ON ?auto_10258 ?auto_10262 ) ( not ( = ?auto_10258 ?auto_10262 ) ) ( not ( = ?auto_10259 ?auto_10262 ) ) ( not ( = ?auto_10260 ?auto_10262 ) ) ( not ( = ?auto_10261 ?auto_10262 ) ) ( ON ?auto_10259 ?auto_10258 ) ( ON-TABLE ?auto_10262 ) ( CLEAR ?auto_10261 ) ( ON ?auto_10260 ?auto_10259 ) ( CLEAR ?auto_10260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10262 ?auto_10258 ?auto_10259 )
      ( MAKE-3PILE ?auto_10258 ?auto_10259 ?auto_10260 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10263 - BLOCK
      ?auto_10264 - BLOCK
      ?auto_10265 - BLOCK
    )
    :vars
    (
      ?auto_10266 - BLOCK
      ?auto_10267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10263 ?auto_10264 ) ) ( not ( = ?auto_10263 ?auto_10265 ) ) ( not ( = ?auto_10264 ?auto_10265 ) ) ( not ( = ?auto_10263 ?auto_10266 ) ) ( not ( = ?auto_10264 ?auto_10266 ) ) ( not ( = ?auto_10265 ?auto_10266 ) ) ( ON ?auto_10263 ?auto_10267 ) ( not ( = ?auto_10263 ?auto_10267 ) ) ( not ( = ?auto_10264 ?auto_10267 ) ) ( not ( = ?auto_10265 ?auto_10267 ) ) ( not ( = ?auto_10266 ?auto_10267 ) ) ( ON ?auto_10264 ?auto_10263 ) ( ON-TABLE ?auto_10267 ) ( ON ?auto_10265 ?auto_10264 ) ( CLEAR ?auto_10265 ) ( HOLDING ?auto_10266 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10266 )
      ( MAKE-3PILE ?auto_10263 ?auto_10264 ?auto_10265 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10268 - BLOCK
      ?auto_10269 - BLOCK
      ?auto_10270 - BLOCK
    )
    :vars
    (
      ?auto_10271 - BLOCK
      ?auto_10272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10268 ?auto_10269 ) ) ( not ( = ?auto_10268 ?auto_10270 ) ) ( not ( = ?auto_10269 ?auto_10270 ) ) ( not ( = ?auto_10268 ?auto_10271 ) ) ( not ( = ?auto_10269 ?auto_10271 ) ) ( not ( = ?auto_10270 ?auto_10271 ) ) ( ON ?auto_10268 ?auto_10272 ) ( not ( = ?auto_10268 ?auto_10272 ) ) ( not ( = ?auto_10269 ?auto_10272 ) ) ( not ( = ?auto_10270 ?auto_10272 ) ) ( not ( = ?auto_10271 ?auto_10272 ) ) ( ON ?auto_10269 ?auto_10268 ) ( ON-TABLE ?auto_10272 ) ( ON ?auto_10270 ?auto_10269 ) ( ON ?auto_10271 ?auto_10270 ) ( CLEAR ?auto_10271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10272 ?auto_10268 ?auto_10269 ?auto_10270 )
      ( MAKE-3PILE ?auto_10268 ?auto_10269 ?auto_10270 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10281 - BLOCK
      ?auto_10282 - BLOCK
      ?auto_10283 - BLOCK
      ?auto_10284 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10283 ) ( ON-TABLE ?auto_10281 ) ( ON ?auto_10282 ?auto_10281 ) ( ON ?auto_10283 ?auto_10282 ) ( not ( = ?auto_10281 ?auto_10282 ) ) ( not ( = ?auto_10281 ?auto_10283 ) ) ( not ( = ?auto_10281 ?auto_10284 ) ) ( not ( = ?auto_10282 ?auto_10283 ) ) ( not ( = ?auto_10282 ?auto_10284 ) ) ( not ( = ?auto_10283 ?auto_10284 ) ) ( ON-TABLE ?auto_10284 ) ( CLEAR ?auto_10284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_10284 )
      ( MAKE-4PILE ?auto_10281 ?auto_10282 ?auto_10283 ?auto_10284 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10285 - BLOCK
      ?auto_10286 - BLOCK
      ?auto_10287 - BLOCK
      ?auto_10288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10285 ) ( ON ?auto_10286 ?auto_10285 ) ( not ( = ?auto_10285 ?auto_10286 ) ) ( not ( = ?auto_10285 ?auto_10287 ) ) ( not ( = ?auto_10285 ?auto_10288 ) ) ( not ( = ?auto_10286 ?auto_10287 ) ) ( not ( = ?auto_10286 ?auto_10288 ) ) ( not ( = ?auto_10287 ?auto_10288 ) ) ( ON-TABLE ?auto_10288 ) ( CLEAR ?auto_10288 ) ( HOLDING ?auto_10287 ) ( CLEAR ?auto_10286 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10285 ?auto_10286 ?auto_10287 )
      ( MAKE-4PILE ?auto_10285 ?auto_10286 ?auto_10287 ?auto_10288 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10289 - BLOCK
      ?auto_10290 - BLOCK
      ?auto_10291 - BLOCK
      ?auto_10292 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10289 ) ( ON ?auto_10290 ?auto_10289 ) ( not ( = ?auto_10289 ?auto_10290 ) ) ( not ( = ?auto_10289 ?auto_10291 ) ) ( not ( = ?auto_10289 ?auto_10292 ) ) ( not ( = ?auto_10290 ?auto_10291 ) ) ( not ( = ?auto_10290 ?auto_10292 ) ) ( not ( = ?auto_10291 ?auto_10292 ) ) ( ON-TABLE ?auto_10292 ) ( CLEAR ?auto_10290 ) ( ON ?auto_10291 ?auto_10292 ) ( CLEAR ?auto_10291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10292 )
      ( MAKE-4PILE ?auto_10289 ?auto_10290 ?auto_10291 ?auto_10292 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10293 - BLOCK
      ?auto_10294 - BLOCK
      ?auto_10295 - BLOCK
      ?auto_10296 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10293 ) ( not ( = ?auto_10293 ?auto_10294 ) ) ( not ( = ?auto_10293 ?auto_10295 ) ) ( not ( = ?auto_10293 ?auto_10296 ) ) ( not ( = ?auto_10294 ?auto_10295 ) ) ( not ( = ?auto_10294 ?auto_10296 ) ) ( not ( = ?auto_10295 ?auto_10296 ) ) ( ON-TABLE ?auto_10296 ) ( ON ?auto_10295 ?auto_10296 ) ( CLEAR ?auto_10295 ) ( HOLDING ?auto_10294 ) ( CLEAR ?auto_10293 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10293 ?auto_10294 )
      ( MAKE-4PILE ?auto_10293 ?auto_10294 ?auto_10295 ?auto_10296 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10297 - BLOCK
      ?auto_10298 - BLOCK
      ?auto_10299 - BLOCK
      ?auto_10300 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10297 ) ( not ( = ?auto_10297 ?auto_10298 ) ) ( not ( = ?auto_10297 ?auto_10299 ) ) ( not ( = ?auto_10297 ?auto_10300 ) ) ( not ( = ?auto_10298 ?auto_10299 ) ) ( not ( = ?auto_10298 ?auto_10300 ) ) ( not ( = ?auto_10299 ?auto_10300 ) ) ( ON-TABLE ?auto_10300 ) ( ON ?auto_10299 ?auto_10300 ) ( CLEAR ?auto_10297 ) ( ON ?auto_10298 ?auto_10299 ) ( CLEAR ?auto_10298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10300 ?auto_10299 )
      ( MAKE-4PILE ?auto_10297 ?auto_10298 ?auto_10299 ?auto_10300 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10301 - BLOCK
      ?auto_10302 - BLOCK
      ?auto_10303 - BLOCK
      ?auto_10304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10301 ?auto_10302 ) ) ( not ( = ?auto_10301 ?auto_10303 ) ) ( not ( = ?auto_10301 ?auto_10304 ) ) ( not ( = ?auto_10302 ?auto_10303 ) ) ( not ( = ?auto_10302 ?auto_10304 ) ) ( not ( = ?auto_10303 ?auto_10304 ) ) ( ON-TABLE ?auto_10304 ) ( ON ?auto_10303 ?auto_10304 ) ( ON ?auto_10302 ?auto_10303 ) ( CLEAR ?auto_10302 ) ( HOLDING ?auto_10301 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10301 )
      ( MAKE-4PILE ?auto_10301 ?auto_10302 ?auto_10303 ?auto_10304 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10305 - BLOCK
      ?auto_10306 - BLOCK
      ?auto_10307 - BLOCK
      ?auto_10308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10305 ?auto_10306 ) ) ( not ( = ?auto_10305 ?auto_10307 ) ) ( not ( = ?auto_10305 ?auto_10308 ) ) ( not ( = ?auto_10306 ?auto_10307 ) ) ( not ( = ?auto_10306 ?auto_10308 ) ) ( not ( = ?auto_10307 ?auto_10308 ) ) ( ON-TABLE ?auto_10308 ) ( ON ?auto_10307 ?auto_10308 ) ( ON ?auto_10306 ?auto_10307 ) ( ON ?auto_10305 ?auto_10306 ) ( CLEAR ?auto_10305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10308 ?auto_10307 ?auto_10306 )
      ( MAKE-4PILE ?auto_10305 ?auto_10306 ?auto_10307 ?auto_10308 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10313 - BLOCK
      ?auto_10314 - BLOCK
      ?auto_10315 - BLOCK
      ?auto_10316 - BLOCK
    )
    :vars
    (
      ?auto_10317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10313 ?auto_10314 ) ) ( not ( = ?auto_10313 ?auto_10315 ) ) ( not ( = ?auto_10313 ?auto_10316 ) ) ( not ( = ?auto_10314 ?auto_10315 ) ) ( not ( = ?auto_10314 ?auto_10316 ) ) ( not ( = ?auto_10315 ?auto_10316 ) ) ( ON-TABLE ?auto_10316 ) ( ON ?auto_10315 ?auto_10316 ) ( ON ?auto_10314 ?auto_10315 ) ( CLEAR ?auto_10314 ) ( ON ?auto_10313 ?auto_10317 ) ( CLEAR ?auto_10313 ) ( HAND-EMPTY ) ( not ( = ?auto_10313 ?auto_10317 ) ) ( not ( = ?auto_10314 ?auto_10317 ) ) ( not ( = ?auto_10315 ?auto_10317 ) ) ( not ( = ?auto_10316 ?auto_10317 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10313 ?auto_10317 )
      ( MAKE-4PILE ?auto_10313 ?auto_10314 ?auto_10315 ?auto_10316 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10318 - BLOCK
      ?auto_10319 - BLOCK
      ?auto_10320 - BLOCK
      ?auto_10321 - BLOCK
    )
    :vars
    (
      ?auto_10322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10318 ?auto_10319 ) ) ( not ( = ?auto_10318 ?auto_10320 ) ) ( not ( = ?auto_10318 ?auto_10321 ) ) ( not ( = ?auto_10319 ?auto_10320 ) ) ( not ( = ?auto_10319 ?auto_10321 ) ) ( not ( = ?auto_10320 ?auto_10321 ) ) ( ON-TABLE ?auto_10321 ) ( ON ?auto_10320 ?auto_10321 ) ( ON ?auto_10318 ?auto_10322 ) ( CLEAR ?auto_10318 ) ( not ( = ?auto_10318 ?auto_10322 ) ) ( not ( = ?auto_10319 ?auto_10322 ) ) ( not ( = ?auto_10320 ?auto_10322 ) ) ( not ( = ?auto_10321 ?auto_10322 ) ) ( HOLDING ?auto_10319 ) ( CLEAR ?auto_10320 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10321 ?auto_10320 ?auto_10319 )
      ( MAKE-4PILE ?auto_10318 ?auto_10319 ?auto_10320 ?auto_10321 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10323 - BLOCK
      ?auto_10324 - BLOCK
      ?auto_10325 - BLOCK
      ?auto_10326 - BLOCK
    )
    :vars
    (
      ?auto_10327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10323 ?auto_10324 ) ) ( not ( = ?auto_10323 ?auto_10325 ) ) ( not ( = ?auto_10323 ?auto_10326 ) ) ( not ( = ?auto_10324 ?auto_10325 ) ) ( not ( = ?auto_10324 ?auto_10326 ) ) ( not ( = ?auto_10325 ?auto_10326 ) ) ( ON-TABLE ?auto_10326 ) ( ON ?auto_10325 ?auto_10326 ) ( ON ?auto_10323 ?auto_10327 ) ( not ( = ?auto_10323 ?auto_10327 ) ) ( not ( = ?auto_10324 ?auto_10327 ) ) ( not ( = ?auto_10325 ?auto_10327 ) ) ( not ( = ?auto_10326 ?auto_10327 ) ) ( CLEAR ?auto_10325 ) ( ON ?auto_10324 ?auto_10323 ) ( CLEAR ?auto_10324 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10327 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10327 ?auto_10323 )
      ( MAKE-4PILE ?auto_10323 ?auto_10324 ?auto_10325 ?auto_10326 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10328 - BLOCK
      ?auto_10329 - BLOCK
      ?auto_10330 - BLOCK
      ?auto_10331 - BLOCK
    )
    :vars
    (
      ?auto_10332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10328 ?auto_10329 ) ) ( not ( = ?auto_10328 ?auto_10330 ) ) ( not ( = ?auto_10328 ?auto_10331 ) ) ( not ( = ?auto_10329 ?auto_10330 ) ) ( not ( = ?auto_10329 ?auto_10331 ) ) ( not ( = ?auto_10330 ?auto_10331 ) ) ( ON-TABLE ?auto_10331 ) ( ON ?auto_10328 ?auto_10332 ) ( not ( = ?auto_10328 ?auto_10332 ) ) ( not ( = ?auto_10329 ?auto_10332 ) ) ( not ( = ?auto_10330 ?auto_10332 ) ) ( not ( = ?auto_10331 ?auto_10332 ) ) ( ON ?auto_10329 ?auto_10328 ) ( CLEAR ?auto_10329 ) ( ON-TABLE ?auto_10332 ) ( HOLDING ?auto_10330 ) ( CLEAR ?auto_10331 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10331 ?auto_10330 )
      ( MAKE-4PILE ?auto_10328 ?auto_10329 ?auto_10330 ?auto_10331 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10333 - BLOCK
      ?auto_10334 - BLOCK
      ?auto_10335 - BLOCK
      ?auto_10336 - BLOCK
    )
    :vars
    (
      ?auto_10337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10333 ?auto_10334 ) ) ( not ( = ?auto_10333 ?auto_10335 ) ) ( not ( = ?auto_10333 ?auto_10336 ) ) ( not ( = ?auto_10334 ?auto_10335 ) ) ( not ( = ?auto_10334 ?auto_10336 ) ) ( not ( = ?auto_10335 ?auto_10336 ) ) ( ON-TABLE ?auto_10336 ) ( ON ?auto_10333 ?auto_10337 ) ( not ( = ?auto_10333 ?auto_10337 ) ) ( not ( = ?auto_10334 ?auto_10337 ) ) ( not ( = ?auto_10335 ?auto_10337 ) ) ( not ( = ?auto_10336 ?auto_10337 ) ) ( ON ?auto_10334 ?auto_10333 ) ( ON-TABLE ?auto_10337 ) ( CLEAR ?auto_10336 ) ( ON ?auto_10335 ?auto_10334 ) ( CLEAR ?auto_10335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10337 ?auto_10333 ?auto_10334 )
      ( MAKE-4PILE ?auto_10333 ?auto_10334 ?auto_10335 ?auto_10336 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10338 - BLOCK
      ?auto_10339 - BLOCK
      ?auto_10340 - BLOCK
      ?auto_10341 - BLOCK
    )
    :vars
    (
      ?auto_10342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10338 ?auto_10339 ) ) ( not ( = ?auto_10338 ?auto_10340 ) ) ( not ( = ?auto_10338 ?auto_10341 ) ) ( not ( = ?auto_10339 ?auto_10340 ) ) ( not ( = ?auto_10339 ?auto_10341 ) ) ( not ( = ?auto_10340 ?auto_10341 ) ) ( ON ?auto_10338 ?auto_10342 ) ( not ( = ?auto_10338 ?auto_10342 ) ) ( not ( = ?auto_10339 ?auto_10342 ) ) ( not ( = ?auto_10340 ?auto_10342 ) ) ( not ( = ?auto_10341 ?auto_10342 ) ) ( ON ?auto_10339 ?auto_10338 ) ( ON-TABLE ?auto_10342 ) ( ON ?auto_10340 ?auto_10339 ) ( CLEAR ?auto_10340 ) ( HOLDING ?auto_10341 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10341 )
      ( MAKE-4PILE ?auto_10338 ?auto_10339 ?auto_10340 ?auto_10341 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10343 - BLOCK
      ?auto_10344 - BLOCK
      ?auto_10345 - BLOCK
      ?auto_10346 - BLOCK
    )
    :vars
    (
      ?auto_10347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10343 ?auto_10344 ) ) ( not ( = ?auto_10343 ?auto_10345 ) ) ( not ( = ?auto_10343 ?auto_10346 ) ) ( not ( = ?auto_10344 ?auto_10345 ) ) ( not ( = ?auto_10344 ?auto_10346 ) ) ( not ( = ?auto_10345 ?auto_10346 ) ) ( ON ?auto_10343 ?auto_10347 ) ( not ( = ?auto_10343 ?auto_10347 ) ) ( not ( = ?auto_10344 ?auto_10347 ) ) ( not ( = ?auto_10345 ?auto_10347 ) ) ( not ( = ?auto_10346 ?auto_10347 ) ) ( ON ?auto_10344 ?auto_10343 ) ( ON-TABLE ?auto_10347 ) ( ON ?auto_10345 ?auto_10344 ) ( ON ?auto_10346 ?auto_10345 ) ( CLEAR ?auto_10346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10347 ?auto_10343 ?auto_10344 ?auto_10345 )
      ( MAKE-4PILE ?auto_10343 ?auto_10344 ?auto_10345 ?auto_10346 ) )
  )

)

