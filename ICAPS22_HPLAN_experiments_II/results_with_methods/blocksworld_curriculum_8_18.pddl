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
      ?auto_46927 - BLOCK
    )
    :vars
    (
      ?auto_46928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46927 ?auto_46928 ) ( CLEAR ?auto_46927 ) ( HAND-EMPTY ) ( not ( = ?auto_46927 ?auto_46928 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46927 ?auto_46928 )
      ( !PUTDOWN ?auto_46927 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46930 - BLOCK
    )
    :vars
    (
      ?auto_46931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46930 ?auto_46931 ) ( CLEAR ?auto_46930 ) ( HAND-EMPTY ) ( not ( = ?auto_46930 ?auto_46931 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46930 ?auto_46931 )
      ( !PUTDOWN ?auto_46930 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46934 - BLOCK
      ?auto_46935 - BLOCK
    )
    :vars
    (
      ?auto_46936 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46934 ) ( ON ?auto_46935 ?auto_46936 ) ( CLEAR ?auto_46935 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46934 ) ( not ( = ?auto_46934 ?auto_46935 ) ) ( not ( = ?auto_46934 ?auto_46936 ) ) ( not ( = ?auto_46935 ?auto_46936 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46935 ?auto_46936 )
      ( !STACK ?auto_46935 ?auto_46934 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46939 - BLOCK
      ?auto_46940 - BLOCK
    )
    :vars
    (
      ?auto_46941 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46939 ) ( ON ?auto_46940 ?auto_46941 ) ( CLEAR ?auto_46940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46939 ) ( not ( = ?auto_46939 ?auto_46940 ) ) ( not ( = ?auto_46939 ?auto_46941 ) ) ( not ( = ?auto_46940 ?auto_46941 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46940 ?auto_46941 )
      ( !STACK ?auto_46940 ?auto_46939 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46944 - BLOCK
      ?auto_46945 - BLOCK
    )
    :vars
    (
      ?auto_46946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46945 ?auto_46946 ) ( not ( = ?auto_46944 ?auto_46945 ) ) ( not ( = ?auto_46944 ?auto_46946 ) ) ( not ( = ?auto_46945 ?auto_46946 ) ) ( ON ?auto_46944 ?auto_46945 ) ( CLEAR ?auto_46944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46944 )
      ( MAKE-2PILE ?auto_46944 ?auto_46945 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46949 - BLOCK
      ?auto_46950 - BLOCK
    )
    :vars
    (
      ?auto_46951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46950 ?auto_46951 ) ( not ( = ?auto_46949 ?auto_46950 ) ) ( not ( = ?auto_46949 ?auto_46951 ) ) ( not ( = ?auto_46950 ?auto_46951 ) ) ( ON ?auto_46949 ?auto_46950 ) ( CLEAR ?auto_46949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46949 )
      ( MAKE-2PILE ?auto_46949 ?auto_46950 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46955 - BLOCK
      ?auto_46956 - BLOCK
      ?auto_46957 - BLOCK
    )
    :vars
    (
      ?auto_46958 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46956 ) ( ON ?auto_46957 ?auto_46958 ) ( CLEAR ?auto_46957 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46955 ) ( ON ?auto_46956 ?auto_46955 ) ( not ( = ?auto_46955 ?auto_46956 ) ) ( not ( = ?auto_46955 ?auto_46957 ) ) ( not ( = ?auto_46955 ?auto_46958 ) ) ( not ( = ?auto_46956 ?auto_46957 ) ) ( not ( = ?auto_46956 ?auto_46958 ) ) ( not ( = ?auto_46957 ?auto_46958 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46957 ?auto_46958 )
      ( !STACK ?auto_46957 ?auto_46956 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46962 - BLOCK
      ?auto_46963 - BLOCK
      ?auto_46964 - BLOCK
    )
    :vars
    (
      ?auto_46965 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46963 ) ( ON ?auto_46964 ?auto_46965 ) ( CLEAR ?auto_46964 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46962 ) ( ON ?auto_46963 ?auto_46962 ) ( not ( = ?auto_46962 ?auto_46963 ) ) ( not ( = ?auto_46962 ?auto_46964 ) ) ( not ( = ?auto_46962 ?auto_46965 ) ) ( not ( = ?auto_46963 ?auto_46964 ) ) ( not ( = ?auto_46963 ?auto_46965 ) ) ( not ( = ?auto_46964 ?auto_46965 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46964 ?auto_46965 )
      ( !STACK ?auto_46964 ?auto_46963 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46969 - BLOCK
      ?auto_46970 - BLOCK
      ?auto_46971 - BLOCK
    )
    :vars
    (
      ?auto_46972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46971 ?auto_46972 ) ( ON-TABLE ?auto_46969 ) ( not ( = ?auto_46969 ?auto_46970 ) ) ( not ( = ?auto_46969 ?auto_46971 ) ) ( not ( = ?auto_46969 ?auto_46972 ) ) ( not ( = ?auto_46970 ?auto_46971 ) ) ( not ( = ?auto_46970 ?auto_46972 ) ) ( not ( = ?auto_46971 ?auto_46972 ) ) ( CLEAR ?auto_46969 ) ( ON ?auto_46970 ?auto_46971 ) ( CLEAR ?auto_46970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46969 ?auto_46970 )
      ( MAKE-3PILE ?auto_46969 ?auto_46970 ?auto_46971 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46976 - BLOCK
      ?auto_46977 - BLOCK
      ?auto_46978 - BLOCK
    )
    :vars
    (
      ?auto_46979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46978 ?auto_46979 ) ( ON-TABLE ?auto_46976 ) ( not ( = ?auto_46976 ?auto_46977 ) ) ( not ( = ?auto_46976 ?auto_46978 ) ) ( not ( = ?auto_46976 ?auto_46979 ) ) ( not ( = ?auto_46977 ?auto_46978 ) ) ( not ( = ?auto_46977 ?auto_46979 ) ) ( not ( = ?auto_46978 ?auto_46979 ) ) ( CLEAR ?auto_46976 ) ( ON ?auto_46977 ?auto_46978 ) ( CLEAR ?auto_46977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46976 ?auto_46977 )
      ( MAKE-3PILE ?auto_46976 ?auto_46977 ?auto_46978 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46983 - BLOCK
      ?auto_46984 - BLOCK
      ?auto_46985 - BLOCK
    )
    :vars
    (
      ?auto_46986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46985 ?auto_46986 ) ( not ( = ?auto_46983 ?auto_46984 ) ) ( not ( = ?auto_46983 ?auto_46985 ) ) ( not ( = ?auto_46983 ?auto_46986 ) ) ( not ( = ?auto_46984 ?auto_46985 ) ) ( not ( = ?auto_46984 ?auto_46986 ) ) ( not ( = ?auto_46985 ?auto_46986 ) ) ( ON ?auto_46984 ?auto_46985 ) ( ON ?auto_46983 ?auto_46984 ) ( CLEAR ?auto_46983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46983 )
      ( MAKE-3PILE ?auto_46983 ?auto_46984 ?auto_46985 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46990 - BLOCK
      ?auto_46991 - BLOCK
      ?auto_46992 - BLOCK
    )
    :vars
    (
      ?auto_46993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46992 ?auto_46993 ) ( not ( = ?auto_46990 ?auto_46991 ) ) ( not ( = ?auto_46990 ?auto_46992 ) ) ( not ( = ?auto_46990 ?auto_46993 ) ) ( not ( = ?auto_46991 ?auto_46992 ) ) ( not ( = ?auto_46991 ?auto_46993 ) ) ( not ( = ?auto_46992 ?auto_46993 ) ) ( ON ?auto_46991 ?auto_46992 ) ( ON ?auto_46990 ?auto_46991 ) ( CLEAR ?auto_46990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46990 )
      ( MAKE-3PILE ?auto_46990 ?auto_46991 ?auto_46992 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46998 - BLOCK
      ?auto_46999 - BLOCK
      ?auto_47000 - BLOCK
      ?auto_47001 - BLOCK
    )
    :vars
    (
      ?auto_47002 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47000 ) ( ON ?auto_47001 ?auto_47002 ) ( CLEAR ?auto_47001 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46998 ) ( ON ?auto_46999 ?auto_46998 ) ( ON ?auto_47000 ?auto_46999 ) ( not ( = ?auto_46998 ?auto_46999 ) ) ( not ( = ?auto_46998 ?auto_47000 ) ) ( not ( = ?auto_46998 ?auto_47001 ) ) ( not ( = ?auto_46998 ?auto_47002 ) ) ( not ( = ?auto_46999 ?auto_47000 ) ) ( not ( = ?auto_46999 ?auto_47001 ) ) ( not ( = ?auto_46999 ?auto_47002 ) ) ( not ( = ?auto_47000 ?auto_47001 ) ) ( not ( = ?auto_47000 ?auto_47002 ) ) ( not ( = ?auto_47001 ?auto_47002 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47001 ?auto_47002 )
      ( !STACK ?auto_47001 ?auto_47000 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47007 - BLOCK
      ?auto_47008 - BLOCK
      ?auto_47009 - BLOCK
      ?auto_47010 - BLOCK
    )
    :vars
    (
      ?auto_47011 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47009 ) ( ON ?auto_47010 ?auto_47011 ) ( CLEAR ?auto_47010 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47007 ) ( ON ?auto_47008 ?auto_47007 ) ( ON ?auto_47009 ?auto_47008 ) ( not ( = ?auto_47007 ?auto_47008 ) ) ( not ( = ?auto_47007 ?auto_47009 ) ) ( not ( = ?auto_47007 ?auto_47010 ) ) ( not ( = ?auto_47007 ?auto_47011 ) ) ( not ( = ?auto_47008 ?auto_47009 ) ) ( not ( = ?auto_47008 ?auto_47010 ) ) ( not ( = ?auto_47008 ?auto_47011 ) ) ( not ( = ?auto_47009 ?auto_47010 ) ) ( not ( = ?auto_47009 ?auto_47011 ) ) ( not ( = ?auto_47010 ?auto_47011 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47010 ?auto_47011 )
      ( !STACK ?auto_47010 ?auto_47009 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47016 - BLOCK
      ?auto_47017 - BLOCK
      ?auto_47018 - BLOCK
      ?auto_47019 - BLOCK
    )
    :vars
    (
      ?auto_47020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47019 ?auto_47020 ) ( ON-TABLE ?auto_47016 ) ( ON ?auto_47017 ?auto_47016 ) ( not ( = ?auto_47016 ?auto_47017 ) ) ( not ( = ?auto_47016 ?auto_47018 ) ) ( not ( = ?auto_47016 ?auto_47019 ) ) ( not ( = ?auto_47016 ?auto_47020 ) ) ( not ( = ?auto_47017 ?auto_47018 ) ) ( not ( = ?auto_47017 ?auto_47019 ) ) ( not ( = ?auto_47017 ?auto_47020 ) ) ( not ( = ?auto_47018 ?auto_47019 ) ) ( not ( = ?auto_47018 ?auto_47020 ) ) ( not ( = ?auto_47019 ?auto_47020 ) ) ( CLEAR ?auto_47017 ) ( ON ?auto_47018 ?auto_47019 ) ( CLEAR ?auto_47018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47016 ?auto_47017 ?auto_47018 )
      ( MAKE-4PILE ?auto_47016 ?auto_47017 ?auto_47018 ?auto_47019 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47025 - BLOCK
      ?auto_47026 - BLOCK
      ?auto_47027 - BLOCK
      ?auto_47028 - BLOCK
    )
    :vars
    (
      ?auto_47029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47028 ?auto_47029 ) ( ON-TABLE ?auto_47025 ) ( ON ?auto_47026 ?auto_47025 ) ( not ( = ?auto_47025 ?auto_47026 ) ) ( not ( = ?auto_47025 ?auto_47027 ) ) ( not ( = ?auto_47025 ?auto_47028 ) ) ( not ( = ?auto_47025 ?auto_47029 ) ) ( not ( = ?auto_47026 ?auto_47027 ) ) ( not ( = ?auto_47026 ?auto_47028 ) ) ( not ( = ?auto_47026 ?auto_47029 ) ) ( not ( = ?auto_47027 ?auto_47028 ) ) ( not ( = ?auto_47027 ?auto_47029 ) ) ( not ( = ?auto_47028 ?auto_47029 ) ) ( CLEAR ?auto_47026 ) ( ON ?auto_47027 ?auto_47028 ) ( CLEAR ?auto_47027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47025 ?auto_47026 ?auto_47027 )
      ( MAKE-4PILE ?auto_47025 ?auto_47026 ?auto_47027 ?auto_47028 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47034 - BLOCK
      ?auto_47035 - BLOCK
      ?auto_47036 - BLOCK
      ?auto_47037 - BLOCK
    )
    :vars
    (
      ?auto_47038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47037 ?auto_47038 ) ( ON-TABLE ?auto_47034 ) ( not ( = ?auto_47034 ?auto_47035 ) ) ( not ( = ?auto_47034 ?auto_47036 ) ) ( not ( = ?auto_47034 ?auto_47037 ) ) ( not ( = ?auto_47034 ?auto_47038 ) ) ( not ( = ?auto_47035 ?auto_47036 ) ) ( not ( = ?auto_47035 ?auto_47037 ) ) ( not ( = ?auto_47035 ?auto_47038 ) ) ( not ( = ?auto_47036 ?auto_47037 ) ) ( not ( = ?auto_47036 ?auto_47038 ) ) ( not ( = ?auto_47037 ?auto_47038 ) ) ( ON ?auto_47036 ?auto_47037 ) ( CLEAR ?auto_47034 ) ( ON ?auto_47035 ?auto_47036 ) ( CLEAR ?auto_47035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47034 ?auto_47035 )
      ( MAKE-4PILE ?auto_47034 ?auto_47035 ?auto_47036 ?auto_47037 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47043 - BLOCK
      ?auto_47044 - BLOCK
      ?auto_47045 - BLOCK
      ?auto_47046 - BLOCK
    )
    :vars
    (
      ?auto_47047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47046 ?auto_47047 ) ( ON-TABLE ?auto_47043 ) ( not ( = ?auto_47043 ?auto_47044 ) ) ( not ( = ?auto_47043 ?auto_47045 ) ) ( not ( = ?auto_47043 ?auto_47046 ) ) ( not ( = ?auto_47043 ?auto_47047 ) ) ( not ( = ?auto_47044 ?auto_47045 ) ) ( not ( = ?auto_47044 ?auto_47046 ) ) ( not ( = ?auto_47044 ?auto_47047 ) ) ( not ( = ?auto_47045 ?auto_47046 ) ) ( not ( = ?auto_47045 ?auto_47047 ) ) ( not ( = ?auto_47046 ?auto_47047 ) ) ( ON ?auto_47045 ?auto_47046 ) ( CLEAR ?auto_47043 ) ( ON ?auto_47044 ?auto_47045 ) ( CLEAR ?auto_47044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47043 ?auto_47044 )
      ( MAKE-4PILE ?auto_47043 ?auto_47044 ?auto_47045 ?auto_47046 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47052 - BLOCK
      ?auto_47053 - BLOCK
      ?auto_47054 - BLOCK
      ?auto_47055 - BLOCK
    )
    :vars
    (
      ?auto_47056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47055 ?auto_47056 ) ( not ( = ?auto_47052 ?auto_47053 ) ) ( not ( = ?auto_47052 ?auto_47054 ) ) ( not ( = ?auto_47052 ?auto_47055 ) ) ( not ( = ?auto_47052 ?auto_47056 ) ) ( not ( = ?auto_47053 ?auto_47054 ) ) ( not ( = ?auto_47053 ?auto_47055 ) ) ( not ( = ?auto_47053 ?auto_47056 ) ) ( not ( = ?auto_47054 ?auto_47055 ) ) ( not ( = ?auto_47054 ?auto_47056 ) ) ( not ( = ?auto_47055 ?auto_47056 ) ) ( ON ?auto_47054 ?auto_47055 ) ( ON ?auto_47053 ?auto_47054 ) ( ON ?auto_47052 ?auto_47053 ) ( CLEAR ?auto_47052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47052 )
      ( MAKE-4PILE ?auto_47052 ?auto_47053 ?auto_47054 ?auto_47055 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47061 - BLOCK
      ?auto_47062 - BLOCK
      ?auto_47063 - BLOCK
      ?auto_47064 - BLOCK
    )
    :vars
    (
      ?auto_47065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47064 ?auto_47065 ) ( not ( = ?auto_47061 ?auto_47062 ) ) ( not ( = ?auto_47061 ?auto_47063 ) ) ( not ( = ?auto_47061 ?auto_47064 ) ) ( not ( = ?auto_47061 ?auto_47065 ) ) ( not ( = ?auto_47062 ?auto_47063 ) ) ( not ( = ?auto_47062 ?auto_47064 ) ) ( not ( = ?auto_47062 ?auto_47065 ) ) ( not ( = ?auto_47063 ?auto_47064 ) ) ( not ( = ?auto_47063 ?auto_47065 ) ) ( not ( = ?auto_47064 ?auto_47065 ) ) ( ON ?auto_47063 ?auto_47064 ) ( ON ?auto_47062 ?auto_47063 ) ( ON ?auto_47061 ?auto_47062 ) ( CLEAR ?auto_47061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47061 )
      ( MAKE-4PILE ?auto_47061 ?auto_47062 ?auto_47063 ?auto_47064 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47071 - BLOCK
      ?auto_47072 - BLOCK
      ?auto_47073 - BLOCK
      ?auto_47074 - BLOCK
      ?auto_47075 - BLOCK
    )
    :vars
    (
      ?auto_47076 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47074 ) ( ON ?auto_47075 ?auto_47076 ) ( CLEAR ?auto_47075 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47071 ) ( ON ?auto_47072 ?auto_47071 ) ( ON ?auto_47073 ?auto_47072 ) ( ON ?auto_47074 ?auto_47073 ) ( not ( = ?auto_47071 ?auto_47072 ) ) ( not ( = ?auto_47071 ?auto_47073 ) ) ( not ( = ?auto_47071 ?auto_47074 ) ) ( not ( = ?auto_47071 ?auto_47075 ) ) ( not ( = ?auto_47071 ?auto_47076 ) ) ( not ( = ?auto_47072 ?auto_47073 ) ) ( not ( = ?auto_47072 ?auto_47074 ) ) ( not ( = ?auto_47072 ?auto_47075 ) ) ( not ( = ?auto_47072 ?auto_47076 ) ) ( not ( = ?auto_47073 ?auto_47074 ) ) ( not ( = ?auto_47073 ?auto_47075 ) ) ( not ( = ?auto_47073 ?auto_47076 ) ) ( not ( = ?auto_47074 ?auto_47075 ) ) ( not ( = ?auto_47074 ?auto_47076 ) ) ( not ( = ?auto_47075 ?auto_47076 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47075 ?auto_47076 )
      ( !STACK ?auto_47075 ?auto_47074 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47082 - BLOCK
      ?auto_47083 - BLOCK
      ?auto_47084 - BLOCK
      ?auto_47085 - BLOCK
      ?auto_47086 - BLOCK
    )
    :vars
    (
      ?auto_47087 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47085 ) ( ON ?auto_47086 ?auto_47087 ) ( CLEAR ?auto_47086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47082 ) ( ON ?auto_47083 ?auto_47082 ) ( ON ?auto_47084 ?auto_47083 ) ( ON ?auto_47085 ?auto_47084 ) ( not ( = ?auto_47082 ?auto_47083 ) ) ( not ( = ?auto_47082 ?auto_47084 ) ) ( not ( = ?auto_47082 ?auto_47085 ) ) ( not ( = ?auto_47082 ?auto_47086 ) ) ( not ( = ?auto_47082 ?auto_47087 ) ) ( not ( = ?auto_47083 ?auto_47084 ) ) ( not ( = ?auto_47083 ?auto_47085 ) ) ( not ( = ?auto_47083 ?auto_47086 ) ) ( not ( = ?auto_47083 ?auto_47087 ) ) ( not ( = ?auto_47084 ?auto_47085 ) ) ( not ( = ?auto_47084 ?auto_47086 ) ) ( not ( = ?auto_47084 ?auto_47087 ) ) ( not ( = ?auto_47085 ?auto_47086 ) ) ( not ( = ?auto_47085 ?auto_47087 ) ) ( not ( = ?auto_47086 ?auto_47087 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47086 ?auto_47087 )
      ( !STACK ?auto_47086 ?auto_47085 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47093 - BLOCK
      ?auto_47094 - BLOCK
      ?auto_47095 - BLOCK
      ?auto_47096 - BLOCK
      ?auto_47097 - BLOCK
    )
    :vars
    (
      ?auto_47098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47097 ?auto_47098 ) ( ON-TABLE ?auto_47093 ) ( ON ?auto_47094 ?auto_47093 ) ( ON ?auto_47095 ?auto_47094 ) ( not ( = ?auto_47093 ?auto_47094 ) ) ( not ( = ?auto_47093 ?auto_47095 ) ) ( not ( = ?auto_47093 ?auto_47096 ) ) ( not ( = ?auto_47093 ?auto_47097 ) ) ( not ( = ?auto_47093 ?auto_47098 ) ) ( not ( = ?auto_47094 ?auto_47095 ) ) ( not ( = ?auto_47094 ?auto_47096 ) ) ( not ( = ?auto_47094 ?auto_47097 ) ) ( not ( = ?auto_47094 ?auto_47098 ) ) ( not ( = ?auto_47095 ?auto_47096 ) ) ( not ( = ?auto_47095 ?auto_47097 ) ) ( not ( = ?auto_47095 ?auto_47098 ) ) ( not ( = ?auto_47096 ?auto_47097 ) ) ( not ( = ?auto_47096 ?auto_47098 ) ) ( not ( = ?auto_47097 ?auto_47098 ) ) ( CLEAR ?auto_47095 ) ( ON ?auto_47096 ?auto_47097 ) ( CLEAR ?auto_47096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47093 ?auto_47094 ?auto_47095 ?auto_47096 )
      ( MAKE-5PILE ?auto_47093 ?auto_47094 ?auto_47095 ?auto_47096 ?auto_47097 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47104 - BLOCK
      ?auto_47105 - BLOCK
      ?auto_47106 - BLOCK
      ?auto_47107 - BLOCK
      ?auto_47108 - BLOCK
    )
    :vars
    (
      ?auto_47109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47108 ?auto_47109 ) ( ON-TABLE ?auto_47104 ) ( ON ?auto_47105 ?auto_47104 ) ( ON ?auto_47106 ?auto_47105 ) ( not ( = ?auto_47104 ?auto_47105 ) ) ( not ( = ?auto_47104 ?auto_47106 ) ) ( not ( = ?auto_47104 ?auto_47107 ) ) ( not ( = ?auto_47104 ?auto_47108 ) ) ( not ( = ?auto_47104 ?auto_47109 ) ) ( not ( = ?auto_47105 ?auto_47106 ) ) ( not ( = ?auto_47105 ?auto_47107 ) ) ( not ( = ?auto_47105 ?auto_47108 ) ) ( not ( = ?auto_47105 ?auto_47109 ) ) ( not ( = ?auto_47106 ?auto_47107 ) ) ( not ( = ?auto_47106 ?auto_47108 ) ) ( not ( = ?auto_47106 ?auto_47109 ) ) ( not ( = ?auto_47107 ?auto_47108 ) ) ( not ( = ?auto_47107 ?auto_47109 ) ) ( not ( = ?auto_47108 ?auto_47109 ) ) ( CLEAR ?auto_47106 ) ( ON ?auto_47107 ?auto_47108 ) ( CLEAR ?auto_47107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47104 ?auto_47105 ?auto_47106 ?auto_47107 )
      ( MAKE-5PILE ?auto_47104 ?auto_47105 ?auto_47106 ?auto_47107 ?auto_47108 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47115 - BLOCK
      ?auto_47116 - BLOCK
      ?auto_47117 - BLOCK
      ?auto_47118 - BLOCK
      ?auto_47119 - BLOCK
    )
    :vars
    (
      ?auto_47120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47119 ?auto_47120 ) ( ON-TABLE ?auto_47115 ) ( ON ?auto_47116 ?auto_47115 ) ( not ( = ?auto_47115 ?auto_47116 ) ) ( not ( = ?auto_47115 ?auto_47117 ) ) ( not ( = ?auto_47115 ?auto_47118 ) ) ( not ( = ?auto_47115 ?auto_47119 ) ) ( not ( = ?auto_47115 ?auto_47120 ) ) ( not ( = ?auto_47116 ?auto_47117 ) ) ( not ( = ?auto_47116 ?auto_47118 ) ) ( not ( = ?auto_47116 ?auto_47119 ) ) ( not ( = ?auto_47116 ?auto_47120 ) ) ( not ( = ?auto_47117 ?auto_47118 ) ) ( not ( = ?auto_47117 ?auto_47119 ) ) ( not ( = ?auto_47117 ?auto_47120 ) ) ( not ( = ?auto_47118 ?auto_47119 ) ) ( not ( = ?auto_47118 ?auto_47120 ) ) ( not ( = ?auto_47119 ?auto_47120 ) ) ( ON ?auto_47118 ?auto_47119 ) ( CLEAR ?auto_47116 ) ( ON ?auto_47117 ?auto_47118 ) ( CLEAR ?auto_47117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47115 ?auto_47116 ?auto_47117 )
      ( MAKE-5PILE ?auto_47115 ?auto_47116 ?auto_47117 ?auto_47118 ?auto_47119 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47126 - BLOCK
      ?auto_47127 - BLOCK
      ?auto_47128 - BLOCK
      ?auto_47129 - BLOCK
      ?auto_47130 - BLOCK
    )
    :vars
    (
      ?auto_47131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47130 ?auto_47131 ) ( ON-TABLE ?auto_47126 ) ( ON ?auto_47127 ?auto_47126 ) ( not ( = ?auto_47126 ?auto_47127 ) ) ( not ( = ?auto_47126 ?auto_47128 ) ) ( not ( = ?auto_47126 ?auto_47129 ) ) ( not ( = ?auto_47126 ?auto_47130 ) ) ( not ( = ?auto_47126 ?auto_47131 ) ) ( not ( = ?auto_47127 ?auto_47128 ) ) ( not ( = ?auto_47127 ?auto_47129 ) ) ( not ( = ?auto_47127 ?auto_47130 ) ) ( not ( = ?auto_47127 ?auto_47131 ) ) ( not ( = ?auto_47128 ?auto_47129 ) ) ( not ( = ?auto_47128 ?auto_47130 ) ) ( not ( = ?auto_47128 ?auto_47131 ) ) ( not ( = ?auto_47129 ?auto_47130 ) ) ( not ( = ?auto_47129 ?auto_47131 ) ) ( not ( = ?auto_47130 ?auto_47131 ) ) ( ON ?auto_47129 ?auto_47130 ) ( CLEAR ?auto_47127 ) ( ON ?auto_47128 ?auto_47129 ) ( CLEAR ?auto_47128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47126 ?auto_47127 ?auto_47128 )
      ( MAKE-5PILE ?auto_47126 ?auto_47127 ?auto_47128 ?auto_47129 ?auto_47130 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47137 - BLOCK
      ?auto_47138 - BLOCK
      ?auto_47139 - BLOCK
      ?auto_47140 - BLOCK
      ?auto_47141 - BLOCK
    )
    :vars
    (
      ?auto_47142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47141 ?auto_47142 ) ( ON-TABLE ?auto_47137 ) ( not ( = ?auto_47137 ?auto_47138 ) ) ( not ( = ?auto_47137 ?auto_47139 ) ) ( not ( = ?auto_47137 ?auto_47140 ) ) ( not ( = ?auto_47137 ?auto_47141 ) ) ( not ( = ?auto_47137 ?auto_47142 ) ) ( not ( = ?auto_47138 ?auto_47139 ) ) ( not ( = ?auto_47138 ?auto_47140 ) ) ( not ( = ?auto_47138 ?auto_47141 ) ) ( not ( = ?auto_47138 ?auto_47142 ) ) ( not ( = ?auto_47139 ?auto_47140 ) ) ( not ( = ?auto_47139 ?auto_47141 ) ) ( not ( = ?auto_47139 ?auto_47142 ) ) ( not ( = ?auto_47140 ?auto_47141 ) ) ( not ( = ?auto_47140 ?auto_47142 ) ) ( not ( = ?auto_47141 ?auto_47142 ) ) ( ON ?auto_47140 ?auto_47141 ) ( ON ?auto_47139 ?auto_47140 ) ( CLEAR ?auto_47137 ) ( ON ?auto_47138 ?auto_47139 ) ( CLEAR ?auto_47138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47137 ?auto_47138 )
      ( MAKE-5PILE ?auto_47137 ?auto_47138 ?auto_47139 ?auto_47140 ?auto_47141 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47148 - BLOCK
      ?auto_47149 - BLOCK
      ?auto_47150 - BLOCK
      ?auto_47151 - BLOCK
      ?auto_47152 - BLOCK
    )
    :vars
    (
      ?auto_47153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47152 ?auto_47153 ) ( ON-TABLE ?auto_47148 ) ( not ( = ?auto_47148 ?auto_47149 ) ) ( not ( = ?auto_47148 ?auto_47150 ) ) ( not ( = ?auto_47148 ?auto_47151 ) ) ( not ( = ?auto_47148 ?auto_47152 ) ) ( not ( = ?auto_47148 ?auto_47153 ) ) ( not ( = ?auto_47149 ?auto_47150 ) ) ( not ( = ?auto_47149 ?auto_47151 ) ) ( not ( = ?auto_47149 ?auto_47152 ) ) ( not ( = ?auto_47149 ?auto_47153 ) ) ( not ( = ?auto_47150 ?auto_47151 ) ) ( not ( = ?auto_47150 ?auto_47152 ) ) ( not ( = ?auto_47150 ?auto_47153 ) ) ( not ( = ?auto_47151 ?auto_47152 ) ) ( not ( = ?auto_47151 ?auto_47153 ) ) ( not ( = ?auto_47152 ?auto_47153 ) ) ( ON ?auto_47151 ?auto_47152 ) ( ON ?auto_47150 ?auto_47151 ) ( CLEAR ?auto_47148 ) ( ON ?auto_47149 ?auto_47150 ) ( CLEAR ?auto_47149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47148 ?auto_47149 )
      ( MAKE-5PILE ?auto_47148 ?auto_47149 ?auto_47150 ?auto_47151 ?auto_47152 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47159 - BLOCK
      ?auto_47160 - BLOCK
      ?auto_47161 - BLOCK
      ?auto_47162 - BLOCK
      ?auto_47163 - BLOCK
    )
    :vars
    (
      ?auto_47164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47163 ?auto_47164 ) ( not ( = ?auto_47159 ?auto_47160 ) ) ( not ( = ?auto_47159 ?auto_47161 ) ) ( not ( = ?auto_47159 ?auto_47162 ) ) ( not ( = ?auto_47159 ?auto_47163 ) ) ( not ( = ?auto_47159 ?auto_47164 ) ) ( not ( = ?auto_47160 ?auto_47161 ) ) ( not ( = ?auto_47160 ?auto_47162 ) ) ( not ( = ?auto_47160 ?auto_47163 ) ) ( not ( = ?auto_47160 ?auto_47164 ) ) ( not ( = ?auto_47161 ?auto_47162 ) ) ( not ( = ?auto_47161 ?auto_47163 ) ) ( not ( = ?auto_47161 ?auto_47164 ) ) ( not ( = ?auto_47162 ?auto_47163 ) ) ( not ( = ?auto_47162 ?auto_47164 ) ) ( not ( = ?auto_47163 ?auto_47164 ) ) ( ON ?auto_47162 ?auto_47163 ) ( ON ?auto_47161 ?auto_47162 ) ( ON ?auto_47160 ?auto_47161 ) ( ON ?auto_47159 ?auto_47160 ) ( CLEAR ?auto_47159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47159 )
      ( MAKE-5PILE ?auto_47159 ?auto_47160 ?auto_47161 ?auto_47162 ?auto_47163 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47170 - BLOCK
      ?auto_47171 - BLOCK
      ?auto_47172 - BLOCK
      ?auto_47173 - BLOCK
      ?auto_47174 - BLOCK
    )
    :vars
    (
      ?auto_47175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47174 ?auto_47175 ) ( not ( = ?auto_47170 ?auto_47171 ) ) ( not ( = ?auto_47170 ?auto_47172 ) ) ( not ( = ?auto_47170 ?auto_47173 ) ) ( not ( = ?auto_47170 ?auto_47174 ) ) ( not ( = ?auto_47170 ?auto_47175 ) ) ( not ( = ?auto_47171 ?auto_47172 ) ) ( not ( = ?auto_47171 ?auto_47173 ) ) ( not ( = ?auto_47171 ?auto_47174 ) ) ( not ( = ?auto_47171 ?auto_47175 ) ) ( not ( = ?auto_47172 ?auto_47173 ) ) ( not ( = ?auto_47172 ?auto_47174 ) ) ( not ( = ?auto_47172 ?auto_47175 ) ) ( not ( = ?auto_47173 ?auto_47174 ) ) ( not ( = ?auto_47173 ?auto_47175 ) ) ( not ( = ?auto_47174 ?auto_47175 ) ) ( ON ?auto_47173 ?auto_47174 ) ( ON ?auto_47172 ?auto_47173 ) ( ON ?auto_47171 ?auto_47172 ) ( ON ?auto_47170 ?auto_47171 ) ( CLEAR ?auto_47170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47170 )
      ( MAKE-5PILE ?auto_47170 ?auto_47171 ?auto_47172 ?auto_47173 ?auto_47174 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47182 - BLOCK
      ?auto_47183 - BLOCK
      ?auto_47184 - BLOCK
      ?auto_47185 - BLOCK
      ?auto_47186 - BLOCK
      ?auto_47187 - BLOCK
    )
    :vars
    (
      ?auto_47188 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47186 ) ( ON ?auto_47187 ?auto_47188 ) ( CLEAR ?auto_47187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47182 ) ( ON ?auto_47183 ?auto_47182 ) ( ON ?auto_47184 ?auto_47183 ) ( ON ?auto_47185 ?auto_47184 ) ( ON ?auto_47186 ?auto_47185 ) ( not ( = ?auto_47182 ?auto_47183 ) ) ( not ( = ?auto_47182 ?auto_47184 ) ) ( not ( = ?auto_47182 ?auto_47185 ) ) ( not ( = ?auto_47182 ?auto_47186 ) ) ( not ( = ?auto_47182 ?auto_47187 ) ) ( not ( = ?auto_47182 ?auto_47188 ) ) ( not ( = ?auto_47183 ?auto_47184 ) ) ( not ( = ?auto_47183 ?auto_47185 ) ) ( not ( = ?auto_47183 ?auto_47186 ) ) ( not ( = ?auto_47183 ?auto_47187 ) ) ( not ( = ?auto_47183 ?auto_47188 ) ) ( not ( = ?auto_47184 ?auto_47185 ) ) ( not ( = ?auto_47184 ?auto_47186 ) ) ( not ( = ?auto_47184 ?auto_47187 ) ) ( not ( = ?auto_47184 ?auto_47188 ) ) ( not ( = ?auto_47185 ?auto_47186 ) ) ( not ( = ?auto_47185 ?auto_47187 ) ) ( not ( = ?auto_47185 ?auto_47188 ) ) ( not ( = ?auto_47186 ?auto_47187 ) ) ( not ( = ?auto_47186 ?auto_47188 ) ) ( not ( = ?auto_47187 ?auto_47188 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47187 ?auto_47188 )
      ( !STACK ?auto_47187 ?auto_47186 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47195 - BLOCK
      ?auto_47196 - BLOCK
      ?auto_47197 - BLOCK
      ?auto_47198 - BLOCK
      ?auto_47199 - BLOCK
      ?auto_47200 - BLOCK
    )
    :vars
    (
      ?auto_47201 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47199 ) ( ON ?auto_47200 ?auto_47201 ) ( CLEAR ?auto_47200 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47195 ) ( ON ?auto_47196 ?auto_47195 ) ( ON ?auto_47197 ?auto_47196 ) ( ON ?auto_47198 ?auto_47197 ) ( ON ?auto_47199 ?auto_47198 ) ( not ( = ?auto_47195 ?auto_47196 ) ) ( not ( = ?auto_47195 ?auto_47197 ) ) ( not ( = ?auto_47195 ?auto_47198 ) ) ( not ( = ?auto_47195 ?auto_47199 ) ) ( not ( = ?auto_47195 ?auto_47200 ) ) ( not ( = ?auto_47195 ?auto_47201 ) ) ( not ( = ?auto_47196 ?auto_47197 ) ) ( not ( = ?auto_47196 ?auto_47198 ) ) ( not ( = ?auto_47196 ?auto_47199 ) ) ( not ( = ?auto_47196 ?auto_47200 ) ) ( not ( = ?auto_47196 ?auto_47201 ) ) ( not ( = ?auto_47197 ?auto_47198 ) ) ( not ( = ?auto_47197 ?auto_47199 ) ) ( not ( = ?auto_47197 ?auto_47200 ) ) ( not ( = ?auto_47197 ?auto_47201 ) ) ( not ( = ?auto_47198 ?auto_47199 ) ) ( not ( = ?auto_47198 ?auto_47200 ) ) ( not ( = ?auto_47198 ?auto_47201 ) ) ( not ( = ?auto_47199 ?auto_47200 ) ) ( not ( = ?auto_47199 ?auto_47201 ) ) ( not ( = ?auto_47200 ?auto_47201 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47200 ?auto_47201 )
      ( !STACK ?auto_47200 ?auto_47199 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47208 - BLOCK
      ?auto_47209 - BLOCK
      ?auto_47210 - BLOCK
      ?auto_47211 - BLOCK
      ?auto_47212 - BLOCK
      ?auto_47213 - BLOCK
    )
    :vars
    (
      ?auto_47214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47213 ?auto_47214 ) ( ON-TABLE ?auto_47208 ) ( ON ?auto_47209 ?auto_47208 ) ( ON ?auto_47210 ?auto_47209 ) ( ON ?auto_47211 ?auto_47210 ) ( not ( = ?auto_47208 ?auto_47209 ) ) ( not ( = ?auto_47208 ?auto_47210 ) ) ( not ( = ?auto_47208 ?auto_47211 ) ) ( not ( = ?auto_47208 ?auto_47212 ) ) ( not ( = ?auto_47208 ?auto_47213 ) ) ( not ( = ?auto_47208 ?auto_47214 ) ) ( not ( = ?auto_47209 ?auto_47210 ) ) ( not ( = ?auto_47209 ?auto_47211 ) ) ( not ( = ?auto_47209 ?auto_47212 ) ) ( not ( = ?auto_47209 ?auto_47213 ) ) ( not ( = ?auto_47209 ?auto_47214 ) ) ( not ( = ?auto_47210 ?auto_47211 ) ) ( not ( = ?auto_47210 ?auto_47212 ) ) ( not ( = ?auto_47210 ?auto_47213 ) ) ( not ( = ?auto_47210 ?auto_47214 ) ) ( not ( = ?auto_47211 ?auto_47212 ) ) ( not ( = ?auto_47211 ?auto_47213 ) ) ( not ( = ?auto_47211 ?auto_47214 ) ) ( not ( = ?auto_47212 ?auto_47213 ) ) ( not ( = ?auto_47212 ?auto_47214 ) ) ( not ( = ?auto_47213 ?auto_47214 ) ) ( CLEAR ?auto_47211 ) ( ON ?auto_47212 ?auto_47213 ) ( CLEAR ?auto_47212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47208 ?auto_47209 ?auto_47210 ?auto_47211 ?auto_47212 )
      ( MAKE-6PILE ?auto_47208 ?auto_47209 ?auto_47210 ?auto_47211 ?auto_47212 ?auto_47213 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47221 - BLOCK
      ?auto_47222 - BLOCK
      ?auto_47223 - BLOCK
      ?auto_47224 - BLOCK
      ?auto_47225 - BLOCK
      ?auto_47226 - BLOCK
    )
    :vars
    (
      ?auto_47227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47226 ?auto_47227 ) ( ON-TABLE ?auto_47221 ) ( ON ?auto_47222 ?auto_47221 ) ( ON ?auto_47223 ?auto_47222 ) ( ON ?auto_47224 ?auto_47223 ) ( not ( = ?auto_47221 ?auto_47222 ) ) ( not ( = ?auto_47221 ?auto_47223 ) ) ( not ( = ?auto_47221 ?auto_47224 ) ) ( not ( = ?auto_47221 ?auto_47225 ) ) ( not ( = ?auto_47221 ?auto_47226 ) ) ( not ( = ?auto_47221 ?auto_47227 ) ) ( not ( = ?auto_47222 ?auto_47223 ) ) ( not ( = ?auto_47222 ?auto_47224 ) ) ( not ( = ?auto_47222 ?auto_47225 ) ) ( not ( = ?auto_47222 ?auto_47226 ) ) ( not ( = ?auto_47222 ?auto_47227 ) ) ( not ( = ?auto_47223 ?auto_47224 ) ) ( not ( = ?auto_47223 ?auto_47225 ) ) ( not ( = ?auto_47223 ?auto_47226 ) ) ( not ( = ?auto_47223 ?auto_47227 ) ) ( not ( = ?auto_47224 ?auto_47225 ) ) ( not ( = ?auto_47224 ?auto_47226 ) ) ( not ( = ?auto_47224 ?auto_47227 ) ) ( not ( = ?auto_47225 ?auto_47226 ) ) ( not ( = ?auto_47225 ?auto_47227 ) ) ( not ( = ?auto_47226 ?auto_47227 ) ) ( CLEAR ?auto_47224 ) ( ON ?auto_47225 ?auto_47226 ) ( CLEAR ?auto_47225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47221 ?auto_47222 ?auto_47223 ?auto_47224 ?auto_47225 )
      ( MAKE-6PILE ?auto_47221 ?auto_47222 ?auto_47223 ?auto_47224 ?auto_47225 ?auto_47226 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47234 - BLOCK
      ?auto_47235 - BLOCK
      ?auto_47236 - BLOCK
      ?auto_47237 - BLOCK
      ?auto_47238 - BLOCK
      ?auto_47239 - BLOCK
    )
    :vars
    (
      ?auto_47240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47239 ?auto_47240 ) ( ON-TABLE ?auto_47234 ) ( ON ?auto_47235 ?auto_47234 ) ( ON ?auto_47236 ?auto_47235 ) ( not ( = ?auto_47234 ?auto_47235 ) ) ( not ( = ?auto_47234 ?auto_47236 ) ) ( not ( = ?auto_47234 ?auto_47237 ) ) ( not ( = ?auto_47234 ?auto_47238 ) ) ( not ( = ?auto_47234 ?auto_47239 ) ) ( not ( = ?auto_47234 ?auto_47240 ) ) ( not ( = ?auto_47235 ?auto_47236 ) ) ( not ( = ?auto_47235 ?auto_47237 ) ) ( not ( = ?auto_47235 ?auto_47238 ) ) ( not ( = ?auto_47235 ?auto_47239 ) ) ( not ( = ?auto_47235 ?auto_47240 ) ) ( not ( = ?auto_47236 ?auto_47237 ) ) ( not ( = ?auto_47236 ?auto_47238 ) ) ( not ( = ?auto_47236 ?auto_47239 ) ) ( not ( = ?auto_47236 ?auto_47240 ) ) ( not ( = ?auto_47237 ?auto_47238 ) ) ( not ( = ?auto_47237 ?auto_47239 ) ) ( not ( = ?auto_47237 ?auto_47240 ) ) ( not ( = ?auto_47238 ?auto_47239 ) ) ( not ( = ?auto_47238 ?auto_47240 ) ) ( not ( = ?auto_47239 ?auto_47240 ) ) ( ON ?auto_47238 ?auto_47239 ) ( CLEAR ?auto_47236 ) ( ON ?auto_47237 ?auto_47238 ) ( CLEAR ?auto_47237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47234 ?auto_47235 ?auto_47236 ?auto_47237 )
      ( MAKE-6PILE ?auto_47234 ?auto_47235 ?auto_47236 ?auto_47237 ?auto_47238 ?auto_47239 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47247 - BLOCK
      ?auto_47248 - BLOCK
      ?auto_47249 - BLOCK
      ?auto_47250 - BLOCK
      ?auto_47251 - BLOCK
      ?auto_47252 - BLOCK
    )
    :vars
    (
      ?auto_47253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47252 ?auto_47253 ) ( ON-TABLE ?auto_47247 ) ( ON ?auto_47248 ?auto_47247 ) ( ON ?auto_47249 ?auto_47248 ) ( not ( = ?auto_47247 ?auto_47248 ) ) ( not ( = ?auto_47247 ?auto_47249 ) ) ( not ( = ?auto_47247 ?auto_47250 ) ) ( not ( = ?auto_47247 ?auto_47251 ) ) ( not ( = ?auto_47247 ?auto_47252 ) ) ( not ( = ?auto_47247 ?auto_47253 ) ) ( not ( = ?auto_47248 ?auto_47249 ) ) ( not ( = ?auto_47248 ?auto_47250 ) ) ( not ( = ?auto_47248 ?auto_47251 ) ) ( not ( = ?auto_47248 ?auto_47252 ) ) ( not ( = ?auto_47248 ?auto_47253 ) ) ( not ( = ?auto_47249 ?auto_47250 ) ) ( not ( = ?auto_47249 ?auto_47251 ) ) ( not ( = ?auto_47249 ?auto_47252 ) ) ( not ( = ?auto_47249 ?auto_47253 ) ) ( not ( = ?auto_47250 ?auto_47251 ) ) ( not ( = ?auto_47250 ?auto_47252 ) ) ( not ( = ?auto_47250 ?auto_47253 ) ) ( not ( = ?auto_47251 ?auto_47252 ) ) ( not ( = ?auto_47251 ?auto_47253 ) ) ( not ( = ?auto_47252 ?auto_47253 ) ) ( ON ?auto_47251 ?auto_47252 ) ( CLEAR ?auto_47249 ) ( ON ?auto_47250 ?auto_47251 ) ( CLEAR ?auto_47250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47247 ?auto_47248 ?auto_47249 ?auto_47250 )
      ( MAKE-6PILE ?auto_47247 ?auto_47248 ?auto_47249 ?auto_47250 ?auto_47251 ?auto_47252 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47260 - BLOCK
      ?auto_47261 - BLOCK
      ?auto_47262 - BLOCK
      ?auto_47263 - BLOCK
      ?auto_47264 - BLOCK
      ?auto_47265 - BLOCK
    )
    :vars
    (
      ?auto_47266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47265 ?auto_47266 ) ( ON-TABLE ?auto_47260 ) ( ON ?auto_47261 ?auto_47260 ) ( not ( = ?auto_47260 ?auto_47261 ) ) ( not ( = ?auto_47260 ?auto_47262 ) ) ( not ( = ?auto_47260 ?auto_47263 ) ) ( not ( = ?auto_47260 ?auto_47264 ) ) ( not ( = ?auto_47260 ?auto_47265 ) ) ( not ( = ?auto_47260 ?auto_47266 ) ) ( not ( = ?auto_47261 ?auto_47262 ) ) ( not ( = ?auto_47261 ?auto_47263 ) ) ( not ( = ?auto_47261 ?auto_47264 ) ) ( not ( = ?auto_47261 ?auto_47265 ) ) ( not ( = ?auto_47261 ?auto_47266 ) ) ( not ( = ?auto_47262 ?auto_47263 ) ) ( not ( = ?auto_47262 ?auto_47264 ) ) ( not ( = ?auto_47262 ?auto_47265 ) ) ( not ( = ?auto_47262 ?auto_47266 ) ) ( not ( = ?auto_47263 ?auto_47264 ) ) ( not ( = ?auto_47263 ?auto_47265 ) ) ( not ( = ?auto_47263 ?auto_47266 ) ) ( not ( = ?auto_47264 ?auto_47265 ) ) ( not ( = ?auto_47264 ?auto_47266 ) ) ( not ( = ?auto_47265 ?auto_47266 ) ) ( ON ?auto_47264 ?auto_47265 ) ( ON ?auto_47263 ?auto_47264 ) ( CLEAR ?auto_47261 ) ( ON ?auto_47262 ?auto_47263 ) ( CLEAR ?auto_47262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47260 ?auto_47261 ?auto_47262 )
      ( MAKE-6PILE ?auto_47260 ?auto_47261 ?auto_47262 ?auto_47263 ?auto_47264 ?auto_47265 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47273 - BLOCK
      ?auto_47274 - BLOCK
      ?auto_47275 - BLOCK
      ?auto_47276 - BLOCK
      ?auto_47277 - BLOCK
      ?auto_47278 - BLOCK
    )
    :vars
    (
      ?auto_47279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47278 ?auto_47279 ) ( ON-TABLE ?auto_47273 ) ( ON ?auto_47274 ?auto_47273 ) ( not ( = ?auto_47273 ?auto_47274 ) ) ( not ( = ?auto_47273 ?auto_47275 ) ) ( not ( = ?auto_47273 ?auto_47276 ) ) ( not ( = ?auto_47273 ?auto_47277 ) ) ( not ( = ?auto_47273 ?auto_47278 ) ) ( not ( = ?auto_47273 ?auto_47279 ) ) ( not ( = ?auto_47274 ?auto_47275 ) ) ( not ( = ?auto_47274 ?auto_47276 ) ) ( not ( = ?auto_47274 ?auto_47277 ) ) ( not ( = ?auto_47274 ?auto_47278 ) ) ( not ( = ?auto_47274 ?auto_47279 ) ) ( not ( = ?auto_47275 ?auto_47276 ) ) ( not ( = ?auto_47275 ?auto_47277 ) ) ( not ( = ?auto_47275 ?auto_47278 ) ) ( not ( = ?auto_47275 ?auto_47279 ) ) ( not ( = ?auto_47276 ?auto_47277 ) ) ( not ( = ?auto_47276 ?auto_47278 ) ) ( not ( = ?auto_47276 ?auto_47279 ) ) ( not ( = ?auto_47277 ?auto_47278 ) ) ( not ( = ?auto_47277 ?auto_47279 ) ) ( not ( = ?auto_47278 ?auto_47279 ) ) ( ON ?auto_47277 ?auto_47278 ) ( ON ?auto_47276 ?auto_47277 ) ( CLEAR ?auto_47274 ) ( ON ?auto_47275 ?auto_47276 ) ( CLEAR ?auto_47275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47273 ?auto_47274 ?auto_47275 )
      ( MAKE-6PILE ?auto_47273 ?auto_47274 ?auto_47275 ?auto_47276 ?auto_47277 ?auto_47278 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47286 - BLOCK
      ?auto_47287 - BLOCK
      ?auto_47288 - BLOCK
      ?auto_47289 - BLOCK
      ?auto_47290 - BLOCK
      ?auto_47291 - BLOCK
    )
    :vars
    (
      ?auto_47292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47291 ?auto_47292 ) ( ON-TABLE ?auto_47286 ) ( not ( = ?auto_47286 ?auto_47287 ) ) ( not ( = ?auto_47286 ?auto_47288 ) ) ( not ( = ?auto_47286 ?auto_47289 ) ) ( not ( = ?auto_47286 ?auto_47290 ) ) ( not ( = ?auto_47286 ?auto_47291 ) ) ( not ( = ?auto_47286 ?auto_47292 ) ) ( not ( = ?auto_47287 ?auto_47288 ) ) ( not ( = ?auto_47287 ?auto_47289 ) ) ( not ( = ?auto_47287 ?auto_47290 ) ) ( not ( = ?auto_47287 ?auto_47291 ) ) ( not ( = ?auto_47287 ?auto_47292 ) ) ( not ( = ?auto_47288 ?auto_47289 ) ) ( not ( = ?auto_47288 ?auto_47290 ) ) ( not ( = ?auto_47288 ?auto_47291 ) ) ( not ( = ?auto_47288 ?auto_47292 ) ) ( not ( = ?auto_47289 ?auto_47290 ) ) ( not ( = ?auto_47289 ?auto_47291 ) ) ( not ( = ?auto_47289 ?auto_47292 ) ) ( not ( = ?auto_47290 ?auto_47291 ) ) ( not ( = ?auto_47290 ?auto_47292 ) ) ( not ( = ?auto_47291 ?auto_47292 ) ) ( ON ?auto_47290 ?auto_47291 ) ( ON ?auto_47289 ?auto_47290 ) ( ON ?auto_47288 ?auto_47289 ) ( CLEAR ?auto_47286 ) ( ON ?auto_47287 ?auto_47288 ) ( CLEAR ?auto_47287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47286 ?auto_47287 )
      ( MAKE-6PILE ?auto_47286 ?auto_47287 ?auto_47288 ?auto_47289 ?auto_47290 ?auto_47291 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47299 - BLOCK
      ?auto_47300 - BLOCK
      ?auto_47301 - BLOCK
      ?auto_47302 - BLOCK
      ?auto_47303 - BLOCK
      ?auto_47304 - BLOCK
    )
    :vars
    (
      ?auto_47305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47304 ?auto_47305 ) ( ON-TABLE ?auto_47299 ) ( not ( = ?auto_47299 ?auto_47300 ) ) ( not ( = ?auto_47299 ?auto_47301 ) ) ( not ( = ?auto_47299 ?auto_47302 ) ) ( not ( = ?auto_47299 ?auto_47303 ) ) ( not ( = ?auto_47299 ?auto_47304 ) ) ( not ( = ?auto_47299 ?auto_47305 ) ) ( not ( = ?auto_47300 ?auto_47301 ) ) ( not ( = ?auto_47300 ?auto_47302 ) ) ( not ( = ?auto_47300 ?auto_47303 ) ) ( not ( = ?auto_47300 ?auto_47304 ) ) ( not ( = ?auto_47300 ?auto_47305 ) ) ( not ( = ?auto_47301 ?auto_47302 ) ) ( not ( = ?auto_47301 ?auto_47303 ) ) ( not ( = ?auto_47301 ?auto_47304 ) ) ( not ( = ?auto_47301 ?auto_47305 ) ) ( not ( = ?auto_47302 ?auto_47303 ) ) ( not ( = ?auto_47302 ?auto_47304 ) ) ( not ( = ?auto_47302 ?auto_47305 ) ) ( not ( = ?auto_47303 ?auto_47304 ) ) ( not ( = ?auto_47303 ?auto_47305 ) ) ( not ( = ?auto_47304 ?auto_47305 ) ) ( ON ?auto_47303 ?auto_47304 ) ( ON ?auto_47302 ?auto_47303 ) ( ON ?auto_47301 ?auto_47302 ) ( CLEAR ?auto_47299 ) ( ON ?auto_47300 ?auto_47301 ) ( CLEAR ?auto_47300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47299 ?auto_47300 )
      ( MAKE-6PILE ?auto_47299 ?auto_47300 ?auto_47301 ?auto_47302 ?auto_47303 ?auto_47304 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47312 - BLOCK
      ?auto_47313 - BLOCK
      ?auto_47314 - BLOCK
      ?auto_47315 - BLOCK
      ?auto_47316 - BLOCK
      ?auto_47317 - BLOCK
    )
    :vars
    (
      ?auto_47318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47317 ?auto_47318 ) ( not ( = ?auto_47312 ?auto_47313 ) ) ( not ( = ?auto_47312 ?auto_47314 ) ) ( not ( = ?auto_47312 ?auto_47315 ) ) ( not ( = ?auto_47312 ?auto_47316 ) ) ( not ( = ?auto_47312 ?auto_47317 ) ) ( not ( = ?auto_47312 ?auto_47318 ) ) ( not ( = ?auto_47313 ?auto_47314 ) ) ( not ( = ?auto_47313 ?auto_47315 ) ) ( not ( = ?auto_47313 ?auto_47316 ) ) ( not ( = ?auto_47313 ?auto_47317 ) ) ( not ( = ?auto_47313 ?auto_47318 ) ) ( not ( = ?auto_47314 ?auto_47315 ) ) ( not ( = ?auto_47314 ?auto_47316 ) ) ( not ( = ?auto_47314 ?auto_47317 ) ) ( not ( = ?auto_47314 ?auto_47318 ) ) ( not ( = ?auto_47315 ?auto_47316 ) ) ( not ( = ?auto_47315 ?auto_47317 ) ) ( not ( = ?auto_47315 ?auto_47318 ) ) ( not ( = ?auto_47316 ?auto_47317 ) ) ( not ( = ?auto_47316 ?auto_47318 ) ) ( not ( = ?auto_47317 ?auto_47318 ) ) ( ON ?auto_47316 ?auto_47317 ) ( ON ?auto_47315 ?auto_47316 ) ( ON ?auto_47314 ?auto_47315 ) ( ON ?auto_47313 ?auto_47314 ) ( ON ?auto_47312 ?auto_47313 ) ( CLEAR ?auto_47312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47312 )
      ( MAKE-6PILE ?auto_47312 ?auto_47313 ?auto_47314 ?auto_47315 ?auto_47316 ?auto_47317 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47325 - BLOCK
      ?auto_47326 - BLOCK
      ?auto_47327 - BLOCK
      ?auto_47328 - BLOCK
      ?auto_47329 - BLOCK
      ?auto_47330 - BLOCK
    )
    :vars
    (
      ?auto_47331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47330 ?auto_47331 ) ( not ( = ?auto_47325 ?auto_47326 ) ) ( not ( = ?auto_47325 ?auto_47327 ) ) ( not ( = ?auto_47325 ?auto_47328 ) ) ( not ( = ?auto_47325 ?auto_47329 ) ) ( not ( = ?auto_47325 ?auto_47330 ) ) ( not ( = ?auto_47325 ?auto_47331 ) ) ( not ( = ?auto_47326 ?auto_47327 ) ) ( not ( = ?auto_47326 ?auto_47328 ) ) ( not ( = ?auto_47326 ?auto_47329 ) ) ( not ( = ?auto_47326 ?auto_47330 ) ) ( not ( = ?auto_47326 ?auto_47331 ) ) ( not ( = ?auto_47327 ?auto_47328 ) ) ( not ( = ?auto_47327 ?auto_47329 ) ) ( not ( = ?auto_47327 ?auto_47330 ) ) ( not ( = ?auto_47327 ?auto_47331 ) ) ( not ( = ?auto_47328 ?auto_47329 ) ) ( not ( = ?auto_47328 ?auto_47330 ) ) ( not ( = ?auto_47328 ?auto_47331 ) ) ( not ( = ?auto_47329 ?auto_47330 ) ) ( not ( = ?auto_47329 ?auto_47331 ) ) ( not ( = ?auto_47330 ?auto_47331 ) ) ( ON ?auto_47329 ?auto_47330 ) ( ON ?auto_47328 ?auto_47329 ) ( ON ?auto_47327 ?auto_47328 ) ( ON ?auto_47326 ?auto_47327 ) ( ON ?auto_47325 ?auto_47326 ) ( CLEAR ?auto_47325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47325 )
      ( MAKE-6PILE ?auto_47325 ?auto_47326 ?auto_47327 ?auto_47328 ?auto_47329 ?auto_47330 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_47339 - BLOCK
      ?auto_47340 - BLOCK
      ?auto_47341 - BLOCK
      ?auto_47342 - BLOCK
      ?auto_47343 - BLOCK
      ?auto_47344 - BLOCK
      ?auto_47345 - BLOCK
    )
    :vars
    (
      ?auto_47346 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47344 ) ( ON ?auto_47345 ?auto_47346 ) ( CLEAR ?auto_47345 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47339 ) ( ON ?auto_47340 ?auto_47339 ) ( ON ?auto_47341 ?auto_47340 ) ( ON ?auto_47342 ?auto_47341 ) ( ON ?auto_47343 ?auto_47342 ) ( ON ?auto_47344 ?auto_47343 ) ( not ( = ?auto_47339 ?auto_47340 ) ) ( not ( = ?auto_47339 ?auto_47341 ) ) ( not ( = ?auto_47339 ?auto_47342 ) ) ( not ( = ?auto_47339 ?auto_47343 ) ) ( not ( = ?auto_47339 ?auto_47344 ) ) ( not ( = ?auto_47339 ?auto_47345 ) ) ( not ( = ?auto_47339 ?auto_47346 ) ) ( not ( = ?auto_47340 ?auto_47341 ) ) ( not ( = ?auto_47340 ?auto_47342 ) ) ( not ( = ?auto_47340 ?auto_47343 ) ) ( not ( = ?auto_47340 ?auto_47344 ) ) ( not ( = ?auto_47340 ?auto_47345 ) ) ( not ( = ?auto_47340 ?auto_47346 ) ) ( not ( = ?auto_47341 ?auto_47342 ) ) ( not ( = ?auto_47341 ?auto_47343 ) ) ( not ( = ?auto_47341 ?auto_47344 ) ) ( not ( = ?auto_47341 ?auto_47345 ) ) ( not ( = ?auto_47341 ?auto_47346 ) ) ( not ( = ?auto_47342 ?auto_47343 ) ) ( not ( = ?auto_47342 ?auto_47344 ) ) ( not ( = ?auto_47342 ?auto_47345 ) ) ( not ( = ?auto_47342 ?auto_47346 ) ) ( not ( = ?auto_47343 ?auto_47344 ) ) ( not ( = ?auto_47343 ?auto_47345 ) ) ( not ( = ?auto_47343 ?auto_47346 ) ) ( not ( = ?auto_47344 ?auto_47345 ) ) ( not ( = ?auto_47344 ?auto_47346 ) ) ( not ( = ?auto_47345 ?auto_47346 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47345 ?auto_47346 )
      ( !STACK ?auto_47345 ?auto_47344 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_47354 - BLOCK
      ?auto_47355 - BLOCK
      ?auto_47356 - BLOCK
      ?auto_47357 - BLOCK
      ?auto_47358 - BLOCK
      ?auto_47359 - BLOCK
      ?auto_47360 - BLOCK
    )
    :vars
    (
      ?auto_47361 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47359 ) ( ON ?auto_47360 ?auto_47361 ) ( CLEAR ?auto_47360 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47354 ) ( ON ?auto_47355 ?auto_47354 ) ( ON ?auto_47356 ?auto_47355 ) ( ON ?auto_47357 ?auto_47356 ) ( ON ?auto_47358 ?auto_47357 ) ( ON ?auto_47359 ?auto_47358 ) ( not ( = ?auto_47354 ?auto_47355 ) ) ( not ( = ?auto_47354 ?auto_47356 ) ) ( not ( = ?auto_47354 ?auto_47357 ) ) ( not ( = ?auto_47354 ?auto_47358 ) ) ( not ( = ?auto_47354 ?auto_47359 ) ) ( not ( = ?auto_47354 ?auto_47360 ) ) ( not ( = ?auto_47354 ?auto_47361 ) ) ( not ( = ?auto_47355 ?auto_47356 ) ) ( not ( = ?auto_47355 ?auto_47357 ) ) ( not ( = ?auto_47355 ?auto_47358 ) ) ( not ( = ?auto_47355 ?auto_47359 ) ) ( not ( = ?auto_47355 ?auto_47360 ) ) ( not ( = ?auto_47355 ?auto_47361 ) ) ( not ( = ?auto_47356 ?auto_47357 ) ) ( not ( = ?auto_47356 ?auto_47358 ) ) ( not ( = ?auto_47356 ?auto_47359 ) ) ( not ( = ?auto_47356 ?auto_47360 ) ) ( not ( = ?auto_47356 ?auto_47361 ) ) ( not ( = ?auto_47357 ?auto_47358 ) ) ( not ( = ?auto_47357 ?auto_47359 ) ) ( not ( = ?auto_47357 ?auto_47360 ) ) ( not ( = ?auto_47357 ?auto_47361 ) ) ( not ( = ?auto_47358 ?auto_47359 ) ) ( not ( = ?auto_47358 ?auto_47360 ) ) ( not ( = ?auto_47358 ?auto_47361 ) ) ( not ( = ?auto_47359 ?auto_47360 ) ) ( not ( = ?auto_47359 ?auto_47361 ) ) ( not ( = ?auto_47360 ?auto_47361 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47360 ?auto_47361 )
      ( !STACK ?auto_47360 ?auto_47359 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_47369 - BLOCK
      ?auto_47370 - BLOCK
      ?auto_47371 - BLOCK
      ?auto_47372 - BLOCK
      ?auto_47373 - BLOCK
      ?auto_47374 - BLOCK
      ?auto_47375 - BLOCK
    )
    :vars
    (
      ?auto_47376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47375 ?auto_47376 ) ( ON-TABLE ?auto_47369 ) ( ON ?auto_47370 ?auto_47369 ) ( ON ?auto_47371 ?auto_47370 ) ( ON ?auto_47372 ?auto_47371 ) ( ON ?auto_47373 ?auto_47372 ) ( not ( = ?auto_47369 ?auto_47370 ) ) ( not ( = ?auto_47369 ?auto_47371 ) ) ( not ( = ?auto_47369 ?auto_47372 ) ) ( not ( = ?auto_47369 ?auto_47373 ) ) ( not ( = ?auto_47369 ?auto_47374 ) ) ( not ( = ?auto_47369 ?auto_47375 ) ) ( not ( = ?auto_47369 ?auto_47376 ) ) ( not ( = ?auto_47370 ?auto_47371 ) ) ( not ( = ?auto_47370 ?auto_47372 ) ) ( not ( = ?auto_47370 ?auto_47373 ) ) ( not ( = ?auto_47370 ?auto_47374 ) ) ( not ( = ?auto_47370 ?auto_47375 ) ) ( not ( = ?auto_47370 ?auto_47376 ) ) ( not ( = ?auto_47371 ?auto_47372 ) ) ( not ( = ?auto_47371 ?auto_47373 ) ) ( not ( = ?auto_47371 ?auto_47374 ) ) ( not ( = ?auto_47371 ?auto_47375 ) ) ( not ( = ?auto_47371 ?auto_47376 ) ) ( not ( = ?auto_47372 ?auto_47373 ) ) ( not ( = ?auto_47372 ?auto_47374 ) ) ( not ( = ?auto_47372 ?auto_47375 ) ) ( not ( = ?auto_47372 ?auto_47376 ) ) ( not ( = ?auto_47373 ?auto_47374 ) ) ( not ( = ?auto_47373 ?auto_47375 ) ) ( not ( = ?auto_47373 ?auto_47376 ) ) ( not ( = ?auto_47374 ?auto_47375 ) ) ( not ( = ?auto_47374 ?auto_47376 ) ) ( not ( = ?auto_47375 ?auto_47376 ) ) ( CLEAR ?auto_47373 ) ( ON ?auto_47374 ?auto_47375 ) ( CLEAR ?auto_47374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47369 ?auto_47370 ?auto_47371 ?auto_47372 ?auto_47373 ?auto_47374 )
      ( MAKE-7PILE ?auto_47369 ?auto_47370 ?auto_47371 ?auto_47372 ?auto_47373 ?auto_47374 ?auto_47375 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_47384 - BLOCK
      ?auto_47385 - BLOCK
      ?auto_47386 - BLOCK
      ?auto_47387 - BLOCK
      ?auto_47388 - BLOCK
      ?auto_47389 - BLOCK
      ?auto_47390 - BLOCK
    )
    :vars
    (
      ?auto_47391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47390 ?auto_47391 ) ( ON-TABLE ?auto_47384 ) ( ON ?auto_47385 ?auto_47384 ) ( ON ?auto_47386 ?auto_47385 ) ( ON ?auto_47387 ?auto_47386 ) ( ON ?auto_47388 ?auto_47387 ) ( not ( = ?auto_47384 ?auto_47385 ) ) ( not ( = ?auto_47384 ?auto_47386 ) ) ( not ( = ?auto_47384 ?auto_47387 ) ) ( not ( = ?auto_47384 ?auto_47388 ) ) ( not ( = ?auto_47384 ?auto_47389 ) ) ( not ( = ?auto_47384 ?auto_47390 ) ) ( not ( = ?auto_47384 ?auto_47391 ) ) ( not ( = ?auto_47385 ?auto_47386 ) ) ( not ( = ?auto_47385 ?auto_47387 ) ) ( not ( = ?auto_47385 ?auto_47388 ) ) ( not ( = ?auto_47385 ?auto_47389 ) ) ( not ( = ?auto_47385 ?auto_47390 ) ) ( not ( = ?auto_47385 ?auto_47391 ) ) ( not ( = ?auto_47386 ?auto_47387 ) ) ( not ( = ?auto_47386 ?auto_47388 ) ) ( not ( = ?auto_47386 ?auto_47389 ) ) ( not ( = ?auto_47386 ?auto_47390 ) ) ( not ( = ?auto_47386 ?auto_47391 ) ) ( not ( = ?auto_47387 ?auto_47388 ) ) ( not ( = ?auto_47387 ?auto_47389 ) ) ( not ( = ?auto_47387 ?auto_47390 ) ) ( not ( = ?auto_47387 ?auto_47391 ) ) ( not ( = ?auto_47388 ?auto_47389 ) ) ( not ( = ?auto_47388 ?auto_47390 ) ) ( not ( = ?auto_47388 ?auto_47391 ) ) ( not ( = ?auto_47389 ?auto_47390 ) ) ( not ( = ?auto_47389 ?auto_47391 ) ) ( not ( = ?auto_47390 ?auto_47391 ) ) ( CLEAR ?auto_47388 ) ( ON ?auto_47389 ?auto_47390 ) ( CLEAR ?auto_47389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47384 ?auto_47385 ?auto_47386 ?auto_47387 ?auto_47388 ?auto_47389 )
      ( MAKE-7PILE ?auto_47384 ?auto_47385 ?auto_47386 ?auto_47387 ?auto_47388 ?auto_47389 ?auto_47390 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_47399 - BLOCK
      ?auto_47400 - BLOCK
      ?auto_47401 - BLOCK
      ?auto_47402 - BLOCK
      ?auto_47403 - BLOCK
      ?auto_47404 - BLOCK
      ?auto_47405 - BLOCK
    )
    :vars
    (
      ?auto_47406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47405 ?auto_47406 ) ( ON-TABLE ?auto_47399 ) ( ON ?auto_47400 ?auto_47399 ) ( ON ?auto_47401 ?auto_47400 ) ( ON ?auto_47402 ?auto_47401 ) ( not ( = ?auto_47399 ?auto_47400 ) ) ( not ( = ?auto_47399 ?auto_47401 ) ) ( not ( = ?auto_47399 ?auto_47402 ) ) ( not ( = ?auto_47399 ?auto_47403 ) ) ( not ( = ?auto_47399 ?auto_47404 ) ) ( not ( = ?auto_47399 ?auto_47405 ) ) ( not ( = ?auto_47399 ?auto_47406 ) ) ( not ( = ?auto_47400 ?auto_47401 ) ) ( not ( = ?auto_47400 ?auto_47402 ) ) ( not ( = ?auto_47400 ?auto_47403 ) ) ( not ( = ?auto_47400 ?auto_47404 ) ) ( not ( = ?auto_47400 ?auto_47405 ) ) ( not ( = ?auto_47400 ?auto_47406 ) ) ( not ( = ?auto_47401 ?auto_47402 ) ) ( not ( = ?auto_47401 ?auto_47403 ) ) ( not ( = ?auto_47401 ?auto_47404 ) ) ( not ( = ?auto_47401 ?auto_47405 ) ) ( not ( = ?auto_47401 ?auto_47406 ) ) ( not ( = ?auto_47402 ?auto_47403 ) ) ( not ( = ?auto_47402 ?auto_47404 ) ) ( not ( = ?auto_47402 ?auto_47405 ) ) ( not ( = ?auto_47402 ?auto_47406 ) ) ( not ( = ?auto_47403 ?auto_47404 ) ) ( not ( = ?auto_47403 ?auto_47405 ) ) ( not ( = ?auto_47403 ?auto_47406 ) ) ( not ( = ?auto_47404 ?auto_47405 ) ) ( not ( = ?auto_47404 ?auto_47406 ) ) ( not ( = ?auto_47405 ?auto_47406 ) ) ( ON ?auto_47404 ?auto_47405 ) ( CLEAR ?auto_47402 ) ( ON ?auto_47403 ?auto_47404 ) ( CLEAR ?auto_47403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47399 ?auto_47400 ?auto_47401 ?auto_47402 ?auto_47403 )
      ( MAKE-7PILE ?auto_47399 ?auto_47400 ?auto_47401 ?auto_47402 ?auto_47403 ?auto_47404 ?auto_47405 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_47414 - BLOCK
      ?auto_47415 - BLOCK
      ?auto_47416 - BLOCK
      ?auto_47417 - BLOCK
      ?auto_47418 - BLOCK
      ?auto_47419 - BLOCK
      ?auto_47420 - BLOCK
    )
    :vars
    (
      ?auto_47421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47420 ?auto_47421 ) ( ON-TABLE ?auto_47414 ) ( ON ?auto_47415 ?auto_47414 ) ( ON ?auto_47416 ?auto_47415 ) ( ON ?auto_47417 ?auto_47416 ) ( not ( = ?auto_47414 ?auto_47415 ) ) ( not ( = ?auto_47414 ?auto_47416 ) ) ( not ( = ?auto_47414 ?auto_47417 ) ) ( not ( = ?auto_47414 ?auto_47418 ) ) ( not ( = ?auto_47414 ?auto_47419 ) ) ( not ( = ?auto_47414 ?auto_47420 ) ) ( not ( = ?auto_47414 ?auto_47421 ) ) ( not ( = ?auto_47415 ?auto_47416 ) ) ( not ( = ?auto_47415 ?auto_47417 ) ) ( not ( = ?auto_47415 ?auto_47418 ) ) ( not ( = ?auto_47415 ?auto_47419 ) ) ( not ( = ?auto_47415 ?auto_47420 ) ) ( not ( = ?auto_47415 ?auto_47421 ) ) ( not ( = ?auto_47416 ?auto_47417 ) ) ( not ( = ?auto_47416 ?auto_47418 ) ) ( not ( = ?auto_47416 ?auto_47419 ) ) ( not ( = ?auto_47416 ?auto_47420 ) ) ( not ( = ?auto_47416 ?auto_47421 ) ) ( not ( = ?auto_47417 ?auto_47418 ) ) ( not ( = ?auto_47417 ?auto_47419 ) ) ( not ( = ?auto_47417 ?auto_47420 ) ) ( not ( = ?auto_47417 ?auto_47421 ) ) ( not ( = ?auto_47418 ?auto_47419 ) ) ( not ( = ?auto_47418 ?auto_47420 ) ) ( not ( = ?auto_47418 ?auto_47421 ) ) ( not ( = ?auto_47419 ?auto_47420 ) ) ( not ( = ?auto_47419 ?auto_47421 ) ) ( not ( = ?auto_47420 ?auto_47421 ) ) ( ON ?auto_47419 ?auto_47420 ) ( CLEAR ?auto_47417 ) ( ON ?auto_47418 ?auto_47419 ) ( CLEAR ?auto_47418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47414 ?auto_47415 ?auto_47416 ?auto_47417 ?auto_47418 )
      ( MAKE-7PILE ?auto_47414 ?auto_47415 ?auto_47416 ?auto_47417 ?auto_47418 ?auto_47419 ?auto_47420 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_47429 - BLOCK
      ?auto_47430 - BLOCK
      ?auto_47431 - BLOCK
      ?auto_47432 - BLOCK
      ?auto_47433 - BLOCK
      ?auto_47434 - BLOCK
      ?auto_47435 - BLOCK
    )
    :vars
    (
      ?auto_47436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47435 ?auto_47436 ) ( ON-TABLE ?auto_47429 ) ( ON ?auto_47430 ?auto_47429 ) ( ON ?auto_47431 ?auto_47430 ) ( not ( = ?auto_47429 ?auto_47430 ) ) ( not ( = ?auto_47429 ?auto_47431 ) ) ( not ( = ?auto_47429 ?auto_47432 ) ) ( not ( = ?auto_47429 ?auto_47433 ) ) ( not ( = ?auto_47429 ?auto_47434 ) ) ( not ( = ?auto_47429 ?auto_47435 ) ) ( not ( = ?auto_47429 ?auto_47436 ) ) ( not ( = ?auto_47430 ?auto_47431 ) ) ( not ( = ?auto_47430 ?auto_47432 ) ) ( not ( = ?auto_47430 ?auto_47433 ) ) ( not ( = ?auto_47430 ?auto_47434 ) ) ( not ( = ?auto_47430 ?auto_47435 ) ) ( not ( = ?auto_47430 ?auto_47436 ) ) ( not ( = ?auto_47431 ?auto_47432 ) ) ( not ( = ?auto_47431 ?auto_47433 ) ) ( not ( = ?auto_47431 ?auto_47434 ) ) ( not ( = ?auto_47431 ?auto_47435 ) ) ( not ( = ?auto_47431 ?auto_47436 ) ) ( not ( = ?auto_47432 ?auto_47433 ) ) ( not ( = ?auto_47432 ?auto_47434 ) ) ( not ( = ?auto_47432 ?auto_47435 ) ) ( not ( = ?auto_47432 ?auto_47436 ) ) ( not ( = ?auto_47433 ?auto_47434 ) ) ( not ( = ?auto_47433 ?auto_47435 ) ) ( not ( = ?auto_47433 ?auto_47436 ) ) ( not ( = ?auto_47434 ?auto_47435 ) ) ( not ( = ?auto_47434 ?auto_47436 ) ) ( not ( = ?auto_47435 ?auto_47436 ) ) ( ON ?auto_47434 ?auto_47435 ) ( ON ?auto_47433 ?auto_47434 ) ( CLEAR ?auto_47431 ) ( ON ?auto_47432 ?auto_47433 ) ( CLEAR ?auto_47432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47429 ?auto_47430 ?auto_47431 ?auto_47432 )
      ( MAKE-7PILE ?auto_47429 ?auto_47430 ?auto_47431 ?auto_47432 ?auto_47433 ?auto_47434 ?auto_47435 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_47444 - BLOCK
      ?auto_47445 - BLOCK
      ?auto_47446 - BLOCK
      ?auto_47447 - BLOCK
      ?auto_47448 - BLOCK
      ?auto_47449 - BLOCK
      ?auto_47450 - BLOCK
    )
    :vars
    (
      ?auto_47451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47450 ?auto_47451 ) ( ON-TABLE ?auto_47444 ) ( ON ?auto_47445 ?auto_47444 ) ( ON ?auto_47446 ?auto_47445 ) ( not ( = ?auto_47444 ?auto_47445 ) ) ( not ( = ?auto_47444 ?auto_47446 ) ) ( not ( = ?auto_47444 ?auto_47447 ) ) ( not ( = ?auto_47444 ?auto_47448 ) ) ( not ( = ?auto_47444 ?auto_47449 ) ) ( not ( = ?auto_47444 ?auto_47450 ) ) ( not ( = ?auto_47444 ?auto_47451 ) ) ( not ( = ?auto_47445 ?auto_47446 ) ) ( not ( = ?auto_47445 ?auto_47447 ) ) ( not ( = ?auto_47445 ?auto_47448 ) ) ( not ( = ?auto_47445 ?auto_47449 ) ) ( not ( = ?auto_47445 ?auto_47450 ) ) ( not ( = ?auto_47445 ?auto_47451 ) ) ( not ( = ?auto_47446 ?auto_47447 ) ) ( not ( = ?auto_47446 ?auto_47448 ) ) ( not ( = ?auto_47446 ?auto_47449 ) ) ( not ( = ?auto_47446 ?auto_47450 ) ) ( not ( = ?auto_47446 ?auto_47451 ) ) ( not ( = ?auto_47447 ?auto_47448 ) ) ( not ( = ?auto_47447 ?auto_47449 ) ) ( not ( = ?auto_47447 ?auto_47450 ) ) ( not ( = ?auto_47447 ?auto_47451 ) ) ( not ( = ?auto_47448 ?auto_47449 ) ) ( not ( = ?auto_47448 ?auto_47450 ) ) ( not ( = ?auto_47448 ?auto_47451 ) ) ( not ( = ?auto_47449 ?auto_47450 ) ) ( not ( = ?auto_47449 ?auto_47451 ) ) ( not ( = ?auto_47450 ?auto_47451 ) ) ( ON ?auto_47449 ?auto_47450 ) ( ON ?auto_47448 ?auto_47449 ) ( CLEAR ?auto_47446 ) ( ON ?auto_47447 ?auto_47448 ) ( CLEAR ?auto_47447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47444 ?auto_47445 ?auto_47446 ?auto_47447 )
      ( MAKE-7PILE ?auto_47444 ?auto_47445 ?auto_47446 ?auto_47447 ?auto_47448 ?auto_47449 ?auto_47450 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_47459 - BLOCK
      ?auto_47460 - BLOCK
      ?auto_47461 - BLOCK
      ?auto_47462 - BLOCK
      ?auto_47463 - BLOCK
      ?auto_47464 - BLOCK
      ?auto_47465 - BLOCK
    )
    :vars
    (
      ?auto_47466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47465 ?auto_47466 ) ( ON-TABLE ?auto_47459 ) ( ON ?auto_47460 ?auto_47459 ) ( not ( = ?auto_47459 ?auto_47460 ) ) ( not ( = ?auto_47459 ?auto_47461 ) ) ( not ( = ?auto_47459 ?auto_47462 ) ) ( not ( = ?auto_47459 ?auto_47463 ) ) ( not ( = ?auto_47459 ?auto_47464 ) ) ( not ( = ?auto_47459 ?auto_47465 ) ) ( not ( = ?auto_47459 ?auto_47466 ) ) ( not ( = ?auto_47460 ?auto_47461 ) ) ( not ( = ?auto_47460 ?auto_47462 ) ) ( not ( = ?auto_47460 ?auto_47463 ) ) ( not ( = ?auto_47460 ?auto_47464 ) ) ( not ( = ?auto_47460 ?auto_47465 ) ) ( not ( = ?auto_47460 ?auto_47466 ) ) ( not ( = ?auto_47461 ?auto_47462 ) ) ( not ( = ?auto_47461 ?auto_47463 ) ) ( not ( = ?auto_47461 ?auto_47464 ) ) ( not ( = ?auto_47461 ?auto_47465 ) ) ( not ( = ?auto_47461 ?auto_47466 ) ) ( not ( = ?auto_47462 ?auto_47463 ) ) ( not ( = ?auto_47462 ?auto_47464 ) ) ( not ( = ?auto_47462 ?auto_47465 ) ) ( not ( = ?auto_47462 ?auto_47466 ) ) ( not ( = ?auto_47463 ?auto_47464 ) ) ( not ( = ?auto_47463 ?auto_47465 ) ) ( not ( = ?auto_47463 ?auto_47466 ) ) ( not ( = ?auto_47464 ?auto_47465 ) ) ( not ( = ?auto_47464 ?auto_47466 ) ) ( not ( = ?auto_47465 ?auto_47466 ) ) ( ON ?auto_47464 ?auto_47465 ) ( ON ?auto_47463 ?auto_47464 ) ( ON ?auto_47462 ?auto_47463 ) ( CLEAR ?auto_47460 ) ( ON ?auto_47461 ?auto_47462 ) ( CLEAR ?auto_47461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47459 ?auto_47460 ?auto_47461 )
      ( MAKE-7PILE ?auto_47459 ?auto_47460 ?auto_47461 ?auto_47462 ?auto_47463 ?auto_47464 ?auto_47465 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_47474 - BLOCK
      ?auto_47475 - BLOCK
      ?auto_47476 - BLOCK
      ?auto_47477 - BLOCK
      ?auto_47478 - BLOCK
      ?auto_47479 - BLOCK
      ?auto_47480 - BLOCK
    )
    :vars
    (
      ?auto_47481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47480 ?auto_47481 ) ( ON-TABLE ?auto_47474 ) ( ON ?auto_47475 ?auto_47474 ) ( not ( = ?auto_47474 ?auto_47475 ) ) ( not ( = ?auto_47474 ?auto_47476 ) ) ( not ( = ?auto_47474 ?auto_47477 ) ) ( not ( = ?auto_47474 ?auto_47478 ) ) ( not ( = ?auto_47474 ?auto_47479 ) ) ( not ( = ?auto_47474 ?auto_47480 ) ) ( not ( = ?auto_47474 ?auto_47481 ) ) ( not ( = ?auto_47475 ?auto_47476 ) ) ( not ( = ?auto_47475 ?auto_47477 ) ) ( not ( = ?auto_47475 ?auto_47478 ) ) ( not ( = ?auto_47475 ?auto_47479 ) ) ( not ( = ?auto_47475 ?auto_47480 ) ) ( not ( = ?auto_47475 ?auto_47481 ) ) ( not ( = ?auto_47476 ?auto_47477 ) ) ( not ( = ?auto_47476 ?auto_47478 ) ) ( not ( = ?auto_47476 ?auto_47479 ) ) ( not ( = ?auto_47476 ?auto_47480 ) ) ( not ( = ?auto_47476 ?auto_47481 ) ) ( not ( = ?auto_47477 ?auto_47478 ) ) ( not ( = ?auto_47477 ?auto_47479 ) ) ( not ( = ?auto_47477 ?auto_47480 ) ) ( not ( = ?auto_47477 ?auto_47481 ) ) ( not ( = ?auto_47478 ?auto_47479 ) ) ( not ( = ?auto_47478 ?auto_47480 ) ) ( not ( = ?auto_47478 ?auto_47481 ) ) ( not ( = ?auto_47479 ?auto_47480 ) ) ( not ( = ?auto_47479 ?auto_47481 ) ) ( not ( = ?auto_47480 ?auto_47481 ) ) ( ON ?auto_47479 ?auto_47480 ) ( ON ?auto_47478 ?auto_47479 ) ( ON ?auto_47477 ?auto_47478 ) ( CLEAR ?auto_47475 ) ( ON ?auto_47476 ?auto_47477 ) ( CLEAR ?auto_47476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47474 ?auto_47475 ?auto_47476 )
      ( MAKE-7PILE ?auto_47474 ?auto_47475 ?auto_47476 ?auto_47477 ?auto_47478 ?auto_47479 ?auto_47480 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_47489 - BLOCK
      ?auto_47490 - BLOCK
      ?auto_47491 - BLOCK
      ?auto_47492 - BLOCK
      ?auto_47493 - BLOCK
      ?auto_47494 - BLOCK
      ?auto_47495 - BLOCK
    )
    :vars
    (
      ?auto_47496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47495 ?auto_47496 ) ( ON-TABLE ?auto_47489 ) ( not ( = ?auto_47489 ?auto_47490 ) ) ( not ( = ?auto_47489 ?auto_47491 ) ) ( not ( = ?auto_47489 ?auto_47492 ) ) ( not ( = ?auto_47489 ?auto_47493 ) ) ( not ( = ?auto_47489 ?auto_47494 ) ) ( not ( = ?auto_47489 ?auto_47495 ) ) ( not ( = ?auto_47489 ?auto_47496 ) ) ( not ( = ?auto_47490 ?auto_47491 ) ) ( not ( = ?auto_47490 ?auto_47492 ) ) ( not ( = ?auto_47490 ?auto_47493 ) ) ( not ( = ?auto_47490 ?auto_47494 ) ) ( not ( = ?auto_47490 ?auto_47495 ) ) ( not ( = ?auto_47490 ?auto_47496 ) ) ( not ( = ?auto_47491 ?auto_47492 ) ) ( not ( = ?auto_47491 ?auto_47493 ) ) ( not ( = ?auto_47491 ?auto_47494 ) ) ( not ( = ?auto_47491 ?auto_47495 ) ) ( not ( = ?auto_47491 ?auto_47496 ) ) ( not ( = ?auto_47492 ?auto_47493 ) ) ( not ( = ?auto_47492 ?auto_47494 ) ) ( not ( = ?auto_47492 ?auto_47495 ) ) ( not ( = ?auto_47492 ?auto_47496 ) ) ( not ( = ?auto_47493 ?auto_47494 ) ) ( not ( = ?auto_47493 ?auto_47495 ) ) ( not ( = ?auto_47493 ?auto_47496 ) ) ( not ( = ?auto_47494 ?auto_47495 ) ) ( not ( = ?auto_47494 ?auto_47496 ) ) ( not ( = ?auto_47495 ?auto_47496 ) ) ( ON ?auto_47494 ?auto_47495 ) ( ON ?auto_47493 ?auto_47494 ) ( ON ?auto_47492 ?auto_47493 ) ( ON ?auto_47491 ?auto_47492 ) ( CLEAR ?auto_47489 ) ( ON ?auto_47490 ?auto_47491 ) ( CLEAR ?auto_47490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47489 ?auto_47490 )
      ( MAKE-7PILE ?auto_47489 ?auto_47490 ?auto_47491 ?auto_47492 ?auto_47493 ?auto_47494 ?auto_47495 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_47504 - BLOCK
      ?auto_47505 - BLOCK
      ?auto_47506 - BLOCK
      ?auto_47507 - BLOCK
      ?auto_47508 - BLOCK
      ?auto_47509 - BLOCK
      ?auto_47510 - BLOCK
    )
    :vars
    (
      ?auto_47511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47510 ?auto_47511 ) ( ON-TABLE ?auto_47504 ) ( not ( = ?auto_47504 ?auto_47505 ) ) ( not ( = ?auto_47504 ?auto_47506 ) ) ( not ( = ?auto_47504 ?auto_47507 ) ) ( not ( = ?auto_47504 ?auto_47508 ) ) ( not ( = ?auto_47504 ?auto_47509 ) ) ( not ( = ?auto_47504 ?auto_47510 ) ) ( not ( = ?auto_47504 ?auto_47511 ) ) ( not ( = ?auto_47505 ?auto_47506 ) ) ( not ( = ?auto_47505 ?auto_47507 ) ) ( not ( = ?auto_47505 ?auto_47508 ) ) ( not ( = ?auto_47505 ?auto_47509 ) ) ( not ( = ?auto_47505 ?auto_47510 ) ) ( not ( = ?auto_47505 ?auto_47511 ) ) ( not ( = ?auto_47506 ?auto_47507 ) ) ( not ( = ?auto_47506 ?auto_47508 ) ) ( not ( = ?auto_47506 ?auto_47509 ) ) ( not ( = ?auto_47506 ?auto_47510 ) ) ( not ( = ?auto_47506 ?auto_47511 ) ) ( not ( = ?auto_47507 ?auto_47508 ) ) ( not ( = ?auto_47507 ?auto_47509 ) ) ( not ( = ?auto_47507 ?auto_47510 ) ) ( not ( = ?auto_47507 ?auto_47511 ) ) ( not ( = ?auto_47508 ?auto_47509 ) ) ( not ( = ?auto_47508 ?auto_47510 ) ) ( not ( = ?auto_47508 ?auto_47511 ) ) ( not ( = ?auto_47509 ?auto_47510 ) ) ( not ( = ?auto_47509 ?auto_47511 ) ) ( not ( = ?auto_47510 ?auto_47511 ) ) ( ON ?auto_47509 ?auto_47510 ) ( ON ?auto_47508 ?auto_47509 ) ( ON ?auto_47507 ?auto_47508 ) ( ON ?auto_47506 ?auto_47507 ) ( CLEAR ?auto_47504 ) ( ON ?auto_47505 ?auto_47506 ) ( CLEAR ?auto_47505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47504 ?auto_47505 )
      ( MAKE-7PILE ?auto_47504 ?auto_47505 ?auto_47506 ?auto_47507 ?auto_47508 ?auto_47509 ?auto_47510 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_47519 - BLOCK
      ?auto_47520 - BLOCK
      ?auto_47521 - BLOCK
      ?auto_47522 - BLOCK
      ?auto_47523 - BLOCK
      ?auto_47524 - BLOCK
      ?auto_47525 - BLOCK
    )
    :vars
    (
      ?auto_47526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47525 ?auto_47526 ) ( not ( = ?auto_47519 ?auto_47520 ) ) ( not ( = ?auto_47519 ?auto_47521 ) ) ( not ( = ?auto_47519 ?auto_47522 ) ) ( not ( = ?auto_47519 ?auto_47523 ) ) ( not ( = ?auto_47519 ?auto_47524 ) ) ( not ( = ?auto_47519 ?auto_47525 ) ) ( not ( = ?auto_47519 ?auto_47526 ) ) ( not ( = ?auto_47520 ?auto_47521 ) ) ( not ( = ?auto_47520 ?auto_47522 ) ) ( not ( = ?auto_47520 ?auto_47523 ) ) ( not ( = ?auto_47520 ?auto_47524 ) ) ( not ( = ?auto_47520 ?auto_47525 ) ) ( not ( = ?auto_47520 ?auto_47526 ) ) ( not ( = ?auto_47521 ?auto_47522 ) ) ( not ( = ?auto_47521 ?auto_47523 ) ) ( not ( = ?auto_47521 ?auto_47524 ) ) ( not ( = ?auto_47521 ?auto_47525 ) ) ( not ( = ?auto_47521 ?auto_47526 ) ) ( not ( = ?auto_47522 ?auto_47523 ) ) ( not ( = ?auto_47522 ?auto_47524 ) ) ( not ( = ?auto_47522 ?auto_47525 ) ) ( not ( = ?auto_47522 ?auto_47526 ) ) ( not ( = ?auto_47523 ?auto_47524 ) ) ( not ( = ?auto_47523 ?auto_47525 ) ) ( not ( = ?auto_47523 ?auto_47526 ) ) ( not ( = ?auto_47524 ?auto_47525 ) ) ( not ( = ?auto_47524 ?auto_47526 ) ) ( not ( = ?auto_47525 ?auto_47526 ) ) ( ON ?auto_47524 ?auto_47525 ) ( ON ?auto_47523 ?auto_47524 ) ( ON ?auto_47522 ?auto_47523 ) ( ON ?auto_47521 ?auto_47522 ) ( ON ?auto_47520 ?auto_47521 ) ( ON ?auto_47519 ?auto_47520 ) ( CLEAR ?auto_47519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47519 )
      ( MAKE-7PILE ?auto_47519 ?auto_47520 ?auto_47521 ?auto_47522 ?auto_47523 ?auto_47524 ?auto_47525 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_47534 - BLOCK
      ?auto_47535 - BLOCK
      ?auto_47536 - BLOCK
      ?auto_47537 - BLOCK
      ?auto_47538 - BLOCK
      ?auto_47539 - BLOCK
      ?auto_47540 - BLOCK
    )
    :vars
    (
      ?auto_47541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47540 ?auto_47541 ) ( not ( = ?auto_47534 ?auto_47535 ) ) ( not ( = ?auto_47534 ?auto_47536 ) ) ( not ( = ?auto_47534 ?auto_47537 ) ) ( not ( = ?auto_47534 ?auto_47538 ) ) ( not ( = ?auto_47534 ?auto_47539 ) ) ( not ( = ?auto_47534 ?auto_47540 ) ) ( not ( = ?auto_47534 ?auto_47541 ) ) ( not ( = ?auto_47535 ?auto_47536 ) ) ( not ( = ?auto_47535 ?auto_47537 ) ) ( not ( = ?auto_47535 ?auto_47538 ) ) ( not ( = ?auto_47535 ?auto_47539 ) ) ( not ( = ?auto_47535 ?auto_47540 ) ) ( not ( = ?auto_47535 ?auto_47541 ) ) ( not ( = ?auto_47536 ?auto_47537 ) ) ( not ( = ?auto_47536 ?auto_47538 ) ) ( not ( = ?auto_47536 ?auto_47539 ) ) ( not ( = ?auto_47536 ?auto_47540 ) ) ( not ( = ?auto_47536 ?auto_47541 ) ) ( not ( = ?auto_47537 ?auto_47538 ) ) ( not ( = ?auto_47537 ?auto_47539 ) ) ( not ( = ?auto_47537 ?auto_47540 ) ) ( not ( = ?auto_47537 ?auto_47541 ) ) ( not ( = ?auto_47538 ?auto_47539 ) ) ( not ( = ?auto_47538 ?auto_47540 ) ) ( not ( = ?auto_47538 ?auto_47541 ) ) ( not ( = ?auto_47539 ?auto_47540 ) ) ( not ( = ?auto_47539 ?auto_47541 ) ) ( not ( = ?auto_47540 ?auto_47541 ) ) ( ON ?auto_47539 ?auto_47540 ) ( ON ?auto_47538 ?auto_47539 ) ( ON ?auto_47537 ?auto_47538 ) ( ON ?auto_47536 ?auto_47537 ) ( ON ?auto_47535 ?auto_47536 ) ( ON ?auto_47534 ?auto_47535 ) ( CLEAR ?auto_47534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47534 )
      ( MAKE-7PILE ?auto_47534 ?auto_47535 ?auto_47536 ?auto_47537 ?auto_47538 ?auto_47539 ?auto_47540 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_47550 - BLOCK
      ?auto_47551 - BLOCK
      ?auto_47552 - BLOCK
      ?auto_47553 - BLOCK
      ?auto_47554 - BLOCK
      ?auto_47555 - BLOCK
      ?auto_47556 - BLOCK
      ?auto_47557 - BLOCK
    )
    :vars
    (
      ?auto_47558 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47556 ) ( ON ?auto_47557 ?auto_47558 ) ( CLEAR ?auto_47557 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47550 ) ( ON ?auto_47551 ?auto_47550 ) ( ON ?auto_47552 ?auto_47551 ) ( ON ?auto_47553 ?auto_47552 ) ( ON ?auto_47554 ?auto_47553 ) ( ON ?auto_47555 ?auto_47554 ) ( ON ?auto_47556 ?auto_47555 ) ( not ( = ?auto_47550 ?auto_47551 ) ) ( not ( = ?auto_47550 ?auto_47552 ) ) ( not ( = ?auto_47550 ?auto_47553 ) ) ( not ( = ?auto_47550 ?auto_47554 ) ) ( not ( = ?auto_47550 ?auto_47555 ) ) ( not ( = ?auto_47550 ?auto_47556 ) ) ( not ( = ?auto_47550 ?auto_47557 ) ) ( not ( = ?auto_47550 ?auto_47558 ) ) ( not ( = ?auto_47551 ?auto_47552 ) ) ( not ( = ?auto_47551 ?auto_47553 ) ) ( not ( = ?auto_47551 ?auto_47554 ) ) ( not ( = ?auto_47551 ?auto_47555 ) ) ( not ( = ?auto_47551 ?auto_47556 ) ) ( not ( = ?auto_47551 ?auto_47557 ) ) ( not ( = ?auto_47551 ?auto_47558 ) ) ( not ( = ?auto_47552 ?auto_47553 ) ) ( not ( = ?auto_47552 ?auto_47554 ) ) ( not ( = ?auto_47552 ?auto_47555 ) ) ( not ( = ?auto_47552 ?auto_47556 ) ) ( not ( = ?auto_47552 ?auto_47557 ) ) ( not ( = ?auto_47552 ?auto_47558 ) ) ( not ( = ?auto_47553 ?auto_47554 ) ) ( not ( = ?auto_47553 ?auto_47555 ) ) ( not ( = ?auto_47553 ?auto_47556 ) ) ( not ( = ?auto_47553 ?auto_47557 ) ) ( not ( = ?auto_47553 ?auto_47558 ) ) ( not ( = ?auto_47554 ?auto_47555 ) ) ( not ( = ?auto_47554 ?auto_47556 ) ) ( not ( = ?auto_47554 ?auto_47557 ) ) ( not ( = ?auto_47554 ?auto_47558 ) ) ( not ( = ?auto_47555 ?auto_47556 ) ) ( not ( = ?auto_47555 ?auto_47557 ) ) ( not ( = ?auto_47555 ?auto_47558 ) ) ( not ( = ?auto_47556 ?auto_47557 ) ) ( not ( = ?auto_47556 ?auto_47558 ) ) ( not ( = ?auto_47557 ?auto_47558 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47557 ?auto_47558 )
      ( !STACK ?auto_47557 ?auto_47556 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_47567 - BLOCK
      ?auto_47568 - BLOCK
      ?auto_47569 - BLOCK
      ?auto_47570 - BLOCK
      ?auto_47571 - BLOCK
      ?auto_47572 - BLOCK
      ?auto_47573 - BLOCK
      ?auto_47574 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47573 ) ( ON-TABLE ?auto_47574 ) ( CLEAR ?auto_47574 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47567 ) ( ON ?auto_47568 ?auto_47567 ) ( ON ?auto_47569 ?auto_47568 ) ( ON ?auto_47570 ?auto_47569 ) ( ON ?auto_47571 ?auto_47570 ) ( ON ?auto_47572 ?auto_47571 ) ( ON ?auto_47573 ?auto_47572 ) ( not ( = ?auto_47567 ?auto_47568 ) ) ( not ( = ?auto_47567 ?auto_47569 ) ) ( not ( = ?auto_47567 ?auto_47570 ) ) ( not ( = ?auto_47567 ?auto_47571 ) ) ( not ( = ?auto_47567 ?auto_47572 ) ) ( not ( = ?auto_47567 ?auto_47573 ) ) ( not ( = ?auto_47567 ?auto_47574 ) ) ( not ( = ?auto_47568 ?auto_47569 ) ) ( not ( = ?auto_47568 ?auto_47570 ) ) ( not ( = ?auto_47568 ?auto_47571 ) ) ( not ( = ?auto_47568 ?auto_47572 ) ) ( not ( = ?auto_47568 ?auto_47573 ) ) ( not ( = ?auto_47568 ?auto_47574 ) ) ( not ( = ?auto_47569 ?auto_47570 ) ) ( not ( = ?auto_47569 ?auto_47571 ) ) ( not ( = ?auto_47569 ?auto_47572 ) ) ( not ( = ?auto_47569 ?auto_47573 ) ) ( not ( = ?auto_47569 ?auto_47574 ) ) ( not ( = ?auto_47570 ?auto_47571 ) ) ( not ( = ?auto_47570 ?auto_47572 ) ) ( not ( = ?auto_47570 ?auto_47573 ) ) ( not ( = ?auto_47570 ?auto_47574 ) ) ( not ( = ?auto_47571 ?auto_47572 ) ) ( not ( = ?auto_47571 ?auto_47573 ) ) ( not ( = ?auto_47571 ?auto_47574 ) ) ( not ( = ?auto_47572 ?auto_47573 ) ) ( not ( = ?auto_47572 ?auto_47574 ) ) ( not ( = ?auto_47573 ?auto_47574 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_47574 )
      ( !STACK ?auto_47574 ?auto_47573 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_47583 - BLOCK
      ?auto_47584 - BLOCK
      ?auto_47585 - BLOCK
      ?auto_47586 - BLOCK
      ?auto_47587 - BLOCK
      ?auto_47588 - BLOCK
      ?auto_47589 - BLOCK
      ?auto_47590 - BLOCK
    )
    :vars
    (
      ?auto_47591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47590 ?auto_47591 ) ( ON-TABLE ?auto_47583 ) ( ON ?auto_47584 ?auto_47583 ) ( ON ?auto_47585 ?auto_47584 ) ( ON ?auto_47586 ?auto_47585 ) ( ON ?auto_47587 ?auto_47586 ) ( ON ?auto_47588 ?auto_47587 ) ( not ( = ?auto_47583 ?auto_47584 ) ) ( not ( = ?auto_47583 ?auto_47585 ) ) ( not ( = ?auto_47583 ?auto_47586 ) ) ( not ( = ?auto_47583 ?auto_47587 ) ) ( not ( = ?auto_47583 ?auto_47588 ) ) ( not ( = ?auto_47583 ?auto_47589 ) ) ( not ( = ?auto_47583 ?auto_47590 ) ) ( not ( = ?auto_47583 ?auto_47591 ) ) ( not ( = ?auto_47584 ?auto_47585 ) ) ( not ( = ?auto_47584 ?auto_47586 ) ) ( not ( = ?auto_47584 ?auto_47587 ) ) ( not ( = ?auto_47584 ?auto_47588 ) ) ( not ( = ?auto_47584 ?auto_47589 ) ) ( not ( = ?auto_47584 ?auto_47590 ) ) ( not ( = ?auto_47584 ?auto_47591 ) ) ( not ( = ?auto_47585 ?auto_47586 ) ) ( not ( = ?auto_47585 ?auto_47587 ) ) ( not ( = ?auto_47585 ?auto_47588 ) ) ( not ( = ?auto_47585 ?auto_47589 ) ) ( not ( = ?auto_47585 ?auto_47590 ) ) ( not ( = ?auto_47585 ?auto_47591 ) ) ( not ( = ?auto_47586 ?auto_47587 ) ) ( not ( = ?auto_47586 ?auto_47588 ) ) ( not ( = ?auto_47586 ?auto_47589 ) ) ( not ( = ?auto_47586 ?auto_47590 ) ) ( not ( = ?auto_47586 ?auto_47591 ) ) ( not ( = ?auto_47587 ?auto_47588 ) ) ( not ( = ?auto_47587 ?auto_47589 ) ) ( not ( = ?auto_47587 ?auto_47590 ) ) ( not ( = ?auto_47587 ?auto_47591 ) ) ( not ( = ?auto_47588 ?auto_47589 ) ) ( not ( = ?auto_47588 ?auto_47590 ) ) ( not ( = ?auto_47588 ?auto_47591 ) ) ( not ( = ?auto_47589 ?auto_47590 ) ) ( not ( = ?auto_47589 ?auto_47591 ) ) ( not ( = ?auto_47590 ?auto_47591 ) ) ( CLEAR ?auto_47588 ) ( ON ?auto_47589 ?auto_47590 ) ( CLEAR ?auto_47589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_47583 ?auto_47584 ?auto_47585 ?auto_47586 ?auto_47587 ?auto_47588 ?auto_47589 )
      ( MAKE-8PILE ?auto_47583 ?auto_47584 ?auto_47585 ?auto_47586 ?auto_47587 ?auto_47588 ?auto_47589 ?auto_47590 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_47600 - BLOCK
      ?auto_47601 - BLOCK
      ?auto_47602 - BLOCK
      ?auto_47603 - BLOCK
      ?auto_47604 - BLOCK
      ?auto_47605 - BLOCK
      ?auto_47606 - BLOCK
      ?auto_47607 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47607 ) ( ON-TABLE ?auto_47600 ) ( ON ?auto_47601 ?auto_47600 ) ( ON ?auto_47602 ?auto_47601 ) ( ON ?auto_47603 ?auto_47602 ) ( ON ?auto_47604 ?auto_47603 ) ( ON ?auto_47605 ?auto_47604 ) ( not ( = ?auto_47600 ?auto_47601 ) ) ( not ( = ?auto_47600 ?auto_47602 ) ) ( not ( = ?auto_47600 ?auto_47603 ) ) ( not ( = ?auto_47600 ?auto_47604 ) ) ( not ( = ?auto_47600 ?auto_47605 ) ) ( not ( = ?auto_47600 ?auto_47606 ) ) ( not ( = ?auto_47600 ?auto_47607 ) ) ( not ( = ?auto_47601 ?auto_47602 ) ) ( not ( = ?auto_47601 ?auto_47603 ) ) ( not ( = ?auto_47601 ?auto_47604 ) ) ( not ( = ?auto_47601 ?auto_47605 ) ) ( not ( = ?auto_47601 ?auto_47606 ) ) ( not ( = ?auto_47601 ?auto_47607 ) ) ( not ( = ?auto_47602 ?auto_47603 ) ) ( not ( = ?auto_47602 ?auto_47604 ) ) ( not ( = ?auto_47602 ?auto_47605 ) ) ( not ( = ?auto_47602 ?auto_47606 ) ) ( not ( = ?auto_47602 ?auto_47607 ) ) ( not ( = ?auto_47603 ?auto_47604 ) ) ( not ( = ?auto_47603 ?auto_47605 ) ) ( not ( = ?auto_47603 ?auto_47606 ) ) ( not ( = ?auto_47603 ?auto_47607 ) ) ( not ( = ?auto_47604 ?auto_47605 ) ) ( not ( = ?auto_47604 ?auto_47606 ) ) ( not ( = ?auto_47604 ?auto_47607 ) ) ( not ( = ?auto_47605 ?auto_47606 ) ) ( not ( = ?auto_47605 ?auto_47607 ) ) ( not ( = ?auto_47606 ?auto_47607 ) ) ( CLEAR ?auto_47605 ) ( ON ?auto_47606 ?auto_47607 ) ( CLEAR ?auto_47606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_47600 ?auto_47601 ?auto_47602 ?auto_47603 ?auto_47604 ?auto_47605 ?auto_47606 )
      ( MAKE-8PILE ?auto_47600 ?auto_47601 ?auto_47602 ?auto_47603 ?auto_47604 ?auto_47605 ?auto_47606 ?auto_47607 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_47616 - BLOCK
      ?auto_47617 - BLOCK
      ?auto_47618 - BLOCK
      ?auto_47619 - BLOCK
      ?auto_47620 - BLOCK
      ?auto_47621 - BLOCK
      ?auto_47622 - BLOCK
      ?auto_47623 - BLOCK
    )
    :vars
    (
      ?auto_47624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47623 ?auto_47624 ) ( ON-TABLE ?auto_47616 ) ( ON ?auto_47617 ?auto_47616 ) ( ON ?auto_47618 ?auto_47617 ) ( ON ?auto_47619 ?auto_47618 ) ( ON ?auto_47620 ?auto_47619 ) ( not ( = ?auto_47616 ?auto_47617 ) ) ( not ( = ?auto_47616 ?auto_47618 ) ) ( not ( = ?auto_47616 ?auto_47619 ) ) ( not ( = ?auto_47616 ?auto_47620 ) ) ( not ( = ?auto_47616 ?auto_47621 ) ) ( not ( = ?auto_47616 ?auto_47622 ) ) ( not ( = ?auto_47616 ?auto_47623 ) ) ( not ( = ?auto_47616 ?auto_47624 ) ) ( not ( = ?auto_47617 ?auto_47618 ) ) ( not ( = ?auto_47617 ?auto_47619 ) ) ( not ( = ?auto_47617 ?auto_47620 ) ) ( not ( = ?auto_47617 ?auto_47621 ) ) ( not ( = ?auto_47617 ?auto_47622 ) ) ( not ( = ?auto_47617 ?auto_47623 ) ) ( not ( = ?auto_47617 ?auto_47624 ) ) ( not ( = ?auto_47618 ?auto_47619 ) ) ( not ( = ?auto_47618 ?auto_47620 ) ) ( not ( = ?auto_47618 ?auto_47621 ) ) ( not ( = ?auto_47618 ?auto_47622 ) ) ( not ( = ?auto_47618 ?auto_47623 ) ) ( not ( = ?auto_47618 ?auto_47624 ) ) ( not ( = ?auto_47619 ?auto_47620 ) ) ( not ( = ?auto_47619 ?auto_47621 ) ) ( not ( = ?auto_47619 ?auto_47622 ) ) ( not ( = ?auto_47619 ?auto_47623 ) ) ( not ( = ?auto_47619 ?auto_47624 ) ) ( not ( = ?auto_47620 ?auto_47621 ) ) ( not ( = ?auto_47620 ?auto_47622 ) ) ( not ( = ?auto_47620 ?auto_47623 ) ) ( not ( = ?auto_47620 ?auto_47624 ) ) ( not ( = ?auto_47621 ?auto_47622 ) ) ( not ( = ?auto_47621 ?auto_47623 ) ) ( not ( = ?auto_47621 ?auto_47624 ) ) ( not ( = ?auto_47622 ?auto_47623 ) ) ( not ( = ?auto_47622 ?auto_47624 ) ) ( not ( = ?auto_47623 ?auto_47624 ) ) ( ON ?auto_47622 ?auto_47623 ) ( CLEAR ?auto_47620 ) ( ON ?auto_47621 ?auto_47622 ) ( CLEAR ?auto_47621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47616 ?auto_47617 ?auto_47618 ?auto_47619 ?auto_47620 ?auto_47621 )
      ( MAKE-8PILE ?auto_47616 ?auto_47617 ?auto_47618 ?auto_47619 ?auto_47620 ?auto_47621 ?auto_47622 ?auto_47623 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_47633 - BLOCK
      ?auto_47634 - BLOCK
      ?auto_47635 - BLOCK
      ?auto_47636 - BLOCK
      ?auto_47637 - BLOCK
      ?auto_47638 - BLOCK
      ?auto_47639 - BLOCK
      ?auto_47640 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47640 ) ( ON-TABLE ?auto_47633 ) ( ON ?auto_47634 ?auto_47633 ) ( ON ?auto_47635 ?auto_47634 ) ( ON ?auto_47636 ?auto_47635 ) ( ON ?auto_47637 ?auto_47636 ) ( not ( = ?auto_47633 ?auto_47634 ) ) ( not ( = ?auto_47633 ?auto_47635 ) ) ( not ( = ?auto_47633 ?auto_47636 ) ) ( not ( = ?auto_47633 ?auto_47637 ) ) ( not ( = ?auto_47633 ?auto_47638 ) ) ( not ( = ?auto_47633 ?auto_47639 ) ) ( not ( = ?auto_47633 ?auto_47640 ) ) ( not ( = ?auto_47634 ?auto_47635 ) ) ( not ( = ?auto_47634 ?auto_47636 ) ) ( not ( = ?auto_47634 ?auto_47637 ) ) ( not ( = ?auto_47634 ?auto_47638 ) ) ( not ( = ?auto_47634 ?auto_47639 ) ) ( not ( = ?auto_47634 ?auto_47640 ) ) ( not ( = ?auto_47635 ?auto_47636 ) ) ( not ( = ?auto_47635 ?auto_47637 ) ) ( not ( = ?auto_47635 ?auto_47638 ) ) ( not ( = ?auto_47635 ?auto_47639 ) ) ( not ( = ?auto_47635 ?auto_47640 ) ) ( not ( = ?auto_47636 ?auto_47637 ) ) ( not ( = ?auto_47636 ?auto_47638 ) ) ( not ( = ?auto_47636 ?auto_47639 ) ) ( not ( = ?auto_47636 ?auto_47640 ) ) ( not ( = ?auto_47637 ?auto_47638 ) ) ( not ( = ?auto_47637 ?auto_47639 ) ) ( not ( = ?auto_47637 ?auto_47640 ) ) ( not ( = ?auto_47638 ?auto_47639 ) ) ( not ( = ?auto_47638 ?auto_47640 ) ) ( not ( = ?auto_47639 ?auto_47640 ) ) ( ON ?auto_47639 ?auto_47640 ) ( CLEAR ?auto_47637 ) ( ON ?auto_47638 ?auto_47639 ) ( CLEAR ?auto_47638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47633 ?auto_47634 ?auto_47635 ?auto_47636 ?auto_47637 ?auto_47638 )
      ( MAKE-8PILE ?auto_47633 ?auto_47634 ?auto_47635 ?auto_47636 ?auto_47637 ?auto_47638 ?auto_47639 ?auto_47640 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_47649 - BLOCK
      ?auto_47650 - BLOCK
      ?auto_47651 - BLOCK
      ?auto_47652 - BLOCK
      ?auto_47653 - BLOCK
      ?auto_47654 - BLOCK
      ?auto_47655 - BLOCK
      ?auto_47656 - BLOCK
    )
    :vars
    (
      ?auto_47657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47656 ?auto_47657 ) ( ON-TABLE ?auto_47649 ) ( ON ?auto_47650 ?auto_47649 ) ( ON ?auto_47651 ?auto_47650 ) ( ON ?auto_47652 ?auto_47651 ) ( not ( = ?auto_47649 ?auto_47650 ) ) ( not ( = ?auto_47649 ?auto_47651 ) ) ( not ( = ?auto_47649 ?auto_47652 ) ) ( not ( = ?auto_47649 ?auto_47653 ) ) ( not ( = ?auto_47649 ?auto_47654 ) ) ( not ( = ?auto_47649 ?auto_47655 ) ) ( not ( = ?auto_47649 ?auto_47656 ) ) ( not ( = ?auto_47649 ?auto_47657 ) ) ( not ( = ?auto_47650 ?auto_47651 ) ) ( not ( = ?auto_47650 ?auto_47652 ) ) ( not ( = ?auto_47650 ?auto_47653 ) ) ( not ( = ?auto_47650 ?auto_47654 ) ) ( not ( = ?auto_47650 ?auto_47655 ) ) ( not ( = ?auto_47650 ?auto_47656 ) ) ( not ( = ?auto_47650 ?auto_47657 ) ) ( not ( = ?auto_47651 ?auto_47652 ) ) ( not ( = ?auto_47651 ?auto_47653 ) ) ( not ( = ?auto_47651 ?auto_47654 ) ) ( not ( = ?auto_47651 ?auto_47655 ) ) ( not ( = ?auto_47651 ?auto_47656 ) ) ( not ( = ?auto_47651 ?auto_47657 ) ) ( not ( = ?auto_47652 ?auto_47653 ) ) ( not ( = ?auto_47652 ?auto_47654 ) ) ( not ( = ?auto_47652 ?auto_47655 ) ) ( not ( = ?auto_47652 ?auto_47656 ) ) ( not ( = ?auto_47652 ?auto_47657 ) ) ( not ( = ?auto_47653 ?auto_47654 ) ) ( not ( = ?auto_47653 ?auto_47655 ) ) ( not ( = ?auto_47653 ?auto_47656 ) ) ( not ( = ?auto_47653 ?auto_47657 ) ) ( not ( = ?auto_47654 ?auto_47655 ) ) ( not ( = ?auto_47654 ?auto_47656 ) ) ( not ( = ?auto_47654 ?auto_47657 ) ) ( not ( = ?auto_47655 ?auto_47656 ) ) ( not ( = ?auto_47655 ?auto_47657 ) ) ( not ( = ?auto_47656 ?auto_47657 ) ) ( ON ?auto_47655 ?auto_47656 ) ( ON ?auto_47654 ?auto_47655 ) ( CLEAR ?auto_47652 ) ( ON ?auto_47653 ?auto_47654 ) ( CLEAR ?auto_47653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47649 ?auto_47650 ?auto_47651 ?auto_47652 ?auto_47653 )
      ( MAKE-8PILE ?auto_47649 ?auto_47650 ?auto_47651 ?auto_47652 ?auto_47653 ?auto_47654 ?auto_47655 ?auto_47656 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_47666 - BLOCK
      ?auto_47667 - BLOCK
      ?auto_47668 - BLOCK
      ?auto_47669 - BLOCK
      ?auto_47670 - BLOCK
      ?auto_47671 - BLOCK
      ?auto_47672 - BLOCK
      ?auto_47673 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47673 ) ( ON-TABLE ?auto_47666 ) ( ON ?auto_47667 ?auto_47666 ) ( ON ?auto_47668 ?auto_47667 ) ( ON ?auto_47669 ?auto_47668 ) ( not ( = ?auto_47666 ?auto_47667 ) ) ( not ( = ?auto_47666 ?auto_47668 ) ) ( not ( = ?auto_47666 ?auto_47669 ) ) ( not ( = ?auto_47666 ?auto_47670 ) ) ( not ( = ?auto_47666 ?auto_47671 ) ) ( not ( = ?auto_47666 ?auto_47672 ) ) ( not ( = ?auto_47666 ?auto_47673 ) ) ( not ( = ?auto_47667 ?auto_47668 ) ) ( not ( = ?auto_47667 ?auto_47669 ) ) ( not ( = ?auto_47667 ?auto_47670 ) ) ( not ( = ?auto_47667 ?auto_47671 ) ) ( not ( = ?auto_47667 ?auto_47672 ) ) ( not ( = ?auto_47667 ?auto_47673 ) ) ( not ( = ?auto_47668 ?auto_47669 ) ) ( not ( = ?auto_47668 ?auto_47670 ) ) ( not ( = ?auto_47668 ?auto_47671 ) ) ( not ( = ?auto_47668 ?auto_47672 ) ) ( not ( = ?auto_47668 ?auto_47673 ) ) ( not ( = ?auto_47669 ?auto_47670 ) ) ( not ( = ?auto_47669 ?auto_47671 ) ) ( not ( = ?auto_47669 ?auto_47672 ) ) ( not ( = ?auto_47669 ?auto_47673 ) ) ( not ( = ?auto_47670 ?auto_47671 ) ) ( not ( = ?auto_47670 ?auto_47672 ) ) ( not ( = ?auto_47670 ?auto_47673 ) ) ( not ( = ?auto_47671 ?auto_47672 ) ) ( not ( = ?auto_47671 ?auto_47673 ) ) ( not ( = ?auto_47672 ?auto_47673 ) ) ( ON ?auto_47672 ?auto_47673 ) ( ON ?auto_47671 ?auto_47672 ) ( CLEAR ?auto_47669 ) ( ON ?auto_47670 ?auto_47671 ) ( CLEAR ?auto_47670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47666 ?auto_47667 ?auto_47668 ?auto_47669 ?auto_47670 )
      ( MAKE-8PILE ?auto_47666 ?auto_47667 ?auto_47668 ?auto_47669 ?auto_47670 ?auto_47671 ?auto_47672 ?auto_47673 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_47682 - BLOCK
      ?auto_47683 - BLOCK
      ?auto_47684 - BLOCK
      ?auto_47685 - BLOCK
      ?auto_47686 - BLOCK
      ?auto_47687 - BLOCK
      ?auto_47688 - BLOCK
      ?auto_47689 - BLOCK
    )
    :vars
    (
      ?auto_47690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47689 ?auto_47690 ) ( ON-TABLE ?auto_47682 ) ( ON ?auto_47683 ?auto_47682 ) ( ON ?auto_47684 ?auto_47683 ) ( not ( = ?auto_47682 ?auto_47683 ) ) ( not ( = ?auto_47682 ?auto_47684 ) ) ( not ( = ?auto_47682 ?auto_47685 ) ) ( not ( = ?auto_47682 ?auto_47686 ) ) ( not ( = ?auto_47682 ?auto_47687 ) ) ( not ( = ?auto_47682 ?auto_47688 ) ) ( not ( = ?auto_47682 ?auto_47689 ) ) ( not ( = ?auto_47682 ?auto_47690 ) ) ( not ( = ?auto_47683 ?auto_47684 ) ) ( not ( = ?auto_47683 ?auto_47685 ) ) ( not ( = ?auto_47683 ?auto_47686 ) ) ( not ( = ?auto_47683 ?auto_47687 ) ) ( not ( = ?auto_47683 ?auto_47688 ) ) ( not ( = ?auto_47683 ?auto_47689 ) ) ( not ( = ?auto_47683 ?auto_47690 ) ) ( not ( = ?auto_47684 ?auto_47685 ) ) ( not ( = ?auto_47684 ?auto_47686 ) ) ( not ( = ?auto_47684 ?auto_47687 ) ) ( not ( = ?auto_47684 ?auto_47688 ) ) ( not ( = ?auto_47684 ?auto_47689 ) ) ( not ( = ?auto_47684 ?auto_47690 ) ) ( not ( = ?auto_47685 ?auto_47686 ) ) ( not ( = ?auto_47685 ?auto_47687 ) ) ( not ( = ?auto_47685 ?auto_47688 ) ) ( not ( = ?auto_47685 ?auto_47689 ) ) ( not ( = ?auto_47685 ?auto_47690 ) ) ( not ( = ?auto_47686 ?auto_47687 ) ) ( not ( = ?auto_47686 ?auto_47688 ) ) ( not ( = ?auto_47686 ?auto_47689 ) ) ( not ( = ?auto_47686 ?auto_47690 ) ) ( not ( = ?auto_47687 ?auto_47688 ) ) ( not ( = ?auto_47687 ?auto_47689 ) ) ( not ( = ?auto_47687 ?auto_47690 ) ) ( not ( = ?auto_47688 ?auto_47689 ) ) ( not ( = ?auto_47688 ?auto_47690 ) ) ( not ( = ?auto_47689 ?auto_47690 ) ) ( ON ?auto_47688 ?auto_47689 ) ( ON ?auto_47687 ?auto_47688 ) ( ON ?auto_47686 ?auto_47687 ) ( CLEAR ?auto_47684 ) ( ON ?auto_47685 ?auto_47686 ) ( CLEAR ?auto_47685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47682 ?auto_47683 ?auto_47684 ?auto_47685 )
      ( MAKE-8PILE ?auto_47682 ?auto_47683 ?auto_47684 ?auto_47685 ?auto_47686 ?auto_47687 ?auto_47688 ?auto_47689 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_47699 - BLOCK
      ?auto_47700 - BLOCK
      ?auto_47701 - BLOCK
      ?auto_47702 - BLOCK
      ?auto_47703 - BLOCK
      ?auto_47704 - BLOCK
      ?auto_47705 - BLOCK
      ?auto_47706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47706 ) ( ON-TABLE ?auto_47699 ) ( ON ?auto_47700 ?auto_47699 ) ( ON ?auto_47701 ?auto_47700 ) ( not ( = ?auto_47699 ?auto_47700 ) ) ( not ( = ?auto_47699 ?auto_47701 ) ) ( not ( = ?auto_47699 ?auto_47702 ) ) ( not ( = ?auto_47699 ?auto_47703 ) ) ( not ( = ?auto_47699 ?auto_47704 ) ) ( not ( = ?auto_47699 ?auto_47705 ) ) ( not ( = ?auto_47699 ?auto_47706 ) ) ( not ( = ?auto_47700 ?auto_47701 ) ) ( not ( = ?auto_47700 ?auto_47702 ) ) ( not ( = ?auto_47700 ?auto_47703 ) ) ( not ( = ?auto_47700 ?auto_47704 ) ) ( not ( = ?auto_47700 ?auto_47705 ) ) ( not ( = ?auto_47700 ?auto_47706 ) ) ( not ( = ?auto_47701 ?auto_47702 ) ) ( not ( = ?auto_47701 ?auto_47703 ) ) ( not ( = ?auto_47701 ?auto_47704 ) ) ( not ( = ?auto_47701 ?auto_47705 ) ) ( not ( = ?auto_47701 ?auto_47706 ) ) ( not ( = ?auto_47702 ?auto_47703 ) ) ( not ( = ?auto_47702 ?auto_47704 ) ) ( not ( = ?auto_47702 ?auto_47705 ) ) ( not ( = ?auto_47702 ?auto_47706 ) ) ( not ( = ?auto_47703 ?auto_47704 ) ) ( not ( = ?auto_47703 ?auto_47705 ) ) ( not ( = ?auto_47703 ?auto_47706 ) ) ( not ( = ?auto_47704 ?auto_47705 ) ) ( not ( = ?auto_47704 ?auto_47706 ) ) ( not ( = ?auto_47705 ?auto_47706 ) ) ( ON ?auto_47705 ?auto_47706 ) ( ON ?auto_47704 ?auto_47705 ) ( ON ?auto_47703 ?auto_47704 ) ( CLEAR ?auto_47701 ) ( ON ?auto_47702 ?auto_47703 ) ( CLEAR ?auto_47702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47699 ?auto_47700 ?auto_47701 ?auto_47702 )
      ( MAKE-8PILE ?auto_47699 ?auto_47700 ?auto_47701 ?auto_47702 ?auto_47703 ?auto_47704 ?auto_47705 ?auto_47706 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_47715 - BLOCK
      ?auto_47716 - BLOCK
      ?auto_47717 - BLOCK
      ?auto_47718 - BLOCK
      ?auto_47719 - BLOCK
      ?auto_47720 - BLOCK
      ?auto_47721 - BLOCK
      ?auto_47722 - BLOCK
    )
    :vars
    (
      ?auto_47723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47722 ?auto_47723 ) ( ON-TABLE ?auto_47715 ) ( ON ?auto_47716 ?auto_47715 ) ( not ( = ?auto_47715 ?auto_47716 ) ) ( not ( = ?auto_47715 ?auto_47717 ) ) ( not ( = ?auto_47715 ?auto_47718 ) ) ( not ( = ?auto_47715 ?auto_47719 ) ) ( not ( = ?auto_47715 ?auto_47720 ) ) ( not ( = ?auto_47715 ?auto_47721 ) ) ( not ( = ?auto_47715 ?auto_47722 ) ) ( not ( = ?auto_47715 ?auto_47723 ) ) ( not ( = ?auto_47716 ?auto_47717 ) ) ( not ( = ?auto_47716 ?auto_47718 ) ) ( not ( = ?auto_47716 ?auto_47719 ) ) ( not ( = ?auto_47716 ?auto_47720 ) ) ( not ( = ?auto_47716 ?auto_47721 ) ) ( not ( = ?auto_47716 ?auto_47722 ) ) ( not ( = ?auto_47716 ?auto_47723 ) ) ( not ( = ?auto_47717 ?auto_47718 ) ) ( not ( = ?auto_47717 ?auto_47719 ) ) ( not ( = ?auto_47717 ?auto_47720 ) ) ( not ( = ?auto_47717 ?auto_47721 ) ) ( not ( = ?auto_47717 ?auto_47722 ) ) ( not ( = ?auto_47717 ?auto_47723 ) ) ( not ( = ?auto_47718 ?auto_47719 ) ) ( not ( = ?auto_47718 ?auto_47720 ) ) ( not ( = ?auto_47718 ?auto_47721 ) ) ( not ( = ?auto_47718 ?auto_47722 ) ) ( not ( = ?auto_47718 ?auto_47723 ) ) ( not ( = ?auto_47719 ?auto_47720 ) ) ( not ( = ?auto_47719 ?auto_47721 ) ) ( not ( = ?auto_47719 ?auto_47722 ) ) ( not ( = ?auto_47719 ?auto_47723 ) ) ( not ( = ?auto_47720 ?auto_47721 ) ) ( not ( = ?auto_47720 ?auto_47722 ) ) ( not ( = ?auto_47720 ?auto_47723 ) ) ( not ( = ?auto_47721 ?auto_47722 ) ) ( not ( = ?auto_47721 ?auto_47723 ) ) ( not ( = ?auto_47722 ?auto_47723 ) ) ( ON ?auto_47721 ?auto_47722 ) ( ON ?auto_47720 ?auto_47721 ) ( ON ?auto_47719 ?auto_47720 ) ( ON ?auto_47718 ?auto_47719 ) ( CLEAR ?auto_47716 ) ( ON ?auto_47717 ?auto_47718 ) ( CLEAR ?auto_47717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47715 ?auto_47716 ?auto_47717 )
      ( MAKE-8PILE ?auto_47715 ?auto_47716 ?auto_47717 ?auto_47718 ?auto_47719 ?auto_47720 ?auto_47721 ?auto_47722 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_47732 - BLOCK
      ?auto_47733 - BLOCK
      ?auto_47734 - BLOCK
      ?auto_47735 - BLOCK
      ?auto_47736 - BLOCK
      ?auto_47737 - BLOCK
      ?auto_47738 - BLOCK
      ?auto_47739 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47739 ) ( ON-TABLE ?auto_47732 ) ( ON ?auto_47733 ?auto_47732 ) ( not ( = ?auto_47732 ?auto_47733 ) ) ( not ( = ?auto_47732 ?auto_47734 ) ) ( not ( = ?auto_47732 ?auto_47735 ) ) ( not ( = ?auto_47732 ?auto_47736 ) ) ( not ( = ?auto_47732 ?auto_47737 ) ) ( not ( = ?auto_47732 ?auto_47738 ) ) ( not ( = ?auto_47732 ?auto_47739 ) ) ( not ( = ?auto_47733 ?auto_47734 ) ) ( not ( = ?auto_47733 ?auto_47735 ) ) ( not ( = ?auto_47733 ?auto_47736 ) ) ( not ( = ?auto_47733 ?auto_47737 ) ) ( not ( = ?auto_47733 ?auto_47738 ) ) ( not ( = ?auto_47733 ?auto_47739 ) ) ( not ( = ?auto_47734 ?auto_47735 ) ) ( not ( = ?auto_47734 ?auto_47736 ) ) ( not ( = ?auto_47734 ?auto_47737 ) ) ( not ( = ?auto_47734 ?auto_47738 ) ) ( not ( = ?auto_47734 ?auto_47739 ) ) ( not ( = ?auto_47735 ?auto_47736 ) ) ( not ( = ?auto_47735 ?auto_47737 ) ) ( not ( = ?auto_47735 ?auto_47738 ) ) ( not ( = ?auto_47735 ?auto_47739 ) ) ( not ( = ?auto_47736 ?auto_47737 ) ) ( not ( = ?auto_47736 ?auto_47738 ) ) ( not ( = ?auto_47736 ?auto_47739 ) ) ( not ( = ?auto_47737 ?auto_47738 ) ) ( not ( = ?auto_47737 ?auto_47739 ) ) ( not ( = ?auto_47738 ?auto_47739 ) ) ( ON ?auto_47738 ?auto_47739 ) ( ON ?auto_47737 ?auto_47738 ) ( ON ?auto_47736 ?auto_47737 ) ( ON ?auto_47735 ?auto_47736 ) ( CLEAR ?auto_47733 ) ( ON ?auto_47734 ?auto_47735 ) ( CLEAR ?auto_47734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47732 ?auto_47733 ?auto_47734 )
      ( MAKE-8PILE ?auto_47732 ?auto_47733 ?auto_47734 ?auto_47735 ?auto_47736 ?auto_47737 ?auto_47738 ?auto_47739 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_47748 - BLOCK
      ?auto_47749 - BLOCK
      ?auto_47750 - BLOCK
      ?auto_47751 - BLOCK
      ?auto_47752 - BLOCK
      ?auto_47753 - BLOCK
      ?auto_47754 - BLOCK
      ?auto_47755 - BLOCK
    )
    :vars
    (
      ?auto_47756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47755 ?auto_47756 ) ( ON-TABLE ?auto_47748 ) ( not ( = ?auto_47748 ?auto_47749 ) ) ( not ( = ?auto_47748 ?auto_47750 ) ) ( not ( = ?auto_47748 ?auto_47751 ) ) ( not ( = ?auto_47748 ?auto_47752 ) ) ( not ( = ?auto_47748 ?auto_47753 ) ) ( not ( = ?auto_47748 ?auto_47754 ) ) ( not ( = ?auto_47748 ?auto_47755 ) ) ( not ( = ?auto_47748 ?auto_47756 ) ) ( not ( = ?auto_47749 ?auto_47750 ) ) ( not ( = ?auto_47749 ?auto_47751 ) ) ( not ( = ?auto_47749 ?auto_47752 ) ) ( not ( = ?auto_47749 ?auto_47753 ) ) ( not ( = ?auto_47749 ?auto_47754 ) ) ( not ( = ?auto_47749 ?auto_47755 ) ) ( not ( = ?auto_47749 ?auto_47756 ) ) ( not ( = ?auto_47750 ?auto_47751 ) ) ( not ( = ?auto_47750 ?auto_47752 ) ) ( not ( = ?auto_47750 ?auto_47753 ) ) ( not ( = ?auto_47750 ?auto_47754 ) ) ( not ( = ?auto_47750 ?auto_47755 ) ) ( not ( = ?auto_47750 ?auto_47756 ) ) ( not ( = ?auto_47751 ?auto_47752 ) ) ( not ( = ?auto_47751 ?auto_47753 ) ) ( not ( = ?auto_47751 ?auto_47754 ) ) ( not ( = ?auto_47751 ?auto_47755 ) ) ( not ( = ?auto_47751 ?auto_47756 ) ) ( not ( = ?auto_47752 ?auto_47753 ) ) ( not ( = ?auto_47752 ?auto_47754 ) ) ( not ( = ?auto_47752 ?auto_47755 ) ) ( not ( = ?auto_47752 ?auto_47756 ) ) ( not ( = ?auto_47753 ?auto_47754 ) ) ( not ( = ?auto_47753 ?auto_47755 ) ) ( not ( = ?auto_47753 ?auto_47756 ) ) ( not ( = ?auto_47754 ?auto_47755 ) ) ( not ( = ?auto_47754 ?auto_47756 ) ) ( not ( = ?auto_47755 ?auto_47756 ) ) ( ON ?auto_47754 ?auto_47755 ) ( ON ?auto_47753 ?auto_47754 ) ( ON ?auto_47752 ?auto_47753 ) ( ON ?auto_47751 ?auto_47752 ) ( ON ?auto_47750 ?auto_47751 ) ( CLEAR ?auto_47748 ) ( ON ?auto_47749 ?auto_47750 ) ( CLEAR ?auto_47749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47748 ?auto_47749 )
      ( MAKE-8PILE ?auto_47748 ?auto_47749 ?auto_47750 ?auto_47751 ?auto_47752 ?auto_47753 ?auto_47754 ?auto_47755 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_47765 - BLOCK
      ?auto_47766 - BLOCK
      ?auto_47767 - BLOCK
      ?auto_47768 - BLOCK
      ?auto_47769 - BLOCK
      ?auto_47770 - BLOCK
      ?auto_47771 - BLOCK
      ?auto_47772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47772 ) ( ON-TABLE ?auto_47765 ) ( not ( = ?auto_47765 ?auto_47766 ) ) ( not ( = ?auto_47765 ?auto_47767 ) ) ( not ( = ?auto_47765 ?auto_47768 ) ) ( not ( = ?auto_47765 ?auto_47769 ) ) ( not ( = ?auto_47765 ?auto_47770 ) ) ( not ( = ?auto_47765 ?auto_47771 ) ) ( not ( = ?auto_47765 ?auto_47772 ) ) ( not ( = ?auto_47766 ?auto_47767 ) ) ( not ( = ?auto_47766 ?auto_47768 ) ) ( not ( = ?auto_47766 ?auto_47769 ) ) ( not ( = ?auto_47766 ?auto_47770 ) ) ( not ( = ?auto_47766 ?auto_47771 ) ) ( not ( = ?auto_47766 ?auto_47772 ) ) ( not ( = ?auto_47767 ?auto_47768 ) ) ( not ( = ?auto_47767 ?auto_47769 ) ) ( not ( = ?auto_47767 ?auto_47770 ) ) ( not ( = ?auto_47767 ?auto_47771 ) ) ( not ( = ?auto_47767 ?auto_47772 ) ) ( not ( = ?auto_47768 ?auto_47769 ) ) ( not ( = ?auto_47768 ?auto_47770 ) ) ( not ( = ?auto_47768 ?auto_47771 ) ) ( not ( = ?auto_47768 ?auto_47772 ) ) ( not ( = ?auto_47769 ?auto_47770 ) ) ( not ( = ?auto_47769 ?auto_47771 ) ) ( not ( = ?auto_47769 ?auto_47772 ) ) ( not ( = ?auto_47770 ?auto_47771 ) ) ( not ( = ?auto_47770 ?auto_47772 ) ) ( not ( = ?auto_47771 ?auto_47772 ) ) ( ON ?auto_47771 ?auto_47772 ) ( ON ?auto_47770 ?auto_47771 ) ( ON ?auto_47769 ?auto_47770 ) ( ON ?auto_47768 ?auto_47769 ) ( ON ?auto_47767 ?auto_47768 ) ( CLEAR ?auto_47765 ) ( ON ?auto_47766 ?auto_47767 ) ( CLEAR ?auto_47766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47765 ?auto_47766 )
      ( MAKE-8PILE ?auto_47765 ?auto_47766 ?auto_47767 ?auto_47768 ?auto_47769 ?auto_47770 ?auto_47771 ?auto_47772 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_47781 - BLOCK
      ?auto_47782 - BLOCK
      ?auto_47783 - BLOCK
      ?auto_47784 - BLOCK
      ?auto_47785 - BLOCK
      ?auto_47786 - BLOCK
      ?auto_47787 - BLOCK
      ?auto_47788 - BLOCK
    )
    :vars
    (
      ?auto_47789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47788 ?auto_47789 ) ( not ( = ?auto_47781 ?auto_47782 ) ) ( not ( = ?auto_47781 ?auto_47783 ) ) ( not ( = ?auto_47781 ?auto_47784 ) ) ( not ( = ?auto_47781 ?auto_47785 ) ) ( not ( = ?auto_47781 ?auto_47786 ) ) ( not ( = ?auto_47781 ?auto_47787 ) ) ( not ( = ?auto_47781 ?auto_47788 ) ) ( not ( = ?auto_47781 ?auto_47789 ) ) ( not ( = ?auto_47782 ?auto_47783 ) ) ( not ( = ?auto_47782 ?auto_47784 ) ) ( not ( = ?auto_47782 ?auto_47785 ) ) ( not ( = ?auto_47782 ?auto_47786 ) ) ( not ( = ?auto_47782 ?auto_47787 ) ) ( not ( = ?auto_47782 ?auto_47788 ) ) ( not ( = ?auto_47782 ?auto_47789 ) ) ( not ( = ?auto_47783 ?auto_47784 ) ) ( not ( = ?auto_47783 ?auto_47785 ) ) ( not ( = ?auto_47783 ?auto_47786 ) ) ( not ( = ?auto_47783 ?auto_47787 ) ) ( not ( = ?auto_47783 ?auto_47788 ) ) ( not ( = ?auto_47783 ?auto_47789 ) ) ( not ( = ?auto_47784 ?auto_47785 ) ) ( not ( = ?auto_47784 ?auto_47786 ) ) ( not ( = ?auto_47784 ?auto_47787 ) ) ( not ( = ?auto_47784 ?auto_47788 ) ) ( not ( = ?auto_47784 ?auto_47789 ) ) ( not ( = ?auto_47785 ?auto_47786 ) ) ( not ( = ?auto_47785 ?auto_47787 ) ) ( not ( = ?auto_47785 ?auto_47788 ) ) ( not ( = ?auto_47785 ?auto_47789 ) ) ( not ( = ?auto_47786 ?auto_47787 ) ) ( not ( = ?auto_47786 ?auto_47788 ) ) ( not ( = ?auto_47786 ?auto_47789 ) ) ( not ( = ?auto_47787 ?auto_47788 ) ) ( not ( = ?auto_47787 ?auto_47789 ) ) ( not ( = ?auto_47788 ?auto_47789 ) ) ( ON ?auto_47787 ?auto_47788 ) ( ON ?auto_47786 ?auto_47787 ) ( ON ?auto_47785 ?auto_47786 ) ( ON ?auto_47784 ?auto_47785 ) ( ON ?auto_47783 ?auto_47784 ) ( ON ?auto_47782 ?auto_47783 ) ( ON ?auto_47781 ?auto_47782 ) ( CLEAR ?auto_47781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47781 )
      ( MAKE-8PILE ?auto_47781 ?auto_47782 ?auto_47783 ?auto_47784 ?auto_47785 ?auto_47786 ?auto_47787 ?auto_47788 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_47798 - BLOCK
      ?auto_47799 - BLOCK
      ?auto_47800 - BLOCK
      ?auto_47801 - BLOCK
      ?auto_47802 - BLOCK
      ?auto_47803 - BLOCK
      ?auto_47804 - BLOCK
      ?auto_47805 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47805 ) ( not ( = ?auto_47798 ?auto_47799 ) ) ( not ( = ?auto_47798 ?auto_47800 ) ) ( not ( = ?auto_47798 ?auto_47801 ) ) ( not ( = ?auto_47798 ?auto_47802 ) ) ( not ( = ?auto_47798 ?auto_47803 ) ) ( not ( = ?auto_47798 ?auto_47804 ) ) ( not ( = ?auto_47798 ?auto_47805 ) ) ( not ( = ?auto_47799 ?auto_47800 ) ) ( not ( = ?auto_47799 ?auto_47801 ) ) ( not ( = ?auto_47799 ?auto_47802 ) ) ( not ( = ?auto_47799 ?auto_47803 ) ) ( not ( = ?auto_47799 ?auto_47804 ) ) ( not ( = ?auto_47799 ?auto_47805 ) ) ( not ( = ?auto_47800 ?auto_47801 ) ) ( not ( = ?auto_47800 ?auto_47802 ) ) ( not ( = ?auto_47800 ?auto_47803 ) ) ( not ( = ?auto_47800 ?auto_47804 ) ) ( not ( = ?auto_47800 ?auto_47805 ) ) ( not ( = ?auto_47801 ?auto_47802 ) ) ( not ( = ?auto_47801 ?auto_47803 ) ) ( not ( = ?auto_47801 ?auto_47804 ) ) ( not ( = ?auto_47801 ?auto_47805 ) ) ( not ( = ?auto_47802 ?auto_47803 ) ) ( not ( = ?auto_47802 ?auto_47804 ) ) ( not ( = ?auto_47802 ?auto_47805 ) ) ( not ( = ?auto_47803 ?auto_47804 ) ) ( not ( = ?auto_47803 ?auto_47805 ) ) ( not ( = ?auto_47804 ?auto_47805 ) ) ( ON ?auto_47804 ?auto_47805 ) ( ON ?auto_47803 ?auto_47804 ) ( ON ?auto_47802 ?auto_47803 ) ( ON ?auto_47801 ?auto_47802 ) ( ON ?auto_47800 ?auto_47801 ) ( ON ?auto_47799 ?auto_47800 ) ( ON ?auto_47798 ?auto_47799 ) ( CLEAR ?auto_47798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47798 )
      ( MAKE-8PILE ?auto_47798 ?auto_47799 ?auto_47800 ?auto_47801 ?auto_47802 ?auto_47803 ?auto_47804 ?auto_47805 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_47814 - BLOCK
      ?auto_47815 - BLOCK
      ?auto_47816 - BLOCK
      ?auto_47817 - BLOCK
      ?auto_47818 - BLOCK
      ?auto_47819 - BLOCK
      ?auto_47820 - BLOCK
      ?auto_47821 - BLOCK
    )
    :vars
    (
      ?auto_47822 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47814 ?auto_47815 ) ) ( not ( = ?auto_47814 ?auto_47816 ) ) ( not ( = ?auto_47814 ?auto_47817 ) ) ( not ( = ?auto_47814 ?auto_47818 ) ) ( not ( = ?auto_47814 ?auto_47819 ) ) ( not ( = ?auto_47814 ?auto_47820 ) ) ( not ( = ?auto_47814 ?auto_47821 ) ) ( not ( = ?auto_47815 ?auto_47816 ) ) ( not ( = ?auto_47815 ?auto_47817 ) ) ( not ( = ?auto_47815 ?auto_47818 ) ) ( not ( = ?auto_47815 ?auto_47819 ) ) ( not ( = ?auto_47815 ?auto_47820 ) ) ( not ( = ?auto_47815 ?auto_47821 ) ) ( not ( = ?auto_47816 ?auto_47817 ) ) ( not ( = ?auto_47816 ?auto_47818 ) ) ( not ( = ?auto_47816 ?auto_47819 ) ) ( not ( = ?auto_47816 ?auto_47820 ) ) ( not ( = ?auto_47816 ?auto_47821 ) ) ( not ( = ?auto_47817 ?auto_47818 ) ) ( not ( = ?auto_47817 ?auto_47819 ) ) ( not ( = ?auto_47817 ?auto_47820 ) ) ( not ( = ?auto_47817 ?auto_47821 ) ) ( not ( = ?auto_47818 ?auto_47819 ) ) ( not ( = ?auto_47818 ?auto_47820 ) ) ( not ( = ?auto_47818 ?auto_47821 ) ) ( not ( = ?auto_47819 ?auto_47820 ) ) ( not ( = ?auto_47819 ?auto_47821 ) ) ( not ( = ?auto_47820 ?auto_47821 ) ) ( ON ?auto_47814 ?auto_47822 ) ( not ( = ?auto_47821 ?auto_47822 ) ) ( not ( = ?auto_47820 ?auto_47822 ) ) ( not ( = ?auto_47819 ?auto_47822 ) ) ( not ( = ?auto_47818 ?auto_47822 ) ) ( not ( = ?auto_47817 ?auto_47822 ) ) ( not ( = ?auto_47816 ?auto_47822 ) ) ( not ( = ?auto_47815 ?auto_47822 ) ) ( not ( = ?auto_47814 ?auto_47822 ) ) ( ON ?auto_47815 ?auto_47814 ) ( ON ?auto_47816 ?auto_47815 ) ( ON ?auto_47817 ?auto_47816 ) ( ON ?auto_47818 ?auto_47817 ) ( ON ?auto_47819 ?auto_47818 ) ( ON ?auto_47820 ?auto_47819 ) ( ON ?auto_47821 ?auto_47820 ) ( CLEAR ?auto_47821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_47821 ?auto_47820 ?auto_47819 ?auto_47818 ?auto_47817 ?auto_47816 ?auto_47815 ?auto_47814 )
      ( MAKE-8PILE ?auto_47814 ?auto_47815 ?auto_47816 ?auto_47817 ?auto_47818 ?auto_47819 ?auto_47820 ?auto_47821 ) )
  )

)

