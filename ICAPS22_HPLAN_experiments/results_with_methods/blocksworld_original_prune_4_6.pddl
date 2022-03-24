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
      ?auto_8876 - BLOCK
      ?auto_8877 - BLOCK
      ?auto_8878 - BLOCK
      ?auto_8879 - BLOCK
    )
    :vars
    (
      ?auto_8880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8880 ?auto_8879 ) ( CLEAR ?auto_8880 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8876 ) ( ON ?auto_8877 ?auto_8876 ) ( ON ?auto_8878 ?auto_8877 ) ( ON ?auto_8879 ?auto_8878 ) ( not ( = ?auto_8876 ?auto_8877 ) ) ( not ( = ?auto_8876 ?auto_8878 ) ) ( not ( = ?auto_8876 ?auto_8879 ) ) ( not ( = ?auto_8876 ?auto_8880 ) ) ( not ( = ?auto_8877 ?auto_8878 ) ) ( not ( = ?auto_8877 ?auto_8879 ) ) ( not ( = ?auto_8877 ?auto_8880 ) ) ( not ( = ?auto_8878 ?auto_8879 ) ) ( not ( = ?auto_8878 ?auto_8880 ) ) ( not ( = ?auto_8879 ?auto_8880 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8880 ?auto_8879 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8882 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8882 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_8882 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8883 - BLOCK
    )
    :vars
    (
      ?auto_8884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8883 ?auto_8884 ) ( CLEAR ?auto_8883 ) ( HAND-EMPTY ) ( not ( = ?auto_8883 ?auto_8884 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8883 ?auto_8884 )
      ( MAKE-1PILE ?auto_8883 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8888 - BLOCK
      ?auto_8889 - BLOCK
      ?auto_8890 - BLOCK
    )
    :vars
    (
      ?auto_8891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8891 ?auto_8890 ) ( CLEAR ?auto_8891 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8888 ) ( ON ?auto_8889 ?auto_8888 ) ( ON ?auto_8890 ?auto_8889 ) ( not ( = ?auto_8888 ?auto_8889 ) ) ( not ( = ?auto_8888 ?auto_8890 ) ) ( not ( = ?auto_8888 ?auto_8891 ) ) ( not ( = ?auto_8889 ?auto_8890 ) ) ( not ( = ?auto_8889 ?auto_8891 ) ) ( not ( = ?auto_8890 ?auto_8891 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8891 ?auto_8890 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8892 - BLOCK
      ?auto_8893 - BLOCK
      ?auto_8894 - BLOCK
    )
    :vars
    (
      ?auto_8895 - BLOCK
      ?auto_8896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8895 ?auto_8894 ) ( CLEAR ?auto_8895 ) ( ON-TABLE ?auto_8892 ) ( ON ?auto_8893 ?auto_8892 ) ( ON ?auto_8894 ?auto_8893 ) ( not ( = ?auto_8892 ?auto_8893 ) ) ( not ( = ?auto_8892 ?auto_8894 ) ) ( not ( = ?auto_8892 ?auto_8895 ) ) ( not ( = ?auto_8893 ?auto_8894 ) ) ( not ( = ?auto_8893 ?auto_8895 ) ) ( not ( = ?auto_8894 ?auto_8895 ) ) ( HOLDING ?auto_8896 ) ( not ( = ?auto_8892 ?auto_8896 ) ) ( not ( = ?auto_8893 ?auto_8896 ) ) ( not ( = ?auto_8894 ?auto_8896 ) ) ( not ( = ?auto_8895 ?auto_8896 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_8896 )
      ( MAKE-3PILE ?auto_8892 ?auto_8893 ?auto_8894 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8897 - BLOCK
      ?auto_8898 - BLOCK
      ?auto_8899 - BLOCK
    )
    :vars
    (
      ?auto_8901 - BLOCK
      ?auto_8900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8901 ?auto_8899 ) ( ON-TABLE ?auto_8897 ) ( ON ?auto_8898 ?auto_8897 ) ( ON ?auto_8899 ?auto_8898 ) ( not ( = ?auto_8897 ?auto_8898 ) ) ( not ( = ?auto_8897 ?auto_8899 ) ) ( not ( = ?auto_8897 ?auto_8901 ) ) ( not ( = ?auto_8898 ?auto_8899 ) ) ( not ( = ?auto_8898 ?auto_8901 ) ) ( not ( = ?auto_8899 ?auto_8901 ) ) ( not ( = ?auto_8897 ?auto_8900 ) ) ( not ( = ?auto_8898 ?auto_8900 ) ) ( not ( = ?auto_8899 ?auto_8900 ) ) ( not ( = ?auto_8901 ?auto_8900 ) ) ( ON ?auto_8900 ?auto_8901 ) ( CLEAR ?auto_8900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8897 ?auto_8898 ?auto_8899 ?auto_8901 )
      ( MAKE-3PILE ?auto_8897 ?auto_8898 ?auto_8899 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8904 - BLOCK
      ?auto_8905 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8905 ) ( CLEAR ?auto_8904 ) ( ON-TABLE ?auto_8904 ) ( not ( = ?auto_8904 ?auto_8905 ) ) )
    :subtasks
    ( ( !STACK ?auto_8905 ?auto_8904 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8906 - BLOCK
      ?auto_8907 - BLOCK
    )
    :vars
    (
      ?auto_8908 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8906 ) ( ON-TABLE ?auto_8906 ) ( not ( = ?auto_8906 ?auto_8907 ) ) ( ON ?auto_8907 ?auto_8908 ) ( CLEAR ?auto_8907 ) ( HAND-EMPTY ) ( not ( = ?auto_8906 ?auto_8908 ) ) ( not ( = ?auto_8907 ?auto_8908 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8907 ?auto_8908 )
      ( MAKE-2PILE ?auto_8906 ?auto_8907 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8909 - BLOCK
      ?auto_8910 - BLOCK
    )
    :vars
    (
      ?auto_8911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8909 ?auto_8910 ) ) ( ON ?auto_8910 ?auto_8911 ) ( CLEAR ?auto_8910 ) ( not ( = ?auto_8909 ?auto_8911 ) ) ( not ( = ?auto_8910 ?auto_8911 ) ) ( HOLDING ?auto_8909 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8909 )
      ( MAKE-2PILE ?auto_8909 ?auto_8910 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8912 - BLOCK
      ?auto_8913 - BLOCK
    )
    :vars
    (
      ?auto_8914 - BLOCK
      ?auto_8915 - BLOCK
      ?auto_8916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8912 ?auto_8913 ) ) ( ON ?auto_8913 ?auto_8914 ) ( not ( = ?auto_8912 ?auto_8914 ) ) ( not ( = ?auto_8913 ?auto_8914 ) ) ( ON ?auto_8912 ?auto_8913 ) ( CLEAR ?auto_8912 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8915 ) ( ON ?auto_8916 ?auto_8915 ) ( ON ?auto_8914 ?auto_8916 ) ( not ( = ?auto_8915 ?auto_8916 ) ) ( not ( = ?auto_8915 ?auto_8914 ) ) ( not ( = ?auto_8915 ?auto_8913 ) ) ( not ( = ?auto_8915 ?auto_8912 ) ) ( not ( = ?auto_8916 ?auto_8914 ) ) ( not ( = ?auto_8916 ?auto_8913 ) ) ( not ( = ?auto_8916 ?auto_8912 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8915 ?auto_8916 ?auto_8914 ?auto_8913 )
      ( MAKE-2PILE ?auto_8912 ?auto_8913 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8919 - BLOCK
      ?auto_8920 - BLOCK
    )
    :vars
    (
      ?auto_8921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8921 ?auto_8920 ) ( CLEAR ?auto_8921 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8919 ) ( ON ?auto_8920 ?auto_8919 ) ( not ( = ?auto_8919 ?auto_8920 ) ) ( not ( = ?auto_8919 ?auto_8921 ) ) ( not ( = ?auto_8920 ?auto_8921 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8921 ?auto_8920 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8922 - BLOCK
      ?auto_8923 - BLOCK
    )
    :vars
    (
      ?auto_8924 - BLOCK
      ?auto_8925 - BLOCK
      ?auto_8926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8924 ?auto_8923 ) ( CLEAR ?auto_8924 ) ( ON-TABLE ?auto_8922 ) ( ON ?auto_8923 ?auto_8922 ) ( not ( = ?auto_8922 ?auto_8923 ) ) ( not ( = ?auto_8922 ?auto_8924 ) ) ( not ( = ?auto_8923 ?auto_8924 ) ) ( HOLDING ?auto_8925 ) ( CLEAR ?auto_8926 ) ( not ( = ?auto_8922 ?auto_8925 ) ) ( not ( = ?auto_8922 ?auto_8926 ) ) ( not ( = ?auto_8923 ?auto_8925 ) ) ( not ( = ?auto_8923 ?auto_8926 ) ) ( not ( = ?auto_8924 ?auto_8925 ) ) ( not ( = ?auto_8924 ?auto_8926 ) ) ( not ( = ?auto_8925 ?auto_8926 ) ) )
    :subtasks
    ( ( !STACK ?auto_8925 ?auto_8926 )
      ( MAKE-2PILE ?auto_8922 ?auto_8923 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9122 - BLOCK
      ?auto_9123 - BLOCK
    )
    :vars
    (
      ?auto_9125 - BLOCK
      ?auto_9124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9125 ?auto_9123 ) ( ON-TABLE ?auto_9122 ) ( ON ?auto_9123 ?auto_9122 ) ( not ( = ?auto_9122 ?auto_9123 ) ) ( not ( = ?auto_9122 ?auto_9125 ) ) ( not ( = ?auto_9123 ?auto_9125 ) ) ( not ( = ?auto_9122 ?auto_9124 ) ) ( not ( = ?auto_9123 ?auto_9124 ) ) ( not ( = ?auto_9125 ?auto_9124 ) ) ( ON ?auto_9124 ?auto_9125 ) ( CLEAR ?auto_9124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9122 ?auto_9123 ?auto_9125 )
      ( MAKE-2PILE ?auto_9122 ?auto_9123 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8932 - BLOCK
      ?auto_8933 - BLOCK
    )
    :vars
    (
      ?auto_8935 - BLOCK
      ?auto_8934 - BLOCK
      ?auto_8936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8935 ?auto_8933 ) ( ON-TABLE ?auto_8932 ) ( ON ?auto_8933 ?auto_8932 ) ( not ( = ?auto_8932 ?auto_8933 ) ) ( not ( = ?auto_8932 ?auto_8935 ) ) ( not ( = ?auto_8933 ?auto_8935 ) ) ( not ( = ?auto_8932 ?auto_8934 ) ) ( not ( = ?auto_8932 ?auto_8936 ) ) ( not ( = ?auto_8933 ?auto_8934 ) ) ( not ( = ?auto_8933 ?auto_8936 ) ) ( not ( = ?auto_8935 ?auto_8934 ) ) ( not ( = ?auto_8935 ?auto_8936 ) ) ( not ( = ?auto_8934 ?auto_8936 ) ) ( ON ?auto_8934 ?auto_8935 ) ( CLEAR ?auto_8934 ) ( HOLDING ?auto_8936 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8936 )
      ( MAKE-2PILE ?auto_8932 ?auto_8933 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8937 - BLOCK
      ?auto_8938 - BLOCK
    )
    :vars
    (
      ?auto_8939 - BLOCK
      ?auto_8940 - BLOCK
      ?auto_8941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8939 ?auto_8938 ) ( ON-TABLE ?auto_8937 ) ( ON ?auto_8938 ?auto_8937 ) ( not ( = ?auto_8937 ?auto_8938 ) ) ( not ( = ?auto_8937 ?auto_8939 ) ) ( not ( = ?auto_8938 ?auto_8939 ) ) ( not ( = ?auto_8937 ?auto_8940 ) ) ( not ( = ?auto_8937 ?auto_8941 ) ) ( not ( = ?auto_8938 ?auto_8940 ) ) ( not ( = ?auto_8938 ?auto_8941 ) ) ( not ( = ?auto_8939 ?auto_8940 ) ) ( not ( = ?auto_8939 ?auto_8941 ) ) ( not ( = ?auto_8940 ?auto_8941 ) ) ( ON ?auto_8940 ?auto_8939 ) ( ON ?auto_8941 ?auto_8940 ) ( CLEAR ?auto_8941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8937 ?auto_8938 ?auto_8939 ?auto_8940 )
      ( MAKE-2PILE ?auto_8937 ?auto_8938 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8945 - BLOCK
      ?auto_8946 - BLOCK
      ?auto_8947 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8947 ) ( CLEAR ?auto_8946 ) ( ON-TABLE ?auto_8945 ) ( ON ?auto_8946 ?auto_8945 ) ( not ( = ?auto_8945 ?auto_8946 ) ) ( not ( = ?auto_8945 ?auto_8947 ) ) ( not ( = ?auto_8946 ?auto_8947 ) ) )
    :subtasks
    ( ( !STACK ?auto_8947 ?auto_8946 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8948 - BLOCK
      ?auto_8949 - BLOCK
      ?auto_8950 - BLOCK
    )
    :vars
    (
      ?auto_8951 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8949 ) ( ON-TABLE ?auto_8948 ) ( ON ?auto_8949 ?auto_8948 ) ( not ( = ?auto_8948 ?auto_8949 ) ) ( not ( = ?auto_8948 ?auto_8950 ) ) ( not ( = ?auto_8949 ?auto_8950 ) ) ( ON ?auto_8950 ?auto_8951 ) ( CLEAR ?auto_8950 ) ( HAND-EMPTY ) ( not ( = ?auto_8948 ?auto_8951 ) ) ( not ( = ?auto_8949 ?auto_8951 ) ) ( not ( = ?auto_8950 ?auto_8951 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8950 ?auto_8951 )
      ( MAKE-3PILE ?auto_8948 ?auto_8949 ?auto_8950 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8952 - BLOCK
      ?auto_8953 - BLOCK
      ?auto_8954 - BLOCK
    )
    :vars
    (
      ?auto_8955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8952 ) ( not ( = ?auto_8952 ?auto_8953 ) ) ( not ( = ?auto_8952 ?auto_8954 ) ) ( not ( = ?auto_8953 ?auto_8954 ) ) ( ON ?auto_8954 ?auto_8955 ) ( CLEAR ?auto_8954 ) ( not ( = ?auto_8952 ?auto_8955 ) ) ( not ( = ?auto_8953 ?auto_8955 ) ) ( not ( = ?auto_8954 ?auto_8955 ) ) ( HOLDING ?auto_8953 ) ( CLEAR ?auto_8952 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8952 ?auto_8953 )
      ( MAKE-3PILE ?auto_8952 ?auto_8953 ?auto_8954 ) )
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
      ?auto_8960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8956 ) ( not ( = ?auto_8956 ?auto_8957 ) ) ( not ( = ?auto_8956 ?auto_8958 ) ) ( not ( = ?auto_8957 ?auto_8958 ) ) ( ON ?auto_8958 ?auto_8959 ) ( not ( = ?auto_8956 ?auto_8959 ) ) ( not ( = ?auto_8957 ?auto_8959 ) ) ( not ( = ?auto_8958 ?auto_8959 ) ) ( CLEAR ?auto_8956 ) ( ON ?auto_8957 ?auto_8958 ) ( CLEAR ?auto_8957 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8960 ) ( ON ?auto_8959 ?auto_8960 ) ( not ( = ?auto_8960 ?auto_8959 ) ) ( not ( = ?auto_8960 ?auto_8958 ) ) ( not ( = ?auto_8960 ?auto_8957 ) ) ( not ( = ?auto_8956 ?auto_8960 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8960 ?auto_8959 ?auto_8958 )
      ( MAKE-3PILE ?auto_8956 ?auto_8957 ?auto_8958 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8961 - BLOCK
      ?auto_8962 - BLOCK
      ?auto_8963 - BLOCK
    )
    :vars
    (
      ?auto_8964 - BLOCK
      ?auto_8965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8961 ?auto_8962 ) ) ( not ( = ?auto_8961 ?auto_8963 ) ) ( not ( = ?auto_8962 ?auto_8963 ) ) ( ON ?auto_8963 ?auto_8964 ) ( not ( = ?auto_8961 ?auto_8964 ) ) ( not ( = ?auto_8962 ?auto_8964 ) ) ( not ( = ?auto_8963 ?auto_8964 ) ) ( ON ?auto_8962 ?auto_8963 ) ( CLEAR ?auto_8962 ) ( ON-TABLE ?auto_8965 ) ( ON ?auto_8964 ?auto_8965 ) ( not ( = ?auto_8965 ?auto_8964 ) ) ( not ( = ?auto_8965 ?auto_8963 ) ) ( not ( = ?auto_8965 ?auto_8962 ) ) ( not ( = ?auto_8961 ?auto_8965 ) ) ( HOLDING ?auto_8961 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8961 )
      ( MAKE-3PILE ?auto_8961 ?auto_8962 ?auto_8963 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8966 - BLOCK
      ?auto_8967 - BLOCK
      ?auto_8968 - BLOCK
    )
    :vars
    (
      ?auto_8970 - BLOCK
      ?auto_8969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8966 ?auto_8967 ) ) ( not ( = ?auto_8966 ?auto_8968 ) ) ( not ( = ?auto_8967 ?auto_8968 ) ) ( ON ?auto_8968 ?auto_8970 ) ( not ( = ?auto_8966 ?auto_8970 ) ) ( not ( = ?auto_8967 ?auto_8970 ) ) ( not ( = ?auto_8968 ?auto_8970 ) ) ( ON ?auto_8967 ?auto_8968 ) ( ON-TABLE ?auto_8969 ) ( ON ?auto_8970 ?auto_8969 ) ( not ( = ?auto_8969 ?auto_8970 ) ) ( not ( = ?auto_8969 ?auto_8968 ) ) ( not ( = ?auto_8969 ?auto_8967 ) ) ( not ( = ?auto_8966 ?auto_8969 ) ) ( ON ?auto_8966 ?auto_8967 ) ( CLEAR ?auto_8966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8969 ?auto_8970 ?auto_8968 ?auto_8967 )
      ( MAKE-3PILE ?auto_8966 ?auto_8967 ?auto_8968 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8972 - BLOCK
    )
    :vars
    (
      ?auto_8973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8973 ?auto_8972 ) ( CLEAR ?auto_8973 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8972 ) ( not ( = ?auto_8972 ?auto_8973 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8973 ?auto_8972 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8974 - BLOCK
    )
    :vars
    (
      ?auto_8975 - BLOCK
      ?auto_8976 - BLOCK
      ?auto_8977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8975 ?auto_8974 ) ( CLEAR ?auto_8975 ) ( ON-TABLE ?auto_8974 ) ( not ( = ?auto_8974 ?auto_8975 ) ) ( HOLDING ?auto_8976 ) ( CLEAR ?auto_8977 ) ( not ( = ?auto_8974 ?auto_8976 ) ) ( not ( = ?auto_8974 ?auto_8977 ) ) ( not ( = ?auto_8975 ?auto_8976 ) ) ( not ( = ?auto_8975 ?auto_8977 ) ) ( not ( = ?auto_8976 ?auto_8977 ) ) )
    :subtasks
    ( ( !STACK ?auto_8976 ?auto_8977 )
      ( MAKE-1PILE ?auto_8974 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8978 - BLOCK
    )
    :vars
    (
      ?auto_8979 - BLOCK
      ?auto_8981 - BLOCK
      ?auto_8980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8979 ?auto_8978 ) ( ON-TABLE ?auto_8978 ) ( not ( = ?auto_8978 ?auto_8979 ) ) ( CLEAR ?auto_8981 ) ( not ( = ?auto_8978 ?auto_8980 ) ) ( not ( = ?auto_8978 ?auto_8981 ) ) ( not ( = ?auto_8979 ?auto_8980 ) ) ( not ( = ?auto_8979 ?auto_8981 ) ) ( not ( = ?auto_8980 ?auto_8981 ) ) ( ON ?auto_8980 ?auto_8979 ) ( CLEAR ?auto_8980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8978 ?auto_8979 )
      ( MAKE-1PILE ?auto_8978 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8982 - BLOCK
    )
    :vars
    (
      ?auto_8984 - BLOCK
      ?auto_8985 - BLOCK
      ?auto_8983 - BLOCK
      ?auto_8986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8984 ?auto_8982 ) ( ON-TABLE ?auto_8982 ) ( not ( = ?auto_8982 ?auto_8984 ) ) ( not ( = ?auto_8982 ?auto_8985 ) ) ( not ( = ?auto_8982 ?auto_8983 ) ) ( not ( = ?auto_8984 ?auto_8985 ) ) ( not ( = ?auto_8984 ?auto_8983 ) ) ( not ( = ?auto_8985 ?auto_8983 ) ) ( ON ?auto_8985 ?auto_8984 ) ( CLEAR ?auto_8985 ) ( HOLDING ?auto_8983 ) ( CLEAR ?auto_8986 ) ( ON-TABLE ?auto_8986 ) ( not ( = ?auto_8986 ?auto_8983 ) ) ( not ( = ?auto_8982 ?auto_8986 ) ) ( not ( = ?auto_8984 ?auto_8986 ) ) ( not ( = ?auto_8985 ?auto_8986 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8986 ?auto_8983 )
      ( MAKE-1PILE ?auto_8982 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9210 - BLOCK
    )
    :vars
    (
      ?auto_9212 - BLOCK
      ?auto_9211 - BLOCK
      ?auto_9213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9212 ?auto_9210 ) ( ON-TABLE ?auto_9210 ) ( not ( = ?auto_9210 ?auto_9212 ) ) ( not ( = ?auto_9210 ?auto_9211 ) ) ( not ( = ?auto_9210 ?auto_9213 ) ) ( not ( = ?auto_9212 ?auto_9211 ) ) ( not ( = ?auto_9212 ?auto_9213 ) ) ( not ( = ?auto_9211 ?auto_9213 ) ) ( ON ?auto_9211 ?auto_9212 ) ( ON ?auto_9213 ?auto_9211 ) ( CLEAR ?auto_9213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9210 ?auto_9212 ?auto_9211 )
      ( MAKE-1PILE ?auto_9210 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8992 - BLOCK
    )
    :vars
    (
      ?auto_8993 - BLOCK
      ?auto_8996 - BLOCK
      ?auto_8994 - BLOCK
      ?auto_8995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8993 ?auto_8992 ) ( ON-TABLE ?auto_8992 ) ( not ( = ?auto_8992 ?auto_8993 ) ) ( not ( = ?auto_8992 ?auto_8996 ) ) ( not ( = ?auto_8992 ?auto_8994 ) ) ( not ( = ?auto_8993 ?auto_8996 ) ) ( not ( = ?auto_8993 ?auto_8994 ) ) ( not ( = ?auto_8996 ?auto_8994 ) ) ( ON ?auto_8996 ?auto_8993 ) ( not ( = ?auto_8995 ?auto_8994 ) ) ( not ( = ?auto_8992 ?auto_8995 ) ) ( not ( = ?auto_8993 ?auto_8995 ) ) ( not ( = ?auto_8996 ?auto_8995 ) ) ( ON ?auto_8994 ?auto_8996 ) ( CLEAR ?auto_8994 ) ( HOLDING ?auto_8995 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8995 )
      ( MAKE-1PILE ?auto_8992 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8997 - BLOCK
    )
    :vars
    (
      ?auto_8999 - BLOCK
      ?auto_9000 - BLOCK
      ?auto_9001 - BLOCK
      ?auto_8998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8999 ?auto_8997 ) ( ON-TABLE ?auto_8997 ) ( not ( = ?auto_8997 ?auto_8999 ) ) ( not ( = ?auto_8997 ?auto_9000 ) ) ( not ( = ?auto_8997 ?auto_9001 ) ) ( not ( = ?auto_8999 ?auto_9000 ) ) ( not ( = ?auto_8999 ?auto_9001 ) ) ( not ( = ?auto_9000 ?auto_9001 ) ) ( ON ?auto_9000 ?auto_8999 ) ( not ( = ?auto_8998 ?auto_9001 ) ) ( not ( = ?auto_8997 ?auto_8998 ) ) ( not ( = ?auto_8999 ?auto_8998 ) ) ( not ( = ?auto_9000 ?auto_8998 ) ) ( ON ?auto_9001 ?auto_9000 ) ( ON ?auto_8998 ?auto_9001 ) ( CLEAR ?auto_8998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8997 ?auto_8999 ?auto_9000 ?auto_9001 )
      ( MAKE-1PILE ?auto_8997 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9006 - BLOCK
      ?auto_9007 - BLOCK
      ?auto_9008 - BLOCK
      ?auto_9009 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9009 ) ( CLEAR ?auto_9008 ) ( ON-TABLE ?auto_9006 ) ( ON ?auto_9007 ?auto_9006 ) ( ON ?auto_9008 ?auto_9007 ) ( not ( = ?auto_9006 ?auto_9007 ) ) ( not ( = ?auto_9006 ?auto_9008 ) ) ( not ( = ?auto_9006 ?auto_9009 ) ) ( not ( = ?auto_9007 ?auto_9008 ) ) ( not ( = ?auto_9007 ?auto_9009 ) ) ( not ( = ?auto_9008 ?auto_9009 ) ) )
    :subtasks
    ( ( !STACK ?auto_9009 ?auto_9008 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9010 - BLOCK
      ?auto_9011 - BLOCK
      ?auto_9012 - BLOCK
      ?auto_9013 - BLOCK
    )
    :vars
    (
      ?auto_9014 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9012 ) ( ON-TABLE ?auto_9010 ) ( ON ?auto_9011 ?auto_9010 ) ( ON ?auto_9012 ?auto_9011 ) ( not ( = ?auto_9010 ?auto_9011 ) ) ( not ( = ?auto_9010 ?auto_9012 ) ) ( not ( = ?auto_9010 ?auto_9013 ) ) ( not ( = ?auto_9011 ?auto_9012 ) ) ( not ( = ?auto_9011 ?auto_9013 ) ) ( not ( = ?auto_9012 ?auto_9013 ) ) ( ON ?auto_9013 ?auto_9014 ) ( CLEAR ?auto_9013 ) ( HAND-EMPTY ) ( not ( = ?auto_9010 ?auto_9014 ) ) ( not ( = ?auto_9011 ?auto_9014 ) ) ( not ( = ?auto_9012 ?auto_9014 ) ) ( not ( = ?auto_9013 ?auto_9014 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9013 ?auto_9014 )
      ( MAKE-4PILE ?auto_9010 ?auto_9011 ?auto_9012 ?auto_9013 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9015 - BLOCK
      ?auto_9016 - BLOCK
      ?auto_9017 - BLOCK
      ?auto_9018 - BLOCK
    )
    :vars
    (
      ?auto_9019 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9015 ) ( ON ?auto_9016 ?auto_9015 ) ( not ( = ?auto_9015 ?auto_9016 ) ) ( not ( = ?auto_9015 ?auto_9017 ) ) ( not ( = ?auto_9015 ?auto_9018 ) ) ( not ( = ?auto_9016 ?auto_9017 ) ) ( not ( = ?auto_9016 ?auto_9018 ) ) ( not ( = ?auto_9017 ?auto_9018 ) ) ( ON ?auto_9018 ?auto_9019 ) ( CLEAR ?auto_9018 ) ( not ( = ?auto_9015 ?auto_9019 ) ) ( not ( = ?auto_9016 ?auto_9019 ) ) ( not ( = ?auto_9017 ?auto_9019 ) ) ( not ( = ?auto_9018 ?auto_9019 ) ) ( HOLDING ?auto_9017 ) ( CLEAR ?auto_9016 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9015 ?auto_9016 ?auto_9017 )
      ( MAKE-4PILE ?auto_9015 ?auto_9016 ?auto_9017 ?auto_9018 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9020 - BLOCK
      ?auto_9021 - BLOCK
      ?auto_9022 - BLOCK
      ?auto_9023 - BLOCK
    )
    :vars
    (
      ?auto_9024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9020 ) ( ON ?auto_9021 ?auto_9020 ) ( not ( = ?auto_9020 ?auto_9021 ) ) ( not ( = ?auto_9020 ?auto_9022 ) ) ( not ( = ?auto_9020 ?auto_9023 ) ) ( not ( = ?auto_9021 ?auto_9022 ) ) ( not ( = ?auto_9021 ?auto_9023 ) ) ( not ( = ?auto_9022 ?auto_9023 ) ) ( ON ?auto_9023 ?auto_9024 ) ( not ( = ?auto_9020 ?auto_9024 ) ) ( not ( = ?auto_9021 ?auto_9024 ) ) ( not ( = ?auto_9022 ?auto_9024 ) ) ( not ( = ?auto_9023 ?auto_9024 ) ) ( CLEAR ?auto_9021 ) ( ON ?auto_9022 ?auto_9023 ) ( CLEAR ?auto_9022 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9024 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9024 ?auto_9023 )
      ( MAKE-4PILE ?auto_9020 ?auto_9021 ?auto_9022 ?auto_9023 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9025 - BLOCK
      ?auto_9026 - BLOCK
      ?auto_9027 - BLOCK
      ?auto_9028 - BLOCK
    )
    :vars
    (
      ?auto_9029 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9025 ) ( not ( = ?auto_9025 ?auto_9026 ) ) ( not ( = ?auto_9025 ?auto_9027 ) ) ( not ( = ?auto_9025 ?auto_9028 ) ) ( not ( = ?auto_9026 ?auto_9027 ) ) ( not ( = ?auto_9026 ?auto_9028 ) ) ( not ( = ?auto_9027 ?auto_9028 ) ) ( ON ?auto_9028 ?auto_9029 ) ( not ( = ?auto_9025 ?auto_9029 ) ) ( not ( = ?auto_9026 ?auto_9029 ) ) ( not ( = ?auto_9027 ?auto_9029 ) ) ( not ( = ?auto_9028 ?auto_9029 ) ) ( ON ?auto_9027 ?auto_9028 ) ( CLEAR ?auto_9027 ) ( ON-TABLE ?auto_9029 ) ( HOLDING ?auto_9026 ) ( CLEAR ?auto_9025 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9025 ?auto_9026 )
      ( MAKE-4PILE ?auto_9025 ?auto_9026 ?auto_9027 ?auto_9028 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9030 - BLOCK
      ?auto_9031 - BLOCK
      ?auto_9032 - BLOCK
      ?auto_9033 - BLOCK
    )
    :vars
    (
      ?auto_9034 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9030 ) ( not ( = ?auto_9030 ?auto_9031 ) ) ( not ( = ?auto_9030 ?auto_9032 ) ) ( not ( = ?auto_9030 ?auto_9033 ) ) ( not ( = ?auto_9031 ?auto_9032 ) ) ( not ( = ?auto_9031 ?auto_9033 ) ) ( not ( = ?auto_9032 ?auto_9033 ) ) ( ON ?auto_9033 ?auto_9034 ) ( not ( = ?auto_9030 ?auto_9034 ) ) ( not ( = ?auto_9031 ?auto_9034 ) ) ( not ( = ?auto_9032 ?auto_9034 ) ) ( not ( = ?auto_9033 ?auto_9034 ) ) ( ON ?auto_9032 ?auto_9033 ) ( ON-TABLE ?auto_9034 ) ( CLEAR ?auto_9030 ) ( ON ?auto_9031 ?auto_9032 ) ( CLEAR ?auto_9031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9034 ?auto_9033 ?auto_9032 )
      ( MAKE-4PILE ?auto_9030 ?auto_9031 ?auto_9032 ?auto_9033 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9035 - BLOCK
      ?auto_9036 - BLOCK
      ?auto_9037 - BLOCK
      ?auto_9038 - BLOCK
    )
    :vars
    (
      ?auto_9039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9035 ?auto_9036 ) ) ( not ( = ?auto_9035 ?auto_9037 ) ) ( not ( = ?auto_9035 ?auto_9038 ) ) ( not ( = ?auto_9036 ?auto_9037 ) ) ( not ( = ?auto_9036 ?auto_9038 ) ) ( not ( = ?auto_9037 ?auto_9038 ) ) ( ON ?auto_9038 ?auto_9039 ) ( not ( = ?auto_9035 ?auto_9039 ) ) ( not ( = ?auto_9036 ?auto_9039 ) ) ( not ( = ?auto_9037 ?auto_9039 ) ) ( not ( = ?auto_9038 ?auto_9039 ) ) ( ON ?auto_9037 ?auto_9038 ) ( ON-TABLE ?auto_9039 ) ( ON ?auto_9036 ?auto_9037 ) ( CLEAR ?auto_9036 ) ( HOLDING ?auto_9035 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9035 )
      ( MAKE-4PILE ?auto_9035 ?auto_9036 ?auto_9037 ?auto_9038 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9040 - BLOCK
      ?auto_9041 - BLOCK
      ?auto_9042 - BLOCK
      ?auto_9043 - BLOCK
    )
    :vars
    (
      ?auto_9044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9040 ?auto_9041 ) ) ( not ( = ?auto_9040 ?auto_9042 ) ) ( not ( = ?auto_9040 ?auto_9043 ) ) ( not ( = ?auto_9041 ?auto_9042 ) ) ( not ( = ?auto_9041 ?auto_9043 ) ) ( not ( = ?auto_9042 ?auto_9043 ) ) ( ON ?auto_9043 ?auto_9044 ) ( not ( = ?auto_9040 ?auto_9044 ) ) ( not ( = ?auto_9041 ?auto_9044 ) ) ( not ( = ?auto_9042 ?auto_9044 ) ) ( not ( = ?auto_9043 ?auto_9044 ) ) ( ON ?auto_9042 ?auto_9043 ) ( ON-TABLE ?auto_9044 ) ( ON ?auto_9041 ?auto_9042 ) ( ON ?auto_9040 ?auto_9041 ) ( CLEAR ?auto_9040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9044 ?auto_9043 ?auto_9042 ?auto_9041 )
      ( MAKE-4PILE ?auto_9040 ?auto_9041 ?auto_9042 ?auto_9043 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9085 - BLOCK
    )
    :vars
    (
      ?auto_9086 - BLOCK
      ?auto_9087 - BLOCK
      ?auto_9088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9085 ?auto_9086 ) ( CLEAR ?auto_9085 ) ( not ( = ?auto_9085 ?auto_9086 ) ) ( HOLDING ?auto_9087 ) ( CLEAR ?auto_9088 ) ( not ( = ?auto_9085 ?auto_9087 ) ) ( not ( = ?auto_9085 ?auto_9088 ) ) ( not ( = ?auto_9086 ?auto_9087 ) ) ( not ( = ?auto_9086 ?auto_9088 ) ) ( not ( = ?auto_9087 ?auto_9088 ) ) )
    :subtasks
    ( ( !STACK ?auto_9087 ?auto_9088 )
      ( MAKE-1PILE ?auto_9085 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9089 - BLOCK
    )
    :vars
    (
      ?auto_9092 - BLOCK
      ?auto_9091 - BLOCK
      ?auto_9090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9089 ?auto_9092 ) ( not ( = ?auto_9089 ?auto_9092 ) ) ( CLEAR ?auto_9091 ) ( not ( = ?auto_9089 ?auto_9090 ) ) ( not ( = ?auto_9089 ?auto_9091 ) ) ( not ( = ?auto_9092 ?auto_9090 ) ) ( not ( = ?auto_9092 ?auto_9091 ) ) ( not ( = ?auto_9090 ?auto_9091 ) ) ( ON ?auto_9090 ?auto_9089 ) ( CLEAR ?auto_9090 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9092 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9092 ?auto_9089 )
      ( MAKE-1PILE ?auto_9089 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9093 - BLOCK
    )
    :vars
    (
      ?auto_9095 - BLOCK
      ?auto_9094 - BLOCK
      ?auto_9096 - BLOCK
      ?auto_9097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9093 ?auto_9095 ) ( not ( = ?auto_9093 ?auto_9095 ) ) ( not ( = ?auto_9093 ?auto_9094 ) ) ( not ( = ?auto_9093 ?auto_9096 ) ) ( not ( = ?auto_9095 ?auto_9094 ) ) ( not ( = ?auto_9095 ?auto_9096 ) ) ( not ( = ?auto_9094 ?auto_9096 ) ) ( ON ?auto_9094 ?auto_9093 ) ( CLEAR ?auto_9094 ) ( ON-TABLE ?auto_9095 ) ( HOLDING ?auto_9096 ) ( CLEAR ?auto_9097 ) ( ON-TABLE ?auto_9097 ) ( not ( = ?auto_9097 ?auto_9096 ) ) ( not ( = ?auto_9093 ?auto_9097 ) ) ( not ( = ?auto_9095 ?auto_9097 ) ) ( not ( = ?auto_9094 ?auto_9097 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9097 ?auto_9096 )
      ( MAKE-1PILE ?auto_9093 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9098 - BLOCK
    )
    :vars
    (
      ?auto_9102 - BLOCK
      ?auto_9100 - BLOCK
      ?auto_9101 - BLOCK
      ?auto_9099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9098 ?auto_9102 ) ( not ( = ?auto_9098 ?auto_9102 ) ) ( not ( = ?auto_9098 ?auto_9100 ) ) ( not ( = ?auto_9098 ?auto_9101 ) ) ( not ( = ?auto_9102 ?auto_9100 ) ) ( not ( = ?auto_9102 ?auto_9101 ) ) ( not ( = ?auto_9100 ?auto_9101 ) ) ( ON ?auto_9100 ?auto_9098 ) ( ON-TABLE ?auto_9102 ) ( CLEAR ?auto_9099 ) ( ON-TABLE ?auto_9099 ) ( not ( = ?auto_9099 ?auto_9101 ) ) ( not ( = ?auto_9098 ?auto_9099 ) ) ( not ( = ?auto_9102 ?auto_9099 ) ) ( not ( = ?auto_9100 ?auto_9099 ) ) ( ON ?auto_9101 ?auto_9100 ) ( CLEAR ?auto_9101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9102 ?auto_9098 ?auto_9100 )
      ( MAKE-1PILE ?auto_9098 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9103 - BLOCK
    )
    :vars
    (
      ?auto_9107 - BLOCK
      ?auto_9105 - BLOCK
      ?auto_9104 - BLOCK
      ?auto_9106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9103 ?auto_9107 ) ( not ( = ?auto_9103 ?auto_9107 ) ) ( not ( = ?auto_9103 ?auto_9105 ) ) ( not ( = ?auto_9103 ?auto_9104 ) ) ( not ( = ?auto_9107 ?auto_9105 ) ) ( not ( = ?auto_9107 ?auto_9104 ) ) ( not ( = ?auto_9105 ?auto_9104 ) ) ( ON ?auto_9105 ?auto_9103 ) ( ON-TABLE ?auto_9107 ) ( not ( = ?auto_9106 ?auto_9104 ) ) ( not ( = ?auto_9103 ?auto_9106 ) ) ( not ( = ?auto_9107 ?auto_9106 ) ) ( not ( = ?auto_9105 ?auto_9106 ) ) ( ON ?auto_9104 ?auto_9105 ) ( CLEAR ?auto_9104 ) ( HOLDING ?auto_9106 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9106 )
      ( MAKE-1PILE ?auto_9103 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9108 - BLOCK
    )
    :vars
    (
      ?auto_9112 - BLOCK
      ?auto_9110 - BLOCK
      ?auto_9111 - BLOCK
      ?auto_9109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9108 ?auto_9112 ) ( not ( = ?auto_9108 ?auto_9112 ) ) ( not ( = ?auto_9108 ?auto_9110 ) ) ( not ( = ?auto_9108 ?auto_9111 ) ) ( not ( = ?auto_9112 ?auto_9110 ) ) ( not ( = ?auto_9112 ?auto_9111 ) ) ( not ( = ?auto_9110 ?auto_9111 ) ) ( ON ?auto_9110 ?auto_9108 ) ( ON-TABLE ?auto_9112 ) ( not ( = ?auto_9109 ?auto_9111 ) ) ( not ( = ?auto_9108 ?auto_9109 ) ) ( not ( = ?auto_9112 ?auto_9109 ) ) ( not ( = ?auto_9110 ?auto_9109 ) ) ( ON ?auto_9111 ?auto_9110 ) ( ON ?auto_9109 ?auto_9111 ) ( CLEAR ?auto_9109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9112 ?auto_9108 ?auto_9110 ?auto_9111 )
      ( MAKE-1PILE ?auto_9108 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9118 - BLOCK
      ?auto_9119 - BLOCK
    )
    :vars
    (
      ?auto_9120 - BLOCK
      ?auto_9121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9120 ?auto_9119 ) ( CLEAR ?auto_9120 ) ( ON-TABLE ?auto_9118 ) ( ON ?auto_9119 ?auto_9118 ) ( not ( = ?auto_9118 ?auto_9119 ) ) ( not ( = ?auto_9118 ?auto_9120 ) ) ( not ( = ?auto_9119 ?auto_9120 ) ) ( HOLDING ?auto_9121 ) ( not ( = ?auto_9118 ?auto_9121 ) ) ( not ( = ?auto_9119 ?auto_9121 ) ) ( not ( = ?auto_9120 ?auto_9121 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_9121 )
      ( MAKE-2PILE ?auto_9118 ?auto_9119 ) )
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
    ( and ( not ( = ?auto_9155 ?auto_9156 ) ) ( ON ?auto_9156 ?auto_9157 ) ( not ( = ?auto_9155 ?auto_9157 ) ) ( not ( = ?auto_9156 ?auto_9157 ) ) ( ON ?auto_9155 ?auto_9156 ) ( CLEAR ?auto_9155 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9158 ) ( ON ?auto_9157 ?auto_9158 ) ( not ( = ?auto_9158 ?auto_9157 ) ) ( not ( = ?auto_9158 ?auto_9156 ) ) ( not ( = ?auto_9158 ?auto_9155 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9158 ?auto_9157 ?auto_9156 )
      ( MAKE-2PILE ?auto_9155 ?auto_9156 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9161 - BLOCK
      ?auto_9162 - BLOCK
    )
    :vars
    (
      ?auto_9163 - BLOCK
      ?auto_9164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9161 ?auto_9162 ) ) ( ON ?auto_9162 ?auto_9163 ) ( CLEAR ?auto_9162 ) ( not ( = ?auto_9161 ?auto_9163 ) ) ( not ( = ?auto_9162 ?auto_9163 ) ) ( ON ?auto_9161 ?auto_9164 ) ( CLEAR ?auto_9161 ) ( HAND-EMPTY ) ( not ( = ?auto_9161 ?auto_9164 ) ) ( not ( = ?auto_9162 ?auto_9164 ) ) ( not ( = ?auto_9163 ?auto_9164 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9161 ?auto_9164 )
      ( MAKE-2PILE ?auto_9161 ?auto_9162 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9165 - BLOCK
      ?auto_9166 - BLOCK
    )
    :vars
    (
      ?auto_9167 - BLOCK
      ?auto_9168 - BLOCK
      ?auto_9169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9165 ?auto_9166 ) ) ( not ( = ?auto_9165 ?auto_9167 ) ) ( not ( = ?auto_9166 ?auto_9167 ) ) ( ON ?auto_9165 ?auto_9168 ) ( CLEAR ?auto_9165 ) ( not ( = ?auto_9165 ?auto_9168 ) ) ( not ( = ?auto_9166 ?auto_9168 ) ) ( not ( = ?auto_9167 ?auto_9168 ) ) ( HOLDING ?auto_9166 ) ( CLEAR ?auto_9167 ) ( ON-TABLE ?auto_9169 ) ( ON ?auto_9167 ?auto_9169 ) ( not ( = ?auto_9169 ?auto_9167 ) ) ( not ( = ?auto_9169 ?auto_9166 ) ) ( not ( = ?auto_9165 ?auto_9169 ) ) ( not ( = ?auto_9168 ?auto_9169 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9169 ?auto_9167 ?auto_9166 )
      ( MAKE-2PILE ?auto_9165 ?auto_9166 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9170 - BLOCK
      ?auto_9171 - BLOCK
    )
    :vars
    (
      ?auto_9174 - BLOCK
      ?auto_9172 - BLOCK
      ?auto_9173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9170 ?auto_9171 ) ) ( not ( = ?auto_9170 ?auto_9174 ) ) ( not ( = ?auto_9171 ?auto_9174 ) ) ( ON ?auto_9170 ?auto_9172 ) ( not ( = ?auto_9170 ?auto_9172 ) ) ( not ( = ?auto_9171 ?auto_9172 ) ) ( not ( = ?auto_9174 ?auto_9172 ) ) ( CLEAR ?auto_9174 ) ( ON-TABLE ?auto_9173 ) ( ON ?auto_9174 ?auto_9173 ) ( not ( = ?auto_9173 ?auto_9174 ) ) ( not ( = ?auto_9173 ?auto_9171 ) ) ( not ( = ?auto_9170 ?auto_9173 ) ) ( not ( = ?auto_9172 ?auto_9173 ) ) ( ON ?auto_9171 ?auto_9170 ) ( CLEAR ?auto_9171 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9172 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9172 ?auto_9170 )
      ( MAKE-2PILE ?auto_9170 ?auto_9171 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9175 - BLOCK
      ?auto_9176 - BLOCK
    )
    :vars
    (
      ?auto_9177 - BLOCK
      ?auto_9178 - BLOCK
      ?auto_9179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9175 ?auto_9176 ) ) ( not ( = ?auto_9175 ?auto_9177 ) ) ( not ( = ?auto_9176 ?auto_9177 ) ) ( ON ?auto_9175 ?auto_9178 ) ( not ( = ?auto_9175 ?auto_9178 ) ) ( not ( = ?auto_9176 ?auto_9178 ) ) ( not ( = ?auto_9177 ?auto_9178 ) ) ( ON-TABLE ?auto_9179 ) ( not ( = ?auto_9179 ?auto_9177 ) ) ( not ( = ?auto_9179 ?auto_9176 ) ) ( not ( = ?auto_9175 ?auto_9179 ) ) ( not ( = ?auto_9178 ?auto_9179 ) ) ( ON ?auto_9176 ?auto_9175 ) ( CLEAR ?auto_9176 ) ( ON-TABLE ?auto_9178 ) ( HOLDING ?auto_9177 ) ( CLEAR ?auto_9179 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9179 ?auto_9177 )
      ( MAKE-2PILE ?auto_9175 ?auto_9176 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9180 - BLOCK
      ?auto_9181 - BLOCK
    )
    :vars
    (
      ?auto_9182 - BLOCK
      ?auto_9183 - BLOCK
      ?auto_9184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9180 ?auto_9181 ) ) ( not ( = ?auto_9180 ?auto_9182 ) ) ( not ( = ?auto_9181 ?auto_9182 ) ) ( ON ?auto_9180 ?auto_9183 ) ( not ( = ?auto_9180 ?auto_9183 ) ) ( not ( = ?auto_9181 ?auto_9183 ) ) ( not ( = ?auto_9182 ?auto_9183 ) ) ( ON-TABLE ?auto_9184 ) ( not ( = ?auto_9184 ?auto_9182 ) ) ( not ( = ?auto_9184 ?auto_9181 ) ) ( not ( = ?auto_9180 ?auto_9184 ) ) ( not ( = ?auto_9183 ?auto_9184 ) ) ( ON ?auto_9181 ?auto_9180 ) ( ON-TABLE ?auto_9183 ) ( CLEAR ?auto_9184 ) ( ON ?auto_9182 ?auto_9181 ) ( CLEAR ?auto_9182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9183 ?auto_9180 ?auto_9181 )
      ( MAKE-2PILE ?auto_9180 ?auto_9181 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9185 - BLOCK
      ?auto_9186 - BLOCK
    )
    :vars
    (
      ?auto_9188 - BLOCK
      ?auto_9189 - BLOCK
      ?auto_9187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9185 ?auto_9186 ) ) ( not ( = ?auto_9185 ?auto_9188 ) ) ( not ( = ?auto_9186 ?auto_9188 ) ) ( ON ?auto_9185 ?auto_9189 ) ( not ( = ?auto_9185 ?auto_9189 ) ) ( not ( = ?auto_9186 ?auto_9189 ) ) ( not ( = ?auto_9188 ?auto_9189 ) ) ( not ( = ?auto_9187 ?auto_9188 ) ) ( not ( = ?auto_9187 ?auto_9186 ) ) ( not ( = ?auto_9185 ?auto_9187 ) ) ( not ( = ?auto_9189 ?auto_9187 ) ) ( ON ?auto_9186 ?auto_9185 ) ( ON-TABLE ?auto_9189 ) ( ON ?auto_9188 ?auto_9186 ) ( CLEAR ?auto_9188 ) ( HOLDING ?auto_9187 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9187 )
      ( MAKE-2PILE ?auto_9185 ?auto_9186 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9190 - BLOCK
      ?auto_9191 - BLOCK
    )
    :vars
    (
      ?auto_9194 - BLOCK
      ?auto_9193 - BLOCK
      ?auto_9192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9190 ?auto_9191 ) ) ( not ( = ?auto_9190 ?auto_9194 ) ) ( not ( = ?auto_9191 ?auto_9194 ) ) ( ON ?auto_9190 ?auto_9193 ) ( not ( = ?auto_9190 ?auto_9193 ) ) ( not ( = ?auto_9191 ?auto_9193 ) ) ( not ( = ?auto_9194 ?auto_9193 ) ) ( not ( = ?auto_9192 ?auto_9194 ) ) ( not ( = ?auto_9192 ?auto_9191 ) ) ( not ( = ?auto_9190 ?auto_9192 ) ) ( not ( = ?auto_9193 ?auto_9192 ) ) ( ON ?auto_9191 ?auto_9190 ) ( ON-TABLE ?auto_9193 ) ( ON ?auto_9194 ?auto_9191 ) ( ON ?auto_9192 ?auto_9194 ) ( CLEAR ?auto_9192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9193 ?auto_9190 ?auto_9191 ?auto_9194 )
      ( MAKE-2PILE ?auto_9190 ?auto_9191 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9206 - BLOCK
    )
    :vars
    (
      ?auto_9207 - BLOCK
      ?auto_9209 - BLOCK
      ?auto_9208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9207 ?auto_9206 ) ( ON-TABLE ?auto_9206 ) ( not ( = ?auto_9206 ?auto_9207 ) ) ( not ( = ?auto_9206 ?auto_9209 ) ) ( not ( = ?auto_9206 ?auto_9208 ) ) ( not ( = ?auto_9207 ?auto_9209 ) ) ( not ( = ?auto_9207 ?auto_9208 ) ) ( not ( = ?auto_9209 ?auto_9208 ) ) ( ON ?auto_9209 ?auto_9207 ) ( CLEAR ?auto_9209 ) ( HOLDING ?auto_9208 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9208 )
      ( MAKE-1PILE ?auto_9206 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9239 - BLOCK
      ?auto_9240 - BLOCK
      ?auto_9241 - BLOCK
    )
    :vars
    (
      ?auto_9242 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9239 ) ( not ( = ?auto_9239 ?auto_9240 ) ) ( not ( = ?auto_9239 ?auto_9241 ) ) ( not ( = ?auto_9240 ?auto_9241 ) ) ( ON ?auto_9241 ?auto_9242 ) ( not ( = ?auto_9239 ?auto_9242 ) ) ( not ( = ?auto_9240 ?auto_9242 ) ) ( not ( = ?auto_9241 ?auto_9242 ) ) ( CLEAR ?auto_9239 ) ( ON ?auto_9240 ?auto_9241 ) ( CLEAR ?auto_9240 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9242 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9242 ?auto_9241 )
      ( MAKE-3PILE ?auto_9239 ?auto_9240 ?auto_9241 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9243 - BLOCK
      ?auto_9244 - BLOCK
      ?auto_9245 - BLOCK
    )
    :vars
    (
      ?auto_9246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9243 ?auto_9244 ) ) ( not ( = ?auto_9243 ?auto_9245 ) ) ( not ( = ?auto_9244 ?auto_9245 ) ) ( ON ?auto_9245 ?auto_9246 ) ( not ( = ?auto_9243 ?auto_9246 ) ) ( not ( = ?auto_9244 ?auto_9246 ) ) ( not ( = ?auto_9245 ?auto_9246 ) ) ( ON ?auto_9244 ?auto_9245 ) ( CLEAR ?auto_9244 ) ( ON-TABLE ?auto_9246 ) ( HOLDING ?auto_9243 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9243 )
      ( MAKE-3PILE ?auto_9243 ?auto_9244 ?auto_9245 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9247 - BLOCK
      ?auto_9248 - BLOCK
      ?auto_9249 - BLOCK
    )
    :vars
    (
      ?auto_9250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9247 ?auto_9248 ) ) ( not ( = ?auto_9247 ?auto_9249 ) ) ( not ( = ?auto_9248 ?auto_9249 ) ) ( ON ?auto_9249 ?auto_9250 ) ( not ( = ?auto_9247 ?auto_9250 ) ) ( not ( = ?auto_9248 ?auto_9250 ) ) ( not ( = ?auto_9249 ?auto_9250 ) ) ( ON ?auto_9248 ?auto_9249 ) ( ON-TABLE ?auto_9250 ) ( ON ?auto_9247 ?auto_9248 ) ( CLEAR ?auto_9247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9250 ?auto_9249 ?auto_9248 )
      ( MAKE-3PILE ?auto_9247 ?auto_9248 ?auto_9249 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9254 - BLOCK
      ?auto_9255 - BLOCK
      ?auto_9256 - BLOCK
    )
    :vars
    (
      ?auto_9257 - BLOCK
      ?auto_9258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9254 ?auto_9255 ) ) ( not ( = ?auto_9254 ?auto_9256 ) ) ( not ( = ?auto_9255 ?auto_9256 ) ) ( ON ?auto_9256 ?auto_9257 ) ( not ( = ?auto_9254 ?auto_9257 ) ) ( not ( = ?auto_9255 ?auto_9257 ) ) ( not ( = ?auto_9256 ?auto_9257 ) ) ( ON ?auto_9255 ?auto_9256 ) ( CLEAR ?auto_9255 ) ( ON-TABLE ?auto_9257 ) ( ON ?auto_9254 ?auto_9258 ) ( CLEAR ?auto_9254 ) ( HAND-EMPTY ) ( not ( = ?auto_9254 ?auto_9258 ) ) ( not ( = ?auto_9255 ?auto_9258 ) ) ( not ( = ?auto_9256 ?auto_9258 ) ) ( not ( = ?auto_9257 ?auto_9258 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9254 ?auto_9258 )
      ( MAKE-3PILE ?auto_9254 ?auto_9255 ?auto_9256 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9259 - BLOCK
      ?auto_9260 - BLOCK
      ?auto_9261 - BLOCK
    )
    :vars
    (
      ?auto_9263 - BLOCK
      ?auto_9262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9259 ?auto_9260 ) ) ( not ( = ?auto_9259 ?auto_9261 ) ) ( not ( = ?auto_9260 ?auto_9261 ) ) ( ON ?auto_9261 ?auto_9263 ) ( not ( = ?auto_9259 ?auto_9263 ) ) ( not ( = ?auto_9260 ?auto_9263 ) ) ( not ( = ?auto_9261 ?auto_9263 ) ) ( ON-TABLE ?auto_9263 ) ( ON ?auto_9259 ?auto_9262 ) ( CLEAR ?auto_9259 ) ( not ( = ?auto_9259 ?auto_9262 ) ) ( not ( = ?auto_9260 ?auto_9262 ) ) ( not ( = ?auto_9261 ?auto_9262 ) ) ( not ( = ?auto_9263 ?auto_9262 ) ) ( HOLDING ?auto_9260 ) ( CLEAR ?auto_9261 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9263 ?auto_9261 ?auto_9260 )
      ( MAKE-3PILE ?auto_9259 ?auto_9260 ?auto_9261 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9264 - BLOCK
      ?auto_9265 - BLOCK
      ?auto_9266 - BLOCK
    )
    :vars
    (
      ?auto_9268 - BLOCK
      ?auto_9267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9264 ?auto_9265 ) ) ( not ( = ?auto_9264 ?auto_9266 ) ) ( not ( = ?auto_9265 ?auto_9266 ) ) ( ON ?auto_9266 ?auto_9268 ) ( not ( = ?auto_9264 ?auto_9268 ) ) ( not ( = ?auto_9265 ?auto_9268 ) ) ( not ( = ?auto_9266 ?auto_9268 ) ) ( ON-TABLE ?auto_9268 ) ( ON ?auto_9264 ?auto_9267 ) ( not ( = ?auto_9264 ?auto_9267 ) ) ( not ( = ?auto_9265 ?auto_9267 ) ) ( not ( = ?auto_9266 ?auto_9267 ) ) ( not ( = ?auto_9268 ?auto_9267 ) ) ( CLEAR ?auto_9266 ) ( ON ?auto_9265 ?auto_9264 ) ( CLEAR ?auto_9265 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9267 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9267 ?auto_9264 )
      ( MAKE-3PILE ?auto_9264 ?auto_9265 ?auto_9266 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9269 - BLOCK
      ?auto_9270 - BLOCK
      ?auto_9271 - BLOCK
    )
    :vars
    (
      ?auto_9272 - BLOCK
      ?auto_9273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9269 ?auto_9270 ) ) ( not ( = ?auto_9269 ?auto_9271 ) ) ( not ( = ?auto_9270 ?auto_9271 ) ) ( not ( = ?auto_9269 ?auto_9272 ) ) ( not ( = ?auto_9270 ?auto_9272 ) ) ( not ( = ?auto_9271 ?auto_9272 ) ) ( ON-TABLE ?auto_9272 ) ( ON ?auto_9269 ?auto_9273 ) ( not ( = ?auto_9269 ?auto_9273 ) ) ( not ( = ?auto_9270 ?auto_9273 ) ) ( not ( = ?auto_9271 ?auto_9273 ) ) ( not ( = ?auto_9272 ?auto_9273 ) ) ( ON ?auto_9270 ?auto_9269 ) ( CLEAR ?auto_9270 ) ( ON-TABLE ?auto_9273 ) ( HOLDING ?auto_9271 ) ( CLEAR ?auto_9272 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9272 ?auto_9271 )
      ( MAKE-3PILE ?auto_9269 ?auto_9270 ?auto_9271 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9274 - BLOCK
      ?auto_9275 - BLOCK
      ?auto_9276 - BLOCK
    )
    :vars
    (
      ?auto_9277 - BLOCK
      ?auto_9278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9274 ?auto_9275 ) ) ( not ( = ?auto_9274 ?auto_9276 ) ) ( not ( = ?auto_9275 ?auto_9276 ) ) ( not ( = ?auto_9274 ?auto_9277 ) ) ( not ( = ?auto_9275 ?auto_9277 ) ) ( not ( = ?auto_9276 ?auto_9277 ) ) ( ON-TABLE ?auto_9277 ) ( ON ?auto_9274 ?auto_9278 ) ( not ( = ?auto_9274 ?auto_9278 ) ) ( not ( = ?auto_9275 ?auto_9278 ) ) ( not ( = ?auto_9276 ?auto_9278 ) ) ( not ( = ?auto_9277 ?auto_9278 ) ) ( ON ?auto_9275 ?auto_9274 ) ( ON-TABLE ?auto_9278 ) ( CLEAR ?auto_9277 ) ( ON ?auto_9276 ?auto_9275 ) ( CLEAR ?auto_9276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9278 ?auto_9274 ?auto_9275 )
      ( MAKE-3PILE ?auto_9274 ?auto_9275 ?auto_9276 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9279 - BLOCK
      ?auto_9280 - BLOCK
      ?auto_9281 - BLOCK
    )
    :vars
    (
      ?auto_9282 - BLOCK
      ?auto_9283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9279 ?auto_9280 ) ) ( not ( = ?auto_9279 ?auto_9281 ) ) ( not ( = ?auto_9280 ?auto_9281 ) ) ( not ( = ?auto_9279 ?auto_9282 ) ) ( not ( = ?auto_9280 ?auto_9282 ) ) ( not ( = ?auto_9281 ?auto_9282 ) ) ( ON ?auto_9279 ?auto_9283 ) ( not ( = ?auto_9279 ?auto_9283 ) ) ( not ( = ?auto_9280 ?auto_9283 ) ) ( not ( = ?auto_9281 ?auto_9283 ) ) ( not ( = ?auto_9282 ?auto_9283 ) ) ( ON ?auto_9280 ?auto_9279 ) ( ON-TABLE ?auto_9283 ) ( ON ?auto_9281 ?auto_9280 ) ( CLEAR ?auto_9281 ) ( HOLDING ?auto_9282 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9282 )
      ( MAKE-3PILE ?auto_9279 ?auto_9280 ?auto_9281 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9284 - BLOCK
      ?auto_9285 - BLOCK
      ?auto_9286 - BLOCK
    )
    :vars
    (
      ?auto_9287 - BLOCK
      ?auto_9288 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9284 ?auto_9285 ) ) ( not ( = ?auto_9284 ?auto_9286 ) ) ( not ( = ?auto_9285 ?auto_9286 ) ) ( not ( = ?auto_9284 ?auto_9287 ) ) ( not ( = ?auto_9285 ?auto_9287 ) ) ( not ( = ?auto_9286 ?auto_9287 ) ) ( ON ?auto_9284 ?auto_9288 ) ( not ( = ?auto_9284 ?auto_9288 ) ) ( not ( = ?auto_9285 ?auto_9288 ) ) ( not ( = ?auto_9286 ?auto_9288 ) ) ( not ( = ?auto_9287 ?auto_9288 ) ) ( ON ?auto_9285 ?auto_9284 ) ( ON-TABLE ?auto_9288 ) ( ON ?auto_9286 ?auto_9285 ) ( ON ?auto_9287 ?auto_9286 ) ( CLEAR ?auto_9287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9288 ?auto_9284 ?auto_9285 ?auto_9286 )
      ( MAKE-3PILE ?auto_9284 ?auto_9285 ?auto_9286 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9297 - BLOCK
      ?auto_9298 - BLOCK
      ?auto_9299 - BLOCK
      ?auto_9300 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9299 ) ( ON-TABLE ?auto_9297 ) ( ON ?auto_9298 ?auto_9297 ) ( ON ?auto_9299 ?auto_9298 ) ( not ( = ?auto_9297 ?auto_9298 ) ) ( not ( = ?auto_9297 ?auto_9299 ) ) ( not ( = ?auto_9297 ?auto_9300 ) ) ( not ( = ?auto_9298 ?auto_9299 ) ) ( not ( = ?auto_9298 ?auto_9300 ) ) ( not ( = ?auto_9299 ?auto_9300 ) ) ( ON-TABLE ?auto_9300 ) ( CLEAR ?auto_9300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_9300 )
      ( MAKE-4PILE ?auto_9297 ?auto_9298 ?auto_9299 ?auto_9300 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9301 - BLOCK
      ?auto_9302 - BLOCK
      ?auto_9303 - BLOCK
      ?auto_9304 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9301 ) ( ON ?auto_9302 ?auto_9301 ) ( not ( = ?auto_9301 ?auto_9302 ) ) ( not ( = ?auto_9301 ?auto_9303 ) ) ( not ( = ?auto_9301 ?auto_9304 ) ) ( not ( = ?auto_9302 ?auto_9303 ) ) ( not ( = ?auto_9302 ?auto_9304 ) ) ( not ( = ?auto_9303 ?auto_9304 ) ) ( ON-TABLE ?auto_9304 ) ( CLEAR ?auto_9304 ) ( HOLDING ?auto_9303 ) ( CLEAR ?auto_9302 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9301 ?auto_9302 ?auto_9303 )
      ( MAKE-4PILE ?auto_9301 ?auto_9302 ?auto_9303 ?auto_9304 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9305 - BLOCK
      ?auto_9306 - BLOCK
      ?auto_9307 - BLOCK
      ?auto_9308 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9305 ) ( ON ?auto_9306 ?auto_9305 ) ( not ( = ?auto_9305 ?auto_9306 ) ) ( not ( = ?auto_9305 ?auto_9307 ) ) ( not ( = ?auto_9305 ?auto_9308 ) ) ( not ( = ?auto_9306 ?auto_9307 ) ) ( not ( = ?auto_9306 ?auto_9308 ) ) ( not ( = ?auto_9307 ?auto_9308 ) ) ( ON-TABLE ?auto_9308 ) ( CLEAR ?auto_9306 ) ( ON ?auto_9307 ?auto_9308 ) ( CLEAR ?auto_9307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9308 )
      ( MAKE-4PILE ?auto_9305 ?auto_9306 ?auto_9307 ?auto_9308 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9309 - BLOCK
      ?auto_9310 - BLOCK
      ?auto_9311 - BLOCK
      ?auto_9312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9309 ) ( not ( = ?auto_9309 ?auto_9310 ) ) ( not ( = ?auto_9309 ?auto_9311 ) ) ( not ( = ?auto_9309 ?auto_9312 ) ) ( not ( = ?auto_9310 ?auto_9311 ) ) ( not ( = ?auto_9310 ?auto_9312 ) ) ( not ( = ?auto_9311 ?auto_9312 ) ) ( ON-TABLE ?auto_9312 ) ( ON ?auto_9311 ?auto_9312 ) ( CLEAR ?auto_9311 ) ( HOLDING ?auto_9310 ) ( CLEAR ?auto_9309 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9309 ?auto_9310 )
      ( MAKE-4PILE ?auto_9309 ?auto_9310 ?auto_9311 ?auto_9312 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9313 - BLOCK
      ?auto_9314 - BLOCK
      ?auto_9315 - BLOCK
      ?auto_9316 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9313 ) ( not ( = ?auto_9313 ?auto_9314 ) ) ( not ( = ?auto_9313 ?auto_9315 ) ) ( not ( = ?auto_9313 ?auto_9316 ) ) ( not ( = ?auto_9314 ?auto_9315 ) ) ( not ( = ?auto_9314 ?auto_9316 ) ) ( not ( = ?auto_9315 ?auto_9316 ) ) ( ON-TABLE ?auto_9316 ) ( ON ?auto_9315 ?auto_9316 ) ( CLEAR ?auto_9313 ) ( ON ?auto_9314 ?auto_9315 ) ( CLEAR ?auto_9314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9316 ?auto_9315 )
      ( MAKE-4PILE ?auto_9313 ?auto_9314 ?auto_9315 ?auto_9316 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9317 - BLOCK
      ?auto_9318 - BLOCK
      ?auto_9319 - BLOCK
      ?auto_9320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9317 ?auto_9318 ) ) ( not ( = ?auto_9317 ?auto_9319 ) ) ( not ( = ?auto_9317 ?auto_9320 ) ) ( not ( = ?auto_9318 ?auto_9319 ) ) ( not ( = ?auto_9318 ?auto_9320 ) ) ( not ( = ?auto_9319 ?auto_9320 ) ) ( ON-TABLE ?auto_9320 ) ( ON ?auto_9319 ?auto_9320 ) ( ON ?auto_9318 ?auto_9319 ) ( CLEAR ?auto_9318 ) ( HOLDING ?auto_9317 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9317 )
      ( MAKE-4PILE ?auto_9317 ?auto_9318 ?auto_9319 ?auto_9320 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9321 - BLOCK
      ?auto_9322 - BLOCK
      ?auto_9323 - BLOCK
      ?auto_9324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9321 ?auto_9322 ) ) ( not ( = ?auto_9321 ?auto_9323 ) ) ( not ( = ?auto_9321 ?auto_9324 ) ) ( not ( = ?auto_9322 ?auto_9323 ) ) ( not ( = ?auto_9322 ?auto_9324 ) ) ( not ( = ?auto_9323 ?auto_9324 ) ) ( ON-TABLE ?auto_9324 ) ( ON ?auto_9323 ?auto_9324 ) ( ON ?auto_9322 ?auto_9323 ) ( ON ?auto_9321 ?auto_9322 ) ( CLEAR ?auto_9321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9324 ?auto_9323 ?auto_9322 )
      ( MAKE-4PILE ?auto_9321 ?auto_9322 ?auto_9323 ?auto_9324 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9329 - BLOCK
      ?auto_9330 - BLOCK
      ?auto_9331 - BLOCK
      ?auto_9332 - BLOCK
    )
    :vars
    (
      ?auto_9333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9329 ?auto_9330 ) ) ( not ( = ?auto_9329 ?auto_9331 ) ) ( not ( = ?auto_9329 ?auto_9332 ) ) ( not ( = ?auto_9330 ?auto_9331 ) ) ( not ( = ?auto_9330 ?auto_9332 ) ) ( not ( = ?auto_9331 ?auto_9332 ) ) ( ON-TABLE ?auto_9332 ) ( ON ?auto_9331 ?auto_9332 ) ( ON ?auto_9330 ?auto_9331 ) ( CLEAR ?auto_9330 ) ( ON ?auto_9329 ?auto_9333 ) ( CLEAR ?auto_9329 ) ( HAND-EMPTY ) ( not ( = ?auto_9329 ?auto_9333 ) ) ( not ( = ?auto_9330 ?auto_9333 ) ) ( not ( = ?auto_9331 ?auto_9333 ) ) ( not ( = ?auto_9332 ?auto_9333 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9329 ?auto_9333 )
      ( MAKE-4PILE ?auto_9329 ?auto_9330 ?auto_9331 ?auto_9332 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9334 - BLOCK
      ?auto_9335 - BLOCK
      ?auto_9336 - BLOCK
      ?auto_9337 - BLOCK
    )
    :vars
    (
      ?auto_9338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9334 ?auto_9335 ) ) ( not ( = ?auto_9334 ?auto_9336 ) ) ( not ( = ?auto_9334 ?auto_9337 ) ) ( not ( = ?auto_9335 ?auto_9336 ) ) ( not ( = ?auto_9335 ?auto_9337 ) ) ( not ( = ?auto_9336 ?auto_9337 ) ) ( ON-TABLE ?auto_9337 ) ( ON ?auto_9336 ?auto_9337 ) ( ON ?auto_9334 ?auto_9338 ) ( CLEAR ?auto_9334 ) ( not ( = ?auto_9334 ?auto_9338 ) ) ( not ( = ?auto_9335 ?auto_9338 ) ) ( not ( = ?auto_9336 ?auto_9338 ) ) ( not ( = ?auto_9337 ?auto_9338 ) ) ( HOLDING ?auto_9335 ) ( CLEAR ?auto_9336 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9337 ?auto_9336 ?auto_9335 )
      ( MAKE-4PILE ?auto_9334 ?auto_9335 ?auto_9336 ?auto_9337 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9339 - BLOCK
      ?auto_9340 - BLOCK
      ?auto_9341 - BLOCK
      ?auto_9342 - BLOCK
    )
    :vars
    (
      ?auto_9343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9339 ?auto_9340 ) ) ( not ( = ?auto_9339 ?auto_9341 ) ) ( not ( = ?auto_9339 ?auto_9342 ) ) ( not ( = ?auto_9340 ?auto_9341 ) ) ( not ( = ?auto_9340 ?auto_9342 ) ) ( not ( = ?auto_9341 ?auto_9342 ) ) ( ON-TABLE ?auto_9342 ) ( ON ?auto_9341 ?auto_9342 ) ( ON ?auto_9339 ?auto_9343 ) ( not ( = ?auto_9339 ?auto_9343 ) ) ( not ( = ?auto_9340 ?auto_9343 ) ) ( not ( = ?auto_9341 ?auto_9343 ) ) ( not ( = ?auto_9342 ?auto_9343 ) ) ( CLEAR ?auto_9341 ) ( ON ?auto_9340 ?auto_9339 ) ( CLEAR ?auto_9340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9343 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9343 ?auto_9339 )
      ( MAKE-4PILE ?auto_9339 ?auto_9340 ?auto_9341 ?auto_9342 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9344 - BLOCK
      ?auto_9345 - BLOCK
      ?auto_9346 - BLOCK
      ?auto_9347 - BLOCK
    )
    :vars
    (
      ?auto_9348 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9344 ?auto_9345 ) ) ( not ( = ?auto_9344 ?auto_9346 ) ) ( not ( = ?auto_9344 ?auto_9347 ) ) ( not ( = ?auto_9345 ?auto_9346 ) ) ( not ( = ?auto_9345 ?auto_9347 ) ) ( not ( = ?auto_9346 ?auto_9347 ) ) ( ON-TABLE ?auto_9347 ) ( ON ?auto_9344 ?auto_9348 ) ( not ( = ?auto_9344 ?auto_9348 ) ) ( not ( = ?auto_9345 ?auto_9348 ) ) ( not ( = ?auto_9346 ?auto_9348 ) ) ( not ( = ?auto_9347 ?auto_9348 ) ) ( ON ?auto_9345 ?auto_9344 ) ( CLEAR ?auto_9345 ) ( ON-TABLE ?auto_9348 ) ( HOLDING ?auto_9346 ) ( CLEAR ?auto_9347 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9347 ?auto_9346 )
      ( MAKE-4PILE ?auto_9344 ?auto_9345 ?auto_9346 ?auto_9347 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9349 - BLOCK
      ?auto_9350 - BLOCK
      ?auto_9351 - BLOCK
      ?auto_9352 - BLOCK
    )
    :vars
    (
      ?auto_9353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9349 ?auto_9350 ) ) ( not ( = ?auto_9349 ?auto_9351 ) ) ( not ( = ?auto_9349 ?auto_9352 ) ) ( not ( = ?auto_9350 ?auto_9351 ) ) ( not ( = ?auto_9350 ?auto_9352 ) ) ( not ( = ?auto_9351 ?auto_9352 ) ) ( ON-TABLE ?auto_9352 ) ( ON ?auto_9349 ?auto_9353 ) ( not ( = ?auto_9349 ?auto_9353 ) ) ( not ( = ?auto_9350 ?auto_9353 ) ) ( not ( = ?auto_9351 ?auto_9353 ) ) ( not ( = ?auto_9352 ?auto_9353 ) ) ( ON ?auto_9350 ?auto_9349 ) ( ON-TABLE ?auto_9353 ) ( CLEAR ?auto_9352 ) ( ON ?auto_9351 ?auto_9350 ) ( CLEAR ?auto_9351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9353 ?auto_9349 ?auto_9350 )
      ( MAKE-4PILE ?auto_9349 ?auto_9350 ?auto_9351 ?auto_9352 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9354 - BLOCK
      ?auto_9355 - BLOCK
      ?auto_9356 - BLOCK
      ?auto_9357 - BLOCK
    )
    :vars
    (
      ?auto_9358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9354 ?auto_9355 ) ) ( not ( = ?auto_9354 ?auto_9356 ) ) ( not ( = ?auto_9354 ?auto_9357 ) ) ( not ( = ?auto_9355 ?auto_9356 ) ) ( not ( = ?auto_9355 ?auto_9357 ) ) ( not ( = ?auto_9356 ?auto_9357 ) ) ( ON ?auto_9354 ?auto_9358 ) ( not ( = ?auto_9354 ?auto_9358 ) ) ( not ( = ?auto_9355 ?auto_9358 ) ) ( not ( = ?auto_9356 ?auto_9358 ) ) ( not ( = ?auto_9357 ?auto_9358 ) ) ( ON ?auto_9355 ?auto_9354 ) ( ON-TABLE ?auto_9358 ) ( ON ?auto_9356 ?auto_9355 ) ( CLEAR ?auto_9356 ) ( HOLDING ?auto_9357 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9357 )
      ( MAKE-4PILE ?auto_9354 ?auto_9355 ?auto_9356 ?auto_9357 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9359 - BLOCK
      ?auto_9360 - BLOCK
      ?auto_9361 - BLOCK
      ?auto_9362 - BLOCK
    )
    :vars
    (
      ?auto_9363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9359 ?auto_9360 ) ) ( not ( = ?auto_9359 ?auto_9361 ) ) ( not ( = ?auto_9359 ?auto_9362 ) ) ( not ( = ?auto_9360 ?auto_9361 ) ) ( not ( = ?auto_9360 ?auto_9362 ) ) ( not ( = ?auto_9361 ?auto_9362 ) ) ( ON ?auto_9359 ?auto_9363 ) ( not ( = ?auto_9359 ?auto_9363 ) ) ( not ( = ?auto_9360 ?auto_9363 ) ) ( not ( = ?auto_9361 ?auto_9363 ) ) ( not ( = ?auto_9362 ?auto_9363 ) ) ( ON ?auto_9360 ?auto_9359 ) ( ON-TABLE ?auto_9363 ) ( ON ?auto_9361 ?auto_9360 ) ( ON ?auto_9362 ?auto_9361 ) ( CLEAR ?auto_9362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9363 ?auto_9359 ?auto_9360 ?auto_9361 )
      ( MAKE-4PILE ?auto_9359 ?auto_9360 ?auto_9361 ?auto_9362 ) )
  )

)

