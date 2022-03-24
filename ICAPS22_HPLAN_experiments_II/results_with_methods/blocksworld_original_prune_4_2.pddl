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
      ?auto_6908 - BLOCK
      ?auto_6909 - BLOCK
      ?auto_6910 - BLOCK
      ?auto_6911 - BLOCK
    )
    :vars
    (
      ?auto_6912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6912 ?auto_6911 ) ( CLEAR ?auto_6912 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6908 ) ( ON ?auto_6909 ?auto_6908 ) ( ON ?auto_6910 ?auto_6909 ) ( ON ?auto_6911 ?auto_6910 ) ( not ( = ?auto_6908 ?auto_6909 ) ) ( not ( = ?auto_6908 ?auto_6910 ) ) ( not ( = ?auto_6908 ?auto_6911 ) ) ( not ( = ?auto_6908 ?auto_6912 ) ) ( not ( = ?auto_6909 ?auto_6910 ) ) ( not ( = ?auto_6909 ?auto_6911 ) ) ( not ( = ?auto_6909 ?auto_6912 ) ) ( not ( = ?auto_6910 ?auto_6911 ) ) ( not ( = ?auto_6910 ?auto_6912 ) ) ( not ( = ?auto_6911 ?auto_6912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6912 ?auto_6911 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6914 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6914 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6914 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6915 - BLOCK
    )
    :vars
    (
      ?auto_6916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6915 ?auto_6916 ) ( CLEAR ?auto_6915 ) ( HAND-EMPTY ) ( not ( = ?auto_6915 ?auto_6916 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6915 ?auto_6916 )
      ( MAKE-1PILE ?auto_6915 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6920 - BLOCK
      ?auto_6921 - BLOCK
      ?auto_6922 - BLOCK
    )
    :vars
    (
      ?auto_6923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6923 ?auto_6922 ) ( CLEAR ?auto_6923 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6920 ) ( ON ?auto_6921 ?auto_6920 ) ( ON ?auto_6922 ?auto_6921 ) ( not ( = ?auto_6920 ?auto_6921 ) ) ( not ( = ?auto_6920 ?auto_6922 ) ) ( not ( = ?auto_6920 ?auto_6923 ) ) ( not ( = ?auto_6921 ?auto_6922 ) ) ( not ( = ?auto_6921 ?auto_6923 ) ) ( not ( = ?auto_6922 ?auto_6923 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6923 ?auto_6922 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6924 - BLOCK
      ?auto_6925 - BLOCK
      ?auto_6926 - BLOCK
    )
    :vars
    (
      ?auto_6927 - BLOCK
      ?auto_6928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6927 ?auto_6926 ) ( CLEAR ?auto_6927 ) ( ON-TABLE ?auto_6924 ) ( ON ?auto_6925 ?auto_6924 ) ( ON ?auto_6926 ?auto_6925 ) ( not ( = ?auto_6924 ?auto_6925 ) ) ( not ( = ?auto_6924 ?auto_6926 ) ) ( not ( = ?auto_6924 ?auto_6927 ) ) ( not ( = ?auto_6925 ?auto_6926 ) ) ( not ( = ?auto_6925 ?auto_6927 ) ) ( not ( = ?auto_6926 ?auto_6927 ) ) ( HOLDING ?auto_6928 ) ( not ( = ?auto_6924 ?auto_6928 ) ) ( not ( = ?auto_6925 ?auto_6928 ) ) ( not ( = ?auto_6926 ?auto_6928 ) ) ( not ( = ?auto_6927 ?auto_6928 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6928 )
      ( MAKE-3PILE ?auto_6924 ?auto_6925 ?auto_6926 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6929 - BLOCK
      ?auto_6930 - BLOCK
      ?auto_6931 - BLOCK
    )
    :vars
    (
      ?auto_6933 - BLOCK
      ?auto_6932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6933 ?auto_6931 ) ( ON-TABLE ?auto_6929 ) ( ON ?auto_6930 ?auto_6929 ) ( ON ?auto_6931 ?auto_6930 ) ( not ( = ?auto_6929 ?auto_6930 ) ) ( not ( = ?auto_6929 ?auto_6931 ) ) ( not ( = ?auto_6929 ?auto_6933 ) ) ( not ( = ?auto_6930 ?auto_6931 ) ) ( not ( = ?auto_6930 ?auto_6933 ) ) ( not ( = ?auto_6931 ?auto_6933 ) ) ( not ( = ?auto_6929 ?auto_6932 ) ) ( not ( = ?auto_6930 ?auto_6932 ) ) ( not ( = ?auto_6931 ?auto_6932 ) ) ( not ( = ?auto_6933 ?auto_6932 ) ) ( ON ?auto_6932 ?auto_6933 ) ( CLEAR ?auto_6932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6929 ?auto_6930 ?auto_6931 ?auto_6933 )
      ( MAKE-3PILE ?auto_6929 ?auto_6930 ?auto_6931 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6936 - BLOCK
      ?auto_6937 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6937 ) ( CLEAR ?auto_6936 ) ( ON-TABLE ?auto_6936 ) ( not ( = ?auto_6936 ?auto_6937 ) ) )
    :subtasks
    ( ( !STACK ?auto_6937 ?auto_6936 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6938 - BLOCK
      ?auto_6939 - BLOCK
    )
    :vars
    (
      ?auto_6940 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6938 ) ( ON-TABLE ?auto_6938 ) ( not ( = ?auto_6938 ?auto_6939 ) ) ( ON ?auto_6939 ?auto_6940 ) ( CLEAR ?auto_6939 ) ( HAND-EMPTY ) ( not ( = ?auto_6938 ?auto_6940 ) ) ( not ( = ?auto_6939 ?auto_6940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6939 ?auto_6940 )
      ( MAKE-2PILE ?auto_6938 ?auto_6939 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6941 - BLOCK
      ?auto_6942 - BLOCK
    )
    :vars
    (
      ?auto_6943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6941 ?auto_6942 ) ) ( ON ?auto_6942 ?auto_6943 ) ( CLEAR ?auto_6942 ) ( not ( = ?auto_6941 ?auto_6943 ) ) ( not ( = ?auto_6942 ?auto_6943 ) ) ( HOLDING ?auto_6941 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6941 )
      ( MAKE-2PILE ?auto_6941 ?auto_6942 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6944 - BLOCK
      ?auto_6945 - BLOCK
    )
    :vars
    (
      ?auto_6946 - BLOCK
      ?auto_6948 - BLOCK
      ?auto_6947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6944 ?auto_6945 ) ) ( ON ?auto_6945 ?auto_6946 ) ( not ( = ?auto_6944 ?auto_6946 ) ) ( not ( = ?auto_6945 ?auto_6946 ) ) ( ON ?auto_6944 ?auto_6945 ) ( CLEAR ?auto_6944 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6948 ) ( ON ?auto_6947 ?auto_6948 ) ( ON ?auto_6946 ?auto_6947 ) ( not ( = ?auto_6948 ?auto_6947 ) ) ( not ( = ?auto_6948 ?auto_6946 ) ) ( not ( = ?auto_6948 ?auto_6945 ) ) ( not ( = ?auto_6948 ?auto_6944 ) ) ( not ( = ?auto_6947 ?auto_6946 ) ) ( not ( = ?auto_6947 ?auto_6945 ) ) ( not ( = ?auto_6947 ?auto_6944 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6948 ?auto_6947 ?auto_6946 ?auto_6945 )
      ( MAKE-2PILE ?auto_6944 ?auto_6945 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6951 - BLOCK
      ?auto_6952 - BLOCK
    )
    :vars
    (
      ?auto_6953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6953 ?auto_6952 ) ( CLEAR ?auto_6953 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6951 ) ( ON ?auto_6952 ?auto_6951 ) ( not ( = ?auto_6951 ?auto_6952 ) ) ( not ( = ?auto_6951 ?auto_6953 ) ) ( not ( = ?auto_6952 ?auto_6953 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6953 ?auto_6952 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6954 - BLOCK
      ?auto_6955 - BLOCK
    )
    :vars
    (
      ?auto_6956 - BLOCK
      ?auto_6957 - BLOCK
      ?auto_6958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6956 ?auto_6955 ) ( CLEAR ?auto_6956 ) ( ON-TABLE ?auto_6954 ) ( ON ?auto_6955 ?auto_6954 ) ( not ( = ?auto_6954 ?auto_6955 ) ) ( not ( = ?auto_6954 ?auto_6956 ) ) ( not ( = ?auto_6955 ?auto_6956 ) ) ( HOLDING ?auto_6957 ) ( CLEAR ?auto_6958 ) ( not ( = ?auto_6954 ?auto_6957 ) ) ( not ( = ?auto_6954 ?auto_6958 ) ) ( not ( = ?auto_6955 ?auto_6957 ) ) ( not ( = ?auto_6955 ?auto_6958 ) ) ( not ( = ?auto_6956 ?auto_6957 ) ) ( not ( = ?auto_6956 ?auto_6958 ) ) ( not ( = ?auto_6957 ?auto_6958 ) ) )
    :subtasks
    ( ( !STACK ?auto_6957 ?auto_6958 )
      ( MAKE-2PILE ?auto_6954 ?auto_6955 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7154 - BLOCK
      ?auto_7155 - BLOCK
    )
    :vars
    (
      ?auto_7156 - BLOCK
      ?auto_7157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7156 ?auto_7155 ) ( ON-TABLE ?auto_7154 ) ( ON ?auto_7155 ?auto_7154 ) ( not ( = ?auto_7154 ?auto_7155 ) ) ( not ( = ?auto_7154 ?auto_7156 ) ) ( not ( = ?auto_7155 ?auto_7156 ) ) ( not ( = ?auto_7154 ?auto_7157 ) ) ( not ( = ?auto_7155 ?auto_7157 ) ) ( not ( = ?auto_7156 ?auto_7157 ) ) ( ON ?auto_7157 ?auto_7156 ) ( CLEAR ?auto_7157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7154 ?auto_7155 ?auto_7156 )
      ( MAKE-2PILE ?auto_7154 ?auto_7155 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6964 - BLOCK
      ?auto_6965 - BLOCK
    )
    :vars
    (
      ?auto_6967 - BLOCK
      ?auto_6966 - BLOCK
      ?auto_6968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6967 ?auto_6965 ) ( ON-TABLE ?auto_6964 ) ( ON ?auto_6965 ?auto_6964 ) ( not ( = ?auto_6964 ?auto_6965 ) ) ( not ( = ?auto_6964 ?auto_6967 ) ) ( not ( = ?auto_6965 ?auto_6967 ) ) ( not ( = ?auto_6964 ?auto_6966 ) ) ( not ( = ?auto_6964 ?auto_6968 ) ) ( not ( = ?auto_6965 ?auto_6966 ) ) ( not ( = ?auto_6965 ?auto_6968 ) ) ( not ( = ?auto_6967 ?auto_6966 ) ) ( not ( = ?auto_6967 ?auto_6968 ) ) ( not ( = ?auto_6966 ?auto_6968 ) ) ( ON ?auto_6966 ?auto_6967 ) ( CLEAR ?auto_6966 ) ( HOLDING ?auto_6968 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6968 )
      ( MAKE-2PILE ?auto_6964 ?auto_6965 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6969 - BLOCK
      ?auto_6970 - BLOCK
    )
    :vars
    (
      ?auto_6973 - BLOCK
      ?auto_6972 - BLOCK
      ?auto_6971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6973 ?auto_6970 ) ( ON-TABLE ?auto_6969 ) ( ON ?auto_6970 ?auto_6969 ) ( not ( = ?auto_6969 ?auto_6970 ) ) ( not ( = ?auto_6969 ?auto_6973 ) ) ( not ( = ?auto_6970 ?auto_6973 ) ) ( not ( = ?auto_6969 ?auto_6972 ) ) ( not ( = ?auto_6969 ?auto_6971 ) ) ( not ( = ?auto_6970 ?auto_6972 ) ) ( not ( = ?auto_6970 ?auto_6971 ) ) ( not ( = ?auto_6973 ?auto_6972 ) ) ( not ( = ?auto_6973 ?auto_6971 ) ) ( not ( = ?auto_6972 ?auto_6971 ) ) ( ON ?auto_6972 ?auto_6973 ) ( ON ?auto_6971 ?auto_6972 ) ( CLEAR ?auto_6971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6969 ?auto_6970 ?auto_6973 ?auto_6972 )
      ( MAKE-2PILE ?auto_6969 ?auto_6970 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6977 - BLOCK
      ?auto_6978 - BLOCK
      ?auto_6979 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6979 ) ( CLEAR ?auto_6978 ) ( ON-TABLE ?auto_6977 ) ( ON ?auto_6978 ?auto_6977 ) ( not ( = ?auto_6977 ?auto_6978 ) ) ( not ( = ?auto_6977 ?auto_6979 ) ) ( not ( = ?auto_6978 ?auto_6979 ) ) )
    :subtasks
    ( ( !STACK ?auto_6979 ?auto_6978 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6980 - BLOCK
      ?auto_6981 - BLOCK
      ?auto_6982 - BLOCK
    )
    :vars
    (
      ?auto_6983 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6981 ) ( ON-TABLE ?auto_6980 ) ( ON ?auto_6981 ?auto_6980 ) ( not ( = ?auto_6980 ?auto_6981 ) ) ( not ( = ?auto_6980 ?auto_6982 ) ) ( not ( = ?auto_6981 ?auto_6982 ) ) ( ON ?auto_6982 ?auto_6983 ) ( CLEAR ?auto_6982 ) ( HAND-EMPTY ) ( not ( = ?auto_6980 ?auto_6983 ) ) ( not ( = ?auto_6981 ?auto_6983 ) ) ( not ( = ?auto_6982 ?auto_6983 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6982 ?auto_6983 )
      ( MAKE-3PILE ?auto_6980 ?auto_6981 ?auto_6982 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6984 - BLOCK
      ?auto_6985 - BLOCK
      ?auto_6986 - BLOCK
    )
    :vars
    (
      ?auto_6987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6984 ) ( not ( = ?auto_6984 ?auto_6985 ) ) ( not ( = ?auto_6984 ?auto_6986 ) ) ( not ( = ?auto_6985 ?auto_6986 ) ) ( ON ?auto_6986 ?auto_6987 ) ( CLEAR ?auto_6986 ) ( not ( = ?auto_6984 ?auto_6987 ) ) ( not ( = ?auto_6985 ?auto_6987 ) ) ( not ( = ?auto_6986 ?auto_6987 ) ) ( HOLDING ?auto_6985 ) ( CLEAR ?auto_6984 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6984 ?auto_6985 )
      ( MAKE-3PILE ?auto_6984 ?auto_6985 ?auto_6986 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6988 - BLOCK
      ?auto_6989 - BLOCK
      ?auto_6990 - BLOCK
    )
    :vars
    (
      ?auto_6991 - BLOCK
      ?auto_6992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6988 ) ( not ( = ?auto_6988 ?auto_6989 ) ) ( not ( = ?auto_6988 ?auto_6990 ) ) ( not ( = ?auto_6989 ?auto_6990 ) ) ( ON ?auto_6990 ?auto_6991 ) ( not ( = ?auto_6988 ?auto_6991 ) ) ( not ( = ?auto_6989 ?auto_6991 ) ) ( not ( = ?auto_6990 ?auto_6991 ) ) ( CLEAR ?auto_6988 ) ( ON ?auto_6989 ?auto_6990 ) ( CLEAR ?auto_6989 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6992 ) ( ON ?auto_6991 ?auto_6992 ) ( not ( = ?auto_6992 ?auto_6991 ) ) ( not ( = ?auto_6992 ?auto_6990 ) ) ( not ( = ?auto_6992 ?auto_6989 ) ) ( not ( = ?auto_6988 ?auto_6992 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6992 ?auto_6991 ?auto_6990 )
      ( MAKE-3PILE ?auto_6988 ?auto_6989 ?auto_6990 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6993 - BLOCK
      ?auto_6994 - BLOCK
      ?auto_6995 - BLOCK
    )
    :vars
    (
      ?auto_6997 - BLOCK
      ?auto_6996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6993 ?auto_6994 ) ) ( not ( = ?auto_6993 ?auto_6995 ) ) ( not ( = ?auto_6994 ?auto_6995 ) ) ( ON ?auto_6995 ?auto_6997 ) ( not ( = ?auto_6993 ?auto_6997 ) ) ( not ( = ?auto_6994 ?auto_6997 ) ) ( not ( = ?auto_6995 ?auto_6997 ) ) ( ON ?auto_6994 ?auto_6995 ) ( CLEAR ?auto_6994 ) ( ON-TABLE ?auto_6996 ) ( ON ?auto_6997 ?auto_6996 ) ( not ( = ?auto_6996 ?auto_6997 ) ) ( not ( = ?auto_6996 ?auto_6995 ) ) ( not ( = ?auto_6996 ?auto_6994 ) ) ( not ( = ?auto_6993 ?auto_6996 ) ) ( HOLDING ?auto_6993 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6993 )
      ( MAKE-3PILE ?auto_6993 ?auto_6994 ?auto_6995 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6998 - BLOCK
      ?auto_6999 - BLOCK
      ?auto_7000 - BLOCK
    )
    :vars
    (
      ?auto_7002 - BLOCK
      ?auto_7001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6998 ?auto_6999 ) ) ( not ( = ?auto_6998 ?auto_7000 ) ) ( not ( = ?auto_6999 ?auto_7000 ) ) ( ON ?auto_7000 ?auto_7002 ) ( not ( = ?auto_6998 ?auto_7002 ) ) ( not ( = ?auto_6999 ?auto_7002 ) ) ( not ( = ?auto_7000 ?auto_7002 ) ) ( ON ?auto_6999 ?auto_7000 ) ( ON-TABLE ?auto_7001 ) ( ON ?auto_7002 ?auto_7001 ) ( not ( = ?auto_7001 ?auto_7002 ) ) ( not ( = ?auto_7001 ?auto_7000 ) ) ( not ( = ?auto_7001 ?auto_6999 ) ) ( not ( = ?auto_6998 ?auto_7001 ) ) ( ON ?auto_6998 ?auto_6999 ) ( CLEAR ?auto_6998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7001 ?auto_7002 ?auto_7000 ?auto_6999 )
      ( MAKE-3PILE ?auto_6998 ?auto_6999 ?auto_7000 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7004 - BLOCK
    )
    :vars
    (
      ?auto_7005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7005 ?auto_7004 ) ( CLEAR ?auto_7005 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7004 ) ( not ( = ?auto_7004 ?auto_7005 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7005 ?auto_7004 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7006 - BLOCK
    )
    :vars
    (
      ?auto_7007 - BLOCK
      ?auto_7008 - BLOCK
      ?auto_7009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7007 ?auto_7006 ) ( CLEAR ?auto_7007 ) ( ON-TABLE ?auto_7006 ) ( not ( = ?auto_7006 ?auto_7007 ) ) ( HOLDING ?auto_7008 ) ( CLEAR ?auto_7009 ) ( not ( = ?auto_7006 ?auto_7008 ) ) ( not ( = ?auto_7006 ?auto_7009 ) ) ( not ( = ?auto_7007 ?auto_7008 ) ) ( not ( = ?auto_7007 ?auto_7009 ) ) ( not ( = ?auto_7008 ?auto_7009 ) ) )
    :subtasks
    ( ( !STACK ?auto_7008 ?auto_7009 )
      ( MAKE-1PILE ?auto_7006 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7010 - BLOCK
    )
    :vars
    (
      ?auto_7011 - BLOCK
      ?auto_7012 - BLOCK
      ?auto_7013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7011 ?auto_7010 ) ( ON-TABLE ?auto_7010 ) ( not ( = ?auto_7010 ?auto_7011 ) ) ( CLEAR ?auto_7012 ) ( not ( = ?auto_7010 ?auto_7013 ) ) ( not ( = ?auto_7010 ?auto_7012 ) ) ( not ( = ?auto_7011 ?auto_7013 ) ) ( not ( = ?auto_7011 ?auto_7012 ) ) ( not ( = ?auto_7013 ?auto_7012 ) ) ( ON ?auto_7013 ?auto_7011 ) ( CLEAR ?auto_7013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7010 ?auto_7011 )
      ( MAKE-1PILE ?auto_7010 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7014 - BLOCK
    )
    :vars
    (
      ?auto_7017 - BLOCK
      ?auto_7016 - BLOCK
      ?auto_7015 - BLOCK
      ?auto_7018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7017 ?auto_7014 ) ( ON-TABLE ?auto_7014 ) ( not ( = ?auto_7014 ?auto_7017 ) ) ( not ( = ?auto_7014 ?auto_7016 ) ) ( not ( = ?auto_7014 ?auto_7015 ) ) ( not ( = ?auto_7017 ?auto_7016 ) ) ( not ( = ?auto_7017 ?auto_7015 ) ) ( not ( = ?auto_7016 ?auto_7015 ) ) ( ON ?auto_7016 ?auto_7017 ) ( CLEAR ?auto_7016 ) ( HOLDING ?auto_7015 ) ( CLEAR ?auto_7018 ) ( ON-TABLE ?auto_7018 ) ( not ( = ?auto_7018 ?auto_7015 ) ) ( not ( = ?auto_7014 ?auto_7018 ) ) ( not ( = ?auto_7017 ?auto_7018 ) ) ( not ( = ?auto_7016 ?auto_7018 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7018 ?auto_7015 )
      ( MAKE-1PILE ?auto_7014 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7242 - BLOCK
    )
    :vars
    (
      ?auto_7243 - BLOCK
      ?auto_7244 - BLOCK
      ?auto_7245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7243 ?auto_7242 ) ( ON-TABLE ?auto_7242 ) ( not ( = ?auto_7242 ?auto_7243 ) ) ( not ( = ?auto_7242 ?auto_7244 ) ) ( not ( = ?auto_7242 ?auto_7245 ) ) ( not ( = ?auto_7243 ?auto_7244 ) ) ( not ( = ?auto_7243 ?auto_7245 ) ) ( not ( = ?auto_7244 ?auto_7245 ) ) ( ON ?auto_7244 ?auto_7243 ) ( ON ?auto_7245 ?auto_7244 ) ( CLEAR ?auto_7245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7242 ?auto_7243 ?auto_7244 )
      ( MAKE-1PILE ?auto_7242 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7024 - BLOCK
    )
    :vars
    (
      ?auto_7025 - BLOCK
      ?auto_7028 - BLOCK
      ?auto_7027 - BLOCK
      ?auto_7026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7025 ?auto_7024 ) ( ON-TABLE ?auto_7024 ) ( not ( = ?auto_7024 ?auto_7025 ) ) ( not ( = ?auto_7024 ?auto_7028 ) ) ( not ( = ?auto_7024 ?auto_7027 ) ) ( not ( = ?auto_7025 ?auto_7028 ) ) ( not ( = ?auto_7025 ?auto_7027 ) ) ( not ( = ?auto_7028 ?auto_7027 ) ) ( ON ?auto_7028 ?auto_7025 ) ( not ( = ?auto_7026 ?auto_7027 ) ) ( not ( = ?auto_7024 ?auto_7026 ) ) ( not ( = ?auto_7025 ?auto_7026 ) ) ( not ( = ?auto_7028 ?auto_7026 ) ) ( ON ?auto_7027 ?auto_7028 ) ( CLEAR ?auto_7027 ) ( HOLDING ?auto_7026 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7026 )
      ( MAKE-1PILE ?auto_7024 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7029 - BLOCK
    )
    :vars
    (
      ?auto_7032 - BLOCK
      ?auto_7030 - BLOCK
      ?auto_7033 - BLOCK
      ?auto_7031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7032 ?auto_7029 ) ( ON-TABLE ?auto_7029 ) ( not ( = ?auto_7029 ?auto_7032 ) ) ( not ( = ?auto_7029 ?auto_7030 ) ) ( not ( = ?auto_7029 ?auto_7033 ) ) ( not ( = ?auto_7032 ?auto_7030 ) ) ( not ( = ?auto_7032 ?auto_7033 ) ) ( not ( = ?auto_7030 ?auto_7033 ) ) ( ON ?auto_7030 ?auto_7032 ) ( not ( = ?auto_7031 ?auto_7033 ) ) ( not ( = ?auto_7029 ?auto_7031 ) ) ( not ( = ?auto_7032 ?auto_7031 ) ) ( not ( = ?auto_7030 ?auto_7031 ) ) ( ON ?auto_7033 ?auto_7030 ) ( ON ?auto_7031 ?auto_7033 ) ( CLEAR ?auto_7031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7029 ?auto_7032 ?auto_7030 ?auto_7033 )
      ( MAKE-1PILE ?auto_7029 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7038 - BLOCK
      ?auto_7039 - BLOCK
      ?auto_7040 - BLOCK
      ?auto_7041 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7041 ) ( CLEAR ?auto_7040 ) ( ON-TABLE ?auto_7038 ) ( ON ?auto_7039 ?auto_7038 ) ( ON ?auto_7040 ?auto_7039 ) ( not ( = ?auto_7038 ?auto_7039 ) ) ( not ( = ?auto_7038 ?auto_7040 ) ) ( not ( = ?auto_7038 ?auto_7041 ) ) ( not ( = ?auto_7039 ?auto_7040 ) ) ( not ( = ?auto_7039 ?auto_7041 ) ) ( not ( = ?auto_7040 ?auto_7041 ) ) )
    :subtasks
    ( ( !STACK ?auto_7041 ?auto_7040 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7042 - BLOCK
      ?auto_7043 - BLOCK
      ?auto_7044 - BLOCK
      ?auto_7045 - BLOCK
    )
    :vars
    (
      ?auto_7046 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7044 ) ( ON-TABLE ?auto_7042 ) ( ON ?auto_7043 ?auto_7042 ) ( ON ?auto_7044 ?auto_7043 ) ( not ( = ?auto_7042 ?auto_7043 ) ) ( not ( = ?auto_7042 ?auto_7044 ) ) ( not ( = ?auto_7042 ?auto_7045 ) ) ( not ( = ?auto_7043 ?auto_7044 ) ) ( not ( = ?auto_7043 ?auto_7045 ) ) ( not ( = ?auto_7044 ?auto_7045 ) ) ( ON ?auto_7045 ?auto_7046 ) ( CLEAR ?auto_7045 ) ( HAND-EMPTY ) ( not ( = ?auto_7042 ?auto_7046 ) ) ( not ( = ?auto_7043 ?auto_7046 ) ) ( not ( = ?auto_7044 ?auto_7046 ) ) ( not ( = ?auto_7045 ?auto_7046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7045 ?auto_7046 )
      ( MAKE-4PILE ?auto_7042 ?auto_7043 ?auto_7044 ?auto_7045 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7047 - BLOCK
      ?auto_7048 - BLOCK
      ?auto_7049 - BLOCK
      ?auto_7050 - BLOCK
    )
    :vars
    (
      ?auto_7051 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7047 ) ( ON ?auto_7048 ?auto_7047 ) ( not ( = ?auto_7047 ?auto_7048 ) ) ( not ( = ?auto_7047 ?auto_7049 ) ) ( not ( = ?auto_7047 ?auto_7050 ) ) ( not ( = ?auto_7048 ?auto_7049 ) ) ( not ( = ?auto_7048 ?auto_7050 ) ) ( not ( = ?auto_7049 ?auto_7050 ) ) ( ON ?auto_7050 ?auto_7051 ) ( CLEAR ?auto_7050 ) ( not ( = ?auto_7047 ?auto_7051 ) ) ( not ( = ?auto_7048 ?auto_7051 ) ) ( not ( = ?auto_7049 ?auto_7051 ) ) ( not ( = ?auto_7050 ?auto_7051 ) ) ( HOLDING ?auto_7049 ) ( CLEAR ?auto_7048 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7047 ?auto_7048 ?auto_7049 )
      ( MAKE-4PILE ?auto_7047 ?auto_7048 ?auto_7049 ?auto_7050 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7052 - BLOCK
      ?auto_7053 - BLOCK
      ?auto_7054 - BLOCK
      ?auto_7055 - BLOCK
    )
    :vars
    (
      ?auto_7056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7052 ) ( ON ?auto_7053 ?auto_7052 ) ( not ( = ?auto_7052 ?auto_7053 ) ) ( not ( = ?auto_7052 ?auto_7054 ) ) ( not ( = ?auto_7052 ?auto_7055 ) ) ( not ( = ?auto_7053 ?auto_7054 ) ) ( not ( = ?auto_7053 ?auto_7055 ) ) ( not ( = ?auto_7054 ?auto_7055 ) ) ( ON ?auto_7055 ?auto_7056 ) ( not ( = ?auto_7052 ?auto_7056 ) ) ( not ( = ?auto_7053 ?auto_7056 ) ) ( not ( = ?auto_7054 ?auto_7056 ) ) ( not ( = ?auto_7055 ?auto_7056 ) ) ( CLEAR ?auto_7053 ) ( ON ?auto_7054 ?auto_7055 ) ( CLEAR ?auto_7054 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7056 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7056 ?auto_7055 )
      ( MAKE-4PILE ?auto_7052 ?auto_7053 ?auto_7054 ?auto_7055 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7057 - BLOCK
      ?auto_7058 - BLOCK
      ?auto_7059 - BLOCK
      ?auto_7060 - BLOCK
    )
    :vars
    (
      ?auto_7061 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7057 ) ( not ( = ?auto_7057 ?auto_7058 ) ) ( not ( = ?auto_7057 ?auto_7059 ) ) ( not ( = ?auto_7057 ?auto_7060 ) ) ( not ( = ?auto_7058 ?auto_7059 ) ) ( not ( = ?auto_7058 ?auto_7060 ) ) ( not ( = ?auto_7059 ?auto_7060 ) ) ( ON ?auto_7060 ?auto_7061 ) ( not ( = ?auto_7057 ?auto_7061 ) ) ( not ( = ?auto_7058 ?auto_7061 ) ) ( not ( = ?auto_7059 ?auto_7061 ) ) ( not ( = ?auto_7060 ?auto_7061 ) ) ( ON ?auto_7059 ?auto_7060 ) ( CLEAR ?auto_7059 ) ( ON-TABLE ?auto_7061 ) ( HOLDING ?auto_7058 ) ( CLEAR ?auto_7057 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7057 ?auto_7058 )
      ( MAKE-4PILE ?auto_7057 ?auto_7058 ?auto_7059 ?auto_7060 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7062 - BLOCK
      ?auto_7063 - BLOCK
      ?auto_7064 - BLOCK
      ?auto_7065 - BLOCK
    )
    :vars
    (
      ?auto_7066 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7062 ) ( not ( = ?auto_7062 ?auto_7063 ) ) ( not ( = ?auto_7062 ?auto_7064 ) ) ( not ( = ?auto_7062 ?auto_7065 ) ) ( not ( = ?auto_7063 ?auto_7064 ) ) ( not ( = ?auto_7063 ?auto_7065 ) ) ( not ( = ?auto_7064 ?auto_7065 ) ) ( ON ?auto_7065 ?auto_7066 ) ( not ( = ?auto_7062 ?auto_7066 ) ) ( not ( = ?auto_7063 ?auto_7066 ) ) ( not ( = ?auto_7064 ?auto_7066 ) ) ( not ( = ?auto_7065 ?auto_7066 ) ) ( ON ?auto_7064 ?auto_7065 ) ( ON-TABLE ?auto_7066 ) ( CLEAR ?auto_7062 ) ( ON ?auto_7063 ?auto_7064 ) ( CLEAR ?auto_7063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7066 ?auto_7065 ?auto_7064 )
      ( MAKE-4PILE ?auto_7062 ?auto_7063 ?auto_7064 ?auto_7065 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7067 - BLOCK
      ?auto_7068 - BLOCK
      ?auto_7069 - BLOCK
      ?auto_7070 - BLOCK
    )
    :vars
    (
      ?auto_7071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7067 ?auto_7068 ) ) ( not ( = ?auto_7067 ?auto_7069 ) ) ( not ( = ?auto_7067 ?auto_7070 ) ) ( not ( = ?auto_7068 ?auto_7069 ) ) ( not ( = ?auto_7068 ?auto_7070 ) ) ( not ( = ?auto_7069 ?auto_7070 ) ) ( ON ?auto_7070 ?auto_7071 ) ( not ( = ?auto_7067 ?auto_7071 ) ) ( not ( = ?auto_7068 ?auto_7071 ) ) ( not ( = ?auto_7069 ?auto_7071 ) ) ( not ( = ?auto_7070 ?auto_7071 ) ) ( ON ?auto_7069 ?auto_7070 ) ( ON-TABLE ?auto_7071 ) ( ON ?auto_7068 ?auto_7069 ) ( CLEAR ?auto_7068 ) ( HOLDING ?auto_7067 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7067 )
      ( MAKE-4PILE ?auto_7067 ?auto_7068 ?auto_7069 ?auto_7070 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7072 - BLOCK
      ?auto_7073 - BLOCK
      ?auto_7074 - BLOCK
      ?auto_7075 - BLOCK
    )
    :vars
    (
      ?auto_7076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7072 ?auto_7073 ) ) ( not ( = ?auto_7072 ?auto_7074 ) ) ( not ( = ?auto_7072 ?auto_7075 ) ) ( not ( = ?auto_7073 ?auto_7074 ) ) ( not ( = ?auto_7073 ?auto_7075 ) ) ( not ( = ?auto_7074 ?auto_7075 ) ) ( ON ?auto_7075 ?auto_7076 ) ( not ( = ?auto_7072 ?auto_7076 ) ) ( not ( = ?auto_7073 ?auto_7076 ) ) ( not ( = ?auto_7074 ?auto_7076 ) ) ( not ( = ?auto_7075 ?auto_7076 ) ) ( ON ?auto_7074 ?auto_7075 ) ( ON-TABLE ?auto_7076 ) ( ON ?auto_7073 ?auto_7074 ) ( ON ?auto_7072 ?auto_7073 ) ( CLEAR ?auto_7072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7076 ?auto_7075 ?auto_7074 ?auto_7073 )
      ( MAKE-4PILE ?auto_7072 ?auto_7073 ?auto_7074 ?auto_7075 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7117 - BLOCK
    )
    :vars
    (
      ?auto_7118 - BLOCK
      ?auto_7119 - BLOCK
      ?auto_7120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7117 ?auto_7118 ) ( CLEAR ?auto_7117 ) ( not ( = ?auto_7117 ?auto_7118 ) ) ( HOLDING ?auto_7119 ) ( CLEAR ?auto_7120 ) ( not ( = ?auto_7117 ?auto_7119 ) ) ( not ( = ?auto_7117 ?auto_7120 ) ) ( not ( = ?auto_7118 ?auto_7119 ) ) ( not ( = ?auto_7118 ?auto_7120 ) ) ( not ( = ?auto_7119 ?auto_7120 ) ) )
    :subtasks
    ( ( !STACK ?auto_7119 ?auto_7120 )
      ( MAKE-1PILE ?auto_7117 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7121 - BLOCK
    )
    :vars
    (
      ?auto_7124 - BLOCK
      ?auto_7123 - BLOCK
      ?auto_7122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7121 ?auto_7124 ) ( not ( = ?auto_7121 ?auto_7124 ) ) ( CLEAR ?auto_7123 ) ( not ( = ?auto_7121 ?auto_7122 ) ) ( not ( = ?auto_7121 ?auto_7123 ) ) ( not ( = ?auto_7124 ?auto_7122 ) ) ( not ( = ?auto_7124 ?auto_7123 ) ) ( not ( = ?auto_7122 ?auto_7123 ) ) ( ON ?auto_7122 ?auto_7121 ) ( CLEAR ?auto_7122 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7124 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7124 ?auto_7121 )
      ( MAKE-1PILE ?auto_7121 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7125 - BLOCK
    )
    :vars
    (
      ?auto_7126 - BLOCK
      ?auto_7128 - BLOCK
      ?auto_7127 - BLOCK
      ?auto_7129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7125 ?auto_7126 ) ( not ( = ?auto_7125 ?auto_7126 ) ) ( not ( = ?auto_7125 ?auto_7128 ) ) ( not ( = ?auto_7125 ?auto_7127 ) ) ( not ( = ?auto_7126 ?auto_7128 ) ) ( not ( = ?auto_7126 ?auto_7127 ) ) ( not ( = ?auto_7128 ?auto_7127 ) ) ( ON ?auto_7128 ?auto_7125 ) ( CLEAR ?auto_7128 ) ( ON-TABLE ?auto_7126 ) ( HOLDING ?auto_7127 ) ( CLEAR ?auto_7129 ) ( ON-TABLE ?auto_7129 ) ( not ( = ?auto_7129 ?auto_7127 ) ) ( not ( = ?auto_7125 ?auto_7129 ) ) ( not ( = ?auto_7126 ?auto_7129 ) ) ( not ( = ?auto_7128 ?auto_7129 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7129 ?auto_7127 )
      ( MAKE-1PILE ?auto_7125 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7130 - BLOCK
    )
    :vars
    (
      ?auto_7131 - BLOCK
      ?auto_7133 - BLOCK
      ?auto_7132 - BLOCK
      ?auto_7134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7130 ?auto_7131 ) ( not ( = ?auto_7130 ?auto_7131 ) ) ( not ( = ?auto_7130 ?auto_7133 ) ) ( not ( = ?auto_7130 ?auto_7132 ) ) ( not ( = ?auto_7131 ?auto_7133 ) ) ( not ( = ?auto_7131 ?auto_7132 ) ) ( not ( = ?auto_7133 ?auto_7132 ) ) ( ON ?auto_7133 ?auto_7130 ) ( ON-TABLE ?auto_7131 ) ( CLEAR ?auto_7134 ) ( ON-TABLE ?auto_7134 ) ( not ( = ?auto_7134 ?auto_7132 ) ) ( not ( = ?auto_7130 ?auto_7134 ) ) ( not ( = ?auto_7131 ?auto_7134 ) ) ( not ( = ?auto_7133 ?auto_7134 ) ) ( ON ?auto_7132 ?auto_7133 ) ( CLEAR ?auto_7132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7131 ?auto_7130 ?auto_7133 )
      ( MAKE-1PILE ?auto_7130 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7135 - BLOCK
    )
    :vars
    (
      ?auto_7138 - BLOCK
      ?auto_7137 - BLOCK
      ?auto_7136 - BLOCK
      ?auto_7139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7135 ?auto_7138 ) ( not ( = ?auto_7135 ?auto_7138 ) ) ( not ( = ?auto_7135 ?auto_7137 ) ) ( not ( = ?auto_7135 ?auto_7136 ) ) ( not ( = ?auto_7138 ?auto_7137 ) ) ( not ( = ?auto_7138 ?auto_7136 ) ) ( not ( = ?auto_7137 ?auto_7136 ) ) ( ON ?auto_7137 ?auto_7135 ) ( ON-TABLE ?auto_7138 ) ( not ( = ?auto_7139 ?auto_7136 ) ) ( not ( = ?auto_7135 ?auto_7139 ) ) ( not ( = ?auto_7138 ?auto_7139 ) ) ( not ( = ?auto_7137 ?auto_7139 ) ) ( ON ?auto_7136 ?auto_7137 ) ( CLEAR ?auto_7136 ) ( HOLDING ?auto_7139 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7139 )
      ( MAKE-1PILE ?auto_7135 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7140 - BLOCK
    )
    :vars
    (
      ?auto_7144 - BLOCK
      ?auto_7143 - BLOCK
      ?auto_7142 - BLOCK
      ?auto_7141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7140 ?auto_7144 ) ( not ( = ?auto_7140 ?auto_7144 ) ) ( not ( = ?auto_7140 ?auto_7143 ) ) ( not ( = ?auto_7140 ?auto_7142 ) ) ( not ( = ?auto_7144 ?auto_7143 ) ) ( not ( = ?auto_7144 ?auto_7142 ) ) ( not ( = ?auto_7143 ?auto_7142 ) ) ( ON ?auto_7143 ?auto_7140 ) ( ON-TABLE ?auto_7144 ) ( not ( = ?auto_7141 ?auto_7142 ) ) ( not ( = ?auto_7140 ?auto_7141 ) ) ( not ( = ?auto_7144 ?auto_7141 ) ) ( not ( = ?auto_7143 ?auto_7141 ) ) ( ON ?auto_7142 ?auto_7143 ) ( ON ?auto_7141 ?auto_7142 ) ( CLEAR ?auto_7141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7144 ?auto_7140 ?auto_7143 ?auto_7142 )
      ( MAKE-1PILE ?auto_7140 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7150 - BLOCK
      ?auto_7151 - BLOCK
    )
    :vars
    (
      ?auto_7152 - BLOCK
      ?auto_7153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7152 ?auto_7151 ) ( CLEAR ?auto_7152 ) ( ON-TABLE ?auto_7150 ) ( ON ?auto_7151 ?auto_7150 ) ( not ( = ?auto_7150 ?auto_7151 ) ) ( not ( = ?auto_7150 ?auto_7152 ) ) ( not ( = ?auto_7151 ?auto_7152 ) ) ( HOLDING ?auto_7153 ) ( not ( = ?auto_7150 ?auto_7153 ) ) ( not ( = ?auto_7151 ?auto_7153 ) ) ( not ( = ?auto_7152 ?auto_7153 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_7153 )
      ( MAKE-2PILE ?auto_7150 ?auto_7151 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7187 - BLOCK
      ?auto_7188 - BLOCK
    )
    :vars
    (
      ?auto_7189 - BLOCK
      ?auto_7190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7187 ?auto_7188 ) ) ( ON ?auto_7188 ?auto_7189 ) ( not ( = ?auto_7187 ?auto_7189 ) ) ( not ( = ?auto_7188 ?auto_7189 ) ) ( ON ?auto_7187 ?auto_7188 ) ( CLEAR ?auto_7187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7190 ) ( ON ?auto_7189 ?auto_7190 ) ( not ( = ?auto_7190 ?auto_7189 ) ) ( not ( = ?auto_7190 ?auto_7188 ) ) ( not ( = ?auto_7190 ?auto_7187 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7190 ?auto_7189 ?auto_7188 )
      ( MAKE-2PILE ?auto_7187 ?auto_7188 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7193 - BLOCK
      ?auto_7194 - BLOCK
    )
    :vars
    (
      ?auto_7195 - BLOCK
      ?auto_7196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7193 ?auto_7194 ) ) ( ON ?auto_7194 ?auto_7195 ) ( CLEAR ?auto_7194 ) ( not ( = ?auto_7193 ?auto_7195 ) ) ( not ( = ?auto_7194 ?auto_7195 ) ) ( ON ?auto_7193 ?auto_7196 ) ( CLEAR ?auto_7193 ) ( HAND-EMPTY ) ( not ( = ?auto_7193 ?auto_7196 ) ) ( not ( = ?auto_7194 ?auto_7196 ) ) ( not ( = ?auto_7195 ?auto_7196 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7193 ?auto_7196 )
      ( MAKE-2PILE ?auto_7193 ?auto_7194 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7197 - BLOCK
      ?auto_7198 - BLOCK
    )
    :vars
    (
      ?auto_7200 - BLOCK
      ?auto_7199 - BLOCK
      ?auto_7201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7197 ?auto_7198 ) ) ( not ( = ?auto_7197 ?auto_7200 ) ) ( not ( = ?auto_7198 ?auto_7200 ) ) ( ON ?auto_7197 ?auto_7199 ) ( CLEAR ?auto_7197 ) ( not ( = ?auto_7197 ?auto_7199 ) ) ( not ( = ?auto_7198 ?auto_7199 ) ) ( not ( = ?auto_7200 ?auto_7199 ) ) ( HOLDING ?auto_7198 ) ( CLEAR ?auto_7200 ) ( ON-TABLE ?auto_7201 ) ( ON ?auto_7200 ?auto_7201 ) ( not ( = ?auto_7201 ?auto_7200 ) ) ( not ( = ?auto_7201 ?auto_7198 ) ) ( not ( = ?auto_7197 ?auto_7201 ) ) ( not ( = ?auto_7199 ?auto_7201 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7201 ?auto_7200 ?auto_7198 )
      ( MAKE-2PILE ?auto_7197 ?auto_7198 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7202 - BLOCK
      ?auto_7203 - BLOCK
    )
    :vars
    (
      ?auto_7205 - BLOCK
      ?auto_7206 - BLOCK
      ?auto_7204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7202 ?auto_7203 ) ) ( not ( = ?auto_7202 ?auto_7205 ) ) ( not ( = ?auto_7203 ?auto_7205 ) ) ( ON ?auto_7202 ?auto_7206 ) ( not ( = ?auto_7202 ?auto_7206 ) ) ( not ( = ?auto_7203 ?auto_7206 ) ) ( not ( = ?auto_7205 ?auto_7206 ) ) ( CLEAR ?auto_7205 ) ( ON-TABLE ?auto_7204 ) ( ON ?auto_7205 ?auto_7204 ) ( not ( = ?auto_7204 ?auto_7205 ) ) ( not ( = ?auto_7204 ?auto_7203 ) ) ( not ( = ?auto_7202 ?auto_7204 ) ) ( not ( = ?auto_7206 ?auto_7204 ) ) ( ON ?auto_7203 ?auto_7202 ) ( CLEAR ?auto_7203 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7206 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7206 ?auto_7202 )
      ( MAKE-2PILE ?auto_7202 ?auto_7203 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7207 - BLOCK
      ?auto_7208 - BLOCK
    )
    :vars
    (
      ?auto_7211 - BLOCK
      ?auto_7209 - BLOCK
      ?auto_7210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7207 ?auto_7208 ) ) ( not ( = ?auto_7207 ?auto_7211 ) ) ( not ( = ?auto_7208 ?auto_7211 ) ) ( ON ?auto_7207 ?auto_7209 ) ( not ( = ?auto_7207 ?auto_7209 ) ) ( not ( = ?auto_7208 ?auto_7209 ) ) ( not ( = ?auto_7211 ?auto_7209 ) ) ( ON-TABLE ?auto_7210 ) ( not ( = ?auto_7210 ?auto_7211 ) ) ( not ( = ?auto_7210 ?auto_7208 ) ) ( not ( = ?auto_7207 ?auto_7210 ) ) ( not ( = ?auto_7209 ?auto_7210 ) ) ( ON ?auto_7208 ?auto_7207 ) ( CLEAR ?auto_7208 ) ( ON-TABLE ?auto_7209 ) ( HOLDING ?auto_7211 ) ( CLEAR ?auto_7210 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7210 ?auto_7211 )
      ( MAKE-2PILE ?auto_7207 ?auto_7208 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7212 - BLOCK
      ?auto_7213 - BLOCK
    )
    :vars
    (
      ?auto_7214 - BLOCK
      ?auto_7216 - BLOCK
      ?auto_7215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7212 ?auto_7213 ) ) ( not ( = ?auto_7212 ?auto_7214 ) ) ( not ( = ?auto_7213 ?auto_7214 ) ) ( ON ?auto_7212 ?auto_7216 ) ( not ( = ?auto_7212 ?auto_7216 ) ) ( not ( = ?auto_7213 ?auto_7216 ) ) ( not ( = ?auto_7214 ?auto_7216 ) ) ( ON-TABLE ?auto_7215 ) ( not ( = ?auto_7215 ?auto_7214 ) ) ( not ( = ?auto_7215 ?auto_7213 ) ) ( not ( = ?auto_7212 ?auto_7215 ) ) ( not ( = ?auto_7216 ?auto_7215 ) ) ( ON ?auto_7213 ?auto_7212 ) ( ON-TABLE ?auto_7216 ) ( CLEAR ?auto_7215 ) ( ON ?auto_7214 ?auto_7213 ) ( CLEAR ?auto_7214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7216 ?auto_7212 ?auto_7213 )
      ( MAKE-2PILE ?auto_7212 ?auto_7213 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7217 - BLOCK
      ?auto_7218 - BLOCK
    )
    :vars
    (
      ?auto_7220 - BLOCK
      ?auto_7219 - BLOCK
      ?auto_7221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7217 ?auto_7218 ) ) ( not ( = ?auto_7217 ?auto_7220 ) ) ( not ( = ?auto_7218 ?auto_7220 ) ) ( ON ?auto_7217 ?auto_7219 ) ( not ( = ?auto_7217 ?auto_7219 ) ) ( not ( = ?auto_7218 ?auto_7219 ) ) ( not ( = ?auto_7220 ?auto_7219 ) ) ( not ( = ?auto_7221 ?auto_7220 ) ) ( not ( = ?auto_7221 ?auto_7218 ) ) ( not ( = ?auto_7217 ?auto_7221 ) ) ( not ( = ?auto_7219 ?auto_7221 ) ) ( ON ?auto_7218 ?auto_7217 ) ( ON-TABLE ?auto_7219 ) ( ON ?auto_7220 ?auto_7218 ) ( CLEAR ?auto_7220 ) ( HOLDING ?auto_7221 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7221 )
      ( MAKE-2PILE ?auto_7217 ?auto_7218 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7222 - BLOCK
      ?auto_7223 - BLOCK
    )
    :vars
    (
      ?auto_7224 - BLOCK
      ?auto_7226 - BLOCK
      ?auto_7225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7222 ?auto_7223 ) ) ( not ( = ?auto_7222 ?auto_7224 ) ) ( not ( = ?auto_7223 ?auto_7224 ) ) ( ON ?auto_7222 ?auto_7226 ) ( not ( = ?auto_7222 ?auto_7226 ) ) ( not ( = ?auto_7223 ?auto_7226 ) ) ( not ( = ?auto_7224 ?auto_7226 ) ) ( not ( = ?auto_7225 ?auto_7224 ) ) ( not ( = ?auto_7225 ?auto_7223 ) ) ( not ( = ?auto_7222 ?auto_7225 ) ) ( not ( = ?auto_7226 ?auto_7225 ) ) ( ON ?auto_7223 ?auto_7222 ) ( ON-TABLE ?auto_7226 ) ( ON ?auto_7224 ?auto_7223 ) ( ON ?auto_7225 ?auto_7224 ) ( CLEAR ?auto_7225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7226 ?auto_7222 ?auto_7223 ?auto_7224 )
      ( MAKE-2PILE ?auto_7222 ?auto_7223 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7238 - BLOCK
    )
    :vars
    (
      ?auto_7241 - BLOCK
      ?auto_7239 - BLOCK
      ?auto_7240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7241 ?auto_7238 ) ( ON-TABLE ?auto_7238 ) ( not ( = ?auto_7238 ?auto_7241 ) ) ( not ( = ?auto_7238 ?auto_7239 ) ) ( not ( = ?auto_7238 ?auto_7240 ) ) ( not ( = ?auto_7241 ?auto_7239 ) ) ( not ( = ?auto_7241 ?auto_7240 ) ) ( not ( = ?auto_7239 ?auto_7240 ) ) ( ON ?auto_7239 ?auto_7241 ) ( CLEAR ?auto_7239 ) ( HOLDING ?auto_7240 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7240 )
      ( MAKE-1PILE ?auto_7238 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7271 - BLOCK
      ?auto_7272 - BLOCK
      ?auto_7273 - BLOCK
    )
    :vars
    (
      ?auto_7274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7271 ) ( not ( = ?auto_7271 ?auto_7272 ) ) ( not ( = ?auto_7271 ?auto_7273 ) ) ( not ( = ?auto_7272 ?auto_7273 ) ) ( ON ?auto_7273 ?auto_7274 ) ( not ( = ?auto_7271 ?auto_7274 ) ) ( not ( = ?auto_7272 ?auto_7274 ) ) ( not ( = ?auto_7273 ?auto_7274 ) ) ( CLEAR ?auto_7271 ) ( ON ?auto_7272 ?auto_7273 ) ( CLEAR ?auto_7272 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7274 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7274 ?auto_7273 )
      ( MAKE-3PILE ?auto_7271 ?auto_7272 ?auto_7273 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7275 - BLOCK
      ?auto_7276 - BLOCK
      ?auto_7277 - BLOCK
    )
    :vars
    (
      ?auto_7278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7275 ?auto_7276 ) ) ( not ( = ?auto_7275 ?auto_7277 ) ) ( not ( = ?auto_7276 ?auto_7277 ) ) ( ON ?auto_7277 ?auto_7278 ) ( not ( = ?auto_7275 ?auto_7278 ) ) ( not ( = ?auto_7276 ?auto_7278 ) ) ( not ( = ?auto_7277 ?auto_7278 ) ) ( ON ?auto_7276 ?auto_7277 ) ( CLEAR ?auto_7276 ) ( ON-TABLE ?auto_7278 ) ( HOLDING ?auto_7275 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7275 )
      ( MAKE-3PILE ?auto_7275 ?auto_7276 ?auto_7277 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7279 - BLOCK
      ?auto_7280 - BLOCK
      ?auto_7281 - BLOCK
    )
    :vars
    (
      ?auto_7282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7279 ?auto_7280 ) ) ( not ( = ?auto_7279 ?auto_7281 ) ) ( not ( = ?auto_7280 ?auto_7281 ) ) ( ON ?auto_7281 ?auto_7282 ) ( not ( = ?auto_7279 ?auto_7282 ) ) ( not ( = ?auto_7280 ?auto_7282 ) ) ( not ( = ?auto_7281 ?auto_7282 ) ) ( ON ?auto_7280 ?auto_7281 ) ( ON-TABLE ?auto_7282 ) ( ON ?auto_7279 ?auto_7280 ) ( CLEAR ?auto_7279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7282 ?auto_7281 ?auto_7280 )
      ( MAKE-3PILE ?auto_7279 ?auto_7280 ?auto_7281 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7286 - BLOCK
      ?auto_7287 - BLOCK
      ?auto_7288 - BLOCK
    )
    :vars
    (
      ?auto_7289 - BLOCK
      ?auto_7290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7286 ?auto_7287 ) ) ( not ( = ?auto_7286 ?auto_7288 ) ) ( not ( = ?auto_7287 ?auto_7288 ) ) ( ON ?auto_7288 ?auto_7289 ) ( not ( = ?auto_7286 ?auto_7289 ) ) ( not ( = ?auto_7287 ?auto_7289 ) ) ( not ( = ?auto_7288 ?auto_7289 ) ) ( ON ?auto_7287 ?auto_7288 ) ( CLEAR ?auto_7287 ) ( ON-TABLE ?auto_7289 ) ( ON ?auto_7286 ?auto_7290 ) ( CLEAR ?auto_7286 ) ( HAND-EMPTY ) ( not ( = ?auto_7286 ?auto_7290 ) ) ( not ( = ?auto_7287 ?auto_7290 ) ) ( not ( = ?auto_7288 ?auto_7290 ) ) ( not ( = ?auto_7289 ?auto_7290 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7286 ?auto_7290 )
      ( MAKE-3PILE ?auto_7286 ?auto_7287 ?auto_7288 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7291 - BLOCK
      ?auto_7292 - BLOCK
      ?auto_7293 - BLOCK
    )
    :vars
    (
      ?auto_7295 - BLOCK
      ?auto_7294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7291 ?auto_7292 ) ) ( not ( = ?auto_7291 ?auto_7293 ) ) ( not ( = ?auto_7292 ?auto_7293 ) ) ( ON ?auto_7293 ?auto_7295 ) ( not ( = ?auto_7291 ?auto_7295 ) ) ( not ( = ?auto_7292 ?auto_7295 ) ) ( not ( = ?auto_7293 ?auto_7295 ) ) ( ON-TABLE ?auto_7295 ) ( ON ?auto_7291 ?auto_7294 ) ( CLEAR ?auto_7291 ) ( not ( = ?auto_7291 ?auto_7294 ) ) ( not ( = ?auto_7292 ?auto_7294 ) ) ( not ( = ?auto_7293 ?auto_7294 ) ) ( not ( = ?auto_7295 ?auto_7294 ) ) ( HOLDING ?auto_7292 ) ( CLEAR ?auto_7293 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7295 ?auto_7293 ?auto_7292 )
      ( MAKE-3PILE ?auto_7291 ?auto_7292 ?auto_7293 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7296 - BLOCK
      ?auto_7297 - BLOCK
      ?auto_7298 - BLOCK
    )
    :vars
    (
      ?auto_7300 - BLOCK
      ?auto_7299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7296 ?auto_7297 ) ) ( not ( = ?auto_7296 ?auto_7298 ) ) ( not ( = ?auto_7297 ?auto_7298 ) ) ( ON ?auto_7298 ?auto_7300 ) ( not ( = ?auto_7296 ?auto_7300 ) ) ( not ( = ?auto_7297 ?auto_7300 ) ) ( not ( = ?auto_7298 ?auto_7300 ) ) ( ON-TABLE ?auto_7300 ) ( ON ?auto_7296 ?auto_7299 ) ( not ( = ?auto_7296 ?auto_7299 ) ) ( not ( = ?auto_7297 ?auto_7299 ) ) ( not ( = ?auto_7298 ?auto_7299 ) ) ( not ( = ?auto_7300 ?auto_7299 ) ) ( CLEAR ?auto_7298 ) ( ON ?auto_7297 ?auto_7296 ) ( CLEAR ?auto_7297 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7299 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7299 ?auto_7296 )
      ( MAKE-3PILE ?auto_7296 ?auto_7297 ?auto_7298 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7301 - BLOCK
      ?auto_7302 - BLOCK
      ?auto_7303 - BLOCK
    )
    :vars
    (
      ?auto_7304 - BLOCK
      ?auto_7305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7301 ?auto_7302 ) ) ( not ( = ?auto_7301 ?auto_7303 ) ) ( not ( = ?auto_7302 ?auto_7303 ) ) ( not ( = ?auto_7301 ?auto_7304 ) ) ( not ( = ?auto_7302 ?auto_7304 ) ) ( not ( = ?auto_7303 ?auto_7304 ) ) ( ON-TABLE ?auto_7304 ) ( ON ?auto_7301 ?auto_7305 ) ( not ( = ?auto_7301 ?auto_7305 ) ) ( not ( = ?auto_7302 ?auto_7305 ) ) ( not ( = ?auto_7303 ?auto_7305 ) ) ( not ( = ?auto_7304 ?auto_7305 ) ) ( ON ?auto_7302 ?auto_7301 ) ( CLEAR ?auto_7302 ) ( ON-TABLE ?auto_7305 ) ( HOLDING ?auto_7303 ) ( CLEAR ?auto_7304 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7304 ?auto_7303 )
      ( MAKE-3PILE ?auto_7301 ?auto_7302 ?auto_7303 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7306 - BLOCK
      ?auto_7307 - BLOCK
      ?auto_7308 - BLOCK
    )
    :vars
    (
      ?auto_7309 - BLOCK
      ?auto_7310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7306 ?auto_7307 ) ) ( not ( = ?auto_7306 ?auto_7308 ) ) ( not ( = ?auto_7307 ?auto_7308 ) ) ( not ( = ?auto_7306 ?auto_7309 ) ) ( not ( = ?auto_7307 ?auto_7309 ) ) ( not ( = ?auto_7308 ?auto_7309 ) ) ( ON-TABLE ?auto_7309 ) ( ON ?auto_7306 ?auto_7310 ) ( not ( = ?auto_7306 ?auto_7310 ) ) ( not ( = ?auto_7307 ?auto_7310 ) ) ( not ( = ?auto_7308 ?auto_7310 ) ) ( not ( = ?auto_7309 ?auto_7310 ) ) ( ON ?auto_7307 ?auto_7306 ) ( ON-TABLE ?auto_7310 ) ( CLEAR ?auto_7309 ) ( ON ?auto_7308 ?auto_7307 ) ( CLEAR ?auto_7308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7310 ?auto_7306 ?auto_7307 )
      ( MAKE-3PILE ?auto_7306 ?auto_7307 ?auto_7308 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7311 - BLOCK
      ?auto_7312 - BLOCK
      ?auto_7313 - BLOCK
    )
    :vars
    (
      ?auto_7314 - BLOCK
      ?auto_7315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7311 ?auto_7312 ) ) ( not ( = ?auto_7311 ?auto_7313 ) ) ( not ( = ?auto_7312 ?auto_7313 ) ) ( not ( = ?auto_7311 ?auto_7314 ) ) ( not ( = ?auto_7312 ?auto_7314 ) ) ( not ( = ?auto_7313 ?auto_7314 ) ) ( ON ?auto_7311 ?auto_7315 ) ( not ( = ?auto_7311 ?auto_7315 ) ) ( not ( = ?auto_7312 ?auto_7315 ) ) ( not ( = ?auto_7313 ?auto_7315 ) ) ( not ( = ?auto_7314 ?auto_7315 ) ) ( ON ?auto_7312 ?auto_7311 ) ( ON-TABLE ?auto_7315 ) ( ON ?auto_7313 ?auto_7312 ) ( CLEAR ?auto_7313 ) ( HOLDING ?auto_7314 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7314 )
      ( MAKE-3PILE ?auto_7311 ?auto_7312 ?auto_7313 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7316 - BLOCK
      ?auto_7317 - BLOCK
      ?auto_7318 - BLOCK
    )
    :vars
    (
      ?auto_7319 - BLOCK
      ?auto_7320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7316 ?auto_7317 ) ) ( not ( = ?auto_7316 ?auto_7318 ) ) ( not ( = ?auto_7317 ?auto_7318 ) ) ( not ( = ?auto_7316 ?auto_7319 ) ) ( not ( = ?auto_7317 ?auto_7319 ) ) ( not ( = ?auto_7318 ?auto_7319 ) ) ( ON ?auto_7316 ?auto_7320 ) ( not ( = ?auto_7316 ?auto_7320 ) ) ( not ( = ?auto_7317 ?auto_7320 ) ) ( not ( = ?auto_7318 ?auto_7320 ) ) ( not ( = ?auto_7319 ?auto_7320 ) ) ( ON ?auto_7317 ?auto_7316 ) ( ON-TABLE ?auto_7320 ) ( ON ?auto_7318 ?auto_7317 ) ( ON ?auto_7319 ?auto_7318 ) ( CLEAR ?auto_7319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7320 ?auto_7316 ?auto_7317 ?auto_7318 )
      ( MAKE-3PILE ?auto_7316 ?auto_7317 ?auto_7318 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7329 - BLOCK
      ?auto_7330 - BLOCK
      ?auto_7331 - BLOCK
      ?auto_7332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7331 ) ( ON-TABLE ?auto_7329 ) ( ON ?auto_7330 ?auto_7329 ) ( ON ?auto_7331 ?auto_7330 ) ( not ( = ?auto_7329 ?auto_7330 ) ) ( not ( = ?auto_7329 ?auto_7331 ) ) ( not ( = ?auto_7329 ?auto_7332 ) ) ( not ( = ?auto_7330 ?auto_7331 ) ) ( not ( = ?auto_7330 ?auto_7332 ) ) ( not ( = ?auto_7331 ?auto_7332 ) ) ( ON-TABLE ?auto_7332 ) ( CLEAR ?auto_7332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_7332 )
      ( MAKE-4PILE ?auto_7329 ?auto_7330 ?auto_7331 ?auto_7332 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7333 - BLOCK
      ?auto_7334 - BLOCK
      ?auto_7335 - BLOCK
      ?auto_7336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7333 ) ( ON ?auto_7334 ?auto_7333 ) ( not ( = ?auto_7333 ?auto_7334 ) ) ( not ( = ?auto_7333 ?auto_7335 ) ) ( not ( = ?auto_7333 ?auto_7336 ) ) ( not ( = ?auto_7334 ?auto_7335 ) ) ( not ( = ?auto_7334 ?auto_7336 ) ) ( not ( = ?auto_7335 ?auto_7336 ) ) ( ON-TABLE ?auto_7336 ) ( CLEAR ?auto_7336 ) ( HOLDING ?auto_7335 ) ( CLEAR ?auto_7334 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7333 ?auto_7334 ?auto_7335 )
      ( MAKE-4PILE ?auto_7333 ?auto_7334 ?auto_7335 ?auto_7336 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7337 - BLOCK
      ?auto_7338 - BLOCK
      ?auto_7339 - BLOCK
      ?auto_7340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7337 ) ( ON ?auto_7338 ?auto_7337 ) ( not ( = ?auto_7337 ?auto_7338 ) ) ( not ( = ?auto_7337 ?auto_7339 ) ) ( not ( = ?auto_7337 ?auto_7340 ) ) ( not ( = ?auto_7338 ?auto_7339 ) ) ( not ( = ?auto_7338 ?auto_7340 ) ) ( not ( = ?auto_7339 ?auto_7340 ) ) ( ON-TABLE ?auto_7340 ) ( CLEAR ?auto_7338 ) ( ON ?auto_7339 ?auto_7340 ) ( CLEAR ?auto_7339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7340 )
      ( MAKE-4PILE ?auto_7337 ?auto_7338 ?auto_7339 ?auto_7340 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7341 - BLOCK
      ?auto_7342 - BLOCK
      ?auto_7343 - BLOCK
      ?auto_7344 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7341 ) ( not ( = ?auto_7341 ?auto_7342 ) ) ( not ( = ?auto_7341 ?auto_7343 ) ) ( not ( = ?auto_7341 ?auto_7344 ) ) ( not ( = ?auto_7342 ?auto_7343 ) ) ( not ( = ?auto_7342 ?auto_7344 ) ) ( not ( = ?auto_7343 ?auto_7344 ) ) ( ON-TABLE ?auto_7344 ) ( ON ?auto_7343 ?auto_7344 ) ( CLEAR ?auto_7343 ) ( HOLDING ?auto_7342 ) ( CLEAR ?auto_7341 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7341 ?auto_7342 )
      ( MAKE-4PILE ?auto_7341 ?auto_7342 ?auto_7343 ?auto_7344 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7345 - BLOCK
      ?auto_7346 - BLOCK
      ?auto_7347 - BLOCK
      ?auto_7348 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7345 ) ( not ( = ?auto_7345 ?auto_7346 ) ) ( not ( = ?auto_7345 ?auto_7347 ) ) ( not ( = ?auto_7345 ?auto_7348 ) ) ( not ( = ?auto_7346 ?auto_7347 ) ) ( not ( = ?auto_7346 ?auto_7348 ) ) ( not ( = ?auto_7347 ?auto_7348 ) ) ( ON-TABLE ?auto_7348 ) ( ON ?auto_7347 ?auto_7348 ) ( CLEAR ?auto_7345 ) ( ON ?auto_7346 ?auto_7347 ) ( CLEAR ?auto_7346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7348 ?auto_7347 )
      ( MAKE-4PILE ?auto_7345 ?auto_7346 ?auto_7347 ?auto_7348 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7349 - BLOCK
      ?auto_7350 - BLOCK
      ?auto_7351 - BLOCK
      ?auto_7352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7349 ?auto_7350 ) ) ( not ( = ?auto_7349 ?auto_7351 ) ) ( not ( = ?auto_7349 ?auto_7352 ) ) ( not ( = ?auto_7350 ?auto_7351 ) ) ( not ( = ?auto_7350 ?auto_7352 ) ) ( not ( = ?auto_7351 ?auto_7352 ) ) ( ON-TABLE ?auto_7352 ) ( ON ?auto_7351 ?auto_7352 ) ( ON ?auto_7350 ?auto_7351 ) ( CLEAR ?auto_7350 ) ( HOLDING ?auto_7349 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7349 )
      ( MAKE-4PILE ?auto_7349 ?auto_7350 ?auto_7351 ?auto_7352 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7353 - BLOCK
      ?auto_7354 - BLOCK
      ?auto_7355 - BLOCK
      ?auto_7356 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7353 ?auto_7354 ) ) ( not ( = ?auto_7353 ?auto_7355 ) ) ( not ( = ?auto_7353 ?auto_7356 ) ) ( not ( = ?auto_7354 ?auto_7355 ) ) ( not ( = ?auto_7354 ?auto_7356 ) ) ( not ( = ?auto_7355 ?auto_7356 ) ) ( ON-TABLE ?auto_7356 ) ( ON ?auto_7355 ?auto_7356 ) ( ON ?auto_7354 ?auto_7355 ) ( ON ?auto_7353 ?auto_7354 ) ( CLEAR ?auto_7353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7356 ?auto_7355 ?auto_7354 )
      ( MAKE-4PILE ?auto_7353 ?auto_7354 ?auto_7355 ?auto_7356 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7361 - BLOCK
      ?auto_7362 - BLOCK
      ?auto_7363 - BLOCK
      ?auto_7364 - BLOCK
    )
    :vars
    (
      ?auto_7365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7361 ?auto_7362 ) ) ( not ( = ?auto_7361 ?auto_7363 ) ) ( not ( = ?auto_7361 ?auto_7364 ) ) ( not ( = ?auto_7362 ?auto_7363 ) ) ( not ( = ?auto_7362 ?auto_7364 ) ) ( not ( = ?auto_7363 ?auto_7364 ) ) ( ON-TABLE ?auto_7364 ) ( ON ?auto_7363 ?auto_7364 ) ( ON ?auto_7362 ?auto_7363 ) ( CLEAR ?auto_7362 ) ( ON ?auto_7361 ?auto_7365 ) ( CLEAR ?auto_7361 ) ( HAND-EMPTY ) ( not ( = ?auto_7361 ?auto_7365 ) ) ( not ( = ?auto_7362 ?auto_7365 ) ) ( not ( = ?auto_7363 ?auto_7365 ) ) ( not ( = ?auto_7364 ?auto_7365 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7361 ?auto_7365 )
      ( MAKE-4PILE ?auto_7361 ?auto_7362 ?auto_7363 ?auto_7364 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7366 - BLOCK
      ?auto_7367 - BLOCK
      ?auto_7368 - BLOCK
      ?auto_7369 - BLOCK
    )
    :vars
    (
      ?auto_7370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7366 ?auto_7367 ) ) ( not ( = ?auto_7366 ?auto_7368 ) ) ( not ( = ?auto_7366 ?auto_7369 ) ) ( not ( = ?auto_7367 ?auto_7368 ) ) ( not ( = ?auto_7367 ?auto_7369 ) ) ( not ( = ?auto_7368 ?auto_7369 ) ) ( ON-TABLE ?auto_7369 ) ( ON ?auto_7368 ?auto_7369 ) ( ON ?auto_7366 ?auto_7370 ) ( CLEAR ?auto_7366 ) ( not ( = ?auto_7366 ?auto_7370 ) ) ( not ( = ?auto_7367 ?auto_7370 ) ) ( not ( = ?auto_7368 ?auto_7370 ) ) ( not ( = ?auto_7369 ?auto_7370 ) ) ( HOLDING ?auto_7367 ) ( CLEAR ?auto_7368 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7369 ?auto_7368 ?auto_7367 )
      ( MAKE-4PILE ?auto_7366 ?auto_7367 ?auto_7368 ?auto_7369 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7371 - BLOCK
      ?auto_7372 - BLOCK
      ?auto_7373 - BLOCK
      ?auto_7374 - BLOCK
    )
    :vars
    (
      ?auto_7375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7371 ?auto_7372 ) ) ( not ( = ?auto_7371 ?auto_7373 ) ) ( not ( = ?auto_7371 ?auto_7374 ) ) ( not ( = ?auto_7372 ?auto_7373 ) ) ( not ( = ?auto_7372 ?auto_7374 ) ) ( not ( = ?auto_7373 ?auto_7374 ) ) ( ON-TABLE ?auto_7374 ) ( ON ?auto_7373 ?auto_7374 ) ( ON ?auto_7371 ?auto_7375 ) ( not ( = ?auto_7371 ?auto_7375 ) ) ( not ( = ?auto_7372 ?auto_7375 ) ) ( not ( = ?auto_7373 ?auto_7375 ) ) ( not ( = ?auto_7374 ?auto_7375 ) ) ( CLEAR ?auto_7373 ) ( ON ?auto_7372 ?auto_7371 ) ( CLEAR ?auto_7372 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7375 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7375 ?auto_7371 )
      ( MAKE-4PILE ?auto_7371 ?auto_7372 ?auto_7373 ?auto_7374 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7376 - BLOCK
      ?auto_7377 - BLOCK
      ?auto_7378 - BLOCK
      ?auto_7379 - BLOCK
    )
    :vars
    (
      ?auto_7380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7376 ?auto_7377 ) ) ( not ( = ?auto_7376 ?auto_7378 ) ) ( not ( = ?auto_7376 ?auto_7379 ) ) ( not ( = ?auto_7377 ?auto_7378 ) ) ( not ( = ?auto_7377 ?auto_7379 ) ) ( not ( = ?auto_7378 ?auto_7379 ) ) ( ON-TABLE ?auto_7379 ) ( ON ?auto_7376 ?auto_7380 ) ( not ( = ?auto_7376 ?auto_7380 ) ) ( not ( = ?auto_7377 ?auto_7380 ) ) ( not ( = ?auto_7378 ?auto_7380 ) ) ( not ( = ?auto_7379 ?auto_7380 ) ) ( ON ?auto_7377 ?auto_7376 ) ( CLEAR ?auto_7377 ) ( ON-TABLE ?auto_7380 ) ( HOLDING ?auto_7378 ) ( CLEAR ?auto_7379 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7379 ?auto_7378 )
      ( MAKE-4PILE ?auto_7376 ?auto_7377 ?auto_7378 ?auto_7379 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7381 - BLOCK
      ?auto_7382 - BLOCK
      ?auto_7383 - BLOCK
      ?auto_7384 - BLOCK
    )
    :vars
    (
      ?auto_7385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7381 ?auto_7382 ) ) ( not ( = ?auto_7381 ?auto_7383 ) ) ( not ( = ?auto_7381 ?auto_7384 ) ) ( not ( = ?auto_7382 ?auto_7383 ) ) ( not ( = ?auto_7382 ?auto_7384 ) ) ( not ( = ?auto_7383 ?auto_7384 ) ) ( ON-TABLE ?auto_7384 ) ( ON ?auto_7381 ?auto_7385 ) ( not ( = ?auto_7381 ?auto_7385 ) ) ( not ( = ?auto_7382 ?auto_7385 ) ) ( not ( = ?auto_7383 ?auto_7385 ) ) ( not ( = ?auto_7384 ?auto_7385 ) ) ( ON ?auto_7382 ?auto_7381 ) ( ON-TABLE ?auto_7385 ) ( CLEAR ?auto_7384 ) ( ON ?auto_7383 ?auto_7382 ) ( CLEAR ?auto_7383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7385 ?auto_7381 ?auto_7382 )
      ( MAKE-4PILE ?auto_7381 ?auto_7382 ?auto_7383 ?auto_7384 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7386 - BLOCK
      ?auto_7387 - BLOCK
      ?auto_7388 - BLOCK
      ?auto_7389 - BLOCK
    )
    :vars
    (
      ?auto_7390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7386 ?auto_7387 ) ) ( not ( = ?auto_7386 ?auto_7388 ) ) ( not ( = ?auto_7386 ?auto_7389 ) ) ( not ( = ?auto_7387 ?auto_7388 ) ) ( not ( = ?auto_7387 ?auto_7389 ) ) ( not ( = ?auto_7388 ?auto_7389 ) ) ( ON ?auto_7386 ?auto_7390 ) ( not ( = ?auto_7386 ?auto_7390 ) ) ( not ( = ?auto_7387 ?auto_7390 ) ) ( not ( = ?auto_7388 ?auto_7390 ) ) ( not ( = ?auto_7389 ?auto_7390 ) ) ( ON ?auto_7387 ?auto_7386 ) ( ON-TABLE ?auto_7390 ) ( ON ?auto_7388 ?auto_7387 ) ( CLEAR ?auto_7388 ) ( HOLDING ?auto_7389 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7389 )
      ( MAKE-4PILE ?auto_7386 ?auto_7387 ?auto_7388 ?auto_7389 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7391 - BLOCK
      ?auto_7392 - BLOCK
      ?auto_7393 - BLOCK
      ?auto_7394 - BLOCK
    )
    :vars
    (
      ?auto_7395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7391 ?auto_7392 ) ) ( not ( = ?auto_7391 ?auto_7393 ) ) ( not ( = ?auto_7391 ?auto_7394 ) ) ( not ( = ?auto_7392 ?auto_7393 ) ) ( not ( = ?auto_7392 ?auto_7394 ) ) ( not ( = ?auto_7393 ?auto_7394 ) ) ( ON ?auto_7391 ?auto_7395 ) ( not ( = ?auto_7391 ?auto_7395 ) ) ( not ( = ?auto_7392 ?auto_7395 ) ) ( not ( = ?auto_7393 ?auto_7395 ) ) ( not ( = ?auto_7394 ?auto_7395 ) ) ( ON ?auto_7392 ?auto_7391 ) ( ON-TABLE ?auto_7395 ) ( ON ?auto_7393 ?auto_7392 ) ( ON ?auto_7394 ?auto_7393 ) ( CLEAR ?auto_7394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7395 ?auto_7391 ?auto_7392 ?auto_7393 )
      ( MAKE-4PILE ?auto_7391 ?auto_7392 ?auto_7393 ?auto_7394 ) )
  )

)

