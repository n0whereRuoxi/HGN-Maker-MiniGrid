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
      ?auto_8884 - BLOCK
      ?auto_8885 - BLOCK
      ?auto_8886 - BLOCK
      ?auto_8887 - BLOCK
    )
    :vars
    (
      ?auto_8888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8888 ?auto_8887 ) ( CLEAR ?auto_8888 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8884 ) ( ON ?auto_8885 ?auto_8884 ) ( ON ?auto_8886 ?auto_8885 ) ( ON ?auto_8887 ?auto_8886 ) ( not ( = ?auto_8884 ?auto_8885 ) ) ( not ( = ?auto_8884 ?auto_8886 ) ) ( not ( = ?auto_8884 ?auto_8887 ) ) ( not ( = ?auto_8884 ?auto_8888 ) ) ( not ( = ?auto_8885 ?auto_8886 ) ) ( not ( = ?auto_8885 ?auto_8887 ) ) ( not ( = ?auto_8885 ?auto_8888 ) ) ( not ( = ?auto_8886 ?auto_8887 ) ) ( not ( = ?auto_8886 ?auto_8888 ) ) ( not ( = ?auto_8887 ?auto_8888 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8888 ?auto_8887 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8890 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8890 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_8890 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8891 - BLOCK
    )
    :vars
    (
      ?auto_8892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8891 ?auto_8892 ) ( CLEAR ?auto_8891 ) ( HAND-EMPTY ) ( not ( = ?auto_8891 ?auto_8892 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8891 ?auto_8892 )
      ( MAKE-1PILE ?auto_8891 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8896 - BLOCK
      ?auto_8897 - BLOCK
      ?auto_8898 - BLOCK
    )
    :vars
    (
      ?auto_8899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8899 ?auto_8898 ) ( CLEAR ?auto_8899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8896 ) ( ON ?auto_8897 ?auto_8896 ) ( ON ?auto_8898 ?auto_8897 ) ( not ( = ?auto_8896 ?auto_8897 ) ) ( not ( = ?auto_8896 ?auto_8898 ) ) ( not ( = ?auto_8896 ?auto_8899 ) ) ( not ( = ?auto_8897 ?auto_8898 ) ) ( not ( = ?auto_8897 ?auto_8899 ) ) ( not ( = ?auto_8898 ?auto_8899 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8899 ?auto_8898 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8900 - BLOCK
      ?auto_8901 - BLOCK
      ?auto_8902 - BLOCK
    )
    :vars
    (
      ?auto_8903 - BLOCK
      ?auto_8904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8903 ?auto_8902 ) ( CLEAR ?auto_8903 ) ( ON-TABLE ?auto_8900 ) ( ON ?auto_8901 ?auto_8900 ) ( ON ?auto_8902 ?auto_8901 ) ( not ( = ?auto_8900 ?auto_8901 ) ) ( not ( = ?auto_8900 ?auto_8902 ) ) ( not ( = ?auto_8900 ?auto_8903 ) ) ( not ( = ?auto_8901 ?auto_8902 ) ) ( not ( = ?auto_8901 ?auto_8903 ) ) ( not ( = ?auto_8902 ?auto_8903 ) ) ( HOLDING ?auto_8904 ) ( not ( = ?auto_8900 ?auto_8904 ) ) ( not ( = ?auto_8901 ?auto_8904 ) ) ( not ( = ?auto_8902 ?auto_8904 ) ) ( not ( = ?auto_8903 ?auto_8904 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_8904 )
      ( MAKE-3PILE ?auto_8900 ?auto_8901 ?auto_8902 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8905 - BLOCK
      ?auto_8906 - BLOCK
      ?auto_8907 - BLOCK
    )
    :vars
    (
      ?auto_8909 - BLOCK
      ?auto_8908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8909 ?auto_8907 ) ( ON-TABLE ?auto_8905 ) ( ON ?auto_8906 ?auto_8905 ) ( ON ?auto_8907 ?auto_8906 ) ( not ( = ?auto_8905 ?auto_8906 ) ) ( not ( = ?auto_8905 ?auto_8907 ) ) ( not ( = ?auto_8905 ?auto_8909 ) ) ( not ( = ?auto_8906 ?auto_8907 ) ) ( not ( = ?auto_8906 ?auto_8909 ) ) ( not ( = ?auto_8907 ?auto_8909 ) ) ( not ( = ?auto_8905 ?auto_8908 ) ) ( not ( = ?auto_8906 ?auto_8908 ) ) ( not ( = ?auto_8907 ?auto_8908 ) ) ( not ( = ?auto_8909 ?auto_8908 ) ) ( ON ?auto_8908 ?auto_8909 ) ( CLEAR ?auto_8908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8905 ?auto_8906 ?auto_8907 ?auto_8909 )
      ( MAKE-3PILE ?auto_8905 ?auto_8906 ?auto_8907 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8912 - BLOCK
      ?auto_8913 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8913 ) ( CLEAR ?auto_8912 ) ( ON-TABLE ?auto_8912 ) ( not ( = ?auto_8912 ?auto_8913 ) ) )
    :subtasks
    ( ( !STACK ?auto_8913 ?auto_8912 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8914 - BLOCK
      ?auto_8915 - BLOCK
    )
    :vars
    (
      ?auto_8916 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8914 ) ( ON-TABLE ?auto_8914 ) ( not ( = ?auto_8914 ?auto_8915 ) ) ( ON ?auto_8915 ?auto_8916 ) ( CLEAR ?auto_8915 ) ( HAND-EMPTY ) ( not ( = ?auto_8914 ?auto_8916 ) ) ( not ( = ?auto_8915 ?auto_8916 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8915 ?auto_8916 )
      ( MAKE-2PILE ?auto_8914 ?auto_8915 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8917 - BLOCK
      ?auto_8918 - BLOCK
    )
    :vars
    (
      ?auto_8919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8917 ?auto_8918 ) ) ( ON ?auto_8918 ?auto_8919 ) ( CLEAR ?auto_8918 ) ( not ( = ?auto_8917 ?auto_8919 ) ) ( not ( = ?auto_8918 ?auto_8919 ) ) ( HOLDING ?auto_8917 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8917 )
      ( MAKE-2PILE ?auto_8917 ?auto_8918 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8920 - BLOCK
      ?auto_8921 - BLOCK
    )
    :vars
    (
      ?auto_8922 - BLOCK
      ?auto_8924 - BLOCK
      ?auto_8923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8920 ?auto_8921 ) ) ( ON ?auto_8921 ?auto_8922 ) ( not ( = ?auto_8920 ?auto_8922 ) ) ( not ( = ?auto_8921 ?auto_8922 ) ) ( ON ?auto_8920 ?auto_8921 ) ( CLEAR ?auto_8920 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8924 ) ( ON ?auto_8923 ?auto_8924 ) ( ON ?auto_8922 ?auto_8923 ) ( not ( = ?auto_8924 ?auto_8923 ) ) ( not ( = ?auto_8924 ?auto_8922 ) ) ( not ( = ?auto_8924 ?auto_8921 ) ) ( not ( = ?auto_8924 ?auto_8920 ) ) ( not ( = ?auto_8923 ?auto_8922 ) ) ( not ( = ?auto_8923 ?auto_8921 ) ) ( not ( = ?auto_8923 ?auto_8920 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8924 ?auto_8923 ?auto_8922 ?auto_8921 )
      ( MAKE-2PILE ?auto_8920 ?auto_8921 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8927 - BLOCK
      ?auto_8928 - BLOCK
    )
    :vars
    (
      ?auto_8929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8929 ?auto_8928 ) ( CLEAR ?auto_8929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8927 ) ( ON ?auto_8928 ?auto_8927 ) ( not ( = ?auto_8927 ?auto_8928 ) ) ( not ( = ?auto_8927 ?auto_8929 ) ) ( not ( = ?auto_8928 ?auto_8929 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8929 ?auto_8928 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8930 - BLOCK
      ?auto_8931 - BLOCK
    )
    :vars
    (
      ?auto_8932 - BLOCK
      ?auto_8933 - BLOCK
      ?auto_8934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8932 ?auto_8931 ) ( CLEAR ?auto_8932 ) ( ON-TABLE ?auto_8930 ) ( ON ?auto_8931 ?auto_8930 ) ( not ( = ?auto_8930 ?auto_8931 ) ) ( not ( = ?auto_8930 ?auto_8932 ) ) ( not ( = ?auto_8931 ?auto_8932 ) ) ( HOLDING ?auto_8933 ) ( CLEAR ?auto_8934 ) ( not ( = ?auto_8930 ?auto_8933 ) ) ( not ( = ?auto_8930 ?auto_8934 ) ) ( not ( = ?auto_8931 ?auto_8933 ) ) ( not ( = ?auto_8931 ?auto_8934 ) ) ( not ( = ?auto_8932 ?auto_8933 ) ) ( not ( = ?auto_8932 ?auto_8934 ) ) ( not ( = ?auto_8933 ?auto_8934 ) ) )
    :subtasks
    ( ( !STACK ?auto_8933 ?auto_8934 )
      ( MAKE-2PILE ?auto_8930 ?auto_8931 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8935 - BLOCK
      ?auto_8936 - BLOCK
    )
    :vars
    (
      ?auto_8938 - BLOCK
      ?auto_8937 - BLOCK
      ?auto_8939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8938 ?auto_8936 ) ( ON-TABLE ?auto_8935 ) ( ON ?auto_8936 ?auto_8935 ) ( not ( = ?auto_8935 ?auto_8936 ) ) ( not ( = ?auto_8935 ?auto_8938 ) ) ( not ( = ?auto_8936 ?auto_8938 ) ) ( CLEAR ?auto_8937 ) ( not ( = ?auto_8935 ?auto_8939 ) ) ( not ( = ?auto_8935 ?auto_8937 ) ) ( not ( = ?auto_8936 ?auto_8939 ) ) ( not ( = ?auto_8936 ?auto_8937 ) ) ( not ( = ?auto_8938 ?auto_8939 ) ) ( not ( = ?auto_8938 ?auto_8937 ) ) ( not ( = ?auto_8939 ?auto_8937 ) ) ( ON ?auto_8939 ?auto_8938 ) ( CLEAR ?auto_8939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8935 ?auto_8936 ?auto_8938 )
      ( MAKE-2PILE ?auto_8935 ?auto_8936 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8940 - BLOCK
      ?auto_8941 - BLOCK
    )
    :vars
    (
      ?auto_8942 - BLOCK
      ?auto_8943 - BLOCK
      ?auto_8944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8942 ?auto_8941 ) ( ON-TABLE ?auto_8940 ) ( ON ?auto_8941 ?auto_8940 ) ( not ( = ?auto_8940 ?auto_8941 ) ) ( not ( = ?auto_8940 ?auto_8942 ) ) ( not ( = ?auto_8941 ?auto_8942 ) ) ( not ( = ?auto_8940 ?auto_8943 ) ) ( not ( = ?auto_8940 ?auto_8944 ) ) ( not ( = ?auto_8941 ?auto_8943 ) ) ( not ( = ?auto_8941 ?auto_8944 ) ) ( not ( = ?auto_8942 ?auto_8943 ) ) ( not ( = ?auto_8942 ?auto_8944 ) ) ( not ( = ?auto_8943 ?auto_8944 ) ) ( ON ?auto_8943 ?auto_8942 ) ( CLEAR ?auto_8943 ) ( HOLDING ?auto_8944 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8944 )
      ( MAKE-2PILE ?auto_8940 ?auto_8941 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8945 - BLOCK
      ?auto_8946 - BLOCK
    )
    :vars
    (
      ?auto_8948 - BLOCK
      ?auto_8947 - BLOCK
      ?auto_8949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8948 ?auto_8946 ) ( ON-TABLE ?auto_8945 ) ( ON ?auto_8946 ?auto_8945 ) ( not ( = ?auto_8945 ?auto_8946 ) ) ( not ( = ?auto_8945 ?auto_8948 ) ) ( not ( = ?auto_8946 ?auto_8948 ) ) ( not ( = ?auto_8945 ?auto_8947 ) ) ( not ( = ?auto_8945 ?auto_8949 ) ) ( not ( = ?auto_8946 ?auto_8947 ) ) ( not ( = ?auto_8946 ?auto_8949 ) ) ( not ( = ?auto_8948 ?auto_8947 ) ) ( not ( = ?auto_8948 ?auto_8949 ) ) ( not ( = ?auto_8947 ?auto_8949 ) ) ( ON ?auto_8947 ?auto_8948 ) ( ON ?auto_8949 ?auto_8947 ) ( CLEAR ?auto_8949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8945 ?auto_8946 ?auto_8948 ?auto_8947 )
      ( MAKE-2PILE ?auto_8945 ?auto_8946 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8953 - BLOCK
      ?auto_8954 - BLOCK
      ?auto_8955 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8955 ) ( CLEAR ?auto_8954 ) ( ON-TABLE ?auto_8953 ) ( ON ?auto_8954 ?auto_8953 ) ( not ( = ?auto_8953 ?auto_8954 ) ) ( not ( = ?auto_8953 ?auto_8955 ) ) ( not ( = ?auto_8954 ?auto_8955 ) ) )
    :subtasks
    ( ( !STACK ?auto_8955 ?auto_8954 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8956 - BLOCK
      ?auto_8957 - BLOCK
      ?auto_8958 - BLOCK
    )
    :vars
    (
      ?auto_8959 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8957 ) ( ON-TABLE ?auto_8956 ) ( ON ?auto_8957 ?auto_8956 ) ( not ( = ?auto_8956 ?auto_8957 ) ) ( not ( = ?auto_8956 ?auto_8958 ) ) ( not ( = ?auto_8957 ?auto_8958 ) ) ( ON ?auto_8958 ?auto_8959 ) ( CLEAR ?auto_8958 ) ( HAND-EMPTY ) ( not ( = ?auto_8956 ?auto_8959 ) ) ( not ( = ?auto_8957 ?auto_8959 ) ) ( not ( = ?auto_8958 ?auto_8959 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8958 ?auto_8959 )
      ( MAKE-3PILE ?auto_8956 ?auto_8957 ?auto_8958 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8960 - BLOCK
      ?auto_8961 - BLOCK
      ?auto_8962 - BLOCK
    )
    :vars
    (
      ?auto_8963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8960 ) ( not ( = ?auto_8960 ?auto_8961 ) ) ( not ( = ?auto_8960 ?auto_8962 ) ) ( not ( = ?auto_8961 ?auto_8962 ) ) ( ON ?auto_8962 ?auto_8963 ) ( CLEAR ?auto_8962 ) ( not ( = ?auto_8960 ?auto_8963 ) ) ( not ( = ?auto_8961 ?auto_8963 ) ) ( not ( = ?auto_8962 ?auto_8963 ) ) ( HOLDING ?auto_8961 ) ( CLEAR ?auto_8960 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8960 ?auto_8961 )
      ( MAKE-3PILE ?auto_8960 ?auto_8961 ?auto_8962 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8964 - BLOCK
      ?auto_8965 - BLOCK
      ?auto_8966 - BLOCK
    )
    :vars
    (
      ?auto_8967 - BLOCK
      ?auto_8968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8964 ) ( not ( = ?auto_8964 ?auto_8965 ) ) ( not ( = ?auto_8964 ?auto_8966 ) ) ( not ( = ?auto_8965 ?auto_8966 ) ) ( ON ?auto_8966 ?auto_8967 ) ( not ( = ?auto_8964 ?auto_8967 ) ) ( not ( = ?auto_8965 ?auto_8967 ) ) ( not ( = ?auto_8966 ?auto_8967 ) ) ( CLEAR ?auto_8964 ) ( ON ?auto_8965 ?auto_8966 ) ( CLEAR ?auto_8965 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8968 ) ( ON ?auto_8967 ?auto_8968 ) ( not ( = ?auto_8968 ?auto_8967 ) ) ( not ( = ?auto_8968 ?auto_8966 ) ) ( not ( = ?auto_8968 ?auto_8965 ) ) ( not ( = ?auto_8964 ?auto_8968 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8968 ?auto_8967 ?auto_8966 )
      ( MAKE-3PILE ?auto_8964 ?auto_8965 ?auto_8966 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8969 - BLOCK
      ?auto_8970 - BLOCK
      ?auto_8971 - BLOCK
    )
    :vars
    (
      ?auto_8973 - BLOCK
      ?auto_8972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8969 ?auto_8970 ) ) ( not ( = ?auto_8969 ?auto_8971 ) ) ( not ( = ?auto_8970 ?auto_8971 ) ) ( ON ?auto_8971 ?auto_8973 ) ( not ( = ?auto_8969 ?auto_8973 ) ) ( not ( = ?auto_8970 ?auto_8973 ) ) ( not ( = ?auto_8971 ?auto_8973 ) ) ( ON ?auto_8970 ?auto_8971 ) ( CLEAR ?auto_8970 ) ( ON-TABLE ?auto_8972 ) ( ON ?auto_8973 ?auto_8972 ) ( not ( = ?auto_8972 ?auto_8973 ) ) ( not ( = ?auto_8972 ?auto_8971 ) ) ( not ( = ?auto_8972 ?auto_8970 ) ) ( not ( = ?auto_8969 ?auto_8972 ) ) ( HOLDING ?auto_8969 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8969 )
      ( MAKE-3PILE ?auto_8969 ?auto_8970 ?auto_8971 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8974 - BLOCK
      ?auto_8975 - BLOCK
      ?auto_8976 - BLOCK
    )
    :vars
    (
      ?auto_8977 - BLOCK
      ?auto_8978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8974 ?auto_8975 ) ) ( not ( = ?auto_8974 ?auto_8976 ) ) ( not ( = ?auto_8975 ?auto_8976 ) ) ( ON ?auto_8976 ?auto_8977 ) ( not ( = ?auto_8974 ?auto_8977 ) ) ( not ( = ?auto_8975 ?auto_8977 ) ) ( not ( = ?auto_8976 ?auto_8977 ) ) ( ON ?auto_8975 ?auto_8976 ) ( ON-TABLE ?auto_8978 ) ( ON ?auto_8977 ?auto_8978 ) ( not ( = ?auto_8978 ?auto_8977 ) ) ( not ( = ?auto_8978 ?auto_8976 ) ) ( not ( = ?auto_8978 ?auto_8975 ) ) ( not ( = ?auto_8974 ?auto_8978 ) ) ( ON ?auto_8974 ?auto_8975 ) ( CLEAR ?auto_8974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8978 ?auto_8977 ?auto_8976 ?auto_8975 )
      ( MAKE-3PILE ?auto_8974 ?auto_8975 ?auto_8976 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8980 - BLOCK
    )
    :vars
    (
      ?auto_8981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8981 ?auto_8980 ) ( CLEAR ?auto_8981 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8980 ) ( not ( = ?auto_8980 ?auto_8981 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8981 ?auto_8980 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8982 - BLOCK
    )
    :vars
    (
      ?auto_8983 - BLOCK
      ?auto_8984 - BLOCK
      ?auto_8985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8983 ?auto_8982 ) ( CLEAR ?auto_8983 ) ( ON-TABLE ?auto_8982 ) ( not ( = ?auto_8982 ?auto_8983 ) ) ( HOLDING ?auto_8984 ) ( CLEAR ?auto_8985 ) ( not ( = ?auto_8982 ?auto_8984 ) ) ( not ( = ?auto_8982 ?auto_8985 ) ) ( not ( = ?auto_8983 ?auto_8984 ) ) ( not ( = ?auto_8983 ?auto_8985 ) ) ( not ( = ?auto_8984 ?auto_8985 ) ) )
    :subtasks
    ( ( !STACK ?auto_8984 ?auto_8985 )
      ( MAKE-1PILE ?auto_8982 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8986 - BLOCK
    )
    :vars
    (
      ?auto_8989 - BLOCK
      ?auto_8987 - BLOCK
      ?auto_8988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8989 ?auto_8986 ) ( ON-TABLE ?auto_8986 ) ( not ( = ?auto_8986 ?auto_8989 ) ) ( CLEAR ?auto_8987 ) ( not ( = ?auto_8986 ?auto_8988 ) ) ( not ( = ?auto_8986 ?auto_8987 ) ) ( not ( = ?auto_8989 ?auto_8988 ) ) ( not ( = ?auto_8989 ?auto_8987 ) ) ( not ( = ?auto_8988 ?auto_8987 ) ) ( ON ?auto_8988 ?auto_8989 ) ( CLEAR ?auto_8988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8986 ?auto_8989 )
      ( MAKE-1PILE ?auto_8986 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8990 - BLOCK
    )
    :vars
    (
      ?auto_8991 - BLOCK
      ?auto_8993 - BLOCK
      ?auto_8992 - BLOCK
      ?auto_8994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8991 ?auto_8990 ) ( ON-TABLE ?auto_8990 ) ( not ( = ?auto_8990 ?auto_8991 ) ) ( not ( = ?auto_8990 ?auto_8993 ) ) ( not ( = ?auto_8990 ?auto_8992 ) ) ( not ( = ?auto_8991 ?auto_8993 ) ) ( not ( = ?auto_8991 ?auto_8992 ) ) ( not ( = ?auto_8993 ?auto_8992 ) ) ( ON ?auto_8993 ?auto_8991 ) ( CLEAR ?auto_8993 ) ( HOLDING ?auto_8992 ) ( CLEAR ?auto_8994 ) ( ON-TABLE ?auto_8994 ) ( not ( = ?auto_8994 ?auto_8992 ) ) ( not ( = ?auto_8990 ?auto_8994 ) ) ( not ( = ?auto_8991 ?auto_8994 ) ) ( not ( = ?auto_8993 ?auto_8994 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8994 ?auto_8992 )
      ( MAKE-1PILE ?auto_8990 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8995 - BLOCK
    )
    :vars
    (
      ?auto_8997 - BLOCK
      ?auto_8999 - BLOCK
      ?auto_8998 - BLOCK
      ?auto_8996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8997 ?auto_8995 ) ( ON-TABLE ?auto_8995 ) ( not ( = ?auto_8995 ?auto_8997 ) ) ( not ( = ?auto_8995 ?auto_8999 ) ) ( not ( = ?auto_8995 ?auto_8998 ) ) ( not ( = ?auto_8997 ?auto_8999 ) ) ( not ( = ?auto_8997 ?auto_8998 ) ) ( not ( = ?auto_8999 ?auto_8998 ) ) ( ON ?auto_8999 ?auto_8997 ) ( CLEAR ?auto_8996 ) ( ON-TABLE ?auto_8996 ) ( not ( = ?auto_8996 ?auto_8998 ) ) ( not ( = ?auto_8995 ?auto_8996 ) ) ( not ( = ?auto_8997 ?auto_8996 ) ) ( not ( = ?auto_8999 ?auto_8996 ) ) ( ON ?auto_8998 ?auto_8999 ) ( CLEAR ?auto_8998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8995 ?auto_8997 ?auto_8999 )
      ( MAKE-1PILE ?auto_8995 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9000 - BLOCK
    )
    :vars
    (
      ?auto_9003 - BLOCK
      ?auto_9004 - BLOCK
      ?auto_9002 - BLOCK
      ?auto_9001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9003 ?auto_9000 ) ( ON-TABLE ?auto_9000 ) ( not ( = ?auto_9000 ?auto_9003 ) ) ( not ( = ?auto_9000 ?auto_9004 ) ) ( not ( = ?auto_9000 ?auto_9002 ) ) ( not ( = ?auto_9003 ?auto_9004 ) ) ( not ( = ?auto_9003 ?auto_9002 ) ) ( not ( = ?auto_9004 ?auto_9002 ) ) ( ON ?auto_9004 ?auto_9003 ) ( not ( = ?auto_9001 ?auto_9002 ) ) ( not ( = ?auto_9000 ?auto_9001 ) ) ( not ( = ?auto_9003 ?auto_9001 ) ) ( not ( = ?auto_9004 ?auto_9001 ) ) ( ON ?auto_9002 ?auto_9004 ) ( CLEAR ?auto_9002 ) ( HOLDING ?auto_9001 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9001 )
      ( MAKE-1PILE ?auto_9000 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9005 - BLOCK
    )
    :vars
    (
      ?auto_9006 - BLOCK
      ?auto_9009 - BLOCK
      ?auto_9007 - BLOCK
      ?auto_9008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9006 ?auto_9005 ) ( ON-TABLE ?auto_9005 ) ( not ( = ?auto_9005 ?auto_9006 ) ) ( not ( = ?auto_9005 ?auto_9009 ) ) ( not ( = ?auto_9005 ?auto_9007 ) ) ( not ( = ?auto_9006 ?auto_9009 ) ) ( not ( = ?auto_9006 ?auto_9007 ) ) ( not ( = ?auto_9009 ?auto_9007 ) ) ( ON ?auto_9009 ?auto_9006 ) ( not ( = ?auto_9008 ?auto_9007 ) ) ( not ( = ?auto_9005 ?auto_9008 ) ) ( not ( = ?auto_9006 ?auto_9008 ) ) ( not ( = ?auto_9009 ?auto_9008 ) ) ( ON ?auto_9007 ?auto_9009 ) ( ON ?auto_9008 ?auto_9007 ) ( CLEAR ?auto_9008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9005 ?auto_9006 ?auto_9009 ?auto_9007 )
      ( MAKE-1PILE ?auto_9005 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9014 - BLOCK
      ?auto_9015 - BLOCK
      ?auto_9016 - BLOCK
      ?auto_9017 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9017 ) ( CLEAR ?auto_9016 ) ( ON-TABLE ?auto_9014 ) ( ON ?auto_9015 ?auto_9014 ) ( ON ?auto_9016 ?auto_9015 ) ( not ( = ?auto_9014 ?auto_9015 ) ) ( not ( = ?auto_9014 ?auto_9016 ) ) ( not ( = ?auto_9014 ?auto_9017 ) ) ( not ( = ?auto_9015 ?auto_9016 ) ) ( not ( = ?auto_9015 ?auto_9017 ) ) ( not ( = ?auto_9016 ?auto_9017 ) ) )
    :subtasks
    ( ( !STACK ?auto_9017 ?auto_9016 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9018 - BLOCK
      ?auto_9019 - BLOCK
      ?auto_9020 - BLOCK
      ?auto_9021 - BLOCK
    )
    :vars
    (
      ?auto_9022 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9020 ) ( ON-TABLE ?auto_9018 ) ( ON ?auto_9019 ?auto_9018 ) ( ON ?auto_9020 ?auto_9019 ) ( not ( = ?auto_9018 ?auto_9019 ) ) ( not ( = ?auto_9018 ?auto_9020 ) ) ( not ( = ?auto_9018 ?auto_9021 ) ) ( not ( = ?auto_9019 ?auto_9020 ) ) ( not ( = ?auto_9019 ?auto_9021 ) ) ( not ( = ?auto_9020 ?auto_9021 ) ) ( ON ?auto_9021 ?auto_9022 ) ( CLEAR ?auto_9021 ) ( HAND-EMPTY ) ( not ( = ?auto_9018 ?auto_9022 ) ) ( not ( = ?auto_9019 ?auto_9022 ) ) ( not ( = ?auto_9020 ?auto_9022 ) ) ( not ( = ?auto_9021 ?auto_9022 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9021 ?auto_9022 )
      ( MAKE-4PILE ?auto_9018 ?auto_9019 ?auto_9020 ?auto_9021 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9023 - BLOCK
      ?auto_9024 - BLOCK
      ?auto_9025 - BLOCK
      ?auto_9026 - BLOCK
    )
    :vars
    (
      ?auto_9027 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9023 ) ( ON ?auto_9024 ?auto_9023 ) ( not ( = ?auto_9023 ?auto_9024 ) ) ( not ( = ?auto_9023 ?auto_9025 ) ) ( not ( = ?auto_9023 ?auto_9026 ) ) ( not ( = ?auto_9024 ?auto_9025 ) ) ( not ( = ?auto_9024 ?auto_9026 ) ) ( not ( = ?auto_9025 ?auto_9026 ) ) ( ON ?auto_9026 ?auto_9027 ) ( CLEAR ?auto_9026 ) ( not ( = ?auto_9023 ?auto_9027 ) ) ( not ( = ?auto_9024 ?auto_9027 ) ) ( not ( = ?auto_9025 ?auto_9027 ) ) ( not ( = ?auto_9026 ?auto_9027 ) ) ( HOLDING ?auto_9025 ) ( CLEAR ?auto_9024 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9023 ?auto_9024 ?auto_9025 )
      ( MAKE-4PILE ?auto_9023 ?auto_9024 ?auto_9025 ?auto_9026 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9028 - BLOCK
      ?auto_9029 - BLOCK
      ?auto_9030 - BLOCK
      ?auto_9031 - BLOCK
    )
    :vars
    (
      ?auto_9032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9028 ) ( ON ?auto_9029 ?auto_9028 ) ( not ( = ?auto_9028 ?auto_9029 ) ) ( not ( = ?auto_9028 ?auto_9030 ) ) ( not ( = ?auto_9028 ?auto_9031 ) ) ( not ( = ?auto_9029 ?auto_9030 ) ) ( not ( = ?auto_9029 ?auto_9031 ) ) ( not ( = ?auto_9030 ?auto_9031 ) ) ( ON ?auto_9031 ?auto_9032 ) ( not ( = ?auto_9028 ?auto_9032 ) ) ( not ( = ?auto_9029 ?auto_9032 ) ) ( not ( = ?auto_9030 ?auto_9032 ) ) ( not ( = ?auto_9031 ?auto_9032 ) ) ( CLEAR ?auto_9029 ) ( ON ?auto_9030 ?auto_9031 ) ( CLEAR ?auto_9030 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9032 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9032 ?auto_9031 )
      ( MAKE-4PILE ?auto_9028 ?auto_9029 ?auto_9030 ?auto_9031 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9033 - BLOCK
      ?auto_9034 - BLOCK
      ?auto_9035 - BLOCK
      ?auto_9036 - BLOCK
    )
    :vars
    (
      ?auto_9037 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9033 ) ( not ( = ?auto_9033 ?auto_9034 ) ) ( not ( = ?auto_9033 ?auto_9035 ) ) ( not ( = ?auto_9033 ?auto_9036 ) ) ( not ( = ?auto_9034 ?auto_9035 ) ) ( not ( = ?auto_9034 ?auto_9036 ) ) ( not ( = ?auto_9035 ?auto_9036 ) ) ( ON ?auto_9036 ?auto_9037 ) ( not ( = ?auto_9033 ?auto_9037 ) ) ( not ( = ?auto_9034 ?auto_9037 ) ) ( not ( = ?auto_9035 ?auto_9037 ) ) ( not ( = ?auto_9036 ?auto_9037 ) ) ( ON ?auto_9035 ?auto_9036 ) ( CLEAR ?auto_9035 ) ( ON-TABLE ?auto_9037 ) ( HOLDING ?auto_9034 ) ( CLEAR ?auto_9033 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9033 ?auto_9034 )
      ( MAKE-4PILE ?auto_9033 ?auto_9034 ?auto_9035 ?auto_9036 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9038 - BLOCK
      ?auto_9039 - BLOCK
      ?auto_9040 - BLOCK
      ?auto_9041 - BLOCK
    )
    :vars
    (
      ?auto_9042 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9038 ) ( not ( = ?auto_9038 ?auto_9039 ) ) ( not ( = ?auto_9038 ?auto_9040 ) ) ( not ( = ?auto_9038 ?auto_9041 ) ) ( not ( = ?auto_9039 ?auto_9040 ) ) ( not ( = ?auto_9039 ?auto_9041 ) ) ( not ( = ?auto_9040 ?auto_9041 ) ) ( ON ?auto_9041 ?auto_9042 ) ( not ( = ?auto_9038 ?auto_9042 ) ) ( not ( = ?auto_9039 ?auto_9042 ) ) ( not ( = ?auto_9040 ?auto_9042 ) ) ( not ( = ?auto_9041 ?auto_9042 ) ) ( ON ?auto_9040 ?auto_9041 ) ( ON-TABLE ?auto_9042 ) ( CLEAR ?auto_9038 ) ( ON ?auto_9039 ?auto_9040 ) ( CLEAR ?auto_9039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9042 ?auto_9041 ?auto_9040 )
      ( MAKE-4PILE ?auto_9038 ?auto_9039 ?auto_9040 ?auto_9041 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9043 - BLOCK
      ?auto_9044 - BLOCK
      ?auto_9045 - BLOCK
      ?auto_9046 - BLOCK
    )
    :vars
    (
      ?auto_9047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9043 ?auto_9044 ) ) ( not ( = ?auto_9043 ?auto_9045 ) ) ( not ( = ?auto_9043 ?auto_9046 ) ) ( not ( = ?auto_9044 ?auto_9045 ) ) ( not ( = ?auto_9044 ?auto_9046 ) ) ( not ( = ?auto_9045 ?auto_9046 ) ) ( ON ?auto_9046 ?auto_9047 ) ( not ( = ?auto_9043 ?auto_9047 ) ) ( not ( = ?auto_9044 ?auto_9047 ) ) ( not ( = ?auto_9045 ?auto_9047 ) ) ( not ( = ?auto_9046 ?auto_9047 ) ) ( ON ?auto_9045 ?auto_9046 ) ( ON-TABLE ?auto_9047 ) ( ON ?auto_9044 ?auto_9045 ) ( CLEAR ?auto_9044 ) ( HOLDING ?auto_9043 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9043 )
      ( MAKE-4PILE ?auto_9043 ?auto_9044 ?auto_9045 ?auto_9046 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9048 - BLOCK
      ?auto_9049 - BLOCK
      ?auto_9050 - BLOCK
      ?auto_9051 - BLOCK
    )
    :vars
    (
      ?auto_9052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9048 ?auto_9049 ) ) ( not ( = ?auto_9048 ?auto_9050 ) ) ( not ( = ?auto_9048 ?auto_9051 ) ) ( not ( = ?auto_9049 ?auto_9050 ) ) ( not ( = ?auto_9049 ?auto_9051 ) ) ( not ( = ?auto_9050 ?auto_9051 ) ) ( ON ?auto_9051 ?auto_9052 ) ( not ( = ?auto_9048 ?auto_9052 ) ) ( not ( = ?auto_9049 ?auto_9052 ) ) ( not ( = ?auto_9050 ?auto_9052 ) ) ( not ( = ?auto_9051 ?auto_9052 ) ) ( ON ?auto_9050 ?auto_9051 ) ( ON-TABLE ?auto_9052 ) ( ON ?auto_9049 ?auto_9050 ) ( ON ?auto_9048 ?auto_9049 ) ( CLEAR ?auto_9048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9052 ?auto_9051 ?auto_9050 ?auto_9049 )
      ( MAKE-4PILE ?auto_9048 ?auto_9049 ?auto_9050 ?auto_9051 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9056 - BLOCK
      ?auto_9057 - BLOCK
      ?auto_9058 - BLOCK
    )
    :vars
    (
      ?auto_9059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9059 ?auto_9058 ) ( CLEAR ?auto_9059 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9056 ) ( ON ?auto_9057 ?auto_9056 ) ( ON ?auto_9058 ?auto_9057 ) ( not ( = ?auto_9056 ?auto_9057 ) ) ( not ( = ?auto_9056 ?auto_9058 ) ) ( not ( = ?auto_9056 ?auto_9059 ) ) ( not ( = ?auto_9057 ?auto_9058 ) ) ( not ( = ?auto_9057 ?auto_9059 ) ) ( not ( = ?auto_9058 ?auto_9059 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9059 ?auto_9058 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9069 - BLOCK
      ?auto_9070 - BLOCK
      ?auto_9071 - BLOCK
    )
    :vars
    (
      ?auto_9072 - BLOCK
      ?auto_9073 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9069 ) ( ON ?auto_9070 ?auto_9069 ) ( not ( = ?auto_9069 ?auto_9070 ) ) ( not ( = ?auto_9069 ?auto_9071 ) ) ( not ( = ?auto_9069 ?auto_9072 ) ) ( not ( = ?auto_9070 ?auto_9071 ) ) ( not ( = ?auto_9070 ?auto_9072 ) ) ( not ( = ?auto_9071 ?auto_9072 ) ) ( ON ?auto_9072 ?auto_9073 ) ( CLEAR ?auto_9072 ) ( not ( = ?auto_9069 ?auto_9073 ) ) ( not ( = ?auto_9070 ?auto_9073 ) ) ( not ( = ?auto_9071 ?auto_9073 ) ) ( not ( = ?auto_9072 ?auto_9073 ) ) ( HOLDING ?auto_9071 ) ( CLEAR ?auto_9070 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9069 ?auto_9070 ?auto_9071 ?auto_9072 )
      ( MAKE-3PILE ?auto_9069 ?auto_9070 ?auto_9071 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9074 - BLOCK
      ?auto_9075 - BLOCK
      ?auto_9076 - BLOCK
    )
    :vars
    (
      ?auto_9077 - BLOCK
      ?auto_9078 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9074 ) ( ON ?auto_9075 ?auto_9074 ) ( not ( = ?auto_9074 ?auto_9075 ) ) ( not ( = ?auto_9074 ?auto_9076 ) ) ( not ( = ?auto_9074 ?auto_9077 ) ) ( not ( = ?auto_9075 ?auto_9076 ) ) ( not ( = ?auto_9075 ?auto_9077 ) ) ( not ( = ?auto_9076 ?auto_9077 ) ) ( ON ?auto_9077 ?auto_9078 ) ( not ( = ?auto_9074 ?auto_9078 ) ) ( not ( = ?auto_9075 ?auto_9078 ) ) ( not ( = ?auto_9076 ?auto_9078 ) ) ( not ( = ?auto_9077 ?auto_9078 ) ) ( CLEAR ?auto_9075 ) ( ON ?auto_9076 ?auto_9077 ) ( CLEAR ?auto_9076 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9078 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9078 ?auto_9077 )
      ( MAKE-3PILE ?auto_9074 ?auto_9075 ?auto_9076 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9079 - BLOCK
      ?auto_9080 - BLOCK
      ?auto_9081 - BLOCK
    )
    :vars
    (
      ?auto_9082 - BLOCK
      ?auto_9083 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9079 ) ( not ( = ?auto_9079 ?auto_9080 ) ) ( not ( = ?auto_9079 ?auto_9081 ) ) ( not ( = ?auto_9079 ?auto_9082 ) ) ( not ( = ?auto_9080 ?auto_9081 ) ) ( not ( = ?auto_9080 ?auto_9082 ) ) ( not ( = ?auto_9081 ?auto_9082 ) ) ( ON ?auto_9082 ?auto_9083 ) ( not ( = ?auto_9079 ?auto_9083 ) ) ( not ( = ?auto_9080 ?auto_9083 ) ) ( not ( = ?auto_9081 ?auto_9083 ) ) ( not ( = ?auto_9082 ?auto_9083 ) ) ( ON ?auto_9081 ?auto_9082 ) ( CLEAR ?auto_9081 ) ( ON-TABLE ?auto_9083 ) ( HOLDING ?auto_9080 ) ( CLEAR ?auto_9079 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9079 ?auto_9080 )
      ( MAKE-3PILE ?auto_9079 ?auto_9080 ?auto_9081 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9084 - BLOCK
      ?auto_9085 - BLOCK
      ?auto_9086 - BLOCK
    )
    :vars
    (
      ?auto_9088 - BLOCK
      ?auto_9087 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9084 ) ( not ( = ?auto_9084 ?auto_9085 ) ) ( not ( = ?auto_9084 ?auto_9086 ) ) ( not ( = ?auto_9084 ?auto_9088 ) ) ( not ( = ?auto_9085 ?auto_9086 ) ) ( not ( = ?auto_9085 ?auto_9088 ) ) ( not ( = ?auto_9086 ?auto_9088 ) ) ( ON ?auto_9088 ?auto_9087 ) ( not ( = ?auto_9084 ?auto_9087 ) ) ( not ( = ?auto_9085 ?auto_9087 ) ) ( not ( = ?auto_9086 ?auto_9087 ) ) ( not ( = ?auto_9088 ?auto_9087 ) ) ( ON ?auto_9086 ?auto_9088 ) ( ON-TABLE ?auto_9087 ) ( CLEAR ?auto_9084 ) ( ON ?auto_9085 ?auto_9086 ) ( CLEAR ?auto_9085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9087 ?auto_9088 ?auto_9086 )
      ( MAKE-3PILE ?auto_9084 ?auto_9085 ?auto_9086 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9089 - BLOCK
      ?auto_9090 - BLOCK
      ?auto_9091 - BLOCK
    )
    :vars
    (
      ?auto_9092 - BLOCK
      ?auto_9093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9089 ?auto_9090 ) ) ( not ( = ?auto_9089 ?auto_9091 ) ) ( not ( = ?auto_9089 ?auto_9092 ) ) ( not ( = ?auto_9090 ?auto_9091 ) ) ( not ( = ?auto_9090 ?auto_9092 ) ) ( not ( = ?auto_9091 ?auto_9092 ) ) ( ON ?auto_9092 ?auto_9093 ) ( not ( = ?auto_9089 ?auto_9093 ) ) ( not ( = ?auto_9090 ?auto_9093 ) ) ( not ( = ?auto_9091 ?auto_9093 ) ) ( not ( = ?auto_9092 ?auto_9093 ) ) ( ON ?auto_9091 ?auto_9092 ) ( ON-TABLE ?auto_9093 ) ( ON ?auto_9090 ?auto_9091 ) ( CLEAR ?auto_9090 ) ( HOLDING ?auto_9089 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9089 )
      ( MAKE-3PILE ?auto_9089 ?auto_9090 ?auto_9091 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9094 - BLOCK
      ?auto_9095 - BLOCK
      ?auto_9096 - BLOCK
    )
    :vars
    (
      ?auto_9098 - BLOCK
      ?auto_9097 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9094 ?auto_9095 ) ) ( not ( = ?auto_9094 ?auto_9096 ) ) ( not ( = ?auto_9094 ?auto_9098 ) ) ( not ( = ?auto_9095 ?auto_9096 ) ) ( not ( = ?auto_9095 ?auto_9098 ) ) ( not ( = ?auto_9096 ?auto_9098 ) ) ( ON ?auto_9098 ?auto_9097 ) ( not ( = ?auto_9094 ?auto_9097 ) ) ( not ( = ?auto_9095 ?auto_9097 ) ) ( not ( = ?auto_9096 ?auto_9097 ) ) ( not ( = ?auto_9098 ?auto_9097 ) ) ( ON ?auto_9096 ?auto_9098 ) ( ON-TABLE ?auto_9097 ) ( ON ?auto_9095 ?auto_9096 ) ( ON ?auto_9094 ?auto_9095 ) ( CLEAR ?auto_9094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9097 ?auto_9098 ?auto_9096 ?auto_9095 )
      ( MAKE-3PILE ?auto_9094 ?auto_9095 ?auto_9096 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9100 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9100 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_9100 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9101 - BLOCK
    )
    :vars
    (
      ?auto_9102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9101 ?auto_9102 ) ( CLEAR ?auto_9101 ) ( HAND-EMPTY ) ( not ( = ?auto_9101 ?auto_9102 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9101 ?auto_9102 )
      ( MAKE-1PILE ?auto_9101 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9103 - BLOCK
    )
    :vars
    (
      ?auto_9104 - BLOCK
      ?auto_9106 - BLOCK
      ?auto_9105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9103 ?auto_9104 ) ) ( HOLDING ?auto_9103 ) ( CLEAR ?auto_9104 ) ( ON-TABLE ?auto_9106 ) ( ON ?auto_9105 ?auto_9106 ) ( ON ?auto_9104 ?auto_9105 ) ( not ( = ?auto_9106 ?auto_9105 ) ) ( not ( = ?auto_9106 ?auto_9104 ) ) ( not ( = ?auto_9106 ?auto_9103 ) ) ( not ( = ?auto_9105 ?auto_9104 ) ) ( not ( = ?auto_9105 ?auto_9103 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9106 ?auto_9105 ?auto_9104 ?auto_9103 )
      ( MAKE-1PILE ?auto_9103 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9107 - BLOCK
    )
    :vars
    (
      ?auto_9110 - BLOCK
      ?auto_9109 - BLOCK
      ?auto_9108 - BLOCK
      ?auto_9111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9107 ?auto_9110 ) ) ( CLEAR ?auto_9110 ) ( ON-TABLE ?auto_9109 ) ( ON ?auto_9108 ?auto_9109 ) ( ON ?auto_9110 ?auto_9108 ) ( not ( = ?auto_9109 ?auto_9108 ) ) ( not ( = ?auto_9109 ?auto_9110 ) ) ( not ( = ?auto_9109 ?auto_9107 ) ) ( not ( = ?auto_9108 ?auto_9110 ) ) ( not ( = ?auto_9108 ?auto_9107 ) ) ( ON ?auto_9107 ?auto_9111 ) ( CLEAR ?auto_9107 ) ( HAND-EMPTY ) ( not ( = ?auto_9107 ?auto_9111 ) ) ( not ( = ?auto_9110 ?auto_9111 ) ) ( not ( = ?auto_9109 ?auto_9111 ) ) ( not ( = ?auto_9108 ?auto_9111 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9107 ?auto_9111 )
      ( MAKE-1PILE ?auto_9107 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9112 - BLOCK
    )
    :vars
    (
      ?auto_9114 - BLOCK
      ?auto_9115 - BLOCK
      ?auto_9113 - BLOCK
      ?auto_9116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9112 ?auto_9114 ) ) ( ON-TABLE ?auto_9115 ) ( ON ?auto_9113 ?auto_9115 ) ( not ( = ?auto_9115 ?auto_9113 ) ) ( not ( = ?auto_9115 ?auto_9114 ) ) ( not ( = ?auto_9115 ?auto_9112 ) ) ( not ( = ?auto_9113 ?auto_9114 ) ) ( not ( = ?auto_9113 ?auto_9112 ) ) ( ON ?auto_9112 ?auto_9116 ) ( CLEAR ?auto_9112 ) ( not ( = ?auto_9112 ?auto_9116 ) ) ( not ( = ?auto_9114 ?auto_9116 ) ) ( not ( = ?auto_9115 ?auto_9116 ) ) ( not ( = ?auto_9113 ?auto_9116 ) ) ( HOLDING ?auto_9114 ) ( CLEAR ?auto_9113 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9115 ?auto_9113 ?auto_9114 )
      ( MAKE-1PILE ?auto_9112 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9117 - BLOCK
    )
    :vars
    (
      ?auto_9118 - BLOCK
      ?auto_9119 - BLOCK
      ?auto_9120 - BLOCK
      ?auto_9121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9117 ?auto_9118 ) ) ( ON-TABLE ?auto_9119 ) ( ON ?auto_9120 ?auto_9119 ) ( not ( = ?auto_9119 ?auto_9120 ) ) ( not ( = ?auto_9119 ?auto_9118 ) ) ( not ( = ?auto_9119 ?auto_9117 ) ) ( not ( = ?auto_9120 ?auto_9118 ) ) ( not ( = ?auto_9120 ?auto_9117 ) ) ( ON ?auto_9117 ?auto_9121 ) ( not ( = ?auto_9117 ?auto_9121 ) ) ( not ( = ?auto_9118 ?auto_9121 ) ) ( not ( = ?auto_9119 ?auto_9121 ) ) ( not ( = ?auto_9120 ?auto_9121 ) ) ( CLEAR ?auto_9120 ) ( ON ?auto_9118 ?auto_9117 ) ( CLEAR ?auto_9118 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9121 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9121 ?auto_9117 )
      ( MAKE-1PILE ?auto_9117 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9122 - BLOCK
    )
    :vars
    (
      ?auto_9125 - BLOCK
      ?auto_9123 - BLOCK
      ?auto_9126 - BLOCK
      ?auto_9124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9122 ?auto_9125 ) ) ( ON-TABLE ?auto_9123 ) ( not ( = ?auto_9123 ?auto_9126 ) ) ( not ( = ?auto_9123 ?auto_9125 ) ) ( not ( = ?auto_9123 ?auto_9122 ) ) ( not ( = ?auto_9126 ?auto_9125 ) ) ( not ( = ?auto_9126 ?auto_9122 ) ) ( ON ?auto_9122 ?auto_9124 ) ( not ( = ?auto_9122 ?auto_9124 ) ) ( not ( = ?auto_9125 ?auto_9124 ) ) ( not ( = ?auto_9123 ?auto_9124 ) ) ( not ( = ?auto_9126 ?auto_9124 ) ) ( ON ?auto_9125 ?auto_9122 ) ( CLEAR ?auto_9125 ) ( ON-TABLE ?auto_9124 ) ( HOLDING ?auto_9126 ) ( CLEAR ?auto_9123 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9123 ?auto_9126 )
      ( MAKE-1PILE ?auto_9122 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9127 - BLOCK
    )
    :vars
    (
      ?auto_9129 - BLOCK
      ?auto_9131 - BLOCK
      ?auto_9130 - BLOCK
      ?auto_9128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9127 ?auto_9129 ) ) ( ON-TABLE ?auto_9131 ) ( not ( = ?auto_9131 ?auto_9130 ) ) ( not ( = ?auto_9131 ?auto_9129 ) ) ( not ( = ?auto_9131 ?auto_9127 ) ) ( not ( = ?auto_9130 ?auto_9129 ) ) ( not ( = ?auto_9130 ?auto_9127 ) ) ( ON ?auto_9127 ?auto_9128 ) ( not ( = ?auto_9127 ?auto_9128 ) ) ( not ( = ?auto_9129 ?auto_9128 ) ) ( not ( = ?auto_9131 ?auto_9128 ) ) ( not ( = ?auto_9130 ?auto_9128 ) ) ( ON ?auto_9129 ?auto_9127 ) ( ON-TABLE ?auto_9128 ) ( CLEAR ?auto_9131 ) ( ON ?auto_9130 ?auto_9129 ) ( CLEAR ?auto_9130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9128 ?auto_9127 ?auto_9129 )
      ( MAKE-1PILE ?auto_9127 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9132 - BLOCK
    )
    :vars
    (
      ?auto_9136 - BLOCK
      ?auto_9133 - BLOCK
      ?auto_9134 - BLOCK
      ?auto_9135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9132 ?auto_9136 ) ) ( not ( = ?auto_9133 ?auto_9134 ) ) ( not ( = ?auto_9133 ?auto_9136 ) ) ( not ( = ?auto_9133 ?auto_9132 ) ) ( not ( = ?auto_9134 ?auto_9136 ) ) ( not ( = ?auto_9134 ?auto_9132 ) ) ( ON ?auto_9132 ?auto_9135 ) ( not ( = ?auto_9132 ?auto_9135 ) ) ( not ( = ?auto_9136 ?auto_9135 ) ) ( not ( = ?auto_9133 ?auto_9135 ) ) ( not ( = ?auto_9134 ?auto_9135 ) ) ( ON ?auto_9136 ?auto_9132 ) ( ON-TABLE ?auto_9135 ) ( ON ?auto_9134 ?auto_9136 ) ( CLEAR ?auto_9134 ) ( HOLDING ?auto_9133 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9133 )
      ( MAKE-1PILE ?auto_9132 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9137 - BLOCK
    )
    :vars
    (
      ?auto_9140 - BLOCK
      ?auto_9141 - BLOCK
      ?auto_9139 - BLOCK
      ?auto_9138 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9137 ?auto_9140 ) ) ( not ( = ?auto_9141 ?auto_9139 ) ) ( not ( = ?auto_9141 ?auto_9140 ) ) ( not ( = ?auto_9141 ?auto_9137 ) ) ( not ( = ?auto_9139 ?auto_9140 ) ) ( not ( = ?auto_9139 ?auto_9137 ) ) ( ON ?auto_9137 ?auto_9138 ) ( not ( = ?auto_9137 ?auto_9138 ) ) ( not ( = ?auto_9140 ?auto_9138 ) ) ( not ( = ?auto_9141 ?auto_9138 ) ) ( not ( = ?auto_9139 ?auto_9138 ) ) ( ON ?auto_9140 ?auto_9137 ) ( ON-TABLE ?auto_9138 ) ( ON ?auto_9139 ?auto_9140 ) ( ON ?auto_9141 ?auto_9139 ) ( CLEAR ?auto_9141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9138 ?auto_9137 ?auto_9140 ?auto_9139 )
      ( MAKE-1PILE ?auto_9137 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9144 - BLOCK
      ?auto_9145 - BLOCK
    )
    :vars
    (
      ?auto_9146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9146 ?auto_9145 ) ( CLEAR ?auto_9146 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9144 ) ( ON ?auto_9145 ?auto_9144 ) ( not ( = ?auto_9144 ?auto_9145 ) ) ( not ( = ?auto_9144 ?auto_9146 ) ) ( not ( = ?auto_9145 ?auto_9146 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9146 ?auto_9145 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9147 - BLOCK
      ?auto_9148 - BLOCK
    )
    :vars
    (
      ?auto_9149 - BLOCK
      ?auto_9150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9149 ?auto_9148 ) ( CLEAR ?auto_9149 ) ( ON-TABLE ?auto_9147 ) ( ON ?auto_9148 ?auto_9147 ) ( not ( = ?auto_9147 ?auto_9148 ) ) ( not ( = ?auto_9147 ?auto_9149 ) ) ( not ( = ?auto_9148 ?auto_9149 ) ) ( HOLDING ?auto_9150 ) ( not ( = ?auto_9147 ?auto_9150 ) ) ( not ( = ?auto_9148 ?auto_9150 ) ) ( not ( = ?auto_9149 ?auto_9150 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_9150 )
      ( MAKE-2PILE ?auto_9147 ?auto_9148 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9151 - BLOCK
      ?auto_9152 - BLOCK
    )
    :vars
    (
      ?auto_9154 - BLOCK
      ?auto_9153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9154 ?auto_9152 ) ( ON-TABLE ?auto_9151 ) ( ON ?auto_9152 ?auto_9151 ) ( not ( = ?auto_9151 ?auto_9152 ) ) ( not ( = ?auto_9151 ?auto_9154 ) ) ( not ( = ?auto_9152 ?auto_9154 ) ) ( not ( = ?auto_9151 ?auto_9153 ) ) ( not ( = ?auto_9152 ?auto_9153 ) ) ( not ( = ?auto_9154 ?auto_9153 ) ) ( ON ?auto_9153 ?auto_9154 ) ( CLEAR ?auto_9153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9151 ?auto_9152 ?auto_9154 )
      ( MAKE-2PILE ?auto_9151 ?auto_9152 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9155 - BLOCK
      ?auto_9156 - BLOCK
    )
    :vars
    (
      ?auto_9157 - BLOCK
      ?auto_9158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9157 ?auto_9156 ) ( ON-TABLE ?auto_9155 ) ( ON ?auto_9156 ?auto_9155 ) ( not ( = ?auto_9155 ?auto_9156 ) ) ( not ( = ?auto_9155 ?auto_9157 ) ) ( not ( = ?auto_9156 ?auto_9157 ) ) ( not ( = ?auto_9155 ?auto_9158 ) ) ( not ( = ?auto_9156 ?auto_9158 ) ) ( not ( = ?auto_9157 ?auto_9158 ) ) ( HOLDING ?auto_9158 ) ( CLEAR ?auto_9157 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9155 ?auto_9156 ?auto_9157 ?auto_9158 )
      ( MAKE-2PILE ?auto_9155 ?auto_9156 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9159 - BLOCK
      ?auto_9160 - BLOCK
    )
    :vars
    (
      ?auto_9162 - BLOCK
      ?auto_9161 - BLOCK
      ?auto_9163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9162 ?auto_9160 ) ( ON-TABLE ?auto_9159 ) ( ON ?auto_9160 ?auto_9159 ) ( not ( = ?auto_9159 ?auto_9160 ) ) ( not ( = ?auto_9159 ?auto_9162 ) ) ( not ( = ?auto_9160 ?auto_9162 ) ) ( not ( = ?auto_9159 ?auto_9161 ) ) ( not ( = ?auto_9160 ?auto_9161 ) ) ( not ( = ?auto_9162 ?auto_9161 ) ) ( CLEAR ?auto_9162 ) ( ON ?auto_9161 ?auto_9163 ) ( CLEAR ?auto_9161 ) ( HAND-EMPTY ) ( not ( = ?auto_9159 ?auto_9163 ) ) ( not ( = ?auto_9160 ?auto_9163 ) ) ( not ( = ?auto_9162 ?auto_9163 ) ) ( not ( = ?auto_9161 ?auto_9163 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9161 ?auto_9163 )
      ( MAKE-2PILE ?auto_9159 ?auto_9160 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9174 - BLOCK
      ?auto_9175 - BLOCK
    )
    :vars
    (
      ?auto_9177 - BLOCK
      ?auto_9176 - BLOCK
      ?auto_9178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9174 ) ( not ( = ?auto_9174 ?auto_9175 ) ) ( not ( = ?auto_9174 ?auto_9177 ) ) ( not ( = ?auto_9175 ?auto_9177 ) ) ( not ( = ?auto_9174 ?auto_9176 ) ) ( not ( = ?auto_9175 ?auto_9176 ) ) ( not ( = ?auto_9177 ?auto_9176 ) ) ( ON ?auto_9176 ?auto_9178 ) ( not ( = ?auto_9174 ?auto_9178 ) ) ( not ( = ?auto_9175 ?auto_9178 ) ) ( not ( = ?auto_9177 ?auto_9178 ) ) ( not ( = ?auto_9176 ?auto_9178 ) ) ( ON ?auto_9177 ?auto_9176 ) ( CLEAR ?auto_9177 ) ( HOLDING ?auto_9175 ) ( CLEAR ?auto_9174 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9174 ?auto_9175 ?auto_9177 )
      ( MAKE-2PILE ?auto_9174 ?auto_9175 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9179 - BLOCK
      ?auto_9180 - BLOCK
    )
    :vars
    (
      ?auto_9182 - BLOCK
      ?auto_9183 - BLOCK
      ?auto_9181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9179 ) ( not ( = ?auto_9179 ?auto_9180 ) ) ( not ( = ?auto_9179 ?auto_9182 ) ) ( not ( = ?auto_9180 ?auto_9182 ) ) ( not ( = ?auto_9179 ?auto_9183 ) ) ( not ( = ?auto_9180 ?auto_9183 ) ) ( not ( = ?auto_9182 ?auto_9183 ) ) ( ON ?auto_9183 ?auto_9181 ) ( not ( = ?auto_9179 ?auto_9181 ) ) ( not ( = ?auto_9180 ?auto_9181 ) ) ( not ( = ?auto_9182 ?auto_9181 ) ) ( not ( = ?auto_9183 ?auto_9181 ) ) ( ON ?auto_9182 ?auto_9183 ) ( CLEAR ?auto_9179 ) ( ON ?auto_9180 ?auto_9182 ) ( CLEAR ?auto_9180 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9181 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9181 ?auto_9183 ?auto_9182 )
      ( MAKE-2PILE ?auto_9179 ?auto_9180 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9184 - BLOCK
      ?auto_9185 - BLOCK
    )
    :vars
    (
      ?auto_9187 - BLOCK
      ?auto_9186 - BLOCK
      ?auto_9188 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9184 ?auto_9185 ) ) ( not ( = ?auto_9184 ?auto_9187 ) ) ( not ( = ?auto_9185 ?auto_9187 ) ) ( not ( = ?auto_9184 ?auto_9186 ) ) ( not ( = ?auto_9185 ?auto_9186 ) ) ( not ( = ?auto_9187 ?auto_9186 ) ) ( ON ?auto_9186 ?auto_9188 ) ( not ( = ?auto_9184 ?auto_9188 ) ) ( not ( = ?auto_9185 ?auto_9188 ) ) ( not ( = ?auto_9187 ?auto_9188 ) ) ( not ( = ?auto_9186 ?auto_9188 ) ) ( ON ?auto_9187 ?auto_9186 ) ( ON ?auto_9185 ?auto_9187 ) ( CLEAR ?auto_9185 ) ( ON-TABLE ?auto_9188 ) ( HOLDING ?auto_9184 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9184 )
      ( MAKE-2PILE ?auto_9184 ?auto_9185 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9189 - BLOCK
      ?auto_9190 - BLOCK
    )
    :vars
    (
      ?auto_9191 - BLOCK
      ?auto_9192 - BLOCK
      ?auto_9193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9189 ?auto_9190 ) ) ( not ( = ?auto_9189 ?auto_9191 ) ) ( not ( = ?auto_9190 ?auto_9191 ) ) ( not ( = ?auto_9189 ?auto_9192 ) ) ( not ( = ?auto_9190 ?auto_9192 ) ) ( not ( = ?auto_9191 ?auto_9192 ) ) ( ON ?auto_9192 ?auto_9193 ) ( not ( = ?auto_9189 ?auto_9193 ) ) ( not ( = ?auto_9190 ?auto_9193 ) ) ( not ( = ?auto_9191 ?auto_9193 ) ) ( not ( = ?auto_9192 ?auto_9193 ) ) ( ON ?auto_9191 ?auto_9192 ) ( ON ?auto_9190 ?auto_9191 ) ( ON-TABLE ?auto_9193 ) ( ON ?auto_9189 ?auto_9190 ) ( CLEAR ?auto_9189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9193 ?auto_9192 ?auto_9191 ?auto_9190 )
      ( MAKE-2PILE ?auto_9189 ?auto_9190 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9196 - BLOCK
      ?auto_9197 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9197 ) ( CLEAR ?auto_9196 ) ( ON-TABLE ?auto_9196 ) ( not ( = ?auto_9196 ?auto_9197 ) ) )
    :subtasks
    ( ( !STACK ?auto_9197 ?auto_9196 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9198 - BLOCK
      ?auto_9199 - BLOCK
    )
    :vars
    (
      ?auto_9200 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9198 ) ( ON-TABLE ?auto_9198 ) ( not ( = ?auto_9198 ?auto_9199 ) ) ( ON ?auto_9199 ?auto_9200 ) ( CLEAR ?auto_9199 ) ( HAND-EMPTY ) ( not ( = ?auto_9198 ?auto_9200 ) ) ( not ( = ?auto_9199 ?auto_9200 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9199 ?auto_9200 )
      ( MAKE-2PILE ?auto_9198 ?auto_9199 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9201 - BLOCK
      ?auto_9202 - BLOCK
    )
    :vars
    (
      ?auto_9203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9201 ?auto_9202 ) ) ( ON ?auto_9202 ?auto_9203 ) ( CLEAR ?auto_9202 ) ( not ( = ?auto_9201 ?auto_9203 ) ) ( not ( = ?auto_9202 ?auto_9203 ) ) ( HOLDING ?auto_9201 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9201 )
      ( MAKE-2PILE ?auto_9201 ?auto_9202 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9204 - BLOCK
      ?auto_9205 - BLOCK
    )
    :vars
    (
      ?auto_9206 - BLOCK
      ?auto_9207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9204 ?auto_9205 ) ) ( ON ?auto_9205 ?auto_9206 ) ( not ( = ?auto_9204 ?auto_9206 ) ) ( not ( = ?auto_9205 ?auto_9206 ) ) ( ON ?auto_9204 ?auto_9205 ) ( CLEAR ?auto_9204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9207 ) ( ON ?auto_9206 ?auto_9207 ) ( not ( = ?auto_9207 ?auto_9206 ) ) ( not ( = ?auto_9207 ?auto_9205 ) ) ( not ( = ?auto_9207 ?auto_9204 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9207 ?auto_9206 ?auto_9205 )
      ( MAKE-2PILE ?auto_9204 ?auto_9205 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9208 - BLOCK
      ?auto_9209 - BLOCK
    )
    :vars
    (
      ?auto_9210 - BLOCK
      ?auto_9211 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9208 ?auto_9209 ) ) ( ON ?auto_9209 ?auto_9210 ) ( not ( = ?auto_9208 ?auto_9210 ) ) ( not ( = ?auto_9209 ?auto_9210 ) ) ( ON-TABLE ?auto_9211 ) ( ON ?auto_9210 ?auto_9211 ) ( not ( = ?auto_9211 ?auto_9210 ) ) ( not ( = ?auto_9211 ?auto_9209 ) ) ( not ( = ?auto_9211 ?auto_9208 ) ) ( HOLDING ?auto_9208 ) ( CLEAR ?auto_9209 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9211 ?auto_9210 ?auto_9209 ?auto_9208 )
      ( MAKE-2PILE ?auto_9208 ?auto_9209 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9212 - BLOCK
      ?auto_9213 - BLOCK
    )
    :vars
    (
      ?auto_9214 - BLOCK
      ?auto_9215 - BLOCK
      ?auto_9216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9212 ?auto_9213 ) ) ( ON ?auto_9213 ?auto_9214 ) ( not ( = ?auto_9212 ?auto_9214 ) ) ( not ( = ?auto_9213 ?auto_9214 ) ) ( ON-TABLE ?auto_9215 ) ( ON ?auto_9214 ?auto_9215 ) ( not ( = ?auto_9215 ?auto_9214 ) ) ( not ( = ?auto_9215 ?auto_9213 ) ) ( not ( = ?auto_9215 ?auto_9212 ) ) ( CLEAR ?auto_9213 ) ( ON ?auto_9212 ?auto_9216 ) ( CLEAR ?auto_9212 ) ( HAND-EMPTY ) ( not ( = ?auto_9212 ?auto_9216 ) ) ( not ( = ?auto_9213 ?auto_9216 ) ) ( not ( = ?auto_9214 ?auto_9216 ) ) ( not ( = ?auto_9215 ?auto_9216 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9212 ?auto_9216 )
      ( MAKE-2PILE ?auto_9212 ?auto_9213 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9217 - BLOCK
      ?auto_9218 - BLOCK
    )
    :vars
    (
      ?auto_9220 - BLOCK
      ?auto_9219 - BLOCK
      ?auto_9221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9217 ?auto_9218 ) ) ( not ( = ?auto_9217 ?auto_9220 ) ) ( not ( = ?auto_9218 ?auto_9220 ) ) ( ON-TABLE ?auto_9219 ) ( ON ?auto_9220 ?auto_9219 ) ( not ( = ?auto_9219 ?auto_9220 ) ) ( not ( = ?auto_9219 ?auto_9218 ) ) ( not ( = ?auto_9219 ?auto_9217 ) ) ( ON ?auto_9217 ?auto_9221 ) ( CLEAR ?auto_9217 ) ( not ( = ?auto_9217 ?auto_9221 ) ) ( not ( = ?auto_9218 ?auto_9221 ) ) ( not ( = ?auto_9220 ?auto_9221 ) ) ( not ( = ?auto_9219 ?auto_9221 ) ) ( HOLDING ?auto_9218 ) ( CLEAR ?auto_9220 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9219 ?auto_9220 ?auto_9218 )
      ( MAKE-2PILE ?auto_9217 ?auto_9218 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9222 - BLOCK
      ?auto_9223 - BLOCK
    )
    :vars
    (
      ?auto_9225 - BLOCK
      ?auto_9224 - BLOCK
      ?auto_9226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9222 ?auto_9223 ) ) ( not ( = ?auto_9222 ?auto_9225 ) ) ( not ( = ?auto_9223 ?auto_9225 ) ) ( ON-TABLE ?auto_9224 ) ( ON ?auto_9225 ?auto_9224 ) ( not ( = ?auto_9224 ?auto_9225 ) ) ( not ( = ?auto_9224 ?auto_9223 ) ) ( not ( = ?auto_9224 ?auto_9222 ) ) ( ON ?auto_9222 ?auto_9226 ) ( not ( = ?auto_9222 ?auto_9226 ) ) ( not ( = ?auto_9223 ?auto_9226 ) ) ( not ( = ?auto_9225 ?auto_9226 ) ) ( not ( = ?auto_9224 ?auto_9226 ) ) ( CLEAR ?auto_9225 ) ( ON ?auto_9223 ?auto_9222 ) ( CLEAR ?auto_9223 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9226 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9226 ?auto_9222 )
      ( MAKE-2PILE ?auto_9222 ?auto_9223 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9227 - BLOCK
      ?auto_9228 - BLOCK
    )
    :vars
    (
      ?auto_9231 - BLOCK
      ?auto_9229 - BLOCK
      ?auto_9230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9227 ?auto_9228 ) ) ( not ( = ?auto_9227 ?auto_9231 ) ) ( not ( = ?auto_9228 ?auto_9231 ) ) ( ON-TABLE ?auto_9229 ) ( not ( = ?auto_9229 ?auto_9231 ) ) ( not ( = ?auto_9229 ?auto_9228 ) ) ( not ( = ?auto_9229 ?auto_9227 ) ) ( ON ?auto_9227 ?auto_9230 ) ( not ( = ?auto_9227 ?auto_9230 ) ) ( not ( = ?auto_9228 ?auto_9230 ) ) ( not ( = ?auto_9231 ?auto_9230 ) ) ( not ( = ?auto_9229 ?auto_9230 ) ) ( ON ?auto_9228 ?auto_9227 ) ( CLEAR ?auto_9228 ) ( ON-TABLE ?auto_9230 ) ( HOLDING ?auto_9231 ) ( CLEAR ?auto_9229 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9229 ?auto_9231 )
      ( MAKE-2PILE ?auto_9227 ?auto_9228 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9232 - BLOCK
      ?auto_9233 - BLOCK
    )
    :vars
    (
      ?auto_9234 - BLOCK
      ?auto_9236 - BLOCK
      ?auto_9235 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9232 ?auto_9233 ) ) ( not ( = ?auto_9232 ?auto_9234 ) ) ( not ( = ?auto_9233 ?auto_9234 ) ) ( ON-TABLE ?auto_9236 ) ( not ( = ?auto_9236 ?auto_9234 ) ) ( not ( = ?auto_9236 ?auto_9233 ) ) ( not ( = ?auto_9236 ?auto_9232 ) ) ( ON ?auto_9232 ?auto_9235 ) ( not ( = ?auto_9232 ?auto_9235 ) ) ( not ( = ?auto_9233 ?auto_9235 ) ) ( not ( = ?auto_9234 ?auto_9235 ) ) ( not ( = ?auto_9236 ?auto_9235 ) ) ( ON ?auto_9233 ?auto_9232 ) ( ON-TABLE ?auto_9235 ) ( CLEAR ?auto_9236 ) ( ON ?auto_9234 ?auto_9233 ) ( CLEAR ?auto_9234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9235 ?auto_9232 ?auto_9233 )
      ( MAKE-2PILE ?auto_9232 ?auto_9233 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9237 - BLOCK
      ?auto_9238 - BLOCK
    )
    :vars
    (
      ?auto_9240 - BLOCK
      ?auto_9239 - BLOCK
      ?auto_9241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9237 ?auto_9238 ) ) ( not ( = ?auto_9237 ?auto_9240 ) ) ( not ( = ?auto_9238 ?auto_9240 ) ) ( not ( = ?auto_9239 ?auto_9240 ) ) ( not ( = ?auto_9239 ?auto_9238 ) ) ( not ( = ?auto_9239 ?auto_9237 ) ) ( ON ?auto_9237 ?auto_9241 ) ( not ( = ?auto_9237 ?auto_9241 ) ) ( not ( = ?auto_9238 ?auto_9241 ) ) ( not ( = ?auto_9240 ?auto_9241 ) ) ( not ( = ?auto_9239 ?auto_9241 ) ) ( ON ?auto_9238 ?auto_9237 ) ( ON-TABLE ?auto_9241 ) ( ON ?auto_9240 ?auto_9238 ) ( CLEAR ?auto_9240 ) ( HOLDING ?auto_9239 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9239 )
      ( MAKE-2PILE ?auto_9237 ?auto_9238 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9242 - BLOCK
      ?auto_9243 - BLOCK
    )
    :vars
    (
      ?auto_9244 - BLOCK
      ?auto_9246 - BLOCK
      ?auto_9245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9242 ?auto_9243 ) ) ( not ( = ?auto_9242 ?auto_9244 ) ) ( not ( = ?auto_9243 ?auto_9244 ) ) ( not ( = ?auto_9246 ?auto_9244 ) ) ( not ( = ?auto_9246 ?auto_9243 ) ) ( not ( = ?auto_9246 ?auto_9242 ) ) ( ON ?auto_9242 ?auto_9245 ) ( not ( = ?auto_9242 ?auto_9245 ) ) ( not ( = ?auto_9243 ?auto_9245 ) ) ( not ( = ?auto_9244 ?auto_9245 ) ) ( not ( = ?auto_9246 ?auto_9245 ) ) ( ON ?auto_9243 ?auto_9242 ) ( ON-TABLE ?auto_9245 ) ( ON ?auto_9244 ?auto_9243 ) ( ON ?auto_9246 ?auto_9244 ) ( CLEAR ?auto_9246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9245 ?auto_9242 ?auto_9243 ?auto_9244 )
      ( MAKE-2PILE ?auto_9242 ?auto_9243 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9248 - BLOCK
    )
    :vars
    (
      ?auto_9249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9249 ?auto_9248 ) ( CLEAR ?auto_9249 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9248 ) ( not ( = ?auto_9248 ?auto_9249 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9249 ?auto_9248 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9250 - BLOCK
    )
    :vars
    (
      ?auto_9251 - BLOCK
      ?auto_9252 - BLOCK
      ?auto_9253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9251 ?auto_9250 ) ( CLEAR ?auto_9251 ) ( ON-TABLE ?auto_9250 ) ( not ( = ?auto_9250 ?auto_9251 ) ) ( HOLDING ?auto_9252 ) ( CLEAR ?auto_9253 ) ( not ( = ?auto_9250 ?auto_9252 ) ) ( not ( = ?auto_9250 ?auto_9253 ) ) ( not ( = ?auto_9251 ?auto_9252 ) ) ( not ( = ?auto_9251 ?auto_9253 ) ) ( not ( = ?auto_9252 ?auto_9253 ) ) )
    :subtasks
    ( ( !STACK ?auto_9252 ?auto_9253 )
      ( MAKE-1PILE ?auto_9250 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9254 - BLOCK
    )
    :vars
    (
      ?auto_9255 - BLOCK
      ?auto_9257 - BLOCK
      ?auto_9256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9255 ?auto_9254 ) ( ON-TABLE ?auto_9254 ) ( not ( = ?auto_9254 ?auto_9255 ) ) ( CLEAR ?auto_9257 ) ( not ( = ?auto_9254 ?auto_9256 ) ) ( not ( = ?auto_9254 ?auto_9257 ) ) ( not ( = ?auto_9255 ?auto_9256 ) ) ( not ( = ?auto_9255 ?auto_9257 ) ) ( not ( = ?auto_9256 ?auto_9257 ) ) ( ON ?auto_9256 ?auto_9255 ) ( CLEAR ?auto_9256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9254 ?auto_9255 )
      ( MAKE-1PILE ?auto_9254 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9258 - BLOCK
    )
    :vars
    (
      ?auto_9260 - BLOCK
      ?auto_9259 - BLOCK
      ?auto_9261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9260 ?auto_9258 ) ( ON-TABLE ?auto_9258 ) ( not ( = ?auto_9258 ?auto_9260 ) ) ( not ( = ?auto_9258 ?auto_9259 ) ) ( not ( = ?auto_9258 ?auto_9261 ) ) ( not ( = ?auto_9260 ?auto_9259 ) ) ( not ( = ?auto_9260 ?auto_9261 ) ) ( not ( = ?auto_9259 ?auto_9261 ) ) ( ON ?auto_9259 ?auto_9260 ) ( CLEAR ?auto_9259 ) ( HOLDING ?auto_9261 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9261 )
      ( MAKE-1PILE ?auto_9258 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9262 - BLOCK
    )
    :vars
    (
      ?auto_9265 - BLOCK
      ?auto_9264 - BLOCK
      ?auto_9263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9265 ?auto_9262 ) ( ON-TABLE ?auto_9262 ) ( not ( = ?auto_9262 ?auto_9265 ) ) ( not ( = ?auto_9262 ?auto_9264 ) ) ( not ( = ?auto_9262 ?auto_9263 ) ) ( not ( = ?auto_9265 ?auto_9264 ) ) ( not ( = ?auto_9265 ?auto_9263 ) ) ( not ( = ?auto_9264 ?auto_9263 ) ) ( ON ?auto_9264 ?auto_9265 ) ( ON ?auto_9263 ?auto_9264 ) ( CLEAR ?auto_9263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9262 ?auto_9265 ?auto_9264 )
      ( MAKE-1PILE ?auto_9262 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9266 - BLOCK
    )
    :vars
    (
      ?auto_9268 - BLOCK
      ?auto_9267 - BLOCK
      ?auto_9269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9268 ?auto_9266 ) ( ON-TABLE ?auto_9266 ) ( not ( = ?auto_9266 ?auto_9268 ) ) ( not ( = ?auto_9266 ?auto_9267 ) ) ( not ( = ?auto_9266 ?auto_9269 ) ) ( not ( = ?auto_9268 ?auto_9267 ) ) ( not ( = ?auto_9268 ?auto_9269 ) ) ( not ( = ?auto_9267 ?auto_9269 ) ) ( ON ?auto_9267 ?auto_9268 ) ( HOLDING ?auto_9269 ) ( CLEAR ?auto_9267 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9266 ?auto_9268 ?auto_9267 ?auto_9269 )
      ( MAKE-1PILE ?auto_9266 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9270 - BLOCK
    )
    :vars
    (
      ?auto_9273 - BLOCK
      ?auto_9271 - BLOCK
      ?auto_9272 - BLOCK
      ?auto_9274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9273 ?auto_9270 ) ( ON-TABLE ?auto_9270 ) ( not ( = ?auto_9270 ?auto_9273 ) ) ( not ( = ?auto_9270 ?auto_9271 ) ) ( not ( = ?auto_9270 ?auto_9272 ) ) ( not ( = ?auto_9273 ?auto_9271 ) ) ( not ( = ?auto_9273 ?auto_9272 ) ) ( not ( = ?auto_9271 ?auto_9272 ) ) ( ON ?auto_9271 ?auto_9273 ) ( CLEAR ?auto_9271 ) ( ON ?auto_9272 ?auto_9274 ) ( CLEAR ?auto_9272 ) ( HAND-EMPTY ) ( not ( = ?auto_9270 ?auto_9274 ) ) ( not ( = ?auto_9273 ?auto_9274 ) ) ( not ( = ?auto_9271 ?auto_9274 ) ) ( not ( = ?auto_9272 ?auto_9274 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9272 ?auto_9274 )
      ( MAKE-1PILE ?auto_9270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9275 - BLOCK
    )
    :vars
    (
      ?auto_9278 - BLOCK
      ?auto_9277 - BLOCK
      ?auto_9276 - BLOCK
      ?auto_9279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9278 ?auto_9275 ) ( ON-TABLE ?auto_9275 ) ( not ( = ?auto_9275 ?auto_9278 ) ) ( not ( = ?auto_9275 ?auto_9277 ) ) ( not ( = ?auto_9275 ?auto_9276 ) ) ( not ( = ?auto_9278 ?auto_9277 ) ) ( not ( = ?auto_9278 ?auto_9276 ) ) ( not ( = ?auto_9277 ?auto_9276 ) ) ( ON ?auto_9276 ?auto_9279 ) ( CLEAR ?auto_9276 ) ( not ( = ?auto_9275 ?auto_9279 ) ) ( not ( = ?auto_9278 ?auto_9279 ) ) ( not ( = ?auto_9277 ?auto_9279 ) ) ( not ( = ?auto_9276 ?auto_9279 ) ) ( HOLDING ?auto_9277 ) ( CLEAR ?auto_9278 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9275 ?auto_9278 ?auto_9277 )
      ( MAKE-1PILE ?auto_9275 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9280 - BLOCK
    )
    :vars
    (
      ?auto_9281 - BLOCK
      ?auto_9283 - BLOCK
      ?auto_9284 - BLOCK
      ?auto_9282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9281 ?auto_9280 ) ( ON-TABLE ?auto_9280 ) ( not ( = ?auto_9280 ?auto_9281 ) ) ( not ( = ?auto_9280 ?auto_9283 ) ) ( not ( = ?auto_9280 ?auto_9284 ) ) ( not ( = ?auto_9281 ?auto_9283 ) ) ( not ( = ?auto_9281 ?auto_9284 ) ) ( not ( = ?auto_9283 ?auto_9284 ) ) ( ON ?auto_9284 ?auto_9282 ) ( not ( = ?auto_9280 ?auto_9282 ) ) ( not ( = ?auto_9281 ?auto_9282 ) ) ( not ( = ?auto_9283 ?auto_9282 ) ) ( not ( = ?auto_9284 ?auto_9282 ) ) ( CLEAR ?auto_9281 ) ( ON ?auto_9283 ?auto_9284 ) ( CLEAR ?auto_9283 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9282 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9282 ?auto_9284 )
      ( MAKE-1PILE ?auto_9280 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9295 - BLOCK
    )
    :vars
    (
      ?auto_9299 - BLOCK
      ?auto_9296 - BLOCK
      ?auto_9298 - BLOCK
      ?auto_9297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9295 ?auto_9299 ) ) ( not ( = ?auto_9295 ?auto_9296 ) ) ( not ( = ?auto_9295 ?auto_9298 ) ) ( not ( = ?auto_9299 ?auto_9296 ) ) ( not ( = ?auto_9299 ?auto_9298 ) ) ( not ( = ?auto_9296 ?auto_9298 ) ) ( ON ?auto_9298 ?auto_9297 ) ( not ( = ?auto_9295 ?auto_9297 ) ) ( not ( = ?auto_9299 ?auto_9297 ) ) ( not ( = ?auto_9296 ?auto_9297 ) ) ( not ( = ?auto_9298 ?auto_9297 ) ) ( ON ?auto_9296 ?auto_9298 ) ( ON-TABLE ?auto_9297 ) ( ON ?auto_9299 ?auto_9296 ) ( CLEAR ?auto_9299 ) ( HOLDING ?auto_9295 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9295 ?auto_9299 )
      ( MAKE-1PILE ?auto_9295 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9300 - BLOCK
    )
    :vars
    (
      ?auto_9304 - BLOCK
      ?auto_9302 - BLOCK
      ?auto_9301 - BLOCK
      ?auto_9303 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9300 ?auto_9304 ) ) ( not ( = ?auto_9300 ?auto_9302 ) ) ( not ( = ?auto_9300 ?auto_9301 ) ) ( not ( = ?auto_9304 ?auto_9302 ) ) ( not ( = ?auto_9304 ?auto_9301 ) ) ( not ( = ?auto_9302 ?auto_9301 ) ) ( ON ?auto_9301 ?auto_9303 ) ( not ( = ?auto_9300 ?auto_9303 ) ) ( not ( = ?auto_9304 ?auto_9303 ) ) ( not ( = ?auto_9302 ?auto_9303 ) ) ( not ( = ?auto_9301 ?auto_9303 ) ) ( ON ?auto_9302 ?auto_9301 ) ( ON-TABLE ?auto_9303 ) ( ON ?auto_9304 ?auto_9302 ) ( ON ?auto_9300 ?auto_9304 ) ( CLEAR ?auto_9300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9303 ?auto_9301 ?auto_9302 ?auto_9304 )
      ( MAKE-1PILE ?auto_9300 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9308 - BLOCK
      ?auto_9309 - BLOCK
      ?auto_9310 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9310 ) ( CLEAR ?auto_9309 ) ( ON-TABLE ?auto_9308 ) ( ON ?auto_9309 ?auto_9308 ) ( not ( = ?auto_9308 ?auto_9309 ) ) ( not ( = ?auto_9308 ?auto_9310 ) ) ( not ( = ?auto_9309 ?auto_9310 ) ) )
    :subtasks
    ( ( !STACK ?auto_9310 ?auto_9309 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9311 - BLOCK
      ?auto_9312 - BLOCK
      ?auto_9313 - BLOCK
    )
    :vars
    (
      ?auto_9314 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9312 ) ( ON-TABLE ?auto_9311 ) ( ON ?auto_9312 ?auto_9311 ) ( not ( = ?auto_9311 ?auto_9312 ) ) ( not ( = ?auto_9311 ?auto_9313 ) ) ( not ( = ?auto_9312 ?auto_9313 ) ) ( ON ?auto_9313 ?auto_9314 ) ( CLEAR ?auto_9313 ) ( HAND-EMPTY ) ( not ( = ?auto_9311 ?auto_9314 ) ) ( not ( = ?auto_9312 ?auto_9314 ) ) ( not ( = ?auto_9313 ?auto_9314 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9313 ?auto_9314 )
      ( MAKE-3PILE ?auto_9311 ?auto_9312 ?auto_9313 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9315 - BLOCK
      ?auto_9316 - BLOCK
      ?auto_9317 - BLOCK
    )
    :vars
    (
      ?auto_9318 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9315 ) ( not ( = ?auto_9315 ?auto_9316 ) ) ( not ( = ?auto_9315 ?auto_9317 ) ) ( not ( = ?auto_9316 ?auto_9317 ) ) ( ON ?auto_9317 ?auto_9318 ) ( CLEAR ?auto_9317 ) ( not ( = ?auto_9315 ?auto_9318 ) ) ( not ( = ?auto_9316 ?auto_9318 ) ) ( not ( = ?auto_9317 ?auto_9318 ) ) ( HOLDING ?auto_9316 ) ( CLEAR ?auto_9315 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9315 ?auto_9316 )
      ( MAKE-3PILE ?auto_9315 ?auto_9316 ?auto_9317 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9319 - BLOCK
      ?auto_9320 - BLOCK
      ?auto_9321 - BLOCK
    )
    :vars
    (
      ?auto_9322 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9319 ) ( not ( = ?auto_9319 ?auto_9320 ) ) ( not ( = ?auto_9319 ?auto_9321 ) ) ( not ( = ?auto_9320 ?auto_9321 ) ) ( ON ?auto_9321 ?auto_9322 ) ( not ( = ?auto_9319 ?auto_9322 ) ) ( not ( = ?auto_9320 ?auto_9322 ) ) ( not ( = ?auto_9321 ?auto_9322 ) ) ( CLEAR ?auto_9319 ) ( ON ?auto_9320 ?auto_9321 ) ( CLEAR ?auto_9320 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9322 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9322 ?auto_9321 )
      ( MAKE-3PILE ?auto_9319 ?auto_9320 ?auto_9321 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9323 - BLOCK
      ?auto_9324 - BLOCK
      ?auto_9325 - BLOCK
    )
    :vars
    (
      ?auto_9326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9323 ?auto_9324 ) ) ( not ( = ?auto_9323 ?auto_9325 ) ) ( not ( = ?auto_9324 ?auto_9325 ) ) ( ON ?auto_9325 ?auto_9326 ) ( not ( = ?auto_9323 ?auto_9326 ) ) ( not ( = ?auto_9324 ?auto_9326 ) ) ( not ( = ?auto_9325 ?auto_9326 ) ) ( ON ?auto_9324 ?auto_9325 ) ( CLEAR ?auto_9324 ) ( ON-TABLE ?auto_9326 ) ( HOLDING ?auto_9323 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9323 )
      ( MAKE-3PILE ?auto_9323 ?auto_9324 ?auto_9325 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9327 - BLOCK
      ?auto_9328 - BLOCK
      ?auto_9329 - BLOCK
    )
    :vars
    (
      ?auto_9330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9327 ?auto_9328 ) ) ( not ( = ?auto_9327 ?auto_9329 ) ) ( not ( = ?auto_9328 ?auto_9329 ) ) ( ON ?auto_9329 ?auto_9330 ) ( not ( = ?auto_9327 ?auto_9330 ) ) ( not ( = ?auto_9328 ?auto_9330 ) ) ( not ( = ?auto_9329 ?auto_9330 ) ) ( ON ?auto_9328 ?auto_9329 ) ( ON-TABLE ?auto_9330 ) ( ON ?auto_9327 ?auto_9328 ) ( CLEAR ?auto_9327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9330 ?auto_9329 ?auto_9328 )
      ( MAKE-3PILE ?auto_9327 ?auto_9328 ?auto_9329 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9331 - BLOCK
      ?auto_9332 - BLOCK
      ?auto_9333 - BLOCK
    )
    :vars
    (
      ?auto_9334 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9331 ?auto_9332 ) ) ( not ( = ?auto_9331 ?auto_9333 ) ) ( not ( = ?auto_9332 ?auto_9333 ) ) ( ON ?auto_9333 ?auto_9334 ) ( not ( = ?auto_9331 ?auto_9334 ) ) ( not ( = ?auto_9332 ?auto_9334 ) ) ( not ( = ?auto_9333 ?auto_9334 ) ) ( ON ?auto_9332 ?auto_9333 ) ( ON-TABLE ?auto_9334 ) ( HOLDING ?auto_9331 ) ( CLEAR ?auto_9332 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9334 ?auto_9333 ?auto_9332 ?auto_9331 )
      ( MAKE-3PILE ?auto_9331 ?auto_9332 ?auto_9333 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9335 - BLOCK
      ?auto_9336 - BLOCK
      ?auto_9337 - BLOCK
    )
    :vars
    (
      ?auto_9338 - BLOCK
      ?auto_9339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9335 ?auto_9336 ) ) ( not ( = ?auto_9335 ?auto_9337 ) ) ( not ( = ?auto_9336 ?auto_9337 ) ) ( ON ?auto_9337 ?auto_9338 ) ( not ( = ?auto_9335 ?auto_9338 ) ) ( not ( = ?auto_9336 ?auto_9338 ) ) ( not ( = ?auto_9337 ?auto_9338 ) ) ( ON ?auto_9336 ?auto_9337 ) ( ON-TABLE ?auto_9338 ) ( CLEAR ?auto_9336 ) ( ON ?auto_9335 ?auto_9339 ) ( CLEAR ?auto_9335 ) ( HAND-EMPTY ) ( not ( = ?auto_9335 ?auto_9339 ) ) ( not ( = ?auto_9336 ?auto_9339 ) ) ( not ( = ?auto_9337 ?auto_9339 ) ) ( not ( = ?auto_9338 ?auto_9339 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9335 ?auto_9339 )
      ( MAKE-3PILE ?auto_9335 ?auto_9336 ?auto_9337 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9340 - BLOCK
      ?auto_9341 - BLOCK
      ?auto_9342 - BLOCK
    )
    :vars
    (
      ?auto_9343 - BLOCK
      ?auto_9344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9340 ?auto_9341 ) ) ( not ( = ?auto_9340 ?auto_9342 ) ) ( not ( = ?auto_9341 ?auto_9342 ) ) ( ON ?auto_9342 ?auto_9343 ) ( not ( = ?auto_9340 ?auto_9343 ) ) ( not ( = ?auto_9341 ?auto_9343 ) ) ( not ( = ?auto_9342 ?auto_9343 ) ) ( ON-TABLE ?auto_9343 ) ( ON ?auto_9340 ?auto_9344 ) ( CLEAR ?auto_9340 ) ( not ( = ?auto_9340 ?auto_9344 ) ) ( not ( = ?auto_9341 ?auto_9344 ) ) ( not ( = ?auto_9342 ?auto_9344 ) ) ( not ( = ?auto_9343 ?auto_9344 ) ) ( HOLDING ?auto_9341 ) ( CLEAR ?auto_9342 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9343 ?auto_9342 ?auto_9341 )
      ( MAKE-3PILE ?auto_9340 ?auto_9341 ?auto_9342 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9345 - BLOCK
      ?auto_9346 - BLOCK
      ?auto_9347 - BLOCK
    )
    :vars
    (
      ?auto_9349 - BLOCK
      ?auto_9348 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9345 ?auto_9346 ) ) ( not ( = ?auto_9345 ?auto_9347 ) ) ( not ( = ?auto_9346 ?auto_9347 ) ) ( ON ?auto_9347 ?auto_9349 ) ( not ( = ?auto_9345 ?auto_9349 ) ) ( not ( = ?auto_9346 ?auto_9349 ) ) ( not ( = ?auto_9347 ?auto_9349 ) ) ( ON-TABLE ?auto_9349 ) ( ON ?auto_9345 ?auto_9348 ) ( not ( = ?auto_9345 ?auto_9348 ) ) ( not ( = ?auto_9346 ?auto_9348 ) ) ( not ( = ?auto_9347 ?auto_9348 ) ) ( not ( = ?auto_9349 ?auto_9348 ) ) ( CLEAR ?auto_9347 ) ( ON ?auto_9346 ?auto_9345 ) ( CLEAR ?auto_9346 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9348 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9348 ?auto_9345 )
      ( MAKE-3PILE ?auto_9345 ?auto_9346 ?auto_9347 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9350 - BLOCK
      ?auto_9351 - BLOCK
      ?auto_9352 - BLOCK
    )
    :vars
    (
      ?auto_9354 - BLOCK
      ?auto_9353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9350 ?auto_9351 ) ) ( not ( = ?auto_9350 ?auto_9352 ) ) ( not ( = ?auto_9351 ?auto_9352 ) ) ( not ( = ?auto_9350 ?auto_9354 ) ) ( not ( = ?auto_9351 ?auto_9354 ) ) ( not ( = ?auto_9352 ?auto_9354 ) ) ( ON-TABLE ?auto_9354 ) ( ON ?auto_9350 ?auto_9353 ) ( not ( = ?auto_9350 ?auto_9353 ) ) ( not ( = ?auto_9351 ?auto_9353 ) ) ( not ( = ?auto_9352 ?auto_9353 ) ) ( not ( = ?auto_9354 ?auto_9353 ) ) ( ON ?auto_9351 ?auto_9350 ) ( CLEAR ?auto_9351 ) ( ON-TABLE ?auto_9353 ) ( HOLDING ?auto_9352 ) ( CLEAR ?auto_9354 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9354 ?auto_9352 )
      ( MAKE-3PILE ?auto_9350 ?auto_9351 ?auto_9352 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9355 - BLOCK
      ?auto_9356 - BLOCK
      ?auto_9357 - BLOCK
    )
    :vars
    (
      ?auto_9358 - BLOCK
      ?auto_9359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9355 ?auto_9356 ) ) ( not ( = ?auto_9355 ?auto_9357 ) ) ( not ( = ?auto_9356 ?auto_9357 ) ) ( not ( = ?auto_9355 ?auto_9358 ) ) ( not ( = ?auto_9356 ?auto_9358 ) ) ( not ( = ?auto_9357 ?auto_9358 ) ) ( ON-TABLE ?auto_9358 ) ( ON ?auto_9355 ?auto_9359 ) ( not ( = ?auto_9355 ?auto_9359 ) ) ( not ( = ?auto_9356 ?auto_9359 ) ) ( not ( = ?auto_9357 ?auto_9359 ) ) ( not ( = ?auto_9358 ?auto_9359 ) ) ( ON ?auto_9356 ?auto_9355 ) ( ON-TABLE ?auto_9359 ) ( CLEAR ?auto_9358 ) ( ON ?auto_9357 ?auto_9356 ) ( CLEAR ?auto_9357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9359 ?auto_9355 ?auto_9356 )
      ( MAKE-3PILE ?auto_9355 ?auto_9356 ?auto_9357 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9360 - BLOCK
      ?auto_9361 - BLOCK
      ?auto_9362 - BLOCK
    )
    :vars
    (
      ?auto_9363 - BLOCK
      ?auto_9364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9360 ?auto_9361 ) ) ( not ( = ?auto_9360 ?auto_9362 ) ) ( not ( = ?auto_9361 ?auto_9362 ) ) ( not ( = ?auto_9360 ?auto_9363 ) ) ( not ( = ?auto_9361 ?auto_9363 ) ) ( not ( = ?auto_9362 ?auto_9363 ) ) ( ON ?auto_9360 ?auto_9364 ) ( not ( = ?auto_9360 ?auto_9364 ) ) ( not ( = ?auto_9361 ?auto_9364 ) ) ( not ( = ?auto_9362 ?auto_9364 ) ) ( not ( = ?auto_9363 ?auto_9364 ) ) ( ON ?auto_9361 ?auto_9360 ) ( ON-TABLE ?auto_9364 ) ( ON ?auto_9362 ?auto_9361 ) ( CLEAR ?auto_9362 ) ( HOLDING ?auto_9363 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9363 )
      ( MAKE-3PILE ?auto_9360 ?auto_9361 ?auto_9362 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9365 - BLOCK
      ?auto_9366 - BLOCK
      ?auto_9367 - BLOCK
    )
    :vars
    (
      ?auto_9369 - BLOCK
      ?auto_9368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9365 ?auto_9366 ) ) ( not ( = ?auto_9365 ?auto_9367 ) ) ( not ( = ?auto_9366 ?auto_9367 ) ) ( not ( = ?auto_9365 ?auto_9369 ) ) ( not ( = ?auto_9366 ?auto_9369 ) ) ( not ( = ?auto_9367 ?auto_9369 ) ) ( ON ?auto_9365 ?auto_9368 ) ( not ( = ?auto_9365 ?auto_9368 ) ) ( not ( = ?auto_9366 ?auto_9368 ) ) ( not ( = ?auto_9367 ?auto_9368 ) ) ( not ( = ?auto_9369 ?auto_9368 ) ) ( ON ?auto_9366 ?auto_9365 ) ( ON-TABLE ?auto_9368 ) ( ON ?auto_9367 ?auto_9366 ) ( ON ?auto_9369 ?auto_9367 ) ( CLEAR ?auto_9369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9368 ?auto_9365 ?auto_9366 ?auto_9367 )
      ( MAKE-3PILE ?auto_9365 ?auto_9366 ?auto_9367 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9374 - BLOCK
      ?auto_9375 - BLOCK
      ?auto_9376 - BLOCK
      ?auto_9377 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9377 ) ( CLEAR ?auto_9376 ) ( ON-TABLE ?auto_9374 ) ( ON ?auto_9375 ?auto_9374 ) ( ON ?auto_9376 ?auto_9375 ) ( not ( = ?auto_9374 ?auto_9375 ) ) ( not ( = ?auto_9374 ?auto_9376 ) ) ( not ( = ?auto_9374 ?auto_9377 ) ) ( not ( = ?auto_9375 ?auto_9376 ) ) ( not ( = ?auto_9375 ?auto_9377 ) ) ( not ( = ?auto_9376 ?auto_9377 ) ) )
    :subtasks
    ( ( !STACK ?auto_9377 ?auto_9376 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9378 - BLOCK
      ?auto_9379 - BLOCK
      ?auto_9380 - BLOCK
      ?auto_9381 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9380 ) ( ON-TABLE ?auto_9378 ) ( ON ?auto_9379 ?auto_9378 ) ( ON ?auto_9380 ?auto_9379 ) ( not ( = ?auto_9378 ?auto_9379 ) ) ( not ( = ?auto_9378 ?auto_9380 ) ) ( not ( = ?auto_9378 ?auto_9381 ) ) ( not ( = ?auto_9379 ?auto_9380 ) ) ( not ( = ?auto_9379 ?auto_9381 ) ) ( not ( = ?auto_9380 ?auto_9381 ) ) ( ON-TABLE ?auto_9381 ) ( CLEAR ?auto_9381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_9381 )
      ( MAKE-4PILE ?auto_9378 ?auto_9379 ?auto_9380 ?auto_9381 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9382 - BLOCK
      ?auto_9383 - BLOCK
      ?auto_9384 - BLOCK
      ?auto_9385 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9382 ) ( ON ?auto_9383 ?auto_9382 ) ( not ( = ?auto_9382 ?auto_9383 ) ) ( not ( = ?auto_9382 ?auto_9384 ) ) ( not ( = ?auto_9382 ?auto_9385 ) ) ( not ( = ?auto_9383 ?auto_9384 ) ) ( not ( = ?auto_9383 ?auto_9385 ) ) ( not ( = ?auto_9384 ?auto_9385 ) ) ( ON-TABLE ?auto_9385 ) ( CLEAR ?auto_9385 ) ( HOLDING ?auto_9384 ) ( CLEAR ?auto_9383 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9382 ?auto_9383 ?auto_9384 )
      ( MAKE-4PILE ?auto_9382 ?auto_9383 ?auto_9384 ?auto_9385 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9386 - BLOCK
      ?auto_9387 - BLOCK
      ?auto_9388 - BLOCK
      ?auto_9389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9386 ) ( ON ?auto_9387 ?auto_9386 ) ( not ( = ?auto_9386 ?auto_9387 ) ) ( not ( = ?auto_9386 ?auto_9388 ) ) ( not ( = ?auto_9386 ?auto_9389 ) ) ( not ( = ?auto_9387 ?auto_9388 ) ) ( not ( = ?auto_9387 ?auto_9389 ) ) ( not ( = ?auto_9388 ?auto_9389 ) ) ( ON-TABLE ?auto_9389 ) ( CLEAR ?auto_9387 ) ( ON ?auto_9388 ?auto_9389 ) ( CLEAR ?auto_9388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9389 )
      ( MAKE-4PILE ?auto_9386 ?auto_9387 ?auto_9388 ?auto_9389 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9390 - BLOCK
      ?auto_9391 - BLOCK
      ?auto_9392 - BLOCK
      ?auto_9393 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9390 ) ( not ( = ?auto_9390 ?auto_9391 ) ) ( not ( = ?auto_9390 ?auto_9392 ) ) ( not ( = ?auto_9390 ?auto_9393 ) ) ( not ( = ?auto_9391 ?auto_9392 ) ) ( not ( = ?auto_9391 ?auto_9393 ) ) ( not ( = ?auto_9392 ?auto_9393 ) ) ( ON-TABLE ?auto_9393 ) ( ON ?auto_9392 ?auto_9393 ) ( CLEAR ?auto_9392 ) ( HOLDING ?auto_9391 ) ( CLEAR ?auto_9390 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9390 ?auto_9391 )
      ( MAKE-4PILE ?auto_9390 ?auto_9391 ?auto_9392 ?auto_9393 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9394 - BLOCK
      ?auto_9395 - BLOCK
      ?auto_9396 - BLOCK
      ?auto_9397 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9394 ) ( not ( = ?auto_9394 ?auto_9395 ) ) ( not ( = ?auto_9394 ?auto_9396 ) ) ( not ( = ?auto_9394 ?auto_9397 ) ) ( not ( = ?auto_9395 ?auto_9396 ) ) ( not ( = ?auto_9395 ?auto_9397 ) ) ( not ( = ?auto_9396 ?auto_9397 ) ) ( ON-TABLE ?auto_9397 ) ( ON ?auto_9396 ?auto_9397 ) ( CLEAR ?auto_9394 ) ( ON ?auto_9395 ?auto_9396 ) ( CLEAR ?auto_9395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9397 ?auto_9396 )
      ( MAKE-4PILE ?auto_9394 ?auto_9395 ?auto_9396 ?auto_9397 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9398 - BLOCK
      ?auto_9399 - BLOCK
      ?auto_9400 - BLOCK
      ?auto_9401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9398 ?auto_9399 ) ) ( not ( = ?auto_9398 ?auto_9400 ) ) ( not ( = ?auto_9398 ?auto_9401 ) ) ( not ( = ?auto_9399 ?auto_9400 ) ) ( not ( = ?auto_9399 ?auto_9401 ) ) ( not ( = ?auto_9400 ?auto_9401 ) ) ( ON-TABLE ?auto_9401 ) ( ON ?auto_9400 ?auto_9401 ) ( ON ?auto_9399 ?auto_9400 ) ( CLEAR ?auto_9399 ) ( HOLDING ?auto_9398 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9398 )
      ( MAKE-4PILE ?auto_9398 ?auto_9399 ?auto_9400 ?auto_9401 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9402 - BLOCK
      ?auto_9403 - BLOCK
      ?auto_9404 - BLOCK
      ?auto_9405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9402 ?auto_9403 ) ) ( not ( = ?auto_9402 ?auto_9404 ) ) ( not ( = ?auto_9402 ?auto_9405 ) ) ( not ( = ?auto_9403 ?auto_9404 ) ) ( not ( = ?auto_9403 ?auto_9405 ) ) ( not ( = ?auto_9404 ?auto_9405 ) ) ( ON-TABLE ?auto_9405 ) ( ON ?auto_9404 ?auto_9405 ) ( ON ?auto_9403 ?auto_9404 ) ( ON ?auto_9402 ?auto_9403 ) ( CLEAR ?auto_9402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9405 ?auto_9404 ?auto_9403 )
      ( MAKE-4PILE ?auto_9402 ?auto_9403 ?auto_9404 ?auto_9405 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9406 - BLOCK
      ?auto_9407 - BLOCK
      ?auto_9408 - BLOCK
      ?auto_9409 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9406 ?auto_9407 ) ) ( not ( = ?auto_9406 ?auto_9408 ) ) ( not ( = ?auto_9406 ?auto_9409 ) ) ( not ( = ?auto_9407 ?auto_9408 ) ) ( not ( = ?auto_9407 ?auto_9409 ) ) ( not ( = ?auto_9408 ?auto_9409 ) ) ( ON-TABLE ?auto_9409 ) ( ON ?auto_9408 ?auto_9409 ) ( ON ?auto_9407 ?auto_9408 ) ( HOLDING ?auto_9406 ) ( CLEAR ?auto_9407 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9409 ?auto_9408 ?auto_9407 ?auto_9406 )
      ( MAKE-4PILE ?auto_9406 ?auto_9407 ?auto_9408 ?auto_9409 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9410 - BLOCK
      ?auto_9411 - BLOCK
      ?auto_9412 - BLOCK
      ?auto_9413 - BLOCK
    )
    :vars
    (
      ?auto_9414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9410 ?auto_9411 ) ) ( not ( = ?auto_9410 ?auto_9412 ) ) ( not ( = ?auto_9410 ?auto_9413 ) ) ( not ( = ?auto_9411 ?auto_9412 ) ) ( not ( = ?auto_9411 ?auto_9413 ) ) ( not ( = ?auto_9412 ?auto_9413 ) ) ( ON-TABLE ?auto_9413 ) ( ON ?auto_9412 ?auto_9413 ) ( ON ?auto_9411 ?auto_9412 ) ( CLEAR ?auto_9411 ) ( ON ?auto_9410 ?auto_9414 ) ( CLEAR ?auto_9410 ) ( HAND-EMPTY ) ( not ( = ?auto_9410 ?auto_9414 ) ) ( not ( = ?auto_9411 ?auto_9414 ) ) ( not ( = ?auto_9412 ?auto_9414 ) ) ( not ( = ?auto_9413 ?auto_9414 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9410 ?auto_9414 )
      ( MAKE-4PILE ?auto_9410 ?auto_9411 ?auto_9412 ?auto_9413 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9415 - BLOCK
      ?auto_9416 - BLOCK
      ?auto_9417 - BLOCK
      ?auto_9418 - BLOCK
    )
    :vars
    (
      ?auto_9419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9415 ?auto_9416 ) ) ( not ( = ?auto_9415 ?auto_9417 ) ) ( not ( = ?auto_9415 ?auto_9418 ) ) ( not ( = ?auto_9416 ?auto_9417 ) ) ( not ( = ?auto_9416 ?auto_9418 ) ) ( not ( = ?auto_9417 ?auto_9418 ) ) ( ON-TABLE ?auto_9418 ) ( ON ?auto_9417 ?auto_9418 ) ( ON ?auto_9415 ?auto_9419 ) ( CLEAR ?auto_9415 ) ( not ( = ?auto_9415 ?auto_9419 ) ) ( not ( = ?auto_9416 ?auto_9419 ) ) ( not ( = ?auto_9417 ?auto_9419 ) ) ( not ( = ?auto_9418 ?auto_9419 ) ) ( HOLDING ?auto_9416 ) ( CLEAR ?auto_9417 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9418 ?auto_9417 ?auto_9416 )
      ( MAKE-4PILE ?auto_9415 ?auto_9416 ?auto_9417 ?auto_9418 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9420 - BLOCK
      ?auto_9421 - BLOCK
      ?auto_9422 - BLOCK
      ?auto_9423 - BLOCK
    )
    :vars
    (
      ?auto_9424 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9420 ?auto_9421 ) ) ( not ( = ?auto_9420 ?auto_9422 ) ) ( not ( = ?auto_9420 ?auto_9423 ) ) ( not ( = ?auto_9421 ?auto_9422 ) ) ( not ( = ?auto_9421 ?auto_9423 ) ) ( not ( = ?auto_9422 ?auto_9423 ) ) ( ON-TABLE ?auto_9423 ) ( ON ?auto_9422 ?auto_9423 ) ( ON ?auto_9420 ?auto_9424 ) ( not ( = ?auto_9420 ?auto_9424 ) ) ( not ( = ?auto_9421 ?auto_9424 ) ) ( not ( = ?auto_9422 ?auto_9424 ) ) ( not ( = ?auto_9423 ?auto_9424 ) ) ( CLEAR ?auto_9422 ) ( ON ?auto_9421 ?auto_9420 ) ( CLEAR ?auto_9421 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9424 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9424 ?auto_9420 )
      ( MAKE-4PILE ?auto_9420 ?auto_9421 ?auto_9422 ?auto_9423 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9425 - BLOCK
      ?auto_9426 - BLOCK
      ?auto_9427 - BLOCK
      ?auto_9428 - BLOCK
    )
    :vars
    (
      ?auto_9429 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9425 ?auto_9426 ) ) ( not ( = ?auto_9425 ?auto_9427 ) ) ( not ( = ?auto_9425 ?auto_9428 ) ) ( not ( = ?auto_9426 ?auto_9427 ) ) ( not ( = ?auto_9426 ?auto_9428 ) ) ( not ( = ?auto_9427 ?auto_9428 ) ) ( ON-TABLE ?auto_9428 ) ( ON ?auto_9425 ?auto_9429 ) ( not ( = ?auto_9425 ?auto_9429 ) ) ( not ( = ?auto_9426 ?auto_9429 ) ) ( not ( = ?auto_9427 ?auto_9429 ) ) ( not ( = ?auto_9428 ?auto_9429 ) ) ( ON ?auto_9426 ?auto_9425 ) ( CLEAR ?auto_9426 ) ( ON-TABLE ?auto_9429 ) ( HOLDING ?auto_9427 ) ( CLEAR ?auto_9428 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9428 ?auto_9427 )
      ( MAKE-4PILE ?auto_9425 ?auto_9426 ?auto_9427 ?auto_9428 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9430 - BLOCK
      ?auto_9431 - BLOCK
      ?auto_9432 - BLOCK
      ?auto_9433 - BLOCK
    )
    :vars
    (
      ?auto_9434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9430 ?auto_9431 ) ) ( not ( = ?auto_9430 ?auto_9432 ) ) ( not ( = ?auto_9430 ?auto_9433 ) ) ( not ( = ?auto_9431 ?auto_9432 ) ) ( not ( = ?auto_9431 ?auto_9433 ) ) ( not ( = ?auto_9432 ?auto_9433 ) ) ( ON-TABLE ?auto_9433 ) ( ON ?auto_9430 ?auto_9434 ) ( not ( = ?auto_9430 ?auto_9434 ) ) ( not ( = ?auto_9431 ?auto_9434 ) ) ( not ( = ?auto_9432 ?auto_9434 ) ) ( not ( = ?auto_9433 ?auto_9434 ) ) ( ON ?auto_9431 ?auto_9430 ) ( ON-TABLE ?auto_9434 ) ( CLEAR ?auto_9433 ) ( ON ?auto_9432 ?auto_9431 ) ( CLEAR ?auto_9432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9434 ?auto_9430 ?auto_9431 )
      ( MAKE-4PILE ?auto_9430 ?auto_9431 ?auto_9432 ?auto_9433 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9435 - BLOCK
      ?auto_9436 - BLOCK
      ?auto_9437 - BLOCK
      ?auto_9438 - BLOCK
    )
    :vars
    (
      ?auto_9439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9435 ?auto_9436 ) ) ( not ( = ?auto_9435 ?auto_9437 ) ) ( not ( = ?auto_9435 ?auto_9438 ) ) ( not ( = ?auto_9436 ?auto_9437 ) ) ( not ( = ?auto_9436 ?auto_9438 ) ) ( not ( = ?auto_9437 ?auto_9438 ) ) ( ON ?auto_9435 ?auto_9439 ) ( not ( = ?auto_9435 ?auto_9439 ) ) ( not ( = ?auto_9436 ?auto_9439 ) ) ( not ( = ?auto_9437 ?auto_9439 ) ) ( not ( = ?auto_9438 ?auto_9439 ) ) ( ON ?auto_9436 ?auto_9435 ) ( ON-TABLE ?auto_9439 ) ( ON ?auto_9437 ?auto_9436 ) ( CLEAR ?auto_9437 ) ( HOLDING ?auto_9438 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9438 )
      ( MAKE-4PILE ?auto_9435 ?auto_9436 ?auto_9437 ?auto_9438 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9440 - BLOCK
      ?auto_9441 - BLOCK
      ?auto_9442 - BLOCK
      ?auto_9443 - BLOCK
    )
    :vars
    (
      ?auto_9444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9440 ?auto_9441 ) ) ( not ( = ?auto_9440 ?auto_9442 ) ) ( not ( = ?auto_9440 ?auto_9443 ) ) ( not ( = ?auto_9441 ?auto_9442 ) ) ( not ( = ?auto_9441 ?auto_9443 ) ) ( not ( = ?auto_9442 ?auto_9443 ) ) ( ON ?auto_9440 ?auto_9444 ) ( not ( = ?auto_9440 ?auto_9444 ) ) ( not ( = ?auto_9441 ?auto_9444 ) ) ( not ( = ?auto_9442 ?auto_9444 ) ) ( not ( = ?auto_9443 ?auto_9444 ) ) ( ON ?auto_9441 ?auto_9440 ) ( ON-TABLE ?auto_9444 ) ( ON ?auto_9442 ?auto_9441 ) ( ON ?auto_9443 ?auto_9442 ) ( CLEAR ?auto_9443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9444 ?auto_9440 ?auto_9441 ?auto_9442 )
      ( MAKE-4PILE ?auto_9440 ?auto_9441 ?auto_9442 ?auto_9443 ) )
  )

)

