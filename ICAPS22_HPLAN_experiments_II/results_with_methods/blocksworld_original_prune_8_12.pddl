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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161900 - BLOCK
      ?auto_161901 - BLOCK
      ?auto_161902 - BLOCK
      ?auto_161903 - BLOCK
      ?auto_161904 - BLOCK
      ?auto_161905 - BLOCK
      ?auto_161906 - BLOCK
      ?auto_161907 - BLOCK
    )
    :vars
    (
      ?auto_161908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161908 ?auto_161907 ) ( CLEAR ?auto_161908 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161900 ) ( ON ?auto_161901 ?auto_161900 ) ( ON ?auto_161902 ?auto_161901 ) ( ON ?auto_161903 ?auto_161902 ) ( ON ?auto_161904 ?auto_161903 ) ( ON ?auto_161905 ?auto_161904 ) ( ON ?auto_161906 ?auto_161905 ) ( ON ?auto_161907 ?auto_161906 ) ( not ( = ?auto_161900 ?auto_161901 ) ) ( not ( = ?auto_161900 ?auto_161902 ) ) ( not ( = ?auto_161900 ?auto_161903 ) ) ( not ( = ?auto_161900 ?auto_161904 ) ) ( not ( = ?auto_161900 ?auto_161905 ) ) ( not ( = ?auto_161900 ?auto_161906 ) ) ( not ( = ?auto_161900 ?auto_161907 ) ) ( not ( = ?auto_161900 ?auto_161908 ) ) ( not ( = ?auto_161901 ?auto_161902 ) ) ( not ( = ?auto_161901 ?auto_161903 ) ) ( not ( = ?auto_161901 ?auto_161904 ) ) ( not ( = ?auto_161901 ?auto_161905 ) ) ( not ( = ?auto_161901 ?auto_161906 ) ) ( not ( = ?auto_161901 ?auto_161907 ) ) ( not ( = ?auto_161901 ?auto_161908 ) ) ( not ( = ?auto_161902 ?auto_161903 ) ) ( not ( = ?auto_161902 ?auto_161904 ) ) ( not ( = ?auto_161902 ?auto_161905 ) ) ( not ( = ?auto_161902 ?auto_161906 ) ) ( not ( = ?auto_161902 ?auto_161907 ) ) ( not ( = ?auto_161902 ?auto_161908 ) ) ( not ( = ?auto_161903 ?auto_161904 ) ) ( not ( = ?auto_161903 ?auto_161905 ) ) ( not ( = ?auto_161903 ?auto_161906 ) ) ( not ( = ?auto_161903 ?auto_161907 ) ) ( not ( = ?auto_161903 ?auto_161908 ) ) ( not ( = ?auto_161904 ?auto_161905 ) ) ( not ( = ?auto_161904 ?auto_161906 ) ) ( not ( = ?auto_161904 ?auto_161907 ) ) ( not ( = ?auto_161904 ?auto_161908 ) ) ( not ( = ?auto_161905 ?auto_161906 ) ) ( not ( = ?auto_161905 ?auto_161907 ) ) ( not ( = ?auto_161905 ?auto_161908 ) ) ( not ( = ?auto_161906 ?auto_161907 ) ) ( not ( = ?auto_161906 ?auto_161908 ) ) ( not ( = ?auto_161907 ?auto_161908 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161908 ?auto_161907 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161910 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_161910 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_161910 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161911 - BLOCK
    )
    :vars
    (
      ?auto_161912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161911 ?auto_161912 ) ( CLEAR ?auto_161911 ) ( HAND-EMPTY ) ( not ( = ?auto_161911 ?auto_161912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161911 ?auto_161912 )
      ( MAKE-1PILE ?auto_161911 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161920 - BLOCK
      ?auto_161921 - BLOCK
      ?auto_161922 - BLOCK
      ?auto_161923 - BLOCK
      ?auto_161924 - BLOCK
      ?auto_161925 - BLOCK
      ?auto_161926 - BLOCK
    )
    :vars
    (
      ?auto_161927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161927 ?auto_161926 ) ( CLEAR ?auto_161927 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161920 ) ( ON ?auto_161921 ?auto_161920 ) ( ON ?auto_161922 ?auto_161921 ) ( ON ?auto_161923 ?auto_161922 ) ( ON ?auto_161924 ?auto_161923 ) ( ON ?auto_161925 ?auto_161924 ) ( ON ?auto_161926 ?auto_161925 ) ( not ( = ?auto_161920 ?auto_161921 ) ) ( not ( = ?auto_161920 ?auto_161922 ) ) ( not ( = ?auto_161920 ?auto_161923 ) ) ( not ( = ?auto_161920 ?auto_161924 ) ) ( not ( = ?auto_161920 ?auto_161925 ) ) ( not ( = ?auto_161920 ?auto_161926 ) ) ( not ( = ?auto_161920 ?auto_161927 ) ) ( not ( = ?auto_161921 ?auto_161922 ) ) ( not ( = ?auto_161921 ?auto_161923 ) ) ( not ( = ?auto_161921 ?auto_161924 ) ) ( not ( = ?auto_161921 ?auto_161925 ) ) ( not ( = ?auto_161921 ?auto_161926 ) ) ( not ( = ?auto_161921 ?auto_161927 ) ) ( not ( = ?auto_161922 ?auto_161923 ) ) ( not ( = ?auto_161922 ?auto_161924 ) ) ( not ( = ?auto_161922 ?auto_161925 ) ) ( not ( = ?auto_161922 ?auto_161926 ) ) ( not ( = ?auto_161922 ?auto_161927 ) ) ( not ( = ?auto_161923 ?auto_161924 ) ) ( not ( = ?auto_161923 ?auto_161925 ) ) ( not ( = ?auto_161923 ?auto_161926 ) ) ( not ( = ?auto_161923 ?auto_161927 ) ) ( not ( = ?auto_161924 ?auto_161925 ) ) ( not ( = ?auto_161924 ?auto_161926 ) ) ( not ( = ?auto_161924 ?auto_161927 ) ) ( not ( = ?auto_161925 ?auto_161926 ) ) ( not ( = ?auto_161925 ?auto_161927 ) ) ( not ( = ?auto_161926 ?auto_161927 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161927 ?auto_161926 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161928 - BLOCK
      ?auto_161929 - BLOCK
      ?auto_161930 - BLOCK
      ?auto_161931 - BLOCK
      ?auto_161932 - BLOCK
      ?auto_161933 - BLOCK
      ?auto_161934 - BLOCK
    )
    :vars
    (
      ?auto_161935 - BLOCK
      ?auto_161936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161935 ?auto_161934 ) ( CLEAR ?auto_161935 ) ( ON-TABLE ?auto_161928 ) ( ON ?auto_161929 ?auto_161928 ) ( ON ?auto_161930 ?auto_161929 ) ( ON ?auto_161931 ?auto_161930 ) ( ON ?auto_161932 ?auto_161931 ) ( ON ?auto_161933 ?auto_161932 ) ( ON ?auto_161934 ?auto_161933 ) ( not ( = ?auto_161928 ?auto_161929 ) ) ( not ( = ?auto_161928 ?auto_161930 ) ) ( not ( = ?auto_161928 ?auto_161931 ) ) ( not ( = ?auto_161928 ?auto_161932 ) ) ( not ( = ?auto_161928 ?auto_161933 ) ) ( not ( = ?auto_161928 ?auto_161934 ) ) ( not ( = ?auto_161928 ?auto_161935 ) ) ( not ( = ?auto_161929 ?auto_161930 ) ) ( not ( = ?auto_161929 ?auto_161931 ) ) ( not ( = ?auto_161929 ?auto_161932 ) ) ( not ( = ?auto_161929 ?auto_161933 ) ) ( not ( = ?auto_161929 ?auto_161934 ) ) ( not ( = ?auto_161929 ?auto_161935 ) ) ( not ( = ?auto_161930 ?auto_161931 ) ) ( not ( = ?auto_161930 ?auto_161932 ) ) ( not ( = ?auto_161930 ?auto_161933 ) ) ( not ( = ?auto_161930 ?auto_161934 ) ) ( not ( = ?auto_161930 ?auto_161935 ) ) ( not ( = ?auto_161931 ?auto_161932 ) ) ( not ( = ?auto_161931 ?auto_161933 ) ) ( not ( = ?auto_161931 ?auto_161934 ) ) ( not ( = ?auto_161931 ?auto_161935 ) ) ( not ( = ?auto_161932 ?auto_161933 ) ) ( not ( = ?auto_161932 ?auto_161934 ) ) ( not ( = ?auto_161932 ?auto_161935 ) ) ( not ( = ?auto_161933 ?auto_161934 ) ) ( not ( = ?auto_161933 ?auto_161935 ) ) ( not ( = ?auto_161934 ?auto_161935 ) ) ( HOLDING ?auto_161936 ) ( not ( = ?auto_161928 ?auto_161936 ) ) ( not ( = ?auto_161929 ?auto_161936 ) ) ( not ( = ?auto_161930 ?auto_161936 ) ) ( not ( = ?auto_161931 ?auto_161936 ) ) ( not ( = ?auto_161932 ?auto_161936 ) ) ( not ( = ?auto_161933 ?auto_161936 ) ) ( not ( = ?auto_161934 ?auto_161936 ) ) ( not ( = ?auto_161935 ?auto_161936 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_161936 )
      ( MAKE-7PILE ?auto_161928 ?auto_161929 ?auto_161930 ?auto_161931 ?auto_161932 ?auto_161933 ?auto_161934 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161937 - BLOCK
      ?auto_161938 - BLOCK
      ?auto_161939 - BLOCK
      ?auto_161940 - BLOCK
      ?auto_161941 - BLOCK
      ?auto_161942 - BLOCK
      ?auto_161943 - BLOCK
    )
    :vars
    (
      ?auto_161945 - BLOCK
      ?auto_161944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161945 ?auto_161943 ) ( ON-TABLE ?auto_161937 ) ( ON ?auto_161938 ?auto_161937 ) ( ON ?auto_161939 ?auto_161938 ) ( ON ?auto_161940 ?auto_161939 ) ( ON ?auto_161941 ?auto_161940 ) ( ON ?auto_161942 ?auto_161941 ) ( ON ?auto_161943 ?auto_161942 ) ( not ( = ?auto_161937 ?auto_161938 ) ) ( not ( = ?auto_161937 ?auto_161939 ) ) ( not ( = ?auto_161937 ?auto_161940 ) ) ( not ( = ?auto_161937 ?auto_161941 ) ) ( not ( = ?auto_161937 ?auto_161942 ) ) ( not ( = ?auto_161937 ?auto_161943 ) ) ( not ( = ?auto_161937 ?auto_161945 ) ) ( not ( = ?auto_161938 ?auto_161939 ) ) ( not ( = ?auto_161938 ?auto_161940 ) ) ( not ( = ?auto_161938 ?auto_161941 ) ) ( not ( = ?auto_161938 ?auto_161942 ) ) ( not ( = ?auto_161938 ?auto_161943 ) ) ( not ( = ?auto_161938 ?auto_161945 ) ) ( not ( = ?auto_161939 ?auto_161940 ) ) ( not ( = ?auto_161939 ?auto_161941 ) ) ( not ( = ?auto_161939 ?auto_161942 ) ) ( not ( = ?auto_161939 ?auto_161943 ) ) ( not ( = ?auto_161939 ?auto_161945 ) ) ( not ( = ?auto_161940 ?auto_161941 ) ) ( not ( = ?auto_161940 ?auto_161942 ) ) ( not ( = ?auto_161940 ?auto_161943 ) ) ( not ( = ?auto_161940 ?auto_161945 ) ) ( not ( = ?auto_161941 ?auto_161942 ) ) ( not ( = ?auto_161941 ?auto_161943 ) ) ( not ( = ?auto_161941 ?auto_161945 ) ) ( not ( = ?auto_161942 ?auto_161943 ) ) ( not ( = ?auto_161942 ?auto_161945 ) ) ( not ( = ?auto_161943 ?auto_161945 ) ) ( not ( = ?auto_161937 ?auto_161944 ) ) ( not ( = ?auto_161938 ?auto_161944 ) ) ( not ( = ?auto_161939 ?auto_161944 ) ) ( not ( = ?auto_161940 ?auto_161944 ) ) ( not ( = ?auto_161941 ?auto_161944 ) ) ( not ( = ?auto_161942 ?auto_161944 ) ) ( not ( = ?auto_161943 ?auto_161944 ) ) ( not ( = ?auto_161945 ?auto_161944 ) ) ( ON ?auto_161944 ?auto_161945 ) ( CLEAR ?auto_161944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_161937 ?auto_161938 ?auto_161939 ?auto_161940 ?auto_161941 ?auto_161942 ?auto_161943 ?auto_161945 )
      ( MAKE-7PILE ?auto_161937 ?auto_161938 ?auto_161939 ?auto_161940 ?auto_161941 ?auto_161942 ?auto_161943 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161948 - BLOCK
      ?auto_161949 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_161949 ) ( CLEAR ?auto_161948 ) ( ON-TABLE ?auto_161948 ) ( not ( = ?auto_161948 ?auto_161949 ) ) )
    :subtasks
    ( ( !STACK ?auto_161949 ?auto_161948 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161950 - BLOCK
      ?auto_161951 - BLOCK
    )
    :vars
    (
      ?auto_161952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161950 ) ( ON-TABLE ?auto_161950 ) ( not ( = ?auto_161950 ?auto_161951 ) ) ( ON ?auto_161951 ?auto_161952 ) ( CLEAR ?auto_161951 ) ( HAND-EMPTY ) ( not ( = ?auto_161950 ?auto_161952 ) ) ( not ( = ?auto_161951 ?auto_161952 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161951 ?auto_161952 )
      ( MAKE-2PILE ?auto_161950 ?auto_161951 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161953 - BLOCK
      ?auto_161954 - BLOCK
    )
    :vars
    (
      ?auto_161955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161953 ?auto_161954 ) ) ( ON ?auto_161954 ?auto_161955 ) ( CLEAR ?auto_161954 ) ( not ( = ?auto_161953 ?auto_161955 ) ) ( not ( = ?auto_161954 ?auto_161955 ) ) ( HOLDING ?auto_161953 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161953 )
      ( MAKE-2PILE ?auto_161953 ?auto_161954 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161956 - BLOCK
      ?auto_161957 - BLOCK
    )
    :vars
    (
      ?auto_161958 - BLOCK
      ?auto_161963 - BLOCK
      ?auto_161961 - BLOCK
      ?auto_161962 - BLOCK
      ?auto_161960 - BLOCK
      ?auto_161964 - BLOCK
      ?auto_161959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161956 ?auto_161957 ) ) ( ON ?auto_161957 ?auto_161958 ) ( not ( = ?auto_161956 ?auto_161958 ) ) ( not ( = ?auto_161957 ?auto_161958 ) ) ( ON ?auto_161956 ?auto_161957 ) ( CLEAR ?auto_161956 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161963 ) ( ON ?auto_161961 ?auto_161963 ) ( ON ?auto_161962 ?auto_161961 ) ( ON ?auto_161960 ?auto_161962 ) ( ON ?auto_161964 ?auto_161960 ) ( ON ?auto_161959 ?auto_161964 ) ( ON ?auto_161958 ?auto_161959 ) ( not ( = ?auto_161963 ?auto_161961 ) ) ( not ( = ?auto_161963 ?auto_161962 ) ) ( not ( = ?auto_161963 ?auto_161960 ) ) ( not ( = ?auto_161963 ?auto_161964 ) ) ( not ( = ?auto_161963 ?auto_161959 ) ) ( not ( = ?auto_161963 ?auto_161958 ) ) ( not ( = ?auto_161963 ?auto_161957 ) ) ( not ( = ?auto_161963 ?auto_161956 ) ) ( not ( = ?auto_161961 ?auto_161962 ) ) ( not ( = ?auto_161961 ?auto_161960 ) ) ( not ( = ?auto_161961 ?auto_161964 ) ) ( not ( = ?auto_161961 ?auto_161959 ) ) ( not ( = ?auto_161961 ?auto_161958 ) ) ( not ( = ?auto_161961 ?auto_161957 ) ) ( not ( = ?auto_161961 ?auto_161956 ) ) ( not ( = ?auto_161962 ?auto_161960 ) ) ( not ( = ?auto_161962 ?auto_161964 ) ) ( not ( = ?auto_161962 ?auto_161959 ) ) ( not ( = ?auto_161962 ?auto_161958 ) ) ( not ( = ?auto_161962 ?auto_161957 ) ) ( not ( = ?auto_161962 ?auto_161956 ) ) ( not ( = ?auto_161960 ?auto_161964 ) ) ( not ( = ?auto_161960 ?auto_161959 ) ) ( not ( = ?auto_161960 ?auto_161958 ) ) ( not ( = ?auto_161960 ?auto_161957 ) ) ( not ( = ?auto_161960 ?auto_161956 ) ) ( not ( = ?auto_161964 ?auto_161959 ) ) ( not ( = ?auto_161964 ?auto_161958 ) ) ( not ( = ?auto_161964 ?auto_161957 ) ) ( not ( = ?auto_161964 ?auto_161956 ) ) ( not ( = ?auto_161959 ?auto_161958 ) ) ( not ( = ?auto_161959 ?auto_161957 ) ) ( not ( = ?auto_161959 ?auto_161956 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_161963 ?auto_161961 ?auto_161962 ?auto_161960 ?auto_161964 ?auto_161959 ?auto_161958 ?auto_161957 )
      ( MAKE-2PILE ?auto_161956 ?auto_161957 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161971 - BLOCK
      ?auto_161972 - BLOCK
      ?auto_161973 - BLOCK
      ?auto_161974 - BLOCK
      ?auto_161975 - BLOCK
      ?auto_161976 - BLOCK
    )
    :vars
    (
      ?auto_161977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161977 ?auto_161976 ) ( CLEAR ?auto_161977 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161971 ) ( ON ?auto_161972 ?auto_161971 ) ( ON ?auto_161973 ?auto_161972 ) ( ON ?auto_161974 ?auto_161973 ) ( ON ?auto_161975 ?auto_161974 ) ( ON ?auto_161976 ?auto_161975 ) ( not ( = ?auto_161971 ?auto_161972 ) ) ( not ( = ?auto_161971 ?auto_161973 ) ) ( not ( = ?auto_161971 ?auto_161974 ) ) ( not ( = ?auto_161971 ?auto_161975 ) ) ( not ( = ?auto_161971 ?auto_161976 ) ) ( not ( = ?auto_161971 ?auto_161977 ) ) ( not ( = ?auto_161972 ?auto_161973 ) ) ( not ( = ?auto_161972 ?auto_161974 ) ) ( not ( = ?auto_161972 ?auto_161975 ) ) ( not ( = ?auto_161972 ?auto_161976 ) ) ( not ( = ?auto_161972 ?auto_161977 ) ) ( not ( = ?auto_161973 ?auto_161974 ) ) ( not ( = ?auto_161973 ?auto_161975 ) ) ( not ( = ?auto_161973 ?auto_161976 ) ) ( not ( = ?auto_161973 ?auto_161977 ) ) ( not ( = ?auto_161974 ?auto_161975 ) ) ( not ( = ?auto_161974 ?auto_161976 ) ) ( not ( = ?auto_161974 ?auto_161977 ) ) ( not ( = ?auto_161975 ?auto_161976 ) ) ( not ( = ?auto_161975 ?auto_161977 ) ) ( not ( = ?auto_161976 ?auto_161977 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161977 ?auto_161976 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161978 - BLOCK
      ?auto_161979 - BLOCK
      ?auto_161980 - BLOCK
      ?auto_161981 - BLOCK
      ?auto_161982 - BLOCK
      ?auto_161983 - BLOCK
    )
    :vars
    (
      ?auto_161984 - BLOCK
      ?auto_161985 - BLOCK
      ?auto_161986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161984 ?auto_161983 ) ( CLEAR ?auto_161984 ) ( ON-TABLE ?auto_161978 ) ( ON ?auto_161979 ?auto_161978 ) ( ON ?auto_161980 ?auto_161979 ) ( ON ?auto_161981 ?auto_161980 ) ( ON ?auto_161982 ?auto_161981 ) ( ON ?auto_161983 ?auto_161982 ) ( not ( = ?auto_161978 ?auto_161979 ) ) ( not ( = ?auto_161978 ?auto_161980 ) ) ( not ( = ?auto_161978 ?auto_161981 ) ) ( not ( = ?auto_161978 ?auto_161982 ) ) ( not ( = ?auto_161978 ?auto_161983 ) ) ( not ( = ?auto_161978 ?auto_161984 ) ) ( not ( = ?auto_161979 ?auto_161980 ) ) ( not ( = ?auto_161979 ?auto_161981 ) ) ( not ( = ?auto_161979 ?auto_161982 ) ) ( not ( = ?auto_161979 ?auto_161983 ) ) ( not ( = ?auto_161979 ?auto_161984 ) ) ( not ( = ?auto_161980 ?auto_161981 ) ) ( not ( = ?auto_161980 ?auto_161982 ) ) ( not ( = ?auto_161980 ?auto_161983 ) ) ( not ( = ?auto_161980 ?auto_161984 ) ) ( not ( = ?auto_161981 ?auto_161982 ) ) ( not ( = ?auto_161981 ?auto_161983 ) ) ( not ( = ?auto_161981 ?auto_161984 ) ) ( not ( = ?auto_161982 ?auto_161983 ) ) ( not ( = ?auto_161982 ?auto_161984 ) ) ( not ( = ?auto_161983 ?auto_161984 ) ) ( HOLDING ?auto_161985 ) ( CLEAR ?auto_161986 ) ( not ( = ?auto_161978 ?auto_161985 ) ) ( not ( = ?auto_161978 ?auto_161986 ) ) ( not ( = ?auto_161979 ?auto_161985 ) ) ( not ( = ?auto_161979 ?auto_161986 ) ) ( not ( = ?auto_161980 ?auto_161985 ) ) ( not ( = ?auto_161980 ?auto_161986 ) ) ( not ( = ?auto_161981 ?auto_161985 ) ) ( not ( = ?auto_161981 ?auto_161986 ) ) ( not ( = ?auto_161982 ?auto_161985 ) ) ( not ( = ?auto_161982 ?auto_161986 ) ) ( not ( = ?auto_161983 ?auto_161985 ) ) ( not ( = ?auto_161983 ?auto_161986 ) ) ( not ( = ?auto_161984 ?auto_161985 ) ) ( not ( = ?auto_161984 ?auto_161986 ) ) ( not ( = ?auto_161985 ?auto_161986 ) ) )
    :subtasks
    ( ( !STACK ?auto_161985 ?auto_161986 )
      ( MAKE-6PILE ?auto_161978 ?auto_161979 ?auto_161980 ?auto_161981 ?auto_161982 ?auto_161983 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163318 - BLOCK
      ?auto_163319 - BLOCK
      ?auto_163320 - BLOCK
      ?auto_163321 - BLOCK
      ?auto_163322 - BLOCK
      ?auto_163323 - BLOCK
    )
    :vars
    (
      ?auto_163324 - BLOCK
      ?auto_163325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163324 ?auto_163323 ) ( ON-TABLE ?auto_163318 ) ( ON ?auto_163319 ?auto_163318 ) ( ON ?auto_163320 ?auto_163319 ) ( ON ?auto_163321 ?auto_163320 ) ( ON ?auto_163322 ?auto_163321 ) ( ON ?auto_163323 ?auto_163322 ) ( not ( = ?auto_163318 ?auto_163319 ) ) ( not ( = ?auto_163318 ?auto_163320 ) ) ( not ( = ?auto_163318 ?auto_163321 ) ) ( not ( = ?auto_163318 ?auto_163322 ) ) ( not ( = ?auto_163318 ?auto_163323 ) ) ( not ( = ?auto_163318 ?auto_163324 ) ) ( not ( = ?auto_163319 ?auto_163320 ) ) ( not ( = ?auto_163319 ?auto_163321 ) ) ( not ( = ?auto_163319 ?auto_163322 ) ) ( not ( = ?auto_163319 ?auto_163323 ) ) ( not ( = ?auto_163319 ?auto_163324 ) ) ( not ( = ?auto_163320 ?auto_163321 ) ) ( not ( = ?auto_163320 ?auto_163322 ) ) ( not ( = ?auto_163320 ?auto_163323 ) ) ( not ( = ?auto_163320 ?auto_163324 ) ) ( not ( = ?auto_163321 ?auto_163322 ) ) ( not ( = ?auto_163321 ?auto_163323 ) ) ( not ( = ?auto_163321 ?auto_163324 ) ) ( not ( = ?auto_163322 ?auto_163323 ) ) ( not ( = ?auto_163322 ?auto_163324 ) ) ( not ( = ?auto_163323 ?auto_163324 ) ) ( not ( = ?auto_163318 ?auto_163325 ) ) ( not ( = ?auto_163319 ?auto_163325 ) ) ( not ( = ?auto_163320 ?auto_163325 ) ) ( not ( = ?auto_163321 ?auto_163325 ) ) ( not ( = ?auto_163322 ?auto_163325 ) ) ( not ( = ?auto_163323 ?auto_163325 ) ) ( not ( = ?auto_163324 ?auto_163325 ) ) ( ON ?auto_163325 ?auto_163324 ) ( CLEAR ?auto_163325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163318 ?auto_163319 ?auto_163320 ?auto_163321 ?auto_163322 ?auto_163323 ?auto_163324 )
      ( MAKE-6PILE ?auto_163318 ?auto_163319 ?auto_163320 ?auto_163321 ?auto_163322 ?auto_163323 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161996 - BLOCK
      ?auto_161997 - BLOCK
      ?auto_161998 - BLOCK
      ?auto_161999 - BLOCK
      ?auto_162000 - BLOCK
      ?auto_162001 - BLOCK
    )
    :vars
    (
      ?auto_162003 - BLOCK
      ?auto_162002 - BLOCK
      ?auto_162004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162003 ?auto_162001 ) ( ON-TABLE ?auto_161996 ) ( ON ?auto_161997 ?auto_161996 ) ( ON ?auto_161998 ?auto_161997 ) ( ON ?auto_161999 ?auto_161998 ) ( ON ?auto_162000 ?auto_161999 ) ( ON ?auto_162001 ?auto_162000 ) ( not ( = ?auto_161996 ?auto_161997 ) ) ( not ( = ?auto_161996 ?auto_161998 ) ) ( not ( = ?auto_161996 ?auto_161999 ) ) ( not ( = ?auto_161996 ?auto_162000 ) ) ( not ( = ?auto_161996 ?auto_162001 ) ) ( not ( = ?auto_161996 ?auto_162003 ) ) ( not ( = ?auto_161997 ?auto_161998 ) ) ( not ( = ?auto_161997 ?auto_161999 ) ) ( not ( = ?auto_161997 ?auto_162000 ) ) ( not ( = ?auto_161997 ?auto_162001 ) ) ( not ( = ?auto_161997 ?auto_162003 ) ) ( not ( = ?auto_161998 ?auto_161999 ) ) ( not ( = ?auto_161998 ?auto_162000 ) ) ( not ( = ?auto_161998 ?auto_162001 ) ) ( not ( = ?auto_161998 ?auto_162003 ) ) ( not ( = ?auto_161999 ?auto_162000 ) ) ( not ( = ?auto_161999 ?auto_162001 ) ) ( not ( = ?auto_161999 ?auto_162003 ) ) ( not ( = ?auto_162000 ?auto_162001 ) ) ( not ( = ?auto_162000 ?auto_162003 ) ) ( not ( = ?auto_162001 ?auto_162003 ) ) ( not ( = ?auto_161996 ?auto_162002 ) ) ( not ( = ?auto_161996 ?auto_162004 ) ) ( not ( = ?auto_161997 ?auto_162002 ) ) ( not ( = ?auto_161997 ?auto_162004 ) ) ( not ( = ?auto_161998 ?auto_162002 ) ) ( not ( = ?auto_161998 ?auto_162004 ) ) ( not ( = ?auto_161999 ?auto_162002 ) ) ( not ( = ?auto_161999 ?auto_162004 ) ) ( not ( = ?auto_162000 ?auto_162002 ) ) ( not ( = ?auto_162000 ?auto_162004 ) ) ( not ( = ?auto_162001 ?auto_162002 ) ) ( not ( = ?auto_162001 ?auto_162004 ) ) ( not ( = ?auto_162003 ?auto_162002 ) ) ( not ( = ?auto_162003 ?auto_162004 ) ) ( not ( = ?auto_162002 ?auto_162004 ) ) ( ON ?auto_162002 ?auto_162003 ) ( CLEAR ?auto_162002 ) ( HOLDING ?auto_162004 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162004 )
      ( MAKE-6PILE ?auto_161996 ?auto_161997 ?auto_161998 ?auto_161999 ?auto_162000 ?auto_162001 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162005 - BLOCK
      ?auto_162006 - BLOCK
      ?auto_162007 - BLOCK
      ?auto_162008 - BLOCK
      ?auto_162009 - BLOCK
      ?auto_162010 - BLOCK
    )
    :vars
    (
      ?auto_162011 - BLOCK
      ?auto_162013 - BLOCK
      ?auto_162012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162011 ?auto_162010 ) ( ON-TABLE ?auto_162005 ) ( ON ?auto_162006 ?auto_162005 ) ( ON ?auto_162007 ?auto_162006 ) ( ON ?auto_162008 ?auto_162007 ) ( ON ?auto_162009 ?auto_162008 ) ( ON ?auto_162010 ?auto_162009 ) ( not ( = ?auto_162005 ?auto_162006 ) ) ( not ( = ?auto_162005 ?auto_162007 ) ) ( not ( = ?auto_162005 ?auto_162008 ) ) ( not ( = ?auto_162005 ?auto_162009 ) ) ( not ( = ?auto_162005 ?auto_162010 ) ) ( not ( = ?auto_162005 ?auto_162011 ) ) ( not ( = ?auto_162006 ?auto_162007 ) ) ( not ( = ?auto_162006 ?auto_162008 ) ) ( not ( = ?auto_162006 ?auto_162009 ) ) ( not ( = ?auto_162006 ?auto_162010 ) ) ( not ( = ?auto_162006 ?auto_162011 ) ) ( not ( = ?auto_162007 ?auto_162008 ) ) ( not ( = ?auto_162007 ?auto_162009 ) ) ( not ( = ?auto_162007 ?auto_162010 ) ) ( not ( = ?auto_162007 ?auto_162011 ) ) ( not ( = ?auto_162008 ?auto_162009 ) ) ( not ( = ?auto_162008 ?auto_162010 ) ) ( not ( = ?auto_162008 ?auto_162011 ) ) ( not ( = ?auto_162009 ?auto_162010 ) ) ( not ( = ?auto_162009 ?auto_162011 ) ) ( not ( = ?auto_162010 ?auto_162011 ) ) ( not ( = ?auto_162005 ?auto_162013 ) ) ( not ( = ?auto_162005 ?auto_162012 ) ) ( not ( = ?auto_162006 ?auto_162013 ) ) ( not ( = ?auto_162006 ?auto_162012 ) ) ( not ( = ?auto_162007 ?auto_162013 ) ) ( not ( = ?auto_162007 ?auto_162012 ) ) ( not ( = ?auto_162008 ?auto_162013 ) ) ( not ( = ?auto_162008 ?auto_162012 ) ) ( not ( = ?auto_162009 ?auto_162013 ) ) ( not ( = ?auto_162009 ?auto_162012 ) ) ( not ( = ?auto_162010 ?auto_162013 ) ) ( not ( = ?auto_162010 ?auto_162012 ) ) ( not ( = ?auto_162011 ?auto_162013 ) ) ( not ( = ?auto_162011 ?auto_162012 ) ) ( not ( = ?auto_162013 ?auto_162012 ) ) ( ON ?auto_162013 ?auto_162011 ) ( ON ?auto_162012 ?auto_162013 ) ( CLEAR ?auto_162012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162005 ?auto_162006 ?auto_162007 ?auto_162008 ?auto_162009 ?auto_162010 ?auto_162011 ?auto_162013 )
      ( MAKE-6PILE ?auto_162005 ?auto_162006 ?auto_162007 ?auto_162008 ?auto_162009 ?auto_162010 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162017 - BLOCK
      ?auto_162018 - BLOCK
      ?auto_162019 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_162019 ) ( CLEAR ?auto_162018 ) ( ON-TABLE ?auto_162017 ) ( ON ?auto_162018 ?auto_162017 ) ( not ( = ?auto_162017 ?auto_162018 ) ) ( not ( = ?auto_162017 ?auto_162019 ) ) ( not ( = ?auto_162018 ?auto_162019 ) ) )
    :subtasks
    ( ( !STACK ?auto_162019 ?auto_162018 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162020 - BLOCK
      ?auto_162021 - BLOCK
      ?auto_162022 - BLOCK
    )
    :vars
    (
      ?auto_162023 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162021 ) ( ON-TABLE ?auto_162020 ) ( ON ?auto_162021 ?auto_162020 ) ( not ( = ?auto_162020 ?auto_162021 ) ) ( not ( = ?auto_162020 ?auto_162022 ) ) ( not ( = ?auto_162021 ?auto_162022 ) ) ( ON ?auto_162022 ?auto_162023 ) ( CLEAR ?auto_162022 ) ( HAND-EMPTY ) ( not ( = ?auto_162020 ?auto_162023 ) ) ( not ( = ?auto_162021 ?auto_162023 ) ) ( not ( = ?auto_162022 ?auto_162023 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162022 ?auto_162023 )
      ( MAKE-3PILE ?auto_162020 ?auto_162021 ?auto_162022 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162024 - BLOCK
      ?auto_162025 - BLOCK
      ?auto_162026 - BLOCK
    )
    :vars
    (
      ?auto_162027 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162024 ) ( not ( = ?auto_162024 ?auto_162025 ) ) ( not ( = ?auto_162024 ?auto_162026 ) ) ( not ( = ?auto_162025 ?auto_162026 ) ) ( ON ?auto_162026 ?auto_162027 ) ( CLEAR ?auto_162026 ) ( not ( = ?auto_162024 ?auto_162027 ) ) ( not ( = ?auto_162025 ?auto_162027 ) ) ( not ( = ?auto_162026 ?auto_162027 ) ) ( HOLDING ?auto_162025 ) ( CLEAR ?auto_162024 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162024 ?auto_162025 )
      ( MAKE-3PILE ?auto_162024 ?auto_162025 ?auto_162026 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162028 - BLOCK
      ?auto_162029 - BLOCK
      ?auto_162030 - BLOCK
    )
    :vars
    (
      ?auto_162031 - BLOCK
      ?auto_162036 - BLOCK
      ?auto_162034 - BLOCK
      ?auto_162033 - BLOCK
      ?auto_162032 - BLOCK
      ?auto_162035 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162028 ) ( not ( = ?auto_162028 ?auto_162029 ) ) ( not ( = ?auto_162028 ?auto_162030 ) ) ( not ( = ?auto_162029 ?auto_162030 ) ) ( ON ?auto_162030 ?auto_162031 ) ( not ( = ?auto_162028 ?auto_162031 ) ) ( not ( = ?auto_162029 ?auto_162031 ) ) ( not ( = ?auto_162030 ?auto_162031 ) ) ( CLEAR ?auto_162028 ) ( ON ?auto_162029 ?auto_162030 ) ( CLEAR ?auto_162029 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162036 ) ( ON ?auto_162034 ?auto_162036 ) ( ON ?auto_162033 ?auto_162034 ) ( ON ?auto_162032 ?auto_162033 ) ( ON ?auto_162035 ?auto_162032 ) ( ON ?auto_162031 ?auto_162035 ) ( not ( = ?auto_162036 ?auto_162034 ) ) ( not ( = ?auto_162036 ?auto_162033 ) ) ( not ( = ?auto_162036 ?auto_162032 ) ) ( not ( = ?auto_162036 ?auto_162035 ) ) ( not ( = ?auto_162036 ?auto_162031 ) ) ( not ( = ?auto_162036 ?auto_162030 ) ) ( not ( = ?auto_162036 ?auto_162029 ) ) ( not ( = ?auto_162034 ?auto_162033 ) ) ( not ( = ?auto_162034 ?auto_162032 ) ) ( not ( = ?auto_162034 ?auto_162035 ) ) ( not ( = ?auto_162034 ?auto_162031 ) ) ( not ( = ?auto_162034 ?auto_162030 ) ) ( not ( = ?auto_162034 ?auto_162029 ) ) ( not ( = ?auto_162033 ?auto_162032 ) ) ( not ( = ?auto_162033 ?auto_162035 ) ) ( not ( = ?auto_162033 ?auto_162031 ) ) ( not ( = ?auto_162033 ?auto_162030 ) ) ( not ( = ?auto_162033 ?auto_162029 ) ) ( not ( = ?auto_162032 ?auto_162035 ) ) ( not ( = ?auto_162032 ?auto_162031 ) ) ( not ( = ?auto_162032 ?auto_162030 ) ) ( not ( = ?auto_162032 ?auto_162029 ) ) ( not ( = ?auto_162035 ?auto_162031 ) ) ( not ( = ?auto_162035 ?auto_162030 ) ) ( not ( = ?auto_162035 ?auto_162029 ) ) ( not ( = ?auto_162028 ?auto_162036 ) ) ( not ( = ?auto_162028 ?auto_162034 ) ) ( not ( = ?auto_162028 ?auto_162033 ) ) ( not ( = ?auto_162028 ?auto_162032 ) ) ( not ( = ?auto_162028 ?auto_162035 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162036 ?auto_162034 ?auto_162033 ?auto_162032 ?auto_162035 ?auto_162031 ?auto_162030 )
      ( MAKE-3PILE ?auto_162028 ?auto_162029 ?auto_162030 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162037 - BLOCK
      ?auto_162038 - BLOCK
      ?auto_162039 - BLOCK
    )
    :vars
    (
      ?auto_162040 - BLOCK
      ?auto_162041 - BLOCK
      ?auto_162045 - BLOCK
      ?auto_162043 - BLOCK
      ?auto_162044 - BLOCK
      ?auto_162042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162037 ?auto_162038 ) ) ( not ( = ?auto_162037 ?auto_162039 ) ) ( not ( = ?auto_162038 ?auto_162039 ) ) ( ON ?auto_162039 ?auto_162040 ) ( not ( = ?auto_162037 ?auto_162040 ) ) ( not ( = ?auto_162038 ?auto_162040 ) ) ( not ( = ?auto_162039 ?auto_162040 ) ) ( ON ?auto_162038 ?auto_162039 ) ( CLEAR ?auto_162038 ) ( ON-TABLE ?auto_162041 ) ( ON ?auto_162045 ?auto_162041 ) ( ON ?auto_162043 ?auto_162045 ) ( ON ?auto_162044 ?auto_162043 ) ( ON ?auto_162042 ?auto_162044 ) ( ON ?auto_162040 ?auto_162042 ) ( not ( = ?auto_162041 ?auto_162045 ) ) ( not ( = ?auto_162041 ?auto_162043 ) ) ( not ( = ?auto_162041 ?auto_162044 ) ) ( not ( = ?auto_162041 ?auto_162042 ) ) ( not ( = ?auto_162041 ?auto_162040 ) ) ( not ( = ?auto_162041 ?auto_162039 ) ) ( not ( = ?auto_162041 ?auto_162038 ) ) ( not ( = ?auto_162045 ?auto_162043 ) ) ( not ( = ?auto_162045 ?auto_162044 ) ) ( not ( = ?auto_162045 ?auto_162042 ) ) ( not ( = ?auto_162045 ?auto_162040 ) ) ( not ( = ?auto_162045 ?auto_162039 ) ) ( not ( = ?auto_162045 ?auto_162038 ) ) ( not ( = ?auto_162043 ?auto_162044 ) ) ( not ( = ?auto_162043 ?auto_162042 ) ) ( not ( = ?auto_162043 ?auto_162040 ) ) ( not ( = ?auto_162043 ?auto_162039 ) ) ( not ( = ?auto_162043 ?auto_162038 ) ) ( not ( = ?auto_162044 ?auto_162042 ) ) ( not ( = ?auto_162044 ?auto_162040 ) ) ( not ( = ?auto_162044 ?auto_162039 ) ) ( not ( = ?auto_162044 ?auto_162038 ) ) ( not ( = ?auto_162042 ?auto_162040 ) ) ( not ( = ?auto_162042 ?auto_162039 ) ) ( not ( = ?auto_162042 ?auto_162038 ) ) ( not ( = ?auto_162037 ?auto_162041 ) ) ( not ( = ?auto_162037 ?auto_162045 ) ) ( not ( = ?auto_162037 ?auto_162043 ) ) ( not ( = ?auto_162037 ?auto_162044 ) ) ( not ( = ?auto_162037 ?auto_162042 ) ) ( HOLDING ?auto_162037 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162037 )
      ( MAKE-3PILE ?auto_162037 ?auto_162038 ?auto_162039 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162046 - BLOCK
      ?auto_162047 - BLOCK
      ?auto_162048 - BLOCK
    )
    :vars
    (
      ?auto_162054 - BLOCK
      ?auto_162053 - BLOCK
      ?auto_162050 - BLOCK
      ?auto_162052 - BLOCK
      ?auto_162051 - BLOCK
      ?auto_162049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162046 ?auto_162047 ) ) ( not ( = ?auto_162046 ?auto_162048 ) ) ( not ( = ?auto_162047 ?auto_162048 ) ) ( ON ?auto_162048 ?auto_162054 ) ( not ( = ?auto_162046 ?auto_162054 ) ) ( not ( = ?auto_162047 ?auto_162054 ) ) ( not ( = ?auto_162048 ?auto_162054 ) ) ( ON ?auto_162047 ?auto_162048 ) ( ON-TABLE ?auto_162053 ) ( ON ?auto_162050 ?auto_162053 ) ( ON ?auto_162052 ?auto_162050 ) ( ON ?auto_162051 ?auto_162052 ) ( ON ?auto_162049 ?auto_162051 ) ( ON ?auto_162054 ?auto_162049 ) ( not ( = ?auto_162053 ?auto_162050 ) ) ( not ( = ?auto_162053 ?auto_162052 ) ) ( not ( = ?auto_162053 ?auto_162051 ) ) ( not ( = ?auto_162053 ?auto_162049 ) ) ( not ( = ?auto_162053 ?auto_162054 ) ) ( not ( = ?auto_162053 ?auto_162048 ) ) ( not ( = ?auto_162053 ?auto_162047 ) ) ( not ( = ?auto_162050 ?auto_162052 ) ) ( not ( = ?auto_162050 ?auto_162051 ) ) ( not ( = ?auto_162050 ?auto_162049 ) ) ( not ( = ?auto_162050 ?auto_162054 ) ) ( not ( = ?auto_162050 ?auto_162048 ) ) ( not ( = ?auto_162050 ?auto_162047 ) ) ( not ( = ?auto_162052 ?auto_162051 ) ) ( not ( = ?auto_162052 ?auto_162049 ) ) ( not ( = ?auto_162052 ?auto_162054 ) ) ( not ( = ?auto_162052 ?auto_162048 ) ) ( not ( = ?auto_162052 ?auto_162047 ) ) ( not ( = ?auto_162051 ?auto_162049 ) ) ( not ( = ?auto_162051 ?auto_162054 ) ) ( not ( = ?auto_162051 ?auto_162048 ) ) ( not ( = ?auto_162051 ?auto_162047 ) ) ( not ( = ?auto_162049 ?auto_162054 ) ) ( not ( = ?auto_162049 ?auto_162048 ) ) ( not ( = ?auto_162049 ?auto_162047 ) ) ( not ( = ?auto_162046 ?auto_162053 ) ) ( not ( = ?auto_162046 ?auto_162050 ) ) ( not ( = ?auto_162046 ?auto_162052 ) ) ( not ( = ?auto_162046 ?auto_162051 ) ) ( not ( = ?auto_162046 ?auto_162049 ) ) ( ON ?auto_162046 ?auto_162047 ) ( CLEAR ?auto_162046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162053 ?auto_162050 ?auto_162052 ?auto_162051 ?auto_162049 ?auto_162054 ?auto_162048 ?auto_162047 )
      ( MAKE-3PILE ?auto_162046 ?auto_162047 ?auto_162048 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162060 - BLOCK
      ?auto_162061 - BLOCK
      ?auto_162062 - BLOCK
      ?auto_162063 - BLOCK
      ?auto_162064 - BLOCK
    )
    :vars
    (
      ?auto_162065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162065 ?auto_162064 ) ( CLEAR ?auto_162065 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162060 ) ( ON ?auto_162061 ?auto_162060 ) ( ON ?auto_162062 ?auto_162061 ) ( ON ?auto_162063 ?auto_162062 ) ( ON ?auto_162064 ?auto_162063 ) ( not ( = ?auto_162060 ?auto_162061 ) ) ( not ( = ?auto_162060 ?auto_162062 ) ) ( not ( = ?auto_162060 ?auto_162063 ) ) ( not ( = ?auto_162060 ?auto_162064 ) ) ( not ( = ?auto_162060 ?auto_162065 ) ) ( not ( = ?auto_162061 ?auto_162062 ) ) ( not ( = ?auto_162061 ?auto_162063 ) ) ( not ( = ?auto_162061 ?auto_162064 ) ) ( not ( = ?auto_162061 ?auto_162065 ) ) ( not ( = ?auto_162062 ?auto_162063 ) ) ( not ( = ?auto_162062 ?auto_162064 ) ) ( not ( = ?auto_162062 ?auto_162065 ) ) ( not ( = ?auto_162063 ?auto_162064 ) ) ( not ( = ?auto_162063 ?auto_162065 ) ) ( not ( = ?auto_162064 ?auto_162065 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162065 ?auto_162064 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162066 - BLOCK
      ?auto_162067 - BLOCK
      ?auto_162068 - BLOCK
      ?auto_162069 - BLOCK
      ?auto_162070 - BLOCK
    )
    :vars
    (
      ?auto_162071 - BLOCK
      ?auto_162072 - BLOCK
      ?auto_162073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162071 ?auto_162070 ) ( CLEAR ?auto_162071 ) ( ON-TABLE ?auto_162066 ) ( ON ?auto_162067 ?auto_162066 ) ( ON ?auto_162068 ?auto_162067 ) ( ON ?auto_162069 ?auto_162068 ) ( ON ?auto_162070 ?auto_162069 ) ( not ( = ?auto_162066 ?auto_162067 ) ) ( not ( = ?auto_162066 ?auto_162068 ) ) ( not ( = ?auto_162066 ?auto_162069 ) ) ( not ( = ?auto_162066 ?auto_162070 ) ) ( not ( = ?auto_162066 ?auto_162071 ) ) ( not ( = ?auto_162067 ?auto_162068 ) ) ( not ( = ?auto_162067 ?auto_162069 ) ) ( not ( = ?auto_162067 ?auto_162070 ) ) ( not ( = ?auto_162067 ?auto_162071 ) ) ( not ( = ?auto_162068 ?auto_162069 ) ) ( not ( = ?auto_162068 ?auto_162070 ) ) ( not ( = ?auto_162068 ?auto_162071 ) ) ( not ( = ?auto_162069 ?auto_162070 ) ) ( not ( = ?auto_162069 ?auto_162071 ) ) ( not ( = ?auto_162070 ?auto_162071 ) ) ( HOLDING ?auto_162072 ) ( CLEAR ?auto_162073 ) ( not ( = ?auto_162066 ?auto_162072 ) ) ( not ( = ?auto_162066 ?auto_162073 ) ) ( not ( = ?auto_162067 ?auto_162072 ) ) ( not ( = ?auto_162067 ?auto_162073 ) ) ( not ( = ?auto_162068 ?auto_162072 ) ) ( not ( = ?auto_162068 ?auto_162073 ) ) ( not ( = ?auto_162069 ?auto_162072 ) ) ( not ( = ?auto_162069 ?auto_162073 ) ) ( not ( = ?auto_162070 ?auto_162072 ) ) ( not ( = ?auto_162070 ?auto_162073 ) ) ( not ( = ?auto_162071 ?auto_162072 ) ) ( not ( = ?auto_162071 ?auto_162073 ) ) ( not ( = ?auto_162072 ?auto_162073 ) ) )
    :subtasks
    ( ( !STACK ?auto_162072 ?auto_162073 )
      ( MAKE-5PILE ?auto_162066 ?auto_162067 ?auto_162068 ?auto_162069 ?auto_162070 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162074 - BLOCK
      ?auto_162075 - BLOCK
      ?auto_162076 - BLOCK
      ?auto_162077 - BLOCK
      ?auto_162078 - BLOCK
    )
    :vars
    (
      ?auto_162081 - BLOCK
      ?auto_162079 - BLOCK
      ?auto_162080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162081 ?auto_162078 ) ( ON-TABLE ?auto_162074 ) ( ON ?auto_162075 ?auto_162074 ) ( ON ?auto_162076 ?auto_162075 ) ( ON ?auto_162077 ?auto_162076 ) ( ON ?auto_162078 ?auto_162077 ) ( not ( = ?auto_162074 ?auto_162075 ) ) ( not ( = ?auto_162074 ?auto_162076 ) ) ( not ( = ?auto_162074 ?auto_162077 ) ) ( not ( = ?auto_162074 ?auto_162078 ) ) ( not ( = ?auto_162074 ?auto_162081 ) ) ( not ( = ?auto_162075 ?auto_162076 ) ) ( not ( = ?auto_162075 ?auto_162077 ) ) ( not ( = ?auto_162075 ?auto_162078 ) ) ( not ( = ?auto_162075 ?auto_162081 ) ) ( not ( = ?auto_162076 ?auto_162077 ) ) ( not ( = ?auto_162076 ?auto_162078 ) ) ( not ( = ?auto_162076 ?auto_162081 ) ) ( not ( = ?auto_162077 ?auto_162078 ) ) ( not ( = ?auto_162077 ?auto_162081 ) ) ( not ( = ?auto_162078 ?auto_162081 ) ) ( CLEAR ?auto_162079 ) ( not ( = ?auto_162074 ?auto_162080 ) ) ( not ( = ?auto_162074 ?auto_162079 ) ) ( not ( = ?auto_162075 ?auto_162080 ) ) ( not ( = ?auto_162075 ?auto_162079 ) ) ( not ( = ?auto_162076 ?auto_162080 ) ) ( not ( = ?auto_162076 ?auto_162079 ) ) ( not ( = ?auto_162077 ?auto_162080 ) ) ( not ( = ?auto_162077 ?auto_162079 ) ) ( not ( = ?auto_162078 ?auto_162080 ) ) ( not ( = ?auto_162078 ?auto_162079 ) ) ( not ( = ?auto_162081 ?auto_162080 ) ) ( not ( = ?auto_162081 ?auto_162079 ) ) ( not ( = ?auto_162080 ?auto_162079 ) ) ( ON ?auto_162080 ?auto_162081 ) ( CLEAR ?auto_162080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162074 ?auto_162075 ?auto_162076 ?auto_162077 ?auto_162078 ?auto_162081 )
      ( MAKE-5PILE ?auto_162074 ?auto_162075 ?auto_162076 ?auto_162077 ?auto_162078 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162082 - BLOCK
      ?auto_162083 - BLOCK
      ?auto_162084 - BLOCK
      ?auto_162085 - BLOCK
      ?auto_162086 - BLOCK
    )
    :vars
    (
      ?auto_162088 - BLOCK
      ?auto_162087 - BLOCK
      ?auto_162089 - BLOCK
      ?auto_162090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162088 ?auto_162086 ) ( ON-TABLE ?auto_162082 ) ( ON ?auto_162083 ?auto_162082 ) ( ON ?auto_162084 ?auto_162083 ) ( ON ?auto_162085 ?auto_162084 ) ( ON ?auto_162086 ?auto_162085 ) ( not ( = ?auto_162082 ?auto_162083 ) ) ( not ( = ?auto_162082 ?auto_162084 ) ) ( not ( = ?auto_162082 ?auto_162085 ) ) ( not ( = ?auto_162082 ?auto_162086 ) ) ( not ( = ?auto_162082 ?auto_162088 ) ) ( not ( = ?auto_162083 ?auto_162084 ) ) ( not ( = ?auto_162083 ?auto_162085 ) ) ( not ( = ?auto_162083 ?auto_162086 ) ) ( not ( = ?auto_162083 ?auto_162088 ) ) ( not ( = ?auto_162084 ?auto_162085 ) ) ( not ( = ?auto_162084 ?auto_162086 ) ) ( not ( = ?auto_162084 ?auto_162088 ) ) ( not ( = ?auto_162085 ?auto_162086 ) ) ( not ( = ?auto_162085 ?auto_162088 ) ) ( not ( = ?auto_162086 ?auto_162088 ) ) ( not ( = ?auto_162082 ?auto_162087 ) ) ( not ( = ?auto_162082 ?auto_162089 ) ) ( not ( = ?auto_162083 ?auto_162087 ) ) ( not ( = ?auto_162083 ?auto_162089 ) ) ( not ( = ?auto_162084 ?auto_162087 ) ) ( not ( = ?auto_162084 ?auto_162089 ) ) ( not ( = ?auto_162085 ?auto_162087 ) ) ( not ( = ?auto_162085 ?auto_162089 ) ) ( not ( = ?auto_162086 ?auto_162087 ) ) ( not ( = ?auto_162086 ?auto_162089 ) ) ( not ( = ?auto_162088 ?auto_162087 ) ) ( not ( = ?auto_162088 ?auto_162089 ) ) ( not ( = ?auto_162087 ?auto_162089 ) ) ( ON ?auto_162087 ?auto_162088 ) ( CLEAR ?auto_162087 ) ( HOLDING ?auto_162089 ) ( CLEAR ?auto_162090 ) ( ON-TABLE ?auto_162090 ) ( not ( = ?auto_162090 ?auto_162089 ) ) ( not ( = ?auto_162082 ?auto_162090 ) ) ( not ( = ?auto_162083 ?auto_162090 ) ) ( not ( = ?auto_162084 ?auto_162090 ) ) ( not ( = ?auto_162085 ?auto_162090 ) ) ( not ( = ?auto_162086 ?auto_162090 ) ) ( not ( = ?auto_162088 ?auto_162090 ) ) ( not ( = ?auto_162087 ?auto_162090 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162090 ?auto_162089 )
      ( MAKE-5PILE ?auto_162082 ?auto_162083 ?auto_162084 ?auto_162085 ?auto_162086 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_163610 - BLOCK
      ?auto_163611 - BLOCK
      ?auto_163612 - BLOCK
      ?auto_163613 - BLOCK
      ?auto_163614 - BLOCK
    )
    :vars
    (
      ?auto_163615 - BLOCK
      ?auto_163616 - BLOCK
      ?auto_163617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163615 ?auto_163614 ) ( ON-TABLE ?auto_163610 ) ( ON ?auto_163611 ?auto_163610 ) ( ON ?auto_163612 ?auto_163611 ) ( ON ?auto_163613 ?auto_163612 ) ( ON ?auto_163614 ?auto_163613 ) ( not ( = ?auto_163610 ?auto_163611 ) ) ( not ( = ?auto_163610 ?auto_163612 ) ) ( not ( = ?auto_163610 ?auto_163613 ) ) ( not ( = ?auto_163610 ?auto_163614 ) ) ( not ( = ?auto_163610 ?auto_163615 ) ) ( not ( = ?auto_163611 ?auto_163612 ) ) ( not ( = ?auto_163611 ?auto_163613 ) ) ( not ( = ?auto_163611 ?auto_163614 ) ) ( not ( = ?auto_163611 ?auto_163615 ) ) ( not ( = ?auto_163612 ?auto_163613 ) ) ( not ( = ?auto_163612 ?auto_163614 ) ) ( not ( = ?auto_163612 ?auto_163615 ) ) ( not ( = ?auto_163613 ?auto_163614 ) ) ( not ( = ?auto_163613 ?auto_163615 ) ) ( not ( = ?auto_163614 ?auto_163615 ) ) ( not ( = ?auto_163610 ?auto_163616 ) ) ( not ( = ?auto_163610 ?auto_163617 ) ) ( not ( = ?auto_163611 ?auto_163616 ) ) ( not ( = ?auto_163611 ?auto_163617 ) ) ( not ( = ?auto_163612 ?auto_163616 ) ) ( not ( = ?auto_163612 ?auto_163617 ) ) ( not ( = ?auto_163613 ?auto_163616 ) ) ( not ( = ?auto_163613 ?auto_163617 ) ) ( not ( = ?auto_163614 ?auto_163616 ) ) ( not ( = ?auto_163614 ?auto_163617 ) ) ( not ( = ?auto_163615 ?auto_163616 ) ) ( not ( = ?auto_163615 ?auto_163617 ) ) ( not ( = ?auto_163616 ?auto_163617 ) ) ( ON ?auto_163616 ?auto_163615 ) ( ON ?auto_163617 ?auto_163616 ) ( CLEAR ?auto_163617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163610 ?auto_163611 ?auto_163612 ?auto_163613 ?auto_163614 ?auto_163615 ?auto_163616 )
      ( MAKE-5PILE ?auto_163610 ?auto_163611 ?auto_163612 ?auto_163613 ?auto_163614 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162100 - BLOCK
      ?auto_162101 - BLOCK
      ?auto_162102 - BLOCK
      ?auto_162103 - BLOCK
      ?auto_162104 - BLOCK
    )
    :vars
    (
      ?auto_162106 - BLOCK
      ?auto_162105 - BLOCK
      ?auto_162107 - BLOCK
      ?auto_162108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162106 ?auto_162104 ) ( ON-TABLE ?auto_162100 ) ( ON ?auto_162101 ?auto_162100 ) ( ON ?auto_162102 ?auto_162101 ) ( ON ?auto_162103 ?auto_162102 ) ( ON ?auto_162104 ?auto_162103 ) ( not ( = ?auto_162100 ?auto_162101 ) ) ( not ( = ?auto_162100 ?auto_162102 ) ) ( not ( = ?auto_162100 ?auto_162103 ) ) ( not ( = ?auto_162100 ?auto_162104 ) ) ( not ( = ?auto_162100 ?auto_162106 ) ) ( not ( = ?auto_162101 ?auto_162102 ) ) ( not ( = ?auto_162101 ?auto_162103 ) ) ( not ( = ?auto_162101 ?auto_162104 ) ) ( not ( = ?auto_162101 ?auto_162106 ) ) ( not ( = ?auto_162102 ?auto_162103 ) ) ( not ( = ?auto_162102 ?auto_162104 ) ) ( not ( = ?auto_162102 ?auto_162106 ) ) ( not ( = ?auto_162103 ?auto_162104 ) ) ( not ( = ?auto_162103 ?auto_162106 ) ) ( not ( = ?auto_162104 ?auto_162106 ) ) ( not ( = ?auto_162100 ?auto_162105 ) ) ( not ( = ?auto_162100 ?auto_162107 ) ) ( not ( = ?auto_162101 ?auto_162105 ) ) ( not ( = ?auto_162101 ?auto_162107 ) ) ( not ( = ?auto_162102 ?auto_162105 ) ) ( not ( = ?auto_162102 ?auto_162107 ) ) ( not ( = ?auto_162103 ?auto_162105 ) ) ( not ( = ?auto_162103 ?auto_162107 ) ) ( not ( = ?auto_162104 ?auto_162105 ) ) ( not ( = ?auto_162104 ?auto_162107 ) ) ( not ( = ?auto_162106 ?auto_162105 ) ) ( not ( = ?auto_162106 ?auto_162107 ) ) ( not ( = ?auto_162105 ?auto_162107 ) ) ( ON ?auto_162105 ?auto_162106 ) ( not ( = ?auto_162108 ?auto_162107 ) ) ( not ( = ?auto_162100 ?auto_162108 ) ) ( not ( = ?auto_162101 ?auto_162108 ) ) ( not ( = ?auto_162102 ?auto_162108 ) ) ( not ( = ?auto_162103 ?auto_162108 ) ) ( not ( = ?auto_162104 ?auto_162108 ) ) ( not ( = ?auto_162106 ?auto_162108 ) ) ( not ( = ?auto_162105 ?auto_162108 ) ) ( ON ?auto_162107 ?auto_162105 ) ( CLEAR ?auto_162107 ) ( HOLDING ?auto_162108 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162108 )
      ( MAKE-5PILE ?auto_162100 ?auto_162101 ?auto_162102 ?auto_162103 ?auto_162104 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162109 - BLOCK
      ?auto_162110 - BLOCK
      ?auto_162111 - BLOCK
      ?auto_162112 - BLOCK
      ?auto_162113 - BLOCK
    )
    :vars
    (
      ?auto_162117 - BLOCK
      ?auto_162116 - BLOCK
      ?auto_162115 - BLOCK
      ?auto_162114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162117 ?auto_162113 ) ( ON-TABLE ?auto_162109 ) ( ON ?auto_162110 ?auto_162109 ) ( ON ?auto_162111 ?auto_162110 ) ( ON ?auto_162112 ?auto_162111 ) ( ON ?auto_162113 ?auto_162112 ) ( not ( = ?auto_162109 ?auto_162110 ) ) ( not ( = ?auto_162109 ?auto_162111 ) ) ( not ( = ?auto_162109 ?auto_162112 ) ) ( not ( = ?auto_162109 ?auto_162113 ) ) ( not ( = ?auto_162109 ?auto_162117 ) ) ( not ( = ?auto_162110 ?auto_162111 ) ) ( not ( = ?auto_162110 ?auto_162112 ) ) ( not ( = ?auto_162110 ?auto_162113 ) ) ( not ( = ?auto_162110 ?auto_162117 ) ) ( not ( = ?auto_162111 ?auto_162112 ) ) ( not ( = ?auto_162111 ?auto_162113 ) ) ( not ( = ?auto_162111 ?auto_162117 ) ) ( not ( = ?auto_162112 ?auto_162113 ) ) ( not ( = ?auto_162112 ?auto_162117 ) ) ( not ( = ?auto_162113 ?auto_162117 ) ) ( not ( = ?auto_162109 ?auto_162116 ) ) ( not ( = ?auto_162109 ?auto_162115 ) ) ( not ( = ?auto_162110 ?auto_162116 ) ) ( not ( = ?auto_162110 ?auto_162115 ) ) ( not ( = ?auto_162111 ?auto_162116 ) ) ( not ( = ?auto_162111 ?auto_162115 ) ) ( not ( = ?auto_162112 ?auto_162116 ) ) ( not ( = ?auto_162112 ?auto_162115 ) ) ( not ( = ?auto_162113 ?auto_162116 ) ) ( not ( = ?auto_162113 ?auto_162115 ) ) ( not ( = ?auto_162117 ?auto_162116 ) ) ( not ( = ?auto_162117 ?auto_162115 ) ) ( not ( = ?auto_162116 ?auto_162115 ) ) ( ON ?auto_162116 ?auto_162117 ) ( not ( = ?auto_162114 ?auto_162115 ) ) ( not ( = ?auto_162109 ?auto_162114 ) ) ( not ( = ?auto_162110 ?auto_162114 ) ) ( not ( = ?auto_162111 ?auto_162114 ) ) ( not ( = ?auto_162112 ?auto_162114 ) ) ( not ( = ?auto_162113 ?auto_162114 ) ) ( not ( = ?auto_162117 ?auto_162114 ) ) ( not ( = ?auto_162116 ?auto_162114 ) ) ( ON ?auto_162115 ?auto_162116 ) ( ON ?auto_162114 ?auto_162115 ) ( CLEAR ?auto_162114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162109 ?auto_162110 ?auto_162111 ?auto_162112 ?auto_162113 ?auto_162117 ?auto_162116 ?auto_162115 )
      ( MAKE-5PILE ?auto_162109 ?auto_162110 ?auto_162111 ?auto_162112 ?auto_162113 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162122 - BLOCK
      ?auto_162123 - BLOCK
      ?auto_162124 - BLOCK
      ?auto_162125 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_162125 ) ( CLEAR ?auto_162124 ) ( ON-TABLE ?auto_162122 ) ( ON ?auto_162123 ?auto_162122 ) ( ON ?auto_162124 ?auto_162123 ) ( not ( = ?auto_162122 ?auto_162123 ) ) ( not ( = ?auto_162122 ?auto_162124 ) ) ( not ( = ?auto_162122 ?auto_162125 ) ) ( not ( = ?auto_162123 ?auto_162124 ) ) ( not ( = ?auto_162123 ?auto_162125 ) ) ( not ( = ?auto_162124 ?auto_162125 ) ) )
    :subtasks
    ( ( !STACK ?auto_162125 ?auto_162124 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162126 - BLOCK
      ?auto_162127 - BLOCK
      ?auto_162128 - BLOCK
      ?auto_162129 - BLOCK
    )
    :vars
    (
      ?auto_162130 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162128 ) ( ON-TABLE ?auto_162126 ) ( ON ?auto_162127 ?auto_162126 ) ( ON ?auto_162128 ?auto_162127 ) ( not ( = ?auto_162126 ?auto_162127 ) ) ( not ( = ?auto_162126 ?auto_162128 ) ) ( not ( = ?auto_162126 ?auto_162129 ) ) ( not ( = ?auto_162127 ?auto_162128 ) ) ( not ( = ?auto_162127 ?auto_162129 ) ) ( not ( = ?auto_162128 ?auto_162129 ) ) ( ON ?auto_162129 ?auto_162130 ) ( CLEAR ?auto_162129 ) ( HAND-EMPTY ) ( not ( = ?auto_162126 ?auto_162130 ) ) ( not ( = ?auto_162127 ?auto_162130 ) ) ( not ( = ?auto_162128 ?auto_162130 ) ) ( not ( = ?auto_162129 ?auto_162130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162129 ?auto_162130 )
      ( MAKE-4PILE ?auto_162126 ?auto_162127 ?auto_162128 ?auto_162129 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162131 - BLOCK
      ?auto_162132 - BLOCK
      ?auto_162133 - BLOCK
      ?auto_162134 - BLOCK
    )
    :vars
    (
      ?auto_162135 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162131 ) ( ON ?auto_162132 ?auto_162131 ) ( not ( = ?auto_162131 ?auto_162132 ) ) ( not ( = ?auto_162131 ?auto_162133 ) ) ( not ( = ?auto_162131 ?auto_162134 ) ) ( not ( = ?auto_162132 ?auto_162133 ) ) ( not ( = ?auto_162132 ?auto_162134 ) ) ( not ( = ?auto_162133 ?auto_162134 ) ) ( ON ?auto_162134 ?auto_162135 ) ( CLEAR ?auto_162134 ) ( not ( = ?auto_162131 ?auto_162135 ) ) ( not ( = ?auto_162132 ?auto_162135 ) ) ( not ( = ?auto_162133 ?auto_162135 ) ) ( not ( = ?auto_162134 ?auto_162135 ) ) ( HOLDING ?auto_162133 ) ( CLEAR ?auto_162132 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162131 ?auto_162132 ?auto_162133 )
      ( MAKE-4PILE ?auto_162131 ?auto_162132 ?auto_162133 ?auto_162134 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162136 - BLOCK
      ?auto_162137 - BLOCK
      ?auto_162138 - BLOCK
      ?auto_162139 - BLOCK
    )
    :vars
    (
      ?auto_162140 - BLOCK
      ?auto_162143 - BLOCK
      ?auto_162142 - BLOCK
      ?auto_162141 - BLOCK
      ?auto_162144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162136 ) ( ON ?auto_162137 ?auto_162136 ) ( not ( = ?auto_162136 ?auto_162137 ) ) ( not ( = ?auto_162136 ?auto_162138 ) ) ( not ( = ?auto_162136 ?auto_162139 ) ) ( not ( = ?auto_162137 ?auto_162138 ) ) ( not ( = ?auto_162137 ?auto_162139 ) ) ( not ( = ?auto_162138 ?auto_162139 ) ) ( ON ?auto_162139 ?auto_162140 ) ( not ( = ?auto_162136 ?auto_162140 ) ) ( not ( = ?auto_162137 ?auto_162140 ) ) ( not ( = ?auto_162138 ?auto_162140 ) ) ( not ( = ?auto_162139 ?auto_162140 ) ) ( CLEAR ?auto_162137 ) ( ON ?auto_162138 ?auto_162139 ) ( CLEAR ?auto_162138 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162143 ) ( ON ?auto_162142 ?auto_162143 ) ( ON ?auto_162141 ?auto_162142 ) ( ON ?auto_162144 ?auto_162141 ) ( ON ?auto_162140 ?auto_162144 ) ( not ( = ?auto_162143 ?auto_162142 ) ) ( not ( = ?auto_162143 ?auto_162141 ) ) ( not ( = ?auto_162143 ?auto_162144 ) ) ( not ( = ?auto_162143 ?auto_162140 ) ) ( not ( = ?auto_162143 ?auto_162139 ) ) ( not ( = ?auto_162143 ?auto_162138 ) ) ( not ( = ?auto_162142 ?auto_162141 ) ) ( not ( = ?auto_162142 ?auto_162144 ) ) ( not ( = ?auto_162142 ?auto_162140 ) ) ( not ( = ?auto_162142 ?auto_162139 ) ) ( not ( = ?auto_162142 ?auto_162138 ) ) ( not ( = ?auto_162141 ?auto_162144 ) ) ( not ( = ?auto_162141 ?auto_162140 ) ) ( not ( = ?auto_162141 ?auto_162139 ) ) ( not ( = ?auto_162141 ?auto_162138 ) ) ( not ( = ?auto_162144 ?auto_162140 ) ) ( not ( = ?auto_162144 ?auto_162139 ) ) ( not ( = ?auto_162144 ?auto_162138 ) ) ( not ( = ?auto_162136 ?auto_162143 ) ) ( not ( = ?auto_162136 ?auto_162142 ) ) ( not ( = ?auto_162136 ?auto_162141 ) ) ( not ( = ?auto_162136 ?auto_162144 ) ) ( not ( = ?auto_162137 ?auto_162143 ) ) ( not ( = ?auto_162137 ?auto_162142 ) ) ( not ( = ?auto_162137 ?auto_162141 ) ) ( not ( = ?auto_162137 ?auto_162144 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162143 ?auto_162142 ?auto_162141 ?auto_162144 ?auto_162140 ?auto_162139 )
      ( MAKE-4PILE ?auto_162136 ?auto_162137 ?auto_162138 ?auto_162139 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162145 - BLOCK
      ?auto_162146 - BLOCK
      ?auto_162147 - BLOCK
      ?auto_162148 - BLOCK
    )
    :vars
    (
      ?auto_162149 - BLOCK
      ?auto_162152 - BLOCK
      ?auto_162150 - BLOCK
      ?auto_162153 - BLOCK
      ?auto_162151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162145 ) ( not ( = ?auto_162145 ?auto_162146 ) ) ( not ( = ?auto_162145 ?auto_162147 ) ) ( not ( = ?auto_162145 ?auto_162148 ) ) ( not ( = ?auto_162146 ?auto_162147 ) ) ( not ( = ?auto_162146 ?auto_162148 ) ) ( not ( = ?auto_162147 ?auto_162148 ) ) ( ON ?auto_162148 ?auto_162149 ) ( not ( = ?auto_162145 ?auto_162149 ) ) ( not ( = ?auto_162146 ?auto_162149 ) ) ( not ( = ?auto_162147 ?auto_162149 ) ) ( not ( = ?auto_162148 ?auto_162149 ) ) ( ON ?auto_162147 ?auto_162148 ) ( CLEAR ?auto_162147 ) ( ON-TABLE ?auto_162152 ) ( ON ?auto_162150 ?auto_162152 ) ( ON ?auto_162153 ?auto_162150 ) ( ON ?auto_162151 ?auto_162153 ) ( ON ?auto_162149 ?auto_162151 ) ( not ( = ?auto_162152 ?auto_162150 ) ) ( not ( = ?auto_162152 ?auto_162153 ) ) ( not ( = ?auto_162152 ?auto_162151 ) ) ( not ( = ?auto_162152 ?auto_162149 ) ) ( not ( = ?auto_162152 ?auto_162148 ) ) ( not ( = ?auto_162152 ?auto_162147 ) ) ( not ( = ?auto_162150 ?auto_162153 ) ) ( not ( = ?auto_162150 ?auto_162151 ) ) ( not ( = ?auto_162150 ?auto_162149 ) ) ( not ( = ?auto_162150 ?auto_162148 ) ) ( not ( = ?auto_162150 ?auto_162147 ) ) ( not ( = ?auto_162153 ?auto_162151 ) ) ( not ( = ?auto_162153 ?auto_162149 ) ) ( not ( = ?auto_162153 ?auto_162148 ) ) ( not ( = ?auto_162153 ?auto_162147 ) ) ( not ( = ?auto_162151 ?auto_162149 ) ) ( not ( = ?auto_162151 ?auto_162148 ) ) ( not ( = ?auto_162151 ?auto_162147 ) ) ( not ( = ?auto_162145 ?auto_162152 ) ) ( not ( = ?auto_162145 ?auto_162150 ) ) ( not ( = ?auto_162145 ?auto_162153 ) ) ( not ( = ?auto_162145 ?auto_162151 ) ) ( not ( = ?auto_162146 ?auto_162152 ) ) ( not ( = ?auto_162146 ?auto_162150 ) ) ( not ( = ?auto_162146 ?auto_162153 ) ) ( not ( = ?auto_162146 ?auto_162151 ) ) ( HOLDING ?auto_162146 ) ( CLEAR ?auto_162145 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162145 ?auto_162146 )
      ( MAKE-4PILE ?auto_162145 ?auto_162146 ?auto_162147 ?auto_162148 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162154 - BLOCK
      ?auto_162155 - BLOCK
      ?auto_162156 - BLOCK
      ?auto_162157 - BLOCK
    )
    :vars
    (
      ?auto_162162 - BLOCK
      ?auto_162159 - BLOCK
      ?auto_162161 - BLOCK
      ?auto_162160 - BLOCK
      ?auto_162158 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162154 ) ( not ( = ?auto_162154 ?auto_162155 ) ) ( not ( = ?auto_162154 ?auto_162156 ) ) ( not ( = ?auto_162154 ?auto_162157 ) ) ( not ( = ?auto_162155 ?auto_162156 ) ) ( not ( = ?auto_162155 ?auto_162157 ) ) ( not ( = ?auto_162156 ?auto_162157 ) ) ( ON ?auto_162157 ?auto_162162 ) ( not ( = ?auto_162154 ?auto_162162 ) ) ( not ( = ?auto_162155 ?auto_162162 ) ) ( not ( = ?auto_162156 ?auto_162162 ) ) ( not ( = ?auto_162157 ?auto_162162 ) ) ( ON ?auto_162156 ?auto_162157 ) ( ON-TABLE ?auto_162159 ) ( ON ?auto_162161 ?auto_162159 ) ( ON ?auto_162160 ?auto_162161 ) ( ON ?auto_162158 ?auto_162160 ) ( ON ?auto_162162 ?auto_162158 ) ( not ( = ?auto_162159 ?auto_162161 ) ) ( not ( = ?auto_162159 ?auto_162160 ) ) ( not ( = ?auto_162159 ?auto_162158 ) ) ( not ( = ?auto_162159 ?auto_162162 ) ) ( not ( = ?auto_162159 ?auto_162157 ) ) ( not ( = ?auto_162159 ?auto_162156 ) ) ( not ( = ?auto_162161 ?auto_162160 ) ) ( not ( = ?auto_162161 ?auto_162158 ) ) ( not ( = ?auto_162161 ?auto_162162 ) ) ( not ( = ?auto_162161 ?auto_162157 ) ) ( not ( = ?auto_162161 ?auto_162156 ) ) ( not ( = ?auto_162160 ?auto_162158 ) ) ( not ( = ?auto_162160 ?auto_162162 ) ) ( not ( = ?auto_162160 ?auto_162157 ) ) ( not ( = ?auto_162160 ?auto_162156 ) ) ( not ( = ?auto_162158 ?auto_162162 ) ) ( not ( = ?auto_162158 ?auto_162157 ) ) ( not ( = ?auto_162158 ?auto_162156 ) ) ( not ( = ?auto_162154 ?auto_162159 ) ) ( not ( = ?auto_162154 ?auto_162161 ) ) ( not ( = ?auto_162154 ?auto_162160 ) ) ( not ( = ?auto_162154 ?auto_162158 ) ) ( not ( = ?auto_162155 ?auto_162159 ) ) ( not ( = ?auto_162155 ?auto_162161 ) ) ( not ( = ?auto_162155 ?auto_162160 ) ) ( not ( = ?auto_162155 ?auto_162158 ) ) ( CLEAR ?auto_162154 ) ( ON ?auto_162155 ?auto_162156 ) ( CLEAR ?auto_162155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162159 ?auto_162161 ?auto_162160 ?auto_162158 ?auto_162162 ?auto_162157 ?auto_162156 )
      ( MAKE-4PILE ?auto_162154 ?auto_162155 ?auto_162156 ?auto_162157 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162163 - BLOCK
      ?auto_162164 - BLOCK
      ?auto_162165 - BLOCK
      ?auto_162166 - BLOCK
    )
    :vars
    (
      ?auto_162170 - BLOCK
      ?auto_162171 - BLOCK
      ?auto_162168 - BLOCK
      ?auto_162167 - BLOCK
      ?auto_162169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162163 ?auto_162164 ) ) ( not ( = ?auto_162163 ?auto_162165 ) ) ( not ( = ?auto_162163 ?auto_162166 ) ) ( not ( = ?auto_162164 ?auto_162165 ) ) ( not ( = ?auto_162164 ?auto_162166 ) ) ( not ( = ?auto_162165 ?auto_162166 ) ) ( ON ?auto_162166 ?auto_162170 ) ( not ( = ?auto_162163 ?auto_162170 ) ) ( not ( = ?auto_162164 ?auto_162170 ) ) ( not ( = ?auto_162165 ?auto_162170 ) ) ( not ( = ?auto_162166 ?auto_162170 ) ) ( ON ?auto_162165 ?auto_162166 ) ( ON-TABLE ?auto_162171 ) ( ON ?auto_162168 ?auto_162171 ) ( ON ?auto_162167 ?auto_162168 ) ( ON ?auto_162169 ?auto_162167 ) ( ON ?auto_162170 ?auto_162169 ) ( not ( = ?auto_162171 ?auto_162168 ) ) ( not ( = ?auto_162171 ?auto_162167 ) ) ( not ( = ?auto_162171 ?auto_162169 ) ) ( not ( = ?auto_162171 ?auto_162170 ) ) ( not ( = ?auto_162171 ?auto_162166 ) ) ( not ( = ?auto_162171 ?auto_162165 ) ) ( not ( = ?auto_162168 ?auto_162167 ) ) ( not ( = ?auto_162168 ?auto_162169 ) ) ( not ( = ?auto_162168 ?auto_162170 ) ) ( not ( = ?auto_162168 ?auto_162166 ) ) ( not ( = ?auto_162168 ?auto_162165 ) ) ( not ( = ?auto_162167 ?auto_162169 ) ) ( not ( = ?auto_162167 ?auto_162170 ) ) ( not ( = ?auto_162167 ?auto_162166 ) ) ( not ( = ?auto_162167 ?auto_162165 ) ) ( not ( = ?auto_162169 ?auto_162170 ) ) ( not ( = ?auto_162169 ?auto_162166 ) ) ( not ( = ?auto_162169 ?auto_162165 ) ) ( not ( = ?auto_162163 ?auto_162171 ) ) ( not ( = ?auto_162163 ?auto_162168 ) ) ( not ( = ?auto_162163 ?auto_162167 ) ) ( not ( = ?auto_162163 ?auto_162169 ) ) ( not ( = ?auto_162164 ?auto_162171 ) ) ( not ( = ?auto_162164 ?auto_162168 ) ) ( not ( = ?auto_162164 ?auto_162167 ) ) ( not ( = ?auto_162164 ?auto_162169 ) ) ( ON ?auto_162164 ?auto_162165 ) ( CLEAR ?auto_162164 ) ( HOLDING ?auto_162163 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162163 )
      ( MAKE-4PILE ?auto_162163 ?auto_162164 ?auto_162165 ?auto_162166 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162172 - BLOCK
      ?auto_162173 - BLOCK
      ?auto_162174 - BLOCK
      ?auto_162175 - BLOCK
    )
    :vars
    (
      ?auto_162178 - BLOCK
      ?auto_162179 - BLOCK
      ?auto_162176 - BLOCK
      ?auto_162180 - BLOCK
      ?auto_162177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162172 ?auto_162173 ) ) ( not ( = ?auto_162172 ?auto_162174 ) ) ( not ( = ?auto_162172 ?auto_162175 ) ) ( not ( = ?auto_162173 ?auto_162174 ) ) ( not ( = ?auto_162173 ?auto_162175 ) ) ( not ( = ?auto_162174 ?auto_162175 ) ) ( ON ?auto_162175 ?auto_162178 ) ( not ( = ?auto_162172 ?auto_162178 ) ) ( not ( = ?auto_162173 ?auto_162178 ) ) ( not ( = ?auto_162174 ?auto_162178 ) ) ( not ( = ?auto_162175 ?auto_162178 ) ) ( ON ?auto_162174 ?auto_162175 ) ( ON-TABLE ?auto_162179 ) ( ON ?auto_162176 ?auto_162179 ) ( ON ?auto_162180 ?auto_162176 ) ( ON ?auto_162177 ?auto_162180 ) ( ON ?auto_162178 ?auto_162177 ) ( not ( = ?auto_162179 ?auto_162176 ) ) ( not ( = ?auto_162179 ?auto_162180 ) ) ( not ( = ?auto_162179 ?auto_162177 ) ) ( not ( = ?auto_162179 ?auto_162178 ) ) ( not ( = ?auto_162179 ?auto_162175 ) ) ( not ( = ?auto_162179 ?auto_162174 ) ) ( not ( = ?auto_162176 ?auto_162180 ) ) ( not ( = ?auto_162176 ?auto_162177 ) ) ( not ( = ?auto_162176 ?auto_162178 ) ) ( not ( = ?auto_162176 ?auto_162175 ) ) ( not ( = ?auto_162176 ?auto_162174 ) ) ( not ( = ?auto_162180 ?auto_162177 ) ) ( not ( = ?auto_162180 ?auto_162178 ) ) ( not ( = ?auto_162180 ?auto_162175 ) ) ( not ( = ?auto_162180 ?auto_162174 ) ) ( not ( = ?auto_162177 ?auto_162178 ) ) ( not ( = ?auto_162177 ?auto_162175 ) ) ( not ( = ?auto_162177 ?auto_162174 ) ) ( not ( = ?auto_162172 ?auto_162179 ) ) ( not ( = ?auto_162172 ?auto_162176 ) ) ( not ( = ?auto_162172 ?auto_162180 ) ) ( not ( = ?auto_162172 ?auto_162177 ) ) ( not ( = ?auto_162173 ?auto_162179 ) ) ( not ( = ?auto_162173 ?auto_162176 ) ) ( not ( = ?auto_162173 ?auto_162180 ) ) ( not ( = ?auto_162173 ?auto_162177 ) ) ( ON ?auto_162173 ?auto_162174 ) ( ON ?auto_162172 ?auto_162173 ) ( CLEAR ?auto_162172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162179 ?auto_162176 ?auto_162180 ?auto_162177 ?auto_162178 ?auto_162175 ?auto_162174 ?auto_162173 )
      ( MAKE-4PILE ?auto_162172 ?auto_162173 ?auto_162174 ?auto_162175 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162185 - BLOCK
      ?auto_162186 - BLOCK
      ?auto_162187 - BLOCK
      ?auto_162188 - BLOCK
    )
    :vars
    (
      ?auto_162189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162189 ?auto_162188 ) ( CLEAR ?auto_162189 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162185 ) ( ON ?auto_162186 ?auto_162185 ) ( ON ?auto_162187 ?auto_162186 ) ( ON ?auto_162188 ?auto_162187 ) ( not ( = ?auto_162185 ?auto_162186 ) ) ( not ( = ?auto_162185 ?auto_162187 ) ) ( not ( = ?auto_162185 ?auto_162188 ) ) ( not ( = ?auto_162185 ?auto_162189 ) ) ( not ( = ?auto_162186 ?auto_162187 ) ) ( not ( = ?auto_162186 ?auto_162188 ) ) ( not ( = ?auto_162186 ?auto_162189 ) ) ( not ( = ?auto_162187 ?auto_162188 ) ) ( not ( = ?auto_162187 ?auto_162189 ) ) ( not ( = ?auto_162188 ?auto_162189 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162189 ?auto_162188 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162190 - BLOCK
      ?auto_162191 - BLOCK
      ?auto_162192 - BLOCK
      ?auto_162193 - BLOCK
    )
    :vars
    (
      ?auto_162194 - BLOCK
      ?auto_162195 - BLOCK
      ?auto_162196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162194 ?auto_162193 ) ( CLEAR ?auto_162194 ) ( ON-TABLE ?auto_162190 ) ( ON ?auto_162191 ?auto_162190 ) ( ON ?auto_162192 ?auto_162191 ) ( ON ?auto_162193 ?auto_162192 ) ( not ( = ?auto_162190 ?auto_162191 ) ) ( not ( = ?auto_162190 ?auto_162192 ) ) ( not ( = ?auto_162190 ?auto_162193 ) ) ( not ( = ?auto_162190 ?auto_162194 ) ) ( not ( = ?auto_162191 ?auto_162192 ) ) ( not ( = ?auto_162191 ?auto_162193 ) ) ( not ( = ?auto_162191 ?auto_162194 ) ) ( not ( = ?auto_162192 ?auto_162193 ) ) ( not ( = ?auto_162192 ?auto_162194 ) ) ( not ( = ?auto_162193 ?auto_162194 ) ) ( HOLDING ?auto_162195 ) ( CLEAR ?auto_162196 ) ( not ( = ?auto_162190 ?auto_162195 ) ) ( not ( = ?auto_162190 ?auto_162196 ) ) ( not ( = ?auto_162191 ?auto_162195 ) ) ( not ( = ?auto_162191 ?auto_162196 ) ) ( not ( = ?auto_162192 ?auto_162195 ) ) ( not ( = ?auto_162192 ?auto_162196 ) ) ( not ( = ?auto_162193 ?auto_162195 ) ) ( not ( = ?auto_162193 ?auto_162196 ) ) ( not ( = ?auto_162194 ?auto_162195 ) ) ( not ( = ?auto_162194 ?auto_162196 ) ) ( not ( = ?auto_162195 ?auto_162196 ) ) )
    :subtasks
    ( ( !STACK ?auto_162195 ?auto_162196 )
      ( MAKE-4PILE ?auto_162190 ?auto_162191 ?auto_162192 ?auto_162193 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162197 - BLOCK
      ?auto_162198 - BLOCK
      ?auto_162199 - BLOCK
      ?auto_162200 - BLOCK
    )
    :vars
    (
      ?auto_162201 - BLOCK
      ?auto_162203 - BLOCK
      ?auto_162202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162201 ?auto_162200 ) ( ON-TABLE ?auto_162197 ) ( ON ?auto_162198 ?auto_162197 ) ( ON ?auto_162199 ?auto_162198 ) ( ON ?auto_162200 ?auto_162199 ) ( not ( = ?auto_162197 ?auto_162198 ) ) ( not ( = ?auto_162197 ?auto_162199 ) ) ( not ( = ?auto_162197 ?auto_162200 ) ) ( not ( = ?auto_162197 ?auto_162201 ) ) ( not ( = ?auto_162198 ?auto_162199 ) ) ( not ( = ?auto_162198 ?auto_162200 ) ) ( not ( = ?auto_162198 ?auto_162201 ) ) ( not ( = ?auto_162199 ?auto_162200 ) ) ( not ( = ?auto_162199 ?auto_162201 ) ) ( not ( = ?auto_162200 ?auto_162201 ) ) ( CLEAR ?auto_162203 ) ( not ( = ?auto_162197 ?auto_162202 ) ) ( not ( = ?auto_162197 ?auto_162203 ) ) ( not ( = ?auto_162198 ?auto_162202 ) ) ( not ( = ?auto_162198 ?auto_162203 ) ) ( not ( = ?auto_162199 ?auto_162202 ) ) ( not ( = ?auto_162199 ?auto_162203 ) ) ( not ( = ?auto_162200 ?auto_162202 ) ) ( not ( = ?auto_162200 ?auto_162203 ) ) ( not ( = ?auto_162201 ?auto_162202 ) ) ( not ( = ?auto_162201 ?auto_162203 ) ) ( not ( = ?auto_162202 ?auto_162203 ) ) ( ON ?auto_162202 ?auto_162201 ) ( CLEAR ?auto_162202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162197 ?auto_162198 ?auto_162199 ?auto_162200 ?auto_162201 )
      ( MAKE-4PILE ?auto_162197 ?auto_162198 ?auto_162199 ?auto_162200 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162204 - BLOCK
      ?auto_162205 - BLOCK
      ?auto_162206 - BLOCK
      ?auto_162207 - BLOCK
    )
    :vars
    (
      ?auto_162209 - BLOCK
      ?auto_162210 - BLOCK
      ?auto_162208 - BLOCK
      ?auto_162212 - BLOCK
      ?auto_162211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162209 ?auto_162207 ) ( ON-TABLE ?auto_162204 ) ( ON ?auto_162205 ?auto_162204 ) ( ON ?auto_162206 ?auto_162205 ) ( ON ?auto_162207 ?auto_162206 ) ( not ( = ?auto_162204 ?auto_162205 ) ) ( not ( = ?auto_162204 ?auto_162206 ) ) ( not ( = ?auto_162204 ?auto_162207 ) ) ( not ( = ?auto_162204 ?auto_162209 ) ) ( not ( = ?auto_162205 ?auto_162206 ) ) ( not ( = ?auto_162205 ?auto_162207 ) ) ( not ( = ?auto_162205 ?auto_162209 ) ) ( not ( = ?auto_162206 ?auto_162207 ) ) ( not ( = ?auto_162206 ?auto_162209 ) ) ( not ( = ?auto_162207 ?auto_162209 ) ) ( not ( = ?auto_162204 ?auto_162210 ) ) ( not ( = ?auto_162204 ?auto_162208 ) ) ( not ( = ?auto_162205 ?auto_162210 ) ) ( not ( = ?auto_162205 ?auto_162208 ) ) ( not ( = ?auto_162206 ?auto_162210 ) ) ( not ( = ?auto_162206 ?auto_162208 ) ) ( not ( = ?auto_162207 ?auto_162210 ) ) ( not ( = ?auto_162207 ?auto_162208 ) ) ( not ( = ?auto_162209 ?auto_162210 ) ) ( not ( = ?auto_162209 ?auto_162208 ) ) ( not ( = ?auto_162210 ?auto_162208 ) ) ( ON ?auto_162210 ?auto_162209 ) ( CLEAR ?auto_162210 ) ( HOLDING ?auto_162208 ) ( CLEAR ?auto_162212 ) ( ON-TABLE ?auto_162211 ) ( ON ?auto_162212 ?auto_162211 ) ( not ( = ?auto_162211 ?auto_162212 ) ) ( not ( = ?auto_162211 ?auto_162208 ) ) ( not ( = ?auto_162212 ?auto_162208 ) ) ( not ( = ?auto_162204 ?auto_162212 ) ) ( not ( = ?auto_162204 ?auto_162211 ) ) ( not ( = ?auto_162205 ?auto_162212 ) ) ( not ( = ?auto_162205 ?auto_162211 ) ) ( not ( = ?auto_162206 ?auto_162212 ) ) ( not ( = ?auto_162206 ?auto_162211 ) ) ( not ( = ?auto_162207 ?auto_162212 ) ) ( not ( = ?auto_162207 ?auto_162211 ) ) ( not ( = ?auto_162209 ?auto_162212 ) ) ( not ( = ?auto_162209 ?auto_162211 ) ) ( not ( = ?auto_162210 ?auto_162212 ) ) ( not ( = ?auto_162210 ?auto_162211 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162211 ?auto_162212 ?auto_162208 )
      ( MAKE-4PILE ?auto_162204 ?auto_162205 ?auto_162206 ?auto_162207 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162213 - BLOCK
      ?auto_162214 - BLOCK
      ?auto_162215 - BLOCK
      ?auto_162216 - BLOCK
    )
    :vars
    (
      ?auto_162217 - BLOCK
      ?auto_162221 - BLOCK
      ?auto_162220 - BLOCK
      ?auto_162219 - BLOCK
      ?auto_162218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162217 ?auto_162216 ) ( ON-TABLE ?auto_162213 ) ( ON ?auto_162214 ?auto_162213 ) ( ON ?auto_162215 ?auto_162214 ) ( ON ?auto_162216 ?auto_162215 ) ( not ( = ?auto_162213 ?auto_162214 ) ) ( not ( = ?auto_162213 ?auto_162215 ) ) ( not ( = ?auto_162213 ?auto_162216 ) ) ( not ( = ?auto_162213 ?auto_162217 ) ) ( not ( = ?auto_162214 ?auto_162215 ) ) ( not ( = ?auto_162214 ?auto_162216 ) ) ( not ( = ?auto_162214 ?auto_162217 ) ) ( not ( = ?auto_162215 ?auto_162216 ) ) ( not ( = ?auto_162215 ?auto_162217 ) ) ( not ( = ?auto_162216 ?auto_162217 ) ) ( not ( = ?auto_162213 ?auto_162221 ) ) ( not ( = ?auto_162213 ?auto_162220 ) ) ( not ( = ?auto_162214 ?auto_162221 ) ) ( not ( = ?auto_162214 ?auto_162220 ) ) ( not ( = ?auto_162215 ?auto_162221 ) ) ( not ( = ?auto_162215 ?auto_162220 ) ) ( not ( = ?auto_162216 ?auto_162221 ) ) ( not ( = ?auto_162216 ?auto_162220 ) ) ( not ( = ?auto_162217 ?auto_162221 ) ) ( not ( = ?auto_162217 ?auto_162220 ) ) ( not ( = ?auto_162221 ?auto_162220 ) ) ( ON ?auto_162221 ?auto_162217 ) ( CLEAR ?auto_162219 ) ( ON-TABLE ?auto_162218 ) ( ON ?auto_162219 ?auto_162218 ) ( not ( = ?auto_162218 ?auto_162219 ) ) ( not ( = ?auto_162218 ?auto_162220 ) ) ( not ( = ?auto_162219 ?auto_162220 ) ) ( not ( = ?auto_162213 ?auto_162219 ) ) ( not ( = ?auto_162213 ?auto_162218 ) ) ( not ( = ?auto_162214 ?auto_162219 ) ) ( not ( = ?auto_162214 ?auto_162218 ) ) ( not ( = ?auto_162215 ?auto_162219 ) ) ( not ( = ?auto_162215 ?auto_162218 ) ) ( not ( = ?auto_162216 ?auto_162219 ) ) ( not ( = ?auto_162216 ?auto_162218 ) ) ( not ( = ?auto_162217 ?auto_162219 ) ) ( not ( = ?auto_162217 ?auto_162218 ) ) ( not ( = ?auto_162221 ?auto_162219 ) ) ( not ( = ?auto_162221 ?auto_162218 ) ) ( ON ?auto_162220 ?auto_162221 ) ( CLEAR ?auto_162220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162213 ?auto_162214 ?auto_162215 ?auto_162216 ?auto_162217 ?auto_162221 )
      ( MAKE-4PILE ?auto_162213 ?auto_162214 ?auto_162215 ?auto_162216 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162222 - BLOCK
      ?auto_162223 - BLOCK
      ?auto_162224 - BLOCK
      ?auto_162225 - BLOCK
    )
    :vars
    (
      ?auto_162226 - BLOCK
      ?auto_162229 - BLOCK
      ?auto_162230 - BLOCK
      ?auto_162227 - BLOCK
      ?auto_162228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162226 ?auto_162225 ) ( ON-TABLE ?auto_162222 ) ( ON ?auto_162223 ?auto_162222 ) ( ON ?auto_162224 ?auto_162223 ) ( ON ?auto_162225 ?auto_162224 ) ( not ( = ?auto_162222 ?auto_162223 ) ) ( not ( = ?auto_162222 ?auto_162224 ) ) ( not ( = ?auto_162222 ?auto_162225 ) ) ( not ( = ?auto_162222 ?auto_162226 ) ) ( not ( = ?auto_162223 ?auto_162224 ) ) ( not ( = ?auto_162223 ?auto_162225 ) ) ( not ( = ?auto_162223 ?auto_162226 ) ) ( not ( = ?auto_162224 ?auto_162225 ) ) ( not ( = ?auto_162224 ?auto_162226 ) ) ( not ( = ?auto_162225 ?auto_162226 ) ) ( not ( = ?auto_162222 ?auto_162229 ) ) ( not ( = ?auto_162222 ?auto_162230 ) ) ( not ( = ?auto_162223 ?auto_162229 ) ) ( not ( = ?auto_162223 ?auto_162230 ) ) ( not ( = ?auto_162224 ?auto_162229 ) ) ( not ( = ?auto_162224 ?auto_162230 ) ) ( not ( = ?auto_162225 ?auto_162229 ) ) ( not ( = ?auto_162225 ?auto_162230 ) ) ( not ( = ?auto_162226 ?auto_162229 ) ) ( not ( = ?auto_162226 ?auto_162230 ) ) ( not ( = ?auto_162229 ?auto_162230 ) ) ( ON ?auto_162229 ?auto_162226 ) ( ON-TABLE ?auto_162227 ) ( not ( = ?auto_162227 ?auto_162228 ) ) ( not ( = ?auto_162227 ?auto_162230 ) ) ( not ( = ?auto_162228 ?auto_162230 ) ) ( not ( = ?auto_162222 ?auto_162228 ) ) ( not ( = ?auto_162222 ?auto_162227 ) ) ( not ( = ?auto_162223 ?auto_162228 ) ) ( not ( = ?auto_162223 ?auto_162227 ) ) ( not ( = ?auto_162224 ?auto_162228 ) ) ( not ( = ?auto_162224 ?auto_162227 ) ) ( not ( = ?auto_162225 ?auto_162228 ) ) ( not ( = ?auto_162225 ?auto_162227 ) ) ( not ( = ?auto_162226 ?auto_162228 ) ) ( not ( = ?auto_162226 ?auto_162227 ) ) ( not ( = ?auto_162229 ?auto_162228 ) ) ( not ( = ?auto_162229 ?auto_162227 ) ) ( ON ?auto_162230 ?auto_162229 ) ( CLEAR ?auto_162230 ) ( HOLDING ?auto_162228 ) ( CLEAR ?auto_162227 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162227 ?auto_162228 )
      ( MAKE-4PILE ?auto_162222 ?auto_162223 ?auto_162224 ?auto_162225 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_163924 - BLOCK
      ?auto_163925 - BLOCK
      ?auto_163926 - BLOCK
      ?auto_163927 - BLOCK
    )
    :vars
    (
      ?auto_163928 - BLOCK
      ?auto_163931 - BLOCK
      ?auto_163930 - BLOCK
      ?auto_163929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163928 ?auto_163927 ) ( ON-TABLE ?auto_163924 ) ( ON ?auto_163925 ?auto_163924 ) ( ON ?auto_163926 ?auto_163925 ) ( ON ?auto_163927 ?auto_163926 ) ( not ( = ?auto_163924 ?auto_163925 ) ) ( not ( = ?auto_163924 ?auto_163926 ) ) ( not ( = ?auto_163924 ?auto_163927 ) ) ( not ( = ?auto_163924 ?auto_163928 ) ) ( not ( = ?auto_163925 ?auto_163926 ) ) ( not ( = ?auto_163925 ?auto_163927 ) ) ( not ( = ?auto_163925 ?auto_163928 ) ) ( not ( = ?auto_163926 ?auto_163927 ) ) ( not ( = ?auto_163926 ?auto_163928 ) ) ( not ( = ?auto_163927 ?auto_163928 ) ) ( not ( = ?auto_163924 ?auto_163931 ) ) ( not ( = ?auto_163924 ?auto_163930 ) ) ( not ( = ?auto_163925 ?auto_163931 ) ) ( not ( = ?auto_163925 ?auto_163930 ) ) ( not ( = ?auto_163926 ?auto_163931 ) ) ( not ( = ?auto_163926 ?auto_163930 ) ) ( not ( = ?auto_163927 ?auto_163931 ) ) ( not ( = ?auto_163927 ?auto_163930 ) ) ( not ( = ?auto_163928 ?auto_163931 ) ) ( not ( = ?auto_163928 ?auto_163930 ) ) ( not ( = ?auto_163931 ?auto_163930 ) ) ( ON ?auto_163931 ?auto_163928 ) ( not ( = ?auto_163929 ?auto_163930 ) ) ( not ( = ?auto_163924 ?auto_163929 ) ) ( not ( = ?auto_163925 ?auto_163929 ) ) ( not ( = ?auto_163926 ?auto_163929 ) ) ( not ( = ?auto_163927 ?auto_163929 ) ) ( not ( = ?auto_163928 ?auto_163929 ) ) ( not ( = ?auto_163931 ?auto_163929 ) ) ( ON ?auto_163930 ?auto_163931 ) ( ON ?auto_163929 ?auto_163930 ) ( CLEAR ?auto_163929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163924 ?auto_163925 ?auto_163926 ?auto_163927 ?auto_163928 ?auto_163931 ?auto_163930 )
      ( MAKE-4PILE ?auto_163924 ?auto_163925 ?auto_163926 ?auto_163927 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162240 - BLOCK
      ?auto_162241 - BLOCK
      ?auto_162242 - BLOCK
      ?auto_162243 - BLOCK
    )
    :vars
    (
      ?auto_162244 - BLOCK
      ?auto_162246 - BLOCK
      ?auto_162248 - BLOCK
      ?auto_162247 - BLOCK
      ?auto_162245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162244 ?auto_162243 ) ( ON-TABLE ?auto_162240 ) ( ON ?auto_162241 ?auto_162240 ) ( ON ?auto_162242 ?auto_162241 ) ( ON ?auto_162243 ?auto_162242 ) ( not ( = ?auto_162240 ?auto_162241 ) ) ( not ( = ?auto_162240 ?auto_162242 ) ) ( not ( = ?auto_162240 ?auto_162243 ) ) ( not ( = ?auto_162240 ?auto_162244 ) ) ( not ( = ?auto_162241 ?auto_162242 ) ) ( not ( = ?auto_162241 ?auto_162243 ) ) ( not ( = ?auto_162241 ?auto_162244 ) ) ( not ( = ?auto_162242 ?auto_162243 ) ) ( not ( = ?auto_162242 ?auto_162244 ) ) ( not ( = ?auto_162243 ?auto_162244 ) ) ( not ( = ?auto_162240 ?auto_162246 ) ) ( not ( = ?auto_162240 ?auto_162248 ) ) ( not ( = ?auto_162241 ?auto_162246 ) ) ( not ( = ?auto_162241 ?auto_162248 ) ) ( not ( = ?auto_162242 ?auto_162246 ) ) ( not ( = ?auto_162242 ?auto_162248 ) ) ( not ( = ?auto_162243 ?auto_162246 ) ) ( not ( = ?auto_162243 ?auto_162248 ) ) ( not ( = ?auto_162244 ?auto_162246 ) ) ( not ( = ?auto_162244 ?auto_162248 ) ) ( not ( = ?auto_162246 ?auto_162248 ) ) ( ON ?auto_162246 ?auto_162244 ) ( not ( = ?auto_162247 ?auto_162245 ) ) ( not ( = ?auto_162247 ?auto_162248 ) ) ( not ( = ?auto_162245 ?auto_162248 ) ) ( not ( = ?auto_162240 ?auto_162245 ) ) ( not ( = ?auto_162240 ?auto_162247 ) ) ( not ( = ?auto_162241 ?auto_162245 ) ) ( not ( = ?auto_162241 ?auto_162247 ) ) ( not ( = ?auto_162242 ?auto_162245 ) ) ( not ( = ?auto_162242 ?auto_162247 ) ) ( not ( = ?auto_162243 ?auto_162245 ) ) ( not ( = ?auto_162243 ?auto_162247 ) ) ( not ( = ?auto_162244 ?auto_162245 ) ) ( not ( = ?auto_162244 ?auto_162247 ) ) ( not ( = ?auto_162246 ?auto_162245 ) ) ( not ( = ?auto_162246 ?auto_162247 ) ) ( ON ?auto_162248 ?auto_162246 ) ( ON ?auto_162245 ?auto_162248 ) ( CLEAR ?auto_162245 ) ( HOLDING ?auto_162247 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162247 )
      ( MAKE-4PILE ?auto_162240 ?auto_162241 ?auto_162242 ?auto_162243 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162249 - BLOCK
      ?auto_162250 - BLOCK
      ?auto_162251 - BLOCK
      ?auto_162252 - BLOCK
    )
    :vars
    (
      ?auto_162254 - BLOCK
      ?auto_162255 - BLOCK
      ?auto_162257 - BLOCK
      ?auto_162253 - BLOCK
      ?auto_162256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162254 ?auto_162252 ) ( ON-TABLE ?auto_162249 ) ( ON ?auto_162250 ?auto_162249 ) ( ON ?auto_162251 ?auto_162250 ) ( ON ?auto_162252 ?auto_162251 ) ( not ( = ?auto_162249 ?auto_162250 ) ) ( not ( = ?auto_162249 ?auto_162251 ) ) ( not ( = ?auto_162249 ?auto_162252 ) ) ( not ( = ?auto_162249 ?auto_162254 ) ) ( not ( = ?auto_162250 ?auto_162251 ) ) ( not ( = ?auto_162250 ?auto_162252 ) ) ( not ( = ?auto_162250 ?auto_162254 ) ) ( not ( = ?auto_162251 ?auto_162252 ) ) ( not ( = ?auto_162251 ?auto_162254 ) ) ( not ( = ?auto_162252 ?auto_162254 ) ) ( not ( = ?auto_162249 ?auto_162255 ) ) ( not ( = ?auto_162249 ?auto_162257 ) ) ( not ( = ?auto_162250 ?auto_162255 ) ) ( not ( = ?auto_162250 ?auto_162257 ) ) ( not ( = ?auto_162251 ?auto_162255 ) ) ( not ( = ?auto_162251 ?auto_162257 ) ) ( not ( = ?auto_162252 ?auto_162255 ) ) ( not ( = ?auto_162252 ?auto_162257 ) ) ( not ( = ?auto_162254 ?auto_162255 ) ) ( not ( = ?auto_162254 ?auto_162257 ) ) ( not ( = ?auto_162255 ?auto_162257 ) ) ( ON ?auto_162255 ?auto_162254 ) ( not ( = ?auto_162253 ?auto_162256 ) ) ( not ( = ?auto_162253 ?auto_162257 ) ) ( not ( = ?auto_162256 ?auto_162257 ) ) ( not ( = ?auto_162249 ?auto_162256 ) ) ( not ( = ?auto_162249 ?auto_162253 ) ) ( not ( = ?auto_162250 ?auto_162256 ) ) ( not ( = ?auto_162250 ?auto_162253 ) ) ( not ( = ?auto_162251 ?auto_162256 ) ) ( not ( = ?auto_162251 ?auto_162253 ) ) ( not ( = ?auto_162252 ?auto_162256 ) ) ( not ( = ?auto_162252 ?auto_162253 ) ) ( not ( = ?auto_162254 ?auto_162256 ) ) ( not ( = ?auto_162254 ?auto_162253 ) ) ( not ( = ?auto_162255 ?auto_162256 ) ) ( not ( = ?auto_162255 ?auto_162253 ) ) ( ON ?auto_162257 ?auto_162255 ) ( ON ?auto_162256 ?auto_162257 ) ( ON ?auto_162253 ?auto_162256 ) ( CLEAR ?auto_162253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162249 ?auto_162250 ?auto_162251 ?auto_162252 ?auto_162254 ?auto_162255 ?auto_162257 ?auto_162256 )
      ( MAKE-4PILE ?auto_162249 ?auto_162250 ?auto_162251 ?auto_162252 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162263 - BLOCK
      ?auto_162264 - BLOCK
      ?auto_162265 - BLOCK
      ?auto_162266 - BLOCK
      ?auto_162267 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_162267 ) ( CLEAR ?auto_162266 ) ( ON-TABLE ?auto_162263 ) ( ON ?auto_162264 ?auto_162263 ) ( ON ?auto_162265 ?auto_162264 ) ( ON ?auto_162266 ?auto_162265 ) ( not ( = ?auto_162263 ?auto_162264 ) ) ( not ( = ?auto_162263 ?auto_162265 ) ) ( not ( = ?auto_162263 ?auto_162266 ) ) ( not ( = ?auto_162263 ?auto_162267 ) ) ( not ( = ?auto_162264 ?auto_162265 ) ) ( not ( = ?auto_162264 ?auto_162266 ) ) ( not ( = ?auto_162264 ?auto_162267 ) ) ( not ( = ?auto_162265 ?auto_162266 ) ) ( not ( = ?auto_162265 ?auto_162267 ) ) ( not ( = ?auto_162266 ?auto_162267 ) ) )
    :subtasks
    ( ( !STACK ?auto_162267 ?auto_162266 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162268 - BLOCK
      ?auto_162269 - BLOCK
      ?auto_162270 - BLOCK
      ?auto_162271 - BLOCK
      ?auto_162272 - BLOCK
    )
    :vars
    (
      ?auto_162273 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162271 ) ( ON-TABLE ?auto_162268 ) ( ON ?auto_162269 ?auto_162268 ) ( ON ?auto_162270 ?auto_162269 ) ( ON ?auto_162271 ?auto_162270 ) ( not ( = ?auto_162268 ?auto_162269 ) ) ( not ( = ?auto_162268 ?auto_162270 ) ) ( not ( = ?auto_162268 ?auto_162271 ) ) ( not ( = ?auto_162268 ?auto_162272 ) ) ( not ( = ?auto_162269 ?auto_162270 ) ) ( not ( = ?auto_162269 ?auto_162271 ) ) ( not ( = ?auto_162269 ?auto_162272 ) ) ( not ( = ?auto_162270 ?auto_162271 ) ) ( not ( = ?auto_162270 ?auto_162272 ) ) ( not ( = ?auto_162271 ?auto_162272 ) ) ( ON ?auto_162272 ?auto_162273 ) ( CLEAR ?auto_162272 ) ( HAND-EMPTY ) ( not ( = ?auto_162268 ?auto_162273 ) ) ( not ( = ?auto_162269 ?auto_162273 ) ) ( not ( = ?auto_162270 ?auto_162273 ) ) ( not ( = ?auto_162271 ?auto_162273 ) ) ( not ( = ?auto_162272 ?auto_162273 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162272 ?auto_162273 )
      ( MAKE-5PILE ?auto_162268 ?auto_162269 ?auto_162270 ?auto_162271 ?auto_162272 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162274 - BLOCK
      ?auto_162275 - BLOCK
      ?auto_162276 - BLOCK
      ?auto_162277 - BLOCK
      ?auto_162278 - BLOCK
    )
    :vars
    (
      ?auto_162279 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162274 ) ( ON ?auto_162275 ?auto_162274 ) ( ON ?auto_162276 ?auto_162275 ) ( not ( = ?auto_162274 ?auto_162275 ) ) ( not ( = ?auto_162274 ?auto_162276 ) ) ( not ( = ?auto_162274 ?auto_162277 ) ) ( not ( = ?auto_162274 ?auto_162278 ) ) ( not ( = ?auto_162275 ?auto_162276 ) ) ( not ( = ?auto_162275 ?auto_162277 ) ) ( not ( = ?auto_162275 ?auto_162278 ) ) ( not ( = ?auto_162276 ?auto_162277 ) ) ( not ( = ?auto_162276 ?auto_162278 ) ) ( not ( = ?auto_162277 ?auto_162278 ) ) ( ON ?auto_162278 ?auto_162279 ) ( CLEAR ?auto_162278 ) ( not ( = ?auto_162274 ?auto_162279 ) ) ( not ( = ?auto_162275 ?auto_162279 ) ) ( not ( = ?auto_162276 ?auto_162279 ) ) ( not ( = ?auto_162277 ?auto_162279 ) ) ( not ( = ?auto_162278 ?auto_162279 ) ) ( HOLDING ?auto_162277 ) ( CLEAR ?auto_162276 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162274 ?auto_162275 ?auto_162276 ?auto_162277 )
      ( MAKE-5PILE ?auto_162274 ?auto_162275 ?auto_162276 ?auto_162277 ?auto_162278 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162280 - BLOCK
      ?auto_162281 - BLOCK
      ?auto_162282 - BLOCK
      ?auto_162283 - BLOCK
      ?auto_162284 - BLOCK
    )
    :vars
    (
      ?auto_162285 - BLOCK
      ?auto_162287 - BLOCK
      ?auto_162288 - BLOCK
      ?auto_162286 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162280 ) ( ON ?auto_162281 ?auto_162280 ) ( ON ?auto_162282 ?auto_162281 ) ( not ( = ?auto_162280 ?auto_162281 ) ) ( not ( = ?auto_162280 ?auto_162282 ) ) ( not ( = ?auto_162280 ?auto_162283 ) ) ( not ( = ?auto_162280 ?auto_162284 ) ) ( not ( = ?auto_162281 ?auto_162282 ) ) ( not ( = ?auto_162281 ?auto_162283 ) ) ( not ( = ?auto_162281 ?auto_162284 ) ) ( not ( = ?auto_162282 ?auto_162283 ) ) ( not ( = ?auto_162282 ?auto_162284 ) ) ( not ( = ?auto_162283 ?auto_162284 ) ) ( ON ?auto_162284 ?auto_162285 ) ( not ( = ?auto_162280 ?auto_162285 ) ) ( not ( = ?auto_162281 ?auto_162285 ) ) ( not ( = ?auto_162282 ?auto_162285 ) ) ( not ( = ?auto_162283 ?auto_162285 ) ) ( not ( = ?auto_162284 ?auto_162285 ) ) ( CLEAR ?auto_162282 ) ( ON ?auto_162283 ?auto_162284 ) ( CLEAR ?auto_162283 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162287 ) ( ON ?auto_162288 ?auto_162287 ) ( ON ?auto_162286 ?auto_162288 ) ( ON ?auto_162285 ?auto_162286 ) ( not ( = ?auto_162287 ?auto_162288 ) ) ( not ( = ?auto_162287 ?auto_162286 ) ) ( not ( = ?auto_162287 ?auto_162285 ) ) ( not ( = ?auto_162287 ?auto_162284 ) ) ( not ( = ?auto_162287 ?auto_162283 ) ) ( not ( = ?auto_162288 ?auto_162286 ) ) ( not ( = ?auto_162288 ?auto_162285 ) ) ( not ( = ?auto_162288 ?auto_162284 ) ) ( not ( = ?auto_162288 ?auto_162283 ) ) ( not ( = ?auto_162286 ?auto_162285 ) ) ( not ( = ?auto_162286 ?auto_162284 ) ) ( not ( = ?auto_162286 ?auto_162283 ) ) ( not ( = ?auto_162280 ?auto_162287 ) ) ( not ( = ?auto_162280 ?auto_162288 ) ) ( not ( = ?auto_162280 ?auto_162286 ) ) ( not ( = ?auto_162281 ?auto_162287 ) ) ( not ( = ?auto_162281 ?auto_162288 ) ) ( not ( = ?auto_162281 ?auto_162286 ) ) ( not ( = ?auto_162282 ?auto_162287 ) ) ( not ( = ?auto_162282 ?auto_162288 ) ) ( not ( = ?auto_162282 ?auto_162286 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162287 ?auto_162288 ?auto_162286 ?auto_162285 ?auto_162284 )
      ( MAKE-5PILE ?auto_162280 ?auto_162281 ?auto_162282 ?auto_162283 ?auto_162284 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162289 - BLOCK
      ?auto_162290 - BLOCK
      ?auto_162291 - BLOCK
      ?auto_162292 - BLOCK
      ?auto_162293 - BLOCK
    )
    :vars
    (
      ?auto_162294 - BLOCK
      ?auto_162296 - BLOCK
      ?auto_162297 - BLOCK
      ?auto_162295 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162289 ) ( ON ?auto_162290 ?auto_162289 ) ( not ( = ?auto_162289 ?auto_162290 ) ) ( not ( = ?auto_162289 ?auto_162291 ) ) ( not ( = ?auto_162289 ?auto_162292 ) ) ( not ( = ?auto_162289 ?auto_162293 ) ) ( not ( = ?auto_162290 ?auto_162291 ) ) ( not ( = ?auto_162290 ?auto_162292 ) ) ( not ( = ?auto_162290 ?auto_162293 ) ) ( not ( = ?auto_162291 ?auto_162292 ) ) ( not ( = ?auto_162291 ?auto_162293 ) ) ( not ( = ?auto_162292 ?auto_162293 ) ) ( ON ?auto_162293 ?auto_162294 ) ( not ( = ?auto_162289 ?auto_162294 ) ) ( not ( = ?auto_162290 ?auto_162294 ) ) ( not ( = ?auto_162291 ?auto_162294 ) ) ( not ( = ?auto_162292 ?auto_162294 ) ) ( not ( = ?auto_162293 ?auto_162294 ) ) ( ON ?auto_162292 ?auto_162293 ) ( CLEAR ?auto_162292 ) ( ON-TABLE ?auto_162296 ) ( ON ?auto_162297 ?auto_162296 ) ( ON ?auto_162295 ?auto_162297 ) ( ON ?auto_162294 ?auto_162295 ) ( not ( = ?auto_162296 ?auto_162297 ) ) ( not ( = ?auto_162296 ?auto_162295 ) ) ( not ( = ?auto_162296 ?auto_162294 ) ) ( not ( = ?auto_162296 ?auto_162293 ) ) ( not ( = ?auto_162296 ?auto_162292 ) ) ( not ( = ?auto_162297 ?auto_162295 ) ) ( not ( = ?auto_162297 ?auto_162294 ) ) ( not ( = ?auto_162297 ?auto_162293 ) ) ( not ( = ?auto_162297 ?auto_162292 ) ) ( not ( = ?auto_162295 ?auto_162294 ) ) ( not ( = ?auto_162295 ?auto_162293 ) ) ( not ( = ?auto_162295 ?auto_162292 ) ) ( not ( = ?auto_162289 ?auto_162296 ) ) ( not ( = ?auto_162289 ?auto_162297 ) ) ( not ( = ?auto_162289 ?auto_162295 ) ) ( not ( = ?auto_162290 ?auto_162296 ) ) ( not ( = ?auto_162290 ?auto_162297 ) ) ( not ( = ?auto_162290 ?auto_162295 ) ) ( not ( = ?auto_162291 ?auto_162296 ) ) ( not ( = ?auto_162291 ?auto_162297 ) ) ( not ( = ?auto_162291 ?auto_162295 ) ) ( HOLDING ?auto_162291 ) ( CLEAR ?auto_162290 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162289 ?auto_162290 ?auto_162291 )
      ( MAKE-5PILE ?auto_162289 ?auto_162290 ?auto_162291 ?auto_162292 ?auto_162293 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162298 - BLOCK
      ?auto_162299 - BLOCK
      ?auto_162300 - BLOCK
      ?auto_162301 - BLOCK
      ?auto_162302 - BLOCK
    )
    :vars
    (
      ?auto_162306 - BLOCK
      ?auto_162305 - BLOCK
      ?auto_162303 - BLOCK
      ?auto_162304 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162298 ) ( ON ?auto_162299 ?auto_162298 ) ( not ( = ?auto_162298 ?auto_162299 ) ) ( not ( = ?auto_162298 ?auto_162300 ) ) ( not ( = ?auto_162298 ?auto_162301 ) ) ( not ( = ?auto_162298 ?auto_162302 ) ) ( not ( = ?auto_162299 ?auto_162300 ) ) ( not ( = ?auto_162299 ?auto_162301 ) ) ( not ( = ?auto_162299 ?auto_162302 ) ) ( not ( = ?auto_162300 ?auto_162301 ) ) ( not ( = ?auto_162300 ?auto_162302 ) ) ( not ( = ?auto_162301 ?auto_162302 ) ) ( ON ?auto_162302 ?auto_162306 ) ( not ( = ?auto_162298 ?auto_162306 ) ) ( not ( = ?auto_162299 ?auto_162306 ) ) ( not ( = ?auto_162300 ?auto_162306 ) ) ( not ( = ?auto_162301 ?auto_162306 ) ) ( not ( = ?auto_162302 ?auto_162306 ) ) ( ON ?auto_162301 ?auto_162302 ) ( ON-TABLE ?auto_162305 ) ( ON ?auto_162303 ?auto_162305 ) ( ON ?auto_162304 ?auto_162303 ) ( ON ?auto_162306 ?auto_162304 ) ( not ( = ?auto_162305 ?auto_162303 ) ) ( not ( = ?auto_162305 ?auto_162304 ) ) ( not ( = ?auto_162305 ?auto_162306 ) ) ( not ( = ?auto_162305 ?auto_162302 ) ) ( not ( = ?auto_162305 ?auto_162301 ) ) ( not ( = ?auto_162303 ?auto_162304 ) ) ( not ( = ?auto_162303 ?auto_162306 ) ) ( not ( = ?auto_162303 ?auto_162302 ) ) ( not ( = ?auto_162303 ?auto_162301 ) ) ( not ( = ?auto_162304 ?auto_162306 ) ) ( not ( = ?auto_162304 ?auto_162302 ) ) ( not ( = ?auto_162304 ?auto_162301 ) ) ( not ( = ?auto_162298 ?auto_162305 ) ) ( not ( = ?auto_162298 ?auto_162303 ) ) ( not ( = ?auto_162298 ?auto_162304 ) ) ( not ( = ?auto_162299 ?auto_162305 ) ) ( not ( = ?auto_162299 ?auto_162303 ) ) ( not ( = ?auto_162299 ?auto_162304 ) ) ( not ( = ?auto_162300 ?auto_162305 ) ) ( not ( = ?auto_162300 ?auto_162303 ) ) ( not ( = ?auto_162300 ?auto_162304 ) ) ( CLEAR ?auto_162299 ) ( ON ?auto_162300 ?auto_162301 ) ( CLEAR ?auto_162300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162305 ?auto_162303 ?auto_162304 ?auto_162306 ?auto_162302 ?auto_162301 )
      ( MAKE-5PILE ?auto_162298 ?auto_162299 ?auto_162300 ?auto_162301 ?auto_162302 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162307 - BLOCK
      ?auto_162308 - BLOCK
      ?auto_162309 - BLOCK
      ?auto_162310 - BLOCK
      ?auto_162311 - BLOCK
    )
    :vars
    (
      ?auto_162315 - BLOCK
      ?auto_162314 - BLOCK
      ?auto_162312 - BLOCK
      ?auto_162313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162307 ) ( not ( = ?auto_162307 ?auto_162308 ) ) ( not ( = ?auto_162307 ?auto_162309 ) ) ( not ( = ?auto_162307 ?auto_162310 ) ) ( not ( = ?auto_162307 ?auto_162311 ) ) ( not ( = ?auto_162308 ?auto_162309 ) ) ( not ( = ?auto_162308 ?auto_162310 ) ) ( not ( = ?auto_162308 ?auto_162311 ) ) ( not ( = ?auto_162309 ?auto_162310 ) ) ( not ( = ?auto_162309 ?auto_162311 ) ) ( not ( = ?auto_162310 ?auto_162311 ) ) ( ON ?auto_162311 ?auto_162315 ) ( not ( = ?auto_162307 ?auto_162315 ) ) ( not ( = ?auto_162308 ?auto_162315 ) ) ( not ( = ?auto_162309 ?auto_162315 ) ) ( not ( = ?auto_162310 ?auto_162315 ) ) ( not ( = ?auto_162311 ?auto_162315 ) ) ( ON ?auto_162310 ?auto_162311 ) ( ON-TABLE ?auto_162314 ) ( ON ?auto_162312 ?auto_162314 ) ( ON ?auto_162313 ?auto_162312 ) ( ON ?auto_162315 ?auto_162313 ) ( not ( = ?auto_162314 ?auto_162312 ) ) ( not ( = ?auto_162314 ?auto_162313 ) ) ( not ( = ?auto_162314 ?auto_162315 ) ) ( not ( = ?auto_162314 ?auto_162311 ) ) ( not ( = ?auto_162314 ?auto_162310 ) ) ( not ( = ?auto_162312 ?auto_162313 ) ) ( not ( = ?auto_162312 ?auto_162315 ) ) ( not ( = ?auto_162312 ?auto_162311 ) ) ( not ( = ?auto_162312 ?auto_162310 ) ) ( not ( = ?auto_162313 ?auto_162315 ) ) ( not ( = ?auto_162313 ?auto_162311 ) ) ( not ( = ?auto_162313 ?auto_162310 ) ) ( not ( = ?auto_162307 ?auto_162314 ) ) ( not ( = ?auto_162307 ?auto_162312 ) ) ( not ( = ?auto_162307 ?auto_162313 ) ) ( not ( = ?auto_162308 ?auto_162314 ) ) ( not ( = ?auto_162308 ?auto_162312 ) ) ( not ( = ?auto_162308 ?auto_162313 ) ) ( not ( = ?auto_162309 ?auto_162314 ) ) ( not ( = ?auto_162309 ?auto_162312 ) ) ( not ( = ?auto_162309 ?auto_162313 ) ) ( ON ?auto_162309 ?auto_162310 ) ( CLEAR ?auto_162309 ) ( HOLDING ?auto_162308 ) ( CLEAR ?auto_162307 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162307 ?auto_162308 )
      ( MAKE-5PILE ?auto_162307 ?auto_162308 ?auto_162309 ?auto_162310 ?auto_162311 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162316 - BLOCK
      ?auto_162317 - BLOCK
      ?auto_162318 - BLOCK
      ?auto_162319 - BLOCK
      ?auto_162320 - BLOCK
    )
    :vars
    (
      ?auto_162324 - BLOCK
      ?auto_162322 - BLOCK
      ?auto_162321 - BLOCK
      ?auto_162323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162316 ) ( not ( = ?auto_162316 ?auto_162317 ) ) ( not ( = ?auto_162316 ?auto_162318 ) ) ( not ( = ?auto_162316 ?auto_162319 ) ) ( not ( = ?auto_162316 ?auto_162320 ) ) ( not ( = ?auto_162317 ?auto_162318 ) ) ( not ( = ?auto_162317 ?auto_162319 ) ) ( not ( = ?auto_162317 ?auto_162320 ) ) ( not ( = ?auto_162318 ?auto_162319 ) ) ( not ( = ?auto_162318 ?auto_162320 ) ) ( not ( = ?auto_162319 ?auto_162320 ) ) ( ON ?auto_162320 ?auto_162324 ) ( not ( = ?auto_162316 ?auto_162324 ) ) ( not ( = ?auto_162317 ?auto_162324 ) ) ( not ( = ?auto_162318 ?auto_162324 ) ) ( not ( = ?auto_162319 ?auto_162324 ) ) ( not ( = ?auto_162320 ?auto_162324 ) ) ( ON ?auto_162319 ?auto_162320 ) ( ON-TABLE ?auto_162322 ) ( ON ?auto_162321 ?auto_162322 ) ( ON ?auto_162323 ?auto_162321 ) ( ON ?auto_162324 ?auto_162323 ) ( not ( = ?auto_162322 ?auto_162321 ) ) ( not ( = ?auto_162322 ?auto_162323 ) ) ( not ( = ?auto_162322 ?auto_162324 ) ) ( not ( = ?auto_162322 ?auto_162320 ) ) ( not ( = ?auto_162322 ?auto_162319 ) ) ( not ( = ?auto_162321 ?auto_162323 ) ) ( not ( = ?auto_162321 ?auto_162324 ) ) ( not ( = ?auto_162321 ?auto_162320 ) ) ( not ( = ?auto_162321 ?auto_162319 ) ) ( not ( = ?auto_162323 ?auto_162324 ) ) ( not ( = ?auto_162323 ?auto_162320 ) ) ( not ( = ?auto_162323 ?auto_162319 ) ) ( not ( = ?auto_162316 ?auto_162322 ) ) ( not ( = ?auto_162316 ?auto_162321 ) ) ( not ( = ?auto_162316 ?auto_162323 ) ) ( not ( = ?auto_162317 ?auto_162322 ) ) ( not ( = ?auto_162317 ?auto_162321 ) ) ( not ( = ?auto_162317 ?auto_162323 ) ) ( not ( = ?auto_162318 ?auto_162322 ) ) ( not ( = ?auto_162318 ?auto_162321 ) ) ( not ( = ?auto_162318 ?auto_162323 ) ) ( ON ?auto_162318 ?auto_162319 ) ( CLEAR ?auto_162316 ) ( ON ?auto_162317 ?auto_162318 ) ( CLEAR ?auto_162317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162322 ?auto_162321 ?auto_162323 ?auto_162324 ?auto_162320 ?auto_162319 ?auto_162318 )
      ( MAKE-5PILE ?auto_162316 ?auto_162317 ?auto_162318 ?auto_162319 ?auto_162320 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162325 - BLOCK
      ?auto_162326 - BLOCK
      ?auto_162327 - BLOCK
      ?auto_162328 - BLOCK
      ?auto_162329 - BLOCK
    )
    :vars
    (
      ?auto_162332 - BLOCK
      ?auto_162333 - BLOCK
      ?auto_162330 - BLOCK
      ?auto_162331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162325 ?auto_162326 ) ) ( not ( = ?auto_162325 ?auto_162327 ) ) ( not ( = ?auto_162325 ?auto_162328 ) ) ( not ( = ?auto_162325 ?auto_162329 ) ) ( not ( = ?auto_162326 ?auto_162327 ) ) ( not ( = ?auto_162326 ?auto_162328 ) ) ( not ( = ?auto_162326 ?auto_162329 ) ) ( not ( = ?auto_162327 ?auto_162328 ) ) ( not ( = ?auto_162327 ?auto_162329 ) ) ( not ( = ?auto_162328 ?auto_162329 ) ) ( ON ?auto_162329 ?auto_162332 ) ( not ( = ?auto_162325 ?auto_162332 ) ) ( not ( = ?auto_162326 ?auto_162332 ) ) ( not ( = ?auto_162327 ?auto_162332 ) ) ( not ( = ?auto_162328 ?auto_162332 ) ) ( not ( = ?auto_162329 ?auto_162332 ) ) ( ON ?auto_162328 ?auto_162329 ) ( ON-TABLE ?auto_162333 ) ( ON ?auto_162330 ?auto_162333 ) ( ON ?auto_162331 ?auto_162330 ) ( ON ?auto_162332 ?auto_162331 ) ( not ( = ?auto_162333 ?auto_162330 ) ) ( not ( = ?auto_162333 ?auto_162331 ) ) ( not ( = ?auto_162333 ?auto_162332 ) ) ( not ( = ?auto_162333 ?auto_162329 ) ) ( not ( = ?auto_162333 ?auto_162328 ) ) ( not ( = ?auto_162330 ?auto_162331 ) ) ( not ( = ?auto_162330 ?auto_162332 ) ) ( not ( = ?auto_162330 ?auto_162329 ) ) ( not ( = ?auto_162330 ?auto_162328 ) ) ( not ( = ?auto_162331 ?auto_162332 ) ) ( not ( = ?auto_162331 ?auto_162329 ) ) ( not ( = ?auto_162331 ?auto_162328 ) ) ( not ( = ?auto_162325 ?auto_162333 ) ) ( not ( = ?auto_162325 ?auto_162330 ) ) ( not ( = ?auto_162325 ?auto_162331 ) ) ( not ( = ?auto_162326 ?auto_162333 ) ) ( not ( = ?auto_162326 ?auto_162330 ) ) ( not ( = ?auto_162326 ?auto_162331 ) ) ( not ( = ?auto_162327 ?auto_162333 ) ) ( not ( = ?auto_162327 ?auto_162330 ) ) ( not ( = ?auto_162327 ?auto_162331 ) ) ( ON ?auto_162327 ?auto_162328 ) ( ON ?auto_162326 ?auto_162327 ) ( CLEAR ?auto_162326 ) ( HOLDING ?auto_162325 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162325 )
      ( MAKE-5PILE ?auto_162325 ?auto_162326 ?auto_162327 ?auto_162328 ?auto_162329 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162334 - BLOCK
      ?auto_162335 - BLOCK
      ?auto_162336 - BLOCK
      ?auto_162337 - BLOCK
      ?auto_162338 - BLOCK
    )
    :vars
    (
      ?auto_162341 - BLOCK
      ?auto_162342 - BLOCK
      ?auto_162339 - BLOCK
      ?auto_162340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162334 ?auto_162335 ) ) ( not ( = ?auto_162334 ?auto_162336 ) ) ( not ( = ?auto_162334 ?auto_162337 ) ) ( not ( = ?auto_162334 ?auto_162338 ) ) ( not ( = ?auto_162335 ?auto_162336 ) ) ( not ( = ?auto_162335 ?auto_162337 ) ) ( not ( = ?auto_162335 ?auto_162338 ) ) ( not ( = ?auto_162336 ?auto_162337 ) ) ( not ( = ?auto_162336 ?auto_162338 ) ) ( not ( = ?auto_162337 ?auto_162338 ) ) ( ON ?auto_162338 ?auto_162341 ) ( not ( = ?auto_162334 ?auto_162341 ) ) ( not ( = ?auto_162335 ?auto_162341 ) ) ( not ( = ?auto_162336 ?auto_162341 ) ) ( not ( = ?auto_162337 ?auto_162341 ) ) ( not ( = ?auto_162338 ?auto_162341 ) ) ( ON ?auto_162337 ?auto_162338 ) ( ON-TABLE ?auto_162342 ) ( ON ?auto_162339 ?auto_162342 ) ( ON ?auto_162340 ?auto_162339 ) ( ON ?auto_162341 ?auto_162340 ) ( not ( = ?auto_162342 ?auto_162339 ) ) ( not ( = ?auto_162342 ?auto_162340 ) ) ( not ( = ?auto_162342 ?auto_162341 ) ) ( not ( = ?auto_162342 ?auto_162338 ) ) ( not ( = ?auto_162342 ?auto_162337 ) ) ( not ( = ?auto_162339 ?auto_162340 ) ) ( not ( = ?auto_162339 ?auto_162341 ) ) ( not ( = ?auto_162339 ?auto_162338 ) ) ( not ( = ?auto_162339 ?auto_162337 ) ) ( not ( = ?auto_162340 ?auto_162341 ) ) ( not ( = ?auto_162340 ?auto_162338 ) ) ( not ( = ?auto_162340 ?auto_162337 ) ) ( not ( = ?auto_162334 ?auto_162342 ) ) ( not ( = ?auto_162334 ?auto_162339 ) ) ( not ( = ?auto_162334 ?auto_162340 ) ) ( not ( = ?auto_162335 ?auto_162342 ) ) ( not ( = ?auto_162335 ?auto_162339 ) ) ( not ( = ?auto_162335 ?auto_162340 ) ) ( not ( = ?auto_162336 ?auto_162342 ) ) ( not ( = ?auto_162336 ?auto_162339 ) ) ( not ( = ?auto_162336 ?auto_162340 ) ) ( ON ?auto_162336 ?auto_162337 ) ( ON ?auto_162335 ?auto_162336 ) ( ON ?auto_162334 ?auto_162335 ) ( CLEAR ?auto_162334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162342 ?auto_162339 ?auto_162340 ?auto_162341 ?auto_162338 ?auto_162337 ?auto_162336 ?auto_162335 )
      ( MAKE-5PILE ?auto_162334 ?auto_162335 ?auto_162336 ?auto_162337 ?auto_162338 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162346 - BLOCK
      ?auto_162347 - BLOCK
      ?auto_162348 - BLOCK
    )
    :vars
    (
      ?auto_162349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162349 ?auto_162348 ) ( CLEAR ?auto_162349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162346 ) ( ON ?auto_162347 ?auto_162346 ) ( ON ?auto_162348 ?auto_162347 ) ( not ( = ?auto_162346 ?auto_162347 ) ) ( not ( = ?auto_162346 ?auto_162348 ) ) ( not ( = ?auto_162346 ?auto_162349 ) ) ( not ( = ?auto_162347 ?auto_162348 ) ) ( not ( = ?auto_162347 ?auto_162349 ) ) ( not ( = ?auto_162348 ?auto_162349 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162349 ?auto_162348 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162350 - BLOCK
      ?auto_162351 - BLOCK
      ?auto_162352 - BLOCK
    )
    :vars
    (
      ?auto_162353 - BLOCK
      ?auto_162354 - BLOCK
      ?auto_162355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162353 ?auto_162352 ) ( CLEAR ?auto_162353 ) ( ON-TABLE ?auto_162350 ) ( ON ?auto_162351 ?auto_162350 ) ( ON ?auto_162352 ?auto_162351 ) ( not ( = ?auto_162350 ?auto_162351 ) ) ( not ( = ?auto_162350 ?auto_162352 ) ) ( not ( = ?auto_162350 ?auto_162353 ) ) ( not ( = ?auto_162351 ?auto_162352 ) ) ( not ( = ?auto_162351 ?auto_162353 ) ) ( not ( = ?auto_162352 ?auto_162353 ) ) ( HOLDING ?auto_162354 ) ( CLEAR ?auto_162355 ) ( not ( = ?auto_162350 ?auto_162354 ) ) ( not ( = ?auto_162350 ?auto_162355 ) ) ( not ( = ?auto_162351 ?auto_162354 ) ) ( not ( = ?auto_162351 ?auto_162355 ) ) ( not ( = ?auto_162352 ?auto_162354 ) ) ( not ( = ?auto_162352 ?auto_162355 ) ) ( not ( = ?auto_162353 ?auto_162354 ) ) ( not ( = ?auto_162353 ?auto_162355 ) ) ( not ( = ?auto_162354 ?auto_162355 ) ) )
    :subtasks
    ( ( !STACK ?auto_162354 ?auto_162355 )
      ( MAKE-3PILE ?auto_162350 ?auto_162351 ?auto_162352 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162356 - BLOCK
      ?auto_162357 - BLOCK
      ?auto_162358 - BLOCK
    )
    :vars
    (
      ?auto_162359 - BLOCK
      ?auto_162361 - BLOCK
      ?auto_162360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162359 ?auto_162358 ) ( ON-TABLE ?auto_162356 ) ( ON ?auto_162357 ?auto_162356 ) ( ON ?auto_162358 ?auto_162357 ) ( not ( = ?auto_162356 ?auto_162357 ) ) ( not ( = ?auto_162356 ?auto_162358 ) ) ( not ( = ?auto_162356 ?auto_162359 ) ) ( not ( = ?auto_162357 ?auto_162358 ) ) ( not ( = ?auto_162357 ?auto_162359 ) ) ( not ( = ?auto_162358 ?auto_162359 ) ) ( CLEAR ?auto_162361 ) ( not ( = ?auto_162356 ?auto_162360 ) ) ( not ( = ?auto_162356 ?auto_162361 ) ) ( not ( = ?auto_162357 ?auto_162360 ) ) ( not ( = ?auto_162357 ?auto_162361 ) ) ( not ( = ?auto_162358 ?auto_162360 ) ) ( not ( = ?auto_162358 ?auto_162361 ) ) ( not ( = ?auto_162359 ?auto_162360 ) ) ( not ( = ?auto_162359 ?auto_162361 ) ) ( not ( = ?auto_162360 ?auto_162361 ) ) ( ON ?auto_162360 ?auto_162359 ) ( CLEAR ?auto_162360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162356 ?auto_162357 ?auto_162358 ?auto_162359 )
      ( MAKE-3PILE ?auto_162356 ?auto_162357 ?auto_162358 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162362 - BLOCK
      ?auto_162363 - BLOCK
      ?auto_162364 - BLOCK
    )
    :vars
    (
      ?auto_162365 - BLOCK
      ?auto_162366 - BLOCK
      ?auto_162367 - BLOCK
      ?auto_162369 - BLOCK
      ?auto_162370 - BLOCK
      ?auto_162368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162365 ?auto_162364 ) ( ON-TABLE ?auto_162362 ) ( ON ?auto_162363 ?auto_162362 ) ( ON ?auto_162364 ?auto_162363 ) ( not ( = ?auto_162362 ?auto_162363 ) ) ( not ( = ?auto_162362 ?auto_162364 ) ) ( not ( = ?auto_162362 ?auto_162365 ) ) ( not ( = ?auto_162363 ?auto_162364 ) ) ( not ( = ?auto_162363 ?auto_162365 ) ) ( not ( = ?auto_162364 ?auto_162365 ) ) ( not ( = ?auto_162362 ?auto_162366 ) ) ( not ( = ?auto_162362 ?auto_162367 ) ) ( not ( = ?auto_162363 ?auto_162366 ) ) ( not ( = ?auto_162363 ?auto_162367 ) ) ( not ( = ?auto_162364 ?auto_162366 ) ) ( not ( = ?auto_162364 ?auto_162367 ) ) ( not ( = ?auto_162365 ?auto_162366 ) ) ( not ( = ?auto_162365 ?auto_162367 ) ) ( not ( = ?auto_162366 ?auto_162367 ) ) ( ON ?auto_162366 ?auto_162365 ) ( CLEAR ?auto_162366 ) ( HOLDING ?auto_162367 ) ( CLEAR ?auto_162369 ) ( ON-TABLE ?auto_162370 ) ( ON ?auto_162368 ?auto_162370 ) ( ON ?auto_162369 ?auto_162368 ) ( not ( = ?auto_162370 ?auto_162368 ) ) ( not ( = ?auto_162370 ?auto_162369 ) ) ( not ( = ?auto_162370 ?auto_162367 ) ) ( not ( = ?auto_162368 ?auto_162369 ) ) ( not ( = ?auto_162368 ?auto_162367 ) ) ( not ( = ?auto_162369 ?auto_162367 ) ) ( not ( = ?auto_162362 ?auto_162369 ) ) ( not ( = ?auto_162362 ?auto_162370 ) ) ( not ( = ?auto_162362 ?auto_162368 ) ) ( not ( = ?auto_162363 ?auto_162369 ) ) ( not ( = ?auto_162363 ?auto_162370 ) ) ( not ( = ?auto_162363 ?auto_162368 ) ) ( not ( = ?auto_162364 ?auto_162369 ) ) ( not ( = ?auto_162364 ?auto_162370 ) ) ( not ( = ?auto_162364 ?auto_162368 ) ) ( not ( = ?auto_162365 ?auto_162369 ) ) ( not ( = ?auto_162365 ?auto_162370 ) ) ( not ( = ?auto_162365 ?auto_162368 ) ) ( not ( = ?auto_162366 ?auto_162369 ) ) ( not ( = ?auto_162366 ?auto_162370 ) ) ( not ( = ?auto_162366 ?auto_162368 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162370 ?auto_162368 ?auto_162369 ?auto_162367 )
      ( MAKE-3PILE ?auto_162362 ?auto_162363 ?auto_162364 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162371 - BLOCK
      ?auto_162372 - BLOCK
      ?auto_162373 - BLOCK
    )
    :vars
    (
      ?auto_162375 - BLOCK
      ?auto_162379 - BLOCK
      ?auto_162378 - BLOCK
      ?auto_162374 - BLOCK
      ?auto_162377 - BLOCK
      ?auto_162376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162375 ?auto_162373 ) ( ON-TABLE ?auto_162371 ) ( ON ?auto_162372 ?auto_162371 ) ( ON ?auto_162373 ?auto_162372 ) ( not ( = ?auto_162371 ?auto_162372 ) ) ( not ( = ?auto_162371 ?auto_162373 ) ) ( not ( = ?auto_162371 ?auto_162375 ) ) ( not ( = ?auto_162372 ?auto_162373 ) ) ( not ( = ?auto_162372 ?auto_162375 ) ) ( not ( = ?auto_162373 ?auto_162375 ) ) ( not ( = ?auto_162371 ?auto_162379 ) ) ( not ( = ?auto_162371 ?auto_162378 ) ) ( not ( = ?auto_162372 ?auto_162379 ) ) ( not ( = ?auto_162372 ?auto_162378 ) ) ( not ( = ?auto_162373 ?auto_162379 ) ) ( not ( = ?auto_162373 ?auto_162378 ) ) ( not ( = ?auto_162375 ?auto_162379 ) ) ( not ( = ?auto_162375 ?auto_162378 ) ) ( not ( = ?auto_162379 ?auto_162378 ) ) ( ON ?auto_162379 ?auto_162375 ) ( CLEAR ?auto_162374 ) ( ON-TABLE ?auto_162377 ) ( ON ?auto_162376 ?auto_162377 ) ( ON ?auto_162374 ?auto_162376 ) ( not ( = ?auto_162377 ?auto_162376 ) ) ( not ( = ?auto_162377 ?auto_162374 ) ) ( not ( = ?auto_162377 ?auto_162378 ) ) ( not ( = ?auto_162376 ?auto_162374 ) ) ( not ( = ?auto_162376 ?auto_162378 ) ) ( not ( = ?auto_162374 ?auto_162378 ) ) ( not ( = ?auto_162371 ?auto_162374 ) ) ( not ( = ?auto_162371 ?auto_162377 ) ) ( not ( = ?auto_162371 ?auto_162376 ) ) ( not ( = ?auto_162372 ?auto_162374 ) ) ( not ( = ?auto_162372 ?auto_162377 ) ) ( not ( = ?auto_162372 ?auto_162376 ) ) ( not ( = ?auto_162373 ?auto_162374 ) ) ( not ( = ?auto_162373 ?auto_162377 ) ) ( not ( = ?auto_162373 ?auto_162376 ) ) ( not ( = ?auto_162375 ?auto_162374 ) ) ( not ( = ?auto_162375 ?auto_162377 ) ) ( not ( = ?auto_162375 ?auto_162376 ) ) ( not ( = ?auto_162379 ?auto_162374 ) ) ( not ( = ?auto_162379 ?auto_162377 ) ) ( not ( = ?auto_162379 ?auto_162376 ) ) ( ON ?auto_162378 ?auto_162379 ) ( CLEAR ?auto_162378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162371 ?auto_162372 ?auto_162373 ?auto_162375 ?auto_162379 )
      ( MAKE-3PILE ?auto_162371 ?auto_162372 ?auto_162373 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162380 - BLOCK
      ?auto_162381 - BLOCK
      ?auto_162382 - BLOCK
    )
    :vars
    (
      ?auto_162384 - BLOCK
      ?auto_162385 - BLOCK
      ?auto_162383 - BLOCK
      ?auto_162387 - BLOCK
      ?auto_162386 - BLOCK
      ?auto_162388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162384 ?auto_162382 ) ( ON-TABLE ?auto_162380 ) ( ON ?auto_162381 ?auto_162380 ) ( ON ?auto_162382 ?auto_162381 ) ( not ( = ?auto_162380 ?auto_162381 ) ) ( not ( = ?auto_162380 ?auto_162382 ) ) ( not ( = ?auto_162380 ?auto_162384 ) ) ( not ( = ?auto_162381 ?auto_162382 ) ) ( not ( = ?auto_162381 ?auto_162384 ) ) ( not ( = ?auto_162382 ?auto_162384 ) ) ( not ( = ?auto_162380 ?auto_162385 ) ) ( not ( = ?auto_162380 ?auto_162383 ) ) ( not ( = ?auto_162381 ?auto_162385 ) ) ( not ( = ?auto_162381 ?auto_162383 ) ) ( not ( = ?auto_162382 ?auto_162385 ) ) ( not ( = ?auto_162382 ?auto_162383 ) ) ( not ( = ?auto_162384 ?auto_162385 ) ) ( not ( = ?auto_162384 ?auto_162383 ) ) ( not ( = ?auto_162385 ?auto_162383 ) ) ( ON ?auto_162385 ?auto_162384 ) ( ON-TABLE ?auto_162387 ) ( ON ?auto_162386 ?auto_162387 ) ( not ( = ?auto_162387 ?auto_162386 ) ) ( not ( = ?auto_162387 ?auto_162388 ) ) ( not ( = ?auto_162387 ?auto_162383 ) ) ( not ( = ?auto_162386 ?auto_162388 ) ) ( not ( = ?auto_162386 ?auto_162383 ) ) ( not ( = ?auto_162388 ?auto_162383 ) ) ( not ( = ?auto_162380 ?auto_162388 ) ) ( not ( = ?auto_162380 ?auto_162387 ) ) ( not ( = ?auto_162380 ?auto_162386 ) ) ( not ( = ?auto_162381 ?auto_162388 ) ) ( not ( = ?auto_162381 ?auto_162387 ) ) ( not ( = ?auto_162381 ?auto_162386 ) ) ( not ( = ?auto_162382 ?auto_162388 ) ) ( not ( = ?auto_162382 ?auto_162387 ) ) ( not ( = ?auto_162382 ?auto_162386 ) ) ( not ( = ?auto_162384 ?auto_162388 ) ) ( not ( = ?auto_162384 ?auto_162387 ) ) ( not ( = ?auto_162384 ?auto_162386 ) ) ( not ( = ?auto_162385 ?auto_162388 ) ) ( not ( = ?auto_162385 ?auto_162387 ) ) ( not ( = ?auto_162385 ?auto_162386 ) ) ( ON ?auto_162383 ?auto_162385 ) ( CLEAR ?auto_162383 ) ( HOLDING ?auto_162388 ) ( CLEAR ?auto_162386 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162387 ?auto_162386 ?auto_162388 )
      ( MAKE-3PILE ?auto_162380 ?auto_162381 ?auto_162382 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162389 - BLOCK
      ?auto_162390 - BLOCK
      ?auto_162391 - BLOCK
    )
    :vars
    (
      ?auto_162392 - BLOCK
      ?auto_162394 - BLOCK
      ?auto_162397 - BLOCK
      ?auto_162395 - BLOCK
      ?auto_162393 - BLOCK
      ?auto_162396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162392 ?auto_162391 ) ( ON-TABLE ?auto_162389 ) ( ON ?auto_162390 ?auto_162389 ) ( ON ?auto_162391 ?auto_162390 ) ( not ( = ?auto_162389 ?auto_162390 ) ) ( not ( = ?auto_162389 ?auto_162391 ) ) ( not ( = ?auto_162389 ?auto_162392 ) ) ( not ( = ?auto_162390 ?auto_162391 ) ) ( not ( = ?auto_162390 ?auto_162392 ) ) ( not ( = ?auto_162391 ?auto_162392 ) ) ( not ( = ?auto_162389 ?auto_162394 ) ) ( not ( = ?auto_162389 ?auto_162397 ) ) ( not ( = ?auto_162390 ?auto_162394 ) ) ( not ( = ?auto_162390 ?auto_162397 ) ) ( not ( = ?auto_162391 ?auto_162394 ) ) ( not ( = ?auto_162391 ?auto_162397 ) ) ( not ( = ?auto_162392 ?auto_162394 ) ) ( not ( = ?auto_162392 ?auto_162397 ) ) ( not ( = ?auto_162394 ?auto_162397 ) ) ( ON ?auto_162394 ?auto_162392 ) ( ON-TABLE ?auto_162395 ) ( ON ?auto_162393 ?auto_162395 ) ( not ( = ?auto_162395 ?auto_162393 ) ) ( not ( = ?auto_162395 ?auto_162396 ) ) ( not ( = ?auto_162395 ?auto_162397 ) ) ( not ( = ?auto_162393 ?auto_162396 ) ) ( not ( = ?auto_162393 ?auto_162397 ) ) ( not ( = ?auto_162396 ?auto_162397 ) ) ( not ( = ?auto_162389 ?auto_162396 ) ) ( not ( = ?auto_162389 ?auto_162395 ) ) ( not ( = ?auto_162389 ?auto_162393 ) ) ( not ( = ?auto_162390 ?auto_162396 ) ) ( not ( = ?auto_162390 ?auto_162395 ) ) ( not ( = ?auto_162390 ?auto_162393 ) ) ( not ( = ?auto_162391 ?auto_162396 ) ) ( not ( = ?auto_162391 ?auto_162395 ) ) ( not ( = ?auto_162391 ?auto_162393 ) ) ( not ( = ?auto_162392 ?auto_162396 ) ) ( not ( = ?auto_162392 ?auto_162395 ) ) ( not ( = ?auto_162392 ?auto_162393 ) ) ( not ( = ?auto_162394 ?auto_162396 ) ) ( not ( = ?auto_162394 ?auto_162395 ) ) ( not ( = ?auto_162394 ?auto_162393 ) ) ( ON ?auto_162397 ?auto_162394 ) ( CLEAR ?auto_162393 ) ( ON ?auto_162396 ?auto_162397 ) ( CLEAR ?auto_162396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162389 ?auto_162390 ?auto_162391 ?auto_162392 ?auto_162394 ?auto_162397 )
      ( MAKE-3PILE ?auto_162389 ?auto_162390 ?auto_162391 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162398 - BLOCK
      ?auto_162399 - BLOCK
      ?auto_162400 - BLOCK
    )
    :vars
    (
      ?auto_162404 - BLOCK
      ?auto_162405 - BLOCK
      ?auto_162403 - BLOCK
      ?auto_162406 - BLOCK
      ?auto_162401 - BLOCK
      ?auto_162402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162404 ?auto_162400 ) ( ON-TABLE ?auto_162398 ) ( ON ?auto_162399 ?auto_162398 ) ( ON ?auto_162400 ?auto_162399 ) ( not ( = ?auto_162398 ?auto_162399 ) ) ( not ( = ?auto_162398 ?auto_162400 ) ) ( not ( = ?auto_162398 ?auto_162404 ) ) ( not ( = ?auto_162399 ?auto_162400 ) ) ( not ( = ?auto_162399 ?auto_162404 ) ) ( not ( = ?auto_162400 ?auto_162404 ) ) ( not ( = ?auto_162398 ?auto_162405 ) ) ( not ( = ?auto_162398 ?auto_162403 ) ) ( not ( = ?auto_162399 ?auto_162405 ) ) ( not ( = ?auto_162399 ?auto_162403 ) ) ( not ( = ?auto_162400 ?auto_162405 ) ) ( not ( = ?auto_162400 ?auto_162403 ) ) ( not ( = ?auto_162404 ?auto_162405 ) ) ( not ( = ?auto_162404 ?auto_162403 ) ) ( not ( = ?auto_162405 ?auto_162403 ) ) ( ON ?auto_162405 ?auto_162404 ) ( ON-TABLE ?auto_162406 ) ( not ( = ?auto_162406 ?auto_162401 ) ) ( not ( = ?auto_162406 ?auto_162402 ) ) ( not ( = ?auto_162406 ?auto_162403 ) ) ( not ( = ?auto_162401 ?auto_162402 ) ) ( not ( = ?auto_162401 ?auto_162403 ) ) ( not ( = ?auto_162402 ?auto_162403 ) ) ( not ( = ?auto_162398 ?auto_162402 ) ) ( not ( = ?auto_162398 ?auto_162406 ) ) ( not ( = ?auto_162398 ?auto_162401 ) ) ( not ( = ?auto_162399 ?auto_162402 ) ) ( not ( = ?auto_162399 ?auto_162406 ) ) ( not ( = ?auto_162399 ?auto_162401 ) ) ( not ( = ?auto_162400 ?auto_162402 ) ) ( not ( = ?auto_162400 ?auto_162406 ) ) ( not ( = ?auto_162400 ?auto_162401 ) ) ( not ( = ?auto_162404 ?auto_162402 ) ) ( not ( = ?auto_162404 ?auto_162406 ) ) ( not ( = ?auto_162404 ?auto_162401 ) ) ( not ( = ?auto_162405 ?auto_162402 ) ) ( not ( = ?auto_162405 ?auto_162406 ) ) ( not ( = ?auto_162405 ?auto_162401 ) ) ( ON ?auto_162403 ?auto_162405 ) ( ON ?auto_162402 ?auto_162403 ) ( CLEAR ?auto_162402 ) ( HOLDING ?auto_162401 ) ( CLEAR ?auto_162406 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162406 ?auto_162401 )
      ( MAKE-3PILE ?auto_162398 ?auto_162399 ?auto_162400 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164265 - BLOCK
      ?auto_164266 - BLOCK
      ?auto_164267 - BLOCK
    )
    :vars
    (
      ?auto_164269 - BLOCK
      ?auto_164272 - BLOCK
      ?auto_164270 - BLOCK
      ?auto_164271 - BLOCK
      ?auto_164268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164269 ?auto_164267 ) ( ON-TABLE ?auto_164265 ) ( ON ?auto_164266 ?auto_164265 ) ( ON ?auto_164267 ?auto_164266 ) ( not ( = ?auto_164265 ?auto_164266 ) ) ( not ( = ?auto_164265 ?auto_164267 ) ) ( not ( = ?auto_164265 ?auto_164269 ) ) ( not ( = ?auto_164266 ?auto_164267 ) ) ( not ( = ?auto_164266 ?auto_164269 ) ) ( not ( = ?auto_164267 ?auto_164269 ) ) ( not ( = ?auto_164265 ?auto_164272 ) ) ( not ( = ?auto_164265 ?auto_164270 ) ) ( not ( = ?auto_164266 ?auto_164272 ) ) ( not ( = ?auto_164266 ?auto_164270 ) ) ( not ( = ?auto_164267 ?auto_164272 ) ) ( not ( = ?auto_164267 ?auto_164270 ) ) ( not ( = ?auto_164269 ?auto_164272 ) ) ( not ( = ?auto_164269 ?auto_164270 ) ) ( not ( = ?auto_164272 ?auto_164270 ) ) ( ON ?auto_164272 ?auto_164269 ) ( not ( = ?auto_164271 ?auto_164268 ) ) ( not ( = ?auto_164271 ?auto_164270 ) ) ( not ( = ?auto_164268 ?auto_164270 ) ) ( not ( = ?auto_164265 ?auto_164268 ) ) ( not ( = ?auto_164265 ?auto_164271 ) ) ( not ( = ?auto_164266 ?auto_164268 ) ) ( not ( = ?auto_164266 ?auto_164271 ) ) ( not ( = ?auto_164267 ?auto_164268 ) ) ( not ( = ?auto_164267 ?auto_164271 ) ) ( not ( = ?auto_164269 ?auto_164268 ) ) ( not ( = ?auto_164269 ?auto_164271 ) ) ( not ( = ?auto_164272 ?auto_164268 ) ) ( not ( = ?auto_164272 ?auto_164271 ) ) ( ON ?auto_164270 ?auto_164272 ) ( ON ?auto_164268 ?auto_164270 ) ( ON ?auto_164271 ?auto_164268 ) ( CLEAR ?auto_164271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164265 ?auto_164266 ?auto_164267 ?auto_164269 ?auto_164272 ?auto_164270 ?auto_164268 )
      ( MAKE-3PILE ?auto_164265 ?auto_164266 ?auto_164267 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162416 - BLOCK
      ?auto_162417 - BLOCK
      ?auto_162418 - BLOCK
    )
    :vars
    (
      ?auto_162422 - BLOCK
      ?auto_162421 - BLOCK
      ?auto_162424 - BLOCK
      ?auto_162420 - BLOCK
      ?auto_162423 - BLOCK
      ?auto_162419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162422 ?auto_162418 ) ( ON-TABLE ?auto_162416 ) ( ON ?auto_162417 ?auto_162416 ) ( ON ?auto_162418 ?auto_162417 ) ( not ( = ?auto_162416 ?auto_162417 ) ) ( not ( = ?auto_162416 ?auto_162418 ) ) ( not ( = ?auto_162416 ?auto_162422 ) ) ( not ( = ?auto_162417 ?auto_162418 ) ) ( not ( = ?auto_162417 ?auto_162422 ) ) ( not ( = ?auto_162418 ?auto_162422 ) ) ( not ( = ?auto_162416 ?auto_162421 ) ) ( not ( = ?auto_162416 ?auto_162424 ) ) ( not ( = ?auto_162417 ?auto_162421 ) ) ( not ( = ?auto_162417 ?auto_162424 ) ) ( not ( = ?auto_162418 ?auto_162421 ) ) ( not ( = ?auto_162418 ?auto_162424 ) ) ( not ( = ?auto_162422 ?auto_162421 ) ) ( not ( = ?auto_162422 ?auto_162424 ) ) ( not ( = ?auto_162421 ?auto_162424 ) ) ( ON ?auto_162421 ?auto_162422 ) ( not ( = ?auto_162420 ?auto_162423 ) ) ( not ( = ?auto_162420 ?auto_162419 ) ) ( not ( = ?auto_162420 ?auto_162424 ) ) ( not ( = ?auto_162423 ?auto_162419 ) ) ( not ( = ?auto_162423 ?auto_162424 ) ) ( not ( = ?auto_162419 ?auto_162424 ) ) ( not ( = ?auto_162416 ?auto_162419 ) ) ( not ( = ?auto_162416 ?auto_162420 ) ) ( not ( = ?auto_162416 ?auto_162423 ) ) ( not ( = ?auto_162417 ?auto_162419 ) ) ( not ( = ?auto_162417 ?auto_162420 ) ) ( not ( = ?auto_162417 ?auto_162423 ) ) ( not ( = ?auto_162418 ?auto_162419 ) ) ( not ( = ?auto_162418 ?auto_162420 ) ) ( not ( = ?auto_162418 ?auto_162423 ) ) ( not ( = ?auto_162422 ?auto_162419 ) ) ( not ( = ?auto_162422 ?auto_162420 ) ) ( not ( = ?auto_162422 ?auto_162423 ) ) ( not ( = ?auto_162421 ?auto_162419 ) ) ( not ( = ?auto_162421 ?auto_162420 ) ) ( not ( = ?auto_162421 ?auto_162423 ) ) ( ON ?auto_162424 ?auto_162421 ) ( ON ?auto_162419 ?auto_162424 ) ( ON ?auto_162423 ?auto_162419 ) ( CLEAR ?auto_162423 ) ( HOLDING ?auto_162420 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162420 )
      ( MAKE-3PILE ?auto_162416 ?auto_162417 ?auto_162418 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162425 - BLOCK
      ?auto_162426 - BLOCK
      ?auto_162427 - BLOCK
    )
    :vars
    (
      ?auto_162428 - BLOCK
      ?auto_162431 - BLOCK
      ?auto_162430 - BLOCK
      ?auto_162429 - BLOCK
      ?auto_162432 - BLOCK
      ?auto_162433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162428 ?auto_162427 ) ( ON-TABLE ?auto_162425 ) ( ON ?auto_162426 ?auto_162425 ) ( ON ?auto_162427 ?auto_162426 ) ( not ( = ?auto_162425 ?auto_162426 ) ) ( not ( = ?auto_162425 ?auto_162427 ) ) ( not ( = ?auto_162425 ?auto_162428 ) ) ( not ( = ?auto_162426 ?auto_162427 ) ) ( not ( = ?auto_162426 ?auto_162428 ) ) ( not ( = ?auto_162427 ?auto_162428 ) ) ( not ( = ?auto_162425 ?auto_162431 ) ) ( not ( = ?auto_162425 ?auto_162430 ) ) ( not ( = ?auto_162426 ?auto_162431 ) ) ( not ( = ?auto_162426 ?auto_162430 ) ) ( not ( = ?auto_162427 ?auto_162431 ) ) ( not ( = ?auto_162427 ?auto_162430 ) ) ( not ( = ?auto_162428 ?auto_162431 ) ) ( not ( = ?auto_162428 ?auto_162430 ) ) ( not ( = ?auto_162431 ?auto_162430 ) ) ( ON ?auto_162431 ?auto_162428 ) ( not ( = ?auto_162429 ?auto_162432 ) ) ( not ( = ?auto_162429 ?auto_162433 ) ) ( not ( = ?auto_162429 ?auto_162430 ) ) ( not ( = ?auto_162432 ?auto_162433 ) ) ( not ( = ?auto_162432 ?auto_162430 ) ) ( not ( = ?auto_162433 ?auto_162430 ) ) ( not ( = ?auto_162425 ?auto_162433 ) ) ( not ( = ?auto_162425 ?auto_162429 ) ) ( not ( = ?auto_162425 ?auto_162432 ) ) ( not ( = ?auto_162426 ?auto_162433 ) ) ( not ( = ?auto_162426 ?auto_162429 ) ) ( not ( = ?auto_162426 ?auto_162432 ) ) ( not ( = ?auto_162427 ?auto_162433 ) ) ( not ( = ?auto_162427 ?auto_162429 ) ) ( not ( = ?auto_162427 ?auto_162432 ) ) ( not ( = ?auto_162428 ?auto_162433 ) ) ( not ( = ?auto_162428 ?auto_162429 ) ) ( not ( = ?auto_162428 ?auto_162432 ) ) ( not ( = ?auto_162431 ?auto_162433 ) ) ( not ( = ?auto_162431 ?auto_162429 ) ) ( not ( = ?auto_162431 ?auto_162432 ) ) ( ON ?auto_162430 ?auto_162431 ) ( ON ?auto_162433 ?auto_162430 ) ( ON ?auto_162432 ?auto_162433 ) ( ON ?auto_162429 ?auto_162432 ) ( CLEAR ?auto_162429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162425 ?auto_162426 ?auto_162427 ?auto_162428 ?auto_162431 ?auto_162430 ?auto_162433 ?auto_162432 )
      ( MAKE-3PILE ?auto_162425 ?auto_162426 ?auto_162427 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162440 - BLOCK
      ?auto_162441 - BLOCK
      ?auto_162442 - BLOCK
      ?auto_162443 - BLOCK
      ?auto_162444 - BLOCK
      ?auto_162445 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_162445 ) ( CLEAR ?auto_162444 ) ( ON-TABLE ?auto_162440 ) ( ON ?auto_162441 ?auto_162440 ) ( ON ?auto_162442 ?auto_162441 ) ( ON ?auto_162443 ?auto_162442 ) ( ON ?auto_162444 ?auto_162443 ) ( not ( = ?auto_162440 ?auto_162441 ) ) ( not ( = ?auto_162440 ?auto_162442 ) ) ( not ( = ?auto_162440 ?auto_162443 ) ) ( not ( = ?auto_162440 ?auto_162444 ) ) ( not ( = ?auto_162440 ?auto_162445 ) ) ( not ( = ?auto_162441 ?auto_162442 ) ) ( not ( = ?auto_162441 ?auto_162443 ) ) ( not ( = ?auto_162441 ?auto_162444 ) ) ( not ( = ?auto_162441 ?auto_162445 ) ) ( not ( = ?auto_162442 ?auto_162443 ) ) ( not ( = ?auto_162442 ?auto_162444 ) ) ( not ( = ?auto_162442 ?auto_162445 ) ) ( not ( = ?auto_162443 ?auto_162444 ) ) ( not ( = ?auto_162443 ?auto_162445 ) ) ( not ( = ?auto_162444 ?auto_162445 ) ) )
    :subtasks
    ( ( !STACK ?auto_162445 ?auto_162444 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162446 - BLOCK
      ?auto_162447 - BLOCK
      ?auto_162448 - BLOCK
      ?auto_162449 - BLOCK
      ?auto_162450 - BLOCK
      ?auto_162451 - BLOCK
    )
    :vars
    (
      ?auto_162452 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162450 ) ( ON-TABLE ?auto_162446 ) ( ON ?auto_162447 ?auto_162446 ) ( ON ?auto_162448 ?auto_162447 ) ( ON ?auto_162449 ?auto_162448 ) ( ON ?auto_162450 ?auto_162449 ) ( not ( = ?auto_162446 ?auto_162447 ) ) ( not ( = ?auto_162446 ?auto_162448 ) ) ( not ( = ?auto_162446 ?auto_162449 ) ) ( not ( = ?auto_162446 ?auto_162450 ) ) ( not ( = ?auto_162446 ?auto_162451 ) ) ( not ( = ?auto_162447 ?auto_162448 ) ) ( not ( = ?auto_162447 ?auto_162449 ) ) ( not ( = ?auto_162447 ?auto_162450 ) ) ( not ( = ?auto_162447 ?auto_162451 ) ) ( not ( = ?auto_162448 ?auto_162449 ) ) ( not ( = ?auto_162448 ?auto_162450 ) ) ( not ( = ?auto_162448 ?auto_162451 ) ) ( not ( = ?auto_162449 ?auto_162450 ) ) ( not ( = ?auto_162449 ?auto_162451 ) ) ( not ( = ?auto_162450 ?auto_162451 ) ) ( ON ?auto_162451 ?auto_162452 ) ( CLEAR ?auto_162451 ) ( HAND-EMPTY ) ( not ( = ?auto_162446 ?auto_162452 ) ) ( not ( = ?auto_162447 ?auto_162452 ) ) ( not ( = ?auto_162448 ?auto_162452 ) ) ( not ( = ?auto_162449 ?auto_162452 ) ) ( not ( = ?auto_162450 ?auto_162452 ) ) ( not ( = ?auto_162451 ?auto_162452 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162451 ?auto_162452 )
      ( MAKE-6PILE ?auto_162446 ?auto_162447 ?auto_162448 ?auto_162449 ?auto_162450 ?auto_162451 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162453 - BLOCK
      ?auto_162454 - BLOCK
      ?auto_162455 - BLOCK
      ?auto_162456 - BLOCK
      ?auto_162457 - BLOCK
      ?auto_162458 - BLOCK
    )
    :vars
    (
      ?auto_162459 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162453 ) ( ON ?auto_162454 ?auto_162453 ) ( ON ?auto_162455 ?auto_162454 ) ( ON ?auto_162456 ?auto_162455 ) ( not ( = ?auto_162453 ?auto_162454 ) ) ( not ( = ?auto_162453 ?auto_162455 ) ) ( not ( = ?auto_162453 ?auto_162456 ) ) ( not ( = ?auto_162453 ?auto_162457 ) ) ( not ( = ?auto_162453 ?auto_162458 ) ) ( not ( = ?auto_162454 ?auto_162455 ) ) ( not ( = ?auto_162454 ?auto_162456 ) ) ( not ( = ?auto_162454 ?auto_162457 ) ) ( not ( = ?auto_162454 ?auto_162458 ) ) ( not ( = ?auto_162455 ?auto_162456 ) ) ( not ( = ?auto_162455 ?auto_162457 ) ) ( not ( = ?auto_162455 ?auto_162458 ) ) ( not ( = ?auto_162456 ?auto_162457 ) ) ( not ( = ?auto_162456 ?auto_162458 ) ) ( not ( = ?auto_162457 ?auto_162458 ) ) ( ON ?auto_162458 ?auto_162459 ) ( CLEAR ?auto_162458 ) ( not ( = ?auto_162453 ?auto_162459 ) ) ( not ( = ?auto_162454 ?auto_162459 ) ) ( not ( = ?auto_162455 ?auto_162459 ) ) ( not ( = ?auto_162456 ?auto_162459 ) ) ( not ( = ?auto_162457 ?auto_162459 ) ) ( not ( = ?auto_162458 ?auto_162459 ) ) ( HOLDING ?auto_162457 ) ( CLEAR ?auto_162456 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162453 ?auto_162454 ?auto_162455 ?auto_162456 ?auto_162457 )
      ( MAKE-6PILE ?auto_162453 ?auto_162454 ?auto_162455 ?auto_162456 ?auto_162457 ?auto_162458 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162460 - BLOCK
      ?auto_162461 - BLOCK
      ?auto_162462 - BLOCK
      ?auto_162463 - BLOCK
      ?auto_162464 - BLOCK
      ?auto_162465 - BLOCK
    )
    :vars
    (
      ?auto_162466 - BLOCK
      ?auto_162467 - BLOCK
      ?auto_162468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162460 ) ( ON ?auto_162461 ?auto_162460 ) ( ON ?auto_162462 ?auto_162461 ) ( ON ?auto_162463 ?auto_162462 ) ( not ( = ?auto_162460 ?auto_162461 ) ) ( not ( = ?auto_162460 ?auto_162462 ) ) ( not ( = ?auto_162460 ?auto_162463 ) ) ( not ( = ?auto_162460 ?auto_162464 ) ) ( not ( = ?auto_162460 ?auto_162465 ) ) ( not ( = ?auto_162461 ?auto_162462 ) ) ( not ( = ?auto_162461 ?auto_162463 ) ) ( not ( = ?auto_162461 ?auto_162464 ) ) ( not ( = ?auto_162461 ?auto_162465 ) ) ( not ( = ?auto_162462 ?auto_162463 ) ) ( not ( = ?auto_162462 ?auto_162464 ) ) ( not ( = ?auto_162462 ?auto_162465 ) ) ( not ( = ?auto_162463 ?auto_162464 ) ) ( not ( = ?auto_162463 ?auto_162465 ) ) ( not ( = ?auto_162464 ?auto_162465 ) ) ( ON ?auto_162465 ?auto_162466 ) ( not ( = ?auto_162460 ?auto_162466 ) ) ( not ( = ?auto_162461 ?auto_162466 ) ) ( not ( = ?auto_162462 ?auto_162466 ) ) ( not ( = ?auto_162463 ?auto_162466 ) ) ( not ( = ?auto_162464 ?auto_162466 ) ) ( not ( = ?auto_162465 ?auto_162466 ) ) ( CLEAR ?auto_162463 ) ( ON ?auto_162464 ?auto_162465 ) ( CLEAR ?auto_162464 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162467 ) ( ON ?auto_162468 ?auto_162467 ) ( ON ?auto_162466 ?auto_162468 ) ( not ( = ?auto_162467 ?auto_162468 ) ) ( not ( = ?auto_162467 ?auto_162466 ) ) ( not ( = ?auto_162467 ?auto_162465 ) ) ( not ( = ?auto_162467 ?auto_162464 ) ) ( not ( = ?auto_162468 ?auto_162466 ) ) ( not ( = ?auto_162468 ?auto_162465 ) ) ( not ( = ?auto_162468 ?auto_162464 ) ) ( not ( = ?auto_162460 ?auto_162467 ) ) ( not ( = ?auto_162460 ?auto_162468 ) ) ( not ( = ?auto_162461 ?auto_162467 ) ) ( not ( = ?auto_162461 ?auto_162468 ) ) ( not ( = ?auto_162462 ?auto_162467 ) ) ( not ( = ?auto_162462 ?auto_162468 ) ) ( not ( = ?auto_162463 ?auto_162467 ) ) ( not ( = ?auto_162463 ?auto_162468 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162467 ?auto_162468 ?auto_162466 ?auto_162465 )
      ( MAKE-6PILE ?auto_162460 ?auto_162461 ?auto_162462 ?auto_162463 ?auto_162464 ?auto_162465 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162469 - BLOCK
      ?auto_162470 - BLOCK
      ?auto_162471 - BLOCK
      ?auto_162472 - BLOCK
      ?auto_162473 - BLOCK
      ?auto_162474 - BLOCK
    )
    :vars
    (
      ?auto_162476 - BLOCK
      ?auto_162477 - BLOCK
      ?auto_162475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162469 ) ( ON ?auto_162470 ?auto_162469 ) ( ON ?auto_162471 ?auto_162470 ) ( not ( = ?auto_162469 ?auto_162470 ) ) ( not ( = ?auto_162469 ?auto_162471 ) ) ( not ( = ?auto_162469 ?auto_162472 ) ) ( not ( = ?auto_162469 ?auto_162473 ) ) ( not ( = ?auto_162469 ?auto_162474 ) ) ( not ( = ?auto_162470 ?auto_162471 ) ) ( not ( = ?auto_162470 ?auto_162472 ) ) ( not ( = ?auto_162470 ?auto_162473 ) ) ( not ( = ?auto_162470 ?auto_162474 ) ) ( not ( = ?auto_162471 ?auto_162472 ) ) ( not ( = ?auto_162471 ?auto_162473 ) ) ( not ( = ?auto_162471 ?auto_162474 ) ) ( not ( = ?auto_162472 ?auto_162473 ) ) ( not ( = ?auto_162472 ?auto_162474 ) ) ( not ( = ?auto_162473 ?auto_162474 ) ) ( ON ?auto_162474 ?auto_162476 ) ( not ( = ?auto_162469 ?auto_162476 ) ) ( not ( = ?auto_162470 ?auto_162476 ) ) ( not ( = ?auto_162471 ?auto_162476 ) ) ( not ( = ?auto_162472 ?auto_162476 ) ) ( not ( = ?auto_162473 ?auto_162476 ) ) ( not ( = ?auto_162474 ?auto_162476 ) ) ( ON ?auto_162473 ?auto_162474 ) ( CLEAR ?auto_162473 ) ( ON-TABLE ?auto_162477 ) ( ON ?auto_162475 ?auto_162477 ) ( ON ?auto_162476 ?auto_162475 ) ( not ( = ?auto_162477 ?auto_162475 ) ) ( not ( = ?auto_162477 ?auto_162476 ) ) ( not ( = ?auto_162477 ?auto_162474 ) ) ( not ( = ?auto_162477 ?auto_162473 ) ) ( not ( = ?auto_162475 ?auto_162476 ) ) ( not ( = ?auto_162475 ?auto_162474 ) ) ( not ( = ?auto_162475 ?auto_162473 ) ) ( not ( = ?auto_162469 ?auto_162477 ) ) ( not ( = ?auto_162469 ?auto_162475 ) ) ( not ( = ?auto_162470 ?auto_162477 ) ) ( not ( = ?auto_162470 ?auto_162475 ) ) ( not ( = ?auto_162471 ?auto_162477 ) ) ( not ( = ?auto_162471 ?auto_162475 ) ) ( not ( = ?auto_162472 ?auto_162477 ) ) ( not ( = ?auto_162472 ?auto_162475 ) ) ( HOLDING ?auto_162472 ) ( CLEAR ?auto_162471 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162469 ?auto_162470 ?auto_162471 ?auto_162472 )
      ( MAKE-6PILE ?auto_162469 ?auto_162470 ?auto_162471 ?auto_162472 ?auto_162473 ?auto_162474 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162478 - BLOCK
      ?auto_162479 - BLOCK
      ?auto_162480 - BLOCK
      ?auto_162481 - BLOCK
      ?auto_162482 - BLOCK
      ?auto_162483 - BLOCK
    )
    :vars
    (
      ?auto_162484 - BLOCK
      ?auto_162485 - BLOCK
      ?auto_162486 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162478 ) ( ON ?auto_162479 ?auto_162478 ) ( ON ?auto_162480 ?auto_162479 ) ( not ( = ?auto_162478 ?auto_162479 ) ) ( not ( = ?auto_162478 ?auto_162480 ) ) ( not ( = ?auto_162478 ?auto_162481 ) ) ( not ( = ?auto_162478 ?auto_162482 ) ) ( not ( = ?auto_162478 ?auto_162483 ) ) ( not ( = ?auto_162479 ?auto_162480 ) ) ( not ( = ?auto_162479 ?auto_162481 ) ) ( not ( = ?auto_162479 ?auto_162482 ) ) ( not ( = ?auto_162479 ?auto_162483 ) ) ( not ( = ?auto_162480 ?auto_162481 ) ) ( not ( = ?auto_162480 ?auto_162482 ) ) ( not ( = ?auto_162480 ?auto_162483 ) ) ( not ( = ?auto_162481 ?auto_162482 ) ) ( not ( = ?auto_162481 ?auto_162483 ) ) ( not ( = ?auto_162482 ?auto_162483 ) ) ( ON ?auto_162483 ?auto_162484 ) ( not ( = ?auto_162478 ?auto_162484 ) ) ( not ( = ?auto_162479 ?auto_162484 ) ) ( not ( = ?auto_162480 ?auto_162484 ) ) ( not ( = ?auto_162481 ?auto_162484 ) ) ( not ( = ?auto_162482 ?auto_162484 ) ) ( not ( = ?auto_162483 ?auto_162484 ) ) ( ON ?auto_162482 ?auto_162483 ) ( ON-TABLE ?auto_162485 ) ( ON ?auto_162486 ?auto_162485 ) ( ON ?auto_162484 ?auto_162486 ) ( not ( = ?auto_162485 ?auto_162486 ) ) ( not ( = ?auto_162485 ?auto_162484 ) ) ( not ( = ?auto_162485 ?auto_162483 ) ) ( not ( = ?auto_162485 ?auto_162482 ) ) ( not ( = ?auto_162486 ?auto_162484 ) ) ( not ( = ?auto_162486 ?auto_162483 ) ) ( not ( = ?auto_162486 ?auto_162482 ) ) ( not ( = ?auto_162478 ?auto_162485 ) ) ( not ( = ?auto_162478 ?auto_162486 ) ) ( not ( = ?auto_162479 ?auto_162485 ) ) ( not ( = ?auto_162479 ?auto_162486 ) ) ( not ( = ?auto_162480 ?auto_162485 ) ) ( not ( = ?auto_162480 ?auto_162486 ) ) ( not ( = ?auto_162481 ?auto_162485 ) ) ( not ( = ?auto_162481 ?auto_162486 ) ) ( CLEAR ?auto_162480 ) ( ON ?auto_162481 ?auto_162482 ) ( CLEAR ?auto_162481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162485 ?auto_162486 ?auto_162484 ?auto_162483 ?auto_162482 )
      ( MAKE-6PILE ?auto_162478 ?auto_162479 ?auto_162480 ?auto_162481 ?auto_162482 ?auto_162483 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162487 - BLOCK
      ?auto_162488 - BLOCK
      ?auto_162489 - BLOCK
      ?auto_162490 - BLOCK
      ?auto_162491 - BLOCK
      ?auto_162492 - BLOCK
    )
    :vars
    (
      ?auto_162493 - BLOCK
      ?auto_162494 - BLOCK
      ?auto_162495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162487 ) ( ON ?auto_162488 ?auto_162487 ) ( not ( = ?auto_162487 ?auto_162488 ) ) ( not ( = ?auto_162487 ?auto_162489 ) ) ( not ( = ?auto_162487 ?auto_162490 ) ) ( not ( = ?auto_162487 ?auto_162491 ) ) ( not ( = ?auto_162487 ?auto_162492 ) ) ( not ( = ?auto_162488 ?auto_162489 ) ) ( not ( = ?auto_162488 ?auto_162490 ) ) ( not ( = ?auto_162488 ?auto_162491 ) ) ( not ( = ?auto_162488 ?auto_162492 ) ) ( not ( = ?auto_162489 ?auto_162490 ) ) ( not ( = ?auto_162489 ?auto_162491 ) ) ( not ( = ?auto_162489 ?auto_162492 ) ) ( not ( = ?auto_162490 ?auto_162491 ) ) ( not ( = ?auto_162490 ?auto_162492 ) ) ( not ( = ?auto_162491 ?auto_162492 ) ) ( ON ?auto_162492 ?auto_162493 ) ( not ( = ?auto_162487 ?auto_162493 ) ) ( not ( = ?auto_162488 ?auto_162493 ) ) ( not ( = ?auto_162489 ?auto_162493 ) ) ( not ( = ?auto_162490 ?auto_162493 ) ) ( not ( = ?auto_162491 ?auto_162493 ) ) ( not ( = ?auto_162492 ?auto_162493 ) ) ( ON ?auto_162491 ?auto_162492 ) ( ON-TABLE ?auto_162494 ) ( ON ?auto_162495 ?auto_162494 ) ( ON ?auto_162493 ?auto_162495 ) ( not ( = ?auto_162494 ?auto_162495 ) ) ( not ( = ?auto_162494 ?auto_162493 ) ) ( not ( = ?auto_162494 ?auto_162492 ) ) ( not ( = ?auto_162494 ?auto_162491 ) ) ( not ( = ?auto_162495 ?auto_162493 ) ) ( not ( = ?auto_162495 ?auto_162492 ) ) ( not ( = ?auto_162495 ?auto_162491 ) ) ( not ( = ?auto_162487 ?auto_162494 ) ) ( not ( = ?auto_162487 ?auto_162495 ) ) ( not ( = ?auto_162488 ?auto_162494 ) ) ( not ( = ?auto_162488 ?auto_162495 ) ) ( not ( = ?auto_162489 ?auto_162494 ) ) ( not ( = ?auto_162489 ?auto_162495 ) ) ( not ( = ?auto_162490 ?auto_162494 ) ) ( not ( = ?auto_162490 ?auto_162495 ) ) ( ON ?auto_162490 ?auto_162491 ) ( CLEAR ?auto_162490 ) ( HOLDING ?auto_162489 ) ( CLEAR ?auto_162488 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162487 ?auto_162488 ?auto_162489 )
      ( MAKE-6PILE ?auto_162487 ?auto_162488 ?auto_162489 ?auto_162490 ?auto_162491 ?auto_162492 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162496 - BLOCK
      ?auto_162497 - BLOCK
      ?auto_162498 - BLOCK
      ?auto_162499 - BLOCK
      ?auto_162500 - BLOCK
      ?auto_162501 - BLOCK
    )
    :vars
    (
      ?auto_162502 - BLOCK
      ?auto_162503 - BLOCK
      ?auto_162504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162496 ) ( ON ?auto_162497 ?auto_162496 ) ( not ( = ?auto_162496 ?auto_162497 ) ) ( not ( = ?auto_162496 ?auto_162498 ) ) ( not ( = ?auto_162496 ?auto_162499 ) ) ( not ( = ?auto_162496 ?auto_162500 ) ) ( not ( = ?auto_162496 ?auto_162501 ) ) ( not ( = ?auto_162497 ?auto_162498 ) ) ( not ( = ?auto_162497 ?auto_162499 ) ) ( not ( = ?auto_162497 ?auto_162500 ) ) ( not ( = ?auto_162497 ?auto_162501 ) ) ( not ( = ?auto_162498 ?auto_162499 ) ) ( not ( = ?auto_162498 ?auto_162500 ) ) ( not ( = ?auto_162498 ?auto_162501 ) ) ( not ( = ?auto_162499 ?auto_162500 ) ) ( not ( = ?auto_162499 ?auto_162501 ) ) ( not ( = ?auto_162500 ?auto_162501 ) ) ( ON ?auto_162501 ?auto_162502 ) ( not ( = ?auto_162496 ?auto_162502 ) ) ( not ( = ?auto_162497 ?auto_162502 ) ) ( not ( = ?auto_162498 ?auto_162502 ) ) ( not ( = ?auto_162499 ?auto_162502 ) ) ( not ( = ?auto_162500 ?auto_162502 ) ) ( not ( = ?auto_162501 ?auto_162502 ) ) ( ON ?auto_162500 ?auto_162501 ) ( ON-TABLE ?auto_162503 ) ( ON ?auto_162504 ?auto_162503 ) ( ON ?auto_162502 ?auto_162504 ) ( not ( = ?auto_162503 ?auto_162504 ) ) ( not ( = ?auto_162503 ?auto_162502 ) ) ( not ( = ?auto_162503 ?auto_162501 ) ) ( not ( = ?auto_162503 ?auto_162500 ) ) ( not ( = ?auto_162504 ?auto_162502 ) ) ( not ( = ?auto_162504 ?auto_162501 ) ) ( not ( = ?auto_162504 ?auto_162500 ) ) ( not ( = ?auto_162496 ?auto_162503 ) ) ( not ( = ?auto_162496 ?auto_162504 ) ) ( not ( = ?auto_162497 ?auto_162503 ) ) ( not ( = ?auto_162497 ?auto_162504 ) ) ( not ( = ?auto_162498 ?auto_162503 ) ) ( not ( = ?auto_162498 ?auto_162504 ) ) ( not ( = ?auto_162499 ?auto_162503 ) ) ( not ( = ?auto_162499 ?auto_162504 ) ) ( ON ?auto_162499 ?auto_162500 ) ( CLEAR ?auto_162497 ) ( ON ?auto_162498 ?auto_162499 ) ( CLEAR ?auto_162498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162503 ?auto_162504 ?auto_162502 ?auto_162501 ?auto_162500 ?auto_162499 )
      ( MAKE-6PILE ?auto_162496 ?auto_162497 ?auto_162498 ?auto_162499 ?auto_162500 ?auto_162501 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162505 - BLOCK
      ?auto_162506 - BLOCK
      ?auto_162507 - BLOCK
      ?auto_162508 - BLOCK
      ?auto_162509 - BLOCK
      ?auto_162510 - BLOCK
    )
    :vars
    (
      ?auto_162511 - BLOCK
      ?auto_162513 - BLOCK
      ?auto_162512 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162505 ) ( not ( = ?auto_162505 ?auto_162506 ) ) ( not ( = ?auto_162505 ?auto_162507 ) ) ( not ( = ?auto_162505 ?auto_162508 ) ) ( not ( = ?auto_162505 ?auto_162509 ) ) ( not ( = ?auto_162505 ?auto_162510 ) ) ( not ( = ?auto_162506 ?auto_162507 ) ) ( not ( = ?auto_162506 ?auto_162508 ) ) ( not ( = ?auto_162506 ?auto_162509 ) ) ( not ( = ?auto_162506 ?auto_162510 ) ) ( not ( = ?auto_162507 ?auto_162508 ) ) ( not ( = ?auto_162507 ?auto_162509 ) ) ( not ( = ?auto_162507 ?auto_162510 ) ) ( not ( = ?auto_162508 ?auto_162509 ) ) ( not ( = ?auto_162508 ?auto_162510 ) ) ( not ( = ?auto_162509 ?auto_162510 ) ) ( ON ?auto_162510 ?auto_162511 ) ( not ( = ?auto_162505 ?auto_162511 ) ) ( not ( = ?auto_162506 ?auto_162511 ) ) ( not ( = ?auto_162507 ?auto_162511 ) ) ( not ( = ?auto_162508 ?auto_162511 ) ) ( not ( = ?auto_162509 ?auto_162511 ) ) ( not ( = ?auto_162510 ?auto_162511 ) ) ( ON ?auto_162509 ?auto_162510 ) ( ON-TABLE ?auto_162513 ) ( ON ?auto_162512 ?auto_162513 ) ( ON ?auto_162511 ?auto_162512 ) ( not ( = ?auto_162513 ?auto_162512 ) ) ( not ( = ?auto_162513 ?auto_162511 ) ) ( not ( = ?auto_162513 ?auto_162510 ) ) ( not ( = ?auto_162513 ?auto_162509 ) ) ( not ( = ?auto_162512 ?auto_162511 ) ) ( not ( = ?auto_162512 ?auto_162510 ) ) ( not ( = ?auto_162512 ?auto_162509 ) ) ( not ( = ?auto_162505 ?auto_162513 ) ) ( not ( = ?auto_162505 ?auto_162512 ) ) ( not ( = ?auto_162506 ?auto_162513 ) ) ( not ( = ?auto_162506 ?auto_162512 ) ) ( not ( = ?auto_162507 ?auto_162513 ) ) ( not ( = ?auto_162507 ?auto_162512 ) ) ( not ( = ?auto_162508 ?auto_162513 ) ) ( not ( = ?auto_162508 ?auto_162512 ) ) ( ON ?auto_162508 ?auto_162509 ) ( ON ?auto_162507 ?auto_162508 ) ( CLEAR ?auto_162507 ) ( HOLDING ?auto_162506 ) ( CLEAR ?auto_162505 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162505 ?auto_162506 )
      ( MAKE-6PILE ?auto_162505 ?auto_162506 ?auto_162507 ?auto_162508 ?auto_162509 ?auto_162510 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162514 - BLOCK
      ?auto_162515 - BLOCK
      ?auto_162516 - BLOCK
      ?auto_162517 - BLOCK
      ?auto_162518 - BLOCK
      ?auto_162519 - BLOCK
    )
    :vars
    (
      ?auto_162522 - BLOCK
      ?auto_162521 - BLOCK
      ?auto_162520 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162514 ) ( not ( = ?auto_162514 ?auto_162515 ) ) ( not ( = ?auto_162514 ?auto_162516 ) ) ( not ( = ?auto_162514 ?auto_162517 ) ) ( not ( = ?auto_162514 ?auto_162518 ) ) ( not ( = ?auto_162514 ?auto_162519 ) ) ( not ( = ?auto_162515 ?auto_162516 ) ) ( not ( = ?auto_162515 ?auto_162517 ) ) ( not ( = ?auto_162515 ?auto_162518 ) ) ( not ( = ?auto_162515 ?auto_162519 ) ) ( not ( = ?auto_162516 ?auto_162517 ) ) ( not ( = ?auto_162516 ?auto_162518 ) ) ( not ( = ?auto_162516 ?auto_162519 ) ) ( not ( = ?auto_162517 ?auto_162518 ) ) ( not ( = ?auto_162517 ?auto_162519 ) ) ( not ( = ?auto_162518 ?auto_162519 ) ) ( ON ?auto_162519 ?auto_162522 ) ( not ( = ?auto_162514 ?auto_162522 ) ) ( not ( = ?auto_162515 ?auto_162522 ) ) ( not ( = ?auto_162516 ?auto_162522 ) ) ( not ( = ?auto_162517 ?auto_162522 ) ) ( not ( = ?auto_162518 ?auto_162522 ) ) ( not ( = ?auto_162519 ?auto_162522 ) ) ( ON ?auto_162518 ?auto_162519 ) ( ON-TABLE ?auto_162521 ) ( ON ?auto_162520 ?auto_162521 ) ( ON ?auto_162522 ?auto_162520 ) ( not ( = ?auto_162521 ?auto_162520 ) ) ( not ( = ?auto_162521 ?auto_162522 ) ) ( not ( = ?auto_162521 ?auto_162519 ) ) ( not ( = ?auto_162521 ?auto_162518 ) ) ( not ( = ?auto_162520 ?auto_162522 ) ) ( not ( = ?auto_162520 ?auto_162519 ) ) ( not ( = ?auto_162520 ?auto_162518 ) ) ( not ( = ?auto_162514 ?auto_162521 ) ) ( not ( = ?auto_162514 ?auto_162520 ) ) ( not ( = ?auto_162515 ?auto_162521 ) ) ( not ( = ?auto_162515 ?auto_162520 ) ) ( not ( = ?auto_162516 ?auto_162521 ) ) ( not ( = ?auto_162516 ?auto_162520 ) ) ( not ( = ?auto_162517 ?auto_162521 ) ) ( not ( = ?auto_162517 ?auto_162520 ) ) ( ON ?auto_162517 ?auto_162518 ) ( ON ?auto_162516 ?auto_162517 ) ( CLEAR ?auto_162514 ) ( ON ?auto_162515 ?auto_162516 ) ( CLEAR ?auto_162515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162521 ?auto_162520 ?auto_162522 ?auto_162519 ?auto_162518 ?auto_162517 ?auto_162516 )
      ( MAKE-6PILE ?auto_162514 ?auto_162515 ?auto_162516 ?auto_162517 ?auto_162518 ?auto_162519 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162523 - BLOCK
      ?auto_162524 - BLOCK
      ?auto_162525 - BLOCK
      ?auto_162526 - BLOCK
      ?auto_162527 - BLOCK
      ?auto_162528 - BLOCK
    )
    :vars
    (
      ?auto_162531 - BLOCK
      ?auto_162529 - BLOCK
      ?auto_162530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162523 ?auto_162524 ) ) ( not ( = ?auto_162523 ?auto_162525 ) ) ( not ( = ?auto_162523 ?auto_162526 ) ) ( not ( = ?auto_162523 ?auto_162527 ) ) ( not ( = ?auto_162523 ?auto_162528 ) ) ( not ( = ?auto_162524 ?auto_162525 ) ) ( not ( = ?auto_162524 ?auto_162526 ) ) ( not ( = ?auto_162524 ?auto_162527 ) ) ( not ( = ?auto_162524 ?auto_162528 ) ) ( not ( = ?auto_162525 ?auto_162526 ) ) ( not ( = ?auto_162525 ?auto_162527 ) ) ( not ( = ?auto_162525 ?auto_162528 ) ) ( not ( = ?auto_162526 ?auto_162527 ) ) ( not ( = ?auto_162526 ?auto_162528 ) ) ( not ( = ?auto_162527 ?auto_162528 ) ) ( ON ?auto_162528 ?auto_162531 ) ( not ( = ?auto_162523 ?auto_162531 ) ) ( not ( = ?auto_162524 ?auto_162531 ) ) ( not ( = ?auto_162525 ?auto_162531 ) ) ( not ( = ?auto_162526 ?auto_162531 ) ) ( not ( = ?auto_162527 ?auto_162531 ) ) ( not ( = ?auto_162528 ?auto_162531 ) ) ( ON ?auto_162527 ?auto_162528 ) ( ON-TABLE ?auto_162529 ) ( ON ?auto_162530 ?auto_162529 ) ( ON ?auto_162531 ?auto_162530 ) ( not ( = ?auto_162529 ?auto_162530 ) ) ( not ( = ?auto_162529 ?auto_162531 ) ) ( not ( = ?auto_162529 ?auto_162528 ) ) ( not ( = ?auto_162529 ?auto_162527 ) ) ( not ( = ?auto_162530 ?auto_162531 ) ) ( not ( = ?auto_162530 ?auto_162528 ) ) ( not ( = ?auto_162530 ?auto_162527 ) ) ( not ( = ?auto_162523 ?auto_162529 ) ) ( not ( = ?auto_162523 ?auto_162530 ) ) ( not ( = ?auto_162524 ?auto_162529 ) ) ( not ( = ?auto_162524 ?auto_162530 ) ) ( not ( = ?auto_162525 ?auto_162529 ) ) ( not ( = ?auto_162525 ?auto_162530 ) ) ( not ( = ?auto_162526 ?auto_162529 ) ) ( not ( = ?auto_162526 ?auto_162530 ) ) ( ON ?auto_162526 ?auto_162527 ) ( ON ?auto_162525 ?auto_162526 ) ( ON ?auto_162524 ?auto_162525 ) ( CLEAR ?auto_162524 ) ( HOLDING ?auto_162523 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162523 )
      ( MAKE-6PILE ?auto_162523 ?auto_162524 ?auto_162525 ?auto_162526 ?auto_162527 ?auto_162528 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162532 - BLOCK
      ?auto_162533 - BLOCK
      ?auto_162534 - BLOCK
      ?auto_162535 - BLOCK
      ?auto_162536 - BLOCK
      ?auto_162537 - BLOCK
    )
    :vars
    (
      ?auto_162538 - BLOCK
      ?auto_162540 - BLOCK
      ?auto_162539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162532 ?auto_162533 ) ) ( not ( = ?auto_162532 ?auto_162534 ) ) ( not ( = ?auto_162532 ?auto_162535 ) ) ( not ( = ?auto_162532 ?auto_162536 ) ) ( not ( = ?auto_162532 ?auto_162537 ) ) ( not ( = ?auto_162533 ?auto_162534 ) ) ( not ( = ?auto_162533 ?auto_162535 ) ) ( not ( = ?auto_162533 ?auto_162536 ) ) ( not ( = ?auto_162533 ?auto_162537 ) ) ( not ( = ?auto_162534 ?auto_162535 ) ) ( not ( = ?auto_162534 ?auto_162536 ) ) ( not ( = ?auto_162534 ?auto_162537 ) ) ( not ( = ?auto_162535 ?auto_162536 ) ) ( not ( = ?auto_162535 ?auto_162537 ) ) ( not ( = ?auto_162536 ?auto_162537 ) ) ( ON ?auto_162537 ?auto_162538 ) ( not ( = ?auto_162532 ?auto_162538 ) ) ( not ( = ?auto_162533 ?auto_162538 ) ) ( not ( = ?auto_162534 ?auto_162538 ) ) ( not ( = ?auto_162535 ?auto_162538 ) ) ( not ( = ?auto_162536 ?auto_162538 ) ) ( not ( = ?auto_162537 ?auto_162538 ) ) ( ON ?auto_162536 ?auto_162537 ) ( ON-TABLE ?auto_162540 ) ( ON ?auto_162539 ?auto_162540 ) ( ON ?auto_162538 ?auto_162539 ) ( not ( = ?auto_162540 ?auto_162539 ) ) ( not ( = ?auto_162540 ?auto_162538 ) ) ( not ( = ?auto_162540 ?auto_162537 ) ) ( not ( = ?auto_162540 ?auto_162536 ) ) ( not ( = ?auto_162539 ?auto_162538 ) ) ( not ( = ?auto_162539 ?auto_162537 ) ) ( not ( = ?auto_162539 ?auto_162536 ) ) ( not ( = ?auto_162532 ?auto_162540 ) ) ( not ( = ?auto_162532 ?auto_162539 ) ) ( not ( = ?auto_162533 ?auto_162540 ) ) ( not ( = ?auto_162533 ?auto_162539 ) ) ( not ( = ?auto_162534 ?auto_162540 ) ) ( not ( = ?auto_162534 ?auto_162539 ) ) ( not ( = ?auto_162535 ?auto_162540 ) ) ( not ( = ?auto_162535 ?auto_162539 ) ) ( ON ?auto_162535 ?auto_162536 ) ( ON ?auto_162534 ?auto_162535 ) ( ON ?auto_162533 ?auto_162534 ) ( ON ?auto_162532 ?auto_162533 ) ( CLEAR ?auto_162532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162540 ?auto_162539 ?auto_162538 ?auto_162537 ?auto_162536 ?auto_162535 ?auto_162534 ?auto_162533 )
      ( MAKE-6PILE ?auto_162532 ?auto_162533 ?auto_162534 ?auto_162535 ?auto_162536 ?auto_162537 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_162543 - BLOCK
      ?auto_162544 - BLOCK
    )
    :vars
    (
      ?auto_162545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162545 ?auto_162544 ) ( CLEAR ?auto_162545 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162543 ) ( ON ?auto_162544 ?auto_162543 ) ( not ( = ?auto_162543 ?auto_162544 ) ) ( not ( = ?auto_162543 ?auto_162545 ) ) ( not ( = ?auto_162544 ?auto_162545 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162545 ?auto_162544 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_162546 - BLOCK
      ?auto_162547 - BLOCK
    )
    :vars
    (
      ?auto_162548 - BLOCK
      ?auto_162549 - BLOCK
      ?auto_162550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162548 ?auto_162547 ) ( CLEAR ?auto_162548 ) ( ON-TABLE ?auto_162546 ) ( ON ?auto_162547 ?auto_162546 ) ( not ( = ?auto_162546 ?auto_162547 ) ) ( not ( = ?auto_162546 ?auto_162548 ) ) ( not ( = ?auto_162547 ?auto_162548 ) ) ( HOLDING ?auto_162549 ) ( CLEAR ?auto_162550 ) ( not ( = ?auto_162546 ?auto_162549 ) ) ( not ( = ?auto_162546 ?auto_162550 ) ) ( not ( = ?auto_162547 ?auto_162549 ) ) ( not ( = ?auto_162547 ?auto_162550 ) ) ( not ( = ?auto_162548 ?auto_162549 ) ) ( not ( = ?auto_162548 ?auto_162550 ) ) ( not ( = ?auto_162549 ?auto_162550 ) ) )
    :subtasks
    ( ( !STACK ?auto_162549 ?auto_162550 )
      ( MAKE-2PILE ?auto_162546 ?auto_162547 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_162551 - BLOCK
      ?auto_162552 - BLOCK
    )
    :vars
    (
      ?auto_162554 - BLOCK
      ?auto_162555 - BLOCK
      ?auto_162553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162554 ?auto_162552 ) ( ON-TABLE ?auto_162551 ) ( ON ?auto_162552 ?auto_162551 ) ( not ( = ?auto_162551 ?auto_162552 ) ) ( not ( = ?auto_162551 ?auto_162554 ) ) ( not ( = ?auto_162552 ?auto_162554 ) ) ( CLEAR ?auto_162555 ) ( not ( = ?auto_162551 ?auto_162553 ) ) ( not ( = ?auto_162551 ?auto_162555 ) ) ( not ( = ?auto_162552 ?auto_162553 ) ) ( not ( = ?auto_162552 ?auto_162555 ) ) ( not ( = ?auto_162554 ?auto_162553 ) ) ( not ( = ?auto_162554 ?auto_162555 ) ) ( not ( = ?auto_162553 ?auto_162555 ) ) ( ON ?auto_162553 ?auto_162554 ) ( CLEAR ?auto_162553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162551 ?auto_162552 ?auto_162554 )
      ( MAKE-2PILE ?auto_162551 ?auto_162552 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_162556 - BLOCK
      ?auto_162557 - BLOCK
    )
    :vars
    (
      ?auto_162560 - BLOCK
      ?auto_162558 - BLOCK
      ?auto_162559 - BLOCK
      ?auto_162561 - BLOCK
      ?auto_162562 - BLOCK
      ?auto_162564 - BLOCK
      ?auto_162563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162560 ?auto_162557 ) ( ON-TABLE ?auto_162556 ) ( ON ?auto_162557 ?auto_162556 ) ( not ( = ?auto_162556 ?auto_162557 ) ) ( not ( = ?auto_162556 ?auto_162560 ) ) ( not ( = ?auto_162557 ?auto_162560 ) ) ( not ( = ?auto_162556 ?auto_162558 ) ) ( not ( = ?auto_162556 ?auto_162559 ) ) ( not ( = ?auto_162557 ?auto_162558 ) ) ( not ( = ?auto_162557 ?auto_162559 ) ) ( not ( = ?auto_162560 ?auto_162558 ) ) ( not ( = ?auto_162560 ?auto_162559 ) ) ( not ( = ?auto_162558 ?auto_162559 ) ) ( ON ?auto_162558 ?auto_162560 ) ( CLEAR ?auto_162558 ) ( HOLDING ?auto_162559 ) ( CLEAR ?auto_162561 ) ( ON-TABLE ?auto_162562 ) ( ON ?auto_162564 ?auto_162562 ) ( ON ?auto_162563 ?auto_162564 ) ( ON ?auto_162561 ?auto_162563 ) ( not ( = ?auto_162562 ?auto_162564 ) ) ( not ( = ?auto_162562 ?auto_162563 ) ) ( not ( = ?auto_162562 ?auto_162561 ) ) ( not ( = ?auto_162562 ?auto_162559 ) ) ( not ( = ?auto_162564 ?auto_162563 ) ) ( not ( = ?auto_162564 ?auto_162561 ) ) ( not ( = ?auto_162564 ?auto_162559 ) ) ( not ( = ?auto_162563 ?auto_162561 ) ) ( not ( = ?auto_162563 ?auto_162559 ) ) ( not ( = ?auto_162561 ?auto_162559 ) ) ( not ( = ?auto_162556 ?auto_162561 ) ) ( not ( = ?auto_162556 ?auto_162562 ) ) ( not ( = ?auto_162556 ?auto_162564 ) ) ( not ( = ?auto_162556 ?auto_162563 ) ) ( not ( = ?auto_162557 ?auto_162561 ) ) ( not ( = ?auto_162557 ?auto_162562 ) ) ( not ( = ?auto_162557 ?auto_162564 ) ) ( not ( = ?auto_162557 ?auto_162563 ) ) ( not ( = ?auto_162560 ?auto_162561 ) ) ( not ( = ?auto_162560 ?auto_162562 ) ) ( not ( = ?auto_162560 ?auto_162564 ) ) ( not ( = ?auto_162560 ?auto_162563 ) ) ( not ( = ?auto_162558 ?auto_162561 ) ) ( not ( = ?auto_162558 ?auto_162562 ) ) ( not ( = ?auto_162558 ?auto_162564 ) ) ( not ( = ?auto_162558 ?auto_162563 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162562 ?auto_162564 ?auto_162563 ?auto_162561 ?auto_162559 )
      ( MAKE-2PILE ?auto_162556 ?auto_162557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_162565 - BLOCK
      ?auto_162566 - BLOCK
    )
    :vars
    (
      ?auto_162569 - BLOCK
      ?auto_162572 - BLOCK
      ?auto_162570 - BLOCK
      ?auto_162568 - BLOCK
      ?auto_162567 - BLOCK
      ?auto_162571 - BLOCK
      ?auto_162573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162569 ?auto_162566 ) ( ON-TABLE ?auto_162565 ) ( ON ?auto_162566 ?auto_162565 ) ( not ( = ?auto_162565 ?auto_162566 ) ) ( not ( = ?auto_162565 ?auto_162569 ) ) ( not ( = ?auto_162566 ?auto_162569 ) ) ( not ( = ?auto_162565 ?auto_162572 ) ) ( not ( = ?auto_162565 ?auto_162570 ) ) ( not ( = ?auto_162566 ?auto_162572 ) ) ( not ( = ?auto_162566 ?auto_162570 ) ) ( not ( = ?auto_162569 ?auto_162572 ) ) ( not ( = ?auto_162569 ?auto_162570 ) ) ( not ( = ?auto_162572 ?auto_162570 ) ) ( ON ?auto_162572 ?auto_162569 ) ( CLEAR ?auto_162568 ) ( ON-TABLE ?auto_162567 ) ( ON ?auto_162571 ?auto_162567 ) ( ON ?auto_162573 ?auto_162571 ) ( ON ?auto_162568 ?auto_162573 ) ( not ( = ?auto_162567 ?auto_162571 ) ) ( not ( = ?auto_162567 ?auto_162573 ) ) ( not ( = ?auto_162567 ?auto_162568 ) ) ( not ( = ?auto_162567 ?auto_162570 ) ) ( not ( = ?auto_162571 ?auto_162573 ) ) ( not ( = ?auto_162571 ?auto_162568 ) ) ( not ( = ?auto_162571 ?auto_162570 ) ) ( not ( = ?auto_162573 ?auto_162568 ) ) ( not ( = ?auto_162573 ?auto_162570 ) ) ( not ( = ?auto_162568 ?auto_162570 ) ) ( not ( = ?auto_162565 ?auto_162568 ) ) ( not ( = ?auto_162565 ?auto_162567 ) ) ( not ( = ?auto_162565 ?auto_162571 ) ) ( not ( = ?auto_162565 ?auto_162573 ) ) ( not ( = ?auto_162566 ?auto_162568 ) ) ( not ( = ?auto_162566 ?auto_162567 ) ) ( not ( = ?auto_162566 ?auto_162571 ) ) ( not ( = ?auto_162566 ?auto_162573 ) ) ( not ( = ?auto_162569 ?auto_162568 ) ) ( not ( = ?auto_162569 ?auto_162567 ) ) ( not ( = ?auto_162569 ?auto_162571 ) ) ( not ( = ?auto_162569 ?auto_162573 ) ) ( not ( = ?auto_162572 ?auto_162568 ) ) ( not ( = ?auto_162572 ?auto_162567 ) ) ( not ( = ?auto_162572 ?auto_162571 ) ) ( not ( = ?auto_162572 ?auto_162573 ) ) ( ON ?auto_162570 ?auto_162572 ) ( CLEAR ?auto_162570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162565 ?auto_162566 ?auto_162569 ?auto_162572 )
      ( MAKE-2PILE ?auto_162565 ?auto_162566 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_162574 - BLOCK
      ?auto_162575 - BLOCK
    )
    :vars
    (
      ?auto_162577 - BLOCK
      ?auto_162581 - BLOCK
      ?auto_162579 - BLOCK
      ?auto_162580 - BLOCK
      ?auto_162578 - BLOCK
      ?auto_162582 - BLOCK
      ?auto_162576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162577 ?auto_162575 ) ( ON-TABLE ?auto_162574 ) ( ON ?auto_162575 ?auto_162574 ) ( not ( = ?auto_162574 ?auto_162575 ) ) ( not ( = ?auto_162574 ?auto_162577 ) ) ( not ( = ?auto_162575 ?auto_162577 ) ) ( not ( = ?auto_162574 ?auto_162581 ) ) ( not ( = ?auto_162574 ?auto_162579 ) ) ( not ( = ?auto_162575 ?auto_162581 ) ) ( not ( = ?auto_162575 ?auto_162579 ) ) ( not ( = ?auto_162577 ?auto_162581 ) ) ( not ( = ?auto_162577 ?auto_162579 ) ) ( not ( = ?auto_162581 ?auto_162579 ) ) ( ON ?auto_162581 ?auto_162577 ) ( ON-TABLE ?auto_162580 ) ( ON ?auto_162578 ?auto_162580 ) ( ON ?auto_162582 ?auto_162578 ) ( not ( = ?auto_162580 ?auto_162578 ) ) ( not ( = ?auto_162580 ?auto_162582 ) ) ( not ( = ?auto_162580 ?auto_162576 ) ) ( not ( = ?auto_162580 ?auto_162579 ) ) ( not ( = ?auto_162578 ?auto_162582 ) ) ( not ( = ?auto_162578 ?auto_162576 ) ) ( not ( = ?auto_162578 ?auto_162579 ) ) ( not ( = ?auto_162582 ?auto_162576 ) ) ( not ( = ?auto_162582 ?auto_162579 ) ) ( not ( = ?auto_162576 ?auto_162579 ) ) ( not ( = ?auto_162574 ?auto_162576 ) ) ( not ( = ?auto_162574 ?auto_162580 ) ) ( not ( = ?auto_162574 ?auto_162578 ) ) ( not ( = ?auto_162574 ?auto_162582 ) ) ( not ( = ?auto_162575 ?auto_162576 ) ) ( not ( = ?auto_162575 ?auto_162580 ) ) ( not ( = ?auto_162575 ?auto_162578 ) ) ( not ( = ?auto_162575 ?auto_162582 ) ) ( not ( = ?auto_162577 ?auto_162576 ) ) ( not ( = ?auto_162577 ?auto_162580 ) ) ( not ( = ?auto_162577 ?auto_162578 ) ) ( not ( = ?auto_162577 ?auto_162582 ) ) ( not ( = ?auto_162581 ?auto_162576 ) ) ( not ( = ?auto_162581 ?auto_162580 ) ) ( not ( = ?auto_162581 ?auto_162578 ) ) ( not ( = ?auto_162581 ?auto_162582 ) ) ( ON ?auto_162579 ?auto_162581 ) ( CLEAR ?auto_162579 ) ( HOLDING ?auto_162576 ) ( CLEAR ?auto_162582 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162580 ?auto_162578 ?auto_162582 ?auto_162576 )
      ( MAKE-2PILE ?auto_162574 ?auto_162575 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_162583 - BLOCK
      ?auto_162584 - BLOCK
    )
    :vars
    (
      ?auto_162585 - BLOCK
      ?auto_162587 - BLOCK
      ?auto_162590 - BLOCK
      ?auto_162591 - BLOCK
      ?auto_162588 - BLOCK
      ?auto_162589 - BLOCK
      ?auto_162586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162585 ?auto_162584 ) ( ON-TABLE ?auto_162583 ) ( ON ?auto_162584 ?auto_162583 ) ( not ( = ?auto_162583 ?auto_162584 ) ) ( not ( = ?auto_162583 ?auto_162585 ) ) ( not ( = ?auto_162584 ?auto_162585 ) ) ( not ( = ?auto_162583 ?auto_162587 ) ) ( not ( = ?auto_162583 ?auto_162590 ) ) ( not ( = ?auto_162584 ?auto_162587 ) ) ( not ( = ?auto_162584 ?auto_162590 ) ) ( not ( = ?auto_162585 ?auto_162587 ) ) ( not ( = ?auto_162585 ?auto_162590 ) ) ( not ( = ?auto_162587 ?auto_162590 ) ) ( ON ?auto_162587 ?auto_162585 ) ( ON-TABLE ?auto_162591 ) ( ON ?auto_162588 ?auto_162591 ) ( ON ?auto_162589 ?auto_162588 ) ( not ( = ?auto_162591 ?auto_162588 ) ) ( not ( = ?auto_162591 ?auto_162589 ) ) ( not ( = ?auto_162591 ?auto_162586 ) ) ( not ( = ?auto_162591 ?auto_162590 ) ) ( not ( = ?auto_162588 ?auto_162589 ) ) ( not ( = ?auto_162588 ?auto_162586 ) ) ( not ( = ?auto_162588 ?auto_162590 ) ) ( not ( = ?auto_162589 ?auto_162586 ) ) ( not ( = ?auto_162589 ?auto_162590 ) ) ( not ( = ?auto_162586 ?auto_162590 ) ) ( not ( = ?auto_162583 ?auto_162586 ) ) ( not ( = ?auto_162583 ?auto_162591 ) ) ( not ( = ?auto_162583 ?auto_162588 ) ) ( not ( = ?auto_162583 ?auto_162589 ) ) ( not ( = ?auto_162584 ?auto_162586 ) ) ( not ( = ?auto_162584 ?auto_162591 ) ) ( not ( = ?auto_162584 ?auto_162588 ) ) ( not ( = ?auto_162584 ?auto_162589 ) ) ( not ( = ?auto_162585 ?auto_162586 ) ) ( not ( = ?auto_162585 ?auto_162591 ) ) ( not ( = ?auto_162585 ?auto_162588 ) ) ( not ( = ?auto_162585 ?auto_162589 ) ) ( not ( = ?auto_162587 ?auto_162586 ) ) ( not ( = ?auto_162587 ?auto_162591 ) ) ( not ( = ?auto_162587 ?auto_162588 ) ) ( not ( = ?auto_162587 ?auto_162589 ) ) ( ON ?auto_162590 ?auto_162587 ) ( CLEAR ?auto_162589 ) ( ON ?auto_162586 ?auto_162590 ) ( CLEAR ?auto_162586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162583 ?auto_162584 ?auto_162585 ?auto_162587 ?auto_162590 )
      ( MAKE-2PILE ?auto_162583 ?auto_162584 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_162592 - BLOCK
      ?auto_162593 - BLOCK
    )
    :vars
    (
      ?auto_162596 - BLOCK
      ?auto_162594 - BLOCK
      ?auto_162598 - BLOCK
      ?auto_162599 - BLOCK
      ?auto_162595 - BLOCK
      ?auto_162597 - BLOCK
      ?auto_162600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162596 ?auto_162593 ) ( ON-TABLE ?auto_162592 ) ( ON ?auto_162593 ?auto_162592 ) ( not ( = ?auto_162592 ?auto_162593 ) ) ( not ( = ?auto_162592 ?auto_162596 ) ) ( not ( = ?auto_162593 ?auto_162596 ) ) ( not ( = ?auto_162592 ?auto_162594 ) ) ( not ( = ?auto_162592 ?auto_162598 ) ) ( not ( = ?auto_162593 ?auto_162594 ) ) ( not ( = ?auto_162593 ?auto_162598 ) ) ( not ( = ?auto_162596 ?auto_162594 ) ) ( not ( = ?auto_162596 ?auto_162598 ) ) ( not ( = ?auto_162594 ?auto_162598 ) ) ( ON ?auto_162594 ?auto_162596 ) ( ON-TABLE ?auto_162599 ) ( ON ?auto_162595 ?auto_162599 ) ( not ( = ?auto_162599 ?auto_162595 ) ) ( not ( = ?auto_162599 ?auto_162597 ) ) ( not ( = ?auto_162599 ?auto_162600 ) ) ( not ( = ?auto_162599 ?auto_162598 ) ) ( not ( = ?auto_162595 ?auto_162597 ) ) ( not ( = ?auto_162595 ?auto_162600 ) ) ( not ( = ?auto_162595 ?auto_162598 ) ) ( not ( = ?auto_162597 ?auto_162600 ) ) ( not ( = ?auto_162597 ?auto_162598 ) ) ( not ( = ?auto_162600 ?auto_162598 ) ) ( not ( = ?auto_162592 ?auto_162600 ) ) ( not ( = ?auto_162592 ?auto_162599 ) ) ( not ( = ?auto_162592 ?auto_162595 ) ) ( not ( = ?auto_162592 ?auto_162597 ) ) ( not ( = ?auto_162593 ?auto_162600 ) ) ( not ( = ?auto_162593 ?auto_162599 ) ) ( not ( = ?auto_162593 ?auto_162595 ) ) ( not ( = ?auto_162593 ?auto_162597 ) ) ( not ( = ?auto_162596 ?auto_162600 ) ) ( not ( = ?auto_162596 ?auto_162599 ) ) ( not ( = ?auto_162596 ?auto_162595 ) ) ( not ( = ?auto_162596 ?auto_162597 ) ) ( not ( = ?auto_162594 ?auto_162600 ) ) ( not ( = ?auto_162594 ?auto_162599 ) ) ( not ( = ?auto_162594 ?auto_162595 ) ) ( not ( = ?auto_162594 ?auto_162597 ) ) ( ON ?auto_162598 ?auto_162594 ) ( ON ?auto_162600 ?auto_162598 ) ( CLEAR ?auto_162600 ) ( HOLDING ?auto_162597 ) ( CLEAR ?auto_162595 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162599 ?auto_162595 ?auto_162597 )
      ( MAKE-2PILE ?auto_162592 ?auto_162593 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_162601 - BLOCK
      ?auto_162602 - BLOCK
    )
    :vars
    (
      ?auto_162608 - BLOCK
      ?auto_162605 - BLOCK
      ?auto_162607 - BLOCK
      ?auto_162606 - BLOCK
      ?auto_162604 - BLOCK
      ?auto_162603 - BLOCK
      ?auto_162609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162608 ?auto_162602 ) ( ON-TABLE ?auto_162601 ) ( ON ?auto_162602 ?auto_162601 ) ( not ( = ?auto_162601 ?auto_162602 ) ) ( not ( = ?auto_162601 ?auto_162608 ) ) ( not ( = ?auto_162602 ?auto_162608 ) ) ( not ( = ?auto_162601 ?auto_162605 ) ) ( not ( = ?auto_162601 ?auto_162607 ) ) ( not ( = ?auto_162602 ?auto_162605 ) ) ( not ( = ?auto_162602 ?auto_162607 ) ) ( not ( = ?auto_162608 ?auto_162605 ) ) ( not ( = ?auto_162608 ?auto_162607 ) ) ( not ( = ?auto_162605 ?auto_162607 ) ) ( ON ?auto_162605 ?auto_162608 ) ( ON-TABLE ?auto_162606 ) ( ON ?auto_162604 ?auto_162606 ) ( not ( = ?auto_162606 ?auto_162604 ) ) ( not ( = ?auto_162606 ?auto_162603 ) ) ( not ( = ?auto_162606 ?auto_162609 ) ) ( not ( = ?auto_162606 ?auto_162607 ) ) ( not ( = ?auto_162604 ?auto_162603 ) ) ( not ( = ?auto_162604 ?auto_162609 ) ) ( not ( = ?auto_162604 ?auto_162607 ) ) ( not ( = ?auto_162603 ?auto_162609 ) ) ( not ( = ?auto_162603 ?auto_162607 ) ) ( not ( = ?auto_162609 ?auto_162607 ) ) ( not ( = ?auto_162601 ?auto_162609 ) ) ( not ( = ?auto_162601 ?auto_162606 ) ) ( not ( = ?auto_162601 ?auto_162604 ) ) ( not ( = ?auto_162601 ?auto_162603 ) ) ( not ( = ?auto_162602 ?auto_162609 ) ) ( not ( = ?auto_162602 ?auto_162606 ) ) ( not ( = ?auto_162602 ?auto_162604 ) ) ( not ( = ?auto_162602 ?auto_162603 ) ) ( not ( = ?auto_162608 ?auto_162609 ) ) ( not ( = ?auto_162608 ?auto_162606 ) ) ( not ( = ?auto_162608 ?auto_162604 ) ) ( not ( = ?auto_162608 ?auto_162603 ) ) ( not ( = ?auto_162605 ?auto_162609 ) ) ( not ( = ?auto_162605 ?auto_162606 ) ) ( not ( = ?auto_162605 ?auto_162604 ) ) ( not ( = ?auto_162605 ?auto_162603 ) ) ( ON ?auto_162607 ?auto_162605 ) ( ON ?auto_162609 ?auto_162607 ) ( CLEAR ?auto_162604 ) ( ON ?auto_162603 ?auto_162609 ) ( CLEAR ?auto_162603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162601 ?auto_162602 ?auto_162608 ?auto_162605 ?auto_162607 ?auto_162609 )
      ( MAKE-2PILE ?auto_162601 ?auto_162602 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_162610 - BLOCK
      ?auto_162611 - BLOCK
    )
    :vars
    (
      ?auto_162615 - BLOCK
      ?auto_162614 - BLOCK
      ?auto_162612 - BLOCK
      ?auto_162616 - BLOCK
      ?auto_162618 - BLOCK
      ?auto_162613 - BLOCK
      ?auto_162617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162615 ?auto_162611 ) ( ON-TABLE ?auto_162610 ) ( ON ?auto_162611 ?auto_162610 ) ( not ( = ?auto_162610 ?auto_162611 ) ) ( not ( = ?auto_162610 ?auto_162615 ) ) ( not ( = ?auto_162611 ?auto_162615 ) ) ( not ( = ?auto_162610 ?auto_162614 ) ) ( not ( = ?auto_162610 ?auto_162612 ) ) ( not ( = ?auto_162611 ?auto_162614 ) ) ( not ( = ?auto_162611 ?auto_162612 ) ) ( not ( = ?auto_162615 ?auto_162614 ) ) ( not ( = ?auto_162615 ?auto_162612 ) ) ( not ( = ?auto_162614 ?auto_162612 ) ) ( ON ?auto_162614 ?auto_162615 ) ( ON-TABLE ?auto_162616 ) ( not ( = ?auto_162616 ?auto_162618 ) ) ( not ( = ?auto_162616 ?auto_162613 ) ) ( not ( = ?auto_162616 ?auto_162617 ) ) ( not ( = ?auto_162616 ?auto_162612 ) ) ( not ( = ?auto_162618 ?auto_162613 ) ) ( not ( = ?auto_162618 ?auto_162617 ) ) ( not ( = ?auto_162618 ?auto_162612 ) ) ( not ( = ?auto_162613 ?auto_162617 ) ) ( not ( = ?auto_162613 ?auto_162612 ) ) ( not ( = ?auto_162617 ?auto_162612 ) ) ( not ( = ?auto_162610 ?auto_162617 ) ) ( not ( = ?auto_162610 ?auto_162616 ) ) ( not ( = ?auto_162610 ?auto_162618 ) ) ( not ( = ?auto_162610 ?auto_162613 ) ) ( not ( = ?auto_162611 ?auto_162617 ) ) ( not ( = ?auto_162611 ?auto_162616 ) ) ( not ( = ?auto_162611 ?auto_162618 ) ) ( not ( = ?auto_162611 ?auto_162613 ) ) ( not ( = ?auto_162615 ?auto_162617 ) ) ( not ( = ?auto_162615 ?auto_162616 ) ) ( not ( = ?auto_162615 ?auto_162618 ) ) ( not ( = ?auto_162615 ?auto_162613 ) ) ( not ( = ?auto_162614 ?auto_162617 ) ) ( not ( = ?auto_162614 ?auto_162616 ) ) ( not ( = ?auto_162614 ?auto_162618 ) ) ( not ( = ?auto_162614 ?auto_162613 ) ) ( ON ?auto_162612 ?auto_162614 ) ( ON ?auto_162617 ?auto_162612 ) ( ON ?auto_162613 ?auto_162617 ) ( CLEAR ?auto_162613 ) ( HOLDING ?auto_162618 ) ( CLEAR ?auto_162616 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162616 ?auto_162618 )
      ( MAKE-2PILE ?auto_162610 ?auto_162611 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164637 - BLOCK
      ?auto_164638 - BLOCK
    )
    :vars
    (
      ?auto_164643 - BLOCK
      ?auto_164641 - BLOCK
      ?auto_164639 - BLOCK
      ?auto_164642 - BLOCK
      ?auto_164640 - BLOCK
      ?auto_164644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164643 ?auto_164638 ) ( ON-TABLE ?auto_164637 ) ( ON ?auto_164638 ?auto_164637 ) ( not ( = ?auto_164637 ?auto_164638 ) ) ( not ( = ?auto_164637 ?auto_164643 ) ) ( not ( = ?auto_164638 ?auto_164643 ) ) ( not ( = ?auto_164637 ?auto_164641 ) ) ( not ( = ?auto_164637 ?auto_164639 ) ) ( not ( = ?auto_164638 ?auto_164641 ) ) ( not ( = ?auto_164638 ?auto_164639 ) ) ( not ( = ?auto_164643 ?auto_164641 ) ) ( not ( = ?auto_164643 ?auto_164639 ) ) ( not ( = ?auto_164641 ?auto_164639 ) ) ( ON ?auto_164641 ?auto_164643 ) ( not ( = ?auto_164642 ?auto_164640 ) ) ( not ( = ?auto_164642 ?auto_164644 ) ) ( not ( = ?auto_164642 ?auto_164639 ) ) ( not ( = ?auto_164640 ?auto_164644 ) ) ( not ( = ?auto_164640 ?auto_164639 ) ) ( not ( = ?auto_164644 ?auto_164639 ) ) ( not ( = ?auto_164637 ?auto_164644 ) ) ( not ( = ?auto_164637 ?auto_164642 ) ) ( not ( = ?auto_164637 ?auto_164640 ) ) ( not ( = ?auto_164638 ?auto_164644 ) ) ( not ( = ?auto_164638 ?auto_164642 ) ) ( not ( = ?auto_164638 ?auto_164640 ) ) ( not ( = ?auto_164643 ?auto_164644 ) ) ( not ( = ?auto_164643 ?auto_164642 ) ) ( not ( = ?auto_164643 ?auto_164640 ) ) ( not ( = ?auto_164641 ?auto_164644 ) ) ( not ( = ?auto_164641 ?auto_164642 ) ) ( not ( = ?auto_164641 ?auto_164640 ) ) ( ON ?auto_164639 ?auto_164641 ) ( ON ?auto_164644 ?auto_164639 ) ( ON ?auto_164640 ?auto_164644 ) ( ON ?auto_164642 ?auto_164640 ) ( CLEAR ?auto_164642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164637 ?auto_164638 ?auto_164643 ?auto_164641 ?auto_164639 ?auto_164644 ?auto_164640 )
      ( MAKE-2PILE ?auto_164637 ?auto_164638 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_162628 - BLOCK
      ?auto_162629 - BLOCK
    )
    :vars
    (
      ?auto_162635 - BLOCK
      ?auto_162634 - BLOCK
      ?auto_162631 - BLOCK
      ?auto_162632 - BLOCK
      ?auto_162636 - BLOCK
      ?auto_162633 - BLOCK
      ?auto_162630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162635 ?auto_162629 ) ( ON-TABLE ?auto_162628 ) ( ON ?auto_162629 ?auto_162628 ) ( not ( = ?auto_162628 ?auto_162629 ) ) ( not ( = ?auto_162628 ?auto_162635 ) ) ( not ( = ?auto_162629 ?auto_162635 ) ) ( not ( = ?auto_162628 ?auto_162634 ) ) ( not ( = ?auto_162628 ?auto_162631 ) ) ( not ( = ?auto_162629 ?auto_162634 ) ) ( not ( = ?auto_162629 ?auto_162631 ) ) ( not ( = ?auto_162635 ?auto_162634 ) ) ( not ( = ?auto_162635 ?auto_162631 ) ) ( not ( = ?auto_162634 ?auto_162631 ) ) ( ON ?auto_162634 ?auto_162635 ) ( not ( = ?auto_162632 ?auto_162636 ) ) ( not ( = ?auto_162632 ?auto_162633 ) ) ( not ( = ?auto_162632 ?auto_162630 ) ) ( not ( = ?auto_162632 ?auto_162631 ) ) ( not ( = ?auto_162636 ?auto_162633 ) ) ( not ( = ?auto_162636 ?auto_162630 ) ) ( not ( = ?auto_162636 ?auto_162631 ) ) ( not ( = ?auto_162633 ?auto_162630 ) ) ( not ( = ?auto_162633 ?auto_162631 ) ) ( not ( = ?auto_162630 ?auto_162631 ) ) ( not ( = ?auto_162628 ?auto_162630 ) ) ( not ( = ?auto_162628 ?auto_162632 ) ) ( not ( = ?auto_162628 ?auto_162636 ) ) ( not ( = ?auto_162628 ?auto_162633 ) ) ( not ( = ?auto_162629 ?auto_162630 ) ) ( not ( = ?auto_162629 ?auto_162632 ) ) ( not ( = ?auto_162629 ?auto_162636 ) ) ( not ( = ?auto_162629 ?auto_162633 ) ) ( not ( = ?auto_162635 ?auto_162630 ) ) ( not ( = ?auto_162635 ?auto_162632 ) ) ( not ( = ?auto_162635 ?auto_162636 ) ) ( not ( = ?auto_162635 ?auto_162633 ) ) ( not ( = ?auto_162634 ?auto_162630 ) ) ( not ( = ?auto_162634 ?auto_162632 ) ) ( not ( = ?auto_162634 ?auto_162636 ) ) ( not ( = ?auto_162634 ?auto_162633 ) ) ( ON ?auto_162631 ?auto_162634 ) ( ON ?auto_162630 ?auto_162631 ) ( ON ?auto_162633 ?auto_162630 ) ( ON ?auto_162636 ?auto_162633 ) ( CLEAR ?auto_162636 ) ( HOLDING ?auto_162632 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162632 )
      ( MAKE-2PILE ?auto_162628 ?auto_162629 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_162637 - BLOCK
      ?auto_162638 - BLOCK
    )
    :vars
    (
      ?auto_162641 - BLOCK
      ?auto_162643 - BLOCK
      ?auto_162644 - BLOCK
      ?auto_162640 - BLOCK
      ?auto_162642 - BLOCK
      ?auto_162645 - BLOCK
      ?auto_162639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162641 ?auto_162638 ) ( ON-TABLE ?auto_162637 ) ( ON ?auto_162638 ?auto_162637 ) ( not ( = ?auto_162637 ?auto_162638 ) ) ( not ( = ?auto_162637 ?auto_162641 ) ) ( not ( = ?auto_162638 ?auto_162641 ) ) ( not ( = ?auto_162637 ?auto_162643 ) ) ( not ( = ?auto_162637 ?auto_162644 ) ) ( not ( = ?auto_162638 ?auto_162643 ) ) ( not ( = ?auto_162638 ?auto_162644 ) ) ( not ( = ?auto_162641 ?auto_162643 ) ) ( not ( = ?auto_162641 ?auto_162644 ) ) ( not ( = ?auto_162643 ?auto_162644 ) ) ( ON ?auto_162643 ?auto_162641 ) ( not ( = ?auto_162640 ?auto_162642 ) ) ( not ( = ?auto_162640 ?auto_162645 ) ) ( not ( = ?auto_162640 ?auto_162639 ) ) ( not ( = ?auto_162640 ?auto_162644 ) ) ( not ( = ?auto_162642 ?auto_162645 ) ) ( not ( = ?auto_162642 ?auto_162639 ) ) ( not ( = ?auto_162642 ?auto_162644 ) ) ( not ( = ?auto_162645 ?auto_162639 ) ) ( not ( = ?auto_162645 ?auto_162644 ) ) ( not ( = ?auto_162639 ?auto_162644 ) ) ( not ( = ?auto_162637 ?auto_162639 ) ) ( not ( = ?auto_162637 ?auto_162640 ) ) ( not ( = ?auto_162637 ?auto_162642 ) ) ( not ( = ?auto_162637 ?auto_162645 ) ) ( not ( = ?auto_162638 ?auto_162639 ) ) ( not ( = ?auto_162638 ?auto_162640 ) ) ( not ( = ?auto_162638 ?auto_162642 ) ) ( not ( = ?auto_162638 ?auto_162645 ) ) ( not ( = ?auto_162641 ?auto_162639 ) ) ( not ( = ?auto_162641 ?auto_162640 ) ) ( not ( = ?auto_162641 ?auto_162642 ) ) ( not ( = ?auto_162641 ?auto_162645 ) ) ( not ( = ?auto_162643 ?auto_162639 ) ) ( not ( = ?auto_162643 ?auto_162640 ) ) ( not ( = ?auto_162643 ?auto_162642 ) ) ( not ( = ?auto_162643 ?auto_162645 ) ) ( ON ?auto_162644 ?auto_162643 ) ( ON ?auto_162639 ?auto_162644 ) ( ON ?auto_162645 ?auto_162639 ) ( ON ?auto_162642 ?auto_162645 ) ( ON ?auto_162640 ?auto_162642 ) ( CLEAR ?auto_162640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162637 ?auto_162638 ?auto_162641 ?auto_162643 ?auto_162644 ?auto_162639 ?auto_162645 ?auto_162642 )
      ( MAKE-2PILE ?auto_162637 ?auto_162638 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162653 - BLOCK
      ?auto_162654 - BLOCK
      ?auto_162655 - BLOCK
      ?auto_162656 - BLOCK
      ?auto_162657 - BLOCK
      ?auto_162658 - BLOCK
      ?auto_162659 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_162659 ) ( CLEAR ?auto_162658 ) ( ON-TABLE ?auto_162653 ) ( ON ?auto_162654 ?auto_162653 ) ( ON ?auto_162655 ?auto_162654 ) ( ON ?auto_162656 ?auto_162655 ) ( ON ?auto_162657 ?auto_162656 ) ( ON ?auto_162658 ?auto_162657 ) ( not ( = ?auto_162653 ?auto_162654 ) ) ( not ( = ?auto_162653 ?auto_162655 ) ) ( not ( = ?auto_162653 ?auto_162656 ) ) ( not ( = ?auto_162653 ?auto_162657 ) ) ( not ( = ?auto_162653 ?auto_162658 ) ) ( not ( = ?auto_162653 ?auto_162659 ) ) ( not ( = ?auto_162654 ?auto_162655 ) ) ( not ( = ?auto_162654 ?auto_162656 ) ) ( not ( = ?auto_162654 ?auto_162657 ) ) ( not ( = ?auto_162654 ?auto_162658 ) ) ( not ( = ?auto_162654 ?auto_162659 ) ) ( not ( = ?auto_162655 ?auto_162656 ) ) ( not ( = ?auto_162655 ?auto_162657 ) ) ( not ( = ?auto_162655 ?auto_162658 ) ) ( not ( = ?auto_162655 ?auto_162659 ) ) ( not ( = ?auto_162656 ?auto_162657 ) ) ( not ( = ?auto_162656 ?auto_162658 ) ) ( not ( = ?auto_162656 ?auto_162659 ) ) ( not ( = ?auto_162657 ?auto_162658 ) ) ( not ( = ?auto_162657 ?auto_162659 ) ) ( not ( = ?auto_162658 ?auto_162659 ) ) )
    :subtasks
    ( ( !STACK ?auto_162659 ?auto_162658 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162660 - BLOCK
      ?auto_162661 - BLOCK
      ?auto_162662 - BLOCK
      ?auto_162663 - BLOCK
      ?auto_162664 - BLOCK
      ?auto_162665 - BLOCK
      ?auto_162666 - BLOCK
    )
    :vars
    (
      ?auto_162667 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162665 ) ( ON-TABLE ?auto_162660 ) ( ON ?auto_162661 ?auto_162660 ) ( ON ?auto_162662 ?auto_162661 ) ( ON ?auto_162663 ?auto_162662 ) ( ON ?auto_162664 ?auto_162663 ) ( ON ?auto_162665 ?auto_162664 ) ( not ( = ?auto_162660 ?auto_162661 ) ) ( not ( = ?auto_162660 ?auto_162662 ) ) ( not ( = ?auto_162660 ?auto_162663 ) ) ( not ( = ?auto_162660 ?auto_162664 ) ) ( not ( = ?auto_162660 ?auto_162665 ) ) ( not ( = ?auto_162660 ?auto_162666 ) ) ( not ( = ?auto_162661 ?auto_162662 ) ) ( not ( = ?auto_162661 ?auto_162663 ) ) ( not ( = ?auto_162661 ?auto_162664 ) ) ( not ( = ?auto_162661 ?auto_162665 ) ) ( not ( = ?auto_162661 ?auto_162666 ) ) ( not ( = ?auto_162662 ?auto_162663 ) ) ( not ( = ?auto_162662 ?auto_162664 ) ) ( not ( = ?auto_162662 ?auto_162665 ) ) ( not ( = ?auto_162662 ?auto_162666 ) ) ( not ( = ?auto_162663 ?auto_162664 ) ) ( not ( = ?auto_162663 ?auto_162665 ) ) ( not ( = ?auto_162663 ?auto_162666 ) ) ( not ( = ?auto_162664 ?auto_162665 ) ) ( not ( = ?auto_162664 ?auto_162666 ) ) ( not ( = ?auto_162665 ?auto_162666 ) ) ( ON ?auto_162666 ?auto_162667 ) ( CLEAR ?auto_162666 ) ( HAND-EMPTY ) ( not ( = ?auto_162660 ?auto_162667 ) ) ( not ( = ?auto_162661 ?auto_162667 ) ) ( not ( = ?auto_162662 ?auto_162667 ) ) ( not ( = ?auto_162663 ?auto_162667 ) ) ( not ( = ?auto_162664 ?auto_162667 ) ) ( not ( = ?auto_162665 ?auto_162667 ) ) ( not ( = ?auto_162666 ?auto_162667 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162666 ?auto_162667 )
      ( MAKE-7PILE ?auto_162660 ?auto_162661 ?auto_162662 ?auto_162663 ?auto_162664 ?auto_162665 ?auto_162666 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162668 - BLOCK
      ?auto_162669 - BLOCK
      ?auto_162670 - BLOCK
      ?auto_162671 - BLOCK
      ?auto_162672 - BLOCK
      ?auto_162673 - BLOCK
      ?auto_162674 - BLOCK
    )
    :vars
    (
      ?auto_162675 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162668 ) ( ON ?auto_162669 ?auto_162668 ) ( ON ?auto_162670 ?auto_162669 ) ( ON ?auto_162671 ?auto_162670 ) ( ON ?auto_162672 ?auto_162671 ) ( not ( = ?auto_162668 ?auto_162669 ) ) ( not ( = ?auto_162668 ?auto_162670 ) ) ( not ( = ?auto_162668 ?auto_162671 ) ) ( not ( = ?auto_162668 ?auto_162672 ) ) ( not ( = ?auto_162668 ?auto_162673 ) ) ( not ( = ?auto_162668 ?auto_162674 ) ) ( not ( = ?auto_162669 ?auto_162670 ) ) ( not ( = ?auto_162669 ?auto_162671 ) ) ( not ( = ?auto_162669 ?auto_162672 ) ) ( not ( = ?auto_162669 ?auto_162673 ) ) ( not ( = ?auto_162669 ?auto_162674 ) ) ( not ( = ?auto_162670 ?auto_162671 ) ) ( not ( = ?auto_162670 ?auto_162672 ) ) ( not ( = ?auto_162670 ?auto_162673 ) ) ( not ( = ?auto_162670 ?auto_162674 ) ) ( not ( = ?auto_162671 ?auto_162672 ) ) ( not ( = ?auto_162671 ?auto_162673 ) ) ( not ( = ?auto_162671 ?auto_162674 ) ) ( not ( = ?auto_162672 ?auto_162673 ) ) ( not ( = ?auto_162672 ?auto_162674 ) ) ( not ( = ?auto_162673 ?auto_162674 ) ) ( ON ?auto_162674 ?auto_162675 ) ( CLEAR ?auto_162674 ) ( not ( = ?auto_162668 ?auto_162675 ) ) ( not ( = ?auto_162669 ?auto_162675 ) ) ( not ( = ?auto_162670 ?auto_162675 ) ) ( not ( = ?auto_162671 ?auto_162675 ) ) ( not ( = ?auto_162672 ?auto_162675 ) ) ( not ( = ?auto_162673 ?auto_162675 ) ) ( not ( = ?auto_162674 ?auto_162675 ) ) ( HOLDING ?auto_162673 ) ( CLEAR ?auto_162672 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162668 ?auto_162669 ?auto_162670 ?auto_162671 ?auto_162672 ?auto_162673 )
      ( MAKE-7PILE ?auto_162668 ?auto_162669 ?auto_162670 ?auto_162671 ?auto_162672 ?auto_162673 ?auto_162674 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162676 - BLOCK
      ?auto_162677 - BLOCK
      ?auto_162678 - BLOCK
      ?auto_162679 - BLOCK
      ?auto_162680 - BLOCK
      ?auto_162681 - BLOCK
      ?auto_162682 - BLOCK
    )
    :vars
    (
      ?auto_162683 - BLOCK
      ?auto_162684 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162676 ) ( ON ?auto_162677 ?auto_162676 ) ( ON ?auto_162678 ?auto_162677 ) ( ON ?auto_162679 ?auto_162678 ) ( ON ?auto_162680 ?auto_162679 ) ( not ( = ?auto_162676 ?auto_162677 ) ) ( not ( = ?auto_162676 ?auto_162678 ) ) ( not ( = ?auto_162676 ?auto_162679 ) ) ( not ( = ?auto_162676 ?auto_162680 ) ) ( not ( = ?auto_162676 ?auto_162681 ) ) ( not ( = ?auto_162676 ?auto_162682 ) ) ( not ( = ?auto_162677 ?auto_162678 ) ) ( not ( = ?auto_162677 ?auto_162679 ) ) ( not ( = ?auto_162677 ?auto_162680 ) ) ( not ( = ?auto_162677 ?auto_162681 ) ) ( not ( = ?auto_162677 ?auto_162682 ) ) ( not ( = ?auto_162678 ?auto_162679 ) ) ( not ( = ?auto_162678 ?auto_162680 ) ) ( not ( = ?auto_162678 ?auto_162681 ) ) ( not ( = ?auto_162678 ?auto_162682 ) ) ( not ( = ?auto_162679 ?auto_162680 ) ) ( not ( = ?auto_162679 ?auto_162681 ) ) ( not ( = ?auto_162679 ?auto_162682 ) ) ( not ( = ?auto_162680 ?auto_162681 ) ) ( not ( = ?auto_162680 ?auto_162682 ) ) ( not ( = ?auto_162681 ?auto_162682 ) ) ( ON ?auto_162682 ?auto_162683 ) ( not ( = ?auto_162676 ?auto_162683 ) ) ( not ( = ?auto_162677 ?auto_162683 ) ) ( not ( = ?auto_162678 ?auto_162683 ) ) ( not ( = ?auto_162679 ?auto_162683 ) ) ( not ( = ?auto_162680 ?auto_162683 ) ) ( not ( = ?auto_162681 ?auto_162683 ) ) ( not ( = ?auto_162682 ?auto_162683 ) ) ( CLEAR ?auto_162680 ) ( ON ?auto_162681 ?auto_162682 ) ( CLEAR ?auto_162681 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162684 ) ( ON ?auto_162683 ?auto_162684 ) ( not ( = ?auto_162684 ?auto_162683 ) ) ( not ( = ?auto_162684 ?auto_162682 ) ) ( not ( = ?auto_162684 ?auto_162681 ) ) ( not ( = ?auto_162676 ?auto_162684 ) ) ( not ( = ?auto_162677 ?auto_162684 ) ) ( not ( = ?auto_162678 ?auto_162684 ) ) ( not ( = ?auto_162679 ?auto_162684 ) ) ( not ( = ?auto_162680 ?auto_162684 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162684 ?auto_162683 ?auto_162682 )
      ( MAKE-7PILE ?auto_162676 ?auto_162677 ?auto_162678 ?auto_162679 ?auto_162680 ?auto_162681 ?auto_162682 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162685 - BLOCK
      ?auto_162686 - BLOCK
      ?auto_162687 - BLOCK
      ?auto_162688 - BLOCK
      ?auto_162689 - BLOCK
      ?auto_162690 - BLOCK
      ?auto_162691 - BLOCK
    )
    :vars
    (
      ?auto_162693 - BLOCK
      ?auto_162692 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162685 ) ( ON ?auto_162686 ?auto_162685 ) ( ON ?auto_162687 ?auto_162686 ) ( ON ?auto_162688 ?auto_162687 ) ( not ( = ?auto_162685 ?auto_162686 ) ) ( not ( = ?auto_162685 ?auto_162687 ) ) ( not ( = ?auto_162685 ?auto_162688 ) ) ( not ( = ?auto_162685 ?auto_162689 ) ) ( not ( = ?auto_162685 ?auto_162690 ) ) ( not ( = ?auto_162685 ?auto_162691 ) ) ( not ( = ?auto_162686 ?auto_162687 ) ) ( not ( = ?auto_162686 ?auto_162688 ) ) ( not ( = ?auto_162686 ?auto_162689 ) ) ( not ( = ?auto_162686 ?auto_162690 ) ) ( not ( = ?auto_162686 ?auto_162691 ) ) ( not ( = ?auto_162687 ?auto_162688 ) ) ( not ( = ?auto_162687 ?auto_162689 ) ) ( not ( = ?auto_162687 ?auto_162690 ) ) ( not ( = ?auto_162687 ?auto_162691 ) ) ( not ( = ?auto_162688 ?auto_162689 ) ) ( not ( = ?auto_162688 ?auto_162690 ) ) ( not ( = ?auto_162688 ?auto_162691 ) ) ( not ( = ?auto_162689 ?auto_162690 ) ) ( not ( = ?auto_162689 ?auto_162691 ) ) ( not ( = ?auto_162690 ?auto_162691 ) ) ( ON ?auto_162691 ?auto_162693 ) ( not ( = ?auto_162685 ?auto_162693 ) ) ( not ( = ?auto_162686 ?auto_162693 ) ) ( not ( = ?auto_162687 ?auto_162693 ) ) ( not ( = ?auto_162688 ?auto_162693 ) ) ( not ( = ?auto_162689 ?auto_162693 ) ) ( not ( = ?auto_162690 ?auto_162693 ) ) ( not ( = ?auto_162691 ?auto_162693 ) ) ( ON ?auto_162690 ?auto_162691 ) ( CLEAR ?auto_162690 ) ( ON-TABLE ?auto_162692 ) ( ON ?auto_162693 ?auto_162692 ) ( not ( = ?auto_162692 ?auto_162693 ) ) ( not ( = ?auto_162692 ?auto_162691 ) ) ( not ( = ?auto_162692 ?auto_162690 ) ) ( not ( = ?auto_162685 ?auto_162692 ) ) ( not ( = ?auto_162686 ?auto_162692 ) ) ( not ( = ?auto_162687 ?auto_162692 ) ) ( not ( = ?auto_162688 ?auto_162692 ) ) ( not ( = ?auto_162689 ?auto_162692 ) ) ( HOLDING ?auto_162689 ) ( CLEAR ?auto_162688 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162685 ?auto_162686 ?auto_162687 ?auto_162688 ?auto_162689 )
      ( MAKE-7PILE ?auto_162685 ?auto_162686 ?auto_162687 ?auto_162688 ?auto_162689 ?auto_162690 ?auto_162691 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162694 - BLOCK
      ?auto_162695 - BLOCK
      ?auto_162696 - BLOCK
      ?auto_162697 - BLOCK
      ?auto_162698 - BLOCK
      ?auto_162699 - BLOCK
      ?auto_162700 - BLOCK
    )
    :vars
    (
      ?auto_162701 - BLOCK
      ?auto_162702 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162694 ) ( ON ?auto_162695 ?auto_162694 ) ( ON ?auto_162696 ?auto_162695 ) ( ON ?auto_162697 ?auto_162696 ) ( not ( = ?auto_162694 ?auto_162695 ) ) ( not ( = ?auto_162694 ?auto_162696 ) ) ( not ( = ?auto_162694 ?auto_162697 ) ) ( not ( = ?auto_162694 ?auto_162698 ) ) ( not ( = ?auto_162694 ?auto_162699 ) ) ( not ( = ?auto_162694 ?auto_162700 ) ) ( not ( = ?auto_162695 ?auto_162696 ) ) ( not ( = ?auto_162695 ?auto_162697 ) ) ( not ( = ?auto_162695 ?auto_162698 ) ) ( not ( = ?auto_162695 ?auto_162699 ) ) ( not ( = ?auto_162695 ?auto_162700 ) ) ( not ( = ?auto_162696 ?auto_162697 ) ) ( not ( = ?auto_162696 ?auto_162698 ) ) ( not ( = ?auto_162696 ?auto_162699 ) ) ( not ( = ?auto_162696 ?auto_162700 ) ) ( not ( = ?auto_162697 ?auto_162698 ) ) ( not ( = ?auto_162697 ?auto_162699 ) ) ( not ( = ?auto_162697 ?auto_162700 ) ) ( not ( = ?auto_162698 ?auto_162699 ) ) ( not ( = ?auto_162698 ?auto_162700 ) ) ( not ( = ?auto_162699 ?auto_162700 ) ) ( ON ?auto_162700 ?auto_162701 ) ( not ( = ?auto_162694 ?auto_162701 ) ) ( not ( = ?auto_162695 ?auto_162701 ) ) ( not ( = ?auto_162696 ?auto_162701 ) ) ( not ( = ?auto_162697 ?auto_162701 ) ) ( not ( = ?auto_162698 ?auto_162701 ) ) ( not ( = ?auto_162699 ?auto_162701 ) ) ( not ( = ?auto_162700 ?auto_162701 ) ) ( ON ?auto_162699 ?auto_162700 ) ( ON-TABLE ?auto_162702 ) ( ON ?auto_162701 ?auto_162702 ) ( not ( = ?auto_162702 ?auto_162701 ) ) ( not ( = ?auto_162702 ?auto_162700 ) ) ( not ( = ?auto_162702 ?auto_162699 ) ) ( not ( = ?auto_162694 ?auto_162702 ) ) ( not ( = ?auto_162695 ?auto_162702 ) ) ( not ( = ?auto_162696 ?auto_162702 ) ) ( not ( = ?auto_162697 ?auto_162702 ) ) ( not ( = ?auto_162698 ?auto_162702 ) ) ( CLEAR ?auto_162697 ) ( ON ?auto_162698 ?auto_162699 ) ( CLEAR ?auto_162698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162702 ?auto_162701 ?auto_162700 ?auto_162699 )
      ( MAKE-7PILE ?auto_162694 ?auto_162695 ?auto_162696 ?auto_162697 ?auto_162698 ?auto_162699 ?auto_162700 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162703 - BLOCK
      ?auto_162704 - BLOCK
      ?auto_162705 - BLOCK
      ?auto_162706 - BLOCK
      ?auto_162707 - BLOCK
      ?auto_162708 - BLOCK
      ?auto_162709 - BLOCK
    )
    :vars
    (
      ?auto_162710 - BLOCK
      ?auto_162711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162703 ) ( ON ?auto_162704 ?auto_162703 ) ( ON ?auto_162705 ?auto_162704 ) ( not ( = ?auto_162703 ?auto_162704 ) ) ( not ( = ?auto_162703 ?auto_162705 ) ) ( not ( = ?auto_162703 ?auto_162706 ) ) ( not ( = ?auto_162703 ?auto_162707 ) ) ( not ( = ?auto_162703 ?auto_162708 ) ) ( not ( = ?auto_162703 ?auto_162709 ) ) ( not ( = ?auto_162704 ?auto_162705 ) ) ( not ( = ?auto_162704 ?auto_162706 ) ) ( not ( = ?auto_162704 ?auto_162707 ) ) ( not ( = ?auto_162704 ?auto_162708 ) ) ( not ( = ?auto_162704 ?auto_162709 ) ) ( not ( = ?auto_162705 ?auto_162706 ) ) ( not ( = ?auto_162705 ?auto_162707 ) ) ( not ( = ?auto_162705 ?auto_162708 ) ) ( not ( = ?auto_162705 ?auto_162709 ) ) ( not ( = ?auto_162706 ?auto_162707 ) ) ( not ( = ?auto_162706 ?auto_162708 ) ) ( not ( = ?auto_162706 ?auto_162709 ) ) ( not ( = ?auto_162707 ?auto_162708 ) ) ( not ( = ?auto_162707 ?auto_162709 ) ) ( not ( = ?auto_162708 ?auto_162709 ) ) ( ON ?auto_162709 ?auto_162710 ) ( not ( = ?auto_162703 ?auto_162710 ) ) ( not ( = ?auto_162704 ?auto_162710 ) ) ( not ( = ?auto_162705 ?auto_162710 ) ) ( not ( = ?auto_162706 ?auto_162710 ) ) ( not ( = ?auto_162707 ?auto_162710 ) ) ( not ( = ?auto_162708 ?auto_162710 ) ) ( not ( = ?auto_162709 ?auto_162710 ) ) ( ON ?auto_162708 ?auto_162709 ) ( ON-TABLE ?auto_162711 ) ( ON ?auto_162710 ?auto_162711 ) ( not ( = ?auto_162711 ?auto_162710 ) ) ( not ( = ?auto_162711 ?auto_162709 ) ) ( not ( = ?auto_162711 ?auto_162708 ) ) ( not ( = ?auto_162703 ?auto_162711 ) ) ( not ( = ?auto_162704 ?auto_162711 ) ) ( not ( = ?auto_162705 ?auto_162711 ) ) ( not ( = ?auto_162706 ?auto_162711 ) ) ( not ( = ?auto_162707 ?auto_162711 ) ) ( ON ?auto_162707 ?auto_162708 ) ( CLEAR ?auto_162707 ) ( HOLDING ?auto_162706 ) ( CLEAR ?auto_162705 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162703 ?auto_162704 ?auto_162705 ?auto_162706 )
      ( MAKE-7PILE ?auto_162703 ?auto_162704 ?auto_162705 ?auto_162706 ?auto_162707 ?auto_162708 ?auto_162709 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162712 - BLOCK
      ?auto_162713 - BLOCK
      ?auto_162714 - BLOCK
      ?auto_162715 - BLOCK
      ?auto_162716 - BLOCK
      ?auto_162717 - BLOCK
      ?auto_162718 - BLOCK
    )
    :vars
    (
      ?auto_162719 - BLOCK
      ?auto_162720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162712 ) ( ON ?auto_162713 ?auto_162712 ) ( ON ?auto_162714 ?auto_162713 ) ( not ( = ?auto_162712 ?auto_162713 ) ) ( not ( = ?auto_162712 ?auto_162714 ) ) ( not ( = ?auto_162712 ?auto_162715 ) ) ( not ( = ?auto_162712 ?auto_162716 ) ) ( not ( = ?auto_162712 ?auto_162717 ) ) ( not ( = ?auto_162712 ?auto_162718 ) ) ( not ( = ?auto_162713 ?auto_162714 ) ) ( not ( = ?auto_162713 ?auto_162715 ) ) ( not ( = ?auto_162713 ?auto_162716 ) ) ( not ( = ?auto_162713 ?auto_162717 ) ) ( not ( = ?auto_162713 ?auto_162718 ) ) ( not ( = ?auto_162714 ?auto_162715 ) ) ( not ( = ?auto_162714 ?auto_162716 ) ) ( not ( = ?auto_162714 ?auto_162717 ) ) ( not ( = ?auto_162714 ?auto_162718 ) ) ( not ( = ?auto_162715 ?auto_162716 ) ) ( not ( = ?auto_162715 ?auto_162717 ) ) ( not ( = ?auto_162715 ?auto_162718 ) ) ( not ( = ?auto_162716 ?auto_162717 ) ) ( not ( = ?auto_162716 ?auto_162718 ) ) ( not ( = ?auto_162717 ?auto_162718 ) ) ( ON ?auto_162718 ?auto_162719 ) ( not ( = ?auto_162712 ?auto_162719 ) ) ( not ( = ?auto_162713 ?auto_162719 ) ) ( not ( = ?auto_162714 ?auto_162719 ) ) ( not ( = ?auto_162715 ?auto_162719 ) ) ( not ( = ?auto_162716 ?auto_162719 ) ) ( not ( = ?auto_162717 ?auto_162719 ) ) ( not ( = ?auto_162718 ?auto_162719 ) ) ( ON ?auto_162717 ?auto_162718 ) ( ON-TABLE ?auto_162720 ) ( ON ?auto_162719 ?auto_162720 ) ( not ( = ?auto_162720 ?auto_162719 ) ) ( not ( = ?auto_162720 ?auto_162718 ) ) ( not ( = ?auto_162720 ?auto_162717 ) ) ( not ( = ?auto_162712 ?auto_162720 ) ) ( not ( = ?auto_162713 ?auto_162720 ) ) ( not ( = ?auto_162714 ?auto_162720 ) ) ( not ( = ?auto_162715 ?auto_162720 ) ) ( not ( = ?auto_162716 ?auto_162720 ) ) ( ON ?auto_162716 ?auto_162717 ) ( CLEAR ?auto_162714 ) ( ON ?auto_162715 ?auto_162716 ) ( CLEAR ?auto_162715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162720 ?auto_162719 ?auto_162718 ?auto_162717 ?auto_162716 )
      ( MAKE-7PILE ?auto_162712 ?auto_162713 ?auto_162714 ?auto_162715 ?auto_162716 ?auto_162717 ?auto_162718 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162721 - BLOCK
      ?auto_162722 - BLOCK
      ?auto_162723 - BLOCK
      ?auto_162724 - BLOCK
      ?auto_162725 - BLOCK
      ?auto_162726 - BLOCK
      ?auto_162727 - BLOCK
    )
    :vars
    (
      ?auto_162729 - BLOCK
      ?auto_162728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162721 ) ( ON ?auto_162722 ?auto_162721 ) ( not ( = ?auto_162721 ?auto_162722 ) ) ( not ( = ?auto_162721 ?auto_162723 ) ) ( not ( = ?auto_162721 ?auto_162724 ) ) ( not ( = ?auto_162721 ?auto_162725 ) ) ( not ( = ?auto_162721 ?auto_162726 ) ) ( not ( = ?auto_162721 ?auto_162727 ) ) ( not ( = ?auto_162722 ?auto_162723 ) ) ( not ( = ?auto_162722 ?auto_162724 ) ) ( not ( = ?auto_162722 ?auto_162725 ) ) ( not ( = ?auto_162722 ?auto_162726 ) ) ( not ( = ?auto_162722 ?auto_162727 ) ) ( not ( = ?auto_162723 ?auto_162724 ) ) ( not ( = ?auto_162723 ?auto_162725 ) ) ( not ( = ?auto_162723 ?auto_162726 ) ) ( not ( = ?auto_162723 ?auto_162727 ) ) ( not ( = ?auto_162724 ?auto_162725 ) ) ( not ( = ?auto_162724 ?auto_162726 ) ) ( not ( = ?auto_162724 ?auto_162727 ) ) ( not ( = ?auto_162725 ?auto_162726 ) ) ( not ( = ?auto_162725 ?auto_162727 ) ) ( not ( = ?auto_162726 ?auto_162727 ) ) ( ON ?auto_162727 ?auto_162729 ) ( not ( = ?auto_162721 ?auto_162729 ) ) ( not ( = ?auto_162722 ?auto_162729 ) ) ( not ( = ?auto_162723 ?auto_162729 ) ) ( not ( = ?auto_162724 ?auto_162729 ) ) ( not ( = ?auto_162725 ?auto_162729 ) ) ( not ( = ?auto_162726 ?auto_162729 ) ) ( not ( = ?auto_162727 ?auto_162729 ) ) ( ON ?auto_162726 ?auto_162727 ) ( ON-TABLE ?auto_162728 ) ( ON ?auto_162729 ?auto_162728 ) ( not ( = ?auto_162728 ?auto_162729 ) ) ( not ( = ?auto_162728 ?auto_162727 ) ) ( not ( = ?auto_162728 ?auto_162726 ) ) ( not ( = ?auto_162721 ?auto_162728 ) ) ( not ( = ?auto_162722 ?auto_162728 ) ) ( not ( = ?auto_162723 ?auto_162728 ) ) ( not ( = ?auto_162724 ?auto_162728 ) ) ( not ( = ?auto_162725 ?auto_162728 ) ) ( ON ?auto_162725 ?auto_162726 ) ( ON ?auto_162724 ?auto_162725 ) ( CLEAR ?auto_162724 ) ( HOLDING ?auto_162723 ) ( CLEAR ?auto_162722 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162721 ?auto_162722 ?auto_162723 )
      ( MAKE-7PILE ?auto_162721 ?auto_162722 ?auto_162723 ?auto_162724 ?auto_162725 ?auto_162726 ?auto_162727 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162730 - BLOCK
      ?auto_162731 - BLOCK
      ?auto_162732 - BLOCK
      ?auto_162733 - BLOCK
      ?auto_162734 - BLOCK
      ?auto_162735 - BLOCK
      ?auto_162736 - BLOCK
    )
    :vars
    (
      ?auto_162737 - BLOCK
      ?auto_162738 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162730 ) ( ON ?auto_162731 ?auto_162730 ) ( not ( = ?auto_162730 ?auto_162731 ) ) ( not ( = ?auto_162730 ?auto_162732 ) ) ( not ( = ?auto_162730 ?auto_162733 ) ) ( not ( = ?auto_162730 ?auto_162734 ) ) ( not ( = ?auto_162730 ?auto_162735 ) ) ( not ( = ?auto_162730 ?auto_162736 ) ) ( not ( = ?auto_162731 ?auto_162732 ) ) ( not ( = ?auto_162731 ?auto_162733 ) ) ( not ( = ?auto_162731 ?auto_162734 ) ) ( not ( = ?auto_162731 ?auto_162735 ) ) ( not ( = ?auto_162731 ?auto_162736 ) ) ( not ( = ?auto_162732 ?auto_162733 ) ) ( not ( = ?auto_162732 ?auto_162734 ) ) ( not ( = ?auto_162732 ?auto_162735 ) ) ( not ( = ?auto_162732 ?auto_162736 ) ) ( not ( = ?auto_162733 ?auto_162734 ) ) ( not ( = ?auto_162733 ?auto_162735 ) ) ( not ( = ?auto_162733 ?auto_162736 ) ) ( not ( = ?auto_162734 ?auto_162735 ) ) ( not ( = ?auto_162734 ?auto_162736 ) ) ( not ( = ?auto_162735 ?auto_162736 ) ) ( ON ?auto_162736 ?auto_162737 ) ( not ( = ?auto_162730 ?auto_162737 ) ) ( not ( = ?auto_162731 ?auto_162737 ) ) ( not ( = ?auto_162732 ?auto_162737 ) ) ( not ( = ?auto_162733 ?auto_162737 ) ) ( not ( = ?auto_162734 ?auto_162737 ) ) ( not ( = ?auto_162735 ?auto_162737 ) ) ( not ( = ?auto_162736 ?auto_162737 ) ) ( ON ?auto_162735 ?auto_162736 ) ( ON-TABLE ?auto_162738 ) ( ON ?auto_162737 ?auto_162738 ) ( not ( = ?auto_162738 ?auto_162737 ) ) ( not ( = ?auto_162738 ?auto_162736 ) ) ( not ( = ?auto_162738 ?auto_162735 ) ) ( not ( = ?auto_162730 ?auto_162738 ) ) ( not ( = ?auto_162731 ?auto_162738 ) ) ( not ( = ?auto_162732 ?auto_162738 ) ) ( not ( = ?auto_162733 ?auto_162738 ) ) ( not ( = ?auto_162734 ?auto_162738 ) ) ( ON ?auto_162734 ?auto_162735 ) ( ON ?auto_162733 ?auto_162734 ) ( CLEAR ?auto_162731 ) ( ON ?auto_162732 ?auto_162733 ) ( CLEAR ?auto_162732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162738 ?auto_162737 ?auto_162736 ?auto_162735 ?auto_162734 ?auto_162733 )
      ( MAKE-7PILE ?auto_162730 ?auto_162731 ?auto_162732 ?auto_162733 ?auto_162734 ?auto_162735 ?auto_162736 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162739 - BLOCK
      ?auto_162740 - BLOCK
      ?auto_162741 - BLOCK
      ?auto_162742 - BLOCK
      ?auto_162743 - BLOCK
      ?auto_162744 - BLOCK
      ?auto_162745 - BLOCK
    )
    :vars
    (
      ?auto_162747 - BLOCK
      ?auto_162746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162739 ) ( not ( = ?auto_162739 ?auto_162740 ) ) ( not ( = ?auto_162739 ?auto_162741 ) ) ( not ( = ?auto_162739 ?auto_162742 ) ) ( not ( = ?auto_162739 ?auto_162743 ) ) ( not ( = ?auto_162739 ?auto_162744 ) ) ( not ( = ?auto_162739 ?auto_162745 ) ) ( not ( = ?auto_162740 ?auto_162741 ) ) ( not ( = ?auto_162740 ?auto_162742 ) ) ( not ( = ?auto_162740 ?auto_162743 ) ) ( not ( = ?auto_162740 ?auto_162744 ) ) ( not ( = ?auto_162740 ?auto_162745 ) ) ( not ( = ?auto_162741 ?auto_162742 ) ) ( not ( = ?auto_162741 ?auto_162743 ) ) ( not ( = ?auto_162741 ?auto_162744 ) ) ( not ( = ?auto_162741 ?auto_162745 ) ) ( not ( = ?auto_162742 ?auto_162743 ) ) ( not ( = ?auto_162742 ?auto_162744 ) ) ( not ( = ?auto_162742 ?auto_162745 ) ) ( not ( = ?auto_162743 ?auto_162744 ) ) ( not ( = ?auto_162743 ?auto_162745 ) ) ( not ( = ?auto_162744 ?auto_162745 ) ) ( ON ?auto_162745 ?auto_162747 ) ( not ( = ?auto_162739 ?auto_162747 ) ) ( not ( = ?auto_162740 ?auto_162747 ) ) ( not ( = ?auto_162741 ?auto_162747 ) ) ( not ( = ?auto_162742 ?auto_162747 ) ) ( not ( = ?auto_162743 ?auto_162747 ) ) ( not ( = ?auto_162744 ?auto_162747 ) ) ( not ( = ?auto_162745 ?auto_162747 ) ) ( ON ?auto_162744 ?auto_162745 ) ( ON-TABLE ?auto_162746 ) ( ON ?auto_162747 ?auto_162746 ) ( not ( = ?auto_162746 ?auto_162747 ) ) ( not ( = ?auto_162746 ?auto_162745 ) ) ( not ( = ?auto_162746 ?auto_162744 ) ) ( not ( = ?auto_162739 ?auto_162746 ) ) ( not ( = ?auto_162740 ?auto_162746 ) ) ( not ( = ?auto_162741 ?auto_162746 ) ) ( not ( = ?auto_162742 ?auto_162746 ) ) ( not ( = ?auto_162743 ?auto_162746 ) ) ( ON ?auto_162743 ?auto_162744 ) ( ON ?auto_162742 ?auto_162743 ) ( ON ?auto_162741 ?auto_162742 ) ( CLEAR ?auto_162741 ) ( HOLDING ?auto_162740 ) ( CLEAR ?auto_162739 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162739 ?auto_162740 )
      ( MAKE-7PILE ?auto_162739 ?auto_162740 ?auto_162741 ?auto_162742 ?auto_162743 ?auto_162744 ?auto_162745 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162748 - BLOCK
      ?auto_162749 - BLOCK
      ?auto_162750 - BLOCK
      ?auto_162751 - BLOCK
      ?auto_162752 - BLOCK
      ?auto_162753 - BLOCK
      ?auto_162754 - BLOCK
    )
    :vars
    (
      ?auto_162756 - BLOCK
      ?auto_162755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162748 ) ( not ( = ?auto_162748 ?auto_162749 ) ) ( not ( = ?auto_162748 ?auto_162750 ) ) ( not ( = ?auto_162748 ?auto_162751 ) ) ( not ( = ?auto_162748 ?auto_162752 ) ) ( not ( = ?auto_162748 ?auto_162753 ) ) ( not ( = ?auto_162748 ?auto_162754 ) ) ( not ( = ?auto_162749 ?auto_162750 ) ) ( not ( = ?auto_162749 ?auto_162751 ) ) ( not ( = ?auto_162749 ?auto_162752 ) ) ( not ( = ?auto_162749 ?auto_162753 ) ) ( not ( = ?auto_162749 ?auto_162754 ) ) ( not ( = ?auto_162750 ?auto_162751 ) ) ( not ( = ?auto_162750 ?auto_162752 ) ) ( not ( = ?auto_162750 ?auto_162753 ) ) ( not ( = ?auto_162750 ?auto_162754 ) ) ( not ( = ?auto_162751 ?auto_162752 ) ) ( not ( = ?auto_162751 ?auto_162753 ) ) ( not ( = ?auto_162751 ?auto_162754 ) ) ( not ( = ?auto_162752 ?auto_162753 ) ) ( not ( = ?auto_162752 ?auto_162754 ) ) ( not ( = ?auto_162753 ?auto_162754 ) ) ( ON ?auto_162754 ?auto_162756 ) ( not ( = ?auto_162748 ?auto_162756 ) ) ( not ( = ?auto_162749 ?auto_162756 ) ) ( not ( = ?auto_162750 ?auto_162756 ) ) ( not ( = ?auto_162751 ?auto_162756 ) ) ( not ( = ?auto_162752 ?auto_162756 ) ) ( not ( = ?auto_162753 ?auto_162756 ) ) ( not ( = ?auto_162754 ?auto_162756 ) ) ( ON ?auto_162753 ?auto_162754 ) ( ON-TABLE ?auto_162755 ) ( ON ?auto_162756 ?auto_162755 ) ( not ( = ?auto_162755 ?auto_162756 ) ) ( not ( = ?auto_162755 ?auto_162754 ) ) ( not ( = ?auto_162755 ?auto_162753 ) ) ( not ( = ?auto_162748 ?auto_162755 ) ) ( not ( = ?auto_162749 ?auto_162755 ) ) ( not ( = ?auto_162750 ?auto_162755 ) ) ( not ( = ?auto_162751 ?auto_162755 ) ) ( not ( = ?auto_162752 ?auto_162755 ) ) ( ON ?auto_162752 ?auto_162753 ) ( ON ?auto_162751 ?auto_162752 ) ( ON ?auto_162750 ?auto_162751 ) ( CLEAR ?auto_162748 ) ( ON ?auto_162749 ?auto_162750 ) ( CLEAR ?auto_162749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162755 ?auto_162756 ?auto_162754 ?auto_162753 ?auto_162752 ?auto_162751 ?auto_162750 )
      ( MAKE-7PILE ?auto_162748 ?auto_162749 ?auto_162750 ?auto_162751 ?auto_162752 ?auto_162753 ?auto_162754 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162757 - BLOCK
      ?auto_162758 - BLOCK
      ?auto_162759 - BLOCK
      ?auto_162760 - BLOCK
      ?auto_162761 - BLOCK
      ?auto_162762 - BLOCK
      ?auto_162763 - BLOCK
    )
    :vars
    (
      ?auto_162764 - BLOCK
      ?auto_162765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162757 ?auto_162758 ) ) ( not ( = ?auto_162757 ?auto_162759 ) ) ( not ( = ?auto_162757 ?auto_162760 ) ) ( not ( = ?auto_162757 ?auto_162761 ) ) ( not ( = ?auto_162757 ?auto_162762 ) ) ( not ( = ?auto_162757 ?auto_162763 ) ) ( not ( = ?auto_162758 ?auto_162759 ) ) ( not ( = ?auto_162758 ?auto_162760 ) ) ( not ( = ?auto_162758 ?auto_162761 ) ) ( not ( = ?auto_162758 ?auto_162762 ) ) ( not ( = ?auto_162758 ?auto_162763 ) ) ( not ( = ?auto_162759 ?auto_162760 ) ) ( not ( = ?auto_162759 ?auto_162761 ) ) ( not ( = ?auto_162759 ?auto_162762 ) ) ( not ( = ?auto_162759 ?auto_162763 ) ) ( not ( = ?auto_162760 ?auto_162761 ) ) ( not ( = ?auto_162760 ?auto_162762 ) ) ( not ( = ?auto_162760 ?auto_162763 ) ) ( not ( = ?auto_162761 ?auto_162762 ) ) ( not ( = ?auto_162761 ?auto_162763 ) ) ( not ( = ?auto_162762 ?auto_162763 ) ) ( ON ?auto_162763 ?auto_162764 ) ( not ( = ?auto_162757 ?auto_162764 ) ) ( not ( = ?auto_162758 ?auto_162764 ) ) ( not ( = ?auto_162759 ?auto_162764 ) ) ( not ( = ?auto_162760 ?auto_162764 ) ) ( not ( = ?auto_162761 ?auto_162764 ) ) ( not ( = ?auto_162762 ?auto_162764 ) ) ( not ( = ?auto_162763 ?auto_162764 ) ) ( ON ?auto_162762 ?auto_162763 ) ( ON-TABLE ?auto_162765 ) ( ON ?auto_162764 ?auto_162765 ) ( not ( = ?auto_162765 ?auto_162764 ) ) ( not ( = ?auto_162765 ?auto_162763 ) ) ( not ( = ?auto_162765 ?auto_162762 ) ) ( not ( = ?auto_162757 ?auto_162765 ) ) ( not ( = ?auto_162758 ?auto_162765 ) ) ( not ( = ?auto_162759 ?auto_162765 ) ) ( not ( = ?auto_162760 ?auto_162765 ) ) ( not ( = ?auto_162761 ?auto_162765 ) ) ( ON ?auto_162761 ?auto_162762 ) ( ON ?auto_162760 ?auto_162761 ) ( ON ?auto_162759 ?auto_162760 ) ( ON ?auto_162758 ?auto_162759 ) ( CLEAR ?auto_162758 ) ( HOLDING ?auto_162757 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162757 )
      ( MAKE-7PILE ?auto_162757 ?auto_162758 ?auto_162759 ?auto_162760 ?auto_162761 ?auto_162762 ?auto_162763 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162766 - BLOCK
      ?auto_162767 - BLOCK
      ?auto_162768 - BLOCK
      ?auto_162769 - BLOCK
      ?auto_162770 - BLOCK
      ?auto_162771 - BLOCK
      ?auto_162772 - BLOCK
    )
    :vars
    (
      ?auto_162774 - BLOCK
      ?auto_162773 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162766 ?auto_162767 ) ) ( not ( = ?auto_162766 ?auto_162768 ) ) ( not ( = ?auto_162766 ?auto_162769 ) ) ( not ( = ?auto_162766 ?auto_162770 ) ) ( not ( = ?auto_162766 ?auto_162771 ) ) ( not ( = ?auto_162766 ?auto_162772 ) ) ( not ( = ?auto_162767 ?auto_162768 ) ) ( not ( = ?auto_162767 ?auto_162769 ) ) ( not ( = ?auto_162767 ?auto_162770 ) ) ( not ( = ?auto_162767 ?auto_162771 ) ) ( not ( = ?auto_162767 ?auto_162772 ) ) ( not ( = ?auto_162768 ?auto_162769 ) ) ( not ( = ?auto_162768 ?auto_162770 ) ) ( not ( = ?auto_162768 ?auto_162771 ) ) ( not ( = ?auto_162768 ?auto_162772 ) ) ( not ( = ?auto_162769 ?auto_162770 ) ) ( not ( = ?auto_162769 ?auto_162771 ) ) ( not ( = ?auto_162769 ?auto_162772 ) ) ( not ( = ?auto_162770 ?auto_162771 ) ) ( not ( = ?auto_162770 ?auto_162772 ) ) ( not ( = ?auto_162771 ?auto_162772 ) ) ( ON ?auto_162772 ?auto_162774 ) ( not ( = ?auto_162766 ?auto_162774 ) ) ( not ( = ?auto_162767 ?auto_162774 ) ) ( not ( = ?auto_162768 ?auto_162774 ) ) ( not ( = ?auto_162769 ?auto_162774 ) ) ( not ( = ?auto_162770 ?auto_162774 ) ) ( not ( = ?auto_162771 ?auto_162774 ) ) ( not ( = ?auto_162772 ?auto_162774 ) ) ( ON ?auto_162771 ?auto_162772 ) ( ON-TABLE ?auto_162773 ) ( ON ?auto_162774 ?auto_162773 ) ( not ( = ?auto_162773 ?auto_162774 ) ) ( not ( = ?auto_162773 ?auto_162772 ) ) ( not ( = ?auto_162773 ?auto_162771 ) ) ( not ( = ?auto_162766 ?auto_162773 ) ) ( not ( = ?auto_162767 ?auto_162773 ) ) ( not ( = ?auto_162768 ?auto_162773 ) ) ( not ( = ?auto_162769 ?auto_162773 ) ) ( not ( = ?auto_162770 ?auto_162773 ) ) ( ON ?auto_162770 ?auto_162771 ) ( ON ?auto_162769 ?auto_162770 ) ( ON ?auto_162768 ?auto_162769 ) ( ON ?auto_162767 ?auto_162768 ) ( ON ?auto_162766 ?auto_162767 ) ( CLEAR ?auto_162766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162773 ?auto_162774 ?auto_162772 ?auto_162771 ?auto_162770 ?auto_162769 ?auto_162768 ?auto_162767 )
      ( MAKE-7PILE ?auto_162766 ?auto_162767 ?auto_162768 ?auto_162769 ?auto_162770 ?auto_162771 ?auto_162772 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_162776 - BLOCK
    )
    :vars
    (
      ?auto_162777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162777 ?auto_162776 ) ( CLEAR ?auto_162777 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162776 ) ( not ( = ?auto_162776 ?auto_162777 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162777 ?auto_162776 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_162778 - BLOCK
    )
    :vars
    (
      ?auto_162779 - BLOCK
      ?auto_162780 - BLOCK
      ?auto_162781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162779 ?auto_162778 ) ( CLEAR ?auto_162779 ) ( ON-TABLE ?auto_162778 ) ( not ( = ?auto_162778 ?auto_162779 ) ) ( HOLDING ?auto_162780 ) ( CLEAR ?auto_162781 ) ( not ( = ?auto_162778 ?auto_162780 ) ) ( not ( = ?auto_162778 ?auto_162781 ) ) ( not ( = ?auto_162779 ?auto_162780 ) ) ( not ( = ?auto_162779 ?auto_162781 ) ) ( not ( = ?auto_162780 ?auto_162781 ) ) )
    :subtasks
    ( ( !STACK ?auto_162780 ?auto_162781 )
      ( MAKE-1PILE ?auto_162778 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_162782 - BLOCK
    )
    :vars
    (
      ?auto_162783 - BLOCK
      ?auto_162785 - BLOCK
      ?auto_162784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162783 ?auto_162782 ) ( ON-TABLE ?auto_162782 ) ( not ( = ?auto_162782 ?auto_162783 ) ) ( CLEAR ?auto_162785 ) ( not ( = ?auto_162782 ?auto_162784 ) ) ( not ( = ?auto_162782 ?auto_162785 ) ) ( not ( = ?auto_162783 ?auto_162784 ) ) ( not ( = ?auto_162783 ?auto_162785 ) ) ( not ( = ?auto_162784 ?auto_162785 ) ) ( ON ?auto_162784 ?auto_162783 ) ( CLEAR ?auto_162784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162782 ?auto_162783 )
      ( MAKE-1PILE ?auto_162782 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_162786 - BLOCK
    )
    :vars
    (
      ?auto_162787 - BLOCK
      ?auto_162789 - BLOCK
      ?auto_162788 - BLOCK
      ?auto_162792 - BLOCK
      ?auto_162791 - BLOCK
      ?auto_162793 - BLOCK
      ?auto_162794 - BLOCK
      ?auto_162790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162787 ?auto_162786 ) ( ON-TABLE ?auto_162786 ) ( not ( = ?auto_162786 ?auto_162787 ) ) ( not ( = ?auto_162786 ?auto_162789 ) ) ( not ( = ?auto_162786 ?auto_162788 ) ) ( not ( = ?auto_162787 ?auto_162789 ) ) ( not ( = ?auto_162787 ?auto_162788 ) ) ( not ( = ?auto_162789 ?auto_162788 ) ) ( ON ?auto_162789 ?auto_162787 ) ( CLEAR ?auto_162789 ) ( HOLDING ?auto_162788 ) ( CLEAR ?auto_162792 ) ( ON-TABLE ?auto_162791 ) ( ON ?auto_162793 ?auto_162791 ) ( ON ?auto_162794 ?auto_162793 ) ( ON ?auto_162790 ?auto_162794 ) ( ON ?auto_162792 ?auto_162790 ) ( not ( = ?auto_162791 ?auto_162793 ) ) ( not ( = ?auto_162791 ?auto_162794 ) ) ( not ( = ?auto_162791 ?auto_162790 ) ) ( not ( = ?auto_162791 ?auto_162792 ) ) ( not ( = ?auto_162791 ?auto_162788 ) ) ( not ( = ?auto_162793 ?auto_162794 ) ) ( not ( = ?auto_162793 ?auto_162790 ) ) ( not ( = ?auto_162793 ?auto_162792 ) ) ( not ( = ?auto_162793 ?auto_162788 ) ) ( not ( = ?auto_162794 ?auto_162790 ) ) ( not ( = ?auto_162794 ?auto_162792 ) ) ( not ( = ?auto_162794 ?auto_162788 ) ) ( not ( = ?auto_162790 ?auto_162792 ) ) ( not ( = ?auto_162790 ?auto_162788 ) ) ( not ( = ?auto_162792 ?auto_162788 ) ) ( not ( = ?auto_162786 ?auto_162792 ) ) ( not ( = ?auto_162786 ?auto_162791 ) ) ( not ( = ?auto_162786 ?auto_162793 ) ) ( not ( = ?auto_162786 ?auto_162794 ) ) ( not ( = ?auto_162786 ?auto_162790 ) ) ( not ( = ?auto_162787 ?auto_162792 ) ) ( not ( = ?auto_162787 ?auto_162791 ) ) ( not ( = ?auto_162787 ?auto_162793 ) ) ( not ( = ?auto_162787 ?auto_162794 ) ) ( not ( = ?auto_162787 ?auto_162790 ) ) ( not ( = ?auto_162789 ?auto_162792 ) ) ( not ( = ?auto_162789 ?auto_162791 ) ) ( not ( = ?auto_162789 ?auto_162793 ) ) ( not ( = ?auto_162789 ?auto_162794 ) ) ( not ( = ?auto_162789 ?auto_162790 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162791 ?auto_162793 ?auto_162794 ?auto_162790 ?auto_162792 ?auto_162788 )
      ( MAKE-1PILE ?auto_162786 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_162795 - BLOCK
    )
    :vars
    (
      ?auto_162798 - BLOCK
      ?auto_162799 - BLOCK
      ?auto_162800 - BLOCK
      ?auto_162796 - BLOCK
      ?auto_162797 - BLOCK
      ?auto_162803 - BLOCK
      ?auto_162801 - BLOCK
      ?auto_162802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162798 ?auto_162795 ) ( ON-TABLE ?auto_162795 ) ( not ( = ?auto_162795 ?auto_162798 ) ) ( not ( = ?auto_162795 ?auto_162799 ) ) ( not ( = ?auto_162795 ?auto_162800 ) ) ( not ( = ?auto_162798 ?auto_162799 ) ) ( not ( = ?auto_162798 ?auto_162800 ) ) ( not ( = ?auto_162799 ?auto_162800 ) ) ( ON ?auto_162799 ?auto_162798 ) ( CLEAR ?auto_162796 ) ( ON-TABLE ?auto_162797 ) ( ON ?auto_162803 ?auto_162797 ) ( ON ?auto_162801 ?auto_162803 ) ( ON ?auto_162802 ?auto_162801 ) ( ON ?auto_162796 ?auto_162802 ) ( not ( = ?auto_162797 ?auto_162803 ) ) ( not ( = ?auto_162797 ?auto_162801 ) ) ( not ( = ?auto_162797 ?auto_162802 ) ) ( not ( = ?auto_162797 ?auto_162796 ) ) ( not ( = ?auto_162797 ?auto_162800 ) ) ( not ( = ?auto_162803 ?auto_162801 ) ) ( not ( = ?auto_162803 ?auto_162802 ) ) ( not ( = ?auto_162803 ?auto_162796 ) ) ( not ( = ?auto_162803 ?auto_162800 ) ) ( not ( = ?auto_162801 ?auto_162802 ) ) ( not ( = ?auto_162801 ?auto_162796 ) ) ( not ( = ?auto_162801 ?auto_162800 ) ) ( not ( = ?auto_162802 ?auto_162796 ) ) ( not ( = ?auto_162802 ?auto_162800 ) ) ( not ( = ?auto_162796 ?auto_162800 ) ) ( not ( = ?auto_162795 ?auto_162796 ) ) ( not ( = ?auto_162795 ?auto_162797 ) ) ( not ( = ?auto_162795 ?auto_162803 ) ) ( not ( = ?auto_162795 ?auto_162801 ) ) ( not ( = ?auto_162795 ?auto_162802 ) ) ( not ( = ?auto_162798 ?auto_162796 ) ) ( not ( = ?auto_162798 ?auto_162797 ) ) ( not ( = ?auto_162798 ?auto_162803 ) ) ( not ( = ?auto_162798 ?auto_162801 ) ) ( not ( = ?auto_162798 ?auto_162802 ) ) ( not ( = ?auto_162799 ?auto_162796 ) ) ( not ( = ?auto_162799 ?auto_162797 ) ) ( not ( = ?auto_162799 ?auto_162803 ) ) ( not ( = ?auto_162799 ?auto_162801 ) ) ( not ( = ?auto_162799 ?auto_162802 ) ) ( ON ?auto_162800 ?auto_162799 ) ( CLEAR ?auto_162800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162795 ?auto_162798 ?auto_162799 )
      ( MAKE-1PILE ?auto_162795 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_162804 - BLOCK
    )
    :vars
    (
      ?auto_162806 - BLOCK
      ?auto_162812 - BLOCK
      ?auto_162807 - BLOCK
      ?auto_162810 - BLOCK
      ?auto_162805 - BLOCK
      ?auto_162809 - BLOCK
      ?auto_162808 - BLOCK
      ?auto_162811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162806 ?auto_162804 ) ( ON-TABLE ?auto_162804 ) ( not ( = ?auto_162804 ?auto_162806 ) ) ( not ( = ?auto_162804 ?auto_162812 ) ) ( not ( = ?auto_162804 ?auto_162807 ) ) ( not ( = ?auto_162806 ?auto_162812 ) ) ( not ( = ?auto_162806 ?auto_162807 ) ) ( not ( = ?auto_162812 ?auto_162807 ) ) ( ON ?auto_162812 ?auto_162806 ) ( ON-TABLE ?auto_162810 ) ( ON ?auto_162805 ?auto_162810 ) ( ON ?auto_162809 ?auto_162805 ) ( ON ?auto_162808 ?auto_162809 ) ( not ( = ?auto_162810 ?auto_162805 ) ) ( not ( = ?auto_162810 ?auto_162809 ) ) ( not ( = ?auto_162810 ?auto_162808 ) ) ( not ( = ?auto_162810 ?auto_162811 ) ) ( not ( = ?auto_162810 ?auto_162807 ) ) ( not ( = ?auto_162805 ?auto_162809 ) ) ( not ( = ?auto_162805 ?auto_162808 ) ) ( not ( = ?auto_162805 ?auto_162811 ) ) ( not ( = ?auto_162805 ?auto_162807 ) ) ( not ( = ?auto_162809 ?auto_162808 ) ) ( not ( = ?auto_162809 ?auto_162811 ) ) ( not ( = ?auto_162809 ?auto_162807 ) ) ( not ( = ?auto_162808 ?auto_162811 ) ) ( not ( = ?auto_162808 ?auto_162807 ) ) ( not ( = ?auto_162811 ?auto_162807 ) ) ( not ( = ?auto_162804 ?auto_162811 ) ) ( not ( = ?auto_162804 ?auto_162810 ) ) ( not ( = ?auto_162804 ?auto_162805 ) ) ( not ( = ?auto_162804 ?auto_162809 ) ) ( not ( = ?auto_162804 ?auto_162808 ) ) ( not ( = ?auto_162806 ?auto_162811 ) ) ( not ( = ?auto_162806 ?auto_162810 ) ) ( not ( = ?auto_162806 ?auto_162805 ) ) ( not ( = ?auto_162806 ?auto_162809 ) ) ( not ( = ?auto_162806 ?auto_162808 ) ) ( not ( = ?auto_162812 ?auto_162811 ) ) ( not ( = ?auto_162812 ?auto_162810 ) ) ( not ( = ?auto_162812 ?auto_162805 ) ) ( not ( = ?auto_162812 ?auto_162809 ) ) ( not ( = ?auto_162812 ?auto_162808 ) ) ( ON ?auto_162807 ?auto_162812 ) ( CLEAR ?auto_162807 ) ( HOLDING ?auto_162811 ) ( CLEAR ?auto_162808 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162810 ?auto_162805 ?auto_162809 ?auto_162808 ?auto_162811 )
      ( MAKE-1PILE ?auto_162804 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_162813 - BLOCK
    )
    :vars
    (
      ?auto_162820 - BLOCK
      ?auto_162816 - BLOCK
      ?auto_162821 - BLOCK
      ?auto_162815 - BLOCK
      ?auto_162818 - BLOCK
      ?auto_162817 - BLOCK
      ?auto_162819 - BLOCK
      ?auto_162814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162820 ?auto_162813 ) ( ON-TABLE ?auto_162813 ) ( not ( = ?auto_162813 ?auto_162820 ) ) ( not ( = ?auto_162813 ?auto_162816 ) ) ( not ( = ?auto_162813 ?auto_162821 ) ) ( not ( = ?auto_162820 ?auto_162816 ) ) ( not ( = ?auto_162820 ?auto_162821 ) ) ( not ( = ?auto_162816 ?auto_162821 ) ) ( ON ?auto_162816 ?auto_162820 ) ( ON-TABLE ?auto_162815 ) ( ON ?auto_162818 ?auto_162815 ) ( ON ?auto_162817 ?auto_162818 ) ( ON ?auto_162819 ?auto_162817 ) ( not ( = ?auto_162815 ?auto_162818 ) ) ( not ( = ?auto_162815 ?auto_162817 ) ) ( not ( = ?auto_162815 ?auto_162819 ) ) ( not ( = ?auto_162815 ?auto_162814 ) ) ( not ( = ?auto_162815 ?auto_162821 ) ) ( not ( = ?auto_162818 ?auto_162817 ) ) ( not ( = ?auto_162818 ?auto_162819 ) ) ( not ( = ?auto_162818 ?auto_162814 ) ) ( not ( = ?auto_162818 ?auto_162821 ) ) ( not ( = ?auto_162817 ?auto_162819 ) ) ( not ( = ?auto_162817 ?auto_162814 ) ) ( not ( = ?auto_162817 ?auto_162821 ) ) ( not ( = ?auto_162819 ?auto_162814 ) ) ( not ( = ?auto_162819 ?auto_162821 ) ) ( not ( = ?auto_162814 ?auto_162821 ) ) ( not ( = ?auto_162813 ?auto_162814 ) ) ( not ( = ?auto_162813 ?auto_162815 ) ) ( not ( = ?auto_162813 ?auto_162818 ) ) ( not ( = ?auto_162813 ?auto_162817 ) ) ( not ( = ?auto_162813 ?auto_162819 ) ) ( not ( = ?auto_162820 ?auto_162814 ) ) ( not ( = ?auto_162820 ?auto_162815 ) ) ( not ( = ?auto_162820 ?auto_162818 ) ) ( not ( = ?auto_162820 ?auto_162817 ) ) ( not ( = ?auto_162820 ?auto_162819 ) ) ( not ( = ?auto_162816 ?auto_162814 ) ) ( not ( = ?auto_162816 ?auto_162815 ) ) ( not ( = ?auto_162816 ?auto_162818 ) ) ( not ( = ?auto_162816 ?auto_162817 ) ) ( not ( = ?auto_162816 ?auto_162819 ) ) ( ON ?auto_162821 ?auto_162816 ) ( CLEAR ?auto_162819 ) ( ON ?auto_162814 ?auto_162821 ) ( CLEAR ?auto_162814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162813 ?auto_162820 ?auto_162816 ?auto_162821 )
      ( MAKE-1PILE ?auto_162813 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_162822 - BLOCK
    )
    :vars
    (
      ?auto_162825 - BLOCK
      ?auto_162827 - BLOCK
      ?auto_162828 - BLOCK
      ?auto_162829 - BLOCK
      ?auto_162826 - BLOCK
      ?auto_162830 - BLOCK
      ?auto_162824 - BLOCK
      ?auto_162823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162825 ?auto_162822 ) ( ON-TABLE ?auto_162822 ) ( not ( = ?auto_162822 ?auto_162825 ) ) ( not ( = ?auto_162822 ?auto_162827 ) ) ( not ( = ?auto_162822 ?auto_162828 ) ) ( not ( = ?auto_162825 ?auto_162827 ) ) ( not ( = ?auto_162825 ?auto_162828 ) ) ( not ( = ?auto_162827 ?auto_162828 ) ) ( ON ?auto_162827 ?auto_162825 ) ( ON-TABLE ?auto_162829 ) ( ON ?auto_162826 ?auto_162829 ) ( ON ?auto_162830 ?auto_162826 ) ( not ( = ?auto_162829 ?auto_162826 ) ) ( not ( = ?auto_162829 ?auto_162830 ) ) ( not ( = ?auto_162829 ?auto_162824 ) ) ( not ( = ?auto_162829 ?auto_162823 ) ) ( not ( = ?auto_162829 ?auto_162828 ) ) ( not ( = ?auto_162826 ?auto_162830 ) ) ( not ( = ?auto_162826 ?auto_162824 ) ) ( not ( = ?auto_162826 ?auto_162823 ) ) ( not ( = ?auto_162826 ?auto_162828 ) ) ( not ( = ?auto_162830 ?auto_162824 ) ) ( not ( = ?auto_162830 ?auto_162823 ) ) ( not ( = ?auto_162830 ?auto_162828 ) ) ( not ( = ?auto_162824 ?auto_162823 ) ) ( not ( = ?auto_162824 ?auto_162828 ) ) ( not ( = ?auto_162823 ?auto_162828 ) ) ( not ( = ?auto_162822 ?auto_162823 ) ) ( not ( = ?auto_162822 ?auto_162829 ) ) ( not ( = ?auto_162822 ?auto_162826 ) ) ( not ( = ?auto_162822 ?auto_162830 ) ) ( not ( = ?auto_162822 ?auto_162824 ) ) ( not ( = ?auto_162825 ?auto_162823 ) ) ( not ( = ?auto_162825 ?auto_162829 ) ) ( not ( = ?auto_162825 ?auto_162826 ) ) ( not ( = ?auto_162825 ?auto_162830 ) ) ( not ( = ?auto_162825 ?auto_162824 ) ) ( not ( = ?auto_162827 ?auto_162823 ) ) ( not ( = ?auto_162827 ?auto_162829 ) ) ( not ( = ?auto_162827 ?auto_162826 ) ) ( not ( = ?auto_162827 ?auto_162830 ) ) ( not ( = ?auto_162827 ?auto_162824 ) ) ( ON ?auto_162828 ?auto_162827 ) ( ON ?auto_162823 ?auto_162828 ) ( CLEAR ?auto_162823 ) ( HOLDING ?auto_162824 ) ( CLEAR ?auto_162830 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162829 ?auto_162826 ?auto_162830 ?auto_162824 )
      ( MAKE-1PILE ?auto_162822 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_162831 - BLOCK
    )
    :vars
    (
      ?auto_162836 - BLOCK
      ?auto_162839 - BLOCK
      ?auto_162834 - BLOCK
      ?auto_162833 - BLOCK
      ?auto_162838 - BLOCK
      ?auto_162837 - BLOCK
      ?auto_162832 - BLOCK
      ?auto_162835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162836 ?auto_162831 ) ( ON-TABLE ?auto_162831 ) ( not ( = ?auto_162831 ?auto_162836 ) ) ( not ( = ?auto_162831 ?auto_162839 ) ) ( not ( = ?auto_162831 ?auto_162834 ) ) ( not ( = ?auto_162836 ?auto_162839 ) ) ( not ( = ?auto_162836 ?auto_162834 ) ) ( not ( = ?auto_162839 ?auto_162834 ) ) ( ON ?auto_162839 ?auto_162836 ) ( ON-TABLE ?auto_162833 ) ( ON ?auto_162838 ?auto_162833 ) ( ON ?auto_162837 ?auto_162838 ) ( not ( = ?auto_162833 ?auto_162838 ) ) ( not ( = ?auto_162833 ?auto_162837 ) ) ( not ( = ?auto_162833 ?auto_162832 ) ) ( not ( = ?auto_162833 ?auto_162835 ) ) ( not ( = ?auto_162833 ?auto_162834 ) ) ( not ( = ?auto_162838 ?auto_162837 ) ) ( not ( = ?auto_162838 ?auto_162832 ) ) ( not ( = ?auto_162838 ?auto_162835 ) ) ( not ( = ?auto_162838 ?auto_162834 ) ) ( not ( = ?auto_162837 ?auto_162832 ) ) ( not ( = ?auto_162837 ?auto_162835 ) ) ( not ( = ?auto_162837 ?auto_162834 ) ) ( not ( = ?auto_162832 ?auto_162835 ) ) ( not ( = ?auto_162832 ?auto_162834 ) ) ( not ( = ?auto_162835 ?auto_162834 ) ) ( not ( = ?auto_162831 ?auto_162835 ) ) ( not ( = ?auto_162831 ?auto_162833 ) ) ( not ( = ?auto_162831 ?auto_162838 ) ) ( not ( = ?auto_162831 ?auto_162837 ) ) ( not ( = ?auto_162831 ?auto_162832 ) ) ( not ( = ?auto_162836 ?auto_162835 ) ) ( not ( = ?auto_162836 ?auto_162833 ) ) ( not ( = ?auto_162836 ?auto_162838 ) ) ( not ( = ?auto_162836 ?auto_162837 ) ) ( not ( = ?auto_162836 ?auto_162832 ) ) ( not ( = ?auto_162839 ?auto_162835 ) ) ( not ( = ?auto_162839 ?auto_162833 ) ) ( not ( = ?auto_162839 ?auto_162838 ) ) ( not ( = ?auto_162839 ?auto_162837 ) ) ( not ( = ?auto_162839 ?auto_162832 ) ) ( ON ?auto_162834 ?auto_162839 ) ( ON ?auto_162835 ?auto_162834 ) ( CLEAR ?auto_162837 ) ( ON ?auto_162832 ?auto_162835 ) ( CLEAR ?auto_162832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162831 ?auto_162836 ?auto_162839 ?auto_162834 ?auto_162835 )
      ( MAKE-1PILE ?auto_162831 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_162840 - BLOCK
    )
    :vars
    (
      ?auto_162847 - BLOCK
      ?auto_162845 - BLOCK
      ?auto_162843 - BLOCK
      ?auto_162848 - BLOCK
      ?auto_162842 - BLOCK
      ?auto_162846 - BLOCK
      ?auto_162841 - BLOCK
      ?auto_162844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162847 ?auto_162840 ) ( ON-TABLE ?auto_162840 ) ( not ( = ?auto_162840 ?auto_162847 ) ) ( not ( = ?auto_162840 ?auto_162845 ) ) ( not ( = ?auto_162840 ?auto_162843 ) ) ( not ( = ?auto_162847 ?auto_162845 ) ) ( not ( = ?auto_162847 ?auto_162843 ) ) ( not ( = ?auto_162845 ?auto_162843 ) ) ( ON ?auto_162845 ?auto_162847 ) ( ON-TABLE ?auto_162848 ) ( ON ?auto_162842 ?auto_162848 ) ( not ( = ?auto_162848 ?auto_162842 ) ) ( not ( = ?auto_162848 ?auto_162846 ) ) ( not ( = ?auto_162848 ?auto_162841 ) ) ( not ( = ?auto_162848 ?auto_162844 ) ) ( not ( = ?auto_162848 ?auto_162843 ) ) ( not ( = ?auto_162842 ?auto_162846 ) ) ( not ( = ?auto_162842 ?auto_162841 ) ) ( not ( = ?auto_162842 ?auto_162844 ) ) ( not ( = ?auto_162842 ?auto_162843 ) ) ( not ( = ?auto_162846 ?auto_162841 ) ) ( not ( = ?auto_162846 ?auto_162844 ) ) ( not ( = ?auto_162846 ?auto_162843 ) ) ( not ( = ?auto_162841 ?auto_162844 ) ) ( not ( = ?auto_162841 ?auto_162843 ) ) ( not ( = ?auto_162844 ?auto_162843 ) ) ( not ( = ?auto_162840 ?auto_162844 ) ) ( not ( = ?auto_162840 ?auto_162848 ) ) ( not ( = ?auto_162840 ?auto_162842 ) ) ( not ( = ?auto_162840 ?auto_162846 ) ) ( not ( = ?auto_162840 ?auto_162841 ) ) ( not ( = ?auto_162847 ?auto_162844 ) ) ( not ( = ?auto_162847 ?auto_162848 ) ) ( not ( = ?auto_162847 ?auto_162842 ) ) ( not ( = ?auto_162847 ?auto_162846 ) ) ( not ( = ?auto_162847 ?auto_162841 ) ) ( not ( = ?auto_162845 ?auto_162844 ) ) ( not ( = ?auto_162845 ?auto_162848 ) ) ( not ( = ?auto_162845 ?auto_162842 ) ) ( not ( = ?auto_162845 ?auto_162846 ) ) ( not ( = ?auto_162845 ?auto_162841 ) ) ( ON ?auto_162843 ?auto_162845 ) ( ON ?auto_162844 ?auto_162843 ) ( ON ?auto_162841 ?auto_162844 ) ( CLEAR ?auto_162841 ) ( HOLDING ?auto_162846 ) ( CLEAR ?auto_162842 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162848 ?auto_162842 ?auto_162846 )
      ( MAKE-1PILE ?auto_162840 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_162849 - BLOCK
    )
    :vars
    (
      ?auto_162856 - BLOCK
      ?auto_162852 - BLOCK
      ?auto_162855 - BLOCK
      ?auto_162850 - BLOCK
      ?auto_162854 - BLOCK
      ?auto_162857 - BLOCK
      ?auto_162851 - BLOCK
      ?auto_162853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162856 ?auto_162849 ) ( ON-TABLE ?auto_162849 ) ( not ( = ?auto_162849 ?auto_162856 ) ) ( not ( = ?auto_162849 ?auto_162852 ) ) ( not ( = ?auto_162849 ?auto_162855 ) ) ( not ( = ?auto_162856 ?auto_162852 ) ) ( not ( = ?auto_162856 ?auto_162855 ) ) ( not ( = ?auto_162852 ?auto_162855 ) ) ( ON ?auto_162852 ?auto_162856 ) ( ON-TABLE ?auto_162850 ) ( ON ?auto_162854 ?auto_162850 ) ( not ( = ?auto_162850 ?auto_162854 ) ) ( not ( = ?auto_162850 ?auto_162857 ) ) ( not ( = ?auto_162850 ?auto_162851 ) ) ( not ( = ?auto_162850 ?auto_162853 ) ) ( not ( = ?auto_162850 ?auto_162855 ) ) ( not ( = ?auto_162854 ?auto_162857 ) ) ( not ( = ?auto_162854 ?auto_162851 ) ) ( not ( = ?auto_162854 ?auto_162853 ) ) ( not ( = ?auto_162854 ?auto_162855 ) ) ( not ( = ?auto_162857 ?auto_162851 ) ) ( not ( = ?auto_162857 ?auto_162853 ) ) ( not ( = ?auto_162857 ?auto_162855 ) ) ( not ( = ?auto_162851 ?auto_162853 ) ) ( not ( = ?auto_162851 ?auto_162855 ) ) ( not ( = ?auto_162853 ?auto_162855 ) ) ( not ( = ?auto_162849 ?auto_162853 ) ) ( not ( = ?auto_162849 ?auto_162850 ) ) ( not ( = ?auto_162849 ?auto_162854 ) ) ( not ( = ?auto_162849 ?auto_162857 ) ) ( not ( = ?auto_162849 ?auto_162851 ) ) ( not ( = ?auto_162856 ?auto_162853 ) ) ( not ( = ?auto_162856 ?auto_162850 ) ) ( not ( = ?auto_162856 ?auto_162854 ) ) ( not ( = ?auto_162856 ?auto_162857 ) ) ( not ( = ?auto_162856 ?auto_162851 ) ) ( not ( = ?auto_162852 ?auto_162853 ) ) ( not ( = ?auto_162852 ?auto_162850 ) ) ( not ( = ?auto_162852 ?auto_162854 ) ) ( not ( = ?auto_162852 ?auto_162857 ) ) ( not ( = ?auto_162852 ?auto_162851 ) ) ( ON ?auto_162855 ?auto_162852 ) ( ON ?auto_162853 ?auto_162855 ) ( ON ?auto_162851 ?auto_162853 ) ( CLEAR ?auto_162854 ) ( ON ?auto_162857 ?auto_162851 ) ( CLEAR ?auto_162857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162849 ?auto_162856 ?auto_162852 ?auto_162855 ?auto_162853 ?auto_162851 )
      ( MAKE-1PILE ?auto_162849 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_162858 - BLOCK
    )
    :vars
    (
      ?auto_162859 - BLOCK
      ?auto_162866 - BLOCK
      ?auto_162864 - BLOCK
      ?auto_162862 - BLOCK
      ?auto_162861 - BLOCK
      ?auto_162863 - BLOCK
      ?auto_162865 - BLOCK
      ?auto_162860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162859 ?auto_162858 ) ( ON-TABLE ?auto_162858 ) ( not ( = ?auto_162858 ?auto_162859 ) ) ( not ( = ?auto_162858 ?auto_162866 ) ) ( not ( = ?auto_162858 ?auto_162864 ) ) ( not ( = ?auto_162859 ?auto_162866 ) ) ( not ( = ?auto_162859 ?auto_162864 ) ) ( not ( = ?auto_162866 ?auto_162864 ) ) ( ON ?auto_162866 ?auto_162859 ) ( ON-TABLE ?auto_162862 ) ( not ( = ?auto_162862 ?auto_162861 ) ) ( not ( = ?auto_162862 ?auto_162863 ) ) ( not ( = ?auto_162862 ?auto_162865 ) ) ( not ( = ?auto_162862 ?auto_162860 ) ) ( not ( = ?auto_162862 ?auto_162864 ) ) ( not ( = ?auto_162861 ?auto_162863 ) ) ( not ( = ?auto_162861 ?auto_162865 ) ) ( not ( = ?auto_162861 ?auto_162860 ) ) ( not ( = ?auto_162861 ?auto_162864 ) ) ( not ( = ?auto_162863 ?auto_162865 ) ) ( not ( = ?auto_162863 ?auto_162860 ) ) ( not ( = ?auto_162863 ?auto_162864 ) ) ( not ( = ?auto_162865 ?auto_162860 ) ) ( not ( = ?auto_162865 ?auto_162864 ) ) ( not ( = ?auto_162860 ?auto_162864 ) ) ( not ( = ?auto_162858 ?auto_162860 ) ) ( not ( = ?auto_162858 ?auto_162862 ) ) ( not ( = ?auto_162858 ?auto_162861 ) ) ( not ( = ?auto_162858 ?auto_162863 ) ) ( not ( = ?auto_162858 ?auto_162865 ) ) ( not ( = ?auto_162859 ?auto_162860 ) ) ( not ( = ?auto_162859 ?auto_162862 ) ) ( not ( = ?auto_162859 ?auto_162861 ) ) ( not ( = ?auto_162859 ?auto_162863 ) ) ( not ( = ?auto_162859 ?auto_162865 ) ) ( not ( = ?auto_162866 ?auto_162860 ) ) ( not ( = ?auto_162866 ?auto_162862 ) ) ( not ( = ?auto_162866 ?auto_162861 ) ) ( not ( = ?auto_162866 ?auto_162863 ) ) ( not ( = ?auto_162866 ?auto_162865 ) ) ( ON ?auto_162864 ?auto_162866 ) ( ON ?auto_162860 ?auto_162864 ) ( ON ?auto_162865 ?auto_162860 ) ( ON ?auto_162863 ?auto_162865 ) ( CLEAR ?auto_162863 ) ( HOLDING ?auto_162861 ) ( CLEAR ?auto_162862 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162862 ?auto_162861 )
      ( MAKE-1PILE ?auto_162858 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165037 - BLOCK
    )
    :vars
    (
      ?auto_165040 - BLOCK
      ?auto_165043 - BLOCK
      ?auto_165042 - BLOCK
      ?auto_165039 - BLOCK
      ?auto_165041 - BLOCK
      ?auto_165044 - BLOCK
      ?auto_165038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165040 ?auto_165037 ) ( ON-TABLE ?auto_165037 ) ( not ( = ?auto_165037 ?auto_165040 ) ) ( not ( = ?auto_165037 ?auto_165043 ) ) ( not ( = ?auto_165037 ?auto_165042 ) ) ( not ( = ?auto_165040 ?auto_165043 ) ) ( not ( = ?auto_165040 ?auto_165042 ) ) ( not ( = ?auto_165043 ?auto_165042 ) ) ( ON ?auto_165043 ?auto_165040 ) ( not ( = ?auto_165039 ?auto_165041 ) ) ( not ( = ?auto_165039 ?auto_165044 ) ) ( not ( = ?auto_165039 ?auto_165038 ) ) ( not ( = ?auto_165039 ?auto_165042 ) ) ( not ( = ?auto_165041 ?auto_165044 ) ) ( not ( = ?auto_165041 ?auto_165038 ) ) ( not ( = ?auto_165041 ?auto_165042 ) ) ( not ( = ?auto_165044 ?auto_165038 ) ) ( not ( = ?auto_165044 ?auto_165042 ) ) ( not ( = ?auto_165038 ?auto_165042 ) ) ( not ( = ?auto_165037 ?auto_165038 ) ) ( not ( = ?auto_165037 ?auto_165039 ) ) ( not ( = ?auto_165037 ?auto_165041 ) ) ( not ( = ?auto_165037 ?auto_165044 ) ) ( not ( = ?auto_165040 ?auto_165038 ) ) ( not ( = ?auto_165040 ?auto_165039 ) ) ( not ( = ?auto_165040 ?auto_165041 ) ) ( not ( = ?auto_165040 ?auto_165044 ) ) ( not ( = ?auto_165043 ?auto_165038 ) ) ( not ( = ?auto_165043 ?auto_165039 ) ) ( not ( = ?auto_165043 ?auto_165041 ) ) ( not ( = ?auto_165043 ?auto_165044 ) ) ( ON ?auto_165042 ?auto_165043 ) ( ON ?auto_165038 ?auto_165042 ) ( ON ?auto_165044 ?auto_165038 ) ( ON ?auto_165041 ?auto_165044 ) ( ON ?auto_165039 ?auto_165041 ) ( CLEAR ?auto_165039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165037 ?auto_165040 ?auto_165043 ?auto_165042 ?auto_165038 ?auto_165044 ?auto_165041 )
      ( MAKE-1PILE ?auto_165037 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_162876 - BLOCK
    )
    :vars
    (
      ?auto_162883 - BLOCK
      ?auto_162880 - BLOCK
      ?auto_162881 - BLOCK
      ?auto_162882 - BLOCK
      ?auto_162878 - BLOCK
      ?auto_162877 - BLOCK
      ?auto_162879 - BLOCK
      ?auto_162884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162883 ?auto_162876 ) ( ON-TABLE ?auto_162876 ) ( not ( = ?auto_162876 ?auto_162883 ) ) ( not ( = ?auto_162876 ?auto_162880 ) ) ( not ( = ?auto_162876 ?auto_162881 ) ) ( not ( = ?auto_162883 ?auto_162880 ) ) ( not ( = ?auto_162883 ?auto_162881 ) ) ( not ( = ?auto_162880 ?auto_162881 ) ) ( ON ?auto_162880 ?auto_162883 ) ( not ( = ?auto_162882 ?auto_162878 ) ) ( not ( = ?auto_162882 ?auto_162877 ) ) ( not ( = ?auto_162882 ?auto_162879 ) ) ( not ( = ?auto_162882 ?auto_162884 ) ) ( not ( = ?auto_162882 ?auto_162881 ) ) ( not ( = ?auto_162878 ?auto_162877 ) ) ( not ( = ?auto_162878 ?auto_162879 ) ) ( not ( = ?auto_162878 ?auto_162884 ) ) ( not ( = ?auto_162878 ?auto_162881 ) ) ( not ( = ?auto_162877 ?auto_162879 ) ) ( not ( = ?auto_162877 ?auto_162884 ) ) ( not ( = ?auto_162877 ?auto_162881 ) ) ( not ( = ?auto_162879 ?auto_162884 ) ) ( not ( = ?auto_162879 ?auto_162881 ) ) ( not ( = ?auto_162884 ?auto_162881 ) ) ( not ( = ?auto_162876 ?auto_162884 ) ) ( not ( = ?auto_162876 ?auto_162882 ) ) ( not ( = ?auto_162876 ?auto_162878 ) ) ( not ( = ?auto_162876 ?auto_162877 ) ) ( not ( = ?auto_162876 ?auto_162879 ) ) ( not ( = ?auto_162883 ?auto_162884 ) ) ( not ( = ?auto_162883 ?auto_162882 ) ) ( not ( = ?auto_162883 ?auto_162878 ) ) ( not ( = ?auto_162883 ?auto_162877 ) ) ( not ( = ?auto_162883 ?auto_162879 ) ) ( not ( = ?auto_162880 ?auto_162884 ) ) ( not ( = ?auto_162880 ?auto_162882 ) ) ( not ( = ?auto_162880 ?auto_162878 ) ) ( not ( = ?auto_162880 ?auto_162877 ) ) ( not ( = ?auto_162880 ?auto_162879 ) ) ( ON ?auto_162881 ?auto_162880 ) ( ON ?auto_162884 ?auto_162881 ) ( ON ?auto_162879 ?auto_162884 ) ( ON ?auto_162877 ?auto_162879 ) ( ON ?auto_162878 ?auto_162877 ) ( CLEAR ?auto_162878 ) ( HOLDING ?auto_162882 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162882 )
      ( MAKE-1PILE ?auto_162876 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_162885 - BLOCK
    )
    :vars
    (
      ?auto_162886 - BLOCK
      ?auto_162889 - BLOCK
      ?auto_162893 - BLOCK
      ?auto_162892 - BLOCK
      ?auto_162888 - BLOCK
      ?auto_162890 - BLOCK
      ?auto_162887 - BLOCK
      ?auto_162891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162886 ?auto_162885 ) ( ON-TABLE ?auto_162885 ) ( not ( = ?auto_162885 ?auto_162886 ) ) ( not ( = ?auto_162885 ?auto_162889 ) ) ( not ( = ?auto_162885 ?auto_162893 ) ) ( not ( = ?auto_162886 ?auto_162889 ) ) ( not ( = ?auto_162886 ?auto_162893 ) ) ( not ( = ?auto_162889 ?auto_162893 ) ) ( ON ?auto_162889 ?auto_162886 ) ( not ( = ?auto_162892 ?auto_162888 ) ) ( not ( = ?auto_162892 ?auto_162890 ) ) ( not ( = ?auto_162892 ?auto_162887 ) ) ( not ( = ?auto_162892 ?auto_162891 ) ) ( not ( = ?auto_162892 ?auto_162893 ) ) ( not ( = ?auto_162888 ?auto_162890 ) ) ( not ( = ?auto_162888 ?auto_162887 ) ) ( not ( = ?auto_162888 ?auto_162891 ) ) ( not ( = ?auto_162888 ?auto_162893 ) ) ( not ( = ?auto_162890 ?auto_162887 ) ) ( not ( = ?auto_162890 ?auto_162891 ) ) ( not ( = ?auto_162890 ?auto_162893 ) ) ( not ( = ?auto_162887 ?auto_162891 ) ) ( not ( = ?auto_162887 ?auto_162893 ) ) ( not ( = ?auto_162891 ?auto_162893 ) ) ( not ( = ?auto_162885 ?auto_162891 ) ) ( not ( = ?auto_162885 ?auto_162892 ) ) ( not ( = ?auto_162885 ?auto_162888 ) ) ( not ( = ?auto_162885 ?auto_162890 ) ) ( not ( = ?auto_162885 ?auto_162887 ) ) ( not ( = ?auto_162886 ?auto_162891 ) ) ( not ( = ?auto_162886 ?auto_162892 ) ) ( not ( = ?auto_162886 ?auto_162888 ) ) ( not ( = ?auto_162886 ?auto_162890 ) ) ( not ( = ?auto_162886 ?auto_162887 ) ) ( not ( = ?auto_162889 ?auto_162891 ) ) ( not ( = ?auto_162889 ?auto_162892 ) ) ( not ( = ?auto_162889 ?auto_162888 ) ) ( not ( = ?auto_162889 ?auto_162890 ) ) ( not ( = ?auto_162889 ?auto_162887 ) ) ( ON ?auto_162893 ?auto_162889 ) ( ON ?auto_162891 ?auto_162893 ) ( ON ?auto_162887 ?auto_162891 ) ( ON ?auto_162890 ?auto_162887 ) ( ON ?auto_162888 ?auto_162890 ) ( ON ?auto_162892 ?auto_162888 ) ( CLEAR ?auto_162892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162885 ?auto_162886 ?auto_162889 ?auto_162893 ?auto_162891 ?auto_162887 ?auto_162890 ?auto_162888 )
      ( MAKE-1PILE ?auto_162885 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162902 - BLOCK
      ?auto_162903 - BLOCK
      ?auto_162904 - BLOCK
      ?auto_162905 - BLOCK
      ?auto_162906 - BLOCK
      ?auto_162907 - BLOCK
      ?auto_162908 - BLOCK
      ?auto_162909 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_162909 ) ( CLEAR ?auto_162908 ) ( ON-TABLE ?auto_162902 ) ( ON ?auto_162903 ?auto_162902 ) ( ON ?auto_162904 ?auto_162903 ) ( ON ?auto_162905 ?auto_162904 ) ( ON ?auto_162906 ?auto_162905 ) ( ON ?auto_162907 ?auto_162906 ) ( ON ?auto_162908 ?auto_162907 ) ( not ( = ?auto_162902 ?auto_162903 ) ) ( not ( = ?auto_162902 ?auto_162904 ) ) ( not ( = ?auto_162902 ?auto_162905 ) ) ( not ( = ?auto_162902 ?auto_162906 ) ) ( not ( = ?auto_162902 ?auto_162907 ) ) ( not ( = ?auto_162902 ?auto_162908 ) ) ( not ( = ?auto_162902 ?auto_162909 ) ) ( not ( = ?auto_162903 ?auto_162904 ) ) ( not ( = ?auto_162903 ?auto_162905 ) ) ( not ( = ?auto_162903 ?auto_162906 ) ) ( not ( = ?auto_162903 ?auto_162907 ) ) ( not ( = ?auto_162903 ?auto_162908 ) ) ( not ( = ?auto_162903 ?auto_162909 ) ) ( not ( = ?auto_162904 ?auto_162905 ) ) ( not ( = ?auto_162904 ?auto_162906 ) ) ( not ( = ?auto_162904 ?auto_162907 ) ) ( not ( = ?auto_162904 ?auto_162908 ) ) ( not ( = ?auto_162904 ?auto_162909 ) ) ( not ( = ?auto_162905 ?auto_162906 ) ) ( not ( = ?auto_162905 ?auto_162907 ) ) ( not ( = ?auto_162905 ?auto_162908 ) ) ( not ( = ?auto_162905 ?auto_162909 ) ) ( not ( = ?auto_162906 ?auto_162907 ) ) ( not ( = ?auto_162906 ?auto_162908 ) ) ( not ( = ?auto_162906 ?auto_162909 ) ) ( not ( = ?auto_162907 ?auto_162908 ) ) ( not ( = ?auto_162907 ?auto_162909 ) ) ( not ( = ?auto_162908 ?auto_162909 ) ) )
    :subtasks
    ( ( !STACK ?auto_162909 ?auto_162908 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162910 - BLOCK
      ?auto_162911 - BLOCK
      ?auto_162912 - BLOCK
      ?auto_162913 - BLOCK
      ?auto_162914 - BLOCK
      ?auto_162915 - BLOCK
      ?auto_162916 - BLOCK
      ?auto_162917 - BLOCK
    )
    :vars
    (
      ?auto_162918 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162916 ) ( ON-TABLE ?auto_162910 ) ( ON ?auto_162911 ?auto_162910 ) ( ON ?auto_162912 ?auto_162911 ) ( ON ?auto_162913 ?auto_162912 ) ( ON ?auto_162914 ?auto_162913 ) ( ON ?auto_162915 ?auto_162914 ) ( ON ?auto_162916 ?auto_162915 ) ( not ( = ?auto_162910 ?auto_162911 ) ) ( not ( = ?auto_162910 ?auto_162912 ) ) ( not ( = ?auto_162910 ?auto_162913 ) ) ( not ( = ?auto_162910 ?auto_162914 ) ) ( not ( = ?auto_162910 ?auto_162915 ) ) ( not ( = ?auto_162910 ?auto_162916 ) ) ( not ( = ?auto_162910 ?auto_162917 ) ) ( not ( = ?auto_162911 ?auto_162912 ) ) ( not ( = ?auto_162911 ?auto_162913 ) ) ( not ( = ?auto_162911 ?auto_162914 ) ) ( not ( = ?auto_162911 ?auto_162915 ) ) ( not ( = ?auto_162911 ?auto_162916 ) ) ( not ( = ?auto_162911 ?auto_162917 ) ) ( not ( = ?auto_162912 ?auto_162913 ) ) ( not ( = ?auto_162912 ?auto_162914 ) ) ( not ( = ?auto_162912 ?auto_162915 ) ) ( not ( = ?auto_162912 ?auto_162916 ) ) ( not ( = ?auto_162912 ?auto_162917 ) ) ( not ( = ?auto_162913 ?auto_162914 ) ) ( not ( = ?auto_162913 ?auto_162915 ) ) ( not ( = ?auto_162913 ?auto_162916 ) ) ( not ( = ?auto_162913 ?auto_162917 ) ) ( not ( = ?auto_162914 ?auto_162915 ) ) ( not ( = ?auto_162914 ?auto_162916 ) ) ( not ( = ?auto_162914 ?auto_162917 ) ) ( not ( = ?auto_162915 ?auto_162916 ) ) ( not ( = ?auto_162915 ?auto_162917 ) ) ( not ( = ?auto_162916 ?auto_162917 ) ) ( ON ?auto_162917 ?auto_162918 ) ( CLEAR ?auto_162917 ) ( HAND-EMPTY ) ( not ( = ?auto_162910 ?auto_162918 ) ) ( not ( = ?auto_162911 ?auto_162918 ) ) ( not ( = ?auto_162912 ?auto_162918 ) ) ( not ( = ?auto_162913 ?auto_162918 ) ) ( not ( = ?auto_162914 ?auto_162918 ) ) ( not ( = ?auto_162915 ?auto_162918 ) ) ( not ( = ?auto_162916 ?auto_162918 ) ) ( not ( = ?auto_162917 ?auto_162918 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162917 ?auto_162918 )
      ( MAKE-8PILE ?auto_162910 ?auto_162911 ?auto_162912 ?auto_162913 ?auto_162914 ?auto_162915 ?auto_162916 ?auto_162917 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162919 - BLOCK
      ?auto_162920 - BLOCK
      ?auto_162921 - BLOCK
      ?auto_162922 - BLOCK
      ?auto_162923 - BLOCK
      ?auto_162924 - BLOCK
      ?auto_162925 - BLOCK
      ?auto_162926 - BLOCK
    )
    :vars
    (
      ?auto_162927 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162919 ) ( ON ?auto_162920 ?auto_162919 ) ( ON ?auto_162921 ?auto_162920 ) ( ON ?auto_162922 ?auto_162921 ) ( ON ?auto_162923 ?auto_162922 ) ( ON ?auto_162924 ?auto_162923 ) ( not ( = ?auto_162919 ?auto_162920 ) ) ( not ( = ?auto_162919 ?auto_162921 ) ) ( not ( = ?auto_162919 ?auto_162922 ) ) ( not ( = ?auto_162919 ?auto_162923 ) ) ( not ( = ?auto_162919 ?auto_162924 ) ) ( not ( = ?auto_162919 ?auto_162925 ) ) ( not ( = ?auto_162919 ?auto_162926 ) ) ( not ( = ?auto_162920 ?auto_162921 ) ) ( not ( = ?auto_162920 ?auto_162922 ) ) ( not ( = ?auto_162920 ?auto_162923 ) ) ( not ( = ?auto_162920 ?auto_162924 ) ) ( not ( = ?auto_162920 ?auto_162925 ) ) ( not ( = ?auto_162920 ?auto_162926 ) ) ( not ( = ?auto_162921 ?auto_162922 ) ) ( not ( = ?auto_162921 ?auto_162923 ) ) ( not ( = ?auto_162921 ?auto_162924 ) ) ( not ( = ?auto_162921 ?auto_162925 ) ) ( not ( = ?auto_162921 ?auto_162926 ) ) ( not ( = ?auto_162922 ?auto_162923 ) ) ( not ( = ?auto_162922 ?auto_162924 ) ) ( not ( = ?auto_162922 ?auto_162925 ) ) ( not ( = ?auto_162922 ?auto_162926 ) ) ( not ( = ?auto_162923 ?auto_162924 ) ) ( not ( = ?auto_162923 ?auto_162925 ) ) ( not ( = ?auto_162923 ?auto_162926 ) ) ( not ( = ?auto_162924 ?auto_162925 ) ) ( not ( = ?auto_162924 ?auto_162926 ) ) ( not ( = ?auto_162925 ?auto_162926 ) ) ( ON ?auto_162926 ?auto_162927 ) ( CLEAR ?auto_162926 ) ( not ( = ?auto_162919 ?auto_162927 ) ) ( not ( = ?auto_162920 ?auto_162927 ) ) ( not ( = ?auto_162921 ?auto_162927 ) ) ( not ( = ?auto_162922 ?auto_162927 ) ) ( not ( = ?auto_162923 ?auto_162927 ) ) ( not ( = ?auto_162924 ?auto_162927 ) ) ( not ( = ?auto_162925 ?auto_162927 ) ) ( not ( = ?auto_162926 ?auto_162927 ) ) ( HOLDING ?auto_162925 ) ( CLEAR ?auto_162924 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162919 ?auto_162920 ?auto_162921 ?auto_162922 ?auto_162923 ?auto_162924 ?auto_162925 )
      ( MAKE-8PILE ?auto_162919 ?auto_162920 ?auto_162921 ?auto_162922 ?auto_162923 ?auto_162924 ?auto_162925 ?auto_162926 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162928 - BLOCK
      ?auto_162929 - BLOCK
      ?auto_162930 - BLOCK
      ?auto_162931 - BLOCK
      ?auto_162932 - BLOCK
      ?auto_162933 - BLOCK
      ?auto_162934 - BLOCK
      ?auto_162935 - BLOCK
    )
    :vars
    (
      ?auto_162936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162928 ) ( ON ?auto_162929 ?auto_162928 ) ( ON ?auto_162930 ?auto_162929 ) ( ON ?auto_162931 ?auto_162930 ) ( ON ?auto_162932 ?auto_162931 ) ( ON ?auto_162933 ?auto_162932 ) ( not ( = ?auto_162928 ?auto_162929 ) ) ( not ( = ?auto_162928 ?auto_162930 ) ) ( not ( = ?auto_162928 ?auto_162931 ) ) ( not ( = ?auto_162928 ?auto_162932 ) ) ( not ( = ?auto_162928 ?auto_162933 ) ) ( not ( = ?auto_162928 ?auto_162934 ) ) ( not ( = ?auto_162928 ?auto_162935 ) ) ( not ( = ?auto_162929 ?auto_162930 ) ) ( not ( = ?auto_162929 ?auto_162931 ) ) ( not ( = ?auto_162929 ?auto_162932 ) ) ( not ( = ?auto_162929 ?auto_162933 ) ) ( not ( = ?auto_162929 ?auto_162934 ) ) ( not ( = ?auto_162929 ?auto_162935 ) ) ( not ( = ?auto_162930 ?auto_162931 ) ) ( not ( = ?auto_162930 ?auto_162932 ) ) ( not ( = ?auto_162930 ?auto_162933 ) ) ( not ( = ?auto_162930 ?auto_162934 ) ) ( not ( = ?auto_162930 ?auto_162935 ) ) ( not ( = ?auto_162931 ?auto_162932 ) ) ( not ( = ?auto_162931 ?auto_162933 ) ) ( not ( = ?auto_162931 ?auto_162934 ) ) ( not ( = ?auto_162931 ?auto_162935 ) ) ( not ( = ?auto_162932 ?auto_162933 ) ) ( not ( = ?auto_162932 ?auto_162934 ) ) ( not ( = ?auto_162932 ?auto_162935 ) ) ( not ( = ?auto_162933 ?auto_162934 ) ) ( not ( = ?auto_162933 ?auto_162935 ) ) ( not ( = ?auto_162934 ?auto_162935 ) ) ( ON ?auto_162935 ?auto_162936 ) ( not ( = ?auto_162928 ?auto_162936 ) ) ( not ( = ?auto_162929 ?auto_162936 ) ) ( not ( = ?auto_162930 ?auto_162936 ) ) ( not ( = ?auto_162931 ?auto_162936 ) ) ( not ( = ?auto_162932 ?auto_162936 ) ) ( not ( = ?auto_162933 ?auto_162936 ) ) ( not ( = ?auto_162934 ?auto_162936 ) ) ( not ( = ?auto_162935 ?auto_162936 ) ) ( CLEAR ?auto_162933 ) ( ON ?auto_162934 ?auto_162935 ) ( CLEAR ?auto_162934 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162936 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162936 ?auto_162935 )
      ( MAKE-8PILE ?auto_162928 ?auto_162929 ?auto_162930 ?auto_162931 ?auto_162932 ?auto_162933 ?auto_162934 ?auto_162935 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162937 - BLOCK
      ?auto_162938 - BLOCK
      ?auto_162939 - BLOCK
      ?auto_162940 - BLOCK
      ?auto_162941 - BLOCK
      ?auto_162942 - BLOCK
      ?auto_162943 - BLOCK
      ?auto_162944 - BLOCK
    )
    :vars
    (
      ?auto_162945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162937 ) ( ON ?auto_162938 ?auto_162937 ) ( ON ?auto_162939 ?auto_162938 ) ( ON ?auto_162940 ?auto_162939 ) ( ON ?auto_162941 ?auto_162940 ) ( not ( = ?auto_162937 ?auto_162938 ) ) ( not ( = ?auto_162937 ?auto_162939 ) ) ( not ( = ?auto_162937 ?auto_162940 ) ) ( not ( = ?auto_162937 ?auto_162941 ) ) ( not ( = ?auto_162937 ?auto_162942 ) ) ( not ( = ?auto_162937 ?auto_162943 ) ) ( not ( = ?auto_162937 ?auto_162944 ) ) ( not ( = ?auto_162938 ?auto_162939 ) ) ( not ( = ?auto_162938 ?auto_162940 ) ) ( not ( = ?auto_162938 ?auto_162941 ) ) ( not ( = ?auto_162938 ?auto_162942 ) ) ( not ( = ?auto_162938 ?auto_162943 ) ) ( not ( = ?auto_162938 ?auto_162944 ) ) ( not ( = ?auto_162939 ?auto_162940 ) ) ( not ( = ?auto_162939 ?auto_162941 ) ) ( not ( = ?auto_162939 ?auto_162942 ) ) ( not ( = ?auto_162939 ?auto_162943 ) ) ( not ( = ?auto_162939 ?auto_162944 ) ) ( not ( = ?auto_162940 ?auto_162941 ) ) ( not ( = ?auto_162940 ?auto_162942 ) ) ( not ( = ?auto_162940 ?auto_162943 ) ) ( not ( = ?auto_162940 ?auto_162944 ) ) ( not ( = ?auto_162941 ?auto_162942 ) ) ( not ( = ?auto_162941 ?auto_162943 ) ) ( not ( = ?auto_162941 ?auto_162944 ) ) ( not ( = ?auto_162942 ?auto_162943 ) ) ( not ( = ?auto_162942 ?auto_162944 ) ) ( not ( = ?auto_162943 ?auto_162944 ) ) ( ON ?auto_162944 ?auto_162945 ) ( not ( = ?auto_162937 ?auto_162945 ) ) ( not ( = ?auto_162938 ?auto_162945 ) ) ( not ( = ?auto_162939 ?auto_162945 ) ) ( not ( = ?auto_162940 ?auto_162945 ) ) ( not ( = ?auto_162941 ?auto_162945 ) ) ( not ( = ?auto_162942 ?auto_162945 ) ) ( not ( = ?auto_162943 ?auto_162945 ) ) ( not ( = ?auto_162944 ?auto_162945 ) ) ( ON ?auto_162943 ?auto_162944 ) ( CLEAR ?auto_162943 ) ( ON-TABLE ?auto_162945 ) ( HOLDING ?auto_162942 ) ( CLEAR ?auto_162941 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162937 ?auto_162938 ?auto_162939 ?auto_162940 ?auto_162941 ?auto_162942 )
      ( MAKE-8PILE ?auto_162937 ?auto_162938 ?auto_162939 ?auto_162940 ?auto_162941 ?auto_162942 ?auto_162943 ?auto_162944 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162946 - BLOCK
      ?auto_162947 - BLOCK
      ?auto_162948 - BLOCK
      ?auto_162949 - BLOCK
      ?auto_162950 - BLOCK
      ?auto_162951 - BLOCK
      ?auto_162952 - BLOCK
      ?auto_162953 - BLOCK
    )
    :vars
    (
      ?auto_162954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162946 ) ( ON ?auto_162947 ?auto_162946 ) ( ON ?auto_162948 ?auto_162947 ) ( ON ?auto_162949 ?auto_162948 ) ( ON ?auto_162950 ?auto_162949 ) ( not ( = ?auto_162946 ?auto_162947 ) ) ( not ( = ?auto_162946 ?auto_162948 ) ) ( not ( = ?auto_162946 ?auto_162949 ) ) ( not ( = ?auto_162946 ?auto_162950 ) ) ( not ( = ?auto_162946 ?auto_162951 ) ) ( not ( = ?auto_162946 ?auto_162952 ) ) ( not ( = ?auto_162946 ?auto_162953 ) ) ( not ( = ?auto_162947 ?auto_162948 ) ) ( not ( = ?auto_162947 ?auto_162949 ) ) ( not ( = ?auto_162947 ?auto_162950 ) ) ( not ( = ?auto_162947 ?auto_162951 ) ) ( not ( = ?auto_162947 ?auto_162952 ) ) ( not ( = ?auto_162947 ?auto_162953 ) ) ( not ( = ?auto_162948 ?auto_162949 ) ) ( not ( = ?auto_162948 ?auto_162950 ) ) ( not ( = ?auto_162948 ?auto_162951 ) ) ( not ( = ?auto_162948 ?auto_162952 ) ) ( not ( = ?auto_162948 ?auto_162953 ) ) ( not ( = ?auto_162949 ?auto_162950 ) ) ( not ( = ?auto_162949 ?auto_162951 ) ) ( not ( = ?auto_162949 ?auto_162952 ) ) ( not ( = ?auto_162949 ?auto_162953 ) ) ( not ( = ?auto_162950 ?auto_162951 ) ) ( not ( = ?auto_162950 ?auto_162952 ) ) ( not ( = ?auto_162950 ?auto_162953 ) ) ( not ( = ?auto_162951 ?auto_162952 ) ) ( not ( = ?auto_162951 ?auto_162953 ) ) ( not ( = ?auto_162952 ?auto_162953 ) ) ( ON ?auto_162953 ?auto_162954 ) ( not ( = ?auto_162946 ?auto_162954 ) ) ( not ( = ?auto_162947 ?auto_162954 ) ) ( not ( = ?auto_162948 ?auto_162954 ) ) ( not ( = ?auto_162949 ?auto_162954 ) ) ( not ( = ?auto_162950 ?auto_162954 ) ) ( not ( = ?auto_162951 ?auto_162954 ) ) ( not ( = ?auto_162952 ?auto_162954 ) ) ( not ( = ?auto_162953 ?auto_162954 ) ) ( ON ?auto_162952 ?auto_162953 ) ( ON-TABLE ?auto_162954 ) ( CLEAR ?auto_162950 ) ( ON ?auto_162951 ?auto_162952 ) ( CLEAR ?auto_162951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162954 ?auto_162953 ?auto_162952 )
      ( MAKE-8PILE ?auto_162946 ?auto_162947 ?auto_162948 ?auto_162949 ?auto_162950 ?auto_162951 ?auto_162952 ?auto_162953 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162955 - BLOCK
      ?auto_162956 - BLOCK
      ?auto_162957 - BLOCK
      ?auto_162958 - BLOCK
      ?auto_162959 - BLOCK
      ?auto_162960 - BLOCK
      ?auto_162961 - BLOCK
      ?auto_162962 - BLOCK
    )
    :vars
    (
      ?auto_162963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162955 ) ( ON ?auto_162956 ?auto_162955 ) ( ON ?auto_162957 ?auto_162956 ) ( ON ?auto_162958 ?auto_162957 ) ( not ( = ?auto_162955 ?auto_162956 ) ) ( not ( = ?auto_162955 ?auto_162957 ) ) ( not ( = ?auto_162955 ?auto_162958 ) ) ( not ( = ?auto_162955 ?auto_162959 ) ) ( not ( = ?auto_162955 ?auto_162960 ) ) ( not ( = ?auto_162955 ?auto_162961 ) ) ( not ( = ?auto_162955 ?auto_162962 ) ) ( not ( = ?auto_162956 ?auto_162957 ) ) ( not ( = ?auto_162956 ?auto_162958 ) ) ( not ( = ?auto_162956 ?auto_162959 ) ) ( not ( = ?auto_162956 ?auto_162960 ) ) ( not ( = ?auto_162956 ?auto_162961 ) ) ( not ( = ?auto_162956 ?auto_162962 ) ) ( not ( = ?auto_162957 ?auto_162958 ) ) ( not ( = ?auto_162957 ?auto_162959 ) ) ( not ( = ?auto_162957 ?auto_162960 ) ) ( not ( = ?auto_162957 ?auto_162961 ) ) ( not ( = ?auto_162957 ?auto_162962 ) ) ( not ( = ?auto_162958 ?auto_162959 ) ) ( not ( = ?auto_162958 ?auto_162960 ) ) ( not ( = ?auto_162958 ?auto_162961 ) ) ( not ( = ?auto_162958 ?auto_162962 ) ) ( not ( = ?auto_162959 ?auto_162960 ) ) ( not ( = ?auto_162959 ?auto_162961 ) ) ( not ( = ?auto_162959 ?auto_162962 ) ) ( not ( = ?auto_162960 ?auto_162961 ) ) ( not ( = ?auto_162960 ?auto_162962 ) ) ( not ( = ?auto_162961 ?auto_162962 ) ) ( ON ?auto_162962 ?auto_162963 ) ( not ( = ?auto_162955 ?auto_162963 ) ) ( not ( = ?auto_162956 ?auto_162963 ) ) ( not ( = ?auto_162957 ?auto_162963 ) ) ( not ( = ?auto_162958 ?auto_162963 ) ) ( not ( = ?auto_162959 ?auto_162963 ) ) ( not ( = ?auto_162960 ?auto_162963 ) ) ( not ( = ?auto_162961 ?auto_162963 ) ) ( not ( = ?auto_162962 ?auto_162963 ) ) ( ON ?auto_162961 ?auto_162962 ) ( ON-TABLE ?auto_162963 ) ( ON ?auto_162960 ?auto_162961 ) ( CLEAR ?auto_162960 ) ( HOLDING ?auto_162959 ) ( CLEAR ?auto_162958 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162955 ?auto_162956 ?auto_162957 ?auto_162958 ?auto_162959 )
      ( MAKE-8PILE ?auto_162955 ?auto_162956 ?auto_162957 ?auto_162958 ?auto_162959 ?auto_162960 ?auto_162961 ?auto_162962 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162964 - BLOCK
      ?auto_162965 - BLOCK
      ?auto_162966 - BLOCK
      ?auto_162967 - BLOCK
      ?auto_162968 - BLOCK
      ?auto_162969 - BLOCK
      ?auto_162970 - BLOCK
      ?auto_162971 - BLOCK
    )
    :vars
    (
      ?auto_162972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162964 ) ( ON ?auto_162965 ?auto_162964 ) ( ON ?auto_162966 ?auto_162965 ) ( ON ?auto_162967 ?auto_162966 ) ( not ( = ?auto_162964 ?auto_162965 ) ) ( not ( = ?auto_162964 ?auto_162966 ) ) ( not ( = ?auto_162964 ?auto_162967 ) ) ( not ( = ?auto_162964 ?auto_162968 ) ) ( not ( = ?auto_162964 ?auto_162969 ) ) ( not ( = ?auto_162964 ?auto_162970 ) ) ( not ( = ?auto_162964 ?auto_162971 ) ) ( not ( = ?auto_162965 ?auto_162966 ) ) ( not ( = ?auto_162965 ?auto_162967 ) ) ( not ( = ?auto_162965 ?auto_162968 ) ) ( not ( = ?auto_162965 ?auto_162969 ) ) ( not ( = ?auto_162965 ?auto_162970 ) ) ( not ( = ?auto_162965 ?auto_162971 ) ) ( not ( = ?auto_162966 ?auto_162967 ) ) ( not ( = ?auto_162966 ?auto_162968 ) ) ( not ( = ?auto_162966 ?auto_162969 ) ) ( not ( = ?auto_162966 ?auto_162970 ) ) ( not ( = ?auto_162966 ?auto_162971 ) ) ( not ( = ?auto_162967 ?auto_162968 ) ) ( not ( = ?auto_162967 ?auto_162969 ) ) ( not ( = ?auto_162967 ?auto_162970 ) ) ( not ( = ?auto_162967 ?auto_162971 ) ) ( not ( = ?auto_162968 ?auto_162969 ) ) ( not ( = ?auto_162968 ?auto_162970 ) ) ( not ( = ?auto_162968 ?auto_162971 ) ) ( not ( = ?auto_162969 ?auto_162970 ) ) ( not ( = ?auto_162969 ?auto_162971 ) ) ( not ( = ?auto_162970 ?auto_162971 ) ) ( ON ?auto_162971 ?auto_162972 ) ( not ( = ?auto_162964 ?auto_162972 ) ) ( not ( = ?auto_162965 ?auto_162972 ) ) ( not ( = ?auto_162966 ?auto_162972 ) ) ( not ( = ?auto_162967 ?auto_162972 ) ) ( not ( = ?auto_162968 ?auto_162972 ) ) ( not ( = ?auto_162969 ?auto_162972 ) ) ( not ( = ?auto_162970 ?auto_162972 ) ) ( not ( = ?auto_162971 ?auto_162972 ) ) ( ON ?auto_162970 ?auto_162971 ) ( ON-TABLE ?auto_162972 ) ( ON ?auto_162969 ?auto_162970 ) ( CLEAR ?auto_162967 ) ( ON ?auto_162968 ?auto_162969 ) ( CLEAR ?auto_162968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162972 ?auto_162971 ?auto_162970 ?auto_162969 )
      ( MAKE-8PILE ?auto_162964 ?auto_162965 ?auto_162966 ?auto_162967 ?auto_162968 ?auto_162969 ?auto_162970 ?auto_162971 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162973 - BLOCK
      ?auto_162974 - BLOCK
      ?auto_162975 - BLOCK
      ?auto_162976 - BLOCK
      ?auto_162977 - BLOCK
      ?auto_162978 - BLOCK
      ?auto_162979 - BLOCK
      ?auto_162980 - BLOCK
    )
    :vars
    (
      ?auto_162981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162973 ) ( ON ?auto_162974 ?auto_162973 ) ( ON ?auto_162975 ?auto_162974 ) ( not ( = ?auto_162973 ?auto_162974 ) ) ( not ( = ?auto_162973 ?auto_162975 ) ) ( not ( = ?auto_162973 ?auto_162976 ) ) ( not ( = ?auto_162973 ?auto_162977 ) ) ( not ( = ?auto_162973 ?auto_162978 ) ) ( not ( = ?auto_162973 ?auto_162979 ) ) ( not ( = ?auto_162973 ?auto_162980 ) ) ( not ( = ?auto_162974 ?auto_162975 ) ) ( not ( = ?auto_162974 ?auto_162976 ) ) ( not ( = ?auto_162974 ?auto_162977 ) ) ( not ( = ?auto_162974 ?auto_162978 ) ) ( not ( = ?auto_162974 ?auto_162979 ) ) ( not ( = ?auto_162974 ?auto_162980 ) ) ( not ( = ?auto_162975 ?auto_162976 ) ) ( not ( = ?auto_162975 ?auto_162977 ) ) ( not ( = ?auto_162975 ?auto_162978 ) ) ( not ( = ?auto_162975 ?auto_162979 ) ) ( not ( = ?auto_162975 ?auto_162980 ) ) ( not ( = ?auto_162976 ?auto_162977 ) ) ( not ( = ?auto_162976 ?auto_162978 ) ) ( not ( = ?auto_162976 ?auto_162979 ) ) ( not ( = ?auto_162976 ?auto_162980 ) ) ( not ( = ?auto_162977 ?auto_162978 ) ) ( not ( = ?auto_162977 ?auto_162979 ) ) ( not ( = ?auto_162977 ?auto_162980 ) ) ( not ( = ?auto_162978 ?auto_162979 ) ) ( not ( = ?auto_162978 ?auto_162980 ) ) ( not ( = ?auto_162979 ?auto_162980 ) ) ( ON ?auto_162980 ?auto_162981 ) ( not ( = ?auto_162973 ?auto_162981 ) ) ( not ( = ?auto_162974 ?auto_162981 ) ) ( not ( = ?auto_162975 ?auto_162981 ) ) ( not ( = ?auto_162976 ?auto_162981 ) ) ( not ( = ?auto_162977 ?auto_162981 ) ) ( not ( = ?auto_162978 ?auto_162981 ) ) ( not ( = ?auto_162979 ?auto_162981 ) ) ( not ( = ?auto_162980 ?auto_162981 ) ) ( ON ?auto_162979 ?auto_162980 ) ( ON-TABLE ?auto_162981 ) ( ON ?auto_162978 ?auto_162979 ) ( ON ?auto_162977 ?auto_162978 ) ( CLEAR ?auto_162977 ) ( HOLDING ?auto_162976 ) ( CLEAR ?auto_162975 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162973 ?auto_162974 ?auto_162975 ?auto_162976 )
      ( MAKE-8PILE ?auto_162973 ?auto_162974 ?auto_162975 ?auto_162976 ?auto_162977 ?auto_162978 ?auto_162979 ?auto_162980 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162982 - BLOCK
      ?auto_162983 - BLOCK
      ?auto_162984 - BLOCK
      ?auto_162985 - BLOCK
      ?auto_162986 - BLOCK
      ?auto_162987 - BLOCK
      ?auto_162988 - BLOCK
      ?auto_162989 - BLOCK
    )
    :vars
    (
      ?auto_162990 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162982 ) ( ON ?auto_162983 ?auto_162982 ) ( ON ?auto_162984 ?auto_162983 ) ( not ( = ?auto_162982 ?auto_162983 ) ) ( not ( = ?auto_162982 ?auto_162984 ) ) ( not ( = ?auto_162982 ?auto_162985 ) ) ( not ( = ?auto_162982 ?auto_162986 ) ) ( not ( = ?auto_162982 ?auto_162987 ) ) ( not ( = ?auto_162982 ?auto_162988 ) ) ( not ( = ?auto_162982 ?auto_162989 ) ) ( not ( = ?auto_162983 ?auto_162984 ) ) ( not ( = ?auto_162983 ?auto_162985 ) ) ( not ( = ?auto_162983 ?auto_162986 ) ) ( not ( = ?auto_162983 ?auto_162987 ) ) ( not ( = ?auto_162983 ?auto_162988 ) ) ( not ( = ?auto_162983 ?auto_162989 ) ) ( not ( = ?auto_162984 ?auto_162985 ) ) ( not ( = ?auto_162984 ?auto_162986 ) ) ( not ( = ?auto_162984 ?auto_162987 ) ) ( not ( = ?auto_162984 ?auto_162988 ) ) ( not ( = ?auto_162984 ?auto_162989 ) ) ( not ( = ?auto_162985 ?auto_162986 ) ) ( not ( = ?auto_162985 ?auto_162987 ) ) ( not ( = ?auto_162985 ?auto_162988 ) ) ( not ( = ?auto_162985 ?auto_162989 ) ) ( not ( = ?auto_162986 ?auto_162987 ) ) ( not ( = ?auto_162986 ?auto_162988 ) ) ( not ( = ?auto_162986 ?auto_162989 ) ) ( not ( = ?auto_162987 ?auto_162988 ) ) ( not ( = ?auto_162987 ?auto_162989 ) ) ( not ( = ?auto_162988 ?auto_162989 ) ) ( ON ?auto_162989 ?auto_162990 ) ( not ( = ?auto_162982 ?auto_162990 ) ) ( not ( = ?auto_162983 ?auto_162990 ) ) ( not ( = ?auto_162984 ?auto_162990 ) ) ( not ( = ?auto_162985 ?auto_162990 ) ) ( not ( = ?auto_162986 ?auto_162990 ) ) ( not ( = ?auto_162987 ?auto_162990 ) ) ( not ( = ?auto_162988 ?auto_162990 ) ) ( not ( = ?auto_162989 ?auto_162990 ) ) ( ON ?auto_162988 ?auto_162989 ) ( ON-TABLE ?auto_162990 ) ( ON ?auto_162987 ?auto_162988 ) ( ON ?auto_162986 ?auto_162987 ) ( CLEAR ?auto_162984 ) ( ON ?auto_162985 ?auto_162986 ) ( CLEAR ?auto_162985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162990 ?auto_162989 ?auto_162988 ?auto_162987 ?auto_162986 )
      ( MAKE-8PILE ?auto_162982 ?auto_162983 ?auto_162984 ?auto_162985 ?auto_162986 ?auto_162987 ?auto_162988 ?auto_162989 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162991 - BLOCK
      ?auto_162992 - BLOCK
      ?auto_162993 - BLOCK
      ?auto_162994 - BLOCK
      ?auto_162995 - BLOCK
      ?auto_162996 - BLOCK
      ?auto_162997 - BLOCK
      ?auto_162998 - BLOCK
    )
    :vars
    (
      ?auto_162999 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162991 ) ( ON ?auto_162992 ?auto_162991 ) ( not ( = ?auto_162991 ?auto_162992 ) ) ( not ( = ?auto_162991 ?auto_162993 ) ) ( not ( = ?auto_162991 ?auto_162994 ) ) ( not ( = ?auto_162991 ?auto_162995 ) ) ( not ( = ?auto_162991 ?auto_162996 ) ) ( not ( = ?auto_162991 ?auto_162997 ) ) ( not ( = ?auto_162991 ?auto_162998 ) ) ( not ( = ?auto_162992 ?auto_162993 ) ) ( not ( = ?auto_162992 ?auto_162994 ) ) ( not ( = ?auto_162992 ?auto_162995 ) ) ( not ( = ?auto_162992 ?auto_162996 ) ) ( not ( = ?auto_162992 ?auto_162997 ) ) ( not ( = ?auto_162992 ?auto_162998 ) ) ( not ( = ?auto_162993 ?auto_162994 ) ) ( not ( = ?auto_162993 ?auto_162995 ) ) ( not ( = ?auto_162993 ?auto_162996 ) ) ( not ( = ?auto_162993 ?auto_162997 ) ) ( not ( = ?auto_162993 ?auto_162998 ) ) ( not ( = ?auto_162994 ?auto_162995 ) ) ( not ( = ?auto_162994 ?auto_162996 ) ) ( not ( = ?auto_162994 ?auto_162997 ) ) ( not ( = ?auto_162994 ?auto_162998 ) ) ( not ( = ?auto_162995 ?auto_162996 ) ) ( not ( = ?auto_162995 ?auto_162997 ) ) ( not ( = ?auto_162995 ?auto_162998 ) ) ( not ( = ?auto_162996 ?auto_162997 ) ) ( not ( = ?auto_162996 ?auto_162998 ) ) ( not ( = ?auto_162997 ?auto_162998 ) ) ( ON ?auto_162998 ?auto_162999 ) ( not ( = ?auto_162991 ?auto_162999 ) ) ( not ( = ?auto_162992 ?auto_162999 ) ) ( not ( = ?auto_162993 ?auto_162999 ) ) ( not ( = ?auto_162994 ?auto_162999 ) ) ( not ( = ?auto_162995 ?auto_162999 ) ) ( not ( = ?auto_162996 ?auto_162999 ) ) ( not ( = ?auto_162997 ?auto_162999 ) ) ( not ( = ?auto_162998 ?auto_162999 ) ) ( ON ?auto_162997 ?auto_162998 ) ( ON-TABLE ?auto_162999 ) ( ON ?auto_162996 ?auto_162997 ) ( ON ?auto_162995 ?auto_162996 ) ( ON ?auto_162994 ?auto_162995 ) ( CLEAR ?auto_162994 ) ( HOLDING ?auto_162993 ) ( CLEAR ?auto_162992 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162991 ?auto_162992 ?auto_162993 )
      ( MAKE-8PILE ?auto_162991 ?auto_162992 ?auto_162993 ?auto_162994 ?auto_162995 ?auto_162996 ?auto_162997 ?auto_162998 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163000 - BLOCK
      ?auto_163001 - BLOCK
      ?auto_163002 - BLOCK
      ?auto_163003 - BLOCK
      ?auto_163004 - BLOCK
      ?auto_163005 - BLOCK
      ?auto_163006 - BLOCK
      ?auto_163007 - BLOCK
    )
    :vars
    (
      ?auto_163008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163000 ) ( ON ?auto_163001 ?auto_163000 ) ( not ( = ?auto_163000 ?auto_163001 ) ) ( not ( = ?auto_163000 ?auto_163002 ) ) ( not ( = ?auto_163000 ?auto_163003 ) ) ( not ( = ?auto_163000 ?auto_163004 ) ) ( not ( = ?auto_163000 ?auto_163005 ) ) ( not ( = ?auto_163000 ?auto_163006 ) ) ( not ( = ?auto_163000 ?auto_163007 ) ) ( not ( = ?auto_163001 ?auto_163002 ) ) ( not ( = ?auto_163001 ?auto_163003 ) ) ( not ( = ?auto_163001 ?auto_163004 ) ) ( not ( = ?auto_163001 ?auto_163005 ) ) ( not ( = ?auto_163001 ?auto_163006 ) ) ( not ( = ?auto_163001 ?auto_163007 ) ) ( not ( = ?auto_163002 ?auto_163003 ) ) ( not ( = ?auto_163002 ?auto_163004 ) ) ( not ( = ?auto_163002 ?auto_163005 ) ) ( not ( = ?auto_163002 ?auto_163006 ) ) ( not ( = ?auto_163002 ?auto_163007 ) ) ( not ( = ?auto_163003 ?auto_163004 ) ) ( not ( = ?auto_163003 ?auto_163005 ) ) ( not ( = ?auto_163003 ?auto_163006 ) ) ( not ( = ?auto_163003 ?auto_163007 ) ) ( not ( = ?auto_163004 ?auto_163005 ) ) ( not ( = ?auto_163004 ?auto_163006 ) ) ( not ( = ?auto_163004 ?auto_163007 ) ) ( not ( = ?auto_163005 ?auto_163006 ) ) ( not ( = ?auto_163005 ?auto_163007 ) ) ( not ( = ?auto_163006 ?auto_163007 ) ) ( ON ?auto_163007 ?auto_163008 ) ( not ( = ?auto_163000 ?auto_163008 ) ) ( not ( = ?auto_163001 ?auto_163008 ) ) ( not ( = ?auto_163002 ?auto_163008 ) ) ( not ( = ?auto_163003 ?auto_163008 ) ) ( not ( = ?auto_163004 ?auto_163008 ) ) ( not ( = ?auto_163005 ?auto_163008 ) ) ( not ( = ?auto_163006 ?auto_163008 ) ) ( not ( = ?auto_163007 ?auto_163008 ) ) ( ON ?auto_163006 ?auto_163007 ) ( ON-TABLE ?auto_163008 ) ( ON ?auto_163005 ?auto_163006 ) ( ON ?auto_163004 ?auto_163005 ) ( ON ?auto_163003 ?auto_163004 ) ( CLEAR ?auto_163001 ) ( ON ?auto_163002 ?auto_163003 ) ( CLEAR ?auto_163002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163008 ?auto_163007 ?auto_163006 ?auto_163005 ?auto_163004 ?auto_163003 )
      ( MAKE-8PILE ?auto_163000 ?auto_163001 ?auto_163002 ?auto_163003 ?auto_163004 ?auto_163005 ?auto_163006 ?auto_163007 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163009 - BLOCK
      ?auto_163010 - BLOCK
      ?auto_163011 - BLOCK
      ?auto_163012 - BLOCK
      ?auto_163013 - BLOCK
      ?auto_163014 - BLOCK
      ?auto_163015 - BLOCK
      ?auto_163016 - BLOCK
    )
    :vars
    (
      ?auto_163017 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163009 ) ( not ( = ?auto_163009 ?auto_163010 ) ) ( not ( = ?auto_163009 ?auto_163011 ) ) ( not ( = ?auto_163009 ?auto_163012 ) ) ( not ( = ?auto_163009 ?auto_163013 ) ) ( not ( = ?auto_163009 ?auto_163014 ) ) ( not ( = ?auto_163009 ?auto_163015 ) ) ( not ( = ?auto_163009 ?auto_163016 ) ) ( not ( = ?auto_163010 ?auto_163011 ) ) ( not ( = ?auto_163010 ?auto_163012 ) ) ( not ( = ?auto_163010 ?auto_163013 ) ) ( not ( = ?auto_163010 ?auto_163014 ) ) ( not ( = ?auto_163010 ?auto_163015 ) ) ( not ( = ?auto_163010 ?auto_163016 ) ) ( not ( = ?auto_163011 ?auto_163012 ) ) ( not ( = ?auto_163011 ?auto_163013 ) ) ( not ( = ?auto_163011 ?auto_163014 ) ) ( not ( = ?auto_163011 ?auto_163015 ) ) ( not ( = ?auto_163011 ?auto_163016 ) ) ( not ( = ?auto_163012 ?auto_163013 ) ) ( not ( = ?auto_163012 ?auto_163014 ) ) ( not ( = ?auto_163012 ?auto_163015 ) ) ( not ( = ?auto_163012 ?auto_163016 ) ) ( not ( = ?auto_163013 ?auto_163014 ) ) ( not ( = ?auto_163013 ?auto_163015 ) ) ( not ( = ?auto_163013 ?auto_163016 ) ) ( not ( = ?auto_163014 ?auto_163015 ) ) ( not ( = ?auto_163014 ?auto_163016 ) ) ( not ( = ?auto_163015 ?auto_163016 ) ) ( ON ?auto_163016 ?auto_163017 ) ( not ( = ?auto_163009 ?auto_163017 ) ) ( not ( = ?auto_163010 ?auto_163017 ) ) ( not ( = ?auto_163011 ?auto_163017 ) ) ( not ( = ?auto_163012 ?auto_163017 ) ) ( not ( = ?auto_163013 ?auto_163017 ) ) ( not ( = ?auto_163014 ?auto_163017 ) ) ( not ( = ?auto_163015 ?auto_163017 ) ) ( not ( = ?auto_163016 ?auto_163017 ) ) ( ON ?auto_163015 ?auto_163016 ) ( ON-TABLE ?auto_163017 ) ( ON ?auto_163014 ?auto_163015 ) ( ON ?auto_163013 ?auto_163014 ) ( ON ?auto_163012 ?auto_163013 ) ( ON ?auto_163011 ?auto_163012 ) ( CLEAR ?auto_163011 ) ( HOLDING ?auto_163010 ) ( CLEAR ?auto_163009 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163009 ?auto_163010 )
      ( MAKE-8PILE ?auto_163009 ?auto_163010 ?auto_163011 ?auto_163012 ?auto_163013 ?auto_163014 ?auto_163015 ?auto_163016 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163018 - BLOCK
      ?auto_163019 - BLOCK
      ?auto_163020 - BLOCK
      ?auto_163021 - BLOCK
      ?auto_163022 - BLOCK
      ?auto_163023 - BLOCK
      ?auto_163024 - BLOCK
      ?auto_163025 - BLOCK
    )
    :vars
    (
      ?auto_163026 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163018 ) ( not ( = ?auto_163018 ?auto_163019 ) ) ( not ( = ?auto_163018 ?auto_163020 ) ) ( not ( = ?auto_163018 ?auto_163021 ) ) ( not ( = ?auto_163018 ?auto_163022 ) ) ( not ( = ?auto_163018 ?auto_163023 ) ) ( not ( = ?auto_163018 ?auto_163024 ) ) ( not ( = ?auto_163018 ?auto_163025 ) ) ( not ( = ?auto_163019 ?auto_163020 ) ) ( not ( = ?auto_163019 ?auto_163021 ) ) ( not ( = ?auto_163019 ?auto_163022 ) ) ( not ( = ?auto_163019 ?auto_163023 ) ) ( not ( = ?auto_163019 ?auto_163024 ) ) ( not ( = ?auto_163019 ?auto_163025 ) ) ( not ( = ?auto_163020 ?auto_163021 ) ) ( not ( = ?auto_163020 ?auto_163022 ) ) ( not ( = ?auto_163020 ?auto_163023 ) ) ( not ( = ?auto_163020 ?auto_163024 ) ) ( not ( = ?auto_163020 ?auto_163025 ) ) ( not ( = ?auto_163021 ?auto_163022 ) ) ( not ( = ?auto_163021 ?auto_163023 ) ) ( not ( = ?auto_163021 ?auto_163024 ) ) ( not ( = ?auto_163021 ?auto_163025 ) ) ( not ( = ?auto_163022 ?auto_163023 ) ) ( not ( = ?auto_163022 ?auto_163024 ) ) ( not ( = ?auto_163022 ?auto_163025 ) ) ( not ( = ?auto_163023 ?auto_163024 ) ) ( not ( = ?auto_163023 ?auto_163025 ) ) ( not ( = ?auto_163024 ?auto_163025 ) ) ( ON ?auto_163025 ?auto_163026 ) ( not ( = ?auto_163018 ?auto_163026 ) ) ( not ( = ?auto_163019 ?auto_163026 ) ) ( not ( = ?auto_163020 ?auto_163026 ) ) ( not ( = ?auto_163021 ?auto_163026 ) ) ( not ( = ?auto_163022 ?auto_163026 ) ) ( not ( = ?auto_163023 ?auto_163026 ) ) ( not ( = ?auto_163024 ?auto_163026 ) ) ( not ( = ?auto_163025 ?auto_163026 ) ) ( ON ?auto_163024 ?auto_163025 ) ( ON-TABLE ?auto_163026 ) ( ON ?auto_163023 ?auto_163024 ) ( ON ?auto_163022 ?auto_163023 ) ( ON ?auto_163021 ?auto_163022 ) ( ON ?auto_163020 ?auto_163021 ) ( CLEAR ?auto_163018 ) ( ON ?auto_163019 ?auto_163020 ) ( CLEAR ?auto_163019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163026 ?auto_163025 ?auto_163024 ?auto_163023 ?auto_163022 ?auto_163021 ?auto_163020 )
      ( MAKE-8PILE ?auto_163018 ?auto_163019 ?auto_163020 ?auto_163021 ?auto_163022 ?auto_163023 ?auto_163024 ?auto_163025 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163027 - BLOCK
      ?auto_163028 - BLOCK
      ?auto_163029 - BLOCK
      ?auto_163030 - BLOCK
      ?auto_163031 - BLOCK
      ?auto_163032 - BLOCK
      ?auto_163033 - BLOCK
      ?auto_163034 - BLOCK
    )
    :vars
    (
      ?auto_163035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163027 ?auto_163028 ) ) ( not ( = ?auto_163027 ?auto_163029 ) ) ( not ( = ?auto_163027 ?auto_163030 ) ) ( not ( = ?auto_163027 ?auto_163031 ) ) ( not ( = ?auto_163027 ?auto_163032 ) ) ( not ( = ?auto_163027 ?auto_163033 ) ) ( not ( = ?auto_163027 ?auto_163034 ) ) ( not ( = ?auto_163028 ?auto_163029 ) ) ( not ( = ?auto_163028 ?auto_163030 ) ) ( not ( = ?auto_163028 ?auto_163031 ) ) ( not ( = ?auto_163028 ?auto_163032 ) ) ( not ( = ?auto_163028 ?auto_163033 ) ) ( not ( = ?auto_163028 ?auto_163034 ) ) ( not ( = ?auto_163029 ?auto_163030 ) ) ( not ( = ?auto_163029 ?auto_163031 ) ) ( not ( = ?auto_163029 ?auto_163032 ) ) ( not ( = ?auto_163029 ?auto_163033 ) ) ( not ( = ?auto_163029 ?auto_163034 ) ) ( not ( = ?auto_163030 ?auto_163031 ) ) ( not ( = ?auto_163030 ?auto_163032 ) ) ( not ( = ?auto_163030 ?auto_163033 ) ) ( not ( = ?auto_163030 ?auto_163034 ) ) ( not ( = ?auto_163031 ?auto_163032 ) ) ( not ( = ?auto_163031 ?auto_163033 ) ) ( not ( = ?auto_163031 ?auto_163034 ) ) ( not ( = ?auto_163032 ?auto_163033 ) ) ( not ( = ?auto_163032 ?auto_163034 ) ) ( not ( = ?auto_163033 ?auto_163034 ) ) ( ON ?auto_163034 ?auto_163035 ) ( not ( = ?auto_163027 ?auto_163035 ) ) ( not ( = ?auto_163028 ?auto_163035 ) ) ( not ( = ?auto_163029 ?auto_163035 ) ) ( not ( = ?auto_163030 ?auto_163035 ) ) ( not ( = ?auto_163031 ?auto_163035 ) ) ( not ( = ?auto_163032 ?auto_163035 ) ) ( not ( = ?auto_163033 ?auto_163035 ) ) ( not ( = ?auto_163034 ?auto_163035 ) ) ( ON ?auto_163033 ?auto_163034 ) ( ON-TABLE ?auto_163035 ) ( ON ?auto_163032 ?auto_163033 ) ( ON ?auto_163031 ?auto_163032 ) ( ON ?auto_163030 ?auto_163031 ) ( ON ?auto_163029 ?auto_163030 ) ( ON ?auto_163028 ?auto_163029 ) ( CLEAR ?auto_163028 ) ( HOLDING ?auto_163027 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163027 )
      ( MAKE-8PILE ?auto_163027 ?auto_163028 ?auto_163029 ?auto_163030 ?auto_163031 ?auto_163032 ?auto_163033 ?auto_163034 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163036 - BLOCK
      ?auto_163037 - BLOCK
      ?auto_163038 - BLOCK
      ?auto_163039 - BLOCK
      ?auto_163040 - BLOCK
      ?auto_163041 - BLOCK
      ?auto_163042 - BLOCK
      ?auto_163043 - BLOCK
    )
    :vars
    (
      ?auto_163044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163036 ?auto_163037 ) ) ( not ( = ?auto_163036 ?auto_163038 ) ) ( not ( = ?auto_163036 ?auto_163039 ) ) ( not ( = ?auto_163036 ?auto_163040 ) ) ( not ( = ?auto_163036 ?auto_163041 ) ) ( not ( = ?auto_163036 ?auto_163042 ) ) ( not ( = ?auto_163036 ?auto_163043 ) ) ( not ( = ?auto_163037 ?auto_163038 ) ) ( not ( = ?auto_163037 ?auto_163039 ) ) ( not ( = ?auto_163037 ?auto_163040 ) ) ( not ( = ?auto_163037 ?auto_163041 ) ) ( not ( = ?auto_163037 ?auto_163042 ) ) ( not ( = ?auto_163037 ?auto_163043 ) ) ( not ( = ?auto_163038 ?auto_163039 ) ) ( not ( = ?auto_163038 ?auto_163040 ) ) ( not ( = ?auto_163038 ?auto_163041 ) ) ( not ( = ?auto_163038 ?auto_163042 ) ) ( not ( = ?auto_163038 ?auto_163043 ) ) ( not ( = ?auto_163039 ?auto_163040 ) ) ( not ( = ?auto_163039 ?auto_163041 ) ) ( not ( = ?auto_163039 ?auto_163042 ) ) ( not ( = ?auto_163039 ?auto_163043 ) ) ( not ( = ?auto_163040 ?auto_163041 ) ) ( not ( = ?auto_163040 ?auto_163042 ) ) ( not ( = ?auto_163040 ?auto_163043 ) ) ( not ( = ?auto_163041 ?auto_163042 ) ) ( not ( = ?auto_163041 ?auto_163043 ) ) ( not ( = ?auto_163042 ?auto_163043 ) ) ( ON ?auto_163043 ?auto_163044 ) ( not ( = ?auto_163036 ?auto_163044 ) ) ( not ( = ?auto_163037 ?auto_163044 ) ) ( not ( = ?auto_163038 ?auto_163044 ) ) ( not ( = ?auto_163039 ?auto_163044 ) ) ( not ( = ?auto_163040 ?auto_163044 ) ) ( not ( = ?auto_163041 ?auto_163044 ) ) ( not ( = ?auto_163042 ?auto_163044 ) ) ( not ( = ?auto_163043 ?auto_163044 ) ) ( ON ?auto_163042 ?auto_163043 ) ( ON-TABLE ?auto_163044 ) ( ON ?auto_163041 ?auto_163042 ) ( ON ?auto_163040 ?auto_163041 ) ( ON ?auto_163039 ?auto_163040 ) ( ON ?auto_163038 ?auto_163039 ) ( ON ?auto_163037 ?auto_163038 ) ( ON ?auto_163036 ?auto_163037 ) ( CLEAR ?auto_163036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163044 ?auto_163043 ?auto_163042 ?auto_163041 ?auto_163040 ?auto_163039 ?auto_163038 ?auto_163037 )
      ( MAKE-8PILE ?auto_163036 ?auto_163037 ?auto_163038 ?auto_163039 ?auto_163040 ?auto_163041 ?auto_163042 ?auto_163043 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163181 - BLOCK
    )
    :vars
    (
      ?auto_163182 - BLOCK
      ?auto_163183 - BLOCK
      ?auto_163184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163181 ?auto_163182 ) ( CLEAR ?auto_163181 ) ( not ( = ?auto_163181 ?auto_163182 ) ) ( HOLDING ?auto_163183 ) ( CLEAR ?auto_163184 ) ( not ( = ?auto_163181 ?auto_163183 ) ) ( not ( = ?auto_163181 ?auto_163184 ) ) ( not ( = ?auto_163182 ?auto_163183 ) ) ( not ( = ?auto_163182 ?auto_163184 ) ) ( not ( = ?auto_163183 ?auto_163184 ) ) )
    :subtasks
    ( ( !STACK ?auto_163183 ?auto_163184 )
      ( MAKE-1PILE ?auto_163181 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163185 - BLOCK
    )
    :vars
    (
      ?auto_163188 - BLOCK
      ?auto_163186 - BLOCK
      ?auto_163187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163185 ?auto_163188 ) ( not ( = ?auto_163185 ?auto_163188 ) ) ( CLEAR ?auto_163186 ) ( not ( = ?auto_163185 ?auto_163187 ) ) ( not ( = ?auto_163185 ?auto_163186 ) ) ( not ( = ?auto_163188 ?auto_163187 ) ) ( not ( = ?auto_163188 ?auto_163186 ) ) ( not ( = ?auto_163187 ?auto_163186 ) ) ( ON ?auto_163187 ?auto_163185 ) ( CLEAR ?auto_163187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163188 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163188 ?auto_163185 )
      ( MAKE-1PILE ?auto_163185 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163189 - BLOCK
    )
    :vars
    (
      ?auto_163190 - BLOCK
      ?auto_163191 - BLOCK
      ?auto_163192 - BLOCK
      ?auto_163195 - BLOCK
      ?auto_163194 - BLOCK
      ?auto_163196 - BLOCK
      ?auto_163197 - BLOCK
      ?auto_163193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163189 ?auto_163190 ) ( not ( = ?auto_163189 ?auto_163190 ) ) ( not ( = ?auto_163189 ?auto_163191 ) ) ( not ( = ?auto_163189 ?auto_163192 ) ) ( not ( = ?auto_163190 ?auto_163191 ) ) ( not ( = ?auto_163190 ?auto_163192 ) ) ( not ( = ?auto_163191 ?auto_163192 ) ) ( ON ?auto_163191 ?auto_163189 ) ( CLEAR ?auto_163191 ) ( ON-TABLE ?auto_163190 ) ( HOLDING ?auto_163192 ) ( CLEAR ?auto_163195 ) ( ON-TABLE ?auto_163194 ) ( ON ?auto_163196 ?auto_163194 ) ( ON ?auto_163197 ?auto_163196 ) ( ON ?auto_163193 ?auto_163197 ) ( ON ?auto_163195 ?auto_163193 ) ( not ( = ?auto_163194 ?auto_163196 ) ) ( not ( = ?auto_163194 ?auto_163197 ) ) ( not ( = ?auto_163194 ?auto_163193 ) ) ( not ( = ?auto_163194 ?auto_163195 ) ) ( not ( = ?auto_163194 ?auto_163192 ) ) ( not ( = ?auto_163196 ?auto_163197 ) ) ( not ( = ?auto_163196 ?auto_163193 ) ) ( not ( = ?auto_163196 ?auto_163195 ) ) ( not ( = ?auto_163196 ?auto_163192 ) ) ( not ( = ?auto_163197 ?auto_163193 ) ) ( not ( = ?auto_163197 ?auto_163195 ) ) ( not ( = ?auto_163197 ?auto_163192 ) ) ( not ( = ?auto_163193 ?auto_163195 ) ) ( not ( = ?auto_163193 ?auto_163192 ) ) ( not ( = ?auto_163195 ?auto_163192 ) ) ( not ( = ?auto_163189 ?auto_163195 ) ) ( not ( = ?auto_163189 ?auto_163194 ) ) ( not ( = ?auto_163189 ?auto_163196 ) ) ( not ( = ?auto_163189 ?auto_163197 ) ) ( not ( = ?auto_163189 ?auto_163193 ) ) ( not ( = ?auto_163190 ?auto_163195 ) ) ( not ( = ?auto_163190 ?auto_163194 ) ) ( not ( = ?auto_163190 ?auto_163196 ) ) ( not ( = ?auto_163190 ?auto_163197 ) ) ( not ( = ?auto_163190 ?auto_163193 ) ) ( not ( = ?auto_163191 ?auto_163195 ) ) ( not ( = ?auto_163191 ?auto_163194 ) ) ( not ( = ?auto_163191 ?auto_163196 ) ) ( not ( = ?auto_163191 ?auto_163197 ) ) ( not ( = ?auto_163191 ?auto_163193 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163194 ?auto_163196 ?auto_163197 ?auto_163193 ?auto_163195 ?auto_163192 )
      ( MAKE-1PILE ?auto_163189 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163198 - BLOCK
    )
    :vars
    (
      ?auto_163200 - BLOCK
      ?auto_163204 - BLOCK
      ?auto_163203 - BLOCK
      ?auto_163202 - BLOCK
      ?auto_163199 - BLOCK
      ?auto_163205 - BLOCK
      ?auto_163206 - BLOCK
      ?auto_163201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163198 ?auto_163200 ) ( not ( = ?auto_163198 ?auto_163200 ) ) ( not ( = ?auto_163198 ?auto_163204 ) ) ( not ( = ?auto_163198 ?auto_163203 ) ) ( not ( = ?auto_163200 ?auto_163204 ) ) ( not ( = ?auto_163200 ?auto_163203 ) ) ( not ( = ?auto_163204 ?auto_163203 ) ) ( ON ?auto_163204 ?auto_163198 ) ( ON-TABLE ?auto_163200 ) ( CLEAR ?auto_163202 ) ( ON-TABLE ?auto_163199 ) ( ON ?auto_163205 ?auto_163199 ) ( ON ?auto_163206 ?auto_163205 ) ( ON ?auto_163201 ?auto_163206 ) ( ON ?auto_163202 ?auto_163201 ) ( not ( = ?auto_163199 ?auto_163205 ) ) ( not ( = ?auto_163199 ?auto_163206 ) ) ( not ( = ?auto_163199 ?auto_163201 ) ) ( not ( = ?auto_163199 ?auto_163202 ) ) ( not ( = ?auto_163199 ?auto_163203 ) ) ( not ( = ?auto_163205 ?auto_163206 ) ) ( not ( = ?auto_163205 ?auto_163201 ) ) ( not ( = ?auto_163205 ?auto_163202 ) ) ( not ( = ?auto_163205 ?auto_163203 ) ) ( not ( = ?auto_163206 ?auto_163201 ) ) ( not ( = ?auto_163206 ?auto_163202 ) ) ( not ( = ?auto_163206 ?auto_163203 ) ) ( not ( = ?auto_163201 ?auto_163202 ) ) ( not ( = ?auto_163201 ?auto_163203 ) ) ( not ( = ?auto_163202 ?auto_163203 ) ) ( not ( = ?auto_163198 ?auto_163202 ) ) ( not ( = ?auto_163198 ?auto_163199 ) ) ( not ( = ?auto_163198 ?auto_163205 ) ) ( not ( = ?auto_163198 ?auto_163206 ) ) ( not ( = ?auto_163198 ?auto_163201 ) ) ( not ( = ?auto_163200 ?auto_163202 ) ) ( not ( = ?auto_163200 ?auto_163199 ) ) ( not ( = ?auto_163200 ?auto_163205 ) ) ( not ( = ?auto_163200 ?auto_163206 ) ) ( not ( = ?auto_163200 ?auto_163201 ) ) ( not ( = ?auto_163204 ?auto_163202 ) ) ( not ( = ?auto_163204 ?auto_163199 ) ) ( not ( = ?auto_163204 ?auto_163205 ) ) ( not ( = ?auto_163204 ?auto_163206 ) ) ( not ( = ?auto_163204 ?auto_163201 ) ) ( ON ?auto_163203 ?auto_163204 ) ( CLEAR ?auto_163203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163200 ?auto_163198 ?auto_163204 )
      ( MAKE-1PILE ?auto_163198 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163207 - BLOCK
    )
    :vars
    (
      ?auto_163211 - BLOCK
      ?auto_163212 - BLOCK
      ?auto_163210 - BLOCK
      ?auto_163209 - BLOCK
      ?auto_163213 - BLOCK
      ?auto_163214 - BLOCK
      ?auto_163208 - BLOCK
      ?auto_163215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163207 ?auto_163211 ) ( not ( = ?auto_163207 ?auto_163211 ) ) ( not ( = ?auto_163207 ?auto_163212 ) ) ( not ( = ?auto_163207 ?auto_163210 ) ) ( not ( = ?auto_163211 ?auto_163212 ) ) ( not ( = ?auto_163211 ?auto_163210 ) ) ( not ( = ?auto_163212 ?auto_163210 ) ) ( ON ?auto_163212 ?auto_163207 ) ( ON-TABLE ?auto_163211 ) ( ON-TABLE ?auto_163209 ) ( ON ?auto_163213 ?auto_163209 ) ( ON ?auto_163214 ?auto_163213 ) ( ON ?auto_163208 ?auto_163214 ) ( not ( = ?auto_163209 ?auto_163213 ) ) ( not ( = ?auto_163209 ?auto_163214 ) ) ( not ( = ?auto_163209 ?auto_163208 ) ) ( not ( = ?auto_163209 ?auto_163215 ) ) ( not ( = ?auto_163209 ?auto_163210 ) ) ( not ( = ?auto_163213 ?auto_163214 ) ) ( not ( = ?auto_163213 ?auto_163208 ) ) ( not ( = ?auto_163213 ?auto_163215 ) ) ( not ( = ?auto_163213 ?auto_163210 ) ) ( not ( = ?auto_163214 ?auto_163208 ) ) ( not ( = ?auto_163214 ?auto_163215 ) ) ( not ( = ?auto_163214 ?auto_163210 ) ) ( not ( = ?auto_163208 ?auto_163215 ) ) ( not ( = ?auto_163208 ?auto_163210 ) ) ( not ( = ?auto_163215 ?auto_163210 ) ) ( not ( = ?auto_163207 ?auto_163215 ) ) ( not ( = ?auto_163207 ?auto_163209 ) ) ( not ( = ?auto_163207 ?auto_163213 ) ) ( not ( = ?auto_163207 ?auto_163214 ) ) ( not ( = ?auto_163207 ?auto_163208 ) ) ( not ( = ?auto_163211 ?auto_163215 ) ) ( not ( = ?auto_163211 ?auto_163209 ) ) ( not ( = ?auto_163211 ?auto_163213 ) ) ( not ( = ?auto_163211 ?auto_163214 ) ) ( not ( = ?auto_163211 ?auto_163208 ) ) ( not ( = ?auto_163212 ?auto_163215 ) ) ( not ( = ?auto_163212 ?auto_163209 ) ) ( not ( = ?auto_163212 ?auto_163213 ) ) ( not ( = ?auto_163212 ?auto_163214 ) ) ( not ( = ?auto_163212 ?auto_163208 ) ) ( ON ?auto_163210 ?auto_163212 ) ( CLEAR ?auto_163210 ) ( HOLDING ?auto_163215 ) ( CLEAR ?auto_163208 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163209 ?auto_163213 ?auto_163214 ?auto_163208 ?auto_163215 )
      ( MAKE-1PILE ?auto_163207 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163216 - BLOCK
    )
    :vars
    (
      ?auto_163218 - BLOCK
      ?auto_163217 - BLOCK
      ?auto_163221 - BLOCK
      ?auto_163219 - BLOCK
      ?auto_163222 - BLOCK
      ?auto_163223 - BLOCK
      ?auto_163220 - BLOCK
      ?auto_163224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163216 ?auto_163218 ) ( not ( = ?auto_163216 ?auto_163218 ) ) ( not ( = ?auto_163216 ?auto_163217 ) ) ( not ( = ?auto_163216 ?auto_163221 ) ) ( not ( = ?auto_163218 ?auto_163217 ) ) ( not ( = ?auto_163218 ?auto_163221 ) ) ( not ( = ?auto_163217 ?auto_163221 ) ) ( ON ?auto_163217 ?auto_163216 ) ( ON-TABLE ?auto_163218 ) ( ON-TABLE ?auto_163219 ) ( ON ?auto_163222 ?auto_163219 ) ( ON ?auto_163223 ?auto_163222 ) ( ON ?auto_163220 ?auto_163223 ) ( not ( = ?auto_163219 ?auto_163222 ) ) ( not ( = ?auto_163219 ?auto_163223 ) ) ( not ( = ?auto_163219 ?auto_163220 ) ) ( not ( = ?auto_163219 ?auto_163224 ) ) ( not ( = ?auto_163219 ?auto_163221 ) ) ( not ( = ?auto_163222 ?auto_163223 ) ) ( not ( = ?auto_163222 ?auto_163220 ) ) ( not ( = ?auto_163222 ?auto_163224 ) ) ( not ( = ?auto_163222 ?auto_163221 ) ) ( not ( = ?auto_163223 ?auto_163220 ) ) ( not ( = ?auto_163223 ?auto_163224 ) ) ( not ( = ?auto_163223 ?auto_163221 ) ) ( not ( = ?auto_163220 ?auto_163224 ) ) ( not ( = ?auto_163220 ?auto_163221 ) ) ( not ( = ?auto_163224 ?auto_163221 ) ) ( not ( = ?auto_163216 ?auto_163224 ) ) ( not ( = ?auto_163216 ?auto_163219 ) ) ( not ( = ?auto_163216 ?auto_163222 ) ) ( not ( = ?auto_163216 ?auto_163223 ) ) ( not ( = ?auto_163216 ?auto_163220 ) ) ( not ( = ?auto_163218 ?auto_163224 ) ) ( not ( = ?auto_163218 ?auto_163219 ) ) ( not ( = ?auto_163218 ?auto_163222 ) ) ( not ( = ?auto_163218 ?auto_163223 ) ) ( not ( = ?auto_163218 ?auto_163220 ) ) ( not ( = ?auto_163217 ?auto_163224 ) ) ( not ( = ?auto_163217 ?auto_163219 ) ) ( not ( = ?auto_163217 ?auto_163222 ) ) ( not ( = ?auto_163217 ?auto_163223 ) ) ( not ( = ?auto_163217 ?auto_163220 ) ) ( ON ?auto_163221 ?auto_163217 ) ( CLEAR ?auto_163220 ) ( ON ?auto_163224 ?auto_163221 ) ( CLEAR ?auto_163224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163218 ?auto_163216 ?auto_163217 ?auto_163221 )
      ( MAKE-1PILE ?auto_163216 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163225 - BLOCK
    )
    :vars
    (
      ?auto_163229 - BLOCK
      ?auto_163232 - BLOCK
      ?auto_163230 - BLOCK
      ?auto_163233 - BLOCK
      ?auto_163227 - BLOCK
      ?auto_163231 - BLOCK
      ?auto_163226 - BLOCK
      ?auto_163228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163225 ?auto_163229 ) ( not ( = ?auto_163225 ?auto_163229 ) ) ( not ( = ?auto_163225 ?auto_163232 ) ) ( not ( = ?auto_163225 ?auto_163230 ) ) ( not ( = ?auto_163229 ?auto_163232 ) ) ( not ( = ?auto_163229 ?auto_163230 ) ) ( not ( = ?auto_163232 ?auto_163230 ) ) ( ON ?auto_163232 ?auto_163225 ) ( ON-TABLE ?auto_163229 ) ( ON-TABLE ?auto_163233 ) ( ON ?auto_163227 ?auto_163233 ) ( ON ?auto_163231 ?auto_163227 ) ( not ( = ?auto_163233 ?auto_163227 ) ) ( not ( = ?auto_163233 ?auto_163231 ) ) ( not ( = ?auto_163233 ?auto_163226 ) ) ( not ( = ?auto_163233 ?auto_163228 ) ) ( not ( = ?auto_163233 ?auto_163230 ) ) ( not ( = ?auto_163227 ?auto_163231 ) ) ( not ( = ?auto_163227 ?auto_163226 ) ) ( not ( = ?auto_163227 ?auto_163228 ) ) ( not ( = ?auto_163227 ?auto_163230 ) ) ( not ( = ?auto_163231 ?auto_163226 ) ) ( not ( = ?auto_163231 ?auto_163228 ) ) ( not ( = ?auto_163231 ?auto_163230 ) ) ( not ( = ?auto_163226 ?auto_163228 ) ) ( not ( = ?auto_163226 ?auto_163230 ) ) ( not ( = ?auto_163228 ?auto_163230 ) ) ( not ( = ?auto_163225 ?auto_163228 ) ) ( not ( = ?auto_163225 ?auto_163233 ) ) ( not ( = ?auto_163225 ?auto_163227 ) ) ( not ( = ?auto_163225 ?auto_163231 ) ) ( not ( = ?auto_163225 ?auto_163226 ) ) ( not ( = ?auto_163229 ?auto_163228 ) ) ( not ( = ?auto_163229 ?auto_163233 ) ) ( not ( = ?auto_163229 ?auto_163227 ) ) ( not ( = ?auto_163229 ?auto_163231 ) ) ( not ( = ?auto_163229 ?auto_163226 ) ) ( not ( = ?auto_163232 ?auto_163228 ) ) ( not ( = ?auto_163232 ?auto_163233 ) ) ( not ( = ?auto_163232 ?auto_163227 ) ) ( not ( = ?auto_163232 ?auto_163231 ) ) ( not ( = ?auto_163232 ?auto_163226 ) ) ( ON ?auto_163230 ?auto_163232 ) ( ON ?auto_163228 ?auto_163230 ) ( CLEAR ?auto_163228 ) ( HOLDING ?auto_163226 ) ( CLEAR ?auto_163231 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163233 ?auto_163227 ?auto_163231 ?auto_163226 )
      ( MAKE-1PILE ?auto_163225 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163234 - BLOCK
    )
    :vars
    (
      ?auto_163240 - BLOCK
      ?auto_163241 - BLOCK
      ?auto_163242 - BLOCK
      ?auto_163237 - BLOCK
      ?auto_163236 - BLOCK
      ?auto_163239 - BLOCK
      ?auto_163235 - BLOCK
      ?auto_163238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163234 ?auto_163240 ) ( not ( = ?auto_163234 ?auto_163240 ) ) ( not ( = ?auto_163234 ?auto_163241 ) ) ( not ( = ?auto_163234 ?auto_163242 ) ) ( not ( = ?auto_163240 ?auto_163241 ) ) ( not ( = ?auto_163240 ?auto_163242 ) ) ( not ( = ?auto_163241 ?auto_163242 ) ) ( ON ?auto_163241 ?auto_163234 ) ( ON-TABLE ?auto_163240 ) ( ON-TABLE ?auto_163237 ) ( ON ?auto_163236 ?auto_163237 ) ( ON ?auto_163239 ?auto_163236 ) ( not ( = ?auto_163237 ?auto_163236 ) ) ( not ( = ?auto_163237 ?auto_163239 ) ) ( not ( = ?auto_163237 ?auto_163235 ) ) ( not ( = ?auto_163237 ?auto_163238 ) ) ( not ( = ?auto_163237 ?auto_163242 ) ) ( not ( = ?auto_163236 ?auto_163239 ) ) ( not ( = ?auto_163236 ?auto_163235 ) ) ( not ( = ?auto_163236 ?auto_163238 ) ) ( not ( = ?auto_163236 ?auto_163242 ) ) ( not ( = ?auto_163239 ?auto_163235 ) ) ( not ( = ?auto_163239 ?auto_163238 ) ) ( not ( = ?auto_163239 ?auto_163242 ) ) ( not ( = ?auto_163235 ?auto_163238 ) ) ( not ( = ?auto_163235 ?auto_163242 ) ) ( not ( = ?auto_163238 ?auto_163242 ) ) ( not ( = ?auto_163234 ?auto_163238 ) ) ( not ( = ?auto_163234 ?auto_163237 ) ) ( not ( = ?auto_163234 ?auto_163236 ) ) ( not ( = ?auto_163234 ?auto_163239 ) ) ( not ( = ?auto_163234 ?auto_163235 ) ) ( not ( = ?auto_163240 ?auto_163238 ) ) ( not ( = ?auto_163240 ?auto_163237 ) ) ( not ( = ?auto_163240 ?auto_163236 ) ) ( not ( = ?auto_163240 ?auto_163239 ) ) ( not ( = ?auto_163240 ?auto_163235 ) ) ( not ( = ?auto_163241 ?auto_163238 ) ) ( not ( = ?auto_163241 ?auto_163237 ) ) ( not ( = ?auto_163241 ?auto_163236 ) ) ( not ( = ?auto_163241 ?auto_163239 ) ) ( not ( = ?auto_163241 ?auto_163235 ) ) ( ON ?auto_163242 ?auto_163241 ) ( ON ?auto_163238 ?auto_163242 ) ( CLEAR ?auto_163239 ) ( ON ?auto_163235 ?auto_163238 ) ( CLEAR ?auto_163235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163240 ?auto_163234 ?auto_163241 ?auto_163242 ?auto_163238 )
      ( MAKE-1PILE ?auto_163234 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163243 - BLOCK
    )
    :vars
    (
      ?auto_163251 - BLOCK
      ?auto_163249 - BLOCK
      ?auto_163246 - BLOCK
      ?auto_163247 - BLOCK
      ?auto_163244 - BLOCK
      ?auto_163248 - BLOCK
      ?auto_163250 - BLOCK
      ?auto_163245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163243 ?auto_163251 ) ( not ( = ?auto_163243 ?auto_163251 ) ) ( not ( = ?auto_163243 ?auto_163249 ) ) ( not ( = ?auto_163243 ?auto_163246 ) ) ( not ( = ?auto_163251 ?auto_163249 ) ) ( not ( = ?auto_163251 ?auto_163246 ) ) ( not ( = ?auto_163249 ?auto_163246 ) ) ( ON ?auto_163249 ?auto_163243 ) ( ON-TABLE ?auto_163251 ) ( ON-TABLE ?auto_163247 ) ( ON ?auto_163244 ?auto_163247 ) ( not ( = ?auto_163247 ?auto_163244 ) ) ( not ( = ?auto_163247 ?auto_163248 ) ) ( not ( = ?auto_163247 ?auto_163250 ) ) ( not ( = ?auto_163247 ?auto_163245 ) ) ( not ( = ?auto_163247 ?auto_163246 ) ) ( not ( = ?auto_163244 ?auto_163248 ) ) ( not ( = ?auto_163244 ?auto_163250 ) ) ( not ( = ?auto_163244 ?auto_163245 ) ) ( not ( = ?auto_163244 ?auto_163246 ) ) ( not ( = ?auto_163248 ?auto_163250 ) ) ( not ( = ?auto_163248 ?auto_163245 ) ) ( not ( = ?auto_163248 ?auto_163246 ) ) ( not ( = ?auto_163250 ?auto_163245 ) ) ( not ( = ?auto_163250 ?auto_163246 ) ) ( not ( = ?auto_163245 ?auto_163246 ) ) ( not ( = ?auto_163243 ?auto_163245 ) ) ( not ( = ?auto_163243 ?auto_163247 ) ) ( not ( = ?auto_163243 ?auto_163244 ) ) ( not ( = ?auto_163243 ?auto_163248 ) ) ( not ( = ?auto_163243 ?auto_163250 ) ) ( not ( = ?auto_163251 ?auto_163245 ) ) ( not ( = ?auto_163251 ?auto_163247 ) ) ( not ( = ?auto_163251 ?auto_163244 ) ) ( not ( = ?auto_163251 ?auto_163248 ) ) ( not ( = ?auto_163251 ?auto_163250 ) ) ( not ( = ?auto_163249 ?auto_163245 ) ) ( not ( = ?auto_163249 ?auto_163247 ) ) ( not ( = ?auto_163249 ?auto_163244 ) ) ( not ( = ?auto_163249 ?auto_163248 ) ) ( not ( = ?auto_163249 ?auto_163250 ) ) ( ON ?auto_163246 ?auto_163249 ) ( ON ?auto_163245 ?auto_163246 ) ( ON ?auto_163250 ?auto_163245 ) ( CLEAR ?auto_163250 ) ( HOLDING ?auto_163248 ) ( CLEAR ?auto_163244 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163247 ?auto_163244 ?auto_163248 )
      ( MAKE-1PILE ?auto_163243 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163252 - BLOCK
    )
    :vars
    (
      ?auto_163254 - BLOCK
      ?auto_163260 - BLOCK
      ?auto_163258 - BLOCK
      ?auto_163256 - BLOCK
      ?auto_163253 - BLOCK
      ?auto_163259 - BLOCK
      ?auto_163257 - BLOCK
      ?auto_163255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163252 ?auto_163254 ) ( not ( = ?auto_163252 ?auto_163254 ) ) ( not ( = ?auto_163252 ?auto_163260 ) ) ( not ( = ?auto_163252 ?auto_163258 ) ) ( not ( = ?auto_163254 ?auto_163260 ) ) ( not ( = ?auto_163254 ?auto_163258 ) ) ( not ( = ?auto_163260 ?auto_163258 ) ) ( ON ?auto_163260 ?auto_163252 ) ( ON-TABLE ?auto_163254 ) ( ON-TABLE ?auto_163256 ) ( ON ?auto_163253 ?auto_163256 ) ( not ( = ?auto_163256 ?auto_163253 ) ) ( not ( = ?auto_163256 ?auto_163259 ) ) ( not ( = ?auto_163256 ?auto_163257 ) ) ( not ( = ?auto_163256 ?auto_163255 ) ) ( not ( = ?auto_163256 ?auto_163258 ) ) ( not ( = ?auto_163253 ?auto_163259 ) ) ( not ( = ?auto_163253 ?auto_163257 ) ) ( not ( = ?auto_163253 ?auto_163255 ) ) ( not ( = ?auto_163253 ?auto_163258 ) ) ( not ( = ?auto_163259 ?auto_163257 ) ) ( not ( = ?auto_163259 ?auto_163255 ) ) ( not ( = ?auto_163259 ?auto_163258 ) ) ( not ( = ?auto_163257 ?auto_163255 ) ) ( not ( = ?auto_163257 ?auto_163258 ) ) ( not ( = ?auto_163255 ?auto_163258 ) ) ( not ( = ?auto_163252 ?auto_163255 ) ) ( not ( = ?auto_163252 ?auto_163256 ) ) ( not ( = ?auto_163252 ?auto_163253 ) ) ( not ( = ?auto_163252 ?auto_163259 ) ) ( not ( = ?auto_163252 ?auto_163257 ) ) ( not ( = ?auto_163254 ?auto_163255 ) ) ( not ( = ?auto_163254 ?auto_163256 ) ) ( not ( = ?auto_163254 ?auto_163253 ) ) ( not ( = ?auto_163254 ?auto_163259 ) ) ( not ( = ?auto_163254 ?auto_163257 ) ) ( not ( = ?auto_163260 ?auto_163255 ) ) ( not ( = ?auto_163260 ?auto_163256 ) ) ( not ( = ?auto_163260 ?auto_163253 ) ) ( not ( = ?auto_163260 ?auto_163259 ) ) ( not ( = ?auto_163260 ?auto_163257 ) ) ( ON ?auto_163258 ?auto_163260 ) ( ON ?auto_163255 ?auto_163258 ) ( ON ?auto_163257 ?auto_163255 ) ( CLEAR ?auto_163253 ) ( ON ?auto_163259 ?auto_163257 ) ( CLEAR ?auto_163259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163254 ?auto_163252 ?auto_163260 ?auto_163258 ?auto_163255 ?auto_163257 )
      ( MAKE-1PILE ?auto_163252 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163261 - BLOCK
    )
    :vars
    (
      ?auto_163264 - BLOCK
      ?auto_163265 - BLOCK
      ?auto_163267 - BLOCK
      ?auto_163266 - BLOCK
      ?auto_163263 - BLOCK
      ?auto_163262 - BLOCK
      ?auto_163268 - BLOCK
      ?auto_163269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163261 ?auto_163264 ) ( not ( = ?auto_163261 ?auto_163264 ) ) ( not ( = ?auto_163261 ?auto_163265 ) ) ( not ( = ?auto_163261 ?auto_163267 ) ) ( not ( = ?auto_163264 ?auto_163265 ) ) ( not ( = ?auto_163264 ?auto_163267 ) ) ( not ( = ?auto_163265 ?auto_163267 ) ) ( ON ?auto_163265 ?auto_163261 ) ( ON-TABLE ?auto_163264 ) ( ON-TABLE ?auto_163266 ) ( not ( = ?auto_163266 ?auto_163263 ) ) ( not ( = ?auto_163266 ?auto_163262 ) ) ( not ( = ?auto_163266 ?auto_163268 ) ) ( not ( = ?auto_163266 ?auto_163269 ) ) ( not ( = ?auto_163266 ?auto_163267 ) ) ( not ( = ?auto_163263 ?auto_163262 ) ) ( not ( = ?auto_163263 ?auto_163268 ) ) ( not ( = ?auto_163263 ?auto_163269 ) ) ( not ( = ?auto_163263 ?auto_163267 ) ) ( not ( = ?auto_163262 ?auto_163268 ) ) ( not ( = ?auto_163262 ?auto_163269 ) ) ( not ( = ?auto_163262 ?auto_163267 ) ) ( not ( = ?auto_163268 ?auto_163269 ) ) ( not ( = ?auto_163268 ?auto_163267 ) ) ( not ( = ?auto_163269 ?auto_163267 ) ) ( not ( = ?auto_163261 ?auto_163269 ) ) ( not ( = ?auto_163261 ?auto_163266 ) ) ( not ( = ?auto_163261 ?auto_163263 ) ) ( not ( = ?auto_163261 ?auto_163262 ) ) ( not ( = ?auto_163261 ?auto_163268 ) ) ( not ( = ?auto_163264 ?auto_163269 ) ) ( not ( = ?auto_163264 ?auto_163266 ) ) ( not ( = ?auto_163264 ?auto_163263 ) ) ( not ( = ?auto_163264 ?auto_163262 ) ) ( not ( = ?auto_163264 ?auto_163268 ) ) ( not ( = ?auto_163265 ?auto_163269 ) ) ( not ( = ?auto_163265 ?auto_163266 ) ) ( not ( = ?auto_163265 ?auto_163263 ) ) ( not ( = ?auto_163265 ?auto_163262 ) ) ( not ( = ?auto_163265 ?auto_163268 ) ) ( ON ?auto_163267 ?auto_163265 ) ( ON ?auto_163269 ?auto_163267 ) ( ON ?auto_163268 ?auto_163269 ) ( ON ?auto_163262 ?auto_163268 ) ( CLEAR ?auto_163262 ) ( HOLDING ?auto_163263 ) ( CLEAR ?auto_163266 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163266 ?auto_163263 )
      ( MAKE-1PILE ?auto_163261 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163270 - BLOCK
    )
    :vars
    (
      ?auto_163275 - BLOCK
      ?auto_163271 - BLOCK
      ?auto_163273 - BLOCK
      ?auto_163274 - BLOCK
      ?auto_163277 - BLOCK
      ?auto_163278 - BLOCK
      ?auto_163272 - BLOCK
      ?auto_163276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163270 ?auto_163275 ) ( not ( = ?auto_163270 ?auto_163275 ) ) ( not ( = ?auto_163270 ?auto_163271 ) ) ( not ( = ?auto_163270 ?auto_163273 ) ) ( not ( = ?auto_163275 ?auto_163271 ) ) ( not ( = ?auto_163275 ?auto_163273 ) ) ( not ( = ?auto_163271 ?auto_163273 ) ) ( ON ?auto_163271 ?auto_163270 ) ( ON-TABLE ?auto_163275 ) ( ON-TABLE ?auto_163274 ) ( not ( = ?auto_163274 ?auto_163277 ) ) ( not ( = ?auto_163274 ?auto_163278 ) ) ( not ( = ?auto_163274 ?auto_163272 ) ) ( not ( = ?auto_163274 ?auto_163276 ) ) ( not ( = ?auto_163274 ?auto_163273 ) ) ( not ( = ?auto_163277 ?auto_163278 ) ) ( not ( = ?auto_163277 ?auto_163272 ) ) ( not ( = ?auto_163277 ?auto_163276 ) ) ( not ( = ?auto_163277 ?auto_163273 ) ) ( not ( = ?auto_163278 ?auto_163272 ) ) ( not ( = ?auto_163278 ?auto_163276 ) ) ( not ( = ?auto_163278 ?auto_163273 ) ) ( not ( = ?auto_163272 ?auto_163276 ) ) ( not ( = ?auto_163272 ?auto_163273 ) ) ( not ( = ?auto_163276 ?auto_163273 ) ) ( not ( = ?auto_163270 ?auto_163276 ) ) ( not ( = ?auto_163270 ?auto_163274 ) ) ( not ( = ?auto_163270 ?auto_163277 ) ) ( not ( = ?auto_163270 ?auto_163278 ) ) ( not ( = ?auto_163270 ?auto_163272 ) ) ( not ( = ?auto_163275 ?auto_163276 ) ) ( not ( = ?auto_163275 ?auto_163274 ) ) ( not ( = ?auto_163275 ?auto_163277 ) ) ( not ( = ?auto_163275 ?auto_163278 ) ) ( not ( = ?auto_163275 ?auto_163272 ) ) ( not ( = ?auto_163271 ?auto_163276 ) ) ( not ( = ?auto_163271 ?auto_163274 ) ) ( not ( = ?auto_163271 ?auto_163277 ) ) ( not ( = ?auto_163271 ?auto_163278 ) ) ( not ( = ?auto_163271 ?auto_163272 ) ) ( ON ?auto_163273 ?auto_163271 ) ( ON ?auto_163276 ?auto_163273 ) ( ON ?auto_163272 ?auto_163276 ) ( ON ?auto_163278 ?auto_163272 ) ( CLEAR ?auto_163274 ) ( ON ?auto_163277 ?auto_163278 ) ( CLEAR ?auto_163277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163275 ?auto_163270 ?auto_163271 ?auto_163273 ?auto_163276 ?auto_163272 ?auto_163278 )
      ( MAKE-1PILE ?auto_163270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163279 - BLOCK
    )
    :vars
    (
      ?auto_163281 - BLOCK
      ?auto_163287 - BLOCK
      ?auto_163284 - BLOCK
      ?auto_163285 - BLOCK
      ?auto_163280 - BLOCK
      ?auto_163286 - BLOCK
      ?auto_163283 - BLOCK
      ?auto_163282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163279 ?auto_163281 ) ( not ( = ?auto_163279 ?auto_163281 ) ) ( not ( = ?auto_163279 ?auto_163287 ) ) ( not ( = ?auto_163279 ?auto_163284 ) ) ( not ( = ?auto_163281 ?auto_163287 ) ) ( not ( = ?auto_163281 ?auto_163284 ) ) ( not ( = ?auto_163287 ?auto_163284 ) ) ( ON ?auto_163287 ?auto_163279 ) ( ON-TABLE ?auto_163281 ) ( not ( = ?auto_163285 ?auto_163280 ) ) ( not ( = ?auto_163285 ?auto_163286 ) ) ( not ( = ?auto_163285 ?auto_163283 ) ) ( not ( = ?auto_163285 ?auto_163282 ) ) ( not ( = ?auto_163285 ?auto_163284 ) ) ( not ( = ?auto_163280 ?auto_163286 ) ) ( not ( = ?auto_163280 ?auto_163283 ) ) ( not ( = ?auto_163280 ?auto_163282 ) ) ( not ( = ?auto_163280 ?auto_163284 ) ) ( not ( = ?auto_163286 ?auto_163283 ) ) ( not ( = ?auto_163286 ?auto_163282 ) ) ( not ( = ?auto_163286 ?auto_163284 ) ) ( not ( = ?auto_163283 ?auto_163282 ) ) ( not ( = ?auto_163283 ?auto_163284 ) ) ( not ( = ?auto_163282 ?auto_163284 ) ) ( not ( = ?auto_163279 ?auto_163282 ) ) ( not ( = ?auto_163279 ?auto_163285 ) ) ( not ( = ?auto_163279 ?auto_163280 ) ) ( not ( = ?auto_163279 ?auto_163286 ) ) ( not ( = ?auto_163279 ?auto_163283 ) ) ( not ( = ?auto_163281 ?auto_163282 ) ) ( not ( = ?auto_163281 ?auto_163285 ) ) ( not ( = ?auto_163281 ?auto_163280 ) ) ( not ( = ?auto_163281 ?auto_163286 ) ) ( not ( = ?auto_163281 ?auto_163283 ) ) ( not ( = ?auto_163287 ?auto_163282 ) ) ( not ( = ?auto_163287 ?auto_163285 ) ) ( not ( = ?auto_163287 ?auto_163280 ) ) ( not ( = ?auto_163287 ?auto_163286 ) ) ( not ( = ?auto_163287 ?auto_163283 ) ) ( ON ?auto_163284 ?auto_163287 ) ( ON ?auto_163282 ?auto_163284 ) ( ON ?auto_163283 ?auto_163282 ) ( ON ?auto_163286 ?auto_163283 ) ( ON ?auto_163280 ?auto_163286 ) ( CLEAR ?auto_163280 ) ( HOLDING ?auto_163285 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163285 )
      ( MAKE-1PILE ?auto_163279 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163288 - BLOCK
    )
    :vars
    (
      ?auto_163293 - BLOCK
      ?auto_163296 - BLOCK
      ?auto_163292 - BLOCK
      ?auto_163295 - BLOCK
      ?auto_163289 - BLOCK
      ?auto_163290 - BLOCK
      ?auto_163291 - BLOCK
      ?auto_163294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163288 ?auto_163293 ) ( not ( = ?auto_163288 ?auto_163293 ) ) ( not ( = ?auto_163288 ?auto_163296 ) ) ( not ( = ?auto_163288 ?auto_163292 ) ) ( not ( = ?auto_163293 ?auto_163296 ) ) ( not ( = ?auto_163293 ?auto_163292 ) ) ( not ( = ?auto_163296 ?auto_163292 ) ) ( ON ?auto_163296 ?auto_163288 ) ( ON-TABLE ?auto_163293 ) ( not ( = ?auto_163295 ?auto_163289 ) ) ( not ( = ?auto_163295 ?auto_163290 ) ) ( not ( = ?auto_163295 ?auto_163291 ) ) ( not ( = ?auto_163295 ?auto_163294 ) ) ( not ( = ?auto_163295 ?auto_163292 ) ) ( not ( = ?auto_163289 ?auto_163290 ) ) ( not ( = ?auto_163289 ?auto_163291 ) ) ( not ( = ?auto_163289 ?auto_163294 ) ) ( not ( = ?auto_163289 ?auto_163292 ) ) ( not ( = ?auto_163290 ?auto_163291 ) ) ( not ( = ?auto_163290 ?auto_163294 ) ) ( not ( = ?auto_163290 ?auto_163292 ) ) ( not ( = ?auto_163291 ?auto_163294 ) ) ( not ( = ?auto_163291 ?auto_163292 ) ) ( not ( = ?auto_163294 ?auto_163292 ) ) ( not ( = ?auto_163288 ?auto_163294 ) ) ( not ( = ?auto_163288 ?auto_163295 ) ) ( not ( = ?auto_163288 ?auto_163289 ) ) ( not ( = ?auto_163288 ?auto_163290 ) ) ( not ( = ?auto_163288 ?auto_163291 ) ) ( not ( = ?auto_163293 ?auto_163294 ) ) ( not ( = ?auto_163293 ?auto_163295 ) ) ( not ( = ?auto_163293 ?auto_163289 ) ) ( not ( = ?auto_163293 ?auto_163290 ) ) ( not ( = ?auto_163293 ?auto_163291 ) ) ( not ( = ?auto_163296 ?auto_163294 ) ) ( not ( = ?auto_163296 ?auto_163295 ) ) ( not ( = ?auto_163296 ?auto_163289 ) ) ( not ( = ?auto_163296 ?auto_163290 ) ) ( not ( = ?auto_163296 ?auto_163291 ) ) ( ON ?auto_163292 ?auto_163296 ) ( ON ?auto_163294 ?auto_163292 ) ( ON ?auto_163291 ?auto_163294 ) ( ON ?auto_163290 ?auto_163291 ) ( ON ?auto_163289 ?auto_163290 ) ( ON ?auto_163295 ?auto_163289 ) ( CLEAR ?auto_163295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163293 ?auto_163288 ?auto_163296 ?auto_163292 ?auto_163294 ?auto_163291 ?auto_163290 ?auto_163289 )
      ( MAKE-1PILE ?auto_163288 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163310 - BLOCK
      ?auto_163311 - BLOCK
      ?auto_163312 - BLOCK
      ?auto_163313 - BLOCK
      ?auto_163314 - BLOCK
      ?auto_163315 - BLOCK
    )
    :vars
    (
      ?auto_163316 - BLOCK
      ?auto_163317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163316 ?auto_163315 ) ( CLEAR ?auto_163316 ) ( ON-TABLE ?auto_163310 ) ( ON ?auto_163311 ?auto_163310 ) ( ON ?auto_163312 ?auto_163311 ) ( ON ?auto_163313 ?auto_163312 ) ( ON ?auto_163314 ?auto_163313 ) ( ON ?auto_163315 ?auto_163314 ) ( not ( = ?auto_163310 ?auto_163311 ) ) ( not ( = ?auto_163310 ?auto_163312 ) ) ( not ( = ?auto_163310 ?auto_163313 ) ) ( not ( = ?auto_163310 ?auto_163314 ) ) ( not ( = ?auto_163310 ?auto_163315 ) ) ( not ( = ?auto_163310 ?auto_163316 ) ) ( not ( = ?auto_163311 ?auto_163312 ) ) ( not ( = ?auto_163311 ?auto_163313 ) ) ( not ( = ?auto_163311 ?auto_163314 ) ) ( not ( = ?auto_163311 ?auto_163315 ) ) ( not ( = ?auto_163311 ?auto_163316 ) ) ( not ( = ?auto_163312 ?auto_163313 ) ) ( not ( = ?auto_163312 ?auto_163314 ) ) ( not ( = ?auto_163312 ?auto_163315 ) ) ( not ( = ?auto_163312 ?auto_163316 ) ) ( not ( = ?auto_163313 ?auto_163314 ) ) ( not ( = ?auto_163313 ?auto_163315 ) ) ( not ( = ?auto_163313 ?auto_163316 ) ) ( not ( = ?auto_163314 ?auto_163315 ) ) ( not ( = ?auto_163314 ?auto_163316 ) ) ( not ( = ?auto_163315 ?auto_163316 ) ) ( HOLDING ?auto_163317 ) ( not ( = ?auto_163310 ?auto_163317 ) ) ( not ( = ?auto_163311 ?auto_163317 ) ) ( not ( = ?auto_163312 ?auto_163317 ) ) ( not ( = ?auto_163313 ?auto_163317 ) ) ( not ( = ?auto_163314 ?auto_163317 ) ) ( not ( = ?auto_163315 ?auto_163317 ) ) ( not ( = ?auto_163316 ?auto_163317 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_163317 )
      ( MAKE-6PILE ?auto_163310 ?auto_163311 ?auto_163312 ?auto_163313 ?auto_163314 ?auto_163315 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163435 - BLOCK
      ?auto_163436 - BLOCK
    )
    :vars
    (
      ?auto_163437 - BLOCK
      ?auto_163440 - BLOCK
      ?auto_163438 - BLOCK
      ?auto_163442 - BLOCK
      ?auto_163439 - BLOCK
      ?auto_163441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163435 ?auto_163436 ) ) ( ON ?auto_163436 ?auto_163437 ) ( not ( = ?auto_163435 ?auto_163437 ) ) ( not ( = ?auto_163436 ?auto_163437 ) ) ( ON ?auto_163435 ?auto_163436 ) ( CLEAR ?auto_163435 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163440 ) ( ON ?auto_163438 ?auto_163440 ) ( ON ?auto_163442 ?auto_163438 ) ( ON ?auto_163439 ?auto_163442 ) ( ON ?auto_163441 ?auto_163439 ) ( ON ?auto_163437 ?auto_163441 ) ( not ( = ?auto_163440 ?auto_163438 ) ) ( not ( = ?auto_163440 ?auto_163442 ) ) ( not ( = ?auto_163440 ?auto_163439 ) ) ( not ( = ?auto_163440 ?auto_163441 ) ) ( not ( = ?auto_163440 ?auto_163437 ) ) ( not ( = ?auto_163440 ?auto_163436 ) ) ( not ( = ?auto_163440 ?auto_163435 ) ) ( not ( = ?auto_163438 ?auto_163442 ) ) ( not ( = ?auto_163438 ?auto_163439 ) ) ( not ( = ?auto_163438 ?auto_163441 ) ) ( not ( = ?auto_163438 ?auto_163437 ) ) ( not ( = ?auto_163438 ?auto_163436 ) ) ( not ( = ?auto_163438 ?auto_163435 ) ) ( not ( = ?auto_163442 ?auto_163439 ) ) ( not ( = ?auto_163442 ?auto_163441 ) ) ( not ( = ?auto_163442 ?auto_163437 ) ) ( not ( = ?auto_163442 ?auto_163436 ) ) ( not ( = ?auto_163442 ?auto_163435 ) ) ( not ( = ?auto_163439 ?auto_163441 ) ) ( not ( = ?auto_163439 ?auto_163437 ) ) ( not ( = ?auto_163439 ?auto_163436 ) ) ( not ( = ?auto_163439 ?auto_163435 ) ) ( not ( = ?auto_163441 ?auto_163437 ) ) ( not ( = ?auto_163441 ?auto_163436 ) ) ( not ( = ?auto_163441 ?auto_163435 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163440 ?auto_163438 ?auto_163442 ?auto_163439 ?auto_163441 ?auto_163437 ?auto_163436 )
      ( MAKE-2PILE ?auto_163435 ?auto_163436 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163445 - BLOCK
      ?auto_163446 - BLOCK
    )
    :vars
    (
      ?auto_163447 - BLOCK
      ?auto_163448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163445 ?auto_163446 ) ) ( ON ?auto_163446 ?auto_163447 ) ( CLEAR ?auto_163446 ) ( not ( = ?auto_163445 ?auto_163447 ) ) ( not ( = ?auto_163446 ?auto_163447 ) ) ( ON ?auto_163445 ?auto_163448 ) ( CLEAR ?auto_163445 ) ( HAND-EMPTY ) ( not ( = ?auto_163445 ?auto_163448 ) ) ( not ( = ?auto_163446 ?auto_163448 ) ) ( not ( = ?auto_163447 ?auto_163448 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_163445 ?auto_163448 )
      ( MAKE-2PILE ?auto_163445 ?auto_163446 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163449 - BLOCK
      ?auto_163450 - BLOCK
    )
    :vars
    (
      ?auto_163452 - BLOCK
      ?auto_163451 - BLOCK
      ?auto_163453 - BLOCK
      ?auto_163455 - BLOCK
      ?auto_163454 - BLOCK
      ?auto_163456 - BLOCK
      ?auto_163457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163449 ?auto_163450 ) ) ( not ( = ?auto_163449 ?auto_163452 ) ) ( not ( = ?auto_163450 ?auto_163452 ) ) ( ON ?auto_163449 ?auto_163451 ) ( CLEAR ?auto_163449 ) ( not ( = ?auto_163449 ?auto_163451 ) ) ( not ( = ?auto_163450 ?auto_163451 ) ) ( not ( = ?auto_163452 ?auto_163451 ) ) ( HOLDING ?auto_163450 ) ( CLEAR ?auto_163452 ) ( ON-TABLE ?auto_163453 ) ( ON ?auto_163455 ?auto_163453 ) ( ON ?auto_163454 ?auto_163455 ) ( ON ?auto_163456 ?auto_163454 ) ( ON ?auto_163457 ?auto_163456 ) ( ON ?auto_163452 ?auto_163457 ) ( not ( = ?auto_163453 ?auto_163455 ) ) ( not ( = ?auto_163453 ?auto_163454 ) ) ( not ( = ?auto_163453 ?auto_163456 ) ) ( not ( = ?auto_163453 ?auto_163457 ) ) ( not ( = ?auto_163453 ?auto_163452 ) ) ( not ( = ?auto_163453 ?auto_163450 ) ) ( not ( = ?auto_163455 ?auto_163454 ) ) ( not ( = ?auto_163455 ?auto_163456 ) ) ( not ( = ?auto_163455 ?auto_163457 ) ) ( not ( = ?auto_163455 ?auto_163452 ) ) ( not ( = ?auto_163455 ?auto_163450 ) ) ( not ( = ?auto_163454 ?auto_163456 ) ) ( not ( = ?auto_163454 ?auto_163457 ) ) ( not ( = ?auto_163454 ?auto_163452 ) ) ( not ( = ?auto_163454 ?auto_163450 ) ) ( not ( = ?auto_163456 ?auto_163457 ) ) ( not ( = ?auto_163456 ?auto_163452 ) ) ( not ( = ?auto_163456 ?auto_163450 ) ) ( not ( = ?auto_163457 ?auto_163452 ) ) ( not ( = ?auto_163457 ?auto_163450 ) ) ( not ( = ?auto_163449 ?auto_163453 ) ) ( not ( = ?auto_163449 ?auto_163455 ) ) ( not ( = ?auto_163449 ?auto_163454 ) ) ( not ( = ?auto_163449 ?auto_163456 ) ) ( not ( = ?auto_163449 ?auto_163457 ) ) ( not ( = ?auto_163451 ?auto_163453 ) ) ( not ( = ?auto_163451 ?auto_163455 ) ) ( not ( = ?auto_163451 ?auto_163454 ) ) ( not ( = ?auto_163451 ?auto_163456 ) ) ( not ( = ?auto_163451 ?auto_163457 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163453 ?auto_163455 ?auto_163454 ?auto_163456 ?auto_163457 ?auto_163452 ?auto_163450 )
      ( MAKE-2PILE ?auto_163449 ?auto_163450 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163458 - BLOCK
      ?auto_163459 - BLOCK
    )
    :vars
    (
      ?auto_163464 - BLOCK
      ?auto_163463 - BLOCK
      ?auto_163462 - BLOCK
      ?auto_163466 - BLOCK
      ?auto_163460 - BLOCK
      ?auto_163465 - BLOCK
      ?auto_163461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163458 ?auto_163459 ) ) ( not ( = ?auto_163458 ?auto_163464 ) ) ( not ( = ?auto_163459 ?auto_163464 ) ) ( ON ?auto_163458 ?auto_163463 ) ( not ( = ?auto_163458 ?auto_163463 ) ) ( not ( = ?auto_163459 ?auto_163463 ) ) ( not ( = ?auto_163464 ?auto_163463 ) ) ( CLEAR ?auto_163464 ) ( ON-TABLE ?auto_163462 ) ( ON ?auto_163466 ?auto_163462 ) ( ON ?auto_163460 ?auto_163466 ) ( ON ?auto_163465 ?auto_163460 ) ( ON ?auto_163461 ?auto_163465 ) ( ON ?auto_163464 ?auto_163461 ) ( not ( = ?auto_163462 ?auto_163466 ) ) ( not ( = ?auto_163462 ?auto_163460 ) ) ( not ( = ?auto_163462 ?auto_163465 ) ) ( not ( = ?auto_163462 ?auto_163461 ) ) ( not ( = ?auto_163462 ?auto_163464 ) ) ( not ( = ?auto_163462 ?auto_163459 ) ) ( not ( = ?auto_163466 ?auto_163460 ) ) ( not ( = ?auto_163466 ?auto_163465 ) ) ( not ( = ?auto_163466 ?auto_163461 ) ) ( not ( = ?auto_163466 ?auto_163464 ) ) ( not ( = ?auto_163466 ?auto_163459 ) ) ( not ( = ?auto_163460 ?auto_163465 ) ) ( not ( = ?auto_163460 ?auto_163461 ) ) ( not ( = ?auto_163460 ?auto_163464 ) ) ( not ( = ?auto_163460 ?auto_163459 ) ) ( not ( = ?auto_163465 ?auto_163461 ) ) ( not ( = ?auto_163465 ?auto_163464 ) ) ( not ( = ?auto_163465 ?auto_163459 ) ) ( not ( = ?auto_163461 ?auto_163464 ) ) ( not ( = ?auto_163461 ?auto_163459 ) ) ( not ( = ?auto_163458 ?auto_163462 ) ) ( not ( = ?auto_163458 ?auto_163466 ) ) ( not ( = ?auto_163458 ?auto_163460 ) ) ( not ( = ?auto_163458 ?auto_163465 ) ) ( not ( = ?auto_163458 ?auto_163461 ) ) ( not ( = ?auto_163463 ?auto_163462 ) ) ( not ( = ?auto_163463 ?auto_163466 ) ) ( not ( = ?auto_163463 ?auto_163460 ) ) ( not ( = ?auto_163463 ?auto_163465 ) ) ( not ( = ?auto_163463 ?auto_163461 ) ) ( ON ?auto_163459 ?auto_163458 ) ( CLEAR ?auto_163459 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163463 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163463 ?auto_163458 )
      ( MAKE-2PILE ?auto_163458 ?auto_163459 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163467 - BLOCK
      ?auto_163468 - BLOCK
    )
    :vars
    (
      ?auto_163471 - BLOCK
      ?auto_163473 - BLOCK
      ?auto_163475 - BLOCK
      ?auto_163469 - BLOCK
      ?auto_163474 - BLOCK
      ?auto_163470 - BLOCK
      ?auto_163472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163467 ?auto_163468 ) ) ( not ( = ?auto_163467 ?auto_163471 ) ) ( not ( = ?auto_163468 ?auto_163471 ) ) ( ON ?auto_163467 ?auto_163473 ) ( not ( = ?auto_163467 ?auto_163473 ) ) ( not ( = ?auto_163468 ?auto_163473 ) ) ( not ( = ?auto_163471 ?auto_163473 ) ) ( ON-TABLE ?auto_163475 ) ( ON ?auto_163469 ?auto_163475 ) ( ON ?auto_163474 ?auto_163469 ) ( ON ?auto_163470 ?auto_163474 ) ( ON ?auto_163472 ?auto_163470 ) ( not ( = ?auto_163475 ?auto_163469 ) ) ( not ( = ?auto_163475 ?auto_163474 ) ) ( not ( = ?auto_163475 ?auto_163470 ) ) ( not ( = ?auto_163475 ?auto_163472 ) ) ( not ( = ?auto_163475 ?auto_163471 ) ) ( not ( = ?auto_163475 ?auto_163468 ) ) ( not ( = ?auto_163469 ?auto_163474 ) ) ( not ( = ?auto_163469 ?auto_163470 ) ) ( not ( = ?auto_163469 ?auto_163472 ) ) ( not ( = ?auto_163469 ?auto_163471 ) ) ( not ( = ?auto_163469 ?auto_163468 ) ) ( not ( = ?auto_163474 ?auto_163470 ) ) ( not ( = ?auto_163474 ?auto_163472 ) ) ( not ( = ?auto_163474 ?auto_163471 ) ) ( not ( = ?auto_163474 ?auto_163468 ) ) ( not ( = ?auto_163470 ?auto_163472 ) ) ( not ( = ?auto_163470 ?auto_163471 ) ) ( not ( = ?auto_163470 ?auto_163468 ) ) ( not ( = ?auto_163472 ?auto_163471 ) ) ( not ( = ?auto_163472 ?auto_163468 ) ) ( not ( = ?auto_163467 ?auto_163475 ) ) ( not ( = ?auto_163467 ?auto_163469 ) ) ( not ( = ?auto_163467 ?auto_163474 ) ) ( not ( = ?auto_163467 ?auto_163470 ) ) ( not ( = ?auto_163467 ?auto_163472 ) ) ( not ( = ?auto_163473 ?auto_163475 ) ) ( not ( = ?auto_163473 ?auto_163469 ) ) ( not ( = ?auto_163473 ?auto_163474 ) ) ( not ( = ?auto_163473 ?auto_163470 ) ) ( not ( = ?auto_163473 ?auto_163472 ) ) ( ON ?auto_163468 ?auto_163467 ) ( CLEAR ?auto_163468 ) ( ON-TABLE ?auto_163473 ) ( HOLDING ?auto_163471 ) ( CLEAR ?auto_163472 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163475 ?auto_163469 ?auto_163474 ?auto_163470 ?auto_163472 ?auto_163471 )
      ( MAKE-2PILE ?auto_163467 ?auto_163468 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163476 - BLOCK
      ?auto_163477 - BLOCK
    )
    :vars
    (
      ?auto_163484 - BLOCK
      ?auto_163479 - BLOCK
      ?auto_163481 - BLOCK
      ?auto_163483 - BLOCK
      ?auto_163482 - BLOCK
      ?auto_163478 - BLOCK
      ?auto_163480 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163476 ?auto_163477 ) ) ( not ( = ?auto_163476 ?auto_163484 ) ) ( not ( = ?auto_163477 ?auto_163484 ) ) ( ON ?auto_163476 ?auto_163479 ) ( not ( = ?auto_163476 ?auto_163479 ) ) ( not ( = ?auto_163477 ?auto_163479 ) ) ( not ( = ?auto_163484 ?auto_163479 ) ) ( ON-TABLE ?auto_163481 ) ( ON ?auto_163483 ?auto_163481 ) ( ON ?auto_163482 ?auto_163483 ) ( ON ?auto_163478 ?auto_163482 ) ( ON ?auto_163480 ?auto_163478 ) ( not ( = ?auto_163481 ?auto_163483 ) ) ( not ( = ?auto_163481 ?auto_163482 ) ) ( not ( = ?auto_163481 ?auto_163478 ) ) ( not ( = ?auto_163481 ?auto_163480 ) ) ( not ( = ?auto_163481 ?auto_163484 ) ) ( not ( = ?auto_163481 ?auto_163477 ) ) ( not ( = ?auto_163483 ?auto_163482 ) ) ( not ( = ?auto_163483 ?auto_163478 ) ) ( not ( = ?auto_163483 ?auto_163480 ) ) ( not ( = ?auto_163483 ?auto_163484 ) ) ( not ( = ?auto_163483 ?auto_163477 ) ) ( not ( = ?auto_163482 ?auto_163478 ) ) ( not ( = ?auto_163482 ?auto_163480 ) ) ( not ( = ?auto_163482 ?auto_163484 ) ) ( not ( = ?auto_163482 ?auto_163477 ) ) ( not ( = ?auto_163478 ?auto_163480 ) ) ( not ( = ?auto_163478 ?auto_163484 ) ) ( not ( = ?auto_163478 ?auto_163477 ) ) ( not ( = ?auto_163480 ?auto_163484 ) ) ( not ( = ?auto_163480 ?auto_163477 ) ) ( not ( = ?auto_163476 ?auto_163481 ) ) ( not ( = ?auto_163476 ?auto_163483 ) ) ( not ( = ?auto_163476 ?auto_163482 ) ) ( not ( = ?auto_163476 ?auto_163478 ) ) ( not ( = ?auto_163476 ?auto_163480 ) ) ( not ( = ?auto_163479 ?auto_163481 ) ) ( not ( = ?auto_163479 ?auto_163483 ) ) ( not ( = ?auto_163479 ?auto_163482 ) ) ( not ( = ?auto_163479 ?auto_163478 ) ) ( not ( = ?auto_163479 ?auto_163480 ) ) ( ON ?auto_163477 ?auto_163476 ) ( ON-TABLE ?auto_163479 ) ( CLEAR ?auto_163480 ) ( ON ?auto_163484 ?auto_163477 ) ( CLEAR ?auto_163484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163479 ?auto_163476 ?auto_163477 )
      ( MAKE-2PILE ?auto_163476 ?auto_163477 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163485 - BLOCK
      ?auto_163486 - BLOCK
    )
    :vars
    (
      ?auto_163492 - BLOCK
      ?auto_163491 - BLOCK
      ?auto_163490 - BLOCK
      ?auto_163489 - BLOCK
      ?auto_163493 - BLOCK
      ?auto_163488 - BLOCK
      ?auto_163487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163485 ?auto_163486 ) ) ( not ( = ?auto_163485 ?auto_163492 ) ) ( not ( = ?auto_163486 ?auto_163492 ) ) ( ON ?auto_163485 ?auto_163491 ) ( not ( = ?auto_163485 ?auto_163491 ) ) ( not ( = ?auto_163486 ?auto_163491 ) ) ( not ( = ?auto_163492 ?auto_163491 ) ) ( ON-TABLE ?auto_163490 ) ( ON ?auto_163489 ?auto_163490 ) ( ON ?auto_163493 ?auto_163489 ) ( ON ?auto_163488 ?auto_163493 ) ( not ( = ?auto_163490 ?auto_163489 ) ) ( not ( = ?auto_163490 ?auto_163493 ) ) ( not ( = ?auto_163490 ?auto_163488 ) ) ( not ( = ?auto_163490 ?auto_163487 ) ) ( not ( = ?auto_163490 ?auto_163492 ) ) ( not ( = ?auto_163490 ?auto_163486 ) ) ( not ( = ?auto_163489 ?auto_163493 ) ) ( not ( = ?auto_163489 ?auto_163488 ) ) ( not ( = ?auto_163489 ?auto_163487 ) ) ( not ( = ?auto_163489 ?auto_163492 ) ) ( not ( = ?auto_163489 ?auto_163486 ) ) ( not ( = ?auto_163493 ?auto_163488 ) ) ( not ( = ?auto_163493 ?auto_163487 ) ) ( not ( = ?auto_163493 ?auto_163492 ) ) ( not ( = ?auto_163493 ?auto_163486 ) ) ( not ( = ?auto_163488 ?auto_163487 ) ) ( not ( = ?auto_163488 ?auto_163492 ) ) ( not ( = ?auto_163488 ?auto_163486 ) ) ( not ( = ?auto_163487 ?auto_163492 ) ) ( not ( = ?auto_163487 ?auto_163486 ) ) ( not ( = ?auto_163485 ?auto_163490 ) ) ( not ( = ?auto_163485 ?auto_163489 ) ) ( not ( = ?auto_163485 ?auto_163493 ) ) ( not ( = ?auto_163485 ?auto_163488 ) ) ( not ( = ?auto_163485 ?auto_163487 ) ) ( not ( = ?auto_163491 ?auto_163490 ) ) ( not ( = ?auto_163491 ?auto_163489 ) ) ( not ( = ?auto_163491 ?auto_163493 ) ) ( not ( = ?auto_163491 ?auto_163488 ) ) ( not ( = ?auto_163491 ?auto_163487 ) ) ( ON ?auto_163486 ?auto_163485 ) ( ON-TABLE ?auto_163491 ) ( ON ?auto_163492 ?auto_163486 ) ( CLEAR ?auto_163492 ) ( HOLDING ?auto_163487 ) ( CLEAR ?auto_163488 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163490 ?auto_163489 ?auto_163493 ?auto_163488 ?auto_163487 )
      ( MAKE-2PILE ?auto_163485 ?auto_163486 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163494 - BLOCK
      ?auto_163495 - BLOCK
    )
    :vars
    (
      ?auto_163500 - BLOCK
      ?auto_163499 - BLOCK
      ?auto_163501 - BLOCK
      ?auto_163502 - BLOCK
      ?auto_163498 - BLOCK
      ?auto_163496 - BLOCK
      ?auto_163497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163494 ?auto_163495 ) ) ( not ( = ?auto_163494 ?auto_163500 ) ) ( not ( = ?auto_163495 ?auto_163500 ) ) ( ON ?auto_163494 ?auto_163499 ) ( not ( = ?auto_163494 ?auto_163499 ) ) ( not ( = ?auto_163495 ?auto_163499 ) ) ( not ( = ?auto_163500 ?auto_163499 ) ) ( ON-TABLE ?auto_163501 ) ( ON ?auto_163502 ?auto_163501 ) ( ON ?auto_163498 ?auto_163502 ) ( ON ?auto_163496 ?auto_163498 ) ( not ( = ?auto_163501 ?auto_163502 ) ) ( not ( = ?auto_163501 ?auto_163498 ) ) ( not ( = ?auto_163501 ?auto_163496 ) ) ( not ( = ?auto_163501 ?auto_163497 ) ) ( not ( = ?auto_163501 ?auto_163500 ) ) ( not ( = ?auto_163501 ?auto_163495 ) ) ( not ( = ?auto_163502 ?auto_163498 ) ) ( not ( = ?auto_163502 ?auto_163496 ) ) ( not ( = ?auto_163502 ?auto_163497 ) ) ( not ( = ?auto_163502 ?auto_163500 ) ) ( not ( = ?auto_163502 ?auto_163495 ) ) ( not ( = ?auto_163498 ?auto_163496 ) ) ( not ( = ?auto_163498 ?auto_163497 ) ) ( not ( = ?auto_163498 ?auto_163500 ) ) ( not ( = ?auto_163498 ?auto_163495 ) ) ( not ( = ?auto_163496 ?auto_163497 ) ) ( not ( = ?auto_163496 ?auto_163500 ) ) ( not ( = ?auto_163496 ?auto_163495 ) ) ( not ( = ?auto_163497 ?auto_163500 ) ) ( not ( = ?auto_163497 ?auto_163495 ) ) ( not ( = ?auto_163494 ?auto_163501 ) ) ( not ( = ?auto_163494 ?auto_163502 ) ) ( not ( = ?auto_163494 ?auto_163498 ) ) ( not ( = ?auto_163494 ?auto_163496 ) ) ( not ( = ?auto_163494 ?auto_163497 ) ) ( not ( = ?auto_163499 ?auto_163501 ) ) ( not ( = ?auto_163499 ?auto_163502 ) ) ( not ( = ?auto_163499 ?auto_163498 ) ) ( not ( = ?auto_163499 ?auto_163496 ) ) ( not ( = ?auto_163499 ?auto_163497 ) ) ( ON ?auto_163495 ?auto_163494 ) ( ON-TABLE ?auto_163499 ) ( ON ?auto_163500 ?auto_163495 ) ( CLEAR ?auto_163496 ) ( ON ?auto_163497 ?auto_163500 ) ( CLEAR ?auto_163497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163499 ?auto_163494 ?auto_163495 ?auto_163500 )
      ( MAKE-2PILE ?auto_163494 ?auto_163495 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163503 - BLOCK
      ?auto_163504 - BLOCK
    )
    :vars
    (
      ?auto_163508 - BLOCK
      ?auto_163505 - BLOCK
      ?auto_163509 - BLOCK
      ?auto_163507 - BLOCK
      ?auto_163506 - BLOCK
      ?auto_163510 - BLOCK
      ?auto_163511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163503 ?auto_163504 ) ) ( not ( = ?auto_163503 ?auto_163508 ) ) ( not ( = ?auto_163504 ?auto_163508 ) ) ( ON ?auto_163503 ?auto_163505 ) ( not ( = ?auto_163503 ?auto_163505 ) ) ( not ( = ?auto_163504 ?auto_163505 ) ) ( not ( = ?auto_163508 ?auto_163505 ) ) ( ON-TABLE ?auto_163509 ) ( ON ?auto_163507 ?auto_163509 ) ( ON ?auto_163506 ?auto_163507 ) ( not ( = ?auto_163509 ?auto_163507 ) ) ( not ( = ?auto_163509 ?auto_163506 ) ) ( not ( = ?auto_163509 ?auto_163510 ) ) ( not ( = ?auto_163509 ?auto_163511 ) ) ( not ( = ?auto_163509 ?auto_163508 ) ) ( not ( = ?auto_163509 ?auto_163504 ) ) ( not ( = ?auto_163507 ?auto_163506 ) ) ( not ( = ?auto_163507 ?auto_163510 ) ) ( not ( = ?auto_163507 ?auto_163511 ) ) ( not ( = ?auto_163507 ?auto_163508 ) ) ( not ( = ?auto_163507 ?auto_163504 ) ) ( not ( = ?auto_163506 ?auto_163510 ) ) ( not ( = ?auto_163506 ?auto_163511 ) ) ( not ( = ?auto_163506 ?auto_163508 ) ) ( not ( = ?auto_163506 ?auto_163504 ) ) ( not ( = ?auto_163510 ?auto_163511 ) ) ( not ( = ?auto_163510 ?auto_163508 ) ) ( not ( = ?auto_163510 ?auto_163504 ) ) ( not ( = ?auto_163511 ?auto_163508 ) ) ( not ( = ?auto_163511 ?auto_163504 ) ) ( not ( = ?auto_163503 ?auto_163509 ) ) ( not ( = ?auto_163503 ?auto_163507 ) ) ( not ( = ?auto_163503 ?auto_163506 ) ) ( not ( = ?auto_163503 ?auto_163510 ) ) ( not ( = ?auto_163503 ?auto_163511 ) ) ( not ( = ?auto_163505 ?auto_163509 ) ) ( not ( = ?auto_163505 ?auto_163507 ) ) ( not ( = ?auto_163505 ?auto_163506 ) ) ( not ( = ?auto_163505 ?auto_163510 ) ) ( not ( = ?auto_163505 ?auto_163511 ) ) ( ON ?auto_163504 ?auto_163503 ) ( ON-TABLE ?auto_163505 ) ( ON ?auto_163508 ?auto_163504 ) ( ON ?auto_163511 ?auto_163508 ) ( CLEAR ?auto_163511 ) ( HOLDING ?auto_163510 ) ( CLEAR ?auto_163506 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163509 ?auto_163507 ?auto_163506 ?auto_163510 )
      ( MAKE-2PILE ?auto_163503 ?auto_163504 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163512 - BLOCK
      ?auto_163513 - BLOCK
    )
    :vars
    (
      ?auto_163519 - BLOCK
      ?auto_163515 - BLOCK
      ?auto_163517 - BLOCK
      ?auto_163518 - BLOCK
      ?auto_163520 - BLOCK
      ?auto_163514 - BLOCK
      ?auto_163516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163512 ?auto_163513 ) ) ( not ( = ?auto_163512 ?auto_163519 ) ) ( not ( = ?auto_163513 ?auto_163519 ) ) ( ON ?auto_163512 ?auto_163515 ) ( not ( = ?auto_163512 ?auto_163515 ) ) ( not ( = ?auto_163513 ?auto_163515 ) ) ( not ( = ?auto_163519 ?auto_163515 ) ) ( ON-TABLE ?auto_163517 ) ( ON ?auto_163518 ?auto_163517 ) ( ON ?auto_163520 ?auto_163518 ) ( not ( = ?auto_163517 ?auto_163518 ) ) ( not ( = ?auto_163517 ?auto_163520 ) ) ( not ( = ?auto_163517 ?auto_163514 ) ) ( not ( = ?auto_163517 ?auto_163516 ) ) ( not ( = ?auto_163517 ?auto_163519 ) ) ( not ( = ?auto_163517 ?auto_163513 ) ) ( not ( = ?auto_163518 ?auto_163520 ) ) ( not ( = ?auto_163518 ?auto_163514 ) ) ( not ( = ?auto_163518 ?auto_163516 ) ) ( not ( = ?auto_163518 ?auto_163519 ) ) ( not ( = ?auto_163518 ?auto_163513 ) ) ( not ( = ?auto_163520 ?auto_163514 ) ) ( not ( = ?auto_163520 ?auto_163516 ) ) ( not ( = ?auto_163520 ?auto_163519 ) ) ( not ( = ?auto_163520 ?auto_163513 ) ) ( not ( = ?auto_163514 ?auto_163516 ) ) ( not ( = ?auto_163514 ?auto_163519 ) ) ( not ( = ?auto_163514 ?auto_163513 ) ) ( not ( = ?auto_163516 ?auto_163519 ) ) ( not ( = ?auto_163516 ?auto_163513 ) ) ( not ( = ?auto_163512 ?auto_163517 ) ) ( not ( = ?auto_163512 ?auto_163518 ) ) ( not ( = ?auto_163512 ?auto_163520 ) ) ( not ( = ?auto_163512 ?auto_163514 ) ) ( not ( = ?auto_163512 ?auto_163516 ) ) ( not ( = ?auto_163515 ?auto_163517 ) ) ( not ( = ?auto_163515 ?auto_163518 ) ) ( not ( = ?auto_163515 ?auto_163520 ) ) ( not ( = ?auto_163515 ?auto_163514 ) ) ( not ( = ?auto_163515 ?auto_163516 ) ) ( ON ?auto_163513 ?auto_163512 ) ( ON-TABLE ?auto_163515 ) ( ON ?auto_163519 ?auto_163513 ) ( ON ?auto_163516 ?auto_163519 ) ( CLEAR ?auto_163520 ) ( ON ?auto_163514 ?auto_163516 ) ( CLEAR ?auto_163514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163515 ?auto_163512 ?auto_163513 ?auto_163519 ?auto_163516 )
      ( MAKE-2PILE ?auto_163512 ?auto_163513 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163521 - BLOCK
      ?auto_163522 - BLOCK
    )
    :vars
    (
      ?auto_163526 - BLOCK
      ?auto_163525 - BLOCK
      ?auto_163527 - BLOCK
      ?auto_163523 - BLOCK
      ?auto_163528 - BLOCK
      ?auto_163524 - BLOCK
      ?auto_163529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163521 ?auto_163522 ) ) ( not ( = ?auto_163521 ?auto_163526 ) ) ( not ( = ?auto_163522 ?auto_163526 ) ) ( ON ?auto_163521 ?auto_163525 ) ( not ( = ?auto_163521 ?auto_163525 ) ) ( not ( = ?auto_163522 ?auto_163525 ) ) ( not ( = ?auto_163526 ?auto_163525 ) ) ( ON-TABLE ?auto_163527 ) ( ON ?auto_163523 ?auto_163527 ) ( not ( = ?auto_163527 ?auto_163523 ) ) ( not ( = ?auto_163527 ?auto_163528 ) ) ( not ( = ?auto_163527 ?auto_163524 ) ) ( not ( = ?auto_163527 ?auto_163529 ) ) ( not ( = ?auto_163527 ?auto_163526 ) ) ( not ( = ?auto_163527 ?auto_163522 ) ) ( not ( = ?auto_163523 ?auto_163528 ) ) ( not ( = ?auto_163523 ?auto_163524 ) ) ( not ( = ?auto_163523 ?auto_163529 ) ) ( not ( = ?auto_163523 ?auto_163526 ) ) ( not ( = ?auto_163523 ?auto_163522 ) ) ( not ( = ?auto_163528 ?auto_163524 ) ) ( not ( = ?auto_163528 ?auto_163529 ) ) ( not ( = ?auto_163528 ?auto_163526 ) ) ( not ( = ?auto_163528 ?auto_163522 ) ) ( not ( = ?auto_163524 ?auto_163529 ) ) ( not ( = ?auto_163524 ?auto_163526 ) ) ( not ( = ?auto_163524 ?auto_163522 ) ) ( not ( = ?auto_163529 ?auto_163526 ) ) ( not ( = ?auto_163529 ?auto_163522 ) ) ( not ( = ?auto_163521 ?auto_163527 ) ) ( not ( = ?auto_163521 ?auto_163523 ) ) ( not ( = ?auto_163521 ?auto_163528 ) ) ( not ( = ?auto_163521 ?auto_163524 ) ) ( not ( = ?auto_163521 ?auto_163529 ) ) ( not ( = ?auto_163525 ?auto_163527 ) ) ( not ( = ?auto_163525 ?auto_163523 ) ) ( not ( = ?auto_163525 ?auto_163528 ) ) ( not ( = ?auto_163525 ?auto_163524 ) ) ( not ( = ?auto_163525 ?auto_163529 ) ) ( ON ?auto_163522 ?auto_163521 ) ( ON-TABLE ?auto_163525 ) ( ON ?auto_163526 ?auto_163522 ) ( ON ?auto_163529 ?auto_163526 ) ( ON ?auto_163524 ?auto_163529 ) ( CLEAR ?auto_163524 ) ( HOLDING ?auto_163528 ) ( CLEAR ?auto_163523 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163527 ?auto_163523 ?auto_163528 )
      ( MAKE-2PILE ?auto_163521 ?auto_163522 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163530 - BLOCK
      ?auto_163531 - BLOCK
    )
    :vars
    (
      ?auto_163536 - BLOCK
      ?auto_163534 - BLOCK
      ?auto_163535 - BLOCK
      ?auto_163533 - BLOCK
      ?auto_163538 - BLOCK
      ?auto_163532 - BLOCK
      ?auto_163537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163530 ?auto_163531 ) ) ( not ( = ?auto_163530 ?auto_163536 ) ) ( not ( = ?auto_163531 ?auto_163536 ) ) ( ON ?auto_163530 ?auto_163534 ) ( not ( = ?auto_163530 ?auto_163534 ) ) ( not ( = ?auto_163531 ?auto_163534 ) ) ( not ( = ?auto_163536 ?auto_163534 ) ) ( ON-TABLE ?auto_163535 ) ( ON ?auto_163533 ?auto_163535 ) ( not ( = ?auto_163535 ?auto_163533 ) ) ( not ( = ?auto_163535 ?auto_163538 ) ) ( not ( = ?auto_163535 ?auto_163532 ) ) ( not ( = ?auto_163535 ?auto_163537 ) ) ( not ( = ?auto_163535 ?auto_163536 ) ) ( not ( = ?auto_163535 ?auto_163531 ) ) ( not ( = ?auto_163533 ?auto_163538 ) ) ( not ( = ?auto_163533 ?auto_163532 ) ) ( not ( = ?auto_163533 ?auto_163537 ) ) ( not ( = ?auto_163533 ?auto_163536 ) ) ( not ( = ?auto_163533 ?auto_163531 ) ) ( not ( = ?auto_163538 ?auto_163532 ) ) ( not ( = ?auto_163538 ?auto_163537 ) ) ( not ( = ?auto_163538 ?auto_163536 ) ) ( not ( = ?auto_163538 ?auto_163531 ) ) ( not ( = ?auto_163532 ?auto_163537 ) ) ( not ( = ?auto_163532 ?auto_163536 ) ) ( not ( = ?auto_163532 ?auto_163531 ) ) ( not ( = ?auto_163537 ?auto_163536 ) ) ( not ( = ?auto_163537 ?auto_163531 ) ) ( not ( = ?auto_163530 ?auto_163535 ) ) ( not ( = ?auto_163530 ?auto_163533 ) ) ( not ( = ?auto_163530 ?auto_163538 ) ) ( not ( = ?auto_163530 ?auto_163532 ) ) ( not ( = ?auto_163530 ?auto_163537 ) ) ( not ( = ?auto_163534 ?auto_163535 ) ) ( not ( = ?auto_163534 ?auto_163533 ) ) ( not ( = ?auto_163534 ?auto_163538 ) ) ( not ( = ?auto_163534 ?auto_163532 ) ) ( not ( = ?auto_163534 ?auto_163537 ) ) ( ON ?auto_163531 ?auto_163530 ) ( ON-TABLE ?auto_163534 ) ( ON ?auto_163536 ?auto_163531 ) ( ON ?auto_163537 ?auto_163536 ) ( ON ?auto_163532 ?auto_163537 ) ( CLEAR ?auto_163533 ) ( ON ?auto_163538 ?auto_163532 ) ( CLEAR ?auto_163538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163534 ?auto_163530 ?auto_163531 ?auto_163536 ?auto_163537 ?auto_163532 )
      ( MAKE-2PILE ?auto_163530 ?auto_163531 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163539 - BLOCK
      ?auto_163540 - BLOCK
    )
    :vars
    (
      ?auto_163545 - BLOCK
      ?auto_163544 - BLOCK
      ?auto_163546 - BLOCK
      ?auto_163541 - BLOCK
      ?auto_163543 - BLOCK
      ?auto_163547 - BLOCK
      ?auto_163542 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163539 ?auto_163540 ) ) ( not ( = ?auto_163539 ?auto_163545 ) ) ( not ( = ?auto_163540 ?auto_163545 ) ) ( ON ?auto_163539 ?auto_163544 ) ( not ( = ?auto_163539 ?auto_163544 ) ) ( not ( = ?auto_163540 ?auto_163544 ) ) ( not ( = ?auto_163545 ?auto_163544 ) ) ( ON-TABLE ?auto_163546 ) ( not ( = ?auto_163546 ?auto_163541 ) ) ( not ( = ?auto_163546 ?auto_163543 ) ) ( not ( = ?auto_163546 ?auto_163547 ) ) ( not ( = ?auto_163546 ?auto_163542 ) ) ( not ( = ?auto_163546 ?auto_163545 ) ) ( not ( = ?auto_163546 ?auto_163540 ) ) ( not ( = ?auto_163541 ?auto_163543 ) ) ( not ( = ?auto_163541 ?auto_163547 ) ) ( not ( = ?auto_163541 ?auto_163542 ) ) ( not ( = ?auto_163541 ?auto_163545 ) ) ( not ( = ?auto_163541 ?auto_163540 ) ) ( not ( = ?auto_163543 ?auto_163547 ) ) ( not ( = ?auto_163543 ?auto_163542 ) ) ( not ( = ?auto_163543 ?auto_163545 ) ) ( not ( = ?auto_163543 ?auto_163540 ) ) ( not ( = ?auto_163547 ?auto_163542 ) ) ( not ( = ?auto_163547 ?auto_163545 ) ) ( not ( = ?auto_163547 ?auto_163540 ) ) ( not ( = ?auto_163542 ?auto_163545 ) ) ( not ( = ?auto_163542 ?auto_163540 ) ) ( not ( = ?auto_163539 ?auto_163546 ) ) ( not ( = ?auto_163539 ?auto_163541 ) ) ( not ( = ?auto_163539 ?auto_163543 ) ) ( not ( = ?auto_163539 ?auto_163547 ) ) ( not ( = ?auto_163539 ?auto_163542 ) ) ( not ( = ?auto_163544 ?auto_163546 ) ) ( not ( = ?auto_163544 ?auto_163541 ) ) ( not ( = ?auto_163544 ?auto_163543 ) ) ( not ( = ?auto_163544 ?auto_163547 ) ) ( not ( = ?auto_163544 ?auto_163542 ) ) ( ON ?auto_163540 ?auto_163539 ) ( ON-TABLE ?auto_163544 ) ( ON ?auto_163545 ?auto_163540 ) ( ON ?auto_163542 ?auto_163545 ) ( ON ?auto_163547 ?auto_163542 ) ( ON ?auto_163543 ?auto_163547 ) ( CLEAR ?auto_163543 ) ( HOLDING ?auto_163541 ) ( CLEAR ?auto_163546 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163546 ?auto_163541 )
      ( MAKE-2PILE ?auto_163539 ?auto_163540 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163548 - BLOCK
      ?auto_163549 - BLOCK
    )
    :vars
    (
      ?auto_163553 - BLOCK
      ?auto_163554 - BLOCK
      ?auto_163556 - BLOCK
      ?auto_163555 - BLOCK
      ?auto_163550 - BLOCK
      ?auto_163551 - BLOCK
      ?auto_163552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163548 ?auto_163549 ) ) ( not ( = ?auto_163548 ?auto_163553 ) ) ( not ( = ?auto_163549 ?auto_163553 ) ) ( ON ?auto_163548 ?auto_163554 ) ( not ( = ?auto_163548 ?auto_163554 ) ) ( not ( = ?auto_163549 ?auto_163554 ) ) ( not ( = ?auto_163553 ?auto_163554 ) ) ( ON-TABLE ?auto_163556 ) ( not ( = ?auto_163556 ?auto_163555 ) ) ( not ( = ?auto_163556 ?auto_163550 ) ) ( not ( = ?auto_163556 ?auto_163551 ) ) ( not ( = ?auto_163556 ?auto_163552 ) ) ( not ( = ?auto_163556 ?auto_163553 ) ) ( not ( = ?auto_163556 ?auto_163549 ) ) ( not ( = ?auto_163555 ?auto_163550 ) ) ( not ( = ?auto_163555 ?auto_163551 ) ) ( not ( = ?auto_163555 ?auto_163552 ) ) ( not ( = ?auto_163555 ?auto_163553 ) ) ( not ( = ?auto_163555 ?auto_163549 ) ) ( not ( = ?auto_163550 ?auto_163551 ) ) ( not ( = ?auto_163550 ?auto_163552 ) ) ( not ( = ?auto_163550 ?auto_163553 ) ) ( not ( = ?auto_163550 ?auto_163549 ) ) ( not ( = ?auto_163551 ?auto_163552 ) ) ( not ( = ?auto_163551 ?auto_163553 ) ) ( not ( = ?auto_163551 ?auto_163549 ) ) ( not ( = ?auto_163552 ?auto_163553 ) ) ( not ( = ?auto_163552 ?auto_163549 ) ) ( not ( = ?auto_163548 ?auto_163556 ) ) ( not ( = ?auto_163548 ?auto_163555 ) ) ( not ( = ?auto_163548 ?auto_163550 ) ) ( not ( = ?auto_163548 ?auto_163551 ) ) ( not ( = ?auto_163548 ?auto_163552 ) ) ( not ( = ?auto_163554 ?auto_163556 ) ) ( not ( = ?auto_163554 ?auto_163555 ) ) ( not ( = ?auto_163554 ?auto_163550 ) ) ( not ( = ?auto_163554 ?auto_163551 ) ) ( not ( = ?auto_163554 ?auto_163552 ) ) ( ON ?auto_163549 ?auto_163548 ) ( ON-TABLE ?auto_163554 ) ( ON ?auto_163553 ?auto_163549 ) ( ON ?auto_163552 ?auto_163553 ) ( ON ?auto_163551 ?auto_163552 ) ( ON ?auto_163550 ?auto_163551 ) ( CLEAR ?auto_163556 ) ( ON ?auto_163555 ?auto_163550 ) ( CLEAR ?auto_163555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163554 ?auto_163548 ?auto_163549 ?auto_163553 ?auto_163552 ?auto_163551 ?auto_163550 )
      ( MAKE-2PILE ?auto_163548 ?auto_163549 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163557 - BLOCK
      ?auto_163558 - BLOCK
    )
    :vars
    (
      ?auto_163565 - BLOCK
      ?auto_163563 - BLOCK
      ?auto_163559 - BLOCK
      ?auto_163562 - BLOCK
      ?auto_163561 - BLOCK
      ?auto_163564 - BLOCK
      ?auto_163560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163557 ?auto_163558 ) ) ( not ( = ?auto_163557 ?auto_163565 ) ) ( not ( = ?auto_163558 ?auto_163565 ) ) ( ON ?auto_163557 ?auto_163563 ) ( not ( = ?auto_163557 ?auto_163563 ) ) ( not ( = ?auto_163558 ?auto_163563 ) ) ( not ( = ?auto_163565 ?auto_163563 ) ) ( not ( = ?auto_163559 ?auto_163562 ) ) ( not ( = ?auto_163559 ?auto_163561 ) ) ( not ( = ?auto_163559 ?auto_163564 ) ) ( not ( = ?auto_163559 ?auto_163560 ) ) ( not ( = ?auto_163559 ?auto_163565 ) ) ( not ( = ?auto_163559 ?auto_163558 ) ) ( not ( = ?auto_163562 ?auto_163561 ) ) ( not ( = ?auto_163562 ?auto_163564 ) ) ( not ( = ?auto_163562 ?auto_163560 ) ) ( not ( = ?auto_163562 ?auto_163565 ) ) ( not ( = ?auto_163562 ?auto_163558 ) ) ( not ( = ?auto_163561 ?auto_163564 ) ) ( not ( = ?auto_163561 ?auto_163560 ) ) ( not ( = ?auto_163561 ?auto_163565 ) ) ( not ( = ?auto_163561 ?auto_163558 ) ) ( not ( = ?auto_163564 ?auto_163560 ) ) ( not ( = ?auto_163564 ?auto_163565 ) ) ( not ( = ?auto_163564 ?auto_163558 ) ) ( not ( = ?auto_163560 ?auto_163565 ) ) ( not ( = ?auto_163560 ?auto_163558 ) ) ( not ( = ?auto_163557 ?auto_163559 ) ) ( not ( = ?auto_163557 ?auto_163562 ) ) ( not ( = ?auto_163557 ?auto_163561 ) ) ( not ( = ?auto_163557 ?auto_163564 ) ) ( not ( = ?auto_163557 ?auto_163560 ) ) ( not ( = ?auto_163563 ?auto_163559 ) ) ( not ( = ?auto_163563 ?auto_163562 ) ) ( not ( = ?auto_163563 ?auto_163561 ) ) ( not ( = ?auto_163563 ?auto_163564 ) ) ( not ( = ?auto_163563 ?auto_163560 ) ) ( ON ?auto_163558 ?auto_163557 ) ( ON-TABLE ?auto_163563 ) ( ON ?auto_163565 ?auto_163558 ) ( ON ?auto_163560 ?auto_163565 ) ( ON ?auto_163564 ?auto_163560 ) ( ON ?auto_163561 ?auto_163564 ) ( ON ?auto_163562 ?auto_163561 ) ( CLEAR ?auto_163562 ) ( HOLDING ?auto_163559 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163559 )
      ( MAKE-2PILE ?auto_163557 ?auto_163558 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163566 - BLOCK
      ?auto_163567 - BLOCK
    )
    :vars
    (
      ?auto_163574 - BLOCK
      ?auto_163571 - BLOCK
      ?auto_163569 - BLOCK
      ?auto_163568 - BLOCK
      ?auto_163570 - BLOCK
      ?auto_163572 - BLOCK
      ?auto_163573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163566 ?auto_163567 ) ) ( not ( = ?auto_163566 ?auto_163574 ) ) ( not ( = ?auto_163567 ?auto_163574 ) ) ( ON ?auto_163566 ?auto_163571 ) ( not ( = ?auto_163566 ?auto_163571 ) ) ( not ( = ?auto_163567 ?auto_163571 ) ) ( not ( = ?auto_163574 ?auto_163571 ) ) ( not ( = ?auto_163569 ?auto_163568 ) ) ( not ( = ?auto_163569 ?auto_163570 ) ) ( not ( = ?auto_163569 ?auto_163572 ) ) ( not ( = ?auto_163569 ?auto_163573 ) ) ( not ( = ?auto_163569 ?auto_163574 ) ) ( not ( = ?auto_163569 ?auto_163567 ) ) ( not ( = ?auto_163568 ?auto_163570 ) ) ( not ( = ?auto_163568 ?auto_163572 ) ) ( not ( = ?auto_163568 ?auto_163573 ) ) ( not ( = ?auto_163568 ?auto_163574 ) ) ( not ( = ?auto_163568 ?auto_163567 ) ) ( not ( = ?auto_163570 ?auto_163572 ) ) ( not ( = ?auto_163570 ?auto_163573 ) ) ( not ( = ?auto_163570 ?auto_163574 ) ) ( not ( = ?auto_163570 ?auto_163567 ) ) ( not ( = ?auto_163572 ?auto_163573 ) ) ( not ( = ?auto_163572 ?auto_163574 ) ) ( not ( = ?auto_163572 ?auto_163567 ) ) ( not ( = ?auto_163573 ?auto_163574 ) ) ( not ( = ?auto_163573 ?auto_163567 ) ) ( not ( = ?auto_163566 ?auto_163569 ) ) ( not ( = ?auto_163566 ?auto_163568 ) ) ( not ( = ?auto_163566 ?auto_163570 ) ) ( not ( = ?auto_163566 ?auto_163572 ) ) ( not ( = ?auto_163566 ?auto_163573 ) ) ( not ( = ?auto_163571 ?auto_163569 ) ) ( not ( = ?auto_163571 ?auto_163568 ) ) ( not ( = ?auto_163571 ?auto_163570 ) ) ( not ( = ?auto_163571 ?auto_163572 ) ) ( not ( = ?auto_163571 ?auto_163573 ) ) ( ON ?auto_163567 ?auto_163566 ) ( ON-TABLE ?auto_163571 ) ( ON ?auto_163574 ?auto_163567 ) ( ON ?auto_163573 ?auto_163574 ) ( ON ?auto_163572 ?auto_163573 ) ( ON ?auto_163570 ?auto_163572 ) ( ON ?auto_163568 ?auto_163570 ) ( ON ?auto_163569 ?auto_163568 ) ( CLEAR ?auto_163569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163571 ?auto_163566 ?auto_163567 ?auto_163574 ?auto_163573 ?auto_163572 ?auto_163570 ?auto_163568 )
      ( MAKE-2PILE ?auto_163566 ?auto_163567 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_163602 - BLOCK
      ?auto_163603 - BLOCK
      ?auto_163604 - BLOCK
      ?auto_163605 - BLOCK
      ?auto_163606 - BLOCK
    )
    :vars
    (
      ?auto_163607 - BLOCK
      ?auto_163608 - BLOCK
      ?auto_163609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163607 ?auto_163606 ) ( ON-TABLE ?auto_163602 ) ( ON ?auto_163603 ?auto_163602 ) ( ON ?auto_163604 ?auto_163603 ) ( ON ?auto_163605 ?auto_163604 ) ( ON ?auto_163606 ?auto_163605 ) ( not ( = ?auto_163602 ?auto_163603 ) ) ( not ( = ?auto_163602 ?auto_163604 ) ) ( not ( = ?auto_163602 ?auto_163605 ) ) ( not ( = ?auto_163602 ?auto_163606 ) ) ( not ( = ?auto_163602 ?auto_163607 ) ) ( not ( = ?auto_163603 ?auto_163604 ) ) ( not ( = ?auto_163603 ?auto_163605 ) ) ( not ( = ?auto_163603 ?auto_163606 ) ) ( not ( = ?auto_163603 ?auto_163607 ) ) ( not ( = ?auto_163604 ?auto_163605 ) ) ( not ( = ?auto_163604 ?auto_163606 ) ) ( not ( = ?auto_163604 ?auto_163607 ) ) ( not ( = ?auto_163605 ?auto_163606 ) ) ( not ( = ?auto_163605 ?auto_163607 ) ) ( not ( = ?auto_163606 ?auto_163607 ) ) ( not ( = ?auto_163602 ?auto_163608 ) ) ( not ( = ?auto_163602 ?auto_163609 ) ) ( not ( = ?auto_163603 ?auto_163608 ) ) ( not ( = ?auto_163603 ?auto_163609 ) ) ( not ( = ?auto_163604 ?auto_163608 ) ) ( not ( = ?auto_163604 ?auto_163609 ) ) ( not ( = ?auto_163605 ?auto_163608 ) ) ( not ( = ?auto_163605 ?auto_163609 ) ) ( not ( = ?auto_163606 ?auto_163608 ) ) ( not ( = ?auto_163606 ?auto_163609 ) ) ( not ( = ?auto_163607 ?auto_163608 ) ) ( not ( = ?auto_163607 ?auto_163609 ) ) ( not ( = ?auto_163608 ?auto_163609 ) ) ( ON ?auto_163608 ?auto_163607 ) ( CLEAR ?auto_163608 ) ( HOLDING ?auto_163609 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163609 )
      ( MAKE-5PILE ?auto_163602 ?auto_163603 ?auto_163604 ?auto_163605 ?auto_163606 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163715 - BLOCK
      ?auto_163716 - BLOCK
      ?auto_163717 - BLOCK
    )
    :vars
    (
      ?auto_163718 - BLOCK
      ?auto_163721 - BLOCK
      ?auto_163722 - BLOCK
      ?auto_163720 - BLOCK
      ?auto_163719 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163715 ) ( not ( = ?auto_163715 ?auto_163716 ) ) ( not ( = ?auto_163715 ?auto_163717 ) ) ( not ( = ?auto_163716 ?auto_163717 ) ) ( ON ?auto_163717 ?auto_163718 ) ( not ( = ?auto_163715 ?auto_163718 ) ) ( not ( = ?auto_163716 ?auto_163718 ) ) ( not ( = ?auto_163717 ?auto_163718 ) ) ( CLEAR ?auto_163715 ) ( ON ?auto_163716 ?auto_163717 ) ( CLEAR ?auto_163716 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163721 ) ( ON ?auto_163722 ?auto_163721 ) ( ON ?auto_163720 ?auto_163722 ) ( ON ?auto_163719 ?auto_163720 ) ( ON ?auto_163718 ?auto_163719 ) ( not ( = ?auto_163721 ?auto_163722 ) ) ( not ( = ?auto_163721 ?auto_163720 ) ) ( not ( = ?auto_163721 ?auto_163719 ) ) ( not ( = ?auto_163721 ?auto_163718 ) ) ( not ( = ?auto_163721 ?auto_163717 ) ) ( not ( = ?auto_163721 ?auto_163716 ) ) ( not ( = ?auto_163722 ?auto_163720 ) ) ( not ( = ?auto_163722 ?auto_163719 ) ) ( not ( = ?auto_163722 ?auto_163718 ) ) ( not ( = ?auto_163722 ?auto_163717 ) ) ( not ( = ?auto_163722 ?auto_163716 ) ) ( not ( = ?auto_163720 ?auto_163719 ) ) ( not ( = ?auto_163720 ?auto_163718 ) ) ( not ( = ?auto_163720 ?auto_163717 ) ) ( not ( = ?auto_163720 ?auto_163716 ) ) ( not ( = ?auto_163719 ?auto_163718 ) ) ( not ( = ?auto_163719 ?auto_163717 ) ) ( not ( = ?auto_163719 ?auto_163716 ) ) ( not ( = ?auto_163715 ?auto_163721 ) ) ( not ( = ?auto_163715 ?auto_163722 ) ) ( not ( = ?auto_163715 ?auto_163720 ) ) ( not ( = ?auto_163715 ?auto_163719 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163721 ?auto_163722 ?auto_163720 ?auto_163719 ?auto_163718 ?auto_163717 )
      ( MAKE-3PILE ?auto_163715 ?auto_163716 ?auto_163717 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163723 - BLOCK
      ?auto_163724 - BLOCK
      ?auto_163725 - BLOCK
    )
    :vars
    (
      ?auto_163727 - BLOCK
      ?auto_163728 - BLOCK
      ?auto_163729 - BLOCK
      ?auto_163726 - BLOCK
      ?auto_163730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163723 ?auto_163724 ) ) ( not ( = ?auto_163723 ?auto_163725 ) ) ( not ( = ?auto_163724 ?auto_163725 ) ) ( ON ?auto_163725 ?auto_163727 ) ( not ( = ?auto_163723 ?auto_163727 ) ) ( not ( = ?auto_163724 ?auto_163727 ) ) ( not ( = ?auto_163725 ?auto_163727 ) ) ( ON ?auto_163724 ?auto_163725 ) ( CLEAR ?auto_163724 ) ( ON-TABLE ?auto_163728 ) ( ON ?auto_163729 ?auto_163728 ) ( ON ?auto_163726 ?auto_163729 ) ( ON ?auto_163730 ?auto_163726 ) ( ON ?auto_163727 ?auto_163730 ) ( not ( = ?auto_163728 ?auto_163729 ) ) ( not ( = ?auto_163728 ?auto_163726 ) ) ( not ( = ?auto_163728 ?auto_163730 ) ) ( not ( = ?auto_163728 ?auto_163727 ) ) ( not ( = ?auto_163728 ?auto_163725 ) ) ( not ( = ?auto_163728 ?auto_163724 ) ) ( not ( = ?auto_163729 ?auto_163726 ) ) ( not ( = ?auto_163729 ?auto_163730 ) ) ( not ( = ?auto_163729 ?auto_163727 ) ) ( not ( = ?auto_163729 ?auto_163725 ) ) ( not ( = ?auto_163729 ?auto_163724 ) ) ( not ( = ?auto_163726 ?auto_163730 ) ) ( not ( = ?auto_163726 ?auto_163727 ) ) ( not ( = ?auto_163726 ?auto_163725 ) ) ( not ( = ?auto_163726 ?auto_163724 ) ) ( not ( = ?auto_163730 ?auto_163727 ) ) ( not ( = ?auto_163730 ?auto_163725 ) ) ( not ( = ?auto_163730 ?auto_163724 ) ) ( not ( = ?auto_163723 ?auto_163728 ) ) ( not ( = ?auto_163723 ?auto_163729 ) ) ( not ( = ?auto_163723 ?auto_163726 ) ) ( not ( = ?auto_163723 ?auto_163730 ) ) ( HOLDING ?auto_163723 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163723 )
      ( MAKE-3PILE ?auto_163723 ?auto_163724 ?auto_163725 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163731 - BLOCK
      ?auto_163732 - BLOCK
      ?auto_163733 - BLOCK
    )
    :vars
    (
      ?auto_163735 - BLOCK
      ?auto_163738 - BLOCK
      ?auto_163737 - BLOCK
      ?auto_163734 - BLOCK
      ?auto_163736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163731 ?auto_163732 ) ) ( not ( = ?auto_163731 ?auto_163733 ) ) ( not ( = ?auto_163732 ?auto_163733 ) ) ( ON ?auto_163733 ?auto_163735 ) ( not ( = ?auto_163731 ?auto_163735 ) ) ( not ( = ?auto_163732 ?auto_163735 ) ) ( not ( = ?auto_163733 ?auto_163735 ) ) ( ON ?auto_163732 ?auto_163733 ) ( ON-TABLE ?auto_163738 ) ( ON ?auto_163737 ?auto_163738 ) ( ON ?auto_163734 ?auto_163737 ) ( ON ?auto_163736 ?auto_163734 ) ( ON ?auto_163735 ?auto_163736 ) ( not ( = ?auto_163738 ?auto_163737 ) ) ( not ( = ?auto_163738 ?auto_163734 ) ) ( not ( = ?auto_163738 ?auto_163736 ) ) ( not ( = ?auto_163738 ?auto_163735 ) ) ( not ( = ?auto_163738 ?auto_163733 ) ) ( not ( = ?auto_163738 ?auto_163732 ) ) ( not ( = ?auto_163737 ?auto_163734 ) ) ( not ( = ?auto_163737 ?auto_163736 ) ) ( not ( = ?auto_163737 ?auto_163735 ) ) ( not ( = ?auto_163737 ?auto_163733 ) ) ( not ( = ?auto_163737 ?auto_163732 ) ) ( not ( = ?auto_163734 ?auto_163736 ) ) ( not ( = ?auto_163734 ?auto_163735 ) ) ( not ( = ?auto_163734 ?auto_163733 ) ) ( not ( = ?auto_163734 ?auto_163732 ) ) ( not ( = ?auto_163736 ?auto_163735 ) ) ( not ( = ?auto_163736 ?auto_163733 ) ) ( not ( = ?auto_163736 ?auto_163732 ) ) ( not ( = ?auto_163731 ?auto_163738 ) ) ( not ( = ?auto_163731 ?auto_163737 ) ) ( not ( = ?auto_163731 ?auto_163734 ) ) ( not ( = ?auto_163731 ?auto_163736 ) ) ( ON ?auto_163731 ?auto_163732 ) ( CLEAR ?auto_163731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163738 ?auto_163737 ?auto_163734 ?auto_163736 ?auto_163735 ?auto_163733 ?auto_163732 )
      ( MAKE-3PILE ?auto_163731 ?auto_163732 ?auto_163733 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163742 - BLOCK
      ?auto_163743 - BLOCK
      ?auto_163744 - BLOCK
    )
    :vars
    (
      ?auto_163749 - BLOCK
      ?auto_163747 - BLOCK
      ?auto_163748 - BLOCK
      ?auto_163746 - BLOCK
      ?auto_163745 - BLOCK
      ?auto_163750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163742 ?auto_163743 ) ) ( not ( = ?auto_163742 ?auto_163744 ) ) ( not ( = ?auto_163743 ?auto_163744 ) ) ( ON ?auto_163744 ?auto_163749 ) ( not ( = ?auto_163742 ?auto_163749 ) ) ( not ( = ?auto_163743 ?auto_163749 ) ) ( not ( = ?auto_163744 ?auto_163749 ) ) ( ON ?auto_163743 ?auto_163744 ) ( CLEAR ?auto_163743 ) ( ON-TABLE ?auto_163747 ) ( ON ?auto_163748 ?auto_163747 ) ( ON ?auto_163746 ?auto_163748 ) ( ON ?auto_163745 ?auto_163746 ) ( ON ?auto_163749 ?auto_163745 ) ( not ( = ?auto_163747 ?auto_163748 ) ) ( not ( = ?auto_163747 ?auto_163746 ) ) ( not ( = ?auto_163747 ?auto_163745 ) ) ( not ( = ?auto_163747 ?auto_163749 ) ) ( not ( = ?auto_163747 ?auto_163744 ) ) ( not ( = ?auto_163747 ?auto_163743 ) ) ( not ( = ?auto_163748 ?auto_163746 ) ) ( not ( = ?auto_163748 ?auto_163745 ) ) ( not ( = ?auto_163748 ?auto_163749 ) ) ( not ( = ?auto_163748 ?auto_163744 ) ) ( not ( = ?auto_163748 ?auto_163743 ) ) ( not ( = ?auto_163746 ?auto_163745 ) ) ( not ( = ?auto_163746 ?auto_163749 ) ) ( not ( = ?auto_163746 ?auto_163744 ) ) ( not ( = ?auto_163746 ?auto_163743 ) ) ( not ( = ?auto_163745 ?auto_163749 ) ) ( not ( = ?auto_163745 ?auto_163744 ) ) ( not ( = ?auto_163745 ?auto_163743 ) ) ( not ( = ?auto_163742 ?auto_163747 ) ) ( not ( = ?auto_163742 ?auto_163748 ) ) ( not ( = ?auto_163742 ?auto_163746 ) ) ( not ( = ?auto_163742 ?auto_163745 ) ) ( ON ?auto_163742 ?auto_163750 ) ( CLEAR ?auto_163742 ) ( HAND-EMPTY ) ( not ( = ?auto_163742 ?auto_163750 ) ) ( not ( = ?auto_163743 ?auto_163750 ) ) ( not ( = ?auto_163744 ?auto_163750 ) ) ( not ( = ?auto_163749 ?auto_163750 ) ) ( not ( = ?auto_163747 ?auto_163750 ) ) ( not ( = ?auto_163748 ?auto_163750 ) ) ( not ( = ?auto_163746 ?auto_163750 ) ) ( not ( = ?auto_163745 ?auto_163750 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_163742 ?auto_163750 )
      ( MAKE-3PILE ?auto_163742 ?auto_163743 ?auto_163744 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163751 - BLOCK
      ?auto_163752 - BLOCK
      ?auto_163753 - BLOCK
    )
    :vars
    (
      ?auto_163759 - BLOCK
      ?auto_163758 - BLOCK
      ?auto_163756 - BLOCK
      ?auto_163755 - BLOCK
      ?auto_163754 - BLOCK
      ?auto_163757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163751 ?auto_163752 ) ) ( not ( = ?auto_163751 ?auto_163753 ) ) ( not ( = ?auto_163752 ?auto_163753 ) ) ( ON ?auto_163753 ?auto_163759 ) ( not ( = ?auto_163751 ?auto_163759 ) ) ( not ( = ?auto_163752 ?auto_163759 ) ) ( not ( = ?auto_163753 ?auto_163759 ) ) ( ON-TABLE ?auto_163758 ) ( ON ?auto_163756 ?auto_163758 ) ( ON ?auto_163755 ?auto_163756 ) ( ON ?auto_163754 ?auto_163755 ) ( ON ?auto_163759 ?auto_163754 ) ( not ( = ?auto_163758 ?auto_163756 ) ) ( not ( = ?auto_163758 ?auto_163755 ) ) ( not ( = ?auto_163758 ?auto_163754 ) ) ( not ( = ?auto_163758 ?auto_163759 ) ) ( not ( = ?auto_163758 ?auto_163753 ) ) ( not ( = ?auto_163758 ?auto_163752 ) ) ( not ( = ?auto_163756 ?auto_163755 ) ) ( not ( = ?auto_163756 ?auto_163754 ) ) ( not ( = ?auto_163756 ?auto_163759 ) ) ( not ( = ?auto_163756 ?auto_163753 ) ) ( not ( = ?auto_163756 ?auto_163752 ) ) ( not ( = ?auto_163755 ?auto_163754 ) ) ( not ( = ?auto_163755 ?auto_163759 ) ) ( not ( = ?auto_163755 ?auto_163753 ) ) ( not ( = ?auto_163755 ?auto_163752 ) ) ( not ( = ?auto_163754 ?auto_163759 ) ) ( not ( = ?auto_163754 ?auto_163753 ) ) ( not ( = ?auto_163754 ?auto_163752 ) ) ( not ( = ?auto_163751 ?auto_163758 ) ) ( not ( = ?auto_163751 ?auto_163756 ) ) ( not ( = ?auto_163751 ?auto_163755 ) ) ( not ( = ?auto_163751 ?auto_163754 ) ) ( ON ?auto_163751 ?auto_163757 ) ( CLEAR ?auto_163751 ) ( not ( = ?auto_163751 ?auto_163757 ) ) ( not ( = ?auto_163752 ?auto_163757 ) ) ( not ( = ?auto_163753 ?auto_163757 ) ) ( not ( = ?auto_163759 ?auto_163757 ) ) ( not ( = ?auto_163758 ?auto_163757 ) ) ( not ( = ?auto_163756 ?auto_163757 ) ) ( not ( = ?auto_163755 ?auto_163757 ) ) ( not ( = ?auto_163754 ?auto_163757 ) ) ( HOLDING ?auto_163752 ) ( CLEAR ?auto_163753 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163758 ?auto_163756 ?auto_163755 ?auto_163754 ?auto_163759 ?auto_163753 ?auto_163752 )
      ( MAKE-3PILE ?auto_163751 ?auto_163752 ?auto_163753 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163760 - BLOCK
      ?auto_163761 - BLOCK
      ?auto_163762 - BLOCK
    )
    :vars
    (
      ?auto_163765 - BLOCK
      ?auto_163767 - BLOCK
      ?auto_163764 - BLOCK
      ?auto_163763 - BLOCK
      ?auto_163768 - BLOCK
      ?auto_163766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163760 ?auto_163761 ) ) ( not ( = ?auto_163760 ?auto_163762 ) ) ( not ( = ?auto_163761 ?auto_163762 ) ) ( ON ?auto_163762 ?auto_163765 ) ( not ( = ?auto_163760 ?auto_163765 ) ) ( not ( = ?auto_163761 ?auto_163765 ) ) ( not ( = ?auto_163762 ?auto_163765 ) ) ( ON-TABLE ?auto_163767 ) ( ON ?auto_163764 ?auto_163767 ) ( ON ?auto_163763 ?auto_163764 ) ( ON ?auto_163768 ?auto_163763 ) ( ON ?auto_163765 ?auto_163768 ) ( not ( = ?auto_163767 ?auto_163764 ) ) ( not ( = ?auto_163767 ?auto_163763 ) ) ( not ( = ?auto_163767 ?auto_163768 ) ) ( not ( = ?auto_163767 ?auto_163765 ) ) ( not ( = ?auto_163767 ?auto_163762 ) ) ( not ( = ?auto_163767 ?auto_163761 ) ) ( not ( = ?auto_163764 ?auto_163763 ) ) ( not ( = ?auto_163764 ?auto_163768 ) ) ( not ( = ?auto_163764 ?auto_163765 ) ) ( not ( = ?auto_163764 ?auto_163762 ) ) ( not ( = ?auto_163764 ?auto_163761 ) ) ( not ( = ?auto_163763 ?auto_163768 ) ) ( not ( = ?auto_163763 ?auto_163765 ) ) ( not ( = ?auto_163763 ?auto_163762 ) ) ( not ( = ?auto_163763 ?auto_163761 ) ) ( not ( = ?auto_163768 ?auto_163765 ) ) ( not ( = ?auto_163768 ?auto_163762 ) ) ( not ( = ?auto_163768 ?auto_163761 ) ) ( not ( = ?auto_163760 ?auto_163767 ) ) ( not ( = ?auto_163760 ?auto_163764 ) ) ( not ( = ?auto_163760 ?auto_163763 ) ) ( not ( = ?auto_163760 ?auto_163768 ) ) ( ON ?auto_163760 ?auto_163766 ) ( not ( = ?auto_163760 ?auto_163766 ) ) ( not ( = ?auto_163761 ?auto_163766 ) ) ( not ( = ?auto_163762 ?auto_163766 ) ) ( not ( = ?auto_163765 ?auto_163766 ) ) ( not ( = ?auto_163767 ?auto_163766 ) ) ( not ( = ?auto_163764 ?auto_163766 ) ) ( not ( = ?auto_163763 ?auto_163766 ) ) ( not ( = ?auto_163768 ?auto_163766 ) ) ( CLEAR ?auto_163762 ) ( ON ?auto_163761 ?auto_163760 ) ( CLEAR ?auto_163761 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163766 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163766 ?auto_163760 )
      ( MAKE-3PILE ?auto_163760 ?auto_163761 ?auto_163762 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163769 - BLOCK
      ?auto_163770 - BLOCK
      ?auto_163771 - BLOCK
    )
    :vars
    (
      ?auto_163777 - BLOCK
      ?auto_163774 - BLOCK
      ?auto_163772 - BLOCK
      ?auto_163776 - BLOCK
      ?auto_163773 - BLOCK
      ?auto_163775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163769 ?auto_163770 ) ) ( not ( = ?auto_163769 ?auto_163771 ) ) ( not ( = ?auto_163770 ?auto_163771 ) ) ( not ( = ?auto_163769 ?auto_163777 ) ) ( not ( = ?auto_163770 ?auto_163777 ) ) ( not ( = ?auto_163771 ?auto_163777 ) ) ( ON-TABLE ?auto_163774 ) ( ON ?auto_163772 ?auto_163774 ) ( ON ?auto_163776 ?auto_163772 ) ( ON ?auto_163773 ?auto_163776 ) ( ON ?auto_163777 ?auto_163773 ) ( not ( = ?auto_163774 ?auto_163772 ) ) ( not ( = ?auto_163774 ?auto_163776 ) ) ( not ( = ?auto_163774 ?auto_163773 ) ) ( not ( = ?auto_163774 ?auto_163777 ) ) ( not ( = ?auto_163774 ?auto_163771 ) ) ( not ( = ?auto_163774 ?auto_163770 ) ) ( not ( = ?auto_163772 ?auto_163776 ) ) ( not ( = ?auto_163772 ?auto_163773 ) ) ( not ( = ?auto_163772 ?auto_163777 ) ) ( not ( = ?auto_163772 ?auto_163771 ) ) ( not ( = ?auto_163772 ?auto_163770 ) ) ( not ( = ?auto_163776 ?auto_163773 ) ) ( not ( = ?auto_163776 ?auto_163777 ) ) ( not ( = ?auto_163776 ?auto_163771 ) ) ( not ( = ?auto_163776 ?auto_163770 ) ) ( not ( = ?auto_163773 ?auto_163777 ) ) ( not ( = ?auto_163773 ?auto_163771 ) ) ( not ( = ?auto_163773 ?auto_163770 ) ) ( not ( = ?auto_163769 ?auto_163774 ) ) ( not ( = ?auto_163769 ?auto_163772 ) ) ( not ( = ?auto_163769 ?auto_163776 ) ) ( not ( = ?auto_163769 ?auto_163773 ) ) ( ON ?auto_163769 ?auto_163775 ) ( not ( = ?auto_163769 ?auto_163775 ) ) ( not ( = ?auto_163770 ?auto_163775 ) ) ( not ( = ?auto_163771 ?auto_163775 ) ) ( not ( = ?auto_163777 ?auto_163775 ) ) ( not ( = ?auto_163774 ?auto_163775 ) ) ( not ( = ?auto_163772 ?auto_163775 ) ) ( not ( = ?auto_163776 ?auto_163775 ) ) ( not ( = ?auto_163773 ?auto_163775 ) ) ( ON ?auto_163770 ?auto_163769 ) ( CLEAR ?auto_163770 ) ( ON-TABLE ?auto_163775 ) ( HOLDING ?auto_163771 ) ( CLEAR ?auto_163777 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163774 ?auto_163772 ?auto_163776 ?auto_163773 ?auto_163777 ?auto_163771 )
      ( MAKE-3PILE ?auto_163769 ?auto_163770 ?auto_163771 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163778 - BLOCK
      ?auto_163779 - BLOCK
      ?auto_163780 - BLOCK
    )
    :vars
    (
      ?auto_163786 - BLOCK
      ?auto_163782 - BLOCK
      ?auto_163781 - BLOCK
      ?auto_163785 - BLOCK
      ?auto_163783 - BLOCK
      ?auto_163784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163778 ?auto_163779 ) ) ( not ( = ?auto_163778 ?auto_163780 ) ) ( not ( = ?auto_163779 ?auto_163780 ) ) ( not ( = ?auto_163778 ?auto_163786 ) ) ( not ( = ?auto_163779 ?auto_163786 ) ) ( not ( = ?auto_163780 ?auto_163786 ) ) ( ON-TABLE ?auto_163782 ) ( ON ?auto_163781 ?auto_163782 ) ( ON ?auto_163785 ?auto_163781 ) ( ON ?auto_163783 ?auto_163785 ) ( ON ?auto_163786 ?auto_163783 ) ( not ( = ?auto_163782 ?auto_163781 ) ) ( not ( = ?auto_163782 ?auto_163785 ) ) ( not ( = ?auto_163782 ?auto_163783 ) ) ( not ( = ?auto_163782 ?auto_163786 ) ) ( not ( = ?auto_163782 ?auto_163780 ) ) ( not ( = ?auto_163782 ?auto_163779 ) ) ( not ( = ?auto_163781 ?auto_163785 ) ) ( not ( = ?auto_163781 ?auto_163783 ) ) ( not ( = ?auto_163781 ?auto_163786 ) ) ( not ( = ?auto_163781 ?auto_163780 ) ) ( not ( = ?auto_163781 ?auto_163779 ) ) ( not ( = ?auto_163785 ?auto_163783 ) ) ( not ( = ?auto_163785 ?auto_163786 ) ) ( not ( = ?auto_163785 ?auto_163780 ) ) ( not ( = ?auto_163785 ?auto_163779 ) ) ( not ( = ?auto_163783 ?auto_163786 ) ) ( not ( = ?auto_163783 ?auto_163780 ) ) ( not ( = ?auto_163783 ?auto_163779 ) ) ( not ( = ?auto_163778 ?auto_163782 ) ) ( not ( = ?auto_163778 ?auto_163781 ) ) ( not ( = ?auto_163778 ?auto_163785 ) ) ( not ( = ?auto_163778 ?auto_163783 ) ) ( ON ?auto_163778 ?auto_163784 ) ( not ( = ?auto_163778 ?auto_163784 ) ) ( not ( = ?auto_163779 ?auto_163784 ) ) ( not ( = ?auto_163780 ?auto_163784 ) ) ( not ( = ?auto_163786 ?auto_163784 ) ) ( not ( = ?auto_163782 ?auto_163784 ) ) ( not ( = ?auto_163781 ?auto_163784 ) ) ( not ( = ?auto_163785 ?auto_163784 ) ) ( not ( = ?auto_163783 ?auto_163784 ) ) ( ON ?auto_163779 ?auto_163778 ) ( ON-TABLE ?auto_163784 ) ( CLEAR ?auto_163786 ) ( ON ?auto_163780 ?auto_163779 ) ( CLEAR ?auto_163780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163784 ?auto_163778 ?auto_163779 )
      ( MAKE-3PILE ?auto_163778 ?auto_163779 ?auto_163780 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163787 - BLOCK
      ?auto_163788 - BLOCK
      ?auto_163789 - BLOCK
    )
    :vars
    (
      ?auto_163793 - BLOCK
      ?auto_163790 - BLOCK
      ?auto_163795 - BLOCK
      ?auto_163794 - BLOCK
      ?auto_163791 - BLOCK
      ?auto_163792 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163787 ?auto_163788 ) ) ( not ( = ?auto_163787 ?auto_163789 ) ) ( not ( = ?auto_163788 ?auto_163789 ) ) ( not ( = ?auto_163787 ?auto_163793 ) ) ( not ( = ?auto_163788 ?auto_163793 ) ) ( not ( = ?auto_163789 ?auto_163793 ) ) ( ON-TABLE ?auto_163790 ) ( ON ?auto_163795 ?auto_163790 ) ( ON ?auto_163794 ?auto_163795 ) ( ON ?auto_163791 ?auto_163794 ) ( not ( = ?auto_163790 ?auto_163795 ) ) ( not ( = ?auto_163790 ?auto_163794 ) ) ( not ( = ?auto_163790 ?auto_163791 ) ) ( not ( = ?auto_163790 ?auto_163793 ) ) ( not ( = ?auto_163790 ?auto_163789 ) ) ( not ( = ?auto_163790 ?auto_163788 ) ) ( not ( = ?auto_163795 ?auto_163794 ) ) ( not ( = ?auto_163795 ?auto_163791 ) ) ( not ( = ?auto_163795 ?auto_163793 ) ) ( not ( = ?auto_163795 ?auto_163789 ) ) ( not ( = ?auto_163795 ?auto_163788 ) ) ( not ( = ?auto_163794 ?auto_163791 ) ) ( not ( = ?auto_163794 ?auto_163793 ) ) ( not ( = ?auto_163794 ?auto_163789 ) ) ( not ( = ?auto_163794 ?auto_163788 ) ) ( not ( = ?auto_163791 ?auto_163793 ) ) ( not ( = ?auto_163791 ?auto_163789 ) ) ( not ( = ?auto_163791 ?auto_163788 ) ) ( not ( = ?auto_163787 ?auto_163790 ) ) ( not ( = ?auto_163787 ?auto_163795 ) ) ( not ( = ?auto_163787 ?auto_163794 ) ) ( not ( = ?auto_163787 ?auto_163791 ) ) ( ON ?auto_163787 ?auto_163792 ) ( not ( = ?auto_163787 ?auto_163792 ) ) ( not ( = ?auto_163788 ?auto_163792 ) ) ( not ( = ?auto_163789 ?auto_163792 ) ) ( not ( = ?auto_163793 ?auto_163792 ) ) ( not ( = ?auto_163790 ?auto_163792 ) ) ( not ( = ?auto_163795 ?auto_163792 ) ) ( not ( = ?auto_163794 ?auto_163792 ) ) ( not ( = ?auto_163791 ?auto_163792 ) ) ( ON ?auto_163788 ?auto_163787 ) ( ON-TABLE ?auto_163792 ) ( ON ?auto_163789 ?auto_163788 ) ( CLEAR ?auto_163789 ) ( HOLDING ?auto_163793 ) ( CLEAR ?auto_163791 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163790 ?auto_163795 ?auto_163794 ?auto_163791 ?auto_163793 )
      ( MAKE-3PILE ?auto_163787 ?auto_163788 ?auto_163789 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163796 - BLOCK
      ?auto_163797 - BLOCK
      ?auto_163798 - BLOCK
    )
    :vars
    (
      ?auto_163802 - BLOCK
      ?auto_163803 - BLOCK
      ?auto_163804 - BLOCK
      ?auto_163800 - BLOCK
      ?auto_163799 - BLOCK
      ?auto_163801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163796 ?auto_163797 ) ) ( not ( = ?auto_163796 ?auto_163798 ) ) ( not ( = ?auto_163797 ?auto_163798 ) ) ( not ( = ?auto_163796 ?auto_163802 ) ) ( not ( = ?auto_163797 ?auto_163802 ) ) ( not ( = ?auto_163798 ?auto_163802 ) ) ( ON-TABLE ?auto_163803 ) ( ON ?auto_163804 ?auto_163803 ) ( ON ?auto_163800 ?auto_163804 ) ( ON ?auto_163799 ?auto_163800 ) ( not ( = ?auto_163803 ?auto_163804 ) ) ( not ( = ?auto_163803 ?auto_163800 ) ) ( not ( = ?auto_163803 ?auto_163799 ) ) ( not ( = ?auto_163803 ?auto_163802 ) ) ( not ( = ?auto_163803 ?auto_163798 ) ) ( not ( = ?auto_163803 ?auto_163797 ) ) ( not ( = ?auto_163804 ?auto_163800 ) ) ( not ( = ?auto_163804 ?auto_163799 ) ) ( not ( = ?auto_163804 ?auto_163802 ) ) ( not ( = ?auto_163804 ?auto_163798 ) ) ( not ( = ?auto_163804 ?auto_163797 ) ) ( not ( = ?auto_163800 ?auto_163799 ) ) ( not ( = ?auto_163800 ?auto_163802 ) ) ( not ( = ?auto_163800 ?auto_163798 ) ) ( not ( = ?auto_163800 ?auto_163797 ) ) ( not ( = ?auto_163799 ?auto_163802 ) ) ( not ( = ?auto_163799 ?auto_163798 ) ) ( not ( = ?auto_163799 ?auto_163797 ) ) ( not ( = ?auto_163796 ?auto_163803 ) ) ( not ( = ?auto_163796 ?auto_163804 ) ) ( not ( = ?auto_163796 ?auto_163800 ) ) ( not ( = ?auto_163796 ?auto_163799 ) ) ( ON ?auto_163796 ?auto_163801 ) ( not ( = ?auto_163796 ?auto_163801 ) ) ( not ( = ?auto_163797 ?auto_163801 ) ) ( not ( = ?auto_163798 ?auto_163801 ) ) ( not ( = ?auto_163802 ?auto_163801 ) ) ( not ( = ?auto_163803 ?auto_163801 ) ) ( not ( = ?auto_163804 ?auto_163801 ) ) ( not ( = ?auto_163800 ?auto_163801 ) ) ( not ( = ?auto_163799 ?auto_163801 ) ) ( ON ?auto_163797 ?auto_163796 ) ( ON-TABLE ?auto_163801 ) ( ON ?auto_163798 ?auto_163797 ) ( CLEAR ?auto_163799 ) ( ON ?auto_163802 ?auto_163798 ) ( CLEAR ?auto_163802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163801 ?auto_163796 ?auto_163797 ?auto_163798 )
      ( MAKE-3PILE ?auto_163796 ?auto_163797 ?auto_163798 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163805 - BLOCK
      ?auto_163806 - BLOCK
      ?auto_163807 - BLOCK
    )
    :vars
    (
      ?auto_163813 - BLOCK
      ?auto_163811 - BLOCK
      ?auto_163808 - BLOCK
      ?auto_163809 - BLOCK
      ?auto_163812 - BLOCK
      ?auto_163810 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163805 ?auto_163806 ) ) ( not ( = ?auto_163805 ?auto_163807 ) ) ( not ( = ?auto_163806 ?auto_163807 ) ) ( not ( = ?auto_163805 ?auto_163813 ) ) ( not ( = ?auto_163806 ?auto_163813 ) ) ( not ( = ?auto_163807 ?auto_163813 ) ) ( ON-TABLE ?auto_163811 ) ( ON ?auto_163808 ?auto_163811 ) ( ON ?auto_163809 ?auto_163808 ) ( not ( = ?auto_163811 ?auto_163808 ) ) ( not ( = ?auto_163811 ?auto_163809 ) ) ( not ( = ?auto_163811 ?auto_163812 ) ) ( not ( = ?auto_163811 ?auto_163813 ) ) ( not ( = ?auto_163811 ?auto_163807 ) ) ( not ( = ?auto_163811 ?auto_163806 ) ) ( not ( = ?auto_163808 ?auto_163809 ) ) ( not ( = ?auto_163808 ?auto_163812 ) ) ( not ( = ?auto_163808 ?auto_163813 ) ) ( not ( = ?auto_163808 ?auto_163807 ) ) ( not ( = ?auto_163808 ?auto_163806 ) ) ( not ( = ?auto_163809 ?auto_163812 ) ) ( not ( = ?auto_163809 ?auto_163813 ) ) ( not ( = ?auto_163809 ?auto_163807 ) ) ( not ( = ?auto_163809 ?auto_163806 ) ) ( not ( = ?auto_163812 ?auto_163813 ) ) ( not ( = ?auto_163812 ?auto_163807 ) ) ( not ( = ?auto_163812 ?auto_163806 ) ) ( not ( = ?auto_163805 ?auto_163811 ) ) ( not ( = ?auto_163805 ?auto_163808 ) ) ( not ( = ?auto_163805 ?auto_163809 ) ) ( not ( = ?auto_163805 ?auto_163812 ) ) ( ON ?auto_163805 ?auto_163810 ) ( not ( = ?auto_163805 ?auto_163810 ) ) ( not ( = ?auto_163806 ?auto_163810 ) ) ( not ( = ?auto_163807 ?auto_163810 ) ) ( not ( = ?auto_163813 ?auto_163810 ) ) ( not ( = ?auto_163811 ?auto_163810 ) ) ( not ( = ?auto_163808 ?auto_163810 ) ) ( not ( = ?auto_163809 ?auto_163810 ) ) ( not ( = ?auto_163812 ?auto_163810 ) ) ( ON ?auto_163806 ?auto_163805 ) ( ON-TABLE ?auto_163810 ) ( ON ?auto_163807 ?auto_163806 ) ( ON ?auto_163813 ?auto_163807 ) ( CLEAR ?auto_163813 ) ( HOLDING ?auto_163812 ) ( CLEAR ?auto_163809 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163811 ?auto_163808 ?auto_163809 ?auto_163812 )
      ( MAKE-3PILE ?auto_163805 ?auto_163806 ?auto_163807 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163814 - BLOCK
      ?auto_163815 - BLOCK
      ?auto_163816 - BLOCK
    )
    :vars
    (
      ?auto_163818 - BLOCK
      ?auto_163820 - BLOCK
      ?auto_163817 - BLOCK
      ?auto_163821 - BLOCK
      ?auto_163822 - BLOCK
      ?auto_163819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163814 ?auto_163815 ) ) ( not ( = ?auto_163814 ?auto_163816 ) ) ( not ( = ?auto_163815 ?auto_163816 ) ) ( not ( = ?auto_163814 ?auto_163818 ) ) ( not ( = ?auto_163815 ?auto_163818 ) ) ( not ( = ?auto_163816 ?auto_163818 ) ) ( ON-TABLE ?auto_163820 ) ( ON ?auto_163817 ?auto_163820 ) ( ON ?auto_163821 ?auto_163817 ) ( not ( = ?auto_163820 ?auto_163817 ) ) ( not ( = ?auto_163820 ?auto_163821 ) ) ( not ( = ?auto_163820 ?auto_163822 ) ) ( not ( = ?auto_163820 ?auto_163818 ) ) ( not ( = ?auto_163820 ?auto_163816 ) ) ( not ( = ?auto_163820 ?auto_163815 ) ) ( not ( = ?auto_163817 ?auto_163821 ) ) ( not ( = ?auto_163817 ?auto_163822 ) ) ( not ( = ?auto_163817 ?auto_163818 ) ) ( not ( = ?auto_163817 ?auto_163816 ) ) ( not ( = ?auto_163817 ?auto_163815 ) ) ( not ( = ?auto_163821 ?auto_163822 ) ) ( not ( = ?auto_163821 ?auto_163818 ) ) ( not ( = ?auto_163821 ?auto_163816 ) ) ( not ( = ?auto_163821 ?auto_163815 ) ) ( not ( = ?auto_163822 ?auto_163818 ) ) ( not ( = ?auto_163822 ?auto_163816 ) ) ( not ( = ?auto_163822 ?auto_163815 ) ) ( not ( = ?auto_163814 ?auto_163820 ) ) ( not ( = ?auto_163814 ?auto_163817 ) ) ( not ( = ?auto_163814 ?auto_163821 ) ) ( not ( = ?auto_163814 ?auto_163822 ) ) ( ON ?auto_163814 ?auto_163819 ) ( not ( = ?auto_163814 ?auto_163819 ) ) ( not ( = ?auto_163815 ?auto_163819 ) ) ( not ( = ?auto_163816 ?auto_163819 ) ) ( not ( = ?auto_163818 ?auto_163819 ) ) ( not ( = ?auto_163820 ?auto_163819 ) ) ( not ( = ?auto_163817 ?auto_163819 ) ) ( not ( = ?auto_163821 ?auto_163819 ) ) ( not ( = ?auto_163822 ?auto_163819 ) ) ( ON ?auto_163815 ?auto_163814 ) ( ON-TABLE ?auto_163819 ) ( ON ?auto_163816 ?auto_163815 ) ( ON ?auto_163818 ?auto_163816 ) ( CLEAR ?auto_163821 ) ( ON ?auto_163822 ?auto_163818 ) ( CLEAR ?auto_163822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163819 ?auto_163814 ?auto_163815 ?auto_163816 ?auto_163818 )
      ( MAKE-3PILE ?auto_163814 ?auto_163815 ?auto_163816 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163823 - BLOCK
      ?auto_163824 - BLOCK
      ?auto_163825 - BLOCK
    )
    :vars
    (
      ?auto_163828 - BLOCK
      ?auto_163827 - BLOCK
      ?auto_163826 - BLOCK
      ?auto_163830 - BLOCK
      ?auto_163829 - BLOCK
      ?auto_163831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163823 ?auto_163824 ) ) ( not ( = ?auto_163823 ?auto_163825 ) ) ( not ( = ?auto_163824 ?auto_163825 ) ) ( not ( = ?auto_163823 ?auto_163828 ) ) ( not ( = ?auto_163824 ?auto_163828 ) ) ( not ( = ?auto_163825 ?auto_163828 ) ) ( ON-TABLE ?auto_163827 ) ( ON ?auto_163826 ?auto_163827 ) ( not ( = ?auto_163827 ?auto_163826 ) ) ( not ( = ?auto_163827 ?auto_163830 ) ) ( not ( = ?auto_163827 ?auto_163829 ) ) ( not ( = ?auto_163827 ?auto_163828 ) ) ( not ( = ?auto_163827 ?auto_163825 ) ) ( not ( = ?auto_163827 ?auto_163824 ) ) ( not ( = ?auto_163826 ?auto_163830 ) ) ( not ( = ?auto_163826 ?auto_163829 ) ) ( not ( = ?auto_163826 ?auto_163828 ) ) ( not ( = ?auto_163826 ?auto_163825 ) ) ( not ( = ?auto_163826 ?auto_163824 ) ) ( not ( = ?auto_163830 ?auto_163829 ) ) ( not ( = ?auto_163830 ?auto_163828 ) ) ( not ( = ?auto_163830 ?auto_163825 ) ) ( not ( = ?auto_163830 ?auto_163824 ) ) ( not ( = ?auto_163829 ?auto_163828 ) ) ( not ( = ?auto_163829 ?auto_163825 ) ) ( not ( = ?auto_163829 ?auto_163824 ) ) ( not ( = ?auto_163823 ?auto_163827 ) ) ( not ( = ?auto_163823 ?auto_163826 ) ) ( not ( = ?auto_163823 ?auto_163830 ) ) ( not ( = ?auto_163823 ?auto_163829 ) ) ( ON ?auto_163823 ?auto_163831 ) ( not ( = ?auto_163823 ?auto_163831 ) ) ( not ( = ?auto_163824 ?auto_163831 ) ) ( not ( = ?auto_163825 ?auto_163831 ) ) ( not ( = ?auto_163828 ?auto_163831 ) ) ( not ( = ?auto_163827 ?auto_163831 ) ) ( not ( = ?auto_163826 ?auto_163831 ) ) ( not ( = ?auto_163830 ?auto_163831 ) ) ( not ( = ?auto_163829 ?auto_163831 ) ) ( ON ?auto_163824 ?auto_163823 ) ( ON-TABLE ?auto_163831 ) ( ON ?auto_163825 ?auto_163824 ) ( ON ?auto_163828 ?auto_163825 ) ( ON ?auto_163829 ?auto_163828 ) ( CLEAR ?auto_163829 ) ( HOLDING ?auto_163830 ) ( CLEAR ?auto_163826 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163827 ?auto_163826 ?auto_163830 )
      ( MAKE-3PILE ?auto_163823 ?auto_163824 ?auto_163825 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163832 - BLOCK
      ?auto_163833 - BLOCK
      ?auto_163834 - BLOCK
    )
    :vars
    (
      ?auto_163837 - BLOCK
      ?auto_163838 - BLOCK
      ?auto_163835 - BLOCK
      ?auto_163840 - BLOCK
      ?auto_163839 - BLOCK
      ?auto_163836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163832 ?auto_163833 ) ) ( not ( = ?auto_163832 ?auto_163834 ) ) ( not ( = ?auto_163833 ?auto_163834 ) ) ( not ( = ?auto_163832 ?auto_163837 ) ) ( not ( = ?auto_163833 ?auto_163837 ) ) ( not ( = ?auto_163834 ?auto_163837 ) ) ( ON-TABLE ?auto_163838 ) ( ON ?auto_163835 ?auto_163838 ) ( not ( = ?auto_163838 ?auto_163835 ) ) ( not ( = ?auto_163838 ?auto_163840 ) ) ( not ( = ?auto_163838 ?auto_163839 ) ) ( not ( = ?auto_163838 ?auto_163837 ) ) ( not ( = ?auto_163838 ?auto_163834 ) ) ( not ( = ?auto_163838 ?auto_163833 ) ) ( not ( = ?auto_163835 ?auto_163840 ) ) ( not ( = ?auto_163835 ?auto_163839 ) ) ( not ( = ?auto_163835 ?auto_163837 ) ) ( not ( = ?auto_163835 ?auto_163834 ) ) ( not ( = ?auto_163835 ?auto_163833 ) ) ( not ( = ?auto_163840 ?auto_163839 ) ) ( not ( = ?auto_163840 ?auto_163837 ) ) ( not ( = ?auto_163840 ?auto_163834 ) ) ( not ( = ?auto_163840 ?auto_163833 ) ) ( not ( = ?auto_163839 ?auto_163837 ) ) ( not ( = ?auto_163839 ?auto_163834 ) ) ( not ( = ?auto_163839 ?auto_163833 ) ) ( not ( = ?auto_163832 ?auto_163838 ) ) ( not ( = ?auto_163832 ?auto_163835 ) ) ( not ( = ?auto_163832 ?auto_163840 ) ) ( not ( = ?auto_163832 ?auto_163839 ) ) ( ON ?auto_163832 ?auto_163836 ) ( not ( = ?auto_163832 ?auto_163836 ) ) ( not ( = ?auto_163833 ?auto_163836 ) ) ( not ( = ?auto_163834 ?auto_163836 ) ) ( not ( = ?auto_163837 ?auto_163836 ) ) ( not ( = ?auto_163838 ?auto_163836 ) ) ( not ( = ?auto_163835 ?auto_163836 ) ) ( not ( = ?auto_163840 ?auto_163836 ) ) ( not ( = ?auto_163839 ?auto_163836 ) ) ( ON ?auto_163833 ?auto_163832 ) ( ON-TABLE ?auto_163836 ) ( ON ?auto_163834 ?auto_163833 ) ( ON ?auto_163837 ?auto_163834 ) ( ON ?auto_163839 ?auto_163837 ) ( CLEAR ?auto_163835 ) ( ON ?auto_163840 ?auto_163839 ) ( CLEAR ?auto_163840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163836 ?auto_163832 ?auto_163833 ?auto_163834 ?auto_163837 ?auto_163839 )
      ( MAKE-3PILE ?auto_163832 ?auto_163833 ?auto_163834 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163841 - BLOCK
      ?auto_163842 - BLOCK
      ?auto_163843 - BLOCK
    )
    :vars
    (
      ?auto_163844 - BLOCK
      ?auto_163845 - BLOCK
      ?auto_163849 - BLOCK
      ?auto_163847 - BLOCK
      ?auto_163846 - BLOCK
      ?auto_163848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163841 ?auto_163842 ) ) ( not ( = ?auto_163841 ?auto_163843 ) ) ( not ( = ?auto_163842 ?auto_163843 ) ) ( not ( = ?auto_163841 ?auto_163844 ) ) ( not ( = ?auto_163842 ?auto_163844 ) ) ( not ( = ?auto_163843 ?auto_163844 ) ) ( ON-TABLE ?auto_163845 ) ( not ( = ?auto_163845 ?auto_163849 ) ) ( not ( = ?auto_163845 ?auto_163847 ) ) ( not ( = ?auto_163845 ?auto_163846 ) ) ( not ( = ?auto_163845 ?auto_163844 ) ) ( not ( = ?auto_163845 ?auto_163843 ) ) ( not ( = ?auto_163845 ?auto_163842 ) ) ( not ( = ?auto_163849 ?auto_163847 ) ) ( not ( = ?auto_163849 ?auto_163846 ) ) ( not ( = ?auto_163849 ?auto_163844 ) ) ( not ( = ?auto_163849 ?auto_163843 ) ) ( not ( = ?auto_163849 ?auto_163842 ) ) ( not ( = ?auto_163847 ?auto_163846 ) ) ( not ( = ?auto_163847 ?auto_163844 ) ) ( not ( = ?auto_163847 ?auto_163843 ) ) ( not ( = ?auto_163847 ?auto_163842 ) ) ( not ( = ?auto_163846 ?auto_163844 ) ) ( not ( = ?auto_163846 ?auto_163843 ) ) ( not ( = ?auto_163846 ?auto_163842 ) ) ( not ( = ?auto_163841 ?auto_163845 ) ) ( not ( = ?auto_163841 ?auto_163849 ) ) ( not ( = ?auto_163841 ?auto_163847 ) ) ( not ( = ?auto_163841 ?auto_163846 ) ) ( ON ?auto_163841 ?auto_163848 ) ( not ( = ?auto_163841 ?auto_163848 ) ) ( not ( = ?auto_163842 ?auto_163848 ) ) ( not ( = ?auto_163843 ?auto_163848 ) ) ( not ( = ?auto_163844 ?auto_163848 ) ) ( not ( = ?auto_163845 ?auto_163848 ) ) ( not ( = ?auto_163849 ?auto_163848 ) ) ( not ( = ?auto_163847 ?auto_163848 ) ) ( not ( = ?auto_163846 ?auto_163848 ) ) ( ON ?auto_163842 ?auto_163841 ) ( ON-TABLE ?auto_163848 ) ( ON ?auto_163843 ?auto_163842 ) ( ON ?auto_163844 ?auto_163843 ) ( ON ?auto_163846 ?auto_163844 ) ( ON ?auto_163847 ?auto_163846 ) ( CLEAR ?auto_163847 ) ( HOLDING ?auto_163849 ) ( CLEAR ?auto_163845 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163845 ?auto_163849 )
      ( MAKE-3PILE ?auto_163841 ?auto_163842 ?auto_163843 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163850 - BLOCK
      ?auto_163851 - BLOCK
      ?auto_163852 - BLOCK
    )
    :vars
    (
      ?auto_163857 - BLOCK
      ?auto_163854 - BLOCK
      ?auto_163853 - BLOCK
      ?auto_163856 - BLOCK
      ?auto_163855 - BLOCK
      ?auto_163858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163850 ?auto_163851 ) ) ( not ( = ?auto_163850 ?auto_163852 ) ) ( not ( = ?auto_163851 ?auto_163852 ) ) ( not ( = ?auto_163850 ?auto_163857 ) ) ( not ( = ?auto_163851 ?auto_163857 ) ) ( not ( = ?auto_163852 ?auto_163857 ) ) ( ON-TABLE ?auto_163854 ) ( not ( = ?auto_163854 ?auto_163853 ) ) ( not ( = ?auto_163854 ?auto_163856 ) ) ( not ( = ?auto_163854 ?auto_163855 ) ) ( not ( = ?auto_163854 ?auto_163857 ) ) ( not ( = ?auto_163854 ?auto_163852 ) ) ( not ( = ?auto_163854 ?auto_163851 ) ) ( not ( = ?auto_163853 ?auto_163856 ) ) ( not ( = ?auto_163853 ?auto_163855 ) ) ( not ( = ?auto_163853 ?auto_163857 ) ) ( not ( = ?auto_163853 ?auto_163852 ) ) ( not ( = ?auto_163853 ?auto_163851 ) ) ( not ( = ?auto_163856 ?auto_163855 ) ) ( not ( = ?auto_163856 ?auto_163857 ) ) ( not ( = ?auto_163856 ?auto_163852 ) ) ( not ( = ?auto_163856 ?auto_163851 ) ) ( not ( = ?auto_163855 ?auto_163857 ) ) ( not ( = ?auto_163855 ?auto_163852 ) ) ( not ( = ?auto_163855 ?auto_163851 ) ) ( not ( = ?auto_163850 ?auto_163854 ) ) ( not ( = ?auto_163850 ?auto_163853 ) ) ( not ( = ?auto_163850 ?auto_163856 ) ) ( not ( = ?auto_163850 ?auto_163855 ) ) ( ON ?auto_163850 ?auto_163858 ) ( not ( = ?auto_163850 ?auto_163858 ) ) ( not ( = ?auto_163851 ?auto_163858 ) ) ( not ( = ?auto_163852 ?auto_163858 ) ) ( not ( = ?auto_163857 ?auto_163858 ) ) ( not ( = ?auto_163854 ?auto_163858 ) ) ( not ( = ?auto_163853 ?auto_163858 ) ) ( not ( = ?auto_163856 ?auto_163858 ) ) ( not ( = ?auto_163855 ?auto_163858 ) ) ( ON ?auto_163851 ?auto_163850 ) ( ON-TABLE ?auto_163858 ) ( ON ?auto_163852 ?auto_163851 ) ( ON ?auto_163857 ?auto_163852 ) ( ON ?auto_163855 ?auto_163857 ) ( ON ?auto_163856 ?auto_163855 ) ( CLEAR ?auto_163854 ) ( ON ?auto_163853 ?auto_163856 ) ( CLEAR ?auto_163853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163858 ?auto_163850 ?auto_163851 ?auto_163852 ?auto_163857 ?auto_163855 ?auto_163856 )
      ( MAKE-3PILE ?auto_163850 ?auto_163851 ?auto_163852 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163859 - BLOCK
      ?auto_163860 - BLOCK
      ?auto_163861 - BLOCK
    )
    :vars
    (
      ?auto_163863 - BLOCK
      ?auto_163865 - BLOCK
      ?auto_163866 - BLOCK
      ?auto_163867 - BLOCK
      ?auto_163862 - BLOCK
      ?auto_163864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163859 ?auto_163860 ) ) ( not ( = ?auto_163859 ?auto_163861 ) ) ( not ( = ?auto_163860 ?auto_163861 ) ) ( not ( = ?auto_163859 ?auto_163863 ) ) ( not ( = ?auto_163860 ?auto_163863 ) ) ( not ( = ?auto_163861 ?auto_163863 ) ) ( not ( = ?auto_163865 ?auto_163866 ) ) ( not ( = ?auto_163865 ?auto_163867 ) ) ( not ( = ?auto_163865 ?auto_163862 ) ) ( not ( = ?auto_163865 ?auto_163863 ) ) ( not ( = ?auto_163865 ?auto_163861 ) ) ( not ( = ?auto_163865 ?auto_163860 ) ) ( not ( = ?auto_163866 ?auto_163867 ) ) ( not ( = ?auto_163866 ?auto_163862 ) ) ( not ( = ?auto_163866 ?auto_163863 ) ) ( not ( = ?auto_163866 ?auto_163861 ) ) ( not ( = ?auto_163866 ?auto_163860 ) ) ( not ( = ?auto_163867 ?auto_163862 ) ) ( not ( = ?auto_163867 ?auto_163863 ) ) ( not ( = ?auto_163867 ?auto_163861 ) ) ( not ( = ?auto_163867 ?auto_163860 ) ) ( not ( = ?auto_163862 ?auto_163863 ) ) ( not ( = ?auto_163862 ?auto_163861 ) ) ( not ( = ?auto_163862 ?auto_163860 ) ) ( not ( = ?auto_163859 ?auto_163865 ) ) ( not ( = ?auto_163859 ?auto_163866 ) ) ( not ( = ?auto_163859 ?auto_163867 ) ) ( not ( = ?auto_163859 ?auto_163862 ) ) ( ON ?auto_163859 ?auto_163864 ) ( not ( = ?auto_163859 ?auto_163864 ) ) ( not ( = ?auto_163860 ?auto_163864 ) ) ( not ( = ?auto_163861 ?auto_163864 ) ) ( not ( = ?auto_163863 ?auto_163864 ) ) ( not ( = ?auto_163865 ?auto_163864 ) ) ( not ( = ?auto_163866 ?auto_163864 ) ) ( not ( = ?auto_163867 ?auto_163864 ) ) ( not ( = ?auto_163862 ?auto_163864 ) ) ( ON ?auto_163860 ?auto_163859 ) ( ON-TABLE ?auto_163864 ) ( ON ?auto_163861 ?auto_163860 ) ( ON ?auto_163863 ?auto_163861 ) ( ON ?auto_163862 ?auto_163863 ) ( ON ?auto_163867 ?auto_163862 ) ( ON ?auto_163866 ?auto_163867 ) ( CLEAR ?auto_163866 ) ( HOLDING ?auto_163865 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163865 )
      ( MAKE-3PILE ?auto_163859 ?auto_163860 ?auto_163861 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163868 - BLOCK
      ?auto_163869 - BLOCK
      ?auto_163870 - BLOCK
    )
    :vars
    (
      ?auto_163873 - BLOCK
      ?auto_163876 - BLOCK
      ?auto_163875 - BLOCK
      ?auto_163872 - BLOCK
      ?auto_163871 - BLOCK
      ?auto_163874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163868 ?auto_163869 ) ) ( not ( = ?auto_163868 ?auto_163870 ) ) ( not ( = ?auto_163869 ?auto_163870 ) ) ( not ( = ?auto_163868 ?auto_163873 ) ) ( not ( = ?auto_163869 ?auto_163873 ) ) ( not ( = ?auto_163870 ?auto_163873 ) ) ( not ( = ?auto_163876 ?auto_163875 ) ) ( not ( = ?auto_163876 ?auto_163872 ) ) ( not ( = ?auto_163876 ?auto_163871 ) ) ( not ( = ?auto_163876 ?auto_163873 ) ) ( not ( = ?auto_163876 ?auto_163870 ) ) ( not ( = ?auto_163876 ?auto_163869 ) ) ( not ( = ?auto_163875 ?auto_163872 ) ) ( not ( = ?auto_163875 ?auto_163871 ) ) ( not ( = ?auto_163875 ?auto_163873 ) ) ( not ( = ?auto_163875 ?auto_163870 ) ) ( not ( = ?auto_163875 ?auto_163869 ) ) ( not ( = ?auto_163872 ?auto_163871 ) ) ( not ( = ?auto_163872 ?auto_163873 ) ) ( not ( = ?auto_163872 ?auto_163870 ) ) ( not ( = ?auto_163872 ?auto_163869 ) ) ( not ( = ?auto_163871 ?auto_163873 ) ) ( not ( = ?auto_163871 ?auto_163870 ) ) ( not ( = ?auto_163871 ?auto_163869 ) ) ( not ( = ?auto_163868 ?auto_163876 ) ) ( not ( = ?auto_163868 ?auto_163875 ) ) ( not ( = ?auto_163868 ?auto_163872 ) ) ( not ( = ?auto_163868 ?auto_163871 ) ) ( ON ?auto_163868 ?auto_163874 ) ( not ( = ?auto_163868 ?auto_163874 ) ) ( not ( = ?auto_163869 ?auto_163874 ) ) ( not ( = ?auto_163870 ?auto_163874 ) ) ( not ( = ?auto_163873 ?auto_163874 ) ) ( not ( = ?auto_163876 ?auto_163874 ) ) ( not ( = ?auto_163875 ?auto_163874 ) ) ( not ( = ?auto_163872 ?auto_163874 ) ) ( not ( = ?auto_163871 ?auto_163874 ) ) ( ON ?auto_163869 ?auto_163868 ) ( ON-TABLE ?auto_163874 ) ( ON ?auto_163870 ?auto_163869 ) ( ON ?auto_163873 ?auto_163870 ) ( ON ?auto_163871 ?auto_163873 ) ( ON ?auto_163872 ?auto_163871 ) ( ON ?auto_163875 ?auto_163872 ) ( ON ?auto_163876 ?auto_163875 ) ( CLEAR ?auto_163876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163874 ?auto_163868 ?auto_163869 ?auto_163870 ?auto_163873 ?auto_163871 ?auto_163872 ?auto_163875 )
      ( MAKE-3PILE ?auto_163868 ?auto_163869 ?auto_163870 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_163900 - BLOCK
      ?auto_163901 - BLOCK
      ?auto_163902 - BLOCK
      ?auto_163903 - BLOCK
    )
    :vars
    (
      ?auto_163904 - BLOCK
      ?auto_163906 - BLOCK
      ?auto_163905 - BLOCK
      ?auto_163907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163904 ?auto_163903 ) ( ON-TABLE ?auto_163900 ) ( ON ?auto_163901 ?auto_163900 ) ( ON ?auto_163902 ?auto_163901 ) ( ON ?auto_163903 ?auto_163902 ) ( not ( = ?auto_163900 ?auto_163901 ) ) ( not ( = ?auto_163900 ?auto_163902 ) ) ( not ( = ?auto_163900 ?auto_163903 ) ) ( not ( = ?auto_163900 ?auto_163904 ) ) ( not ( = ?auto_163901 ?auto_163902 ) ) ( not ( = ?auto_163901 ?auto_163903 ) ) ( not ( = ?auto_163901 ?auto_163904 ) ) ( not ( = ?auto_163902 ?auto_163903 ) ) ( not ( = ?auto_163902 ?auto_163904 ) ) ( not ( = ?auto_163903 ?auto_163904 ) ) ( not ( = ?auto_163900 ?auto_163906 ) ) ( not ( = ?auto_163900 ?auto_163905 ) ) ( not ( = ?auto_163901 ?auto_163906 ) ) ( not ( = ?auto_163901 ?auto_163905 ) ) ( not ( = ?auto_163902 ?auto_163906 ) ) ( not ( = ?auto_163902 ?auto_163905 ) ) ( not ( = ?auto_163903 ?auto_163906 ) ) ( not ( = ?auto_163903 ?auto_163905 ) ) ( not ( = ?auto_163904 ?auto_163906 ) ) ( not ( = ?auto_163904 ?auto_163905 ) ) ( not ( = ?auto_163906 ?auto_163905 ) ) ( ON ?auto_163906 ?auto_163904 ) ( CLEAR ?auto_163906 ) ( HOLDING ?auto_163905 ) ( CLEAR ?auto_163907 ) ( ON-TABLE ?auto_163907 ) ( not ( = ?auto_163907 ?auto_163905 ) ) ( not ( = ?auto_163900 ?auto_163907 ) ) ( not ( = ?auto_163901 ?auto_163907 ) ) ( not ( = ?auto_163902 ?auto_163907 ) ) ( not ( = ?auto_163903 ?auto_163907 ) ) ( not ( = ?auto_163904 ?auto_163907 ) ) ( not ( = ?auto_163906 ?auto_163907 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163907 ?auto_163905 )
      ( MAKE-4PILE ?auto_163900 ?auto_163901 ?auto_163902 ?auto_163903 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_163908 - BLOCK
      ?auto_163909 - BLOCK
      ?auto_163910 - BLOCK
      ?auto_163911 - BLOCK
    )
    :vars
    (
      ?auto_163915 - BLOCK
      ?auto_163912 - BLOCK
      ?auto_163913 - BLOCK
      ?auto_163914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163915 ?auto_163911 ) ( ON-TABLE ?auto_163908 ) ( ON ?auto_163909 ?auto_163908 ) ( ON ?auto_163910 ?auto_163909 ) ( ON ?auto_163911 ?auto_163910 ) ( not ( = ?auto_163908 ?auto_163909 ) ) ( not ( = ?auto_163908 ?auto_163910 ) ) ( not ( = ?auto_163908 ?auto_163911 ) ) ( not ( = ?auto_163908 ?auto_163915 ) ) ( not ( = ?auto_163909 ?auto_163910 ) ) ( not ( = ?auto_163909 ?auto_163911 ) ) ( not ( = ?auto_163909 ?auto_163915 ) ) ( not ( = ?auto_163910 ?auto_163911 ) ) ( not ( = ?auto_163910 ?auto_163915 ) ) ( not ( = ?auto_163911 ?auto_163915 ) ) ( not ( = ?auto_163908 ?auto_163912 ) ) ( not ( = ?auto_163908 ?auto_163913 ) ) ( not ( = ?auto_163909 ?auto_163912 ) ) ( not ( = ?auto_163909 ?auto_163913 ) ) ( not ( = ?auto_163910 ?auto_163912 ) ) ( not ( = ?auto_163910 ?auto_163913 ) ) ( not ( = ?auto_163911 ?auto_163912 ) ) ( not ( = ?auto_163911 ?auto_163913 ) ) ( not ( = ?auto_163915 ?auto_163912 ) ) ( not ( = ?auto_163915 ?auto_163913 ) ) ( not ( = ?auto_163912 ?auto_163913 ) ) ( ON ?auto_163912 ?auto_163915 ) ( CLEAR ?auto_163914 ) ( ON-TABLE ?auto_163914 ) ( not ( = ?auto_163914 ?auto_163913 ) ) ( not ( = ?auto_163908 ?auto_163914 ) ) ( not ( = ?auto_163909 ?auto_163914 ) ) ( not ( = ?auto_163910 ?auto_163914 ) ) ( not ( = ?auto_163911 ?auto_163914 ) ) ( not ( = ?auto_163915 ?auto_163914 ) ) ( not ( = ?auto_163912 ?auto_163914 ) ) ( ON ?auto_163913 ?auto_163912 ) ( CLEAR ?auto_163913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163908 ?auto_163909 ?auto_163910 ?auto_163911 ?auto_163915 ?auto_163912 )
      ( MAKE-4PILE ?auto_163908 ?auto_163909 ?auto_163910 ?auto_163911 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_163916 - BLOCK
      ?auto_163917 - BLOCK
      ?auto_163918 - BLOCK
      ?auto_163919 - BLOCK
    )
    :vars
    (
      ?auto_163922 - BLOCK
      ?auto_163920 - BLOCK
      ?auto_163923 - BLOCK
      ?auto_163921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163922 ?auto_163919 ) ( ON-TABLE ?auto_163916 ) ( ON ?auto_163917 ?auto_163916 ) ( ON ?auto_163918 ?auto_163917 ) ( ON ?auto_163919 ?auto_163918 ) ( not ( = ?auto_163916 ?auto_163917 ) ) ( not ( = ?auto_163916 ?auto_163918 ) ) ( not ( = ?auto_163916 ?auto_163919 ) ) ( not ( = ?auto_163916 ?auto_163922 ) ) ( not ( = ?auto_163917 ?auto_163918 ) ) ( not ( = ?auto_163917 ?auto_163919 ) ) ( not ( = ?auto_163917 ?auto_163922 ) ) ( not ( = ?auto_163918 ?auto_163919 ) ) ( not ( = ?auto_163918 ?auto_163922 ) ) ( not ( = ?auto_163919 ?auto_163922 ) ) ( not ( = ?auto_163916 ?auto_163920 ) ) ( not ( = ?auto_163916 ?auto_163923 ) ) ( not ( = ?auto_163917 ?auto_163920 ) ) ( not ( = ?auto_163917 ?auto_163923 ) ) ( not ( = ?auto_163918 ?auto_163920 ) ) ( not ( = ?auto_163918 ?auto_163923 ) ) ( not ( = ?auto_163919 ?auto_163920 ) ) ( not ( = ?auto_163919 ?auto_163923 ) ) ( not ( = ?auto_163922 ?auto_163920 ) ) ( not ( = ?auto_163922 ?auto_163923 ) ) ( not ( = ?auto_163920 ?auto_163923 ) ) ( ON ?auto_163920 ?auto_163922 ) ( not ( = ?auto_163921 ?auto_163923 ) ) ( not ( = ?auto_163916 ?auto_163921 ) ) ( not ( = ?auto_163917 ?auto_163921 ) ) ( not ( = ?auto_163918 ?auto_163921 ) ) ( not ( = ?auto_163919 ?auto_163921 ) ) ( not ( = ?auto_163922 ?auto_163921 ) ) ( not ( = ?auto_163920 ?auto_163921 ) ) ( ON ?auto_163923 ?auto_163920 ) ( CLEAR ?auto_163923 ) ( HOLDING ?auto_163921 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163921 )
      ( MAKE-4PILE ?auto_163916 ?auto_163917 ?auto_163918 ?auto_163919 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_163936 - BLOCK
      ?auto_163937 - BLOCK
      ?auto_163938 - BLOCK
      ?auto_163939 - BLOCK
    )
    :vars
    (
      ?auto_163943 - BLOCK
      ?auto_163941 - BLOCK
      ?auto_163942 - BLOCK
      ?auto_163940 - BLOCK
      ?auto_163944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163943 ?auto_163939 ) ( ON-TABLE ?auto_163936 ) ( ON ?auto_163937 ?auto_163936 ) ( ON ?auto_163938 ?auto_163937 ) ( ON ?auto_163939 ?auto_163938 ) ( not ( = ?auto_163936 ?auto_163937 ) ) ( not ( = ?auto_163936 ?auto_163938 ) ) ( not ( = ?auto_163936 ?auto_163939 ) ) ( not ( = ?auto_163936 ?auto_163943 ) ) ( not ( = ?auto_163937 ?auto_163938 ) ) ( not ( = ?auto_163937 ?auto_163939 ) ) ( not ( = ?auto_163937 ?auto_163943 ) ) ( not ( = ?auto_163938 ?auto_163939 ) ) ( not ( = ?auto_163938 ?auto_163943 ) ) ( not ( = ?auto_163939 ?auto_163943 ) ) ( not ( = ?auto_163936 ?auto_163941 ) ) ( not ( = ?auto_163936 ?auto_163942 ) ) ( not ( = ?auto_163937 ?auto_163941 ) ) ( not ( = ?auto_163937 ?auto_163942 ) ) ( not ( = ?auto_163938 ?auto_163941 ) ) ( not ( = ?auto_163938 ?auto_163942 ) ) ( not ( = ?auto_163939 ?auto_163941 ) ) ( not ( = ?auto_163939 ?auto_163942 ) ) ( not ( = ?auto_163943 ?auto_163941 ) ) ( not ( = ?auto_163943 ?auto_163942 ) ) ( not ( = ?auto_163941 ?auto_163942 ) ) ( ON ?auto_163941 ?auto_163943 ) ( not ( = ?auto_163940 ?auto_163942 ) ) ( not ( = ?auto_163936 ?auto_163940 ) ) ( not ( = ?auto_163937 ?auto_163940 ) ) ( not ( = ?auto_163938 ?auto_163940 ) ) ( not ( = ?auto_163939 ?auto_163940 ) ) ( not ( = ?auto_163943 ?auto_163940 ) ) ( not ( = ?auto_163941 ?auto_163940 ) ) ( ON ?auto_163942 ?auto_163941 ) ( CLEAR ?auto_163942 ) ( ON ?auto_163940 ?auto_163944 ) ( CLEAR ?auto_163940 ) ( HAND-EMPTY ) ( not ( = ?auto_163936 ?auto_163944 ) ) ( not ( = ?auto_163937 ?auto_163944 ) ) ( not ( = ?auto_163938 ?auto_163944 ) ) ( not ( = ?auto_163939 ?auto_163944 ) ) ( not ( = ?auto_163943 ?auto_163944 ) ) ( not ( = ?auto_163941 ?auto_163944 ) ) ( not ( = ?auto_163942 ?auto_163944 ) ) ( not ( = ?auto_163940 ?auto_163944 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_163940 ?auto_163944 )
      ( MAKE-4PILE ?auto_163936 ?auto_163937 ?auto_163938 ?auto_163939 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_163945 - BLOCK
      ?auto_163946 - BLOCK
      ?auto_163947 - BLOCK
      ?auto_163948 - BLOCK
    )
    :vars
    (
      ?auto_163949 - BLOCK
      ?auto_163953 - BLOCK
      ?auto_163950 - BLOCK
      ?auto_163951 - BLOCK
      ?auto_163952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163949 ?auto_163948 ) ( ON-TABLE ?auto_163945 ) ( ON ?auto_163946 ?auto_163945 ) ( ON ?auto_163947 ?auto_163946 ) ( ON ?auto_163948 ?auto_163947 ) ( not ( = ?auto_163945 ?auto_163946 ) ) ( not ( = ?auto_163945 ?auto_163947 ) ) ( not ( = ?auto_163945 ?auto_163948 ) ) ( not ( = ?auto_163945 ?auto_163949 ) ) ( not ( = ?auto_163946 ?auto_163947 ) ) ( not ( = ?auto_163946 ?auto_163948 ) ) ( not ( = ?auto_163946 ?auto_163949 ) ) ( not ( = ?auto_163947 ?auto_163948 ) ) ( not ( = ?auto_163947 ?auto_163949 ) ) ( not ( = ?auto_163948 ?auto_163949 ) ) ( not ( = ?auto_163945 ?auto_163953 ) ) ( not ( = ?auto_163945 ?auto_163950 ) ) ( not ( = ?auto_163946 ?auto_163953 ) ) ( not ( = ?auto_163946 ?auto_163950 ) ) ( not ( = ?auto_163947 ?auto_163953 ) ) ( not ( = ?auto_163947 ?auto_163950 ) ) ( not ( = ?auto_163948 ?auto_163953 ) ) ( not ( = ?auto_163948 ?auto_163950 ) ) ( not ( = ?auto_163949 ?auto_163953 ) ) ( not ( = ?auto_163949 ?auto_163950 ) ) ( not ( = ?auto_163953 ?auto_163950 ) ) ( ON ?auto_163953 ?auto_163949 ) ( not ( = ?auto_163951 ?auto_163950 ) ) ( not ( = ?auto_163945 ?auto_163951 ) ) ( not ( = ?auto_163946 ?auto_163951 ) ) ( not ( = ?auto_163947 ?auto_163951 ) ) ( not ( = ?auto_163948 ?auto_163951 ) ) ( not ( = ?auto_163949 ?auto_163951 ) ) ( not ( = ?auto_163953 ?auto_163951 ) ) ( ON ?auto_163951 ?auto_163952 ) ( CLEAR ?auto_163951 ) ( not ( = ?auto_163945 ?auto_163952 ) ) ( not ( = ?auto_163946 ?auto_163952 ) ) ( not ( = ?auto_163947 ?auto_163952 ) ) ( not ( = ?auto_163948 ?auto_163952 ) ) ( not ( = ?auto_163949 ?auto_163952 ) ) ( not ( = ?auto_163953 ?auto_163952 ) ) ( not ( = ?auto_163950 ?auto_163952 ) ) ( not ( = ?auto_163951 ?auto_163952 ) ) ( HOLDING ?auto_163950 ) ( CLEAR ?auto_163953 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163945 ?auto_163946 ?auto_163947 ?auto_163948 ?auto_163949 ?auto_163953 ?auto_163950 )
      ( MAKE-4PILE ?auto_163945 ?auto_163946 ?auto_163947 ?auto_163948 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164027 - BLOCK
      ?auto_164028 - BLOCK
      ?auto_164029 - BLOCK
      ?auto_164030 - BLOCK
    )
    :vars
    (
      ?auto_164031 - BLOCK
      ?auto_164034 - BLOCK
      ?auto_164032 - BLOCK
      ?auto_164033 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164027 ) ( ON ?auto_164028 ?auto_164027 ) ( not ( = ?auto_164027 ?auto_164028 ) ) ( not ( = ?auto_164027 ?auto_164029 ) ) ( not ( = ?auto_164027 ?auto_164030 ) ) ( not ( = ?auto_164028 ?auto_164029 ) ) ( not ( = ?auto_164028 ?auto_164030 ) ) ( not ( = ?auto_164029 ?auto_164030 ) ) ( ON ?auto_164030 ?auto_164031 ) ( not ( = ?auto_164027 ?auto_164031 ) ) ( not ( = ?auto_164028 ?auto_164031 ) ) ( not ( = ?auto_164029 ?auto_164031 ) ) ( not ( = ?auto_164030 ?auto_164031 ) ) ( CLEAR ?auto_164028 ) ( ON ?auto_164029 ?auto_164030 ) ( CLEAR ?auto_164029 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164034 ) ( ON ?auto_164032 ?auto_164034 ) ( ON ?auto_164033 ?auto_164032 ) ( ON ?auto_164031 ?auto_164033 ) ( not ( = ?auto_164034 ?auto_164032 ) ) ( not ( = ?auto_164034 ?auto_164033 ) ) ( not ( = ?auto_164034 ?auto_164031 ) ) ( not ( = ?auto_164034 ?auto_164030 ) ) ( not ( = ?auto_164034 ?auto_164029 ) ) ( not ( = ?auto_164032 ?auto_164033 ) ) ( not ( = ?auto_164032 ?auto_164031 ) ) ( not ( = ?auto_164032 ?auto_164030 ) ) ( not ( = ?auto_164032 ?auto_164029 ) ) ( not ( = ?auto_164033 ?auto_164031 ) ) ( not ( = ?auto_164033 ?auto_164030 ) ) ( not ( = ?auto_164033 ?auto_164029 ) ) ( not ( = ?auto_164027 ?auto_164034 ) ) ( not ( = ?auto_164027 ?auto_164032 ) ) ( not ( = ?auto_164027 ?auto_164033 ) ) ( not ( = ?auto_164028 ?auto_164034 ) ) ( not ( = ?auto_164028 ?auto_164032 ) ) ( not ( = ?auto_164028 ?auto_164033 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164034 ?auto_164032 ?auto_164033 ?auto_164031 ?auto_164030 )
      ( MAKE-4PILE ?auto_164027 ?auto_164028 ?auto_164029 ?auto_164030 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164035 - BLOCK
      ?auto_164036 - BLOCK
      ?auto_164037 - BLOCK
      ?auto_164038 - BLOCK
    )
    :vars
    (
      ?auto_164041 - BLOCK
      ?auto_164042 - BLOCK
      ?auto_164039 - BLOCK
      ?auto_164040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164035 ) ( not ( = ?auto_164035 ?auto_164036 ) ) ( not ( = ?auto_164035 ?auto_164037 ) ) ( not ( = ?auto_164035 ?auto_164038 ) ) ( not ( = ?auto_164036 ?auto_164037 ) ) ( not ( = ?auto_164036 ?auto_164038 ) ) ( not ( = ?auto_164037 ?auto_164038 ) ) ( ON ?auto_164038 ?auto_164041 ) ( not ( = ?auto_164035 ?auto_164041 ) ) ( not ( = ?auto_164036 ?auto_164041 ) ) ( not ( = ?auto_164037 ?auto_164041 ) ) ( not ( = ?auto_164038 ?auto_164041 ) ) ( ON ?auto_164037 ?auto_164038 ) ( CLEAR ?auto_164037 ) ( ON-TABLE ?auto_164042 ) ( ON ?auto_164039 ?auto_164042 ) ( ON ?auto_164040 ?auto_164039 ) ( ON ?auto_164041 ?auto_164040 ) ( not ( = ?auto_164042 ?auto_164039 ) ) ( not ( = ?auto_164042 ?auto_164040 ) ) ( not ( = ?auto_164042 ?auto_164041 ) ) ( not ( = ?auto_164042 ?auto_164038 ) ) ( not ( = ?auto_164042 ?auto_164037 ) ) ( not ( = ?auto_164039 ?auto_164040 ) ) ( not ( = ?auto_164039 ?auto_164041 ) ) ( not ( = ?auto_164039 ?auto_164038 ) ) ( not ( = ?auto_164039 ?auto_164037 ) ) ( not ( = ?auto_164040 ?auto_164041 ) ) ( not ( = ?auto_164040 ?auto_164038 ) ) ( not ( = ?auto_164040 ?auto_164037 ) ) ( not ( = ?auto_164035 ?auto_164042 ) ) ( not ( = ?auto_164035 ?auto_164039 ) ) ( not ( = ?auto_164035 ?auto_164040 ) ) ( not ( = ?auto_164036 ?auto_164042 ) ) ( not ( = ?auto_164036 ?auto_164039 ) ) ( not ( = ?auto_164036 ?auto_164040 ) ) ( HOLDING ?auto_164036 ) ( CLEAR ?auto_164035 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164035 ?auto_164036 )
      ( MAKE-4PILE ?auto_164035 ?auto_164036 ?auto_164037 ?auto_164038 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164043 - BLOCK
      ?auto_164044 - BLOCK
      ?auto_164045 - BLOCK
      ?auto_164046 - BLOCK
    )
    :vars
    (
      ?auto_164050 - BLOCK
      ?auto_164049 - BLOCK
      ?auto_164047 - BLOCK
      ?auto_164048 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164043 ) ( not ( = ?auto_164043 ?auto_164044 ) ) ( not ( = ?auto_164043 ?auto_164045 ) ) ( not ( = ?auto_164043 ?auto_164046 ) ) ( not ( = ?auto_164044 ?auto_164045 ) ) ( not ( = ?auto_164044 ?auto_164046 ) ) ( not ( = ?auto_164045 ?auto_164046 ) ) ( ON ?auto_164046 ?auto_164050 ) ( not ( = ?auto_164043 ?auto_164050 ) ) ( not ( = ?auto_164044 ?auto_164050 ) ) ( not ( = ?auto_164045 ?auto_164050 ) ) ( not ( = ?auto_164046 ?auto_164050 ) ) ( ON ?auto_164045 ?auto_164046 ) ( ON-TABLE ?auto_164049 ) ( ON ?auto_164047 ?auto_164049 ) ( ON ?auto_164048 ?auto_164047 ) ( ON ?auto_164050 ?auto_164048 ) ( not ( = ?auto_164049 ?auto_164047 ) ) ( not ( = ?auto_164049 ?auto_164048 ) ) ( not ( = ?auto_164049 ?auto_164050 ) ) ( not ( = ?auto_164049 ?auto_164046 ) ) ( not ( = ?auto_164049 ?auto_164045 ) ) ( not ( = ?auto_164047 ?auto_164048 ) ) ( not ( = ?auto_164047 ?auto_164050 ) ) ( not ( = ?auto_164047 ?auto_164046 ) ) ( not ( = ?auto_164047 ?auto_164045 ) ) ( not ( = ?auto_164048 ?auto_164050 ) ) ( not ( = ?auto_164048 ?auto_164046 ) ) ( not ( = ?auto_164048 ?auto_164045 ) ) ( not ( = ?auto_164043 ?auto_164049 ) ) ( not ( = ?auto_164043 ?auto_164047 ) ) ( not ( = ?auto_164043 ?auto_164048 ) ) ( not ( = ?auto_164044 ?auto_164049 ) ) ( not ( = ?auto_164044 ?auto_164047 ) ) ( not ( = ?auto_164044 ?auto_164048 ) ) ( CLEAR ?auto_164043 ) ( ON ?auto_164044 ?auto_164045 ) ( CLEAR ?auto_164044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164049 ?auto_164047 ?auto_164048 ?auto_164050 ?auto_164046 ?auto_164045 )
      ( MAKE-4PILE ?auto_164043 ?auto_164044 ?auto_164045 ?auto_164046 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164051 - BLOCK
      ?auto_164052 - BLOCK
      ?auto_164053 - BLOCK
      ?auto_164054 - BLOCK
    )
    :vars
    (
      ?auto_164055 - BLOCK
      ?auto_164057 - BLOCK
      ?auto_164058 - BLOCK
      ?auto_164056 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164051 ?auto_164052 ) ) ( not ( = ?auto_164051 ?auto_164053 ) ) ( not ( = ?auto_164051 ?auto_164054 ) ) ( not ( = ?auto_164052 ?auto_164053 ) ) ( not ( = ?auto_164052 ?auto_164054 ) ) ( not ( = ?auto_164053 ?auto_164054 ) ) ( ON ?auto_164054 ?auto_164055 ) ( not ( = ?auto_164051 ?auto_164055 ) ) ( not ( = ?auto_164052 ?auto_164055 ) ) ( not ( = ?auto_164053 ?auto_164055 ) ) ( not ( = ?auto_164054 ?auto_164055 ) ) ( ON ?auto_164053 ?auto_164054 ) ( ON-TABLE ?auto_164057 ) ( ON ?auto_164058 ?auto_164057 ) ( ON ?auto_164056 ?auto_164058 ) ( ON ?auto_164055 ?auto_164056 ) ( not ( = ?auto_164057 ?auto_164058 ) ) ( not ( = ?auto_164057 ?auto_164056 ) ) ( not ( = ?auto_164057 ?auto_164055 ) ) ( not ( = ?auto_164057 ?auto_164054 ) ) ( not ( = ?auto_164057 ?auto_164053 ) ) ( not ( = ?auto_164058 ?auto_164056 ) ) ( not ( = ?auto_164058 ?auto_164055 ) ) ( not ( = ?auto_164058 ?auto_164054 ) ) ( not ( = ?auto_164058 ?auto_164053 ) ) ( not ( = ?auto_164056 ?auto_164055 ) ) ( not ( = ?auto_164056 ?auto_164054 ) ) ( not ( = ?auto_164056 ?auto_164053 ) ) ( not ( = ?auto_164051 ?auto_164057 ) ) ( not ( = ?auto_164051 ?auto_164058 ) ) ( not ( = ?auto_164051 ?auto_164056 ) ) ( not ( = ?auto_164052 ?auto_164057 ) ) ( not ( = ?auto_164052 ?auto_164058 ) ) ( not ( = ?auto_164052 ?auto_164056 ) ) ( ON ?auto_164052 ?auto_164053 ) ( CLEAR ?auto_164052 ) ( HOLDING ?auto_164051 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164051 )
      ( MAKE-4PILE ?auto_164051 ?auto_164052 ?auto_164053 ?auto_164054 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164059 - BLOCK
      ?auto_164060 - BLOCK
      ?auto_164061 - BLOCK
      ?auto_164062 - BLOCK
    )
    :vars
    (
      ?auto_164063 - BLOCK
      ?auto_164065 - BLOCK
      ?auto_164064 - BLOCK
      ?auto_164066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164059 ?auto_164060 ) ) ( not ( = ?auto_164059 ?auto_164061 ) ) ( not ( = ?auto_164059 ?auto_164062 ) ) ( not ( = ?auto_164060 ?auto_164061 ) ) ( not ( = ?auto_164060 ?auto_164062 ) ) ( not ( = ?auto_164061 ?auto_164062 ) ) ( ON ?auto_164062 ?auto_164063 ) ( not ( = ?auto_164059 ?auto_164063 ) ) ( not ( = ?auto_164060 ?auto_164063 ) ) ( not ( = ?auto_164061 ?auto_164063 ) ) ( not ( = ?auto_164062 ?auto_164063 ) ) ( ON ?auto_164061 ?auto_164062 ) ( ON-TABLE ?auto_164065 ) ( ON ?auto_164064 ?auto_164065 ) ( ON ?auto_164066 ?auto_164064 ) ( ON ?auto_164063 ?auto_164066 ) ( not ( = ?auto_164065 ?auto_164064 ) ) ( not ( = ?auto_164065 ?auto_164066 ) ) ( not ( = ?auto_164065 ?auto_164063 ) ) ( not ( = ?auto_164065 ?auto_164062 ) ) ( not ( = ?auto_164065 ?auto_164061 ) ) ( not ( = ?auto_164064 ?auto_164066 ) ) ( not ( = ?auto_164064 ?auto_164063 ) ) ( not ( = ?auto_164064 ?auto_164062 ) ) ( not ( = ?auto_164064 ?auto_164061 ) ) ( not ( = ?auto_164066 ?auto_164063 ) ) ( not ( = ?auto_164066 ?auto_164062 ) ) ( not ( = ?auto_164066 ?auto_164061 ) ) ( not ( = ?auto_164059 ?auto_164065 ) ) ( not ( = ?auto_164059 ?auto_164064 ) ) ( not ( = ?auto_164059 ?auto_164066 ) ) ( not ( = ?auto_164060 ?auto_164065 ) ) ( not ( = ?auto_164060 ?auto_164064 ) ) ( not ( = ?auto_164060 ?auto_164066 ) ) ( ON ?auto_164060 ?auto_164061 ) ( ON ?auto_164059 ?auto_164060 ) ( CLEAR ?auto_164059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164065 ?auto_164064 ?auto_164066 ?auto_164063 ?auto_164062 ?auto_164061 ?auto_164060 )
      ( MAKE-4PILE ?auto_164059 ?auto_164060 ?auto_164061 ?auto_164062 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164071 - BLOCK
      ?auto_164072 - BLOCK
      ?auto_164073 - BLOCK
      ?auto_164074 - BLOCK
    )
    :vars
    (
      ?auto_164078 - BLOCK
      ?auto_164077 - BLOCK
      ?auto_164076 - BLOCK
      ?auto_164075 - BLOCK
      ?auto_164079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164071 ?auto_164072 ) ) ( not ( = ?auto_164071 ?auto_164073 ) ) ( not ( = ?auto_164071 ?auto_164074 ) ) ( not ( = ?auto_164072 ?auto_164073 ) ) ( not ( = ?auto_164072 ?auto_164074 ) ) ( not ( = ?auto_164073 ?auto_164074 ) ) ( ON ?auto_164074 ?auto_164078 ) ( not ( = ?auto_164071 ?auto_164078 ) ) ( not ( = ?auto_164072 ?auto_164078 ) ) ( not ( = ?auto_164073 ?auto_164078 ) ) ( not ( = ?auto_164074 ?auto_164078 ) ) ( ON ?auto_164073 ?auto_164074 ) ( ON-TABLE ?auto_164077 ) ( ON ?auto_164076 ?auto_164077 ) ( ON ?auto_164075 ?auto_164076 ) ( ON ?auto_164078 ?auto_164075 ) ( not ( = ?auto_164077 ?auto_164076 ) ) ( not ( = ?auto_164077 ?auto_164075 ) ) ( not ( = ?auto_164077 ?auto_164078 ) ) ( not ( = ?auto_164077 ?auto_164074 ) ) ( not ( = ?auto_164077 ?auto_164073 ) ) ( not ( = ?auto_164076 ?auto_164075 ) ) ( not ( = ?auto_164076 ?auto_164078 ) ) ( not ( = ?auto_164076 ?auto_164074 ) ) ( not ( = ?auto_164076 ?auto_164073 ) ) ( not ( = ?auto_164075 ?auto_164078 ) ) ( not ( = ?auto_164075 ?auto_164074 ) ) ( not ( = ?auto_164075 ?auto_164073 ) ) ( not ( = ?auto_164071 ?auto_164077 ) ) ( not ( = ?auto_164071 ?auto_164076 ) ) ( not ( = ?auto_164071 ?auto_164075 ) ) ( not ( = ?auto_164072 ?auto_164077 ) ) ( not ( = ?auto_164072 ?auto_164076 ) ) ( not ( = ?auto_164072 ?auto_164075 ) ) ( ON ?auto_164072 ?auto_164073 ) ( CLEAR ?auto_164072 ) ( ON ?auto_164071 ?auto_164079 ) ( CLEAR ?auto_164071 ) ( HAND-EMPTY ) ( not ( = ?auto_164071 ?auto_164079 ) ) ( not ( = ?auto_164072 ?auto_164079 ) ) ( not ( = ?auto_164073 ?auto_164079 ) ) ( not ( = ?auto_164074 ?auto_164079 ) ) ( not ( = ?auto_164078 ?auto_164079 ) ) ( not ( = ?auto_164077 ?auto_164079 ) ) ( not ( = ?auto_164076 ?auto_164079 ) ) ( not ( = ?auto_164075 ?auto_164079 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164071 ?auto_164079 )
      ( MAKE-4PILE ?auto_164071 ?auto_164072 ?auto_164073 ?auto_164074 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164080 - BLOCK
      ?auto_164081 - BLOCK
      ?auto_164082 - BLOCK
      ?auto_164083 - BLOCK
    )
    :vars
    (
      ?auto_164088 - BLOCK
      ?auto_164087 - BLOCK
      ?auto_164084 - BLOCK
      ?auto_164085 - BLOCK
      ?auto_164086 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164080 ?auto_164081 ) ) ( not ( = ?auto_164080 ?auto_164082 ) ) ( not ( = ?auto_164080 ?auto_164083 ) ) ( not ( = ?auto_164081 ?auto_164082 ) ) ( not ( = ?auto_164081 ?auto_164083 ) ) ( not ( = ?auto_164082 ?auto_164083 ) ) ( ON ?auto_164083 ?auto_164088 ) ( not ( = ?auto_164080 ?auto_164088 ) ) ( not ( = ?auto_164081 ?auto_164088 ) ) ( not ( = ?auto_164082 ?auto_164088 ) ) ( not ( = ?auto_164083 ?auto_164088 ) ) ( ON ?auto_164082 ?auto_164083 ) ( ON-TABLE ?auto_164087 ) ( ON ?auto_164084 ?auto_164087 ) ( ON ?auto_164085 ?auto_164084 ) ( ON ?auto_164088 ?auto_164085 ) ( not ( = ?auto_164087 ?auto_164084 ) ) ( not ( = ?auto_164087 ?auto_164085 ) ) ( not ( = ?auto_164087 ?auto_164088 ) ) ( not ( = ?auto_164087 ?auto_164083 ) ) ( not ( = ?auto_164087 ?auto_164082 ) ) ( not ( = ?auto_164084 ?auto_164085 ) ) ( not ( = ?auto_164084 ?auto_164088 ) ) ( not ( = ?auto_164084 ?auto_164083 ) ) ( not ( = ?auto_164084 ?auto_164082 ) ) ( not ( = ?auto_164085 ?auto_164088 ) ) ( not ( = ?auto_164085 ?auto_164083 ) ) ( not ( = ?auto_164085 ?auto_164082 ) ) ( not ( = ?auto_164080 ?auto_164087 ) ) ( not ( = ?auto_164080 ?auto_164084 ) ) ( not ( = ?auto_164080 ?auto_164085 ) ) ( not ( = ?auto_164081 ?auto_164087 ) ) ( not ( = ?auto_164081 ?auto_164084 ) ) ( not ( = ?auto_164081 ?auto_164085 ) ) ( ON ?auto_164080 ?auto_164086 ) ( CLEAR ?auto_164080 ) ( not ( = ?auto_164080 ?auto_164086 ) ) ( not ( = ?auto_164081 ?auto_164086 ) ) ( not ( = ?auto_164082 ?auto_164086 ) ) ( not ( = ?auto_164083 ?auto_164086 ) ) ( not ( = ?auto_164088 ?auto_164086 ) ) ( not ( = ?auto_164087 ?auto_164086 ) ) ( not ( = ?auto_164084 ?auto_164086 ) ) ( not ( = ?auto_164085 ?auto_164086 ) ) ( HOLDING ?auto_164081 ) ( CLEAR ?auto_164082 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164087 ?auto_164084 ?auto_164085 ?auto_164088 ?auto_164083 ?auto_164082 ?auto_164081 )
      ( MAKE-4PILE ?auto_164080 ?auto_164081 ?auto_164082 ?auto_164083 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164089 - BLOCK
      ?auto_164090 - BLOCK
      ?auto_164091 - BLOCK
      ?auto_164092 - BLOCK
    )
    :vars
    (
      ?auto_164093 - BLOCK
      ?auto_164095 - BLOCK
      ?auto_164097 - BLOCK
      ?auto_164094 - BLOCK
      ?auto_164096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164089 ?auto_164090 ) ) ( not ( = ?auto_164089 ?auto_164091 ) ) ( not ( = ?auto_164089 ?auto_164092 ) ) ( not ( = ?auto_164090 ?auto_164091 ) ) ( not ( = ?auto_164090 ?auto_164092 ) ) ( not ( = ?auto_164091 ?auto_164092 ) ) ( ON ?auto_164092 ?auto_164093 ) ( not ( = ?auto_164089 ?auto_164093 ) ) ( not ( = ?auto_164090 ?auto_164093 ) ) ( not ( = ?auto_164091 ?auto_164093 ) ) ( not ( = ?auto_164092 ?auto_164093 ) ) ( ON ?auto_164091 ?auto_164092 ) ( ON-TABLE ?auto_164095 ) ( ON ?auto_164097 ?auto_164095 ) ( ON ?auto_164094 ?auto_164097 ) ( ON ?auto_164093 ?auto_164094 ) ( not ( = ?auto_164095 ?auto_164097 ) ) ( not ( = ?auto_164095 ?auto_164094 ) ) ( not ( = ?auto_164095 ?auto_164093 ) ) ( not ( = ?auto_164095 ?auto_164092 ) ) ( not ( = ?auto_164095 ?auto_164091 ) ) ( not ( = ?auto_164097 ?auto_164094 ) ) ( not ( = ?auto_164097 ?auto_164093 ) ) ( not ( = ?auto_164097 ?auto_164092 ) ) ( not ( = ?auto_164097 ?auto_164091 ) ) ( not ( = ?auto_164094 ?auto_164093 ) ) ( not ( = ?auto_164094 ?auto_164092 ) ) ( not ( = ?auto_164094 ?auto_164091 ) ) ( not ( = ?auto_164089 ?auto_164095 ) ) ( not ( = ?auto_164089 ?auto_164097 ) ) ( not ( = ?auto_164089 ?auto_164094 ) ) ( not ( = ?auto_164090 ?auto_164095 ) ) ( not ( = ?auto_164090 ?auto_164097 ) ) ( not ( = ?auto_164090 ?auto_164094 ) ) ( ON ?auto_164089 ?auto_164096 ) ( not ( = ?auto_164089 ?auto_164096 ) ) ( not ( = ?auto_164090 ?auto_164096 ) ) ( not ( = ?auto_164091 ?auto_164096 ) ) ( not ( = ?auto_164092 ?auto_164096 ) ) ( not ( = ?auto_164093 ?auto_164096 ) ) ( not ( = ?auto_164095 ?auto_164096 ) ) ( not ( = ?auto_164097 ?auto_164096 ) ) ( not ( = ?auto_164094 ?auto_164096 ) ) ( CLEAR ?auto_164091 ) ( ON ?auto_164090 ?auto_164089 ) ( CLEAR ?auto_164090 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164096 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164096 ?auto_164089 )
      ( MAKE-4PILE ?auto_164089 ?auto_164090 ?auto_164091 ?auto_164092 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164098 - BLOCK
      ?auto_164099 - BLOCK
      ?auto_164100 - BLOCK
      ?auto_164101 - BLOCK
    )
    :vars
    (
      ?auto_164102 - BLOCK
      ?auto_164104 - BLOCK
      ?auto_164103 - BLOCK
      ?auto_164106 - BLOCK
      ?auto_164105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164098 ?auto_164099 ) ) ( not ( = ?auto_164098 ?auto_164100 ) ) ( not ( = ?auto_164098 ?auto_164101 ) ) ( not ( = ?auto_164099 ?auto_164100 ) ) ( not ( = ?auto_164099 ?auto_164101 ) ) ( not ( = ?auto_164100 ?auto_164101 ) ) ( ON ?auto_164101 ?auto_164102 ) ( not ( = ?auto_164098 ?auto_164102 ) ) ( not ( = ?auto_164099 ?auto_164102 ) ) ( not ( = ?auto_164100 ?auto_164102 ) ) ( not ( = ?auto_164101 ?auto_164102 ) ) ( ON-TABLE ?auto_164104 ) ( ON ?auto_164103 ?auto_164104 ) ( ON ?auto_164106 ?auto_164103 ) ( ON ?auto_164102 ?auto_164106 ) ( not ( = ?auto_164104 ?auto_164103 ) ) ( not ( = ?auto_164104 ?auto_164106 ) ) ( not ( = ?auto_164104 ?auto_164102 ) ) ( not ( = ?auto_164104 ?auto_164101 ) ) ( not ( = ?auto_164104 ?auto_164100 ) ) ( not ( = ?auto_164103 ?auto_164106 ) ) ( not ( = ?auto_164103 ?auto_164102 ) ) ( not ( = ?auto_164103 ?auto_164101 ) ) ( not ( = ?auto_164103 ?auto_164100 ) ) ( not ( = ?auto_164106 ?auto_164102 ) ) ( not ( = ?auto_164106 ?auto_164101 ) ) ( not ( = ?auto_164106 ?auto_164100 ) ) ( not ( = ?auto_164098 ?auto_164104 ) ) ( not ( = ?auto_164098 ?auto_164103 ) ) ( not ( = ?auto_164098 ?auto_164106 ) ) ( not ( = ?auto_164099 ?auto_164104 ) ) ( not ( = ?auto_164099 ?auto_164103 ) ) ( not ( = ?auto_164099 ?auto_164106 ) ) ( ON ?auto_164098 ?auto_164105 ) ( not ( = ?auto_164098 ?auto_164105 ) ) ( not ( = ?auto_164099 ?auto_164105 ) ) ( not ( = ?auto_164100 ?auto_164105 ) ) ( not ( = ?auto_164101 ?auto_164105 ) ) ( not ( = ?auto_164102 ?auto_164105 ) ) ( not ( = ?auto_164104 ?auto_164105 ) ) ( not ( = ?auto_164103 ?auto_164105 ) ) ( not ( = ?auto_164106 ?auto_164105 ) ) ( ON ?auto_164099 ?auto_164098 ) ( CLEAR ?auto_164099 ) ( ON-TABLE ?auto_164105 ) ( HOLDING ?auto_164100 ) ( CLEAR ?auto_164101 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164104 ?auto_164103 ?auto_164106 ?auto_164102 ?auto_164101 ?auto_164100 )
      ( MAKE-4PILE ?auto_164098 ?auto_164099 ?auto_164100 ?auto_164101 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164107 - BLOCK
      ?auto_164108 - BLOCK
      ?auto_164109 - BLOCK
      ?auto_164110 - BLOCK
    )
    :vars
    (
      ?auto_164114 - BLOCK
      ?auto_164115 - BLOCK
      ?auto_164113 - BLOCK
      ?auto_164111 - BLOCK
      ?auto_164112 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164107 ?auto_164108 ) ) ( not ( = ?auto_164107 ?auto_164109 ) ) ( not ( = ?auto_164107 ?auto_164110 ) ) ( not ( = ?auto_164108 ?auto_164109 ) ) ( not ( = ?auto_164108 ?auto_164110 ) ) ( not ( = ?auto_164109 ?auto_164110 ) ) ( ON ?auto_164110 ?auto_164114 ) ( not ( = ?auto_164107 ?auto_164114 ) ) ( not ( = ?auto_164108 ?auto_164114 ) ) ( not ( = ?auto_164109 ?auto_164114 ) ) ( not ( = ?auto_164110 ?auto_164114 ) ) ( ON-TABLE ?auto_164115 ) ( ON ?auto_164113 ?auto_164115 ) ( ON ?auto_164111 ?auto_164113 ) ( ON ?auto_164114 ?auto_164111 ) ( not ( = ?auto_164115 ?auto_164113 ) ) ( not ( = ?auto_164115 ?auto_164111 ) ) ( not ( = ?auto_164115 ?auto_164114 ) ) ( not ( = ?auto_164115 ?auto_164110 ) ) ( not ( = ?auto_164115 ?auto_164109 ) ) ( not ( = ?auto_164113 ?auto_164111 ) ) ( not ( = ?auto_164113 ?auto_164114 ) ) ( not ( = ?auto_164113 ?auto_164110 ) ) ( not ( = ?auto_164113 ?auto_164109 ) ) ( not ( = ?auto_164111 ?auto_164114 ) ) ( not ( = ?auto_164111 ?auto_164110 ) ) ( not ( = ?auto_164111 ?auto_164109 ) ) ( not ( = ?auto_164107 ?auto_164115 ) ) ( not ( = ?auto_164107 ?auto_164113 ) ) ( not ( = ?auto_164107 ?auto_164111 ) ) ( not ( = ?auto_164108 ?auto_164115 ) ) ( not ( = ?auto_164108 ?auto_164113 ) ) ( not ( = ?auto_164108 ?auto_164111 ) ) ( ON ?auto_164107 ?auto_164112 ) ( not ( = ?auto_164107 ?auto_164112 ) ) ( not ( = ?auto_164108 ?auto_164112 ) ) ( not ( = ?auto_164109 ?auto_164112 ) ) ( not ( = ?auto_164110 ?auto_164112 ) ) ( not ( = ?auto_164114 ?auto_164112 ) ) ( not ( = ?auto_164115 ?auto_164112 ) ) ( not ( = ?auto_164113 ?auto_164112 ) ) ( not ( = ?auto_164111 ?auto_164112 ) ) ( ON ?auto_164108 ?auto_164107 ) ( ON-TABLE ?auto_164112 ) ( CLEAR ?auto_164110 ) ( ON ?auto_164109 ?auto_164108 ) ( CLEAR ?auto_164109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164112 ?auto_164107 ?auto_164108 )
      ( MAKE-4PILE ?auto_164107 ?auto_164108 ?auto_164109 ?auto_164110 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164116 - BLOCK
      ?auto_164117 - BLOCK
      ?auto_164118 - BLOCK
      ?auto_164119 - BLOCK
    )
    :vars
    (
      ?auto_164121 - BLOCK
      ?auto_164120 - BLOCK
      ?auto_164122 - BLOCK
      ?auto_164123 - BLOCK
      ?auto_164124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164116 ?auto_164117 ) ) ( not ( = ?auto_164116 ?auto_164118 ) ) ( not ( = ?auto_164116 ?auto_164119 ) ) ( not ( = ?auto_164117 ?auto_164118 ) ) ( not ( = ?auto_164117 ?auto_164119 ) ) ( not ( = ?auto_164118 ?auto_164119 ) ) ( not ( = ?auto_164116 ?auto_164121 ) ) ( not ( = ?auto_164117 ?auto_164121 ) ) ( not ( = ?auto_164118 ?auto_164121 ) ) ( not ( = ?auto_164119 ?auto_164121 ) ) ( ON-TABLE ?auto_164120 ) ( ON ?auto_164122 ?auto_164120 ) ( ON ?auto_164123 ?auto_164122 ) ( ON ?auto_164121 ?auto_164123 ) ( not ( = ?auto_164120 ?auto_164122 ) ) ( not ( = ?auto_164120 ?auto_164123 ) ) ( not ( = ?auto_164120 ?auto_164121 ) ) ( not ( = ?auto_164120 ?auto_164119 ) ) ( not ( = ?auto_164120 ?auto_164118 ) ) ( not ( = ?auto_164122 ?auto_164123 ) ) ( not ( = ?auto_164122 ?auto_164121 ) ) ( not ( = ?auto_164122 ?auto_164119 ) ) ( not ( = ?auto_164122 ?auto_164118 ) ) ( not ( = ?auto_164123 ?auto_164121 ) ) ( not ( = ?auto_164123 ?auto_164119 ) ) ( not ( = ?auto_164123 ?auto_164118 ) ) ( not ( = ?auto_164116 ?auto_164120 ) ) ( not ( = ?auto_164116 ?auto_164122 ) ) ( not ( = ?auto_164116 ?auto_164123 ) ) ( not ( = ?auto_164117 ?auto_164120 ) ) ( not ( = ?auto_164117 ?auto_164122 ) ) ( not ( = ?auto_164117 ?auto_164123 ) ) ( ON ?auto_164116 ?auto_164124 ) ( not ( = ?auto_164116 ?auto_164124 ) ) ( not ( = ?auto_164117 ?auto_164124 ) ) ( not ( = ?auto_164118 ?auto_164124 ) ) ( not ( = ?auto_164119 ?auto_164124 ) ) ( not ( = ?auto_164121 ?auto_164124 ) ) ( not ( = ?auto_164120 ?auto_164124 ) ) ( not ( = ?auto_164122 ?auto_164124 ) ) ( not ( = ?auto_164123 ?auto_164124 ) ) ( ON ?auto_164117 ?auto_164116 ) ( ON-TABLE ?auto_164124 ) ( ON ?auto_164118 ?auto_164117 ) ( CLEAR ?auto_164118 ) ( HOLDING ?auto_164119 ) ( CLEAR ?auto_164121 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164120 ?auto_164122 ?auto_164123 ?auto_164121 ?auto_164119 )
      ( MAKE-4PILE ?auto_164116 ?auto_164117 ?auto_164118 ?auto_164119 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164125 - BLOCK
      ?auto_164126 - BLOCK
      ?auto_164127 - BLOCK
      ?auto_164128 - BLOCK
    )
    :vars
    (
      ?auto_164132 - BLOCK
      ?auto_164131 - BLOCK
      ?auto_164130 - BLOCK
      ?auto_164133 - BLOCK
      ?auto_164129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164125 ?auto_164126 ) ) ( not ( = ?auto_164125 ?auto_164127 ) ) ( not ( = ?auto_164125 ?auto_164128 ) ) ( not ( = ?auto_164126 ?auto_164127 ) ) ( not ( = ?auto_164126 ?auto_164128 ) ) ( not ( = ?auto_164127 ?auto_164128 ) ) ( not ( = ?auto_164125 ?auto_164132 ) ) ( not ( = ?auto_164126 ?auto_164132 ) ) ( not ( = ?auto_164127 ?auto_164132 ) ) ( not ( = ?auto_164128 ?auto_164132 ) ) ( ON-TABLE ?auto_164131 ) ( ON ?auto_164130 ?auto_164131 ) ( ON ?auto_164133 ?auto_164130 ) ( ON ?auto_164132 ?auto_164133 ) ( not ( = ?auto_164131 ?auto_164130 ) ) ( not ( = ?auto_164131 ?auto_164133 ) ) ( not ( = ?auto_164131 ?auto_164132 ) ) ( not ( = ?auto_164131 ?auto_164128 ) ) ( not ( = ?auto_164131 ?auto_164127 ) ) ( not ( = ?auto_164130 ?auto_164133 ) ) ( not ( = ?auto_164130 ?auto_164132 ) ) ( not ( = ?auto_164130 ?auto_164128 ) ) ( not ( = ?auto_164130 ?auto_164127 ) ) ( not ( = ?auto_164133 ?auto_164132 ) ) ( not ( = ?auto_164133 ?auto_164128 ) ) ( not ( = ?auto_164133 ?auto_164127 ) ) ( not ( = ?auto_164125 ?auto_164131 ) ) ( not ( = ?auto_164125 ?auto_164130 ) ) ( not ( = ?auto_164125 ?auto_164133 ) ) ( not ( = ?auto_164126 ?auto_164131 ) ) ( not ( = ?auto_164126 ?auto_164130 ) ) ( not ( = ?auto_164126 ?auto_164133 ) ) ( ON ?auto_164125 ?auto_164129 ) ( not ( = ?auto_164125 ?auto_164129 ) ) ( not ( = ?auto_164126 ?auto_164129 ) ) ( not ( = ?auto_164127 ?auto_164129 ) ) ( not ( = ?auto_164128 ?auto_164129 ) ) ( not ( = ?auto_164132 ?auto_164129 ) ) ( not ( = ?auto_164131 ?auto_164129 ) ) ( not ( = ?auto_164130 ?auto_164129 ) ) ( not ( = ?auto_164133 ?auto_164129 ) ) ( ON ?auto_164126 ?auto_164125 ) ( ON-TABLE ?auto_164129 ) ( ON ?auto_164127 ?auto_164126 ) ( CLEAR ?auto_164132 ) ( ON ?auto_164128 ?auto_164127 ) ( CLEAR ?auto_164128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164129 ?auto_164125 ?auto_164126 ?auto_164127 )
      ( MAKE-4PILE ?auto_164125 ?auto_164126 ?auto_164127 ?auto_164128 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164134 - BLOCK
      ?auto_164135 - BLOCK
      ?auto_164136 - BLOCK
      ?auto_164137 - BLOCK
    )
    :vars
    (
      ?auto_164139 - BLOCK
      ?auto_164141 - BLOCK
      ?auto_164138 - BLOCK
      ?auto_164140 - BLOCK
      ?auto_164142 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164134 ?auto_164135 ) ) ( not ( = ?auto_164134 ?auto_164136 ) ) ( not ( = ?auto_164134 ?auto_164137 ) ) ( not ( = ?auto_164135 ?auto_164136 ) ) ( not ( = ?auto_164135 ?auto_164137 ) ) ( not ( = ?auto_164136 ?auto_164137 ) ) ( not ( = ?auto_164134 ?auto_164139 ) ) ( not ( = ?auto_164135 ?auto_164139 ) ) ( not ( = ?auto_164136 ?auto_164139 ) ) ( not ( = ?auto_164137 ?auto_164139 ) ) ( ON-TABLE ?auto_164141 ) ( ON ?auto_164138 ?auto_164141 ) ( ON ?auto_164140 ?auto_164138 ) ( not ( = ?auto_164141 ?auto_164138 ) ) ( not ( = ?auto_164141 ?auto_164140 ) ) ( not ( = ?auto_164141 ?auto_164139 ) ) ( not ( = ?auto_164141 ?auto_164137 ) ) ( not ( = ?auto_164141 ?auto_164136 ) ) ( not ( = ?auto_164138 ?auto_164140 ) ) ( not ( = ?auto_164138 ?auto_164139 ) ) ( not ( = ?auto_164138 ?auto_164137 ) ) ( not ( = ?auto_164138 ?auto_164136 ) ) ( not ( = ?auto_164140 ?auto_164139 ) ) ( not ( = ?auto_164140 ?auto_164137 ) ) ( not ( = ?auto_164140 ?auto_164136 ) ) ( not ( = ?auto_164134 ?auto_164141 ) ) ( not ( = ?auto_164134 ?auto_164138 ) ) ( not ( = ?auto_164134 ?auto_164140 ) ) ( not ( = ?auto_164135 ?auto_164141 ) ) ( not ( = ?auto_164135 ?auto_164138 ) ) ( not ( = ?auto_164135 ?auto_164140 ) ) ( ON ?auto_164134 ?auto_164142 ) ( not ( = ?auto_164134 ?auto_164142 ) ) ( not ( = ?auto_164135 ?auto_164142 ) ) ( not ( = ?auto_164136 ?auto_164142 ) ) ( not ( = ?auto_164137 ?auto_164142 ) ) ( not ( = ?auto_164139 ?auto_164142 ) ) ( not ( = ?auto_164141 ?auto_164142 ) ) ( not ( = ?auto_164138 ?auto_164142 ) ) ( not ( = ?auto_164140 ?auto_164142 ) ) ( ON ?auto_164135 ?auto_164134 ) ( ON-TABLE ?auto_164142 ) ( ON ?auto_164136 ?auto_164135 ) ( ON ?auto_164137 ?auto_164136 ) ( CLEAR ?auto_164137 ) ( HOLDING ?auto_164139 ) ( CLEAR ?auto_164140 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164141 ?auto_164138 ?auto_164140 ?auto_164139 )
      ( MAKE-4PILE ?auto_164134 ?auto_164135 ?auto_164136 ?auto_164137 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164143 - BLOCK
      ?auto_164144 - BLOCK
      ?auto_164145 - BLOCK
      ?auto_164146 - BLOCK
    )
    :vars
    (
      ?auto_164151 - BLOCK
      ?auto_164148 - BLOCK
      ?auto_164147 - BLOCK
      ?auto_164149 - BLOCK
      ?auto_164150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164143 ?auto_164144 ) ) ( not ( = ?auto_164143 ?auto_164145 ) ) ( not ( = ?auto_164143 ?auto_164146 ) ) ( not ( = ?auto_164144 ?auto_164145 ) ) ( not ( = ?auto_164144 ?auto_164146 ) ) ( not ( = ?auto_164145 ?auto_164146 ) ) ( not ( = ?auto_164143 ?auto_164151 ) ) ( not ( = ?auto_164144 ?auto_164151 ) ) ( not ( = ?auto_164145 ?auto_164151 ) ) ( not ( = ?auto_164146 ?auto_164151 ) ) ( ON-TABLE ?auto_164148 ) ( ON ?auto_164147 ?auto_164148 ) ( ON ?auto_164149 ?auto_164147 ) ( not ( = ?auto_164148 ?auto_164147 ) ) ( not ( = ?auto_164148 ?auto_164149 ) ) ( not ( = ?auto_164148 ?auto_164151 ) ) ( not ( = ?auto_164148 ?auto_164146 ) ) ( not ( = ?auto_164148 ?auto_164145 ) ) ( not ( = ?auto_164147 ?auto_164149 ) ) ( not ( = ?auto_164147 ?auto_164151 ) ) ( not ( = ?auto_164147 ?auto_164146 ) ) ( not ( = ?auto_164147 ?auto_164145 ) ) ( not ( = ?auto_164149 ?auto_164151 ) ) ( not ( = ?auto_164149 ?auto_164146 ) ) ( not ( = ?auto_164149 ?auto_164145 ) ) ( not ( = ?auto_164143 ?auto_164148 ) ) ( not ( = ?auto_164143 ?auto_164147 ) ) ( not ( = ?auto_164143 ?auto_164149 ) ) ( not ( = ?auto_164144 ?auto_164148 ) ) ( not ( = ?auto_164144 ?auto_164147 ) ) ( not ( = ?auto_164144 ?auto_164149 ) ) ( ON ?auto_164143 ?auto_164150 ) ( not ( = ?auto_164143 ?auto_164150 ) ) ( not ( = ?auto_164144 ?auto_164150 ) ) ( not ( = ?auto_164145 ?auto_164150 ) ) ( not ( = ?auto_164146 ?auto_164150 ) ) ( not ( = ?auto_164151 ?auto_164150 ) ) ( not ( = ?auto_164148 ?auto_164150 ) ) ( not ( = ?auto_164147 ?auto_164150 ) ) ( not ( = ?auto_164149 ?auto_164150 ) ) ( ON ?auto_164144 ?auto_164143 ) ( ON-TABLE ?auto_164150 ) ( ON ?auto_164145 ?auto_164144 ) ( ON ?auto_164146 ?auto_164145 ) ( CLEAR ?auto_164149 ) ( ON ?auto_164151 ?auto_164146 ) ( CLEAR ?auto_164151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164150 ?auto_164143 ?auto_164144 ?auto_164145 ?auto_164146 )
      ( MAKE-4PILE ?auto_164143 ?auto_164144 ?auto_164145 ?auto_164146 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164152 - BLOCK
      ?auto_164153 - BLOCK
      ?auto_164154 - BLOCK
      ?auto_164155 - BLOCK
    )
    :vars
    (
      ?auto_164157 - BLOCK
      ?auto_164158 - BLOCK
      ?auto_164156 - BLOCK
      ?auto_164160 - BLOCK
      ?auto_164159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164152 ?auto_164153 ) ) ( not ( = ?auto_164152 ?auto_164154 ) ) ( not ( = ?auto_164152 ?auto_164155 ) ) ( not ( = ?auto_164153 ?auto_164154 ) ) ( not ( = ?auto_164153 ?auto_164155 ) ) ( not ( = ?auto_164154 ?auto_164155 ) ) ( not ( = ?auto_164152 ?auto_164157 ) ) ( not ( = ?auto_164153 ?auto_164157 ) ) ( not ( = ?auto_164154 ?auto_164157 ) ) ( not ( = ?auto_164155 ?auto_164157 ) ) ( ON-TABLE ?auto_164158 ) ( ON ?auto_164156 ?auto_164158 ) ( not ( = ?auto_164158 ?auto_164156 ) ) ( not ( = ?auto_164158 ?auto_164160 ) ) ( not ( = ?auto_164158 ?auto_164157 ) ) ( not ( = ?auto_164158 ?auto_164155 ) ) ( not ( = ?auto_164158 ?auto_164154 ) ) ( not ( = ?auto_164156 ?auto_164160 ) ) ( not ( = ?auto_164156 ?auto_164157 ) ) ( not ( = ?auto_164156 ?auto_164155 ) ) ( not ( = ?auto_164156 ?auto_164154 ) ) ( not ( = ?auto_164160 ?auto_164157 ) ) ( not ( = ?auto_164160 ?auto_164155 ) ) ( not ( = ?auto_164160 ?auto_164154 ) ) ( not ( = ?auto_164152 ?auto_164158 ) ) ( not ( = ?auto_164152 ?auto_164156 ) ) ( not ( = ?auto_164152 ?auto_164160 ) ) ( not ( = ?auto_164153 ?auto_164158 ) ) ( not ( = ?auto_164153 ?auto_164156 ) ) ( not ( = ?auto_164153 ?auto_164160 ) ) ( ON ?auto_164152 ?auto_164159 ) ( not ( = ?auto_164152 ?auto_164159 ) ) ( not ( = ?auto_164153 ?auto_164159 ) ) ( not ( = ?auto_164154 ?auto_164159 ) ) ( not ( = ?auto_164155 ?auto_164159 ) ) ( not ( = ?auto_164157 ?auto_164159 ) ) ( not ( = ?auto_164158 ?auto_164159 ) ) ( not ( = ?auto_164156 ?auto_164159 ) ) ( not ( = ?auto_164160 ?auto_164159 ) ) ( ON ?auto_164153 ?auto_164152 ) ( ON-TABLE ?auto_164159 ) ( ON ?auto_164154 ?auto_164153 ) ( ON ?auto_164155 ?auto_164154 ) ( ON ?auto_164157 ?auto_164155 ) ( CLEAR ?auto_164157 ) ( HOLDING ?auto_164160 ) ( CLEAR ?auto_164156 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164158 ?auto_164156 ?auto_164160 )
      ( MAKE-4PILE ?auto_164152 ?auto_164153 ?auto_164154 ?auto_164155 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164161 - BLOCK
      ?auto_164162 - BLOCK
      ?auto_164163 - BLOCK
      ?auto_164164 - BLOCK
    )
    :vars
    (
      ?auto_164167 - BLOCK
      ?auto_164165 - BLOCK
      ?auto_164166 - BLOCK
      ?auto_164169 - BLOCK
      ?auto_164168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164161 ?auto_164162 ) ) ( not ( = ?auto_164161 ?auto_164163 ) ) ( not ( = ?auto_164161 ?auto_164164 ) ) ( not ( = ?auto_164162 ?auto_164163 ) ) ( not ( = ?auto_164162 ?auto_164164 ) ) ( not ( = ?auto_164163 ?auto_164164 ) ) ( not ( = ?auto_164161 ?auto_164167 ) ) ( not ( = ?auto_164162 ?auto_164167 ) ) ( not ( = ?auto_164163 ?auto_164167 ) ) ( not ( = ?auto_164164 ?auto_164167 ) ) ( ON-TABLE ?auto_164165 ) ( ON ?auto_164166 ?auto_164165 ) ( not ( = ?auto_164165 ?auto_164166 ) ) ( not ( = ?auto_164165 ?auto_164169 ) ) ( not ( = ?auto_164165 ?auto_164167 ) ) ( not ( = ?auto_164165 ?auto_164164 ) ) ( not ( = ?auto_164165 ?auto_164163 ) ) ( not ( = ?auto_164166 ?auto_164169 ) ) ( not ( = ?auto_164166 ?auto_164167 ) ) ( not ( = ?auto_164166 ?auto_164164 ) ) ( not ( = ?auto_164166 ?auto_164163 ) ) ( not ( = ?auto_164169 ?auto_164167 ) ) ( not ( = ?auto_164169 ?auto_164164 ) ) ( not ( = ?auto_164169 ?auto_164163 ) ) ( not ( = ?auto_164161 ?auto_164165 ) ) ( not ( = ?auto_164161 ?auto_164166 ) ) ( not ( = ?auto_164161 ?auto_164169 ) ) ( not ( = ?auto_164162 ?auto_164165 ) ) ( not ( = ?auto_164162 ?auto_164166 ) ) ( not ( = ?auto_164162 ?auto_164169 ) ) ( ON ?auto_164161 ?auto_164168 ) ( not ( = ?auto_164161 ?auto_164168 ) ) ( not ( = ?auto_164162 ?auto_164168 ) ) ( not ( = ?auto_164163 ?auto_164168 ) ) ( not ( = ?auto_164164 ?auto_164168 ) ) ( not ( = ?auto_164167 ?auto_164168 ) ) ( not ( = ?auto_164165 ?auto_164168 ) ) ( not ( = ?auto_164166 ?auto_164168 ) ) ( not ( = ?auto_164169 ?auto_164168 ) ) ( ON ?auto_164162 ?auto_164161 ) ( ON-TABLE ?auto_164168 ) ( ON ?auto_164163 ?auto_164162 ) ( ON ?auto_164164 ?auto_164163 ) ( ON ?auto_164167 ?auto_164164 ) ( CLEAR ?auto_164166 ) ( ON ?auto_164169 ?auto_164167 ) ( CLEAR ?auto_164169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164168 ?auto_164161 ?auto_164162 ?auto_164163 ?auto_164164 ?auto_164167 )
      ( MAKE-4PILE ?auto_164161 ?auto_164162 ?auto_164163 ?auto_164164 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164170 - BLOCK
      ?auto_164171 - BLOCK
      ?auto_164172 - BLOCK
      ?auto_164173 - BLOCK
    )
    :vars
    (
      ?auto_164175 - BLOCK
      ?auto_164176 - BLOCK
      ?auto_164177 - BLOCK
      ?auto_164174 - BLOCK
      ?auto_164178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164170 ?auto_164171 ) ) ( not ( = ?auto_164170 ?auto_164172 ) ) ( not ( = ?auto_164170 ?auto_164173 ) ) ( not ( = ?auto_164171 ?auto_164172 ) ) ( not ( = ?auto_164171 ?auto_164173 ) ) ( not ( = ?auto_164172 ?auto_164173 ) ) ( not ( = ?auto_164170 ?auto_164175 ) ) ( not ( = ?auto_164171 ?auto_164175 ) ) ( not ( = ?auto_164172 ?auto_164175 ) ) ( not ( = ?auto_164173 ?auto_164175 ) ) ( ON-TABLE ?auto_164176 ) ( not ( = ?auto_164176 ?auto_164177 ) ) ( not ( = ?auto_164176 ?auto_164174 ) ) ( not ( = ?auto_164176 ?auto_164175 ) ) ( not ( = ?auto_164176 ?auto_164173 ) ) ( not ( = ?auto_164176 ?auto_164172 ) ) ( not ( = ?auto_164177 ?auto_164174 ) ) ( not ( = ?auto_164177 ?auto_164175 ) ) ( not ( = ?auto_164177 ?auto_164173 ) ) ( not ( = ?auto_164177 ?auto_164172 ) ) ( not ( = ?auto_164174 ?auto_164175 ) ) ( not ( = ?auto_164174 ?auto_164173 ) ) ( not ( = ?auto_164174 ?auto_164172 ) ) ( not ( = ?auto_164170 ?auto_164176 ) ) ( not ( = ?auto_164170 ?auto_164177 ) ) ( not ( = ?auto_164170 ?auto_164174 ) ) ( not ( = ?auto_164171 ?auto_164176 ) ) ( not ( = ?auto_164171 ?auto_164177 ) ) ( not ( = ?auto_164171 ?auto_164174 ) ) ( ON ?auto_164170 ?auto_164178 ) ( not ( = ?auto_164170 ?auto_164178 ) ) ( not ( = ?auto_164171 ?auto_164178 ) ) ( not ( = ?auto_164172 ?auto_164178 ) ) ( not ( = ?auto_164173 ?auto_164178 ) ) ( not ( = ?auto_164175 ?auto_164178 ) ) ( not ( = ?auto_164176 ?auto_164178 ) ) ( not ( = ?auto_164177 ?auto_164178 ) ) ( not ( = ?auto_164174 ?auto_164178 ) ) ( ON ?auto_164171 ?auto_164170 ) ( ON-TABLE ?auto_164178 ) ( ON ?auto_164172 ?auto_164171 ) ( ON ?auto_164173 ?auto_164172 ) ( ON ?auto_164175 ?auto_164173 ) ( ON ?auto_164174 ?auto_164175 ) ( CLEAR ?auto_164174 ) ( HOLDING ?auto_164177 ) ( CLEAR ?auto_164176 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164176 ?auto_164177 )
      ( MAKE-4PILE ?auto_164170 ?auto_164171 ?auto_164172 ?auto_164173 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164179 - BLOCK
      ?auto_164180 - BLOCK
      ?auto_164181 - BLOCK
      ?auto_164182 - BLOCK
    )
    :vars
    (
      ?auto_164186 - BLOCK
      ?auto_164184 - BLOCK
      ?auto_164185 - BLOCK
      ?auto_164187 - BLOCK
      ?auto_164183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164179 ?auto_164180 ) ) ( not ( = ?auto_164179 ?auto_164181 ) ) ( not ( = ?auto_164179 ?auto_164182 ) ) ( not ( = ?auto_164180 ?auto_164181 ) ) ( not ( = ?auto_164180 ?auto_164182 ) ) ( not ( = ?auto_164181 ?auto_164182 ) ) ( not ( = ?auto_164179 ?auto_164186 ) ) ( not ( = ?auto_164180 ?auto_164186 ) ) ( not ( = ?auto_164181 ?auto_164186 ) ) ( not ( = ?auto_164182 ?auto_164186 ) ) ( ON-TABLE ?auto_164184 ) ( not ( = ?auto_164184 ?auto_164185 ) ) ( not ( = ?auto_164184 ?auto_164187 ) ) ( not ( = ?auto_164184 ?auto_164186 ) ) ( not ( = ?auto_164184 ?auto_164182 ) ) ( not ( = ?auto_164184 ?auto_164181 ) ) ( not ( = ?auto_164185 ?auto_164187 ) ) ( not ( = ?auto_164185 ?auto_164186 ) ) ( not ( = ?auto_164185 ?auto_164182 ) ) ( not ( = ?auto_164185 ?auto_164181 ) ) ( not ( = ?auto_164187 ?auto_164186 ) ) ( not ( = ?auto_164187 ?auto_164182 ) ) ( not ( = ?auto_164187 ?auto_164181 ) ) ( not ( = ?auto_164179 ?auto_164184 ) ) ( not ( = ?auto_164179 ?auto_164185 ) ) ( not ( = ?auto_164179 ?auto_164187 ) ) ( not ( = ?auto_164180 ?auto_164184 ) ) ( not ( = ?auto_164180 ?auto_164185 ) ) ( not ( = ?auto_164180 ?auto_164187 ) ) ( ON ?auto_164179 ?auto_164183 ) ( not ( = ?auto_164179 ?auto_164183 ) ) ( not ( = ?auto_164180 ?auto_164183 ) ) ( not ( = ?auto_164181 ?auto_164183 ) ) ( not ( = ?auto_164182 ?auto_164183 ) ) ( not ( = ?auto_164186 ?auto_164183 ) ) ( not ( = ?auto_164184 ?auto_164183 ) ) ( not ( = ?auto_164185 ?auto_164183 ) ) ( not ( = ?auto_164187 ?auto_164183 ) ) ( ON ?auto_164180 ?auto_164179 ) ( ON-TABLE ?auto_164183 ) ( ON ?auto_164181 ?auto_164180 ) ( ON ?auto_164182 ?auto_164181 ) ( ON ?auto_164186 ?auto_164182 ) ( ON ?auto_164187 ?auto_164186 ) ( CLEAR ?auto_164184 ) ( ON ?auto_164185 ?auto_164187 ) ( CLEAR ?auto_164185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164183 ?auto_164179 ?auto_164180 ?auto_164181 ?auto_164182 ?auto_164186 ?auto_164187 )
      ( MAKE-4PILE ?auto_164179 ?auto_164180 ?auto_164181 ?auto_164182 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164188 - BLOCK
      ?auto_164189 - BLOCK
      ?auto_164190 - BLOCK
      ?auto_164191 - BLOCK
    )
    :vars
    (
      ?auto_164195 - BLOCK
      ?auto_164192 - BLOCK
      ?auto_164194 - BLOCK
      ?auto_164196 - BLOCK
      ?auto_164193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164188 ?auto_164189 ) ) ( not ( = ?auto_164188 ?auto_164190 ) ) ( not ( = ?auto_164188 ?auto_164191 ) ) ( not ( = ?auto_164189 ?auto_164190 ) ) ( not ( = ?auto_164189 ?auto_164191 ) ) ( not ( = ?auto_164190 ?auto_164191 ) ) ( not ( = ?auto_164188 ?auto_164195 ) ) ( not ( = ?auto_164189 ?auto_164195 ) ) ( not ( = ?auto_164190 ?auto_164195 ) ) ( not ( = ?auto_164191 ?auto_164195 ) ) ( not ( = ?auto_164192 ?auto_164194 ) ) ( not ( = ?auto_164192 ?auto_164196 ) ) ( not ( = ?auto_164192 ?auto_164195 ) ) ( not ( = ?auto_164192 ?auto_164191 ) ) ( not ( = ?auto_164192 ?auto_164190 ) ) ( not ( = ?auto_164194 ?auto_164196 ) ) ( not ( = ?auto_164194 ?auto_164195 ) ) ( not ( = ?auto_164194 ?auto_164191 ) ) ( not ( = ?auto_164194 ?auto_164190 ) ) ( not ( = ?auto_164196 ?auto_164195 ) ) ( not ( = ?auto_164196 ?auto_164191 ) ) ( not ( = ?auto_164196 ?auto_164190 ) ) ( not ( = ?auto_164188 ?auto_164192 ) ) ( not ( = ?auto_164188 ?auto_164194 ) ) ( not ( = ?auto_164188 ?auto_164196 ) ) ( not ( = ?auto_164189 ?auto_164192 ) ) ( not ( = ?auto_164189 ?auto_164194 ) ) ( not ( = ?auto_164189 ?auto_164196 ) ) ( ON ?auto_164188 ?auto_164193 ) ( not ( = ?auto_164188 ?auto_164193 ) ) ( not ( = ?auto_164189 ?auto_164193 ) ) ( not ( = ?auto_164190 ?auto_164193 ) ) ( not ( = ?auto_164191 ?auto_164193 ) ) ( not ( = ?auto_164195 ?auto_164193 ) ) ( not ( = ?auto_164192 ?auto_164193 ) ) ( not ( = ?auto_164194 ?auto_164193 ) ) ( not ( = ?auto_164196 ?auto_164193 ) ) ( ON ?auto_164189 ?auto_164188 ) ( ON-TABLE ?auto_164193 ) ( ON ?auto_164190 ?auto_164189 ) ( ON ?auto_164191 ?auto_164190 ) ( ON ?auto_164195 ?auto_164191 ) ( ON ?auto_164196 ?auto_164195 ) ( ON ?auto_164194 ?auto_164196 ) ( CLEAR ?auto_164194 ) ( HOLDING ?auto_164192 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164192 )
      ( MAKE-4PILE ?auto_164188 ?auto_164189 ?auto_164190 ?auto_164191 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164197 - BLOCK
      ?auto_164198 - BLOCK
      ?auto_164199 - BLOCK
      ?auto_164200 - BLOCK
    )
    :vars
    (
      ?auto_164201 - BLOCK
      ?auto_164204 - BLOCK
      ?auto_164203 - BLOCK
      ?auto_164205 - BLOCK
      ?auto_164202 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164197 ?auto_164198 ) ) ( not ( = ?auto_164197 ?auto_164199 ) ) ( not ( = ?auto_164197 ?auto_164200 ) ) ( not ( = ?auto_164198 ?auto_164199 ) ) ( not ( = ?auto_164198 ?auto_164200 ) ) ( not ( = ?auto_164199 ?auto_164200 ) ) ( not ( = ?auto_164197 ?auto_164201 ) ) ( not ( = ?auto_164198 ?auto_164201 ) ) ( not ( = ?auto_164199 ?auto_164201 ) ) ( not ( = ?auto_164200 ?auto_164201 ) ) ( not ( = ?auto_164204 ?auto_164203 ) ) ( not ( = ?auto_164204 ?auto_164205 ) ) ( not ( = ?auto_164204 ?auto_164201 ) ) ( not ( = ?auto_164204 ?auto_164200 ) ) ( not ( = ?auto_164204 ?auto_164199 ) ) ( not ( = ?auto_164203 ?auto_164205 ) ) ( not ( = ?auto_164203 ?auto_164201 ) ) ( not ( = ?auto_164203 ?auto_164200 ) ) ( not ( = ?auto_164203 ?auto_164199 ) ) ( not ( = ?auto_164205 ?auto_164201 ) ) ( not ( = ?auto_164205 ?auto_164200 ) ) ( not ( = ?auto_164205 ?auto_164199 ) ) ( not ( = ?auto_164197 ?auto_164204 ) ) ( not ( = ?auto_164197 ?auto_164203 ) ) ( not ( = ?auto_164197 ?auto_164205 ) ) ( not ( = ?auto_164198 ?auto_164204 ) ) ( not ( = ?auto_164198 ?auto_164203 ) ) ( not ( = ?auto_164198 ?auto_164205 ) ) ( ON ?auto_164197 ?auto_164202 ) ( not ( = ?auto_164197 ?auto_164202 ) ) ( not ( = ?auto_164198 ?auto_164202 ) ) ( not ( = ?auto_164199 ?auto_164202 ) ) ( not ( = ?auto_164200 ?auto_164202 ) ) ( not ( = ?auto_164201 ?auto_164202 ) ) ( not ( = ?auto_164204 ?auto_164202 ) ) ( not ( = ?auto_164203 ?auto_164202 ) ) ( not ( = ?auto_164205 ?auto_164202 ) ) ( ON ?auto_164198 ?auto_164197 ) ( ON-TABLE ?auto_164202 ) ( ON ?auto_164199 ?auto_164198 ) ( ON ?auto_164200 ?auto_164199 ) ( ON ?auto_164201 ?auto_164200 ) ( ON ?auto_164205 ?auto_164201 ) ( ON ?auto_164203 ?auto_164205 ) ( ON ?auto_164204 ?auto_164203 ) ( CLEAR ?auto_164204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_164202 ?auto_164197 ?auto_164198 ?auto_164199 ?auto_164200 ?auto_164201 ?auto_164205 ?auto_164203 )
      ( MAKE-4PILE ?auto_164197 ?auto_164198 ?auto_164199 ?auto_164200 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164225 - BLOCK
      ?auto_164226 - BLOCK
      ?auto_164227 - BLOCK
    )
    :vars
    (
      ?auto_164228 - BLOCK
      ?auto_164230 - BLOCK
      ?auto_164229 - BLOCK
      ?auto_164232 - BLOCK
      ?auto_164231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164228 ?auto_164227 ) ( ON-TABLE ?auto_164225 ) ( ON ?auto_164226 ?auto_164225 ) ( ON ?auto_164227 ?auto_164226 ) ( not ( = ?auto_164225 ?auto_164226 ) ) ( not ( = ?auto_164225 ?auto_164227 ) ) ( not ( = ?auto_164225 ?auto_164228 ) ) ( not ( = ?auto_164226 ?auto_164227 ) ) ( not ( = ?auto_164226 ?auto_164228 ) ) ( not ( = ?auto_164227 ?auto_164228 ) ) ( not ( = ?auto_164225 ?auto_164230 ) ) ( not ( = ?auto_164225 ?auto_164229 ) ) ( not ( = ?auto_164226 ?auto_164230 ) ) ( not ( = ?auto_164226 ?auto_164229 ) ) ( not ( = ?auto_164227 ?auto_164230 ) ) ( not ( = ?auto_164227 ?auto_164229 ) ) ( not ( = ?auto_164228 ?auto_164230 ) ) ( not ( = ?auto_164228 ?auto_164229 ) ) ( not ( = ?auto_164230 ?auto_164229 ) ) ( ON ?auto_164230 ?auto_164228 ) ( CLEAR ?auto_164230 ) ( HOLDING ?auto_164229 ) ( CLEAR ?auto_164232 ) ( ON-TABLE ?auto_164231 ) ( ON ?auto_164232 ?auto_164231 ) ( not ( = ?auto_164231 ?auto_164232 ) ) ( not ( = ?auto_164231 ?auto_164229 ) ) ( not ( = ?auto_164232 ?auto_164229 ) ) ( not ( = ?auto_164225 ?auto_164232 ) ) ( not ( = ?auto_164225 ?auto_164231 ) ) ( not ( = ?auto_164226 ?auto_164232 ) ) ( not ( = ?auto_164226 ?auto_164231 ) ) ( not ( = ?auto_164227 ?auto_164232 ) ) ( not ( = ?auto_164227 ?auto_164231 ) ) ( not ( = ?auto_164228 ?auto_164232 ) ) ( not ( = ?auto_164228 ?auto_164231 ) ) ( not ( = ?auto_164230 ?auto_164232 ) ) ( not ( = ?auto_164230 ?auto_164231 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164231 ?auto_164232 ?auto_164229 )
      ( MAKE-3PILE ?auto_164225 ?auto_164226 ?auto_164227 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164233 - BLOCK
      ?auto_164234 - BLOCK
      ?auto_164235 - BLOCK
    )
    :vars
    (
      ?auto_164239 - BLOCK
      ?auto_164237 - BLOCK
      ?auto_164240 - BLOCK
      ?auto_164236 - BLOCK
      ?auto_164238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164239 ?auto_164235 ) ( ON-TABLE ?auto_164233 ) ( ON ?auto_164234 ?auto_164233 ) ( ON ?auto_164235 ?auto_164234 ) ( not ( = ?auto_164233 ?auto_164234 ) ) ( not ( = ?auto_164233 ?auto_164235 ) ) ( not ( = ?auto_164233 ?auto_164239 ) ) ( not ( = ?auto_164234 ?auto_164235 ) ) ( not ( = ?auto_164234 ?auto_164239 ) ) ( not ( = ?auto_164235 ?auto_164239 ) ) ( not ( = ?auto_164233 ?auto_164237 ) ) ( not ( = ?auto_164233 ?auto_164240 ) ) ( not ( = ?auto_164234 ?auto_164237 ) ) ( not ( = ?auto_164234 ?auto_164240 ) ) ( not ( = ?auto_164235 ?auto_164237 ) ) ( not ( = ?auto_164235 ?auto_164240 ) ) ( not ( = ?auto_164239 ?auto_164237 ) ) ( not ( = ?auto_164239 ?auto_164240 ) ) ( not ( = ?auto_164237 ?auto_164240 ) ) ( ON ?auto_164237 ?auto_164239 ) ( CLEAR ?auto_164236 ) ( ON-TABLE ?auto_164238 ) ( ON ?auto_164236 ?auto_164238 ) ( not ( = ?auto_164238 ?auto_164236 ) ) ( not ( = ?auto_164238 ?auto_164240 ) ) ( not ( = ?auto_164236 ?auto_164240 ) ) ( not ( = ?auto_164233 ?auto_164236 ) ) ( not ( = ?auto_164233 ?auto_164238 ) ) ( not ( = ?auto_164234 ?auto_164236 ) ) ( not ( = ?auto_164234 ?auto_164238 ) ) ( not ( = ?auto_164235 ?auto_164236 ) ) ( not ( = ?auto_164235 ?auto_164238 ) ) ( not ( = ?auto_164239 ?auto_164236 ) ) ( not ( = ?auto_164239 ?auto_164238 ) ) ( not ( = ?auto_164237 ?auto_164236 ) ) ( not ( = ?auto_164237 ?auto_164238 ) ) ( ON ?auto_164240 ?auto_164237 ) ( CLEAR ?auto_164240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164233 ?auto_164234 ?auto_164235 ?auto_164239 ?auto_164237 )
      ( MAKE-3PILE ?auto_164233 ?auto_164234 ?auto_164235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164241 - BLOCK
      ?auto_164242 - BLOCK
      ?auto_164243 - BLOCK
    )
    :vars
    (
      ?auto_164247 - BLOCK
      ?auto_164244 - BLOCK
      ?auto_164246 - BLOCK
      ?auto_164245 - BLOCK
      ?auto_164248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164247 ?auto_164243 ) ( ON-TABLE ?auto_164241 ) ( ON ?auto_164242 ?auto_164241 ) ( ON ?auto_164243 ?auto_164242 ) ( not ( = ?auto_164241 ?auto_164242 ) ) ( not ( = ?auto_164241 ?auto_164243 ) ) ( not ( = ?auto_164241 ?auto_164247 ) ) ( not ( = ?auto_164242 ?auto_164243 ) ) ( not ( = ?auto_164242 ?auto_164247 ) ) ( not ( = ?auto_164243 ?auto_164247 ) ) ( not ( = ?auto_164241 ?auto_164244 ) ) ( not ( = ?auto_164241 ?auto_164246 ) ) ( not ( = ?auto_164242 ?auto_164244 ) ) ( not ( = ?auto_164242 ?auto_164246 ) ) ( not ( = ?auto_164243 ?auto_164244 ) ) ( not ( = ?auto_164243 ?auto_164246 ) ) ( not ( = ?auto_164247 ?auto_164244 ) ) ( not ( = ?auto_164247 ?auto_164246 ) ) ( not ( = ?auto_164244 ?auto_164246 ) ) ( ON ?auto_164244 ?auto_164247 ) ( ON-TABLE ?auto_164245 ) ( not ( = ?auto_164245 ?auto_164248 ) ) ( not ( = ?auto_164245 ?auto_164246 ) ) ( not ( = ?auto_164248 ?auto_164246 ) ) ( not ( = ?auto_164241 ?auto_164248 ) ) ( not ( = ?auto_164241 ?auto_164245 ) ) ( not ( = ?auto_164242 ?auto_164248 ) ) ( not ( = ?auto_164242 ?auto_164245 ) ) ( not ( = ?auto_164243 ?auto_164248 ) ) ( not ( = ?auto_164243 ?auto_164245 ) ) ( not ( = ?auto_164247 ?auto_164248 ) ) ( not ( = ?auto_164247 ?auto_164245 ) ) ( not ( = ?auto_164244 ?auto_164248 ) ) ( not ( = ?auto_164244 ?auto_164245 ) ) ( ON ?auto_164246 ?auto_164244 ) ( CLEAR ?auto_164246 ) ( HOLDING ?auto_164248 ) ( CLEAR ?auto_164245 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164245 ?auto_164248 )
      ( MAKE-3PILE ?auto_164241 ?auto_164242 ?auto_164243 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164249 - BLOCK
      ?auto_164250 - BLOCK
      ?auto_164251 - BLOCK
    )
    :vars
    (
      ?auto_164256 - BLOCK
      ?auto_164252 - BLOCK
      ?auto_164254 - BLOCK
      ?auto_164255 - BLOCK
      ?auto_164253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164256 ?auto_164251 ) ( ON-TABLE ?auto_164249 ) ( ON ?auto_164250 ?auto_164249 ) ( ON ?auto_164251 ?auto_164250 ) ( not ( = ?auto_164249 ?auto_164250 ) ) ( not ( = ?auto_164249 ?auto_164251 ) ) ( not ( = ?auto_164249 ?auto_164256 ) ) ( not ( = ?auto_164250 ?auto_164251 ) ) ( not ( = ?auto_164250 ?auto_164256 ) ) ( not ( = ?auto_164251 ?auto_164256 ) ) ( not ( = ?auto_164249 ?auto_164252 ) ) ( not ( = ?auto_164249 ?auto_164254 ) ) ( not ( = ?auto_164250 ?auto_164252 ) ) ( not ( = ?auto_164250 ?auto_164254 ) ) ( not ( = ?auto_164251 ?auto_164252 ) ) ( not ( = ?auto_164251 ?auto_164254 ) ) ( not ( = ?auto_164256 ?auto_164252 ) ) ( not ( = ?auto_164256 ?auto_164254 ) ) ( not ( = ?auto_164252 ?auto_164254 ) ) ( ON ?auto_164252 ?auto_164256 ) ( ON-TABLE ?auto_164255 ) ( not ( = ?auto_164255 ?auto_164253 ) ) ( not ( = ?auto_164255 ?auto_164254 ) ) ( not ( = ?auto_164253 ?auto_164254 ) ) ( not ( = ?auto_164249 ?auto_164253 ) ) ( not ( = ?auto_164249 ?auto_164255 ) ) ( not ( = ?auto_164250 ?auto_164253 ) ) ( not ( = ?auto_164250 ?auto_164255 ) ) ( not ( = ?auto_164251 ?auto_164253 ) ) ( not ( = ?auto_164251 ?auto_164255 ) ) ( not ( = ?auto_164256 ?auto_164253 ) ) ( not ( = ?auto_164256 ?auto_164255 ) ) ( not ( = ?auto_164252 ?auto_164253 ) ) ( not ( = ?auto_164252 ?auto_164255 ) ) ( ON ?auto_164254 ?auto_164252 ) ( CLEAR ?auto_164255 ) ( ON ?auto_164253 ?auto_164254 ) ( CLEAR ?auto_164253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164249 ?auto_164250 ?auto_164251 ?auto_164256 ?auto_164252 ?auto_164254 )
      ( MAKE-3PILE ?auto_164249 ?auto_164250 ?auto_164251 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164257 - BLOCK
      ?auto_164258 - BLOCK
      ?auto_164259 - BLOCK
    )
    :vars
    (
      ?auto_164260 - BLOCK
      ?auto_164262 - BLOCK
      ?auto_164263 - BLOCK
      ?auto_164264 - BLOCK
      ?auto_164261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164260 ?auto_164259 ) ( ON-TABLE ?auto_164257 ) ( ON ?auto_164258 ?auto_164257 ) ( ON ?auto_164259 ?auto_164258 ) ( not ( = ?auto_164257 ?auto_164258 ) ) ( not ( = ?auto_164257 ?auto_164259 ) ) ( not ( = ?auto_164257 ?auto_164260 ) ) ( not ( = ?auto_164258 ?auto_164259 ) ) ( not ( = ?auto_164258 ?auto_164260 ) ) ( not ( = ?auto_164259 ?auto_164260 ) ) ( not ( = ?auto_164257 ?auto_164262 ) ) ( not ( = ?auto_164257 ?auto_164263 ) ) ( not ( = ?auto_164258 ?auto_164262 ) ) ( not ( = ?auto_164258 ?auto_164263 ) ) ( not ( = ?auto_164259 ?auto_164262 ) ) ( not ( = ?auto_164259 ?auto_164263 ) ) ( not ( = ?auto_164260 ?auto_164262 ) ) ( not ( = ?auto_164260 ?auto_164263 ) ) ( not ( = ?auto_164262 ?auto_164263 ) ) ( ON ?auto_164262 ?auto_164260 ) ( not ( = ?auto_164264 ?auto_164261 ) ) ( not ( = ?auto_164264 ?auto_164263 ) ) ( not ( = ?auto_164261 ?auto_164263 ) ) ( not ( = ?auto_164257 ?auto_164261 ) ) ( not ( = ?auto_164257 ?auto_164264 ) ) ( not ( = ?auto_164258 ?auto_164261 ) ) ( not ( = ?auto_164258 ?auto_164264 ) ) ( not ( = ?auto_164259 ?auto_164261 ) ) ( not ( = ?auto_164259 ?auto_164264 ) ) ( not ( = ?auto_164260 ?auto_164261 ) ) ( not ( = ?auto_164260 ?auto_164264 ) ) ( not ( = ?auto_164262 ?auto_164261 ) ) ( not ( = ?auto_164262 ?auto_164264 ) ) ( ON ?auto_164263 ?auto_164262 ) ( ON ?auto_164261 ?auto_164263 ) ( CLEAR ?auto_164261 ) ( HOLDING ?auto_164264 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164264 )
      ( MAKE-3PILE ?auto_164257 ?auto_164258 ?auto_164259 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164276 - BLOCK
      ?auto_164277 - BLOCK
      ?auto_164278 - BLOCK
    )
    :vars
    (
      ?auto_164280 - BLOCK
      ?auto_164283 - BLOCK
      ?auto_164281 - BLOCK
      ?auto_164282 - BLOCK
      ?auto_164279 - BLOCK
      ?auto_164284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164280 ?auto_164278 ) ( ON-TABLE ?auto_164276 ) ( ON ?auto_164277 ?auto_164276 ) ( ON ?auto_164278 ?auto_164277 ) ( not ( = ?auto_164276 ?auto_164277 ) ) ( not ( = ?auto_164276 ?auto_164278 ) ) ( not ( = ?auto_164276 ?auto_164280 ) ) ( not ( = ?auto_164277 ?auto_164278 ) ) ( not ( = ?auto_164277 ?auto_164280 ) ) ( not ( = ?auto_164278 ?auto_164280 ) ) ( not ( = ?auto_164276 ?auto_164283 ) ) ( not ( = ?auto_164276 ?auto_164281 ) ) ( not ( = ?auto_164277 ?auto_164283 ) ) ( not ( = ?auto_164277 ?auto_164281 ) ) ( not ( = ?auto_164278 ?auto_164283 ) ) ( not ( = ?auto_164278 ?auto_164281 ) ) ( not ( = ?auto_164280 ?auto_164283 ) ) ( not ( = ?auto_164280 ?auto_164281 ) ) ( not ( = ?auto_164283 ?auto_164281 ) ) ( ON ?auto_164283 ?auto_164280 ) ( not ( = ?auto_164282 ?auto_164279 ) ) ( not ( = ?auto_164282 ?auto_164281 ) ) ( not ( = ?auto_164279 ?auto_164281 ) ) ( not ( = ?auto_164276 ?auto_164279 ) ) ( not ( = ?auto_164276 ?auto_164282 ) ) ( not ( = ?auto_164277 ?auto_164279 ) ) ( not ( = ?auto_164277 ?auto_164282 ) ) ( not ( = ?auto_164278 ?auto_164279 ) ) ( not ( = ?auto_164278 ?auto_164282 ) ) ( not ( = ?auto_164280 ?auto_164279 ) ) ( not ( = ?auto_164280 ?auto_164282 ) ) ( not ( = ?auto_164283 ?auto_164279 ) ) ( not ( = ?auto_164283 ?auto_164282 ) ) ( ON ?auto_164281 ?auto_164283 ) ( ON ?auto_164279 ?auto_164281 ) ( CLEAR ?auto_164279 ) ( ON ?auto_164282 ?auto_164284 ) ( CLEAR ?auto_164282 ) ( HAND-EMPTY ) ( not ( = ?auto_164276 ?auto_164284 ) ) ( not ( = ?auto_164277 ?auto_164284 ) ) ( not ( = ?auto_164278 ?auto_164284 ) ) ( not ( = ?auto_164280 ?auto_164284 ) ) ( not ( = ?auto_164283 ?auto_164284 ) ) ( not ( = ?auto_164281 ?auto_164284 ) ) ( not ( = ?auto_164282 ?auto_164284 ) ) ( not ( = ?auto_164279 ?auto_164284 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164282 ?auto_164284 )
      ( MAKE-3PILE ?auto_164276 ?auto_164277 ?auto_164278 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164285 - BLOCK
      ?auto_164286 - BLOCK
      ?auto_164287 - BLOCK
    )
    :vars
    (
      ?auto_164288 - BLOCK
      ?auto_164292 - BLOCK
      ?auto_164291 - BLOCK
      ?auto_164290 - BLOCK
      ?auto_164289 - BLOCK
      ?auto_164293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164288 ?auto_164287 ) ( ON-TABLE ?auto_164285 ) ( ON ?auto_164286 ?auto_164285 ) ( ON ?auto_164287 ?auto_164286 ) ( not ( = ?auto_164285 ?auto_164286 ) ) ( not ( = ?auto_164285 ?auto_164287 ) ) ( not ( = ?auto_164285 ?auto_164288 ) ) ( not ( = ?auto_164286 ?auto_164287 ) ) ( not ( = ?auto_164286 ?auto_164288 ) ) ( not ( = ?auto_164287 ?auto_164288 ) ) ( not ( = ?auto_164285 ?auto_164292 ) ) ( not ( = ?auto_164285 ?auto_164291 ) ) ( not ( = ?auto_164286 ?auto_164292 ) ) ( not ( = ?auto_164286 ?auto_164291 ) ) ( not ( = ?auto_164287 ?auto_164292 ) ) ( not ( = ?auto_164287 ?auto_164291 ) ) ( not ( = ?auto_164288 ?auto_164292 ) ) ( not ( = ?auto_164288 ?auto_164291 ) ) ( not ( = ?auto_164292 ?auto_164291 ) ) ( ON ?auto_164292 ?auto_164288 ) ( not ( = ?auto_164290 ?auto_164289 ) ) ( not ( = ?auto_164290 ?auto_164291 ) ) ( not ( = ?auto_164289 ?auto_164291 ) ) ( not ( = ?auto_164285 ?auto_164289 ) ) ( not ( = ?auto_164285 ?auto_164290 ) ) ( not ( = ?auto_164286 ?auto_164289 ) ) ( not ( = ?auto_164286 ?auto_164290 ) ) ( not ( = ?auto_164287 ?auto_164289 ) ) ( not ( = ?auto_164287 ?auto_164290 ) ) ( not ( = ?auto_164288 ?auto_164289 ) ) ( not ( = ?auto_164288 ?auto_164290 ) ) ( not ( = ?auto_164292 ?auto_164289 ) ) ( not ( = ?auto_164292 ?auto_164290 ) ) ( ON ?auto_164291 ?auto_164292 ) ( ON ?auto_164290 ?auto_164293 ) ( CLEAR ?auto_164290 ) ( not ( = ?auto_164285 ?auto_164293 ) ) ( not ( = ?auto_164286 ?auto_164293 ) ) ( not ( = ?auto_164287 ?auto_164293 ) ) ( not ( = ?auto_164288 ?auto_164293 ) ) ( not ( = ?auto_164292 ?auto_164293 ) ) ( not ( = ?auto_164291 ?auto_164293 ) ) ( not ( = ?auto_164290 ?auto_164293 ) ) ( not ( = ?auto_164289 ?auto_164293 ) ) ( HOLDING ?auto_164289 ) ( CLEAR ?auto_164291 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164285 ?auto_164286 ?auto_164287 ?auto_164288 ?auto_164292 ?auto_164291 ?auto_164289 )
      ( MAKE-3PILE ?auto_164285 ?auto_164286 ?auto_164287 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164294 - BLOCK
      ?auto_164295 - BLOCK
      ?auto_164296 - BLOCK
    )
    :vars
    (
      ?auto_164302 - BLOCK
      ?auto_164299 - BLOCK
      ?auto_164297 - BLOCK
      ?auto_164300 - BLOCK
      ?auto_164301 - BLOCK
      ?auto_164298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164302 ?auto_164296 ) ( ON-TABLE ?auto_164294 ) ( ON ?auto_164295 ?auto_164294 ) ( ON ?auto_164296 ?auto_164295 ) ( not ( = ?auto_164294 ?auto_164295 ) ) ( not ( = ?auto_164294 ?auto_164296 ) ) ( not ( = ?auto_164294 ?auto_164302 ) ) ( not ( = ?auto_164295 ?auto_164296 ) ) ( not ( = ?auto_164295 ?auto_164302 ) ) ( not ( = ?auto_164296 ?auto_164302 ) ) ( not ( = ?auto_164294 ?auto_164299 ) ) ( not ( = ?auto_164294 ?auto_164297 ) ) ( not ( = ?auto_164295 ?auto_164299 ) ) ( not ( = ?auto_164295 ?auto_164297 ) ) ( not ( = ?auto_164296 ?auto_164299 ) ) ( not ( = ?auto_164296 ?auto_164297 ) ) ( not ( = ?auto_164302 ?auto_164299 ) ) ( not ( = ?auto_164302 ?auto_164297 ) ) ( not ( = ?auto_164299 ?auto_164297 ) ) ( ON ?auto_164299 ?auto_164302 ) ( not ( = ?auto_164300 ?auto_164301 ) ) ( not ( = ?auto_164300 ?auto_164297 ) ) ( not ( = ?auto_164301 ?auto_164297 ) ) ( not ( = ?auto_164294 ?auto_164301 ) ) ( not ( = ?auto_164294 ?auto_164300 ) ) ( not ( = ?auto_164295 ?auto_164301 ) ) ( not ( = ?auto_164295 ?auto_164300 ) ) ( not ( = ?auto_164296 ?auto_164301 ) ) ( not ( = ?auto_164296 ?auto_164300 ) ) ( not ( = ?auto_164302 ?auto_164301 ) ) ( not ( = ?auto_164302 ?auto_164300 ) ) ( not ( = ?auto_164299 ?auto_164301 ) ) ( not ( = ?auto_164299 ?auto_164300 ) ) ( ON ?auto_164297 ?auto_164299 ) ( ON ?auto_164300 ?auto_164298 ) ( not ( = ?auto_164294 ?auto_164298 ) ) ( not ( = ?auto_164295 ?auto_164298 ) ) ( not ( = ?auto_164296 ?auto_164298 ) ) ( not ( = ?auto_164302 ?auto_164298 ) ) ( not ( = ?auto_164299 ?auto_164298 ) ) ( not ( = ?auto_164297 ?auto_164298 ) ) ( not ( = ?auto_164300 ?auto_164298 ) ) ( not ( = ?auto_164301 ?auto_164298 ) ) ( CLEAR ?auto_164297 ) ( ON ?auto_164301 ?auto_164300 ) ( CLEAR ?auto_164301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164298 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164298 ?auto_164300 )
      ( MAKE-3PILE ?auto_164294 ?auto_164295 ?auto_164296 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164303 - BLOCK
      ?auto_164304 - BLOCK
      ?auto_164305 - BLOCK
    )
    :vars
    (
      ?auto_164311 - BLOCK
      ?auto_164307 - BLOCK
      ?auto_164306 - BLOCK
      ?auto_164308 - BLOCK
      ?auto_164310 - BLOCK
      ?auto_164309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164311 ?auto_164305 ) ( ON-TABLE ?auto_164303 ) ( ON ?auto_164304 ?auto_164303 ) ( ON ?auto_164305 ?auto_164304 ) ( not ( = ?auto_164303 ?auto_164304 ) ) ( not ( = ?auto_164303 ?auto_164305 ) ) ( not ( = ?auto_164303 ?auto_164311 ) ) ( not ( = ?auto_164304 ?auto_164305 ) ) ( not ( = ?auto_164304 ?auto_164311 ) ) ( not ( = ?auto_164305 ?auto_164311 ) ) ( not ( = ?auto_164303 ?auto_164307 ) ) ( not ( = ?auto_164303 ?auto_164306 ) ) ( not ( = ?auto_164304 ?auto_164307 ) ) ( not ( = ?auto_164304 ?auto_164306 ) ) ( not ( = ?auto_164305 ?auto_164307 ) ) ( not ( = ?auto_164305 ?auto_164306 ) ) ( not ( = ?auto_164311 ?auto_164307 ) ) ( not ( = ?auto_164311 ?auto_164306 ) ) ( not ( = ?auto_164307 ?auto_164306 ) ) ( ON ?auto_164307 ?auto_164311 ) ( not ( = ?auto_164308 ?auto_164310 ) ) ( not ( = ?auto_164308 ?auto_164306 ) ) ( not ( = ?auto_164310 ?auto_164306 ) ) ( not ( = ?auto_164303 ?auto_164310 ) ) ( not ( = ?auto_164303 ?auto_164308 ) ) ( not ( = ?auto_164304 ?auto_164310 ) ) ( not ( = ?auto_164304 ?auto_164308 ) ) ( not ( = ?auto_164305 ?auto_164310 ) ) ( not ( = ?auto_164305 ?auto_164308 ) ) ( not ( = ?auto_164311 ?auto_164310 ) ) ( not ( = ?auto_164311 ?auto_164308 ) ) ( not ( = ?auto_164307 ?auto_164310 ) ) ( not ( = ?auto_164307 ?auto_164308 ) ) ( ON ?auto_164308 ?auto_164309 ) ( not ( = ?auto_164303 ?auto_164309 ) ) ( not ( = ?auto_164304 ?auto_164309 ) ) ( not ( = ?auto_164305 ?auto_164309 ) ) ( not ( = ?auto_164311 ?auto_164309 ) ) ( not ( = ?auto_164307 ?auto_164309 ) ) ( not ( = ?auto_164306 ?auto_164309 ) ) ( not ( = ?auto_164308 ?auto_164309 ) ) ( not ( = ?auto_164310 ?auto_164309 ) ) ( ON ?auto_164310 ?auto_164308 ) ( CLEAR ?auto_164310 ) ( ON-TABLE ?auto_164309 ) ( HOLDING ?auto_164306 ) ( CLEAR ?auto_164307 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164303 ?auto_164304 ?auto_164305 ?auto_164311 ?auto_164307 ?auto_164306 )
      ( MAKE-3PILE ?auto_164303 ?auto_164304 ?auto_164305 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164370 - BLOCK
      ?auto_164371 - BLOCK
      ?auto_164372 - BLOCK
      ?auto_164373 - BLOCK
      ?auto_164374 - BLOCK
    )
    :vars
    (
      ?auto_164375 - BLOCK
      ?auto_164376 - BLOCK
      ?auto_164377 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164370 ) ( ON ?auto_164371 ?auto_164370 ) ( ON ?auto_164372 ?auto_164371 ) ( not ( = ?auto_164370 ?auto_164371 ) ) ( not ( = ?auto_164370 ?auto_164372 ) ) ( not ( = ?auto_164370 ?auto_164373 ) ) ( not ( = ?auto_164370 ?auto_164374 ) ) ( not ( = ?auto_164371 ?auto_164372 ) ) ( not ( = ?auto_164371 ?auto_164373 ) ) ( not ( = ?auto_164371 ?auto_164374 ) ) ( not ( = ?auto_164372 ?auto_164373 ) ) ( not ( = ?auto_164372 ?auto_164374 ) ) ( not ( = ?auto_164373 ?auto_164374 ) ) ( ON ?auto_164374 ?auto_164375 ) ( not ( = ?auto_164370 ?auto_164375 ) ) ( not ( = ?auto_164371 ?auto_164375 ) ) ( not ( = ?auto_164372 ?auto_164375 ) ) ( not ( = ?auto_164373 ?auto_164375 ) ) ( not ( = ?auto_164374 ?auto_164375 ) ) ( CLEAR ?auto_164372 ) ( ON ?auto_164373 ?auto_164374 ) ( CLEAR ?auto_164373 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164376 ) ( ON ?auto_164377 ?auto_164376 ) ( ON ?auto_164375 ?auto_164377 ) ( not ( = ?auto_164376 ?auto_164377 ) ) ( not ( = ?auto_164376 ?auto_164375 ) ) ( not ( = ?auto_164376 ?auto_164374 ) ) ( not ( = ?auto_164376 ?auto_164373 ) ) ( not ( = ?auto_164377 ?auto_164375 ) ) ( not ( = ?auto_164377 ?auto_164374 ) ) ( not ( = ?auto_164377 ?auto_164373 ) ) ( not ( = ?auto_164370 ?auto_164376 ) ) ( not ( = ?auto_164370 ?auto_164377 ) ) ( not ( = ?auto_164371 ?auto_164376 ) ) ( not ( = ?auto_164371 ?auto_164377 ) ) ( not ( = ?auto_164372 ?auto_164376 ) ) ( not ( = ?auto_164372 ?auto_164377 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164376 ?auto_164377 ?auto_164375 ?auto_164374 )
      ( MAKE-5PILE ?auto_164370 ?auto_164371 ?auto_164372 ?auto_164373 ?auto_164374 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164378 - BLOCK
      ?auto_164379 - BLOCK
      ?auto_164380 - BLOCK
      ?auto_164381 - BLOCK
      ?auto_164382 - BLOCK
    )
    :vars
    (
      ?auto_164384 - BLOCK
      ?auto_164383 - BLOCK
      ?auto_164385 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164378 ) ( ON ?auto_164379 ?auto_164378 ) ( not ( = ?auto_164378 ?auto_164379 ) ) ( not ( = ?auto_164378 ?auto_164380 ) ) ( not ( = ?auto_164378 ?auto_164381 ) ) ( not ( = ?auto_164378 ?auto_164382 ) ) ( not ( = ?auto_164379 ?auto_164380 ) ) ( not ( = ?auto_164379 ?auto_164381 ) ) ( not ( = ?auto_164379 ?auto_164382 ) ) ( not ( = ?auto_164380 ?auto_164381 ) ) ( not ( = ?auto_164380 ?auto_164382 ) ) ( not ( = ?auto_164381 ?auto_164382 ) ) ( ON ?auto_164382 ?auto_164384 ) ( not ( = ?auto_164378 ?auto_164384 ) ) ( not ( = ?auto_164379 ?auto_164384 ) ) ( not ( = ?auto_164380 ?auto_164384 ) ) ( not ( = ?auto_164381 ?auto_164384 ) ) ( not ( = ?auto_164382 ?auto_164384 ) ) ( ON ?auto_164381 ?auto_164382 ) ( CLEAR ?auto_164381 ) ( ON-TABLE ?auto_164383 ) ( ON ?auto_164385 ?auto_164383 ) ( ON ?auto_164384 ?auto_164385 ) ( not ( = ?auto_164383 ?auto_164385 ) ) ( not ( = ?auto_164383 ?auto_164384 ) ) ( not ( = ?auto_164383 ?auto_164382 ) ) ( not ( = ?auto_164383 ?auto_164381 ) ) ( not ( = ?auto_164385 ?auto_164384 ) ) ( not ( = ?auto_164385 ?auto_164382 ) ) ( not ( = ?auto_164385 ?auto_164381 ) ) ( not ( = ?auto_164378 ?auto_164383 ) ) ( not ( = ?auto_164378 ?auto_164385 ) ) ( not ( = ?auto_164379 ?auto_164383 ) ) ( not ( = ?auto_164379 ?auto_164385 ) ) ( not ( = ?auto_164380 ?auto_164383 ) ) ( not ( = ?auto_164380 ?auto_164385 ) ) ( HOLDING ?auto_164380 ) ( CLEAR ?auto_164379 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164378 ?auto_164379 ?auto_164380 )
      ( MAKE-5PILE ?auto_164378 ?auto_164379 ?auto_164380 ?auto_164381 ?auto_164382 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164386 - BLOCK
      ?auto_164387 - BLOCK
      ?auto_164388 - BLOCK
      ?auto_164389 - BLOCK
      ?auto_164390 - BLOCK
    )
    :vars
    (
      ?auto_164391 - BLOCK
      ?auto_164393 - BLOCK
      ?auto_164392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164386 ) ( ON ?auto_164387 ?auto_164386 ) ( not ( = ?auto_164386 ?auto_164387 ) ) ( not ( = ?auto_164386 ?auto_164388 ) ) ( not ( = ?auto_164386 ?auto_164389 ) ) ( not ( = ?auto_164386 ?auto_164390 ) ) ( not ( = ?auto_164387 ?auto_164388 ) ) ( not ( = ?auto_164387 ?auto_164389 ) ) ( not ( = ?auto_164387 ?auto_164390 ) ) ( not ( = ?auto_164388 ?auto_164389 ) ) ( not ( = ?auto_164388 ?auto_164390 ) ) ( not ( = ?auto_164389 ?auto_164390 ) ) ( ON ?auto_164390 ?auto_164391 ) ( not ( = ?auto_164386 ?auto_164391 ) ) ( not ( = ?auto_164387 ?auto_164391 ) ) ( not ( = ?auto_164388 ?auto_164391 ) ) ( not ( = ?auto_164389 ?auto_164391 ) ) ( not ( = ?auto_164390 ?auto_164391 ) ) ( ON ?auto_164389 ?auto_164390 ) ( ON-TABLE ?auto_164393 ) ( ON ?auto_164392 ?auto_164393 ) ( ON ?auto_164391 ?auto_164392 ) ( not ( = ?auto_164393 ?auto_164392 ) ) ( not ( = ?auto_164393 ?auto_164391 ) ) ( not ( = ?auto_164393 ?auto_164390 ) ) ( not ( = ?auto_164393 ?auto_164389 ) ) ( not ( = ?auto_164392 ?auto_164391 ) ) ( not ( = ?auto_164392 ?auto_164390 ) ) ( not ( = ?auto_164392 ?auto_164389 ) ) ( not ( = ?auto_164386 ?auto_164393 ) ) ( not ( = ?auto_164386 ?auto_164392 ) ) ( not ( = ?auto_164387 ?auto_164393 ) ) ( not ( = ?auto_164387 ?auto_164392 ) ) ( not ( = ?auto_164388 ?auto_164393 ) ) ( not ( = ?auto_164388 ?auto_164392 ) ) ( CLEAR ?auto_164387 ) ( ON ?auto_164388 ?auto_164389 ) ( CLEAR ?auto_164388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164393 ?auto_164392 ?auto_164391 ?auto_164390 ?auto_164389 )
      ( MAKE-5PILE ?auto_164386 ?auto_164387 ?auto_164388 ?auto_164389 ?auto_164390 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164394 - BLOCK
      ?auto_164395 - BLOCK
      ?auto_164396 - BLOCK
      ?auto_164397 - BLOCK
      ?auto_164398 - BLOCK
    )
    :vars
    (
      ?auto_164400 - BLOCK
      ?auto_164401 - BLOCK
      ?auto_164399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164394 ) ( not ( = ?auto_164394 ?auto_164395 ) ) ( not ( = ?auto_164394 ?auto_164396 ) ) ( not ( = ?auto_164394 ?auto_164397 ) ) ( not ( = ?auto_164394 ?auto_164398 ) ) ( not ( = ?auto_164395 ?auto_164396 ) ) ( not ( = ?auto_164395 ?auto_164397 ) ) ( not ( = ?auto_164395 ?auto_164398 ) ) ( not ( = ?auto_164396 ?auto_164397 ) ) ( not ( = ?auto_164396 ?auto_164398 ) ) ( not ( = ?auto_164397 ?auto_164398 ) ) ( ON ?auto_164398 ?auto_164400 ) ( not ( = ?auto_164394 ?auto_164400 ) ) ( not ( = ?auto_164395 ?auto_164400 ) ) ( not ( = ?auto_164396 ?auto_164400 ) ) ( not ( = ?auto_164397 ?auto_164400 ) ) ( not ( = ?auto_164398 ?auto_164400 ) ) ( ON ?auto_164397 ?auto_164398 ) ( ON-TABLE ?auto_164401 ) ( ON ?auto_164399 ?auto_164401 ) ( ON ?auto_164400 ?auto_164399 ) ( not ( = ?auto_164401 ?auto_164399 ) ) ( not ( = ?auto_164401 ?auto_164400 ) ) ( not ( = ?auto_164401 ?auto_164398 ) ) ( not ( = ?auto_164401 ?auto_164397 ) ) ( not ( = ?auto_164399 ?auto_164400 ) ) ( not ( = ?auto_164399 ?auto_164398 ) ) ( not ( = ?auto_164399 ?auto_164397 ) ) ( not ( = ?auto_164394 ?auto_164401 ) ) ( not ( = ?auto_164394 ?auto_164399 ) ) ( not ( = ?auto_164395 ?auto_164401 ) ) ( not ( = ?auto_164395 ?auto_164399 ) ) ( not ( = ?auto_164396 ?auto_164401 ) ) ( not ( = ?auto_164396 ?auto_164399 ) ) ( ON ?auto_164396 ?auto_164397 ) ( CLEAR ?auto_164396 ) ( HOLDING ?auto_164395 ) ( CLEAR ?auto_164394 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164394 ?auto_164395 )
      ( MAKE-5PILE ?auto_164394 ?auto_164395 ?auto_164396 ?auto_164397 ?auto_164398 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164402 - BLOCK
      ?auto_164403 - BLOCK
      ?auto_164404 - BLOCK
      ?auto_164405 - BLOCK
      ?auto_164406 - BLOCK
    )
    :vars
    (
      ?auto_164409 - BLOCK
      ?auto_164407 - BLOCK
      ?auto_164408 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164402 ) ( not ( = ?auto_164402 ?auto_164403 ) ) ( not ( = ?auto_164402 ?auto_164404 ) ) ( not ( = ?auto_164402 ?auto_164405 ) ) ( not ( = ?auto_164402 ?auto_164406 ) ) ( not ( = ?auto_164403 ?auto_164404 ) ) ( not ( = ?auto_164403 ?auto_164405 ) ) ( not ( = ?auto_164403 ?auto_164406 ) ) ( not ( = ?auto_164404 ?auto_164405 ) ) ( not ( = ?auto_164404 ?auto_164406 ) ) ( not ( = ?auto_164405 ?auto_164406 ) ) ( ON ?auto_164406 ?auto_164409 ) ( not ( = ?auto_164402 ?auto_164409 ) ) ( not ( = ?auto_164403 ?auto_164409 ) ) ( not ( = ?auto_164404 ?auto_164409 ) ) ( not ( = ?auto_164405 ?auto_164409 ) ) ( not ( = ?auto_164406 ?auto_164409 ) ) ( ON ?auto_164405 ?auto_164406 ) ( ON-TABLE ?auto_164407 ) ( ON ?auto_164408 ?auto_164407 ) ( ON ?auto_164409 ?auto_164408 ) ( not ( = ?auto_164407 ?auto_164408 ) ) ( not ( = ?auto_164407 ?auto_164409 ) ) ( not ( = ?auto_164407 ?auto_164406 ) ) ( not ( = ?auto_164407 ?auto_164405 ) ) ( not ( = ?auto_164408 ?auto_164409 ) ) ( not ( = ?auto_164408 ?auto_164406 ) ) ( not ( = ?auto_164408 ?auto_164405 ) ) ( not ( = ?auto_164402 ?auto_164407 ) ) ( not ( = ?auto_164402 ?auto_164408 ) ) ( not ( = ?auto_164403 ?auto_164407 ) ) ( not ( = ?auto_164403 ?auto_164408 ) ) ( not ( = ?auto_164404 ?auto_164407 ) ) ( not ( = ?auto_164404 ?auto_164408 ) ) ( ON ?auto_164404 ?auto_164405 ) ( CLEAR ?auto_164402 ) ( ON ?auto_164403 ?auto_164404 ) ( CLEAR ?auto_164403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164407 ?auto_164408 ?auto_164409 ?auto_164406 ?auto_164405 ?auto_164404 )
      ( MAKE-5PILE ?auto_164402 ?auto_164403 ?auto_164404 ?auto_164405 ?auto_164406 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164410 - BLOCK
      ?auto_164411 - BLOCK
      ?auto_164412 - BLOCK
      ?auto_164413 - BLOCK
      ?auto_164414 - BLOCK
    )
    :vars
    (
      ?auto_164416 - BLOCK
      ?auto_164415 - BLOCK
      ?auto_164417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164410 ?auto_164411 ) ) ( not ( = ?auto_164410 ?auto_164412 ) ) ( not ( = ?auto_164410 ?auto_164413 ) ) ( not ( = ?auto_164410 ?auto_164414 ) ) ( not ( = ?auto_164411 ?auto_164412 ) ) ( not ( = ?auto_164411 ?auto_164413 ) ) ( not ( = ?auto_164411 ?auto_164414 ) ) ( not ( = ?auto_164412 ?auto_164413 ) ) ( not ( = ?auto_164412 ?auto_164414 ) ) ( not ( = ?auto_164413 ?auto_164414 ) ) ( ON ?auto_164414 ?auto_164416 ) ( not ( = ?auto_164410 ?auto_164416 ) ) ( not ( = ?auto_164411 ?auto_164416 ) ) ( not ( = ?auto_164412 ?auto_164416 ) ) ( not ( = ?auto_164413 ?auto_164416 ) ) ( not ( = ?auto_164414 ?auto_164416 ) ) ( ON ?auto_164413 ?auto_164414 ) ( ON-TABLE ?auto_164415 ) ( ON ?auto_164417 ?auto_164415 ) ( ON ?auto_164416 ?auto_164417 ) ( not ( = ?auto_164415 ?auto_164417 ) ) ( not ( = ?auto_164415 ?auto_164416 ) ) ( not ( = ?auto_164415 ?auto_164414 ) ) ( not ( = ?auto_164415 ?auto_164413 ) ) ( not ( = ?auto_164417 ?auto_164416 ) ) ( not ( = ?auto_164417 ?auto_164414 ) ) ( not ( = ?auto_164417 ?auto_164413 ) ) ( not ( = ?auto_164410 ?auto_164415 ) ) ( not ( = ?auto_164410 ?auto_164417 ) ) ( not ( = ?auto_164411 ?auto_164415 ) ) ( not ( = ?auto_164411 ?auto_164417 ) ) ( not ( = ?auto_164412 ?auto_164415 ) ) ( not ( = ?auto_164412 ?auto_164417 ) ) ( ON ?auto_164412 ?auto_164413 ) ( ON ?auto_164411 ?auto_164412 ) ( CLEAR ?auto_164411 ) ( HOLDING ?auto_164410 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164410 )
      ( MAKE-5PILE ?auto_164410 ?auto_164411 ?auto_164412 ?auto_164413 ?auto_164414 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164418 - BLOCK
      ?auto_164419 - BLOCK
      ?auto_164420 - BLOCK
      ?auto_164421 - BLOCK
      ?auto_164422 - BLOCK
    )
    :vars
    (
      ?auto_164423 - BLOCK
      ?auto_164424 - BLOCK
      ?auto_164425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164418 ?auto_164419 ) ) ( not ( = ?auto_164418 ?auto_164420 ) ) ( not ( = ?auto_164418 ?auto_164421 ) ) ( not ( = ?auto_164418 ?auto_164422 ) ) ( not ( = ?auto_164419 ?auto_164420 ) ) ( not ( = ?auto_164419 ?auto_164421 ) ) ( not ( = ?auto_164419 ?auto_164422 ) ) ( not ( = ?auto_164420 ?auto_164421 ) ) ( not ( = ?auto_164420 ?auto_164422 ) ) ( not ( = ?auto_164421 ?auto_164422 ) ) ( ON ?auto_164422 ?auto_164423 ) ( not ( = ?auto_164418 ?auto_164423 ) ) ( not ( = ?auto_164419 ?auto_164423 ) ) ( not ( = ?auto_164420 ?auto_164423 ) ) ( not ( = ?auto_164421 ?auto_164423 ) ) ( not ( = ?auto_164422 ?auto_164423 ) ) ( ON ?auto_164421 ?auto_164422 ) ( ON-TABLE ?auto_164424 ) ( ON ?auto_164425 ?auto_164424 ) ( ON ?auto_164423 ?auto_164425 ) ( not ( = ?auto_164424 ?auto_164425 ) ) ( not ( = ?auto_164424 ?auto_164423 ) ) ( not ( = ?auto_164424 ?auto_164422 ) ) ( not ( = ?auto_164424 ?auto_164421 ) ) ( not ( = ?auto_164425 ?auto_164423 ) ) ( not ( = ?auto_164425 ?auto_164422 ) ) ( not ( = ?auto_164425 ?auto_164421 ) ) ( not ( = ?auto_164418 ?auto_164424 ) ) ( not ( = ?auto_164418 ?auto_164425 ) ) ( not ( = ?auto_164419 ?auto_164424 ) ) ( not ( = ?auto_164419 ?auto_164425 ) ) ( not ( = ?auto_164420 ?auto_164424 ) ) ( not ( = ?auto_164420 ?auto_164425 ) ) ( ON ?auto_164420 ?auto_164421 ) ( ON ?auto_164419 ?auto_164420 ) ( ON ?auto_164418 ?auto_164419 ) ( CLEAR ?auto_164418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164424 ?auto_164425 ?auto_164423 ?auto_164422 ?auto_164421 ?auto_164420 ?auto_164419 )
      ( MAKE-5PILE ?auto_164418 ?auto_164419 ?auto_164420 ?auto_164421 ?auto_164422 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164431 - BLOCK
      ?auto_164432 - BLOCK
      ?auto_164433 - BLOCK
      ?auto_164434 - BLOCK
      ?auto_164435 - BLOCK
    )
    :vars
    (
      ?auto_164438 - BLOCK
      ?auto_164437 - BLOCK
      ?auto_164436 - BLOCK
      ?auto_164439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164431 ?auto_164432 ) ) ( not ( = ?auto_164431 ?auto_164433 ) ) ( not ( = ?auto_164431 ?auto_164434 ) ) ( not ( = ?auto_164431 ?auto_164435 ) ) ( not ( = ?auto_164432 ?auto_164433 ) ) ( not ( = ?auto_164432 ?auto_164434 ) ) ( not ( = ?auto_164432 ?auto_164435 ) ) ( not ( = ?auto_164433 ?auto_164434 ) ) ( not ( = ?auto_164433 ?auto_164435 ) ) ( not ( = ?auto_164434 ?auto_164435 ) ) ( ON ?auto_164435 ?auto_164438 ) ( not ( = ?auto_164431 ?auto_164438 ) ) ( not ( = ?auto_164432 ?auto_164438 ) ) ( not ( = ?auto_164433 ?auto_164438 ) ) ( not ( = ?auto_164434 ?auto_164438 ) ) ( not ( = ?auto_164435 ?auto_164438 ) ) ( ON ?auto_164434 ?auto_164435 ) ( ON-TABLE ?auto_164437 ) ( ON ?auto_164436 ?auto_164437 ) ( ON ?auto_164438 ?auto_164436 ) ( not ( = ?auto_164437 ?auto_164436 ) ) ( not ( = ?auto_164437 ?auto_164438 ) ) ( not ( = ?auto_164437 ?auto_164435 ) ) ( not ( = ?auto_164437 ?auto_164434 ) ) ( not ( = ?auto_164436 ?auto_164438 ) ) ( not ( = ?auto_164436 ?auto_164435 ) ) ( not ( = ?auto_164436 ?auto_164434 ) ) ( not ( = ?auto_164431 ?auto_164437 ) ) ( not ( = ?auto_164431 ?auto_164436 ) ) ( not ( = ?auto_164432 ?auto_164437 ) ) ( not ( = ?auto_164432 ?auto_164436 ) ) ( not ( = ?auto_164433 ?auto_164437 ) ) ( not ( = ?auto_164433 ?auto_164436 ) ) ( ON ?auto_164433 ?auto_164434 ) ( ON ?auto_164432 ?auto_164433 ) ( CLEAR ?auto_164432 ) ( ON ?auto_164431 ?auto_164439 ) ( CLEAR ?auto_164431 ) ( HAND-EMPTY ) ( not ( = ?auto_164431 ?auto_164439 ) ) ( not ( = ?auto_164432 ?auto_164439 ) ) ( not ( = ?auto_164433 ?auto_164439 ) ) ( not ( = ?auto_164434 ?auto_164439 ) ) ( not ( = ?auto_164435 ?auto_164439 ) ) ( not ( = ?auto_164438 ?auto_164439 ) ) ( not ( = ?auto_164437 ?auto_164439 ) ) ( not ( = ?auto_164436 ?auto_164439 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164431 ?auto_164439 )
      ( MAKE-5PILE ?auto_164431 ?auto_164432 ?auto_164433 ?auto_164434 ?auto_164435 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164440 - BLOCK
      ?auto_164441 - BLOCK
      ?auto_164442 - BLOCK
      ?auto_164443 - BLOCK
      ?auto_164444 - BLOCK
    )
    :vars
    (
      ?auto_164446 - BLOCK
      ?auto_164445 - BLOCK
      ?auto_164447 - BLOCK
      ?auto_164448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164440 ?auto_164441 ) ) ( not ( = ?auto_164440 ?auto_164442 ) ) ( not ( = ?auto_164440 ?auto_164443 ) ) ( not ( = ?auto_164440 ?auto_164444 ) ) ( not ( = ?auto_164441 ?auto_164442 ) ) ( not ( = ?auto_164441 ?auto_164443 ) ) ( not ( = ?auto_164441 ?auto_164444 ) ) ( not ( = ?auto_164442 ?auto_164443 ) ) ( not ( = ?auto_164442 ?auto_164444 ) ) ( not ( = ?auto_164443 ?auto_164444 ) ) ( ON ?auto_164444 ?auto_164446 ) ( not ( = ?auto_164440 ?auto_164446 ) ) ( not ( = ?auto_164441 ?auto_164446 ) ) ( not ( = ?auto_164442 ?auto_164446 ) ) ( not ( = ?auto_164443 ?auto_164446 ) ) ( not ( = ?auto_164444 ?auto_164446 ) ) ( ON ?auto_164443 ?auto_164444 ) ( ON-TABLE ?auto_164445 ) ( ON ?auto_164447 ?auto_164445 ) ( ON ?auto_164446 ?auto_164447 ) ( not ( = ?auto_164445 ?auto_164447 ) ) ( not ( = ?auto_164445 ?auto_164446 ) ) ( not ( = ?auto_164445 ?auto_164444 ) ) ( not ( = ?auto_164445 ?auto_164443 ) ) ( not ( = ?auto_164447 ?auto_164446 ) ) ( not ( = ?auto_164447 ?auto_164444 ) ) ( not ( = ?auto_164447 ?auto_164443 ) ) ( not ( = ?auto_164440 ?auto_164445 ) ) ( not ( = ?auto_164440 ?auto_164447 ) ) ( not ( = ?auto_164441 ?auto_164445 ) ) ( not ( = ?auto_164441 ?auto_164447 ) ) ( not ( = ?auto_164442 ?auto_164445 ) ) ( not ( = ?auto_164442 ?auto_164447 ) ) ( ON ?auto_164442 ?auto_164443 ) ( ON ?auto_164440 ?auto_164448 ) ( CLEAR ?auto_164440 ) ( not ( = ?auto_164440 ?auto_164448 ) ) ( not ( = ?auto_164441 ?auto_164448 ) ) ( not ( = ?auto_164442 ?auto_164448 ) ) ( not ( = ?auto_164443 ?auto_164448 ) ) ( not ( = ?auto_164444 ?auto_164448 ) ) ( not ( = ?auto_164446 ?auto_164448 ) ) ( not ( = ?auto_164445 ?auto_164448 ) ) ( not ( = ?auto_164447 ?auto_164448 ) ) ( HOLDING ?auto_164441 ) ( CLEAR ?auto_164442 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164445 ?auto_164447 ?auto_164446 ?auto_164444 ?auto_164443 ?auto_164442 ?auto_164441 )
      ( MAKE-5PILE ?auto_164440 ?auto_164441 ?auto_164442 ?auto_164443 ?auto_164444 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164449 - BLOCK
      ?auto_164450 - BLOCK
      ?auto_164451 - BLOCK
      ?auto_164452 - BLOCK
      ?auto_164453 - BLOCK
    )
    :vars
    (
      ?auto_164456 - BLOCK
      ?auto_164455 - BLOCK
      ?auto_164454 - BLOCK
      ?auto_164457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164449 ?auto_164450 ) ) ( not ( = ?auto_164449 ?auto_164451 ) ) ( not ( = ?auto_164449 ?auto_164452 ) ) ( not ( = ?auto_164449 ?auto_164453 ) ) ( not ( = ?auto_164450 ?auto_164451 ) ) ( not ( = ?auto_164450 ?auto_164452 ) ) ( not ( = ?auto_164450 ?auto_164453 ) ) ( not ( = ?auto_164451 ?auto_164452 ) ) ( not ( = ?auto_164451 ?auto_164453 ) ) ( not ( = ?auto_164452 ?auto_164453 ) ) ( ON ?auto_164453 ?auto_164456 ) ( not ( = ?auto_164449 ?auto_164456 ) ) ( not ( = ?auto_164450 ?auto_164456 ) ) ( not ( = ?auto_164451 ?auto_164456 ) ) ( not ( = ?auto_164452 ?auto_164456 ) ) ( not ( = ?auto_164453 ?auto_164456 ) ) ( ON ?auto_164452 ?auto_164453 ) ( ON-TABLE ?auto_164455 ) ( ON ?auto_164454 ?auto_164455 ) ( ON ?auto_164456 ?auto_164454 ) ( not ( = ?auto_164455 ?auto_164454 ) ) ( not ( = ?auto_164455 ?auto_164456 ) ) ( not ( = ?auto_164455 ?auto_164453 ) ) ( not ( = ?auto_164455 ?auto_164452 ) ) ( not ( = ?auto_164454 ?auto_164456 ) ) ( not ( = ?auto_164454 ?auto_164453 ) ) ( not ( = ?auto_164454 ?auto_164452 ) ) ( not ( = ?auto_164449 ?auto_164455 ) ) ( not ( = ?auto_164449 ?auto_164454 ) ) ( not ( = ?auto_164450 ?auto_164455 ) ) ( not ( = ?auto_164450 ?auto_164454 ) ) ( not ( = ?auto_164451 ?auto_164455 ) ) ( not ( = ?auto_164451 ?auto_164454 ) ) ( ON ?auto_164451 ?auto_164452 ) ( ON ?auto_164449 ?auto_164457 ) ( not ( = ?auto_164449 ?auto_164457 ) ) ( not ( = ?auto_164450 ?auto_164457 ) ) ( not ( = ?auto_164451 ?auto_164457 ) ) ( not ( = ?auto_164452 ?auto_164457 ) ) ( not ( = ?auto_164453 ?auto_164457 ) ) ( not ( = ?auto_164456 ?auto_164457 ) ) ( not ( = ?auto_164455 ?auto_164457 ) ) ( not ( = ?auto_164454 ?auto_164457 ) ) ( CLEAR ?auto_164451 ) ( ON ?auto_164450 ?auto_164449 ) ( CLEAR ?auto_164450 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164457 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164457 ?auto_164449 )
      ( MAKE-5PILE ?auto_164449 ?auto_164450 ?auto_164451 ?auto_164452 ?auto_164453 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164458 - BLOCK
      ?auto_164459 - BLOCK
      ?auto_164460 - BLOCK
      ?auto_164461 - BLOCK
      ?auto_164462 - BLOCK
    )
    :vars
    (
      ?auto_164464 - BLOCK
      ?auto_164466 - BLOCK
      ?auto_164463 - BLOCK
      ?auto_164465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164458 ?auto_164459 ) ) ( not ( = ?auto_164458 ?auto_164460 ) ) ( not ( = ?auto_164458 ?auto_164461 ) ) ( not ( = ?auto_164458 ?auto_164462 ) ) ( not ( = ?auto_164459 ?auto_164460 ) ) ( not ( = ?auto_164459 ?auto_164461 ) ) ( not ( = ?auto_164459 ?auto_164462 ) ) ( not ( = ?auto_164460 ?auto_164461 ) ) ( not ( = ?auto_164460 ?auto_164462 ) ) ( not ( = ?auto_164461 ?auto_164462 ) ) ( ON ?auto_164462 ?auto_164464 ) ( not ( = ?auto_164458 ?auto_164464 ) ) ( not ( = ?auto_164459 ?auto_164464 ) ) ( not ( = ?auto_164460 ?auto_164464 ) ) ( not ( = ?auto_164461 ?auto_164464 ) ) ( not ( = ?auto_164462 ?auto_164464 ) ) ( ON ?auto_164461 ?auto_164462 ) ( ON-TABLE ?auto_164466 ) ( ON ?auto_164463 ?auto_164466 ) ( ON ?auto_164464 ?auto_164463 ) ( not ( = ?auto_164466 ?auto_164463 ) ) ( not ( = ?auto_164466 ?auto_164464 ) ) ( not ( = ?auto_164466 ?auto_164462 ) ) ( not ( = ?auto_164466 ?auto_164461 ) ) ( not ( = ?auto_164463 ?auto_164464 ) ) ( not ( = ?auto_164463 ?auto_164462 ) ) ( not ( = ?auto_164463 ?auto_164461 ) ) ( not ( = ?auto_164458 ?auto_164466 ) ) ( not ( = ?auto_164458 ?auto_164463 ) ) ( not ( = ?auto_164459 ?auto_164466 ) ) ( not ( = ?auto_164459 ?auto_164463 ) ) ( not ( = ?auto_164460 ?auto_164466 ) ) ( not ( = ?auto_164460 ?auto_164463 ) ) ( ON ?auto_164458 ?auto_164465 ) ( not ( = ?auto_164458 ?auto_164465 ) ) ( not ( = ?auto_164459 ?auto_164465 ) ) ( not ( = ?auto_164460 ?auto_164465 ) ) ( not ( = ?auto_164461 ?auto_164465 ) ) ( not ( = ?auto_164462 ?auto_164465 ) ) ( not ( = ?auto_164464 ?auto_164465 ) ) ( not ( = ?auto_164466 ?auto_164465 ) ) ( not ( = ?auto_164463 ?auto_164465 ) ) ( ON ?auto_164459 ?auto_164458 ) ( CLEAR ?auto_164459 ) ( ON-TABLE ?auto_164465 ) ( HOLDING ?auto_164460 ) ( CLEAR ?auto_164461 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164466 ?auto_164463 ?auto_164464 ?auto_164462 ?auto_164461 ?auto_164460 )
      ( MAKE-5PILE ?auto_164458 ?auto_164459 ?auto_164460 ?auto_164461 ?auto_164462 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164467 - BLOCK
      ?auto_164468 - BLOCK
      ?auto_164469 - BLOCK
      ?auto_164470 - BLOCK
      ?auto_164471 - BLOCK
    )
    :vars
    (
      ?auto_164474 - BLOCK
      ?auto_164472 - BLOCK
      ?auto_164473 - BLOCK
      ?auto_164475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164467 ?auto_164468 ) ) ( not ( = ?auto_164467 ?auto_164469 ) ) ( not ( = ?auto_164467 ?auto_164470 ) ) ( not ( = ?auto_164467 ?auto_164471 ) ) ( not ( = ?auto_164468 ?auto_164469 ) ) ( not ( = ?auto_164468 ?auto_164470 ) ) ( not ( = ?auto_164468 ?auto_164471 ) ) ( not ( = ?auto_164469 ?auto_164470 ) ) ( not ( = ?auto_164469 ?auto_164471 ) ) ( not ( = ?auto_164470 ?auto_164471 ) ) ( ON ?auto_164471 ?auto_164474 ) ( not ( = ?auto_164467 ?auto_164474 ) ) ( not ( = ?auto_164468 ?auto_164474 ) ) ( not ( = ?auto_164469 ?auto_164474 ) ) ( not ( = ?auto_164470 ?auto_164474 ) ) ( not ( = ?auto_164471 ?auto_164474 ) ) ( ON ?auto_164470 ?auto_164471 ) ( ON-TABLE ?auto_164472 ) ( ON ?auto_164473 ?auto_164472 ) ( ON ?auto_164474 ?auto_164473 ) ( not ( = ?auto_164472 ?auto_164473 ) ) ( not ( = ?auto_164472 ?auto_164474 ) ) ( not ( = ?auto_164472 ?auto_164471 ) ) ( not ( = ?auto_164472 ?auto_164470 ) ) ( not ( = ?auto_164473 ?auto_164474 ) ) ( not ( = ?auto_164473 ?auto_164471 ) ) ( not ( = ?auto_164473 ?auto_164470 ) ) ( not ( = ?auto_164467 ?auto_164472 ) ) ( not ( = ?auto_164467 ?auto_164473 ) ) ( not ( = ?auto_164468 ?auto_164472 ) ) ( not ( = ?auto_164468 ?auto_164473 ) ) ( not ( = ?auto_164469 ?auto_164472 ) ) ( not ( = ?auto_164469 ?auto_164473 ) ) ( ON ?auto_164467 ?auto_164475 ) ( not ( = ?auto_164467 ?auto_164475 ) ) ( not ( = ?auto_164468 ?auto_164475 ) ) ( not ( = ?auto_164469 ?auto_164475 ) ) ( not ( = ?auto_164470 ?auto_164475 ) ) ( not ( = ?auto_164471 ?auto_164475 ) ) ( not ( = ?auto_164474 ?auto_164475 ) ) ( not ( = ?auto_164472 ?auto_164475 ) ) ( not ( = ?auto_164473 ?auto_164475 ) ) ( ON ?auto_164468 ?auto_164467 ) ( ON-TABLE ?auto_164475 ) ( CLEAR ?auto_164470 ) ( ON ?auto_164469 ?auto_164468 ) ( CLEAR ?auto_164469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164475 ?auto_164467 ?auto_164468 )
      ( MAKE-5PILE ?auto_164467 ?auto_164468 ?auto_164469 ?auto_164470 ?auto_164471 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164476 - BLOCK
      ?auto_164477 - BLOCK
      ?auto_164478 - BLOCK
      ?auto_164479 - BLOCK
      ?auto_164480 - BLOCK
    )
    :vars
    (
      ?auto_164482 - BLOCK
      ?auto_164483 - BLOCK
      ?auto_164484 - BLOCK
      ?auto_164481 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164476 ?auto_164477 ) ) ( not ( = ?auto_164476 ?auto_164478 ) ) ( not ( = ?auto_164476 ?auto_164479 ) ) ( not ( = ?auto_164476 ?auto_164480 ) ) ( not ( = ?auto_164477 ?auto_164478 ) ) ( not ( = ?auto_164477 ?auto_164479 ) ) ( not ( = ?auto_164477 ?auto_164480 ) ) ( not ( = ?auto_164478 ?auto_164479 ) ) ( not ( = ?auto_164478 ?auto_164480 ) ) ( not ( = ?auto_164479 ?auto_164480 ) ) ( ON ?auto_164480 ?auto_164482 ) ( not ( = ?auto_164476 ?auto_164482 ) ) ( not ( = ?auto_164477 ?auto_164482 ) ) ( not ( = ?auto_164478 ?auto_164482 ) ) ( not ( = ?auto_164479 ?auto_164482 ) ) ( not ( = ?auto_164480 ?auto_164482 ) ) ( ON-TABLE ?auto_164483 ) ( ON ?auto_164484 ?auto_164483 ) ( ON ?auto_164482 ?auto_164484 ) ( not ( = ?auto_164483 ?auto_164484 ) ) ( not ( = ?auto_164483 ?auto_164482 ) ) ( not ( = ?auto_164483 ?auto_164480 ) ) ( not ( = ?auto_164483 ?auto_164479 ) ) ( not ( = ?auto_164484 ?auto_164482 ) ) ( not ( = ?auto_164484 ?auto_164480 ) ) ( not ( = ?auto_164484 ?auto_164479 ) ) ( not ( = ?auto_164476 ?auto_164483 ) ) ( not ( = ?auto_164476 ?auto_164484 ) ) ( not ( = ?auto_164477 ?auto_164483 ) ) ( not ( = ?auto_164477 ?auto_164484 ) ) ( not ( = ?auto_164478 ?auto_164483 ) ) ( not ( = ?auto_164478 ?auto_164484 ) ) ( ON ?auto_164476 ?auto_164481 ) ( not ( = ?auto_164476 ?auto_164481 ) ) ( not ( = ?auto_164477 ?auto_164481 ) ) ( not ( = ?auto_164478 ?auto_164481 ) ) ( not ( = ?auto_164479 ?auto_164481 ) ) ( not ( = ?auto_164480 ?auto_164481 ) ) ( not ( = ?auto_164482 ?auto_164481 ) ) ( not ( = ?auto_164483 ?auto_164481 ) ) ( not ( = ?auto_164484 ?auto_164481 ) ) ( ON ?auto_164477 ?auto_164476 ) ( ON-TABLE ?auto_164481 ) ( ON ?auto_164478 ?auto_164477 ) ( CLEAR ?auto_164478 ) ( HOLDING ?auto_164479 ) ( CLEAR ?auto_164480 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164483 ?auto_164484 ?auto_164482 ?auto_164480 ?auto_164479 )
      ( MAKE-5PILE ?auto_164476 ?auto_164477 ?auto_164478 ?auto_164479 ?auto_164480 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164485 - BLOCK
      ?auto_164486 - BLOCK
      ?auto_164487 - BLOCK
      ?auto_164488 - BLOCK
      ?auto_164489 - BLOCK
    )
    :vars
    (
      ?auto_164490 - BLOCK
      ?auto_164492 - BLOCK
      ?auto_164491 - BLOCK
      ?auto_164493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164485 ?auto_164486 ) ) ( not ( = ?auto_164485 ?auto_164487 ) ) ( not ( = ?auto_164485 ?auto_164488 ) ) ( not ( = ?auto_164485 ?auto_164489 ) ) ( not ( = ?auto_164486 ?auto_164487 ) ) ( not ( = ?auto_164486 ?auto_164488 ) ) ( not ( = ?auto_164486 ?auto_164489 ) ) ( not ( = ?auto_164487 ?auto_164488 ) ) ( not ( = ?auto_164487 ?auto_164489 ) ) ( not ( = ?auto_164488 ?auto_164489 ) ) ( ON ?auto_164489 ?auto_164490 ) ( not ( = ?auto_164485 ?auto_164490 ) ) ( not ( = ?auto_164486 ?auto_164490 ) ) ( not ( = ?auto_164487 ?auto_164490 ) ) ( not ( = ?auto_164488 ?auto_164490 ) ) ( not ( = ?auto_164489 ?auto_164490 ) ) ( ON-TABLE ?auto_164492 ) ( ON ?auto_164491 ?auto_164492 ) ( ON ?auto_164490 ?auto_164491 ) ( not ( = ?auto_164492 ?auto_164491 ) ) ( not ( = ?auto_164492 ?auto_164490 ) ) ( not ( = ?auto_164492 ?auto_164489 ) ) ( not ( = ?auto_164492 ?auto_164488 ) ) ( not ( = ?auto_164491 ?auto_164490 ) ) ( not ( = ?auto_164491 ?auto_164489 ) ) ( not ( = ?auto_164491 ?auto_164488 ) ) ( not ( = ?auto_164485 ?auto_164492 ) ) ( not ( = ?auto_164485 ?auto_164491 ) ) ( not ( = ?auto_164486 ?auto_164492 ) ) ( not ( = ?auto_164486 ?auto_164491 ) ) ( not ( = ?auto_164487 ?auto_164492 ) ) ( not ( = ?auto_164487 ?auto_164491 ) ) ( ON ?auto_164485 ?auto_164493 ) ( not ( = ?auto_164485 ?auto_164493 ) ) ( not ( = ?auto_164486 ?auto_164493 ) ) ( not ( = ?auto_164487 ?auto_164493 ) ) ( not ( = ?auto_164488 ?auto_164493 ) ) ( not ( = ?auto_164489 ?auto_164493 ) ) ( not ( = ?auto_164490 ?auto_164493 ) ) ( not ( = ?auto_164492 ?auto_164493 ) ) ( not ( = ?auto_164491 ?auto_164493 ) ) ( ON ?auto_164486 ?auto_164485 ) ( ON-TABLE ?auto_164493 ) ( ON ?auto_164487 ?auto_164486 ) ( CLEAR ?auto_164489 ) ( ON ?auto_164488 ?auto_164487 ) ( CLEAR ?auto_164488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164493 ?auto_164485 ?auto_164486 ?auto_164487 )
      ( MAKE-5PILE ?auto_164485 ?auto_164486 ?auto_164487 ?auto_164488 ?auto_164489 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164494 - BLOCK
      ?auto_164495 - BLOCK
      ?auto_164496 - BLOCK
      ?auto_164497 - BLOCK
      ?auto_164498 - BLOCK
    )
    :vars
    (
      ?auto_164501 - BLOCK
      ?auto_164500 - BLOCK
      ?auto_164499 - BLOCK
      ?auto_164502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164494 ?auto_164495 ) ) ( not ( = ?auto_164494 ?auto_164496 ) ) ( not ( = ?auto_164494 ?auto_164497 ) ) ( not ( = ?auto_164494 ?auto_164498 ) ) ( not ( = ?auto_164495 ?auto_164496 ) ) ( not ( = ?auto_164495 ?auto_164497 ) ) ( not ( = ?auto_164495 ?auto_164498 ) ) ( not ( = ?auto_164496 ?auto_164497 ) ) ( not ( = ?auto_164496 ?auto_164498 ) ) ( not ( = ?auto_164497 ?auto_164498 ) ) ( not ( = ?auto_164494 ?auto_164501 ) ) ( not ( = ?auto_164495 ?auto_164501 ) ) ( not ( = ?auto_164496 ?auto_164501 ) ) ( not ( = ?auto_164497 ?auto_164501 ) ) ( not ( = ?auto_164498 ?auto_164501 ) ) ( ON-TABLE ?auto_164500 ) ( ON ?auto_164499 ?auto_164500 ) ( ON ?auto_164501 ?auto_164499 ) ( not ( = ?auto_164500 ?auto_164499 ) ) ( not ( = ?auto_164500 ?auto_164501 ) ) ( not ( = ?auto_164500 ?auto_164498 ) ) ( not ( = ?auto_164500 ?auto_164497 ) ) ( not ( = ?auto_164499 ?auto_164501 ) ) ( not ( = ?auto_164499 ?auto_164498 ) ) ( not ( = ?auto_164499 ?auto_164497 ) ) ( not ( = ?auto_164494 ?auto_164500 ) ) ( not ( = ?auto_164494 ?auto_164499 ) ) ( not ( = ?auto_164495 ?auto_164500 ) ) ( not ( = ?auto_164495 ?auto_164499 ) ) ( not ( = ?auto_164496 ?auto_164500 ) ) ( not ( = ?auto_164496 ?auto_164499 ) ) ( ON ?auto_164494 ?auto_164502 ) ( not ( = ?auto_164494 ?auto_164502 ) ) ( not ( = ?auto_164495 ?auto_164502 ) ) ( not ( = ?auto_164496 ?auto_164502 ) ) ( not ( = ?auto_164497 ?auto_164502 ) ) ( not ( = ?auto_164498 ?auto_164502 ) ) ( not ( = ?auto_164501 ?auto_164502 ) ) ( not ( = ?auto_164500 ?auto_164502 ) ) ( not ( = ?auto_164499 ?auto_164502 ) ) ( ON ?auto_164495 ?auto_164494 ) ( ON-TABLE ?auto_164502 ) ( ON ?auto_164496 ?auto_164495 ) ( ON ?auto_164497 ?auto_164496 ) ( CLEAR ?auto_164497 ) ( HOLDING ?auto_164498 ) ( CLEAR ?auto_164501 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164500 ?auto_164499 ?auto_164501 ?auto_164498 )
      ( MAKE-5PILE ?auto_164494 ?auto_164495 ?auto_164496 ?auto_164497 ?auto_164498 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164503 - BLOCK
      ?auto_164504 - BLOCK
      ?auto_164505 - BLOCK
      ?auto_164506 - BLOCK
      ?auto_164507 - BLOCK
    )
    :vars
    (
      ?auto_164510 - BLOCK
      ?auto_164509 - BLOCK
      ?auto_164511 - BLOCK
      ?auto_164508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164503 ?auto_164504 ) ) ( not ( = ?auto_164503 ?auto_164505 ) ) ( not ( = ?auto_164503 ?auto_164506 ) ) ( not ( = ?auto_164503 ?auto_164507 ) ) ( not ( = ?auto_164504 ?auto_164505 ) ) ( not ( = ?auto_164504 ?auto_164506 ) ) ( not ( = ?auto_164504 ?auto_164507 ) ) ( not ( = ?auto_164505 ?auto_164506 ) ) ( not ( = ?auto_164505 ?auto_164507 ) ) ( not ( = ?auto_164506 ?auto_164507 ) ) ( not ( = ?auto_164503 ?auto_164510 ) ) ( not ( = ?auto_164504 ?auto_164510 ) ) ( not ( = ?auto_164505 ?auto_164510 ) ) ( not ( = ?auto_164506 ?auto_164510 ) ) ( not ( = ?auto_164507 ?auto_164510 ) ) ( ON-TABLE ?auto_164509 ) ( ON ?auto_164511 ?auto_164509 ) ( ON ?auto_164510 ?auto_164511 ) ( not ( = ?auto_164509 ?auto_164511 ) ) ( not ( = ?auto_164509 ?auto_164510 ) ) ( not ( = ?auto_164509 ?auto_164507 ) ) ( not ( = ?auto_164509 ?auto_164506 ) ) ( not ( = ?auto_164511 ?auto_164510 ) ) ( not ( = ?auto_164511 ?auto_164507 ) ) ( not ( = ?auto_164511 ?auto_164506 ) ) ( not ( = ?auto_164503 ?auto_164509 ) ) ( not ( = ?auto_164503 ?auto_164511 ) ) ( not ( = ?auto_164504 ?auto_164509 ) ) ( not ( = ?auto_164504 ?auto_164511 ) ) ( not ( = ?auto_164505 ?auto_164509 ) ) ( not ( = ?auto_164505 ?auto_164511 ) ) ( ON ?auto_164503 ?auto_164508 ) ( not ( = ?auto_164503 ?auto_164508 ) ) ( not ( = ?auto_164504 ?auto_164508 ) ) ( not ( = ?auto_164505 ?auto_164508 ) ) ( not ( = ?auto_164506 ?auto_164508 ) ) ( not ( = ?auto_164507 ?auto_164508 ) ) ( not ( = ?auto_164510 ?auto_164508 ) ) ( not ( = ?auto_164509 ?auto_164508 ) ) ( not ( = ?auto_164511 ?auto_164508 ) ) ( ON ?auto_164504 ?auto_164503 ) ( ON-TABLE ?auto_164508 ) ( ON ?auto_164505 ?auto_164504 ) ( ON ?auto_164506 ?auto_164505 ) ( CLEAR ?auto_164510 ) ( ON ?auto_164507 ?auto_164506 ) ( CLEAR ?auto_164507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164508 ?auto_164503 ?auto_164504 ?auto_164505 ?auto_164506 )
      ( MAKE-5PILE ?auto_164503 ?auto_164504 ?auto_164505 ?auto_164506 ?auto_164507 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164512 - BLOCK
      ?auto_164513 - BLOCK
      ?auto_164514 - BLOCK
      ?auto_164515 - BLOCK
      ?auto_164516 - BLOCK
    )
    :vars
    (
      ?auto_164519 - BLOCK
      ?auto_164520 - BLOCK
      ?auto_164518 - BLOCK
      ?auto_164517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164512 ?auto_164513 ) ) ( not ( = ?auto_164512 ?auto_164514 ) ) ( not ( = ?auto_164512 ?auto_164515 ) ) ( not ( = ?auto_164512 ?auto_164516 ) ) ( not ( = ?auto_164513 ?auto_164514 ) ) ( not ( = ?auto_164513 ?auto_164515 ) ) ( not ( = ?auto_164513 ?auto_164516 ) ) ( not ( = ?auto_164514 ?auto_164515 ) ) ( not ( = ?auto_164514 ?auto_164516 ) ) ( not ( = ?auto_164515 ?auto_164516 ) ) ( not ( = ?auto_164512 ?auto_164519 ) ) ( not ( = ?auto_164513 ?auto_164519 ) ) ( not ( = ?auto_164514 ?auto_164519 ) ) ( not ( = ?auto_164515 ?auto_164519 ) ) ( not ( = ?auto_164516 ?auto_164519 ) ) ( ON-TABLE ?auto_164520 ) ( ON ?auto_164518 ?auto_164520 ) ( not ( = ?auto_164520 ?auto_164518 ) ) ( not ( = ?auto_164520 ?auto_164519 ) ) ( not ( = ?auto_164520 ?auto_164516 ) ) ( not ( = ?auto_164520 ?auto_164515 ) ) ( not ( = ?auto_164518 ?auto_164519 ) ) ( not ( = ?auto_164518 ?auto_164516 ) ) ( not ( = ?auto_164518 ?auto_164515 ) ) ( not ( = ?auto_164512 ?auto_164520 ) ) ( not ( = ?auto_164512 ?auto_164518 ) ) ( not ( = ?auto_164513 ?auto_164520 ) ) ( not ( = ?auto_164513 ?auto_164518 ) ) ( not ( = ?auto_164514 ?auto_164520 ) ) ( not ( = ?auto_164514 ?auto_164518 ) ) ( ON ?auto_164512 ?auto_164517 ) ( not ( = ?auto_164512 ?auto_164517 ) ) ( not ( = ?auto_164513 ?auto_164517 ) ) ( not ( = ?auto_164514 ?auto_164517 ) ) ( not ( = ?auto_164515 ?auto_164517 ) ) ( not ( = ?auto_164516 ?auto_164517 ) ) ( not ( = ?auto_164519 ?auto_164517 ) ) ( not ( = ?auto_164520 ?auto_164517 ) ) ( not ( = ?auto_164518 ?auto_164517 ) ) ( ON ?auto_164513 ?auto_164512 ) ( ON-TABLE ?auto_164517 ) ( ON ?auto_164514 ?auto_164513 ) ( ON ?auto_164515 ?auto_164514 ) ( ON ?auto_164516 ?auto_164515 ) ( CLEAR ?auto_164516 ) ( HOLDING ?auto_164519 ) ( CLEAR ?auto_164518 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164520 ?auto_164518 ?auto_164519 )
      ( MAKE-5PILE ?auto_164512 ?auto_164513 ?auto_164514 ?auto_164515 ?auto_164516 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164521 - BLOCK
      ?auto_164522 - BLOCK
      ?auto_164523 - BLOCK
      ?auto_164524 - BLOCK
      ?auto_164525 - BLOCK
    )
    :vars
    (
      ?auto_164526 - BLOCK
      ?auto_164528 - BLOCK
      ?auto_164529 - BLOCK
      ?auto_164527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164521 ?auto_164522 ) ) ( not ( = ?auto_164521 ?auto_164523 ) ) ( not ( = ?auto_164521 ?auto_164524 ) ) ( not ( = ?auto_164521 ?auto_164525 ) ) ( not ( = ?auto_164522 ?auto_164523 ) ) ( not ( = ?auto_164522 ?auto_164524 ) ) ( not ( = ?auto_164522 ?auto_164525 ) ) ( not ( = ?auto_164523 ?auto_164524 ) ) ( not ( = ?auto_164523 ?auto_164525 ) ) ( not ( = ?auto_164524 ?auto_164525 ) ) ( not ( = ?auto_164521 ?auto_164526 ) ) ( not ( = ?auto_164522 ?auto_164526 ) ) ( not ( = ?auto_164523 ?auto_164526 ) ) ( not ( = ?auto_164524 ?auto_164526 ) ) ( not ( = ?auto_164525 ?auto_164526 ) ) ( ON-TABLE ?auto_164528 ) ( ON ?auto_164529 ?auto_164528 ) ( not ( = ?auto_164528 ?auto_164529 ) ) ( not ( = ?auto_164528 ?auto_164526 ) ) ( not ( = ?auto_164528 ?auto_164525 ) ) ( not ( = ?auto_164528 ?auto_164524 ) ) ( not ( = ?auto_164529 ?auto_164526 ) ) ( not ( = ?auto_164529 ?auto_164525 ) ) ( not ( = ?auto_164529 ?auto_164524 ) ) ( not ( = ?auto_164521 ?auto_164528 ) ) ( not ( = ?auto_164521 ?auto_164529 ) ) ( not ( = ?auto_164522 ?auto_164528 ) ) ( not ( = ?auto_164522 ?auto_164529 ) ) ( not ( = ?auto_164523 ?auto_164528 ) ) ( not ( = ?auto_164523 ?auto_164529 ) ) ( ON ?auto_164521 ?auto_164527 ) ( not ( = ?auto_164521 ?auto_164527 ) ) ( not ( = ?auto_164522 ?auto_164527 ) ) ( not ( = ?auto_164523 ?auto_164527 ) ) ( not ( = ?auto_164524 ?auto_164527 ) ) ( not ( = ?auto_164525 ?auto_164527 ) ) ( not ( = ?auto_164526 ?auto_164527 ) ) ( not ( = ?auto_164528 ?auto_164527 ) ) ( not ( = ?auto_164529 ?auto_164527 ) ) ( ON ?auto_164522 ?auto_164521 ) ( ON-TABLE ?auto_164527 ) ( ON ?auto_164523 ?auto_164522 ) ( ON ?auto_164524 ?auto_164523 ) ( ON ?auto_164525 ?auto_164524 ) ( CLEAR ?auto_164529 ) ( ON ?auto_164526 ?auto_164525 ) ( CLEAR ?auto_164526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164527 ?auto_164521 ?auto_164522 ?auto_164523 ?auto_164524 ?auto_164525 )
      ( MAKE-5PILE ?auto_164521 ?auto_164522 ?auto_164523 ?auto_164524 ?auto_164525 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164530 - BLOCK
      ?auto_164531 - BLOCK
      ?auto_164532 - BLOCK
      ?auto_164533 - BLOCK
      ?auto_164534 - BLOCK
    )
    :vars
    (
      ?auto_164535 - BLOCK
      ?auto_164538 - BLOCK
      ?auto_164536 - BLOCK
      ?auto_164537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164530 ?auto_164531 ) ) ( not ( = ?auto_164530 ?auto_164532 ) ) ( not ( = ?auto_164530 ?auto_164533 ) ) ( not ( = ?auto_164530 ?auto_164534 ) ) ( not ( = ?auto_164531 ?auto_164532 ) ) ( not ( = ?auto_164531 ?auto_164533 ) ) ( not ( = ?auto_164531 ?auto_164534 ) ) ( not ( = ?auto_164532 ?auto_164533 ) ) ( not ( = ?auto_164532 ?auto_164534 ) ) ( not ( = ?auto_164533 ?auto_164534 ) ) ( not ( = ?auto_164530 ?auto_164535 ) ) ( not ( = ?auto_164531 ?auto_164535 ) ) ( not ( = ?auto_164532 ?auto_164535 ) ) ( not ( = ?auto_164533 ?auto_164535 ) ) ( not ( = ?auto_164534 ?auto_164535 ) ) ( ON-TABLE ?auto_164538 ) ( not ( = ?auto_164538 ?auto_164536 ) ) ( not ( = ?auto_164538 ?auto_164535 ) ) ( not ( = ?auto_164538 ?auto_164534 ) ) ( not ( = ?auto_164538 ?auto_164533 ) ) ( not ( = ?auto_164536 ?auto_164535 ) ) ( not ( = ?auto_164536 ?auto_164534 ) ) ( not ( = ?auto_164536 ?auto_164533 ) ) ( not ( = ?auto_164530 ?auto_164538 ) ) ( not ( = ?auto_164530 ?auto_164536 ) ) ( not ( = ?auto_164531 ?auto_164538 ) ) ( not ( = ?auto_164531 ?auto_164536 ) ) ( not ( = ?auto_164532 ?auto_164538 ) ) ( not ( = ?auto_164532 ?auto_164536 ) ) ( ON ?auto_164530 ?auto_164537 ) ( not ( = ?auto_164530 ?auto_164537 ) ) ( not ( = ?auto_164531 ?auto_164537 ) ) ( not ( = ?auto_164532 ?auto_164537 ) ) ( not ( = ?auto_164533 ?auto_164537 ) ) ( not ( = ?auto_164534 ?auto_164537 ) ) ( not ( = ?auto_164535 ?auto_164537 ) ) ( not ( = ?auto_164538 ?auto_164537 ) ) ( not ( = ?auto_164536 ?auto_164537 ) ) ( ON ?auto_164531 ?auto_164530 ) ( ON-TABLE ?auto_164537 ) ( ON ?auto_164532 ?auto_164531 ) ( ON ?auto_164533 ?auto_164532 ) ( ON ?auto_164534 ?auto_164533 ) ( ON ?auto_164535 ?auto_164534 ) ( CLEAR ?auto_164535 ) ( HOLDING ?auto_164536 ) ( CLEAR ?auto_164538 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164538 ?auto_164536 )
      ( MAKE-5PILE ?auto_164530 ?auto_164531 ?auto_164532 ?auto_164533 ?auto_164534 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164539 - BLOCK
      ?auto_164540 - BLOCK
      ?auto_164541 - BLOCK
      ?auto_164542 - BLOCK
      ?auto_164543 - BLOCK
    )
    :vars
    (
      ?auto_164546 - BLOCK
      ?auto_164545 - BLOCK
      ?auto_164547 - BLOCK
      ?auto_164544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164539 ?auto_164540 ) ) ( not ( = ?auto_164539 ?auto_164541 ) ) ( not ( = ?auto_164539 ?auto_164542 ) ) ( not ( = ?auto_164539 ?auto_164543 ) ) ( not ( = ?auto_164540 ?auto_164541 ) ) ( not ( = ?auto_164540 ?auto_164542 ) ) ( not ( = ?auto_164540 ?auto_164543 ) ) ( not ( = ?auto_164541 ?auto_164542 ) ) ( not ( = ?auto_164541 ?auto_164543 ) ) ( not ( = ?auto_164542 ?auto_164543 ) ) ( not ( = ?auto_164539 ?auto_164546 ) ) ( not ( = ?auto_164540 ?auto_164546 ) ) ( not ( = ?auto_164541 ?auto_164546 ) ) ( not ( = ?auto_164542 ?auto_164546 ) ) ( not ( = ?auto_164543 ?auto_164546 ) ) ( ON-TABLE ?auto_164545 ) ( not ( = ?auto_164545 ?auto_164547 ) ) ( not ( = ?auto_164545 ?auto_164546 ) ) ( not ( = ?auto_164545 ?auto_164543 ) ) ( not ( = ?auto_164545 ?auto_164542 ) ) ( not ( = ?auto_164547 ?auto_164546 ) ) ( not ( = ?auto_164547 ?auto_164543 ) ) ( not ( = ?auto_164547 ?auto_164542 ) ) ( not ( = ?auto_164539 ?auto_164545 ) ) ( not ( = ?auto_164539 ?auto_164547 ) ) ( not ( = ?auto_164540 ?auto_164545 ) ) ( not ( = ?auto_164540 ?auto_164547 ) ) ( not ( = ?auto_164541 ?auto_164545 ) ) ( not ( = ?auto_164541 ?auto_164547 ) ) ( ON ?auto_164539 ?auto_164544 ) ( not ( = ?auto_164539 ?auto_164544 ) ) ( not ( = ?auto_164540 ?auto_164544 ) ) ( not ( = ?auto_164541 ?auto_164544 ) ) ( not ( = ?auto_164542 ?auto_164544 ) ) ( not ( = ?auto_164543 ?auto_164544 ) ) ( not ( = ?auto_164546 ?auto_164544 ) ) ( not ( = ?auto_164545 ?auto_164544 ) ) ( not ( = ?auto_164547 ?auto_164544 ) ) ( ON ?auto_164540 ?auto_164539 ) ( ON-TABLE ?auto_164544 ) ( ON ?auto_164541 ?auto_164540 ) ( ON ?auto_164542 ?auto_164541 ) ( ON ?auto_164543 ?auto_164542 ) ( ON ?auto_164546 ?auto_164543 ) ( CLEAR ?auto_164545 ) ( ON ?auto_164547 ?auto_164546 ) ( CLEAR ?auto_164547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164544 ?auto_164539 ?auto_164540 ?auto_164541 ?auto_164542 ?auto_164543 ?auto_164546 )
      ( MAKE-5PILE ?auto_164539 ?auto_164540 ?auto_164541 ?auto_164542 ?auto_164543 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164548 - BLOCK
      ?auto_164549 - BLOCK
      ?auto_164550 - BLOCK
      ?auto_164551 - BLOCK
      ?auto_164552 - BLOCK
    )
    :vars
    (
      ?auto_164553 - BLOCK
      ?auto_164554 - BLOCK
      ?auto_164555 - BLOCK
      ?auto_164556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164548 ?auto_164549 ) ) ( not ( = ?auto_164548 ?auto_164550 ) ) ( not ( = ?auto_164548 ?auto_164551 ) ) ( not ( = ?auto_164548 ?auto_164552 ) ) ( not ( = ?auto_164549 ?auto_164550 ) ) ( not ( = ?auto_164549 ?auto_164551 ) ) ( not ( = ?auto_164549 ?auto_164552 ) ) ( not ( = ?auto_164550 ?auto_164551 ) ) ( not ( = ?auto_164550 ?auto_164552 ) ) ( not ( = ?auto_164551 ?auto_164552 ) ) ( not ( = ?auto_164548 ?auto_164553 ) ) ( not ( = ?auto_164549 ?auto_164553 ) ) ( not ( = ?auto_164550 ?auto_164553 ) ) ( not ( = ?auto_164551 ?auto_164553 ) ) ( not ( = ?auto_164552 ?auto_164553 ) ) ( not ( = ?auto_164554 ?auto_164555 ) ) ( not ( = ?auto_164554 ?auto_164553 ) ) ( not ( = ?auto_164554 ?auto_164552 ) ) ( not ( = ?auto_164554 ?auto_164551 ) ) ( not ( = ?auto_164555 ?auto_164553 ) ) ( not ( = ?auto_164555 ?auto_164552 ) ) ( not ( = ?auto_164555 ?auto_164551 ) ) ( not ( = ?auto_164548 ?auto_164554 ) ) ( not ( = ?auto_164548 ?auto_164555 ) ) ( not ( = ?auto_164549 ?auto_164554 ) ) ( not ( = ?auto_164549 ?auto_164555 ) ) ( not ( = ?auto_164550 ?auto_164554 ) ) ( not ( = ?auto_164550 ?auto_164555 ) ) ( ON ?auto_164548 ?auto_164556 ) ( not ( = ?auto_164548 ?auto_164556 ) ) ( not ( = ?auto_164549 ?auto_164556 ) ) ( not ( = ?auto_164550 ?auto_164556 ) ) ( not ( = ?auto_164551 ?auto_164556 ) ) ( not ( = ?auto_164552 ?auto_164556 ) ) ( not ( = ?auto_164553 ?auto_164556 ) ) ( not ( = ?auto_164554 ?auto_164556 ) ) ( not ( = ?auto_164555 ?auto_164556 ) ) ( ON ?auto_164549 ?auto_164548 ) ( ON-TABLE ?auto_164556 ) ( ON ?auto_164550 ?auto_164549 ) ( ON ?auto_164551 ?auto_164550 ) ( ON ?auto_164552 ?auto_164551 ) ( ON ?auto_164553 ?auto_164552 ) ( ON ?auto_164555 ?auto_164553 ) ( CLEAR ?auto_164555 ) ( HOLDING ?auto_164554 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164554 )
      ( MAKE-5PILE ?auto_164548 ?auto_164549 ?auto_164550 ?auto_164551 ?auto_164552 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164557 - BLOCK
      ?auto_164558 - BLOCK
      ?auto_164559 - BLOCK
      ?auto_164560 - BLOCK
      ?auto_164561 - BLOCK
    )
    :vars
    (
      ?auto_164562 - BLOCK
      ?auto_164563 - BLOCK
      ?auto_164564 - BLOCK
      ?auto_164565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164557 ?auto_164558 ) ) ( not ( = ?auto_164557 ?auto_164559 ) ) ( not ( = ?auto_164557 ?auto_164560 ) ) ( not ( = ?auto_164557 ?auto_164561 ) ) ( not ( = ?auto_164558 ?auto_164559 ) ) ( not ( = ?auto_164558 ?auto_164560 ) ) ( not ( = ?auto_164558 ?auto_164561 ) ) ( not ( = ?auto_164559 ?auto_164560 ) ) ( not ( = ?auto_164559 ?auto_164561 ) ) ( not ( = ?auto_164560 ?auto_164561 ) ) ( not ( = ?auto_164557 ?auto_164562 ) ) ( not ( = ?auto_164558 ?auto_164562 ) ) ( not ( = ?auto_164559 ?auto_164562 ) ) ( not ( = ?auto_164560 ?auto_164562 ) ) ( not ( = ?auto_164561 ?auto_164562 ) ) ( not ( = ?auto_164563 ?auto_164564 ) ) ( not ( = ?auto_164563 ?auto_164562 ) ) ( not ( = ?auto_164563 ?auto_164561 ) ) ( not ( = ?auto_164563 ?auto_164560 ) ) ( not ( = ?auto_164564 ?auto_164562 ) ) ( not ( = ?auto_164564 ?auto_164561 ) ) ( not ( = ?auto_164564 ?auto_164560 ) ) ( not ( = ?auto_164557 ?auto_164563 ) ) ( not ( = ?auto_164557 ?auto_164564 ) ) ( not ( = ?auto_164558 ?auto_164563 ) ) ( not ( = ?auto_164558 ?auto_164564 ) ) ( not ( = ?auto_164559 ?auto_164563 ) ) ( not ( = ?auto_164559 ?auto_164564 ) ) ( ON ?auto_164557 ?auto_164565 ) ( not ( = ?auto_164557 ?auto_164565 ) ) ( not ( = ?auto_164558 ?auto_164565 ) ) ( not ( = ?auto_164559 ?auto_164565 ) ) ( not ( = ?auto_164560 ?auto_164565 ) ) ( not ( = ?auto_164561 ?auto_164565 ) ) ( not ( = ?auto_164562 ?auto_164565 ) ) ( not ( = ?auto_164563 ?auto_164565 ) ) ( not ( = ?auto_164564 ?auto_164565 ) ) ( ON ?auto_164558 ?auto_164557 ) ( ON-TABLE ?auto_164565 ) ( ON ?auto_164559 ?auto_164558 ) ( ON ?auto_164560 ?auto_164559 ) ( ON ?auto_164561 ?auto_164560 ) ( ON ?auto_164562 ?auto_164561 ) ( ON ?auto_164564 ?auto_164562 ) ( ON ?auto_164563 ?auto_164564 ) ( CLEAR ?auto_164563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_164565 ?auto_164557 ?auto_164558 ?auto_164559 ?auto_164560 ?auto_164561 ?auto_164562 ?auto_164564 )
      ( MAKE-5PILE ?auto_164557 ?auto_164558 ?auto_164559 ?auto_164560 ?auto_164561 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164581 - BLOCK
      ?auto_164582 - BLOCK
    )
    :vars
    (
      ?auto_164585 - BLOCK
      ?auto_164583 - BLOCK
      ?auto_164584 - BLOCK
      ?auto_164588 - BLOCK
      ?auto_164587 - BLOCK
      ?auto_164586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164585 ?auto_164582 ) ( ON-TABLE ?auto_164581 ) ( ON ?auto_164582 ?auto_164581 ) ( not ( = ?auto_164581 ?auto_164582 ) ) ( not ( = ?auto_164581 ?auto_164585 ) ) ( not ( = ?auto_164582 ?auto_164585 ) ) ( not ( = ?auto_164581 ?auto_164583 ) ) ( not ( = ?auto_164581 ?auto_164584 ) ) ( not ( = ?auto_164582 ?auto_164583 ) ) ( not ( = ?auto_164582 ?auto_164584 ) ) ( not ( = ?auto_164585 ?auto_164583 ) ) ( not ( = ?auto_164585 ?auto_164584 ) ) ( not ( = ?auto_164583 ?auto_164584 ) ) ( ON ?auto_164583 ?auto_164585 ) ( CLEAR ?auto_164583 ) ( HOLDING ?auto_164584 ) ( CLEAR ?auto_164588 ) ( ON-TABLE ?auto_164587 ) ( ON ?auto_164586 ?auto_164587 ) ( ON ?auto_164588 ?auto_164586 ) ( not ( = ?auto_164587 ?auto_164586 ) ) ( not ( = ?auto_164587 ?auto_164588 ) ) ( not ( = ?auto_164587 ?auto_164584 ) ) ( not ( = ?auto_164586 ?auto_164588 ) ) ( not ( = ?auto_164586 ?auto_164584 ) ) ( not ( = ?auto_164588 ?auto_164584 ) ) ( not ( = ?auto_164581 ?auto_164588 ) ) ( not ( = ?auto_164581 ?auto_164587 ) ) ( not ( = ?auto_164581 ?auto_164586 ) ) ( not ( = ?auto_164582 ?auto_164588 ) ) ( not ( = ?auto_164582 ?auto_164587 ) ) ( not ( = ?auto_164582 ?auto_164586 ) ) ( not ( = ?auto_164585 ?auto_164588 ) ) ( not ( = ?auto_164585 ?auto_164587 ) ) ( not ( = ?auto_164585 ?auto_164586 ) ) ( not ( = ?auto_164583 ?auto_164588 ) ) ( not ( = ?auto_164583 ?auto_164587 ) ) ( not ( = ?auto_164583 ?auto_164586 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164587 ?auto_164586 ?auto_164588 ?auto_164584 )
      ( MAKE-2PILE ?auto_164581 ?auto_164582 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164589 - BLOCK
      ?auto_164590 - BLOCK
    )
    :vars
    (
      ?auto_164595 - BLOCK
      ?auto_164591 - BLOCK
      ?auto_164594 - BLOCK
      ?auto_164596 - BLOCK
      ?auto_164592 - BLOCK
      ?auto_164593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164595 ?auto_164590 ) ( ON-TABLE ?auto_164589 ) ( ON ?auto_164590 ?auto_164589 ) ( not ( = ?auto_164589 ?auto_164590 ) ) ( not ( = ?auto_164589 ?auto_164595 ) ) ( not ( = ?auto_164590 ?auto_164595 ) ) ( not ( = ?auto_164589 ?auto_164591 ) ) ( not ( = ?auto_164589 ?auto_164594 ) ) ( not ( = ?auto_164590 ?auto_164591 ) ) ( not ( = ?auto_164590 ?auto_164594 ) ) ( not ( = ?auto_164595 ?auto_164591 ) ) ( not ( = ?auto_164595 ?auto_164594 ) ) ( not ( = ?auto_164591 ?auto_164594 ) ) ( ON ?auto_164591 ?auto_164595 ) ( CLEAR ?auto_164596 ) ( ON-TABLE ?auto_164592 ) ( ON ?auto_164593 ?auto_164592 ) ( ON ?auto_164596 ?auto_164593 ) ( not ( = ?auto_164592 ?auto_164593 ) ) ( not ( = ?auto_164592 ?auto_164596 ) ) ( not ( = ?auto_164592 ?auto_164594 ) ) ( not ( = ?auto_164593 ?auto_164596 ) ) ( not ( = ?auto_164593 ?auto_164594 ) ) ( not ( = ?auto_164596 ?auto_164594 ) ) ( not ( = ?auto_164589 ?auto_164596 ) ) ( not ( = ?auto_164589 ?auto_164592 ) ) ( not ( = ?auto_164589 ?auto_164593 ) ) ( not ( = ?auto_164590 ?auto_164596 ) ) ( not ( = ?auto_164590 ?auto_164592 ) ) ( not ( = ?auto_164590 ?auto_164593 ) ) ( not ( = ?auto_164595 ?auto_164596 ) ) ( not ( = ?auto_164595 ?auto_164592 ) ) ( not ( = ?auto_164595 ?auto_164593 ) ) ( not ( = ?auto_164591 ?auto_164596 ) ) ( not ( = ?auto_164591 ?auto_164592 ) ) ( not ( = ?auto_164591 ?auto_164593 ) ) ( ON ?auto_164594 ?auto_164591 ) ( CLEAR ?auto_164594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164589 ?auto_164590 ?auto_164595 ?auto_164591 )
      ( MAKE-2PILE ?auto_164589 ?auto_164590 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164597 - BLOCK
      ?auto_164598 - BLOCK
    )
    :vars
    (
      ?auto_164603 - BLOCK
      ?auto_164602 - BLOCK
      ?auto_164601 - BLOCK
      ?auto_164600 - BLOCK
      ?auto_164604 - BLOCK
      ?auto_164599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164603 ?auto_164598 ) ( ON-TABLE ?auto_164597 ) ( ON ?auto_164598 ?auto_164597 ) ( not ( = ?auto_164597 ?auto_164598 ) ) ( not ( = ?auto_164597 ?auto_164603 ) ) ( not ( = ?auto_164598 ?auto_164603 ) ) ( not ( = ?auto_164597 ?auto_164602 ) ) ( not ( = ?auto_164597 ?auto_164601 ) ) ( not ( = ?auto_164598 ?auto_164602 ) ) ( not ( = ?auto_164598 ?auto_164601 ) ) ( not ( = ?auto_164603 ?auto_164602 ) ) ( not ( = ?auto_164603 ?auto_164601 ) ) ( not ( = ?auto_164602 ?auto_164601 ) ) ( ON ?auto_164602 ?auto_164603 ) ( ON-TABLE ?auto_164600 ) ( ON ?auto_164604 ?auto_164600 ) ( not ( = ?auto_164600 ?auto_164604 ) ) ( not ( = ?auto_164600 ?auto_164599 ) ) ( not ( = ?auto_164600 ?auto_164601 ) ) ( not ( = ?auto_164604 ?auto_164599 ) ) ( not ( = ?auto_164604 ?auto_164601 ) ) ( not ( = ?auto_164599 ?auto_164601 ) ) ( not ( = ?auto_164597 ?auto_164599 ) ) ( not ( = ?auto_164597 ?auto_164600 ) ) ( not ( = ?auto_164597 ?auto_164604 ) ) ( not ( = ?auto_164598 ?auto_164599 ) ) ( not ( = ?auto_164598 ?auto_164600 ) ) ( not ( = ?auto_164598 ?auto_164604 ) ) ( not ( = ?auto_164603 ?auto_164599 ) ) ( not ( = ?auto_164603 ?auto_164600 ) ) ( not ( = ?auto_164603 ?auto_164604 ) ) ( not ( = ?auto_164602 ?auto_164599 ) ) ( not ( = ?auto_164602 ?auto_164600 ) ) ( not ( = ?auto_164602 ?auto_164604 ) ) ( ON ?auto_164601 ?auto_164602 ) ( CLEAR ?auto_164601 ) ( HOLDING ?auto_164599 ) ( CLEAR ?auto_164604 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164600 ?auto_164604 ?auto_164599 )
      ( MAKE-2PILE ?auto_164597 ?auto_164598 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164605 - BLOCK
      ?auto_164606 - BLOCK
    )
    :vars
    (
      ?auto_164610 - BLOCK
      ?auto_164608 - BLOCK
      ?auto_164607 - BLOCK
      ?auto_164611 - BLOCK
      ?auto_164609 - BLOCK
      ?auto_164612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164610 ?auto_164606 ) ( ON-TABLE ?auto_164605 ) ( ON ?auto_164606 ?auto_164605 ) ( not ( = ?auto_164605 ?auto_164606 ) ) ( not ( = ?auto_164605 ?auto_164610 ) ) ( not ( = ?auto_164606 ?auto_164610 ) ) ( not ( = ?auto_164605 ?auto_164608 ) ) ( not ( = ?auto_164605 ?auto_164607 ) ) ( not ( = ?auto_164606 ?auto_164608 ) ) ( not ( = ?auto_164606 ?auto_164607 ) ) ( not ( = ?auto_164610 ?auto_164608 ) ) ( not ( = ?auto_164610 ?auto_164607 ) ) ( not ( = ?auto_164608 ?auto_164607 ) ) ( ON ?auto_164608 ?auto_164610 ) ( ON-TABLE ?auto_164611 ) ( ON ?auto_164609 ?auto_164611 ) ( not ( = ?auto_164611 ?auto_164609 ) ) ( not ( = ?auto_164611 ?auto_164612 ) ) ( not ( = ?auto_164611 ?auto_164607 ) ) ( not ( = ?auto_164609 ?auto_164612 ) ) ( not ( = ?auto_164609 ?auto_164607 ) ) ( not ( = ?auto_164612 ?auto_164607 ) ) ( not ( = ?auto_164605 ?auto_164612 ) ) ( not ( = ?auto_164605 ?auto_164611 ) ) ( not ( = ?auto_164605 ?auto_164609 ) ) ( not ( = ?auto_164606 ?auto_164612 ) ) ( not ( = ?auto_164606 ?auto_164611 ) ) ( not ( = ?auto_164606 ?auto_164609 ) ) ( not ( = ?auto_164610 ?auto_164612 ) ) ( not ( = ?auto_164610 ?auto_164611 ) ) ( not ( = ?auto_164610 ?auto_164609 ) ) ( not ( = ?auto_164608 ?auto_164612 ) ) ( not ( = ?auto_164608 ?auto_164611 ) ) ( not ( = ?auto_164608 ?auto_164609 ) ) ( ON ?auto_164607 ?auto_164608 ) ( CLEAR ?auto_164609 ) ( ON ?auto_164612 ?auto_164607 ) ( CLEAR ?auto_164612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164605 ?auto_164606 ?auto_164610 ?auto_164608 ?auto_164607 )
      ( MAKE-2PILE ?auto_164605 ?auto_164606 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164613 - BLOCK
      ?auto_164614 - BLOCK
    )
    :vars
    (
      ?auto_164617 - BLOCK
      ?auto_164616 - BLOCK
      ?auto_164618 - BLOCK
      ?auto_164619 - BLOCK
      ?auto_164615 - BLOCK
      ?auto_164620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164617 ?auto_164614 ) ( ON-TABLE ?auto_164613 ) ( ON ?auto_164614 ?auto_164613 ) ( not ( = ?auto_164613 ?auto_164614 ) ) ( not ( = ?auto_164613 ?auto_164617 ) ) ( not ( = ?auto_164614 ?auto_164617 ) ) ( not ( = ?auto_164613 ?auto_164616 ) ) ( not ( = ?auto_164613 ?auto_164618 ) ) ( not ( = ?auto_164614 ?auto_164616 ) ) ( not ( = ?auto_164614 ?auto_164618 ) ) ( not ( = ?auto_164617 ?auto_164616 ) ) ( not ( = ?auto_164617 ?auto_164618 ) ) ( not ( = ?auto_164616 ?auto_164618 ) ) ( ON ?auto_164616 ?auto_164617 ) ( ON-TABLE ?auto_164619 ) ( not ( = ?auto_164619 ?auto_164615 ) ) ( not ( = ?auto_164619 ?auto_164620 ) ) ( not ( = ?auto_164619 ?auto_164618 ) ) ( not ( = ?auto_164615 ?auto_164620 ) ) ( not ( = ?auto_164615 ?auto_164618 ) ) ( not ( = ?auto_164620 ?auto_164618 ) ) ( not ( = ?auto_164613 ?auto_164620 ) ) ( not ( = ?auto_164613 ?auto_164619 ) ) ( not ( = ?auto_164613 ?auto_164615 ) ) ( not ( = ?auto_164614 ?auto_164620 ) ) ( not ( = ?auto_164614 ?auto_164619 ) ) ( not ( = ?auto_164614 ?auto_164615 ) ) ( not ( = ?auto_164617 ?auto_164620 ) ) ( not ( = ?auto_164617 ?auto_164619 ) ) ( not ( = ?auto_164617 ?auto_164615 ) ) ( not ( = ?auto_164616 ?auto_164620 ) ) ( not ( = ?auto_164616 ?auto_164619 ) ) ( not ( = ?auto_164616 ?auto_164615 ) ) ( ON ?auto_164618 ?auto_164616 ) ( ON ?auto_164620 ?auto_164618 ) ( CLEAR ?auto_164620 ) ( HOLDING ?auto_164615 ) ( CLEAR ?auto_164619 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164619 ?auto_164615 )
      ( MAKE-2PILE ?auto_164613 ?auto_164614 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164621 - BLOCK
      ?auto_164622 - BLOCK
    )
    :vars
    (
      ?auto_164623 - BLOCK
      ?auto_164628 - BLOCK
      ?auto_164627 - BLOCK
      ?auto_164624 - BLOCK
      ?auto_164626 - BLOCK
      ?auto_164625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164623 ?auto_164622 ) ( ON-TABLE ?auto_164621 ) ( ON ?auto_164622 ?auto_164621 ) ( not ( = ?auto_164621 ?auto_164622 ) ) ( not ( = ?auto_164621 ?auto_164623 ) ) ( not ( = ?auto_164622 ?auto_164623 ) ) ( not ( = ?auto_164621 ?auto_164628 ) ) ( not ( = ?auto_164621 ?auto_164627 ) ) ( not ( = ?auto_164622 ?auto_164628 ) ) ( not ( = ?auto_164622 ?auto_164627 ) ) ( not ( = ?auto_164623 ?auto_164628 ) ) ( not ( = ?auto_164623 ?auto_164627 ) ) ( not ( = ?auto_164628 ?auto_164627 ) ) ( ON ?auto_164628 ?auto_164623 ) ( ON-TABLE ?auto_164624 ) ( not ( = ?auto_164624 ?auto_164626 ) ) ( not ( = ?auto_164624 ?auto_164625 ) ) ( not ( = ?auto_164624 ?auto_164627 ) ) ( not ( = ?auto_164626 ?auto_164625 ) ) ( not ( = ?auto_164626 ?auto_164627 ) ) ( not ( = ?auto_164625 ?auto_164627 ) ) ( not ( = ?auto_164621 ?auto_164625 ) ) ( not ( = ?auto_164621 ?auto_164624 ) ) ( not ( = ?auto_164621 ?auto_164626 ) ) ( not ( = ?auto_164622 ?auto_164625 ) ) ( not ( = ?auto_164622 ?auto_164624 ) ) ( not ( = ?auto_164622 ?auto_164626 ) ) ( not ( = ?auto_164623 ?auto_164625 ) ) ( not ( = ?auto_164623 ?auto_164624 ) ) ( not ( = ?auto_164623 ?auto_164626 ) ) ( not ( = ?auto_164628 ?auto_164625 ) ) ( not ( = ?auto_164628 ?auto_164624 ) ) ( not ( = ?auto_164628 ?auto_164626 ) ) ( ON ?auto_164627 ?auto_164628 ) ( ON ?auto_164625 ?auto_164627 ) ( CLEAR ?auto_164624 ) ( ON ?auto_164626 ?auto_164625 ) ( CLEAR ?auto_164626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164621 ?auto_164622 ?auto_164623 ?auto_164628 ?auto_164627 ?auto_164625 )
      ( MAKE-2PILE ?auto_164621 ?auto_164622 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164629 - BLOCK
      ?auto_164630 - BLOCK
    )
    :vars
    (
      ?auto_164634 - BLOCK
      ?auto_164632 - BLOCK
      ?auto_164631 - BLOCK
      ?auto_164636 - BLOCK
      ?auto_164633 - BLOCK
      ?auto_164635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164634 ?auto_164630 ) ( ON-TABLE ?auto_164629 ) ( ON ?auto_164630 ?auto_164629 ) ( not ( = ?auto_164629 ?auto_164630 ) ) ( not ( = ?auto_164629 ?auto_164634 ) ) ( not ( = ?auto_164630 ?auto_164634 ) ) ( not ( = ?auto_164629 ?auto_164632 ) ) ( not ( = ?auto_164629 ?auto_164631 ) ) ( not ( = ?auto_164630 ?auto_164632 ) ) ( not ( = ?auto_164630 ?auto_164631 ) ) ( not ( = ?auto_164634 ?auto_164632 ) ) ( not ( = ?auto_164634 ?auto_164631 ) ) ( not ( = ?auto_164632 ?auto_164631 ) ) ( ON ?auto_164632 ?auto_164634 ) ( not ( = ?auto_164636 ?auto_164633 ) ) ( not ( = ?auto_164636 ?auto_164635 ) ) ( not ( = ?auto_164636 ?auto_164631 ) ) ( not ( = ?auto_164633 ?auto_164635 ) ) ( not ( = ?auto_164633 ?auto_164631 ) ) ( not ( = ?auto_164635 ?auto_164631 ) ) ( not ( = ?auto_164629 ?auto_164635 ) ) ( not ( = ?auto_164629 ?auto_164636 ) ) ( not ( = ?auto_164629 ?auto_164633 ) ) ( not ( = ?auto_164630 ?auto_164635 ) ) ( not ( = ?auto_164630 ?auto_164636 ) ) ( not ( = ?auto_164630 ?auto_164633 ) ) ( not ( = ?auto_164634 ?auto_164635 ) ) ( not ( = ?auto_164634 ?auto_164636 ) ) ( not ( = ?auto_164634 ?auto_164633 ) ) ( not ( = ?auto_164632 ?auto_164635 ) ) ( not ( = ?auto_164632 ?auto_164636 ) ) ( not ( = ?auto_164632 ?auto_164633 ) ) ( ON ?auto_164631 ?auto_164632 ) ( ON ?auto_164635 ?auto_164631 ) ( ON ?auto_164633 ?auto_164635 ) ( CLEAR ?auto_164633 ) ( HOLDING ?auto_164636 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164636 )
      ( MAKE-2PILE ?auto_164629 ?auto_164630 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164647 - BLOCK
      ?auto_164648 - BLOCK
    )
    :vars
    (
      ?auto_164653 - BLOCK
      ?auto_164651 - BLOCK
      ?auto_164654 - BLOCK
      ?auto_164652 - BLOCK
      ?auto_164650 - BLOCK
      ?auto_164649 - BLOCK
      ?auto_164655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164653 ?auto_164648 ) ( ON-TABLE ?auto_164647 ) ( ON ?auto_164648 ?auto_164647 ) ( not ( = ?auto_164647 ?auto_164648 ) ) ( not ( = ?auto_164647 ?auto_164653 ) ) ( not ( = ?auto_164648 ?auto_164653 ) ) ( not ( = ?auto_164647 ?auto_164651 ) ) ( not ( = ?auto_164647 ?auto_164654 ) ) ( not ( = ?auto_164648 ?auto_164651 ) ) ( not ( = ?auto_164648 ?auto_164654 ) ) ( not ( = ?auto_164653 ?auto_164651 ) ) ( not ( = ?auto_164653 ?auto_164654 ) ) ( not ( = ?auto_164651 ?auto_164654 ) ) ( ON ?auto_164651 ?auto_164653 ) ( not ( = ?auto_164652 ?auto_164650 ) ) ( not ( = ?auto_164652 ?auto_164649 ) ) ( not ( = ?auto_164652 ?auto_164654 ) ) ( not ( = ?auto_164650 ?auto_164649 ) ) ( not ( = ?auto_164650 ?auto_164654 ) ) ( not ( = ?auto_164649 ?auto_164654 ) ) ( not ( = ?auto_164647 ?auto_164649 ) ) ( not ( = ?auto_164647 ?auto_164652 ) ) ( not ( = ?auto_164647 ?auto_164650 ) ) ( not ( = ?auto_164648 ?auto_164649 ) ) ( not ( = ?auto_164648 ?auto_164652 ) ) ( not ( = ?auto_164648 ?auto_164650 ) ) ( not ( = ?auto_164653 ?auto_164649 ) ) ( not ( = ?auto_164653 ?auto_164652 ) ) ( not ( = ?auto_164653 ?auto_164650 ) ) ( not ( = ?auto_164651 ?auto_164649 ) ) ( not ( = ?auto_164651 ?auto_164652 ) ) ( not ( = ?auto_164651 ?auto_164650 ) ) ( ON ?auto_164654 ?auto_164651 ) ( ON ?auto_164649 ?auto_164654 ) ( ON ?auto_164650 ?auto_164649 ) ( CLEAR ?auto_164650 ) ( ON ?auto_164652 ?auto_164655 ) ( CLEAR ?auto_164652 ) ( HAND-EMPTY ) ( not ( = ?auto_164647 ?auto_164655 ) ) ( not ( = ?auto_164648 ?auto_164655 ) ) ( not ( = ?auto_164653 ?auto_164655 ) ) ( not ( = ?auto_164651 ?auto_164655 ) ) ( not ( = ?auto_164654 ?auto_164655 ) ) ( not ( = ?auto_164652 ?auto_164655 ) ) ( not ( = ?auto_164650 ?auto_164655 ) ) ( not ( = ?auto_164649 ?auto_164655 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164652 ?auto_164655 )
      ( MAKE-2PILE ?auto_164647 ?auto_164648 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164656 - BLOCK
      ?auto_164657 - BLOCK
    )
    :vars
    (
      ?auto_164664 - BLOCK
      ?auto_164658 - BLOCK
      ?auto_164663 - BLOCK
      ?auto_164661 - BLOCK
      ?auto_164660 - BLOCK
      ?auto_164659 - BLOCK
      ?auto_164662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164664 ?auto_164657 ) ( ON-TABLE ?auto_164656 ) ( ON ?auto_164657 ?auto_164656 ) ( not ( = ?auto_164656 ?auto_164657 ) ) ( not ( = ?auto_164656 ?auto_164664 ) ) ( not ( = ?auto_164657 ?auto_164664 ) ) ( not ( = ?auto_164656 ?auto_164658 ) ) ( not ( = ?auto_164656 ?auto_164663 ) ) ( not ( = ?auto_164657 ?auto_164658 ) ) ( not ( = ?auto_164657 ?auto_164663 ) ) ( not ( = ?auto_164664 ?auto_164658 ) ) ( not ( = ?auto_164664 ?auto_164663 ) ) ( not ( = ?auto_164658 ?auto_164663 ) ) ( ON ?auto_164658 ?auto_164664 ) ( not ( = ?auto_164661 ?auto_164660 ) ) ( not ( = ?auto_164661 ?auto_164659 ) ) ( not ( = ?auto_164661 ?auto_164663 ) ) ( not ( = ?auto_164660 ?auto_164659 ) ) ( not ( = ?auto_164660 ?auto_164663 ) ) ( not ( = ?auto_164659 ?auto_164663 ) ) ( not ( = ?auto_164656 ?auto_164659 ) ) ( not ( = ?auto_164656 ?auto_164661 ) ) ( not ( = ?auto_164656 ?auto_164660 ) ) ( not ( = ?auto_164657 ?auto_164659 ) ) ( not ( = ?auto_164657 ?auto_164661 ) ) ( not ( = ?auto_164657 ?auto_164660 ) ) ( not ( = ?auto_164664 ?auto_164659 ) ) ( not ( = ?auto_164664 ?auto_164661 ) ) ( not ( = ?auto_164664 ?auto_164660 ) ) ( not ( = ?auto_164658 ?auto_164659 ) ) ( not ( = ?auto_164658 ?auto_164661 ) ) ( not ( = ?auto_164658 ?auto_164660 ) ) ( ON ?auto_164663 ?auto_164658 ) ( ON ?auto_164659 ?auto_164663 ) ( ON ?auto_164661 ?auto_164662 ) ( CLEAR ?auto_164661 ) ( not ( = ?auto_164656 ?auto_164662 ) ) ( not ( = ?auto_164657 ?auto_164662 ) ) ( not ( = ?auto_164664 ?auto_164662 ) ) ( not ( = ?auto_164658 ?auto_164662 ) ) ( not ( = ?auto_164663 ?auto_164662 ) ) ( not ( = ?auto_164661 ?auto_164662 ) ) ( not ( = ?auto_164660 ?auto_164662 ) ) ( not ( = ?auto_164659 ?auto_164662 ) ) ( HOLDING ?auto_164660 ) ( CLEAR ?auto_164659 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164656 ?auto_164657 ?auto_164664 ?auto_164658 ?auto_164663 ?auto_164659 ?auto_164660 )
      ( MAKE-2PILE ?auto_164656 ?auto_164657 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164665 - BLOCK
      ?auto_164666 - BLOCK
    )
    :vars
    (
      ?auto_164672 - BLOCK
      ?auto_164673 - BLOCK
      ?auto_164671 - BLOCK
      ?auto_164669 - BLOCK
      ?auto_164668 - BLOCK
      ?auto_164667 - BLOCK
      ?auto_164670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164672 ?auto_164666 ) ( ON-TABLE ?auto_164665 ) ( ON ?auto_164666 ?auto_164665 ) ( not ( = ?auto_164665 ?auto_164666 ) ) ( not ( = ?auto_164665 ?auto_164672 ) ) ( not ( = ?auto_164666 ?auto_164672 ) ) ( not ( = ?auto_164665 ?auto_164673 ) ) ( not ( = ?auto_164665 ?auto_164671 ) ) ( not ( = ?auto_164666 ?auto_164673 ) ) ( not ( = ?auto_164666 ?auto_164671 ) ) ( not ( = ?auto_164672 ?auto_164673 ) ) ( not ( = ?auto_164672 ?auto_164671 ) ) ( not ( = ?auto_164673 ?auto_164671 ) ) ( ON ?auto_164673 ?auto_164672 ) ( not ( = ?auto_164669 ?auto_164668 ) ) ( not ( = ?auto_164669 ?auto_164667 ) ) ( not ( = ?auto_164669 ?auto_164671 ) ) ( not ( = ?auto_164668 ?auto_164667 ) ) ( not ( = ?auto_164668 ?auto_164671 ) ) ( not ( = ?auto_164667 ?auto_164671 ) ) ( not ( = ?auto_164665 ?auto_164667 ) ) ( not ( = ?auto_164665 ?auto_164669 ) ) ( not ( = ?auto_164665 ?auto_164668 ) ) ( not ( = ?auto_164666 ?auto_164667 ) ) ( not ( = ?auto_164666 ?auto_164669 ) ) ( not ( = ?auto_164666 ?auto_164668 ) ) ( not ( = ?auto_164672 ?auto_164667 ) ) ( not ( = ?auto_164672 ?auto_164669 ) ) ( not ( = ?auto_164672 ?auto_164668 ) ) ( not ( = ?auto_164673 ?auto_164667 ) ) ( not ( = ?auto_164673 ?auto_164669 ) ) ( not ( = ?auto_164673 ?auto_164668 ) ) ( ON ?auto_164671 ?auto_164673 ) ( ON ?auto_164667 ?auto_164671 ) ( ON ?auto_164669 ?auto_164670 ) ( not ( = ?auto_164665 ?auto_164670 ) ) ( not ( = ?auto_164666 ?auto_164670 ) ) ( not ( = ?auto_164672 ?auto_164670 ) ) ( not ( = ?auto_164673 ?auto_164670 ) ) ( not ( = ?auto_164671 ?auto_164670 ) ) ( not ( = ?auto_164669 ?auto_164670 ) ) ( not ( = ?auto_164668 ?auto_164670 ) ) ( not ( = ?auto_164667 ?auto_164670 ) ) ( CLEAR ?auto_164667 ) ( ON ?auto_164668 ?auto_164669 ) ( CLEAR ?auto_164668 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164670 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164670 ?auto_164669 )
      ( MAKE-2PILE ?auto_164665 ?auto_164666 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164674 - BLOCK
      ?auto_164675 - BLOCK
    )
    :vars
    (
      ?auto_164677 - BLOCK
      ?auto_164682 - BLOCK
      ?auto_164681 - BLOCK
      ?auto_164678 - BLOCK
      ?auto_164680 - BLOCK
      ?auto_164676 - BLOCK
      ?auto_164679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164677 ?auto_164675 ) ( ON-TABLE ?auto_164674 ) ( ON ?auto_164675 ?auto_164674 ) ( not ( = ?auto_164674 ?auto_164675 ) ) ( not ( = ?auto_164674 ?auto_164677 ) ) ( not ( = ?auto_164675 ?auto_164677 ) ) ( not ( = ?auto_164674 ?auto_164682 ) ) ( not ( = ?auto_164674 ?auto_164681 ) ) ( not ( = ?auto_164675 ?auto_164682 ) ) ( not ( = ?auto_164675 ?auto_164681 ) ) ( not ( = ?auto_164677 ?auto_164682 ) ) ( not ( = ?auto_164677 ?auto_164681 ) ) ( not ( = ?auto_164682 ?auto_164681 ) ) ( ON ?auto_164682 ?auto_164677 ) ( not ( = ?auto_164678 ?auto_164680 ) ) ( not ( = ?auto_164678 ?auto_164676 ) ) ( not ( = ?auto_164678 ?auto_164681 ) ) ( not ( = ?auto_164680 ?auto_164676 ) ) ( not ( = ?auto_164680 ?auto_164681 ) ) ( not ( = ?auto_164676 ?auto_164681 ) ) ( not ( = ?auto_164674 ?auto_164676 ) ) ( not ( = ?auto_164674 ?auto_164678 ) ) ( not ( = ?auto_164674 ?auto_164680 ) ) ( not ( = ?auto_164675 ?auto_164676 ) ) ( not ( = ?auto_164675 ?auto_164678 ) ) ( not ( = ?auto_164675 ?auto_164680 ) ) ( not ( = ?auto_164677 ?auto_164676 ) ) ( not ( = ?auto_164677 ?auto_164678 ) ) ( not ( = ?auto_164677 ?auto_164680 ) ) ( not ( = ?auto_164682 ?auto_164676 ) ) ( not ( = ?auto_164682 ?auto_164678 ) ) ( not ( = ?auto_164682 ?auto_164680 ) ) ( ON ?auto_164681 ?auto_164682 ) ( ON ?auto_164678 ?auto_164679 ) ( not ( = ?auto_164674 ?auto_164679 ) ) ( not ( = ?auto_164675 ?auto_164679 ) ) ( not ( = ?auto_164677 ?auto_164679 ) ) ( not ( = ?auto_164682 ?auto_164679 ) ) ( not ( = ?auto_164681 ?auto_164679 ) ) ( not ( = ?auto_164678 ?auto_164679 ) ) ( not ( = ?auto_164680 ?auto_164679 ) ) ( not ( = ?auto_164676 ?auto_164679 ) ) ( ON ?auto_164680 ?auto_164678 ) ( CLEAR ?auto_164680 ) ( ON-TABLE ?auto_164679 ) ( HOLDING ?auto_164676 ) ( CLEAR ?auto_164681 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164674 ?auto_164675 ?auto_164677 ?auto_164682 ?auto_164681 ?auto_164676 )
      ( MAKE-2PILE ?auto_164674 ?auto_164675 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164683 - BLOCK
      ?auto_164684 - BLOCK
    )
    :vars
    (
      ?auto_164686 - BLOCK
      ?auto_164685 - BLOCK
      ?auto_164690 - BLOCK
      ?auto_164688 - BLOCK
      ?auto_164689 - BLOCK
      ?auto_164691 - BLOCK
      ?auto_164687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164686 ?auto_164684 ) ( ON-TABLE ?auto_164683 ) ( ON ?auto_164684 ?auto_164683 ) ( not ( = ?auto_164683 ?auto_164684 ) ) ( not ( = ?auto_164683 ?auto_164686 ) ) ( not ( = ?auto_164684 ?auto_164686 ) ) ( not ( = ?auto_164683 ?auto_164685 ) ) ( not ( = ?auto_164683 ?auto_164690 ) ) ( not ( = ?auto_164684 ?auto_164685 ) ) ( not ( = ?auto_164684 ?auto_164690 ) ) ( not ( = ?auto_164686 ?auto_164685 ) ) ( not ( = ?auto_164686 ?auto_164690 ) ) ( not ( = ?auto_164685 ?auto_164690 ) ) ( ON ?auto_164685 ?auto_164686 ) ( not ( = ?auto_164688 ?auto_164689 ) ) ( not ( = ?auto_164688 ?auto_164691 ) ) ( not ( = ?auto_164688 ?auto_164690 ) ) ( not ( = ?auto_164689 ?auto_164691 ) ) ( not ( = ?auto_164689 ?auto_164690 ) ) ( not ( = ?auto_164691 ?auto_164690 ) ) ( not ( = ?auto_164683 ?auto_164691 ) ) ( not ( = ?auto_164683 ?auto_164688 ) ) ( not ( = ?auto_164683 ?auto_164689 ) ) ( not ( = ?auto_164684 ?auto_164691 ) ) ( not ( = ?auto_164684 ?auto_164688 ) ) ( not ( = ?auto_164684 ?auto_164689 ) ) ( not ( = ?auto_164686 ?auto_164691 ) ) ( not ( = ?auto_164686 ?auto_164688 ) ) ( not ( = ?auto_164686 ?auto_164689 ) ) ( not ( = ?auto_164685 ?auto_164691 ) ) ( not ( = ?auto_164685 ?auto_164688 ) ) ( not ( = ?auto_164685 ?auto_164689 ) ) ( ON ?auto_164690 ?auto_164685 ) ( ON ?auto_164688 ?auto_164687 ) ( not ( = ?auto_164683 ?auto_164687 ) ) ( not ( = ?auto_164684 ?auto_164687 ) ) ( not ( = ?auto_164686 ?auto_164687 ) ) ( not ( = ?auto_164685 ?auto_164687 ) ) ( not ( = ?auto_164690 ?auto_164687 ) ) ( not ( = ?auto_164688 ?auto_164687 ) ) ( not ( = ?auto_164689 ?auto_164687 ) ) ( not ( = ?auto_164691 ?auto_164687 ) ) ( ON ?auto_164689 ?auto_164688 ) ( ON-TABLE ?auto_164687 ) ( CLEAR ?auto_164690 ) ( ON ?auto_164691 ?auto_164689 ) ( CLEAR ?auto_164691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164687 ?auto_164688 ?auto_164689 )
      ( MAKE-2PILE ?auto_164683 ?auto_164684 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164741 - BLOCK
      ?auto_164742 - BLOCK
      ?auto_164743 - BLOCK
      ?auto_164744 - BLOCK
      ?auto_164745 - BLOCK
      ?auto_164746 - BLOCK
    )
    :vars
    (
      ?auto_164747 - BLOCK
      ?auto_164748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164741 ) ( ON ?auto_164742 ?auto_164741 ) ( ON ?auto_164743 ?auto_164742 ) ( ON ?auto_164744 ?auto_164743 ) ( not ( = ?auto_164741 ?auto_164742 ) ) ( not ( = ?auto_164741 ?auto_164743 ) ) ( not ( = ?auto_164741 ?auto_164744 ) ) ( not ( = ?auto_164741 ?auto_164745 ) ) ( not ( = ?auto_164741 ?auto_164746 ) ) ( not ( = ?auto_164742 ?auto_164743 ) ) ( not ( = ?auto_164742 ?auto_164744 ) ) ( not ( = ?auto_164742 ?auto_164745 ) ) ( not ( = ?auto_164742 ?auto_164746 ) ) ( not ( = ?auto_164743 ?auto_164744 ) ) ( not ( = ?auto_164743 ?auto_164745 ) ) ( not ( = ?auto_164743 ?auto_164746 ) ) ( not ( = ?auto_164744 ?auto_164745 ) ) ( not ( = ?auto_164744 ?auto_164746 ) ) ( not ( = ?auto_164745 ?auto_164746 ) ) ( ON ?auto_164746 ?auto_164747 ) ( not ( = ?auto_164741 ?auto_164747 ) ) ( not ( = ?auto_164742 ?auto_164747 ) ) ( not ( = ?auto_164743 ?auto_164747 ) ) ( not ( = ?auto_164744 ?auto_164747 ) ) ( not ( = ?auto_164745 ?auto_164747 ) ) ( not ( = ?auto_164746 ?auto_164747 ) ) ( CLEAR ?auto_164744 ) ( ON ?auto_164745 ?auto_164746 ) ( CLEAR ?auto_164745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164748 ) ( ON ?auto_164747 ?auto_164748 ) ( not ( = ?auto_164748 ?auto_164747 ) ) ( not ( = ?auto_164748 ?auto_164746 ) ) ( not ( = ?auto_164748 ?auto_164745 ) ) ( not ( = ?auto_164741 ?auto_164748 ) ) ( not ( = ?auto_164742 ?auto_164748 ) ) ( not ( = ?auto_164743 ?auto_164748 ) ) ( not ( = ?auto_164744 ?auto_164748 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164748 ?auto_164747 ?auto_164746 )
      ( MAKE-6PILE ?auto_164741 ?auto_164742 ?auto_164743 ?auto_164744 ?auto_164745 ?auto_164746 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164749 - BLOCK
      ?auto_164750 - BLOCK
      ?auto_164751 - BLOCK
      ?auto_164752 - BLOCK
      ?auto_164753 - BLOCK
      ?auto_164754 - BLOCK
    )
    :vars
    (
      ?auto_164755 - BLOCK
      ?auto_164756 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164749 ) ( ON ?auto_164750 ?auto_164749 ) ( ON ?auto_164751 ?auto_164750 ) ( not ( = ?auto_164749 ?auto_164750 ) ) ( not ( = ?auto_164749 ?auto_164751 ) ) ( not ( = ?auto_164749 ?auto_164752 ) ) ( not ( = ?auto_164749 ?auto_164753 ) ) ( not ( = ?auto_164749 ?auto_164754 ) ) ( not ( = ?auto_164750 ?auto_164751 ) ) ( not ( = ?auto_164750 ?auto_164752 ) ) ( not ( = ?auto_164750 ?auto_164753 ) ) ( not ( = ?auto_164750 ?auto_164754 ) ) ( not ( = ?auto_164751 ?auto_164752 ) ) ( not ( = ?auto_164751 ?auto_164753 ) ) ( not ( = ?auto_164751 ?auto_164754 ) ) ( not ( = ?auto_164752 ?auto_164753 ) ) ( not ( = ?auto_164752 ?auto_164754 ) ) ( not ( = ?auto_164753 ?auto_164754 ) ) ( ON ?auto_164754 ?auto_164755 ) ( not ( = ?auto_164749 ?auto_164755 ) ) ( not ( = ?auto_164750 ?auto_164755 ) ) ( not ( = ?auto_164751 ?auto_164755 ) ) ( not ( = ?auto_164752 ?auto_164755 ) ) ( not ( = ?auto_164753 ?auto_164755 ) ) ( not ( = ?auto_164754 ?auto_164755 ) ) ( ON ?auto_164753 ?auto_164754 ) ( CLEAR ?auto_164753 ) ( ON-TABLE ?auto_164756 ) ( ON ?auto_164755 ?auto_164756 ) ( not ( = ?auto_164756 ?auto_164755 ) ) ( not ( = ?auto_164756 ?auto_164754 ) ) ( not ( = ?auto_164756 ?auto_164753 ) ) ( not ( = ?auto_164749 ?auto_164756 ) ) ( not ( = ?auto_164750 ?auto_164756 ) ) ( not ( = ?auto_164751 ?auto_164756 ) ) ( not ( = ?auto_164752 ?auto_164756 ) ) ( HOLDING ?auto_164752 ) ( CLEAR ?auto_164751 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164749 ?auto_164750 ?auto_164751 ?auto_164752 )
      ( MAKE-6PILE ?auto_164749 ?auto_164750 ?auto_164751 ?auto_164752 ?auto_164753 ?auto_164754 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164757 - BLOCK
      ?auto_164758 - BLOCK
      ?auto_164759 - BLOCK
      ?auto_164760 - BLOCK
      ?auto_164761 - BLOCK
      ?auto_164762 - BLOCK
    )
    :vars
    (
      ?auto_164763 - BLOCK
      ?auto_164764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164757 ) ( ON ?auto_164758 ?auto_164757 ) ( ON ?auto_164759 ?auto_164758 ) ( not ( = ?auto_164757 ?auto_164758 ) ) ( not ( = ?auto_164757 ?auto_164759 ) ) ( not ( = ?auto_164757 ?auto_164760 ) ) ( not ( = ?auto_164757 ?auto_164761 ) ) ( not ( = ?auto_164757 ?auto_164762 ) ) ( not ( = ?auto_164758 ?auto_164759 ) ) ( not ( = ?auto_164758 ?auto_164760 ) ) ( not ( = ?auto_164758 ?auto_164761 ) ) ( not ( = ?auto_164758 ?auto_164762 ) ) ( not ( = ?auto_164759 ?auto_164760 ) ) ( not ( = ?auto_164759 ?auto_164761 ) ) ( not ( = ?auto_164759 ?auto_164762 ) ) ( not ( = ?auto_164760 ?auto_164761 ) ) ( not ( = ?auto_164760 ?auto_164762 ) ) ( not ( = ?auto_164761 ?auto_164762 ) ) ( ON ?auto_164762 ?auto_164763 ) ( not ( = ?auto_164757 ?auto_164763 ) ) ( not ( = ?auto_164758 ?auto_164763 ) ) ( not ( = ?auto_164759 ?auto_164763 ) ) ( not ( = ?auto_164760 ?auto_164763 ) ) ( not ( = ?auto_164761 ?auto_164763 ) ) ( not ( = ?auto_164762 ?auto_164763 ) ) ( ON ?auto_164761 ?auto_164762 ) ( ON-TABLE ?auto_164764 ) ( ON ?auto_164763 ?auto_164764 ) ( not ( = ?auto_164764 ?auto_164763 ) ) ( not ( = ?auto_164764 ?auto_164762 ) ) ( not ( = ?auto_164764 ?auto_164761 ) ) ( not ( = ?auto_164757 ?auto_164764 ) ) ( not ( = ?auto_164758 ?auto_164764 ) ) ( not ( = ?auto_164759 ?auto_164764 ) ) ( not ( = ?auto_164760 ?auto_164764 ) ) ( CLEAR ?auto_164759 ) ( ON ?auto_164760 ?auto_164761 ) ( CLEAR ?auto_164760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164764 ?auto_164763 ?auto_164762 ?auto_164761 )
      ( MAKE-6PILE ?auto_164757 ?auto_164758 ?auto_164759 ?auto_164760 ?auto_164761 ?auto_164762 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164765 - BLOCK
      ?auto_164766 - BLOCK
      ?auto_164767 - BLOCK
      ?auto_164768 - BLOCK
      ?auto_164769 - BLOCK
      ?auto_164770 - BLOCK
    )
    :vars
    (
      ?auto_164772 - BLOCK
      ?auto_164771 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164765 ) ( ON ?auto_164766 ?auto_164765 ) ( not ( = ?auto_164765 ?auto_164766 ) ) ( not ( = ?auto_164765 ?auto_164767 ) ) ( not ( = ?auto_164765 ?auto_164768 ) ) ( not ( = ?auto_164765 ?auto_164769 ) ) ( not ( = ?auto_164765 ?auto_164770 ) ) ( not ( = ?auto_164766 ?auto_164767 ) ) ( not ( = ?auto_164766 ?auto_164768 ) ) ( not ( = ?auto_164766 ?auto_164769 ) ) ( not ( = ?auto_164766 ?auto_164770 ) ) ( not ( = ?auto_164767 ?auto_164768 ) ) ( not ( = ?auto_164767 ?auto_164769 ) ) ( not ( = ?auto_164767 ?auto_164770 ) ) ( not ( = ?auto_164768 ?auto_164769 ) ) ( not ( = ?auto_164768 ?auto_164770 ) ) ( not ( = ?auto_164769 ?auto_164770 ) ) ( ON ?auto_164770 ?auto_164772 ) ( not ( = ?auto_164765 ?auto_164772 ) ) ( not ( = ?auto_164766 ?auto_164772 ) ) ( not ( = ?auto_164767 ?auto_164772 ) ) ( not ( = ?auto_164768 ?auto_164772 ) ) ( not ( = ?auto_164769 ?auto_164772 ) ) ( not ( = ?auto_164770 ?auto_164772 ) ) ( ON ?auto_164769 ?auto_164770 ) ( ON-TABLE ?auto_164771 ) ( ON ?auto_164772 ?auto_164771 ) ( not ( = ?auto_164771 ?auto_164772 ) ) ( not ( = ?auto_164771 ?auto_164770 ) ) ( not ( = ?auto_164771 ?auto_164769 ) ) ( not ( = ?auto_164765 ?auto_164771 ) ) ( not ( = ?auto_164766 ?auto_164771 ) ) ( not ( = ?auto_164767 ?auto_164771 ) ) ( not ( = ?auto_164768 ?auto_164771 ) ) ( ON ?auto_164768 ?auto_164769 ) ( CLEAR ?auto_164768 ) ( HOLDING ?auto_164767 ) ( CLEAR ?auto_164766 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164765 ?auto_164766 ?auto_164767 )
      ( MAKE-6PILE ?auto_164765 ?auto_164766 ?auto_164767 ?auto_164768 ?auto_164769 ?auto_164770 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164773 - BLOCK
      ?auto_164774 - BLOCK
      ?auto_164775 - BLOCK
      ?auto_164776 - BLOCK
      ?auto_164777 - BLOCK
      ?auto_164778 - BLOCK
    )
    :vars
    (
      ?auto_164780 - BLOCK
      ?auto_164779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164773 ) ( ON ?auto_164774 ?auto_164773 ) ( not ( = ?auto_164773 ?auto_164774 ) ) ( not ( = ?auto_164773 ?auto_164775 ) ) ( not ( = ?auto_164773 ?auto_164776 ) ) ( not ( = ?auto_164773 ?auto_164777 ) ) ( not ( = ?auto_164773 ?auto_164778 ) ) ( not ( = ?auto_164774 ?auto_164775 ) ) ( not ( = ?auto_164774 ?auto_164776 ) ) ( not ( = ?auto_164774 ?auto_164777 ) ) ( not ( = ?auto_164774 ?auto_164778 ) ) ( not ( = ?auto_164775 ?auto_164776 ) ) ( not ( = ?auto_164775 ?auto_164777 ) ) ( not ( = ?auto_164775 ?auto_164778 ) ) ( not ( = ?auto_164776 ?auto_164777 ) ) ( not ( = ?auto_164776 ?auto_164778 ) ) ( not ( = ?auto_164777 ?auto_164778 ) ) ( ON ?auto_164778 ?auto_164780 ) ( not ( = ?auto_164773 ?auto_164780 ) ) ( not ( = ?auto_164774 ?auto_164780 ) ) ( not ( = ?auto_164775 ?auto_164780 ) ) ( not ( = ?auto_164776 ?auto_164780 ) ) ( not ( = ?auto_164777 ?auto_164780 ) ) ( not ( = ?auto_164778 ?auto_164780 ) ) ( ON ?auto_164777 ?auto_164778 ) ( ON-TABLE ?auto_164779 ) ( ON ?auto_164780 ?auto_164779 ) ( not ( = ?auto_164779 ?auto_164780 ) ) ( not ( = ?auto_164779 ?auto_164778 ) ) ( not ( = ?auto_164779 ?auto_164777 ) ) ( not ( = ?auto_164773 ?auto_164779 ) ) ( not ( = ?auto_164774 ?auto_164779 ) ) ( not ( = ?auto_164775 ?auto_164779 ) ) ( not ( = ?auto_164776 ?auto_164779 ) ) ( ON ?auto_164776 ?auto_164777 ) ( CLEAR ?auto_164774 ) ( ON ?auto_164775 ?auto_164776 ) ( CLEAR ?auto_164775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164779 ?auto_164780 ?auto_164778 ?auto_164777 ?auto_164776 )
      ( MAKE-6PILE ?auto_164773 ?auto_164774 ?auto_164775 ?auto_164776 ?auto_164777 ?auto_164778 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164781 - BLOCK
      ?auto_164782 - BLOCK
      ?auto_164783 - BLOCK
      ?auto_164784 - BLOCK
      ?auto_164785 - BLOCK
      ?auto_164786 - BLOCK
    )
    :vars
    (
      ?auto_164787 - BLOCK
      ?auto_164788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164781 ) ( not ( = ?auto_164781 ?auto_164782 ) ) ( not ( = ?auto_164781 ?auto_164783 ) ) ( not ( = ?auto_164781 ?auto_164784 ) ) ( not ( = ?auto_164781 ?auto_164785 ) ) ( not ( = ?auto_164781 ?auto_164786 ) ) ( not ( = ?auto_164782 ?auto_164783 ) ) ( not ( = ?auto_164782 ?auto_164784 ) ) ( not ( = ?auto_164782 ?auto_164785 ) ) ( not ( = ?auto_164782 ?auto_164786 ) ) ( not ( = ?auto_164783 ?auto_164784 ) ) ( not ( = ?auto_164783 ?auto_164785 ) ) ( not ( = ?auto_164783 ?auto_164786 ) ) ( not ( = ?auto_164784 ?auto_164785 ) ) ( not ( = ?auto_164784 ?auto_164786 ) ) ( not ( = ?auto_164785 ?auto_164786 ) ) ( ON ?auto_164786 ?auto_164787 ) ( not ( = ?auto_164781 ?auto_164787 ) ) ( not ( = ?auto_164782 ?auto_164787 ) ) ( not ( = ?auto_164783 ?auto_164787 ) ) ( not ( = ?auto_164784 ?auto_164787 ) ) ( not ( = ?auto_164785 ?auto_164787 ) ) ( not ( = ?auto_164786 ?auto_164787 ) ) ( ON ?auto_164785 ?auto_164786 ) ( ON-TABLE ?auto_164788 ) ( ON ?auto_164787 ?auto_164788 ) ( not ( = ?auto_164788 ?auto_164787 ) ) ( not ( = ?auto_164788 ?auto_164786 ) ) ( not ( = ?auto_164788 ?auto_164785 ) ) ( not ( = ?auto_164781 ?auto_164788 ) ) ( not ( = ?auto_164782 ?auto_164788 ) ) ( not ( = ?auto_164783 ?auto_164788 ) ) ( not ( = ?auto_164784 ?auto_164788 ) ) ( ON ?auto_164784 ?auto_164785 ) ( ON ?auto_164783 ?auto_164784 ) ( CLEAR ?auto_164783 ) ( HOLDING ?auto_164782 ) ( CLEAR ?auto_164781 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164781 ?auto_164782 )
      ( MAKE-6PILE ?auto_164781 ?auto_164782 ?auto_164783 ?auto_164784 ?auto_164785 ?auto_164786 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164789 - BLOCK
      ?auto_164790 - BLOCK
      ?auto_164791 - BLOCK
      ?auto_164792 - BLOCK
      ?auto_164793 - BLOCK
      ?auto_164794 - BLOCK
    )
    :vars
    (
      ?auto_164795 - BLOCK
      ?auto_164796 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164789 ) ( not ( = ?auto_164789 ?auto_164790 ) ) ( not ( = ?auto_164789 ?auto_164791 ) ) ( not ( = ?auto_164789 ?auto_164792 ) ) ( not ( = ?auto_164789 ?auto_164793 ) ) ( not ( = ?auto_164789 ?auto_164794 ) ) ( not ( = ?auto_164790 ?auto_164791 ) ) ( not ( = ?auto_164790 ?auto_164792 ) ) ( not ( = ?auto_164790 ?auto_164793 ) ) ( not ( = ?auto_164790 ?auto_164794 ) ) ( not ( = ?auto_164791 ?auto_164792 ) ) ( not ( = ?auto_164791 ?auto_164793 ) ) ( not ( = ?auto_164791 ?auto_164794 ) ) ( not ( = ?auto_164792 ?auto_164793 ) ) ( not ( = ?auto_164792 ?auto_164794 ) ) ( not ( = ?auto_164793 ?auto_164794 ) ) ( ON ?auto_164794 ?auto_164795 ) ( not ( = ?auto_164789 ?auto_164795 ) ) ( not ( = ?auto_164790 ?auto_164795 ) ) ( not ( = ?auto_164791 ?auto_164795 ) ) ( not ( = ?auto_164792 ?auto_164795 ) ) ( not ( = ?auto_164793 ?auto_164795 ) ) ( not ( = ?auto_164794 ?auto_164795 ) ) ( ON ?auto_164793 ?auto_164794 ) ( ON-TABLE ?auto_164796 ) ( ON ?auto_164795 ?auto_164796 ) ( not ( = ?auto_164796 ?auto_164795 ) ) ( not ( = ?auto_164796 ?auto_164794 ) ) ( not ( = ?auto_164796 ?auto_164793 ) ) ( not ( = ?auto_164789 ?auto_164796 ) ) ( not ( = ?auto_164790 ?auto_164796 ) ) ( not ( = ?auto_164791 ?auto_164796 ) ) ( not ( = ?auto_164792 ?auto_164796 ) ) ( ON ?auto_164792 ?auto_164793 ) ( ON ?auto_164791 ?auto_164792 ) ( CLEAR ?auto_164789 ) ( ON ?auto_164790 ?auto_164791 ) ( CLEAR ?auto_164790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164796 ?auto_164795 ?auto_164794 ?auto_164793 ?auto_164792 ?auto_164791 )
      ( MAKE-6PILE ?auto_164789 ?auto_164790 ?auto_164791 ?auto_164792 ?auto_164793 ?auto_164794 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164797 - BLOCK
      ?auto_164798 - BLOCK
      ?auto_164799 - BLOCK
      ?auto_164800 - BLOCK
      ?auto_164801 - BLOCK
      ?auto_164802 - BLOCK
    )
    :vars
    (
      ?auto_164803 - BLOCK
      ?auto_164804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164797 ?auto_164798 ) ) ( not ( = ?auto_164797 ?auto_164799 ) ) ( not ( = ?auto_164797 ?auto_164800 ) ) ( not ( = ?auto_164797 ?auto_164801 ) ) ( not ( = ?auto_164797 ?auto_164802 ) ) ( not ( = ?auto_164798 ?auto_164799 ) ) ( not ( = ?auto_164798 ?auto_164800 ) ) ( not ( = ?auto_164798 ?auto_164801 ) ) ( not ( = ?auto_164798 ?auto_164802 ) ) ( not ( = ?auto_164799 ?auto_164800 ) ) ( not ( = ?auto_164799 ?auto_164801 ) ) ( not ( = ?auto_164799 ?auto_164802 ) ) ( not ( = ?auto_164800 ?auto_164801 ) ) ( not ( = ?auto_164800 ?auto_164802 ) ) ( not ( = ?auto_164801 ?auto_164802 ) ) ( ON ?auto_164802 ?auto_164803 ) ( not ( = ?auto_164797 ?auto_164803 ) ) ( not ( = ?auto_164798 ?auto_164803 ) ) ( not ( = ?auto_164799 ?auto_164803 ) ) ( not ( = ?auto_164800 ?auto_164803 ) ) ( not ( = ?auto_164801 ?auto_164803 ) ) ( not ( = ?auto_164802 ?auto_164803 ) ) ( ON ?auto_164801 ?auto_164802 ) ( ON-TABLE ?auto_164804 ) ( ON ?auto_164803 ?auto_164804 ) ( not ( = ?auto_164804 ?auto_164803 ) ) ( not ( = ?auto_164804 ?auto_164802 ) ) ( not ( = ?auto_164804 ?auto_164801 ) ) ( not ( = ?auto_164797 ?auto_164804 ) ) ( not ( = ?auto_164798 ?auto_164804 ) ) ( not ( = ?auto_164799 ?auto_164804 ) ) ( not ( = ?auto_164800 ?auto_164804 ) ) ( ON ?auto_164800 ?auto_164801 ) ( ON ?auto_164799 ?auto_164800 ) ( ON ?auto_164798 ?auto_164799 ) ( CLEAR ?auto_164798 ) ( HOLDING ?auto_164797 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164797 )
      ( MAKE-6PILE ?auto_164797 ?auto_164798 ?auto_164799 ?auto_164800 ?auto_164801 ?auto_164802 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164805 - BLOCK
      ?auto_164806 - BLOCK
      ?auto_164807 - BLOCK
      ?auto_164808 - BLOCK
      ?auto_164809 - BLOCK
      ?auto_164810 - BLOCK
    )
    :vars
    (
      ?auto_164811 - BLOCK
      ?auto_164812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164805 ?auto_164806 ) ) ( not ( = ?auto_164805 ?auto_164807 ) ) ( not ( = ?auto_164805 ?auto_164808 ) ) ( not ( = ?auto_164805 ?auto_164809 ) ) ( not ( = ?auto_164805 ?auto_164810 ) ) ( not ( = ?auto_164806 ?auto_164807 ) ) ( not ( = ?auto_164806 ?auto_164808 ) ) ( not ( = ?auto_164806 ?auto_164809 ) ) ( not ( = ?auto_164806 ?auto_164810 ) ) ( not ( = ?auto_164807 ?auto_164808 ) ) ( not ( = ?auto_164807 ?auto_164809 ) ) ( not ( = ?auto_164807 ?auto_164810 ) ) ( not ( = ?auto_164808 ?auto_164809 ) ) ( not ( = ?auto_164808 ?auto_164810 ) ) ( not ( = ?auto_164809 ?auto_164810 ) ) ( ON ?auto_164810 ?auto_164811 ) ( not ( = ?auto_164805 ?auto_164811 ) ) ( not ( = ?auto_164806 ?auto_164811 ) ) ( not ( = ?auto_164807 ?auto_164811 ) ) ( not ( = ?auto_164808 ?auto_164811 ) ) ( not ( = ?auto_164809 ?auto_164811 ) ) ( not ( = ?auto_164810 ?auto_164811 ) ) ( ON ?auto_164809 ?auto_164810 ) ( ON-TABLE ?auto_164812 ) ( ON ?auto_164811 ?auto_164812 ) ( not ( = ?auto_164812 ?auto_164811 ) ) ( not ( = ?auto_164812 ?auto_164810 ) ) ( not ( = ?auto_164812 ?auto_164809 ) ) ( not ( = ?auto_164805 ?auto_164812 ) ) ( not ( = ?auto_164806 ?auto_164812 ) ) ( not ( = ?auto_164807 ?auto_164812 ) ) ( not ( = ?auto_164808 ?auto_164812 ) ) ( ON ?auto_164808 ?auto_164809 ) ( ON ?auto_164807 ?auto_164808 ) ( ON ?auto_164806 ?auto_164807 ) ( ON ?auto_164805 ?auto_164806 ) ( CLEAR ?auto_164805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164812 ?auto_164811 ?auto_164810 ?auto_164809 ?auto_164808 ?auto_164807 ?auto_164806 )
      ( MAKE-6PILE ?auto_164805 ?auto_164806 ?auto_164807 ?auto_164808 ?auto_164809 ?auto_164810 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164819 - BLOCK
      ?auto_164820 - BLOCK
      ?auto_164821 - BLOCK
      ?auto_164822 - BLOCK
      ?auto_164823 - BLOCK
      ?auto_164824 - BLOCK
    )
    :vars
    (
      ?auto_164825 - BLOCK
      ?auto_164826 - BLOCK
      ?auto_164827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164819 ?auto_164820 ) ) ( not ( = ?auto_164819 ?auto_164821 ) ) ( not ( = ?auto_164819 ?auto_164822 ) ) ( not ( = ?auto_164819 ?auto_164823 ) ) ( not ( = ?auto_164819 ?auto_164824 ) ) ( not ( = ?auto_164820 ?auto_164821 ) ) ( not ( = ?auto_164820 ?auto_164822 ) ) ( not ( = ?auto_164820 ?auto_164823 ) ) ( not ( = ?auto_164820 ?auto_164824 ) ) ( not ( = ?auto_164821 ?auto_164822 ) ) ( not ( = ?auto_164821 ?auto_164823 ) ) ( not ( = ?auto_164821 ?auto_164824 ) ) ( not ( = ?auto_164822 ?auto_164823 ) ) ( not ( = ?auto_164822 ?auto_164824 ) ) ( not ( = ?auto_164823 ?auto_164824 ) ) ( ON ?auto_164824 ?auto_164825 ) ( not ( = ?auto_164819 ?auto_164825 ) ) ( not ( = ?auto_164820 ?auto_164825 ) ) ( not ( = ?auto_164821 ?auto_164825 ) ) ( not ( = ?auto_164822 ?auto_164825 ) ) ( not ( = ?auto_164823 ?auto_164825 ) ) ( not ( = ?auto_164824 ?auto_164825 ) ) ( ON ?auto_164823 ?auto_164824 ) ( ON-TABLE ?auto_164826 ) ( ON ?auto_164825 ?auto_164826 ) ( not ( = ?auto_164826 ?auto_164825 ) ) ( not ( = ?auto_164826 ?auto_164824 ) ) ( not ( = ?auto_164826 ?auto_164823 ) ) ( not ( = ?auto_164819 ?auto_164826 ) ) ( not ( = ?auto_164820 ?auto_164826 ) ) ( not ( = ?auto_164821 ?auto_164826 ) ) ( not ( = ?auto_164822 ?auto_164826 ) ) ( ON ?auto_164822 ?auto_164823 ) ( ON ?auto_164821 ?auto_164822 ) ( ON ?auto_164820 ?auto_164821 ) ( CLEAR ?auto_164820 ) ( ON ?auto_164819 ?auto_164827 ) ( CLEAR ?auto_164819 ) ( HAND-EMPTY ) ( not ( = ?auto_164819 ?auto_164827 ) ) ( not ( = ?auto_164820 ?auto_164827 ) ) ( not ( = ?auto_164821 ?auto_164827 ) ) ( not ( = ?auto_164822 ?auto_164827 ) ) ( not ( = ?auto_164823 ?auto_164827 ) ) ( not ( = ?auto_164824 ?auto_164827 ) ) ( not ( = ?auto_164825 ?auto_164827 ) ) ( not ( = ?auto_164826 ?auto_164827 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164819 ?auto_164827 )
      ( MAKE-6PILE ?auto_164819 ?auto_164820 ?auto_164821 ?auto_164822 ?auto_164823 ?auto_164824 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164828 - BLOCK
      ?auto_164829 - BLOCK
      ?auto_164830 - BLOCK
      ?auto_164831 - BLOCK
      ?auto_164832 - BLOCK
      ?auto_164833 - BLOCK
    )
    :vars
    (
      ?auto_164834 - BLOCK
      ?auto_164835 - BLOCK
      ?auto_164836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164828 ?auto_164829 ) ) ( not ( = ?auto_164828 ?auto_164830 ) ) ( not ( = ?auto_164828 ?auto_164831 ) ) ( not ( = ?auto_164828 ?auto_164832 ) ) ( not ( = ?auto_164828 ?auto_164833 ) ) ( not ( = ?auto_164829 ?auto_164830 ) ) ( not ( = ?auto_164829 ?auto_164831 ) ) ( not ( = ?auto_164829 ?auto_164832 ) ) ( not ( = ?auto_164829 ?auto_164833 ) ) ( not ( = ?auto_164830 ?auto_164831 ) ) ( not ( = ?auto_164830 ?auto_164832 ) ) ( not ( = ?auto_164830 ?auto_164833 ) ) ( not ( = ?auto_164831 ?auto_164832 ) ) ( not ( = ?auto_164831 ?auto_164833 ) ) ( not ( = ?auto_164832 ?auto_164833 ) ) ( ON ?auto_164833 ?auto_164834 ) ( not ( = ?auto_164828 ?auto_164834 ) ) ( not ( = ?auto_164829 ?auto_164834 ) ) ( not ( = ?auto_164830 ?auto_164834 ) ) ( not ( = ?auto_164831 ?auto_164834 ) ) ( not ( = ?auto_164832 ?auto_164834 ) ) ( not ( = ?auto_164833 ?auto_164834 ) ) ( ON ?auto_164832 ?auto_164833 ) ( ON-TABLE ?auto_164835 ) ( ON ?auto_164834 ?auto_164835 ) ( not ( = ?auto_164835 ?auto_164834 ) ) ( not ( = ?auto_164835 ?auto_164833 ) ) ( not ( = ?auto_164835 ?auto_164832 ) ) ( not ( = ?auto_164828 ?auto_164835 ) ) ( not ( = ?auto_164829 ?auto_164835 ) ) ( not ( = ?auto_164830 ?auto_164835 ) ) ( not ( = ?auto_164831 ?auto_164835 ) ) ( ON ?auto_164831 ?auto_164832 ) ( ON ?auto_164830 ?auto_164831 ) ( ON ?auto_164828 ?auto_164836 ) ( CLEAR ?auto_164828 ) ( not ( = ?auto_164828 ?auto_164836 ) ) ( not ( = ?auto_164829 ?auto_164836 ) ) ( not ( = ?auto_164830 ?auto_164836 ) ) ( not ( = ?auto_164831 ?auto_164836 ) ) ( not ( = ?auto_164832 ?auto_164836 ) ) ( not ( = ?auto_164833 ?auto_164836 ) ) ( not ( = ?auto_164834 ?auto_164836 ) ) ( not ( = ?auto_164835 ?auto_164836 ) ) ( HOLDING ?auto_164829 ) ( CLEAR ?auto_164830 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164835 ?auto_164834 ?auto_164833 ?auto_164832 ?auto_164831 ?auto_164830 ?auto_164829 )
      ( MAKE-6PILE ?auto_164828 ?auto_164829 ?auto_164830 ?auto_164831 ?auto_164832 ?auto_164833 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164837 - BLOCK
      ?auto_164838 - BLOCK
      ?auto_164839 - BLOCK
      ?auto_164840 - BLOCK
      ?auto_164841 - BLOCK
      ?auto_164842 - BLOCK
    )
    :vars
    (
      ?auto_164845 - BLOCK
      ?auto_164844 - BLOCK
      ?auto_164843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164837 ?auto_164838 ) ) ( not ( = ?auto_164837 ?auto_164839 ) ) ( not ( = ?auto_164837 ?auto_164840 ) ) ( not ( = ?auto_164837 ?auto_164841 ) ) ( not ( = ?auto_164837 ?auto_164842 ) ) ( not ( = ?auto_164838 ?auto_164839 ) ) ( not ( = ?auto_164838 ?auto_164840 ) ) ( not ( = ?auto_164838 ?auto_164841 ) ) ( not ( = ?auto_164838 ?auto_164842 ) ) ( not ( = ?auto_164839 ?auto_164840 ) ) ( not ( = ?auto_164839 ?auto_164841 ) ) ( not ( = ?auto_164839 ?auto_164842 ) ) ( not ( = ?auto_164840 ?auto_164841 ) ) ( not ( = ?auto_164840 ?auto_164842 ) ) ( not ( = ?auto_164841 ?auto_164842 ) ) ( ON ?auto_164842 ?auto_164845 ) ( not ( = ?auto_164837 ?auto_164845 ) ) ( not ( = ?auto_164838 ?auto_164845 ) ) ( not ( = ?auto_164839 ?auto_164845 ) ) ( not ( = ?auto_164840 ?auto_164845 ) ) ( not ( = ?auto_164841 ?auto_164845 ) ) ( not ( = ?auto_164842 ?auto_164845 ) ) ( ON ?auto_164841 ?auto_164842 ) ( ON-TABLE ?auto_164844 ) ( ON ?auto_164845 ?auto_164844 ) ( not ( = ?auto_164844 ?auto_164845 ) ) ( not ( = ?auto_164844 ?auto_164842 ) ) ( not ( = ?auto_164844 ?auto_164841 ) ) ( not ( = ?auto_164837 ?auto_164844 ) ) ( not ( = ?auto_164838 ?auto_164844 ) ) ( not ( = ?auto_164839 ?auto_164844 ) ) ( not ( = ?auto_164840 ?auto_164844 ) ) ( ON ?auto_164840 ?auto_164841 ) ( ON ?auto_164839 ?auto_164840 ) ( ON ?auto_164837 ?auto_164843 ) ( not ( = ?auto_164837 ?auto_164843 ) ) ( not ( = ?auto_164838 ?auto_164843 ) ) ( not ( = ?auto_164839 ?auto_164843 ) ) ( not ( = ?auto_164840 ?auto_164843 ) ) ( not ( = ?auto_164841 ?auto_164843 ) ) ( not ( = ?auto_164842 ?auto_164843 ) ) ( not ( = ?auto_164845 ?auto_164843 ) ) ( not ( = ?auto_164844 ?auto_164843 ) ) ( CLEAR ?auto_164839 ) ( ON ?auto_164838 ?auto_164837 ) ( CLEAR ?auto_164838 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164843 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164843 ?auto_164837 )
      ( MAKE-6PILE ?auto_164837 ?auto_164838 ?auto_164839 ?auto_164840 ?auto_164841 ?auto_164842 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164846 - BLOCK
      ?auto_164847 - BLOCK
      ?auto_164848 - BLOCK
      ?auto_164849 - BLOCK
      ?auto_164850 - BLOCK
      ?auto_164851 - BLOCK
    )
    :vars
    (
      ?auto_164852 - BLOCK
      ?auto_164854 - BLOCK
      ?auto_164853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164846 ?auto_164847 ) ) ( not ( = ?auto_164846 ?auto_164848 ) ) ( not ( = ?auto_164846 ?auto_164849 ) ) ( not ( = ?auto_164846 ?auto_164850 ) ) ( not ( = ?auto_164846 ?auto_164851 ) ) ( not ( = ?auto_164847 ?auto_164848 ) ) ( not ( = ?auto_164847 ?auto_164849 ) ) ( not ( = ?auto_164847 ?auto_164850 ) ) ( not ( = ?auto_164847 ?auto_164851 ) ) ( not ( = ?auto_164848 ?auto_164849 ) ) ( not ( = ?auto_164848 ?auto_164850 ) ) ( not ( = ?auto_164848 ?auto_164851 ) ) ( not ( = ?auto_164849 ?auto_164850 ) ) ( not ( = ?auto_164849 ?auto_164851 ) ) ( not ( = ?auto_164850 ?auto_164851 ) ) ( ON ?auto_164851 ?auto_164852 ) ( not ( = ?auto_164846 ?auto_164852 ) ) ( not ( = ?auto_164847 ?auto_164852 ) ) ( not ( = ?auto_164848 ?auto_164852 ) ) ( not ( = ?auto_164849 ?auto_164852 ) ) ( not ( = ?auto_164850 ?auto_164852 ) ) ( not ( = ?auto_164851 ?auto_164852 ) ) ( ON ?auto_164850 ?auto_164851 ) ( ON-TABLE ?auto_164854 ) ( ON ?auto_164852 ?auto_164854 ) ( not ( = ?auto_164854 ?auto_164852 ) ) ( not ( = ?auto_164854 ?auto_164851 ) ) ( not ( = ?auto_164854 ?auto_164850 ) ) ( not ( = ?auto_164846 ?auto_164854 ) ) ( not ( = ?auto_164847 ?auto_164854 ) ) ( not ( = ?auto_164848 ?auto_164854 ) ) ( not ( = ?auto_164849 ?auto_164854 ) ) ( ON ?auto_164849 ?auto_164850 ) ( ON ?auto_164846 ?auto_164853 ) ( not ( = ?auto_164846 ?auto_164853 ) ) ( not ( = ?auto_164847 ?auto_164853 ) ) ( not ( = ?auto_164848 ?auto_164853 ) ) ( not ( = ?auto_164849 ?auto_164853 ) ) ( not ( = ?auto_164850 ?auto_164853 ) ) ( not ( = ?auto_164851 ?auto_164853 ) ) ( not ( = ?auto_164852 ?auto_164853 ) ) ( not ( = ?auto_164854 ?auto_164853 ) ) ( ON ?auto_164847 ?auto_164846 ) ( CLEAR ?auto_164847 ) ( ON-TABLE ?auto_164853 ) ( HOLDING ?auto_164848 ) ( CLEAR ?auto_164849 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164854 ?auto_164852 ?auto_164851 ?auto_164850 ?auto_164849 ?auto_164848 )
      ( MAKE-6PILE ?auto_164846 ?auto_164847 ?auto_164848 ?auto_164849 ?auto_164850 ?auto_164851 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164855 - BLOCK
      ?auto_164856 - BLOCK
      ?auto_164857 - BLOCK
      ?auto_164858 - BLOCK
      ?auto_164859 - BLOCK
      ?auto_164860 - BLOCK
    )
    :vars
    (
      ?auto_164863 - BLOCK
      ?auto_164861 - BLOCK
      ?auto_164862 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164855 ?auto_164856 ) ) ( not ( = ?auto_164855 ?auto_164857 ) ) ( not ( = ?auto_164855 ?auto_164858 ) ) ( not ( = ?auto_164855 ?auto_164859 ) ) ( not ( = ?auto_164855 ?auto_164860 ) ) ( not ( = ?auto_164856 ?auto_164857 ) ) ( not ( = ?auto_164856 ?auto_164858 ) ) ( not ( = ?auto_164856 ?auto_164859 ) ) ( not ( = ?auto_164856 ?auto_164860 ) ) ( not ( = ?auto_164857 ?auto_164858 ) ) ( not ( = ?auto_164857 ?auto_164859 ) ) ( not ( = ?auto_164857 ?auto_164860 ) ) ( not ( = ?auto_164858 ?auto_164859 ) ) ( not ( = ?auto_164858 ?auto_164860 ) ) ( not ( = ?auto_164859 ?auto_164860 ) ) ( ON ?auto_164860 ?auto_164863 ) ( not ( = ?auto_164855 ?auto_164863 ) ) ( not ( = ?auto_164856 ?auto_164863 ) ) ( not ( = ?auto_164857 ?auto_164863 ) ) ( not ( = ?auto_164858 ?auto_164863 ) ) ( not ( = ?auto_164859 ?auto_164863 ) ) ( not ( = ?auto_164860 ?auto_164863 ) ) ( ON ?auto_164859 ?auto_164860 ) ( ON-TABLE ?auto_164861 ) ( ON ?auto_164863 ?auto_164861 ) ( not ( = ?auto_164861 ?auto_164863 ) ) ( not ( = ?auto_164861 ?auto_164860 ) ) ( not ( = ?auto_164861 ?auto_164859 ) ) ( not ( = ?auto_164855 ?auto_164861 ) ) ( not ( = ?auto_164856 ?auto_164861 ) ) ( not ( = ?auto_164857 ?auto_164861 ) ) ( not ( = ?auto_164858 ?auto_164861 ) ) ( ON ?auto_164858 ?auto_164859 ) ( ON ?auto_164855 ?auto_164862 ) ( not ( = ?auto_164855 ?auto_164862 ) ) ( not ( = ?auto_164856 ?auto_164862 ) ) ( not ( = ?auto_164857 ?auto_164862 ) ) ( not ( = ?auto_164858 ?auto_164862 ) ) ( not ( = ?auto_164859 ?auto_164862 ) ) ( not ( = ?auto_164860 ?auto_164862 ) ) ( not ( = ?auto_164863 ?auto_164862 ) ) ( not ( = ?auto_164861 ?auto_164862 ) ) ( ON ?auto_164856 ?auto_164855 ) ( ON-TABLE ?auto_164862 ) ( CLEAR ?auto_164858 ) ( ON ?auto_164857 ?auto_164856 ) ( CLEAR ?auto_164857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164862 ?auto_164855 ?auto_164856 )
      ( MAKE-6PILE ?auto_164855 ?auto_164856 ?auto_164857 ?auto_164858 ?auto_164859 ?auto_164860 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164864 - BLOCK
      ?auto_164865 - BLOCK
      ?auto_164866 - BLOCK
      ?auto_164867 - BLOCK
      ?auto_164868 - BLOCK
      ?auto_164869 - BLOCK
    )
    :vars
    (
      ?auto_164871 - BLOCK
      ?auto_164872 - BLOCK
      ?auto_164870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164864 ?auto_164865 ) ) ( not ( = ?auto_164864 ?auto_164866 ) ) ( not ( = ?auto_164864 ?auto_164867 ) ) ( not ( = ?auto_164864 ?auto_164868 ) ) ( not ( = ?auto_164864 ?auto_164869 ) ) ( not ( = ?auto_164865 ?auto_164866 ) ) ( not ( = ?auto_164865 ?auto_164867 ) ) ( not ( = ?auto_164865 ?auto_164868 ) ) ( not ( = ?auto_164865 ?auto_164869 ) ) ( not ( = ?auto_164866 ?auto_164867 ) ) ( not ( = ?auto_164866 ?auto_164868 ) ) ( not ( = ?auto_164866 ?auto_164869 ) ) ( not ( = ?auto_164867 ?auto_164868 ) ) ( not ( = ?auto_164867 ?auto_164869 ) ) ( not ( = ?auto_164868 ?auto_164869 ) ) ( ON ?auto_164869 ?auto_164871 ) ( not ( = ?auto_164864 ?auto_164871 ) ) ( not ( = ?auto_164865 ?auto_164871 ) ) ( not ( = ?auto_164866 ?auto_164871 ) ) ( not ( = ?auto_164867 ?auto_164871 ) ) ( not ( = ?auto_164868 ?auto_164871 ) ) ( not ( = ?auto_164869 ?auto_164871 ) ) ( ON ?auto_164868 ?auto_164869 ) ( ON-TABLE ?auto_164872 ) ( ON ?auto_164871 ?auto_164872 ) ( not ( = ?auto_164872 ?auto_164871 ) ) ( not ( = ?auto_164872 ?auto_164869 ) ) ( not ( = ?auto_164872 ?auto_164868 ) ) ( not ( = ?auto_164864 ?auto_164872 ) ) ( not ( = ?auto_164865 ?auto_164872 ) ) ( not ( = ?auto_164866 ?auto_164872 ) ) ( not ( = ?auto_164867 ?auto_164872 ) ) ( ON ?auto_164864 ?auto_164870 ) ( not ( = ?auto_164864 ?auto_164870 ) ) ( not ( = ?auto_164865 ?auto_164870 ) ) ( not ( = ?auto_164866 ?auto_164870 ) ) ( not ( = ?auto_164867 ?auto_164870 ) ) ( not ( = ?auto_164868 ?auto_164870 ) ) ( not ( = ?auto_164869 ?auto_164870 ) ) ( not ( = ?auto_164871 ?auto_164870 ) ) ( not ( = ?auto_164872 ?auto_164870 ) ) ( ON ?auto_164865 ?auto_164864 ) ( ON-TABLE ?auto_164870 ) ( ON ?auto_164866 ?auto_164865 ) ( CLEAR ?auto_164866 ) ( HOLDING ?auto_164867 ) ( CLEAR ?auto_164868 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164872 ?auto_164871 ?auto_164869 ?auto_164868 ?auto_164867 )
      ( MAKE-6PILE ?auto_164864 ?auto_164865 ?auto_164866 ?auto_164867 ?auto_164868 ?auto_164869 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164873 - BLOCK
      ?auto_164874 - BLOCK
      ?auto_164875 - BLOCK
      ?auto_164876 - BLOCK
      ?auto_164877 - BLOCK
      ?auto_164878 - BLOCK
    )
    :vars
    (
      ?auto_164881 - BLOCK
      ?auto_164880 - BLOCK
      ?auto_164879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164873 ?auto_164874 ) ) ( not ( = ?auto_164873 ?auto_164875 ) ) ( not ( = ?auto_164873 ?auto_164876 ) ) ( not ( = ?auto_164873 ?auto_164877 ) ) ( not ( = ?auto_164873 ?auto_164878 ) ) ( not ( = ?auto_164874 ?auto_164875 ) ) ( not ( = ?auto_164874 ?auto_164876 ) ) ( not ( = ?auto_164874 ?auto_164877 ) ) ( not ( = ?auto_164874 ?auto_164878 ) ) ( not ( = ?auto_164875 ?auto_164876 ) ) ( not ( = ?auto_164875 ?auto_164877 ) ) ( not ( = ?auto_164875 ?auto_164878 ) ) ( not ( = ?auto_164876 ?auto_164877 ) ) ( not ( = ?auto_164876 ?auto_164878 ) ) ( not ( = ?auto_164877 ?auto_164878 ) ) ( ON ?auto_164878 ?auto_164881 ) ( not ( = ?auto_164873 ?auto_164881 ) ) ( not ( = ?auto_164874 ?auto_164881 ) ) ( not ( = ?auto_164875 ?auto_164881 ) ) ( not ( = ?auto_164876 ?auto_164881 ) ) ( not ( = ?auto_164877 ?auto_164881 ) ) ( not ( = ?auto_164878 ?auto_164881 ) ) ( ON ?auto_164877 ?auto_164878 ) ( ON-TABLE ?auto_164880 ) ( ON ?auto_164881 ?auto_164880 ) ( not ( = ?auto_164880 ?auto_164881 ) ) ( not ( = ?auto_164880 ?auto_164878 ) ) ( not ( = ?auto_164880 ?auto_164877 ) ) ( not ( = ?auto_164873 ?auto_164880 ) ) ( not ( = ?auto_164874 ?auto_164880 ) ) ( not ( = ?auto_164875 ?auto_164880 ) ) ( not ( = ?auto_164876 ?auto_164880 ) ) ( ON ?auto_164873 ?auto_164879 ) ( not ( = ?auto_164873 ?auto_164879 ) ) ( not ( = ?auto_164874 ?auto_164879 ) ) ( not ( = ?auto_164875 ?auto_164879 ) ) ( not ( = ?auto_164876 ?auto_164879 ) ) ( not ( = ?auto_164877 ?auto_164879 ) ) ( not ( = ?auto_164878 ?auto_164879 ) ) ( not ( = ?auto_164881 ?auto_164879 ) ) ( not ( = ?auto_164880 ?auto_164879 ) ) ( ON ?auto_164874 ?auto_164873 ) ( ON-TABLE ?auto_164879 ) ( ON ?auto_164875 ?auto_164874 ) ( CLEAR ?auto_164877 ) ( ON ?auto_164876 ?auto_164875 ) ( CLEAR ?auto_164876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164879 ?auto_164873 ?auto_164874 ?auto_164875 )
      ( MAKE-6PILE ?auto_164873 ?auto_164874 ?auto_164875 ?auto_164876 ?auto_164877 ?auto_164878 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164882 - BLOCK
      ?auto_164883 - BLOCK
      ?auto_164884 - BLOCK
      ?auto_164885 - BLOCK
      ?auto_164886 - BLOCK
      ?auto_164887 - BLOCK
    )
    :vars
    (
      ?auto_164888 - BLOCK
      ?auto_164890 - BLOCK
      ?auto_164889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164882 ?auto_164883 ) ) ( not ( = ?auto_164882 ?auto_164884 ) ) ( not ( = ?auto_164882 ?auto_164885 ) ) ( not ( = ?auto_164882 ?auto_164886 ) ) ( not ( = ?auto_164882 ?auto_164887 ) ) ( not ( = ?auto_164883 ?auto_164884 ) ) ( not ( = ?auto_164883 ?auto_164885 ) ) ( not ( = ?auto_164883 ?auto_164886 ) ) ( not ( = ?auto_164883 ?auto_164887 ) ) ( not ( = ?auto_164884 ?auto_164885 ) ) ( not ( = ?auto_164884 ?auto_164886 ) ) ( not ( = ?auto_164884 ?auto_164887 ) ) ( not ( = ?auto_164885 ?auto_164886 ) ) ( not ( = ?auto_164885 ?auto_164887 ) ) ( not ( = ?auto_164886 ?auto_164887 ) ) ( ON ?auto_164887 ?auto_164888 ) ( not ( = ?auto_164882 ?auto_164888 ) ) ( not ( = ?auto_164883 ?auto_164888 ) ) ( not ( = ?auto_164884 ?auto_164888 ) ) ( not ( = ?auto_164885 ?auto_164888 ) ) ( not ( = ?auto_164886 ?auto_164888 ) ) ( not ( = ?auto_164887 ?auto_164888 ) ) ( ON-TABLE ?auto_164890 ) ( ON ?auto_164888 ?auto_164890 ) ( not ( = ?auto_164890 ?auto_164888 ) ) ( not ( = ?auto_164890 ?auto_164887 ) ) ( not ( = ?auto_164890 ?auto_164886 ) ) ( not ( = ?auto_164882 ?auto_164890 ) ) ( not ( = ?auto_164883 ?auto_164890 ) ) ( not ( = ?auto_164884 ?auto_164890 ) ) ( not ( = ?auto_164885 ?auto_164890 ) ) ( ON ?auto_164882 ?auto_164889 ) ( not ( = ?auto_164882 ?auto_164889 ) ) ( not ( = ?auto_164883 ?auto_164889 ) ) ( not ( = ?auto_164884 ?auto_164889 ) ) ( not ( = ?auto_164885 ?auto_164889 ) ) ( not ( = ?auto_164886 ?auto_164889 ) ) ( not ( = ?auto_164887 ?auto_164889 ) ) ( not ( = ?auto_164888 ?auto_164889 ) ) ( not ( = ?auto_164890 ?auto_164889 ) ) ( ON ?auto_164883 ?auto_164882 ) ( ON-TABLE ?auto_164889 ) ( ON ?auto_164884 ?auto_164883 ) ( ON ?auto_164885 ?auto_164884 ) ( CLEAR ?auto_164885 ) ( HOLDING ?auto_164886 ) ( CLEAR ?auto_164887 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164890 ?auto_164888 ?auto_164887 ?auto_164886 )
      ( MAKE-6PILE ?auto_164882 ?auto_164883 ?auto_164884 ?auto_164885 ?auto_164886 ?auto_164887 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164891 - BLOCK
      ?auto_164892 - BLOCK
      ?auto_164893 - BLOCK
      ?auto_164894 - BLOCK
      ?auto_164895 - BLOCK
      ?auto_164896 - BLOCK
    )
    :vars
    (
      ?auto_164897 - BLOCK
      ?auto_164899 - BLOCK
      ?auto_164898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164891 ?auto_164892 ) ) ( not ( = ?auto_164891 ?auto_164893 ) ) ( not ( = ?auto_164891 ?auto_164894 ) ) ( not ( = ?auto_164891 ?auto_164895 ) ) ( not ( = ?auto_164891 ?auto_164896 ) ) ( not ( = ?auto_164892 ?auto_164893 ) ) ( not ( = ?auto_164892 ?auto_164894 ) ) ( not ( = ?auto_164892 ?auto_164895 ) ) ( not ( = ?auto_164892 ?auto_164896 ) ) ( not ( = ?auto_164893 ?auto_164894 ) ) ( not ( = ?auto_164893 ?auto_164895 ) ) ( not ( = ?auto_164893 ?auto_164896 ) ) ( not ( = ?auto_164894 ?auto_164895 ) ) ( not ( = ?auto_164894 ?auto_164896 ) ) ( not ( = ?auto_164895 ?auto_164896 ) ) ( ON ?auto_164896 ?auto_164897 ) ( not ( = ?auto_164891 ?auto_164897 ) ) ( not ( = ?auto_164892 ?auto_164897 ) ) ( not ( = ?auto_164893 ?auto_164897 ) ) ( not ( = ?auto_164894 ?auto_164897 ) ) ( not ( = ?auto_164895 ?auto_164897 ) ) ( not ( = ?auto_164896 ?auto_164897 ) ) ( ON-TABLE ?auto_164899 ) ( ON ?auto_164897 ?auto_164899 ) ( not ( = ?auto_164899 ?auto_164897 ) ) ( not ( = ?auto_164899 ?auto_164896 ) ) ( not ( = ?auto_164899 ?auto_164895 ) ) ( not ( = ?auto_164891 ?auto_164899 ) ) ( not ( = ?auto_164892 ?auto_164899 ) ) ( not ( = ?auto_164893 ?auto_164899 ) ) ( not ( = ?auto_164894 ?auto_164899 ) ) ( ON ?auto_164891 ?auto_164898 ) ( not ( = ?auto_164891 ?auto_164898 ) ) ( not ( = ?auto_164892 ?auto_164898 ) ) ( not ( = ?auto_164893 ?auto_164898 ) ) ( not ( = ?auto_164894 ?auto_164898 ) ) ( not ( = ?auto_164895 ?auto_164898 ) ) ( not ( = ?auto_164896 ?auto_164898 ) ) ( not ( = ?auto_164897 ?auto_164898 ) ) ( not ( = ?auto_164899 ?auto_164898 ) ) ( ON ?auto_164892 ?auto_164891 ) ( ON-TABLE ?auto_164898 ) ( ON ?auto_164893 ?auto_164892 ) ( ON ?auto_164894 ?auto_164893 ) ( CLEAR ?auto_164896 ) ( ON ?auto_164895 ?auto_164894 ) ( CLEAR ?auto_164895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164898 ?auto_164891 ?auto_164892 ?auto_164893 ?auto_164894 )
      ( MAKE-6PILE ?auto_164891 ?auto_164892 ?auto_164893 ?auto_164894 ?auto_164895 ?auto_164896 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164900 - BLOCK
      ?auto_164901 - BLOCK
      ?auto_164902 - BLOCK
      ?auto_164903 - BLOCK
      ?auto_164904 - BLOCK
      ?auto_164905 - BLOCK
    )
    :vars
    (
      ?auto_164908 - BLOCK
      ?auto_164907 - BLOCK
      ?auto_164906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164900 ?auto_164901 ) ) ( not ( = ?auto_164900 ?auto_164902 ) ) ( not ( = ?auto_164900 ?auto_164903 ) ) ( not ( = ?auto_164900 ?auto_164904 ) ) ( not ( = ?auto_164900 ?auto_164905 ) ) ( not ( = ?auto_164901 ?auto_164902 ) ) ( not ( = ?auto_164901 ?auto_164903 ) ) ( not ( = ?auto_164901 ?auto_164904 ) ) ( not ( = ?auto_164901 ?auto_164905 ) ) ( not ( = ?auto_164902 ?auto_164903 ) ) ( not ( = ?auto_164902 ?auto_164904 ) ) ( not ( = ?auto_164902 ?auto_164905 ) ) ( not ( = ?auto_164903 ?auto_164904 ) ) ( not ( = ?auto_164903 ?auto_164905 ) ) ( not ( = ?auto_164904 ?auto_164905 ) ) ( not ( = ?auto_164900 ?auto_164908 ) ) ( not ( = ?auto_164901 ?auto_164908 ) ) ( not ( = ?auto_164902 ?auto_164908 ) ) ( not ( = ?auto_164903 ?auto_164908 ) ) ( not ( = ?auto_164904 ?auto_164908 ) ) ( not ( = ?auto_164905 ?auto_164908 ) ) ( ON-TABLE ?auto_164907 ) ( ON ?auto_164908 ?auto_164907 ) ( not ( = ?auto_164907 ?auto_164908 ) ) ( not ( = ?auto_164907 ?auto_164905 ) ) ( not ( = ?auto_164907 ?auto_164904 ) ) ( not ( = ?auto_164900 ?auto_164907 ) ) ( not ( = ?auto_164901 ?auto_164907 ) ) ( not ( = ?auto_164902 ?auto_164907 ) ) ( not ( = ?auto_164903 ?auto_164907 ) ) ( ON ?auto_164900 ?auto_164906 ) ( not ( = ?auto_164900 ?auto_164906 ) ) ( not ( = ?auto_164901 ?auto_164906 ) ) ( not ( = ?auto_164902 ?auto_164906 ) ) ( not ( = ?auto_164903 ?auto_164906 ) ) ( not ( = ?auto_164904 ?auto_164906 ) ) ( not ( = ?auto_164905 ?auto_164906 ) ) ( not ( = ?auto_164908 ?auto_164906 ) ) ( not ( = ?auto_164907 ?auto_164906 ) ) ( ON ?auto_164901 ?auto_164900 ) ( ON-TABLE ?auto_164906 ) ( ON ?auto_164902 ?auto_164901 ) ( ON ?auto_164903 ?auto_164902 ) ( ON ?auto_164904 ?auto_164903 ) ( CLEAR ?auto_164904 ) ( HOLDING ?auto_164905 ) ( CLEAR ?auto_164908 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164907 ?auto_164908 ?auto_164905 )
      ( MAKE-6PILE ?auto_164900 ?auto_164901 ?auto_164902 ?auto_164903 ?auto_164904 ?auto_164905 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164909 - BLOCK
      ?auto_164910 - BLOCK
      ?auto_164911 - BLOCK
      ?auto_164912 - BLOCK
      ?auto_164913 - BLOCK
      ?auto_164914 - BLOCK
    )
    :vars
    (
      ?auto_164915 - BLOCK
      ?auto_164917 - BLOCK
      ?auto_164916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164909 ?auto_164910 ) ) ( not ( = ?auto_164909 ?auto_164911 ) ) ( not ( = ?auto_164909 ?auto_164912 ) ) ( not ( = ?auto_164909 ?auto_164913 ) ) ( not ( = ?auto_164909 ?auto_164914 ) ) ( not ( = ?auto_164910 ?auto_164911 ) ) ( not ( = ?auto_164910 ?auto_164912 ) ) ( not ( = ?auto_164910 ?auto_164913 ) ) ( not ( = ?auto_164910 ?auto_164914 ) ) ( not ( = ?auto_164911 ?auto_164912 ) ) ( not ( = ?auto_164911 ?auto_164913 ) ) ( not ( = ?auto_164911 ?auto_164914 ) ) ( not ( = ?auto_164912 ?auto_164913 ) ) ( not ( = ?auto_164912 ?auto_164914 ) ) ( not ( = ?auto_164913 ?auto_164914 ) ) ( not ( = ?auto_164909 ?auto_164915 ) ) ( not ( = ?auto_164910 ?auto_164915 ) ) ( not ( = ?auto_164911 ?auto_164915 ) ) ( not ( = ?auto_164912 ?auto_164915 ) ) ( not ( = ?auto_164913 ?auto_164915 ) ) ( not ( = ?auto_164914 ?auto_164915 ) ) ( ON-TABLE ?auto_164917 ) ( ON ?auto_164915 ?auto_164917 ) ( not ( = ?auto_164917 ?auto_164915 ) ) ( not ( = ?auto_164917 ?auto_164914 ) ) ( not ( = ?auto_164917 ?auto_164913 ) ) ( not ( = ?auto_164909 ?auto_164917 ) ) ( not ( = ?auto_164910 ?auto_164917 ) ) ( not ( = ?auto_164911 ?auto_164917 ) ) ( not ( = ?auto_164912 ?auto_164917 ) ) ( ON ?auto_164909 ?auto_164916 ) ( not ( = ?auto_164909 ?auto_164916 ) ) ( not ( = ?auto_164910 ?auto_164916 ) ) ( not ( = ?auto_164911 ?auto_164916 ) ) ( not ( = ?auto_164912 ?auto_164916 ) ) ( not ( = ?auto_164913 ?auto_164916 ) ) ( not ( = ?auto_164914 ?auto_164916 ) ) ( not ( = ?auto_164915 ?auto_164916 ) ) ( not ( = ?auto_164917 ?auto_164916 ) ) ( ON ?auto_164910 ?auto_164909 ) ( ON-TABLE ?auto_164916 ) ( ON ?auto_164911 ?auto_164910 ) ( ON ?auto_164912 ?auto_164911 ) ( ON ?auto_164913 ?auto_164912 ) ( CLEAR ?auto_164915 ) ( ON ?auto_164914 ?auto_164913 ) ( CLEAR ?auto_164914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164916 ?auto_164909 ?auto_164910 ?auto_164911 ?auto_164912 ?auto_164913 )
      ( MAKE-6PILE ?auto_164909 ?auto_164910 ?auto_164911 ?auto_164912 ?auto_164913 ?auto_164914 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164918 - BLOCK
      ?auto_164919 - BLOCK
      ?auto_164920 - BLOCK
      ?auto_164921 - BLOCK
      ?auto_164922 - BLOCK
      ?auto_164923 - BLOCK
    )
    :vars
    (
      ?auto_164925 - BLOCK
      ?auto_164926 - BLOCK
      ?auto_164924 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164918 ?auto_164919 ) ) ( not ( = ?auto_164918 ?auto_164920 ) ) ( not ( = ?auto_164918 ?auto_164921 ) ) ( not ( = ?auto_164918 ?auto_164922 ) ) ( not ( = ?auto_164918 ?auto_164923 ) ) ( not ( = ?auto_164919 ?auto_164920 ) ) ( not ( = ?auto_164919 ?auto_164921 ) ) ( not ( = ?auto_164919 ?auto_164922 ) ) ( not ( = ?auto_164919 ?auto_164923 ) ) ( not ( = ?auto_164920 ?auto_164921 ) ) ( not ( = ?auto_164920 ?auto_164922 ) ) ( not ( = ?auto_164920 ?auto_164923 ) ) ( not ( = ?auto_164921 ?auto_164922 ) ) ( not ( = ?auto_164921 ?auto_164923 ) ) ( not ( = ?auto_164922 ?auto_164923 ) ) ( not ( = ?auto_164918 ?auto_164925 ) ) ( not ( = ?auto_164919 ?auto_164925 ) ) ( not ( = ?auto_164920 ?auto_164925 ) ) ( not ( = ?auto_164921 ?auto_164925 ) ) ( not ( = ?auto_164922 ?auto_164925 ) ) ( not ( = ?auto_164923 ?auto_164925 ) ) ( ON-TABLE ?auto_164926 ) ( not ( = ?auto_164926 ?auto_164925 ) ) ( not ( = ?auto_164926 ?auto_164923 ) ) ( not ( = ?auto_164926 ?auto_164922 ) ) ( not ( = ?auto_164918 ?auto_164926 ) ) ( not ( = ?auto_164919 ?auto_164926 ) ) ( not ( = ?auto_164920 ?auto_164926 ) ) ( not ( = ?auto_164921 ?auto_164926 ) ) ( ON ?auto_164918 ?auto_164924 ) ( not ( = ?auto_164918 ?auto_164924 ) ) ( not ( = ?auto_164919 ?auto_164924 ) ) ( not ( = ?auto_164920 ?auto_164924 ) ) ( not ( = ?auto_164921 ?auto_164924 ) ) ( not ( = ?auto_164922 ?auto_164924 ) ) ( not ( = ?auto_164923 ?auto_164924 ) ) ( not ( = ?auto_164925 ?auto_164924 ) ) ( not ( = ?auto_164926 ?auto_164924 ) ) ( ON ?auto_164919 ?auto_164918 ) ( ON-TABLE ?auto_164924 ) ( ON ?auto_164920 ?auto_164919 ) ( ON ?auto_164921 ?auto_164920 ) ( ON ?auto_164922 ?auto_164921 ) ( ON ?auto_164923 ?auto_164922 ) ( CLEAR ?auto_164923 ) ( HOLDING ?auto_164925 ) ( CLEAR ?auto_164926 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164926 ?auto_164925 )
      ( MAKE-6PILE ?auto_164918 ?auto_164919 ?auto_164920 ?auto_164921 ?auto_164922 ?auto_164923 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164927 - BLOCK
      ?auto_164928 - BLOCK
      ?auto_164929 - BLOCK
      ?auto_164930 - BLOCK
      ?auto_164931 - BLOCK
      ?auto_164932 - BLOCK
    )
    :vars
    (
      ?auto_164935 - BLOCK
      ?auto_164934 - BLOCK
      ?auto_164933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164927 ?auto_164928 ) ) ( not ( = ?auto_164927 ?auto_164929 ) ) ( not ( = ?auto_164927 ?auto_164930 ) ) ( not ( = ?auto_164927 ?auto_164931 ) ) ( not ( = ?auto_164927 ?auto_164932 ) ) ( not ( = ?auto_164928 ?auto_164929 ) ) ( not ( = ?auto_164928 ?auto_164930 ) ) ( not ( = ?auto_164928 ?auto_164931 ) ) ( not ( = ?auto_164928 ?auto_164932 ) ) ( not ( = ?auto_164929 ?auto_164930 ) ) ( not ( = ?auto_164929 ?auto_164931 ) ) ( not ( = ?auto_164929 ?auto_164932 ) ) ( not ( = ?auto_164930 ?auto_164931 ) ) ( not ( = ?auto_164930 ?auto_164932 ) ) ( not ( = ?auto_164931 ?auto_164932 ) ) ( not ( = ?auto_164927 ?auto_164935 ) ) ( not ( = ?auto_164928 ?auto_164935 ) ) ( not ( = ?auto_164929 ?auto_164935 ) ) ( not ( = ?auto_164930 ?auto_164935 ) ) ( not ( = ?auto_164931 ?auto_164935 ) ) ( not ( = ?auto_164932 ?auto_164935 ) ) ( ON-TABLE ?auto_164934 ) ( not ( = ?auto_164934 ?auto_164935 ) ) ( not ( = ?auto_164934 ?auto_164932 ) ) ( not ( = ?auto_164934 ?auto_164931 ) ) ( not ( = ?auto_164927 ?auto_164934 ) ) ( not ( = ?auto_164928 ?auto_164934 ) ) ( not ( = ?auto_164929 ?auto_164934 ) ) ( not ( = ?auto_164930 ?auto_164934 ) ) ( ON ?auto_164927 ?auto_164933 ) ( not ( = ?auto_164927 ?auto_164933 ) ) ( not ( = ?auto_164928 ?auto_164933 ) ) ( not ( = ?auto_164929 ?auto_164933 ) ) ( not ( = ?auto_164930 ?auto_164933 ) ) ( not ( = ?auto_164931 ?auto_164933 ) ) ( not ( = ?auto_164932 ?auto_164933 ) ) ( not ( = ?auto_164935 ?auto_164933 ) ) ( not ( = ?auto_164934 ?auto_164933 ) ) ( ON ?auto_164928 ?auto_164927 ) ( ON-TABLE ?auto_164933 ) ( ON ?auto_164929 ?auto_164928 ) ( ON ?auto_164930 ?auto_164929 ) ( ON ?auto_164931 ?auto_164930 ) ( ON ?auto_164932 ?auto_164931 ) ( CLEAR ?auto_164934 ) ( ON ?auto_164935 ?auto_164932 ) ( CLEAR ?auto_164935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164933 ?auto_164927 ?auto_164928 ?auto_164929 ?auto_164930 ?auto_164931 ?auto_164932 )
      ( MAKE-6PILE ?auto_164927 ?auto_164928 ?auto_164929 ?auto_164930 ?auto_164931 ?auto_164932 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164936 - BLOCK
      ?auto_164937 - BLOCK
      ?auto_164938 - BLOCK
      ?auto_164939 - BLOCK
      ?auto_164940 - BLOCK
      ?auto_164941 - BLOCK
    )
    :vars
    (
      ?auto_164942 - BLOCK
      ?auto_164943 - BLOCK
      ?auto_164944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164936 ?auto_164937 ) ) ( not ( = ?auto_164936 ?auto_164938 ) ) ( not ( = ?auto_164936 ?auto_164939 ) ) ( not ( = ?auto_164936 ?auto_164940 ) ) ( not ( = ?auto_164936 ?auto_164941 ) ) ( not ( = ?auto_164937 ?auto_164938 ) ) ( not ( = ?auto_164937 ?auto_164939 ) ) ( not ( = ?auto_164937 ?auto_164940 ) ) ( not ( = ?auto_164937 ?auto_164941 ) ) ( not ( = ?auto_164938 ?auto_164939 ) ) ( not ( = ?auto_164938 ?auto_164940 ) ) ( not ( = ?auto_164938 ?auto_164941 ) ) ( not ( = ?auto_164939 ?auto_164940 ) ) ( not ( = ?auto_164939 ?auto_164941 ) ) ( not ( = ?auto_164940 ?auto_164941 ) ) ( not ( = ?auto_164936 ?auto_164942 ) ) ( not ( = ?auto_164937 ?auto_164942 ) ) ( not ( = ?auto_164938 ?auto_164942 ) ) ( not ( = ?auto_164939 ?auto_164942 ) ) ( not ( = ?auto_164940 ?auto_164942 ) ) ( not ( = ?auto_164941 ?auto_164942 ) ) ( not ( = ?auto_164943 ?auto_164942 ) ) ( not ( = ?auto_164943 ?auto_164941 ) ) ( not ( = ?auto_164943 ?auto_164940 ) ) ( not ( = ?auto_164936 ?auto_164943 ) ) ( not ( = ?auto_164937 ?auto_164943 ) ) ( not ( = ?auto_164938 ?auto_164943 ) ) ( not ( = ?auto_164939 ?auto_164943 ) ) ( ON ?auto_164936 ?auto_164944 ) ( not ( = ?auto_164936 ?auto_164944 ) ) ( not ( = ?auto_164937 ?auto_164944 ) ) ( not ( = ?auto_164938 ?auto_164944 ) ) ( not ( = ?auto_164939 ?auto_164944 ) ) ( not ( = ?auto_164940 ?auto_164944 ) ) ( not ( = ?auto_164941 ?auto_164944 ) ) ( not ( = ?auto_164942 ?auto_164944 ) ) ( not ( = ?auto_164943 ?auto_164944 ) ) ( ON ?auto_164937 ?auto_164936 ) ( ON-TABLE ?auto_164944 ) ( ON ?auto_164938 ?auto_164937 ) ( ON ?auto_164939 ?auto_164938 ) ( ON ?auto_164940 ?auto_164939 ) ( ON ?auto_164941 ?auto_164940 ) ( ON ?auto_164942 ?auto_164941 ) ( CLEAR ?auto_164942 ) ( HOLDING ?auto_164943 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164943 )
      ( MAKE-6PILE ?auto_164936 ?auto_164937 ?auto_164938 ?auto_164939 ?auto_164940 ?auto_164941 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164945 - BLOCK
      ?auto_164946 - BLOCK
      ?auto_164947 - BLOCK
      ?auto_164948 - BLOCK
      ?auto_164949 - BLOCK
      ?auto_164950 - BLOCK
    )
    :vars
    (
      ?auto_164951 - BLOCK
      ?auto_164953 - BLOCK
      ?auto_164952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164945 ?auto_164946 ) ) ( not ( = ?auto_164945 ?auto_164947 ) ) ( not ( = ?auto_164945 ?auto_164948 ) ) ( not ( = ?auto_164945 ?auto_164949 ) ) ( not ( = ?auto_164945 ?auto_164950 ) ) ( not ( = ?auto_164946 ?auto_164947 ) ) ( not ( = ?auto_164946 ?auto_164948 ) ) ( not ( = ?auto_164946 ?auto_164949 ) ) ( not ( = ?auto_164946 ?auto_164950 ) ) ( not ( = ?auto_164947 ?auto_164948 ) ) ( not ( = ?auto_164947 ?auto_164949 ) ) ( not ( = ?auto_164947 ?auto_164950 ) ) ( not ( = ?auto_164948 ?auto_164949 ) ) ( not ( = ?auto_164948 ?auto_164950 ) ) ( not ( = ?auto_164949 ?auto_164950 ) ) ( not ( = ?auto_164945 ?auto_164951 ) ) ( not ( = ?auto_164946 ?auto_164951 ) ) ( not ( = ?auto_164947 ?auto_164951 ) ) ( not ( = ?auto_164948 ?auto_164951 ) ) ( not ( = ?auto_164949 ?auto_164951 ) ) ( not ( = ?auto_164950 ?auto_164951 ) ) ( not ( = ?auto_164953 ?auto_164951 ) ) ( not ( = ?auto_164953 ?auto_164950 ) ) ( not ( = ?auto_164953 ?auto_164949 ) ) ( not ( = ?auto_164945 ?auto_164953 ) ) ( not ( = ?auto_164946 ?auto_164953 ) ) ( not ( = ?auto_164947 ?auto_164953 ) ) ( not ( = ?auto_164948 ?auto_164953 ) ) ( ON ?auto_164945 ?auto_164952 ) ( not ( = ?auto_164945 ?auto_164952 ) ) ( not ( = ?auto_164946 ?auto_164952 ) ) ( not ( = ?auto_164947 ?auto_164952 ) ) ( not ( = ?auto_164948 ?auto_164952 ) ) ( not ( = ?auto_164949 ?auto_164952 ) ) ( not ( = ?auto_164950 ?auto_164952 ) ) ( not ( = ?auto_164951 ?auto_164952 ) ) ( not ( = ?auto_164953 ?auto_164952 ) ) ( ON ?auto_164946 ?auto_164945 ) ( ON-TABLE ?auto_164952 ) ( ON ?auto_164947 ?auto_164946 ) ( ON ?auto_164948 ?auto_164947 ) ( ON ?auto_164949 ?auto_164948 ) ( ON ?auto_164950 ?auto_164949 ) ( ON ?auto_164951 ?auto_164950 ) ( ON ?auto_164953 ?auto_164951 ) ( CLEAR ?auto_164953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_164952 ?auto_164945 ?auto_164946 ?auto_164947 ?auto_164948 ?auto_164949 ?auto_164950 ?auto_164951 )
      ( MAKE-6PILE ?auto_164945 ?auto_164946 ?auto_164947 ?auto_164948 ?auto_164949 ?auto_164950 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_164965 - BLOCK
    )
    :vars
    (
      ?auto_164966 - BLOCK
      ?auto_164968 - BLOCK
      ?auto_164967 - BLOCK
      ?auto_164972 - BLOCK
      ?auto_164970 - BLOCK
      ?auto_164969 - BLOCK
      ?auto_164971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164966 ?auto_164965 ) ( ON-TABLE ?auto_164965 ) ( not ( = ?auto_164965 ?auto_164966 ) ) ( not ( = ?auto_164965 ?auto_164968 ) ) ( not ( = ?auto_164965 ?auto_164967 ) ) ( not ( = ?auto_164966 ?auto_164968 ) ) ( not ( = ?auto_164966 ?auto_164967 ) ) ( not ( = ?auto_164968 ?auto_164967 ) ) ( ON ?auto_164968 ?auto_164966 ) ( CLEAR ?auto_164968 ) ( HOLDING ?auto_164967 ) ( CLEAR ?auto_164972 ) ( ON-TABLE ?auto_164970 ) ( ON ?auto_164969 ?auto_164970 ) ( ON ?auto_164971 ?auto_164969 ) ( ON ?auto_164972 ?auto_164971 ) ( not ( = ?auto_164970 ?auto_164969 ) ) ( not ( = ?auto_164970 ?auto_164971 ) ) ( not ( = ?auto_164970 ?auto_164972 ) ) ( not ( = ?auto_164970 ?auto_164967 ) ) ( not ( = ?auto_164969 ?auto_164971 ) ) ( not ( = ?auto_164969 ?auto_164972 ) ) ( not ( = ?auto_164969 ?auto_164967 ) ) ( not ( = ?auto_164971 ?auto_164972 ) ) ( not ( = ?auto_164971 ?auto_164967 ) ) ( not ( = ?auto_164972 ?auto_164967 ) ) ( not ( = ?auto_164965 ?auto_164972 ) ) ( not ( = ?auto_164965 ?auto_164970 ) ) ( not ( = ?auto_164965 ?auto_164969 ) ) ( not ( = ?auto_164965 ?auto_164971 ) ) ( not ( = ?auto_164966 ?auto_164972 ) ) ( not ( = ?auto_164966 ?auto_164970 ) ) ( not ( = ?auto_164966 ?auto_164969 ) ) ( not ( = ?auto_164966 ?auto_164971 ) ) ( not ( = ?auto_164968 ?auto_164972 ) ) ( not ( = ?auto_164968 ?auto_164970 ) ) ( not ( = ?auto_164968 ?auto_164969 ) ) ( not ( = ?auto_164968 ?auto_164971 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164970 ?auto_164969 ?auto_164971 ?auto_164972 ?auto_164967 )
      ( MAKE-1PILE ?auto_164965 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_164973 - BLOCK
    )
    :vars
    (
      ?auto_164975 - BLOCK
      ?auto_164976 - BLOCK
      ?auto_164978 - BLOCK
      ?auto_164977 - BLOCK
      ?auto_164980 - BLOCK
      ?auto_164979 - BLOCK
      ?auto_164974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164975 ?auto_164973 ) ( ON-TABLE ?auto_164973 ) ( not ( = ?auto_164973 ?auto_164975 ) ) ( not ( = ?auto_164973 ?auto_164976 ) ) ( not ( = ?auto_164973 ?auto_164978 ) ) ( not ( = ?auto_164975 ?auto_164976 ) ) ( not ( = ?auto_164975 ?auto_164978 ) ) ( not ( = ?auto_164976 ?auto_164978 ) ) ( ON ?auto_164976 ?auto_164975 ) ( CLEAR ?auto_164977 ) ( ON-TABLE ?auto_164980 ) ( ON ?auto_164979 ?auto_164980 ) ( ON ?auto_164974 ?auto_164979 ) ( ON ?auto_164977 ?auto_164974 ) ( not ( = ?auto_164980 ?auto_164979 ) ) ( not ( = ?auto_164980 ?auto_164974 ) ) ( not ( = ?auto_164980 ?auto_164977 ) ) ( not ( = ?auto_164980 ?auto_164978 ) ) ( not ( = ?auto_164979 ?auto_164974 ) ) ( not ( = ?auto_164979 ?auto_164977 ) ) ( not ( = ?auto_164979 ?auto_164978 ) ) ( not ( = ?auto_164974 ?auto_164977 ) ) ( not ( = ?auto_164974 ?auto_164978 ) ) ( not ( = ?auto_164977 ?auto_164978 ) ) ( not ( = ?auto_164973 ?auto_164977 ) ) ( not ( = ?auto_164973 ?auto_164980 ) ) ( not ( = ?auto_164973 ?auto_164979 ) ) ( not ( = ?auto_164973 ?auto_164974 ) ) ( not ( = ?auto_164975 ?auto_164977 ) ) ( not ( = ?auto_164975 ?auto_164980 ) ) ( not ( = ?auto_164975 ?auto_164979 ) ) ( not ( = ?auto_164975 ?auto_164974 ) ) ( not ( = ?auto_164976 ?auto_164977 ) ) ( not ( = ?auto_164976 ?auto_164980 ) ) ( not ( = ?auto_164976 ?auto_164979 ) ) ( not ( = ?auto_164976 ?auto_164974 ) ) ( ON ?auto_164978 ?auto_164976 ) ( CLEAR ?auto_164978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164973 ?auto_164975 ?auto_164976 )
      ( MAKE-1PILE ?auto_164973 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_164981 - BLOCK
    )
    :vars
    (
      ?auto_164988 - BLOCK
      ?auto_164983 - BLOCK
      ?auto_164984 - BLOCK
      ?auto_164985 - BLOCK
      ?auto_164987 - BLOCK
      ?auto_164986 - BLOCK
      ?auto_164982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164988 ?auto_164981 ) ( ON-TABLE ?auto_164981 ) ( not ( = ?auto_164981 ?auto_164988 ) ) ( not ( = ?auto_164981 ?auto_164983 ) ) ( not ( = ?auto_164981 ?auto_164984 ) ) ( not ( = ?auto_164988 ?auto_164983 ) ) ( not ( = ?auto_164988 ?auto_164984 ) ) ( not ( = ?auto_164983 ?auto_164984 ) ) ( ON ?auto_164983 ?auto_164988 ) ( ON-TABLE ?auto_164985 ) ( ON ?auto_164987 ?auto_164985 ) ( ON ?auto_164986 ?auto_164987 ) ( not ( = ?auto_164985 ?auto_164987 ) ) ( not ( = ?auto_164985 ?auto_164986 ) ) ( not ( = ?auto_164985 ?auto_164982 ) ) ( not ( = ?auto_164985 ?auto_164984 ) ) ( not ( = ?auto_164987 ?auto_164986 ) ) ( not ( = ?auto_164987 ?auto_164982 ) ) ( not ( = ?auto_164987 ?auto_164984 ) ) ( not ( = ?auto_164986 ?auto_164982 ) ) ( not ( = ?auto_164986 ?auto_164984 ) ) ( not ( = ?auto_164982 ?auto_164984 ) ) ( not ( = ?auto_164981 ?auto_164982 ) ) ( not ( = ?auto_164981 ?auto_164985 ) ) ( not ( = ?auto_164981 ?auto_164987 ) ) ( not ( = ?auto_164981 ?auto_164986 ) ) ( not ( = ?auto_164988 ?auto_164982 ) ) ( not ( = ?auto_164988 ?auto_164985 ) ) ( not ( = ?auto_164988 ?auto_164987 ) ) ( not ( = ?auto_164988 ?auto_164986 ) ) ( not ( = ?auto_164983 ?auto_164982 ) ) ( not ( = ?auto_164983 ?auto_164985 ) ) ( not ( = ?auto_164983 ?auto_164987 ) ) ( not ( = ?auto_164983 ?auto_164986 ) ) ( ON ?auto_164984 ?auto_164983 ) ( CLEAR ?auto_164984 ) ( HOLDING ?auto_164982 ) ( CLEAR ?auto_164986 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164985 ?auto_164987 ?auto_164986 ?auto_164982 )
      ( MAKE-1PILE ?auto_164981 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_164989 - BLOCK
    )
    :vars
    (
      ?auto_164993 - BLOCK
      ?auto_164991 - BLOCK
      ?auto_164990 - BLOCK
      ?auto_164994 - BLOCK
      ?auto_164995 - BLOCK
      ?auto_164996 - BLOCK
      ?auto_164992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164993 ?auto_164989 ) ( ON-TABLE ?auto_164989 ) ( not ( = ?auto_164989 ?auto_164993 ) ) ( not ( = ?auto_164989 ?auto_164991 ) ) ( not ( = ?auto_164989 ?auto_164990 ) ) ( not ( = ?auto_164993 ?auto_164991 ) ) ( not ( = ?auto_164993 ?auto_164990 ) ) ( not ( = ?auto_164991 ?auto_164990 ) ) ( ON ?auto_164991 ?auto_164993 ) ( ON-TABLE ?auto_164994 ) ( ON ?auto_164995 ?auto_164994 ) ( ON ?auto_164996 ?auto_164995 ) ( not ( = ?auto_164994 ?auto_164995 ) ) ( not ( = ?auto_164994 ?auto_164996 ) ) ( not ( = ?auto_164994 ?auto_164992 ) ) ( not ( = ?auto_164994 ?auto_164990 ) ) ( not ( = ?auto_164995 ?auto_164996 ) ) ( not ( = ?auto_164995 ?auto_164992 ) ) ( not ( = ?auto_164995 ?auto_164990 ) ) ( not ( = ?auto_164996 ?auto_164992 ) ) ( not ( = ?auto_164996 ?auto_164990 ) ) ( not ( = ?auto_164992 ?auto_164990 ) ) ( not ( = ?auto_164989 ?auto_164992 ) ) ( not ( = ?auto_164989 ?auto_164994 ) ) ( not ( = ?auto_164989 ?auto_164995 ) ) ( not ( = ?auto_164989 ?auto_164996 ) ) ( not ( = ?auto_164993 ?auto_164992 ) ) ( not ( = ?auto_164993 ?auto_164994 ) ) ( not ( = ?auto_164993 ?auto_164995 ) ) ( not ( = ?auto_164993 ?auto_164996 ) ) ( not ( = ?auto_164991 ?auto_164992 ) ) ( not ( = ?auto_164991 ?auto_164994 ) ) ( not ( = ?auto_164991 ?auto_164995 ) ) ( not ( = ?auto_164991 ?auto_164996 ) ) ( ON ?auto_164990 ?auto_164991 ) ( CLEAR ?auto_164996 ) ( ON ?auto_164992 ?auto_164990 ) ( CLEAR ?auto_164992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164989 ?auto_164993 ?auto_164991 ?auto_164990 )
      ( MAKE-1PILE ?auto_164989 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_164997 - BLOCK
    )
    :vars
    (
      ?auto_165003 - BLOCK
      ?auto_165000 - BLOCK
      ?auto_164999 - BLOCK
      ?auto_165004 - BLOCK
      ?auto_165001 - BLOCK
      ?auto_164998 - BLOCK
      ?auto_165002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165003 ?auto_164997 ) ( ON-TABLE ?auto_164997 ) ( not ( = ?auto_164997 ?auto_165003 ) ) ( not ( = ?auto_164997 ?auto_165000 ) ) ( not ( = ?auto_164997 ?auto_164999 ) ) ( not ( = ?auto_165003 ?auto_165000 ) ) ( not ( = ?auto_165003 ?auto_164999 ) ) ( not ( = ?auto_165000 ?auto_164999 ) ) ( ON ?auto_165000 ?auto_165003 ) ( ON-TABLE ?auto_165004 ) ( ON ?auto_165001 ?auto_165004 ) ( not ( = ?auto_165004 ?auto_165001 ) ) ( not ( = ?auto_165004 ?auto_164998 ) ) ( not ( = ?auto_165004 ?auto_165002 ) ) ( not ( = ?auto_165004 ?auto_164999 ) ) ( not ( = ?auto_165001 ?auto_164998 ) ) ( not ( = ?auto_165001 ?auto_165002 ) ) ( not ( = ?auto_165001 ?auto_164999 ) ) ( not ( = ?auto_164998 ?auto_165002 ) ) ( not ( = ?auto_164998 ?auto_164999 ) ) ( not ( = ?auto_165002 ?auto_164999 ) ) ( not ( = ?auto_164997 ?auto_165002 ) ) ( not ( = ?auto_164997 ?auto_165004 ) ) ( not ( = ?auto_164997 ?auto_165001 ) ) ( not ( = ?auto_164997 ?auto_164998 ) ) ( not ( = ?auto_165003 ?auto_165002 ) ) ( not ( = ?auto_165003 ?auto_165004 ) ) ( not ( = ?auto_165003 ?auto_165001 ) ) ( not ( = ?auto_165003 ?auto_164998 ) ) ( not ( = ?auto_165000 ?auto_165002 ) ) ( not ( = ?auto_165000 ?auto_165004 ) ) ( not ( = ?auto_165000 ?auto_165001 ) ) ( not ( = ?auto_165000 ?auto_164998 ) ) ( ON ?auto_164999 ?auto_165000 ) ( ON ?auto_165002 ?auto_164999 ) ( CLEAR ?auto_165002 ) ( HOLDING ?auto_164998 ) ( CLEAR ?auto_165001 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165004 ?auto_165001 ?auto_164998 )
      ( MAKE-1PILE ?auto_164997 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165005 - BLOCK
    )
    :vars
    (
      ?auto_165012 - BLOCK
      ?auto_165008 - BLOCK
      ?auto_165006 - BLOCK
      ?auto_165007 - BLOCK
      ?auto_165011 - BLOCK
      ?auto_165009 - BLOCK
      ?auto_165010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165012 ?auto_165005 ) ( ON-TABLE ?auto_165005 ) ( not ( = ?auto_165005 ?auto_165012 ) ) ( not ( = ?auto_165005 ?auto_165008 ) ) ( not ( = ?auto_165005 ?auto_165006 ) ) ( not ( = ?auto_165012 ?auto_165008 ) ) ( not ( = ?auto_165012 ?auto_165006 ) ) ( not ( = ?auto_165008 ?auto_165006 ) ) ( ON ?auto_165008 ?auto_165012 ) ( ON-TABLE ?auto_165007 ) ( ON ?auto_165011 ?auto_165007 ) ( not ( = ?auto_165007 ?auto_165011 ) ) ( not ( = ?auto_165007 ?auto_165009 ) ) ( not ( = ?auto_165007 ?auto_165010 ) ) ( not ( = ?auto_165007 ?auto_165006 ) ) ( not ( = ?auto_165011 ?auto_165009 ) ) ( not ( = ?auto_165011 ?auto_165010 ) ) ( not ( = ?auto_165011 ?auto_165006 ) ) ( not ( = ?auto_165009 ?auto_165010 ) ) ( not ( = ?auto_165009 ?auto_165006 ) ) ( not ( = ?auto_165010 ?auto_165006 ) ) ( not ( = ?auto_165005 ?auto_165010 ) ) ( not ( = ?auto_165005 ?auto_165007 ) ) ( not ( = ?auto_165005 ?auto_165011 ) ) ( not ( = ?auto_165005 ?auto_165009 ) ) ( not ( = ?auto_165012 ?auto_165010 ) ) ( not ( = ?auto_165012 ?auto_165007 ) ) ( not ( = ?auto_165012 ?auto_165011 ) ) ( not ( = ?auto_165012 ?auto_165009 ) ) ( not ( = ?auto_165008 ?auto_165010 ) ) ( not ( = ?auto_165008 ?auto_165007 ) ) ( not ( = ?auto_165008 ?auto_165011 ) ) ( not ( = ?auto_165008 ?auto_165009 ) ) ( ON ?auto_165006 ?auto_165008 ) ( ON ?auto_165010 ?auto_165006 ) ( CLEAR ?auto_165011 ) ( ON ?auto_165009 ?auto_165010 ) ( CLEAR ?auto_165009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165005 ?auto_165012 ?auto_165008 ?auto_165006 ?auto_165010 )
      ( MAKE-1PILE ?auto_165005 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165013 - BLOCK
    )
    :vars
    (
      ?auto_165017 - BLOCK
      ?auto_165014 - BLOCK
      ?auto_165019 - BLOCK
      ?auto_165020 - BLOCK
      ?auto_165018 - BLOCK
      ?auto_165015 - BLOCK
      ?auto_165016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165017 ?auto_165013 ) ( ON-TABLE ?auto_165013 ) ( not ( = ?auto_165013 ?auto_165017 ) ) ( not ( = ?auto_165013 ?auto_165014 ) ) ( not ( = ?auto_165013 ?auto_165019 ) ) ( not ( = ?auto_165017 ?auto_165014 ) ) ( not ( = ?auto_165017 ?auto_165019 ) ) ( not ( = ?auto_165014 ?auto_165019 ) ) ( ON ?auto_165014 ?auto_165017 ) ( ON-TABLE ?auto_165020 ) ( not ( = ?auto_165020 ?auto_165018 ) ) ( not ( = ?auto_165020 ?auto_165015 ) ) ( not ( = ?auto_165020 ?auto_165016 ) ) ( not ( = ?auto_165020 ?auto_165019 ) ) ( not ( = ?auto_165018 ?auto_165015 ) ) ( not ( = ?auto_165018 ?auto_165016 ) ) ( not ( = ?auto_165018 ?auto_165019 ) ) ( not ( = ?auto_165015 ?auto_165016 ) ) ( not ( = ?auto_165015 ?auto_165019 ) ) ( not ( = ?auto_165016 ?auto_165019 ) ) ( not ( = ?auto_165013 ?auto_165016 ) ) ( not ( = ?auto_165013 ?auto_165020 ) ) ( not ( = ?auto_165013 ?auto_165018 ) ) ( not ( = ?auto_165013 ?auto_165015 ) ) ( not ( = ?auto_165017 ?auto_165016 ) ) ( not ( = ?auto_165017 ?auto_165020 ) ) ( not ( = ?auto_165017 ?auto_165018 ) ) ( not ( = ?auto_165017 ?auto_165015 ) ) ( not ( = ?auto_165014 ?auto_165016 ) ) ( not ( = ?auto_165014 ?auto_165020 ) ) ( not ( = ?auto_165014 ?auto_165018 ) ) ( not ( = ?auto_165014 ?auto_165015 ) ) ( ON ?auto_165019 ?auto_165014 ) ( ON ?auto_165016 ?auto_165019 ) ( ON ?auto_165015 ?auto_165016 ) ( CLEAR ?auto_165015 ) ( HOLDING ?auto_165018 ) ( CLEAR ?auto_165020 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165020 ?auto_165018 )
      ( MAKE-1PILE ?auto_165013 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165021 - BLOCK
    )
    :vars
    (
      ?auto_165023 - BLOCK
      ?auto_165027 - BLOCK
      ?auto_165025 - BLOCK
      ?auto_165024 - BLOCK
      ?auto_165028 - BLOCK
      ?auto_165026 - BLOCK
      ?auto_165022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165023 ?auto_165021 ) ( ON-TABLE ?auto_165021 ) ( not ( = ?auto_165021 ?auto_165023 ) ) ( not ( = ?auto_165021 ?auto_165027 ) ) ( not ( = ?auto_165021 ?auto_165025 ) ) ( not ( = ?auto_165023 ?auto_165027 ) ) ( not ( = ?auto_165023 ?auto_165025 ) ) ( not ( = ?auto_165027 ?auto_165025 ) ) ( ON ?auto_165027 ?auto_165023 ) ( ON-TABLE ?auto_165024 ) ( not ( = ?auto_165024 ?auto_165028 ) ) ( not ( = ?auto_165024 ?auto_165026 ) ) ( not ( = ?auto_165024 ?auto_165022 ) ) ( not ( = ?auto_165024 ?auto_165025 ) ) ( not ( = ?auto_165028 ?auto_165026 ) ) ( not ( = ?auto_165028 ?auto_165022 ) ) ( not ( = ?auto_165028 ?auto_165025 ) ) ( not ( = ?auto_165026 ?auto_165022 ) ) ( not ( = ?auto_165026 ?auto_165025 ) ) ( not ( = ?auto_165022 ?auto_165025 ) ) ( not ( = ?auto_165021 ?auto_165022 ) ) ( not ( = ?auto_165021 ?auto_165024 ) ) ( not ( = ?auto_165021 ?auto_165028 ) ) ( not ( = ?auto_165021 ?auto_165026 ) ) ( not ( = ?auto_165023 ?auto_165022 ) ) ( not ( = ?auto_165023 ?auto_165024 ) ) ( not ( = ?auto_165023 ?auto_165028 ) ) ( not ( = ?auto_165023 ?auto_165026 ) ) ( not ( = ?auto_165027 ?auto_165022 ) ) ( not ( = ?auto_165027 ?auto_165024 ) ) ( not ( = ?auto_165027 ?auto_165028 ) ) ( not ( = ?auto_165027 ?auto_165026 ) ) ( ON ?auto_165025 ?auto_165027 ) ( ON ?auto_165022 ?auto_165025 ) ( ON ?auto_165026 ?auto_165022 ) ( CLEAR ?auto_165024 ) ( ON ?auto_165028 ?auto_165026 ) ( CLEAR ?auto_165028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165021 ?auto_165023 ?auto_165027 ?auto_165025 ?auto_165022 ?auto_165026 )
      ( MAKE-1PILE ?auto_165021 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165029 - BLOCK
    )
    :vars
    (
      ?auto_165030 - BLOCK
      ?auto_165032 - BLOCK
      ?auto_165036 - BLOCK
      ?auto_165035 - BLOCK
      ?auto_165034 - BLOCK
      ?auto_165033 - BLOCK
      ?auto_165031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165030 ?auto_165029 ) ( ON-TABLE ?auto_165029 ) ( not ( = ?auto_165029 ?auto_165030 ) ) ( not ( = ?auto_165029 ?auto_165032 ) ) ( not ( = ?auto_165029 ?auto_165036 ) ) ( not ( = ?auto_165030 ?auto_165032 ) ) ( not ( = ?auto_165030 ?auto_165036 ) ) ( not ( = ?auto_165032 ?auto_165036 ) ) ( ON ?auto_165032 ?auto_165030 ) ( not ( = ?auto_165035 ?auto_165034 ) ) ( not ( = ?auto_165035 ?auto_165033 ) ) ( not ( = ?auto_165035 ?auto_165031 ) ) ( not ( = ?auto_165035 ?auto_165036 ) ) ( not ( = ?auto_165034 ?auto_165033 ) ) ( not ( = ?auto_165034 ?auto_165031 ) ) ( not ( = ?auto_165034 ?auto_165036 ) ) ( not ( = ?auto_165033 ?auto_165031 ) ) ( not ( = ?auto_165033 ?auto_165036 ) ) ( not ( = ?auto_165031 ?auto_165036 ) ) ( not ( = ?auto_165029 ?auto_165031 ) ) ( not ( = ?auto_165029 ?auto_165035 ) ) ( not ( = ?auto_165029 ?auto_165034 ) ) ( not ( = ?auto_165029 ?auto_165033 ) ) ( not ( = ?auto_165030 ?auto_165031 ) ) ( not ( = ?auto_165030 ?auto_165035 ) ) ( not ( = ?auto_165030 ?auto_165034 ) ) ( not ( = ?auto_165030 ?auto_165033 ) ) ( not ( = ?auto_165032 ?auto_165031 ) ) ( not ( = ?auto_165032 ?auto_165035 ) ) ( not ( = ?auto_165032 ?auto_165034 ) ) ( not ( = ?auto_165032 ?auto_165033 ) ) ( ON ?auto_165036 ?auto_165032 ) ( ON ?auto_165031 ?auto_165036 ) ( ON ?auto_165033 ?auto_165031 ) ( ON ?auto_165034 ?auto_165033 ) ( CLEAR ?auto_165034 ) ( HOLDING ?auto_165035 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165035 )
      ( MAKE-1PILE ?auto_165029 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165046 - BLOCK
    )
    :vars
    (
      ?auto_165050 - BLOCK
      ?auto_165049 - BLOCK
      ?auto_165052 - BLOCK
      ?auto_165048 - BLOCK
      ?auto_165051 - BLOCK
      ?auto_165047 - BLOCK
      ?auto_165053 - BLOCK
      ?auto_165054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165050 ?auto_165046 ) ( ON-TABLE ?auto_165046 ) ( not ( = ?auto_165046 ?auto_165050 ) ) ( not ( = ?auto_165046 ?auto_165049 ) ) ( not ( = ?auto_165046 ?auto_165052 ) ) ( not ( = ?auto_165050 ?auto_165049 ) ) ( not ( = ?auto_165050 ?auto_165052 ) ) ( not ( = ?auto_165049 ?auto_165052 ) ) ( ON ?auto_165049 ?auto_165050 ) ( not ( = ?auto_165048 ?auto_165051 ) ) ( not ( = ?auto_165048 ?auto_165047 ) ) ( not ( = ?auto_165048 ?auto_165053 ) ) ( not ( = ?auto_165048 ?auto_165052 ) ) ( not ( = ?auto_165051 ?auto_165047 ) ) ( not ( = ?auto_165051 ?auto_165053 ) ) ( not ( = ?auto_165051 ?auto_165052 ) ) ( not ( = ?auto_165047 ?auto_165053 ) ) ( not ( = ?auto_165047 ?auto_165052 ) ) ( not ( = ?auto_165053 ?auto_165052 ) ) ( not ( = ?auto_165046 ?auto_165053 ) ) ( not ( = ?auto_165046 ?auto_165048 ) ) ( not ( = ?auto_165046 ?auto_165051 ) ) ( not ( = ?auto_165046 ?auto_165047 ) ) ( not ( = ?auto_165050 ?auto_165053 ) ) ( not ( = ?auto_165050 ?auto_165048 ) ) ( not ( = ?auto_165050 ?auto_165051 ) ) ( not ( = ?auto_165050 ?auto_165047 ) ) ( not ( = ?auto_165049 ?auto_165053 ) ) ( not ( = ?auto_165049 ?auto_165048 ) ) ( not ( = ?auto_165049 ?auto_165051 ) ) ( not ( = ?auto_165049 ?auto_165047 ) ) ( ON ?auto_165052 ?auto_165049 ) ( ON ?auto_165053 ?auto_165052 ) ( ON ?auto_165047 ?auto_165053 ) ( ON ?auto_165051 ?auto_165047 ) ( CLEAR ?auto_165051 ) ( ON ?auto_165048 ?auto_165054 ) ( CLEAR ?auto_165048 ) ( HAND-EMPTY ) ( not ( = ?auto_165046 ?auto_165054 ) ) ( not ( = ?auto_165050 ?auto_165054 ) ) ( not ( = ?auto_165049 ?auto_165054 ) ) ( not ( = ?auto_165052 ?auto_165054 ) ) ( not ( = ?auto_165048 ?auto_165054 ) ) ( not ( = ?auto_165051 ?auto_165054 ) ) ( not ( = ?auto_165047 ?auto_165054 ) ) ( not ( = ?auto_165053 ?auto_165054 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165048 ?auto_165054 )
      ( MAKE-1PILE ?auto_165046 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165055 - BLOCK
    )
    :vars
    (
      ?auto_165062 - BLOCK
      ?auto_165059 - BLOCK
      ?auto_165058 - BLOCK
      ?auto_165056 - BLOCK
      ?auto_165060 - BLOCK
      ?auto_165057 - BLOCK
      ?auto_165061 - BLOCK
      ?auto_165063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165062 ?auto_165055 ) ( ON-TABLE ?auto_165055 ) ( not ( = ?auto_165055 ?auto_165062 ) ) ( not ( = ?auto_165055 ?auto_165059 ) ) ( not ( = ?auto_165055 ?auto_165058 ) ) ( not ( = ?auto_165062 ?auto_165059 ) ) ( not ( = ?auto_165062 ?auto_165058 ) ) ( not ( = ?auto_165059 ?auto_165058 ) ) ( ON ?auto_165059 ?auto_165062 ) ( not ( = ?auto_165056 ?auto_165060 ) ) ( not ( = ?auto_165056 ?auto_165057 ) ) ( not ( = ?auto_165056 ?auto_165061 ) ) ( not ( = ?auto_165056 ?auto_165058 ) ) ( not ( = ?auto_165060 ?auto_165057 ) ) ( not ( = ?auto_165060 ?auto_165061 ) ) ( not ( = ?auto_165060 ?auto_165058 ) ) ( not ( = ?auto_165057 ?auto_165061 ) ) ( not ( = ?auto_165057 ?auto_165058 ) ) ( not ( = ?auto_165061 ?auto_165058 ) ) ( not ( = ?auto_165055 ?auto_165061 ) ) ( not ( = ?auto_165055 ?auto_165056 ) ) ( not ( = ?auto_165055 ?auto_165060 ) ) ( not ( = ?auto_165055 ?auto_165057 ) ) ( not ( = ?auto_165062 ?auto_165061 ) ) ( not ( = ?auto_165062 ?auto_165056 ) ) ( not ( = ?auto_165062 ?auto_165060 ) ) ( not ( = ?auto_165062 ?auto_165057 ) ) ( not ( = ?auto_165059 ?auto_165061 ) ) ( not ( = ?auto_165059 ?auto_165056 ) ) ( not ( = ?auto_165059 ?auto_165060 ) ) ( not ( = ?auto_165059 ?auto_165057 ) ) ( ON ?auto_165058 ?auto_165059 ) ( ON ?auto_165061 ?auto_165058 ) ( ON ?auto_165057 ?auto_165061 ) ( ON ?auto_165056 ?auto_165063 ) ( CLEAR ?auto_165056 ) ( not ( = ?auto_165055 ?auto_165063 ) ) ( not ( = ?auto_165062 ?auto_165063 ) ) ( not ( = ?auto_165059 ?auto_165063 ) ) ( not ( = ?auto_165058 ?auto_165063 ) ) ( not ( = ?auto_165056 ?auto_165063 ) ) ( not ( = ?auto_165060 ?auto_165063 ) ) ( not ( = ?auto_165057 ?auto_165063 ) ) ( not ( = ?auto_165061 ?auto_165063 ) ) ( HOLDING ?auto_165060 ) ( CLEAR ?auto_165057 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165055 ?auto_165062 ?auto_165059 ?auto_165058 ?auto_165061 ?auto_165057 ?auto_165060 )
      ( MAKE-1PILE ?auto_165055 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165064 - BLOCK
    )
    :vars
    (
      ?auto_165066 - BLOCK
      ?auto_165071 - BLOCK
      ?auto_165072 - BLOCK
      ?auto_165065 - BLOCK
      ?auto_165067 - BLOCK
      ?auto_165069 - BLOCK
      ?auto_165070 - BLOCK
      ?auto_165068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165066 ?auto_165064 ) ( ON-TABLE ?auto_165064 ) ( not ( = ?auto_165064 ?auto_165066 ) ) ( not ( = ?auto_165064 ?auto_165071 ) ) ( not ( = ?auto_165064 ?auto_165072 ) ) ( not ( = ?auto_165066 ?auto_165071 ) ) ( not ( = ?auto_165066 ?auto_165072 ) ) ( not ( = ?auto_165071 ?auto_165072 ) ) ( ON ?auto_165071 ?auto_165066 ) ( not ( = ?auto_165065 ?auto_165067 ) ) ( not ( = ?auto_165065 ?auto_165069 ) ) ( not ( = ?auto_165065 ?auto_165070 ) ) ( not ( = ?auto_165065 ?auto_165072 ) ) ( not ( = ?auto_165067 ?auto_165069 ) ) ( not ( = ?auto_165067 ?auto_165070 ) ) ( not ( = ?auto_165067 ?auto_165072 ) ) ( not ( = ?auto_165069 ?auto_165070 ) ) ( not ( = ?auto_165069 ?auto_165072 ) ) ( not ( = ?auto_165070 ?auto_165072 ) ) ( not ( = ?auto_165064 ?auto_165070 ) ) ( not ( = ?auto_165064 ?auto_165065 ) ) ( not ( = ?auto_165064 ?auto_165067 ) ) ( not ( = ?auto_165064 ?auto_165069 ) ) ( not ( = ?auto_165066 ?auto_165070 ) ) ( not ( = ?auto_165066 ?auto_165065 ) ) ( not ( = ?auto_165066 ?auto_165067 ) ) ( not ( = ?auto_165066 ?auto_165069 ) ) ( not ( = ?auto_165071 ?auto_165070 ) ) ( not ( = ?auto_165071 ?auto_165065 ) ) ( not ( = ?auto_165071 ?auto_165067 ) ) ( not ( = ?auto_165071 ?auto_165069 ) ) ( ON ?auto_165072 ?auto_165071 ) ( ON ?auto_165070 ?auto_165072 ) ( ON ?auto_165069 ?auto_165070 ) ( ON ?auto_165065 ?auto_165068 ) ( not ( = ?auto_165064 ?auto_165068 ) ) ( not ( = ?auto_165066 ?auto_165068 ) ) ( not ( = ?auto_165071 ?auto_165068 ) ) ( not ( = ?auto_165072 ?auto_165068 ) ) ( not ( = ?auto_165065 ?auto_165068 ) ) ( not ( = ?auto_165067 ?auto_165068 ) ) ( not ( = ?auto_165069 ?auto_165068 ) ) ( not ( = ?auto_165070 ?auto_165068 ) ) ( CLEAR ?auto_165069 ) ( ON ?auto_165067 ?auto_165065 ) ( CLEAR ?auto_165067 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165068 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165068 ?auto_165065 )
      ( MAKE-1PILE ?auto_165064 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165073 - BLOCK
    )
    :vars
    (
      ?auto_165077 - BLOCK
      ?auto_165078 - BLOCK
      ?auto_165074 - BLOCK
      ?auto_165081 - BLOCK
      ?auto_165076 - BLOCK
      ?auto_165079 - BLOCK
      ?auto_165075 - BLOCK
      ?auto_165080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165077 ?auto_165073 ) ( ON-TABLE ?auto_165073 ) ( not ( = ?auto_165073 ?auto_165077 ) ) ( not ( = ?auto_165073 ?auto_165078 ) ) ( not ( = ?auto_165073 ?auto_165074 ) ) ( not ( = ?auto_165077 ?auto_165078 ) ) ( not ( = ?auto_165077 ?auto_165074 ) ) ( not ( = ?auto_165078 ?auto_165074 ) ) ( ON ?auto_165078 ?auto_165077 ) ( not ( = ?auto_165081 ?auto_165076 ) ) ( not ( = ?auto_165081 ?auto_165079 ) ) ( not ( = ?auto_165081 ?auto_165075 ) ) ( not ( = ?auto_165081 ?auto_165074 ) ) ( not ( = ?auto_165076 ?auto_165079 ) ) ( not ( = ?auto_165076 ?auto_165075 ) ) ( not ( = ?auto_165076 ?auto_165074 ) ) ( not ( = ?auto_165079 ?auto_165075 ) ) ( not ( = ?auto_165079 ?auto_165074 ) ) ( not ( = ?auto_165075 ?auto_165074 ) ) ( not ( = ?auto_165073 ?auto_165075 ) ) ( not ( = ?auto_165073 ?auto_165081 ) ) ( not ( = ?auto_165073 ?auto_165076 ) ) ( not ( = ?auto_165073 ?auto_165079 ) ) ( not ( = ?auto_165077 ?auto_165075 ) ) ( not ( = ?auto_165077 ?auto_165081 ) ) ( not ( = ?auto_165077 ?auto_165076 ) ) ( not ( = ?auto_165077 ?auto_165079 ) ) ( not ( = ?auto_165078 ?auto_165075 ) ) ( not ( = ?auto_165078 ?auto_165081 ) ) ( not ( = ?auto_165078 ?auto_165076 ) ) ( not ( = ?auto_165078 ?auto_165079 ) ) ( ON ?auto_165074 ?auto_165078 ) ( ON ?auto_165075 ?auto_165074 ) ( ON ?auto_165081 ?auto_165080 ) ( not ( = ?auto_165073 ?auto_165080 ) ) ( not ( = ?auto_165077 ?auto_165080 ) ) ( not ( = ?auto_165078 ?auto_165080 ) ) ( not ( = ?auto_165074 ?auto_165080 ) ) ( not ( = ?auto_165081 ?auto_165080 ) ) ( not ( = ?auto_165076 ?auto_165080 ) ) ( not ( = ?auto_165079 ?auto_165080 ) ) ( not ( = ?auto_165075 ?auto_165080 ) ) ( ON ?auto_165076 ?auto_165081 ) ( CLEAR ?auto_165076 ) ( ON-TABLE ?auto_165080 ) ( HOLDING ?auto_165079 ) ( CLEAR ?auto_165075 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165073 ?auto_165077 ?auto_165078 ?auto_165074 ?auto_165075 ?auto_165079 )
      ( MAKE-1PILE ?auto_165073 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165082 - BLOCK
    )
    :vars
    (
      ?auto_165084 - BLOCK
      ?auto_165085 - BLOCK
      ?auto_165090 - BLOCK
      ?auto_165089 - BLOCK
      ?auto_165086 - BLOCK
      ?auto_165083 - BLOCK
      ?auto_165088 - BLOCK
      ?auto_165087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165084 ?auto_165082 ) ( ON-TABLE ?auto_165082 ) ( not ( = ?auto_165082 ?auto_165084 ) ) ( not ( = ?auto_165082 ?auto_165085 ) ) ( not ( = ?auto_165082 ?auto_165090 ) ) ( not ( = ?auto_165084 ?auto_165085 ) ) ( not ( = ?auto_165084 ?auto_165090 ) ) ( not ( = ?auto_165085 ?auto_165090 ) ) ( ON ?auto_165085 ?auto_165084 ) ( not ( = ?auto_165089 ?auto_165086 ) ) ( not ( = ?auto_165089 ?auto_165083 ) ) ( not ( = ?auto_165089 ?auto_165088 ) ) ( not ( = ?auto_165089 ?auto_165090 ) ) ( not ( = ?auto_165086 ?auto_165083 ) ) ( not ( = ?auto_165086 ?auto_165088 ) ) ( not ( = ?auto_165086 ?auto_165090 ) ) ( not ( = ?auto_165083 ?auto_165088 ) ) ( not ( = ?auto_165083 ?auto_165090 ) ) ( not ( = ?auto_165088 ?auto_165090 ) ) ( not ( = ?auto_165082 ?auto_165088 ) ) ( not ( = ?auto_165082 ?auto_165089 ) ) ( not ( = ?auto_165082 ?auto_165086 ) ) ( not ( = ?auto_165082 ?auto_165083 ) ) ( not ( = ?auto_165084 ?auto_165088 ) ) ( not ( = ?auto_165084 ?auto_165089 ) ) ( not ( = ?auto_165084 ?auto_165086 ) ) ( not ( = ?auto_165084 ?auto_165083 ) ) ( not ( = ?auto_165085 ?auto_165088 ) ) ( not ( = ?auto_165085 ?auto_165089 ) ) ( not ( = ?auto_165085 ?auto_165086 ) ) ( not ( = ?auto_165085 ?auto_165083 ) ) ( ON ?auto_165090 ?auto_165085 ) ( ON ?auto_165088 ?auto_165090 ) ( ON ?auto_165089 ?auto_165087 ) ( not ( = ?auto_165082 ?auto_165087 ) ) ( not ( = ?auto_165084 ?auto_165087 ) ) ( not ( = ?auto_165085 ?auto_165087 ) ) ( not ( = ?auto_165090 ?auto_165087 ) ) ( not ( = ?auto_165089 ?auto_165087 ) ) ( not ( = ?auto_165086 ?auto_165087 ) ) ( not ( = ?auto_165083 ?auto_165087 ) ) ( not ( = ?auto_165088 ?auto_165087 ) ) ( ON ?auto_165086 ?auto_165089 ) ( ON-TABLE ?auto_165087 ) ( CLEAR ?auto_165088 ) ( ON ?auto_165083 ?auto_165086 ) ( CLEAR ?auto_165083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165087 ?auto_165089 ?auto_165086 )
      ( MAKE-1PILE ?auto_165082 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165134 - BLOCK
      ?auto_165135 - BLOCK
      ?auto_165136 - BLOCK
      ?auto_165137 - BLOCK
      ?auto_165138 - BLOCK
      ?auto_165139 - BLOCK
      ?auto_165140 - BLOCK
    )
    :vars
    (
      ?auto_165141 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165134 ) ( ON ?auto_165135 ?auto_165134 ) ( ON ?auto_165136 ?auto_165135 ) ( ON ?auto_165137 ?auto_165136 ) ( ON ?auto_165138 ?auto_165137 ) ( not ( = ?auto_165134 ?auto_165135 ) ) ( not ( = ?auto_165134 ?auto_165136 ) ) ( not ( = ?auto_165134 ?auto_165137 ) ) ( not ( = ?auto_165134 ?auto_165138 ) ) ( not ( = ?auto_165134 ?auto_165139 ) ) ( not ( = ?auto_165134 ?auto_165140 ) ) ( not ( = ?auto_165135 ?auto_165136 ) ) ( not ( = ?auto_165135 ?auto_165137 ) ) ( not ( = ?auto_165135 ?auto_165138 ) ) ( not ( = ?auto_165135 ?auto_165139 ) ) ( not ( = ?auto_165135 ?auto_165140 ) ) ( not ( = ?auto_165136 ?auto_165137 ) ) ( not ( = ?auto_165136 ?auto_165138 ) ) ( not ( = ?auto_165136 ?auto_165139 ) ) ( not ( = ?auto_165136 ?auto_165140 ) ) ( not ( = ?auto_165137 ?auto_165138 ) ) ( not ( = ?auto_165137 ?auto_165139 ) ) ( not ( = ?auto_165137 ?auto_165140 ) ) ( not ( = ?auto_165138 ?auto_165139 ) ) ( not ( = ?auto_165138 ?auto_165140 ) ) ( not ( = ?auto_165139 ?auto_165140 ) ) ( ON ?auto_165140 ?auto_165141 ) ( not ( = ?auto_165134 ?auto_165141 ) ) ( not ( = ?auto_165135 ?auto_165141 ) ) ( not ( = ?auto_165136 ?auto_165141 ) ) ( not ( = ?auto_165137 ?auto_165141 ) ) ( not ( = ?auto_165138 ?auto_165141 ) ) ( not ( = ?auto_165139 ?auto_165141 ) ) ( not ( = ?auto_165140 ?auto_165141 ) ) ( CLEAR ?auto_165138 ) ( ON ?auto_165139 ?auto_165140 ) ( CLEAR ?auto_165139 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165141 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165141 ?auto_165140 )
      ( MAKE-7PILE ?auto_165134 ?auto_165135 ?auto_165136 ?auto_165137 ?auto_165138 ?auto_165139 ?auto_165140 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165142 - BLOCK
      ?auto_165143 - BLOCK
      ?auto_165144 - BLOCK
      ?auto_165145 - BLOCK
      ?auto_165146 - BLOCK
      ?auto_165147 - BLOCK
      ?auto_165148 - BLOCK
    )
    :vars
    (
      ?auto_165149 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165142 ) ( ON ?auto_165143 ?auto_165142 ) ( ON ?auto_165144 ?auto_165143 ) ( ON ?auto_165145 ?auto_165144 ) ( not ( = ?auto_165142 ?auto_165143 ) ) ( not ( = ?auto_165142 ?auto_165144 ) ) ( not ( = ?auto_165142 ?auto_165145 ) ) ( not ( = ?auto_165142 ?auto_165146 ) ) ( not ( = ?auto_165142 ?auto_165147 ) ) ( not ( = ?auto_165142 ?auto_165148 ) ) ( not ( = ?auto_165143 ?auto_165144 ) ) ( not ( = ?auto_165143 ?auto_165145 ) ) ( not ( = ?auto_165143 ?auto_165146 ) ) ( not ( = ?auto_165143 ?auto_165147 ) ) ( not ( = ?auto_165143 ?auto_165148 ) ) ( not ( = ?auto_165144 ?auto_165145 ) ) ( not ( = ?auto_165144 ?auto_165146 ) ) ( not ( = ?auto_165144 ?auto_165147 ) ) ( not ( = ?auto_165144 ?auto_165148 ) ) ( not ( = ?auto_165145 ?auto_165146 ) ) ( not ( = ?auto_165145 ?auto_165147 ) ) ( not ( = ?auto_165145 ?auto_165148 ) ) ( not ( = ?auto_165146 ?auto_165147 ) ) ( not ( = ?auto_165146 ?auto_165148 ) ) ( not ( = ?auto_165147 ?auto_165148 ) ) ( ON ?auto_165148 ?auto_165149 ) ( not ( = ?auto_165142 ?auto_165149 ) ) ( not ( = ?auto_165143 ?auto_165149 ) ) ( not ( = ?auto_165144 ?auto_165149 ) ) ( not ( = ?auto_165145 ?auto_165149 ) ) ( not ( = ?auto_165146 ?auto_165149 ) ) ( not ( = ?auto_165147 ?auto_165149 ) ) ( not ( = ?auto_165148 ?auto_165149 ) ) ( ON ?auto_165147 ?auto_165148 ) ( CLEAR ?auto_165147 ) ( ON-TABLE ?auto_165149 ) ( HOLDING ?auto_165146 ) ( CLEAR ?auto_165145 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165142 ?auto_165143 ?auto_165144 ?auto_165145 ?auto_165146 )
      ( MAKE-7PILE ?auto_165142 ?auto_165143 ?auto_165144 ?auto_165145 ?auto_165146 ?auto_165147 ?auto_165148 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165150 - BLOCK
      ?auto_165151 - BLOCK
      ?auto_165152 - BLOCK
      ?auto_165153 - BLOCK
      ?auto_165154 - BLOCK
      ?auto_165155 - BLOCK
      ?auto_165156 - BLOCK
    )
    :vars
    (
      ?auto_165157 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165150 ) ( ON ?auto_165151 ?auto_165150 ) ( ON ?auto_165152 ?auto_165151 ) ( ON ?auto_165153 ?auto_165152 ) ( not ( = ?auto_165150 ?auto_165151 ) ) ( not ( = ?auto_165150 ?auto_165152 ) ) ( not ( = ?auto_165150 ?auto_165153 ) ) ( not ( = ?auto_165150 ?auto_165154 ) ) ( not ( = ?auto_165150 ?auto_165155 ) ) ( not ( = ?auto_165150 ?auto_165156 ) ) ( not ( = ?auto_165151 ?auto_165152 ) ) ( not ( = ?auto_165151 ?auto_165153 ) ) ( not ( = ?auto_165151 ?auto_165154 ) ) ( not ( = ?auto_165151 ?auto_165155 ) ) ( not ( = ?auto_165151 ?auto_165156 ) ) ( not ( = ?auto_165152 ?auto_165153 ) ) ( not ( = ?auto_165152 ?auto_165154 ) ) ( not ( = ?auto_165152 ?auto_165155 ) ) ( not ( = ?auto_165152 ?auto_165156 ) ) ( not ( = ?auto_165153 ?auto_165154 ) ) ( not ( = ?auto_165153 ?auto_165155 ) ) ( not ( = ?auto_165153 ?auto_165156 ) ) ( not ( = ?auto_165154 ?auto_165155 ) ) ( not ( = ?auto_165154 ?auto_165156 ) ) ( not ( = ?auto_165155 ?auto_165156 ) ) ( ON ?auto_165156 ?auto_165157 ) ( not ( = ?auto_165150 ?auto_165157 ) ) ( not ( = ?auto_165151 ?auto_165157 ) ) ( not ( = ?auto_165152 ?auto_165157 ) ) ( not ( = ?auto_165153 ?auto_165157 ) ) ( not ( = ?auto_165154 ?auto_165157 ) ) ( not ( = ?auto_165155 ?auto_165157 ) ) ( not ( = ?auto_165156 ?auto_165157 ) ) ( ON ?auto_165155 ?auto_165156 ) ( ON-TABLE ?auto_165157 ) ( CLEAR ?auto_165153 ) ( ON ?auto_165154 ?auto_165155 ) ( CLEAR ?auto_165154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165157 ?auto_165156 ?auto_165155 )
      ( MAKE-7PILE ?auto_165150 ?auto_165151 ?auto_165152 ?auto_165153 ?auto_165154 ?auto_165155 ?auto_165156 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165158 - BLOCK
      ?auto_165159 - BLOCK
      ?auto_165160 - BLOCK
      ?auto_165161 - BLOCK
      ?auto_165162 - BLOCK
      ?auto_165163 - BLOCK
      ?auto_165164 - BLOCK
    )
    :vars
    (
      ?auto_165165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165158 ) ( ON ?auto_165159 ?auto_165158 ) ( ON ?auto_165160 ?auto_165159 ) ( not ( = ?auto_165158 ?auto_165159 ) ) ( not ( = ?auto_165158 ?auto_165160 ) ) ( not ( = ?auto_165158 ?auto_165161 ) ) ( not ( = ?auto_165158 ?auto_165162 ) ) ( not ( = ?auto_165158 ?auto_165163 ) ) ( not ( = ?auto_165158 ?auto_165164 ) ) ( not ( = ?auto_165159 ?auto_165160 ) ) ( not ( = ?auto_165159 ?auto_165161 ) ) ( not ( = ?auto_165159 ?auto_165162 ) ) ( not ( = ?auto_165159 ?auto_165163 ) ) ( not ( = ?auto_165159 ?auto_165164 ) ) ( not ( = ?auto_165160 ?auto_165161 ) ) ( not ( = ?auto_165160 ?auto_165162 ) ) ( not ( = ?auto_165160 ?auto_165163 ) ) ( not ( = ?auto_165160 ?auto_165164 ) ) ( not ( = ?auto_165161 ?auto_165162 ) ) ( not ( = ?auto_165161 ?auto_165163 ) ) ( not ( = ?auto_165161 ?auto_165164 ) ) ( not ( = ?auto_165162 ?auto_165163 ) ) ( not ( = ?auto_165162 ?auto_165164 ) ) ( not ( = ?auto_165163 ?auto_165164 ) ) ( ON ?auto_165164 ?auto_165165 ) ( not ( = ?auto_165158 ?auto_165165 ) ) ( not ( = ?auto_165159 ?auto_165165 ) ) ( not ( = ?auto_165160 ?auto_165165 ) ) ( not ( = ?auto_165161 ?auto_165165 ) ) ( not ( = ?auto_165162 ?auto_165165 ) ) ( not ( = ?auto_165163 ?auto_165165 ) ) ( not ( = ?auto_165164 ?auto_165165 ) ) ( ON ?auto_165163 ?auto_165164 ) ( ON-TABLE ?auto_165165 ) ( ON ?auto_165162 ?auto_165163 ) ( CLEAR ?auto_165162 ) ( HOLDING ?auto_165161 ) ( CLEAR ?auto_165160 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165158 ?auto_165159 ?auto_165160 ?auto_165161 )
      ( MAKE-7PILE ?auto_165158 ?auto_165159 ?auto_165160 ?auto_165161 ?auto_165162 ?auto_165163 ?auto_165164 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165166 - BLOCK
      ?auto_165167 - BLOCK
      ?auto_165168 - BLOCK
      ?auto_165169 - BLOCK
      ?auto_165170 - BLOCK
      ?auto_165171 - BLOCK
      ?auto_165172 - BLOCK
    )
    :vars
    (
      ?auto_165173 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165166 ) ( ON ?auto_165167 ?auto_165166 ) ( ON ?auto_165168 ?auto_165167 ) ( not ( = ?auto_165166 ?auto_165167 ) ) ( not ( = ?auto_165166 ?auto_165168 ) ) ( not ( = ?auto_165166 ?auto_165169 ) ) ( not ( = ?auto_165166 ?auto_165170 ) ) ( not ( = ?auto_165166 ?auto_165171 ) ) ( not ( = ?auto_165166 ?auto_165172 ) ) ( not ( = ?auto_165167 ?auto_165168 ) ) ( not ( = ?auto_165167 ?auto_165169 ) ) ( not ( = ?auto_165167 ?auto_165170 ) ) ( not ( = ?auto_165167 ?auto_165171 ) ) ( not ( = ?auto_165167 ?auto_165172 ) ) ( not ( = ?auto_165168 ?auto_165169 ) ) ( not ( = ?auto_165168 ?auto_165170 ) ) ( not ( = ?auto_165168 ?auto_165171 ) ) ( not ( = ?auto_165168 ?auto_165172 ) ) ( not ( = ?auto_165169 ?auto_165170 ) ) ( not ( = ?auto_165169 ?auto_165171 ) ) ( not ( = ?auto_165169 ?auto_165172 ) ) ( not ( = ?auto_165170 ?auto_165171 ) ) ( not ( = ?auto_165170 ?auto_165172 ) ) ( not ( = ?auto_165171 ?auto_165172 ) ) ( ON ?auto_165172 ?auto_165173 ) ( not ( = ?auto_165166 ?auto_165173 ) ) ( not ( = ?auto_165167 ?auto_165173 ) ) ( not ( = ?auto_165168 ?auto_165173 ) ) ( not ( = ?auto_165169 ?auto_165173 ) ) ( not ( = ?auto_165170 ?auto_165173 ) ) ( not ( = ?auto_165171 ?auto_165173 ) ) ( not ( = ?auto_165172 ?auto_165173 ) ) ( ON ?auto_165171 ?auto_165172 ) ( ON-TABLE ?auto_165173 ) ( ON ?auto_165170 ?auto_165171 ) ( CLEAR ?auto_165168 ) ( ON ?auto_165169 ?auto_165170 ) ( CLEAR ?auto_165169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165173 ?auto_165172 ?auto_165171 ?auto_165170 )
      ( MAKE-7PILE ?auto_165166 ?auto_165167 ?auto_165168 ?auto_165169 ?auto_165170 ?auto_165171 ?auto_165172 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165174 - BLOCK
      ?auto_165175 - BLOCK
      ?auto_165176 - BLOCK
      ?auto_165177 - BLOCK
      ?auto_165178 - BLOCK
      ?auto_165179 - BLOCK
      ?auto_165180 - BLOCK
    )
    :vars
    (
      ?auto_165181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165174 ) ( ON ?auto_165175 ?auto_165174 ) ( not ( = ?auto_165174 ?auto_165175 ) ) ( not ( = ?auto_165174 ?auto_165176 ) ) ( not ( = ?auto_165174 ?auto_165177 ) ) ( not ( = ?auto_165174 ?auto_165178 ) ) ( not ( = ?auto_165174 ?auto_165179 ) ) ( not ( = ?auto_165174 ?auto_165180 ) ) ( not ( = ?auto_165175 ?auto_165176 ) ) ( not ( = ?auto_165175 ?auto_165177 ) ) ( not ( = ?auto_165175 ?auto_165178 ) ) ( not ( = ?auto_165175 ?auto_165179 ) ) ( not ( = ?auto_165175 ?auto_165180 ) ) ( not ( = ?auto_165176 ?auto_165177 ) ) ( not ( = ?auto_165176 ?auto_165178 ) ) ( not ( = ?auto_165176 ?auto_165179 ) ) ( not ( = ?auto_165176 ?auto_165180 ) ) ( not ( = ?auto_165177 ?auto_165178 ) ) ( not ( = ?auto_165177 ?auto_165179 ) ) ( not ( = ?auto_165177 ?auto_165180 ) ) ( not ( = ?auto_165178 ?auto_165179 ) ) ( not ( = ?auto_165178 ?auto_165180 ) ) ( not ( = ?auto_165179 ?auto_165180 ) ) ( ON ?auto_165180 ?auto_165181 ) ( not ( = ?auto_165174 ?auto_165181 ) ) ( not ( = ?auto_165175 ?auto_165181 ) ) ( not ( = ?auto_165176 ?auto_165181 ) ) ( not ( = ?auto_165177 ?auto_165181 ) ) ( not ( = ?auto_165178 ?auto_165181 ) ) ( not ( = ?auto_165179 ?auto_165181 ) ) ( not ( = ?auto_165180 ?auto_165181 ) ) ( ON ?auto_165179 ?auto_165180 ) ( ON-TABLE ?auto_165181 ) ( ON ?auto_165178 ?auto_165179 ) ( ON ?auto_165177 ?auto_165178 ) ( CLEAR ?auto_165177 ) ( HOLDING ?auto_165176 ) ( CLEAR ?auto_165175 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165174 ?auto_165175 ?auto_165176 )
      ( MAKE-7PILE ?auto_165174 ?auto_165175 ?auto_165176 ?auto_165177 ?auto_165178 ?auto_165179 ?auto_165180 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165182 - BLOCK
      ?auto_165183 - BLOCK
      ?auto_165184 - BLOCK
      ?auto_165185 - BLOCK
      ?auto_165186 - BLOCK
      ?auto_165187 - BLOCK
      ?auto_165188 - BLOCK
    )
    :vars
    (
      ?auto_165189 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165182 ) ( ON ?auto_165183 ?auto_165182 ) ( not ( = ?auto_165182 ?auto_165183 ) ) ( not ( = ?auto_165182 ?auto_165184 ) ) ( not ( = ?auto_165182 ?auto_165185 ) ) ( not ( = ?auto_165182 ?auto_165186 ) ) ( not ( = ?auto_165182 ?auto_165187 ) ) ( not ( = ?auto_165182 ?auto_165188 ) ) ( not ( = ?auto_165183 ?auto_165184 ) ) ( not ( = ?auto_165183 ?auto_165185 ) ) ( not ( = ?auto_165183 ?auto_165186 ) ) ( not ( = ?auto_165183 ?auto_165187 ) ) ( not ( = ?auto_165183 ?auto_165188 ) ) ( not ( = ?auto_165184 ?auto_165185 ) ) ( not ( = ?auto_165184 ?auto_165186 ) ) ( not ( = ?auto_165184 ?auto_165187 ) ) ( not ( = ?auto_165184 ?auto_165188 ) ) ( not ( = ?auto_165185 ?auto_165186 ) ) ( not ( = ?auto_165185 ?auto_165187 ) ) ( not ( = ?auto_165185 ?auto_165188 ) ) ( not ( = ?auto_165186 ?auto_165187 ) ) ( not ( = ?auto_165186 ?auto_165188 ) ) ( not ( = ?auto_165187 ?auto_165188 ) ) ( ON ?auto_165188 ?auto_165189 ) ( not ( = ?auto_165182 ?auto_165189 ) ) ( not ( = ?auto_165183 ?auto_165189 ) ) ( not ( = ?auto_165184 ?auto_165189 ) ) ( not ( = ?auto_165185 ?auto_165189 ) ) ( not ( = ?auto_165186 ?auto_165189 ) ) ( not ( = ?auto_165187 ?auto_165189 ) ) ( not ( = ?auto_165188 ?auto_165189 ) ) ( ON ?auto_165187 ?auto_165188 ) ( ON-TABLE ?auto_165189 ) ( ON ?auto_165186 ?auto_165187 ) ( ON ?auto_165185 ?auto_165186 ) ( CLEAR ?auto_165183 ) ( ON ?auto_165184 ?auto_165185 ) ( CLEAR ?auto_165184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165189 ?auto_165188 ?auto_165187 ?auto_165186 ?auto_165185 )
      ( MAKE-7PILE ?auto_165182 ?auto_165183 ?auto_165184 ?auto_165185 ?auto_165186 ?auto_165187 ?auto_165188 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165190 - BLOCK
      ?auto_165191 - BLOCK
      ?auto_165192 - BLOCK
      ?auto_165193 - BLOCK
      ?auto_165194 - BLOCK
      ?auto_165195 - BLOCK
      ?auto_165196 - BLOCK
    )
    :vars
    (
      ?auto_165197 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165190 ) ( not ( = ?auto_165190 ?auto_165191 ) ) ( not ( = ?auto_165190 ?auto_165192 ) ) ( not ( = ?auto_165190 ?auto_165193 ) ) ( not ( = ?auto_165190 ?auto_165194 ) ) ( not ( = ?auto_165190 ?auto_165195 ) ) ( not ( = ?auto_165190 ?auto_165196 ) ) ( not ( = ?auto_165191 ?auto_165192 ) ) ( not ( = ?auto_165191 ?auto_165193 ) ) ( not ( = ?auto_165191 ?auto_165194 ) ) ( not ( = ?auto_165191 ?auto_165195 ) ) ( not ( = ?auto_165191 ?auto_165196 ) ) ( not ( = ?auto_165192 ?auto_165193 ) ) ( not ( = ?auto_165192 ?auto_165194 ) ) ( not ( = ?auto_165192 ?auto_165195 ) ) ( not ( = ?auto_165192 ?auto_165196 ) ) ( not ( = ?auto_165193 ?auto_165194 ) ) ( not ( = ?auto_165193 ?auto_165195 ) ) ( not ( = ?auto_165193 ?auto_165196 ) ) ( not ( = ?auto_165194 ?auto_165195 ) ) ( not ( = ?auto_165194 ?auto_165196 ) ) ( not ( = ?auto_165195 ?auto_165196 ) ) ( ON ?auto_165196 ?auto_165197 ) ( not ( = ?auto_165190 ?auto_165197 ) ) ( not ( = ?auto_165191 ?auto_165197 ) ) ( not ( = ?auto_165192 ?auto_165197 ) ) ( not ( = ?auto_165193 ?auto_165197 ) ) ( not ( = ?auto_165194 ?auto_165197 ) ) ( not ( = ?auto_165195 ?auto_165197 ) ) ( not ( = ?auto_165196 ?auto_165197 ) ) ( ON ?auto_165195 ?auto_165196 ) ( ON-TABLE ?auto_165197 ) ( ON ?auto_165194 ?auto_165195 ) ( ON ?auto_165193 ?auto_165194 ) ( ON ?auto_165192 ?auto_165193 ) ( CLEAR ?auto_165192 ) ( HOLDING ?auto_165191 ) ( CLEAR ?auto_165190 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165190 ?auto_165191 )
      ( MAKE-7PILE ?auto_165190 ?auto_165191 ?auto_165192 ?auto_165193 ?auto_165194 ?auto_165195 ?auto_165196 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165198 - BLOCK
      ?auto_165199 - BLOCK
      ?auto_165200 - BLOCK
      ?auto_165201 - BLOCK
      ?auto_165202 - BLOCK
      ?auto_165203 - BLOCK
      ?auto_165204 - BLOCK
    )
    :vars
    (
      ?auto_165205 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165198 ) ( not ( = ?auto_165198 ?auto_165199 ) ) ( not ( = ?auto_165198 ?auto_165200 ) ) ( not ( = ?auto_165198 ?auto_165201 ) ) ( not ( = ?auto_165198 ?auto_165202 ) ) ( not ( = ?auto_165198 ?auto_165203 ) ) ( not ( = ?auto_165198 ?auto_165204 ) ) ( not ( = ?auto_165199 ?auto_165200 ) ) ( not ( = ?auto_165199 ?auto_165201 ) ) ( not ( = ?auto_165199 ?auto_165202 ) ) ( not ( = ?auto_165199 ?auto_165203 ) ) ( not ( = ?auto_165199 ?auto_165204 ) ) ( not ( = ?auto_165200 ?auto_165201 ) ) ( not ( = ?auto_165200 ?auto_165202 ) ) ( not ( = ?auto_165200 ?auto_165203 ) ) ( not ( = ?auto_165200 ?auto_165204 ) ) ( not ( = ?auto_165201 ?auto_165202 ) ) ( not ( = ?auto_165201 ?auto_165203 ) ) ( not ( = ?auto_165201 ?auto_165204 ) ) ( not ( = ?auto_165202 ?auto_165203 ) ) ( not ( = ?auto_165202 ?auto_165204 ) ) ( not ( = ?auto_165203 ?auto_165204 ) ) ( ON ?auto_165204 ?auto_165205 ) ( not ( = ?auto_165198 ?auto_165205 ) ) ( not ( = ?auto_165199 ?auto_165205 ) ) ( not ( = ?auto_165200 ?auto_165205 ) ) ( not ( = ?auto_165201 ?auto_165205 ) ) ( not ( = ?auto_165202 ?auto_165205 ) ) ( not ( = ?auto_165203 ?auto_165205 ) ) ( not ( = ?auto_165204 ?auto_165205 ) ) ( ON ?auto_165203 ?auto_165204 ) ( ON-TABLE ?auto_165205 ) ( ON ?auto_165202 ?auto_165203 ) ( ON ?auto_165201 ?auto_165202 ) ( ON ?auto_165200 ?auto_165201 ) ( CLEAR ?auto_165198 ) ( ON ?auto_165199 ?auto_165200 ) ( CLEAR ?auto_165199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165205 ?auto_165204 ?auto_165203 ?auto_165202 ?auto_165201 ?auto_165200 )
      ( MAKE-7PILE ?auto_165198 ?auto_165199 ?auto_165200 ?auto_165201 ?auto_165202 ?auto_165203 ?auto_165204 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165206 - BLOCK
      ?auto_165207 - BLOCK
      ?auto_165208 - BLOCK
      ?auto_165209 - BLOCK
      ?auto_165210 - BLOCK
      ?auto_165211 - BLOCK
      ?auto_165212 - BLOCK
    )
    :vars
    (
      ?auto_165213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165206 ?auto_165207 ) ) ( not ( = ?auto_165206 ?auto_165208 ) ) ( not ( = ?auto_165206 ?auto_165209 ) ) ( not ( = ?auto_165206 ?auto_165210 ) ) ( not ( = ?auto_165206 ?auto_165211 ) ) ( not ( = ?auto_165206 ?auto_165212 ) ) ( not ( = ?auto_165207 ?auto_165208 ) ) ( not ( = ?auto_165207 ?auto_165209 ) ) ( not ( = ?auto_165207 ?auto_165210 ) ) ( not ( = ?auto_165207 ?auto_165211 ) ) ( not ( = ?auto_165207 ?auto_165212 ) ) ( not ( = ?auto_165208 ?auto_165209 ) ) ( not ( = ?auto_165208 ?auto_165210 ) ) ( not ( = ?auto_165208 ?auto_165211 ) ) ( not ( = ?auto_165208 ?auto_165212 ) ) ( not ( = ?auto_165209 ?auto_165210 ) ) ( not ( = ?auto_165209 ?auto_165211 ) ) ( not ( = ?auto_165209 ?auto_165212 ) ) ( not ( = ?auto_165210 ?auto_165211 ) ) ( not ( = ?auto_165210 ?auto_165212 ) ) ( not ( = ?auto_165211 ?auto_165212 ) ) ( ON ?auto_165212 ?auto_165213 ) ( not ( = ?auto_165206 ?auto_165213 ) ) ( not ( = ?auto_165207 ?auto_165213 ) ) ( not ( = ?auto_165208 ?auto_165213 ) ) ( not ( = ?auto_165209 ?auto_165213 ) ) ( not ( = ?auto_165210 ?auto_165213 ) ) ( not ( = ?auto_165211 ?auto_165213 ) ) ( not ( = ?auto_165212 ?auto_165213 ) ) ( ON ?auto_165211 ?auto_165212 ) ( ON-TABLE ?auto_165213 ) ( ON ?auto_165210 ?auto_165211 ) ( ON ?auto_165209 ?auto_165210 ) ( ON ?auto_165208 ?auto_165209 ) ( ON ?auto_165207 ?auto_165208 ) ( CLEAR ?auto_165207 ) ( HOLDING ?auto_165206 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165206 )
      ( MAKE-7PILE ?auto_165206 ?auto_165207 ?auto_165208 ?auto_165209 ?auto_165210 ?auto_165211 ?auto_165212 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165214 - BLOCK
      ?auto_165215 - BLOCK
      ?auto_165216 - BLOCK
      ?auto_165217 - BLOCK
      ?auto_165218 - BLOCK
      ?auto_165219 - BLOCK
      ?auto_165220 - BLOCK
    )
    :vars
    (
      ?auto_165221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165214 ?auto_165215 ) ) ( not ( = ?auto_165214 ?auto_165216 ) ) ( not ( = ?auto_165214 ?auto_165217 ) ) ( not ( = ?auto_165214 ?auto_165218 ) ) ( not ( = ?auto_165214 ?auto_165219 ) ) ( not ( = ?auto_165214 ?auto_165220 ) ) ( not ( = ?auto_165215 ?auto_165216 ) ) ( not ( = ?auto_165215 ?auto_165217 ) ) ( not ( = ?auto_165215 ?auto_165218 ) ) ( not ( = ?auto_165215 ?auto_165219 ) ) ( not ( = ?auto_165215 ?auto_165220 ) ) ( not ( = ?auto_165216 ?auto_165217 ) ) ( not ( = ?auto_165216 ?auto_165218 ) ) ( not ( = ?auto_165216 ?auto_165219 ) ) ( not ( = ?auto_165216 ?auto_165220 ) ) ( not ( = ?auto_165217 ?auto_165218 ) ) ( not ( = ?auto_165217 ?auto_165219 ) ) ( not ( = ?auto_165217 ?auto_165220 ) ) ( not ( = ?auto_165218 ?auto_165219 ) ) ( not ( = ?auto_165218 ?auto_165220 ) ) ( not ( = ?auto_165219 ?auto_165220 ) ) ( ON ?auto_165220 ?auto_165221 ) ( not ( = ?auto_165214 ?auto_165221 ) ) ( not ( = ?auto_165215 ?auto_165221 ) ) ( not ( = ?auto_165216 ?auto_165221 ) ) ( not ( = ?auto_165217 ?auto_165221 ) ) ( not ( = ?auto_165218 ?auto_165221 ) ) ( not ( = ?auto_165219 ?auto_165221 ) ) ( not ( = ?auto_165220 ?auto_165221 ) ) ( ON ?auto_165219 ?auto_165220 ) ( ON-TABLE ?auto_165221 ) ( ON ?auto_165218 ?auto_165219 ) ( ON ?auto_165217 ?auto_165218 ) ( ON ?auto_165216 ?auto_165217 ) ( ON ?auto_165215 ?auto_165216 ) ( ON ?auto_165214 ?auto_165215 ) ( CLEAR ?auto_165214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165221 ?auto_165220 ?auto_165219 ?auto_165218 ?auto_165217 ?auto_165216 ?auto_165215 )
      ( MAKE-7PILE ?auto_165214 ?auto_165215 ?auto_165216 ?auto_165217 ?auto_165218 ?auto_165219 ?auto_165220 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165229 - BLOCK
      ?auto_165230 - BLOCK
      ?auto_165231 - BLOCK
      ?auto_165232 - BLOCK
      ?auto_165233 - BLOCK
      ?auto_165234 - BLOCK
      ?auto_165235 - BLOCK
    )
    :vars
    (
      ?auto_165236 - BLOCK
      ?auto_165237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165229 ?auto_165230 ) ) ( not ( = ?auto_165229 ?auto_165231 ) ) ( not ( = ?auto_165229 ?auto_165232 ) ) ( not ( = ?auto_165229 ?auto_165233 ) ) ( not ( = ?auto_165229 ?auto_165234 ) ) ( not ( = ?auto_165229 ?auto_165235 ) ) ( not ( = ?auto_165230 ?auto_165231 ) ) ( not ( = ?auto_165230 ?auto_165232 ) ) ( not ( = ?auto_165230 ?auto_165233 ) ) ( not ( = ?auto_165230 ?auto_165234 ) ) ( not ( = ?auto_165230 ?auto_165235 ) ) ( not ( = ?auto_165231 ?auto_165232 ) ) ( not ( = ?auto_165231 ?auto_165233 ) ) ( not ( = ?auto_165231 ?auto_165234 ) ) ( not ( = ?auto_165231 ?auto_165235 ) ) ( not ( = ?auto_165232 ?auto_165233 ) ) ( not ( = ?auto_165232 ?auto_165234 ) ) ( not ( = ?auto_165232 ?auto_165235 ) ) ( not ( = ?auto_165233 ?auto_165234 ) ) ( not ( = ?auto_165233 ?auto_165235 ) ) ( not ( = ?auto_165234 ?auto_165235 ) ) ( ON ?auto_165235 ?auto_165236 ) ( not ( = ?auto_165229 ?auto_165236 ) ) ( not ( = ?auto_165230 ?auto_165236 ) ) ( not ( = ?auto_165231 ?auto_165236 ) ) ( not ( = ?auto_165232 ?auto_165236 ) ) ( not ( = ?auto_165233 ?auto_165236 ) ) ( not ( = ?auto_165234 ?auto_165236 ) ) ( not ( = ?auto_165235 ?auto_165236 ) ) ( ON ?auto_165234 ?auto_165235 ) ( ON-TABLE ?auto_165236 ) ( ON ?auto_165233 ?auto_165234 ) ( ON ?auto_165232 ?auto_165233 ) ( ON ?auto_165231 ?auto_165232 ) ( ON ?auto_165230 ?auto_165231 ) ( CLEAR ?auto_165230 ) ( ON ?auto_165229 ?auto_165237 ) ( CLEAR ?auto_165229 ) ( HAND-EMPTY ) ( not ( = ?auto_165229 ?auto_165237 ) ) ( not ( = ?auto_165230 ?auto_165237 ) ) ( not ( = ?auto_165231 ?auto_165237 ) ) ( not ( = ?auto_165232 ?auto_165237 ) ) ( not ( = ?auto_165233 ?auto_165237 ) ) ( not ( = ?auto_165234 ?auto_165237 ) ) ( not ( = ?auto_165235 ?auto_165237 ) ) ( not ( = ?auto_165236 ?auto_165237 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165229 ?auto_165237 )
      ( MAKE-7PILE ?auto_165229 ?auto_165230 ?auto_165231 ?auto_165232 ?auto_165233 ?auto_165234 ?auto_165235 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165238 - BLOCK
      ?auto_165239 - BLOCK
      ?auto_165240 - BLOCK
      ?auto_165241 - BLOCK
      ?auto_165242 - BLOCK
      ?auto_165243 - BLOCK
      ?auto_165244 - BLOCK
    )
    :vars
    (
      ?auto_165245 - BLOCK
      ?auto_165246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165238 ?auto_165239 ) ) ( not ( = ?auto_165238 ?auto_165240 ) ) ( not ( = ?auto_165238 ?auto_165241 ) ) ( not ( = ?auto_165238 ?auto_165242 ) ) ( not ( = ?auto_165238 ?auto_165243 ) ) ( not ( = ?auto_165238 ?auto_165244 ) ) ( not ( = ?auto_165239 ?auto_165240 ) ) ( not ( = ?auto_165239 ?auto_165241 ) ) ( not ( = ?auto_165239 ?auto_165242 ) ) ( not ( = ?auto_165239 ?auto_165243 ) ) ( not ( = ?auto_165239 ?auto_165244 ) ) ( not ( = ?auto_165240 ?auto_165241 ) ) ( not ( = ?auto_165240 ?auto_165242 ) ) ( not ( = ?auto_165240 ?auto_165243 ) ) ( not ( = ?auto_165240 ?auto_165244 ) ) ( not ( = ?auto_165241 ?auto_165242 ) ) ( not ( = ?auto_165241 ?auto_165243 ) ) ( not ( = ?auto_165241 ?auto_165244 ) ) ( not ( = ?auto_165242 ?auto_165243 ) ) ( not ( = ?auto_165242 ?auto_165244 ) ) ( not ( = ?auto_165243 ?auto_165244 ) ) ( ON ?auto_165244 ?auto_165245 ) ( not ( = ?auto_165238 ?auto_165245 ) ) ( not ( = ?auto_165239 ?auto_165245 ) ) ( not ( = ?auto_165240 ?auto_165245 ) ) ( not ( = ?auto_165241 ?auto_165245 ) ) ( not ( = ?auto_165242 ?auto_165245 ) ) ( not ( = ?auto_165243 ?auto_165245 ) ) ( not ( = ?auto_165244 ?auto_165245 ) ) ( ON ?auto_165243 ?auto_165244 ) ( ON-TABLE ?auto_165245 ) ( ON ?auto_165242 ?auto_165243 ) ( ON ?auto_165241 ?auto_165242 ) ( ON ?auto_165240 ?auto_165241 ) ( ON ?auto_165238 ?auto_165246 ) ( CLEAR ?auto_165238 ) ( not ( = ?auto_165238 ?auto_165246 ) ) ( not ( = ?auto_165239 ?auto_165246 ) ) ( not ( = ?auto_165240 ?auto_165246 ) ) ( not ( = ?auto_165241 ?auto_165246 ) ) ( not ( = ?auto_165242 ?auto_165246 ) ) ( not ( = ?auto_165243 ?auto_165246 ) ) ( not ( = ?auto_165244 ?auto_165246 ) ) ( not ( = ?auto_165245 ?auto_165246 ) ) ( HOLDING ?auto_165239 ) ( CLEAR ?auto_165240 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165245 ?auto_165244 ?auto_165243 ?auto_165242 ?auto_165241 ?auto_165240 ?auto_165239 )
      ( MAKE-7PILE ?auto_165238 ?auto_165239 ?auto_165240 ?auto_165241 ?auto_165242 ?auto_165243 ?auto_165244 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165247 - BLOCK
      ?auto_165248 - BLOCK
      ?auto_165249 - BLOCK
      ?auto_165250 - BLOCK
      ?auto_165251 - BLOCK
      ?auto_165252 - BLOCK
      ?auto_165253 - BLOCK
    )
    :vars
    (
      ?auto_165254 - BLOCK
      ?auto_165255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165247 ?auto_165248 ) ) ( not ( = ?auto_165247 ?auto_165249 ) ) ( not ( = ?auto_165247 ?auto_165250 ) ) ( not ( = ?auto_165247 ?auto_165251 ) ) ( not ( = ?auto_165247 ?auto_165252 ) ) ( not ( = ?auto_165247 ?auto_165253 ) ) ( not ( = ?auto_165248 ?auto_165249 ) ) ( not ( = ?auto_165248 ?auto_165250 ) ) ( not ( = ?auto_165248 ?auto_165251 ) ) ( not ( = ?auto_165248 ?auto_165252 ) ) ( not ( = ?auto_165248 ?auto_165253 ) ) ( not ( = ?auto_165249 ?auto_165250 ) ) ( not ( = ?auto_165249 ?auto_165251 ) ) ( not ( = ?auto_165249 ?auto_165252 ) ) ( not ( = ?auto_165249 ?auto_165253 ) ) ( not ( = ?auto_165250 ?auto_165251 ) ) ( not ( = ?auto_165250 ?auto_165252 ) ) ( not ( = ?auto_165250 ?auto_165253 ) ) ( not ( = ?auto_165251 ?auto_165252 ) ) ( not ( = ?auto_165251 ?auto_165253 ) ) ( not ( = ?auto_165252 ?auto_165253 ) ) ( ON ?auto_165253 ?auto_165254 ) ( not ( = ?auto_165247 ?auto_165254 ) ) ( not ( = ?auto_165248 ?auto_165254 ) ) ( not ( = ?auto_165249 ?auto_165254 ) ) ( not ( = ?auto_165250 ?auto_165254 ) ) ( not ( = ?auto_165251 ?auto_165254 ) ) ( not ( = ?auto_165252 ?auto_165254 ) ) ( not ( = ?auto_165253 ?auto_165254 ) ) ( ON ?auto_165252 ?auto_165253 ) ( ON-TABLE ?auto_165254 ) ( ON ?auto_165251 ?auto_165252 ) ( ON ?auto_165250 ?auto_165251 ) ( ON ?auto_165249 ?auto_165250 ) ( ON ?auto_165247 ?auto_165255 ) ( not ( = ?auto_165247 ?auto_165255 ) ) ( not ( = ?auto_165248 ?auto_165255 ) ) ( not ( = ?auto_165249 ?auto_165255 ) ) ( not ( = ?auto_165250 ?auto_165255 ) ) ( not ( = ?auto_165251 ?auto_165255 ) ) ( not ( = ?auto_165252 ?auto_165255 ) ) ( not ( = ?auto_165253 ?auto_165255 ) ) ( not ( = ?auto_165254 ?auto_165255 ) ) ( CLEAR ?auto_165249 ) ( ON ?auto_165248 ?auto_165247 ) ( CLEAR ?auto_165248 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165255 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165255 ?auto_165247 )
      ( MAKE-7PILE ?auto_165247 ?auto_165248 ?auto_165249 ?auto_165250 ?auto_165251 ?auto_165252 ?auto_165253 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165256 - BLOCK
      ?auto_165257 - BLOCK
      ?auto_165258 - BLOCK
      ?auto_165259 - BLOCK
      ?auto_165260 - BLOCK
      ?auto_165261 - BLOCK
      ?auto_165262 - BLOCK
    )
    :vars
    (
      ?auto_165263 - BLOCK
      ?auto_165264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165256 ?auto_165257 ) ) ( not ( = ?auto_165256 ?auto_165258 ) ) ( not ( = ?auto_165256 ?auto_165259 ) ) ( not ( = ?auto_165256 ?auto_165260 ) ) ( not ( = ?auto_165256 ?auto_165261 ) ) ( not ( = ?auto_165256 ?auto_165262 ) ) ( not ( = ?auto_165257 ?auto_165258 ) ) ( not ( = ?auto_165257 ?auto_165259 ) ) ( not ( = ?auto_165257 ?auto_165260 ) ) ( not ( = ?auto_165257 ?auto_165261 ) ) ( not ( = ?auto_165257 ?auto_165262 ) ) ( not ( = ?auto_165258 ?auto_165259 ) ) ( not ( = ?auto_165258 ?auto_165260 ) ) ( not ( = ?auto_165258 ?auto_165261 ) ) ( not ( = ?auto_165258 ?auto_165262 ) ) ( not ( = ?auto_165259 ?auto_165260 ) ) ( not ( = ?auto_165259 ?auto_165261 ) ) ( not ( = ?auto_165259 ?auto_165262 ) ) ( not ( = ?auto_165260 ?auto_165261 ) ) ( not ( = ?auto_165260 ?auto_165262 ) ) ( not ( = ?auto_165261 ?auto_165262 ) ) ( ON ?auto_165262 ?auto_165263 ) ( not ( = ?auto_165256 ?auto_165263 ) ) ( not ( = ?auto_165257 ?auto_165263 ) ) ( not ( = ?auto_165258 ?auto_165263 ) ) ( not ( = ?auto_165259 ?auto_165263 ) ) ( not ( = ?auto_165260 ?auto_165263 ) ) ( not ( = ?auto_165261 ?auto_165263 ) ) ( not ( = ?auto_165262 ?auto_165263 ) ) ( ON ?auto_165261 ?auto_165262 ) ( ON-TABLE ?auto_165263 ) ( ON ?auto_165260 ?auto_165261 ) ( ON ?auto_165259 ?auto_165260 ) ( ON ?auto_165256 ?auto_165264 ) ( not ( = ?auto_165256 ?auto_165264 ) ) ( not ( = ?auto_165257 ?auto_165264 ) ) ( not ( = ?auto_165258 ?auto_165264 ) ) ( not ( = ?auto_165259 ?auto_165264 ) ) ( not ( = ?auto_165260 ?auto_165264 ) ) ( not ( = ?auto_165261 ?auto_165264 ) ) ( not ( = ?auto_165262 ?auto_165264 ) ) ( not ( = ?auto_165263 ?auto_165264 ) ) ( ON ?auto_165257 ?auto_165256 ) ( CLEAR ?auto_165257 ) ( ON-TABLE ?auto_165264 ) ( HOLDING ?auto_165258 ) ( CLEAR ?auto_165259 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165263 ?auto_165262 ?auto_165261 ?auto_165260 ?auto_165259 ?auto_165258 )
      ( MAKE-7PILE ?auto_165256 ?auto_165257 ?auto_165258 ?auto_165259 ?auto_165260 ?auto_165261 ?auto_165262 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165265 - BLOCK
      ?auto_165266 - BLOCK
      ?auto_165267 - BLOCK
      ?auto_165268 - BLOCK
      ?auto_165269 - BLOCK
      ?auto_165270 - BLOCK
      ?auto_165271 - BLOCK
    )
    :vars
    (
      ?auto_165272 - BLOCK
      ?auto_165273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165265 ?auto_165266 ) ) ( not ( = ?auto_165265 ?auto_165267 ) ) ( not ( = ?auto_165265 ?auto_165268 ) ) ( not ( = ?auto_165265 ?auto_165269 ) ) ( not ( = ?auto_165265 ?auto_165270 ) ) ( not ( = ?auto_165265 ?auto_165271 ) ) ( not ( = ?auto_165266 ?auto_165267 ) ) ( not ( = ?auto_165266 ?auto_165268 ) ) ( not ( = ?auto_165266 ?auto_165269 ) ) ( not ( = ?auto_165266 ?auto_165270 ) ) ( not ( = ?auto_165266 ?auto_165271 ) ) ( not ( = ?auto_165267 ?auto_165268 ) ) ( not ( = ?auto_165267 ?auto_165269 ) ) ( not ( = ?auto_165267 ?auto_165270 ) ) ( not ( = ?auto_165267 ?auto_165271 ) ) ( not ( = ?auto_165268 ?auto_165269 ) ) ( not ( = ?auto_165268 ?auto_165270 ) ) ( not ( = ?auto_165268 ?auto_165271 ) ) ( not ( = ?auto_165269 ?auto_165270 ) ) ( not ( = ?auto_165269 ?auto_165271 ) ) ( not ( = ?auto_165270 ?auto_165271 ) ) ( ON ?auto_165271 ?auto_165272 ) ( not ( = ?auto_165265 ?auto_165272 ) ) ( not ( = ?auto_165266 ?auto_165272 ) ) ( not ( = ?auto_165267 ?auto_165272 ) ) ( not ( = ?auto_165268 ?auto_165272 ) ) ( not ( = ?auto_165269 ?auto_165272 ) ) ( not ( = ?auto_165270 ?auto_165272 ) ) ( not ( = ?auto_165271 ?auto_165272 ) ) ( ON ?auto_165270 ?auto_165271 ) ( ON-TABLE ?auto_165272 ) ( ON ?auto_165269 ?auto_165270 ) ( ON ?auto_165268 ?auto_165269 ) ( ON ?auto_165265 ?auto_165273 ) ( not ( = ?auto_165265 ?auto_165273 ) ) ( not ( = ?auto_165266 ?auto_165273 ) ) ( not ( = ?auto_165267 ?auto_165273 ) ) ( not ( = ?auto_165268 ?auto_165273 ) ) ( not ( = ?auto_165269 ?auto_165273 ) ) ( not ( = ?auto_165270 ?auto_165273 ) ) ( not ( = ?auto_165271 ?auto_165273 ) ) ( not ( = ?auto_165272 ?auto_165273 ) ) ( ON ?auto_165266 ?auto_165265 ) ( ON-TABLE ?auto_165273 ) ( CLEAR ?auto_165268 ) ( ON ?auto_165267 ?auto_165266 ) ( CLEAR ?auto_165267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165273 ?auto_165265 ?auto_165266 )
      ( MAKE-7PILE ?auto_165265 ?auto_165266 ?auto_165267 ?auto_165268 ?auto_165269 ?auto_165270 ?auto_165271 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165274 - BLOCK
      ?auto_165275 - BLOCK
      ?auto_165276 - BLOCK
      ?auto_165277 - BLOCK
      ?auto_165278 - BLOCK
      ?auto_165279 - BLOCK
      ?auto_165280 - BLOCK
    )
    :vars
    (
      ?auto_165281 - BLOCK
      ?auto_165282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165274 ?auto_165275 ) ) ( not ( = ?auto_165274 ?auto_165276 ) ) ( not ( = ?auto_165274 ?auto_165277 ) ) ( not ( = ?auto_165274 ?auto_165278 ) ) ( not ( = ?auto_165274 ?auto_165279 ) ) ( not ( = ?auto_165274 ?auto_165280 ) ) ( not ( = ?auto_165275 ?auto_165276 ) ) ( not ( = ?auto_165275 ?auto_165277 ) ) ( not ( = ?auto_165275 ?auto_165278 ) ) ( not ( = ?auto_165275 ?auto_165279 ) ) ( not ( = ?auto_165275 ?auto_165280 ) ) ( not ( = ?auto_165276 ?auto_165277 ) ) ( not ( = ?auto_165276 ?auto_165278 ) ) ( not ( = ?auto_165276 ?auto_165279 ) ) ( not ( = ?auto_165276 ?auto_165280 ) ) ( not ( = ?auto_165277 ?auto_165278 ) ) ( not ( = ?auto_165277 ?auto_165279 ) ) ( not ( = ?auto_165277 ?auto_165280 ) ) ( not ( = ?auto_165278 ?auto_165279 ) ) ( not ( = ?auto_165278 ?auto_165280 ) ) ( not ( = ?auto_165279 ?auto_165280 ) ) ( ON ?auto_165280 ?auto_165281 ) ( not ( = ?auto_165274 ?auto_165281 ) ) ( not ( = ?auto_165275 ?auto_165281 ) ) ( not ( = ?auto_165276 ?auto_165281 ) ) ( not ( = ?auto_165277 ?auto_165281 ) ) ( not ( = ?auto_165278 ?auto_165281 ) ) ( not ( = ?auto_165279 ?auto_165281 ) ) ( not ( = ?auto_165280 ?auto_165281 ) ) ( ON ?auto_165279 ?auto_165280 ) ( ON-TABLE ?auto_165281 ) ( ON ?auto_165278 ?auto_165279 ) ( ON ?auto_165274 ?auto_165282 ) ( not ( = ?auto_165274 ?auto_165282 ) ) ( not ( = ?auto_165275 ?auto_165282 ) ) ( not ( = ?auto_165276 ?auto_165282 ) ) ( not ( = ?auto_165277 ?auto_165282 ) ) ( not ( = ?auto_165278 ?auto_165282 ) ) ( not ( = ?auto_165279 ?auto_165282 ) ) ( not ( = ?auto_165280 ?auto_165282 ) ) ( not ( = ?auto_165281 ?auto_165282 ) ) ( ON ?auto_165275 ?auto_165274 ) ( ON-TABLE ?auto_165282 ) ( ON ?auto_165276 ?auto_165275 ) ( CLEAR ?auto_165276 ) ( HOLDING ?auto_165277 ) ( CLEAR ?auto_165278 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165281 ?auto_165280 ?auto_165279 ?auto_165278 ?auto_165277 )
      ( MAKE-7PILE ?auto_165274 ?auto_165275 ?auto_165276 ?auto_165277 ?auto_165278 ?auto_165279 ?auto_165280 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165283 - BLOCK
      ?auto_165284 - BLOCK
      ?auto_165285 - BLOCK
      ?auto_165286 - BLOCK
      ?auto_165287 - BLOCK
      ?auto_165288 - BLOCK
      ?auto_165289 - BLOCK
    )
    :vars
    (
      ?auto_165290 - BLOCK
      ?auto_165291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165283 ?auto_165284 ) ) ( not ( = ?auto_165283 ?auto_165285 ) ) ( not ( = ?auto_165283 ?auto_165286 ) ) ( not ( = ?auto_165283 ?auto_165287 ) ) ( not ( = ?auto_165283 ?auto_165288 ) ) ( not ( = ?auto_165283 ?auto_165289 ) ) ( not ( = ?auto_165284 ?auto_165285 ) ) ( not ( = ?auto_165284 ?auto_165286 ) ) ( not ( = ?auto_165284 ?auto_165287 ) ) ( not ( = ?auto_165284 ?auto_165288 ) ) ( not ( = ?auto_165284 ?auto_165289 ) ) ( not ( = ?auto_165285 ?auto_165286 ) ) ( not ( = ?auto_165285 ?auto_165287 ) ) ( not ( = ?auto_165285 ?auto_165288 ) ) ( not ( = ?auto_165285 ?auto_165289 ) ) ( not ( = ?auto_165286 ?auto_165287 ) ) ( not ( = ?auto_165286 ?auto_165288 ) ) ( not ( = ?auto_165286 ?auto_165289 ) ) ( not ( = ?auto_165287 ?auto_165288 ) ) ( not ( = ?auto_165287 ?auto_165289 ) ) ( not ( = ?auto_165288 ?auto_165289 ) ) ( ON ?auto_165289 ?auto_165290 ) ( not ( = ?auto_165283 ?auto_165290 ) ) ( not ( = ?auto_165284 ?auto_165290 ) ) ( not ( = ?auto_165285 ?auto_165290 ) ) ( not ( = ?auto_165286 ?auto_165290 ) ) ( not ( = ?auto_165287 ?auto_165290 ) ) ( not ( = ?auto_165288 ?auto_165290 ) ) ( not ( = ?auto_165289 ?auto_165290 ) ) ( ON ?auto_165288 ?auto_165289 ) ( ON-TABLE ?auto_165290 ) ( ON ?auto_165287 ?auto_165288 ) ( ON ?auto_165283 ?auto_165291 ) ( not ( = ?auto_165283 ?auto_165291 ) ) ( not ( = ?auto_165284 ?auto_165291 ) ) ( not ( = ?auto_165285 ?auto_165291 ) ) ( not ( = ?auto_165286 ?auto_165291 ) ) ( not ( = ?auto_165287 ?auto_165291 ) ) ( not ( = ?auto_165288 ?auto_165291 ) ) ( not ( = ?auto_165289 ?auto_165291 ) ) ( not ( = ?auto_165290 ?auto_165291 ) ) ( ON ?auto_165284 ?auto_165283 ) ( ON-TABLE ?auto_165291 ) ( ON ?auto_165285 ?auto_165284 ) ( CLEAR ?auto_165287 ) ( ON ?auto_165286 ?auto_165285 ) ( CLEAR ?auto_165286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165291 ?auto_165283 ?auto_165284 ?auto_165285 )
      ( MAKE-7PILE ?auto_165283 ?auto_165284 ?auto_165285 ?auto_165286 ?auto_165287 ?auto_165288 ?auto_165289 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165292 - BLOCK
      ?auto_165293 - BLOCK
      ?auto_165294 - BLOCK
      ?auto_165295 - BLOCK
      ?auto_165296 - BLOCK
      ?auto_165297 - BLOCK
      ?auto_165298 - BLOCK
    )
    :vars
    (
      ?auto_165300 - BLOCK
      ?auto_165299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165292 ?auto_165293 ) ) ( not ( = ?auto_165292 ?auto_165294 ) ) ( not ( = ?auto_165292 ?auto_165295 ) ) ( not ( = ?auto_165292 ?auto_165296 ) ) ( not ( = ?auto_165292 ?auto_165297 ) ) ( not ( = ?auto_165292 ?auto_165298 ) ) ( not ( = ?auto_165293 ?auto_165294 ) ) ( not ( = ?auto_165293 ?auto_165295 ) ) ( not ( = ?auto_165293 ?auto_165296 ) ) ( not ( = ?auto_165293 ?auto_165297 ) ) ( not ( = ?auto_165293 ?auto_165298 ) ) ( not ( = ?auto_165294 ?auto_165295 ) ) ( not ( = ?auto_165294 ?auto_165296 ) ) ( not ( = ?auto_165294 ?auto_165297 ) ) ( not ( = ?auto_165294 ?auto_165298 ) ) ( not ( = ?auto_165295 ?auto_165296 ) ) ( not ( = ?auto_165295 ?auto_165297 ) ) ( not ( = ?auto_165295 ?auto_165298 ) ) ( not ( = ?auto_165296 ?auto_165297 ) ) ( not ( = ?auto_165296 ?auto_165298 ) ) ( not ( = ?auto_165297 ?auto_165298 ) ) ( ON ?auto_165298 ?auto_165300 ) ( not ( = ?auto_165292 ?auto_165300 ) ) ( not ( = ?auto_165293 ?auto_165300 ) ) ( not ( = ?auto_165294 ?auto_165300 ) ) ( not ( = ?auto_165295 ?auto_165300 ) ) ( not ( = ?auto_165296 ?auto_165300 ) ) ( not ( = ?auto_165297 ?auto_165300 ) ) ( not ( = ?auto_165298 ?auto_165300 ) ) ( ON ?auto_165297 ?auto_165298 ) ( ON-TABLE ?auto_165300 ) ( ON ?auto_165292 ?auto_165299 ) ( not ( = ?auto_165292 ?auto_165299 ) ) ( not ( = ?auto_165293 ?auto_165299 ) ) ( not ( = ?auto_165294 ?auto_165299 ) ) ( not ( = ?auto_165295 ?auto_165299 ) ) ( not ( = ?auto_165296 ?auto_165299 ) ) ( not ( = ?auto_165297 ?auto_165299 ) ) ( not ( = ?auto_165298 ?auto_165299 ) ) ( not ( = ?auto_165300 ?auto_165299 ) ) ( ON ?auto_165293 ?auto_165292 ) ( ON-TABLE ?auto_165299 ) ( ON ?auto_165294 ?auto_165293 ) ( ON ?auto_165295 ?auto_165294 ) ( CLEAR ?auto_165295 ) ( HOLDING ?auto_165296 ) ( CLEAR ?auto_165297 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165300 ?auto_165298 ?auto_165297 ?auto_165296 )
      ( MAKE-7PILE ?auto_165292 ?auto_165293 ?auto_165294 ?auto_165295 ?auto_165296 ?auto_165297 ?auto_165298 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165301 - BLOCK
      ?auto_165302 - BLOCK
      ?auto_165303 - BLOCK
      ?auto_165304 - BLOCK
      ?auto_165305 - BLOCK
      ?auto_165306 - BLOCK
      ?auto_165307 - BLOCK
    )
    :vars
    (
      ?auto_165308 - BLOCK
      ?auto_165309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165301 ?auto_165302 ) ) ( not ( = ?auto_165301 ?auto_165303 ) ) ( not ( = ?auto_165301 ?auto_165304 ) ) ( not ( = ?auto_165301 ?auto_165305 ) ) ( not ( = ?auto_165301 ?auto_165306 ) ) ( not ( = ?auto_165301 ?auto_165307 ) ) ( not ( = ?auto_165302 ?auto_165303 ) ) ( not ( = ?auto_165302 ?auto_165304 ) ) ( not ( = ?auto_165302 ?auto_165305 ) ) ( not ( = ?auto_165302 ?auto_165306 ) ) ( not ( = ?auto_165302 ?auto_165307 ) ) ( not ( = ?auto_165303 ?auto_165304 ) ) ( not ( = ?auto_165303 ?auto_165305 ) ) ( not ( = ?auto_165303 ?auto_165306 ) ) ( not ( = ?auto_165303 ?auto_165307 ) ) ( not ( = ?auto_165304 ?auto_165305 ) ) ( not ( = ?auto_165304 ?auto_165306 ) ) ( not ( = ?auto_165304 ?auto_165307 ) ) ( not ( = ?auto_165305 ?auto_165306 ) ) ( not ( = ?auto_165305 ?auto_165307 ) ) ( not ( = ?auto_165306 ?auto_165307 ) ) ( ON ?auto_165307 ?auto_165308 ) ( not ( = ?auto_165301 ?auto_165308 ) ) ( not ( = ?auto_165302 ?auto_165308 ) ) ( not ( = ?auto_165303 ?auto_165308 ) ) ( not ( = ?auto_165304 ?auto_165308 ) ) ( not ( = ?auto_165305 ?auto_165308 ) ) ( not ( = ?auto_165306 ?auto_165308 ) ) ( not ( = ?auto_165307 ?auto_165308 ) ) ( ON ?auto_165306 ?auto_165307 ) ( ON-TABLE ?auto_165308 ) ( ON ?auto_165301 ?auto_165309 ) ( not ( = ?auto_165301 ?auto_165309 ) ) ( not ( = ?auto_165302 ?auto_165309 ) ) ( not ( = ?auto_165303 ?auto_165309 ) ) ( not ( = ?auto_165304 ?auto_165309 ) ) ( not ( = ?auto_165305 ?auto_165309 ) ) ( not ( = ?auto_165306 ?auto_165309 ) ) ( not ( = ?auto_165307 ?auto_165309 ) ) ( not ( = ?auto_165308 ?auto_165309 ) ) ( ON ?auto_165302 ?auto_165301 ) ( ON-TABLE ?auto_165309 ) ( ON ?auto_165303 ?auto_165302 ) ( ON ?auto_165304 ?auto_165303 ) ( CLEAR ?auto_165306 ) ( ON ?auto_165305 ?auto_165304 ) ( CLEAR ?auto_165305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165309 ?auto_165301 ?auto_165302 ?auto_165303 ?auto_165304 )
      ( MAKE-7PILE ?auto_165301 ?auto_165302 ?auto_165303 ?auto_165304 ?auto_165305 ?auto_165306 ?auto_165307 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165310 - BLOCK
      ?auto_165311 - BLOCK
      ?auto_165312 - BLOCK
      ?auto_165313 - BLOCK
      ?auto_165314 - BLOCK
      ?auto_165315 - BLOCK
      ?auto_165316 - BLOCK
    )
    :vars
    (
      ?auto_165318 - BLOCK
      ?auto_165317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165310 ?auto_165311 ) ) ( not ( = ?auto_165310 ?auto_165312 ) ) ( not ( = ?auto_165310 ?auto_165313 ) ) ( not ( = ?auto_165310 ?auto_165314 ) ) ( not ( = ?auto_165310 ?auto_165315 ) ) ( not ( = ?auto_165310 ?auto_165316 ) ) ( not ( = ?auto_165311 ?auto_165312 ) ) ( not ( = ?auto_165311 ?auto_165313 ) ) ( not ( = ?auto_165311 ?auto_165314 ) ) ( not ( = ?auto_165311 ?auto_165315 ) ) ( not ( = ?auto_165311 ?auto_165316 ) ) ( not ( = ?auto_165312 ?auto_165313 ) ) ( not ( = ?auto_165312 ?auto_165314 ) ) ( not ( = ?auto_165312 ?auto_165315 ) ) ( not ( = ?auto_165312 ?auto_165316 ) ) ( not ( = ?auto_165313 ?auto_165314 ) ) ( not ( = ?auto_165313 ?auto_165315 ) ) ( not ( = ?auto_165313 ?auto_165316 ) ) ( not ( = ?auto_165314 ?auto_165315 ) ) ( not ( = ?auto_165314 ?auto_165316 ) ) ( not ( = ?auto_165315 ?auto_165316 ) ) ( ON ?auto_165316 ?auto_165318 ) ( not ( = ?auto_165310 ?auto_165318 ) ) ( not ( = ?auto_165311 ?auto_165318 ) ) ( not ( = ?auto_165312 ?auto_165318 ) ) ( not ( = ?auto_165313 ?auto_165318 ) ) ( not ( = ?auto_165314 ?auto_165318 ) ) ( not ( = ?auto_165315 ?auto_165318 ) ) ( not ( = ?auto_165316 ?auto_165318 ) ) ( ON-TABLE ?auto_165318 ) ( ON ?auto_165310 ?auto_165317 ) ( not ( = ?auto_165310 ?auto_165317 ) ) ( not ( = ?auto_165311 ?auto_165317 ) ) ( not ( = ?auto_165312 ?auto_165317 ) ) ( not ( = ?auto_165313 ?auto_165317 ) ) ( not ( = ?auto_165314 ?auto_165317 ) ) ( not ( = ?auto_165315 ?auto_165317 ) ) ( not ( = ?auto_165316 ?auto_165317 ) ) ( not ( = ?auto_165318 ?auto_165317 ) ) ( ON ?auto_165311 ?auto_165310 ) ( ON-TABLE ?auto_165317 ) ( ON ?auto_165312 ?auto_165311 ) ( ON ?auto_165313 ?auto_165312 ) ( ON ?auto_165314 ?auto_165313 ) ( CLEAR ?auto_165314 ) ( HOLDING ?auto_165315 ) ( CLEAR ?auto_165316 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165318 ?auto_165316 ?auto_165315 )
      ( MAKE-7PILE ?auto_165310 ?auto_165311 ?auto_165312 ?auto_165313 ?auto_165314 ?auto_165315 ?auto_165316 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165319 - BLOCK
      ?auto_165320 - BLOCK
      ?auto_165321 - BLOCK
      ?auto_165322 - BLOCK
      ?auto_165323 - BLOCK
      ?auto_165324 - BLOCK
      ?auto_165325 - BLOCK
    )
    :vars
    (
      ?auto_165326 - BLOCK
      ?auto_165327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165319 ?auto_165320 ) ) ( not ( = ?auto_165319 ?auto_165321 ) ) ( not ( = ?auto_165319 ?auto_165322 ) ) ( not ( = ?auto_165319 ?auto_165323 ) ) ( not ( = ?auto_165319 ?auto_165324 ) ) ( not ( = ?auto_165319 ?auto_165325 ) ) ( not ( = ?auto_165320 ?auto_165321 ) ) ( not ( = ?auto_165320 ?auto_165322 ) ) ( not ( = ?auto_165320 ?auto_165323 ) ) ( not ( = ?auto_165320 ?auto_165324 ) ) ( not ( = ?auto_165320 ?auto_165325 ) ) ( not ( = ?auto_165321 ?auto_165322 ) ) ( not ( = ?auto_165321 ?auto_165323 ) ) ( not ( = ?auto_165321 ?auto_165324 ) ) ( not ( = ?auto_165321 ?auto_165325 ) ) ( not ( = ?auto_165322 ?auto_165323 ) ) ( not ( = ?auto_165322 ?auto_165324 ) ) ( not ( = ?auto_165322 ?auto_165325 ) ) ( not ( = ?auto_165323 ?auto_165324 ) ) ( not ( = ?auto_165323 ?auto_165325 ) ) ( not ( = ?auto_165324 ?auto_165325 ) ) ( ON ?auto_165325 ?auto_165326 ) ( not ( = ?auto_165319 ?auto_165326 ) ) ( not ( = ?auto_165320 ?auto_165326 ) ) ( not ( = ?auto_165321 ?auto_165326 ) ) ( not ( = ?auto_165322 ?auto_165326 ) ) ( not ( = ?auto_165323 ?auto_165326 ) ) ( not ( = ?auto_165324 ?auto_165326 ) ) ( not ( = ?auto_165325 ?auto_165326 ) ) ( ON-TABLE ?auto_165326 ) ( ON ?auto_165319 ?auto_165327 ) ( not ( = ?auto_165319 ?auto_165327 ) ) ( not ( = ?auto_165320 ?auto_165327 ) ) ( not ( = ?auto_165321 ?auto_165327 ) ) ( not ( = ?auto_165322 ?auto_165327 ) ) ( not ( = ?auto_165323 ?auto_165327 ) ) ( not ( = ?auto_165324 ?auto_165327 ) ) ( not ( = ?auto_165325 ?auto_165327 ) ) ( not ( = ?auto_165326 ?auto_165327 ) ) ( ON ?auto_165320 ?auto_165319 ) ( ON-TABLE ?auto_165327 ) ( ON ?auto_165321 ?auto_165320 ) ( ON ?auto_165322 ?auto_165321 ) ( ON ?auto_165323 ?auto_165322 ) ( CLEAR ?auto_165325 ) ( ON ?auto_165324 ?auto_165323 ) ( CLEAR ?auto_165324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165327 ?auto_165319 ?auto_165320 ?auto_165321 ?auto_165322 ?auto_165323 )
      ( MAKE-7PILE ?auto_165319 ?auto_165320 ?auto_165321 ?auto_165322 ?auto_165323 ?auto_165324 ?auto_165325 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165328 - BLOCK
      ?auto_165329 - BLOCK
      ?auto_165330 - BLOCK
      ?auto_165331 - BLOCK
      ?auto_165332 - BLOCK
      ?auto_165333 - BLOCK
      ?auto_165334 - BLOCK
    )
    :vars
    (
      ?auto_165335 - BLOCK
      ?auto_165336 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165328 ?auto_165329 ) ) ( not ( = ?auto_165328 ?auto_165330 ) ) ( not ( = ?auto_165328 ?auto_165331 ) ) ( not ( = ?auto_165328 ?auto_165332 ) ) ( not ( = ?auto_165328 ?auto_165333 ) ) ( not ( = ?auto_165328 ?auto_165334 ) ) ( not ( = ?auto_165329 ?auto_165330 ) ) ( not ( = ?auto_165329 ?auto_165331 ) ) ( not ( = ?auto_165329 ?auto_165332 ) ) ( not ( = ?auto_165329 ?auto_165333 ) ) ( not ( = ?auto_165329 ?auto_165334 ) ) ( not ( = ?auto_165330 ?auto_165331 ) ) ( not ( = ?auto_165330 ?auto_165332 ) ) ( not ( = ?auto_165330 ?auto_165333 ) ) ( not ( = ?auto_165330 ?auto_165334 ) ) ( not ( = ?auto_165331 ?auto_165332 ) ) ( not ( = ?auto_165331 ?auto_165333 ) ) ( not ( = ?auto_165331 ?auto_165334 ) ) ( not ( = ?auto_165332 ?auto_165333 ) ) ( not ( = ?auto_165332 ?auto_165334 ) ) ( not ( = ?auto_165333 ?auto_165334 ) ) ( not ( = ?auto_165328 ?auto_165335 ) ) ( not ( = ?auto_165329 ?auto_165335 ) ) ( not ( = ?auto_165330 ?auto_165335 ) ) ( not ( = ?auto_165331 ?auto_165335 ) ) ( not ( = ?auto_165332 ?auto_165335 ) ) ( not ( = ?auto_165333 ?auto_165335 ) ) ( not ( = ?auto_165334 ?auto_165335 ) ) ( ON-TABLE ?auto_165335 ) ( ON ?auto_165328 ?auto_165336 ) ( not ( = ?auto_165328 ?auto_165336 ) ) ( not ( = ?auto_165329 ?auto_165336 ) ) ( not ( = ?auto_165330 ?auto_165336 ) ) ( not ( = ?auto_165331 ?auto_165336 ) ) ( not ( = ?auto_165332 ?auto_165336 ) ) ( not ( = ?auto_165333 ?auto_165336 ) ) ( not ( = ?auto_165334 ?auto_165336 ) ) ( not ( = ?auto_165335 ?auto_165336 ) ) ( ON ?auto_165329 ?auto_165328 ) ( ON-TABLE ?auto_165336 ) ( ON ?auto_165330 ?auto_165329 ) ( ON ?auto_165331 ?auto_165330 ) ( ON ?auto_165332 ?auto_165331 ) ( ON ?auto_165333 ?auto_165332 ) ( CLEAR ?auto_165333 ) ( HOLDING ?auto_165334 ) ( CLEAR ?auto_165335 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165335 ?auto_165334 )
      ( MAKE-7PILE ?auto_165328 ?auto_165329 ?auto_165330 ?auto_165331 ?auto_165332 ?auto_165333 ?auto_165334 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165337 - BLOCK
      ?auto_165338 - BLOCK
      ?auto_165339 - BLOCK
      ?auto_165340 - BLOCK
      ?auto_165341 - BLOCK
      ?auto_165342 - BLOCK
      ?auto_165343 - BLOCK
    )
    :vars
    (
      ?auto_165344 - BLOCK
      ?auto_165345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165337 ?auto_165338 ) ) ( not ( = ?auto_165337 ?auto_165339 ) ) ( not ( = ?auto_165337 ?auto_165340 ) ) ( not ( = ?auto_165337 ?auto_165341 ) ) ( not ( = ?auto_165337 ?auto_165342 ) ) ( not ( = ?auto_165337 ?auto_165343 ) ) ( not ( = ?auto_165338 ?auto_165339 ) ) ( not ( = ?auto_165338 ?auto_165340 ) ) ( not ( = ?auto_165338 ?auto_165341 ) ) ( not ( = ?auto_165338 ?auto_165342 ) ) ( not ( = ?auto_165338 ?auto_165343 ) ) ( not ( = ?auto_165339 ?auto_165340 ) ) ( not ( = ?auto_165339 ?auto_165341 ) ) ( not ( = ?auto_165339 ?auto_165342 ) ) ( not ( = ?auto_165339 ?auto_165343 ) ) ( not ( = ?auto_165340 ?auto_165341 ) ) ( not ( = ?auto_165340 ?auto_165342 ) ) ( not ( = ?auto_165340 ?auto_165343 ) ) ( not ( = ?auto_165341 ?auto_165342 ) ) ( not ( = ?auto_165341 ?auto_165343 ) ) ( not ( = ?auto_165342 ?auto_165343 ) ) ( not ( = ?auto_165337 ?auto_165344 ) ) ( not ( = ?auto_165338 ?auto_165344 ) ) ( not ( = ?auto_165339 ?auto_165344 ) ) ( not ( = ?auto_165340 ?auto_165344 ) ) ( not ( = ?auto_165341 ?auto_165344 ) ) ( not ( = ?auto_165342 ?auto_165344 ) ) ( not ( = ?auto_165343 ?auto_165344 ) ) ( ON-TABLE ?auto_165344 ) ( ON ?auto_165337 ?auto_165345 ) ( not ( = ?auto_165337 ?auto_165345 ) ) ( not ( = ?auto_165338 ?auto_165345 ) ) ( not ( = ?auto_165339 ?auto_165345 ) ) ( not ( = ?auto_165340 ?auto_165345 ) ) ( not ( = ?auto_165341 ?auto_165345 ) ) ( not ( = ?auto_165342 ?auto_165345 ) ) ( not ( = ?auto_165343 ?auto_165345 ) ) ( not ( = ?auto_165344 ?auto_165345 ) ) ( ON ?auto_165338 ?auto_165337 ) ( ON-TABLE ?auto_165345 ) ( ON ?auto_165339 ?auto_165338 ) ( ON ?auto_165340 ?auto_165339 ) ( ON ?auto_165341 ?auto_165340 ) ( ON ?auto_165342 ?auto_165341 ) ( CLEAR ?auto_165344 ) ( ON ?auto_165343 ?auto_165342 ) ( CLEAR ?auto_165343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165345 ?auto_165337 ?auto_165338 ?auto_165339 ?auto_165340 ?auto_165341 ?auto_165342 )
      ( MAKE-7PILE ?auto_165337 ?auto_165338 ?auto_165339 ?auto_165340 ?auto_165341 ?auto_165342 ?auto_165343 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165346 - BLOCK
      ?auto_165347 - BLOCK
      ?auto_165348 - BLOCK
      ?auto_165349 - BLOCK
      ?auto_165350 - BLOCK
      ?auto_165351 - BLOCK
      ?auto_165352 - BLOCK
    )
    :vars
    (
      ?auto_165354 - BLOCK
      ?auto_165353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165346 ?auto_165347 ) ) ( not ( = ?auto_165346 ?auto_165348 ) ) ( not ( = ?auto_165346 ?auto_165349 ) ) ( not ( = ?auto_165346 ?auto_165350 ) ) ( not ( = ?auto_165346 ?auto_165351 ) ) ( not ( = ?auto_165346 ?auto_165352 ) ) ( not ( = ?auto_165347 ?auto_165348 ) ) ( not ( = ?auto_165347 ?auto_165349 ) ) ( not ( = ?auto_165347 ?auto_165350 ) ) ( not ( = ?auto_165347 ?auto_165351 ) ) ( not ( = ?auto_165347 ?auto_165352 ) ) ( not ( = ?auto_165348 ?auto_165349 ) ) ( not ( = ?auto_165348 ?auto_165350 ) ) ( not ( = ?auto_165348 ?auto_165351 ) ) ( not ( = ?auto_165348 ?auto_165352 ) ) ( not ( = ?auto_165349 ?auto_165350 ) ) ( not ( = ?auto_165349 ?auto_165351 ) ) ( not ( = ?auto_165349 ?auto_165352 ) ) ( not ( = ?auto_165350 ?auto_165351 ) ) ( not ( = ?auto_165350 ?auto_165352 ) ) ( not ( = ?auto_165351 ?auto_165352 ) ) ( not ( = ?auto_165346 ?auto_165354 ) ) ( not ( = ?auto_165347 ?auto_165354 ) ) ( not ( = ?auto_165348 ?auto_165354 ) ) ( not ( = ?auto_165349 ?auto_165354 ) ) ( not ( = ?auto_165350 ?auto_165354 ) ) ( not ( = ?auto_165351 ?auto_165354 ) ) ( not ( = ?auto_165352 ?auto_165354 ) ) ( ON ?auto_165346 ?auto_165353 ) ( not ( = ?auto_165346 ?auto_165353 ) ) ( not ( = ?auto_165347 ?auto_165353 ) ) ( not ( = ?auto_165348 ?auto_165353 ) ) ( not ( = ?auto_165349 ?auto_165353 ) ) ( not ( = ?auto_165350 ?auto_165353 ) ) ( not ( = ?auto_165351 ?auto_165353 ) ) ( not ( = ?auto_165352 ?auto_165353 ) ) ( not ( = ?auto_165354 ?auto_165353 ) ) ( ON ?auto_165347 ?auto_165346 ) ( ON-TABLE ?auto_165353 ) ( ON ?auto_165348 ?auto_165347 ) ( ON ?auto_165349 ?auto_165348 ) ( ON ?auto_165350 ?auto_165349 ) ( ON ?auto_165351 ?auto_165350 ) ( ON ?auto_165352 ?auto_165351 ) ( CLEAR ?auto_165352 ) ( HOLDING ?auto_165354 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165354 )
      ( MAKE-7PILE ?auto_165346 ?auto_165347 ?auto_165348 ?auto_165349 ?auto_165350 ?auto_165351 ?auto_165352 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_165355 - BLOCK
      ?auto_165356 - BLOCK
      ?auto_165357 - BLOCK
      ?auto_165358 - BLOCK
      ?auto_165359 - BLOCK
      ?auto_165360 - BLOCK
      ?auto_165361 - BLOCK
    )
    :vars
    (
      ?auto_165363 - BLOCK
      ?auto_165362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165355 ?auto_165356 ) ) ( not ( = ?auto_165355 ?auto_165357 ) ) ( not ( = ?auto_165355 ?auto_165358 ) ) ( not ( = ?auto_165355 ?auto_165359 ) ) ( not ( = ?auto_165355 ?auto_165360 ) ) ( not ( = ?auto_165355 ?auto_165361 ) ) ( not ( = ?auto_165356 ?auto_165357 ) ) ( not ( = ?auto_165356 ?auto_165358 ) ) ( not ( = ?auto_165356 ?auto_165359 ) ) ( not ( = ?auto_165356 ?auto_165360 ) ) ( not ( = ?auto_165356 ?auto_165361 ) ) ( not ( = ?auto_165357 ?auto_165358 ) ) ( not ( = ?auto_165357 ?auto_165359 ) ) ( not ( = ?auto_165357 ?auto_165360 ) ) ( not ( = ?auto_165357 ?auto_165361 ) ) ( not ( = ?auto_165358 ?auto_165359 ) ) ( not ( = ?auto_165358 ?auto_165360 ) ) ( not ( = ?auto_165358 ?auto_165361 ) ) ( not ( = ?auto_165359 ?auto_165360 ) ) ( not ( = ?auto_165359 ?auto_165361 ) ) ( not ( = ?auto_165360 ?auto_165361 ) ) ( not ( = ?auto_165355 ?auto_165363 ) ) ( not ( = ?auto_165356 ?auto_165363 ) ) ( not ( = ?auto_165357 ?auto_165363 ) ) ( not ( = ?auto_165358 ?auto_165363 ) ) ( not ( = ?auto_165359 ?auto_165363 ) ) ( not ( = ?auto_165360 ?auto_165363 ) ) ( not ( = ?auto_165361 ?auto_165363 ) ) ( ON ?auto_165355 ?auto_165362 ) ( not ( = ?auto_165355 ?auto_165362 ) ) ( not ( = ?auto_165356 ?auto_165362 ) ) ( not ( = ?auto_165357 ?auto_165362 ) ) ( not ( = ?auto_165358 ?auto_165362 ) ) ( not ( = ?auto_165359 ?auto_165362 ) ) ( not ( = ?auto_165360 ?auto_165362 ) ) ( not ( = ?auto_165361 ?auto_165362 ) ) ( not ( = ?auto_165363 ?auto_165362 ) ) ( ON ?auto_165356 ?auto_165355 ) ( ON-TABLE ?auto_165362 ) ( ON ?auto_165357 ?auto_165356 ) ( ON ?auto_165358 ?auto_165357 ) ( ON ?auto_165359 ?auto_165358 ) ( ON ?auto_165360 ?auto_165359 ) ( ON ?auto_165361 ?auto_165360 ) ( ON ?auto_165363 ?auto_165361 ) ( CLEAR ?auto_165363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165362 ?auto_165355 ?auto_165356 ?auto_165357 ?auto_165358 ?auto_165359 ?auto_165360 ?auto_165361 )
      ( MAKE-7PILE ?auto_165355 ?auto_165356 ?auto_165357 ?auto_165358 ?auto_165359 ?auto_165360 ?auto_165361 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165380 - BLOCK
      ?auto_165381 - BLOCK
      ?auto_165382 - BLOCK
      ?auto_165383 - BLOCK
      ?auto_165384 - BLOCK
      ?auto_165385 - BLOCK
      ?auto_165386 - BLOCK
      ?auto_165387 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_165386 ) ( ON-TABLE ?auto_165380 ) ( ON ?auto_165381 ?auto_165380 ) ( ON ?auto_165382 ?auto_165381 ) ( ON ?auto_165383 ?auto_165382 ) ( ON ?auto_165384 ?auto_165383 ) ( ON ?auto_165385 ?auto_165384 ) ( ON ?auto_165386 ?auto_165385 ) ( not ( = ?auto_165380 ?auto_165381 ) ) ( not ( = ?auto_165380 ?auto_165382 ) ) ( not ( = ?auto_165380 ?auto_165383 ) ) ( not ( = ?auto_165380 ?auto_165384 ) ) ( not ( = ?auto_165380 ?auto_165385 ) ) ( not ( = ?auto_165380 ?auto_165386 ) ) ( not ( = ?auto_165380 ?auto_165387 ) ) ( not ( = ?auto_165381 ?auto_165382 ) ) ( not ( = ?auto_165381 ?auto_165383 ) ) ( not ( = ?auto_165381 ?auto_165384 ) ) ( not ( = ?auto_165381 ?auto_165385 ) ) ( not ( = ?auto_165381 ?auto_165386 ) ) ( not ( = ?auto_165381 ?auto_165387 ) ) ( not ( = ?auto_165382 ?auto_165383 ) ) ( not ( = ?auto_165382 ?auto_165384 ) ) ( not ( = ?auto_165382 ?auto_165385 ) ) ( not ( = ?auto_165382 ?auto_165386 ) ) ( not ( = ?auto_165382 ?auto_165387 ) ) ( not ( = ?auto_165383 ?auto_165384 ) ) ( not ( = ?auto_165383 ?auto_165385 ) ) ( not ( = ?auto_165383 ?auto_165386 ) ) ( not ( = ?auto_165383 ?auto_165387 ) ) ( not ( = ?auto_165384 ?auto_165385 ) ) ( not ( = ?auto_165384 ?auto_165386 ) ) ( not ( = ?auto_165384 ?auto_165387 ) ) ( not ( = ?auto_165385 ?auto_165386 ) ) ( not ( = ?auto_165385 ?auto_165387 ) ) ( not ( = ?auto_165386 ?auto_165387 ) ) ( ON-TABLE ?auto_165387 ) ( CLEAR ?auto_165387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_165387 )
      ( MAKE-8PILE ?auto_165380 ?auto_165381 ?auto_165382 ?auto_165383 ?auto_165384 ?auto_165385 ?auto_165386 ?auto_165387 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165388 - BLOCK
      ?auto_165389 - BLOCK
      ?auto_165390 - BLOCK
      ?auto_165391 - BLOCK
      ?auto_165392 - BLOCK
      ?auto_165393 - BLOCK
      ?auto_165394 - BLOCK
      ?auto_165395 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165388 ) ( ON ?auto_165389 ?auto_165388 ) ( ON ?auto_165390 ?auto_165389 ) ( ON ?auto_165391 ?auto_165390 ) ( ON ?auto_165392 ?auto_165391 ) ( ON ?auto_165393 ?auto_165392 ) ( not ( = ?auto_165388 ?auto_165389 ) ) ( not ( = ?auto_165388 ?auto_165390 ) ) ( not ( = ?auto_165388 ?auto_165391 ) ) ( not ( = ?auto_165388 ?auto_165392 ) ) ( not ( = ?auto_165388 ?auto_165393 ) ) ( not ( = ?auto_165388 ?auto_165394 ) ) ( not ( = ?auto_165388 ?auto_165395 ) ) ( not ( = ?auto_165389 ?auto_165390 ) ) ( not ( = ?auto_165389 ?auto_165391 ) ) ( not ( = ?auto_165389 ?auto_165392 ) ) ( not ( = ?auto_165389 ?auto_165393 ) ) ( not ( = ?auto_165389 ?auto_165394 ) ) ( not ( = ?auto_165389 ?auto_165395 ) ) ( not ( = ?auto_165390 ?auto_165391 ) ) ( not ( = ?auto_165390 ?auto_165392 ) ) ( not ( = ?auto_165390 ?auto_165393 ) ) ( not ( = ?auto_165390 ?auto_165394 ) ) ( not ( = ?auto_165390 ?auto_165395 ) ) ( not ( = ?auto_165391 ?auto_165392 ) ) ( not ( = ?auto_165391 ?auto_165393 ) ) ( not ( = ?auto_165391 ?auto_165394 ) ) ( not ( = ?auto_165391 ?auto_165395 ) ) ( not ( = ?auto_165392 ?auto_165393 ) ) ( not ( = ?auto_165392 ?auto_165394 ) ) ( not ( = ?auto_165392 ?auto_165395 ) ) ( not ( = ?auto_165393 ?auto_165394 ) ) ( not ( = ?auto_165393 ?auto_165395 ) ) ( not ( = ?auto_165394 ?auto_165395 ) ) ( ON-TABLE ?auto_165395 ) ( CLEAR ?auto_165395 ) ( HOLDING ?auto_165394 ) ( CLEAR ?auto_165393 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165388 ?auto_165389 ?auto_165390 ?auto_165391 ?auto_165392 ?auto_165393 ?auto_165394 )
      ( MAKE-8PILE ?auto_165388 ?auto_165389 ?auto_165390 ?auto_165391 ?auto_165392 ?auto_165393 ?auto_165394 ?auto_165395 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165396 - BLOCK
      ?auto_165397 - BLOCK
      ?auto_165398 - BLOCK
      ?auto_165399 - BLOCK
      ?auto_165400 - BLOCK
      ?auto_165401 - BLOCK
      ?auto_165402 - BLOCK
      ?auto_165403 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165396 ) ( ON ?auto_165397 ?auto_165396 ) ( ON ?auto_165398 ?auto_165397 ) ( ON ?auto_165399 ?auto_165398 ) ( ON ?auto_165400 ?auto_165399 ) ( ON ?auto_165401 ?auto_165400 ) ( not ( = ?auto_165396 ?auto_165397 ) ) ( not ( = ?auto_165396 ?auto_165398 ) ) ( not ( = ?auto_165396 ?auto_165399 ) ) ( not ( = ?auto_165396 ?auto_165400 ) ) ( not ( = ?auto_165396 ?auto_165401 ) ) ( not ( = ?auto_165396 ?auto_165402 ) ) ( not ( = ?auto_165396 ?auto_165403 ) ) ( not ( = ?auto_165397 ?auto_165398 ) ) ( not ( = ?auto_165397 ?auto_165399 ) ) ( not ( = ?auto_165397 ?auto_165400 ) ) ( not ( = ?auto_165397 ?auto_165401 ) ) ( not ( = ?auto_165397 ?auto_165402 ) ) ( not ( = ?auto_165397 ?auto_165403 ) ) ( not ( = ?auto_165398 ?auto_165399 ) ) ( not ( = ?auto_165398 ?auto_165400 ) ) ( not ( = ?auto_165398 ?auto_165401 ) ) ( not ( = ?auto_165398 ?auto_165402 ) ) ( not ( = ?auto_165398 ?auto_165403 ) ) ( not ( = ?auto_165399 ?auto_165400 ) ) ( not ( = ?auto_165399 ?auto_165401 ) ) ( not ( = ?auto_165399 ?auto_165402 ) ) ( not ( = ?auto_165399 ?auto_165403 ) ) ( not ( = ?auto_165400 ?auto_165401 ) ) ( not ( = ?auto_165400 ?auto_165402 ) ) ( not ( = ?auto_165400 ?auto_165403 ) ) ( not ( = ?auto_165401 ?auto_165402 ) ) ( not ( = ?auto_165401 ?auto_165403 ) ) ( not ( = ?auto_165402 ?auto_165403 ) ) ( ON-TABLE ?auto_165403 ) ( CLEAR ?auto_165401 ) ( ON ?auto_165402 ?auto_165403 ) ( CLEAR ?auto_165402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165403 )
      ( MAKE-8PILE ?auto_165396 ?auto_165397 ?auto_165398 ?auto_165399 ?auto_165400 ?auto_165401 ?auto_165402 ?auto_165403 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165404 - BLOCK
      ?auto_165405 - BLOCK
      ?auto_165406 - BLOCK
      ?auto_165407 - BLOCK
      ?auto_165408 - BLOCK
      ?auto_165409 - BLOCK
      ?auto_165410 - BLOCK
      ?auto_165411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165404 ) ( ON ?auto_165405 ?auto_165404 ) ( ON ?auto_165406 ?auto_165405 ) ( ON ?auto_165407 ?auto_165406 ) ( ON ?auto_165408 ?auto_165407 ) ( not ( = ?auto_165404 ?auto_165405 ) ) ( not ( = ?auto_165404 ?auto_165406 ) ) ( not ( = ?auto_165404 ?auto_165407 ) ) ( not ( = ?auto_165404 ?auto_165408 ) ) ( not ( = ?auto_165404 ?auto_165409 ) ) ( not ( = ?auto_165404 ?auto_165410 ) ) ( not ( = ?auto_165404 ?auto_165411 ) ) ( not ( = ?auto_165405 ?auto_165406 ) ) ( not ( = ?auto_165405 ?auto_165407 ) ) ( not ( = ?auto_165405 ?auto_165408 ) ) ( not ( = ?auto_165405 ?auto_165409 ) ) ( not ( = ?auto_165405 ?auto_165410 ) ) ( not ( = ?auto_165405 ?auto_165411 ) ) ( not ( = ?auto_165406 ?auto_165407 ) ) ( not ( = ?auto_165406 ?auto_165408 ) ) ( not ( = ?auto_165406 ?auto_165409 ) ) ( not ( = ?auto_165406 ?auto_165410 ) ) ( not ( = ?auto_165406 ?auto_165411 ) ) ( not ( = ?auto_165407 ?auto_165408 ) ) ( not ( = ?auto_165407 ?auto_165409 ) ) ( not ( = ?auto_165407 ?auto_165410 ) ) ( not ( = ?auto_165407 ?auto_165411 ) ) ( not ( = ?auto_165408 ?auto_165409 ) ) ( not ( = ?auto_165408 ?auto_165410 ) ) ( not ( = ?auto_165408 ?auto_165411 ) ) ( not ( = ?auto_165409 ?auto_165410 ) ) ( not ( = ?auto_165409 ?auto_165411 ) ) ( not ( = ?auto_165410 ?auto_165411 ) ) ( ON-TABLE ?auto_165411 ) ( ON ?auto_165410 ?auto_165411 ) ( CLEAR ?auto_165410 ) ( HOLDING ?auto_165409 ) ( CLEAR ?auto_165408 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165404 ?auto_165405 ?auto_165406 ?auto_165407 ?auto_165408 ?auto_165409 )
      ( MAKE-8PILE ?auto_165404 ?auto_165405 ?auto_165406 ?auto_165407 ?auto_165408 ?auto_165409 ?auto_165410 ?auto_165411 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165412 - BLOCK
      ?auto_165413 - BLOCK
      ?auto_165414 - BLOCK
      ?auto_165415 - BLOCK
      ?auto_165416 - BLOCK
      ?auto_165417 - BLOCK
      ?auto_165418 - BLOCK
      ?auto_165419 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165412 ) ( ON ?auto_165413 ?auto_165412 ) ( ON ?auto_165414 ?auto_165413 ) ( ON ?auto_165415 ?auto_165414 ) ( ON ?auto_165416 ?auto_165415 ) ( not ( = ?auto_165412 ?auto_165413 ) ) ( not ( = ?auto_165412 ?auto_165414 ) ) ( not ( = ?auto_165412 ?auto_165415 ) ) ( not ( = ?auto_165412 ?auto_165416 ) ) ( not ( = ?auto_165412 ?auto_165417 ) ) ( not ( = ?auto_165412 ?auto_165418 ) ) ( not ( = ?auto_165412 ?auto_165419 ) ) ( not ( = ?auto_165413 ?auto_165414 ) ) ( not ( = ?auto_165413 ?auto_165415 ) ) ( not ( = ?auto_165413 ?auto_165416 ) ) ( not ( = ?auto_165413 ?auto_165417 ) ) ( not ( = ?auto_165413 ?auto_165418 ) ) ( not ( = ?auto_165413 ?auto_165419 ) ) ( not ( = ?auto_165414 ?auto_165415 ) ) ( not ( = ?auto_165414 ?auto_165416 ) ) ( not ( = ?auto_165414 ?auto_165417 ) ) ( not ( = ?auto_165414 ?auto_165418 ) ) ( not ( = ?auto_165414 ?auto_165419 ) ) ( not ( = ?auto_165415 ?auto_165416 ) ) ( not ( = ?auto_165415 ?auto_165417 ) ) ( not ( = ?auto_165415 ?auto_165418 ) ) ( not ( = ?auto_165415 ?auto_165419 ) ) ( not ( = ?auto_165416 ?auto_165417 ) ) ( not ( = ?auto_165416 ?auto_165418 ) ) ( not ( = ?auto_165416 ?auto_165419 ) ) ( not ( = ?auto_165417 ?auto_165418 ) ) ( not ( = ?auto_165417 ?auto_165419 ) ) ( not ( = ?auto_165418 ?auto_165419 ) ) ( ON-TABLE ?auto_165419 ) ( ON ?auto_165418 ?auto_165419 ) ( CLEAR ?auto_165416 ) ( ON ?auto_165417 ?auto_165418 ) ( CLEAR ?auto_165417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165419 ?auto_165418 )
      ( MAKE-8PILE ?auto_165412 ?auto_165413 ?auto_165414 ?auto_165415 ?auto_165416 ?auto_165417 ?auto_165418 ?auto_165419 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165420 - BLOCK
      ?auto_165421 - BLOCK
      ?auto_165422 - BLOCK
      ?auto_165423 - BLOCK
      ?auto_165424 - BLOCK
      ?auto_165425 - BLOCK
      ?auto_165426 - BLOCK
      ?auto_165427 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165420 ) ( ON ?auto_165421 ?auto_165420 ) ( ON ?auto_165422 ?auto_165421 ) ( ON ?auto_165423 ?auto_165422 ) ( not ( = ?auto_165420 ?auto_165421 ) ) ( not ( = ?auto_165420 ?auto_165422 ) ) ( not ( = ?auto_165420 ?auto_165423 ) ) ( not ( = ?auto_165420 ?auto_165424 ) ) ( not ( = ?auto_165420 ?auto_165425 ) ) ( not ( = ?auto_165420 ?auto_165426 ) ) ( not ( = ?auto_165420 ?auto_165427 ) ) ( not ( = ?auto_165421 ?auto_165422 ) ) ( not ( = ?auto_165421 ?auto_165423 ) ) ( not ( = ?auto_165421 ?auto_165424 ) ) ( not ( = ?auto_165421 ?auto_165425 ) ) ( not ( = ?auto_165421 ?auto_165426 ) ) ( not ( = ?auto_165421 ?auto_165427 ) ) ( not ( = ?auto_165422 ?auto_165423 ) ) ( not ( = ?auto_165422 ?auto_165424 ) ) ( not ( = ?auto_165422 ?auto_165425 ) ) ( not ( = ?auto_165422 ?auto_165426 ) ) ( not ( = ?auto_165422 ?auto_165427 ) ) ( not ( = ?auto_165423 ?auto_165424 ) ) ( not ( = ?auto_165423 ?auto_165425 ) ) ( not ( = ?auto_165423 ?auto_165426 ) ) ( not ( = ?auto_165423 ?auto_165427 ) ) ( not ( = ?auto_165424 ?auto_165425 ) ) ( not ( = ?auto_165424 ?auto_165426 ) ) ( not ( = ?auto_165424 ?auto_165427 ) ) ( not ( = ?auto_165425 ?auto_165426 ) ) ( not ( = ?auto_165425 ?auto_165427 ) ) ( not ( = ?auto_165426 ?auto_165427 ) ) ( ON-TABLE ?auto_165427 ) ( ON ?auto_165426 ?auto_165427 ) ( ON ?auto_165425 ?auto_165426 ) ( CLEAR ?auto_165425 ) ( HOLDING ?auto_165424 ) ( CLEAR ?auto_165423 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165420 ?auto_165421 ?auto_165422 ?auto_165423 ?auto_165424 )
      ( MAKE-8PILE ?auto_165420 ?auto_165421 ?auto_165422 ?auto_165423 ?auto_165424 ?auto_165425 ?auto_165426 ?auto_165427 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165428 - BLOCK
      ?auto_165429 - BLOCK
      ?auto_165430 - BLOCK
      ?auto_165431 - BLOCK
      ?auto_165432 - BLOCK
      ?auto_165433 - BLOCK
      ?auto_165434 - BLOCK
      ?auto_165435 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165428 ) ( ON ?auto_165429 ?auto_165428 ) ( ON ?auto_165430 ?auto_165429 ) ( ON ?auto_165431 ?auto_165430 ) ( not ( = ?auto_165428 ?auto_165429 ) ) ( not ( = ?auto_165428 ?auto_165430 ) ) ( not ( = ?auto_165428 ?auto_165431 ) ) ( not ( = ?auto_165428 ?auto_165432 ) ) ( not ( = ?auto_165428 ?auto_165433 ) ) ( not ( = ?auto_165428 ?auto_165434 ) ) ( not ( = ?auto_165428 ?auto_165435 ) ) ( not ( = ?auto_165429 ?auto_165430 ) ) ( not ( = ?auto_165429 ?auto_165431 ) ) ( not ( = ?auto_165429 ?auto_165432 ) ) ( not ( = ?auto_165429 ?auto_165433 ) ) ( not ( = ?auto_165429 ?auto_165434 ) ) ( not ( = ?auto_165429 ?auto_165435 ) ) ( not ( = ?auto_165430 ?auto_165431 ) ) ( not ( = ?auto_165430 ?auto_165432 ) ) ( not ( = ?auto_165430 ?auto_165433 ) ) ( not ( = ?auto_165430 ?auto_165434 ) ) ( not ( = ?auto_165430 ?auto_165435 ) ) ( not ( = ?auto_165431 ?auto_165432 ) ) ( not ( = ?auto_165431 ?auto_165433 ) ) ( not ( = ?auto_165431 ?auto_165434 ) ) ( not ( = ?auto_165431 ?auto_165435 ) ) ( not ( = ?auto_165432 ?auto_165433 ) ) ( not ( = ?auto_165432 ?auto_165434 ) ) ( not ( = ?auto_165432 ?auto_165435 ) ) ( not ( = ?auto_165433 ?auto_165434 ) ) ( not ( = ?auto_165433 ?auto_165435 ) ) ( not ( = ?auto_165434 ?auto_165435 ) ) ( ON-TABLE ?auto_165435 ) ( ON ?auto_165434 ?auto_165435 ) ( ON ?auto_165433 ?auto_165434 ) ( CLEAR ?auto_165431 ) ( ON ?auto_165432 ?auto_165433 ) ( CLEAR ?auto_165432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165435 ?auto_165434 ?auto_165433 )
      ( MAKE-8PILE ?auto_165428 ?auto_165429 ?auto_165430 ?auto_165431 ?auto_165432 ?auto_165433 ?auto_165434 ?auto_165435 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165436 - BLOCK
      ?auto_165437 - BLOCK
      ?auto_165438 - BLOCK
      ?auto_165439 - BLOCK
      ?auto_165440 - BLOCK
      ?auto_165441 - BLOCK
      ?auto_165442 - BLOCK
      ?auto_165443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165436 ) ( ON ?auto_165437 ?auto_165436 ) ( ON ?auto_165438 ?auto_165437 ) ( not ( = ?auto_165436 ?auto_165437 ) ) ( not ( = ?auto_165436 ?auto_165438 ) ) ( not ( = ?auto_165436 ?auto_165439 ) ) ( not ( = ?auto_165436 ?auto_165440 ) ) ( not ( = ?auto_165436 ?auto_165441 ) ) ( not ( = ?auto_165436 ?auto_165442 ) ) ( not ( = ?auto_165436 ?auto_165443 ) ) ( not ( = ?auto_165437 ?auto_165438 ) ) ( not ( = ?auto_165437 ?auto_165439 ) ) ( not ( = ?auto_165437 ?auto_165440 ) ) ( not ( = ?auto_165437 ?auto_165441 ) ) ( not ( = ?auto_165437 ?auto_165442 ) ) ( not ( = ?auto_165437 ?auto_165443 ) ) ( not ( = ?auto_165438 ?auto_165439 ) ) ( not ( = ?auto_165438 ?auto_165440 ) ) ( not ( = ?auto_165438 ?auto_165441 ) ) ( not ( = ?auto_165438 ?auto_165442 ) ) ( not ( = ?auto_165438 ?auto_165443 ) ) ( not ( = ?auto_165439 ?auto_165440 ) ) ( not ( = ?auto_165439 ?auto_165441 ) ) ( not ( = ?auto_165439 ?auto_165442 ) ) ( not ( = ?auto_165439 ?auto_165443 ) ) ( not ( = ?auto_165440 ?auto_165441 ) ) ( not ( = ?auto_165440 ?auto_165442 ) ) ( not ( = ?auto_165440 ?auto_165443 ) ) ( not ( = ?auto_165441 ?auto_165442 ) ) ( not ( = ?auto_165441 ?auto_165443 ) ) ( not ( = ?auto_165442 ?auto_165443 ) ) ( ON-TABLE ?auto_165443 ) ( ON ?auto_165442 ?auto_165443 ) ( ON ?auto_165441 ?auto_165442 ) ( ON ?auto_165440 ?auto_165441 ) ( CLEAR ?auto_165440 ) ( HOLDING ?auto_165439 ) ( CLEAR ?auto_165438 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165436 ?auto_165437 ?auto_165438 ?auto_165439 )
      ( MAKE-8PILE ?auto_165436 ?auto_165437 ?auto_165438 ?auto_165439 ?auto_165440 ?auto_165441 ?auto_165442 ?auto_165443 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165444 - BLOCK
      ?auto_165445 - BLOCK
      ?auto_165446 - BLOCK
      ?auto_165447 - BLOCK
      ?auto_165448 - BLOCK
      ?auto_165449 - BLOCK
      ?auto_165450 - BLOCK
      ?auto_165451 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165444 ) ( ON ?auto_165445 ?auto_165444 ) ( ON ?auto_165446 ?auto_165445 ) ( not ( = ?auto_165444 ?auto_165445 ) ) ( not ( = ?auto_165444 ?auto_165446 ) ) ( not ( = ?auto_165444 ?auto_165447 ) ) ( not ( = ?auto_165444 ?auto_165448 ) ) ( not ( = ?auto_165444 ?auto_165449 ) ) ( not ( = ?auto_165444 ?auto_165450 ) ) ( not ( = ?auto_165444 ?auto_165451 ) ) ( not ( = ?auto_165445 ?auto_165446 ) ) ( not ( = ?auto_165445 ?auto_165447 ) ) ( not ( = ?auto_165445 ?auto_165448 ) ) ( not ( = ?auto_165445 ?auto_165449 ) ) ( not ( = ?auto_165445 ?auto_165450 ) ) ( not ( = ?auto_165445 ?auto_165451 ) ) ( not ( = ?auto_165446 ?auto_165447 ) ) ( not ( = ?auto_165446 ?auto_165448 ) ) ( not ( = ?auto_165446 ?auto_165449 ) ) ( not ( = ?auto_165446 ?auto_165450 ) ) ( not ( = ?auto_165446 ?auto_165451 ) ) ( not ( = ?auto_165447 ?auto_165448 ) ) ( not ( = ?auto_165447 ?auto_165449 ) ) ( not ( = ?auto_165447 ?auto_165450 ) ) ( not ( = ?auto_165447 ?auto_165451 ) ) ( not ( = ?auto_165448 ?auto_165449 ) ) ( not ( = ?auto_165448 ?auto_165450 ) ) ( not ( = ?auto_165448 ?auto_165451 ) ) ( not ( = ?auto_165449 ?auto_165450 ) ) ( not ( = ?auto_165449 ?auto_165451 ) ) ( not ( = ?auto_165450 ?auto_165451 ) ) ( ON-TABLE ?auto_165451 ) ( ON ?auto_165450 ?auto_165451 ) ( ON ?auto_165449 ?auto_165450 ) ( ON ?auto_165448 ?auto_165449 ) ( CLEAR ?auto_165446 ) ( ON ?auto_165447 ?auto_165448 ) ( CLEAR ?auto_165447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165451 ?auto_165450 ?auto_165449 ?auto_165448 )
      ( MAKE-8PILE ?auto_165444 ?auto_165445 ?auto_165446 ?auto_165447 ?auto_165448 ?auto_165449 ?auto_165450 ?auto_165451 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165452 - BLOCK
      ?auto_165453 - BLOCK
      ?auto_165454 - BLOCK
      ?auto_165455 - BLOCK
      ?auto_165456 - BLOCK
      ?auto_165457 - BLOCK
      ?auto_165458 - BLOCK
      ?auto_165459 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165452 ) ( ON ?auto_165453 ?auto_165452 ) ( not ( = ?auto_165452 ?auto_165453 ) ) ( not ( = ?auto_165452 ?auto_165454 ) ) ( not ( = ?auto_165452 ?auto_165455 ) ) ( not ( = ?auto_165452 ?auto_165456 ) ) ( not ( = ?auto_165452 ?auto_165457 ) ) ( not ( = ?auto_165452 ?auto_165458 ) ) ( not ( = ?auto_165452 ?auto_165459 ) ) ( not ( = ?auto_165453 ?auto_165454 ) ) ( not ( = ?auto_165453 ?auto_165455 ) ) ( not ( = ?auto_165453 ?auto_165456 ) ) ( not ( = ?auto_165453 ?auto_165457 ) ) ( not ( = ?auto_165453 ?auto_165458 ) ) ( not ( = ?auto_165453 ?auto_165459 ) ) ( not ( = ?auto_165454 ?auto_165455 ) ) ( not ( = ?auto_165454 ?auto_165456 ) ) ( not ( = ?auto_165454 ?auto_165457 ) ) ( not ( = ?auto_165454 ?auto_165458 ) ) ( not ( = ?auto_165454 ?auto_165459 ) ) ( not ( = ?auto_165455 ?auto_165456 ) ) ( not ( = ?auto_165455 ?auto_165457 ) ) ( not ( = ?auto_165455 ?auto_165458 ) ) ( not ( = ?auto_165455 ?auto_165459 ) ) ( not ( = ?auto_165456 ?auto_165457 ) ) ( not ( = ?auto_165456 ?auto_165458 ) ) ( not ( = ?auto_165456 ?auto_165459 ) ) ( not ( = ?auto_165457 ?auto_165458 ) ) ( not ( = ?auto_165457 ?auto_165459 ) ) ( not ( = ?auto_165458 ?auto_165459 ) ) ( ON-TABLE ?auto_165459 ) ( ON ?auto_165458 ?auto_165459 ) ( ON ?auto_165457 ?auto_165458 ) ( ON ?auto_165456 ?auto_165457 ) ( ON ?auto_165455 ?auto_165456 ) ( CLEAR ?auto_165455 ) ( HOLDING ?auto_165454 ) ( CLEAR ?auto_165453 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165452 ?auto_165453 ?auto_165454 )
      ( MAKE-8PILE ?auto_165452 ?auto_165453 ?auto_165454 ?auto_165455 ?auto_165456 ?auto_165457 ?auto_165458 ?auto_165459 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165460 - BLOCK
      ?auto_165461 - BLOCK
      ?auto_165462 - BLOCK
      ?auto_165463 - BLOCK
      ?auto_165464 - BLOCK
      ?auto_165465 - BLOCK
      ?auto_165466 - BLOCK
      ?auto_165467 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165460 ) ( ON ?auto_165461 ?auto_165460 ) ( not ( = ?auto_165460 ?auto_165461 ) ) ( not ( = ?auto_165460 ?auto_165462 ) ) ( not ( = ?auto_165460 ?auto_165463 ) ) ( not ( = ?auto_165460 ?auto_165464 ) ) ( not ( = ?auto_165460 ?auto_165465 ) ) ( not ( = ?auto_165460 ?auto_165466 ) ) ( not ( = ?auto_165460 ?auto_165467 ) ) ( not ( = ?auto_165461 ?auto_165462 ) ) ( not ( = ?auto_165461 ?auto_165463 ) ) ( not ( = ?auto_165461 ?auto_165464 ) ) ( not ( = ?auto_165461 ?auto_165465 ) ) ( not ( = ?auto_165461 ?auto_165466 ) ) ( not ( = ?auto_165461 ?auto_165467 ) ) ( not ( = ?auto_165462 ?auto_165463 ) ) ( not ( = ?auto_165462 ?auto_165464 ) ) ( not ( = ?auto_165462 ?auto_165465 ) ) ( not ( = ?auto_165462 ?auto_165466 ) ) ( not ( = ?auto_165462 ?auto_165467 ) ) ( not ( = ?auto_165463 ?auto_165464 ) ) ( not ( = ?auto_165463 ?auto_165465 ) ) ( not ( = ?auto_165463 ?auto_165466 ) ) ( not ( = ?auto_165463 ?auto_165467 ) ) ( not ( = ?auto_165464 ?auto_165465 ) ) ( not ( = ?auto_165464 ?auto_165466 ) ) ( not ( = ?auto_165464 ?auto_165467 ) ) ( not ( = ?auto_165465 ?auto_165466 ) ) ( not ( = ?auto_165465 ?auto_165467 ) ) ( not ( = ?auto_165466 ?auto_165467 ) ) ( ON-TABLE ?auto_165467 ) ( ON ?auto_165466 ?auto_165467 ) ( ON ?auto_165465 ?auto_165466 ) ( ON ?auto_165464 ?auto_165465 ) ( ON ?auto_165463 ?auto_165464 ) ( CLEAR ?auto_165461 ) ( ON ?auto_165462 ?auto_165463 ) ( CLEAR ?auto_165462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165467 ?auto_165466 ?auto_165465 ?auto_165464 ?auto_165463 )
      ( MAKE-8PILE ?auto_165460 ?auto_165461 ?auto_165462 ?auto_165463 ?auto_165464 ?auto_165465 ?auto_165466 ?auto_165467 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165468 - BLOCK
      ?auto_165469 - BLOCK
      ?auto_165470 - BLOCK
      ?auto_165471 - BLOCK
      ?auto_165472 - BLOCK
      ?auto_165473 - BLOCK
      ?auto_165474 - BLOCK
      ?auto_165475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165468 ) ( not ( = ?auto_165468 ?auto_165469 ) ) ( not ( = ?auto_165468 ?auto_165470 ) ) ( not ( = ?auto_165468 ?auto_165471 ) ) ( not ( = ?auto_165468 ?auto_165472 ) ) ( not ( = ?auto_165468 ?auto_165473 ) ) ( not ( = ?auto_165468 ?auto_165474 ) ) ( not ( = ?auto_165468 ?auto_165475 ) ) ( not ( = ?auto_165469 ?auto_165470 ) ) ( not ( = ?auto_165469 ?auto_165471 ) ) ( not ( = ?auto_165469 ?auto_165472 ) ) ( not ( = ?auto_165469 ?auto_165473 ) ) ( not ( = ?auto_165469 ?auto_165474 ) ) ( not ( = ?auto_165469 ?auto_165475 ) ) ( not ( = ?auto_165470 ?auto_165471 ) ) ( not ( = ?auto_165470 ?auto_165472 ) ) ( not ( = ?auto_165470 ?auto_165473 ) ) ( not ( = ?auto_165470 ?auto_165474 ) ) ( not ( = ?auto_165470 ?auto_165475 ) ) ( not ( = ?auto_165471 ?auto_165472 ) ) ( not ( = ?auto_165471 ?auto_165473 ) ) ( not ( = ?auto_165471 ?auto_165474 ) ) ( not ( = ?auto_165471 ?auto_165475 ) ) ( not ( = ?auto_165472 ?auto_165473 ) ) ( not ( = ?auto_165472 ?auto_165474 ) ) ( not ( = ?auto_165472 ?auto_165475 ) ) ( not ( = ?auto_165473 ?auto_165474 ) ) ( not ( = ?auto_165473 ?auto_165475 ) ) ( not ( = ?auto_165474 ?auto_165475 ) ) ( ON-TABLE ?auto_165475 ) ( ON ?auto_165474 ?auto_165475 ) ( ON ?auto_165473 ?auto_165474 ) ( ON ?auto_165472 ?auto_165473 ) ( ON ?auto_165471 ?auto_165472 ) ( ON ?auto_165470 ?auto_165471 ) ( CLEAR ?auto_165470 ) ( HOLDING ?auto_165469 ) ( CLEAR ?auto_165468 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165468 ?auto_165469 )
      ( MAKE-8PILE ?auto_165468 ?auto_165469 ?auto_165470 ?auto_165471 ?auto_165472 ?auto_165473 ?auto_165474 ?auto_165475 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165476 - BLOCK
      ?auto_165477 - BLOCK
      ?auto_165478 - BLOCK
      ?auto_165479 - BLOCK
      ?auto_165480 - BLOCK
      ?auto_165481 - BLOCK
      ?auto_165482 - BLOCK
      ?auto_165483 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165476 ) ( not ( = ?auto_165476 ?auto_165477 ) ) ( not ( = ?auto_165476 ?auto_165478 ) ) ( not ( = ?auto_165476 ?auto_165479 ) ) ( not ( = ?auto_165476 ?auto_165480 ) ) ( not ( = ?auto_165476 ?auto_165481 ) ) ( not ( = ?auto_165476 ?auto_165482 ) ) ( not ( = ?auto_165476 ?auto_165483 ) ) ( not ( = ?auto_165477 ?auto_165478 ) ) ( not ( = ?auto_165477 ?auto_165479 ) ) ( not ( = ?auto_165477 ?auto_165480 ) ) ( not ( = ?auto_165477 ?auto_165481 ) ) ( not ( = ?auto_165477 ?auto_165482 ) ) ( not ( = ?auto_165477 ?auto_165483 ) ) ( not ( = ?auto_165478 ?auto_165479 ) ) ( not ( = ?auto_165478 ?auto_165480 ) ) ( not ( = ?auto_165478 ?auto_165481 ) ) ( not ( = ?auto_165478 ?auto_165482 ) ) ( not ( = ?auto_165478 ?auto_165483 ) ) ( not ( = ?auto_165479 ?auto_165480 ) ) ( not ( = ?auto_165479 ?auto_165481 ) ) ( not ( = ?auto_165479 ?auto_165482 ) ) ( not ( = ?auto_165479 ?auto_165483 ) ) ( not ( = ?auto_165480 ?auto_165481 ) ) ( not ( = ?auto_165480 ?auto_165482 ) ) ( not ( = ?auto_165480 ?auto_165483 ) ) ( not ( = ?auto_165481 ?auto_165482 ) ) ( not ( = ?auto_165481 ?auto_165483 ) ) ( not ( = ?auto_165482 ?auto_165483 ) ) ( ON-TABLE ?auto_165483 ) ( ON ?auto_165482 ?auto_165483 ) ( ON ?auto_165481 ?auto_165482 ) ( ON ?auto_165480 ?auto_165481 ) ( ON ?auto_165479 ?auto_165480 ) ( ON ?auto_165478 ?auto_165479 ) ( CLEAR ?auto_165476 ) ( ON ?auto_165477 ?auto_165478 ) ( CLEAR ?auto_165477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165483 ?auto_165482 ?auto_165481 ?auto_165480 ?auto_165479 ?auto_165478 )
      ( MAKE-8PILE ?auto_165476 ?auto_165477 ?auto_165478 ?auto_165479 ?auto_165480 ?auto_165481 ?auto_165482 ?auto_165483 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165484 - BLOCK
      ?auto_165485 - BLOCK
      ?auto_165486 - BLOCK
      ?auto_165487 - BLOCK
      ?auto_165488 - BLOCK
      ?auto_165489 - BLOCK
      ?auto_165490 - BLOCK
      ?auto_165491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165484 ?auto_165485 ) ) ( not ( = ?auto_165484 ?auto_165486 ) ) ( not ( = ?auto_165484 ?auto_165487 ) ) ( not ( = ?auto_165484 ?auto_165488 ) ) ( not ( = ?auto_165484 ?auto_165489 ) ) ( not ( = ?auto_165484 ?auto_165490 ) ) ( not ( = ?auto_165484 ?auto_165491 ) ) ( not ( = ?auto_165485 ?auto_165486 ) ) ( not ( = ?auto_165485 ?auto_165487 ) ) ( not ( = ?auto_165485 ?auto_165488 ) ) ( not ( = ?auto_165485 ?auto_165489 ) ) ( not ( = ?auto_165485 ?auto_165490 ) ) ( not ( = ?auto_165485 ?auto_165491 ) ) ( not ( = ?auto_165486 ?auto_165487 ) ) ( not ( = ?auto_165486 ?auto_165488 ) ) ( not ( = ?auto_165486 ?auto_165489 ) ) ( not ( = ?auto_165486 ?auto_165490 ) ) ( not ( = ?auto_165486 ?auto_165491 ) ) ( not ( = ?auto_165487 ?auto_165488 ) ) ( not ( = ?auto_165487 ?auto_165489 ) ) ( not ( = ?auto_165487 ?auto_165490 ) ) ( not ( = ?auto_165487 ?auto_165491 ) ) ( not ( = ?auto_165488 ?auto_165489 ) ) ( not ( = ?auto_165488 ?auto_165490 ) ) ( not ( = ?auto_165488 ?auto_165491 ) ) ( not ( = ?auto_165489 ?auto_165490 ) ) ( not ( = ?auto_165489 ?auto_165491 ) ) ( not ( = ?auto_165490 ?auto_165491 ) ) ( ON-TABLE ?auto_165491 ) ( ON ?auto_165490 ?auto_165491 ) ( ON ?auto_165489 ?auto_165490 ) ( ON ?auto_165488 ?auto_165489 ) ( ON ?auto_165487 ?auto_165488 ) ( ON ?auto_165486 ?auto_165487 ) ( ON ?auto_165485 ?auto_165486 ) ( CLEAR ?auto_165485 ) ( HOLDING ?auto_165484 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165484 )
      ( MAKE-8PILE ?auto_165484 ?auto_165485 ?auto_165486 ?auto_165487 ?auto_165488 ?auto_165489 ?auto_165490 ?auto_165491 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165492 - BLOCK
      ?auto_165493 - BLOCK
      ?auto_165494 - BLOCK
      ?auto_165495 - BLOCK
      ?auto_165496 - BLOCK
      ?auto_165497 - BLOCK
      ?auto_165498 - BLOCK
      ?auto_165499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165492 ?auto_165493 ) ) ( not ( = ?auto_165492 ?auto_165494 ) ) ( not ( = ?auto_165492 ?auto_165495 ) ) ( not ( = ?auto_165492 ?auto_165496 ) ) ( not ( = ?auto_165492 ?auto_165497 ) ) ( not ( = ?auto_165492 ?auto_165498 ) ) ( not ( = ?auto_165492 ?auto_165499 ) ) ( not ( = ?auto_165493 ?auto_165494 ) ) ( not ( = ?auto_165493 ?auto_165495 ) ) ( not ( = ?auto_165493 ?auto_165496 ) ) ( not ( = ?auto_165493 ?auto_165497 ) ) ( not ( = ?auto_165493 ?auto_165498 ) ) ( not ( = ?auto_165493 ?auto_165499 ) ) ( not ( = ?auto_165494 ?auto_165495 ) ) ( not ( = ?auto_165494 ?auto_165496 ) ) ( not ( = ?auto_165494 ?auto_165497 ) ) ( not ( = ?auto_165494 ?auto_165498 ) ) ( not ( = ?auto_165494 ?auto_165499 ) ) ( not ( = ?auto_165495 ?auto_165496 ) ) ( not ( = ?auto_165495 ?auto_165497 ) ) ( not ( = ?auto_165495 ?auto_165498 ) ) ( not ( = ?auto_165495 ?auto_165499 ) ) ( not ( = ?auto_165496 ?auto_165497 ) ) ( not ( = ?auto_165496 ?auto_165498 ) ) ( not ( = ?auto_165496 ?auto_165499 ) ) ( not ( = ?auto_165497 ?auto_165498 ) ) ( not ( = ?auto_165497 ?auto_165499 ) ) ( not ( = ?auto_165498 ?auto_165499 ) ) ( ON-TABLE ?auto_165499 ) ( ON ?auto_165498 ?auto_165499 ) ( ON ?auto_165497 ?auto_165498 ) ( ON ?auto_165496 ?auto_165497 ) ( ON ?auto_165495 ?auto_165496 ) ( ON ?auto_165494 ?auto_165495 ) ( ON ?auto_165493 ?auto_165494 ) ( ON ?auto_165492 ?auto_165493 ) ( CLEAR ?auto_165492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165499 ?auto_165498 ?auto_165497 ?auto_165496 ?auto_165495 ?auto_165494 ?auto_165493 )
      ( MAKE-8PILE ?auto_165492 ?auto_165493 ?auto_165494 ?auto_165495 ?auto_165496 ?auto_165497 ?auto_165498 ?auto_165499 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165508 - BLOCK
      ?auto_165509 - BLOCK
      ?auto_165510 - BLOCK
      ?auto_165511 - BLOCK
      ?auto_165512 - BLOCK
      ?auto_165513 - BLOCK
      ?auto_165514 - BLOCK
      ?auto_165515 - BLOCK
    )
    :vars
    (
      ?auto_165516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165508 ?auto_165509 ) ) ( not ( = ?auto_165508 ?auto_165510 ) ) ( not ( = ?auto_165508 ?auto_165511 ) ) ( not ( = ?auto_165508 ?auto_165512 ) ) ( not ( = ?auto_165508 ?auto_165513 ) ) ( not ( = ?auto_165508 ?auto_165514 ) ) ( not ( = ?auto_165508 ?auto_165515 ) ) ( not ( = ?auto_165509 ?auto_165510 ) ) ( not ( = ?auto_165509 ?auto_165511 ) ) ( not ( = ?auto_165509 ?auto_165512 ) ) ( not ( = ?auto_165509 ?auto_165513 ) ) ( not ( = ?auto_165509 ?auto_165514 ) ) ( not ( = ?auto_165509 ?auto_165515 ) ) ( not ( = ?auto_165510 ?auto_165511 ) ) ( not ( = ?auto_165510 ?auto_165512 ) ) ( not ( = ?auto_165510 ?auto_165513 ) ) ( not ( = ?auto_165510 ?auto_165514 ) ) ( not ( = ?auto_165510 ?auto_165515 ) ) ( not ( = ?auto_165511 ?auto_165512 ) ) ( not ( = ?auto_165511 ?auto_165513 ) ) ( not ( = ?auto_165511 ?auto_165514 ) ) ( not ( = ?auto_165511 ?auto_165515 ) ) ( not ( = ?auto_165512 ?auto_165513 ) ) ( not ( = ?auto_165512 ?auto_165514 ) ) ( not ( = ?auto_165512 ?auto_165515 ) ) ( not ( = ?auto_165513 ?auto_165514 ) ) ( not ( = ?auto_165513 ?auto_165515 ) ) ( not ( = ?auto_165514 ?auto_165515 ) ) ( ON-TABLE ?auto_165515 ) ( ON ?auto_165514 ?auto_165515 ) ( ON ?auto_165513 ?auto_165514 ) ( ON ?auto_165512 ?auto_165513 ) ( ON ?auto_165511 ?auto_165512 ) ( ON ?auto_165510 ?auto_165511 ) ( ON ?auto_165509 ?auto_165510 ) ( CLEAR ?auto_165509 ) ( ON ?auto_165508 ?auto_165516 ) ( CLEAR ?auto_165508 ) ( HAND-EMPTY ) ( not ( = ?auto_165508 ?auto_165516 ) ) ( not ( = ?auto_165509 ?auto_165516 ) ) ( not ( = ?auto_165510 ?auto_165516 ) ) ( not ( = ?auto_165511 ?auto_165516 ) ) ( not ( = ?auto_165512 ?auto_165516 ) ) ( not ( = ?auto_165513 ?auto_165516 ) ) ( not ( = ?auto_165514 ?auto_165516 ) ) ( not ( = ?auto_165515 ?auto_165516 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165508 ?auto_165516 )
      ( MAKE-8PILE ?auto_165508 ?auto_165509 ?auto_165510 ?auto_165511 ?auto_165512 ?auto_165513 ?auto_165514 ?auto_165515 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165517 - BLOCK
      ?auto_165518 - BLOCK
      ?auto_165519 - BLOCK
      ?auto_165520 - BLOCK
      ?auto_165521 - BLOCK
      ?auto_165522 - BLOCK
      ?auto_165523 - BLOCK
      ?auto_165524 - BLOCK
    )
    :vars
    (
      ?auto_165525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165517 ?auto_165518 ) ) ( not ( = ?auto_165517 ?auto_165519 ) ) ( not ( = ?auto_165517 ?auto_165520 ) ) ( not ( = ?auto_165517 ?auto_165521 ) ) ( not ( = ?auto_165517 ?auto_165522 ) ) ( not ( = ?auto_165517 ?auto_165523 ) ) ( not ( = ?auto_165517 ?auto_165524 ) ) ( not ( = ?auto_165518 ?auto_165519 ) ) ( not ( = ?auto_165518 ?auto_165520 ) ) ( not ( = ?auto_165518 ?auto_165521 ) ) ( not ( = ?auto_165518 ?auto_165522 ) ) ( not ( = ?auto_165518 ?auto_165523 ) ) ( not ( = ?auto_165518 ?auto_165524 ) ) ( not ( = ?auto_165519 ?auto_165520 ) ) ( not ( = ?auto_165519 ?auto_165521 ) ) ( not ( = ?auto_165519 ?auto_165522 ) ) ( not ( = ?auto_165519 ?auto_165523 ) ) ( not ( = ?auto_165519 ?auto_165524 ) ) ( not ( = ?auto_165520 ?auto_165521 ) ) ( not ( = ?auto_165520 ?auto_165522 ) ) ( not ( = ?auto_165520 ?auto_165523 ) ) ( not ( = ?auto_165520 ?auto_165524 ) ) ( not ( = ?auto_165521 ?auto_165522 ) ) ( not ( = ?auto_165521 ?auto_165523 ) ) ( not ( = ?auto_165521 ?auto_165524 ) ) ( not ( = ?auto_165522 ?auto_165523 ) ) ( not ( = ?auto_165522 ?auto_165524 ) ) ( not ( = ?auto_165523 ?auto_165524 ) ) ( ON-TABLE ?auto_165524 ) ( ON ?auto_165523 ?auto_165524 ) ( ON ?auto_165522 ?auto_165523 ) ( ON ?auto_165521 ?auto_165522 ) ( ON ?auto_165520 ?auto_165521 ) ( ON ?auto_165519 ?auto_165520 ) ( ON ?auto_165517 ?auto_165525 ) ( CLEAR ?auto_165517 ) ( not ( = ?auto_165517 ?auto_165525 ) ) ( not ( = ?auto_165518 ?auto_165525 ) ) ( not ( = ?auto_165519 ?auto_165525 ) ) ( not ( = ?auto_165520 ?auto_165525 ) ) ( not ( = ?auto_165521 ?auto_165525 ) ) ( not ( = ?auto_165522 ?auto_165525 ) ) ( not ( = ?auto_165523 ?auto_165525 ) ) ( not ( = ?auto_165524 ?auto_165525 ) ) ( HOLDING ?auto_165518 ) ( CLEAR ?auto_165519 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165524 ?auto_165523 ?auto_165522 ?auto_165521 ?auto_165520 ?auto_165519 ?auto_165518 )
      ( MAKE-8PILE ?auto_165517 ?auto_165518 ?auto_165519 ?auto_165520 ?auto_165521 ?auto_165522 ?auto_165523 ?auto_165524 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165526 - BLOCK
      ?auto_165527 - BLOCK
      ?auto_165528 - BLOCK
      ?auto_165529 - BLOCK
      ?auto_165530 - BLOCK
      ?auto_165531 - BLOCK
      ?auto_165532 - BLOCK
      ?auto_165533 - BLOCK
    )
    :vars
    (
      ?auto_165534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165526 ?auto_165527 ) ) ( not ( = ?auto_165526 ?auto_165528 ) ) ( not ( = ?auto_165526 ?auto_165529 ) ) ( not ( = ?auto_165526 ?auto_165530 ) ) ( not ( = ?auto_165526 ?auto_165531 ) ) ( not ( = ?auto_165526 ?auto_165532 ) ) ( not ( = ?auto_165526 ?auto_165533 ) ) ( not ( = ?auto_165527 ?auto_165528 ) ) ( not ( = ?auto_165527 ?auto_165529 ) ) ( not ( = ?auto_165527 ?auto_165530 ) ) ( not ( = ?auto_165527 ?auto_165531 ) ) ( not ( = ?auto_165527 ?auto_165532 ) ) ( not ( = ?auto_165527 ?auto_165533 ) ) ( not ( = ?auto_165528 ?auto_165529 ) ) ( not ( = ?auto_165528 ?auto_165530 ) ) ( not ( = ?auto_165528 ?auto_165531 ) ) ( not ( = ?auto_165528 ?auto_165532 ) ) ( not ( = ?auto_165528 ?auto_165533 ) ) ( not ( = ?auto_165529 ?auto_165530 ) ) ( not ( = ?auto_165529 ?auto_165531 ) ) ( not ( = ?auto_165529 ?auto_165532 ) ) ( not ( = ?auto_165529 ?auto_165533 ) ) ( not ( = ?auto_165530 ?auto_165531 ) ) ( not ( = ?auto_165530 ?auto_165532 ) ) ( not ( = ?auto_165530 ?auto_165533 ) ) ( not ( = ?auto_165531 ?auto_165532 ) ) ( not ( = ?auto_165531 ?auto_165533 ) ) ( not ( = ?auto_165532 ?auto_165533 ) ) ( ON-TABLE ?auto_165533 ) ( ON ?auto_165532 ?auto_165533 ) ( ON ?auto_165531 ?auto_165532 ) ( ON ?auto_165530 ?auto_165531 ) ( ON ?auto_165529 ?auto_165530 ) ( ON ?auto_165528 ?auto_165529 ) ( ON ?auto_165526 ?auto_165534 ) ( not ( = ?auto_165526 ?auto_165534 ) ) ( not ( = ?auto_165527 ?auto_165534 ) ) ( not ( = ?auto_165528 ?auto_165534 ) ) ( not ( = ?auto_165529 ?auto_165534 ) ) ( not ( = ?auto_165530 ?auto_165534 ) ) ( not ( = ?auto_165531 ?auto_165534 ) ) ( not ( = ?auto_165532 ?auto_165534 ) ) ( not ( = ?auto_165533 ?auto_165534 ) ) ( CLEAR ?auto_165528 ) ( ON ?auto_165527 ?auto_165526 ) ( CLEAR ?auto_165527 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165534 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165534 ?auto_165526 )
      ( MAKE-8PILE ?auto_165526 ?auto_165527 ?auto_165528 ?auto_165529 ?auto_165530 ?auto_165531 ?auto_165532 ?auto_165533 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165535 - BLOCK
      ?auto_165536 - BLOCK
      ?auto_165537 - BLOCK
      ?auto_165538 - BLOCK
      ?auto_165539 - BLOCK
      ?auto_165540 - BLOCK
      ?auto_165541 - BLOCK
      ?auto_165542 - BLOCK
    )
    :vars
    (
      ?auto_165543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165535 ?auto_165536 ) ) ( not ( = ?auto_165535 ?auto_165537 ) ) ( not ( = ?auto_165535 ?auto_165538 ) ) ( not ( = ?auto_165535 ?auto_165539 ) ) ( not ( = ?auto_165535 ?auto_165540 ) ) ( not ( = ?auto_165535 ?auto_165541 ) ) ( not ( = ?auto_165535 ?auto_165542 ) ) ( not ( = ?auto_165536 ?auto_165537 ) ) ( not ( = ?auto_165536 ?auto_165538 ) ) ( not ( = ?auto_165536 ?auto_165539 ) ) ( not ( = ?auto_165536 ?auto_165540 ) ) ( not ( = ?auto_165536 ?auto_165541 ) ) ( not ( = ?auto_165536 ?auto_165542 ) ) ( not ( = ?auto_165537 ?auto_165538 ) ) ( not ( = ?auto_165537 ?auto_165539 ) ) ( not ( = ?auto_165537 ?auto_165540 ) ) ( not ( = ?auto_165537 ?auto_165541 ) ) ( not ( = ?auto_165537 ?auto_165542 ) ) ( not ( = ?auto_165538 ?auto_165539 ) ) ( not ( = ?auto_165538 ?auto_165540 ) ) ( not ( = ?auto_165538 ?auto_165541 ) ) ( not ( = ?auto_165538 ?auto_165542 ) ) ( not ( = ?auto_165539 ?auto_165540 ) ) ( not ( = ?auto_165539 ?auto_165541 ) ) ( not ( = ?auto_165539 ?auto_165542 ) ) ( not ( = ?auto_165540 ?auto_165541 ) ) ( not ( = ?auto_165540 ?auto_165542 ) ) ( not ( = ?auto_165541 ?auto_165542 ) ) ( ON-TABLE ?auto_165542 ) ( ON ?auto_165541 ?auto_165542 ) ( ON ?auto_165540 ?auto_165541 ) ( ON ?auto_165539 ?auto_165540 ) ( ON ?auto_165538 ?auto_165539 ) ( ON ?auto_165535 ?auto_165543 ) ( not ( = ?auto_165535 ?auto_165543 ) ) ( not ( = ?auto_165536 ?auto_165543 ) ) ( not ( = ?auto_165537 ?auto_165543 ) ) ( not ( = ?auto_165538 ?auto_165543 ) ) ( not ( = ?auto_165539 ?auto_165543 ) ) ( not ( = ?auto_165540 ?auto_165543 ) ) ( not ( = ?auto_165541 ?auto_165543 ) ) ( not ( = ?auto_165542 ?auto_165543 ) ) ( ON ?auto_165536 ?auto_165535 ) ( CLEAR ?auto_165536 ) ( ON-TABLE ?auto_165543 ) ( HOLDING ?auto_165537 ) ( CLEAR ?auto_165538 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165542 ?auto_165541 ?auto_165540 ?auto_165539 ?auto_165538 ?auto_165537 )
      ( MAKE-8PILE ?auto_165535 ?auto_165536 ?auto_165537 ?auto_165538 ?auto_165539 ?auto_165540 ?auto_165541 ?auto_165542 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165544 - BLOCK
      ?auto_165545 - BLOCK
      ?auto_165546 - BLOCK
      ?auto_165547 - BLOCK
      ?auto_165548 - BLOCK
      ?auto_165549 - BLOCK
      ?auto_165550 - BLOCK
      ?auto_165551 - BLOCK
    )
    :vars
    (
      ?auto_165552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165544 ?auto_165545 ) ) ( not ( = ?auto_165544 ?auto_165546 ) ) ( not ( = ?auto_165544 ?auto_165547 ) ) ( not ( = ?auto_165544 ?auto_165548 ) ) ( not ( = ?auto_165544 ?auto_165549 ) ) ( not ( = ?auto_165544 ?auto_165550 ) ) ( not ( = ?auto_165544 ?auto_165551 ) ) ( not ( = ?auto_165545 ?auto_165546 ) ) ( not ( = ?auto_165545 ?auto_165547 ) ) ( not ( = ?auto_165545 ?auto_165548 ) ) ( not ( = ?auto_165545 ?auto_165549 ) ) ( not ( = ?auto_165545 ?auto_165550 ) ) ( not ( = ?auto_165545 ?auto_165551 ) ) ( not ( = ?auto_165546 ?auto_165547 ) ) ( not ( = ?auto_165546 ?auto_165548 ) ) ( not ( = ?auto_165546 ?auto_165549 ) ) ( not ( = ?auto_165546 ?auto_165550 ) ) ( not ( = ?auto_165546 ?auto_165551 ) ) ( not ( = ?auto_165547 ?auto_165548 ) ) ( not ( = ?auto_165547 ?auto_165549 ) ) ( not ( = ?auto_165547 ?auto_165550 ) ) ( not ( = ?auto_165547 ?auto_165551 ) ) ( not ( = ?auto_165548 ?auto_165549 ) ) ( not ( = ?auto_165548 ?auto_165550 ) ) ( not ( = ?auto_165548 ?auto_165551 ) ) ( not ( = ?auto_165549 ?auto_165550 ) ) ( not ( = ?auto_165549 ?auto_165551 ) ) ( not ( = ?auto_165550 ?auto_165551 ) ) ( ON-TABLE ?auto_165551 ) ( ON ?auto_165550 ?auto_165551 ) ( ON ?auto_165549 ?auto_165550 ) ( ON ?auto_165548 ?auto_165549 ) ( ON ?auto_165547 ?auto_165548 ) ( ON ?auto_165544 ?auto_165552 ) ( not ( = ?auto_165544 ?auto_165552 ) ) ( not ( = ?auto_165545 ?auto_165552 ) ) ( not ( = ?auto_165546 ?auto_165552 ) ) ( not ( = ?auto_165547 ?auto_165552 ) ) ( not ( = ?auto_165548 ?auto_165552 ) ) ( not ( = ?auto_165549 ?auto_165552 ) ) ( not ( = ?auto_165550 ?auto_165552 ) ) ( not ( = ?auto_165551 ?auto_165552 ) ) ( ON ?auto_165545 ?auto_165544 ) ( ON-TABLE ?auto_165552 ) ( CLEAR ?auto_165547 ) ( ON ?auto_165546 ?auto_165545 ) ( CLEAR ?auto_165546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165552 ?auto_165544 ?auto_165545 )
      ( MAKE-8PILE ?auto_165544 ?auto_165545 ?auto_165546 ?auto_165547 ?auto_165548 ?auto_165549 ?auto_165550 ?auto_165551 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165553 - BLOCK
      ?auto_165554 - BLOCK
      ?auto_165555 - BLOCK
      ?auto_165556 - BLOCK
      ?auto_165557 - BLOCK
      ?auto_165558 - BLOCK
      ?auto_165559 - BLOCK
      ?auto_165560 - BLOCK
    )
    :vars
    (
      ?auto_165561 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165553 ?auto_165554 ) ) ( not ( = ?auto_165553 ?auto_165555 ) ) ( not ( = ?auto_165553 ?auto_165556 ) ) ( not ( = ?auto_165553 ?auto_165557 ) ) ( not ( = ?auto_165553 ?auto_165558 ) ) ( not ( = ?auto_165553 ?auto_165559 ) ) ( not ( = ?auto_165553 ?auto_165560 ) ) ( not ( = ?auto_165554 ?auto_165555 ) ) ( not ( = ?auto_165554 ?auto_165556 ) ) ( not ( = ?auto_165554 ?auto_165557 ) ) ( not ( = ?auto_165554 ?auto_165558 ) ) ( not ( = ?auto_165554 ?auto_165559 ) ) ( not ( = ?auto_165554 ?auto_165560 ) ) ( not ( = ?auto_165555 ?auto_165556 ) ) ( not ( = ?auto_165555 ?auto_165557 ) ) ( not ( = ?auto_165555 ?auto_165558 ) ) ( not ( = ?auto_165555 ?auto_165559 ) ) ( not ( = ?auto_165555 ?auto_165560 ) ) ( not ( = ?auto_165556 ?auto_165557 ) ) ( not ( = ?auto_165556 ?auto_165558 ) ) ( not ( = ?auto_165556 ?auto_165559 ) ) ( not ( = ?auto_165556 ?auto_165560 ) ) ( not ( = ?auto_165557 ?auto_165558 ) ) ( not ( = ?auto_165557 ?auto_165559 ) ) ( not ( = ?auto_165557 ?auto_165560 ) ) ( not ( = ?auto_165558 ?auto_165559 ) ) ( not ( = ?auto_165558 ?auto_165560 ) ) ( not ( = ?auto_165559 ?auto_165560 ) ) ( ON-TABLE ?auto_165560 ) ( ON ?auto_165559 ?auto_165560 ) ( ON ?auto_165558 ?auto_165559 ) ( ON ?auto_165557 ?auto_165558 ) ( ON ?auto_165553 ?auto_165561 ) ( not ( = ?auto_165553 ?auto_165561 ) ) ( not ( = ?auto_165554 ?auto_165561 ) ) ( not ( = ?auto_165555 ?auto_165561 ) ) ( not ( = ?auto_165556 ?auto_165561 ) ) ( not ( = ?auto_165557 ?auto_165561 ) ) ( not ( = ?auto_165558 ?auto_165561 ) ) ( not ( = ?auto_165559 ?auto_165561 ) ) ( not ( = ?auto_165560 ?auto_165561 ) ) ( ON ?auto_165554 ?auto_165553 ) ( ON-TABLE ?auto_165561 ) ( ON ?auto_165555 ?auto_165554 ) ( CLEAR ?auto_165555 ) ( HOLDING ?auto_165556 ) ( CLEAR ?auto_165557 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165560 ?auto_165559 ?auto_165558 ?auto_165557 ?auto_165556 )
      ( MAKE-8PILE ?auto_165553 ?auto_165554 ?auto_165555 ?auto_165556 ?auto_165557 ?auto_165558 ?auto_165559 ?auto_165560 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165562 - BLOCK
      ?auto_165563 - BLOCK
      ?auto_165564 - BLOCK
      ?auto_165565 - BLOCK
      ?auto_165566 - BLOCK
      ?auto_165567 - BLOCK
      ?auto_165568 - BLOCK
      ?auto_165569 - BLOCK
    )
    :vars
    (
      ?auto_165570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165562 ?auto_165563 ) ) ( not ( = ?auto_165562 ?auto_165564 ) ) ( not ( = ?auto_165562 ?auto_165565 ) ) ( not ( = ?auto_165562 ?auto_165566 ) ) ( not ( = ?auto_165562 ?auto_165567 ) ) ( not ( = ?auto_165562 ?auto_165568 ) ) ( not ( = ?auto_165562 ?auto_165569 ) ) ( not ( = ?auto_165563 ?auto_165564 ) ) ( not ( = ?auto_165563 ?auto_165565 ) ) ( not ( = ?auto_165563 ?auto_165566 ) ) ( not ( = ?auto_165563 ?auto_165567 ) ) ( not ( = ?auto_165563 ?auto_165568 ) ) ( not ( = ?auto_165563 ?auto_165569 ) ) ( not ( = ?auto_165564 ?auto_165565 ) ) ( not ( = ?auto_165564 ?auto_165566 ) ) ( not ( = ?auto_165564 ?auto_165567 ) ) ( not ( = ?auto_165564 ?auto_165568 ) ) ( not ( = ?auto_165564 ?auto_165569 ) ) ( not ( = ?auto_165565 ?auto_165566 ) ) ( not ( = ?auto_165565 ?auto_165567 ) ) ( not ( = ?auto_165565 ?auto_165568 ) ) ( not ( = ?auto_165565 ?auto_165569 ) ) ( not ( = ?auto_165566 ?auto_165567 ) ) ( not ( = ?auto_165566 ?auto_165568 ) ) ( not ( = ?auto_165566 ?auto_165569 ) ) ( not ( = ?auto_165567 ?auto_165568 ) ) ( not ( = ?auto_165567 ?auto_165569 ) ) ( not ( = ?auto_165568 ?auto_165569 ) ) ( ON-TABLE ?auto_165569 ) ( ON ?auto_165568 ?auto_165569 ) ( ON ?auto_165567 ?auto_165568 ) ( ON ?auto_165566 ?auto_165567 ) ( ON ?auto_165562 ?auto_165570 ) ( not ( = ?auto_165562 ?auto_165570 ) ) ( not ( = ?auto_165563 ?auto_165570 ) ) ( not ( = ?auto_165564 ?auto_165570 ) ) ( not ( = ?auto_165565 ?auto_165570 ) ) ( not ( = ?auto_165566 ?auto_165570 ) ) ( not ( = ?auto_165567 ?auto_165570 ) ) ( not ( = ?auto_165568 ?auto_165570 ) ) ( not ( = ?auto_165569 ?auto_165570 ) ) ( ON ?auto_165563 ?auto_165562 ) ( ON-TABLE ?auto_165570 ) ( ON ?auto_165564 ?auto_165563 ) ( CLEAR ?auto_165566 ) ( ON ?auto_165565 ?auto_165564 ) ( CLEAR ?auto_165565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165570 ?auto_165562 ?auto_165563 ?auto_165564 )
      ( MAKE-8PILE ?auto_165562 ?auto_165563 ?auto_165564 ?auto_165565 ?auto_165566 ?auto_165567 ?auto_165568 ?auto_165569 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165571 - BLOCK
      ?auto_165572 - BLOCK
      ?auto_165573 - BLOCK
      ?auto_165574 - BLOCK
      ?auto_165575 - BLOCK
      ?auto_165576 - BLOCK
      ?auto_165577 - BLOCK
      ?auto_165578 - BLOCK
    )
    :vars
    (
      ?auto_165579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165571 ?auto_165572 ) ) ( not ( = ?auto_165571 ?auto_165573 ) ) ( not ( = ?auto_165571 ?auto_165574 ) ) ( not ( = ?auto_165571 ?auto_165575 ) ) ( not ( = ?auto_165571 ?auto_165576 ) ) ( not ( = ?auto_165571 ?auto_165577 ) ) ( not ( = ?auto_165571 ?auto_165578 ) ) ( not ( = ?auto_165572 ?auto_165573 ) ) ( not ( = ?auto_165572 ?auto_165574 ) ) ( not ( = ?auto_165572 ?auto_165575 ) ) ( not ( = ?auto_165572 ?auto_165576 ) ) ( not ( = ?auto_165572 ?auto_165577 ) ) ( not ( = ?auto_165572 ?auto_165578 ) ) ( not ( = ?auto_165573 ?auto_165574 ) ) ( not ( = ?auto_165573 ?auto_165575 ) ) ( not ( = ?auto_165573 ?auto_165576 ) ) ( not ( = ?auto_165573 ?auto_165577 ) ) ( not ( = ?auto_165573 ?auto_165578 ) ) ( not ( = ?auto_165574 ?auto_165575 ) ) ( not ( = ?auto_165574 ?auto_165576 ) ) ( not ( = ?auto_165574 ?auto_165577 ) ) ( not ( = ?auto_165574 ?auto_165578 ) ) ( not ( = ?auto_165575 ?auto_165576 ) ) ( not ( = ?auto_165575 ?auto_165577 ) ) ( not ( = ?auto_165575 ?auto_165578 ) ) ( not ( = ?auto_165576 ?auto_165577 ) ) ( not ( = ?auto_165576 ?auto_165578 ) ) ( not ( = ?auto_165577 ?auto_165578 ) ) ( ON-TABLE ?auto_165578 ) ( ON ?auto_165577 ?auto_165578 ) ( ON ?auto_165576 ?auto_165577 ) ( ON ?auto_165571 ?auto_165579 ) ( not ( = ?auto_165571 ?auto_165579 ) ) ( not ( = ?auto_165572 ?auto_165579 ) ) ( not ( = ?auto_165573 ?auto_165579 ) ) ( not ( = ?auto_165574 ?auto_165579 ) ) ( not ( = ?auto_165575 ?auto_165579 ) ) ( not ( = ?auto_165576 ?auto_165579 ) ) ( not ( = ?auto_165577 ?auto_165579 ) ) ( not ( = ?auto_165578 ?auto_165579 ) ) ( ON ?auto_165572 ?auto_165571 ) ( ON-TABLE ?auto_165579 ) ( ON ?auto_165573 ?auto_165572 ) ( ON ?auto_165574 ?auto_165573 ) ( CLEAR ?auto_165574 ) ( HOLDING ?auto_165575 ) ( CLEAR ?auto_165576 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165578 ?auto_165577 ?auto_165576 ?auto_165575 )
      ( MAKE-8PILE ?auto_165571 ?auto_165572 ?auto_165573 ?auto_165574 ?auto_165575 ?auto_165576 ?auto_165577 ?auto_165578 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165580 - BLOCK
      ?auto_165581 - BLOCK
      ?auto_165582 - BLOCK
      ?auto_165583 - BLOCK
      ?auto_165584 - BLOCK
      ?auto_165585 - BLOCK
      ?auto_165586 - BLOCK
      ?auto_165587 - BLOCK
    )
    :vars
    (
      ?auto_165588 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165580 ?auto_165581 ) ) ( not ( = ?auto_165580 ?auto_165582 ) ) ( not ( = ?auto_165580 ?auto_165583 ) ) ( not ( = ?auto_165580 ?auto_165584 ) ) ( not ( = ?auto_165580 ?auto_165585 ) ) ( not ( = ?auto_165580 ?auto_165586 ) ) ( not ( = ?auto_165580 ?auto_165587 ) ) ( not ( = ?auto_165581 ?auto_165582 ) ) ( not ( = ?auto_165581 ?auto_165583 ) ) ( not ( = ?auto_165581 ?auto_165584 ) ) ( not ( = ?auto_165581 ?auto_165585 ) ) ( not ( = ?auto_165581 ?auto_165586 ) ) ( not ( = ?auto_165581 ?auto_165587 ) ) ( not ( = ?auto_165582 ?auto_165583 ) ) ( not ( = ?auto_165582 ?auto_165584 ) ) ( not ( = ?auto_165582 ?auto_165585 ) ) ( not ( = ?auto_165582 ?auto_165586 ) ) ( not ( = ?auto_165582 ?auto_165587 ) ) ( not ( = ?auto_165583 ?auto_165584 ) ) ( not ( = ?auto_165583 ?auto_165585 ) ) ( not ( = ?auto_165583 ?auto_165586 ) ) ( not ( = ?auto_165583 ?auto_165587 ) ) ( not ( = ?auto_165584 ?auto_165585 ) ) ( not ( = ?auto_165584 ?auto_165586 ) ) ( not ( = ?auto_165584 ?auto_165587 ) ) ( not ( = ?auto_165585 ?auto_165586 ) ) ( not ( = ?auto_165585 ?auto_165587 ) ) ( not ( = ?auto_165586 ?auto_165587 ) ) ( ON-TABLE ?auto_165587 ) ( ON ?auto_165586 ?auto_165587 ) ( ON ?auto_165585 ?auto_165586 ) ( ON ?auto_165580 ?auto_165588 ) ( not ( = ?auto_165580 ?auto_165588 ) ) ( not ( = ?auto_165581 ?auto_165588 ) ) ( not ( = ?auto_165582 ?auto_165588 ) ) ( not ( = ?auto_165583 ?auto_165588 ) ) ( not ( = ?auto_165584 ?auto_165588 ) ) ( not ( = ?auto_165585 ?auto_165588 ) ) ( not ( = ?auto_165586 ?auto_165588 ) ) ( not ( = ?auto_165587 ?auto_165588 ) ) ( ON ?auto_165581 ?auto_165580 ) ( ON-TABLE ?auto_165588 ) ( ON ?auto_165582 ?auto_165581 ) ( ON ?auto_165583 ?auto_165582 ) ( CLEAR ?auto_165585 ) ( ON ?auto_165584 ?auto_165583 ) ( CLEAR ?auto_165584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165588 ?auto_165580 ?auto_165581 ?auto_165582 ?auto_165583 )
      ( MAKE-8PILE ?auto_165580 ?auto_165581 ?auto_165582 ?auto_165583 ?auto_165584 ?auto_165585 ?auto_165586 ?auto_165587 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165589 - BLOCK
      ?auto_165590 - BLOCK
      ?auto_165591 - BLOCK
      ?auto_165592 - BLOCK
      ?auto_165593 - BLOCK
      ?auto_165594 - BLOCK
      ?auto_165595 - BLOCK
      ?auto_165596 - BLOCK
    )
    :vars
    (
      ?auto_165597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165589 ?auto_165590 ) ) ( not ( = ?auto_165589 ?auto_165591 ) ) ( not ( = ?auto_165589 ?auto_165592 ) ) ( not ( = ?auto_165589 ?auto_165593 ) ) ( not ( = ?auto_165589 ?auto_165594 ) ) ( not ( = ?auto_165589 ?auto_165595 ) ) ( not ( = ?auto_165589 ?auto_165596 ) ) ( not ( = ?auto_165590 ?auto_165591 ) ) ( not ( = ?auto_165590 ?auto_165592 ) ) ( not ( = ?auto_165590 ?auto_165593 ) ) ( not ( = ?auto_165590 ?auto_165594 ) ) ( not ( = ?auto_165590 ?auto_165595 ) ) ( not ( = ?auto_165590 ?auto_165596 ) ) ( not ( = ?auto_165591 ?auto_165592 ) ) ( not ( = ?auto_165591 ?auto_165593 ) ) ( not ( = ?auto_165591 ?auto_165594 ) ) ( not ( = ?auto_165591 ?auto_165595 ) ) ( not ( = ?auto_165591 ?auto_165596 ) ) ( not ( = ?auto_165592 ?auto_165593 ) ) ( not ( = ?auto_165592 ?auto_165594 ) ) ( not ( = ?auto_165592 ?auto_165595 ) ) ( not ( = ?auto_165592 ?auto_165596 ) ) ( not ( = ?auto_165593 ?auto_165594 ) ) ( not ( = ?auto_165593 ?auto_165595 ) ) ( not ( = ?auto_165593 ?auto_165596 ) ) ( not ( = ?auto_165594 ?auto_165595 ) ) ( not ( = ?auto_165594 ?auto_165596 ) ) ( not ( = ?auto_165595 ?auto_165596 ) ) ( ON-TABLE ?auto_165596 ) ( ON ?auto_165595 ?auto_165596 ) ( ON ?auto_165589 ?auto_165597 ) ( not ( = ?auto_165589 ?auto_165597 ) ) ( not ( = ?auto_165590 ?auto_165597 ) ) ( not ( = ?auto_165591 ?auto_165597 ) ) ( not ( = ?auto_165592 ?auto_165597 ) ) ( not ( = ?auto_165593 ?auto_165597 ) ) ( not ( = ?auto_165594 ?auto_165597 ) ) ( not ( = ?auto_165595 ?auto_165597 ) ) ( not ( = ?auto_165596 ?auto_165597 ) ) ( ON ?auto_165590 ?auto_165589 ) ( ON-TABLE ?auto_165597 ) ( ON ?auto_165591 ?auto_165590 ) ( ON ?auto_165592 ?auto_165591 ) ( ON ?auto_165593 ?auto_165592 ) ( CLEAR ?auto_165593 ) ( HOLDING ?auto_165594 ) ( CLEAR ?auto_165595 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165596 ?auto_165595 ?auto_165594 )
      ( MAKE-8PILE ?auto_165589 ?auto_165590 ?auto_165591 ?auto_165592 ?auto_165593 ?auto_165594 ?auto_165595 ?auto_165596 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165598 - BLOCK
      ?auto_165599 - BLOCK
      ?auto_165600 - BLOCK
      ?auto_165601 - BLOCK
      ?auto_165602 - BLOCK
      ?auto_165603 - BLOCK
      ?auto_165604 - BLOCK
      ?auto_165605 - BLOCK
    )
    :vars
    (
      ?auto_165606 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165598 ?auto_165599 ) ) ( not ( = ?auto_165598 ?auto_165600 ) ) ( not ( = ?auto_165598 ?auto_165601 ) ) ( not ( = ?auto_165598 ?auto_165602 ) ) ( not ( = ?auto_165598 ?auto_165603 ) ) ( not ( = ?auto_165598 ?auto_165604 ) ) ( not ( = ?auto_165598 ?auto_165605 ) ) ( not ( = ?auto_165599 ?auto_165600 ) ) ( not ( = ?auto_165599 ?auto_165601 ) ) ( not ( = ?auto_165599 ?auto_165602 ) ) ( not ( = ?auto_165599 ?auto_165603 ) ) ( not ( = ?auto_165599 ?auto_165604 ) ) ( not ( = ?auto_165599 ?auto_165605 ) ) ( not ( = ?auto_165600 ?auto_165601 ) ) ( not ( = ?auto_165600 ?auto_165602 ) ) ( not ( = ?auto_165600 ?auto_165603 ) ) ( not ( = ?auto_165600 ?auto_165604 ) ) ( not ( = ?auto_165600 ?auto_165605 ) ) ( not ( = ?auto_165601 ?auto_165602 ) ) ( not ( = ?auto_165601 ?auto_165603 ) ) ( not ( = ?auto_165601 ?auto_165604 ) ) ( not ( = ?auto_165601 ?auto_165605 ) ) ( not ( = ?auto_165602 ?auto_165603 ) ) ( not ( = ?auto_165602 ?auto_165604 ) ) ( not ( = ?auto_165602 ?auto_165605 ) ) ( not ( = ?auto_165603 ?auto_165604 ) ) ( not ( = ?auto_165603 ?auto_165605 ) ) ( not ( = ?auto_165604 ?auto_165605 ) ) ( ON-TABLE ?auto_165605 ) ( ON ?auto_165604 ?auto_165605 ) ( ON ?auto_165598 ?auto_165606 ) ( not ( = ?auto_165598 ?auto_165606 ) ) ( not ( = ?auto_165599 ?auto_165606 ) ) ( not ( = ?auto_165600 ?auto_165606 ) ) ( not ( = ?auto_165601 ?auto_165606 ) ) ( not ( = ?auto_165602 ?auto_165606 ) ) ( not ( = ?auto_165603 ?auto_165606 ) ) ( not ( = ?auto_165604 ?auto_165606 ) ) ( not ( = ?auto_165605 ?auto_165606 ) ) ( ON ?auto_165599 ?auto_165598 ) ( ON-TABLE ?auto_165606 ) ( ON ?auto_165600 ?auto_165599 ) ( ON ?auto_165601 ?auto_165600 ) ( ON ?auto_165602 ?auto_165601 ) ( CLEAR ?auto_165604 ) ( ON ?auto_165603 ?auto_165602 ) ( CLEAR ?auto_165603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165606 ?auto_165598 ?auto_165599 ?auto_165600 ?auto_165601 ?auto_165602 )
      ( MAKE-8PILE ?auto_165598 ?auto_165599 ?auto_165600 ?auto_165601 ?auto_165602 ?auto_165603 ?auto_165604 ?auto_165605 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165607 - BLOCK
      ?auto_165608 - BLOCK
      ?auto_165609 - BLOCK
      ?auto_165610 - BLOCK
      ?auto_165611 - BLOCK
      ?auto_165612 - BLOCK
      ?auto_165613 - BLOCK
      ?auto_165614 - BLOCK
    )
    :vars
    (
      ?auto_165615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165607 ?auto_165608 ) ) ( not ( = ?auto_165607 ?auto_165609 ) ) ( not ( = ?auto_165607 ?auto_165610 ) ) ( not ( = ?auto_165607 ?auto_165611 ) ) ( not ( = ?auto_165607 ?auto_165612 ) ) ( not ( = ?auto_165607 ?auto_165613 ) ) ( not ( = ?auto_165607 ?auto_165614 ) ) ( not ( = ?auto_165608 ?auto_165609 ) ) ( not ( = ?auto_165608 ?auto_165610 ) ) ( not ( = ?auto_165608 ?auto_165611 ) ) ( not ( = ?auto_165608 ?auto_165612 ) ) ( not ( = ?auto_165608 ?auto_165613 ) ) ( not ( = ?auto_165608 ?auto_165614 ) ) ( not ( = ?auto_165609 ?auto_165610 ) ) ( not ( = ?auto_165609 ?auto_165611 ) ) ( not ( = ?auto_165609 ?auto_165612 ) ) ( not ( = ?auto_165609 ?auto_165613 ) ) ( not ( = ?auto_165609 ?auto_165614 ) ) ( not ( = ?auto_165610 ?auto_165611 ) ) ( not ( = ?auto_165610 ?auto_165612 ) ) ( not ( = ?auto_165610 ?auto_165613 ) ) ( not ( = ?auto_165610 ?auto_165614 ) ) ( not ( = ?auto_165611 ?auto_165612 ) ) ( not ( = ?auto_165611 ?auto_165613 ) ) ( not ( = ?auto_165611 ?auto_165614 ) ) ( not ( = ?auto_165612 ?auto_165613 ) ) ( not ( = ?auto_165612 ?auto_165614 ) ) ( not ( = ?auto_165613 ?auto_165614 ) ) ( ON-TABLE ?auto_165614 ) ( ON ?auto_165607 ?auto_165615 ) ( not ( = ?auto_165607 ?auto_165615 ) ) ( not ( = ?auto_165608 ?auto_165615 ) ) ( not ( = ?auto_165609 ?auto_165615 ) ) ( not ( = ?auto_165610 ?auto_165615 ) ) ( not ( = ?auto_165611 ?auto_165615 ) ) ( not ( = ?auto_165612 ?auto_165615 ) ) ( not ( = ?auto_165613 ?auto_165615 ) ) ( not ( = ?auto_165614 ?auto_165615 ) ) ( ON ?auto_165608 ?auto_165607 ) ( ON-TABLE ?auto_165615 ) ( ON ?auto_165609 ?auto_165608 ) ( ON ?auto_165610 ?auto_165609 ) ( ON ?auto_165611 ?auto_165610 ) ( ON ?auto_165612 ?auto_165611 ) ( CLEAR ?auto_165612 ) ( HOLDING ?auto_165613 ) ( CLEAR ?auto_165614 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165614 ?auto_165613 )
      ( MAKE-8PILE ?auto_165607 ?auto_165608 ?auto_165609 ?auto_165610 ?auto_165611 ?auto_165612 ?auto_165613 ?auto_165614 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165616 - BLOCK
      ?auto_165617 - BLOCK
      ?auto_165618 - BLOCK
      ?auto_165619 - BLOCK
      ?auto_165620 - BLOCK
      ?auto_165621 - BLOCK
      ?auto_165622 - BLOCK
      ?auto_165623 - BLOCK
    )
    :vars
    (
      ?auto_165624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165616 ?auto_165617 ) ) ( not ( = ?auto_165616 ?auto_165618 ) ) ( not ( = ?auto_165616 ?auto_165619 ) ) ( not ( = ?auto_165616 ?auto_165620 ) ) ( not ( = ?auto_165616 ?auto_165621 ) ) ( not ( = ?auto_165616 ?auto_165622 ) ) ( not ( = ?auto_165616 ?auto_165623 ) ) ( not ( = ?auto_165617 ?auto_165618 ) ) ( not ( = ?auto_165617 ?auto_165619 ) ) ( not ( = ?auto_165617 ?auto_165620 ) ) ( not ( = ?auto_165617 ?auto_165621 ) ) ( not ( = ?auto_165617 ?auto_165622 ) ) ( not ( = ?auto_165617 ?auto_165623 ) ) ( not ( = ?auto_165618 ?auto_165619 ) ) ( not ( = ?auto_165618 ?auto_165620 ) ) ( not ( = ?auto_165618 ?auto_165621 ) ) ( not ( = ?auto_165618 ?auto_165622 ) ) ( not ( = ?auto_165618 ?auto_165623 ) ) ( not ( = ?auto_165619 ?auto_165620 ) ) ( not ( = ?auto_165619 ?auto_165621 ) ) ( not ( = ?auto_165619 ?auto_165622 ) ) ( not ( = ?auto_165619 ?auto_165623 ) ) ( not ( = ?auto_165620 ?auto_165621 ) ) ( not ( = ?auto_165620 ?auto_165622 ) ) ( not ( = ?auto_165620 ?auto_165623 ) ) ( not ( = ?auto_165621 ?auto_165622 ) ) ( not ( = ?auto_165621 ?auto_165623 ) ) ( not ( = ?auto_165622 ?auto_165623 ) ) ( ON-TABLE ?auto_165623 ) ( ON ?auto_165616 ?auto_165624 ) ( not ( = ?auto_165616 ?auto_165624 ) ) ( not ( = ?auto_165617 ?auto_165624 ) ) ( not ( = ?auto_165618 ?auto_165624 ) ) ( not ( = ?auto_165619 ?auto_165624 ) ) ( not ( = ?auto_165620 ?auto_165624 ) ) ( not ( = ?auto_165621 ?auto_165624 ) ) ( not ( = ?auto_165622 ?auto_165624 ) ) ( not ( = ?auto_165623 ?auto_165624 ) ) ( ON ?auto_165617 ?auto_165616 ) ( ON-TABLE ?auto_165624 ) ( ON ?auto_165618 ?auto_165617 ) ( ON ?auto_165619 ?auto_165618 ) ( ON ?auto_165620 ?auto_165619 ) ( ON ?auto_165621 ?auto_165620 ) ( CLEAR ?auto_165623 ) ( ON ?auto_165622 ?auto_165621 ) ( CLEAR ?auto_165622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165624 ?auto_165616 ?auto_165617 ?auto_165618 ?auto_165619 ?auto_165620 ?auto_165621 )
      ( MAKE-8PILE ?auto_165616 ?auto_165617 ?auto_165618 ?auto_165619 ?auto_165620 ?auto_165621 ?auto_165622 ?auto_165623 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165625 - BLOCK
      ?auto_165626 - BLOCK
      ?auto_165627 - BLOCK
      ?auto_165628 - BLOCK
      ?auto_165629 - BLOCK
      ?auto_165630 - BLOCK
      ?auto_165631 - BLOCK
      ?auto_165632 - BLOCK
    )
    :vars
    (
      ?auto_165633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165625 ?auto_165626 ) ) ( not ( = ?auto_165625 ?auto_165627 ) ) ( not ( = ?auto_165625 ?auto_165628 ) ) ( not ( = ?auto_165625 ?auto_165629 ) ) ( not ( = ?auto_165625 ?auto_165630 ) ) ( not ( = ?auto_165625 ?auto_165631 ) ) ( not ( = ?auto_165625 ?auto_165632 ) ) ( not ( = ?auto_165626 ?auto_165627 ) ) ( not ( = ?auto_165626 ?auto_165628 ) ) ( not ( = ?auto_165626 ?auto_165629 ) ) ( not ( = ?auto_165626 ?auto_165630 ) ) ( not ( = ?auto_165626 ?auto_165631 ) ) ( not ( = ?auto_165626 ?auto_165632 ) ) ( not ( = ?auto_165627 ?auto_165628 ) ) ( not ( = ?auto_165627 ?auto_165629 ) ) ( not ( = ?auto_165627 ?auto_165630 ) ) ( not ( = ?auto_165627 ?auto_165631 ) ) ( not ( = ?auto_165627 ?auto_165632 ) ) ( not ( = ?auto_165628 ?auto_165629 ) ) ( not ( = ?auto_165628 ?auto_165630 ) ) ( not ( = ?auto_165628 ?auto_165631 ) ) ( not ( = ?auto_165628 ?auto_165632 ) ) ( not ( = ?auto_165629 ?auto_165630 ) ) ( not ( = ?auto_165629 ?auto_165631 ) ) ( not ( = ?auto_165629 ?auto_165632 ) ) ( not ( = ?auto_165630 ?auto_165631 ) ) ( not ( = ?auto_165630 ?auto_165632 ) ) ( not ( = ?auto_165631 ?auto_165632 ) ) ( ON ?auto_165625 ?auto_165633 ) ( not ( = ?auto_165625 ?auto_165633 ) ) ( not ( = ?auto_165626 ?auto_165633 ) ) ( not ( = ?auto_165627 ?auto_165633 ) ) ( not ( = ?auto_165628 ?auto_165633 ) ) ( not ( = ?auto_165629 ?auto_165633 ) ) ( not ( = ?auto_165630 ?auto_165633 ) ) ( not ( = ?auto_165631 ?auto_165633 ) ) ( not ( = ?auto_165632 ?auto_165633 ) ) ( ON ?auto_165626 ?auto_165625 ) ( ON-TABLE ?auto_165633 ) ( ON ?auto_165627 ?auto_165626 ) ( ON ?auto_165628 ?auto_165627 ) ( ON ?auto_165629 ?auto_165628 ) ( ON ?auto_165630 ?auto_165629 ) ( ON ?auto_165631 ?auto_165630 ) ( CLEAR ?auto_165631 ) ( HOLDING ?auto_165632 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165632 )
      ( MAKE-8PILE ?auto_165625 ?auto_165626 ?auto_165627 ?auto_165628 ?auto_165629 ?auto_165630 ?auto_165631 ?auto_165632 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_165634 - BLOCK
      ?auto_165635 - BLOCK
      ?auto_165636 - BLOCK
      ?auto_165637 - BLOCK
      ?auto_165638 - BLOCK
      ?auto_165639 - BLOCK
      ?auto_165640 - BLOCK
      ?auto_165641 - BLOCK
    )
    :vars
    (
      ?auto_165642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165634 ?auto_165635 ) ) ( not ( = ?auto_165634 ?auto_165636 ) ) ( not ( = ?auto_165634 ?auto_165637 ) ) ( not ( = ?auto_165634 ?auto_165638 ) ) ( not ( = ?auto_165634 ?auto_165639 ) ) ( not ( = ?auto_165634 ?auto_165640 ) ) ( not ( = ?auto_165634 ?auto_165641 ) ) ( not ( = ?auto_165635 ?auto_165636 ) ) ( not ( = ?auto_165635 ?auto_165637 ) ) ( not ( = ?auto_165635 ?auto_165638 ) ) ( not ( = ?auto_165635 ?auto_165639 ) ) ( not ( = ?auto_165635 ?auto_165640 ) ) ( not ( = ?auto_165635 ?auto_165641 ) ) ( not ( = ?auto_165636 ?auto_165637 ) ) ( not ( = ?auto_165636 ?auto_165638 ) ) ( not ( = ?auto_165636 ?auto_165639 ) ) ( not ( = ?auto_165636 ?auto_165640 ) ) ( not ( = ?auto_165636 ?auto_165641 ) ) ( not ( = ?auto_165637 ?auto_165638 ) ) ( not ( = ?auto_165637 ?auto_165639 ) ) ( not ( = ?auto_165637 ?auto_165640 ) ) ( not ( = ?auto_165637 ?auto_165641 ) ) ( not ( = ?auto_165638 ?auto_165639 ) ) ( not ( = ?auto_165638 ?auto_165640 ) ) ( not ( = ?auto_165638 ?auto_165641 ) ) ( not ( = ?auto_165639 ?auto_165640 ) ) ( not ( = ?auto_165639 ?auto_165641 ) ) ( not ( = ?auto_165640 ?auto_165641 ) ) ( ON ?auto_165634 ?auto_165642 ) ( not ( = ?auto_165634 ?auto_165642 ) ) ( not ( = ?auto_165635 ?auto_165642 ) ) ( not ( = ?auto_165636 ?auto_165642 ) ) ( not ( = ?auto_165637 ?auto_165642 ) ) ( not ( = ?auto_165638 ?auto_165642 ) ) ( not ( = ?auto_165639 ?auto_165642 ) ) ( not ( = ?auto_165640 ?auto_165642 ) ) ( not ( = ?auto_165641 ?auto_165642 ) ) ( ON ?auto_165635 ?auto_165634 ) ( ON-TABLE ?auto_165642 ) ( ON ?auto_165636 ?auto_165635 ) ( ON ?auto_165637 ?auto_165636 ) ( ON ?auto_165638 ?auto_165637 ) ( ON ?auto_165639 ?auto_165638 ) ( ON ?auto_165640 ?auto_165639 ) ( ON ?auto_165641 ?auto_165640 ) ( CLEAR ?auto_165641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165642 ?auto_165634 ?auto_165635 ?auto_165636 ?auto_165637 ?auto_165638 ?auto_165639 ?auto_165640 )
      ( MAKE-8PILE ?auto_165634 ?auto_165635 ?auto_165636 ?auto_165637 ?auto_165638 ?auto_165639 ?auto_165640 ?auto_165641 ) )
  )

)

