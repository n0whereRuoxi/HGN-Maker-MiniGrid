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
      ?auto_334911 - BLOCK
    )
    :vars
    (
      ?auto_334912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334911 ?auto_334912 ) ( CLEAR ?auto_334911 ) ( HAND-EMPTY ) ( not ( = ?auto_334911 ?auto_334912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_334911 ?auto_334912 )
      ( !PUTDOWN ?auto_334911 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_334914 - BLOCK
    )
    :vars
    (
      ?auto_334915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334914 ?auto_334915 ) ( CLEAR ?auto_334914 ) ( HAND-EMPTY ) ( not ( = ?auto_334914 ?auto_334915 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_334914 ?auto_334915 )
      ( !PUTDOWN ?auto_334914 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_334918 - BLOCK
      ?auto_334919 - BLOCK
    )
    :vars
    (
      ?auto_334920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_334918 ) ( ON ?auto_334919 ?auto_334920 ) ( CLEAR ?auto_334919 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_334918 ) ( not ( = ?auto_334918 ?auto_334919 ) ) ( not ( = ?auto_334918 ?auto_334920 ) ) ( not ( = ?auto_334919 ?auto_334920 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_334919 ?auto_334920 )
      ( !STACK ?auto_334919 ?auto_334918 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_334923 - BLOCK
      ?auto_334924 - BLOCK
    )
    :vars
    (
      ?auto_334925 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_334923 ) ( ON ?auto_334924 ?auto_334925 ) ( CLEAR ?auto_334924 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_334923 ) ( not ( = ?auto_334923 ?auto_334924 ) ) ( not ( = ?auto_334923 ?auto_334925 ) ) ( not ( = ?auto_334924 ?auto_334925 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_334924 ?auto_334925 )
      ( !STACK ?auto_334924 ?auto_334923 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_334928 - BLOCK
      ?auto_334929 - BLOCK
    )
    :vars
    (
      ?auto_334930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334929 ?auto_334930 ) ( not ( = ?auto_334928 ?auto_334929 ) ) ( not ( = ?auto_334928 ?auto_334930 ) ) ( not ( = ?auto_334929 ?auto_334930 ) ) ( ON ?auto_334928 ?auto_334929 ) ( CLEAR ?auto_334928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_334928 )
      ( MAKE-2PILE ?auto_334928 ?auto_334929 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_334933 - BLOCK
      ?auto_334934 - BLOCK
    )
    :vars
    (
      ?auto_334935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334934 ?auto_334935 ) ( not ( = ?auto_334933 ?auto_334934 ) ) ( not ( = ?auto_334933 ?auto_334935 ) ) ( not ( = ?auto_334934 ?auto_334935 ) ) ( ON ?auto_334933 ?auto_334934 ) ( CLEAR ?auto_334933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_334933 )
      ( MAKE-2PILE ?auto_334933 ?auto_334934 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_334939 - BLOCK
      ?auto_334940 - BLOCK
      ?auto_334941 - BLOCK
    )
    :vars
    (
      ?auto_334942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_334940 ) ( ON ?auto_334941 ?auto_334942 ) ( CLEAR ?auto_334941 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_334939 ) ( ON ?auto_334940 ?auto_334939 ) ( not ( = ?auto_334939 ?auto_334940 ) ) ( not ( = ?auto_334939 ?auto_334941 ) ) ( not ( = ?auto_334939 ?auto_334942 ) ) ( not ( = ?auto_334940 ?auto_334941 ) ) ( not ( = ?auto_334940 ?auto_334942 ) ) ( not ( = ?auto_334941 ?auto_334942 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_334941 ?auto_334942 )
      ( !STACK ?auto_334941 ?auto_334940 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_334946 - BLOCK
      ?auto_334947 - BLOCK
      ?auto_334948 - BLOCK
    )
    :vars
    (
      ?auto_334949 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_334947 ) ( ON ?auto_334948 ?auto_334949 ) ( CLEAR ?auto_334948 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_334946 ) ( ON ?auto_334947 ?auto_334946 ) ( not ( = ?auto_334946 ?auto_334947 ) ) ( not ( = ?auto_334946 ?auto_334948 ) ) ( not ( = ?auto_334946 ?auto_334949 ) ) ( not ( = ?auto_334947 ?auto_334948 ) ) ( not ( = ?auto_334947 ?auto_334949 ) ) ( not ( = ?auto_334948 ?auto_334949 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_334948 ?auto_334949 )
      ( !STACK ?auto_334948 ?auto_334947 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_334953 - BLOCK
      ?auto_334954 - BLOCK
      ?auto_334955 - BLOCK
    )
    :vars
    (
      ?auto_334956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334955 ?auto_334956 ) ( ON-TABLE ?auto_334953 ) ( not ( = ?auto_334953 ?auto_334954 ) ) ( not ( = ?auto_334953 ?auto_334955 ) ) ( not ( = ?auto_334953 ?auto_334956 ) ) ( not ( = ?auto_334954 ?auto_334955 ) ) ( not ( = ?auto_334954 ?auto_334956 ) ) ( not ( = ?auto_334955 ?auto_334956 ) ) ( CLEAR ?auto_334953 ) ( ON ?auto_334954 ?auto_334955 ) ( CLEAR ?auto_334954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_334953 ?auto_334954 )
      ( MAKE-3PILE ?auto_334953 ?auto_334954 ?auto_334955 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_334960 - BLOCK
      ?auto_334961 - BLOCK
      ?auto_334962 - BLOCK
    )
    :vars
    (
      ?auto_334963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334962 ?auto_334963 ) ( ON-TABLE ?auto_334960 ) ( not ( = ?auto_334960 ?auto_334961 ) ) ( not ( = ?auto_334960 ?auto_334962 ) ) ( not ( = ?auto_334960 ?auto_334963 ) ) ( not ( = ?auto_334961 ?auto_334962 ) ) ( not ( = ?auto_334961 ?auto_334963 ) ) ( not ( = ?auto_334962 ?auto_334963 ) ) ( CLEAR ?auto_334960 ) ( ON ?auto_334961 ?auto_334962 ) ( CLEAR ?auto_334961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_334960 ?auto_334961 )
      ( MAKE-3PILE ?auto_334960 ?auto_334961 ?auto_334962 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_334967 - BLOCK
      ?auto_334968 - BLOCK
      ?auto_334969 - BLOCK
    )
    :vars
    (
      ?auto_334970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334969 ?auto_334970 ) ( not ( = ?auto_334967 ?auto_334968 ) ) ( not ( = ?auto_334967 ?auto_334969 ) ) ( not ( = ?auto_334967 ?auto_334970 ) ) ( not ( = ?auto_334968 ?auto_334969 ) ) ( not ( = ?auto_334968 ?auto_334970 ) ) ( not ( = ?auto_334969 ?auto_334970 ) ) ( ON ?auto_334968 ?auto_334969 ) ( ON ?auto_334967 ?auto_334968 ) ( CLEAR ?auto_334967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_334967 )
      ( MAKE-3PILE ?auto_334967 ?auto_334968 ?auto_334969 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_334974 - BLOCK
      ?auto_334975 - BLOCK
      ?auto_334976 - BLOCK
    )
    :vars
    (
      ?auto_334977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_334976 ?auto_334977 ) ( not ( = ?auto_334974 ?auto_334975 ) ) ( not ( = ?auto_334974 ?auto_334976 ) ) ( not ( = ?auto_334974 ?auto_334977 ) ) ( not ( = ?auto_334975 ?auto_334976 ) ) ( not ( = ?auto_334975 ?auto_334977 ) ) ( not ( = ?auto_334976 ?auto_334977 ) ) ( ON ?auto_334975 ?auto_334976 ) ( ON ?auto_334974 ?auto_334975 ) ( CLEAR ?auto_334974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_334974 )
      ( MAKE-3PILE ?auto_334974 ?auto_334975 ?auto_334976 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_334982 - BLOCK
      ?auto_334983 - BLOCK
      ?auto_334984 - BLOCK
      ?auto_334985 - BLOCK
    )
    :vars
    (
      ?auto_334986 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_334984 ) ( ON ?auto_334985 ?auto_334986 ) ( CLEAR ?auto_334985 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_334982 ) ( ON ?auto_334983 ?auto_334982 ) ( ON ?auto_334984 ?auto_334983 ) ( not ( = ?auto_334982 ?auto_334983 ) ) ( not ( = ?auto_334982 ?auto_334984 ) ) ( not ( = ?auto_334982 ?auto_334985 ) ) ( not ( = ?auto_334982 ?auto_334986 ) ) ( not ( = ?auto_334983 ?auto_334984 ) ) ( not ( = ?auto_334983 ?auto_334985 ) ) ( not ( = ?auto_334983 ?auto_334986 ) ) ( not ( = ?auto_334984 ?auto_334985 ) ) ( not ( = ?auto_334984 ?auto_334986 ) ) ( not ( = ?auto_334985 ?auto_334986 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_334985 ?auto_334986 )
      ( !STACK ?auto_334985 ?auto_334984 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_334991 - BLOCK
      ?auto_334992 - BLOCK
      ?auto_334993 - BLOCK
      ?auto_334994 - BLOCK
    )
    :vars
    (
      ?auto_334995 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_334993 ) ( ON ?auto_334994 ?auto_334995 ) ( CLEAR ?auto_334994 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_334991 ) ( ON ?auto_334992 ?auto_334991 ) ( ON ?auto_334993 ?auto_334992 ) ( not ( = ?auto_334991 ?auto_334992 ) ) ( not ( = ?auto_334991 ?auto_334993 ) ) ( not ( = ?auto_334991 ?auto_334994 ) ) ( not ( = ?auto_334991 ?auto_334995 ) ) ( not ( = ?auto_334992 ?auto_334993 ) ) ( not ( = ?auto_334992 ?auto_334994 ) ) ( not ( = ?auto_334992 ?auto_334995 ) ) ( not ( = ?auto_334993 ?auto_334994 ) ) ( not ( = ?auto_334993 ?auto_334995 ) ) ( not ( = ?auto_334994 ?auto_334995 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_334994 ?auto_334995 )
      ( !STACK ?auto_334994 ?auto_334993 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_335000 - BLOCK
      ?auto_335001 - BLOCK
      ?auto_335002 - BLOCK
      ?auto_335003 - BLOCK
    )
    :vars
    (
      ?auto_335004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335003 ?auto_335004 ) ( ON-TABLE ?auto_335000 ) ( ON ?auto_335001 ?auto_335000 ) ( not ( = ?auto_335000 ?auto_335001 ) ) ( not ( = ?auto_335000 ?auto_335002 ) ) ( not ( = ?auto_335000 ?auto_335003 ) ) ( not ( = ?auto_335000 ?auto_335004 ) ) ( not ( = ?auto_335001 ?auto_335002 ) ) ( not ( = ?auto_335001 ?auto_335003 ) ) ( not ( = ?auto_335001 ?auto_335004 ) ) ( not ( = ?auto_335002 ?auto_335003 ) ) ( not ( = ?auto_335002 ?auto_335004 ) ) ( not ( = ?auto_335003 ?auto_335004 ) ) ( CLEAR ?auto_335001 ) ( ON ?auto_335002 ?auto_335003 ) ( CLEAR ?auto_335002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_335000 ?auto_335001 ?auto_335002 )
      ( MAKE-4PILE ?auto_335000 ?auto_335001 ?auto_335002 ?auto_335003 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_335009 - BLOCK
      ?auto_335010 - BLOCK
      ?auto_335011 - BLOCK
      ?auto_335012 - BLOCK
    )
    :vars
    (
      ?auto_335013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335012 ?auto_335013 ) ( ON-TABLE ?auto_335009 ) ( ON ?auto_335010 ?auto_335009 ) ( not ( = ?auto_335009 ?auto_335010 ) ) ( not ( = ?auto_335009 ?auto_335011 ) ) ( not ( = ?auto_335009 ?auto_335012 ) ) ( not ( = ?auto_335009 ?auto_335013 ) ) ( not ( = ?auto_335010 ?auto_335011 ) ) ( not ( = ?auto_335010 ?auto_335012 ) ) ( not ( = ?auto_335010 ?auto_335013 ) ) ( not ( = ?auto_335011 ?auto_335012 ) ) ( not ( = ?auto_335011 ?auto_335013 ) ) ( not ( = ?auto_335012 ?auto_335013 ) ) ( CLEAR ?auto_335010 ) ( ON ?auto_335011 ?auto_335012 ) ( CLEAR ?auto_335011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_335009 ?auto_335010 ?auto_335011 )
      ( MAKE-4PILE ?auto_335009 ?auto_335010 ?auto_335011 ?auto_335012 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_335018 - BLOCK
      ?auto_335019 - BLOCK
      ?auto_335020 - BLOCK
      ?auto_335021 - BLOCK
    )
    :vars
    (
      ?auto_335022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335021 ?auto_335022 ) ( ON-TABLE ?auto_335018 ) ( not ( = ?auto_335018 ?auto_335019 ) ) ( not ( = ?auto_335018 ?auto_335020 ) ) ( not ( = ?auto_335018 ?auto_335021 ) ) ( not ( = ?auto_335018 ?auto_335022 ) ) ( not ( = ?auto_335019 ?auto_335020 ) ) ( not ( = ?auto_335019 ?auto_335021 ) ) ( not ( = ?auto_335019 ?auto_335022 ) ) ( not ( = ?auto_335020 ?auto_335021 ) ) ( not ( = ?auto_335020 ?auto_335022 ) ) ( not ( = ?auto_335021 ?auto_335022 ) ) ( ON ?auto_335020 ?auto_335021 ) ( CLEAR ?auto_335018 ) ( ON ?auto_335019 ?auto_335020 ) ( CLEAR ?auto_335019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_335018 ?auto_335019 )
      ( MAKE-4PILE ?auto_335018 ?auto_335019 ?auto_335020 ?auto_335021 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_335027 - BLOCK
      ?auto_335028 - BLOCK
      ?auto_335029 - BLOCK
      ?auto_335030 - BLOCK
    )
    :vars
    (
      ?auto_335031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335030 ?auto_335031 ) ( ON-TABLE ?auto_335027 ) ( not ( = ?auto_335027 ?auto_335028 ) ) ( not ( = ?auto_335027 ?auto_335029 ) ) ( not ( = ?auto_335027 ?auto_335030 ) ) ( not ( = ?auto_335027 ?auto_335031 ) ) ( not ( = ?auto_335028 ?auto_335029 ) ) ( not ( = ?auto_335028 ?auto_335030 ) ) ( not ( = ?auto_335028 ?auto_335031 ) ) ( not ( = ?auto_335029 ?auto_335030 ) ) ( not ( = ?auto_335029 ?auto_335031 ) ) ( not ( = ?auto_335030 ?auto_335031 ) ) ( ON ?auto_335029 ?auto_335030 ) ( CLEAR ?auto_335027 ) ( ON ?auto_335028 ?auto_335029 ) ( CLEAR ?auto_335028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_335027 ?auto_335028 )
      ( MAKE-4PILE ?auto_335027 ?auto_335028 ?auto_335029 ?auto_335030 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_335036 - BLOCK
      ?auto_335037 - BLOCK
      ?auto_335038 - BLOCK
      ?auto_335039 - BLOCK
    )
    :vars
    (
      ?auto_335040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335039 ?auto_335040 ) ( not ( = ?auto_335036 ?auto_335037 ) ) ( not ( = ?auto_335036 ?auto_335038 ) ) ( not ( = ?auto_335036 ?auto_335039 ) ) ( not ( = ?auto_335036 ?auto_335040 ) ) ( not ( = ?auto_335037 ?auto_335038 ) ) ( not ( = ?auto_335037 ?auto_335039 ) ) ( not ( = ?auto_335037 ?auto_335040 ) ) ( not ( = ?auto_335038 ?auto_335039 ) ) ( not ( = ?auto_335038 ?auto_335040 ) ) ( not ( = ?auto_335039 ?auto_335040 ) ) ( ON ?auto_335038 ?auto_335039 ) ( ON ?auto_335037 ?auto_335038 ) ( ON ?auto_335036 ?auto_335037 ) ( CLEAR ?auto_335036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_335036 )
      ( MAKE-4PILE ?auto_335036 ?auto_335037 ?auto_335038 ?auto_335039 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_335045 - BLOCK
      ?auto_335046 - BLOCK
      ?auto_335047 - BLOCK
      ?auto_335048 - BLOCK
    )
    :vars
    (
      ?auto_335049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335048 ?auto_335049 ) ( not ( = ?auto_335045 ?auto_335046 ) ) ( not ( = ?auto_335045 ?auto_335047 ) ) ( not ( = ?auto_335045 ?auto_335048 ) ) ( not ( = ?auto_335045 ?auto_335049 ) ) ( not ( = ?auto_335046 ?auto_335047 ) ) ( not ( = ?auto_335046 ?auto_335048 ) ) ( not ( = ?auto_335046 ?auto_335049 ) ) ( not ( = ?auto_335047 ?auto_335048 ) ) ( not ( = ?auto_335047 ?auto_335049 ) ) ( not ( = ?auto_335048 ?auto_335049 ) ) ( ON ?auto_335047 ?auto_335048 ) ( ON ?auto_335046 ?auto_335047 ) ( ON ?auto_335045 ?auto_335046 ) ( CLEAR ?auto_335045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_335045 )
      ( MAKE-4PILE ?auto_335045 ?auto_335046 ?auto_335047 ?auto_335048 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_335055 - BLOCK
      ?auto_335056 - BLOCK
      ?auto_335057 - BLOCK
      ?auto_335058 - BLOCK
      ?auto_335059 - BLOCK
    )
    :vars
    (
      ?auto_335060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_335058 ) ( ON ?auto_335059 ?auto_335060 ) ( CLEAR ?auto_335059 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_335055 ) ( ON ?auto_335056 ?auto_335055 ) ( ON ?auto_335057 ?auto_335056 ) ( ON ?auto_335058 ?auto_335057 ) ( not ( = ?auto_335055 ?auto_335056 ) ) ( not ( = ?auto_335055 ?auto_335057 ) ) ( not ( = ?auto_335055 ?auto_335058 ) ) ( not ( = ?auto_335055 ?auto_335059 ) ) ( not ( = ?auto_335055 ?auto_335060 ) ) ( not ( = ?auto_335056 ?auto_335057 ) ) ( not ( = ?auto_335056 ?auto_335058 ) ) ( not ( = ?auto_335056 ?auto_335059 ) ) ( not ( = ?auto_335056 ?auto_335060 ) ) ( not ( = ?auto_335057 ?auto_335058 ) ) ( not ( = ?auto_335057 ?auto_335059 ) ) ( not ( = ?auto_335057 ?auto_335060 ) ) ( not ( = ?auto_335058 ?auto_335059 ) ) ( not ( = ?auto_335058 ?auto_335060 ) ) ( not ( = ?auto_335059 ?auto_335060 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_335059 ?auto_335060 )
      ( !STACK ?auto_335059 ?auto_335058 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_335066 - BLOCK
      ?auto_335067 - BLOCK
      ?auto_335068 - BLOCK
      ?auto_335069 - BLOCK
      ?auto_335070 - BLOCK
    )
    :vars
    (
      ?auto_335071 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_335069 ) ( ON ?auto_335070 ?auto_335071 ) ( CLEAR ?auto_335070 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_335066 ) ( ON ?auto_335067 ?auto_335066 ) ( ON ?auto_335068 ?auto_335067 ) ( ON ?auto_335069 ?auto_335068 ) ( not ( = ?auto_335066 ?auto_335067 ) ) ( not ( = ?auto_335066 ?auto_335068 ) ) ( not ( = ?auto_335066 ?auto_335069 ) ) ( not ( = ?auto_335066 ?auto_335070 ) ) ( not ( = ?auto_335066 ?auto_335071 ) ) ( not ( = ?auto_335067 ?auto_335068 ) ) ( not ( = ?auto_335067 ?auto_335069 ) ) ( not ( = ?auto_335067 ?auto_335070 ) ) ( not ( = ?auto_335067 ?auto_335071 ) ) ( not ( = ?auto_335068 ?auto_335069 ) ) ( not ( = ?auto_335068 ?auto_335070 ) ) ( not ( = ?auto_335068 ?auto_335071 ) ) ( not ( = ?auto_335069 ?auto_335070 ) ) ( not ( = ?auto_335069 ?auto_335071 ) ) ( not ( = ?auto_335070 ?auto_335071 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_335070 ?auto_335071 )
      ( !STACK ?auto_335070 ?auto_335069 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_335077 - BLOCK
      ?auto_335078 - BLOCK
      ?auto_335079 - BLOCK
      ?auto_335080 - BLOCK
      ?auto_335081 - BLOCK
    )
    :vars
    (
      ?auto_335082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335081 ?auto_335082 ) ( ON-TABLE ?auto_335077 ) ( ON ?auto_335078 ?auto_335077 ) ( ON ?auto_335079 ?auto_335078 ) ( not ( = ?auto_335077 ?auto_335078 ) ) ( not ( = ?auto_335077 ?auto_335079 ) ) ( not ( = ?auto_335077 ?auto_335080 ) ) ( not ( = ?auto_335077 ?auto_335081 ) ) ( not ( = ?auto_335077 ?auto_335082 ) ) ( not ( = ?auto_335078 ?auto_335079 ) ) ( not ( = ?auto_335078 ?auto_335080 ) ) ( not ( = ?auto_335078 ?auto_335081 ) ) ( not ( = ?auto_335078 ?auto_335082 ) ) ( not ( = ?auto_335079 ?auto_335080 ) ) ( not ( = ?auto_335079 ?auto_335081 ) ) ( not ( = ?auto_335079 ?auto_335082 ) ) ( not ( = ?auto_335080 ?auto_335081 ) ) ( not ( = ?auto_335080 ?auto_335082 ) ) ( not ( = ?auto_335081 ?auto_335082 ) ) ( CLEAR ?auto_335079 ) ( ON ?auto_335080 ?auto_335081 ) ( CLEAR ?auto_335080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_335077 ?auto_335078 ?auto_335079 ?auto_335080 )
      ( MAKE-5PILE ?auto_335077 ?auto_335078 ?auto_335079 ?auto_335080 ?auto_335081 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_335088 - BLOCK
      ?auto_335089 - BLOCK
      ?auto_335090 - BLOCK
      ?auto_335091 - BLOCK
      ?auto_335092 - BLOCK
    )
    :vars
    (
      ?auto_335093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335092 ?auto_335093 ) ( ON-TABLE ?auto_335088 ) ( ON ?auto_335089 ?auto_335088 ) ( ON ?auto_335090 ?auto_335089 ) ( not ( = ?auto_335088 ?auto_335089 ) ) ( not ( = ?auto_335088 ?auto_335090 ) ) ( not ( = ?auto_335088 ?auto_335091 ) ) ( not ( = ?auto_335088 ?auto_335092 ) ) ( not ( = ?auto_335088 ?auto_335093 ) ) ( not ( = ?auto_335089 ?auto_335090 ) ) ( not ( = ?auto_335089 ?auto_335091 ) ) ( not ( = ?auto_335089 ?auto_335092 ) ) ( not ( = ?auto_335089 ?auto_335093 ) ) ( not ( = ?auto_335090 ?auto_335091 ) ) ( not ( = ?auto_335090 ?auto_335092 ) ) ( not ( = ?auto_335090 ?auto_335093 ) ) ( not ( = ?auto_335091 ?auto_335092 ) ) ( not ( = ?auto_335091 ?auto_335093 ) ) ( not ( = ?auto_335092 ?auto_335093 ) ) ( CLEAR ?auto_335090 ) ( ON ?auto_335091 ?auto_335092 ) ( CLEAR ?auto_335091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_335088 ?auto_335089 ?auto_335090 ?auto_335091 )
      ( MAKE-5PILE ?auto_335088 ?auto_335089 ?auto_335090 ?auto_335091 ?auto_335092 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_335099 - BLOCK
      ?auto_335100 - BLOCK
      ?auto_335101 - BLOCK
      ?auto_335102 - BLOCK
      ?auto_335103 - BLOCK
    )
    :vars
    (
      ?auto_335104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335103 ?auto_335104 ) ( ON-TABLE ?auto_335099 ) ( ON ?auto_335100 ?auto_335099 ) ( not ( = ?auto_335099 ?auto_335100 ) ) ( not ( = ?auto_335099 ?auto_335101 ) ) ( not ( = ?auto_335099 ?auto_335102 ) ) ( not ( = ?auto_335099 ?auto_335103 ) ) ( not ( = ?auto_335099 ?auto_335104 ) ) ( not ( = ?auto_335100 ?auto_335101 ) ) ( not ( = ?auto_335100 ?auto_335102 ) ) ( not ( = ?auto_335100 ?auto_335103 ) ) ( not ( = ?auto_335100 ?auto_335104 ) ) ( not ( = ?auto_335101 ?auto_335102 ) ) ( not ( = ?auto_335101 ?auto_335103 ) ) ( not ( = ?auto_335101 ?auto_335104 ) ) ( not ( = ?auto_335102 ?auto_335103 ) ) ( not ( = ?auto_335102 ?auto_335104 ) ) ( not ( = ?auto_335103 ?auto_335104 ) ) ( ON ?auto_335102 ?auto_335103 ) ( CLEAR ?auto_335100 ) ( ON ?auto_335101 ?auto_335102 ) ( CLEAR ?auto_335101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_335099 ?auto_335100 ?auto_335101 )
      ( MAKE-5PILE ?auto_335099 ?auto_335100 ?auto_335101 ?auto_335102 ?auto_335103 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_335110 - BLOCK
      ?auto_335111 - BLOCK
      ?auto_335112 - BLOCK
      ?auto_335113 - BLOCK
      ?auto_335114 - BLOCK
    )
    :vars
    (
      ?auto_335115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335114 ?auto_335115 ) ( ON-TABLE ?auto_335110 ) ( ON ?auto_335111 ?auto_335110 ) ( not ( = ?auto_335110 ?auto_335111 ) ) ( not ( = ?auto_335110 ?auto_335112 ) ) ( not ( = ?auto_335110 ?auto_335113 ) ) ( not ( = ?auto_335110 ?auto_335114 ) ) ( not ( = ?auto_335110 ?auto_335115 ) ) ( not ( = ?auto_335111 ?auto_335112 ) ) ( not ( = ?auto_335111 ?auto_335113 ) ) ( not ( = ?auto_335111 ?auto_335114 ) ) ( not ( = ?auto_335111 ?auto_335115 ) ) ( not ( = ?auto_335112 ?auto_335113 ) ) ( not ( = ?auto_335112 ?auto_335114 ) ) ( not ( = ?auto_335112 ?auto_335115 ) ) ( not ( = ?auto_335113 ?auto_335114 ) ) ( not ( = ?auto_335113 ?auto_335115 ) ) ( not ( = ?auto_335114 ?auto_335115 ) ) ( ON ?auto_335113 ?auto_335114 ) ( CLEAR ?auto_335111 ) ( ON ?auto_335112 ?auto_335113 ) ( CLEAR ?auto_335112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_335110 ?auto_335111 ?auto_335112 )
      ( MAKE-5PILE ?auto_335110 ?auto_335111 ?auto_335112 ?auto_335113 ?auto_335114 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_335121 - BLOCK
      ?auto_335122 - BLOCK
      ?auto_335123 - BLOCK
      ?auto_335124 - BLOCK
      ?auto_335125 - BLOCK
    )
    :vars
    (
      ?auto_335126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335125 ?auto_335126 ) ( ON-TABLE ?auto_335121 ) ( not ( = ?auto_335121 ?auto_335122 ) ) ( not ( = ?auto_335121 ?auto_335123 ) ) ( not ( = ?auto_335121 ?auto_335124 ) ) ( not ( = ?auto_335121 ?auto_335125 ) ) ( not ( = ?auto_335121 ?auto_335126 ) ) ( not ( = ?auto_335122 ?auto_335123 ) ) ( not ( = ?auto_335122 ?auto_335124 ) ) ( not ( = ?auto_335122 ?auto_335125 ) ) ( not ( = ?auto_335122 ?auto_335126 ) ) ( not ( = ?auto_335123 ?auto_335124 ) ) ( not ( = ?auto_335123 ?auto_335125 ) ) ( not ( = ?auto_335123 ?auto_335126 ) ) ( not ( = ?auto_335124 ?auto_335125 ) ) ( not ( = ?auto_335124 ?auto_335126 ) ) ( not ( = ?auto_335125 ?auto_335126 ) ) ( ON ?auto_335124 ?auto_335125 ) ( ON ?auto_335123 ?auto_335124 ) ( CLEAR ?auto_335121 ) ( ON ?auto_335122 ?auto_335123 ) ( CLEAR ?auto_335122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_335121 ?auto_335122 )
      ( MAKE-5PILE ?auto_335121 ?auto_335122 ?auto_335123 ?auto_335124 ?auto_335125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_335132 - BLOCK
      ?auto_335133 - BLOCK
      ?auto_335134 - BLOCK
      ?auto_335135 - BLOCK
      ?auto_335136 - BLOCK
    )
    :vars
    (
      ?auto_335137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335136 ?auto_335137 ) ( ON-TABLE ?auto_335132 ) ( not ( = ?auto_335132 ?auto_335133 ) ) ( not ( = ?auto_335132 ?auto_335134 ) ) ( not ( = ?auto_335132 ?auto_335135 ) ) ( not ( = ?auto_335132 ?auto_335136 ) ) ( not ( = ?auto_335132 ?auto_335137 ) ) ( not ( = ?auto_335133 ?auto_335134 ) ) ( not ( = ?auto_335133 ?auto_335135 ) ) ( not ( = ?auto_335133 ?auto_335136 ) ) ( not ( = ?auto_335133 ?auto_335137 ) ) ( not ( = ?auto_335134 ?auto_335135 ) ) ( not ( = ?auto_335134 ?auto_335136 ) ) ( not ( = ?auto_335134 ?auto_335137 ) ) ( not ( = ?auto_335135 ?auto_335136 ) ) ( not ( = ?auto_335135 ?auto_335137 ) ) ( not ( = ?auto_335136 ?auto_335137 ) ) ( ON ?auto_335135 ?auto_335136 ) ( ON ?auto_335134 ?auto_335135 ) ( CLEAR ?auto_335132 ) ( ON ?auto_335133 ?auto_335134 ) ( CLEAR ?auto_335133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_335132 ?auto_335133 )
      ( MAKE-5PILE ?auto_335132 ?auto_335133 ?auto_335134 ?auto_335135 ?auto_335136 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_335143 - BLOCK
      ?auto_335144 - BLOCK
      ?auto_335145 - BLOCK
      ?auto_335146 - BLOCK
      ?auto_335147 - BLOCK
    )
    :vars
    (
      ?auto_335148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335147 ?auto_335148 ) ( not ( = ?auto_335143 ?auto_335144 ) ) ( not ( = ?auto_335143 ?auto_335145 ) ) ( not ( = ?auto_335143 ?auto_335146 ) ) ( not ( = ?auto_335143 ?auto_335147 ) ) ( not ( = ?auto_335143 ?auto_335148 ) ) ( not ( = ?auto_335144 ?auto_335145 ) ) ( not ( = ?auto_335144 ?auto_335146 ) ) ( not ( = ?auto_335144 ?auto_335147 ) ) ( not ( = ?auto_335144 ?auto_335148 ) ) ( not ( = ?auto_335145 ?auto_335146 ) ) ( not ( = ?auto_335145 ?auto_335147 ) ) ( not ( = ?auto_335145 ?auto_335148 ) ) ( not ( = ?auto_335146 ?auto_335147 ) ) ( not ( = ?auto_335146 ?auto_335148 ) ) ( not ( = ?auto_335147 ?auto_335148 ) ) ( ON ?auto_335146 ?auto_335147 ) ( ON ?auto_335145 ?auto_335146 ) ( ON ?auto_335144 ?auto_335145 ) ( ON ?auto_335143 ?auto_335144 ) ( CLEAR ?auto_335143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_335143 )
      ( MAKE-5PILE ?auto_335143 ?auto_335144 ?auto_335145 ?auto_335146 ?auto_335147 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_335154 - BLOCK
      ?auto_335155 - BLOCK
      ?auto_335156 - BLOCK
      ?auto_335157 - BLOCK
      ?auto_335158 - BLOCK
    )
    :vars
    (
      ?auto_335159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335158 ?auto_335159 ) ( not ( = ?auto_335154 ?auto_335155 ) ) ( not ( = ?auto_335154 ?auto_335156 ) ) ( not ( = ?auto_335154 ?auto_335157 ) ) ( not ( = ?auto_335154 ?auto_335158 ) ) ( not ( = ?auto_335154 ?auto_335159 ) ) ( not ( = ?auto_335155 ?auto_335156 ) ) ( not ( = ?auto_335155 ?auto_335157 ) ) ( not ( = ?auto_335155 ?auto_335158 ) ) ( not ( = ?auto_335155 ?auto_335159 ) ) ( not ( = ?auto_335156 ?auto_335157 ) ) ( not ( = ?auto_335156 ?auto_335158 ) ) ( not ( = ?auto_335156 ?auto_335159 ) ) ( not ( = ?auto_335157 ?auto_335158 ) ) ( not ( = ?auto_335157 ?auto_335159 ) ) ( not ( = ?auto_335158 ?auto_335159 ) ) ( ON ?auto_335157 ?auto_335158 ) ( ON ?auto_335156 ?auto_335157 ) ( ON ?auto_335155 ?auto_335156 ) ( ON ?auto_335154 ?auto_335155 ) ( CLEAR ?auto_335154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_335154 )
      ( MAKE-5PILE ?auto_335154 ?auto_335155 ?auto_335156 ?auto_335157 ?auto_335158 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335166 - BLOCK
      ?auto_335167 - BLOCK
      ?auto_335168 - BLOCK
      ?auto_335169 - BLOCK
      ?auto_335170 - BLOCK
      ?auto_335171 - BLOCK
    )
    :vars
    (
      ?auto_335172 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_335170 ) ( ON ?auto_335171 ?auto_335172 ) ( CLEAR ?auto_335171 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_335166 ) ( ON ?auto_335167 ?auto_335166 ) ( ON ?auto_335168 ?auto_335167 ) ( ON ?auto_335169 ?auto_335168 ) ( ON ?auto_335170 ?auto_335169 ) ( not ( = ?auto_335166 ?auto_335167 ) ) ( not ( = ?auto_335166 ?auto_335168 ) ) ( not ( = ?auto_335166 ?auto_335169 ) ) ( not ( = ?auto_335166 ?auto_335170 ) ) ( not ( = ?auto_335166 ?auto_335171 ) ) ( not ( = ?auto_335166 ?auto_335172 ) ) ( not ( = ?auto_335167 ?auto_335168 ) ) ( not ( = ?auto_335167 ?auto_335169 ) ) ( not ( = ?auto_335167 ?auto_335170 ) ) ( not ( = ?auto_335167 ?auto_335171 ) ) ( not ( = ?auto_335167 ?auto_335172 ) ) ( not ( = ?auto_335168 ?auto_335169 ) ) ( not ( = ?auto_335168 ?auto_335170 ) ) ( not ( = ?auto_335168 ?auto_335171 ) ) ( not ( = ?auto_335168 ?auto_335172 ) ) ( not ( = ?auto_335169 ?auto_335170 ) ) ( not ( = ?auto_335169 ?auto_335171 ) ) ( not ( = ?auto_335169 ?auto_335172 ) ) ( not ( = ?auto_335170 ?auto_335171 ) ) ( not ( = ?auto_335170 ?auto_335172 ) ) ( not ( = ?auto_335171 ?auto_335172 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_335171 ?auto_335172 )
      ( !STACK ?auto_335171 ?auto_335170 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335179 - BLOCK
      ?auto_335180 - BLOCK
      ?auto_335181 - BLOCK
      ?auto_335182 - BLOCK
      ?auto_335183 - BLOCK
      ?auto_335184 - BLOCK
    )
    :vars
    (
      ?auto_335185 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_335183 ) ( ON ?auto_335184 ?auto_335185 ) ( CLEAR ?auto_335184 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_335179 ) ( ON ?auto_335180 ?auto_335179 ) ( ON ?auto_335181 ?auto_335180 ) ( ON ?auto_335182 ?auto_335181 ) ( ON ?auto_335183 ?auto_335182 ) ( not ( = ?auto_335179 ?auto_335180 ) ) ( not ( = ?auto_335179 ?auto_335181 ) ) ( not ( = ?auto_335179 ?auto_335182 ) ) ( not ( = ?auto_335179 ?auto_335183 ) ) ( not ( = ?auto_335179 ?auto_335184 ) ) ( not ( = ?auto_335179 ?auto_335185 ) ) ( not ( = ?auto_335180 ?auto_335181 ) ) ( not ( = ?auto_335180 ?auto_335182 ) ) ( not ( = ?auto_335180 ?auto_335183 ) ) ( not ( = ?auto_335180 ?auto_335184 ) ) ( not ( = ?auto_335180 ?auto_335185 ) ) ( not ( = ?auto_335181 ?auto_335182 ) ) ( not ( = ?auto_335181 ?auto_335183 ) ) ( not ( = ?auto_335181 ?auto_335184 ) ) ( not ( = ?auto_335181 ?auto_335185 ) ) ( not ( = ?auto_335182 ?auto_335183 ) ) ( not ( = ?auto_335182 ?auto_335184 ) ) ( not ( = ?auto_335182 ?auto_335185 ) ) ( not ( = ?auto_335183 ?auto_335184 ) ) ( not ( = ?auto_335183 ?auto_335185 ) ) ( not ( = ?auto_335184 ?auto_335185 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_335184 ?auto_335185 )
      ( !STACK ?auto_335184 ?auto_335183 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335192 - BLOCK
      ?auto_335193 - BLOCK
      ?auto_335194 - BLOCK
      ?auto_335195 - BLOCK
      ?auto_335196 - BLOCK
      ?auto_335197 - BLOCK
    )
    :vars
    (
      ?auto_335198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335197 ?auto_335198 ) ( ON-TABLE ?auto_335192 ) ( ON ?auto_335193 ?auto_335192 ) ( ON ?auto_335194 ?auto_335193 ) ( ON ?auto_335195 ?auto_335194 ) ( not ( = ?auto_335192 ?auto_335193 ) ) ( not ( = ?auto_335192 ?auto_335194 ) ) ( not ( = ?auto_335192 ?auto_335195 ) ) ( not ( = ?auto_335192 ?auto_335196 ) ) ( not ( = ?auto_335192 ?auto_335197 ) ) ( not ( = ?auto_335192 ?auto_335198 ) ) ( not ( = ?auto_335193 ?auto_335194 ) ) ( not ( = ?auto_335193 ?auto_335195 ) ) ( not ( = ?auto_335193 ?auto_335196 ) ) ( not ( = ?auto_335193 ?auto_335197 ) ) ( not ( = ?auto_335193 ?auto_335198 ) ) ( not ( = ?auto_335194 ?auto_335195 ) ) ( not ( = ?auto_335194 ?auto_335196 ) ) ( not ( = ?auto_335194 ?auto_335197 ) ) ( not ( = ?auto_335194 ?auto_335198 ) ) ( not ( = ?auto_335195 ?auto_335196 ) ) ( not ( = ?auto_335195 ?auto_335197 ) ) ( not ( = ?auto_335195 ?auto_335198 ) ) ( not ( = ?auto_335196 ?auto_335197 ) ) ( not ( = ?auto_335196 ?auto_335198 ) ) ( not ( = ?auto_335197 ?auto_335198 ) ) ( CLEAR ?auto_335195 ) ( ON ?auto_335196 ?auto_335197 ) ( CLEAR ?auto_335196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_335192 ?auto_335193 ?auto_335194 ?auto_335195 ?auto_335196 )
      ( MAKE-6PILE ?auto_335192 ?auto_335193 ?auto_335194 ?auto_335195 ?auto_335196 ?auto_335197 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335205 - BLOCK
      ?auto_335206 - BLOCK
      ?auto_335207 - BLOCK
      ?auto_335208 - BLOCK
      ?auto_335209 - BLOCK
      ?auto_335210 - BLOCK
    )
    :vars
    (
      ?auto_335211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335210 ?auto_335211 ) ( ON-TABLE ?auto_335205 ) ( ON ?auto_335206 ?auto_335205 ) ( ON ?auto_335207 ?auto_335206 ) ( ON ?auto_335208 ?auto_335207 ) ( not ( = ?auto_335205 ?auto_335206 ) ) ( not ( = ?auto_335205 ?auto_335207 ) ) ( not ( = ?auto_335205 ?auto_335208 ) ) ( not ( = ?auto_335205 ?auto_335209 ) ) ( not ( = ?auto_335205 ?auto_335210 ) ) ( not ( = ?auto_335205 ?auto_335211 ) ) ( not ( = ?auto_335206 ?auto_335207 ) ) ( not ( = ?auto_335206 ?auto_335208 ) ) ( not ( = ?auto_335206 ?auto_335209 ) ) ( not ( = ?auto_335206 ?auto_335210 ) ) ( not ( = ?auto_335206 ?auto_335211 ) ) ( not ( = ?auto_335207 ?auto_335208 ) ) ( not ( = ?auto_335207 ?auto_335209 ) ) ( not ( = ?auto_335207 ?auto_335210 ) ) ( not ( = ?auto_335207 ?auto_335211 ) ) ( not ( = ?auto_335208 ?auto_335209 ) ) ( not ( = ?auto_335208 ?auto_335210 ) ) ( not ( = ?auto_335208 ?auto_335211 ) ) ( not ( = ?auto_335209 ?auto_335210 ) ) ( not ( = ?auto_335209 ?auto_335211 ) ) ( not ( = ?auto_335210 ?auto_335211 ) ) ( CLEAR ?auto_335208 ) ( ON ?auto_335209 ?auto_335210 ) ( CLEAR ?auto_335209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_335205 ?auto_335206 ?auto_335207 ?auto_335208 ?auto_335209 )
      ( MAKE-6PILE ?auto_335205 ?auto_335206 ?auto_335207 ?auto_335208 ?auto_335209 ?auto_335210 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335218 - BLOCK
      ?auto_335219 - BLOCK
      ?auto_335220 - BLOCK
      ?auto_335221 - BLOCK
      ?auto_335222 - BLOCK
      ?auto_335223 - BLOCK
    )
    :vars
    (
      ?auto_335224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335223 ?auto_335224 ) ( ON-TABLE ?auto_335218 ) ( ON ?auto_335219 ?auto_335218 ) ( ON ?auto_335220 ?auto_335219 ) ( not ( = ?auto_335218 ?auto_335219 ) ) ( not ( = ?auto_335218 ?auto_335220 ) ) ( not ( = ?auto_335218 ?auto_335221 ) ) ( not ( = ?auto_335218 ?auto_335222 ) ) ( not ( = ?auto_335218 ?auto_335223 ) ) ( not ( = ?auto_335218 ?auto_335224 ) ) ( not ( = ?auto_335219 ?auto_335220 ) ) ( not ( = ?auto_335219 ?auto_335221 ) ) ( not ( = ?auto_335219 ?auto_335222 ) ) ( not ( = ?auto_335219 ?auto_335223 ) ) ( not ( = ?auto_335219 ?auto_335224 ) ) ( not ( = ?auto_335220 ?auto_335221 ) ) ( not ( = ?auto_335220 ?auto_335222 ) ) ( not ( = ?auto_335220 ?auto_335223 ) ) ( not ( = ?auto_335220 ?auto_335224 ) ) ( not ( = ?auto_335221 ?auto_335222 ) ) ( not ( = ?auto_335221 ?auto_335223 ) ) ( not ( = ?auto_335221 ?auto_335224 ) ) ( not ( = ?auto_335222 ?auto_335223 ) ) ( not ( = ?auto_335222 ?auto_335224 ) ) ( not ( = ?auto_335223 ?auto_335224 ) ) ( ON ?auto_335222 ?auto_335223 ) ( CLEAR ?auto_335220 ) ( ON ?auto_335221 ?auto_335222 ) ( CLEAR ?auto_335221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_335218 ?auto_335219 ?auto_335220 ?auto_335221 )
      ( MAKE-6PILE ?auto_335218 ?auto_335219 ?auto_335220 ?auto_335221 ?auto_335222 ?auto_335223 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335231 - BLOCK
      ?auto_335232 - BLOCK
      ?auto_335233 - BLOCK
      ?auto_335234 - BLOCK
      ?auto_335235 - BLOCK
      ?auto_335236 - BLOCK
    )
    :vars
    (
      ?auto_335237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335236 ?auto_335237 ) ( ON-TABLE ?auto_335231 ) ( ON ?auto_335232 ?auto_335231 ) ( ON ?auto_335233 ?auto_335232 ) ( not ( = ?auto_335231 ?auto_335232 ) ) ( not ( = ?auto_335231 ?auto_335233 ) ) ( not ( = ?auto_335231 ?auto_335234 ) ) ( not ( = ?auto_335231 ?auto_335235 ) ) ( not ( = ?auto_335231 ?auto_335236 ) ) ( not ( = ?auto_335231 ?auto_335237 ) ) ( not ( = ?auto_335232 ?auto_335233 ) ) ( not ( = ?auto_335232 ?auto_335234 ) ) ( not ( = ?auto_335232 ?auto_335235 ) ) ( not ( = ?auto_335232 ?auto_335236 ) ) ( not ( = ?auto_335232 ?auto_335237 ) ) ( not ( = ?auto_335233 ?auto_335234 ) ) ( not ( = ?auto_335233 ?auto_335235 ) ) ( not ( = ?auto_335233 ?auto_335236 ) ) ( not ( = ?auto_335233 ?auto_335237 ) ) ( not ( = ?auto_335234 ?auto_335235 ) ) ( not ( = ?auto_335234 ?auto_335236 ) ) ( not ( = ?auto_335234 ?auto_335237 ) ) ( not ( = ?auto_335235 ?auto_335236 ) ) ( not ( = ?auto_335235 ?auto_335237 ) ) ( not ( = ?auto_335236 ?auto_335237 ) ) ( ON ?auto_335235 ?auto_335236 ) ( CLEAR ?auto_335233 ) ( ON ?auto_335234 ?auto_335235 ) ( CLEAR ?auto_335234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_335231 ?auto_335232 ?auto_335233 ?auto_335234 )
      ( MAKE-6PILE ?auto_335231 ?auto_335232 ?auto_335233 ?auto_335234 ?auto_335235 ?auto_335236 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335244 - BLOCK
      ?auto_335245 - BLOCK
      ?auto_335246 - BLOCK
      ?auto_335247 - BLOCK
      ?auto_335248 - BLOCK
      ?auto_335249 - BLOCK
    )
    :vars
    (
      ?auto_335250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335249 ?auto_335250 ) ( ON-TABLE ?auto_335244 ) ( ON ?auto_335245 ?auto_335244 ) ( not ( = ?auto_335244 ?auto_335245 ) ) ( not ( = ?auto_335244 ?auto_335246 ) ) ( not ( = ?auto_335244 ?auto_335247 ) ) ( not ( = ?auto_335244 ?auto_335248 ) ) ( not ( = ?auto_335244 ?auto_335249 ) ) ( not ( = ?auto_335244 ?auto_335250 ) ) ( not ( = ?auto_335245 ?auto_335246 ) ) ( not ( = ?auto_335245 ?auto_335247 ) ) ( not ( = ?auto_335245 ?auto_335248 ) ) ( not ( = ?auto_335245 ?auto_335249 ) ) ( not ( = ?auto_335245 ?auto_335250 ) ) ( not ( = ?auto_335246 ?auto_335247 ) ) ( not ( = ?auto_335246 ?auto_335248 ) ) ( not ( = ?auto_335246 ?auto_335249 ) ) ( not ( = ?auto_335246 ?auto_335250 ) ) ( not ( = ?auto_335247 ?auto_335248 ) ) ( not ( = ?auto_335247 ?auto_335249 ) ) ( not ( = ?auto_335247 ?auto_335250 ) ) ( not ( = ?auto_335248 ?auto_335249 ) ) ( not ( = ?auto_335248 ?auto_335250 ) ) ( not ( = ?auto_335249 ?auto_335250 ) ) ( ON ?auto_335248 ?auto_335249 ) ( ON ?auto_335247 ?auto_335248 ) ( CLEAR ?auto_335245 ) ( ON ?auto_335246 ?auto_335247 ) ( CLEAR ?auto_335246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_335244 ?auto_335245 ?auto_335246 )
      ( MAKE-6PILE ?auto_335244 ?auto_335245 ?auto_335246 ?auto_335247 ?auto_335248 ?auto_335249 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335257 - BLOCK
      ?auto_335258 - BLOCK
      ?auto_335259 - BLOCK
      ?auto_335260 - BLOCK
      ?auto_335261 - BLOCK
      ?auto_335262 - BLOCK
    )
    :vars
    (
      ?auto_335263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335262 ?auto_335263 ) ( ON-TABLE ?auto_335257 ) ( ON ?auto_335258 ?auto_335257 ) ( not ( = ?auto_335257 ?auto_335258 ) ) ( not ( = ?auto_335257 ?auto_335259 ) ) ( not ( = ?auto_335257 ?auto_335260 ) ) ( not ( = ?auto_335257 ?auto_335261 ) ) ( not ( = ?auto_335257 ?auto_335262 ) ) ( not ( = ?auto_335257 ?auto_335263 ) ) ( not ( = ?auto_335258 ?auto_335259 ) ) ( not ( = ?auto_335258 ?auto_335260 ) ) ( not ( = ?auto_335258 ?auto_335261 ) ) ( not ( = ?auto_335258 ?auto_335262 ) ) ( not ( = ?auto_335258 ?auto_335263 ) ) ( not ( = ?auto_335259 ?auto_335260 ) ) ( not ( = ?auto_335259 ?auto_335261 ) ) ( not ( = ?auto_335259 ?auto_335262 ) ) ( not ( = ?auto_335259 ?auto_335263 ) ) ( not ( = ?auto_335260 ?auto_335261 ) ) ( not ( = ?auto_335260 ?auto_335262 ) ) ( not ( = ?auto_335260 ?auto_335263 ) ) ( not ( = ?auto_335261 ?auto_335262 ) ) ( not ( = ?auto_335261 ?auto_335263 ) ) ( not ( = ?auto_335262 ?auto_335263 ) ) ( ON ?auto_335261 ?auto_335262 ) ( ON ?auto_335260 ?auto_335261 ) ( CLEAR ?auto_335258 ) ( ON ?auto_335259 ?auto_335260 ) ( CLEAR ?auto_335259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_335257 ?auto_335258 ?auto_335259 )
      ( MAKE-6PILE ?auto_335257 ?auto_335258 ?auto_335259 ?auto_335260 ?auto_335261 ?auto_335262 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335270 - BLOCK
      ?auto_335271 - BLOCK
      ?auto_335272 - BLOCK
      ?auto_335273 - BLOCK
      ?auto_335274 - BLOCK
      ?auto_335275 - BLOCK
    )
    :vars
    (
      ?auto_335276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335275 ?auto_335276 ) ( ON-TABLE ?auto_335270 ) ( not ( = ?auto_335270 ?auto_335271 ) ) ( not ( = ?auto_335270 ?auto_335272 ) ) ( not ( = ?auto_335270 ?auto_335273 ) ) ( not ( = ?auto_335270 ?auto_335274 ) ) ( not ( = ?auto_335270 ?auto_335275 ) ) ( not ( = ?auto_335270 ?auto_335276 ) ) ( not ( = ?auto_335271 ?auto_335272 ) ) ( not ( = ?auto_335271 ?auto_335273 ) ) ( not ( = ?auto_335271 ?auto_335274 ) ) ( not ( = ?auto_335271 ?auto_335275 ) ) ( not ( = ?auto_335271 ?auto_335276 ) ) ( not ( = ?auto_335272 ?auto_335273 ) ) ( not ( = ?auto_335272 ?auto_335274 ) ) ( not ( = ?auto_335272 ?auto_335275 ) ) ( not ( = ?auto_335272 ?auto_335276 ) ) ( not ( = ?auto_335273 ?auto_335274 ) ) ( not ( = ?auto_335273 ?auto_335275 ) ) ( not ( = ?auto_335273 ?auto_335276 ) ) ( not ( = ?auto_335274 ?auto_335275 ) ) ( not ( = ?auto_335274 ?auto_335276 ) ) ( not ( = ?auto_335275 ?auto_335276 ) ) ( ON ?auto_335274 ?auto_335275 ) ( ON ?auto_335273 ?auto_335274 ) ( ON ?auto_335272 ?auto_335273 ) ( CLEAR ?auto_335270 ) ( ON ?auto_335271 ?auto_335272 ) ( CLEAR ?auto_335271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_335270 ?auto_335271 )
      ( MAKE-6PILE ?auto_335270 ?auto_335271 ?auto_335272 ?auto_335273 ?auto_335274 ?auto_335275 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335283 - BLOCK
      ?auto_335284 - BLOCK
      ?auto_335285 - BLOCK
      ?auto_335286 - BLOCK
      ?auto_335287 - BLOCK
      ?auto_335288 - BLOCK
    )
    :vars
    (
      ?auto_335289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335288 ?auto_335289 ) ( ON-TABLE ?auto_335283 ) ( not ( = ?auto_335283 ?auto_335284 ) ) ( not ( = ?auto_335283 ?auto_335285 ) ) ( not ( = ?auto_335283 ?auto_335286 ) ) ( not ( = ?auto_335283 ?auto_335287 ) ) ( not ( = ?auto_335283 ?auto_335288 ) ) ( not ( = ?auto_335283 ?auto_335289 ) ) ( not ( = ?auto_335284 ?auto_335285 ) ) ( not ( = ?auto_335284 ?auto_335286 ) ) ( not ( = ?auto_335284 ?auto_335287 ) ) ( not ( = ?auto_335284 ?auto_335288 ) ) ( not ( = ?auto_335284 ?auto_335289 ) ) ( not ( = ?auto_335285 ?auto_335286 ) ) ( not ( = ?auto_335285 ?auto_335287 ) ) ( not ( = ?auto_335285 ?auto_335288 ) ) ( not ( = ?auto_335285 ?auto_335289 ) ) ( not ( = ?auto_335286 ?auto_335287 ) ) ( not ( = ?auto_335286 ?auto_335288 ) ) ( not ( = ?auto_335286 ?auto_335289 ) ) ( not ( = ?auto_335287 ?auto_335288 ) ) ( not ( = ?auto_335287 ?auto_335289 ) ) ( not ( = ?auto_335288 ?auto_335289 ) ) ( ON ?auto_335287 ?auto_335288 ) ( ON ?auto_335286 ?auto_335287 ) ( ON ?auto_335285 ?auto_335286 ) ( CLEAR ?auto_335283 ) ( ON ?auto_335284 ?auto_335285 ) ( CLEAR ?auto_335284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_335283 ?auto_335284 )
      ( MAKE-6PILE ?auto_335283 ?auto_335284 ?auto_335285 ?auto_335286 ?auto_335287 ?auto_335288 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335296 - BLOCK
      ?auto_335297 - BLOCK
      ?auto_335298 - BLOCK
      ?auto_335299 - BLOCK
      ?auto_335300 - BLOCK
      ?auto_335301 - BLOCK
    )
    :vars
    (
      ?auto_335302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335301 ?auto_335302 ) ( not ( = ?auto_335296 ?auto_335297 ) ) ( not ( = ?auto_335296 ?auto_335298 ) ) ( not ( = ?auto_335296 ?auto_335299 ) ) ( not ( = ?auto_335296 ?auto_335300 ) ) ( not ( = ?auto_335296 ?auto_335301 ) ) ( not ( = ?auto_335296 ?auto_335302 ) ) ( not ( = ?auto_335297 ?auto_335298 ) ) ( not ( = ?auto_335297 ?auto_335299 ) ) ( not ( = ?auto_335297 ?auto_335300 ) ) ( not ( = ?auto_335297 ?auto_335301 ) ) ( not ( = ?auto_335297 ?auto_335302 ) ) ( not ( = ?auto_335298 ?auto_335299 ) ) ( not ( = ?auto_335298 ?auto_335300 ) ) ( not ( = ?auto_335298 ?auto_335301 ) ) ( not ( = ?auto_335298 ?auto_335302 ) ) ( not ( = ?auto_335299 ?auto_335300 ) ) ( not ( = ?auto_335299 ?auto_335301 ) ) ( not ( = ?auto_335299 ?auto_335302 ) ) ( not ( = ?auto_335300 ?auto_335301 ) ) ( not ( = ?auto_335300 ?auto_335302 ) ) ( not ( = ?auto_335301 ?auto_335302 ) ) ( ON ?auto_335300 ?auto_335301 ) ( ON ?auto_335299 ?auto_335300 ) ( ON ?auto_335298 ?auto_335299 ) ( ON ?auto_335297 ?auto_335298 ) ( ON ?auto_335296 ?auto_335297 ) ( CLEAR ?auto_335296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_335296 )
      ( MAKE-6PILE ?auto_335296 ?auto_335297 ?auto_335298 ?auto_335299 ?auto_335300 ?auto_335301 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_335309 - BLOCK
      ?auto_335310 - BLOCK
      ?auto_335311 - BLOCK
      ?auto_335312 - BLOCK
      ?auto_335313 - BLOCK
      ?auto_335314 - BLOCK
    )
    :vars
    (
      ?auto_335315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335314 ?auto_335315 ) ( not ( = ?auto_335309 ?auto_335310 ) ) ( not ( = ?auto_335309 ?auto_335311 ) ) ( not ( = ?auto_335309 ?auto_335312 ) ) ( not ( = ?auto_335309 ?auto_335313 ) ) ( not ( = ?auto_335309 ?auto_335314 ) ) ( not ( = ?auto_335309 ?auto_335315 ) ) ( not ( = ?auto_335310 ?auto_335311 ) ) ( not ( = ?auto_335310 ?auto_335312 ) ) ( not ( = ?auto_335310 ?auto_335313 ) ) ( not ( = ?auto_335310 ?auto_335314 ) ) ( not ( = ?auto_335310 ?auto_335315 ) ) ( not ( = ?auto_335311 ?auto_335312 ) ) ( not ( = ?auto_335311 ?auto_335313 ) ) ( not ( = ?auto_335311 ?auto_335314 ) ) ( not ( = ?auto_335311 ?auto_335315 ) ) ( not ( = ?auto_335312 ?auto_335313 ) ) ( not ( = ?auto_335312 ?auto_335314 ) ) ( not ( = ?auto_335312 ?auto_335315 ) ) ( not ( = ?auto_335313 ?auto_335314 ) ) ( not ( = ?auto_335313 ?auto_335315 ) ) ( not ( = ?auto_335314 ?auto_335315 ) ) ( ON ?auto_335313 ?auto_335314 ) ( ON ?auto_335312 ?auto_335313 ) ( ON ?auto_335311 ?auto_335312 ) ( ON ?auto_335310 ?auto_335311 ) ( ON ?auto_335309 ?auto_335310 ) ( CLEAR ?auto_335309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_335309 )
      ( MAKE-6PILE ?auto_335309 ?auto_335310 ?auto_335311 ?auto_335312 ?auto_335313 ?auto_335314 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335323 - BLOCK
      ?auto_335324 - BLOCK
      ?auto_335325 - BLOCK
      ?auto_335326 - BLOCK
      ?auto_335327 - BLOCK
      ?auto_335328 - BLOCK
      ?auto_335329 - BLOCK
    )
    :vars
    (
      ?auto_335330 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_335328 ) ( ON ?auto_335329 ?auto_335330 ) ( CLEAR ?auto_335329 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_335323 ) ( ON ?auto_335324 ?auto_335323 ) ( ON ?auto_335325 ?auto_335324 ) ( ON ?auto_335326 ?auto_335325 ) ( ON ?auto_335327 ?auto_335326 ) ( ON ?auto_335328 ?auto_335327 ) ( not ( = ?auto_335323 ?auto_335324 ) ) ( not ( = ?auto_335323 ?auto_335325 ) ) ( not ( = ?auto_335323 ?auto_335326 ) ) ( not ( = ?auto_335323 ?auto_335327 ) ) ( not ( = ?auto_335323 ?auto_335328 ) ) ( not ( = ?auto_335323 ?auto_335329 ) ) ( not ( = ?auto_335323 ?auto_335330 ) ) ( not ( = ?auto_335324 ?auto_335325 ) ) ( not ( = ?auto_335324 ?auto_335326 ) ) ( not ( = ?auto_335324 ?auto_335327 ) ) ( not ( = ?auto_335324 ?auto_335328 ) ) ( not ( = ?auto_335324 ?auto_335329 ) ) ( not ( = ?auto_335324 ?auto_335330 ) ) ( not ( = ?auto_335325 ?auto_335326 ) ) ( not ( = ?auto_335325 ?auto_335327 ) ) ( not ( = ?auto_335325 ?auto_335328 ) ) ( not ( = ?auto_335325 ?auto_335329 ) ) ( not ( = ?auto_335325 ?auto_335330 ) ) ( not ( = ?auto_335326 ?auto_335327 ) ) ( not ( = ?auto_335326 ?auto_335328 ) ) ( not ( = ?auto_335326 ?auto_335329 ) ) ( not ( = ?auto_335326 ?auto_335330 ) ) ( not ( = ?auto_335327 ?auto_335328 ) ) ( not ( = ?auto_335327 ?auto_335329 ) ) ( not ( = ?auto_335327 ?auto_335330 ) ) ( not ( = ?auto_335328 ?auto_335329 ) ) ( not ( = ?auto_335328 ?auto_335330 ) ) ( not ( = ?auto_335329 ?auto_335330 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_335329 ?auto_335330 )
      ( !STACK ?auto_335329 ?auto_335328 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335338 - BLOCK
      ?auto_335339 - BLOCK
      ?auto_335340 - BLOCK
      ?auto_335341 - BLOCK
      ?auto_335342 - BLOCK
      ?auto_335343 - BLOCK
      ?auto_335344 - BLOCK
    )
    :vars
    (
      ?auto_335345 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_335343 ) ( ON ?auto_335344 ?auto_335345 ) ( CLEAR ?auto_335344 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_335338 ) ( ON ?auto_335339 ?auto_335338 ) ( ON ?auto_335340 ?auto_335339 ) ( ON ?auto_335341 ?auto_335340 ) ( ON ?auto_335342 ?auto_335341 ) ( ON ?auto_335343 ?auto_335342 ) ( not ( = ?auto_335338 ?auto_335339 ) ) ( not ( = ?auto_335338 ?auto_335340 ) ) ( not ( = ?auto_335338 ?auto_335341 ) ) ( not ( = ?auto_335338 ?auto_335342 ) ) ( not ( = ?auto_335338 ?auto_335343 ) ) ( not ( = ?auto_335338 ?auto_335344 ) ) ( not ( = ?auto_335338 ?auto_335345 ) ) ( not ( = ?auto_335339 ?auto_335340 ) ) ( not ( = ?auto_335339 ?auto_335341 ) ) ( not ( = ?auto_335339 ?auto_335342 ) ) ( not ( = ?auto_335339 ?auto_335343 ) ) ( not ( = ?auto_335339 ?auto_335344 ) ) ( not ( = ?auto_335339 ?auto_335345 ) ) ( not ( = ?auto_335340 ?auto_335341 ) ) ( not ( = ?auto_335340 ?auto_335342 ) ) ( not ( = ?auto_335340 ?auto_335343 ) ) ( not ( = ?auto_335340 ?auto_335344 ) ) ( not ( = ?auto_335340 ?auto_335345 ) ) ( not ( = ?auto_335341 ?auto_335342 ) ) ( not ( = ?auto_335341 ?auto_335343 ) ) ( not ( = ?auto_335341 ?auto_335344 ) ) ( not ( = ?auto_335341 ?auto_335345 ) ) ( not ( = ?auto_335342 ?auto_335343 ) ) ( not ( = ?auto_335342 ?auto_335344 ) ) ( not ( = ?auto_335342 ?auto_335345 ) ) ( not ( = ?auto_335343 ?auto_335344 ) ) ( not ( = ?auto_335343 ?auto_335345 ) ) ( not ( = ?auto_335344 ?auto_335345 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_335344 ?auto_335345 )
      ( !STACK ?auto_335344 ?auto_335343 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335353 - BLOCK
      ?auto_335354 - BLOCK
      ?auto_335355 - BLOCK
      ?auto_335356 - BLOCK
      ?auto_335357 - BLOCK
      ?auto_335358 - BLOCK
      ?auto_335359 - BLOCK
    )
    :vars
    (
      ?auto_335360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335359 ?auto_335360 ) ( ON-TABLE ?auto_335353 ) ( ON ?auto_335354 ?auto_335353 ) ( ON ?auto_335355 ?auto_335354 ) ( ON ?auto_335356 ?auto_335355 ) ( ON ?auto_335357 ?auto_335356 ) ( not ( = ?auto_335353 ?auto_335354 ) ) ( not ( = ?auto_335353 ?auto_335355 ) ) ( not ( = ?auto_335353 ?auto_335356 ) ) ( not ( = ?auto_335353 ?auto_335357 ) ) ( not ( = ?auto_335353 ?auto_335358 ) ) ( not ( = ?auto_335353 ?auto_335359 ) ) ( not ( = ?auto_335353 ?auto_335360 ) ) ( not ( = ?auto_335354 ?auto_335355 ) ) ( not ( = ?auto_335354 ?auto_335356 ) ) ( not ( = ?auto_335354 ?auto_335357 ) ) ( not ( = ?auto_335354 ?auto_335358 ) ) ( not ( = ?auto_335354 ?auto_335359 ) ) ( not ( = ?auto_335354 ?auto_335360 ) ) ( not ( = ?auto_335355 ?auto_335356 ) ) ( not ( = ?auto_335355 ?auto_335357 ) ) ( not ( = ?auto_335355 ?auto_335358 ) ) ( not ( = ?auto_335355 ?auto_335359 ) ) ( not ( = ?auto_335355 ?auto_335360 ) ) ( not ( = ?auto_335356 ?auto_335357 ) ) ( not ( = ?auto_335356 ?auto_335358 ) ) ( not ( = ?auto_335356 ?auto_335359 ) ) ( not ( = ?auto_335356 ?auto_335360 ) ) ( not ( = ?auto_335357 ?auto_335358 ) ) ( not ( = ?auto_335357 ?auto_335359 ) ) ( not ( = ?auto_335357 ?auto_335360 ) ) ( not ( = ?auto_335358 ?auto_335359 ) ) ( not ( = ?auto_335358 ?auto_335360 ) ) ( not ( = ?auto_335359 ?auto_335360 ) ) ( CLEAR ?auto_335357 ) ( ON ?auto_335358 ?auto_335359 ) ( CLEAR ?auto_335358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_335353 ?auto_335354 ?auto_335355 ?auto_335356 ?auto_335357 ?auto_335358 )
      ( MAKE-7PILE ?auto_335353 ?auto_335354 ?auto_335355 ?auto_335356 ?auto_335357 ?auto_335358 ?auto_335359 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335368 - BLOCK
      ?auto_335369 - BLOCK
      ?auto_335370 - BLOCK
      ?auto_335371 - BLOCK
      ?auto_335372 - BLOCK
      ?auto_335373 - BLOCK
      ?auto_335374 - BLOCK
    )
    :vars
    (
      ?auto_335375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335374 ?auto_335375 ) ( ON-TABLE ?auto_335368 ) ( ON ?auto_335369 ?auto_335368 ) ( ON ?auto_335370 ?auto_335369 ) ( ON ?auto_335371 ?auto_335370 ) ( ON ?auto_335372 ?auto_335371 ) ( not ( = ?auto_335368 ?auto_335369 ) ) ( not ( = ?auto_335368 ?auto_335370 ) ) ( not ( = ?auto_335368 ?auto_335371 ) ) ( not ( = ?auto_335368 ?auto_335372 ) ) ( not ( = ?auto_335368 ?auto_335373 ) ) ( not ( = ?auto_335368 ?auto_335374 ) ) ( not ( = ?auto_335368 ?auto_335375 ) ) ( not ( = ?auto_335369 ?auto_335370 ) ) ( not ( = ?auto_335369 ?auto_335371 ) ) ( not ( = ?auto_335369 ?auto_335372 ) ) ( not ( = ?auto_335369 ?auto_335373 ) ) ( not ( = ?auto_335369 ?auto_335374 ) ) ( not ( = ?auto_335369 ?auto_335375 ) ) ( not ( = ?auto_335370 ?auto_335371 ) ) ( not ( = ?auto_335370 ?auto_335372 ) ) ( not ( = ?auto_335370 ?auto_335373 ) ) ( not ( = ?auto_335370 ?auto_335374 ) ) ( not ( = ?auto_335370 ?auto_335375 ) ) ( not ( = ?auto_335371 ?auto_335372 ) ) ( not ( = ?auto_335371 ?auto_335373 ) ) ( not ( = ?auto_335371 ?auto_335374 ) ) ( not ( = ?auto_335371 ?auto_335375 ) ) ( not ( = ?auto_335372 ?auto_335373 ) ) ( not ( = ?auto_335372 ?auto_335374 ) ) ( not ( = ?auto_335372 ?auto_335375 ) ) ( not ( = ?auto_335373 ?auto_335374 ) ) ( not ( = ?auto_335373 ?auto_335375 ) ) ( not ( = ?auto_335374 ?auto_335375 ) ) ( CLEAR ?auto_335372 ) ( ON ?auto_335373 ?auto_335374 ) ( CLEAR ?auto_335373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_335368 ?auto_335369 ?auto_335370 ?auto_335371 ?auto_335372 ?auto_335373 )
      ( MAKE-7PILE ?auto_335368 ?auto_335369 ?auto_335370 ?auto_335371 ?auto_335372 ?auto_335373 ?auto_335374 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335383 - BLOCK
      ?auto_335384 - BLOCK
      ?auto_335385 - BLOCK
      ?auto_335386 - BLOCK
      ?auto_335387 - BLOCK
      ?auto_335388 - BLOCK
      ?auto_335389 - BLOCK
    )
    :vars
    (
      ?auto_335390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335389 ?auto_335390 ) ( ON-TABLE ?auto_335383 ) ( ON ?auto_335384 ?auto_335383 ) ( ON ?auto_335385 ?auto_335384 ) ( ON ?auto_335386 ?auto_335385 ) ( not ( = ?auto_335383 ?auto_335384 ) ) ( not ( = ?auto_335383 ?auto_335385 ) ) ( not ( = ?auto_335383 ?auto_335386 ) ) ( not ( = ?auto_335383 ?auto_335387 ) ) ( not ( = ?auto_335383 ?auto_335388 ) ) ( not ( = ?auto_335383 ?auto_335389 ) ) ( not ( = ?auto_335383 ?auto_335390 ) ) ( not ( = ?auto_335384 ?auto_335385 ) ) ( not ( = ?auto_335384 ?auto_335386 ) ) ( not ( = ?auto_335384 ?auto_335387 ) ) ( not ( = ?auto_335384 ?auto_335388 ) ) ( not ( = ?auto_335384 ?auto_335389 ) ) ( not ( = ?auto_335384 ?auto_335390 ) ) ( not ( = ?auto_335385 ?auto_335386 ) ) ( not ( = ?auto_335385 ?auto_335387 ) ) ( not ( = ?auto_335385 ?auto_335388 ) ) ( not ( = ?auto_335385 ?auto_335389 ) ) ( not ( = ?auto_335385 ?auto_335390 ) ) ( not ( = ?auto_335386 ?auto_335387 ) ) ( not ( = ?auto_335386 ?auto_335388 ) ) ( not ( = ?auto_335386 ?auto_335389 ) ) ( not ( = ?auto_335386 ?auto_335390 ) ) ( not ( = ?auto_335387 ?auto_335388 ) ) ( not ( = ?auto_335387 ?auto_335389 ) ) ( not ( = ?auto_335387 ?auto_335390 ) ) ( not ( = ?auto_335388 ?auto_335389 ) ) ( not ( = ?auto_335388 ?auto_335390 ) ) ( not ( = ?auto_335389 ?auto_335390 ) ) ( ON ?auto_335388 ?auto_335389 ) ( CLEAR ?auto_335386 ) ( ON ?auto_335387 ?auto_335388 ) ( CLEAR ?auto_335387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_335383 ?auto_335384 ?auto_335385 ?auto_335386 ?auto_335387 )
      ( MAKE-7PILE ?auto_335383 ?auto_335384 ?auto_335385 ?auto_335386 ?auto_335387 ?auto_335388 ?auto_335389 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335398 - BLOCK
      ?auto_335399 - BLOCK
      ?auto_335400 - BLOCK
      ?auto_335401 - BLOCK
      ?auto_335402 - BLOCK
      ?auto_335403 - BLOCK
      ?auto_335404 - BLOCK
    )
    :vars
    (
      ?auto_335405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335404 ?auto_335405 ) ( ON-TABLE ?auto_335398 ) ( ON ?auto_335399 ?auto_335398 ) ( ON ?auto_335400 ?auto_335399 ) ( ON ?auto_335401 ?auto_335400 ) ( not ( = ?auto_335398 ?auto_335399 ) ) ( not ( = ?auto_335398 ?auto_335400 ) ) ( not ( = ?auto_335398 ?auto_335401 ) ) ( not ( = ?auto_335398 ?auto_335402 ) ) ( not ( = ?auto_335398 ?auto_335403 ) ) ( not ( = ?auto_335398 ?auto_335404 ) ) ( not ( = ?auto_335398 ?auto_335405 ) ) ( not ( = ?auto_335399 ?auto_335400 ) ) ( not ( = ?auto_335399 ?auto_335401 ) ) ( not ( = ?auto_335399 ?auto_335402 ) ) ( not ( = ?auto_335399 ?auto_335403 ) ) ( not ( = ?auto_335399 ?auto_335404 ) ) ( not ( = ?auto_335399 ?auto_335405 ) ) ( not ( = ?auto_335400 ?auto_335401 ) ) ( not ( = ?auto_335400 ?auto_335402 ) ) ( not ( = ?auto_335400 ?auto_335403 ) ) ( not ( = ?auto_335400 ?auto_335404 ) ) ( not ( = ?auto_335400 ?auto_335405 ) ) ( not ( = ?auto_335401 ?auto_335402 ) ) ( not ( = ?auto_335401 ?auto_335403 ) ) ( not ( = ?auto_335401 ?auto_335404 ) ) ( not ( = ?auto_335401 ?auto_335405 ) ) ( not ( = ?auto_335402 ?auto_335403 ) ) ( not ( = ?auto_335402 ?auto_335404 ) ) ( not ( = ?auto_335402 ?auto_335405 ) ) ( not ( = ?auto_335403 ?auto_335404 ) ) ( not ( = ?auto_335403 ?auto_335405 ) ) ( not ( = ?auto_335404 ?auto_335405 ) ) ( ON ?auto_335403 ?auto_335404 ) ( CLEAR ?auto_335401 ) ( ON ?auto_335402 ?auto_335403 ) ( CLEAR ?auto_335402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_335398 ?auto_335399 ?auto_335400 ?auto_335401 ?auto_335402 )
      ( MAKE-7PILE ?auto_335398 ?auto_335399 ?auto_335400 ?auto_335401 ?auto_335402 ?auto_335403 ?auto_335404 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335413 - BLOCK
      ?auto_335414 - BLOCK
      ?auto_335415 - BLOCK
      ?auto_335416 - BLOCK
      ?auto_335417 - BLOCK
      ?auto_335418 - BLOCK
      ?auto_335419 - BLOCK
    )
    :vars
    (
      ?auto_335420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335419 ?auto_335420 ) ( ON-TABLE ?auto_335413 ) ( ON ?auto_335414 ?auto_335413 ) ( ON ?auto_335415 ?auto_335414 ) ( not ( = ?auto_335413 ?auto_335414 ) ) ( not ( = ?auto_335413 ?auto_335415 ) ) ( not ( = ?auto_335413 ?auto_335416 ) ) ( not ( = ?auto_335413 ?auto_335417 ) ) ( not ( = ?auto_335413 ?auto_335418 ) ) ( not ( = ?auto_335413 ?auto_335419 ) ) ( not ( = ?auto_335413 ?auto_335420 ) ) ( not ( = ?auto_335414 ?auto_335415 ) ) ( not ( = ?auto_335414 ?auto_335416 ) ) ( not ( = ?auto_335414 ?auto_335417 ) ) ( not ( = ?auto_335414 ?auto_335418 ) ) ( not ( = ?auto_335414 ?auto_335419 ) ) ( not ( = ?auto_335414 ?auto_335420 ) ) ( not ( = ?auto_335415 ?auto_335416 ) ) ( not ( = ?auto_335415 ?auto_335417 ) ) ( not ( = ?auto_335415 ?auto_335418 ) ) ( not ( = ?auto_335415 ?auto_335419 ) ) ( not ( = ?auto_335415 ?auto_335420 ) ) ( not ( = ?auto_335416 ?auto_335417 ) ) ( not ( = ?auto_335416 ?auto_335418 ) ) ( not ( = ?auto_335416 ?auto_335419 ) ) ( not ( = ?auto_335416 ?auto_335420 ) ) ( not ( = ?auto_335417 ?auto_335418 ) ) ( not ( = ?auto_335417 ?auto_335419 ) ) ( not ( = ?auto_335417 ?auto_335420 ) ) ( not ( = ?auto_335418 ?auto_335419 ) ) ( not ( = ?auto_335418 ?auto_335420 ) ) ( not ( = ?auto_335419 ?auto_335420 ) ) ( ON ?auto_335418 ?auto_335419 ) ( ON ?auto_335417 ?auto_335418 ) ( CLEAR ?auto_335415 ) ( ON ?auto_335416 ?auto_335417 ) ( CLEAR ?auto_335416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_335413 ?auto_335414 ?auto_335415 ?auto_335416 )
      ( MAKE-7PILE ?auto_335413 ?auto_335414 ?auto_335415 ?auto_335416 ?auto_335417 ?auto_335418 ?auto_335419 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335428 - BLOCK
      ?auto_335429 - BLOCK
      ?auto_335430 - BLOCK
      ?auto_335431 - BLOCK
      ?auto_335432 - BLOCK
      ?auto_335433 - BLOCK
      ?auto_335434 - BLOCK
    )
    :vars
    (
      ?auto_335435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335434 ?auto_335435 ) ( ON-TABLE ?auto_335428 ) ( ON ?auto_335429 ?auto_335428 ) ( ON ?auto_335430 ?auto_335429 ) ( not ( = ?auto_335428 ?auto_335429 ) ) ( not ( = ?auto_335428 ?auto_335430 ) ) ( not ( = ?auto_335428 ?auto_335431 ) ) ( not ( = ?auto_335428 ?auto_335432 ) ) ( not ( = ?auto_335428 ?auto_335433 ) ) ( not ( = ?auto_335428 ?auto_335434 ) ) ( not ( = ?auto_335428 ?auto_335435 ) ) ( not ( = ?auto_335429 ?auto_335430 ) ) ( not ( = ?auto_335429 ?auto_335431 ) ) ( not ( = ?auto_335429 ?auto_335432 ) ) ( not ( = ?auto_335429 ?auto_335433 ) ) ( not ( = ?auto_335429 ?auto_335434 ) ) ( not ( = ?auto_335429 ?auto_335435 ) ) ( not ( = ?auto_335430 ?auto_335431 ) ) ( not ( = ?auto_335430 ?auto_335432 ) ) ( not ( = ?auto_335430 ?auto_335433 ) ) ( not ( = ?auto_335430 ?auto_335434 ) ) ( not ( = ?auto_335430 ?auto_335435 ) ) ( not ( = ?auto_335431 ?auto_335432 ) ) ( not ( = ?auto_335431 ?auto_335433 ) ) ( not ( = ?auto_335431 ?auto_335434 ) ) ( not ( = ?auto_335431 ?auto_335435 ) ) ( not ( = ?auto_335432 ?auto_335433 ) ) ( not ( = ?auto_335432 ?auto_335434 ) ) ( not ( = ?auto_335432 ?auto_335435 ) ) ( not ( = ?auto_335433 ?auto_335434 ) ) ( not ( = ?auto_335433 ?auto_335435 ) ) ( not ( = ?auto_335434 ?auto_335435 ) ) ( ON ?auto_335433 ?auto_335434 ) ( ON ?auto_335432 ?auto_335433 ) ( CLEAR ?auto_335430 ) ( ON ?auto_335431 ?auto_335432 ) ( CLEAR ?auto_335431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_335428 ?auto_335429 ?auto_335430 ?auto_335431 )
      ( MAKE-7PILE ?auto_335428 ?auto_335429 ?auto_335430 ?auto_335431 ?auto_335432 ?auto_335433 ?auto_335434 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335443 - BLOCK
      ?auto_335444 - BLOCK
      ?auto_335445 - BLOCK
      ?auto_335446 - BLOCK
      ?auto_335447 - BLOCK
      ?auto_335448 - BLOCK
      ?auto_335449 - BLOCK
    )
    :vars
    (
      ?auto_335450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335449 ?auto_335450 ) ( ON-TABLE ?auto_335443 ) ( ON ?auto_335444 ?auto_335443 ) ( not ( = ?auto_335443 ?auto_335444 ) ) ( not ( = ?auto_335443 ?auto_335445 ) ) ( not ( = ?auto_335443 ?auto_335446 ) ) ( not ( = ?auto_335443 ?auto_335447 ) ) ( not ( = ?auto_335443 ?auto_335448 ) ) ( not ( = ?auto_335443 ?auto_335449 ) ) ( not ( = ?auto_335443 ?auto_335450 ) ) ( not ( = ?auto_335444 ?auto_335445 ) ) ( not ( = ?auto_335444 ?auto_335446 ) ) ( not ( = ?auto_335444 ?auto_335447 ) ) ( not ( = ?auto_335444 ?auto_335448 ) ) ( not ( = ?auto_335444 ?auto_335449 ) ) ( not ( = ?auto_335444 ?auto_335450 ) ) ( not ( = ?auto_335445 ?auto_335446 ) ) ( not ( = ?auto_335445 ?auto_335447 ) ) ( not ( = ?auto_335445 ?auto_335448 ) ) ( not ( = ?auto_335445 ?auto_335449 ) ) ( not ( = ?auto_335445 ?auto_335450 ) ) ( not ( = ?auto_335446 ?auto_335447 ) ) ( not ( = ?auto_335446 ?auto_335448 ) ) ( not ( = ?auto_335446 ?auto_335449 ) ) ( not ( = ?auto_335446 ?auto_335450 ) ) ( not ( = ?auto_335447 ?auto_335448 ) ) ( not ( = ?auto_335447 ?auto_335449 ) ) ( not ( = ?auto_335447 ?auto_335450 ) ) ( not ( = ?auto_335448 ?auto_335449 ) ) ( not ( = ?auto_335448 ?auto_335450 ) ) ( not ( = ?auto_335449 ?auto_335450 ) ) ( ON ?auto_335448 ?auto_335449 ) ( ON ?auto_335447 ?auto_335448 ) ( ON ?auto_335446 ?auto_335447 ) ( CLEAR ?auto_335444 ) ( ON ?auto_335445 ?auto_335446 ) ( CLEAR ?auto_335445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_335443 ?auto_335444 ?auto_335445 )
      ( MAKE-7PILE ?auto_335443 ?auto_335444 ?auto_335445 ?auto_335446 ?auto_335447 ?auto_335448 ?auto_335449 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335458 - BLOCK
      ?auto_335459 - BLOCK
      ?auto_335460 - BLOCK
      ?auto_335461 - BLOCK
      ?auto_335462 - BLOCK
      ?auto_335463 - BLOCK
      ?auto_335464 - BLOCK
    )
    :vars
    (
      ?auto_335465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335464 ?auto_335465 ) ( ON-TABLE ?auto_335458 ) ( ON ?auto_335459 ?auto_335458 ) ( not ( = ?auto_335458 ?auto_335459 ) ) ( not ( = ?auto_335458 ?auto_335460 ) ) ( not ( = ?auto_335458 ?auto_335461 ) ) ( not ( = ?auto_335458 ?auto_335462 ) ) ( not ( = ?auto_335458 ?auto_335463 ) ) ( not ( = ?auto_335458 ?auto_335464 ) ) ( not ( = ?auto_335458 ?auto_335465 ) ) ( not ( = ?auto_335459 ?auto_335460 ) ) ( not ( = ?auto_335459 ?auto_335461 ) ) ( not ( = ?auto_335459 ?auto_335462 ) ) ( not ( = ?auto_335459 ?auto_335463 ) ) ( not ( = ?auto_335459 ?auto_335464 ) ) ( not ( = ?auto_335459 ?auto_335465 ) ) ( not ( = ?auto_335460 ?auto_335461 ) ) ( not ( = ?auto_335460 ?auto_335462 ) ) ( not ( = ?auto_335460 ?auto_335463 ) ) ( not ( = ?auto_335460 ?auto_335464 ) ) ( not ( = ?auto_335460 ?auto_335465 ) ) ( not ( = ?auto_335461 ?auto_335462 ) ) ( not ( = ?auto_335461 ?auto_335463 ) ) ( not ( = ?auto_335461 ?auto_335464 ) ) ( not ( = ?auto_335461 ?auto_335465 ) ) ( not ( = ?auto_335462 ?auto_335463 ) ) ( not ( = ?auto_335462 ?auto_335464 ) ) ( not ( = ?auto_335462 ?auto_335465 ) ) ( not ( = ?auto_335463 ?auto_335464 ) ) ( not ( = ?auto_335463 ?auto_335465 ) ) ( not ( = ?auto_335464 ?auto_335465 ) ) ( ON ?auto_335463 ?auto_335464 ) ( ON ?auto_335462 ?auto_335463 ) ( ON ?auto_335461 ?auto_335462 ) ( CLEAR ?auto_335459 ) ( ON ?auto_335460 ?auto_335461 ) ( CLEAR ?auto_335460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_335458 ?auto_335459 ?auto_335460 )
      ( MAKE-7PILE ?auto_335458 ?auto_335459 ?auto_335460 ?auto_335461 ?auto_335462 ?auto_335463 ?auto_335464 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335473 - BLOCK
      ?auto_335474 - BLOCK
      ?auto_335475 - BLOCK
      ?auto_335476 - BLOCK
      ?auto_335477 - BLOCK
      ?auto_335478 - BLOCK
      ?auto_335479 - BLOCK
    )
    :vars
    (
      ?auto_335480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335479 ?auto_335480 ) ( ON-TABLE ?auto_335473 ) ( not ( = ?auto_335473 ?auto_335474 ) ) ( not ( = ?auto_335473 ?auto_335475 ) ) ( not ( = ?auto_335473 ?auto_335476 ) ) ( not ( = ?auto_335473 ?auto_335477 ) ) ( not ( = ?auto_335473 ?auto_335478 ) ) ( not ( = ?auto_335473 ?auto_335479 ) ) ( not ( = ?auto_335473 ?auto_335480 ) ) ( not ( = ?auto_335474 ?auto_335475 ) ) ( not ( = ?auto_335474 ?auto_335476 ) ) ( not ( = ?auto_335474 ?auto_335477 ) ) ( not ( = ?auto_335474 ?auto_335478 ) ) ( not ( = ?auto_335474 ?auto_335479 ) ) ( not ( = ?auto_335474 ?auto_335480 ) ) ( not ( = ?auto_335475 ?auto_335476 ) ) ( not ( = ?auto_335475 ?auto_335477 ) ) ( not ( = ?auto_335475 ?auto_335478 ) ) ( not ( = ?auto_335475 ?auto_335479 ) ) ( not ( = ?auto_335475 ?auto_335480 ) ) ( not ( = ?auto_335476 ?auto_335477 ) ) ( not ( = ?auto_335476 ?auto_335478 ) ) ( not ( = ?auto_335476 ?auto_335479 ) ) ( not ( = ?auto_335476 ?auto_335480 ) ) ( not ( = ?auto_335477 ?auto_335478 ) ) ( not ( = ?auto_335477 ?auto_335479 ) ) ( not ( = ?auto_335477 ?auto_335480 ) ) ( not ( = ?auto_335478 ?auto_335479 ) ) ( not ( = ?auto_335478 ?auto_335480 ) ) ( not ( = ?auto_335479 ?auto_335480 ) ) ( ON ?auto_335478 ?auto_335479 ) ( ON ?auto_335477 ?auto_335478 ) ( ON ?auto_335476 ?auto_335477 ) ( ON ?auto_335475 ?auto_335476 ) ( CLEAR ?auto_335473 ) ( ON ?auto_335474 ?auto_335475 ) ( CLEAR ?auto_335474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_335473 ?auto_335474 )
      ( MAKE-7PILE ?auto_335473 ?auto_335474 ?auto_335475 ?auto_335476 ?auto_335477 ?auto_335478 ?auto_335479 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335488 - BLOCK
      ?auto_335489 - BLOCK
      ?auto_335490 - BLOCK
      ?auto_335491 - BLOCK
      ?auto_335492 - BLOCK
      ?auto_335493 - BLOCK
      ?auto_335494 - BLOCK
    )
    :vars
    (
      ?auto_335495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335494 ?auto_335495 ) ( ON-TABLE ?auto_335488 ) ( not ( = ?auto_335488 ?auto_335489 ) ) ( not ( = ?auto_335488 ?auto_335490 ) ) ( not ( = ?auto_335488 ?auto_335491 ) ) ( not ( = ?auto_335488 ?auto_335492 ) ) ( not ( = ?auto_335488 ?auto_335493 ) ) ( not ( = ?auto_335488 ?auto_335494 ) ) ( not ( = ?auto_335488 ?auto_335495 ) ) ( not ( = ?auto_335489 ?auto_335490 ) ) ( not ( = ?auto_335489 ?auto_335491 ) ) ( not ( = ?auto_335489 ?auto_335492 ) ) ( not ( = ?auto_335489 ?auto_335493 ) ) ( not ( = ?auto_335489 ?auto_335494 ) ) ( not ( = ?auto_335489 ?auto_335495 ) ) ( not ( = ?auto_335490 ?auto_335491 ) ) ( not ( = ?auto_335490 ?auto_335492 ) ) ( not ( = ?auto_335490 ?auto_335493 ) ) ( not ( = ?auto_335490 ?auto_335494 ) ) ( not ( = ?auto_335490 ?auto_335495 ) ) ( not ( = ?auto_335491 ?auto_335492 ) ) ( not ( = ?auto_335491 ?auto_335493 ) ) ( not ( = ?auto_335491 ?auto_335494 ) ) ( not ( = ?auto_335491 ?auto_335495 ) ) ( not ( = ?auto_335492 ?auto_335493 ) ) ( not ( = ?auto_335492 ?auto_335494 ) ) ( not ( = ?auto_335492 ?auto_335495 ) ) ( not ( = ?auto_335493 ?auto_335494 ) ) ( not ( = ?auto_335493 ?auto_335495 ) ) ( not ( = ?auto_335494 ?auto_335495 ) ) ( ON ?auto_335493 ?auto_335494 ) ( ON ?auto_335492 ?auto_335493 ) ( ON ?auto_335491 ?auto_335492 ) ( ON ?auto_335490 ?auto_335491 ) ( CLEAR ?auto_335488 ) ( ON ?auto_335489 ?auto_335490 ) ( CLEAR ?auto_335489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_335488 ?auto_335489 )
      ( MAKE-7PILE ?auto_335488 ?auto_335489 ?auto_335490 ?auto_335491 ?auto_335492 ?auto_335493 ?auto_335494 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335503 - BLOCK
      ?auto_335504 - BLOCK
      ?auto_335505 - BLOCK
      ?auto_335506 - BLOCK
      ?auto_335507 - BLOCK
      ?auto_335508 - BLOCK
      ?auto_335509 - BLOCK
    )
    :vars
    (
      ?auto_335510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335509 ?auto_335510 ) ( not ( = ?auto_335503 ?auto_335504 ) ) ( not ( = ?auto_335503 ?auto_335505 ) ) ( not ( = ?auto_335503 ?auto_335506 ) ) ( not ( = ?auto_335503 ?auto_335507 ) ) ( not ( = ?auto_335503 ?auto_335508 ) ) ( not ( = ?auto_335503 ?auto_335509 ) ) ( not ( = ?auto_335503 ?auto_335510 ) ) ( not ( = ?auto_335504 ?auto_335505 ) ) ( not ( = ?auto_335504 ?auto_335506 ) ) ( not ( = ?auto_335504 ?auto_335507 ) ) ( not ( = ?auto_335504 ?auto_335508 ) ) ( not ( = ?auto_335504 ?auto_335509 ) ) ( not ( = ?auto_335504 ?auto_335510 ) ) ( not ( = ?auto_335505 ?auto_335506 ) ) ( not ( = ?auto_335505 ?auto_335507 ) ) ( not ( = ?auto_335505 ?auto_335508 ) ) ( not ( = ?auto_335505 ?auto_335509 ) ) ( not ( = ?auto_335505 ?auto_335510 ) ) ( not ( = ?auto_335506 ?auto_335507 ) ) ( not ( = ?auto_335506 ?auto_335508 ) ) ( not ( = ?auto_335506 ?auto_335509 ) ) ( not ( = ?auto_335506 ?auto_335510 ) ) ( not ( = ?auto_335507 ?auto_335508 ) ) ( not ( = ?auto_335507 ?auto_335509 ) ) ( not ( = ?auto_335507 ?auto_335510 ) ) ( not ( = ?auto_335508 ?auto_335509 ) ) ( not ( = ?auto_335508 ?auto_335510 ) ) ( not ( = ?auto_335509 ?auto_335510 ) ) ( ON ?auto_335508 ?auto_335509 ) ( ON ?auto_335507 ?auto_335508 ) ( ON ?auto_335506 ?auto_335507 ) ( ON ?auto_335505 ?auto_335506 ) ( ON ?auto_335504 ?auto_335505 ) ( ON ?auto_335503 ?auto_335504 ) ( CLEAR ?auto_335503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_335503 )
      ( MAKE-7PILE ?auto_335503 ?auto_335504 ?auto_335505 ?auto_335506 ?auto_335507 ?auto_335508 ?auto_335509 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_335518 - BLOCK
      ?auto_335519 - BLOCK
      ?auto_335520 - BLOCK
      ?auto_335521 - BLOCK
      ?auto_335522 - BLOCK
      ?auto_335523 - BLOCK
      ?auto_335524 - BLOCK
    )
    :vars
    (
      ?auto_335525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335524 ?auto_335525 ) ( not ( = ?auto_335518 ?auto_335519 ) ) ( not ( = ?auto_335518 ?auto_335520 ) ) ( not ( = ?auto_335518 ?auto_335521 ) ) ( not ( = ?auto_335518 ?auto_335522 ) ) ( not ( = ?auto_335518 ?auto_335523 ) ) ( not ( = ?auto_335518 ?auto_335524 ) ) ( not ( = ?auto_335518 ?auto_335525 ) ) ( not ( = ?auto_335519 ?auto_335520 ) ) ( not ( = ?auto_335519 ?auto_335521 ) ) ( not ( = ?auto_335519 ?auto_335522 ) ) ( not ( = ?auto_335519 ?auto_335523 ) ) ( not ( = ?auto_335519 ?auto_335524 ) ) ( not ( = ?auto_335519 ?auto_335525 ) ) ( not ( = ?auto_335520 ?auto_335521 ) ) ( not ( = ?auto_335520 ?auto_335522 ) ) ( not ( = ?auto_335520 ?auto_335523 ) ) ( not ( = ?auto_335520 ?auto_335524 ) ) ( not ( = ?auto_335520 ?auto_335525 ) ) ( not ( = ?auto_335521 ?auto_335522 ) ) ( not ( = ?auto_335521 ?auto_335523 ) ) ( not ( = ?auto_335521 ?auto_335524 ) ) ( not ( = ?auto_335521 ?auto_335525 ) ) ( not ( = ?auto_335522 ?auto_335523 ) ) ( not ( = ?auto_335522 ?auto_335524 ) ) ( not ( = ?auto_335522 ?auto_335525 ) ) ( not ( = ?auto_335523 ?auto_335524 ) ) ( not ( = ?auto_335523 ?auto_335525 ) ) ( not ( = ?auto_335524 ?auto_335525 ) ) ( ON ?auto_335523 ?auto_335524 ) ( ON ?auto_335522 ?auto_335523 ) ( ON ?auto_335521 ?auto_335522 ) ( ON ?auto_335520 ?auto_335521 ) ( ON ?auto_335519 ?auto_335520 ) ( ON ?auto_335518 ?auto_335519 ) ( CLEAR ?auto_335518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_335518 )
      ( MAKE-7PILE ?auto_335518 ?auto_335519 ?auto_335520 ?auto_335521 ?auto_335522 ?auto_335523 ?auto_335524 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335534 - BLOCK
      ?auto_335535 - BLOCK
      ?auto_335536 - BLOCK
      ?auto_335537 - BLOCK
      ?auto_335538 - BLOCK
      ?auto_335539 - BLOCK
      ?auto_335540 - BLOCK
      ?auto_335541 - BLOCK
    )
    :vars
    (
      ?auto_335542 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_335540 ) ( ON ?auto_335541 ?auto_335542 ) ( CLEAR ?auto_335541 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_335534 ) ( ON ?auto_335535 ?auto_335534 ) ( ON ?auto_335536 ?auto_335535 ) ( ON ?auto_335537 ?auto_335536 ) ( ON ?auto_335538 ?auto_335537 ) ( ON ?auto_335539 ?auto_335538 ) ( ON ?auto_335540 ?auto_335539 ) ( not ( = ?auto_335534 ?auto_335535 ) ) ( not ( = ?auto_335534 ?auto_335536 ) ) ( not ( = ?auto_335534 ?auto_335537 ) ) ( not ( = ?auto_335534 ?auto_335538 ) ) ( not ( = ?auto_335534 ?auto_335539 ) ) ( not ( = ?auto_335534 ?auto_335540 ) ) ( not ( = ?auto_335534 ?auto_335541 ) ) ( not ( = ?auto_335534 ?auto_335542 ) ) ( not ( = ?auto_335535 ?auto_335536 ) ) ( not ( = ?auto_335535 ?auto_335537 ) ) ( not ( = ?auto_335535 ?auto_335538 ) ) ( not ( = ?auto_335535 ?auto_335539 ) ) ( not ( = ?auto_335535 ?auto_335540 ) ) ( not ( = ?auto_335535 ?auto_335541 ) ) ( not ( = ?auto_335535 ?auto_335542 ) ) ( not ( = ?auto_335536 ?auto_335537 ) ) ( not ( = ?auto_335536 ?auto_335538 ) ) ( not ( = ?auto_335536 ?auto_335539 ) ) ( not ( = ?auto_335536 ?auto_335540 ) ) ( not ( = ?auto_335536 ?auto_335541 ) ) ( not ( = ?auto_335536 ?auto_335542 ) ) ( not ( = ?auto_335537 ?auto_335538 ) ) ( not ( = ?auto_335537 ?auto_335539 ) ) ( not ( = ?auto_335537 ?auto_335540 ) ) ( not ( = ?auto_335537 ?auto_335541 ) ) ( not ( = ?auto_335537 ?auto_335542 ) ) ( not ( = ?auto_335538 ?auto_335539 ) ) ( not ( = ?auto_335538 ?auto_335540 ) ) ( not ( = ?auto_335538 ?auto_335541 ) ) ( not ( = ?auto_335538 ?auto_335542 ) ) ( not ( = ?auto_335539 ?auto_335540 ) ) ( not ( = ?auto_335539 ?auto_335541 ) ) ( not ( = ?auto_335539 ?auto_335542 ) ) ( not ( = ?auto_335540 ?auto_335541 ) ) ( not ( = ?auto_335540 ?auto_335542 ) ) ( not ( = ?auto_335541 ?auto_335542 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_335541 ?auto_335542 )
      ( !STACK ?auto_335541 ?auto_335540 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335551 - BLOCK
      ?auto_335552 - BLOCK
      ?auto_335553 - BLOCK
      ?auto_335554 - BLOCK
      ?auto_335555 - BLOCK
      ?auto_335556 - BLOCK
      ?auto_335557 - BLOCK
      ?auto_335558 - BLOCK
    )
    :vars
    (
      ?auto_335559 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_335557 ) ( ON ?auto_335558 ?auto_335559 ) ( CLEAR ?auto_335558 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_335551 ) ( ON ?auto_335552 ?auto_335551 ) ( ON ?auto_335553 ?auto_335552 ) ( ON ?auto_335554 ?auto_335553 ) ( ON ?auto_335555 ?auto_335554 ) ( ON ?auto_335556 ?auto_335555 ) ( ON ?auto_335557 ?auto_335556 ) ( not ( = ?auto_335551 ?auto_335552 ) ) ( not ( = ?auto_335551 ?auto_335553 ) ) ( not ( = ?auto_335551 ?auto_335554 ) ) ( not ( = ?auto_335551 ?auto_335555 ) ) ( not ( = ?auto_335551 ?auto_335556 ) ) ( not ( = ?auto_335551 ?auto_335557 ) ) ( not ( = ?auto_335551 ?auto_335558 ) ) ( not ( = ?auto_335551 ?auto_335559 ) ) ( not ( = ?auto_335552 ?auto_335553 ) ) ( not ( = ?auto_335552 ?auto_335554 ) ) ( not ( = ?auto_335552 ?auto_335555 ) ) ( not ( = ?auto_335552 ?auto_335556 ) ) ( not ( = ?auto_335552 ?auto_335557 ) ) ( not ( = ?auto_335552 ?auto_335558 ) ) ( not ( = ?auto_335552 ?auto_335559 ) ) ( not ( = ?auto_335553 ?auto_335554 ) ) ( not ( = ?auto_335553 ?auto_335555 ) ) ( not ( = ?auto_335553 ?auto_335556 ) ) ( not ( = ?auto_335553 ?auto_335557 ) ) ( not ( = ?auto_335553 ?auto_335558 ) ) ( not ( = ?auto_335553 ?auto_335559 ) ) ( not ( = ?auto_335554 ?auto_335555 ) ) ( not ( = ?auto_335554 ?auto_335556 ) ) ( not ( = ?auto_335554 ?auto_335557 ) ) ( not ( = ?auto_335554 ?auto_335558 ) ) ( not ( = ?auto_335554 ?auto_335559 ) ) ( not ( = ?auto_335555 ?auto_335556 ) ) ( not ( = ?auto_335555 ?auto_335557 ) ) ( not ( = ?auto_335555 ?auto_335558 ) ) ( not ( = ?auto_335555 ?auto_335559 ) ) ( not ( = ?auto_335556 ?auto_335557 ) ) ( not ( = ?auto_335556 ?auto_335558 ) ) ( not ( = ?auto_335556 ?auto_335559 ) ) ( not ( = ?auto_335557 ?auto_335558 ) ) ( not ( = ?auto_335557 ?auto_335559 ) ) ( not ( = ?auto_335558 ?auto_335559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_335558 ?auto_335559 )
      ( !STACK ?auto_335558 ?auto_335557 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335568 - BLOCK
      ?auto_335569 - BLOCK
      ?auto_335570 - BLOCK
      ?auto_335571 - BLOCK
      ?auto_335572 - BLOCK
      ?auto_335573 - BLOCK
      ?auto_335574 - BLOCK
      ?auto_335575 - BLOCK
    )
    :vars
    (
      ?auto_335576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335575 ?auto_335576 ) ( ON-TABLE ?auto_335568 ) ( ON ?auto_335569 ?auto_335568 ) ( ON ?auto_335570 ?auto_335569 ) ( ON ?auto_335571 ?auto_335570 ) ( ON ?auto_335572 ?auto_335571 ) ( ON ?auto_335573 ?auto_335572 ) ( not ( = ?auto_335568 ?auto_335569 ) ) ( not ( = ?auto_335568 ?auto_335570 ) ) ( not ( = ?auto_335568 ?auto_335571 ) ) ( not ( = ?auto_335568 ?auto_335572 ) ) ( not ( = ?auto_335568 ?auto_335573 ) ) ( not ( = ?auto_335568 ?auto_335574 ) ) ( not ( = ?auto_335568 ?auto_335575 ) ) ( not ( = ?auto_335568 ?auto_335576 ) ) ( not ( = ?auto_335569 ?auto_335570 ) ) ( not ( = ?auto_335569 ?auto_335571 ) ) ( not ( = ?auto_335569 ?auto_335572 ) ) ( not ( = ?auto_335569 ?auto_335573 ) ) ( not ( = ?auto_335569 ?auto_335574 ) ) ( not ( = ?auto_335569 ?auto_335575 ) ) ( not ( = ?auto_335569 ?auto_335576 ) ) ( not ( = ?auto_335570 ?auto_335571 ) ) ( not ( = ?auto_335570 ?auto_335572 ) ) ( not ( = ?auto_335570 ?auto_335573 ) ) ( not ( = ?auto_335570 ?auto_335574 ) ) ( not ( = ?auto_335570 ?auto_335575 ) ) ( not ( = ?auto_335570 ?auto_335576 ) ) ( not ( = ?auto_335571 ?auto_335572 ) ) ( not ( = ?auto_335571 ?auto_335573 ) ) ( not ( = ?auto_335571 ?auto_335574 ) ) ( not ( = ?auto_335571 ?auto_335575 ) ) ( not ( = ?auto_335571 ?auto_335576 ) ) ( not ( = ?auto_335572 ?auto_335573 ) ) ( not ( = ?auto_335572 ?auto_335574 ) ) ( not ( = ?auto_335572 ?auto_335575 ) ) ( not ( = ?auto_335572 ?auto_335576 ) ) ( not ( = ?auto_335573 ?auto_335574 ) ) ( not ( = ?auto_335573 ?auto_335575 ) ) ( not ( = ?auto_335573 ?auto_335576 ) ) ( not ( = ?auto_335574 ?auto_335575 ) ) ( not ( = ?auto_335574 ?auto_335576 ) ) ( not ( = ?auto_335575 ?auto_335576 ) ) ( CLEAR ?auto_335573 ) ( ON ?auto_335574 ?auto_335575 ) ( CLEAR ?auto_335574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_335568 ?auto_335569 ?auto_335570 ?auto_335571 ?auto_335572 ?auto_335573 ?auto_335574 )
      ( MAKE-8PILE ?auto_335568 ?auto_335569 ?auto_335570 ?auto_335571 ?auto_335572 ?auto_335573 ?auto_335574 ?auto_335575 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335585 - BLOCK
      ?auto_335586 - BLOCK
      ?auto_335587 - BLOCK
      ?auto_335588 - BLOCK
      ?auto_335589 - BLOCK
      ?auto_335590 - BLOCK
      ?auto_335591 - BLOCK
      ?auto_335592 - BLOCK
    )
    :vars
    (
      ?auto_335593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335592 ?auto_335593 ) ( ON-TABLE ?auto_335585 ) ( ON ?auto_335586 ?auto_335585 ) ( ON ?auto_335587 ?auto_335586 ) ( ON ?auto_335588 ?auto_335587 ) ( ON ?auto_335589 ?auto_335588 ) ( ON ?auto_335590 ?auto_335589 ) ( not ( = ?auto_335585 ?auto_335586 ) ) ( not ( = ?auto_335585 ?auto_335587 ) ) ( not ( = ?auto_335585 ?auto_335588 ) ) ( not ( = ?auto_335585 ?auto_335589 ) ) ( not ( = ?auto_335585 ?auto_335590 ) ) ( not ( = ?auto_335585 ?auto_335591 ) ) ( not ( = ?auto_335585 ?auto_335592 ) ) ( not ( = ?auto_335585 ?auto_335593 ) ) ( not ( = ?auto_335586 ?auto_335587 ) ) ( not ( = ?auto_335586 ?auto_335588 ) ) ( not ( = ?auto_335586 ?auto_335589 ) ) ( not ( = ?auto_335586 ?auto_335590 ) ) ( not ( = ?auto_335586 ?auto_335591 ) ) ( not ( = ?auto_335586 ?auto_335592 ) ) ( not ( = ?auto_335586 ?auto_335593 ) ) ( not ( = ?auto_335587 ?auto_335588 ) ) ( not ( = ?auto_335587 ?auto_335589 ) ) ( not ( = ?auto_335587 ?auto_335590 ) ) ( not ( = ?auto_335587 ?auto_335591 ) ) ( not ( = ?auto_335587 ?auto_335592 ) ) ( not ( = ?auto_335587 ?auto_335593 ) ) ( not ( = ?auto_335588 ?auto_335589 ) ) ( not ( = ?auto_335588 ?auto_335590 ) ) ( not ( = ?auto_335588 ?auto_335591 ) ) ( not ( = ?auto_335588 ?auto_335592 ) ) ( not ( = ?auto_335588 ?auto_335593 ) ) ( not ( = ?auto_335589 ?auto_335590 ) ) ( not ( = ?auto_335589 ?auto_335591 ) ) ( not ( = ?auto_335589 ?auto_335592 ) ) ( not ( = ?auto_335589 ?auto_335593 ) ) ( not ( = ?auto_335590 ?auto_335591 ) ) ( not ( = ?auto_335590 ?auto_335592 ) ) ( not ( = ?auto_335590 ?auto_335593 ) ) ( not ( = ?auto_335591 ?auto_335592 ) ) ( not ( = ?auto_335591 ?auto_335593 ) ) ( not ( = ?auto_335592 ?auto_335593 ) ) ( CLEAR ?auto_335590 ) ( ON ?auto_335591 ?auto_335592 ) ( CLEAR ?auto_335591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_335585 ?auto_335586 ?auto_335587 ?auto_335588 ?auto_335589 ?auto_335590 ?auto_335591 )
      ( MAKE-8PILE ?auto_335585 ?auto_335586 ?auto_335587 ?auto_335588 ?auto_335589 ?auto_335590 ?auto_335591 ?auto_335592 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335602 - BLOCK
      ?auto_335603 - BLOCK
      ?auto_335604 - BLOCK
      ?auto_335605 - BLOCK
      ?auto_335606 - BLOCK
      ?auto_335607 - BLOCK
      ?auto_335608 - BLOCK
      ?auto_335609 - BLOCK
    )
    :vars
    (
      ?auto_335610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335609 ?auto_335610 ) ( ON-TABLE ?auto_335602 ) ( ON ?auto_335603 ?auto_335602 ) ( ON ?auto_335604 ?auto_335603 ) ( ON ?auto_335605 ?auto_335604 ) ( ON ?auto_335606 ?auto_335605 ) ( not ( = ?auto_335602 ?auto_335603 ) ) ( not ( = ?auto_335602 ?auto_335604 ) ) ( not ( = ?auto_335602 ?auto_335605 ) ) ( not ( = ?auto_335602 ?auto_335606 ) ) ( not ( = ?auto_335602 ?auto_335607 ) ) ( not ( = ?auto_335602 ?auto_335608 ) ) ( not ( = ?auto_335602 ?auto_335609 ) ) ( not ( = ?auto_335602 ?auto_335610 ) ) ( not ( = ?auto_335603 ?auto_335604 ) ) ( not ( = ?auto_335603 ?auto_335605 ) ) ( not ( = ?auto_335603 ?auto_335606 ) ) ( not ( = ?auto_335603 ?auto_335607 ) ) ( not ( = ?auto_335603 ?auto_335608 ) ) ( not ( = ?auto_335603 ?auto_335609 ) ) ( not ( = ?auto_335603 ?auto_335610 ) ) ( not ( = ?auto_335604 ?auto_335605 ) ) ( not ( = ?auto_335604 ?auto_335606 ) ) ( not ( = ?auto_335604 ?auto_335607 ) ) ( not ( = ?auto_335604 ?auto_335608 ) ) ( not ( = ?auto_335604 ?auto_335609 ) ) ( not ( = ?auto_335604 ?auto_335610 ) ) ( not ( = ?auto_335605 ?auto_335606 ) ) ( not ( = ?auto_335605 ?auto_335607 ) ) ( not ( = ?auto_335605 ?auto_335608 ) ) ( not ( = ?auto_335605 ?auto_335609 ) ) ( not ( = ?auto_335605 ?auto_335610 ) ) ( not ( = ?auto_335606 ?auto_335607 ) ) ( not ( = ?auto_335606 ?auto_335608 ) ) ( not ( = ?auto_335606 ?auto_335609 ) ) ( not ( = ?auto_335606 ?auto_335610 ) ) ( not ( = ?auto_335607 ?auto_335608 ) ) ( not ( = ?auto_335607 ?auto_335609 ) ) ( not ( = ?auto_335607 ?auto_335610 ) ) ( not ( = ?auto_335608 ?auto_335609 ) ) ( not ( = ?auto_335608 ?auto_335610 ) ) ( not ( = ?auto_335609 ?auto_335610 ) ) ( ON ?auto_335608 ?auto_335609 ) ( CLEAR ?auto_335606 ) ( ON ?auto_335607 ?auto_335608 ) ( CLEAR ?auto_335607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_335602 ?auto_335603 ?auto_335604 ?auto_335605 ?auto_335606 ?auto_335607 )
      ( MAKE-8PILE ?auto_335602 ?auto_335603 ?auto_335604 ?auto_335605 ?auto_335606 ?auto_335607 ?auto_335608 ?auto_335609 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335619 - BLOCK
      ?auto_335620 - BLOCK
      ?auto_335621 - BLOCK
      ?auto_335622 - BLOCK
      ?auto_335623 - BLOCK
      ?auto_335624 - BLOCK
      ?auto_335625 - BLOCK
      ?auto_335626 - BLOCK
    )
    :vars
    (
      ?auto_335627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335626 ?auto_335627 ) ( ON-TABLE ?auto_335619 ) ( ON ?auto_335620 ?auto_335619 ) ( ON ?auto_335621 ?auto_335620 ) ( ON ?auto_335622 ?auto_335621 ) ( ON ?auto_335623 ?auto_335622 ) ( not ( = ?auto_335619 ?auto_335620 ) ) ( not ( = ?auto_335619 ?auto_335621 ) ) ( not ( = ?auto_335619 ?auto_335622 ) ) ( not ( = ?auto_335619 ?auto_335623 ) ) ( not ( = ?auto_335619 ?auto_335624 ) ) ( not ( = ?auto_335619 ?auto_335625 ) ) ( not ( = ?auto_335619 ?auto_335626 ) ) ( not ( = ?auto_335619 ?auto_335627 ) ) ( not ( = ?auto_335620 ?auto_335621 ) ) ( not ( = ?auto_335620 ?auto_335622 ) ) ( not ( = ?auto_335620 ?auto_335623 ) ) ( not ( = ?auto_335620 ?auto_335624 ) ) ( not ( = ?auto_335620 ?auto_335625 ) ) ( not ( = ?auto_335620 ?auto_335626 ) ) ( not ( = ?auto_335620 ?auto_335627 ) ) ( not ( = ?auto_335621 ?auto_335622 ) ) ( not ( = ?auto_335621 ?auto_335623 ) ) ( not ( = ?auto_335621 ?auto_335624 ) ) ( not ( = ?auto_335621 ?auto_335625 ) ) ( not ( = ?auto_335621 ?auto_335626 ) ) ( not ( = ?auto_335621 ?auto_335627 ) ) ( not ( = ?auto_335622 ?auto_335623 ) ) ( not ( = ?auto_335622 ?auto_335624 ) ) ( not ( = ?auto_335622 ?auto_335625 ) ) ( not ( = ?auto_335622 ?auto_335626 ) ) ( not ( = ?auto_335622 ?auto_335627 ) ) ( not ( = ?auto_335623 ?auto_335624 ) ) ( not ( = ?auto_335623 ?auto_335625 ) ) ( not ( = ?auto_335623 ?auto_335626 ) ) ( not ( = ?auto_335623 ?auto_335627 ) ) ( not ( = ?auto_335624 ?auto_335625 ) ) ( not ( = ?auto_335624 ?auto_335626 ) ) ( not ( = ?auto_335624 ?auto_335627 ) ) ( not ( = ?auto_335625 ?auto_335626 ) ) ( not ( = ?auto_335625 ?auto_335627 ) ) ( not ( = ?auto_335626 ?auto_335627 ) ) ( ON ?auto_335625 ?auto_335626 ) ( CLEAR ?auto_335623 ) ( ON ?auto_335624 ?auto_335625 ) ( CLEAR ?auto_335624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_335619 ?auto_335620 ?auto_335621 ?auto_335622 ?auto_335623 ?auto_335624 )
      ( MAKE-8PILE ?auto_335619 ?auto_335620 ?auto_335621 ?auto_335622 ?auto_335623 ?auto_335624 ?auto_335625 ?auto_335626 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335636 - BLOCK
      ?auto_335637 - BLOCK
      ?auto_335638 - BLOCK
      ?auto_335639 - BLOCK
      ?auto_335640 - BLOCK
      ?auto_335641 - BLOCK
      ?auto_335642 - BLOCK
      ?auto_335643 - BLOCK
    )
    :vars
    (
      ?auto_335644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335643 ?auto_335644 ) ( ON-TABLE ?auto_335636 ) ( ON ?auto_335637 ?auto_335636 ) ( ON ?auto_335638 ?auto_335637 ) ( ON ?auto_335639 ?auto_335638 ) ( not ( = ?auto_335636 ?auto_335637 ) ) ( not ( = ?auto_335636 ?auto_335638 ) ) ( not ( = ?auto_335636 ?auto_335639 ) ) ( not ( = ?auto_335636 ?auto_335640 ) ) ( not ( = ?auto_335636 ?auto_335641 ) ) ( not ( = ?auto_335636 ?auto_335642 ) ) ( not ( = ?auto_335636 ?auto_335643 ) ) ( not ( = ?auto_335636 ?auto_335644 ) ) ( not ( = ?auto_335637 ?auto_335638 ) ) ( not ( = ?auto_335637 ?auto_335639 ) ) ( not ( = ?auto_335637 ?auto_335640 ) ) ( not ( = ?auto_335637 ?auto_335641 ) ) ( not ( = ?auto_335637 ?auto_335642 ) ) ( not ( = ?auto_335637 ?auto_335643 ) ) ( not ( = ?auto_335637 ?auto_335644 ) ) ( not ( = ?auto_335638 ?auto_335639 ) ) ( not ( = ?auto_335638 ?auto_335640 ) ) ( not ( = ?auto_335638 ?auto_335641 ) ) ( not ( = ?auto_335638 ?auto_335642 ) ) ( not ( = ?auto_335638 ?auto_335643 ) ) ( not ( = ?auto_335638 ?auto_335644 ) ) ( not ( = ?auto_335639 ?auto_335640 ) ) ( not ( = ?auto_335639 ?auto_335641 ) ) ( not ( = ?auto_335639 ?auto_335642 ) ) ( not ( = ?auto_335639 ?auto_335643 ) ) ( not ( = ?auto_335639 ?auto_335644 ) ) ( not ( = ?auto_335640 ?auto_335641 ) ) ( not ( = ?auto_335640 ?auto_335642 ) ) ( not ( = ?auto_335640 ?auto_335643 ) ) ( not ( = ?auto_335640 ?auto_335644 ) ) ( not ( = ?auto_335641 ?auto_335642 ) ) ( not ( = ?auto_335641 ?auto_335643 ) ) ( not ( = ?auto_335641 ?auto_335644 ) ) ( not ( = ?auto_335642 ?auto_335643 ) ) ( not ( = ?auto_335642 ?auto_335644 ) ) ( not ( = ?auto_335643 ?auto_335644 ) ) ( ON ?auto_335642 ?auto_335643 ) ( ON ?auto_335641 ?auto_335642 ) ( CLEAR ?auto_335639 ) ( ON ?auto_335640 ?auto_335641 ) ( CLEAR ?auto_335640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_335636 ?auto_335637 ?auto_335638 ?auto_335639 ?auto_335640 )
      ( MAKE-8PILE ?auto_335636 ?auto_335637 ?auto_335638 ?auto_335639 ?auto_335640 ?auto_335641 ?auto_335642 ?auto_335643 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335653 - BLOCK
      ?auto_335654 - BLOCK
      ?auto_335655 - BLOCK
      ?auto_335656 - BLOCK
      ?auto_335657 - BLOCK
      ?auto_335658 - BLOCK
      ?auto_335659 - BLOCK
      ?auto_335660 - BLOCK
    )
    :vars
    (
      ?auto_335661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335660 ?auto_335661 ) ( ON-TABLE ?auto_335653 ) ( ON ?auto_335654 ?auto_335653 ) ( ON ?auto_335655 ?auto_335654 ) ( ON ?auto_335656 ?auto_335655 ) ( not ( = ?auto_335653 ?auto_335654 ) ) ( not ( = ?auto_335653 ?auto_335655 ) ) ( not ( = ?auto_335653 ?auto_335656 ) ) ( not ( = ?auto_335653 ?auto_335657 ) ) ( not ( = ?auto_335653 ?auto_335658 ) ) ( not ( = ?auto_335653 ?auto_335659 ) ) ( not ( = ?auto_335653 ?auto_335660 ) ) ( not ( = ?auto_335653 ?auto_335661 ) ) ( not ( = ?auto_335654 ?auto_335655 ) ) ( not ( = ?auto_335654 ?auto_335656 ) ) ( not ( = ?auto_335654 ?auto_335657 ) ) ( not ( = ?auto_335654 ?auto_335658 ) ) ( not ( = ?auto_335654 ?auto_335659 ) ) ( not ( = ?auto_335654 ?auto_335660 ) ) ( not ( = ?auto_335654 ?auto_335661 ) ) ( not ( = ?auto_335655 ?auto_335656 ) ) ( not ( = ?auto_335655 ?auto_335657 ) ) ( not ( = ?auto_335655 ?auto_335658 ) ) ( not ( = ?auto_335655 ?auto_335659 ) ) ( not ( = ?auto_335655 ?auto_335660 ) ) ( not ( = ?auto_335655 ?auto_335661 ) ) ( not ( = ?auto_335656 ?auto_335657 ) ) ( not ( = ?auto_335656 ?auto_335658 ) ) ( not ( = ?auto_335656 ?auto_335659 ) ) ( not ( = ?auto_335656 ?auto_335660 ) ) ( not ( = ?auto_335656 ?auto_335661 ) ) ( not ( = ?auto_335657 ?auto_335658 ) ) ( not ( = ?auto_335657 ?auto_335659 ) ) ( not ( = ?auto_335657 ?auto_335660 ) ) ( not ( = ?auto_335657 ?auto_335661 ) ) ( not ( = ?auto_335658 ?auto_335659 ) ) ( not ( = ?auto_335658 ?auto_335660 ) ) ( not ( = ?auto_335658 ?auto_335661 ) ) ( not ( = ?auto_335659 ?auto_335660 ) ) ( not ( = ?auto_335659 ?auto_335661 ) ) ( not ( = ?auto_335660 ?auto_335661 ) ) ( ON ?auto_335659 ?auto_335660 ) ( ON ?auto_335658 ?auto_335659 ) ( CLEAR ?auto_335656 ) ( ON ?auto_335657 ?auto_335658 ) ( CLEAR ?auto_335657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_335653 ?auto_335654 ?auto_335655 ?auto_335656 ?auto_335657 )
      ( MAKE-8PILE ?auto_335653 ?auto_335654 ?auto_335655 ?auto_335656 ?auto_335657 ?auto_335658 ?auto_335659 ?auto_335660 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335670 - BLOCK
      ?auto_335671 - BLOCK
      ?auto_335672 - BLOCK
      ?auto_335673 - BLOCK
      ?auto_335674 - BLOCK
      ?auto_335675 - BLOCK
      ?auto_335676 - BLOCK
      ?auto_335677 - BLOCK
    )
    :vars
    (
      ?auto_335678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335677 ?auto_335678 ) ( ON-TABLE ?auto_335670 ) ( ON ?auto_335671 ?auto_335670 ) ( ON ?auto_335672 ?auto_335671 ) ( not ( = ?auto_335670 ?auto_335671 ) ) ( not ( = ?auto_335670 ?auto_335672 ) ) ( not ( = ?auto_335670 ?auto_335673 ) ) ( not ( = ?auto_335670 ?auto_335674 ) ) ( not ( = ?auto_335670 ?auto_335675 ) ) ( not ( = ?auto_335670 ?auto_335676 ) ) ( not ( = ?auto_335670 ?auto_335677 ) ) ( not ( = ?auto_335670 ?auto_335678 ) ) ( not ( = ?auto_335671 ?auto_335672 ) ) ( not ( = ?auto_335671 ?auto_335673 ) ) ( not ( = ?auto_335671 ?auto_335674 ) ) ( not ( = ?auto_335671 ?auto_335675 ) ) ( not ( = ?auto_335671 ?auto_335676 ) ) ( not ( = ?auto_335671 ?auto_335677 ) ) ( not ( = ?auto_335671 ?auto_335678 ) ) ( not ( = ?auto_335672 ?auto_335673 ) ) ( not ( = ?auto_335672 ?auto_335674 ) ) ( not ( = ?auto_335672 ?auto_335675 ) ) ( not ( = ?auto_335672 ?auto_335676 ) ) ( not ( = ?auto_335672 ?auto_335677 ) ) ( not ( = ?auto_335672 ?auto_335678 ) ) ( not ( = ?auto_335673 ?auto_335674 ) ) ( not ( = ?auto_335673 ?auto_335675 ) ) ( not ( = ?auto_335673 ?auto_335676 ) ) ( not ( = ?auto_335673 ?auto_335677 ) ) ( not ( = ?auto_335673 ?auto_335678 ) ) ( not ( = ?auto_335674 ?auto_335675 ) ) ( not ( = ?auto_335674 ?auto_335676 ) ) ( not ( = ?auto_335674 ?auto_335677 ) ) ( not ( = ?auto_335674 ?auto_335678 ) ) ( not ( = ?auto_335675 ?auto_335676 ) ) ( not ( = ?auto_335675 ?auto_335677 ) ) ( not ( = ?auto_335675 ?auto_335678 ) ) ( not ( = ?auto_335676 ?auto_335677 ) ) ( not ( = ?auto_335676 ?auto_335678 ) ) ( not ( = ?auto_335677 ?auto_335678 ) ) ( ON ?auto_335676 ?auto_335677 ) ( ON ?auto_335675 ?auto_335676 ) ( ON ?auto_335674 ?auto_335675 ) ( CLEAR ?auto_335672 ) ( ON ?auto_335673 ?auto_335674 ) ( CLEAR ?auto_335673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_335670 ?auto_335671 ?auto_335672 ?auto_335673 )
      ( MAKE-8PILE ?auto_335670 ?auto_335671 ?auto_335672 ?auto_335673 ?auto_335674 ?auto_335675 ?auto_335676 ?auto_335677 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335687 - BLOCK
      ?auto_335688 - BLOCK
      ?auto_335689 - BLOCK
      ?auto_335690 - BLOCK
      ?auto_335691 - BLOCK
      ?auto_335692 - BLOCK
      ?auto_335693 - BLOCK
      ?auto_335694 - BLOCK
    )
    :vars
    (
      ?auto_335695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335694 ?auto_335695 ) ( ON-TABLE ?auto_335687 ) ( ON ?auto_335688 ?auto_335687 ) ( ON ?auto_335689 ?auto_335688 ) ( not ( = ?auto_335687 ?auto_335688 ) ) ( not ( = ?auto_335687 ?auto_335689 ) ) ( not ( = ?auto_335687 ?auto_335690 ) ) ( not ( = ?auto_335687 ?auto_335691 ) ) ( not ( = ?auto_335687 ?auto_335692 ) ) ( not ( = ?auto_335687 ?auto_335693 ) ) ( not ( = ?auto_335687 ?auto_335694 ) ) ( not ( = ?auto_335687 ?auto_335695 ) ) ( not ( = ?auto_335688 ?auto_335689 ) ) ( not ( = ?auto_335688 ?auto_335690 ) ) ( not ( = ?auto_335688 ?auto_335691 ) ) ( not ( = ?auto_335688 ?auto_335692 ) ) ( not ( = ?auto_335688 ?auto_335693 ) ) ( not ( = ?auto_335688 ?auto_335694 ) ) ( not ( = ?auto_335688 ?auto_335695 ) ) ( not ( = ?auto_335689 ?auto_335690 ) ) ( not ( = ?auto_335689 ?auto_335691 ) ) ( not ( = ?auto_335689 ?auto_335692 ) ) ( not ( = ?auto_335689 ?auto_335693 ) ) ( not ( = ?auto_335689 ?auto_335694 ) ) ( not ( = ?auto_335689 ?auto_335695 ) ) ( not ( = ?auto_335690 ?auto_335691 ) ) ( not ( = ?auto_335690 ?auto_335692 ) ) ( not ( = ?auto_335690 ?auto_335693 ) ) ( not ( = ?auto_335690 ?auto_335694 ) ) ( not ( = ?auto_335690 ?auto_335695 ) ) ( not ( = ?auto_335691 ?auto_335692 ) ) ( not ( = ?auto_335691 ?auto_335693 ) ) ( not ( = ?auto_335691 ?auto_335694 ) ) ( not ( = ?auto_335691 ?auto_335695 ) ) ( not ( = ?auto_335692 ?auto_335693 ) ) ( not ( = ?auto_335692 ?auto_335694 ) ) ( not ( = ?auto_335692 ?auto_335695 ) ) ( not ( = ?auto_335693 ?auto_335694 ) ) ( not ( = ?auto_335693 ?auto_335695 ) ) ( not ( = ?auto_335694 ?auto_335695 ) ) ( ON ?auto_335693 ?auto_335694 ) ( ON ?auto_335692 ?auto_335693 ) ( ON ?auto_335691 ?auto_335692 ) ( CLEAR ?auto_335689 ) ( ON ?auto_335690 ?auto_335691 ) ( CLEAR ?auto_335690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_335687 ?auto_335688 ?auto_335689 ?auto_335690 )
      ( MAKE-8PILE ?auto_335687 ?auto_335688 ?auto_335689 ?auto_335690 ?auto_335691 ?auto_335692 ?auto_335693 ?auto_335694 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335704 - BLOCK
      ?auto_335705 - BLOCK
      ?auto_335706 - BLOCK
      ?auto_335707 - BLOCK
      ?auto_335708 - BLOCK
      ?auto_335709 - BLOCK
      ?auto_335710 - BLOCK
      ?auto_335711 - BLOCK
    )
    :vars
    (
      ?auto_335712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335711 ?auto_335712 ) ( ON-TABLE ?auto_335704 ) ( ON ?auto_335705 ?auto_335704 ) ( not ( = ?auto_335704 ?auto_335705 ) ) ( not ( = ?auto_335704 ?auto_335706 ) ) ( not ( = ?auto_335704 ?auto_335707 ) ) ( not ( = ?auto_335704 ?auto_335708 ) ) ( not ( = ?auto_335704 ?auto_335709 ) ) ( not ( = ?auto_335704 ?auto_335710 ) ) ( not ( = ?auto_335704 ?auto_335711 ) ) ( not ( = ?auto_335704 ?auto_335712 ) ) ( not ( = ?auto_335705 ?auto_335706 ) ) ( not ( = ?auto_335705 ?auto_335707 ) ) ( not ( = ?auto_335705 ?auto_335708 ) ) ( not ( = ?auto_335705 ?auto_335709 ) ) ( not ( = ?auto_335705 ?auto_335710 ) ) ( not ( = ?auto_335705 ?auto_335711 ) ) ( not ( = ?auto_335705 ?auto_335712 ) ) ( not ( = ?auto_335706 ?auto_335707 ) ) ( not ( = ?auto_335706 ?auto_335708 ) ) ( not ( = ?auto_335706 ?auto_335709 ) ) ( not ( = ?auto_335706 ?auto_335710 ) ) ( not ( = ?auto_335706 ?auto_335711 ) ) ( not ( = ?auto_335706 ?auto_335712 ) ) ( not ( = ?auto_335707 ?auto_335708 ) ) ( not ( = ?auto_335707 ?auto_335709 ) ) ( not ( = ?auto_335707 ?auto_335710 ) ) ( not ( = ?auto_335707 ?auto_335711 ) ) ( not ( = ?auto_335707 ?auto_335712 ) ) ( not ( = ?auto_335708 ?auto_335709 ) ) ( not ( = ?auto_335708 ?auto_335710 ) ) ( not ( = ?auto_335708 ?auto_335711 ) ) ( not ( = ?auto_335708 ?auto_335712 ) ) ( not ( = ?auto_335709 ?auto_335710 ) ) ( not ( = ?auto_335709 ?auto_335711 ) ) ( not ( = ?auto_335709 ?auto_335712 ) ) ( not ( = ?auto_335710 ?auto_335711 ) ) ( not ( = ?auto_335710 ?auto_335712 ) ) ( not ( = ?auto_335711 ?auto_335712 ) ) ( ON ?auto_335710 ?auto_335711 ) ( ON ?auto_335709 ?auto_335710 ) ( ON ?auto_335708 ?auto_335709 ) ( ON ?auto_335707 ?auto_335708 ) ( CLEAR ?auto_335705 ) ( ON ?auto_335706 ?auto_335707 ) ( CLEAR ?auto_335706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_335704 ?auto_335705 ?auto_335706 )
      ( MAKE-8PILE ?auto_335704 ?auto_335705 ?auto_335706 ?auto_335707 ?auto_335708 ?auto_335709 ?auto_335710 ?auto_335711 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335721 - BLOCK
      ?auto_335722 - BLOCK
      ?auto_335723 - BLOCK
      ?auto_335724 - BLOCK
      ?auto_335725 - BLOCK
      ?auto_335726 - BLOCK
      ?auto_335727 - BLOCK
      ?auto_335728 - BLOCK
    )
    :vars
    (
      ?auto_335729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335728 ?auto_335729 ) ( ON-TABLE ?auto_335721 ) ( ON ?auto_335722 ?auto_335721 ) ( not ( = ?auto_335721 ?auto_335722 ) ) ( not ( = ?auto_335721 ?auto_335723 ) ) ( not ( = ?auto_335721 ?auto_335724 ) ) ( not ( = ?auto_335721 ?auto_335725 ) ) ( not ( = ?auto_335721 ?auto_335726 ) ) ( not ( = ?auto_335721 ?auto_335727 ) ) ( not ( = ?auto_335721 ?auto_335728 ) ) ( not ( = ?auto_335721 ?auto_335729 ) ) ( not ( = ?auto_335722 ?auto_335723 ) ) ( not ( = ?auto_335722 ?auto_335724 ) ) ( not ( = ?auto_335722 ?auto_335725 ) ) ( not ( = ?auto_335722 ?auto_335726 ) ) ( not ( = ?auto_335722 ?auto_335727 ) ) ( not ( = ?auto_335722 ?auto_335728 ) ) ( not ( = ?auto_335722 ?auto_335729 ) ) ( not ( = ?auto_335723 ?auto_335724 ) ) ( not ( = ?auto_335723 ?auto_335725 ) ) ( not ( = ?auto_335723 ?auto_335726 ) ) ( not ( = ?auto_335723 ?auto_335727 ) ) ( not ( = ?auto_335723 ?auto_335728 ) ) ( not ( = ?auto_335723 ?auto_335729 ) ) ( not ( = ?auto_335724 ?auto_335725 ) ) ( not ( = ?auto_335724 ?auto_335726 ) ) ( not ( = ?auto_335724 ?auto_335727 ) ) ( not ( = ?auto_335724 ?auto_335728 ) ) ( not ( = ?auto_335724 ?auto_335729 ) ) ( not ( = ?auto_335725 ?auto_335726 ) ) ( not ( = ?auto_335725 ?auto_335727 ) ) ( not ( = ?auto_335725 ?auto_335728 ) ) ( not ( = ?auto_335725 ?auto_335729 ) ) ( not ( = ?auto_335726 ?auto_335727 ) ) ( not ( = ?auto_335726 ?auto_335728 ) ) ( not ( = ?auto_335726 ?auto_335729 ) ) ( not ( = ?auto_335727 ?auto_335728 ) ) ( not ( = ?auto_335727 ?auto_335729 ) ) ( not ( = ?auto_335728 ?auto_335729 ) ) ( ON ?auto_335727 ?auto_335728 ) ( ON ?auto_335726 ?auto_335727 ) ( ON ?auto_335725 ?auto_335726 ) ( ON ?auto_335724 ?auto_335725 ) ( CLEAR ?auto_335722 ) ( ON ?auto_335723 ?auto_335724 ) ( CLEAR ?auto_335723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_335721 ?auto_335722 ?auto_335723 )
      ( MAKE-8PILE ?auto_335721 ?auto_335722 ?auto_335723 ?auto_335724 ?auto_335725 ?auto_335726 ?auto_335727 ?auto_335728 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335738 - BLOCK
      ?auto_335739 - BLOCK
      ?auto_335740 - BLOCK
      ?auto_335741 - BLOCK
      ?auto_335742 - BLOCK
      ?auto_335743 - BLOCK
      ?auto_335744 - BLOCK
      ?auto_335745 - BLOCK
    )
    :vars
    (
      ?auto_335746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335745 ?auto_335746 ) ( ON-TABLE ?auto_335738 ) ( not ( = ?auto_335738 ?auto_335739 ) ) ( not ( = ?auto_335738 ?auto_335740 ) ) ( not ( = ?auto_335738 ?auto_335741 ) ) ( not ( = ?auto_335738 ?auto_335742 ) ) ( not ( = ?auto_335738 ?auto_335743 ) ) ( not ( = ?auto_335738 ?auto_335744 ) ) ( not ( = ?auto_335738 ?auto_335745 ) ) ( not ( = ?auto_335738 ?auto_335746 ) ) ( not ( = ?auto_335739 ?auto_335740 ) ) ( not ( = ?auto_335739 ?auto_335741 ) ) ( not ( = ?auto_335739 ?auto_335742 ) ) ( not ( = ?auto_335739 ?auto_335743 ) ) ( not ( = ?auto_335739 ?auto_335744 ) ) ( not ( = ?auto_335739 ?auto_335745 ) ) ( not ( = ?auto_335739 ?auto_335746 ) ) ( not ( = ?auto_335740 ?auto_335741 ) ) ( not ( = ?auto_335740 ?auto_335742 ) ) ( not ( = ?auto_335740 ?auto_335743 ) ) ( not ( = ?auto_335740 ?auto_335744 ) ) ( not ( = ?auto_335740 ?auto_335745 ) ) ( not ( = ?auto_335740 ?auto_335746 ) ) ( not ( = ?auto_335741 ?auto_335742 ) ) ( not ( = ?auto_335741 ?auto_335743 ) ) ( not ( = ?auto_335741 ?auto_335744 ) ) ( not ( = ?auto_335741 ?auto_335745 ) ) ( not ( = ?auto_335741 ?auto_335746 ) ) ( not ( = ?auto_335742 ?auto_335743 ) ) ( not ( = ?auto_335742 ?auto_335744 ) ) ( not ( = ?auto_335742 ?auto_335745 ) ) ( not ( = ?auto_335742 ?auto_335746 ) ) ( not ( = ?auto_335743 ?auto_335744 ) ) ( not ( = ?auto_335743 ?auto_335745 ) ) ( not ( = ?auto_335743 ?auto_335746 ) ) ( not ( = ?auto_335744 ?auto_335745 ) ) ( not ( = ?auto_335744 ?auto_335746 ) ) ( not ( = ?auto_335745 ?auto_335746 ) ) ( ON ?auto_335744 ?auto_335745 ) ( ON ?auto_335743 ?auto_335744 ) ( ON ?auto_335742 ?auto_335743 ) ( ON ?auto_335741 ?auto_335742 ) ( ON ?auto_335740 ?auto_335741 ) ( CLEAR ?auto_335738 ) ( ON ?auto_335739 ?auto_335740 ) ( CLEAR ?auto_335739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_335738 ?auto_335739 )
      ( MAKE-8PILE ?auto_335738 ?auto_335739 ?auto_335740 ?auto_335741 ?auto_335742 ?auto_335743 ?auto_335744 ?auto_335745 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335755 - BLOCK
      ?auto_335756 - BLOCK
      ?auto_335757 - BLOCK
      ?auto_335758 - BLOCK
      ?auto_335759 - BLOCK
      ?auto_335760 - BLOCK
      ?auto_335761 - BLOCK
      ?auto_335762 - BLOCK
    )
    :vars
    (
      ?auto_335763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335762 ?auto_335763 ) ( ON-TABLE ?auto_335755 ) ( not ( = ?auto_335755 ?auto_335756 ) ) ( not ( = ?auto_335755 ?auto_335757 ) ) ( not ( = ?auto_335755 ?auto_335758 ) ) ( not ( = ?auto_335755 ?auto_335759 ) ) ( not ( = ?auto_335755 ?auto_335760 ) ) ( not ( = ?auto_335755 ?auto_335761 ) ) ( not ( = ?auto_335755 ?auto_335762 ) ) ( not ( = ?auto_335755 ?auto_335763 ) ) ( not ( = ?auto_335756 ?auto_335757 ) ) ( not ( = ?auto_335756 ?auto_335758 ) ) ( not ( = ?auto_335756 ?auto_335759 ) ) ( not ( = ?auto_335756 ?auto_335760 ) ) ( not ( = ?auto_335756 ?auto_335761 ) ) ( not ( = ?auto_335756 ?auto_335762 ) ) ( not ( = ?auto_335756 ?auto_335763 ) ) ( not ( = ?auto_335757 ?auto_335758 ) ) ( not ( = ?auto_335757 ?auto_335759 ) ) ( not ( = ?auto_335757 ?auto_335760 ) ) ( not ( = ?auto_335757 ?auto_335761 ) ) ( not ( = ?auto_335757 ?auto_335762 ) ) ( not ( = ?auto_335757 ?auto_335763 ) ) ( not ( = ?auto_335758 ?auto_335759 ) ) ( not ( = ?auto_335758 ?auto_335760 ) ) ( not ( = ?auto_335758 ?auto_335761 ) ) ( not ( = ?auto_335758 ?auto_335762 ) ) ( not ( = ?auto_335758 ?auto_335763 ) ) ( not ( = ?auto_335759 ?auto_335760 ) ) ( not ( = ?auto_335759 ?auto_335761 ) ) ( not ( = ?auto_335759 ?auto_335762 ) ) ( not ( = ?auto_335759 ?auto_335763 ) ) ( not ( = ?auto_335760 ?auto_335761 ) ) ( not ( = ?auto_335760 ?auto_335762 ) ) ( not ( = ?auto_335760 ?auto_335763 ) ) ( not ( = ?auto_335761 ?auto_335762 ) ) ( not ( = ?auto_335761 ?auto_335763 ) ) ( not ( = ?auto_335762 ?auto_335763 ) ) ( ON ?auto_335761 ?auto_335762 ) ( ON ?auto_335760 ?auto_335761 ) ( ON ?auto_335759 ?auto_335760 ) ( ON ?auto_335758 ?auto_335759 ) ( ON ?auto_335757 ?auto_335758 ) ( CLEAR ?auto_335755 ) ( ON ?auto_335756 ?auto_335757 ) ( CLEAR ?auto_335756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_335755 ?auto_335756 )
      ( MAKE-8PILE ?auto_335755 ?auto_335756 ?auto_335757 ?auto_335758 ?auto_335759 ?auto_335760 ?auto_335761 ?auto_335762 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335772 - BLOCK
      ?auto_335773 - BLOCK
      ?auto_335774 - BLOCK
      ?auto_335775 - BLOCK
      ?auto_335776 - BLOCK
      ?auto_335777 - BLOCK
      ?auto_335778 - BLOCK
      ?auto_335779 - BLOCK
    )
    :vars
    (
      ?auto_335780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335779 ?auto_335780 ) ( not ( = ?auto_335772 ?auto_335773 ) ) ( not ( = ?auto_335772 ?auto_335774 ) ) ( not ( = ?auto_335772 ?auto_335775 ) ) ( not ( = ?auto_335772 ?auto_335776 ) ) ( not ( = ?auto_335772 ?auto_335777 ) ) ( not ( = ?auto_335772 ?auto_335778 ) ) ( not ( = ?auto_335772 ?auto_335779 ) ) ( not ( = ?auto_335772 ?auto_335780 ) ) ( not ( = ?auto_335773 ?auto_335774 ) ) ( not ( = ?auto_335773 ?auto_335775 ) ) ( not ( = ?auto_335773 ?auto_335776 ) ) ( not ( = ?auto_335773 ?auto_335777 ) ) ( not ( = ?auto_335773 ?auto_335778 ) ) ( not ( = ?auto_335773 ?auto_335779 ) ) ( not ( = ?auto_335773 ?auto_335780 ) ) ( not ( = ?auto_335774 ?auto_335775 ) ) ( not ( = ?auto_335774 ?auto_335776 ) ) ( not ( = ?auto_335774 ?auto_335777 ) ) ( not ( = ?auto_335774 ?auto_335778 ) ) ( not ( = ?auto_335774 ?auto_335779 ) ) ( not ( = ?auto_335774 ?auto_335780 ) ) ( not ( = ?auto_335775 ?auto_335776 ) ) ( not ( = ?auto_335775 ?auto_335777 ) ) ( not ( = ?auto_335775 ?auto_335778 ) ) ( not ( = ?auto_335775 ?auto_335779 ) ) ( not ( = ?auto_335775 ?auto_335780 ) ) ( not ( = ?auto_335776 ?auto_335777 ) ) ( not ( = ?auto_335776 ?auto_335778 ) ) ( not ( = ?auto_335776 ?auto_335779 ) ) ( not ( = ?auto_335776 ?auto_335780 ) ) ( not ( = ?auto_335777 ?auto_335778 ) ) ( not ( = ?auto_335777 ?auto_335779 ) ) ( not ( = ?auto_335777 ?auto_335780 ) ) ( not ( = ?auto_335778 ?auto_335779 ) ) ( not ( = ?auto_335778 ?auto_335780 ) ) ( not ( = ?auto_335779 ?auto_335780 ) ) ( ON ?auto_335778 ?auto_335779 ) ( ON ?auto_335777 ?auto_335778 ) ( ON ?auto_335776 ?auto_335777 ) ( ON ?auto_335775 ?auto_335776 ) ( ON ?auto_335774 ?auto_335775 ) ( ON ?auto_335773 ?auto_335774 ) ( ON ?auto_335772 ?auto_335773 ) ( CLEAR ?auto_335772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_335772 )
      ( MAKE-8PILE ?auto_335772 ?auto_335773 ?auto_335774 ?auto_335775 ?auto_335776 ?auto_335777 ?auto_335778 ?auto_335779 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_335789 - BLOCK
      ?auto_335790 - BLOCK
      ?auto_335791 - BLOCK
      ?auto_335792 - BLOCK
      ?auto_335793 - BLOCK
      ?auto_335794 - BLOCK
      ?auto_335795 - BLOCK
      ?auto_335796 - BLOCK
    )
    :vars
    (
      ?auto_335797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335796 ?auto_335797 ) ( not ( = ?auto_335789 ?auto_335790 ) ) ( not ( = ?auto_335789 ?auto_335791 ) ) ( not ( = ?auto_335789 ?auto_335792 ) ) ( not ( = ?auto_335789 ?auto_335793 ) ) ( not ( = ?auto_335789 ?auto_335794 ) ) ( not ( = ?auto_335789 ?auto_335795 ) ) ( not ( = ?auto_335789 ?auto_335796 ) ) ( not ( = ?auto_335789 ?auto_335797 ) ) ( not ( = ?auto_335790 ?auto_335791 ) ) ( not ( = ?auto_335790 ?auto_335792 ) ) ( not ( = ?auto_335790 ?auto_335793 ) ) ( not ( = ?auto_335790 ?auto_335794 ) ) ( not ( = ?auto_335790 ?auto_335795 ) ) ( not ( = ?auto_335790 ?auto_335796 ) ) ( not ( = ?auto_335790 ?auto_335797 ) ) ( not ( = ?auto_335791 ?auto_335792 ) ) ( not ( = ?auto_335791 ?auto_335793 ) ) ( not ( = ?auto_335791 ?auto_335794 ) ) ( not ( = ?auto_335791 ?auto_335795 ) ) ( not ( = ?auto_335791 ?auto_335796 ) ) ( not ( = ?auto_335791 ?auto_335797 ) ) ( not ( = ?auto_335792 ?auto_335793 ) ) ( not ( = ?auto_335792 ?auto_335794 ) ) ( not ( = ?auto_335792 ?auto_335795 ) ) ( not ( = ?auto_335792 ?auto_335796 ) ) ( not ( = ?auto_335792 ?auto_335797 ) ) ( not ( = ?auto_335793 ?auto_335794 ) ) ( not ( = ?auto_335793 ?auto_335795 ) ) ( not ( = ?auto_335793 ?auto_335796 ) ) ( not ( = ?auto_335793 ?auto_335797 ) ) ( not ( = ?auto_335794 ?auto_335795 ) ) ( not ( = ?auto_335794 ?auto_335796 ) ) ( not ( = ?auto_335794 ?auto_335797 ) ) ( not ( = ?auto_335795 ?auto_335796 ) ) ( not ( = ?auto_335795 ?auto_335797 ) ) ( not ( = ?auto_335796 ?auto_335797 ) ) ( ON ?auto_335795 ?auto_335796 ) ( ON ?auto_335794 ?auto_335795 ) ( ON ?auto_335793 ?auto_335794 ) ( ON ?auto_335792 ?auto_335793 ) ( ON ?auto_335791 ?auto_335792 ) ( ON ?auto_335790 ?auto_335791 ) ( ON ?auto_335789 ?auto_335790 ) ( CLEAR ?auto_335789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_335789 )
      ( MAKE-8PILE ?auto_335789 ?auto_335790 ?auto_335791 ?auto_335792 ?auto_335793 ?auto_335794 ?auto_335795 ?auto_335796 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_335807 - BLOCK
      ?auto_335808 - BLOCK
      ?auto_335809 - BLOCK
      ?auto_335810 - BLOCK
      ?auto_335811 - BLOCK
      ?auto_335812 - BLOCK
      ?auto_335813 - BLOCK
      ?auto_335814 - BLOCK
      ?auto_335815 - BLOCK
    )
    :vars
    (
      ?auto_335816 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_335814 ) ( ON ?auto_335815 ?auto_335816 ) ( CLEAR ?auto_335815 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_335807 ) ( ON ?auto_335808 ?auto_335807 ) ( ON ?auto_335809 ?auto_335808 ) ( ON ?auto_335810 ?auto_335809 ) ( ON ?auto_335811 ?auto_335810 ) ( ON ?auto_335812 ?auto_335811 ) ( ON ?auto_335813 ?auto_335812 ) ( ON ?auto_335814 ?auto_335813 ) ( not ( = ?auto_335807 ?auto_335808 ) ) ( not ( = ?auto_335807 ?auto_335809 ) ) ( not ( = ?auto_335807 ?auto_335810 ) ) ( not ( = ?auto_335807 ?auto_335811 ) ) ( not ( = ?auto_335807 ?auto_335812 ) ) ( not ( = ?auto_335807 ?auto_335813 ) ) ( not ( = ?auto_335807 ?auto_335814 ) ) ( not ( = ?auto_335807 ?auto_335815 ) ) ( not ( = ?auto_335807 ?auto_335816 ) ) ( not ( = ?auto_335808 ?auto_335809 ) ) ( not ( = ?auto_335808 ?auto_335810 ) ) ( not ( = ?auto_335808 ?auto_335811 ) ) ( not ( = ?auto_335808 ?auto_335812 ) ) ( not ( = ?auto_335808 ?auto_335813 ) ) ( not ( = ?auto_335808 ?auto_335814 ) ) ( not ( = ?auto_335808 ?auto_335815 ) ) ( not ( = ?auto_335808 ?auto_335816 ) ) ( not ( = ?auto_335809 ?auto_335810 ) ) ( not ( = ?auto_335809 ?auto_335811 ) ) ( not ( = ?auto_335809 ?auto_335812 ) ) ( not ( = ?auto_335809 ?auto_335813 ) ) ( not ( = ?auto_335809 ?auto_335814 ) ) ( not ( = ?auto_335809 ?auto_335815 ) ) ( not ( = ?auto_335809 ?auto_335816 ) ) ( not ( = ?auto_335810 ?auto_335811 ) ) ( not ( = ?auto_335810 ?auto_335812 ) ) ( not ( = ?auto_335810 ?auto_335813 ) ) ( not ( = ?auto_335810 ?auto_335814 ) ) ( not ( = ?auto_335810 ?auto_335815 ) ) ( not ( = ?auto_335810 ?auto_335816 ) ) ( not ( = ?auto_335811 ?auto_335812 ) ) ( not ( = ?auto_335811 ?auto_335813 ) ) ( not ( = ?auto_335811 ?auto_335814 ) ) ( not ( = ?auto_335811 ?auto_335815 ) ) ( not ( = ?auto_335811 ?auto_335816 ) ) ( not ( = ?auto_335812 ?auto_335813 ) ) ( not ( = ?auto_335812 ?auto_335814 ) ) ( not ( = ?auto_335812 ?auto_335815 ) ) ( not ( = ?auto_335812 ?auto_335816 ) ) ( not ( = ?auto_335813 ?auto_335814 ) ) ( not ( = ?auto_335813 ?auto_335815 ) ) ( not ( = ?auto_335813 ?auto_335816 ) ) ( not ( = ?auto_335814 ?auto_335815 ) ) ( not ( = ?auto_335814 ?auto_335816 ) ) ( not ( = ?auto_335815 ?auto_335816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_335815 ?auto_335816 )
      ( !STACK ?auto_335815 ?auto_335814 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_335826 - BLOCK
      ?auto_335827 - BLOCK
      ?auto_335828 - BLOCK
      ?auto_335829 - BLOCK
      ?auto_335830 - BLOCK
      ?auto_335831 - BLOCK
      ?auto_335832 - BLOCK
      ?auto_335833 - BLOCK
      ?auto_335834 - BLOCK
    )
    :vars
    (
      ?auto_335835 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_335833 ) ( ON ?auto_335834 ?auto_335835 ) ( CLEAR ?auto_335834 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_335826 ) ( ON ?auto_335827 ?auto_335826 ) ( ON ?auto_335828 ?auto_335827 ) ( ON ?auto_335829 ?auto_335828 ) ( ON ?auto_335830 ?auto_335829 ) ( ON ?auto_335831 ?auto_335830 ) ( ON ?auto_335832 ?auto_335831 ) ( ON ?auto_335833 ?auto_335832 ) ( not ( = ?auto_335826 ?auto_335827 ) ) ( not ( = ?auto_335826 ?auto_335828 ) ) ( not ( = ?auto_335826 ?auto_335829 ) ) ( not ( = ?auto_335826 ?auto_335830 ) ) ( not ( = ?auto_335826 ?auto_335831 ) ) ( not ( = ?auto_335826 ?auto_335832 ) ) ( not ( = ?auto_335826 ?auto_335833 ) ) ( not ( = ?auto_335826 ?auto_335834 ) ) ( not ( = ?auto_335826 ?auto_335835 ) ) ( not ( = ?auto_335827 ?auto_335828 ) ) ( not ( = ?auto_335827 ?auto_335829 ) ) ( not ( = ?auto_335827 ?auto_335830 ) ) ( not ( = ?auto_335827 ?auto_335831 ) ) ( not ( = ?auto_335827 ?auto_335832 ) ) ( not ( = ?auto_335827 ?auto_335833 ) ) ( not ( = ?auto_335827 ?auto_335834 ) ) ( not ( = ?auto_335827 ?auto_335835 ) ) ( not ( = ?auto_335828 ?auto_335829 ) ) ( not ( = ?auto_335828 ?auto_335830 ) ) ( not ( = ?auto_335828 ?auto_335831 ) ) ( not ( = ?auto_335828 ?auto_335832 ) ) ( not ( = ?auto_335828 ?auto_335833 ) ) ( not ( = ?auto_335828 ?auto_335834 ) ) ( not ( = ?auto_335828 ?auto_335835 ) ) ( not ( = ?auto_335829 ?auto_335830 ) ) ( not ( = ?auto_335829 ?auto_335831 ) ) ( not ( = ?auto_335829 ?auto_335832 ) ) ( not ( = ?auto_335829 ?auto_335833 ) ) ( not ( = ?auto_335829 ?auto_335834 ) ) ( not ( = ?auto_335829 ?auto_335835 ) ) ( not ( = ?auto_335830 ?auto_335831 ) ) ( not ( = ?auto_335830 ?auto_335832 ) ) ( not ( = ?auto_335830 ?auto_335833 ) ) ( not ( = ?auto_335830 ?auto_335834 ) ) ( not ( = ?auto_335830 ?auto_335835 ) ) ( not ( = ?auto_335831 ?auto_335832 ) ) ( not ( = ?auto_335831 ?auto_335833 ) ) ( not ( = ?auto_335831 ?auto_335834 ) ) ( not ( = ?auto_335831 ?auto_335835 ) ) ( not ( = ?auto_335832 ?auto_335833 ) ) ( not ( = ?auto_335832 ?auto_335834 ) ) ( not ( = ?auto_335832 ?auto_335835 ) ) ( not ( = ?auto_335833 ?auto_335834 ) ) ( not ( = ?auto_335833 ?auto_335835 ) ) ( not ( = ?auto_335834 ?auto_335835 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_335834 ?auto_335835 )
      ( !STACK ?auto_335834 ?auto_335833 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_335845 - BLOCK
      ?auto_335846 - BLOCK
      ?auto_335847 - BLOCK
      ?auto_335848 - BLOCK
      ?auto_335849 - BLOCK
      ?auto_335850 - BLOCK
      ?auto_335851 - BLOCK
      ?auto_335852 - BLOCK
      ?auto_335853 - BLOCK
    )
    :vars
    (
      ?auto_335854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335853 ?auto_335854 ) ( ON-TABLE ?auto_335845 ) ( ON ?auto_335846 ?auto_335845 ) ( ON ?auto_335847 ?auto_335846 ) ( ON ?auto_335848 ?auto_335847 ) ( ON ?auto_335849 ?auto_335848 ) ( ON ?auto_335850 ?auto_335849 ) ( ON ?auto_335851 ?auto_335850 ) ( not ( = ?auto_335845 ?auto_335846 ) ) ( not ( = ?auto_335845 ?auto_335847 ) ) ( not ( = ?auto_335845 ?auto_335848 ) ) ( not ( = ?auto_335845 ?auto_335849 ) ) ( not ( = ?auto_335845 ?auto_335850 ) ) ( not ( = ?auto_335845 ?auto_335851 ) ) ( not ( = ?auto_335845 ?auto_335852 ) ) ( not ( = ?auto_335845 ?auto_335853 ) ) ( not ( = ?auto_335845 ?auto_335854 ) ) ( not ( = ?auto_335846 ?auto_335847 ) ) ( not ( = ?auto_335846 ?auto_335848 ) ) ( not ( = ?auto_335846 ?auto_335849 ) ) ( not ( = ?auto_335846 ?auto_335850 ) ) ( not ( = ?auto_335846 ?auto_335851 ) ) ( not ( = ?auto_335846 ?auto_335852 ) ) ( not ( = ?auto_335846 ?auto_335853 ) ) ( not ( = ?auto_335846 ?auto_335854 ) ) ( not ( = ?auto_335847 ?auto_335848 ) ) ( not ( = ?auto_335847 ?auto_335849 ) ) ( not ( = ?auto_335847 ?auto_335850 ) ) ( not ( = ?auto_335847 ?auto_335851 ) ) ( not ( = ?auto_335847 ?auto_335852 ) ) ( not ( = ?auto_335847 ?auto_335853 ) ) ( not ( = ?auto_335847 ?auto_335854 ) ) ( not ( = ?auto_335848 ?auto_335849 ) ) ( not ( = ?auto_335848 ?auto_335850 ) ) ( not ( = ?auto_335848 ?auto_335851 ) ) ( not ( = ?auto_335848 ?auto_335852 ) ) ( not ( = ?auto_335848 ?auto_335853 ) ) ( not ( = ?auto_335848 ?auto_335854 ) ) ( not ( = ?auto_335849 ?auto_335850 ) ) ( not ( = ?auto_335849 ?auto_335851 ) ) ( not ( = ?auto_335849 ?auto_335852 ) ) ( not ( = ?auto_335849 ?auto_335853 ) ) ( not ( = ?auto_335849 ?auto_335854 ) ) ( not ( = ?auto_335850 ?auto_335851 ) ) ( not ( = ?auto_335850 ?auto_335852 ) ) ( not ( = ?auto_335850 ?auto_335853 ) ) ( not ( = ?auto_335850 ?auto_335854 ) ) ( not ( = ?auto_335851 ?auto_335852 ) ) ( not ( = ?auto_335851 ?auto_335853 ) ) ( not ( = ?auto_335851 ?auto_335854 ) ) ( not ( = ?auto_335852 ?auto_335853 ) ) ( not ( = ?auto_335852 ?auto_335854 ) ) ( not ( = ?auto_335853 ?auto_335854 ) ) ( CLEAR ?auto_335851 ) ( ON ?auto_335852 ?auto_335853 ) ( CLEAR ?auto_335852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_335845 ?auto_335846 ?auto_335847 ?auto_335848 ?auto_335849 ?auto_335850 ?auto_335851 ?auto_335852 )
      ( MAKE-9PILE ?auto_335845 ?auto_335846 ?auto_335847 ?auto_335848 ?auto_335849 ?auto_335850 ?auto_335851 ?auto_335852 ?auto_335853 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_335864 - BLOCK
      ?auto_335865 - BLOCK
      ?auto_335866 - BLOCK
      ?auto_335867 - BLOCK
      ?auto_335868 - BLOCK
      ?auto_335869 - BLOCK
      ?auto_335870 - BLOCK
      ?auto_335871 - BLOCK
      ?auto_335872 - BLOCK
    )
    :vars
    (
      ?auto_335873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335872 ?auto_335873 ) ( ON-TABLE ?auto_335864 ) ( ON ?auto_335865 ?auto_335864 ) ( ON ?auto_335866 ?auto_335865 ) ( ON ?auto_335867 ?auto_335866 ) ( ON ?auto_335868 ?auto_335867 ) ( ON ?auto_335869 ?auto_335868 ) ( ON ?auto_335870 ?auto_335869 ) ( not ( = ?auto_335864 ?auto_335865 ) ) ( not ( = ?auto_335864 ?auto_335866 ) ) ( not ( = ?auto_335864 ?auto_335867 ) ) ( not ( = ?auto_335864 ?auto_335868 ) ) ( not ( = ?auto_335864 ?auto_335869 ) ) ( not ( = ?auto_335864 ?auto_335870 ) ) ( not ( = ?auto_335864 ?auto_335871 ) ) ( not ( = ?auto_335864 ?auto_335872 ) ) ( not ( = ?auto_335864 ?auto_335873 ) ) ( not ( = ?auto_335865 ?auto_335866 ) ) ( not ( = ?auto_335865 ?auto_335867 ) ) ( not ( = ?auto_335865 ?auto_335868 ) ) ( not ( = ?auto_335865 ?auto_335869 ) ) ( not ( = ?auto_335865 ?auto_335870 ) ) ( not ( = ?auto_335865 ?auto_335871 ) ) ( not ( = ?auto_335865 ?auto_335872 ) ) ( not ( = ?auto_335865 ?auto_335873 ) ) ( not ( = ?auto_335866 ?auto_335867 ) ) ( not ( = ?auto_335866 ?auto_335868 ) ) ( not ( = ?auto_335866 ?auto_335869 ) ) ( not ( = ?auto_335866 ?auto_335870 ) ) ( not ( = ?auto_335866 ?auto_335871 ) ) ( not ( = ?auto_335866 ?auto_335872 ) ) ( not ( = ?auto_335866 ?auto_335873 ) ) ( not ( = ?auto_335867 ?auto_335868 ) ) ( not ( = ?auto_335867 ?auto_335869 ) ) ( not ( = ?auto_335867 ?auto_335870 ) ) ( not ( = ?auto_335867 ?auto_335871 ) ) ( not ( = ?auto_335867 ?auto_335872 ) ) ( not ( = ?auto_335867 ?auto_335873 ) ) ( not ( = ?auto_335868 ?auto_335869 ) ) ( not ( = ?auto_335868 ?auto_335870 ) ) ( not ( = ?auto_335868 ?auto_335871 ) ) ( not ( = ?auto_335868 ?auto_335872 ) ) ( not ( = ?auto_335868 ?auto_335873 ) ) ( not ( = ?auto_335869 ?auto_335870 ) ) ( not ( = ?auto_335869 ?auto_335871 ) ) ( not ( = ?auto_335869 ?auto_335872 ) ) ( not ( = ?auto_335869 ?auto_335873 ) ) ( not ( = ?auto_335870 ?auto_335871 ) ) ( not ( = ?auto_335870 ?auto_335872 ) ) ( not ( = ?auto_335870 ?auto_335873 ) ) ( not ( = ?auto_335871 ?auto_335872 ) ) ( not ( = ?auto_335871 ?auto_335873 ) ) ( not ( = ?auto_335872 ?auto_335873 ) ) ( CLEAR ?auto_335870 ) ( ON ?auto_335871 ?auto_335872 ) ( CLEAR ?auto_335871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_335864 ?auto_335865 ?auto_335866 ?auto_335867 ?auto_335868 ?auto_335869 ?auto_335870 ?auto_335871 )
      ( MAKE-9PILE ?auto_335864 ?auto_335865 ?auto_335866 ?auto_335867 ?auto_335868 ?auto_335869 ?auto_335870 ?auto_335871 ?auto_335872 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_335883 - BLOCK
      ?auto_335884 - BLOCK
      ?auto_335885 - BLOCK
      ?auto_335886 - BLOCK
      ?auto_335887 - BLOCK
      ?auto_335888 - BLOCK
      ?auto_335889 - BLOCK
      ?auto_335890 - BLOCK
      ?auto_335891 - BLOCK
    )
    :vars
    (
      ?auto_335892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335891 ?auto_335892 ) ( ON-TABLE ?auto_335883 ) ( ON ?auto_335884 ?auto_335883 ) ( ON ?auto_335885 ?auto_335884 ) ( ON ?auto_335886 ?auto_335885 ) ( ON ?auto_335887 ?auto_335886 ) ( ON ?auto_335888 ?auto_335887 ) ( not ( = ?auto_335883 ?auto_335884 ) ) ( not ( = ?auto_335883 ?auto_335885 ) ) ( not ( = ?auto_335883 ?auto_335886 ) ) ( not ( = ?auto_335883 ?auto_335887 ) ) ( not ( = ?auto_335883 ?auto_335888 ) ) ( not ( = ?auto_335883 ?auto_335889 ) ) ( not ( = ?auto_335883 ?auto_335890 ) ) ( not ( = ?auto_335883 ?auto_335891 ) ) ( not ( = ?auto_335883 ?auto_335892 ) ) ( not ( = ?auto_335884 ?auto_335885 ) ) ( not ( = ?auto_335884 ?auto_335886 ) ) ( not ( = ?auto_335884 ?auto_335887 ) ) ( not ( = ?auto_335884 ?auto_335888 ) ) ( not ( = ?auto_335884 ?auto_335889 ) ) ( not ( = ?auto_335884 ?auto_335890 ) ) ( not ( = ?auto_335884 ?auto_335891 ) ) ( not ( = ?auto_335884 ?auto_335892 ) ) ( not ( = ?auto_335885 ?auto_335886 ) ) ( not ( = ?auto_335885 ?auto_335887 ) ) ( not ( = ?auto_335885 ?auto_335888 ) ) ( not ( = ?auto_335885 ?auto_335889 ) ) ( not ( = ?auto_335885 ?auto_335890 ) ) ( not ( = ?auto_335885 ?auto_335891 ) ) ( not ( = ?auto_335885 ?auto_335892 ) ) ( not ( = ?auto_335886 ?auto_335887 ) ) ( not ( = ?auto_335886 ?auto_335888 ) ) ( not ( = ?auto_335886 ?auto_335889 ) ) ( not ( = ?auto_335886 ?auto_335890 ) ) ( not ( = ?auto_335886 ?auto_335891 ) ) ( not ( = ?auto_335886 ?auto_335892 ) ) ( not ( = ?auto_335887 ?auto_335888 ) ) ( not ( = ?auto_335887 ?auto_335889 ) ) ( not ( = ?auto_335887 ?auto_335890 ) ) ( not ( = ?auto_335887 ?auto_335891 ) ) ( not ( = ?auto_335887 ?auto_335892 ) ) ( not ( = ?auto_335888 ?auto_335889 ) ) ( not ( = ?auto_335888 ?auto_335890 ) ) ( not ( = ?auto_335888 ?auto_335891 ) ) ( not ( = ?auto_335888 ?auto_335892 ) ) ( not ( = ?auto_335889 ?auto_335890 ) ) ( not ( = ?auto_335889 ?auto_335891 ) ) ( not ( = ?auto_335889 ?auto_335892 ) ) ( not ( = ?auto_335890 ?auto_335891 ) ) ( not ( = ?auto_335890 ?auto_335892 ) ) ( not ( = ?auto_335891 ?auto_335892 ) ) ( ON ?auto_335890 ?auto_335891 ) ( CLEAR ?auto_335888 ) ( ON ?auto_335889 ?auto_335890 ) ( CLEAR ?auto_335889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_335883 ?auto_335884 ?auto_335885 ?auto_335886 ?auto_335887 ?auto_335888 ?auto_335889 )
      ( MAKE-9PILE ?auto_335883 ?auto_335884 ?auto_335885 ?auto_335886 ?auto_335887 ?auto_335888 ?auto_335889 ?auto_335890 ?auto_335891 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_335902 - BLOCK
      ?auto_335903 - BLOCK
      ?auto_335904 - BLOCK
      ?auto_335905 - BLOCK
      ?auto_335906 - BLOCK
      ?auto_335907 - BLOCK
      ?auto_335908 - BLOCK
      ?auto_335909 - BLOCK
      ?auto_335910 - BLOCK
    )
    :vars
    (
      ?auto_335911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335910 ?auto_335911 ) ( ON-TABLE ?auto_335902 ) ( ON ?auto_335903 ?auto_335902 ) ( ON ?auto_335904 ?auto_335903 ) ( ON ?auto_335905 ?auto_335904 ) ( ON ?auto_335906 ?auto_335905 ) ( ON ?auto_335907 ?auto_335906 ) ( not ( = ?auto_335902 ?auto_335903 ) ) ( not ( = ?auto_335902 ?auto_335904 ) ) ( not ( = ?auto_335902 ?auto_335905 ) ) ( not ( = ?auto_335902 ?auto_335906 ) ) ( not ( = ?auto_335902 ?auto_335907 ) ) ( not ( = ?auto_335902 ?auto_335908 ) ) ( not ( = ?auto_335902 ?auto_335909 ) ) ( not ( = ?auto_335902 ?auto_335910 ) ) ( not ( = ?auto_335902 ?auto_335911 ) ) ( not ( = ?auto_335903 ?auto_335904 ) ) ( not ( = ?auto_335903 ?auto_335905 ) ) ( not ( = ?auto_335903 ?auto_335906 ) ) ( not ( = ?auto_335903 ?auto_335907 ) ) ( not ( = ?auto_335903 ?auto_335908 ) ) ( not ( = ?auto_335903 ?auto_335909 ) ) ( not ( = ?auto_335903 ?auto_335910 ) ) ( not ( = ?auto_335903 ?auto_335911 ) ) ( not ( = ?auto_335904 ?auto_335905 ) ) ( not ( = ?auto_335904 ?auto_335906 ) ) ( not ( = ?auto_335904 ?auto_335907 ) ) ( not ( = ?auto_335904 ?auto_335908 ) ) ( not ( = ?auto_335904 ?auto_335909 ) ) ( not ( = ?auto_335904 ?auto_335910 ) ) ( not ( = ?auto_335904 ?auto_335911 ) ) ( not ( = ?auto_335905 ?auto_335906 ) ) ( not ( = ?auto_335905 ?auto_335907 ) ) ( not ( = ?auto_335905 ?auto_335908 ) ) ( not ( = ?auto_335905 ?auto_335909 ) ) ( not ( = ?auto_335905 ?auto_335910 ) ) ( not ( = ?auto_335905 ?auto_335911 ) ) ( not ( = ?auto_335906 ?auto_335907 ) ) ( not ( = ?auto_335906 ?auto_335908 ) ) ( not ( = ?auto_335906 ?auto_335909 ) ) ( not ( = ?auto_335906 ?auto_335910 ) ) ( not ( = ?auto_335906 ?auto_335911 ) ) ( not ( = ?auto_335907 ?auto_335908 ) ) ( not ( = ?auto_335907 ?auto_335909 ) ) ( not ( = ?auto_335907 ?auto_335910 ) ) ( not ( = ?auto_335907 ?auto_335911 ) ) ( not ( = ?auto_335908 ?auto_335909 ) ) ( not ( = ?auto_335908 ?auto_335910 ) ) ( not ( = ?auto_335908 ?auto_335911 ) ) ( not ( = ?auto_335909 ?auto_335910 ) ) ( not ( = ?auto_335909 ?auto_335911 ) ) ( not ( = ?auto_335910 ?auto_335911 ) ) ( ON ?auto_335909 ?auto_335910 ) ( CLEAR ?auto_335907 ) ( ON ?auto_335908 ?auto_335909 ) ( CLEAR ?auto_335908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_335902 ?auto_335903 ?auto_335904 ?auto_335905 ?auto_335906 ?auto_335907 ?auto_335908 )
      ( MAKE-9PILE ?auto_335902 ?auto_335903 ?auto_335904 ?auto_335905 ?auto_335906 ?auto_335907 ?auto_335908 ?auto_335909 ?auto_335910 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_335921 - BLOCK
      ?auto_335922 - BLOCK
      ?auto_335923 - BLOCK
      ?auto_335924 - BLOCK
      ?auto_335925 - BLOCK
      ?auto_335926 - BLOCK
      ?auto_335927 - BLOCK
      ?auto_335928 - BLOCK
      ?auto_335929 - BLOCK
    )
    :vars
    (
      ?auto_335930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335929 ?auto_335930 ) ( ON-TABLE ?auto_335921 ) ( ON ?auto_335922 ?auto_335921 ) ( ON ?auto_335923 ?auto_335922 ) ( ON ?auto_335924 ?auto_335923 ) ( ON ?auto_335925 ?auto_335924 ) ( not ( = ?auto_335921 ?auto_335922 ) ) ( not ( = ?auto_335921 ?auto_335923 ) ) ( not ( = ?auto_335921 ?auto_335924 ) ) ( not ( = ?auto_335921 ?auto_335925 ) ) ( not ( = ?auto_335921 ?auto_335926 ) ) ( not ( = ?auto_335921 ?auto_335927 ) ) ( not ( = ?auto_335921 ?auto_335928 ) ) ( not ( = ?auto_335921 ?auto_335929 ) ) ( not ( = ?auto_335921 ?auto_335930 ) ) ( not ( = ?auto_335922 ?auto_335923 ) ) ( not ( = ?auto_335922 ?auto_335924 ) ) ( not ( = ?auto_335922 ?auto_335925 ) ) ( not ( = ?auto_335922 ?auto_335926 ) ) ( not ( = ?auto_335922 ?auto_335927 ) ) ( not ( = ?auto_335922 ?auto_335928 ) ) ( not ( = ?auto_335922 ?auto_335929 ) ) ( not ( = ?auto_335922 ?auto_335930 ) ) ( not ( = ?auto_335923 ?auto_335924 ) ) ( not ( = ?auto_335923 ?auto_335925 ) ) ( not ( = ?auto_335923 ?auto_335926 ) ) ( not ( = ?auto_335923 ?auto_335927 ) ) ( not ( = ?auto_335923 ?auto_335928 ) ) ( not ( = ?auto_335923 ?auto_335929 ) ) ( not ( = ?auto_335923 ?auto_335930 ) ) ( not ( = ?auto_335924 ?auto_335925 ) ) ( not ( = ?auto_335924 ?auto_335926 ) ) ( not ( = ?auto_335924 ?auto_335927 ) ) ( not ( = ?auto_335924 ?auto_335928 ) ) ( not ( = ?auto_335924 ?auto_335929 ) ) ( not ( = ?auto_335924 ?auto_335930 ) ) ( not ( = ?auto_335925 ?auto_335926 ) ) ( not ( = ?auto_335925 ?auto_335927 ) ) ( not ( = ?auto_335925 ?auto_335928 ) ) ( not ( = ?auto_335925 ?auto_335929 ) ) ( not ( = ?auto_335925 ?auto_335930 ) ) ( not ( = ?auto_335926 ?auto_335927 ) ) ( not ( = ?auto_335926 ?auto_335928 ) ) ( not ( = ?auto_335926 ?auto_335929 ) ) ( not ( = ?auto_335926 ?auto_335930 ) ) ( not ( = ?auto_335927 ?auto_335928 ) ) ( not ( = ?auto_335927 ?auto_335929 ) ) ( not ( = ?auto_335927 ?auto_335930 ) ) ( not ( = ?auto_335928 ?auto_335929 ) ) ( not ( = ?auto_335928 ?auto_335930 ) ) ( not ( = ?auto_335929 ?auto_335930 ) ) ( ON ?auto_335928 ?auto_335929 ) ( ON ?auto_335927 ?auto_335928 ) ( CLEAR ?auto_335925 ) ( ON ?auto_335926 ?auto_335927 ) ( CLEAR ?auto_335926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_335921 ?auto_335922 ?auto_335923 ?auto_335924 ?auto_335925 ?auto_335926 )
      ( MAKE-9PILE ?auto_335921 ?auto_335922 ?auto_335923 ?auto_335924 ?auto_335925 ?auto_335926 ?auto_335927 ?auto_335928 ?auto_335929 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_335940 - BLOCK
      ?auto_335941 - BLOCK
      ?auto_335942 - BLOCK
      ?auto_335943 - BLOCK
      ?auto_335944 - BLOCK
      ?auto_335945 - BLOCK
      ?auto_335946 - BLOCK
      ?auto_335947 - BLOCK
      ?auto_335948 - BLOCK
    )
    :vars
    (
      ?auto_335949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335948 ?auto_335949 ) ( ON-TABLE ?auto_335940 ) ( ON ?auto_335941 ?auto_335940 ) ( ON ?auto_335942 ?auto_335941 ) ( ON ?auto_335943 ?auto_335942 ) ( ON ?auto_335944 ?auto_335943 ) ( not ( = ?auto_335940 ?auto_335941 ) ) ( not ( = ?auto_335940 ?auto_335942 ) ) ( not ( = ?auto_335940 ?auto_335943 ) ) ( not ( = ?auto_335940 ?auto_335944 ) ) ( not ( = ?auto_335940 ?auto_335945 ) ) ( not ( = ?auto_335940 ?auto_335946 ) ) ( not ( = ?auto_335940 ?auto_335947 ) ) ( not ( = ?auto_335940 ?auto_335948 ) ) ( not ( = ?auto_335940 ?auto_335949 ) ) ( not ( = ?auto_335941 ?auto_335942 ) ) ( not ( = ?auto_335941 ?auto_335943 ) ) ( not ( = ?auto_335941 ?auto_335944 ) ) ( not ( = ?auto_335941 ?auto_335945 ) ) ( not ( = ?auto_335941 ?auto_335946 ) ) ( not ( = ?auto_335941 ?auto_335947 ) ) ( not ( = ?auto_335941 ?auto_335948 ) ) ( not ( = ?auto_335941 ?auto_335949 ) ) ( not ( = ?auto_335942 ?auto_335943 ) ) ( not ( = ?auto_335942 ?auto_335944 ) ) ( not ( = ?auto_335942 ?auto_335945 ) ) ( not ( = ?auto_335942 ?auto_335946 ) ) ( not ( = ?auto_335942 ?auto_335947 ) ) ( not ( = ?auto_335942 ?auto_335948 ) ) ( not ( = ?auto_335942 ?auto_335949 ) ) ( not ( = ?auto_335943 ?auto_335944 ) ) ( not ( = ?auto_335943 ?auto_335945 ) ) ( not ( = ?auto_335943 ?auto_335946 ) ) ( not ( = ?auto_335943 ?auto_335947 ) ) ( not ( = ?auto_335943 ?auto_335948 ) ) ( not ( = ?auto_335943 ?auto_335949 ) ) ( not ( = ?auto_335944 ?auto_335945 ) ) ( not ( = ?auto_335944 ?auto_335946 ) ) ( not ( = ?auto_335944 ?auto_335947 ) ) ( not ( = ?auto_335944 ?auto_335948 ) ) ( not ( = ?auto_335944 ?auto_335949 ) ) ( not ( = ?auto_335945 ?auto_335946 ) ) ( not ( = ?auto_335945 ?auto_335947 ) ) ( not ( = ?auto_335945 ?auto_335948 ) ) ( not ( = ?auto_335945 ?auto_335949 ) ) ( not ( = ?auto_335946 ?auto_335947 ) ) ( not ( = ?auto_335946 ?auto_335948 ) ) ( not ( = ?auto_335946 ?auto_335949 ) ) ( not ( = ?auto_335947 ?auto_335948 ) ) ( not ( = ?auto_335947 ?auto_335949 ) ) ( not ( = ?auto_335948 ?auto_335949 ) ) ( ON ?auto_335947 ?auto_335948 ) ( ON ?auto_335946 ?auto_335947 ) ( CLEAR ?auto_335944 ) ( ON ?auto_335945 ?auto_335946 ) ( CLEAR ?auto_335945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_335940 ?auto_335941 ?auto_335942 ?auto_335943 ?auto_335944 ?auto_335945 )
      ( MAKE-9PILE ?auto_335940 ?auto_335941 ?auto_335942 ?auto_335943 ?auto_335944 ?auto_335945 ?auto_335946 ?auto_335947 ?auto_335948 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_335959 - BLOCK
      ?auto_335960 - BLOCK
      ?auto_335961 - BLOCK
      ?auto_335962 - BLOCK
      ?auto_335963 - BLOCK
      ?auto_335964 - BLOCK
      ?auto_335965 - BLOCK
      ?auto_335966 - BLOCK
      ?auto_335967 - BLOCK
    )
    :vars
    (
      ?auto_335968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335967 ?auto_335968 ) ( ON-TABLE ?auto_335959 ) ( ON ?auto_335960 ?auto_335959 ) ( ON ?auto_335961 ?auto_335960 ) ( ON ?auto_335962 ?auto_335961 ) ( not ( = ?auto_335959 ?auto_335960 ) ) ( not ( = ?auto_335959 ?auto_335961 ) ) ( not ( = ?auto_335959 ?auto_335962 ) ) ( not ( = ?auto_335959 ?auto_335963 ) ) ( not ( = ?auto_335959 ?auto_335964 ) ) ( not ( = ?auto_335959 ?auto_335965 ) ) ( not ( = ?auto_335959 ?auto_335966 ) ) ( not ( = ?auto_335959 ?auto_335967 ) ) ( not ( = ?auto_335959 ?auto_335968 ) ) ( not ( = ?auto_335960 ?auto_335961 ) ) ( not ( = ?auto_335960 ?auto_335962 ) ) ( not ( = ?auto_335960 ?auto_335963 ) ) ( not ( = ?auto_335960 ?auto_335964 ) ) ( not ( = ?auto_335960 ?auto_335965 ) ) ( not ( = ?auto_335960 ?auto_335966 ) ) ( not ( = ?auto_335960 ?auto_335967 ) ) ( not ( = ?auto_335960 ?auto_335968 ) ) ( not ( = ?auto_335961 ?auto_335962 ) ) ( not ( = ?auto_335961 ?auto_335963 ) ) ( not ( = ?auto_335961 ?auto_335964 ) ) ( not ( = ?auto_335961 ?auto_335965 ) ) ( not ( = ?auto_335961 ?auto_335966 ) ) ( not ( = ?auto_335961 ?auto_335967 ) ) ( not ( = ?auto_335961 ?auto_335968 ) ) ( not ( = ?auto_335962 ?auto_335963 ) ) ( not ( = ?auto_335962 ?auto_335964 ) ) ( not ( = ?auto_335962 ?auto_335965 ) ) ( not ( = ?auto_335962 ?auto_335966 ) ) ( not ( = ?auto_335962 ?auto_335967 ) ) ( not ( = ?auto_335962 ?auto_335968 ) ) ( not ( = ?auto_335963 ?auto_335964 ) ) ( not ( = ?auto_335963 ?auto_335965 ) ) ( not ( = ?auto_335963 ?auto_335966 ) ) ( not ( = ?auto_335963 ?auto_335967 ) ) ( not ( = ?auto_335963 ?auto_335968 ) ) ( not ( = ?auto_335964 ?auto_335965 ) ) ( not ( = ?auto_335964 ?auto_335966 ) ) ( not ( = ?auto_335964 ?auto_335967 ) ) ( not ( = ?auto_335964 ?auto_335968 ) ) ( not ( = ?auto_335965 ?auto_335966 ) ) ( not ( = ?auto_335965 ?auto_335967 ) ) ( not ( = ?auto_335965 ?auto_335968 ) ) ( not ( = ?auto_335966 ?auto_335967 ) ) ( not ( = ?auto_335966 ?auto_335968 ) ) ( not ( = ?auto_335967 ?auto_335968 ) ) ( ON ?auto_335966 ?auto_335967 ) ( ON ?auto_335965 ?auto_335966 ) ( ON ?auto_335964 ?auto_335965 ) ( CLEAR ?auto_335962 ) ( ON ?auto_335963 ?auto_335964 ) ( CLEAR ?auto_335963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_335959 ?auto_335960 ?auto_335961 ?auto_335962 ?auto_335963 )
      ( MAKE-9PILE ?auto_335959 ?auto_335960 ?auto_335961 ?auto_335962 ?auto_335963 ?auto_335964 ?auto_335965 ?auto_335966 ?auto_335967 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_335978 - BLOCK
      ?auto_335979 - BLOCK
      ?auto_335980 - BLOCK
      ?auto_335981 - BLOCK
      ?auto_335982 - BLOCK
      ?auto_335983 - BLOCK
      ?auto_335984 - BLOCK
      ?auto_335985 - BLOCK
      ?auto_335986 - BLOCK
    )
    :vars
    (
      ?auto_335987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335986 ?auto_335987 ) ( ON-TABLE ?auto_335978 ) ( ON ?auto_335979 ?auto_335978 ) ( ON ?auto_335980 ?auto_335979 ) ( ON ?auto_335981 ?auto_335980 ) ( not ( = ?auto_335978 ?auto_335979 ) ) ( not ( = ?auto_335978 ?auto_335980 ) ) ( not ( = ?auto_335978 ?auto_335981 ) ) ( not ( = ?auto_335978 ?auto_335982 ) ) ( not ( = ?auto_335978 ?auto_335983 ) ) ( not ( = ?auto_335978 ?auto_335984 ) ) ( not ( = ?auto_335978 ?auto_335985 ) ) ( not ( = ?auto_335978 ?auto_335986 ) ) ( not ( = ?auto_335978 ?auto_335987 ) ) ( not ( = ?auto_335979 ?auto_335980 ) ) ( not ( = ?auto_335979 ?auto_335981 ) ) ( not ( = ?auto_335979 ?auto_335982 ) ) ( not ( = ?auto_335979 ?auto_335983 ) ) ( not ( = ?auto_335979 ?auto_335984 ) ) ( not ( = ?auto_335979 ?auto_335985 ) ) ( not ( = ?auto_335979 ?auto_335986 ) ) ( not ( = ?auto_335979 ?auto_335987 ) ) ( not ( = ?auto_335980 ?auto_335981 ) ) ( not ( = ?auto_335980 ?auto_335982 ) ) ( not ( = ?auto_335980 ?auto_335983 ) ) ( not ( = ?auto_335980 ?auto_335984 ) ) ( not ( = ?auto_335980 ?auto_335985 ) ) ( not ( = ?auto_335980 ?auto_335986 ) ) ( not ( = ?auto_335980 ?auto_335987 ) ) ( not ( = ?auto_335981 ?auto_335982 ) ) ( not ( = ?auto_335981 ?auto_335983 ) ) ( not ( = ?auto_335981 ?auto_335984 ) ) ( not ( = ?auto_335981 ?auto_335985 ) ) ( not ( = ?auto_335981 ?auto_335986 ) ) ( not ( = ?auto_335981 ?auto_335987 ) ) ( not ( = ?auto_335982 ?auto_335983 ) ) ( not ( = ?auto_335982 ?auto_335984 ) ) ( not ( = ?auto_335982 ?auto_335985 ) ) ( not ( = ?auto_335982 ?auto_335986 ) ) ( not ( = ?auto_335982 ?auto_335987 ) ) ( not ( = ?auto_335983 ?auto_335984 ) ) ( not ( = ?auto_335983 ?auto_335985 ) ) ( not ( = ?auto_335983 ?auto_335986 ) ) ( not ( = ?auto_335983 ?auto_335987 ) ) ( not ( = ?auto_335984 ?auto_335985 ) ) ( not ( = ?auto_335984 ?auto_335986 ) ) ( not ( = ?auto_335984 ?auto_335987 ) ) ( not ( = ?auto_335985 ?auto_335986 ) ) ( not ( = ?auto_335985 ?auto_335987 ) ) ( not ( = ?auto_335986 ?auto_335987 ) ) ( ON ?auto_335985 ?auto_335986 ) ( ON ?auto_335984 ?auto_335985 ) ( ON ?auto_335983 ?auto_335984 ) ( CLEAR ?auto_335981 ) ( ON ?auto_335982 ?auto_335983 ) ( CLEAR ?auto_335982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_335978 ?auto_335979 ?auto_335980 ?auto_335981 ?auto_335982 )
      ( MAKE-9PILE ?auto_335978 ?auto_335979 ?auto_335980 ?auto_335981 ?auto_335982 ?auto_335983 ?auto_335984 ?auto_335985 ?auto_335986 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_335997 - BLOCK
      ?auto_335998 - BLOCK
      ?auto_335999 - BLOCK
      ?auto_336000 - BLOCK
      ?auto_336001 - BLOCK
      ?auto_336002 - BLOCK
      ?auto_336003 - BLOCK
      ?auto_336004 - BLOCK
      ?auto_336005 - BLOCK
    )
    :vars
    (
      ?auto_336006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336005 ?auto_336006 ) ( ON-TABLE ?auto_335997 ) ( ON ?auto_335998 ?auto_335997 ) ( ON ?auto_335999 ?auto_335998 ) ( not ( = ?auto_335997 ?auto_335998 ) ) ( not ( = ?auto_335997 ?auto_335999 ) ) ( not ( = ?auto_335997 ?auto_336000 ) ) ( not ( = ?auto_335997 ?auto_336001 ) ) ( not ( = ?auto_335997 ?auto_336002 ) ) ( not ( = ?auto_335997 ?auto_336003 ) ) ( not ( = ?auto_335997 ?auto_336004 ) ) ( not ( = ?auto_335997 ?auto_336005 ) ) ( not ( = ?auto_335997 ?auto_336006 ) ) ( not ( = ?auto_335998 ?auto_335999 ) ) ( not ( = ?auto_335998 ?auto_336000 ) ) ( not ( = ?auto_335998 ?auto_336001 ) ) ( not ( = ?auto_335998 ?auto_336002 ) ) ( not ( = ?auto_335998 ?auto_336003 ) ) ( not ( = ?auto_335998 ?auto_336004 ) ) ( not ( = ?auto_335998 ?auto_336005 ) ) ( not ( = ?auto_335998 ?auto_336006 ) ) ( not ( = ?auto_335999 ?auto_336000 ) ) ( not ( = ?auto_335999 ?auto_336001 ) ) ( not ( = ?auto_335999 ?auto_336002 ) ) ( not ( = ?auto_335999 ?auto_336003 ) ) ( not ( = ?auto_335999 ?auto_336004 ) ) ( not ( = ?auto_335999 ?auto_336005 ) ) ( not ( = ?auto_335999 ?auto_336006 ) ) ( not ( = ?auto_336000 ?auto_336001 ) ) ( not ( = ?auto_336000 ?auto_336002 ) ) ( not ( = ?auto_336000 ?auto_336003 ) ) ( not ( = ?auto_336000 ?auto_336004 ) ) ( not ( = ?auto_336000 ?auto_336005 ) ) ( not ( = ?auto_336000 ?auto_336006 ) ) ( not ( = ?auto_336001 ?auto_336002 ) ) ( not ( = ?auto_336001 ?auto_336003 ) ) ( not ( = ?auto_336001 ?auto_336004 ) ) ( not ( = ?auto_336001 ?auto_336005 ) ) ( not ( = ?auto_336001 ?auto_336006 ) ) ( not ( = ?auto_336002 ?auto_336003 ) ) ( not ( = ?auto_336002 ?auto_336004 ) ) ( not ( = ?auto_336002 ?auto_336005 ) ) ( not ( = ?auto_336002 ?auto_336006 ) ) ( not ( = ?auto_336003 ?auto_336004 ) ) ( not ( = ?auto_336003 ?auto_336005 ) ) ( not ( = ?auto_336003 ?auto_336006 ) ) ( not ( = ?auto_336004 ?auto_336005 ) ) ( not ( = ?auto_336004 ?auto_336006 ) ) ( not ( = ?auto_336005 ?auto_336006 ) ) ( ON ?auto_336004 ?auto_336005 ) ( ON ?auto_336003 ?auto_336004 ) ( ON ?auto_336002 ?auto_336003 ) ( ON ?auto_336001 ?auto_336002 ) ( CLEAR ?auto_335999 ) ( ON ?auto_336000 ?auto_336001 ) ( CLEAR ?auto_336000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_335997 ?auto_335998 ?auto_335999 ?auto_336000 )
      ( MAKE-9PILE ?auto_335997 ?auto_335998 ?auto_335999 ?auto_336000 ?auto_336001 ?auto_336002 ?auto_336003 ?auto_336004 ?auto_336005 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_336016 - BLOCK
      ?auto_336017 - BLOCK
      ?auto_336018 - BLOCK
      ?auto_336019 - BLOCK
      ?auto_336020 - BLOCK
      ?auto_336021 - BLOCK
      ?auto_336022 - BLOCK
      ?auto_336023 - BLOCK
      ?auto_336024 - BLOCK
    )
    :vars
    (
      ?auto_336025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336024 ?auto_336025 ) ( ON-TABLE ?auto_336016 ) ( ON ?auto_336017 ?auto_336016 ) ( ON ?auto_336018 ?auto_336017 ) ( not ( = ?auto_336016 ?auto_336017 ) ) ( not ( = ?auto_336016 ?auto_336018 ) ) ( not ( = ?auto_336016 ?auto_336019 ) ) ( not ( = ?auto_336016 ?auto_336020 ) ) ( not ( = ?auto_336016 ?auto_336021 ) ) ( not ( = ?auto_336016 ?auto_336022 ) ) ( not ( = ?auto_336016 ?auto_336023 ) ) ( not ( = ?auto_336016 ?auto_336024 ) ) ( not ( = ?auto_336016 ?auto_336025 ) ) ( not ( = ?auto_336017 ?auto_336018 ) ) ( not ( = ?auto_336017 ?auto_336019 ) ) ( not ( = ?auto_336017 ?auto_336020 ) ) ( not ( = ?auto_336017 ?auto_336021 ) ) ( not ( = ?auto_336017 ?auto_336022 ) ) ( not ( = ?auto_336017 ?auto_336023 ) ) ( not ( = ?auto_336017 ?auto_336024 ) ) ( not ( = ?auto_336017 ?auto_336025 ) ) ( not ( = ?auto_336018 ?auto_336019 ) ) ( not ( = ?auto_336018 ?auto_336020 ) ) ( not ( = ?auto_336018 ?auto_336021 ) ) ( not ( = ?auto_336018 ?auto_336022 ) ) ( not ( = ?auto_336018 ?auto_336023 ) ) ( not ( = ?auto_336018 ?auto_336024 ) ) ( not ( = ?auto_336018 ?auto_336025 ) ) ( not ( = ?auto_336019 ?auto_336020 ) ) ( not ( = ?auto_336019 ?auto_336021 ) ) ( not ( = ?auto_336019 ?auto_336022 ) ) ( not ( = ?auto_336019 ?auto_336023 ) ) ( not ( = ?auto_336019 ?auto_336024 ) ) ( not ( = ?auto_336019 ?auto_336025 ) ) ( not ( = ?auto_336020 ?auto_336021 ) ) ( not ( = ?auto_336020 ?auto_336022 ) ) ( not ( = ?auto_336020 ?auto_336023 ) ) ( not ( = ?auto_336020 ?auto_336024 ) ) ( not ( = ?auto_336020 ?auto_336025 ) ) ( not ( = ?auto_336021 ?auto_336022 ) ) ( not ( = ?auto_336021 ?auto_336023 ) ) ( not ( = ?auto_336021 ?auto_336024 ) ) ( not ( = ?auto_336021 ?auto_336025 ) ) ( not ( = ?auto_336022 ?auto_336023 ) ) ( not ( = ?auto_336022 ?auto_336024 ) ) ( not ( = ?auto_336022 ?auto_336025 ) ) ( not ( = ?auto_336023 ?auto_336024 ) ) ( not ( = ?auto_336023 ?auto_336025 ) ) ( not ( = ?auto_336024 ?auto_336025 ) ) ( ON ?auto_336023 ?auto_336024 ) ( ON ?auto_336022 ?auto_336023 ) ( ON ?auto_336021 ?auto_336022 ) ( ON ?auto_336020 ?auto_336021 ) ( CLEAR ?auto_336018 ) ( ON ?auto_336019 ?auto_336020 ) ( CLEAR ?auto_336019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_336016 ?auto_336017 ?auto_336018 ?auto_336019 )
      ( MAKE-9PILE ?auto_336016 ?auto_336017 ?auto_336018 ?auto_336019 ?auto_336020 ?auto_336021 ?auto_336022 ?auto_336023 ?auto_336024 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_336035 - BLOCK
      ?auto_336036 - BLOCK
      ?auto_336037 - BLOCK
      ?auto_336038 - BLOCK
      ?auto_336039 - BLOCK
      ?auto_336040 - BLOCK
      ?auto_336041 - BLOCK
      ?auto_336042 - BLOCK
      ?auto_336043 - BLOCK
    )
    :vars
    (
      ?auto_336044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336043 ?auto_336044 ) ( ON-TABLE ?auto_336035 ) ( ON ?auto_336036 ?auto_336035 ) ( not ( = ?auto_336035 ?auto_336036 ) ) ( not ( = ?auto_336035 ?auto_336037 ) ) ( not ( = ?auto_336035 ?auto_336038 ) ) ( not ( = ?auto_336035 ?auto_336039 ) ) ( not ( = ?auto_336035 ?auto_336040 ) ) ( not ( = ?auto_336035 ?auto_336041 ) ) ( not ( = ?auto_336035 ?auto_336042 ) ) ( not ( = ?auto_336035 ?auto_336043 ) ) ( not ( = ?auto_336035 ?auto_336044 ) ) ( not ( = ?auto_336036 ?auto_336037 ) ) ( not ( = ?auto_336036 ?auto_336038 ) ) ( not ( = ?auto_336036 ?auto_336039 ) ) ( not ( = ?auto_336036 ?auto_336040 ) ) ( not ( = ?auto_336036 ?auto_336041 ) ) ( not ( = ?auto_336036 ?auto_336042 ) ) ( not ( = ?auto_336036 ?auto_336043 ) ) ( not ( = ?auto_336036 ?auto_336044 ) ) ( not ( = ?auto_336037 ?auto_336038 ) ) ( not ( = ?auto_336037 ?auto_336039 ) ) ( not ( = ?auto_336037 ?auto_336040 ) ) ( not ( = ?auto_336037 ?auto_336041 ) ) ( not ( = ?auto_336037 ?auto_336042 ) ) ( not ( = ?auto_336037 ?auto_336043 ) ) ( not ( = ?auto_336037 ?auto_336044 ) ) ( not ( = ?auto_336038 ?auto_336039 ) ) ( not ( = ?auto_336038 ?auto_336040 ) ) ( not ( = ?auto_336038 ?auto_336041 ) ) ( not ( = ?auto_336038 ?auto_336042 ) ) ( not ( = ?auto_336038 ?auto_336043 ) ) ( not ( = ?auto_336038 ?auto_336044 ) ) ( not ( = ?auto_336039 ?auto_336040 ) ) ( not ( = ?auto_336039 ?auto_336041 ) ) ( not ( = ?auto_336039 ?auto_336042 ) ) ( not ( = ?auto_336039 ?auto_336043 ) ) ( not ( = ?auto_336039 ?auto_336044 ) ) ( not ( = ?auto_336040 ?auto_336041 ) ) ( not ( = ?auto_336040 ?auto_336042 ) ) ( not ( = ?auto_336040 ?auto_336043 ) ) ( not ( = ?auto_336040 ?auto_336044 ) ) ( not ( = ?auto_336041 ?auto_336042 ) ) ( not ( = ?auto_336041 ?auto_336043 ) ) ( not ( = ?auto_336041 ?auto_336044 ) ) ( not ( = ?auto_336042 ?auto_336043 ) ) ( not ( = ?auto_336042 ?auto_336044 ) ) ( not ( = ?auto_336043 ?auto_336044 ) ) ( ON ?auto_336042 ?auto_336043 ) ( ON ?auto_336041 ?auto_336042 ) ( ON ?auto_336040 ?auto_336041 ) ( ON ?auto_336039 ?auto_336040 ) ( ON ?auto_336038 ?auto_336039 ) ( CLEAR ?auto_336036 ) ( ON ?auto_336037 ?auto_336038 ) ( CLEAR ?auto_336037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_336035 ?auto_336036 ?auto_336037 )
      ( MAKE-9PILE ?auto_336035 ?auto_336036 ?auto_336037 ?auto_336038 ?auto_336039 ?auto_336040 ?auto_336041 ?auto_336042 ?auto_336043 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_336054 - BLOCK
      ?auto_336055 - BLOCK
      ?auto_336056 - BLOCK
      ?auto_336057 - BLOCK
      ?auto_336058 - BLOCK
      ?auto_336059 - BLOCK
      ?auto_336060 - BLOCK
      ?auto_336061 - BLOCK
      ?auto_336062 - BLOCK
    )
    :vars
    (
      ?auto_336063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336062 ?auto_336063 ) ( ON-TABLE ?auto_336054 ) ( ON ?auto_336055 ?auto_336054 ) ( not ( = ?auto_336054 ?auto_336055 ) ) ( not ( = ?auto_336054 ?auto_336056 ) ) ( not ( = ?auto_336054 ?auto_336057 ) ) ( not ( = ?auto_336054 ?auto_336058 ) ) ( not ( = ?auto_336054 ?auto_336059 ) ) ( not ( = ?auto_336054 ?auto_336060 ) ) ( not ( = ?auto_336054 ?auto_336061 ) ) ( not ( = ?auto_336054 ?auto_336062 ) ) ( not ( = ?auto_336054 ?auto_336063 ) ) ( not ( = ?auto_336055 ?auto_336056 ) ) ( not ( = ?auto_336055 ?auto_336057 ) ) ( not ( = ?auto_336055 ?auto_336058 ) ) ( not ( = ?auto_336055 ?auto_336059 ) ) ( not ( = ?auto_336055 ?auto_336060 ) ) ( not ( = ?auto_336055 ?auto_336061 ) ) ( not ( = ?auto_336055 ?auto_336062 ) ) ( not ( = ?auto_336055 ?auto_336063 ) ) ( not ( = ?auto_336056 ?auto_336057 ) ) ( not ( = ?auto_336056 ?auto_336058 ) ) ( not ( = ?auto_336056 ?auto_336059 ) ) ( not ( = ?auto_336056 ?auto_336060 ) ) ( not ( = ?auto_336056 ?auto_336061 ) ) ( not ( = ?auto_336056 ?auto_336062 ) ) ( not ( = ?auto_336056 ?auto_336063 ) ) ( not ( = ?auto_336057 ?auto_336058 ) ) ( not ( = ?auto_336057 ?auto_336059 ) ) ( not ( = ?auto_336057 ?auto_336060 ) ) ( not ( = ?auto_336057 ?auto_336061 ) ) ( not ( = ?auto_336057 ?auto_336062 ) ) ( not ( = ?auto_336057 ?auto_336063 ) ) ( not ( = ?auto_336058 ?auto_336059 ) ) ( not ( = ?auto_336058 ?auto_336060 ) ) ( not ( = ?auto_336058 ?auto_336061 ) ) ( not ( = ?auto_336058 ?auto_336062 ) ) ( not ( = ?auto_336058 ?auto_336063 ) ) ( not ( = ?auto_336059 ?auto_336060 ) ) ( not ( = ?auto_336059 ?auto_336061 ) ) ( not ( = ?auto_336059 ?auto_336062 ) ) ( not ( = ?auto_336059 ?auto_336063 ) ) ( not ( = ?auto_336060 ?auto_336061 ) ) ( not ( = ?auto_336060 ?auto_336062 ) ) ( not ( = ?auto_336060 ?auto_336063 ) ) ( not ( = ?auto_336061 ?auto_336062 ) ) ( not ( = ?auto_336061 ?auto_336063 ) ) ( not ( = ?auto_336062 ?auto_336063 ) ) ( ON ?auto_336061 ?auto_336062 ) ( ON ?auto_336060 ?auto_336061 ) ( ON ?auto_336059 ?auto_336060 ) ( ON ?auto_336058 ?auto_336059 ) ( ON ?auto_336057 ?auto_336058 ) ( CLEAR ?auto_336055 ) ( ON ?auto_336056 ?auto_336057 ) ( CLEAR ?auto_336056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_336054 ?auto_336055 ?auto_336056 )
      ( MAKE-9PILE ?auto_336054 ?auto_336055 ?auto_336056 ?auto_336057 ?auto_336058 ?auto_336059 ?auto_336060 ?auto_336061 ?auto_336062 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_336073 - BLOCK
      ?auto_336074 - BLOCK
      ?auto_336075 - BLOCK
      ?auto_336076 - BLOCK
      ?auto_336077 - BLOCK
      ?auto_336078 - BLOCK
      ?auto_336079 - BLOCK
      ?auto_336080 - BLOCK
      ?auto_336081 - BLOCK
    )
    :vars
    (
      ?auto_336082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336081 ?auto_336082 ) ( ON-TABLE ?auto_336073 ) ( not ( = ?auto_336073 ?auto_336074 ) ) ( not ( = ?auto_336073 ?auto_336075 ) ) ( not ( = ?auto_336073 ?auto_336076 ) ) ( not ( = ?auto_336073 ?auto_336077 ) ) ( not ( = ?auto_336073 ?auto_336078 ) ) ( not ( = ?auto_336073 ?auto_336079 ) ) ( not ( = ?auto_336073 ?auto_336080 ) ) ( not ( = ?auto_336073 ?auto_336081 ) ) ( not ( = ?auto_336073 ?auto_336082 ) ) ( not ( = ?auto_336074 ?auto_336075 ) ) ( not ( = ?auto_336074 ?auto_336076 ) ) ( not ( = ?auto_336074 ?auto_336077 ) ) ( not ( = ?auto_336074 ?auto_336078 ) ) ( not ( = ?auto_336074 ?auto_336079 ) ) ( not ( = ?auto_336074 ?auto_336080 ) ) ( not ( = ?auto_336074 ?auto_336081 ) ) ( not ( = ?auto_336074 ?auto_336082 ) ) ( not ( = ?auto_336075 ?auto_336076 ) ) ( not ( = ?auto_336075 ?auto_336077 ) ) ( not ( = ?auto_336075 ?auto_336078 ) ) ( not ( = ?auto_336075 ?auto_336079 ) ) ( not ( = ?auto_336075 ?auto_336080 ) ) ( not ( = ?auto_336075 ?auto_336081 ) ) ( not ( = ?auto_336075 ?auto_336082 ) ) ( not ( = ?auto_336076 ?auto_336077 ) ) ( not ( = ?auto_336076 ?auto_336078 ) ) ( not ( = ?auto_336076 ?auto_336079 ) ) ( not ( = ?auto_336076 ?auto_336080 ) ) ( not ( = ?auto_336076 ?auto_336081 ) ) ( not ( = ?auto_336076 ?auto_336082 ) ) ( not ( = ?auto_336077 ?auto_336078 ) ) ( not ( = ?auto_336077 ?auto_336079 ) ) ( not ( = ?auto_336077 ?auto_336080 ) ) ( not ( = ?auto_336077 ?auto_336081 ) ) ( not ( = ?auto_336077 ?auto_336082 ) ) ( not ( = ?auto_336078 ?auto_336079 ) ) ( not ( = ?auto_336078 ?auto_336080 ) ) ( not ( = ?auto_336078 ?auto_336081 ) ) ( not ( = ?auto_336078 ?auto_336082 ) ) ( not ( = ?auto_336079 ?auto_336080 ) ) ( not ( = ?auto_336079 ?auto_336081 ) ) ( not ( = ?auto_336079 ?auto_336082 ) ) ( not ( = ?auto_336080 ?auto_336081 ) ) ( not ( = ?auto_336080 ?auto_336082 ) ) ( not ( = ?auto_336081 ?auto_336082 ) ) ( ON ?auto_336080 ?auto_336081 ) ( ON ?auto_336079 ?auto_336080 ) ( ON ?auto_336078 ?auto_336079 ) ( ON ?auto_336077 ?auto_336078 ) ( ON ?auto_336076 ?auto_336077 ) ( ON ?auto_336075 ?auto_336076 ) ( CLEAR ?auto_336073 ) ( ON ?auto_336074 ?auto_336075 ) ( CLEAR ?auto_336074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_336073 ?auto_336074 )
      ( MAKE-9PILE ?auto_336073 ?auto_336074 ?auto_336075 ?auto_336076 ?auto_336077 ?auto_336078 ?auto_336079 ?auto_336080 ?auto_336081 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_336092 - BLOCK
      ?auto_336093 - BLOCK
      ?auto_336094 - BLOCK
      ?auto_336095 - BLOCK
      ?auto_336096 - BLOCK
      ?auto_336097 - BLOCK
      ?auto_336098 - BLOCK
      ?auto_336099 - BLOCK
      ?auto_336100 - BLOCK
    )
    :vars
    (
      ?auto_336101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336100 ?auto_336101 ) ( ON-TABLE ?auto_336092 ) ( not ( = ?auto_336092 ?auto_336093 ) ) ( not ( = ?auto_336092 ?auto_336094 ) ) ( not ( = ?auto_336092 ?auto_336095 ) ) ( not ( = ?auto_336092 ?auto_336096 ) ) ( not ( = ?auto_336092 ?auto_336097 ) ) ( not ( = ?auto_336092 ?auto_336098 ) ) ( not ( = ?auto_336092 ?auto_336099 ) ) ( not ( = ?auto_336092 ?auto_336100 ) ) ( not ( = ?auto_336092 ?auto_336101 ) ) ( not ( = ?auto_336093 ?auto_336094 ) ) ( not ( = ?auto_336093 ?auto_336095 ) ) ( not ( = ?auto_336093 ?auto_336096 ) ) ( not ( = ?auto_336093 ?auto_336097 ) ) ( not ( = ?auto_336093 ?auto_336098 ) ) ( not ( = ?auto_336093 ?auto_336099 ) ) ( not ( = ?auto_336093 ?auto_336100 ) ) ( not ( = ?auto_336093 ?auto_336101 ) ) ( not ( = ?auto_336094 ?auto_336095 ) ) ( not ( = ?auto_336094 ?auto_336096 ) ) ( not ( = ?auto_336094 ?auto_336097 ) ) ( not ( = ?auto_336094 ?auto_336098 ) ) ( not ( = ?auto_336094 ?auto_336099 ) ) ( not ( = ?auto_336094 ?auto_336100 ) ) ( not ( = ?auto_336094 ?auto_336101 ) ) ( not ( = ?auto_336095 ?auto_336096 ) ) ( not ( = ?auto_336095 ?auto_336097 ) ) ( not ( = ?auto_336095 ?auto_336098 ) ) ( not ( = ?auto_336095 ?auto_336099 ) ) ( not ( = ?auto_336095 ?auto_336100 ) ) ( not ( = ?auto_336095 ?auto_336101 ) ) ( not ( = ?auto_336096 ?auto_336097 ) ) ( not ( = ?auto_336096 ?auto_336098 ) ) ( not ( = ?auto_336096 ?auto_336099 ) ) ( not ( = ?auto_336096 ?auto_336100 ) ) ( not ( = ?auto_336096 ?auto_336101 ) ) ( not ( = ?auto_336097 ?auto_336098 ) ) ( not ( = ?auto_336097 ?auto_336099 ) ) ( not ( = ?auto_336097 ?auto_336100 ) ) ( not ( = ?auto_336097 ?auto_336101 ) ) ( not ( = ?auto_336098 ?auto_336099 ) ) ( not ( = ?auto_336098 ?auto_336100 ) ) ( not ( = ?auto_336098 ?auto_336101 ) ) ( not ( = ?auto_336099 ?auto_336100 ) ) ( not ( = ?auto_336099 ?auto_336101 ) ) ( not ( = ?auto_336100 ?auto_336101 ) ) ( ON ?auto_336099 ?auto_336100 ) ( ON ?auto_336098 ?auto_336099 ) ( ON ?auto_336097 ?auto_336098 ) ( ON ?auto_336096 ?auto_336097 ) ( ON ?auto_336095 ?auto_336096 ) ( ON ?auto_336094 ?auto_336095 ) ( CLEAR ?auto_336092 ) ( ON ?auto_336093 ?auto_336094 ) ( CLEAR ?auto_336093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_336092 ?auto_336093 )
      ( MAKE-9PILE ?auto_336092 ?auto_336093 ?auto_336094 ?auto_336095 ?auto_336096 ?auto_336097 ?auto_336098 ?auto_336099 ?auto_336100 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_336111 - BLOCK
      ?auto_336112 - BLOCK
      ?auto_336113 - BLOCK
      ?auto_336114 - BLOCK
      ?auto_336115 - BLOCK
      ?auto_336116 - BLOCK
      ?auto_336117 - BLOCK
      ?auto_336118 - BLOCK
      ?auto_336119 - BLOCK
    )
    :vars
    (
      ?auto_336120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336119 ?auto_336120 ) ( not ( = ?auto_336111 ?auto_336112 ) ) ( not ( = ?auto_336111 ?auto_336113 ) ) ( not ( = ?auto_336111 ?auto_336114 ) ) ( not ( = ?auto_336111 ?auto_336115 ) ) ( not ( = ?auto_336111 ?auto_336116 ) ) ( not ( = ?auto_336111 ?auto_336117 ) ) ( not ( = ?auto_336111 ?auto_336118 ) ) ( not ( = ?auto_336111 ?auto_336119 ) ) ( not ( = ?auto_336111 ?auto_336120 ) ) ( not ( = ?auto_336112 ?auto_336113 ) ) ( not ( = ?auto_336112 ?auto_336114 ) ) ( not ( = ?auto_336112 ?auto_336115 ) ) ( not ( = ?auto_336112 ?auto_336116 ) ) ( not ( = ?auto_336112 ?auto_336117 ) ) ( not ( = ?auto_336112 ?auto_336118 ) ) ( not ( = ?auto_336112 ?auto_336119 ) ) ( not ( = ?auto_336112 ?auto_336120 ) ) ( not ( = ?auto_336113 ?auto_336114 ) ) ( not ( = ?auto_336113 ?auto_336115 ) ) ( not ( = ?auto_336113 ?auto_336116 ) ) ( not ( = ?auto_336113 ?auto_336117 ) ) ( not ( = ?auto_336113 ?auto_336118 ) ) ( not ( = ?auto_336113 ?auto_336119 ) ) ( not ( = ?auto_336113 ?auto_336120 ) ) ( not ( = ?auto_336114 ?auto_336115 ) ) ( not ( = ?auto_336114 ?auto_336116 ) ) ( not ( = ?auto_336114 ?auto_336117 ) ) ( not ( = ?auto_336114 ?auto_336118 ) ) ( not ( = ?auto_336114 ?auto_336119 ) ) ( not ( = ?auto_336114 ?auto_336120 ) ) ( not ( = ?auto_336115 ?auto_336116 ) ) ( not ( = ?auto_336115 ?auto_336117 ) ) ( not ( = ?auto_336115 ?auto_336118 ) ) ( not ( = ?auto_336115 ?auto_336119 ) ) ( not ( = ?auto_336115 ?auto_336120 ) ) ( not ( = ?auto_336116 ?auto_336117 ) ) ( not ( = ?auto_336116 ?auto_336118 ) ) ( not ( = ?auto_336116 ?auto_336119 ) ) ( not ( = ?auto_336116 ?auto_336120 ) ) ( not ( = ?auto_336117 ?auto_336118 ) ) ( not ( = ?auto_336117 ?auto_336119 ) ) ( not ( = ?auto_336117 ?auto_336120 ) ) ( not ( = ?auto_336118 ?auto_336119 ) ) ( not ( = ?auto_336118 ?auto_336120 ) ) ( not ( = ?auto_336119 ?auto_336120 ) ) ( ON ?auto_336118 ?auto_336119 ) ( ON ?auto_336117 ?auto_336118 ) ( ON ?auto_336116 ?auto_336117 ) ( ON ?auto_336115 ?auto_336116 ) ( ON ?auto_336114 ?auto_336115 ) ( ON ?auto_336113 ?auto_336114 ) ( ON ?auto_336112 ?auto_336113 ) ( ON ?auto_336111 ?auto_336112 ) ( CLEAR ?auto_336111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_336111 )
      ( MAKE-9PILE ?auto_336111 ?auto_336112 ?auto_336113 ?auto_336114 ?auto_336115 ?auto_336116 ?auto_336117 ?auto_336118 ?auto_336119 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_336130 - BLOCK
      ?auto_336131 - BLOCK
      ?auto_336132 - BLOCK
      ?auto_336133 - BLOCK
      ?auto_336134 - BLOCK
      ?auto_336135 - BLOCK
      ?auto_336136 - BLOCK
      ?auto_336137 - BLOCK
      ?auto_336138 - BLOCK
    )
    :vars
    (
      ?auto_336139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336138 ?auto_336139 ) ( not ( = ?auto_336130 ?auto_336131 ) ) ( not ( = ?auto_336130 ?auto_336132 ) ) ( not ( = ?auto_336130 ?auto_336133 ) ) ( not ( = ?auto_336130 ?auto_336134 ) ) ( not ( = ?auto_336130 ?auto_336135 ) ) ( not ( = ?auto_336130 ?auto_336136 ) ) ( not ( = ?auto_336130 ?auto_336137 ) ) ( not ( = ?auto_336130 ?auto_336138 ) ) ( not ( = ?auto_336130 ?auto_336139 ) ) ( not ( = ?auto_336131 ?auto_336132 ) ) ( not ( = ?auto_336131 ?auto_336133 ) ) ( not ( = ?auto_336131 ?auto_336134 ) ) ( not ( = ?auto_336131 ?auto_336135 ) ) ( not ( = ?auto_336131 ?auto_336136 ) ) ( not ( = ?auto_336131 ?auto_336137 ) ) ( not ( = ?auto_336131 ?auto_336138 ) ) ( not ( = ?auto_336131 ?auto_336139 ) ) ( not ( = ?auto_336132 ?auto_336133 ) ) ( not ( = ?auto_336132 ?auto_336134 ) ) ( not ( = ?auto_336132 ?auto_336135 ) ) ( not ( = ?auto_336132 ?auto_336136 ) ) ( not ( = ?auto_336132 ?auto_336137 ) ) ( not ( = ?auto_336132 ?auto_336138 ) ) ( not ( = ?auto_336132 ?auto_336139 ) ) ( not ( = ?auto_336133 ?auto_336134 ) ) ( not ( = ?auto_336133 ?auto_336135 ) ) ( not ( = ?auto_336133 ?auto_336136 ) ) ( not ( = ?auto_336133 ?auto_336137 ) ) ( not ( = ?auto_336133 ?auto_336138 ) ) ( not ( = ?auto_336133 ?auto_336139 ) ) ( not ( = ?auto_336134 ?auto_336135 ) ) ( not ( = ?auto_336134 ?auto_336136 ) ) ( not ( = ?auto_336134 ?auto_336137 ) ) ( not ( = ?auto_336134 ?auto_336138 ) ) ( not ( = ?auto_336134 ?auto_336139 ) ) ( not ( = ?auto_336135 ?auto_336136 ) ) ( not ( = ?auto_336135 ?auto_336137 ) ) ( not ( = ?auto_336135 ?auto_336138 ) ) ( not ( = ?auto_336135 ?auto_336139 ) ) ( not ( = ?auto_336136 ?auto_336137 ) ) ( not ( = ?auto_336136 ?auto_336138 ) ) ( not ( = ?auto_336136 ?auto_336139 ) ) ( not ( = ?auto_336137 ?auto_336138 ) ) ( not ( = ?auto_336137 ?auto_336139 ) ) ( not ( = ?auto_336138 ?auto_336139 ) ) ( ON ?auto_336137 ?auto_336138 ) ( ON ?auto_336136 ?auto_336137 ) ( ON ?auto_336135 ?auto_336136 ) ( ON ?auto_336134 ?auto_336135 ) ( ON ?auto_336133 ?auto_336134 ) ( ON ?auto_336132 ?auto_336133 ) ( ON ?auto_336131 ?auto_336132 ) ( ON ?auto_336130 ?auto_336131 ) ( CLEAR ?auto_336130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_336130 )
      ( MAKE-9PILE ?auto_336130 ?auto_336131 ?auto_336132 ?auto_336133 ?auto_336134 ?auto_336135 ?auto_336136 ?auto_336137 ?auto_336138 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336150 - BLOCK
      ?auto_336151 - BLOCK
      ?auto_336152 - BLOCK
      ?auto_336153 - BLOCK
      ?auto_336154 - BLOCK
      ?auto_336155 - BLOCK
      ?auto_336156 - BLOCK
      ?auto_336157 - BLOCK
      ?auto_336158 - BLOCK
      ?auto_336159 - BLOCK
    )
    :vars
    (
      ?auto_336160 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_336158 ) ( ON ?auto_336159 ?auto_336160 ) ( CLEAR ?auto_336159 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_336150 ) ( ON ?auto_336151 ?auto_336150 ) ( ON ?auto_336152 ?auto_336151 ) ( ON ?auto_336153 ?auto_336152 ) ( ON ?auto_336154 ?auto_336153 ) ( ON ?auto_336155 ?auto_336154 ) ( ON ?auto_336156 ?auto_336155 ) ( ON ?auto_336157 ?auto_336156 ) ( ON ?auto_336158 ?auto_336157 ) ( not ( = ?auto_336150 ?auto_336151 ) ) ( not ( = ?auto_336150 ?auto_336152 ) ) ( not ( = ?auto_336150 ?auto_336153 ) ) ( not ( = ?auto_336150 ?auto_336154 ) ) ( not ( = ?auto_336150 ?auto_336155 ) ) ( not ( = ?auto_336150 ?auto_336156 ) ) ( not ( = ?auto_336150 ?auto_336157 ) ) ( not ( = ?auto_336150 ?auto_336158 ) ) ( not ( = ?auto_336150 ?auto_336159 ) ) ( not ( = ?auto_336150 ?auto_336160 ) ) ( not ( = ?auto_336151 ?auto_336152 ) ) ( not ( = ?auto_336151 ?auto_336153 ) ) ( not ( = ?auto_336151 ?auto_336154 ) ) ( not ( = ?auto_336151 ?auto_336155 ) ) ( not ( = ?auto_336151 ?auto_336156 ) ) ( not ( = ?auto_336151 ?auto_336157 ) ) ( not ( = ?auto_336151 ?auto_336158 ) ) ( not ( = ?auto_336151 ?auto_336159 ) ) ( not ( = ?auto_336151 ?auto_336160 ) ) ( not ( = ?auto_336152 ?auto_336153 ) ) ( not ( = ?auto_336152 ?auto_336154 ) ) ( not ( = ?auto_336152 ?auto_336155 ) ) ( not ( = ?auto_336152 ?auto_336156 ) ) ( not ( = ?auto_336152 ?auto_336157 ) ) ( not ( = ?auto_336152 ?auto_336158 ) ) ( not ( = ?auto_336152 ?auto_336159 ) ) ( not ( = ?auto_336152 ?auto_336160 ) ) ( not ( = ?auto_336153 ?auto_336154 ) ) ( not ( = ?auto_336153 ?auto_336155 ) ) ( not ( = ?auto_336153 ?auto_336156 ) ) ( not ( = ?auto_336153 ?auto_336157 ) ) ( not ( = ?auto_336153 ?auto_336158 ) ) ( not ( = ?auto_336153 ?auto_336159 ) ) ( not ( = ?auto_336153 ?auto_336160 ) ) ( not ( = ?auto_336154 ?auto_336155 ) ) ( not ( = ?auto_336154 ?auto_336156 ) ) ( not ( = ?auto_336154 ?auto_336157 ) ) ( not ( = ?auto_336154 ?auto_336158 ) ) ( not ( = ?auto_336154 ?auto_336159 ) ) ( not ( = ?auto_336154 ?auto_336160 ) ) ( not ( = ?auto_336155 ?auto_336156 ) ) ( not ( = ?auto_336155 ?auto_336157 ) ) ( not ( = ?auto_336155 ?auto_336158 ) ) ( not ( = ?auto_336155 ?auto_336159 ) ) ( not ( = ?auto_336155 ?auto_336160 ) ) ( not ( = ?auto_336156 ?auto_336157 ) ) ( not ( = ?auto_336156 ?auto_336158 ) ) ( not ( = ?auto_336156 ?auto_336159 ) ) ( not ( = ?auto_336156 ?auto_336160 ) ) ( not ( = ?auto_336157 ?auto_336158 ) ) ( not ( = ?auto_336157 ?auto_336159 ) ) ( not ( = ?auto_336157 ?auto_336160 ) ) ( not ( = ?auto_336158 ?auto_336159 ) ) ( not ( = ?auto_336158 ?auto_336160 ) ) ( not ( = ?auto_336159 ?auto_336160 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_336159 ?auto_336160 )
      ( !STACK ?auto_336159 ?auto_336158 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336171 - BLOCK
      ?auto_336172 - BLOCK
      ?auto_336173 - BLOCK
      ?auto_336174 - BLOCK
      ?auto_336175 - BLOCK
      ?auto_336176 - BLOCK
      ?auto_336177 - BLOCK
      ?auto_336178 - BLOCK
      ?auto_336179 - BLOCK
      ?auto_336180 - BLOCK
    )
    :vars
    (
      ?auto_336181 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_336179 ) ( ON ?auto_336180 ?auto_336181 ) ( CLEAR ?auto_336180 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_336171 ) ( ON ?auto_336172 ?auto_336171 ) ( ON ?auto_336173 ?auto_336172 ) ( ON ?auto_336174 ?auto_336173 ) ( ON ?auto_336175 ?auto_336174 ) ( ON ?auto_336176 ?auto_336175 ) ( ON ?auto_336177 ?auto_336176 ) ( ON ?auto_336178 ?auto_336177 ) ( ON ?auto_336179 ?auto_336178 ) ( not ( = ?auto_336171 ?auto_336172 ) ) ( not ( = ?auto_336171 ?auto_336173 ) ) ( not ( = ?auto_336171 ?auto_336174 ) ) ( not ( = ?auto_336171 ?auto_336175 ) ) ( not ( = ?auto_336171 ?auto_336176 ) ) ( not ( = ?auto_336171 ?auto_336177 ) ) ( not ( = ?auto_336171 ?auto_336178 ) ) ( not ( = ?auto_336171 ?auto_336179 ) ) ( not ( = ?auto_336171 ?auto_336180 ) ) ( not ( = ?auto_336171 ?auto_336181 ) ) ( not ( = ?auto_336172 ?auto_336173 ) ) ( not ( = ?auto_336172 ?auto_336174 ) ) ( not ( = ?auto_336172 ?auto_336175 ) ) ( not ( = ?auto_336172 ?auto_336176 ) ) ( not ( = ?auto_336172 ?auto_336177 ) ) ( not ( = ?auto_336172 ?auto_336178 ) ) ( not ( = ?auto_336172 ?auto_336179 ) ) ( not ( = ?auto_336172 ?auto_336180 ) ) ( not ( = ?auto_336172 ?auto_336181 ) ) ( not ( = ?auto_336173 ?auto_336174 ) ) ( not ( = ?auto_336173 ?auto_336175 ) ) ( not ( = ?auto_336173 ?auto_336176 ) ) ( not ( = ?auto_336173 ?auto_336177 ) ) ( not ( = ?auto_336173 ?auto_336178 ) ) ( not ( = ?auto_336173 ?auto_336179 ) ) ( not ( = ?auto_336173 ?auto_336180 ) ) ( not ( = ?auto_336173 ?auto_336181 ) ) ( not ( = ?auto_336174 ?auto_336175 ) ) ( not ( = ?auto_336174 ?auto_336176 ) ) ( not ( = ?auto_336174 ?auto_336177 ) ) ( not ( = ?auto_336174 ?auto_336178 ) ) ( not ( = ?auto_336174 ?auto_336179 ) ) ( not ( = ?auto_336174 ?auto_336180 ) ) ( not ( = ?auto_336174 ?auto_336181 ) ) ( not ( = ?auto_336175 ?auto_336176 ) ) ( not ( = ?auto_336175 ?auto_336177 ) ) ( not ( = ?auto_336175 ?auto_336178 ) ) ( not ( = ?auto_336175 ?auto_336179 ) ) ( not ( = ?auto_336175 ?auto_336180 ) ) ( not ( = ?auto_336175 ?auto_336181 ) ) ( not ( = ?auto_336176 ?auto_336177 ) ) ( not ( = ?auto_336176 ?auto_336178 ) ) ( not ( = ?auto_336176 ?auto_336179 ) ) ( not ( = ?auto_336176 ?auto_336180 ) ) ( not ( = ?auto_336176 ?auto_336181 ) ) ( not ( = ?auto_336177 ?auto_336178 ) ) ( not ( = ?auto_336177 ?auto_336179 ) ) ( not ( = ?auto_336177 ?auto_336180 ) ) ( not ( = ?auto_336177 ?auto_336181 ) ) ( not ( = ?auto_336178 ?auto_336179 ) ) ( not ( = ?auto_336178 ?auto_336180 ) ) ( not ( = ?auto_336178 ?auto_336181 ) ) ( not ( = ?auto_336179 ?auto_336180 ) ) ( not ( = ?auto_336179 ?auto_336181 ) ) ( not ( = ?auto_336180 ?auto_336181 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_336180 ?auto_336181 )
      ( !STACK ?auto_336180 ?auto_336179 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336192 - BLOCK
      ?auto_336193 - BLOCK
      ?auto_336194 - BLOCK
      ?auto_336195 - BLOCK
      ?auto_336196 - BLOCK
      ?auto_336197 - BLOCK
      ?auto_336198 - BLOCK
      ?auto_336199 - BLOCK
      ?auto_336200 - BLOCK
      ?auto_336201 - BLOCK
    )
    :vars
    (
      ?auto_336202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336201 ?auto_336202 ) ( ON-TABLE ?auto_336192 ) ( ON ?auto_336193 ?auto_336192 ) ( ON ?auto_336194 ?auto_336193 ) ( ON ?auto_336195 ?auto_336194 ) ( ON ?auto_336196 ?auto_336195 ) ( ON ?auto_336197 ?auto_336196 ) ( ON ?auto_336198 ?auto_336197 ) ( ON ?auto_336199 ?auto_336198 ) ( not ( = ?auto_336192 ?auto_336193 ) ) ( not ( = ?auto_336192 ?auto_336194 ) ) ( not ( = ?auto_336192 ?auto_336195 ) ) ( not ( = ?auto_336192 ?auto_336196 ) ) ( not ( = ?auto_336192 ?auto_336197 ) ) ( not ( = ?auto_336192 ?auto_336198 ) ) ( not ( = ?auto_336192 ?auto_336199 ) ) ( not ( = ?auto_336192 ?auto_336200 ) ) ( not ( = ?auto_336192 ?auto_336201 ) ) ( not ( = ?auto_336192 ?auto_336202 ) ) ( not ( = ?auto_336193 ?auto_336194 ) ) ( not ( = ?auto_336193 ?auto_336195 ) ) ( not ( = ?auto_336193 ?auto_336196 ) ) ( not ( = ?auto_336193 ?auto_336197 ) ) ( not ( = ?auto_336193 ?auto_336198 ) ) ( not ( = ?auto_336193 ?auto_336199 ) ) ( not ( = ?auto_336193 ?auto_336200 ) ) ( not ( = ?auto_336193 ?auto_336201 ) ) ( not ( = ?auto_336193 ?auto_336202 ) ) ( not ( = ?auto_336194 ?auto_336195 ) ) ( not ( = ?auto_336194 ?auto_336196 ) ) ( not ( = ?auto_336194 ?auto_336197 ) ) ( not ( = ?auto_336194 ?auto_336198 ) ) ( not ( = ?auto_336194 ?auto_336199 ) ) ( not ( = ?auto_336194 ?auto_336200 ) ) ( not ( = ?auto_336194 ?auto_336201 ) ) ( not ( = ?auto_336194 ?auto_336202 ) ) ( not ( = ?auto_336195 ?auto_336196 ) ) ( not ( = ?auto_336195 ?auto_336197 ) ) ( not ( = ?auto_336195 ?auto_336198 ) ) ( not ( = ?auto_336195 ?auto_336199 ) ) ( not ( = ?auto_336195 ?auto_336200 ) ) ( not ( = ?auto_336195 ?auto_336201 ) ) ( not ( = ?auto_336195 ?auto_336202 ) ) ( not ( = ?auto_336196 ?auto_336197 ) ) ( not ( = ?auto_336196 ?auto_336198 ) ) ( not ( = ?auto_336196 ?auto_336199 ) ) ( not ( = ?auto_336196 ?auto_336200 ) ) ( not ( = ?auto_336196 ?auto_336201 ) ) ( not ( = ?auto_336196 ?auto_336202 ) ) ( not ( = ?auto_336197 ?auto_336198 ) ) ( not ( = ?auto_336197 ?auto_336199 ) ) ( not ( = ?auto_336197 ?auto_336200 ) ) ( not ( = ?auto_336197 ?auto_336201 ) ) ( not ( = ?auto_336197 ?auto_336202 ) ) ( not ( = ?auto_336198 ?auto_336199 ) ) ( not ( = ?auto_336198 ?auto_336200 ) ) ( not ( = ?auto_336198 ?auto_336201 ) ) ( not ( = ?auto_336198 ?auto_336202 ) ) ( not ( = ?auto_336199 ?auto_336200 ) ) ( not ( = ?auto_336199 ?auto_336201 ) ) ( not ( = ?auto_336199 ?auto_336202 ) ) ( not ( = ?auto_336200 ?auto_336201 ) ) ( not ( = ?auto_336200 ?auto_336202 ) ) ( not ( = ?auto_336201 ?auto_336202 ) ) ( CLEAR ?auto_336199 ) ( ON ?auto_336200 ?auto_336201 ) ( CLEAR ?auto_336200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_336192 ?auto_336193 ?auto_336194 ?auto_336195 ?auto_336196 ?auto_336197 ?auto_336198 ?auto_336199 ?auto_336200 )
      ( MAKE-10PILE ?auto_336192 ?auto_336193 ?auto_336194 ?auto_336195 ?auto_336196 ?auto_336197 ?auto_336198 ?auto_336199 ?auto_336200 ?auto_336201 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336213 - BLOCK
      ?auto_336214 - BLOCK
      ?auto_336215 - BLOCK
      ?auto_336216 - BLOCK
      ?auto_336217 - BLOCK
      ?auto_336218 - BLOCK
      ?auto_336219 - BLOCK
      ?auto_336220 - BLOCK
      ?auto_336221 - BLOCK
      ?auto_336222 - BLOCK
    )
    :vars
    (
      ?auto_336223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336222 ?auto_336223 ) ( ON-TABLE ?auto_336213 ) ( ON ?auto_336214 ?auto_336213 ) ( ON ?auto_336215 ?auto_336214 ) ( ON ?auto_336216 ?auto_336215 ) ( ON ?auto_336217 ?auto_336216 ) ( ON ?auto_336218 ?auto_336217 ) ( ON ?auto_336219 ?auto_336218 ) ( ON ?auto_336220 ?auto_336219 ) ( not ( = ?auto_336213 ?auto_336214 ) ) ( not ( = ?auto_336213 ?auto_336215 ) ) ( not ( = ?auto_336213 ?auto_336216 ) ) ( not ( = ?auto_336213 ?auto_336217 ) ) ( not ( = ?auto_336213 ?auto_336218 ) ) ( not ( = ?auto_336213 ?auto_336219 ) ) ( not ( = ?auto_336213 ?auto_336220 ) ) ( not ( = ?auto_336213 ?auto_336221 ) ) ( not ( = ?auto_336213 ?auto_336222 ) ) ( not ( = ?auto_336213 ?auto_336223 ) ) ( not ( = ?auto_336214 ?auto_336215 ) ) ( not ( = ?auto_336214 ?auto_336216 ) ) ( not ( = ?auto_336214 ?auto_336217 ) ) ( not ( = ?auto_336214 ?auto_336218 ) ) ( not ( = ?auto_336214 ?auto_336219 ) ) ( not ( = ?auto_336214 ?auto_336220 ) ) ( not ( = ?auto_336214 ?auto_336221 ) ) ( not ( = ?auto_336214 ?auto_336222 ) ) ( not ( = ?auto_336214 ?auto_336223 ) ) ( not ( = ?auto_336215 ?auto_336216 ) ) ( not ( = ?auto_336215 ?auto_336217 ) ) ( not ( = ?auto_336215 ?auto_336218 ) ) ( not ( = ?auto_336215 ?auto_336219 ) ) ( not ( = ?auto_336215 ?auto_336220 ) ) ( not ( = ?auto_336215 ?auto_336221 ) ) ( not ( = ?auto_336215 ?auto_336222 ) ) ( not ( = ?auto_336215 ?auto_336223 ) ) ( not ( = ?auto_336216 ?auto_336217 ) ) ( not ( = ?auto_336216 ?auto_336218 ) ) ( not ( = ?auto_336216 ?auto_336219 ) ) ( not ( = ?auto_336216 ?auto_336220 ) ) ( not ( = ?auto_336216 ?auto_336221 ) ) ( not ( = ?auto_336216 ?auto_336222 ) ) ( not ( = ?auto_336216 ?auto_336223 ) ) ( not ( = ?auto_336217 ?auto_336218 ) ) ( not ( = ?auto_336217 ?auto_336219 ) ) ( not ( = ?auto_336217 ?auto_336220 ) ) ( not ( = ?auto_336217 ?auto_336221 ) ) ( not ( = ?auto_336217 ?auto_336222 ) ) ( not ( = ?auto_336217 ?auto_336223 ) ) ( not ( = ?auto_336218 ?auto_336219 ) ) ( not ( = ?auto_336218 ?auto_336220 ) ) ( not ( = ?auto_336218 ?auto_336221 ) ) ( not ( = ?auto_336218 ?auto_336222 ) ) ( not ( = ?auto_336218 ?auto_336223 ) ) ( not ( = ?auto_336219 ?auto_336220 ) ) ( not ( = ?auto_336219 ?auto_336221 ) ) ( not ( = ?auto_336219 ?auto_336222 ) ) ( not ( = ?auto_336219 ?auto_336223 ) ) ( not ( = ?auto_336220 ?auto_336221 ) ) ( not ( = ?auto_336220 ?auto_336222 ) ) ( not ( = ?auto_336220 ?auto_336223 ) ) ( not ( = ?auto_336221 ?auto_336222 ) ) ( not ( = ?auto_336221 ?auto_336223 ) ) ( not ( = ?auto_336222 ?auto_336223 ) ) ( CLEAR ?auto_336220 ) ( ON ?auto_336221 ?auto_336222 ) ( CLEAR ?auto_336221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_336213 ?auto_336214 ?auto_336215 ?auto_336216 ?auto_336217 ?auto_336218 ?auto_336219 ?auto_336220 ?auto_336221 )
      ( MAKE-10PILE ?auto_336213 ?auto_336214 ?auto_336215 ?auto_336216 ?auto_336217 ?auto_336218 ?auto_336219 ?auto_336220 ?auto_336221 ?auto_336222 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336234 - BLOCK
      ?auto_336235 - BLOCK
      ?auto_336236 - BLOCK
      ?auto_336237 - BLOCK
      ?auto_336238 - BLOCK
      ?auto_336239 - BLOCK
      ?auto_336240 - BLOCK
      ?auto_336241 - BLOCK
      ?auto_336242 - BLOCK
      ?auto_336243 - BLOCK
    )
    :vars
    (
      ?auto_336244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336243 ?auto_336244 ) ( ON-TABLE ?auto_336234 ) ( ON ?auto_336235 ?auto_336234 ) ( ON ?auto_336236 ?auto_336235 ) ( ON ?auto_336237 ?auto_336236 ) ( ON ?auto_336238 ?auto_336237 ) ( ON ?auto_336239 ?auto_336238 ) ( ON ?auto_336240 ?auto_336239 ) ( not ( = ?auto_336234 ?auto_336235 ) ) ( not ( = ?auto_336234 ?auto_336236 ) ) ( not ( = ?auto_336234 ?auto_336237 ) ) ( not ( = ?auto_336234 ?auto_336238 ) ) ( not ( = ?auto_336234 ?auto_336239 ) ) ( not ( = ?auto_336234 ?auto_336240 ) ) ( not ( = ?auto_336234 ?auto_336241 ) ) ( not ( = ?auto_336234 ?auto_336242 ) ) ( not ( = ?auto_336234 ?auto_336243 ) ) ( not ( = ?auto_336234 ?auto_336244 ) ) ( not ( = ?auto_336235 ?auto_336236 ) ) ( not ( = ?auto_336235 ?auto_336237 ) ) ( not ( = ?auto_336235 ?auto_336238 ) ) ( not ( = ?auto_336235 ?auto_336239 ) ) ( not ( = ?auto_336235 ?auto_336240 ) ) ( not ( = ?auto_336235 ?auto_336241 ) ) ( not ( = ?auto_336235 ?auto_336242 ) ) ( not ( = ?auto_336235 ?auto_336243 ) ) ( not ( = ?auto_336235 ?auto_336244 ) ) ( not ( = ?auto_336236 ?auto_336237 ) ) ( not ( = ?auto_336236 ?auto_336238 ) ) ( not ( = ?auto_336236 ?auto_336239 ) ) ( not ( = ?auto_336236 ?auto_336240 ) ) ( not ( = ?auto_336236 ?auto_336241 ) ) ( not ( = ?auto_336236 ?auto_336242 ) ) ( not ( = ?auto_336236 ?auto_336243 ) ) ( not ( = ?auto_336236 ?auto_336244 ) ) ( not ( = ?auto_336237 ?auto_336238 ) ) ( not ( = ?auto_336237 ?auto_336239 ) ) ( not ( = ?auto_336237 ?auto_336240 ) ) ( not ( = ?auto_336237 ?auto_336241 ) ) ( not ( = ?auto_336237 ?auto_336242 ) ) ( not ( = ?auto_336237 ?auto_336243 ) ) ( not ( = ?auto_336237 ?auto_336244 ) ) ( not ( = ?auto_336238 ?auto_336239 ) ) ( not ( = ?auto_336238 ?auto_336240 ) ) ( not ( = ?auto_336238 ?auto_336241 ) ) ( not ( = ?auto_336238 ?auto_336242 ) ) ( not ( = ?auto_336238 ?auto_336243 ) ) ( not ( = ?auto_336238 ?auto_336244 ) ) ( not ( = ?auto_336239 ?auto_336240 ) ) ( not ( = ?auto_336239 ?auto_336241 ) ) ( not ( = ?auto_336239 ?auto_336242 ) ) ( not ( = ?auto_336239 ?auto_336243 ) ) ( not ( = ?auto_336239 ?auto_336244 ) ) ( not ( = ?auto_336240 ?auto_336241 ) ) ( not ( = ?auto_336240 ?auto_336242 ) ) ( not ( = ?auto_336240 ?auto_336243 ) ) ( not ( = ?auto_336240 ?auto_336244 ) ) ( not ( = ?auto_336241 ?auto_336242 ) ) ( not ( = ?auto_336241 ?auto_336243 ) ) ( not ( = ?auto_336241 ?auto_336244 ) ) ( not ( = ?auto_336242 ?auto_336243 ) ) ( not ( = ?auto_336242 ?auto_336244 ) ) ( not ( = ?auto_336243 ?auto_336244 ) ) ( ON ?auto_336242 ?auto_336243 ) ( CLEAR ?auto_336240 ) ( ON ?auto_336241 ?auto_336242 ) ( CLEAR ?auto_336241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_336234 ?auto_336235 ?auto_336236 ?auto_336237 ?auto_336238 ?auto_336239 ?auto_336240 ?auto_336241 )
      ( MAKE-10PILE ?auto_336234 ?auto_336235 ?auto_336236 ?auto_336237 ?auto_336238 ?auto_336239 ?auto_336240 ?auto_336241 ?auto_336242 ?auto_336243 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336255 - BLOCK
      ?auto_336256 - BLOCK
      ?auto_336257 - BLOCK
      ?auto_336258 - BLOCK
      ?auto_336259 - BLOCK
      ?auto_336260 - BLOCK
      ?auto_336261 - BLOCK
      ?auto_336262 - BLOCK
      ?auto_336263 - BLOCK
      ?auto_336264 - BLOCK
    )
    :vars
    (
      ?auto_336265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336264 ?auto_336265 ) ( ON-TABLE ?auto_336255 ) ( ON ?auto_336256 ?auto_336255 ) ( ON ?auto_336257 ?auto_336256 ) ( ON ?auto_336258 ?auto_336257 ) ( ON ?auto_336259 ?auto_336258 ) ( ON ?auto_336260 ?auto_336259 ) ( ON ?auto_336261 ?auto_336260 ) ( not ( = ?auto_336255 ?auto_336256 ) ) ( not ( = ?auto_336255 ?auto_336257 ) ) ( not ( = ?auto_336255 ?auto_336258 ) ) ( not ( = ?auto_336255 ?auto_336259 ) ) ( not ( = ?auto_336255 ?auto_336260 ) ) ( not ( = ?auto_336255 ?auto_336261 ) ) ( not ( = ?auto_336255 ?auto_336262 ) ) ( not ( = ?auto_336255 ?auto_336263 ) ) ( not ( = ?auto_336255 ?auto_336264 ) ) ( not ( = ?auto_336255 ?auto_336265 ) ) ( not ( = ?auto_336256 ?auto_336257 ) ) ( not ( = ?auto_336256 ?auto_336258 ) ) ( not ( = ?auto_336256 ?auto_336259 ) ) ( not ( = ?auto_336256 ?auto_336260 ) ) ( not ( = ?auto_336256 ?auto_336261 ) ) ( not ( = ?auto_336256 ?auto_336262 ) ) ( not ( = ?auto_336256 ?auto_336263 ) ) ( not ( = ?auto_336256 ?auto_336264 ) ) ( not ( = ?auto_336256 ?auto_336265 ) ) ( not ( = ?auto_336257 ?auto_336258 ) ) ( not ( = ?auto_336257 ?auto_336259 ) ) ( not ( = ?auto_336257 ?auto_336260 ) ) ( not ( = ?auto_336257 ?auto_336261 ) ) ( not ( = ?auto_336257 ?auto_336262 ) ) ( not ( = ?auto_336257 ?auto_336263 ) ) ( not ( = ?auto_336257 ?auto_336264 ) ) ( not ( = ?auto_336257 ?auto_336265 ) ) ( not ( = ?auto_336258 ?auto_336259 ) ) ( not ( = ?auto_336258 ?auto_336260 ) ) ( not ( = ?auto_336258 ?auto_336261 ) ) ( not ( = ?auto_336258 ?auto_336262 ) ) ( not ( = ?auto_336258 ?auto_336263 ) ) ( not ( = ?auto_336258 ?auto_336264 ) ) ( not ( = ?auto_336258 ?auto_336265 ) ) ( not ( = ?auto_336259 ?auto_336260 ) ) ( not ( = ?auto_336259 ?auto_336261 ) ) ( not ( = ?auto_336259 ?auto_336262 ) ) ( not ( = ?auto_336259 ?auto_336263 ) ) ( not ( = ?auto_336259 ?auto_336264 ) ) ( not ( = ?auto_336259 ?auto_336265 ) ) ( not ( = ?auto_336260 ?auto_336261 ) ) ( not ( = ?auto_336260 ?auto_336262 ) ) ( not ( = ?auto_336260 ?auto_336263 ) ) ( not ( = ?auto_336260 ?auto_336264 ) ) ( not ( = ?auto_336260 ?auto_336265 ) ) ( not ( = ?auto_336261 ?auto_336262 ) ) ( not ( = ?auto_336261 ?auto_336263 ) ) ( not ( = ?auto_336261 ?auto_336264 ) ) ( not ( = ?auto_336261 ?auto_336265 ) ) ( not ( = ?auto_336262 ?auto_336263 ) ) ( not ( = ?auto_336262 ?auto_336264 ) ) ( not ( = ?auto_336262 ?auto_336265 ) ) ( not ( = ?auto_336263 ?auto_336264 ) ) ( not ( = ?auto_336263 ?auto_336265 ) ) ( not ( = ?auto_336264 ?auto_336265 ) ) ( ON ?auto_336263 ?auto_336264 ) ( CLEAR ?auto_336261 ) ( ON ?auto_336262 ?auto_336263 ) ( CLEAR ?auto_336262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_336255 ?auto_336256 ?auto_336257 ?auto_336258 ?auto_336259 ?auto_336260 ?auto_336261 ?auto_336262 )
      ( MAKE-10PILE ?auto_336255 ?auto_336256 ?auto_336257 ?auto_336258 ?auto_336259 ?auto_336260 ?auto_336261 ?auto_336262 ?auto_336263 ?auto_336264 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336276 - BLOCK
      ?auto_336277 - BLOCK
      ?auto_336278 - BLOCK
      ?auto_336279 - BLOCK
      ?auto_336280 - BLOCK
      ?auto_336281 - BLOCK
      ?auto_336282 - BLOCK
      ?auto_336283 - BLOCK
      ?auto_336284 - BLOCK
      ?auto_336285 - BLOCK
    )
    :vars
    (
      ?auto_336286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336285 ?auto_336286 ) ( ON-TABLE ?auto_336276 ) ( ON ?auto_336277 ?auto_336276 ) ( ON ?auto_336278 ?auto_336277 ) ( ON ?auto_336279 ?auto_336278 ) ( ON ?auto_336280 ?auto_336279 ) ( ON ?auto_336281 ?auto_336280 ) ( not ( = ?auto_336276 ?auto_336277 ) ) ( not ( = ?auto_336276 ?auto_336278 ) ) ( not ( = ?auto_336276 ?auto_336279 ) ) ( not ( = ?auto_336276 ?auto_336280 ) ) ( not ( = ?auto_336276 ?auto_336281 ) ) ( not ( = ?auto_336276 ?auto_336282 ) ) ( not ( = ?auto_336276 ?auto_336283 ) ) ( not ( = ?auto_336276 ?auto_336284 ) ) ( not ( = ?auto_336276 ?auto_336285 ) ) ( not ( = ?auto_336276 ?auto_336286 ) ) ( not ( = ?auto_336277 ?auto_336278 ) ) ( not ( = ?auto_336277 ?auto_336279 ) ) ( not ( = ?auto_336277 ?auto_336280 ) ) ( not ( = ?auto_336277 ?auto_336281 ) ) ( not ( = ?auto_336277 ?auto_336282 ) ) ( not ( = ?auto_336277 ?auto_336283 ) ) ( not ( = ?auto_336277 ?auto_336284 ) ) ( not ( = ?auto_336277 ?auto_336285 ) ) ( not ( = ?auto_336277 ?auto_336286 ) ) ( not ( = ?auto_336278 ?auto_336279 ) ) ( not ( = ?auto_336278 ?auto_336280 ) ) ( not ( = ?auto_336278 ?auto_336281 ) ) ( not ( = ?auto_336278 ?auto_336282 ) ) ( not ( = ?auto_336278 ?auto_336283 ) ) ( not ( = ?auto_336278 ?auto_336284 ) ) ( not ( = ?auto_336278 ?auto_336285 ) ) ( not ( = ?auto_336278 ?auto_336286 ) ) ( not ( = ?auto_336279 ?auto_336280 ) ) ( not ( = ?auto_336279 ?auto_336281 ) ) ( not ( = ?auto_336279 ?auto_336282 ) ) ( not ( = ?auto_336279 ?auto_336283 ) ) ( not ( = ?auto_336279 ?auto_336284 ) ) ( not ( = ?auto_336279 ?auto_336285 ) ) ( not ( = ?auto_336279 ?auto_336286 ) ) ( not ( = ?auto_336280 ?auto_336281 ) ) ( not ( = ?auto_336280 ?auto_336282 ) ) ( not ( = ?auto_336280 ?auto_336283 ) ) ( not ( = ?auto_336280 ?auto_336284 ) ) ( not ( = ?auto_336280 ?auto_336285 ) ) ( not ( = ?auto_336280 ?auto_336286 ) ) ( not ( = ?auto_336281 ?auto_336282 ) ) ( not ( = ?auto_336281 ?auto_336283 ) ) ( not ( = ?auto_336281 ?auto_336284 ) ) ( not ( = ?auto_336281 ?auto_336285 ) ) ( not ( = ?auto_336281 ?auto_336286 ) ) ( not ( = ?auto_336282 ?auto_336283 ) ) ( not ( = ?auto_336282 ?auto_336284 ) ) ( not ( = ?auto_336282 ?auto_336285 ) ) ( not ( = ?auto_336282 ?auto_336286 ) ) ( not ( = ?auto_336283 ?auto_336284 ) ) ( not ( = ?auto_336283 ?auto_336285 ) ) ( not ( = ?auto_336283 ?auto_336286 ) ) ( not ( = ?auto_336284 ?auto_336285 ) ) ( not ( = ?auto_336284 ?auto_336286 ) ) ( not ( = ?auto_336285 ?auto_336286 ) ) ( ON ?auto_336284 ?auto_336285 ) ( ON ?auto_336283 ?auto_336284 ) ( CLEAR ?auto_336281 ) ( ON ?auto_336282 ?auto_336283 ) ( CLEAR ?auto_336282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_336276 ?auto_336277 ?auto_336278 ?auto_336279 ?auto_336280 ?auto_336281 ?auto_336282 )
      ( MAKE-10PILE ?auto_336276 ?auto_336277 ?auto_336278 ?auto_336279 ?auto_336280 ?auto_336281 ?auto_336282 ?auto_336283 ?auto_336284 ?auto_336285 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336297 - BLOCK
      ?auto_336298 - BLOCK
      ?auto_336299 - BLOCK
      ?auto_336300 - BLOCK
      ?auto_336301 - BLOCK
      ?auto_336302 - BLOCK
      ?auto_336303 - BLOCK
      ?auto_336304 - BLOCK
      ?auto_336305 - BLOCK
      ?auto_336306 - BLOCK
    )
    :vars
    (
      ?auto_336307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336306 ?auto_336307 ) ( ON-TABLE ?auto_336297 ) ( ON ?auto_336298 ?auto_336297 ) ( ON ?auto_336299 ?auto_336298 ) ( ON ?auto_336300 ?auto_336299 ) ( ON ?auto_336301 ?auto_336300 ) ( ON ?auto_336302 ?auto_336301 ) ( not ( = ?auto_336297 ?auto_336298 ) ) ( not ( = ?auto_336297 ?auto_336299 ) ) ( not ( = ?auto_336297 ?auto_336300 ) ) ( not ( = ?auto_336297 ?auto_336301 ) ) ( not ( = ?auto_336297 ?auto_336302 ) ) ( not ( = ?auto_336297 ?auto_336303 ) ) ( not ( = ?auto_336297 ?auto_336304 ) ) ( not ( = ?auto_336297 ?auto_336305 ) ) ( not ( = ?auto_336297 ?auto_336306 ) ) ( not ( = ?auto_336297 ?auto_336307 ) ) ( not ( = ?auto_336298 ?auto_336299 ) ) ( not ( = ?auto_336298 ?auto_336300 ) ) ( not ( = ?auto_336298 ?auto_336301 ) ) ( not ( = ?auto_336298 ?auto_336302 ) ) ( not ( = ?auto_336298 ?auto_336303 ) ) ( not ( = ?auto_336298 ?auto_336304 ) ) ( not ( = ?auto_336298 ?auto_336305 ) ) ( not ( = ?auto_336298 ?auto_336306 ) ) ( not ( = ?auto_336298 ?auto_336307 ) ) ( not ( = ?auto_336299 ?auto_336300 ) ) ( not ( = ?auto_336299 ?auto_336301 ) ) ( not ( = ?auto_336299 ?auto_336302 ) ) ( not ( = ?auto_336299 ?auto_336303 ) ) ( not ( = ?auto_336299 ?auto_336304 ) ) ( not ( = ?auto_336299 ?auto_336305 ) ) ( not ( = ?auto_336299 ?auto_336306 ) ) ( not ( = ?auto_336299 ?auto_336307 ) ) ( not ( = ?auto_336300 ?auto_336301 ) ) ( not ( = ?auto_336300 ?auto_336302 ) ) ( not ( = ?auto_336300 ?auto_336303 ) ) ( not ( = ?auto_336300 ?auto_336304 ) ) ( not ( = ?auto_336300 ?auto_336305 ) ) ( not ( = ?auto_336300 ?auto_336306 ) ) ( not ( = ?auto_336300 ?auto_336307 ) ) ( not ( = ?auto_336301 ?auto_336302 ) ) ( not ( = ?auto_336301 ?auto_336303 ) ) ( not ( = ?auto_336301 ?auto_336304 ) ) ( not ( = ?auto_336301 ?auto_336305 ) ) ( not ( = ?auto_336301 ?auto_336306 ) ) ( not ( = ?auto_336301 ?auto_336307 ) ) ( not ( = ?auto_336302 ?auto_336303 ) ) ( not ( = ?auto_336302 ?auto_336304 ) ) ( not ( = ?auto_336302 ?auto_336305 ) ) ( not ( = ?auto_336302 ?auto_336306 ) ) ( not ( = ?auto_336302 ?auto_336307 ) ) ( not ( = ?auto_336303 ?auto_336304 ) ) ( not ( = ?auto_336303 ?auto_336305 ) ) ( not ( = ?auto_336303 ?auto_336306 ) ) ( not ( = ?auto_336303 ?auto_336307 ) ) ( not ( = ?auto_336304 ?auto_336305 ) ) ( not ( = ?auto_336304 ?auto_336306 ) ) ( not ( = ?auto_336304 ?auto_336307 ) ) ( not ( = ?auto_336305 ?auto_336306 ) ) ( not ( = ?auto_336305 ?auto_336307 ) ) ( not ( = ?auto_336306 ?auto_336307 ) ) ( ON ?auto_336305 ?auto_336306 ) ( ON ?auto_336304 ?auto_336305 ) ( CLEAR ?auto_336302 ) ( ON ?auto_336303 ?auto_336304 ) ( CLEAR ?auto_336303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_336297 ?auto_336298 ?auto_336299 ?auto_336300 ?auto_336301 ?auto_336302 ?auto_336303 )
      ( MAKE-10PILE ?auto_336297 ?auto_336298 ?auto_336299 ?auto_336300 ?auto_336301 ?auto_336302 ?auto_336303 ?auto_336304 ?auto_336305 ?auto_336306 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336318 - BLOCK
      ?auto_336319 - BLOCK
      ?auto_336320 - BLOCK
      ?auto_336321 - BLOCK
      ?auto_336322 - BLOCK
      ?auto_336323 - BLOCK
      ?auto_336324 - BLOCK
      ?auto_336325 - BLOCK
      ?auto_336326 - BLOCK
      ?auto_336327 - BLOCK
    )
    :vars
    (
      ?auto_336328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336327 ?auto_336328 ) ( ON-TABLE ?auto_336318 ) ( ON ?auto_336319 ?auto_336318 ) ( ON ?auto_336320 ?auto_336319 ) ( ON ?auto_336321 ?auto_336320 ) ( ON ?auto_336322 ?auto_336321 ) ( not ( = ?auto_336318 ?auto_336319 ) ) ( not ( = ?auto_336318 ?auto_336320 ) ) ( not ( = ?auto_336318 ?auto_336321 ) ) ( not ( = ?auto_336318 ?auto_336322 ) ) ( not ( = ?auto_336318 ?auto_336323 ) ) ( not ( = ?auto_336318 ?auto_336324 ) ) ( not ( = ?auto_336318 ?auto_336325 ) ) ( not ( = ?auto_336318 ?auto_336326 ) ) ( not ( = ?auto_336318 ?auto_336327 ) ) ( not ( = ?auto_336318 ?auto_336328 ) ) ( not ( = ?auto_336319 ?auto_336320 ) ) ( not ( = ?auto_336319 ?auto_336321 ) ) ( not ( = ?auto_336319 ?auto_336322 ) ) ( not ( = ?auto_336319 ?auto_336323 ) ) ( not ( = ?auto_336319 ?auto_336324 ) ) ( not ( = ?auto_336319 ?auto_336325 ) ) ( not ( = ?auto_336319 ?auto_336326 ) ) ( not ( = ?auto_336319 ?auto_336327 ) ) ( not ( = ?auto_336319 ?auto_336328 ) ) ( not ( = ?auto_336320 ?auto_336321 ) ) ( not ( = ?auto_336320 ?auto_336322 ) ) ( not ( = ?auto_336320 ?auto_336323 ) ) ( not ( = ?auto_336320 ?auto_336324 ) ) ( not ( = ?auto_336320 ?auto_336325 ) ) ( not ( = ?auto_336320 ?auto_336326 ) ) ( not ( = ?auto_336320 ?auto_336327 ) ) ( not ( = ?auto_336320 ?auto_336328 ) ) ( not ( = ?auto_336321 ?auto_336322 ) ) ( not ( = ?auto_336321 ?auto_336323 ) ) ( not ( = ?auto_336321 ?auto_336324 ) ) ( not ( = ?auto_336321 ?auto_336325 ) ) ( not ( = ?auto_336321 ?auto_336326 ) ) ( not ( = ?auto_336321 ?auto_336327 ) ) ( not ( = ?auto_336321 ?auto_336328 ) ) ( not ( = ?auto_336322 ?auto_336323 ) ) ( not ( = ?auto_336322 ?auto_336324 ) ) ( not ( = ?auto_336322 ?auto_336325 ) ) ( not ( = ?auto_336322 ?auto_336326 ) ) ( not ( = ?auto_336322 ?auto_336327 ) ) ( not ( = ?auto_336322 ?auto_336328 ) ) ( not ( = ?auto_336323 ?auto_336324 ) ) ( not ( = ?auto_336323 ?auto_336325 ) ) ( not ( = ?auto_336323 ?auto_336326 ) ) ( not ( = ?auto_336323 ?auto_336327 ) ) ( not ( = ?auto_336323 ?auto_336328 ) ) ( not ( = ?auto_336324 ?auto_336325 ) ) ( not ( = ?auto_336324 ?auto_336326 ) ) ( not ( = ?auto_336324 ?auto_336327 ) ) ( not ( = ?auto_336324 ?auto_336328 ) ) ( not ( = ?auto_336325 ?auto_336326 ) ) ( not ( = ?auto_336325 ?auto_336327 ) ) ( not ( = ?auto_336325 ?auto_336328 ) ) ( not ( = ?auto_336326 ?auto_336327 ) ) ( not ( = ?auto_336326 ?auto_336328 ) ) ( not ( = ?auto_336327 ?auto_336328 ) ) ( ON ?auto_336326 ?auto_336327 ) ( ON ?auto_336325 ?auto_336326 ) ( ON ?auto_336324 ?auto_336325 ) ( CLEAR ?auto_336322 ) ( ON ?auto_336323 ?auto_336324 ) ( CLEAR ?auto_336323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_336318 ?auto_336319 ?auto_336320 ?auto_336321 ?auto_336322 ?auto_336323 )
      ( MAKE-10PILE ?auto_336318 ?auto_336319 ?auto_336320 ?auto_336321 ?auto_336322 ?auto_336323 ?auto_336324 ?auto_336325 ?auto_336326 ?auto_336327 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336339 - BLOCK
      ?auto_336340 - BLOCK
      ?auto_336341 - BLOCK
      ?auto_336342 - BLOCK
      ?auto_336343 - BLOCK
      ?auto_336344 - BLOCK
      ?auto_336345 - BLOCK
      ?auto_336346 - BLOCK
      ?auto_336347 - BLOCK
      ?auto_336348 - BLOCK
    )
    :vars
    (
      ?auto_336349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336348 ?auto_336349 ) ( ON-TABLE ?auto_336339 ) ( ON ?auto_336340 ?auto_336339 ) ( ON ?auto_336341 ?auto_336340 ) ( ON ?auto_336342 ?auto_336341 ) ( ON ?auto_336343 ?auto_336342 ) ( not ( = ?auto_336339 ?auto_336340 ) ) ( not ( = ?auto_336339 ?auto_336341 ) ) ( not ( = ?auto_336339 ?auto_336342 ) ) ( not ( = ?auto_336339 ?auto_336343 ) ) ( not ( = ?auto_336339 ?auto_336344 ) ) ( not ( = ?auto_336339 ?auto_336345 ) ) ( not ( = ?auto_336339 ?auto_336346 ) ) ( not ( = ?auto_336339 ?auto_336347 ) ) ( not ( = ?auto_336339 ?auto_336348 ) ) ( not ( = ?auto_336339 ?auto_336349 ) ) ( not ( = ?auto_336340 ?auto_336341 ) ) ( not ( = ?auto_336340 ?auto_336342 ) ) ( not ( = ?auto_336340 ?auto_336343 ) ) ( not ( = ?auto_336340 ?auto_336344 ) ) ( not ( = ?auto_336340 ?auto_336345 ) ) ( not ( = ?auto_336340 ?auto_336346 ) ) ( not ( = ?auto_336340 ?auto_336347 ) ) ( not ( = ?auto_336340 ?auto_336348 ) ) ( not ( = ?auto_336340 ?auto_336349 ) ) ( not ( = ?auto_336341 ?auto_336342 ) ) ( not ( = ?auto_336341 ?auto_336343 ) ) ( not ( = ?auto_336341 ?auto_336344 ) ) ( not ( = ?auto_336341 ?auto_336345 ) ) ( not ( = ?auto_336341 ?auto_336346 ) ) ( not ( = ?auto_336341 ?auto_336347 ) ) ( not ( = ?auto_336341 ?auto_336348 ) ) ( not ( = ?auto_336341 ?auto_336349 ) ) ( not ( = ?auto_336342 ?auto_336343 ) ) ( not ( = ?auto_336342 ?auto_336344 ) ) ( not ( = ?auto_336342 ?auto_336345 ) ) ( not ( = ?auto_336342 ?auto_336346 ) ) ( not ( = ?auto_336342 ?auto_336347 ) ) ( not ( = ?auto_336342 ?auto_336348 ) ) ( not ( = ?auto_336342 ?auto_336349 ) ) ( not ( = ?auto_336343 ?auto_336344 ) ) ( not ( = ?auto_336343 ?auto_336345 ) ) ( not ( = ?auto_336343 ?auto_336346 ) ) ( not ( = ?auto_336343 ?auto_336347 ) ) ( not ( = ?auto_336343 ?auto_336348 ) ) ( not ( = ?auto_336343 ?auto_336349 ) ) ( not ( = ?auto_336344 ?auto_336345 ) ) ( not ( = ?auto_336344 ?auto_336346 ) ) ( not ( = ?auto_336344 ?auto_336347 ) ) ( not ( = ?auto_336344 ?auto_336348 ) ) ( not ( = ?auto_336344 ?auto_336349 ) ) ( not ( = ?auto_336345 ?auto_336346 ) ) ( not ( = ?auto_336345 ?auto_336347 ) ) ( not ( = ?auto_336345 ?auto_336348 ) ) ( not ( = ?auto_336345 ?auto_336349 ) ) ( not ( = ?auto_336346 ?auto_336347 ) ) ( not ( = ?auto_336346 ?auto_336348 ) ) ( not ( = ?auto_336346 ?auto_336349 ) ) ( not ( = ?auto_336347 ?auto_336348 ) ) ( not ( = ?auto_336347 ?auto_336349 ) ) ( not ( = ?auto_336348 ?auto_336349 ) ) ( ON ?auto_336347 ?auto_336348 ) ( ON ?auto_336346 ?auto_336347 ) ( ON ?auto_336345 ?auto_336346 ) ( CLEAR ?auto_336343 ) ( ON ?auto_336344 ?auto_336345 ) ( CLEAR ?auto_336344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_336339 ?auto_336340 ?auto_336341 ?auto_336342 ?auto_336343 ?auto_336344 )
      ( MAKE-10PILE ?auto_336339 ?auto_336340 ?auto_336341 ?auto_336342 ?auto_336343 ?auto_336344 ?auto_336345 ?auto_336346 ?auto_336347 ?auto_336348 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336360 - BLOCK
      ?auto_336361 - BLOCK
      ?auto_336362 - BLOCK
      ?auto_336363 - BLOCK
      ?auto_336364 - BLOCK
      ?auto_336365 - BLOCK
      ?auto_336366 - BLOCK
      ?auto_336367 - BLOCK
      ?auto_336368 - BLOCK
      ?auto_336369 - BLOCK
    )
    :vars
    (
      ?auto_336370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336369 ?auto_336370 ) ( ON-TABLE ?auto_336360 ) ( ON ?auto_336361 ?auto_336360 ) ( ON ?auto_336362 ?auto_336361 ) ( ON ?auto_336363 ?auto_336362 ) ( not ( = ?auto_336360 ?auto_336361 ) ) ( not ( = ?auto_336360 ?auto_336362 ) ) ( not ( = ?auto_336360 ?auto_336363 ) ) ( not ( = ?auto_336360 ?auto_336364 ) ) ( not ( = ?auto_336360 ?auto_336365 ) ) ( not ( = ?auto_336360 ?auto_336366 ) ) ( not ( = ?auto_336360 ?auto_336367 ) ) ( not ( = ?auto_336360 ?auto_336368 ) ) ( not ( = ?auto_336360 ?auto_336369 ) ) ( not ( = ?auto_336360 ?auto_336370 ) ) ( not ( = ?auto_336361 ?auto_336362 ) ) ( not ( = ?auto_336361 ?auto_336363 ) ) ( not ( = ?auto_336361 ?auto_336364 ) ) ( not ( = ?auto_336361 ?auto_336365 ) ) ( not ( = ?auto_336361 ?auto_336366 ) ) ( not ( = ?auto_336361 ?auto_336367 ) ) ( not ( = ?auto_336361 ?auto_336368 ) ) ( not ( = ?auto_336361 ?auto_336369 ) ) ( not ( = ?auto_336361 ?auto_336370 ) ) ( not ( = ?auto_336362 ?auto_336363 ) ) ( not ( = ?auto_336362 ?auto_336364 ) ) ( not ( = ?auto_336362 ?auto_336365 ) ) ( not ( = ?auto_336362 ?auto_336366 ) ) ( not ( = ?auto_336362 ?auto_336367 ) ) ( not ( = ?auto_336362 ?auto_336368 ) ) ( not ( = ?auto_336362 ?auto_336369 ) ) ( not ( = ?auto_336362 ?auto_336370 ) ) ( not ( = ?auto_336363 ?auto_336364 ) ) ( not ( = ?auto_336363 ?auto_336365 ) ) ( not ( = ?auto_336363 ?auto_336366 ) ) ( not ( = ?auto_336363 ?auto_336367 ) ) ( not ( = ?auto_336363 ?auto_336368 ) ) ( not ( = ?auto_336363 ?auto_336369 ) ) ( not ( = ?auto_336363 ?auto_336370 ) ) ( not ( = ?auto_336364 ?auto_336365 ) ) ( not ( = ?auto_336364 ?auto_336366 ) ) ( not ( = ?auto_336364 ?auto_336367 ) ) ( not ( = ?auto_336364 ?auto_336368 ) ) ( not ( = ?auto_336364 ?auto_336369 ) ) ( not ( = ?auto_336364 ?auto_336370 ) ) ( not ( = ?auto_336365 ?auto_336366 ) ) ( not ( = ?auto_336365 ?auto_336367 ) ) ( not ( = ?auto_336365 ?auto_336368 ) ) ( not ( = ?auto_336365 ?auto_336369 ) ) ( not ( = ?auto_336365 ?auto_336370 ) ) ( not ( = ?auto_336366 ?auto_336367 ) ) ( not ( = ?auto_336366 ?auto_336368 ) ) ( not ( = ?auto_336366 ?auto_336369 ) ) ( not ( = ?auto_336366 ?auto_336370 ) ) ( not ( = ?auto_336367 ?auto_336368 ) ) ( not ( = ?auto_336367 ?auto_336369 ) ) ( not ( = ?auto_336367 ?auto_336370 ) ) ( not ( = ?auto_336368 ?auto_336369 ) ) ( not ( = ?auto_336368 ?auto_336370 ) ) ( not ( = ?auto_336369 ?auto_336370 ) ) ( ON ?auto_336368 ?auto_336369 ) ( ON ?auto_336367 ?auto_336368 ) ( ON ?auto_336366 ?auto_336367 ) ( ON ?auto_336365 ?auto_336366 ) ( CLEAR ?auto_336363 ) ( ON ?auto_336364 ?auto_336365 ) ( CLEAR ?auto_336364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_336360 ?auto_336361 ?auto_336362 ?auto_336363 ?auto_336364 )
      ( MAKE-10PILE ?auto_336360 ?auto_336361 ?auto_336362 ?auto_336363 ?auto_336364 ?auto_336365 ?auto_336366 ?auto_336367 ?auto_336368 ?auto_336369 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336381 - BLOCK
      ?auto_336382 - BLOCK
      ?auto_336383 - BLOCK
      ?auto_336384 - BLOCK
      ?auto_336385 - BLOCK
      ?auto_336386 - BLOCK
      ?auto_336387 - BLOCK
      ?auto_336388 - BLOCK
      ?auto_336389 - BLOCK
      ?auto_336390 - BLOCK
    )
    :vars
    (
      ?auto_336391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336390 ?auto_336391 ) ( ON-TABLE ?auto_336381 ) ( ON ?auto_336382 ?auto_336381 ) ( ON ?auto_336383 ?auto_336382 ) ( ON ?auto_336384 ?auto_336383 ) ( not ( = ?auto_336381 ?auto_336382 ) ) ( not ( = ?auto_336381 ?auto_336383 ) ) ( not ( = ?auto_336381 ?auto_336384 ) ) ( not ( = ?auto_336381 ?auto_336385 ) ) ( not ( = ?auto_336381 ?auto_336386 ) ) ( not ( = ?auto_336381 ?auto_336387 ) ) ( not ( = ?auto_336381 ?auto_336388 ) ) ( not ( = ?auto_336381 ?auto_336389 ) ) ( not ( = ?auto_336381 ?auto_336390 ) ) ( not ( = ?auto_336381 ?auto_336391 ) ) ( not ( = ?auto_336382 ?auto_336383 ) ) ( not ( = ?auto_336382 ?auto_336384 ) ) ( not ( = ?auto_336382 ?auto_336385 ) ) ( not ( = ?auto_336382 ?auto_336386 ) ) ( not ( = ?auto_336382 ?auto_336387 ) ) ( not ( = ?auto_336382 ?auto_336388 ) ) ( not ( = ?auto_336382 ?auto_336389 ) ) ( not ( = ?auto_336382 ?auto_336390 ) ) ( not ( = ?auto_336382 ?auto_336391 ) ) ( not ( = ?auto_336383 ?auto_336384 ) ) ( not ( = ?auto_336383 ?auto_336385 ) ) ( not ( = ?auto_336383 ?auto_336386 ) ) ( not ( = ?auto_336383 ?auto_336387 ) ) ( not ( = ?auto_336383 ?auto_336388 ) ) ( not ( = ?auto_336383 ?auto_336389 ) ) ( not ( = ?auto_336383 ?auto_336390 ) ) ( not ( = ?auto_336383 ?auto_336391 ) ) ( not ( = ?auto_336384 ?auto_336385 ) ) ( not ( = ?auto_336384 ?auto_336386 ) ) ( not ( = ?auto_336384 ?auto_336387 ) ) ( not ( = ?auto_336384 ?auto_336388 ) ) ( not ( = ?auto_336384 ?auto_336389 ) ) ( not ( = ?auto_336384 ?auto_336390 ) ) ( not ( = ?auto_336384 ?auto_336391 ) ) ( not ( = ?auto_336385 ?auto_336386 ) ) ( not ( = ?auto_336385 ?auto_336387 ) ) ( not ( = ?auto_336385 ?auto_336388 ) ) ( not ( = ?auto_336385 ?auto_336389 ) ) ( not ( = ?auto_336385 ?auto_336390 ) ) ( not ( = ?auto_336385 ?auto_336391 ) ) ( not ( = ?auto_336386 ?auto_336387 ) ) ( not ( = ?auto_336386 ?auto_336388 ) ) ( not ( = ?auto_336386 ?auto_336389 ) ) ( not ( = ?auto_336386 ?auto_336390 ) ) ( not ( = ?auto_336386 ?auto_336391 ) ) ( not ( = ?auto_336387 ?auto_336388 ) ) ( not ( = ?auto_336387 ?auto_336389 ) ) ( not ( = ?auto_336387 ?auto_336390 ) ) ( not ( = ?auto_336387 ?auto_336391 ) ) ( not ( = ?auto_336388 ?auto_336389 ) ) ( not ( = ?auto_336388 ?auto_336390 ) ) ( not ( = ?auto_336388 ?auto_336391 ) ) ( not ( = ?auto_336389 ?auto_336390 ) ) ( not ( = ?auto_336389 ?auto_336391 ) ) ( not ( = ?auto_336390 ?auto_336391 ) ) ( ON ?auto_336389 ?auto_336390 ) ( ON ?auto_336388 ?auto_336389 ) ( ON ?auto_336387 ?auto_336388 ) ( ON ?auto_336386 ?auto_336387 ) ( CLEAR ?auto_336384 ) ( ON ?auto_336385 ?auto_336386 ) ( CLEAR ?auto_336385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_336381 ?auto_336382 ?auto_336383 ?auto_336384 ?auto_336385 )
      ( MAKE-10PILE ?auto_336381 ?auto_336382 ?auto_336383 ?auto_336384 ?auto_336385 ?auto_336386 ?auto_336387 ?auto_336388 ?auto_336389 ?auto_336390 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336402 - BLOCK
      ?auto_336403 - BLOCK
      ?auto_336404 - BLOCK
      ?auto_336405 - BLOCK
      ?auto_336406 - BLOCK
      ?auto_336407 - BLOCK
      ?auto_336408 - BLOCK
      ?auto_336409 - BLOCK
      ?auto_336410 - BLOCK
      ?auto_336411 - BLOCK
    )
    :vars
    (
      ?auto_336412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336411 ?auto_336412 ) ( ON-TABLE ?auto_336402 ) ( ON ?auto_336403 ?auto_336402 ) ( ON ?auto_336404 ?auto_336403 ) ( not ( = ?auto_336402 ?auto_336403 ) ) ( not ( = ?auto_336402 ?auto_336404 ) ) ( not ( = ?auto_336402 ?auto_336405 ) ) ( not ( = ?auto_336402 ?auto_336406 ) ) ( not ( = ?auto_336402 ?auto_336407 ) ) ( not ( = ?auto_336402 ?auto_336408 ) ) ( not ( = ?auto_336402 ?auto_336409 ) ) ( not ( = ?auto_336402 ?auto_336410 ) ) ( not ( = ?auto_336402 ?auto_336411 ) ) ( not ( = ?auto_336402 ?auto_336412 ) ) ( not ( = ?auto_336403 ?auto_336404 ) ) ( not ( = ?auto_336403 ?auto_336405 ) ) ( not ( = ?auto_336403 ?auto_336406 ) ) ( not ( = ?auto_336403 ?auto_336407 ) ) ( not ( = ?auto_336403 ?auto_336408 ) ) ( not ( = ?auto_336403 ?auto_336409 ) ) ( not ( = ?auto_336403 ?auto_336410 ) ) ( not ( = ?auto_336403 ?auto_336411 ) ) ( not ( = ?auto_336403 ?auto_336412 ) ) ( not ( = ?auto_336404 ?auto_336405 ) ) ( not ( = ?auto_336404 ?auto_336406 ) ) ( not ( = ?auto_336404 ?auto_336407 ) ) ( not ( = ?auto_336404 ?auto_336408 ) ) ( not ( = ?auto_336404 ?auto_336409 ) ) ( not ( = ?auto_336404 ?auto_336410 ) ) ( not ( = ?auto_336404 ?auto_336411 ) ) ( not ( = ?auto_336404 ?auto_336412 ) ) ( not ( = ?auto_336405 ?auto_336406 ) ) ( not ( = ?auto_336405 ?auto_336407 ) ) ( not ( = ?auto_336405 ?auto_336408 ) ) ( not ( = ?auto_336405 ?auto_336409 ) ) ( not ( = ?auto_336405 ?auto_336410 ) ) ( not ( = ?auto_336405 ?auto_336411 ) ) ( not ( = ?auto_336405 ?auto_336412 ) ) ( not ( = ?auto_336406 ?auto_336407 ) ) ( not ( = ?auto_336406 ?auto_336408 ) ) ( not ( = ?auto_336406 ?auto_336409 ) ) ( not ( = ?auto_336406 ?auto_336410 ) ) ( not ( = ?auto_336406 ?auto_336411 ) ) ( not ( = ?auto_336406 ?auto_336412 ) ) ( not ( = ?auto_336407 ?auto_336408 ) ) ( not ( = ?auto_336407 ?auto_336409 ) ) ( not ( = ?auto_336407 ?auto_336410 ) ) ( not ( = ?auto_336407 ?auto_336411 ) ) ( not ( = ?auto_336407 ?auto_336412 ) ) ( not ( = ?auto_336408 ?auto_336409 ) ) ( not ( = ?auto_336408 ?auto_336410 ) ) ( not ( = ?auto_336408 ?auto_336411 ) ) ( not ( = ?auto_336408 ?auto_336412 ) ) ( not ( = ?auto_336409 ?auto_336410 ) ) ( not ( = ?auto_336409 ?auto_336411 ) ) ( not ( = ?auto_336409 ?auto_336412 ) ) ( not ( = ?auto_336410 ?auto_336411 ) ) ( not ( = ?auto_336410 ?auto_336412 ) ) ( not ( = ?auto_336411 ?auto_336412 ) ) ( ON ?auto_336410 ?auto_336411 ) ( ON ?auto_336409 ?auto_336410 ) ( ON ?auto_336408 ?auto_336409 ) ( ON ?auto_336407 ?auto_336408 ) ( ON ?auto_336406 ?auto_336407 ) ( CLEAR ?auto_336404 ) ( ON ?auto_336405 ?auto_336406 ) ( CLEAR ?auto_336405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_336402 ?auto_336403 ?auto_336404 ?auto_336405 )
      ( MAKE-10PILE ?auto_336402 ?auto_336403 ?auto_336404 ?auto_336405 ?auto_336406 ?auto_336407 ?auto_336408 ?auto_336409 ?auto_336410 ?auto_336411 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336423 - BLOCK
      ?auto_336424 - BLOCK
      ?auto_336425 - BLOCK
      ?auto_336426 - BLOCK
      ?auto_336427 - BLOCK
      ?auto_336428 - BLOCK
      ?auto_336429 - BLOCK
      ?auto_336430 - BLOCK
      ?auto_336431 - BLOCK
      ?auto_336432 - BLOCK
    )
    :vars
    (
      ?auto_336433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336432 ?auto_336433 ) ( ON-TABLE ?auto_336423 ) ( ON ?auto_336424 ?auto_336423 ) ( ON ?auto_336425 ?auto_336424 ) ( not ( = ?auto_336423 ?auto_336424 ) ) ( not ( = ?auto_336423 ?auto_336425 ) ) ( not ( = ?auto_336423 ?auto_336426 ) ) ( not ( = ?auto_336423 ?auto_336427 ) ) ( not ( = ?auto_336423 ?auto_336428 ) ) ( not ( = ?auto_336423 ?auto_336429 ) ) ( not ( = ?auto_336423 ?auto_336430 ) ) ( not ( = ?auto_336423 ?auto_336431 ) ) ( not ( = ?auto_336423 ?auto_336432 ) ) ( not ( = ?auto_336423 ?auto_336433 ) ) ( not ( = ?auto_336424 ?auto_336425 ) ) ( not ( = ?auto_336424 ?auto_336426 ) ) ( not ( = ?auto_336424 ?auto_336427 ) ) ( not ( = ?auto_336424 ?auto_336428 ) ) ( not ( = ?auto_336424 ?auto_336429 ) ) ( not ( = ?auto_336424 ?auto_336430 ) ) ( not ( = ?auto_336424 ?auto_336431 ) ) ( not ( = ?auto_336424 ?auto_336432 ) ) ( not ( = ?auto_336424 ?auto_336433 ) ) ( not ( = ?auto_336425 ?auto_336426 ) ) ( not ( = ?auto_336425 ?auto_336427 ) ) ( not ( = ?auto_336425 ?auto_336428 ) ) ( not ( = ?auto_336425 ?auto_336429 ) ) ( not ( = ?auto_336425 ?auto_336430 ) ) ( not ( = ?auto_336425 ?auto_336431 ) ) ( not ( = ?auto_336425 ?auto_336432 ) ) ( not ( = ?auto_336425 ?auto_336433 ) ) ( not ( = ?auto_336426 ?auto_336427 ) ) ( not ( = ?auto_336426 ?auto_336428 ) ) ( not ( = ?auto_336426 ?auto_336429 ) ) ( not ( = ?auto_336426 ?auto_336430 ) ) ( not ( = ?auto_336426 ?auto_336431 ) ) ( not ( = ?auto_336426 ?auto_336432 ) ) ( not ( = ?auto_336426 ?auto_336433 ) ) ( not ( = ?auto_336427 ?auto_336428 ) ) ( not ( = ?auto_336427 ?auto_336429 ) ) ( not ( = ?auto_336427 ?auto_336430 ) ) ( not ( = ?auto_336427 ?auto_336431 ) ) ( not ( = ?auto_336427 ?auto_336432 ) ) ( not ( = ?auto_336427 ?auto_336433 ) ) ( not ( = ?auto_336428 ?auto_336429 ) ) ( not ( = ?auto_336428 ?auto_336430 ) ) ( not ( = ?auto_336428 ?auto_336431 ) ) ( not ( = ?auto_336428 ?auto_336432 ) ) ( not ( = ?auto_336428 ?auto_336433 ) ) ( not ( = ?auto_336429 ?auto_336430 ) ) ( not ( = ?auto_336429 ?auto_336431 ) ) ( not ( = ?auto_336429 ?auto_336432 ) ) ( not ( = ?auto_336429 ?auto_336433 ) ) ( not ( = ?auto_336430 ?auto_336431 ) ) ( not ( = ?auto_336430 ?auto_336432 ) ) ( not ( = ?auto_336430 ?auto_336433 ) ) ( not ( = ?auto_336431 ?auto_336432 ) ) ( not ( = ?auto_336431 ?auto_336433 ) ) ( not ( = ?auto_336432 ?auto_336433 ) ) ( ON ?auto_336431 ?auto_336432 ) ( ON ?auto_336430 ?auto_336431 ) ( ON ?auto_336429 ?auto_336430 ) ( ON ?auto_336428 ?auto_336429 ) ( ON ?auto_336427 ?auto_336428 ) ( CLEAR ?auto_336425 ) ( ON ?auto_336426 ?auto_336427 ) ( CLEAR ?auto_336426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_336423 ?auto_336424 ?auto_336425 ?auto_336426 )
      ( MAKE-10PILE ?auto_336423 ?auto_336424 ?auto_336425 ?auto_336426 ?auto_336427 ?auto_336428 ?auto_336429 ?auto_336430 ?auto_336431 ?auto_336432 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336444 - BLOCK
      ?auto_336445 - BLOCK
      ?auto_336446 - BLOCK
      ?auto_336447 - BLOCK
      ?auto_336448 - BLOCK
      ?auto_336449 - BLOCK
      ?auto_336450 - BLOCK
      ?auto_336451 - BLOCK
      ?auto_336452 - BLOCK
      ?auto_336453 - BLOCK
    )
    :vars
    (
      ?auto_336454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336453 ?auto_336454 ) ( ON-TABLE ?auto_336444 ) ( ON ?auto_336445 ?auto_336444 ) ( not ( = ?auto_336444 ?auto_336445 ) ) ( not ( = ?auto_336444 ?auto_336446 ) ) ( not ( = ?auto_336444 ?auto_336447 ) ) ( not ( = ?auto_336444 ?auto_336448 ) ) ( not ( = ?auto_336444 ?auto_336449 ) ) ( not ( = ?auto_336444 ?auto_336450 ) ) ( not ( = ?auto_336444 ?auto_336451 ) ) ( not ( = ?auto_336444 ?auto_336452 ) ) ( not ( = ?auto_336444 ?auto_336453 ) ) ( not ( = ?auto_336444 ?auto_336454 ) ) ( not ( = ?auto_336445 ?auto_336446 ) ) ( not ( = ?auto_336445 ?auto_336447 ) ) ( not ( = ?auto_336445 ?auto_336448 ) ) ( not ( = ?auto_336445 ?auto_336449 ) ) ( not ( = ?auto_336445 ?auto_336450 ) ) ( not ( = ?auto_336445 ?auto_336451 ) ) ( not ( = ?auto_336445 ?auto_336452 ) ) ( not ( = ?auto_336445 ?auto_336453 ) ) ( not ( = ?auto_336445 ?auto_336454 ) ) ( not ( = ?auto_336446 ?auto_336447 ) ) ( not ( = ?auto_336446 ?auto_336448 ) ) ( not ( = ?auto_336446 ?auto_336449 ) ) ( not ( = ?auto_336446 ?auto_336450 ) ) ( not ( = ?auto_336446 ?auto_336451 ) ) ( not ( = ?auto_336446 ?auto_336452 ) ) ( not ( = ?auto_336446 ?auto_336453 ) ) ( not ( = ?auto_336446 ?auto_336454 ) ) ( not ( = ?auto_336447 ?auto_336448 ) ) ( not ( = ?auto_336447 ?auto_336449 ) ) ( not ( = ?auto_336447 ?auto_336450 ) ) ( not ( = ?auto_336447 ?auto_336451 ) ) ( not ( = ?auto_336447 ?auto_336452 ) ) ( not ( = ?auto_336447 ?auto_336453 ) ) ( not ( = ?auto_336447 ?auto_336454 ) ) ( not ( = ?auto_336448 ?auto_336449 ) ) ( not ( = ?auto_336448 ?auto_336450 ) ) ( not ( = ?auto_336448 ?auto_336451 ) ) ( not ( = ?auto_336448 ?auto_336452 ) ) ( not ( = ?auto_336448 ?auto_336453 ) ) ( not ( = ?auto_336448 ?auto_336454 ) ) ( not ( = ?auto_336449 ?auto_336450 ) ) ( not ( = ?auto_336449 ?auto_336451 ) ) ( not ( = ?auto_336449 ?auto_336452 ) ) ( not ( = ?auto_336449 ?auto_336453 ) ) ( not ( = ?auto_336449 ?auto_336454 ) ) ( not ( = ?auto_336450 ?auto_336451 ) ) ( not ( = ?auto_336450 ?auto_336452 ) ) ( not ( = ?auto_336450 ?auto_336453 ) ) ( not ( = ?auto_336450 ?auto_336454 ) ) ( not ( = ?auto_336451 ?auto_336452 ) ) ( not ( = ?auto_336451 ?auto_336453 ) ) ( not ( = ?auto_336451 ?auto_336454 ) ) ( not ( = ?auto_336452 ?auto_336453 ) ) ( not ( = ?auto_336452 ?auto_336454 ) ) ( not ( = ?auto_336453 ?auto_336454 ) ) ( ON ?auto_336452 ?auto_336453 ) ( ON ?auto_336451 ?auto_336452 ) ( ON ?auto_336450 ?auto_336451 ) ( ON ?auto_336449 ?auto_336450 ) ( ON ?auto_336448 ?auto_336449 ) ( ON ?auto_336447 ?auto_336448 ) ( CLEAR ?auto_336445 ) ( ON ?auto_336446 ?auto_336447 ) ( CLEAR ?auto_336446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_336444 ?auto_336445 ?auto_336446 )
      ( MAKE-10PILE ?auto_336444 ?auto_336445 ?auto_336446 ?auto_336447 ?auto_336448 ?auto_336449 ?auto_336450 ?auto_336451 ?auto_336452 ?auto_336453 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336465 - BLOCK
      ?auto_336466 - BLOCK
      ?auto_336467 - BLOCK
      ?auto_336468 - BLOCK
      ?auto_336469 - BLOCK
      ?auto_336470 - BLOCK
      ?auto_336471 - BLOCK
      ?auto_336472 - BLOCK
      ?auto_336473 - BLOCK
      ?auto_336474 - BLOCK
    )
    :vars
    (
      ?auto_336475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336474 ?auto_336475 ) ( ON-TABLE ?auto_336465 ) ( ON ?auto_336466 ?auto_336465 ) ( not ( = ?auto_336465 ?auto_336466 ) ) ( not ( = ?auto_336465 ?auto_336467 ) ) ( not ( = ?auto_336465 ?auto_336468 ) ) ( not ( = ?auto_336465 ?auto_336469 ) ) ( not ( = ?auto_336465 ?auto_336470 ) ) ( not ( = ?auto_336465 ?auto_336471 ) ) ( not ( = ?auto_336465 ?auto_336472 ) ) ( not ( = ?auto_336465 ?auto_336473 ) ) ( not ( = ?auto_336465 ?auto_336474 ) ) ( not ( = ?auto_336465 ?auto_336475 ) ) ( not ( = ?auto_336466 ?auto_336467 ) ) ( not ( = ?auto_336466 ?auto_336468 ) ) ( not ( = ?auto_336466 ?auto_336469 ) ) ( not ( = ?auto_336466 ?auto_336470 ) ) ( not ( = ?auto_336466 ?auto_336471 ) ) ( not ( = ?auto_336466 ?auto_336472 ) ) ( not ( = ?auto_336466 ?auto_336473 ) ) ( not ( = ?auto_336466 ?auto_336474 ) ) ( not ( = ?auto_336466 ?auto_336475 ) ) ( not ( = ?auto_336467 ?auto_336468 ) ) ( not ( = ?auto_336467 ?auto_336469 ) ) ( not ( = ?auto_336467 ?auto_336470 ) ) ( not ( = ?auto_336467 ?auto_336471 ) ) ( not ( = ?auto_336467 ?auto_336472 ) ) ( not ( = ?auto_336467 ?auto_336473 ) ) ( not ( = ?auto_336467 ?auto_336474 ) ) ( not ( = ?auto_336467 ?auto_336475 ) ) ( not ( = ?auto_336468 ?auto_336469 ) ) ( not ( = ?auto_336468 ?auto_336470 ) ) ( not ( = ?auto_336468 ?auto_336471 ) ) ( not ( = ?auto_336468 ?auto_336472 ) ) ( not ( = ?auto_336468 ?auto_336473 ) ) ( not ( = ?auto_336468 ?auto_336474 ) ) ( not ( = ?auto_336468 ?auto_336475 ) ) ( not ( = ?auto_336469 ?auto_336470 ) ) ( not ( = ?auto_336469 ?auto_336471 ) ) ( not ( = ?auto_336469 ?auto_336472 ) ) ( not ( = ?auto_336469 ?auto_336473 ) ) ( not ( = ?auto_336469 ?auto_336474 ) ) ( not ( = ?auto_336469 ?auto_336475 ) ) ( not ( = ?auto_336470 ?auto_336471 ) ) ( not ( = ?auto_336470 ?auto_336472 ) ) ( not ( = ?auto_336470 ?auto_336473 ) ) ( not ( = ?auto_336470 ?auto_336474 ) ) ( not ( = ?auto_336470 ?auto_336475 ) ) ( not ( = ?auto_336471 ?auto_336472 ) ) ( not ( = ?auto_336471 ?auto_336473 ) ) ( not ( = ?auto_336471 ?auto_336474 ) ) ( not ( = ?auto_336471 ?auto_336475 ) ) ( not ( = ?auto_336472 ?auto_336473 ) ) ( not ( = ?auto_336472 ?auto_336474 ) ) ( not ( = ?auto_336472 ?auto_336475 ) ) ( not ( = ?auto_336473 ?auto_336474 ) ) ( not ( = ?auto_336473 ?auto_336475 ) ) ( not ( = ?auto_336474 ?auto_336475 ) ) ( ON ?auto_336473 ?auto_336474 ) ( ON ?auto_336472 ?auto_336473 ) ( ON ?auto_336471 ?auto_336472 ) ( ON ?auto_336470 ?auto_336471 ) ( ON ?auto_336469 ?auto_336470 ) ( ON ?auto_336468 ?auto_336469 ) ( CLEAR ?auto_336466 ) ( ON ?auto_336467 ?auto_336468 ) ( CLEAR ?auto_336467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_336465 ?auto_336466 ?auto_336467 )
      ( MAKE-10PILE ?auto_336465 ?auto_336466 ?auto_336467 ?auto_336468 ?auto_336469 ?auto_336470 ?auto_336471 ?auto_336472 ?auto_336473 ?auto_336474 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336486 - BLOCK
      ?auto_336487 - BLOCK
      ?auto_336488 - BLOCK
      ?auto_336489 - BLOCK
      ?auto_336490 - BLOCK
      ?auto_336491 - BLOCK
      ?auto_336492 - BLOCK
      ?auto_336493 - BLOCK
      ?auto_336494 - BLOCK
      ?auto_336495 - BLOCK
    )
    :vars
    (
      ?auto_336496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336495 ?auto_336496 ) ( ON-TABLE ?auto_336486 ) ( not ( = ?auto_336486 ?auto_336487 ) ) ( not ( = ?auto_336486 ?auto_336488 ) ) ( not ( = ?auto_336486 ?auto_336489 ) ) ( not ( = ?auto_336486 ?auto_336490 ) ) ( not ( = ?auto_336486 ?auto_336491 ) ) ( not ( = ?auto_336486 ?auto_336492 ) ) ( not ( = ?auto_336486 ?auto_336493 ) ) ( not ( = ?auto_336486 ?auto_336494 ) ) ( not ( = ?auto_336486 ?auto_336495 ) ) ( not ( = ?auto_336486 ?auto_336496 ) ) ( not ( = ?auto_336487 ?auto_336488 ) ) ( not ( = ?auto_336487 ?auto_336489 ) ) ( not ( = ?auto_336487 ?auto_336490 ) ) ( not ( = ?auto_336487 ?auto_336491 ) ) ( not ( = ?auto_336487 ?auto_336492 ) ) ( not ( = ?auto_336487 ?auto_336493 ) ) ( not ( = ?auto_336487 ?auto_336494 ) ) ( not ( = ?auto_336487 ?auto_336495 ) ) ( not ( = ?auto_336487 ?auto_336496 ) ) ( not ( = ?auto_336488 ?auto_336489 ) ) ( not ( = ?auto_336488 ?auto_336490 ) ) ( not ( = ?auto_336488 ?auto_336491 ) ) ( not ( = ?auto_336488 ?auto_336492 ) ) ( not ( = ?auto_336488 ?auto_336493 ) ) ( not ( = ?auto_336488 ?auto_336494 ) ) ( not ( = ?auto_336488 ?auto_336495 ) ) ( not ( = ?auto_336488 ?auto_336496 ) ) ( not ( = ?auto_336489 ?auto_336490 ) ) ( not ( = ?auto_336489 ?auto_336491 ) ) ( not ( = ?auto_336489 ?auto_336492 ) ) ( not ( = ?auto_336489 ?auto_336493 ) ) ( not ( = ?auto_336489 ?auto_336494 ) ) ( not ( = ?auto_336489 ?auto_336495 ) ) ( not ( = ?auto_336489 ?auto_336496 ) ) ( not ( = ?auto_336490 ?auto_336491 ) ) ( not ( = ?auto_336490 ?auto_336492 ) ) ( not ( = ?auto_336490 ?auto_336493 ) ) ( not ( = ?auto_336490 ?auto_336494 ) ) ( not ( = ?auto_336490 ?auto_336495 ) ) ( not ( = ?auto_336490 ?auto_336496 ) ) ( not ( = ?auto_336491 ?auto_336492 ) ) ( not ( = ?auto_336491 ?auto_336493 ) ) ( not ( = ?auto_336491 ?auto_336494 ) ) ( not ( = ?auto_336491 ?auto_336495 ) ) ( not ( = ?auto_336491 ?auto_336496 ) ) ( not ( = ?auto_336492 ?auto_336493 ) ) ( not ( = ?auto_336492 ?auto_336494 ) ) ( not ( = ?auto_336492 ?auto_336495 ) ) ( not ( = ?auto_336492 ?auto_336496 ) ) ( not ( = ?auto_336493 ?auto_336494 ) ) ( not ( = ?auto_336493 ?auto_336495 ) ) ( not ( = ?auto_336493 ?auto_336496 ) ) ( not ( = ?auto_336494 ?auto_336495 ) ) ( not ( = ?auto_336494 ?auto_336496 ) ) ( not ( = ?auto_336495 ?auto_336496 ) ) ( ON ?auto_336494 ?auto_336495 ) ( ON ?auto_336493 ?auto_336494 ) ( ON ?auto_336492 ?auto_336493 ) ( ON ?auto_336491 ?auto_336492 ) ( ON ?auto_336490 ?auto_336491 ) ( ON ?auto_336489 ?auto_336490 ) ( ON ?auto_336488 ?auto_336489 ) ( CLEAR ?auto_336486 ) ( ON ?auto_336487 ?auto_336488 ) ( CLEAR ?auto_336487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_336486 ?auto_336487 )
      ( MAKE-10PILE ?auto_336486 ?auto_336487 ?auto_336488 ?auto_336489 ?auto_336490 ?auto_336491 ?auto_336492 ?auto_336493 ?auto_336494 ?auto_336495 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336507 - BLOCK
      ?auto_336508 - BLOCK
      ?auto_336509 - BLOCK
      ?auto_336510 - BLOCK
      ?auto_336511 - BLOCK
      ?auto_336512 - BLOCK
      ?auto_336513 - BLOCK
      ?auto_336514 - BLOCK
      ?auto_336515 - BLOCK
      ?auto_336516 - BLOCK
    )
    :vars
    (
      ?auto_336517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336516 ?auto_336517 ) ( ON-TABLE ?auto_336507 ) ( not ( = ?auto_336507 ?auto_336508 ) ) ( not ( = ?auto_336507 ?auto_336509 ) ) ( not ( = ?auto_336507 ?auto_336510 ) ) ( not ( = ?auto_336507 ?auto_336511 ) ) ( not ( = ?auto_336507 ?auto_336512 ) ) ( not ( = ?auto_336507 ?auto_336513 ) ) ( not ( = ?auto_336507 ?auto_336514 ) ) ( not ( = ?auto_336507 ?auto_336515 ) ) ( not ( = ?auto_336507 ?auto_336516 ) ) ( not ( = ?auto_336507 ?auto_336517 ) ) ( not ( = ?auto_336508 ?auto_336509 ) ) ( not ( = ?auto_336508 ?auto_336510 ) ) ( not ( = ?auto_336508 ?auto_336511 ) ) ( not ( = ?auto_336508 ?auto_336512 ) ) ( not ( = ?auto_336508 ?auto_336513 ) ) ( not ( = ?auto_336508 ?auto_336514 ) ) ( not ( = ?auto_336508 ?auto_336515 ) ) ( not ( = ?auto_336508 ?auto_336516 ) ) ( not ( = ?auto_336508 ?auto_336517 ) ) ( not ( = ?auto_336509 ?auto_336510 ) ) ( not ( = ?auto_336509 ?auto_336511 ) ) ( not ( = ?auto_336509 ?auto_336512 ) ) ( not ( = ?auto_336509 ?auto_336513 ) ) ( not ( = ?auto_336509 ?auto_336514 ) ) ( not ( = ?auto_336509 ?auto_336515 ) ) ( not ( = ?auto_336509 ?auto_336516 ) ) ( not ( = ?auto_336509 ?auto_336517 ) ) ( not ( = ?auto_336510 ?auto_336511 ) ) ( not ( = ?auto_336510 ?auto_336512 ) ) ( not ( = ?auto_336510 ?auto_336513 ) ) ( not ( = ?auto_336510 ?auto_336514 ) ) ( not ( = ?auto_336510 ?auto_336515 ) ) ( not ( = ?auto_336510 ?auto_336516 ) ) ( not ( = ?auto_336510 ?auto_336517 ) ) ( not ( = ?auto_336511 ?auto_336512 ) ) ( not ( = ?auto_336511 ?auto_336513 ) ) ( not ( = ?auto_336511 ?auto_336514 ) ) ( not ( = ?auto_336511 ?auto_336515 ) ) ( not ( = ?auto_336511 ?auto_336516 ) ) ( not ( = ?auto_336511 ?auto_336517 ) ) ( not ( = ?auto_336512 ?auto_336513 ) ) ( not ( = ?auto_336512 ?auto_336514 ) ) ( not ( = ?auto_336512 ?auto_336515 ) ) ( not ( = ?auto_336512 ?auto_336516 ) ) ( not ( = ?auto_336512 ?auto_336517 ) ) ( not ( = ?auto_336513 ?auto_336514 ) ) ( not ( = ?auto_336513 ?auto_336515 ) ) ( not ( = ?auto_336513 ?auto_336516 ) ) ( not ( = ?auto_336513 ?auto_336517 ) ) ( not ( = ?auto_336514 ?auto_336515 ) ) ( not ( = ?auto_336514 ?auto_336516 ) ) ( not ( = ?auto_336514 ?auto_336517 ) ) ( not ( = ?auto_336515 ?auto_336516 ) ) ( not ( = ?auto_336515 ?auto_336517 ) ) ( not ( = ?auto_336516 ?auto_336517 ) ) ( ON ?auto_336515 ?auto_336516 ) ( ON ?auto_336514 ?auto_336515 ) ( ON ?auto_336513 ?auto_336514 ) ( ON ?auto_336512 ?auto_336513 ) ( ON ?auto_336511 ?auto_336512 ) ( ON ?auto_336510 ?auto_336511 ) ( ON ?auto_336509 ?auto_336510 ) ( CLEAR ?auto_336507 ) ( ON ?auto_336508 ?auto_336509 ) ( CLEAR ?auto_336508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_336507 ?auto_336508 )
      ( MAKE-10PILE ?auto_336507 ?auto_336508 ?auto_336509 ?auto_336510 ?auto_336511 ?auto_336512 ?auto_336513 ?auto_336514 ?auto_336515 ?auto_336516 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336528 - BLOCK
      ?auto_336529 - BLOCK
      ?auto_336530 - BLOCK
      ?auto_336531 - BLOCK
      ?auto_336532 - BLOCK
      ?auto_336533 - BLOCK
      ?auto_336534 - BLOCK
      ?auto_336535 - BLOCK
      ?auto_336536 - BLOCK
      ?auto_336537 - BLOCK
    )
    :vars
    (
      ?auto_336538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336537 ?auto_336538 ) ( not ( = ?auto_336528 ?auto_336529 ) ) ( not ( = ?auto_336528 ?auto_336530 ) ) ( not ( = ?auto_336528 ?auto_336531 ) ) ( not ( = ?auto_336528 ?auto_336532 ) ) ( not ( = ?auto_336528 ?auto_336533 ) ) ( not ( = ?auto_336528 ?auto_336534 ) ) ( not ( = ?auto_336528 ?auto_336535 ) ) ( not ( = ?auto_336528 ?auto_336536 ) ) ( not ( = ?auto_336528 ?auto_336537 ) ) ( not ( = ?auto_336528 ?auto_336538 ) ) ( not ( = ?auto_336529 ?auto_336530 ) ) ( not ( = ?auto_336529 ?auto_336531 ) ) ( not ( = ?auto_336529 ?auto_336532 ) ) ( not ( = ?auto_336529 ?auto_336533 ) ) ( not ( = ?auto_336529 ?auto_336534 ) ) ( not ( = ?auto_336529 ?auto_336535 ) ) ( not ( = ?auto_336529 ?auto_336536 ) ) ( not ( = ?auto_336529 ?auto_336537 ) ) ( not ( = ?auto_336529 ?auto_336538 ) ) ( not ( = ?auto_336530 ?auto_336531 ) ) ( not ( = ?auto_336530 ?auto_336532 ) ) ( not ( = ?auto_336530 ?auto_336533 ) ) ( not ( = ?auto_336530 ?auto_336534 ) ) ( not ( = ?auto_336530 ?auto_336535 ) ) ( not ( = ?auto_336530 ?auto_336536 ) ) ( not ( = ?auto_336530 ?auto_336537 ) ) ( not ( = ?auto_336530 ?auto_336538 ) ) ( not ( = ?auto_336531 ?auto_336532 ) ) ( not ( = ?auto_336531 ?auto_336533 ) ) ( not ( = ?auto_336531 ?auto_336534 ) ) ( not ( = ?auto_336531 ?auto_336535 ) ) ( not ( = ?auto_336531 ?auto_336536 ) ) ( not ( = ?auto_336531 ?auto_336537 ) ) ( not ( = ?auto_336531 ?auto_336538 ) ) ( not ( = ?auto_336532 ?auto_336533 ) ) ( not ( = ?auto_336532 ?auto_336534 ) ) ( not ( = ?auto_336532 ?auto_336535 ) ) ( not ( = ?auto_336532 ?auto_336536 ) ) ( not ( = ?auto_336532 ?auto_336537 ) ) ( not ( = ?auto_336532 ?auto_336538 ) ) ( not ( = ?auto_336533 ?auto_336534 ) ) ( not ( = ?auto_336533 ?auto_336535 ) ) ( not ( = ?auto_336533 ?auto_336536 ) ) ( not ( = ?auto_336533 ?auto_336537 ) ) ( not ( = ?auto_336533 ?auto_336538 ) ) ( not ( = ?auto_336534 ?auto_336535 ) ) ( not ( = ?auto_336534 ?auto_336536 ) ) ( not ( = ?auto_336534 ?auto_336537 ) ) ( not ( = ?auto_336534 ?auto_336538 ) ) ( not ( = ?auto_336535 ?auto_336536 ) ) ( not ( = ?auto_336535 ?auto_336537 ) ) ( not ( = ?auto_336535 ?auto_336538 ) ) ( not ( = ?auto_336536 ?auto_336537 ) ) ( not ( = ?auto_336536 ?auto_336538 ) ) ( not ( = ?auto_336537 ?auto_336538 ) ) ( ON ?auto_336536 ?auto_336537 ) ( ON ?auto_336535 ?auto_336536 ) ( ON ?auto_336534 ?auto_336535 ) ( ON ?auto_336533 ?auto_336534 ) ( ON ?auto_336532 ?auto_336533 ) ( ON ?auto_336531 ?auto_336532 ) ( ON ?auto_336530 ?auto_336531 ) ( ON ?auto_336529 ?auto_336530 ) ( ON ?auto_336528 ?auto_336529 ) ( CLEAR ?auto_336528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_336528 )
      ( MAKE-10PILE ?auto_336528 ?auto_336529 ?auto_336530 ?auto_336531 ?auto_336532 ?auto_336533 ?auto_336534 ?auto_336535 ?auto_336536 ?auto_336537 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_336549 - BLOCK
      ?auto_336550 - BLOCK
      ?auto_336551 - BLOCK
      ?auto_336552 - BLOCK
      ?auto_336553 - BLOCK
      ?auto_336554 - BLOCK
      ?auto_336555 - BLOCK
      ?auto_336556 - BLOCK
      ?auto_336557 - BLOCK
      ?auto_336558 - BLOCK
    )
    :vars
    (
      ?auto_336559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336558 ?auto_336559 ) ( not ( = ?auto_336549 ?auto_336550 ) ) ( not ( = ?auto_336549 ?auto_336551 ) ) ( not ( = ?auto_336549 ?auto_336552 ) ) ( not ( = ?auto_336549 ?auto_336553 ) ) ( not ( = ?auto_336549 ?auto_336554 ) ) ( not ( = ?auto_336549 ?auto_336555 ) ) ( not ( = ?auto_336549 ?auto_336556 ) ) ( not ( = ?auto_336549 ?auto_336557 ) ) ( not ( = ?auto_336549 ?auto_336558 ) ) ( not ( = ?auto_336549 ?auto_336559 ) ) ( not ( = ?auto_336550 ?auto_336551 ) ) ( not ( = ?auto_336550 ?auto_336552 ) ) ( not ( = ?auto_336550 ?auto_336553 ) ) ( not ( = ?auto_336550 ?auto_336554 ) ) ( not ( = ?auto_336550 ?auto_336555 ) ) ( not ( = ?auto_336550 ?auto_336556 ) ) ( not ( = ?auto_336550 ?auto_336557 ) ) ( not ( = ?auto_336550 ?auto_336558 ) ) ( not ( = ?auto_336550 ?auto_336559 ) ) ( not ( = ?auto_336551 ?auto_336552 ) ) ( not ( = ?auto_336551 ?auto_336553 ) ) ( not ( = ?auto_336551 ?auto_336554 ) ) ( not ( = ?auto_336551 ?auto_336555 ) ) ( not ( = ?auto_336551 ?auto_336556 ) ) ( not ( = ?auto_336551 ?auto_336557 ) ) ( not ( = ?auto_336551 ?auto_336558 ) ) ( not ( = ?auto_336551 ?auto_336559 ) ) ( not ( = ?auto_336552 ?auto_336553 ) ) ( not ( = ?auto_336552 ?auto_336554 ) ) ( not ( = ?auto_336552 ?auto_336555 ) ) ( not ( = ?auto_336552 ?auto_336556 ) ) ( not ( = ?auto_336552 ?auto_336557 ) ) ( not ( = ?auto_336552 ?auto_336558 ) ) ( not ( = ?auto_336552 ?auto_336559 ) ) ( not ( = ?auto_336553 ?auto_336554 ) ) ( not ( = ?auto_336553 ?auto_336555 ) ) ( not ( = ?auto_336553 ?auto_336556 ) ) ( not ( = ?auto_336553 ?auto_336557 ) ) ( not ( = ?auto_336553 ?auto_336558 ) ) ( not ( = ?auto_336553 ?auto_336559 ) ) ( not ( = ?auto_336554 ?auto_336555 ) ) ( not ( = ?auto_336554 ?auto_336556 ) ) ( not ( = ?auto_336554 ?auto_336557 ) ) ( not ( = ?auto_336554 ?auto_336558 ) ) ( not ( = ?auto_336554 ?auto_336559 ) ) ( not ( = ?auto_336555 ?auto_336556 ) ) ( not ( = ?auto_336555 ?auto_336557 ) ) ( not ( = ?auto_336555 ?auto_336558 ) ) ( not ( = ?auto_336555 ?auto_336559 ) ) ( not ( = ?auto_336556 ?auto_336557 ) ) ( not ( = ?auto_336556 ?auto_336558 ) ) ( not ( = ?auto_336556 ?auto_336559 ) ) ( not ( = ?auto_336557 ?auto_336558 ) ) ( not ( = ?auto_336557 ?auto_336559 ) ) ( not ( = ?auto_336558 ?auto_336559 ) ) ( ON ?auto_336557 ?auto_336558 ) ( ON ?auto_336556 ?auto_336557 ) ( ON ?auto_336555 ?auto_336556 ) ( ON ?auto_336554 ?auto_336555 ) ( ON ?auto_336553 ?auto_336554 ) ( ON ?auto_336552 ?auto_336553 ) ( ON ?auto_336551 ?auto_336552 ) ( ON ?auto_336550 ?auto_336551 ) ( ON ?auto_336549 ?auto_336550 ) ( CLEAR ?auto_336549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_336549 )
      ( MAKE-10PILE ?auto_336549 ?auto_336550 ?auto_336551 ?auto_336552 ?auto_336553 ?auto_336554 ?auto_336555 ?auto_336556 ?auto_336557 ?auto_336558 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336571 - BLOCK
      ?auto_336572 - BLOCK
      ?auto_336573 - BLOCK
      ?auto_336574 - BLOCK
      ?auto_336575 - BLOCK
      ?auto_336576 - BLOCK
      ?auto_336577 - BLOCK
      ?auto_336578 - BLOCK
      ?auto_336579 - BLOCK
      ?auto_336580 - BLOCK
      ?auto_336581 - BLOCK
    )
    :vars
    (
      ?auto_336582 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_336580 ) ( ON ?auto_336581 ?auto_336582 ) ( CLEAR ?auto_336581 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_336571 ) ( ON ?auto_336572 ?auto_336571 ) ( ON ?auto_336573 ?auto_336572 ) ( ON ?auto_336574 ?auto_336573 ) ( ON ?auto_336575 ?auto_336574 ) ( ON ?auto_336576 ?auto_336575 ) ( ON ?auto_336577 ?auto_336576 ) ( ON ?auto_336578 ?auto_336577 ) ( ON ?auto_336579 ?auto_336578 ) ( ON ?auto_336580 ?auto_336579 ) ( not ( = ?auto_336571 ?auto_336572 ) ) ( not ( = ?auto_336571 ?auto_336573 ) ) ( not ( = ?auto_336571 ?auto_336574 ) ) ( not ( = ?auto_336571 ?auto_336575 ) ) ( not ( = ?auto_336571 ?auto_336576 ) ) ( not ( = ?auto_336571 ?auto_336577 ) ) ( not ( = ?auto_336571 ?auto_336578 ) ) ( not ( = ?auto_336571 ?auto_336579 ) ) ( not ( = ?auto_336571 ?auto_336580 ) ) ( not ( = ?auto_336571 ?auto_336581 ) ) ( not ( = ?auto_336571 ?auto_336582 ) ) ( not ( = ?auto_336572 ?auto_336573 ) ) ( not ( = ?auto_336572 ?auto_336574 ) ) ( not ( = ?auto_336572 ?auto_336575 ) ) ( not ( = ?auto_336572 ?auto_336576 ) ) ( not ( = ?auto_336572 ?auto_336577 ) ) ( not ( = ?auto_336572 ?auto_336578 ) ) ( not ( = ?auto_336572 ?auto_336579 ) ) ( not ( = ?auto_336572 ?auto_336580 ) ) ( not ( = ?auto_336572 ?auto_336581 ) ) ( not ( = ?auto_336572 ?auto_336582 ) ) ( not ( = ?auto_336573 ?auto_336574 ) ) ( not ( = ?auto_336573 ?auto_336575 ) ) ( not ( = ?auto_336573 ?auto_336576 ) ) ( not ( = ?auto_336573 ?auto_336577 ) ) ( not ( = ?auto_336573 ?auto_336578 ) ) ( not ( = ?auto_336573 ?auto_336579 ) ) ( not ( = ?auto_336573 ?auto_336580 ) ) ( not ( = ?auto_336573 ?auto_336581 ) ) ( not ( = ?auto_336573 ?auto_336582 ) ) ( not ( = ?auto_336574 ?auto_336575 ) ) ( not ( = ?auto_336574 ?auto_336576 ) ) ( not ( = ?auto_336574 ?auto_336577 ) ) ( not ( = ?auto_336574 ?auto_336578 ) ) ( not ( = ?auto_336574 ?auto_336579 ) ) ( not ( = ?auto_336574 ?auto_336580 ) ) ( not ( = ?auto_336574 ?auto_336581 ) ) ( not ( = ?auto_336574 ?auto_336582 ) ) ( not ( = ?auto_336575 ?auto_336576 ) ) ( not ( = ?auto_336575 ?auto_336577 ) ) ( not ( = ?auto_336575 ?auto_336578 ) ) ( not ( = ?auto_336575 ?auto_336579 ) ) ( not ( = ?auto_336575 ?auto_336580 ) ) ( not ( = ?auto_336575 ?auto_336581 ) ) ( not ( = ?auto_336575 ?auto_336582 ) ) ( not ( = ?auto_336576 ?auto_336577 ) ) ( not ( = ?auto_336576 ?auto_336578 ) ) ( not ( = ?auto_336576 ?auto_336579 ) ) ( not ( = ?auto_336576 ?auto_336580 ) ) ( not ( = ?auto_336576 ?auto_336581 ) ) ( not ( = ?auto_336576 ?auto_336582 ) ) ( not ( = ?auto_336577 ?auto_336578 ) ) ( not ( = ?auto_336577 ?auto_336579 ) ) ( not ( = ?auto_336577 ?auto_336580 ) ) ( not ( = ?auto_336577 ?auto_336581 ) ) ( not ( = ?auto_336577 ?auto_336582 ) ) ( not ( = ?auto_336578 ?auto_336579 ) ) ( not ( = ?auto_336578 ?auto_336580 ) ) ( not ( = ?auto_336578 ?auto_336581 ) ) ( not ( = ?auto_336578 ?auto_336582 ) ) ( not ( = ?auto_336579 ?auto_336580 ) ) ( not ( = ?auto_336579 ?auto_336581 ) ) ( not ( = ?auto_336579 ?auto_336582 ) ) ( not ( = ?auto_336580 ?auto_336581 ) ) ( not ( = ?auto_336580 ?auto_336582 ) ) ( not ( = ?auto_336581 ?auto_336582 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_336581 ?auto_336582 )
      ( !STACK ?auto_336581 ?auto_336580 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336594 - BLOCK
      ?auto_336595 - BLOCK
      ?auto_336596 - BLOCK
      ?auto_336597 - BLOCK
      ?auto_336598 - BLOCK
      ?auto_336599 - BLOCK
      ?auto_336600 - BLOCK
      ?auto_336601 - BLOCK
      ?auto_336602 - BLOCK
      ?auto_336603 - BLOCK
      ?auto_336604 - BLOCK
    )
    :vars
    (
      ?auto_336605 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_336603 ) ( ON ?auto_336604 ?auto_336605 ) ( CLEAR ?auto_336604 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_336594 ) ( ON ?auto_336595 ?auto_336594 ) ( ON ?auto_336596 ?auto_336595 ) ( ON ?auto_336597 ?auto_336596 ) ( ON ?auto_336598 ?auto_336597 ) ( ON ?auto_336599 ?auto_336598 ) ( ON ?auto_336600 ?auto_336599 ) ( ON ?auto_336601 ?auto_336600 ) ( ON ?auto_336602 ?auto_336601 ) ( ON ?auto_336603 ?auto_336602 ) ( not ( = ?auto_336594 ?auto_336595 ) ) ( not ( = ?auto_336594 ?auto_336596 ) ) ( not ( = ?auto_336594 ?auto_336597 ) ) ( not ( = ?auto_336594 ?auto_336598 ) ) ( not ( = ?auto_336594 ?auto_336599 ) ) ( not ( = ?auto_336594 ?auto_336600 ) ) ( not ( = ?auto_336594 ?auto_336601 ) ) ( not ( = ?auto_336594 ?auto_336602 ) ) ( not ( = ?auto_336594 ?auto_336603 ) ) ( not ( = ?auto_336594 ?auto_336604 ) ) ( not ( = ?auto_336594 ?auto_336605 ) ) ( not ( = ?auto_336595 ?auto_336596 ) ) ( not ( = ?auto_336595 ?auto_336597 ) ) ( not ( = ?auto_336595 ?auto_336598 ) ) ( not ( = ?auto_336595 ?auto_336599 ) ) ( not ( = ?auto_336595 ?auto_336600 ) ) ( not ( = ?auto_336595 ?auto_336601 ) ) ( not ( = ?auto_336595 ?auto_336602 ) ) ( not ( = ?auto_336595 ?auto_336603 ) ) ( not ( = ?auto_336595 ?auto_336604 ) ) ( not ( = ?auto_336595 ?auto_336605 ) ) ( not ( = ?auto_336596 ?auto_336597 ) ) ( not ( = ?auto_336596 ?auto_336598 ) ) ( not ( = ?auto_336596 ?auto_336599 ) ) ( not ( = ?auto_336596 ?auto_336600 ) ) ( not ( = ?auto_336596 ?auto_336601 ) ) ( not ( = ?auto_336596 ?auto_336602 ) ) ( not ( = ?auto_336596 ?auto_336603 ) ) ( not ( = ?auto_336596 ?auto_336604 ) ) ( not ( = ?auto_336596 ?auto_336605 ) ) ( not ( = ?auto_336597 ?auto_336598 ) ) ( not ( = ?auto_336597 ?auto_336599 ) ) ( not ( = ?auto_336597 ?auto_336600 ) ) ( not ( = ?auto_336597 ?auto_336601 ) ) ( not ( = ?auto_336597 ?auto_336602 ) ) ( not ( = ?auto_336597 ?auto_336603 ) ) ( not ( = ?auto_336597 ?auto_336604 ) ) ( not ( = ?auto_336597 ?auto_336605 ) ) ( not ( = ?auto_336598 ?auto_336599 ) ) ( not ( = ?auto_336598 ?auto_336600 ) ) ( not ( = ?auto_336598 ?auto_336601 ) ) ( not ( = ?auto_336598 ?auto_336602 ) ) ( not ( = ?auto_336598 ?auto_336603 ) ) ( not ( = ?auto_336598 ?auto_336604 ) ) ( not ( = ?auto_336598 ?auto_336605 ) ) ( not ( = ?auto_336599 ?auto_336600 ) ) ( not ( = ?auto_336599 ?auto_336601 ) ) ( not ( = ?auto_336599 ?auto_336602 ) ) ( not ( = ?auto_336599 ?auto_336603 ) ) ( not ( = ?auto_336599 ?auto_336604 ) ) ( not ( = ?auto_336599 ?auto_336605 ) ) ( not ( = ?auto_336600 ?auto_336601 ) ) ( not ( = ?auto_336600 ?auto_336602 ) ) ( not ( = ?auto_336600 ?auto_336603 ) ) ( not ( = ?auto_336600 ?auto_336604 ) ) ( not ( = ?auto_336600 ?auto_336605 ) ) ( not ( = ?auto_336601 ?auto_336602 ) ) ( not ( = ?auto_336601 ?auto_336603 ) ) ( not ( = ?auto_336601 ?auto_336604 ) ) ( not ( = ?auto_336601 ?auto_336605 ) ) ( not ( = ?auto_336602 ?auto_336603 ) ) ( not ( = ?auto_336602 ?auto_336604 ) ) ( not ( = ?auto_336602 ?auto_336605 ) ) ( not ( = ?auto_336603 ?auto_336604 ) ) ( not ( = ?auto_336603 ?auto_336605 ) ) ( not ( = ?auto_336604 ?auto_336605 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_336604 ?auto_336605 )
      ( !STACK ?auto_336604 ?auto_336603 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336617 - BLOCK
      ?auto_336618 - BLOCK
      ?auto_336619 - BLOCK
      ?auto_336620 - BLOCK
      ?auto_336621 - BLOCK
      ?auto_336622 - BLOCK
      ?auto_336623 - BLOCK
      ?auto_336624 - BLOCK
      ?auto_336625 - BLOCK
      ?auto_336626 - BLOCK
      ?auto_336627 - BLOCK
    )
    :vars
    (
      ?auto_336628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336627 ?auto_336628 ) ( ON-TABLE ?auto_336617 ) ( ON ?auto_336618 ?auto_336617 ) ( ON ?auto_336619 ?auto_336618 ) ( ON ?auto_336620 ?auto_336619 ) ( ON ?auto_336621 ?auto_336620 ) ( ON ?auto_336622 ?auto_336621 ) ( ON ?auto_336623 ?auto_336622 ) ( ON ?auto_336624 ?auto_336623 ) ( ON ?auto_336625 ?auto_336624 ) ( not ( = ?auto_336617 ?auto_336618 ) ) ( not ( = ?auto_336617 ?auto_336619 ) ) ( not ( = ?auto_336617 ?auto_336620 ) ) ( not ( = ?auto_336617 ?auto_336621 ) ) ( not ( = ?auto_336617 ?auto_336622 ) ) ( not ( = ?auto_336617 ?auto_336623 ) ) ( not ( = ?auto_336617 ?auto_336624 ) ) ( not ( = ?auto_336617 ?auto_336625 ) ) ( not ( = ?auto_336617 ?auto_336626 ) ) ( not ( = ?auto_336617 ?auto_336627 ) ) ( not ( = ?auto_336617 ?auto_336628 ) ) ( not ( = ?auto_336618 ?auto_336619 ) ) ( not ( = ?auto_336618 ?auto_336620 ) ) ( not ( = ?auto_336618 ?auto_336621 ) ) ( not ( = ?auto_336618 ?auto_336622 ) ) ( not ( = ?auto_336618 ?auto_336623 ) ) ( not ( = ?auto_336618 ?auto_336624 ) ) ( not ( = ?auto_336618 ?auto_336625 ) ) ( not ( = ?auto_336618 ?auto_336626 ) ) ( not ( = ?auto_336618 ?auto_336627 ) ) ( not ( = ?auto_336618 ?auto_336628 ) ) ( not ( = ?auto_336619 ?auto_336620 ) ) ( not ( = ?auto_336619 ?auto_336621 ) ) ( not ( = ?auto_336619 ?auto_336622 ) ) ( not ( = ?auto_336619 ?auto_336623 ) ) ( not ( = ?auto_336619 ?auto_336624 ) ) ( not ( = ?auto_336619 ?auto_336625 ) ) ( not ( = ?auto_336619 ?auto_336626 ) ) ( not ( = ?auto_336619 ?auto_336627 ) ) ( not ( = ?auto_336619 ?auto_336628 ) ) ( not ( = ?auto_336620 ?auto_336621 ) ) ( not ( = ?auto_336620 ?auto_336622 ) ) ( not ( = ?auto_336620 ?auto_336623 ) ) ( not ( = ?auto_336620 ?auto_336624 ) ) ( not ( = ?auto_336620 ?auto_336625 ) ) ( not ( = ?auto_336620 ?auto_336626 ) ) ( not ( = ?auto_336620 ?auto_336627 ) ) ( not ( = ?auto_336620 ?auto_336628 ) ) ( not ( = ?auto_336621 ?auto_336622 ) ) ( not ( = ?auto_336621 ?auto_336623 ) ) ( not ( = ?auto_336621 ?auto_336624 ) ) ( not ( = ?auto_336621 ?auto_336625 ) ) ( not ( = ?auto_336621 ?auto_336626 ) ) ( not ( = ?auto_336621 ?auto_336627 ) ) ( not ( = ?auto_336621 ?auto_336628 ) ) ( not ( = ?auto_336622 ?auto_336623 ) ) ( not ( = ?auto_336622 ?auto_336624 ) ) ( not ( = ?auto_336622 ?auto_336625 ) ) ( not ( = ?auto_336622 ?auto_336626 ) ) ( not ( = ?auto_336622 ?auto_336627 ) ) ( not ( = ?auto_336622 ?auto_336628 ) ) ( not ( = ?auto_336623 ?auto_336624 ) ) ( not ( = ?auto_336623 ?auto_336625 ) ) ( not ( = ?auto_336623 ?auto_336626 ) ) ( not ( = ?auto_336623 ?auto_336627 ) ) ( not ( = ?auto_336623 ?auto_336628 ) ) ( not ( = ?auto_336624 ?auto_336625 ) ) ( not ( = ?auto_336624 ?auto_336626 ) ) ( not ( = ?auto_336624 ?auto_336627 ) ) ( not ( = ?auto_336624 ?auto_336628 ) ) ( not ( = ?auto_336625 ?auto_336626 ) ) ( not ( = ?auto_336625 ?auto_336627 ) ) ( not ( = ?auto_336625 ?auto_336628 ) ) ( not ( = ?auto_336626 ?auto_336627 ) ) ( not ( = ?auto_336626 ?auto_336628 ) ) ( not ( = ?auto_336627 ?auto_336628 ) ) ( CLEAR ?auto_336625 ) ( ON ?auto_336626 ?auto_336627 ) ( CLEAR ?auto_336626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_336617 ?auto_336618 ?auto_336619 ?auto_336620 ?auto_336621 ?auto_336622 ?auto_336623 ?auto_336624 ?auto_336625 ?auto_336626 )
      ( MAKE-11PILE ?auto_336617 ?auto_336618 ?auto_336619 ?auto_336620 ?auto_336621 ?auto_336622 ?auto_336623 ?auto_336624 ?auto_336625 ?auto_336626 ?auto_336627 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336640 - BLOCK
      ?auto_336641 - BLOCK
      ?auto_336642 - BLOCK
      ?auto_336643 - BLOCK
      ?auto_336644 - BLOCK
      ?auto_336645 - BLOCK
      ?auto_336646 - BLOCK
      ?auto_336647 - BLOCK
      ?auto_336648 - BLOCK
      ?auto_336649 - BLOCK
      ?auto_336650 - BLOCK
    )
    :vars
    (
      ?auto_336651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336650 ?auto_336651 ) ( ON-TABLE ?auto_336640 ) ( ON ?auto_336641 ?auto_336640 ) ( ON ?auto_336642 ?auto_336641 ) ( ON ?auto_336643 ?auto_336642 ) ( ON ?auto_336644 ?auto_336643 ) ( ON ?auto_336645 ?auto_336644 ) ( ON ?auto_336646 ?auto_336645 ) ( ON ?auto_336647 ?auto_336646 ) ( ON ?auto_336648 ?auto_336647 ) ( not ( = ?auto_336640 ?auto_336641 ) ) ( not ( = ?auto_336640 ?auto_336642 ) ) ( not ( = ?auto_336640 ?auto_336643 ) ) ( not ( = ?auto_336640 ?auto_336644 ) ) ( not ( = ?auto_336640 ?auto_336645 ) ) ( not ( = ?auto_336640 ?auto_336646 ) ) ( not ( = ?auto_336640 ?auto_336647 ) ) ( not ( = ?auto_336640 ?auto_336648 ) ) ( not ( = ?auto_336640 ?auto_336649 ) ) ( not ( = ?auto_336640 ?auto_336650 ) ) ( not ( = ?auto_336640 ?auto_336651 ) ) ( not ( = ?auto_336641 ?auto_336642 ) ) ( not ( = ?auto_336641 ?auto_336643 ) ) ( not ( = ?auto_336641 ?auto_336644 ) ) ( not ( = ?auto_336641 ?auto_336645 ) ) ( not ( = ?auto_336641 ?auto_336646 ) ) ( not ( = ?auto_336641 ?auto_336647 ) ) ( not ( = ?auto_336641 ?auto_336648 ) ) ( not ( = ?auto_336641 ?auto_336649 ) ) ( not ( = ?auto_336641 ?auto_336650 ) ) ( not ( = ?auto_336641 ?auto_336651 ) ) ( not ( = ?auto_336642 ?auto_336643 ) ) ( not ( = ?auto_336642 ?auto_336644 ) ) ( not ( = ?auto_336642 ?auto_336645 ) ) ( not ( = ?auto_336642 ?auto_336646 ) ) ( not ( = ?auto_336642 ?auto_336647 ) ) ( not ( = ?auto_336642 ?auto_336648 ) ) ( not ( = ?auto_336642 ?auto_336649 ) ) ( not ( = ?auto_336642 ?auto_336650 ) ) ( not ( = ?auto_336642 ?auto_336651 ) ) ( not ( = ?auto_336643 ?auto_336644 ) ) ( not ( = ?auto_336643 ?auto_336645 ) ) ( not ( = ?auto_336643 ?auto_336646 ) ) ( not ( = ?auto_336643 ?auto_336647 ) ) ( not ( = ?auto_336643 ?auto_336648 ) ) ( not ( = ?auto_336643 ?auto_336649 ) ) ( not ( = ?auto_336643 ?auto_336650 ) ) ( not ( = ?auto_336643 ?auto_336651 ) ) ( not ( = ?auto_336644 ?auto_336645 ) ) ( not ( = ?auto_336644 ?auto_336646 ) ) ( not ( = ?auto_336644 ?auto_336647 ) ) ( not ( = ?auto_336644 ?auto_336648 ) ) ( not ( = ?auto_336644 ?auto_336649 ) ) ( not ( = ?auto_336644 ?auto_336650 ) ) ( not ( = ?auto_336644 ?auto_336651 ) ) ( not ( = ?auto_336645 ?auto_336646 ) ) ( not ( = ?auto_336645 ?auto_336647 ) ) ( not ( = ?auto_336645 ?auto_336648 ) ) ( not ( = ?auto_336645 ?auto_336649 ) ) ( not ( = ?auto_336645 ?auto_336650 ) ) ( not ( = ?auto_336645 ?auto_336651 ) ) ( not ( = ?auto_336646 ?auto_336647 ) ) ( not ( = ?auto_336646 ?auto_336648 ) ) ( not ( = ?auto_336646 ?auto_336649 ) ) ( not ( = ?auto_336646 ?auto_336650 ) ) ( not ( = ?auto_336646 ?auto_336651 ) ) ( not ( = ?auto_336647 ?auto_336648 ) ) ( not ( = ?auto_336647 ?auto_336649 ) ) ( not ( = ?auto_336647 ?auto_336650 ) ) ( not ( = ?auto_336647 ?auto_336651 ) ) ( not ( = ?auto_336648 ?auto_336649 ) ) ( not ( = ?auto_336648 ?auto_336650 ) ) ( not ( = ?auto_336648 ?auto_336651 ) ) ( not ( = ?auto_336649 ?auto_336650 ) ) ( not ( = ?auto_336649 ?auto_336651 ) ) ( not ( = ?auto_336650 ?auto_336651 ) ) ( CLEAR ?auto_336648 ) ( ON ?auto_336649 ?auto_336650 ) ( CLEAR ?auto_336649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_336640 ?auto_336641 ?auto_336642 ?auto_336643 ?auto_336644 ?auto_336645 ?auto_336646 ?auto_336647 ?auto_336648 ?auto_336649 )
      ( MAKE-11PILE ?auto_336640 ?auto_336641 ?auto_336642 ?auto_336643 ?auto_336644 ?auto_336645 ?auto_336646 ?auto_336647 ?auto_336648 ?auto_336649 ?auto_336650 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336663 - BLOCK
      ?auto_336664 - BLOCK
      ?auto_336665 - BLOCK
      ?auto_336666 - BLOCK
      ?auto_336667 - BLOCK
      ?auto_336668 - BLOCK
      ?auto_336669 - BLOCK
      ?auto_336670 - BLOCK
      ?auto_336671 - BLOCK
      ?auto_336672 - BLOCK
      ?auto_336673 - BLOCK
    )
    :vars
    (
      ?auto_336674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336673 ?auto_336674 ) ( ON-TABLE ?auto_336663 ) ( ON ?auto_336664 ?auto_336663 ) ( ON ?auto_336665 ?auto_336664 ) ( ON ?auto_336666 ?auto_336665 ) ( ON ?auto_336667 ?auto_336666 ) ( ON ?auto_336668 ?auto_336667 ) ( ON ?auto_336669 ?auto_336668 ) ( ON ?auto_336670 ?auto_336669 ) ( not ( = ?auto_336663 ?auto_336664 ) ) ( not ( = ?auto_336663 ?auto_336665 ) ) ( not ( = ?auto_336663 ?auto_336666 ) ) ( not ( = ?auto_336663 ?auto_336667 ) ) ( not ( = ?auto_336663 ?auto_336668 ) ) ( not ( = ?auto_336663 ?auto_336669 ) ) ( not ( = ?auto_336663 ?auto_336670 ) ) ( not ( = ?auto_336663 ?auto_336671 ) ) ( not ( = ?auto_336663 ?auto_336672 ) ) ( not ( = ?auto_336663 ?auto_336673 ) ) ( not ( = ?auto_336663 ?auto_336674 ) ) ( not ( = ?auto_336664 ?auto_336665 ) ) ( not ( = ?auto_336664 ?auto_336666 ) ) ( not ( = ?auto_336664 ?auto_336667 ) ) ( not ( = ?auto_336664 ?auto_336668 ) ) ( not ( = ?auto_336664 ?auto_336669 ) ) ( not ( = ?auto_336664 ?auto_336670 ) ) ( not ( = ?auto_336664 ?auto_336671 ) ) ( not ( = ?auto_336664 ?auto_336672 ) ) ( not ( = ?auto_336664 ?auto_336673 ) ) ( not ( = ?auto_336664 ?auto_336674 ) ) ( not ( = ?auto_336665 ?auto_336666 ) ) ( not ( = ?auto_336665 ?auto_336667 ) ) ( not ( = ?auto_336665 ?auto_336668 ) ) ( not ( = ?auto_336665 ?auto_336669 ) ) ( not ( = ?auto_336665 ?auto_336670 ) ) ( not ( = ?auto_336665 ?auto_336671 ) ) ( not ( = ?auto_336665 ?auto_336672 ) ) ( not ( = ?auto_336665 ?auto_336673 ) ) ( not ( = ?auto_336665 ?auto_336674 ) ) ( not ( = ?auto_336666 ?auto_336667 ) ) ( not ( = ?auto_336666 ?auto_336668 ) ) ( not ( = ?auto_336666 ?auto_336669 ) ) ( not ( = ?auto_336666 ?auto_336670 ) ) ( not ( = ?auto_336666 ?auto_336671 ) ) ( not ( = ?auto_336666 ?auto_336672 ) ) ( not ( = ?auto_336666 ?auto_336673 ) ) ( not ( = ?auto_336666 ?auto_336674 ) ) ( not ( = ?auto_336667 ?auto_336668 ) ) ( not ( = ?auto_336667 ?auto_336669 ) ) ( not ( = ?auto_336667 ?auto_336670 ) ) ( not ( = ?auto_336667 ?auto_336671 ) ) ( not ( = ?auto_336667 ?auto_336672 ) ) ( not ( = ?auto_336667 ?auto_336673 ) ) ( not ( = ?auto_336667 ?auto_336674 ) ) ( not ( = ?auto_336668 ?auto_336669 ) ) ( not ( = ?auto_336668 ?auto_336670 ) ) ( not ( = ?auto_336668 ?auto_336671 ) ) ( not ( = ?auto_336668 ?auto_336672 ) ) ( not ( = ?auto_336668 ?auto_336673 ) ) ( not ( = ?auto_336668 ?auto_336674 ) ) ( not ( = ?auto_336669 ?auto_336670 ) ) ( not ( = ?auto_336669 ?auto_336671 ) ) ( not ( = ?auto_336669 ?auto_336672 ) ) ( not ( = ?auto_336669 ?auto_336673 ) ) ( not ( = ?auto_336669 ?auto_336674 ) ) ( not ( = ?auto_336670 ?auto_336671 ) ) ( not ( = ?auto_336670 ?auto_336672 ) ) ( not ( = ?auto_336670 ?auto_336673 ) ) ( not ( = ?auto_336670 ?auto_336674 ) ) ( not ( = ?auto_336671 ?auto_336672 ) ) ( not ( = ?auto_336671 ?auto_336673 ) ) ( not ( = ?auto_336671 ?auto_336674 ) ) ( not ( = ?auto_336672 ?auto_336673 ) ) ( not ( = ?auto_336672 ?auto_336674 ) ) ( not ( = ?auto_336673 ?auto_336674 ) ) ( ON ?auto_336672 ?auto_336673 ) ( CLEAR ?auto_336670 ) ( ON ?auto_336671 ?auto_336672 ) ( CLEAR ?auto_336671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_336663 ?auto_336664 ?auto_336665 ?auto_336666 ?auto_336667 ?auto_336668 ?auto_336669 ?auto_336670 ?auto_336671 )
      ( MAKE-11PILE ?auto_336663 ?auto_336664 ?auto_336665 ?auto_336666 ?auto_336667 ?auto_336668 ?auto_336669 ?auto_336670 ?auto_336671 ?auto_336672 ?auto_336673 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336686 - BLOCK
      ?auto_336687 - BLOCK
      ?auto_336688 - BLOCK
      ?auto_336689 - BLOCK
      ?auto_336690 - BLOCK
      ?auto_336691 - BLOCK
      ?auto_336692 - BLOCK
      ?auto_336693 - BLOCK
      ?auto_336694 - BLOCK
      ?auto_336695 - BLOCK
      ?auto_336696 - BLOCK
    )
    :vars
    (
      ?auto_336697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336696 ?auto_336697 ) ( ON-TABLE ?auto_336686 ) ( ON ?auto_336687 ?auto_336686 ) ( ON ?auto_336688 ?auto_336687 ) ( ON ?auto_336689 ?auto_336688 ) ( ON ?auto_336690 ?auto_336689 ) ( ON ?auto_336691 ?auto_336690 ) ( ON ?auto_336692 ?auto_336691 ) ( ON ?auto_336693 ?auto_336692 ) ( not ( = ?auto_336686 ?auto_336687 ) ) ( not ( = ?auto_336686 ?auto_336688 ) ) ( not ( = ?auto_336686 ?auto_336689 ) ) ( not ( = ?auto_336686 ?auto_336690 ) ) ( not ( = ?auto_336686 ?auto_336691 ) ) ( not ( = ?auto_336686 ?auto_336692 ) ) ( not ( = ?auto_336686 ?auto_336693 ) ) ( not ( = ?auto_336686 ?auto_336694 ) ) ( not ( = ?auto_336686 ?auto_336695 ) ) ( not ( = ?auto_336686 ?auto_336696 ) ) ( not ( = ?auto_336686 ?auto_336697 ) ) ( not ( = ?auto_336687 ?auto_336688 ) ) ( not ( = ?auto_336687 ?auto_336689 ) ) ( not ( = ?auto_336687 ?auto_336690 ) ) ( not ( = ?auto_336687 ?auto_336691 ) ) ( not ( = ?auto_336687 ?auto_336692 ) ) ( not ( = ?auto_336687 ?auto_336693 ) ) ( not ( = ?auto_336687 ?auto_336694 ) ) ( not ( = ?auto_336687 ?auto_336695 ) ) ( not ( = ?auto_336687 ?auto_336696 ) ) ( not ( = ?auto_336687 ?auto_336697 ) ) ( not ( = ?auto_336688 ?auto_336689 ) ) ( not ( = ?auto_336688 ?auto_336690 ) ) ( not ( = ?auto_336688 ?auto_336691 ) ) ( not ( = ?auto_336688 ?auto_336692 ) ) ( not ( = ?auto_336688 ?auto_336693 ) ) ( not ( = ?auto_336688 ?auto_336694 ) ) ( not ( = ?auto_336688 ?auto_336695 ) ) ( not ( = ?auto_336688 ?auto_336696 ) ) ( not ( = ?auto_336688 ?auto_336697 ) ) ( not ( = ?auto_336689 ?auto_336690 ) ) ( not ( = ?auto_336689 ?auto_336691 ) ) ( not ( = ?auto_336689 ?auto_336692 ) ) ( not ( = ?auto_336689 ?auto_336693 ) ) ( not ( = ?auto_336689 ?auto_336694 ) ) ( not ( = ?auto_336689 ?auto_336695 ) ) ( not ( = ?auto_336689 ?auto_336696 ) ) ( not ( = ?auto_336689 ?auto_336697 ) ) ( not ( = ?auto_336690 ?auto_336691 ) ) ( not ( = ?auto_336690 ?auto_336692 ) ) ( not ( = ?auto_336690 ?auto_336693 ) ) ( not ( = ?auto_336690 ?auto_336694 ) ) ( not ( = ?auto_336690 ?auto_336695 ) ) ( not ( = ?auto_336690 ?auto_336696 ) ) ( not ( = ?auto_336690 ?auto_336697 ) ) ( not ( = ?auto_336691 ?auto_336692 ) ) ( not ( = ?auto_336691 ?auto_336693 ) ) ( not ( = ?auto_336691 ?auto_336694 ) ) ( not ( = ?auto_336691 ?auto_336695 ) ) ( not ( = ?auto_336691 ?auto_336696 ) ) ( not ( = ?auto_336691 ?auto_336697 ) ) ( not ( = ?auto_336692 ?auto_336693 ) ) ( not ( = ?auto_336692 ?auto_336694 ) ) ( not ( = ?auto_336692 ?auto_336695 ) ) ( not ( = ?auto_336692 ?auto_336696 ) ) ( not ( = ?auto_336692 ?auto_336697 ) ) ( not ( = ?auto_336693 ?auto_336694 ) ) ( not ( = ?auto_336693 ?auto_336695 ) ) ( not ( = ?auto_336693 ?auto_336696 ) ) ( not ( = ?auto_336693 ?auto_336697 ) ) ( not ( = ?auto_336694 ?auto_336695 ) ) ( not ( = ?auto_336694 ?auto_336696 ) ) ( not ( = ?auto_336694 ?auto_336697 ) ) ( not ( = ?auto_336695 ?auto_336696 ) ) ( not ( = ?auto_336695 ?auto_336697 ) ) ( not ( = ?auto_336696 ?auto_336697 ) ) ( ON ?auto_336695 ?auto_336696 ) ( CLEAR ?auto_336693 ) ( ON ?auto_336694 ?auto_336695 ) ( CLEAR ?auto_336694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_336686 ?auto_336687 ?auto_336688 ?auto_336689 ?auto_336690 ?auto_336691 ?auto_336692 ?auto_336693 ?auto_336694 )
      ( MAKE-11PILE ?auto_336686 ?auto_336687 ?auto_336688 ?auto_336689 ?auto_336690 ?auto_336691 ?auto_336692 ?auto_336693 ?auto_336694 ?auto_336695 ?auto_336696 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336709 - BLOCK
      ?auto_336710 - BLOCK
      ?auto_336711 - BLOCK
      ?auto_336712 - BLOCK
      ?auto_336713 - BLOCK
      ?auto_336714 - BLOCK
      ?auto_336715 - BLOCK
      ?auto_336716 - BLOCK
      ?auto_336717 - BLOCK
      ?auto_336718 - BLOCK
      ?auto_336719 - BLOCK
    )
    :vars
    (
      ?auto_336720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336719 ?auto_336720 ) ( ON-TABLE ?auto_336709 ) ( ON ?auto_336710 ?auto_336709 ) ( ON ?auto_336711 ?auto_336710 ) ( ON ?auto_336712 ?auto_336711 ) ( ON ?auto_336713 ?auto_336712 ) ( ON ?auto_336714 ?auto_336713 ) ( ON ?auto_336715 ?auto_336714 ) ( not ( = ?auto_336709 ?auto_336710 ) ) ( not ( = ?auto_336709 ?auto_336711 ) ) ( not ( = ?auto_336709 ?auto_336712 ) ) ( not ( = ?auto_336709 ?auto_336713 ) ) ( not ( = ?auto_336709 ?auto_336714 ) ) ( not ( = ?auto_336709 ?auto_336715 ) ) ( not ( = ?auto_336709 ?auto_336716 ) ) ( not ( = ?auto_336709 ?auto_336717 ) ) ( not ( = ?auto_336709 ?auto_336718 ) ) ( not ( = ?auto_336709 ?auto_336719 ) ) ( not ( = ?auto_336709 ?auto_336720 ) ) ( not ( = ?auto_336710 ?auto_336711 ) ) ( not ( = ?auto_336710 ?auto_336712 ) ) ( not ( = ?auto_336710 ?auto_336713 ) ) ( not ( = ?auto_336710 ?auto_336714 ) ) ( not ( = ?auto_336710 ?auto_336715 ) ) ( not ( = ?auto_336710 ?auto_336716 ) ) ( not ( = ?auto_336710 ?auto_336717 ) ) ( not ( = ?auto_336710 ?auto_336718 ) ) ( not ( = ?auto_336710 ?auto_336719 ) ) ( not ( = ?auto_336710 ?auto_336720 ) ) ( not ( = ?auto_336711 ?auto_336712 ) ) ( not ( = ?auto_336711 ?auto_336713 ) ) ( not ( = ?auto_336711 ?auto_336714 ) ) ( not ( = ?auto_336711 ?auto_336715 ) ) ( not ( = ?auto_336711 ?auto_336716 ) ) ( not ( = ?auto_336711 ?auto_336717 ) ) ( not ( = ?auto_336711 ?auto_336718 ) ) ( not ( = ?auto_336711 ?auto_336719 ) ) ( not ( = ?auto_336711 ?auto_336720 ) ) ( not ( = ?auto_336712 ?auto_336713 ) ) ( not ( = ?auto_336712 ?auto_336714 ) ) ( not ( = ?auto_336712 ?auto_336715 ) ) ( not ( = ?auto_336712 ?auto_336716 ) ) ( not ( = ?auto_336712 ?auto_336717 ) ) ( not ( = ?auto_336712 ?auto_336718 ) ) ( not ( = ?auto_336712 ?auto_336719 ) ) ( not ( = ?auto_336712 ?auto_336720 ) ) ( not ( = ?auto_336713 ?auto_336714 ) ) ( not ( = ?auto_336713 ?auto_336715 ) ) ( not ( = ?auto_336713 ?auto_336716 ) ) ( not ( = ?auto_336713 ?auto_336717 ) ) ( not ( = ?auto_336713 ?auto_336718 ) ) ( not ( = ?auto_336713 ?auto_336719 ) ) ( not ( = ?auto_336713 ?auto_336720 ) ) ( not ( = ?auto_336714 ?auto_336715 ) ) ( not ( = ?auto_336714 ?auto_336716 ) ) ( not ( = ?auto_336714 ?auto_336717 ) ) ( not ( = ?auto_336714 ?auto_336718 ) ) ( not ( = ?auto_336714 ?auto_336719 ) ) ( not ( = ?auto_336714 ?auto_336720 ) ) ( not ( = ?auto_336715 ?auto_336716 ) ) ( not ( = ?auto_336715 ?auto_336717 ) ) ( not ( = ?auto_336715 ?auto_336718 ) ) ( not ( = ?auto_336715 ?auto_336719 ) ) ( not ( = ?auto_336715 ?auto_336720 ) ) ( not ( = ?auto_336716 ?auto_336717 ) ) ( not ( = ?auto_336716 ?auto_336718 ) ) ( not ( = ?auto_336716 ?auto_336719 ) ) ( not ( = ?auto_336716 ?auto_336720 ) ) ( not ( = ?auto_336717 ?auto_336718 ) ) ( not ( = ?auto_336717 ?auto_336719 ) ) ( not ( = ?auto_336717 ?auto_336720 ) ) ( not ( = ?auto_336718 ?auto_336719 ) ) ( not ( = ?auto_336718 ?auto_336720 ) ) ( not ( = ?auto_336719 ?auto_336720 ) ) ( ON ?auto_336718 ?auto_336719 ) ( ON ?auto_336717 ?auto_336718 ) ( CLEAR ?auto_336715 ) ( ON ?auto_336716 ?auto_336717 ) ( CLEAR ?auto_336716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_336709 ?auto_336710 ?auto_336711 ?auto_336712 ?auto_336713 ?auto_336714 ?auto_336715 ?auto_336716 )
      ( MAKE-11PILE ?auto_336709 ?auto_336710 ?auto_336711 ?auto_336712 ?auto_336713 ?auto_336714 ?auto_336715 ?auto_336716 ?auto_336717 ?auto_336718 ?auto_336719 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336732 - BLOCK
      ?auto_336733 - BLOCK
      ?auto_336734 - BLOCK
      ?auto_336735 - BLOCK
      ?auto_336736 - BLOCK
      ?auto_336737 - BLOCK
      ?auto_336738 - BLOCK
      ?auto_336739 - BLOCK
      ?auto_336740 - BLOCK
      ?auto_336741 - BLOCK
      ?auto_336742 - BLOCK
    )
    :vars
    (
      ?auto_336743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336742 ?auto_336743 ) ( ON-TABLE ?auto_336732 ) ( ON ?auto_336733 ?auto_336732 ) ( ON ?auto_336734 ?auto_336733 ) ( ON ?auto_336735 ?auto_336734 ) ( ON ?auto_336736 ?auto_336735 ) ( ON ?auto_336737 ?auto_336736 ) ( ON ?auto_336738 ?auto_336737 ) ( not ( = ?auto_336732 ?auto_336733 ) ) ( not ( = ?auto_336732 ?auto_336734 ) ) ( not ( = ?auto_336732 ?auto_336735 ) ) ( not ( = ?auto_336732 ?auto_336736 ) ) ( not ( = ?auto_336732 ?auto_336737 ) ) ( not ( = ?auto_336732 ?auto_336738 ) ) ( not ( = ?auto_336732 ?auto_336739 ) ) ( not ( = ?auto_336732 ?auto_336740 ) ) ( not ( = ?auto_336732 ?auto_336741 ) ) ( not ( = ?auto_336732 ?auto_336742 ) ) ( not ( = ?auto_336732 ?auto_336743 ) ) ( not ( = ?auto_336733 ?auto_336734 ) ) ( not ( = ?auto_336733 ?auto_336735 ) ) ( not ( = ?auto_336733 ?auto_336736 ) ) ( not ( = ?auto_336733 ?auto_336737 ) ) ( not ( = ?auto_336733 ?auto_336738 ) ) ( not ( = ?auto_336733 ?auto_336739 ) ) ( not ( = ?auto_336733 ?auto_336740 ) ) ( not ( = ?auto_336733 ?auto_336741 ) ) ( not ( = ?auto_336733 ?auto_336742 ) ) ( not ( = ?auto_336733 ?auto_336743 ) ) ( not ( = ?auto_336734 ?auto_336735 ) ) ( not ( = ?auto_336734 ?auto_336736 ) ) ( not ( = ?auto_336734 ?auto_336737 ) ) ( not ( = ?auto_336734 ?auto_336738 ) ) ( not ( = ?auto_336734 ?auto_336739 ) ) ( not ( = ?auto_336734 ?auto_336740 ) ) ( not ( = ?auto_336734 ?auto_336741 ) ) ( not ( = ?auto_336734 ?auto_336742 ) ) ( not ( = ?auto_336734 ?auto_336743 ) ) ( not ( = ?auto_336735 ?auto_336736 ) ) ( not ( = ?auto_336735 ?auto_336737 ) ) ( not ( = ?auto_336735 ?auto_336738 ) ) ( not ( = ?auto_336735 ?auto_336739 ) ) ( not ( = ?auto_336735 ?auto_336740 ) ) ( not ( = ?auto_336735 ?auto_336741 ) ) ( not ( = ?auto_336735 ?auto_336742 ) ) ( not ( = ?auto_336735 ?auto_336743 ) ) ( not ( = ?auto_336736 ?auto_336737 ) ) ( not ( = ?auto_336736 ?auto_336738 ) ) ( not ( = ?auto_336736 ?auto_336739 ) ) ( not ( = ?auto_336736 ?auto_336740 ) ) ( not ( = ?auto_336736 ?auto_336741 ) ) ( not ( = ?auto_336736 ?auto_336742 ) ) ( not ( = ?auto_336736 ?auto_336743 ) ) ( not ( = ?auto_336737 ?auto_336738 ) ) ( not ( = ?auto_336737 ?auto_336739 ) ) ( not ( = ?auto_336737 ?auto_336740 ) ) ( not ( = ?auto_336737 ?auto_336741 ) ) ( not ( = ?auto_336737 ?auto_336742 ) ) ( not ( = ?auto_336737 ?auto_336743 ) ) ( not ( = ?auto_336738 ?auto_336739 ) ) ( not ( = ?auto_336738 ?auto_336740 ) ) ( not ( = ?auto_336738 ?auto_336741 ) ) ( not ( = ?auto_336738 ?auto_336742 ) ) ( not ( = ?auto_336738 ?auto_336743 ) ) ( not ( = ?auto_336739 ?auto_336740 ) ) ( not ( = ?auto_336739 ?auto_336741 ) ) ( not ( = ?auto_336739 ?auto_336742 ) ) ( not ( = ?auto_336739 ?auto_336743 ) ) ( not ( = ?auto_336740 ?auto_336741 ) ) ( not ( = ?auto_336740 ?auto_336742 ) ) ( not ( = ?auto_336740 ?auto_336743 ) ) ( not ( = ?auto_336741 ?auto_336742 ) ) ( not ( = ?auto_336741 ?auto_336743 ) ) ( not ( = ?auto_336742 ?auto_336743 ) ) ( ON ?auto_336741 ?auto_336742 ) ( ON ?auto_336740 ?auto_336741 ) ( CLEAR ?auto_336738 ) ( ON ?auto_336739 ?auto_336740 ) ( CLEAR ?auto_336739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_336732 ?auto_336733 ?auto_336734 ?auto_336735 ?auto_336736 ?auto_336737 ?auto_336738 ?auto_336739 )
      ( MAKE-11PILE ?auto_336732 ?auto_336733 ?auto_336734 ?auto_336735 ?auto_336736 ?auto_336737 ?auto_336738 ?auto_336739 ?auto_336740 ?auto_336741 ?auto_336742 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336755 - BLOCK
      ?auto_336756 - BLOCK
      ?auto_336757 - BLOCK
      ?auto_336758 - BLOCK
      ?auto_336759 - BLOCK
      ?auto_336760 - BLOCK
      ?auto_336761 - BLOCK
      ?auto_336762 - BLOCK
      ?auto_336763 - BLOCK
      ?auto_336764 - BLOCK
      ?auto_336765 - BLOCK
    )
    :vars
    (
      ?auto_336766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336765 ?auto_336766 ) ( ON-TABLE ?auto_336755 ) ( ON ?auto_336756 ?auto_336755 ) ( ON ?auto_336757 ?auto_336756 ) ( ON ?auto_336758 ?auto_336757 ) ( ON ?auto_336759 ?auto_336758 ) ( ON ?auto_336760 ?auto_336759 ) ( not ( = ?auto_336755 ?auto_336756 ) ) ( not ( = ?auto_336755 ?auto_336757 ) ) ( not ( = ?auto_336755 ?auto_336758 ) ) ( not ( = ?auto_336755 ?auto_336759 ) ) ( not ( = ?auto_336755 ?auto_336760 ) ) ( not ( = ?auto_336755 ?auto_336761 ) ) ( not ( = ?auto_336755 ?auto_336762 ) ) ( not ( = ?auto_336755 ?auto_336763 ) ) ( not ( = ?auto_336755 ?auto_336764 ) ) ( not ( = ?auto_336755 ?auto_336765 ) ) ( not ( = ?auto_336755 ?auto_336766 ) ) ( not ( = ?auto_336756 ?auto_336757 ) ) ( not ( = ?auto_336756 ?auto_336758 ) ) ( not ( = ?auto_336756 ?auto_336759 ) ) ( not ( = ?auto_336756 ?auto_336760 ) ) ( not ( = ?auto_336756 ?auto_336761 ) ) ( not ( = ?auto_336756 ?auto_336762 ) ) ( not ( = ?auto_336756 ?auto_336763 ) ) ( not ( = ?auto_336756 ?auto_336764 ) ) ( not ( = ?auto_336756 ?auto_336765 ) ) ( not ( = ?auto_336756 ?auto_336766 ) ) ( not ( = ?auto_336757 ?auto_336758 ) ) ( not ( = ?auto_336757 ?auto_336759 ) ) ( not ( = ?auto_336757 ?auto_336760 ) ) ( not ( = ?auto_336757 ?auto_336761 ) ) ( not ( = ?auto_336757 ?auto_336762 ) ) ( not ( = ?auto_336757 ?auto_336763 ) ) ( not ( = ?auto_336757 ?auto_336764 ) ) ( not ( = ?auto_336757 ?auto_336765 ) ) ( not ( = ?auto_336757 ?auto_336766 ) ) ( not ( = ?auto_336758 ?auto_336759 ) ) ( not ( = ?auto_336758 ?auto_336760 ) ) ( not ( = ?auto_336758 ?auto_336761 ) ) ( not ( = ?auto_336758 ?auto_336762 ) ) ( not ( = ?auto_336758 ?auto_336763 ) ) ( not ( = ?auto_336758 ?auto_336764 ) ) ( not ( = ?auto_336758 ?auto_336765 ) ) ( not ( = ?auto_336758 ?auto_336766 ) ) ( not ( = ?auto_336759 ?auto_336760 ) ) ( not ( = ?auto_336759 ?auto_336761 ) ) ( not ( = ?auto_336759 ?auto_336762 ) ) ( not ( = ?auto_336759 ?auto_336763 ) ) ( not ( = ?auto_336759 ?auto_336764 ) ) ( not ( = ?auto_336759 ?auto_336765 ) ) ( not ( = ?auto_336759 ?auto_336766 ) ) ( not ( = ?auto_336760 ?auto_336761 ) ) ( not ( = ?auto_336760 ?auto_336762 ) ) ( not ( = ?auto_336760 ?auto_336763 ) ) ( not ( = ?auto_336760 ?auto_336764 ) ) ( not ( = ?auto_336760 ?auto_336765 ) ) ( not ( = ?auto_336760 ?auto_336766 ) ) ( not ( = ?auto_336761 ?auto_336762 ) ) ( not ( = ?auto_336761 ?auto_336763 ) ) ( not ( = ?auto_336761 ?auto_336764 ) ) ( not ( = ?auto_336761 ?auto_336765 ) ) ( not ( = ?auto_336761 ?auto_336766 ) ) ( not ( = ?auto_336762 ?auto_336763 ) ) ( not ( = ?auto_336762 ?auto_336764 ) ) ( not ( = ?auto_336762 ?auto_336765 ) ) ( not ( = ?auto_336762 ?auto_336766 ) ) ( not ( = ?auto_336763 ?auto_336764 ) ) ( not ( = ?auto_336763 ?auto_336765 ) ) ( not ( = ?auto_336763 ?auto_336766 ) ) ( not ( = ?auto_336764 ?auto_336765 ) ) ( not ( = ?auto_336764 ?auto_336766 ) ) ( not ( = ?auto_336765 ?auto_336766 ) ) ( ON ?auto_336764 ?auto_336765 ) ( ON ?auto_336763 ?auto_336764 ) ( ON ?auto_336762 ?auto_336763 ) ( CLEAR ?auto_336760 ) ( ON ?auto_336761 ?auto_336762 ) ( CLEAR ?auto_336761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_336755 ?auto_336756 ?auto_336757 ?auto_336758 ?auto_336759 ?auto_336760 ?auto_336761 )
      ( MAKE-11PILE ?auto_336755 ?auto_336756 ?auto_336757 ?auto_336758 ?auto_336759 ?auto_336760 ?auto_336761 ?auto_336762 ?auto_336763 ?auto_336764 ?auto_336765 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336778 - BLOCK
      ?auto_336779 - BLOCK
      ?auto_336780 - BLOCK
      ?auto_336781 - BLOCK
      ?auto_336782 - BLOCK
      ?auto_336783 - BLOCK
      ?auto_336784 - BLOCK
      ?auto_336785 - BLOCK
      ?auto_336786 - BLOCK
      ?auto_336787 - BLOCK
      ?auto_336788 - BLOCK
    )
    :vars
    (
      ?auto_336789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336788 ?auto_336789 ) ( ON-TABLE ?auto_336778 ) ( ON ?auto_336779 ?auto_336778 ) ( ON ?auto_336780 ?auto_336779 ) ( ON ?auto_336781 ?auto_336780 ) ( ON ?auto_336782 ?auto_336781 ) ( ON ?auto_336783 ?auto_336782 ) ( not ( = ?auto_336778 ?auto_336779 ) ) ( not ( = ?auto_336778 ?auto_336780 ) ) ( not ( = ?auto_336778 ?auto_336781 ) ) ( not ( = ?auto_336778 ?auto_336782 ) ) ( not ( = ?auto_336778 ?auto_336783 ) ) ( not ( = ?auto_336778 ?auto_336784 ) ) ( not ( = ?auto_336778 ?auto_336785 ) ) ( not ( = ?auto_336778 ?auto_336786 ) ) ( not ( = ?auto_336778 ?auto_336787 ) ) ( not ( = ?auto_336778 ?auto_336788 ) ) ( not ( = ?auto_336778 ?auto_336789 ) ) ( not ( = ?auto_336779 ?auto_336780 ) ) ( not ( = ?auto_336779 ?auto_336781 ) ) ( not ( = ?auto_336779 ?auto_336782 ) ) ( not ( = ?auto_336779 ?auto_336783 ) ) ( not ( = ?auto_336779 ?auto_336784 ) ) ( not ( = ?auto_336779 ?auto_336785 ) ) ( not ( = ?auto_336779 ?auto_336786 ) ) ( not ( = ?auto_336779 ?auto_336787 ) ) ( not ( = ?auto_336779 ?auto_336788 ) ) ( not ( = ?auto_336779 ?auto_336789 ) ) ( not ( = ?auto_336780 ?auto_336781 ) ) ( not ( = ?auto_336780 ?auto_336782 ) ) ( not ( = ?auto_336780 ?auto_336783 ) ) ( not ( = ?auto_336780 ?auto_336784 ) ) ( not ( = ?auto_336780 ?auto_336785 ) ) ( not ( = ?auto_336780 ?auto_336786 ) ) ( not ( = ?auto_336780 ?auto_336787 ) ) ( not ( = ?auto_336780 ?auto_336788 ) ) ( not ( = ?auto_336780 ?auto_336789 ) ) ( not ( = ?auto_336781 ?auto_336782 ) ) ( not ( = ?auto_336781 ?auto_336783 ) ) ( not ( = ?auto_336781 ?auto_336784 ) ) ( not ( = ?auto_336781 ?auto_336785 ) ) ( not ( = ?auto_336781 ?auto_336786 ) ) ( not ( = ?auto_336781 ?auto_336787 ) ) ( not ( = ?auto_336781 ?auto_336788 ) ) ( not ( = ?auto_336781 ?auto_336789 ) ) ( not ( = ?auto_336782 ?auto_336783 ) ) ( not ( = ?auto_336782 ?auto_336784 ) ) ( not ( = ?auto_336782 ?auto_336785 ) ) ( not ( = ?auto_336782 ?auto_336786 ) ) ( not ( = ?auto_336782 ?auto_336787 ) ) ( not ( = ?auto_336782 ?auto_336788 ) ) ( not ( = ?auto_336782 ?auto_336789 ) ) ( not ( = ?auto_336783 ?auto_336784 ) ) ( not ( = ?auto_336783 ?auto_336785 ) ) ( not ( = ?auto_336783 ?auto_336786 ) ) ( not ( = ?auto_336783 ?auto_336787 ) ) ( not ( = ?auto_336783 ?auto_336788 ) ) ( not ( = ?auto_336783 ?auto_336789 ) ) ( not ( = ?auto_336784 ?auto_336785 ) ) ( not ( = ?auto_336784 ?auto_336786 ) ) ( not ( = ?auto_336784 ?auto_336787 ) ) ( not ( = ?auto_336784 ?auto_336788 ) ) ( not ( = ?auto_336784 ?auto_336789 ) ) ( not ( = ?auto_336785 ?auto_336786 ) ) ( not ( = ?auto_336785 ?auto_336787 ) ) ( not ( = ?auto_336785 ?auto_336788 ) ) ( not ( = ?auto_336785 ?auto_336789 ) ) ( not ( = ?auto_336786 ?auto_336787 ) ) ( not ( = ?auto_336786 ?auto_336788 ) ) ( not ( = ?auto_336786 ?auto_336789 ) ) ( not ( = ?auto_336787 ?auto_336788 ) ) ( not ( = ?auto_336787 ?auto_336789 ) ) ( not ( = ?auto_336788 ?auto_336789 ) ) ( ON ?auto_336787 ?auto_336788 ) ( ON ?auto_336786 ?auto_336787 ) ( ON ?auto_336785 ?auto_336786 ) ( CLEAR ?auto_336783 ) ( ON ?auto_336784 ?auto_336785 ) ( CLEAR ?auto_336784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_336778 ?auto_336779 ?auto_336780 ?auto_336781 ?auto_336782 ?auto_336783 ?auto_336784 )
      ( MAKE-11PILE ?auto_336778 ?auto_336779 ?auto_336780 ?auto_336781 ?auto_336782 ?auto_336783 ?auto_336784 ?auto_336785 ?auto_336786 ?auto_336787 ?auto_336788 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336801 - BLOCK
      ?auto_336802 - BLOCK
      ?auto_336803 - BLOCK
      ?auto_336804 - BLOCK
      ?auto_336805 - BLOCK
      ?auto_336806 - BLOCK
      ?auto_336807 - BLOCK
      ?auto_336808 - BLOCK
      ?auto_336809 - BLOCK
      ?auto_336810 - BLOCK
      ?auto_336811 - BLOCK
    )
    :vars
    (
      ?auto_336812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336811 ?auto_336812 ) ( ON-TABLE ?auto_336801 ) ( ON ?auto_336802 ?auto_336801 ) ( ON ?auto_336803 ?auto_336802 ) ( ON ?auto_336804 ?auto_336803 ) ( ON ?auto_336805 ?auto_336804 ) ( not ( = ?auto_336801 ?auto_336802 ) ) ( not ( = ?auto_336801 ?auto_336803 ) ) ( not ( = ?auto_336801 ?auto_336804 ) ) ( not ( = ?auto_336801 ?auto_336805 ) ) ( not ( = ?auto_336801 ?auto_336806 ) ) ( not ( = ?auto_336801 ?auto_336807 ) ) ( not ( = ?auto_336801 ?auto_336808 ) ) ( not ( = ?auto_336801 ?auto_336809 ) ) ( not ( = ?auto_336801 ?auto_336810 ) ) ( not ( = ?auto_336801 ?auto_336811 ) ) ( not ( = ?auto_336801 ?auto_336812 ) ) ( not ( = ?auto_336802 ?auto_336803 ) ) ( not ( = ?auto_336802 ?auto_336804 ) ) ( not ( = ?auto_336802 ?auto_336805 ) ) ( not ( = ?auto_336802 ?auto_336806 ) ) ( not ( = ?auto_336802 ?auto_336807 ) ) ( not ( = ?auto_336802 ?auto_336808 ) ) ( not ( = ?auto_336802 ?auto_336809 ) ) ( not ( = ?auto_336802 ?auto_336810 ) ) ( not ( = ?auto_336802 ?auto_336811 ) ) ( not ( = ?auto_336802 ?auto_336812 ) ) ( not ( = ?auto_336803 ?auto_336804 ) ) ( not ( = ?auto_336803 ?auto_336805 ) ) ( not ( = ?auto_336803 ?auto_336806 ) ) ( not ( = ?auto_336803 ?auto_336807 ) ) ( not ( = ?auto_336803 ?auto_336808 ) ) ( not ( = ?auto_336803 ?auto_336809 ) ) ( not ( = ?auto_336803 ?auto_336810 ) ) ( not ( = ?auto_336803 ?auto_336811 ) ) ( not ( = ?auto_336803 ?auto_336812 ) ) ( not ( = ?auto_336804 ?auto_336805 ) ) ( not ( = ?auto_336804 ?auto_336806 ) ) ( not ( = ?auto_336804 ?auto_336807 ) ) ( not ( = ?auto_336804 ?auto_336808 ) ) ( not ( = ?auto_336804 ?auto_336809 ) ) ( not ( = ?auto_336804 ?auto_336810 ) ) ( not ( = ?auto_336804 ?auto_336811 ) ) ( not ( = ?auto_336804 ?auto_336812 ) ) ( not ( = ?auto_336805 ?auto_336806 ) ) ( not ( = ?auto_336805 ?auto_336807 ) ) ( not ( = ?auto_336805 ?auto_336808 ) ) ( not ( = ?auto_336805 ?auto_336809 ) ) ( not ( = ?auto_336805 ?auto_336810 ) ) ( not ( = ?auto_336805 ?auto_336811 ) ) ( not ( = ?auto_336805 ?auto_336812 ) ) ( not ( = ?auto_336806 ?auto_336807 ) ) ( not ( = ?auto_336806 ?auto_336808 ) ) ( not ( = ?auto_336806 ?auto_336809 ) ) ( not ( = ?auto_336806 ?auto_336810 ) ) ( not ( = ?auto_336806 ?auto_336811 ) ) ( not ( = ?auto_336806 ?auto_336812 ) ) ( not ( = ?auto_336807 ?auto_336808 ) ) ( not ( = ?auto_336807 ?auto_336809 ) ) ( not ( = ?auto_336807 ?auto_336810 ) ) ( not ( = ?auto_336807 ?auto_336811 ) ) ( not ( = ?auto_336807 ?auto_336812 ) ) ( not ( = ?auto_336808 ?auto_336809 ) ) ( not ( = ?auto_336808 ?auto_336810 ) ) ( not ( = ?auto_336808 ?auto_336811 ) ) ( not ( = ?auto_336808 ?auto_336812 ) ) ( not ( = ?auto_336809 ?auto_336810 ) ) ( not ( = ?auto_336809 ?auto_336811 ) ) ( not ( = ?auto_336809 ?auto_336812 ) ) ( not ( = ?auto_336810 ?auto_336811 ) ) ( not ( = ?auto_336810 ?auto_336812 ) ) ( not ( = ?auto_336811 ?auto_336812 ) ) ( ON ?auto_336810 ?auto_336811 ) ( ON ?auto_336809 ?auto_336810 ) ( ON ?auto_336808 ?auto_336809 ) ( ON ?auto_336807 ?auto_336808 ) ( CLEAR ?auto_336805 ) ( ON ?auto_336806 ?auto_336807 ) ( CLEAR ?auto_336806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_336801 ?auto_336802 ?auto_336803 ?auto_336804 ?auto_336805 ?auto_336806 )
      ( MAKE-11PILE ?auto_336801 ?auto_336802 ?auto_336803 ?auto_336804 ?auto_336805 ?auto_336806 ?auto_336807 ?auto_336808 ?auto_336809 ?auto_336810 ?auto_336811 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336824 - BLOCK
      ?auto_336825 - BLOCK
      ?auto_336826 - BLOCK
      ?auto_336827 - BLOCK
      ?auto_336828 - BLOCK
      ?auto_336829 - BLOCK
      ?auto_336830 - BLOCK
      ?auto_336831 - BLOCK
      ?auto_336832 - BLOCK
      ?auto_336833 - BLOCK
      ?auto_336834 - BLOCK
    )
    :vars
    (
      ?auto_336835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336834 ?auto_336835 ) ( ON-TABLE ?auto_336824 ) ( ON ?auto_336825 ?auto_336824 ) ( ON ?auto_336826 ?auto_336825 ) ( ON ?auto_336827 ?auto_336826 ) ( ON ?auto_336828 ?auto_336827 ) ( not ( = ?auto_336824 ?auto_336825 ) ) ( not ( = ?auto_336824 ?auto_336826 ) ) ( not ( = ?auto_336824 ?auto_336827 ) ) ( not ( = ?auto_336824 ?auto_336828 ) ) ( not ( = ?auto_336824 ?auto_336829 ) ) ( not ( = ?auto_336824 ?auto_336830 ) ) ( not ( = ?auto_336824 ?auto_336831 ) ) ( not ( = ?auto_336824 ?auto_336832 ) ) ( not ( = ?auto_336824 ?auto_336833 ) ) ( not ( = ?auto_336824 ?auto_336834 ) ) ( not ( = ?auto_336824 ?auto_336835 ) ) ( not ( = ?auto_336825 ?auto_336826 ) ) ( not ( = ?auto_336825 ?auto_336827 ) ) ( not ( = ?auto_336825 ?auto_336828 ) ) ( not ( = ?auto_336825 ?auto_336829 ) ) ( not ( = ?auto_336825 ?auto_336830 ) ) ( not ( = ?auto_336825 ?auto_336831 ) ) ( not ( = ?auto_336825 ?auto_336832 ) ) ( not ( = ?auto_336825 ?auto_336833 ) ) ( not ( = ?auto_336825 ?auto_336834 ) ) ( not ( = ?auto_336825 ?auto_336835 ) ) ( not ( = ?auto_336826 ?auto_336827 ) ) ( not ( = ?auto_336826 ?auto_336828 ) ) ( not ( = ?auto_336826 ?auto_336829 ) ) ( not ( = ?auto_336826 ?auto_336830 ) ) ( not ( = ?auto_336826 ?auto_336831 ) ) ( not ( = ?auto_336826 ?auto_336832 ) ) ( not ( = ?auto_336826 ?auto_336833 ) ) ( not ( = ?auto_336826 ?auto_336834 ) ) ( not ( = ?auto_336826 ?auto_336835 ) ) ( not ( = ?auto_336827 ?auto_336828 ) ) ( not ( = ?auto_336827 ?auto_336829 ) ) ( not ( = ?auto_336827 ?auto_336830 ) ) ( not ( = ?auto_336827 ?auto_336831 ) ) ( not ( = ?auto_336827 ?auto_336832 ) ) ( not ( = ?auto_336827 ?auto_336833 ) ) ( not ( = ?auto_336827 ?auto_336834 ) ) ( not ( = ?auto_336827 ?auto_336835 ) ) ( not ( = ?auto_336828 ?auto_336829 ) ) ( not ( = ?auto_336828 ?auto_336830 ) ) ( not ( = ?auto_336828 ?auto_336831 ) ) ( not ( = ?auto_336828 ?auto_336832 ) ) ( not ( = ?auto_336828 ?auto_336833 ) ) ( not ( = ?auto_336828 ?auto_336834 ) ) ( not ( = ?auto_336828 ?auto_336835 ) ) ( not ( = ?auto_336829 ?auto_336830 ) ) ( not ( = ?auto_336829 ?auto_336831 ) ) ( not ( = ?auto_336829 ?auto_336832 ) ) ( not ( = ?auto_336829 ?auto_336833 ) ) ( not ( = ?auto_336829 ?auto_336834 ) ) ( not ( = ?auto_336829 ?auto_336835 ) ) ( not ( = ?auto_336830 ?auto_336831 ) ) ( not ( = ?auto_336830 ?auto_336832 ) ) ( not ( = ?auto_336830 ?auto_336833 ) ) ( not ( = ?auto_336830 ?auto_336834 ) ) ( not ( = ?auto_336830 ?auto_336835 ) ) ( not ( = ?auto_336831 ?auto_336832 ) ) ( not ( = ?auto_336831 ?auto_336833 ) ) ( not ( = ?auto_336831 ?auto_336834 ) ) ( not ( = ?auto_336831 ?auto_336835 ) ) ( not ( = ?auto_336832 ?auto_336833 ) ) ( not ( = ?auto_336832 ?auto_336834 ) ) ( not ( = ?auto_336832 ?auto_336835 ) ) ( not ( = ?auto_336833 ?auto_336834 ) ) ( not ( = ?auto_336833 ?auto_336835 ) ) ( not ( = ?auto_336834 ?auto_336835 ) ) ( ON ?auto_336833 ?auto_336834 ) ( ON ?auto_336832 ?auto_336833 ) ( ON ?auto_336831 ?auto_336832 ) ( ON ?auto_336830 ?auto_336831 ) ( CLEAR ?auto_336828 ) ( ON ?auto_336829 ?auto_336830 ) ( CLEAR ?auto_336829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_336824 ?auto_336825 ?auto_336826 ?auto_336827 ?auto_336828 ?auto_336829 )
      ( MAKE-11PILE ?auto_336824 ?auto_336825 ?auto_336826 ?auto_336827 ?auto_336828 ?auto_336829 ?auto_336830 ?auto_336831 ?auto_336832 ?auto_336833 ?auto_336834 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336847 - BLOCK
      ?auto_336848 - BLOCK
      ?auto_336849 - BLOCK
      ?auto_336850 - BLOCK
      ?auto_336851 - BLOCK
      ?auto_336852 - BLOCK
      ?auto_336853 - BLOCK
      ?auto_336854 - BLOCK
      ?auto_336855 - BLOCK
      ?auto_336856 - BLOCK
      ?auto_336857 - BLOCK
    )
    :vars
    (
      ?auto_336858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336857 ?auto_336858 ) ( ON-TABLE ?auto_336847 ) ( ON ?auto_336848 ?auto_336847 ) ( ON ?auto_336849 ?auto_336848 ) ( ON ?auto_336850 ?auto_336849 ) ( not ( = ?auto_336847 ?auto_336848 ) ) ( not ( = ?auto_336847 ?auto_336849 ) ) ( not ( = ?auto_336847 ?auto_336850 ) ) ( not ( = ?auto_336847 ?auto_336851 ) ) ( not ( = ?auto_336847 ?auto_336852 ) ) ( not ( = ?auto_336847 ?auto_336853 ) ) ( not ( = ?auto_336847 ?auto_336854 ) ) ( not ( = ?auto_336847 ?auto_336855 ) ) ( not ( = ?auto_336847 ?auto_336856 ) ) ( not ( = ?auto_336847 ?auto_336857 ) ) ( not ( = ?auto_336847 ?auto_336858 ) ) ( not ( = ?auto_336848 ?auto_336849 ) ) ( not ( = ?auto_336848 ?auto_336850 ) ) ( not ( = ?auto_336848 ?auto_336851 ) ) ( not ( = ?auto_336848 ?auto_336852 ) ) ( not ( = ?auto_336848 ?auto_336853 ) ) ( not ( = ?auto_336848 ?auto_336854 ) ) ( not ( = ?auto_336848 ?auto_336855 ) ) ( not ( = ?auto_336848 ?auto_336856 ) ) ( not ( = ?auto_336848 ?auto_336857 ) ) ( not ( = ?auto_336848 ?auto_336858 ) ) ( not ( = ?auto_336849 ?auto_336850 ) ) ( not ( = ?auto_336849 ?auto_336851 ) ) ( not ( = ?auto_336849 ?auto_336852 ) ) ( not ( = ?auto_336849 ?auto_336853 ) ) ( not ( = ?auto_336849 ?auto_336854 ) ) ( not ( = ?auto_336849 ?auto_336855 ) ) ( not ( = ?auto_336849 ?auto_336856 ) ) ( not ( = ?auto_336849 ?auto_336857 ) ) ( not ( = ?auto_336849 ?auto_336858 ) ) ( not ( = ?auto_336850 ?auto_336851 ) ) ( not ( = ?auto_336850 ?auto_336852 ) ) ( not ( = ?auto_336850 ?auto_336853 ) ) ( not ( = ?auto_336850 ?auto_336854 ) ) ( not ( = ?auto_336850 ?auto_336855 ) ) ( not ( = ?auto_336850 ?auto_336856 ) ) ( not ( = ?auto_336850 ?auto_336857 ) ) ( not ( = ?auto_336850 ?auto_336858 ) ) ( not ( = ?auto_336851 ?auto_336852 ) ) ( not ( = ?auto_336851 ?auto_336853 ) ) ( not ( = ?auto_336851 ?auto_336854 ) ) ( not ( = ?auto_336851 ?auto_336855 ) ) ( not ( = ?auto_336851 ?auto_336856 ) ) ( not ( = ?auto_336851 ?auto_336857 ) ) ( not ( = ?auto_336851 ?auto_336858 ) ) ( not ( = ?auto_336852 ?auto_336853 ) ) ( not ( = ?auto_336852 ?auto_336854 ) ) ( not ( = ?auto_336852 ?auto_336855 ) ) ( not ( = ?auto_336852 ?auto_336856 ) ) ( not ( = ?auto_336852 ?auto_336857 ) ) ( not ( = ?auto_336852 ?auto_336858 ) ) ( not ( = ?auto_336853 ?auto_336854 ) ) ( not ( = ?auto_336853 ?auto_336855 ) ) ( not ( = ?auto_336853 ?auto_336856 ) ) ( not ( = ?auto_336853 ?auto_336857 ) ) ( not ( = ?auto_336853 ?auto_336858 ) ) ( not ( = ?auto_336854 ?auto_336855 ) ) ( not ( = ?auto_336854 ?auto_336856 ) ) ( not ( = ?auto_336854 ?auto_336857 ) ) ( not ( = ?auto_336854 ?auto_336858 ) ) ( not ( = ?auto_336855 ?auto_336856 ) ) ( not ( = ?auto_336855 ?auto_336857 ) ) ( not ( = ?auto_336855 ?auto_336858 ) ) ( not ( = ?auto_336856 ?auto_336857 ) ) ( not ( = ?auto_336856 ?auto_336858 ) ) ( not ( = ?auto_336857 ?auto_336858 ) ) ( ON ?auto_336856 ?auto_336857 ) ( ON ?auto_336855 ?auto_336856 ) ( ON ?auto_336854 ?auto_336855 ) ( ON ?auto_336853 ?auto_336854 ) ( ON ?auto_336852 ?auto_336853 ) ( CLEAR ?auto_336850 ) ( ON ?auto_336851 ?auto_336852 ) ( CLEAR ?auto_336851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_336847 ?auto_336848 ?auto_336849 ?auto_336850 ?auto_336851 )
      ( MAKE-11PILE ?auto_336847 ?auto_336848 ?auto_336849 ?auto_336850 ?auto_336851 ?auto_336852 ?auto_336853 ?auto_336854 ?auto_336855 ?auto_336856 ?auto_336857 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336870 - BLOCK
      ?auto_336871 - BLOCK
      ?auto_336872 - BLOCK
      ?auto_336873 - BLOCK
      ?auto_336874 - BLOCK
      ?auto_336875 - BLOCK
      ?auto_336876 - BLOCK
      ?auto_336877 - BLOCK
      ?auto_336878 - BLOCK
      ?auto_336879 - BLOCK
      ?auto_336880 - BLOCK
    )
    :vars
    (
      ?auto_336881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336880 ?auto_336881 ) ( ON-TABLE ?auto_336870 ) ( ON ?auto_336871 ?auto_336870 ) ( ON ?auto_336872 ?auto_336871 ) ( ON ?auto_336873 ?auto_336872 ) ( not ( = ?auto_336870 ?auto_336871 ) ) ( not ( = ?auto_336870 ?auto_336872 ) ) ( not ( = ?auto_336870 ?auto_336873 ) ) ( not ( = ?auto_336870 ?auto_336874 ) ) ( not ( = ?auto_336870 ?auto_336875 ) ) ( not ( = ?auto_336870 ?auto_336876 ) ) ( not ( = ?auto_336870 ?auto_336877 ) ) ( not ( = ?auto_336870 ?auto_336878 ) ) ( not ( = ?auto_336870 ?auto_336879 ) ) ( not ( = ?auto_336870 ?auto_336880 ) ) ( not ( = ?auto_336870 ?auto_336881 ) ) ( not ( = ?auto_336871 ?auto_336872 ) ) ( not ( = ?auto_336871 ?auto_336873 ) ) ( not ( = ?auto_336871 ?auto_336874 ) ) ( not ( = ?auto_336871 ?auto_336875 ) ) ( not ( = ?auto_336871 ?auto_336876 ) ) ( not ( = ?auto_336871 ?auto_336877 ) ) ( not ( = ?auto_336871 ?auto_336878 ) ) ( not ( = ?auto_336871 ?auto_336879 ) ) ( not ( = ?auto_336871 ?auto_336880 ) ) ( not ( = ?auto_336871 ?auto_336881 ) ) ( not ( = ?auto_336872 ?auto_336873 ) ) ( not ( = ?auto_336872 ?auto_336874 ) ) ( not ( = ?auto_336872 ?auto_336875 ) ) ( not ( = ?auto_336872 ?auto_336876 ) ) ( not ( = ?auto_336872 ?auto_336877 ) ) ( not ( = ?auto_336872 ?auto_336878 ) ) ( not ( = ?auto_336872 ?auto_336879 ) ) ( not ( = ?auto_336872 ?auto_336880 ) ) ( not ( = ?auto_336872 ?auto_336881 ) ) ( not ( = ?auto_336873 ?auto_336874 ) ) ( not ( = ?auto_336873 ?auto_336875 ) ) ( not ( = ?auto_336873 ?auto_336876 ) ) ( not ( = ?auto_336873 ?auto_336877 ) ) ( not ( = ?auto_336873 ?auto_336878 ) ) ( not ( = ?auto_336873 ?auto_336879 ) ) ( not ( = ?auto_336873 ?auto_336880 ) ) ( not ( = ?auto_336873 ?auto_336881 ) ) ( not ( = ?auto_336874 ?auto_336875 ) ) ( not ( = ?auto_336874 ?auto_336876 ) ) ( not ( = ?auto_336874 ?auto_336877 ) ) ( not ( = ?auto_336874 ?auto_336878 ) ) ( not ( = ?auto_336874 ?auto_336879 ) ) ( not ( = ?auto_336874 ?auto_336880 ) ) ( not ( = ?auto_336874 ?auto_336881 ) ) ( not ( = ?auto_336875 ?auto_336876 ) ) ( not ( = ?auto_336875 ?auto_336877 ) ) ( not ( = ?auto_336875 ?auto_336878 ) ) ( not ( = ?auto_336875 ?auto_336879 ) ) ( not ( = ?auto_336875 ?auto_336880 ) ) ( not ( = ?auto_336875 ?auto_336881 ) ) ( not ( = ?auto_336876 ?auto_336877 ) ) ( not ( = ?auto_336876 ?auto_336878 ) ) ( not ( = ?auto_336876 ?auto_336879 ) ) ( not ( = ?auto_336876 ?auto_336880 ) ) ( not ( = ?auto_336876 ?auto_336881 ) ) ( not ( = ?auto_336877 ?auto_336878 ) ) ( not ( = ?auto_336877 ?auto_336879 ) ) ( not ( = ?auto_336877 ?auto_336880 ) ) ( not ( = ?auto_336877 ?auto_336881 ) ) ( not ( = ?auto_336878 ?auto_336879 ) ) ( not ( = ?auto_336878 ?auto_336880 ) ) ( not ( = ?auto_336878 ?auto_336881 ) ) ( not ( = ?auto_336879 ?auto_336880 ) ) ( not ( = ?auto_336879 ?auto_336881 ) ) ( not ( = ?auto_336880 ?auto_336881 ) ) ( ON ?auto_336879 ?auto_336880 ) ( ON ?auto_336878 ?auto_336879 ) ( ON ?auto_336877 ?auto_336878 ) ( ON ?auto_336876 ?auto_336877 ) ( ON ?auto_336875 ?auto_336876 ) ( CLEAR ?auto_336873 ) ( ON ?auto_336874 ?auto_336875 ) ( CLEAR ?auto_336874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_336870 ?auto_336871 ?auto_336872 ?auto_336873 ?auto_336874 )
      ( MAKE-11PILE ?auto_336870 ?auto_336871 ?auto_336872 ?auto_336873 ?auto_336874 ?auto_336875 ?auto_336876 ?auto_336877 ?auto_336878 ?auto_336879 ?auto_336880 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336893 - BLOCK
      ?auto_336894 - BLOCK
      ?auto_336895 - BLOCK
      ?auto_336896 - BLOCK
      ?auto_336897 - BLOCK
      ?auto_336898 - BLOCK
      ?auto_336899 - BLOCK
      ?auto_336900 - BLOCK
      ?auto_336901 - BLOCK
      ?auto_336902 - BLOCK
      ?auto_336903 - BLOCK
    )
    :vars
    (
      ?auto_336904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336903 ?auto_336904 ) ( ON-TABLE ?auto_336893 ) ( ON ?auto_336894 ?auto_336893 ) ( ON ?auto_336895 ?auto_336894 ) ( not ( = ?auto_336893 ?auto_336894 ) ) ( not ( = ?auto_336893 ?auto_336895 ) ) ( not ( = ?auto_336893 ?auto_336896 ) ) ( not ( = ?auto_336893 ?auto_336897 ) ) ( not ( = ?auto_336893 ?auto_336898 ) ) ( not ( = ?auto_336893 ?auto_336899 ) ) ( not ( = ?auto_336893 ?auto_336900 ) ) ( not ( = ?auto_336893 ?auto_336901 ) ) ( not ( = ?auto_336893 ?auto_336902 ) ) ( not ( = ?auto_336893 ?auto_336903 ) ) ( not ( = ?auto_336893 ?auto_336904 ) ) ( not ( = ?auto_336894 ?auto_336895 ) ) ( not ( = ?auto_336894 ?auto_336896 ) ) ( not ( = ?auto_336894 ?auto_336897 ) ) ( not ( = ?auto_336894 ?auto_336898 ) ) ( not ( = ?auto_336894 ?auto_336899 ) ) ( not ( = ?auto_336894 ?auto_336900 ) ) ( not ( = ?auto_336894 ?auto_336901 ) ) ( not ( = ?auto_336894 ?auto_336902 ) ) ( not ( = ?auto_336894 ?auto_336903 ) ) ( not ( = ?auto_336894 ?auto_336904 ) ) ( not ( = ?auto_336895 ?auto_336896 ) ) ( not ( = ?auto_336895 ?auto_336897 ) ) ( not ( = ?auto_336895 ?auto_336898 ) ) ( not ( = ?auto_336895 ?auto_336899 ) ) ( not ( = ?auto_336895 ?auto_336900 ) ) ( not ( = ?auto_336895 ?auto_336901 ) ) ( not ( = ?auto_336895 ?auto_336902 ) ) ( not ( = ?auto_336895 ?auto_336903 ) ) ( not ( = ?auto_336895 ?auto_336904 ) ) ( not ( = ?auto_336896 ?auto_336897 ) ) ( not ( = ?auto_336896 ?auto_336898 ) ) ( not ( = ?auto_336896 ?auto_336899 ) ) ( not ( = ?auto_336896 ?auto_336900 ) ) ( not ( = ?auto_336896 ?auto_336901 ) ) ( not ( = ?auto_336896 ?auto_336902 ) ) ( not ( = ?auto_336896 ?auto_336903 ) ) ( not ( = ?auto_336896 ?auto_336904 ) ) ( not ( = ?auto_336897 ?auto_336898 ) ) ( not ( = ?auto_336897 ?auto_336899 ) ) ( not ( = ?auto_336897 ?auto_336900 ) ) ( not ( = ?auto_336897 ?auto_336901 ) ) ( not ( = ?auto_336897 ?auto_336902 ) ) ( not ( = ?auto_336897 ?auto_336903 ) ) ( not ( = ?auto_336897 ?auto_336904 ) ) ( not ( = ?auto_336898 ?auto_336899 ) ) ( not ( = ?auto_336898 ?auto_336900 ) ) ( not ( = ?auto_336898 ?auto_336901 ) ) ( not ( = ?auto_336898 ?auto_336902 ) ) ( not ( = ?auto_336898 ?auto_336903 ) ) ( not ( = ?auto_336898 ?auto_336904 ) ) ( not ( = ?auto_336899 ?auto_336900 ) ) ( not ( = ?auto_336899 ?auto_336901 ) ) ( not ( = ?auto_336899 ?auto_336902 ) ) ( not ( = ?auto_336899 ?auto_336903 ) ) ( not ( = ?auto_336899 ?auto_336904 ) ) ( not ( = ?auto_336900 ?auto_336901 ) ) ( not ( = ?auto_336900 ?auto_336902 ) ) ( not ( = ?auto_336900 ?auto_336903 ) ) ( not ( = ?auto_336900 ?auto_336904 ) ) ( not ( = ?auto_336901 ?auto_336902 ) ) ( not ( = ?auto_336901 ?auto_336903 ) ) ( not ( = ?auto_336901 ?auto_336904 ) ) ( not ( = ?auto_336902 ?auto_336903 ) ) ( not ( = ?auto_336902 ?auto_336904 ) ) ( not ( = ?auto_336903 ?auto_336904 ) ) ( ON ?auto_336902 ?auto_336903 ) ( ON ?auto_336901 ?auto_336902 ) ( ON ?auto_336900 ?auto_336901 ) ( ON ?auto_336899 ?auto_336900 ) ( ON ?auto_336898 ?auto_336899 ) ( ON ?auto_336897 ?auto_336898 ) ( CLEAR ?auto_336895 ) ( ON ?auto_336896 ?auto_336897 ) ( CLEAR ?auto_336896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_336893 ?auto_336894 ?auto_336895 ?auto_336896 )
      ( MAKE-11PILE ?auto_336893 ?auto_336894 ?auto_336895 ?auto_336896 ?auto_336897 ?auto_336898 ?auto_336899 ?auto_336900 ?auto_336901 ?auto_336902 ?auto_336903 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336916 - BLOCK
      ?auto_336917 - BLOCK
      ?auto_336918 - BLOCK
      ?auto_336919 - BLOCK
      ?auto_336920 - BLOCK
      ?auto_336921 - BLOCK
      ?auto_336922 - BLOCK
      ?auto_336923 - BLOCK
      ?auto_336924 - BLOCK
      ?auto_336925 - BLOCK
      ?auto_336926 - BLOCK
    )
    :vars
    (
      ?auto_336927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336926 ?auto_336927 ) ( ON-TABLE ?auto_336916 ) ( ON ?auto_336917 ?auto_336916 ) ( ON ?auto_336918 ?auto_336917 ) ( not ( = ?auto_336916 ?auto_336917 ) ) ( not ( = ?auto_336916 ?auto_336918 ) ) ( not ( = ?auto_336916 ?auto_336919 ) ) ( not ( = ?auto_336916 ?auto_336920 ) ) ( not ( = ?auto_336916 ?auto_336921 ) ) ( not ( = ?auto_336916 ?auto_336922 ) ) ( not ( = ?auto_336916 ?auto_336923 ) ) ( not ( = ?auto_336916 ?auto_336924 ) ) ( not ( = ?auto_336916 ?auto_336925 ) ) ( not ( = ?auto_336916 ?auto_336926 ) ) ( not ( = ?auto_336916 ?auto_336927 ) ) ( not ( = ?auto_336917 ?auto_336918 ) ) ( not ( = ?auto_336917 ?auto_336919 ) ) ( not ( = ?auto_336917 ?auto_336920 ) ) ( not ( = ?auto_336917 ?auto_336921 ) ) ( not ( = ?auto_336917 ?auto_336922 ) ) ( not ( = ?auto_336917 ?auto_336923 ) ) ( not ( = ?auto_336917 ?auto_336924 ) ) ( not ( = ?auto_336917 ?auto_336925 ) ) ( not ( = ?auto_336917 ?auto_336926 ) ) ( not ( = ?auto_336917 ?auto_336927 ) ) ( not ( = ?auto_336918 ?auto_336919 ) ) ( not ( = ?auto_336918 ?auto_336920 ) ) ( not ( = ?auto_336918 ?auto_336921 ) ) ( not ( = ?auto_336918 ?auto_336922 ) ) ( not ( = ?auto_336918 ?auto_336923 ) ) ( not ( = ?auto_336918 ?auto_336924 ) ) ( not ( = ?auto_336918 ?auto_336925 ) ) ( not ( = ?auto_336918 ?auto_336926 ) ) ( not ( = ?auto_336918 ?auto_336927 ) ) ( not ( = ?auto_336919 ?auto_336920 ) ) ( not ( = ?auto_336919 ?auto_336921 ) ) ( not ( = ?auto_336919 ?auto_336922 ) ) ( not ( = ?auto_336919 ?auto_336923 ) ) ( not ( = ?auto_336919 ?auto_336924 ) ) ( not ( = ?auto_336919 ?auto_336925 ) ) ( not ( = ?auto_336919 ?auto_336926 ) ) ( not ( = ?auto_336919 ?auto_336927 ) ) ( not ( = ?auto_336920 ?auto_336921 ) ) ( not ( = ?auto_336920 ?auto_336922 ) ) ( not ( = ?auto_336920 ?auto_336923 ) ) ( not ( = ?auto_336920 ?auto_336924 ) ) ( not ( = ?auto_336920 ?auto_336925 ) ) ( not ( = ?auto_336920 ?auto_336926 ) ) ( not ( = ?auto_336920 ?auto_336927 ) ) ( not ( = ?auto_336921 ?auto_336922 ) ) ( not ( = ?auto_336921 ?auto_336923 ) ) ( not ( = ?auto_336921 ?auto_336924 ) ) ( not ( = ?auto_336921 ?auto_336925 ) ) ( not ( = ?auto_336921 ?auto_336926 ) ) ( not ( = ?auto_336921 ?auto_336927 ) ) ( not ( = ?auto_336922 ?auto_336923 ) ) ( not ( = ?auto_336922 ?auto_336924 ) ) ( not ( = ?auto_336922 ?auto_336925 ) ) ( not ( = ?auto_336922 ?auto_336926 ) ) ( not ( = ?auto_336922 ?auto_336927 ) ) ( not ( = ?auto_336923 ?auto_336924 ) ) ( not ( = ?auto_336923 ?auto_336925 ) ) ( not ( = ?auto_336923 ?auto_336926 ) ) ( not ( = ?auto_336923 ?auto_336927 ) ) ( not ( = ?auto_336924 ?auto_336925 ) ) ( not ( = ?auto_336924 ?auto_336926 ) ) ( not ( = ?auto_336924 ?auto_336927 ) ) ( not ( = ?auto_336925 ?auto_336926 ) ) ( not ( = ?auto_336925 ?auto_336927 ) ) ( not ( = ?auto_336926 ?auto_336927 ) ) ( ON ?auto_336925 ?auto_336926 ) ( ON ?auto_336924 ?auto_336925 ) ( ON ?auto_336923 ?auto_336924 ) ( ON ?auto_336922 ?auto_336923 ) ( ON ?auto_336921 ?auto_336922 ) ( ON ?auto_336920 ?auto_336921 ) ( CLEAR ?auto_336918 ) ( ON ?auto_336919 ?auto_336920 ) ( CLEAR ?auto_336919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_336916 ?auto_336917 ?auto_336918 ?auto_336919 )
      ( MAKE-11PILE ?auto_336916 ?auto_336917 ?auto_336918 ?auto_336919 ?auto_336920 ?auto_336921 ?auto_336922 ?auto_336923 ?auto_336924 ?auto_336925 ?auto_336926 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336939 - BLOCK
      ?auto_336940 - BLOCK
      ?auto_336941 - BLOCK
      ?auto_336942 - BLOCK
      ?auto_336943 - BLOCK
      ?auto_336944 - BLOCK
      ?auto_336945 - BLOCK
      ?auto_336946 - BLOCK
      ?auto_336947 - BLOCK
      ?auto_336948 - BLOCK
      ?auto_336949 - BLOCK
    )
    :vars
    (
      ?auto_336950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336949 ?auto_336950 ) ( ON-TABLE ?auto_336939 ) ( ON ?auto_336940 ?auto_336939 ) ( not ( = ?auto_336939 ?auto_336940 ) ) ( not ( = ?auto_336939 ?auto_336941 ) ) ( not ( = ?auto_336939 ?auto_336942 ) ) ( not ( = ?auto_336939 ?auto_336943 ) ) ( not ( = ?auto_336939 ?auto_336944 ) ) ( not ( = ?auto_336939 ?auto_336945 ) ) ( not ( = ?auto_336939 ?auto_336946 ) ) ( not ( = ?auto_336939 ?auto_336947 ) ) ( not ( = ?auto_336939 ?auto_336948 ) ) ( not ( = ?auto_336939 ?auto_336949 ) ) ( not ( = ?auto_336939 ?auto_336950 ) ) ( not ( = ?auto_336940 ?auto_336941 ) ) ( not ( = ?auto_336940 ?auto_336942 ) ) ( not ( = ?auto_336940 ?auto_336943 ) ) ( not ( = ?auto_336940 ?auto_336944 ) ) ( not ( = ?auto_336940 ?auto_336945 ) ) ( not ( = ?auto_336940 ?auto_336946 ) ) ( not ( = ?auto_336940 ?auto_336947 ) ) ( not ( = ?auto_336940 ?auto_336948 ) ) ( not ( = ?auto_336940 ?auto_336949 ) ) ( not ( = ?auto_336940 ?auto_336950 ) ) ( not ( = ?auto_336941 ?auto_336942 ) ) ( not ( = ?auto_336941 ?auto_336943 ) ) ( not ( = ?auto_336941 ?auto_336944 ) ) ( not ( = ?auto_336941 ?auto_336945 ) ) ( not ( = ?auto_336941 ?auto_336946 ) ) ( not ( = ?auto_336941 ?auto_336947 ) ) ( not ( = ?auto_336941 ?auto_336948 ) ) ( not ( = ?auto_336941 ?auto_336949 ) ) ( not ( = ?auto_336941 ?auto_336950 ) ) ( not ( = ?auto_336942 ?auto_336943 ) ) ( not ( = ?auto_336942 ?auto_336944 ) ) ( not ( = ?auto_336942 ?auto_336945 ) ) ( not ( = ?auto_336942 ?auto_336946 ) ) ( not ( = ?auto_336942 ?auto_336947 ) ) ( not ( = ?auto_336942 ?auto_336948 ) ) ( not ( = ?auto_336942 ?auto_336949 ) ) ( not ( = ?auto_336942 ?auto_336950 ) ) ( not ( = ?auto_336943 ?auto_336944 ) ) ( not ( = ?auto_336943 ?auto_336945 ) ) ( not ( = ?auto_336943 ?auto_336946 ) ) ( not ( = ?auto_336943 ?auto_336947 ) ) ( not ( = ?auto_336943 ?auto_336948 ) ) ( not ( = ?auto_336943 ?auto_336949 ) ) ( not ( = ?auto_336943 ?auto_336950 ) ) ( not ( = ?auto_336944 ?auto_336945 ) ) ( not ( = ?auto_336944 ?auto_336946 ) ) ( not ( = ?auto_336944 ?auto_336947 ) ) ( not ( = ?auto_336944 ?auto_336948 ) ) ( not ( = ?auto_336944 ?auto_336949 ) ) ( not ( = ?auto_336944 ?auto_336950 ) ) ( not ( = ?auto_336945 ?auto_336946 ) ) ( not ( = ?auto_336945 ?auto_336947 ) ) ( not ( = ?auto_336945 ?auto_336948 ) ) ( not ( = ?auto_336945 ?auto_336949 ) ) ( not ( = ?auto_336945 ?auto_336950 ) ) ( not ( = ?auto_336946 ?auto_336947 ) ) ( not ( = ?auto_336946 ?auto_336948 ) ) ( not ( = ?auto_336946 ?auto_336949 ) ) ( not ( = ?auto_336946 ?auto_336950 ) ) ( not ( = ?auto_336947 ?auto_336948 ) ) ( not ( = ?auto_336947 ?auto_336949 ) ) ( not ( = ?auto_336947 ?auto_336950 ) ) ( not ( = ?auto_336948 ?auto_336949 ) ) ( not ( = ?auto_336948 ?auto_336950 ) ) ( not ( = ?auto_336949 ?auto_336950 ) ) ( ON ?auto_336948 ?auto_336949 ) ( ON ?auto_336947 ?auto_336948 ) ( ON ?auto_336946 ?auto_336947 ) ( ON ?auto_336945 ?auto_336946 ) ( ON ?auto_336944 ?auto_336945 ) ( ON ?auto_336943 ?auto_336944 ) ( ON ?auto_336942 ?auto_336943 ) ( CLEAR ?auto_336940 ) ( ON ?auto_336941 ?auto_336942 ) ( CLEAR ?auto_336941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_336939 ?auto_336940 ?auto_336941 )
      ( MAKE-11PILE ?auto_336939 ?auto_336940 ?auto_336941 ?auto_336942 ?auto_336943 ?auto_336944 ?auto_336945 ?auto_336946 ?auto_336947 ?auto_336948 ?auto_336949 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336962 - BLOCK
      ?auto_336963 - BLOCK
      ?auto_336964 - BLOCK
      ?auto_336965 - BLOCK
      ?auto_336966 - BLOCK
      ?auto_336967 - BLOCK
      ?auto_336968 - BLOCK
      ?auto_336969 - BLOCK
      ?auto_336970 - BLOCK
      ?auto_336971 - BLOCK
      ?auto_336972 - BLOCK
    )
    :vars
    (
      ?auto_336973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336972 ?auto_336973 ) ( ON-TABLE ?auto_336962 ) ( ON ?auto_336963 ?auto_336962 ) ( not ( = ?auto_336962 ?auto_336963 ) ) ( not ( = ?auto_336962 ?auto_336964 ) ) ( not ( = ?auto_336962 ?auto_336965 ) ) ( not ( = ?auto_336962 ?auto_336966 ) ) ( not ( = ?auto_336962 ?auto_336967 ) ) ( not ( = ?auto_336962 ?auto_336968 ) ) ( not ( = ?auto_336962 ?auto_336969 ) ) ( not ( = ?auto_336962 ?auto_336970 ) ) ( not ( = ?auto_336962 ?auto_336971 ) ) ( not ( = ?auto_336962 ?auto_336972 ) ) ( not ( = ?auto_336962 ?auto_336973 ) ) ( not ( = ?auto_336963 ?auto_336964 ) ) ( not ( = ?auto_336963 ?auto_336965 ) ) ( not ( = ?auto_336963 ?auto_336966 ) ) ( not ( = ?auto_336963 ?auto_336967 ) ) ( not ( = ?auto_336963 ?auto_336968 ) ) ( not ( = ?auto_336963 ?auto_336969 ) ) ( not ( = ?auto_336963 ?auto_336970 ) ) ( not ( = ?auto_336963 ?auto_336971 ) ) ( not ( = ?auto_336963 ?auto_336972 ) ) ( not ( = ?auto_336963 ?auto_336973 ) ) ( not ( = ?auto_336964 ?auto_336965 ) ) ( not ( = ?auto_336964 ?auto_336966 ) ) ( not ( = ?auto_336964 ?auto_336967 ) ) ( not ( = ?auto_336964 ?auto_336968 ) ) ( not ( = ?auto_336964 ?auto_336969 ) ) ( not ( = ?auto_336964 ?auto_336970 ) ) ( not ( = ?auto_336964 ?auto_336971 ) ) ( not ( = ?auto_336964 ?auto_336972 ) ) ( not ( = ?auto_336964 ?auto_336973 ) ) ( not ( = ?auto_336965 ?auto_336966 ) ) ( not ( = ?auto_336965 ?auto_336967 ) ) ( not ( = ?auto_336965 ?auto_336968 ) ) ( not ( = ?auto_336965 ?auto_336969 ) ) ( not ( = ?auto_336965 ?auto_336970 ) ) ( not ( = ?auto_336965 ?auto_336971 ) ) ( not ( = ?auto_336965 ?auto_336972 ) ) ( not ( = ?auto_336965 ?auto_336973 ) ) ( not ( = ?auto_336966 ?auto_336967 ) ) ( not ( = ?auto_336966 ?auto_336968 ) ) ( not ( = ?auto_336966 ?auto_336969 ) ) ( not ( = ?auto_336966 ?auto_336970 ) ) ( not ( = ?auto_336966 ?auto_336971 ) ) ( not ( = ?auto_336966 ?auto_336972 ) ) ( not ( = ?auto_336966 ?auto_336973 ) ) ( not ( = ?auto_336967 ?auto_336968 ) ) ( not ( = ?auto_336967 ?auto_336969 ) ) ( not ( = ?auto_336967 ?auto_336970 ) ) ( not ( = ?auto_336967 ?auto_336971 ) ) ( not ( = ?auto_336967 ?auto_336972 ) ) ( not ( = ?auto_336967 ?auto_336973 ) ) ( not ( = ?auto_336968 ?auto_336969 ) ) ( not ( = ?auto_336968 ?auto_336970 ) ) ( not ( = ?auto_336968 ?auto_336971 ) ) ( not ( = ?auto_336968 ?auto_336972 ) ) ( not ( = ?auto_336968 ?auto_336973 ) ) ( not ( = ?auto_336969 ?auto_336970 ) ) ( not ( = ?auto_336969 ?auto_336971 ) ) ( not ( = ?auto_336969 ?auto_336972 ) ) ( not ( = ?auto_336969 ?auto_336973 ) ) ( not ( = ?auto_336970 ?auto_336971 ) ) ( not ( = ?auto_336970 ?auto_336972 ) ) ( not ( = ?auto_336970 ?auto_336973 ) ) ( not ( = ?auto_336971 ?auto_336972 ) ) ( not ( = ?auto_336971 ?auto_336973 ) ) ( not ( = ?auto_336972 ?auto_336973 ) ) ( ON ?auto_336971 ?auto_336972 ) ( ON ?auto_336970 ?auto_336971 ) ( ON ?auto_336969 ?auto_336970 ) ( ON ?auto_336968 ?auto_336969 ) ( ON ?auto_336967 ?auto_336968 ) ( ON ?auto_336966 ?auto_336967 ) ( ON ?auto_336965 ?auto_336966 ) ( CLEAR ?auto_336963 ) ( ON ?auto_336964 ?auto_336965 ) ( CLEAR ?auto_336964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_336962 ?auto_336963 ?auto_336964 )
      ( MAKE-11PILE ?auto_336962 ?auto_336963 ?auto_336964 ?auto_336965 ?auto_336966 ?auto_336967 ?auto_336968 ?auto_336969 ?auto_336970 ?auto_336971 ?auto_336972 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_336985 - BLOCK
      ?auto_336986 - BLOCK
      ?auto_336987 - BLOCK
      ?auto_336988 - BLOCK
      ?auto_336989 - BLOCK
      ?auto_336990 - BLOCK
      ?auto_336991 - BLOCK
      ?auto_336992 - BLOCK
      ?auto_336993 - BLOCK
      ?auto_336994 - BLOCK
      ?auto_336995 - BLOCK
    )
    :vars
    (
      ?auto_336996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_336995 ?auto_336996 ) ( ON-TABLE ?auto_336985 ) ( not ( = ?auto_336985 ?auto_336986 ) ) ( not ( = ?auto_336985 ?auto_336987 ) ) ( not ( = ?auto_336985 ?auto_336988 ) ) ( not ( = ?auto_336985 ?auto_336989 ) ) ( not ( = ?auto_336985 ?auto_336990 ) ) ( not ( = ?auto_336985 ?auto_336991 ) ) ( not ( = ?auto_336985 ?auto_336992 ) ) ( not ( = ?auto_336985 ?auto_336993 ) ) ( not ( = ?auto_336985 ?auto_336994 ) ) ( not ( = ?auto_336985 ?auto_336995 ) ) ( not ( = ?auto_336985 ?auto_336996 ) ) ( not ( = ?auto_336986 ?auto_336987 ) ) ( not ( = ?auto_336986 ?auto_336988 ) ) ( not ( = ?auto_336986 ?auto_336989 ) ) ( not ( = ?auto_336986 ?auto_336990 ) ) ( not ( = ?auto_336986 ?auto_336991 ) ) ( not ( = ?auto_336986 ?auto_336992 ) ) ( not ( = ?auto_336986 ?auto_336993 ) ) ( not ( = ?auto_336986 ?auto_336994 ) ) ( not ( = ?auto_336986 ?auto_336995 ) ) ( not ( = ?auto_336986 ?auto_336996 ) ) ( not ( = ?auto_336987 ?auto_336988 ) ) ( not ( = ?auto_336987 ?auto_336989 ) ) ( not ( = ?auto_336987 ?auto_336990 ) ) ( not ( = ?auto_336987 ?auto_336991 ) ) ( not ( = ?auto_336987 ?auto_336992 ) ) ( not ( = ?auto_336987 ?auto_336993 ) ) ( not ( = ?auto_336987 ?auto_336994 ) ) ( not ( = ?auto_336987 ?auto_336995 ) ) ( not ( = ?auto_336987 ?auto_336996 ) ) ( not ( = ?auto_336988 ?auto_336989 ) ) ( not ( = ?auto_336988 ?auto_336990 ) ) ( not ( = ?auto_336988 ?auto_336991 ) ) ( not ( = ?auto_336988 ?auto_336992 ) ) ( not ( = ?auto_336988 ?auto_336993 ) ) ( not ( = ?auto_336988 ?auto_336994 ) ) ( not ( = ?auto_336988 ?auto_336995 ) ) ( not ( = ?auto_336988 ?auto_336996 ) ) ( not ( = ?auto_336989 ?auto_336990 ) ) ( not ( = ?auto_336989 ?auto_336991 ) ) ( not ( = ?auto_336989 ?auto_336992 ) ) ( not ( = ?auto_336989 ?auto_336993 ) ) ( not ( = ?auto_336989 ?auto_336994 ) ) ( not ( = ?auto_336989 ?auto_336995 ) ) ( not ( = ?auto_336989 ?auto_336996 ) ) ( not ( = ?auto_336990 ?auto_336991 ) ) ( not ( = ?auto_336990 ?auto_336992 ) ) ( not ( = ?auto_336990 ?auto_336993 ) ) ( not ( = ?auto_336990 ?auto_336994 ) ) ( not ( = ?auto_336990 ?auto_336995 ) ) ( not ( = ?auto_336990 ?auto_336996 ) ) ( not ( = ?auto_336991 ?auto_336992 ) ) ( not ( = ?auto_336991 ?auto_336993 ) ) ( not ( = ?auto_336991 ?auto_336994 ) ) ( not ( = ?auto_336991 ?auto_336995 ) ) ( not ( = ?auto_336991 ?auto_336996 ) ) ( not ( = ?auto_336992 ?auto_336993 ) ) ( not ( = ?auto_336992 ?auto_336994 ) ) ( not ( = ?auto_336992 ?auto_336995 ) ) ( not ( = ?auto_336992 ?auto_336996 ) ) ( not ( = ?auto_336993 ?auto_336994 ) ) ( not ( = ?auto_336993 ?auto_336995 ) ) ( not ( = ?auto_336993 ?auto_336996 ) ) ( not ( = ?auto_336994 ?auto_336995 ) ) ( not ( = ?auto_336994 ?auto_336996 ) ) ( not ( = ?auto_336995 ?auto_336996 ) ) ( ON ?auto_336994 ?auto_336995 ) ( ON ?auto_336993 ?auto_336994 ) ( ON ?auto_336992 ?auto_336993 ) ( ON ?auto_336991 ?auto_336992 ) ( ON ?auto_336990 ?auto_336991 ) ( ON ?auto_336989 ?auto_336990 ) ( ON ?auto_336988 ?auto_336989 ) ( ON ?auto_336987 ?auto_336988 ) ( CLEAR ?auto_336985 ) ( ON ?auto_336986 ?auto_336987 ) ( CLEAR ?auto_336986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_336985 ?auto_336986 )
      ( MAKE-11PILE ?auto_336985 ?auto_336986 ?auto_336987 ?auto_336988 ?auto_336989 ?auto_336990 ?auto_336991 ?auto_336992 ?auto_336993 ?auto_336994 ?auto_336995 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_337008 - BLOCK
      ?auto_337009 - BLOCK
      ?auto_337010 - BLOCK
      ?auto_337011 - BLOCK
      ?auto_337012 - BLOCK
      ?auto_337013 - BLOCK
      ?auto_337014 - BLOCK
      ?auto_337015 - BLOCK
      ?auto_337016 - BLOCK
      ?auto_337017 - BLOCK
      ?auto_337018 - BLOCK
    )
    :vars
    (
      ?auto_337019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337018 ?auto_337019 ) ( ON-TABLE ?auto_337008 ) ( not ( = ?auto_337008 ?auto_337009 ) ) ( not ( = ?auto_337008 ?auto_337010 ) ) ( not ( = ?auto_337008 ?auto_337011 ) ) ( not ( = ?auto_337008 ?auto_337012 ) ) ( not ( = ?auto_337008 ?auto_337013 ) ) ( not ( = ?auto_337008 ?auto_337014 ) ) ( not ( = ?auto_337008 ?auto_337015 ) ) ( not ( = ?auto_337008 ?auto_337016 ) ) ( not ( = ?auto_337008 ?auto_337017 ) ) ( not ( = ?auto_337008 ?auto_337018 ) ) ( not ( = ?auto_337008 ?auto_337019 ) ) ( not ( = ?auto_337009 ?auto_337010 ) ) ( not ( = ?auto_337009 ?auto_337011 ) ) ( not ( = ?auto_337009 ?auto_337012 ) ) ( not ( = ?auto_337009 ?auto_337013 ) ) ( not ( = ?auto_337009 ?auto_337014 ) ) ( not ( = ?auto_337009 ?auto_337015 ) ) ( not ( = ?auto_337009 ?auto_337016 ) ) ( not ( = ?auto_337009 ?auto_337017 ) ) ( not ( = ?auto_337009 ?auto_337018 ) ) ( not ( = ?auto_337009 ?auto_337019 ) ) ( not ( = ?auto_337010 ?auto_337011 ) ) ( not ( = ?auto_337010 ?auto_337012 ) ) ( not ( = ?auto_337010 ?auto_337013 ) ) ( not ( = ?auto_337010 ?auto_337014 ) ) ( not ( = ?auto_337010 ?auto_337015 ) ) ( not ( = ?auto_337010 ?auto_337016 ) ) ( not ( = ?auto_337010 ?auto_337017 ) ) ( not ( = ?auto_337010 ?auto_337018 ) ) ( not ( = ?auto_337010 ?auto_337019 ) ) ( not ( = ?auto_337011 ?auto_337012 ) ) ( not ( = ?auto_337011 ?auto_337013 ) ) ( not ( = ?auto_337011 ?auto_337014 ) ) ( not ( = ?auto_337011 ?auto_337015 ) ) ( not ( = ?auto_337011 ?auto_337016 ) ) ( not ( = ?auto_337011 ?auto_337017 ) ) ( not ( = ?auto_337011 ?auto_337018 ) ) ( not ( = ?auto_337011 ?auto_337019 ) ) ( not ( = ?auto_337012 ?auto_337013 ) ) ( not ( = ?auto_337012 ?auto_337014 ) ) ( not ( = ?auto_337012 ?auto_337015 ) ) ( not ( = ?auto_337012 ?auto_337016 ) ) ( not ( = ?auto_337012 ?auto_337017 ) ) ( not ( = ?auto_337012 ?auto_337018 ) ) ( not ( = ?auto_337012 ?auto_337019 ) ) ( not ( = ?auto_337013 ?auto_337014 ) ) ( not ( = ?auto_337013 ?auto_337015 ) ) ( not ( = ?auto_337013 ?auto_337016 ) ) ( not ( = ?auto_337013 ?auto_337017 ) ) ( not ( = ?auto_337013 ?auto_337018 ) ) ( not ( = ?auto_337013 ?auto_337019 ) ) ( not ( = ?auto_337014 ?auto_337015 ) ) ( not ( = ?auto_337014 ?auto_337016 ) ) ( not ( = ?auto_337014 ?auto_337017 ) ) ( not ( = ?auto_337014 ?auto_337018 ) ) ( not ( = ?auto_337014 ?auto_337019 ) ) ( not ( = ?auto_337015 ?auto_337016 ) ) ( not ( = ?auto_337015 ?auto_337017 ) ) ( not ( = ?auto_337015 ?auto_337018 ) ) ( not ( = ?auto_337015 ?auto_337019 ) ) ( not ( = ?auto_337016 ?auto_337017 ) ) ( not ( = ?auto_337016 ?auto_337018 ) ) ( not ( = ?auto_337016 ?auto_337019 ) ) ( not ( = ?auto_337017 ?auto_337018 ) ) ( not ( = ?auto_337017 ?auto_337019 ) ) ( not ( = ?auto_337018 ?auto_337019 ) ) ( ON ?auto_337017 ?auto_337018 ) ( ON ?auto_337016 ?auto_337017 ) ( ON ?auto_337015 ?auto_337016 ) ( ON ?auto_337014 ?auto_337015 ) ( ON ?auto_337013 ?auto_337014 ) ( ON ?auto_337012 ?auto_337013 ) ( ON ?auto_337011 ?auto_337012 ) ( ON ?auto_337010 ?auto_337011 ) ( CLEAR ?auto_337008 ) ( ON ?auto_337009 ?auto_337010 ) ( CLEAR ?auto_337009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_337008 ?auto_337009 )
      ( MAKE-11PILE ?auto_337008 ?auto_337009 ?auto_337010 ?auto_337011 ?auto_337012 ?auto_337013 ?auto_337014 ?auto_337015 ?auto_337016 ?auto_337017 ?auto_337018 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_337031 - BLOCK
      ?auto_337032 - BLOCK
      ?auto_337033 - BLOCK
      ?auto_337034 - BLOCK
      ?auto_337035 - BLOCK
      ?auto_337036 - BLOCK
      ?auto_337037 - BLOCK
      ?auto_337038 - BLOCK
      ?auto_337039 - BLOCK
      ?auto_337040 - BLOCK
      ?auto_337041 - BLOCK
    )
    :vars
    (
      ?auto_337042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337041 ?auto_337042 ) ( not ( = ?auto_337031 ?auto_337032 ) ) ( not ( = ?auto_337031 ?auto_337033 ) ) ( not ( = ?auto_337031 ?auto_337034 ) ) ( not ( = ?auto_337031 ?auto_337035 ) ) ( not ( = ?auto_337031 ?auto_337036 ) ) ( not ( = ?auto_337031 ?auto_337037 ) ) ( not ( = ?auto_337031 ?auto_337038 ) ) ( not ( = ?auto_337031 ?auto_337039 ) ) ( not ( = ?auto_337031 ?auto_337040 ) ) ( not ( = ?auto_337031 ?auto_337041 ) ) ( not ( = ?auto_337031 ?auto_337042 ) ) ( not ( = ?auto_337032 ?auto_337033 ) ) ( not ( = ?auto_337032 ?auto_337034 ) ) ( not ( = ?auto_337032 ?auto_337035 ) ) ( not ( = ?auto_337032 ?auto_337036 ) ) ( not ( = ?auto_337032 ?auto_337037 ) ) ( not ( = ?auto_337032 ?auto_337038 ) ) ( not ( = ?auto_337032 ?auto_337039 ) ) ( not ( = ?auto_337032 ?auto_337040 ) ) ( not ( = ?auto_337032 ?auto_337041 ) ) ( not ( = ?auto_337032 ?auto_337042 ) ) ( not ( = ?auto_337033 ?auto_337034 ) ) ( not ( = ?auto_337033 ?auto_337035 ) ) ( not ( = ?auto_337033 ?auto_337036 ) ) ( not ( = ?auto_337033 ?auto_337037 ) ) ( not ( = ?auto_337033 ?auto_337038 ) ) ( not ( = ?auto_337033 ?auto_337039 ) ) ( not ( = ?auto_337033 ?auto_337040 ) ) ( not ( = ?auto_337033 ?auto_337041 ) ) ( not ( = ?auto_337033 ?auto_337042 ) ) ( not ( = ?auto_337034 ?auto_337035 ) ) ( not ( = ?auto_337034 ?auto_337036 ) ) ( not ( = ?auto_337034 ?auto_337037 ) ) ( not ( = ?auto_337034 ?auto_337038 ) ) ( not ( = ?auto_337034 ?auto_337039 ) ) ( not ( = ?auto_337034 ?auto_337040 ) ) ( not ( = ?auto_337034 ?auto_337041 ) ) ( not ( = ?auto_337034 ?auto_337042 ) ) ( not ( = ?auto_337035 ?auto_337036 ) ) ( not ( = ?auto_337035 ?auto_337037 ) ) ( not ( = ?auto_337035 ?auto_337038 ) ) ( not ( = ?auto_337035 ?auto_337039 ) ) ( not ( = ?auto_337035 ?auto_337040 ) ) ( not ( = ?auto_337035 ?auto_337041 ) ) ( not ( = ?auto_337035 ?auto_337042 ) ) ( not ( = ?auto_337036 ?auto_337037 ) ) ( not ( = ?auto_337036 ?auto_337038 ) ) ( not ( = ?auto_337036 ?auto_337039 ) ) ( not ( = ?auto_337036 ?auto_337040 ) ) ( not ( = ?auto_337036 ?auto_337041 ) ) ( not ( = ?auto_337036 ?auto_337042 ) ) ( not ( = ?auto_337037 ?auto_337038 ) ) ( not ( = ?auto_337037 ?auto_337039 ) ) ( not ( = ?auto_337037 ?auto_337040 ) ) ( not ( = ?auto_337037 ?auto_337041 ) ) ( not ( = ?auto_337037 ?auto_337042 ) ) ( not ( = ?auto_337038 ?auto_337039 ) ) ( not ( = ?auto_337038 ?auto_337040 ) ) ( not ( = ?auto_337038 ?auto_337041 ) ) ( not ( = ?auto_337038 ?auto_337042 ) ) ( not ( = ?auto_337039 ?auto_337040 ) ) ( not ( = ?auto_337039 ?auto_337041 ) ) ( not ( = ?auto_337039 ?auto_337042 ) ) ( not ( = ?auto_337040 ?auto_337041 ) ) ( not ( = ?auto_337040 ?auto_337042 ) ) ( not ( = ?auto_337041 ?auto_337042 ) ) ( ON ?auto_337040 ?auto_337041 ) ( ON ?auto_337039 ?auto_337040 ) ( ON ?auto_337038 ?auto_337039 ) ( ON ?auto_337037 ?auto_337038 ) ( ON ?auto_337036 ?auto_337037 ) ( ON ?auto_337035 ?auto_337036 ) ( ON ?auto_337034 ?auto_337035 ) ( ON ?auto_337033 ?auto_337034 ) ( ON ?auto_337032 ?auto_337033 ) ( ON ?auto_337031 ?auto_337032 ) ( CLEAR ?auto_337031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_337031 )
      ( MAKE-11PILE ?auto_337031 ?auto_337032 ?auto_337033 ?auto_337034 ?auto_337035 ?auto_337036 ?auto_337037 ?auto_337038 ?auto_337039 ?auto_337040 ?auto_337041 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_337054 - BLOCK
      ?auto_337055 - BLOCK
      ?auto_337056 - BLOCK
      ?auto_337057 - BLOCK
      ?auto_337058 - BLOCK
      ?auto_337059 - BLOCK
      ?auto_337060 - BLOCK
      ?auto_337061 - BLOCK
      ?auto_337062 - BLOCK
      ?auto_337063 - BLOCK
      ?auto_337064 - BLOCK
    )
    :vars
    (
      ?auto_337065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337064 ?auto_337065 ) ( not ( = ?auto_337054 ?auto_337055 ) ) ( not ( = ?auto_337054 ?auto_337056 ) ) ( not ( = ?auto_337054 ?auto_337057 ) ) ( not ( = ?auto_337054 ?auto_337058 ) ) ( not ( = ?auto_337054 ?auto_337059 ) ) ( not ( = ?auto_337054 ?auto_337060 ) ) ( not ( = ?auto_337054 ?auto_337061 ) ) ( not ( = ?auto_337054 ?auto_337062 ) ) ( not ( = ?auto_337054 ?auto_337063 ) ) ( not ( = ?auto_337054 ?auto_337064 ) ) ( not ( = ?auto_337054 ?auto_337065 ) ) ( not ( = ?auto_337055 ?auto_337056 ) ) ( not ( = ?auto_337055 ?auto_337057 ) ) ( not ( = ?auto_337055 ?auto_337058 ) ) ( not ( = ?auto_337055 ?auto_337059 ) ) ( not ( = ?auto_337055 ?auto_337060 ) ) ( not ( = ?auto_337055 ?auto_337061 ) ) ( not ( = ?auto_337055 ?auto_337062 ) ) ( not ( = ?auto_337055 ?auto_337063 ) ) ( not ( = ?auto_337055 ?auto_337064 ) ) ( not ( = ?auto_337055 ?auto_337065 ) ) ( not ( = ?auto_337056 ?auto_337057 ) ) ( not ( = ?auto_337056 ?auto_337058 ) ) ( not ( = ?auto_337056 ?auto_337059 ) ) ( not ( = ?auto_337056 ?auto_337060 ) ) ( not ( = ?auto_337056 ?auto_337061 ) ) ( not ( = ?auto_337056 ?auto_337062 ) ) ( not ( = ?auto_337056 ?auto_337063 ) ) ( not ( = ?auto_337056 ?auto_337064 ) ) ( not ( = ?auto_337056 ?auto_337065 ) ) ( not ( = ?auto_337057 ?auto_337058 ) ) ( not ( = ?auto_337057 ?auto_337059 ) ) ( not ( = ?auto_337057 ?auto_337060 ) ) ( not ( = ?auto_337057 ?auto_337061 ) ) ( not ( = ?auto_337057 ?auto_337062 ) ) ( not ( = ?auto_337057 ?auto_337063 ) ) ( not ( = ?auto_337057 ?auto_337064 ) ) ( not ( = ?auto_337057 ?auto_337065 ) ) ( not ( = ?auto_337058 ?auto_337059 ) ) ( not ( = ?auto_337058 ?auto_337060 ) ) ( not ( = ?auto_337058 ?auto_337061 ) ) ( not ( = ?auto_337058 ?auto_337062 ) ) ( not ( = ?auto_337058 ?auto_337063 ) ) ( not ( = ?auto_337058 ?auto_337064 ) ) ( not ( = ?auto_337058 ?auto_337065 ) ) ( not ( = ?auto_337059 ?auto_337060 ) ) ( not ( = ?auto_337059 ?auto_337061 ) ) ( not ( = ?auto_337059 ?auto_337062 ) ) ( not ( = ?auto_337059 ?auto_337063 ) ) ( not ( = ?auto_337059 ?auto_337064 ) ) ( not ( = ?auto_337059 ?auto_337065 ) ) ( not ( = ?auto_337060 ?auto_337061 ) ) ( not ( = ?auto_337060 ?auto_337062 ) ) ( not ( = ?auto_337060 ?auto_337063 ) ) ( not ( = ?auto_337060 ?auto_337064 ) ) ( not ( = ?auto_337060 ?auto_337065 ) ) ( not ( = ?auto_337061 ?auto_337062 ) ) ( not ( = ?auto_337061 ?auto_337063 ) ) ( not ( = ?auto_337061 ?auto_337064 ) ) ( not ( = ?auto_337061 ?auto_337065 ) ) ( not ( = ?auto_337062 ?auto_337063 ) ) ( not ( = ?auto_337062 ?auto_337064 ) ) ( not ( = ?auto_337062 ?auto_337065 ) ) ( not ( = ?auto_337063 ?auto_337064 ) ) ( not ( = ?auto_337063 ?auto_337065 ) ) ( not ( = ?auto_337064 ?auto_337065 ) ) ( ON ?auto_337063 ?auto_337064 ) ( ON ?auto_337062 ?auto_337063 ) ( ON ?auto_337061 ?auto_337062 ) ( ON ?auto_337060 ?auto_337061 ) ( ON ?auto_337059 ?auto_337060 ) ( ON ?auto_337058 ?auto_337059 ) ( ON ?auto_337057 ?auto_337058 ) ( ON ?auto_337056 ?auto_337057 ) ( ON ?auto_337055 ?auto_337056 ) ( ON ?auto_337054 ?auto_337055 ) ( CLEAR ?auto_337054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_337054 )
      ( MAKE-11PILE ?auto_337054 ?auto_337055 ?auto_337056 ?auto_337057 ?auto_337058 ?auto_337059 ?auto_337060 ?auto_337061 ?auto_337062 ?auto_337063 ?auto_337064 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337078 - BLOCK
      ?auto_337079 - BLOCK
      ?auto_337080 - BLOCK
      ?auto_337081 - BLOCK
      ?auto_337082 - BLOCK
      ?auto_337083 - BLOCK
      ?auto_337084 - BLOCK
      ?auto_337085 - BLOCK
      ?auto_337086 - BLOCK
      ?auto_337087 - BLOCK
      ?auto_337088 - BLOCK
      ?auto_337089 - BLOCK
    )
    :vars
    (
      ?auto_337090 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_337088 ) ( ON ?auto_337089 ?auto_337090 ) ( CLEAR ?auto_337089 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_337078 ) ( ON ?auto_337079 ?auto_337078 ) ( ON ?auto_337080 ?auto_337079 ) ( ON ?auto_337081 ?auto_337080 ) ( ON ?auto_337082 ?auto_337081 ) ( ON ?auto_337083 ?auto_337082 ) ( ON ?auto_337084 ?auto_337083 ) ( ON ?auto_337085 ?auto_337084 ) ( ON ?auto_337086 ?auto_337085 ) ( ON ?auto_337087 ?auto_337086 ) ( ON ?auto_337088 ?auto_337087 ) ( not ( = ?auto_337078 ?auto_337079 ) ) ( not ( = ?auto_337078 ?auto_337080 ) ) ( not ( = ?auto_337078 ?auto_337081 ) ) ( not ( = ?auto_337078 ?auto_337082 ) ) ( not ( = ?auto_337078 ?auto_337083 ) ) ( not ( = ?auto_337078 ?auto_337084 ) ) ( not ( = ?auto_337078 ?auto_337085 ) ) ( not ( = ?auto_337078 ?auto_337086 ) ) ( not ( = ?auto_337078 ?auto_337087 ) ) ( not ( = ?auto_337078 ?auto_337088 ) ) ( not ( = ?auto_337078 ?auto_337089 ) ) ( not ( = ?auto_337078 ?auto_337090 ) ) ( not ( = ?auto_337079 ?auto_337080 ) ) ( not ( = ?auto_337079 ?auto_337081 ) ) ( not ( = ?auto_337079 ?auto_337082 ) ) ( not ( = ?auto_337079 ?auto_337083 ) ) ( not ( = ?auto_337079 ?auto_337084 ) ) ( not ( = ?auto_337079 ?auto_337085 ) ) ( not ( = ?auto_337079 ?auto_337086 ) ) ( not ( = ?auto_337079 ?auto_337087 ) ) ( not ( = ?auto_337079 ?auto_337088 ) ) ( not ( = ?auto_337079 ?auto_337089 ) ) ( not ( = ?auto_337079 ?auto_337090 ) ) ( not ( = ?auto_337080 ?auto_337081 ) ) ( not ( = ?auto_337080 ?auto_337082 ) ) ( not ( = ?auto_337080 ?auto_337083 ) ) ( not ( = ?auto_337080 ?auto_337084 ) ) ( not ( = ?auto_337080 ?auto_337085 ) ) ( not ( = ?auto_337080 ?auto_337086 ) ) ( not ( = ?auto_337080 ?auto_337087 ) ) ( not ( = ?auto_337080 ?auto_337088 ) ) ( not ( = ?auto_337080 ?auto_337089 ) ) ( not ( = ?auto_337080 ?auto_337090 ) ) ( not ( = ?auto_337081 ?auto_337082 ) ) ( not ( = ?auto_337081 ?auto_337083 ) ) ( not ( = ?auto_337081 ?auto_337084 ) ) ( not ( = ?auto_337081 ?auto_337085 ) ) ( not ( = ?auto_337081 ?auto_337086 ) ) ( not ( = ?auto_337081 ?auto_337087 ) ) ( not ( = ?auto_337081 ?auto_337088 ) ) ( not ( = ?auto_337081 ?auto_337089 ) ) ( not ( = ?auto_337081 ?auto_337090 ) ) ( not ( = ?auto_337082 ?auto_337083 ) ) ( not ( = ?auto_337082 ?auto_337084 ) ) ( not ( = ?auto_337082 ?auto_337085 ) ) ( not ( = ?auto_337082 ?auto_337086 ) ) ( not ( = ?auto_337082 ?auto_337087 ) ) ( not ( = ?auto_337082 ?auto_337088 ) ) ( not ( = ?auto_337082 ?auto_337089 ) ) ( not ( = ?auto_337082 ?auto_337090 ) ) ( not ( = ?auto_337083 ?auto_337084 ) ) ( not ( = ?auto_337083 ?auto_337085 ) ) ( not ( = ?auto_337083 ?auto_337086 ) ) ( not ( = ?auto_337083 ?auto_337087 ) ) ( not ( = ?auto_337083 ?auto_337088 ) ) ( not ( = ?auto_337083 ?auto_337089 ) ) ( not ( = ?auto_337083 ?auto_337090 ) ) ( not ( = ?auto_337084 ?auto_337085 ) ) ( not ( = ?auto_337084 ?auto_337086 ) ) ( not ( = ?auto_337084 ?auto_337087 ) ) ( not ( = ?auto_337084 ?auto_337088 ) ) ( not ( = ?auto_337084 ?auto_337089 ) ) ( not ( = ?auto_337084 ?auto_337090 ) ) ( not ( = ?auto_337085 ?auto_337086 ) ) ( not ( = ?auto_337085 ?auto_337087 ) ) ( not ( = ?auto_337085 ?auto_337088 ) ) ( not ( = ?auto_337085 ?auto_337089 ) ) ( not ( = ?auto_337085 ?auto_337090 ) ) ( not ( = ?auto_337086 ?auto_337087 ) ) ( not ( = ?auto_337086 ?auto_337088 ) ) ( not ( = ?auto_337086 ?auto_337089 ) ) ( not ( = ?auto_337086 ?auto_337090 ) ) ( not ( = ?auto_337087 ?auto_337088 ) ) ( not ( = ?auto_337087 ?auto_337089 ) ) ( not ( = ?auto_337087 ?auto_337090 ) ) ( not ( = ?auto_337088 ?auto_337089 ) ) ( not ( = ?auto_337088 ?auto_337090 ) ) ( not ( = ?auto_337089 ?auto_337090 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_337089 ?auto_337090 )
      ( !STACK ?auto_337089 ?auto_337088 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337103 - BLOCK
      ?auto_337104 - BLOCK
      ?auto_337105 - BLOCK
      ?auto_337106 - BLOCK
      ?auto_337107 - BLOCK
      ?auto_337108 - BLOCK
      ?auto_337109 - BLOCK
      ?auto_337110 - BLOCK
      ?auto_337111 - BLOCK
      ?auto_337112 - BLOCK
      ?auto_337113 - BLOCK
      ?auto_337114 - BLOCK
    )
    :vars
    (
      ?auto_337115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_337113 ) ( ON ?auto_337114 ?auto_337115 ) ( CLEAR ?auto_337114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_337103 ) ( ON ?auto_337104 ?auto_337103 ) ( ON ?auto_337105 ?auto_337104 ) ( ON ?auto_337106 ?auto_337105 ) ( ON ?auto_337107 ?auto_337106 ) ( ON ?auto_337108 ?auto_337107 ) ( ON ?auto_337109 ?auto_337108 ) ( ON ?auto_337110 ?auto_337109 ) ( ON ?auto_337111 ?auto_337110 ) ( ON ?auto_337112 ?auto_337111 ) ( ON ?auto_337113 ?auto_337112 ) ( not ( = ?auto_337103 ?auto_337104 ) ) ( not ( = ?auto_337103 ?auto_337105 ) ) ( not ( = ?auto_337103 ?auto_337106 ) ) ( not ( = ?auto_337103 ?auto_337107 ) ) ( not ( = ?auto_337103 ?auto_337108 ) ) ( not ( = ?auto_337103 ?auto_337109 ) ) ( not ( = ?auto_337103 ?auto_337110 ) ) ( not ( = ?auto_337103 ?auto_337111 ) ) ( not ( = ?auto_337103 ?auto_337112 ) ) ( not ( = ?auto_337103 ?auto_337113 ) ) ( not ( = ?auto_337103 ?auto_337114 ) ) ( not ( = ?auto_337103 ?auto_337115 ) ) ( not ( = ?auto_337104 ?auto_337105 ) ) ( not ( = ?auto_337104 ?auto_337106 ) ) ( not ( = ?auto_337104 ?auto_337107 ) ) ( not ( = ?auto_337104 ?auto_337108 ) ) ( not ( = ?auto_337104 ?auto_337109 ) ) ( not ( = ?auto_337104 ?auto_337110 ) ) ( not ( = ?auto_337104 ?auto_337111 ) ) ( not ( = ?auto_337104 ?auto_337112 ) ) ( not ( = ?auto_337104 ?auto_337113 ) ) ( not ( = ?auto_337104 ?auto_337114 ) ) ( not ( = ?auto_337104 ?auto_337115 ) ) ( not ( = ?auto_337105 ?auto_337106 ) ) ( not ( = ?auto_337105 ?auto_337107 ) ) ( not ( = ?auto_337105 ?auto_337108 ) ) ( not ( = ?auto_337105 ?auto_337109 ) ) ( not ( = ?auto_337105 ?auto_337110 ) ) ( not ( = ?auto_337105 ?auto_337111 ) ) ( not ( = ?auto_337105 ?auto_337112 ) ) ( not ( = ?auto_337105 ?auto_337113 ) ) ( not ( = ?auto_337105 ?auto_337114 ) ) ( not ( = ?auto_337105 ?auto_337115 ) ) ( not ( = ?auto_337106 ?auto_337107 ) ) ( not ( = ?auto_337106 ?auto_337108 ) ) ( not ( = ?auto_337106 ?auto_337109 ) ) ( not ( = ?auto_337106 ?auto_337110 ) ) ( not ( = ?auto_337106 ?auto_337111 ) ) ( not ( = ?auto_337106 ?auto_337112 ) ) ( not ( = ?auto_337106 ?auto_337113 ) ) ( not ( = ?auto_337106 ?auto_337114 ) ) ( not ( = ?auto_337106 ?auto_337115 ) ) ( not ( = ?auto_337107 ?auto_337108 ) ) ( not ( = ?auto_337107 ?auto_337109 ) ) ( not ( = ?auto_337107 ?auto_337110 ) ) ( not ( = ?auto_337107 ?auto_337111 ) ) ( not ( = ?auto_337107 ?auto_337112 ) ) ( not ( = ?auto_337107 ?auto_337113 ) ) ( not ( = ?auto_337107 ?auto_337114 ) ) ( not ( = ?auto_337107 ?auto_337115 ) ) ( not ( = ?auto_337108 ?auto_337109 ) ) ( not ( = ?auto_337108 ?auto_337110 ) ) ( not ( = ?auto_337108 ?auto_337111 ) ) ( not ( = ?auto_337108 ?auto_337112 ) ) ( not ( = ?auto_337108 ?auto_337113 ) ) ( not ( = ?auto_337108 ?auto_337114 ) ) ( not ( = ?auto_337108 ?auto_337115 ) ) ( not ( = ?auto_337109 ?auto_337110 ) ) ( not ( = ?auto_337109 ?auto_337111 ) ) ( not ( = ?auto_337109 ?auto_337112 ) ) ( not ( = ?auto_337109 ?auto_337113 ) ) ( not ( = ?auto_337109 ?auto_337114 ) ) ( not ( = ?auto_337109 ?auto_337115 ) ) ( not ( = ?auto_337110 ?auto_337111 ) ) ( not ( = ?auto_337110 ?auto_337112 ) ) ( not ( = ?auto_337110 ?auto_337113 ) ) ( not ( = ?auto_337110 ?auto_337114 ) ) ( not ( = ?auto_337110 ?auto_337115 ) ) ( not ( = ?auto_337111 ?auto_337112 ) ) ( not ( = ?auto_337111 ?auto_337113 ) ) ( not ( = ?auto_337111 ?auto_337114 ) ) ( not ( = ?auto_337111 ?auto_337115 ) ) ( not ( = ?auto_337112 ?auto_337113 ) ) ( not ( = ?auto_337112 ?auto_337114 ) ) ( not ( = ?auto_337112 ?auto_337115 ) ) ( not ( = ?auto_337113 ?auto_337114 ) ) ( not ( = ?auto_337113 ?auto_337115 ) ) ( not ( = ?auto_337114 ?auto_337115 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_337114 ?auto_337115 )
      ( !STACK ?auto_337114 ?auto_337113 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337128 - BLOCK
      ?auto_337129 - BLOCK
      ?auto_337130 - BLOCK
      ?auto_337131 - BLOCK
      ?auto_337132 - BLOCK
      ?auto_337133 - BLOCK
      ?auto_337134 - BLOCK
      ?auto_337135 - BLOCK
      ?auto_337136 - BLOCK
      ?auto_337137 - BLOCK
      ?auto_337138 - BLOCK
      ?auto_337139 - BLOCK
    )
    :vars
    (
      ?auto_337140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337139 ?auto_337140 ) ( ON-TABLE ?auto_337128 ) ( ON ?auto_337129 ?auto_337128 ) ( ON ?auto_337130 ?auto_337129 ) ( ON ?auto_337131 ?auto_337130 ) ( ON ?auto_337132 ?auto_337131 ) ( ON ?auto_337133 ?auto_337132 ) ( ON ?auto_337134 ?auto_337133 ) ( ON ?auto_337135 ?auto_337134 ) ( ON ?auto_337136 ?auto_337135 ) ( ON ?auto_337137 ?auto_337136 ) ( not ( = ?auto_337128 ?auto_337129 ) ) ( not ( = ?auto_337128 ?auto_337130 ) ) ( not ( = ?auto_337128 ?auto_337131 ) ) ( not ( = ?auto_337128 ?auto_337132 ) ) ( not ( = ?auto_337128 ?auto_337133 ) ) ( not ( = ?auto_337128 ?auto_337134 ) ) ( not ( = ?auto_337128 ?auto_337135 ) ) ( not ( = ?auto_337128 ?auto_337136 ) ) ( not ( = ?auto_337128 ?auto_337137 ) ) ( not ( = ?auto_337128 ?auto_337138 ) ) ( not ( = ?auto_337128 ?auto_337139 ) ) ( not ( = ?auto_337128 ?auto_337140 ) ) ( not ( = ?auto_337129 ?auto_337130 ) ) ( not ( = ?auto_337129 ?auto_337131 ) ) ( not ( = ?auto_337129 ?auto_337132 ) ) ( not ( = ?auto_337129 ?auto_337133 ) ) ( not ( = ?auto_337129 ?auto_337134 ) ) ( not ( = ?auto_337129 ?auto_337135 ) ) ( not ( = ?auto_337129 ?auto_337136 ) ) ( not ( = ?auto_337129 ?auto_337137 ) ) ( not ( = ?auto_337129 ?auto_337138 ) ) ( not ( = ?auto_337129 ?auto_337139 ) ) ( not ( = ?auto_337129 ?auto_337140 ) ) ( not ( = ?auto_337130 ?auto_337131 ) ) ( not ( = ?auto_337130 ?auto_337132 ) ) ( not ( = ?auto_337130 ?auto_337133 ) ) ( not ( = ?auto_337130 ?auto_337134 ) ) ( not ( = ?auto_337130 ?auto_337135 ) ) ( not ( = ?auto_337130 ?auto_337136 ) ) ( not ( = ?auto_337130 ?auto_337137 ) ) ( not ( = ?auto_337130 ?auto_337138 ) ) ( not ( = ?auto_337130 ?auto_337139 ) ) ( not ( = ?auto_337130 ?auto_337140 ) ) ( not ( = ?auto_337131 ?auto_337132 ) ) ( not ( = ?auto_337131 ?auto_337133 ) ) ( not ( = ?auto_337131 ?auto_337134 ) ) ( not ( = ?auto_337131 ?auto_337135 ) ) ( not ( = ?auto_337131 ?auto_337136 ) ) ( not ( = ?auto_337131 ?auto_337137 ) ) ( not ( = ?auto_337131 ?auto_337138 ) ) ( not ( = ?auto_337131 ?auto_337139 ) ) ( not ( = ?auto_337131 ?auto_337140 ) ) ( not ( = ?auto_337132 ?auto_337133 ) ) ( not ( = ?auto_337132 ?auto_337134 ) ) ( not ( = ?auto_337132 ?auto_337135 ) ) ( not ( = ?auto_337132 ?auto_337136 ) ) ( not ( = ?auto_337132 ?auto_337137 ) ) ( not ( = ?auto_337132 ?auto_337138 ) ) ( not ( = ?auto_337132 ?auto_337139 ) ) ( not ( = ?auto_337132 ?auto_337140 ) ) ( not ( = ?auto_337133 ?auto_337134 ) ) ( not ( = ?auto_337133 ?auto_337135 ) ) ( not ( = ?auto_337133 ?auto_337136 ) ) ( not ( = ?auto_337133 ?auto_337137 ) ) ( not ( = ?auto_337133 ?auto_337138 ) ) ( not ( = ?auto_337133 ?auto_337139 ) ) ( not ( = ?auto_337133 ?auto_337140 ) ) ( not ( = ?auto_337134 ?auto_337135 ) ) ( not ( = ?auto_337134 ?auto_337136 ) ) ( not ( = ?auto_337134 ?auto_337137 ) ) ( not ( = ?auto_337134 ?auto_337138 ) ) ( not ( = ?auto_337134 ?auto_337139 ) ) ( not ( = ?auto_337134 ?auto_337140 ) ) ( not ( = ?auto_337135 ?auto_337136 ) ) ( not ( = ?auto_337135 ?auto_337137 ) ) ( not ( = ?auto_337135 ?auto_337138 ) ) ( not ( = ?auto_337135 ?auto_337139 ) ) ( not ( = ?auto_337135 ?auto_337140 ) ) ( not ( = ?auto_337136 ?auto_337137 ) ) ( not ( = ?auto_337136 ?auto_337138 ) ) ( not ( = ?auto_337136 ?auto_337139 ) ) ( not ( = ?auto_337136 ?auto_337140 ) ) ( not ( = ?auto_337137 ?auto_337138 ) ) ( not ( = ?auto_337137 ?auto_337139 ) ) ( not ( = ?auto_337137 ?auto_337140 ) ) ( not ( = ?auto_337138 ?auto_337139 ) ) ( not ( = ?auto_337138 ?auto_337140 ) ) ( not ( = ?auto_337139 ?auto_337140 ) ) ( CLEAR ?auto_337137 ) ( ON ?auto_337138 ?auto_337139 ) ( CLEAR ?auto_337138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_337128 ?auto_337129 ?auto_337130 ?auto_337131 ?auto_337132 ?auto_337133 ?auto_337134 ?auto_337135 ?auto_337136 ?auto_337137 ?auto_337138 )
      ( MAKE-12PILE ?auto_337128 ?auto_337129 ?auto_337130 ?auto_337131 ?auto_337132 ?auto_337133 ?auto_337134 ?auto_337135 ?auto_337136 ?auto_337137 ?auto_337138 ?auto_337139 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337153 - BLOCK
      ?auto_337154 - BLOCK
      ?auto_337155 - BLOCK
      ?auto_337156 - BLOCK
      ?auto_337157 - BLOCK
      ?auto_337158 - BLOCK
      ?auto_337159 - BLOCK
      ?auto_337160 - BLOCK
      ?auto_337161 - BLOCK
      ?auto_337162 - BLOCK
      ?auto_337163 - BLOCK
      ?auto_337164 - BLOCK
    )
    :vars
    (
      ?auto_337165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337164 ?auto_337165 ) ( ON-TABLE ?auto_337153 ) ( ON ?auto_337154 ?auto_337153 ) ( ON ?auto_337155 ?auto_337154 ) ( ON ?auto_337156 ?auto_337155 ) ( ON ?auto_337157 ?auto_337156 ) ( ON ?auto_337158 ?auto_337157 ) ( ON ?auto_337159 ?auto_337158 ) ( ON ?auto_337160 ?auto_337159 ) ( ON ?auto_337161 ?auto_337160 ) ( ON ?auto_337162 ?auto_337161 ) ( not ( = ?auto_337153 ?auto_337154 ) ) ( not ( = ?auto_337153 ?auto_337155 ) ) ( not ( = ?auto_337153 ?auto_337156 ) ) ( not ( = ?auto_337153 ?auto_337157 ) ) ( not ( = ?auto_337153 ?auto_337158 ) ) ( not ( = ?auto_337153 ?auto_337159 ) ) ( not ( = ?auto_337153 ?auto_337160 ) ) ( not ( = ?auto_337153 ?auto_337161 ) ) ( not ( = ?auto_337153 ?auto_337162 ) ) ( not ( = ?auto_337153 ?auto_337163 ) ) ( not ( = ?auto_337153 ?auto_337164 ) ) ( not ( = ?auto_337153 ?auto_337165 ) ) ( not ( = ?auto_337154 ?auto_337155 ) ) ( not ( = ?auto_337154 ?auto_337156 ) ) ( not ( = ?auto_337154 ?auto_337157 ) ) ( not ( = ?auto_337154 ?auto_337158 ) ) ( not ( = ?auto_337154 ?auto_337159 ) ) ( not ( = ?auto_337154 ?auto_337160 ) ) ( not ( = ?auto_337154 ?auto_337161 ) ) ( not ( = ?auto_337154 ?auto_337162 ) ) ( not ( = ?auto_337154 ?auto_337163 ) ) ( not ( = ?auto_337154 ?auto_337164 ) ) ( not ( = ?auto_337154 ?auto_337165 ) ) ( not ( = ?auto_337155 ?auto_337156 ) ) ( not ( = ?auto_337155 ?auto_337157 ) ) ( not ( = ?auto_337155 ?auto_337158 ) ) ( not ( = ?auto_337155 ?auto_337159 ) ) ( not ( = ?auto_337155 ?auto_337160 ) ) ( not ( = ?auto_337155 ?auto_337161 ) ) ( not ( = ?auto_337155 ?auto_337162 ) ) ( not ( = ?auto_337155 ?auto_337163 ) ) ( not ( = ?auto_337155 ?auto_337164 ) ) ( not ( = ?auto_337155 ?auto_337165 ) ) ( not ( = ?auto_337156 ?auto_337157 ) ) ( not ( = ?auto_337156 ?auto_337158 ) ) ( not ( = ?auto_337156 ?auto_337159 ) ) ( not ( = ?auto_337156 ?auto_337160 ) ) ( not ( = ?auto_337156 ?auto_337161 ) ) ( not ( = ?auto_337156 ?auto_337162 ) ) ( not ( = ?auto_337156 ?auto_337163 ) ) ( not ( = ?auto_337156 ?auto_337164 ) ) ( not ( = ?auto_337156 ?auto_337165 ) ) ( not ( = ?auto_337157 ?auto_337158 ) ) ( not ( = ?auto_337157 ?auto_337159 ) ) ( not ( = ?auto_337157 ?auto_337160 ) ) ( not ( = ?auto_337157 ?auto_337161 ) ) ( not ( = ?auto_337157 ?auto_337162 ) ) ( not ( = ?auto_337157 ?auto_337163 ) ) ( not ( = ?auto_337157 ?auto_337164 ) ) ( not ( = ?auto_337157 ?auto_337165 ) ) ( not ( = ?auto_337158 ?auto_337159 ) ) ( not ( = ?auto_337158 ?auto_337160 ) ) ( not ( = ?auto_337158 ?auto_337161 ) ) ( not ( = ?auto_337158 ?auto_337162 ) ) ( not ( = ?auto_337158 ?auto_337163 ) ) ( not ( = ?auto_337158 ?auto_337164 ) ) ( not ( = ?auto_337158 ?auto_337165 ) ) ( not ( = ?auto_337159 ?auto_337160 ) ) ( not ( = ?auto_337159 ?auto_337161 ) ) ( not ( = ?auto_337159 ?auto_337162 ) ) ( not ( = ?auto_337159 ?auto_337163 ) ) ( not ( = ?auto_337159 ?auto_337164 ) ) ( not ( = ?auto_337159 ?auto_337165 ) ) ( not ( = ?auto_337160 ?auto_337161 ) ) ( not ( = ?auto_337160 ?auto_337162 ) ) ( not ( = ?auto_337160 ?auto_337163 ) ) ( not ( = ?auto_337160 ?auto_337164 ) ) ( not ( = ?auto_337160 ?auto_337165 ) ) ( not ( = ?auto_337161 ?auto_337162 ) ) ( not ( = ?auto_337161 ?auto_337163 ) ) ( not ( = ?auto_337161 ?auto_337164 ) ) ( not ( = ?auto_337161 ?auto_337165 ) ) ( not ( = ?auto_337162 ?auto_337163 ) ) ( not ( = ?auto_337162 ?auto_337164 ) ) ( not ( = ?auto_337162 ?auto_337165 ) ) ( not ( = ?auto_337163 ?auto_337164 ) ) ( not ( = ?auto_337163 ?auto_337165 ) ) ( not ( = ?auto_337164 ?auto_337165 ) ) ( CLEAR ?auto_337162 ) ( ON ?auto_337163 ?auto_337164 ) ( CLEAR ?auto_337163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_337153 ?auto_337154 ?auto_337155 ?auto_337156 ?auto_337157 ?auto_337158 ?auto_337159 ?auto_337160 ?auto_337161 ?auto_337162 ?auto_337163 )
      ( MAKE-12PILE ?auto_337153 ?auto_337154 ?auto_337155 ?auto_337156 ?auto_337157 ?auto_337158 ?auto_337159 ?auto_337160 ?auto_337161 ?auto_337162 ?auto_337163 ?auto_337164 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337178 - BLOCK
      ?auto_337179 - BLOCK
      ?auto_337180 - BLOCK
      ?auto_337181 - BLOCK
      ?auto_337182 - BLOCK
      ?auto_337183 - BLOCK
      ?auto_337184 - BLOCK
      ?auto_337185 - BLOCK
      ?auto_337186 - BLOCK
      ?auto_337187 - BLOCK
      ?auto_337188 - BLOCK
      ?auto_337189 - BLOCK
    )
    :vars
    (
      ?auto_337190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337189 ?auto_337190 ) ( ON-TABLE ?auto_337178 ) ( ON ?auto_337179 ?auto_337178 ) ( ON ?auto_337180 ?auto_337179 ) ( ON ?auto_337181 ?auto_337180 ) ( ON ?auto_337182 ?auto_337181 ) ( ON ?auto_337183 ?auto_337182 ) ( ON ?auto_337184 ?auto_337183 ) ( ON ?auto_337185 ?auto_337184 ) ( ON ?auto_337186 ?auto_337185 ) ( not ( = ?auto_337178 ?auto_337179 ) ) ( not ( = ?auto_337178 ?auto_337180 ) ) ( not ( = ?auto_337178 ?auto_337181 ) ) ( not ( = ?auto_337178 ?auto_337182 ) ) ( not ( = ?auto_337178 ?auto_337183 ) ) ( not ( = ?auto_337178 ?auto_337184 ) ) ( not ( = ?auto_337178 ?auto_337185 ) ) ( not ( = ?auto_337178 ?auto_337186 ) ) ( not ( = ?auto_337178 ?auto_337187 ) ) ( not ( = ?auto_337178 ?auto_337188 ) ) ( not ( = ?auto_337178 ?auto_337189 ) ) ( not ( = ?auto_337178 ?auto_337190 ) ) ( not ( = ?auto_337179 ?auto_337180 ) ) ( not ( = ?auto_337179 ?auto_337181 ) ) ( not ( = ?auto_337179 ?auto_337182 ) ) ( not ( = ?auto_337179 ?auto_337183 ) ) ( not ( = ?auto_337179 ?auto_337184 ) ) ( not ( = ?auto_337179 ?auto_337185 ) ) ( not ( = ?auto_337179 ?auto_337186 ) ) ( not ( = ?auto_337179 ?auto_337187 ) ) ( not ( = ?auto_337179 ?auto_337188 ) ) ( not ( = ?auto_337179 ?auto_337189 ) ) ( not ( = ?auto_337179 ?auto_337190 ) ) ( not ( = ?auto_337180 ?auto_337181 ) ) ( not ( = ?auto_337180 ?auto_337182 ) ) ( not ( = ?auto_337180 ?auto_337183 ) ) ( not ( = ?auto_337180 ?auto_337184 ) ) ( not ( = ?auto_337180 ?auto_337185 ) ) ( not ( = ?auto_337180 ?auto_337186 ) ) ( not ( = ?auto_337180 ?auto_337187 ) ) ( not ( = ?auto_337180 ?auto_337188 ) ) ( not ( = ?auto_337180 ?auto_337189 ) ) ( not ( = ?auto_337180 ?auto_337190 ) ) ( not ( = ?auto_337181 ?auto_337182 ) ) ( not ( = ?auto_337181 ?auto_337183 ) ) ( not ( = ?auto_337181 ?auto_337184 ) ) ( not ( = ?auto_337181 ?auto_337185 ) ) ( not ( = ?auto_337181 ?auto_337186 ) ) ( not ( = ?auto_337181 ?auto_337187 ) ) ( not ( = ?auto_337181 ?auto_337188 ) ) ( not ( = ?auto_337181 ?auto_337189 ) ) ( not ( = ?auto_337181 ?auto_337190 ) ) ( not ( = ?auto_337182 ?auto_337183 ) ) ( not ( = ?auto_337182 ?auto_337184 ) ) ( not ( = ?auto_337182 ?auto_337185 ) ) ( not ( = ?auto_337182 ?auto_337186 ) ) ( not ( = ?auto_337182 ?auto_337187 ) ) ( not ( = ?auto_337182 ?auto_337188 ) ) ( not ( = ?auto_337182 ?auto_337189 ) ) ( not ( = ?auto_337182 ?auto_337190 ) ) ( not ( = ?auto_337183 ?auto_337184 ) ) ( not ( = ?auto_337183 ?auto_337185 ) ) ( not ( = ?auto_337183 ?auto_337186 ) ) ( not ( = ?auto_337183 ?auto_337187 ) ) ( not ( = ?auto_337183 ?auto_337188 ) ) ( not ( = ?auto_337183 ?auto_337189 ) ) ( not ( = ?auto_337183 ?auto_337190 ) ) ( not ( = ?auto_337184 ?auto_337185 ) ) ( not ( = ?auto_337184 ?auto_337186 ) ) ( not ( = ?auto_337184 ?auto_337187 ) ) ( not ( = ?auto_337184 ?auto_337188 ) ) ( not ( = ?auto_337184 ?auto_337189 ) ) ( not ( = ?auto_337184 ?auto_337190 ) ) ( not ( = ?auto_337185 ?auto_337186 ) ) ( not ( = ?auto_337185 ?auto_337187 ) ) ( not ( = ?auto_337185 ?auto_337188 ) ) ( not ( = ?auto_337185 ?auto_337189 ) ) ( not ( = ?auto_337185 ?auto_337190 ) ) ( not ( = ?auto_337186 ?auto_337187 ) ) ( not ( = ?auto_337186 ?auto_337188 ) ) ( not ( = ?auto_337186 ?auto_337189 ) ) ( not ( = ?auto_337186 ?auto_337190 ) ) ( not ( = ?auto_337187 ?auto_337188 ) ) ( not ( = ?auto_337187 ?auto_337189 ) ) ( not ( = ?auto_337187 ?auto_337190 ) ) ( not ( = ?auto_337188 ?auto_337189 ) ) ( not ( = ?auto_337188 ?auto_337190 ) ) ( not ( = ?auto_337189 ?auto_337190 ) ) ( ON ?auto_337188 ?auto_337189 ) ( CLEAR ?auto_337186 ) ( ON ?auto_337187 ?auto_337188 ) ( CLEAR ?auto_337187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_337178 ?auto_337179 ?auto_337180 ?auto_337181 ?auto_337182 ?auto_337183 ?auto_337184 ?auto_337185 ?auto_337186 ?auto_337187 )
      ( MAKE-12PILE ?auto_337178 ?auto_337179 ?auto_337180 ?auto_337181 ?auto_337182 ?auto_337183 ?auto_337184 ?auto_337185 ?auto_337186 ?auto_337187 ?auto_337188 ?auto_337189 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337203 - BLOCK
      ?auto_337204 - BLOCK
      ?auto_337205 - BLOCK
      ?auto_337206 - BLOCK
      ?auto_337207 - BLOCK
      ?auto_337208 - BLOCK
      ?auto_337209 - BLOCK
      ?auto_337210 - BLOCK
      ?auto_337211 - BLOCK
      ?auto_337212 - BLOCK
      ?auto_337213 - BLOCK
      ?auto_337214 - BLOCK
    )
    :vars
    (
      ?auto_337215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337214 ?auto_337215 ) ( ON-TABLE ?auto_337203 ) ( ON ?auto_337204 ?auto_337203 ) ( ON ?auto_337205 ?auto_337204 ) ( ON ?auto_337206 ?auto_337205 ) ( ON ?auto_337207 ?auto_337206 ) ( ON ?auto_337208 ?auto_337207 ) ( ON ?auto_337209 ?auto_337208 ) ( ON ?auto_337210 ?auto_337209 ) ( ON ?auto_337211 ?auto_337210 ) ( not ( = ?auto_337203 ?auto_337204 ) ) ( not ( = ?auto_337203 ?auto_337205 ) ) ( not ( = ?auto_337203 ?auto_337206 ) ) ( not ( = ?auto_337203 ?auto_337207 ) ) ( not ( = ?auto_337203 ?auto_337208 ) ) ( not ( = ?auto_337203 ?auto_337209 ) ) ( not ( = ?auto_337203 ?auto_337210 ) ) ( not ( = ?auto_337203 ?auto_337211 ) ) ( not ( = ?auto_337203 ?auto_337212 ) ) ( not ( = ?auto_337203 ?auto_337213 ) ) ( not ( = ?auto_337203 ?auto_337214 ) ) ( not ( = ?auto_337203 ?auto_337215 ) ) ( not ( = ?auto_337204 ?auto_337205 ) ) ( not ( = ?auto_337204 ?auto_337206 ) ) ( not ( = ?auto_337204 ?auto_337207 ) ) ( not ( = ?auto_337204 ?auto_337208 ) ) ( not ( = ?auto_337204 ?auto_337209 ) ) ( not ( = ?auto_337204 ?auto_337210 ) ) ( not ( = ?auto_337204 ?auto_337211 ) ) ( not ( = ?auto_337204 ?auto_337212 ) ) ( not ( = ?auto_337204 ?auto_337213 ) ) ( not ( = ?auto_337204 ?auto_337214 ) ) ( not ( = ?auto_337204 ?auto_337215 ) ) ( not ( = ?auto_337205 ?auto_337206 ) ) ( not ( = ?auto_337205 ?auto_337207 ) ) ( not ( = ?auto_337205 ?auto_337208 ) ) ( not ( = ?auto_337205 ?auto_337209 ) ) ( not ( = ?auto_337205 ?auto_337210 ) ) ( not ( = ?auto_337205 ?auto_337211 ) ) ( not ( = ?auto_337205 ?auto_337212 ) ) ( not ( = ?auto_337205 ?auto_337213 ) ) ( not ( = ?auto_337205 ?auto_337214 ) ) ( not ( = ?auto_337205 ?auto_337215 ) ) ( not ( = ?auto_337206 ?auto_337207 ) ) ( not ( = ?auto_337206 ?auto_337208 ) ) ( not ( = ?auto_337206 ?auto_337209 ) ) ( not ( = ?auto_337206 ?auto_337210 ) ) ( not ( = ?auto_337206 ?auto_337211 ) ) ( not ( = ?auto_337206 ?auto_337212 ) ) ( not ( = ?auto_337206 ?auto_337213 ) ) ( not ( = ?auto_337206 ?auto_337214 ) ) ( not ( = ?auto_337206 ?auto_337215 ) ) ( not ( = ?auto_337207 ?auto_337208 ) ) ( not ( = ?auto_337207 ?auto_337209 ) ) ( not ( = ?auto_337207 ?auto_337210 ) ) ( not ( = ?auto_337207 ?auto_337211 ) ) ( not ( = ?auto_337207 ?auto_337212 ) ) ( not ( = ?auto_337207 ?auto_337213 ) ) ( not ( = ?auto_337207 ?auto_337214 ) ) ( not ( = ?auto_337207 ?auto_337215 ) ) ( not ( = ?auto_337208 ?auto_337209 ) ) ( not ( = ?auto_337208 ?auto_337210 ) ) ( not ( = ?auto_337208 ?auto_337211 ) ) ( not ( = ?auto_337208 ?auto_337212 ) ) ( not ( = ?auto_337208 ?auto_337213 ) ) ( not ( = ?auto_337208 ?auto_337214 ) ) ( not ( = ?auto_337208 ?auto_337215 ) ) ( not ( = ?auto_337209 ?auto_337210 ) ) ( not ( = ?auto_337209 ?auto_337211 ) ) ( not ( = ?auto_337209 ?auto_337212 ) ) ( not ( = ?auto_337209 ?auto_337213 ) ) ( not ( = ?auto_337209 ?auto_337214 ) ) ( not ( = ?auto_337209 ?auto_337215 ) ) ( not ( = ?auto_337210 ?auto_337211 ) ) ( not ( = ?auto_337210 ?auto_337212 ) ) ( not ( = ?auto_337210 ?auto_337213 ) ) ( not ( = ?auto_337210 ?auto_337214 ) ) ( not ( = ?auto_337210 ?auto_337215 ) ) ( not ( = ?auto_337211 ?auto_337212 ) ) ( not ( = ?auto_337211 ?auto_337213 ) ) ( not ( = ?auto_337211 ?auto_337214 ) ) ( not ( = ?auto_337211 ?auto_337215 ) ) ( not ( = ?auto_337212 ?auto_337213 ) ) ( not ( = ?auto_337212 ?auto_337214 ) ) ( not ( = ?auto_337212 ?auto_337215 ) ) ( not ( = ?auto_337213 ?auto_337214 ) ) ( not ( = ?auto_337213 ?auto_337215 ) ) ( not ( = ?auto_337214 ?auto_337215 ) ) ( ON ?auto_337213 ?auto_337214 ) ( CLEAR ?auto_337211 ) ( ON ?auto_337212 ?auto_337213 ) ( CLEAR ?auto_337212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_337203 ?auto_337204 ?auto_337205 ?auto_337206 ?auto_337207 ?auto_337208 ?auto_337209 ?auto_337210 ?auto_337211 ?auto_337212 )
      ( MAKE-12PILE ?auto_337203 ?auto_337204 ?auto_337205 ?auto_337206 ?auto_337207 ?auto_337208 ?auto_337209 ?auto_337210 ?auto_337211 ?auto_337212 ?auto_337213 ?auto_337214 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337228 - BLOCK
      ?auto_337229 - BLOCK
      ?auto_337230 - BLOCK
      ?auto_337231 - BLOCK
      ?auto_337232 - BLOCK
      ?auto_337233 - BLOCK
      ?auto_337234 - BLOCK
      ?auto_337235 - BLOCK
      ?auto_337236 - BLOCK
      ?auto_337237 - BLOCK
      ?auto_337238 - BLOCK
      ?auto_337239 - BLOCK
    )
    :vars
    (
      ?auto_337240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337239 ?auto_337240 ) ( ON-TABLE ?auto_337228 ) ( ON ?auto_337229 ?auto_337228 ) ( ON ?auto_337230 ?auto_337229 ) ( ON ?auto_337231 ?auto_337230 ) ( ON ?auto_337232 ?auto_337231 ) ( ON ?auto_337233 ?auto_337232 ) ( ON ?auto_337234 ?auto_337233 ) ( ON ?auto_337235 ?auto_337234 ) ( not ( = ?auto_337228 ?auto_337229 ) ) ( not ( = ?auto_337228 ?auto_337230 ) ) ( not ( = ?auto_337228 ?auto_337231 ) ) ( not ( = ?auto_337228 ?auto_337232 ) ) ( not ( = ?auto_337228 ?auto_337233 ) ) ( not ( = ?auto_337228 ?auto_337234 ) ) ( not ( = ?auto_337228 ?auto_337235 ) ) ( not ( = ?auto_337228 ?auto_337236 ) ) ( not ( = ?auto_337228 ?auto_337237 ) ) ( not ( = ?auto_337228 ?auto_337238 ) ) ( not ( = ?auto_337228 ?auto_337239 ) ) ( not ( = ?auto_337228 ?auto_337240 ) ) ( not ( = ?auto_337229 ?auto_337230 ) ) ( not ( = ?auto_337229 ?auto_337231 ) ) ( not ( = ?auto_337229 ?auto_337232 ) ) ( not ( = ?auto_337229 ?auto_337233 ) ) ( not ( = ?auto_337229 ?auto_337234 ) ) ( not ( = ?auto_337229 ?auto_337235 ) ) ( not ( = ?auto_337229 ?auto_337236 ) ) ( not ( = ?auto_337229 ?auto_337237 ) ) ( not ( = ?auto_337229 ?auto_337238 ) ) ( not ( = ?auto_337229 ?auto_337239 ) ) ( not ( = ?auto_337229 ?auto_337240 ) ) ( not ( = ?auto_337230 ?auto_337231 ) ) ( not ( = ?auto_337230 ?auto_337232 ) ) ( not ( = ?auto_337230 ?auto_337233 ) ) ( not ( = ?auto_337230 ?auto_337234 ) ) ( not ( = ?auto_337230 ?auto_337235 ) ) ( not ( = ?auto_337230 ?auto_337236 ) ) ( not ( = ?auto_337230 ?auto_337237 ) ) ( not ( = ?auto_337230 ?auto_337238 ) ) ( not ( = ?auto_337230 ?auto_337239 ) ) ( not ( = ?auto_337230 ?auto_337240 ) ) ( not ( = ?auto_337231 ?auto_337232 ) ) ( not ( = ?auto_337231 ?auto_337233 ) ) ( not ( = ?auto_337231 ?auto_337234 ) ) ( not ( = ?auto_337231 ?auto_337235 ) ) ( not ( = ?auto_337231 ?auto_337236 ) ) ( not ( = ?auto_337231 ?auto_337237 ) ) ( not ( = ?auto_337231 ?auto_337238 ) ) ( not ( = ?auto_337231 ?auto_337239 ) ) ( not ( = ?auto_337231 ?auto_337240 ) ) ( not ( = ?auto_337232 ?auto_337233 ) ) ( not ( = ?auto_337232 ?auto_337234 ) ) ( not ( = ?auto_337232 ?auto_337235 ) ) ( not ( = ?auto_337232 ?auto_337236 ) ) ( not ( = ?auto_337232 ?auto_337237 ) ) ( not ( = ?auto_337232 ?auto_337238 ) ) ( not ( = ?auto_337232 ?auto_337239 ) ) ( not ( = ?auto_337232 ?auto_337240 ) ) ( not ( = ?auto_337233 ?auto_337234 ) ) ( not ( = ?auto_337233 ?auto_337235 ) ) ( not ( = ?auto_337233 ?auto_337236 ) ) ( not ( = ?auto_337233 ?auto_337237 ) ) ( not ( = ?auto_337233 ?auto_337238 ) ) ( not ( = ?auto_337233 ?auto_337239 ) ) ( not ( = ?auto_337233 ?auto_337240 ) ) ( not ( = ?auto_337234 ?auto_337235 ) ) ( not ( = ?auto_337234 ?auto_337236 ) ) ( not ( = ?auto_337234 ?auto_337237 ) ) ( not ( = ?auto_337234 ?auto_337238 ) ) ( not ( = ?auto_337234 ?auto_337239 ) ) ( not ( = ?auto_337234 ?auto_337240 ) ) ( not ( = ?auto_337235 ?auto_337236 ) ) ( not ( = ?auto_337235 ?auto_337237 ) ) ( not ( = ?auto_337235 ?auto_337238 ) ) ( not ( = ?auto_337235 ?auto_337239 ) ) ( not ( = ?auto_337235 ?auto_337240 ) ) ( not ( = ?auto_337236 ?auto_337237 ) ) ( not ( = ?auto_337236 ?auto_337238 ) ) ( not ( = ?auto_337236 ?auto_337239 ) ) ( not ( = ?auto_337236 ?auto_337240 ) ) ( not ( = ?auto_337237 ?auto_337238 ) ) ( not ( = ?auto_337237 ?auto_337239 ) ) ( not ( = ?auto_337237 ?auto_337240 ) ) ( not ( = ?auto_337238 ?auto_337239 ) ) ( not ( = ?auto_337238 ?auto_337240 ) ) ( not ( = ?auto_337239 ?auto_337240 ) ) ( ON ?auto_337238 ?auto_337239 ) ( ON ?auto_337237 ?auto_337238 ) ( CLEAR ?auto_337235 ) ( ON ?auto_337236 ?auto_337237 ) ( CLEAR ?auto_337236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_337228 ?auto_337229 ?auto_337230 ?auto_337231 ?auto_337232 ?auto_337233 ?auto_337234 ?auto_337235 ?auto_337236 )
      ( MAKE-12PILE ?auto_337228 ?auto_337229 ?auto_337230 ?auto_337231 ?auto_337232 ?auto_337233 ?auto_337234 ?auto_337235 ?auto_337236 ?auto_337237 ?auto_337238 ?auto_337239 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337253 - BLOCK
      ?auto_337254 - BLOCK
      ?auto_337255 - BLOCK
      ?auto_337256 - BLOCK
      ?auto_337257 - BLOCK
      ?auto_337258 - BLOCK
      ?auto_337259 - BLOCK
      ?auto_337260 - BLOCK
      ?auto_337261 - BLOCK
      ?auto_337262 - BLOCK
      ?auto_337263 - BLOCK
      ?auto_337264 - BLOCK
    )
    :vars
    (
      ?auto_337265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337264 ?auto_337265 ) ( ON-TABLE ?auto_337253 ) ( ON ?auto_337254 ?auto_337253 ) ( ON ?auto_337255 ?auto_337254 ) ( ON ?auto_337256 ?auto_337255 ) ( ON ?auto_337257 ?auto_337256 ) ( ON ?auto_337258 ?auto_337257 ) ( ON ?auto_337259 ?auto_337258 ) ( ON ?auto_337260 ?auto_337259 ) ( not ( = ?auto_337253 ?auto_337254 ) ) ( not ( = ?auto_337253 ?auto_337255 ) ) ( not ( = ?auto_337253 ?auto_337256 ) ) ( not ( = ?auto_337253 ?auto_337257 ) ) ( not ( = ?auto_337253 ?auto_337258 ) ) ( not ( = ?auto_337253 ?auto_337259 ) ) ( not ( = ?auto_337253 ?auto_337260 ) ) ( not ( = ?auto_337253 ?auto_337261 ) ) ( not ( = ?auto_337253 ?auto_337262 ) ) ( not ( = ?auto_337253 ?auto_337263 ) ) ( not ( = ?auto_337253 ?auto_337264 ) ) ( not ( = ?auto_337253 ?auto_337265 ) ) ( not ( = ?auto_337254 ?auto_337255 ) ) ( not ( = ?auto_337254 ?auto_337256 ) ) ( not ( = ?auto_337254 ?auto_337257 ) ) ( not ( = ?auto_337254 ?auto_337258 ) ) ( not ( = ?auto_337254 ?auto_337259 ) ) ( not ( = ?auto_337254 ?auto_337260 ) ) ( not ( = ?auto_337254 ?auto_337261 ) ) ( not ( = ?auto_337254 ?auto_337262 ) ) ( not ( = ?auto_337254 ?auto_337263 ) ) ( not ( = ?auto_337254 ?auto_337264 ) ) ( not ( = ?auto_337254 ?auto_337265 ) ) ( not ( = ?auto_337255 ?auto_337256 ) ) ( not ( = ?auto_337255 ?auto_337257 ) ) ( not ( = ?auto_337255 ?auto_337258 ) ) ( not ( = ?auto_337255 ?auto_337259 ) ) ( not ( = ?auto_337255 ?auto_337260 ) ) ( not ( = ?auto_337255 ?auto_337261 ) ) ( not ( = ?auto_337255 ?auto_337262 ) ) ( not ( = ?auto_337255 ?auto_337263 ) ) ( not ( = ?auto_337255 ?auto_337264 ) ) ( not ( = ?auto_337255 ?auto_337265 ) ) ( not ( = ?auto_337256 ?auto_337257 ) ) ( not ( = ?auto_337256 ?auto_337258 ) ) ( not ( = ?auto_337256 ?auto_337259 ) ) ( not ( = ?auto_337256 ?auto_337260 ) ) ( not ( = ?auto_337256 ?auto_337261 ) ) ( not ( = ?auto_337256 ?auto_337262 ) ) ( not ( = ?auto_337256 ?auto_337263 ) ) ( not ( = ?auto_337256 ?auto_337264 ) ) ( not ( = ?auto_337256 ?auto_337265 ) ) ( not ( = ?auto_337257 ?auto_337258 ) ) ( not ( = ?auto_337257 ?auto_337259 ) ) ( not ( = ?auto_337257 ?auto_337260 ) ) ( not ( = ?auto_337257 ?auto_337261 ) ) ( not ( = ?auto_337257 ?auto_337262 ) ) ( not ( = ?auto_337257 ?auto_337263 ) ) ( not ( = ?auto_337257 ?auto_337264 ) ) ( not ( = ?auto_337257 ?auto_337265 ) ) ( not ( = ?auto_337258 ?auto_337259 ) ) ( not ( = ?auto_337258 ?auto_337260 ) ) ( not ( = ?auto_337258 ?auto_337261 ) ) ( not ( = ?auto_337258 ?auto_337262 ) ) ( not ( = ?auto_337258 ?auto_337263 ) ) ( not ( = ?auto_337258 ?auto_337264 ) ) ( not ( = ?auto_337258 ?auto_337265 ) ) ( not ( = ?auto_337259 ?auto_337260 ) ) ( not ( = ?auto_337259 ?auto_337261 ) ) ( not ( = ?auto_337259 ?auto_337262 ) ) ( not ( = ?auto_337259 ?auto_337263 ) ) ( not ( = ?auto_337259 ?auto_337264 ) ) ( not ( = ?auto_337259 ?auto_337265 ) ) ( not ( = ?auto_337260 ?auto_337261 ) ) ( not ( = ?auto_337260 ?auto_337262 ) ) ( not ( = ?auto_337260 ?auto_337263 ) ) ( not ( = ?auto_337260 ?auto_337264 ) ) ( not ( = ?auto_337260 ?auto_337265 ) ) ( not ( = ?auto_337261 ?auto_337262 ) ) ( not ( = ?auto_337261 ?auto_337263 ) ) ( not ( = ?auto_337261 ?auto_337264 ) ) ( not ( = ?auto_337261 ?auto_337265 ) ) ( not ( = ?auto_337262 ?auto_337263 ) ) ( not ( = ?auto_337262 ?auto_337264 ) ) ( not ( = ?auto_337262 ?auto_337265 ) ) ( not ( = ?auto_337263 ?auto_337264 ) ) ( not ( = ?auto_337263 ?auto_337265 ) ) ( not ( = ?auto_337264 ?auto_337265 ) ) ( ON ?auto_337263 ?auto_337264 ) ( ON ?auto_337262 ?auto_337263 ) ( CLEAR ?auto_337260 ) ( ON ?auto_337261 ?auto_337262 ) ( CLEAR ?auto_337261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_337253 ?auto_337254 ?auto_337255 ?auto_337256 ?auto_337257 ?auto_337258 ?auto_337259 ?auto_337260 ?auto_337261 )
      ( MAKE-12PILE ?auto_337253 ?auto_337254 ?auto_337255 ?auto_337256 ?auto_337257 ?auto_337258 ?auto_337259 ?auto_337260 ?auto_337261 ?auto_337262 ?auto_337263 ?auto_337264 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337278 - BLOCK
      ?auto_337279 - BLOCK
      ?auto_337280 - BLOCK
      ?auto_337281 - BLOCK
      ?auto_337282 - BLOCK
      ?auto_337283 - BLOCK
      ?auto_337284 - BLOCK
      ?auto_337285 - BLOCK
      ?auto_337286 - BLOCK
      ?auto_337287 - BLOCK
      ?auto_337288 - BLOCK
      ?auto_337289 - BLOCK
    )
    :vars
    (
      ?auto_337290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337289 ?auto_337290 ) ( ON-TABLE ?auto_337278 ) ( ON ?auto_337279 ?auto_337278 ) ( ON ?auto_337280 ?auto_337279 ) ( ON ?auto_337281 ?auto_337280 ) ( ON ?auto_337282 ?auto_337281 ) ( ON ?auto_337283 ?auto_337282 ) ( ON ?auto_337284 ?auto_337283 ) ( not ( = ?auto_337278 ?auto_337279 ) ) ( not ( = ?auto_337278 ?auto_337280 ) ) ( not ( = ?auto_337278 ?auto_337281 ) ) ( not ( = ?auto_337278 ?auto_337282 ) ) ( not ( = ?auto_337278 ?auto_337283 ) ) ( not ( = ?auto_337278 ?auto_337284 ) ) ( not ( = ?auto_337278 ?auto_337285 ) ) ( not ( = ?auto_337278 ?auto_337286 ) ) ( not ( = ?auto_337278 ?auto_337287 ) ) ( not ( = ?auto_337278 ?auto_337288 ) ) ( not ( = ?auto_337278 ?auto_337289 ) ) ( not ( = ?auto_337278 ?auto_337290 ) ) ( not ( = ?auto_337279 ?auto_337280 ) ) ( not ( = ?auto_337279 ?auto_337281 ) ) ( not ( = ?auto_337279 ?auto_337282 ) ) ( not ( = ?auto_337279 ?auto_337283 ) ) ( not ( = ?auto_337279 ?auto_337284 ) ) ( not ( = ?auto_337279 ?auto_337285 ) ) ( not ( = ?auto_337279 ?auto_337286 ) ) ( not ( = ?auto_337279 ?auto_337287 ) ) ( not ( = ?auto_337279 ?auto_337288 ) ) ( not ( = ?auto_337279 ?auto_337289 ) ) ( not ( = ?auto_337279 ?auto_337290 ) ) ( not ( = ?auto_337280 ?auto_337281 ) ) ( not ( = ?auto_337280 ?auto_337282 ) ) ( not ( = ?auto_337280 ?auto_337283 ) ) ( not ( = ?auto_337280 ?auto_337284 ) ) ( not ( = ?auto_337280 ?auto_337285 ) ) ( not ( = ?auto_337280 ?auto_337286 ) ) ( not ( = ?auto_337280 ?auto_337287 ) ) ( not ( = ?auto_337280 ?auto_337288 ) ) ( not ( = ?auto_337280 ?auto_337289 ) ) ( not ( = ?auto_337280 ?auto_337290 ) ) ( not ( = ?auto_337281 ?auto_337282 ) ) ( not ( = ?auto_337281 ?auto_337283 ) ) ( not ( = ?auto_337281 ?auto_337284 ) ) ( not ( = ?auto_337281 ?auto_337285 ) ) ( not ( = ?auto_337281 ?auto_337286 ) ) ( not ( = ?auto_337281 ?auto_337287 ) ) ( not ( = ?auto_337281 ?auto_337288 ) ) ( not ( = ?auto_337281 ?auto_337289 ) ) ( not ( = ?auto_337281 ?auto_337290 ) ) ( not ( = ?auto_337282 ?auto_337283 ) ) ( not ( = ?auto_337282 ?auto_337284 ) ) ( not ( = ?auto_337282 ?auto_337285 ) ) ( not ( = ?auto_337282 ?auto_337286 ) ) ( not ( = ?auto_337282 ?auto_337287 ) ) ( not ( = ?auto_337282 ?auto_337288 ) ) ( not ( = ?auto_337282 ?auto_337289 ) ) ( not ( = ?auto_337282 ?auto_337290 ) ) ( not ( = ?auto_337283 ?auto_337284 ) ) ( not ( = ?auto_337283 ?auto_337285 ) ) ( not ( = ?auto_337283 ?auto_337286 ) ) ( not ( = ?auto_337283 ?auto_337287 ) ) ( not ( = ?auto_337283 ?auto_337288 ) ) ( not ( = ?auto_337283 ?auto_337289 ) ) ( not ( = ?auto_337283 ?auto_337290 ) ) ( not ( = ?auto_337284 ?auto_337285 ) ) ( not ( = ?auto_337284 ?auto_337286 ) ) ( not ( = ?auto_337284 ?auto_337287 ) ) ( not ( = ?auto_337284 ?auto_337288 ) ) ( not ( = ?auto_337284 ?auto_337289 ) ) ( not ( = ?auto_337284 ?auto_337290 ) ) ( not ( = ?auto_337285 ?auto_337286 ) ) ( not ( = ?auto_337285 ?auto_337287 ) ) ( not ( = ?auto_337285 ?auto_337288 ) ) ( not ( = ?auto_337285 ?auto_337289 ) ) ( not ( = ?auto_337285 ?auto_337290 ) ) ( not ( = ?auto_337286 ?auto_337287 ) ) ( not ( = ?auto_337286 ?auto_337288 ) ) ( not ( = ?auto_337286 ?auto_337289 ) ) ( not ( = ?auto_337286 ?auto_337290 ) ) ( not ( = ?auto_337287 ?auto_337288 ) ) ( not ( = ?auto_337287 ?auto_337289 ) ) ( not ( = ?auto_337287 ?auto_337290 ) ) ( not ( = ?auto_337288 ?auto_337289 ) ) ( not ( = ?auto_337288 ?auto_337290 ) ) ( not ( = ?auto_337289 ?auto_337290 ) ) ( ON ?auto_337288 ?auto_337289 ) ( ON ?auto_337287 ?auto_337288 ) ( ON ?auto_337286 ?auto_337287 ) ( CLEAR ?auto_337284 ) ( ON ?auto_337285 ?auto_337286 ) ( CLEAR ?auto_337285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_337278 ?auto_337279 ?auto_337280 ?auto_337281 ?auto_337282 ?auto_337283 ?auto_337284 ?auto_337285 )
      ( MAKE-12PILE ?auto_337278 ?auto_337279 ?auto_337280 ?auto_337281 ?auto_337282 ?auto_337283 ?auto_337284 ?auto_337285 ?auto_337286 ?auto_337287 ?auto_337288 ?auto_337289 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337303 - BLOCK
      ?auto_337304 - BLOCK
      ?auto_337305 - BLOCK
      ?auto_337306 - BLOCK
      ?auto_337307 - BLOCK
      ?auto_337308 - BLOCK
      ?auto_337309 - BLOCK
      ?auto_337310 - BLOCK
      ?auto_337311 - BLOCK
      ?auto_337312 - BLOCK
      ?auto_337313 - BLOCK
      ?auto_337314 - BLOCK
    )
    :vars
    (
      ?auto_337315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337314 ?auto_337315 ) ( ON-TABLE ?auto_337303 ) ( ON ?auto_337304 ?auto_337303 ) ( ON ?auto_337305 ?auto_337304 ) ( ON ?auto_337306 ?auto_337305 ) ( ON ?auto_337307 ?auto_337306 ) ( ON ?auto_337308 ?auto_337307 ) ( ON ?auto_337309 ?auto_337308 ) ( not ( = ?auto_337303 ?auto_337304 ) ) ( not ( = ?auto_337303 ?auto_337305 ) ) ( not ( = ?auto_337303 ?auto_337306 ) ) ( not ( = ?auto_337303 ?auto_337307 ) ) ( not ( = ?auto_337303 ?auto_337308 ) ) ( not ( = ?auto_337303 ?auto_337309 ) ) ( not ( = ?auto_337303 ?auto_337310 ) ) ( not ( = ?auto_337303 ?auto_337311 ) ) ( not ( = ?auto_337303 ?auto_337312 ) ) ( not ( = ?auto_337303 ?auto_337313 ) ) ( not ( = ?auto_337303 ?auto_337314 ) ) ( not ( = ?auto_337303 ?auto_337315 ) ) ( not ( = ?auto_337304 ?auto_337305 ) ) ( not ( = ?auto_337304 ?auto_337306 ) ) ( not ( = ?auto_337304 ?auto_337307 ) ) ( not ( = ?auto_337304 ?auto_337308 ) ) ( not ( = ?auto_337304 ?auto_337309 ) ) ( not ( = ?auto_337304 ?auto_337310 ) ) ( not ( = ?auto_337304 ?auto_337311 ) ) ( not ( = ?auto_337304 ?auto_337312 ) ) ( not ( = ?auto_337304 ?auto_337313 ) ) ( not ( = ?auto_337304 ?auto_337314 ) ) ( not ( = ?auto_337304 ?auto_337315 ) ) ( not ( = ?auto_337305 ?auto_337306 ) ) ( not ( = ?auto_337305 ?auto_337307 ) ) ( not ( = ?auto_337305 ?auto_337308 ) ) ( not ( = ?auto_337305 ?auto_337309 ) ) ( not ( = ?auto_337305 ?auto_337310 ) ) ( not ( = ?auto_337305 ?auto_337311 ) ) ( not ( = ?auto_337305 ?auto_337312 ) ) ( not ( = ?auto_337305 ?auto_337313 ) ) ( not ( = ?auto_337305 ?auto_337314 ) ) ( not ( = ?auto_337305 ?auto_337315 ) ) ( not ( = ?auto_337306 ?auto_337307 ) ) ( not ( = ?auto_337306 ?auto_337308 ) ) ( not ( = ?auto_337306 ?auto_337309 ) ) ( not ( = ?auto_337306 ?auto_337310 ) ) ( not ( = ?auto_337306 ?auto_337311 ) ) ( not ( = ?auto_337306 ?auto_337312 ) ) ( not ( = ?auto_337306 ?auto_337313 ) ) ( not ( = ?auto_337306 ?auto_337314 ) ) ( not ( = ?auto_337306 ?auto_337315 ) ) ( not ( = ?auto_337307 ?auto_337308 ) ) ( not ( = ?auto_337307 ?auto_337309 ) ) ( not ( = ?auto_337307 ?auto_337310 ) ) ( not ( = ?auto_337307 ?auto_337311 ) ) ( not ( = ?auto_337307 ?auto_337312 ) ) ( not ( = ?auto_337307 ?auto_337313 ) ) ( not ( = ?auto_337307 ?auto_337314 ) ) ( not ( = ?auto_337307 ?auto_337315 ) ) ( not ( = ?auto_337308 ?auto_337309 ) ) ( not ( = ?auto_337308 ?auto_337310 ) ) ( not ( = ?auto_337308 ?auto_337311 ) ) ( not ( = ?auto_337308 ?auto_337312 ) ) ( not ( = ?auto_337308 ?auto_337313 ) ) ( not ( = ?auto_337308 ?auto_337314 ) ) ( not ( = ?auto_337308 ?auto_337315 ) ) ( not ( = ?auto_337309 ?auto_337310 ) ) ( not ( = ?auto_337309 ?auto_337311 ) ) ( not ( = ?auto_337309 ?auto_337312 ) ) ( not ( = ?auto_337309 ?auto_337313 ) ) ( not ( = ?auto_337309 ?auto_337314 ) ) ( not ( = ?auto_337309 ?auto_337315 ) ) ( not ( = ?auto_337310 ?auto_337311 ) ) ( not ( = ?auto_337310 ?auto_337312 ) ) ( not ( = ?auto_337310 ?auto_337313 ) ) ( not ( = ?auto_337310 ?auto_337314 ) ) ( not ( = ?auto_337310 ?auto_337315 ) ) ( not ( = ?auto_337311 ?auto_337312 ) ) ( not ( = ?auto_337311 ?auto_337313 ) ) ( not ( = ?auto_337311 ?auto_337314 ) ) ( not ( = ?auto_337311 ?auto_337315 ) ) ( not ( = ?auto_337312 ?auto_337313 ) ) ( not ( = ?auto_337312 ?auto_337314 ) ) ( not ( = ?auto_337312 ?auto_337315 ) ) ( not ( = ?auto_337313 ?auto_337314 ) ) ( not ( = ?auto_337313 ?auto_337315 ) ) ( not ( = ?auto_337314 ?auto_337315 ) ) ( ON ?auto_337313 ?auto_337314 ) ( ON ?auto_337312 ?auto_337313 ) ( ON ?auto_337311 ?auto_337312 ) ( CLEAR ?auto_337309 ) ( ON ?auto_337310 ?auto_337311 ) ( CLEAR ?auto_337310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_337303 ?auto_337304 ?auto_337305 ?auto_337306 ?auto_337307 ?auto_337308 ?auto_337309 ?auto_337310 )
      ( MAKE-12PILE ?auto_337303 ?auto_337304 ?auto_337305 ?auto_337306 ?auto_337307 ?auto_337308 ?auto_337309 ?auto_337310 ?auto_337311 ?auto_337312 ?auto_337313 ?auto_337314 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337328 - BLOCK
      ?auto_337329 - BLOCK
      ?auto_337330 - BLOCK
      ?auto_337331 - BLOCK
      ?auto_337332 - BLOCK
      ?auto_337333 - BLOCK
      ?auto_337334 - BLOCK
      ?auto_337335 - BLOCK
      ?auto_337336 - BLOCK
      ?auto_337337 - BLOCK
      ?auto_337338 - BLOCK
      ?auto_337339 - BLOCK
    )
    :vars
    (
      ?auto_337340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337339 ?auto_337340 ) ( ON-TABLE ?auto_337328 ) ( ON ?auto_337329 ?auto_337328 ) ( ON ?auto_337330 ?auto_337329 ) ( ON ?auto_337331 ?auto_337330 ) ( ON ?auto_337332 ?auto_337331 ) ( ON ?auto_337333 ?auto_337332 ) ( not ( = ?auto_337328 ?auto_337329 ) ) ( not ( = ?auto_337328 ?auto_337330 ) ) ( not ( = ?auto_337328 ?auto_337331 ) ) ( not ( = ?auto_337328 ?auto_337332 ) ) ( not ( = ?auto_337328 ?auto_337333 ) ) ( not ( = ?auto_337328 ?auto_337334 ) ) ( not ( = ?auto_337328 ?auto_337335 ) ) ( not ( = ?auto_337328 ?auto_337336 ) ) ( not ( = ?auto_337328 ?auto_337337 ) ) ( not ( = ?auto_337328 ?auto_337338 ) ) ( not ( = ?auto_337328 ?auto_337339 ) ) ( not ( = ?auto_337328 ?auto_337340 ) ) ( not ( = ?auto_337329 ?auto_337330 ) ) ( not ( = ?auto_337329 ?auto_337331 ) ) ( not ( = ?auto_337329 ?auto_337332 ) ) ( not ( = ?auto_337329 ?auto_337333 ) ) ( not ( = ?auto_337329 ?auto_337334 ) ) ( not ( = ?auto_337329 ?auto_337335 ) ) ( not ( = ?auto_337329 ?auto_337336 ) ) ( not ( = ?auto_337329 ?auto_337337 ) ) ( not ( = ?auto_337329 ?auto_337338 ) ) ( not ( = ?auto_337329 ?auto_337339 ) ) ( not ( = ?auto_337329 ?auto_337340 ) ) ( not ( = ?auto_337330 ?auto_337331 ) ) ( not ( = ?auto_337330 ?auto_337332 ) ) ( not ( = ?auto_337330 ?auto_337333 ) ) ( not ( = ?auto_337330 ?auto_337334 ) ) ( not ( = ?auto_337330 ?auto_337335 ) ) ( not ( = ?auto_337330 ?auto_337336 ) ) ( not ( = ?auto_337330 ?auto_337337 ) ) ( not ( = ?auto_337330 ?auto_337338 ) ) ( not ( = ?auto_337330 ?auto_337339 ) ) ( not ( = ?auto_337330 ?auto_337340 ) ) ( not ( = ?auto_337331 ?auto_337332 ) ) ( not ( = ?auto_337331 ?auto_337333 ) ) ( not ( = ?auto_337331 ?auto_337334 ) ) ( not ( = ?auto_337331 ?auto_337335 ) ) ( not ( = ?auto_337331 ?auto_337336 ) ) ( not ( = ?auto_337331 ?auto_337337 ) ) ( not ( = ?auto_337331 ?auto_337338 ) ) ( not ( = ?auto_337331 ?auto_337339 ) ) ( not ( = ?auto_337331 ?auto_337340 ) ) ( not ( = ?auto_337332 ?auto_337333 ) ) ( not ( = ?auto_337332 ?auto_337334 ) ) ( not ( = ?auto_337332 ?auto_337335 ) ) ( not ( = ?auto_337332 ?auto_337336 ) ) ( not ( = ?auto_337332 ?auto_337337 ) ) ( not ( = ?auto_337332 ?auto_337338 ) ) ( not ( = ?auto_337332 ?auto_337339 ) ) ( not ( = ?auto_337332 ?auto_337340 ) ) ( not ( = ?auto_337333 ?auto_337334 ) ) ( not ( = ?auto_337333 ?auto_337335 ) ) ( not ( = ?auto_337333 ?auto_337336 ) ) ( not ( = ?auto_337333 ?auto_337337 ) ) ( not ( = ?auto_337333 ?auto_337338 ) ) ( not ( = ?auto_337333 ?auto_337339 ) ) ( not ( = ?auto_337333 ?auto_337340 ) ) ( not ( = ?auto_337334 ?auto_337335 ) ) ( not ( = ?auto_337334 ?auto_337336 ) ) ( not ( = ?auto_337334 ?auto_337337 ) ) ( not ( = ?auto_337334 ?auto_337338 ) ) ( not ( = ?auto_337334 ?auto_337339 ) ) ( not ( = ?auto_337334 ?auto_337340 ) ) ( not ( = ?auto_337335 ?auto_337336 ) ) ( not ( = ?auto_337335 ?auto_337337 ) ) ( not ( = ?auto_337335 ?auto_337338 ) ) ( not ( = ?auto_337335 ?auto_337339 ) ) ( not ( = ?auto_337335 ?auto_337340 ) ) ( not ( = ?auto_337336 ?auto_337337 ) ) ( not ( = ?auto_337336 ?auto_337338 ) ) ( not ( = ?auto_337336 ?auto_337339 ) ) ( not ( = ?auto_337336 ?auto_337340 ) ) ( not ( = ?auto_337337 ?auto_337338 ) ) ( not ( = ?auto_337337 ?auto_337339 ) ) ( not ( = ?auto_337337 ?auto_337340 ) ) ( not ( = ?auto_337338 ?auto_337339 ) ) ( not ( = ?auto_337338 ?auto_337340 ) ) ( not ( = ?auto_337339 ?auto_337340 ) ) ( ON ?auto_337338 ?auto_337339 ) ( ON ?auto_337337 ?auto_337338 ) ( ON ?auto_337336 ?auto_337337 ) ( ON ?auto_337335 ?auto_337336 ) ( CLEAR ?auto_337333 ) ( ON ?auto_337334 ?auto_337335 ) ( CLEAR ?auto_337334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_337328 ?auto_337329 ?auto_337330 ?auto_337331 ?auto_337332 ?auto_337333 ?auto_337334 )
      ( MAKE-12PILE ?auto_337328 ?auto_337329 ?auto_337330 ?auto_337331 ?auto_337332 ?auto_337333 ?auto_337334 ?auto_337335 ?auto_337336 ?auto_337337 ?auto_337338 ?auto_337339 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337353 - BLOCK
      ?auto_337354 - BLOCK
      ?auto_337355 - BLOCK
      ?auto_337356 - BLOCK
      ?auto_337357 - BLOCK
      ?auto_337358 - BLOCK
      ?auto_337359 - BLOCK
      ?auto_337360 - BLOCK
      ?auto_337361 - BLOCK
      ?auto_337362 - BLOCK
      ?auto_337363 - BLOCK
      ?auto_337364 - BLOCK
    )
    :vars
    (
      ?auto_337365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337364 ?auto_337365 ) ( ON-TABLE ?auto_337353 ) ( ON ?auto_337354 ?auto_337353 ) ( ON ?auto_337355 ?auto_337354 ) ( ON ?auto_337356 ?auto_337355 ) ( ON ?auto_337357 ?auto_337356 ) ( ON ?auto_337358 ?auto_337357 ) ( not ( = ?auto_337353 ?auto_337354 ) ) ( not ( = ?auto_337353 ?auto_337355 ) ) ( not ( = ?auto_337353 ?auto_337356 ) ) ( not ( = ?auto_337353 ?auto_337357 ) ) ( not ( = ?auto_337353 ?auto_337358 ) ) ( not ( = ?auto_337353 ?auto_337359 ) ) ( not ( = ?auto_337353 ?auto_337360 ) ) ( not ( = ?auto_337353 ?auto_337361 ) ) ( not ( = ?auto_337353 ?auto_337362 ) ) ( not ( = ?auto_337353 ?auto_337363 ) ) ( not ( = ?auto_337353 ?auto_337364 ) ) ( not ( = ?auto_337353 ?auto_337365 ) ) ( not ( = ?auto_337354 ?auto_337355 ) ) ( not ( = ?auto_337354 ?auto_337356 ) ) ( not ( = ?auto_337354 ?auto_337357 ) ) ( not ( = ?auto_337354 ?auto_337358 ) ) ( not ( = ?auto_337354 ?auto_337359 ) ) ( not ( = ?auto_337354 ?auto_337360 ) ) ( not ( = ?auto_337354 ?auto_337361 ) ) ( not ( = ?auto_337354 ?auto_337362 ) ) ( not ( = ?auto_337354 ?auto_337363 ) ) ( not ( = ?auto_337354 ?auto_337364 ) ) ( not ( = ?auto_337354 ?auto_337365 ) ) ( not ( = ?auto_337355 ?auto_337356 ) ) ( not ( = ?auto_337355 ?auto_337357 ) ) ( not ( = ?auto_337355 ?auto_337358 ) ) ( not ( = ?auto_337355 ?auto_337359 ) ) ( not ( = ?auto_337355 ?auto_337360 ) ) ( not ( = ?auto_337355 ?auto_337361 ) ) ( not ( = ?auto_337355 ?auto_337362 ) ) ( not ( = ?auto_337355 ?auto_337363 ) ) ( not ( = ?auto_337355 ?auto_337364 ) ) ( not ( = ?auto_337355 ?auto_337365 ) ) ( not ( = ?auto_337356 ?auto_337357 ) ) ( not ( = ?auto_337356 ?auto_337358 ) ) ( not ( = ?auto_337356 ?auto_337359 ) ) ( not ( = ?auto_337356 ?auto_337360 ) ) ( not ( = ?auto_337356 ?auto_337361 ) ) ( not ( = ?auto_337356 ?auto_337362 ) ) ( not ( = ?auto_337356 ?auto_337363 ) ) ( not ( = ?auto_337356 ?auto_337364 ) ) ( not ( = ?auto_337356 ?auto_337365 ) ) ( not ( = ?auto_337357 ?auto_337358 ) ) ( not ( = ?auto_337357 ?auto_337359 ) ) ( not ( = ?auto_337357 ?auto_337360 ) ) ( not ( = ?auto_337357 ?auto_337361 ) ) ( not ( = ?auto_337357 ?auto_337362 ) ) ( not ( = ?auto_337357 ?auto_337363 ) ) ( not ( = ?auto_337357 ?auto_337364 ) ) ( not ( = ?auto_337357 ?auto_337365 ) ) ( not ( = ?auto_337358 ?auto_337359 ) ) ( not ( = ?auto_337358 ?auto_337360 ) ) ( not ( = ?auto_337358 ?auto_337361 ) ) ( not ( = ?auto_337358 ?auto_337362 ) ) ( not ( = ?auto_337358 ?auto_337363 ) ) ( not ( = ?auto_337358 ?auto_337364 ) ) ( not ( = ?auto_337358 ?auto_337365 ) ) ( not ( = ?auto_337359 ?auto_337360 ) ) ( not ( = ?auto_337359 ?auto_337361 ) ) ( not ( = ?auto_337359 ?auto_337362 ) ) ( not ( = ?auto_337359 ?auto_337363 ) ) ( not ( = ?auto_337359 ?auto_337364 ) ) ( not ( = ?auto_337359 ?auto_337365 ) ) ( not ( = ?auto_337360 ?auto_337361 ) ) ( not ( = ?auto_337360 ?auto_337362 ) ) ( not ( = ?auto_337360 ?auto_337363 ) ) ( not ( = ?auto_337360 ?auto_337364 ) ) ( not ( = ?auto_337360 ?auto_337365 ) ) ( not ( = ?auto_337361 ?auto_337362 ) ) ( not ( = ?auto_337361 ?auto_337363 ) ) ( not ( = ?auto_337361 ?auto_337364 ) ) ( not ( = ?auto_337361 ?auto_337365 ) ) ( not ( = ?auto_337362 ?auto_337363 ) ) ( not ( = ?auto_337362 ?auto_337364 ) ) ( not ( = ?auto_337362 ?auto_337365 ) ) ( not ( = ?auto_337363 ?auto_337364 ) ) ( not ( = ?auto_337363 ?auto_337365 ) ) ( not ( = ?auto_337364 ?auto_337365 ) ) ( ON ?auto_337363 ?auto_337364 ) ( ON ?auto_337362 ?auto_337363 ) ( ON ?auto_337361 ?auto_337362 ) ( ON ?auto_337360 ?auto_337361 ) ( CLEAR ?auto_337358 ) ( ON ?auto_337359 ?auto_337360 ) ( CLEAR ?auto_337359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_337353 ?auto_337354 ?auto_337355 ?auto_337356 ?auto_337357 ?auto_337358 ?auto_337359 )
      ( MAKE-12PILE ?auto_337353 ?auto_337354 ?auto_337355 ?auto_337356 ?auto_337357 ?auto_337358 ?auto_337359 ?auto_337360 ?auto_337361 ?auto_337362 ?auto_337363 ?auto_337364 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337378 - BLOCK
      ?auto_337379 - BLOCK
      ?auto_337380 - BLOCK
      ?auto_337381 - BLOCK
      ?auto_337382 - BLOCK
      ?auto_337383 - BLOCK
      ?auto_337384 - BLOCK
      ?auto_337385 - BLOCK
      ?auto_337386 - BLOCK
      ?auto_337387 - BLOCK
      ?auto_337388 - BLOCK
      ?auto_337389 - BLOCK
    )
    :vars
    (
      ?auto_337390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337389 ?auto_337390 ) ( ON-TABLE ?auto_337378 ) ( ON ?auto_337379 ?auto_337378 ) ( ON ?auto_337380 ?auto_337379 ) ( ON ?auto_337381 ?auto_337380 ) ( ON ?auto_337382 ?auto_337381 ) ( not ( = ?auto_337378 ?auto_337379 ) ) ( not ( = ?auto_337378 ?auto_337380 ) ) ( not ( = ?auto_337378 ?auto_337381 ) ) ( not ( = ?auto_337378 ?auto_337382 ) ) ( not ( = ?auto_337378 ?auto_337383 ) ) ( not ( = ?auto_337378 ?auto_337384 ) ) ( not ( = ?auto_337378 ?auto_337385 ) ) ( not ( = ?auto_337378 ?auto_337386 ) ) ( not ( = ?auto_337378 ?auto_337387 ) ) ( not ( = ?auto_337378 ?auto_337388 ) ) ( not ( = ?auto_337378 ?auto_337389 ) ) ( not ( = ?auto_337378 ?auto_337390 ) ) ( not ( = ?auto_337379 ?auto_337380 ) ) ( not ( = ?auto_337379 ?auto_337381 ) ) ( not ( = ?auto_337379 ?auto_337382 ) ) ( not ( = ?auto_337379 ?auto_337383 ) ) ( not ( = ?auto_337379 ?auto_337384 ) ) ( not ( = ?auto_337379 ?auto_337385 ) ) ( not ( = ?auto_337379 ?auto_337386 ) ) ( not ( = ?auto_337379 ?auto_337387 ) ) ( not ( = ?auto_337379 ?auto_337388 ) ) ( not ( = ?auto_337379 ?auto_337389 ) ) ( not ( = ?auto_337379 ?auto_337390 ) ) ( not ( = ?auto_337380 ?auto_337381 ) ) ( not ( = ?auto_337380 ?auto_337382 ) ) ( not ( = ?auto_337380 ?auto_337383 ) ) ( not ( = ?auto_337380 ?auto_337384 ) ) ( not ( = ?auto_337380 ?auto_337385 ) ) ( not ( = ?auto_337380 ?auto_337386 ) ) ( not ( = ?auto_337380 ?auto_337387 ) ) ( not ( = ?auto_337380 ?auto_337388 ) ) ( not ( = ?auto_337380 ?auto_337389 ) ) ( not ( = ?auto_337380 ?auto_337390 ) ) ( not ( = ?auto_337381 ?auto_337382 ) ) ( not ( = ?auto_337381 ?auto_337383 ) ) ( not ( = ?auto_337381 ?auto_337384 ) ) ( not ( = ?auto_337381 ?auto_337385 ) ) ( not ( = ?auto_337381 ?auto_337386 ) ) ( not ( = ?auto_337381 ?auto_337387 ) ) ( not ( = ?auto_337381 ?auto_337388 ) ) ( not ( = ?auto_337381 ?auto_337389 ) ) ( not ( = ?auto_337381 ?auto_337390 ) ) ( not ( = ?auto_337382 ?auto_337383 ) ) ( not ( = ?auto_337382 ?auto_337384 ) ) ( not ( = ?auto_337382 ?auto_337385 ) ) ( not ( = ?auto_337382 ?auto_337386 ) ) ( not ( = ?auto_337382 ?auto_337387 ) ) ( not ( = ?auto_337382 ?auto_337388 ) ) ( not ( = ?auto_337382 ?auto_337389 ) ) ( not ( = ?auto_337382 ?auto_337390 ) ) ( not ( = ?auto_337383 ?auto_337384 ) ) ( not ( = ?auto_337383 ?auto_337385 ) ) ( not ( = ?auto_337383 ?auto_337386 ) ) ( not ( = ?auto_337383 ?auto_337387 ) ) ( not ( = ?auto_337383 ?auto_337388 ) ) ( not ( = ?auto_337383 ?auto_337389 ) ) ( not ( = ?auto_337383 ?auto_337390 ) ) ( not ( = ?auto_337384 ?auto_337385 ) ) ( not ( = ?auto_337384 ?auto_337386 ) ) ( not ( = ?auto_337384 ?auto_337387 ) ) ( not ( = ?auto_337384 ?auto_337388 ) ) ( not ( = ?auto_337384 ?auto_337389 ) ) ( not ( = ?auto_337384 ?auto_337390 ) ) ( not ( = ?auto_337385 ?auto_337386 ) ) ( not ( = ?auto_337385 ?auto_337387 ) ) ( not ( = ?auto_337385 ?auto_337388 ) ) ( not ( = ?auto_337385 ?auto_337389 ) ) ( not ( = ?auto_337385 ?auto_337390 ) ) ( not ( = ?auto_337386 ?auto_337387 ) ) ( not ( = ?auto_337386 ?auto_337388 ) ) ( not ( = ?auto_337386 ?auto_337389 ) ) ( not ( = ?auto_337386 ?auto_337390 ) ) ( not ( = ?auto_337387 ?auto_337388 ) ) ( not ( = ?auto_337387 ?auto_337389 ) ) ( not ( = ?auto_337387 ?auto_337390 ) ) ( not ( = ?auto_337388 ?auto_337389 ) ) ( not ( = ?auto_337388 ?auto_337390 ) ) ( not ( = ?auto_337389 ?auto_337390 ) ) ( ON ?auto_337388 ?auto_337389 ) ( ON ?auto_337387 ?auto_337388 ) ( ON ?auto_337386 ?auto_337387 ) ( ON ?auto_337385 ?auto_337386 ) ( ON ?auto_337384 ?auto_337385 ) ( CLEAR ?auto_337382 ) ( ON ?auto_337383 ?auto_337384 ) ( CLEAR ?auto_337383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_337378 ?auto_337379 ?auto_337380 ?auto_337381 ?auto_337382 ?auto_337383 )
      ( MAKE-12PILE ?auto_337378 ?auto_337379 ?auto_337380 ?auto_337381 ?auto_337382 ?auto_337383 ?auto_337384 ?auto_337385 ?auto_337386 ?auto_337387 ?auto_337388 ?auto_337389 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337403 - BLOCK
      ?auto_337404 - BLOCK
      ?auto_337405 - BLOCK
      ?auto_337406 - BLOCK
      ?auto_337407 - BLOCK
      ?auto_337408 - BLOCK
      ?auto_337409 - BLOCK
      ?auto_337410 - BLOCK
      ?auto_337411 - BLOCK
      ?auto_337412 - BLOCK
      ?auto_337413 - BLOCK
      ?auto_337414 - BLOCK
    )
    :vars
    (
      ?auto_337415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337414 ?auto_337415 ) ( ON-TABLE ?auto_337403 ) ( ON ?auto_337404 ?auto_337403 ) ( ON ?auto_337405 ?auto_337404 ) ( ON ?auto_337406 ?auto_337405 ) ( ON ?auto_337407 ?auto_337406 ) ( not ( = ?auto_337403 ?auto_337404 ) ) ( not ( = ?auto_337403 ?auto_337405 ) ) ( not ( = ?auto_337403 ?auto_337406 ) ) ( not ( = ?auto_337403 ?auto_337407 ) ) ( not ( = ?auto_337403 ?auto_337408 ) ) ( not ( = ?auto_337403 ?auto_337409 ) ) ( not ( = ?auto_337403 ?auto_337410 ) ) ( not ( = ?auto_337403 ?auto_337411 ) ) ( not ( = ?auto_337403 ?auto_337412 ) ) ( not ( = ?auto_337403 ?auto_337413 ) ) ( not ( = ?auto_337403 ?auto_337414 ) ) ( not ( = ?auto_337403 ?auto_337415 ) ) ( not ( = ?auto_337404 ?auto_337405 ) ) ( not ( = ?auto_337404 ?auto_337406 ) ) ( not ( = ?auto_337404 ?auto_337407 ) ) ( not ( = ?auto_337404 ?auto_337408 ) ) ( not ( = ?auto_337404 ?auto_337409 ) ) ( not ( = ?auto_337404 ?auto_337410 ) ) ( not ( = ?auto_337404 ?auto_337411 ) ) ( not ( = ?auto_337404 ?auto_337412 ) ) ( not ( = ?auto_337404 ?auto_337413 ) ) ( not ( = ?auto_337404 ?auto_337414 ) ) ( not ( = ?auto_337404 ?auto_337415 ) ) ( not ( = ?auto_337405 ?auto_337406 ) ) ( not ( = ?auto_337405 ?auto_337407 ) ) ( not ( = ?auto_337405 ?auto_337408 ) ) ( not ( = ?auto_337405 ?auto_337409 ) ) ( not ( = ?auto_337405 ?auto_337410 ) ) ( not ( = ?auto_337405 ?auto_337411 ) ) ( not ( = ?auto_337405 ?auto_337412 ) ) ( not ( = ?auto_337405 ?auto_337413 ) ) ( not ( = ?auto_337405 ?auto_337414 ) ) ( not ( = ?auto_337405 ?auto_337415 ) ) ( not ( = ?auto_337406 ?auto_337407 ) ) ( not ( = ?auto_337406 ?auto_337408 ) ) ( not ( = ?auto_337406 ?auto_337409 ) ) ( not ( = ?auto_337406 ?auto_337410 ) ) ( not ( = ?auto_337406 ?auto_337411 ) ) ( not ( = ?auto_337406 ?auto_337412 ) ) ( not ( = ?auto_337406 ?auto_337413 ) ) ( not ( = ?auto_337406 ?auto_337414 ) ) ( not ( = ?auto_337406 ?auto_337415 ) ) ( not ( = ?auto_337407 ?auto_337408 ) ) ( not ( = ?auto_337407 ?auto_337409 ) ) ( not ( = ?auto_337407 ?auto_337410 ) ) ( not ( = ?auto_337407 ?auto_337411 ) ) ( not ( = ?auto_337407 ?auto_337412 ) ) ( not ( = ?auto_337407 ?auto_337413 ) ) ( not ( = ?auto_337407 ?auto_337414 ) ) ( not ( = ?auto_337407 ?auto_337415 ) ) ( not ( = ?auto_337408 ?auto_337409 ) ) ( not ( = ?auto_337408 ?auto_337410 ) ) ( not ( = ?auto_337408 ?auto_337411 ) ) ( not ( = ?auto_337408 ?auto_337412 ) ) ( not ( = ?auto_337408 ?auto_337413 ) ) ( not ( = ?auto_337408 ?auto_337414 ) ) ( not ( = ?auto_337408 ?auto_337415 ) ) ( not ( = ?auto_337409 ?auto_337410 ) ) ( not ( = ?auto_337409 ?auto_337411 ) ) ( not ( = ?auto_337409 ?auto_337412 ) ) ( not ( = ?auto_337409 ?auto_337413 ) ) ( not ( = ?auto_337409 ?auto_337414 ) ) ( not ( = ?auto_337409 ?auto_337415 ) ) ( not ( = ?auto_337410 ?auto_337411 ) ) ( not ( = ?auto_337410 ?auto_337412 ) ) ( not ( = ?auto_337410 ?auto_337413 ) ) ( not ( = ?auto_337410 ?auto_337414 ) ) ( not ( = ?auto_337410 ?auto_337415 ) ) ( not ( = ?auto_337411 ?auto_337412 ) ) ( not ( = ?auto_337411 ?auto_337413 ) ) ( not ( = ?auto_337411 ?auto_337414 ) ) ( not ( = ?auto_337411 ?auto_337415 ) ) ( not ( = ?auto_337412 ?auto_337413 ) ) ( not ( = ?auto_337412 ?auto_337414 ) ) ( not ( = ?auto_337412 ?auto_337415 ) ) ( not ( = ?auto_337413 ?auto_337414 ) ) ( not ( = ?auto_337413 ?auto_337415 ) ) ( not ( = ?auto_337414 ?auto_337415 ) ) ( ON ?auto_337413 ?auto_337414 ) ( ON ?auto_337412 ?auto_337413 ) ( ON ?auto_337411 ?auto_337412 ) ( ON ?auto_337410 ?auto_337411 ) ( ON ?auto_337409 ?auto_337410 ) ( CLEAR ?auto_337407 ) ( ON ?auto_337408 ?auto_337409 ) ( CLEAR ?auto_337408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_337403 ?auto_337404 ?auto_337405 ?auto_337406 ?auto_337407 ?auto_337408 )
      ( MAKE-12PILE ?auto_337403 ?auto_337404 ?auto_337405 ?auto_337406 ?auto_337407 ?auto_337408 ?auto_337409 ?auto_337410 ?auto_337411 ?auto_337412 ?auto_337413 ?auto_337414 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337428 - BLOCK
      ?auto_337429 - BLOCK
      ?auto_337430 - BLOCK
      ?auto_337431 - BLOCK
      ?auto_337432 - BLOCK
      ?auto_337433 - BLOCK
      ?auto_337434 - BLOCK
      ?auto_337435 - BLOCK
      ?auto_337436 - BLOCK
      ?auto_337437 - BLOCK
      ?auto_337438 - BLOCK
      ?auto_337439 - BLOCK
    )
    :vars
    (
      ?auto_337440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337439 ?auto_337440 ) ( ON-TABLE ?auto_337428 ) ( ON ?auto_337429 ?auto_337428 ) ( ON ?auto_337430 ?auto_337429 ) ( ON ?auto_337431 ?auto_337430 ) ( not ( = ?auto_337428 ?auto_337429 ) ) ( not ( = ?auto_337428 ?auto_337430 ) ) ( not ( = ?auto_337428 ?auto_337431 ) ) ( not ( = ?auto_337428 ?auto_337432 ) ) ( not ( = ?auto_337428 ?auto_337433 ) ) ( not ( = ?auto_337428 ?auto_337434 ) ) ( not ( = ?auto_337428 ?auto_337435 ) ) ( not ( = ?auto_337428 ?auto_337436 ) ) ( not ( = ?auto_337428 ?auto_337437 ) ) ( not ( = ?auto_337428 ?auto_337438 ) ) ( not ( = ?auto_337428 ?auto_337439 ) ) ( not ( = ?auto_337428 ?auto_337440 ) ) ( not ( = ?auto_337429 ?auto_337430 ) ) ( not ( = ?auto_337429 ?auto_337431 ) ) ( not ( = ?auto_337429 ?auto_337432 ) ) ( not ( = ?auto_337429 ?auto_337433 ) ) ( not ( = ?auto_337429 ?auto_337434 ) ) ( not ( = ?auto_337429 ?auto_337435 ) ) ( not ( = ?auto_337429 ?auto_337436 ) ) ( not ( = ?auto_337429 ?auto_337437 ) ) ( not ( = ?auto_337429 ?auto_337438 ) ) ( not ( = ?auto_337429 ?auto_337439 ) ) ( not ( = ?auto_337429 ?auto_337440 ) ) ( not ( = ?auto_337430 ?auto_337431 ) ) ( not ( = ?auto_337430 ?auto_337432 ) ) ( not ( = ?auto_337430 ?auto_337433 ) ) ( not ( = ?auto_337430 ?auto_337434 ) ) ( not ( = ?auto_337430 ?auto_337435 ) ) ( not ( = ?auto_337430 ?auto_337436 ) ) ( not ( = ?auto_337430 ?auto_337437 ) ) ( not ( = ?auto_337430 ?auto_337438 ) ) ( not ( = ?auto_337430 ?auto_337439 ) ) ( not ( = ?auto_337430 ?auto_337440 ) ) ( not ( = ?auto_337431 ?auto_337432 ) ) ( not ( = ?auto_337431 ?auto_337433 ) ) ( not ( = ?auto_337431 ?auto_337434 ) ) ( not ( = ?auto_337431 ?auto_337435 ) ) ( not ( = ?auto_337431 ?auto_337436 ) ) ( not ( = ?auto_337431 ?auto_337437 ) ) ( not ( = ?auto_337431 ?auto_337438 ) ) ( not ( = ?auto_337431 ?auto_337439 ) ) ( not ( = ?auto_337431 ?auto_337440 ) ) ( not ( = ?auto_337432 ?auto_337433 ) ) ( not ( = ?auto_337432 ?auto_337434 ) ) ( not ( = ?auto_337432 ?auto_337435 ) ) ( not ( = ?auto_337432 ?auto_337436 ) ) ( not ( = ?auto_337432 ?auto_337437 ) ) ( not ( = ?auto_337432 ?auto_337438 ) ) ( not ( = ?auto_337432 ?auto_337439 ) ) ( not ( = ?auto_337432 ?auto_337440 ) ) ( not ( = ?auto_337433 ?auto_337434 ) ) ( not ( = ?auto_337433 ?auto_337435 ) ) ( not ( = ?auto_337433 ?auto_337436 ) ) ( not ( = ?auto_337433 ?auto_337437 ) ) ( not ( = ?auto_337433 ?auto_337438 ) ) ( not ( = ?auto_337433 ?auto_337439 ) ) ( not ( = ?auto_337433 ?auto_337440 ) ) ( not ( = ?auto_337434 ?auto_337435 ) ) ( not ( = ?auto_337434 ?auto_337436 ) ) ( not ( = ?auto_337434 ?auto_337437 ) ) ( not ( = ?auto_337434 ?auto_337438 ) ) ( not ( = ?auto_337434 ?auto_337439 ) ) ( not ( = ?auto_337434 ?auto_337440 ) ) ( not ( = ?auto_337435 ?auto_337436 ) ) ( not ( = ?auto_337435 ?auto_337437 ) ) ( not ( = ?auto_337435 ?auto_337438 ) ) ( not ( = ?auto_337435 ?auto_337439 ) ) ( not ( = ?auto_337435 ?auto_337440 ) ) ( not ( = ?auto_337436 ?auto_337437 ) ) ( not ( = ?auto_337436 ?auto_337438 ) ) ( not ( = ?auto_337436 ?auto_337439 ) ) ( not ( = ?auto_337436 ?auto_337440 ) ) ( not ( = ?auto_337437 ?auto_337438 ) ) ( not ( = ?auto_337437 ?auto_337439 ) ) ( not ( = ?auto_337437 ?auto_337440 ) ) ( not ( = ?auto_337438 ?auto_337439 ) ) ( not ( = ?auto_337438 ?auto_337440 ) ) ( not ( = ?auto_337439 ?auto_337440 ) ) ( ON ?auto_337438 ?auto_337439 ) ( ON ?auto_337437 ?auto_337438 ) ( ON ?auto_337436 ?auto_337437 ) ( ON ?auto_337435 ?auto_337436 ) ( ON ?auto_337434 ?auto_337435 ) ( ON ?auto_337433 ?auto_337434 ) ( CLEAR ?auto_337431 ) ( ON ?auto_337432 ?auto_337433 ) ( CLEAR ?auto_337432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_337428 ?auto_337429 ?auto_337430 ?auto_337431 ?auto_337432 )
      ( MAKE-12PILE ?auto_337428 ?auto_337429 ?auto_337430 ?auto_337431 ?auto_337432 ?auto_337433 ?auto_337434 ?auto_337435 ?auto_337436 ?auto_337437 ?auto_337438 ?auto_337439 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337453 - BLOCK
      ?auto_337454 - BLOCK
      ?auto_337455 - BLOCK
      ?auto_337456 - BLOCK
      ?auto_337457 - BLOCK
      ?auto_337458 - BLOCK
      ?auto_337459 - BLOCK
      ?auto_337460 - BLOCK
      ?auto_337461 - BLOCK
      ?auto_337462 - BLOCK
      ?auto_337463 - BLOCK
      ?auto_337464 - BLOCK
    )
    :vars
    (
      ?auto_337465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337464 ?auto_337465 ) ( ON-TABLE ?auto_337453 ) ( ON ?auto_337454 ?auto_337453 ) ( ON ?auto_337455 ?auto_337454 ) ( ON ?auto_337456 ?auto_337455 ) ( not ( = ?auto_337453 ?auto_337454 ) ) ( not ( = ?auto_337453 ?auto_337455 ) ) ( not ( = ?auto_337453 ?auto_337456 ) ) ( not ( = ?auto_337453 ?auto_337457 ) ) ( not ( = ?auto_337453 ?auto_337458 ) ) ( not ( = ?auto_337453 ?auto_337459 ) ) ( not ( = ?auto_337453 ?auto_337460 ) ) ( not ( = ?auto_337453 ?auto_337461 ) ) ( not ( = ?auto_337453 ?auto_337462 ) ) ( not ( = ?auto_337453 ?auto_337463 ) ) ( not ( = ?auto_337453 ?auto_337464 ) ) ( not ( = ?auto_337453 ?auto_337465 ) ) ( not ( = ?auto_337454 ?auto_337455 ) ) ( not ( = ?auto_337454 ?auto_337456 ) ) ( not ( = ?auto_337454 ?auto_337457 ) ) ( not ( = ?auto_337454 ?auto_337458 ) ) ( not ( = ?auto_337454 ?auto_337459 ) ) ( not ( = ?auto_337454 ?auto_337460 ) ) ( not ( = ?auto_337454 ?auto_337461 ) ) ( not ( = ?auto_337454 ?auto_337462 ) ) ( not ( = ?auto_337454 ?auto_337463 ) ) ( not ( = ?auto_337454 ?auto_337464 ) ) ( not ( = ?auto_337454 ?auto_337465 ) ) ( not ( = ?auto_337455 ?auto_337456 ) ) ( not ( = ?auto_337455 ?auto_337457 ) ) ( not ( = ?auto_337455 ?auto_337458 ) ) ( not ( = ?auto_337455 ?auto_337459 ) ) ( not ( = ?auto_337455 ?auto_337460 ) ) ( not ( = ?auto_337455 ?auto_337461 ) ) ( not ( = ?auto_337455 ?auto_337462 ) ) ( not ( = ?auto_337455 ?auto_337463 ) ) ( not ( = ?auto_337455 ?auto_337464 ) ) ( not ( = ?auto_337455 ?auto_337465 ) ) ( not ( = ?auto_337456 ?auto_337457 ) ) ( not ( = ?auto_337456 ?auto_337458 ) ) ( not ( = ?auto_337456 ?auto_337459 ) ) ( not ( = ?auto_337456 ?auto_337460 ) ) ( not ( = ?auto_337456 ?auto_337461 ) ) ( not ( = ?auto_337456 ?auto_337462 ) ) ( not ( = ?auto_337456 ?auto_337463 ) ) ( not ( = ?auto_337456 ?auto_337464 ) ) ( not ( = ?auto_337456 ?auto_337465 ) ) ( not ( = ?auto_337457 ?auto_337458 ) ) ( not ( = ?auto_337457 ?auto_337459 ) ) ( not ( = ?auto_337457 ?auto_337460 ) ) ( not ( = ?auto_337457 ?auto_337461 ) ) ( not ( = ?auto_337457 ?auto_337462 ) ) ( not ( = ?auto_337457 ?auto_337463 ) ) ( not ( = ?auto_337457 ?auto_337464 ) ) ( not ( = ?auto_337457 ?auto_337465 ) ) ( not ( = ?auto_337458 ?auto_337459 ) ) ( not ( = ?auto_337458 ?auto_337460 ) ) ( not ( = ?auto_337458 ?auto_337461 ) ) ( not ( = ?auto_337458 ?auto_337462 ) ) ( not ( = ?auto_337458 ?auto_337463 ) ) ( not ( = ?auto_337458 ?auto_337464 ) ) ( not ( = ?auto_337458 ?auto_337465 ) ) ( not ( = ?auto_337459 ?auto_337460 ) ) ( not ( = ?auto_337459 ?auto_337461 ) ) ( not ( = ?auto_337459 ?auto_337462 ) ) ( not ( = ?auto_337459 ?auto_337463 ) ) ( not ( = ?auto_337459 ?auto_337464 ) ) ( not ( = ?auto_337459 ?auto_337465 ) ) ( not ( = ?auto_337460 ?auto_337461 ) ) ( not ( = ?auto_337460 ?auto_337462 ) ) ( not ( = ?auto_337460 ?auto_337463 ) ) ( not ( = ?auto_337460 ?auto_337464 ) ) ( not ( = ?auto_337460 ?auto_337465 ) ) ( not ( = ?auto_337461 ?auto_337462 ) ) ( not ( = ?auto_337461 ?auto_337463 ) ) ( not ( = ?auto_337461 ?auto_337464 ) ) ( not ( = ?auto_337461 ?auto_337465 ) ) ( not ( = ?auto_337462 ?auto_337463 ) ) ( not ( = ?auto_337462 ?auto_337464 ) ) ( not ( = ?auto_337462 ?auto_337465 ) ) ( not ( = ?auto_337463 ?auto_337464 ) ) ( not ( = ?auto_337463 ?auto_337465 ) ) ( not ( = ?auto_337464 ?auto_337465 ) ) ( ON ?auto_337463 ?auto_337464 ) ( ON ?auto_337462 ?auto_337463 ) ( ON ?auto_337461 ?auto_337462 ) ( ON ?auto_337460 ?auto_337461 ) ( ON ?auto_337459 ?auto_337460 ) ( ON ?auto_337458 ?auto_337459 ) ( CLEAR ?auto_337456 ) ( ON ?auto_337457 ?auto_337458 ) ( CLEAR ?auto_337457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_337453 ?auto_337454 ?auto_337455 ?auto_337456 ?auto_337457 )
      ( MAKE-12PILE ?auto_337453 ?auto_337454 ?auto_337455 ?auto_337456 ?auto_337457 ?auto_337458 ?auto_337459 ?auto_337460 ?auto_337461 ?auto_337462 ?auto_337463 ?auto_337464 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337478 - BLOCK
      ?auto_337479 - BLOCK
      ?auto_337480 - BLOCK
      ?auto_337481 - BLOCK
      ?auto_337482 - BLOCK
      ?auto_337483 - BLOCK
      ?auto_337484 - BLOCK
      ?auto_337485 - BLOCK
      ?auto_337486 - BLOCK
      ?auto_337487 - BLOCK
      ?auto_337488 - BLOCK
      ?auto_337489 - BLOCK
    )
    :vars
    (
      ?auto_337490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337489 ?auto_337490 ) ( ON-TABLE ?auto_337478 ) ( ON ?auto_337479 ?auto_337478 ) ( ON ?auto_337480 ?auto_337479 ) ( not ( = ?auto_337478 ?auto_337479 ) ) ( not ( = ?auto_337478 ?auto_337480 ) ) ( not ( = ?auto_337478 ?auto_337481 ) ) ( not ( = ?auto_337478 ?auto_337482 ) ) ( not ( = ?auto_337478 ?auto_337483 ) ) ( not ( = ?auto_337478 ?auto_337484 ) ) ( not ( = ?auto_337478 ?auto_337485 ) ) ( not ( = ?auto_337478 ?auto_337486 ) ) ( not ( = ?auto_337478 ?auto_337487 ) ) ( not ( = ?auto_337478 ?auto_337488 ) ) ( not ( = ?auto_337478 ?auto_337489 ) ) ( not ( = ?auto_337478 ?auto_337490 ) ) ( not ( = ?auto_337479 ?auto_337480 ) ) ( not ( = ?auto_337479 ?auto_337481 ) ) ( not ( = ?auto_337479 ?auto_337482 ) ) ( not ( = ?auto_337479 ?auto_337483 ) ) ( not ( = ?auto_337479 ?auto_337484 ) ) ( not ( = ?auto_337479 ?auto_337485 ) ) ( not ( = ?auto_337479 ?auto_337486 ) ) ( not ( = ?auto_337479 ?auto_337487 ) ) ( not ( = ?auto_337479 ?auto_337488 ) ) ( not ( = ?auto_337479 ?auto_337489 ) ) ( not ( = ?auto_337479 ?auto_337490 ) ) ( not ( = ?auto_337480 ?auto_337481 ) ) ( not ( = ?auto_337480 ?auto_337482 ) ) ( not ( = ?auto_337480 ?auto_337483 ) ) ( not ( = ?auto_337480 ?auto_337484 ) ) ( not ( = ?auto_337480 ?auto_337485 ) ) ( not ( = ?auto_337480 ?auto_337486 ) ) ( not ( = ?auto_337480 ?auto_337487 ) ) ( not ( = ?auto_337480 ?auto_337488 ) ) ( not ( = ?auto_337480 ?auto_337489 ) ) ( not ( = ?auto_337480 ?auto_337490 ) ) ( not ( = ?auto_337481 ?auto_337482 ) ) ( not ( = ?auto_337481 ?auto_337483 ) ) ( not ( = ?auto_337481 ?auto_337484 ) ) ( not ( = ?auto_337481 ?auto_337485 ) ) ( not ( = ?auto_337481 ?auto_337486 ) ) ( not ( = ?auto_337481 ?auto_337487 ) ) ( not ( = ?auto_337481 ?auto_337488 ) ) ( not ( = ?auto_337481 ?auto_337489 ) ) ( not ( = ?auto_337481 ?auto_337490 ) ) ( not ( = ?auto_337482 ?auto_337483 ) ) ( not ( = ?auto_337482 ?auto_337484 ) ) ( not ( = ?auto_337482 ?auto_337485 ) ) ( not ( = ?auto_337482 ?auto_337486 ) ) ( not ( = ?auto_337482 ?auto_337487 ) ) ( not ( = ?auto_337482 ?auto_337488 ) ) ( not ( = ?auto_337482 ?auto_337489 ) ) ( not ( = ?auto_337482 ?auto_337490 ) ) ( not ( = ?auto_337483 ?auto_337484 ) ) ( not ( = ?auto_337483 ?auto_337485 ) ) ( not ( = ?auto_337483 ?auto_337486 ) ) ( not ( = ?auto_337483 ?auto_337487 ) ) ( not ( = ?auto_337483 ?auto_337488 ) ) ( not ( = ?auto_337483 ?auto_337489 ) ) ( not ( = ?auto_337483 ?auto_337490 ) ) ( not ( = ?auto_337484 ?auto_337485 ) ) ( not ( = ?auto_337484 ?auto_337486 ) ) ( not ( = ?auto_337484 ?auto_337487 ) ) ( not ( = ?auto_337484 ?auto_337488 ) ) ( not ( = ?auto_337484 ?auto_337489 ) ) ( not ( = ?auto_337484 ?auto_337490 ) ) ( not ( = ?auto_337485 ?auto_337486 ) ) ( not ( = ?auto_337485 ?auto_337487 ) ) ( not ( = ?auto_337485 ?auto_337488 ) ) ( not ( = ?auto_337485 ?auto_337489 ) ) ( not ( = ?auto_337485 ?auto_337490 ) ) ( not ( = ?auto_337486 ?auto_337487 ) ) ( not ( = ?auto_337486 ?auto_337488 ) ) ( not ( = ?auto_337486 ?auto_337489 ) ) ( not ( = ?auto_337486 ?auto_337490 ) ) ( not ( = ?auto_337487 ?auto_337488 ) ) ( not ( = ?auto_337487 ?auto_337489 ) ) ( not ( = ?auto_337487 ?auto_337490 ) ) ( not ( = ?auto_337488 ?auto_337489 ) ) ( not ( = ?auto_337488 ?auto_337490 ) ) ( not ( = ?auto_337489 ?auto_337490 ) ) ( ON ?auto_337488 ?auto_337489 ) ( ON ?auto_337487 ?auto_337488 ) ( ON ?auto_337486 ?auto_337487 ) ( ON ?auto_337485 ?auto_337486 ) ( ON ?auto_337484 ?auto_337485 ) ( ON ?auto_337483 ?auto_337484 ) ( ON ?auto_337482 ?auto_337483 ) ( CLEAR ?auto_337480 ) ( ON ?auto_337481 ?auto_337482 ) ( CLEAR ?auto_337481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_337478 ?auto_337479 ?auto_337480 ?auto_337481 )
      ( MAKE-12PILE ?auto_337478 ?auto_337479 ?auto_337480 ?auto_337481 ?auto_337482 ?auto_337483 ?auto_337484 ?auto_337485 ?auto_337486 ?auto_337487 ?auto_337488 ?auto_337489 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337503 - BLOCK
      ?auto_337504 - BLOCK
      ?auto_337505 - BLOCK
      ?auto_337506 - BLOCK
      ?auto_337507 - BLOCK
      ?auto_337508 - BLOCK
      ?auto_337509 - BLOCK
      ?auto_337510 - BLOCK
      ?auto_337511 - BLOCK
      ?auto_337512 - BLOCK
      ?auto_337513 - BLOCK
      ?auto_337514 - BLOCK
    )
    :vars
    (
      ?auto_337515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337514 ?auto_337515 ) ( ON-TABLE ?auto_337503 ) ( ON ?auto_337504 ?auto_337503 ) ( ON ?auto_337505 ?auto_337504 ) ( not ( = ?auto_337503 ?auto_337504 ) ) ( not ( = ?auto_337503 ?auto_337505 ) ) ( not ( = ?auto_337503 ?auto_337506 ) ) ( not ( = ?auto_337503 ?auto_337507 ) ) ( not ( = ?auto_337503 ?auto_337508 ) ) ( not ( = ?auto_337503 ?auto_337509 ) ) ( not ( = ?auto_337503 ?auto_337510 ) ) ( not ( = ?auto_337503 ?auto_337511 ) ) ( not ( = ?auto_337503 ?auto_337512 ) ) ( not ( = ?auto_337503 ?auto_337513 ) ) ( not ( = ?auto_337503 ?auto_337514 ) ) ( not ( = ?auto_337503 ?auto_337515 ) ) ( not ( = ?auto_337504 ?auto_337505 ) ) ( not ( = ?auto_337504 ?auto_337506 ) ) ( not ( = ?auto_337504 ?auto_337507 ) ) ( not ( = ?auto_337504 ?auto_337508 ) ) ( not ( = ?auto_337504 ?auto_337509 ) ) ( not ( = ?auto_337504 ?auto_337510 ) ) ( not ( = ?auto_337504 ?auto_337511 ) ) ( not ( = ?auto_337504 ?auto_337512 ) ) ( not ( = ?auto_337504 ?auto_337513 ) ) ( not ( = ?auto_337504 ?auto_337514 ) ) ( not ( = ?auto_337504 ?auto_337515 ) ) ( not ( = ?auto_337505 ?auto_337506 ) ) ( not ( = ?auto_337505 ?auto_337507 ) ) ( not ( = ?auto_337505 ?auto_337508 ) ) ( not ( = ?auto_337505 ?auto_337509 ) ) ( not ( = ?auto_337505 ?auto_337510 ) ) ( not ( = ?auto_337505 ?auto_337511 ) ) ( not ( = ?auto_337505 ?auto_337512 ) ) ( not ( = ?auto_337505 ?auto_337513 ) ) ( not ( = ?auto_337505 ?auto_337514 ) ) ( not ( = ?auto_337505 ?auto_337515 ) ) ( not ( = ?auto_337506 ?auto_337507 ) ) ( not ( = ?auto_337506 ?auto_337508 ) ) ( not ( = ?auto_337506 ?auto_337509 ) ) ( not ( = ?auto_337506 ?auto_337510 ) ) ( not ( = ?auto_337506 ?auto_337511 ) ) ( not ( = ?auto_337506 ?auto_337512 ) ) ( not ( = ?auto_337506 ?auto_337513 ) ) ( not ( = ?auto_337506 ?auto_337514 ) ) ( not ( = ?auto_337506 ?auto_337515 ) ) ( not ( = ?auto_337507 ?auto_337508 ) ) ( not ( = ?auto_337507 ?auto_337509 ) ) ( not ( = ?auto_337507 ?auto_337510 ) ) ( not ( = ?auto_337507 ?auto_337511 ) ) ( not ( = ?auto_337507 ?auto_337512 ) ) ( not ( = ?auto_337507 ?auto_337513 ) ) ( not ( = ?auto_337507 ?auto_337514 ) ) ( not ( = ?auto_337507 ?auto_337515 ) ) ( not ( = ?auto_337508 ?auto_337509 ) ) ( not ( = ?auto_337508 ?auto_337510 ) ) ( not ( = ?auto_337508 ?auto_337511 ) ) ( not ( = ?auto_337508 ?auto_337512 ) ) ( not ( = ?auto_337508 ?auto_337513 ) ) ( not ( = ?auto_337508 ?auto_337514 ) ) ( not ( = ?auto_337508 ?auto_337515 ) ) ( not ( = ?auto_337509 ?auto_337510 ) ) ( not ( = ?auto_337509 ?auto_337511 ) ) ( not ( = ?auto_337509 ?auto_337512 ) ) ( not ( = ?auto_337509 ?auto_337513 ) ) ( not ( = ?auto_337509 ?auto_337514 ) ) ( not ( = ?auto_337509 ?auto_337515 ) ) ( not ( = ?auto_337510 ?auto_337511 ) ) ( not ( = ?auto_337510 ?auto_337512 ) ) ( not ( = ?auto_337510 ?auto_337513 ) ) ( not ( = ?auto_337510 ?auto_337514 ) ) ( not ( = ?auto_337510 ?auto_337515 ) ) ( not ( = ?auto_337511 ?auto_337512 ) ) ( not ( = ?auto_337511 ?auto_337513 ) ) ( not ( = ?auto_337511 ?auto_337514 ) ) ( not ( = ?auto_337511 ?auto_337515 ) ) ( not ( = ?auto_337512 ?auto_337513 ) ) ( not ( = ?auto_337512 ?auto_337514 ) ) ( not ( = ?auto_337512 ?auto_337515 ) ) ( not ( = ?auto_337513 ?auto_337514 ) ) ( not ( = ?auto_337513 ?auto_337515 ) ) ( not ( = ?auto_337514 ?auto_337515 ) ) ( ON ?auto_337513 ?auto_337514 ) ( ON ?auto_337512 ?auto_337513 ) ( ON ?auto_337511 ?auto_337512 ) ( ON ?auto_337510 ?auto_337511 ) ( ON ?auto_337509 ?auto_337510 ) ( ON ?auto_337508 ?auto_337509 ) ( ON ?auto_337507 ?auto_337508 ) ( CLEAR ?auto_337505 ) ( ON ?auto_337506 ?auto_337507 ) ( CLEAR ?auto_337506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_337503 ?auto_337504 ?auto_337505 ?auto_337506 )
      ( MAKE-12PILE ?auto_337503 ?auto_337504 ?auto_337505 ?auto_337506 ?auto_337507 ?auto_337508 ?auto_337509 ?auto_337510 ?auto_337511 ?auto_337512 ?auto_337513 ?auto_337514 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337528 - BLOCK
      ?auto_337529 - BLOCK
      ?auto_337530 - BLOCK
      ?auto_337531 - BLOCK
      ?auto_337532 - BLOCK
      ?auto_337533 - BLOCK
      ?auto_337534 - BLOCK
      ?auto_337535 - BLOCK
      ?auto_337536 - BLOCK
      ?auto_337537 - BLOCK
      ?auto_337538 - BLOCK
      ?auto_337539 - BLOCK
    )
    :vars
    (
      ?auto_337540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337539 ?auto_337540 ) ( ON-TABLE ?auto_337528 ) ( ON ?auto_337529 ?auto_337528 ) ( not ( = ?auto_337528 ?auto_337529 ) ) ( not ( = ?auto_337528 ?auto_337530 ) ) ( not ( = ?auto_337528 ?auto_337531 ) ) ( not ( = ?auto_337528 ?auto_337532 ) ) ( not ( = ?auto_337528 ?auto_337533 ) ) ( not ( = ?auto_337528 ?auto_337534 ) ) ( not ( = ?auto_337528 ?auto_337535 ) ) ( not ( = ?auto_337528 ?auto_337536 ) ) ( not ( = ?auto_337528 ?auto_337537 ) ) ( not ( = ?auto_337528 ?auto_337538 ) ) ( not ( = ?auto_337528 ?auto_337539 ) ) ( not ( = ?auto_337528 ?auto_337540 ) ) ( not ( = ?auto_337529 ?auto_337530 ) ) ( not ( = ?auto_337529 ?auto_337531 ) ) ( not ( = ?auto_337529 ?auto_337532 ) ) ( not ( = ?auto_337529 ?auto_337533 ) ) ( not ( = ?auto_337529 ?auto_337534 ) ) ( not ( = ?auto_337529 ?auto_337535 ) ) ( not ( = ?auto_337529 ?auto_337536 ) ) ( not ( = ?auto_337529 ?auto_337537 ) ) ( not ( = ?auto_337529 ?auto_337538 ) ) ( not ( = ?auto_337529 ?auto_337539 ) ) ( not ( = ?auto_337529 ?auto_337540 ) ) ( not ( = ?auto_337530 ?auto_337531 ) ) ( not ( = ?auto_337530 ?auto_337532 ) ) ( not ( = ?auto_337530 ?auto_337533 ) ) ( not ( = ?auto_337530 ?auto_337534 ) ) ( not ( = ?auto_337530 ?auto_337535 ) ) ( not ( = ?auto_337530 ?auto_337536 ) ) ( not ( = ?auto_337530 ?auto_337537 ) ) ( not ( = ?auto_337530 ?auto_337538 ) ) ( not ( = ?auto_337530 ?auto_337539 ) ) ( not ( = ?auto_337530 ?auto_337540 ) ) ( not ( = ?auto_337531 ?auto_337532 ) ) ( not ( = ?auto_337531 ?auto_337533 ) ) ( not ( = ?auto_337531 ?auto_337534 ) ) ( not ( = ?auto_337531 ?auto_337535 ) ) ( not ( = ?auto_337531 ?auto_337536 ) ) ( not ( = ?auto_337531 ?auto_337537 ) ) ( not ( = ?auto_337531 ?auto_337538 ) ) ( not ( = ?auto_337531 ?auto_337539 ) ) ( not ( = ?auto_337531 ?auto_337540 ) ) ( not ( = ?auto_337532 ?auto_337533 ) ) ( not ( = ?auto_337532 ?auto_337534 ) ) ( not ( = ?auto_337532 ?auto_337535 ) ) ( not ( = ?auto_337532 ?auto_337536 ) ) ( not ( = ?auto_337532 ?auto_337537 ) ) ( not ( = ?auto_337532 ?auto_337538 ) ) ( not ( = ?auto_337532 ?auto_337539 ) ) ( not ( = ?auto_337532 ?auto_337540 ) ) ( not ( = ?auto_337533 ?auto_337534 ) ) ( not ( = ?auto_337533 ?auto_337535 ) ) ( not ( = ?auto_337533 ?auto_337536 ) ) ( not ( = ?auto_337533 ?auto_337537 ) ) ( not ( = ?auto_337533 ?auto_337538 ) ) ( not ( = ?auto_337533 ?auto_337539 ) ) ( not ( = ?auto_337533 ?auto_337540 ) ) ( not ( = ?auto_337534 ?auto_337535 ) ) ( not ( = ?auto_337534 ?auto_337536 ) ) ( not ( = ?auto_337534 ?auto_337537 ) ) ( not ( = ?auto_337534 ?auto_337538 ) ) ( not ( = ?auto_337534 ?auto_337539 ) ) ( not ( = ?auto_337534 ?auto_337540 ) ) ( not ( = ?auto_337535 ?auto_337536 ) ) ( not ( = ?auto_337535 ?auto_337537 ) ) ( not ( = ?auto_337535 ?auto_337538 ) ) ( not ( = ?auto_337535 ?auto_337539 ) ) ( not ( = ?auto_337535 ?auto_337540 ) ) ( not ( = ?auto_337536 ?auto_337537 ) ) ( not ( = ?auto_337536 ?auto_337538 ) ) ( not ( = ?auto_337536 ?auto_337539 ) ) ( not ( = ?auto_337536 ?auto_337540 ) ) ( not ( = ?auto_337537 ?auto_337538 ) ) ( not ( = ?auto_337537 ?auto_337539 ) ) ( not ( = ?auto_337537 ?auto_337540 ) ) ( not ( = ?auto_337538 ?auto_337539 ) ) ( not ( = ?auto_337538 ?auto_337540 ) ) ( not ( = ?auto_337539 ?auto_337540 ) ) ( ON ?auto_337538 ?auto_337539 ) ( ON ?auto_337537 ?auto_337538 ) ( ON ?auto_337536 ?auto_337537 ) ( ON ?auto_337535 ?auto_337536 ) ( ON ?auto_337534 ?auto_337535 ) ( ON ?auto_337533 ?auto_337534 ) ( ON ?auto_337532 ?auto_337533 ) ( ON ?auto_337531 ?auto_337532 ) ( CLEAR ?auto_337529 ) ( ON ?auto_337530 ?auto_337531 ) ( CLEAR ?auto_337530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_337528 ?auto_337529 ?auto_337530 )
      ( MAKE-12PILE ?auto_337528 ?auto_337529 ?auto_337530 ?auto_337531 ?auto_337532 ?auto_337533 ?auto_337534 ?auto_337535 ?auto_337536 ?auto_337537 ?auto_337538 ?auto_337539 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337553 - BLOCK
      ?auto_337554 - BLOCK
      ?auto_337555 - BLOCK
      ?auto_337556 - BLOCK
      ?auto_337557 - BLOCK
      ?auto_337558 - BLOCK
      ?auto_337559 - BLOCK
      ?auto_337560 - BLOCK
      ?auto_337561 - BLOCK
      ?auto_337562 - BLOCK
      ?auto_337563 - BLOCK
      ?auto_337564 - BLOCK
    )
    :vars
    (
      ?auto_337565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337564 ?auto_337565 ) ( ON-TABLE ?auto_337553 ) ( ON ?auto_337554 ?auto_337553 ) ( not ( = ?auto_337553 ?auto_337554 ) ) ( not ( = ?auto_337553 ?auto_337555 ) ) ( not ( = ?auto_337553 ?auto_337556 ) ) ( not ( = ?auto_337553 ?auto_337557 ) ) ( not ( = ?auto_337553 ?auto_337558 ) ) ( not ( = ?auto_337553 ?auto_337559 ) ) ( not ( = ?auto_337553 ?auto_337560 ) ) ( not ( = ?auto_337553 ?auto_337561 ) ) ( not ( = ?auto_337553 ?auto_337562 ) ) ( not ( = ?auto_337553 ?auto_337563 ) ) ( not ( = ?auto_337553 ?auto_337564 ) ) ( not ( = ?auto_337553 ?auto_337565 ) ) ( not ( = ?auto_337554 ?auto_337555 ) ) ( not ( = ?auto_337554 ?auto_337556 ) ) ( not ( = ?auto_337554 ?auto_337557 ) ) ( not ( = ?auto_337554 ?auto_337558 ) ) ( not ( = ?auto_337554 ?auto_337559 ) ) ( not ( = ?auto_337554 ?auto_337560 ) ) ( not ( = ?auto_337554 ?auto_337561 ) ) ( not ( = ?auto_337554 ?auto_337562 ) ) ( not ( = ?auto_337554 ?auto_337563 ) ) ( not ( = ?auto_337554 ?auto_337564 ) ) ( not ( = ?auto_337554 ?auto_337565 ) ) ( not ( = ?auto_337555 ?auto_337556 ) ) ( not ( = ?auto_337555 ?auto_337557 ) ) ( not ( = ?auto_337555 ?auto_337558 ) ) ( not ( = ?auto_337555 ?auto_337559 ) ) ( not ( = ?auto_337555 ?auto_337560 ) ) ( not ( = ?auto_337555 ?auto_337561 ) ) ( not ( = ?auto_337555 ?auto_337562 ) ) ( not ( = ?auto_337555 ?auto_337563 ) ) ( not ( = ?auto_337555 ?auto_337564 ) ) ( not ( = ?auto_337555 ?auto_337565 ) ) ( not ( = ?auto_337556 ?auto_337557 ) ) ( not ( = ?auto_337556 ?auto_337558 ) ) ( not ( = ?auto_337556 ?auto_337559 ) ) ( not ( = ?auto_337556 ?auto_337560 ) ) ( not ( = ?auto_337556 ?auto_337561 ) ) ( not ( = ?auto_337556 ?auto_337562 ) ) ( not ( = ?auto_337556 ?auto_337563 ) ) ( not ( = ?auto_337556 ?auto_337564 ) ) ( not ( = ?auto_337556 ?auto_337565 ) ) ( not ( = ?auto_337557 ?auto_337558 ) ) ( not ( = ?auto_337557 ?auto_337559 ) ) ( not ( = ?auto_337557 ?auto_337560 ) ) ( not ( = ?auto_337557 ?auto_337561 ) ) ( not ( = ?auto_337557 ?auto_337562 ) ) ( not ( = ?auto_337557 ?auto_337563 ) ) ( not ( = ?auto_337557 ?auto_337564 ) ) ( not ( = ?auto_337557 ?auto_337565 ) ) ( not ( = ?auto_337558 ?auto_337559 ) ) ( not ( = ?auto_337558 ?auto_337560 ) ) ( not ( = ?auto_337558 ?auto_337561 ) ) ( not ( = ?auto_337558 ?auto_337562 ) ) ( not ( = ?auto_337558 ?auto_337563 ) ) ( not ( = ?auto_337558 ?auto_337564 ) ) ( not ( = ?auto_337558 ?auto_337565 ) ) ( not ( = ?auto_337559 ?auto_337560 ) ) ( not ( = ?auto_337559 ?auto_337561 ) ) ( not ( = ?auto_337559 ?auto_337562 ) ) ( not ( = ?auto_337559 ?auto_337563 ) ) ( not ( = ?auto_337559 ?auto_337564 ) ) ( not ( = ?auto_337559 ?auto_337565 ) ) ( not ( = ?auto_337560 ?auto_337561 ) ) ( not ( = ?auto_337560 ?auto_337562 ) ) ( not ( = ?auto_337560 ?auto_337563 ) ) ( not ( = ?auto_337560 ?auto_337564 ) ) ( not ( = ?auto_337560 ?auto_337565 ) ) ( not ( = ?auto_337561 ?auto_337562 ) ) ( not ( = ?auto_337561 ?auto_337563 ) ) ( not ( = ?auto_337561 ?auto_337564 ) ) ( not ( = ?auto_337561 ?auto_337565 ) ) ( not ( = ?auto_337562 ?auto_337563 ) ) ( not ( = ?auto_337562 ?auto_337564 ) ) ( not ( = ?auto_337562 ?auto_337565 ) ) ( not ( = ?auto_337563 ?auto_337564 ) ) ( not ( = ?auto_337563 ?auto_337565 ) ) ( not ( = ?auto_337564 ?auto_337565 ) ) ( ON ?auto_337563 ?auto_337564 ) ( ON ?auto_337562 ?auto_337563 ) ( ON ?auto_337561 ?auto_337562 ) ( ON ?auto_337560 ?auto_337561 ) ( ON ?auto_337559 ?auto_337560 ) ( ON ?auto_337558 ?auto_337559 ) ( ON ?auto_337557 ?auto_337558 ) ( ON ?auto_337556 ?auto_337557 ) ( CLEAR ?auto_337554 ) ( ON ?auto_337555 ?auto_337556 ) ( CLEAR ?auto_337555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_337553 ?auto_337554 ?auto_337555 )
      ( MAKE-12PILE ?auto_337553 ?auto_337554 ?auto_337555 ?auto_337556 ?auto_337557 ?auto_337558 ?auto_337559 ?auto_337560 ?auto_337561 ?auto_337562 ?auto_337563 ?auto_337564 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337578 - BLOCK
      ?auto_337579 - BLOCK
      ?auto_337580 - BLOCK
      ?auto_337581 - BLOCK
      ?auto_337582 - BLOCK
      ?auto_337583 - BLOCK
      ?auto_337584 - BLOCK
      ?auto_337585 - BLOCK
      ?auto_337586 - BLOCK
      ?auto_337587 - BLOCK
      ?auto_337588 - BLOCK
      ?auto_337589 - BLOCK
    )
    :vars
    (
      ?auto_337590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337589 ?auto_337590 ) ( ON-TABLE ?auto_337578 ) ( not ( = ?auto_337578 ?auto_337579 ) ) ( not ( = ?auto_337578 ?auto_337580 ) ) ( not ( = ?auto_337578 ?auto_337581 ) ) ( not ( = ?auto_337578 ?auto_337582 ) ) ( not ( = ?auto_337578 ?auto_337583 ) ) ( not ( = ?auto_337578 ?auto_337584 ) ) ( not ( = ?auto_337578 ?auto_337585 ) ) ( not ( = ?auto_337578 ?auto_337586 ) ) ( not ( = ?auto_337578 ?auto_337587 ) ) ( not ( = ?auto_337578 ?auto_337588 ) ) ( not ( = ?auto_337578 ?auto_337589 ) ) ( not ( = ?auto_337578 ?auto_337590 ) ) ( not ( = ?auto_337579 ?auto_337580 ) ) ( not ( = ?auto_337579 ?auto_337581 ) ) ( not ( = ?auto_337579 ?auto_337582 ) ) ( not ( = ?auto_337579 ?auto_337583 ) ) ( not ( = ?auto_337579 ?auto_337584 ) ) ( not ( = ?auto_337579 ?auto_337585 ) ) ( not ( = ?auto_337579 ?auto_337586 ) ) ( not ( = ?auto_337579 ?auto_337587 ) ) ( not ( = ?auto_337579 ?auto_337588 ) ) ( not ( = ?auto_337579 ?auto_337589 ) ) ( not ( = ?auto_337579 ?auto_337590 ) ) ( not ( = ?auto_337580 ?auto_337581 ) ) ( not ( = ?auto_337580 ?auto_337582 ) ) ( not ( = ?auto_337580 ?auto_337583 ) ) ( not ( = ?auto_337580 ?auto_337584 ) ) ( not ( = ?auto_337580 ?auto_337585 ) ) ( not ( = ?auto_337580 ?auto_337586 ) ) ( not ( = ?auto_337580 ?auto_337587 ) ) ( not ( = ?auto_337580 ?auto_337588 ) ) ( not ( = ?auto_337580 ?auto_337589 ) ) ( not ( = ?auto_337580 ?auto_337590 ) ) ( not ( = ?auto_337581 ?auto_337582 ) ) ( not ( = ?auto_337581 ?auto_337583 ) ) ( not ( = ?auto_337581 ?auto_337584 ) ) ( not ( = ?auto_337581 ?auto_337585 ) ) ( not ( = ?auto_337581 ?auto_337586 ) ) ( not ( = ?auto_337581 ?auto_337587 ) ) ( not ( = ?auto_337581 ?auto_337588 ) ) ( not ( = ?auto_337581 ?auto_337589 ) ) ( not ( = ?auto_337581 ?auto_337590 ) ) ( not ( = ?auto_337582 ?auto_337583 ) ) ( not ( = ?auto_337582 ?auto_337584 ) ) ( not ( = ?auto_337582 ?auto_337585 ) ) ( not ( = ?auto_337582 ?auto_337586 ) ) ( not ( = ?auto_337582 ?auto_337587 ) ) ( not ( = ?auto_337582 ?auto_337588 ) ) ( not ( = ?auto_337582 ?auto_337589 ) ) ( not ( = ?auto_337582 ?auto_337590 ) ) ( not ( = ?auto_337583 ?auto_337584 ) ) ( not ( = ?auto_337583 ?auto_337585 ) ) ( not ( = ?auto_337583 ?auto_337586 ) ) ( not ( = ?auto_337583 ?auto_337587 ) ) ( not ( = ?auto_337583 ?auto_337588 ) ) ( not ( = ?auto_337583 ?auto_337589 ) ) ( not ( = ?auto_337583 ?auto_337590 ) ) ( not ( = ?auto_337584 ?auto_337585 ) ) ( not ( = ?auto_337584 ?auto_337586 ) ) ( not ( = ?auto_337584 ?auto_337587 ) ) ( not ( = ?auto_337584 ?auto_337588 ) ) ( not ( = ?auto_337584 ?auto_337589 ) ) ( not ( = ?auto_337584 ?auto_337590 ) ) ( not ( = ?auto_337585 ?auto_337586 ) ) ( not ( = ?auto_337585 ?auto_337587 ) ) ( not ( = ?auto_337585 ?auto_337588 ) ) ( not ( = ?auto_337585 ?auto_337589 ) ) ( not ( = ?auto_337585 ?auto_337590 ) ) ( not ( = ?auto_337586 ?auto_337587 ) ) ( not ( = ?auto_337586 ?auto_337588 ) ) ( not ( = ?auto_337586 ?auto_337589 ) ) ( not ( = ?auto_337586 ?auto_337590 ) ) ( not ( = ?auto_337587 ?auto_337588 ) ) ( not ( = ?auto_337587 ?auto_337589 ) ) ( not ( = ?auto_337587 ?auto_337590 ) ) ( not ( = ?auto_337588 ?auto_337589 ) ) ( not ( = ?auto_337588 ?auto_337590 ) ) ( not ( = ?auto_337589 ?auto_337590 ) ) ( ON ?auto_337588 ?auto_337589 ) ( ON ?auto_337587 ?auto_337588 ) ( ON ?auto_337586 ?auto_337587 ) ( ON ?auto_337585 ?auto_337586 ) ( ON ?auto_337584 ?auto_337585 ) ( ON ?auto_337583 ?auto_337584 ) ( ON ?auto_337582 ?auto_337583 ) ( ON ?auto_337581 ?auto_337582 ) ( ON ?auto_337580 ?auto_337581 ) ( CLEAR ?auto_337578 ) ( ON ?auto_337579 ?auto_337580 ) ( CLEAR ?auto_337579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_337578 ?auto_337579 )
      ( MAKE-12PILE ?auto_337578 ?auto_337579 ?auto_337580 ?auto_337581 ?auto_337582 ?auto_337583 ?auto_337584 ?auto_337585 ?auto_337586 ?auto_337587 ?auto_337588 ?auto_337589 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337603 - BLOCK
      ?auto_337604 - BLOCK
      ?auto_337605 - BLOCK
      ?auto_337606 - BLOCK
      ?auto_337607 - BLOCK
      ?auto_337608 - BLOCK
      ?auto_337609 - BLOCK
      ?auto_337610 - BLOCK
      ?auto_337611 - BLOCK
      ?auto_337612 - BLOCK
      ?auto_337613 - BLOCK
      ?auto_337614 - BLOCK
    )
    :vars
    (
      ?auto_337615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337614 ?auto_337615 ) ( ON-TABLE ?auto_337603 ) ( not ( = ?auto_337603 ?auto_337604 ) ) ( not ( = ?auto_337603 ?auto_337605 ) ) ( not ( = ?auto_337603 ?auto_337606 ) ) ( not ( = ?auto_337603 ?auto_337607 ) ) ( not ( = ?auto_337603 ?auto_337608 ) ) ( not ( = ?auto_337603 ?auto_337609 ) ) ( not ( = ?auto_337603 ?auto_337610 ) ) ( not ( = ?auto_337603 ?auto_337611 ) ) ( not ( = ?auto_337603 ?auto_337612 ) ) ( not ( = ?auto_337603 ?auto_337613 ) ) ( not ( = ?auto_337603 ?auto_337614 ) ) ( not ( = ?auto_337603 ?auto_337615 ) ) ( not ( = ?auto_337604 ?auto_337605 ) ) ( not ( = ?auto_337604 ?auto_337606 ) ) ( not ( = ?auto_337604 ?auto_337607 ) ) ( not ( = ?auto_337604 ?auto_337608 ) ) ( not ( = ?auto_337604 ?auto_337609 ) ) ( not ( = ?auto_337604 ?auto_337610 ) ) ( not ( = ?auto_337604 ?auto_337611 ) ) ( not ( = ?auto_337604 ?auto_337612 ) ) ( not ( = ?auto_337604 ?auto_337613 ) ) ( not ( = ?auto_337604 ?auto_337614 ) ) ( not ( = ?auto_337604 ?auto_337615 ) ) ( not ( = ?auto_337605 ?auto_337606 ) ) ( not ( = ?auto_337605 ?auto_337607 ) ) ( not ( = ?auto_337605 ?auto_337608 ) ) ( not ( = ?auto_337605 ?auto_337609 ) ) ( not ( = ?auto_337605 ?auto_337610 ) ) ( not ( = ?auto_337605 ?auto_337611 ) ) ( not ( = ?auto_337605 ?auto_337612 ) ) ( not ( = ?auto_337605 ?auto_337613 ) ) ( not ( = ?auto_337605 ?auto_337614 ) ) ( not ( = ?auto_337605 ?auto_337615 ) ) ( not ( = ?auto_337606 ?auto_337607 ) ) ( not ( = ?auto_337606 ?auto_337608 ) ) ( not ( = ?auto_337606 ?auto_337609 ) ) ( not ( = ?auto_337606 ?auto_337610 ) ) ( not ( = ?auto_337606 ?auto_337611 ) ) ( not ( = ?auto_337606 ?auto_337612 ) ) ( not ( = ?auto_337606 ?auto_337613 ) ) ( not ( = ?auto_337606 ?auto_337614 ) ) ( not ( = ?auto_337606 ?auto_337615 ) ) ( not ( = ?auto_337607 ?auto_337608 ) ) ( not ( = ?auto_337607 ?auto_337609 ) ) ( not ( = ?auto_337607 ?auto_337610 ) ) ( not ( = ?auto_337607 ?auto_337611 ) ) ( not ( = ?auto_337607 ?auto_337612 ) ) ( not ( = ?auto_337607 ?auto_337613 ) ) ( not ( = ?auto_337607 ?auto_337614 ) ) ( not ( = ?auto_337607 ?auto_337615 ) ) ( not ( = ?auto_337608 ?auto_337609 ) ) ( not ( = ?auto_337608 ?auto_337610 ) ) ( not ( = ?auto_337608 ?auto_337611 ) ) ( not ( = ?auto_337608 ?auto_337612 ) ) ( not ( = ?auto_337608 ?auto_337613 ) ) ( not ( = ?auto_337608 ?auto_337614 ) ) ( not ( = ?auto_337608 ?auto_337615 ) ) ( not ( = ?auto_337609 ?auto_337610 ) ) ( not ( = ?auto_337609 ?auto_337611 ) ) ( not ( = ?auto_337609 ?auto_337612 ) ) ( not ( = ?auto_337609 ?auto_337613 ) ) ( not ( = ?auto_337609 ?auto_337614 ) ) ( not ( = ?auto_337609 ?auto_337615 ) ) ( not ( = ?auto_337610 ?auto_337611 ) ) ( not ( = ?auto_337610 ?auto_337612 ) ) ( not ( = ?auto_337610 ?auto_337613 ) ) ( not ( = ?auto_337610 ?auto_337614 ) ) ( not ( = ?auto_337610 ?auto_337615 ) ) ( not ( = ?auto_337611 ?auto_337612 ) ) ( not ( = ?auto_337611 ?auto_337613 ) ) ( not ( = ?auto_337611 ?auto_337614 ) ) ( not ( = ?auto_337611 ?auto_337615 ) ) ( not ( = ?auto_337612 ?auto_337613 ) ) ( not ( = ?auto_337612 ?auto_337614 ) ) ( not ( = ?auto_337612 ?auto_337615 ) ) ( not ( = ?auto_337613 ?auto_337614 ) ) ( not ( = ?auto_337613 ?auto_337615 ) ) ( not ( = ?auto_337614 ?auto_337615 ) ) ( ON ?auto_337613 ?auto_337614 ) ( ON ?auto_337612 ?auto_337613 ) ( ON ?auto_337611 ?auto_337612 ) ( ON ?auto_337610 ?auto_337611 ) ( ON ?auto_337609 ?auto_337610 ) ( ON ?auto_337608 ?auto_337609 ) ( ON ?auto_337607 ?auto_337608 ) ( ON ?auto_337606 ?auto_337607 ) ( ON ?auto_337605 ?auto_337606 ) ( CLEAR ?auto_337603 ) ( ON ?auto_337604 ?auto_337605 ) ( CLEAR ?auto_337604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_337603 ?auto_337604 )
      ( MAKE-12PILE ?auto_337603 ?auto_337604 ?auto_337605 ?auto_337606 ?auto_337607 ?auto_337608 ?auto_337609 ?auto_337610 ?auto_337611 ?auto_337612 ?auto_337613 ?auto_337614 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337628 - BLOCK
      ?auto_337629 - BLOCK
      ?auto_337630 - BLOCK
      ?auto_337631 - BLOCK
      ?auto_337632 - BLOCK
      ?auto_337633 - BLOCK
      ?auto_337634 - BLOCK
      ?auto_337635 - BLOCK
      ?auto_337636 - BLOCK
      ?auto_337637 - BLOCK
      ?auto_337638 - BLOCK
      ?auto_337639 - BLOCK
    )
    :vars
    (
      ?auto_337640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337639 ?auto_337640 ) ( not ( = ?auto_337628 ?auto_337629 ) ) ( not ( = ?auto_337628 ?auto_337630 ) ) ( not ( = ?auto_337628 ?auto_337631 ) ) ( not ( = ?auto_337628 ?auto_337632 ) ) ( not ( = ?auto_337628 ?auto_337633 ) ) ( not ( = ?auto_337628 ?auto_337634 ) ) ( not ( = ?auto_337628 ?auto_337635 ) ) ( not ( = ?auto_337628 ?auto_337636 ) ) ( not ( = ?auto_337628 ?auto_337637 ) ) ( not ( = ?auto_337628 ?auto_337638 ) ) ( not ( = ?auto_337628 ?auto_337639 ) ) ( not ( = ?auto_337628 ?auto_337640 ) ) ( not ( = ?auto_337629 ?auto_337630 ) ) ( not ( = ?auto_337629 ?auto_337631 ) ) ( not ( = ?auto_337629 ?auto_337632 ) ) ( not ( = ?auto_337629 ?auto_337633 ) ) ( not ( = ?auto_337629 ?auto_337634 ) ) ( not ( = ?auto_337629 ?auto_337635 ) ) ( not ( = ?auto_337629 ?auto_337636 ) ) ( not ( = ?auto_337629 ?auto_337637 ) ) ( not ( = ?auto_337629 ?auto_337638 ) ) ( not ( = ?auto_337629 ?auto_337639 ) ) ( not ( = ?auto_337629 ?auto_337640 ) ) ( not ( = ?auto_337630 ?auto_337631 ) ) ( not ( = ?auto_337630 ?auto_337632 ) ) ( not ( = ?auto_337630 ?auto_337633 ) ) ( not ( = ?auto_337630 ?auto_337634 ) ) ( not ( = ?auto_337630 ?auto_337635 ) ) ( not ( = ?auto_337630 ?auto_337636 ) ) ( not ( = ?auto_337630 ?auto_337637 ) ) ( not ( = ?auto_337630 ?auto_337638 ) ) ( not ( = ?auto_337630 ?auto_337639 ) ) ( not ( = ?auto_337630 ?auto_337640 ) ) ( not ( = ?auto_337631 ?auto_337632 ) ) ( not ( = ?auto_337631 ?auto_337633 ) ) ( not ( = ?auto_337631 ?auto_337634 ) ) ( not ( = ?auto_337631 ?auto_337635 ) ) ( not ( = ?auto_337631 ?auto_337636 ) ) ( not ( = ?auto_337631 ?auto_337637 ) ) ( not ( = ?auto_337631 ?auto_337638 ) ) ( not ( = ?auto_337631 ?auto_337639 ) ) ( not ( = ?auto_337631 ?auto_337640 ) ) ( not ( = ?auto_337632 ?auto_337633 ) ) ( not ( = ?auto_337632 ?auto_337634 ) ) ( not ( = ?auto_337632 ?auto_337635 ) ) ( not ( = ?auto_337632 ?auto_337636 ) ) ( not ( = ?auto_337632 ?auto_337637 ) ) ( not ( = ?auto_337632 ?auto_337638 ) ) ( not ( = ?auto_337632 ?auto_337639 ) ) ( not ( = ?auto_337632 ?auto_337640 ) ) ( not ( = ?auto_337633 ?auto_337634 ) ) ( not ( = ?auto_337633 ?auto_337635 ) ) ( not ( = ?auto_337633 ?auto_337636 ) ) ( not ( = ?auto_337633 ?auto_337637 ) ) ( not ( = ?auto_337633 ?auto_337638 ) ) ( not ( = ?auto_337633 ?auto_337639 ) ) ( not ( = ?auto_337633 ?auto_337640 ) ) ( not ( = ?auto_337634 ?auto_337635 ) ) ( not ( = ?auto_337634 ?auto_337636 ) ) ( not ( = ?auto_337634 ?auto_337637 ) ) ( not ( = ?auto_337634 ?auto_337638 ) ) ( not ( = ?auto_337634 ?auto_337639 ) ) ( not ( = ?auto_337634 ?auto_337640 ) ) ( not ( = ?auto_337635 ?auto_337636 ) ) ( not ( = ?auto_337635 ?auto_337637 ) ) ( not ( = ?auto_337635 ?auto_337638 ) ) ( not ( = ?auto_337635 ?auto_337639 ) ) ( not ( = ?auto_337635 ?auto_337640 ) ) ( not ( = ?auto_337636 ?auto_337637 ) ) ( not ( = ?auto_337636 ?auto_337638 ) ) ( not ( = ?auto_337636 ?auto_337639 ) ) ( not ( = ?auto_337636 ?auto_337640 ) ) ( not ( = ?auto_337637 ?auto_337638 ) ) ( not ( = ?auto_337637 ?auto_337639 ) ) ( not ( = ?auto_337637 ?auto_337640 ) ) ( not ( = ?auto_337638 ?auto_337639 ) ) ( not ( = ?auto_337638 ?auto_337640 ) ) ( not ( = ?auto_337639 ?auto_337640 ) ) ( ON ?auto_337638 ?auto_337639 ) ( ON ?auto_337637 ?auto_337638 ) ( ON ?auto_337636 ?auto_337637 ) ( ON ?auto_337635 ?auto_337636 ) ( ON ?auto_337634 ?auto_337635 ) ( ON ?auto_337633 ?auto_337634 ) ( ON ?auto_337632 ?auto_337633 ) ( ON ?auto_337631 ?auto_337632 ) ( ON ?auto_337630 ?auto_337631 ) ( ON ?auto_337629 ?auto_337630 ) ( ON ?auto_337628 ?auto_337629 ) ( CLEAR ?auto_337628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_337628 )
      ( MAKE-12PILE ?auto_337628 ?auto_337629 ?auto_337630 ?auto_337631 ?auto_337632 ?auto_337633 ?auto_337634 ?auto_337635 ?auto_337636 ?auto_337637 ?auto_337638 ?auto_337639 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_337653 - BLOCK
      ?auto_337654 - BLOCK
      ?auto_337655 - BLOCK
      ?auto_337656 - BLOCK
      ?auto_337657 - BLOCK
      ?auto_337658 - BLOCK
      ?auto_337659 - BLOCK
      ?auto_337660 - BLOCK
      ?auto_337661 - BLOCK
      ?auto_337662 - BLOCK
      ?auto_337663 - BLOCK
      ?auto_337664 - BLOCK
    )
    :vars
    (
      ?auto_337665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337664 ?auto_337665 ) ( not ( = ?auto_337653 ?auto_337654 ) ) ( not ( = ?auto_337653 ?auto_337655 ) ) ( not ( = ?auto_337653 ?auto_337656 ) ) ( not ( = ?auto_337653 ?auto_337657 ) ) ( not ( = ?auto_337653 ?auto_337658 ) ) ( not ( = ?auto_337653 ?auto_337659 ) ) ( not ( = ?auto_337653 ?auto_337660 ) ) ( not ( = ?auto_337653 ?auto_337661 ) ) ( not ( = ?auto_337653 ?auto_337662 ) ) ( not ( = ?auto_337653 ?auto_337663 ) ) ( not ( = ?auto_337653 ?auto_337664 ) ) ( not ( = ?auto_337653 ?auto_337665 ) ) ( not ( = ?auto_337654 ?auto_337655 ) ) ( not ( = ?auto_337654 ?auto_337656 ) ) ( not ( = ?auto_337654 ?auto_337657 ) ) ( not ( = ?auto_337654 ?auto_337658 ) ) ( not ( = ?auto_337654 ?auto_337659 ) ) ( not ( = ?auto_337654 ?auto_337660 ) ) ( not ( = ?auto_337654 ?auto_337661 ) ) ( not ( = ?auto_337654 ?auto_337662 ) ) ( not ( = ?auto_337654 ?auto_337663 ) ) ( not ( = ?auto_337654 ?auto_337664 ) ) ( not ( = ?auto_337654 ?auto_337665 ) ) ( not ( = ?auto_337655 ?auto_337656 ) ) ( not ( = ?auto_337655 ?auto_337657 ) ) ( not ( = ?auto_337655 ?auto_337658 ) ) ( not ( = ?auto_337655 ?auto_337659 ) ) ( not ( = ?auto_337655 ?auto_337660 ) ) ( not ( = ?auto_337655 ?auto_337661 ) ) ( not ( = ?auto_337655 ?auto_337662 ) ) ( not ( = ?auto_337655 ?auto_337663 ) ) ( not ( = ?auto_337655 ?auto_337664 ) ) ( not ( = ?auto_337655 ?auto_337665 ) ) ( not ( = ?auto_337656 ?auto_337657 ) ) ( not ( = ?auto_337656 ?auto_337658 ) ) ( not ( = ?auto_337656 ?auto_337659 ) ) ( not ( = ?auto_337656 ?auto_337660 ) ) ( not ( = ?auto_337656 ?auto_337661 ) ) ( not ( = ?auto_337656 ?auto_337662 ) ) ( not ( = ?auto_337656 ?auto_337663 ) ) ( not ( = ?auto_337656 ?auto_337664 ) ) ( not ( = ?auto_337656 ?auto_337665 ) ) ( not ( = ?auto_337657 ?auto_337658 ) ) ( not ( = ?auto_337657 ?auto_337659 ) ) ( not ( = ?auto_337657 ?auto_337660 ) ) ( not ( = ?auto_337657 ?auto_337661 ) ) ( not ( = ?auto_337657 ?auto_337662 ) ) ( not ( = ?auto_337657 ?auto_337663 ) ) ( not ( = ?auto_337657 ?auto_337664 ) ) ( not ( = ?auto_337657 ?auto_337665 ) ) ( not ( = ?auto_337658 ?auto_337659 ) ) ( not ( = ?auto_337658 ?auto_337660 ) ) ( not ( = ?auto_337658 ?auto_337661 ) ) ( not ( = ?auto_337658 ?auto_337662 ) ) ( not ( = ?auto_337658 ?auto_337663 ) ) ( not ( = ?auto_337658 ?auto_337664 ) ) ( not ( = ?auto_337658 ?auto_337665 ) ) ( not ( = ?auto_337659 ?auto_337660 ) ) ( not ( = ?auto_337659 ?auto_337661 ) ) ( not ( = ?auto_337659 ?auto_337662 ) ) ( not ( = ?auto_337659 ?auto_337663 ) ) ( not ( = ?auto_337659 ?auto_337664 ) ) ( not ( = ?auto_337659 ?auto_337665 ) ) ( not ( = ?auto_337660 ?auto_337661 ) ) ( not ( = ?auto_337660 ?auto_337662 ) ) ( not ( = ?auto_337660 ?auto_337663 ) ) ( not ( = ?auto_337660 ?auto_337664 ) ) ( not ( = ?auto_337660 ?auto_337665 ) ) ( not ( = ?auto_337661 ?auto_337662 ) ) ( not ( = ?auto_337661 ?auto_337663 ) ) ( not ( = ?auto_337661 ?auto_337664 ) ) ( not ( = ?auto_337661 ?auto_337665 ) ) ( not ( = ?auto_337662 ?auto_337663 ) ) ( not ( = ?auto_337662 ?auto_337664 ) ) ( not ( = ?auto_337662 ?auto_337665 ) ) ( not ( = ?auto_337663 ?auto_337664 ) ) ( not ( = ?auto_337663 ?auto_337665 ) ) ( not ( = ?auto_337664 ?auto_337665 ) ) ( ON ?auto_337663 ?auto_337664 ) ( ON ?auto_337662 ?auto_337663 ) ( ON ?auto_337661 ?auto_337662 ) ( ON ?auto_337660 ?auto_337661 ) ( ON ?auto_337659 ?auto_337660 ) ( ON ?auto_337658 ?auto_337659 ) ( ON ?auto_337657 ?auto_337658 ) ( ON ?auto_337656 ?auto_337657 ) ( ON ?auto_337655 ?auto_337656 ) ( ON ?auto_337654 ?auto_337655 ) ( ON ?auto_337653 ?auto_337654 ) ( CLEAR ?auto_337653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_337653 )
      ( MAKE-12PILE ?auto_337653 ?auto_337654 ?auto_337655 ?auto_337656 ?auto_337657 ?auto_337658 ?auto_337659 ?auto_337660 ?auto_337661 ?auto_337662 ?auto_337663 ?auto_337664 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337679 - BLOCK
      ?auto_337680 - BLOCK
      ?auto_337681 - BLOCK
      ?auto_337682 - BLOCK
      ?auto_337683 - BLOCK
      ?auto_337684 - BLOCK
      ?auto_337685 - BLOCK
      ?auto_337686 - BLOCK
      ?auto_337687 - BLOCK
      ?auto_337688 - BLOCK
      ?auto_337689 - BLOCK
      ?auto_337690 - BLOCK
      ?auto_337691 - BLOCK
    )
    :vars
    (
      ?auto_337692 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_337690 ) ( ON ?auto_337691 ?auto_337692 ) ( CLEAR ?auto_337691 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_337679 ) ( ON ?auto_337680 ?auto_337679 ) ( ON ?auto_337681 ?auto_337680 ) ( ON ?auto_337682 ?auto_337681 ) ( ON ?auto_337683 ?auto_337682 ) ( ON ?auto_337684 ?auto_337683 ) ( ON ?auto_337685 ?auto_337684 ) ( ON ?auto_337686 ?auto_337685 ) ( ON ?auto_337687 ?auto_337686 ) ( ON ?auto_337688 ?auto_337687 ) ( ON ?auto_337689 ?auto_337688 ) ( ON ?auto_337690 ?auto_337689 ) ( not ( = ?auto_337679 ?auto_337680 ) ) ( not ( = ?auto_337679 ?auto_337681 ) ) ( not ( = ?auto_337679 ?auto_337682 ) ) ( not ( = ?auto_337679 ?auto_337683 ) ) ( not ( = ?auto_337679 ?auto_337684 ) ) ( not ( = ?auto_337679 ?auto_337685 ) ) ( not ( = ?auto_337679 ?auto_337686 ) ) ( not ( = ?auto_337679 ?auto_337687 ) ) ( not ( = ?auto_337679 ?auto_337688 ) ) ( not ( = ?auto_337679 ?auto_337689 ) ) ( not ( = ?auto_337679 ?auto_337690 ) ) ( not ( = ?auto_337679 ?auto_337691 ) ) ( not ( = ?auto_337679 ?auto_337692 ) ) ( not ( = ?auto_337680 ?auto_337681 ) ) ( not ( = ?auto_337680 ?auto_337682 ) ) ( not ( = ?auto_337680 ?auto_337683 ) ) ( not ( = ?auto_337680 ?auto_337684 ) ) ( not ( = ?auto_337680 ?auto_337685 ) ) ( not ( = ?auto_337680 ?auto_337686 ) ) ( not ( = ?auto_337680 ?auto_337687 ) ) ( not ( = ?auto_337680 ?auto_337688 ) ) ( not ( = ?auto_337680 ?auto_337689 ) ) ( not ( = ?auto_337680 ?auto_337690 ) ) ( not ( = ?auto_337680 ?auto_337691 ) ) ( not ( = ?auto_337680 ?auto_337692 ) ) ( not ( = ?auto_337681 ?auto_337682 ) ) ( not ( = ?auto_337681 ?auto_337683 ) ) ( not ( = ?auto_337681 ?auto_337684 ) ) ( not ( = ?auto_337681 ?auto_337685 ) ) ( not ( = ?auto_337681 ?auto_337686 ) ) ( not ( = ?auto_337681 ?auto_337687 ) ) ( not ( = ?auto_337681 ?auto_337688 ) ) ( not ( = ?auto_337681 ?auto_337689 ) ) ( not ( = ?auto_337681 ?auto_337690 ) ) ( not ( = ?auto_337681 ?auto_337691 ) ) ( not ( = ?auto_337681 ?auto_337692 ) ) ( not ( = ?auto_337682 ?auto_337683 ) ) ( not ( = ?auto_337682 ?auto_337684 ) ) ( not ( = ?auto_337682 ?auto_337685 ) ) ( not ( = ?auto_337682 ?auto_337686 ) ) ( not ( = ?auto_337682 ?auto_337687 ) ) ( not ( = ?auto_337682 ?auto_337688 ) ) ( not ( = ?auto_337682 ?auto_337689 ) ) ( not ( = ?auto_337682 ?auto_337690 ) ) ( not ( = ?auto_337682 ?auto_337691 ) ) ( not ( = ?auto_337682 ?auto_337692 ) ) ( not ( = ?auto_337683 ?auto_337684 ) ) ( not ( = ?auto_337683 ?auto_337685 ) ) ( not ( = ?auto_337683 ?auto_337686 ) ) ( not ( = ?auto_337683 ?auto_337687 ) ) ( not ( = ?auto_337683 ?auto_337688 ) ) ( not ( = ?auto_337683 ?auto_337689 ) ) ( not ( = ?auto_337683 ?auto_337690 ) ) ( not ( = ?auto_337683 ?auto_337691 ) ) ( not ( = ?auto_337683 ?auto_337692 ) ) ( not ( = ?auto_337684 ?auto_337685 ) ) ( not ( = ?auto_337684 ?auto_337686 ) ) ( not ( = ?auto_337684 ?auto_337687 ) ) ( not ( = ?auto_337684 ?auto_337688 ) ) ( not ( = ?auto_337684 ?auto_337689 ) ) ( not ( = ?auto_337684 ?auto_337690 ) ) ( not ( = ?auto_337684 ?auto_337691 ) ) ( not ( = ?auto_337684 ?auto_337692 ) ) ( not ( = ?auto_337685 ?auto_337686 ) ) ( not ( = ?auto_337685 ?auto_337687 ) ) ( not ( = ?auto_337685 ?auto_337688 ) ) ( not ( = ?auto_337685 ?auto_337689 ) ) ( not ( = ?auto_337685 ?auto_337690 ) ) ( not ( = ?auto_337685 ?auto_337691 ) ) ( not ( = ?auto_337685 ?auto_337692 ) ) ( not ( = ?auto_337686 ?auto_337687 ) ) ( not ( = ?auto_337686 ?auto_337688 ) ) ( not ( = ?auto_337686 ?auto_337689 ) ) ( not ( = ?auto_337686 ?auto_337690 ) ) ( not ( = ?auto_337686 ?auto_337691 ) ) ( not ( = ?auto_337686 ?auto_337692 ) ) ( not ( = ?auto_337687 ?auto_337688 ) ) ( not ( = ?auto_337687 ?auto_337689 ) ) ( not ( = ?auto_337687 ?auto_337690 ) ) ( not ( = ?auto_337687 ?auto_337691 ) ) ( not ( = ?auto_337687 ?auto_337692 ) ) ( not ( = ?auto_337688 ?auto_337689 ) ) ( not ( = ?auto_337688 ?auto_337690 ) ) ( not ( = ?auto_337688 ?auto_337691 ) ) ( not ( = ?auto_337688 ?auto_337692 ) ) ( not ( = ?auto_337689 ?auto_337690 ) ) ( not ( = ?auto_337689 ?auto_337691 ) ) ( not ( = ?auto_337689 ?auto_337692 ) ) ( not ( = ?auto_337690 ?auto_337691 ) ) ( not ( = ?auto_337690 ?auto_337692 ) ) ( not ( = ?auto_337691 ?auto_337692 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_337691 ?auto_337692 )
      ( !STACK ?auto_337691 ?auto_337690 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337706 - BLOCK
      ?auto_337707 - BLOCK
      ?auto_337708 - BLOCK
      ?auto_337709 - BLOCK
      ?auto_337710 - BLOCK
      ?auto_337711 - BLOCK
      ?auto_337712 - BLOCK
      ?auto_337713 - BLOCK
      ?auto_337714 - BLOCK
      ?auto_337715 - BLOCK
      ?auto_337716 - BLOCK
      ?auto_337717 - BLOCK
      ?auto_337718 - BLOCK
    )
    :vars
    (
      ?auto_337719 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_337717 ) ( ON ?auto_337718 ?auto_337719 ) ( CLEAR ?auto_337718 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_337706 ) ( ON ?auto_337707 ?auto_337706 ) ( ON ?auto_337708 ?auto_337707 ) ( ON ?auto_337709 ?auto_337708 ) ( ON ?auto_337710 ?auto_337709 ) ( ON ?auto_337711 ?auto_337710 ) ( ON ?auto_337712 ?auto_337711 ) ( ON ?auto_337713 ?auto_337712 ) ( ON ?auto_337714 ?auto_337713 ) ( ON ?auto_337715 ?auto_337714 ) ( ON ?auto_337716 ?auto_337715 ) ( ON ?auto_337717 ?auto_337716 ) ( not ( = ?auto_337706 ?auto_337707 ) ) ( not ( = ?auto_337706 ?auto_337708 ) ) ( not ( = ?auto_337706 ?auto_337709 ) ) ( not ( = ?auto_337706 ?auto_337710 ) ) ( not ( = ?auto_337706 ?auto_337711 ) ) ( not ( = ?auto_337706 ?auto_337712 ) ) ( not ( = ?auto_337706 ?auto_337713 ) ) ( not ( = ?auto_337706 ?auto_337714 ) ) ( not ( = ?auto_337706 ?auto_337715 ) ) ( not ( = ?auto_337706 ?auto_337716 ) ) ( not ( = ?auto_337706 ?auto_337717 ) ) ( not ( = ?auto_337706 ?auto_337718 ) ) ( not ( = ?auto_337706 ?auto_337719 ) ) ( not ( = ?auto_337707 ?auto_337708 ) ) ( not ( = ?auto_337707 ?auto_337709 ) ) ( not ( = ?auto_337707 ?auto_337710 ) ) ( not ( = ?auto_337707 ?auto_337711 ) ) ( not ( = ?auto_337707 ?auto_337712 ) ) ( not ( = ?auto_337707 ?auto_337713 ) ) ( not ( = ?auto_337707 ?auto_337714 ) ) ( not ( = ?auto_337707 ?auto_337715 ) ) ( not ( = ?auto_337707 ?auto_337716 ) ) ( not ( = ?auto_337707 ?auto_337717 ) ) ( not ( = ?auto_337707 ?auto_337718 ) ) ( not ( = ?auto_337707 ?auto_337719 ) ) ( not ( = ?auto_337708 ?auto_337709 ) ) ( not ( = ?auto_337708 ?auto_337710 ) ) ( not ( = ?auto_337708 ?auto_337711 ) ) ( not ( = ?auto_337708 ?auto_337712 ) ) ( not ( = ?auto_337708 ?auto_337713 ) ) ( not ( = ?auto_337708 ?auto_337714 ) ) ( not ( = ?auto_337708 ?auto_337715 ) ) ( not ( = ?auto_337708 ?auto_337716 ) ) ( not ( = ?auto_337708 ?auto_337717 ) ) ( not ( = ?auto_337708 ?auto_337718 ) ) ( not ( = ?auto_337708 ?auto_337719 ) ) ( not ( = ?auto_337709 ?auto_337710 ) ) ( not ( = ?auto_337709 ?auto_337711 ) ) ( not ( = ?auto_337709 ?auto_337712 ) ) ( not ( = ?auto_337709 ?auto_337713 ) ) ( not ( = ?auto_337709 ?auto_337714 ) ) ( not ( = ?auto_337709 ?auto_337715 ) ) ( not ( = ?auto_337709 ?auto_337716 ) ) ( not ( = ?auto_337709 ?auto_337717 ) ) ( not ( = ?auto_337709 ?auto_337718 ) ) ( not ( = ?auto_337709 ?auto_337719 ) ) ( not ( = ?auto_337710 ?auto_337711 ) ) ( not ( = ?auto_337710 ?auto_337712 ) ) ( not ( = ?auto_337710 ?auto_337713 ) ) ( not ( = ?auto_337710 ?auto_337714 ) ) ( not ( = ?auto_337710 ?auto_337715 ) ) ( not ( = ?auto_337710 ?auto_337716 ) ) ( not ( = ?auto_337710 ?auto_337717 ) ) ( not ( = ?auto_337710 ?auto_337718 ) ) ( not ( = ?auto_337710 ?auto_337719 ) ) ( not ( = ?auto_337711 ?auto_337712 ) ) ( not ( = ?auto_337711 ?auto_337713 ) ) ( not ( = ?auto_337711 ?auto_337714 ) ) ( not ( = ?auto_337711 ?auto_337715 ) ) ( not ( = ?auto_337711 ?auto_337716 ) ) ( not ( = ?auto_337711 ?auto_337717 ) ) ( not ( = ?auto_337711 ?auto_337718 ) ) ( not ( = ?auto_337711 ?auto_337719 ) ) ( not ( = ?auto_337712 ?auto_337713 ) ) ( not ( = ?auto_337712 ?auto_337714 ) ) ( not ( = ?auto_337712 ?auto_337715 ) ) ( not ( = ?auto_337712 ?auto_337716 ) ) ( not ( = ?auto_337712 ?auto_337717 ) ) ( not ( = ?auto_337712 ?auto_337718 ) ) ( not ( = ?auto_337712 ?auto_337719 ) ) ( not ( = ?auto_337713 ?auto_337714 ) ) ( not ( = ?auto_337713 ?auto_337715 ) ) ( not ( = ?auto_337713 ?auto_337716 ) ) ( not ( = ?auto_337713 ?auto_337717 ) ) ( not ( = ?auto_337713 ?auto_337718 ) ) ( not ( = ?auto_337713 ?auto_337719 ) ) ( not ( = ?auto_337714 ?auto_337715 ) ) ( not ( = ?auto_337714 ?auto_337716 ) ) ( not ( = ?auto_337714 ?auto_337717 ) ) ( not ( = ?auto_337714 ?auto_337718 ) ) ( not ( = ?auto_337714 ?auto_337719 ) ) ( not ( = ?auto_337715 ?auto_337716 ) ) ( not ( = ?auto_337715 ?auto_337717 ) ) ( not ( = ?auto_337715 ?auto_337718 ) ) ( not ( = ?auto_337715 ?auto_337719 ) ) ( not ( = ?auto_337716 ?auto_337717 ) ) ( not ( = ?auto_337716 ?auto_337718 ) ) ( not ( = ?auto_337716 ?auto_337719 ) ) ( not ( = ?auto_337717 ?auto_337718 ) ) ( not ( = ?auto_337717 ?auto_337719 ) ) ( not ( = ?auto_337718 ?auto_337719 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_337718 ?auto_337719 )
      ( !STACK ?auto_337718 ?auto_337717 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337733 - BLOCK
      ?auto_337734 - BLOCK
      ?auto_337735 - BLOCK
      ?auto_337736 - BLOCK
      ?auto_337737 - BLOCK
      ?auto_337738 - BLOCK
      ?auto_337739 - BLOCK
      ?auto_337740 - BLOCK
      ?auto_337741 - BLOCK
      ?auto_337742 - BLOCK
      ?auto_337743 - BLOCK
      ?auto_337744 - BLOCK
      ?auto_337745 - BLOCK
    )
    :vars
    (
      ?auto_337746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337745 ?auto_337746 ) ( ON-TABLE ?auto_337733 ) ( ON ?auto_337734 ?auto_337733 ) ( ON ?auto_337735 ?auto_337734 ) ( ON ?auto_337736 ?auto_337735 ) ( ON ?auto_337737 ?auto_337736 ) ( ON ?auto_337738 ?auto_337737 ) ( ON ?auto_337739 ?auto_337738 ) ( ON ?auto_337740 ?auto_337739 ) ( ON ?auto_337741 ?auto_337740 ) ( ON ?auto_337742 ?auto_337741 ) ( ON ?auto_337743 ?auto_337742 ) ( not ( = ?auto_337733 ?auto_337734 ) ) ( not ( = ?auto_337733 ?auto_337735 ) ) ( not ( = ?auto_337733 ?auto_337736 ) ) ( not ( = ?auto_337733 ?auto_337737 ) ) ( not ( = ?auto_337733 ?auto_337738 ) ) ( not ( = ?auto_337733 ?auto_337739 ) ) ( not ( = ?auto_337733 ?auto_337740 ) ) ( not ( = ?auto_337733 ?auto_337741 ) ) ( not ( = ?auto_337733 ?auto_337742 ) ) ( not ( = ?auto_337733 ?auto_337743 ) ) ( not ( = ?auto_337733 ?auto_337744 ) ) ( not ( = ?auto_337733 ?auto_337745 ) ) ( not ( = ?auto_337733 ?auto_337746 ) ) ( not ( = ?auto_337734 ?auto_337735 ) ) ( not ( = ?auto_337734 ?auto_337736 ) ) ( not ( = ?auto_337734 ?auto_337737 ) ) ( not ( = ?auto_337734 ?auto_337738 ) ) ( not ( = ?auto_337734 ?auto_337739 ) ) ( not ( = ?auto_337734 ?auto_337740 ) ) ( not ( = ?auto_337734 ?auto_337741 ) ) ( not ( = ?auto_337734 ?auto_337742 ) ) ( not ( = ?auto_337734 ?auto_337743 ) ) ( not ( = ?auto_337734 ?auto_337744 ) ) ( not ( = ?auto_337734 ?auto_337745 ) ) ( not ( = ?auto_337734 ?auto_337746 ) ) ( not ( = ?auto_337735 ?auto_337736 ) ) ( not ( = ?auto_337735 ?auto_337737 ) ) ( not ( = ?auto_337735 ?auto_337738 ) ) ( not ( = ?auto_337735 ?auto_337739 ) ) ( not ( = ?auto_337735 ?auto_337740 ) ) ( not ( = ?auto_337735 ?auto_337741 ) ) ( not ( = ?auto_337735 ?auto_337742 ) ) ( not ( = ?auto_337735 ?auto_337743 ) ) ( not ( = ?auto_337735 ?auto_337744 ) ) ( not ( = ?auto_337735 ?auto_337745 ) ) ( not ( = ?auto_337735 ?auto_337746 ) ) ( not ( = ?auto_337736 ?auto_337737 ) ) ( not ( = ?auto_337736 ?auto_337738 ) ) ( not ( = ?auto_337736 ?auto_337739 ) ) ( not ( = ?auto_337736 ?auto_337740 ) ) ( not ( = ?auto_337736 ?auto_337741 ) ) ( not ( = ?auto_337736 ?auto_337742 ) ) ( not ( = ?auto_337736 ?auto_337743 ) ) ( not ( = ?auto_337736 ?auto_337744 ) ) ( not ( = ?auto_337736 ?auto_337745 ) ) ( not ( = ?auto_337736 ?auto_337746 ) ) ( not ( = ?auto_337737 ?auto_337738 ) ) ( not ( = ?auto_337737 ?auto_337739 ) ) ( not ( = ?auto_337737 ?auto_337740 ) ) ( not ( = ?auto_337737 ?auto_337741 ) ) ( not ( = ?auto_337737 ?auto_337742 ) ) ( not ( = ?auto_337737 ?auto_337743 ) ) ( not ( = ?auto_337737 ?auto_337744 ) ) ( not ( = ?auto_337737 ?auto_337745 ) ) ( not ( = ?auto_337737 ?auto_337746 ) ) ( not ( = ?auto_337738 ?auto_337739 ) ) ( not ( = ?auto_337738 ?auto_337740 ) ) ( not ( = ?auto_337738 ?auto_337741 ) ) ( not ( = ?auto_337738 ?auto_337742 ) ) ( not ( = ?auto_337738 ?auto_337743 ) ) ( not ( = ?auto_337738 ?auto_337744 ) ) ( not ( = ?auto_337738 ?auto_337745 ) ) ( not ( = ?auto_337738 ?auto_337746 ) ) ( not ( = ?auto_337739 ?auto_337740 ) ) ( not ( = ?auto_337739 ?auto_337741 ) ) ( not ( = ?auto_337739 ?auto_337742 ) ) ( not ( = ?auto_337739 ?auto_337743 ) ) ( not ( = ?auto_337739 ?auto_337744 ) ) ( not ( = ?auto_337739 ?auto_337745 ) ) ( not ( = ?auto_337739 ?auto_337746 ) ) ( not ( = ?auto_337740 ?auto_337741 ) ) ( not ( = ?auto_337740 ?auto_337742 ) ) ( not ( = ?auto_337740 ?auto_337743 ) ) ( not ( = ?auto_337740 ?auto_337744 ) ) ( not ( = ?auto_337740 ?auto_337745 ) ) ( not ( = ?auto_337740 ?auto_337746 ) ) ( not ( = ?auto_337741 ?auto_337742 ) ) ( not ( = ?auto_337741 ?auto_337743 ) ) ( not ( = ?auto_337741 ?auto_337744 ) ) ( not ( = ?auto_337741 ?auto_337745 ) ) ( not ( = ?auto_337741 ?auto_337746 ) ) ( not ( = ?auto_337742 ?auto_337743 ) ) ( not ( = ?auto_337742 ?auto_337744 ) ) ( not ( = ?auto_337742 ?auto_337745 ) ) ( not ( = ?auto_337742 ?auto_337746 ) ) ( not ( = ?auto_337743 ?auto_337744 ) ) ( not ( = ?auto_337743 ?auto_337745 ) ) ( not ( = ?auto_337743 ?auto_337746 ) ) ( not ( = ?auto_337744 ?auto_337745 ) ) ( not ( = ?auto_337744 ?auto_337746 ) ) ( not ( = ?auto_337745 ?auto_337746 ) ) ( CLEAR ?auto_337743 ) ( ON ?auto_337744 ?auto_337745 ) ( CLEAR ?auto_337744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_337733 ?auto_337734 ?auto_337735 ?auto_337736 ?auto_337737 ?auto_337738 ?auto_337739 ?auto_337740 ?auto_337741 ?auto_337742 ?auto_337743 ?auto_337744 )
      ( MAKE-13PILE ?auto_337733 ?auto_337734 ?auto_337735 ?auto_337736 ?auto_337737 ?auto_337738 ?auto_337739 ?auto_337740 ?auto_337741 ?auto_337742 ?auto_337743 ?auto_337744 ?auto_337745 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337760 - BLOCK
      ?auto_337761 - BLOCK
      ?auto_337762 - BLOCK
      ?auto_337763 - BLOCK
      ?auto_337764 - BLOCK
      ?auto_337765 - BLOCK
      ?auto_337766 - BLOCK
      ?auto_337767 - BLOCK
      ?auto_337768 - BLOCK
      ?auto_337769 - BLOCK
      ?auto_337770 - BLOCK
      ?auto_337771 - BLOCK
      ?auto_337772 - BLOCK
    )
    :vars
    (
      ?auto_337773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337772 ?auto_337773 ) ( ON-TABLE ?auto_337760 ) ( ON ?auto_337761 ?auto_337760 ) ( ON ?auto_337762 ?auto_337761 ) ( ON ?auto_337763 ?auto_337762 ) ( ON ?auto_337764 ?auto_337763 ) ( ON ?auto_337765 ?auto_337764 ) ( ON ?auto_337766 ?auto_337765 ) ( ON ?auto_337767 ?auto_337766 ) ( ON ?auto_337768 ?auto_337767 ) ( ON ?auto_337769 ?auto_337768 ) ( ON ?auto_337770 ?auto_337769 ) ( not ( = ?auto_337760 ?auto_337761 ) ) ( not ( = ?auto_337760 ?auto_337762 ) ) ( not ( = ?auto_337760 ?auto_337763 ) ) ( not ( = ?auto_337760 ?auto_337764 ) ) ( not ( = ?auto_337760 ?auto_337765 ) ) ( not ( = ?auto_337760 ?auto_337766 ) ) ( not ( = ?auto_337760 ?auto_337767 ) ) ( not ( = ?auto_337760 ?auto_337768 ) ) ( not ( = ?auto_337760 ?auto_337769 ) ) ( not ( = ?auto_337760 ?auto_337770 ) ) ( not ( = ?auto_337760 ?auto_337771 ) ) ( not ( = ?auto_337760 ?auto_337772 ) ) ( not ( = ?auto_337760 ?auto_337773 ) ) ( not ( = ?auto_337761 ?auto_337762 ) ) ( not ( = ?auto_337761 ?auto_337763 ) ) ( not ( = ?auto_337761 ?auto_337764 ) ) ( not ( = ?auto_337761 ?auto_337765 ) ) ( not ( = ?auto_337761 ?auto_337766 ) ) ( not ( = ?auto_337761 ?auto_337767 ) ) ( not ( = ?auto_337761 ?auto_337768 ) ) ( not ( = ?auto_337761 ?auto_337769 ) ) ( not ( = ?auto_337761 ?auto_337770 ) ) ( not ( = ?auto_337761 ?auto_337771 ) ) ( not ( = ?auto_337761 ?auto_337772 ) ) ( not ( = ?auto_337761 ?auto_337773 ) ) ( not ( = ?auto_337762 ?auto_337763 ) ) ( not ( = ?auto_337762 ?auto_337764 ) ) ( not ( = ?auto_337762 ?auto_337765 ) ) ( not ( = ?auto_337762 ?auto_337766 ) ) ( not ( = ?auto_337762 ?auto_337767 ) ) ( not ( = ?auto_337762 ?auto_337768 ) ) ( not ( = ?auto_337762 ?auto_337769 ) ) ( not ( = ?auto_337762 ?auto_337770 ) ) ( not ( = ?auto_337762 ?auto_337771 ) ) ( not ( = ?auto_337762 ?auto_337772 ) ) ( not ( = ?auto_337762 ?auto_337773 ) ) ( not ( = ?auto_337763 ?auto_337764 ) ) ( not ( = ?auto_337763 ?auto_337765 ) ) ( not ( = ?auto_337763 ?auto_337766 ) ) ( not ( = ?auto_337763 ?auto_337767 ) ) ( not ( = ?auto_337763 ?auto_337768 ) ) ( not ( = ?auto_337763 ?auto_337769 ) ) ( not ( = ?auto_337763 ?auto_337770 ) ) ( not ( = ?auto_337763 ?auto_337771 ) ) ( not ( = ?auto_337763 ?auto_337772 ) ) ( not ( = ?auto_337763 ?auto_337773 ) ) ( not ( = ?auto_337764 ?auto_337765 ) ) ( not ( = ?auto_337764 ?auto_337766 ) ) ( not ( = ?auto_337764 ?auto_337767 ) ) ( not ( = ?auto_337764 ?auto_337768 ) ) ( not ( = ?auto_337764 ?auto_337769 ) ) ( not ( = ?auto_337764 ?auto_337770 ) ) ( not ( = ?auto_337764 ?auto_337771 ) ) ( not ( = ?auto_337764 ?auto_337772 ) ) ( not ( = ?auto_337764 ?auto_337773 ) ) ( not ( = ?auto_337765 ?auto_337766 ) ) ( not ( = ?auto_337765 ?auto_337767 ) ) ( not ( = ?auto_337765 ?auto_337768 ) ) ( not ( = ?auto_337765 ?auto_337769 ) ) ( not ( = ?auto_337765 ?auto_337770 ) ) ( not ( = ?auto_337765 ?auto_337771 ) ) ( not ( = ?auto_337765 ?auto_337772 ) ) ( not ( = ?auto_337765 ?auto_337773 ) ) ( not ( = ?auto_337766 ?auto_337767 ) ) ( not ( = ?auto_337766 ?auto_337768 ) ) ( not ( = ?auto_337766 ?auto_337769 ) ) ( not ( = ?auto_337766 ?auto_337770 ) ) ( not ( = ?auto_337766 ?auto_337771 ) ) ( not ( = ?auto_337766 ?auto_337772 ) ) ( not ( = ?auto_337766 ?auto_337773 ) ) ( not ( = ?auto_337767 ?auto_337768 ) ) ( not ( = ?auto_337767 ?auto_337769 ) ) ( not ( = ?auto_337767 ?auto_337770 ) ) ( not ( = ?auto_337767 ?auto_337771 ) ) ( not ( = ?auto_337767 ?auto_337772 ) ) ( not ( = ?auto_337767 ?auto_337773 ) ) ( not ( = ?auto_337768 ?auto_337769 ) ) ( not ( = ?auto_337768 ?auto_337770 ) ) ( not ( = ?auto_337768 ?auto_337771 ) ) ( not ( = ?auto_337768 ?auto_337772 ) ) ( not ( = ?auto_337768 ?auto_337773 ) ) ( not ( = ?auto_337769 ?auto_337770 ) ) ( not ( = ?auto_337769 ?auto_337771 ) ) ( not ( = ?auto_337769 ?auto_337772 ) ) ( not ( = ?auto_337769 ?auto_337773 ) ) ( not ( = ?auto_337770 ?auto_337771 ) ) ( not ( = ?auto_337770 ?auto_337772 ) ) ( not ( = ?auto_337770 ?auto_337773 ) ) ( not ( = ?auto_337771 ?auto_337772 ) ) ( not ( = ?auto_337771 ?auto_337773 ) ) ( not ( = ?auto_337772 ?auto_337773 ) ) ( CLEAR ?auto_337770 ) ( ON ?auto_337771 ?auto_337772 ) ( CLEAR ?auto_337771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_337760 ?auto_337761 ?auto_337762 ?auto_337763 ?auto_337764 ?auto_337765 ?auto_337766 ?auto_337767 ?auto_337768 ?auto_337769 ?auto_337770 ?auto_337771 )
      ( MAKE-13PILE ?auto_337760 ?auto_337761 ?auto_337762 ?auto_337763 ?auto_337764 ?auto_337765 ?auto_337766 ?auto_337767 ?auto_337768 ?auto_337769 ?auto_337770 ?auto_337771 ?auto_337772 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337787 - BLOCK
      ?auto_337788 - BLOCK
      ?auto_337789 - BLOCK
      ?auto_337790 - BLOCK
      ?auto_337791 - BLOCK
      ?auto_337792 - BLOCK
      ?auto_337793 - BLOCK
      ?auto_337794 - BLOCK
      ?auto_337795 - BLOCK
      ?auto_337796 - BLOCK
      ?auto_337797 - BLOCK
      ?auto_337798 - BLOCK
      ?auto_337799 - BLOCK
    )
    :vars
    (
      ?auto_337800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337799 ?auto_337800 ) ( ON-TABLE ?auto_337787 ) ( ON ?auto_337788 ?auto_337787 ) ( ON ?auto_337789 ?auto_337788 ) ( ON ?auto_337790 ?auto_337789 ) ( ON ?auto_337791 ?auto_337790 ) ( ON ?auto_337792 ?auto_337791 ) ( ON ?auto_337793 ?auto_337792 ) ( ON ?auto_337794 ?auto_337793 ) ( ON ?auto_337795 ?auto_337794 ) ( ON ?auto_337796 ?auto_337795 ) ( not ( = ?auto_337787 ?auto_337788 ) ) ( not ( = ?auto_337787 ?auto_337789 ) ) ( not ( = ?auto_337787 ?auto_337790 ) ) ( not ( = ?auto_337787 ?auto_337791 ) ) ( not ( = ?auto_337787 ?auto_337792 ) ) ( not ( = ?auto_337787 ?auto_337793 ) ) ( not ( = ?auto_337787 ?auto_337794 ) ) ( not ( = ?auto_337787 ?auto_337795 ) ) ( not ( = ?auto_337787 ?auto_337796 ) ) ( not ( = ?auto_337787 ?auto_337797 ) ) ( not ( = ?auto_337787 ?auto_337798 ) ) ( not ( = ?auto_337787 ?auto_337799 ) ) ( not ( = ?auto_337787 ?auto_337800 ) ) ( not ( = ?auto_337788 ?auto_337789 ) ) ( not ( = ?auto_337788 ?auto_337790 ) ) ( not ( = ?auto_337788 ?auto_337791 ) ) ( not ( = ?auto_337788 ?auto_337792 ) ) ( not ( = ?auto_337788 ?auto_337793 ) ) ( not ( = ?auto_337788 ?auto_337794 ) ) ( not ( = ?auto_337788 ?auto_337795 ) ) ( not ( = ?auto_337788 ?auto_337796 ) ) ( not ( = ?auto_337788 ?auto_337797 ) ) ( not ( = ?auto_337788 ?auto_337798 ) ) ( not ( = ?auto_337788 ?auto_337799 ) ) ( not ( = ?auto_337788 ?auto_337800 ) ) ( not ( = ?auto_337789 ?auto_337790 ) ) ( not ( = ?auto_337789 ?auto_337791 ) ) ( not ( = ?auto_337789 ?auto_337792 ) ) ( not ( = ?auto_337789 ?auto_337793 ) ) ( not ( = ?auto_337789 ?auto_337794 ) ) ( not ( = ?auto_337789 ?auto_337795 ) ) ( not ( = ?auto_337789 ?auto_337796 ) ) ( not ( = ?auto_337789 ?auto_337797 ) ) ( not ( = ?auto_337789 ?auto_337798 ) ) ( not ( = ?auto_337789 ?auto_337799 ) ) ( not ( = ?auto_337789 ?auto_337800 ) ) ( not ( = ?auto_337790 ?auto_337791 ) ) ( not ( = ?auto_337790 ?auto_337792 ) ) ( not ( = ?auto_337790 ?auto_337793 ) ) ( not ( = ?auto_337790 ?auto_337794 ) ) ( not ( = ?auto_337790 ?auto_337795 ) ) ( not ( = ?auto_337790 ?auto_337796 ) ) ( not ( = ?auto_337790 ?auto_337797 ) ) ( not ( = ?auto_337790 ?auto_337798 ) ) ( not ( = ?auto_337790 ?auto_337799 ) ) ( not ( = ?auto_337790 ?auto_337800 ) ) ( not ( = ?auto_337791 ?auto_337792 ) ) ( not ( = ?auto_337791 ?auto_337793 ) ) ( not ( = ?auto_337791 ?auto_337794 ) ) ( not ( = ?auto_337791 ?auto_337795 ) ) ( not ( = ?auto_337791 ?auto_337796 ) ) ( not ( = ?auto_337791 ?auto_337797 ) ) ( not ( = ?auto_337791 ?auto_337798 ) ) ( not ( = ?auto_337791 ?auto_337799 ) ) ( not ( = ?auto_337791 ?auto_337800 ) ) ( not ( = ?auto_337792 ?auto_337793 ) ) ( not ( = ?auto_337792 ?auto_337794 ) ) ( not ( = ?auto_337792 ?auto_337795 ) ) ( not ( = ?auto_337792 ?auto_337796 ) ) ( not ( = ?auto_337792 ?auto_337797 ) ) ( not ( = ?auto_337792 ?auto_337798 ) ) ( not ( = ?auto_337792 ?auto_337799 ) ) ( not ( = ?auto_337792 ?auto_337800 ) ) ( not ( = ?auto_337793 ?auto_337794 ) ) ( not ( = ?auto_337793 ?auto_337795 ) ) ( not ( = ?auto_337793 ?auto_337796 ) ) ( not ( = ?auto_337793 ?auto_337797 ) ) ( not ( = ?auto_337793 ?auto_337798 ) ) ( not ( = ?auto_337793 ?auto_337799 ) ) ( not ( = ?auto_337793 ?auto_337800 ) ) ( not ( = ?auto_337794 ?auto_337795 ) ) ( not ( = ?auto_337794 ?auto_337796 ) ) ( not ( = ?auto_337794 ?auto_337797 ) ) ( not ( = ?auto_337794 ?auto_337798 ) ) ( not ( = ?auto_337794 ?auto_337799 ) ) ( not ( = ?auto_337794 ?auto_337800 ) ) ( not ( = ?auto_337795 ?auto_337796 ) ) ( not ( = ?auto_337795 ?auto_337797 ) ) ( not ( = ?auto_337795 ?auto_337798 ) ) ( not ( = ?auto_337795 ?auto_337799 ) ) ( not ( = ?auto_337795 ?auto_337800 ) ) ( not ( = ?auto_337796 ?auto_337797 ) ) ( not ( = ?auto_337796 ?auto_337798 ) ) ( not ( = ?auto_337796 ?auto_337799 ) ) ( not ( = ?auto_337796 ?auto_337800 ) ) ( not ( = ?auto_337797 ?auto_337798 ) ) ( not ( = ?auto_337797 ?auto_337799 ) ) ( not ( = ?auto_337797 ?auto_337800 ) ) ( not ( = ?auto_337798 ?auto_337799 ) ) ( not ( = ?auto_337798 ?auto_337800 ) ) ( not ( = ?auto_337799 ?auto_337800 ) ) ( ON ?auto_337798 ?auto_337799 ) ( CLEAR ?auto_337796 ) ( ON ?auto_337797 ?auto_337798 ) ( CLEAR ?auto_337797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_337787 ?auto_337788 ?auto_337789 ?auto_337790 ?auto_337791 ?auto_337792 ?auto_337793 ?auto_337794 ?auto_337795 ?auto_337796 ?auto_337797 )
      ( MAKE-13PILE ?auto_337787 ?auto_337788 ?auto_337789 ?auto_337790 ?auto_337791 ?auto_337792 ?auto_337793 ?auto_337794 ?auto_337795 ?auto_337796 ?auto_337797 ?auto_337798 ?auto_337799 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337814 - BLOCK
      ?auto_337815 - BLOCK
      ?auto_337816 - BLOCK
      ?auto_337817 - BLOCK
      ?auto_337818 - BLOCK
      ?auto_337819 - BLOCK
      ?auto_337820 - BLOCK
      ?auto_337821 - BLOCK
      ?auto_337822 - BLOCK
      ?auto_337823 - BLOCK
      ?auto_337824 - BLOCK
      ?auto_337825 - BLOCK
      ?auto_337826 - BLOCK
    )
    :vars
    (
      ?auto_337827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337826 ?auto_337827 ) ( ON-TABLE ?auto_337814 ) ( ON ?auto_337815 ?auto_337814 ) ( ON ?auto_337816 ?auto_337815 ) ( ON ?auto_337817 ?auto_337816 ) ( ON ?auto_337818 ?auto_337817 ) ( ON ?auto_337819 ?auto_337818 ) ( ON ?auto_337820 ?auto_337819 ) ( ON ?auto_337821 ?auto_337820 ) ( ON ?auto_337822 ?auto_337821 ) ( ON ?auto_337823 ?auto_337822 ) ( not ( = ?auto_337814 ?auto_337815 ) ) ( not ( = ?auto_337814 ?auto_337816 ) ) ( not ( = ?auto_337814 ?auto_337817 ) ) ( not ( = ?auto_337814 ?auto_337818 ) ) ( not ( = ?auto_337814 ?auto_337819 ) ) ( not ( = ?auto_337814 ?auto_337820 ) ) ( not ( = ?auto_337814 ?auto_337821 ) ) ( not ( = ?auto_337814 ?auto_337822 ) ) ( not ( = ?auto_337814 ?auto_337823 ) ) ( not ( = ?auto_337814 ?auto_337824 ) ) ( not ( = ?auto_337814 ?auto_337825 ) ) ( not ( = ?auto_337814 ?auto_337826 ) ) ( not ( = ?auto_337814 ?auto_337827 ) ) ( not ( = ?auto_337815 ?auto_337816 ) ) ( not ( = ?auto_337815 ?auto_337817 ) ) ( not ( = ?auto_337815 ?auto_337818 ) ) ( not ( = ?auto_337815 ?auto_337819 ) ) ( not ( = ?auto_337815 ?auto_337820 ) ) ( not ( = ?auto_337815 ?auto_337821 ) ) ( not ( = ?auto_337815 ?auto_337822 ) ) ( not ( = ?auto_337815 ?auto_337823 ) ) ( not ( = ?auto_337815 ?auto_337824 ) ) ( not ( = ?auto_337815 ?auto_337825 ) ) ( not ( = ?auto_337815 ?auto_337826 ) ) ( not ( = ?auto_337815 ?auto_337827 ) ) ( not ( = ?auto_337816 ?auto_337817 ) ) ( not ( = ?auto_337816 ?auto_337818 ) ) ( not ( = ?auto_337816 ?auto_337819 ) ) ( not ( = ?auto_337816 ?auto_337820 ) ) ( not ( = ?auto_337816 ?auto_337821 ) ) ( not ( = ?auto_337816 ?auto_337822 ) ) ( not ( = ?auto_337816 ?auto_337823 ) ) ( not ( = ?auto_337816 ?auto_337824 ) ) ( not ( = ?auto_337816 ?auto_337825 ) ) ( not ( = ?auto_337816 ?auto_337826 ) ) ( not ( = ?auto_337816 ?auto_337827 ) ) ( not ( = ?auto_337817 ?auto_337818 ) ) ( not ( = ?auto_337817 ?auto_337819 ) ) ( not ( = ?auto_337817 ?auto_337820 ) ) ( not ( = ?auto_337817 ?auto_337821 ) ) ( not ( = ?auto_337817 ?auto_337822 ) ) ( not ( = ?auto_337817 ?auto_337823 ) ) ( not ( = ?auto_337817 ?auto_337824 ) ) ( not ( = ?auto_337817 ?auto_337825 ) ) ( not ( = ?auto_337817 ?auto_337826 ) ) ( not ( = ?auto_337817 ?auto_337827 ) ) ( not ( = ?auto_337818 ?auto_337819 ) ) ( not ( = ?auto_337818 ?auto_337820 ) ) ( not ( = ?auto_337818 ?auto_337821 ) ) ( not ( = ?auto_337818 ?auto_337822 ) ) ( not ( = ?auto_337818 ?auto_337823 ) ) ( not ( = ?auto_337818 ?auto_337824 ) ) ( not ( = ?auto_337818 ?auto_337825 ) ) ( not ( = ?auto_337818 ?auto_337826 ) ) ( not ( = ?auto_337818 ?auto_337827 ) ) ( not ( = ?auto_337819 ?auto_337820 ) ) ( not ( = ?auto_337819 ?auto_337821 ) ) ( not ( = ?auto_337819 ?auto_337822 ) ) ( not ( = ?auto_337819 ?auto_337823 ) ) ( not ( = ?auto_337819 ?auto_337824 ) ) ( not ( = ?auto_337819 ?auto_337825 ) ) ( not ( = ?auto_337819 ?auto_337826 ) ) ( not ( = ?auto_337819 ?auto_337827 ) ) ( not ( = ?auto_337820 ?auto_337821 ) ) ( not ( = ?auto_337820 ?auto_337822 ) ) ( not ( = ?auto_337820 ?auto_337823 ) ) ( not ( = ?auto_337820 ?auto_337824 ) ) ( not ( = ?auto_337820 ?auto_337825 ) ) ( not ( = ?auto_337820 ?auto_337826 ) ) ( not ( = ?auto_337820 ?auto_337827 ) ) ( not ( = ?auto_337821 ?auto_337822 ) ) ( not ( = ?auto_337821 ?auto_337823 ) ) ( not ( = ?auto_337821 ?auto_337824 ) ) ( not ( = ?auto_337821 ?auto_337825 ) ) ( not ( = ?auto_337821 ?auto_337826 ) ) ( not ( = ?auto_337821 ?auto_337827 ) ) ( not ( = ?auto_337822 ?auto_337823 ) ) ( not ( = ?auto_337822 ?auto_337824 ) ) ( not ( = ?auto_337822 ?auto_337825 ) ) ( not ( = ?auto_337822 ?auto_337826 ) ) ( not ( = ?auto_337822 ?auto_337827 ) ) ( not ( = ?auto_337823 ?auto_337824 ) ) ( not ( = ?auto_337823 ?auto_337825 ) ) ( not ( = ?auto_337823 ?auto_337826 ) ) ( not ( = ?auto_337823 ?auto_337827 ) ) ( not ( = ?auto_337824 ?auto_337825 ) ) ( not ( = ?auto_337824 ?auto_337826 ) ) ( not ( = ?auto_337824 ?auto_337827 ) ) ( not ( = ?auto_337825 ?auto_337826 ) ) ( not ( = ?auto_337825 ?auto_337827 ) ) ( not ( = ?auto_337826 ?auto_337827 ) ) ( ON ?auto_337825 ?auto_337826 ) ( CLEAR ?auto_337823 ) ( ON ?auto_337824 ?auto_337825 ) ( CLEAR ?auto_337824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_337814 ?auto_337815 ?auto_337816 ?auto_337817 ?auto_337818 ?auto_337819 ?auto_337820 ?auto_337821 ?auto_337822 ?auto_337823 ?auto_337824 )
      ( MAKE-13PILE ?auto_337814 ?auto_337815 ?auto_337816 ?auto_337817 ?auto_337818 ?auto_337819 ?auto_337820 ?auto_337821 ?auto_337822 ?auto_337823 ?auto_337824 ?auto_337825 ?auto_337826 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337841 - BLOCK
      ?auto_337842 - BLOCK
      ?auto_337843 - BLOCK
      ?auto_337844 - BLOCK
      ?auto_337845 - BLOCK
      ?auto_337846 - BLOCK
      ?auto_337847 - BLOCK
      ?auto_337848 - BLOCK
      ?auto_337849 - BLOCK
      ?auto_337850 - BLOCK
      ?auto_337851 - BLOCK
      ?auto_337852 - BLOCK
      ?auto_337853 - BLOCK
    )
    :vars
    (
      ?auto_337854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337853 ?auto_337854 ) ( ON-TABLE ?auto_337841 ) ( ON ?auto_337842 ?auto_337841 ) ( ON ?auto_337843 ?auto_337842 ) ( ON ?auto_337844 ?auto_337843 ) ( ON ?auto_337845 ?auto_337844 ) ( ON ?auto_337846 ?auto_337845 ) ( ON ?auto_337847 ?auto_337846 ) ( ON ?auto_337848 ?auto_337847 ) ( ON ?auto_337849 ?auto_337848 ) ( not ( = ?auto_337841 ?auto_337842 ) ) ( not ( = ?auto_337841 ?auto_337843 ) ) ( not ( = ?auto_337841 ?auto_337844 ) ) ( not ( = ?auto_337841 ?auto_337845 ) ) ( not ( = ?auto_337841 ?auto_337846 ) ) ( not ( = ?auto_337841 ?auto_337847 ) ) ( not ( = ?auto_337841 ?auto_337848 ) ) ( not ( = ?auto_337841 ?auto_337849 ) ) ( not ( = ?auto_337841 ?auto_337850 ) ) ( not ( = ?auto_337841 ?auto_337851 ) ) ( not ( = ?auto_337841 ?auto_337852 ) ) ( not ( = ?auto_337841 ?auto_337853 ) ) ( not ( = ?auto_337841 ?auto_337854 ) ) ( not ( = ?auto_337842 ?auto_337843 ) ) ( not ( = ?auto_337842 ?auto_337844 ) ) ( not ( = ?auto_337842 ?auto_337845 ) ) ( not ( = ?auto_337842 ?auto_337846 ) ) ( not ( = ?auto_337842 ?auto_337847 ) ) ( not ( = ?auto_337842 ?auto_337848 ) ) ( not ( = ?auto_337842 ?auto_337849 ) ) ( not ( = ?auto_337842 ?auto_337850 ) ) ( not ( = ?auto_337842 ?auto_337851 ) ) ( not ( = ?auto_337842 ?auto_337852 ) ) ( not ( = ?auto_337842 ?auto_337853 ) ) ( not ( = ?auto_337842 ?auto_337854 ) ) ( not ( = ?auto_337843 ?auto_337844 ) ) ( not ( = ?auto_337843 ?auto_337845 ) ) ( not ( = ?auto_337843 ?auto_337846 ) ) ( not ( = ?auto_337843 ?auto_337847 ) ) ( not ( = ?auto_337843 ?auto_337848 ) ) ( not ( = ?auto_337843 ?auto_337849 ) ) ( not ( = ?auto_337843 ?auto_337850 ) ) ( not ( = ?auto_337843 ?auto_337851 ) ) ( not ( = ?auto_337843 ?auto_337852 ) ) ( not ( = ?auto_337843 ?auto_337853 ) ) ( not ( = ?auto_337843 ?auto_337854 ) ) ( not ( = ?auto_337844 ?auto_337845 ) ) ( not ( = ?auto_337844 ?auto_337846 ) ) ( not ( = ?auto_337844 ?auto_337847 ) ) ( not ( = ?auto_337844 ?auto_337848 ) ) ( not ( = ?auto_337844 ?auto_337849 ) ) ( not ( = ?auto_337844 ?auto_337850 ) ) ( not ( = ?auto_337844 ?auto_337851 ) ) ( not ( = ?auto_337844 ?auto_337852 ) ) ( not ( = ?auto_337844 ?auto_337853 ) ) ( not ( = ?auto_337844 ?auto_337854 ) ) ( not ( = ?auto_337845 ?auto_337846 ) ) ( not ( = ?auto_337845 ?auto_337847 ) ) ( not ( = ?auto_337845 ?auto_337848 ) ) ( not ( = ?auto_337845 ?auto_337849 ) ) ( not ( = ?auto_337845 ?auto_337850 ) ) ( not ( = ?auto_337845 ?auto_337851 ) ) ( not ( = ?auto_337845 ?auto_337852 ) ) ( not ( = ?auto_337845 ?auto_337853 ) ) ( not ( = ?auto_337845 ?auto_337854 ) ) ( not ( = ?auto_337846 ?auto_337847 ) ) ( not ( = ?auto_337846 ?auto_337848 ) ) ( not ( = ?auto_337846 ?auto_337849 ) ) ( not ( = ?auto_337846 ?auto_337850 ) ) ( not ( = ?auto_337846 ?auto_337851 ) ) ( not ( = ?auto_337846 ?auto_337852 ) ) ( not ( = ?auto_337846 ?auto_337853 ) ) ( not ( = ?auto_337846 ?auto_337854 ) ) ( not ( = ?auto_337847 ?auto_337848 ) ) ( not ( = ?auto_337847 ?auto_337849 ) ) ( not ( = ?auto_337847 ?auto_337850 ) ) ( not ( = ?auto_337847 ?auto_337851 ) ) ( not ( = ?auto_337847 ?auto_337852 ) ) ( not ( = ?auto_337847 ?auto_337853 ) ) ( not ( = ?auto_337847 ?auto_337854 ) ) ( not ( = ?auto_337848 ?auto_337849 ) ) ( not ( = ?auto_337848 ?auto_337850 ) ) ( not ( = ?auto_337848 ?auto_337851 ) ) ( not ( = ?auto_337848 ?auto_337852 ) ) ( not ( = ?auto_337848 ?auto_337853 ) ) ( not ( = ?auto_337848 ?auto_337854 ) ) ( not ( = ?auto_337849 ?auto_337850 ) ) ( not ( = ?auto_337849 ?auto_337851 ) ) ( not ( = ?auto_337849 ?auto_337852 ) ) ( not ( = ?auto_337849 ?auto_337853 ) ) ( not ( = ?auto_337849 ?auto_337854 ) ) ( not ( = ?auto_337850 ?auto_337851 ) ) ( not ( = ?auto_337850 ?auto_337852 ) ) ( not ( = ?auto_337850 ?auto_337853 ) ) ( not ( = ?auto_337850 ?auto_337854 ) ) ( not ( = ?auto_337851 ?auto_337852 ) ) ( not ( = ?auto_337851 ?auto_337853 ) ) ( not ( = ?auto_337851 ?auto_337854 ) ) ( not ( = ?auto_337852 ?auto_337853 ) ) ( not ( = ?auto_337852 ?auto_337854 ) ) ( not ( = ?auto_337853 ?auto_337854 ) ) ( ON ?auto_337852 ?auto_337853 ) ( ON ?auto_337851 ?auto_337852 ) ( CLEAR ?auto_337849 ) ( ON ?auto_337850 ?auto_337851 ) ( CLEAR ?auto_337850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_337841 ?auto_337842 ?auto_337843 ?auto_337844 ?auto_337845 ?auto_337846 ?auto_337847 ?auto_337848 ?auto_337849 ?auto_337850 )
      ( MAKE-13PILE ?auto_337841 ?auto_337842 ?auto_337843 ?auto_337844 ?auto_337845 ?auto_337846 ?auto_337847 ?auto_337848 ?auto_337849 ?auto_337850 ?auto_337851 ?auto_337852 ?auto_337853 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337868 - BLOCK
      ?auto_337869 - BLOCK
      ?auto_337870 - BLOCK
      ?auto_337871 - BLOCK
      ?auto_337872 - BLOCK
      ?auto_337873 - BLOCK
      ?auto_337874 - BLOCK
      ?auto_337875 - BLOCK
      ?auto_337876 - BLOCK
      ?auto_337877 - BLOCK
      ?auto_337878 - BLOCK
      ?auto_337879 - BLOCK
      ?auto_337880 - BLOCK
    )
    :vars
    (
      ?auto_337881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337880 ?auto_337881 ) ( ON-TABLE ?auto_337868 ) ( ON ?auto_337869 ?auto_337868 ) ( ON ?auto_337870 ?auto_337869 ) ( ON ?auto_337871 ?auto_337870 ) ( ON ?auto_337872 ?auto_337871 ) ( ON ?auto_337873 ?auto_337872 ) ( ON ?auto_337874 ?auto_337873 ) ( ON ?auto_337875 ?auto_337874 ) ( ON ?auto_337876 ?auto_337875 ) ( not ( = ?auto_337868 ?auto_337869 ) ) ( not ( = ?auto_337868 ?auto_337870 ) ) ( not ( = ?auto_337868 ?auto_337871 ) ) ( not ( = ?auto_337868 ?auto_337872 ) ) ( not ( = ?auto_337868 ?auto_337873 ) ) ( not ( = ?auto_337868 ?auto_337874 ) ) ( not ( = ?auto_337868 ?auto_337875 ) ) ( not ( = ?auto_337868 ?auto_337876 ) ) ( not ( = ?auto_337868 ?auto_337877 ) ) ( not ( = ?auto_337868 ?auto_337878 ) ) ( not ( = ?auto_337868 ?auto_337879 ) ) ( not ( = ?auto_337868 ?auto_337880 ) ) ( not ( = ?auto_337868 ?auto_337881 ) ) ( not ( = ?auto_337869 ?auto_337870 ) ) ( not ( = ?auto_337869 ?auto_337871 ) ) ( not ( = ?auto_337869 ?auto_337872 ) ) ( not ( = ?auto_337869 ?auto_337873 ) ) ( not ( = ?auto_337869 ?auto_337874 ) ) ( not ( = ?auto_337869 ?auto_337875 ) ) ( not ( = ?auto_337869 ?auto_337876 ) ) ( not ( = ?auto_337869 ?auto_337877 ) ) ( not ( = ?auto_337869 ?auto_337878 ) ) ( not ( = ?auto_337869 ?auto_337879 ) ) ( not ( = ?auto_337869 ?auto_337880 ) ) ( not ( = ?auto_337869 ?auto_337881 ) ) ( not ( = ?auto_337870 ?auto_337871 ) ) ( not ( = ?auto_337870 ?auto_337872 ) ) ( not ( = ?auto_337870 ?auto_337873 ) ) ( not ( = ?auto_337870 ?auto_337874 ) ) ( not ( = ?auto_337870 ?auto_337875 ) ) ( not ( = ?auto_337870 ?auto_337876 ) ) ( not ( = ?auto_337870 ?auto_337877 ) ) ( not ( = ?auto_337870 ?auto_337878 ) ) ( not ( = ?auto_337870 ?auto_337879 ) ) ( not ( = ?auto_337870 ?auto_337880 ) ) ( not ( = ?auto_337870 ?auto_337881 ) ) ( not ( = ?auto_337871 ?auto_337872 ) ) ( not ( = ?auto_337871 ?auto_337873 ) ) ( not ( = ?auto_337871 ?auto_337874 ) ) ( not ( = ?auto_337871 ?auto_337875 ) ) ( not ( = ?auto_337871 ?auto_337876 ) ) ( not ( = ?auto_337871 ?auto_337877 ) ) ( not ( = ?auto_337871 ?auto_337878 ) ) ( not ( = ?auto_337871 ?auto_337879 ) ) ( not ( = ?auto_337871 ?auto_337880 ) ) ( not ( = ?auto_337871 ?auto_337881 ) ) ( not ( = ?auto_337872 ?auto_337873 ) ) ( not ( = ?auto_337872 ?auto_337874 ) ) ( not ( = ?auto_337872 ?auto_337875 ) ) ( not ( = ?auto_337872 ?auto_337876 ) ) ( not ( = ?auto_337872 ?auto_337877 ) ) ( not ( = ?auto_337872 ?auto_337878 ) ) ( not ( = ?auto_337872 ?auto_337879 ) ) ( not ( = ?auto_337872 ?auto_337880 ) ) ( not ( = ?auto_337872 ?auto_337881 ) ) ( not ( = ?auto_337873 ?auto_337874 ) ) ( not ( = ?auto_337873 ?auto_337875 ) ) ( not ( = ?auto_337873 ?auto_337876 ) ) ( not ( = ?auto_337873 ?auto_337877 ) ) ( not ( = ?auto_337873 ?auto_337878 ) ) ( not ( = ?auto_337873 ?auto_337879 ) ) ( not ( = ?auto_337873 ?auto_337880 ) ) ( not ( = ?auto_337873 ?auto_337881 ) ) ( not ( = ?auto_337874 ?auto_337875 ) ) ( not ( = ?auto_337874 ?auto_337876 ) ) ( not ( = ?auto_337874 ?auto_337877 ) ) ( not ( = ?auto_337874 ?auto_337878 ) ) ( not ( = ?auto_337874 ?auto_337879 ) ) ( not ( = ?auto_337874 ?auto_337880 ) ) ( not ( = ?auto_337874 ?auto_337881 ) ) ( not ( = ?auto_337875 ?auto_337876 ) ) ( not ( = ?auto_337875 ?auto_337877 ) ) ( not ( = ?auto_337875 ?auto_337878 ) ) ( not ( = ?auto_337875 ?auto_337879 ) ) ( not ( = ?auto_337875 ?auto_337880 ) ) ( not ( = ?auto_337875 ?auto_337881 ) ) ( not ( = ?auto_337876 ?auto_337877 ) ) ( not ( = ?auto_337876 ?auto_337878 ) ) ( not ( = ?auto_337876 ?auto_337879 ) ) ( not ( = ?auto_337876 ?auto_337880 ) ) ( not ( = ?auto_337876 ?auto_337881 ) ) ( not ( = ?auto_337877 ?auto_337878 ) ) ( not ( = ?auto_337877 ?auto_337879 ) ) ( not ( = ?auto_337877 ?auto_337880 ) ) ( not ( = ?auto_337877 ?auto_337881 ) ) ( not ( = ?auto_337878 ?auto_337879 ) ) ( not ( = ?auto_337878 ?auto_337880 ) ) ( not ( = ?auto_337878 ?auto_337881 ) ) ( not ( = ?auto_337879 ?auto_337880 ) ) ( not ( = ?auto_337879 ?auto_337881 ) ) ( not ( = ?auto_337880 ?auto_337881 ) ) ( ON ?auto_337879 ?auto_337880 ) ( ON ?auto_337878 ?auto_337879 ) ( CLEAR ?auto_337876 ) ( ON ?auto_337877 ?auto_337878 ) ( CLEAR ?auto_337877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_337868 ?auto_337869 ?auto_337870 ?auto_337871 ?auto_337872 ?auto_337873 ?auto_337874 ?auto_337875 ?auto_337876 ?auto_337877 )
      ( MAKE-13PILE ?auto_337868 ?auto_337869 ?auto_337870 ?auto_337871 ?auto_337872 ?auto_337873 ?auto_337874 ?auto_337875 ?auto_337876 ?auto_337877 ?auto_337878 ?auto_337879 ?auto_337880 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337895 - BLOCK
      ?auto_337896 - BLOCK
      ?auto_337897 - BLOCK
      ?auto_337898 - BLOCK
      ?auto_337899 - BLOCK
      ?auto_337900 - BLOCK
      ?auto_337901 - BLOCK
      ?auto_337902 - BLOCK
      ?auto_337903 - BLOCK
      ?auto_337904 - BLOCK
      ?auto_337905 - BLOCK
      ?auto_337906 - BLOCK
      ?auto_337907 - BLOCK
    )
    :vars
    (
      ?auto_337908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337907 ?auto_337908 ) ( ON-TABLE ?auto_337895 ) ( ON ?auto_337896 ?auto_337895 ) ( ON ?auto_337897 ?auto_337896 ) ( ON ?auto_337898 ?auto_337897 ) ( ON ?auto_337899 ?auto_337898 ) ( ON ?auto_337900 ?auto_337899 ) ( ON ?auto_337901 ?auto_337900 ) ( ON ?auto_337902 ?auto_337901 ) ( not ( = ?auto_337895 ?auto_337896 ) ) ( not ( = ?auto_337895 ?auto_337897 ) ) ( not ( = ?auto_337895 ?auto_337898 ) ) ( not ( = ?auto_337895 ?auto_337899 ) ) ( not ( = ?auto_337895 ?auto_337900 ) ) ( not ( = ?auto_337895 ?auto_337901 ) ) ( not ( = ?auto_337895 ?auto_337902 ) ) ( not ( = ?auto_337895 ?auto_337903 ) ) ( not ( = ?auto_337895 ?auto_337904 ) ) ( not ( = ?auto_337895 ?auto_337905 ) ) ( not ( = ?auto_337895 ?auto_337906 ) ) ( not ( = ?auto_337895 ?auto_337907 ) ) ( not ( = ?auto_337895 ?auto_337908 ) ) ( not ( = ?auto_337896 ?auto_337897 ) ) ( not ( = ?auto_337896 ?auto_337898 ) ) ( not ( = ?auto_337896 ?auto_337899 ) ) ( not ( = ?auto_337896 ?auto_337900 ) ) ( not ( = ?auto_337896 ?auto_337901 ) ) ( not ( = ?auto_337896 ?auto_337902 ) ) ( not ( = ?auto_337896 ?auto_337903 ) ) ( not ( = ?auto_337896 ?auto_337904 ) ) ( not ( = ?auto_337896 ?auto_337905 ) ) ( not ( = ?auto_337896 ?auto_337906 ) ) ( not ( = ?auto_337896 ?auto_337907 ) ) ( not ( = ?auto_337896 ?auto_337908 ) ) ( not ( = ?auto_337897 ?auto_337898 ) ) ( not ( = ?auto_337897 ?auto_337899 ) ) ( not ( = ?auto_337897 ?auto_337900 ) ) ( not ( = ?auto_337897 ?auto_337901 ) ) ( not ( = ?auto_337897 ?auto_337902 ) ) ( not ( = ?auto_337897 ?auto_337903 ) ) ( not ( = ?auto_337897 ?auto_337904 ) ) ( not ( = ?auto_337897 ?auto_337905 ) ) ( not ( = ?auto_337897 ?auto_337906 ) ) ( not ( = ?auto_337897 ?auto_337907 ) ) ( not ( = ?auto_337897 ?auto_337908 ) ) ( not ( = ?auto_337898 ?auto_337899 ) ) ( not ( = ?auto_337898 ?auto_337900 ) ) ( not ( = ?auto_337898 ?auto_337901 ) ) ( not ( = ?auto_337898 ?auto_337902 ) ) ( not ( = ?auto_337898 ?auto_337903 ) ) ( not ( = ?auto_337898 ?auto_337904 ) ) ( not ( = ?auto_337898 ?auto_337905 ) ) ( not ( = ?auto_337898 ?auto_337906 ) ) ( not ( = ?auto_337898 ?auto_337907 ) ) ( not ( = ?auto_337898 ?auto_337908 ) ) ( not ( = ?auto_337899 ?auto_337900 ) ) ( not ( = ?auto_337899 ?auto_337901 ) ) ( not ( = ?auto_337899 ?auto_337902 ) ) ( not ( = ?auto_337899 ?auto_337903 ) ) ( not ( = ?auto_337899 ?auto_337904 ) ) ( not ( = ?auto_337899 ?auto_337905 ) ) ( not ( = ?auto_337899 ?auto_337906 ) ) ( not ( = ?auto_337899 ?auto_337907 ) ) ( not ( = ?auto_337899 ?auto_337908 ) ) ( not ( = ?auto_337900 ?auto_337901 ) ) ( not ( = ?auto_337900 ?auto_337902 ) ) ( not ( = ?auto_337900 ?auto_337903 ) ) ( not ( = ?auto_337900 ?auto_337904 ) ) ( not ( = ?auto_337900 ?auto_337905 ) ) ( not ( = ?auto_337900 ?auto_337906 ) ) ( not ( = ?auto_337900 ?auto_337907 ) ) ( not ( = ?auto_337900 ?auto_337908 ) ) ( not ( = ?auto_337901 ?auto_337902 ) ) ( not ( = ?auto_337901 ?auto_337903 ) ) ( not ( = ?auto_337901 ?auto_337904 ) ) ( not ( = ?auto_337901 ?auto_337905 ) ) ( not ( = ?auto_337901 ?auto_337906 ) ) ( not ( = ?auto_337901 ?auto_337907 ) ) ( not ( = ?auto_337901 ?auto_337908 ) ) ( not ( = ?auto_337902 ?auto_337903 ) ) ( not ( = ?auto_337902 ?auto_337904 ) ) ( not ( = ?auto_337902 ?auto_337905 ) ) ( not ( = ?auto_337902 ?auto_337906 ) ) ( not ( = ?auto_337902 ?auto_337907 ) ) ( not ( = ?auto_337902 ?auto_337908 ) ) ( not ( = ?auto_337903 ?auto_337904 ) ) ( not ( = ?auto_337903 ?auto_337905 ) ) ( not ( = ?auto_337903 ?auto_337906 ) ) ( not ( = ?auto_337903 ?auto_337907 ) ) ( not ( = ?auto_337903 ?auto_337908 ) ) ( not ( = ?auto_337904 ?auto_337905 ) ) ( not ( = ?auto_337904 ?auto_337906 ) ) ( not ( = ?auto_337904 ?auto_337907 ) ) ( not ( = ?auto_337904 ?auto_337908 ) ) ( not ( = ?auto_337905 ?auto_337906 ) ) ( not ( = ?auto_337905 ?auto_337907 ) ) ( not ( = ?auto_337905 ?auto_337908 ) ) ( not ( = ?auto_337906 ?auto_337907 ) ) ( not ( = ?auto_337906 ?auto_337908 ) ) ( not ( = ?auto_337907 ?auto_337908 ) ) ( ON ?auto_337906 ?auto_337907 ) ( ON ?auto_337905 ?auto_337906 ) ( ON ?auto_337904 ?auto_337905 ) ( CLEAR ?auto_337902 ) ( ON ?auto_337903 ?auto_337904 ) ( CLEAR ?auto_337903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_337895 ?auto_337896 ?auto_337897 ?auto_337898 ?auto_337899 ?auto_337900 ?auto_337901 ?auto_337902 ?auto_337903 )
      ( MAKE-13PILE ?auto_337895 ?auto_337896 ?auto_337897 ?auto_337898 ?auto_337899 ?auto_337900 ?auto_337901 ?auto_337902 ?auto_337903 ?auto_337904 ?auto_337905 ?auto_337906 ?auto_337907 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337922 - BLOCK
      ?auto_337923 - BLOCK
      ?auto_337924 - BLOCK
      ?auto_337925 - BLOCK
      ?auto_337926 - BLOCK
      ?auto_337927 - BLOCK
      ?auto_337928 - BLOCK
      ?auto_337929 - BLOCK
      ?auto_337930 - BLOCK
      ?auto_337931 - BLOCK
      ?auto_337932 - BLOCK
      ?auto_337933 - BLOCK
      ?auto_337934 - BLOCK
    )
    :vars
    (
      ?auto_337935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337934 ?auto_337935 ) ( ON-TABLE ?auto_337922 ) ( ON ?auto_337923 ?auto_337922 ) ( ON ?auto_337924 ?auto_337923 ) ( ON ?auto_337925 ?auto_337924 ) ( ON ?auto_337926 ?auto_337925 ) ( ON ?auto_337927 ?auto_337926 ) ( ON ?auto_337928 ?auto_337927 ) ( ON ?auto_337929 ?auto_337928 ) ( not ( = ?auto_337922 ?auto_337923 ) ) ( not ( = ?auto_337922 ?auto_337924 ) ) ( not ( = ?auto_337922 ?auto_337925 ) ) ( not ( = ?auto_337922 ?auto_337926 ) ) ( not ( = ?auto_337922 ?auto_337927 ) ) ( not ( = ?auto_337922 ?auto_337928 ) ) ( not ( = ?auto_337922 ?auto_337929 ) ) ( not ( = ?auto_337922 ?auto_337930 ) ) ( not ( = ?auto_337922 ?auto_337931 ) ) ( not ( = ?auto_337922 ?auto_337932 ) ) ( not ( = ?auto_337922 ?auto_337933 ) ) ( not ( = ?auto_337922 ?auto_337934 ) ) ( not ( = ?auto_337922 ?auto_337935 ) ) ( not ( = ?auto_337923 ?auto_337924 ) ) ( not ( = ?auto_337923 ?auto_337925 ) ) ( not ( = ?auto_337923 ?auto_337926 ) ) ( not ( = ?auto_337923 ?auto_337927 ) ) ( not ( = ?auto_337923 ?auto_337928 ) ) ( not ( = ?auto_337923 ?auto_337929 ) ) ( not ( = ?auto_337923 ?auto_337930 ) ) ( not ( = ?auto_337923 ?auto_337931 ) ) ( not ( = ?auto_337923 ?auto_337932 ) ) ( not ( = ?auto_337923 ?auto_337933 ) ) ( not ( = ?auto_337923 ?auto_337934 ) ) ( not ( = ?auto_337923 ?auto_337935 ) ) ( not ( = ?auto_337924 ?auto_337925 ) ) ( not ( = ?auto_337924 ?auto_337926 ) ) ( not ( = ?auto_337924 ?auto_337927 ) ) ( not ( = ?auto_337924 ?auto_337928 ) ) ( not ( = ?auto_337924 ?auto_337929 ) ) ( not ( = ?auto_337924 ?auto_337930 ) ) ( not ( = ?auto_337924 ?auto_337931 ) ) ( not ( = ?auto_337924 ?auto_337932 ) ) ( not ( = ?auto_337924 ?auto_337933 ) ) ( not ( = ?auto_337924 ?auto_337934 ) ) ( not ( = ?auto_337924 ?auto_337935 ) ) ( not ( = ?auto_337925 ?auto_337926 ) ) ( not ( = ?auto_337925 ?auto_337927 ) ) ( not ( = ?auto_337925 ?auto_337928 ) ) ( not ( = ?auto_337925 ?auto_337929 ) ) ( not ( = ?auto_337925 ?auto_337930 ) ) ( not ( = ?auto_337925 ?auto_337931 ) ) ( not ( = ?auto_337925 ?auto_337932 ) ) ( not ( = ?auto_337925 ?auto_337933 ) ) ( not ( = ?auto_337925 ?auto_337934 ) ) ( not ( = ?auto_337925 ?auto_337935 ) ) ( not ( = ?auto_337926 ?auto_337927 ) ) ( not ( = ?auto_337926 ?auto_337928 ) ) ( not ( = ?auto_337926 ?auto_337929 ) ) ( not ( = ?auto_337926 ?auto_337930 ) ) ( not ( = ?auto_337926 ?auto_337931 ) ) ( not ( = ?auto_337926 ?auto_337932 ) ) ( not ( = ?auto_337926 ?auto_337933 ) ) ( not ( = ?auto_337926 ?auto_337934 ) ) ( not ( = ?auto_337926 ?auto_337935 ) ) ( not ( = ?auto_337927 ?auto_337928 ) ) ( not ( = ?auto_337927 ?auto_337929 ) ) ( not ( = ?auto_337927 ?auto_337930 ) ) ( not ( = ?auto_337927 ?auto_337931 ) ) ( not ( = ?auto_337927 ?auto_337932 ) ) ( not ( = ?auto_337927 ?auto_337933 ) ) ( not ( = ?auto_337927 ?auto_337934 ) ) ( not ( = ?auto_337927 ?auto_337935 ) ) ( not ( = ?auto_337928 ?auto_337929 ) ) ( not ( = ?auto_337928 ?auto_337930 ) ) ( not ( = ?auto_337928 ?auto_337931 ) ) ( not ( = ?auto_337928 ?auto_337932 ) ) ( not ( = ?auto_337928 ?auto_337933 ) ) ( not ( = ?auto_337928 ?auto_337934 ) ) ( not ( = ?auto_337928 ?auto_337935 ) ) ( not ( = ?auto_337929 ?auto_337930 ) ) ( not ( = ?auto_337929 ?auto_337931 ) ) ( not ( = ?auto_337929 ?auto_337932 ) ) ( not ( = ?auto_337929 ?auto_337933 ) ) ( not ( = ?auto_337929 ?auto_337934 ) ) ( not ( = ?auto_337929 ?auto_337935 ) ) ( not ( = ?auto_337930 ?auto_337931 ) ) ( not ( = ?auto_337930 ?auto_337932 ) ) ( not ( = ?auto_337930 ?auto_337933 ) ) ( not ( = ?auto_337930 ?auto_337934 ) ) ( not ( = ?auto_337930 ?auto_337935 ) ) ( not ( = ?auto_337931 ?auto_337932 ) ) ( not ( = ?auto_337931 ?auto_337933 ) ) ( not ( = ?auto_337931 ?auto_337934 ) ) ( not ( = ?auto_337931 ?auto_337935 ) ) ( not ( = ?auto_337932 ?auto_337933 ) ) ( not ( = ?auto_337932 ?auto_337934 ) ) ( not ( = ?auto_337932 ?auto_337935 ) ) ( not ( = ?auto_337933 ?auto_337934 ) ) ( not ( = ?auto_337933 ?auto_337935 ) ) ( not ( = ?auto_337934 ?auto_337935 ) ) ( ON ?auto_337933 ?auto_337934 ) ( ON ?auto_337932 ?auto_337933 ) ( ON ?auto_337931 ?auto_337932 ) ( CLEAR ?auto_337929 ) ( ON ?auto_337930 ?auto_337931 ) ( CLEAR ?auto_337930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_337922 ?auto_337923 ?auto_337924 ?auto_337925 ?auto_337926 ?auto_337927 ?auto_337928 ?auto_337929 ?auto_337930 )
      ( MAKE-13PILE ?auto_337922 ?auto_337923 ?auto_337924 ?auto_337925 ?auto_337926 ?auto_337927 ?auto_337928 ?auto_337929 ?auto_337930 ?auto_337931 ?auto_337932 ?auto_337933 ?auto_337934 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337949 - BLOCK
      ?auto_337950 - BLOCK
      ?auto_337951 - BLOCK
      ?auto_337952 - BLOCK
      ?auto_337953 - BLOCK
      ?auto_337954 - BLOCK
      ?auto_337955 - BLOCK
      ?auto_337956 - BLOCK
      ?auto_337957 - BLOCK
      ?auto_337958 - BLOCK
      ?auto_337959 - BLOCK
      ?auto_337960 - BLOCK
      ?auto_337961 - BLOCK
    )
    :vars
    (
      ?auto_337962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337961 ?auto_337962 ) ( ON-TABLE ?auto_337949 ) ( ON ?auto_337950 ?auto_337949 ) ( ON ?auto_337951 ?auto_337950 ) ( ON ?auto_337952 ?auto_337951 ) ( ON ?auto_337953 ?auto_337952 ) ( ON ?auto_337954 ?auto_337953 ) ( ON ?auto_337955 ?auto_337954 ) ( not ( = ?auto_337949 ?auto_337950 ) ) ( not ( = ?auto_337949 ?auto_337951 ) ) ( not ( = ?auto_337949 ?auto_337952 ) ) ( not ( = ?auto_337949 ?auto_337953 ) ) ( not ( = ?auto_337949 ?auto_337954 ) ) ( not ( = ?auto_337949 ?auto_337955 ) ) ( not ( = ?auto_337949 ?auto_337956 ) ) ( not ( = ?auto_337949 ?auto_337957 ) ) ( not ( = ?auto_337949 ?auto_337958 ) ) ( not ( = ?auto_337949 ?auto_337959 ) ) ( not ( = ?auto_337949 ?auto_337960 ) ) ( not ( = ?auto_337949 ?auto_337961 ) ) ( not ( = ?auto_337949 ?auto_337962 ) ) ( not ( = ?auto_337950 ?auto_337951 ) ) ( not ( = ?auto_337950 ?auto_337952 ) ) ( not ( = ?auto_337950 ?auto_337953 ) ) ( not ( = ?auto_337950 ?auto_337954 ) ) ( not ( = ?auto_337950 ?auto_337955 ) ) ( not ( = ?auto_337950 ?auto_337956 ) ) ( not ( = ?auto_337950 ?auto_337957 ) ) ( not ( = ?auto_337950 ?auto_337958 ) ) ( not ( = ?auto_337950 ?auto_337959 ) ) ( not ( = ?auto_337950 ?auto_337960 ) ) ( not ( = ?auto_337950 ?auto_337961 ) ) ( not ( = ?auto_337950 ?auto_337962 ) ) ( not ( = ?auto_337951 ?auto_337952 ) ) ( not ( = ?auto_337951 ?auto_337953 ) ) ( not ( = ?auto_337951 ?auto_337954 ) ) ( not ( = ?auto_337951 ?auto_337955 ) ) ( not ( = ?auto_337951 ?auto_337956 ) ) ( not ( = ?auto_337951 ?auto_337957 ) ) ( not ( = ?auto_337951 ?auto_337958 ) ) ( not ( = ?auto_337951 ?auto_337959 ) ) ( not ( = ?auto_337951 ?auto_337960 ) ) ( not ( = ?auto_337951 ?auto_337961 ) ) ( not ( = ?auto_337951 ?auto_337962 ) ) ( not ( = ?auto_337952 ?auto_337953 ) ) ( not ( = ?auto_337952 ?auto_337954 ) ) ( not ( = ?auto_337952 ?auto_337955 ) ) ( not ( = ?auto_337952 ?auto_337956 ) ) ( not ( = ?auto_337952 ?auto_337957 ) ) ( not ( = ?auto_337952 ?auto_337958 ) ) ( not ( = ?auto_337952 ?auto_337959 ) ) ( not ( = ?auto_337952 ?auto_337960 ) ) ( not ( = ?auto_337952 ?auto_337961 ) ) ( not ( = ?auto_337952 ?auto_337962 ) ) ( not ( = ?auto_337953 ?auto_337954 ) ) ( not ( = ?auto_337953 ?auto_337955 ) ) ( not ( = ?auto_337953 ?auto_337956 ) ) ( not ( = ?auto_337953 ?auto_337957 ) ) ( not ( = ?auto_337953 ?auto_337958 ) ) ( not ( = ?auto_337953 ?auto_337959 ) ) ( not ( = ?auto_337953 ?auto_337960 ) ) ( not ( = ?auto_337953 ?auto_337961 ) ) ( not ( = ?auto_337953 ?auto_337962 ) ) ( not ( = ?auto_337954 ?auto_337955 ) ) ( not ( = ?auto_337954 ?auto_337956 ) ) ( not ( = ?auto_337954 ?auto_337957 ) ) ( not ( = ?auto_337954 ?auto_337958 ) ) ( not ( = ?auto_337954 ?auto_337959 ) ) ( not ( = ?auto_337954 ?auto_337960 ) ) ( not ( = ?auto_337954 ?auto_337961 ) ) ( not ( = ?auto_337954 ?auto_337962 ) ) ( not ( = ?auto_337955 ?auto_337956 ) ) ( not ( = ?auto_337955 ?auto_337957 ) ) ( not ( = ?auto_337955 ?auto_337958 ) ) ( not ( = ?auto_337955 ?auto_337959 ) ) ( not ( = ?auto_337955 ?auto_337960 ) ) ( not ( = ?auto_337955 ?auto_337961 ) ) ( not ( = ?auto_337955 ?auto_337962 ) ) ( not ( = ?auto_337956 ?auto_337957 ) ) ( not ( = ?auto_337956 ?auto_337958 ) ) ( not ( = ?auto_337956 ?auto_337959 ) ) ( not ( = ?auto_337956 ?auto_337960 ) ) ( not ( = ?auto_337956 ?auto_337961 ) ) ( not ( = ?auto_337956 ?auto_337962 ) ) ( not ( = ?auto_337957 ?auto_337958 ) ) ( not ( = ?auto_337957 ?auto_337959 ) ) ( not ( = ?auto_337957 ?auto_337960 ) ) ( not ( = ?auto_337957 ?auto_337961 ) ) ( not ( = ?auto_337957 ?auto_337962 ) ) ( not ( = ?auto_337958 ?auto_337959 ) ) ( not ( = ?auto_337958 ?auto_337960 ) ) ( not ( = ?auto_337958 ?auto_337961 ) ) ( not ( = ?auto_337958 ?auto_337962 ) ) ( not ( = ?auto_337959 ?auto_337960 ) ) ( not ( = ?auto_337959 ?auto_337961 ) ) ( not ( = ?auto_337959 ?auto_337962 ) ) ( not ( = ?auto_337960 ?auto_337961 ) ) ( not ( = ?auto_337960 ?auto_337962 ) ) ( not ( = ?auto_337961 ?auto_337962 ) ) ( ON ?auto_337960 ?auto_337961 ) ( ON ?auto_337959 ?auto_337960 ) ( ON ?auto_337958 ?auto_337959 ) ( ON ?auto_337957 ?auto_337958 ) ( CLEAR ?auto_337955 ) ( ON ?auto_337956 ?auto_337957 ) ( CLEAR ?auto_337956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_337949 ?auto_337950 ?auto_337951 ?auto_337952 ?auto_337953 ?auto_337954 ?auto_337955 ?auto_337956 )
      ( MAKE-13PILE ?auto_337949 ?auto_337950 ?auto_337951 ?auto_337952 ?auto_337953 ?auto_337954 ?auto_337955 ?auto_337956 ?auto_337957 ?auto_337958 ?auto_337959 ?auto_337960 ?auto_337961 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_337976 - BLOCK
      ?auto_337977 - BLOCK
      ?auto_337978 - BLOCK
      ?auto_337979 - BLOCK
      ?auto_337980 - BLOCK
      ?auto_337981 - BLOCK
      ?auto_337982 - BLOCK
      ?auto_337983 - BLOCK
      ?auto_337984 - BLOCK
      ?auto_337985 - BLOCK
      ?auto_337986 - BLOCK
      ?auto_337987 - BLOCK
      ?auto_337988 - BLOCK
    )
    :vars
    (
      ?auto_337989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337988 ?auto_337989 ) ( ON-TABLE ?auto_337976 ) ( ON ?auto_337977 ?auto_337976 ) ( ON ?auto_337978 ?auto_337977 ) ( ON ?auto_337979 ?auto_337978 ) ( ON ?auto_337980 ?auto_337979 ) ( ON ?auto_337981 ?auto_337980 ) ( ON ?auto_337982 ?auto_337981 ) ( not ( = ?auto_337976 ?auto_337977 ) ) ( not ( = ?auto_337976 ?auto_337978 ) ) ( not ( = ?auto_337976 ?auto_337979 ) ) ( not ( = ?auto_337976 ?auto_337980 ) ) ( not ( = ?auto_337976 ?auto_337981 ) ) ( not ( = ?auto_337976 ?auto_337982 ) ) ( not ( = ?auto_337976 ?auto_337983 ) ) ( not ( = ?auto_337976 ?auto_337984 ) ) ( not ( = ?auto_337976 ?auto_337985 ) ) ( not ( = ?auto_337976 ?auto_337986 ) ) ( not ( = ?auto_337976 ?auto_337987 ) ) ( not ( = ?auto_337976 ?auto_337988 ) ) ( not ( = ?auto_337976 ?auto_337989 ) ) ( not ( = ?auto_337977 ?auto_337978 ) ) ( not ( = ?auto_337977 ?auto_337979 ) ) ( not ( = ?auto_337977 ?auto_337980 ) ) ( not ( = ?auto_337977 ?auto_337981 ) ) ( not ( = ?auto_337977 ?auto_337982 ) ) ( not ( = ?auto_337977 ?auto_337983 ) ) ( not ( = ?auto_337977 ?auto_337984 ) ) ( not ( = ?auto_337977 ?auto_337985 ) ) ( not ( = ?auto_337977 ?auto_337986 ) ) ( not ( = ?auto_337977 ?auto_337987 ) ) ( not ( = ?auto_337977 ?auto_337988 ) ) ( not ( = ?auto_337977 ?auto_337989 ) ) ( not ( = ?auto_337978 ?auto_337979 ) ) ( not ( = ?auto_337978 ?auto_337980 ) ) ( not ( = ?auto_337978 ?auto_337981 ) ) ( not ( = ?auto_337978 ?auto_337982 ) ) ( not ( = ?auto_337978 ?auto_337983 ) ) ( not ( = ?auto_337978 ?auto_337984 ) ) ( not ( = ?auto_337978 ?auto_337985 ) ) ( not ( = ?auto_337978 ?auto_337986 ) ) ( not ( = ?auto_337978 ?auto_337987 ) ) ( not ( = ?auto_337978 ?auto_337988 ) ) ( not ( = ?auto_337978 ?auto_337989 ) ) ( not ( = ?auto_337979 ?auto_337980 ) ) ( not ( = ?auto_337979 ?auto_337981 ) ) ( not ( = ?auto_337979 ?auto_337982 ) ) ( not ( = ?auto_337979 ?auto_337983 ) ) ( not ( = ?auto_337979 ?auto_337984 ) ) ( not ( = ?auto_337979 ?auto_337985 ) ) ( not ( = ?auto_337979 ?auto_337986 ) ) ( not ( = ?auto_337979 ?auto_337987 ) ) ( not ( = ?auto_337979 ?auto_337988 ) ) ( not ( = ?auto_337979 ?auto_337989 ) ) ( not ( = ?auto_337980 ?auto_337981 ) ) ( not ( = ?auto_337980 ?auto_337982 ) ) ( not ( = ?auto_337980 ?auto_337983 ) ) ( not ( = ?auto_337980 ?auto_337984 ) ) ( not ( = ?auto_337980 ?auto_337985 ) ) ( not ( = ?auto_337980 ?auto_337986 ) ) ( not ( = ?auto_337980 ?auto_337987 ) ) ( not ( = ?auto_337980 ?auto_337988 ) ) ( not ( = ?auto_337980 ?auto_337989 ) ) ( not ( = ?auto_337981 ?auto_337982 ) ) ( not ( = ?auto_337981 ?auto_337983 ) ) ( not ( = ?auto_337981 ?auto_337984 ) ) ( not ( = ?auto_337981 ?auto_337985 ) ) ( not ( = ?auto_337981 ?auto_337986 ) ) ( not ( = ?auto_337981 ?auto_337987 ) ) ( not ( = ?auto_337981 ?auto_337988 ) ) ( not ( = ?auto_337981 ?auto_337989 ) ) ( not ( = ?auto_337982 ?auto_337983 ) ) ( not ( = ?auto_337982 ?auto_337984 ) ) ( not ( = ?auto_337982 ?auto_337985 ) ) ( not ( = ?auto_337982 ?auto_337986 ) ) ( not ( = ?auto_337982 ?auto_337987 ) ) ( not ( = ?auto_337982 ?auto_337988 ) ) ( not ( = ?auto_337982 ?auto_337989 ) ) ( not ( = ?auto_337983 ?auto_337984 ) ) ( not ( = ?auto_337983 ?auto_337985 ) ) ( not ( = ?auto_337983 ?auto_337986 ) ) ( not ( = ?auto_337983 ?auto_337987 ) ) ( not ( = ?auto_337983 ?auto_337988 ) ) ( not ( = ?auto_337983 ?auto_337989 ) ) ( not ( = ?auto_337984 ?auto_337985 ) ) ( not ( = ?auto_337984 ?auto_337986 ) ) ( not ( = ?auto_337984 ?auto_337987 ) ) ( not ( = ?auto_337984 ?auto_337988 ) ) ( not ( = ?auto_337984 ?auto_337989 ) ) ( not ( = ?auto_337985 ?auto_337986 ) ) ( not ( = ?auto_337985 ?auto_337987 ) ) ( not ( = ?auto_337985 ?auto_337988 ) ) ( not ( = ?auto_337985 ?auto_337989 ) ) ( not ( = ?auto_337986 ?auto_337987 ) ) ( not ( = ?auto_337986 ?auto_337988 ) ) ( not ( = ?auto_337986 ?auto_337989 ) ) ( not ( = ?auto_337987 ?auto_337988 ) ) ( not ( = ?auto_337987 ?auto_337989 ) ) ( not ( = ?auto_337988 ?auto_337989 ) ) ( ON ?auto_337987 ?auto_337988 ) ( ON ?auto_337986 ?auto_337987 ) ( ON ?auto_337985 ?auto_337986 ) ( ON ?auto_337984 ?auto_337985 ) ( CLEAR ?auto_337982 ) ( ON ?auto_337983 ?auto_337984 ) ( CLEAR ?auto_337983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_337976 ?auto_337977 ?auto_337978 ?auto_337979 ?auto_337980 ?auto_337981 ?auto_337982 ?auto_337983 )
      ( MAKE-13PILE ?auto_337976 ?auto_337977 ?auto_337978 ?auto_337979 ?auto_337980 ?auto_337981 ?auto_337982 ?auto_337983 ?auto_337984 ?auto_337985 ?auto_337986 ?auto_337987 ?auto_337988 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338003 - BLOCK
      ?auto_338004 - BLOCK
      ?auto_338005 - BLOCK
      ?auto_338006 - BLOCK
      ?auto_338007 - BLOCK
      ?auto_338008 - BLOCK
      ?auto_338009 - BLOCK
      ?auto_338010 - BLOCK
      ?auto_338011 - BLOCK
      ?auto_338012 - BLOCK
      ?auto_338013 - BLOCK
      ?auto_338014 - BLOCK
      ?auto_338015 - BLOCK
    )
    :vars
    (
      ?auto_338016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338015 ?auto_338016 ) ( ON-TABLE ?auto_338003 ) ( ON ?auto_338004 ?auto_338003 ) ( ON ?auto_338005 ?auto_338004 ) ( ON ?auto_338006 ?auto_338005 ) ( ON ?auto_338007 ?auto_338006 ) ( ON ?auto_338008 ?auto_338007 ) ( not ( = ?auto_338003 ?auto_338004 ) ) ( not ( = ?auto_338003 ?auto_338005 ) ) ( not ( = ?auto_338003 ?auto_338006 ) ) ( not ( = ?auto_338003 ?auto_338007 ) ) ( not ( = ?auto_338003 ?auto_338008 ) ) ( not ( = ?auto_338003 ?auto_338009 ) ) ( not ( = ?auto_338003 ?auto_338010 ) ) ( not ( = ?auto_338003 ?auto_338011 ) ) ( not ( = ?auto_338003 ?auto_338012 ) ) ( not ( = ?auto_338003 ?auto_338013 ) ) ( not ( = ?auto_338003 ?auto_338014 ) ) ( not ( = ?auto_338003 ?auto_338015 ) ) ( not ( = ?auto_338003 ?auto_338016 ) ) ( not ( = ?auto_338004 ?auto_338005 ) ) ( not ( = ?auto_338004 ?auto_338006 ) ) ( not ( = ?auto_338004 ?auto_338007 ) ) ( not ( = ?auto_338004 ?auto_338008 ) ) ( not ( = ?auto_338004 ?auto_338009 ) ) ( not ( = ?auto_338004 ?auto_338010 ) ) ( not ( = ?auto_338004 ?auto_338011 ) ) ( not ( = ?auto_338004 ?auto_338012 ) ) ( not ( = ?auto_338004 ?auto_338013 ) ) ( not ( = ?auto_338004 ?auto_338014 ) ) ( not ( = ?auto_338004 ?auto_338015 ) ) ( not ( = ?auto_338004 ?auto_338016 ) ) ( not ( = ?auto_338005 ?auto_338006 ) ) ( not ( = ?auto_338005 ?auto_338007 ) ) ( not ( = ?auto_338005 ?auto_338008 ) ) ( not ( = ?auto_338005 ?auto_338009 ) ) ( not ( = ?auto_338005 ?auto_338010 ) ) ( not ( = ?auto_338005 ?auto_338011 ) ) ( not ( = ?auto_338005 ?auto_338012 ) ) ( not ( = ?auto_338005 ?auto_338013 ) ) ( not ( = ?auto_338005 ?auto_338014 ) ) ( not ( = ?auto_338005 ?auto_338015 ) ) ( not ( = ?auto_338005 ?auto_338016 ) ) ( not ( = ?auto_338006 ?auto_338007 ) ) ( not ( = ?auto_338006 ?auto_338008 ) ) ( not ( = ?auto_338006 ?auto_338009 ) ) ( not ( = ?auto_338006 ?auto_338010 ) ) ( not ( = ?auto_338006 ?auto_338011 ) ) ( not ( = ?auto_338006 ?auto_338012 ) ) ( not ( = ?auto_338006 ?auto_338013 ) ) ( not ( = ?auto_338006 ?auto_338014 ) ) ( not ( = ?auto_338006 ?auto_338015 ) ) ( not ( = ?auto_338006 ?auto_338016 ) ) ( not ( = ?auto_338007 ?auto_338008 ) ) ( not ( = ?auto_338007 ?auto_338009 ) ) ( not ( = ?auto_338007 ?auto_338010 ) ) ( not ( = ?auto_338007 ?auto_338011 ) ) ( not ( = ?auto_338007 ?auto_338012 ) ) ( not ( = ?auto_338007 ?auto_338013 ) ) ( not ( = ?auto_338007 ?auto_338014 ) ) ( not ( = ?auto_338007 ?auto_338015 ) ) ( not ( = ?auto_338007 ?auto_338016 ) ) ( not ( = ?auto_338008 ?auto_338009 ) ) ( not ( = ?auto_338008 ?auto_338010 ) ) ( not ( = ?auto_338008 ?auto_338011 ) ) ( not ( = ?auto_338008 ?auto_338012 ) ) ( not ( = ?auto_338008 ?auto_338013 ) ) ( not ( = ?auto_338008 ?auto_338014 ) ) ( not ( = ?auto_338008 ?auto_338015 ) ) ( not ( = ?auto_338008 ?auto_338016 ) ) ( not ( = ?auto_338009 ?auto_338010 ) ) ( not ( = ?auto_338009 ?auto_338011 ) ) ( not ( = ?auto_338009 ?auto_338012 ) ) ( not ( = ?auto_338009 ?auto_338013 ) ) ( not ( = ?auto_338009 ?auto_338014 ) ) ( not ( = ?auto_338009 ?auto_338015 ) ) ( not ( = ?auto_338009 ?auto_338016 ) ) ( not ( = ?auto_338010 ?auto_338011 ) ) ( not ( = ?auto_338010 ?auto_338012 ) ) ( not ( = ?auto_338010 ?auto_338013 ) ) ( not ( = ?auto_338010 ?auto_338014 ) ) ( not ( = ?auto_338010 ?auto_338015 ) ) ( not ( = ?auto_338010 ?auto_338016 ) ) ( not ( = ?auto_338011 ?auto_338012 ) ) ( not ( = ?auto_338011 ?auto_338013 ) ) ( not ( = ?auto_338011 ?auto_338014 ) ) ( not ( = ?auto_338011 ?auto_338015 ) ) ( not ( = ?auto_338011 ?auto_338016 ) ) ( not ( = ?auto_338012 ?auto_338013 ) ) ( not ( = ?auto_338012 ?auto_338014 ) ) ( not ( = ?auto_338012 ?auto_338015 ) ) ( not ( = ?auto_338012 ?auto_338016 ) ) ( not ( = ?auto_338013 ?auto_338014 ) ) ( not ( = ?auto_338013 ?auto_338015 ) ) ( not ( = ?auto_338013 ?auto_338016 ) ) ( not ( = ?auto_338014 ?auto_338015 ) ) ( not ( = ?auto_338014 ?auto_338016 ) ) ( not ( = ?auto_338015 ?auto_338016 ) ) ( ON ?auto_338014 ?auto_338015 ) ( ON ?auto_338013 ?auto_338014 ) ( ON ?auto_338012 ?auto_338013 ) ( ON ?auto_338011 ?auto_338012 ) ( ON ?auto_338010 ?auto_338011 ) ( CLEAR ?auto_338008 ) ( ON ?auto_338009 ?auto_338010 ) ( CLEAR ?auto_338009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_338003 ?auto_338004 ?auto_338005 ?auto_338006 ?auto_338007 ?auto_338008 ?auto_338009 )
      ( MAKE-13PILE ?auto_338003 ?auto_338004 ?auto_338005 ?auto_338006 ?auto_338007 ?auto_338008 ?auto_338009 ?auto_338010 ?auto_338011 ?auto_338012 ?auto_338013 ?auto_338014 ?auto_338015 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338030 - BLOCK
      ?auto_338031 - BLOCK
      ?auto_338032 - BLOCK
      ?auto_338033 - BLOCK
      ?auto_338034 - BLOCK
      ?auto_338035 - BLOCK
      ?auto_338036 - BLOCK
      ?auto_338037 - BLOCK
      ?auto_338038 - BLOCK
      ?auto_338039 - BLOCK
      ?auto_338040 - BLOCK
      ?auto_338041 - BLOCK
      ?auto_338042 - BLOCK
    )
    :vars
    (
      ?auto_338043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338042 ?auto_338043 ) ( ON-TABLE ?auto_338030 ) ( ON ?auto_338031 ?auto_338030 ) ( ON ?auto_338032 ?auto_338031 ) ( ON ?auto_338033 ?auto_338032 ) ( ON ?auto_338034 ?auto_338033 ) ( ON ?auto_338035 ?auto_338034 ) ( not ( = ?auto_338030 ?auto_338031 ) ) ( not ( = ?auto_338030 ?auto_338032 ) ) ( not ( = ?auto_338030 ?auto_338033 ) ) ( not ( = ?auto_338030 ?auto_338034 ) ) ( not ( = ?auto_338030 ?auto_338035 ) ) ( not ( = ?auto_338030 ?auto_338036 ) ) ( not ( = ?auto_338030 ?auto_338037 ) ) ( not ( = ?auto_338030 ?auto_338038 ) ) ( not ( = ?auto_338030 ?auto_338039 ) ) ( not ( = ?auto_338030 ?auto_338040 ) ) ( not ( = ?auto_338030 ?auto_338041 ) ) ( not ( = ?auto_338030 ?auto_338042 ) ) ( not ( = ?auto_338030 ?auto_338043 ) ) ( not ( = ?auto_338031 ?auto_338032 ) ) ( not ( = ?auto_338031 ?auto_338033 ) ) ( not ( = ?auto_338031 ?auto_338034 ) ) ( not ( = ?auto_338031 ?auto_338035 ) ) ( not ( = ?auto_338031 ?auto_338036 ) ) ( not ( = ?auto_338031 ?auto_338037 ) ) ( not ( = ?auto_338031 ?auto_338038 ) ) ( not ( = ?auto_338031 ?auto_338039 ) ) ( not ( = ?auto_338031 ?auto_338040 ) ) ( not ( = ?auto_338031 ?auto_338041 ) ) ( not ( = ?auto_338031 ?auto_338042 ) ) ( not ( = ?auto_338031 ?auto_338043 ) ) ( not ( = ?auto_338032 ?auto_338033 ) ) ( not ( = ?auto_338032 ?auto_338034 ) ) ( not ( = ?auto_338032 ?auto_338035 ) ) ( not ( = ?auto_338032 ?auto_338036 ) ) ( not ( = ?auto_338032 ?auto_338037 ) ) ( not ( = ?auto_338032 ?auto_338038 ) ) ( not ( = ?auto_338032 ?auto_338039 ) ) ( not ( = ?auto_338032 ?auto_338040 ) ) ( not ( = ?auto_338032 ?auto_338041 ) ) ( not ( = ?auto_338032 ?auto_338042 ) ) ( not ( = ?auto_338032 ?auto_338043 ) ) ( not ( = ?auto_338033 ?auto_338034 ) ) ( not ( = ?auto_338033 ?auto_338035 ) ) ( not ( = ?auto_338033 ?auto_338036 ) ) ( not ( = ?auto_338033 ?auto_338037 ) ) ( not ( = ?auto_338033 ?auto_338038 ) ) ( not ( = ?auto_338033 ?auto_338039 ) ) ( not ( = ?auto_338033 ?auto_338040 ) ) ( not ( = ?auto_338033 ?auto_338041 ) ) ( not ( = ?auto_338033 ?auto_338042 ) ) ( not ( = ?auto_338033 ?auto_338043 ) ) ( not ( = ?auto_338034 ?auto_338035 ) ) ( not ( = ?auto_338034 ?auto_338036 ) ) ( not ( = ?auto_338034 ?auto_338037 ) ) ( not ( = ?auto_338034 ?auto_338038 ) ) ( not ( = ?auto_338034 ?auto_338039 ) ) ( not ( = ?auto_338034 ?auto_338040 ) ) ( not ( = ?auto_338034 ?auto_338041 ) ) ( not ( = ?auto_338034 ?auto_338042 ) ) ( not ( = ?auto_338034 ?auto_338043 ) ) ( not ( = ?auto_338035 ?auto_338036 ) ) ( not ( = ?auto_338035 ?auto_338037 ) ) ( not ( = ?auto_338035 ?auto_338038 ) ) ( not ( = ?auto_338035 ?auto_338039 ) ) ( not ( = ?auto_338035 ?auto_338040 ) ) ( not ( = ?auto_338035 ?auto_338041 ) ) ( not ( = ?auto_338035 ?auto_338042 ) ) ( not ( = ?auto_338035 ?auto_338043 ) ) ( not ( = ?auto_338036 ?auto_338037 ) ) ( not ( = ?auto_338036 ?auto_338038 ) ) ( not ( = ?auto_338036 ?auto_338039 ) ) ( not ( = ?auto_338036 ?auto_338040 ) ) ( not ( = ?auto_338036 ?auto_338041 ) ) ( not ( = ?auto_338036 ?auto_338042 ) ) ( not ( = ?auto_338036 ?auto_338043 ) ) ( not ( = ?auto_338037 ?auto_338038 ) ) ( not ( = ?auto_338037 ?auto_338039 ) ) ( not ( = ?auto_338037 ?auto_338040 ) ) ( not ( = ?auto_338037 ?auto_338041 ) ) ( not ( = ?auto_338037 ?auto_338042 ) ) ( not ( = ?auto_338037 ?auto_338043 ) ) ( not ( = ?auto_338038 ?auto_338039 ) ) ( not ( = ?auto_338038 ?auto_338040 ) ) ( not ( = ?auto_338038 ?auto_338041 ) ) ( not ( = ?auto_338038 ?auto_338042 ) ) ( not ( = ?auto_338038 ?auto_338043 ) ) ( not ( = ?auto_338039 ?auto_338040 ) ) ( not ( = ?auto_338039 ?auto_338041 ) ) ( not ( = ?auto_338039 ?auto_338042 ) ) ( not ( = ?auto_338039 ?auto_338043 ) ) ( not ( = ?auto_338040 ?auto_338041 ) ) ( not ( = ?auto_338040 ?auto_338042 ) ) ( not ( = ?auto_338040 ?auto_338043 ) ) ( not ( = ?auto_338041 ?auto_338042 ) ) ( not ( = ?auto_338041 ?auto_338043 ) ) ( not ( = ?auto_338042 ?auto_338043 ) ) ( ON ?auto_338041 ?auto_338042 ) ( ON ?auto_338040 ?auto_338041 ) ( ON ?auto_338039 ?auto_338040 ) ( ON ?auto_338038 ?auto_338039 ) ( ON ?auto_338037 ?auto_338038 ) ( CLEAR ?auto_338035 ) ( ON ?auto_338036 ?auto_338037 ) ( CLEAR ?auto_338036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_338030 ?auto_338031 ?auto_338032 ?auto_338033 ?auto_338034 ?auto_338035 ?auto_338036 )
      ( MAKE-13PILE ?auto_338030 ?auto_338031 ?auto_338032 ?auto_338033 ?auto_338034 ?auto_338035 ?auto_338036 ?auto_338037 ?auto_338038 ?auto_338039 ?auto_338040 ?auto_338041 ?auto_338042 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338057 - BLOCK
      ?auto_338058 - BLOCK
      ?auto_338059 - BLOCK
      ?auto_338060 - BLOCK
      ?auto_338061 - BLOCK
      ?auto_338062 - BLOCK
      ?auto_338063 - BLOCK
      ?auto_338064 - BLOCK
      ?auto_338065 - BLOCK
      ?auto_338066 - BLOCK
      ?auto_338067 - BLOCK
      ?auto_338068 - BLOCK
      ?auto_338069 - BLOCK
    )
    :vars
    (
      ?auto_338070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338069 ?auto_338070 ) ( ON-TABLE ?auto_338057 ) ( ON ?auto_338058 ?auto_338057 ) ( ON ?auto_338059 ?auto_338058 ) ( ON ?auto_338060 ?auto_338059 ) ( ON ?auto_338061 ?auto_338060 ) ( not ( = ?auto_338057 ?auto_338058 ) ) ( not ( = ?auto_338057 ?auto_338059 ) ) ( not ( = ?auto_338057 ?auto_338060 ) ) ( not ( = ?auto_338057 ?auto_338061 ) ) ( not ( = ?auto_338057 ?auto_338062 ) ) ( not ( = ?auto_338057 ?auto_338063 ) ) ( not ( = ?auto_338057 ?auto_338064 ) ) ( not ( = ?auto_338057 ?auto_338065 ) ) ( not ( = ?auto_338057 ?auto_338066 ) ) ( not ( = ?auto_338057 ?auto_338067 ) ) ( not ( = ?auto_338057 ?auto_338068 ) ) ( not ( = ?auto_338057 ?auto_338069 ) ) ( not ( = ?auto_338057 ?auto_338070 ) ) ( not ( = ?auto_338058 ?auto_338059 ) ) ( not ( = ?auto_338058 ?auto_338060 ) ) ( not ( = ?auto_338058 ?auto_338061 ) ) ( not ( = ?auto_338058 ?auto_338062 ) ) ( not ( = ?auto_338058 ?auto_338063 ) ) ( not ( = ?auto_338058 ?auto_338064 ) ) ( not ( = ?auto_338058 ?auto_338065 ) ) ( not ( = ?auto_338058 ?auto_338066 ) ) ( not ( = ?auto_338058 ?auto_338067 ) ) ( not ( = ?auto_338058 ?auto_338068 ) ) ( not ( = ?auto_338058 ?auto_338069 ) ) ( not ( = ?auto_338058 ?auto_338070 ) ) ( not ( = ?auto_338059 ?auto_338060 ) ) ( not ( = ?auto_338059 ?auto_338061 ) ) ( not ( = ?auto_338059 ?auto_338062 ) ) ( not ( = ?auto_338059 ?auto_338063 ) ) ( not ( = ?auto_338059 ?auto_338064 ) ) ( not ( = ?auto_338059 ?auto_338065 ) ) ( not ( = ?auto_338059 ?auto_338066 ) ) ( not ( = ?auto_338059 ?auto_338067 ) ) ( not ( = ?auto_338059 ?auto_338068 ) ) ( not ( = ?auto_338059 ?auto_338069 ) ) ( not ( = ?auto_338059 ?auto_338070 ) ) ( not ( = ?auto_338060 ?auto_338061 ) ) ( not ( = ?auto_338060 ?auto_338062 ) ) ( not ( = ?auto_338060 ?auto_338063 ) ) ( not ( = ?auto_338060 ?auto_338064 ) ) ( not ( = ?auto_338060 ?auto_338065 ) ) ( not ( = ?auto_338060 ?auto_338066 ) ) ( not ( = ?auto_338060 ?auto_338067 ) ) ( not ( = ?auto_338060 ?auto_338068 ) ) ( not ( = ?auto_338060 ?auto_338069 ) ) ( not ( = ?auto_338060 ?auto_338070 ) ) ( not ( = ?auto_338061 ?auto_338062 ) ) ( not ( = ?auto_338061 ?auto_338063 ) ) ( not ( = ?auto_338061 ?auto_338064 ) ) ( not ( = ?auto_338061 ?auto_338065 ) ) ( not ( = ?auto_338061 ?auto_338066 ) ) ( not ( = ?auto_338061 ?auto_338067 ) ) ( not ( = ?auto_338061 ?auto_338068 ) ) ( not ( = ?auto_338061 ?auto_338069 ) ) ( not ( = ?auto_338061 ?auto_338070 ) ) ( not ( = ?auto_338062 ?auto_338063 ) ) ( not ( = ?auto_338062 ?auto_338064 ) ) ( not ( = ?auto_338062 ?auto_338065 ) ) ( not ( = ?auto_338062 ?auto_338066 ) ) ( not ( = ?auto_338062 ?auto_338067 ) ) ( not ( = ?auto_338062 ?auto_338068 ) ) ( not ( = ?auto_338062 ?auto_338069 ) ) ( not ( = ?auto_338062 ?auto_338070 ) ) ( not ( = ?auto_338063 ?auto_338064 ) ) ( not ( = ?auto_338063 ?auto_338065 ) ) ( not ( = ?auto_338063 ?auto_338066 ) ) ( not ( = ?auto_338063 ?auto_338067 ) ) ( not ( = ?auto_338063 ?auto_338068 ) ) ( not ( = ?auto_338063 ?auto_338069 ) ) ( not ( = ?auto_338063 ?auto_338070 ) ) ( not ( = ?auto_338064 ?auto_338065 ) ) ( not ( = ?auto_338064 ?auto_338066 ) ) ( not ( = ?auto_338064 ?auto_338067 ) ) ( not ( = ?auto_338064 ?auto_338068 ) ) ( not ( = ?auto_338064 ?auto_338069 ) ) ( not ( = ?auto_338064 ?auto_338070 ) ) ( not ( = ?auto_338065 ?auto_338066 ) ) ( not ( = ?auto_338065 ?auto_338067 ) ) ( not ( = ?auto_338065 ?auto_338068 ) ) ( not ( = ?auto_338065 ?auto_338069 ) ) ( not ( = ?auto_338065 ?auto_338070 ) ) ( not ( = ?auto_338066 ?auto_338067 ) ) ( not ( = ?auto_338066 ?auto_338068 ) ) ( not ( = ?auto_338066 ?auto_338069 ) ) ( not ( = ?auto_338066 ?auto_338070 ) ) ( not ( = ?auto_338067 ?auto_338068 ) ) ( not ( = ?auto_338067 ?auto_338069 ) ) ( not ( = ?auto_338067 ?auto_338070 ) ) ( not ( = ?auto_338068 ?auto_338069 ) ) ( not ( = ?auto_338068 ?auto_338070 ) ) ( not ( = ?auto_338069 ?auto_338070 ) ) ( ON ?auto_338068 ?auto_338069 ) ( ON ?auto_338067 ?auto_338068 ) ( ON ?auto_338066 ?auto_338067 ) ( ON ?auto_338065 ?auto_338066 ) ( ON ?auto_338064 ?auto_338065 ) ( ON ?auto_338063 ?auto_338064 ) ( CLEAR ?auto_338061 ) ( ON ?auto_338062 ?auto_338063 ) ( CLEAR ?auto_338062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_338057 ?auto_338058 ?auto_338059 ?auto_338060 ?auto_338061 ?auto_338062 )
      ( MAKE-13PILE ?auto_338057 ?auto_338058 ?auto_338059 ?auto_338060 ?auto_338061 ?auto_338062 ?auto_338063 ?auto_338064 ?auto_338065 ?auto_338066 ?auto_338067 ?auto_338068 ?auto_338069 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338084 - BLOCK
      ?auto_338085 - BLOCK
      ?auto_338086 - BLOCK
      ?auto_338087 - BLOCK
      ?auto_338088 - BLOCK
      ?auto_338089 - BLOCK
      ?auto_338090 - BLOCK
      ?auto_338091 - BLOCK
      ?auto_338092 - BLOCK
      ?auto_338093 - BLOCK
      ?auto_338094 - BLOCK
      ?auto_338095 - BLOCK
      ?auto_338096 - BLOCK
    )
    :vars
    (
      ?auto_338097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338096 ?auto_338097 ) ( ON-TABLE ?auto_338084 ) ( ON ?auto_338085 ?auto_338084 ) ( ON ?auto_338086 ?auto_338085 ) ( ON ?auto_338087 ?auto_338086 ) ( ON ?auto_338088 ?auto_338087 ) ( not ( = ?auto_338084 ?auto_338085 ) ) ( not ( = ?auto_338084 ?auto_338086 ) ) ( not ( = ?auto_338084 ?auto_338087 ) ) ( not ( = ?auto_338084 ?auto_338088 ) ) ( not ( = ?auto_338084 ?auto_338089 ) ) ( not ( = ?auto_338084 ?auto_338090 ) ) ( not ( = ?auto_338084 ?auto_338091 ) ) ( not ( = ?auto_338084 ?auto_338092 ) ) ( not ( = ?auto_338084 ?auto_338093 ) ) ( not ( = ?auto_338084 ?auto_338094 ) ) ( not ( = ?auto_338084 ?auto_338095 ) ) ( not ( = ?auto_338084 ?auto_338096 ) ) ( not ( = ?auto_338084 ?auto_338097 ) ) ( not ( = ?auto_338085 ?auto_338086 ) ) ( not ( = ?auto_338085 ?auto_338087 ) ) ( not ( = ?auto_338085 ?auto_338088 ) ) ( not ( = ?auto_338085 ?auto_338089 ) ) ( not ( = ?auto_338085 ?auto_338090 ) ) ( not ( = ?auto_338085 ?auto_338091 ) ) ( not ( = ?auto_338085 ?auto_338092 ) ) ( not ( = ?auto_338085 ?auto_338093 ) ) ( not ( = ?auto_338085 ?auto_338094 ) ) ( not ( = ?auto_338085 ?auto_338095 ) ) ( not ( = ?auto_338085 ?auto_338096 ) ) ( not ( = ?auto_338085 ?auto_338097 ) ) ( not ( = ?auto_338086 ?auto_338087 ) ) ( not ( = ?auto_338086 ?auto_338088 ) ) ( not ( = ?auto_338086 ?auto_338089 ) ) ( not ( = ?auto_338086 ?auto_338090 ) ) ( not ( = ?auto_338086 ?auto_338091 ) ) ( not ( = ?auto_338086 ?auto_338092 ) ) ( not ( = ?auto_338086 ?auto_338093 ) ) ( not ( = ?auto_338086 ?auto_338094 ) ) ( not ( = ?auto_338086 ?auto_338095 ) ) ( not ( = ?auto_338086 ?auto_338096 ) ) ( not ( = ?auto_338086 ?auto_338097 ) ) ( not ( = ?auto_338087 ?auto_338088 ) ) ( not ( = ?auto_338087 ?auto_338089 ) ) ( not ( = ?auto_338087 ?auto_338090 ) ) ( not ( = ?auto_338087 ?auto_338091 ) ) ( not ( = ?auto_338087 ?auto_338092 ) ) ( not ( = ?auto_338087 ?auto_338093 ) ) ( not ( = ?auto_338087 ?auto_338094 ) ) ( not ( = ?auto_338087 ?auto_338095 ) ) ( not ( = ?auto_338087 ?auto_338096 ) ) ( not ( = ?auto_338087 ?auto_338097 ) ) ( not ( = ?auto_338088 ?auto_338089 ) ) ( not ( = ?auto_338088 ?auto_338090 ) ) ( not ( = ?auto_338088 ?auto_338091 ) ) ( not ( = ?auto_338088 ?auto_338092 ) ) ( not ( = ?auto_338088 ?auto_338093 ) ) ( not ( = ?auto_338088 ?auto_338094 ) ) ( not ( = ?auto_338088 ?auto_338095 ) ) ( not ( = ?auto_338088 ?auto_338096 ) ) ( not ( = ?auto_338088 ?auto_338097 ) ) ( not ( = ?auto_338089 ?auto_338090 ) ) ( not ( = ?auto_338089 ?auto_338091 ) ) ( not ( = ?auto_338089 ?auto_338092 ) ) ( not ( = ?auto_338089 ?auto_338093 ) ) ( not ( = ?auto_338089 ?auto_338094 ) ) ( not ( = ?auto_338089 ?auto_338095 ) ) ( not ( = ?auto_338089 ?auto_338096 ) ) ( not ( = ?auto_338089 ?auto_338097 ) ) ( not ( = ?auto_338090 ?auto_338091 ) ) ( not ( = ?auto_338090 ?auto_338092 ) ) ( not ( = ?auto_338090 ?auto_338093 ) ) ( not ( = ?auto_338090 ?auto_338094 ) ) ( not ( = ?auto_338090 ?auto_338095 ) ) ( not ( = ?auto_338090 ?auto_338096 ) ) ( not ( = ?auto_338090 ?auto_338097 ) ) ( not ( = ?auto_338091 ?auto_338092 ) ) ( not ( = ?auto_338091 ?auto_338093 ) ) ( not ( = ?auto_338091 ?auto_338094 ) ) ( not ( = ?auto_338091 ?auto_338095 ) ) ( not ( = ?auto_338091 ?auto_338096 ) ) ( not ( = ?auto_338091 ?auto_338097 ) ) ( not ( = ?auto_338092 ?auto_338093 ) ) ( not ( = ?auto_338092 ?auto_338094 ) ) ( not ( = ?auto_338092 ?auto_338095 ) ) ( not ( = ?auto_338092 ?auto_338096 ) ) ( not ( = ?auto_338092 ?auto_338097 ) ) ( not ( = ?auto_338093 ?auto_338094 ) ) ( not ( = ?auto_338093 ?auto_338095 ) ) ( not ( = ?auto_338093 ?auto_338096 ) ) ( not ( = ?auto_338093 ?auto_338097 ) ) ( not ( = ?auto_338094 ?auto_338095 ) ) ( not ( = ?auto_338094 ?auto_338096 ) ) ( not ( = ?auto_338094 ?auto_338097 ) ) ( not ( = ?auto_338095 ?auto_338096 ) ) ( not ( = ?auto_338095 ?auto_338097 ) ) ( not ( = ?auto_338096 ?auto_338097 ) ) ( ON ?auto_338095 ?auto_338096 ) ( ON ?auto_338094 ?auto_338095 ) ( ON ?auto_338093 ?auto_338094 ) ( ON ?auto_338092 ?auto_338093 ) ( ON ?auto_338091 ?auto_338092 ) ( ON ?auto_338090 ?auto_338091 ) ( CLEAR ?auto_338088 ) ( ON ?auto_338089 ?auto_338090 ) ( CLEAR ?auto_338089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_338084 ?auto_338085 ?auto_338086 ?auto_338087 ?auto_338088 ?auto_338089 )
      ( MAKE-13PILE ?auto_338084 ?auto_338085 ?auto_338086 ?auto_338087 ?auto_338088 ?auto_338089 ?auto_338090 ?auto_338091 ?auto_338092 ?auto_338093 ?auto_338094 ?auto_338095 ?auto_338096 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338111 - BLOCK
      ?auto_338112 - BLOCK
      ?auto_338113 - BLOCK
      ?auto_338114 - BLOCK
      ?auto_338115 - BLOCK
      ?auto_338116 - BLOCK
      ?auto_338117 - BLOCK
      ?auto_338118 - BLOCK
      ?auto_338119 - BLOCK
      ?auto_338120 - BLOCK
      ?auto_338121 - BLOCK
      ?auto_338122 - BLOCK
      ?auto_338123 - BLOCK
    )
    :vars
    (
      ?auto_338124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338123 ?auto_338124 ) ( ON-TABLE ?auto_338111 ) ( ON ?auto_338112 ?auto_338111 ) ( ON ?auto_338113 ?auto_338112 ) ( ON ?auto_338114 ?auto_338113 ) ( not ( = ?auto_338111 ?auto_338112 ) ) ( not ( = ?auto_338111 ?auto_338113 ) ) ( not ( = ?auto_338111 ?auto_338114 ) ) ( not ( = ?auto_338111 ?auto_338115 ) ) ( not ( = ?auto_338111 ?auto_338116 ) ) ( not ( = ?auto_338111 ?auto_338117 ) ) ( not ( = ?auto_338111 ?auto_338118 ) ) ( not ( = ?auto_338111 ?auto_338119 ) ) ( not ( = ?auto_338111 ?auto_338120 ) ) ( not ( = ?auto_338111 ?auto_338121 ) ) ( not ( = ?auto_338111 ?auto_338122 ) ) ( not ( = ?auto_338111 ?auto_338123 ) ) ( not ( = ?auto_338111 ?auto_338124 ) ) ( not ( = ?auto_338112 ?auto_338113 ) ) ( not ( = ?auto_338112 ?auto_338114 ) ) ( not ( = ?auto_338112 ?auto_338115 ) ) ( not ( = ?auto_338112 ?auto_338116 ) ) ( not ( = ?auto_338112 ?auto_338117 ) ) ( not ( = ?auto_338112 ?auto_338118 ) ) ( not ( = ?auto_338112 ?auto_338119 ) ) ( not ( = ?auto_338112 ?auto_338120 ) ) ( not ( = ?auto_338112 ?auto_338121 ) ) ( not ( = ?auto_338112 ?auto_338122 ) ) ( not ( = ?auto_338112 ?auto_338123 ) ) ( not ( = ?auto_338112 ?auto_338124 ) ) ( not ( = ?auto_338113 ?auto_338114 ) ) ( not ( = ?auto_338113 ?auto_338115 ) ) ( not ( = ?auto_338113 ?auto_338116 ) ) ( not ( = ?auto_338113 ?auto_338117 ) ) ( not ( = ?auto_338113 ?auto_338118 ) ) ( not ( = ?auto_338113 ?auto_338119 ) ) ( not ( = ?auto_338113 ?auto_338120 ) ) ( not ( = ?auto_338113 ?auto_338121 ) ) ( not ( = ?auto_338113 ?auto_338122 ) ) ( not ( = ?auto_338113 ?auto_338123 ) ) ( not ( = ?auto_338113 ?auto_338124 ) ) ( not ( = ?auto_338114 ?auto_338115 ) ) ( not ( = ?auto_338114 ?auto_338116 ) ) ( not ( = ?auto_338114 ?auto_338117 ) ) ( not ( = ?auto_338114 ?auto_338118 ) ) ( not ( = ?auto_338114 ?auto_338119 ) ) ( not ( = ?auto_338114 ?auto_338120 ) ) ( not ( = ?auto_338114 ?auto_338121 ) ) ( not ( = ?auto_338114 ?auto_338122 ) ) ( not ( = ?auto_338114 ?auto_338123 ) ) ( not ( = ?auto_338114 ?auto_338124 ) ) ( not ( = ?auto_338115 ?auto_338116 ) ) ( not ( = ?auto_338115 ?auto_338117 ) ) ( not ( = ?auto_338115 ?auto_338118 ) ) ( not ( = ?auto_338115 ?auto_338119 ) ) ( not ( = ?auto_338115 ?auto_338120 ) ) ( not ( = ?auto_338115 ?auto_338121 ) ) ( not ( = ?auto_338115 ?auto_338122 ) ) ( not ( = ?auto_338115 ?auto_338123 ) ) ( not ( = ?auto_338115 ?auto_338124 ) ) ( not ( = ?auto_338116 ?auto_338117 ) ) ( not ( = ?auto_338116 ?auto_338118 ) ) ( not ( = ?auto_338116 ?auto_338119 ) ) ( not ( = ?auto_338116 ?auto_338120 ) ) ( not ( = ?auto_338116 ?auto_338121 ) ) ( not ( = ?auto_338116 ?auto_338122 ) ) ( not ( = ?auto_338116 ?auto_338123 ) ) ( not ( = ?auto_338116 ?auto_338124 ) ) ( not ( = ?auto_338117 ?auto_338118 ) ) ( not ( = ?auto_338117 ?auto_338119 ) ) ( not ( = ?auto_338117 ?auto_338120 ) ) ( not ( = ?auto_338117 ?auto_338121 ) ) ( not ( = ?auto_338117 ?auto_338122 ) ) ( not ( = ?auto_338117 ?auto_338123 ) ) ( not ( = ?auto_338117 ?auto_338124 ) ) ( not ( = ?auto_338118 ?auto_338119 ) ) ( not ( = ?auto_338118 ?auto_338120 ) ) ( not ( = ?auto_338118 ?auto_338121 ) ) ( not ( = ?auto_338118 ?auto_338122 ) ) ( not ( = ?auto_338118 ?auto_338123 ) ) ( not ( = ?auto_338118 ?auto_338124 ) ) ( not ( = ?auto_338119 ?auto_338120 ) ) ( not ( = ?auto_338119 ?auto_338121 ) ) ( not ( = ?auto_338119 ?auto_338122 ) ) ( not ( = ?auto_338119 ?auto_338123 ) ) ( not ( = ?auto_338119 ?auto_338124 ) ) ( not ( = ?auto_338120 ?auto_338121 ) ) ( not ( = ?auto_338120 ?auto_338122 ) ) ( not ( = ?auto_338120 ?auto_338123 ) ) ( not ( = ?auto_338120 ?auto_338124 ) ) ( not ( = ?auto_338121 ?auto_338122 ) ) ( not ( = ?auto_338121 ?auto_338123 ) ) ( not ( = ?auto_338121 ?auto_338124 ) ) ( not ( = ?auto_338122 ?auto_338123 ) ) ( not ( = ?auto_338122 ?auto_338124 ) ) ( not ( = ?auto_338123 ?auto_338124 ) ) ( ON ?auto_338122 ?auto_338123 ) ( ON ?auto_338121 ?auto_338122 ) ( ON ?auto_338120 ?auto_338121 ) ( ON ?auto_338119 ?auto_338120 ) ( ON ?auto_338118 ?auto_338119 ) ( ON ?auto_338117 ?auto_338118 ) ( ON ?auto_338116 ?auto_338117 ) ( CLEAR ?auto_338114 ) ( ON ?auto_338115 ?auto_338116 ) ( CLEAR ?auto_338115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_338111 ?auto_338112 ?auto_338113 ?auto_338114 ?auto_338115 )
      ( MAKE-13PILE ?auto_338111 ?auto_338112 ?auto_338113 ?auto_338114 ?auto_338115 ?auto_338116 ?auto_338117 ?auto_338118 ?auto_338119 ?auto_338120 ?auto_338121 ?auto_338122 ?auto_338123 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338138 - BLOCK
      ?auto_338139 - BLOCK
      ?auto_338140 - BLOCK
      ?auto_338141 - BLOCK
      ?auto_338142 - BLOCK
      ?auto_338143 - BLOCK
      ?auto_338144 - BLOCK
      ?auto_338145 - BLOCK
      ?auto_338146 - BLOCK
      ?auto_338147 - BLOCK
      ?auto_338148 - BLOCK
      ?auto_338149 - BLOCK
      ?auto_338150 - BLOCK
    )
    :vars
    (
      ?auto_338151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338150 ?auto_338151 ) ( ON-TABLE ?auto_338138 ) ( ON ?auto_338139 ?auto_338138 ) ( ON ?auto_338140 ?auto_338139 ) ( ON ?auto_338141 ?auto_338140 ) ( not ( = ?auto_338138 ?auto_338139 ) ) ( not ( = ?auto_338138 ?auto_338140 ) ) ( not ( = ?auto_338138 ?auto_338141 ) ) ( not ( = ?auto_338138 ?auto_338142 ) ) ( not ( = ?auto_338138 ?auto_338143 ) ) ( not ( = ?auto_338138 ?auto_338144 ) ) ( not ( = ?auto_338138 ?auto_338145 ) ) ( not ( = ?auto_338138 ?auto_338146 ) ) ( not ( = ?auto_338138 ?auto_338147 ) ) ( not ( = ?auto_338138 ?auto_338148 ) ) ( not ( = ?auto_338138 ?auto_338149 ) ) ( not ( = ?auto_338138 ?auto_338150 ) ) ( not ( = ?auto_338138 ?auto_338151 ) ) ( not ( = ?auto_338139 ?auto_338140 ) ) ( not ( = ?auto_338139 ?auto_338141 ) ) ( not ( = ?auto_338139 ?auto_338142 ) ) ( not ( = ?auto_338139 ?auto_338143 ) ) ( not ( = ?auto_338139 ?auto_338144 ) ) ( not ( = ?auto_338139 ?auto_338145 ) ) ( not ( = ?auto_338139 ?auto_338146 ) ) ( not ( = ?auto_338139 ?auto_338147 ) ) ( not ( = ?auto_338139 ?auto_338148 ) ) ( not ( = ?auto_338139 ?auto_338149 ) ) ( not ( = ?auto_338139 ?auto_338150 ) ) ( not ( = ?auto_338139 ?auto_338151 ) ) ( not ( = ?auto_338140 ?auto_338141 ) ) ( not ( = ?auto_338140 ?auto_338142 ) ) ( not ( = ?auto_338140 ?auto_338143 ) ) ( not ( = ?auto_338140 ?auto_338144 ) ) ( not ( = ?auto_338140 ?auto_338145 ) ) ( not ( = ?auto_338140 ?auto_338146 ) ) ( not ( = ?auto_338140 ?auto_338147 ) ) ( not ( = ?auto_338140 ?auto_338148 ) ) ( not ( = ?auto_338140 ?auto_338149 ) ) ( not ( = ?auto_338140 ?auto_338150 ) ) ( not ( = ?auto_338140 ?auto_338151 ) ) ( not ( = ?auto_338141 ?auto_338142 ) ) ( not ( = ?auto_338141 ?auto_338143 ) ) ( not ( = ?auto_338141 ?auto_338144 ) ) ( not ( = ?auto_338141 ?auto_338145 ) ) ( not ( = ?auto_338141 ?auto_338146 ) ) ( not ( = ?auto_338141 ?auto_338147 ) ) ( not ( = ?auto_338141 ?auto_338148 ) ) ( not ( = ?auto_338141 ?auto_338149 ) ) ( not ( = ?auto_338141 ?auto_338150 ) ) ( not ( = ?auto_338141 ?auto_338151 ) ) ( not ( = ?auto_338142 ?auto_338143 ) ) ( not ( = ?auto_338142 ?auto_338144 ) ) ( not ( = ?auto_338142 ?auto_338145 ) ) ( not ( = ?auto_338142 ?auto_338146 ) ) ( not ( = ?auto_338142 ?auto_338147 ) ) ( not ( = ?auto_338142 ?auto_338148 ) ) ( not ( = ?auto_338142 ?auto_338149 ) ) ( not ( = ?auto_338142 ?auto_338150 ) ) ( not ( = ?auto_338142 ?auto_338151 ) ) ( not ( = ?auto_338143 ?auto_338144 ) ) ( not ( = ?auto_338143 ?auto_338145 ) ) ( not ( = ?auto_338143 ?auto_338146 ) ) ( not ( = ?auto_338143 ?auto_338147 ) ) ( not ( = ?auto_338143 ?auto_338148 ) ) ( not ( = ?auto_338143 ?auto_338149 ) ) ( not ( = ?auto_338143 ?auto_338150 ) ) ( not ( = ?auto_338143 ?auto_338151 ) ) ( not ( = ?auto_338144 ?auto_338145 ) ) ( not ( = ?auto_338144 ?auto_338146 ) ) ( not ( = ?auto_338144 ?auto_338147 ) ) ( not ( = ?auto_338144 ?auto_338148 ) ) ( not ( = ?auto_338144 ?auto_338149 ) ) ( not ( = ?auto_338144 ?auto_338150 ) ) ( not ( = ?auto_338144 ?auto_338151 ) ) ( not ( = ?auto_338145 ?auto_338146 ) ) ( not ( = ?auto_338145 ?auto_338147 ) ) ( not ( = ?auto_338145 ?auto_338148 ) ) ( not ( = ?auto_338145 ?auto_338149 ) ) ( not ( = ?auto_338145 ?auto_338150 ) ) ( not ( = ?auto_338145 ?auto_338151 ) ) ( not ( = ?auto_338146 ?auto_338147 ) ) ( not ( = ?auto_338146 ?auto_338148 ) ) ( not ( = ?auto_338146 ?auto_338149 ) ) ( not ( = ?auto_338146 ?auto_338150 ) ) ( not ( = ?auto_338146 ?auto_338151 ) ) ( not ( = ?auto_338147 ?auto_338148 ) ) ( not ( = ?auto_338147 ?auto_338149 ) ) ( not ( = ?auto_338147 ?auto_338150 ) ) ( not ( = ?auto_338147 ?auto_338151 ) ) ( not ( = ?auto_338148 ?auto_338149 ) ) ( not ( = ?auto_338148 ?auto_338150 ) ) ( not ( = ?auto_338148 ?auto_338151 ) ) ( not ( = ?auto_338149 ?auto_338150 ) ) ( not ( = ?auto_338149 ?auto_338151 ) ) ( not ( = ?auto_338150 ?auto_338151 ) ) ( ON ?auto_338149 ?auto_338150 ) ( ON ?auto_338148 ?auto_338149 ) ( ON ?auto_338147 ?auto_338148 ) ( ON ?auto_338146 ?auto_338147 ) ( ON ?auto_338145 ?auto_338146 ) ( ON ?auto_338144 ?auto_338145 ) ( ON ?auto_338143 ?auto_338144 ) ( CLEAR ?auto_338141 ) ( ON ?auto_338142 ?auto_338143 ) ( CLEAR ?auto_338142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_338138 ?auto_338139 ?auto_338140 ?auto_338141 ?auto_338142 )
      ( MAKE-13PILE ?auto_338138 ?auto_338139 ?auto_338140 ?auto_338141 ?auto_338142 ?auto_338143 ?auto_338144 ?auto_338145 ?auto_338146 ?auto_338147 ?auto_338148 ?auto_338149 ?auto_338150 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338165 - BLOCK
      ?auto_338166 - BLOCK
      ?auto_338167 - BLOCK
      ?auto_338168 - BLOCK
      ?auto_338169 - BLOCK
      ?auto_338170 - BLOCK
      ?auto_338171 - BLOCK
      ?auto_338172 - BLOCK
      ?auto_338173 - BLOCK
      ?auto_338174 - BLOCK
      ?auto_338175 - BLOCK
      ?auto_338176 - BLOCK
      ?auto_338177 - BLOCK
    )
    :vars
    (
      ?auto_338178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338177 ?auto_338178 ) ( ON-TABLE ?auto_338165 ) ( ON ?auto_338166 ?auto_338165 ) ( ON ?auto_338167 ?auto_338166 ) ( not ( = ?auto_338165 ?auto_338166 ) ) ( not ( = ?auto_338165 ?auto_338167 ) ) ( not ( = ?auto_338165 ?auto_338168 ) ) ( not ( = ?auto_338165 ?auto_338169 ) ) ( not ( = ?auto_338165 ?auto_338170 ) ) ( not ( = ?auto_338165 ?auto_338171 ) ) ( not ( = ?auto_338165 ?auto_338172 ) ) ( not ( = ?auto_338165 ?auto_338173 ) ) ( not ( = ?auto_338165 ?auto_338174 ) ) ( not ( = ?auto_338165 ?auto_338175 ) ) ( not ( = ?auto_338165 ?auto_338176 ) ) ( not ( = ?auto_338165 ?auto_338177 ) ) ( not ( = ?auto_338165 ?auto_338178 ) ) ( not ( = ?auto_338166 ?auto_338167 ) ) ( not ( = ?auto_338166 ?auto_338168 ) ) ( not ( = ?auto_338166 ?auto_338169 ) ) ( not ( = ?auto_338166 ?auto_338170 ) ) ( not ( = ?auto_338166 ?auto_338171 ) ) ( not ( = ?auto_338166 ?auto_338172 ) ) ( not ( = ?auto_338166 ?auto_338173 ) ) ( not ( = ?auto_338166 ?auto_338174 ) ) ( not ( = ?auto_338166 ?auto_338175 ) ) ( not ( = ?auto_338166 ?auto_338176 ) ) ( not ( = ?auto_338166 ?auto_338177 ) ) ( not ( = ?auto_338166 ?auto_338178 ) ) ( not ( = ?auto_338167 ?auto_338168 ) ) ( not ( = ?auto_338167 ?auto_338169 ) ) ( not ( = ?auto_338167 ?auto_338170 ) ) ( not ( = ?auto_338167 ?auto_338171 ) ) ( not ( = ?auto_338167 ?auto_338172 ) ) ( not ( = ?auto_338167 ?auto_338173 ) ) ( not ( = ?auto_338167 ?auto_338174 ) ) ( not ( = ?auto_338167 ?auto_338175 ) ) ( not ( = ?auto_338167 ?auto_338176 ) ) ( not ( = ?auto_338167 ?auto_338177 ) ) ( not ( = ?auto_338167 ?auto_338178 ) ) ( not ( = ?auto_338168 ?auto_338169 ) ) ( not ( = ?auto_338168 ?auto_338170 ) ) ( not ( = ?auto_338168 ?auto_338171 ) ) ( not ( = ?auto_338168 ?auto_338172 ) ) ( not ( = ?auto_338168 ?auto_338173 ) ) ( not ( = ?auto_338168 ?auto_338174 ) ) ( not ( = ?auto_338168 ?auto_338175 ) ) ( not ( = ?auto_338168 ?auto_338176 ) ) ( not ( = ?auto_338168 ?auto_338177 ) ) ( not ( = ?auto_338168 ?auto_338178 ) ) ( not ( = ?auto_338169 ?auto_338170 ) ) ( not ( = ?auto_338169 ?auto_338171 ) ) ( not ( = ?auto_338169 ?auto_338172 ) ) ( not ( = ?auto_338169 ?auto_338173 ) ) ( not ( = ?auto_338169 ?auto_338174 ) ) ( not ( = ?auto_338169 ?auto_338175 ) ) ( not ( = ?auto_338169 ?auto_338176 ) ) ( not ( = ?auto_338169 ?auto_338177 ) ) ( not ( = ?auto_338169 ?auto_338178 ) ) ( not ( = ?auto_338170 ?auto_338171 ) ) ( not ( = ?auto_338170 ?auto_338172 ) ) ( not ( = ?auto_338170 ?auto_338173 ) ) ( not ( = ?auto_338170 ?auto_338174 ) ) ( not ( = ?auto_338170 ?auto_338175 ) ) ( not ( = ?auto_338170 ?auto_338176 ) ) ( not ( = ?auto_338170 ?auto_338177 ) ) ( not ( = ?auto_338170 ?auto_338178 ) ) ( not ( = ?auto_338171 ?auto_338172 ) ) ( not ( = ?auto_338171 ?auto_338173 ) ) ( not ( = ?auto_338171 ?auto_338174 ) ) ( not ( = ?auto_338171 ?auto_338175 ) ) ( not ( = ?auto_338171 ?auto_338176 ) ) ( not ( = ?auto_338171 ?auto_338177 ) ) ( not ( = ?auto_338171 ?auto_338178 ) ) ( not ( = ?auto_338172 ?auto_338173 ) ) ( not ( = ?auto_338172 ?auto_338174 ) ) ( not ( = ?auto_338172 ?auto_338175 ) ) ( not ( = ?auto_338172 ?auto_338176 ) ) ( not ( = ?auto_338172 ?auto_338177 ) ) ( not ( = ?auto_338172 ?auto_338178 ) ) ( not ( = ?auto_338173 ?auto_338174 ) ) ( not ( = ?auto_338173 ?auto_338175 ) ) ( not ( = ?auto_338173 ?auto_338176 ) ) ( not ( = ?auto_338173 ?auto_338177 ) ) ( not ( = ?auto_338173 ?auto_338178 ) ) ( not ( = ?auto_338174 ?auto_338175 ) ) ( not ( = ?auto_338174 ?auto_338176 ) ) ( not ( = ?auto_338174 ?auto_338177 ) ) ( not ( = ?auto_338174 ?auto_338178 ) ) ( not ( = ?auto_338175 ?auto_338176 ) ) ( not ( = ?auto_338175 ?auto_338177 ) ) ( not ( = ?auto_338175 ?auto_338178 ) ) ( not ( = ?auto_338176 ?auto_338177 ) ) ( not ( = ?auto_338176 ?auto_338178 ) ) ( not ( = ?auto_338177 ?auto_338178 ) ) ( ON ?auto_338176 ?auto_338177 ) ( ON ?auto_338175 ?auto_338176 ) ( ON ?auto_338174 ?auto_338175 ) ( ON ?auto_338173 ?auto_338174 ) ( ON ?auto_338172 ?auto_338173 ) ( ON ?auto_338171 ?auto_338172 ) ( ON ?auto_338170 ?auto_338171 ) ( ON ?auto_338169 ?auto_338170 ) ( CLEAR ?auto_338167 ) ( ON ?auto_338168 ?auto_338169 ) ( CLEAR ?auto_338168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_338165 ?auto_338166 ?auto_338167 ?auto_338168 )
      ( MAKE-13PILE ?auto_338165 ?auto_338166 ?auto_338167 ?auto_338168 ?auto_338169 ?auto_338170 ?auto_338171 ?auto_338172 ?auto_338173 ?auto_338174 ?auto_338175 ?auto_338176 ?auto_338177 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338192 - BLOCK
      ?auto_338193 - BLOCK
      ?auto_338194 - BLOCK
      ?auto_338195 - BLOCK
      ?auto_338196 - BLOCK
      ?auto_338197 - BLOCK
      ?auto_338198 - BLOCK
      ?auto_338199 - BLOCK
      ?auto_338200 - BLOCK
      ?auto_338201 - BLOCK
      ?auto_338202 - BLOCK
      ?auto_338203 - BLOCK
      ?auto_338204 - BLOCK
    )
    :vars
    (
      ?auto_338205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338204 ?auto_338205 ) ( ON-TABLE ?auto_338192 ) ( ON ?auto_338193 ?auto_338192 ) ( ON ?auto_338194 ?auto_338193 ) ( not ( = ?auto_338192 ?auto_338193 ) ) ( not ( = ?auto_338192 ?auto_338194 ) ) ( not ( = ?auto_338192 ?auto_338195 ) ) ( not ( = ?auto_338192 ?auto_338196 ) ) ( not ( = ?auto_338192 ?auto_338197 ) ) ( not ( = ?auto_338192 ?auto_338198 ) ) ( not ( = ?auto_338192 ?auto_338199 ) ) ( not ( = ?auto_338192 ?auto_338200 ) ) ( not ( = ?auto_338192 ?auto_338201 ) ) ( not ( = ?auto_338192 ?auto_338202 ) ) ( not ( = ?auto_338192 ?auto_338203 ) ) ( not ( = ?auto_338192 ?auto_338204 ) ) ( not ( = ?auto_338192 ?auto_338205 ) ) ( not ( = ?auto_338193 ?auto_338194 ) ) ( not ( = ?auto_338193 ?auto_338195 ) ) ( not ( = ?auto_338193 ?auto_338196 ) ) ( not ( = ?auto_338193 ?auto_338197 ) ) ( not ( = ?auto_338193 ?auto_338198 ) ) ( not ( = ?auto_338193 ?auto_338199 ) ) ( not ( = ?auto_338193 ?auto_338200 ) ) ( not ( = ?auto_338193 ?auto_338201 ) ) ( not ( = ?auto_338193 ?auto_338202 ) ) ( not ( = ?auto_338193 ?auto_338203 ) ) ( not ( = ?auto_338193 ?auto_338204 ) ) ( not ( = ?auto_338193 ?auto_338205 ) ) ( not ( = ?auto_338194 ?auto_338195 ) ) ( not ( = ?auto_338194 ?auto_338196 ) ) ( not ( = ?auto_338194 ?auto_338197 ) ) ( not ( = ?auto_338194 ?auto_338198 ) ) ( not ( = ?auto_338194 ?auto_338199 ) ) ( not ( = ?auto_338194 ?auto_338200 ) ) ( not ( = ?auto_338194 ?auto_338201 ) ) ( not ( = ?auto_338194 ?auto_338202 ) ) ( not ( = ?auto_338194 ?auto_338203 ) ) ( not ( = ?auto_338194 ?auto_338204 ) ) ( not ( = ?auto_338194 ?auto_338205 ) ) ( not ( = ?auto_338195 ?auto_338196 ) ) ( not ( = ?auto_338195 ?auto_338197 ) ) ( not ( = ?auto_338195 ?auto_338198 ) ) ( not ( = ?auto_338195 ?auto_338199 ) ) ( not ( = ?auto_338195 ?auto_338200 ) ) ( not ( = ?auto_338195 ?auto_338201 ) ) ( not ( = ?auto_338195 ?auto_338202 ) ) ( not ( = ?auto_338195 ?auto_338203 ) ) ( not ( = ?auto_338195 ?auto_338204 ) ) ( not ( = ?auto_338195 ?auto_338205 ) ) ( not ( = ?auto_338196 ?auto_338197 ) ) ( not ( = ?auto_338196 ?auto_338198 ) ) ( not ( = ?auto_338196 ?auto_338199 ) ) ( not ( = ?auto_338196 ?auto_338200 ) ) ( not ( = ?auto_338196 ?auto_338201 ) ) ( not ( = ?auto_338196 ?auto_338202 ) ) ( not ( = ?auto_338196 ?auto_338203 ) ) ( not ( = ?auto_338196 ?auto_338204 ) ) ( not ( = ?auto_338196 ?auto_338205 ) ) ( not ( = ?auto_338197 ?auto_338198 ) ) ( not ( = ?auto_338197 ?auto_338199 ) ) ( not ( = ?auto_338197 ?auto_338200 ) ) ( not ( = ?auto_338197 ?auto_338201 ) ) ( not ( = ?auto_338197 ?auto_338202 ) ) ( not ( = ?auto_338197 ?auto_338203 ) ) ( not ( = ?auto_338197 ?auto_338204 ) ) ( not ( = ?auto_338197 ?auto_338205 ) ) ( not ( = ?auto_338198 ?auto_338199 ) ) ( not ( = ?auto_338198 ?auto_338200 ) ) ( not ( = ?auto_338198 ?auto_338201 ) ) ( not ( = ?auto_338198 ?auto_338202 ) ) ( not ( = ?auto_338198 ?auto_338203 ) ) ( not ( = ?auto_338198 ?auto_338204 ) ) ( not ( = ?auto_338198 ?auto_338205 ) ) ( not ( = ?auto_338199 ?auto_338200 ) ) ( not ( = ?auto_338199 ?auto_338201 ) ) ( not ( = ?auto_338199 ?auto_338202 ) ) ( not ( = ?auto_338199 ?auto_338203 ) ) ( not ( = ?auto_338199 ?auto_338204 ) ) ( not ( = ?auto_338199 ?auto_338205 ) ) ( not ( = ?auto_338200 ?auto_338201 ) ) ( not ( = ?auto_338200 ?auto_338202 ) ) ( not ( = ?auto_338200 ?auto_338203 ) ) ( not ( = ?auto_338200 ?auto_338204 ) ) ( not ( = ?auto_338200 ?auto_338205 ) ) ( not ( = ?auto_338201 ?auto_338202 ) ) ( not ( = ?auto_338201 ?auto_338203 ) ) ( not ( = ?auto_338201 ?auto_338204 ) ) ( not ( = ?auto_338201 ?auto_338205 ) ) ( not ( = ?auto_338202 ?auto_338203 ) ) ( not ( = ?auto_338202 ?auto_338204 ) ) ( not ( = ?auto_338202 ?auto_338205 ) ) ( not ( = ?auto_338203 ?auto_338204 ) ) ( not ( = ?auto_338203 ?auto_338205 ) ) ( not ( = ?auto_338204 ?auto_338205 ) ) ( ON ?auto_338203 ?auto_338204 ) ( ON ?auto_338202 ?auto_338203 ) ( ON ?auto_338201 ?auto_338202 ) ( ON ?auto_338200 ?auto_338201 ) ( ON ?auto_338199 ?auto_338200 ) ( ON ?auto_338198 ?auto_338199 ) ( ON ?auto_338197 ?auto_338198 ) ( ON ?auto_338196 ?auto_338197 ) ( CLEAR ?auto_338194 ) ( ON ?auto_338195 ?auto_338196 ) ( CLEAR ?auto_338195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_338192 ?auto_338193 ?auto_338194 ?auto_338195 )
      ( MAKE-13PILE ?auto_338192 ?auto_338193 ?auto_338194 ?auto_338195 ?auto_338196 ?auto_338197 ?auto_338198 ?auto_338199 ?auto_338200 ?auto_338201 ?auto_338202 ?auto_338203 ?auto_338204 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338219 - BLOCK
      ?auto_338220 - BLOCK
      ?auto_338221 - BLOCK
      ?auto_338222 - BLOCK
      ?auto_338223 - BLOCK
      ?auto_338224 - BLOCK
      ?auto_338225 - BLOCK
      ?auto_338226 - BLOCK
      ?auto_338227 - BLOCK
      ?auto_338228 - BLOCK
      ?auto_338229 - BLOCK
      ?auto_338230 - BLOCK
      ?auto_338231 - BLOCK
    )
    :vars
    (
      ?auto_338232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338231 ?auto_338232 ) ( ON-TABLE ?auto_338219 ) ( ON ?auto_338220 ?auto_338219 ) ( not ( = ?auto_338219 ?auto_338220 ) ) ( not ( = ?auto_338219 ?auto_338221 ) ) ( not ( = ?auto_338219 ?auto_338222 ) ) ( not ( = ?auto_338219 ?auto_338223 ) ) ( not ( = ?auto_338219 ?auto_338224 ) ) ( not ( = ?auto_338219 ?auto_338225 ) ) ( not ( = ?auto_338219 ?auto_338226 ) ) ( not ( = ?auto_338219 ?auto_338227 ) ) ( not ( = ?auto_338219 ?auto_338228 ) ) ( not ( = ?auto_338219 ?auto_338229 ) ) ( not ( = ?auto_338219 ?auto_338230 ) ) ( not ( = ?auto_338219 ?auto_338231 ) ) ( not ( = ?auto_338219 ?auto_338232 ) ) ( not ( = ?auto_338220 ?auto_338221 ) ) ( not ( = ?auto_338220 ?auto_338222 ) ) ( not ( = ?auto_338220 ?auto_338223 ) ) ( not ( = ?auto_338220 ?auto_338224 ) ) ( not ( = ?auto_338220 ?auto_338225 ) ) ( not ( = ?auto_338220 ?auto_338226 ) ) ( not ( = ?auto_338220 ?auto_338227 ) ) ( not ( = ?auto_338220 ?auto_338228 ) ) ( not ( = ?auto_338220 ?auto_338229 ) ) ( not ( = ?auto_338220 ?auto_338230 ) ) ( not ( = ?auto_338220 ?auto_338231 ) ) ( not ( = ?auto_338220 ?auto_338232 ) ) ( not ( = ?auto_338221 ?auto_338222 ) ) ( not ( = ?auto_338221 ?auto_338223 ) ) ( not ( = ?auto_338221 ?auto_338224 ) ) ( not ( = ?auto_338221 ?auto_338225 ) ) ( not ( = ?auto_338221 ?auto_338226 ) ) ( not ( = ?auto_338221 ?auto_338227 ) ) ( not ( = ?auto_338221 ?auto_338228 ) ) ( not ( = ?auto_338221 ?auto_338229 ) ) ( not ( = ?auto_338221 ?auto_338230 ) ) ( not ( = ?auto_338221 ?auto_338231 ) ) ( not ( = ?auto_338221 ?auto_338232 ) ) ( not ( = ?auto_338222 ?auto_338223 ) ) ( not ( = ?auto_338222 ?auto_338224 ) ) ( not ( = ?auto_338222 ?auto_338225 ) ) ( not ( = ?auto_338222 ?auto_338226 ) ) ( not ( = ?auto_338222 ?auto_338227 ) ) ( not ( = ?auto_338222 ?auto_338228 ) ) ( not ( = ?auto_338222 ?auto_338229 ) ) ( not ( = ?auto_338222 ?auto_338230 ) ) ( not ( = ?auto_338222 ?auto_338231 ) ) ( not ( = ?auto_338222 ?auto_338232 ) ) ( not ( = ?auto_338223 ?auto_338224 ) ) ( not ( = ?auto_338223 ?auto_338225 ) ) ( not ( = ?auto_338223 ?auto_338226 ) ) ( not ( = ?auto_338223 ?auto_338227 ) ) ( not ( = ?auto_338223 ?auto_338228 ) ) ( not ( = ?auto_338223 ?auto_338229 ) ) ( not ( = ?auto_338223 ?auto_338230 ) ) ( not ( = ?auto_338223 ?auto_338231 ) ) ( not ( = ?auto_338223 ?auto_338232 ) ) ( not ( = ?auto_338224 ?auto_338225 ) ) ( not ( = ?auto_338224 ?auto_338226 ) ) ( not ( = ?auto_338224 ?auto_338227 ) ) ( not ( = ?auto_338224 ?auto_338228 ) ) ( not ( = ?auto_338224 ?auto_338229 ) ) ( not ( = ?auto_338224 ?auto_338230 ) ) ( not ( = ?auto_338224 ?auto_338231 ) ) ( not ( = ?auto_338224 ?auto_338232 ) ) ( not ( = ?auto_338225 ?auto_338226 ) ) ( not ( = ?auto_338225 ?auto_338227 ) ) ( not ( = ?auto_338225 ?auto_338228 ) ) ( not ( = ?auto_338225 ?auto_338229 ) ) ( not ( = ?auto_338225 ?auto_338230 ) ) ( not ( = ?auto_338225 ?auto_338231 ) ) ( not ( = ?auto_338225 ?auto_338232 ) ) ( not ( = ?auto_338226 ?auto_338227 ) ) ( not ( = ?auto_338226 ?auto_338228 ) ) ( not ( = ?auto_338226 ?auto_338229 ) ) ( not ( = ?auto_338226 ?auto_338230 ) ) ( not ( = ?auto_338226 ?auto_338231 ) ) ( not ( = ?auto_338226 ?auto_338232 ) ) ( not ( = ?auto_338227 ?auto_338228 ) ) ( not ( = ?auto_338227 ?auto_338229 ) ) ( not ( = ?auto_338227 ?auto_338230 ) ) ( not ( = ?auto_338227 ?auto_338231 ) ) ( not ( = ?auto_338227 ?auto_338232 ) ) ( not ( = ?auto_338228 ?auto_338229 ) ) ( not ( = ?auto_338228 ?auto_338230 ) ) ( not ( = ?auto_338228 ?auto_338231 ) ) ( not ( = ?auto_338228 ?auto_338232 ) ) ( not ( = ?auto_338229 ?auto_338230 ) ) ( not ( = ?auto_338229 ?auto_338231 ) ) ( not ( = ?auto_338229 ?auto_338232 ) ) ( not ( = ?auto_338230 ?auto_338231 ) ) ( not ( = ?auto_338230 ?auto_338232 ) ) ( not ( = ?auto_338231 ?auto_338232 ) ) ( ON ?auto_338230 ?auto_338231 ) ( ON ?auto_338229 ?auto_338230 ) ( ON ?auto_338228 ?auto_338229 ) ( ON ?auto_338227 ?auto_338228 ) ( ON ?auto_338226 ?auto_338227 ) ( ON ?auto_338225 ?auto_338226 ) ( ON ?auto_338224 ?auto_338225 ) ( ON ?auto_338223 ?auto_338224 ) ( ON ?auto_338222 ?auto_338223 ) ( CLEAR ?auto_338220 ) ( ON ?auto_338221 ?auto_338222 ) ( CLEAR ?auto_338221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_338219 ?auto_338220 ?auto_338221 )
      ( MAKE-13PILE ?auto_338219 ?auto_338220 ?auto_338221 ?auto_338222 ?auto_338223 ?auto_338224 ?auto_338225 ?auto_338226 ?auto_338227 ?auto_338228 ?auto_338229 ?auto_338230 ?auto_338231 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338246 - BLOCK
      ?auto_338247 - BLOCK
      ?auto_338248 - BLOCK
      ?auto_338249 - BLOCK
      ?auto_338250 - BLOCK
      ?auto_338251 - BLOCK
      ?auto_338252 - BLOCK
      ?auto_338253 - BLOCK
      ?auto_338254 - BLOCK
      ?auto_338255 - BLOCK
      ?auto_338256 - BLOCK
      ?auto_338257 - BLOCK
      ?auto_338258 - BLOCK
    )
    :vars
    (
      ?auto_338259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338258 ?auto_338259 ) ( ON-TABLE ?auto_338246 ) ( ON ?auto_338247 ?auto_338246 ) ( not ( = ?auto_338246 ?auto_338247 ) ) ( not ( = ?auto_338246 ?auto_338248 ) ) ( not ( = ?auto_338246 ?auto_338249 ) ) ( not ( = ?auto_338246 ?auto_338250 ) ) ( not ( = ?auto_338246 ?auto_338251 ) ) ( not ( = ?auto_338246 ?auto_338252 ) ) ( not ( = ?auto_338246 ?auto_338253 ) ) ( not ( = ?auto_338246 ?auto_338254 ) ) ( not ( = ?auto_338246 ?auto_338255 ) ) ( not ( = ?auto_338246 ?auto_338256 ) ) ( not ( = ?auto_338246 ?auto_338257 ) ) ( not ( = ?auto_338246 ?auto_338258 ) ) ( not ( = ?auto_338246 ?auto_338259 ) ) ( not ( = ?auto_338247 ?auto_338248 ) ) ( not ( = ?auto_338247 ?auto_338249 ) ) ( not ( = ?auto_338247 ?auto_338250 ) ) ( not ( = ?auto_338247 ?auto_338251 ) ) ( not ( = ?auto_338247 ?auto_338252 ) ) ( not ( = ?auto_338247 ?auto_338253 ) ) ( not ( = ?auto_338247 ?auto_338254 ) ) ( not ( = ?auto_338247 ?auto_338255 ) ) ( not ( = ?auto_338247 ?auto_338256 ) ) ( not ( = ?auto_338247 ?auto_338257 ) ) ( not ( = ?auto_338247 ?auto_338258 ) ) ( not ( = ?auto_338247 ?auto_338259 ) ) ( not ( = ?auto_338248 ?auto_338249 ) ) ( not ( = ?auto_338248 ?auto_338250 ) ) ( not ( = ?auto_338248 ?auto_338251 ) ) ( not ( = ?auto_338248 ?auto_338252 ) ) ( not ( = ?auto_338248 ?auto_338253 ) ) ( not ( = ?auto_338248 ?auto_338254 ) ) ( not ( = ?auto_338248 ?auto_338255 ) ) ( not ( = ?auto_338248 ?auto_338256 ) ) ( not ( = ?auto_338248 ?auto_338257 ) ) ( not ( = ?auto_338248 ?auto_338258 ) ) ( not ( = ?auto_338248 ?auto_338259 ) ) ( not ( = ?auto_338249 ?auto_338250 ) ) ( not ( = ?auto_338249 ?auto_338251 ) ) ( not ( = ?auto_338249 ?auto_338252 ) ) ( not ( = ?auto_338249 ?auto_338253 ) ) ( not ( = ?auto_338249 ?auto_338254 ) ) ( not ( = ?auto_338249 ?auto_338255 ) ) ( not ( = ?auto_338249 ?auto_338256 ) ) ( not ( = ?auto_338249 ?auto_338257 ) ) ( not ( = ?auto_338249 ?auto_338258 ) ) ( not ( = ?auto_338249 ?auto_338259 ) ) ( not ( = ?auto_338250 ?auto_338251 ) ) ( not ( = ?auto_338250 ?auto_338252 ) ) ( not ( = ?auto_338250 ?auto_338253 ) ) ( not ( = ?auto_338250 ?auto_338254 ) ) ( not ( = ?auto_338250 ?auto_338255 ) ) ( not ( = ?auto_338250 ?auto_338256 ) ) ( not ( = ?auto_338250 ?auto_338257 ) ) ( not ( = ?auto_338250 ?auto_338258 ) ) ( not ( = ?auto_338250 ?auto_338259 ) ) ( not ( = ?auto_338251 ?auto_338252 ) ) ( not ( = ?auto_338251 ?auto_338253 ) ) ( not ( = ?auto_338251 ?auto_338254 ) ) ( not ( = ?auto_338251 ?auto_338255 ) ) ( not ( = ?auto_338251 ?auto_338256 ) ) ( not ( = ?auto_338251 ?auto_338257 ) ) ( not ( = ?auto_338251 ?auto_338258 ) ) ( not ( = ?auto_338251 ?auto_338259 ) ) ( not ( = ?auto_338252 ?auto_338253 ) ) ( not ( = ?auto_338252 ?auto_338254 ) ) ( not ( = ?auto_338252 ?auto_338255 ) ) ( not ( = ?auto_338252 ?auto_338256 ) ) ( not ( = ?auto_338252 ?auto_338257 ) ) ( not ( = ?auto_338252 ?auto_338258 ) ) ( not ( = ?auto_338252 ?auto_338259 ) ) ( not ( = ?auto_338253 ?auto_338254 ) ) ( not ( = ?auto_338253 ?auto_338255 ) ) ( not ( = ?auto_338253 ?auto_338256 ) ) ( not ( = ?auto_338253 ?auto_338257 ) ) ( not ( = ?auto_338253 ?auto_338258 ) ) ( not ( = ?auto_338253 ?auto_338259 ) ) ( not ( = ?auto_338254 ?auto_338255 ) ) ( not ( = ?auto_338254 ?auto_338256 ) ) ( not ( = ?auto_338254 ?auto_338257 ) ) ( not ( = ?auto_338254 ?auto_338258 ) ) ( not ( = ?auto_338254 ?auto_338259 ) ) ( not ( = ?auto_338255 ?auto_338256 ) ) ( not ( = ?auto_338255 ?auto_338257 ) ) ( not ( = ?auto_338255 ?auto_338258 ) ) ( not ( = ?auto_338255 ?auto_338259 ) ) ( not ( = ?auto_338256 ?auto_338257 ) ) ( not ( = ?auto_338256 ?auto_338258 ) ) ( not ( = ?auto_338256 ?auto_338259 ) ) ( not ( = ?auto_338257 ?auto_338258 ) ) ( not ( = ?auto_338257 ?auto_338259 ) ) ( not ( = ?auto_338258 ?auto_338259 ) ) ( ON ?auto_338257 ?auto_338258 ) ( ON ?auto_338256 ?auto_338257 ) ( ON ?auto_338255 ?auto_338256 ) ( ON ?auto_338254 ?auto_338255 ) ( ON ?auto_338253 ?auto_338254 ) ( ON ?auto_338252 ?auto_338253 ) ( ON ?auto_338251 ?auto_338252 ) ( ON ?auto_338250 ?auto_338251 ) ( ON ?auto_338249 ?auto_338250 ) ( CLEAR ?auto_338247 ) ( ON ?auto_338248 ?auto_338249 ) ( CLEAR ?auto_338248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_338246 ?auto_338247 ?auto_338248 )
      ( MAKE-13PILE ?auto_338246 ?auto_338247 ?auto_338248 ?auto_338249 ?auto_338250 ?auto_338251 ?auto_338252 ?auto_338253 ?auto_338254 ?auto_338255 ?auto_338256 ?auto_338257 ?auto_338258 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338273 - BLOCK
      ?auto_338274 - BLOCK
      ?auto_338275 - BLOCK
      ?auto_338276 - BLOCK
      ?auto_338277 - BLOCK
      ?auto_338278 - BLOCK
      ?auto_338279 - BLOCK
      ?auto_338280 - BLOCK
      ?auto_338281 - BLOCK
      ?auto_338282 - BLOCK
      ?auto_338283 - BLOCK
      ?auto_338284 - BLOCK
      ?auto_338285 - BLOCK
    )
    :vars
    (
      ?auto_338286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338285 ?auto_338286 ) ( ON-TABLE ?auto_338273 ) ( not ( = ?auto_338273 ?auto_338274 ) ) ( not ( = ?auto_338273 ?auto_338275 ) ) ( not ( = ?auto_338273 ?auto_338276 ) ) ( not ( = ?auto_338273 ?auto_338277 ) ) ( not ( = ?auto_338273 ?auto_338278 ) ) ( not ( = ?auto_338273 ?auto_338279 ) ) ( not ( = ?auto_338273 ?auto_338280 ) ) ( not ( = ?auto_338273 ?auto_338281 ) ) ( not ( = ?auto_338273 ?auto_338282 ) ) ( not ( = ?auto_338273 ?auto_338283 ) ) ( not ( = ?auto_338273 ?auto_338284 ) ) ( not ( = ?auto_338273 ?auto_338285 ) ) ( not ( = ?auto_338273 ?auto_338286 ) ) ( not ( = ?auto_338274 ?auto_338275 ) ) ( not ( = ?auto_338274 ?auto_338276 ) ) ( not ( = ?auto_338274 ?auto_338277 ) ) ( not ( = ?auto_338274 ?auto_338278 ) ) ( not ( = ?auto_338274 ?auto_338279 ) ) ( not ( = ?auto_338274 ?auto_338280 ) ) ( not ( = ?auto_338274 ?auto_338281 ) ) ( not ( = ?auto_338274 ?auto_338282 ) ) ( not ( = ?auto_338274 ?auto_338283 ) ) ( not ( = ?auto_338274 ?auto_338284 ) ) ( not ( = ?auto_338274 ?auto_338285 ) ) ( not ( = ?auto_338274 ?auto_338286 ) ) ( not ( = ?auto_338275 ?auto_338276 ) ) ( not ( = ?auto_338275 ?auto_338277 ) ) ( not ( = ?auto_338275 ?auto_338278 ) ) ( not ( = ?auto_338275 ?auto_338279 ) ) ( not ( = ?auto_338275 ?auto_338280 ) ) ( not ( = ?auto_338275 ?auto_338281 ) ) ( not ( = ?auto_338275 ?auto_338282 ) ) ( not ( = ?auto_338275 ?auto_338283 ) ) ( not ( = ?auto_338275 ?auto_338284 ) ) ( not ( = ?auto_338275 ?auto_338285 ) ) ( not ( = ?auto_338275 ?auto_338286 ) ) ( not ( = ?auto_338276 ?auto_338277 ) ) ( not ( = ?auto_338276 ?auto_338278 ) ) ( not ( = ?auto_338276 ?auto_338279 ) ) ( not ( = ?auto_338276 ?auto_338280 ) ) ( not ( = ?auto_338276 ?auto_338281 ) ) ( not ( = ?auto_338276 ?auto_338282 ) ) ( not ( = ?auto_338276 ?auto_338283 ) ) ( not ( = ?auto_338276 ?auto_338284 ) ) ( not ( = ?auto_338276 ?auto_338285 ) ) ( not ( = ?auto_338276 ?auto_338286 ) ) ( not ( = ?auto_338277 ?auto_338278 ) ) ( not ( = ?auto_338277 ?auto_338279 ) ) ( not ( = ?auto_338277 ?auto_338280 ) ) ( not ( = ?auto_338277 ?auto_338281 ) ) ( not ( = ?auto_338277 ?auto_338282 ) ) ( not ( = ?auto_338277 ?auto_338283 ) ) ( not ( = ?auto_338277 ?auto_338284 ) ) ( not ( = ?auto_338277 ?auto_338285 ) ) ( not ( = ?auto_338277 ?auto_338286 ) ) ( not ( = ?auto_338278 ?auto_338279 ) ) ( not ( = ?auto_338278 ?auto_338280 ) ) ( not ( = ?auto_338278 ?auto_338281 ) ) ( not ( = ?auto_338278 ?auto_338282 ) ) ( not ( = ?auto_338278 ?auto_338283 ) ) ( not ( = ?auto_338278 ?auto_338284 ) ) ( not ( = ?auto_338278 ?auto_338285 ) ) ( not ( = ?auto_338278 ?auto_338286 ) ) ( not ( = ?auto_338279 ?auto_338280 ) ) ( not ( = ?auto_338279 ?auto_338281 ) ) ( not ( = ?auto_338279 ?auto_338282 ) ) ( not ( = ?auto_338279 ?auto_338283 ) ) ( not ( = ?auto_338279 ?auto_338284 ) ) ( not ( = ?auto_338279 ?auto_338285 ) ) ( not ( = ?auto_338279 ?auto_338286 ) ) ( not ( = ?auto_338280 ?auto_338281 ) ) ( not ( = ?auto_338280 ?auto_338282 ) ) ( not ( = ?auto_338280 ?auto_338283 ) ) ( not ( = ?auto_338280 ?auto_338284 ) ) ( not ( = ?auto_338280 ?auto_338285 ) ) ( not ( = ?auto_338280 ?auto_338286 ) ) ( not ( = ?auto_338281 ?auto_338282 ) ) ( not ( = ?auto_338281 ?auto_338283 ) ) ( not ( = ?auto_338281 ?auto_338284 ) ) ( not ( = ?auto_338281 ?auto_338285 ) ) ( not ( = ?auto_338281 ?auto_338286 ) ) ( not ( = ?auto_338282 ?auto_338283 ) ) ( not ( = ?auto_338282 ?auto_338284 ) ) ( not ( = ?auto_338282 ?auto_338285 ) ) ( not ( = ?auto_338282 ?auto_338286 ) ) ( not ( = ?auto_338283 ?auto_338284 ) ) ( not ( = ?auto_338283 ?auto_338285 ) ) ( not ( = ?auto_338283 ?auto_338286 ) ) ( not ( = ?auto_338284 ?auto_338285 ) ) ( not ( = ?auto_338284 ?auto_338286 ) ) ( not ( = ?auto_338285 ?auto_338286 ) ) ( ON ?auto_338284 ?auto_338285 ) ( ON ?auto_338283 ?auto_338284 ) ( ON ?auto_338282 ?auto_338283 ) ( ON ?auto_338281 ?auto_338282 ) ( ON ?auto_338280 ?auto_338281 ) ( ON ?auto_338279 ?auto_338280 ) ( ON ?auto_338278 ?auto_338279 ) ( ON ?auto_338277 ?auto_338278 ) ( ON ?auto_338276 ?auto_338277 ) ( ON ?auto_338275 ?auto_338276 ) ( CLEAR ?auto_338273 ) ( ON ?auto_338274 ?auto_338275 ) ( CLEAR ?auto_338274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_338273 ?auto_338274 )
      ( MAKE-13PILE ?auto_338273 ?auto_338274 ?auto_338275 ?auto_338276 ?auto_338277 ?auto_338278 ?auto_338279 ?auto_338280 ?auto_338281 ?auto_338282 ?auto_338283 ?auto_338284 ?auto_338285 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338300 - BLOCK
      ?auto_338301 - BLOCK
      ?auto_338302 - BLOCK
      ?auto_338303 - BLOCK
      ?auto_338304 - BLOCK
      ?auto_338305 - BLOCK
      ?auto_338306 - BLOCK
      ?auto_338307 - BLOCK
      ?auto_338308 - BLOCK
      ?auto_338309 - BLOCK
      ?auto_338310 - BLOCK
      ?auto_338311 - BLOCK
      ?auto_338312 - BLOCK
    )
    :vars
    (
      ?auto_338313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338312 ?auto_338313 ) ( ON-TABLE ?auto_338300 ) ( not ( = ?auto_338300 ?auto_338301 ) ) ( not ( = ?auto_338300 ?auto_338302 ) ) ( not ( = ?auto_338300 ?auto_338303 ) ) ( not ( = ?auto_338300 ?auto_338304 ) ) ( not ( = ?auto_338300 ?auto_338305 ) ) ( not ( = ?auto_338300 ?auto_338306 ) ) ( not ( = ?auto_338300 ?auto_338307 ) ) ( not ( = ?auto_338300 ?auto_338308 ) ) ( not ( = ?auto_338300 ?auto_338309 ) ) ( not ( = ?auto_338300 ?auto_338310 ) ) ( not ( = ?auto_338300 ?auto_338311 ) ) ( not ( = ?auto_338300 ?auto_338312 ) ) ( not ( = ?auto_338300 ?auto_338313 ) ) ( not ( = ?auto_338301 ?auto_338302 ) ) ( not ( = ?auto_338301 ?auto_338303 ) ) ( not ( = ?auto_338301 ?auto_338304 ) ) ( not ( = ?auto_338301 ?auto_338305 ) ) ( not ( = ?auto_338301 ?auto_338306 ) ) ( not ( = ?auto_338301 ?auto_338307 ) ) ( not ( = ?auto_338301 ?auto_338308 ) ) ( not ( = ?auto_338301 ?auto_338309 ) ) ( not ( = ?auto_338301 ?auto_338310 ) ) ( not ( = ?auto_338301 ?auto_338311 ) ) ( not ( = ?auto_338301 ?auto_338312 ) ) ( not ( = ?auto_338301 ?auto_338313 ) ) ( not ( = ?auto_338302 ?auto_338303 ) ) ( not ( = ?auto_338302 ?auto_338304 ) ) ( not ( = ?auto_338302 ?auto_338305 ) ) ( not ( = ?auto_338302 ?auto_338306 ) ) ( not ( = ?auto_338302 ?auto_338307 ) ) ( not ( = ?auto_338302 ?auto_338308 ) ) ( not ( = ?auto_338302 ?auto_338309 ) ) ( not ( = ?auto_338302 ?auto_338310 ) ) ( not ( = ?auto_338302 ?auto_338311 ) ) ( not ( = ?auto_338302 ?auto_338312 ) ) ( not ( = ?auto_338302 ?auto_338313 ) ) ( not ( = ?auto_338303 ?auto_338304 ) ) ( not ( = ?auto_338303 ?auto_338305 ) ) ( not ( = ?auto_338303 ?auto_338306 ) ) ( not ( = ?auto_338303 ?auto_338307 ) ) ( not ( = ?auto_338303 ?auto_338308 ) ) ( not ( = ?auto_338303 ?auto_338309 ) ) ( not ( = ?auto_338303 ?auto_338310 ) ) ( not ( = ?auto_338303 ?auto_338311 ) ) ( not ( = ?auto_338303 ?auto_338312 ) ) ( not ( = ?auto_338303 ?auto_338313 ) ) ( not ( = ?auto_338304 ?auto_338305 ) ) ( not ( = ?auto_338304 ?auto_338306 ) ) ( not ( = ?auto_338304 ?auto_338307 ) ) ( not ( = ?auto_338304 ?auto_338308 ) ) ( not ( = ?auto_338304 ?auto_338309 ) ) ( not ( = ?auto_338304 ?auto_338310 ) ) ( not ( = ?auto_338304 ?auto_338311 ) ) ( not ( = ?auto_338304 ?auto_338312 ) ) ( not ( = ?auto_338304 ?auto_338313 ) ) ( not ( = ?auto_338305 ?auto_338306 ) ) ( not ( = ?auto_338305 ?auto_338307 ) ) ( not ( = ?auto_338305 ?auto_338308 ) ) ( not ( = ?auto_338305 ?auto_338309 ) ) ( not ( = ?auto_338305 ?auto_338310 ) ) ( not ( = ?auto_338305 ?auto_338311 ) ) ( not ( = ?auto_338305 ?auto_338312 ) ) ( not ( = ?auto_338305 ?auto_338313 ) ) ( not ( = ?auto_338306 ?auto_338307 ) ) ( not ( = ?auto_338306 ?auto_338308 ) ) ( not ( = ?auto_338306 ?auto_338309 ) ) ( not ( = ?auto_338306 ?auto_338310 ) ) ( not ( = ?auto_338306 ?auto_338311 ) ) ( not ( = ?auto_338306 ?auto_338312 ) ) ( not ( = ?auto_338306 ?auto_338313 ) ) ( not ( = ?auto_338307 ?auto_338308 ) ) ( not ( = ?auto_338307 ?auto_338309 ) ) ( not ( = ?auto_338307 ?auto_338310 ) ) ( not ( = ?auto_338307 ?auto_338311 ) ) ( not ( = ?auto_338307 ?auto_338312 ) ) ( not ( = ?auto_338307 ?auto_338313 ) ) ( not ( = ?auto_338308 ?auto_338309 ) ) ( not ( = ?auto_338308 ?auto_338310 ) ) ( not ( = ?auto_338308 ?auto_338311 ) ) ( not ( = ?auto_338308 ?auto_338312 ) ) ( not ( = ?auto_338308 ?auto_338313 ) ) ( not ( = ?auto_338309 ?auto_338310 ) ) ( not ( = ?auto_338309 ?auto_338311 ) ) ( not ( = ?auto_338309 ?auto_338312 ) ) ( not ( = ?auto_338309 ?auto_338313 ) ) ( not ( = ?auto_338310 ?auto_338311 ) ) ( not ( = ?auto_338310 ?auto_338312 ) ) ( not ( = ?auto_338310 ?auto_338313 ) ) ( not ( = ?auto_338311 ?auto_338312 ) ) ( not ( = ?auto_338311 ?auto_338313 ) ) ( not ( = ?auto_338312 ?auto_338313 ) ) ( ON ?auto_338311 ?auto_338312 ) ( ON ?auto_338310 ?auto_338311 ) ( ON ?auto_338309 ?auto_338310 ) ( ON ?auto_338308 ?auto_338309 ) ( ON ?auto_338307 ?auto_338308 ) ( ON ?auto_338306 ?auto_338307 ) ( ON ?auto_338305 ?auto_338306 ) ( ON ?auto_338304 ?auto_338305 ) ( ON ?auto_338303 ?auto_338304 ) ( ON ?auto_338302 ?auto_338303 ) ( CLEAR ?auto_338300 ) ( ON ?auto_338301 ?auto_338302 ) ( CLEAR ?auto_338301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_338300 ?auto_338301 )
      ( MAKE-13PILE ?auto_338300 ?auto_338301 ?auto_338302 ?auto_338303 ?auto_338304 ?auto_338305 ?auto_338306 ?auto_338307 ?auto_338308 ?auto_338309 ?auto_338310 ?auto_338311 ?auto_338312 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338327 - BLOCK
      ?auto_338328 - BLOCK
      ?auto_338329 - BLOCK
      ?auto_338330 - BLOCK
      ?auto_338331 - BLOCK
      ?auto_338332 - BLOCK
      ?auto_338333 - BLOCK
      ?auto_338334 - BLOCK
      ?auto_338335 - BLOCK
      ?auto_338336 - BLOCK
      ?auto_338337 - BLOCK
      ?auto_338338 - BLOCK
      ?auto_338339 - BLOCK
    )
    :vars
    (
      ?auto_338340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338339 ?auto_338340 ) ( not ( = ?auto_338327 ?auto_338328 ) ) ( not ( = ?auto_338327 ?auto_338329 ) ) ( not ( = ?auto_338327 ?auto_338330 ) ) ( not ( = ?auto_338327 ?auto_338331 ) ) ( not ( = ?auto_338327 ?auto_338332 ) ) ( not ( = ?auto_338327 ?auto_338333 ) ) ( not ( = ?auto_338327 ?auto_338334 ) ) ( not ( = ?auto_338327 ?auto_338335 ) ) ( not ( = ?auto_338327 ?auto_338336 ) ) ( not ( = ?auto_338327 ?auto_338337 ) ) ( not ( = ?auto_338327 ?auto_338338 ) ) ( not ( = ?auto_338327 ?auto_338339 ) ) ( not ( = ?auto_338327 ?auto_338340 ) ) ( not ( = ?auto_338328 ?auto_338329 ) ) ( not ( = ?auto_338328 ?auto_338330 ) ) ( not ( = ?auto_338328 ?auto_338331 ) ) ( not ( = ?auto_338328 ?auto_338332 ) ) ( not ( = ?auto_338328 ?auto_338333 ) ) ( not ( = ?auto_338328 ?auto_338334 ) ) ( not ( = ?auto_338328 ?auto_338335 ) ) ( not ( = ?auto_338328 ?auto_338336 ) ) ( not ( = ?auto_338328 ?auto_338337 ) ) ( not ( = ?auto_338328 ?auto_338338 ) ) ( not ( = ?auto_338328 ?auto_338339 ) ) ( not ( = ?auto_338328 ?auto_338340 ) ) ( not ( = ?auto_338329 ?auto_338330 ) ) ( not ( = ?auto_338329 ?auto_338331 ) ) ( not ( = ?auto_338329 ?auto_338332 ) ) ( not ( = ?auto_338329 ?auto_338333 ) ) ( not ( = ?auto_338329 ?auto_338334 ) ) ( not ( = ?auto_338329 ?auto_338335 ) ) ( not ( = ?auto_338329 ?auto_338336 ) ) ( not ( = ?auto_338329 ?auto_338337 ) ) ( not ( = ?auto_338329 ?auto_338338 ) ) ( not ( = ?auto_338329 ?auto_338339 ) ) ( not ( = ?auto_338329 ?auto_338340 ) ) ( not ( = ?auto_338330 ?auto_338331 ) ) ( not ( = ?auto_338330 ?auto_338332 ) ) ( not ( = ?auto_338330 ?auto_338333 ) ) ( not ( = ?auto_338330 ?auto_338334 ) ) ( not ( = ?auto_338330 ?auto_338335 ) ) ( not ( = ?auto_338330 ?auto_338336 ) ) ( not ( = ?auto_338330 ?auto_338337 ) ) ( not ( = ?auto_338330 ?auto_338338 ) ) ( not ( = ?auto_338330 ?auto_338339 ) ) ( not ( = ?auto_338330 ?auto_338340 ) ) ( not ( = ?auto_338331 ?auto_338332 ) ) ( not ( = ?auto_338331 ?auto_338333 ) ) ( not ( = ?auto_338331 ?auto_338334 ) ) ( not ( = ?auto_338331 ?auto_338335 ) ) ( not ( = ?auto_338331 ?auto_338336 ) ) ( not ( = ?auto_338331 ?auto_338337 ) ) ( not ( = ?auto_338331 ?auto_338338 ) ) ( not ( = ?auto_338331 ?auto_338339 ) ) ( not ( = ?auto_338331 ?auto_338340 ) ) ( not ( = ?auto_338332 ?auto_338333 ) ) ( not ( = ?auto_338332 ?auto_338334 ) ) ( not ( = ?auto_338332 ?auto_338335 ) ) ( not ( = ?auto_338332 ?auto_338336 ) ) ( not ( = ?auto_338332 ?auto_338337 ) ) ( not ( = ?auto_338332 ?auto_338338 ) ) ( not ( = ?auto_338332 ?auto_338339 ) ) ( not ( = ?auto_338332 ?auto_338340 ) ) ( not ( = ?auto_338333 ?auto_338334 ) ) ( not ( = ?auto_338333 ?auto_338335 ) ) ( not ( = ?auto_338333 ?auto_338336 ) ) ( not ( = ?auto_338333 ?auto_338337 ) ) ( not ( = ?auto_338333 ?auto_338338 ) ) ( not ( = ?auto_338333 ?auto_338339 ) ) ( not ( = ?auto_338333 ?auto_338340 ) ) ( not ( = ?auto_338334 ?auto_338335 ) ) ( not ( = ?auto_338334 ?auto_338336 ) ) ( not ( = ?auto_338334 ?auto_338337 ) ) ( not ( = ?auto_338334 ?auto_338338 ) ) ( not ( = ?auto_338334 ?auto_338339 ) ) ( not ( = ?auto_338334 ?auto_338340 ) ) ( not ( = ?auto_338335 ?auto_338336 ) ) ( not ( = ?auto_338335 ?auto_338337 ) ) ( not ( = ?auto_338335 ?auto_338338 ) ) ( not ( = ?auto_338335 ?auto_338339 ) ) ( not ( = ?auto_338335 ?auto_338340 ) ) ( not ( = ?auto_338336 ?auto_338337 ) ) ( not ( = ?auto_338336 ?auto_338338 ) ) ( not ( = ?auto_338336 ?auto_338339 ) ) ( not ( = ?auto_338336 ?auto_338340 ) ) ( not ( = ?auto_338337 ?auto_338338 ) ) ( not ( = ?auto_338337 ?auto_338339 ) ) ( not ( = ?auto_338337 ?auto_338340 ) ) ( not ( = ?auto_338338 ?auto_338339 ) ) ( not ( = ?auto_338338 ?auto_338340 ) ) ( not ( = ?auto_338339 ?auto_338340 ) ) ( ON ?auto_338338 ?auto_338339 ) ( ON ?auto_338337 ?auto_338338 ) ( ON ?auto_338336 ?auto_338337 ) ( ON ?auto_338335 ?auto_338336 ) ( ON ?auto_338334 ?auto_338335 ) ( ON ?auto_338333 ?auto_338334 ) ( ON ?auto_338332 ?auto_338333 ) ( ON ?auto_338331 ?auto_338332 ) ( ON ?auto_338330 ?auto_338331 ) ( ON ?auto_338329 ?auto_338330 ) ( ON ?auto_338328 ?auto_338329 ) ( ON ?auto_338327 ?auto_338328 ) ( CLEAR ?auto_338327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_338327 )
      ( MAKE-13PILE ?auto_338327 ?auto_338328 ?auto_338329 ?auto_338330 ?auto_338331 ?auto_338332 ?auto_338333 ?auto_338334 ?auto_338335 ?auto_338336 ?auto_338337 ?auto_338338 ?auto_338339 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_338354 - BLOCK
      ?auto_338355 - BLOCK
      ?auto_338356 - BLOCK
      ?auto_338357 - BLOCK
      ?auto_338358 - BLOCK
      ?auto_338359 - BLOCK
      ?auto_338360 - BLOCK
      ?auto_338361 - BLOCK
      ?auto_338362 - BLOCK
      ?auto_338363 - BLOCK
      ?auto_338364 - BLOCK
      ?auto_338365 - BLOCK
      ?auto_338366 - BLOCK
    )
    :vars
    (
      ?auto_338367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338366 ?auto_338367 ) ( not ( = ?auto_338354 ?auto_338355 ) ) ( not ( = ?auto_338354 ?auto_338356 ) ) ( not ( = ?auto_338354 ?auto_338357 ) ) ( not ( = ?auto_338354 ?auto_338358 ) ) ( not ( = ?auto_338354 ?auto_338359 ) ) ( not ( = ?auto_338354 ?auto_338360 ) ) ( not ( = ?auto_338354 ?auto_338361 ) ) ( not ( = ?auto_338354 ?auto_338362 ) ) ( not ( = ?auto_338354 ?auto_338363 ) ) ( not ( = ?auto_338354 ?auto_338364 ) ) ( not ( = ?auto_338354 ?auto_338365 ) ) ( not ( = ?auto_338354 ?auto_338366 ) ) ( not ( = ?auto_338354 ?auto_338367 ) ) ( not ( = ?auto_338355 ?auto_338356 ) ) ( not ( = ?auto_338355 ?auto_338357 ) ) ( not ( = ?auto_338355 ?auto_338358 ) ) ( not ( = ?auto_338355 ?auto_338359 ) ) ( not ( = ?auto_338355 ?auto_338360 ) ) ( not ( = ?auto_338355 ?auto_338361 ) ) ( not ( = ?auto_338355 ?auto_338362 ) ) ( not ( = ?auto_338355 ?auto_338363 ) ) ( not ( = ?auto_338355 ?auto_338364 ) ) ( not ( = ?auto_338355 ?auto_338365 ) ) ( not ( = ?auto_338355 ?auto_338366 ) ) ( not ( = ?auto_338355 ?auto_338367 ) ) ( not ( = ?auto_338356 ?auto_338357 ) ) ( not ( = ?auto_338356 ?auto_338358 ) ) ( not ( = ?auto_338356 ?auto_338359 ) ) ( not ( = ?auto_338356 ?auto_338360 ) ) ( not ( = ?auto_338356 ?auto_338361 ) ) ( not ( = ?auto_338356 ?auto_338362 ) ) ( not ( = ?auto_338356 ?auto_338363 ) ) ( not ( = ?auto_338356 ?auto_338364 ) ) ( not ( = ?auto_338356 ?auto_338365 ) ) ( not ( = ?auto_338356 ?auto_338366 ) ) ( not ( = ?auto_338356 ?auto_338367 ) ) ( not ( = ?auto_338357 ?auto_338358 ) ) ( not ( = ?auto_338357 ?auto_338359 ) ) ( not ( = ?auto_338357 ?auto_338360 ) ) ( not ( = ?auto_338357 ?auto_338361 ) ) ( not ( = ?auto_338357 ?auto_338362 ) ) ( not ( = ?auto_338357 ?auto_338363 ) ) ( not ( = ?auto_338357 ?auto_338364 ) ) ( not ( = ?auto_338357 ?auto_338365 ) ) ( not ( = ?auto_338357 ?auto_338366 ) ) ( not ( = ?auto_338357 ?auto_338367 ) ) ( not ( = ?auto_338358 ?auto_338359 ) ) ( not ( = ?auto_338358 ?auto_338360 ) ) ( not ( = ?auto_338358 ?auto_338361 ) ) ( not ( = ?auto_338358 ?auto_338362 ) ) ( not ( = ?auto_338358 ?auto_338363 ) ) ( not ( = ?auto_338358 ?auto_338364 ) ) ( not ( = ?auto_338358 ?auto_338365 ) ) ( not ( = ?auto_338358 ?auto_338366 ) ) ( not ( = ?auto_338358 ?auto_338367 ) ) ( not ( = ?auto_338359 ?auto_338360 ) ) ( not ( = ?auto_338359 ?auto_338361 ) ) ( not ( = ?auto_338359 ?auto_338362 ) ) ( not ( = ?auto_338359 ?auto_338363 ) ) ( not ( = ?auto_338359 ?auto_338364 ) ) ( not ( = ?auto_338359 ?auto_338365 ) ) ( not ( = ?auto_338359 ?auto_338366 ) ) ( not ( = ?auto_338359 ?auto_338367 ) ) ( not ( = ?auto_338360 ?auto_338361 ) ) ( not ( = ?auto_338360 ?auto_338362 ) ) ( not ( = ?auto_338360 ?auto_338363 ) ) ( not ( = ?auto_338360 ?auto_338364 ) ) ( not ( = ?auto_338360 ?auto_338365 ) ) ( not ( = ?auto_338360 ?auto_338366 ) ) ( not ( = ?auto_338360 ?auto_338367 ) ) ( not ( = ?auto_338361 ?auto_338362 ) ) ( not ( = ?auto_338361 ?auto_338363 ) ) ( not ( = ?auto_338361 ?auto_338364 ) ) ( not ( = ?auto_338361 ?auto_338365 ) ) ( not ( = ?auto_338361 ?auto_338366 ) ) ( not ( = ?auto_338361 ?auto_338367 ) ) ( not ( = ?auto_338362 ?auto_338363 ) ) ( not ( = ?auto_338362 ?auto_338364 ) ) ( not ( = ?auto_338362 ?auto_338365 ) ) ( not ( = ?auto_338362 ?auto_338366 ) ) ( not ( = ?auto_338362 ?auto_338367 ) ) ( not ( = ?auto_338363 ?auto_338364 ) ) ( not ( = ?auto_338363 ?auto_338365 ) ) ( not ( = ?auto_338363 ?auto_338366 ) ) ( not ( = ?auto_338363 ?auto_338367 ) ) ( not ( = ?auto_338364 ?auto_338365 ) ) ( not ( = ?auto_338364 ?auto_338366 ) ) ( not ( = ?auto_338364 ?auto_338367 ) ) ( not ( = ?auto_338365 ?auto_338366 ) ) ( not ( = ?auto_338365 ?auto_338367 ) ) ( not ( = ?auto_338366 ?auto_338367 ) ) ( ON ?auto_338365 ?auto_338366 ) ( ON ?auto_338364 ?auto_338365 ) ( ON ?auto_338363 ?auto_338364 ) ( ON ?auto_338362 ?auto_338363 ) ( ON ?auto_338361 ?auto_338362 ) ( ON ?auto_338360 ?auto_338361 ) ( ON ?auto_338359 ?auto_338360 ) ( ON ?auto_338358 ?auto_338359 ) ( ON ?auto_338357 ?auto_338358 ) ( ON ?auto_338356 ?auto_338357 ) ( ON ?auto_338355 ?auto_338356 ) ( ON ?auto_338354 ?auto_338355 ) ( CLEAR ?auto_338354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_338354 )
      ( MAKE-13PILE ?auto_338354 ?auto_338355 ?auto_338356 ?auto_338357 ?auto_338358 ?auto_338359 ?auto_338360 ?auto_338361 ?auto_338362 ?auto_338363 ?auto_338364 ?auto_338365 ?auto_338366 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338382 - BLOCK
      ?auto_338383 - BLOCK
      ?auto_338384 - BLOCK
      ?auto_338385 - BLOCK
      ?auto_338386 - BLOCK
      ?auto_338387 - BLOCK
      ?auto_338388 - BLOCK
      ?auto_338389 - BLOCK
      ?auto_338390 - BLOCK
      ?auto_338391 - BLOCK
      ?auto_338392 - BLOCK
      ?auto_338393 - BLOCK
      ?auto_338394 - BLOCK
      ?auto_338395 - BLOCK
    )
    :vars
    (
      ?auto_338396 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_338394 ) ( ON ?auto_338395 ?auto_338396 ) ( CLEAR ?auto_338395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_338382 ) ( ON ?auto_338383 ?auto_338382 ) ( ON ?auto_338384 ?auto_338383 ) ( ON ?auto_338385 ?auto_338384 ) ( ON ?auto_338386 ?auto_338385 ) ( ON ?auto_338387 ?auto_338386 ) ( ON ?auto_338388 ?auto_338387 ) ( ON ?auto_338389 ?auto_338388 ) ( ON ?auto_338390 ?auto_338389 ) ( ON ?auto_338391 ?auto_338390 ) ( ON ?auto_338392 ?auto_338391 ) ( ON ?auto_338393 ?auto_338392 ) ( ON ?auto_338394 ?auto_338393 ) ( not ( = ?auto_338382 ?auto_338383 ) ) ( not ( = ?auto_338382 ?auto_338384 ) ) ( not ( = ?auto_338382 ?auto_338385 ) ) ( not ( = ?auto_338382 ?auto_338386 ) ) ( not ( = ?auto_338382 ?auto_338387 ) ) ( not ( = ?auto_338382 ?auto_338388 ) ) ( not ( = ?auto_338382 ?auto_338389 ) ) ( not ( = ?auto_338382 ?auto_338390 ) ) ( not ( = ?auto_338382 ?auto_338391 ) ) ( not ( = ?auto_338382 ?auto_338392 ) ) ( not ( = ?auto_338382 ?auto_338393 ) ) ( not ( = ?auto_338382 ?auto_338394 ) ) ( not ( = ?auto_338382 ?auto_338395 ) ) ( not ( = ?auto_338382 ?auto_338396 ) ) ( not ( = ?auto_338383 ?auto_338384 ) ) ( not ( = ?auto_338383 ?auto_338385 ) ) ( not ( = ?auto_338383 ?auto_338386 ) ) ( not ( = ?auto_338383 ?auto_338387 ) ) ( not ( = ?auto_338383 ?auto_338388 ) ) ( not ( = ?auto_338383 ?auto_338389 ) ) ( not ( = ?auto_338383 ?auto_338390 ) ) ( not ( = ?auto_338383 ?auto_338391 ) ) ( not ( = ?auto_338383 ?auto_338392 ) ) ( not ( = ?auto_338383 ?auto_338393 ) ) ( not ( = ?auto_338383 ?auto_338394 ) ) ( not ( = ?auto_338383 ?auto_338395 ) ) ( not ( = ?auto_338383 ?auto_338396 ) ) ( not ( = ?auto_338384 ?auto_338385 ) ) ( not ( = ?auto_338384 ?auto_338386 ) ) ( not ( = ?auto_338384 ?auto_338387 ) ) ( not ( = ?auto_338384 ?auto_338388 ) ) ( not ( = ?auto_338384 ?auto_338389 ) ) ( not ( = ?auto_338384 ?auto_338390 ) ) ( not ( = ?auto_338384 ?auto_338391 ) ) ( not ( = ?auto_338384 ?auto_338392 ) ) ( not ( = ?auto_338384 ?auto_338393 ) ) ( not ( = ?auto_338384 ?auto_338394 ) ) ( not ( = ?auto_338384 ?auto_338395 ) ) ( not ( = ?auto_338384 ?auto_338396 ) ) ( not ( = ?auto_338385 ?auto_338386 ) ) ( not ( = ?auto_338385 ?auto_338387 ) ) ( not ( = ?auto_338385 ?auto_338388 ) ) ( not ( = ?auto_338385 ?auto_338389 ) ) ( not ( = ?auto_338385 ?auto_338390 ) ) ( not ( = ?auto_338385 ?auto_338391 ) ) ( not ( = ?auto_338385 ?auto_338392 ) ) ( not ( = ?auto_338385 ?auto_338393 ) ) ( not ( = ?auto_338385 ?auto_338394 ) ) ( not ( = ?auto_338385 ?auto_338395 ) ) ( not ( = ?auto_338385 ?auto_338396 ) ) ( not ( = ?auto_338386 ?auto_338387 ) ) ( not ( = ?auto_338386 ?auto_338388 ) ) ( not ( = ?auto_338386 ?auto_338389 ) ) ( not ( = ?auto_338386 ?auto_338390 ) ) ( not ( = ?auto_338386 ?auto_338391 ) ) ( not ( = ?auto_338386 ?auto_338392 ) ) ( not ( = ?auto_338386 ?auto_338393 ) ) ( not ( = ?auto_338386 ?auto_338394 ) ) ( not ( = ?auto_338386 ?auto_338395 ) ) ( not ( = ?auto_338386 ?auto_338396 ) ) ( not ( = ?auto_338387 ?auto_338388 ) ) ( not ( = ?auto_338387 ?auto_338389 ) ) ( not ( = ?auto_338387 ?auto_338390 ) ) ( not ( = ?auto_338387 ?auto_338391 ) ) ( not ( = ?auto_338387 ?auto_338392 ) ) ( not ( = ?auto_338387 ?auto_338393 ) ) ( not ( = ?auto_338387 ?auto_338394 ) ) ( not ( = ?auto_338387 ?auto_338395 ) ) ( not ( = ?auto_338387 ?auto_338396 ) ) ( not ( = ?auto_338388 ?auto_338389 ) ) ( not ( = ?auto_338388 ?auto_338390 ) ) ( not ( = ?auto_338388 ?auto_338391 ) ) ( not ( = ?auto_338388 ?auto_338392 ) ) ( not ( = ?auto_338388 ?auto_338393 ) ) ( not ( = ?auto_338388 ?auto_338394 ) ) ( not ( = ?auto_338388 ?auto_338395 ) ) ( not ( = ?auto_338388 ?auto_338396 ) ) ( not ( = ?auto_338389 ?auto_338390 ) ) ( not ( = ?auto_338389 ?auto_338391 ) ) ( not ( = ?auto_338389 ?auto_338392 ) ) ( not ( = ?auto_338389 ?auto_338393 ) ) ( not ( = ?auto_338389 ?auto_338394 ) ) ( not ( = ?auto_338389 ?auto_338395 ) ) ( not ( = ?auto_338389 ?auto_338396 ) ) ( not ( = ?auto_338390 ?auto_338391 ) ) ( not ( = ?auto_338390 ?auto_338392 ) ) ( not ( = ?auto_338390 ?auto_338393 ) ) ( not ( = ?auto_338390 ?auto_338394 ) ) ( not ( = ?auto_338390 ?auto_338395 ) ) ( not ( = ?auto_338390 ?auto_338396 ) ) ( not ( = ?auto_338391 ?auto_338392 ) ) ( not ( = ?auto_338391 ?auto_338393 ) ) ( not ( = ?auto_338391 ?auto_338394 ) ) ( not ( = ?auto_338391 ?auto_338395 ) ) ( not ( = ?auto_338391 ?auto_338396 ) ) ( not ( = ?auto_338392 ?auto_338393 ) ) ( not ( = ?auto_338392 ?auto_338394 ) ) ( not ( = ?auto_338392 ?auto_338395 ) ) ( not ( = ?auto_338392 ?auto_338396 ) ) ( not ( = ?auto_338393 ?auto_338394 ) ) ( not ( = ?auto_338393 ?auto_338395 ) ) ( not ( = ?auto_338393 ?auto_338396 ) ) ( not ( = ?auto_338394 ?auto_338395 ) ) ( not ( = ?auto_338394 ?auto_338396 ) ) ( not ( = ?auto_338395 ?auto_338396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_338395 ?auto_338396 )
      ( !STACK ?auto_338395 ?auto_338394 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338411 - BLOCK
      ?auto_338412 - BLOCK
      ?auto_338413 - BLOCK
      ?auto_338414 - BLOCK
      ?auto_338415 - BLOCK
      ?auto_338416 - BLOCK
      ?auto_338417 - BLOCK
      ?auto_338418 - BLOCK
      ?auto_338419 - BLOCK
      ?auto_338420 - BLOCK
      ?auto_338421 - BLOCK
      ?auto_338422 - BLOCK
      ?auto_338423 - BLOCK
      ?auto_338424 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_338423 ) ( ON-TABLE ?auto_338424 ) ( CLEAR ?auto_338424 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_338411 ) ( ON ?auto_338412 ?auto_338411 ) ( ON ?auto_338413 ?auto_338412 ) ( ON ?auto_338414 ?auto_338413 ) ( ON ?auto_338415 ?auto_338414 ) ( ON ?auto_338416 ?auto_338415 ) ( ON ?auto_338417 ?auto_338416 ) ( ON ?auto_338418 ?auto_338417 ) ( ON ?auto_338419 ?auto_338418 ) ( ON ?auto_338420 ?auto_338419 ) ( ON ?auto_338421 ?auto_338420 ) ( ON ?auto_338422 ?auto_338421 ) ( ON ?auto_338423 ?auto_338422 ) ( not ( = ?auto_338411 ?auto_338412 ) ) ( not ( = ?auto_338411 ?auto_338413 ) ) ( not ( = ?auto_338411 ?auto_338414 ) ) ( not ( = ?auto_338411 ?auto_338415 ) ) ( not ( = ?auto_338411 ?auto_338416 ) ) ( not ( = ?auto_338411 ?auto_338417 ) ) ( not ( = ?auto_338411 ?auto_338418 ) ) ( not ( = ?auto_338411 ?auto_338419 ) ) ( not ( = ?auto_338411 ?auto_338420 ) ) ( not ( = ?auto_338411 ?auto_338421 ) ) ( not ( = ?auto_338411 ?auto_338422 ) ) ( not ( = ?auto_338411 ?auto_338423 ) ) ( not ( = ?auto_338411 ?auto_338424 ) ) ( not ( = ?auto_338412 ?auto_338413 ) ) ( not ( = ?auto_338412 ?auto_338414 ) ) ( not ( = ?auto_338412 ?auto_338415 ) ) ( not ( = ?auto_338412 ?auto_338416 ) ) ( not ( = ?auto_338412 ?auto_338417 ) ) ( not ( = ?auto_338412 ?auto_338418 ) ) ( not ( = ?auto_338412 ?auto_338419 ) ) ( not ( = ?auto_338412 ?auto_338420 ) ) ( not ( = ?auto_338412 ?auto_338421 ) ) ( not ( = ?auto_338412 ?auto_338422 ) ) ( not ( = ?auto_338412 ?auto_338423 ) ) ( not ( = ?auto_338412 ?auto_338424 ) ) ( not ( = ?auto_338413 ?auto_338414 ) ) ( not ( = ?auto_338413 ?auto_338415 ) ) ( not ( = ?auto_338413 ?auto_338416 ) ) ( not ( = ?auto_338413 ?auto_338417 ) ) ( not ( = ?auto_338413 ?auto_338418 ) ) ( not ( = ?auto_338413 ?auto_338419 ) ) ( not ( = ?auto_338413 ?auto_338420 ) ) ( not ( = ?auto_338413 ?auto_338421 ) ) ( not ( = ?auto_338413 ?auto_338422 ) ) ( not ( = ?auto_338413 ?auto_338423 ) ) ( not ( = ?auto_338413 ?auto_338424 ) ) ( not ( = ?auto_338414 ?auto_338415 ) ) ( not ( = ?auto_338414 ?auto_338416 ) ) ( not ( = ?auto_338414 ?auto_338417 ) ) ( not ( = ?auto_338414 ?auto_338418 ) ) ( not ( = ?auto_338414 ?auto_338419 ) ) ( not ( = ?auto_338414 ?auto_338420 ) ) ( not ( = ?auto_338414 ?auto_338421 ) ) ( not ( = ?auto_338414 ?auto_338422 ) ) ( not ( = ?auto_338414 ?auto_338423 ) ) ( not ( = ?auto_338414 ?auto_338424 ) ) ( not ( = ?auto_338415 ?auto_338416 ) ) ( not ( = ?auto_338415 ?auto_338417 ) ) ( not ( = ?auto_338415 ?auto_338418 ) ) ( not ( = ?auto_338415 ?auto_338419 ) ) ( not ( = ?auto_338415 ?auto_338420 ) ) ( not ( = ?auto_338415 ?auto_338421 ) ) ( not ( = ?auto_338415 ?auto_338422 ) ) ( not ( = ?auto_338415 ?auto_338423 ) ) ( not ( = ?auto_338415 ?auto_338424 ) ) ( not ( = ?auto_338416 ?auto_338417 ) ) ( not ( = ?auto_338416 ?auto_338418 ) ) ( not ( = ?auto_338416 ?auto_338419 ) ) ( not ( = ?auto_338416 ?auto_338420 ) ) ( not ( = ?auto_338416 ?auto_338421 ) ) ( not ( = ?auto_338416 ?auto_338422 ) ) ( not ( = ?auto_338416 ?auto_338423 ) ) ( not ( = ?auto_338416 ?auto_338424 ) ) ( not ( = ?auto_338417 ?auto_338418 ) ) ( not ( = ?auto_338417 ?auto_338419 ) ) ( not ( = ?auto_338417 ?auto_338420 ) ) ( not ( = ?auto_338417 ?auto_338421 ) ) ( not ( = ?auto_338417 ?auto_338422 ) ) ( not ( = ?auto_338417 ?auto_338423 ) ) ( not ( = ?auto_338417 ?auto_338424 ) ) ( not ( = ?auto_338418 ?auto_338419 ) ) ( not ( = ?auto_338418 ?auto_338420 ) ) ( not ( = ?auto_338418 ?auto_338421 ) ) ( not ( = ?auto_338418 ?auto_338422 ) ) ( not ( = ?auto_338418 ?auto_338423 ) ) ( not ( = ?auto_338418 ?auto_338424 ) ) ( not ( = ?auto_338419 ?auto_338420 ) ) ( not ( = ?auto_338419 ?auto_338421 ) ) ( not ( = ?auto_338419 ?auto_338422 ) ) ( not ( = ?auto_338419 ?auto_338423 ) ) ( not ( = ?auto_338419 ?auto_338424 ) ) ( not ( = ?auto_338420 ?auto_338421 ) ) ( not ( = ?auto_338420 ?auto_338422 ) ) ( not ( = ?auto_338420 ?auto_338423 ) ) ( not ( = ?auto_338420 ?auto_338424 ) ) ( not ( = ?auto_338421 ?auto_338422 ) ) ( not ( = ?auto_338421 ?auto_338423 ) ) ( not ( = ?auto_338421 ?auto_338424 ) ) ( not ( = ?auto_338422 ?auto_338423 ) ) ( not ( = ?auto_338422 ?auto_338424 ) ) ( not ( = ?auto_338423 ?auto_338424 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_338424 )
      ( !STACK ?auto_338424 ?auto_338423 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338439 - BLOCK
      ?auto_338440 - BLOCK
      ?auto_338441 - BLOCK
      ?auto_338442 - BLOCK
      ?auto_338443 - BLOCK
      ?auto_338444 - BLOCK
      ?auto_338445 - BLOCK
      ?auto_338446 - BLOCK
      ?auto_338447 - BLOCK
      ?auto_338448 - BLOCK
      ?auto_338449 - BLOCK
      ?auto_338450 - BLOCK
      ?auto_338451 - BLOCK
      ?auto_338452 - BLOCK
    )
    :vars
    (
      ?auto_338453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338452 ?auto_338453 ) ( ON-TABLE ?auto_338439 ) ( ON ?auto_338440 ?auto_338439 ) ( ON ?auto_338441 ?auto_338440 ) ( ON ?auto_338442 ?auto_338441 ) ( ON ?auto_338443 ?auto_338442 ) ( ON ?auto_338444 ?auto_338443 ) ( ON ?auto_338445 ?auto_338444 ) ( ON ?auto_338446 ?auto_338445 ) ( ON ?auto_338447 ?auto_338446 ) ( ON ?auto_338448 ?auto_338447 ) ( ON ?auto_338449 ?auto_338448 ) ( ON ?auto_338450 ?auto_338449 ) ( not ( = ?auto_338439 ?auto_338440 ) ) ( not ( = ?auto_338439 ?auto_338441 ) ) ( not ( = ?auto_338439 ?auto_338442 ) ) ( not ( = ?auto_338439 ?auto_338443 ) ) ( not ( = ?auto_338439 ?auto_338444 ) ) ( not ( = ?auto_338439 ?auto_338445 ) ) ( not ( = ?auto_338439 ?auto_338446 ) ) ( not ( = ?auto_338439 ?auto_338447 ) ) ( not ( = ?auto_338439 ?auto_338448 ) ) ( not ( = ?auto_338439 ?auto_338449 ) ) ( not ( = ?auto_338439 ?auto_338450 ) ) ( not ( = ?auto_338439 ?auto_338451 ) ) ( not ( = ?auto_338439 ?auto_338452 ) ) ( not ( = ?auto_338439 ?auto_338453 ) ) ( not ( = ?auto_338440 ?auto_338441 ) ) ( not ( = ?auto_338440 ?auto_338442 ) ) ( not ( = ?auto_338440 ?auto_338443 ) ) ( not ( = ?auto_338440 ?auto_338444 ) ) ( not ( = ?auto_338440 ?auto_338445 ) ) ( not ( = ?auto_338440 ?auto_338446 ) ) ( not ( = ?auto_338440 ?auto_338447 ) ) ( not ( = ?auto_338440 ?auto_338448 ) ) ( not ( = ?auto_338440 ?auto_338449 ) ) ( not ( = ?auto_338440 ?auto_338450 ) ) ( not ( = ?auto_338440 ?auto_338451 ) ) ( not ( = ?auto_338440 ?auto_338452 ) ) ( not ( = ?auto_338440 ?auto_338453 ) ) ( not ( = ?auto_338441 ?auto_338442 ) ) ( not ( = ?auto_338441 ?auto_338443 ) ) ( not ( = ?auto_338441 ?auto_338444 ) ) ( not ( = ?auto_338441 ?auto_338445 ) ) ( not ( = ?auto_338441 ?auto_338446 ) ) ( not ( = ?auto_338441 ?auto_338447 ) ) ( not ( = ?auto_338441 ?auto_338448 ) ) ( not ( = ?auto_338441 ?auto_338449 ) ) ( not ( = ?auto_338441 ?auto_338450 ) ) ( not ( = ?auto_338441 ?auto_338451 ) ) ( not ( = ?auto_338441 ?auto_338452 ) ) ( not ( = ?auto_338441 ?auto_338453 ) ) ( not ( = ?auto_338442 ?auto_338443 ) ) ( not ( = ?auto_338442 ?auto_338444 ) ) ( not ( = ?auto_338442 ?auto_338445 ) ) ( not ( = ?auto_338442 ?auto_338446 ) ) ( not ( = ?auto_338442 ?auto_338447 ) ) ( not ( = ?auto_338442 ?auto_338448 ) ) ( not ( = ?auto_338442 ?auto_338449 ) ) ( not ( = ?auto_338442 ?auto_338450 ) ) ( not ( = ?auto_338442 ?auto_338451 ) ) ( not ( = ?auto_338442 ?auto_338452 ) ) ( not ( = ?auto_338442 ?auto_338453 ) ) ( not ( = ?auto_338443 ?auto_338444 ) ) ( not ( = ?auto_338443 ?auto_338445 ) ) ( not ( = ?auto_338443 ?auto_338446 ) ) ( not ( = ?auto_338443 ?auto_338447 ) ) ( not ( = ?auto_338443 ?auto_338448 ) ) ( not ( = ?auto_338443 ?auto_338449 ) ) ( not ( = ?auto_338443 ?auto_338450 ) ) ( not ( = ?auto_338443 ?auto_338451 ) ) ( not ( = ?auto_338443 ?auto_338452 ) ) ( not ( = ?auto_338443 ?auto_338453 ) ) ( not ( = ?auto_338444 ?auto_338445 ) ) ( not ( = ?auto_338444 ?auto_338446 ) ) ( not ( = ?auto_338444 ?auto_338447 ) ) ( not ( = ?auto_338444 ?auto_338448 ) ) ( not ( = ?auto_338444 ?auto_338449 ) ) ( not ( = ?auto_338444 ?auto_338450 ) ) ( not ( = ?auto_338444 ?auto_338451 ) ) ( not ( = ?auto_338444 ?auto_338452 ) ) ( not ( = ?auto_338444 ?auto_338453 ) ) ( not ( = ?auto_338445 ?auto_338446 ) ) ( not ( = ?auto_338445 ?auto_338447 ) ) ( not ( = ?auto_338445 ?auto_338448 ) ) ( not ( = ?auto_338445 ?auto_338449 ) ) ( not ( = ?auto_338445 ?auto_338450 ) ) ( not ( = ?auto_338445 ?auto_338451 ) ) ( not ( = ?auto_338445 ?auto_338452 ) ) ( not ( = ?auto_338445 ?auto_338453 ) ) ( not ( = ?auto_338446 ?auto_338447 ) ) ( not ( = ?auto_338446 ?auto_338448 ) ) ( not ( = ?auto_338446 ?auto_338449 ) ) ( not ( = ?auto_338446 ?auto_338450 ) ) ( not ( = ?auto_338446 ?auto_338451 ) ) ( not ( = ?auto_338446 ?auto_338452 ) ) ( not ( = ?auto_338446 ?auto_338453 ) ) ( not ( = ?auto_338447 ?auto_338448 ) ) ( not ( = ?auto_338447 ?auto_338449 ) ) ( not ( = ?auto_338447 ?auto_338450 ) ) ( not ( = ?auto_338447 ?auto_338451 ) ) ( not ( = ?auto_338447 ?auto_338452 ) ) ( not ( = ?auto_338447 ?auto_338453 ) ) ( not ( = ?auto_338448 ?auto_338449 ) ) ( not ( = ?auto_338448 ?auto_338450 ) ) ( not ( = ?auto_338448 ?auto_338451 ) ) ( not ( = ?auto_338448 ?auto_338452 ) ) ( not ( = ?auto_338448 ?auto_338453 ) ) ( not ( = ?auto_338449 ?auto_338450 ) ) ( not ( = ?auto_338449 ?auto_338451 ) ) ( not ( = ?auto_338449 ?auto_338452 ) ) ( not ( = ?auto_338449 ?auto_338453 ) ) ( not ( = ?auto_338450 ?auto_338451 ) ) ( not ( = ?auto_338450 ?auto_338452 ) ) ( not ( = ?auto_338450 ?auto_338453 ) ) ( not ( = ?auto_338451 ?auto_338452 ) ) ( not ( = ?auto_338451 ?auto_338453 ) ) ( not ( = ?auto_338452 ?auto_338453 ) ) ( CLEAR ?auto_338450 ) ( ON ?auto_338451 ?auto_338452 ) ( CLEAR ?auto_338451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_338439 ?auto_338440 ?auto_338441 ?auto_338442 ?auto_338443 ?auto_338444 ?auto_338445 ?auto_338446 ?auto_338447 ?auto_338448 ?auto_338449 ?auto_338450 ?auto_338451 )
      ( MAKE-14PILE ?auto_338439 ?auto_338440 ?auto_338441 ?auto_338442 ?auto_338443 ?auto_338444 ?auto_338445 ?auto_338446 ?auto_338447 ?auto_338448 ?auto_338449 ?auto_338450 ?auto_338451 ?auto_338452 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338468 - BLOCK
      ?auto_338469 - BLOCK
      ?auto_338470 - BLOCK
      ?auto_338471 - BLOCK
      ?auto_338472 - BLOCK
      ?auto_338473 - BLOCK
      ?auto_338474 - BLOCK
      ?auto_338475 - BLOCK
      ?auto_338476 - BLOCK
      ?auto_338477 - BLOCK
      ?auto_338478 - BLOCK
      ?auto_338479 - BLOCK
      ?auto_338480 - BLOCK
      ?auto_338481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338481 ) ( ON-TABLE ?auto_338468 ) ( ON ?auto_338469 ?auto_338468 ) ( ON ?auto_338470 ?auto_338469 ) ( ON ?auto_338471 ?auto_338470 ) ( ON ?auto_338472 ?auto_338471 ) ( ON ?auto_338473 ?auto_338472 ) ( ON ?auto_338474 ?auto_338473 ) ( ON ?auto_338475 ?auto_338474 ) ( ON ?auto_338476 ?auto_338475 ) ( ON ?auto_338477 ?auto_338476 ) ( ON ?auto_338478 ?auto_338477 ) ( ON ?auto_338479 ?auto_338478 ) ( not ( = ?auto_338468 ?auto_338469 ) ) ( not ( = ?auto_338468 ?auto_338470 ) ) ( not ( = ?auto_338468 ?auto_338471 ) ) ( not ( = ?auto_338468 ?auto_338472 ) ) ( not ( = ?auto_338468 ?auto_338473 ) ) ( not ( = ?auto_338468 ?auto_338474 ) ) ( not ( = ?auto_338468 ?auto_338475 ) ) ( not ( = ?auto_338468 ?auto_338476 ) ) ( not ( = ?auto_338468 ?auto_338477 ) ) ( not ( = ?auto_338468 ?auto_338478 ) ) ( not ( = ?auto_338468 ?auto_338479 ) ) ( not ( = ?auto_338468 ?auto_338480 ) ) ( not ( = ?auto_338468 ?auto_338481 ) ) ( not ( = ?auto_338469 ?auto_338470 ) ) ( not ( = ?auto_338469 ?auto_338471 ) ) ( not ( = ?auto_338469 ?auto_338472 ) ) ( not ( = ?auto_338469 ?auto_338473 ) ) ( not ( = ?auto_338469 ?auto_338474 ) ) ( not ( = ?auto_338469 ?auto_338475 ) ) ( not ( = ?auto_338469 ?auto_338476 ) ) ( not ( = ?auto_338469 ?auto_338477 ) ) ( not ( = ?auto_338469 ?auto_338478 ) ) ( not ( = ?auto_338469 ?auto_338479 ) ) ( not ( = ?auto_338469 ?auto_338480 ) ) ( not ( = ?auto_338469 ?auto_338481 ) ) ( not ( = ?auto_338470 ?auto_338471 ) ) ( not ( = ?auto_338470 ?auto_338472 ) ) ( not ( = ?auto_338470 ?auto_338473 ) ) ( not ( = ?auto_338470 ?auto_338474 ) ) ( not ( = ?auto_338470 ?auto_338475 ) ) ( not ( = ?auto_338470 ?auto_338476 ) ) ( not ( = ?auto_338470 ?auto_338477 ) ) ( not ( = ?auto_338470 ?auto_338478 ) ) ( not ( = ?auto_338470 ?auto_338479 ) ) ( not ( = ?auto_338470 ?auto_338480 ) ) ( not ( = ?auto_338470 ?auto_338481 ) ) ( not ( = ?auto_338471 ?auto_338472 ) ) ( not ( = ?auto_338471 ?auto_338473 ) ) ( not ( = ?auto_338471 ?auto_338474 ) ) ( not ( = ?auto_338471 ?auto_338475 ) ) ( not ( = ?auto_338471 ?auto_338476 ) ) ( not ( = ?auto_338471 ?auto_338477 ) ) ( not ( = ?auto_338471 ?auto_338478 ) ) ( not ( = ?auto_338471 ?auto_338479 ) ) ( not ( = ?auto_338471 ?auto_338480 ) ) ( not ( = ?auto_338471 ?auto_338481 ) ) ( not ( = ?auto_338472 ?auto_338473 ) ) ( not ( = ?auto_338472 ?auto_338474 ) ) ( not ( = ?auto_338472 ?auto_338475 ) ) ( not ( = ?auto_338472 ?auto_338476 ) ) ( not ( = ?auto_338472 ?auto_338477 ) ) ( not ( = ?auto_338472 ?auto_338478 ) ) ( not ( = ?auto_338472 ?auto_338479 ) ) ( not ( = ?auto_338472 ?auto_338480 ) ) ( not ( = ?auto_338472 ?auto_338481 ) ) ( not ( = ?auto_338473 ?auto_338474 ) ) ( not ( = ?auto_338473 ?auto_338475 ) ) ( not ( = ?auto_338473 ?auto_338476 ) ) ( not ( = ?auto_338473 ?auto_338477 ) ) ( not ( = ?auto_338473 ?auto_338478 ) ) ( not ( = ?auto_338473 ?auto_338479 ) ) ( not ( = ?auto_338473 ?auto_338480 ) ) ( not ( = ?auto_338473 ?auto_338481 ) ) ( not ( = ?auto_338474 ?auto_338475 ) ) ( not ( = ?auto_338474 ?auto_338476 ) ) ( not ( = ?auto_338474 ?auto_338477 ) ) ( not ( = ?auto_338474 ?auto_338478 ) ) ( not ( = ?auto_338474 ?auto_338479 ) ) ( not ( = ?auto_338474 ?auto_338480 ) ) ( not ( = ?auto_338474 ?auto_338481 ) ) ( not ( = ?auto_338475 ?auto_338476 ) ) ( not ( = ?auto_338475 ?auto_338477 ) ) ( not ( = ?auto_338475 ?auto_338478 ) ) ( not ( = ?auto_338475 ?auto_338479 ) ) ( not ( = ?auto_338475 ?auto_338480 ) ) ( not ( = ?auto_338475 ?auto_338481 ) ) ( not ( = ?auto_338476 ?auto_338477 ) ) ( not ( = ?auto_338476 ?auto_338478 ) ) ( not ( = ?auto_338476 ?auto_338479 ) ) ( not ( = ?auto_338476 ?auto_338480 ) ) ( not ( = ?auto_338476 ?auto_338481 ) ) ( not ( = ?auto_338477 ?auto_338478 ) ) ( not ( = ?auto_338477 ?auto_338479 ) ) ( not ( = ?auto_338477 ?auto_338480 ) ) ( not ( = ?auto_338477 ?auto_338481 ) ) ( not ( = ?auto_338478 ?auto_338479 ) ) ( not ( = ?auto_338478 ?auto_338480 ) ) ( not ( = ?auto_338478 ?auto_338481 ) ) ( not ( = ?auto_338479 ?auto_338480 ) ) ( not ( = ?auto_338479 ?auto_338481 ) ) ( not ( = ?auto_338480 ?auto_338481 ) ) ( CLEAR ?auto_338479 ) ( ON ?auto_338480 ?auto_338481 ) ( CLEAR ?auto_338480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_338468 ?auto_338469 ?auto_338470 ?auto_338471 ?auto_338472 ?auto_338473 ?auto_338474 ?auto_338475 ?auto_338476 ?auto_338477 ?auto_338478 ?auto_338479 ?auto_338480 )
      ( MAKE-14PILE ?auto_338468 ?auto_338469 ?auto_338470 ?auto_338471 ?auto_338472 ?auto_338473 ?auto_338474 ?auto_338475 ?auto_338476 ?auto_338477 ?auto_338478 ?auto_338479 ?auto_338480 ?auto_338481 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338496 - BLOCK
      ?auto_338497 - BLOCK
      ?auto_338498 - BLOCK
      ?auto_338499 - BLOCK
      ?auto_338500 - BLOCK
      ?auto_338501 - BLOCK
      ?auto_338502 - BLOCK
      ?auto_338503 - BLOCK
      ?auto_338504 - BLOCK
      ?auto_338505 - BLOCK
      ?auto_338506 - BLOCK
      ?auto_338507 - BLOCK
      ?auto_338508 - BLOCK
      ?auto_338509 - BLOCK
    )
    :vars
    (
      ?auto_338510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338509 ?auto_338510 ) ( ON-TABLE ?auto_338496 ) ( ON ?auto_338497 ?auto_338496 ) ( ON ?auto_338498 ?auto_338497 ) ( ON ?auto_338499 ?auto_338498 ) ( ON ?auto_338500 ?auto_338499 ) ( ON ?auto_338501 ?auto_338500 ) ( ON ?auto_338502 ?auto_338501 ) ( ON ?auto_338503 ?auto_338502 ) ( ON ?auto_338504 ?auto_338503 ) ( ON ?auto_338505 ?auto_338504 ) ( ON ?auto_338506 ?auto_338505 ) ( not ( = ?auto_338496 ?auto_338497 ) ) ( not ( = ?auto_338496 ?auto_338498 ) ) ( not ( = ?auto_338496 ?auto_338499 ) ) ( not ( = ?auto_338496 ?auto_338500 ) ) ( not ( = ?auto_338496 ?auto_338501 ) ) ( not ( = ?auto_338496 ?auto_338502 ) ) ( not ( = ?auto_338496 ?auto_338503 ) ) ( not ( = ?auto_338496 ?auto_338504 ) ) ( not ( = ?auto_338496 ?auto_338505 ) ) ( not ( = ?auto_338496 ?auto_338506 ) ) ( not ( = ?auto_338496 ?auto_338507 ) ) ( not ( = ?auto_338496 ?auto_338508 ) ) ( not ( = ?auto_338496 ?auto_338509 ) ) ( not ( = ?auto_338496 ?auto_338510 ) ) ( not ( = ?auto_338497 ?auto_338498 ) ) ( not ( = ?auto_338497 ?auto_338499 ) ) ( not ( = ?auto_338497 ?auto_338500 ) ) ( not ( = ?auto_338497 ?auto_338501 ) ) ( not ( = ?auto_338497 ?auto_338502 ) ) ( not ( = ?auto_338497 ?auto_338503 ) ) ( not ( = ?auto_338497 ?auto_338504 ) ) ( not ( = ?auto_338497 ?auto_338505 ) ) ( not ( = ?auto_338497 ?auto_338506 ) ) ( not ( = ?auto_338497 ?auto_338507 ) ) ( not ( = ?auto_338497 ?auto_338508 ) ) ( not ( = ?auto_338497 ?auto_338509 ) ) ( not ( = ?auto_338497 ?auto_338510 ) ) ( not ( = ?auto_338498 ?auto_338499 ) ) ( not ( = ?auto_338498 ?auto_338500 ) ) ( not ( = ?auto_338498 ?auto_338501 ) ) ( not ( = ?auto_338498 ?auto_338502 ) ) ( not ( = ?auto_338498 ?auto_338503 ) ) ( not ( = ?auto_338498 ?auto_338504 ) ) ( not ( = ?auto_338498 ?auto_338505 ) ) ( not ( = ?auto_338498 ?auto_338506 ) ) ( not ( = ?auto_338498 ?auto_338507 ) ) ( not ( = ?auto_338498 ?auto_338508 ) ) ( not ( = ?auto_338498 ?auto_338509 ) ) ( not ( = ?auto_338498 ?auto_338510 ) ) ( not ( = ?auto_338499 ?auto_338500 ) ) ( not ( = ?auto_338499 ?auto_338501 ) ) ( not ( = ?auto_338499 ?auto_338502 ) ) ( not ( = ?auto_338499 ?auto_338503 ) ) ( not ( = ?auto_338499 ?auto_338504 ) ) ( not ( = ?auto_338499 ?auto_338505 ) ) ( not ( = ?auto_338499 ?auto_338506 ) ) ( not ( = ?auto_338499 ?auto_338507 ) ) ( not ( = ?auto_338499 ?auto_338508 ) ) ( not ( = ?auto_338499 ?auto_338509 ) ) ( not ( = ?auto_338499 ?auto_338510 ) ) ( not ( = ?auto_338500 ?auto_338501 ) ) ( not ( = ?auto_338500 ?auto_338502 ) ) ( not ( = ?auto_338500 ?auto_338503 ) ) ( not ( = ?auto_338500 ?auto_338504 ) ) ( not ( = ?auto_338500 ?auto_338505 ) ) ( not ( = ?auto_338500 ?auto_338506 ) ) ( not ( = ?auto_338500 ?auto_338507 ) ) ( not ( = ?auto_338500 ?auto_338508 ) ) ( not ( = ?auto_338500 ?auto_338509 ) ) ( not ( = ?auto_338500 ?auto_338510 ) ) ( not ( = ?auto_338501 ?auto_338502 ) ) ( not ( = ?auto_338501 ?auto_338503 ) ) ( not ( = ?auto_338501 ?auto_338504 ) ) ( not ( = ?auto_338501 ?auto_338505 ) ) ( not ( = ?auto_338501 ?auto_338506 ) ) ( not ( = ?auto_338501 ?auto_338507 ) ) ( not ( = ?auto_338501 ?auto_338508 ) ) ( not ( = ?auto_338501 ?auto_338509 ) ) ( not ( = ?auto_338501 ?auto_338510 ) ) ( not ( = ?auto_338502 ?auto_338503 ) ) ( not ( = ?auto_338502 ?auto_338504 ) ) ( not ( = ?auto_338502 ?auto_338505 ) ) ( not ( = ?auto_338502 ?auto_338506 ) ) ( not ( = ?auto_338502 ?auto_338507 ) ) ( not ( = ?auto_338502 ?auto_338508 ) ) ( not ( = ?auto_338502 ?auto_338509 ) ) ( not ( = ?auto_338502 ?auto_338510 ) ) ( not ( = ?auto_338503 ?auto_338504 ) ) ( not ( = ?auto_338503 ?auto_338505 ) ) ( not ( = ?auto_338503 ?auto_338506 ) ) ( not ( = ?auto_338503 ?auto_338507 ) ) ( not ( = ?auto_338503 ?auto_338508 ) ) ( not ( = ?auto_338503 ?auto_338509 ) ) ( not ( = ?auto_338503 ?auto_338510 ) ) ( not ( = ?auto_338504 ?auto_338505 ) ) ( not ( = ?auto_338504 ?auto_338506 ) ) ( not ( = ?auto_338504 ?auto_338507 ) ) ( not ( = ?auto_338504 ?auto_338508 ) ) ( not ( = ?auto_338504 ?auto_338509 ) ) ( not ( = ?auto_338504 ?auto_338510 ) ) ( not ( = ?auto_338505 ?auto_338506 ) ) ( not ( = ?auto_338505 ?auto_338507 ) ) ( not ( = ?auto_338505 ?auto_338508 ) ) ( not ( = ?auto_338505 ?auto_338509 ) ) ( not ( = ?auto_338505 ?auto_338510 ) ) ( not ( = ?auto_338506 ?auto_338507 ) ) ( not ( = ?auto_338506 ?auto_338508 ) ) ( not ( = ?auto_338506 ?auto_338509 ) ) ( not ( = ?auto_338506 ?auto_338510 ) ) ( not ( = ?auto_338507 ?auto_338508 ) ) ( not ( = ?auto_338507 ?auto_338509 ) ) ( not ( = ?auto_338507 ?auto_338510 ) ) ( not ( = ?auto_338508 ?auto_338509 ) ) ( not ( = ?auto_338508 ?auto_338510 ) ) ( not ( = ?auto_338509 ?auto_338510 ) ) ( ON ?auto_338508 ?auto_338509 ) ( CLEAR ?auto_338506 ) ( ON ?auto_338507 ?auto_338508 ) ( CLEAR ?auto_338507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_338496 ?auto_338497 ?auto_338498 ?auto_338499 ?auto_338500 ?auto_338501 ?auto_338502 ?auto_338503 ?auto_338504 ?auto_338505 ?auto_338506 ?auto_338507 )
      ( MAKE-14PILE ?auto_338496 ?auto_338497 ?auto_338498 ?auto_338499 ?auto_338500 ?auto_338501 ?auto_338502 ?auto_338503 ?auto_338504 ?auto_338505 ?auto_338506 ?auto_338507 ?auto_338508 ?auto_338509 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338525 - BLOCK
      ?auto_338526 - BLOCK
      ?auto_338527 - BLOCK
      ?auto_338528 - BLOCK
      ?auto_338529 - BLOCK
      ?auto_338530 - BLOCK
      ?auto_338531 - BLOCK
      ?auto_338532 - BLOCK
      ?auto_338533 - BLOCK
      ?auto_338534 - BLOCK
      ?auto_338535 - BLOCK
      ?auto_338536 - BLOCK
      ?auto_338537 - BLOCK
      ?auto_338538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338538 ) ( ON-TABLE ?auto_338525 ) ( ON ?auto_338526 ?auto_338525 ) ( ON ?auto_338527 ?auto_338526 ) ( ON ?auto_338528 ?auto_338527 ) ( ON ?auto_338529 ?auto_338528 ) ( ON ?auto_338530 ?auto_338529 ) ( ON ?auto_338531 ?auto_338530 ) ( ON ?auto_338532 ?auto_338531 ) ( ON ?auto_338533 ?auto_338532 ) ( ON ?auto_338534 ?auto_338533 ) ( ON ?auto_338535 ?auto_338534 ) ( not ( = ?auto_338525 ?auto_338526 ) ) ( not ( = ?auto_338525 ?auto_338527 ) ) ( not ( = ?auto_338525 ?auto_338528 ) ) ( not ( = ?auto_338525 ?auto_338529 ) ) ( not ( = ?auto_338525 ?auto_338530 ) ) ( not ( = ?auto_338525 ?auto_338531 ) ) ( not ( = ?auto_338525 ?auto_338532 ) ) ( not ( = ?auto_338525 ?auto_338533 ) ) ( not ( = ?auto_338525 ?auto_338534 ) ) ( not ( = ?auto_338525 ?auto_338535 ) ) ( not ( = ?auto_338525 ?auto_338536 ) ) ( not ( = ?auto_338525 ?auto_338537 ) ) ( not ( = ?auto_338525 ?auto_338538 ) ) ( not ( = ?auto_338526 ?auto_338527 ) ) ( not ( = ?auto_338526 ?auto_338528 ) ) ( not ( = ?auto_338526 ?auto_338529 ) ) ( not ( = ?auto_338526 ?auto_338530 ) ) ( not ( = ?auto_338526 ?auto_338531 ) ) ( not ( = ?auto_338526 ?auto_338532 ) ) ( not ( = ?auto_338526 ?auto_338533 ) ) ( not ( = ?auto_338526 ?auto_338534 ) ) ( not ( = ?auto_338526 ?auto_338535 ) ) ( not ( = ?auto_338526 ?auto_338536 ) ) ( not ( = ?auto_338526 ?auto_338537 ) ) ( not ( = ?auto_338526 ?auto_338538 ) ) ( not ( = ?auto_338527 ?auto_338528 ) ) ( not ( = ?auto_338527 ?auto_338529 ) ) ( not ( = ?auto_338527 ?auto_338530 ) ) ( not ( = ?auto_338527 ?auto_338531 ) ) ( not ( = ?auto_338527 ?auto_338532 ) ) ( not ( = ?auto_338527 ?auto_338533 ) ) ( not ( = ?auto_338527 ?auto_338534 ) ) ( not ( = ?auto_338527 ?auto_338535 ) ) ( not ( = ?auto_338527 ?auto_338536 ) ) ( not ( = ?auto_338527 ?auto_338537 ) ) ( not ( = ?auto_338527 ?auto_338538 ) ) ( not ( = ?auto_338528 ?auto_338529 ) ) ( not ( = ?auto_338528 ?auto_338530 ) ) ( not ( = ?auto_338528 ?auto_338531 ) ) ( not ( = ?auto_338528 ?auto_338532 ) ) ( not ( = ?auto_338528 ?auto_338533 ) ) ( not ( = ?auto_338528 ?auto_338534 ) ) ( not ( = ?auto_338528 ?auto_338535 ) ) ( not ( = ?auto_338528 ?auto_338536 ) ) ( not ( = ?auto_338528 ?auto_338537 ) ) ( not ( = ?auto_338528 ?auto_338538 ) ) ( not ( = ?auto_338529 ?auto_338530 ) ) ( not ( = ?auto_338529 ?auto_338531 ) ) ( not ( = ?auto_338529 ?auto_338532 ) ) ( not ( = ?auto_338529 ?auto_338533 ) ) ( not ( = ?auto_338529 ?auto_338534 ) ) ( not ( = ?auto_338529 ?auto_338535 ) ) ( not ( = ?auto_338529 ?auto_338536 ) ) ( not ( = ?auto_338529 ?auto_338537 ) ) ( not ( = ?auto_338529 ?auto_338538 ) ) ( not ( = ?auto_338530 ?auto_338531 ) ) ( not ( = ?auto_338530 ?auto_338532 ) ) ( not ( = ?auto_338530 ?auto_338533 ) ) ( not ( = ?auto_338530 ?auto_338534 ) ) ( not ( = ?auto_338530 ?auto_338535 ) ) ( not ( = ?auto_338530 ?auto_338536 ) ) ( not ( = ?auto_338530 ?auto_338537 ) ) ( not ( = ?auto_338530 ?auto_338538 ) ) ( not ( = ?auto_338531 ?auto_338532 ) ) ( not ( = ?auto_338531 ?auto_338533 ) ) ( not ( = ?auto_338531 ?auto_338534 ) ) ( not ( = ?auto_338531 ?auto_338535 ) ) ( not ( = ?auto_338531 ?auto_338536 ) ) ( not ( = ?auto_338531 ?auto_338537 ) ) ( not ( = ?auto_338531 ?auto_338538 ) ) ( not ( = ?auto_338532 ?auto_338533 ) ) ( not ( = ?auto_338532 ?auto_338534 ) ) ( not ( = ?auto_338532 ?auto_338535 ) ) ( not ( = ?auto_338532 ?auto_338536 ) ) ( not ( = ?auto_338532 ?auto_338537 ) ) ( not ( = ?auto_338532 ?auto_338538 ) ) ( not ( = ?auto_338533 ?auto_338534 ) ) ( not ( = ?auto_338533 ?auto_338535 ) ) ( not ( = ?auto_338533 ?auto_338536 ) ) ( not ( = ?auto_338533 ?auto_338537 ) ) ( not ( = ?auto_338533 ?auto_338538 ) ) ( not ( = ?auto_338534 ?auto_338535 ) ) ( not ( = ?auto_338534 ?auto_338536 ) ) ( not ( = ?auto_338534 ?auto_338537 ) ) ( not ( = ?auto_338534 ?auto_338538 ) ) ( not ( = ?auto_338535 ?auto_338536 ) ) ( not ( = ?auto_338535 ?auto_338537 ) ) ( not ( = ?auto_338535 ?auto_338538 ) ) ( not ( = ?auto_338536 ?auto_338537 ) ) ( not ( = ?auto_338536 ?auto_338538 ) ) ( not ( = ?auto_338537 ?auto_338538 ) ) ( ON ?auto_338537 ?auto_338538 ) ( CLEAR ?auto_338535 ) ( ON ?auto_338536 ?auto_338537 ) ( CLEAR ?auto_338536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_338525 ?auto_338526 ?auto_338527 ?auto_338528 ?auto_338529 ?auto_338530 ?auto_338531 ?auto_338532 ?auto_338533 ?auto_338534 ?auto_338535 ?auto_338536 )
      ( MAKE-14PILE ?auto_338525 ?auto_338526 ?auto_338527 ?auto_338528 ?auto_338529 ?auto_338530 ?auto_338531 ?auto_338532 ?auto_338533 ?auto_338534 ?auto_338535 ?auto_338536 ?auto_338537 ?auto_338538 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338553 - BLOCK
      ?auto_338554 - BLOCK
      ?auto_338555 - BLOCK
      ?auto_338556 - BLOCK
      ?auto_338557 - BLOCK
      ?auto_338558 - BLOCK
      ?auto_338559 - BLOCK
      ?auto_338560 - BLOCK
      ?auto_338561 - BLOCK
      ?auto_338562 - BLOCK
      ?auto_338563 - BLOCK
      ?auto_338564 - BLOCK
      ?auto_338565 - BLOCK
      ?auto_338566 - BLOCK
    )
    :vars
    (
      ?auto_338567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338566 ?auto_338567 ) ( ON-TABLE ?auto_338553 ) ( ON ?auto_338554 ?auto_338553 ) ( ON ?auto_338555 ?auto_338554 ) ( ON ?auto_338556 ?auto_338555 ) ( ON ?auto_338557 ?auto_338556 ) ( ON ?auto_338558 ?auto_338557 ) ( ON ?auto_338559 ?auto_338558 ) ( ON ?auto_338560 ?auto_338559 ) ( ON ?auto_338561 ?auto_338560 ) ( ON ?auto_338562 ?auto_338561 ) ( not ( = ?auto_338553 ?auto_338554 ) ) ( not ( = ?auto_338553 ?auto_338555 ) ) ( not ( = ?auto_338553 ?auto_338556 ) ) ( not ( = ?auto_338553 ?auto_338557 ) ) ( not ( = ?auto_338553 ?auto_338558 ) ) ( not ( = ?auto_338553 ?auto_338559 ) ) ( not ( = ?auto_338553 ?auto_338560 ) ) ( not ( = ?auto_338553 ?auto_338561 ) ) ( not ( = ?auto_338553 ?auto_338562 ) ) ( not ( = ?auto_338553 ?auto_338563 ) ) ( not ( = ?auto_338553 ?auto_338564 ) ) ( not ( = ?auto_338553 ?auto_338565 ) ) ( not ( = ?auto_338553 ?auto_338566 ) ) ( not ( = ?auto_338553 ?auto_338567 ) ) ( not ( = ?auto_338554 ?auto_338555 ) ) ( not ( = ?auto_338554 ?auto_338556 ) ) ( not ( = ?auto_338554 ?auto_338557 ) ) ( not ( = ?auto_338554 ?auto_338558 ) ) ( not ( = ?auto_338554 ?auto_338559 ) ) ( not ( = ?auto_338554 ?auto_338560 ) ) ( not ( = ?auto_338554 ?auto_338561 ) ) ( not ( = ?auto_338554 ?auto_338562 ) ) ( not ( = ?auto_338554 ?auto_338563 ) ) ( not ( = ?auto_338554 ?auto_338564 ) ) ( not ( = ?auto_338554 ?auto_338565 ) ) ( not ( = ?auto_338554 ?auto_338566 ) ) ( not ( = ?auto_338554 ?auto_338567 ) ) ( not ( = ?auto_338555 ?auto_338556 ) ) ( not ( = ?auto_338555 ?auto_338557 ) ) ( not ( = ?auto_338555 ?auto_338558 ) ) ( not ( = ?auto_338555 ?auto_338559 ) ) ( not ( = ?auto_338555 ?auto_338560 ) ) ( not ( = ?auto_338555 ?auto_338561 ) ) ( not ( = ?auto_338555 ?auto_338562 ) ) ( not ( = ?auto_338555 ?auto_338563 ) ) ( not ( = ?auto_338555 ?auto_338564 ) ) ( not ( = ?auto_338555 ?auto_338565 ) ) ( not ( = ?auto_338555 ?auto_338566 ) ) ( not ( = ?auto_338555 ?auto_338567 ) ) ( not ( = ?auto_338556 ?auto_338557 ) ) ( not ( = ?auto_338556 ?auto_338558 ) ) ( not ( = ?auto_338556 ?auto_338559 ) ) ( not ( = ?auto_338556 ?auto_338560 ) ) ( not ( = ?auto_338556 ?auto_338561 ) ) ( not ( = ?auto_338556 ?auto_338562 ) ) ( not ( = ?auto_338556 ?auto_338563 ) ) ( not ( = ?auto_338556 ?auto_338564 ) ) ( not ( = ?auto_338556 ?auto_338565 ) ) ( not ( = ?auto_338556 ?auto_338566 ) ) ( not ( = ?auto_338556 ?auto_338567 ) ) ( not ( = ?auto_338557 ?auto_338558 ) ) ( not ( = ?auto_338557 ?auto_338559 ) ) ( not ( = ?auto_338557 ?auto_338560 ) ) ( not ( = ?auto_338557 ?auto_338561 ) ) ( not ( = ?auto_338557 ?auto_338562 ) ) ( not ( = ?auto_338557 ?auto_338563 ) ) ( not ( = ?auto_338557 ?auto_338564 ) ) ( not ( = ?auto_338557 ?auto_338565 ) ) ( not ( = ?auto_338557 ?auto_338566 ) ) ( not ( = ?auto_338557 ?auto_338567 ) ) ( not ( = ?auto_338558 ?auto_338559 ) ) ( not ( = ?auto_338558 ?auto_338560 ) ) ( not ( = ?auto_338558 ?auto_338561 ) ) ( not ( = ?auto_338558 ?auto_338562 ) ) ( not ( = ?auto_338558 ?auto_338563 ) ) ( not ( = ?auto_338558 ?auto_338564 ) ) ( not ( = ?auto_338558 ?auto_338565 ) ) ( not ( = ?auto_338558 ?auto_338566 ) ) ( not ( = ?auto_338558 ?auto_338567 ) ) ( not ( = ?auto_338559 ?auto_338560 ) ) ( not ( = ?auto_338559 ?auto_338561 ) ) ( not ( = ?auto_338559 ?auto_338562 ) ) ( not ( = ?auto_338559 ?auto_338563 ) ) ( not ( = ?auto_338559 ?auto_338564 ) ) ( not ( = ?auto_338559 ?auto_338565 ) ) ( not ( = ?auto_338559 ?auto_338566 ) ) ( not ( = ?auto_338559 ?auto_338567 ) ) ( not ( = ?auto_338560 ?auto_338561 ) ) ( not ( = ?auto_338560 ?auto_338562 ) ) ( not ( = ?auto_338560 ?auto_338563 ) ) ( not ( = ?auto_338560 ?auto_338564 ) ) ( not ( = ?auto_338560 ?auto_338565 ) ) ( not ( = ?auto_338560 ?auto_338566 ) ) ( not ( = ?auto_338560 ?auto_338567 ) ) ( not ( = ?auto_338561 ?auto_338562 ) ) ( not ( = ?auto_338561 ?auto_338563 ) ) ( not ( = ?auto_338561 ?auto_338564 ) ) ( not ( = ?auto_338561 ?auto_338565 ) ) ( not ( = ?auto_338561 ?auto_338566 ) ) ( not ( = ?auto_338561 ?auto_338567 ) ) ( not ( = ?auto_338562 ?auto_338563 ) ) ( not ( = ?auto_338562 ?auto_338564 ) ) ( not ( = ?auto_338562 ?auto_338565 ) ) ( not ( = ?auto_338562 ?auto_338566 ) ) ( not ( = ?auto_338562 ?auto_338567 ) ) ( not ( = ?auto_338563 ?auto_338564 ) ) ( not ( = ?auto_338563 ?auto_338565 ) ) ( not ( = ?auto_338563 ?auto_338566 ) ) ( not ( = ?auto_338563 ?auto_338567 ) ) ( not ( = ?auto_338564 ?auto_338565 ) ) ( not ( = ?auto_338564 ?auto_338566 ) ) ( not ( = ?auto_338564 ?auto_338567 ) ) ( not ( = ?auto_338565 ?auto_338566 ) ) ( not ( = ?auto_338565 ?auto_338567 ) ) ( not ( = ?auto_338566 ?auto_338567 ) ) ( ON ?auto_338565 ?auto_338566 ) ( ON ?auto_338564 ?auto_338565 ) ( CLEAR ?auto_338562 ) ( ON ?auto_338563 ?auto_338564 ) ( CLEAR ?auto_338563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_338553 ?auto_338554 ?auto_338555 ?auto_338556 ?auto_338557 ?auto_338558 ?auto_338559 ?auto_338560 ?auto_338561 ?auto_338562 ?auto_338563 )
      ( MAKE-14PILE ?auto_338553 ?auto_338554 ?auto_338555 ?auto_338556 ?auto_338557 ?auto_338558 ?auto_338559 ?auto_338560 ?auto_338561 ?auto_338562 ?auto_338563 ?auto_338564 ?auto_338565 ?auto_338566 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338582 - BLOCK
      ?auto_338583 - BLOCK
      ?auto_338584 - BLOCK
      ?auto_338585 - BLOCK
      ?auto_338586 - BLOCK
      ?auto_338587 - BLOCK
      ?auto_338588 - BLOCK
      ?auto_338589 - BLOCK
      ?auto_338590 - BLOCK
      ?auto_338591 - BLOCK
      ?auto_338592 - BLOCK
      ?auto_338593 - BLOCK
      ?auto_338594 - BLOCK
      ?auto_338595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338595 ) ( ON-TABLE ?auto_338582 ) ( ON ?auto_338583 ?auto_338582 ) ( ON ?auto_338584 ?auto_338583 ) ( ON ?auto_338585 ?auto_338584 ) ( ON ?auto_338586 ?auto_338585 ) ( ON ?auto_338587 ?auto_338586 ) ( ON ?auto_338588 ?auto_338587 ) ( ON ?auto_338589 ?auto_338588 ) ( ON ?auto_338590 ?auto_338589 ) ( ON ?auto_338591 ?auto_338590 ) ( not ( = ?auto_338582 ?auto_338583 ) ) ( not ( = ?auto_338582 ?auto_338584 ) ) ( not ( = ?auto_338582 ?auto_338585 ) ) ( not ( = ?auto_338582 ?auto_338586 ) ) ( not ( = ?auto_338582 ?auto_338587 ) ) ( not ( = ?auto_338582 ?auto_338588 ) ) ( not ( = ?auto_338582 ?auto_338589 ) ) ( not ( = ?auto_338582 ?auto_338590 ) ) ( not ( = ?auto_338582 ?auto_338591 ) ) ( not ( = ?auto_338582 ?auto_338592 ) ) ( not ( = ?auto_338582 ?auto_338593 ) ) ( not ( = ?auto_338582 ?auto_338594 ) ) ( not ( = ?auto_338582 ?auto_338595 ) ) ( not ( = ?auto_338583 ?auto_338584 ) ) ( not ( = ?auto_338583 ?auto_338585 ) ) ( not ( = ?auto_338583 ?auto_338586 ) ) ( not ( = ?auto_338583 ?auto_338587 ) ) ( not ( = ?auto_338583 ?auto_338588 ) ) ( not ( = ?auto_338583 ?auto_338589 ) ) ( not ( = ?auto_338583 ?auto_338590 ) ) ( not ( = ?auto_338583 ?auto_338591 ) ) ( not ( = ?auto_338583 ?auto_338592 ) ) ( not ( = ?auto_338583 ?auto_338593 ) ) ( not ( = ?auto_338583 ?auto_338594 ) ) ( not ( = ?auto_338583 ?auto_338595 ) ) ( not ( = ?auto_338584 ?auto_338585 ) ) ( not ( = ?auto_338584 ?auto_338586 ) ) ( not ( = ?auto_338584 ?auto_338587 ) ) ( not ( = ?auto_338584 ?auto_338588 ) ) ( not ( = ?auto_338584 ?auto_338589 ) ) ( not ( = ?auto_338584 ?auto_338590 ) ) ( not ( = ?auto_338584 ?auto_338591 ) ) ( not ( = ?auto_338584 ?auto_338592 ) ) ( not ( = ?auto_338584 ?auto_338593 ) ) ( not ( = ?auto_338584 ?auto_338594 ) ) ( not ( = ?auto_338584 ?auto_338595 ) ) ( not ( = ?auto_338585 ?auto_338586 ) ) ( not ( = ?auto_338585 ?auto_338587 ) ) ( not ( = ?auto_338585 ?auto_338588 ) ) ( not ( = ?auto_338585 ?auto_338589 ) ) ( not ( = ?auto_338585 ?auto_338590 ) ) ( not ( = ?auto_338585 ?auto_338591 ) ) ( not ( = ?auto_338585 ?auto_338592 ) ) ( not ( = ?auto_338585 ?auto_338593 ) ) ( not ( = ?auto_338585 ?auto_338594 ) ) ( not ( = ?auto_338585 ?auto_338595 ) ) ( not ( = ?auto_338586 ?auto_338587 ) ) ( not ( = ?auto_338586 ?auto_338588 ) ) ( not ( = ?auto_338586 ?auto_338589 ) ) ( not ( = ?auto_338586 ?auto_338590 ) ) ( not ( = ?auto_338586 ?auto_338591 ) ) ( not ( = ?auto_338586 ?auto_338592 ) ) ( not ( = ?auto_338586 ?auto_338593 ) ) ( not ( = ?auto_338586 ?auto_338594 ) ) ( not ( = ?auto_338586 ?auto_338595 ) ) ( not ( = ?auto_338587 ?auto_338588 ) ) ( not ( = ?auto_338587 ?auto_338589 ) ) ( not ( = ?auto_338587 ?auto_338590 ) ) ( not ( = ?auto_338587 ?auto_338591 ) ) ( not ( = ?auto_338587 ?auto_338592 ) ) ( not ( = ?auto_338587 ?auto_338593 ) ) ( not ( = ?auto_338587 ?auto_338594 ) ) ( not ( = ?auto_338587 ?auto_338595 ) ) ( not ( = ?auto_338588 ?auto_338589 ) ) ( not ( = ?auto_338588 ?auto_338590 ) ) ( not ( = ?auto_338588 ?auto_338591 ) ) ( not ( = ?auto_338588 ?auto_338592 ) ) ( not ( = ?auto_338588 ?auto_338593 ) ) ( not ( = ?auto_338588 ?auto_338594 ) ) ( not ( = ?auto_338588 ?auto_338595 ) ) ( not ( = ?auto_338589 ?auto_338590 ) ) ( not ( = ?auto_338589 ?auto_338591 ) ) ( not ( = ?auto_338589 ?auto_338592 ) ) ( not ( = ?auto_338589 ?auto_338593 ) ) ( not ( = ?auto_338589 ?auto_338594 ) ) ( not ( = ?auto_338589 ?auto_338595 ) ) ( not ( = ?auto_338590 ?auto_338591 ) ) ( not ( = ?auto_338590 ?auto_338592 ) ) ( not ( = ?auto_338590 ?auto_338593 ) ) ( not ( = ?auto_338590 ?auto_338594 ) ) ( not ( = ?auto_338590 ?auto_338595 ) ) ( not ( = ?auto_338591 ?auto_338592 ) ) ( not ( = ?auto_338591 ?auto_338593 ) ) ( not ( = ?auto_338591 ?auto_338594 ) ) ( not ( = ?auto_338591 ?auto_338595 ) ) ( not ( = ?auto_338592 ?auto_338593 ) ) ( not ( = ?auto_338592 ?auto_338594 ) ) ( not ( = ?auto_338592 ?auto_338595 ) ) ( not ( = ?auto_338593 ?auto_338594 ) ) ( not ( = ?auto_338593 ?auto_338595 ) ) ( not ( = ?auto_338594 ?auto_338595 ) ) ( ON ?auto_338594 ?auto_338595 ) ( ON ?auto_338593 ?auto_338594 ) ( CLEAR ?auto_338591 ) ( ON ?auto_338592 ?auto_338593 ) ( CLEAR ?auto_338592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_338582 ?auto_338583 ?auto_338584 ?auto_338585 ?auto_338586 ?auto_338587 ?auto_338588 ?auto_338589 ?auto_338590 ?auto_338591 ?auto_338592 )
      ( MAKE-14PILE ?auto_338582 ?auto_338583 ?auto_338584 ?auto_338585 ?auto_338586 ?auto_338587 ?auto_338588 ?auto_338589 ?auto_338590 ?auto_338591 ?auto_338592 ?auto_338593 ?auto_338594 ?auto_338595 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338610 - BLOCK
      ?auto_338611 - BLOCK
      ?auto_338612 - BLOCK
      ?auto_338613 - BLOCK
      ?auto_338614 - BLOCK
      ?auto_338615 - BLOCK
      ?auto_338616 - BLOCK
      ?auto_338617 - BLOCK
      ?auto_338618 - BLOCK
      ?auto_338619 - BLOCK
      ?auto_338620 - BLOCK
      ?auto_338621 - BLOCK
      ?auto_338622 - BLOCK
      ?auto_338623 - BLOCK
    )
    :vars
    (
      ?auto_338624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338623 ?auto_338624 ) ( ON-TABLE ?auto_338610 ) ( ON ?auto_338611 ?auto_338610 ) ( ON ?auto_338612 ?auto_338611 ) ( ON ?auto_338613 ?auto_338612 ) ( ON ?auto_338614 ?auto_338613 ) ( ON ?auto_338615 ?auto_338614 ) ( ON ?auto_338616 ?auto_338615 ) ( ON ?auto_338617 ?auto_338616 ) ( ON ?auto_338618 ?auto_338617 ) ( not ( = ?auto_338610 ?auto_338611 ) ) ( not ( = ?auto_338610 ?auto_338612 ) ) ( not ( = ?auto_338610 ?auto_338613 ) ) ( not ( = ?auto_338610 ?auto_338614 ) ) ( not ( = ?auto_338610 ?auto_338615 ) ) ( not ( = ?auto_338610 ?auto_338616 ) ) ( not ( = ?auto_338610 ?auto_338617 ) ) ( not ( = ?auto_338610 ?auto_338618 ) ) ( not ( = ?auto_338610 ?auto_338619 ) ) ( not ( = ?auto_338610 ?auto_338620 ) ) ( not ( = ?auto_338610 ?auto_338621 ) ) ( not ( = ?auto_338610 ?auto_338622 ) ) ( not ( = ?auto_338610 ?auto_338623 ) ) ( not ( = ?auto_338610 ?auto_338624 ) ) ( not ( = ?auto_338611 ?auto_338612 ) ) ( not ( = ?auto_338611 ?auto_338613 ) ) ( not ( = ?auto_338611 ?auto_338614 ) ) ( not ( = ?auto_338611 ?auto_338615 ) ) ( not ( = ?auto_338611 ?auto_338616 ) ) ( not ( = ?auto_338611 ?auto_338617 ) ) ( not ( = ?auto_338611 ?auto_338618 ) ) ( not ( = ?auto_338611 ?auto_338619 ) ) ( not ( = ?auto_338611 ?auto_338620 ) ) ( not ( = ?auto_338611 ?auto_338621 ) ) ( not ( = ?auto_338611 ?auto_338622 ) ) ( not ( = ?auto_338611 ?auto_338623 ) ) ( not ( = ?auto_338611 ?auto_338624 ) ) ( not ( = ?auto_338612 ?auto_338613 ) ) ( not ( = ?auto_338612 ?auto_338614 ) ) ( not ( = ?auto_338612 ?auto_338615 ) ) ( not ( = ?auto_338612 ?auto_338616 ) ) ( not ( = ?auto_338612 ?auto_338617 ) ) ( not ( = ?auto_338612 ?auto_338618 ) ) ( not ( = ?auto_338612 ?auto_338619 ) ) ( not ( = ?auto_338612 ?auto_338620 ) ) ( not ( = ?auto_338612 ?auto_338621 ) ) ( not ( = ?auto_338612 ?auto_338622 ) ) ( not ( = ?auto_338612 ?auto_338623 ) ) ( not ( = ?auto_338612 ?auto_338624 ) ) ( not ( = ?auto_338613 ?auto_338614 ) ) ( not ( = ?auto_338613 ?auto_338615 ) ) ( not ( = ?auto_338613 ?auto_338616 ) ) ( not ( = ?auto_338613 ?auto_338617 ) ) ( not ( = ?auto_338613 ?auto_338618 ) ) ( not ( = ?auto_338613 ?auto_338619 ) ) ( not ( = ?auto_338613 ?auto_338620 ) ) ( not ( = ?auto_338613 ?auto_338621 ) ) ( not ( = ?auto_338613 ?auto_338622 ) ) ( not ( = ?auto_338613 ?auto_338623 ) ) ( not ( = ?auto_338613 ?auto_338624 ) ) ( not ( = ?auto_338614 ?auto_338615 ) ) ( not ( = ?auto_338614 ?auto_338616 ) ) ( not ( = ?auto_338614 ?auto_338617 ) ) ( not ( = ?auto_338614 ?auto_338618 ) ) ( not ( = ?auto_338614 ?auto_338619 ) ) ( not ( = ?auto_338614 ?auto_338620 ) ) ( not ( = ?auto_338614 ?auto_338621 ) ) ( not ( = ?auto_338614 ?auto_338622 ) ) ( not ( = ?auto_338614 ?auto_338623 ) ) ( not ( = ?auto_338614 ?auto_338624 ) ) ( not ( = ?auto_338615 ?auto_338616 ) ) ( not ( = ?auto_338615 ?auto_338617 ) ) ( not ( = ?auto_338615 ?auto_338618 ) ) ( not ( = ?auto_338615 ?auto_338619 ) ) ( not ( = ?auto_338615 ?auto_338620 ) ) ( not ( = ?auto_338615 ?auto_338621 ) ) ( not ( = ?auto_338615 ?auto_338622 ) ) ( not ( = ?auto_338615 ?auto_338623 ) ) ( not ( = ?auto_338615 ?auto_338624 ) ) ( not ( = ?auto_338616 ?auto_338617 ) ) ( not ( = ?auto_338616 ?auto_338618 ) ) ( not ( = ?auto_338616 ?auto_338619 ) ) ( not ( = ?auto_338616 ?auto_338620 ) ) ( not ( = ?auto_338616 ?auto_338621 ) ) ( not ( = ?auto_338616 ?auto_338622 ) ) ( not ( = ?auto_338616 ?auto_338623 ) ) ( not ( = ?auto_338616 ?auto_338624 ) ) ( not ( = ?auto_338617 ?auto_338618 ) ) ( not ( = ?auto_338617 ?auto_338619 ) ) ( not ( = ?auto_338617 ?auto_338620 ) ) ( not ( = ?auto_338617 ?auto_338621 ) ) ( not ( = ?auto_338617 ?auto_338622 ) ) ( not ( = ?auto_338617 ?auto_338623 ) ) ( not ( = ?auto_338617 ?auto_338624 ) ) ( not ( = ?auto_338618 ?auto_338619 ) ) ( not ( = ?auto_338618 ?auto_338620 ) ) ( not ( = ?auto_338618 ?auto_338621 ) ) ( not ( = ?auto_338618 ?auto_338622 ) ) ( not ( = ?auto_338618 ?auto_338623 ) ) ( not ( = ?auto_338618 ?auto_338624 ) ) ( not ( = ?auto_338619 ?auto_338620 ) ) ( not ( = ?auto_338619 ?auto_338621 ) ) ( not ( = ?auto_338619 ?auto_338622 ) ) ( not ( = ?auto_338619 ?auto_338623 ) ) ( not ( = ?auto_338619 ?auto_338624 ) ) ( not ( = ?auto_338620 ?auto_338621 ) ) ( not ( = ?auto_338620 ?auto_338622 ) ) ( not ( = ?auto_338620 ?auto_338623 ) ) ( not ( = ?auto_338620 ?auto_338624 ) ) ( not ( = ?auto_338621 ?auto_338622 ) ) ( not ( = ?auto_338621 ?auto_338623 ) ) ( not ( = ?auto_338621 ?auto_338624 ) ) ( not ( = ?auto_338622 ?auto_338623 ) ) ( not ( = ?auto_338622 ?auto_338624 ) ) ( not ( = ?auto_338623 ?auto_338624 ) ) ( ON ?auto_338622 ?auto_338623 ) ( ON ?auto_338621 ?auto_338622 ) ( ON ?auto_338620 ?auto_338621 ) ( CLEAR ?auto_338618 ) ( ON ?auto_338619 ?auto_338620 ) ( CLEAR ?auto_338619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_338610 ?auto_338611 ?auto_338612 ?auto_338613 ?auto_338614 ?auto_338615 ?auto_338616 ?auto_338617 ?auto_338618 ?auto_338619 )
      ( MAKE-14PILE ?auto_338610 ?auto_338611 ?auto_338612 ?auto_338613 ?auto_338614 ?auto_338615 ?auto_338616 ?auto_338617 ?auto_338618 ?auto_338619 ?auto_338620 ?auto_338621 ?auto_338622 ?auto_338623 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338639 - BLOCK
      ?auto_338640 - BLOCK
      ?auto_338641 - BLOCK
      ?auto_338642 - BLOCK
      ?auto_338643 - BLOCK
      ?auto_338644 - BLOCK
      ?auto_338645 - BLOCK
      ?auto_338646 - BLOCK
      ?auto_338647 - BLOCK
      ?auto_338648 - BLOCK
      ?auto_338649 - BLOCK
      ?auto_338650 - BLOCK
      ?auto_338651 - BLOCK
      ?auto_338652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338652 ) ( ON-TABLE ?auto_338639 ) ( ON ?auto_338640 ?auto_338639 ) ( ON ?auto_338641 ?auto_338640 ) ( ON ?auto_338642 ?auto_338641 ) ( ON ?auto_338643 ?auto_338642 ) ( ON ?auto_338644 ?auto_338643 ) ( ON ?auto_338645 ?auto_338644 ) ( ON ?auto_338646 ?auto_338645 ) ( ON ?auto_338647 ?auto_338646 ) ( not ( = ?auto_338639 ?auto_338640 ) ) ( not ( = ?auto_338639 ?auto_338641 ) ) ( not ( = ?auto_338639 ?auto_338642 ) ) ( not ( = ?auto_338639 ?auto_338643 ) ) ( not ( = ?auto_338639 ?auto_338644 ) ) ( not ( = ?auto_338639 ?auto_338645 ) ) ( not ( = ?auto_338639 ?auto_338646 ) ) ( not ( = ?auto_338639 ?auto_338647 ) ) ( not ( = ?auto_338639 ?auto_338648 ) ) ( not ( = ?auto_338639 ?auto_338649 ) ) ( not ( = ?auto_338639 ?auto_338650 ) ) ( not ( = ?auto_338639 ?auto_338651 ) ) ( not ( = ?auto_338639 ?auto_338652 ) ) ( not ( = ?auto_338640 ?auto_338641 ) ) ( not ( = ?auto_338640 ?auto_338642 ) ) ( not ( = ?auto_338640 ?auto_338643 ) ) ( not ( = ?auto_338640 ?auto_338644 ) ) ( not ( = ?auto_338640 ?auto_338645 ) ) ( not ( = ?auto_338640 ?auto_338646 ) ) ( not ( = ?auto_338640 ?auto_338647 ) ) ( not ( = ?auto_338640 ?auto_338648 ) ) ( not ( = ?auto_338640 ?auto_338649 ) ) ( not ( = ?auto_338640 ?auto_338650 ) ) ( not ( = ?auto_338640 ?auto_338651 ) ) ( not ( = ?auto_338640 ?auto_338652 ) ) ( not ( = ?auto_338641 ?auto_338642 ) ) ( not ( = ?auto_338641 ?auto_338643 ) ) ( not ( = ?auto_338641 ?auto_338644 ) ) ( not ( = ?auto_338641 ?auto_338645 ) ) ( not ( = ?auto_338641 ?auto_338646 ) ) ( not ( = ?auto_338641 ?auto_338647 ) ) ( not ( = ?auto_338641 ?auto_338648 ) ) ( not ( = ?auto_338641 ?auto_338649 ) ) ( not ( = ?auto_338641 ?auto_338650 ) ) ( not ( = ?auto_338641 ?auto_338651 ) ) ( not ( = ?auto_338641 ?auto_338652 ) ) ( not ( = ?auto_338642 ?auto_338643 ) ) ( not ( = ?auto_338642 ?auto_338644 ) ) ( not ( = ?auto_338642 ?auto_338645 ) ) ( not ( = ?auto_338642 ?auto_338646 ) ) ( not ( = ?auto_338642 ?auto_338647 ) ) ( not ( = ?auto_338642 ?auto_338648 ) ) ( not ( = ?auto_338642 ?auto_338649 ) ) ( not ( = ?auto_338642 ?auto_338650 ) ) ( not ( = ?auto_338642 ?auto_338651 ) ) ( not ( = ?auto_338642 ?auto_338652 ) ) ( not ( = ?auto_338643 ?auto_338644 ) ) ( not ( = ?auto_338643 ?auto_338645 ) ) ( not ( = ?auto_338643 ?auto_338646 ) ) ( not ( = ?auto_338643 ?auto_338647 ) ) ( not ( = ?auto_338643 ?auto_338648 ) ) ( not ( = ?auto_338643 ?auto_338649 ) ) ( not ( = ?auto_338643 ?auto_338650 ) ) ( not ( = ?auto_338643 ?auto_338651 ) ) ( not ( = ?auto_338643 ?auto_338652 ) ) ( not ( = ?auto_338644 ?auto_338645 ) ) ( not ( = ?auto_338644 ?auto_338646 ) ) ( not ( = ?auto_338644 ?auto_338647 ) ) ( not ( = ?auto_338644 ?auto_338648 ) ) ( not ( = ?auto_338644 ?auto_338649 ) ) ( not ( = ?auto_338644 ?auto_338650 ) ) ( not ( = ?auto_338644 ?auto_338651 ) ) ( not ( = ?auto_338644 ?auto_338652 ) ) ( not ( = ?auto_338645 ?auto_338646 ) ) ( not ( = ?auto_338645 ?auto_338647 ) ) ( not ( = ?auto_338645 ?auto_338648 ) ) ( not ( = ?auto_338645 ?auto_338649 ) ) ( not ( = ?auto_338645 ?auto_338650 ) ) ( not ( = ?auto_338645 ?auto_338651 ) ) ( not ( = ?auto_338645 ?auto_338652 ) ) ( not ( = ?auto_338646 ?auto_338647 ) ) ( not ( = ?auto_338646 ?auto_338648 ) ) ( not ( = ?auto_338646 ?auto_338649 ) ) ( not ( = ?auto_338646 ?auto_338650 ) ) ( not ( = ?auto_338646 ?auto_338651 ) ) ( not ( = ?auto_338646 ?auto_338652 ) ) ( not ( = ?auto_338647 ?auto_338648 ) ) ( not ( = ?auto_338647 ?auto_338649 ) ) ( not ( = ?auto_338647 ?auto_338650 ) ) ( not ( = ?auto_338647 ?auto_338651 ) ) ( not ( = ?auto_338647 ?auto_338652 ) ) ( not ( = ?auto_338648 ?auto_338649 ) ) ( not ( = ?auto_338648 ?auto_338650 ) ) ( not ( = ?auto_338648 ?auto_338651 ) ) ( not ( = ?auto_338648 ?auto_338652 ) ) ( not ( = ?auto_338649 ?auto_338650 ) ) ( not ( = ?auto_338649 ?auto_338651 ) ) ( not ( = ?auto_338649 ?auto_338652 ) ) ( not ( = ?auto_338650 ?auto_338651 ) ) ( not ( = ?auto_338650 ?auto_338652 ) ) ( not ( = ?auto_338651 ?auto_338652 ) ) ( ON ?auto_338651 ?auto_338652 ) ( ON ?auto_338650 ?auto_338651 ) ( ON ?auto_338649 ?auto_338650 ) ( CLEAR ?auto_338647 ) ( ON ?auto_338648 ?auto_338649 ) ( CLEAR ?auto_338648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_338639 ?auto_338640 ?auto_338641 ?auto_338642 ?auto_338643 ?auto_338644 ?auto_338645 ?auto_338646 ?auto_338647 ?auto_338648 )
      ( MAKE-14PILE ?auto_338639 ?auto_338640 ?auto_338641 ?auto_338642 ?auto_338643 ?auto_338644 ?auto_338645 ?auto_338646 ?auto_338647 ?auto_338648 ?auto_338649 ?auto_338650 ?auto_338651 ?auto_338652 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338667 - BLOCK
      ?auto_338668 - BLOCK
      ?auto_338669 - BLOCK
      ?auto_338670 - BLOCK
      ?auto_338671 - BLOCK
      ?auto_338672 - BLOCK
      ?auto_338673 - BLOCK
      ?auto_338674 - BLOCK
      ?auto_338675 - BLOCK
      ?auto_338676 - BLOCK
      ?auto_338677 - BLOCK
      ?auto_338678 - BLOCK
      ?auto_338679 - BLOCK
      ?auto_338680 - BLOCK
    )
    :vars
    (
      ?auto_338681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338680 ?auto_338681 ) ( ON-TABLE ?auto_338667 ) ( ON ?auto_338668 ?auto_338667 ) ( ON ?auto_338669 ?auto_338668 ) ( ON ?auto_338670 ?auto_338669 ) ( ON ?auto_338671 ?auto_338670 ) ( ON ?auto_338672 ?auto_338671 ) ( ON ?auto_338673 ?auto_338672 ) ( ON ?auto_338674 ?auto_338673 ) ( not ( = ?auto_338667 ?auto_338668 ) ) ( not ( = ?auto_338667 ?auto_338669 ) ) ( not ( = ?auto_338667 ?auto_338670 ) ) ( not ( = ?auto_338667 ?auto_338671 ) ) ( not ( = ?auto_338667 ?auto_338672 ) ) ( not ( = ?auto_338667 ?auto_338673 ) ) ( not ( = ?auto_338667 ?auto_338674 ) ) ( not ( = ?auto_338667 ?auto_338675 ) ) ( not ( = ?auto_338667 ?auto_338676 ) ) ( not ( = ?auto_338667 ?auto_338677 ) ) ( not ( = ?auto_338667 ?auto_338678 ) ) ( not ( = ?auto_338667 ?auto_338679 ) ) ( not ( = ?auto_338667 ?auto_338680 ) ) ( not ( = ?auto_338667 ?auto_338681 ) ) ( not ( = ?auto_338668 ?auto_338669 ) ) ( not ( = ?auto_338668 ?auto_338670 ) ) ( not ( = ?auto_338668 ?auto_338671 ) ) ( not ( = ?auto_338668 ?auto_338672 ) ) ( not ( = ?auto_338668 ?auto_338673 ) ) ( not ( = ?auto_338668 ?auto_338674 ) ) ( not ( = ?auto_338668 ?auto_338675 ) ) ( not ( = ?auto_338668 ?auto_338676 ) ) ( not ( = ?auto_338668 ?auto_338677 ) ) ( not ( = ?auto_338668 ?auto_338678 ) ) ( not ( = ?auto_338668 ?auto_338679 ) ) ( not ( = ?auto_338668 ?auto_338680 ) ) ( not ( = ?auto_338668 ?auto_338681 ) ) ( not ( = ?auto_338669 ?auto_338670 ) ) ( not ( = ?auto_338669 ?auto_338671 ) ) ( not ( = ?auto_338669 ?auto_338672 ) ) ( not ( = ?auto_338669 ?auto_338673 ) ) ( not ( = ?auto_338669 ?auto_338674 ) ) ( not ( = ?auto_338669 ?auto_338675 ) ) ( not ( = ?auto_338669 ?auto_338676 ) ) ( not ( = ?auto_338669 ?auto_338677 ) ) ( not ( = ?auto_338669 ?auto_338678 ) ) ( not ( = ?auto_338669 ?auto_338679 ) ) ( not ( = ?auto_338669 ?auto_338680 ) ) ( not ( = ?auto_338669 ?auto_338681 ) ) ( not ( = ?auto_338670 ?auto_338671 ) ) ( not ( = ?auto_338670 ?auto_338672 ) ) ( not ( = ?auto_338670 ?auto_338673 ) ) ( not ( = ?auto_338670 ?auto_338674 ) ) ( not ( = ?auto_338670 ?auto_338675 ) ) ( not ( = ?auto_338670 ?auto_338676 ) ) ( not ( = ?auto_338670 ?auto_338677 ) ) ( not ( = ?auto_338670 ?auto_338678 ) ) ( not ( = ?auto_338670 ?auto_338679 ) ) ( not ( = ?auto_338670 ?auto_338680 ) ) ( not ( = ?auto_338670 ?auto_338681 ) ) ( not ( = ?auto_338671 ?auto_338672 ) ) ( not ( = ?auto_338671 ?auto_338673 ) ) ( not ( = ?auto_338671 ?auto_338674 ) ) ( not ( = ?auto_338671 ?auto_338675 ) ) ( not ( = ?auto_338671 ?auto_338676 ) ) ( not ( = ?auto_338671 ?auto_338677 ) ) ( not ( = ?auto_338671 ?auto_338678 ) ) ( not ( = ?auto_338671 ?auto_338679 ) ) ( not ( = ?auto_338671 ?auto_338680 ) ) ( not ( = ?auto_338671 ?auto_338681 ) ) ( not ( = ?auto_338672 ?auto_338673 ) ) ( not ( = ?auto_338672 ?auto_338674 ) ) ( not ( = ?auto_338672 ?auto_338675 ) ) ( not ( = ?auto_338672 ?auto_338676 ) ) ( not ( = ?auto_338672 ?auto_338677 ) ) ( not ( = ?auto_338672 ?auto_338678 ) ) ( not ( = ?auto_338672 ?auto_338679 ) ) ( not ( = ?auto_338672 ?auto_338680 ) ) ( not ( = ?auto_338672 ?auto_338681 ) ) ( not ( = ?auto_338673 ?auto_338674 ) ) ( not ( = ?auto_338673 ?auto_338675 ) ) ( not ( = ?auto_338673 ?auto_338676 ) ) ( not ( = ?auto_338673 ?auto_338677 ) ) ( not ( = ?auto_338673 ?auto_338678 ) ) ( not ( = ?auto_338673 ?auto_338679 ) ) ( not ( = ?auto_338673 ?auto_338680 ) ) ( not ( = ?auto_338673 ?auto_338681 ) ) ( not ( = ?auto_338674 ?auto_338675 ) ) ( not ( = ?auto_338674 ?auto_338676 ) ) ( not ( = ?auto_338674 ?auto_338677 ) ) ( not ( = ?auto_338674 ?auto_338678 ) ) ( not ( = ?auto_338674 ?auto_338679 ) ) ( not ( = ?auto_338674 ?auto_338680 ) ) ( not ( = ?auto_338674 ?auto_338681 ) ) ( not ( = ?auto_338675 ?auto_338676 ) ) ( not ( = ?auto_338675 ?auto_338677 ) ) ( not ( = ?auto_338675 ?auto_338678 ) ) ( not ( = ?auto_338675 ?auto_338679 ) ) ( not ( = ?auto_338675 ?auto_338680 ) ) ( not ( = ?auto_338675 ?auto_338681 ) ) ( not ( = ?auto_338676 ?auto_338677 ) ) ( not ( = ?auto_338676 ?auto_338678 ) ) ( not ( = ?auto_338676 ?auto_338679 ) ) ( not ( = ?auto_338676 ?auto_338680 ) ) ( not ( = ?auto_338676 ?auto_338681 ) ) ( not ( = ?auto_338677 ?auto_338678 ) ) ( not ( = ?auto_338677 ?auto_338679 ) ) ( not ( = ?auto_338677 ?auto_338680 ) ) ( not ( = ?auto_338677 ?auto_338681 ) ) ( not ( = ?auto_338678 ?auto_338679 ) ) ( not ( = ?auto_338678 ?auto_338680 ) ) ( not ( = ?auto_338678 ?auto_338681 ) ) ( not ( = ?auto_338679 ?auto_338680 ) ) ( not ( = ?auto_338679 ?auto_338681 ) ) ( not ( = ?auto_338680 ?auto_338681 ) ) ( ON ?auto_338679 ?auto_338680 ) ( ON ?auto_338678 ?auto_338679 ) ( ON ?auto_338677 ?auto_338678 ) ( ON ?auto_338676 ?auto_338677 ) ( CLEAR ?auto_338674 ) ( ON ?auto_338675 ?auto_338676 ) ( CLEAR ?auto_338675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_338667 ?auto_338668 ?auto_338669 ?auto_338670 ?auto_338671 ?auto_338672 ?auto_338673 ?auto_338674 ?auto_338675 )
      ( MAKE-14PILE ?auto_338667 ?auto_338668 ?auto_338669 ?auto_338670 ?auto_338671 ?auto_338672 ?auto_338673 ?auto_338674 ?auto_338675 ?auto_338676 ?auto_338677 ?auto_338678 ?auto_338679 ?auto_338680 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338696 - BLOCK
      ?auto_338697 - BLOCK
      ?auto_338698 - BLOCK
      ?auto_338699 - BLOCK
      ?auto_338700 - BLOCK
      ?auto_338701 - BLOCK
      ?auto_338702 - BLOCK
      ?auto_338703 - BLOCK
      ?auto_338704 - BLOCK
      ?auto_338705 - BLOCK
      ?auto_338706 - BLOCK
      ?auto_338707 - BLOCK
      ?auto_338708 - BLOCK
      ?auto_338709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338709 ) ( ON-TABLE ?auto_338696 ) ( ON ?auto_338697 ?auto_338696 ) ( ON ?auto_338698 ?auto_338697 ) ( ON ?auto_338699 ?auto_338698 ) ( ON ?auto_338700 ?auto_338699 ) ( ON ?auto_338701 ?auto_338700 ) ( ON ?auto_338702 ?auto_338701 ) ( ON ?auto_338703 ?auto_338702 ) ( not ( = ?auto_338696 ?auto_338697 ) ) ( not ( = ?auto_338696 ?auto_338698 ) ) ( not ( = ?auto_338696 ?auto_338699 ) ) ( not ( = ?auto_338696 ?auto_338700 ) ) ( not ( = ?auto_338696 ?auto_338701 ) ) ( not ( = ?auto_338696 ?auto_338702 ) ) ( not ( = ?auto_338696 ?auto_338703 ) ) ( not ( = ?auto_338696 ?auto_338704 ) ) ( not ( = ?auto_338696 ?auto_338705 ) ) ( not ( = ?auto_338696 ?auto_338706 ) ) ( not ( = ?auto_338696 ?auto_338707 ) ) ( not ( = ?auto_338696 ?auto_338708 ) ) ( not ( = ?auto_338696 ?auto_338709 ) ) ( not ( = ?auto_338697 ?auto_338698 ) ) ( not ( = ?auto_338697 ?auto_338699 ) ) ( not ( = ?auto_338697 ?auto_338700 ) ) ( not ( = ?auto_338697 ?auto_338701 ) ) ( not ( = ?auto_338697 ?auto_338702 ) ) ( not ( = ?auto_338697 ?auto_338703 ) ) ( not ( = ?auto_338697 ?auto_338704 ) ) ( not ( = ?auto_338697 ?auto_338705 ) ) ( not ( = ?auto_338697 ?auto_338706 ) ) ( not ( = ?auto_338697 ?auto_338707 ) ) ( not ( = ?auto_338697 ?auto_338708 ) ) ( not ( = ?auto_338697 ?auto_338709 ) ) ( not ( = ?auto_338698 ?auto_338699 ) ) ( not ( = ?auto_338698 ?auto_338700 ) ) ( not ( = ?auto_338698 ?auto_338701 ) ) ( not ( = ?auto_338698 ?auto_338702 ) ) ( not ( = ?auto_338698 ?auto_338703 ) ) ( not ( = ?auto_338698 ?auto_338704 ) ) ( not ( = ?auto_338698 ?auto_338705 ) ) ( not ( = ?auto_338698 ?auto_338706 ) ) ( not ( = ?auto_338698 ?auto_338707 ) ) ( not ( = ?auto_338698 ?auto_338708 ) ) ( not ( = ?auto_338698 ?auto_338709 ) ) ( not ( = ?auto_338699 ?auto_338700 ) ) ( not ( = ?auto_338699 ?auto_338701 ) ) ( not ( = ?auto_338699 ?auto_338702 ) ) ( not ( = ?auto_338699 ?auto_338703 ) ) ( not ( = ?auto_338699 ?auto_338704 ) ) ( not ( = ?auto_338699 ?auto_338705 ) ) ( not ( = ?auto_338699 ?auto_338706 ) ) ( not ( = ?auto_338699 ?auto_338707 ) ) ( not ( = ?auto_338699 ?auto_338708 ) ) ( not ( = ?auto_338699 ?auto_338709 ) ) ( not ( = ?auto_338700 ?auto_338701 ) ) ( not ( = ?auto_338700 ?auto_338702 ) ) ( not ( = ?auto_338700 ?auto_338703 ) ) ( not ( = ?auto_338700 ?auto_338704 ) ) ( not ( = ?auto_338700 ?auto_338705 ) ) ( not ( = ?auto_338700 ?auto_338706 ) ) ( not ( = ?auto_338700 ?auto_338707 ) ) ( not ( = ?auto_338700 ?auto_338708 ) ) ( not ( = ?auto_338700 ?auto_338709 ) ) ( not ( = ?auto_338701 ?auto_338702 ) ) ( not ( = ?auto_338701 ?auto_338703 ) ) ( not ( = ?auto_338701 ?auto_338704 ) ) ( not ( = ?auto_338701 ?auto_338705 ) ) ( not ( = ?auto_338701 ?auto_338706 ) ) ( not ( = ?auto_338701 ?auto_338707 ) ) ( not ( = ?auto_338701 ?auto_338708 ) ) ( not ( = ?auto_338701 ?auto_338709 ) ) ( not ( = ?auto_338702 ?auto_338703 ) ) ( not ( = ?auto_338702 ?auto_338704 ) ) ( not ( = ?auto_338702 ?auto_338705 ) ) ( not ( = ?auto_338702 ?auto_338706 ) ) ( not ( = ?auto_338702 ?auto_338707 ) ) ( not ( = ?auto_338702 ?auto_338708 ) ) ( not ( = ?auto_338702 ?auto_338709 ) ) ( not ( = ?auto_338703 ?auto_338704 ) ) ( not ( = ?auto_338703 ?auto_338705 ) ) ( not ( = ?auto_338703 ?auto_338706 ) ) ( not ( = ?auto_338703 ?auto_338707 ) ) ( not ( = ?auto_338703 ?auto_338708 ) ) ( not ( = ?auto_338703 ?auto_338709 ) ) ( not ( = ?auto_338704 ?auto_338705 ) ) ( not ( = ?auto_338704 ?auto_338706 ) ) ( not ( = ?auto_338704 ?auto_338707 ) ) ( not ( = ?auto_338704 ?auto_338708 ) ) ( not ( = ?auto_338704 ?auto_338709 ) ) ( not ( = ?auto_338705 ?auto_338706 ) ) ( not ( = ?auto_338705 ?auto_338707 ) ) ( not ( = ?auto_338705 ?auto_338708 ) ) ( not ( = ?auto_338705 ?auto_338709 ) ) ( not ( = ?auto_338706 ?auto_338707 ) ) ( not ( = ?auto_338706 ?auto_338708 ) ) ( not ( = ?auto_338706 ?auto_338709 ) ) ( not ( = ?auto_338707 ?auto_338708 ) ) ( not ( = ?auto_338707 ?auto_338709 ) ) ( not ( = ?auto_338708 ?auto_338709 ) ) ( ON ?auto_338708 ?auto_338709 ) ( ON ?auto_338707 ?auto_338708 ) ( ON ?auto_338706 ?auto_338707 ) ( ON ?auto_338705 ?auto_338706 ) ( CLEAR ?auto_338703 ) ( ON ?auto_338704 ?auto_338705 ) ( CLEAR ?auto_338704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_338696 ?auto_338697 ?auto_338698 ?auto_338699 ?auto_338700 ?auto_338701 ?auto_338702 ?auto_338703 ?auto_338704 )
      ( MAKE-14PILE ?auto_338696 ?auto_338697 ?auto_338698 ?auto_338699 ?auto_338700 ?auto_338701 ?auto_338702 ?auto_338703 ?auto_338704 ?auto_338705 ?auto_338706 ?auto_338707 ?auto_338708 ?auto_338709 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338724 - BLOCK
      ?auto_338725 - BLOCK
      ?auto_338726 - BLOCK
      ?auto_338727 - BLOCK
      ?auto_338728 - BLOCK
      ?auto_338729 - BLOCK
      ?auto_338730 - BLOCK
      ?auto_338731 - BLOCK
      ?auto_338732 - BLOCK
      ?auto_338733 - BLOCK
      ?auto_338734 - BLOCK
      ?auto_338735 - BLOCK
      ?auto_338736 - BLOCK
      ?auto_338737 - BLOCK
    )
    :vars
    (
      ?auto_338738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338737 ?auto_338738 ) ( ON-TABLE ?auto_338724 ) ( ON ?auto_338725 ?auto_338724 ) ( ON ?auto_338726 ?auto_338725 ) ( ON ?auto_338727 ?auto_338726 ) ( ON ?auto_338728 ?auto_338727 ) ( ON ?auto_338729 ?auto_338728 ) ( ON ?auto_338730 ?auto_338729 ) ( not ( = ?auto_338724 ?auto_338725 ) ) ( not ( = ?auto_338724 ?auto_338726 ) ) ( not ( = ?auto_338724 ?auto_338727 ) ) ( not ( = ?auto_338724 ?auto_338728 ) ) ( not ( = ?auto_338724 ?auto_338729 ) ) ( not ( = ?auto_338724 ?auto_338730 ) ) ( not ( = ?auto_338724 ?auto_338731 ) ) ( not ( = ?auto_338724 ?auto_338732 ) ) ( not ( = ?auto_338724 ?auto_338733 ) ) ( not ( = ?auto_338724 ?auto_338734 ) ) ( not ( = ?auto_338724 ?auto_338735 ) ) ( not ( = ?auto_338724 ?auto_338736 ) ) ( not ( = ?auto_338724 ?auto_338737 ) ) ( not ( = ?auto_338724 ?auto_338738 ) ) ( not ( = ?auto_338725 ?auto_338726 ) ) ( not ( = ?auto_338725 ?auto_338727 ) ) ( not ( = ?auto_338725 ?auto_338728 ) ) ( not ( = ?auto_338725 ?auto_338729 ) ) ( not ( = ?auto_338725 ?auto_338730 ) ) ( not ( = ?auto_338725 ?auto_338731 ) ) ( not ( = ?auto_338725 ?auto_338732 ) ) ( not ( = ?auto_338725 ?auto_338733 ) ) ( not ( = ?auto_338725 ?auto_338734 ) ) ( not ( = ?auto_338725 ?auto_338735 ) ) ( not ( = ?auto_338725 ?auto_338736 ) ) ( not ( = ?auto_338725 ?auto_338737 ) ) ( not ( = ?auto_338725 ?auto_338738 ) ) ( not ( = ?auto_338726 ?auto_338727 ) ) ( not ( = ?auto_338726 ?auto_338728 ) ) ( not ( = ?auto_338726 ?auto_338729 ) ) ( not ( = ?auto_338726 ?auto_338730 ) ) ( not ( = ?auto_338726 ?auto_338731 ) ) ( not ( = ?auto_338726 ?auto_338732 ) ) ( not ( = ?auto_338726 ?auto_338733 ) ) ( not ( = ?auto_338726 ?auto_338734 ) ) ( not ( = ?auto_338726 ?auto_338735 ) ) ( not ( = ?auto_338726 ?auto_338736 ) ) ( not ( = ?auto_338726 ?auto_338737 ) ) ( not ( = ?auto_338726 ?auto_338738 ) ) ( not ( = ?auto_338727 ?auto_338728 ) ) ( not ( = ?auto_338727 ?auto_338729 ) ) ( not ( = ?auto_338727 ?auto_338730 ) ) ( not ( = ?auto_338727 ?auto_338731 ) ) ( not ( = ?auto_338727 ?auto_338732 ) ) ( not ( = ?auto_338727 ?auto_338733 ) ) ( not ( = ?auto_338727 ?auto_338734 ) ) ( not ( = ?auto_338727 ?auto_338735 ) ) ( not ( = ?auto_338727 ?auto_338736 ) ) ( not ( = ?auto_338727 ?auto_338737 ) ) ( not ( = ?auto_338727 ?auto_338738 ) ) ( not ( = ?auto_338728 ?auto_338729 ) ) ( not ( = ?auto_338728 ?auto_338730 ) ) ( not ( = ?auto_338728 ?auto_338731 ) ) ( not ( = ?auto_338728 ?auto_338732 ) ) ( not ( = ?auto_338728 ?auto_338733 ) ) ( not ( = ?auto_338728 ?auto_338734 ) ) ( not ( = ?auto_338728 ?auto_338735 ) ) ( not ( = ?auto_338728 ?auto_338736 ) ) ( not ( = ?auto_338728 ?auto_338737 ) ) ( not ( = ?auto_338728 ?auto_338738 ) ) ( not ( = ?auto_338729 ?auto_338730 ) ) ( not ( = ?auto_338729 ?auto_338731 ) ) ( not ( = ?auto_338729 ?auto_338732 ) ) ( not ( = ?auto_338729 ?auto_338733 ) ) ( not ( = ?auto_338729 ?auto_338734 ) ) ( not ( = ?auto_338729 ?auto_338735 ) ) ( not ( = ?auto_338729 ?auto_338736 ) ) ( not ( = ?auto_338729 ?auto_338737 ) ) ( not ( = ?auto_338729 ?auto_338738 ) ) ( not ( = ?auto_338730 ?auto_338731 ) ) ( not ( = ?auto_338730 ?auto_338732 ) ) ( not ( = ?auto_338730 ?auto_338733 ) ) ( not ( = ?auto_338730 ?auto_338734 ) ) ( not ( = ?auto_338730 ?auto_338735 ) ) ( not ( = ?auto_338730 ?auto_338736 ) ) ( not ( = ?auto_338730 ?auto_338737 ) ) ( not ( = ?auto_338730 ?auto_338738 ) ) ( not ( = ?auto_338731 ?auto_338732 ) ) ( not ( = ?auto_338731 ?auto_338733 ) ) ( not ( = ?auto_338731 ?auto_338734 ) ) ( not ( = ?auto_338731 ?auto_338735 ) ) ( not ( = ?auto_338731 ?auto_338736 ) ) ( not ( = ?auto_338731 ?auto_338737 ) ) ( not ( = ?auto_338731 ?auto_338738 ) ) ( not ( = ?auto_338732 ?auto_338733 ) ) ( not ( = ?auto_338732 ?auto_338734 ) ) ( not ( = ?auto_338732 ?auto_338735 ) ) ( not ( = ?auto_338732 ?auto_338736 ) ) ( not ( = ?auto_338732 ?auto_338737 ) ) ( not ( = ?auto_338732 ?auto_338738 ) ) ( not ( = ?auto_338733 ?auto_338734 ) ) ( not ( = ?auto_338733 ?auto_338735 ) ) ( not ( = ?auto_338733 ?auto_338736 ) ) ( not ( = ?auto_338733 ?auto_338737 ) ) ( not ( = ?auto_338733 ?auto_338738 ) ) ( not ( = ?auto_338734 ?auto_338735 ) ) ( not ( = ?auto_338734 ?auto_338736 ) ) ( not ( = ?auto_338734 ?auto_338737 ) ) ( not ( = ?auto_338734 ?auto_338738 ) ) ( not ( = ?auto_338735 ?auto_338736 ) ) ( not ( = ?auto_338735 ?auto_338737 ) ) ( not ( = ?auto_338735 ?auto_338738 ) ) ( not ( = ?auto_338736 ?auto_338737 ) ) ( not ( = ?auto_338736 ?auto_338738 ) ) ( not ( = ?auto_338737 ?auto_338738 ) ) ( ON ?auto_338736 ?auto_338737 ) ( ON ?auto_338735 ?auto_338736 ) ( ON ?auto_338734 ?auto_338735 ) ( ON ?auto_338733 ?auto_338734 ) ( ON ?auto_338732 ?auto_338733 ) ( CLEAR ?auto_338730 ) ( ON ?auto_338731 ?auto_338732 ) ( CLEAR ?auto_338731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_338724 ?auto_338725 ?auto_338726 ?auto_338727 ?auto_338728 ?auto_338729 ?auto_338730 ?auto_338731 )
      ( MAKE-14PILE ?auto_338724 ?auto_338725 ?auto_338726 ?auto_338727 ?auto_338728 ?auto_338729 ?auto_338730 ?auto_338731 ?auto_338732 ?auto_338733 ?auto_338734 ?auto_338735 ?auto_338736 ?auto_338737 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338753 - BLOCK
      ?auto_338754 - BLOCK
      ?auto_338755 - BLOCK
      ?auto_338756 - BLOCK
      ?auto_338757 - BLOCK
      ?auto_338758 - BLOCK
      ?auto_338759 - BLOCK
      ?auto_338760 - BLOCK
      ?auto_338761 - BLOCK
      ?auto_338762 - BLOCK
      ?auto_338763 - BLOCK
      ?auto_338764 - BLOCK
      ?auto_338765 - BLOCK
      ?auto_338766 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338766 ) ( ON-TABLE ?auto_338753 ) ( ON ?auto_338754 ?auto_338753 ) ( ON ?auto_338755 ?auto_338754 ) ( ON ?auto_338756 ?auto_338755 ) ( ON ?auto_338757 ?auto_338756 ) ( ON ?auto_338758 ?auto_338757 ) ( ON ?auto_338759 ?auto_338758 ) ( not ( = ?auto_338753 ?auto_338754 ) ) ( not ( = ?auto_338753 ?auto_338755 ) ) ( not ( = ?auto_338753 ?auto_338756 ) ) ( not ( = ?auto_338753 ?auto_338757 ) ) ( not ( = ?auto_338753 ?auto_338758 ) ) ( not ( = ?auto_338753 ?auto_338759 ) ) ( not ( = ?auto_338753 ?auto_338760 ) ) ( not ( = ?auto_338753 ?auto_338761 ) ) ( not ( = ?auto_338753 ?auto_338762 ) ) ( not ( = ?auto_338753 ?auto_338763 ) ) ( not ( = ?auto_338753 ?auto_338764 ) ) ( not ( = ?auto_338753 ?auto_338765 ) ) ( not ( = ?auto_338753 ?auto_338766 ) ) ( not ( = ?auto_338754 ?auto_338755 ) ) ( not ( = ?auto_338754 ?auto_338756 ) ) ( not ( = ?auto_338754 ?auto_338757 ) ) ( not ( = ?auto_338754 ?auto_338758 ) ) ( not ( = ?auto_338754 ?auto_338759 ) ) ( not ( = ?auto_338754 ?auto_338760 ) ) ( not ( = ?auto_338754 ?auto_338761 ) ) ( not ( = ?auto_338754 ?auto_338762 ) ) ( not ( = ?auto_338754 ?auto_338763 ) ) ( not ( = ?auto_338754 ?auto_338764 ) ) ( not ( = ?auto_338754 ?auto_338765 ) ) ( not ( = ?auto_338754 ?auto_338766 ) ) ( not ( = ?auto_338755 ?auto_338756 ) ) ( not ( = ?auto_338755 ?auto_338757 ) ) ( not ( = ?auto_338755 ?auto_338758 ) ) ( not ( = ?auto_338755 ?auto_338759 ) ) ( not ( = ?auto_338755 ?auto_338760 ) ) ( not ( = ?auto_338755 ?auto_338761 ) ) ( not ( = ?auto_338755 ?auto_338762 ) ) ( not ( = ?auto_338755 ?auto_338763 ) ) ( not ( = ?auto_338755 ?auto_338764 ) ) ( not ( = ?auto_338755 ?auto_338765 ) ) ( not ( = ?auto_338755 ?auto_338766 ) ) ( not ( = ?auto_338756 ?auto_338757 ) ) ( not ( = ?auto_338756 ?auto_338758 ) ) ( not ( = ?auto_338756 ?auto_338759 ) ) ( not ( = ?auto_338756 ?auto_338760 ) ) ( not ( = ?auto_338756 ?auto_338761 ) ) ( not ( = ?auto_338756 ?auto_338762 ) ) ( not ( = ?auto_338756 ?auto_338763 ) ) ( not ( = ?auto_338756 ?auto_338764 ) ) ( not ( = ?auto_338756 ?auto_338765 ) ) ( not ( = ?auto_338756 ?auto_338766 ) ) ( not ( = ?auto_338757 ?auto_338758 ) ) ( not ( = ?auto_338757 ?auto_338759 ) ) ( not ( = ?auto_338757 ?auto_338760 ) ) ( not ( = ?auto_338757 ?auto_338761 ) ) ( not ( = ?auto_338757 ?auto_338762 ) ) ( not ( = ?auto_338757 ?auto_338763 ) ) ( not ( = ?auto_338757 ?auto_338764 ) ) ( not ( = ?auto_338757 ?auto_338765 ) ) ( not ( = ?auto_338757 ?auto_338766 ) ) ( not ( = ?auto_338758 ?auto_338759 ) ) ( not ( = ?auto_338758 ?auto_338760 ) ) ( not ( = ?auto_338758 ?auto_338761 ) ) ( not ( = ?auto_338758 ?auto_338762 ) ) ( not ( = ?auto_338758 ?auto_338763 ) ) ( not ( = ?auto_338758 ?auto_338764 ) ) ( not ( = ?auto_338758 ?auto_338765 ) ) ( not ( = ?auto_338758 ?auto_338766 ) ) ( not ( = ?auto_338759 ?auto_338760 ) ) ( not ( = ?auto_338759 ?auto_338761 ) ) ( not ( = ?auto_338759 ?auto_338762 ) ) ( not ( = ?auto_338759 ?auto_338763 ) ) ( not ( = ?auto_338759 ?auto_338764 ) ) ( not ( = ?auto_338759 ?auto_338765 ) ) ( not ( = ?auto_338759 ?auto_338766 ) ) ( not ( = ?auto_338760 ?auto_338761 ) ) ( not ( = ?auto_338760 ?auto_338762 ) ) ( not ( = ?auto_338760 ?auto_338763 ) ) ( not ( = ?auto_338760 ?auto_338764 ) ) ( not ( = ?auto_338760 ?auto_338765 ) ) ( not ( = ?auto_338760 ?auto_338766 ) ) ( not ( = ?auto_338761 ?auto_338762 ) ) ( not ( = ?auto_338761 ?auto_338763 ) ) ( not ( = ?auto_338761 ?auto_338764 ) ) ( not ( = ?auto_338761 ?auto_338765 ) ) ( not ( = ?auto_338761 ?auto_338766 ) ) ( not ( = ?auto_338762 ?auto_338763 ) ) ( not ( = ?auto_338762 ?auto_338764 ) ) ( not ( = ?auto_338762 ?auto_338765 ) ) ( not ( = ?auto_338762 ?auto_338766 ) ) ( not ( = ?auto_338763 ?auto_338764 ) ) ( not ( = ?auto_338763 ?auto_338765 ) ) ( not ( = ?auto_338763 ?auto_338766 ) ) ( not ( = ?auto_338764 ?auto_338765 ) ) ( not ( = ?auto_338764 ?auto_338766 ) ) ( not ( = ?auto_338765 ?auto_338766 ) ) ( ON ?auto_338765 ?auto_338766 ) ( ON ?auto_338764 ?auto_338765 ) ( ON ?auto_338763 ?auto_338764 ) ( ON ?auto_338762 ?auto_338763 ) ( ON ?auto_338761 ?auto_338762 ) ( CLEAR ?auto_338759 ) ( ON ?auto_338760 ?auto_338761 ) ( CLEAR ?auto_338760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_338753 ?auto_338754 ?auto_338755 ?auto_338756 ?auto_338757 ?auto_338758 ?auto_338759 ?auto_338760 )
      ( MAKE-14PILE ?auto_338753 ?auto_338754 ?auto_338755 ?auto_338756 ?auto_338757 ?auto_338758 ?auto_338759 ?auto_338760 ?auto_338761 ?auto_338762 ?auto_338763 ?auto_338764 ?auto_338765 ?auto_338766 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338781 - BLOCK
      ?auto_338782 - BLOCK
      ?auto_338783 - BLOCK
      ?auto_338784 - BLOCK
      ?auto_338785 - BLOCK
      ?auto_338786 - BLOCK
      ?auto_338787 - BLOCK
      ?auto_338788 - BLOCK
      ?auto_338789 - BLOCK
      ?auto_338790 - BLOCK
      ?auto_338791 - BLOCK
      ?auto_338792 - BLOCK
      ?auto_338793 - BLOCK
      ?auto_338794 - BLOCK
    )
    :vars
    (
      ?auto_338795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338794 ?auto_338795 ) ( ON-TABLE ?auto_338781 ) ( ON ?auto_338782 ?auto_338781 ) ( ON ?auto_338783 ?auto_338782 ) ( ON ?auto_338784 ?auto_338783 ) ( ON ?auto_338785 ?auto_338784 ) ( ON ?auto_338786 ?auto_338785 ) ( not ( = ?auto_338781 ?auto_338782 ) ) ( not ( = ?auto_338781 ?auto_338783 ) ) ( not ( = ?auto_338781 ?auto_338784 ) ) ( not ( = ?auto_338781 ?auto_338785 ) ) ( not ( = ?auto_338781 ?auto_338786 ) ) ( not ( = ?auto_338781 ?auto_338787 ) ) ( not ( = ?auto_338781 ?auto_338788 ) ) ( not ( = ?auto_338781 ?auto_338789 ) ) ( not ( = ?auto_338781 ?auto_338790 ) ) ( not ( = ?auto_338781 ?auto_338791 ) ) ( not ( = ?auto_338781 ?auto_338792 ) ) ( not ( = ?auto_338781 ?auto_338793 ) ) ( not ( = ?auto_338781 ?auto_338794 ) ) ( not ( = ?auto_338781 ?auto_338795 ) ) ( not ( = ?auto_338782 ?auto_338783 ) ) ( not ( = ?auto_338782 ?auto_338784 ) ) ( not ( = ?auto_338782 ?auto_338785 ) ) ( not ( = ?auto_338782 ?auto_338786 ) ) ( not ( = ?auto_338782 ?auto_338787 ) ) ( not ( = ?auto_338782 ?auto_338788 ) ) ( not ( = ?auto_338782 ?auto_338789 ) ) ( not ( = ?auto_338782 ?auto_338790 ) ) ( not ( = ?auto_338782 ?auto_338791 ) ) ( not ( = ?auto_338782 ?auto_338792 ) ) ( not ( = ?auto_338782 ?auto_338793 ) ) ( not ( = ?auto_338782 ?auto_338794 ) ) ( not ( = ?auto_338782 ?auto_338795 ) ) ( not ( = ?auto_338783 ?auto_338784 ) ) ( not ( = ?auto_338783 ?auto_338785 ) ) ( not ( = ?auto_338783 ?auto_338786 ) ) ( not ( = ?auto_338783 ?auto_338787 ) ) ( not ( = ?auto_338783 ?auto_338788 ) ) ( not ( = ?auto_338783 ?auto_338789 ) ) ( not ( = ?auto_338783 ?auto_338790 ) ) ( not ( = ?auto_338783 ?auto_338791 ) ) ( not ( = ?auto_338783 ?auto_338792 ) ) ( not ( = ?auto_338783 ?auto_338793 ) ) ( not ( = ?auto_338783 ?auto_338794 ) ) ( not ( = ?auto_338783 ?auto_338795 ) ) ( not ( = ?auto_338784 ?auto_338785 ) ) ( not ( = ?auto_338784 ?auto_338786 ) ) ( not ( = ?auto_338784 ?auto_338787 ) ) ( not ( = ?auto_338784 ?auto_338788 ) ) ( not ( = ?auto_338784 ?auto_338789 ) ) ( not ( = ?auto_338784 ?auto_338790 ) ) ( not ( = ?auto_338784 ?auto_338791 ) ) ( not ( = ?auto_338784 ?auto_338792 ) ) ( not ( = ?auto_338784 ?auto_338793 ) ) ( not ( = ?auto_338784 ?auto_338794 ) ) ( not ( = ?auto_338784 ?auto_338795 ) ) ( not ( = ?auto_338785 ?auto_338786 ) ) ( not ( = ?auto_338785 ?auto_338787 ) ) ( not ( = ?auto_338785 ?auto_338788 ) ) ( not ( = ?auto_338785 ?auto_338789 ) ) ( not ( = ?auto_338785 ?auto_338790 ) ) ( not ( = ?auto_338785 ?auto_338791 ) ) ( not ( = ?auto_338785 ?auto_338792 ) ) ( not ( = ?auto_338785 ?auto_338793 ) ) ( not ( = ?auto_338785 ?auto_338794 ) ) ( not ( = ?auto_338785 ?auto_338795 ) ) ( not ( = ?auto_338786 ?auto_338787 ) ) ( not ( = ?auto_338786 ?auto_338788 ) ) ( not ( = ?auto_338786 ?auto_338789 ) ) ( not ( = ?auto_338786 ?auto_338790 ) ) ( not ( = ?auto_338786 ?auto_338791 ) ) ( not ( = ?auto_338786 ?auto_338792 ) ) ( not ( = ?auto_338786 ?auto_338793 ) ) ( not ( = ?auto_338786 ?auto_338794 ) ) ( not ( = ?auto_338786 ?auto_338795 ) ) ( not ( = ?auto_338787 ?auto_338788 ) ) ( not ( = ?auto_338787 ?auto_338789 ) ) ( not ( = ?auto_338787 ?auto_338790 ) ) ( not ( = ?auto_338787 ?auto_338791 ) ) ( not ( = ?auto_338787 ?auto_338792 ) ) ( not ( = ?auto_338787 ?auto_338793 ) ) ( not ( = ?auto_338787 ?auto_338794 ) ) ( not ( = ?auto_338787 ?auto_338795 ) ) ( not ( = ?auto_338788 ?auto_338789 ) ) ( not ( = ?auto_338788 ?auto_338790 ) ) ( not ( = ?auto_338788 ?auto_338791 ) ) ( not ( = ?auto_338788 ?auto_338792 ) ) ( not ( = ?auto_338788 ?auto_338793 ) ) ( not ( = ?auto_338788 ?auto_338794 ) ) ( not ( = ?auto_338788 ?auto_338795 ) ) ( not ( = ?auto_338789 ?auto_338790 ) ) ( not ( = ?auto_338789 ?auto_338791 ) ) ( not ( = ?auto_338789 ?auto_338792 ) ) ( not ( = ?auto_338789 ?auto_338793 ) ) ( not ( = ?auto_338789 ?auto_338794 ) ) ( not ( = ?auto_338789 ?auto_338795 ) ) ( not ( = ?auto_338790 ?auto_338791 ) ) ( not ( = ?auto_338790 ?auto_338792 ) ) ( not ( = ?auto_338790 ?auto_338793 ) ) ( not ( = ?auto_338790 ?auto_338794 ) ) ( not ( = ?auto_338790 ?auto_338795 ) ) ( not ( = ?auto_338791 ?auto_338792 ) ) ( not ( = ?auto_338791 ?auto_338793 ) ) ( not ( = ?auto_338791 ?auto_338794 ) ) ( not ( = ?auto_338791 ?auto_338795 ) ) ( not ( = ?auto_338792 ?auto_338793 ) ) ( not ( = ?auto_338792 ?auto_338794 ) ) ( not ( = ?auto_338792 ?auto_338795 ) ) ( not ( = ?auto_338793 ?auto_338794 ) ) ( not ( = ?auto_338793 ?auto_338795 ) ) ( not ( = ?auto_338794 ?auto_338795 ) ) ( ON ?auto_338793 ?auto_338794 ) ( ON ?auto_338792 ?auto_338793 ) ( ON ?auto_338791 ?auto_338792 ) ( ON ?auto_338790 ?auto_338791 ) ( ON ?auto_338789 ?auto_338790 ) ( ON ?auto_338788 ?auto_338789 ) ( CLEAR ?auto_338786 ) ( ON ?auto_338787 ?auto_338788 ) ( CLEAR ?auto_338787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_338781 ?auto_338782 ?auto_338783 ?auto_338784 ?auto_338785 ?auto_338786 ?auto_338787 )
      ( MAKE-14PILE ?auto_338781 ?auto_338782 ?auto_338783 ?auto_338784 ?auto_338785 ?auto_338786 ?auto_338787 ?auto_338788 ?auto_338789 ?auto_338790 ?auto_338791 ?auto_338792 ?auto_338793 ?auto_338794 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338810 - BLOCK
      ?auto_338811 - BLOCK
      ?auto_338812 - BLOCK
      ?auto_338813 - BLOCK
      ?auto_338814 - BLOCK
      ?auto_338815 - BLOCK
      ?auto_338816 - BLOCK
      ?auto_338817 - BLOCK
      ?auto_338818 - BLOCK
      ?auto_338819 - BLOCK
      ?auto_338820 - BLOCK
      ?auto_338821 - BLOCK
      ?auto_338822 - BLOCK
      ?auto_338823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338823 ) ( ON-TABLE ?auto_338810 ) ( ON ?auto_338811 ?auto_338810 ) ( ON ?auto_338812 ?auto_338811 ) ( ON ?auto_338813 ?auto_338812 ) ( ON ?auto_338814 ?auto_338813 ) ( ON ?auto_338815 ?auto_338814 ) ( not ( = ?auto_338810 ?auto_338811 ) ) ( not ( = ?auto_338810 ?auto_338812 ) ) ( not ( = ?auto_338810 ?auto_338813 ) ) ( not ( = ?auto_338810 ?auto_338814 ) ) ( not ( = ?auto_338810 ?auto_338815 ) ) ( not ( = ?auto_338810 ?auto_338816 ) ) ( not ( = ?auto_338810 ?auto_338817 ) ) ( not ( = ?auto_338810 ?auto_338818 ) ) ( not ( = ?auto_338810 ?auto_338819 ) ) ( not ( = ?auto_338810 ?auto_338820 ) ) ( not ( = ?auto_338810 ?auto_338821 ) ) ( not ( = ?auto_338810 ?auto_338822 ) ) ( not ( = ?auto_338810 ?auto_338823 ) ) ( not ( = ?auto_338811 ?auto_338812 ) ) ( not ( = ?auto_338811 ?auto_338813 ) ) ( not ( = ?auto_338811 ?auto_338814 ) ) ( not ( = ?auto_338811 ?auto_338815 ) ) ( not ( = ?auto_338811 ?auto_338816 ) ) ( not ( = ?auto_338811 ?auto_338817 ) ) ( not ( = ?auto_338811 ?auto_338818 ) ) ( not ( = ?auto_338811 ?auto_338819 ) ) ( not ( = ?auto_338811 ?auto_338820 ) ) ( not ( = ?auto_338811 ?auto_338821 ) ) ( not ( = ?auto_338811 ?auto_338822 ) ) ( not ( = ?auto_338811 ?auto_338823 ) ) ( not ( = ?auto_338812 ?auto_338813 ) ) ( not ( = ?auto_338812 ?auto_338814 ) ) ( not ( = ?auto_338812 ?auto_338815 ) ) ( not ( = ?auto_338812 ?auto_338816 ) ) ( not ( = ?auto_338812 ?auto_338817 ) ) ( not ( = ?auto_338812 ?auto_338818 ) ) ( not ( = ?auto_338812 ?auto_338819 ) ) ( not ( = ?auto_338812 ?auto_338820 ) ) ( not ( = ?auto_338812 ?auto_338821 ) ) ( not ( = ?auto_338812 ?auto_338822 ) ) ( not ( = ?auto_338812 ?auto_338823 ) ) ( not ( = ?auto_338813 ?auto_338814 ) ) ( not ( = ?auto_338813 ?auto_338815 ) ) ( not ( = ?auto_338813 ?auto_338816 ) ) ( not ( = ?auto_338813 ?auto_338817 ) ) ( not ( = ?auto_338813 ?auto_338818 ) ) ( not ( = ?auto_338813 ?auto_338819 ) ) ( not ( = ?auto_338813 ?auto_338820 ) ) ( not ( = ?auto_338813 ?auto_338821 ) ) ( not ( = ?auto_338813 ?auto_338822 ) ) ( not ( = ?auto_338813 ?auto_338823 ) ) ( not ( = ?auto_338814 ?auto_338815 ) ) ( not ( = ?auto_338814 ?auto_338816 ) ) ( not ( = ?auto_338814 ?auto_338817 ) ) ( not ( = ?auto_338814 ?auto_338818 ) ) ( not ( = ?auto_338814 ?auto_338819 ) ) ( not ( = ?auto_338814 ?auto_338820 ) ) ( not ( = ?auto_338814 ?auto_338821 ) ) ( not ( = ?auto_338814 ?auto_338822 ) ) ( not ( = ?auto_338814 ?auto_338823 ) ) ( not ( = ?auto_338815 ?auto_338816 ) ) ( not ( = ?auto_338815 ?auto_338817 ) ) ( not ( = ?auto_338815 ?auto_338818 ) ) ( not ( = ?auto_338815 ?auto_338819 ) ) ( not ( = ?auto_338815 ?auto_338820 ) ) ( not ( = ?auto_338815 ?auto_338821 ) ) ( not ( = ?auto_338815 ?auto_338822 ) ) ( not ( = ?auto_338815 ?auto_338823 ) ) ( not ( = ?auto_338816 ?auto_338817 ) ) ( not ( = ?auto_338816 ?auto_338818 ) ) ( not ( = ?auto_338816 ?auto_338819 ) ) ( not ( = ?auto_338816 ?auto_338820 ) ) ( not ( = ?auto_338816 ?auto_338821 ) ) ( not ( = ?auto_338816 ?auto_338822 ) ) ( not ( = ?auto_338816 ?auto_338823 ) ) ( not ( = ?auto_338817 ?auto_338818 ) ) ( not ( = ?auto_338817 ?auto_338819 ) ) ( not ( = ?auto_338817 ?auto_338820 ) ) ( not ( = ?auto_338817 ?auto_338821 ) ) ( not ( = ?auto_338817 ?auto_338822 ) ) ( not ( = ?auto_338817 ?auto_338823 ) ) ( not ( = ?auto_338818 ?auto_338819 ) ) ( not ( = ?auto_338818 ?auto_338820 ) ) ( not ( = ?auto_338818 ?auto_338821 ) ) ( not ( = ?auto_338818 ?auto_338822 ) ) ( not ( = ?auto_338818 ?auto_338823 ) ) ( not ( = ?auto_338819 ?auto_338820 ) ) ( not ( = ?auto_338819 ?auto_338821 ) ) ( not ( = ?auto_338819 ?auto_338822 ) ) ( not ( = ?auto_338819 ?auto_338823 ) ) ( not ( = ?auto_338820 ?auto_338821 ) ) ( not ( = ?auto_338820 ?auto_338822 ) ) ( not ( = ?auto_338820 ?auto_338823 ) ) ( not ( = ?auto_338821 ?auto_338822 ) ) ( not ( = ?auto_338821 ?auto_338823 ) ) ( not ( = ?auto_338822 ?auto_338823 ) ) ( ON ?auto_338822 ?auto_338823 ) ( ON ?auto_338821 ?auto_338822 ) ( ON ?auto_338820 ?auto_338821 ) ( ON ?auto_338819 ?auto_338820 ) ( ON ?auto_338818 ?auto_338819 ) ( ON ?auto_338817 ?auto_338818 ) ( CLEAR ?auto_338815 ) ( ON ?auto_338816 ?auto_338817 ) ( CLEAR ?auto_338816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_338810 ?auto_338811 ?auto_338812 ?auto_338813 ?auto_338814 ?auto_338815 ?auto_338816 )
      ( MAKE-14PILE ?auto_338810 ?auto_338811 ?auto_338812 ?auto_338813 ?auto_338814 ?auto_338815 ?auto_338816 ?auto_338817 ?auto_338818 ?auto_338819 ?auto_338820 ?auto_338821 ?auto_338822 ?auto_338823 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338838 - BLOCK
      ?auto_338839 - BLOCK
      ?auto_338840 - BLOCK
      ?auto_338841 - BLOCK
      ?auto_338842 - BLOCK
      ?auto_338843 - BLOCK
      ?auto_338844 - BLOCK
      ?auto_338845 - BLOCK
      ?auto_338846 - BLOCK
      ?auto_338847 - BLOCK
      ?auto_338848 - BLOCK
      ?auto_338849 - BLOCK
      ?auto_338850 - BLOCK
      ?auto_338851 - BLOCK
    )
    :vars
    (
      ?auto_338852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338851 ?auto_338852 ) ( ON-TABLE ?auto_338838 ) ( ON ?auto_338839 ?auto_338838 ) ( ON ?auto_338840 ?auto_338839 ) ( ON ?auto_338841 ?auto_338840 ) ( ON ?auto_338842 ?auto_338841 ) ( not ( = ?auto_338838 ?auto_338839 ) ) ( not ( = ?auto_338838 ?auto_338840 ) ) ( not ( = ?auto_338838 ?auto_338841 ) ) ( not ( = ?auto_338838 ?auto_338842 ) ) ( not ( = ?auto_338838 ?auto_338843 ) ) ( not ( = ?auto_338838 ?auto_338844 ) ) ( not ( = ?auto_338838 ?auto_338845 ) ) ( not ( = ?auto_338838 ?auto_338846 ) ) ( not ( = ?auto_338838 ?auto_338847 ) ) ( not ( = ?auto_338838 ?auto_338848 ) ) ( not ( = ?auto_338838 ?auto_338849 ) ) ( not ( = ?auto_338838 ?auto_338850 ) ) ( not ( = ?auto_338838 ?auto_338851 ) ) ( not ( = ?auto_338838 ?auto_338852 ) ) ( not ( = ?auto_338839 ?auto_338840 ) ) ( not ( = ?auto_338839 ?auto_338841 ) ) ( not ( = ?auto_338839 ?auto_338842 ) ) ( not ( = ?auto_338839 ?auto_338843 ) ) ( not ( = ?auto_338839 ?auto_338844 ) ) ( not ( = ?auto_338839 ?auto_338845 ) ) ( not ( = ?auto_338839 ?auto_338846 ) ) ( not ( = ?auto_338839 ?auto_338847 ) ) ( not ( = ?auto_338839 ?auto_338848 ) ) ( not ( = ?auto_338839 ?auto_338849 ) ) ( not ( = ?auto_338839 ?auto_338850 ) ) ( not ( = ?auto_338839 ?auto_338851 ) ) ( not ( = ?auto_338839 ?auto_338852 ) ) ( not ( = ?auto_338840 ?auto_338841 ) ) ( not ( = ?auto_338840 ?auto_338842 ) ) ( not ( = ?auto_338840 ?auto_338843 ) ) ( not ( = ?auto_338840 ?auto_338844 ) ) ( not ( = ?auto_338840 ?auto_338845 ) ) ( not ( = ?auto_338840 ?auto_338846 ) ) ( not ( = ?auto_338840 ?auto_338847 ) ) ( not ( = ?auto_338840 ?auto_338848 ) ) ( not ( = ?auto_338840 ?auto_338849 ) ) ( not ( = ?auto_338840 ?auto_338850 ) ) ( not ( = ?auto_338840 ?auto_338851 ) ) ( not ( = ?auto_338840 ?auto_338852 ) ) ( not ( = ?auto_338841 ?auto_338842 ) ) ( not ( = ?auto_338841 ?auto_338843 ) ) ( not ( = ?auto_338841 ?auto_338844 ) ) ( not ( = ?auto_338841 ?auto_338845 ) ) ( not ( = ?auto_338841 ?auto_338846 ) ) ( not ( = ?auto_338841 ?auto_338847 ) ) ( not ( = ?auto_338841 ?auto_338848 ) ) ( not ( = ?auto_338841 ?auto_338849 ) ) ( not ( = ?auto_338841 ?auto_338850 ) ) ( not ( = ?auto_338841 ?auto_338851 ) ) ( not ( = ?auto_338841 ?auto_338852 ) ) ( not ( = ?auto_338842 ?auto_338843 ) ) ( not ( = ?auto_338842 ?auto_338844 ) ) ( not ( = ?auto_338842 ?auto_338845 ) ) ( not ( = ?auto_338842 ?auto_338846 ) ) ( not ( = ?auto_338842 ?auto_338847 ) ) ( not ( = ?auto_338842 ?auto_338848 ) ) ( not ( = ?auto_338842 ?auto_338849 ) ) ( not ( = ?auto_338842 ?auto_338850 ) ) ( not ( = ?auto_338842 ?auto_338851 ) ) ( not ( = ?auto_338842 ?auto_338852 ) ) ( not ( = ?auto_338843 ?auto_338844 ) ) ( not ( = ?auto_338843 ?auto_338845 ) ) ( not ( = ?auto_338843 ?auto_338846 ) ) ( not ( = ?auto_338843 ?auto_338847 ) ) ( not ( = ?auto_338843 ?auto_338848 ) ) ( not ( = ?auto_338843 ?auto_338849 ) ) ( not ( = ?auto_338843 ?auto_338850 ) ) ( not ( = ?auto_338843 ?auto_338851 ) ) ( not ( = ?auto_338843 ?auto_338852 ) ) ( not ( = ?auto_338844 ?auto_338845 ) ) ( not ( = ?auto_338844 ?auto_338846 ) ) ( not ( = ?auto_338844 ?auto_338847 ) ) ( not ( = ?auto_338844 ?auto_338848 ) ) ( not ( = ?auto_338844 ?auto_338849 ) ) ( not ( = ?auto_338844 ?auto_338850 ) ) ( not ( = ?auto_338844 ?auto_338851 ) ) ( not ( = ?auto_338844 ?auto_338852 ) ) ( not ( = ?auto_338845 ?auto_338846 ) ) ( not ( = ?auto_338845 ?auto_338847 ) ) ( not ( = ?auto_338845 ?auto_338848 ) ) ( not ( = ?auto_338845 ?auto_338849 ) ) ( not ( = ?auto_338845 ?auto_338850 ) ) ( not ( = ?auto_338845 ?auto_338851 ) ) ( not ( = ?auto_338845 ?auto_338852 ) ) ( not ( = ?auto_338846 ?auto_338847 ) ) ( not ( = ?auto_338846 ?auto_338848 ) ) ( not ( = ?auto_338846 ?auto_338849 ) ) ( not ( = ?auto_338846 ?auto_338850 ) ) ( not ( = ?auto_338846 ?auto_338851 ) ) ( not ( = ?auto_338846 ?auto_338852 ) ) ( not ( = ?auto_338847 ?auto_338848 ) ) ( not ( = ?auto_338847 ?auto_338849 ) ) ( not ( = ?auto_338847 ?auto_338850 ) ) ( not ( = ?auto_338847 ?auto_338851 ) ) ( not ( = ?auto_338847 ?auto_338852 ) ) ( not ( = ?auto_338848 ?auto_338849 ) ) ( not ( = ?auto_338848 ?auto_338850 ) ) ( not ( = ?auto_338848 ?auto_338851 ) ) ( not ( = ?auto_338848 ?auto_338852 ) ) ( not ( = ?auto_338849 ?auto_338850 ) ) ( not ( = ?auto_338849 ?auto_338851 ) ) ( not ( = ?auto_338849 ?auto_338852 ) ) ( not ( = ?auto_338850 ?auto_338851 ) ) ( not ( = ?auto_338850 ?auto_338852 ) ) ( not ( = ?auto_338851 ?auto_338852 ) ) ( ON ?auto_338850 ?auto_338851 ) ( ON ?auto_338849 ?auto_338850 ) ( ON ?auto_338848 ?auto_338849 ) ( ON ?auto_338847 ?auto_338848 ) ( ON ?auto_338846 ?auto_338847 ) ( ON ?auto_338845 ?auto_338846 ) ( ON ?auto_338844 ?auto_338845 ) ( CLEAR ?auto_338842 ) ( ON ?auto_338843 ?auto_338844 ) ( CLEAR ?auto_338843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_338838 ?auto_338839 ?auto_338840 ?auto_338841 ?auto_338842 ?auto_338843 )
      ( MAKE-14PILE ?auto_338838 ?auto_338839 ?auto_338840 ?auto_338841 ?auto_338842 ?auto_338843 ?auto_338844 ?auto_338845 ?auto_338846 ?auto_338847 ?auto_338848 ?auto_338849 ?auto_338850 ?auto_338851 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338867 - BLOCK
      ?auto_338868 - BLOCK
      ?auto_338869 - BLOCK
      ?auto_338870 - BLOCK
      ?auto_338871 - BLOCK
      ?auto_338872 - BLOCK
      ?auto_338873 - BLOCK
      ?auto_338874 - BLOCK
      ?auto_338875 - BLOCK
      ?auto_338876 - BLOCK
      ?auto_338877 - BLOCK
      ?auto_338878 - BLOCK
      ?auto_338879 - BLOCK
      ?auto_338880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338880 ) ( ON-TABLE ?auto_338867 ) ( ON ?auto_338868 ?auto_338867 ) ( ON ?auto_338869 ?auto_338868 ) ( ON ?auto_338870 ?auto_338869 ) ( ON ?auto_338871 ?auto_338870 ) ( not ( = ?auto_338867 ?auto_338868 ) ) ( not ( = ?auto_338867 ?auto_338869 ) ) ( not ( = ?auto_338867 ?auto_338870 ) ) ( not ( = ?auto_338867 ?auto_338871 ) ) ( not ( = ?auto_338867 ?auto_338872 ) ) ( not ( = ?auto_338867 ?auto_338873 ) ) ( not ( = ?auto_338867 ?auto_338874 ) ) ( not ( = ?auto_338867 ?auto_338875 ) ) ( not ( = ?auto_338867 ?auto_338876 ) ) ( not ( = ?auto_338867 ?auto_338877 ) ) ( not ( = ?auto_338867 ?auto_338878 ) ) ( not ( = ?auto_338867 ?auto_338879 ) ) ( not ( = ?auto_338867 ?auto_338880 ) ) ( not ( = ?auto_338868 ?auto_338869 ) ) ( not ( = ?auto_338868 ?auto_338870 ) ) ( not ( = ?auto_338868 ?auto_338871 ) ) ( not ( = ?auto_338868 ?auto_338872 ) ) ( not ( = ?auto_338868 ?auto_338873 ) ) ( not ( = ?auto_338868 ?auto_338874 ) ) ( not ( = ?auto_338868 ?auto_338875 ) ) ( not ( = ?auto_338868 ?auto_338876 ) ) ( not ( = ?auto_338868 ?auto_338877 ) ) ( not ( = ?auto_338868 ?auto_338878 ) ) ( not ( = ?auto_338868 ?auto_338879 ) ) ( not ( = ?auto_338868 ?auto_338880 ) ) ( not ( = ?auto_338869 ?auto_338870 ) ) ( not ( = ?auto_338869 ?auto_338871 ) ) ( not ( = ?auto_338869 ?auto_338872 ) ) ( not ( = ?auto_338869 ?auto_338873 ) ) ( not ( = ?auto_338869 ?auto_338874 ) ) ( not ( = ?auto_338869 ?auto_338875 ) ) ( not ( = ?auto_338869 ?auto_338876 ) ) ( not ( = ?auto_338869 ?auto_338877 ) ) ( not ( = ?auto_338869 ?auto_338878 ) ) ( not ( = ?auto_338869 ?auto_338879 ) ) ( not ( = ?auto_338869 ?auto_338880 ) ) ( not ( = ?auto_338870 ?auto_338871 ) ) ( not ( = ?auto_338870 ?auto_338872 ) ) ( not ( = ?auto_338870 ?auto_338873 ) ) ( not ( = ?auto_338870 ?auto_338874 ) ) ( not ( = ?auto_338870 ?auto_338875 ) ) ( not ( = ?auto_338870 ?auto_338876 ) ) ( not ( = ?auto_338870 ?auto_338877 ) ) ( not ( = ?auto_338870 ?auto_338878 ) ) ( not ( = ?auto_338870 ?auto_338879 ) ) ( not ( = ?auto_338870 ?auto_338880 ) ) ( not ( = ?auto_338871 ?auto_338872 ) ) ( not ( = ?auto_338871 ?auto_338873 ) ) ( not ( = ?auto_338871 ?auto_338874 ) ) ( not ( = ?auto_338871 ?auto_338875 ) ) ( not ( = ?auto_338871 ?auto_338876 ) ) ( not ( = ?auto_338871 ?auto_338877 ) ) ( not ( = ?auto_338871 ?auto_338878 ) ) ( not ( = ?auto_338871 ?auto_338879 ) ) ( not ( = ?auto_338871 ?auto_338880 ) ) ( not ( = ?auto_338872 ?auto_338873 ) ) ( not ( = ?auto_338872 ?auto_338874 ) ) ( not ( = ?auto_338872 ?auto_338875 ) ) ( not ( = ?auto_338872 ?auto_338876 ) ) ( not ( = ?auto_338872 ?auto_338877 ) ) ( not ( = ?auto_338872 ?auto_338878 ) ) ( not ( = ?auto_338872 ?auto_338879 ) ) ( not ( = ?auto_338872 ?auto_338880 ) ) ( not ( = ?auto_338873 ?auto_338874 ) ) ( not ( = ?auto_338873 ?auto_338875 ) ) ( not ( = ?auto_338873 ?auto_338876 ) ) ( not ( = ?auto_338873 ?auto_338877 ) ) ( not ( = ?auto_338873 ?auto_338878 ) ) ( not ( = ?auto_338873 ?auto_338879 ) ) ( not ( = ?auto_338873 ?auto_338880 ) ) ( not ( = ?auto_338874 ?auto_338875 ) ) ( not ( = ?auto_338874 ?auto_338876 ) ) ( not ( = ?auto_338874 ?auto_338877 ) ) ( not ( = ?auto_338874 ?auto_338878 ) ) ( not ( = ?auto_338874 ?auto_338879 ) ) ( not ( = ?auto_338874 ?auto_338880 ) ) ( not ( = ?auto_338875 ?auto_338876 ) ) ( not ( = ?auto_338875 ?auto_338877 ) ) ( not ( = ?auto_338875 ?auto_338878 ) ) ( not ( = ?auto_338875 ?auto_338879 ) ) ( not ( = ?auto_338875 ?auto_338880 ) ) ( not ( = ?auto_338876 ?auto_338877 ) ) ( not ( = ?auto_338876 ?auto_338878 ) ) ( not ( = ?auto_338876 ?auto_338879 ) ) ( not ( = ?auto_338876 ?auto_338880 ) ) ( not ( = ?auto_338877 ?auto_338878 ) ) ( not ( = ?auto_338877 ?auto_338879 ) ) ( not ( = ?auto_338877 ?auto_338880 ) ) ( not ( = ?auto_338878 ?auto_338879 ) ) ( not ( = ?auto_338878 ?auto_338880 ) ) ( not ( = ?auto_338879 ?auto_338880 ) ) ( ON ?auto_338879 ?auto_338880 ) ( ON ?auto_338878 ?auto_338879 ) ( ON ?auto_338877 ?auto_338878 ) ( ON ?auto_338876 ?auto_338877 ) ( ON ?auto_338875 ?auto_338876 ) ( ON ?auto_338874 ?auto_338875 ) ( ON ?auto_338873 ?auto_338874 ) ( CLEAR ?auto_338871 ) ( ON ?auto_338872 ?auto_338873 ) ( CLEAR ?auto_338872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_338867 ?auto_338868 ?auto_338869 ?auto_338870 ?auto_338871 ?auto_338872 )
      ( MAKE-14PILE ?auto_338867 ?auto_338868 ?auto_338869 ?auto_338870 ?auto_338871 ?auto_338872 ?auto_338873 ?auto_338874 ?auto_338875 ?auto_338876 ?auto_338877 ?auto_338878 ?auto_338879 ?auto_338880 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338895 - BLOCK
      ?auto_338896 - BLOCK
      ?auto_338897 - BLOCK
      ?auto_338898 - BLOCK
      ?auto_338899 - BLOCK
      ?auto_338900 - BLOCK
      ?auto_338901 - BLOCK
      ?auto_338902 - BLOCK
      ?auto_338903 - BLOCK
      ?auto_338904 - BLOCK
      ?auto_338905 - BLOCK
      ?auto_338906 - BLOCK
      ?auto_338907 - BLOCK
      ?auto_338908 - BLOCK
    )
    :vars
    (
      ?auto_338909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338908 ?auto_338909 ) ( ON-TABLE ?auto_338895 ) ( ON ?auto_338896 ?auto_338895 ) ( ON ?auto_338897 ?auto_338896 ) ( ON ?auto_338898 ?auto_338897 ) ( not ( = ?auto_338895 ?auto_338896 ) ) ( not ( = ?auto_338895 ?auto_338897 ) ) ( not ( = ?auto_338895 ?auto_338898 ) ) ( not ( = ?auto_338895 ?auto_338899 ) ) ( not ( = ?auto_338895 ?auto_338900 ) ) ( not ( = ?auto_338895 ?auto_338901 ) ) ( not ( = ?auto_338895 ?auto_338902 ) ) ( not ( = ?auto_338895 ?auto_338903 ) ) ( not ( = ?auto_338895 ?auto_338904 ) ) ( not ( = ?auto_338895 ?auto_338905 ) ) ( not ( = ?auto_338895 ?auto_338906 ) ) ( not ( = ?auto_338895 ?auto_338907 ) ) ( not ( = ?auto_338895 ?auto_338908 ) ) ( not ( = ?auto_338895 ?auto_338909 ) ) ( not ( = ?auto_338896 ?auto_338897 ) ) ( not ( = ?auto_338896 ?auto_338898 ) ) ( not ( = ?auto_338896 ?auto_338899 ) ) ( not ( = ?auto_338896 ?auto_338900 ) ) ( not ( = ?auto_338896 ?auto_338901 ) ) ( not ( = ?auto_338896 ?auto_338902 ) ) ( not ( = ?auto_338896 ?auto_338903 ) ) ( not ( = ?auto_338896 ?auto_338904 ) ) ( not ( = ?auto_338896 ?auto_338905 ) ) ( not ( = ?auto_338896 ?auto_338906 ) ) ( not ( = ?auto_338896 ?auto_338907 ) ) ( not ( = ?auto_338896 ?auto_338908 ) ) ( not ( = ?auto_338896 ?auto_338909 ) ) ( not ( = ?auto_338897 ?auto_338898 ) ) ( not ( = ?auto_338897 ?auto_338899 ) ) ( not ( = ?auto_338897 ?auto_338900 ) ) ( not ( = ?auto_338897 ?auto_338901 ) ) ( not ( = ?auto_338897 ?auto_338902 ) ) ( not ( = ?auto_338897 ?auto_338903 ) ) ( not ( = ?auto_338897 ?auto_338904 ) ) ( not ( = ?auto_338897 ?auto_338905 ) ) ( not ( = ?auto_338897 ?auto_338906 ) ) ( not ( = ?auto_338897 ?auto_338907 ) ) ( not ( = ?auto_338897 ?auto_338908 ) ) ( not ( = ?auto_338897 ?auto_338909 ) ) ( not ( = ?auto_338898 ?auto_338899 ) ) ( not ( = ?auto_338898 ?auto_338900 ) ) ( not ( = ?auto_338898 ?auto_338901 ) ) ( not ( = ?auto_338898 ?auto_338902 ) ) ( not ( = ?auto_338898 ?auto_338903 ) ) ( not ( = ?auto_338898 ?auto_338904 ) ) ( not ( = ?auto_338898 ?auto_338905 ) ) ( not ( = ?auto_338898 ?auto_338906 ) ) ( not ( = ?auto_338898 ?auto_338907 ) ) ( not ( = ?auto_338898 ?auto_338908 ) ) ( not ( = ?auto_338898 ?auto_338909 ) ) ( not ( = ?auto_338899 ?auto_338900 ) ) ( not ( = ?auto_338899 ?auto_338901 ) ) ( not ( = ?auto_338899 ?auto_338902 ) ) ( not ( = ?auto_338899 ?auto_338903 ) ) ( not ( = ?auto_338899 ?auto_338904 ) ) ( not ( = ?auto_338899 ?auto_338905 ) ) ( not ( = ?auto_338899 ?auto_338906 ) ) ( not ( = ?auto_338899 ?auto_338907 ) ) ( not ( = ?auto_338899 ?auto_338908 ) ) ( not ( = ?auto_338899 ?auto_338909 ) ) ( not ( = ?auto_338900 ?auto_338901 ) ) ( not ( = ?auto_338900 ?auto_338902 ) ) ( not ( = ?auto_338900 ?auto_338903 ) ) ( not ( = ?auto_338900 ?auto_338904 ) ) ( not ( = ?auto_338900 ?auto_338905 ) ) ( not ( = ?auto_338900 ?auto_338906 ) ) ( not ( = ?auto_338900 ?auto_338907 ) ) ( not ( = ?auto_338900 ?auto_338908 ) ) ( not ( = ?auto_338900 ?auto_338909 ) ) ( not ( = ?auto_338901 ?auto_338902 ) ) ( not ( = ?auto_338901 ?auto_338903 ) ) ( not ( = ?auto_338901 ?auto_338904 ) ) ( not ( = ?auto_338901 ?auto_338905 ) ) ( not ( = ?auto_338901 ?auto_338906 ) ) ( not ( = ?auto_338901 ?auto_338907 ) ) ( not ( = ?auto_338901 ?auto_338908 ) ) ( not ( = ?auto_338901 ?auto_338909 ) ) ( not ( = ?auto_338902 ?auto_338903 ) ) ( not ( = ?auto_338902 ?auto_338904 ) ) ( not ( = ?auto_338902 ?auto_338905 ) ) ( not ( = ?auto_338902 ?auto_338906 ) ) ( not ( = ?auto_338902 ?auto_338907 ) ) ( not ( = ?auto_338902 ?auto_338908 ) ) ( not ( = ?auto_338902 ?auto_338909 ) ) ( not ( = ?auto_338903 ?auto_338904 ) ) ( not ( = ?auto_338903 ?auto_338905 ) ) ( not ( = ?auto_338903 ?auto_338906 ) ) ( not ( = ?auto_338903 ?auto_338907 ) ) ( not ( = ?auto_338903 ?auto_338908 ) ) ( not ( = ?auto_338903 ?auto_338909 ) ) ( not ( = ?auto_338904 ?auto_338905 ) ) ( not ( = ?auto_338904 ?auto_338906 ) ) ( not ( = ?auto_338904 ?auto_338907 ) ) ( not ( = ?auto_338904 ?auto_338908 ) ) ( not ( = ?auto_338904 ?auto_338909 ) ) ( not ( = ?auto_338905 ?auto_338906 ) ) ( not ( = ?auto_338905 ?auto_338907 ) ) ( not ( = ?auto_338905 ?auto_338908 ) ) ( not ( = ?auto_338905 ?auto_338909 ) ) ( not ( = ?auto_338906 ?auto_338907 ) ) ( not ( = ?auto_338906 ?auto_338908 ) ) ( not ( = ?auto_338906 ?auto_338909 ) ) ( not ( = ?auto_338907 ?auto_338908 ) ) ( not ( = ?auto_338907 ?auto_338909 ) ) ( not ( = ?auto_338908 ?auto_338909 ) ) ( ON ?auto_338907 ?auto_338908 ) ( ON ?auto_338906 ?auto_338907 ) ( ON ?auto_338905 ?auto_338906 ) ( ON ?auto_338904 ?auto_338905 ) ( ON ?auto_338903 ?auto_338904 ) ( ON ?auto_338902 ?auto_338903 ) ( ON ?auto_338901 ?auto_338902 ) ( ON ?auto_338900 ?auto_338901 ) ( CLEAR ?auto_338898 ) ( ON ?auto_338899 ?auto_338900 ) ( CLEAR ?auto_338899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_338895 ?auto_338896 ?auto_338897 ?auto_338898 ?auto_338899 )
      ( MAKE-14PILE ?auto_338895 ?auto_338896 ?auto_338897 ?auto_338898 ?auto_338899 ?auto_338900 ?auto_338901 ?auto_338902 ?auto_338903 ?auto_338904 ?auto_338905 ?auto_338906 ?auto_338907 ?auto_338908 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338924 - BLOCK
      ?auto_338925 - BLOCK
      ?auto_338926 - BLOCK
      ?auto_338927 - BLOCK
      ?auto_338928 - BLOCK
      ?auto_338929 - BLOCK
      ?auto_338930 - BLOCK
      ?auto_338931 - BLOCK
      ?auto_338932 - BLOCK
      ?auto_338933 - BLOCK
      ?auto_338934 - BLOCK
      ?auto_338935 - BLOCK
      ?auto_338936 - BLOCK
      ?auto_338937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338937 ) ( ON-TABLE ?auto_338924 ) ( ON ?auto_338925 ?auto_338924 ) ( ON ?auto_338926 ?auto_338925 ) ( ON ?auto_338927 ?auto_338926 ) ( not ( = ?auto_338924 ?auto_338925 ) ) ( not ( = ?auto_338924 ?auto_338926 ) ) ( not ( = ?auto_338924 ?auto_338927 ) ) ( not ( = ?auto_338924 ?auto_338928 ) ) ( not ( = ?auto_338924 ?auto_338929 ) ) ( not ( = ?auto_338924 ?auto_338930 ) ) ( not ( = ?auto_338924 ?auto_338931 ) ) ( not ( = ?auto_338924 ?auto_338932 ) ) ( not ( = ?auto_338924 ?auto_338933 ) ) ( not ( = ?auto_338924 ?auto_338934 ) ) ( not ( = ?auto_338924 ?auto_338935 ) ) ( not ( = ?auto_338924 ?auto_338936 ) ) ( not ( = ?auto_338924 ?auto_338937 ) ) ( not ( = ?auto_338925 ?auto_338926 ) ) ( not ( = ?auto_338925 ?auto_338927 ) ) ( not ( = ?auto_338925 ?auto_338928 ) ) ( not ( = ?auto_338925 ?auto_338929 ) ) ( not ( = ?auto_338925 ?auto_338930 ) ) ( not ( = ?auto_338925 ?auto_338931 ) ) ( not ( = ?auto_338925 ?auto_338932 ) ) ( not ( = ?auto_338925 ?auto_338933 ) ) ( not ( = ?auto_338925 ?auto_338934 ) ) ( not ( = ?auto_338925 ?auto_338935 ) ) ( not ( = ?auto_338925 ?auto_338936 ) ) ( not ( = ?auto_338925 ?auto_338937 ) ) ( not ( = ?auto_338926 ?auto_338927 ) ) ( not ( = ?auto_338926 ?auto_338928 ) ) ( not ( = ?auto_338926 ?auto_338929 ) ) ( not ( = ?auto_338926 ?auto_338930 ) ) ( not ( = ?auto_338926 ?auto_338931 ) ) ( not ( = ?auto_338926 ?auto_338932 ) ) ( not ( = ?auto_338926 ?auto_338933 ) ) ( not ( = ?auto_338926 ?auto_338934 ) ) ( not ( = ?auto_338926 ?auto_338935 ) ) ( not ( = ?auto_338926 ?auto_338936 ) ) ( not ( = ?auto_338926 ?auto_338937 ) ) ( not ( = ?auto_338927 ?auto_338928 ) ) ( not ( = ?auto_338927 ?auto_338929 ) ) ( not ( = ?auto_338927 ?auto_338930 ) ) ( not ( = ?auto_338927 ?auto_338931 ) ) ( not ( = ?auto_338927 ?auto_338932 ) ) ( not ( = ?auto_338927 ?auto_338933 ) ) ( not ( = ?auto_338927 ?auto_338934 ) ) ( not ( = ?auto_338927 ?auto_338935 ) ) ( not ( = ?auto_338927 ?auto_338936 ) ) ( not ( = ?auto_338927 ?auto_338937 ) ) ( not ( = ?auto_338928 ?auto_338929 ) ) ( not ( = ?auto_338928 ?auto_338930 ) ) ( not ( = ?auto_338928 ?auto_338931 ) ) ( not ( = ?auto_338928 ?auto_338932 ) ) ( not ( = ?auto_338928 ?auto_338933 ) ) ( not ( = ?auto_338928 ?auto_338934 ) ) ( not ( = ?auto_338928 ?auto_338935 ) ) ( not ( = ?auto_338928 ?auto_338936 ) ) ( not ( = ?auto_338928 ?auto_338937 ) ) ( not ( = ?auto_338929 ?auto_338930 ) ) ( not ( = ?auto_338929 ?auto_338931 ) ) ( not ( = ?auto_338929 ?auto_338932 ) ) ( not ( = ?auto_338929 ?auto_338933 ) ) ( not ( = ?auto_338929 ?auto_338934 ) ) ( not ( = ?auto_338929 ?auto_338935 ) ) ( not ( = ?auto_338929 ?auto_338936 ) ) ( not ( = ?auto_338929 ?auto_338937 ) ) ( not ( = ?auto_338930 ?auto_338931 ) ) ( not ( = ?auto_338930 ?auto_338932 ) ) ( not ( = ?auto_338930 ?auto_338933 ) ) ( not ( = ?auto_338930 ?auto_338934 ) ) ( not ( = ?auto_338930 ?auto_338935 ) ) ( not ( = ?auto_338930 ?auto_338936 ) ) ( not ( = ?auto_338930 ?auto_338937 ) ) ( not ( = ?auto_338931 ?auto_338932 ) ) ( not ( = ?auto_338931 ?auto_338933 ) ) ( not ( = ?auto_338931 ?auto_338934 ) ) ( not ( = ?auto_338931 ?auto_338935 ) ) ( not ( = ?auto_338931 ?auto_338936 ) ) ( not ( = ?auto_338931 ?auto_338937 ) ) ( not ( = ?auto_338932 ?auto_338933 ) ) ( not ( = ?auto_338932 ?auto_338934 ) ) ( not ( = ?auto_338932 ?auto_338935 ) ) ( not ( = ?auto_338932 ?auto_338936 ) ) ( not ( = ?auto_338932 ?auto_338937 ) ) ( not ( = ?auto_338933 ?auto_338934 ) ) ( not ( = ?auto_338933 ?auto_338935 ) ) ( not ( = ?auto_338933 ?auto_338936 ) ) ( not ( = ?auto_338933 ?auto_338937 ) ) ( not ( = ?auto_338934 ?auto_338935 ) ) ( not ( = ?auto_338934 ?auto_338936 ) ) ( not ( = ?auto_338934 ?auto_338937 ) ) ( not ( = ?auto_338935 ?auto_338936 ) ) ( not ( = ?auto_338935 ?auto_338937 ) ) ( not ( = ?auto_338936 ?auto_338937 ) ) ( ON ?auto_338936 ?auto_338937 ) ( ON ?auto_338935 ?auto_338936 ) ( ON ?auto_338934 ?auto_338935 ) ( ON ?auto_338933 ?auto_338934 ) ( ON ?auto_338932 ?auto_338933 ) ( ON ?auto_338931 ?auto_338932 ) ( ON ?auto_338930 ?auto_338931 ) ( ON ?auto_338929 ?auto_338930 ) ( CLEAR ?auto_338927 ) ( ON ?auto_338928 ?auto_338929 ) ( CLEAR ?auto_338928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_338924 ?auto_338925 ?auto_338926 ?auto_338927 ?auto_338928 )
      ( MAKE-14PILE ?auto_338924 ?auto_338925 ?auto_338926 ?auto_338927 ?auto_338928 ?auto_338929 ?auto_338930 ?auto_338931 ?auto_338932 ?auto_338933 ?auto_338934 ?auto_338935 ?auto_338936 ?auto_338937 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338952 - BLOCK
      ?auto_338953 - BLOCK
      ?auto_338954 - BLOCK
      ?auto_338955 - BLOCK
      ?auto_338956 - BLOCK
      ?auto_338957 - BLOCK
      ?auto_338958 - BLOCK
      ?auto_338959 - BLOCK
      ?auto_338960 - BLOCK
      ?auto_338961 - BLOCK
      ?auto_338962 - BLOCK
      ?auto_338963 - BLOCK
      ?auto_338964 - BLOCK
      ?auto_338965 - BLOCK
    )
    :vars
    (
      ?auto_338966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_338965 ?auto_338966 ) ( ON-TABLE ?auto_338952 ) ( ON ?auto_338953 ?auto_338952 ) ( ON ?auto_338954 ?auto_338953 ) ( not ( = ?auto_338952 ?auto_338953 ) ) ( not ( = ?auto_338952 ?auto_338954 ) ) ( not ( = ?auto_338952 ?auto_338955 ) ) ( not ( = ?auto_338952 ?auto_338956 ) ) ( not ( = ?auto_338952 ?auto_338957 ) ) ( not ( = ?auto_338952 ?auto_338958 ) ) ( not ( = ?auto_338952 ?auto_338959 ) ) ( not ( = ?auto_338952 ?auto_338960 ) ) ( not ( = ?auto_338952 ?auto_338961 ) ) ( not ( = ?auto_338952 ?auto_338962 ) ) ( not ( = ?auto_338952 ?auto_338963 ) ) ( not ( = ?auto_338952 ?auto_338964 ) ) ( not ( = ?auto_338952 ?auto_338965 ) ) ( not ( = ?auto_338952 ?auto_338966 ) ) ( not ( = ?auto_338953 ?auto_338954 ) ) ( not ( = ?auto_338953 ?auto_338955 ) ) ( not ( = ?auto_338953 ?auto_338956 ) ) ( not ( = ?auto_338953 ?auto_338957 ) ) ( not ( = ?auto_338953 ?auto_338958 ) ) ( not ( = ?auto_338953 ?auto_338959 ) ) ( not ( = ?auto_338953 ?auto_338960 ) ) ( not ( = ?auto_338953 ?auto_338961 ) ) ( not ( = ?auto_338953 ?auto_338962 ) ) ( not ( = ?auto_338953 ?auto_338963 ) ) ( not ( = ?auto_338953 ?auto_338964 ) ) ( not ( = ?auto_338953 ?auto_338965 ) ) ( not ( = ?auto_338953 ?auto_338966 ) ) ( not ( = ?auto_338954 ?auto_338955 ) ) ( not ( = ?auto_338954 ?auto_338956 ) ) ( not ( = ?auto_338954 ?auto_338957 ) ) ( not ( = ?auto_338954 ?auto_338958 ) ) ( not ( = ?auto_338954 ?auto_338959 ) ) ( not ( = ?auto_338954 ?auto_338960 ) ) ( not ( = ?auto_338954 ?auto_338961 ) ) ( not ( = ?auto_338954 ?auto_338962 ) ) ( not ( = ?auto_338954 ?auto_338963 ) ) ( not ( = ?auto_338954 ?auto_338964 ) ) ( not ( = ?auto_338954 ?auto_338965 ) ) ( not ( = ?auto_338954 ?auto_338966 ) ) ( not ( = ?auto_338955 ?auto_338956 ) ) ( not ( = ?auto_338955 ?auto_338957 ) ) ( not ( = ?auto_338955 ?auto_338958 ) ) ( not ( = ?auto_338955 ?auto_338959 ) ) ( not ( = ?auto_338955 ?auto_338960 ) ) ( not ( = ?auto_338955 ?auto_338961 ) ) ( not ( = ?auto_338955 ?auto_338962 ) ) ( not ( = ?auto_338955 ?auto_338963 ) ) ( not ( = ?auto_338955 ?auto_338964 ) ) ( not ( = ?auto_338955 ?auto_338965 ) ) ( not ( = ?auto_338955 ?auto_338966 ) ) ( not ( = ?auto_338956 ?auto_338957 ) ) ( not ( = ?auto_338956 ?auto_338958 ) ) ( not ( = ?auto_338956 ?auto_338959 ) ) ( not ( = ?auto_338956 ?auto_338960 ) ) ( not ( = ?auto_338956 ?auto_338961 ) ) ( not ( = ?auto_338956 ?auto_338962 ) ) ( not ( = ?auto_338956 ?auto_338963 ) ) ( not ( = ?auto_338956 ?auto_338964 ) ) ( not ( = ?auto_338956 ?auto_338965 ) ) ( not ( = ?auto_338956 ?auto_338966 ) ) ( not ( = ?auto_338957 ?auto_338958 ) ) ( not ( = ?auto_338957 ?auto_338959 ) ) ( not ( = ?auto_338957 ?auto_338960 ) ) ( not ( = ?auto_338957 ?auto_338961 ) ) ( not ( = ?auto_338957 ?auto_338962 ) ) ( not ( = ?auto_338957 ?auto_338963 ) ) ( not ( = ?auto_338957 ?auto_338964 ) ) ( not ( = ?auto_338957 ?auto_338965 ) ) ( not ( = ?auto_338957 ?auto_338966 ) ) ( not ( = ?auto_338958 ?auto_338959 ) ) ( not ( = ?auto_338958 ?auto_338960 ) ) ( not ( = ?auto_338958 ?auto_338961 ) ) ( not ( = ?auto_338958 ?auto_338962 ) ) ( not ( = ?auto_338958 ?auto_338963 ) ) ( not ( = ?auto_338958 ?auto_338964 ) ) ( not ( = ?auto_338958 ?auto_338965 ) ) ( not ( = ?auto_338958 ?auto_338966 ) ) ( not ( = ?auto_338959 ?auto_338960 ) ) ( not ( = ?auto_338959 ?auto_338961 ) ) ( not ( = ?auto_338959 ?auto_338962 ) ) ( not ( = ?auto_338959 ?auto_338963 ) ) ( not ( = ?auto_338959 ?auto_338964 ) ) ( not ( = ?auto_338959 ?auto_338965 ) ) ( not ( = ?auto_338959 ?auto_338966 ) ) ( not ( = ?auto_338960 ?auto_338961 ) ) ( not ( = ?auto_338960 ?auto_338962 ) ) ( not ( = ?auto_338960 ?auto_338963 ) ) ( not ( = ?auto_338960 ?auto_338964 ) ) ( not ( = ?auto_338960 ?auto_338965 ) ) ( not ( = ?auto_338960 ?auto_338966 ) ) ( not ( = ?auto_338961 ?auto_338962 ) ) ( not ( = ?auto_338961 ?auto_338963 ) ) ( not ( = ?auto_338961 ?auto_338964 ) ) ( not ( = ?auto_338961 ?auto_338965 ) ) ( not ( = ?auto_338961 ?auto_338966 ) ) ( not ( = ?auto_338962 ?auto_338963 ) ) ( not ( = ?auto_338962 ?auto_338964 ) ) ( not ( = ?auto_338962 ?auto_338965 ) ) ( not ( = ?auto_338962 ?auto_338966 ) ) ( not ( = ?auto_338963 ?auto_338964 ) ) ( not ( = ?auto_338963 ?auto_338965 ) ) ( not ( = ?auto_338963 ?auto_338966 ) ) ( not ( = ?auto_338964 ?auto_338965 ) ) ( not ( = ?auto_338964 ?auto_338966 ) ) ( not ( = ?auto_338965 ?auto_338966 ) ) ( ON ?auto_338964 ?auto_338965 ) ( ON ?auto_338963 ?auto_338964 ) ( ON ?auto_338962 ?auto_338963 ) ( ON ?auto_338961 ?auto_338962 ) ( ON ?auto_338960 ?auto_338961 ) ( ON ?auto_338959 ?auto_338960 ) ( ON ?auto_338958 ?auto_338959 ) ( ON ?auto_338957 ?auto_338958 ) ( ON ?auto_338956 ?auto_338957 ) ( CLEAR ?auto_338954 ) ( ON ?auto_338955 ?auto_338956 ) ( CLEAR ?auto_338955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_338952 ?auto_338953 ?auto_338954 ?auto_338955 )
      ( MAKE-14PILE ?auto_338952 ?auto_338953 ?auto_338954 ?auto_338955 ?auto_338956 ?auto_338957 ?auto_338958 ?auto_338959 ?auto_338960 ?auto_338961 ?auto_338962 ?auto_338963 ?auto_338964 ?auto_338965 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_338981 - BLOCK
      ?auto_338982 - BLOCK
      ?auto_338983 - BLOCK
      ?auto_338984 - BLOCK
      ?auto_338985 - BLOCK
      ?auto_338986 - BLOCK
      ?auto_338987 - BLOCK
      ?auto_338988 - BLOCK
      ?auto_338989 - BLOCK
      ?auto_338990 - BLOCK
      ?auto_338991 - BLOCK
      ?auto_338992 - BLOCK
      ?auto_338993 - BLOCK
      ?auto_338994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_338994 ) ( ON-TABLE ?auto_338981 ) ( ON ?auto_338982 ?auto_338981 ) ( ON ?auto_338983 ?auto_338982 ) ( not ( = ?auto_338981 ?auto_338982 ) ) ( not ( = ?auto_338981 ?auto_338983 ) ) ( not ( = ?auto_338981 ?auto_338984 ) ) ( not ( = ?auto_338981 ?auto_338985 ) ) ( not ( = ?auto_338981 ?auto_338986 ) ) ( not ( = ?auto_338981 ?auto_338987 ) ) ( not ( = ?auto_338981 ?auto_338988 ) ) ( not ( = ?auto_338981 ?auto_338989 ) ) ( not ( = ?auto_338981 ?auto_338990 ) ) ( not ( = ?auto_338981 ?auto_338991 ) ) ( not ( = ?auto_338981 ?auto_338992 ) ) ( not ( = ?auto_338981 ?auto_338993 ) ) ( not ( = ?auto_338981 ?auto_338994 ) ) ( not ( = ?auto_338982 ?auto_338983 ) ) ( not ( = ?auto_338982 ?auto_338984 ) ) ( not ( = ?auto_338982 ?auto_338985 ) ) ( not ( = ?auto_338982 ?auto_338986 ) ) ( not ( = ?auto_338982 ?auto_338987 ) ) ( not ( = ?auto_338982 ?auto_338988 ) ) ( not ( = ?auto_338982 ?auto_338989 ) ) ( not ( = ?auto_338982 ?auto_338990 ) ) ( not ( = ?auto_338982 ?auto_338991 ) ) ( not ( = ?auto_338982 ?auto_338992 ) ) ( not ( = ?auto_338982 ?auto_338993 ) ) ( not ( = ?auto_338982 ?auto_338994 ) ) ( not ( = ?auto_338983 ?auto_338984 ) ) ( not ( = ?auto_338983 ?auto_338985 ) ) ( not ( = ?auto_338983 ?auto_338986 ) ) ( not ( = ?auto_338983 ?auto_338987 ) ) ( not ( = ?auto_338983 ?auto_338988 ) ) ( not ( = ?auto_338983 ?auto_338989 ) ) ( not ( = ?auto_338983 ?auto_338990 ) ) ( not ( = ?auto_338983 ?auto_338991 ) ) ( not ( = ?auto_338983 ?auto_338992 ) ) ( not ( = ?auto_338983 ?auto_338993 ) ) ( not ( = ?auto_338983 ?auto_338994 ) ) ( not ( = ?auto_338984 ?auto_338985 ) ) ( not ( = ?auto_338984 ?auto_338986 ) ) ( not ( = ?auto_338984 ?auto_338987 ) ) ( not ( = ?auto_338984 ?auto_338988 ) ) ( not ( = ?auto_338984 ?auto_338989 ) ) ( not ( = ?auto_338984 ?auto_338990 ) ) ( not ( = ?auto_338984 ?auto_338991 ) ) ( not ( = ?auto_338984 ?auto_338992 ) ) ( not ( = ?auto_338984 ?auto_338993 ) ) ( not ( = ?auto_338984 ?auto_338994 ) ) ( not ( = ?auto_338985 ?auto_338986 ) ) ( not ( = ?auto_338985 ?auto_338987 ) ) ( not ( = ?auto_338985 ?auto_338988 ) ) ( not ( = ?auto_338985 ?auto_338989 ) ) ( not ( = ?auto_338985 ?auto_338990 ) ) ( not ( = ?auto_338985 ?auto_338991 ) ) ( not ( = ?auto_338985 ?auto_338992 ) ) ( not ( = ?auto_338985 ?auto_338993 ) ) ( not ( = ?auto_338985 ?auto_338994 ) ) ( not ( = ?auto_338986 ?auto_338987 ) ) ( not ( = ?auto_338986 ?auto_338988 ) ) ( not ( = ?auto_338986 ?auto_338989 ) ) ( not ( = ?auto_338986 ?auto_338990 ) ) ( not ( = ?auto_338986 ?auto_338991 ) ) ( not ( = ?auto_338986 ?auto_338992 ) ) ( not ( = ?auto_338986 ?auto_338993 ) ) ( not ( = ?auto_338986 ?auto_338994 ) ) ( not ( = ?auto_338987 ?auto_338988 ) ) ( not ( = ?auto_338987 ?auto_338989 ) ) ( not ( = ?auto_338987 ?auto_338990 ) ) ( not ( = ?auto_338987 ?auto_338991 ) ) ( not ( = ?auto_338987 ?auto_338992 ) ) ( not ( = ?auto_338987 ?auto_338993 ) ) ( not ( = ?auto_338987 ?auto_338994 ) ) ( not ( = ?auto_338988 ?auto_338989 ) ) ( not ( = ?auto_338988 ?auto_338990 ) ) ( not ( = ?auto_338988 ?auto_338991 ) ) ( not ( = ?auto_338988 ?auto_338992 ) ) ( not ( = ?auto_338988 ?auto_338993 ) ) ( not ( = ?auto_338988 ?auto_338994 ) ) ( not ( = ?auto_338989 ?auto_338990 ) ) ( not ( = ?auto_338989 ?auto_338991 ) ) ( not ( = ?auto_338989 ?auto_338992 ) ) ( not ( = ?auto_338989 ?auto_338993 ) ) ( not ( = ?auto_338989 ?auto_338994 ) ) ( not ( = ?auto_338990 ?auto_338991 ) ) ( not ( = ?auto_338990 ?auto_338992 ) ) ( not ( = ?auto_338990 ?auto_338993 ) ) ( not ( = ?auto_338990 ?auto_338994 ) ) ( not ( = ?auto_338991 ?auto_338992 ) ) ( not ( = ?auto_338991 ?auto_338993 ) ) ( not ( = ?auto_338991 ?auto_338994 ) ) ( not ( = ?auto_338992 ?auto_338993 ) ) ( not ( = ?auto_338992 ?auto_338994 ) ) ( not ( = ?auto_338993 ?auto_338994 ) ) ( ON ?auto_338993 ?auto_338994 ) ( ON ?auto_338992 ?auto_338993 ) ( ON ?auto_338991 ?auto_338992 ) ( ON ?auto_338990 ?auto_338991 ) ( ON ?auto_338989 ?auto_338990 ) ( ON ?auto_338988 ?auto_338989 ) ( ON ?auto_338987 ?auto_338988 ) ( ON ?auto_338986 ?auto_338987 ) ( ON ?auto_338985 ?auto_338986 ) ( CLEAR ?auto_338983 ) ( ON ?auto_338984 ?auto_338985 ) ( CLEAR ?auto_338984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_338981 ?auto_338982 ?auto_338983 ?auto_338984 )
      ( MAKE-14PILE ?auto_338981 ?auto_338982 ?auto_338983 ?auto_338984 ?auto_338985 ?auto_338986 ?auto_338987 ?auto_338988 ?auto_338989 ?auto_338990 ?auto_338991 ?auto_338992 ?auto_338993 ?auto_338994 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_339009 - BLOCK
      ?auto_339010 - BLOCK
      ?auto_339011 - BLOCK
      ?auto_339012 - BLOCK
      ?auto_339013 - BLOCK
      ?auto_339014 - BLOCK
      ?auto_339015 - BLOCK
      ?auto_339016 - BLOCK
      ?auto_339017 - BLOCK
      ?auto_339018 - BLOCK
      ?auto_339019 - BLOCK
      ?auto_339020 - BLOCK
      ?auto_339021 - BLOCK
      ?auto_339022 - BLOCK
    )
    :vars
    (
      ?auto_339023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339022 ?auto_339023 ) ( ON-TABLE ?auto_339009 ) ( ON ?auto_339010 ?auto_339009 ) ( not ( = ?auto_339009 ?auto_339010 ) ) ( not ( = ?auto_339009 ?auto_339011 ) ) ( not ( = ?auto_339009 ?auto_339012 ) ) ( not ( = ?auto_339009 ?auto_339013 ) ) ( not ( = ?auto_339009 ?auto_339014 ) ) ( not ( = ?auto_339009 ?auto_339015 ) ) ( not ( = ?auto_339009 ?auto_339016 ) ) ( not ( = ?auto_339009 ?auto_339017 ) ) ( not ( = ?auto_339009 ?auto_339018 ) ) ( not ( = ?auto_339009 ?auto_339019 ) ) ( not ( = ?auto_339009 ?auto_339020 ) ) ( not ( = ?auto_339009 ?auto_339021 ) ) ( not ( = ?auto_339009 ?auto_339022 ) ) ( not ( = ?auto_339009 ?auto_339023 ) ) ( not ( = ?auto_339010 ?auto_339011 ) ) ( not ( = ?auto_339010 ?auto_339012 ) ) ( not ( = ?auto_339010 ?auto_339013 ) ) ( not ( = ?auto_339010 ?auto_339014 ) ) ( not ( = ?auto_339010 ?auto_339015 ) ) ( not ( = ?auto_339010 ?auto_339016 ) ) ( not ( = ?auto_339010 ?auto_339017 ) ) ( not ( = ?auto_339010 ?auto_339018 ) ) ( not ( = ?auto_339010 ?auto_339019 ) ) ( not ( = ?auto_339010 ?auto_339020 ) ) ( not ( = ?auto_339010 ?auto_339021 ) ) ( not ( = ?auto_339010 ?auto_339022 ) ) ( not ( = ?auto_339010 ?auto_339023 ) ) ( not ( = ?auto_339011 ?auto_339012 ) ) ( not ( = ?auto_339011 ?auto_339013 ) ) ( not ( = ?auto_339011 ?auto_339014 ) ) ( not ( = ?auto_339011 ?auto_339015 ) ) ( not ( = ?auto_339011 ?auto_339016 ) ) ( not ( = ?auto_339011 ?auto_339017 ) ) ( not ( = ?auto_339011 ?auto_339018 ) ) ( not ( = ?auto_339011 ?auto_339019 ) ) ( not ( = ?auto_339011 ?auto_339020 ) ) ( not ( = ?auto_339011 ?auto_339021 ) ) ( not ( = ?auto_339011 ?auto_339022 ) ) ( not ( = ?auto_339011 ?auto_339023 ) ) ( not ( = ?auto_339012 ?auto_339013 ) ) ( not ( = ?auto_339012 ?auto_339014 ) ) ( not ( = ?auto_339012 ?auto_339015 ) ) ( not ( = ?auto_339012 ?auto_339016 ) ) ( not ( = ?auto_339012 ?auto_339017 ) ) ( not ( = ?auto_339012 ?auto_339018 ) ) ( not ( = ?auto_339012 ?auto_339019 ) ) ( not ( = ?auto_339012 ?auto_339020 ) ) ( not ( = ?auto_339012 ?auto_339021 ) ) ( not ( = ?auto_339012 ?auto_339022 ) ) ( not ( = ?auto_339012 ?auto_339023 ) ) ( not ( = ?auto_339013 ?auto_339014 ) ) ( not ( = ?auto_339013 ?auto_339015 ) ) ( not ( = ?auto_339013 ?auto_339016 ) ) ( not ( = ?auto_339013 ?auto_339017 ) ) ( not ( = ?auto_339013 ?auto_339018 ) ) ( not ( = ?auto_339013 ?auto_339019 ) ) ( not ( = ?auto_339013 ?auto_339020 ) ) ( not ( = ?auto_339013 ?auto_339021 ) ) ( not ( = ?auto_339013 ?auto_339022 ) ) ( not ( = ?auto_339013 ?auto_339023 ) ) ( not ( = ?auto_339014 ?auto_339015 ) ) ( not ( = ?auto_339014 ?auto_339016 ) ) ( not ( = ?auto_339014 ?auto_339017 ) ) ( not ( = ?auto_339014 ?auto_339018 ) ) ( not ( = ?auto_339014 ?auto_339019 ) ) ( not ( = ?auto_339014 ?auto_339020 ) ) ( not ( = ?auto_339014 ?auto_339021 ) ) ( not ( = ?auto_339014 ?auto_339022 ) ) ( not ( = ?auto_339014 ?auto_339023 ) ) ( not ( = ?auto_339015 ?auto_339016 ) ) ( not ( = ?auto_339015 ?auto_339017 ) ) ( not ( = ?auto_339015 ?auto_339018 ) ) ( not ( = ?auto_339015 ?auto_339019 ) ) ( not ( = ?auto_339015 ?auto_339020 ) ) ( not ( = ?auto_339015 ?auto_339021 ) ) ( not ( = ?auto_339015 ?auto_339022 ) ) ( not ( = ?auto_339015 ?auto_339023 ) ) ( not ( = ?auto_339016 ?auto_339017 ) ) ( not ( = ?auto_339016 ?auto_339018 ) ) ( not ( = ?auto_339016 ?auto_339019 ) ) ( not ( = ?auto_339016 ?auto_339020 ) ) ( not ( = ?auto_339016 ?auto_339021 ) ) ( not ( = ?auto_339016 ?auto_339022 ) ) ( not ( = ?auto_339016 ?auto_339023 ) ) ( not ( = ?auto_339017 ?auto_339018 ) ) ( not ( = ?auto_339017 ?auto_339019 ) ) ( not ( = ?auto_339017 ?auto_339020 ) ) ( not ( = ?auto_339017 ?auto_339021 ) ) ( not ( = ?auto_339017 ?auto_339022 ) ) ( not ( = ?auto_339017 ?auto_339023 ) ) ( not ( = ?auto_339018 ?auto_339019 ) ) ( not ( = ?auto_339018 ?auto_339020 ) ) ( not ( = ?auto_339018 ?auto_339021 ) ) ( not ( = ?auto_339018 ?auto_339022 ) ) ( not ( = ?auto_339018 ?auto_339023 ) ) ( not ( = ?auto_339019 ?auto_339020 ) ) ( not ( = ?auto_339019 ?auto_339021 ) ) ( not ( = ?auto_339019 ?auto_339022 ) ) ( not ( = ?auto_339019 ?auto_339023 ) ) ( not ( = ?auto_339020 ?auto_339021 ) ) ( not ( = ?auto_339020 ?auto_339022 ) ) ( not ( = ?auto_339020 ?auto_339023 ) ) ( not ( = ?auto_339021 ?auto_339022 ) ) ( not ( = ?auto_339021 ?auto_339023 ) ) ( not ( = ?auto_339022 ?auto_339023 ) ) ( ON ?auto_339021 ?auto_339022 ) ( ON ?auto_339020 ?auto_339021 ) ( ON ?auto_339019 ?auto_339020 ) ( ON ?auto_339018 ?auto_339019 ) ( ON ?auto_339017 ?auto_339018 ) ( ON ?auto_339016 ?auto_339017 ) ( ON ?auto_339015 ?auto_339016 ) ( ON ?auto_339014 ?auto_339015 ) ( ON ?auto_339013 ?auto_339014 ) ( ON ?auto_339012 ?auto_339013 ) ( CLEAR ?auto_339010 ) ( ON ?auto_339011 ?auto_339012 ) ( CLEAR ?auto_339011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_339009 ?auto_339010 ?auto_339011 )
      ( MAKE-14PILE ?auto_339009 ?auto_339010 ?auto_339011 ?auto_339012 ?auto_339013 ?auto_339014 ?auto_339015 ?auto_339016 ?auto_339017 ?auto_339018 ?auto_339019 ?auto_339020 ?auto_339021 ?auto_339022 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_339038 - BLOCK
      ?auto_339039 - BLOCK
      ?auto_339040 - BLOCK
      ?auto_339041 - BLOCK
      ?auto_339042 - BLOCK
      ?auto_339043 - BLOCK
      ?auto_339044 - BLOCK
      ?auto_339045 - BLOCK
      ?auto_339046 - BLOCK
      ?auto_339047 - BLOCK
      ?auto_339048 - BLOCK
      ?auto_339049 - BLOCK
      ?auto_339050 - BLOCK
      ?auto_339051 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_339051 ) ( ON-TABLE ?auto_339038 ) ( ON ?auto_339039 ?auto_339038 ) ( not ( = ?auto_339038 ?auto_339039 ) ) ( not ( = ?auto_339038 ?auto_339040 ) ) ( not ( = ?auto_339038 ?auto_339041 ) ) ( not ( = ?auto_339038 ?auto_339042 ) ) ( not ( = ?auto_339038 ?auto_339043 ) ) ( not ( = ?auto_339038 ?auto_339044 ) ) ( not ( = ?auto_339038 ?auto_339045 ) ) ( not ( = ?auto_339038 ?auto_339046 ) ) ( not ( = ?auto_339038 ?auto_339047 ) ) ( not ( = ?auto_339038 ?auto_339048 ) ) ( not ( = ?auto_339038 ?auto_339049 ) ) ( not ( = ?auto_339038 ?auto_339050 ) ) ( not ( = ?auto_339038 ?auto_339051 ) ) ( not ( = ?auto_339039 ?auto_339040 ) ) ( not ( = ?auto_339039 ?auto_339041 ) ) ( not ( = ?auto_339039 ?auto_339042 ) ) ( not ( = ?auto_339039 ?auto_339043 ) ) ( not ( = ?auto_339039 ?auto_339044 ) ) ( not ( = ?auto_339039 ?auto_339045 ) ) ( not ( = ?auto_339039 ?auto_339046 ) ) ( not ( = ?auto_339039 ?auto_339047 ) ) ( not ( = ?auto_339039 ?auto_339048 ) ) ( not ( = ?auto_339039 ?auto_339049 ) ) ( not ( = ?auto_339039 ?auto_339050 ) ) ( not ( = ?auto_339039 ?auto_339051 ) ) ( not ( = ?auto_339040 ?auto_339041 ) ) ( not ( = ?auto_339040 ?auto_339042 ) ) ( not ( = ?auto_339040 ?auto_339043 ) ) ( not ( = ?auto_339040 ?auto_339044 ) ) ( not ( = ?auto_339040 ?auto_339045 ) ) ( not ( = ?auto_339040 ?auto_339046 ) ) ( not ( = ?auto_339040 ?auto_339047 ) ) ( not ( = ?auto_339040 ?auto_339048 ) ) ( not ( = ?auto_339040 ?auto_339049 ) ) ( not ( = ?auto_339040 ?auto_339050 ) ) ( not ( = ?auto_339040 ?auto_339051 ) ) ( not ( = ?auto_339041 ?auto_339042 ) ) ( not ( = ?auto_339041 ?auto_339043 ) ) ( not ( = ?auto_339041 ?auto_339044 ) ) ( not ( = ?auto_339041 ?auto_339045 ) ) ( not ( = ?auto_339041 ?auto_339046 ) ) ( not ( = ?auto_339041 ?auto_339047 ) ) ( not ( = ?auto_339041 ?auto_339048 ) ) ( not ( = ?auto_339041 ?auto_339049 ) ) ( not ( = ?auto_339041 ?auto_339050 ) ) ( not ( = ?auto_339041 ?auto_339051 ) ) ( not ( = ?auto_339042 ?auto_339043 ) ) ( not ( = ?auto_339042 ?auto_339044 ) ) ( not ( = ?auto_339042 ?auto_339045 ) ) ( not ( = ?auto_339042 ?auto_339046 ) ) ( not ( = ?auto_339042 ?auto_339047 ) ) ( not ( = ?auto_339042 ?auto_339048 ) ) ( not ( = ?auto_339042 ?auto_339049 ) ) ( not ( = ?auto_339042 ?auto_339050 ) ) ( not ( = ?auto_339042 ?auto_339051 ) ) ( not ( = ?auto_339043 ?auto_339044 ) ) ( not ( = ?auto_339043 ?auto_339045 ) ) ( not ( = ?auto_339043 ?auto_339046 ) ) ( not ( = ?auto_339043 ?auto_339047 ) ) ( not ( = ?auto_339043 ?auto_339048 ) ) ( not ( = ?auto_339043 ?auto_339049 ) ) ( not ( = ?auto_339043 ?auto_339050 ) ) ( not ( = ?auto_339043 ?auto_339051 ) ) ( not ( = ?auto_339044 ?auto_339045 ) ) ( not ( = ?auto_339044 ?auto_339046 ) ) ( not ( = ?auto_339044 ?auto_339047 ) ) ( not ( = ?auto_339044 ?auto_339048 ) ) ( not ( = ?auto_339044 ?auto_339049 ) ) ( not ( = ?auto_339044 ?auto_339050 ) ) ( not ( = ?auto_339044 ?auto_339051 ) ) ( not ( = ?auto_339045 ?auto_339046 ) ) ( not ( = ?auto_339045 ?auto_339047 ) ) ( not ( = ?auto_339045 ?auto_339048 ) ) ( not ( = ?auto_339045 ?auto_339049 ) ) ( not ( = ?auto_339045 ?auto_339050 ) ) ( not ( = ?auto_339045 ?auto_339051 ) ) ( not ( = ?auto_339046 ?auto_339047 ) ) ( not ( = ?auto_339046 ?auto_339048 ) ) ( not ( = ?auto_339046 ?auto_339049 ) ) ( not ( = ?auto_339046 ?auto_339050 ) ) ( not ( = ?auto_339046 ?auto_339051 ) ) ( not ( = ?auto_339047 ?auto_339048 ) ) ( not ( = ?auto_339047 ?auto_339049 ) ) ( not ( = ?auto_339047 ?auto_339050 ) ) ( not ( = ?auto_339047 ?auto_339051 ) ) ( not ( = ?auto_339048 ?auto_339049 ) ) ( not ( = ?auto_339048 ?auto_339050 ) ) ( not ( = ?auto_339048 ?auto_339051 ) ) ( not ( = ?auto_339049 ?auto_339050 ) ) ( not ( = ?auto_339049 ?auto_339051 ) ) ( not ( = ?auto_339050 ?auto_339051 ) ) ( ON ?auto_339050 ?auto_339051 ) ( ON ?auto_339049 ?auto_339050 ) ( ON ?auto_339048 ?auto_339049 ) ( ON ?auto_339047 ?auto_339048 ) ( ON ?auto_339046 ?auto_339047 ) ( ON ?auto_339045 ?auto_339046 ) ( ON ?auto_339044 ?auto_339045 ) ( ON ?auto_339043 ?auto_339044 ) ( ON ?auto_339042 ?auto_339043 ) ( ON ?auto_339041 ?auto_339042 ) ( CLEAR ?auto_339039 ) ( ON ?auto_339040 ?auto_339041 ) ( CLEAR ?auto_339040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_339038 ?auto_339039 ?auto_339040 )
      ( MAKE-14PILE ?auto_339038 ?auto_339039 ?auto_339040 ?auto_339041 ?auto_339042 ?auto_339043 ?auto_339044 ?auto_339045 ?auto_339046 ?auto_339047 ?auto_339048 ?auto_339049 ?auto_339050 ?auto_339051 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_339066 - BLOCK
      ?auto_339067 - BLOCK
      ?auto_339068 - BLOCK
      ?auto_339069 - BLOCK
      ?auto_339070 - BLOCK
      ?auto_339071 - BLOCK
      ?auto_339072 - BLOCK
      ?auto_339073 - BLOCK
      ?auto_339074 - BLOCK
      ?auto_339075 - BLOCK
      ?auto_339076 - BLOCK
      ?auto_339077 - BLOCK
      ?auto_339078 - BLOCK
      ?auto_339079 - BLOCK
    )
    :vars
    (
      ?auto_339080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339079 ?auto_339080 ) ( ON-TABLE ?auto_339066 ) ( not ( = ?auto_339066 ?auto_339067 ) ) ( not ( = ?auto_339066 ?auto_339068 ) ) ( not ( = ?auto_339066 ?auto_339069 ) ) ( not ( = ?auto_339066 ?auto_339070 ) ) ( not ( = ?auto_339066 ?auto_339071 ) ) ( not ( = ?auto_339066 ?auto_339072 ) ) ( not ( = ?auto_339066 ?auto_339073 ) ) ( not ( = ?auto_339066 ?auto_339074 ) ) ( not ( = ?auto_339066 ?auto_339075 ) ) ( not ( = ?auto_339066 ?auto_339076 ) ) ( not ( = ?auto_339066 ?auto_339077 ) ) ( not ( = ?auto_339066 ?auto_339078 ) ) ( not ( = ?auto_339066 ?auto_339079 ) ) ( not ( = ?auto_339066 ?auto_339080 ) ) ( not ( = ?auto_339067 ?auto_339068 ) ) ( not ( = ?auto_339067 ?auto_339069 ) ) ( not ( = ?auto_339067 ?auto_339070 ) ) ( not ( = ?auto_339067 ?auto_339071 ) ) ( not ( = ?auto_339067 ?auto_339072 ) ) ( not ( = ?auto_339067 ?auto_339073 ) ) ( not ( = ?auto_339067 ?auto_339074 ) ) ( not ( = ?auto_339067 ?auto_339075 ) ) ( not ( = ?auto_339067 ?auto_339076 ) ) ( not ( = ?auto_339067 ?auto_339077 ) ) ( not ( = ?auto_339067 ?auto_339078 ) ) ( not ( = ?auto_339067 ?auto_339079 ) ) ( not ( = ?auto_339067 ?auto_339080 ) ) ( not ( = ?auto_339068 ?auto_339069 ) ) ( not ( = ?auto_339068 ?auto_339070 ) ) ( not ( = ?auto_339068 ?auto_339071 ) ) ( not ( = ?auto_339068 ?auto_339072 ) ) ( not ( = ?auto_339068 ?auto_339073 ) ) ( not ( = ?auto_339068 ?auto_339074 ) ) ( not ( = ?auto_339068 ?auto_339075 ) ) ( not ( = ?auto_339068 ?auto_339076 ) ) ( not ( = ?auto_339068 ?auto_339077 ) ) ( not ( = ?auto_339068 ?auto_339078 ) ) ( not ( = ?auto_339068 ?auto_339079 ) ) ( not ( = ?auto_339068 ?auto_339080 ) ) ( not ( = ?auto_339069 ?auto_339070 ) ) ( not ( = ?auto_339069 ?auto_339071 ) ) ( not ( = ?auto_339069 ?auto_339072 ) ) ( not ( = ?auto_339069 ?auto_339073 ) ) ( not ( = ?auto_339069 ?auto_339074 ) ) ( not ( = ?auto_339069 ?auto_339075 ) ) ( not ( = ?auto_339069 ?auto_339076 ) ) ( not ( = ?auto_339069 ?auto_339077 ) ) ( not ( = ?auto_339069 ?auto_339078 ) ) ( not ( = ?auto_339069 ?auto_339079 ) ) ( not ( = ?auto_339069 ?auto_339080 ) ) ( not ( = ?auto_339070 ?auto_339071 ) ) ( not ( = ?auto_339070 ?auto_339072 ) ) ( not ( = ?auto_339070 ?auto_339073 ) ) ( not ( = ?auto_339070 ?auto_339074 ) ) ( not ( = ?auto_339070 ?auto_339075 ) ) ( not ( = ?auto_339070 ?auto_339076 ) ) ( not ( = ?auto_339070 ?auto_339077 ) ) ( not ( = ?auto_339070 ?auto_339078 ) ) ( not ( = ?auto_339070 ?auto_339079 ) ) ( not ( = ?auto_339070 ?auto_339080 ) ) ( not ( = ?auto_339071 ?auto_339072 ) ) ( not ( = ?auto_339071 ?auto_339073 ) ) ( not ( = ?auto_339071 ?auto_339074 ) ) ( not ( = ?auto_339071 ?auto_339075 ) ) ( not ( = ?auto_339071 ?auto_339076 ) ) ( not ( = ?auto_339071 ?auto_339077 ) ) ( not ( = ?auto_339071 ?auto_339078 ) ) ( not ( = ?auto_339071 ?auto_339079 ) ) ( not ( = ?auto_339071 ?auto_339080 ) ) ( not ( = ?auto_339072 ?auto_339073 ) ) ( not ( = ?auto_339072 ?auto_339074 ) ) ( not ( = ?auto_339072 ?auto_339075 ) ) ( not ( = ?auto_339072 ?auto_339076 ) ) ( not ( = ?auto_339072 ?auto_339077 ) ) ( not ( = ?auto_339072 ?auto_339078 ) ) ( not ( = ?auto_339072 ?auto_339079 ) ) ( not ( = ?auto_339072 ?auto_339080 ) ) ( not ( = ?auto_339073 ?auto_339074 ) ) ( not ( = ?auto_339073 ?auto_339075 ) ) ( not ( = ?auto_339073 ?auto_339076 ) ) ( not ( = ?auto_339073 ?auto_339077 ) ) ( not ( = ?auto_339073 ?auto_339078 ) ) ( not ( = ?auto_339073 ?auto_339079 ) ) ( not ( = ?auto_339073 ?auto_339080 ) ) ( not ( = ?auto_339074 ?auto_339075 ) ) ( not ( = ?auto_339074 ?auto_339076 ) ) ( not ( = ?auto_339074 ?auto_339077 ) ) ( not ( = ?auto_339074 ?auto_339078 ) ) ( not ( = ?auto_339074 ?auto_339079 ) ) ( not ( = ?auto_339074 ?auto_339080 ) ) ( not ( = ?auto_339075 ?auto_339076 ) ) ( not ( = ?auto_339075 ?auto_339077 ) ) ( not ( = ?auto_339075 ?auto_339078 ) ) ( not ( = ?auto_339075 ?auto_339079 ) ) ( not ( = ?auto_339075 ?auto_339080 ) ) ( not ( = ?auto_339076 ?auto_339077 ) ) ( not ( = ?auto_339076 ?auto_339078 ) ) ( not ( = ?auto_339076 ?auto_339079 ) ) ( not ( = ?auto_339076 ?auto_339080 ) ) ( not ( = ?auto_339077 ?auto_339078 ) ) ( not ( = ?auto_339077 ?auto_339079 ) ) ( not ( = ?auto_339077 ?auto_339080 ) ) ( not ( = ?auto_339078 ?auto_339079 ) ) ( not ( = ?auto_339078 ?auto_339080 ) ) ( not ( = ?auto_339079 ?auto_339080 ) ) ( ON ?auto_339078 ?auto_339079 ) ( ON ?auto_339077 ?auto_339078 ) ( ON ?auto_339076 ?auto_339077 ) ( ON ?auto_339075 ?auto_339076 ) ( ON ?auto_339074 ?auto_339075 ) ( ON ?auto_339073 ?auto_339074 ) ( ON ?auto_339072 ?auto_339073 ) ( ON ?auto_339071 ?auto_339072 ) ( ON ?auto_339070 ?auto_339071 ) ( ON ?auto_339069 ?auto_339070 ) ( ON ?auto_339068 ?auto_339069 ) ( CLEAR ?auto_339066 ) ( ON ?auto_339067 ?auto_339068 ) ( CLEAR ?auto_339067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_339066 ?auto_339067 )
      ( MAKE-14PILE ?auto_339066 ?auto_339067 ?auto_339068 ?auto_339069 ?auto_339070 ?auto_339071 ?auto_339072 ?auto_339073 ?auto_339074 ?auto_339075 ?auto_339076 ?auto_339077 ?auto_339078 ?auto_339079 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_339095 - BLOCK
      ?auto_339096 - BLOCK
      ?auto_339097 - BLOCK
      ?auto_339098 - BLOCK
      ?auto_339099 - BLOCK
      ?auto_339100 - BLOCK
      ?auto_339101 - BLOCK
      ?auto_339102 - BLOCK
      ?auto_339103 - BLOCK
      ?auto_339104 - BLOCK
      ?auto_339105 - BLOCK
      ?auto_339106 - BLOCK
      ?auto_339107 - BLOCK
      ?auto_339108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_339108 ) ( ON-TABLE ?auto_339095 ) ( not ( = ?auto_339095 ?auto_339096 ) ) ( not ( = ?auto_339095 ?auto_339097 ) ) ( not ( = ?auto_339095 ?auto_339098 ) ) ( not ( = ?auto_339095 ?auto_339099 ) ) ( not ( = ?auto_339095 ?auto_339100 ) ) ( not ( = ?auto_339095 ?auto_339101 ) ) ( not ( = ?auto_339095 ?auto_339102 ) ) ( not ( = ?auto_339095 ?auto_339103 ) ) ( not ( = ?auto_339095 ?auto_339104 ) ) ( not ( = ?auto_339095 ?auto_339105 ) ) ( not ( = ?auto_339095 ?auto_339106 ) ) ( not ( = ?auto_339095 ?auto_339107 ) ) ( not ( = ?auto_339095 ?auto_339108 ) ) ( not ( = ?auto_339096 ?auto_339097 ) ) ( not ( = ?auto_339096 ?auto_339098 ) ) ( not ( = ?auto_339096 ?auto_339099 ) ) ( not ( = ?auto_339096 ?auto_339100 ) ) ( not ( = ?auto_339096 ?auto_339101 ) ) ( not ( = ?auto_339096 ?auto_339102 ) ) ( not ( = ?auto_339096 ?auto_339103 ) ) ( not ( = ?auto_339096 ?auto_339104 ) ) ( not ( = ?auto_339096 ?auto_339105 ) ) ( not ( = ?auto_339096 ?auto_339106 ) ) ( not ( = ?auto_339096 ?auto_339107 ) ) ( not ( = ?auto_339096 ?auto_339108 ) ) ( not ( = ?auto_339097 ?auto_339098 ) ) ( not ( = ?auto_339097 ?auto_339099 ) ) ( not ( = ?auto_339097 ?auto_339100 ) ) ( not ( = ?auto_339097 ?auto_339101 ) ) ( not ( = ?auto_339097 ?auto_339102 ) ) ( not ( = ?auto_339097 ?auto_339103 ) ) ( not ( = ?auto_339097 ?auto_339104 ) ) ( not ( = ?auto_339097 ?auto_339105 ) ) ( not ( = ?auto_339097 ?auto_339106 ) ) ( not ( = ?auto_339097 ?auto_339107 ) ) ( not ( = ?auto_339097 ?auto_339108 ) ) ( not ( = ?auto_339098 ?auto_339099 ) ) ( not ( = ?auto_339098 ?auto_339100 ) ) ( not ( = ?auto_339098 ?auto_339101 ) ) ( not ( = ?auto_339098 ?auto_339102 ) ) ( not ( = ?auto_339098 ?auto_339103 ) ) ( not ( = ?auto_339098 ?auto_339104 ) ) ( not ( = ?auto_339098 ?auto_339105 ) ) ( not ( = ?auto_339098 ?auto_339106 ) ) ( not ( = ?auto_339098 ?auto_339107 ) ) ( not ( = ?auto_339098 ?auto_339108 ) ) ( not ( = ?auto_339099 ?auto_339100 ) ) ( not ( = ?auto_339099 ?auto_339101 ) ) ( not ( = ?auto_339099 ?auto_339102 ) ) ( not ( = ?auto_339099 ?auto_339103 ) ) ( not ( = ?auto_339099 ?auto_339104 ) ) ( not ( = ?auto_339099 ?auto_339105 ) ) ( not ( = ?auto_339099 ?auto_339106 ) ) ( not ( = ?auto_339099 ?auto_339107 ) ) ( not ( = ?auto_339099 ?auto_339108 ) ) ( not ( = ?auto_339100 ?auto_339101 ) ) ( not ( = ?auto_339100 ?auto_339102 ) ) ( not ( = ?auto_339100 ?auto_339103 ) ) ( not ( = ?auto_339100 ?auto_339104 ) ) ( not ( = ?auto_339100 ?auto_339105 ) ) ( not ( = ?auto_339100 ?auto_339106 ) ) ( not ( = ?auto_339100 ?auto_339107 ) ) ( not ( = ?auto_339100 ?auto_339108 ) ) ( not ( = ?auto_339101 ?auto_339102 ) ) ( not ( = ?auto_339101 ?auto_339103 ) ) ( not ( = ?auto_339101 ?auto_339104 ) ) ( not ( = ?auto_339101 ?auto_339105 ) ) ( not ( = ?auto_339101 ?auto_339106 ) ) ( not ( = ?auto_339101 ?auto_339107 ) ) ( not ( = ?auto_339101 ?auto_339108 ) ) ( not ( = ?auto_339102 ?auto_339103 ) ) ( not ( = ?auto_339102 ?auto_339104 ) ) ( not ( = ?auto_339102 ?auto_339105 ) ) ( not ( = ?auto_339102 ?auto_339106 ) ) ( not ( = ?auto_339102 ?auto_339107 ) ) ( not ( = ?auto_339102 ?auto_339108 ) ) ( not ( = ?auto_339103 ?auto_339104 ) ) ( not ( = ?auto_339103 ?auto_339105 ) ) ( not ( = ?auto_339103 ?auto_339106 ) ) ( not ( = ?auto_339103 ?auto_339107 ) ) ( not ( = ?auto_339103 ?auto_339108 ) ) ( not ( = ?auto_339104 ?auto_339105 ) ) ( not ( = ?auto_339104 ?auto_339106 ) ) ( not ( = ?auto_339104 ?auto_339107 ) ) ( not ( = ?auto_339104 ?auto_339108 ) ) ( not ( = ?auto_339105 ?auto_339106 ) ) ( not ( = ?auto_339105 ?auto_339107 ) ) ( not ( = ?auto_339105 ?auto_339108 ) ) ( not ( = ?auto_339106 ?auto_339107 ) ) ( not ( = ?auto_339106 ?auto_339108 ) ) ( not ( = ?auto_339107 ?auto_339108 ) ) ( ON ?auto_339107 ?auto_339108 ) ( ON ?auto_339106 ?auto_339107 ) ( ON ?auto_339105 ?auto_339106 ) ( ON ?auto_339104 ?auto_339105 ) ( ON ?auto_339103 ?auto_339104 ) ( ON ?auto_339102 ?auto_339103 ) ( ON ?auto_339101 ?auto_339102 ) ( ON ?auto_339100 ?auto_339101 ) ( ON ?auto_339099 ?auto_339100 ) ( ON ?auto_339098 ?auto_339099 ) ( ON ?auto_339097 ?auto_339098 ) ( CLEAR ?auto_339095 ) ( ON ?auto_339096 ?auto_339097 ) ( CLEAR ?auto_339096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_339095 ?auto_339096 )
      ( MAKE-14PILE ?auto_339095 ?auto_339096 ?auto_339097 ?auto_339098 ?auto_339099 ?auto_339100 ?auto_339101 ?auto_339102 ?auto_339103 ?auto_339104 ?auto_339105 ?auto_339106 ?auto_339107 ?auto_339108 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_339123 - BLOCK
      ?auto_339124 - BLOCK
      ?auto_339125 - BLOCK
      ?auto_339126 - BLOCK
      ?auto_339127 - BLOCK
      ?auto_339128 - BLOCK
      ?auto_339129 - BLOCK
      ?auto_339130 - BLOCK
      ?auto_339131 - BLOCK
      ?auto_339132 - BLOCK
      ?auto_339133 - BLOCK
      ?auto_339134 - BLOCK
      ?auto_339135 - BLOCK
      ?auto_339136 - BLOCK
    )
    :vars
    (
      ?auto_339137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_339136 ?auto_339137 ) ( not ( = ?auto_339123 ?auto_339124 ) ) ( not ( = ?auto_339123 ?auto_339125 ) ) ( not ( = ?auto_339123 ?auto_339126 ) ) ( not ( = ?auto_339123 ?auto_339127 ) ) ( not ( = ?auto_339123 ?auto_339128 ) ) ( not ( = ?auto_339123 ?auto_339129 ) ) ( not ( = ?auto_339123 ?auto_339130 ) ) ( not ( = ?auto_339123 ?auto_339131 ) ) ( not ( = ?auto_339123 ?auto_339132 ) ) ( not ( = ?auto_339123 ?auto_339133 ) ) ( not ( = ?auto_339123 ?auto_339134 ) ) ( not ( = ?auto_339123 ?auto_339135 ) ) ( not ( = ?auto_339123 ?auto_339136 ) ) ( not ( = ?auto_339123 ?auto_339137 ) ) ( not ( = ?auto_339124 ?auto_339125 ) ) ( not ( = ?auto_339124 ?auto_339126 ) ) ( not ( = ?auto_339124 ?auto_339127 ) ) ( not ( = ?auto_339124 ?auto_339128 ) ) ( not ( = ?auto_339124 ?auto_339129 ) ) ( not ( = ?auto_339124 ?auto_339130 ) ) ( not ( = ?auto_339124 ?auto_339131 ) ) ( not ( = ?auto_339124 ?auto_339132 ) ) ( not ( = ?auto_339124 ?auto_339133 ) ) ( not ( = ?auto_339124 ?auto_339134 ) ) ( not ( = ?auto_339124 ?auto_339135 ) ) ( not ( = ?auto_339124 ?auto_339136 ) ) ( not ( = ?auto_339124 ?auto_339137 ) ) ( not ( = ?auto_339125 ?auto_339126 ) ) ( not ( = ?auto_339125 ?auto_339127 ) ) ( not ( = ?auto_339125 ?auto_339128 ) ) ( not ( = ?auto_339125 ?auto_339129 ) ) ( not ( = ?auto_339125 ?auto_339130 ) ) ( not ( = ?auto_339125 ?auto_339131 ) ) ( not ( = ?auto_339125 ?auto_339132 ) ) ( not ( = ?auto_339125 ?auto_339133 ) ) ( not ( = ?auto_339125 ?auto_339134 ) ) ( not ( = ?auto_339125 ?auto_339135 ) ) ( not ( = ?auto_339125 ?auto_339136 ) ) ( not ( = ?auto_339125 ?auto_339137 ) ) ( not ( = ?auto_339126 ?auto_339127 ) ) ( not ( = ?auto_339126 ?auto_339128 ) ) ( not ( = ?auto_339126 ?auto_339129 ) ) ( not ( = ?auto_339126 ?auto_339130 ) ) ( not ( = ?auto_339126 ?auto_339131 ) ) ( not ( = ?auto_339126 ?auto_339132 ) ) ( not ( = ?auto_339126 ?auto_339133 ) ) ( not ( = ?auto_339126 ?auto_339134 ) ) ( not ( = ?auto_339126 ?auto_339135 ) ) ( not ( = ?auto_339126 ?auto_339136 ) ) ( not ( = ?auto_339126 ?auto_339137 ) ) ( not ( = ?auto_339127 ?auto_339128 ) ) ( not ( = ?auto_339127 ?auto_339129 ) ) ( not ( = ?auto_339127 ?auto_339130 ) ) ( not ( = ?auto_339127 ?auto_339131 ) ) ( not ( = ?auto_339127 ?auto_339132 ) ) ( not ( = ?auto_339127 ?auto_339133 ) ) ( not ( = ?auto_339127 ?auto_339134 ) ) ( not ( = ?auto_339127 ?auto_339135 ) ) ( not ( = ?auto_339127 ?auto_339136 ) ) ( not ( = ?auto_339127 ?auto_339137 ) ) ( not ( = ?auto_339128 ?auto_339129 ) ) ( not ( = ?auto_339128 ?auto_339130 ) ) ( not ( = ?auto_339128 ?auto_339131 ) ) ( not ( = ?auto_339128 ?auto_339132 ) ) ( not ( = ?auto_339128 ?auto_339133 ) ) ( not ( = ?auto_339128 ?auto_339134 ) ) ( not ( = ?auto_339128 ?auto_339135 ) ) ( not ( = ?auto_339128 ?auto_339136 ) ) ( not ( = ?auto_339128 ?auto_339137 ) ) ( not ( = ?auto_339129 ?auto_339130 ) ) ( not ( = ?auto_339129 ?auto_339131 ) ) ( not ( = ?auto_339129 ?auto_339132 ) ) ( not ( = ?auto_339129 ?auto_339133 ) ) ( not ( = ?auto_339129 ?auto_339134 ) ) ( not ( = ?auto_339129 ?auto_339135 ) ) ( not ( = ?auto_339129 ?auto_339136 ) ) ( not ( = ?auto_339129 ?auto_339137 ) ) ( not ( = ?auto_339130 ?auto_339131 ) ) ( not ( = ?auto_339130 ?auto_339132 ) ) ( not ( = ?auto_339130 ?auto_339133 ) ) ( not ( = ?auto_339130 ?auto_339134 ) ) ( not ( = ?auto_339130 ?auto_339135 ) ) ( not ( = ?auto_339130 ?auto_339136 ) ) ( not ( = ?auto_339130 ?auto_339137 ) ) ( not ( = ?auto_339131 ?auto_339132 ) ) ( not ( = ?auto_339131 ?auto_339133 ) ) ( not ( = ?auto_339131 ?auto_339134 ) ) ( not ( = ?auto_339131 ?auto_339135 ) ) ( not ( = ?auto_339131 ?auto_339136 ) ) ( not ( = ?auto_339131 ?auto_339137 ) ) ( not ( = ?auto_339132 ?auto_339133 ) ) ( not ( = ?auto_339132 ?auto_339134 ) ) ( not ( = ?auto_339132 ?auto_339135 ) ) ( not ( = ?auto_339132 ?auto_339136 ) ) ( not ( = ?auto_339132 ?auto_339137 ) ) ( not ( = ?auto_339133 ?auto_339134 ) ) ( not ( = ?auto_339133 ?auto_339135 ) ) ( not ( = ?auto_339133 ?auto_339136 ) ) ( not ( = ?auto_339133 ?auto_339137 ) ) ( not ( = ?auto_339134 ?auto_339135 ) ) ( not ( = ?auto_339134 ?auto_339136 ) ) ( not ( = ?auto_339134 ?auto_339137 ) ) ( not ( = ?auto_339135 ?auto_339136 ) ) ( not ( = ?auto_339135 ?auto_339137 ) ) ( not ( = ?auto_339136 ?auto_339137 ) ) ( ON ?auto_339135 ?auto_339136 ) ( ON ?auto_339134 ?auto_339135 ) ( ON ?auto_339133 ?auto_339134 ) ( ON ?auto_339132 ?auto_339133 ) ( ON ?auto_339131 ?auto_339132 ) ( ON ?auto_339130 ?auto_339131 ) ( ON ?auto_339129 ?auto_339130 ) ( ON ?auto_339128 ?auto_339129 ) ( ON ?auto_339127 ?auto_339128 ) ( ON ?auto_339126 ?auto_339127 ) ( ON ?auto_339125 ?auto_339126 ) ( ON ?auto_339124 ?auto_339125 ) ( ON ?auto_339123 ?auto_339124 ) ( CLEAR ?auto_339123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_339123 )
      ( MAKE-14PILE ?auto_339123 ?auto_339124 ?auto_339125 ?auto_339126 ?auto_339127 ?auto_339128 ?auto_339129 ?auto_339130 ?auto_339131 ?auto_339132 ?auto_339133 ?auto_339134 ?auto_339135 ?auto_339136 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_339152 - BLOCK
      ?auto_339153 - BLOCK
      ?auto_339154 - BLOCK
      ?auto_339155 - BLOCK
      ?auto_339156 - BLOCK
      ?auto_339157 - BLOCK
      ?auto_339158 - BLOCK
      ?auto_339159 - BLOCK
      ?auto_339160 - BLOCK
      ?auto_339161 - BLOCK
      ?auto_339162 - BLOCK
      ?auto_339163 - BLOCK
      ?auto_339164 - BLOCK
      ?auto_339165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_339165 ) ( not ( = ?auto_339152 ?auto_339153 ) ) ( not ( = ?auto_339152 ?auto_339154 ) ) ( not ( = ?auto_339152 ?auto_339155 ) ) ( not ( = ?auto_339152 ?auto_339156 ) ) ( not ( = ?auto_339152 ?auto_339157 ) ) ( not ( = ?auto_339152 ?auto_339158 ) ) ( not ( = ?auto_339152 ?auto_339159 ) ) ( not ( = ?auto_339152 ?auto_339160 ) ) ( not ( = ?auto_339152 ?auto_339161 ) ) ( not ( = ?auto_339152 ?auto_339162 ) ) ( not ( = ?auto_339152 ?auto_339163 ) ) ( not ( = ?auto_339152 ?auto_339164 ) ) ( not ( = ?auto_339152 ?auto_339165 ) ) ( not ( = ?auto_339153 ?auto_339154 ) ) ( not ( = ?auto_339153 ?auto_339155 ) ) ( not ( = ?auto_339153 ?auto_339156 ) ) ( not ( = ?auto_339153 ?auto_339157 ) ) ( not ( = ?auto_339153 ?auto_339158 ) ) ( not ( = ?auto_339153 ?auto_339159 ) ) ( not ( = ?auto_339153 ?auto_339160 ) ) ( not ( = ?auto_339153 ?auto_339161 ) ) ( not ( = ?auto_339153 ?auto_339162 ) ) ( not ( = ?auto_339153 ?auto_339163 ) ) ( not ( = ?auto_339153 ?auto_339164 ) ) ( not ( = ?auto_339153 ?auto_339165 ) ) ( not ( = ?auto_339154 ?auto_339155 ) ) ( not ( = ?auto_339154 ?auto_339156 ) ) ( not ( = ?auto_339154 ?auto_339157 ) ) ( not ( = ?auto_339154 ?auto_339158 ) ) ( not ( = ?auto_339154 ?auto_339159 ) ) ( not ( = ?auto_339154 ?auto_339160 ) ) ( not ( = ?auto_339154 ?auto_339161 ) ) ( not ( = ?auto_339154 ?auto_339162 ) ) ( not ( = ?auto_339154 ?auto_339163 ) ) ( not ( = ?auto_339154 ?auto_339164 ) ) ( not ( = ?auto_339154 ?auto_339165 ) ) ( not ( = ?auto_339155 ?auto_339156 ) ) ( not ( = ?auto_339155 ?auto_339157 ) ) ( not ( = ?auto_339155 ?auto_339158 ) ) ( not ( = ?auto_339155 ?auto_339159 ) ) ( not ( = ?auto_339155 ?auto_339160 ) ) ( not ( = ?auto_339155 ?auto_339161 ) ) ( not ( = ?auto_339155 ?auto_339162 ) ) ( not ( = ?auto_339155 ?auto_339163 ) ) ( not ( = ?auto_339155 ?auto_339164 ) ) ( not ( = ?auto_339155 ?auto_339165 ) ) ( not ( = ?auto_339156 ?auto_339157 ) ) ( not ( = ?auto_339156 ?auto_339158 ) ) ( not ( = ?auto_339156 ?auto_339159 ) ) ( not ( = ?auto_339156 ?auto_339160 ) ) ( not ( = ?auto_339156 ?auto_339161 ) ) ( not ( = ?auto_339156 ?auto_339162 ) ) ( not ( = ?auto_339156 ?auto_339163 ) ) ( not ( = ?auto_339156 ?auto_339164 ) ) ( not ( = ?auto_339156 ?auto_339165 ) ) ( not ( = ?auto_339157 ?auto_339158 ) ) ( not ( = ?auto_339157 ?auto_339159 ) ) ( not ( = ?auto_339157 ?auto_339160 ) ) ( not ( = ?auto_339157 ?auto_339161 ) ) ( not ( = ?auto_339157 ?auto_339162 ) ) ( not ( = ?auto_339157 ?auto_339163 ) ) ( not ( = ?auto_339157 ?auto_339164 ) ) ( not ( = ?auto_339157 ?auto_339165 ) ) ( not ( = ?auto_339158 ?auto_339159 ) ) ( not ( = ?auto_339158 ?auto_339160 ) ) ( not ( = ?auto_339158 ?auto_339161 ) ) ( not ( = ?auto_339158 ?auto_339162 ) ) ( not ( = ?auto_339158 ?auto_339163 ) ) ( not ( = ?auto_339158 ?auto_339164 ) ) ( not ( = ?auto_339158 ?auto_339165 ) ) ( not ( = ?auto_339159 ?auto_339160 ) ) ( not ( = ?auto_339159 ?auto_339161 ) ) ( not ( = ?auto_339159 ?auto_339162 ) ) ( not ( = ?auto_339159 ?auto_339163 ) ) ( not ( = ?auto_339159 ?auto_339164 ) ) ( not ( = ?auto_339159 ?auto_339165 ) ) ( not ( = ?auto_339160 ?auto_339161 ) ) ( not ( = ?auto_339160 ?auto_339162 ) ) ( not ( = ?auto_339160 ?auto_339163 ) ) ( not ( = ?auto_339160 ?auto_339164 ) ) ( not ( = ?auto_339160 ?auto_339165 ) ) ( not ( = ?auto_339161 ?auto_339162 ) ) ( not ( = ?auto_339161 ?auto_339163 ) ) ( not ( = ?auto_339161 ?auto_339164 ) ) ( not ( = ?auto_339161 ?auto_339165 ) ) ( not ( = ?auto_339162 ?auto_339163 ) ) ( not ( = ?auto_339162 ?auto_339164 ) ) ( not ( = ?auto_339162 ?auto_339165 ) ) ( not ( = ?auto_339163 ?auto_339164 ) ) ( not ( = ?auto_339163 ?auto_339165 ) ) ( not ( = ?auto_339164 ?auto_339165 ) ) ( ON ?auto_339164 ?auto_339165 ) ( ON ?auto_339163 ?auto_339164 ) ( ON ?auto_339162 ?auto_339163 ) ( ON ?auto_339161 ?auto_339162 ) ( ON ?auto_339160 ?auto_339161 ) ( ON ?auto_339159 ?auto_339160 ) ( ON ?auto_339158 ?auto_339159 ) ( ON ?auto_339157 ?auto_339158 ) ( ON ?auto_339156 ?auto_339157 ) ( ON ?auto_339155 ?auto_339156 ) ( ON ?auto_339154 ?auto_339155 ) ( ON ?auto_339153 ?auto_339154 ) ( ON ?auto_339152 ?auto_339153 ) ( CLEAR ?auto_339152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_339152 )
      ( MAKE-14PILE ?auto_339152 ?auto_339153 ?auto_339154 ?auto_339155 ?auto_339156 ?auto_339157 ?auto_339158 ?auto_339159 ?auto_339160 ?auto_339161 ?auto_339162 ?auto_339163 ?auto_339164 ?auto_339165 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_339180 - BLOCK
      ?auto_339181 - BLOCK
      ?auto_339182 - BLOCK
      ?auto_339183 - BLOCK
      ?auto_339184 - BLOCK
      ?auto_339185 - BLOCK
      ?auto_339186 - BLOCK
      ?auto_339187 - BLOCK
      ?auto_339188 - BLOCK
      ?auto_339189 - BLOCK
      ?auto_339190 - BLOCK
      ?auto_339191 - BLOCK
      ?auto_339192 - BLOCK
      ?auto_339193 - BLOCK
    )
    :vars
    (
      ?auto_339194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_339180 ?auto_339181 ) ) ( not ( = ?auto_339180 ?auto_339182 ) ) ( not ( = ?auto_339180 ?auto_339183 ) ) ( not ( = ?auto_339180 ?auto_339184 ) ) ( not ( = ?auto_339180 ?auto_339185 ) ) ( not ( = ?auto_339180 ?auto_339186 ) ) ( not ( = ?auto_339180 ?auto_339187 ) ) ( not ( = ?auto_339180 ?auto_339188 ) ) ( not ( = ?auto_339180 ?auto_339189 ) ) ( not ( = ?auto_339180 ?auto_339190 ) ) ( not ( = ?auto_339180 ?auto_339191 ) ) ( not ( = ?auto_339180 ?auto_339192 ) ) ( not ( = ?auto_339180 ?auto_339193 ) ) ( not ( = ?auto_339181 ?auto_339182 ) ) ( not ( = ?auto_339181 ?auto_339183 ) ) ( not ( = ?auto_339181 ?auto_339184 ) ) ( not ( = ?auto_339181 ?auto_339185 ) ) ( not ( = ?auto_339181 ?auto_339186 ) ) ( not ( = ?auto_339181 ?auto_339187 ) ) ( not ( = ?auto_339181 ?auto_339188 ) ) ( not ( = ?auto_339181 ?auto_339189 ) ) ( not ( = ?auto_339181 ?auto_339190 ) ) ( not ( = ?auto_339181 ?auto_339191 ) ) ( not ( = ?auto_339181 ?auto_339192 ) ) ( not ( = ?auto_339181 ?auto_339193 ) ) ( not ( = ?auto_339182 ?auto_339183 ) ) ( not ( = ?auto_339182 ?auto_339184 ) ) ( not ( = ?auto_339182 ?auto_339185 ) ) ( not ( = ?auto_339182 ?auto_339186 ) ) ( not ( = ?auto_339182 ?auto_339187 ) ) ( not ( = ?auto_339182 ?auto_339188 ) ) ( not ( = ?auto_339182 ?auto_339189 ) ) ( not ( = ?auto_339182 ?auto_339190 ) ) ( not ( = ?auto_339182 ?auto_339191 ) ) ( not ( = ?auto_339182 ?auto_339192 ) ) ( not ( = ?auto_339182 ?auto_339193 ) ) ( not ( = ?auto_339183 ?auto_339184 ) ) ( not ( = ?auto_339183 ?auto_339185 ) ) ( not ( = ?auto_339183 ?auto_339186 ) ) ( not ( = ?auto_339183 ?auto_339187 ) ) ( not ( = ?auto_339183 ?auto_339188 ) ) ( not ( = ?auto_339183 ?auto_339189 ) ) ( not ( = ?auto_339183 ?auto_339190 ) ) ( not ( = ?auto_339183 ?auto_339191 ) ) ( not ( = ?auto_339183 ?auto_339192 ) ) ( not ( = ?auto_339183 ?auto_339193 ) ) ( not ( = ?auto_339184 ?auto_339185 ) ) ( not ( = ?auto_339184 ?auto_339186 ) ) ( not ( = ?auto_339184 ?auto_339187 ) ) ( not ( = ?auto_339184 ?auto_339188 ) ) ( not ( = ?auto_339184 ?auto_339189 ) ) ( not ( = ?auto_339184 ?auto_339190 ) ) ( not ( = ?auto_339184 ?auto_339191 ) ) ( not ( = ?auto_339184 ?auto_339192 ) ) ( not ( = ?auto_339184 ?auto_339193 ) ) ( not ( = ?auto_339185 ?auto_339186 ) ) ( not ( = ?auto_339185 ?auto_339187 ) ) ( not ( = ?auto_339185 ?auto_339188 ) ) ( not ( = ?auto_339185 ?auto_339189 ) ) ( not ( = ?auto_339185 ?auto_339190 ) ) ( not ( = ?auto_339185 ?auto_339191 ) ) ( not ( = ?auto_339185 ?auto_339192 ) ) ( not ( = ?auto_339185 ?auto_339193 ) ) ( not ( = ?auto_339186 ?auto_339187 ) ) ( not ( = ?auto_339186 ?auto_339188 ) ) ( not ( = ?auto_339186 ?auto_339189 ) ) ( not ( = ?auto_339186 ?auto_339190 ) ) ( not ( = ?auto_339186 ?auto_339191 ) ) ( not ( = ?auto_339186 ?auto_339192 ) ) ( not ( = ?auto_339186 ?auto_339193 ) ) ( not ( = ?auto_339187 ?auto_339188 ) ) ( not ( = ?auto_339187 ?auto_339189 ) ) ( not ( = ?auto_339187 ?auto_339190 ) ) ( not ( = ?auto_339187 ?auto_339191 ) ) ( not ( = ?auto_339187 ?auto_339192 ) ) ( not ( = ?auto_339187 ?auto_339193 ) ) ( not ( = ?auto_339188 ?auto_339189 ) ) ( not ( = ?auto_339188 ?auto_339190 ) ) ( not ( = ?auto_339188 ?auto_339191 ) ) ( not ( = ?auto_339188 ?auto_339192 ) ) ( not ( = ?auto_339188 ?auto_339193 ) ) ( not ( = ?auto_339189 ?auto_339190 ) ) ( not ( = ?auto_339189 ?auto_339191 ) ) ( not ( = ?auto_339189 ?auto_339192 ) ) ( not ( = ?auto_339189 ?auto_339193 ) ) ( not ( = ?auto_339190 ?auto_339191 ) ) ( not ( = ?auto_339190 ?auto_339192 ) ) ( not ( = ?auto_339190 ?auto_339193 ) ) ( not ( = ?auto_339191 ?auto_339192 ) ) ( not ( = ?auto_339191 ?auto_339193 ) ) ( not ( = ?auto_339192 ?auto_339193 ) ) ( ON ?auto_339180 ?auto_339194 ) ( not ( = ?auto_339193 ?auto_339194 ) ) ( not ( = ?auto_339192 ?auto_339194 ) ) ( not ( = ?auto_339191 ?auto_339194 ) ) ( not ( = ?auto_339190 ?auto_339194 ) ) ( not ( = ?auto_339189 ?auto_339194 ) ) ( not ( = ?auto_339188 ?auto_339194 ) ) ( not ( = ?auto_339187 ?auto_339194 ) ) ( not ( = ?auto_339186 ?auto_339194 ) ) ( not ( = ?auto_339185 ?auto_339194 ) ) ( not ( = ?auto_339184 ?auto_339194 ) ) ( not ( = ?auto_339183 ?auto_339194 ) ) ( not ( = ?auto_339182 ?auto_339194 ) ) ( not ( = ?auto_339181 ?auto_339194 ) ) ( not ( = ?auto_339180 ?auto_339194 ) ) ( ON ?auto_339181 ?auto_339180 ) ( ON ?auto_339182 ?auto_339181 ) ( ON ?auto_339183 ?auto_339182 ) ( ON ?auto_339184 ?auto_339183 ) ( ON ?auto_339185 ?auto_339184 ) ( ON ?auto_339186 ?auto_339185 ) ( ON ?auto_339187 ?auto_339186 ) ( ON ?auto_339188 ?auto_339187 ) ( ON ?auto_339189 ?auto_339188 ) ( ON ?auto_339190 ?auto_339189 ) ( ON ?auto_339191 ?auto_339190 ) ( ON ?auto_339192 ?auto_339191 ) ( ON ?auto_339193 ?auto_339192 ) ( CLEAR ?auto_339193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_339193 ?auto_339192 ?auto_339191 ?auto_339190 ?auto_339189 ?auto_339188 ?auto_339187 ?auto_339186 ?auto_339185 ?auto_339184 ?auto_339183 ?auto_339182 ?auto_339181 ?auto_339180 )
      ( MAKE-14PILE ?auto_339180 ?auto_339181 ?auto_339182 ?auto_339183 ?auto_339184 ?auto_339185 ?auto_339186 ?auto_339187 ?auto_339188 ?auto_339189 ?auto_339190 ?auto_339191 ?auto_339192 ?auto_339193 ) )
  )

)

