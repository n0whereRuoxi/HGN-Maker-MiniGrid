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
      ?auto_7892 - BLOCK
      ?auto_7893 - BLOCK
      ?auto_7894 - BLOCK
      ?auto_7895 - BLOCK
    )
    :vars
    (
      ?auto_7896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7896 ?auto_7895 ) ( CLEAR ?auto_7896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7892 ) ( ON ?auto_7893 ?auto_7892 ) ( ON ?auto_7894 ?auto_7893 ) ( ON ?auto_7895 ?auto_7894 ) ( not ( = ?auto_7892 ?auto_7893 ) ) ( not ( = ?auto_7892 ?auto_7894 ) ) ( not ( = ?auto_7892 ?auto_7895 ) ) ( not ( = ?auto_7892 ?auto_7896 ) ) ( not ( = ?auto_7893 ?auto_7894 ) ) ( not ( = ?auto_7893 ?auto_7895 ) ) ( not ( = ?auto_7893 ?auto_7896 ) ) ( not ( = ?auto_7894 ?auto_7895 ) ) ( not ( = ?auto_7894 ?auto_7896 ) ) ( not ( = ?auto_7895 ?auto_7896 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7896 ?auto_7895 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7898 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7898 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_7898 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7899 - BLOCK
    )
    :vars
    (
      ?auto_7900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7899 ?auto_7900 ) ( CLEAR ?auto_7899 ) ( HAND-EMPTY ) ( not ( = ?auto_7899 ?auto_7900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7899 ?auto_7900 )
      ( MAKE-1PILE ?auto_7899 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7904 - BLOCK
      ?auto_7905 - BLOCK
      ?auto_7906 - BLOCK
    )
    :vars
    (
      ?auto_7907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7907 ?auto_7906 ) ( CLEAR ?auto_7907 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7904 ) ( ON ?auto_7905 ?auto_7904 ) ( ON ?auto_7906 ?auto_7905 ) ( not ( = ?auto_7904 ?auto_7905 ) ) ( not ( = ?auto_7904 ?auto_7906 ) ) ( not ( = ?auto_7904 ?auto_7907 ) ) ( not ( = ?auto_7905 ?auto_7906 ) ) ( not ( = ?auto_7905 ?auto_7907 ) ) ( not ( = ?auto_7906 ?auto_7907 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7907 ?auto_7906 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7908 - BLOCK
      ?auto_7909 - BLOCK
      ?auto_7910 - BLOCK
    )
    :vars
    (
      ?auto_7911 - BLOCK
      ?auto_7912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7911 ?auto_7910 ) ( CLEAR ?auto_7911 ) ( ON-TABLE ?auto_7908 ) ( ON ?auto_7909 ?auto_7908 ) ( ON ?auto_7910 ?auto_7909 ) ( not ( = ?auto_7908 ?auto_7909 ) ) ( not ( = ?auto_7908 ?auto_7910 ) ) ( not ( = ?auto_7908 ?auto_7911 ) ) ( not ( = ?auto_7909 ?auto_7910 ) ) ( not ( = ?auto_7909 ?auto_7911 ) ) ( not ( = ?auto_7910 ?auto_7911 ) ) ( HOLDING ?auto_7912 ) ( not ( = ?auto_7908 ?auto_7912 ) ) ( not ( = ?auto_7909 ?auto_7912 ) ) ( not ( = ?auto_7910 ?auto_7912 ) ) ( not ( = ?auto_7911 ?auto_7912 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_7912 )
      ( MAKE-3PILE ?auto_7908 ?auto_7909 ?auto_7910 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7913 - BLOCK
      ?auto_7914 - BLOCK
      ?auto_7915 - BLOCK
    )
    :vars
    (
      ?auto_7916 - BLOCK
      ?auto_7917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7916 ?auto_7915 ) ( ON-TABLE ?auto_7913 ) ( ON ?auto_7914 ?auto_7913 ) ( ON ?auto_7915 ?auto_7914 ) ( not ( = ?auto_7913 ?auto_7914 ) ) ( not ( = ?auto_7913 ?auto_7915 ) ) ( not ( = ?auto_7913 ?auto_7916 ) ) ( not ( = ?auto_7914 ?auto_7915 ) ) ( not ( = ?auto_7914 ?auto_7916 ) ) ( not ( = ?auto_7915 ?auto_7916 ) ) ( not ( = ?auto_7913 ?auto_7917 ) ) ( not ( = ?auto_7914 ?auto_7917 ) ) ( not ( = ?auto_7915 ?auto_7917 ) ) ( not ( = ?auto_7916 ?auto_7917 ) ) ( ON ?auto_7917 ?auto_7916 ) ( CLEAR ?auto_7917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7913 ?auto_7914 ?auto_7915 ?auto_7916 )
      ( MAKE-3PILE ?auto_7913 ?auto_7914 ?auto_7915 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7920 - BLOCK
      ?auto_7921 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7921 ) ( CLEAR ?auto_7920 ) ( ON-TABLE ?auto_7920 ) ( not ( = ?auto_7920 ?auto_7921 ) ) )
    :subtasks
    ( ( !STACK ?auto_7921 ?auto_7920 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7922 - BLOCK
      ?auto_7923 - BLOCK
    )
    :vars
    (
      ?auto_7924 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7922 ) ( ON-TABLE ?auto_7922 ) ( not ( = ?auto_7922 ?auto_7923 ) ) ( ON ?auto_7923 ?auto_7924 ) ( CLEAR ?auto_7923 ) ( HAND-EMPTY ) ( not ( = ?auto_7922 ?auto_7924 ) ) ( not ( = ?auto_7923 ?auto_7924 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7923 ?auto_7924 )
      ( MAKE-2PILE ?auto_7922 ?auto_7923 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7925 - BLOCK
      ?auto_7926 - BLOCK
    )
    :vars
    (
      ?auto_7927 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7925 ?auto_7926 ) ) ( ON ?auto_7926 ?auto_7927 ) ( CLEAR ?auto_7926 ) ( not ( = ?auto_7925 ?auto_7927 ) ) ( not ( = ?auto_7926 ?auto_7927 ) ) ( HOLDING ?auto_7925 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7925 )
      ( MAKE-2PILE ?auto_7925 ?auto_7926 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7928 - BLOCK
      ?auto_7929 - BLOCK
    )
    :vars
    (
      ?auto_7930 - BLOCK
      ?auto_7932 - BLOCK
      ?auto_7931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7928 ?auto_7929 ) ) ( ON ?auto_7929 ?auto_7930 ) ( not ( = ?auto_7928 ?auto_7930 ) ) ( not ( = ?auto_7929 ?auto_7930 ) ) ( ON ?auto_7928 ?auto_7929 ) ( CLEAR ?auto_7928 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7932 ) ( ON ?auto_7931 ?auto_7932 ) ( ON ?auto_7930 ?auto_7931 ) ( not ( = ?auto_7932 ?auto_7931 ) ) ( not ( = ?auto_7932 ?auto_7930 ) ) ( not ( = ?auto_7932 ?auto_7929 ) ) ( not ( = ?auto_7932 ?auto_7928 ) ) ( not ( = ?auto_7931 ?auto_7930 ) ) ( not ( = ?auto_7931 ?auto_7929 ) ) ( not ( = ?auto_7931 ?auto_7928 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7932 ?auto_7931 ?auto_7930 ?auto_7929 )
      ( MAKE-2PILE ?auto_7928 ?auto_7929 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7935 - BLOCK
      ?auto_7936 - BLOCK
    )
    :vars
    (
      ?auto_7937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7937 ?auto_7936 ) ( CLEAR ?auto_7937 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7935 ) ( ON ?auto_7936 ?auto_7935 ) ( not ( = ?auto_7935 ?auto_7936 ) ) ( not ( = ?auto_7935 ?auto_7937 ) ) ( not ( = ?auto_7936 ?auto_7937 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7937 ?auto_7936 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7938 - BLOCK
      ?auto_7939 - BLOCK
    )
    :vars
    (
      ?auto_7940 - BLOCK
      ?auto_7941 - BLOCK
      ?auto_7942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7940 ?auto_7939 ) ( CLEAR ?auto_7940 ) ( ON-TABLE ?auto_7938 ) ( ON ?auto_7939 ?auto_7938 ) ( not ( = ?auto_7938 ?auto_7939 ) ) ( not ( = ?auto_7938 ?auto_7940 ) ) ( not ( = ?auto_7939 ?auto_7940 ) ) ( HOLDING ?auto_7941 ) ( CLEAR ?auto_7942 ) ( not ( = ?auto_7938 ?auto_7941 ) ) ( not ( = ?auto_7938 ?auto_7942 ) ) ( not ( = ?auto_7939 ?auto_7941 ) ) ( not ( = ?auto_7939 ?auto_7942 ) ) ( not ( = ?auto_7940 ?auto_7941 ) ) ( not ( = ?auto_7940 ?auto_7942 ) ) ( not ( = ?auto_7941 ?auto_7942 ) ) )
    :subtasks
    ( ( !STACK ?auto_7941 ?auto_7942 )
      ( MAKE-2PILE ?auto_7938 ?auto_7939 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8138 - BLOCK
      ?auto_8139 - BLOCK
    )
    :vars
    (
      ?auto_8141 - BLOCK
      ?auto_8140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8141 ?auto_8139 ) ( ON-TABLE ?auto_8138 ) ( ON ?auto_8139 ?auto_8138 ) ( not ( = ?auto_8138 ?auto_8139 ) ) ( not ( = ?auto_8138 ?auto_8141 ) ) ( not ( = ?auto_8139 ?auto_8141 ) ) ( not ( = ?auto_8138 ?auto_8140 ) ) ( not ( = ?auto_8139 ?auto_8140 ) ) ( not ( = ?auto_8141 ?auto_8140 ) ) ( ON ?auto_8140 ?auto_8141 ) ( CLEAR ?auto_8140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8138 ?auto_8139 ?auto_8141 )
      ( MAKE-2PILE ?auto_8138 ?auto_8139 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7948 - BLOCK
      ?auto_7949 - BLOCK
    )
    :vars
    (
      ?auto_7952 - BLOCK
      ?auto_7950 - BLOCK
      ?auto_7951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7952 ?auto_7949 ) ( ON-TABLE ?auto_7948 ) ( ON ?auto_7949 ?auto_7948 ) ( not ( = ?auto_7948 ?auto_7949 ) ) ( not ( = ?auto_7948 ?auto_7952 ) ) ( not ( = ?auto_7949 ?auto_7952 ) ) ( not ( = ?auto_7948 ?auto_7950 ) ) ( not ( = ?auto_7948 ?auto_7951 ) ) ( not ( = ?auto_7949 ?auto_7950 ) ) ( not ( = ?auto_7949 ?auto_7951 ) ) ( not ( = ?auto_7952 ?auto_7950 ) ) ( not ( = ?auto_7952 ?auto_7951 ) ) ( not ( = ?auto_7950 ?auto_7951 ) ) ( ON ?auto_7950 ?auto_7952 ) ( CLEAR ?auto_7950 ) ( HOLDING ?auto_7951 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7951 )
      ( MAKE-2PILE ?auto_7948 ?auto_7949 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7953 - BLOCK
      ?auto_7954 - BLOCK
    )
    :vars
    (
      ?auto_7957 - BLOCK
      ?auto_7956 - BLOCK
      ?auto_7955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7957 ?auto_7954 ) ( ON-TABLE ?auto_7953 ) ( ON ?auto_7954 ?auto_7953 ) ( not ( = ?auto_7953 ?auto_7954 ) ) ( not ( = ?auto_7953 ?auto_7957 ) ) ( not ( = ?auto_7954 ?auto_7957 ) ) ( not ( = ?auto_7953 ?auto_7956 ) ) ( not ( = ?auto_7953 ?auto_7955 ) ) ( not ( = ?auto_7954 ?auto_7956 ) ) ( not ( = ?auto_7954 ?auto_7955 ) ) ( not ( = ?auto_7957 ?auto_7956 ) ) ( not ( = ?auto_7957 ?auto_7955 ) ) ( not ( = ?auto_7956 ?auto_7955 ) ) ( ON ?auto_7956 ?auto_7957 ) ( ON ?auto_7955 ?auto_7956 ) ( CLEAR ?auto_7955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7953 ?auto_7954 ?auto_7957 ?auto_7956 )
      ( MAKE-2PILE ?auto_7953 ?auto_7954 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7961 - BLOCK
      ?auto_7962 - BLOCK
      ?auto_7963 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7963 ) ( CLEAR ?auto_7962 ) ( ON-TABLE ?auto_7961 ) ( ON ?auto_7962 ?auto_7961 ) ( not ( = ?auto_7961 ?auto_7962 ) ) ( not ( = ?auto_7961 ?auto_7963 ) ) ( not ( = ?auto_7962 ?auto_7963 ) ) )
    :subtasks
    ( ( !STACK ?auto_7963 ?auto_7962 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7964 - BLOCK
      ?auto_7965 - BLOCK
      ?auto_7966 - BLOCK
    )
    :vars
    (
      ?auto_7967 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7965 ) ( ON-TABLE ?auto_7964 ) ( ON ?auto_7965 ?auto_7964 ) ( not ( = ?auto_7964 ?auto_7965 ) ) ( not ( = ?auto_7964 ?auto_7966 ) ) ( not ( = ?auto_7965 ?auto_7966 ) ) ( ON ?auto_7966 ?auto_7967 ) ( CLEAR ?auto_7966 ) ( HAND-EMPTY ) ( not ( = ?auto_7964 ?auto_7967 ) ) ( not ( = ?auto_7965 ?auto_7967 ) ) ( not ( = ?auto_7966 ?auto_7967 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7966 ?auto_7967 )
      ( MAKE-3PILE ?auto_7964 ?auto_7965 ?auto_7966 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7968 - BLOCK
      ?auto_7969 - BLOCK
      ?auto_7970 - BLOCK
    )
    :vars
    (
      ?auto_7971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7968 ) ( not ( = ?auto_7968 ?auto_7969 ) ) ( not ( = ?auto_7968 ?auto_7970 ) ) ( not ( = ?auto_7969 ?auto_7970 ) ) ( ON ?auto_7970 ?auto_7971 ) ( CLEAR ?auto_7970 ) ( not ( = ?auto_7968 ?auto_7971 ) ) ( not ( = ?auto_7969 ?auto_7971 ) ) ( not ( = ?auto_7970 ?auto_7971 ) ) ( HOLDING ?auto_7969 ) ( CLEAR ?auto_7968 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7968 ?auto_7969 )
      ( MAKE-3PILE ?auto_7968 ?auto_7969 ?auto_7970 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7972 - BLOCK
      ?auto_7973 - BLOCK
      ?auto_7974 - BLOCK
    )
    :vars
    (
      ?auto_7975 - BLOCK
      ?auto_7976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7972 ) ( not ( = ?auto_7972 ?auto_7973 ) ) ( not ( = ?auto_7972 ?auto_7974 ) ) ( not ( = ?auto_7973 ?auto_7974 ) ) ( ON ?auto_7974 ?auto_7975 ) ( not ( = ?auto_7972 ?auto_7975 ) ) ( not ( = ?auto_7973 ?auto_7975 ) ) ( not ( = ?auto_7974 ?auto_7975 ) ) ( CLEAR ?auto_7972 ) ( ON ?auto_7973 ?auto_7974 ) ( CLEAR ?auto_7973 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7976 ) ( ON ?auto_7975 ?auto_7976 ) ( not ( = ?auto_7976 ?auto_7975 ) ) ( not ( = ?auto_7976 ?auto_7974 ) ) ( not ( = ?auto_7976 ?auto_7973 ) ) ( not ( = ?auto_7972 ?auto_7976 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7976 ?auto_7975 ?auto_7974 )
      ( MAKE-3PILE ?auto_7972 ?auto_7973 ?auto_7974 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7977 - BLOCK
      ?auto_7978 - BLOCK
      ?auto_7979 - BLOCK
    )
    :vars
    (
      ?auto_7981 - BLOCK
      ?auto_7980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7977 ?auto_7978 ) ) ( not ( = ?auto_7977 ?auto_7979 ) ) ( not ( = ?auto_7978 ?auto_7979 ) ) ( ON ?auto_7979 ?auto_7981 ) ( not ( = ?auto_7977 ?auto_7981 ) ) ( not ( = ?auto_7978 ?auto_7981 ) ) ( not ( = ?auto_7979 ?auto_7981 ) ) ( ON ?auto_7978 ?auto_7979 ) ( CLEAR ?auto_7978 ) ( ON-TABLE ?auto_7980 ) ( ON ?auto_7981 ?auto_7980 ) ( not ( = ?auto_7980 ?auto_7981 ) ) ( not ( = ?auto_7980 ?auto_7979 ) ) ( not ( = ?auto_7980 ?auto_7978 ) ) ( not ( = ?auto_7977 ?auto_7980 ) ) ( HOLDING ?auto_7977 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7977 )
      ( MAKE-3PILE ?auto_7977 ?auto_7978 ?auto_7979 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7982 - BLOCK
      ?auto_7983 - BLOCK
      ?auto_7984 - BLOCK
    )
    :vars
    (
      ?auto_7986 - BLOCK
      ?auto_7985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7982 ?auto_7983 ) ) ( not ( = ?auto_7982 ?auto_7984 ) ) ( not ( = ?auto_7983 ?auto_7984 ) ) ( ON ?auto_7984 ?auto_7986 ) ( not ( = ?auto_7982 ?auto_7986 ) ) ( not ( = ?auto_7983 ?auto_7986 ) ) ( not ( = ?auto_7984 ?auto_7986 ) ) ( ON ?auto_7983 ?auto_7984 ) ( ON-TABLE ?auto_7985 ) ( ON ?auto_7986 ?auto_7985 ) ( not ( = ?auto_7985 ?auto_7986 ) ) ( not ( = ?auto_7985 ?auto_7984 ) ) ( not ( = ?auto_7985 ?auto_7983 ) ) ( not ( = ?auto_7982 ?auto_7985 ) ) ( ON ?auto_7982 ?auto_7983 ) ( CLEAR ?auto_7982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7985 ?auto_7986 ?auto_7984 ?auto_7983 )
      ( MAKE-3PILE ?auto_7982 ?auto_7983 ?auto_7984 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7988 - BLOCK
    )
    :vars
    (
      ?auto_7989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7989 ?auto_7988 ) ( CLEAR ?auto_7989 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7988 ) ( not ( = ?auto_7988 ?auto_7989 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7989 ?auto_7988 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7990 - BLOCK
    )
    :vars
    (
      ?auto_7991 - BLOCK
      ?auto_7992 - BLOCK
      ?auto_7993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7991 ?auto_7990 ) ( CLEAR ?auto_7991 ) ( ON-TABLE ?auto_7990 ) ( not ( = ?auto_7990 ?auto_7991 ) ) ( HOLDING ?auto_7992 ) ( CLEAR ?auto_7993 ) ( not ( = ?auto_7990 ?auto_7992 ) ) ( not ( = ?auto_7990 ?auto_7993 ) ) ( not ( = ?auto_7991 ?auto_7992 ) ) ( not ( = ?auto_7991 ?auto_7993 ) ) ( not ( = ?auto_7992 ?auto_7993 ) ) )
    :subtasks
    ( ( !STACK ?auto_7992 ?auto_7993 )
      ( MAKE-1PILE ?auto_7990 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7994 - BLOCK
    )
    :vars
    (
      ?auto_7997 - BLOCK
      ?auto_7996 - BLOCK
      ?auto_7995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7997 ?auto_7994 ) ( ON-TABLE ?auto_7994 ) ( not ( = ?auto_7994 ?auto_7997 ) ) ( CLEAR ?auto_7996 ) ( not ( = ?auto_7994 ?auto_7995 ) ) ( not ( = ?auto_7994 ?auto_7996 ) ) ( not ( = ?auto_7997 ?auto_7995 ) ) ( not ( = ?auto_7997 ?auto_7996 ) ) ( not ( = ?auto_7995 ?auto_7996 ) ) ( ON ?auto_7995 ?auto_7997 ) ( CLEAR ?auto_7995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7994 ?auto_7997 )
      ( MAKE-1PILE ?auto_7994 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7998 - BLOCK
    )
    :vars
    (
      ?auto_8001 - BLOCK
      ?auto_8000 - BLOCK
      ?auto_7999 - BLOCK
      ?auto_8002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8001 ?auto_7998 ) ( ON-TABLE ?auto_7998 ) ( not ( = ?auto_7998 ?auto_8001 ) ) ( not ( = ?auto_7998 ?auto_8000 ) ) ( not ( = ?auto_7998 ?auto_7999 ) ) ( not ( = ?auto_8001 ?auto_8000 ) ) ( not ( = ?auto_8001 ?auto_7999 ) ) ( not ( = ?auto_8000 ?auto_7999 ) ) ( ON ?auto_8000 ?auto_8001 ) ( CLEAR ?auto_8000 ) ( HOLDING ?auto_7999 ) ( CLEAR ?auto_8002 ) ( ON-TABLE ?auto_8002 ) ( not ( = ?auto_8002 ?auto_7999 ) ) ( not ( = ?auto_7998 ?auto_8002 ) ) ( not ( = ?auto_8001 ?auto_8002 ) ) ( not ( = ?auto_8000 ?auto_8002 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8002 ?auto_7999 )
      ( MAKE-1PILE ?auto_7998 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8226 - BLOCK
    )
    :vars
    (
      ?auto_8228 - BLOCK
      ?auto_8229 - BLOCK
      ?auto_8227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8228 ?auto_8226 ) ( ON-TABLE ?auto_8226 ) ( not ( = ?auto_8226 ?auto_8228 ) ) ( not ( = ?auto_8226 ?auto_8229 ) ) ( not ( = ?auto_8226 ?auto_8227 ) ) ( not ( = ?auto_8228 ?auto_8229 ) ) ( not ( = ?auto_8228 ?auto_8227 ) ) ( not ( = ?auto_8229 ?auto_8227 ) ) ( ON ?auto_8229 ?auto_8228 ) ( ON ?auto_8227 ?auto_8229 ) ( CLEAR ?auto_8227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8226 ?auto_8228 ?auto_8229 )
      ( MAKE-1PILE ?auto_8226 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8008 - BLOCK
    )
    :vars
    (
      ?auto_8009 - BLOCK
      ?auto_8010 - BLOCK
      ?auto_8012 - BLOCK
      ?auto_8011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8009 ?auto_8008 ) ( ON-TABLE ?auto_8008 ) ( not ( = ?auto_8008 ?auto_8009 ) ) ( not ( = ?auto_8008 ?auto_8010 ) ) ( not ( = ?auto_8008 ?auto_8012 ) ) ( not ( = ?auto_8009 ?auto_8010 ) ) ( not ( = ?auto_8009 ?auto_8012 ) ) ( not ( = ?auto_8010 ?auto_8012 ) ) ( ON ?auto_8010 ?auto_8009 ) ( not ( = ?auto_8011 ?auto_8012 ) ) ( not ( = ?auto_8008 ?auto_8011 ) ) ( not ( = ?auto_8009 ?auto_8011 ) ) ( not ( = ?auto_8010 ?auto_8011 ) ) ( ON ?auto_8012 ?auto_8010 ) ( CLEAR ?auto_8012 ) ( HOLDING ?auto_8011 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8011 )
      ( MAKE-1PILE ?auto_8008 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8013 - BLOCK
    )
    :vars
    (
      ?auto_8015 - BLOCK
      ?auto_8016 - BLOCK
      ?auto_8014 - BLOCK
      ?auto_8017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8015 ?auto_8013 ) ( ON-TABLE ?auto_8013 ) ( not ( = ?auto_8013 ?auto_8015 ) ) ( not ( = ?auto_8013 ?auto_8016 ) ) ( not ( = ?auto_8013 ?auto_8014 ) ) ( not ( = ?auto_8015 ?auto_8016 ) ) ( not ( = ?auto_8015 ?auto_8014 ) ) ( not ( = ?auto_8016 ?auto_8014 ) ) ( ON ?auto_8016 ?auto_8015 ) ( not ( = ?auto_8017 ?auto_8014 ) ) ( not ( = ?auto_8013 ?auto_8017 ) ) ( not ( = ?auto_8015 ?auto_8017 ) ) ( not ( = ?auto_8016 ?auto_8017 ) ) ( ON ?auto_8014 ?auto_8016 ) ( ON ?auto_8017 ?auto_8014 ) ( CLEAR ?auto_8017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8013 ?auto_8015 ?auto_8016 ?auto_8014 )
      ( MAKE-1PILE ?auto_8013 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8022 - BLOCK
      ?auto_8023 - BLOCK
      ?auto_8024 - BLOCK
      ?auto_8025 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8025 ) ( CLEAR ?auto_8024 ) ( ON-TABLE ?auto_8022 ) ( ON ?auto_8023 ?auto_8022 ) ( ON ?auto_8024 ?auto_8023 ) ( not ( = ?auto_8022 ?auto_8023 ) ) ( not ( = ?auto_8022 ?auto_8024 ) ) ( not ( = ?auto_8022 ?auto_8025 ) ) ( not ( = ?auto_8023 ?auto_8024 ) ) ( not ( = ?auto_8023 ?auto_8025 ) ) ( not ( = ?auto_8024 ?auto_8025 ) ) )
    :subtasks
    ( ( !STACK ?auto_8025 ?auto_8024 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8026 - BLOCK
      ?auto_8027 - BLOCK
      ?auto_8028 - BLOCK
      ?auto_8029 - BLOCK
    )
    :vars
    (
      ?auto_8030 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8028 ) ( ON-TABLE ?auto_8026 ) ( ON ?auto_8027 ?auto_8026 ) ( ON ?auto_8028 ?auto_8027 ) ( not ( = ?auto_8026 ?auto_8027 ) ) ( not ( = ?auto_8026 ?auto_8028 ) ) ( not ( = ?auto_8026 ?auto_8029 ) ) ( not ( = ?auto_8027 ?auto_8028 ) ) ( not ( = ?auto_8027 ?auto_8029 ) ) ( not ( = ?auto_8028 ?auto_8029 ) ) ( ON ?auto_8029 ?auto_8030 ) ( CLEAR ?auto_8029 ) ( HAND-EMPTY ) ( not ( = ?auto_8026 ?auto_8030 ) ) ( not ( = ?auto_8027 ?auto_8030 ) ) ( not ( = ?auto_8028 ?auto_8030 ) ) ( not ( = ?auto_8029 ?auto_8030 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8029 ?auto_8030 )
      ( MAKE-4PILE ?auto_8026 ?auto_8027 ?auto_8028 ?auto_8029 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8031 - BLOCK
      ?auto_8032 - BLOCK
      ?auto_8033 - BLOCK
      ?auto_8034 - BLOCK
    )
    :vars
    (
      ?auto_8035 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8031 ) ( ON ?auto_8032 ?auto_8031 ) ( not ( = ?auto_8031 ?auto_8032 ) ) ( not ( = ?auto_8031 ?auto_8033 ) ) ( not ( = ?auto_8031 ?auto_8034 ) ) ( not ( = ?auto_8032 ?auto_8033 ) ) ( not ( = ?auto_8032 ?auto_8034 ) ) ( not ( = ?auto_8033 ?auto_8034 ) ) ( ON ?auto_8034 ?auto_8035 ) ( CLEAR ?auto_8034 ) ( not ( = ?auto_8031 ?auto_8035 ) ) ( not ( = ?auto_8032 ?auto_8035 ) ) ( not ( = ?auto_8033 ?auto_8035 ) ) ( not ( = ?auto_8034 ?auto_8035 ) ) ( HOLDING ?auto_8033 ) ( CLEAR ?auto_8032 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8031 ?auto_8032 ?auto_8033 )
      ( MAKE-4PILE ?auto_8031 ?auto_8032 ?auto_8033 ?auto_8034 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8036 - BLOCK
      ?auto_8037 - BLOCK
      ?auto_8038 - BLOCK
      ?auto_8039 - BLOCK
    )
    :vars
    (
      ?auto_8040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8036 ) ( ON ?auto_8037 ?auto_8036 ) ( not ( = ?auto_8036 ?auto_8037 ) ) ( not ( = ?auto_8036 ?auto_8038 ) ) ( not ( = ?auto_8036 ?auto_8039 ) ) ( not ( = ?auto_8037 ?auto_8038 ) ) ( not ( = ?auto_8037 ?auto_8039 ) ) ( not ( = ?auto_8038 ?auto_8039 ) ) ( ON ?auto_8039 ?auto_8040 ) ( not ( = ?auto_8036 ?auto_8040 ) ) ( not ( = ?auto_8037 ?auto_8040 ) ) ( not ( = ?auto_8038 ?auto_8040 ) ) ( not ( = ?auto_8039 ?auto_8040 ) ) ( CLEAR ?auto_8037 ) ( ON ?auto_8038 ?auto_8039 ) ( CLEAR ?auto_8038 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8040 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8040 ?auto_8039 )
      ( MAKE-4PILE ?auto_8036 ?auto_8037 ?auto_8038 ?auto_8039 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8041 - BLOCK
      ?auto_8042 - BLOCK
      ?auto_8043 - BLOCK
      ?auto_8044 - BLOCK
    )
    :vars
    (
      ?auto_8045 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8041 ) ( not ( = ?auto_8041 ?auto_8042 ) ) ( not ( = ?auto_8041 ?auto_8043 ) ) ( not ( = ?auto_8041 ?auto_8044 ) ) ( not ( = ?auto_8042 ?auto_8043 ) ) ( not ( = ?auto_8042 ?auto_8044 ) ) ( not ( = ?auto_8043 ?auto_8044 ) ) ( ON ?auto_8044 ?auto_8045 ) ( not ( = ?auto_8041 ?auto_8045 ) ) ( not ( = ?auto_8042 ?auto_8045 ) ) ( not ( = ?auto_8043 ?auto_8045 ) ) ( not ( = ?auto_8044 ?auto_8045 ) ) ( ON ?auto_8043 ?auto_8044 ) ( CLEAR ?auto_8043 ) ( ON-TABLE ?auto_8045 ) ( HOLDING ?auto_8042 ) ( CLEAR ?auto_8041 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8041 ?auto_8042 )
      ( MAKE-4PILE ?auto_8041 ?auto_8042 ?auto_8043 ?auto_8044 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8046 - BLOCK
      ?auto_8047 - BLOCK
      ?auto_8048 - BLOCK
      ?auto_8049 - BLOCK
    )
    :vars
    (
      ?auto_8050 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8046 ) ( not ( = ?auto_8046 ?auto_8047 ) ) ( not ( = ?auto_8046 ?auto_8048 ) ) ( not ( = ?auto_8046 ?auto_8049 ) ) ( not ( = ?auto_8047 ?auto_8048 ) ) ( not ( = ?auto_8047 ?auto_8049 ) ) ( not ( = ?auto_8048 ?auto_8049 ) ) ( ON ?auto_8049 ?auto_8050 ) ( not ( = ?auto_8046 ?auto_8050 ) ) ( not ( = ?auto_8047 ?auto_8050 ) ) ( not ( = ?auto_8048 ?auto_8050 ) ) ( not ( = ?auto_8049 ?auto_8050 ) ) ( ON ?auto_8048 ?auto_8049 ) ( ON-TABLE ?auto_8050 ) ( CLEAR ?auto_8046 ) ( ON ?auto_8047 ?auto_8048 ) ( CLEAR ?auto_8047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8050 ?auto_8049 ?auto_8048 )
      ( MAKE-4PILE ?auto_8046 ?auto_8047 ?auto_8048 ?auto_8049 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8051 - BLOCK
      ?auto_8052 - BLOCK
      ?auto_8053 - BLOCK
      ?auto_8054 - BLOCK
    )
    :vars
    (
      ?auto_8055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8051 ?auto_8052 ) ) ( not ( = ?auto_8051 ?auto_8053 ) ) ( not ( = ?auto_8051 ?auto_8054 ) ) ( not ( = ?auto_8052 ?auto_8053 ) ) ( not ( = ?auto_8052 ?auto_8054 ) ) ( not ( = ?auto_8053 ?auto_8054 ) ) ( ON ?auto_8054 ?auto_8055 ) ( not ( = ?auto_8051 ?auto_8055 ) ) ( not ( = ?auto_8052 ?auto_8055 ) ) ( not ( = ?auto_8053 ?auto_8055 ) ) ( not ( = ?auto_8054 ?auto_8055 ) ) ( ON ?auto_8053 ?auto_8054 ) ( ON-TABLE ?auto_8055 ) ( ON ?auto_8052 ?auto_8053 ) ( CLEAR ?auto_8052 ) ( HOLDING ?auto_8051 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8051 )
      ( MAKE-4PILE ?auto_8051 ?auto_8052 ?auto_8053 ?auto_8054 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8056 - BLOCK
      ?auto_8057 - BLOCK
      ?auto_8058 - BLOCK
      ?auto_8059 - BLOCK
    )
    :vars
    (
      ?auto_8060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8056 ?auto_8057 ) ) ( not ( = ?auto_8056 ?auto_8058 ) ) ( not ( = ?auto_8056 ?auto_8059 ) ) ( not ( = ?auto_8057 ?auto_8058 ) ) ( not ( = ?auto_8057 ?auto_8059 ) ) ( not ( = ?auto_8058 ?auto_8059 ) ) ( ON ?auto_8059 ?auto_8060 ) ( not ( = ?auto_8056 ?auto_8060 ) ) ( not ( = ?auto_8057 ?auto_8060 ) ) ( not ( = ?auto_8058 ?auto_8060 ) ) ( not ( = ?auto_8059 ?auto_8060 ) ) ( ON ?auto_8058 ?auto_8059 ) ( ON-TABLE ?auto_8060 ) ( ON ?auto_8057 ?auto_8058 ) ( ON ?auto_8056 ?auto_8057 ) ( CLEAR ?auto_8056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8060 ?auto_8059 ?auto_8058 ?auto_8057 )
      ( MAKE-4PILE ?auto_8056 ?auto_8057 ?auto_8058 ?auto_8059 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8101 - BLOCK
    )
    :vars
    (
      ?auto_8102 - BLOCK
      ?auto_8103 - BLOCK
      ?auto_8104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8101 ?auto_8102 ) ( CLEAR ?auto_8101 ) ( not ( = ?auto_8101 ?auto_8102 ) ) ( HOLDING ?auto_8103 ) ( CLEAR ?auto_8104 ) ( not ( = ?auto_8101 ?auto_8103 ) ) ( not ( = ?auto_8101 ?auto_8104 ) ) ( not ( = ?auto_8102 ?auto_8103 ) ) ( not ( = ?auto_8102 ?auto_8104 ) ) ( not ( = ?auto_8103 ?auto_8104 ) ) )
    :subtasks
    ( ( !STACK ?auto_8103 ?auto_8104 )
      ( MAKE-1PILE ?auto_8101 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8105 - BLOCK
    )
    :vars
    (
      ?auto_8107 - BLOCK
      ?auto_8108 - BLOCK
      ?auto_8106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8105 ?auto_8107 ) ( not ( = ?auto_8105 ?auto_8107 ) ) ( CLEAR ?auto_8108 ) ( not ( = ?auto_8105 ?auto_8106 ) ) ( not ( = ?auto_8105 ?auto_8108 ) ) ( not ( = ?auto_8107 ?auto_8106 ) ) ( not ( = ?auto_8107 ?auto_8108 ) ) ( not ( = ?auto_8106 ?auto_8108 ) ) ( ON ?auto_8106 ?auto_8105 ) ( CLEAR ?auto_8106 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8107 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8107 ?auto_8105 )
      ( MAKE-1PILE ?auto_8105 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8109 - BLOCK
    )
    :vars
    (
      ?auto_8111 - BLOCK
      ?auto_8110 - BLOCK
      ?auto_8112 - BLOCK
      ?auto_8113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8109 ?auto_8111 ) ( not ( = ?auto_8109 ?auto_8111 ) ) ( not ( = ?auto_8109 ?auto_8110 ) ) ( not ( = ?auto_8109 ?auto_8112 ) ) ( not ( = ?auto_8111 ?auto_8110 ) ) ( not ( = ?auto_8111 ?auto_8112 ) ) ( not ( = ?auto_8110 ?auto_8112 ) ) ( ON ?auto_8110 ?auto_8109 ) ( CLEAR ?auto_8110 ) ( ON-TABLE ?auto_8111 ) ( HOLDING ?auto_8112 ) ( CLEAR ?auto_8113 ) ( ON-TABLE ?auto_8113 ) ( not ( = ?auto_8113 ?auto_8112 ) ) ( not ( = ?auto_8109 ?auto_8113 ) ) ( not ( = ?auto_8111 ?auto_8113 ) ) ( not ( = ?auto_8110 ?auto_8113 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8113 ?auto_8112 )
      ( MAKE-1PILE ?auto_8109 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8114 - BLOCK
    )
    :vars
    (
      ?auto_8118 - BLOCK
      ?auto_8116 - BLOCK
      ?auto_8115 - BLOCK
      ?auto_8117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8114 ?auto_8118 ) ( not ( = ?auto_8114 ?auto_8118 ) ) ( not ( = ?auto_8114 ?auto_8116 ) ) ( not ( = ?auto_8114 ?auto_8115 ) ) ( not ( = ?auto_8118 ?auto_8116 ) ) ( not ( = ?auto_8118 ?auto_8115 ) ) ( not ( = ?auto_8116 ?auto_8115 ) ) ( ON ?auto_8116 ?auto_8114 ) ( ON-TABLE ?auto_8118 ) ( CLEAR ?auto_8117 ) ( ON-TABLE ?auto_8117 ) ( not ( = ?auto_8117 ?auto_8115 ) ) ( not ( = ?auto_8114 ?auto_8117 ) ) ( not ( = ?auto_8118 ?auto_8117 ) ) ( not ( = ?auto_8116 ?auto_8117 ) ) ( ON ?auto_8115 ?auto_8116 ) ( CLEAR ?auto_8115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8118 ?auto_8114 ?auto_8116 )
      ( MAKE-1PILE ?auto_8114 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8119 - BLOCK
    )
    :vars
    (
      ?auto_8121 - BLOCK
      ?auto_8120 - BLOCK
      ?auto_8122 - BLOCK
      ?auto_8123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8119 ?auto_8121 ) ( not ( = ?auto_8119 ?auto_8121 ) ) ( not ( = ?auto_8119 ?auto_8120 ) ) ( not ( = ?auto_8119 ?auto_8122 ) ) ( not ( = ?auto_8121 ?auto_8120 ) ) ( not ( = ?auto_8121 ?auto_8122 ) ) ( not ( = ?auto_8120 ?auto_8122 ) ) ( ON ?auto_8120 ?auto_8119 ) ( ON-TABLE ?auto_8121 ) ( not ( = ?auto_8123 ?auto_8122 ) ) ( not ( = ?auto_8119 ?auto_8123 ) ) ( not ( = ?auto_8121 ?auto_8123 ) ) ( not ( = ?auto_8120 ?auto_8123 ) ) ( ON ?auto_8122 ?auto_8120 ) ( CLEAR ?auto_8122 ) ( HOLDING ?auto_8123 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8123 )
      ( MAKE-1PILE ?auto_8119 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8124 - BLOCK
    )
    :vars
    (
      ?auto_8125 - BLOCK
      ?auto_8127 - BLOCK
      ?auto_8126 - BLOCK
      ?auto_8128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8124 ?auto_8125 ) ( not ( = ?auto_8124 ?auto_8125 ) ) ( not ( = ?auto_8124 ?auto_8127 ) ) ( not ( = ?auto_8124 ?auto_8126 ) ) ( not ( = ?auto_8125 ?auto_8127 ) ) ( not ( = ?auto_8125 ?auto_8126 ) ) ( not ( = ?auto_8127 ?auto_8126 ) ) ( ON ?auto_8127 ?auto_8124 ) ( ON-TABLE ?auto_8125 ) ( not ( = ?auto_8128 ?auto_8126 ) ) ( not ( = ?auto_8124 ?auto_8128 ) ) ( not ( = ?auto_8125 ?auto_8128 ) ) ( not ( = ?auto_8127 ?auto_8128 ) ) ( ON ?auto_8126 ?auto_8127 ) ( ON ?auto_8128 ?auto_8126 ) ( CLEAR ?auto_8128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8125 ?auto_8124 ?auto_8127 ?auto_8126 )
      ( MAKE-1PILE ?auto_8124 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8134 - BLOCK
      ?auto_8135 - BLOCK
    )
    :vars
    (
      ?auto_8136 - BLOCK
      ?auto_8137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8136 ?auto_8135 ) ( CLEAR ?auto_8136 ) ( ON-TABLE ?auto_8134 ) ( ON ?auto_8135 ?auto_8134 ) ( not ( = ?auto_8134 ?auto_8135 ) ) ( not ( = ?auto_8134 ?auto_8136 ) ) ( not ( = ?auto_8135 ?auto_8136 ) ) ( HOLDING ?auto_8137 ) ( not ( = ?auto_8134 ?auto_8137 ) ) ( not ( = ?auto_8135 ?auto_8137 ) ) ( not ( = ?auto_8136 ?auto_8137 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_8137 )
      ( MAKE-2PILE ?auto_8134 ?auto_8135 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8171 - BLOCK
      ?auto_8172 - BLOCK
    )
    :vars
    (
      ?auto_8173 - BLOCK
      ?auto_8174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8171 ?auto_8172 ) ) ( ON ?auto_8172 ?auto_8173 ) ( not ( = ?auto_8171 ?auto_8173 ) ) ( not ( = ?auto_8172 ?auto_8173 ) ) ( ON ?auto_8171 ?auto_8172 ) ( CLEAR ?auto_8171 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8174 ) ( ON ?auto_8173 ?auto_8174 ) ( not ( = ?auto_8174 ?auto_8173 ) ) ( not ( = ?auto_8174 ?auto_8172 ) ) ( not ( = ?auto_8174 ?auto_8171 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8174 ?auto_8173 ?auto_8172 )
      ( MAKE-2PILE ?auto_8171 ?auto_8172 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8177 - BLOCK
      ?auto_8178 - BLOCK
    )
    :vars
    (
      ?auto_8179 - BLOCK
      ?auto_8180 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8177 ?auto_8178 ) ) ( ON ?auto_8178 ?auto_8179 ) ( CLEAR ?auto_8178 ) ( not ( = ?auto_8177 ?auto_8179 ) ) ( not ( = ?auto_8178 ?auto_8179 ) ) ( ON ?auto_8177 ?auto_8180 ) ( CLEAR ?auto_8177 ) ( HAND-EMPTY ) ( not ( = ?auto_8177 ?auto_8180 ) ) ( not ( = ?auto_8178 ?auto_8180 ) ) ( not ( = ?auto_8179 ?auto_8180 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8177 ?auto_8180 )
      ( MAKE-2PILE ?auto_8177 ?auto_8178 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8181 - BLOCK
      ?auto_8182 - BLOCK
    )
    :vars
    (
      ?auto_8183 - BLOCK
      ?auto_8184 - BLOCK
      ?auto_8185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8181 ?auto_8182 ) ) ( not ( = ?auto_8181 ?auto_8183 ) ) ( not ( = ?auto_8182 ?auto_8183 ) ) ( ON ?auto_8181 ?auto_8184 ) ( CLEAR ?auto_8181 ) ( not ( = ?auto_8181 ?auto_8184 ) ) ( not ( = ?auto_8182 ?auto_8184 ) ) ( not ( = ?auto_8183 ?auto_8184 ) ) ( HOLDING ?auto_8182 ) ( CLEAR ?auto_8183 ) ( ON-TABLE ?auto_8185 ) ( ON ?auto_8183 ?auto_8185 ) ( not ( = ?auto_8185 ?auto_8183 ) ) ( not ( = ?auto_8185 ?auto_8182 ) ) ( not ( = ?auto_8181 ?auto_8185 ) ) ( not ( = ?auto_8184 ?auto_8185 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8185 ?auto_8183 ?auto_8182 )
      ( MAKE-2PILE ?auto_8181 ?auto_8182 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8186 - BLOCK
      ?auto_8187 - BLOCK
    )
    :vars
    (
      ?auto_8190 - BLOCK
      ?auto_8189 - BLOCK
      ?auto_8188 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8186 ?auto_8187 ) ) ( not ( = ?auto_8186 ?auto_8190 ) ) ( not ( = ?auto_8187 ?auto_8190 ) ) ( ON ?auto_8186 ?auto_8189 ) ( not ( = ?auto_8186 ?auto_8189 ) ) ( not ( = ?auto_8187 ?auto_8189 ) ) ( not ( = ?auto_8190 ?auto_8189 ) ) ( CLEAR ?auto_8190 ) ( ON-TABLE ?auto_8188 ) ( ON ?auto_8190 ?auto_8188 ) ( not ( = ?auto_8188 ?auto_8190 ) ) ( not ( = ?auto_8188 ?auto_8187 ) ) ( not ( = ?auto_8186 ?auto_8188 ) ) ( not ( = ?auto_8189 ?auto_8188 ) ) ( ON ?auto_8187 ?auto_8186 ) ( CLEAR ?auto_8187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8189 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8189 ?auto_8186 )
      ( MAKE-2PILE ?auto_8186 ?auto_8187 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8191 - BLOCK
      ?auto_8192 - BLOCK
    )
    :vars
    (
      ?auto_8193 - BLOCK
      ?auto_8195 - BLOCK
      ?auto_8194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8191 ?auto_8192 ) ) ( not ( = ?auto_8191 ?auto_8193 ) ) ( not ( = ?auto_8192 ?auto_8193 ) ) ( ON ?auto_8191 ?auto_8195 ) ( not ( = ?auto_8191 ?auto_8195 ) ) ( not ( = ?auto_8192 ?auto_8195 ) ) ( not ( = ?auto_8193 ?auto_8195 ) ) ( ON-TABLE ?auto_8194 ) ( not ( = ?auto_8194 ?auto_8193 ) ) ( not ( = ?auto_8194 ?auto_8192 ) ) ( not ( = ?auto_8191 ?auto_8194 ) ) ( not ( = ?auto_8195 ?auto_8194 ) ) ( ON ?auto_8192 ?auto_8191 ) ( CLEAR ?auto_8192 ) ( ON-TABLE ?auto_8195 ) ( HOLDING ?auto_8193 ) ( CLEAR ?auto_8194 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8194 ?auto_8193 )
      ( MAKE-2PILE ?auto_8191 ?auto_8192 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8196 - BLOCK
      ?auto_8197 - BLOCK
    )
    :vars
    (
      ?auto_8200 - BLOCK
      ?auto_8199 - BLOCK
      ?auto_8198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8196 ?auto_8197 ) ) ( not ( = ?auto_8196 ?auto_8200 ) ) ( not ( = ?auto_8197 ?auto_8200 ) ) ( ON ?auto_8196 ?auto_8199 ) ( not ( = ?auto_8196 ?auto_8199 ) ) ( not ( = ?auto_8197 ?auto_8199 ) ) ( not ( = ?auto_8200 ?auto_8199 ) ) ( ON-TABLE ?auto_8198 ) ( not ( = ?auto_8198 ?auto_8200 ) ) ( not ( = ?auto_8198 ?auto_8197 ) ) ( not ( = ?auto_8196 ?auto_8198 ) ) ( not ( = ?auto_8199 ?auto_8198 ) ) ( ON ?auto_8197 ?auto_8196 ) ( ON-TABLE ?auto_8199 ) ( CLEAR ?auto_8198 ) ( ON ?auto_8200 ?auto_8197 ) ( CLEAR ?auto_8200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8199 ?auto_8196 ?auto_8197 )
      ( MAKE-2PILE ?auto_8196 ?auto_8197 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8201 - BLOCK
      ?auto_8202 - BLOCK
    )
    :vars
    (
      ?auto_8204 - BLOCK
      ?auto_8203 - BLOCK
      ?auto_8205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8201 ?auto_8202 ) ) ( not ( = ?auto_8201 ?auto_8204 ) ) ( not ( = ?auto_8202 ?auto_8204 ) ) ( ON ?auto_8201 ?auto_8203 ) ( not ( = ?auto_8201 ?auto_8203 ) ) ( not ( = ?auto_8202 ?auto_8203 ) ) ( not ( = ?auto_8204 ?auto_8203 ) ) ( not ( = ?auto_8205 ?auto_8204 ) ) ( not ( = ?auto_8205 ?auto_8202 ) ) ( not ( = ?auto_8201 ?auto_8205 ) ) ( not ( = ?auto_8203 ?auto_8205 ) ) ( ON ?auto_8202 ?auto_8201 ) ( ON-TABLE ?auto_8203 ) ( ON ?auto_8204 ?auto_8202 ) ( CLEAR ?auto_8204 ) ( HOLDING ?auto_8205 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8205 )
      ( MAKE-2PILE ?auto_8201 ?auto_8202 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8206 - BLOCK
      ?auto_8207 - BLOCK
    )
    :vars
    (
      ?auto_8210 - BLOCK
      ?auto_8208 - BLOCK
      ?auto_8209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8206 ?auto_8207 ) ) ( not ( = ?auto_8206 ?auto_8210 ) ) ( not ( = ?auto_8207 ?auto_8210 ) ) ( ON ?auto_8206 ?auto_8208 ) ( not ( = ?auto_8206 ?auto_8208 ) ) ( not ( = ?auto_8207 ?auto_8208 ) ) ( not ( = ?auto_8210 ?auto_8208 ) ) ( not ( = ?auto_8209 ?auto_8210 ) ) ( not ( = ?auto_8209 ?auto_8207 ) ) ( not ( = ?auto_8206 ?auto_8209 ) ) ( not ( = ?auto_8208 ?auto_8209 ) ) ( ON ?auto_8207 ?auto_8206 ) ( ON-TABLE ?auto_8208 ) ( ON ?auto_8210 ?auto_8207 ) ( ON ?auto_8209 ?auto_8210 ) ( CLEAR ?auto_8209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8208 ?auto_8206 ?auto_8207 ?auto_8210 )
      ( MAKE-2PILE ?auto_8206 ?auto_8207 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8222 - BLOCK
    )
    :vars
    (
      ?auto_8223 - BLOCK
      ?auto_8225 - BLOCK
      ?auto_8224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8223 ?auto_8222 ) ( ON-TABLE ?auto_8222 ) ( not ( = ?auto_8222 ?auto_8223 ) ) ( not ( = ?auto_8222 ?auto_8225 ) ) ( not ( = ?auto_8222 ?auto_8224 ) ) ( not ( = ?auto_8223 ?auto_8225 ) ) ( not ( = ?auto_8223 ?auto_8224 ) ) ( not ( = ?auto_8225 ?auto_8224 ) ) ( ON ?auto_8225 ?auto_8223 ) ( CLEAR ?auto_8225 ) ( HOLDING ?auto_8224 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8224 )
      ( MAKE-1PILE ?auto_8222 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8255 - BLOCK
      ?auto_8256 - BLOCK
      ?auto_8257 - BLOCK
    )
    :vars
    (
      ?auto_8258 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8255 ) ( not ( = ?auto_8255 ?auto_8256 ) ) ( not ( = ?auto_8255 ?auto_8257 ) ) ( not ( = ?auto_8256 ?auto_8257 ) ) ( ON ?auto_8257 ?auto_8258 ) ( not ( = ?auto_8255 ?auto_8258 ) ) ( not ( = ?auto_8256 ?auto_8258 ) ) ( not ( = ?auto_8257 ?auto_8258 ) ) ( CLEAR ?auto_8255 ) ( ON ?auto_8256 ?auto_8257 ) ( CLEAR ?auto_8256 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8258 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8258 ?auto_8257 )
      ( MAKE-3PILE ?auto_8255 ?auto_8256 ?auto_8257 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8259 - BLOCK
      ?auto_8260 - BLOCK
      ?auto_8261 - BLOCK
    )
    :vars
    (
      ?auto_8262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8259 ?auto_8260 ) ) ( not ( = ?auto_8259 ?auto_8261 ) ) ( not ( = ?auto_8260 ?auto_8261 ) ) ( ON ?auto_8261 ?auto_8262 ) ( not ( = ?auto_8259 ?auto_8262 ) ) ( not ( = ?auto_8260 ?auto_8262 ) ) ( not ( = ?auto_8261 ?auto_8262 ) ) ( ON ?auto_8260 ?auto_8261 ) ( CLEAR ?auto_8260 ) ( ON-TABLE ?auto_8262 ) ( HOLDING ?auto_8259 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8259 )
      ( MAKE-3PILE ?auto_8259 ?auto_8260 ?auto_8261 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8263 - BLOCK
      ?auto_8264 - BLOCK
      ?auto_8265 - BLOCK
    )
    :vars
    (
      ?auto_8266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8263 ?auto_8264 ) ) ( not ( = ?auto_8263 ?auto_8265 ) ) ( not ( = ?auto_8264 ?auto_8265 ) ) ( ON ?auto_8265 ?auto_8266 ) ( not ( = ?auto_8263 ?auto_8266 ) ) ( not ( = ?auto_8264 ?auto_8266 ) ) ( not ( = ?auto_8265 ?auto_8266 ) ) ( ON ?auto_8264 ?auto_8265 ) ( ON-TABLE ?auto_8266 ) ( ON ?auto_8263 ?auto_8264 ) ( CLEAR ?auto_8263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8266 ?auto_8265 ?auto_8264 )
      ( MAKE-3PILE ?auto_8263 ?auto_8264 ?auto_8265 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8270 - BLOCK
      ?auto_8271 - BLOCK
      ?auto_8272 - BLOCK
    )
    :vars
    (
      ?auto_8273 - BLOCK
      ?auto_8274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8270 ?auto_8271 ) ) ( not ( = ?auto_8270 ?auto_8272 ) ) ( not ( = ?auto_8271 ?auto_8272 ) ) ( ON ?auto_8272 ?auto_8273 ) ( not ( = ?auto_8270 ?auto_8273 ) ) ( not ( = ?auto_8271 ?auto_8273 ) ) ( not ( = ?auto_8272 ?auto_8273 ) ) ( ON ?auto_8271 ?auto_8272 ) ( CLEAR ?auto_8271 ) ( ON-TABLE ?auto_8273 ) ( ON ?auto_8270 ?auto_8274 ) ( CLEAR ?auto_8270 ) ( HAND-EMPTY ) ( not ( = ?auto_8270 ?auto_8274 ) ) ( not ( = ?auto_8271 ?auto_8274 ) ) ( not ( = ?auto_8272 ?auto_8274 ) ) ( not ( = ?auto_8273 ?auto_8274 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8270 ?auto_8274 )
      ( MAKE-3PILE ?auto_8270 ?auto_8271 ?auto_8272 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8275 - BLOCK
      ?auto_8276 - BLOCK
      ?auto_8277 - BLOCK
    )
    :vars
    (
      ?auto_8279 - BLOCK
      ?auto_8278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8275 ?auto_8276 ) ) ( not ( = ?auto_8275 ?auto_8277 ) ) ( not ( = ?auto_8276 ?auto_8277 ) ) ( ON ?auto_8277 ?auto_8279 ) ( not ( = ?auto_8275 ?auto_8279 ) ) ( not ( = ?auto_8276 ?auto_8279 ) ) ( not ( = ?auto_8277 ?auto_8279 ) ) ( ON-TABLE ?auto_8279 ) ( ON ?auto_8275 ?auto_8278 ) ( CLEAR ?auto_8275 ) ( not ( = ?auto_8275 ?auto_8278 ) ) ( not ( = ?auto_8276 ?auto_8278 ) ) ( not ( = ?auto_8277 ?auto_8278 ) ) ( not ( = ?auto_8279 ?auto_8278 ) ) ( HOLDING ?auto_8276 ) ( CLEAR ?auto_8277 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8279 ?auto_8277 ?auto_8276 )
      ( MAKE-3PILE ?auto_8275 ?auto_8276 ?auto_8277 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8280 - BLOCK
      ?auto_8281 - BLOCK
      ?auto_8282 - BLOCK
    )
    :vars
    (
      ?auto_8284 - BLOCK
      ?auto_8283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8280 ?auto_8281 ) ) ( not ( = ?auto_8280 ?auto_8282 ) ) ( not ( = ?auto_8281 ?auto_8282 ) ) ( ON ?auto_8282 ?auto_8284 ) ( not ( = ?auto_8280 ?auto_8284 ) ) ( not ( = ?auto_8281 ?auto_8284 ) ) ( not ( = ?auto_8282 ?auto_8284 ) ) ( ON-TABLE ?auto_8284 ) ( ON ?auto_8280 ?auto_8283 ) ( not ( = ?auto_8280 ?auto_8283 ) ) ( not ( = ?auto_8281 ?auto_8283 ) ) ( not ( = ?auto_8282 ?auto_8283 ) ) ( not ( = ?auto_8284 ?auto_8283 ) ) ( CLEAR ?auto_8282 ) ( ON ?auto_8281 ?auto_8280 ) ( CLEAR ?auto_8281 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8283 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8283 ?auto_8280 )
      ( MAKE-3PILE ?auto_8280 ?auto_8281 ?auto_8282 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8285 - BLOCK
      ?auto_8286 - BLOCK
      ?auto_8287 - BLOCK
    )
    :vars
    (
      ?auto_8288 - BLOCK
      ?auto_8289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8285 ?auto_8286 ) ) ( not ( = ?auto_8285 ?auto_8287 ) ) ( not ( = ?auto_8286 ?auto_8287 ) ) ( not ( = ?auto_8285 ?auto_8288 ) ) ( not ( = ?auto_8286 ?auto_8288 ) ) ( not ( = ?auto_8287 ?auto_8288 ) ) ( ON-TABLE ?auto_8288 ) ( ON ?auto_8285 ?auto_8289 ) ( not ( = ?auto_8285 ?auto_8289 ) ) ( not ( = ?auto_8286 ?auto_8289 ) ) ( not ( = ?auto_8287 ?auto_8289 ) ) ( not ( = ?auto_8288 ?auto_8289 ) ) ( ON ?auto_8286 ?auto_8285 ) ( CLEAR ?auto_8286 ) ( ON-TABLE ?auto_8289 ) ( HOLDING ?auto_8287 ) ( CLEAR ?auto_8288 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8288 ?auto_8287 )
      ( MAKE-3PILE ?auto_8285 ?auto_8286 ?auto_8287 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8290 - BLOCK
      ?auto_8291 - BLOCK
      ?auto_8292 - BLOCK
    )
    :vars
    (
      ?auto_8293 - BLOCK
      ?auto_8294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8290 ?auto_8291 ) ) ( not ( = ?auto_8290 ?auto_8292 ) ) ( not ( = ?auto_8291 ?auto_8292 ) ) ( not ( = ?auto_8290 ?auto_8293 ) ) ( not ( = ?auto_8291 ?auto_8293 ) ) ( not ( = ?auto_8292 ?auto_8293 ) ) ( ON-TABLE ?auto_8293 ) ( ON ?auto_8290 ?auto_8294 ) ( not ( = ?auto_8290 ?auto_8294 ) ) ( not ( = ?auto_8291 ?auto_8294 ) ) ( not ( = ?auto_8292 ?auto_8294 ) ) ( not ( = ?auto_8293 ?auto_8294 ) ) ( ON ?auto_8291 ?auto_8290 ) ( ON-TABLE ?auto_8294 ) ( CLEAR ?auto_8293 ) ( ON ?auto_8292 ?auto_8291 ) ( CLEAR ?auto_8292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8294 ?auto_8290 ?auto_8291 )
      ( MAKE-3PILE ?auto_8290 ?auto_8291 ?auto_8292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8295 - BLOCK
      ?auto_8296 - BLOCK
      ?auto_8297 - BLOCK
    )
    :vars
    (
      ?auto_8298 - BLOCK
      ?auto_8299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8295 ?auto_8296 ) ) ( not ( = ?auto_8295 ?auto_8297 ) ) ( not ( = ?auto_8296 ?auto_8297 ) ) ( not ( = ?auto_8295 ?auto_8298 ) ) ( not ( = ?auto_8296 ?auto_8298 ) ) ( not ( = ?auto_8297 ?auto_8298 ) ) ( ON ?auto_8295 ?auto_8299 ) ( not ( = ?auto_8295 ?auto_8299 ) ) ( not ( = ?auto_8296 ?auto_8299 ) ) ( not ( = ?auto_8297 ?auto_8299 ) ) ( not ( = ?auto_8298 ?auto_8299 ) ) ( ON ?auto_8296 ?auto_8295 ) ( ON-TABLE ?auto_8299 ) ( ON ?auto_8297 ?auto_8296 ) ( CLEAR ?auto_8297 ) ( HOLDING ?auto_8298 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8298 )
      ( MAKE-3PILE ?auto_8295 ?auto_8296 ?auto_8297 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8300 - BLOCK
      ?auto_8301 - BLOCK
      ?auto_8302 - BLOCK
    )
    :vars
    (
      ?auto_8303 - BLOCK
      ?auto_8304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8300 ?auto_8301 ) ) ( not ( = ?auto_8300 ?auto_8302 ) ) ( not ( = ?auto_8301 ?auto_8302 ) ) ( not ( = ?auto_8300 ?auto_8303 ) ) ( not ( = ?auto_8301 ?auto_8303 ) ) ( not ( = ?auto_8302 ?auto_8303 ) ) ( ON ?auto_8300 ?auto_8304 ) ( not ( = ?auto_8300 ?auto_8304 ) ) ( not ( = ?auto_8301 ?auto_8304 ) ) ( not ( = ?auto_8302 ?auto_8304 ) ) ( not ( = ?auto_8303 ?auto_8304 ) ) ( ON ?auto_8301 ?auto_8300 ) ( ON-TABLE ?auto_8304 ) ( ON ?auto_8302 ?auto_8301 ) ( ON ?auto_8303 ?auto_8302 ) ( CLEAR ?auto_8303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8304 ?auto_8300 ?auto_8301 ?auto_8302 )
      ( MAKE-3PILE ?auto_8300 ?auto_8301 ?auto_8302 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8313 - BLOCK
      ?auto_8314 - BLOCK
      ?auto_8315 - BLOCK
      ?auto_8316 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8315 ) ( ON-TABLE ?auto_8313 ) ( ON ?auto_8314 ?auto_8313 ) ( ON ?auto_8315 ?auto_8314 ) ( not ( = ?auto_8313 ?auto_8314 ) ) ( not ( = ?auto_8313 ?auto_8315 ) ) ( not ( = ?auto_8313 ?auto_8316 ) ) ( not ( = ?auto_8314 ?auto_8315 ) ) ( not ( = ?auto_8314 ?auto_8316 ) ) ( not ( = ?auto_8315 ?auto_8316 ) ) ( ON-TABLE ?auto_8316 ) ( CLEAR ?auto_8316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_8316 )
      ( MAKE-4PILE ?auto_8313 ?auto_8314 ?auto_8315 ?auto_8316 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8317 - BLOCK
      ?auto_8318 - BLOCK
      ?auto_8319 - BLOCK
      ?auto_8320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8317 ) ( ON ?auto_8318 ?auto_8317 ) ( not ( = ?auto_8317 ?auto_8318 ) ) ( not ( = ?auto_8317 ?auto_8319 ) ) ( not ( = ?auto_8317 ?auto_8320 ) ) ( not ( = ?auto_8318 ?auto_8319 ) ) ( not ( = ?auto_8318 ?auto_8320 ) ) ( not ( = ?auto_8319 ?auto_8320 ) ) ( ON-TABLE ?auto_8320 ) ( CLEAR ?auto_8320 ) ( HOLDING ?auto_8319 ) ( CLEAR ?auto_8318 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8317 ?auto_8318 ?auto_8319 )
      ( MAKE-4PILE ?auto_8317 ?auto_8318 ?auto_8319 ?auto_8320 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8321 - BLOCK
      ?auto_8322 - BLOCK
      ?auto_8323 - BLOCK
      ?auto_8324 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8321 ) ( ON ?auto_8322 ?auto_8321 ) ( not ( = ?auto_8321 ?auto_8322 ) ) ( not ( = ?auto_8321 ?auto_8323 ) ) ( not ( = ?auto_8321 ?auto_8324 ) ) ( not ( = ?auto_8322 ?auto_8323 ) ) ( not ( = ?auto_8322 ?auto_8324 ) ) ( not ( = ?auto_8323 ?auto_8324 ) ) ( ON-TABLE ?auto_8324 ) ( CLEAR ?auto_8322 ) ( ON ?auto_8323 ?auto_8324 ) ( CLEAR ?auto_8323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8324 )
      ( MAKE-4PILE ?auto_8321 ?auto_8322 ?auto_8323 ?auto_8324 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8325 - BLOCK
      ?auto_8326 - BLOCK
      ?auto_8327 - BLOCK
      ?auto_8328 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8325 ) ( not ( = ?auto_8325 ?auto_8326 ) ) ( not ( = ?auto_8325 ?auto_8327 ) ) ( not ( = ?auto_8325 ?auto_8328 ) ) ( not ( = ?auto_8326 ?auto_8327 ) ) ( not ( = ?auto_8326 ?auto_8328 ) ) ( not ( = ?auto_8327 ?auto_8328 ) ) ( ON-TABLE ?auto_8328 ) ( ON ?auto_8327 ?auto_8328 ) ( CLEAR ?auto_8327 ) ( HOLDING ?auto_8326 ) ( CLEAR ?auto_8325 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8325 ?auto_8326 )
      ( MAKE-4PILE ?auto_8325 ?auto_8326 ?auto_8327 ?auto_8328 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8329 - BLOCK
      ?auto_8330 - BLOCK
      ?auto_8331 - BLOCK
      ?auto_8332 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8329 ) ( not ( = ?auto_8329 ?auto_8330 ) ) ( not ( = ?auto_8329 ?auto_8331 ) ) ( not ( = ?auto_8329 ?auto_8332 ) ) ( not ( = ?auto_8330 ?auto_8331 ) ) ( not ( = ?auto_8330 ?auto_8332 ) ) ( not ( = ?auto_8331 ?auto_8332 ) ) ( ON-TABLE ?auto_8332 ) ( ON ?auto_8331 ?auto_8332 ) ( CLEAR ?auto_8329 ) ( ON ?auto_8330 ?auto_8331 ) ( CLEAR ?auto_8330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8332 ?auto_8331 )
      ( MAKE-4PILE ?auto_8329 ?auto_8330 ?auto_8331 ?auto_8332 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8333 - BLOCK
      ?auto_8334 - BLOCK
      ?auto_8335 - BLOCK
      ?auto_8336 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8333 ?auto_8334 ) ) ( not ( = ?auto_8333 ?auto_8335 ) ) ( not ( = ?auto_8333 ?auto_8336 ) ) ( not ( = ?auto_8334 ?auto_8335 ) ) ( not ( = ?auto_8334 ?auto_8336 ) ) ( not ( = ?auto_8335 ?auto_8336 ) ) ( ON-TABLE ?auto_8336 ) ( ON ?auto_8335 ?auto_8336 ) ( ON ?auto_8334 ?auto_8335 ) ( CLEAR ?auto_8334 ) ( HOLDING ?auto_8333 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8333 )
      ( MAKE-4PILE ?auto_8333 ?auto_8334 ?auto_8335 ?auto_8336 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8337 - BLOCK
      ?auto_8338 - BLOCK
      ?auto_8339 - BLOCK
      ?auto_8340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8337 ?auto_8338 ) ) ( not ( = ?auto_8337 ?auto_8339 ) ) ( not ( = ?auto_8337 ?auto_8340 ) ) ( not ( = ?auto_8338 ?auto_8339 ) ) ( not ( = ?auto_8338 ?auto_8340 ) ) ( not ( = ?auto_8339 ?auto_8340 ) ) ( ON-TABLE ?auto_8340 ) ( ON ?auto_8339 ?auto_8340 ) ( ON ?auto_8338 ?auto_8339 ) ( ON ?auto_8337 ?auto_8338 ) ( CLEAR ?auto_8337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8340 ?auto_8339 ?auto_8338 )
      ( MAKE-4PILE ?auto_8337 ?auto_8338 ?auto_8339 ?auto_8340 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8345 - BLOCK
      ?auto_8346 - BLOCK
      ?auto_8347 - BLOCK
      ?auto_8348 - BLOCK
    )
    :vars
    (
      ?auto_8349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8345 ?auto_8346 ) ) ( not ( = ?auto_8345 ?auto_8347 ) ) ( not ( = ?auto_8345 ?auto_8348 ) ) ( not ( = ?auto_8346 ?auto_8347 ) ) ( not ( = ?auto_8346 ?auto_8348 ) ) ( not ( = ?auto_8347 ?auto_8348 ) ) ( ON-TABLE ?auto_8348 ) ( ON ?auto_8347 ?auto_8348 ) ( ON ?auto_8346 ?auto_8347 ) ( CLEAR ?auto_8346 ) ( ON ?auto_8345 ?auto_8349 ) ( CLEAR ?auto_8345 ) ( HAND-EMPTY ) ( not ( = ?auto_8345 ?auto_8349 ) ) ( not ( = ?auto_8346 ?auto_8349 ) ) ( not ( = ?auto_8347 ?auto_8349 ) ) ( not ( = ?auto_8348 ?auto_8349 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8345 ?auto_8349 )
      ( MAKE-4PILE ?auto_8345 ?auto_8346 ?auto_8347 ?auto_8348 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8350 - BLOCK
      ?auto_8351 - BLOCK
      ?auto_8352 - BLOCK
      ?auto_8353 - BLOCK
    )
    :vars
    (
      ?auto_8354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8350 ?auto_8351 ) ) ( not ( = ?auto_8350 ?auto_8352 ) ) ( not ( = ?auto_8350 ?auto_8353 ) ) ( not ( = ?auto_8351 ?auto_8352 ) ) ( not ( = ?auto_8351 ?auto_8353 ) ) ( not ( = ?auto_8352 ?auto_8353 ) ) ( ON-TABLE ?auto_8353 ) ( ON ?auto_8352 ?auto_8353 ) ( ON ?auto_8350 ?auto_8354 ) ( CLEAR ?auto_8350 ) ( not ( = ?auto_8350 ?auto_8354 ) ) ( not ( = ?auto_8351 ?auto_8354 ) ) ( not ( = ?auto_8352 ?auto_8354 ) ) ( not ( = ?auto_8353 ?auto_8354 ) ) ( HOLDING ?auto_8351 ) ( CLEAR ?auto_8352 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8353 ?auto_8352 ?auto_8351 )
      ( MAKE-4PILE ?auto_8350 ?auto_8351 ?auto_8352 ?auto_8353 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8355 - BLOCK
      ?auto_8356 - BLOCK
      ?auto_8357 - BLOCK
      ?auto_8358 - BLOCK
    )
    :vars
    (
      ?auto_8359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8355 ?auto_8356 ) ) ( not ( = ?auto_8355 ?auto_8357 ) ) ( not ( = ?auto_8355 ?auto_8358 ) ) ( not ( = ?auto_8356 ?auto_8357 ) ) ( not ( = ?auto_8356 ?auto_8358 ) ) ( not ( = ?auto_8357 ?auto_8358 ) ) ( ON-TABLE ?auto_8358 ) ( ON ?auto_8357 ?auto_8358 ) ( ON ?auto_8355 ?auto_8359 ) ( not ( = ?auto_8355 ?auto_8359 ) ) ( not ( = ?auto_8356 ?auto_8359 ) ) ( not ( = ?auto_8357 ?auto_8359 ) ) ( not ( = ?auto_8358 ?auto_8359 ) ) ( CLEAR ?auto_8357 ) ( ON ?auto_8356 ?auto_8355 ) ( CLEAR ?auto_8356 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8359 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8359 ?auto_8355 )
      ( MAKE-4PILE ?auto_8355 ?auto_8356 ?auto_8357 ?auto_8358 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8360 - BLOCK
      ?auto_8361 - BLOCK
      ?auto_8362 - BLOCK
      ?auto_8363 - BLOCK
    )
    :vars
    (
      ?auto_8364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8360 ?auto_8361 ) ) ( not ( = ?auto_8360 ?auto_8362 ) ) ( not ( = ?auto_8360 ?auto_8363 ) ) ( not ( = ?auto_8361 ?auto_8362 ) ) ( not ( = ?auto_8361 ?auto_8363 ) ) ( not ( = ?auto_8362 ?auto_8363 ) ) ( ON-TABLE ?auto_8363 ) ( ON ?auto_8360 ?auto_8364 ) ( not ( = ?auto_8360 ?auto_8364 ) ) ( not ( = ?auto_8361 ?auto_8364 ) ) ( not ( = ?auto_8362 ?auto_8364 ) ) ( not ( = ?auto_8363 ?auto_8364 ) ) ( ON ?auto_8361 ?auto_8360 ) ( CLEAR ?auto_8361 ) ( ON-TABLE ?auto_8364 ) ( HOLDING ?auto_8362 ) ( CLEAR ?auto_8363 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8363 ?auto_8362 )
      ( MAKE-4PILE ?auto_8360 ?auto_8361 ?auto_8362 ?auto_8363 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8365 - BLOCK
      ?auto_8366 - BLOCK
      ?auto_8367 - BLOCK
      ?auto_8368 - BLOCK
    )
    :vars
    (
      ?auto_8369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8365 ?auto_8366 ) ) ( not ( = ?auto_8365 ?auto_8367 ) ) ( not ( = ?auto_8365 ?auto_8368 ) ) ( not ( = ?auto_8366 ?auto_8367 ) ) ( not ( = ?auto_8366 ?auto_8368 ) ) ( not ( = ?auto_8367 ?auto_8368 ) ) ( ON-TABLE ?auto_8368 ) ( ON ?auto_8365 ?auto_8369 ) ( not ( = ?auto_8365 ?auto_8369 ) ) ( not ( = ?auto_8366 ?auto_8369 ) ) ( not ( = ?auto_8367 ?auto_8369 ) ) ( not ( = ?auto_8368 ?auto_8369 ) ) ( ON ?auto_8366 ?auto_8365 ) ( ON-TABLE ?auto_8369 ) ( CLEAR ?auto_8368 ) ( ON ?auto_8367 ?auto_8366 ) ( CLEAR ?auto_8367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8369 ?auto_8365 ?auto_8366 )
      ( MAKE-4PILE ?auto_8365 ?auto_8366 ?auto_8367 ?auto_8368 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8370 - BLOCK
      ?auto_8371 - BLOCK
      ?auto_8372 - BLOCK
      ?auto_8373 - BLOCK
    )
    :vars
    (
      ?auto_8374 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8370 ?auto_8371 ) ) ( not ( = ?auto_8370 ?auto_8372 ) ) ( not ( = ?auto_8370 ?auto_8373 ) ) ( not ( = ?auto_8371 ?auto_8372 ) ) ( not ( = ?auto_8371 ?auto_8373 ) ) ( not ( = ?auto_8372 ?auto_8373 ) ) ( ON ?auto_8370 ?auto_8374 ) ( not ( = ?auto_8370 ?auto_8374 ) ) ( not ( = ?auto_8371 ?auto_8374 ) ) ( not ( = ?auto_8372 ?auto_8374 ) ) ( not ( = ?auto_8373 ?auto_8374 ) ) ( ON ?auto_8371 ?auto_8370 ) ( ON-TABLE ?auto_8374 ) ( ON ?auto_8372 ?auto_8371 ) ( CLEAR ?auto_8372 ) ( HOLDING ?auto_8373 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8373 )
      ( MAKE-4PILE ?auto_8370 ?auto_8371 ?auto_8372 ?auto_8373 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8375 - BLOCK
      ?auto_8376 - BLOCK
      ?auto_8377 - BLOCK
      ?auto_8378 - BLOCK
    )
    :vars
    (
      ?auto_8379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8375 ?auto_8376 ) ) ( not ( = ?auto_8375 ?auto_8377 ) ) ( not ( = ?auto_8375 ?auto_8378 ) ) ( not ( = ?auto_8376 ?auto_8377 ) ) ( not ( = ?auto_8376 ?auto_8378 ) ) ( not ( = ?auto_8377 ?auto_8378 ) ) ( ON ?auto_8375 ?auto_8379 ) ( not ( = ?auto_8375 ?auto_8379 ) ) ( not ( = ?auto_8376 ?auto_8379 ) ) ( not ( = ?auto_8377 ?auto_8379 ) ) ( not ( = ?auto_8378 ?auto_8379 ) ) ( ON ?auto_8376 ?auto_8375 ) ( ON-TABLE ?auto_8379 ) ( ON ?auto_8377 ?auto_8376 ) ( ON ?auto_8378 ?auto_8377 ) ( CLEAR ?auto_8378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8379 ?auto_8375 ?auto_8376 ?auto_8377 )
      ( MAKE-4PILE ?auto_8375 ?auto_8376 ?auto_8377 ?auto_8378 ) )
  )

)

